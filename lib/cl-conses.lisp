(in-package #:avm2-compiler)

;;; implement lower level functions from conses dictionary
;;;
;;; not all match CL semantics very closely yet...

;;; conses dictionary (14.2)
;;;
;;; not sure what best internal rep for conses is,
;;;  could use anonymous object
;;;  2 element array
;;;  instances of named class
;;;  ?
;;;
;;;  named class is probably easiest to recognize for type checking
;;;    so trying that first
;;;  anon object with car and cdr properties might also be nice, and
;;;    just allow any object with those to be used as a 'cons', but
;;;    wouldn't match CL sematics very well
(let ((*symbol-table* *cl-symbol-table*))

  (c3* (gensym)

    (defun cons (a b)
      (%asm (:find-property-strict cons-type)
            (:@ a)
            (:@ b)
            (:construct-prop cons-type 2)))

    (defun consp (a)
      (%typep a cons-type))

    (defun atom (object)
      (if (consp object) nil t))

    (defun %type-error (fun arg)
      (%error (+ "type-error: unknown type in " fun ":" (%type-of arg))))

    (defun car (a)
      (if (eq a :null)
          :null
          (if (consp a)
              (%asm (:@ a cons-type)
                    (:get-property %car))
              (%type-error "CAR" a))))

    (defun cdr (a)
      (if (eq a :null)
          :null
          (if (consp a)
              (%asm (:@ a cons-type)
                    (:get-property %cdr))
              (%type-error "CDR" a))))


    (defmacro rplaca (cons object)
      (let ((temp (gensym "RPLACA-TEMP-")))
        `(let ((,temp ,cons))
           (progn
             (unless (consp ,temp)
               (%type-error "RPLACA" ,temp))
             (setf ( %car ,temp) ,object)
             ,temp))))

    (defmacro rplacd (cons object)
      (let ((temp (gensym "REPLACD-TEMP-")))
        `(let ((,temp ,cons))
           (progn
             (unless (consp ,temp)
               (%type-error "RPLACD" ,temp))
             (setf (%cdr ,temp) ,object)
             ,temp))))


    (defun caar (x) (car (car x)))
    (defun cadr (x) (car (cdr x)))
    (defun cdar (x) (cdr (car x)))
    (defun cddr (x) (cdr (cdr x)))
    (defun caaar (x) (car (car (car x))))
    (defun caadr (x) (car (car (cdr x))))
    (defun cadar (x) (car (cdr (car x))))
    (defun caddr (x) (car (cdr (cdr x))))
    (defun cdaar (x) (cdr (car (car x))))
    (defun cdadr (x) (cdr (car (cdr x))))
    (defun cddar (x) (cdr (cdr (car x))))
    (defun cdddr (x) (cdr (cdr (cdr x))))
    (defun caaaar (x) (car (car (car (car x)))))
    (defun caaadr (x) (car (car (car (cdr x)))))
    (defun caadar (x) (car (car (cdr (car x)))))
    (defun caaddr (x) (car (car (cdr (cdr x)))))
    (defun cadaar (x) (car (cdr (car (car x)))))
    (defun cadadr (x) (car (cdr (car (cdr x)))))
    (defun caddar (x) (car (cdr (cdr (car x)))))
    (defun cadddr (x) (car (cdr (cdr (cdr x)))))
    (defun cdaaar (x) (cdr (car (car (car x)))))
    (defun cdaadr (x) (cdr (car (car (cdr x)))))
    (defun cdadar (x) (cdr (car (cdr (car x)))))
    (defun cdaddr (x) (cdr (car (cdr (cdr x)))))
    (defun cddaar (x) (cdr (cdr (car (car x)))))
    (defun cddadr (x) (cdr (cdr (car (cdr x)))))
    (defun cdddar (x) (cdr (cdr (cdr (car x)))))
    (defun cddddr (x) (cdr (cdr (cdr (cdr x)))))


    (defun copy-tree (tree)
      (if (consp tree)
          (cons (copy-tree (car tree)) (copy-tree (cdr tree)))
          tree))

    ;; fixme: implement pop according to spec
    (defmacro pop (a)
      (let ((temp (gensym "POP-TEMP-")))
        `(progn
           (%asm (:comment "pop") (:push-null))
           (let ((,temp ,a))
             (prog1
                 (car ,temp)
               (setf ,a (cdr ,temp)))))))

    ;; fixme: implement PUSH according to spec
    (defmacro push (item place)
      (let ((temp (gensym "PUSH-TEMP-")))
        `(progn
           (let ((,temp ,place))
             (setf ,place (cons ,item ,temp))))))


    (defun first (list) (car list))
    (defun second (list) (car (cdr list)))
    (defun third (list) (car (cddr list)))
    (defun fourth (list) (car (cdddr list)))
    (defun fifth (list) (car (cddddr list)))
    (defun sixth (list) (car (cdr (cddddr list))))
    (defun seventh (list) (car (cddr (cddddr list))))
    (defun eighth (list) (car (cdddr (cddddr list))))
    (defun ninth (list) (car (cddddr (cddddr list))))
    (defun tenth (list) (car (cdr (cddddr (cddddr list)))))


    (defun endp (a)
      (if (eq a nil)
          t
          (if (consp a)
              nil
              (%type-error "ENDP" a))))

    (defun null (a)
      (eq a nil))



    #+nil
    (dump-defun-asm ()
      (nconc (cons 1 2) (cons 3 4)))

    #+nil
    (format t "~{~S~%~}"
            (avm2-asm::avm2-disassemble
             (avm2-asm::code
              (avm2-asm::with-assembler-context
                (avm2-asm::assemble-method-body
                 (dump-defun-asm (obj)
                   (let ((sum 0))
                     (dolist (a  obj)
                       (incf sum a))))
                 ) ) )))
    ))