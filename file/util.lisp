(in-package :avm2-compiler)

;; pieces shared between both writers

;;; fixme: deal with package stuff, possibly reorganize stuff between asm/compiler...

(defun super-names (name)
  (let ((c (when name (find-swf-class name))))
    (when c
      (cons (swf-name c) (super-names (extends c))))))

(defun push-lex-scope (mn-index)
  `((:get-lex ,(if (integerp mn-index) `(:id ,mn-index)mn-index))
    (:push-scope)))

(defun new-class+scopes (class)
  ;; fixme: allow class lookup instead of using class-id directly?
  (let ((supers (reverse (super-names (extends class)))))
    (unless (second (assoc (swf-name class) (class-names *compiler-context*)))
      (break "name ~s = ~s names ~s" (swf-name class)
              (assoc (swf-name class) (class-names *compiler-context*))
              (class-names *compiler-context*)))
    `((:get-scope-object 0)
      ,@(loop for i in supers
           append (push-lex-scope i))
      (:get-lex ,(swf-name (find-swf-class (extends class))))
      (:new-class ,(second (assoc (swf-name class) (class-names *compiler-context*))))
      ,@(loop repeat  (length supers)
           collect `(:pop-scope))
      (:init-property  ,(swf-name class)))))

(defun intern-constant (x)
  (etypecase x
    ((integer 0 #.(expt 2 32))
     (cons (avm2-asm::avm2-intern-uint x) 4))
    ((integer #.(- (expt 2 31)) #.(expt 2 31))
     (cons (avm2-asm::avm2-intern-int x) 3))
    (number
     (cons (avm2-asm::avm2-intern-double (float x 0d0)) 6))
    (string
     (cons (avm2-asm::avm2-string x) 1))
    ((eql t)
     (cons 0 #x0b))
    ;;(false #x0a)
    ((eql nil)
     (cons 0 #x0c))
    #++(undef 0)
    #++(ns 8)
    #++(pks ns x16)
    #++(pkg internal ns x17)
    #++(prot ns x18)
    #++(explicit ns x19)
    #++(static prot ns x1a)
    #++(private ns x05)))

(defun assemble-function (name data)
  #+nil(format t "--assemble-function ~s :~%" name)
  (destructuring-bind (n nid argtypes return-type flags asm
                         &key activation-slots class-name class-static
                         anonymous trait trait-type function-deps class-deps
                         optional-args)
      data
    (declare (ignore function-deps class-deps))
    ;;(format t "--assemble-function ~s : ~s : ~s~%" name n nid)
    (let* ((traits (loop for (name index type) in activation-slots
                         ;;do (format t "trait = ~s ~s ~s ~%" name index type)
                         collect (make-instance
                                  'avm2-asm::trait-info
                                  'avm2-asm::name (avm2-asm::asm-intern-multiname name)
                                  'avm2-asm::trait-data
                                  (make-instance
                                   'avm2-asm::trait-data-slot/const
                                   'avm2-asm::kind 0
                                   'avm2-asm::slot-id index
                                   'avm2-asm::type-name type
                                   'avm2-asm::vindex 0 ;; no value
                                   'avm2-asm::vkind 0 ;; no value
                                   ))))
           (rest-p (or (logbitp 0 flags)
                       (logbitp 2 flags)))
           (mid (avm2-asm::avm2-method name nid argtypes return-type flags
                                       :option-params
                                       (mapcar 'intern-constant optional-args)
                                       :body (avm2-asm::assemble-method-body
                                              asm
                                              :traits traits
                                              :arg-count (+ 1
                                                            (if rest-p 1 0)
                                                            (length argtypes))))))
      (when trait
        (setf n (if (symbolp trait)
                    (avm2-asm::symbol-to-qname-list trait)
                    `(:qname "" ,trait))))
      (if class-name
          ;; member function
          (let ((class (find-swf-class class-name)))
            (assert class) ;; fixme: handle this better
            (macrolet ((add (n mid alist)
                         `(progn
                            (let ((c (assoc ,n ,alist :test 'equal)))
                              (if c (rplacd c (list ,mid))
                                  (push (list ,n ,mid) ,alist))))))
              (if class-static
                  (add n mid (class-functions class))
                  (add n mid (functions class)))))
          ;; normal function
          (cond
            ;; fixme: should these use trait instead of n ?
            ((and (not anonymous) trait (eq trait-type :function))
             (push (list n mid) (function-names *compiler-context*)))
            ((and trait (eq trait-type :slot))
             (push (list n 0) (script-slots *compiler-context*)))
            (t
             #++(format t "no trait for function ~s  =~%" name)))))))
;++
(defun assemble-class (name ns super properties constructor instance-functions class-properties class-functions flags implements)
  (let* ((constructor-mid
          (cond
            #++((consp constructor)
             (avm2-asm::avm2-method
              nil 0 ;; id name
              (loop for i in (first constructor)
                 collect 0) ;; constructor arg types
              0 0
              :body
              (avm2-asm::assemble-method-body
               (%compile-defun name (first constructor)
                               (second constructor) t
                               (or (third constructor) t)))))
            ((numberp constructor) constructor)
            (t (avm2-asm::intern-method-id constructor))))
         ;; fixme: probably should make this configurable at some point
         (class-init (avm2-asm::avm2-method nil 0 nil 0 0 ;; meta-class init
                                          :body
                                          (avm2-asm::assemble-method-body
                                           `((:get-local-0)
                                             (:push-scope)
                                             (:return-void))
                                           :init-scope 0)))
         (junk (avm2-asm::avm2-ns-intern ns))
         (class (avm2-asm::avm2-class
                 (avm2-asm::asm-intern-multiname name)
                 (avm2-asm::asm-intern-multiname
                  (or (swf-name (find-swf-class super))
                      super))
                 ;;flags 1=sealed,2=final,4=interface, 8=protectedns?
                 flags ;; (:sealed :final :interface :protected-namespace)
                 (loop for i in implements
                    collect (avm2-asm::asm-intern-multiname
                             (or (swf-name (find-swf-class i))
                                 i)))
                 constructor-mid
                 (append
                  (loop for i in properties
                        collect
                        (make-instance
                         'avm2-asm::trait-info
                         'avm2-asm::name (avm2-asm::asm-intern-multiname i)
                         'avm2-asm::trait-data
                         (make-instance 'avm2-asm::trait-data-slot/const
                                        'avm2-asm::kind 0
                                        'avm2-asm::slot-id 0 ;; auto-assign
                                        'avm2-asm::type-name 0 ;; */t
                                        'avm2-asm::vindex 0 ;; no value
                                        'avm2-asm::vkind 0 ;; no value
                                        )))
                  (loop for (name index) in instance-functions
                        collect
                        (make-instance
                         'avm2-asm::trait-info
                         'avm2-asm::name (avm2-asm::asm-intern-multiname name)
                         'avm2-asm::trait-data
                         (make-instance 'avm2-asm::trait-data-method/get/set
                                        'avm2-asm::slot-id 0 ;; none
                                        'avm2-asm::method index))))
                 class-init
                 :protected-ns junk
                 :class-traits
                                  (append
                  (loop for i in class-properties
                        collect
                        (make-instance
                         'avm2-asm::trait-info
                         'avm2-asm::name (avm2-asm::asm-intern-multiname i)
                         'avm2-asm::trait-data
                         (make-instance 'avm2-asm::trait-data-slot/const
                                        'avm2-asm::kind 0
                                        'avm2-asm::slot-id 0 ;; auto-assign
                                        'avm2-asm::type-name 0 ;; */t
                                        'avm2-asm::vindex 0 ;; no value
                                        'avm2-asm::vkind 0 ;; no value
                                        )))
                  (loop for (name index) in class-functions
                        collect
                        (make-instance
                         'avm2-asm::trait-info
                         'avm2-asm::name (avm2-asm::asm-intern-multiname name)
                         'avm2-asm::trait-data
                         (make-instance 'avm2-asm::trait-data-method/get/set
                                        'avm2-asm::slot-id 0 ;; none
                                        'avm2-asm::method index))))
                 ;; todo: class traits
                 ;; :class-traits nil
                 )))
    (format t "add ~s to compiler context~%" (list name class))
    (push (list name class) (class-names *compiler-context*))))
