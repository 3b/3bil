(in-package :avm2-compiler)

(defparameter *lexenv* nil)

(defclass lexical-environment ()
  (
   ;;; alist of name -> binding for variables/constants,
   ;;;  or name -> (:macro . expansion) for symbol macros
   ;;; bindings = :local, :closure, ? for now
   ;;; or maybe (:local . index) while translating from old code...
   ;;; eventually local assignment needs to be late enough to decide
   ;;; if variables are closed over or not
   (variables :initform () :initarg variables :accessor variables)
   ;;; alist of name -> ? for local functions
   ;;  local = name -> (:function label lambda)
   ;;  name -> (:macro . macro-function) for macrolets
   ;;  (possibly name -> ? for globals as well?)
   (functions :initform () :initarg functions :accessor functions)
   ;; go tags
   (tags :initform () :initarg tags :accessor tags)
   ;; active blocks
   (blocks :initform () :initarg blocks :accessor blocks)
   ;; enclosing env
   (parent :initform nil :initarg parent :accessor parent)))

(defmethod variables ((object null)) nil)
(defmethod functions ((object null)) nil)
(defmethod tags ((object null)) nil)
(defmethod blocks ((object null)) nil)

(defun lexenv-get-variable-binding (form &optional (*lexenv* *lexenv*))
  (cdr (assoc form (variables *lexenv*))))

(defun lexenv-get-function-binding (form &optional (*lexenv* *lexenv*))
  ;; can't just use assoc directly, since we want to be able to match
  ;; (setf foo)
  (cdr (assoc-if (lambda (a) (equal a form)) (functions *lexenv*))))

(defun make-expanded-environment (&key variables functions tags blocks)
  ;;(format t "~%=~s~%" variables)
  (make-instance 'lexical-environment
                  'variables (append variables (variables *lexenv*))
                  'functions (append functions (functions *lexenv*))
                  'tags (append tags (tags *lexenv*))
                  'blocks (append blocks (blocks *lexenv*))))

(defparameter *alpha-name-prefix* (format nil " #~c" #\Nul)
  "garbage chars prepended to alphatized variable names to avoid
conflicts with real variable/member/method/etc names from
actionscript code")

#+nil(defun alpha-convert-name (sym)
  (gensym (format nil "~a ~a #" *alpha-name-prefix* (symbol-name sym))))
(defun alpha-convert-name (sym &optional (prefix ""))
  (gensym (format nil "~a###__~a__###" prefix sym)))

(defun alphatize-var-names (names)
  (loop for i in names
        collect (list i (alpha-convert-name i))))

(defmacro with-local-vars (locals &body body)
  `(let ((*lexenv* (make-expanded-environment
                    :variables (loop for (name new-name) in ,locals
                                     collect `(,name . (:local . ,new-name))))))
     ,@body))

(defmacro with-symbol-macros (symbol-macros &body body)
  `(let ((*lexenv* (make-expanded-environment
                    :variables (loop for (sym expansion) in ,symbol-macros
                                     collect `(,sym . (:macro . ,expansion))))))
     ,@body))

(defmacro with-local-macros (bindings &body body)
  `(let ((*lexenv* (make-expanded-environment
                    :functions (loop for (sym lambda) in ,bindings
                                     collect `(,sym . (:macro .
                                                        ,lambda))))))
     ,@body))

(defmacro with-local-functions (bindings &body body)
  `(let ((*lexenv* (make-expanded-environment
                    :functions (loop for (sym label) in ,bindings
                                     collect `(,sym . (:function
                                                         ,label))))))
     ,@body))

(defmacro with-block-tag (tag &body body)
  `(let ((*lexenv*
          (make-expanded-environment
           ;; fixme: what should be stored in each tag?
           :blocks (list ,tag))))
     ,@body))

(defmacro with-tags (tags &body body)
  `(let ((*lexenv*
          (make-expanded-environment
           :tags (loop for i in ,tags
                       collect `(,i . (:tag . ,(gensym
                                                (format nil "TAG-~a-"
                                                        (etypecase i
                                                          (integer (format nil "#~d" i))
                                                          (symbol (symbol-name i)))))))))))
     ,@body))

(defun get-block (tag &optional (env *lexenv*))
  (cdr (assoc tag (blocks env))))
(defun get-tag (tag &optional (env *lexenv*))
  (cdr (assoc tag (tags env))))
