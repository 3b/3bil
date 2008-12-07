(in-package #:avm2-compiler)

;;; implement functions/macros from CL package
;;;
;;; most probably don't match CL semantics very closely yet...

(let ((*symbol-table* *cl-symbol-table*))

  (swf-defmacro return (value)
    `(return-from nil ,value))


  ;; partial implementation of setf, only handles setting local vars,
  ;;  so we can start using it while waiting on real implementation
  (swf-defmacro %setf-1 (place value)
    (print (if (and (consp place) (find-swf-property (car place)))
               `(%set-property ,(second place) ,(first place) ,value)
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

  #+nil(swf-defmemfun max (&rest numbers)
    ;; fixme: need to figure out how to implement this...
         (apply 'flash:max numbers))

  #+nil(swf-defmemfun min (&rest numbers)
    ;; fixme: need to figure out how to implement this...
         (apply 'flash:min numbers))


  (swf-defmemfun cos (radians)
    (%flash:cos radians))
  (swf-defmemfun sin (radians)
    (%flash:sin radians))
  (swf-defmemfun tan (radians)
    (%flash:tan radians))

  (swf-defmemfun min (&arest rest)
    (%asm (:get-lex "Math")
          (:get-property "min")
          (:push-null)
          (:get-local 1)
          (:call-property "apply" 2)))

  (swf-defmemfun max (&arest rest)
    (%asm (:get-lex "Math")
          (:get-property "max")
          (:push-null)
          (:get-local 1)
          (:call-property "apply" 2)))

  (swf-defmemfun eq (a b)
    (%asm (:get-local-1)
          (:get-local-2)
          (:strict-equals)))

  (swf-defmemfun eql (a b)
    (%asm (:get-local-1)
          (:get-local-2)
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
             (:get-property , (find-swf-property slot-name)))))
)