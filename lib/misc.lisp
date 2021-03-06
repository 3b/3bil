(in-package #:avm2-compiler)

;; various not-quite-cl parts

(let ((*symbol-table* *cl-symbol-table*))


  (c3* :%%misc2

    (defmacro time (&body body)
      (let ((now (gensym)))
        `(let ((,now (%new- flash:date)))
           ,@body
           (ftrace
            (s+ "[" ":" (/ (- (%new- flash:date) ,now) 1000.0) "sec]")))))

    ;; fixme: use new compiler (see :constructor option to defclass-swf)
    #+nil
    (defmacro swf-constructor (class lambda-list &body body)
      ;; fixme: use eval-when instead of doing things at macroexpansion
      (setf (constructor (find-swf-class class))
            (list lambda-list body))
      nil)


    (defmacro defmethod-swf (name ((spec-arg spec-type) &rest lambda-list)
                             &body body)
      (pushnew name ;; fixme: convert to swf name?
               (gethash name (class-methods *symbol-table*) (list))
               :test 'equal)
      (let ((c (find-swf-class spec-type)))
        (push (list name) (functions c)))
      `(%named-lambda ,name ;;(format nil "~a::~a" spec-type name)
             (:this-arg ,spec-arg :class-name ,spec-type)
           ,lambda-list
         ;; fixme: parse declarations/docstring stuff properly
         ,@(if (eq (caar body) 'declare)
               `(,(car body)
                  (block ,name
                    ,@(cdr body)))
               `((block ,name
                   ,@body)))))

    (defmacro defmethod-swf-static (name ((spec-arg spec-type) &rest lambda-list)
                             &body body)
      (pushnew (list name spec-type) ;; fixme: convert to swf names?
               (gethash name (class-static-methods *symbol-table*) (list))
               :test 'equal)
      (let ((c (find-swf-class spec-type)))
        (push (list name) (class-functions c)))
     (print `(%named-lambda ,name ;;(format nil "~a::~a" spec-type name)
              (:this-arg ,spec-arg :class-name ,spec-type :class-static t)
            ,lambda-list
          ;; fixme: parse declarations/docstring stuff properly
          ,@(if (eq (caar body) 'declare)
                `(,(car body)
                   (block ,name
                     ,@(cdr body)))
                `((block ,name
                    ,@body))))))

    (defmacro %add-swf-accessor (sym &optional flash-name)
      (add-swf-accessor sym (or flash-name sym))
      nil)

    (defmacro declaim (&rest a)
      nil)

    (defun svref (array index)
      (%asm
       (:@ array)
       (:@ index)
       (:get-property (:multiname-l "" ""))))

    (defun (setf svref) (value array index)
      (%asm
       (:@ array)
       (:@ index)
       (:@ value)
       (:set-property (:multiname-l "" ""))
       (:push-null))
      value)

    (defun aref (a &arest subscripts)
      (let ((i (%aref-1 subscripts 0)))
        (if (= 1 (length subscripts))
            (if (%typep a flash:array)
                (%aref-1 a i)
                (if (%typep a flash:string)
                    (flash:char-at a i)
                    (if (%typep a not-simple-array-type)
                        (%aref-n* a subscripts)
                        (svref a subscripts))))
            (%aref-n* a subscripts))))

    (defun (setf aref) (value a &arest subscripts)
      (let ((subscript (%aref-1 subscripts 0)))
        (if (%typep a flash:array)
            (progn (%set-aref-1 a subscript value) value)
            (if (%typep a flash:string)
                ;; fixme: is there a better way to do this?
                (flash:concat (flash:substr a 0 subscript)
                              value
                              (flash:substr a (1+ subscript)))
                (if (%typep a not-simple-array-type)
                    (%setf-aref-n a subscripts value)
                    (setf (svref a subscript) value))))))

    ;; optimize for common case of a single-dimenaional array
    (define-compiler-macro aref (&whole w array &rest subscripts)
      (if (/= 1 (length subscripts))
          w
          (let ((atmp (gensym)))
            `(let ((,atmp ,array))
               (if (%typep ,atmp flash:array)
                  (%asm
                   (:@ ,atmp)
                   (:@ ,(car subscripts))
                   (:get-property (:multiname-l "" "")))
                  (%aref-1 ,atmp ,(car subscripts)))))))

    ;; todo: setf expander for (setf aref) of vector?
    (define-compiler-macro (setf aref) (&whole w new array &rest subscripts)
      (if (/= 1 (length subscripts))
          w
          (let ((atmp (gensym))
                (ntmp (gensym)))
            `(let ((,atmp ,array)
                   (,ntmp ,new))
               (if (%typep ,array flash:array)
                   (%asm
                    (:@ ,atmp)
                    (:@ ,(car subscripts))
                    (:@ ,ntmp)
                    (:set-property (:multiname-l "" ""))
                    (:@ ,ntmp))
                  (%setf-aref-1 ,atmp ,(car subscripts) ,ntmp))))))

    (defmacro %array (&rest args)
      ;; (%array ... ) -> array
      `(%asm
        ,@(loop for i in args
             collect `(:@ ,i)) ;; calculate args
        (:new-array ,(length args))))

  (defun length (sequence)
    (if (listp sequence)
        (list-length sequence)
        ;; fixme: should probably be flash:length instead of :length
        (or (slot-value sequence :length) 0)))

    ;; ugly hack, just enough to make LOOP work...
    (defmacro with-hash-table-iterator ((name hash-table) &body body)
      ;; fixme: implement this correctly once VALUES works
      (let ((values (gensym))
            (index (gensym)))
        `(let ((,index 0))
           (macrolet ((multiple-value-setq (vars form)
                        `(let ((,',values))
                           ,form
                           ,@(loop for var in vars
                                for i from 0
                                collect `(setf ,var (aref ,',values ,i)))
                           (aref ,',values 0)))
                      (,name ()
                        `(let* ((next (%asm
                                       (:@ ,',hash-table)
                                       (:@ ,',index)
                                       (:coerce-i)
                                       (:has-next)))
                                (next-p (not (zerop next)))
                                (key (when next-p
                                       (%asm
                                        (:@ ,',hash-table)
                                        (:@ ,',index)
                                        (:coerce-i)
                                        (:next-name))))
                                (val (when next-p
                                       (%asm
                                        (:@ ,',hash-table)
                                        (:@ ,',index)
                                        (:coerce-i)
                                        (:next-value)))))
                           (setf ,',index next)
                           (setf ,',values (%array next-p key val )))))
             ;; 0 seems to not be quite the right place to start?
             (multiple-value-setq () (,name))
             ,@body))))

    (defun get-universal-time ()
      (+ (floor (/ (flash:get-time (%new- flash:date)) 1000))
         #. (encode-universal-time 0 0 0 1 1 1970 0)))

    #++(defmacro %exit-point-value ()
      (%new- flash:q-name "exit" "point"))

    (defun copy-seq (seq)
      ;; fixme: handle specialized arrays once they are added
      (cond
        ((stringp seq) (%new- flash:string seq))
        ((consp seq) (copy-list seq))
        ;; fixme: signal TYPE-ERROR if not a sequence instead of assuming array
        (t (flash:slice seq))))

    (defun stringp (s)
      (%typep s flash:string))


))

