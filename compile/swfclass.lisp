(in-package :avm2-compiler)

;;;; code for defining vm level classes

(defmacro def-swf-class (name ns super (&rest properties) ((&rest constructor-args) &body constructor))
  `(progn
     (setf (gethash ',name (classes *symbol-table*))
          (add-swf-class
           ',name
           ',(avm2-asm::symbol-to-qname-list name)
           :ns ,ns
           :extends ',super
           :properties ',properties
           :class-properties nil ;; todo: add interface for this?
           :functions nil ;; to be added later
           :class-functions nil ;; to be added later
           :constructor (list ',constructor-args ',constructor)))
     ,@(loop for p in properties
          collect `(add-swf-property ',p ',p))))


(defmacro def-swf-class* (name ns super (&rest properties) ((&rest constructor-args)  &body constructor))
  `(progn
     (setf (gethash ',name (classes *symbol-table*))
          (add-swf-class
           ',name
           ',(avm2-asm::symbol-to-qname-list name)
           :ns ,ns
           :extends ',super
           :properties ',properties
           :class-properties nil ;; todo: add interface for this?
           :functions nil ;; to be added later
           :class-functions nil ;; to be added later
           :constructor (list ',constructor-args ',constructor :no-super)))
     ,@(loop for p in properties
          collect `(add-swf-property ',p ',p))))
