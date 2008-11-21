(in-package :as3-compiler)

;;;; special forms (and probably some things that are techically
;;;; macros/functions according to CL, but implemented directly here
;;;; for now...)

;; official list of special operators:
;; http://www.lispworks.com/documentation/HyperSpec/Body/03_ababa.htm#clspecialops


;;+ let*
;;+ if
;;+ progn
;;+ let
;;
;;+ go
;;+ tagbody
;;
;; quote
;;
;; function
;; setq
;;
;; symbol-macrolet
;; flet
;; macrolet
;; labels
;;
;; block
;; catch
;; return-from
;; throw
;; unwind-protect
;;
;; progv
;;
;; multiple-value-call
;; multiple-value-prog1
;;
;; the
;;
;; load-time-value
;; eval-when
;; locally


(define-special* progn (cdr)
  (loop for rest on cdr
     for form = (car rest)
     for next = (cdr rest)
     append (scompile form)
     ;; ignore return values from intermediate steps
     when (or next (and (consp form) (eql (car form) 'return)))
     append '((:pop))))


;; (scompile '(progn "foo" "bar" :true))

(define-special return (value)
  `(,@(scompile value)
      (:return-value)))

;;; fixme: this adds a :pop after :return-value, is that correct?
;; (scompile '(progn "foo" (return :false) :true))




(define-special let (bindings &rest body)
  (let ((bindings-indices
         (loop for binding in bindings
            for j from (last-local-index)
            for init = (if (listp binding) (second binding) nil)
            for name = (if (listp binding) (first binding) binding)
            collect `(,init ,name . ,j))))
    (with-cleanup ((gensym "LET-CLEANUP")
                     `(%asm (:comment "let-kill")
                           ,@(loop for (nil nil . index) in bindings-indices
                                collect `(:kill ,index)
                                collect `(:push-null))))
     (append
      ;; set up bindings
      (loop for (init nil . index) in bindings-indices
         append (scompile init)
         collect `(:set-local ,index ))
      (with-local-vars ((mapcar 'cdr bindings-indices))
        ;; compile the body as a progn, and kill the locals on exit
        `(,@(scompile
             `(progn ,@body))
            ,@(loop for (nil nil . index) in bindings-indices
                 collect `(:kill ,index))))))))
;; (with-lambda-context (:args '(foo)) (scompile '(let ((foo 1.23) (bar foo)) foo)))

;;; let* is uglier to implement without modifying lambda context stuff
;;; directly, so implementing in terms of let with a macro in cl lib
;;; stuff
;;(define-special let* (bindings &rest body)
;;  (with-nested-lambda-context
;;    (append
;;     ;; set up bindings
;;     (loop for binding in bindings
;;        for j from (length (locals *current-lambda*))
;;        if (consp binding)
;;        append (scompile (second binding))
;;        and collect `(:set-local ,j )
;;        and do (push (cons (car binding) j) (locals *current-lambda*))
;;        else
;;        do (push (cons binding j) (locals *current-lambda*)))
;;     ;; compile the body as a progn, and kill the locals on exit
;;     `(,@(scompile `(progn ,@body))
;;         ,@(loop for binding in bindings
;;              for name = (if (consp binding) (car binding) binding)
;;              collect `(:kill ,(get-lambda-local-index name)))))))
;; (with-simple-lambda-context (foo) (scompile '(let* ((foo 1.23) (bar foo)) foo)))


(define-special %set-local (local value)
  ;; (%set-local var value) -> value
  `(,@(scompile value) ;; calculate value
      (:dup)                   ;; copy value so we can reurn it
      (:set-local ,(get-lambda-local-index local))))
;; (with-lambda-context (foo) (scompile '(%set-local foo 2.3)))

(define-special %asm (&rest cdr)
  ;; (%asm (op1 args) (op2 ...) ... )
  (copy-list cdr))


(define-special %label (target)
  ;; (%label name) ;; for reverse jumps only
  `((:%label ,target)
    ;; hack since we always pop after each statement in a progn, gets
    ;; removed later by peephole pass
    (:push-null)))

(define-special %dlabel (target)
  ;; (%dlabel name) ;; for forward jumps only
  `((:%dlabel ,target)
    (:push-null)))

(define-special %go (target)
  ;; (go asm-label)
  `((:jump ,target)
    (:push-null)))

(define-special* tagbody (body)
  (let ((tags (loop for tag-or-form in body
                 when (atom tag-or-form)
                 collect (cons tag-or-form
                               (gensym (format nil "TAGBODY-~a-" tag-or-form))))))
    (with-nested-lambda-tags (tags)
      ;; fixme: use dlabel for forward jumps
      `(,@(loop for tag-or-form in body
             if (atom tag-or-form)
             collect `(:%label ,(get-lambda-tag tag-or-form))
             else
             append (scompile tag-or-form)
             and collect `(:pop))
          (:push-null)))))

(define-special go (tag)
  (scompile-cons '%go (list (get-lambda-tag tag))))

;; (with-lambda-context () (scompile '(tagbody foo (go baz) bar 1 baz 2)))

#+nil(define-special %when (cond label)
  ;; (%when cond label)
  `(,@(scompile cond)
      (:if-true ,label)
      (:push-null)))

#+nil(define-special when (cond &rest body)
  ;; (when cond body)
    (let ((label (gensym "WHEN1-"))
          (label2 (gensym "WHEN2-")))
      `(,@(scompile cond)
          (:if-false ,label)
          ,@(scompile `(progn ,@body))
          (:coerce-any)
          (:jump ,label2)
          (:%dlabel ,label)
          (:push-null)
          (:coerce-any)
          (:%dlabel ,label2))))

(define-special %if (cond false-test true-branch false-branch)
  (let (#+nil(true-label (gensym "%IF-TRUE-"))
        (false-label (gensym "%IF-FALSE-"))
        (end-label (gensym "%IF-END-")))
    `(,@(scompile cond)
        (,false-test ,false-label)
        ,@(scompile true-branch)
        (:coerce-any)
        (:jump ,end-label)
        (:%dlabel ,false-label)
        ,@(scompile false-branch)
        (:coerce-any)
        (:%dlabel ,end-label))))

(define-special if (cond true-branch false-branch)
  `(,@(scompile `(%if ,cond :if-false ,true-branch ,false-branch))))

;; (as3-asm::with-assembler-context (as3-asm::code (as3-asm:assemble-method-body (scompile '(when :true 1)) )))


(define-special %inc-local-i (var)
  ;; (%inc-local-i var)
  `((:inc-local-i ,(get-lambda-local-index var))
    ;; hack since we always pop after each statement in a progn :/
    (:get-local ,(get-lambda-local-index var))))

(define-special dotimes ((var count &optional result) &rest body)
  ;; (dotimes (var count &optional result) body)

  ;; set local for counter
  ;; set local for limit
    ;;(format t "dotimes : var=~s count=~s result=~s~%body=~s~%" var count result body)
    (let ((label (gensym "LABEL-"))
          (label2 (gensym "LABEL2-"))
          (max (gensym "MAX-")))
      (scompile                         ; format t "~s"
       `(let ((,max ,count)
              ;; var should not be valid while evaluating max
              (,var 0))
          (%go ,label2)
          (%label ,label)
          ,@body
                                        ;(%set-local ,var (+ ,var 1))
          (%inc-local-i ,var)
          (%dlabel ,label2)
          (%when (%2< ,var ,max) ,label)
          ;; fixme: make sure var is still valid, and = max while evaluating result
          ,@(if result
                '(result)
                '((%asm
                   (:push-null)
                   (:coerce-any))))))))



#+nil(defmethod scompile-cons ((car (eql 'and)) cdr)
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
          (:%dlabel ,false-label)
          (:pop)
          (:push-false)
          (:%dlabel ,true-label)))))))

;;(scompile '(and))
;;(scompile '(and 1))
;;(scompile '(and 1 2))


(define-special* %array (args)
  ;; (%array ... ) -> array
  `(,@(loop for i in args
         append (scompile i)) ;; calculate args
      (:new-array ,(length args))))


(define-special %error (value)
  `(,@(scompile value)
      (:throw)))

#+nil(define-special %typep (object type)
  `(,@(scompile object)
      (:is-type ,type)))

(define-special %typep (object type)
  `(,@(scompile object)
      (:get-lex ,type)
      (:is-type-late )))

(define-special %type-of (object)
  `(,@(scompile object)
      (:type-of)))


;;; block/return-from
;;;
;;; store list of blocks in context, each block has cleanup code and a jump target?
;;
;; return-from needs to be careful with stack, if it isn't just
;;   calling :Return-foo
#||
;; simple case:
 (block foo (return-from foo 1))
 push block foo, label = (gensym block-foo)
   ,@body
      ,@compile return-value
      jump ,label
   dlabel ,label
 pop block

;; simple uwp
 (block bleh (unwind-protect (return-from bleh 1) 2))
 push block bleh, label1 = gensym
   push block uwp, label2 = gensym, cleanup = gensym
     ,@compile return-value = 1
     set-local foo <index of goto to come back here>
     jump cleanup
     label %foo
     jump label1
     dlabel cleanup
     ,@compile cleanup = 2
     pop
     computed-goto back to %foo
     dlabel label2
   pop block uwp
   dlabel label1
 pop block bleh

;; misc tests:
 (block bleh (unwind-protect (unwind-protect 1 2) 3))


||#
(define-special block (name &body body)
  (let ((end (gensym "BLOCK-END-")))
    (with-nested-lambda-block ((cons name (make-lambda-block name end nil end))
                               end)
      `(,@(scompile `(progn ,@body))
          (:coerce-any)
          (:set-local ,(get-lambda-local-index end))
          (:%dlabel ,end)
          (:get-local ,(get-lambda-local-index end))))))

(define-special %flet ((fn-name (&rest fn-args) &body fn-body) &body body)
  "limited version of flet, only handles 1 function, can't manipulate
the function directly, can only call it within the current function,
only normal args (no &rest,&key,&optional,etc)
call with %flet-call, which sets up hidden return label arg
"
  ;; todo: handle multiple functions?
  ;; fixme:would be nicer to put these at the end with the continuation table,
  ;; but just compiling inline with a jump over it for now...
  (let* ((end-label (gensym "%FLET-END-"))
         (return-arg (gensym "%FLET-CONTINUATION-"))
         (locals (loop for arg in (cons return-arg fn-args)
                    for j from (last-local-index)
                    collect (cons arg j))))
    ;; locals for a flet are ugly, since they need to keep their
    ;; indices allocated during body, but names are only valid during
    ;; fn-body, so we wrap both in with-local-vars, but kill the names
    ;; after fn-body
    ;; we also add an implicit 'return' param to specify the continuation
    (with-local-vars (locals)
      ;;fixme: hack- write real code for this
      (push (cons fn-name locals) (%flets *current-lambda*))
      `((:jump ,end-label)
        (:%label ,fn-name)
        ;; load parameters into regs
        #+nil,@(loop for (nil . i) in locals
             collect `(:set-local ,i) into temp
             finally (return (nreverse temp)))
        ;; compile %flet body
        ,@(scompile `(progn ,@fn-body))
        (:coerce-any)
        ;; store return value
        (:set-local ,(get-lambda-local-index (local-return-var *current-lambda*)))
        ;; push return address index
        (:get-local ,(get-lambda-local-index return-arg))
        (:set-local ,(get-lambda-local-index (continuation-var *current-lambda*)))
        ;; kill locals
        ,@(loop for (nil . i) in locals
             collect `(:kill ,i))
        ;; return through continuation table
        (:jump ,(continuation-var *current-lambda*))
        ;; remove local variable names from current scope (keeping indices used)
        ,@(progn (kill-lambda-local-names fn-args)
                 nil)
        (:%dlabel ,end-label)
        ;; compile main body
        ,@(scompile `(progn ,@body))))))

(define-special call-%flet (name &rest args)
  (let* ((continuation-label (gensym "CALL-%FLET-CONTINUATION-"))
         (continuation-index (add-lambda-local-continuation continuation-label))
         (arg-indices (cdr (assoc name (%flets *current-lambda*)))))
    `((:push-int ,continuation-index)
      (:coerce-any)
      (:set-local ,(cdr (car arg-indices)))
      ,@(loop for arg in args
           for (nil . i) in (cdr arg-indices)
           append (scompile arg)
           collect '(:coerce-any)
           collect `(:set-local ,i))
      (:comment "call-%flet" ,name ,(%flets *current-lambda*) ,(unless name (break)))
      (:jump ,name)
      ;; need real label instead of dlabel, since we jump backwards
      ;; from lookupswitch at end
      (:%label ,continuation-label)
      ;; get return value
      (:get-local ,(get-lambda-local-index (local-return-var *current-lambda*))))))

(define-special return-from (name &optional value)
  (let ((block (get-lambda-block name))
        (cleanups (get-lambda-cleanups name)))
    `(,@(scompile value)
        (:coerce-any)
        (:set-local ,(get-lambda-local-index (return-var block)))
        ,@(loop for i in cleanups
             collect `(:comment "return-from cleanup" ,i ,cleanups ,(blocks *current-lambda*))
             append (scompile i)
             collect `(:comment "return-from cleanup done")
             collect '(:pop))
       (:jump ,(end-label block)))))

(define-special prog1 (value-form &body body)
  (let ((temp (gensym "PROG1-VALUE-")))
        (scompile
         `(let ((,temp ,value-form))
                           (progn
                             ,@body
                             ,temp)))))

