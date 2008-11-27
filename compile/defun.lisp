(in-package :avm2-compiler)

;;;; defun and similar

(defun %compile-defun (args body method constructor &key (nil-block t))
  (with-lambda-context (:args args :blocks (when nil-block (list nil)))
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
         (scompile `(return (progn ,@body))))
     (compile-lambda-context-cleanup))))

(defun %swf-defun (name args body &key method constructor)
  ;; was pushnew, but that makes it hard to work on code (since can't
  ;; redefine things) push isn't quite right either, should replace
  ;; existing value or something
  ;; (or more likely, just not have a list at all?)
  (flet ((parse-arglist (args)
           ;; fixme: add error checking, better lambda list parsing
           (loop with rest = nil
              with optional = nil
              for i in args
              when (eq i '&rest)
              do
                (setf rest t)
                (setf i nil)
                (setf optional nil)
              when (eq i '&optional)
              do
                (setf optional t)
                (setf i nil)
              when (and i (not rest))
              count 1 into count
              when i
              collect i into arg-names
              and when optional
              collect i into optional-names
              finally (return (values arg-names count rest optional-names)))))
    (multiple-value-bind (names count rest-p optionals)
        (parse-arglist args)
      (declare (ignorable optionals))
      (when optionals (error "&optional args not supported yet"))
      (push
       ;; function data:
       ;;  swf name in format suitable for passing to asm (string/'(qname...))
       ;;  args to avm2-method:
       ;;    name id?
       ;;    list of arg types (probably all T/* for now)
       ;;    return type
       ;;    flags
       ;;    list of assembly
       ;;    ?
       (list
        (avm2-asm::symbol-to-qname-list name)
        0                              ;; name in method struct?
        (loop repeat count collect 0)  ;; arg types, 0 = t/*/any
        0                              ;; return type, 0 = any
        (if rest-p #x04 0)             ;; flags, #x04 = &rest
        (%compile-defun names body method constructor))
       (gethash name (functions *symbol-table*) (list))
       ;;:test 'equal
       ;;:key 'car
       ))))

;;(format t "~{~s~%~}" (sixth (find-swf-function 'floor)))
;;(format t "~{~s~%~}" (avm2-asm::avm2-disassemble (avm2-asm:assemble (sixth (find-swf-function 'random)))))

(defun old-%swf-defun (name args body &key method constructor)
  (when (symbolp name)
    (setf name (avm2-asm::symbol-to-qname name)))
  (with-lambda-context (:args args)
    (let* ((mid
            (avm2-asm::avm2-method 0
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
      mid)))

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
        (progn ,@body)))))


(defmacro dump-defun-asm (args &body body)
  "debugging function to compile a defun to asm, and print results"
  (let ((asm (gensym)))
    `(let ((,asm (%compile-defun
                  ',args
                  ',body
                  nil nil)))
       (format t "~%~{~s~%~}" ,asm)
       ,asm)))