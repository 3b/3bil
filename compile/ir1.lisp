(in-package :avm2-compiler)

;;; ir1:
;;;   convert to slightly more structured form
;;;   extract lambdas, mark closures, nlx, etc,
;;;   spill stack to locals around catch blocks
;;;

;;; convert to ir1:
;;;   (form . plist) instead of (form . args)
;;;   ex: (block foo bar baz (hoge piyo)) ->
;;;       (block name foo body (bar baz (hoge piyo)))
;;; note: using non-keyword symbols for tags for now, so we can bind
;;;       them to symbol-macros in define-structured-walker for later passes
(define-walker ir0->ir1 ()
  :atoms ((t (error " shouldn't be seeing atoms in ir0->ir1, got ~s" atom)))
  :form-var whole
  :forms
  (((quote form) `(quote value ,form))

   ((%normal-call op &rest args)
    `(%call type :normal name ,op args ,(recur-all args)))
   ((%local-call op &rest args)
    `(%call type :local name ,op args ,(recur-all args)))
   ((%setf-call op &rest args)
    `(%call type :setf name ,op args ,(recur-all args)))

   ((%bind names values body)
    `(%bind vars ,names values ,(recur-all values) body ,(recur-all body)))

   ((%local-ref name)
    `(%ref type :local var ,name))
   ((%lex-ref object name)
    `(%ref type :lex var (,object ,name)))
   ((%local-set name value)
    `(%set type :local var ,name value ,(recur value)))

   ((%named-lambda name args &rest body)
    `(%named-lambda name ,name lambda-list ,args body ,(recur-all body)))

   ((function name)
    `(function type :normal name ,name))
   ((%local-function name)
    `(function type :local name ,name))

   ((block name &rest forms)
    `(block name ,name forms ,(recur-all forms)))
   ((return-from name &optional value)
    `(return-from name ,name value ,(recur value)))

   ((tagbody &rest forms)
    `(tagbody forms ,(recur-all forms :test #'consp)))
   ((go tag)
    `(go tag ,tag))

   ((catch tag &rest forms)
    `(catch tag ,(recur tag) forms ,(recur-all forms)))
   ((throw tag result-form)
    `(throw tag ,(recur tag) result-form ,(recur result-form)))

   ((if a b c)
    `(if condition ,(recur a) then ,(recur b) else ,(recur c)))

   ((progn &body body)
    `(progn body ,(recur-all body)))

   ((unwind-protect protected-form &rest cleanup-forms)
    `(unwind-protect protected ,(recur protected-form)
                     cleanup ,(recur-all cleanup-forms)))

   ((%compilation-unit &rest lambdas)
    `(%compilation-unit lambdas ,(recur-all lambdas)))

   ((%asm &rest forms)
    `(%asm forms ,(loop for i in forms
                        when (eq (car i) :@)
                        collect `(:@ ,(recur (second i)) ,@(cddr i))
                        else collect i)))

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
(defparameter *ir1-var-info* nil)
(defparameter *ir1-tag-info* nil)
(defparameter *ir1-fun-info* nil)

(defparameter *ir1-in-tagbody* nil)
(define-structured-walker null-ir1-walker ()
  :form-var whole
  :forms
  (((quote value)
    `(quote value ,value))

   ;; type = :local , :normal , :setf , ??
   ;; (:local possibly should be :static, but might want to distinguish based
   ;;  on what we pass as THIS arg? :local would get current function's THIS
   ;;  while :static would get global scope or something?
   ;;  also need to distinguish between closure and non-closure calls,
   ;;    since closure calls need a new-function + call, while non-closure
   ;;    calls can just be called with call-static
   ;;    ... for now just using new-function+call on any fn with free vars
   ((%call type name args)
    `(%call type ,type name ,name args ,(recur-all args)))

   ;; possibly should split out closed and normal bindings, but for now
   ;; leaving combined to avoid worrying about order of evaluating the values
   ;; (might eventually want to assign a local for the closed vars anyway,
   ;;  if compiler gets smart enough to tell when nothing can be accessing
   ;;  them through the closure for a section of code? (and assuming going
   ;;  through the closure var is slow enough to care in the first place)
   ((%bind vars values closed-vars body)
    `(%bind vars ,vars
            values ,(recur-all values)
            closed-vars ,closed-vars
            body ,(recur-all body)))

   ;; type = :local , :closure , ???
   ((%ref type var)
    `(%ref type ,type var ,var))
   ((%set type var value)
    `(%set type ,type var ,var value ,(recur value)))

   ((%named-lambda name lambda-list closed-vars activation-vars body)
    (let ((*ir1-in-tagbody* nil))
      `(%named-lambda name ,name lambda-list ,lambda-list closed-vars ,closed-vars body ,(recur-all body))))

   ((function type name)
    `(function type ,type name ,name))

   ((block name nlx forms)
    `(block name ,name nlx ,nlx forms ,(recur-all forms)))
   ((return-from name value)
    `(return-from name ,name value ,(recur value)))

   ;; we add a (GENSYMed) name for TAGBODY for use with nlx GO
   ((tagbody name nlx forms)
    (let ((*ir1-in-tagbody* t))
      `(tagbody name ,name nlx ,nlx forms ,(recur-all forms :test #'consp))))
   ((go tag)
    `(go tag ,tag))

   ((catch tag forms)
    `(catch tag ,(recur tag) forms ,(recur-all forms)))
   ((throw tag result-form)
    `(throw tag ,(recur tag) result-form ,(recur result-form)))

   ;;; combined tag for non-local return-from, go, throw in later passes
   ((%nlx type name exit-point value)
    `(%nlx type ,type
           name ,name
           exit-point ,(recur exit-point)
           value ,(recur value)))


   ((if condition then else)
    `(if condition ,(recur condition) then ,(recur then) else ,(recur else)))

   ((progn body)
    `(progn body ,(recur-all body)))

   ((unwind-protect protected cleanup)
    `(unwind-protect protected ,(recur protected)
                     cleanup ,(recur-all cleanup)))

   ((%compilation-unit var-info tag-info fun-info lambdas)
    (let* ((*ir1-tag-info* tag-info)
           (*ir1-var-info* var-info)
           (*ir1-fun-info* fun-info)
           (rlambdas (recur-all lambdas)))
      `(%compilation-unit
        var-info ,*ir1-var-info*
        tag-info ,*ir1-tag-info*
        fun-info ,*ir1-fun-info*
        lambdas ,rlambdas)))

   ((%asm &rest forms)
    `(%asm forms ,(loop for i in forms
                        when (eq (car i) :@)
                        collect `(:@ ,(recur (second i)) ,@(cddr i))
                        else collect i)))
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

;;; add exit-point bindings to block+tagbody forms
;;; (so we can associate a go/return from to a particular entry into
;;;  the corresponding tagbody/block, to catch things like recursive
;;;  calls, or passing a closure back into a second execution of the form)
;;; for now implementing exit-point as binding a var around the block/tagbody
;;;  so nlx can close over it as needed, later optimization passes can
;;;  remove the unused binding if no nlx was needed
(define-structured-walker ir1-add-exit-points null-ir1-walker
  :form-var whole
  :labels ((set-tag-info (var flag value)
                         (setf (getf (getf *ir1-tag-info* var nil) flag) value)))
  :forms
  (((block name nlx forms)
    (let ((exit-point-sym (gensym (format nil "EXIT-POINT-~s-" name))))
      (set-tag-info name :exit-point-var exit-point-sym)
      `(%bind vars (,exit-point-sym)
              values ((%call type :normal name %exit-point-value args nil))
              body (,(super whole)))))
   ((tagbody name nlx forms)
    ;; assign a name to the tagbody for use with nlx, and mark all tags with it
    (let ((name (or name (gensym "TAGBODY-EXIT-POINT-")))
          (*ir1-in-tagbody* t))
      (loop for i in forms
            when (atom i)
            do (set-tag-info i :exit-point-var name))
      `(%bind vars (,name)
              values ((%call type :normal name %exit-point-value args nil))
              body ((tagbody name ,name nlx ,nlx forms ,(recur-all forms :test #'consp))))))))


;;; decide if uwp cleanup should be inline or extracted to function?
;;;  -- inlining for now, since we'll probably need as much work to
;;;     set up the call as to just inline it

;;; repeat
;;;   mark closed vars
;;;   convert closed-over scopes inside loops to lambdas
;;;   convert go/tagbody to %nlx if needed
;;;     (needs to happen inside loop, since it has to close over exit-point,
;;;      which might add closure scopes)
(defparameter *ir1-local-vars* nil)
(defparameter *ir1-free-vars* nil)
(defparameter *ir1-need-another-pass* nil)
(define-structured-walker ir1-convert-and-extract-nested-activation-scopes null-ir1-walker
  :form-var whole
  :labels
  ((set-var-info (var flag value)
                 (setf (getf (getf *ir1-var-info* var nil) flag) value))
   (separate-free-vars (names values)
                       (loop for name in names
                             for value in values
                             when (member name *ir1-free-vars*)
                             collect name into closed-names
                             and collect value into closed-values
                             else
                             collect name into bind-names
                             and collect value into bind-values
                             finally (return (values closed-names closed-values bind-names bind-values))))
   )
  :forms (((%bind vars values closed-vars body)
           ;; fixme: we probably only need closed-names, so replace this with remove-if-not or something
           (multiple-value-bind (closed-names closed-values
                                 bind-names bind-values)
               (separate-free-vars vars values)
             (declare (ignore closed-values bind-values bind-names))
             (cond
               ;; we need an activation record, and are in a tagbody,
               ;; extract to a lambda just to be safe
               ;; TODO: determine if we are actually inside a loop or not
               ;; FIXME: we should check for free vars from within this scope
               ;;        and possibly expand the binding
               ((and closed-names *ir1-in-tagbody*)
                (let ((name (gensym "CLOSURE-SCOPE-")))
                  `(progn
                     body
                     ((%named-lambda
                       name ,name
                       lambda-list ,(cons 'this vars)
                       body ,(recur-all body))
                      (%call type :local name ,name args ,(recur-all values))))))
               ;; not in a loop, just add closed named to list
               (closed-names
                `(%bind
                  vars ,vars
                  values ,values
                  closed-vars ,(union closed-vars closed-names)
                  body ,(recur-all body)))
               ;; no variables closed over, don't change binding
               (t (super whole)))))

          ((%named-lambda name lambda-list body)
           (let* ((*ir1-in-tagbody* nil)
                  (names (lambda-list-vars lambda-list))
                  (closed
                   (remove-if-not (lambda (x) (member x *ir1-free-vars*))
                                  names)))
             (if closed
                 (progn
                   (setf *ir1-need-another-pass* t)
                   `(%named-lambda
                     name ,name
                     lambda-list ,lambda-list
                     closed-vars ,closed
                     body ,(recur-all body)))
                 ;; no closed vars, leave as-is
                 (super whole))))
          ((%ref type var)
           (if (and (not (eq type :lex ))
                    (member var *ir1-free-vars*))
               (progn
                 (set-var-info var :ref-type :closure)
                 `(%ref type :closure var ,var))
               (super whole)))
          ((%set-local-ref)
           (error "broken, got %set-local-ref"))
          ((%set var value)
           (if (member var *ir1-free-vars*)
               (progn
                 (set-var-info var :ref-type :closure)
                `(%set type :closure var ,var value ,(recur value)))
               (super whole)))
          ((%compilation-unit)
           (let ((*ir1-need-another-pass* nil))
             (values (super whole) *ir1-need-another-pass*)))
))

(define-structured-walker ir1-find-free-vars null-ir1-walker
  :form-var whole
  :forms (((%bind vars values closed-vars body)
           (let ((*ir1-local-vars* (append vars *ir1-local-vars*)))
             `(%bind vars ,vars
                     values ,(recur-all values)
                     closed-vars ,closed-vars
                     body ,(recur-all body))))

          ((%named-lambda name lambda-list body)
           ;;(format t "llist : ~s~%vars= ~s~%" lambda-list (lambda-list-vars lambda-list))
           (let ((*ir1-local-vars* (lambda-list-vars lambda-list)))
             (super whole)))

          ((%ref type var)
           (when (and (eq type :local)
                    (not (member var *ir1-local-vars*)))
               (push var *ir1-free-vars*))
           (super whole))
          ((%set type var value)
           (when (and (eq type :local)
                    (not (member var *ir1-local-vars*)))
               (push var *ir1-free-vars*))
           (super whole))

          ((%compilation-unit)
           (let ((*ir1-local-vars* nil)
                 (*ir1-free-vars* nil))
             (setf whole (super whole))
             (multiple-value-prog1
                 (if *ir1-free-vars*
                     (ir1-convert-and-extract-nested-activation-scopes whole)
                     (values whole nil))
               (when *ir1-free-vars* (format t "local vars: ~s~%" *ir1-local-vars*))
               #+nil(format t "free vars: ~s~%" *ir1-free-vars*)
)))))


;;; convert go/return-from through uwp into throw?
;;; mark block/tagbody with nlx return-from/go
;;; (convert all nlx into single op, with flag specifying type?)
(defparameter *ir1-nlx-tags* nil)
(defparameter *ir1-local-tags* nil)
(defparameter *ir1-in-uwp* nil)
(define-structured-walker ir1-find-nlx-tags null-ir1-walker
  :form-var whole
  :labels ((get-tag-info (var flag &optional default)
                         (getf (getf *ir1-tag-info* var nil) flag default)))
  :forms (((%named-lambda name lambda-list body)
           (let ((*ir1-local-tags* nil)
                 (*ir1-in-uwp* nil))
             (super whole)))

          ((unwind-protect protected cleanup)
           (let ((*ir1-in-uwp* t)
                 (*ir1-local-tags* nil))
             (super whole)))

          ((block name nlx forms)
           (let* ((*ir1-local-tags* (cons name *ir1-local-tags*))
                  (rforms (recur-all forms)))
             #+nil(format t "block : nlx = ~s ~s/~s~%" (member name *ir1-nlx-tags*)
                     name *ir1-nlx-tags*)
             `(block name ,name
                     nlx ,(or nlx (member name *ir1-nlx-tags*))
                     forms ,rforms)))

          ((return-from name value)
           ;;(format t "return-from name=~s/~s~%" name *ir1-local-tags*)
           (if (member name *ir1-local-tags*)
               (super whole)
               (progn
                 (setf *ir1-need-another-pass* t)
                 (push name *ir1-nlx-tags*)
                 `(%nlx type :return-from
                        name ,name
                        exit-point ,(recur `(%ref type :local
                                                  var ,(get-tag-info
                                                        name :exit-point-var)))
                        value ,(recur value)))))

          ((tagbody name nlx forms)
           (let* ((*ir1-in-tagbody* t)
                  (*ir1-local-tags* (loop with tags = *ir1-local-tags*
                                          for i in forms
                                          when (atom i)
                                          do (push i tags)
                                          finally (return tags)))
                  (rforms (recur-all forms :test #'consp))
                  (nlx (or nlx
                           (loop for i in forms
                                 thereis (and (atom i)
                                              (member i *ir1-nlx-tags*))))))
             `(tagbody name ,name nlx ,nlx forms ,rforms)))
          ((go tag)
           (if (member tag *ir1-local-tags*)
               (super whole)
               (progn
                 (setf *ir1-need-another-pass* t)
                 (push tag *ir1-nlx-tags*)
                 `(%nlx type :go
                        name ,tag
                        exit-point ,(recur `(%ref type :local
                                                  var ,(get-tag-info
                                                        tag :exit-point-var)))
                        value (quote value nil)))))

          ((catch tag forms)
           (let ((*ir1-local-tags* (cons tag *ir1-local-tags*)))
             (super whole)))
          ((throw tag result-form)
           (if (member tag *ir1-local-tags*)
               (super whole)
               (progn
                 (push tag *ir1-nlx-tags*)
                 ;; go tags are evaluated...
                 `(%nlx type :throw
                        name ,tag
                        exit-point ,(recur tag)
                        value ,(recur result-form)))))


          ((%compilation-unit)
           (let ((*ir1-local-tags* nil)
                 (*ir1-nlx-tags* nil)
                 (*ir1-need-another-pass* nil))
             (setf whole (super whole))
             (prog1
                 (values whole *ir1-need-another-pass*)
               (when *ir1-local-tags* (format t "local tags: ~s~%" *ir1-local-tags*))
               #+nil(format t "nlx tags: ~s~%" *ir1-nlx-tags*)
)))))



(defun ir1-closure-scopes (form)
  (loop with not-done = nil
        with not-done2 = nil
        repeat 5
        for i from 0
        for *ir1-free-vars* = nil
        ;;do (format t "closure-scope pass ~s~%->~s~%--------~%" i form)
        ;; find free vars, convert-closed over bindings to lambdas inside loops
        do (setf (values form not-done) (ir1-find-free-vars form))
        ;;do (format t "==closure-scope pass ~s~%->~s~%--------~%" i form)
        ;; convert non-local go/return-from to %nlx
        do (setf (values form not-done2) (ir1-find-nlx-tags form))
        while (or not-done not-done2)
       )
  ;;(format t "==closure-scope done ~%->~s~%--------~%" form)
  form)



;;; extract lambdas
(defparameter *ir1-lambdas* nil)
(define-structured-walker ir1-extract-lambdas null-ir1-walker
  :form-var whole
  :forms (((%named-lambda name lambda-list body)
           (push (super whole) *ir1-lambdas*)
           ;; just replace the lambda with nil for now, later passes
           ;; can optimize it away
           `(quote value nil))

          ((%compilation-unit var-info tag-info fun-info lambdas)
           (let* ((*ir1-lambdas* nil))
             (recur-all lambdas)
             `(%compilation-unit
               var-info ,var-info
               tag-info ,tag-info
               fun-info ,fun-info
               lambdas ,*ir1-lambdas*)))))

;;; mark function calls needing args in temps due to catch blocks
;;;  (possibly splitting args into before/after groups so latter set don't
;;;   need temporaries)
(defparameter *ir1-call-stack* nil)
(define-structured-walker ir1-mark-spilled-args null-ir1-walker
  :form-var whole
  :labels ((mark-catch-arg ()
             ;; loop over every call in progress, and mark current arg as
             ;; having an exception block
                           #+nil(format t "marking : ~s ->" *ir1-call-stack*)
             (loop for i in *ir1-call-stack*
                   do (setf (caaadr i) t))
             #+nil(format t "~s~%" *ir1-call-stack*)))
  :forms (((%call type name args)
           (let* ((tag (gensym))
                  (flags (list nil))
                  (*ir1-call-stack* (cons (list tag flags) *ir1-call-stack*))

                  (recurred-args (loop for i in args
                                       ;; fixme: caadar is ugly, make the structure/access more obvious...
                                       do (push nil (caadar *ir1-call-stack*))
                                       collect (recur i))))
             (multiple-value-bind (spilled-vars spilled-values inline)
                 ;; flags is reversed list of flag indicating
                 ;; corresponding arg has a exception block, so we
                 ;; need to spill it and any preceding args into
                 ;; locals instead of leaving it on the stack, since
                 ;; exception handler will clear stack...
                 (loop for f in (nreverse (loop with spill = nil
                                                for f in (car flags)
                                                when f
                                                do (setf spill t)
                                                when spill collect t
                                                else collect nil))
                       for arg in recurred-args
                       for sym = (gensym "ARG-TEMP-")
                       when f
                       collect sym into spilled-vars
                       and collect arg into spilled-values
                       else collect arg into inline
                       finally (return (values spilled-vars
                                               spilled-values
                                               inline)))
               #+nil(format t "spilling: ~s/~s/~s~%"spilled-vars spilled-values inline)
               #+nil(format t "flags: ~s/~s/~%" flags recurred-args)
               (if spilled-vars
                   ;; some args need to be in locals, so replace the
                   ;; call with a local binding to allocate temp vars,
                   ;; and a call with the locals as args instead of
                   ;; the original forms
                   `(%bind vars ,spilled-vars
                           values ,spilled-values
                           closed-vars nil
                           body ((%call type ,type
                                        name ,name
                                        args ,(append (loop for i in spilled-vars
                                                            collect
                                                            `(%ref type :local
                                                                   var ,i))
                                                      inline))))
                   ;; normal case, just leave args inline (we already
                   ;; did the recur-all, so don't need it here...)
                   `(%call type ,type name ,name args ,recurred-args)))))

          ((block name nlx forms)
           #+nil(when nlx (format t "nlx-block ~s~%" whole))
           (when nlx (mark-catch-arg))
           (super whole))
          ((tagbody name nlx forms)
           (when nlx (mark-catch-arg))
           (super whole))
          ((catch tag forms)
           (mark-catch-arg)
           (super whole))
          ;; we match local jumps too, to catch stuff like (+ 1 (go 2) 3))
          ;;  we should probably limit it to forms that actually exit the
          ;;  arglist, but being conservative for now
          ;;  (ex: (+ 1 (block x (return-from x 2)) 3) is safe
          ((return-from name value)
           (mark-catch-arg)
           (super whole))
          ((go tag)
           (mark-catch-arg)
           (super whole))


          ;; u-w-p possibly shouldn't be here, since f we don't
          ;; trigger the exception block on normal exits from the
          ;; block, then the stack is still valid, and when it does
          ;; get triggered, we are probably going to rethrow it
          ;; anyway, so the call won't be made either way...
          ;; (unless we catch it in an enclosing catch/block.tagbody,
          ;;  in which case we marked the arg anyway)
          ((unwind-protect protected cleanup)
           (mark-catch-arg)
           (super whole))

          ((%compilation-unit lambdas)
           (let* ((*ir1-call-stack* nil))
             (super whole)))))

;;; deal with (local?) jumps out of argument lists
;;;   - convert the outermost call within the scope of the jump target
;;;     into a lambda?
;;;     = probably avoids the most verifier hassle, but probably slow
;;;       and might complicate things in other ways?
;;;   - use a throw instead of a jump
;;;     = don't have to clear stack, but might still need to worry about
;;;       types in locals?
;;;       probably slow too
;;;   - or spill to locals, might need to add :kill though
;;;     = probably not much simpler than popping stack before jump due to
;;;       needing kills to avoid type check problems on locals
;;;   - or add code to clean up stack before the jump?
;;;     = probably best solution, if we can track the stack depth
;;;       accurately without too much effort?



;;; collect/store some info on tag/var usage for later passes
;;;   mark vars that are assigned to at some point (after initialization)
;;;   'trivial constant' vars = never assigned, initialized to anything
;;;      that only takes 1 asm opcode to compile (ex. nil,int,string,etc)
;;;   unused tags
;;; ???
;;FIXME: do the var part sooner, so we can avoid creating closures for vars that are never modified
(defparameter *ir1-current-fun* nil)
(defun simple-quote-p (value)
  (typecase value
    (integer t) ;; probably should range check...
    (real t)
    (string t)
    ((member t nil) t)
    (t nil)))
(define-structured-walker ir1-collect-var/tag-info null-ir1-walker
  :form-var whole
  :labels ((set-var-info (var flag value)
             (setf (getf (getf *ir1-var-info* var nil) flag) value))
           (inc-var-info (var flag value &optional init)
             (incf (getf (getf *ir1-var-info* var nil) flag init) value))
           #+nil(set-tag-info (var flag value)
             (setf (getf (getf *ir1-tag-info* var nil) flag) value))
           (inc-tag-info (var flag value &optional init)
             (incf (getf (getf *ir1-tag-info* var nil) flag init) value))
           (set-fun-info (var flag value)
             (setf (getf (getf *ir1-fun-info* var nil) flag) value)))
  :forms
  (((%bind vars values closed-vars body)
    (loop for var in vars
          for value in values
          for simple = (simple-quote-p value)
          do (set-var-info var :simple-init simple))
    (super whole))
   ((%named-lambda name lambda-list closed-vars body)
    ;;(loop for var in (lambda-list-vars lambda-list)
    ;;        do (set-var-info var :simple-init simple))
    (let ((*ir1-current-fun* name))
      (super whole)))

   ((%ref type var)
    (when (eq type :closure)
      (set-fun-info *ir1-current-fun*  :closure t))
    (when (member type '(:closure :local))
      (inc-var-info var :ref-count 1 0))
    (super whole))
   ((%set type var value)
    (when (eq type :closure)
      (set-fun-info *ir1-current-fun*  :closure t))
    (inc-var-info var :set-count 1 0)
    (super whole))


   ;((block name nlx forms)
   ; (super whole))
   ((return-from name value)
    (inc-tag-info name :local-count 1 0)
    (super whole))

   ;((tagbody name nlx forms)
   ; (super whole))
   ((go tag)
    (inc-tag-info tag :local-count 1 0)
    (super whole))

   ;((catch tag forms)
   ; `(catch tag ,(recur tag) body ,(recur-all forms)))
   ((throw tag result-form)
    (warn "still have THROWs in opt0?")
    (inc-tag-info tag :nlx-count 1 0)
    (super whole))

   ;;; combined tag for non-local return-from, go, throw in later passes
   ((%nlx type name exit-point value)
    (inc-tag-info name :nlx-count 1 0)
    (super whole))

   ((%compilation-unit tag-info var-info fun-info lambdas)
    (let* ((*ir1-tag-info* tag-info)
           (*ir1-var-info* var-info)
           (*ir1-fun-info* fun-info)
           (recurred-lambdas (recur-all lambdas)))
      `(%compilation-unit var-info ,*ir1-var-info*
                          tag-info ,*ir1-tag-info*
                          fun-info ,*ir1-fun-info*
                          lambdas ,recurred-lambdas)))


)
)
;;; simple optimizations part 1:
;;;   (mostly stuff that doesn't depend on changes to the AST, so that
;;;    stuff that does care doesn't need to be run multiple times to
;;;    adjust will probably want to mix them at some point, once other
;;;    optimizations get smart enough to need multiple passes
;;;    anyway...)
;;;   remove unused blocks
;;;-  inline trivial constants
;;;-  remove unused var bindings?
;;;     need to make sure we keep any initialization code unless we can
;;;     prove no side effects, so need to either limit to simple cases
;;;     for now, or convert to a progn or something...
;;;-  remove unused bind blocks
;;TODO: stuf marked with - above
(define-structured-walker ir1-optimize1 null-ir1-walker
  :form-var whole
  :labels ((get-var-info (var flag &optional default)
             (getf (getf *ir1-var-info* var nil) flag default))
           (get-tag-info (tag flag &optional default)
             (getf (getf *ir1-tag-info* tag nil) flag default)))
  :forms
  (((%compilation-unit var-info tag-info fun-info lambdas)
    (let ((*ir1-tag-info* tag-info)
          (*ir1-var-info* var-info)
          (*ir1-fun-info* fun-info))
      (super whole)))

   ((block name nlx forms)
    ;; fixme: should probably just store a flag instead of counts?
    (if (and (not nlx)
             (zerop (get-tag-info name :local-count 0))
             (zerop (get-tag-info name :nlx-count 0)))
        `(progn body ,forms)
        (super whole)))
)

)
;;; simple optimizations part 2:
;;;   flatten nested progn
;;;   drop obviously unused QUOTE values (ex: 1 and 2 in (progn 1 2 3))
;;;-  replace single form progn with body
;;;-  handle prog1 similarly to prog1
;;;-  optimize tagbody forms similarly to progn?
;;;     flatten progn, drop unused stuff, etc...
;;;-  rearrange IF as suggested in various compilation papers, IF with
;;;     constant condition, etc
;;;-  inline simple constant vars?
;;;     unmodified variables initialized by a simple QUOTE (int,string,etc)
;;;-  partial evaluation etc for known functions
;;;     ex: (progn (+ 1 2 (foo) 4) 5) -> (progn (foo) 5)
;;;     ex: (progn (list 1 2 (cons 4 5) 6) 7) -> 7
;;TODO: stuf marked with - above
(define-structured-walker ir1-optimize2 null-ir1-walker
  :form-var whole
  :labels ((flatten-progn (body &optional ignored)
             (loop for (form . more) on body
                   ;; expand nested progn
                   if (eq 'progn (car form))
                   append (flatten-progn (getf (cdr form) 'body) more)
                   ;; drop quoted values in top level of progn unless last form
                   else if (and (or more ignored) (eq (car form) 'quote))
                   do (progn)
                   ;; handle everything else normally
                   else collect (recur form)
                   )))
  :forms (((progn body)
           `(progn body ,(flatten-progn body)))
          ;; possibly should make implicit progn explicit so we don't need
          ;; to handle them here?
          ((%bind vars values closed-vars body)
           `(%bind vars ,vars
                   values ,(recur-all values)
                   closed-vars ,closed-vars
                   body ,(flatten-progn body)))

          ((%named-lambda name lambda-list closed-vars body)
           (let ((*ir1-in-tagbody* nil))
             `(%named-lambda name ,name
                             lambda-list ,lambda-list
                             closed-vars ,closed-vars
                             body ,(flatten-progn body))))

          ((block name nlx forms)
           `(block name ,name nlx ,nlx forms ,(flatten-progn forms)))

          ((catch tag forms)
           `(catch tag ,(recur tag) forms ,(flatten-progn forms)))

          ((unwind-protect protected cleanup)
           `(unwind-protect protected ,(recur protected)
                            cleanup ,(flatten-progn cleanup)))
))
(defparameter *ir1-verbose* nil)
;; hack to allow using same macros in old and new compiler...
(defparameter *new-compiler* nil)
(defun passes (form passes)
  (when *ir1-verbose* (format t "~%~%compiling~%~S~%" form))
  (loop for p in passes
        for f = (funcall p form) then (funcall p f)
        do (when *ir1-verbose* (format t "pass ~s :~%~s~%-----~%" p f))
        finally (return f)))
(defparameter *ir1-passes*  '(ir0-minimal-compilation-etc
                              ir0->ir1
                              ir1-add-exit-points
                              ir1-closure-scopes
                              ;;ir1-find-nlx-tags
                              ir1-extract-lambdas
                              ir1-mark-spilled-args
                              ir1-collect-var/tag-info
                              ir1-optimize1
                              ir1-optimize2))
(defun cc (form)
  (let ((*new-compiler* t))
   (let ((form `(%compilation-unit (%named-lambda :top-level () ,form))))
     (passes form *ir1-passes*))))

;;(cc ''1)
;;(cc ''a)
;;(cc ''(1 2))
;;(cc ''(1 . 2))
;;(cc '(vector 1 2))
;;(cc '#(1 2))
;;(cc ''#(1 2))
;;(cc '(progn 1))
;;(cc '(progn 1 2 3))
;;(cc '(progn (progn 1 2) 'a (+ 2 3) (progn 3)))
;;(with-tags '(a) (cc '(go b))) ;; expected error
;;(with-tags '(a) (cc '(go a)))
;;(cc '(tagbody foo (go baz) baz))
;;(cc '(tagbody 1 (go 2) 2))
;;(cc '(symbol-macrolet ((a 'foo)) a))
;;(cc '(symbol-macrolet ((a (foo 123))) (+ a 1)))
;;(cc '(symbol-macrolet ((a (foo 123))) (setq a 1)))
;;(cc '(symbol-macrolet ((a (foo 123))) (let ((b 2)) (setq a 1 b 3))))
;;(cc '(macrolet ((x (a) `(list ,a))) (x 123)))
;;(cc '(macrolet ((x (a) (return-from x (list 'list 234 a)) `(list ,a))) (x 123)))

;;(with-local-vars (alphatize-var-names '(a)) (cc 'a))
;;(with-local-vars (alphatize-var-names '(a)) (cc '(let ((a a) (b 'a)) a)))
;;(with-local-vars (alphatize-var-names '(a)) (cc '(setq a 1)))
;;(cc '(setq))
;;(cc '(let ((a 2)) (setq a 1)))
;;(cc '(symbol-macrolet ((x 'foo)) (list x (let ((x 'bar)) x))))
;;(cc '(block x (return-from x)))
;;(cc '(block x (return-from x 123)))
;;(cc '(labels ((x (a) (list a))) (x 123)))
;;(cc '(flet ((x (a) (list a))) (x 123)))
;;(cc '(flet ((x (a) (return-from x 1) (list a))) (x 123)))
;;(cc '(labels ((x (a) (list (y a))) (y (a) (x a))) (x 123)))
;;(cc '(flet ((x (a) (list (y a))) (y (a) (x a))) (x 123)))
;;(cc '(function (lambda (x) (+ x 1))))
;;(cc '(function foo))
;;(cc '(labels ((x (a) (list (y a))) (y (a) (x a))) (function x)))
;;(cc '(if t 1 2))
;;(cc '(return-from a 1)) ;; error
;;(cc '(catch 'a (throw 'a 1)))
;;(cc '(tagbody (+ 1 2 (go foo) 3 4) foo))
;;(cc '(tagbody (+ 1 2 (if (baz) 3 (go foo)) 4 5) foo)) ;; TODO
;;(cc '(let ((a 1) (b 2)) (lambda (a c) (+ a b c))))


;;(cc '(let ((x 1)) (lambda (y) (+ x y))))
;;(cc '(lambda (a) (lambda (b) (+ a b))))
;;(cc '(lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))))

;;(cc '(lambda (a) (tagbody (let ((j 123)) (lambda (b) (+ a b j))))))
;;(cc '(lambda (a) (tagbody (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (+ a b j))))))))
;;(cc '(lambda (a) (tagbody foo (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (if (zerop a) (go bar) (+ a b j)))))) bar)))

;;(cc '(flet ((x (a) (list (y (return-from x 1) a))) (y (a) (x a))) #'x))

;;(cc '(lambda (a) (lambda (x) (+ x a)) a))
;;(cc '(lambda () (tagbody foo (go bar) bar (lambda () (go foo)))))

;;(cc '(tagbody 1 (lambda (x) (go 1))))
;;(cc '(lambda (x) (block blah 1)))
;;(cc '(lambda (x) (block blah (block baz (return-from blah 2)))))
;;(cc '(lambda (x) (block baz (block blah (lambda (x) (return-from blah 2))))))
;;(cc '(block foo (progn 1 2) (block piyo (progn 1 (foo))) (progn (hoge) 3) (return-from foo 1)))
;;(cc '(+ 1 2 (catch 'baz (foo)) 3 4))