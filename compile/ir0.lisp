(in-package :avm2-compiler)
(declaim (optimize debug safety))

;;; ir0: minimal compilation, alphatization, etc

;;; special forms
;;block
;;let*
;;return-from
;;catch
;;load-time-value
;;setq
;;eval-when
;;locally
;;symbol-macrolet
;;flet
;;macrolet
;;tagbody
;;function
;;multiple-value-call
;;the
;;go
;;multiple-value-prog1
;;throw
;;if
;;progn
;;unwind-protect
;;labels
;;progv
;;let
;;quote

;;;; minimal compilation pass:
;;; expand macros, compiler macros, macrolets, ?
;;; (symbol-macros? need to convert setq -> setf at same time if so)
;;; also:
;;    quote literals
;;    expand local/param refs to (%local-ref ...)
;;    alphatization:
;;      alphatize local vars/args/functions, go tags, block names, etc
;;      convert let/let* to %bind, with bindings evaluated in order, and
;;      scoping determined by alphatization
;;    expand lambda list keywords aside from &optional and &arest into
;;      &arest + %destructuring-bind
;;      -- at least some &optional need to be handled by d-s-b, so we can
;;         have arbitrary defaults, and check for supplied-p, etc
;;         (possibly also to get the NIL default correct, instead of
;;          the UNDEFINED provided by the vm)
;;         so might just do all &optional that way to start with?
;;;cleanup: might be simpler to just do the environment as a few specials
;;         instead of using the existing code, but not worth reimplementing
;;         until stuff stabilizes
;;;   convert to ir1:
;;;     (form . plist) instead of (form . args)
;;;     ex: (block foo bar baz (hoge piyo)) ->
;;;         (block name foo body (bar baz (hoge piyo)))
;;;     note: using non-keyword symbols for tags for now, so we can bind
;;;           them to symbol-macros in define-structured-walker for later passes
;;    extract type declarations and attach to corresponding bindings
(defun extract-declarations (forms &key allow-docstrings)
  (let ((var-types nil) ;; plist: var -> (list of types) ?maybe should be hash?
        ;; rest are lists of symbols (or (setf foo) for function names)
        ;; unless otherwise notes
        (special-vars nil)
        (inlined nil)   ;; functions
        (notinline nil) ;; functions
        ;; ignored:
        (dx-vars nil)
        (dx-functions nil)
        (ftypes nil) ;; plist: functions -> type?
        (ignored-vars nil)
        (ignored-functions nil)
        (ignorable-vars nil)
        (ignorable-functions nil)
        (returns nil)
        #++(optimize nil)) ;; not stored for now...
    (macrolet ((add-fn/var-decl (x var-list fn-list)
                 `(cond
                    ((symbolp ,x) (pushnew ,x ,var-list))
                    ((and (consp ,x) (eq (car ,x) 'function))
                     (pushnew (cdr ,x) ,fn-list))
                    (t (error "got declaration on ~s? expected symbol or (FUNCTION ...)" ,x)))))
      (flet ((process-declaration (d)
               (case (car d)
                 ;; var only
                 ((special)
                  (loop for i in (cdr d)
                     do (pushnew i special-vars)))
                 ((type)
                  (loop with type = (second d)
                     for i in (cddr d)
                     do (pushnew type (getf var-types i nil))))
                 ;; var or function
                 ((dynamic-extent)
                  (loop for i in (cdr d)
                     do (add-fn/var-decl i dx-vars dx-functions)))
                 ((ignore)
                  (loop for i in (cdr d)
                     do (add-fn/var-decl i ignored-vars ignored-functions)))
                 ((ignorable)
                  (loop for i in (cdr d)
                     do (add-fn/var-decl i ignorable-vars ignorable-functions)))
                 ;; function only
                 ((ftype)
                  (loop with type = (second d)
                     for i in (cddr d)
                     do (pushnew type (getf ftypes i nil))))
                 ((inline)
                  (loop for i in (cdr d)
                     do (pushnew i inlined)))
                 ((notinline)
                  (loop for i in (cdr d)
                     do (pushnew i notinline)))
                 ((optimize)
                  (format t "ignoring optimize declaration ~s...~%" d))
                 ;; to allow declaring a return type from inside a function
                 ((values)
                  (setf returns (cdr d)))
                 ;; anything else is assumed to be a typespec
                 ;; fixme: allow declaring new declaration specs, and
                 ;; filter those out here...
                 (t
                  (loop with type = (first d)
                     for i in (cdr d)
                     do (pushnew type (getf var-types i nil)))))))
        (loop ;; see 3.4.11 for docstring/declaration stuff
           with doc = nil
           for rest on forms
           for i = (car rest)
           when (and (consp i) (eq (car i) 'declare))
           do (loop for d in (cdr i)
                 do (process-declaration d))
           else when (and (stringp i) allow-docstrings (not doc))
           do (setf doc i)
           else
           return (values rest
                          special-vars var-types
                          notinline inlined
                          ftypes
                          ignored-vars ignored-functions
                          ignorable-vars ignorable-functions
                          returns))))))

(defun simple-default-p (z)
  (or (eq z t)
      (eq z nil)
      (stringp z)
      (numberp z)))

(defun expand-lambda (block-name lambda-name flags lambda-list
                      declarations-and-forms recur)
  (multiple-value-bind  (required optional rest keys
                                  allow-other-keys aux arest)
      (parse-lambda-list lambda-list)
    ;; fixme: we add the arest arg to the required arglist, so that
    ;; later passes don't think it is a free var (and don't have to
    ;; parse flags to handle it explicitly, but then we have to drop
    ;; it from the count in the final assembly, possibly should pass
    ;; the count of required args as a flag or something instead?
    (multiple-value-bind (body specials dtypes notinline inline
                               ftype ignore-vars ignore-functions
                               ignorable-vars ignorable-functions
                               returns)
        (extract-declarations declarations-and-forms)
        (declare (ignore ftype ignore-vars ignore-functions
                         ignorable-vars ignorable-functions))
      (declare (ignore specials notinline inline))
      (let* (;; we can't reliably detect missing args using the VM
             ;; optional args alone, so if we have a
             ;; supplied-p-parameter process &optional manually with
             ;; &rest and &key
             ;; (and same for more complicated default values)
             (complex-optional (if (find-if (lambda (a)
                                              (or (third a)
                                                  (not (simple-default-p
                                                        (second a)))))
                                            optional)
                                   optional
                                   nil))
             (optional (if complex-optional nil optional))
             (arest (or (when arest (alphatize-var-names (list arest)))
                        (when (or complex-optional keys rest)
                          (alphatize-var-names (list  (gensym "..."))))))
             (rtypes (append
                      (loop for r in required
                         collect (or (getf dtypes r) t))
                      (loop for (r) in optional
                         collect (or (getf dtypes r) t))))
             (required (append (alphatize-var-names required)
                               (alphatize-var-names (mapcar 'first optional))
                               arest)))
        (when (or (> (length returns) 2)
                  (and (not (eq (second returns) '&optional))
                       (> (length returns) 1)))
          (format t "declared multiple return types from function ~s/~s, not supported yet.." block-name lambda-name))
        (when returns (format t "got return type ~s~%" returns))
        `(%named-lambda  name ,lambda-name
             flags (,@flags ,@(if arest `(:arest ,(caar arest)))
                            ,@(when optional
                                    `(:optional
                                      ,(loop for (nil v nil) in optional
                                          collect v)))
                            ,@(if returns `(:return-type ,(if (eq (car returns)
                                                                  '&optional)
                                                              "void"
                                                              (car returns)))))
             lambda-list ,(mapcar 'cadr required)
             types ,rtypes
             body (,(if (or complex-optional rest keys aux)
                        (with-local-vars required
                          (funcall
                           recur
                           ;; expanding to a macro call from special
                           ;; forms is a bit ugly, but better than
                           ;; adding special forms for no reason, and
                           ;; we can avoid it easily enough to
                           ;; bootstrap that far
                           `(%destructuring-bind-*
                             (:optional ,complex-optional :key ,keys :aux ,aux
                                        :rest ,rest
                                        :allow-other-keys ,allow-other-keys)
                             ,(caar arest)
                             ;; fixme: probably should just add the block/progn in
                             ;; the caller instead of here?
                             (,@(if block-name `(block ,block-name) '(progn))
                                ,@body))))
                        (with-local-vars required
                          (funcall
                           recur
                           `(,@(if block-name
                                   `(block ,block-name)
                                   '(progn))
                               ,@body))))))))))

(define-walker ir0-minimal-compilation-etc () ;null-cl-walker
  :atoms (((or number string simple-vector bit-vector (eql t) (eql nil))
           `(quote value ,atom))
          (symbol (let ((binding (lexenv-get-variable-binding atom))
                        (constant-binding (find-swf-constant atom)))
                    (cond
                      ((keywordp atom) `(quote value ,atom))
                      ((and (consp binding) (eq (car binding) :macro))
                       (recur (cdr binding)))
                      ((and (consp binding) (eq (car binding) :local))
                       `(%ref type :local var ,(cdr binding)))
                      ((and (consp binding) (eq (car binding) :closed))
                       (error "got closed variable in ir0-minimal-compilation? ~s" atom))
                      (constant-binding
                       `(%ref type :lex
                              var (,(first constant-binding)
                                    ,(second constant-binding))))
                      (t (error "unknown local in ir0-minimal-compilation? ~s" atom))))))
  :form-var whole
  :forms
  (((let (&rest bindings) &rest declarations-and-forms)
    (multiple-value-bind (body specials dtypes notinline inline)
        (extract-declarations declarations-and-forms)
      #++(when (or specials dtypes notinline inline)
        (format t "let: body=~s~% special=~s dt=~s ni=~s i=~s~%"
                body specials dtypes notinline inline))
      ;; ---- need to store inline/notinline as 1 thing in env, so we can
      ;;      override properly
      (multiple-value-bind (bindings-names bindings-values bindings-types)
          (loop for binding in bindings
             for name = (if (atom binding) binding (car binding))
             for init = (if (atom binding) nil (second binding))
             collect name into names
             collect (recur init) into values
             collect (or (getf dtypes name) t) into types
             finally (return (values (alphatize-var-names names) values types)))
        `(%bind vars ,(mapcar 'second bindings-names)
                values ,bindings-values
                types ,bindings-types
                body (, (with-local-vars bindings-names
                          (recur `(progn ,@body))))))))

   ((let* (&rest bindings) &rest declarations-and-forms)
    (multiple-value-bind (body specials dtypes notinline inline)
        (extract-declarations declarations-and-forms)
      (declare (ignore specials notinline inline))
      (let* ((bindings-names nil)
             (bindings-values nil)
             (types nil))
        ;;fixme: this is a bit ugly to avoid depending on guts of env stuff
        ;; should probably rewrite it...
        (loop for binding in bindings
           for name = (if (atom binding) binding (car binding))
           for init = (if (atom binding) nil (second binding))
           do (push (with-local-vars bindings-names
                      (recur init))
                    bindings-values)
           do (push (list name (alpha-convert-name name)) bindings-names)
           collect (or (getf dtypes name) t) into %types
           finally (progn
                     (setf bindings-names (nreverse bindings-names))
                     (setf bindings-values (nreverse bindings-values))
                     (setf types %types)))
        `(%bind vars ,(mapcar 'second bindings-names)
                values ,bindings-values
                types ,types
                body (, (with-local-vars bindings-names
                          (recur `(progn ,@body))))))))

   ;; hack until there is enough eval-when to implement it properly
   ((define-symbol-macro symbol expression)
    (pushnew `(,symbol . (:macro . ,expression))
             (variables *lexenv*) :test #'equalp)
    '(quote value nil))

   ((symbol-macrolet (&rest bindings) &rest declarations-and-forms)
    ;; fixme: don't bind over constants or specials
    (with-symbol-macros bindings
      `(progn body ,(recur-all declarations-and-forms))))
                                        ;--------------------
                                        ;alpha convert arg names ....
                                        ;implement labels to match flet...

   ;;fixme: extract the duplicated lambda processing code from flet/labels/function
   ((flet (&rest flets) &rest declarations-and-forms)
    (let* ((names (loop for i in flets
                     collect (list (car i)
                                   (alpha-convert-name (car i)))))
           (lambdas
            (loop for (n _ll . body) in flets
               for (nil label) in names
               for ll = (cons 'this _ll)
               ;;for args = (alphatize-var-names (lambda-list-vars ll))
               ;;collect
               #++ `(,(alphatize-lambda-list ll args #'recur)
                      ,(with-local-vars args
                                        (recur `(block ,n ,@body))))
               collect (expand-lambda n label '(:anonymous t) ll body #'recur))))
      ;; we only need the flet to delimit the lexical scope,
      ;; so alpha convert and get rid of it completely...
      #++
      `(progn
         ,@(loop ; for (nil label) in names
              for lambda in lambdas
              collect lambda #++`(%named-lambda ,label (:anonymous t) ,@lambda))
         ,@(with-local-functions names
                                 (recur-all declarations-and-forms)))
      ;; calling local functions directly seems to break things, so
      ;; store them in a variable and funcall for now...
      (with-local-vars (loop for (nil i) in names
                          collect (list i i))
        `(%bind
          vars ,(mapcar 'second names)
          values ,(loop for (nil i) in names
                     collect `(function type :local name ,i))
          types ,(mapcar (constantly t) names)
          body ((progn
                  body
                  (,@(loop
                        for lambda in lambdas
                        collect lambda)
                     ,@ (with-local-functions names
                          (recur-all declarations-and-forms)))))))))

   ((labels (&rest flets) &rest declarations-and-forms)
    (let ((names (loop for i in flets
                       collect (list (car i)
                                     (alpha-convert-name (car i) "label-")))))
      (with-local-functions names
        (with-local-vars (loop for (nil i) in names
                          collect (list i i))
          (let ((lambdas
                (loop for (n _ll . body) in flets
                   for (nil label) in names
                   for ll = (cons 'this _ll)
                   collect (expand-lambda n label '(:anonymous t)
                                          ll body #'recur))))
           ;; we only need the LABELS to delimit the lexical scope,
           ;; so alpha convert and get rid of it completely...
           `(%bind
             vars ,(mapcar 'second names)
             values ,(loop for (nil i) in names
                        collect `(function type :local name ,i))
             types ,(mapcar (constantly t) names)
             body ((progn
                     body
                     (,@lambdas
                      ,@(recur-all declarations-and-forms))))))))))


   ((macrolet (&rest bindings) &rest declarations-and-forms)
    (with-local-macros
        (loop for (name lambda-list . body) in bindings
              collect (list name
                            (coerce
                             `(lambda (rest)
                                (destructuring-bind ,lambda-list
                                    rest
                                  (block ,name ,@body)))
                             'function)))
      (recur `(progn ,@declarations-and-forms))))

   ((function name)
    (if (and (consp name) (eq (car name) 'lambda))
        (let* ((temp-name (gensym "LAMBDA-"))
               (lambda-list (cons 'this (second name)))
               ;(args (alphatize-var-names (lambda-list-vars lambda-list)))
               (body (cddr name)))
          `(progn
             body (,(expand-lambda nil temp-name '(:anonymous t)
                                   lambda-list body #'recur)
                    (function type :local name ,temp-name))))
        (let ((binding (lexenv-get-function-binding name)))
          (cond
            ((and (symbolp name) (special-operator-p name))
             (error "calling FUNCTION on special operator: ~s" name))
            ((and (consp binding) (eq (car binding) :macro))
             (error "calling FUNCTION on macrolet: ~s" name))
            ((and (consp binding) (eq (car binding) :function))
             `(%ref type :local var ,(second binding))
             #++`(%local-function ,(second binding)))
            ;; todo: global macros
            ((and (consp name) (eq (car name) 'setf))
             (error "don't know how to call FUNCTION on global setf functions yet: ~s" name))
            (t `(function type :normal name ,name))))))

   ((setq &rest pairs)
    ;;fixme: don't generate extra progn if only 1 pair?
    `(progn
       body
       ,(loop for (var val) on pairs by #'cddr
           for binding = (lexenv-get-variable-binding var)
           collect (cond
                     ((and (consp binding) (eq (car binding) :macro))
                      (recur `(setf ,(cdr binding) ,val)))
                     ((and (consp binding) (eq (car binding) :local))
                      `(%set type :local
                             var ,(cdr binding)
                             value ,(recur val)))
                     (t (error "don't know how to setq ~s yet ..." var))))))


   ((tagbody &rest body)
    (let ((tags (remove-if-not #'atom body)))
      (with-tags tags
        `(tagbody forms ,(loop for i in body
                            when (consp i)
                            collect (recur i)
                            else
                            collect (cdr (get-tag i)))))))

   ((go tag)
    (let ((real-tag (get-tag tag)))
      (assert real-tag (tag) "GO tag not found ~s" tag)
      `(go tag ,(cdr real-tag))))

   ;; temporary hack 'til we have a real macro to expand it...
   ((lambda (&rest args) &rest body)
    (recur `(function ,whole)))
   ((%named-lambda name flags args &rest body)
    (let* ((this (or (getf flags :this-arg) 'this))
           (args (cons this args))
           (block (getf flags :block-name)))
      (expand-lambda block name flags args body #'recur)))


   ((%local-ref name)
    (let ((binding (lexenv-get-variable-binding name)))
      `(%ref type :local var ,(or (cdr binding)
                                  (error "unknown local ~s" name)))))
   ((%lex-ref object name)
    `(%ref type :lex var (,object ,name)))

   ((%local-set name value)
    (let ((binding (lexenv-get-variable-binding name)))
      `(%set type :local
             var ,(or (cdr binding) (error "unknown local ~s" name))
             value ,(recur value))))

   ((block name &rest forms)
    (let ((tag (cons name (alpha-convert-name name))))
      (with-block-tag tag
        `(block name ,(cdr tag) forms ,(recur-all forms)))))
   ((return-from name &optional value)
    (let ((block (get-block name)))
      (unless block (error "RETURN-FROM unknown block ~s" name))
      `(return-from name ,block value ,(recur value))))


   ((catch tag &rest forms)
    `(catch tag ,(recur tag) forms ,(recur-all forms)))
   ((throw tag result)
      `(throw tag ,(recur tag) result-form ,(recur result)))

   ((%normal-call op &rest args)
    `(%call type :normal name ,op args ,(recur-all args)))
   ((%local-call op &rest args)
    `(%call type :local name ,(recur op) args ,(recur-all args)))
   ((%setf-call op &rest args)
    `(%call type :setf name ,op args ,(recur-all args)))

   ((%compilation-unit &rest lambdas)
    `(%compilation-unit lambdas ,(recur-all lambdas)))

  ((%asm &rest forms)
   (labels ((recur-%asm (ops)
              (loop for i in ops
                 when (eq (car i) :@)
                 collect `(:@ ,(recur (second i)) ,@(cddr i))
                 else when (eq (car i) :%push-arglist)
                 collect `(:%push-arglist
                           ,@(recur-%asm (cdr i)))
                 else when (and (consp i) (eq (car i) :@kill))
                 collect `(:@kill ,(cdr (lexenv-get-variable-binding
                                         (second i))))
                 else collect i)))
     `(%asm forms ,(recur-%asm forms))))

   ((declare &rest declarations)
    '(quote value nil))

   ((progn &body body)
    `(progn body ,(recur-all body)))
   ((if a b &optional c)
    `(if condition ,(recur a) then ,(recur b) else ,(recur c)))

   ((unwind-protect protected-form &rest cleanup-forms)
    `(unwind-protect protected ,(recur protected-form)
                     cleanup ,(recur-all cleanup-forms)))

   ((quote form)
    `(quote value ,form))

   ;; expand macros,macrolets, fake accessors
   (t
    (destructuring-bind (operator &rest args) whole
      (let ((binding (lexenv-get-function-binding operator))
            (cmacro (find-swf-cmacro-function operator))
            (macro (find-swf-macro-function operator))
            (accessor (find-swf-accessor operator))
            (temp))
        (cond
          ((and (symbolp operator) (special-operator-p operator))
           (super whole))
          ((and (consp operator) (eq (car operator) 'lambda))
           (recur `(funcall (function ,operator) ,@args)))
          ;; expand local macros
          ((and (consp binding) (eq (car binding) :macro))
           (recur (funcall (cdr binding) args)))
          ;; mark local function calls
          ((and (consp binding) (eq (car binding) :function))
           `(%call type :local
                   name ,(recur `(%local-ref ,(second binding)))
                   args ,(recur-all args)))
          ;; compiler macros
          ;; fixme: add an environment param to compile-macro expansion
          ((and cmacro
                ;; todo: check not declared notinline...
                (not (eq (setf temp (funcall cmacro whole nil))
                         whole)))
           (recur temp))
          ;; normal macros
          ;; fixme: add an environment param to macroexpansion
          (macro
           (recur (funcall macro whole nil)))

          ;; special case SETF until macro can handle it...
          ((member operator '(setf %setf))
           (if (> (length args) 2)
               (recur `(progn ,@(loop for (var val) on args by #'cddr
                                      collect `(setf ,var ,val))))
               (if (consp (car args))
                   (let* ((sym `(setf ,(caar args)))
                          (setf-fun (lexenv-get-function-binding sym))
                          (setf-accessor (find-swf-accessor (caar args))))
                     (cond
                       (setf-fun `(%call type :local
                                         name ,(recur `(%local-ref
                                                        ,(second setf-fun)))
                                         args (,(recur (second args))
                                                ,@(recur-all (cdar args)))))
                       (setf-accessor `(%asm
                                        forms ((:@ ,(recur (second args)))
                                               (:dup)
                                               (:@ ,(recur (cadar args)))
                                               (:swap)
                                               (:set-property ,setf-accessor))))
                       (t `(%call type :setf
                                  name ,(caar args)
                                  args (,(recur (second args))
                                         ,@(recur-all (cdar args)))))))
                   (recur `(setq ,@args)))))

          ;; expand fake accessors
          (accessor
           (if (consp accessor)
               (recur `(%get-lex-property-static ,(second accessor) ,(first accessor)))
               (recur `(slot-value ,@args ,accessor))))

          ;; todo: known functions (cl:foo, etc)/inlining

          ;; wrap anything else in %normal-call
          (t `(%call type :normal name ,operator args ,(recur-all args)))))))))
