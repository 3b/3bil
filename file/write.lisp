(in-package :avm2-compiler)

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

;;; fixme: this is probably overly complicated, and encodes things inefficiently
;;; - the spec says variable length encoded s32 are sign extended, so we
;;; should need an extra byte if the high bit of the encoded value
;;; doesn't match the sign. The actual vm seems to not sign extend though,
;;; and negative s32 are always written with a full 32 bits, so we could
;;; encode positive s32 without the extra byte.
;;; we also use this for unsigned types, so those shouldn't have the extra byte
;;; either way
(defun write-variable-length-encoded (integer &optional (stream *standard-output*))
  (loop
     for i = integer then i2
     for i2 = (ash i -7)
     for b = (ldb (byte 7 0) i)
     for done = (or (= i2 0) (= i2 -1))
     when (or (not (eql (logbitp 6 i2) (logbitp 6 i))) (not done))
     do (setf b (logior #x80 b))
     do (write-byte b stream)
     when (and done (logbitp 7 b))
     do (write-byte (if (minusp i2) #x7f 0) stream)
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

(defgeneric write-generic (data &optional *standard-output*))

(defmethod write-generic ((trait avm2-asm::trait-info) &optional (*standard-output* *standard-output*))
  #+nil(format *trace-output* "trait-data : ~s ~s~%"
          (avm2-asm::name trait)
           (avm2-asm::trait-data trait))
  (write-u30 (avm2-asm::name trait))
  (write-generic (avm2-asm::trait-data trait))
  (when (not (zerop (logand #x40 (avm2-asm::kind (avm2-asm::trait-data trait)))))
    (write-counted-sequence 'write-u30 (avm2-asm::metadata trait))))

(defmethod write-generic ((td avm2-asm::trait-data-slot/const) &optional (*standard-output* *standard-output*))
  #+nil(format *trace-output* "trait-data-slot/const :~s ~s ~s ~s ~s~%"
          (avm2-asm::kind td)
          (avm2-asm::slot-id td)
          (avm2-asm::type-name td)
          (avm2-asm::vindex td)
          (avm2-asm::vkind td))
  (write-u8 (avm2-asm::kind td))
  (write-u30 (avm2-asm::slot-id td))
  (write-u30 (avm2-asm::type-name td))
  (write-u30 (avm2-asm::vindex td))
  (unless (zerop (avm2-asm::vindex td)) 
    (write-u8 (avm2-asm::vkind td))))

(defmethod write-generic ((td avm2-asm::trait-data-class) &optional (*standard-output* *standard-output*))
  (write-u8 (avm2-asm::kind td))
  (write-u30 (avm2-asm::slot-id td))
  (write-u30 (avm2-asm::classi td)))

(defmethod write-generic ((td avm2-asm::trait-data-function) &optional (*standard-output* *standard-output*))
  (write-u8 (avm2-asm::kind td))
  (write-u30 (avm2-asm::slot-id td))
  (write-u30 (avm2-asm::fn td)))

(defmethod write-generic ((td avm2-asm::trait-data-method/get/set) &optional (*standard-output* *standard-output*))
  (write-u8 (avm2-asm::kind td))
  (write-u30 (avm2-asm::slot-id td))
  (write-u30 (avm2-asm::method-id td)))


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
    #+nil(format *trace-output* "write instance ~s~%  ~s ~s ~s ~s ~s ~s ~s~% ~s~%"
            instance
            name super-name flags interfaces iinit traits protected-ns
            (assoc iinit (function-names *compiler-context*) :test 'equal))
    (write-u30 name)
    (write-u30 super-name)
    (write-u8 flags)
    (when (not (zerop (logand flags avm2-asm::+class-protected-ns+)))
      (write-u30 protected-ns))
    (write-counted-sequence 'write-u30 interfaces)
    (write-u30 iinit)
    (write-counted-sequence 'write-generic traits)))

(defun write-class (class &optional (*standard-output* *standard-output*))
  " class = (cinit trait1 trait2 ... traitN)"
  #+nil(format *trace-output* "write class ~s~%  ~s~%  ~S~%"
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
  (write-u30 (avm2-asm::method-id method-body))
  (write-u30 (avm2-asm::max-stack method-body))
  (write-u30 (1+ (avm2-asm::local-count method-body)))
  (write-u30 (avm2-asm::init-scope-depth method-body))
  (write-u30 (avm2-asm::max-scope-depth method-body))
  (write-counted-sequence 'write-u8 (avm2-asm::code method-body))
  (write-counted-sequence 'write-generic (avm2-asm::exceptions method-body))
  (write-counted-sequence 'write-generic (avm2-asm::traits method-body)))

(defmethod write-generic ((ei avm2-asm::exception-info) &optional (*standard-output* *standard-output*))
  (write-u30 (avm2-asm::from ei))
  (write-u30 (avm2-asm::to ei))
  (write-u30 (avm2-asm::target ei))
  (write-u30 (avm2-asm::exc-type ei))
  (write-u30 (avm2-asm::var-name ei)))



(defun write-abc-file (&optional (data avm2-asm::*assembler-context*) (*standard-output* *standard-output*))
  (with-accessors
        ((ints avm2-asm::ints) (uints avm2-asm::uints) (doubles avm2-asm::doubles)
         (strings avm2-asm::strings) (namespaces avm2-asm::namespaces)
         (ns-sets avm2-asm::ns-sets) (multinames avm2-asm::multinames)
         (method-infos avm2-asm::method-infos) (metadata avm2-asm::metadata)
         (classes avm2-asm::classes) (instances avm2-asm::instances)
         (scripts avm2-asm::scripts) (method-bodies avm2-asm::method-bodies))
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

(defun write-rect (stream x y)
  ;;(write-sequence '(#x78 #x00 #x03 #xe8 #x00 #x00 #x0b #xb8 #x00) stream)
  ;; we just always use fixed size for now...
  (write-sequence
   (loop with temp = 16
         for val in (list 0 x 0 y) ;; min/max x,y
         collect (logior (ash temp 3) (ldb (byte 3 13) val)) into l
         collect (ldb (byte 8 5) val) into l
         do (setf temp (ldb (byte 5 0) val))
         finally (return (append l (list (ash temp 3)))))
   stream))


(defun write-swf (stream frame-label symbol-classes &key (flash-version 9) (x-twips 8000) (y-twips 6000))
  ;;; write out a minimal .swf, based on the stuff hxasm writes
  (write-sequence `(#x46 #x57 #x53 ,flash-version) stream) ;;magic "FWS" + ver
  ;;  (write-u32-raw (+ #x17 6 (length as3) (if (>= (length as3) 63) 6 2)) stream)
  ;; file length (filled in later)
  (write-u32-raw 0 stream)
  ;; 8000x6000 twips = 400x300 pels
  ;;(write-sequence '(#x78 #x00 #x03 #xe8 #x00 #x00 #x0b #xb8 #x00) stream)
  (write-rect stream x-twips y-twips)
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
  (write-as3-tag avm2-asm::*assembler-context* "frame" stream)
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
  (let ((c (when name (find-swf-class name))))
    (when c
      (cons (swf-name c) (super-names (extends c))))))

(defun push-lex-scope (mn-index)
  `((:get-lex ,(if (integerp mn-index) `(:id ,mn-index)mn-index))
    (:push-scope)))

(defun new-class+scopes (class)
  ;; fixme: allow class lookup instead of using class-id directly?
  (let ((supers (reverse (super-names (extends class)))))
    `((:get-scope-object 0)
      ,@(loop for i in supers
           append (push-lex-scope i))
      (:get-lex ,(swf-name (find-swf-class (extends class))))
      (:new-class ,(second (assoc (swf-name class) (class-names *compiler-context*))))
      ,@(loop repeat  (length supers)
           collect `(:pop-scope))
      (:init-property  ,(swf-name class)))))


(defun assemble-function (name)
  #+nil(format t "--assemble-function ~s :~%" name)
  (destructuring-bind (n nid argtypes return-type flags asm &optional activation-slots)
      (find-swf-function name)
    ;;(format t "--assemble-function ~s : ~s : ~s ~%" name n nid)
    (let* ((traits (loop for (name index type) in activation-slots
                         ;;do (format t "trait = ~s ~s ~s ~%" name index type)
                         collect (make-instance
                                  'avm2-asm::trait-info
                                  'avm2-asm::name (avm2-asm::asm-intern-multiname name)
                                  'avm2-asm::trait-data
                                  (make-instance
                                   'avm2-asm::trait-data-slot/const
                                   'avm2-asm::kind 0
                                   'avm2-asm::slot-id index
                                   'avm2-asm::type-name type
                                   'avm2-asm::vindex 0 ;; no value
                                   'avm2-asm::vkind 0 ;; no value
                                   ))))
           (mid (avm2-asm::avm2-method name nid argtypes return-type flags
                                       :body (avm2-asm::assemble-method-body asm :traits traits))))
      (push (list n mid) (function-names *compiler-context*)))))

(defun assemble-class (name ns super properties constructor)
  (let* ((constructor-mid (avm2-asm::avm2-method
                           nil 0 ;; id name
                           (loop for i in (first constructor)
                              collect 0) ;; constructor arg types
                           0 0
                           :body
                           (avm2-asm::assemble-method-body
                            (%compile-defun name (first constructor)
                                            (second constructor) t t))))
         ;; fixme: probably should make this configurable at some point
         (class-init (avm2-asm::avm2-method nil 0 nil 0 0 ;; meta-class init
                                          :body
                                          (avm2-asm::assemble-method-body
                                           `((:get-local-0)
                                             (:push-scope)
                                             (:return-void))
                                           :init-scope 0)))
         (junk (avm2-asm::avm2-ns-intern ns))
         (class (avm2-asm::avm2-class
                 (avm2-asm::asm-intern-multiname name)
                 (avm2-asm::asm-intern-multiname
                  (or (swf-name (find-swf-class super))
                      super))
                 ;; todo: add interfaces
                 09 nil ;; flags, interfaces
                 constructor-mid
                 (loop for i in properties
                    collect
                      (make-instance
                       'avm2-asm::trait-info
                       'avm2-asm::name (avm2-asm::asm-intern-multiname i)
                       'avm2-asm::trait-data
                       (make-instance 'avm2-asm::trait-data-slot/const
                                                    'avm2-asm::kind 0
                                                    'avm2-asm::slot-id 0 ;; auto-assign
                                                    'avm2-asm::type-name 0 ;; */t
                                                    'avm2-asm::vindex 0 ;; no value
                                                    'avm2-asm::vkind 0 ;; no value
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
(defmacro with-compilation-to-stream (s (frame-name exports &key (swf-version 9) (x-twips 8000) (y-twips 6000)) &body body)
  (let ((script-init (gensym))
        (script-init-scope-setup (gensym)))

    `(let ((avm2-asm::*assembler-context* (make-instance 'avm2-asm::assembler-context))
           (*compiler-context* (make-instance 'compiler-context))
           (*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table*)))
           (,script-init-scope-setup nil))
       ;; fixme: add these to assembler-context constructor or something
       (avm2-asm::avm2-intern "")
       (avm2-asm::avm2-ns-intern "")
       #+nil(format t "==-== body~%")
       ;; compile the body code
       ,@body
       #+nil(format t "==-== classes~%")
       ;; assemble classes
       (loop for symbol-table in (list *cl-symbol-table* *symbol-table*)
          do (loop for k being the hash-keys of (classes symbol-table)
                using (hash-value v)
                do
                  (with-accessors ((swf-name swf-name) (ns ns)
                                   (extends extends) (properties properties)
                                   (constructor constructor)) v
                    (when (or properties constructor)
                      #+nil(format t "name=~s extends = ~s, find=~s sn=~s~%" swf-name
                              extends (find-swf-class extends)
                              (swf-name (find-swf-class extends))
                              )
                      (assemble-class swf-name ns
                                      extends
                                      properties constructor)))
                  (setf ,script-init-scope-setup
                        (append ,script-init-scope-setup (new-class+scopes v)))))
       #+nil(format t "==-== functions~%")
       ;; assemble functions
       (loop for k being the hash-keys of (functions *cl-symbol-table*)
          do (assemble-function k))
       (loop for k being the hash-keys of (functions *symbol-table*)
          do (assemble-function k))
       #+nil(format t "==-== boilerplate~%")
       ;; script boilerplate
       (let ((,script-init
              (avm2-asm::avm2-method
               nil 0 () 0 0
               :body
               (avm2-asm::assemble-method-body
                `((:get-local-0)
                  (:push-scope)
                  ,@,script-init-scope-setup
                  ,@(load-top-level *compiler-context*)
                  (:return-void))))))
         #+nil(format t "==-== boilerplate2~%")
         (vector-push-extend
          `(,,script-init
            ,@(loop for i in (class-names *compiler-context*)
                 ;;do (format t "-=c-~s~%" i)
                 collect (make-instance 'avm2-asm::trait-info
                                        'avm2-asm::name
                                        (avm2-asm::asm-intern-multiname (first i))
                                        'avm2-asm::trait-data
                                        (make-instance 'avm2-asm::trait-data-class
                                                       'avm2-asm::slot-id 0
                                                       'avm2-asm::classi (second i))))
            ,@(loop for i in (function-names *compiler-context*)
                    ;;do (format t "-=f-~s~%" i)
                 collect (make-instance 'avm2-asm::trait-info
                                        'avm2-asm::name
                                        (if (numberp (first i))
                                            (first i)
                                            (avm2-asm::asm-intern-multiname (first i)))
                                        'avm2-asm::trait-data (make-instance 'avm2-asm::trait-data-method/get/set
                                                                            'avm2-asm::slot-id 0
                                                                            'avm2-asm::method (second i)))))
          (avm2-asm::scripts avm2-asm::*assembler-context*)))

       (when *break-compile* (break))
       #+nil(format t "==-== write~%")
       ;; write out the .swf
       (write-swf ,s ,frame-name ,exports :flash-version ,swf-version :x-twips ,x-twips :y-twips ,y-twips))))
