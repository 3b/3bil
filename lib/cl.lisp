(in-package #:avm2-compiler)

;;; implement functions/macros from CL package
;;;
;;; most probably don't match CL semantics very closely yet...


;;; define this here for now instead of special-forms.lisp, as it needs %flash
(defmethod %quote ((object symbol))
  ;; fixme: need to intern symbols somewhere, this doesn't make symbols that are EQ (though they are EQL with current implementation, which probably means EQL should be EQUAL)
  (scompile `(%new* %flash:q-name
                    ,(package-name (symbol-package object))
                    ,(symbol-name object))))


(let ((*symbol-table* *cl-symbol-table*))

  (swf-defmacro %apply (function this-arg rest-array)
    `(%flash:apply ,function ,this-arg ,rest-array))

  (swf-defmacro %funcall (function this-arg &rest rest)
    `(%flash:call ,function ,this-arg ,@rest))

  (swf-defmacro return (value)
    `(return-from nil ,value))


  ;; partial implementation of setf, only handles setting local vars,
  ;;  so we can start using it while waiting on real implementation
  ;; adding hack for (setf foo) functions also (doesn't work yet though)
  (swf-defmacro %setf-1 (place value)
    (if *new-compiler*
        `(%setf ,place ,value)
        (if (consp place)
            (cond
              ((find-swf-property (first place))
               `(%set-property ,(second place) ,(first place) ,value))
              (t `((setf ,(first place)) ,(second place) ,(first place) ,value)))
            `(%set-local ,place ,value))))

  (swf-defmacro setf (&rest args)
    `(progn
       ,@(loop for (var value) on args by #'cddr
               collect `(%setf-1 ,var ,value))))

  ;; partial implementation of psetf, only handles setting local vars,
  ;;  so we can start using it while waiting on real implementation
  (swf-defmacro psetf (&rest args)
    (let ((temps (loop repeat (/ (length args) 2)
                    collect (gensym))))
      `(let (,@(loop
                  for temp in temps
                  for (nil value) on args by #'cddr
                  collect `(,temp ,value)))
         ,@(loop
              for temp in temps
              for (var nil) on args by #'cddr
              collect `(setf ,var ,temp)))))

  ;; setq and psetq just calling setf/psetf for now, after checking vars
  (swf-defmacro setq (&rest args)
    (loop for (var nil) on args by #'cddr
       unless (atom var)
       do (error "variable name is not a symbol in SETQ: ~s" var))
    `(setf ,@args))

  (swf-defmacro psetq (&rest args)
    (loop for (var nil) on args by #'cddr
       unless (atom var)
       do (error "variable name is not a symbol in PSETQ: ~s" var))
    `(psetf ,@args))

  (swf-defmemfun random (a)
    ;;todo: return int for int args
    ;;fixme: don't seem to be able to set seeds, so can't do random-state arg
    (* (%flash:random) a))

  (swf-defmemfun 1- (a)
    (- a 1))
  (swf-defmemfun 1+ (a)
    (+ a 1))

  (swf-defmemfun floor (number)
    ;; todo implement optional divisor arg (need multiple values)
    (%flash:floor number))

  (swf-defmemfun cos (radians)
    (%flash:cos radians))
  (swf-defmemfun sin (radians)
    (%flash:sin radians))
  (swf-defmemfun tan (radians)
    (%flash:tan radians))

  (swf-defmemfun min (&arest numbers)
    (%apply (function %flash:min) nil numbers))

  (swf-defmemfun max (&arest numbers)
    (%apply (function %flash:max) nil numbers))

  (swf-defmemfun eq (a b)
    (%asm (:get-local-1)
          (:get-local-2)
          (:strict-equals)))

  (swf-defmemfun eql (a b)
    (%asm (:get-local-1)
          (:get-local-2)
          ;; not quite right, since it compares all numbers by value
          ;; also compares strings, but since strings are immutable,
          ;; that is arguably OK
          (:strict-equals)))

  (swf-defmemfun equal (a b)
    (%asm (:get-local-1)
          (:get-local-2)
          ;;even less correct than EQL, since it converts
          ;;string<->number<->Boolean, and a few other things
          (:equals)))

  #+nil  (swf-defmemfun error (datum &rest args) )

  #+nil  (swf-defmemfun typep (object type)
    (%typep object type))

  (swf-defmacro let* (bindings &body body)
    `(let (,(car bindings))
       ,@(if (cdr bindings)
             `((let* ,(cdr bindings) ,@body))
             body)))


;;; from sicl:
;;; sicl-conditionals.lisp: OR AND WHEN UNLESS COND CASE TYPECASE
;;; sicl-iteration.lisp: DOLIST DOTIMES

;; temporary hack until SETF is implemented


  (swf-defmacro incf (place &optional (delta 1))
    `(setf ,place (+ ,place ,delta)))

  (swf-defmemfun zerop (x)
    (eql x 0))

  (swf-defmemfun vector (&arest objects)
    objects)

  ;; fixme: figure out symbol stuff so this can be a function
  (swf-defmacro slot-value (object slot)
    (let ((slot-name (if (and (consp slot) (eq 'quote (car slot)))
                         (second slot)
                         slot)))
      `(%asm (:@ ,object)
             (:get-property , (or (find-swf-property slot-name) slot-name)))))


  (swf-defmacro prog1 (value-form &body body)
    (let ((temp (gensym)))
      `(let ((,temp ,value-form))
         ,@body
         ,temp)))

  ;; temporary hacks for new compiler
  (swf-defmacro defun (name args &body body)
    `(%named-lambda ,name () ,args (block ,name ,@body)))

  (swf-defmacro defmacro (name args &body body)
    (let ((form (gensym))
          (environment (gensym)))
      (add-swf-macro-function
       name
       (coerce `(lambda (,form ,environment)
         (declare (ignore ,environment))
         (destructuring-bind ,args (cdr ,form)
            ,@body)) 'function)))
    nil)

)

#+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
   (dump-defun-asm (&arest rest)
     (%apply (function %flash:max) nil rest)))
