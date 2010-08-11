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
                 '%swf:method-id (avm2-asm::method-id trait)
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
    (make-instance '%swf:abc-instance-info
                   '%swf:name name
                   '%swf:super-name super-name
                   '%swf:class-interface-p (getf flags :interface)
                   '%swf:class-final-p (and (not (getf flags :not-final))
                                            (getf flags :final))
                   '%swf:class-sealed-p (getf flags :sealed)
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

(defparameter *progressive-write-context* nil)

(defclass progressive-write-context ()
  (;; hash (normalized) name -> class for written classes/functions
   ;; (not just name, since we want to be able to detect when we have
   ;;  a redefinition in a later tag that should override what is already
   ;;  written)
   (written-classes :accessor written-classes
                    :initform (make-hash-table :test 'equal))
   (written-functions :accessor written-functions
                      :initform (make-hash-table :test 'eq))))

(defmacro with-progressive-write-context (() &body body)
  ;; todo: possibly should allow marking already written stuff?
  `(let ((*progressive-write-context*
          (make-instance 'progressive-write-context)))
     ,@body))

(defun normalize-name (n)
  (cond
    ((and (consp n) (eq (car n) :qname)) n)
    ;; fixme: handle setf functions...
    ((and (consp n) (eq (car n) 'setf)) n)
    ((symbolp n) (avm2-asm::symbol-to-qname-list n))
    ((stringp n)
     (if (find #\: n)
         (list :qname
               (subseq n 0 (position #\: n))
               (subseq n (1+ (position #\: n :from-end t))))
         (list :qname "" n )))
    (t (error "don't know how to normalize name ~s" n))))

(defun class-already-written-p (name obj)
  (when *progressive-write-context*
    (eq obj
        (gethash (normalize-name name)
                 (written-classes *progressive-write-context*)))))

(defun mark-class-written (name obj)
  (when *progressive-write-context*
    (setf (gethash (normalize-name name)
                   (written-classes *progressive-write-context*))
          obj)))


(defun function-already-written-p (name obj)
  (when *progressive-write-context*
    (eq obj
        (gethash (normalize-name name)
                 (written-functions *progressive-write-context*)))))

(defun mark-function-written (name obj)
  (when *progressive-write-context*
    (setf (gethash (normalize-name name)
                   (written-functions *progressive-write-context*))
          obj)))


(defun abc-tag-from-contexts (assembler-context compiler-context symbol-tables
                              tree-shaker-roots)
  (let ((script-init-scope-setup nil)
        (tree-shaker-keep-all (eq tree-shaker-roots t))
        (tree-shaker-keep-function (make-hash-table :test 'equal))
        (tree-shaker-keep-class (make-hash-table :test 'equal)))

    (when *break-compile* (break "ac=~s cc=~s st=~s tsr=~s"
                                 assembler-context compiler-context
                                 symbol-tables tree-shaker-roots))
    (labels ((keep-function (k)
               #++(when (eq k 'vector)
                    (break "~s ~s" tree-shaker-keep-function tree-shaker-keep-class))
               #++(format t "check function ~s -> ~s ~s ~s/~s~%"
                          k tree-shaker-keep-all
                          (gethash k tree-shaker-keep-function)
                          (when (symbolp k) (avm2-asm::symbol-to-qname-list k))
                          (when(symbolp k)
                            (gethash (avm2-asm::symbol-to-qname-list k) tree-shaker-keep-function)))
               (or tree-shaker-keep-all
                   (gethash (normalize-name k) tree-shaker-keep-function)))
             (keep-class (k)
               (or tree-shaker-keep-all
                   (gethash (normalize-name k) tree-shaker-keep-class))))

      ;; tree shaker stuff
      ;;  loop through all roots, look up as class/function in symbol tables
      ;;  if found, add to tree-shaker-keep, and iterate through all
      ;;  classes/functions it depends on
      (when (consp tree-shaker-roots)
        ;; we need to be careful about names, since they may end up in a
        ;; few formats in the code that map to same function (symbol,
        ;; string, or (:qname ...) ), so normalizing them and looking up
        ;; in a separate index instead of using the symbol table directly
        ;; fixme: probably should normalize them at some point during
        ;;   compilation instead...
        (let ((function-index (make-hash-table :test 'equal))
              (class-index (make-hash-table :test 'equal)))
          (labels ((function-deps (f)
                     #++(format t "marking deps for ~s:~%" (car f))
                     (append (getf (nthcdr 6 f) :function-deps)
                             (getf (nthcdr 6 f) :class-deps)))
                   (class-deps (c)
                     (with-accessors ((functions functions)
                                      (class-functions class-functions)
                                      (constructor constructor)) c
                                        ;(break "adding deps for class ~s~%" c)
                       #++(format t "adding deps for class ~s~% ~s ~s ~s~%" (name c)
                                  functions class-functions (properties c))
                       (append (mapcar 'first functions)
                               (mapcar 'first class-functions)
                               (list constructor))))
                   (mark-used (names)
                     (when names
                       #++(format t "tree shaker marking used: ~s~%" names)
                       (loop for root in (loop for i in names
                                            collect (normalize-name i))
                          for fn = (gethash root function-index)
                          ;; possibly should handle setf fn differently?
                          ;;for setf-fn = (find-swf-setf-function root)
                          for class = (gethash root class-index)
                          ;; -- no code, so can ignore these...
                          ;;for method = (find-swf-method root)
                          ;;for accessor = (find-swf-accessor root)
                          do
                            #++(format t "tree shaker marking used1: ~s =~s ~s~%"
                                  root (car fn) class)
                          (when (not (gethash root tree-shaker-keep-function))
                            (setf (gethash root tree-shaker-keep-function) t)
                            (when fn (mark-used (function-deps fn))))

                          (when (not (gethash root tree-shaker-keep-class))
                            (setf (gethash root tree-shaker-keep-class) t)
                            (when class (mark-used (class-deps class))))
                          ;;(mark-used (function-deps setf-fn))
                          )))
                   (fill-index (symbol-tables)
                     (loop for symbol-table in symbol-tables
                        for functions = (functions symbol-table)
                        for classes = (classes symbol-table)
                        for inherit = (inherited-symbol-tables symbol-table)
                        do (loop for k being the hash-keys of functions
                              using (hash-value v)
                              do (setf (gethash (normalize-name k) function-index) (car v)))
                        (loop for k being the hash-keys of classes
                           using (hash-value v)
                           do (setf (gethash (normalize-name k) class-index) v))
                        when inherit do (fill-index inherit))))
            (fill-index symbol-tables)
            (format t "shaking tree: ~s~%" tree-shaker-roots)
            (mark-used tree-shaker-roots))))

      ;; reset functions/static functions for symbol-tables since we need
      ;; to recreate them to get correct moethod IDs
      ;; fixme: why do we store these if we aren't going to reuse them?
      ;; should either store symbolic names and map to IDs later, or
      ;; drop these slots and use something local to the function...
      ;; fixme: recalculate these before running the tree-shaker, so
      ;; class methods don't get dropped
      (loop for symbol-table in symbol-tables
         do (loop for v being the hash-values of (classes symbol-table)
               do (setf (functions v) nil)
               do (setf (class-functions v) nil)))


      ;; assemble functions before classes so methods can get added to classes
      ;; fixme: clean the method stuff up

      (loop for symbol-table in symbol-tables
         do (loop for k being the hash-keys of (functions symbol-table)
               using (hash-value v)
               when (and (keep-function k)
                         (not (function-already-written-p k v)))
               do
                 (mark-function-written k v)
                 (loop with once = nil
                    with classes = nil
                    for f in v
                    for c = (getf (cddr f) :class-name)
                    do ; (format t "write fun ~s~%" f)
                      (if c
                           (when (not (member c classes))
                             (push c classes)
                             (assemble-function (list c k) f))
                           (when (not once)
                             (setf once t)
                             (assemble-function k f))))
               else do (format t "tree shaker dropped function ~s~s~%" k
                               (if (function-already-written-p k v)
                                 " (already written)" ""))))

      #++(loop for k being the hash-keys of (avm2-asm::method-id-hash assembler-context)
         using (hash-value v)
         do (format t "after fns:: ~s->~s = ~s~%" k v (aref (avm2-asm::method-infos assembler-context) v)))
    ;; assemble classes
      (loop for symbol-table in symbol-tables
         do (loop for k being the hash-keys of (classes symbol-table)
               using (hash-value v)
               when (and (keep-class k)
                         (not (class-already-written-p k v)))
               ;; (or tree-shaker-keep-all (gethash k tree-shaker-keep-class))
               do
                 (mark-class-written k v)
               (with-accessors ((swf-name swf-name) (ns ns)
                                (extends extends) (properties properties)
                                (constructor constructor)
                                (functions functions)
                                (class-properties class-properties)
                                (class-functions class-functions)
                                (flags flags)
                                (implements implements)) v
                 (when (or properties constructor)
                   (assemble-class swf-name ns
                                   extends
                                   properties constructor
                                   functions
                                   class-properties
                                   class-functions
                                   flags
                                   implements)
                   (setf script-init-scope-setup
                         (append script-init-scope-setup (new-class+scopes v)))))
               else do (format t "tree shaker dropping class ~s~s~%" k
                               (if (class-already-written-p k v)
                                 " (already written)" "")))))

    ;; script boilerplate
    (let* ((literals (sort (append
                            (alexandria:hash-table-alist
                             (eql-literals-hash compiler-context))
                            #++(alexandria:hash-table-alist
                             (literals-hash compiler-context)))
                           #'< :key #'cadr))
           (script-init
           (avm2-asm::avm2-method
            nil 0 () 0 0
            :body
            (avm2-asm::assemble-method-body
             `((:get-local-0)
               (:push-scope)
               ,@script-init-scope-setup
               ;; if we have any literals in the code, create them before
               ;; running top-level
               ,@ (;;when (plusp (literals-index compiler-context))
                   ;; always add literal object for now, since we
                   ;; currently cache the object even in functions
                   ;; with no literals
                   ;; fixme: reenable the test once above is fxed
                   progn
                    (format t "initializing literals on global ~s ~s~% ~s~%"
                            (literals-global-name compiler-context)
                            (literals-index compiler-context)
                            (alexandria:hash-table-alist (literals-hash compiler-context)))
                    `(;; we can't build the literals all at once, since they
                      ;; might need to refer to previously built literals
                      ;; for example in '(foo)
                      (:new-array 0)
                      (:dup)
                      (:find-property-strict ,(literals-global-name compiler-context))
                      (:swap)
                      (:set-property ,(literals-global-name compiler-context))
                      (:dup)
                      ;; we need the literals somewhere the containing literals
                      ;; can get to them, so using local 1 for now
                      (:set-local 1) ;; fixme: make sure nothing else will use local 1 (toplevel code in particular)
                      ;; add the literals to the array
                      ,@(loop
                           for (nil . (i code)) in literals
                           collect '(:dup)
                           collect `(:push-int ,i)
                           append code
                           collect '(:set-property (:multiname-l "" "")))
                      ;; then run any code needed to add circularities
                      ,@(loop
                           for (v . nil) in literals
                           for fixup = (gethash v (circularity-fixups compiler-context))
                           when fixup
                           collect '(:dup)
                           and append fixup)
                      (:pop)))
               ;; run any top-level code
               ,@(load-top-level compiler-context)
               (:return-void))))))

      ;;fixme: create these directly as 3b-swf types?
      (vector-push-extend
       `(,script-init
         ,(make-instance
           'avm2-asm::trait-info
           'avm2-asm::name
           (avm2-asm::asm-intern-multiname "%%%%%")
           'avm2-asm::trait-data
           (make-instance 'avm2-asm::trait-data-slot/const
                          'avm2-asm::kind 0
                          'avm2-asm::slot-id 0
                          'avm2-asm::type-name 0
                          'avm2-asm::vindex 0
                          'avm2-asm::vkind 0))
         ;; fixme: make this a slot on the script, so it doesn't
         ;; need handled specially here...
         ,@ (;; when (plusp (literals-index compiler-context))
             ;; define always for now, since we don't optimize the
             ;; cached locals away yet
             progn
              (list
               (make-instance
                'avm2-asm::trait-info
                'avm2-asm::name
                (avm2-asm::asm-intern-multiname
                 (literals-global-name compiler-context))
                'avm2-asm::trait-data
                (make-instance 'avm2-asm::trait-data-slot/const
                               'avm2-asm::kind 0
                               'avm2-asm::slot-id 0
                               'avm2-asm::type-name 0
                               'avm2-asm::vindex 0
                               'avm2-asm::vkind 0))))
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

    (when *break-compile* (break "ac=~s cc=~s st=~s tsr=~s"
                                 assembler-context compiler-context
                                 symbol-tables tree-shaker-roots))
    #++(loop for k being the hash-keys of (avm2-asm::method-id-hash assembler-context)
       using (hash-value v)
       do (format t "~s->~s = ~s~%" k v (aref (avm2-asm::method-infos assembler-context) v)))
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
(defmacro compile-abc-tag ((exports &key inherit (tree-shaker-roots nil)
                                    (dump-inherited t))
                           &body body)
  ;; fixme: possibly should separate tree shaker roots out by type?
  ;; (function vs class)
  "exports is a list of (tag-id name), where tag-id is a symbol
matching a tag in the file, or NIL to specify the class for the root
timeline, and name is either a string, or a symbol, which is converted
to a string using the same rules as normal code (or similar rules?
package prefixes might not work, in which case only some symbols will
work)
TREE-SHAKER-ROOTS is a list of symbols to use as roots for tree shaker
in adition to those listed in EXPORTS, T to keep everything
"
  `(let ((avm2-asm::*assembler-context* (make-instance 'avm2-asm::assembler-context))
         (*compiler-context* (make-instance 'compiler-context))
         (*symbol-table* (make-instance 'symbol-table :inherit
                                        (list ,@(if inherit
                                                    inherit
                                                    '(*cl-symbol-table*))))))
     ;; fixme: add these to assembler-context constructor or something
     (avm2-asm::avm2-intern "")
     (avm2-asm::avm2-ns-intern "")

     ;; compile the body code
     ,@body

     (list
      (abc-tag-from-contexts avm2-asm::*assembler-context* *compiler-context*
                             (list ,@(when dump-inherited
                                           (if inherit inherit '(*cl-symbol-table*)))
                                   *symbol-table*)
                             ',(if (listp tree-shaker-roots)
                                   (append (loop for (nil name) in exports
                                              collect name)
                                           tree-shaker-roots)
                                   tree-shaker-roots)
                             )
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

(defun mp3-tag (character-id filename &key (seek 0))
  (declare (ignorable character-id))
  (with-open-file (s filename :element-type '(unsigned-byte 8))
    (let ((frames (make-array (list (file-length s))
                              :element-type '(unsigned-byte 8)
                              :fill-pointer 0))
          (samples 0)
          (rate)
          (stereo nil))
      (format t "~%~%create tag from mp3 file ~s~%" filename)
      (labels ((encode-rate (rate)
                 (ecase rate
                   ((5512 5500) 0)
                   ((11025 11000) 1)
                   ((22050 22000) 2)
                   ((44100 44000) 3)))
               (bitrate (version  encoded)
                 (* 1000
                    (if (= version 3)
                        ;; mpeg 1
                        (aref #(:free 32 40 48 56 64 80 96 112 128 160 192 224 256 320 :bad1b) encoded)
                        ;; mpeg 2.x
                        (aref #(:free  8 16 24 32 40 48 56  64  80  96 112 128 144 160 :bad2b) encoded))))
               (sampling-rate (version encoded)
                 (ecase version
                   (0 ;; mpeg 2.5
                    (aref #(11025 12000 8000 :bad3) encoded))
                   (2 ;; mpeg2
                    (aref #(22050 24000 16000 :bad2) encoded))
                   (3 ;; mpeg1
                    (aref #(44100 48000 32000 :bad1) encoded))))
               (next-frame ()
                 (loop
                    for octet = (read-byte s nil nil) then next
                    for next = (read-byte s nil nil)
                    always (and octet next)
                    when (and (= octet #xff) (= (ldb (byte 3 5) next) #b111))
                    return
                      (let ((h3 (read-byte s))
                            (h4 (read-byte s)))
                        (vector-push-extend octet frames)
                        (vector-push-extend next frames)
                        (vector-push-extend h3 frames)
                        (vector-push-extend h4 frames)
                        (list (ldb (byte 2 3) next) ; version
                              (ldb (byte 2 1) next) ; layer
                              (ldb (byte 1 0) next) ; crc flag 1=no crc
                              (ldb (byte 4 4) h3) ; bitrate
                              (ldb (byte 2 2) h3) ; samplerate
                              (ldb (byte 1 1) h3) ; padding
                              (ldb (byte 1 0) h3) ;reserved
                              (ldb (byte 2 6) h4) ;channel mode
                              (ldb (byte 2 4) h4) ;mode ext
                              (ldb (byte 1 3) h4) ;copy
                              (ldb (byte 1 2) h4) ;original
                              (ldb (byte 2 0) h4))) ;emphasis
                    #++ #+else do (unless (zerop octet) (format t "skip octet ~8,'0b = ~s~%" octet
                                                         (code-char octet))))))

        (loop 

           for header = (next-frame)
           while header
           do (destructuring-bind (version layer crc bitrate samplerate
                                            padding reserved channelmode
                                            mode-ext copy original emphasis)
                  header
                (declare (ignorable version layer crc bitrate samplerate
                                    padding reserved channelmode
                                    mode-ext copy original emphasis))
                #++(format t "frame: version ~s layer ~s crc ~s ~
                           br ~s, sr ~s, pad ~s res~s ~
                           ch~s me ~s @~s orig ~s em ~s~%"
                        version layer crc bitrate samplerate padding
                        reserved channelmode mode-ext copy original
                        emphasis)
                #++(format t "  pos=~s ~%" (file-position s))
                (let* ((mpeg1 (= version 3))
                       (size  (+ (floor (* (if mpeg1  144 72)
                                          (bitrate version bitrate))
                                       (sampling-rate version samplerate))
                                 padding -4)))
                  (incf samples (if mpeg1 1152 576))
                  (if rate
                      (assert (= rate (sampling-rate version samplerate)))
                      (setf rate (sampling-rate version samplerate)))
                  (when (or (= channelmode 0) (= channelmode 1))
                    ;; fixme: detect changes between frames?
                    ;; should dual channel count as stereo?
                    (setf stereo t))
                  #++(format t "size = ~s ~s ~s ~s ~s~%" size
                          (bitrate version bitrate)  (sampling-rate version samplerate) padding mpeg1)
                  ;; crc is counted in size calc
                  #++(when (zerop crc)
                    (vector-push-extend (read-byte s) frames)
                    (vector-push-extend (read-byte s) frames))
                  (loop repeat size
                     do (vector-push-extend (read-byte s) frames))
                  #++(format t "  pos=~s ~%" (file-position s)))))
        (make-instance '%swf:define-sound-tag
                       '%swf:character-id character-id
                       '%swf:sound-format 2 ;; 2=mp3
                       '%swf:sound-rate (encode-rate rate)
                       '%swf:16bit t ; ignored for compressed formats
                       '%swf:stereo stereo
                       '%swf:sound-sample-count samples
                       '%swf:sound-data
                       (make-instance '%swf:mp3-sound-data
                                      '%swf:seek-samples seek
                                      '%swf:mp3-frames frames))
)
    

      #++
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
      #++
      (format t "writing png tag ~sx~s~%"  (png:aimage-width png)  (png:aimage-height png))
      
    )))