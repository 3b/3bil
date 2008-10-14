(in-package :as3-asm)


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
   (exceptions :initform nil :initarg exceptions :accessor exceptions)
   (traits :initform nil :initarg traits :accessor traits)
   ;; temporaries for tracking values during assembly
   (current-stack :initform 0 :accessor current-stack)
   (current-scope :initform 2 :initarg current-scope :accessor current-scope)
   (flags :initform 0 :accessor flags)
   (label :initform () :accessor label)
   (fixups :initform () :accessor fixups)))


(defparameter *current-method* nil)
(defparameter *code-offset* 0)

(defun assemble (forms)
  "simple assembler, returns sequence of octets containing the
  bytecode corresponding to forms, doesn't currently do any interning,
  so pass indices into constant pool instead of actual values"
  (format t "assembling :~%---------~% ~s~%-------~%" forms)
  (let ((*code-offset* 0))
    (loop for i in (peephole forms)
       for opcode = (gethash (car i) *opcodes*)
       for octets = (when opcode (apply opcode (cdr i)))
       if opcode
       append octets
       and do (format t "assemble ~s-> ~s ofs = ~s + ~s ~%"
                      i octets *code-offset* (length octets))
       and do (incf *code-offset* (length octets))
       else do (error "invalid opcode ~s " i))))

