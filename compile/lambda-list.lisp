(in-package :avm2-compiler)

;;; misc util functions for dealing with lambda lists


(defun parse-lambda-list (lambda-list &key (normalize t)
                                   (normalize-optional normalize)
                                   (normalize-keyword normalize)
                                   (normalize-auxilary normalize))
  "modified from alexandria::parse-ordinary-lambda-list, adding support
 for &AREST etc

Parses an ordinary lambda-list, returning as multiple values:

 1. Required parameters.
 2. Optional parameter specifications, normalized into form (NAME INIT SUPPLIEDP)
    where SUPPLIEDP is NIL if not present.
 3. Name of the rest parameter, or NIL.
 4. Keyword parameter specifications, normalized into form ((KEYWORD-NAME NAME) INIT SUPPLIEDP)
    where SUPPLIEDP is NIL if not present.
 5. Boolean indicating &ALLOW-OTHER-KEYS presence.
 6. &AUX parameter specifications, normalized into form (NAME INIT).
--
 7. &AREST parameter or nil

Signals a PROGRAM-ERROR is the lambda-list is malformed."
  (let ((state :required)
        (allow-other-keys nil)
        (auxp nil)
        (required nil)
        (optional nil)
        (rest nil)
        (arest nil)
        (keys nil)
        (aux nil))
    (labels ((fail (elt)
               (alexandria:simple-program-error
                "Misplaced ~S in ordinary lambda-list:~%  ~S"
                elt lambda-list))
             (check-variable (elt what)
               (unless (and (symbolp elt) (not (constantp elt)))
                 (alexandria:simple-program-error
                  "Invalid ~A ~S in ordinary lambda-list:~%  ~S"
                  what elt lambda-list)))
             (check-spec (spec what)
               (destructuring-bind (init suppliedp) spec
                 (declare (ignore init))
                 (check-variable suppliedp what))))
      (dolist (elt lambda-list)
        (case elt
          (&optional
           (if (eq state :required)
               (setf state elt)
               (fail elt)))
          (&rest
           (if (member state '(:required &optional))
               (setf state elt)
               (fail elt)))
          (&arest
           (if (member state '(:required &optional))
               (setf state elt)
               (fail elt)))
          (&key
           (if (member state '(:required &optional :after-rest))
               (setf state elt)
               (fail elt)))
          (&allow-other-keys
           (if (eq state '&key)
               (setf allow-other-keys t
                     state elt)
               (fail elt)))
          (&aux
           (cond ((eq state '&rest)
                  (fail elt))
                 ((eq state '&arest)
                  (fail elt))
                 (auxp
                  (alexandria:simple-program-error
                   "Multiple ~S in ordinary lambda-list:~%  ~S"
                   elt lambda-list))
                 (t
                  (setf auxp t
                        state elt))
                 ))
          (otherwise
           (when (member elt '#.(set-difference lambda-list-keywords
                                                '(&optional &rest &arest &key &allow-other-keys &aux)))
             (alexandria:simple-program-error
              "Bad lambda-list keyword ~S in ordinary lambda-list:~%  ~S"
              elt lambda-list))
           (case state
             (:required
              (check-variable elt "required parameter")
              (push elt required))
             (&optional
              (cond ((consp elt)
                     (destructuring-bind (name &rest tail) elt
                       (check-variable name "optional parameter")
                       (cond ((cdr tail)
                              (check-spec tail "optional-supplied-p parameter"))
                             (normalize-optional
                              (setf elt (append elt '(nil)))))))
                    (t
                     (check-variable elt "optional parameter")
                     (when normalize-optional
                       (setf elt (cons elt '(nil nil))))))
              (push (alexandria:ensure-list elt) optional))
             (&rest
              (check-variable elt "rest parameter")
              (setf rest elt
                    state :after-rest))
             (&arest
              (check-variable elt "arest parameter")
              (setf arest elt
                    state :after-rest))
             (&key
              (cond ((consp elt)
                     (destructuring-bind (var-or-kv &rest tail) elt
                       (cond ((consp var-or-kv)
                              (destructuring-bind (keyword var) var-or-kv
                                (unless (symbolp keyword)
                                  (alexandria:simple-program-error "Invalid keyword name ~S in ordinary ~
                                                         lambda-list:~%  ~S"
                                                        keyword lambda-list))
                                (check-variable var "keyword parameter")))
                             (t
                              (check-variable var-or-kv "keyword parameter")
                              (when normalize-keyword
                                (setf var-or-kv (list (alexandria:make-keyword
                                                       var-or-kv)
                                                      var-or-kv)))))
                       (if (cdr tail)
                           (check-spec tail "keyword-supplied-p parameter")
                           (when normalize-keyword
                             (setf tail (append tail '(nil)))))
                       (setf elt (cons var-or-kv tail))))
                    (t
                     (check-variable elt "keyword parameter")
                     (setf elt (if normalize-keyword
                                   (list (list (alexandria:make-keyword elt)
                                               elt)
                                         nil nil)
                                   (list elt)))))
              (push elt keys))
             (&aux
              (if (consp elt)
                  (destructuring-bind (var &optional init) elt
                    (declare (ignore init))
                    (check-variable var "&aux parameter"))
                  (progn
                    (check-variable elt "&aux parameter")
                    (setf elt (list* elt (when normalize-auxilary
                                           '(nil))))))
              (push elt aux))
             (t
              (alexandria:simple-program-error
               "Invalid ordinary lambda-list:~%  ~S" lambda-list)))))))
    (values (nreverse required)
            (nreverse optional)
            rest
            (nreverse keys)
            allow-other-keys
            (nreverse aux)
            arest)))



;; fixme: places this is still used probably shouldn't be seeing full
;; lambda lists anymore, so check them and remove this if so
(defun lambda-list-vars (llist)
  (multiple-value-bind (required optional rest keys allow-other-keys aux arest)
      (parse-lambda-list llist)
    (declare (ignore allow-other-keys))
    ;; opt = ((name default supplied-p)*)
    ;; key = (((:key name) default supplied-p)*)
    ;; aux = ((name default)*)?

    (when aux
      (error "got &aux ~s" aux))
    (when optional
      (error "got &optional ~s" optional))
    (when keys
      (error "got &key ~s" keys))
    (append required
            (when rest (list rest))
            (when arest (list arest))
            (loop for (name nil p) in optional
               when name collect name
               when p collect p)
            (loop for ((nil name) nil p) in keys
               when name collect name
               when p collect p)

            (mapcar 'car aux))))

#++
(defun old-alphatize-lambda-list (lambda-list alphatized-names)
  (loop for i in lambda-list
     for alpha = (assoc i alphatized-names)
     ;; normal var or keyword, replace with alphatized version if any
     when alpha collect (cadr alpha)
     ;; defaulted vars
     else when (consp i)
     collect (cons
              ;; var name, possibly with explicit keyword (not alphatized)
              (if (consp (car i))
                  (list (caar i)
                        (or (cdr (assoc (cadar i) alphatized-names))
                            (cadar i)))
                  (or (cadr (assoc (car i) alphatized-names))
                      (car i)))
              ;; default and supplied-p var
              (if (= 1 (length (cdr i)))
                  (cdr i) ;; no supplied var
                  (list (second i)
                        (or (cadr (assoc (third i) alphatized-names))
                            (third i)))))
     else collect i))

#+-
(defun alphatize-lambda-list (lambda-list alphatize recur-init)
  (break)
  (multiple-value-bind (required optional rest keys allow-other-keys aux arest)
      (parse-lambda-list lambda-list)
    #++(when (or rest keys aux)
         (error "lambda-list keywords &rest &keys &aux not supported yet..."))
    (let ((vars (append required
                        (when rest (list rest))
                        (when arest (list arest))
                        (loop for (name nil p) in optional
                           when name collect name
                           when p collect p)
                        (loop for ((nil name) nil p) in keys
                           when name collect name
                           when p collect p)
                        (mapcar 'car aux))))
     (list
      :vars ;; fixme: get these directly instead of parsing lambda list twice
      (loop for i in (lambda-list-vars lambda-list)
         for a = (assoc i alphatized-names)
         when a collect (cadr a)
         else do (error "var not alphatized? ~s - ~s" i a))
      :required
      (loop for i in required
         for alpha = (assoc i alphatized-names)
         when alpha
         collect (cadr alpha)
         else do (error "var not alphatized yet? ~s - ~s" i alpha))
      :rest (cadr (assoc rest alphatized-names))
      :arest (cadr (assoc arest alphatized-names))
      :allow-other-keys allow-other-keys
      :optional
      (loop for (name init p) in optional
         for alpha = (assoc name alphatized-names)
         for init-r = (funcall recur-init init)
         for alphap = (assoc p alphatized-names)
         do (format t "&o (~s ~s ~s)->(~s ~s ~s)~%"
                    name init p
                    alpha init-r alphap)
         when (and alpha (if p alphap t))
         collect (list (cadr alpha) init-r (cadr alphap))
         else do (error "opt var not alphatized yet? ~s/~s - ~s/~s"
                        name p alpha alphap))
      :key
      (loop for ((key name) init p) in keys
         for alpha = (assoc name alphatized-names)
         for init-r = (funcall recur-init init)
         for alphap = (assoc p alphatized-names)
         do (format t "&k (~s ~s ~s)->(~s ~s ~s)~%"
                    name init p
                    alpha init-r alphap)
         when (and alpha (if p alphap t))
         collect (list (list key (cadr alpha)) init-r (cadr alphap))
         else do (error "key var not alphatized yet? ~s/~s - ~s/~s"
                        name p alpha alphap))
      :aux
      (loop for (name init) in aux
         for alpha = (assoc name alphatized-names)
         for init-r = (funcall recur-init init)
         do (format t "&a (~s ~s)->(~s ~s)~%" name init alpha init-r)
         when alpha
         collect (list (cadr alpha) init-r)
         else do (error "aux var not alphatized yet? ~s - ~s"
                        name alpha))))))

;;(alphatize-lambda-list '(v1 &optional v2 (v3 3) (v4 4 v4p) &key ((v5k v5) 5 v5p)) '((v1 v1a) (v2 v2a) (v3 v3a) (v4 v4a) (v4p v4pa) (v5 v5a) (v5p v5pa) (v5k v5ka)) #'identity)

