(in-package :avm2-compiler)

(defclass symbol-table ()
  ((functions :initform (make-hash-table :test 'equal) :accessor functions)
   ;; functions are really methods at the bytecode level, haven't
   ;; figured out how to make separate functions yet
   (variables :initform (make-hash-table) :accessor variables)
   (properties :initform (make-hash-table) :accessor properties)
   ;; not sure if constants work the same as properties yet, so
   ;; keeping separate for now
   ;; (static-properties might be a better name, if they are separate?)
   (constants :initform (make-hash-table) :accessor constants)
   (class-methods :initform (make-hash-table) :accessor class-methods)
   (static-methods :initform (make-hash-table) :accessor class-static-methods)
   (classes :initform (make-hash-table) :accessor classes)
   (inherited :initform nil :initarg :inherit :accessor inherited-symbol-tables)
   (setf-functions :initform (make-hash-table) :initarg :setf :accessor setf-functions)
   (macro-functions :initform (make-hash-table) :accessor macro-functions)
   (cmacro-functions :initform (make-hash-table) :accessor cmacro-functions)))

(defparameter *player-symbol-table* (make-instance 'symbol-table))

(defparameter *cl-symbol-table* (make-instance 'symbol-table :inherit (list *player-symbol-table*)))

(defparameter *symbol-table*
  (make-instance 'symbol-table :inherit (list *cl-symbol-table*)))

(defmacro define-swf-find-foo (name hash-accessors)
  `(defun ,name (symbol &optional (s *symbol-table*))
     (or (car (gethash symbol (,hash-accessors s)))
         (loop for i in (inherited-symbol-tables s)
            when (,name symbol i)
            return it))))
(define-swf-find-foo find-swf-method class-methods)
(define-swf-find-foo find-swf-static-method class-static-methods)
(define-swf-find-foo find-swf-property properties)
(define-swf-find-foo find-swf-constant constants)
(define-swf-find-foo find-swf-function functions)
(define-swf-find-foo find-swf-setf-function setf-functions)
(define-swf-find-foo find-swf-macro-function macro-functions)
(define-swf-find-foo find-swf-cmacro-function cmacro-functions)
;;(inherited-symbol-tables *symbol-table*)
;;(find-swf-static-method '%flash:random )

(defmacro define-swf-add-foo (name hash-accessor)
  `(defun ,name (symbol value &optional (s *symbol-table*))
     (setf (gethash symbol (,hash-accessor s))
           (list value))))

#+nil(define-swf-add-foo add-swf-property properties)
(define-swf-add-foo add-swf-macro-function macro-functions)
(define-swf-add-foo add-swf-cmacro-functions cmacro-functions)
(defun add-swf-property (symbol swf-name &optional (s *symbol-table*))
  (pushnew swf-name
           (gethash symbol (properties s) (list))
           :test 'string=))


(defmethod swf-name ((object (eql nil)))
  nil)

(defclass symbol-class-data ()
  ((name :initarg :name :accessor name)
   (ns :initarg :ns :accessor ns)
   (swf-name :initarg :swf-name :accessor swf-name)
   (extends :initform nil :initarg :extends :accessor extends)
   (implements :initform nil :initarg :implements :accessor implements)
   (properties :initform nil :initarg :properties :accessor properties)
   (functions :initform nil :initarg :functions :accessor functions)
   (class-properties :initform nil :initarg :class-properties :accessor class-properties)
   (class-functions :initform nil :initarg :class-functions :accessor class-functions)
   (constructor :initform nil :initarg :constructor :accessor constructor)))

(defun add-swf-class (name swf-name &key ns extends implements properties constructor functions class-properties class-functions)
  (setf (gethash name (classes *symbol-table*))
        (make-instance 'symbol-class-data :name name
                       :swf-name swf-name
                       :ns ns
                       :extends extends
                       :implements implements
                       :properties properties
                       :functions functions
                       :class-properties class-properties
                       :class-functions class-functions
                       :constructor constructor)))

(defun find-swf-class (symbol &optional (s *symbol-table*))
  (let ((c (or (gethash symbol (classes s))
               (loop for i in (inherited-symbol-tables s)
                  when (find-swf-class symbol i)
                  return it))))
    (unless c (format t "couldn't find class ~s~%" symbol) #+nil(break))
    c))

;;; handler for normal form evaluation, evaluate ARGS, and call
;;; function/member/whatever identified by OPERATOR
(defmethod scompile-cons (operator args)
  (let ((tmp))
    (cond
      #+nil((and (consp operator) (setf tmp (find-swf-setf-function (first operator) *symbol-table*)))
            ;;; not sure how to name setf-functions, probably keep a list of
            ;;; unnamed lambdas, and compile in references to those?
            ;;; or maybe add a top-level namespace for them?
            )
      ((consp operator) (error "cons in operator position not supported yet"))

      ;; if OPERATOR is a known method, call with %call-property
      ;;  (prop obj args...) === obj.prop(args)
      ((setf tmp (find-swf-method operator *symbol-table*))
       (scompile `(%call-property ,(first args) ,tmp ,@(rest args))))

      ;; if OPERATOR is a known static method, call with %call-lex-prop
      ;;  (prop obj args...) === obj.prop(args)
      ((setf tmp (find-swf-static-method operator *symbol-table*))
       (scompile `(%call-lex-prop ,(car tmp) ,(second tmp) ,@args)))

      ;; if OPERATOR is a known property (member var), call %get-property
      ;;  (:prop obj)
      ((setf tmp (find-swf-property operator *symbol-table*))
       (scompile `(%get-property ,(first args) ,tmp)))

      ;; normal function call, find-prop-strict + call-property
      ((setf tmp (find-swf-function operator *symbol-table*))
       (scompile `(%call-property-without-object ,(car tmp) ,@args)))

      ;; default = normal call?
      ;; fixme: might be nicer if we could detect unknown functions
      (t
       (scompile `(%call-property-without-object ,operator ,@args))
       #+nil(error " unknown function call? ~s ~s ~% " operator args)))))


#+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
  (find-swf-static-method 'flash:floor *symbol-table*))