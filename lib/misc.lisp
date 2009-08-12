(in-package #:avm2-compiler)

;; various not-quite-cl parts

(let ((*symbol-table* *cl-symbol-table*))

  ;; defmacro
  (add-swf-macro-function
   'defmacro
   (lambda (form environment)
     (declare (ignore environment))
     (destructuring-bind (name args &body body) (cdr form)
       (let ((bform (gensym))
             (benvironment (gensym)))
         (add-swf-macro-function
          name
          (coerce `(lambda (,bform ,benvironment)
                     (declare (ignore ,benvironment))
                     (destructuring-bind ,args (cdr ,bform)
                       ,@body)) 'function))))
     nil))

  (c3* :%%misc2

    (defmacro defclass-swf (class-name (&optional (superclass-name '%flash:object))
                            (&rest slot-specifiers)
                            &rest class-options)
      (let ((properties nil)
            (static-properties nil)
            (forms nil)
            (constructor-sym (gensym (format nil "~a-CTOR-" class-name)))
            (constructor (cdr (assoc :constructor class-options)))
            (super-args (cdr (assoc :super-args class-options)))
            (fake-accessors (second (assoc :fake-accessors class-options))))
        (format t "slot-spec = ~s~%" slot-specifiers)
        ;; todo: class options
        ;;  (:swf-flags :sealed <bool> :final <bool> :interface <bool> ...?)
        ;;  :metaclass? :documentation :default-initargs?
        (map 'nil
             (lambda (spec)
               (destructuring-bind (name &key
                                         ;; same? as cl
                                         allocation
                                         ;; similar to CL, but strict, and currently unused
                                         type
                                         ;; currently unsupported CL stuff
                                         ;; reader writer accessor initarg initform
                                         ;; unused, but might as well allow it
                                         documentation) (if (listp spec) spec (list spec))
                 (declare (ignore type documentation))
                                        ;(format t "slot ~s = ~s ~s ~s ~s~%" name allocation inline-reader inline-writer inline-accessor)
                 #++(when fake-accessors
                   (let ((a (gensym)))
                     (push `(defmacro ,name (,a)
                              `(slot-value ,,a ,',name))
                           forms)))
                 (when fake-accessors
                   (add-swf-accessor name name))
                 (if (eq allocation :class)
                     (push name static-properties)
                     (push name properties))))
             slot-specifiers)

        ;; fixme: this should use eval-when instead of doing things at
        ;; macroexpansion time, once that is supported
        (setf (gethash class-name (classes *symbol-table*))
              (add-swf-class
               class-name
               (avm2-asm::symbol-to-qname-list class-name)
               :ns "???" ;; fixme: what goes here?
               :extends superclass-name
               :properties properties
               :class-properties static-properties
               :functions nil       ;; to be added separately
               :class-functions nil ;; to be added separately
               ;; fixme: should we define a default constructor with
               ;; initform/initarg parsing, and optionally call out to
               ;; a user-defined constructor?
               :constructor (avm2-asm::intern-method-id constructor-sym)))
        (loop for p in properties
           do (add-swf-property p p))
        (loop for p in static-properties
           do (add-swf-class-property p p))
                                        ;(format t "constructor = ~%")
        `(progn
           ,@(nreverse forms)
           (%named-lambda ,constructor-sym
                 (:no-auto-return t :no-auto-scope t :anonymous t)
               ,(car constructor)       ; lambda list
             (%asm
              (:get-local-0)
              (:push-scope)
              (:get-local-0)
              ,@(loop for i in super-args
                   collect `(:@ ,i))
              (:construct-super ,(length super-args))
              (:%activation-record)
              (:push-null))
             (block nil
               ,@(cdr constructor))
             (%asm (:return-void)))
           )))

    ;; fixme: use new compiler (see :constructor option to defclass-swf)
    #+nil
    (defmacro swf-constructor (class lambda-list &body body)
      ;; fixme: use eval-when instead of doing things at macroexpansion
      (setf (constructor (find-swf-class class))
            (list lambda-list body))
      nil)


    (defmacro defmethod-swf (name ((spec-arg spec-type) &rest lambda-list)
                             &body body)
      `(%named-lambda ,name
             (:this-arg ,spec-arg :class-name ,spec-type)
           ,lambda-list
         (block ,name
           ,@body)))

    (defmacro %add-swf-accessor (sym &optional flash-name)
      (add-swf-accessor sym (or flash-name sym))
      nil)

    (defmacro declaim (&rest a)
      nil)

    (defmacro %typep (object type)
      `(%asm
        (:@ ,object)
        (:get-lex ,(or (swf-name (find-swf-class type)) type))
        (:is-type-late)))

    (defmacro %aref-1 (array index)
      `(%asm
        (:@ ,array)
        (:@ ,index)
        (:get-property (:multiname-l "" ""))))

    (defmacro svref (array index)
      `(%asm
        (:@ ,array)
        (:@ ,index)
        (:get-property (:multiname-l "" ""))))


    (defmacro %set-aref-1 (array index value)
      `(%asm
        (:@ ,array)
        (:@ ,index)
        (:@ ,value)
        (:set-property (:multiname-l "" ""))
        (:push-null)
        (:coerce-any)))


    ;; fixme: should be a function
    (defmacro aref (array &rest subscripts)
      (let ((a (gensym)))
        (if (= 1 (length subscripts))
            `(let ((,a ,array))
               (if (%typep ,a %flash:array)
                   (%aref-1 ,a ,(first subscripts))
                   (if (%typep ,a %flash:string)
                       (%flash:char-at ,a 1)
                       (if (%typep ,a not-simple-array-type)
                           (%aref-n ,a ,@subscripts)
                           (svref ,a ,@subscripts)))))
            `(%aref-n ,array ,@subscripts))))

    ;; fixme: what broke this?
    #++
    (defun (setf aref) (value a subscript)
      ;; fixme: support multiple dimensions (need &rest, apply?)
      (if (%typep a %flash:array)
          (%set-aref-1 a subscript value)
          (if (%typep a %flash:string)
              ;; fixme: is there a better way to do this?
              (%flash:concat (%flash:substr a 0 subscript)
                             value
                             (%flash:substr a (1+ subscript)))
              (if (%typep a not-simple-array-type)
                  (%setf-aref-n a subscript value)
                  (setf (svref a subscript) value)))))
    (defmacro %set-property (object property value)
      ;; (%set-property object property value) -> value
      (print`(%asm
         (:@ ,value) ;; calculate value
         (:dup)      ;; leave a copy on stack so we can return it
         (:@ ,object) ;; find the object
         (:swap)      ;; stack => return-value object value
         (:set-property ,(or (find-swf-property property) property)))))

    (defmacro %array (&rest args)
      ;; (%array ... ) -> array
      `(%asm
        ,@(loop for i in args
             collect `(:@ ,i)) ;; calculate args
        (:new-array ,(length args))))

  (defun length (sequence)
    (if (listp sequence)
        (list-length sequence)
        ;; fixme: should probably be %flash:length instead of :length
        (or (slot-value sequence :length) 0)))

    ;; ugly hack, just enough to make LOOP work...
    (defmacro with-hash-table-iterator ((name hash-table) &body body)
      ;; fixme: implement this correctly once VALUES works
      (let ((values (gensym))
            (index (gensym)))
        (format t "w-h-t-i~%")
        (print `(let ((,index 0))
            (macrolet ((multiple-value-setq (vars form)
                         (format t "m-v-s~%")
                         (print `(let ((,',values))
                                   ,form
                                   ,@(loop for var in vars
                                        for i from 0
                                        collect `(setf ,var (aref ,',values ,i)))
                                   (aref ,',values 0))))
                       (,name ()
                         (format t "m-v-s~%")
                         (print `(let* ((next (%asm
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
                                   (ftrace (s+ "hash-it : " next "/" key "/" val))
                                   (setf ,',index next)
                                   (setf ,',values (%array next-p key val ))))))
              ,@body)))))

    (defun get-universal-time ()
      (+ (floor (/ (%flash:get-time (%new- %flash:date)) 1000))
         #. (encode-universal-time 0 0 0 1 1 1970 0)))

    #++(defmacro %exit-point-value ()
      (%new- %flash:q-name "exit" "point"))

    (defun copy-seq (seq)
      ;; fixme: handle specialized arrays once they are added
      (cond
        ((stringp seq) (%new- %flash:string seq))
        ((consp seq) (copy-list seq))
        ;; fixme: signal TYPE-ERROR if not a sequence instead of assuming array
        (t (%flash:slice seq))))

    (defun stringp (s)
      (%typep s %flash:string))


))

