(in-package :as3-compiler)

;;;; misc low level operators, mostly just renaming asm opcodes
;;; might not actually need most of these now, use %asm instead?

(defmacro define-0ary-ops (&body ops)
  `(progn
     ,@(loop for i in ops
          collect `(defmethod scompile-cons ((car (eql ',(car i))) cdr)
                     (declare (ignore cdr))
                     '((,(second i)))))))

(define-0ary-ops
  (%break :breakpoint)
  (%nop :nop)
  (%pop :pop)
  (%dup :dup)
  (%swap :swap)
  (%push-null :push-null)
  )

(defmacro define-unary-ops (&body ops)
  `(progn
     ,@(loop for i in ops
          collect `(defmethod scompile-cons ((car (eql ',(car i))) cdr)
                     (append
                      (scompile (first cdr))
                      '((,(second i))))))))

(define-unary-ops
  (throw throw)
  (%1- :negate)
  (%1++ :increment)
  (%1-- :decrement)
  (type-of :type-of)
  (not :not)
  (lognot :bit-not)
  (%to-integer :convert-integer)
  (%to-double :convert-double)
  (%to-string :convert-string)
)

(define-special %1/ (value)
  (append
   '((:push-byte 1))
   (scompile value)
   '((:divide))))
;; (scompile '(%1/ 1.234))

(defmacro define-binops (&body ops)
  `(progn
     ,@(loop for i in ops
          collect `(defmethod scompile-cons ((car (eql ',(car i))) cdr)
                     (append
                      (scompile (first cdr))
                      (scompile (second cdr))
                      '((,(second i))))))))

(define-binops
  (mod :modulo)
  (lsh :lshift)
  (rsh :rshift)
  (ursh :unsigned-rshift)
  (equal :equals) ;; fixme: decide if these are mapped correctly
  (eq :strict-equals) ;; fixme: decide if these are mapped correctly

  (instance-of :instance-of)

  (%2< :less-than)
  (%2<= :less-equals)
  (%2>  :greater-than)
  (%2>= :greater-equals)

  (%2+ :add)
  (%2- :subtract)
  (%2* :multiply)
  (%2/ :divide)
  (%2logand :bit-and)
  (%2logor  :bit-or)
  (%2logxor :bit-xor)
  )
