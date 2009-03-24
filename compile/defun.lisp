(in-package :avm2-compiler)

;;;; defun and similar

(defun %compile-defun (name args body method constructor &key (nil-block t) debug-filename debug-line-number)
  ;; fixme: rename method arg, since it applies to normal function stoo?
  ;; fixme: is the nil-block stuff still valid?
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
     (when debug-filename `((:debug-file ,debug-filename)))
     (when debug-line-number `((:debug-line ,debug-line-number)))
     (if constructor
         `(,@(scompile `(block ,name ,@body))
             ;;(pop)
             (:return-void))
         `(,@(scompile `(block ,name ,@body))
             (:return-value)))
     (compile-lambda-context-cleanup))))

(defun %swf-defun (name args body &key class-name method constructor debug-filename debug-line-number class-static)
  ;; was pushnew, but that makes it hard to work on code (since can't
  ;; redefine things) push isn't quite right either, should replace
  ;; existing value or something
  ;; (or more likely, just not have a list at all?)
  (flet ((parse-arglist (args)
           ;; fixme: add error checking, better lambda list parsing
           (loop with rest = nil
              with optional = nil
              for i in args
              when (eq i'&arest)
              do
                (setf rest i)
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
      (let* ((asm (%compile-defun name names body method constructor :debug-filename debug-filename :debug-line-number debug-line-number))
             (activation-p (find :new-activation asm :key 'car)))
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
          (if (symbolp name) (avm2-asm::symbol-to-qname-list name) name)
          0                            ;; name in method struct?
          (loop repeat count collect 0) ;; arg types, 0 = t/*/any
          0                             ;; return type, 0 = any
          (logior (if rest-p #x04 0)    ;; flags, #x04 = &rest
                  (if activation-p #x02 0))
          asm
          :class-name class-name
          :class-static class-static)
         (gethash (if class-name (list class-name name) name)
                  (functions *symbol-table*) (list))
         ;;:test 'equal
         ;;:key 'car
         )))))

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
                                 collect (list 'quote i)))
               :method t))

(defmacro swf-constructor (name (&rest args) &body body)
  `(%swf-defun ',name ',args (list
                            ,@(loop for i in body
                                 if (and (consp i) (eql (car i) 'cl))
                                 collect (cadr i)
                                 else
                                 collect (list 'quote i)))
               :constructor t))

;; fixme: remove this (replace with calls to swf-defun)
(defmacro swf-defmemfun (name (&rest args) &body body)
  `(%swf-defun ',name ',args (list
                            ,@(loop for i in body
                                 if (and (consp i) (eql (car i) 'cl))
                                 collect (cadr i)
                                 else
                                 collect (list 'quote i)))
               ;; *compile-file-pathname* tends to not be worth
               ;; storing, so not wasting space on it for now...
               ;;:filename ,(namestring *compile-file-pathname*)
               :method t))

(defmacro swf-defun-in-class (name class (&rest args) &body body)
  `(%swf-defun ',name ',args (list
                            ,@(loop for i in body
                                 if (and (consp i) (eql (car i) 'cl))
                                 collect (cadr i)
                                 else
                                 collect (list 'quote i)))
               ;; *compile-file-pathname* tends to not be worth
               ;; storing, so not wasting space on it for now...
               ;;:filename ,(namestring *compile-file-pathname*)
               :method t
               :class-name ',class))

(defmacro swf-defun-in-class-static (name class (&rest args) &body body)
  `(%swf-defun ',name ',args (list
                            ,@(loop for i in body
                                 if (and (consp i) (eql (car i) 'cl))
                                 collect (cadr i)
                                 else
                                 collect (list 'quote i)))
               ;; *compile-file-pathname* tends to not be worth
               ;; storing, so not wasting space on it for now...
               ;;:filename ,(namestring *compile-file-pathname*)
               :method t
               :class-name ',class
               :class-static t))

(defmacro dump-defun-asm (args &body body)
  "debugging function to compile a defun to asm, and print results"
  (let ((asm (gensym)))
    `(let ((,asm (%compile-defun 'foo
                  ',args
                  ',body
                  nil nil)))
       (format t "~%~{~s~%~}" ,asm)
       ,asm)))