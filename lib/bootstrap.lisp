(in-package #:avm2-compiler)

;;; random stuff needed for compiling other stuff, but not in CL:
;;; as well as some of the more primitive CL bits

(let ((*symbol-table* *cl-symbol-table*))

  #+old

  (%defmacro defmacro (name args &body body)
    (let ((form (gensym))
          (environment (gensym)))
      (add-swf-macro-function
       name
       (coerce `(lambda (,form ,environment)
                  (declare (ignore ,environment))
                  (destructuring-bind ,args (cdr ,form)
                    ,@body)) 'function)))
    nil)

  ;; helper for defmacro/define-compiler-macro, adds a var to the beginning
  ;; of the arglist, but after &whole arg if any, so we can use
  ;; destructuring-bind to extract args from the macro form
  (defun add-op-var-to-macro-lambda-list (op-var lambda-list)
    (if (eq (car lambda-list) '&whole)
        (list* '&whole (second lambda-list) op-var (cddr lambda-list))
        (cons op-var lambda-list)))

  (defun remove-&environment-from-macro-lambda-list (lambda-list)
    (loop for (a . rest) on lambda-list
       when (eq a '&environment)
       return (values (append ll (cdr rest)) (car rest))
       else collect a into ll
       finally (return (values ll nil))))

  ;; defmacro
  (add-swf-macro-function
   'defmacro
   (lambda (form environment)
     (declare (ignore environment))
     (destructuring-bind (name args &body body) (cdr form)
       (multiple-value-bind (args env-var)
           (remove-&environment-from-macro-lambda-list args)
         (let* ((bform (gensym))
                (benvironment (or env-var (gensym)))
                (op-var (gensym))
                (lambda-list (add-op-var-to-macro-lambda-list op-var args)))
           (add-swf-macro-function
            name
            (coerce `(lambda (,bform ,benvironment)
                       (declare (ignore ,benvironment))
                       (destructuring-bind ,lambda-list ,bform
                         (declare (ignore ,op-var))
                         ,@body)) 'function)))))
     nil))

  (add-swf-macro-function
   'define-compiler-macro
   (lambda (form environment)
     (declare (ignore environment))
     (destructuring-bind (name args &body body) (cdr form)
       (multiple-value-bind (args env-var)
           (remove-&environment-from-macro-lambda-list args)
         (let* ((bform (gensym))
                (benvironment (or env-var (gensym)))
                (op-var (gensym))
                (lambda-list (add-op-var-to-macro-lambda-list op-var args)))
           (add-swf-cmacro-function
            name
            (coerce `(lambda (,bform ,benvironment)
                       (declare (ignore ,benvironment))
                       (destructuring-bind ,lambda-list ,bform
                         (declare (ignore ,op-var))
                         ,@body)) 'function)))))
     nil))

  (c3* (gensym)

   (defmacro %typep (object type)
     `(%asm
       (:@mark-class-dependency ,type)
       (:@ ,object)
       (:get-lex ,(or (swf-name (find-swf-class type)) type))
       (:is-type-late)))

   (defmacro %type-of (object)
     `(%asm
       (:@ ,object)
       (:type-of)))

   (defmacro %error (object)
     `(%asm
       (:@ ,object)
       (:throw)))

   (defmacro check-type (object type &optional (string (format nil "~s" type)))
     (cond
       ((eq type 'null)
        `(when ,object
           (%error (%new- flash:error (+ "check-type failed, expected " ,string " got " (%type-of ,object))))))
       ((eq type 'cons)
        `(unless (%typep ,object cons-type)
           (%error (%new- flash:error (+ "check-type failed, expected " ,string " got " (%type-of ,object))))))
       ((eq type 'list)
        `(unless (or (eq ,object nil) (%typep ,object cons-type))
           (%error (%new- flash:error (+ "check-type failed, expected " ,string " got " (%type-of ,object))))))
       ((and (consp type) (eq (car type) 'integer))
        `(unless (and (%typep ,object flash:number)
                      ,@ (when (second type)
                           `((>= ,object ,(second type))))
                      ,@ (when (third type)
                           `((<= ,object ,(third type)))))
           (%error (%new- flash:error (+ "check-type failed, expected " ,string
                       " got " (%type-of ,object))))))
       (t
        `(unless  (%typep ,object ,type)
           (%error (%new- flash:error (+ "check-type failed, expected " ,string
                       " got " (%type-of ,object)))))
        ))
     )


    (defmacro %new- (class &rest args)
      (let ((name (typecase class
                        (symbol
                         (let ((c (find-swf-class class)))
                           (assert c) ;; fixme: better error reporting
                           (swf-name c)))
                        (t class))))
            `(%asm (:find-property-strict ,name)
                   (:%push-arglist
                    ,@(loop for i in args
                         collect `(:@ ,i)))
                   (:comment "%new-")
                   (:construct-prop ,name ,(length args)))))

   (defmacro %construct-class-by-name (class-name &rest args)
     (let ((class (swf-name (find-swf-class 'flash:class))))
       `(%asm
         (:find-property-strict ,class)
         (:@ (flash::flash.utils.get-definition-by-name ,class-name))
         (:call-property ,class 1)
         (:%push-arglist
          ,@(loop for i in args
               collect `(:@ ,i)))
         (:construct ,(length args)))))



      (defmacro %apply (function this-arg rest-array)
        `(flash:apply ,function ,this-arg ,rest-array))

      (defmacro %funcall (function this-arg &rest rest)
        `(flash:call ,function ,this-arg ,@rest))

      (defmacro %setf-1 (place value)
        `(%setf ,place ,value))


      ;; inline math ops, we need at least 0-2 arg versions, since the full
      ;; version is implemented in terms of it
      (defmacro define-transitive-binops (&body ops)
        (let ((i (gensym)))
          `(progn
             ,@(loop for (op opcode identity unary-op) in ops
                  collect
                  `(define-compiler-macro ,op (&whole w &rest x)
                     (case (length x)
                       (0 ,identity)
                       (1 ,(cond
                            ((keywordp unary-op)
                             ``(%asm
                                (:@ ,(first x))
                                (,',unary-op)))
                            ;; fixme: this special case for / is a bit ugly
                            ((numberp unary-op)
                             ``(%asm
                                (:@ ,(first x))
                                (:@ ,unary-op)
                                (:swap)
                                (,',opcode)))
                            (unary-op
                             (error "can't compile unary op ~s in define-transitive-binops?" unary-op))
                            (t
                             `(first x))))
                       (2 `(%asm
                            (:%push-arglist
                             (:@ ,(first x))
                             (:@ ,(second x)))
                            (,',opcode)))
                       ;; fixme: should we call stop inlining at some arg count?
                       (t
                        `(,',op (,',op ,(first x) ,(second x))
                                ,@(nthcdr 2 x)))))))))

      (define-transitive-binops
          (+ :add 0)
          (- :subtract nil :negate)
        (* :multiply 1)
        (/ :divide nil 1.0)
        (logior :bit-or 0)
        (logxor :bit-xor 0)
        (logand :bit-and -1)
        ;; (logeqv ??? -1)
        )

      (defmacro define-compare-binops (&body ops)
        (let ((i (gensym))
              (j (gensym)))
          `(progn
             ,@(loop for (op opcode) in ops
                  collect
                  `(define-compiler-macro ,op (&whole w a &rest x)
                     (case (length x)
                       (0 t)
                       (1 `(%asm
                            (:%push-arglist
                             (:@ ,a)       ;; types?
                             (:@ ,(first x))) ;; types?
                            (,',opcode)))
                       (t
                        ;; fixme: expand inline for reasonable arglist lengths?
                        w)))))))

      (define-compare-binops
        (< :less-than)
        (<= :less-equals)
        (= :equals)
        (>= :greater-equals)
        (> :greater-than))


      #++
      (defmacro defun-setf (name args  body)
        (%swf-defun name args (list
                               (loop for i in body
                                     if (and (consp i) (eql (car i) 'cl))
                                     collect (cadr i)
                                     else
                                     collect i #+nil(list 'quote i)))
                    :method t
                    :class-name 'setf-namespace-type
                    :class-static t)
        nil)


    (defmacro defclass-swf (class-name (&optional (superclass-name 'flash:object))
                            (&rest slot-specifiers)
                            &rest class-options)
      (let ((properties nil)
            (static-properties nil)
            (forms nil)
            (constructor-sym (gensym (format nil "~a-CTOR-" class-name)))
            (constructor (cdr (assoc :constructor class-options)))
            (super-args (cdr (assoc :super-args class-options)))
            (fake-accessors (second (assoc :fake-accessors class-options)))
            (implements (cdr (assoc :implements class-options)))
            (final (cdr (assoc :final class-options)
                        #++(or (assoc :final class-options) '(t . t))))
            (methods-as-properties (cdr (assoc :methods-as-properties class-options))))
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
                                         ;; currently unsupported CL stuff
                                         ;; reader writer accessor initarg initform
                                         ;; unused, but might as well allow it
                                         documentation) (if (listp spec) spec (list spec))
                 (declare (ignore type documentation))
                 (when fake-accessors
                   (add-swf-accessor name name))
                 (if (eq allocation :class)
                     (push name static-properties)
                     (push name properties))))
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
               :constructor constructor-sym
               :implements implements
               :flags (append (when methods-as-properties
                                  (list :methods-as-properties t))
                              (when final (list :final t)))))
        (loop for p in properties
           do (add-swf-property p p))
        (loop for p in static-properties
           do (add-swf-class-property p p))
        `(progn
           ,@(nreverse forms)
           (%named-lambda ,constructor-sym
                 (:no-auto-return t :no-auto-scope t :anonymous t)
               ,(car constructor)       ; lambda list
             (%asm
              (:get-local-0)
              (:push-scope)
              (:get-local-0)
              ,@(loop for i in super-args
                   collect `(:@ ,i))
              (:@mark-class-dependency ,superclass-name)
              (:construct-super ,(length super-args))
              (:%activation-record)
              (:push-null))
             (block nil
               ,@(cdr constructor))
             (%asm (:return-void)))
           )))



    (defclass-swf cons-type (flash:object)
      (%car %cdr)
      (:fake-accessors t)
      (:constructor (a b)
        (setf (%car this) a)
        (setf (%cdr this) b)))



    (defmacro %aref-1 (array index)
      `(%asm
        (:@ ,array)
        (:@ ,index)
        (:get-property (:multiname-l "" ""))))



    (defmacro %set-aref-1 (array index value)
      `(%asm
        (:@ ,array)
        (:@ ,index)
        (:@ ,value)
        (:set-property (:multiname-l "" ""))
        (:push-null)
        (:coerce-any)))


    (defmacro %set-property (object property value)
      ;; (%set-property object property value) -> value
      `(%asm
        (:@ ,value)   ;; calculate value
        (:dup)        ;; leave a copy on stack so we can return it
        (:@ ,object)  ;; find the object
        (:swap)       ;; stack => return-value object value
        (:set-property ,(or (find-swf-property property) property))))

    (defmacro %key-equal (a b)
      `(eq ,a ,b))
    ;;; some low level exception handling code, mainly intended for
    ;;; use with test framework currently, but may be generally useful
    ;;; at some point
    ;;; (may also turn into handler-case instead, depending on how
    ;;;  similar the API ends up)
    (defmacro handler-case (expr &body handlers)
      (let ((start (gensym "HANDLER-CASE-START-"))
            (end (gensym "HANDLER-CASE-END-"))
            (jump (gensym "HANDLER-CASE-JUMP-")))
        `(let (,@(remove-duplicates
                  (loop for (nil (var) nil) in handlers
                     when var collect var)))
           (%asm
            (:%dlabel ,start)
            (:comment "%w-e-h start")
            (:@ ,expr t) ;; fixme: type?
            (:comment "body end")
            (:%dlabel ,end)
            (:jump ,jump)
            (:comment "start exception handlers")
            ,@(loop for (type (var) . body) in handlers
                 for i from 0
                 ;; todo: no-error clause
                 when (eq type :no-error)
                 do (error ":no-error not supported in handler-case yet")
                 ;; fixme: should this have a better name than (gensym)?
                 ;;        or no name?
                  append
                 `((:comment ,(format nil "exception handler ~s/~s" i
                                      (length handlers)))
                   ;; var name?
                   (:%exception ,(gensym) ,start ,end
                                ,(cond
                                  ((find-swf-class type)
                                   (swf-name (find-swf-class type)))
                                  ((eq type t) 0)
                                  (t type)))
                   ;; save the var if needed
                   ,@ (if var
                        ;; typed?
                        `((:coerce-any)
                          (:@ (setf ,var (%asm-top-of-stack-untyped)) :ignored))
                        `((:pop)))
                   ;; restore scope stack
                   (:%restore-scope-stack)
                   (:comment "handler body")
                   (:@ (progn ,@body) t)
                   (:comment "handler body end")
                   (:jump ,jump)))


            (:comment "end handlers")
            (:%dlabel ,jump)))))

    (defmacro %down-by-2 ((var from to) &body body)
      (let ((start-tag (gensym))
            (end-tag (gensym)))
        `(let ((,var ,from))
           (declare (type integer ,var))
           (block nil
             (tagbody
                (if (< ,var ,to)
                    (go ,end-tag))
                ,start-tag
                (tagbody ,@body)
                (setf ,var (- ,var 2))
                (if (>= ,var ,to)
                    (go ,start-tag))
                ,end-tag)))))

    (defmacro %dotimes((var to-form) &body body)
      (let ((start-tag (gensym))
            (to (gensym))
            (end-tag (gensym)))
        `(let ((,to ,to-form)
               (,var 0))
           (declare (type integer ,var))
           (block nil
             (tagbody
                (if (>= ,var ,to)
                    (go ,end-tag))
                ,start-tag
                (tagbody ,@body)
                (setf ,var (+ ,var 1))
                (if (< ,var ,to)
                    (go ,start-tag))
                ,end-tag)))))

    (defmacro %oddp (x)
      `(%asm
        (:@ ,x)
        (:push-int 1)
        (:bit-and)
        ;; possibly better to coerce to bool rather than compare to 0?
        (:push-byte 1)
        (:equals)))

    (defmacro %length (x)
      `(%asm (:@ ,x)
             (:get-property "length")))

    (defmacro %destructuring-bind-* ((&key rest optional key aux allow-other-keys) arg-form &body body)
      (when (or aux)
        (error "got complex lambda list, ignoring rest=~s opt=~s key=~s aux=~s~%"
               rest optional key aux))
      (let* ((kw-temps (loop for i in key
                          collect (list (gensym "kt") (gensym "st"))))
             (bad-key (gensym "bad"))
             (a-o-k (gensym "aok"))
             (count (gensym))
             (i (gensym "i"))
             (k (gensym "k"))
             (v (gensym "v"))
             (end-tag (gensym))
             (count-rest (if optional
                             `(- ,count ,(length optional))
                             count)))
        `(let* ((,count (%length ,arg-form))
                ,@(loop for i from 0
                     for (n v p) in optional
                     when p
                     collect `(,p (> ,count ,i))
                     collect `(,n (if ,(if p p `(> ,count ,i))
                                      (%aref-1 ,arg-form ,i)
                                      ,v)))
                ,@ (when rest
                     `((,rest (let ((l nil))
                                (%dotimes (i ,count-rest)
                                  (push (%aref-1 ,arg-form
                                                 (- ,count i 1))
                                        l))
                                l))))
                ;; in order to get scoping/evaluation odrer stuff right, we
                ;; allocate temps for all keyword vars, and add a supplied-p
                ;; temp for any keyword with a complicated default that doesn't
                ;; have one already
                ;; simple defaults get assigned directly to the temp here
                ,@(loop for i from (length optional) by 2
                     for ((k v) d p) in key
                     for (kt pt) in kw-temps
                     ;; fixme: ue a less strict test here... should allow
                     ;; any flushable form, not just literals
                     when (or p (not (avm2-compiler::simple-default-p d)))
                     collect `(,pt nil)
                     when (avm2-compiler::simple-default-p d)
                     collect `(,kt ,d)
                     else collect `(,kt nil))
                ,@(if (and key (not allow-other-keys))
                      `((,bad-key nil)
                        (,a-o-k nil))))
           ;; process keyword args
           ,@ (when key
                `((let (,@ (when optional
                             `((,count (- ,count ,(length optional))))))
                    #++(ftrace (%length ,arg-form))
                    #++(ftrace ,arg-form)
                    ;; check for odd # of keys
                    (if (%oddp ,count)
                        (%error "odd number of key args"))
                    ;; loop over args, assign temps
                    (%down-by-2 (,i (- (%length ,arg-form) 2)
                                    ,(if optional
                                         (length optional)
                                         0))
                                (let ((,k (%aref-1 ,arg-form ,i))
                                      (,v (%aref-1 ,arg-form (+ ,i 1))))
                                  (tagbody
                                     ,@(loop for i from (length optional) by 2
                                          for ((kw nil) d p) in key
                                          for (kt pt) in kw-temps
                                          collect
                                          `(when (%key-equal ,k ,kw)
                                             ,@ (when (or p (not (avm2-compiler::simple-default-p d)))
                                                  `((setf ,pt t))) 
                                             (setf ,kt ,v)
                                             (go ,end-tag)))
                                     #++(flash:trace (+ "key " ,k " =" ,v))
                                     ,@ (unless allow-other-keys
                                          `((if (eql ,k :allow-other-keys)
                                                (setf ,a-o-k t)
                                                (setf ,bad-key t))))
                                     ,end-tag)))
                    ;; maybe throw unknown key error
                    ,@ (unless allow-other-keys
                         `((when (and ,bad-key (not ,a-o-k))
                             (%error (%new- flash:error "unknown key") )))))))
              ;; bind keywords
              ;; for every keyword, bind real name to the temp value, or if
              ;; complicated default, check supplied-p and bind to default
              ;; instead if not provided
           (let* (,@(loop for i from (length optional) by 2
                       for ((k v) d p) in key
                       for (kt pt) in kw-temps
                       ;; fixme: ue a less strict test here... should allow
                       ;; any flushable form, not just literals
                       when (avm2-compiler::simple-default-p d)
                       collect `(,v ,kt)
                       else collect `(,v (if ,pt
                                             ,kt
                                             ,d))
                       ;; bind supplied-p after evaluating init-form (if any)
                       when (or p (not (avm2-compiler::simple-default-p d)))
                       collect `(,p ,pt)))
             ,@body))))

))
