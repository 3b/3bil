(in-package :as3-asm)

;;;; simple peephole optimizer for as3 asm, to handle some obvious cases
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


(defun peephole (forms)
  "as3 asm peephole optimizer, pass in list of asm forms, returns
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
                               (when (>= (length ,forms) ,length)
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
;;


;;; push-*/get-*+ pop -> ()
(def-peephole (:push-null :push-undefined :push-byte :push-short :push-true
                          :push-false :push-nan :push-string :push-int
                          :push-uint :push-double :push-namespace
                          :get-local-0 :get-local-1 :get-local-2 :get-local-3
                          :get-local) 2 (nil next &rest rest)
  (if (eql :pop (car next))
      (progn #+(or)(format t "drop ~s -> ~s~%" next rest)
             rest)
      :keep))

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