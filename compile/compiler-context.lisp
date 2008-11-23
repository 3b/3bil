(in-package :avm2-compiler)

;;; copied from old code, not used yet...

(defclass symbol-table ()
  ((functions :initform (make-hash-table) :accessor functions)
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
   (inherited :initform nil :initarg :inherit :accessor inherited-symbol-tables)))

(defparameter *player-symbol-table* (make-instance 'symbol-table))

(defparameter *cl-symbol-table* (make-instance 'symbol-table :inherit (list *player-symbol-table*)))

(defparameter *symbol-table*
  (make-instance 'symbol-table :inherit (list *cl-symbol-table*)))

;; fixme: combine these?
(defun find-swf-method (symbol &optional (s *symbol-table*))
  (or (car (gethash symbol (class-methods s)))
      (loop for i in (inherited-symbol-tables s)
         when (find-swf-method symbol i)
         return it)))

(defun find-swf-static-method (symbol &optional (s *symbol-table*))
  (or (car (gethash symbol (class-static-methods s)))
      (loop for i in (inherited-symbol-tables s)
         when (find-swf-static-method symbol i)
         return it)))
;;(inherited-symbol-tables *symbol-table*)
;;(find-swf-static-method 'flash::math.random )

(defun find-swf-property (symbol &optional (s *symbol-table*))
  (or (car (gethash symbol (properties s)))
      (loop for i in (inherited-symbol-tables s)
         when (find-swf-property symbol i)
         return it)))

(defun find-swf-function (symbol &optional (s *symbol-table*))
  (or (car (gethash symbol (functions s)))
      (loop for i in (inherited-symbol-tables s)
         when (find-swf-function symbol i)
         return it)))


(defun find-swf-class (symbol &optional (s *symbol-table*))
  (or (gethash symbol (classes s))
      (loop for i in (inherited-symbol-tables s)
         when (find-swf-class symbol i)
         return it)))

;;; handler for normal form evaluation, evaluate ARGS, and call
;;; function/member/whatever identified by OPERATOR
(defmethod scompile-cons (operator args)
  (let ((tmp))
    (cond

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


