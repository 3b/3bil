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
  ;; todo: probably should figure out how to make this final/sealed/etc.
  (def-swf-class cons-type "cons" flash:object (%car %cdr)
                 ((a b)
                  (%set-property this %car a)
                  (%set-property this %cdr b)))

  (swf-defmemfun cons (a b)
    (%asm (:find-property-strict cons-type)
          (:@ a)
          (:@ b)
          (:construct-prop cons-type 2)))

  (swf-defmemfun consp (a)
    (%typep a cons-type))

  (swf-defmemfun atom (object)
    (not (consp object)))

  (swf-defmemfun %type-error (fun arg)
    (%error (+ "type-error: unknown type in " fun ":" (%type-of arg))))

  ;;; implementing CAR/CDR as special forms for performance, until
  ;;; compiler macros are available
  (swf-defmemfun car (a)
         (if (eq a :null)
             :null
             (if (consp a)
                 (%asm (:@ a)
                        (:coerce cons-type)
                        (:get-property %car))
                 (%type-error "CAR" a))))

  (swf-defmemfun cdr (a)
         (if (eq a :null)
             :null
             (if (consp a)
                 (%asm (:@ a)
                       (:coerce cons-type)
                       (:get-property %cdr))
                 (%type-error "CDR" a))))


  (swf-defmacro rplaca (cons object)
    (let ((temp (gensym "RPLACA-TEMP-")))
      `(let ((,temp ,cons))
         (progn
           (unless (consp ,temp) (%type-error "RPLACA" ,temp))
           (%set-property ,temp %car ,object)
           ,temp))))

  (swf-defmacro rplacd (cons object)
    (let ((temp (gensym "REPLACD-TEMP-")))
      `(let ((,temp ,cons))
         (progn
           (unless (consp ,temp) (%type-error "RPLACD" ,temp))
           (%set-property ,temp %cdr ,object)
           ,temp))))


  (swf-defmemfun caar (x) (car (car x)))
  (swf-defmemfun cadr (x) (car (cdr x)))
  (swf-defmemfun cdar (x) (cdr (car x)))
  (swf-defmemfun cddr (x) (cdr (cdr x)))
  (swf-defmemfun caaar (x) (car (car (car x))))
  (swf-defmemfun caadr (x) (car (car (cdr x))))
  (swf-defmemfun cadar (x) (car (cdr (car x))))
  (swf-defmemfun caddr (x) (car (cdr (cdr x))))
  (swf-defmemfun cdaar (x) (cdr (car (car x))))
  (swf-defmemfun cdadr (x) (cdr (car (cdr x))))
  (swf-defmemfun cddar (x) (cdr (cdr (car x))))
  (swf-defmemfun cdddr (x) (cdr (cdr (cdr x))))
  (swf-defmemfun caaaar (x) (car (car (car (car x)))))
  (swf-defmemfun caaadr (x) (car (car (car (cdr x)))))
  (swf-defmemfun caadar (x) (car (car (cdr (car x)))))
  (swf-defmemfun caaddr (x) (car (car (cdr (cdr x)))))
  (swf-defmemfun cadaar (x) (car (cdr (car (car x)))))
  (swf-defmemfun cadadr (x) (car (cdr (car (cdr x)))))
  (swf-defmemfun caddar (x) (car (cdr (cdr (car x)))))
  (swf-defmemfun cadddr (x) (car (cdr (cdr (cdr x)))))
  (swf-defmemfun cdaaar (x) (cdr (car (car (car x)))))
  (swf-defmemfun cdaadr (x) (cdr (car (car (cdr x)))))
  (swf-defmemfun cdadar (x) (cdr (car (cdr (car x)))))
  (swf-defmemfun cdaddr (x) (cdr (car (cdr (cdr x)))))
  (swf-defmemfun cddaar (x) (cdr (cdr (car (car x)))))
  (swf-defmemfun cddadr (x) (cdr (cdr (car (cdr x)))))
  (swf-defmemfun cdddar (x) (cdr (cdr (cdr (car x)))))
  (swf-defmemfun cddddr (x) (cdr (cdr (cdr (cdr x)))))


  (swf-defmemfun copy-tree (tree)
    (if (consp tree)
        (cons (copy-tree (car tree)) (copy-tree (cdr tree)))
        tree))

  ;; fixme: implement pop according to spec
  (swf-defmacro pop (a)
    (let ((temp (gensym "POP-TEMP-")))
      `(progn
         (%asm (:comment "pop") (:push-null))
         (let ((,temp ,a))
           (prog1
               (car ,temp)
             (setf ,a (cdr ,temp)))))))

  ;; fixme: implement PUSH according to spec
  (swf-defmacro push (item place)
    (let ((temp (gensym "PUSH-TEMP-")))
      `(progn
        (let ((,temp ,place))
          (setf ,place (cons ,item ,temp))))))


  (swf-defmemfun first (list) (car list))
  (swf-defmemfun second (list) (car (cdr list)))
  (swf-defmemfun third (list) (car (cddr list)))
  (swf-defmemfun fourth (list) (car (cdddr list)))
  (swf-defmemfun fifth (list) (car (cddddr list)))
  (swf-defmemfun sixth (list) (car (cdr (cddddr list))))
  (swf-defmemfun seventh (list) (car (cddr (cddddr list))))
  (swf-defmemfun eighth (list) (car (cdddr (cddddr list))))
  (swf-defmemfun ninth (list) (car (cddddr (cddddr list))))
  (swf-defmemfun tenth (list) (car (cdr (cddddr (cddddr list)))))


  (swf-defmemfun endp (a)
    (if (eq a nil)
        t
        (if (consp a)
            nil
            (%type-error "ENDP" a))))

  (swf-defmemfun null (a)
    (eq a nil))

)

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
