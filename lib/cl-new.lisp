(in-package #:avm2-compiler)

;; new cl: function implementations for new compiler


(let ((*symbol-table* *cl-symbol-table*))

  ;; temporary hacks for new compiler
  #++(swf-defmacro defun (name args &body body)
       `(%named-lambda ,name () ,args (block ,name ,@body)))

  #+-(swf-defmacro defun-with-flags (name args &body body)
       `(%named-lambda ,name () ,args (block ,name ,@body)))

  #+-(swf-defmacro defun-asm (name args &body body)
       (if (consp name)
           `(%named-lambda ,(car name) ,(cdr name) ,args (%asm ,@body))
           `(%named-lambda ,name () ,args (%asm ,@body))))

  #+nil
  (swf-defmacro defmacro (name args &body body)
    (let ((form (gensym))
          (environment (gensym)))
      (add-swf-macro-function
       name
       (coerce `(lambda (,form ,environment)
                  (declare (ignore ,environment))
                  (destructuring-bind ,args (cdr ,form)
                    ,@body)) 'function)))
    nil)


  (c3* (gensym)
    (defun funcall (x &arest args)
         (flash:apply x nil args ))

    ;;; most of these depend on compiler macros in bootstrap.lisp for the
    ;;; 0-2 arg case

    (defun + (&arest x)
      (let ((sum 0))
        (dotimes (i (length x) sum)
          (incf sum (aref x i)))))

    (defun s+ (&arest x)
         (let ((sum ""))
           (dotimes (i (length x) sum)
             (incf sum (aref x i)))))

    (defun = (a &arest x)
      (dotimes (i (length x) t)
        (unless (eq a (aref x i)) ;; eql?
          (return nil))))

    (defun < (a &arest x)
      (dotimes (i (length x) t)
        (when (>= a (aref x i)) (return nil))
        (setf a (aref x i))))

    (defun <= (a &arest x)
      (dotimes (i (length x) t)
        (when (> a (aref x i)) (return nil))
        (setf a (aref x i))))

    (defun > (a &arest x)
      (dotimes (i (length x) t)
        (when (<= a (aref x i)) (return nil))
        (setf a (aref x i))))

    (defun >= (a &arest x)
      (dotimes (i (length x) t)
        (when (< a (aref x i)) (return nil))
        (setf a (aref x i))))

    (defun - (a &arest x)
      (let ((sum a))
        (if (= (length x) 0)
            (%asm (:@ a)
                  (:negate)
                  (:coerce-any))
            (dotimes (i (length x) sum)
              (let ((y (aref x i)))
                (%asm (:@ sum)
                      (:@ y)
                      (:subtract)
                      (:coerce-any)
                      (:dup)
                      (:@ (setf sum (%asm-top-of-stack-untyped)) :ignored)
                      #++(:@! sum)))))))
    (defun / (a &arest x)
      (let ((sum a))
        (if (= (length x) 0)
            (%asm (:push-int 1)
                  (:@ a)
                  (:divide)
                  (:coerce-any))
            (dotimes (i (length x) sum)
              (let ((y (aref x i)))
                (%asm (:@ sum)
                      (:@ y)
                      (:divide)
                      (:coerce-any)
                      (:dup)
                      (:@ (setf sum (%asm-top-of-stack-untyped)) :ignored)
                      #++(:@! sum)))))))

    (defun * (&arest x)
      (let ((sum 1))
        (dotimes (i (length x) sum)
          (let ((y (aref x i)))
            (%asm (:@ sum)
                  (:@ y)
                  (:multiply)
                  (:coerce-any)
                  (:dup)
                  (:@ (setf sum (%asm-top-of-stack-untyped)) :ignored))))))

    (defmacro %type-of (o)
      `(%asm (:@ ,o)
             (:type-of)))

    (defun type-of (o)
      (%type-of o))


    (defun not (x)
      (%asm
       (:@ x)
       (:not)))

    (defun mod (x y)
      (%asm
       (:@ x)
       (:@ y)
       (:modulo)))



    (defmacro %set-property- (object prop value)
      `(%asm
        (:@ ,value)
        (:dup)
        (:@ ,object)
        (:swap)
        (:set-property ,prop)))
    (defmacro %get-property- (object prop)
      `(%asm
        (:@ ,object)
        (:get-property ,prop)))
    (defmacro %get-property-static (class prop)
      `(%asm
        (:get-global-scope)
        (:get-property ,(or (swf-name (find-swf-class class)) class))
        (:get-property ,prop)))
    (defmacro %get-lex-property-static (class prop)
      `(%asm
        (:get-lex ,(or (swf-name (find-swf-class class)) class))
        (:get-property ,prop)))
    (defmacro %set-property-static (class prop value)
      `(%asm
        (:@ ,value)
        (:dup)
        (:get-global-scope)
        (:get-property ,class)
        (:swap) ;; leave a copy of value on stack when done
        (:set-property ,prop)))

    (defmacro %new-a (class &rest args)
      (let ((name (typecase class
                    (symbol
                     (let ((c (find-swf-class class)))
                       (assert c) ;; fixme: better error reporting
                       (swf-name c)))
                    (t class))))
        `(%asm (:find-property-strict ,name)
               ,@(loop for i in args
                    collect `(:@ ,i))
               (:construct-prop ,name ,(length args)))))



;;; internal junk
    (defun %exit-point-value ()
      (%new- flash:q-name "exit" "point"))

    (defclass-swf throw-exception-type (flash:object)
      (throw-exception-tag throw-exception-value)
      (:constructor (a b)
        (%set-property this throw-exception-tag a)
        (%set-property this throw-exception-value b)))

    (defclass-swf block-exception-type (flash:object)
      (block-exception-tag block-exception-value)
      (:constructor (a b)
       (%set-property this block-exception-tag a)
       (%set-property this block-exception-value b)))

    (defclass-swf go-exception-type (flash:object)
      (go-exception-tag go-exception-index)
      (:constructor (a b)
       ;; fixme: index should be typed as int
       (%set-property this go-exception-tag a)
       (%set-property this go-exception-index b)))

    (defun %intern (package name)
      (%new- flash:q-name package name))



    (defclass-swf setf-namespace-type (flash:object)
      (baz)
      (:constructor ()
        (%asm (:push-null))))

    ;; debugging aid
    (defun ftrace (x)
      (flash:trace x)))
  #++
  (swf-defun-in-class-static foo setf-namespace-type (&arest args)
    (ftrace (s+ " setf foo : " args)))
  #++
  (swf-defun-in-class-static bar setf-namespace-type (&arest args)
    (ftrace (s+ " setf bar : " args)))


)