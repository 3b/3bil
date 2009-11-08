(in-package #:avm2-compiler)

;; random stuff that uses LOOP


(let ((*symbol-table* *cl-symbol-table*))
  (c3* (gensym)

   (defun equal (a b)
     ;;(ftrace (+ "= " a " " b))
     (%t-or-nil
      (cond
        ((consp a)
         (and (consp b)
              (loop
                 for (i . r) on a
                 for (j . r2) on b
                 always (equal i j)
                 always (or (and r r2) (and (not r) (not r2)))
                 finally (progn
                           ;;(ftrace (s+ " === " i " . " r " / " j ". " r2))
                           (return (or (and r r2 (equal r r2))
                                       (and (null r) (null r2))))))))
        ((consp b) nil)
        ((arrayp a)
         (and (arrayp b)
              (= (length a) (length b))
              (loop for i across a
                 for j across b
                 always (equal i j))))
        ;; todo: (equal false nil) => ?
        (t (%equals a b)))))))
