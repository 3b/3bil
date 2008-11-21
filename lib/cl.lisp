(in-package #:as3-compiler)

;;; implement functions/macros from CL package
;;;
;;; most probably don't match CL semantics very closely yet...

(let ((*symbol-table* *cl-symbol-table*))

  (swf-defmemfun random (a)
    ;;todo: return int for int args
    ;;fixme: don't seem to be able to set seeds, so can't do random-state arg
    (* (flash::math.random) a))

  (swf-defmemfun 1- (a)
    (- a 1))

  (swf-defmemfun floor (number)
    ;; todo implement optional divisor arg (need multiple values)
    (flash::math.floor number))

  #+nil(swf-defmemfun max (&rest numbers)
    ;; fixme: need to figure out how to implement this...
         (apply 'flash::math.max numbers))

  #+nil(swf-defmemfun min (&rest numbers)
    ;; fixme: need to figure out how to implement this...
         (apply 'flash::math.min numbers))


  (swf-defmemfun cos (radians)
    (flash::math.cos radians))
  (swf-defmemfun sin (radians)
    (flash::math.sin radians))
  (swf-defmemfun tan (radians)
    (flash::math.tan radians))

  (swf-defmemfun eq (a b)
    (%asm (:get-local-1)
          (:get-local-2)
          (:strict-equals)))

  (swf-defmemfun eql (a b)
    (%asm (:get-local-1)
          (:get-local-2)
          (:equals)))

  #+nil  (swf-defmemfun error (datum &rest args) )

  #+nil  (swf-defmemfun typep (object type)
    (%typep object type))

  (swf-defmacro let* (bindings &body body)
    `(let (,(car bindings))
       ,@(if (cdr bindings)
             `((let* ,(cdr bindings) ,@body))
             body)))


;;; from sicl

  (defun proper-list-p (object)
    (if (null object)
	t
	(if (consp object)
	    (proper-list-p (cdr object))
	    nil)))

  (defun eql-ify (keys variable)
    (if (null keys)
        '()
        (cons `(eql ,variable ,(car keys))
              (eql-ify (cdr keys) variable))))
;;; This function turns a list of CASE clauses into nested IFs.  It
;;; checks that the list of clauses is a proper list and that each
;;; clause is also a proper list.  It also checks that, if there is an
;;; otherwise clause, it is the last one.
  (defun expand-case-clauses (clauses variable)
  (if (null clauses)
      'nil
      (if (not (consp clauses))
	  (error 'malformed-case-clauses
		 :clauses clauses)
	  (let ((clause (car clauses)))
	    (unless (and (proper-list-p clause)
			 (not (null clause)))
	      (error 'malformed-case-clause
		     :clause clause))
	    (if (or (eq (car clause) 'otherwise)
		    (eq (car clause) t))
		(if (null (cdr clauses))
		    `(progn ,@(cdr clause))
		    (error 'otherwise-clause-not-last
			   :clauses (cdr clauses)))
		;; it is a normal clause
		(let ((keys (car clause))
		      (forms (cdr clause)))
		  (if (and (atom keys)
			   (not (null keys)))
		      `(if (eql ,variable ,keys)
			   (progn ,@forms)
			   ,(expand-case-clauses (cdr clauses) variable))
		      (if (not (proper-list-p keys))
			  (error 'malformed-keys
				 :keys keys)
			  `(if (or ,@(eql-ify keys variable))
			       (progn ,@forms)
			       ,(expand-case-clauses (cdr clauses) variable))))))))))

  (swf-defmacro case (keyform &rest clauses)
    (let ((variable (gensym "CASE-VAR-")))
      `(let ((,variable ,keyform))
         ,(expand-case-clauses clauses variable))))

  )

