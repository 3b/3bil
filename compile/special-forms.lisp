(in-package :as3-compiler)

;;;; special forms (and probably some things that are techically
;;;; macros/functions according to CL, but implemented directly here
;;;; for now...)

;; official list of special operators:
;; http://www.lispworks.com/documentation/HyperSpec/Body/03_ababa.htm#clspecialops


(define-special progn (&rest cdr)
  (loop for rest on cdr
     for form = (car rest)
     for next = (cdr rest)
     ;;do (format t "car=~s cdr=~s ~%form=~% ~s next=~s~%" car cdr form next)
     append (scompile form)
     ;; ignore return values from intermediate steps
     when (or next (and (consp form) (eql (car form) 'return)))
     append '((:pop))))


;; (scompile '(progn "foo" "bar" :true))

(define-special return (value)
  ;;(format t "ret car=~s cdr = ~s~%" car cdr)
  `(,@(scompile value)
      (:return-value)))

;;; fixme: this adds a :pop after :return-value, is that correct?
;; (scompile '(progn "foo" (return :false) :true))




(define-special let (bindings &rest body)
  (let ((*current-lambda* *current-lambda*))
    (append
     ;; set up bindings
     (loop for binding in bindings
        for j from (length (locals *current-lambda*))
        if (consp binding)
        append (scompile (second binding))
        and collect `(:set-local ,j ))
     (loop for binding in bindings
        for j from (length (locals *current-lambda*))
        if (consp binding)
        do (push (cons (car binding) j) (locals *current-lambda*))
        else
        do (push (cons binding j) (locals *current-lambda*))
        finally (return nil))
     ;; compile the body as a progn, and kill the locals on exit
     `(,@(scompile `(progn ,@body))
         ,@(loop for binding in bindings
              for name = (if (consp binding) (car binding) binding)
              collect `(:kill ,(get-lambda-local-index name)))))))
;; (with-lambda-context (foo) (scompile '(let ((foo 1.23) (bar foo)) foo)))


(define-special let* (bindings &rest body)
  (let ((*current-lambda* *current-lambda*))
    (append
     ;; set up bindings
     (loop for binding in bindings
        for j from (length (locals *current-lambda*))
        if (consp binding)
        append (scompile (second binding))
        and collect `(:set-local ,j )
        and do (push (cons (car binding) j) (locals *current-lambda*))
        else
        do (push (cons binding j) (locals *current-lambda*)))
     ;; compile the body as a progn, and kill the locals on exit
     `(,@(scompile `(progn ,@body))
         ,@(loop for binding in bindings
              for name = (if (consp binding) (car binding) binding)
              collect `(:kill ,(get-lambda-local-index name)))))))
;; (with-lambda-context (foo) (scompile '(let* ((foo 1.23) (bar foo)) foo)))


(define-special %set-local (local value)
  ;; (%set-local var value) -> value
  ;;(format t "set local ~s = ~s ~%" local value)
  `(,@(scompile value) ;; calculate value
      (:dup)                   ;; copy value so we can reurn it
      (:set-local ,(get-lambda-local-index local))))
;; (with-lambda-context (foo) (scompile '(%set-local foo 2.3)))

(define-special %asm (&rest cdr)
  ;; (%asm '((op1 args) (op2 ...) ... ))
  (:copy-list cdr))


(define-special %label (target)
  ;; (%label name) ;; for reverse jumps only
  `((%label ,target)
    ;; hack since we always pop after each statement in a progn, gets
    ;; removed later by peephole pass
    (:push-null)))

(define-special %dlabel (target)
  ;; (%dlabel name) ;; for forward jumps only
  `((%dlabel ,target)
    (:push-null)))

(define-special go (target)
  ;; (go label)
  `((:jump ,target)
    (:push-null)))


(define-special %when (cond label)
  ;; (%when cond label)
  `(,@(scompile cond)
      (:if-true ,label)
      (:push-null)))

(define-special when (cond &rest body)
  ;; (when cond body)
    (let ((label (gensym))
          (label2 (gensym)))
      `(,@(scompile cond)
          (:if-false ,label)
          ,@(scompile `(progn ,@body))
          (:coerce-any)
          (:jump ,label2)
          (:%dlabel ,label)
          (:push-null)
          (:coerce-any)
          (:%dlabel ,label2))))

;; (as3-asm::with-assembler-context (as3-asm::code (as3-asm:assemble-method-body (scompile '(when :true 1)) )))


(define-special %inc-local-i (var)
  ;; (%inc-local-i var)
  `((inc-local-i ,(get-lambda-local-index var))
    ;; hack since we always pop after each statement in a progn :/
    (get-local ,(get-lambda-local-index var))))

(define-special dotimes ((var count &optional result) &rest body)
  ;; (dotimes (var count &optional result) body)

  ;; set local for counter
  ;; set local for limit
    ;;(format t "dotimes : var=~s count=~s result=~s~%body=~s~%" var count result body)
    (let ((label (gensym))
          (label2 (gensym))
          (max (gensym)))
      (scompile                         ; format t "~s"
       `(let ((,max ,count)
              ;; var should not be valid while evaluating max
              (,var 0))
          (go ,label2)
          (%label ,label)
          ,@body
                                        ;(%set-local ,var (+ ,var 1))
          (%inc-local-i ,var)
          (%dlabel ,label2)
          (%when (%2< ,var ,max) ,label)
          ;; fixme: make sure var is still valid, and = max while evaluating result
          ,@(if result
                `(result)
                '((%asm (push-null)
                   (coerce-any))))))))



(defmethod scompile-cons ((car (eql 'and)) cdr)
  (case (length cdr)
    (0 `((:push-true)))
    (1 (scompile (first cdr)))
    (t
     (let ((true-label (gensym "true-"))
           (false-label (gensym "false-")))
       (append
        (loop for first = t then nil
           for i in cdr
           unless first collect `(:pop)
           append (scompile i)
           collect `(:dup)
           collect `(:if-false ,false-label))
        `((:jump ,true-label)
          (%dlabel ,false-label)
          (:pop)
          (:push-false)
          (%dlabel ,true-label)))))))

;;(scompile '(and))
;;(scompile '(and 1))
;;(scompile '(and 1 2))


