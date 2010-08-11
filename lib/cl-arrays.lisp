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

  (c3* (gensym)

    (defclass-swf not-simple-array-type (flash:object)
      (%dimensions-array
       %adjustable-p
       %fill-pointer
       %displaced-to
       %displaced-offset)
      (:fake-accessors t)
      (:constructor (dimensions adjustable fill-pointer
                     displaced-to displaced-offset)
       (setf (%dimensions-array this) dimensions)
       (setf (%adjustable-p this) adjustable)
       (setf (%fill-pointer this) fill-pointer)
       (setf (%displaced-to this) displaced-to)
       (setf (%displaced-offset this) displaced-offset)))


    (defun %make-simple-array (size)
      (%new- flash:Array size))

    (defun %make-simple-array-with-element (size initial-element)
      (let ((a (%new- flash:Array size)))
        (dotimes (i size a)
          (%set-aref-1 a i initial-element))))

    (defun %array-row-major-index (array subscripts)
      (let ((dims (%dimensions-array array))
            (index 0))
        (unless (= (length subscripts) (length dims))
          (ftrace (+ "dims=" (length dims) " subs=" (length subscripts)))
          (%error "wrong number of subscripts in array-row-major-index"))
        (dotimes (i (length subscripts) index)
          (setf index (* index (%aref-1 dims i)))
          (incf index (%aref-1 subscripts i)))))

    (defun array-row-major-index (array &arest subscripts)
      (%array-row-major-index array subscripts))

    (defun %aref-n (array &arest subscripts)
      (%aref-1 (%displaced-to array)
               (+ (%displaced-offset array)
                  (%array-row-major-index array subscripts))))

    (defun %aref-n* (array subscripts)
      (if (%typep array flash:array)
          (%aref-1 array (%aref-1 subscripts 0))
          (%aref-1 (%displaced-to array)
                   (+ (%displaced-offset array)
                      (%array-row-major-index array subscripts)))))

    (defun %setf-aref-n (array subscripts value)
      (if (%typep array flash:array)
          (%set-aref-1 array (%aref-1 subscripts 0) value)
          (%set-aref-1 (%displaced-to array)
                       (+ (%displaced-offset array)
                          (%array-row-major-index array subscripts))
                       value)))

    (defun arrayp (a)
      (or (%typep a flash:array)
          (%typep a not-simple-array-type)))

    ;; make-array in late.lisp



    #+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
           (dump-defun-asm (&arest rest)
             'a))
    #+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
           (dump-defun-asm (&arest rest)
             :foo))
    #+nil(let ((*symbol-table* (make-instance 'symbol-table :inherit (list *cl-symbol-table* *player-symbol-table*))))
           (dump-defun-asm (&arest rest)
             '(1)))
    ))
