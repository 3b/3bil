(in-package :as3-compiler)

;;; 
(defclass compiler-context ()
  ((class-names :initform () :accessor class-names)
   (function-names :initform () :accessor function-names)))

(defparameter *compiler-context* (make-instance 'compiler-context))

;;; track data about a lambda (or scope in general, defun/let/etc)
;;;   local variables, etc
(defclass lambda-context ()
  ;; using an alist for local name-index mapping, so we can push/pop
  ;; state a bit more easily than with hash tables...
  ((locals :initform () :accessor locals)
   (tags :initform () :accessor tags)))

(defparameter *current-lambda* nil)

(defun make-lambda-context (args)
  (let ((lc (make-instance 'lambda-context)))
    (push (cons 'this 0) (locals lc))
    (loop for i in args
       for j from 1
       do (push (cons i j) (locals lc)))
    (format t "lambda context lc = ~s ~%" (locals lc))
    lc))

(defun get-lambda-local-index (name)
  (cdr (assoc name (locals *current-lambda*) :test 'string=)))

(defmacro with-lambda-context ((&rest args) &body body)
  `(let ((*current-lambda* (make-lambda-context '(,@args))))
     ,@body))

(defmacro with-nested-lambda-context (&body body)
  ;;; probably broken, copied from old code...
  ;;; seems like this should have a special per namespace, and bind those
  ;;; so we can restore previous state, or else copy previous state into a
  ;;; new object of we keep a single object
  `(let ((*current-lambda* *current-lambda*))
     ,@body))

;;; top level (internal?) compiler interface
;;; returns assembly corresponding to FORM
(defgeneric  scompile (form))

(defmethod scompile ((form string))
  `((:push-string ,form)))

(defmethod scompile ((form integer))
  ;; possibly should have more control than just assuming anything < 2^31
  ;; is int (as well as range checking, etc)
  (if (> form (expt 2 31))
      `((:push-uint ,form))
      `((:push-int ,form))))

(defmethod scompile ((form real))
  `((:push-double ,form)))

(defmethod scompile ((form symbol))
  (let ((i (get-lambda-local-index form)))
    (if i
        `((:get-local ,i))
        (error "unknown local ~s?" form))))

(defmacro define-constants (&body constants)
  `(progn
     ,@(loop for i in constants
          collect `(defmethod scompile ((form (eql ,(car i))))
                     '((,(second i)))))))
(define-constants
  (:true :push-true)
  (:false :push-false)
  (:nan :push-nan)
  (:undefined :push-undefined)
  (:null :push-null)
  (nil :push-null))

;;; interface for implementing special forms

(defgeneric scompile-cons (car cdr))

(defmethod scompile ((form cons))
  (scompile-cons (car form) (cdr form)))

(defmacro define-special (name (&rest args) &body body)
  "define a special operator, destructuring form into ARGS"
  (let ((car (gensym "CAR"))
        (cdr (gensym "CDR")))
    `(defmethod scompile-cons ((,car (eql ',name)) ,cdr)
       (destructuring-bind ,args ,cdr
         ,@body))))


(defmacro define-special* (name (cdr) &body body)
  "define a special operator without any destructuring"
  (let ((car (gensym "CAR")))
    `(defmethod scompile-cons ((,car (eql ',name)) ,cdr)
       ,@body)))

#||
(scompile "foo")
(scompile :true)
(scompile 123.45)
||#