(in-package :avm2-asm)


(defclass avm2sym ()
  ((string-id :initform nil :initarg string-id :accessor string-id)
   (namespace-id :initform nil :initarg namespace-id :accessor namespace-id)
   (method-id :initform nil :initarg method-id :accessor method-id)
   (class-id :initform nil :initarg class-id :accessor class-id)))

(defclass assembler-context ()
  ;; avm2 constant pools are 1 based, so we start them at 1 here, and
  ;; skip the first entry on write
  ((ints :initform (make-array 32 :fill-pointer 1 :adjustable t) :reader ints)
   (uints :initform (make-array 32 :fill-pointer 1 :adjustable t) :reader uints)
   (doubles :initform (make-array 32 :fill-pointer 1 :adjustable t) :reader doubles)
   (strings :initform (make-array 32 :fill-pointer 1 :adjustable t) :reader strings)
   (namespaces :initform (make-array 32 :fill-pointer 1 :adjustable t) :reader namespaces)
   (ns-sets :initform (make-array 32 :fill-pointer 1 :adjustable t) :reader ns-sets)
   (multinames :initform (make-array 32 :fill-pointer 1 :adjustable t) :reader multinames)
   ;;;
   (method-infos :initform (make-array 32 :fill-pointer 0 :adjustable t) :reader method-infos)
   (metadata :initform (make-array 32 :fill-pointer 0 :adjustable t) :reader metadata)
   ;; possibly should store classes and instances together, or
   ;; otherwise enforce them being the same length...
   (classes :initform (make-array 32 :fill-pointer 0 :adjustable t) :reader classes)
   (instances :initform (make-array 32 :fill-pointer 0 :adjustable t) :reader instances)
   (scripts :initform (make-array 32 :fill-pointer 0 :adjustable t) :reader scripts)
   (method-bodies :initform (make-array 32 :fill-pointer 0 :adjustable t) :reader method-bodies)

   ;; strings seem immutable, so combining all string literals

   ;; probably should eventually do this for all constants
   (string-intern-hash :initform (make-hash-table :test 'equal) :reader string-intern-hash)
   (multiname-hash :initform (make-hash-table :test 'equalp) :reader multiname-hash)
   (ns-set-hash :initform (make-hash-table :test 'equalp) :reader ns-set-hash)
   ;; we need to put method indices directly into code for
   ;; closures/anonymous lambdas, and eventually for implementing load
   ;; time part of defun, so store a symbol->index mapping here, and allocate
   ;; a blank method_info on demand (for usage site or definition)
   (method-id-hash :initform (make-hash-table) :reader method-id-hash)))


(defparameter *assembler-context* (make-instance 'assembler-context))
(defparameter *empty-sym* (make-instance 'avm2sym 'string-id 1 'namespace-id 1
                                         'method-id 1 'class-id 1))
(defun avm2-intern (string-designator)
  (let ((string (and string-designator (string string-designator))))
    (if (or (not string) #+()(string= string ""))
        *empty-sym*
        (let ((i (gethash string (string-intern-hash *assembler-context*)))
              (j (length (strings *assembler-context*))))
          (if i
              (progn
                ;;(format t "used interned string ~a = ~d ~%" string i)
                i)
              (progn
                ;;(format t "interning ~a = ~d ~%" string j)
                (vector-push-extend string (strings *assembler-context*))
                (setf (gethash string (string-intern-hash *assembler-context*))
                      (make-instance 'avm2sym 'string-id j))))))))
(defun avm2-string (s)
  (string-id (avm2-intern s)))

(defun avm2-intern-int (int)
  ;;fixme: write a real version of this
  ;;(format t "intern int ~a ~%" int)
  (loop with a = (ints *assembler-context*)
     for i from 1 below (length a)
     when (= int (aref a i))
     return i
     finally (return (prog1
                         (length a)
                       (vector-push-extend int a)))))

(defun avm2-intern-uint (int)
  ;;fixme: write a real version of this
  (loop with a = (uints *assembler-context*)
     for i from 1 below (length a)
     when (= int (aref a i))
     return i
     finally (return (prog1
                         (length a)
                       (vector-push-extend int a)))))

(defun avm2-intern-double (double)
  ;;fixme: write a real version of this
  (loop with a = (doubles *assembler-context*)
     with d = (float double 1d0)
     for i from 1 below (length a)
     when (= d (aref a i))
     return i
     finally (return (prog1
                         (length a)
                       (vector-push-extend d a)))))


;;;;;; namespace.kind values
(defparameter +namespace+           #x08)
(defparameter +package-namespace+   #x16)
(defparameter +package-internal-ns+ #x17)
(defparameter +protected-namespace+ #x18)
(defparameter +explicit-namespace+  #x19)
(defparameter +static-protected-ns+ #x1a)
(defparameter +private-ns+          #x05)

(defun avm2-ns-intern (string-designator &key (kind +package-namespace+))
  (let ((sym (avm2-intern string-designator)))
    (if (namespace-id sym)
        (namespace-id sym)
        (prog1
            (setf (namespace-id sym) (length (namespaces *assembler-context*)))
          (vector-push-extend (list kind (string-id sym))
                              (namespaces *assembler-context*))))))

(defun avm2-ns-set-intern (namespaces)
  (let* ((ns-ids (loop for i in namespaces
                     when (numberp i)
                     collect i
                     else
                     collect (avm2-ns-intern i)))
         (id (gethash ns-ids (ns-set-hash *assembler-context*))))
    (if id
        id
        (prog1
          (setf (gethash ns-ids (ns-set-hash *assembler-context*))
                (length (ns-sets *assembler-context*)))
          (vector-push-extend ns-ids (ns-sets *assembler-context*))))))


;;; multiname.kind values
(defparameter +qname+        #x07)
(defparameter +qname-a+      #x0d)
(defparameter +rt-qname+     #x0f)
(defparameter +rt-qname-a+   #x10)
(defparameter +rt-qname-l+   #x11)
(defparameter +rt-qname-la+  #x12)
(defparameter +multiname+    #x09)
(defparameter +multiname-a+  #x0e)
(defparameter +multiname-l+  #x1b)
(defparameter +multiname-la+ #x1c)

(defun intern-multiname (kind ns name)
  (let* ((ns (avm2-ns-intern ns))
         (name (avm2-string name))
         (mn (list kind ns name))
         (id (gethash mn (multiname-hash *assembler-context*))))
    (if id
        id
        (progn
          (vector-push-extend mn (multinames *assembler-context*))
          (setf (gethash mn (multiname-hash *assembler-context*))
                (1- (length (multinames *assembler-context*))))))))

(defun intern-multiname-l (kind &rest ns-list)
  (let* ((ns-set (avm2-ns-set-intern ns-list))
         (mn (list kind ns-set))
         (id (gethash mn (multiname-hash *assembler-context*))))
    (if id
        id
        (progn
          (vector-push-extend mn (multinames *assembler-context*))
          (setf (gethash mn (multiname-hash *assembler-context*))
                (1- (length (multinames *assembler-context*))))))))

(defun qname (ns name)
  (intern-multiname +qname+ ns name))


(defun parsed-qname (name)
  (let ((p (if (stringp name) (position #\: name :test 'char=))))
    (cond
      ;; fixme: combine parsing of (:qname-foo ...) with asm-intern-multiname
      ((and (consp name) (eq (car name) :qname-l))
       (intern-multiname +rt-qname-l+ "" ""))
      (p
       (qname (subseq name 0 p) (subseq name (position #\: name :start p :test-not 'char=))))
      (t (qname "" name)))))

;;; instance_info.flags values

(defparameter +class-sealed+       #x01)
(defparameter +class-final+        #x02)
(defparameter +class-interface+    #x04)
(defparameter +class-protected-ns+ #x08)


;;; fixme: probably should make an effort to avoid duplicates or something?
(defun avm2-class (name-mn super-mn flags interfaces instance-init traits class-init &key protected-ns class-traits )
  (let ((class-id (length (classes *assembler-context*))))
    (vector-push-extend (list name-mn super-mn flags interfaces
                              instance-init traits protected-ns)
                        (instances *assembler-context*))
    (vector-push-extend (cons class-init class-traits)
                        (classes *assembler-context*))
    class-id))


(defun intern-method-id (id)
  ;; id might be function name, or gensym for anonymous lambdas
  (let* ((index (gethash id (method-id-hash *assembler-context*))))
    (if index
        index
        (progn
          (vector-push-extend nil (method-infos *assembler-context*))
          (setf (gethash id (method-id-hash *assembler-context*))
                (1- (length (method-infos *assembler-context*))))))))

(defun avm2-method (label name param-types return-type flags &key option-params pnames body)
  ;; name is mn-pool-id for the name in the method_info struct
  ;; label is a symbol identifying the method so its ID can be looked up
  ;;   to compile into other functions, and isn't intended to appear in
  ;;   the .swf anywhere
  ;; (label can be NIL to generate a name automatically if no other
  ;;  refs are needed aside from caller)
  (let* ((label (or label (gensym "avm2-method-label")))
         (method-id (intern-method-id label)))
    (when body (setf flags (logior flags (flags body))))
    ;;; todo: handle multiple method definitions better (or decide if it needs handled at all)
    (assert (null (aref (method-infos *assembler-context*) method-id))
            () "duplicate method for ~s (~s)?" name label)
    (setf (aref (method-infos *assembler-context*) method-id)
          (list name
                (mapcar 'asm-intern-multiname param-types)
                (asm-intern-multiname return-type)
                flags option-params pnames))
    (setf (method-id body) method-id)
    (vector-push-extend body (method-bodies *assembler-context*))
    method-id))


(defclass trait-info ()
  ((name :initarg name :accessor name)
   (trait-data :initarg trait-data :accessor trait-data)
   (metadata :initarg metadata :accessor metadata)))

(defclass trait-data-slot/const ()
  ((kind :initform 0 :initarg kind :accessor kind) ;; 0 or 6
   (slot-id :initarg slot-id :accessor slot-id)
   (type-name :initarg type-name :accessor type-name)
   (vindex :initarg vindex :accessor vindex)
   (vkind :initarg vkind :accessor vkind)))

(defclass trait-data-class ()
  ((kind :initform 4 :initarg kind :accessor kind)
   (slot-id :initarg slot-id :accessor slot-id)
   (classi :initarg classi :accessor classi)))


(defclass trait-data-function ()
  ((kind :initform 5 :initarg kind :accessor kind)
   (slot-id :initarg slot-id :accessor slot-id)
   (fn :initarg function :accessor fn)))


(defclass trait-data-method/get/set ()
  ((kind :initform 1 :initarg kind :accessor kind) ;;1 2 3
   (slot-id :initarg slot-id :accessor slot-id)
   (method-id :initarg method :accessor method-id)))


(defclass exception-info ()
  ((from :initarg from :accessor from)
   (to :initarg to :accessor to)
   (target :initarg target :accessor target)
   (exc-type :initarg exc-type :accessor exc-type)
   (var-name :initarg var-name :accessor var-name)))


(defun qname-string (mn-id)
  (let* ((mn (aref (multinames *assembler-context*) mn-id))
         (ns (second mn))
         (name (third mn)))
    (setf name (if name (aref (strings *assembler-context*) name) ""))
    (setf ns (if ns
                 (aref (strings *assembler-context*)
                       (second (aref (namespaces *assembler-context*) ns)))
                 ""))
    (if (string= ns "")
        name
        (format nil "~a:~a" ns name ))))

#+(or)(let ((*assembler-context* (make-instance 'assembler-context)))
      (qname "baz baz"  "bleh")
      (format t "~s ~%" (multinames *assembler-context*))
      (format t "--~a =  ~a ~%" (qname "foo" "bar")
              (qname-string (qname "foo" "bar")))
      (loop for i from 0
         for j across (multinames *assembler-context*)
         do (format t " mn ~a = ~a ~%" i j))

      (loop for i from 0
         for j across (strings *assembler-context*)
         do (format t " string ~a = ~a ~%" i j))

      (loop for i from 0
         for j across (namespaces *assembler-context*)
         do (format t " ns ~a = ~a ~%" i j))

      (format t "--~a =  ~a ~%" (qname "" "bar") (qname-string (qname "" "bar"))))





