(in-package :avm2-compiler)

;;; expand multiple arg math/comparison ops into chained binary ops

#+-
(defmacro define-transitive-binops (&body ops)
  (let ((i (gensym)))
    `(progn
       ,@(loop for (op opcode identity unary-op) in ops
            collect `(defmethod scompile-cons ((car (eql ',op)) cdr)
                       (case (length cdr)
                         (0 ,(if identity `(scompile ,identity) `(error "not enough arguments for ~a" ,op)))
                         (1 ,(if unary-op
                                 `(scompile `(,',unary-op ,(first cdr)))
                                 `(scompile (first cdr))))
                         (2 (append
                             (scompile (first cdr))
                             (scompile (second cdr))
                             `((,',opcode)
                               (:coerce-any))))
                         (t
                          (append
                           (scompile (first cdr))
                           (loop for ,i in (cdr cdr)
                              append (scompile ,i)
                              collect `(,',opcode))
                           '((:coerce-any))))))))))

#+-
(define-transitive-binops
  (+ :add 0)
  (- :subtract nil %1-)
  (* :multiply 1)
  (/ :divide nil %1/)
  (logior :bit-or 0)
  (logxor :bit-xor 0)
  (logand :bit-and -1)
  ;; (logeqv ??? -1)
)
;;(scompile '(+))
;;(scompile '(+ 1))
;;(scompile '(+ 1 2))
;;(scompile '(+ 1 2 3))

#+-
(defmacro define-compare-binops (&body ops)
  (let ((i (gensym))
        (j (gensym)))
    `(progn
       ,@(loop for (op opcode) in ops
            collect `(defmethod scompile-cons ((car (eql ',op)) cdr)
                       (case (length cdr)
                         (0 (error "not enough arguments for ~a" ',op))
                         (1 `((:push-true)
                              (:coerce-any)))
                         (2 (append
                             (scompile (first cdr))
                             (scompile (second cdr))
                             `((,',opcode)
                               (:coerce-any))))
                         (t
                          (append
                           (scompile (first cdr))
                           (scompile (second cdr))
                           `((,',opcode))
                           (loop for (,i ,j) on (cdr cdr)
                              while ,j
                              append (scompile ,i)
                              append (scompile ,j)
                              collect `(,',opcode)
                              collect `(:bit-and) ;; no logical and?
                                )
                           '((:coerce-any))))))))))

#+-
(define-compare-binops
    (< :less-than)
    (<= :less-equals)
    (= :equals)
    (>= :greater-equals)
    (> :greater-than))

;; (scompile '(< 1 2 3 4))