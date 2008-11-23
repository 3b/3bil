(in-package #:avm2-compiler)

;;; implement functions/macros from CL package
;;;
;;; most probably don't match CL semantics very closely yet...

(let ((*symbol-table* *cl-symbol-table*))

  (swf-defmemfun random (a)
    ;;todo: return int for int args
    ;;fixme: don't seem to be able to set seeds, so can't do random-state arg
    (* (flash::math.random) a))

  (swf-defmemfun 1- (a)
    (- a 1))

  (swf-defmemfun floor (number)
    ;; todo implement optional divisor arg (need multiple values)
    (flash::math.floor number))

  #+nil(swf-defmemfun max (&rest numbers)
    ;; fixme: need to figure out how to implement this...
         (apply 'flash::math.max numbers))

  #+nil(swf-defmemfun min (&rest numbers)
    ;; fixme: need to figure out how to implement this...
         (apply 'flash::math.min numbers))


  (swf-defmemfun cos (radians)
    (flash::math.cos radians))
  (swf-defmemfun sin (radians)
    (flash::math.sin radians))
  (swf-defmemfun tan (radians)
    (flash::math.tan radians))

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
    `(%set-local ,place (+ ,place ,delta))))