(in-package :as3-compiler)

;;; code to write out abc tag/hard coded simple .swf file to seekable
;;; stream or file


;; todo: range checks

;;;;;;;;;;;;;;;;;;;;;
;;; low level writers

(defun write-u8 (byte &optional (stream *standard-output*))
  (write-byte byte stream))

(defun write-u16 (integer &optional (stream *standard-output*))
  (write-byte (ldb (byte 8 0) integer) stream)
  (write-byte (ldb (byte 8 8) integer) stream))

(defun write-u24 (integer &optional (stream *standard-output*))
  (write-byte (ldb (byte 8 0) integer) stream)
  (write-byte (ldb (byte 8 8) integer) stream)
  (write-byte (ldb (byte 8 16) integer) stream))

(defun write-u32-raw (integer &optional (stream *standard-output*))
  (write-byte (ldb (byte 8 0) integer) stream)
  (write-byte (ldb (byte 8 8) integer) stream)
  (write-byte (ldb (byte 8 16) integer) stream)
  (write-byte (ldb (byte 8 24) integer) stream))

(defun write-variable-length-encoded (integer &optional (stream *standard-output*))
  (loop
     for i = integer then i2
     for i2 = (ash i -7)
     for b = (ldb (byte 7 0) i)
     for done = (or (= i2 0) (= i2 -1))
     when (not done)
     do (setf b (logior #x80 b))
     do (write-byte b stream)
     until done))

(defun write-u30 (integer &optional (stream *standard-output*))
  (assert (<= 0 integer (expt 2 30)))
  (write-variable-length-encoded integer stream))

(defun write-u32 (integer &optional (stream *standard-output*))
  (assert (<= 0 integer (expt 2 32)))
  (write-variable-length-encoded integer stream))

(defun write-s32 (integer &optional (stream *standard-output*))
  ;; flash 9/mxmlc seems to want negative #s stored as if they were
  ;; casted to uints first :/

  (assert (<= (abs integer) (expt 2 32)))
  (when (< integer 0) (setf integer (+ (expt 2 32) integer)))
  (write-variable-length-encoded integer stream))

(defun write-double (float &optional (stream *standard-output*))
  (loop with d = (ieee-floats::encode-float64 float)
     for i from 0 below 64 by 8
     do (write-byte (ldb (byte 8 i) d) stream)))

(defun write-counted-sequence (function seq &key (count-adjust 0) (start 0))
  (declare (ignorable start))
  ;;(format *error-output* "counted seq ~d (+ ~d ) entries ~a ~%" (length seq) count-adjust function)
  (if (<= (length seq) start)
      (write-u30 0)
      (progn
        (write-u30 (+ (length seq) count-adjust))
        (loop for i from start below (length seq)
           do (funcall function (elt seq i))))))

(defun write-string-info (string &optional (stream *standard-output*))
  (let ((utf8 (sb-ext:string-to-octets string :external-format :utf-8)))
    (write-u30 (length utf8))
    (write-sequence utf8 stream)))

(defun write-0-terminated-string (string &optional (stream *standard-output*))
  (let ((utf8 (sb-ext:string-to-octets string :external-format :utf-8)))
    (write-sequence utf8 stream)
    (write-u8 0 stream)))

;;;;;;;;;;;;;;;;;;;;;
;;; writers for asm level data structures


(defmethod write-generic ((trait as3-asm::trait-info) &optional (*standard-output* *standard-output*))
  (format *trace-output* "trait-data : ~s ~s~%"
          (as3-asm::name trait)
           (as3-asm::trait-data trait))
  (write-u30 (as3-asm::name trait))
  (write-generic (as3-asm::trait-data trait))
  (when (not (zerop (logand #x40 (as3-asm::kind (as3-asm::trait-data trait)))))
    (write-counted-sequence 'write-u30 (as3-asm::metadata trait))))

(defmethod write-generic ((td as3-asm::trait-data-slot/const) &optional (*standard-output* *standard-output*))
  (format *trace-output* "trait-data-slot/const :~s ~s ~s ~s ~s~%"
          (as3-asm::kind td)
          ( as3-asm::slot-id td)
          ( as3-asm::type-name td)
          (as3-asm::vindex td)
          (as3-asm::vkind td))
  (write-u8 (as3-asm::kind td))
  (write-u30 (as3-asm::slot-id td))
  (write-u30 (as3-asm::type-name td))
  (write-u30 (as3-asm::vindex td))
  (unless (zerop (as3-asm::vindex td)) 
    (write-u8 (as3-asm::vkind td))))

(defmethod write-generic ((td as3-asm::trait-data-class) &optional (*standard-output* *standard-output*))
  (write-u8 (as3-asm::kind td))
  (write-u30 (as3-asm::slot-id td))
  (write-u30 (as3-asm::classi td)))

(defmethod write-generic ((td as3-asm::trait-data-function) &optional (*standard-output* *standard-output*))
  (write-u8 (as3-asm::kind td))
  (write-u30 (as3-asm::slot-id td))
  (write-u30 (as3-asm::fn td)))

(defmethod write-generic ((td as3-asm::trait-data-method/get/set) &optional (*standard-output* *standard-output*))
  (write-u8 (as3-asm::kind td))
  (write-u30 (as3-asm::slot-id td))
  (write-u30 (as3-asm::method-id td)))


(defun write-namespace (namespace &optional (stream *standard-output*))
  "storing namespace_info as (kind name_index) for now "
  (write-u8 (first namespace) stream)
  (write-u30 (second namespace) stream))

(defun write-namespace-set (namespace-set &optional (stream *standard-output*))
  "namespace-set (ns_set_info) = (ns1 ns2 ... nsN)"
  (write-u30 (length namespace-set) stream)
  (loop for i in namespace-set
     do (write-u30 i stream)))

(defun write-multiname (multiname &optional (stream *standard-output*))
  "multiname_info = (kind values*) for now, 0-2 values depending on kind"
  ;;; TODO: error checking
  (let ((kind (first multiname)))
    (write-u8 kind stream)
    (loop for i in (cdr multiname)
       do (write-u30 i stream))))


(defun write-method-info (method-info &optional (*standard-output* *standard-output*))
  "u30 param-count, u30 return-type, u30 param-type[param-count], u30 name,
 u8 flags, option_info, param-info ==
  (name (param types = multinames) return-type flags (option) (param names)"
  (destructuring-bind (name param-types return-type flags &optional optional-params pnames)
      method-info
    (write-u30 (length param-types))
    (write-u30 return-type)
    (map 'nil 'write-u30 param-types)
    (write-u30 name)
    (write-u8 flags)
    (when optional-params
      (write-u30 (length optional-params))
      ;; optional-param = (( val . kind )
      (map 'nil (lambda (a)
                  (write-u30 (car a))
                  (write-u8 (cdr a))) optional-params))
    (when pnames
      (write-u30 (length pnames))
      (map 'nil 'write-u30 pnames))))

(defun write-metadata-info (metadata &optional (*standard-output* *standard-output*))
  "metadata = (name (item_info ... )), item_info = (key . value)"
  (write-u30 (car metadata))
  (write-u30 (length (second metadata)))
  (map 'nil (lambda (a) (write-u30 (car a))  (write-u30 (cdr a)))
       (second metadata)))

(defun write-instance (instance &optional (*standard-output* *standard-output*))
  (destructuring-bind
        (name super-name flags interfaces iinit traits
              &optional protected-ns) instance
    (format *trace-output* "write instance ~s~%  ~s ~s ~s ~s ~s ~s ~s~% ~s~%"
            instance
            name super-name flags interfaces iinit traits protected-ns
            (assoc iinit (function-names *compiler-context*) :test 'equal))
    (write-u30 name)
    (write-u30 super-name)
    (write-u8 flags)
    (when (not (zerop (logand flags as3-asm::+class-protected-ns+)))
      (write-u30 protected-ns))
    (write-counted-sequence 'write-u30 interfaces)
    (write-u30 iinit)
    (write-counted-sequence 'write-generic traits)))

(defun write-class (class &optional (*standard-output* *standard-output*))
  " class = (cinit trait1 trait2 ... traitN)"
  (format *trace-output* "write class ~s~%  ~s~%  ~S~%"
          class
          (assoc (car class) (function-names *compiler-context*) :test 'equal)
          (cdr class))
  (write-u30 (car class))
  (write-counted-sequence 'write-generic (cdr class)))



(defun write-script (script &optional (*standard-output* *standard-output*))
  " script = (init trait1 trait2 ... traitN)"
  (write-u30 (car script))
  (write-counted-sequence 'write-generic (cdr script)))

(defun write-method-body (method-body &optional (*standard-output* *standard-output*))
  (write-u30 (as3-asm::method-id method-body))
  (write-u30 (as3-asm::max-stack method-body))
  (write-u30 (1+ (as3-asm::local-count method-body)))
  (write-u30 (as3-asm::init-scope-depth method-body))
  (write-u30 (as3-asm::max-scope-depth method-body))
  (write-counted-sequence 'write-u8 (as3-asm::code method-body))
  (write-counted-sequence 'write-generic (as3-asm::exceptions method-body))
  (write-counted-sequence 'write-generic (as3-asm::traits method-body)))

(defmethod write-generic ((ei as3-asm::exception-info) &optional (*standard-output* *standard-output*))
  (write-u30 (as3-asm::from ei))
  (write-u30 (as3-asm::to ei))
  (write-u30 (as3-asm::target ei))
  (write-u30 (as3-asm::exc-type ei))
  (write-u30 (as3-asm::var-name ei)))



(defun write-abc-file (&optional (data as3-asm::*assembler-context*) (*standard-output* *standard-output*))
  (with-accessors
        ((ints as3-asm::ints) (uints as3-asm::uints) (doubles as3-asm::doubles)
         (strings as3-asm::strings) (namespaces as3-asm::namespaces)
         (ns-sets as3-asm::ns-sets) (multinames as3-asm::multinames)
         (method-infos as3-asm::method-infos) (metadata as3-asm::metadata)
         (classes as3-asm::classes) (instances as3-asm::instances)
         (scripts as3-asm::scripts) (method-bodies as3-asm::method-bodies))
      data

    (write-u16 16) ;minor version
    (write-u16 46) ;major version
    ;; constant pool
    (write-counted-sequence 'write-s32 ints :start 1)
    (write-counted-sequence 'write-u32 uints :start 1)
    (write-counted-sequence 'write-double doubles :start 1)
    (write-counted-sequence 'write-string-info strings :start 1)
    (write-counted-sequence 'write-namespace namespaces :start 1)
    (write-counted-sequence 'write-namespace-set ns-sets :start 1)
    (write-counted-sequence 'write-multiname multinames :start 1)
    ;; methods, etc
    (write-counted-sequence 'write-method-info method-infos)
    (write-counted-sequence 'write-metadata-info metadata)
    (write-counted-sequence 'write-instance instances)
    ;; classes and instances share the same length field
    (map 'nil 'write-class classes)
    (write-counted-sequence 'write-script scripts)
    (write-counted-sequence 'write-method-body method-bodies)))

(defun write-as3-tag (as3 tag-name &optional (*standard-output* *standard-output*))
  ;; always use the long form for size for now...
  (let ((size-pos (file-position *standard-output*)) start)
    ;; (write-u16 (logior (ash #x48 6) 63)) ;; was #x48, (x52?)
    ;; tag DoABC = 82
    (write-u16 (logior (ash #x52 6) 63))
    (setf size-pos (file-position *standard-output*))
    (write-u32-raw 0)    ;; size, to be filled in later
    (setf start (file-position *standard-output*))
    ;; flags 1 = lazy initialize
    (write-sequence '(01 00 00 00) *standard-output*)
    ;; tag name
    (write-0-terminated-string tag-name *standard-output*)
    ;; write the abc data
    (write-abc-file as3)
    ;; fill in the tag size
    (let* ((here (file-position *standard-output*))
           (length (- here start)))
      (file-position *standard-output* size-pos)
      (write-u32-raw (+ length  ))
      (file-position *standard-output* here))))

(defmacro write-tag ((tag stream) &body body)
  ;; fixme: handle short tags more efficiently
  (let ((start (gensym))
        (end (gensym)))
    `(let ((,start (file-position ,stream)))
       (write-u16 (logior (ash ,tag 6) 63) ,stream)
       (setf ,start (file-position ,stream))
       (write-u32-raw 0 ,stream)    ;; size, to be filled in later
       ,@body
    ;; fill in the tag size
    (let* ((,end (file-position ,stream)))
      (file-position ,stream ,start)
      (write-u32-raw  (- ,end ,start 4) ,stream)
      (file-position ,stream ,end)))))


(defun write-swf (stream frame-label symbol-classes)
  ;;; write out a minimal .swf, based on the stuff hxasm writes
  (write-sequence '(#x46 #x57 #x53 #x09) stream) ;;magic "FWS9"
  ;;  (write-u32-raw (+ #x17 6 (length as3) (if (>= (length as3) 63) 6 2)) stream)
  ;; file length (filled in later)
  (write-u32-raw 0 stream)
  ;; 8000x6000 twips = 400x300 pels
  (write-sequence '(#x78 #x00 #x03 #xe8 #x00 #x00 #x0b #xb8 #x00) stream)
  (write-u16 #x1e00 stream) ;; 30fps
  (write-u16 #x0001 stream) ;; 1 frame

  ;; FileAttributes tag
  (write-u16 (logior (ash #x45 6) 4) stream) ;; type=69 + length=4
  (write-u8 #b00011001 stream) ;; flags: reserved=000, HasMetadata=1,AS3=1,res=00, UseNetwork=1
  (write-u8 0 stream) ;;reserved
  (write-u8 0 stream) ;;reserved
  (write-u8 0 stream) ;;reserved

  ;; Script Limits tag type=65, length = 4
  (write-sequence '(#x44 #x10 #xe8 #x03 #x3c #x00) stream) ;; script limits? stack 1000, time 60

  ;; SetBackgroundColor tag type=9, length=3 color=#x869ca7
  (write-sequence '(#x43 #x02      #x86 #x9c #xa7 ) stream) ;; bg color?
  ;; FrameLabel tag type=43, length=4
  ;; (write-sequence '(#xc4 #x0a #x66 #x6f #x6f 00) stream) ;; frame label
  (write-tag (43 stream)
    (write-0-terminated-string frame-label stream))

  ;; AS3 tag
  (write-as3-tag as3-asm::*assembler-context* "frame" stream)
  ;; SymbolClass tag, tag=76 length=8
  ;;(write-u16 #x1308 stream) ;;tag+length
  ;;   NumSymbols=#x0001 Tag[1] = #x0000 Name[1]="foo"#x0
  ;;  (write-sequence '(#x01 00 00 00 #x66 #x6f #x6f 00) stream)
  (write-tag (76 stream)
    (write-u16 (length symbol-classes) stream) ;; # of symbols
    (loop for i in symbol-classes
         do
         (write-u16 (first i) stream) ;; tag
         (write-0-terminated-string (second i) stream))) ;; name

  ;; ShowFrame tag type=1, length=0
  (write-u16 (logior (ash #x01 6) 0) stream) ;; show frame tag
  ;; End tag type=1, length=0
  (write-u16 (logior (ash #x00 6) 0) stream) ;; end tag
  ;; fill in the file size
  (file-position stream 4)
  (write-u32-raw (file-length stream) stream)
)


;;; fixme: deal with package stuff, possibly reorganize stuff between asm/compiler...

(defun super-names (name)
  (let ((s (assoc name *flash-player-classes* :test 'string=)))
    (if s
        (cons (second s) (super-names (second s)))
        s)))

(defun push-lex-scope (mn-index)
  `((:get-lex ,(if (integerp mn-index) `(:id ,mn-index)mn-index))
    (:push-scope)))

(defun new-class+scopes (class-id)
  ;; fixme: allow class lookup instead of using class-id directly?
  (format t "cid = ~a classes=~s~%" class-id (as3-asm::classes as3-asm::*assembler-context*))
  (format t " instances = ~s~%" (as3-asm::instances as3-asm::*assembler-context*))
  (let* ((class (aref (as3-asm::classes as3-asm::*assembler-context*) class-id))
         (inst (aref (as3-asm::instances as3-asm::*assembler-context*) class-id)))
    (declare (ignorable class))
    (destructuring-bind (name-mn super-mn flags interfaces instance-init traits protected-ns)
        inst
      (declare (ignorable name-mn super-mn flags interfaces instance-init traits protected-ns))
      (format t "cid = ~a name-mn = ~a=~a  super-mn = ~a=~a ~%"
              class-id name-mn (as3-asm::qname-string name-mn)
              super-mn (as3-asm::qname-string super-mn))
      ;;(format t " supers = ~s~%" (reverse (super-names (as3-asm::qname-string super-mn))))
      (let ((supers (reverse (super-names (as3-asm::qname-string super-mn)))))
        `((:get-scope-object 0)
          ,@(loop for i in supers
               append (push-lex-scope i))
          ,@(push-lex-scope super-mn)
          (:get-lex (:id ,super-mn))
          (:new-class ,class-id)
          ,@(loop repeat (1+ (length supers))
               collect `(:pop-scope))
          (:init-property (:id ,name-mn)))))))


(defun assemble-function (name)
  (format t "--assemble-function ~s :~%" name)
  (destructuring-bind (n nid argtypes return-type flags asm)
      (find-swf-function name)
    (let ((mid (as3-asm::as3-method nid argtypes return-type flags
                                    :body (as3-asm::assemble-method-body asm))))
      (push (list n mid) (function-names *compiler-context*)))))

(defun assemble-class (name ns super properties constructor)
  (let* ((constructor-mid (as3-asm::as3-method
                           0 ;; name
                           (loop for i in (first constructor)
                              collect 0) ;; constructor arg types
                           0 0
                           :body
                           (as3-asm::assemble-method-body
                            (%compile-defun (first constructor)
                                            (second constructor) t t))))
         ;; fixme: probably should make this configurable at some point
         (class-init (as3-asm::as3-method 0 nil 0 0 ;; meta-class init
                                          :body
                                          (as3-asm::assemble-method-body
                                           `((:get-local-0)
                                             (:push-scope)
                                             (:return-void))
                                           :init-scope 0)))
         (junk (as3-asm::as3-ns-intern ns))
         (bleh ())
         (class (as3-asm::as3-class
                 (as3-asm::asm-intern-multiname name)
                 (as3-asm::asm-intern-multiname
                  (or (car (find-swf-class super))
                      super))
                 ;; todo: add interfaces
                 09 nil ;; flags, interfaces
                 constructor-mid
                 (loop for i in properties
                    collect
                      (make-instance
                       'as3-asm::trait-info
                       'as3-asm::name (as3-asm::asm-intern-multiname i)
                       'as3-asm::trait-data
                       (make-instance 'as3-asm::trait-data-slot/const
                                                    'as3-asm::kind 0
                                                    'as3-asm::slot-id 0 ;; auto-assign
                                                    'as3-asm::type-name 0 ;; */t
                                                    'as3-asm::vindex 0 ;; no value
                                                    'as3-asm::vkind 0 ;; no value
                                                    )))
                 class-init
                 :protected-ns junk
                 ;; todo: class traits
                 ;; :class-traits nil
                 )))
    (push (list name class) (class-names *compiler-context*))))

(defparameter *break-compile* nil)
;;(setf *break-compile* t)
;;; quick hack for testing, need to write a proper API at some point, which
;;;  compiles functions from a list of packages or whatever
(defmacro with-compilation-to-stream (s (frame-name exports) &body body)
  (let ((script-init (gensym))
        (i (gensym)))

    `(let ((as3-asm::*assembler-context* (make-instance 'as3-asm::assembler-context))
           (*compiler-context* (make-instance 'compiler-context))
           (*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table*))))
       ;; fixme: add these to assembler-context constructor or something
       (as3-asm::as3-intern "")
       (as3-asm::as3-ns-intern "")
       (format t "==-== body~%")
       ;; compile the body code
       ,@body
       (format t "==-== classes~%")
       ;; assemble classes
       (loop for k being the hash-keys of (classes *cl-symbol-table*)
          using (hash-value v)
          for (swf-name ns super properties constructor) = v
          when (or properties constructor)
          do (assemble-class swf-name ns super properties constructor))
       (loop for k being the hash-keys of (classes *symbol-table*)
          using (hash-value v)
          for (swf-name ns super properties constructor) = v
          when (or properties constructor)
          do (assemble-class swf-name ns super properties constructor))
       (format t "==-== functions~%")
       ;; assemble functions
       (loop for k being the hash-keys of (functions *cl-symbol-table*)
          do (assemble-function k))
       (loop for k being the hash-keys of (functions *symbol-table*)
          do (assemble-function k))
       (format t "==-== boilerplate~%")
       ;; script boilerplate
       (let ((,script-init
              (as3-asm::as3-method
               0 () 0 0
               :body
               (as3-asm::assemble-method-body
                `((:get-local-0)
                  (:push-scope)
                  ,@(loop for ,i below (length (as3-asm::classes as3-asm::*assembler-context*))
                       append (new-class+scopes ,i))
                  (:return-void))))))
       (format t "==-== boilerplate2~%")
         (vector-push-extend
          `(,,script-init
            ,@(loop for i in (class-names *compiler-context*)
                 do (format t "-=c-~s~%" i)
                 collect (make-instance 'as3-asm::trait-info
                                        'as3-asm::name
                                        (as3-asm::asm-intern-multiname (first i))
                                        'as3-asm::trait-data
                                        (make-instance 'as3-asm::trait-data-class
                                                       'as3-asm::slot-id 0
                                                       'as3-asm::classi (second i))))
            ,@(loop for i in (function-names *compiler-context*)
                 do (format t "-=f-~s~%" i)
                 collect (make-instance 'as3-asm::trait-info
                                        'as3-asm::name
                                        (if (numberp (first i))
                                            (first i)
                                            (as3-asm::asm-intern-multiname (first i)))
                                        'as3-asm::trait-data (make-instance 'as3-asm::trait-data-method/get/set
                                                                            'as3-asm::slot-id 0
                                                                            'as3-asm::method (second i)))))
          (as3-asm::scripts as3-asm::*assembler-context*)))

       (when *break-compile* (break))
       (format t "==-== write~%")
       ;; write out the .swf
       (write-swf ,s ,frame-name ,exports))))
