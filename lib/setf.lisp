(in-package #:avm2-compiler)

;;; setf and related operators




(let ((*symbol-table* *cl-symbol-table*))
  ;; todo: shadow CL version of get-setf-expansion or something
  (defun %get-setf-expansion (place &optional environment)
    (declare (ignorable environment))
    (format t "get expansion for ~s~%" place)
    ;; fixme: implement environments
    (cond
      ;; symbols:
      ;;+  if bound, return form to set that var
      ;;+  if symbol macro, expand and recurse on expansion if any
      ((symbolp place)
       (format t "  symbol~%")
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
       (let ((binding (lexenv-get-function-binding (car place)))
             (expander (find-setf-expansion (car place))))
         (format t " cons ~s~%" binding)
         (cond
           ((eq (car binding) :macro)
            (%get-setf-expansion (funcall (cdr binding) (cdr place))))
           ((and (not binding) expander)
            (funcall expander place))
           (t (let ((vars (loop for i in (cdr place) collect (gensym "var")))
                    (args (cdr place))
                    (store (gensym "store")))
                (values vars args (list store)
                        `((setf ,(car place)) ,store ,@vars)
                        `(,(car place) ,@vars)))))))))

  (c3* (gensym)

    (defmacro define-setf-expander (access-fn lambda-list &body body)

      (format t "foo!~%")
      (add-setf-expansion
       access-fn
       (coerce (print `(lambda (form)
                         (destructuring-bind ,lambda-list (cdr form)
                      ,@body)))
               'function))
      `',access-fn)
    
    (define-setf-expander car (x)
      (let ((subform-temp (gensym "subform"))
            (store-temp (gensym "store")))
        (values (list subform-temp)
                (list x)
                (list store-temp)
                `(progn (rplaca ,subform-temp ,store-temp) ,store-temp)
                `(car ,subform-temp))))

    (define-setf-expander getf (place indicator &optional default &environment env)
      (let ((indicator-var (gensym "indicator"))
            (default-var (gensym "default"))
            (value-var (gensym "value")))
        (multiple-value-bind (vars vals store-vars writer-form reader-form)
            (%get-setf-expansion place env)
          (values (append vars (list indicator-var default-var))
                  (append vals (list indicator default))
                  (list value-var)
                  `(progn (loop for rest on ,reader-form by #'cddr
                             when (eq (car rest) ,indicator-var)
                             do (setf (cadr rest) ,value-var)
                             (return nil)
                             finally (let ((,(car store-vars)
                                            (list* ,indicator-var ,value-var ,reader-form)))
                                       ,writer-form))
                          ,value-var)
                  `(getf ,reader-form ,indicator-var ,default)))))

    (defmacro test-g-s-e (foo)
      (format t "->test-g-s-e : ~s-> ~s~%~%" foo (multiple-value-list (%get-setf-expansion foo)))
      nil)

    (test-g-s-e foo)
    (let ((foo 1))
      (test-g-s-e foo))
    (symbol-macrolet ((foo 1))
      (test-g-s-e foo))
    (test-g-s-e (foo bar))
    (flet ((foo2 (a) a))
     (test-g-s-e (foo2 bar)))
    (macrolet ((foo3 (a) `(hoge 'piyo ,a)))
     (test-g-s-e (foo3 bar)))
    (test-g-s-e (car foo))
    (test-g-s-e (getf (car foo) :baz :hoge))

    )
  nil)
