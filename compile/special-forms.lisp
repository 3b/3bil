(in-package :avm2-compiler)

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
;;~ quote
;;
;;~ function
;;~ setq
;;
;; symbol-macrolet
;; flet
;; macrolet
;; labels
;;
;;~ block
;; catch
;;~ return-from
;; throw
;;~ unwind-protect
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


#+-
(define-special* progn (cdr)
  (loop for rest on cdr
     for form = (car rest)
     for next = (cdr rest)
     append (scompile form)
     ;; ignore return values from intermediate steps
     when (or next (and (consp form) (eql (car form) 'return)))
     append '((:pop))))

;; (scompile '(progn "foo" "bar" :true))


#+-
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
                                collect `(:kill ,index))
                           (:push-null)))
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

#+-
(define-special %set-local (local value)
  ;; (%set-local var value) -> value
  `(,@(scompile value) ;; calculate value
      (:dup)                   ;; copy value so we can reurn it
      (:set-local ,(or (get-lambda-local-index local) (break)))))
;; (with-lambda-context (foo) (scompile '(%set-local foo 2.3)))

#+-
(define-special %asm (&rest cdr)
  ;; (%asm (op1 args) (op2 ...) ... )
  (mapcar (lambda (x)
            (case (first x)
              (:@ `(:get-local ,(get-lambda-local-index (second x))))
              (:@! `(:set-local ,(get-lambda-local-index (second x))))
              (:@hn2 `(:has-next-2 ,(get-lambda-local-index (second x))
                                   ,(get-lambda-local-index (third x))))
              (:@kill `(:kill ,(get-lambda-local-index (second x))))
              (otherwise x)))
          cdr))

#+-
(define-special %label (target)
  ;; (%label name) ;; for reverse jumps only
  `((:%label ,target)
    ;; hack since we always pop after each statement in a progn, gets
    ;; removed later by peephole pass
    (:push-null)))

#+-
(define-special %dlabel (target)
  ;; (%dlabel name) ;; for forward jumps only
  `((:%dlabel ,target)
    (:push-null)))

#+-
(define-special %go (target)
  ;; (go asm-label)
  `((:jump ,target)
    (:push-null)))

#+-
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

#+-
(define-special go (tag)
  (scompile-cons '%go (list (get-lambda-tag tag))))

;; (with-lambda-context () (scompile '(tagbody foo (go baz) bar 1 baz 2)))

#+-
(define-special %if (cond false-test true-branch false-branch)
  (let ((false-label (gensym "%IF-FALSE-"))
        (end-label (gensym "%IF-END-")))
    `(,@(scompile cond)
        (,false-test ,false-label)
        ,@(scompile true-branch)
        (:jump ,end-label)
        (:%dlabel ,false-label)
        ,@(scompile false-branch)
        (:%dlabel ,end-label))))
#+-

(define-special if (cond true-branch false-branch)
  `(,@(scompile `(%if ,cond :if-false ,true-branch ,false-branch))))

;; (avm2-asm::with-assembler-context (avm2-asm::code (avm2-asm:assemble-method-body (scompile '(when :true 1)) )))

#+-

(define-special %inc-local-i (var)
  ;; (%inc-local-i var)
  `((:inc-local-i ,(get-lambda-local-index var))
    ;; hack since we always pop after each statement in a progn :/
    (:get-local ,(get-lambda-local-index var))))


;;(scompile '(and))
;;(scompile '(and 1))
;;(scompile '(and 1 2))

#+-

(define-special* %array (args)
  ;; (%array ... ) -> array
  `(,@(loop for i in args
         append (scompile i)) ;; calculate args
      (:new-array ,(length args))))


#+-
(define-special %error (value)
  `(,@(scompile value)
      (:throw)))

#+-
(define-special %typep (object type)
  `(,@(scompile object)
      (:get-lex ,(or (swf-name (find-swf-class type)) type))
      (:is-type-late )))

#+-

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
#+-
(define-special block (name &body body)
  (let ((end (gensym "BLOCK-END-")))
    (with-nested-lambda-block ((cons name (make-lambda-block name end nil end))
                               end)
      `(,@(scompile `(progn ,@body))
          (:set-local ,(get-lambda-local-index end))
          (:%dlabel ,end)
          (:get-local ,(get-lambda-local-index end))))))

#+-
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

#+-
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
           collect `(:set-local ,i))
      (:comment "call-%flet" ,name ,(%flets *current-lambda*) ,(unless name (break)))
      (:jump ,name)
      ;; need real label instead of dlabel, since we jump backwards
      ;; from lookupswitch at end
      (:%label ,continuation-label)
      ;; get return value
      (:get-local ,(get-lambda-local-index (local-return-var *current-lambda*))))))

#+-
(define-special return-from (name &optional value)
  (let ((block (get-lambda-block name))
        (cleanups (get-lambda-cleanups name)))
    `(,@(scompile value)
        (:set-local ,(get-lambda-local-index (return-var block)))
        ,@(loop for i in cleanups
             collect `(:comment "return-from cleanup" ,i ,cleanups ,(blocks *current-lambda*))
             append (scompile i)
             collect `(:comment "return-from cleanup done")
             collect '(:pop))
       (:jump ,(end-label block)))))

#+-
(define-special %with-cleanup ((name code) form)
  (with-cleanup (name code)
    (scompile form)))

#+-
(define-special unwind-protect (protected &body cleanup)
  (let ((cleanup-name (gensym "UWP-CLEANUP-")))
      (scompile
       `(%flet (,cleanup-name () ,@cleanup)
               (%with-cleanup (,cleanup-name (call-%flet ,cleanup-name))
                              (prog1
                                  ,protected
                                (call-%flet ,cleanup-name)))))))

;;(scompile '(list (list 1) (list 2)))
;;(scompile '(list 1))
;;(scompile '(quote (1 2 3)))
;;(scompile '(list '(list 1 2 3)))

;;; internal aref, handles single dimensional flash::Array
#+-
(define-special %aref-1 (array index)
  `(,@(scompile array)
    ,@(scompile index)
      (:get-property (:multiname-l "" ""))))


#+-
(define-special %set-aref-1 (array index value)
  `(,@(scompile array)
    ,@(scompile index)
    ,@(scompile value)
      (:set-property (:multiname-l "" ""))
      (:push-null)))


;;(scompile '(list* 1  2 3 4 5))
;;(scompile '(list* 1))

#+-
(define-special function (arg &optional object)
  ;; fixme: not all branches tested yet...
  (let ((tmp))
    (cond
      ;; if OPERATOR is a known method, call with %call-property
      ;;  (prop obj args...) === obj.prop(args)
      ((setf tmp (find-swf-method arg *symbol-table*))
       (break "f-s-m ~s" tmp)
       (scompile `(%get-property ,(swf-name tmp) ,object )))

      ;; if OPERATOR is a known static method, call with %call-lex-prop
      ;;  (prop obj args...) === obj.prop(args)
      ((setf tmp (find-swf-static-method arg *symbol-table*))
       (scompile `(%get-lex-prop ,(first tmp) ,(second tmp))))

      ;; todo: decide if we should do something for the pretend accessors?

      ;; normal function call, find-prop-strict + call-property
      ((setf tmp (find-swf-function arg *symbol-table*))
       ;(break "f-s-f ~s" tmp)
       (scompile `(%get-property-without-object ,(first tmp))))

      ;; default = normal call?
      ;; fixme: might be nicer if we could detect unknown functions
      (t
       (scompile `(%get-property-without-object ,arg))))))

#+-
(define-special quote (object)
  (%quote object))

#+nil(dump-defun-asm (&arest rest) 'a)
#+nil(dump-defun-asm (&arest rest) '1)


#+nil(with-lambda-context ()
  (scompile '(block foo 2 (if nil (return-from foo 4) 5) 3)))


#+nil
(avm2-asm::avm2-disassemble
 (avm2-asm::code
  (avm2-asm::with-assembler-context
    (avm2-asm::assemble-method-body
     (with-simple-lambda-context ()
       (append
        '((:%label foo))
        (scompile '(%flet (bleh (a b c) (+ a b c))
                    (+ (call-%flet bleh 1 2 3)
                     (call-%flet bleh 5 6 7))))
        (compile-lambda-context-cleanup 'foo)))))))


#+nil
(format t "---~%~{~s~%~}---~%"
(avm2-asm::avm2-disassemble
 (avm2-asm::code
  (avm2-asm::with-assembler-context
    (avm2-asm::assemble-method-body
(dump-defun-asm () (let ((s2 "<"))
                          (block foo
                            (unwind-protect
                                 (progn
                                   (return-from foo "-ret-")
                                   "bleh")
                              "baz"))
                          (+ s2 ">"))) ) ) )))

#+nil
(format t "---~%~{~s~%~}---~%"
        (avm2-asm::avm2-disassemble
         (avm2-asm::code
          (avm2-asm::with-assembler-context
            (avm2-asm::assemble-method-body
             (dump-defun-asm () (let ((a 0)) (dotimes (x 10000000 a) (incf a 1)))))))))

#+nil
(format t "---~%~{~s~%~}---~%"
        (avm2-asm::avm2-disassemble
         (avm2-asm::code
          (avm2-asm::with-assembler-context
            (avm2-asm::assemble-method-body
             (dump-defun-asm () (dotimes (x 1) (dotimes (y 1) (+ x y)))))))))