(define-special %with-cleanup ((name code) form)
  (with-cleanup (name code)
    (scompile form)))

(define-special unwind-protect (protected &body cleanup)
  (let ((cleanup-name (gensym "UWP-CLEANUP-")))
      (scompile
       `(%flet (,cleanup-name () ,@cleanup)
               (%with-cleanup (,cleanup-name (call-%flet ,cleanup-name))
                              (prog1
                                  ,protected
                                (call-%flet ,cleanup-name)))))))



#+nil(with-lambda-context ()
  (scompile '(block foo 2 (if nil (return-from foo 4) 5) 3)))


#+nil
(as3-asm::as3-disassemble
 (as3-asm::code
  (as3-asm::with-assembler-context
    (as3-asm::assemble-method-body
     (with-simple-lambda-context ()
       (append
        '((:%label foo))
        (scompile '(%flet (bleh (a b c) (+ a b c))
                    (+ (call-%flet bleh 1 2 3)
                     (call-%flet bleh 5 6 7))))
        (compile-lambda-context-cleanup 'foo)))))))


#+nil
(as3-asm::as3-disassemble
 (as3-asm::code
  (as3-asm::with-assembler-context
    (as3-asm::assemble-method-body
(dump-defun-asm () (let ((s2 "<"))
                          (block foo
                            (unwind-protect
                                 (progn
                                   (return-from foo "-ret-")
                                   "bleh")
                              "baz"))
                          (+ s2 ">"))) ) ) ))