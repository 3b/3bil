(in-package :avm2-compiler)

(defun rename-swf-symbol (name)
  (coerce (loop with n = (string name)
             for i below (length n)
             for c across n
             for last = nil then (aref n (1- i))
             for next = (when (< i (1- (length n))) (aref n (1+ i)))
             when (char= c #\_)
             do (if last (setf c #\-) (setf c #\%))
             when (or
                   ;; aB -> a-b
                   (and last (lower-case-p last) (upper-case-p c))
                   ;; ABCFoo -> abc-foo
                   ;; but FooBARs$ -> foo-bars
                   (and next last (upper-case-p last)
                        (upper-case-p c) (lower-case-p next)
                        (not (and (= i (- (length n) 2))
                                  (char= next #\s))))
                   ;; IXML -> i-xml
                   ;; but INFO -> info
                   (and last (eql i 1) (char= last #\I) (upper-case-p c)
                        (some 'lower-case-p n))
                   ;; this breaks on things like 3d, but probably better
                   ;; default than ignoring numbers completely...
                   ;; (splitting before numbers might be good too,
                   ;;  but doesn't seem right for md5, base64, sha1, etc.)
                   ;; foo123Bar -> foo123-bar
                   (and last (digit-char-p last) (upper-case-p c))
)
             collect #\-
             collect (char-downcase c)) 'string))

(defun symbol-table-from-tag (tag renamer)
  (loop with pool = (%3b-swf:constant-pool tag)
     for i in (%3b-swf:instance-info tag)
     for mn = (elt (%3b-swf::multinames pool)
                   (1- (%3b-swf:name i)))
     for super-mn = (unless (zerop (%3b-swf:super-name i))
                      (elt (%3b-swf::multinames pool)
                           (1- (%3b-swf:super-name i))))
     for name = (list (elt (%3b-swf:strings pool)
                           (1- (%3b-swf:name mn)))
                      (elt (%3b-swf:strings pool)
                           (1- (%3b-swf:name (elt (%3b-swf:namespaces pool)
                                                  (1- (%3b-swf:ns mn)))))))
     for super = (when super-mn
                   (list (elt (%3b-swf:strings pool)
                              (1- (%3b-swf:name super-mn)))
                         (elt (%3b-swf:strings pool)
                              (1- (%3b-swf:name (elt (%3b-swf:namespaces pool)
                                                     (1- (%3b-swf:ns super-mn))))))))
     do #+=(format t "~%~s~%" i)
       (format t "~s  / ~s~%" (mapcar renamer name) (mapcar renamer super))
     ;;(declare-swf-class (funcall renamer))
       ))

(defun symbol-table-from-tags (taglist &key (inherit *cl-symbol-table*)
                                      (renamer #'rename-swf-symbol ))
  (let ((*symbol-table* (make-instance 'symbol-table :inherit
                                       (list inherit))))
    (loop for tag in taglist
;       repeat 1
       when (typep tag '%swf:do-abc-tag)
       do (symbol-table-from-tag tag renamer)
       )
    *symbol-table*
    )
  )






(defun make-name (name renamer &key (wrap "") (default-package "flash")
                  (external t) (prefix ""))
  (destructuring-bind (&optional n ns) name
    (if name
        (format nil "~a~a~a~a~a~a"
                prefix
                (if (string= ns "") default-package (funcall renamer ns))
                (if external ":" "::")
                wrap (funcall renamer n) wrap)
        "")))

(defun flash-name (name ns)
  (if (and ns (string/= ns ""))
      (format nil "~a::~a" ns name)
      name))

(defun multiname (id pool)
  (let* ((mn (elt (%3b-swf::multinames pool)
                  (1- id))))
    (list (elt (%3b-swf:strings pool)
               (1- (%3b-swf:name mn)))
          (elt (%3b-swf:strings pool)
               (1- (%3b-swf:name (elt (%3b-swf:namespaces pool)
                                      (1- (%3b-swf:ns mn)))))))))

(defun type-string (id pool)
  (unless (numberp id) (format t "type-string = ~s~%" id))
  (if (zerop id)
      "*"
      (apply 'flash-name (multiname id pool))))

(defun constant-value (id pool)
  (let ((v (1- (%3b-swf:value id))))
    (ecase (%3b-swf:kind id)
     ((nil) nil)
     (#x03 (elt (%3b-swf:integers pool) v))
     (#x04 (elt (%3b-swf:unsigned-integers pool) v))
     (#x06 (elt (%3b-swf:doubles pool) v))
     (#x01 (elt (%3b-swf:strings pool) v))

     (#x0b t)
     (#x0a :false)
     (#x0c nil)
     (#x00 :undefined)
     (#x08 (elt (%3b-swf:strings pool)
                (1- (%3b-swf:name (elt (%3b-swf:namespaces pool) v)))))
     (#x16 (elt (%3b-swf:strings pool)
                (1- (%3b-swf:name (elt (%3b-swf:namespaces pool) v)))))
     (#x17 (elt (%3b-swf:strings pool)
                (1- (%3b-swf:name (elt (%3b-swf:namespaces pool) v)))))
     (#x18 (elt (%3b-swf:strings pool)
                (1- (%3b-swf:name (elt (%3b-swf:namespaces pool) v)))))
     (#x19 (elt (%3b-swf:strings pool)
                (1- (%3b-swf:name (elt (%3b-swf:namespaces pool) v)))))
     (#x1a (elt (%3b-swf:strings pool)
                (1- (%3b-swf:name (elt (%3b-swf:namespaces pool) v)))))
     (#x05 (elt (%3b-swf:strings pool)
                (1- (%3b-swf:name (elt (%3b-swf:namespaces pool) v)))))
     )))

(defun return-type (id tag)
  (let ((m (elt (%3b-swf:method-info tag) id)))
    (type-string (%3b-swf:return-type m) (%3b-swf:constant-pool tag))))

(defun arglist (id tag)
  (let ((m (elt (%3b-swf:method-info tag) id))
        (pool (%3b-swf:constant-pool tag)))
    (loop with optional-count = (%3b-swf:option-count m)
         with param-count = (%3b-swf:param-count m)
       with optional-start = (- param-count (or optional-count 0))
       for arg-type in (%3b-swf:param-types m)
       for i from 0
       for name? = (nth i (%3b-swf:param-names m))
       for name = (if name?
                      (elt (%3b-swf:strings pool) (1- name?))
                      (format nil "arg-~a" i))
       for type? = (nth i (%3b-swf:param-types m))
       for value = (when (>= i optional-start)
                     (constant-value (elt (%3b-swf:options m) (- param-count 1 i))
                                  pool))
       when (= i optional-start)
       collect '&optional
       when type?
       do (setf name (list name (type-string type? pool)))
       collect (if value
                   (list name value)
                   name))))

;;; fixme: reorganize the way stuff is written, so we don't need to do
;;; extra work to decide which forms get written with quotes or not in
;;; the final output
;;; (or alternately, build real packages so we can use actual symbols
;;; for the parts that end up as symbols in the output)
(defun qq (s)
  (format nil "\"~a\"" s))

(defun dump-traits (i package class-name pool renamer tag &key static add)
  (destructuring-bind (&optional constants properties methods) add
    (loop for trait in (%3b-swf:traits i)
       for name = (multiname (%3b-swf:name trait) pool)
       when (find #\: (second name))
       do (setf trait nil)
       ;;(format t "drop trait ~s~%" name)
       when (typep trait '%3b-swf:abc-trait-info-slot)
       do (push (list #+nil(make-name name renamer
                                 :default-package package :external nil)
                      (format nil "~a::~a" package (funcall renamer (first name)))
                      :swf-name (qq (apply 'flash-name name))
                      :type (qq (type-string (%3b-swf:type-name trait) pool))
                      :static (qq static)
                      :accessor (if (some 'lower-case-p (first name))
                                    (format nil "~a:.~a"
                                            package
                                            (funcall renamer (first name)))
                                    ;; getting files with fooBar and FOO_BAR
                                    ;; in same class, so try to avoid
                                    ;; clashing on accessors
                                    (format nil "~a::.+~a+"
                                            package
                                            (funcall renamer (first name)))
                                    ))
                properties)

       when (typep trait '%3b-swf:abc-trait-info-constant)
       do (push (list #+nil(make-name name renamer :wrap "+"
                                 :default-package package)
                      (format nil "~a:+~a+" package (funcall renamer (first name)))
                      :swf-name (qq (apply 'flash-name name))
                      :type (qq (type-string (%3b-swf:type-name trait) pool))
                      :value (qq (constant-value (%3b-swf:value trait) pool))
                      :static (qq static))
                constants)

       when (typep trait '%3b-swf:abc-trait-info-method)
       do (push (list (if static
                          (format nil "~a:~a.~a" package
                                  (funcall renamer (first class-name))
                                  (funcall renamer (first name )))
                          (make-name name renamer :default-package package))
                      :swf-name (qq (apply 'flash-name name))
                      :return-type (qq (return-type (%3b-swf::method-id trait) tag))
                      :args (qq (arglist (%3b-swf:method-id trait) tag))
                      :static (qq static))
                methods)

       when (typep trait '%3b-swf:abc-trait-info-getter)
       do (push (list (make-name name renamer
                                 :default-package package :external nil)
                      :swf-name (qq (apply 'flash-name name))
                      :type (qq (return-type (%3b-swf::method-id trait) tag))
                      ;;:get-args (qq (arglist (%3b-swf:method-id trait) tag))
                      :static (qq static)
                      :accessor (format nil "~a:.~a"
                                        package
                                       (funcall renamer (first name))))
                properties)

       ;; assuming for now that there are no properties with only setters
       ;; when (typep trait '%3b-swf:abc-trait-info-setter)

       ;;; fixme: probably should store setter arg types somewhere, in
       ;;; case they don't match the getter return type?

       ;;do (push (list (make-name name renamer
       ;;                         :default-package (second class-name))
       ;;              :swf-name (apply 'flash-name name)
       ;;              :type (return-type (%3b-swf::method-id trait) tag)
       ;;              :set-args (arglist (%3b-swf:method-id trait) tag)
       ;;              :static static)
       ;;        properties)
         )
    (list constants properties methods)))
#+Nil
(defun old-ffi-from-tag (tag renamer &key skip-$)
  (loop with pool = (%3b-swf:constant-pool tag)
     for i in (%3b-swf:instance-info tag)
     for c in (%3b-swf:class-info tag)
     for class-name = (multiname (%3b-swf:name i) pool)
     for super = (unless (zerop (%3b-swf:super-name i))
                   (multiname (%3b-swf:super-name i) pool))
     for (constants properties methods) =
       (dump-traits i class-name pool renamer tag
                    :add (dump-traits i class-name pool renamer tag :static t))
     unless (and skip-$ (find #\$ (second class-name)))
     do #+=(format t "~%~s~%" i)
       ;(format t "~s  / ~s~%" (mapcar renamer name) (mapcar renamer super))
       (format t "  (declare-swf-class ~a (~a)~%" (make-name class-name renamer)
               (make-name super renamer))
       (format t "    :swf-name \"~a::~a\"~%"
               (second class-name) (first class-name))
       (format t "    :constants~%    (~{~a~^~%     ~})~%" constants)
       (format t "    :properties~%    (~{~a~^~%     ~})~%" properties)
       (format t "    :methods~%    (~{~a~^~%     ~})" methods)

       (format t ")~%~%")
     ;;(declare-swf-class (funcall renamer))
       ))

(defun ffi-from-tag (package tag renamer local-types &key skip-$)
  (loop with pool = (%3b-swf:constant-pool tag)
     for i in (%3b-swf:instance-info tag)
     for c in (%3b-swf:class-info tag)
     for class-name = (multiname (%3b-swf:name i) pool)
     for super = (unless (zerop (%3b-swf:super-name i))
                   (multiname (%3b-swf:super-name i) pool))
     for (constants properties methods) =
       (dump-traits i package class-name pool renamer tag
                    :add (dump-traits c package class-name pool renamer tag :static t))
     unless (and skip-$ (find #\$ (second class-name)))
     do #+=(format t "~%~s~%" i)
       ;(format t "~s  / ~s~%" (mapcar renamer name) (mapcar renamer super))
       (format t "  (avm2-compiler::declare-swf-class ~a:~a.~a (~a)~%"
               package
               (funcall renamer (second class-name))
               (funcall renamer (first class-name))
               (or (gethash super local-types)
                   ;; fixme: need to make a flash: package using new naming
                   ;; scheme, and update this to match...
                   (make-name super renamer :prefix "%")))
       (format t "    :swf-name \"~a::~a\"~%"
               (second class-name) (first class-name))
       (format t "    :constants~%    (~:{~:@<~a ~@{~s ~a~^ ~}~:@>~:^~%     ~})~%" constants)
       (format t "    :properties~%    (~:{~:@<~a ~@{~s ~a~^ ~}~:@>~:^~%     ~})~%" properties)
       (format t "    :methods~%    (~:{~:@<~a ~@{~s ~a~^ ~}~:@>~:^~%     ~})" methods)

       (format t ")")
     ;;(declare-swf-class (funcall renamer))
       ))

#+Nil
(defun packages-from-tag (tag renamer &key skip-$)
  (loop with pool = (%3b-swf:constant-pool tag)
     for i in (%3b-swf:instance-info tag)
     for c in (%3b-swf:class-info tag)
     for class-name = (multiname (%3b-swf:name i) pool)
     for super = (unless (zerop (%3b-swf:super-name i))
                   (multiname (%3b-swf:super-name i) pool))
     unless (and skip-$ (find #\$ (second class-name)))
     do
       (format t "(defpackage #:~a~%" (funcall renamer (second class-name)))
       (format t "  (:exports~%   #:~a" (funcall renamer (first class-name)))
       (format t "~{~%   #:~a~}"
               (delete-duplicates
                (sort (append
                       (loop for trait in (%3b-swf:traits i)
                          for name = (multiname (%3b-swf:name trait) pool)
                          unless (find #\: (second name))
                          collect (if (typep trait '%3b-swf:abc-trait-info-constant)
                                      (format nil "+~a+" (funcall renamer (first name)))
                                      (funcall renamer (first name))))
                       (loop for trait in (%3b-swf:traits c)
                          for name = (multiname (%3b-swf:name trait) pool)
                          unless (find #\: (second name))
                          collect (if (typep trait '%3b-swf:abc-trait-info-constant)
                                      (format nil "+~a+" (funcall renamer (first name)))
                                      (funcall renamer (first name)))))
                      #'string<)
                :test #'string=))
       (format t "))~%~%")
     ;;(declare-swf-class (funcall renamer))
       ))

;;; package definition stuff:
;;;  unexported:
;;;    package::foo for actual slot names
;;;  exported:
;;;    +foo+ for constants
;;;    .foo for non-constant slots (methods,slots,getter/setter)
;;;      for the fake accessor things:
;;;        (.foo bar) ~= (slot-value bar 'package::foo) => foo.bar
;;;    foo for methods
;;;      (foo bar) => foo.bar()
;;;    -- separate names for slot accessors and methods, so we can
;;;       do for example (funcall (.foo bar) baz)
;;;       or more usefully
;;;        (add-event-listener foo "enterFrame" (.on-enter-frame foo))
;;;    as3.package.path.foo for class as3.package.path:foo

(defun package-from-tags (package tags renamer &key skip-$)
  (let ((local-types (make-hash-table :test #'equal)))
    (format t "(defpackage #:~a~%" package)
    (format t "  (:use :%flash)~%")
    (format t "  (:export")
    (format
     t "~{~%   #:~a~}"
     (delete-duplicates
      (sort
       (loop for tag in tags
          when (typep tag '%swf:do-abc-tag)
          append
          (loop
             with pool = (%3b-swf:constant-pool tag)
             for i in (%3b-swf:instance-info tag)
             for c in (%3b-swf:class-info tag)
             for class-name = (multiname (%3b-swf:name i) pool)
             for super = (unless (zerop (%3b-swf:super-name i))
                           (multiname (%3b-swf:super-name i) pool))
             unless (and skip-$ (find #\$ (second class-name)))
             collect (format nil "~a.~a"
                             (funcall renamer (second class-name))
                             (funcall renamer (first class-name)))
             and do (setf (gethash class-name local-types)
                          (format nil "~a:~a.~a" package
                                  (funcall renamer (second class-name))
                                  (funcall renamer (first class-name))))
             #+nil
             (format nil ":class ~a (~s)"
                     (funcall renamer (first class-name))
                     (second class-name))
             and append
             (loop with pool = (%3b-swf:constant-pool tag)
                for i in  (%3b-swf:instance-info tag)
                for c in (%3b-swf:class-info tag)
                for class-name = (multiname (%3b-swf:name i) pool)
                for super = (unless (zerop (%3b-swf:super-name i))
                              (multiname (%3b-swf:super-name i) pool))
                append
                (loop for trait in  (%3b-swf:traits i)
                   for name = (multiname (%3b-swf:name trait) pool)
                   unless (find #\: (second name))
                   collect
                     (cond
                       ((typep trait '%3b-swf:abc-trait-info-constant)
                                        ; fixme: not sure if +foo+ is really
                                        ; right for these, since they aren't
                                        ; really globally constant
                        (format nil "+~a+" (funcall renamer (first name))))
                       ((typep trait '%3b-swf:abc-trait-info-method)
                        (funcall renamer (first name)))
                       (t
                        (format nil ".~a"
                                (funcall renamer (first name))))))
                append
                  (loop for trait in (%3b-swf:traits c)
                     for name = (multiname (%3b-swf:name trait) pool)
                     ;do (Format t "static : ~s~%" name)
                     unless (find #\: (second name))
                     collect
                       (cond
                         ((typep trait '%3b-swf:abc-trait-info-constant)
                                        ; fixme: not sure if +foo+ is really
                                        ; right for these, since they aren't
                                        ; really globally constant
                          (format nil "+~a+" (funcall renamer (first name))))
                         ((typep trait '%3b-swf:abc-trait-info-method)
                          (format nil "~a.~a"
                                  (funcall renamer (first class-name))
                                  (funcall renamer (first name ))))
                         (t
                          (format nil ".~a"
                                  (funcall renamer (first name)))))))))
       #'string<)
      :test #'string=))
    (format t "))~%~%")
    local-types))


;; fixme: need to decide what package the generated code should run
;; in, and adjust accordingly (write out full package names, etc)
(defun ffi-from-swc (path symbol-table-name package)
  (multiple-value-bind (lib deps) (3b-swf::read-swc path)
    (declare (ignore deps))
    #++(loop for tag in (getf (cdr lib) :tags)
       ;'repeat 10
       when (typep tag '%swf:do-abc-tag)
       do (packages-from-tag tag #'rename-swf-symbol :skip-$ t))
    (let ((local-types
            (package-from-tags package (getf (cdr lib) :tags)
                               #'rename-swf-symbol :skip-$ t)))

      (format t "(defparameter ~a::~a (make-instance 'avm2-compiler::symbol-table))~%~%" package symbol-table-name)
      (loop for tag in (getf (cdr lib) :tags)
                                        ;repeat 10
         when (typep tag '%swf:do-abc-tag)
         do (format t "(let ((avm2-compiler::*symbol-table* ~a::~a))~%" package symbol-table-name)
           (ffi-from-tag package tag #'rename-swf-symbol
                          local-types :skip-$ t)
           (format t ")~%~%")))
)
)