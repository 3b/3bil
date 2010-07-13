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
(defun %avm2-validate (peephole-code &key dump (test-live nil) (arg-count 1))
  (declare (optimize debug))
  (let* ((stack-at (make-array (length peephole-code) :initial-element nil))
         (label-info (make-hash-table))
         (min-stack 0)
         (min-scope 0)
         (max-stack 0)
         (max-scope 0)
         (max-local arg-count)
         (local-live nil)
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
       for (pop push pop-scope push-scope rlocals wlocals klocals flags
                control-flow labels)
         = (multiple-value-list (if fun (apply fun args)))
       do (loop for a in rlocals do (setf max-local (max max-local a)))
       do (loop for a in wlocals do (setf max-local (max max-local a)))
       do (loop for a in klocals do (setf max-local (max max-local a)))
       #++do (format t "(~s ~s) = ~s ~s ~s => ~s~%" op args rlocals wlocals klocals max-local)
       unless fun do (format t "no stack-check fun for op ~s?" op)
       when (eq control-flow :label)
       do (setf (gethash labels label-info) (list here i nil))
       when (eq control-flow :exception)
       do (setf (gethash labels label-info) (list here i nil))
         (push (list here i 0 0) work-list))
    (setf local-live (make-array (1+ max-local) :initial-element :u))
    ;; args are live
    (loop for i below (max 1 arg-count)
         do (assert (< i (length local-live)))
       do (setf (aref local-live i) :live))

    (setf work-list (nreverse work-list))
    (macrolet ((dump-assert (test &rest args)
                 `(unless ,test
                   (dump-asm)
                   (warn ,@(or args `(, (format nil "assert failed ~s" test)))))))
      (labels ((compatible-locals-p (locals)
                 (loop for l1 across locals
                    for l2 across local-live
                    do (dump-assert (or (eq l1 l2)
                                        (or (eq l1 :?) (eq l2 :?))
                                        (and (member l1 '(:k :u))
                                             (member l2 '(:k :u))))
                                    "local mismatch ~s / ~s" l1 l2))
                 t)
               (check-label (label stack scope)
                 (destructuring-bind (here index info) (gethash label label-info)
                   (if info
                       ;; if we have seen a ref to this label (actual label
                       ;; or a jump to it) make sure we have the same stack depth
                       (progn
                         (dump-assert (and (= stack (first info))
                                           (= scope (second info)))
                                      "stack mismatch at label ~s expected ~s/~s got ~s"
                                      label stack scope info)
                         (when test-live
                           (dump-assert (compatible-locals-p (third info))
                                        "incompatible locals at label ~s,~% expected ~s~% got ~s"
                                        label local-live (third info))))
                       (progn
                         #++(format t "add label ~s to worklist ~s~%" label local-live)
                         ;; if we haven't seen the label yet, add it to worklist
                         (push (list here index stack scope (copy-seq local-live))
                               work-list)
                         ;; and update stack info
                         (setf (third (gethash label label-info))
                               ;; fixme: switch to some setup that can
                               ;; share state for liveness stuff instead
                               ;; of copying
                               (list stack scope (copy-seq local-live)))))))
               (dump-asm ()
                 (loop
                    for op in peephole-code
                    for (stack scope ) across stack-at
                    do (format t "(~{~s~^ ~})   ====  ~s/ ~s~%"
                               op stack scope))))
        (loop
           for (code start stack scope %ll) = (pop work-list)
           for pass from 0
           with pass-max =  (length peephole-code)
           while code
           when %ll do (setf local-live (copy-seq %ll))
           else do
             (unless (zerop pass)
               #++(format t "starting pass ~s with no liveness data?~%" pass)
               (setf local-live (make-array (1+ max-local) :initial-element :?))
               (loop for i below arg-count do (setf (aref local-live i) :live)))
           do (assert (< pass pass-max))
           do (loop
                 for (op . args) = (pop code)
                 for i from start
                 for fun = (gethash op *stack-effects-opcodes*)
                 for (pop push pop-scope push-scope rlocals wlocals klocals flags
                          control-flow labels)
                 = (multiple-value-list
                    (if fun (apply fun args)))
                 for info = (aref stack-at i)
                 unless fun do (format t "no stack check fun for op ~s?" op)
                 ;; if we have already seen this entry, we are done current scan
                 when info
                 do (dump-assert (and (= stack (first info))
                                      (= scope (second info)))
                                 "stack mismatch at instr ~s expected ~s/~s got ~s"
                                 (cons op args) stack scope info)
                   (when test-live
                    (dump-assert (compatible-locals-p (third info))
                                 "incompatible locals at instr ~s,~% expected ~s~% got ~s"
                                 (cons op args) local-live (third info)))
                 and return nil
                 ;; check/update locals
                 do (loop for a in rlocals
                       do (dump-assert (or (eq (aref local-live a) :live)
                                           (eq (aref local-live a) :?))))
                 do (loop for a in wlocals
                       do (setf (aref local-live a) :live))
                 do (loop for a in klocals
                       do (dump-assert (>= a arg-count)
                                       "killing arg ~s / ~s" a arg-count)
                       do (setf (aref local-live a) :k))
                 ;; exceptions clear the stack, so handle specially
                 when (eq control-flow :exception)
                 do (setf stack (- push pop)
                          scope (- push-scope pop-scope))
                 else do
                 (incf stack (- push pop))
                 (incf scope (- push-scope pop-scope))
                 ;; update info for this index
                 (setf (aref stack-at i) (list stack scope (copy-seq local-live)))
                 ;; update min/max
                 (when (< stack 0 min-stack)
                   (format t "stack underflow? = ~s ~s" stack min-stack))
                 (setf min-stack (min min-stack stack)
                       min-scope (min min-scope scope)
                       max-stack (max max-stack stack)
                       max-scope (max max-scope scope))

                 ;; check/update label info
                 do (mapcar (lambda (x)
                              (check-label x stack scope))
                            (if (listp labels) labels (list labels)))
                 when (member control-flow '(t :throw :return))
                 return nil))
        (when (or (minusp min-stack) (minusp min-scope) dump)
          (format t "min-stack = ~s, min-scope = ~s~%" min-stack min-scope)
          (dump-asm))
        (values max-stack max-scope max-local)))))

(defun avm2-validate (code &key dump arg-count)
  (avm2-validate (peephole code) :dump dump :arg-count arg-count))

(defun fix-labels (forms)
  ;; verifier in 10.0 and earlier players seems to object to labels
  ;; with only conditional (or no? branches to them), so convert them to
  ;; to dlabel if no backwards jumps, otherwise put a jump right before it
  ;; -- actually, adding the extra jump seems to break things, and not
  ;;    be needed, so just converting to dlabel or dropping, need
  ;;    better tests at some point
  (let ((forward nil)
        (jump nil)
        (backwards nil)
        (seen nil))
    (flet ((add (x)
             (if (member x seen)
                 (push x backwards)
                 (push x forward))))
     (loop
        for (inst . args) in forms
        when (eq inst :%label)
        do (push (car args) seen)
        when (eq inst :jump)
        do (add (car args))
          (push (car args) jump)
        when (member inst '(:if-nlt :if-nle :if-ngt :if-nge
                            :if-true :if-false
                            :if-eq :if-ne :if-lt :if-le :if-gt :if-ge
                            :if-strict-eq :if-strict-ne))
        do (add (car args))
        when (eq inst ':lookup-switch)
        do (add (car args))
          (loop for i in (second args)
             do (add i))))
    #++(when forward
      (format t "~{~s~%~}" forms))
    #++(format t "fixing labels:~%fw=~s~% bw=~s~%j=~s~%"
            forward backwards jump)
    (loop for form in forms
       for (inst . args) = form
       for j = (and (eq inst :%label)
                       (member (car args) jump))
       for b = (and (eq inst :%label)
                            (member (car args) backwards))
       for f = (and (eq inst :%label)
                          (member (car args) forward))
       if (and j b)
       do (format t "keep label ~s~%" args) and
    ;   collect (list :jump (car args) ) and
       collect form ;; backwards and has a jump, keep as is
       else if b
    ;   do (format t "add jump to label ~s~%" args) and
     ;  collect (list :jump (car args) ) ;; backwards, no jump.. add one
       ;and
       collect form
       else if f
       do (format t " label -> dlabel ~s~%" args) and
       collect `(:%dlabel ,@args) ;; forward only, convert to dlabel
       else if (eq inst :%label)
       do (format t " drop label ~s ~s ~s ~s~%" args f b j) and
      ; collect `(:%dlabel ,@args) and
       do (assert (not (or j f b))) ;; no jumps, drop it
       else ;; everything else, just keep it
       collect form
         )
)

)
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
        v-local
        (p-code (peephole (fix-labels forms))))
    (setf (values v-stack v-scope v-local)
          (%avm2-validate p-code :arg-count arg-count))
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
    (unless (eql (local-count *current-method*) v-local)
      (warn "changing local count from ~s to ~s" (local-count *current-method*) v-local))
    (setf (max-stack *current-method*) v-stack)
    ;(setf (local-count *current-method*) (+ 2 v-local))
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
    (flet ((defop (name args opcode pop push
                        &key (pop-scope 0) (push-scope 0)
                        (read-locals nil) (write-locals nil) (kill-locals nil)
                        (flags 0)
                        &allow-other-keys
                        ;(control-flow-flag nil)
                        ;(label nil) (more-labels nil)
                        ;class-dep
                        ;function-dep
                        ;name args opcode
                        &aux (l (gensym)))
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
                             ;; fixme: get rid of duplication here...
			     ,@ (when read-locals
                                  `((let ((,l ,(if (= 1 (length read-locals))
                                                  (car read-locals)
                                                  `(reduce 'max ,read-locals :initial-value 0))))
                                      (when (and *current-method*
                                                 (> ,l (local-count *current-method*)))
                                        (setf (local-count *current-method*) ,l)))))
			     ,@ (when write-locals
                                  `((let ((,l ,(if (= 1 (length write-locals))
                                                  (car write-locals)
                                                  `(reduce 'max ,write-locals :initial-value 0))))
                                      (when (and *current-method*
                                                 (> ,l (local-count *current-method*)))
                                        (setf (local-count *current-method*) ,l)))))
			     ,@ (when kill-locals
                                  `((let ((,l ,(if (= 1 (length kill-locals))
                                                  (car kill-locals)
                                                  `(reduce 'max ,kill-locals :initial-value 0))))
                                      (when (and *current-method*
                                                 (> ,l (local-count *current-method*)))
                                        (setf (local-count *current-method*) ,l)))))
                                ,@(unless (and (numberp flags) (zerop flags))
				       `((when *current-method*
					   (setf (flags *current-method*)
						 (logior ,flags (flags *current-method*))))))
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
           (defop-disasm (name args opcode &rest ignore )
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
           (defop-stack (name args opcode pop push
                              &key
                              (pop-scope 0) (push-scope 0)
                              (read-locals nil) (write-locals nil)
                              (kill-locals nil)
                              (flags 0) control-flow-flag label more-labels
                              &allow-other-keys
                              &aux ignores)
             (declare (ignore opcode))
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
                                         ,read-locals ,write-locals ,kill-locals
                                         ,flags
                                         ,control-flow-flag))
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
  (values 0 0  0 0  nil nil nil  0 :label name))


(define-asm-macro :%dlabel (name)
  ;; !!!! if this gets moved somewhere before the peephole optimizer, make
  ;; !!!! sure it leaves a nop of some sort in the instruction stream so we
  ;; !!!! don't combine stuff on either side of a jump target
  "for forward jumps, exception ranges, etc. that don't need an actual
jump instruction in the bytecode"
  (push (cons name *code-offset*) (label *current-method*))
  nil)
(define-asm-macro-stack :%dlabel (name)
  (values 0 0  0 0  nil nil nil  0 :label name))
(define-asm-macro-stack :comment (&rest r)
  (declare (ignore r))
  (values 0 0  0 0  nil nil nil  0 ))


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
  (values 0 1  0 0  nil nil nil  0 :exception nil))


(defmacro with-assembler-context (&body body)
  `(let ((*assembler-context* (make-instance 'assembler-context)))
     ,@body))

;;; not sure if this should be asm level or not...
(define-asm-macro :%array-read (index)
  (assemble `((:push-int ,index)
              (:get-property (:multiname-l "" "")))))
