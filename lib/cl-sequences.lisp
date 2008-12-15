(in-package #:avm2-compiler)

;;; CL sequences functions

(let ((*symbol-table* *cl-symbol-table*))

  ;;; fixme: handle strings in sequence functions
  ;; reverse string = (%flash:join (%flash:reverse (%flash:split str "")) "")?
  (swf-defmemfun reverse (sequence)
    (typecase sequence
      (cons-type (%reverse-list sequence))
      (%flash:string (%flash:join (%flash:reverse (%flash:split sequence "")) ""))
      (%flash:array (%flash:reverse (%flash:concat sequence)))))

  (swf-defmemfun nreverse (sequence)
    (if (%typep sequence %flash:array)
        (%flash:reverse sequence)
        (reverse sequence))) ;; fixme: add in-place list reverse


  (swf-defmemfun length (sequence)
    (if (listp sequence)
        (list-length sequence)
        ;; fixme: should probably be %flash:length instead of :length
        (%get-property sequence :length)))



)