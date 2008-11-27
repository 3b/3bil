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
  (def-swf-class cons-type "cons" object (%car %cdr)
                 ((a b)
                  (%set-property this %car a)
                  (%set-property this %cdr b)))

  (swf-defmemfun cons (a b)
    (%asm (:find-property-strict cons-type)
          (:get-local-1)
          (:get-local-2)
          (:construct-prop cons-type 2)))

#||  (def-swf-class cons-type "cons" object (%car %cdr)
                 (()
                  ))

  (swf-defmemfun cons (a b)
    (%asm (:find-property-strict cons-type)
          (:construct-prop cons-type 0)
          (:dup)
          (:get-local-1)
          (:set-property %car)
          (:dup)
          (:get-local-2)
          (:set-property %cdr)
          ))
||#
  (swf-defmemfun consp (a)
    (%typep a cons-type))

  (swf-defun atom (object)
    (not (consp object)))

  (swf-defun %type-error (fun arg)
    (%error (+ "type-error: unknown type in " fun ":" (%type-of arg))))

  #+nil(swf-defmemfun car (a)
    (if (eq a :null)
        :null
        (if (consp a)
            (%asm (:get-local-1)
                  (:get-property %car))
            (%type-error "CAR" a))))

  #+nil(swf-defmemfun cdr (a)
    (if (eq a :null)
        :null
        (if (consp a)
            (%asm (:get-local-1)
                  (:get-property %cdr))
            (%type-error "CDR" a))))


  (swf-defmemfun car (a)
    (if (eq a :null)
        :null
        (%asm (:get-local-1)
              (:get-property %car))))

  (swf-defmemfun cdr (a)
    (if (eq a :null)
        :null
        (%asm (:get-local-1)
              (:get-property %cdr))))


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


  (swf-defun caar (x) (car (car x)))
  (swf-defun cadr (x) (car (cdr x)))
  (swf-defun cdar (x) (cdr (car x)))
  (swf-defun cddr (x) (cdr (cdr x)))
  (swf-defun caaar (x) (car (car (car x))))
  (swf-defun caadr (x) (car (car (cdr x))))
  (swf-defun cadar (x) (car (cdr (car x))))
  (swf-defun caddr (x) (car (cdr (cdr x))))
  (swf-defun cdaar (x) (cdr (car (car x))))
  (swf-defun cdadr (x) (cdr (car (cdr x))))
  (swf-defun cddar (x) (cdr (cdr (car x))))
  (swf-defun cdddr (x) (cdr (cdr (cdr x))))
  (swf-defun caaaar (x) (car (car (car (car x)))))
  (swf-defun caaadr (x) (car (car (car (cdr x)))))
  (swf-defun caadar (x) (car (car (cdr (car x)))))
  (swf-defun caaddr (x) (car (car (cdr (cdr x)))))
  (swf-defun cadaar (x) (car (cdr (car (car x)))))
  (swf-defun cadadr (x) (car (cdr (car (cdr x)))))
  (swf-defun caddar (x) (car (cdr (cdr (car x)))))
  (swf-defun cadddr (x) (car (cdr (cdr (cdr x)))))
  (swf-defun cdaaar (x) (cdr (car (car (car x)))))
  (swf-defun cdaadr (x) (cdr (car (car (cdr x)))))
  (swf-defun cdadar (x) (cdr (car (cdr (car x)))))
  (swf-defun cdaddr (x) (cdr (car (cdr (cdr x)))))
  (swf-defun cddaar (x) (cdr (cdr (car (car x)))))
  (swf-defun cddadr (x) (cdr (cdr (car (cdr x)))))
  (swf-defun cdddar (x) (cdr (cdr (cdr (car x)))))
  (swf-defun cddddr (x) (cdr (cdr (cdr (cdr x)))))


  (swf-defun copy-tree (tree)
    (if (consp tree)
        (cons (copy-tree (car tree)) (copy-tree (cdr tree)))
        tree))

  (swf-defmemfun listp (a)
    (or (%typep a cons-type) (eq a nil)))

  (swf-defmemfun endp (a)
    (if (eq a nil)
        t
        (if (consp a)
            nil
            (%type-error "ENDP" a))))

  ;; fixme: implement pop according to spec
  (swf-defmacro pop (a)
    (let ((temp (gensym "POP-TEMP-")))
      `(progn
         (%asm (:comment "pop") (:push-null))
         (let ((,temp ,a))
           (prog1
               (car ,temp)
             (%set-local ,a (cdr ,temp)))))))

  ;; fixme: implement PUSH according to spec
  (swf-defmacro push (item place)
    (let ((temp (gensym "PUSH-TEMP-")))
      `(progn
        (let ((,temp ,place))
          (%set-local ,place (cons ,item ,temp))))))


  (swf-defun first (list) (car list))
  (swf-defun second (list) (car (cdr list)))
  (swf-defun third (list) (car (cddr list)))
  (swf-defun fourth (list) (car (cdddr list)))
  (swf-defun fifth (list) (car (cddddr list)))
  (swf-defun sixth (list) (car (cdr (cddddr list))))
  (swf-defun seventh (list) (car (cddr (cddddr list))))
  (swf-defun eighth (list) (car (cdddr (cddddr list))))
  (swf-defun ninth (list) (car (cddddr (cddddr list))))
  (swf-defun tenth (list) (car (cdr (cddddr (cddddr list)))))
  
)