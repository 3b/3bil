(in-package #:avm2-compiler)

;; various not-quite-cl parts

(let ((*symbol-table* *cl-symbol-table*))

  ;; defmacro
  (add-swf-macro-function
   'defmacro
   (lambda (form environment)
     (declare (ignore environment))
     (destructuring-bind (name args &body body) (cdr form)
       (let ((bform (gensym))
             (benvironment (gensym)))
         (add-swf-macro-function
          name
          (coerce `(lambda (,bform ,benvironment)
                     (declare (ignore ,benvironment))
                     (destructuring-bind ,args (cdr ,bform)
                       ,@body)) 'function))))
     nil))

  (c3* :%%misc2

    (defmacro defclass-swf (class-name (&optional (superclass-name '%flash:object))
                            (&rest slot-specifiers)
                            &rest class-options)
      (let ((properties nil)
            (static-properties nil)
            (forms nil)
            (constructor-sym (gensym (format nil "~a-CTOR-" class-name)))
            (constructor (cdr (assoc :constructor class-options)))
            (super-args (cdr (assoc :super-args class-options))))
        (format t "slot-spec = ~s~%" slot-specifiers)
        ;; todo: class options
        ;;  (:swf-flags :sealed <bool> :final <bool> :interface <bool> ...?)
        ;;  :metaclass? :documentation :default-initargs?
        (map 'nil
             (lambda (spec)
               (destructuring-bind (name &key
                      ;; same? as cl
                      allocation
                      ;; similar to CL, but strict, and currently unused
                      type
                      ;; swf specific, define functions that are basically
                      ;;  (defun reader (object)
                      ;;    (slot-value object slot))
                      inline-reader inline-writer inline-accessor
                      ;; currently unsupported CL stuff
                      ;; reader writer accessor initarg initform
                      ;; unused, but might as well allow it
                      documentation) spec
                (declare (ignore type documentation))
                (format t "slot ~s = ~s ~s ~s ~s~%" name allocation inline-reader inline-writer inline-accessor)
                (unless (listp inline-reader)
                  (setf inline-reader (list inline-reader)))
                (unless (listp inline-writer)
                  (setf inline-writer (list inline-writer)))
                (unless (listp inline-accessor)
                  (setf inline-accessor (list inline-accessor)))
                (if (eq allocation :class)
                    (push name static-properties)
                    (push name properties))
                (loop
                   with obj = (gensym)
                   for i in inline-reader
                   do (push `(declaim (inline ,i)) forms)
                   do (push `(defun ,i (,obj) (slot-value ,obj ,name)) forms))
                (loop
                   with obj = (gensym)
                   with value = (gensym)
                   for i in inline-writer
                   do (push `(declaim (inline ,i)) forms)
                   do (push `(defun ,i (,obj ,value)
                               (setf (slot-value ,obj ,name) ,value)) forms))
                (loop
                   with obj = (gensym)
                   with value = (gensym)
                   for i in inline-accessor
                   do (push `(declaim (inline ,i)) forms)
                   do (push `(defun ,i (,obj) (slot-value ,obj ,name)) forms)
                   do (push `(declaim (inline (setf ,i))) forms)
                   do (push `(defun-setf ,i (,obj ,value)
                               (setf (slot-value ,obj ,name) ,value)) forms))))
             slot-specifiers)

        ;; fixme: this should use eval-when instead of doing things at
        ;; macroexpansion time, once that is supported
        (setf (gethash class-name (classes *symbol-table*))
              (add-swf-class
               class-name
               (avm2-asm::symbol-to-qname-list class-name)
               :ns "???" ;; fixme: what goes here?
               :extends superclass-name
               :properties properties
               :class-properties static-properties
               :functions nil       ;; to be added separately
               :class-functions nil ;; to be added separately
               ;; fixme: should we define a default constructor with
               ;; initform/initarg parsing, and optionally call out to
               ;; a user-defined constructor?
               :constructor (avm2-asm::intern-method-id constructor-sym)))
        (loop for p in properties
           do (add-swf-property p p))
        (loop for p in static-properties
           do (add-swf-class-property p p))
        ;(format t "constructor = ~%")
        (print `(progn
            (%named-lambda ,constructor-sym
                  (:no-auto-return t :no-auto-scope t :anonymous t)
                ,(car constructor)      ; lambda list
              (%asm
               (:get-local-0)
               (:push-scope)
               (:get-local-0)
               ,@(loop for i in super-args
                    collect `(:@ ,i))
               (:construct-super ,(length super-args))
               (:push-null))
              (block nil
                ,@(cdr constructor))
              (%asm (:return-void)))
            ,@(nreverse forms)))))

    ;; fixme: use new compiler (see :constructor option to defclass-swf)
    #+nil
    (defmacro swf-constructor (class lambda-list &body body)
      ;; fixme: use eval-when instead of doing things at macroexpansion
      (setf (constructor (find-swf-class class))
            (list lambda-list body))
      nil)


    (defmacro defmethod-swf (name ((spec-arg spec-type) &rest lambda-list)
                             &body body)
      `(%named-lambda ,name
             (:this-arg ,spec-arg :class-name ,spec-type)
           ,lambda-list
         (block ,name
           ,@body)))

    (defmacro declaim (&rest a)
      nil)
))

