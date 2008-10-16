
;;; stuff from old version that needs updated

;(symbol-to-qname :foo-bar)
;(symbol-to-qname '1-)
;(symbol-to-qname  'flash.text::text-field :init-cap t)


(defmethod scompile-cons ((car (eql ':math)) cdr)
  ;; hack for calling Math.foo more easily
  ;; (:math :foo args...) -> Math.foo(args...);
  (format t ":math ~s~%" `(%call-lex-prop :math ,@cdr))
  (scompile `(%call-lex-prop :math ,@cdr)))

