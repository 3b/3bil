(in-package #:avm2-compiler)

;;; implement functions/macros from CL package
;;;
;;; most probably don't match CL semantics very closely yet...

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

  (swf-defmemfun car (a)
    (if (eq a :null)
        :null
        (%asm (:get-local-1)
              (:get-property %car))))

  (swf-defmemfun cdr (a)
    (if (eq a :null)
        :null
        (if (%typep a cons-type)
            (%asm (:get-local-1)
                  (:get-property %cdr)
                  (:coerce-any))
            (%error "type-error: unknown type cdr"))))

  (swf-defmemfun consp (a)
    (%typep a cons-type))

  (swf-defmemfun listp (a)
    (or (%typep a cons-type) (eq a nil)))

  (swf-defmemfun endp (a)
    (if (eq a nil)
        t
        (if (consp a)
            nil
            (%error "type-error: arg not a list in ENDP"))))

  ;; fixme: implement pop according to spec
  (swf-defmacro pop (a)
    `(progn
       (%asm (:comment "pop") (:push-null))
       (prog1
          (car ,a)
        (%set-local ,a (cdr ,a)))))

)