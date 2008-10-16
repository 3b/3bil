(in-package :as3-compiler)

;;;; defun and similar

(defun %swf-defun (name args body &key method constructor)
  (let* ((*current-lambda* (make-lambda-context args)))
    (pushnew
     ;; function data:
     ;;  swf name in format suitable for passing to asm (string/'(qname...))
     ;;  args to as3-method:
     ;;    name id?
     ;;    list of arg types (probably all T/* for now)
     ;;    return type
     ;;    flags
     ;;    list of assembly
     ;;    ?
     (list
      (symbol-to-qname-list name)
      0 ;; name in method struct?
      (loop for i in args collect 0) ;; arg types, 0 = t/*/any
      0 0 ;; return type = any, flags = 0
      (append ;; assembly
       (if (or method constructor)
           '((:get-local-0)
             (:push-scope))
           nil)
       (if constructor
           '((:get-local-0)
             (:construct-super 0))
           nil)
       (if constructor
           `(,@(scompile `(progn ,@body))
               ;;(pop)
               (:return-void))
           (scompile `(return (progn ,@body))))))
     (gethash name (functions *symbol-table*) (list))
     :test 'equal
     :key 'car)))

(find-swf-function 'random)

(defun old-%swf-defun (name args body &key method constructor)
  (if (symbolp name)
      (setf name (symbol-to-qname name))
      (setf name (as3-asm::qname "" name)))
  (let* ((*current-lambda* (make-lambda-context args))
         (mid
          (as3-asm::as3-method 0
                      (loop for i in args collect 0 ) ;; 0 = * (any type)
                      0 0
                      :body
                      (assemble-method-body
                       (append
                        (if (or method constructor)
                            '((:get-local-0)
                              (:push-scope))
                            nil)
                        (if constructor
                            '((:get-local-0)
                              (:construct-super 0))
                            nil)
                        (if constructor
                            `(,@(scompile `(progn ,@body))
                                ;;(pop)
                                (:return-void))
                            (scompile `(return (progn ,@body)))))))))
    (unless constructor
      (push (list name mid) (function-names *compiler-context*)))
    mid))

(defmacro swf-defun (name (&rest args) &body body)
  `(%swf-defun ',name ',args (list
                            ,@(loop for i in body
                                 if (and (consp i) (eql (car i) 'cl))
                                 collect (cadr i)
                                 else
                                 collect (list 'quote i)))))

(defmacro swf-constructor (name (&rest args) &body body)
  `(%swf-defun ',name ',args (list
                            ,@(loop for i in body
                                 if (and (consp i) (eql (car i) 'cl))
                                 collect (cadr i)
                                 else
                                 collect (list 'quote i)))
               :constructor t))

(defmacro swf-defmemfun (name (&rest args) &body body)
  `(%swf-defun ',name ',args (list
                            ,@(loop for i in body
                                 if (and (consp i) (eql (car i) 'cl))
                                 collect (cadr i)
                                 else
                                 collect (list 'quote i)))
               :method t))

(defmacro define-swf-class (name super (&rest options) &body members)

)


(defmacro swf-defmacro (name (&rest args) &body body)
  `(defmethod scompile-cons ((car (eql ',name)) cdr)
     (destructuring-bind (,@args) cdr
       (scompile
        ,@body))))
