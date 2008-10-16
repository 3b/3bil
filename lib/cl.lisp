(in-package #:as3-compiler)

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

)