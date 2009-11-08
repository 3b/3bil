(in-package #:avm2-compiler)

;;; CL sequences functions

(let ((*symbol-table* *cl-symbol-table*))

  (c3* (gensym)
;;; fixme: handle strings in sequence functions
    ;; reverse string = (flash:join (flash:reverse (flash:split str "")) "")?
    (defun reverse (sequence)
      (typecase sequence
        (cons-type (%reverse-list sequence))
        (flash:string (flash:join (flash:reverse (flash:split sequence "")) ""))
        (flash:array (flash:reverse (flash:concat sequence)))))

    (defun nreverse (sequence)
      (if (%typep sequence flash:array)
          (flash:reverse sequence)
          (reverse sequence))) ;; fixme: add in-place list reverse

    #++
    (swf-defmemfun length (sequence)
      (if (listp sequence)
          (list-length sequence)
          ;; fixme: should probably be flash:length instead of :length
          (%get-property sequence :length)))

    (defun delete (item sequence)
      ;; &key from-end test test-not start end count key
      (if (%typep sequence flash:array)
          (%error "array DELETE not done yet...")
          ;;(flash:filter (lambda (x) (eql x item)) sequence)
          ;; fixme: avoid this temporary
          (let ((temp (cons nil sequence)))
            (do* ((a temp)
                  (next (cdr a) (cdr a)))
                 ((null next) (cdr temp))
              (if (eql item (car next))
                  (rplacd a (cdr next))
                  (setf a next))))))

    ))