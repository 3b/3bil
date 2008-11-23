

;;; using functions for opcodes lets SLIME autodoc give arglist hints,
;;; but we get conflicts with CL function names, so just using symbols
;;; for now...

(defun assemble (forms)
  "simple assembler, returns sequence of octets containing the
  bytecode corresponding to forms, doesn't currently do any interning,
  so pass indices into constant pool instead of actual values"
  (format t "assembling :~%---------~% ~s~%-------~%" forms)
  (let ((*code-offset* 0))
    (loop for i in (peephole forms)
       for octets = (apply #'funcall i)
       append octets
       do (format t "assemble ~s-> ~s ofs = ~s + ~s ~%"
                      i octets *code-offset* (length octets))
       do (incf *code-offset* (length octets)))))

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
           (counted-s24 . counted-s24-to-sequence))))
    (flet ((defop (name args opcode
                        &optional (pop 0) (push 0) (pop-scope 0) (push-scope 0) (local 0) (flag 0))
             `(defun ,name ,(mapcar 'car args)
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
      `(progn
         ,@(loop for op in ops
              collect (apply #'defop op))))))
