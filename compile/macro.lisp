(in-package :avm2-compiler)

;;; swf-defmacro etc.


;; old macro -> special form hack
#+nil(defmacro swf-defmacro (name (&rest args) &body body)
  `(defmethod scompile-cons ((car (eql ',name)) cdr)
     (destructuring-bind (,@args) cdr
       (scompile
        (progn ,@body)))))


(defmacro %defmacro (name (&rest args) &body body)
  (let ((form (gensym "%defmacro-form"))
        (environment (gensym "%defmacro-env")))
    `(add-swf-macro-function
      ',name
      (lambda (,form ,environment)
        (declare (ignore ,environment))
        (destructuring-bind ,args (cdr ,form)
          ,@body)))))


