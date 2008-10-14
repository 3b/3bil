(in-package :as3-compiler)

;;; copied from old code, not used yet...

#+nil
(defclass symbol-table ()
  ((variables :initform (make-hash-table) :accessor variables)
   (properties :initform (make-hash-table) :accessor properties)
   ;; not sure if constants work the same as properties yet, so
   ;; keeping separate for now
   ;; (static-properties might be a better name, if they are separate?)
   (constants :initform (make-hash-table) :accessor constants)
   (class-methods :initform (make-hash-table) :accessor class-methods)
   (classes :initform (make-hash-table) :accessor classes)))

#+nil
(defparameter *player-symbol-table* (make-instance 'symbol-table))

#+nil
(defparameter *symbol-table* (make-instance 'symbol-table))

#+nil
(defmacro declare-swf-class (name super &body _ &key swf-name constants properties methods)
  (declare (ignore super _))
  ;(format t "props = ~a ~%" properties)
  ;(format t "name = ~s  ~s eql=~s ~%" name (car (last (car properties))) (eql name (car (last (car properties)))))
  `(progn
     ;; using the old player-classes.lisp stuff for super for now, so
     ;; ignoring it...

     ;; store class name
     (setf (gethash ',name (classes *symbol-table*)) ,swf-name)
     ;; store constants
     ,@(loop for i in constants
          collect (destructuring-bind (name &key swf-name type) i
                    (declare (ignore type))
                      `(pushnew ,swf-name
                                (gethash ',name (constants *symbol-table*)
                                         (list))
                                 :test 'string=)))
     ;; store properties
     ,@(loop for i in properties
          append (destructuring-bind (pname &key swf-name type access declared-by) i
                     (declare (ignore access type))
                     (if (eql declared-by name)
                         `((pushnew ,swf-name
                                    (gethash ',pname (properties *symbol-table*)
                                             (list))
                                    :test 'string=))
                         nil)))
     ;; store methods
     ,@(loop for i in methods
          append (destructuring-bind (mname &key swf-name return-type
                                           declared-by args) i
                     (declare (ignore args return-type))
                     (if (eql declared-by name)
                         `((pushnew ,swf-name
                                    (gethash ',mname
                                             (class-methods *symbol-table*)
                                             (list))
                                    :test 'string=))
                         nil)))))