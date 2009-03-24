(in-package :avm2-compiler)

;;; trivial ir2: asm
;;;


;;; collect some info that doesn't really fit in the ir1 stuff since
;;;   it probably wouldn't apply to a smarter ir2 (probably some of the
;;;   current ir1 belongs here too...)
;;; mark vars that need a slot in activation records
;;; assign indices for nlx go tags
(defparameter *current-closure-index* nil)
(defparameter *current-closure-vars* nil)
;; fixme: pick a better name for this now that it does something else too
(define-structured-walker mark-activations null-ir1-walker
  :form-var whole
  :labels ((set-tag-info (var flag value)
                         (setf (getf (getf *ir1-tag-info* var nil) flag) value))
           (get-tag-info (var flag &optional default)
                         (getf (getf *ir1-tag-info* var nil) flag default)))
  :forms
  (((%named-lambda name lambda-list closed-vars activation-vars body)
    (let ((*ir1-in-tagbody* nil)
          (*current-closure-vars* nil)
          (*current-closure-index* 1))
      (when activation-vars (error "got activation-vars, expected nil?"))
      (loop for i in closed-vars
            do (push (list i (1- (incf *current-closure-index*)))
                     *current-closure-vars*))
      (let ((rbody (recur-all body)))
        `(%named-lambda
          name ,name
          lambda-list ,lambda-list
          closed-vars ,closed-vars
          activation-vars ,*current-closure-vars*
          body ,rbody))))
   ((%bind vars values closed-vars body)
    (loop for i in closed-vars
          do (push (list i (1- (incf *current-closure-index*)))
                   *current-closure-vars*))
    (super whole))
   ((tagbody name nlx forms)
    (when nlx
      (loop with j = 0
            for i in forms
            when (atom i)
            do (set-tag-info i :nlx-index (1- (incf j)))))
    (super whole))))

;;; skipping serious optimization/type inference for now, so
;;; just compile ir1 directly to asm to try to get something useable
;;; if not super-fast for now...
(defpackage #:uninterned)
(defparameter *ir1-dest-type* nil)
(defparameter *current-local-index* nil)
(defparameter *current-closure-scope-index* nil)
(defparameter *activation-local-name* nil)
(define-structured-walker assemble-ir1 null-ir1-walker
  :labels ((coerce-type ()
                        (cond
                          ((eq *ir1-dest-type* nil) nil)
                          ((eq *ir1-dest-type* :ignored) '((:pop)))
                          ((eq *ir1-dest-type* :int) '((:convert-integer)))
                          ((eq *ir1-dest-type* :uint) '((:convert-unsigned)))
                          ((eq *ir1-dest-type* :double) '((:convert-double)))
                          ((eq *ir1-dest-type* :string) '((:convert-string)))
                          ((eq *ir1-dest-type* :bool) '((:convert-boolean)))
                          ((eq *ir1-dest-type* t) '((:coerce-any)))
                          (t '((:coerce-any)))))
           (set-var-info (var flag value)
                         (setf (getf (getf *ir1-var-info* var nil) flag) value))
           (get-var-info (var flag &optional default)
                         (getf (getf *ir1-var-info* var nil) flag default))
           (get-tag-info (tag flag &optional default)
                         (getf (getf *ir1-tag-info* tag nil) flag default))
           (get-fun-info (name flag &optional default)
                         (getf (getf *ir1-fun-info* name nil) flag default))
           (recur-progn (body)
                        (if body
                            (loop for (form . more) on body
                                  if more
                                  append (let ((*ir1-dest-type* :ignored))
                                           `(,@(recur form)
                                               ))
                                  else append (recur form))
                            `((:push-null)
                              ,@(coerce-type))))
           (get-local-index (var)
                            (or (get-var-info var :index nil)
                                (set-var-info var :index (1- (incf *current-local-index*)))))
           (get-closure-index (var)
                              (second (assoc var *current-closure-vars*)))
           (call-name (form)
                      (and (eq (car form) '%call)
                           (getf (cdr form) 'name))))
  :forms
  (((quote value)
    (let ((a `(,@(typecase value
                             (integer
                              (cond
                                ((< (- (expt 2 31)) value (expt 2 31))
                                 `((:push-int ,value)))
                                ((< 0 value (expt 2 32))
                                 `((:push-uint ,value)))
                                (t
                                 (warn "storing integer ~s as double" value)
                                 `((:push-double ,(float value 1d0))))))
                             (real
                              `((:push-double ,(float value 1d0))))
                             (string
                              `((:push-string ,value)))
                             (simple-vector
                              `(,@(loop for i across value
                                        append (recur `(quote value ,i)))
                                  (:new-array ,(length value))))
                             (symbol
                              (cond
                                ((eq value t)
                                 `((:push-true)))
                                ((eq value nil)
                                 `((:push-null)))
                                (t
                                 `((:find-property-strict %intern)
                                   ;; fixme: handle symbols properly
                                   (:push-string ,(package-name (or (symbol-package value) :uninterned)))
                                   (:push-string ,(symbol-name value))
                                   (:call-property %intern 2)))))
;;;
                             (cons
                              (append
                               `((:find-property-strict cons-type))
                               (recur `(quote value ,(car value)))
                               (recur `(quote value ,(cdr value)))
                               `((:construct-prop cons-type 2))))
                             (t
                              (error "don't know how to compile quoted value ~s" value)))
                 ,@(coerce-type))))
        ;;(format t "quoted ~s -> ~s~%" value a)
        a))

     ;; type = :local , :normal , :setf , ??
     ;; (:local possibly should be :static, but might want to distinguish based
     ;;  on what we pass as THIS arg? :local would get current function's THIS
     ;;  while :static would get global scope or something?)
     ((%call type name args)
      (ecase type
        ;; todo: void calls if no dest? (or make sure peephole handles it?)
        (:normal
         (let (tmp)
           (cond
            ;; known methods
            ((setf tmp (find-swf-method name *symbol-table*))
             ;;(format t "compiling known method call to ~s~%" name)
             `(,@(let ((*ir1-dest-type* nil))
                      (recur (first args)))
                 ,@(let ((*ir1-dest-type* nil))
                        (loop for a in (cdr args)
                              append (recur a)))
                 (:call-property ,tmp ,(length (cdr args)))
                 ,@(coerce-type)))
            ;; known static methods
            ((setf tmp (find-swf-static-method name *symbol-table*))
             (format t "compiling known static method call to ~s~%  tmp=~s~%"
                     name tmp)
             `(;#+nil(:find-property-strict ,(car tmp)) ;;??
               (:get-lex ,(if (find-swf-class (car tmp))
                              (swf-name (find-swf-class (car tmp)))
                              (car tmp)))
               ,@(let ((*ir1-dest-type* nil))
                      (loop for a in args
                            append (recur a)))
                 (:call-property ,(second tmp) ,(length args))
               ,@(coerce-type)))


            ;; unknown function... call directly
            (t
             ;;(format t "compiling normal call to ~s~%" name)
             `((:find-property-strict ,name)
               ,@(let ((*ir1-dest-type* nil))
                      (loop for a in args
                            append (recur a)))
               (:call-property ,name ,(length args))
               ,@(coerce-type))))))
        (:local
         (if (get-fun-info name :closure)
             ;; closures need to be called specially
             `((:new-function ,name)
               (:get-local 0)
               ,@(let ((*ir1-dest-type* nil))
                      (loop for a in args
                            append (recur a)))
               (:call ,(length args))
               ,@(coerce-type))
             ;; local functions without free vars can be called directly
             `((:get-local 0)
               ,@(let ((*ir1-dest-type* nil))
                      (loop for a in args
                            append (recur a)))
               (:call-static ,name ,(length args))
               ,@(coerce-type))))
        (:setf (if (find-swf-property name)
                   ;; hack to autodefine implicit setf functions for known
                   ;; properties
                   ;; name = property name
                   ;; args = value, object
                   (progn
                     ;; fixme: look up correct type if any for
                     ;; properties?  -- need to cast separately
                     ;; though, since return value might be different
                     ;; type...
                     `(,@(let ((*ir1-dest-type* nil))
                              (recur (first args))) ; value
                         ;; extra copy for return value
                         ,@(unless (eq *ir1-dest-type* :ignored)
                                   `((:dup)))
                         ,@(let ((*ir1-dest-type* nil))
                                (recur (second args))) ; object
                         (:swap)
                         (:set-property ,(or (find-swf-property name) name))
                         ,@(unless (eq *ir1-dest-type* :ignored)
                                   (coerce-type))))
                   `((:get-lex setf-namespace-type)
                     ,@(let ((*ir1-dest-type* nil))
                            (loop for a in args
                                  append (recur a)))
                     (:call-property ,name ,(length args))
                     ,@(coerce-type))))))

     ;; possibly should split out closed and normal bindings, but for now
     ;; leaving combined to avoid worrying about order of evaluating the values
     ;; (might eventually want to assign a local for the closed vars anyway,
     ;;  if compiler gets smart enough to tell when nothing can be accessing
     ;;  them through the closure for a section of code? (and assuming going
     ;;  through the closure var is slow enough to care in the first place)
     ((%bind vars values closed-vars body)
      `(,@(loop for var in vars
                for val in values
                for closed = (member var closed-vars)
                for var-type = (get-var-info var :type t)
                append (let ((*ir1-dest-type* var-type))
                         (recur val))
                collect `(:set-local ,(get-local-index var))
                when closed
                append `((:get-scope-object ,*current-closure-scope-index*)
                         (:get-local ,(get-local-index var))
                         ,@(unless (get-closure-index var) (error "error !!"))
                         (:set-slot ,(get-closure-index var))))
          ,@(recur-progn body)
          ,@(loop for var in vars
                  collect `(:kill ,(get-local-index var)))))

     ;; type = :local , :closure , ???
     ((%ref type var)
      (ecase type
        (:local `((:get-local ,(get-local-index var))
                  ,@(coerce-type)))
        (:lex `((:get-lex ,(first var))
                (:get-property ,(second var))
                ,@(coerce-type)))
        (:closure
         (let ((c (get-closure-index var)))
           (if c
               `((:get-scope-object ,*current-closure-scope-index*)
                 (:get-slot ,c)
                 ,@(coerce-type))
               `((:get-lex ,var)
                 ,@(coerce-type)))))))
     ((%set type var value)
      (ecase type
        ;; fixme: should these coerce the type after the dup instead of before?
        ;; fixme: possibly should factor out the recur + dup?
        (:local (format t "%set local name=~s info=~s~%" var (getf *ir1-var-info* var nil))
                `(,@(cond
                     ;; hacks to allow (:@ (setf foo <value on top of stack>))
                     ;; in %asm
                     ((member (call-name value) '(%asm-top-of-stack-untyped
                                                  %asm-top-of-stack-typed))
                      nil)
                     ;; dest-type = nil since we might have different
                     ;; types for the var and return value
                     (t (let ((*ir1-dest-type* nil))
                          (recur value))))
                    (:dup)
                    ;; add cast for the assignment if needed
                    ,@(unless (eq (call-name value) '%asm-top-of-stack-untyped)
                              (let ((*ir1-dest-type* (get-var-info var :type t)))
                                (coerce-type)))
                    (:set-local ,(get-local-index var))
                    ,@(coerce-type)))
        (:closure
         (let ((c (get-closure-index var)))
           (format t "%set closure : var=~s c=~s~%" var c)
           `(,@(cond
                ;; hacks to allow (:@ (setf foo <value on top of stack>))
                ;; in %asm
                ((member (call-name value) '(%asm-top-of-stack-untyped
                                             %asm-top-of-stack-typed))
                 nil)
                ;; dest-type = nil since we might have different
                ;; types for the var and return value
                (t (let ((*ir1-dest-type* nil))
                     (recur value))))
               (:dup)
               ;; add cast for the assignment if needed
               ,@(unless (eq (call-name value) '%asm-top-of-stack-untyped)
                         (let ((*ir1-dest-type* (get-var-info var :type t)))
                           (coerce-type)))
               ,@(if c
                     `((:get-scope-object ,*current-closure-scope-index*)
                       (:swap)
                       (:set-slot ,c))
                     `((:find-property-strict ,var)
                       (:swap)
                       (:set-property ,var)))
               ;; convert type of return value
               ,@(coerce-type))))))

     ((%named-lambda name lambda-list closed-vars activation-vars body)
      (let ((*ir1-in-tagbody* nil)
            (*current-local-index* 0)
            (*current-closure-vars* activation-vars)
            (*activation-local-name* (gensym "ACTIVATION-RECORD-"))
            (*current-closure-scope-index* 1))
        ;; fixme: implement this properly instead of relying on it picking right numbers on its own
        (loop for i in (lambda-list-vars lambda-list)
              do (get-local-index i))
        (let ((asm `(,@(when activation-vars
                             `((:new-activation)
                               (:dup)
                               (:push-scope)
                               (:set-local ,(get-local-index *activation-local-name*))))
                       ,@(loop for var in closed-vars
                               append `((:comment "assign activation")
                                        (:get-scope-object ,*current-closure-scope-index*)
                                        (:get-local ,(get-local-index var))
                                        (:set-slot ,(get-closure-index var))))
                       ,@(recur-progn body))))
          `(%named-lambda
            name ,name
            lambda-list ,lambda-list
            closed-vars ,closed-vars
            activation-vars ,activation-vars
            body ,asm))))

     ((function type name)
      (ecase type
        (:local `((:new-function ,name)
                  ,@(coerce-type)))
        ;;fixme: lookup real name in global symbol table...
        (:normal `((:find-property-strict ,name)
                   (:get-property ,name)
                   ,@(coerce-type)))
        (:method (error "method calls with object not done yet..."))))

     ;; common code for nlx handling in catch/return/tagbody
     ((%catch type body tag-code tag-property handler-code)
      (let ((start (gensym "CATCH-START-"))
            (end (gensym "CATCH-END-"))
            (name (gensym "CATCH-NAME-"))
            (jump (gensym "CATCH-JUMP-"))
            (jump2 (gensym "CATCH-JUMP2-")))
        ;;fixme: add avm2 level set of throw/catch ops, and implement with those
        ;;fixme: may need to store value in a temp instead of leaving on stack?
        `((:%dlabel ,start)
          (:comment "body start")
          ,@body
          ;;,@(coerce-type)
          (:comment "body end")
          (:%dlabel ,end)
          (:jump ,jump2)
          ;; start exception handler block
          (:%exception ,name ,start ,end ,type)
          ;; restore scope stack
          (:get-local 0)
          (:push-scope)
          ,@(when *current-closure-vars*
                  `((:get-local ,(get-local-index *activation-local-name*))
                    (:push-scope)))
          ;; test to see if exception was for us (matching tag)
          (:dup)
          (:get-property ,tag-property)

          ;;(:comment "debug")
          ;;(:dup)
          ;;(:find-property-strict :trace)
          ;;(:swap)
          ;;(:push-string "caught :")
          ;;(:swap)
          ;;(:add)
          ;;(:call-property :trace 1)
          ;;(:pop)

          (:comment "tag start")
          ,@tag-code
          (:comment "tag end")

          ;;(:comment "debug2")
          ;;(:dup)
          ;;(:find-property-strict :trace)
          ;;(:swap)
          ;;(:push-string "checing against tag :")
          ;;(:swap)
          ;;(:add)
          ;;(:call-property :trace 1)
          ;;(:pop)

          (:if-strict-eq ,jump)
          ;;(:push-int 12345)
          (:throw)
          (:%dlabel ,jump)
          (:comment "handler start")
          ,@handler-code
          (:comment "handler end")
          (:%dlabel ,jump2))))

     ((block name nlx forms)
      (if nlx
          ;; fixme: return to correct dynamic scope corresponding to the entry from which the return-from was created...
          (recur
           `(%catch type block-exception-type
                    tag-property block-exception-tag
                    body ,(recur-progn forms)
                    ;; fixme: is this right type? should fix THROW if changed...
                    tag-code ,(let ((*ir1-dest-type* nil)
                                    (exit-point (get-tag-info
                                                 name :exit-point-var)))
                                   (recur `(%ref type ,(get-var-info
                                                        exit-point
                                                        :ref-type :local)
                                                 var ,exit-point)))
                    handler-code ((:get-property block-exception-value)
                                  ,@(coerce-type))))
          `(,@(recur-progn forms)
              (:%dlabel ,name))))
     ((return-from name value)
      `((:comment "local return-from" ,name)
        ;; fixme: store the return type somewhere and propagate to here
        ,@(let ((*ir1-dest-type* t))
               (recur value))
        (:jump ,name)))

     ((tagbody name nlx forms)
      (if nlx
          (let ((bad-nlx-label (gensym "TAGBODY-BUG-")))
            (recur
             `(%catch type go-exception-type
                      tag-property go-exception-tag
                      body (,@(loop for i in forms
                                    when (atom i)
                                    collect `(:%label ,i)
                                    else append (let ((*ir1-dest-type* :ignored))
                                                  (recur i)))
                              (:push-null)
                              ,@(coerce-type))
                      tag-code ,(let ((*ir1-dest-type* nil)
                                      #+nil(exit-point (get-tag-info
                                                        name :exit-point-var)))
                                     #+nil(recur `(%ref type ,(get-var-info
                                                               exit-point
                                                               :ref-type :local)
                                                        var ,exit-point))
                                     (recur `(%ref type ,(get-var-info
                                                          name
                                                          :ref-type :local)
                                                   var ,name)))
                      handler-code
                      ((:get-property go-exception-index)
                       (:convert-integer)
                       (:lookup-switch
                        ,bad-nlx-label
                        ,(mapcar 'second
                                 (sort (loop for i in forms
                                             when (atom i)
                                             collect `(,(get-tag-info i :nlx-index)
                                                        ,i))
                                       #'< :key #'car)))
                       (:%dlabel ,bad-nlx-label)
                       (:push-string "broken tagbody!")
                       (:throw)
                       (:push-null)
                       ,@(coerce-type)))))
          `(,@(loop for i in forms
                    when (atom i)
                    collect `(:%label ,i)
                    else append (let ((*ir1-dest-type* :ignored))
                                  (recur i)))
              (:push-null)
              ,@(coerce-type))))
     ((go tag)
      `((:jump ,tag)))

     ((catch tag forms)
      (recur
       `(%catch type throw-exception-type
                tag-property throw-exception-tag
                body ,(recur-progn forms)
                ;; fixme: is this right type? should fix THROW if changed...
                tag-code ,(let ((*ir1-dest-type* nil))
                               (recur tag))
                handler-code ((:get-property throw-exception-value)
                              ,@(coerce-type)))))
     ((throw tag result-form)
      (error "got throw, expected it to be handled by %nlx?"))

