;;; util to convert playerglobal.extracted.lisp into more useful format
;;;

(error "run this stuff by hand...")

;; format notes:
;;   set default float format to double
;;   need to recognize:
;;      Infinity, -Infinity, NaN, undefined

;; top level forms: :class :interface :constant :method

;; (:class name &key extends implements public final dynamic properties)
;; :interface = :class
;; (:method  name arg-list return-type &key namespace-type static final native uri override)
;; (:constant &key name type value static namespace-type)

;; forms valid in properties field of class:
;;   :constant :method = same as top level
;;   :method-get, :method-set = same as :method
;;   :constructor = same as :method ?
;;   :variable = same as :constant

;; namespace-types = :private, :public, :internal, :static.protected

;;; to generate:
;;  export list (library-packages.lisp)
;;  class hierarchy? (player-classes.lisp)
;;  wrappers (player-lib.lisp, player-class-decl.lisp)


;;;;;;;;;;;;;;;;;;;
(defparameter *odd* nil)
(let ((cl-ppcre:*regex-char-code-limit* 256))
  (defparameter *scanners*
    (loop for i in  '("^I([A-Z][a-z])" ":I([A-Z][a-z])" ;; interfaces

                      ;;; special cases that shuoldn't match the acronym stuff
                      ;; possibly should just not use the XML to -xml
                      ;; stil regexes on names that only have
                      ;; uppercase letters, so we don't need to
                      ;; special case the words with which they conflict?
                      "CAPTURING_PHASE" "TIMER" "SECURITY" "COMPOSITION"
                      "ACTIONSCRIPT" "SHADER" "WIDE" "DIVIDE" "PROPORTIONAL"
                      "WIDTH" "IDEOGRAPHIC" "INVALID" "VALID" "PRIORITIZE"
                      "INSTRUCTION" "DECLARATION" "QUATERNION" "CONNECTIONS"
                      ;;; handle upper case acronyms/abbreviations in
                      ;;; CamelCase identifiers
                      "XML" "URI" "NaN" "URL" "CSM" "SQL" "AVM1"
                      "SWF" "EOF" "IO" "DRM" "HTML" "HTTP" "IME"
                      "PDF" "ID3" "ID" "OLAP" "HLOC" "AIR" "RSL"
                      "UI" "JPEG" "PNG" "AMF" "SOAP" "MXML" "WSDL"
                      "CSS" "SHA" "UID" "UTF" "TLS" "UTC" "FPS"
                      ;;; special cases
                      "QName" "3DTo" "IBEAM" "CFFHinting"
                      "SQRT1_2" "RETURNINDEXEDARRAY" "UNIQUESORT"
                      "CASEINSENSITIVE" "ThreeDTranslationHandlePoints"
                      "scale9Grid"
                      )
       collect (cl-ppcre:create-scanner i)))
  (defun lispify-name (n)
    (setf n (or n ""))
    (loop for i in *scanners*
       for j in '( "i-\\1" ":i-\\1"

                  "capturing-phase" "timer" "security" "composition"
                  "actionscript" "shader" "wide" "divide" "proportional"
                  "width" "ideographic" "invalid" "valid" "prioritize"
                  "instruction" "declaration" "quaternion" "connections"

                  "-xml" "-uri" "-nan" "-url" "-csm" "-sql" "-avm1"
                  "-swf" "-eof" "-io" "-drm" "-html" "-http" "-ime"
                  "-pdf" "-id3" "-id" "-olap" "-hloc" "-air" "-rsl"
                  "-ui" "-jpeg" "-png" "-amf" "-soap" "-mxml" "-wsdl"
                  "-css" "-sha" "-uid" "-utf" "-tls"  "-utc" "-fps"

                  "Q-name" "3d-to" "i-beam" "cff-hinting"
                  "sqrt-1/2" "return-indexed-array" "unique-sort"
                  "case-insensitive" "three-d-translation-handle-points"
                  "scale-9-grid")
       do (setf n (cl-ppcre:regex-replace-all i n j)))
    (coerce (loop
               for last = nil then i
               for i across (string n)
               if (char= i #\_)
               do (setf i #\-)
               if (and last (lower-case-p last) (upper-case-p i))
               collect #\-
               if (or last (not (char= i #\-)))
               collect (char-downcase i)
               when (and last (upper-case-p last) (upper-case-p i))
               do (push n *odd*))
            'string)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *symbols* (make-hash-table :test 'equal))
(defparameter *public-symbols* (make-hash-table :test 'equal))
(defparameter *class-forms* nil)
(defparameter *top-level-method-forms* nil)
(defparameter *top-level-constant-forms* nil)
(defparameter *current-class* nil)

(defun add-% (name)
  (if (char= (char (string name) 0) #\%)
      name
      (format nil "%~a" name)))

(defclass class-junk ()
  ((methods :initform nil :accessor methods)
   (constants :initform nil :accessor constants)
   (variables :initform nil :accessor variables)))

(defparameter *current-namespace* "%flash")

(defun add-name (name &key ns-type ((:ns *current-namespace*) *current-namespace*))
  (unless *current-namespace* (break))
  (let ((sep "::"))
    (pushnew name (gethash *current-namespace* *symbols* nil) :test 'equal)
    (unless (member ns-type '(:private :public :internal :static.protected nil))
      (format t "unknown namespace type ~s~%" ns-type))
    (unless (member ns-type '(:private :internal :static-protected))
      (setf sep ":")
      (pushnew name (gethash *current-namespace* *public-symbols* nil) :test 'equal))
    (concatenate 'string *current-namespace* sep name)))

(defun parse-class-name (name)
  (let* ((name-start (position #\: name :from-end t :test 'char=))
         (package-start (when name-start (position #\: name :from-end t :end (- name-start 2)))))
    ;; name package qualifier
    (values (subseq name (1+ (or name-start -1)))
            (when name-start
              (subseq name (1+ (or package-start -1)) (1- name-start)))
            (when package-start (subseq name 0 (1- package-start))))))


(defun mangle (name &key constantp)
  (if constantp
      (format nil "+~a+" (lispify-name name))
      (lispify-name name)))

(defun mangle-type-name (name)
  (multiple-value-bind (class-name ns qualifier)
      (parse-class-name name)
    (declare (ignore qualifier))
    (if ns
        (format nil "%~a:~a" ns (mangle class-name))
        (format nil "%flash:~a" (mangle class-name)))))

(defun parse-constant (tag &key name type value static namespace-type top-level)
  (unless (member namespace-type '(:private :internal :static-protected))
    (let ((lisp-name (add-name (mangle name :constantp (eq tag :constant))
                               :ns-type namespace-type)))
      (if top-level
          ;; top-level= (def lisp-sym swf-name type
          (push (format nil "(swf-ffi-defconstant ~a ~s ~s)" lisp-name name type) *top-level-constant-forms*)
          ;; inside a class
          (if (eq tag :constant)
              (push (format nil "(~a :swf-name ~s :type ~s :value ~s)" lisp-name name type value)
                    (constants *current-class*))
              (push (format nil "(~a :swf-name ~s :type ~s :value ~s :static ~s)" lisp-name name type value static)
                    (variables *current-class*)))))))

(defun parse-class (type name &key extends implements public final dynamic properties)
  (multiple-value-bind (class-name ns qualifier)
      (parse-class-name name)
    (declare (ignore qualifier))
    (let* ((*current-namespace* (add-% (or ns *current-namespace*)))
           (lisp-name (add-name (mangle class-name)))
           (*current-class* (make-instance 'class-junk)))
      (loop for form in properties
         do
         (ecase (car form)
           (:constant (apply 'parse-constant form))
           (:variable (apply 'parse-constant form))
           (:method (apply 'parse-method  (append form `(:class ,lisp-name))))
           (:method-get (apply 'parse-method (append form `(:class ,lisp-name))))
           (:method-set (apply 'parse-method (append form `(:class ,lisp-name))))
           (:constructor (apply 'parse-method (append form `(:class ,lisp-name))))))
      (push
       (format nil "(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class ~a (~a)
    :swf-name ~s
    :constants
    (~{~a~^~%     ~})
    :properties
    (~{~a~^~%     ~})
    :methods
    (~{~a~^~%     ~})))~%"
               lisp-name (if extends (mangle-type-name extends) "")
               name
               (constants *current-class*)
               (variables *current-class*)
               (methods *current-class*)
               )
       *class-forms*)
      )))

(defun parse-method (type name arg-list return-type &key namespace-type static final native uri override top-level class)
  (declare (ignorable namespace-type final native override))
  (unless (member namespace-type '(:private :internal :static-protected))
    (let* ((lisp-name (add-name (mangle name) :ns-type namespace-type :ns (add-% (or uri *current-namespace*))))
           (static-or-global (or top-level static (member type '(:constructor :function))))
           (top-wrapper-macro (if static-or-global
                                  (if class
                                      "swf-ffi-defun-lex"
                                      "swf-ffi-defun-find-prop-strict")
                                  "swf-ffi-defmethod")))
      (if static-or-global
          ;; top-level/static = "(def sym swf-name args return)"
          (push
           (format nil "(~a ~a ~s~%    ~s ~s~a)"
                   top-wrapper-macro lisp-name
                   (if uri (format nil "~a:~a" uri name) name)
                   arg-list return-type
                   (if class (format nil " :class ~a" class) ""))
           *top-level-method-forms*)
          ;; inside class (but not static)
          (if (member type '(:method-get :method-set))
              ;; ** get/set look like variables to callers
              ;; fixme: don't add twice when we have get and set, and handle type better
              (push (format nil "(~a :swf-name ~s :type ~s :static ~s)" lisp-name name return-type static)
                    (variables *current-class*))
              ;; normal methods
              (push
               (format nil "(~a :swf-name ~s :return-type ~s~%        :args ~s)" lisp-name name
                       return-type arg-list)
               (methods *current-class*)))
          ))))

(defun parse-form (form)
  (ecase (car form)
    (:constant (apply 'parse-constant (append form '(:top-level t))))
    (:class (apply 'parse-class form))
    (:interface (apply 'parse-class form))
    (:method (apply 'parse-method (append form '(:top-level t)) ))))

#+nil
(let ((*symbols* (make-hash-table :test 'equal))
      (*public-symbols* (make-hash-table :test 'equal))
      (*current-namespace* "%flash")
      (*class-forms* nil)
      (*top-level-method-forms* nil)
      (*top-level-constant-forms* nil))
  ;; read the data
  (add-name "void")
  (add-name "*")
  (with-open-file (s "lib/playerglobal.extracted.lisp")
    (loop with eof = (gensym)
       for form = (let ((*read-default-float-format* 'double-float))
                    (read s nil eof))
       until (eq form eof)
       do (parse-form form)))
  ;; write the defpackage forms
  (with-open-file (ffi-packages "lib/player-ffi-packages.lisp" :direction :output :if-exists :supersede)
    (format ffi-packages ";;; --generated file, do not edit--~%~%")
    (format ffi-packages "(in-package :avm2-compiler)~%")
    (loop
       for k being the hash-keys of *public-symbols* using (hash-value v)
       do (format ffi-packages "(defpackage #:~a~%  (:export~{~%    #:~a~}))~%~%" k v)))
  ;; write the ffi wrappers
  (with-open-file (ffi-defs "lib/player-ffi-defs.lisp" :direction :output :if-exists :supersede)
    (format ffi-defs ";;; --generated file, do not edit--~%~%")
    (format ffi-defs "(in-package :avm2-compiler)~%")
    (format ffi-defs "(clrhash (functions *player-symbol-table*))~%")
    (format ffi-defs "(clrhash (variables *player-symbol-table*))~%")
    (format ffi-defs "(clrhash (properties *player-symbol-table*))~%")
    (format ffi-defs "(clrhash (constants *player-symbol-table*))~%")
    (format ffi-defs "(clrhash (class-methods *player-symbol-table*))~%")
    (format ffi-defs "(clrhash (class-static-methods *player-symbol-table*))~%")
    (format ffi-defs "(clrhash (classes *player-symbol-table*))~%~%")
    (format ffi-defs "(let ((*symbol-table* *player-symbol-table*))~%")
    (loop for i in (reverse *top-level-constant-forms*)
       do (format ffi-defs "  ~a~%" i))
    ;; we don't wrap the entire file in 1 let, since that makes it
    ;; take much longer to compile on some implementations
    (format ffi-defs ")~%~%")
    (loop for i in (reverse *top-level-method-forms*)
       do (format ffi-defs "(let ((*symbol-table* *player-symbol-table*))~%  ~a)~%~%" i))
    (loop for i in (reverse *class-forms*)
       do (format ffi-defs "~a" i))

    ))
