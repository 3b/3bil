(in-package #:avm2-compiler)

;; new cl: function implementations for new compiler


(let ((*symbol-table* *cl-symbol-table*))

  ;; temporary hacks for new compiler
  (swf-defmacro defun (name args &body body)
    `(%named-lambda ,name () ,args (block ,name ,@body)))

  (swf-defmacro defun-with-flags (name args &body body)
    `(%named-lambda ,name () ,args (block ,name ,@body)))

  (swf-defmacro defun-asm (name args &body body)
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


    (swf-defmemfun funcall (x &arest args)
      (%flash:apply x nil args ))

    (swf-defmemfun + (&arest x)
      (let ((sum 0))
        (dotimes (i (length x) sum)
          (incf sum (aref x i)))))
    (swf-defmemfun s+ (&arest x)
      (let ((sum ""))
        (dotimes (i (length x) sum)
          (incf sum (aref x i)))))


    (swf-defmemfun = (a &arest x)
      (dotimes (i (length x) t)
        (unless (eq a (aref x i)) ;; eql?
          (return nil))))

    (swf-defmemfun < (a &arest x)
      (dotimes (i (length x) t)
        (when (%2>= a (aref x i)) (return nil))
        (setf a (aref x i))))
    (swf-defmemfun <= (a &arest x)
      (dotimes (i (length x) t)
        (when (%2> a (aref x i)) (return nil))
        (setf a (aref x i))))

    (swf-defmemfun > (a &arest x)
      (dotimes (i (length x) t)
        (when (%2<= a (aref x i)) (return nil))
        (setf a (aref x i))))
    (swf-defmemfun >= (a &arest x)
      (dotimes (i (length x) t)
        (when (%2< a (aref x i)) (return nil))
        (setf a (aref x i))))

    (swf-defmemfun - (a &arest x)
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
                      (:@! sum)))))))

    (swf-defmemfun / (a &arest x)
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
                      (:@! sum)))))))


    (swf-defmemfun * (&arest x)
      (let ((sum 1))
        (dotimes (i (length x) sum)
          (let ((y (aref x i)))
            (%asm (:@ sum)
                  (:@ y)
                  (:multiply)
                  (:coerce-any)
                  (:dup)
                  (:@! sum))))))

    (swf-defun type-of (o)
      (%type-of o))

    (c3* :%%misc
      (defun not (x)
        (%asm
          (:@ x)
          (:not)))

      (defun mod (x y)
        (%asm
          (:@ x)
          (:@ y)
          (:modulo)))

        (defmacro %new- (class &rest args)
          (let ((name (typecase class
                        (symbol
                         (let ((c (find-swf-class class)))
                           (assert c) ;; fixme: better error reporting
                           (swf-name c)))
                        (t class))))
            `(%asm (:find-property-strict ,name)
                   ,@(loop for i in args
                        collect `(:@ ,i))
                   (:comment "%new-")
                   (:construct-prop ,name ,(length args)))))
        (defmacro time (&body body)
          (let ((now (gensym)))
            `(let ((,now (%new- %flash:date)))
               ,@body
               (ftrace
                (s+ "[" ":" (/ (- (%new- %flash:date) ,now) 1000.0) "sec]")))))


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
            (:get-property ,class)
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

)

    ;;; internal junk
    (swf-defmemfun %exit-point-value ()
      (%new* %flash:q-name "exit" "point"))

    (def-swf-class throw-exception-type "what goes here?"
      %flash:object (throw-exception-tag throw-exception-value)
      ((a b)
       (%set-property this throw-exception-tag a)
       (%set-property this throw-exception-value b)))

    (def-swf-class block-exception-type "what goes here?"
      %flash:object (block-exception-tag block-exception-value)
      ((a b)
       (%set-property this block-exception-tag a)
       (%set-property this block-exception-value b)))

    (def-swf-class go-exception-type "what goes here?"
      %flash:object (go-exception-tag go-exception-index)
      ((a b)
       ;; fixme: index should be typed as int
       (%set-property this go-exception-tag a)
       (%set-property this go-exception-index b)))

    (swf-defmemfun %intern (package name)
      (%new* %flash:q-name package name))



    (def-swf-class setf-namespace-type "what goes here?"
      %flash:object (baz)
      (()
       (%asm (:push-null))))

    (swf-defun-in-class-static foo setf-namespace-type (&arest args)
      (ftrace (s+ " setf foo : " args)))
    (swf-defun-in-class-static bar setf-namespace-type (&arest args)
      (ftrace (s+ " setf bar : " args)))

    ;; temp hack
    (c3* (gensym)
      (defmacro defun-setf (name args  body)
        (%swf-defun name args (list
                               (loop for i in body
                                     if (and (consp i) (eql (car i) 'cl))
                                     collect (cadr i)
                                     else
                                     collect i #+nil(list 'quote i)))
                    :method t
                    :class-name 'setf-namespace-type
                    :class-static t)
        nil))
    ;; debugging aid
    (swf-defmemfun ftrace (x)
      (%flash:trace x))

)
