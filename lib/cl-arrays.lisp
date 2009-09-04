(in-package #:avm2-compiler)

;;; cl array functions

;; using untyped arrays for now, so don't have the specialized arrays
;; required by the spec


(let ((*symbol-table* *cl-symbol-table*))
  #+nil
  (swf-defmacro aref (array &rest subscripts)
                (let ((a (gensym)))
                  (if (= 1 (length subscripts))
                      `(let ((,a ,array))
                         ;; fixme: probably should check for our
                         ;; special type here instead of just array,
                         ;; since some other types might act like arrays too
                         (if (%typep ,a flash:array)
                             (%aref-1 ,a ,(first subscripts))
                             (if (%typep ,a flash:string)
                                 (flash:char-at ,a 1)
                                 (%aref-n ,array ,@subscripts))))
                      `(%aref-n ,array ,@subscripts))))

  (def-swf-class not-simple-array-type "not-simple-array" flash:object
                 (%dimensions-array
                  %adjustable-p
                  %fill-pointer
                  %displaced-to
                  %displaced-offset)
                 ((dimensions adjustable fill-pointer displaced-to displaced-offset)
                  (%set-property this %dimensions-array dimensions)
                  (%set-property this %adjustable-p adjustable)
                  (%set-property this %fill-pointer fill-pointer)
                  (%set-property this %displaced-to displaced-to)
                  (%set-property this %displaced-offset displaced-offset)))


  (swf-defmemfun %make-simple-array (size)
    (%new* flash:Array size))

  (swf-defmemfun %make-simple-array-with-element (size initial-element)
    (let ((a (%new* flash:Array size)))
      (dotimes (i size a)
        (%set-aref a i initial-element))))

  (swf-defmemfun %array-row-major-index (array subscripts)
    (let ((dims (%dimensions-array array))
          (index 0))
      (unless (= (length subscripts) (length dims))
        (%error "wrong number of subscripts in array-row-major-index"))
      (dotimes (i (length subscripts) index)
        (setf index (* index (%aref-1 dims i)))
        (incf index (%aref-1 subscripts i)))))

  (swf-defmemfun array-row-major-index (array &arest subscripts)
    (%array-row-major-index array subscripts))

  (swf-defmemfun %aref-n (array &arest subscripts)
    (%aref-1 (%displaced-to array)
             (+ (%displaced-offset array)
                (%array-row-major-index array subscripts))))

  #+nil(swf-defmemfun make-array (dimensions &key element-type initial-element initial-contents adjustable fill-pointer displaced-to displaced-index-offset)
    (if (or adjustable fill-pointer displaced-index-offset displaced-to (> (list-length dimensions) 1))
        ;; non-simple array
        (let ((linear-size (car dimensions)))
          (dolist (dim (cdr dimensions))
            (setf linear-size (* linear-size dim)))
          (unless displaced-to
            (setf displaced-to (%make-simple-array linear-size))))
)
))


#+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
   (dump-defun-asm (&arest rest)
     'a))
#+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
   (dump-defun-asm (&arest rest)
     :foo))
#+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
   (dump-defun-asm (&arest rest)
     '(1)))
