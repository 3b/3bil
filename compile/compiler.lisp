(in-package :avm2-compiler)

;;;
(defclass compiler-context ()
  ((class-names :initform () :accessor class-names)
   (function-names :initform () :accessor function-names)
   (script-slots :initform () :accessor script-slots)
   ;;; not sure if this is right place for this yet, store any code
   ;;; that should be run at load time... (maybe should be a list of
   ;;; functions to call instead of literal code to embed in the script init?)
   (load-top-level :initform () :accessor load-top-level)
   ;;; for literals in the code, we compile a reference to a specific
   ;;; slot on a global object (or maybe array? not sure there is any
   ;;; benefit to having a specific class for it, aside from maybe
   ;;; being able to use teh class init to initialize it)
   ;;; on script init, we fill in the slots of the object/array with
   ;;; the desired values
   (literal-global :initform '|%%literals%%| :accessor literals-global-name)
   ;;; during compilation, we need to track the next unallocated index,
   ;;; and a mapping of values -> index + code to load the value
   (literals-index :initform 0 :accessor literals-index)
   (literals-hash :initform (make-hash-table :test 'equal) :accessor literals-hash)))

(defparameter *compiler-context* (make-instance 'compiler-context))


(defun coalesce-literal (value code)
  (let ((old (gethash value (literals-hash *compiler-context*))))
    (if old
        (progn
          (assert (equal code (second old)) nil "coalesced literals with differing initialization code?~%value ~s~%code ~s -> ~s" value (second old) code)
          (car old))
        (progn
          (setf (gethash value (literals-hash *compiler-context*))
                (list (literals-index *compiler-context*)
                      code))
          (1- (incf (literals-index *compiler-context*)))))))

;;; track data about a function level scope
;;;   (including lambda/flet/labels/defun)
;;; nested scopes should use with-nested-foo macros to temporarily expand
;;;  the namespaces
(defclass lambda-context ()
  ;; using an alist for local name-index mapping, so we can push/pop
  ;; state a bit more easily than with hash tables...
  ((locals :initform () :initarg locals :accessor locals)
   (tags :initform () :initarg tags :accessor tags)
   (blocks :initform () :initarg blocks :accessor blocks)
   ;; for local functions, and stuff like unwind protect that needs to
   ;; call a block of code from multiple places, we store a list of
   ;; those places, and implement the local return as setting a
   ;; specific register (allocated on first use) and a jump to a
   ;; :lookup-switch with all the possible continuations
   ;; ---- possibly this should be at assembler level? or defun or something?
   (continuations :initform () :initarg continuations :accessor continuations)
   (continuation-var :initform (gensym "CONTINUATION-VAR-") :accessor continuation-var)
   (local-return-var :initform (gensym "LOCAL-RETURN-VAR-") :accessor local-return-var)
   (%flets :initform nil :accessor %flets)
   (parent :initform nil :initarg parent :accessor parent)
   (name :initform nil :initarg name :accessor name)))

(defparameter *current-lambda* nil)

(defun make-lambda-context (&key args blocks tags (parent *current-lambda*)
                            name)
  (let* ((locals (cons (cons 'this 0)
                       (loop for i in args
                          for j from 1
                          collect (cons i j))))
         (lc (make-instance 'lambda-context
                            'locals locals
                            'blocks (copy-list blocks)
                            'tags (copy-list tags)
                            'parent parent
                            'name (or name "<unnamed lambda>"))))
    ;; bind a variable for storing local return continuation label stuff,
    ;; would be nicer to avoid allocating a local index unless needed,
    ;; but that would require tracking # of used indices separately from
    ;; length of locals list, so skipping for now
    (push (cons (continuation-var lc) (length (locals lc)))
          (locals lc))
    ;; flash is picky about stack being balanced around jumps, so
    ;; return in register too
    (push (cons (local-return-var lc) (length (locals lc)))
          (locals lc))
    lc))
;++
(defun get-lambda-local-index (name)
  (let ((i (cdr (assoc name (locals *current-lambda*)))))
    #+nil(or i (break "missing local index in g-l-l-i: ~a" name))
    i))

;;; %flet needs to remove variable names form scope without removing
;;;  the index, so we hide the names here...
;;; possibly would be better to track used indices separately from names
;;;  but still a bit of work to handle keeping indices used while
;;;  releasing names
#++
(defun kill-lambda-local-names (names)
  (loop for n in (if (listp names) names (list names))
     do (setf (car (assoc n (locals *current-lambda*)))
              (gensym)))
  nil)

#++
(defun get-lambda-block (name)
  (cdr (assoc name (blocks *current-lambda*))))

#+-
(defun get-lambda-tag (name)
  (cdr (assoc name (tags *current-lambda*))))

#+-
(defun get-lambda-local-continuation (label)
  (cdr (assoc label (continuations *current-lambda*))))

#+-
(defun add-lambda-local-continuation (label)
  (pushnew (cons label (length (continuations *current-lambda*)))
           (continuations *current-lambda*))
  (get-lambda-local-continuation label))

#+-
(defun get-lambda-cleanups (name)
  (loop for (n . block) in (blocks *current-lambda*)
     when (cleanup-label block)
     collect it
     until (eql n name)))

;++
(defmacro with-lambda-context ((&key args blocks tags name (parent *current-lambda*)) &body body)
  `(let* ((*current-lambda* (make-lambda-context
                             :args ,args
                             :blocks ,blocks
                             :tags ,tags
                             :name ,name
                             :parent ,parent)))
     ,@body))

#+-
(defmacro with-simple-lambda-context ((&rest args) &body body)
  `(let* ((*current-lambda* (make-lambda-context
                             :args ',args
                             :name "<unnamed lambda.>"
                             :parent *current-lambda*)))
     ,@body))

;;; not sure if this should be automatic or not, so putting here for now...
;++
(defun compile-lambda-context-cleanup ()
  "compile any code that should be after the body of the current
  lambda, (local functions, continuation table, etc)"
  (let ((bad-cont-label (gensym "BAD-CONTINUATION-")))
    (when (continuations *current-lambda*)
      `((:%label ,bad-cont-label)
        (:push-string "broken")
        (:throw)
        (:%dlabel ,(continuation-var *current-lambda*))
        (:get-local ,(get-lambda-local-index (continuation-var *current-lambda*)))
        (:convert-integer)
        (:lookup-switch ,bad-cont-label
                        ,(mapcar 'car (sort (copy-list (continuations *current-lambda*))
                                            #'< :key #'cdr)))
        ))))

#+nil(defmacro with-nested-lambda-context (&body body)
  ;;; fixme: add a param to specify new bindings, so caller doesn't need to
  ;;; know as much about *lambda-context* to add them by hand
  `(let ((*current-lambda* (make-nested-lambda-context *current-lambda*)))
     ,@body))
#+-
(defun last-local-index ()
  (length (locals *current-lambda*)))

#+_
(defclass lambda-block ()
  ((name :initarg :name :accessor name)
   (end-label :initarg :end-label :accessor end-label)
   (cleanup-label :initarg :cleanup-label :accessor cleanup-label)
   (return-var :initarg :return-var :accessor return-var)))

#+-
(defun make-lambda-block (name end cleanup var)
  (make-instance 'lambda-block :name name
                 :end-label end :cleanup-label cleanup
                 :return-var var))

;; fixme: generate these with a macro instead of copy-paste
;++
(defmacro with-local-vars ((bindings) &body body)
  (let ((old (gensym "OLD-VARS-")))
    `(let ((,old (locals *current-lambda*)))
       (setf (locals *current-lambda*)
             (append ,bindings (locals *current-lambda*)))
       (unwind-protect
            (progn
              ,@body)
         (setf (locals *current-lambda*) ,old)))))

#+-
(defmacro with-nested-lambda-block ((block var) &body body)
  (let ((old (gensym "OLD-BLOCKS-")))
    `(with-local-vars ((list (cons ,var (last-local-index))))
      (let ((,old (blocks *current-lambda*)))
        (push ,block (blocks *current-lambda*))
        (unwind-protect
             (progn
               ,@body)
          (setf (blocks *current-lambda*) ,old))))))

#+-
(defmacro with-cleanup ((name cleanup) &body body)
  (let* ((var (gensym "WITH-CLEANUP-END-"))
         (old (gensym "OLD-BLOCKS-"))
         (name-var (gensym "NAME-VAR-"))
         (block `(cons ,name-var (make-lambda-block ,name-var ',var
                                                ,cleanup
                                                ',var))))
    `(let ((,name-var ,name))
       (with-local-vars ((list (cons ',var (last-local-index))))
         (let ((,old (blocks *current-lambda*)))
           (push ,block (blocks *current-lambda*))
           (unwind-protect
                (progn
                  ,@body)
             (setf (blocks *current-lambda*) ,old)))))))

#+-
(defmacro with-nested-lambda-tags ((tags) &body body)
  (let ((old (gensym "OLD-TAGS-")))
    `(let ((,old (tags *current-lambda*)))
       (setf (tags *current-lambda*)
             (append ,tags (tags *current-lambda*)))
       (unwind-protect
            (progn
              ,@body)
         (setf (tags *current-lambda*) ,old)))))

;;; top level (internal?) compiler interface
;;; returns assembly corresponding to FORM
#+-
(defgeneric  scompile (form))

#+-
(defmethod scompile ((form string))
  `((:push-string ,form)
    (:coerce-any)))

#+-
(defmethod scompile ((form integer))
  ;; possibly should have more control than just assuming anything < 2^31
  ;; is int (as well as range checking, etc)
  (if (> form (expt 2 31))
      `((:push-uint ,form)
        (:coerce-any))
      `((:push-int ,form)
        (:coerce-any))))

#+-
(defmethod scompile ((form real))
  `((:push-double ,form)
    (:coerce-any)))


#+-
(defmethod scompile ((form simple-vector))
  `(,@(loop for i across form
         append (scompile i))
      (:new-array ,(length form))))

#+-
(defmethod %quote (object)
  ;; assuming anything without a special handler is self-evaluating for now
  (scompile object))

#+-
(defmethod %quote ((object cons))
  (scompile `(list ,@(loop for i in object
                        collect `(quote ,i)))))

#+-
(defmethod scompile ((form symbol))
  (let* ((i (get-lambda-local-index form))
        (constant (unless i (find-swf-constant form))))
    (cond
      (i `((:get-local ,i)))
      (constant `((:get-lex ,(first constant))
                  (:get-property ,(second constant))))
      ((keywordp form)
       (%quote form))
      (t (error "unknown local ~s?" form)))))

#+-
(defmacro define-constants (&body constants)
  `(progn
     ,@(loop for i in constants
          collect `(defmethod scompile ((form (eql ,(car i))))
                     '((,(second i))
                       (:coerce-any))))))
#+-
(define-constants
  (:true :push-true)
  (t :push-true)
  (:false :push-false)
  (:nan :push-nan)
  (:undefined :push-undefined)
  (:null :push-null)
  (nil :push-null))

;;; interface for implementing special forms

#+-
(defgeneric scompile-cons (car cdr))

#+-
(defmethod scompile ((form cons))
  (let* ((cmacro (find-swf-cmacro-function (car form)))
         (macro (find-swf-macro-function (car form)))
         (new-form (if cmacro (funcall cmacro form nil) form)))
    (if (eq form new-form)
        (if macro
            (scompile  (funcall macro form nil))
            (scompile-cons (car form) (cdr form)))
        (scompile new-form))))

#+-
(defmacro define-special (name (&rest args) &body body)
  "define a special operator, destructuring form into ARGS"
  (let ((car (gensym "CAR"))
        (cdr (gensym "CDR")))
    `(defmethod scompile-cons ((,car (eql ',name)) ,cdr)
       (destructuring-bind ,args ,cdr
         ,@body))))


#+-
(defmacro define-special* (name (cdr) &body body)
  "define a special operator without any destructuring"
  (let ((car (gensym "CAR")))
    `(defmethod scompile-cons ((,car (eql ',name)) ,cdr)
       ,@body)))

#||
(scompile "foo")
(scompile :true)
(scompile 123.45)
||#