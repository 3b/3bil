(in-package #:avm2-compiler)

;; random stuff that uses LOOP


(let ((*symbol-table* *cl-symbol-table*))
  (c3* (gensym)
    #++
    (defun member (item list #++ &key #++ key #++ test #++ test-not)
      (loop for tail on list
         do (when (eql item (car tail))
              (return-from member tail))))
    
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
                           (return (equal r r2))))))
        ((consp b) nil)
        ((and (%typep a flash:string) (%typep b flash:string))
         (string= a b))
        ((arrayp a)
         (and (arrayp b)
              (= (length a) (length b))
              (loop for i across a
                 for j across b
                 always (equal i j))))
        ;; todo: (equal false nil) => ?
        (t (%equals a b)))))

   (defun equalp (a b)
     ;;(ftrace (+ "= " a " " b))
     (%t-or-nil
      (cond
        ((consp a)
         (and (consp b)
              (loop
                 for (i . r) on a
                 for (j . r2) on b
                 always (equalp i j)
                 always (or (and r r2) (and (not r) (not r2)))
                 finally (progn
                           ;;(ftrace (s+ " === " i " . " r " / " j ". " r2))
                           (return (equalp r r2))))))
        ((consp b) nil)
        ((and (%typep a flash:string) (%typep b flash:string))
         (string-equal a b))
        ((arrayp a)
         (and (arrayp b)
              (= (length a) (length b))
              (loop for i across a
                 for j across b
                 always (equalp i j))))
        ;; todo: (equal false nil) => ?
        (t (%equals a b)))))


    (defun %list->vector (l)
      (let ((a (%make-simple-array (list-length l))))
        (loop for i from 0
           for el in l
           do (%set-aref-1 a i el))
        a))

    (defun make-array (dimensions
                       &key element-type
                       initial-element initial-contents
                       adjustable fill-pointer
                       displaced-to displaced-index-offset)
      ;; todo: element-type
      ;; todo: fill-pointer/adjustable stuff?
      ;; (not sure those need anything here beyond setting the flag in object?)
      (let ((dimensions (if (consp dimensions) dimensions (list dimensions))))
        (cond
          ((or adjustable fill-pointer displaced-index-offset displaced-to (> (list-length dimensions) 1))
           ;; non-simple array
           (let ((linear-size (car dimensions) #++(reduce #'* dimensions)))
             (loop for i in (cdr dimensions)
                do (setf linear-size (* linear-size i)))
             ;; can't initialize a displaced array
             (assert (not (and displaced-to
                               (or initial-contents initial-element))))
             (assert (not (and displaced-index-offset (not displaced-to))))
             (unless displaced-to
               (setf displaced-to
                     (if initial-element
                         (%make-simple-array-with-element linear-size
                                                          initial-element)
                         (%make-simple-array linear-size))
                     displaced-index-offset 0)
               (assert (not (and initial-contents initial-element)))
               (when initial-contents
                 (error "initial contents not supported yet in MAKE-ARRAY...")))
             (%new- not-simple-array-type
                    (%list->vector dimensions)
                    adjustable fill-pointer displaced-to displaced-index-offset)))
          (initial-element
           (%make-simple-array-with-element (car dimensions) initial-element))
          ((and initial-contents (%typep initial-contents flash:array))
           (assert (= (car dimensions) (length initial-contents)))
           (let ((a (%make-simple-array (car dimensions))))
             (loop for i from 0
                for el across initial-contents
                do (setf (%aref-1 a i) el))
             a))
          ((and initial-contents (listp initial-contents))
           ;; fixme: don't traverse list twice to check length then copy
           (assert (= (car dimensions) (length initial-contents)))
           (let ((a (%make-simple-array (car dimensions))))
             (loop for i from 0
                for el in initial-contents
                do (setf (%aref-1 a i) el))
             a))
          (initial-contents
           (error "initial contents not vector or list?"))
          (t (%make-simple-array (car dimensions))))))

    (defun apply (x &arest args)
      ;; flash 'pop' removes from end of an array
      (let ((l (flash:pop args)))
        (flash:apply x nil (flash:concat args (%list->vector l)))))

    (defun sort (seq predicate &key key)
      (let* ((seq2 (if (typep seq 'list)
                       (%list->vector seq)
                       seq))
             (sorted (flash:sort seq2 (if key
                                          (lambda (a b)
                                            (let ((ak (funcall key a))
                                                  (bk (funcall key b)))
                                              (if (funcall predicate ak bk)
                                                  -1
                                                  (if (funcall predicate bk ak)
                                                      1
                                                      0))))
                                          (lambda (a b)
                                            (if (funcall predicate a b)
                                                -1
                                                (if (funcall predicate b a)
                                                    1
                                                    0)))))))
        (if (typep seq 'list)
            (loop for i across sorted collect i)
            sorted)))

))