;;; combined tag for non-local return-from, go, throw in later passes
     ((%nlx type name exit-point value)
      (ecase type
        (:go `((:find-property-strict go-exception-type)
               ,@(let ((*ir1-dest-type* nil))
                      (recur exit-point))
               ,@(let ((*ir1-dest-type* nil))
                      `((:push-int ,(get-tag-info name :nlx-index))))
               (:construct-prop go-exception-type 2)
               (:throw)))
        (:return-from `((:comment "nlx return-from" ,name)
                        (:find-property-strict block-exception-type)
                        ;; fixme: check these types
                        ,@(let ((*ir1-dest-type* nil))
                               (recur exit-point))
                        ,@(let ((*ir1-dest-type* t))
                               (recur value))
                        (:construct-prop block-exception-type 2)
                        (:throw)))
        (:throw `((:find-property-strict throw-exception-type)
                  ;; fixme: should this specify a type (or t)?
                  ,@(let ((*ir1-dest-type* nil))
                         (recur exit-point))
                  ;; fixme: not sure about correct type for this either...
                  ,@(let ((*ir1-dest-type* t))
                         (recur value))
                  (:construct-prop throw-exception-type 2)
                  (:throw)))))

     ((if condition then else)
      (let ((else-label (gensym "IF-ELSE-"))
            (done-label (gensym "IF-DONE-"))
            ;; for now always coerce to * if we don't have a more specific type,
            ;; to avoid conflicts between branches
            ;; fixme: derive types for branches and skip this if they match
            (*ir1-dest-type* (or *ir1-dest-type* t)))
;;; fixme: decide how to implement IF
        ;; possibly should eval condition with no type, and then
        ;; (:push-null) (:if-eq) instead of (:if-false)?
        `(#+nil,@(let ((*ir1-dest-type* :bool))
                      (recur condition))
               #+nil  (:if-false ,else-label)
               ,@(let ((*ir1-dest-type* nil))
                      (recur condition))
               (:push-null)
               (:if-strict-eq ,else-label)
               ,@(recur then)
               (:jump ,done-label)
               (:%dlabel ,else-label)
               ,@(recur else)
               (:%dlabel ,done-label))))

     ((progn body)
      `(,@(recur-progn body)))

     ((unwind-protect protected cleanup)
      ;; can this be combined with the catch stuff?
      (let ((start (gensym "UWP-START-"))
            (end (gensym "UWP-END-"))
            (name (gensym "UWP-NAME-"))
            (jump (gensym "UWP-JUMP-")))
        ;;fixme: may need to store value in a temp instead of leaving on stack?
        `((:%dlabel ,start)
          (:comment "body start")
          ,@(recur protected)
          ;;,@(coerce-type)
          (:comment "body end")
          (:%dlabel ,end)
          (:jump ,jump) ;; normal exit
          ;; start exception handler block
          (:%exception ,name ,start ,end 0) ;; catch anything
          ;; restore scope stack
          (:get-local 0)
          (:push-scope)
          ,@(when *current-closure-vars*
                  `((:get-local ,(get-local-index *activation-local-name*))
                    (:push-scope)))
          ;; exception cleanup body
          ,@(let ((*ir1-dest-type* :ignored))
                 (loop for f in cleanup
                       append (recur f)))
          ;;(:pop)
          (:throw)
          ;; fixme: verify that duplicating uwp cleanup doesn't cause any problems
          ;; normal exit cleanup body
          (:%dlabel ,jump)
          ,@(let ((*ir1-dest-type* :ignored))
                 (loop for f in cleanup
                       append (recur f)))
          (:comment "handler end"))))

     ((%compilation-unit var-info tag-info fun-info lambdas)
      (let ((*ir1-tag-info* tag-info)
            (*ir1-var-info* var-info)
            (*ir1-fun-info* fun-info))
        #+nil(format t "tag info : ~s~%" tag-info)
        `(%compilation-unit
          var-info ,var-info
          tag-info ,tag-info
          fun-info ,fun-info
          lambdas ,(recur-all lambdas))))

     ((%asm forms)
      ;; fixme: decide correct handling of return type?
      `(,@(loop for i in forms
                when (eq (car i) :@)
                append (let ((*ir1-dest-type* (third i)))
                         (recur (second i)))
                else when (eq (car i) :@kill)
                collect `(:kill ,(get-local-index (second i)))
                else collect i)
          ,@(coerce-type)))

     ;; todo:

     ;;       ((load-time-value form &optional read-only-p)
     ;;        `(load-time-value ,(recur form) ,read-only-p))
     ;;       ((eval-when (&rest when) &rest forms)
     ;;        `(eval-when ,when ,@(recur-all forms)))
     ;;       ((locally &rest declarations-and-forms)
     ;;        `(locally ,@(recur-all declarations-and-forms)))
     ;;       ((multiple-value-call function-form &rest forms)
     ;;        ;; fixme: is this right?
     ;;        `(multiple-value-call ,(recur function-form) ,@(recur-all forms)))
     ;;       ((the value-type form)
     ;;        `(the ,value-type ,(recur form)))

     ;;       ((multiple-value-prog1 first-form &rest forms)
     ;;        `(multiple-value-prog1 ,(recur first-form) ,@(recur-all forms)))
     ;;       ((progv symbols values &rest forms)
     ;;        `(progv
     ;;             (,@(recur-all symbols))
     ;;             (,@(recur-all values))
     ;;           ,@(recur-all forms)))
     ;;
     ;;       ;; hack to simplify handling of places where declarations are allowed
     ;;       ;; fixme: add a declaration validation pass or something
     ;;       ((declare &rest declarations)
     ;;        `(declare ,declarations))
     ;;
     ;;       ;; anything else, evaluate all args
     ;;       (t
     ;;        `(,(car whole) ,@(recur-all (cdr whole))))
     ))

(defparameter *ir1-dump-asm* nil)
(defun c2 (form &optional (top-level-name :top-level))
  (let* ((*new-compiler* t)
         (form `(%compilation-unit (%named-lambda ,top-level-name () ,form)))
         (assembled
          (passes form (append *ir1-passes* '(mark-activations assemble-ir1)))))
    (when *ir1-dump-asm* (format t "~s~%" assembled))
    assembled))

;;(c2 ''1)
;;(c2 ''a)
;;(c2 ''(1 2))
;;(c2 ''(1 . 2))
;;(c2 '#(1 2))
;;(c2 ''#(1 2))
;;(c2 '(vector 1 2))
;;(c2 '(progn 1))
;;(c2 '(progn 1 2 3))
;;(c2 '(progn (progn 1 2) 'a (+ 2 3) (progn 3)))
;;(c2 '(let ((a 1)) a))
;;(with-tags '(a) (c2 '(go b))) ;; expected error
;;(with-tags '(a) (c2 '(go a)))
;;(c2 '(tagbody foo (go baz) baz))
;;(c2 '(tagbody 1 (go 2) 2))
;;(c2 '(symbol-macrolet ((a 'foo)) a))
;;(c2 '(symbol-macrolet ((a (foo 123))) (+ a 1)))
;;(c2 '(symbol-macrolet ((a (foo 123))) (setq a 1)))
;;(c2 '(symbol-macrolet ((a (foo 123))) (let ((b 2)) (setq a 1 b 3))))
;;(c2 '(macrolet ((x (a) `(list ,a))) (x 123)))
;;(c2 '(macrolet ((x (a) (return-from x (list 'list 234 a)) `(list ,a))) (x 123)))
;;(with-local-vars (alphatize-var-names '(a)) (c2 'a))
;;(with-local-vars (alphatize-var-names '(a)) (c2 '(let ((a a) (b 'a)) a)))
;;(with-local-vars (alphatize-var-names '(a)) (c2 '(setq a 1)))
;;(c2 '(setq))
;;(c2 '(let ((a 2)) (setq a 1)))
;;(c2 '(symbol-macrolet ((x 'foo)) (list x (let ((x 'bar)) x))))
;;(c2 '(block x (return-from x)))
;;(c2 '(block x (return-from x 123)))
;;(c2 '(let ((x (block x (+ 1 2) (return-from x 123)))) x))
;;(c2 '(let ((x (+ 1 2 3))) x))
;;(c2 '(let ((x (progn (+ 1 2) (foo) (+ 3 4))) x)))

;;(c2 '(labels ((x (a) (list a))) (x 123)))
;;(c2 '(flet ((x (a) (list a))) (x 123)))
;;(c2 '(flet ((x (a) (return-from x 1) (list a))) (x 123)))
;;(c2 '(labels ((x (a) (list (y a))) (y (a) (x a))) (x 123)))
;;(c2 '(flet ((x (a) (list (y a))) (y (a) (x a))) (x 123)))
;;(c2 '(function (lambda (x) (+ x 1))))
;;(c2 '(function foo))
;;(c2 '(labels ((x (a) (list (y a))) (y (a) (x a))) (function x)))
;;(c2 '(if t 1 2))
;;(c2 '(let ((a (if (foo) 1 2))) a))
;;(c2 '(return-from a 1)) ;; error
;;(c2 '(catch 'a (throw 'a 1)))
;;(c2 '(catch 1234 (throw 1234 1)))
;;(c2 '(let ((a (catch 'a (throw 'a 1)))) a))
;;(c2 '(tagbody (+ 1 2 (go foo) 3 4) foo))
;;(c2 '(tagbody (+ 1 2 (if (baz) 3 (go foo)) 4 5) foo))
;;(c2 '(let ((a 1) (b 2)) (lambda (a c) (+ a b c))))
;;(c2 '(+ 1 2 (block foo (flet ((bar () (return-from foo 3))) (bar))) 4 5))


;;(c2 '(let ((x 1)) (lambda (y) (+ x y))))
;;(c2 '(lambda (a) (lambda (b) (+ a b))))
;;(c2 '(lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))))

;;(c2 '(lambda (a) (tagbody (let ((j 123)) (lambda (b) (+ a b j))))))
;;(c2 '(lambda (a) (tagbody (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (+ a b j))))))))
;;(c2 '(lambda (a) (tagbody foo (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (if (zerop a) (go bar) (+ a b j)))))) bar)))

;;(c2 '(flet ((x (a) (list (y (return-from x 1) a))) (y (a) (x a))) #'x))

;;(c2 '(lambda (a) (lambda (x) (+ x a)) a))
;;(c2 '(lambda () (tagbody foo (go bar) bar (lambda () (go foo)))))

;;(c2 '(tagbody 1 (lambda (x) (go 1))))
;;(c2 '(lambda (x) (block blah 1)))
;;(c2 '(lambda (x) (block blah (block baz (return-from blah 2)))))
;;(c2 '(lambda (x) (block baz (block blah (lambda (x) (return-from blah 2))))))
;;(c2 '(block foo (progn 1 2) (block piyo (progn 1 (foo))) (progn (hoge) 3) (return-from foo 1)))
;;(c2 '(flet (((setf foo) (&rest r) r)) (setf (foo 1 2 3) 4))) ;;fixme
;;(c2 '(flet (((setf foo) (&rest r) r)) (function (setf foo)))) ;;fixme
;;(format t "~s~%" (cc ' (labels ((x (a) (+ (y (lambda (x) (return-from x (+ a x)))) 1000)) (y (a) (funcall a 10) 1)) #'x)))
(defparameter *top-level-function* nil)
(define-structured-walker finish-assembled-ir1 ()
  :forms
  (((%compilation-unit var-info tag-info lambdas)
    `(%compilation-unit
      var-info ,var-info
      tag-info ,tag-info
      lambdas ,(recur-all lambdas)))
       ((%named-lambda name lambda-list closed-vars activation-vars body)
        ;; optionally add a call to this function to the top-level script-init
        ;; fixme: probably should store the name or a flag in the %compilation-unit instead of tracking it separately like this
        (when (eq name *top-level-function*)
          (setf (load-top-level *compiler-context*)
                ;; we call top-level function with 1 arg, the script object
                (append (load-top-level *compiler-context*)
                        `(
                          (:get-scope-object 0)
                          (:call-static ,name 0)
                          (:pop)))))
        (flet ((parse-arglist (args)
                 ;; fixme: add error checking, better lambda list parsing
                 (loop with rest = nil
                       with optional = nil
                       for i in args
                       when (eq i'&arest)
                       do
                       (setf rest i)
                       (setf i nil)
                       (setf optional nil)
                       when (eq i '&optional)
                       do
                       (setf optional t)
                       (setf i nil)
                       when (and i (not rest))
                       count 1 into count
                       when i
                       collect i into arg-names
                       and when optional
                       collect i into optional-names
                       finally (return (values arg-names count rest optional-names)))))
          (multiple-value-bind (names count rest-p optionals)
              ;; ignore the THIS arg added by compiler...
              (parse-arglist (cdr lambda-list))
            (declare (ignorable optionals))
            (when optionals (error "&optional args not supported yet"))
            (let* ((asm (with-lambda-context (:args names :blocks nil)
                          `((:get-local-0)
                            (:push-scope)
                            ,@body
                            (:return-value))))
                   (activation-p (find :new-activation asm :key 'car)))
              (when (or (and activation-p (not activation-vars))
                        (and (not activation-p) activation-vars))
                ;; not completely sure this is an error, but shouldn't be
                ;; happening currently...
                #+nil(error "got :new-activation with no activation vars?"))
              (push
               ;; function data:
               ;;  swf name in format suitable for passing to asm (string/'(qname...))
               ;;  args to avm2-method:
               ;;    name id?
               ;;    list of arg types (probably all T/* for now)
               ;;    return type
               ;;    flags
               ;;    list of assembly
               ;;    ?
               (list
                (if (symbolp name) (avm2-asm::symbol-to-qname-list name) name)
                0 ;; name in method struct?
                (loop repeat count collect 0) ;; arg types, 0 = t/*/any
                0                             ;; return type, 0 = any
                (logior (if rest-p #x04 0)    ;; flags, #x04 = &rest
                        (if activation-p #x02 0))
                asm
                :activation-slots
                (when activation-vars
                  #+nil(format t "activation-vars : ~s~%" activation-vars)
                  (loop for (name index) in activation-vars
                        ;; no type info for now..
                        collect `(,name ,index 0))))
               (gethash name (functions *symbol-table*) (list)))))))))

(defun c3 (name form)
  (finish-assembled-ir1 (c2 form name)))

(defmacro c3* (name &body forms)
  `(c3 ,name '(progn ,@forms)))

(defun c4 (name form)
  (let ((*top-level-function* name))
    (c3 name form)))

