(in-package #:avm2-compiler)

;;; fake multiple-values support, until the compiler is smart enough to
;;; handle the general case

;;; we implement multiple-values as a object of a specific type,
;;; containing an array of values, from which m-v-b etc can extract
;;; values as needed. Cases where multiple values should be reduced to
;;; a single value aren't handled at all, so mainly only intended for
;;; use with things like get-setf-expansion and decode-universal-time
;;; which are almost always used for more than just the first value.

;;; eventually, will need switch to either some way to handle
;;; automatically coercing the m-v object to a single value if
;;; possible, or teach the compiler to distinguish between single and
;;; m-v functions, and add code to extract the single value from
;;; normal calls to m-v functions.
;;; (alternately, define single and multiple value versions of m-v functions
;;;  and call the correct one, if other methods prove too expensive)



(let ((*symbol-table* *cl-symbol-table*))
  (c3* (gensym)
    (defclass-swf %multiple-value-return-type (flash:object)
      (%values)
      (:fake-accessors t)
      (:constructor (values)
        (setf (%values this) values)))

    (defun values (&arest values)
      (%new- %multiple-value-return-type values))

    (defun values-list (list)
      (let* ((l (list-length list))
             (a (%new- flash:array l)))
        (%dotimes (i l)
          (%set-aref-1 a i (pop list)))
        (%new- %multiple-value-return-type a)))

    (defmacro multiple-value-bind ((&rest vars) values-form &body body)
      (let ((vf (gensym))
            (va (gensym))
            (l (gensym)))
        `(let* ((,vf ,values-form)
                (,va (if (%typep ,vf %multiple-value-return-type)
                         (%values ,vf)
                         (%asm (:@ ,vf) (:new-array 1))))
                (,l (%length ,va)))
           (let (,@(loop for var in vars
                      for i from 0
                      collect `(,var (if (< ,i ,l)
                                         (%aref-1 ,va ,i)
                                         nil))))
             ,@body))))

    (defmacro multiple-value-list (values-form)
      `(let* ((vf ,values-form)
              (va (if (%typep vf %multiple-value-return-type)
                      (%values vf)
                      (%asm (:@ vf) (:new-array 1)))))
         (loop for i across va
            collect i)))

    ;; special operator multiple-value-call
    #++(defmacro multiple-value-call (function forms)
         ...
         )

    ;; todo: (setf values)
    ))
