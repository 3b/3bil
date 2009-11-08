(in-package #:avm2-compiler)

;;; implement functions/macros from CL package
;;;
;;; most probably don't match CL semantics very closely yet...


;;; define this here for now instead of special-forms.lisp, as it needs %flash
#+-
(defmethod %quote ((object symbol))
  ;; fixme: need to intern symbols somewhere, this doesn't make symbols that are EQ (though they are EQL with current implementation, which probably means EQL should be EQUAL)
  (scompile `(%new* flash:q-name
                    ,(package-name (symbol-package object))
                    ,(symbol-name object))))


(let ((*symbol-table* *cl-symbol-table*))

  (c3* (gensym)

      (defmacro defun (name args &body body)
        `(progn
           ,(if (and (listp name) (eq (car name) 'setf))
                `(%named-lambda ,name
                       (:anonymous t
                                   :trait ,(second name)
                                   :class-name setf-namespace-type
                                   :class-static t)
                     ,args
                   (block ,(second name) ,@body))
                `(%named-lambda ,name
                       (:trait-type :function :trait ,name)
                     ,args (block ,name ,@body)))
           ',name))



      (defmacro return (value)
        `(return-from nil ,value))


      (defmacro setf (&rest args)
        `(progn
           ,@(loop for (var value) on args by #'cddr
                collect `(%setf-1 ,var ,value))))

      (defmacro psetf (&rest args)
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
      (defmacro setq (&rest args)
        (loop for (var nil) on args by #'cddr
           unless (atom var)
           do (error "variable name is not a symbol in SETQ: ~s" var))
        `(setf ,@args))

      (defmacro psetq (&rest args)
        (loop for (var nil) on args by #'cddr
           unless (atom var)
           do (error "variable name is not a symbol in PSETQ: ~s" var))
        `(psetf ,@args))

      (defun random (a)
        ;;todo: return int for int args
        ;;fixme: don't seem to be able to set seeds, so can't do random-state arg
        (* (flash:math.random) a))

      (defun 1- (a)
        (- a 1))
      (defun 1+ (a)
        (+ a 1))

      (defun floor (number)
        ;; todo implement optional divisor arg (need multiple values)
        (flash:math.floor number))

      (defun cos (radians)
        (flash:math.cos radians))
      (defun sin (radians)
        (flash:math.sin radians))
      (defun tan (radians)
        (flash:math.tan radians))

      (defun min (&arest numbers)
        (%apply (function flash:math.min) nil numbers))

      (defun max (&arest numbers)
        (%apply (function flash:math.max) nil numbers))

      (defun eq (a b)
        (%asm (:@ a)
              (:@ b)
              (:strict-equals)))

      (defun eql (a b)
        (%asm (:@ a)
              (:@ b)
              ;; not quite right, since it compares all numbers by value
              ;; also compares strings, but since strings are immutable,
              ;; that is arguably OK
              (:strict-equals)))

      (defun %equals (a b)
        (%asm (:@ a)
              (:@ b)
              ;;even less correct than EQL, since it converts
              ;;string<->number<->Boolean, and a few other things
              (:equals)))

      (defun %t-or-nil (x)
        (if x t nil))

      ;; equal defined later, so it can use LOOP

      #+nil  (swf-defmemfun error (datum &rest args) )

      #+nil  (swf-defmemfun typep (object type)
               (%typep object type))

      (defmacro let* (bindings &body body)
        `(let (,(car bindings))
           ,@(if (cdr bindings)
                 `((let* ,(cdr bindings) ,@body))
                 body)))


;;; from sicl:
;;; sicl-conditionals.lisp: OR AND WHEN UNLESS COND CASE TYPECASE
;;; sicl-iteration.lisp: DOLIST DOTIMES

      ;; temporary hack until SETF is implemented


      (defmacro incf (place &optional (delta 1))
        `(setf ,place (+ ,place ,delta)))
      (defmacro decf (place &optional (delta 1))
        `(setf ,place (- ,place ,delta)))

      (defun zerop (x)
        (eql x 0))

      (defun vector (&arest objects)
        objects)

      ;; fixme: figure out symbol stuff so this can be a function
      (defmacro slot-value (object slot)
        (let ((slot-name (if (and (consp slot) (eq 'quote (car slot)))
                             (second slot)
                             slot)))
          `(%asm (:@ ,object)
                 (:get-property , (or (find-swf-property slot-name) slot-name)))))


      (defmacro prog1 (value-form &body body)
        (let ((temp (gensym)))
          `(let ((,temp ,value-form))
             ,@body
             ,temp)))


      #+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
             (dump-defun-asm (&arest rest)
               (%apply (function flash:max) nil rest)))
      ))