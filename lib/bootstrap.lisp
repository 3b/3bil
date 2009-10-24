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
         (format t "lambda-list -> ~s~%" lambda-list)
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


      ;; handle 0-2 arg + so we can use incf to implement dotimes and +
      ;; fixme: genearlize this to more args, other ops
      (define-compiler-macro + (&whole w &rest x)
        (cond
          ((zerop (length x)) `(quote 0))
          ((= 1 (length x)) (car x))
          ;; todo: optimize +1 case, or adding 2 literal numbers
          ((= 2 (length x)) `(%asm
                              (:@ ,(first x)) ;; types?
                              (:@ ,(second x)) ;; types?
                              (:add)))
          (t w)))

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
                            (:@ ,a)       ;; types?
                            (:@ ,(first x)) ;; types?
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
                                         ;; currently unsupported CL stuff
                                         ;; reader writer accessor initarg initform
                                         ;; unused, but might as well allow it
                                         documentation) (if (listp spec) spec (list spec))
                 (declare (ignore type documentation))
                                        ;(format t "slot ~s = ~s ~s ~s ~s~%" name allocation inline-reader inline-writer inline-accessor)
                 #++(when fake-accessors
                   (let ((a (gensym)))
                     (push `(defmacro ,name (,a)
                              `(slot-value ,,a ,',name))
                           forms)))
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
                                        ;(format t "constructor = ~%")
        (print
         `(progn
            ,@(nreverse forms)
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
               (:%activation-record)
               (:push-null))
              (block nil
                ,@(cdr constructor))
              (%asm (:return-void)))
            ))))



    (defclass-swf cons-type (flash:object)
      (%car %cdr)
      (:fake-accessors t)
      (:constructor (a b)
        (setf (%car this) a)
        (setf (%cdr this) b)))

))

