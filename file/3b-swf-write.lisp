(in-package :avm2-compiler)

;; porting writer-hack to 3b-swf

;; fixme: should probably switch to using the same data structures in
;; both assembler and 3b-swf if this end up being the primary
;; writer...
;; or at least add direct writer methods for asm stuff...


;;~ assemble-function
;;~ assemble-class
;;~ new-class+scopes

(defun translate-namespace (ns)
  ;;storing namespace_info as (kind name_index) for now
  (make-instance '%swf:abc-namespace
                 '%swf:kind (first ns)
                 '%swf:name (second ns)))
(defun translate-ns-set (ns)
  ;; namespace-set (ns_set_info) = (ns1 ns2 ... nsN)
  (make-instance '%swf:abc-ns-set
                 '%swf:ns ns))
(defun translate-multiname (mn)
  ;;multiname_info = (kind values*) for now, 0-2 values depending on kind
  (destructuring-bind (first &optional second third)
      mn
    ;;(format t "~%multiname ~s ~s ~s~%" first second third)
    (cond
      ((member first '(#x07 #x0d))
       (make-instance (%swf::subclass-from-id '%swf:abc-multiname first)
                      '%swf:ns second
                      '%swf:name third ))
      ((member first '(#x1b #x1c))
       (make-instance (%swf::subclass-from-id '%swf:abc-multiname first)
                      '%swf:ns-set second ))
      (t
       (make-instance (%swf::subclass-from-id '%swf:abc-multiname first)
                      ;; ugly, but don't want to duplicate more than it is...
                      :allow-other-keys t
                      '%swf:name second
                      '%swf:ns-set third)))))

(defun constant-pool-from-context (context)
  (with-accessors
        ((ints avm2-asm::ints) (uints avm2-asm::uints)
         (doubles avm2-asm::doubles)
         (strings avm2-asm::strings) (namespaces avm2-asm::namespaces)
         (ns-sets avm2-asm::ns-sets) (multinames avm2-asm::multinames))
      context
    ;;(format t "constant pools:~%ints=~s~%uints=~s~%doubles=~s~%" ints uints doubles)
    ;;(format t "strings=~s~%namespaces=~s~%multinames=~s~%" strings namespaces multinames)

    ;; fixme: handle this better...
    (flet ((fix (a &optional (xlate 'identity))
             (loop for i from 1 below (length a)
                collect (funcall xlate (aref a i)))))
      (make-instance '%swf:abc-constant-pool
                     '%swf:integers (fix ints)
                     '%swf:unsigned-integers (fix uints)
                     '%swf:doubles (fix doubles)
                     '%swf:strings (fix strings)
                     '%swf:namespaces (fix namespaces 'translate-namespace)
                     '%swf:ns-sets (fix ns-sets 'translate-ns-set )
                     '%swf:multinames (fix multinames 'translate-multiname)))))

(defun translate-method-info (method-info)
  (destructuring-bind (name param-types return-type flags &optional optional-params pnames)
      method-info
    (make-instance '%swf:abc-method-info
                   '%swf:return-type return-type
                   '%swf:param-types param-types
                   '%swf:name name
                   '%swf:set-dxns (logbitp 6 flags)
                   '%swf:need-rest (logbitp 2 flags)
                   '%swf:need-activation (logbitp 1 flags)
                   '%swf:need-arguments (logbitp 0 flags)
                   '%swf:options
                   (mapcar (lambda (a)
                             (make-instance '%swf:abc-interned-value+kind-constant
                                            '%swf:value (car a)
                                            '%swf:kind (cdr a)))
                           optional-params)
                   #+nil(make-instance '%swf:abc-method-info-option-info
                                  '%swf:options
                                  (mapcar (lambda (a)
                                            (make-instance '%swf:abc-interned-value+kind-constant
                                                           '%swf:value (car a)
                                                           '%swf:kind (cdr a)))
                                          optional-params))
                   '%swf:param-names pnames)))

(defun translate-metadata-info (metadata)
  (make-instance '%swf:abc-metadata-info
                 '%swf:name (car metadata)
                 '%swf:items
                 (mapcar (lambda (x)
                           (make-instance '%swf:abc-metadata-item-info
                                          '%swf:key (car x)
                                          '%swf:value (cdr x)))
                         (second metadata))))

(defmethod translate-trait (trait)
  (error "unhandled trait type in translate-trait? ~s" trait))

(defmethod translate-trait ((trait avm2-asm::trait-info))
  (translate-trait-data (avm2-asm::trait-data trait)
                        (avm2-asm::name trait)
                        (when (logbitp 6 (avm2-asm::kind (avm2-asm::trait-data trait)))
                          (avm2-asm::metadata trait))))

(defmethod translate-trait-data (trait name metadata)
  (error "unhandled trait type in translate-trait-data ? ~s ~s ~s" trait name metadata))

(defmethod translate-trait-data ((trait avm2-asm::trait-data-slot/const) name metadata)
  (make-instance (%swf::subclass-from-id '%swf::abc-trait-info
                                         (avm2-asm::kind trait))
                 '%swf:slot-id (avm2-asm::slot-id trait)
                 '%swf:type-name (avm2-asm::type-name trait)
                 '%swf:value
                 (make-instance '%swf:abc-interned-value+optional-kind-constant
                                '%swf:value (avm2-asm::vindex trait)
                                '%swf:kind (avm2-asm::vkind trait))
                 '%swf:name name
                 '%swf:metadata metadata))

(defmethod translate-trait-data ((trait avm2-asm::trait-data-method/get/set) name metadata)
  (make-instance (%swf::subclass-from-id '%swf::abc-trait-info (avm2-asm::kind trait))
                 '%swf:slot-id (avm2-asm::slot-id trait)
                 '%swf:method-name (avm2-asm::method-id trait)
                 '%swf:name name
                 '%swf:metadata metadata))

(defmethod translate-trait-data ((trait avm2-asm::trait-data-class) name metadata)
  (make-instance '%swf:abc-trait-info-class
                 '%swf:slot-id (avm2-asm::slot-id trait)
                 '%swf:class-name (avm2-asm::classi trait)
                 '%swf:name name
                 '%swf:metadata metadata))

(defmethod translate-trait-data ((trait avm2-asm::trait-data-function) name metadata)
  (make-instance '%swf:abc-trait-info-function
                 '%swf:slot-id (avm2-asm::slot-id trait)
                 '%swf:function-name (avm2-asm::fn trait)
                 '%swf:name name
                 '%swf:metadata metadata))


(defun translate-instance (instance)
  (destructuring-bind (name super-name flags interfaces iinit traits
                            &optional protected-ns)
      instance
    ;;(format t "~%instance = ~s~%" instance)
    (make-instance '%swf:abc-instance-info
                   '%swf:name name
                   '%swf:super-name super-name
                   '%swf:class-interface-p (logbitp 2 flags)
                   '%swf:class-final-p (logbitp 1 flags)
                   '%swf:class-sealed-p (logbitp 0 flags)
                   '%swf:protected-ns protected-ns
                   '%swf:interfaces interfaces
                   '%swf:instance-init iinit
                   '%swf:traits (mapcar #'translate-trait traits))))

(defun translate-class (class)
  ;; class = (cinit trait1 trait2 ... traitN)
  (make-instance '%swf:abc-class-info
                 '%swf:class-init (car class)
                 '%swf:traits (mapcar #'translate-trait (cdr class))))

(defun translate-script (script)
  ;;script = (init trait1 trait2 ... traitN)
  (make-instance '%swf:abc-script-info
                 '%swf:script-init (car script)
                 '%swf:traits (mapcar #'translate-trait (cdr script))))

(defun translate-exception (exception)
  (make-instance '%swf:abc-exception-info
                 '%swf:from (avm2-asm::from exception)
                 '%swf:to (avm2-asm::to exception)
                 '%swf:target (avm2-asm::target exception)
                 '%swf:exception-type (avm2-asm::exc-type exception)
                 '%swf:var-name (avm2-asm::var-name exception)))

(defun translate-method-body (body)
  (make-instance '%swf:abc-method-body-info
                 '%swf:method-name (avm2-asm::method-id body)
                 '%swf:max-stack (avm2-asm::max-stack body)
                 '%swf:local-count (1+ (avm2-asm::local-count body))
                 '%swf:init-scope-depth (avm2-asm::init-scope-depth body)
                 '%swf:max-scope-depth (avm2-asm::max-scope-depth body)
                 '%swf:code (avm2-asm::code body)
                 '%swf:exceptions (map 'list #'translate-exception
                                       (avm2-asm::exceptions body))
                 '%swf:traits (map 'list #'translate-trait
                                   (avm2-asm::traits body))))


(defparameter *break-compile* nil)


(defun abc-tag-from-contexts (assembler-context compiler-context symbol-tables)
  (let ((script-init-scope-setup nil))

    ;; reset functions/static functions for symbol-tables since we need
    ;; to recreate them to get correct moethod IDs
    ;; fixme: why do we store these if we aren't going to reuse them?
    ;; should either store symbolic names and map to IDs later, or
    ;; drop these slots and use something local to the function...
    (loop for symbol-table in symbol-tables
       do (loop for v being the hash-values of (classes symbol-table)
             do (setf (functions v) nil)
             do (setf (class-functions v) nil)))

    ;; assemble functions before classes so methods can get added to classes
    ;; fixme: clean the method stuff up
    (loop for symbol-table in symbol-tables
       do (loop for k being the hash-keys of (functions symbol-table)
             using (hash-value v)
             do (assemble-function k (car v))))

    ;; assemble classes
    (loop for symbol-table in symbol-tables
       do (loop for k being the hash-keys of (classes symbol-table)
             using (hash-value v)
             do
             (with-accessors ((swf-name swf-name) (ns ns)
                              (extends extends) (properties properties)
                              (constructor constructor)
                              (functions functions)
                              (class-properties class-properties)
                              (class-functions class-functions)) v
               (when (or properties constructor)
                 (assemble-class swf-name ns
                                 extends
                                 properties constructor
                                 functions
                                 class-properties
                                 class-functions)))
             (setf script-init-scope-setup
                   (append script-init-scope-setup (new-class+scopes v)))))

    ;; script boilerplate
    (let ((script-init
           (avm2-asm::avm2-method
            nil 0 () 0 0
            :body
            (avm2-asm::assemble-method-body
             `((:get-local-0)
               (:push-scope)
               ,@script-init-scope-setup
               ,@(load-top-level compiler-context)
               (:return-void))))))

      ;;fixme: create these directly as 3b-swf types?
      (vector-push-extend
       `(,script-init
         ,@(loop for i in (script-slots compiler-context)
              collect (make-instance
                       'avm2-asm::trait-info
                       'avm2-asm::name
                       (avm2-asm::asm-intern-multiname (first i))
                       'avm2-asm::trait-data
                       (make-instance 'avm2-asm::trait-data-slot/const
                                      'avm2-asm::kind 0
                                      'avm2-asm::slot-id 0
                                      'avm2-asm::type-name (second i)
                                      'avm2-asm::vindex 0
                                      'avm2-asm::vkind 0)))
         ,@(loop for i in (class-names compiler-context)
              collect (make-instance
                       'avm2-asm::trait-info
                       'avm2-asm::name
                       (avm2-asm::asm-intern-multiname (first i))
                       'avm2-asm::trait-data
                       (make-instance 'avm2-asm::trait-data-class
                                      'avm2-asm::slot-id 0
                                      'avm2-asm::classi (second i))))
         ,@(loop for i in (function-names compiler-context)
              collect (make-instance
                       'avm2-asm::trait-info
                       'avm2-asm::name
                       (if (numberp (first i))
                           (first i)
                           (avm2-asm::asm-intern-multiname (first i)))
                       'avm2-asm::trait-data
                       (make-instance 'avm2-asm::trait-data-method/get/set
                                      'avm2-asm::slot-id 0
                                      'avm2-asm::method (second i)))))
       (avm2-asm::scripts assembler-context)))

    (when *break-compile* (break))

    ;; do something with abc data...
    (make-instance
     '%swf:do-abc-tag
     '%swf:flags 1
     '%swf:name "name" ;; what goes here?
     '%swf:constant-pool (constant-pool-from-context assembler-context )
     '%swf:method-info (map 'list #'translate-method-info
                            (avm2-asm::method-infos assembler-context))
     '%swf:metadata-info (map 'list #'translate-metadata-info
                              (avm2-asm::metadata assembler-context))
     '%swf:instance-info (map 'list #'translate-instance
                              (avm2-asm::instances assembler-context))
     '%swf:class-info (map 'list #'translate-class
                           (avm2-asm::classes assembler-context))
     '%swf:script-info (map 'list #'translate-script
                            (avm2-asm::scripts assembler-context))
     '%swf:method-body-info (map 'list #'translate-method-body
                                 (avm2-asm::method-bodies assembler-context)))))

(defun symbol-class* (exports)
  (3b-swf:symbol-class-tag
   (loop for export in exports
      for (id name) = (if (listp export) export (list export export))
      for string = (if (stringp name)
                       name
                       (avm2-asm::symbol-to-export-string name))
      collect (list id string))))

;; still not sure about proper API...
(defmacro compile-abc-tag ((exports) &body body)
  "exports is a list of (tag-id name), where tag-id is a symbol
matching a tag in the file, or NIL to specify the class for the root
timeline, and name is either a string, or a symbol, which is converted
to a string using the same rules as normal code (or similar rules?
package prefixes might not work, in which case only some symbols will
work)"
  `(let ((avm2-asm::*assembler-context* (make-instance 'avm2-asm::assembler-context))
         (*compiler-context* (make-instance 'compiler-context))
         (*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table*))))
     ;; fixme: add these to assembler-context constructor or something
     (avm2-asm::avm2-intern "")
     (avm2-asm::avm2-ns-intern "")

     ;; compile the body code
     ,@body

     (list
      (abc-tag-from-contexts avm2-asm::*assembler-context* *compiler-context*
                             (list *cl-symbol-table* *symbol-table*))
      (symbol-class* ',exports))))


(defun png-tag (character-id filename)
  (let* ((png (with-open-file (s filename :element-type '(unsigned-byte 8))
                (png:png-stream->aimage s)))
         (data (make-array (list (png:aimage-width png) (png:aimage-height png))
                           :element-type '(unsigned-byte 32))))
    ;; no color table size, only handling 32bit for now
    ;; flash wants premultiplied alpha, argb so convert from rgba and fix rgb
    (flet ((argb (a r g b)
             (dpb r (byte 8 24) (dpb g (byte 8 16) (dpb b (byte 8 8) a)))))
      (loop with orig = (png:aimage-data png)
         for x below (png:aimage-width png)
         do (loop for y below (png:aimage-height png)
               for i = (* 4 (+ x (* y (png:aimage-width png))))
               for a = (aref orig (+ i 3))
               for r = (floor (/ (* a (aref orig (+ i 0))) 255))
               for g = (floor (/ (* a (aref orig (+ i 1))) 255))
               for b = (floor (/ (* a (aref orig (+ i 2))) 255))
               do (setf (aref data x y) (argb a r g b)))))
    (format t "writing png tag ~sx~s~%"  (png:aimage-width png)  (png:aimage-height png))
    (make-instance '%swf:define-bits-lossless-2-tag
                   '%swf:character-id character-id
                   '%swf:bitmap-data
                   (make-instance '%swf:bitmap-tag-data-rgba-argb
                                  '%swf:bitmap-data data))))