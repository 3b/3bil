(in-package :avm2-compiler)

;;;; code for defining vm level classes

(defmacro def-swf-class (name ns super (&rest properties) ((&rest constructor-args) &body constructor))
  `(setf (gethash ',name (classes *symbol-table*))
         (list ',(avm2-asm::symbol-to-qname-list name)
               ',ns
               ',super
               ',properties
               (list ',constructor-args ',constructor))))
