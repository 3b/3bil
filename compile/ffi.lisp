(in-package :avm2-compiler)


(defmacro declare-swf-class (class-name (&optional super) &body _ &key ((:swf-name class-swf-name)) constants properties methods)
  "declare an external class to be accessed through ffi"

  (declare (ignore _))
  ;(format t "props = ~a ~%" properties)
  ;(format t "name = ~s  ~s eql=~s ~%" name (car (last (car properties))) (eql name (car (last (car properties)))))
  `(progn
     ;; using the old player-classes.lisp stuff for super for now, so
     ;; ignoring it...

     ;; store class name
     (add-swf-class ',class-name ',class-swf-name :extends ',super)

     ;; store constants
     ,@(loop for i in constants
          collect (destructuring-bind (name &key swf-name type value static) i
                    (declare (ignore type value static))
                    `(pushnew (list ,class-swf-name ,swf-name)
                                (gethash ',name (constants *symbol-table*)
                                         (list))
                                 :test 'equal)))
     ;; store properties
     ,@(loop for i in properties
          append (destructuring-bind (pname &key swf-name type access declared-by value static accessor) i
                     (declare (ignore access type value declared-by))
                     (if static
                         `((add-swf-class-property ',pname ,swf-name)
                           ,@(when accessor
                                   `((add-swf-accessor ',accessor '(,swf-name ,class-swf-name)))))
                         `((add-swf-property ',pname ,swf-name)
                           ,@(when accessor
                                   `((add-swf-accessor ',accessor ,swf-name)))))))
     ;; store methods
     ,@(loop for i in methods
          append (destructuring-bind (mname &key swf-name return-type
                                            declared-by static args) i
                   (declare (ignore args return-type declared-by))
                   (if static
                       `((pushnew (list ',class-name ,swf-name)
                                  (gethash ',mname
                                           (class-static-methods *symbol-table*)
                                           (list))
                                  :test 'equal))
                       `((pushnew ,swf-name
                                  (gethash ',mname
                                           (class-methods *symbol-table*)
                                           (list))
                                  :test 'string=)))))))

#+-
(defmacro swf-ffi-defun-lex (lisp-name member (&rest args) return &key class)
  "declare a static member function of a class, for example Math.random()"
  (declare (ignore args return))
  `(pushnew (list ',class ,member)
            (gethash ',lisp-name
                     (class-static-methods *symbol-table*) (list))
            :test 'equal))

(defmacro swf-ffi-defun-find-prop-strict (lisp-name member (&rest args) return)
  "declare a function in a namespace?, for example flash.sampler:getMemberNames()"
  (declare (ignore args return))
  `(pushnew (list ,member)
            (gethash ',lisp-name
                     (functions *symbol-table*) (list))
            :test 'equal))

#+-
(defmacro old-swf-ffi-defun-lex (lisp-name class member (&rest args) return)
  "declare a static member function of a class, for example Math.random()"
  (declare (ignore args return))
  `(pushnew (list ,class ,member)
            (gethash ',lisp-name
                     (class-static-methods *symbol-table*) (list))
            :test 'equal))

(defmacro swf-ffi-defconstant (lisp-name member type)
  "declare a top level constant, for example NaN"
  (declare (ignore type))
  `(pushnew (list "" ,member)
            (gethash ',lisp-name
                     (constants *symbol-table*) (list))
            :test 'equal))

#+-
(defmacro swf-ffi-defconstant-lex (lisp-name class member type)
  "declare a constant member of a class, for example Math.PI"
  (declare (ignore type))
  `(pushnew (list ,class ,member)
            (gethash ',lisp-name
                     (constants *symbol-table*) (list))
            :test 'equal))

#+-
(defmacro swf-ffi-defmethod (lisp-name member (&rest args) return)
  "declare a member function of a class, for example array.concat()"
  (declare (ignore args return))
  `(pushnew ',member
            (gethash ',lisp-name
                     (class-methods *symbol-table*) (list))
            :test 'string=))

#+-
(defmacro old-swf-ffi-defmethod (lisp-name type member (&rest args) return)
  "declare a member function of a class, for example array.concat()"
  (declare (ignore type args return))
  `(pushnew ',member
            (gethash ',lisp-name
                     (class-methods *symbol-table*) (list))
            :test 'string=))



#+-
(define-special %call-property (object property &rest args)
  ;; (%call-property object property args) -> value
  ;;(format t "call property ~s . ~s ( ~s ) ~%" (first cdr) (second cdr) (third cdr))
  `(,@(scompile object) ;; find the object
      ,@(loop for i in args
           append (scompile i)) ;; calculate args
      (:call-property ,property ,(length args)))) ;; call it

#+-
(define-special %get-property (object property-name)
  ;; (%get-property object property) -> value
  ;;(format t "get property ~s . ~s ~%" (first cdr) (second cdr))
  `(,@(scompile object) ;; find the object
      ;; fixme: look up properties for real?
      (:get-property ,property-name)))

#+-
(define-special %call-property-without-object (property &rest args)
  ;; (%call-property-without-object property args) -> value
  ;;(format t "call property without object * . ~s ( ~s ) ~%" property args)
  `((:find-property-strict ,property) ;; find obj with prop
    ,@(loop for i in args
         append (scompile i)) ;; calculate args
    (:call-property ,property ,(length args)))) ;; call it

#+-
(define-special %get-property-without-object (property)
  `((:find-property-strict ,property)
    (:get-property ,property)))



;;; not sure if these are needed or not, or if api is right, just
;;; copied from old code
#+-
(define-special %set-property (object property value)
  ;; (%set-property object property value) -> value
  ;;(format t "set property ~s . ~s = ~s ~%" (first cdr) (second cdr) (third cdr))
  `(,@(scompile value) ;; calculate value
      (:dup) ;; leave a copy on stack so we can return it
      ,@(scompile object) ;; find the object
      (:swap)                   ;; stack => return-value object value
      (:set-property ,(or (find-swf-property property) property))))

;; used by stuff like Math.random(), etc
#+-
(define-special %call-lex-prop (object-name property &rest args)
  ;; fixme: better name for this?
  ;; (%call-lex-prop object-name property args) -> value
  ;;(format t "call proplex ~s . ~s ( ~s ) ~%" (first cdr) (second cdr) (third cdr))
  `((:get-lex ,(if (find-swf-class object-name)
                   (swf-name (find-swf-class object-name))
                   object-name)) ;; find the object
    ,@(loop for i in args
         append (scompile i)) ;; calculate args
    (:call-property ,property ,(length args))))

;; used by stuff like Math.random(), etc
#+-
(define-special %get-lex-prop (object-name property)
  ;; fixme: better name for this?
  `((:get-lex ,(if (find-swf-class object-name)
                   (swf-name (find-swf-class object-name))
                   object-name)) ;; find the object
    (:get-property ,(if (find-swf-class property)
                   (swf-name (find-swf-class property))
                   property))))


#+nil
(define-special %get-lex (name)
  ;; (%get-lex object-name ) -> value
  `((:get-lex ,name)))


#+nil
(print (swf-defmemfun bleh (arg)
         (let ((canvas (%asm (:new (qname "flash.display" "Sprite") 0))))
           (:add-child arg canvas))
         ))

#+-
(define-special %new (class arg-count)
  (let ((name (typecase class
                (symbol
                 (let ((c (find-swf-class class)))
                   (assert c) ;; fixme: better error reporting
                   (swf-name c)))
                (t class))))
    ;;fixme: does this actually work with arguments?
    `((:find-property-strict ,name)
      (:construct-prop ,name ,arg-count)
      #+nil(:coerce ,name)
      (:coerce-any))))

;; fixme: replace %new with this
#+-
(define-special %new* (class &rest args)
  (let ((name (typecase class
                (symbol
                 (let ((c (find-swf-class class)))
                   (assert c) ;; fixme: better error reporting
                   (swf-name c)))
                (t class))))
    `((:find-property-strict ,name)
      ,@(loop for i in args
           append (scompile i))
      (:construct-prop ,name ,(length args))
      (:coerce-any))))

;; (avm2-asm:assemble (scompile '(%new flash.text:Text-Field 0)))
;; (avm2-asm:assemble (scompile '(%new "flash.text:TextField" 0)))
;; (avm2-asm:assemble (scompile '(%new "flash.text::TextField" 0)))
;; (avm2-asm:assemble (scompile '(%new (:qname "flash.text" "TextField") 0)))

