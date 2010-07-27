(in-package :avm2-asm)

;;;; simple peephole optimizer for avm2 asm, to handle some obvious cases
;;;; of redundant code in the compiler
;;;; ex. (peephole '((:pushnull) (:pop))) -> ()


;;; hash of symbol -> list of lambdas to call to try to optimize forms
;;; starting with that symbol
(defparameter *peephole-patterns* (make-hash-table))

(defun %peephole (forms)
  (let* ((sym (caar forms))
         (funs (gethash sym *peephole-patterns*)))
    (loop for i in funs
       for j = (funcall i forms)
       unless (eql j :keep)
       do (return-from %peephole j))
    :keep))

;; fixme: dropping last instruction sometimes?
(defun peephole (forms)
  "avm2 asm peephole optimizer, pass in list of asm forms, returns
optimized version"
  ;; quick hack peephole optimizer, for simple stuff like pushnull+pop, etc
  ;;  get/setlocal 1
  (loop for i = forms then (if (not (eql j :keep)) j (cdr i))
     for j = (%peephole i)
     while i
     ;;do (format t "i=~s~%  j=~s~%" i j)
     when (eql j :keep)
     collect (car i)))



(defmacro def-peephole (name length args &body body)
  ;; name is symbol or list of symbols to match against car of form
  ;; length = minimum # of forms required for a given pattern
  ;;   fixme: detect pattern length automatically
  ;; args = destructuring lambda list passed the current remaining
  ;;   forms to be assembled, with the addition of nil to mark
  ;;   entries to be ignored when destructuring
  ;;   ex: (nil &rest rest) would get the forms after the current one
  ;;       ((nil arg) &rest rest) would get the same, + arg to the current form
  ;; body = code to run to test/perform peephole pass, returns either new
  ;;   list of forms, or :keep to keep current form
  ;;   (can't return nil, since then we wouldn't be able to get rid of
  ;;    the last form(s) in a set)
  (unless (consp name) (setf name  (list name)))
  (let ((forms (gensym "FORMS-"))
        (arg-syms nil))
    (labels
      ((gensym-nils (list)
         (when list
           (cons (cond
                   ((null (car list))
                    (car (push (gensym "IGNORE-") arg-syms)))
                   ((consp (car list)) (gensym-nils (car list)))
                   (t (car list)))
                 (gensym-nils (cdr list))))))
      `(progn
         ,@(loop
              with iargs = (gensym-nils args)
              with lambda = `(lambda (,forms)
                               ;; we just need to verify there are at
                               ;; least LENGTH elements left in FORMS,
                               ;; so don' calculate full length of
                               ;; FORMS here
                               (when (nthcdr (1- ,length) ,forms)
                                 (destructuring-bind (,@iargs) ,forms
                                   ,@(when arg-syms
                                           `((declare (ignore ,@arg-syms))))
                                   ,@body)))
              for i in name
              collect `(push ,lambda (gethash ',i *peephole-patterns* nil)))))))

;; TODO:
;;   (kill x)+ (returnvalue) -> (returnvalue)
;;      -- (can't do directly, since then it would only get the last kill
;;          need to check rest for more kills and then a returnvalue)
;;   get-local dec set-local -> dec-local

;;; push-*/get-*+ pop -> ()
(def-peephole (:push-null :push-undefined :push-byte :push-short :push-true
                          :push-false :push-nan :push-string :push-int
                          :push-uint :push-double :push-namespace
                          :get-local-0 :get-local-1 :get-local-2 :get-local-3
                          :get-local :new-function) 2 (op next &rest rest)
  (cond
    ((eql :pop (car next))
     (progn #+(or)(format t "drop ~s -> ~s~%" next rest)
            rest))
    ;; todo: more of these
    ((and (eq :coerce-string (car next)) (eq (car op) :push-string))
     (cons op rest))
    (t
     :keep)))

;;; get-local N (N<4) -> get-local-n
(def-peephole :get-local 1 ((nil local) &rest rest)
  (if (< local 4)
      (cons (elt '((:get-local-0) (:get-local-1)
                   (:get-local-2) (:get-local-3)) local)
          rest)
    :keep))

;;; set-local N (N<4) -> set-local-n
(def-peephole :set-local 1 ((nil local) &rest rest)
  (if (< local 4)
      (cons (elt '((:set-local-0) (:set-local-1)
                   (:set-local-2) (:set-local-3)) local)
          rest)
    :keep))

;;; dup setlocal pop -> setlocal
(def-peephole :dup 3 (nil next pop &rest rest)
  (if (and (eql (car pop) :pop)
           (member (car next) '(:set-local-0 :set-local-1 :set-local-2
                                :set-local-3 :set-local)))
      (cons next rest)
      :keep))

;;; new-object 0 + pop -> () ;; (mostly unused exit points)
(def-peephole :new-object 2 ((nil count) pop &rest rest)
  (if (and (eql (car pop) :pop)
           (zerop count))
      rest
      :keep))

;;; call-prop + pop -> call-prop-void
(def-peephole :call-property 2 ((nil dest count) pop &rest rest)
  (if  (eql (car pop) :pop)
       (cons (list :call-prop-void dest count) rest)
       :keep))


;;; less-than/greater-than/equals + if-true/if-false -> if-lt/etc
;;; fixme: generalize/combine these
(def-peephole :less-than 2 (nil next &rest rest)
  (cond
    ((eql :if-true (car next))
     (cons `(:if-lt ,@(cdr next)) rest))
    ((eql :if-false (car next))
     (cons `(:if-nlt ,@(cdr next)) rest))
    (t :keep)))

(def-peephole :greater-than 2 (nil next &rest rest)
  (cond
    ((eql :if-true (car next))
     (cons `(:if-gt ,@(cdr next)) rest))
    ((eql :if-false (car next))
     (cons `(:if-ngt ,@(cdr next)) rest))
    (t :keep)))

(def-peephole :equals 2 (nil next &rest rest)
  (cond
    ((eql :if-true (car next))
     (cons `(:if-eq ,@(cdr next)) rest))
    ((eql :if-false (car next))
     (cons `(:if-ne ,@(cdr next)) rest))
    (t :keep)))

(def-peephole :strict-equals 2 (nil next &rest rest)
  (cond
    ((eql :if-true (car next))
     (cons `(:if-strict-eq ,@(cdr next)) rest))
    ((eql :if-false (car next))
     (cons `(:if-strict-ne ,@(cdr next)) rest))
    (t :keep)))

;;; jump1 jump2 -> jump1
(def-peephole :jump 2 (this next &rest rest)
  (if (and (eql (car next) :jump))
      (cons this rest)
      :keep))

;;; iffalse-x jump dlabel-x -> iftrue
(def-peephole :if-false 3 (this next label &rest rest)
  (if (and (eql (car next) :jump)
           (eql (car label) :%dlabel)
           (eq (second this) (second label)))
      (list* (list :if-true (second next)) rest)
      :keep))


;;; iffalse-x push pop jump dlabel-x -> iftrue
(def-peephole :if-false 5 (this push pop next label &rest rest)
  (if (and (eql (car next) :jump)
           (eql (car label) :%dlabel)
           (eql (car pop) :pop)
           (eq (second this) (second label))
           (member (car push)
                   '(:push-null :push-undefined :push-byte :push-short
                     :push-true :push-false :push-nan :push-string :push-int
                     :push-uint :push-double :push-namespace
                     :get-local-0 :get-local-1 :get-local-2 :get-local-3
                     :get-local :new-function)))
      (list* (list :if-true (second next)) rest)
      :keep))



;;; if-true-x jump dlabel-x -> if-false
;;; fixme: track how many jumps go to a label so this can be reenabled
;;--- not valid if there are other jumps to the dlabel
#++(def-peephole :if-true 3 (this next label &rest rest)
  (if (and (eql (car next) :jump)
           (eql (car label) :%dlabel)
           (eq (second this) (second label)))
      (list* (list :if-false (second next)) rest)
      :keep))


;;; if-true-x push pop jump dlabel-x -> if-false
;;; fixme: track how many jumps go to a label so this can be reenabled
;;--- not valid if there are other jumps to the dlabel
#++(def-peephole :if-true 5 (this push pop next label &rest rest)
  (if (and (eql (car next) :jump)
           (eql (car label) :%dlabel)
           (eql (car pop) :pop)
           (eq (second this) (second label))
           (member (car push)
                   '(:push-null :push-undefined :push-byte :push-short
                     :push-true :push-false :push-nan :push-string :push-int
                     :push-uint :push-double :push-namespace
                     :get-local-0 :get-local-1 :get-local-2 :get-local-3
                     :get-local :new-function)))
      (list* (list :if-false (second next)) rest)
      :keep))

;; hack to allow comments in generated asm
(def-peephole :comment 1 (nil &rest rest)
  rest)

;; fixme: move interning into the assembler so we can peephole push-int
;; into push-byte or push-short if applicable

#+ (or)
(format t "~s~%"
        (peephole `((get-local 1) (pop) ;; -> nil
                    (set-local 1) ;; -> (set-local-1)
                    (set-local 5)
                    (equals) (if-false) ;; -> (if-ne)
                    (less-than) (if-true) ;; -> (if-lt)
                    (push-null) (pop))))  ;; -> nil


;; todo: :get-local push_int 1 add dup coerce-any set-local -> inclocal getlocal
;; todo: :get-local push_int 1 add dup coerce-int set-local -> inclocal_i getlocal
