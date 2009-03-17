(in-package :avm2-compiler)

;;; some macros for making code walkers a bit more concise to write,
;;; so it will be cheaper to split things up into lots of passes
;;; while figuring things out...

(eval-when (:compile-toplevel :load-toplevel)
  (defun dsb-ll-vars (lambda-list)
    (loop for i in lambda-list
          when (and (atom i) (not (member i '(&rest &body &whole &optional &key &allow-other-keys))))
            collect i
          when (consp i)
            append (dsb-ll-vars i))))
;; (dsb-ll-vars '(a))
;; (dsb-ll-vars '(a (b c)))
;; (dsb-ll-vars '(a (b &rest c) &optional o))

(defmacro define-walker (name inherit &key atoms forms form-var)
  "define a code walker named NAME, optionally falling back to a
walker named by INHERIT on unrecognized forms/atoms.
:ATOMS param is a TYPECASE style list of forms for processing atoms,
   ATOM is bound to the current atom while evaluating body of forms
:FORMS param is list of ((symbol . args) . body) forms. when SYMBOL
  matches car of current form, args is used to destructure cdr,
  and body is evaluated with the scope of the binding of args
:FORM-VAR specifies a var to bind to the entire form while evaluating
  FORMS
the following functions are available to bodies of ATOMS and FORMS:
 (SUPER FORM) to pass evaluation to INHERIT for FORM
 (RECUR FORM) to evaluate a sub-form
 (RECUR-ALL FORM &key TEST) to evaluate elements of a list, optionally
    only evaluating elements for which TEST is true, keeping others as-is
  "
  ;;; fixme: possibly should use special vars instead of a param for
  ;;;  tracking the outer function?
  (let ((form (or form-var (gensym "FORM-")))
        (walker (gensym "WALKER-"))
        (has-default nil))
   `(defun ,name (,form &optional (,walker ',name))
      #+nil(format t "-->~s walking ~s~%" ',name ,form)
      (labels ((super (form)
                 ,(if inherit
                      `(,inherit form ,walker)
                      `(error "SUPER called but none available, form=~s" form)))
               (recur (form)
                 (funcall ,walker form))
               (recur-all (form &key test)
                 (mapcar (lambda (a)
                           (if (or (not test) (funcall test a)) (recur a) a))
                         form)))
        (declare (ignorable (function super)))
        (if (atom ,form)
            (let ((atom ,form))
              (typecase atom
                ,@atoms
                ,@(if inherit `((otherwise (,inherit ,form ,walker))))))
            (case (car ,form)
              ,@(loop for (match . body) in forms
                      when (and (atom match) (member match '(t otherwise)))
                        do (setf has-default t)
                        and collect `(,match ,@body)
                      else
                        collect `(,(car match)
                                 (destructuring-bind ,(cdr match) (cdr ,form)
                                   (declare (ignorable ,@(dsb-ll-vars (cdr match))))
                                   ,@body)))
              ,@(if has-default
                    ()
                    `((otherwise ,(if inherit
                                      `(,inherit ,form ,walker)
                                      `(error "unrecognized operator ~s in ~s"
                                              (car ,form) ',name)))))))))))

;;; base case identity transform walker for CL special forms, for use
;;; as fallback for special purpose walkers

(define-walker null-cl-walker ()
  ;;; todo: implement more cl special ops
  :atoms ((t atom))
  :forms (((quote form) `(quote ,form))
          ((if a b c) `(if ,(recur a) ,(recur b) ,(recur c)))
          ((progn &body body) `(progn ,@(recur-all body)))
          ((tagbody &rest forms) `(tagbody ,@(recur-all forms :test 'consp)))))






;;;; variant for walking structured trees, intended to probably
;;;; eventually be replaced by trees of structs/instances

;; fixme: this would probably work better if it could inherit param lists from the super or something, so the param list only needs to exist in 1 place for a set of passes using the same ir
(defmacro define-structured-walker (name inherit &key specials labels forms form-var)
  "define a code walker named NAME, optionally falling back to a
walker named by INHERIT on unrecognized forms.
:FORMS param is list of ((symbol . args) . body) forms. when SYMBOL
  matches car of current form, args is a list of symbols naming properties
  in cdr of current form, which will be bound to accessors with
  symbol-macrolet, and body is evaluated with the scope of the
  binding of args
  (note keys in plist must be non-keyword symbols for this to work, since
   we can't use symbol-macrolet on keywords.)
  intent is that once usage stabilizes, structs/classes can be defined,
  and accessors GETF accessors can be replaces with struct/class accessors
  to improve performance without code changes in the walkers
:FORM-VAR specifies a var to bind to the entire form while evaluating
  FORMS
:SPECIALS is a list of symbols to declare special within the body of the walker
  for temp variables, etc
:LABELS is a list of labels bindings
the following functions are available to bodies of ATOMS and FORMS:
 (SUPER FORM) to pass evaluation to INHERIT for FORM
 (RECUR FORM) to evaluate a sub-form
 (RECUR-ALL FORM &key TEST) to evaluate elements of a list, optionally
    only evaluating elements for which TEST is true, keeping others as-is
 (S-LET bindings &body body) is a shortcut for binding a variable and
   declaring it special
   ;;FIXME: might be better to just defvar the specials in a progn outside the generated function? (or declaim it special)
  "
  ;;; fixme: possibly should use special vars instead of a param for
  ;;;  tracking the outer function?
  (let ((form (or form-var (gensym "FORM-")))
        (walker (gensym "WALKER-")))
   `(defun ,name (,form &optional (,walker ',name))
      ,@(when specials `((declare (special ,@specials))))
      #+nil(format t "-->~s walking ~s~%" ',name ,form)
      (labels ((super (form)
                 ,(if inherit
                      `(,inherit form ,walker)
                      `(error "SUPER called but none available, form=~s" form)))
               (recur (form)
                 (funcall ,walker form))
               (recur-all (form &key test)
                 (mapcar (lambda (a)
                           (if (or (not test) (funcall test a)) (recur a) a))
                         form))
               ,@labels)
        (declare (ignorable (function super)))
        (macrolet ((s-let (bindings &body body)
                     `(let ,bindings
                        (declare (special ,@(loop for i in bindings
                                                  if (atom i)
                                                  collect i
                                                  else collect (car i))))
                        ,@body)))
          (if (atom ,form)
              (error "got atom ~s in structured-walker?" ,form)
              (case (car ,form)
                ,@(loop for (match . body) in forms
                        collect `(,(car match)
                                   (symbol-macrolet
                                       (,@(loop for i in (cdr match)
                                                collect `(,i (getf (cdr ,form) ',i))))
                                     (declare (ignorable ,@(cdr match)))
                                     ,@body)))
                (otherwise ,(if inherit
                                `(,inherit ,form ,walker)
                                `(error "unrecognized operator ~s in ~s"
                                        (car ,form) ',name))))))))))



#||
;;;; misc tests/samples

(define-walker null-walker ()
  ;; partial null walker for 
  :atoms ((t atom))
  :forms (((quote form) `(quote ,form))
          ((if a b c) `(if ,(recur a) ,(recur b) ,(recur c)))
          ((progn &body body) `(progn ,@(recur-all body)))
          ((tagbody &rest forms) `(tagbody ,@(recur-all forms :test 'consp)))
          ((%bind (names values) &body body)
           `(%bind (,names ,(recur-all values)) ,@(recur-all body)))
          ((%fbind (names values) &body body)
           `(%fbind (,names ,(recur-all values)) ,@(recur-all body)))
          ((%lambda lambda-list &body body)
           `(%lambda ,lambda-list ,(recur-all body)))))

;; (null-walker '1)
;; (null-walker ''1)
;; (null-walker '(if 1 2 3))
;; (null-walker '(if 1 (progn 2 3) 4))
(define-walker junk-walker null-walker
  :atoms ((number (- atom)))
  :forms (((if a b c) `(if ,(recur a) ,(recur c) ,(recur b))))
)
;; (junk-walker '1)
;; (junk-walker ''1)
;; (junk-walker '(if 1 2 3))
;; (junk-walker '(if 1 (progn 2 3) 4))
(defparameter *var-count* 0)
(define-walker count-vars null-walker
  :form-var form
  :forms (((%fbind (bindings vars) &body body) (declare (ignorable vars body))
           (incf *var-count* (length bindings))
           (super form))))
;;(let ((*var-count* 0)) (count-vars '1) *var-count*)
;;(let ((*var-count* 0)) (count-vars '(%fbind ((a b c) (1 2 3))123)) *var-count*)

(define-structured-walker foo-walker ()
  :specials (*foo*)
  :form-var whole
  :forms (((blah baz bar)
           (format t "blah : ~s - ~s~%" bar baz)
           (setf baz 123)
           (when bar (setf bar (recur bar)))
           whole)))

;; (foo-walker '(blah))
;; (foo-walker '(blah bar (blah)))
(define-structured-walker foo2-walker ()
  :specials (*foo*)
  :form-var whole
  :forms (((bleh bleh)
           (setf bleh *foo*)
           whole)
          ((blah baz bar)
           (s-let ((*foo* baz))
             (format t "blah : ~s - ~s~%" bar baz)
             (setf baz (or *foo* 123) )
             (when bar (setf bar (recur bar))))
           whole)))

;; (foo2-walker '(blah bar (blah baz 234 bar (bleh))))

||#