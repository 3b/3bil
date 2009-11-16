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

  ;; defmacro
  (add-swf-macro-function
   'defmacro
   (lambda (form environment)
     (declare (ignore environment))
     (destructuring-bind (name args &body body) (cdr form)
       (let* ((bform (gensym))
              (benvironment (gensym))
              (op-var (gensym))
              (lambda-list (add-op-var-to-macro-lambda-list op-var args)))
         (add-swf-macro-function
          name
          (coerce `(lambda (,bform ,benvironment)
                     (declare (ignore ,benvironment))
                     (destructuring-bind ,lambda-list ,bform
                       (declare (ignore ,op-var))
                       ,@body)) 'function))))
     nil))

  (add-swf-macro-function
   'define-compiler-macro
   (lambda (form environment)
     (declare (ignore environment))
     (destructuring-bind (name args &body body) (cdr form)
       (let* ((bform (gensym))
              (benvironment (gensym))
              (op-var (gensym))
              (lambda-list (add-op-var-to-macro-lambda-list op-var args)))
         (add-swf-cmacro-function
          name
          (coerce `(lambda (,bform ,benvironment)
                     (declare (ignore ,benvironment))
                     (destructuring-bind ,lambda-list ,bform
                       (declare (ignore ,op-var))
                       ,@body)) 'function))))
     nil))

  (c3* (gensym)

    (defmacro %destructuring-bind-* ((&key optional key aux allow-other-keys) arg-form &body body)
      (error "got complex lambda list, ignoring opt=~s key=~s aux=~s~%"
             optional key aux)
      nil)


   (defmacro %typep (object type)
     `(%asm
       (:@ ,object)
       (:get-lex ,(or (swf-name (find-swf-class type)) type))
       (:is-type-late)))


    (defmacro %new- (class &rest args)
      (let ((name (typecase class
                        (symbol
                         (let ((c (find-swf-class class)))
                           (assert c) ;; fixme: better error reporting
                           (swf-name c)))
                        (t class))))
            `(%asm (:find-property-strict ,name)
                   ,@(loop for i in args
                        collect `(:@ ,i))
                   (:comment "%new-")
                   (:construct-prop ,name ,(length args)))))



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
            (fake-accessors (second (assoc :fake-accessors class-options))))
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
               :constructor constructor-sym))
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
            (:%dlabel ,jump)))))))

