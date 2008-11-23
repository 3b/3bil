(in-package #:avm2-compiler)

;;; pieces of sicl/conditionals.lisp that work so far

(let ((*symbol-table* *cl-symbol-table*))

  (defun proper-list-p (object)
    (if (null object)
	t
	(if (consp object)
	    (proper-list-p (cdr object))
	    nil)))



  (swf-defmacro or (&rest forms)
    (if (null forms)
        nil
        (if (not (consp forms))
            (error 'malformed-body :body forms)
            (if (null (cdr forms))
                (car forms)
                (let ((temp-var (gensym)))
                  `(let ((,temp-var ,(car forms)))
                     (if ,temp-var
                         ,temp-var
                         (or ,@(cdr forms)))))))))

  (swf-defmacro and (&rest forms)
    (if (null forms)
        t
        (if (not (consp forms))
            (error 'malformed-body :body forms)
            (if (null (cdr forms))
                (car forms)
                `(if ,(car forms)
                     (and ,@(cdr forms))
                     nil)))))


  (swf-defmacro when (form &body body)
    (if (not (proper-list-p body))
        (error 'malformed-body :body body)
        `(if ,form
             (progn ,@body)
             nil)))

  (swf-defmacro unless (form &body body)
    (if (not (proper-list-p body))
        (error 'malformed-body :body body)
        `(if ,form
             nil
             (progn ,@body))))


  (swf-defmacro cond (&rest clauses)
    (if (not (proper-list-p clauses))
        (error 'malformed-cond-clauses :clauses clauses)
        (if (null clauses)
            nil
            (let ((clause (car clauses)))
              (if (not (and (proper-list-p clause)
                            (not (null clause))))
                  (error 'malformed-cond-clause
                         :clause clause)
                  (if (null (cdr clause))
                      `(or ,(car clause)
                           (cond ,@(cdr clauses)))
                      `(if ,(car clause)
                           (progn ,@(cdr clause))
                           (cond ,@(cdr clauses)))))))))

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

;;; Turn a list of TYPECASE clauses into nested IFs.  We check that
;;; the list of clauses is a proper list, that each clause is a proper
;;; list as well, and that, if there is an otherwise clause, it is the
;;; last one.
  (defun expand-typecase-clauses (clauses variable)
    (if (null clauses)
        'nil
        (if (not (consp clauses))
            (error 'malformed-typecase-clauses
                   :clauses clauses)
            (let ((clause (car clauses)))
              (unless (and (proper-list-p clause)
                           (not (null clause)))
                (error 'malformed-typecase-clause
                       :clause clause))
              (if (or (eq (car clause) 'otherwise)
                      (eq (car clause) t))
                  (if (null (cdr clauses))
                      `(progn ,@(cdr clause))
                      (error 'otherwise-clause-not-last
                             :clauses (cdr clauses)))
                  ;; it is a normal clause
                  (let ((type (car clause))
                        (forms (cdr clause)))
                    `(if (%typep ,variable ,type)
                         (progn ,@forms)
                         ,(expand-typecase-clauses (cdr clauses) variable))))))))
  (swf-defmacro typecase (keyform &rest clauses)
    (let ((variable (gensym)))
      `(let ((,variable ,keyform))
         ,(expand-typecase-clauses clauses variable))))

  )