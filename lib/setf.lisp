(in-package #:avm2-compiler)

;;; setf and related operators




(let ((*symbol-table* *cl-symbol-table*))
  ;; todo: shadow CL version of get-setf-expansion or something
  (defun %get-setf-expansion (place &optional environment)
    (declare (ignorable environment))
    #++(format t "get expansion for ~s~%" place)
    ;; fixme: implement environments
    (cond
      ;; symbols:
      ;;+  if bound, return form to set that var
      ;;+  if symbol macro, expand and recurse on expansion if any
      ((symbolp place)
       #++(format t "  symbol~%")
       (let ((binding (lexenv-get-variable-binding place)))
         (cond
           ((eq (car binding) :macro)
            (%get-setf-expansion (cdr binding)))
           (t (let ((n (gensym "new")))
                (values nil nil (list n) `(setq ,place ,n) place))))))

    ;; cons:
    ;;+   check for local functions in env
    ;;     return funcall #'(setf foo)
    ;;+   check for local macrolet
    ;;     expand and recurse
    ;;+   global setf expander
    ;;     look up/return setf expansion (inverse?)
    ;;   (special case some CL stuff?)
    ;;     values, the, apply, ?
    ;;+   return funcall #'(setf foo)
      ((consp place)
       (let* ((sym `(setf ,(car place)))
              (setf-fun (lexenv-get-function-binding sym))
              (binding (lexenv-get-function-binding (car place)))
              (expander (find-setf-expansion (car place)))
              (setf-accessor (find-swf-accessor (car place))))
         #++(format t " cons ~s s-f=~s b=~s e=~s sa=~s~%" place setf-fun
                 binding expander setf-accessor)
         (cond
           (setf-fun
            (let ((vars (loop for i in (cdr place) collect (gensym "var")))
                  (args (cdr place))
                  (store (gensym "store")))
              (values vars args (list store)
                      `(%setf (,(car place) ,@vars) ,store)
                      `(,(car place) ,@vars))))
           ((eq (car binding) :macro)
            (%get-setf-expansion (funcall (cdr binding) (cdr place))))
           ((and (not binding) expander)
            #++(format t " =~s~%" (multiple-value-list (funcall expander place)))
            (funcall expander place))
           (setf-accessor
            (let ((vars (loop for i in (cdr place) collect (gensym "var")))
                  (args (cdr place))
                  (store (gensym "store")))
              (values vars args (list store)
                      `(%setf (,(car place) ,@vars) ,store)
                      `(,(car place) ,@vars))))
           (t (let ((vars (loop for i in (cdr place) collect (gensym "var")))
                    (args (cdr place))
                    (store (gensym "store")))
                (values vars args (list store)
                        `((setf ,(car place)) ,store ,@vars)
                        `(,(car place) ,@vars)))))))
      (t (error "don't know how to get setf-expansion for ~s" place))))

  (c3* (gensym)

    (defmacro define-setf-expander (access-fn lambda-list &body body)
      (add-setf-expansion
       access-fn
       (coerce `(lambda (form)
                  (destructuring-bind ,lambda-list (cdr form)
                    ,@body))
               'function))
      `',access-fn)

    (defmacro %setq-1 (place value)
      (assert (symbolp place))
      (let ((binding (lexenv-get-variable-binding place)))
        (cond
          ((eq (car binding) :macro)
           (assert (not (eq place (cdr binding))))
           `(%setq-1 (cdr binding) value))
          (t
           `(%setf ,place ,value)))))

    (defmacro setq (&rest args)
      (loop for (var nil) on args by #'cddr
         unless (atom var)
         do (error "variable name is not a symbol in SETQ: ~s" var))
      `(progn
         ,@(loop for (var value) on args by #'cddr
              collect `(%setq-1 ,var ,value))))

    (defmacro %setf-1 (place value &environment env)
      (multiple-value-bind (vars vals store-vars writer-form reader-form)
          (%get-setf-expansion place env)
        (declare (ignore reader-form))
        #++(unless (consp place)
          (format t " write symbol ~s -> ~%~s" place
                  `(let* (,@(mapcar #'list vars vals)
                          (,(car store-vars) ,value))
                     ,writer-form)))
        `(let* (,@(mapcar #'list vars vals)
                ;; fixme: deal with multiple values here once that works
                (,(car store-vars) ,value))
           ,writer-form)
        #++`(%setf ,place ,value)))


    (defmacro setf (&rest args)
      `(progn
         ,@(loop for (var value) on args by #'cddr
              collect `(%setf-1 ,var ,value))))
    
    )
  nil)
