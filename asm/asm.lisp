(in-package :avm2-asm)


;;; for now just using keywords as opcode names...
;;; * possibly would be better to use an equal or equal-p hash table and look
;;;   up opcodes by name instead of symbol?
;;; * functions have some nice properties also:
;;;   + arglist hints from slime autodoc
;;;   + backtraces show specific opcode when we get an error in a opcode
;;;   + assemble is a bit shorter
;;;   - name clashes with CL functions make it messier though, so storing
;;;     opcodes in a hash...
(defparameter *opcodes* (make-hash-table))
(defparameter *disassemble-opcodes* (make-hash-table))
(defparameter *stack-effects-opcodes* (make-hash-table))

(defparameter +need-args+ #x01)
(defparameter +need-activation+ #x02)
(defparameter +need-rest+ #x04)
(defparameter +has-optional+ #x08)
(defparameter +set-dxns+ #x40)
(defparameter +has-param-names+ #x80)

(defclass method-body ()
  ((method-id :initarg method :accessor method-id)
   (max-stack :initarg max-stack :accessor max-stack)
   (local-count :initarg local-count :accessor local-count)
   (init-scope-depth :initarg init-scope-depth :accessor init-scope-depth)
   (max-scope-depth :initarg max-scope-depth :accessor max-scope-depth)
   (code :initarg code :accessor code)
   ;; stored in an array since we need to keep them in order
   (exceptions :initform (make-array 4 :adjustable t :fill-pointer 0) :accessor exceptions)
   ;; mapping of exception target label names to indices in exceptions array
   (exception-names :initform () :accessor exception-names)
   (traits :initform nil :initarg traits :accessor traits)
   ;; temporaries for tracking values during assembly
   (current-stack :initform 0 :accessor current-stack)
   (current-scope :initform 2 :initarg current-scope :accessor current-scope)
   (flags :initform 0 :accessor flags)
   (label :initform () :accessor label)
   (fixups :initform () :accessor fixups)))


(defparameter *current-method* nil)
(defparameter *code-offset* 0)

(defun %assemble (forms)
  "simple assembler, returns sequence of octets containing the
  bytecode corresponding to forms, interns stuff as needed, or
  optionally uses constant pool indices (with no error checking
  currently) when operand is a list of the form (:id ###). "
  (let ((*code-offset* 0))
    (loop for i in forms
       for opcode = (gethash (car i) *opcodes*)
       for octets = (when opcode (apply opcode (cdr i)))
       if opcode
       append octets
       ;;and do (format t "assemble ~s-> ~s ofs = ~s + ~s ~%"
       ;;               i octets *code-offset* (length octets))
       and do (incf *code-offset* (length octets))
       else do (error "invalid opcode ~s " i))))

(defun assemble (forms)
  (%assemble (peephole forms)))

;;;; fixme: probably should combine validation with assembly, so we
;;;; can use it for dead code elimination too
(defun %avm2-validate (peephole-code &key dump)
  (declare (optimize debug))
  (let* ((stack-at (make-array (length peephole-code) :initial-element nil))
         (label-info (make-hash-table))
         (min-stack 0)
         (min-scope 0)
         (max-stack 0)
         (max-scope 0)
         ;; work list = code , index, stack, scope
         (work-list (list (list peephole-code 0 0 0))))
    ;; to validate the stack stuff:
    ;;  first we make a pass through and collect positions of all labels
    ;;  then we start from beginning, and at each op, update info for that op
    ;;    if a jump, and label doesn't have info yet, push it onto work list
    ;;      and update info for dest label
    ;;    if unconditional jump/throw/ret, or already processed instruction,
    ;;    if work list is empty, we are done
    ;;    else pop work list and restart from there
    (loop for here on peephole-code
       for (op . args) = (car here)
       for i from 0
       for fun = (gethash op *stack-effects-opcodes*)
       for (pop push pop-scope push-scope local flags
                control-flow labels)
       = (multiple-value-list (if fun (apply fun args)))
       unless fun do (format t "no stack-check fun for op ~s?" op)
       when (eq control-flow :label)
       do (setf (gethash labels label-info) (list here i nil))
       when (eq control-flow :exception)
       do (setf (gethash labels label-info) (list here i nil))
         (push (list here i 0 0) work-list))

    (setf work-list (nreverse work-list))
    (flet ((check-label (label stack scope)
             (destructuring-bind (here index info) (gethash label label-info)
               (if info
                   ;; if we have seen a ref to this label (actual label
                   ;; or a jump to it) make sure we have the same stack depth
                   (assert (and (= stack (car info))
                                (= scope (cdr info)))
                           () "stack mismatch at label ~s expected ~s/~s got ~s"
                           label stack scope info)
                   (progn
                     ;; if we haven't seen the label yet, add it to worklist
                     (push (list here index stack scope)
                           work-list)
                     ;; and update stack info
                     (setf (third (gethash label label-info))
                           (cons stack scope)))))))
      (loop
         for (code start stack scope) = (pop work-list)
         for pass from 0
         with pass-max =  (length peephole-code)
         while code
         do (assert (< pass pass-max))
         do (loop
               for (op . args) = (pop code)
               for i from start
               for fun = (gethash op *stack-effects-opcodes*)
               for (pop push pop-scope push-scope local flags
                        control-flow labels)
                 = (multiple-value-list
                    (if fun (apply fun args)))
               for info = (aref stack-at i)
               unless fun do (format t "no stack check fun for op ~s?" op)
               ;; if we have already seen this entry, we are done current scan
               when info
               do (assert  (and (= stack (car info))
                                (= scope (cdr info)))
                           () "stack mismatch at instr ~s expected ~s/~s got ~s"
                           (cons op args) stack scope info)
               and return nil
               ;; exceptions clear the stack, so handle specially
               when (eq control-flow :exception)
               do (setf stack (- push pop)
                        scope (- push-scope pop-scope))
               else do
                 (incf stack (- push pop))
                 (incf scope (- push-scope pop-scope))
               ;; update info for this index
                 (setf (aref stack-at i) (cons stack scope))
               ;; update min/max
                 (setf min-stack (min min-stack stack)
                       min-scope (min min-scope scope)
                       max-stack (max max-stack stack)
                       max-scope (max max-scope scope))
                 (when (< stack 0) (format t "stack underflow? = ~s ~s" stack min-stack))

               ;; check/update label info
               do (mapcar (lambda (x)
                            (check-label x stack scope))
                          (if (listp labels) labels (list labels)))
               when (member control-flow '(t :throw :return))
               return nil)))
    (when (or (minusp min-stack) (minusp min-scope) dump)
      (format t "min-stack = ~s, min-scope = ~s~%" min-stack min-scope)
      (loop
         for op in peephole-code
         for (stack . scope) across stack-at
         do (format t "(~{~s~^ ~})   ====  ~s/ ~s~%"
                         op stack scope)))
    (values max-stack max-scope)))

(defun avm2-validate (code &key dump)
  (avm2-validate (peephole code) :dump dump))

(defun assemble-method-body (forms &key (init-scope 0)
                             (max-scope 1 max-scope-p)
                             (max-stack 1 max-stack-p)
                             (arg-count 0)
                             traits)
  (let ((*current-method* (make-instance 'method-body
                                         'local-count (max arg-count 1)
                                         'max-stack 1
                                         'init-scope-depth init-scope
                                         'max-scope-depth init-scope
                                         'current-scope init-scope
                                         'traits traits))
        v-stack
        v-scope
        (p-code (peephole forms)))
    (setf (values v-stack v-scope)
          (%avm2-validate p-code))
    (setf (code *current-method*)
          (%assemble p-code))
    (when max-stack-p
      (setf (max-stack *current-method*) max-stack))
    (when max-scope-p
      (setf (max-scope-depth *current-method*) (+ init-scope max-scope)))
    (when (fixups *current-method*)
      ;; fix any fixups
      (loop for (label addr base) in (fixups *current-method*)
         for dest = (cdr (assoc label (label *current-method*)))
         when  dest
         do (replace (code *current-method*)
                     (u24-to-sequence (- dest base))
                     :start1 (+ 1 addr ))
         else do (error "!!!!! unknown fixup ~s !!! ~%" label)))
    ;; update exception table with addresses of labels
    (flet ((ensure-label (name)
             (or (cdr (assoc name (label *current-method*)))
                 (error "unknown label ~s in avm2 exception handler" name))))
      (loop for i below (length (exceptions *current-method*))
            for ex = (aref (exceptions *current-method*) i)
            do (setf (from ex)  (ensure-label (from ex))
                     (to ex)    (ensure-label (to ex))
                     (target ex)(ensure-label (target ex)))))
    (setf (max-stack *current-method*) v-stack)
    (setf (max-scope-depth *current-method*) v-scope)
    *current-method*))


(defun u16-to-sequence (u16)
  (list
    (ldb (byte 8 0) u16)
    (ldb (byte 8 8) u16)))

(defun u24-to-sequence (u24)
  (list
    (ldb (byte 8 0) u24)
    (ldb (byte 8 8) u24)
    (ldb (byte 8 16) u24)))

(defun double-to-sequence (double)
  (loop with d =  (ieee-floats::encode-float64 double)
     for i from 0 below 64 by 8
     collect (ldb (byte 8 i) d)))


(defun counted-s24-to-sequence (seq)
  (append
   (variable-length-encode (length seq))
   (mapcan 'u24-to-sequence seq)))

(defun count+1-s24-to-sequence (seq)
  (append
   (variable-length-encode (1- (length seq)))
   (mapcan 'u24-to-sequence seq)))

(defun variable-length-encode (integer)
  (loop
   for i = integer then i2
   for i2 = (ash i -7)
   for b = (ldb (byte 7 0) i)
   for done = (or (= i2 0) (= i2 -1))
   when (not done)
   do (setf b (logior #x80 b))
   collect b
   until done))

;;; fixme: these should probably avoid repeated elt calls if seq is a list
(defun decode-u16 (sequence &key (start 0))
  (values
   (logior (elt sequence start)
           (ash (elt sequence (1+ start)) 8))
   (+ 2 start)))

(defun decode-u24 (sequence &key (start 0))
  (values
   (logior (elt sequence start)
           (ash (elt sequence (+ 1 start)) 8)
           (ash (elt sequence (+ 2 start)) 16))
   (+ 3 start)))

(defun decode-variable-length (sequence &key (start 0))
  (loop with sum = 0
     for i from start
     for offset from 0 by 7
     for j = (elt sequence i)
     do (setf (ldb (byte 7 offset) sum) (ldb (byte 7 0) j))
     while (logbitp 7 j)
     finally (return (values sum (1+ i)))))

(defun decode-counted-s24 (sequence &key (start 0))
  (multiple-value-bind (count start)
      (decode-variable-length sequence :start start)
    (values
     (loop repeat (1+ count)
        with value
        do (setf (values value start) (decode-u24 sequence :start start))
        collect value)
     start)))

;;; new types for automatic interning
;;; (many of these probably just map to the same qname code, but
;;;   separating just in case)
;; string-u30 int-u30 uint-u30 double-u30 namespace-q30 multiname-q30 class-u30
;; fix runtime-name-count? or just set arg to index after interning
;;   and before calling arg count stuff?

;;; todo: figure out if these need handled:
;;;     slot-index for :get-slot/:set-slot/etc

;(decode-u16 (u16-to-sequence 12345))
;(decode-u24 (u24-to-sequence 12345))
;(decode-u24 (u24-to-sequence 123456))
;(decode-variable-length (variable-length-encode 1))
;(decode-variable-length (variable-length-encode 127))
;(decode-variable-length (variable-length-encode 128))
;(decode-variable-length (variable-length-encode 256))
;(decode-variable-length (variable-length-encode 12345))
;(decode-variable-length (variable-length-encode 123456789))
;(decode-counted-s24 (counted-s24-to-sequence '(1 2 3 4 5)))
;(decode-counted-s24 (counted-s24-to-sequence '(12345 2 345678 4 5)))
(decode-variable-length '(#b10000010 #b1))    ; 130
(decode-variable-length '(#b1))          ; 1
(decode-variable-length '(#b10010110 #b11))

(defun avm2-disassemble (sequence &key (start 0))
  (loop
     with length = (length sequence)
     with op = nil
     for byte = (elt sequence start)
     for dis = (gethash byte *disassemble-opcodes*)
     ;;do (format t "op=~s byte=~s start=~s cur-seq=~{ ~2,'0x~}~%   dis=~s ~%"
     ;;           op byte start (coerce
     ;;                          (subseq sequence start (min length
     ;;                                                      (+ start 8))) 'list) dis)
     ;;  (finish-output)
     do (incf start)
     when dis
     do (setf (values op start) (funcall dis sequence :start start))
     ;;and do (format t "op -> ~s start -> ~s~%" op start)
     and collect op
     else do (error "invalid byte ~s at ~d " byte start)
     unless start do (error "no start?")
     while (< start length)))



;;; these don't actually work in general, since they don't take
;;; branching into account, but simplifies things for now...
(defun adjust-stack (pop push)
  (when *current-method*
    (decf (current-stack *current-method*) pop)
    ;;(when (< (current-stack *current-method*) 0)
    ;;  (error "assembler error : stack underflow !"))
    ;; be conservative, probably should warn once compiler is smarter...
    (when (< (current-stack *current-method*) 0)
      (setf (current-stack *current-method*) 0))
    (incf (current-stack *current-method*) push)
    (when (> (current-stack *current-method*)
             (max-stack *current-method*))
      (setf (max-stack *current-method*)
            (current-stack *current-method*)))))

(defun adjust-scope (pop push)
  (when *current-method*
    (decf (current-scope *current-method*) pop)
    ;;(when (< (current-scope *current-method*) 0)
    ;;  (error "assembler error : scope underflow !"))
    (incf (current-scope *current-method*) push)
    (when (> (current-scope *current-method*)
             (max-scope-depth *current-method*))
      (setf (max-scope-depth *current-method*)
            (current-scope *current-method*)))))

(macrolet
    ((make-interner (intern-name lookup-name interner pool)
       `(progn
          (defun ,intern-name (value)
            (if (typep value '(cons (eql :id)))
                (second value)
                (,interner value)))
          (defun ,lookup-name (value)
            (if *assembler-context*
                (aref (,pool *assembler-context*) value)
                (list :id value))))))

  (make-interner asm-intern-string lookup-string avm2-string strings)
  ;; fixme: avm2-intern-* can break if first thing interned is wrong type
  (make-interner asm-intern-int lookup-int avm2-intern-int ints)
  (make-interner asm-intern-uint lookup-uint avm2-intern-uint uints)
  (make-interner asm-intern-double lookup-double avm2-intern-double doubles)
  (make-interner asm-intern-namespace lookup-namespace avm2-ns-intern namespaces)
  (make-interner asm-intern-method lookup-method intern-method-id method-infos))
;; (asm-intern-string "foo")
;; (asm-intern-string '(:id 2))
;; (asm-intern-string :id)
;; (asm-intern-int 1232)
;; (asm-intern-int '(:id 3))
;; x(asm-intern-int :id) ;; should fail even if no ints interned yet, but doesn't

(defun symbol-name-to-string (name &key init-cap)
  (coerce
   (loop
      for prev = (if init-cap #\- #\Space) then c
      for c across name
      when (or (not (alpha-char-p prev)) (char/= c #\-))
      collect (if (char= prev #\-)
                  (char-upcase c)
                  (char-downcase c)))
   'string))

(defun symbol-to-export-string (name &key init-cap)
  ;; quick hack to convert symbols into a string suitable for use in export tags
  (let ((package (symbol-package name))
        (sym (symbol-name-to-string (symbol-name name) :init-cap init-cap)))
    (if (eql package (find-package :keyword))
        sym
        (format nil "~a::~a" (string-downcase (if package
                                                  (package-name package)
                                                  "##uninterned"))
                sym))))

(defun symbol-to-qname-list (name &key init-cap)
  ;; just a quick hack for now, doesn't actually try to determine if
  ;; there is a valid property or not...
  (let ((package (symbol-package name))
        (sym (symbol-name-to-string (symbol-name name) :init-cap init-cap)))
    (if (eql package (find-package :keyword))
        (setf package "")
        (setf package (string-downcase (if package
                                           (package-name package)
                                            "##uninterned"))))
    (values (list :qname package sym) sym)))

;; fixme: not sure we want this anymore, instead store a symbol->qname
;; hash in compiler-context, and use that for lookups?
;;; --- still used by defun stuff, so keeping for now... not calling automatically any more though, need to actually have a valid *symbol-table*
(defun symbol-to-qname-old (name &key init-cap)
  ;; just a quick hack for now, doesn't actually try to determine if
  ;; there is a valid property or not...
  (let ((package (symbol-package name))
        (sym (coerce
              (loop
                 for prev = (if init-cap #\- #\Space) then c
                 for c across (symbol-name name)
                 when (or (not (alpha-char-p prev)) (char/= c #\-))
                 collect (if (char= prev #\-)
                             (char-upcase c)
                             (char-downcase c)))
              'string)))
    (if (eql package (find-package :keyword))
        (setf package "")
        (setf package (string-downcase (or (package-name package) ""))))
    (values (avm2-asm::qname package sym) sym)))

(defun asm-intern-multiname (mn)
  (typecase mn
    ((integer 0 0) 0) ;; shortcut for (:id 0)
    ((cons (eql :qname)) (apply 'qname (cdr mn)))
    ((cons (eql :multiname-l)) (apply 'intern-multiname-l +multiname-l+ (cdr mn)))
    ;; todo: add other types of multinames
    ((cons (eql :id)) (second mn))
    (symbol (apply 'qname (cdr (symbol-to-qname-list mn)))) ;; not sure if this is good or not, needed for calling as-yet undefined functions though...
    (t (parsed-qname mn))))
;; (asm-intern-multiname '(:qname "foo" "bar"))
;; (asm-intern-multiname '(:id 321))
;; (asm-intern-multiname "foo:bax")
;; (asm-intern-multiname '(:qname "foo" "bax"))
;; (asm-intern-multiname '(:qname "foo" "bax"))
;; x(asm-intern-multiname 'cos) ;; not sure if we should support symbols or not
;;(intern-multiname +multiname-l+ "" "") (elt (multinames *assembler-context*) 1)


(defparameter *multiname-kinds* (make-hash-table))
(setf (gethash +qname+ *multiname-kinds*) :qname)
(setf (gethash +qname-a+ *multiname-kinds*) :qname-a)
(setf (gethash +rt-qname+ *multiname-kinds*) :rt-qname)
(setf (gethash +rt-qname-a+ *multiname-kinds*) :rt-qname-a)
(setf (gethash +rt-qname-l+ *multiname-kinds*) :rt-qname-l)
(setf (gethash +rt-qname-la+ *multiname-kinds*) :rt-qname-la)
(setf (gethash +multiname+ *multiname-kinds*) :multiname)
(setf (gethash +multiname-a+ *multiname-kinds*) :multiname-a)
(setf (gethash +multiname-l+ *multiname-kinds*) :multiname-l)
(setf (gethash +multiname-la+ *multiname-kinds*) :multiname-la)

(defun lookup-multiname (id)
  (if (boundp '*assembler-context*)
      (destructuring-bind (kind ns name)
          (elt (multinames *assembler-context*) id)
        (list (gethash kind *multiname-kinds* kind)
              (elt (strings *assembler-context*)
                   (second (elt (namespaces *assembler-context*) ns)))
              (elt (strings *assembler-context*) name)))
      (list :id id)))

(defun label-to-offset (name op)
  (let ((dest (gensym "DEST-"))
        (here (gensym "HERE-"))
        (ofs (if (eq op :lookup-switch) 0 4)))
    `(when (symbolp ,name)
       (let ((,dest (cdr (assoc ,name (label *current-method*))))
             (,here *code-offset*))
         (unless ,dest
           (push (list ,name ,here (+ ,here ,ofs)) (fixups *current-method*))
           (setf ,dest (+ 4 ,here)))
         (setf ,name (- ,dest ,here ,ofs))))))

(defun labels-to-offsets (name)
  (let ((dest (gensym "DEST-"))
        (here (gensym "HERE-"))
        (i (gensym "I-"))
        (j (gensym "J-")))
    `(setf ,name
           (loop with ,here = *code-offset*
              for ,i in ,name
              for ,j from 4 by 4
              when (symbolp ,i)
              collect
                (let ((,dest (cdr (assoc ,i (label *current-method*)))))
                  (unless ,dest
                    (push (list ,i (+ ,here ,j) ,here)
			  (fixups *current-method*))
                    (setf ,dest ,here))
                  (- ,dest ,here 0))
              else collect ,i
              ))))

(defun asm-intern-exception (exception)
  (cond
    ;; allow (:id ##) to specify index directly
    ((and (consp exception) (eq (first exception) :id))
     (second exception))
    ;; look up by name
    ((cdr (assoc exception (exception-names *current-method*))))
    ;;TODO: should we handle calling :new-catch before the
    ;; target label has been seen in the asm?
    (t (error "unknown exception block name ~s" exception))))

(defmacro define-ops (&body ops)
  (let ((coders
         ;; type tag , encoder , optional interner
         `((u8  list)
           (u16  u16-to-sequence)
           (u24  u24-to-sequence)
           (s24  u24-to-sequence)
           (ofs24  u24-to-sequence) ;; for using labels directly in branches
           (u30  variable-length-encode)
           (q30  variable-length-encode) ;; hack for name interning
           (u32  variable-length-encode)
           (s32  variable-length-encode)
           (double  double-to-sequence)
           (counted-s24  counted-s24-to-sequence)
           (counted-ofs24  count+1-s24-to-sequence)

           (string-u30    variable-length-encode asm-intern-string)
           (int-u30       variable-length-encode asm-intern-int)
           (uint-u30      variable-length-encode asm-intern-uint)
           (double-u30    variable-length-encode asm-intern-double)
           (namespace-q30 variable-length-encode asm-intern-namespace)
           (multiname-q30 variable-length-encode asm-intern-multiname)
           (class-u30     variable-length-encode asm-intern-class)
           (method-u30    variable-length-encode asm-intern-method)
           (exception-u30 variable-length-encode asm-intern-exception)
           ))
        (decoders
         ;; type tag, decoder, optional constant pool lookup function
         `((u8  (lambda (s &key (start 0)) (values (elt s start) (1+ start))))
           (u16  decode-u16)
           (u24  decode-u24)
           (s24  decode-u24)
           (ofs24  decode-u24) ;; for using labels directly in branches
           (u30  decode-variable-length)
           (q30  decode-variable-length) ;; hack for name interning
           (u32  decode-variable-length)
           (s32  decode-variable-length)
           (double  (lambda (s) (error "not done")))
           (counted-s24  decode-counted-s24)
           (counted-ofs24  decode-counted-s24) ;; array of ofs24 in lookupswitch

           (string-u30    decode-variable-length lookup-string)
           (int-u30       decode-variable-length lookup-int)
           (uint-u30      decode-variable-length lookup-uint)
           (double-u30    decode-variable-length lookup-double)
           (namespace-q30 decode-variable-length lookup-namespace)
           (multiname-q30 decode-variable-length lookup-multiname)
           (class-u30     decode-variable-length lookup-class)
           (method-u30     decode-variable-length lookup-method)
           (exception-u30 decode-variable-length) ;; todo: add lookup
)))
    (flet ((defop (name args opcode
                        &optional (pop 0) (push 0) (pop-scope 0) (push-scope 0) (local 0) (flag 0) &rest ignore)
             (declare (ignore ignore))
             `(setf (gethash ',name *opcodes*)
                    (flet ((,name (,@(mapcar 'car args))
			     ,@(when args `((declare (ignorable ,@(mapcar 'car args)))))
			     ,@(loop with op-name = name
				  for (name type) in args
				  for interner = (third (assoc type coders))
				  when interner
				  collect `(setf ,name (,interner ,name))
				  when (eq 'ofs24 type)
				  collect (label-to-offset name op-name)
				  when (eq 'counted-ofs24 type)
				  collect (labels-to-offsets name))
			     ,@(unless (and (numberp pop) (numberp push) (= 0 pop push))
				       `((adjust-stack ,pop ,push)))
			     ,@(unless (and (numberp pop-scope) (numberp push-scope)
					    (= 0 pop-scope push-scope))
				       `((adjust-scope ,pop-scope ,push-scope)))
			     ,@(unless (and (numberp local) (zerop local))
				       `((when (and *current-method*
						    (> ,local (local-count *current-method*)))
					   (setf (local-count *current-method*) ,local))))
			     ,@(unless (and (numberp flag) (zerop flag))
				       `((when *current-method*
					   (setf (flags *current-method*)
						 (logior ,flag (flags *current-method*))))))
			     ,(if (null args)
				  `(list ,opcode)
				  `(append
				    (list ,opcode)
				    ,@(loop
					 for (name type) in args
					 for encoder = (second (assoc type coders))
					 when encoder
					 collect `(,encoder ,name))))))
		      #',name)))
           ;; fixme: gensyms
           (defop-disasm (name args opcode &rest ignore)
             (declare (ignore ignore))
             `(setf (gethash ,opcode *disassemble-opcodes*)
                    (flet ((,name (sequence &key (start 0))
                             (declare (ignorable sequence start))
                             (values
                               ,(if (null args)
                                    `(list ',name)
                                    `(let (junk)
                                       (list ',name
                                             ,@(loop for (name type) in args
                                                     for (nil decoder lookup) = (assoc type decoders)
                                                     collect`(progn
                                                               (setf (values junk start)
                                                                     (,decoder sequence :start start))
                                                               ,@(when lookup
                                                                   `((,lookup junk))))))))
                               start)))
                      #',name
)))
           ;;
           (defop-stack (name args opcode &optional (pop 0) (push 0) (pop-scope 0) (push-scope 0) (local nil) (flag 0) control-flow label more-labels &aux ignores)
             `(setf (gethash ,name *stack-effects-opcodes*)
                    (flet ((,name (,@(mapcar 'car args))
                             ,@ (when args
                                  `((declare (ignorable ,@(mapcar 'car args)))))
                                (multiple-value-call 'values
                               (let ,(loop with op-name = name
                                        for (name type) in args
                                        for interner = (third (assoc type coders))
                                        when interner
                                        collect `(,name (,interner ,name))
                                        and do (push name ignores)
                                        when (eq 'ofs24 type)
                                        collect `(,name (label-to-offset ,name ,op-name))
                                        and do (push name ignores)
                                        when (eq 'counted-ofs24 type)
                                        collect `(,name (labels-to-offsets ,name))
                                        and do (push name ignores))
                                 ,@(when ignores
                                         `((declare (ignorable ,@ignores))))
                                 (values ,pop ,push
                                         ,pop-scope ,push-scope
                                         ,local
                                         ,flag
                                         ,control-flow))
                               ,(if more-labels
                                    `(cons ,label
                                           ,more-labels)
                                    (when label
                                      `(list ,label))))))
                      #',name))))
      `(progn
         ,@(loop for op in ops
              collect (apply #'defop op)
              collect (apply #'defop-disasm op)
              collect (apply #'defop-stack op))))))


(defmacro define-asm-macro (name (&rest args) &body body)
  `(setf (gethash ',name *opcodes*)
         (lambda (,@args)
           ,@(if (stringp (car body))
                 (cdr body) ;; drop docstring ;TODO: store docstring somewhere?
                 body))))
(defmacro define-asm-macro-stack (name (&rest args) &body body)
  `(setf (gethash ',name *stack-effects-opcodes*)
         (lambda (,@args)
           ,@(if (stringp (car body))
                 (cdr body) ;; drop docstring ;TODO: store docstring somewhere?
                 body))))

;;; not sure if these should be handled like this or not...
(define-asm-macro :%label (name)
  (push (cons name *code-offset*) (label *current-method*))
  (assemble `((:label))))

(define-asm-macro-stack :%label (name)
  (values 0 0  0 0  0 0 :label name))


(define-asm-macro :%dlabel (name)
  ;; !!!! if this gets moved somewhere before the peephole optimizer, make
  ;; !!!! sure it leaves a nop of some sort in the instruction stream so we
  ;; !!!! don't combine stuff on either side of a jump target
  "for forward jumps, exception ranges, etc. that don't need an actual
jump instruction in the bytecode"
  (push (cons name *code-offset*) (label *current-method*))
  nil)
(define-asm-macro-stack :%dlabel (name)
  (values 0 0  0 0  0 0 :label name))


(define-asm-macro :%exception (name start end &optional (type-name 0) (var-name 0))
  ;; !!!! if this gets moved somewhere before the peephole optimizer, make
  ;; !!!! sure it leaves a nop of some sort in the instruction stream so we
  ;; !!!! don't combine stuff on either side of a jump target
  ;;
  "create an exception handler block named NAME, active between the
  labels START and END, catching objects of type TYPE-NAME (default to *)
  using VAR-NAME as name for :new-catch slot (default to no name)"
  (push (cons name *code-offset*) (label *current-method*))
  ;; vm pushes thrown object onto stack, so adjust stack depth
  (adjust-stack 0 1)
  ;; save the exception data
  (let ((index (length (exceptions *current-method*))))
    (vector-push-extend
     (make-instance 'exception-info
                    'from start
                    'to end
                    'target name
                    'exc-type (asm-intern-multiname type-name)
                    'var-name (asm-intern-multiname var-name))
     (exceptions *current-method*)
     (max 2 (length (exceptions *current-method*))))
    (push (cons name index)
          (exception-names *current-method*)))
  nil)
(define-asm-macro-stack :%exception (name start end &optional (type-name 0) (var-name 0))
  (declare (ignorable name start end type-name var-name))
  ;; fixme: enforce 0 stack depth at beginning of exception block?
  (values 0 1  0 0  0 0 :exception nil))


(defmacro with-assembler-context (&body body)
  `(let ((*assembler-context* (make-instance 'assembler-context)))
     ,@body))

;;; not sure if this should be asm level or not...
(define-asm-macro :%array-read (index)
  (assemble `((:push-int ,index)
              (:get-property (:multiname-l "" "")))))