(defun assemble-method-body (forms &key (init-scope 0)
                             (max-scope 1 max-scope-p)
                             (max-stack 1 max-stack-p))
  (let ((*current-method* (make-instance 'method-body
                                         'local-count 1
                                         'max-stack 1
                                         'init-scope-depth init-scope
                                         'max-scope-depth init-scope
                                         'current-scope init-scope)))
    (setf (code *current-method*)
          (assemble forms))
    (when max-stack-p
      (setf (max-stack *current-method*) max-stack))
    (when max-scope-p
      (setf (max-scope-depth *current-method*) (+ init-scope max-scope)))
    (when (fixups *current-method*)
      ;; fix any fixups
      (loop for (label . addr) in (fixups *current-method*)
         for dest = (cdr (assoc label (label *current-method*)))
         when  dest
         do (replace (code *current-method*)
                     (u24-to-sequence (- dest addr 4))
                     :start1 (+ 1 addr ))
         ;;and do (format t "fixup ~s ~%" label)
         else do (format t "!!!!! unknown fixup ~s !!! ~%" label)))
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
     ;;do (format t "sum = ~s, j=~s b=~s ofs=~s s2=~s~%"
     ;;           sum j (ldb (byte 7 0) j) offset
     ;;           (dpb (ldb (byte 7 0) j) (byte 7 offset) sum))
     do (setf (ldb (byte 7 offset) sum) (ldb (byte 7 0) j))
     while (logbitp 7 j)
     finally (return (values sum (1+ i)))))

(defun decode-qname (sequence &key (start 0))
  (multiple-value-bind (id start)
      (decode-variable-length sequence :start start)
    (if (boundp '*assembler-context*)
        (let* ((mn (elt (multinames *assembler-context*) id)))
          (values (list (car mn)
                        (elt (strings *assembler-context*) (second mn))
                        (elt (strings *assembler-context*) (third mn))
                        (nthcdr 3 mn ))
                  start))
        (values id start))))

(defun decode-counted-s24 (sequence &key (start 0))
  (multiple-value-bind (count start)
      (decode-variable-length sequence :start start)
    (values
     (loop repeat count
        with value
        do (setf (values value start) (decode-u24 sequence :start start))
        collect value)
     start)))


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

(defun as3-disassemble (sequence &key (start 0))
  (loop
     for length = (length sequence)
     with op = nil
     for byte = (elt sequence start)
     for dis = (gethash byte *disassemble-opcodes*)
     ;;do (format t "op=~s byte=~s start=~s cur-seq=~{ ~2,'0x~}~%   dis=~s ~%"
     ;;           op byte start (coerce
     ;;                          (subseq sequence start (min length
     ;;                                                      (+ start 8))) 'list) dis)
     do (incf start)
     when dis
     do (setf (values op start) (funcall dis sequence :start start))
     ;;and do (format t "op -> ~s start -> ~s~%" op start)
     and collect op
     else do (error "invalid byte ~s at ~d " byte start)
     while (< start length)))


;;; these don't actually work in general, since they don't take
;;; branching into account, but simplifies things for now...
(defun adjust-stack (pop push)
  (when *current-method*
    (decf (current-stack *current-method*) pop)
    ;;(when (< (current-stack *current-method*) 0)
    ;;  (error "assembler error : stack underflow !"))
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


(defmacro define-ops (&body ops)
  (let ((coders
         `((u8 . list)
           (u16 . u16-to-sequence)
           (u24 . u24-to-sequence)
           (s24 . u24-to-sequence)
           (ofs24 . u24-to-sequence) ;; for using labels directly in branches
           (u30 . variable-length-encode)
           (q30 . variable-length-encode) ;; hack for name interning
           (u32 . variable-length-encode)
           (s32 . variable-length-encode)
           (double . double-to-sequence)
           (counted-s24 . counted-s24-to-sequence)))
        (decoders
         `((u8 . (lambda (s &key (start 0)) (elt s start)))
           (u16 . decode-u16)
           (u24 . decode-u24)
           (s24 . decode-u24)
           (ofs24 . decode-u24) ;; for using labels directly in branches
           (u30 . decode-variable-length)
           (q30 . decode-qname) ;; hack for name interning
           (u32 . decode-variable-length)
           (s32 . decode-variable-length)
           (double . (lambda (s) (error "not done")))
           (counted-s24 . decode-counted-s24))))
    (flet ((defop (name args opcode
                        &optional (pop 0) (push 0) (pop-scope 0) (push-scope 0) (local 0) (flag 0))
             `(setf (gethash ',name *opcodes*)
                    (lambda ,(mapcar 'car args)
                      ,@(when args `((declare (ignorable ,@(mapcar 'car args)))))
                      ;;(format t "assemble ~a ~%" ',name)
                      ,@(loop
                           for (name type) in args
                           when (eq 'q30 type)
                           collect `(when (and (consp ,name)
                                               (eql 'qname (car ,name)))
                                      (setf ,name (apply 'qname (rest ,name))))
                           when (eq 'ofs24 type)
                           collect
                             (let ((dest (gensym "DEST-"))
                                   (here (gensym "HERE-")))
                               `(when (symbolp ,name)
                                  (let ((,dest (cdr (assoc ,name (label *current-method*))))
                                        (,here *code-offset*))
                                    (unless ,dest
                                      (push (cons ,name ,here) (fixups *current-method*))
                                      (setf ,dest (+ 4 ,here)))
                                    (setf ,name (- ,dest ,here 4))
                                    #+ (or) (format t ">>>set ~s to ~s" ',name ,name)))))
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
                                          (logior ,local (flags *current-method*))))))
                      ,(if (null args)
                           `(list ,opcode)
                           `(append
                             (list ,opcode)
                             ,@(loop
                                  for (name type) in args
                                  for encoder = (cdr (assoc type coders))
                                  when encoder
                                  collect `(,encoder ,name)))))))
           ;; fixme: gensyms
           (defop-disasm (name args opcode &rest ignore)
             (declare (ignore ignore))
             `(setf (gethash ,opcode *disassemble-opcodes*)
                    (lambda (sequence &key (start 0))
                      (declare (ignorable sequence start))
                      (values
                       ,(if (null args)
                            `(list ',name)
                            `(let (junk)
                               ;;(declare (ignore junk))
                               (list ',name
                                     ,@(loop for (name type) in args
                                          for decoder = (cdr (assoc type decoders))
                                          collect `(setf (values junk start)
                                                         (,decoder sequence :start start))))))
                       start)))))
      `(progn
         ,@(loop for op in ops
              collect (apply #'defop op)
              collect (apply #'defop-disasm op))))))


(defmacro define-asm-macro (name (&rest args) &body body)
  `(setf (gethash ',name *opcodes*)
         (lambda (,@args)
           ,@body)))

;;; not sure if these should be handled like this or not...
(define-asm-macro :%label (name)
  (push (cons name *code-offset*) (label *current-method*))
  (assemble `((:label))))


(define-asm-macro :%dlabel (name)
  ;; !!!! if this gets moved somewhere before the peephole optimizer, make
  ;; !!!! sure it leaves a nop of some sort in the instruction stream so we
  ;; !!!! don't combine stuff on either side of a jump target
  ;; for forward jumps, just mark the location but don't put a label instr
  (push (cons name *code-offset*) (label *current-method*))
  nil)


(defmacro with-assembler-context (&body body)
  `(let ((*assembler-context* (make-instance 'assembler-context)))
     ,@body))