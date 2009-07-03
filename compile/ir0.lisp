(in-package :avm2-compiler)

;;; ir0: minimal compilation, alphatization, etc

;;; special forms
;;block
;;let*
;;return-from
;;catch
;;load-time-value
;;setq
;;eval-when
;;locally
;;symbol-macrolet
;;flet
;;macrolet
;;tagbody
;;function
;;multiple-value-call
;;the
;;go
;;multiple-value-prog1
;;throw
;;if
;;progn
;;unwind-protect
;;labels
;;progv
;;let
;;quote

(define-walker null-cl-walker ()
  ;; not completely transparent, since it expands some missing
  ;; optional/default values to be explicit, but we'd probably want
  ;; to do that at some point anyway
  ;; ex. (return-from foo) -> (return-from foo nil)
  ;;     (let (foo) ...) (let ((foo nil)) ...)
  :atoms ((t atom))
  :form-var whole
  :forms (((block name &rest forms) `(block ,name ,@(recur-all forms)))
          ((let (&rest bindings) &rest declarations-and-forms)
           `(let (,@(loop for binding in bindings
                          for var = (if (atom binding) binding (car binding))
                          for val = (if (atom binding) nil (second binding))
                          collect `(,(car binding) ,(recur (second binding)))))
              ,@declarations-and-forms))
          ((let* (&rest bindings) &rest declarations-and-forms)
           `(let* (,@(loop for binding in bindings
                           for var = (if (atom binding) binding (car binding))
                           for val = (if (atom binding) nil (second binding))
                           ;;; not completely transparent, since it
                           ;;; expands defaulted bindings to explicit
                           ;;; nil, but we'd probably want to do that
                           ;;; at some point anyway
                           collect `(,(car binding) ,(recur (second binding)))))
              ,@declarations-and-forms))
          ((return-from name &optional value)
           `(return-from ,name ,(recur value)))
          ((catch tag &rest forms)
           `(catch ,tag ,@(recur-all forms)))
          ((load-time-value form &optional read-only-p)
           ;; read-only-p isn't evaluated, so don't need to recur
           `(load-time-value ,(recur form) ,read-only-p))
          ((setq &rest pairs)
           ;;fixme: not sure if this should recur on the vars or not?
           `(setq ,@(loop for (var val) on pairs by #'cddr
                          collect (recur var)
                          collect (recur val))))
          ((eval-when (&rest when) &rest forms)
           `(eval-when ,when ,@(recur-all forms)))
          ((locally &rest declarations-and-forms)
           `(locally ,@(recur-all declarations-and-forms)))
          ((symbol-macrolet (&rest bindings) &rest declarations-and-forms)
           ;; do we need to recur on any of the bindings?
           `(symbol-macrolet ,bindings ,@(recur-all declarations-and-forms)))
          ((flet (&rest bindings) &rest declarations-and-forms)
           ;; fixme: probably need to do something with function bodies?
           `(flet ,bindings ,@(recur-all declarations-and-forms)))
          ((labels (&rest bindings) &rest declarations-and-forms)
           ;; fixme: probably need to do something with function bodies?
           `(labels ,bindings ,@(recur-all declarations-and-forms)))
          ((macrolet (&rest bindings) &rest declarations-and-forms)
           ;; fixme: probably need to do something with function bodies?
           `(macrolet ,bindings ,@(recur-all declarations-and-forms)))
          ((tagbody &rest forms)
           `(tagbody ,@(recur-all forms :test #'consp)))
          ((function name) `(function ,name))
          ((%local-function name) `(%local-function ,name))
          ((multiple-value-call function-form &rest forms)
           ;; fixme: is this right?
           `(multiple-value-call ,(recur function-form) ,@(recur-all forms)))
          ((the value-type form)
           `(the ,value-type ,(recur form)))
          ((go tag)
           `(go ,tag))
          ((multiple-value-prog1 first-form &rest forms)
           `(multiple-value-prog1 ,(recur first-form) ,@(recur-all forms)))
          ((throw tag result-form)
           `(throw ,tag ,(recur result-form)))
          ((if a b c) `(if ,(recur a) ,(recur b) ,(recur c)))
          ((progn &body body)
           `(progn ,@(recur-all body)))
          ((unwind-protect protected-form &rest cleanup-forms)
           `(unwind-protect
                 ,(recur protected-form)
              ,@(recur-all cleanup-forms)))
          ((progv symbols values &rest forms)
           `(progv
                (,@(recur-all symbols))
                (,@(recur-all values))
              ,@(recur-all forms)))
          ((quote form) `(quote ,form))

          ;; hack to simplify handling of places where declarations are allowed
          ;; fixme: add a declaration validation pass or something
          ((declare &rest declarations)
           `(declare ,declarations))

          ;; we wrap top level in a %compilation-unit, so we have somewhere
          ;; to collect lambda bodies in later passes
          ((%compilation-unit &rest lambdas)
           `(%compilation-unit ,@(recur-all lambdas)))

          ((%asm &rest forms)
           `(%asm ,@(loop for i in forms
                          when (eq (car i) :@)
                          collect `(:@ ,(recur (second i)) ,@(cddr i))
                          else collect i)))

          ;; anything else, evaluate all args
          (t
           `(,(car whole) ,@(recur-all (cdr whole))))))

(defun lambda-list-vars (llist)
  (loop for i in llist
        when (member i '(&optional &key &rest &arest &aux &allow-other-keys))
          do (error "lambda-list keywords not supported yet, got ~s" i))
  llist)
(defun alphatize-lambda-list (lambda-list alphatized-names)
  ;; fixme: probably will need a version that handles destructuring at some point, possibly should parse lambda list enough to only substitue in valid llists?
  (loop for i in lambda-list
        for alpha = (assoc i alphatized-names)
        ;; normal var or keyword, replace with alphatized version if any
        when alpha collect (cadr alpha)
        ;; defaulted vars
        else when (consp i)
        collect (cons
                 ;; var name, possibly with explicit keyword (not alphatized)
                 (if (consp (car i))
                     (list (caar i)
                           (or (cdr (assoc (cadar i) alphatized-names))
                               (cadar i)))
                     (or (cadr (assoc (car i) alphatized-names))
                         (car i)))
                 ;; default and supplied-p var
                 (if (= 1 (length (cdr i)))
                     (cdr i) ;; no supplied var
                     (list (second i)
                           (or (cadr (assoc (third i) alphatized-names))
                               (third i)))))
        else collect i))
;;(alphatize-lambda-list '(v1 &optional v2 (v3 3) (v4 4 v4p) ((v5k v5) 5 v5p)) '((v1 . v1a) (v2 . v2a) (v3 . v3a) (v4 . v4a) (v4p . v4pa) (v5 . v5a) (v5p . v5pa) (v5k . v5ka)))

;;;; minimal compilation pass:
;;; expand macros, compiler macros, macrolets, ?
;;; (symbol-macros? need to convert setq -> setf at same time if so)
;;; also:
;;    quote literals
;;    expand local/param refs to (%local-ref ...)
;;    alphatization:
;;      alphatize local vars/args/functions, go tags, block names, etc
;;      convert let/let* to %bind, with bindings evaluated in order, and
;;      scoping determined by alphatization
;;;cleanup: might be simpler to just do the environment as a few specials
;;         instead of using the existing code, but not worth reimplementing
;;         until stuff stabilizes
(define-walker ir0-minimal-compilation-etc null-cl-walker
  :atoms (((or number string simple-vector bit-vector (eql t) (eql nil))
           `(quote ,atom))
          (symbol (let ((binding (lexenv-get-variable-binding atom))
                        (constant-binding (find-swf-constant atom)))
                    (cond
                      ((keywordp atom) `(quote ,atom))
                      ((and (consp binding) (eq (car binding) :macro))
                       (recur (cdr binding)))
                      ((and (consp binding) (eq (car binding) :local))
                       `(%local-ref ,(cdr binding)))
                      ((and (consp binding) (eq (car binding) :closed))
                       (error "got closed variable in ir0-minimal-compilation? ~s" atom))
                      (constant-binding
                       `(%lex-ref ,(first constant-binding)
                                  ,(second constant-binding)))
                      (t (error "unknown local in ir0-minimal-compilation? ~s" atom))))))
  :form-var whole
  :forms
  (((let (&rest bindings) &rest declarations-and-forms)
    (multiple-value-bind (bindings-names bindings-values)
        (loop for binding in bindings
              for name = (if (atom binding) binding (car binding))
              for init = (if (atom binding) nil (second binding))
              collect name into names
              collect (recur init) into values
              finally (return (values (alphatize-var-names names) values)))
      `(%bind ,(mapcar 'second bindings-names) ,bindings-values
              (,(with-local-vars bindings-names
                                 (recur `(progn ,@declarations-and-forms)))))))
   ((let* (&rest bindings) &rest declarations-and-forms)
    (let* ((bindings-names nil)
           (bindings-values nil))
      ;;fixme: this is a bit ugly to avoid depending on guts of env stuff
      ;; should probably rewrite it...
      (loop  for binding in bindings
            for name = (if (atom binding) binding (car binding))
            for init = (if (atom binding) nil (second binding))
            do (push (list name (alpha-convert-name name)) bindings-names)
            do (push (with-local-vars bindings-names
                       (recur init))
                     bindings-values)
            finally (progn
                      (setf bindings-names (nreverse bindings-names))
                      (setf bindings-values (nreverse bindings-values))))
      `(%bind ,(mapcar 'second bindings-names) ,bindings-values
              (,(with-local-vars bindings-names
                                 (recur `(progn ,@declarations-and-forms)))))))

   ((symbol-macrolet (&rest bindings) &rest declarations-and-forms)
    ;; fixme: don't bind over constants or specials
    (with-symbol-macros bindings
      `(progn ,@(recur-all declarations-and-forms))))
                                        ;--------------------
                                        ;alpha convert arg names ....
                                        ;implement labels to match flet...

   ;;fixme: extract the duplicated lambda processing code from flet/labels/function
   ((flet (&rest flets) &rest declarations-and-forms)
    (let ((names (loop for i in flets
                       collect (list (car i)
                                     (alpha-convert-name (car i)))))
          (lambdas
           (loop for (n _ll . body) in flets
                 for ll = (cons 'this _ll)
                 for args = (alphatize-var-names (lambda-list-vars ll))
                 collect `(,(alphatize-lambda-list ll args)
                            ,(with-local-vars args
                                              (recur `(block ,n ,@body)))))))
      ;; we only need the flet to delimit the lexical scope,
      ;; so alpha convert and get rid of it completely...
      `(progn
         ,@(loop for (nil label) in names
                 for lambda in lambdas
                 collect `(%named-lambda ,label () ,@lambda))
         ,@(with-local-functions names
                                 (recur-all declarations-and-forms)))))

   ((labels (&rest flets) &rest declarations-and-forms)
    (let ((names (loop for i in flets
                       collect (list (car i)
                                     (alpha-convert-name (car i))))))
      (with-local-functions names
        (let ((lambdas
               (loop for (n _ll . body) in flets
                     for ll = (cons 'this _ll)
                     for args = (alphatize-var-names (lambda-list-vars ll))
                     collect `(,(alphatize-lambda-list ll args)
                                ,(with-local-vars args
                                                  (recur `(block ,n ,@body)))))))
          ;; we only need the LABELS to delimit the lexical scope,
          ;; so alpha convert and get rid of it completely...
          `(progn
             ,@(loop for (nil label) in names
                     for lambda in lambdas
                     collect `(%named-lambda ,label () ,@lambda))
             ,@(recur-all declarations-and-forms))))))


   ((macrolet (&rest bindings) &rest declarations-and-forms)
    (with-local-macros
        (loop for (name lambda-list . body) in bindings
              collect (list name
                            (coerce
                             `(lambda (rest)
                                (destructuring-bind ,lambda-list
                                    rest
                                  (block ,name ,@body)))
                             'function)))
      (recur `(progn ,@declarations-and-forms))))

   ((function name)
    (if (and (consp name) (eq (car name) 'lambda))
        (let* ((temp-name (gensym "LAMBDA-"))
               (lambda-list (cons 'this (second name)))
               (args (alphatize-var-names (lambda-list-vars lambda-list)))
               (body (cddr name)))
          `(progn
             (%named-lambda
              ,temp-name
              () ;; flags
              ,(alphatize-lambda-list lambda-list args)
              ,(with-local-vars args
                                (recur `(progn ,@body))))
             (%local-function ,temp-name)))
        (let ((binding (lexenv-get-function-binding name)))
          (cond
            ((and (symbolp name) (special-operator-p name))
             (error "calling FUNCTION on special operator: ~s" name))
            ((and (consp binding) (eq (car binding) :macro))
             (error "calling FUNCTION on macrolet: ~s" name))
            ((and (consp binding) (eq (car binding) :function))
             `(function ,(second binding)))
            ;; todo: global macros
            ((and (consp name) (eq (car name) 'setf))
             (error "don't know how to call FUNCTION on global setf functions yet: ~s" name))
            (t `(function ,name))))))

   ((setq &rest pairs)
    ;;fixme: don't generate extra progn if only 1 pair?
    `(progn
       ,@(loop for (var val) on pairs by #'cddr
               for binding = (lexenv-get-variable-binding var)
               collect (cond
                         ((and (consp binding) (eq (car binding) :macro))
                          (recur `(setf ,(cdr binding) ,val)))
                         ((and (consp binding) (eq (car binding) :local))
                          `(%local-set ,(cdr binding) ,(recur val)))
                         (t (error "don't know how to setq ~s yet ..." var)))
               )))


   ((tagbody &rest body)
    (let ((tags (remove-if-not #'atom body)))
      (with-tags tags
        `(tagbody ,@(loop for i in body
                          when (consp i)
                          collect (recur i)
                          else
                          collect (cdr (get-tag i)))))))

   ((go tag)
    (let ((real-tag (get-tag tag)))
      (assert real-tag (tag) "GO tag not found ~s" tag)
      `(go ,(cdr real-tag))))

   ;; temporary hack 'til we have a real macro to expand it...
   ((lambda (&rest args) &rest body)
    (recur `(function ,whole)))
   ((%named-lambda name flags args &rest body)
    (let* ((this (or (getf flags :this-arg) 'this))
           (args (cons this args))
           (a-args (alphatize-var-names (lambda-list-vars args))))
      `(%named-lambda ,name
                      ,flags
                      ,(alphatize-lambda-list args a-args)
                      ,(with-local-vars a-args
                                        (recur `(progn ,@body))))))



   ((%local-ref name)
    (let ((binding (lexenv-get-variable-binding name)))
      `(%local-ref ,(or (cdr binding) (error "unknown local ~s" name)))))
   ((%lex-ref object name)
    `(%lex-ref ,object ,name))

   ((%local-set name value)
    (let ((binding (lexenv-get-variable-binding name)))
      `(%local-set ,(or (cdr binding) (error "unknown local ~s" name))
                   ,(recur value))))

   ((block name &rest forms)
    (let ((tag (cons name (alpha-convert-name name))))
      (with-block-tag tag
        `(block ,(cdr tag) ,@(recur-all forms)))))
   ((return-from name &optional value)
    (let ((block (get-block name)))
      (unless block (error "RETURN-FROM unknown block ~s" name))
      `(return-from ,block ,(recur value))))


   ((catch tag &rest forms)
    `(catch ,(recur tag) ,@(recur-all forms)))
   ((throw tag result)
      `(throw ,(recur tag) ,(recur result)))

   ((%normal-call op &rest args)
    `(%normal-call ,op ,@(recur-all args)))
   ((%local-call op &rest args)
    `(%local-call ,op ,@(recur-all args)))
   ((%setf-call op &rest args)
    `(%setf-call ,op ,@(recur-all args)))

   ((%compilation-unit &rest lambdas)
    `(%compilation-unit ,@(recur-all lambdas)))

  ((%asm &rest forms)
   (setf whole (mapcar (lambda (x)
                         (if (and (consp x) (eq (car x) :@kill))
                             `(:@kill ,(cdr (lexenv-get-variable-binding (second x))))
                             x))
                       whole))
    (super whole))

   ;; expand macros,macrolets
   (t
    (destructuring-bind (operator &rest args) whole
      (let ((binding (lexenv-get-function-binding operator))
            (cmacro (find-swf-cmacro-function operator))
            (macro (find-swf-macro-function operator))
            (temp))
        (cond
          ((and (symbolp operator) (special-operator-p operator))
           (super whole))
          ;; expand local macros
          ((and (consp binding) (eq (car binding) :macro))
           (recur (funcall (cdr binding) args)))
          ;; mark local function calls
          ((and (consp binding) (eq (car binding) :function))
           `(%local-call ,(second binding) ,@(recur-all args)))
          ;; compiler macros
          ;; fixme: add an environment param to compile-macro expansion
          ((and cmacro (not (eq (setf temp (funcall cmacro whole nil))
                                whole))
                (recur temp)))
          ;; normal macros
          ;; fixme: add an environment param to macroexpansion
          (macro
           ;;(format t "expanding macro ~s~%" whole)
           ;;(format t "-> ~s~%" (funcall macro whole nil))
           (recur (funcall macro whole nil)))

          ;; todo: known functions (cl:foo, etc)
          ;; special case SETF until macro can handle it...
          ((member operator '(setf %setf))
           ;;(format t "handling special cased setf ~s~%" whole)
           (if (> (length args) 2)
               (recur `(progn ,@(loop for (var val) on args by #'cddr
                                      collect `(setf ,var ,val))))
               (if (consp (car args))
                   (let* ((sym  `(setf ,(caar args)))
                          (setf-fun (lexenv-get-function-binding sym)))
                     (if setf-fun
                         `(%local-call ,(second setf-fun)
                                      ,(recur (second args))
                                       ,@(recur-all (cdar args)))
                         `(%setf-call ,(caar args)
                                      ,(recur (second args))
                                      ,@(recur-all (cdar args)))))
                   (recur `(setq ,@args)))))
          ;; wrap anything else in %normal-call
          (t `(%normal-call ,operator ,@(recur-all args)))))))))
