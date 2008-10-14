
;;; stuff from old version that needs updated

(defun symbol-to-qname (name &key init-cap)
  ;; just a quick hack for now, doesn't actually try to determine if
  ;; there is a valid property or not...
  (let ((package (symbol-package name))
        (sym (coerce
              (loop
                 for prev = (if init-cap #\- #\Space) then c
                 for c across (symbol-name name)
                 when (or (not (alpha-char-p prev)) (char/= c #\-))
                 collect (if (char= prev #\-)
                             (char-upcase c)
                             (char-downcase c)))
              'string)))
    (if (eql package (find-package :keyword))
        (setf package "")
        (setf package (string-downcase (or (package-name package) ""))))
    (values (qname package sym) sym)))

;(symbol-to-qname :foo-bar)
;(symbol-to-qname '1-)
;(symbol-to-qname  'flash.text::text-field :init-cap t)


(defmethod scompile-cons ((car (eql '%set-property)) cdr)
  ;; (%set-property object property value) -> value
  ;;(format t "set property ~s . ~s = ~s ~%" (first cdr) (second cdr) (third cdr))
  `(,@(scompile (third cdr)) ;; calculate value
      (dup) ;; leave a copy on stack so we can return it
      ,@(scompile (first cdr)) ;; find the object
      (swap) ;; stack => return-value object value
      ;; fixme: look up properties for real?
      (set-property ,(symbol-to-qname (second cdr)))))

(defmethod scompile-cons ((car (eql '%get-property)) cdr)
  ;; (%get-property object property) -> value
  ;;(format t "get property ~s . ~s ~%" (first cdr) (second cdr))
  `(,@(scompile (first cdr)) ;; find the object
      ;; fixme: look up properties for real?
      (get-property ,(symbol-to-qname (second cdr)))))

(defmethod scompile-cons ((car (eql '%call-property)) cdr)
  ;; (%call-property object property args) -> value
  ;;(format t "call property ~s . ~s ( ~s ) ~%" (first cdr) (second cdr) (third cdr))
  `(,@(scompile (first cdr)) ;; find the object
      ,@(loop for i in (cddr cdr)
         append (scompile i)) ;; calculate args
      (call-property ,(symbol-to-qname (second cdr)) ,(length (cddr cdr)))))


(defmethod scompile-cons ((car (eql '%call-lex-prop)) cdr)
  ;; fixme: better name for this?
  ;; (%call-lex-prop object-name property args) -> value
  ;;(format t "call proplex ~s . ~s ( ~s ) ~%" (first cdr) (second cdr) (third cdr))
  `((get-lex ,(symbol-to-qname (first cdr) :init-cap t)) ;; find the object
    ,@(loop for i in (cddr cdr)
         append (scompile i)) ;; calculate args
    (call-property ,(symbol-to-qname (second cdr)) ,(length (cddr cdr)))))

(defmethod scompile-cons ((car (eql '%get-lex)) cdr)
  ;; (%call-proplex object-name ) -> value
  `((get-lex ,(symbol-to-qname (first cdr)))))

(defmethod scompile-cons ((car (eql '%array)) cdr)
  ;; (%array ... ) -> array
  `(,@(loop for i in cdr
         append (scompile i)) ;; calculate args
      (new-array ,(length cdr))))


(defmethod scompile-cons ((car (eql ':math)) cdr)
  ;; hack for calling Math.foo more easily
  ;; (:math :foo args...) -> Math.foo(args...);
  (format t ":math ~s~%" `(%call-lex-prop :math ,@cdr))
  (scompile `(%call-lex-prop :math ,@cdr)))
