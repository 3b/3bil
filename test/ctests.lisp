(in-package :avm2-compiler)

;;; trying to set up something resembling automated regression tests,
;;; with minimum effort to write a test...


(defparameter *side-effect-fun* nil)

(defmacro def-tests (name (&key) &body tests)
  (let ((good (gensym "good"))
        (bad (gensym "bad"))
        (errors (gensym "err"))
        (side (gensym "side"))
        (calls '((call0 (f)
                  (let ((r (funcall f))) (side-effect r r)))
                 (call (f a)
                  (let ((r (funcall f a))) (side-effect r r)))
                 (call2 (f a b)
                  (let ((r (funcall f a b))) (side-effect r r)))
                 (call3 (f a b c)
                  (let ((r (funcall f a b c))) (side-effect r r)))
                 (call4 (f a b c d)
                  (let ((r (funcall f a b c d))) (side-effect r r)))
                 (call^2 (f a b)
                  (let ((r (funcall (funcall f a) b))) (side-effect r r)))
                 )))
    `(c3 ,name
         (let* ((,side ())
                (*side-effect-fun* (lambda (&rest a)
                                     (push a ,side)
                                     (if (> (length a) 0)
                                         (car (last a))
                                         0))))
           (flet ((reset-side-effects ()
                    (setf ,side ()))
                  (get-side-effects ()
                    ,side))
             `(let ((,',good 0)
                    (,',bad 0)
                    (,',errors 0))
               (labels ,',calls
                 (macrolet ((test (tname form &optional result sides)
                              `(progn
                                 (reset-side-effects)
                                 (setf (flash:.text (running (app)))
                                       (s+ "run:" ,tname))

                                 (let ((res)
                                       (err))
                                   (handler-case
                                       (setf res ,form)
                                     (t (e) (setf err e)))
                                   (cond
                                     (err
                                      (incf ,',',errors)
                                      (mark-error ,tname err))
                                     ((and (match res ,result)
                                           (match (reverse (get-side-effects))
                                                  ,sides))
                                      (mark-pass ,tname res)
                                      (incf ,',',good))
                                     (t (mark-fail ,tname res ,result
                                                   (reverse (get-side-effects))
                                                   ,sides)
                                        (incf ,',',bad)))))))

                   ,,@(loop for i in tests
                         for string = (let ((*print-circle* t)) (format nil "~s" i))
                         if (and (consp i) (eq (car i) 'test))
                         collect `(quote ,i)
                         else
                         collect
                         `(progn
                            (locally (declare #+sbcl(sb-ext:muffle-conditions
                                                     sb-ext:compiler-note))
                              (labels ,calls
                                (reset-side-effects)
                                (let ((res ,i))
                                  `(test ,',string ,',i ',res
                                         ',(reverse (get-side-effects)))))))
                         )

                   (ftrace (s+ ,',name ": passed=" ,',good "  failed=" ,',bad " errored=" ,',errors))
                   (s+ "test " ,',name ": " ,',good " passed, " ,',bad " failed, " ,',errors " errored")

                   )))))
         ))
  )


(defmacro def-tests-t (name (&key) &body tests)
  ;; don't bother running tests on host, just assert the return T
  (let ((good (gensym "good"))
        (bad (gensym "bad"))
        (errors (gensym "err"))
        (side (gensym "side"))
        (calls '((call0 (f)
                  (let ((r (funcall f))) (side-effect r r)))
                 (call (f a)
                  (let ((r (funcall f a))) (side-effect r r)))
                 (call2 (f a b)
                  (let ((r (funcall f a b))) (side-effect r r)))
                 (call3 (f a b c)
                  (let ((r (funcall f a b c))) (side-effect r r)))
                 (call4 (f a b c d)
                  (let ((r (funcall f a b c d))) (side-effect r r)))
                 (call^2 (f a b)
                  (let ((r (funcall (funcall f a) b))) (side-effect r r)))
                 )))
    `(c3 ,name
         (let* ((,side ())
                (*side-effect-fun* (lambda (&rest a)
                                     (push a ,side)
                                     (if (> (length a) 0)
                                         (car (last a))
                                         0))))
           (flet ((reset-side-effects ()
                    (setf ,side ()))
                  (get-side-effects ()
                    ,side))
             `(let ((,',good 0)
                    (,',bad 0)
                    (,',errors 0))
               (labels ,',calls
                 (macrolet ((test (tname form &optional sides)
                              `(progn
                                 (reset-side-effects)
                                 (setf (flash:.text (running (app)))
                                       (s+ "run:" ,tname))

                                 (let ((res)
                                       (err))
                                   (handler-case
                                       (setf res ,form)
                                     (t (e) (setf err e)))
                                   (cond
                                     (err
                                      (incf ,',',errors)
                                      (mark-error ,tname err))
                                     ((and res
                                           (match (reverse (get-side-effects))
                                             ,sides))
                                      (mark-pass ,tname res)
                                      (incf ,',',good))
                                     (t (mark-fail ,tname res T
                                                   (reverse (get-side-effects))
                                                   ,sides)
                                        (incf ,',',bad)))))))

                   ,,@(loop for i in tests
                         for string = (let ((*print-circle* t)) (format nil "~s" i))
                         if (and (consp i) (eq (car i) 'test))
                         collect `(quote ,i)
                         else
                         collect
                         `(progn
                            (locally (declare #+sbcl(sb-ext:muffle-conditions
                                                     sb-ext:compiler-note))
                              (labels ,calls
                                (reset-side-effects)
                                `(test ,',string ,',i
                                       ',(reverse (get-side-effects))))))
                         )

                   (ftrace (s+ ,',name ": passed=" ,',good "  failed=" ,',bad " errored=" ,',errors))
                   (s+ "test " ,',name ": " ,',good " passed, " ,',bad " failed, " ,',errors " errored")

                   )))))
         ))
  )

(defun s+ (&rest a)
  (format nil "~{~a~}" a))
(defun ftrace (&rest a)
  (format t "~{~a~}~%" a))
(defun side-effect (&rest a)
  (if *side-effect-fun*
      (apply *side-effect-fun* a)
      (error "test stuff broken? no side effect function")))
(defun x0 ()
  (side-effect 'x0 'x0))
(defun x1 (x)
  (side-effect 'x1 x)
  (side-effect 'x x))
(defun x (x r)
  (side-effect 'x r)
  (side-effect x r))
(defun y (x r)
  (side-effect 'y r)
  (side-effect x r))
(defun z (x r)
  (side-effect 'z r)
  (side-effect x r))

(with-open-file (s "/tmp/ctests.swf"
                   :direction :output
                   :element-type '(unsigned-byte 8)
                   :if-exists :supersede)
  (3b-swf:write-swf
   s
   (append
    (list
     (3b-swf:file-attributes :has-metadata t :as3 t :use-network t
                             :use-gpu t :direct-blit t)
     (3b-swf:script-limits 60 1000)
     (3b-swf:background-color #x869ca7)
     (3b-swf:frame-label "frame1"))


    (compile-abc-tag (((nil :test-class)) :tree-shaker-roots nil)

      (c3* :setup
        (defclass-swf :test-class (flash:flash.display.sprite)
          (blob
           side-effects
           running
           text
           (.app :allocation :class) )
          (:fake-accessors t)
          (:constructor ()
            (setf (side-effects this) nil)
            (%set-property-static :test-class .app this)
            (main this)))

        (defun app ()
          (%get-property-static :test-class .app))

        (defun ftracef (x &arest args)
          (flash:trace x)
          (flash:trace (+ "=>" (flash:apply x nil args))))

        #++
        (defun baz (&arest x)
          (if (< (random 2) 1) t nil))

        #++
        (defun foo (&arest x)
          (ftrace (+ "foo called : " x))
          (aref x 0))
        #+++
        (defun hoge (&arest x)
          (ftrace (+ "hoge called : " x))
          (aref x 0))

        #++(defun x (&arest x)
             (ftrace (+ "global X called : " x))
             (aref x 0))
        #++(defun y (&arest x)
             (ftrace (+ "global Y called : " x))
             (aref x 0))

        (defun side-effect (&arest a)
          (push (loop for i across a
                   ;;do (ftrace i)
                   collect i)
                (side-effects (app)))
          #++(ftrace (list->str
                      (loop for i across a
                         collect i)))
          (if (> (length a) 0)
              (aref a (1- (length a)))
              0))
        (defun reset-side-effects ()
          (setf (side-effects (app)) nil))
        (defun get-side-effects ()
          (side-effects (app)))
        (defun write-text (c)
          (setf (flash:.text (text (app)))
                (s+ (flash:.text (text (app))) c)))

        (defun list->str (l)
          (if (atom l)
              (if l (flash:to-string l) l)
              (let ((s "("))
                (tagbody
                 :start
                   (incf s (list->str (car l)))
                   (setf l (cdr l))
                   (cond
                     ((null l) (go :end))
                     ((consp l)
                      (incf s " ")
                      (go :start))
                     (t
                      (incf s (+ " . " l))
                      (go :end)))
                 :end)
                (+ s ")"))))

        (defun match (a b)
          (equal a b))
        (defun mark-pass (name res)
          (write-text ".")
          (setf (flash:.text (running (app))) "")
          #++(ftrace (s+ "pass: " name " = " (if (consp res) (list->str res) res))))
        (defun mark-error (name err)
          (write-text "e")
          (setf (flash:.text (running (app))) "")
          (ftrace (s+ "error: " name " = " err))
          (when (%typep err flash:error)
            (ftrace (s+ " >> " (flash:get-stack-trace err)))))
        (defun mark-fail (name res good side good-side)
          (write-text "!")
          (setf (flash:.text (running (app))) "")
          (ftrace (s+ "fail: " name " = " (if (consp res) (list->str res) res)
                      " expected " (if (consp good) (list->str good) good)))
          (when (or side good-side)
            (ftrace (s+ "    : side effects " (list->str side)
                        " expected " (list->str good-side)))))
        ;; defun with side effects for tests to scoping
        (defun x0 ()
          (side-effect 'x0 'x0))
        (defun x1 (x)
          (side-effect 'x1 x)
          (side-effect 'x x))
        (defun x (x r)
          (side-effect 'x r)
          (side-effect x r))
        (defun y (x r)
          (side-effect 'y r)
          (side-effect x r))
        (defun z (x r)
          (side-effect 'z r)
          (side-effect x r))
        )
      (def-tests "foo" ()
        ;; tests
        (+ 1 2)
        (+ (side-effect 1 1) 2)
        'foo
        '1
        'a
        '(1 2)
        '(1 . 2)
        #(1 2)
        '#(1 2)
        (atom 1)
        (atom 'a)
        (atom "foo")
        (atom '(1 2))
        (atom nil)
        (vector 1 2)
        (equal 1 1)
        (equal nil nil)
        (equal t t)
        (equal "foo" "foo")
        (equal "foo" "bar")
        (equal '(1 2) '(1 2))
        (equal '(1 2) '(1 3))
        (equal '(1) '(1 3))
        (equal '(1 2) '(1))
        (equal '(1 . 2) '(1 . 2))
        (progn 1)
        (progn 1 2 3)
        (+ 2 3)
        (if (< 1 2 3) '< '>=)
        (if (< 2 1 3) '< '>=)
        (when 1 'a)
        (unless 1 'b)
        (when nil 'e)
        (unless nil 'f)
        (and 0 0)
        (and (not 0) (not 0))
        (and 0 t)
        (and (not 0) (not nil))
        (and "" t)
        (and (not "") (not nil))
        (and "0" t)
        (and (not "0") (not nil))

        (car nil)
        (cdr nil)
        (if (car nil) "t" "f")
        (progn (progn 1 2) 'a (+ 2 3) (progn 3))
        (let ((a 1)) a)
        (tagbody foo (go baz) baz)
        (tagbody 1 (go 2) 2)
        (symbol-macrolet ((a 'foo)) a)
        (symbol-macrolet ((a (side-effect 1231 234))) (+ a 1))
        (flet (((setf foo) (v a)
                 (side-effect a v) v))
          (symbol-macrolet ((a (foo 123))) (setq a 1)))

        (flet (((setf foo2) (v a b)
                 (side-effect a v)
                 (side-effect b v)
                 v))
          (symbol-macrolet ((a (foo2 123 456)))
            (let ((b 2)) (setq a 1 b 3))))

        (macrolet ((x (a) `(list ,a))) (x 1232))
        (macrolet ((x (a) (return-from x (list 'list 234 a)) `(list ,a))) (x 123))
        (setq)
        (let ((a 2)) (setq a 1))
        (symbol-macrolet ((x 'foo)) (list x (let ((x 'bar)) x)))
        (block x (return-from x))
        (block x (return-from x 123))
        :here1
        (let ((x (block x (+ 1 2) (return-from x 123)))) x)
        (let ((x (+ 1 2 3))) x)
        (let ((x (progn (+ 1 2) (side-effect 3 4) (+ 3 4)))) x)
        "foo"
        (labels ((x (a) (list a))) (x 1233))
        (flet ((x (a) (list a))) (x 1234))
        :here2
        (flet ((x (a) (return-from x (+ a 1)))) (x 123))
        (flet ((x (a) (return-from x 111) (list a))) (x 1235))
        :labels
        (labels ((x (a) (z a))
                 (y (a) (+ a 7000))
                 (z (a) (+ (y a) 80000)))
          (x 654))

        (flet ((a (b) (+ b 1)))
          (defun cc (v)
            (a v))
          1)
        (cc 1)
        (progn
          (let ((a 1))
            (defun cc1 (v)
              (incf a v))
            a)
          (cc1 1))
        (let ((l ()))
          (labels ((a (b)
                     (push (+ b 1) l)
                     (+ b 1))
                   (b (b)
                     (a b)))
            (let ((c 1))
              (defun cc2 (v)
                (b v)))
            1)
          (cc2 1)
          )
        :loop
        (loop
           for (a . b) on '(1 2)
           for (i . j) on '(1 2)
           do (side-effect a b i j)
           finally (side-effect a b i j))
        (loop
           for (a . b) on '(1 2)
           for (i . j) on '(1)
           do (side-effect a b i j)
           finally (side-effect a b i j))
        (loop
           for (a . b) on '(1)
           for (i . j) on '(1 2)
           do (side-effect a b i j)
           finally (side-effect a b i j))
        (loop
           for (a . b) on '(1 2)
           for (i . j) on '(1 2)
           always (= a i)
           do (side-effect a b i j)
           finally (side-effect a b i j))
        (loop
           for (a . b) on '(1 2)
           for (i . j) on '(1)
           always (= a i)
           do (side-effect a b i j)
           finally (side-effect a b i j))
        (loop
           for (a . b) on '(1)
           for (i . jjj) on '(1 2)
           always (= a i)
           do (side-effect a b i jjj)
           finally (side-effect a b i jjj))
        :flet
        (x0)
        (flet ((x1 (a b) (x0)))
          (x1 1234 567))

        (call (function (lambda (x) (+ x 1))) 1000)
        (call2 (function x) 1001 4)
        (call (labels ((x (a) (if (zerop a) 0 (list (y a))))
                       (y (a) (x (1- a))))
                (function x)) 3)
        (call (labels ((x (a) (+ (z a))) (y (a) a) (z (a) (+ (y a)))) (function x)) 1002)
        (if t 1 2)
        (let ((a (if (x 1 t) 1 2))) a)
        (let ((a (if (x 2 nil) 1 2))) a)
        (catch 111 (throw 111 'thrown-111))
        ;; fixme: intern symbols
        ;;(catch 'a (throw 'a 'thrown-a))
        ;;(catch 'a (throw 'b 'thrown-a)) ;; uncaught exception
        (let ((a (catch '123 (throw '123 'thrown-123)))) a)
        (tagbody (x (+ 1 2 (go foo) 3 4) 123) (go bar) foo (side-effect "went to foo" t) bar)
        (tagbody (x (+ 1 2 (if (x 1 t) 3 (go foo)) 4 5) nil)
           (go bar) foo
           (side-effect "went to foo") bar)
        (tagbody (x (+ 1 2 (if (x nil nil) 3 (go foo)) 4 5) nil)
           (go bar) foo
           (x "went to foo" 1) bar)
        :here3
        (let ((a 1)) (flet ((x1 (b) (+ a b))) (x1 10)))
        ;;?;(call2 (let ((a 1) (b 10)) (lambda (a c) (+ a b c))) 100 1000)
        (let ((a 1) (b 10))
          (flet ((x (a c) (+ a b c)))
            (x 100 1000)))
        :return-from
        (+ 1 (block xxfoo (flet ((bar () (return-from xxfoo 100) 1000)) (bar) 10000)) 2)
        (call (let ((x 1)) (lambda (y) (+ x y))) 1234)
        (call^2 (lambda (a) (lambda (b) (+ a b))) 1234 2344)
        ;;?;(call^2  (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))) 2345 234)
        ;;
        (call (lambda (a) (tagbody (let ((j 12300)) (lambda (b) (+ a b j)))))
              12345)
        (call (funcall
               (lambda (a)
                 (let ((k 12301))
                   (let ((j 1))
                     (let ((l k))
                       (lambda (b) (+ a b j)))))) 12302) 456)
        (call (lambda (a) (tagbody
                             (let ((k 12303))
                               (let ((j 1))
                                 (let ((l k))
                                   (lambda (b) (+ a b j))))))) 2345)
        (call (lambda (a) (tagbody foo
                             (let ((k 12304))
                               (let ((j 1))
                                 (let ((l k))
                                   (lambda (b)
                                     (if (zerop a)
                                         (go bar)
                                         (+ a b j)))))) bar)) 15423)
        :return-from2
        (call (flet ((x1 (a) (list (y (return-from x1 100) a)))
                     (y (a) (x1 a))) #'x1) 1)
        (block x (call (lambda (a) (return-from x (+ a 100)) 10) 1))
        (call (labels ((x (a) (+ (y (lambda (x) (side-effect 1 1)
                                            (return-from x (+ a x))))
                                 1000))
                       (y (a) (funcall a 10) 1)) #'x) 1)
        (call (lambda (a) (lambda (x) (+ x a)) a) 12)
        (call0 (lambda () (tagbody foo (go bar) bar
                             (lambda () (side-effect 1 1) (go foo)))))

        (tagbody 1 (lambda (x) (side-effect x 1) (go 1)))
        :nlx
        (tagbody nlx 1 (flet ((x () (go 2))) (x)) (side-effect "bug!" "foo") 2)
        (call (lambda (x) (block blah 1)) 101)
        (call (lambda (x) (block blah 1)) 102)
        (call (lambda (x) (block blah (block baz (return-from blah 2)))) 103)
        (call (lambda (x) (block baz (block blah (funcall (lambda (x) (return-from blah 2) 12) 23)))) 123)
        (block x0
          (progn 1 2)
          (block piyo
            (progn 1
                   (x0)))
          (progn (x 4 5) 3)
          (return-from x0 1))
        :return-from-3
        (labels ((aaa (f c)
                   (side-effect (s+ "enter" c) 2)
                   (if (< 10 c)
                       (funcall f)
                       (if f
                           (aaa f (1+ c))
                           (aaa (lambda () (return-from aaa 123)) (1+ c))))
                   (side-effect (s+ "exit " c) 9)))
          (aaa nil 0))
        :exit-extent
        (block ex1 (unwind-protect (return-from ex1 1)
                     (return-from ex1 2))) ;;=> 2
        (block a (block b (unwind-protect (return-from a 1) (return-from b 2)))) ;; 2
        (catch nil (unwind-protect (throw nil 1) (throw nil 2))) ;; 2
        (catch 111 (catch 222 (unwind-protect (throw 111 1) (throw 222 2)))) ;; 2
        :exit-extent4
        (catch 111
          (x1 (s+ "inner catch = "
                  (catch 111
                    (unwind-protect (throw 111 "first")
                      (throw 111 "second")))))
          :outer) ;; print second, return outer
        (catch 111
          (catch 222
            (unwind-protect (1+ (catch 111 (throw 222 1)))
              (throw 111 10)))) ;; 10
        (catch 111
          (catch 222
            (unwind-protect (throw 111 3)
              (throw 222 4)
              (side-effect "xxx" "xxx")))) ;;return 4, don't print xxx
        (catch 111
          (catch 222
            (unwind-protect (throw 222 3)
              (throw 111 4)
              (side-effect "xxx" "xxx")))) ;; return 4, don't print xxx
        (block nil
          (let ((x 5))
            (unwind-protect (return-from nil)
              (side-effect "x=" x)))) ;; print 5, return nil

        :here5
        (tagbody a (unwind-protect (go b) (x1 "unwinding")) b)
        (+ 1 (block x (return-from x 2)) 3)
        (tagbody (+ 1 (go 2) 3) 2)
        ;; setf functions
        :flet-setf
        (flet (((setf foo) (a b c d) (s+ a b c d)))
          (setf (foo 1 2 3) 4))
        (labels (((setf foo) (a b c d) (s+ a b c d))
                 (bar () (setf (foo "a" "b" "c") "d")))
          (bar))
        (call4 (flet (((setf foo) (a b c d) (s+ a b c d)))
                 (function (setf foo))) 1 2 3 4)
        ;; fix: ensure compatible types of branches/jumps when no dest type
        (if t 1 "2")
        :fixme
        (let ((ababab 1))
          (flet ((bbbaaa () (incf ababab)))
            (side-effect (s+ "bb:" (bbbaaa)" " (bbbaaa)" " (bbbaaa)) 123)))
        (call0 (let ((a 2)) (flet ((b () a)) (function b))))
        :done
        "top level")

      (def-tests "more-tests" ()
        (if 1 'a) ;; compile error
        ((lambda () (side-effect "foo")))
        (dotimes (i 10)
          (side-effect (s+ "  i = " i)))
        #++(ftrace (bleh))
        ;;(ftrace (setf (:to-string 1) 4))
        ;;(ftrace (setf (baz 1) 4))
        #++(ftrace (setf (foo 1 2 3) 4))
        (progn
          (defun defun-test (a)
            (side-effect (s+ "defun-test called, arg=" a))
            (+ a 1000))
          nil)
        (defun-test 234)
        (progn
          (defun defmacro-test-1 (a b)
            (side-effect a b)
            (+ a b 1000))
          nil)
        (progn
          (defmacro defmacro-test (a1)
            `(defmacro-test-1 ,a1 ,(* a1 10)))
          nil)
        (test "(defmacro-test 5 " (defmacro-test 5) 1055 '((5 50)))
        (ftrace :defun-setf)
        (defun (setf hoge) (value x y)
          (side-effect "setf-hoge " value " " x " " y)
          value)
        (setf (hoge 1 2) 3)
        (setf (aref (vector 1 2 3) 2) 4)
        (let ((a (vector 1 2 3)))
          (setf (aref a 1) "a")
          a)
        (+ 1 (block xxfoo2 (flet ((bar () (return-from xxfoo2 100) 1000)) (bar) 10000)))
        (+ (block xxfoo3 (flet ((bar () (return-from xxfoo3 100) 1000)) (bar) 10000)) 1)
        (< 1 (block xxfoo3 (flet ((bar () (return-from xxfoo3 100) 1000)) (bar) 10000)))
        "let*"
        (let ((a 9876))
          (let* ((a a))
            a))
        "more tests"

        (LET ((A (list 1 2 3 4 5 6)))
          (setf (second a) 'a)
          a)

        (LET ((A (list 1 2 3 4 5 6)))
          (setf (third a) 'a)
          a)

        (LET ((A (list 1 2 3 4 5 6)))
          (setf (fourth a) 'a)
          a)

        (LET ((A (list 1 2 3 4 5 6)))
          (setf (fifth a) 'a)
          a)

        (LET ((A (list 1 2 3 4 5 6)))
          (push 'a (sixth a))
          a)

        (LET ((A (list 1 (list 1 2 3 4 5 6 7 8) 3 4 5 6)))
          (setf (getf (second a) 3) 'a)
          a)

        (LET ((A (list 1 (list 1 2 3 4 5 6 7 8) 3 4 5 6)))
          (setf (getf (cddr (getf a 1)) 5) 'a)
          a)

        (LET ((A (list 1 (list 1 2 3 4 5 (list 1 2 3 4) 7 8) 3 4 5 6)))
          (remf (getf (cddr (getf a 1)) 5) 1)
          a)
        )


      (def-tests "expected-fail" ()
        ;; -- comparison operators, interning
        (eq :foo :foo)
        (eql :foo :foo)
        (equal "2" 2)
        ;; -- 'falsy' values
        (when 0 'c)
        (unless 0 'd)
        (when "" 'c)
        (unless "" 'd)
        ;; -- let* bindings in wrong order?
        (let* ((x (progn (+ 1 2) (side-effect 3 4) (+ 3 4))) x) x)

        )

      (def-tests "expected error" ()
        ;; probably should distinguish between tests that should fail, and tests
        ;; that currently fail but shouldn't...
        ;;--
        ;; shouldn't error
        ;;  -- no (setf car) yet
        (setf (car (cons 1 2)) 3)
        ;;  -- need %type-of
        ;; -- need proper types
        (typecase 123
          (cons "-cons-")
          (integer "-:int-")
          (otherwise "-t-"))
        (let ((cc (cons 1 2)))
          (typecase cc
            (cons "-cons-")
            (integer "-:int-")
            (otherwise "-t-")))

        ;;--
        ;; should error
        (test "" (throw 'a 1) ) ;; uncaught exception
        (test "" (funcall (block nil #'(lambda () (return-from nil)))))
        (test "" (let ((a nil))
                   (tagbody t (setq a #'(lambda () (go t))))
                   (funcall a)))
        (test "" (funcall (block nil
                            (tagbody a (return-from nil
                                         #'(lambda () (go a)))))))


        )

      (def-tests "verify-error" ()
        (loop for i below 10
           when (oddp i)
           collect i))

      #++
      (def-tests "can't/shouldn't-compile" ()
        (test "" (return-from a 1)) ;; error
        ;; should be compiler error
        (let ((x (progn (+ 1 2) (side-effect 1 2) (+ 3 4))) x))

        )

      (def-tests "bad-abc" ()
                                        ;:a
                                        ;(let ((a (catch '123 (throw '123 'thrown-123)))) a)
                                        ;(tagbody (x (+ 1 2 (go foo) 3 4) 123) (go bar) foo (side-effect "went to foo" t) bar)
        #++(tagbody (x (+ 1 2 (if (x 1 t) 3 (go foo)) 4 5) nil)
              (go bar) foo
              (side-effect "went to foo") bar)
        #++(tagbody (x (+ 1 2 (if (x nil nil) 3 (go foo)) 4 5) nil)
              (go bar) foo
              (x "went to foo" 1) bar)
                                        ;:here3
        #++(let ((a 1)) (flet ((x1 (b) (+ a b))) (x1 10)))
        #++(call2 (let ((a 1) (b 10)) (lambda (a c) (+ a b c))) 100 1000)

        #++(let ((a 1) (b 10))
             (flet ((x (a c) (+ a b c)))
               (x 100 1000)))
                                        ;:return-from
        (+ 1 (block axfoo (flet ((bar () (return-from axfoo 100) 1000)) (bar) 10000)) 2)

                                        ;(call (let ((x 1)) (lambda (y) (+ x y))) 1234)
        (call^2 (lambda (a) (lambda (b) (+ a b))) 1234 2344)
        (call^2  (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))) 2345 234)
        ;;
        #++(call (lambda (a) (tagbody (let ((j 123)) (lambda (b) (+ a b j)))))
                 12345)

        ;;
        )
      (def-tests "bad1-abc" ()
        (call^2 (lambda (a) (lambda (b) (+ a b))) 1234 2344)
        #++(call^2  (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))) 2345 234))
      (def-tests "bad2-abc" ()
        #++(call^2 (lambda (a) (lambda (b) (+ a b))) 1234 2344)
        (call^2  (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))) 2345 234))

      (let ((*ir1-dump-asm* nil))
        (def-tests "bad3-abc" ()
          (progn (ftrace "b3") nil)
          (call^2 (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))) 2345 234)
          (call^2 (lambda (a) (lambda (b) (+ a b))) 1234 2344))
        )

      #++(c3* "bad4-abc"
        (ftrace "bad4-abc")
        (labels ((call^2 (f a b)
                   #++(let ((r (funcall (funcall f a) b)))
                     #++(side-effect r r))))
          (progn;handler-case
              (progn
                (call^2 (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))) 2345 234)
                (call^2 (lambda (a) (lambda (b) (+ a b))) 1234 2344))
            #++(t (e) (ftrace "foo!")))))

      #+-(c3* "bad4-abc"
        (ftrace "bad4-abc")
        (labels ((call^2 (f a b)
                   #++(let ((r (funcall (funcall f a) b)))
                        #++(side-effect r r))))
          (let ((f1 (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))) 2345 234 ))
            (call^2 f1)
            (call^2 (lambda (a) (lambda (b) (+ a b))) 1234 2344))
          #++(t (e) (ftrace "foo!"))))
      (c3* "bad4-abc"
        (ftrace "bad4-abc")
        (labels ((call^2 (f a b)
                   (declare (foo))
                   #++(let ((r (funcall (funcall f a) b)))
                        #++(side-effect r r))))
          (call^2 (lambda (a) (lambda () 1)) 876 543)
          (call^2 (lambda (a) (lambda () 1)) 987 654)
          #++(t (e) (ftrace "foo!"))))

      (def-tests "old-tests" ()
        (cons 2 3)
        (car (cons 2 3))
        (cdr (cons 2 3))
        (case (car (cons 2 4))
          (1 "1")
          (2 "2")
          (3 "3")
          (otherwise "t"))
        (case (cdr (cons 2 4))
          (1 "1")
          (2 "2")
          (3 "3")
          (otherwise "t"))
        (block foo
          1
          (if t (return-from foo "ret"))
          2)
        (let* ((s2 "<")
               (s3 (block foo
                     (unwind-protect
                          (progn
                            (return-from foo "-ret-")
                            "bleh")
                       (setf s2 (s+ s2 123))))))
          (s+ s2 s3 ">"))
        (let* ((a (cons 2 3))
               (b (cons 1 a)))
          (rplaca (cdr b) 123)
          (s+ "(" (car a) " " (car b) ")"))
        (flet ((foo (a b c) (s+ a b c)))
          (foo (flet ((afoo (a b c)
                        (s+ a b c)))
                 (afoo "a" "b" "c"))
               "d" "e" ))
        (when t "-t-")
        (when nil "-t-")
        (unless t "-t-")
        (unless nil "-t-")
        (and)
        (and "t")
        (and "t" nil)
        (and nil "t")
        (and "t1" "t2")
        (or)
        (or "t")
        (or "t" nil)
        (or nil "t")
        (or "t1" "t2")
        (let ((cc (cons 2 3)))
          (cond
            ((eq 1 cc) "-foo-")
            ((> 3 2) "-3>2-")
            (nil "-nil-")
            (t "-t-")))
        (let ((c2 (cons "a" (cons "b" nil))))
          (pop c2))
        (let ((c2 (cons "a" (cons "b" nil))))
          (pop c2)
          (side-effect (car c2) (cdr c2)))

        (let ((temp ""))
          (dolist (a (cons "a" (cons "b" (cons "c" nil)))
                   (side-effect a))))

        (let ((temp "{"))
          (setf temp (s+ (dotimes (a 5 temp)
                           (setf temp (s+ temp a)))
                         "}")))

        (nth 3 (list 0 1 2 3 4))
        (nthcdr 3 (list 0 1 2 3 4))
        (last (list 0 1 2 3 4))
        (last (cons 0 (cons 1 2)))
        #++(defun rest-test (a b &rest c)
             (side-effect a b c))
        #++(rest-test 1 2 3 4 5)
        :foo
        '(1 a :b)
        #(1 2 3 )
        (aref #(1 2 3) 1)
        #++(aref "piyo" 1)
        #++(array-row-major-index (%new* not-simple-array-type
                                         #(2 3 4) nil nil
                                         #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24)
                                         0)
                                  0 2 1)
        #++(aref (%new- not-simple-array-type
                        #(2 3 4) nil nil
                        #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24)
                        0)
                 0 2 1)
        (reverse '(1 2 3))
        (reverse #(1 2 3))
        (reverse "hoge")
        (let ((foo 4))
          (if (and (> foo 0) (<= 0.0 (random 1.0) 1.0))
              "t" "f"))
        (nconc (cons 1 2) (cons 3 4))
        ;; examples from clhs
        (do ((temp-one 1 (1+ temp-one))
             (temp-two 0 (1- temp-two)))
            ((> (- temp-one temp-two) 5) temp-one))
        (do ((temp-one 1 (1+ temp-one))
             (temp-two 0 (1+ temp-one)))
            ((= 3 temp-two) temp-one))
        (do* ((temp-one 1 (1+ temp-one))
              (temp-two 0 (1+ temp-one)))
             ((= 3 temp-two) temp-one))

        (defun unused-args-test (a b c) "ok")
        (unused-args-test 1 2 3)
        #++ pi
        (list-length '(1 2 3))
        '(-1025 -512 -256 -255 -128 -127 -65 -64 -63 -1 0 1 63 64 65 127 128 255 256)
        (unused-args-test 1 2 3)

        )

      (def-tests "lambda-list-tests" ()
        ((lambda (a) a) 1)
        ((lambda (a &optional b) (list a b)) 1)
        ((lambda (a &optional b) (list a b)) 1 2)
        (flet ((n (&optional a) a))
          (list (n) (n 123)))
        (flet ((ui (&optional (a 123)) a))
          (ui) (ui 234))
        (flet ((i (&optional (a -234)) a))
          (i) (i 345))
        (flet ((d (&optional (a 456.5d0)) a))
          (d) (d 456))
        (flet ((s (&optional (a "test")) a))
          (s) (s 567))
        (flet ((cc (a &optional (b (+ a 5))) (list a b)))
          (cc 12) (cc 12 567))
        (flet ((cc (a &optional (b 5 p)) (list a b p)))
          (cc 12) (cc 12 567))
        )
      (def-tests-t "sacla-cons-tests" ()
        ;; Copyright (C) 2002-2004, Yuji Minejima <ggb01164@nifty.ne.jp>
        ;; ALL RIGHTS RESERVED.
        ;;
        ;; $Id: must-cons.lisp,v 1.4 2004/02/20 07:23:42 yuji Exp $
        ;;
        ;; Redistribution and use in source and binary forms, with or without
        ;; modification, are permitted provided that the following conditions
        ;; are met:
        ;;
        ;;  * Redistributions of source code must retain the above copyright
        ;;    notice, this list of conditions and the following disclaimer.
        ;;  * Redistributions in binary form must reproduce the above copyright
        ;;    notice, this list of conditions and the following disclaimer in
        ;;    the documentation and/or other materials provided with the
        ;;    distribution.
        ;;
        ;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
        ;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
        ;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
        ;; A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
        ;; OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
        ;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
        ;; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
        ;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
        ;; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
        ;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
        ;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

        (consp (cons 'a 'b))

        '(2 3 4 5)

        (consp '(1 . 2))

        (consp (list nil))

        (not (consp 'a))

        (not (consp nil))

        (not (consp 1))

        ;(not (consp #\a))

        (let ((a (cons 1 2)))
          (and (eql (car a) 1)
               (eql (cdr a) 2)))

        (equal (cons 1 nil) '(1))

        (equal (cons nil nil) '(nil))

        (equal (cons 'a (cons 'b (cons 'c '()))) '(a b c))

        (atom 'a)

        (atom nil)

        (atom 1)

        ;(atom #\a)

        (not (atom (cons 1 2)))

        (not (atom '(a . b)))

        (not (atom (list nil)))


        (listp nil)

        (listp '(a b c))

        (listp '(a . b))

        (listp (cons 'a 'b))

        (listp '#1=(1 2 . #1#))

        (not (listp 1))

        (not (listp 't))

        (null '())
        (null 'nil)
        (null nil)
        (not (null t))
        (null (cdr '(a)))
        (not (null (cdr '(1 . 2))))
        (not (null 'a))


        (endp '())
        (not (endp '(1)))
        (not (endp '(1 2)))
        (not (endp '(1 2 3)))
        (not (endp (cons 1 2)))
        (endp (cddr '(1 2)))


        (let ((a (cons 1 2)))
          (and (eq (rplaca a 0) a)
               (equal a '(0 . 2))))

        (let ((a (list 1 2 3)))
          (and (eq (rplaca a 0) a)
               (equal a '(0 2 3))))

        (let ((a (cons 1 2)))
          (and (eq (rplacd a 0) a)
               (equal a '(1 . 0))))

        (let ((a (list 1 2 3)))
          (and (eq (rplacd a 0) a)
               (equal a '(1 . 0))))

        (eq (car '(a . b)) 'a)

        (null (car nil))

        (let ((a (cons 1 2)))
          (eq (car (list a)) a))

        (eq (car '#2=(a . #2#)) 'a)

        (eq (cdr '(a . b)) 'b)
        (eq (rest '(a . b)) 'b)

        (null (cdr nil))
        (null (rest nil))

        (let ((a (cons 1 2)))
          (eq (cdr (cons 1 a)) a))
        (let ((a (cons 1 2)))
          (eq (rest (cons 1 a)) a))

        (let ((x '#3=(a . #3#)))
          (eq (cdr x) x))
        (let ((x '#4=(a . #4#)))
          (eq (rest x) x))

        (eq (caar '((a) b c)) 'a)

        (eq (cadr '(a b c)) 'b)

        (eq (cdar '((a . aa) b c)) 'aa)

        (eq (cddr '(a b . c)) 'c)

        (eq (caaar '(((a)) b c)) 'a)

        (eq (caadr '(a (b) c)) 'b)

        (eq (cadar '((a aa) b c)) 'aa)

        (eq (caddr '(a b c)) 'c)

        (eq (cdaar '(((a . aa)) b c)) 'aa)

        (eq (cdadr '(a (b . bb) c)) 'bb)

        (eq (cddar '((a aa . aaa) b c)) 'aaa)

        (eq (cdddr '(a b c . d)) 'd)

        (eq (caaaar '((((a))) b c)) 'a)

        (eq (caaadr '(a ((b)) c)) 'b)

        (eq (caadar '((a (aa)) b c)) 'aa)

        (eq (caaddr '(a b (c))) 'c)

        (eq (cadaar '(((a aa)) b c)) 'aa)

        (eq (cadadr '(a (b bb) c)) 'bb)

        (eq (caddar '((a aa aaa) b c)) 'aaa)

        (eq (cadddr '(a b c d)) 'd)

        (eq (cdaaar '((((a . aa))) b c)) 'aa)

        (eq (cdaadr '(a ((b . bb)) c)) 'bb)

        (eq (cdadar '((a (aa . aaa)) b c)) 'aaa)

        (eq (cdaddr '(a b (c . cc))) 'cc)

        (eq (cddaar '(((a aa . aaa)) b c)) 'aaa)

        (eq (cddadr '(a (b bb . bbb) c)) 'bbb)

        (eq (cdddar '((a aa aaa . aaaa) b c)) 'aaaa)

        (eq (cddddr '(a b c d . e)) 'e)

        (let ((x (cons 1 2)))
          (and (eql (setf (car x) 0) 0)
               (equal x '(0 . 2))))

        (let ((x (cons 1 2)))
          (and (eql (setf (cdr x) 0) 0)
               (equal x '(1 . 0))))

        (let ((x (copy-tree '((a) b c))))
          (and (eql (setf (caar x) 0) 0)
               (equal x '((0) b c))))

        (let ((x (list 'a 'b 'c)))
          (and (eql (setf (cadr x) 0) 0)
               (equal x '(a 0 c))))

        (let ((x (copy-tree '((a . aa) b c))))
          (and (eql (setf (cdar x) 0) 0)
               (equal x '((a . 0) b c))))

        (let ((x (copy-tree '(a b . c))))
          (and (eql (setf (cddr x) 0) 0)
               (equal x '(a b . 0))))

        (let ((x (copy-tree '(((a)) b c))))
          (and (eql (setf (caaar x) 0) 0)
               (equal x '(((0)) b c))))

        (let ((x (copy-tree '(a (b) c))))
          (and (eql (setf (caadr x) 0) 0)
               (equal x '(a (0) c))))

        (let ((x (copy-tree '((a aa) b c))))
          (and (eql (setf (cadar x) 0) 0)
               (equal x '((a 0) b c))))

        (let ((x (list 'a 'b 'c)))
          (and (eql (setf (caddr x) 0) 0)
               (equal x '(a b 0))))

        (let ((x (copy-tree '(((a . aa)) b c))))
          (and (eql (setf (cdaar x) 0) 0)
               (equal x '(((a . 0)) b c))))

        (let ((x (copy-tree '(a (b . bb) c))))
          (and (eql (setf (cdadr x) 0) 0)
               (equal x '(a (b . 0) c))))

        (let ((x (copy-tree '((a aa . aaa) b c))))
          (and (eql (setf (cddar x) 0) 0)
               (equal x '((a aa . 0) b c))))

        (let ((x (copy-tree '(a b c . d))))
          (and (eql (setf (cdddr x) 0) 0)
               (equal x '(a b c . 0))))

        (let ((x (copy-tree '((((a))) b c))))
          (and (eql (setf (caaaar x) 0) 0)
               (equal x '((((0))) b c))))

        (let ((x (copy-tree '(a ((b)) c))))
          (and (eql (setf (caaadr x) 0) 0)
               (equal x '(a ((0)) c))))

        (let ((x (copy-tree '((a (aa)) b c))))
          (and (eql (setf (caadar x) 0) 0)
               (equal x '((a (0)) b c))))

        (let ((x (copy-tree '(a b (c)))))
          (and (eql (setf (caaddr x) 0) 0)
               (equal x '(a b (0)))))

        (let ((x (copy-tree '(((a aa)) b c))))
          (and (eql (setf (cadaar x) 0) 0)
               (equal x '(((a 0)) b c))))

        (let ((x (copy-tree '(a (b bb) c))))
          (and (eql (setf (cadadr x) 0) 0)
               (equal x '(a (b 0) c))))

        (let ((x (copy-tree '((a aa aaa) b c))))
          (and (eql (setf (caddar x) 0) 0)
               (equal x '((a aa 0) b c))))

        (let ((x (list 'a 'b 'c 'd)))
          (and (eql (setf (cadddr x) 0) 0)
               (equal x '(a b c 0))))

        (let ((x (copy-tree '((((a . aa))) b c))))
          (and (eql (setf (cdaaar x) 0) 0)
               (equal x '((((a . 0))) b c))))

        (let ((x (copy-tree '(a ((b . bb)) c))))
          (and (eql (setf (cdaadr x) 0) 0)
               (equal x '(a ((b . 0)) c))))

        (let ((x (copy-tree '((a (aa . aaa)) b c))))
          (and (eql (setf (cdadar x) 0) 0)
               (equal x '((a (aa . 0)) b c))))

        (let ((x (copy-tree '(a b (c . cc)))))
          (and (eql (setf (cdaddr x) 0) 0)
               (equal x '(a b (c . 0)))))

        (let ((x (copy-tree '(((a aa . aaa)) b c))))
          (and (eql (setf (cddaar x) 0) 0)
               (equal x '(((a aa . 0)) b c))))

        (let ((x (copy-tree '(a (b bb . bbb) c))))
          (and (eql (setf (cddadr x) 0) 0)
               (equal x '(a (b bb . 0) c))))

        (let ((x (copy-tree '((a aa aaa . aaaa) b c))))
          (and (eql (setf (cdddar x) 0) 0)
               (equal x '((a aa aaa . 0) b c))))

        (let ((x (copy-tree '(a b c d . e))))
          (and (eql (setf (cddddr x) 0) 0)
               (equal x '(a b c d . 0))))

        (eq (copy-tree 'a) 'a)

        (eq (copy-tree nil) nil)

        (let* ((a (list 'a))
               (b (list 'b))
               (c (list 'c))
               (x3 (cons c nil))
               (x2 (cons b x3))
               (x  (cons a x2))
               (y  (copy-tree x)))
          (and (not (eq x y))
               (not (eq (car x) (car y)))
               (not (eq (cdr x) (cdr y)))
               (not (eq (cadr x) (cadr y)))
               (not (eq (cddr x) (cddr y)))
               (not (eq (caddr x) (caddr y)))
               (eq (cdddr x) (cdddr y))
               (equal x y)
               (eq (car x) a) (eq (car a) 'a) (eq (cdr a) nil)
               (eq (cdr x) x2)
               (eq (car x2) b) (eq (car b) 'b) (eq (cdr b) nil)
               (eq (cdr x2) x3)
               (eq (car x3) c) (eq (car c) 'c) (eq (cdr c) nil)
               (eq (cdr x3) nil)))

        (let* ((x (list (list 'a 1) (list 'b 2) (list 'c 3)))
               (y (copy-tree x)))
          (and (not (eq (car x) (car y)))
               (not (eq (cadr x) (cadr y)))
               (not (eq (caddr x) (caddr y)))))

        (let* ((x (list (list (list 1))))
               (y (copy-tree x)))
          (and (not (eq x y))
               (not (eq (car x) (car y)))
               (not (eq (caar x) (caar y)))))


        (let ((x (list 'a 'b 'c 'd)))
          (and (equal (sublis '((a . 1) (b . 2) (c . 3)) x)
                      (copy-tree '(1 2 3 d)))
               (equal x '(a b c d))))

        (let* ((n (cons 'n nil))
               (m (cons 'm n))
               (l (cons 'l m))
               (x (sublis '((a . 1) (b . 2) (c . 3)) l)))
          (and (eq x l)
               (eq (car l) 'l)
               (eq (cdr l) m)
               (eq (car m) 'm)
               (eq (cdr m) n)
               (eq (car n) 'n)
               (eq (cdr n) nil)))

        (eq (sublis '() '()) '())

        (equal (sublis '() '(1 2 3)) '(1 2 3))

        (eq (sublis '((a . 1) (b . 2)) '()) nil)

        (equal (sublis '((a b c) (b c d) (c d e))
                       '(a b c))
               '((b c) (c d) (d e)))

        (equal (sublis '((a . 1) (b . 2) (c . 3))
                       '(((a)) (b) c))
               '(((1)) (2) 3))

        (equal (sublis '(((a) . 1) ((b) . 2) ((c) . 3))
                       (copy-tree '((((a))) ((b)) (c))))
               '((((a))) ((b)) (c)))

        (equal (sublis '(((a) . 1) ((b) . 2) ((c) . 3))
                       '((((a))) ((b)) (c))
                       :test #'equal)
               '(((1)) (2) 3))

        (equal (sublis '(((a) . 1) ((b) . 2) ((c) . 3))
                       '((((a))) ((b)) (c))
                       :test-not (complement #'equal))
               '(((1)) (2) 3))

        (equal (sublis '((a . 1) (b . 2) (c . 3))
                       '((((a))) ((b)) (c))
                       :key #'car)
               '(((1)) (2) 3))

        (equal (sublis '(((a) . 1) ((b) . 2) ((c) . 3))
                       '((((a))) ((b)) (c))
                       :key  #'car
                       :test #'equal)
               '((1) 2 . 3))



        (equal (nsublis '((a . 1) (b . 2) (c . 3))
                        (list 'a 'b 'c 'd))
               '(1 2 3 d))

        (let* ((x (list 'a 'b 'c 'd))
               (y (nsublis '((a . 1) (b . 2) (c . 3)) x)))
          (and (eq x y)
               (equal x '(1 2 3 d))))

        (let ((x (list 'l 'm 'n)))
          (and (eq (nsublis '((a . 1) (b . 2) (c . 3)) x) x)
               (equal x '(l m n))))

        (let* ((n (cons 'n nil))
               (m (cons 'm n))
               (l (cons 'l m))
               (x (nsublis '((a . 1) (b . 2) (c . 3)) l)))
          (and (eq x l)
               (eq (car l) 'l)
               (eq (cdr l) m)
               (eq (car m) 'm)
               (eq (cdr m) n)
               (eq (car n) 'n)
               (eq (cdr n) nil)))

        (eq (nsublis '() '()) '())

        (equal (nsublis '() '(1 2 3)) '(1 2 3))

        (eq (nsublis '((a . 1) (b . 2)) '()) nil)

        (equal (nsublis '((a b c) (b c d) (c d e))
                        (list 'a 'b 'c))
               '((b c) (c d) (d e)))

        (equal (nsublis '((a . 1) (b . 2) (c . 3))
                        (copy-tree '(((a)) (b) c)))
               '(((1)) (2) 3))

        (equal (nsublis '(((a) . 1) ((b) . 2) ((c) . 3))
                        (copy-tree '((((a))) ((b)) (c))))
               '((((a))) ((b)) (c)))

        (equal (nsublis '(((a) . 1) ((b) . 2) ((c) . 3))
                        (copy-tree '((((a))) ((b)) (c)))
                        :test #'equal)
               '(((1)) (2) 3))

        (equal (nsublis '(((a) . 1) ((b) . 2) ((c) . 3))
                        (copy-tree '((((a))) ((b)) (c)))
                        :test-not (complement #'equal))
               '(((1)) (2) 3))


        (equal (nsublis '((a . 1) (b . 2) (c . 3))
                        (copy-tree '((((a))) ((b)) (c)))
                        :key #'car)
               '(((1)) (2) 3))

        (equal (nsublis '(((a) . 1) ((b) . 2) ((c) . 3))
                        (copy-tree '((((a))) ((b)) (c)))
                        :key 'car
                        :test #'equal)
               '((1) 2 . 3))


        (let ((tree '(old (old) ((old)))))
          (equal (subst 'new 'old tree)
                 '(new (new) ((new)))))

        (eq (subst 'new 'old 'old) 'new)

        (eq (subst 'new 'old 'not-old) 'not-old)

        (equal (subst 'new '(b) '(a ((b))) :test #'equal)
               '(a (new)))

        (equal (subst 'new '(b) '(a ((b))) :test-not (complement #'equal))
               '(a (new)))

        (equal (subst 'x 3 '(1 (1 2) (1 2 3) (1 2 3 4))
                      :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) X X))

        (equal (subst 'x "D" '("a" ("a" "b") ("a" "b" "c") ("a" "b" "c" "d"))
                      :test #'equalp
                      :key #'(lambda (y) (and (listp y) (fourth y))))
               '("a" ("a" "b") ("a" "b" "c") X))


        (equal (subst-if 'new #'(lambda (x) (eq x 'old)) '(old old))
               '(new new))

        (eq (subst-if 'new #'(lambda (x) (eq x 'old)) 'old) 'new)

        (equal (subst-if 'x #'(lambda (x) (eql x 3)) '(1 (1 2) (1 2 3) (1 2 3 4))
                         :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) x x))


        (let ((tree '(old (old) ((old)))))
          (equal (subst-if 'new #'(lambda (x) (eq x 'old)) tree)
                 '(new (new) ((new)))))

        (eq (subst-if 'new #'(lambda (x) (eq x 'old)) 'old)
            'new)

        (eq (subst-if 'new #'(lambda (x) (eq x 'old)) 'not-old)
            'not-old)

        (equal (subst-if 'new #'(lambda (x) (equal x '(b))) '(a ((b))))
               '(a (new)))

        (equal (subst-if 'x
                         #'(lambda (x) (eql x 3)) '(1 (1 2) (1 2 3) (1 2 3 4))
                         :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) X X))

        (equal (subst-if 'x
                         #'(lambda (x) (equalp x "D"))
                         '("a" ("a" "b") ("a" "b" "c") ("a" "b" "c" "d"))
                         :key #'(lambda (y) (and (listp y) (fourth y))))
               '("a" ("a" "b") ("a" "b" "c") X))


        (equal (subst-if-not 'new #'(lambda (x) (not (eq x 'old))) '(old old))
               '(new new))

        (eq (subst-if-not 'new #'(lambda (x) (not (eq x 'old))) 'old) 'new)

        (equal (subst-if-not 'x #'(lambda (x) (not (eql x 3)))
                             '(1 (1 2) (1 2 3) (1 2 3 4))
                             :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) x x))


        (let ((tree '(old (old) ((old)))))
          (equal (subst-if-not 'new #'(lambda (x) (not (eq x 'old))) tree)
                 '(new (new) ((new)))))

        (eq (subst-if-not 'new #'(lambda (x) (not (eq x 'old))) 'old)
            'new)

        (eq (subst-if-not 'new #'(lambda (x) (not (eq x 'old))) 'not-old)
            'not-old)

        (equal (subst-if-not 'new #'(lambda (x) (not (equal x '(b)))) '(a ((b))))
               '(a (new)))

        (equal (subst-if-not 'x
                             #'(lambda (x) (not (eql x 3)))
                             '(1 (1 2) (1 2 3) (1 2 3 4))
                             :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) X X))

        (equal (subst-if-not 'x
                             #'(lambda (x) (not (equalp x "D")))
                             '("a" ("a" "b") ("a" "b" "c") ("a" "b" "c" "d"))
                             :key #'(lambda (y) (and (listp y) (fourth y))))
               '("a" ("a" "b") ("a" "b" "c") X))



        (let ((tree '(old (old) ((old)))))
          (equal (nsubst 'new 'old (copy-tree tree))
                 '(new (new) ((new)))))

        (let* ((tree (copy-tree '(old (old) ((old)))))
               (new-tree (nsubst 'new 'old tree)))
          (and (eq tree new-tree)
               (equal tree '(new (new) ((new))))))

        (eq (nsubst 'new 'old 'old) 'new)

        (eq (nsubst 'new 'old 'not-old) 'not-old)

        (equal (nsubst 'new '(b) (copy-tree '(a ((b)))) :test #'equal)
               '(a (new)))

        (equal (nsubst 'new '(b) (copy-tree '(a ((b)))) :test-not (complement #'equal))
               '(a (new)))

        (equal (nsubst 'x 3 (copy-tree '(1 (1 2) (1 2 3) (1 2 3 4)))
                       :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) X X))

        (equal (nsubst 'x "D"
                       (copy-tree '("a" ("a" "b") ("a" "b" "c") ("a" "b" "c" "d")))
                       :test #'equalp
                       :key #'(lambda (y) (and (listp y) (fourth y))))
               '("a" ("a" "b") ("a" "b" "c") X))


        (equal (nsubst-if 'new #'(lambda (x) (eq x 'old)) (list 'old 'old))
               '(new new))

        (eq (nsubst-if 'new #'(lambda (x) (eq x 'old)) 'old) 'new)

        (let* ((x (copy-tree '(old (old) ((old)) (old) old)))
               (y (nsubst-if 'new #'(lambda (x) (eq x 'old)) x)))
          (and (eq x y)
               (equal x '(new (new) ((new)) (new) new))))

        (equal (nsubst-if 'x
                          #'(lambda (x) (eql x 3))
                          (copy-tree '(1 (1 2) (1 2 3) (1 2 3 4)))
                          :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) x x))

        (let ((tree '(old (old) ((old)))))
          (equal (nsubst-if 'new #'(lambda (x) (eq x 'old)) (copy-tree tree))
                 '(new (new) ((new)))))

        (eq (nsubst-if 'new #'(lambda (x) (eq x 'old)) 'old)
            'new)

        (eq (nsubst-if 'new #'(lambda (x) (eq x 'old)) 'not-old)
            'not-old)

        (equal (nsubst-if 'new #'(lambda (x) (equal x '(b)))
                          (copy-tree '(a ((b)))))
               '(a (new)))

        (equal (nsubst-if 'x
                          #'(lambda (x) (eql x 3))
                          (copy-tree '(1 (1 2) (1 2 3) (1 2 3 4)))
                          :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) X X))

        (equal (nsubst-if 'x
                          #'(lambda (x) (equalp x "D"))
                          (copy-tree '("a" ("a" "b") ("a" "b" "c") ("a" "b" "c" "d")))
                          :key #'(lambda (y) (and (listp y) (fourth y))))
               '("a" ("a" "b") ("a" "b" "c") X))


        (equal (nsubst-if-not 'new #'(lambda (x) (not (eq x 'old)))
                              (list 'old 'old))
               '(new new))

        (eq (nsubst-if-not 'new #'(lambda (x) (not (eq x 'old))) 'old) 'new)

        (let* ((x (copy-tree '(old (old) ((old)) (old) old)))
               (y (nsubst-if-not 'new #'(lambda (x) (not (eq x 'old))) x)))
          (and (eq x y)
               (equal x '(new (new) ((new)) (new) new))))

        (equal (nsubst-if-not 'x #'(lambda (x) (not (eql x 3)))
                              (copy-tree '(1 (1 2) (1 2 3) (1 2 3 4)))
                              :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) x x))

        (let ((tree '(old (old) ((old)))))
          (equal (nsubst-if-not 'new #'(lambda (x) (not (eq x 'old))) (copy-tree tree))
                 '(new (new) ((new)))))

        (eq (nsubst-if-not 'new #'(lambda (x) (not (eq x 'old))) 'old)
            'new)

        (eq (nsubst-if-not 'new #'(lambda (x) (not (eq x 'old))) 'not-old)
            'not-old)

        (equal (nsubst-if-not 'new #'(lambda (x) (not (equal x '(b))))
                              (copy-tree '(a ((b)))))
               '(a (new)))

        (equal (nsubst-if-not 'x
                              #'(lambda (x) (not (eql x 3)))
                              (copy-tree '(1 (1 2) (1 2 3) (1 2 3 4)))
                              :key #'(lambda (y) (and (listp y) (third y))))
               '(1 (1 2) X X))

        (equal
         (nsubst-if-not 'x
                        #'(lambda (x) (not (equalp x "D")))
                        (copy-tree '("a" ("a" "b") ("a" "b" "c") ("a" "b" "c" "d")))
                        :key #'(lambda (y) (and (listp y) (fourth y))))
         '("a" ("a" "b") ("a" "b" "c") X))



        (tree-equal 'a 'a)

        (not (tree-equal 'a 'b))

        (tree-equal '(a (b (c))) '(a (b (c))))

        (tree-equal '(a (b (c))) '(a (b (c))) :test #'eq)

        (tree-equal '(a (b (c))) '(a (b (c))) :test-not (complement #'eq))

        ;; not valid, strings are literals so can be combined
        #++
        (not (tree-equal '("a" ("b" ("c"))) '("a" ("b" ("c")))))

        (tree-equal '("a" ("b" ("c"))) '("a" ("b" ("c"))) :test #'equal)

        (tree-equal '("a" ("b" ("c"))) '("a" ("b" ("c")))
                    :test-not (complement #'equal))

        (not (tree-equal '(a b) '(a (b))))


        (eq (copy-list '()) '())

        (equal (copy-list '(a b c))
               '(a b c))

        (equal (copy-list '(a . b)) '(a . b))

        (let* ((x '(a b c))
               (y (copy-list x)))
          (and (equal x y)
               (not (eq x y))))

        (let* ((a (list 'a))
               (b (list 'b))
               (c (list 'c))
               (x (list a b c))
               (y (copy-list x)))
          (and (equal x y)
               (not (eq x y))
               (eq (car x) (car y))
               (eq (cadr x) (cadr y))
               (eq (caddr x) (caddr y))
               (eq (caar x) 'a)
               (eq (caadr x) 'b)
               (eq (caaddr x) 'c)))


        (null (list))

        (equal (list 1) '(1))

        (equal (list 1 2 3) '(1 2 3))

        (equal (list* 1 2 '(3)) '(1 2 3))

        (equal (list* 1 2 'x) '(1 2 . x))

        (equal (list* 1 2 '(3 4)) '(1 2 3 4))

        (eq (list* 'x) 'x)


        (eql (list-length '()) 0)

        (eql (list-length '(1)) 1)

        (eql (list-length '(1 2)) 2)

        (null (list-length '#5=(1 2 3 4 . #5#)))


        (equal (make-list 5) '(nil nil nil nil nil))

        (equal (make-list 3 :initial-element 'rah) '(rah rah rah))

        (equal (make-list 2 :initial-element '(1 2 3)) '((1 2 3) (1 2 3)))

        (null (make-list 0))

        (null (make-list 0 :initial-element 'new-element))


        (let ((place nil))
          (and (equal (push 0 place) '(0))
               (equal place '(0))))

        (let ((place (list 1 2 3)))
          (and (equal (push 0 place) '(0 1 2 3))
               (equal place '(0 1 2 3))))

        (let ((a (list (list 1 2 3) 9)))
          (and (equal (push 0 (car a)) '(0 1 2 3))
               (equal a '((0 1 2 3) 9))))

        (let ((x (copy-tree '(a (b c) d))))
          (and (equal (push 'aa (cadr x)) '(aa b c))
               (equal x '(a (aa b c) d))))


        (let ((place (list 1 2 3)))
          (and (eql (pop place) 1)
               (equal place '(2 3))))

        (let ((place '()))
          (and (eql (pop place) nil)
               (equal place '())))

        (let ((a (list (list 1 2 3) 9)))
          (and (eql (pop (car a)) 1)
               (equal a '((2 3) 9))))

        (let ((x (list 'a 'b 'c)))
          (and (eq (pop (cdr x)) 'b)
               (equal x '(a c))))


        (eq (first '(a . b)) 'a)

        (null (first nil))

        (let ((a (cons 1 2)))
          (eq (first (list a)) a))

        (eq (first '#6=(a . #6#)) 'a)

        (eql (first   '(1 2 3)) '1)
        (eql (second  '(1 2 3)) '2)
        (eql (third   '(1 2 3)) '3)
        (eql (fourth  '(1 2 3 4)) '4)
        (eql (fifth   '(1 2 3 4 5)) '5)
        (eql (sixth   '(1 2 3 4 5 6)) '6)
        (eql (seventh '(1 2 3 4 5 6 7)) '7)
        (eql (eighth  '(1 2 3 4 5 6 7 8)) '8)
        (eql (ninth   '(1 2 3 4 5 6 7 8 9)) '9)
        (eql (tenth   '(1 2 3 4 5 6 7 8 9 10)) '10)


        (let ((x (list 'a 'b 'c)))
          (and (eql (setf (first x) 0) 0)
               (equal x '(0 b c))))

        (let ((x (list 'a 'b 'c)))
          (and (eql (setf (second x) 0) 0)
               (equal x '(a 0 c))))

        (let ((x (list 'a 'b 'c)))
          (and (eql (setf (third x) 0) 0)
               (equal x '(a b 0))))

        (let ((x (list 'a 'b 'c 'd)))
          (and (eql (setf (fourth x) 0) 0)
               (equal x '(a b c 0))))

        (let ((x (list 'a 'b 'c 'd 'e)))
          (and (eql (setf (fifth x) 0) 0)
               (equal x '(a b c d 0))))

        (let ((x (list 'a 'b 'c 'd 'e 'f)))
          (and (eql (setf (sixth x) 0) 0)
               (equal x '(a b c d e 0))))

        (let ((x (list 'a 'b 'c 'd 'e 'f 'g)))
          (and (eql (setf (seventh x) 0) 0)
               (equal x '(a b c d e f 0))))

        (let ((x (list 'a 'b 'c 'd 'e 'f 'g 'h)))
          (and (eql (setf (eighth x) 0) 0)
               (equal x '(a b c d e f g 0))))

        (let ((x (list 'a 'b 'c 'd 'e 'f 'g 'h 'i)))
          (and (eql (setf (ninth x) 0) 0)
               (equal x '(a b c d e f g h 0))))

        (let ((x (list 'a 'b 'c 'd 'e 'f 'g 'h 'i 'j)))
          (and (eql (setf (tenth x) 0) 0)
               (equal x '(a b c d e f g h i 0))))


        (let ((x '(a b c)))
          (eq (nthcdr 0 x) x))

        (let ((x '(a b c)))
          (eq (nthcdr 1 x) (cdr x)))

        (let ((x '(a b c)))
          (eq (nthcdr 2 x) (cddr x)))

        (let ((x '(a b c)))
          (eq (nthcdr 2 x) (cddr x)))

        (let ((x '(a b c)))
          (eq (nthcdr 3 x) (cdddr x)))

        (equal (nthcdr 0 '(0 1 2)) '(0 1 2))
        (equal (nthcdr 1 '(0 1 2)) '(1 2))
        (equal (nthcdr 2 '(0 1 2)) '(2))
        (equal (nthcdr 3 '(0 1 2)) '())

        (eql (nthcdr 1 '(0 . 1)) 1)

        (eql (nth 0 '(a b c)) 'a)
        (eql (nth 1 '(a b c)) 'b)
        (eql (nth 2 '(a b c)) 'c)
        (eql (nth 3 '(a b c)) '())
        (eql (nth 4 '(a b c)) '())
        (eql (nth 5 '(a b c)) '())
        (eql (nth 6 '(a b c)) '())

        (eq (nth 0 '(a . b)) 'a)

        (let ((x (list 'a 'b 'c)))
          (and (eq (setf (nth 0 x) 'z) 'z)
               (equal x '(z b c))))

        (let ((x (list 'a 'b 'c)))
          (and (eq (setf (nth 1 x) 'z) 'z)
               (equal x '(a z c))))

        (let ((x (list 'a 'b 'c)))
          (and (eq (setf (nth 2 x) 'z) 'z)
               (equal x '(a b z))))

        (let ((0-to-3 (list 0 1 2 3)))
          (and (equal (setf (nth 2 0-to-3) "two") "two")
               (equal 0-to-3 '(0 1 "two" 3))))


        (eq (nconc) '())
        (equal (nconc nil (list 'a 'b 'c) (list 'd 'e 'f))
               '(a b c d e f))

        (equal (nconc nil nil (list 'a 'b 'c) (list 'd 'e 'f))
               '(a b c d e f))

        (equal (nconc nil nil nil (list 'a 'b 'c) (list 'd 'e 'f))
               '(a b c d e f))


        (let* ((x (list 'a 'b 'c)))
          (eq (nconc x) x))

        (let* ((x (list 'a 'b 'c))
               (y (list 'd 'e 'f))
               (list (nconc x y)))
          (and (eq list x)
               (eq (nthcdr 3 list) y)
               (equal list '(a b c d e f))))

        (let* ((x (list 'a))
               (y (list 'b))
               (z (list 'c))
               (list (nconc x y z)))
          (and (eq x list)
               (eq (first list) 'a)
               (eq y (cdr list))
               (eq (second list) 'b)
               (eq z (cddr list))
               (eq (third list) 'c)))

        (equal (append '(a b) '() '(c d) '(e f))
               '(a b c d e f))

        (null (append))
        (null (append '()))
        (null (append '() '()))

        (eq (append 'a) 'a)

        (eq (append '() 'a) 'a)

        (eq (append '() '() 'a) 'a)


        (equal (append '(a b) 'c) '(a b . c))

        (let* ((x '(a b c))
               (y '(d e f))
               (z (append x y)))
          (and (equal z '(a b c d e f))
               (eq (nthcdr 3 z) y)
               (not (eq x z))))


        (equal (revappend '(a b c) '(d e f))
               '(c b a d e f))

        (let* ((x '(a b c))
               (y '(d e f))
               (z (revappend x y)))
          (and (equal z '(c b a d e f))
               (not (eq x z))
               (eq (nthcdr 3 z) y)))

        (let ((x '(a b c)))
          (eq (revappend '() x) x))

        (null (revappend '() '()))

        (eq (revappend '() 'a) 'a)

        (equal (revappend '(a) 'b) '(a . b))

        (equal (revappend '(a) '()) '(a))

        (equal (revappend '(1 2 3) '()) '(3 2 1))


        (equal (nreconc (list 'a 'b 'c) '(d e f))
               '(c b a d e f))

        (let* ((x (list 'a 'b 'c))
               (y '(d e f))
               (z (nreconc x y)))
          (and (equal z '(c b a d e f))
               (eq (nthcdr 3 z) y)))

        (let ((x (list 'a 'b 'c)))
          (eq (nreconc '() x) x))

        (null (nreconc '() '()))

        (eq (nreconc '() 'a) 'a)

        (equal (nreconc (list 'a) 'b) '(a . b))

        (equal (nreconc (list 'a) '()) '(a))

        (equal (nreconc (list 1 2 3) '()) '(3 2 1))


        (null (butlast nil))
        (null (butlast nil 1))
        (null (butlast nil 2))
        (null (butlast nil 3))
        (equal (butlast '(1 2 3 4 5))   '(1 2 3 4))
        (equal (butlast '(1 2 3 4 5) 1) '(1 2 3 4))
        (equal (butlast '(1 2 3 4 5) 2) '(1 2 3))
        (equal (butlast '(1 2 3 4 5) 3) '(1 2))
        (equal (butlast '(1 2 3 4 5) 4) '(1))
        (equal (butlast '(1 2 3 4 5) 5) '())
        (equal (butlast '(1 2 3 4 5) 6) '())
        (equal (butlast '(1 2 3 4 5) 7) '())

        (equal (butlast '(1 2 3 4 5 . 6))   '(1 2 3 4))
        (equal (butlast '(1 2 3 4 5 . 6) 1) '(1 2 3 4))
        (equal (butlast '(1 2 3 4 5 . 6) 2) '(1 2 3))
        (equal (butlast '(1 2 3 4 5 . 6) 3) '(1 2))
        (equal (butlast '(1 2 3 4 5 . 6) 4) '(1))
        (equal (butlast '(1 2 3 4 5 . 6) 5) '())
        (equal (butlast '(1 2 3 4 5 . 6) 6) '())
        (equal (butlast '(1 2 3 4 5 . 6) 7) '())

        (let ((a '(1 2 3 4 5)))
          (equal (butlast a 3) '(1 2))
          (equal a '(1 2 3 4 5)))


        (null (nbutlast nil))
        (null (nbutlast nil 1))
        (null (nbutlast nil 2))
        (null (nbutlast nil 3))
        (equal (nbutlast (list 1 2 3 4 5))   '(1 2 3 4))
        (equal (nbutlast (list 1 2 3 4 5) 1) '(1 2 3 4))
        (equal (nbutlast (list 1 2 3 4 5) 2) '(1 2 3))
        (equal (nbutlast (list 1 2 3 4 5) 3) '(1 2))
        (equal (nbutlast (list 1 2 3 4 5) 4) '(1))
        (equal (nbutlast (list 1 2 3 4 5) 5) '())
        (equal (nbutlast (list 1 2 3 4 5) 6) '())
        (equal (nbutlast (list 1 2 3 4 5) 7) '())

        (equal (nbutlast (list* 1 2 3 4 5 6))   '(1 2 3 4))
        (equal (nbutlast (list* 1 2 3 4 5 6) 1) '(1 2 3 4))
        (equal (nbutlast (list* 1 2 3 4 5 6) 2) '(1 2 3))
        (equal (nbutlast (list* 1 2 3 4 5 6) 3) '(1 2))
        (equal (nbutlast (list* 1 2 3 4 5 6) 4) '(1))
        (equal (nbutlast (list* 1 2 3 4 5 6) 5) '())
        (equal (nbutlast (list* 1 2 3 4 5 6) 6) '())
        (equal (nbutlast (list* 1 2 3 4 5 6) 7) '())

        (let* ((a (copy-tree '(1 2 3 4 5)))
               (b (nbutlast a 3)))
          (and (eq a b)
               (equal a '(1 2))))


        (let ((x '(0 1 2 3 4 5 6 7 8 9)))
          (eq (last x) (nthcdr 9 x)))

        (null (last nil))

        (let ((x '(0 1 . 2)))
          (eq (last x) (cdr x)))

        (eql (last '(1 . 2) 0) 2)

        (let ((x '(0 1 2 3 4)))
          (eq (last x 0) nil))

        (let ((x '(0 1 2 3 4)))
          (eq (last x) (nthcdr 4 x)))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 1) (nthcdr 4 x)))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 2) (cdddr x)))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 3) (cddr x)))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 4) (cdr x)))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 5) x))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 6) x))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 7) x))

        (let ((x '(0 1 2 3 4)))
          (eq (last x 8) x))


        (tailp '() '())

        (tailp '() '(1))

        (tailp '() '(1 2 3 4 5 6 7 8 9))

        (let ((x '(1 2 3)))
          (and (tailp x x)
               (tailp (cdr x) x)
               (tailp (cddr x) x)
               (tailp (cdddr x) x)))

        (let ((x '(1 . 2)))
          (and (tailp x x)
               (tailp (cdr x) x)))

        (not (tailp nil '(1 . 2)))

        (not (tailp 'x '(1 2 3 4 5 6)))

        (not (tailp (list 1 2 3) '(1 2 3)))

        (let ((x '(1 2 3 4 5 . 6)))
          (tailp (last x) x))

        (let ((x '(1 2 3 4 5 . 6)))
          (tailp (last x) x))


        (null (ldiff '() '()))

        (equal (ldiff '(1 . 2) 2) '(1))

        (equal (ldiff '(1 2 3 4 5 6 7 8 9) '())
               '(1 2 3 4 5 6 7 8 9))

        (let ((x '(1 2 3)))
          (and (null (ldiff x x))
               (equal (ldiff x (cdr x)) '(1))
               (equal (ldiff x (cddr x)) '(1 2))
               (equal (ldiff x (cdddr x)) '(1 2 3))))

        (let* ((x '(1 2 3))
               (y '(a b c))
               (z (ldiff x y)))
          (and (not (eq x z))
               (equal z '(1 2 3))))

        (equal (member 'a '(a b c d)) '(a b c d))
        (equal (member 'b '(a b c d)) '(b c d))
        (equal (member 'c '(a b c d)) '(c d))
        (equal (member 'd '(a b c d)) '(d))
        (equal (member 'e '(a b c d)) '())
        (equal (member 'f '(a b c d)) '())

        (let ((x '(a b c d)))
          (eq (member 'a x) x)
          (eq (member 'b x) (cdr x))
          (eq (member 'c x) (cddr x))
          (eq (member 'd x) (cdddr x))
          (eq (member 'e x) nil))


        (equal (member 'a '(a b c d) :test #'eq) '(a b c d))
        (equal (member 'b '(a b c d) :test #'eq) '(b c d))
        (equal (member 'c '(a b c d) :test #'eq) '(c d))
        (equal (member 'd '(a b c d) :test #'eq) '(d))
        (equal (member 'e '(a b c d) :test #'eq) '())
        (equal (member 'f '(a b c d) :test #'eq) '())

        (null (member 'a '()))

        (let* ((x '((1 . a) (2 . b) (3 . c) (4 . d) (5 . e)))
               (y (member 'd x :key #'cdr :test #'eq)))
          (and (equal y '((4 . d) (5 . e)))
               (eq y (nthcdr 3 x))))

        (let* ((x '((1 . a) (2 . b) (3 . c) (4 . d) (5 . e)))
               (y (member 'd x :key #'cdr)))
          (and (equal y '((4 . d) (5 . e)))
               (eq y (nthcdr 3 x))))

        (let* ((x '((1 . a) (2 . b) (3 . c) (4 . d) (5 . e)))
               (y (member 'd x :key #'cdr :test-not (complement #'eq))))
          (and (equal y '((4 . d) (5 . e)))
               (eq y (nthcdr 3 x))))

        (let* ((x '((1 . a) (2 . b) (3 . c) (4 . d) (5 . e)))
               (y (member 'd x :test-not (complement #'eq))))
          (eq y nil))

        (equal (member 2 '((1 . 2) (3 . 4)) :test-not #'= :key #'cdr)
               '((3 . 4)))

        (equal (member-if #'(lambda (x) (eql x 'a)) '(a b c d)) '(a b c d))
        (equal (member-if #'(lambda (x) (eql x 'b)) '(a b c d)) '(b c d))
        (equal (member-if #'(lambda (x) (eql x 'c)) '(a b c d)) '(c d))
        (equal (member-if #'(lambda (x) (eql x 'd)) '(a b c d)) '(d))
        (equal (member-if #'(lambda (x) (eql x 'e)) '(a b c d)) '())
        (equal (member-if #'(lambda (x) (eql x 'f)) '(a b c d)) '())

        (null (member-if #'(lambda (x) (eql x 'a)) '()))

        (let* ((x '((1 . a) (2 . b) (3 . c) (4 . d) (5 . e)))
               (y (member-if #'(lambda (p) (eq p 'd)) x :key #'cdr)))
          (and (equal y '((4 . d) (5 . e)))
               (eq y (nthcdr 3 x))))

        (equal (member-if #'cdr '((1) (2 . 2) (3 3 . 3)))
               '((2 . 2) (3 3 . 3)))

        (null (member-if #'zerop '(7 8 9)))


        (equal (member-if-not #'(lambda (x) (not (eql x 'a))) '(a b c d)) '(a b c d))
        (equal (member-if-not #'(lambda (x) (not (eql x 'b))) '(a b c d)) '(b c d))
        (equal (member-if-not #'(lambda (x) (not (eql x 'c))) '(a b c d)) '(c d))
        (equal (member-if-not #'(lambda (x) (not (eql x 'd))) '(a b c d)) '(d))
        (equal (member-if-not #'(lambda (x) (not (eql x 'e))) '(a b c d)) '())
        (equal (member-if-not #'(lambda (x) (not (eql x 'f))) '(a b c d)) '())

        (null (member-if-not #'(lambda (x) (not (eql x 'a))) '()))

        (let* ((x '((1 . a) (2 . b) (3 . c) (4 . d) (5 . e)))
               (y (member-if-not #'(lambda (p) (not (eq p 'd))) x :key #'cdr)))
          (and (equal y '((4 . d) (5 . e)))
               (eq y (nthcdr 3 x))))


        (let ((x '((1 2) (2 3) (3 4) (4 5)))
              (y nil))
          (and (eq (mapc #'(lambda (a) (push (car a) y)) x) x)
               (equal y '(4 3 2 1))))

        (let ((dummy nil)
              (list-1 '(1 2 3 4)))
          (and (eq (mapc #'(lambda (&rest x) (setq dummy (append dummy x)))
                         list-1
                         '(a b c d e)
                         '(x y z))
                   list-1)
               (equal dummy '(1 a x 2 b y 3 c z))))

        (let* ((x '(0 1 2 3))
               (y nil)
               (z (mapc #'(lambda (a b c) (push (list a b c) y))
                        x '(1 2 3 4) '(2 3 4 5))))
          (and (eq z x)
               (equal y '((3 4 5) (2 3 4) (1 2 3) (0 1 2)))))


        (let* ((x '(0 1 2 3))
               (y nil)
               (z (mapc #'(lambda (a b c) (push (list a b c) y))
                        nil x '(1 2 3 4) '(2 3 4 5))))
          (and (null z)
               (null y)))

        (let ((sum 0))
          (mapc #'(lambda (&rest rest) (setq sum (+ sum (apply #'+ rest))))
                '(0 1 2)
                '(1 2 0)
                '(2 0 1))
          (eql sum 9))

        (let ((result 'initial-value)
              (list-1 nil))
          (and (eq (mapc #'(lambda (a b) (setq result (cons (cons a b) result))) list-1) list-1)
               (eq result 'initial-value)))

        (let ((result 'initial-value)
              (list-1 nil))
          (and (eq (mapc #'(lambda (a b) (setq result (cons (cons a b) result)))
                         list-1
                         '(1 2 3))
                   list-1)
               (eq result 'initial-value)))

        (let ((result 'initial-value)
              (list-1 '(1 2 3)))
          (and (eq (mapc #'(lambda (a b) (setq result (cons (cons a b) result)))
                         list-1
                         '())
                   list-1)
               (eq result 'initial-value)))


        (equal (mapcar #'car '((1 2) (2 3) (3 4) (4 5)))
               '(1 2 3 4))

        (null (mapcar #'identity '()))

        (equal (mapcar #'list '(0 1 2 3) '(a b c d) '(w x y z))
               '((0 a w) (1 b x) (2 c y) (3 d z)))

        (null (mapcar #'list '() '(0 1 2 3) '(1 2 3 4) '(2 3 4 5)))
        (null (mapcar #'list '(0 1 2 3) '() '(1 2 3 4) '(2 3 4 5)))
        (null (mapcar #'list '(0 1 2 3) '(1 2 3 4) '() '(2 3 4 5)))
        (null (mapcar #'list '(0 1 2 3) '(1 2 3 4) '(2 3 4 5) '()))

        (equal (mapcar #'list '(0) '(a b) '(x y z)) '((0 a x)))
        (equal (mapcar #'list '(a b) '(0) '(x y z)) '((a 0 x)))
        (equal (mapcar #'list '(a b) '(x y z) '(0)) '((a x 0)))

        (equal (mapcar #'cons '(a b c) '(1 2 3))
               '((A . 1) (B . 2) (C . 3)))


        (equal (mapcan #'cdr (copy-tree '((1 2) (2 3) (3 4) (4 5))))
               '(2 3 4 5))

        (equal (mapcan #'append
                       '((1 2 3) (4 5 6) (7 8 9))
                       '((a) (b c) (d e f))
                       (list (list 'x 'y 'z) (list 'y 'z) (list 'z)))
               '(1 2 3 a x y z 4 5 6 b c y z 7 8 9 d e f z))

        (null (mapcan #'append '((1 2 3) (4 5 6) (7 8 9)) '((a) (b c)) '()))
        (null (mapcan #'append '((1 2 3) (4 5 6) (7 8 9)) '() '((a) (b c))))
        (null (mapcan #'append '() '((1 2 3) (4 5 6) (7 8 9)) '((a) (b c))))

        (equal (mapcan #'list
                       (list 1 2 3 4 5)
                       (list 2 3 4 5 6)
                       (list 3 4 5 6 7)
                       (list 4 5 6 7 8))
               '(1 2 3 4 2 3 4 5 3 4 5 6 4 5 6 7 5 6 7 8))

        (equal (mapcan #'(lambda (x y) (if (null x) nil (list x y)))
                       '(nil nil nil d e)
                       '(1 2 3 4 5 6))
               '(d 4 e 5))

        (equal (mapcan #'(lambda (x) (and (numberp x) (list x)))
                       '(a 1 b c 3 4 d 5))
               '(1 3 4 5))


        (equal (maplist #'identity '(a b c d))
               '((a b c d) (b c d) (c d) (d)))

        (equal (maplist #'car '((1 2) (2 3) (3 4) (4 5)))
               '((1 2) (2 3) (3 4) (4 5)))

        (equal (maplist #'list '(a b c) '(b c d) '(c d e))
               '(((a b c) (b c d) (c d e))
                 ((b c) (c d) (d e))
                 ((c) (d) (e))))

        (equal (maplist #'append '(a b c) '(b c d) '(c d e))
               '((a b c b c d c d e) (b c c d d e) (c d e)))

        (equal (maplist #'append '(a b c) '(b c) '(c))
               '((a b c b c c)))

        (null (maplist #'append '() '(a b c) '(b c) '(c)))
        (null (maplist #'append '(a b c) '() '(b c) '(c)))
        (null (maplist #'append '(a b c) '(b c) '(c) '()))

        (let ((x '((1 2) (2 3) (3 4) (4 5)))
              (y nil))
          (and (eq (mapl #'(lambda (a) (push (car a) y)) x) x)
               (equal y '((4 5) (3 4) (2 3) (1 2)))))

        (let ((x nil))
          (and (null (mapl #'(lambda (&rest rest) (push rest x)) '() '(0) '(0 1)))
               (null x)))

        (let ((x nil))
          (and (equal (mapl #'(lambda (&rest rest) (push rest x)) '(0) '() '(0 1))
                      '(0))
               (null x)))

        (let ((x nil))
          (and (equal (mapl #'(lambda (&rest rest) (push rest x)) '(0) '(0 1) '())
                      '(0))
               (null x)))

        (equal (mapcon #'car (copy-tree '((1 2) (2 3) (3 4) (4 5))))
               '(1 2 2 3 3 4 4 5))


        (equal (mapcon #'list '(0 1 2 3) '(1 2 3 4) '(2 3 4 5) '(3 4 5 6))
               '((0 1 2 3) (1 2 3 4) (2 3 4 5) (3 4 5 6) (1 2 3) (2 3 4) (3 4 5)
                 (4 5 6) (2 3) (3 4) (4 5) (5 6) (3) (4) (5) (6)))


        (null (mapcon #'list '() '(0 1 2 3) '(1 2 3 4) '(2 3 4 5) '(3 4 5 6)))
        (null (mapcon #'list '(0 1 2 3) '() '(1 2 3 4) '(2 3 4 5) '(3 4 5 6)))
        (null (mapcon #'list '(0 1 2 3) '(1 2 3 4) '() '(2 3 4 5) '(3 4 5 6)))
        (null (mapcon #'list '(0 1 2 3) '(1 2 3 4) '(2 3 4 5) '() '(3 4 5 6)))
        (null (mapcon #'list '(0 1 2 3) '(1 2 3 4) '(2 3 4 5) '(3 4 5 6) '()))


        (let* ((x '((apple . 1) (orange . 2) (grapes . 3)))
               (y (acons 'plum 9 x)))
          (and (equal y '((plum . 9) (apple . 1) (orange . 2) (grapes . 3)))
               (eq x (cdr y))))

        (equal (acons 'a '0 nil) '((a . 0)))

        (equal (acons 'apple 1 (acons 'orange 2 (acons 'grapes '3 nil)))
               '((apple . 1) (orange . 2) (grapes . 3)))

        (equal (acons nil nil nil) '((nil)))


        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (assoc 'y alist) (cadr alist)))

        (null (assoc 'no-such-key '((x . 100) (y . 200) (z . 50))))

        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (assoc 'y alist :test #'eq) (cadr alist)))

        (null (assoc 'key '()))
        (null (assoc 'nil '(())))
        (null (assoc 'nil '(() ())))
        (let ((alist '(nil nil nil (x . 100) (y . 200) (z . 50))))
          (eq (assoc 'y alist) (car (cddddr alist))))
        (let ((alist '((1 . a) nil (2 . b) (nil))))
          (eq (assoc 'nil alist) (cadddr alist)))

        (let ((alist '((x . 100) (y . 200) (x . 100) (z . 50))))
          (eq (assoc 'y alist) (cadr alist)))

        (let ((alist '((a . 1) (b . 2) (c . 3) (d . 4))))
          (eq (assoc 'a alist :test-not (complement #'eq)) (car alist)))

        (let ((alist '((a . 1) (b . 2) (c . 3) (d . 4))))
          (null (assoc 'z alist :test-not (complement #'eq))))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc 'aa alist :key #'cadr :test #'eq) (car alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc 'bb alist :key #'cadr :test #'eq) (cadr alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc 'cc alist :key #'cadr :test #'eq) (caddr alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc 'dd alist :key #'cadr :test #'eq) (cadddr alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (null (assoc 'ee alist :key #'cadr :test #'eq)))

        (let ((alist '(((a aa aaa)) nil ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc 'dd alist :key #'cadr :test #'eq) (car (cddddr alist))))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) nil ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc 'dd alist :key #'cadr :test #'eq) (car (cddddr alist))))

        (let ((alist '(((a aa aaa)) nil ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc 'dd alist :key #'cadr :test #'eq) (car (cddddr alist))))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)) nil)))
          (eq (assoc 'dd alist :key #'cadr :test #'eq) (cadddr alist)))



        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (assoc-if #'(lambda (arg) (eq arg 'y)) alist) (cadr alist)))

        (null (assoc-if #'consp '((x . 100) (y . 200) (z . 50))))

        (null (assoc-if #'(lambda (x) (eq x 'key)) '()))
        (null (assoc-if #'identity '(())))
        (null (assoc-if #'identity '(() ())))
        (let ((alist '(nil nil nil (x . 100) (y . 200) (z . 50))))
          (eq (assoc-if #'(lambda (arg) (eq arg 'y)) alist) (car (cddddr alist))))
        (let ((alist '((1 . a) nil (2 . b) (nil))))
          (eq (assoc-if #'(lambda (arg) (null arg)) alist) (cadddr alist)))


        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc-if #'(lambda (x) (eq x 'aa)) alist :key #'cadr) (car alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc-if  #'(lambda (x) (eq x 'bb)) alist :key #'cadr) (cadr alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (null (assoc-if #'(lambda (x) (eq x 'ee)) alist :key #'cadr)))



        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (assoc-if-not #'(lambda (arg) (not (eq arg 'y))) alist) (cadr alist)))

        (null (assoc-if-not (complement #'consp) '((x . 100) (y . 200) (z . 50))))

        (null (assoc-if-not #'(lambda (x) (not (eq x 'key))) '()))
        (null (assoc-if-not #'identity '(())))
        (null (assoc-if-not #'identity '(() ())))
        (let ((alist '(nil nil nil (x . 100) (y . 200) (z . 50))))
          (eq (assoc-if-not #'(lambda (arg) (not (eq arg 'y))) alist)
              (car (cddddr alist))))
        (let ((alist '((1 . a) nil (2 . b) (nil))))
          (eq (assoc-if-not #'identity alist) (cadddr alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc-if-not #'(lambda (x) (not (eq x 'aa))) alist :key #'cadr)
              (car alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (eq (assoc-if-not #'(lambda (x) (not (eq x 'bb))) alist :key #'cadr)
              (cadr alist)))

        (let ((alist '(((a aa aaa)) ((b bb bbb)) ((c cc ccc)) ((d dd ddd)))))
          (null (assoc-if-not #'(lambda (x) (not (eq x 'ee))) alist :key #'cadr)))


        (equal (copy-alist '((a . 10) (b . 100) (c . 1000)))
               '((a . 10) (b . 100) (c . 1000)))

        (let* ((alist '((a . 10) (b . 100) (c . 1000)))
               (copy (copy-alist alist)))
          (and (not (eq alist copy))
               (not (eq (cdr alist) (cdr copy)))
               (not (eq (cddr alist) (cddr copy)))
               (not (eq (car alist) (car copy)))
               (not (eq (cadr alist) (cadr copy)))
               (not (eq (caddr alist) (caddr copy)))))

        (let* ((alist '((a 10 x) (b 100 y) (c 1000 z)))
               (copy (copy-alist alist)))
          (and (not (eq alist copy))
               (not (eq (cdr alist) (cdr copy)))
               (not (eq (cddr alist) (cddr copy)))
               (not (eq (car alist) (car copy)))
               (not (eq (cadr alist) (cadr copy)))
               (not (eq (caddr alist) (caddr copy)))
               (eq (cdar alist) (cdar copy))
               (eq (cdadr alist) (cdadr copy))
               (eq (cdaddr alist) (cdaddr copy))))


        (let* ((alist (pairlis '(x y z) '(xx yy zz) '((a . aa) (b . bb)))))
          (and (equal (assoc 'x alist) '(x . xx))
               (equal (assoc 'y alist) '(y . yy))
               (equal (assoc 'z alist) '(z . zz))
               (equal (assoc 'a alist) '(a . aa))
               (equal (assoc 'b alist) '(b . bb))
               (null (assoc 'key alist))))

        (let* ((alist (pairlis '(x y z) '(xx yy zz))))
          (and (equal (assoc 'x alist) '(x . xx))
               (equal (assoc 'y alist) '(y . yy))
               (equal (assoc 'z alist) '(z . zz))
               (null (assoc 'key alist))))


        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (rassoc '200 alist) (cadr alist)))

        (null (rassoc 'no-such-datum '((x . 100) (y . 200) (z . 50))))

        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (rassoc '200 alist :test #'=) (cadr alist)))

        (null (rassoc 'key '()))
        (null (rassoc 'nil '(())))
        (null (rassoc 'nil '(() ())))

        (let ((alist '(nil nil nil (x . 100) (y . 200) (z . 50))))
          (eq (rassoc '200 alist) (car (cddddr alist))))
        (let ((alist '((1 . a) nil (2 . b) (nil))))
          (eq (rassoc 'nil alist) (cadddr alist)))

        (let ((alist '((x . 100) (y . 200) (x . 100) (z . 50))))
          (eq (rassoc '200 alist) (cadr alist)))

        (let ((alist '((a . 1) (b . 2) (c . 3) (d . 4))))
          (eq (rassoc '1 alist :test-not (complement #'=)) (car alist)))

        (let ((alist '((a . 1) (b . 2) (c . 3) (d . 4))))
          (null (rassoc '9 alist :test-not (complement #'=))))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (eq (rassoc 'aa alist :key #'car :test #'eq) (car alist)))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (eq (rassoc 'ddd alist :key #'cadr :test #'eq) (cadddr alist)))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (null (rassoc 'eee alist :key #'cadr :test #'eq)))

        (let ((alist '((a aa aaa) nil (b bb bbb) (c cc ccc) (d dd ddd))))
          (eq (rassoc 'ddd alist :key #'cadr :test #'eq) (car (cddddr alist))))

        (let ((alist '((a aa aaa) (b bb bbb) nil (c cc ccc) (d dd ddd))))
          (eq (rassoc 'ddd alist :key #'cadr :test #'eq) (car (cddddr alist))))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd) nil)))
          (eq (rassoc 'ddd alist :key #'cadr :test #'eq) (car (cdddr alist))))

        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (rassoc-if #'(lambda (arg) (= arg 200)) alist) (cadr alist)))

        (null (rassoc-if #'consp '((x . 100) (y . 200) (z . 50))))

        (null (rassoc-if #'(lambda (x) (eq x 'key)) '()))
        (null (rassoc-if #'identity '(())))
        (null (rassoc-if #'identity '(() ())))
        (let ((alist '(nil nil nil (x . 100) (y . 200) (z . 50))))
          (eq (rassoc-if #'(lambda (arg) (= arg 200)) alist) (car (cddddr alist))))
        (let ((alist '((1 . a) nil (2 . b) (nil))))
          (eq (rassoc-if #'(lambda (arg) (null arg)) alist) (cadddr alist)))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (eq (rassoc-if #'(lambda (x) (eq x 'aaa)) alist :key #'cadr) (car alist)))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (eq (rassoc-if  #'(lambda (x) (eq x 'bbb)) alist :key #'cadr) (cadr alist)))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (null (rassoc-if #'(lambda (x) (eq x 'eee)) alist :key #'cadr)))


        (let ((alist '((x . 100) (y . 200) (z . 50))))
          (eq (rassoc-if-not #'(lambda (arg) (not (= arg 200))) alist) (cadr alist)))

        (null (rassoc-if-not (complement #'consp) '((x . 100) (y . 200) (z . 50))))

        (null (rassoc-if-not #'(lambda (x) (not (eq x 'key))) '()))
        (null (rassoc-if-not #'identity '(())))
        (null (rassoc-if-not #'identity '(() ())))
        (let ((alist '(nil nil nil (x . 100) (y . 200) (z . 50))))
          (eq (rassoc-if-not #'(lambda (arg) (not (= arg 200))) alist)
              (car (cddddr alist))))
        (let ((alist '((1 . a) nil (2 . b) (nil))))
          (eq (assoc-if-not #'identity alist) (cadddr alist)))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (eq (rassoc-if-not #'(lambda (x) (not (eq x 'aaa))) alist :key #'cadr)
              (car alist)))

        (let ((alist '((a aa aaa) (b bb bbb) (c cc ccc) (d dd ddd))))
          (eq (rassoc-if-not #'(lambda (x) (not (eq x 'bbb))) alist :key #'cadr)
              (cadr alist)))

        (let ((alist '(((a aa aaa) . 0) ((b bb bbb) . 1) ((c cc ccc) . 2))))
          (eq (rassoc-if-not #'(lambda (x) (not (= x '2))) alist :key #'1+)
              (cadr alist)))

        #++
        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (multiple-value-bind (indicator value tail)
              (get-properties plist '(prop3 prop4 propX propY))
            (and (eq indicator 'prop3)
                 (eql value 3)
                 (eq tail (nthcdr 4 plist)))))
        #++
        (multiple-value-bind (indicator value tail)
            (get-properties '(prop1 1 prop2 2 prop3 3 prop4 4)
                            '(propX propY propZ))
          (and (eq indicator nil)
               (eq value nil)
               (eq tail nil)))
        #++
        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (multiple-value-bind (indicator value tail)
              (get-properties plist '(prop1))
            (and (eq indicator 'prop1)
                 (eql value 1)
                 (eq tail plist))))
        #++
        (let ((plist '(prop1 1 nil nil prop2 2 prop3 3 prop4 4)))
          (multiple-value-bind (indicator value tail)
              (get-properties plist '(nil))
            (and (eq indicator nil)
                 (eql value nil)
                 (eq tail (cddr plist)))))
        #++
        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (multiple-value-bind (indicator value tail)
              (get-properties plist '(prop3 prop4 propX propY prop1))
            (and (eq indicator 'prop1)
                 (eql value 1)
                 (eq tail plist))))


        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (eql (getf plist 'prop1) 1))

        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (eql (getf plist 'prop2) 2))

        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (eql (getf plist 'prop3) 3))

        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (eql (getf plist 'prop4) 4))

        (let ((plist
               '(prop1 1 prop2 2 prop3 3 prop4 4 prop1 5 prop2 6 prop3 7 prop4 8)))
          (eql (getf plist 'prop1) 1))

        (let ((plist
               '(prop1 1 prop2 2 prop3 3 prop4 4 prop1 5 prop2 6 prop3 7 prop4 8)))
          (eql (getf plist 'prop2) 2))

        (let ((plist
               '(prop1 1 prop2 2 prop3 3 prop4 4 prop1 5 prop2 6 prop3 7 prop4 8)))
          (eql (getf plist 'prop3) 3))

        (let ((plist
               '(prop1 1 prop2 2 prop3 3 prop4 4 prop1 5 prop2 6 prop3 7 prop4 8)))
          (eql (getf plist 'prop4) 4))

        (let ((plist
               '(prop1 1 prop2 2 prop3 3 prop4 4 prop1 5 prop2 6 prop3 7 prop4 8)))
          (null (getf plist 'propX)))

        (let ((plist '(prop1 1 prop2 2 prop3 3 prop4 4)))
          (eq (getf plist 'weird-property 'not-found) 'not-found))


        (let ((plist (copy-list '(prop1 1 prop2 2 prop3 3 prop4 4))))
          (and (eql (setf (getf plist 'prop1) 9) 9)
               (eql (getf plist 'prop1) 9)))

        (let ((plist nil))
          (and (eql (setf (getf plist 'prop1) 9) 9)
               (eql (getf plist 'prop1) 9)))

        (let ((plist '()))
          (incf (getf plist 'count 0))
          (eql (getf plist 'count) 1))

        (let ((x (list nil)))
          (and (eql (setf (getf (car x) 'prop1) 9) 9)
               (eql (getf (car x) 'prop1) 9)))


        (let ((plist (list 'p1 1 'p2 2 'p3 3 'p4 4)))
          (and (remf plist 'p2)
               (eq (getf plist 'p2 'not-found) 'not-found)))

        (let ((plist (list 'p1 1 'p2 2 'p3 3 'p4 4)))
          (and (remf plist 'p3)
               (eq (getf plist 'p3 'not-found) 'not-found)))

        (let ((plist (list 'p1 1 'p2 2 'p3 3 'p4 4)))
          (and (remf plist 'p4)
               (eq (getf plist 'p4 'not-found) 'not-found)))

        (let ((plist (list 'p1 1 'p2 2 'p3 3 'p4 4)))
          (and (null (remf plist 'pX))
               (equal plist '(p1 1 p2 2 p3 3 p4 4))))

        (let ((plist (list 'p1 1 'p2 2 'p3 3 'p4 4)))
          (and (remf plist 'p4)
               (remf plist 'p2)
               (remf plist 'p3)
               (remf plist 'p1)
               (null (remf plist 'pX))
               (null (remf plist 'p1))
               (null (remf plist 'p2))
               (null (remf plist 'p3))
               (null (remf plist 'p4))
               (null plist)))


        (let ((plist (list 'p1 1 'p2 2 'p3 3 'p4 4 'p1 5 'p2 6 'p3 7 'p4 8)))
          (and (remf plist 'p4)
               (remf plist 'p2)
               (remf plist 'p3)
               (remf plist 'p1)
               (null (remf plist 'pX))
               (eql (getf plist 'p1) 5)
               (eql (getf plist 'p2) 6)
               (eql (getf plist 'p3) 7)
               (eql (getf plist 'p4) 8)))

        (let ((plist (list 'p1 100 'p1 1 'p2 2 'p3 3 'p4 4)))
          (and (eql (getf plist 'p1) 100)
               (remf plist 'p1)
               (eql (getf plist 'p1) 1)
               (remf plist 'p1)
               (null (getf plist 'p1))))

        (let ((plist (list 'p1 1 'p2 2 'p3 3 'p4 4)))
          (and (remf plist 'p4)
               (null (getf plist 'p4))))


        (let ((list1 (list 1 1 2 3 4 'a 'b 'c "A" "B" "C" "d"))
              (list2 (list 1 4 5 'b 'c 'd "a" "B" "c" "D")))
          (null (set-exclusive-or (intersection list1 list2) '(C B 4 1 1)))
          (null (set-exclusive-or (intersection list1 list2 :test 'equal)
                                  '("B" C B 4 1 1)
                                  :test 'equal))
          (null (set-exclusive-or (intersection list1 list2 :test #'equalp)
                                  '("d" "C" "B" "A" C B 4 1 1)
                                  :test #'equalp)))

        (null (intersection '(0 1 2) '()))
        (null (intersection '() '()))
        (null (intersection '() '(0 1 2)))
        (equal (intersection '(0) '(0)) '(0))
        (equal (intersection '(0 1 2 3) '(2)) '(2))
        (member 0 (intersection '(0 0 0 0 0) '(0 1 2 3 4 5)))
        (null (set-exclusive-or (intersection '(0 1 2 3 4) '(4 3 2 1 0))
                                '(4 3 2 1 0)))
        (null (set-exclusive-or (intersection '(0 1 2 3 4) '(0 1 2 3 4))
                                '(0 1 2 3 4)))
        (null (set-exclusive-or (intersection '(0 1 2 3 4) '(4 3 2 1 0))
                                '(0 1 2 3 4)))


        (let ((list1 (list "A" "B" "C" "d" "e" "F" "G" "h"))
              (list2 (list "a" "B" "c" "D" "E" "F" "g" "h")))
          (null (set-exclusive-or (intersection list1 list2
                                                :test #'char=
                                                :key #'(lambda (x) (char x 0)))
                                  '("B" "F" "h")
                                  :test #'char=
                                  :key #'(lambda (x) (char x 0)))))

        (let ((list1 (list "A" "B" "C" "d" "e" "F" "G" "h"))
              (list2 (list "a" "B" "c" "D" "E" "F" "g" "h")))
          (null (set-exclusive-or (intersection list1 list2
                                                :test #'char-equal
                                                :key #'(lambda (x) (char x 0)))
                                  '("A" "B" "C" "d" "e" "F" "G" "h")
                                  :test #'char-equal
                                  :key #'(lambda (x) (char x 0)))))

        (let ((list1 (list "A" "B" "C" "d"))
              (list2 (list             "D" "E" "F" "g" "h")))
          (null (set-exclusive-or (intersection list1 list2
                                                :test #'char-equal
                                                :key #'(lambda (x) (char x 0)))
                                  '("d")
                                  :test #'char-equal
                                  :key #'(lambda (x) (char x 0)))))




        (let ((list1 (list 1 1 2 3 4 'a 'b 'c "A" "B" "C" "d"))
              (list2 (list 1 4 5 'b 'c 'd "a" "B" "c" "D")))
          (null (set-exclusive-or (nintersection (copy-list list1) list2) '(C B 4 1 1)))
          (null (set-exclusive-or (nintersection (copy-list list1) list2 :test 'equal)
                                  '("B" C B 4 1 1)
                                  :test 'equal))
          (null (set-exclusive-or (nintersection (copy-list list1) list2 :test #'equalp)
                                  '("d" "C" "B" "A" C B 4 1 1)
                                  :test #'equalp)))

        (null (nintersection (list 0 1 2) '()))
        (null (nintersection '() '()))
        (null (nintersection '() '(0 1 2)))
        (equal (nintersection (list 0) '(0)) '(0))
        (equal (nintersection (list 0 1 2 3) '(2)) '(2))
        (member 0 (nintersection (list 0 0 0 0 0) '(0 1 2 3 4 5)))
        (null (set-exclusive-or (nintersection (list 0 1 2 3 4) '(4 3 2 1 0))
                                '(4 3 2 1 0)))
        (null (set-exclusive-or (nintersection (list 0 1 2 3 4) '(0 1 2 3 4))
                                '(0 1 2 3 4)))
        (null (set-exclusive-or (nintersection (list 0 1 2 3 4) '(4 3 2 1 0))
                                '(0 1 2 3 4)))


        (let ((list1 (list "A" "B" "C" "d" "e" "F" "G" "h"))
              (list2 (list "a" "B" "c" "D" "E" "F" "g" "h")))
          (null (set-exclusive-or (nintersection list1 list2
                                                 :test #'char=
                                                 :key #'(lambda (x) (char x 0)))
                                  '("B" "F" "h")
                                  :test #'char=
                                  :key #'(lambda (x) (char x 0)))))

        (let ((list1 (list "A" "B" "C" "d" "e" "F" "G" "h"))
              (list2 (list "a" "B" "c" "D" "E" "F" "g" "h")))
          (null (set-exclusive-or (nintersection list1 list2
                                                 :test #'char-equal
                                                 :key #'(lambda (x) (char x 0)))
                                  '("A" "B" "C" "d" "e" "F" "G" "h")
                                  :test #'char-equal
                                  :key #'(lambda (x) (char x 0)))))

        (let ((list1 (list "A" "B" "C" "d"))
              (list2 (list             "D" "E" "F" "g" "h")))
          (null (set-exclusive-or (nintersection list1 list2
                                                 :test #'char-equal
                                                 :key #'(lambda (x) (char x 0)))
                                  '("d")
                                  :test #'char-equal
                                  :key #'(lambda (x) (char x 0)))))


        (let ((set '(a b c)))
          (eq (adjoin 'a set) set))

        (let* ((set '(a b c))
               (new-set (adjoin 'x set)))
          (and (equal new-set '(x a b c))
               (eq set (cdr new-set))))

        (equal (adjoin 1 nil) '(1))
        (equal (adjoin nil nil) '(nil))
        (equal (adjoin nil '(nil)) '(nil))
        (let ((set (copy-tree '((test-item 1)))))
          (equal (adjoin '(test-item 1) set) '((test-item 1) (test-item 1))))

        (let ((set (copy-tree '((test-item 1)))))
          (equal (adjoin '(test-item 1) set)
                 '((test-item 1) (test-item 1))))

        (let ((set '((test-item 1))))
          (eq (adjoin '(test-item 1) set :test #'equal) set))

        (let ((set '((test-item 1))))
          (eq (adjoin '(test-item) set :key #'car) set))

        (let ((set '((test-item 1))))
          (eq (adjoin '(test-item) set :key #'car :test #'eq) set))

        (let ((set '(("test-item" 1))))
          (eq (adjoin '("test-item") set :key #'car :test #'equal) set))


        (let ((set '((test-item 1))))
          (eq (adjoin '(test-item 1) set :test-not (complement #'equal)) set))

        (let ((set '((test-item 1))))
          (eq (adjoin '(test-item) set :test-not (complement #'eql) :key #'car) set))

        (let ((set '((test-item 1))))
          (eq (adjoin '(test-item) set :key #'car :test-not (complement #'eq)) set))

        (let ((set '(("test-item" 1))))
          (eq (adjoin '("test-item") set :key #'car :test-not (complement #'equal))
              set))


        (let ((place nil))
          (and (equal (pushnew 'a place) '(a))
               (equal place '(a))))

        (let ((place nil))
          (and (equal (pushnew 'a place) '(a))
               (equal place '(a))))

        (let ((place '((a . 1) (b . 2))))
          (and (equal (pushnew '(b . 2) place :test #'= :key #'cdr) '((a . 1) (b . 2)))
               (equal place '((a . 1) (b . 2)))))

        (let ((place '((a . 1) (b . 2))))
          (and (equal (pushnew '(b . 2) place :test-not (complement #'=) :key #'cdr)
                      '((a . 1) (b . 2)))
               (equal place '((a . 1) (b . 2)))))

        (let ((place '((a . 1) (b . 2))))
          (and (eq (pushnew '(z . 2) place :test #'= :key #'cdr) place)
               (equal place '((a . 1) (b . 2)))))

        (let ((place '((a . 1) (b . 2))))
          (and (eq (pushnew '(z . 2) place :test-not (complement #'=) :key #'cdr) place)
               (equal place '((a . 1) (b . 2)))))

        (let ((place '("love" "peace")))
          (equal (pushnew "war" place :test #'equal) '("war" "love" "peace")))

        (let ((place '("love" "peace")))
          (equal (pushnew "war" place :test-not (complement #'equal))
                 '("war" "love" "peace")))

        (let ((place '("love" "peace")))
          (and (eq (pushnew "peace" place :test #'equal) place)
               (equal place '("love" "peace"))))

        (let ((place '("love" "peace")))
          (and (eq (pushnew "peace" place :test-not (complement #'equal)) place)
               (equal place '("love" "peace"))))

        (let ((place '(("love" . l) ("peace" . p))))
          (equal (pushnew '("war" . w) place :test #'equal :key #'car)
                 '(("war" . w) ("love" . l) ("peace" . p))))

        (let ((place '(("love" . l) ("peace" . p))))
          (equal (pushnew '("war" . w) place :test-not (complement #'equal) :key #'car)
                 '(("war" . w) ("love" . l) ("peace" . p))))

        (let ((place '(("love" . l) ("peace" . p))))
          (and (eq (pushnew '("love" . l) place :test #'equal :key #'car) place)
               (equal place '(("love" . l) ("peace" . p)))))

        (let ((place '(("love" . l) ("peace" . p))))
          (and (eq (pushnew '("love" . l) place
                            :test-not (complement #'equal) :key #'car) place)
               (equal place '(("love" . l) ("peace" . p)))))

        (let ((place '(("love" . l) ("peace" . p))))
          (and (eq (pushnew '("LOVE" . L) place :test #'equalp :key #'car) place)
               (equal place '(("love" . l) ("peace" . p)))))

        (let ((place '(("love" . l) ("peace" . p))))
          (and (eq (pushnew '("LOVE" . L) place
                            :test-not (complement #'equalp) :key #'car) place)
               (equal place '(("love" . l) ("peace" . p)))))

        (let ((place '(("love" . l) ("peace" . p))))
          (equal (pushnew '("LOVE" . L) place :test #'equal :key #'car)
                 '(("LOVE" . L) ("love" . l) ("peace" . p))))

        (let ((place '(("love" . l) ("peace" . p))))
          (equal (pushnew '("LOVE" . L) place :test-not (complement #'equal) :key #'car)
                 '(("LOVE" . L) ("love" . l) ("peace" . p))))

        (let ((list (copy-tree '((1) (1 2) (1 2 3)))))
          (and (equal (pushnew '(1) list) '((1) (1) (1 2) (1 2 3)))
               (equal list '((1) (1) (1 2) (1 2 3)))))


        (let* ((list '((1) (1 2) (1 2 3)))
               (original list))
          (and (equal (pushnew '(1) list :test #'equal) '((1) (1 2) (1 2 3)))
               (eq list original)))

        (let* ((list '((1) (1 2) (1 2 3)))
               (original list))
          (and (equal (pushnew '(1) list :test #'equal :key nil) '((1) (1 2) (1 2 3)))
               (eq list original)))

        (let ((list (copy-tree '(1 (2) 3 4))))
          (and (equal (pushnew 4 (cadr list)) '(4 2))
               (equal list '(1 (4 2) 3 4))))

        (let ((list (copy-tree '(1 (2) 3 4))))
          (and (equal (pushnew 4 (cadr list) :key nil) '(4 2))
               (equal list '(1 (4 2) 3 4))))


        (null (set-difference (set-difference '(1 2 3 4 5 6 7 8 9)
                                              '(2 4 6 8))
                              '(1 3 5 7 9)))
        (null (nset-difference (set-difference (list 1 2 3 4 5 6 7 8 9)
                                               '(2 4 6 8))
                               '(1 3 5 7 9)))

        (null (set-difference (set-difference '("1" "2" "3" "4" "5" "6" "7" "8" "9")
                                              '("2" "4" "6" "8") :test #'equal)
                              '("1" "3" "5" "7" "9") :test-not (complement #'equal)))

        (null (set-difference (set-difference '("1" "2" "3" "4" "5" "6" "7" "8" "9")
                                              '("2" "4" "6" "8") :test #'equal)
                              '("1" "3" "5" "7" "9") :test-not (complement #'equal)))

        (null (nset-difference (nset-difference
                                (list "1" "2" "3" "4" "5" "6" "7" "8" "9")
                                '("2" "4" "6" "8") :test #'equal)
                               '("1" "3" "5" "7" "9") :test-not (complement #'equal)))

        (null (set-difference (set-difference '(("love") ("hate") ("peace") ("war"))
                                              '(("love") ("peace"))
                                              :key #'car
                                              :test #'equal)
                              '(("hate") ("war"))
                              :key #'car
                              :test-not (complement #'equal)))

        (null (nset-difference (nset-difference
                                (list '("love") '("hate") '("peace") '("war"))
                                '(("love") ("peace"))
                                :key #'car
                                :test #'equal)
                               '(("hate") ("war"))
                               :key #'car
                               :test-not (complement #'equal)))


        (null (set-difference '() '()))
        (null (set-difference '() '() :test #'equal :key 'identity))
        (null (nset-difference '() '()))
        (null (set-difference '() '(1 2 3)))
        (null (set-difference '() '(1 2 3) :test #'equal :key 'identity))
        (null (nset-difference '() '(1 2 3)))

        (null (set-difference '(1 2 3 4) '(4 3 2 1)))
        (null (nset-difference (list 1 2 3 4) '(4 3 2 1)))
        (null (set-difference '(1 2 3 4) '(2 4 3 1)))
        (null (nset-difference (list 1 2 3 4) '(2 4 3 1)))
        (null (set-difference '(1 2 3 4) '(1 3 4 2)))
        (null (nset-difference (list 1 2 3 4) '(1 3 4 2)))
        (null (set-difference '(1 2 3 4) '(1 3 2 4)))
        (null (nset-difference (list 1 2 3 4) '(1 3 2 4)))


        (eq (set-difference (set-difference '(1 2 3) '())
                            '(1 2 3))
            '())
        (eq (nset-difference (nset-difference (list 1 2 3) '())
                             '(1 2 3))
            '())

        (eq (set-difference (set-difference '(1 2 3) '(1))
                            '(2 3))
            '())
        (eq (nset-difference (nset-difference (list 1 2 3) '(1))
                             '(2 3))
            '())

        (eq (set-difference (set-difference '(1 2 3) '(1 2))
                            '(3))
            '())
        (eq (nset-difference (nset-difference (list 1 2 3) '(1 2))
                             '(3))
            '())


        (null (set-exclusive-or (set-exclusive-or '(1 2 3) '(2 3 4))
                                '(1 4)))
        (null (nset-exclusive-or (nset-exclusive-or (list 1 2 3) '(2 3 4))
                                 '(1 4)))
        (null (set-exclusive-or (set-exclusive-or '(1 2 3) '(1 3))
                                '(2)))
        (null (nset-exclusive-or (nset-exclusive-or (list 1 2 3) '(1 3))
                                 '(2)))
        (null (set-exclusive-or '() '()))
        (null (nset-exclusive-or '() '()))
        (null (set-exclusive-or '(1 2 3) '(3 2 1)))
        (null (nset-exclusive-or (list 1 2 3) '(3 2 1)))
        (null (set-exclusive-or '(1 2 3) '(2 3 1)))
        (null (nset-exclusive-or (list 1 2 3) '(2 3 1)))
        (null (set-exclusive-or '(1 2 3) '(1 3 2)))
        (null (nset-exclusive-or (list 1 2 3) '(1 3 2)))

        (null (set-exclusive-or (set-exclusive-or '(1 2 3) '())
                                '(3 2 1)))
        (null (nset-exclusive-or (nset-exclusive-or (list 1 2 3) '())
                                 '(3 2 1)))
        (null (set-exclusive-or (set-exclusive-or '() '(1 2 3))
                                '(2 1 3)))
        (null (nset-exclusive-or (nset-exclusive-or '() '(1 2 3))
                                 '(2 1 3)))

        (null (set-exclusive-or '("car" "ship" "airplane" "submarine")
                                '("car" "ship" "airplane" "submarine")
                                :test #'equal))
        (null (nset-exclusive-or (copy-list '("car" "ship" "airplane" "submarine"))
                                 '("car" "ship" "airplane" "submarine")
                                 :test #'equal))

        (null (set-exclusive-or '("car" "ship" "airplane" "submarine")
                                '("CAR" "SHIP" "AIRPLANE" "SUBMARINE")
                                :test #'equalp))
        (null (nset-exclusive-or (copy-list '("car" "ship" "airplane" "submarine"))
                                 '("CAR" "SHIP" "AIRPLANE" "SUBMARINE")
                                 :test #'equalp))

        (null (set-exclusive-or '("car" "ship" "airplane" "submarine")
                                '("ship" "airplane" "submarine" "car")
                                :test-not (complement #'equal)))
        (null (nset-exclusive-or (copy-list '("car" "ship" "airplane" "submarine"))
                                 '("ship" "airplane" "submarine" "car")
                                 :test-not (complement #'equal)))

        (null (set-exclusive-or '(("car") ("ship") ("airplane") ("submarine"))
                                '(("car") ("ship") ("airplane") ("submarine"))
                                :test #'string=
                                :key #'car))
        (null (nset-exclusive-or (copy-tree
                                  '(("car") ("ship") ("airplane") ("submarine")))
                                 '(("car") ("ship") ("airplane") ("submarine"))
                                 :test #'string=
                                 :key #'car))

        (null (set-exclusive-or '(("car") ("ship") ("airplane") ("submarine"))
                                '(("car") ("ship") ("airplane") ("submarine"))
                                :test-not (complement #'string=)
                                :key #'car))
        (null (nset-exclusive-or (copy-tree
                                  '(("car") ("ship") ("airplane") ("submarine")))
                                 '(("car") ("ship") ("airplane") ("submarine"))
                                 :test-not (complement #'string=)
                                 :key #'car))

        (null (set-exclusive-or
               (set-exclusive-or '("car" "ship" "airplane" "submarine")
                                 '("car" "ship" "horse" "airplane" "submarine" "camel")
                                 :test #'equal)
               '("camel" "horse")
               :test-not (complement #'equal)))

        (null (nset-exclusive-or
               (nset-exclusive-or (list "car" "ship" "airplane" "submarine")
                                  '("car" "ship" "horse" "airplane" "submarine" "camel")
                                  :test #'equal)
               '("camel" "horse")
               :test-not (complement #'equal)))


        (subsetp '(1 2 3) '(1 2 3))
        (subsetp '(1 2 3) '(3 2 1))
        (subsetp '(1 2 3) '(2 1 3))

        (null (subsetp '(1 2 3 4) '(2 1 3)))
        (subsetp '(1) '(2 1 3))
        (subsetp '(1 2) '(1 2 3 4 5 6 7 8))
        (subsetp '(1 2 3 4 5) '(8 7 6 5 4 3 2 1))
        #++ ;; assumes literal strings are not eql
        (null (subsetp '("car" "ship" "airplane" "submarine")
                       '("car" "ship" "horse" "airplane" "submarine" "camel")))

        (subsetp '("car" "ship" "airplane" "submarine")
                 '("car" "ship" "horse" "airplane" "submarine" "camel")
                 :test #'equal)

        (subsetp '("CAR" "SHIP" "AIRPLANE" "SUBMARINE")
                 '("car" "ship" "horse" "airplane" "submarine" "camel")
                 :test #'equalp)

        (subsetp '(("car") ("ship") ("airplane") ("submarine"))
                 '(("car") ("ship") ("horse") ("airplane") ("submarine") ("camel"))
                 :test #'string=
                 :key #'car)


        (null (union '() '()))
        (null (nunion '() '()))
        (null (set-difference (union '(1 2 3) '(2 3 4))
                              '(1 2 3 4)))
        (null (set-difference (nunion (list 1 2 3) (list 2 3 4))
                              '(1 2 3 4)))

        (null (set-difference (union '(1 2 3) '(1 2 3))
                              '(1 2 3)))
        (null (set-difference (nunion (list 1 2 3) (list 1 2 3))
                              '(1 2 3)))

        (null (set-difference (union '(1) '(3 2 1))
                              '(1 2 3)))
        (null (set-difference (nunion (list 1) (list 3 2 1))
                              '(1 2 3)))

        (null (set-difference (union '(1 2 3) '())
                              '(1 2 3)))
        (null (set-difference (nunion (list 1 2 3) '())
                              '(1 2 3)))

        (null (set-difference (union '() '(1 2 3))
                              '(1 2 3)))
        (null (set-difference (nunion '() (list 1 2 3))
                              '(1 2 3)))

        (null (set-difference (union '(1 2 3) '(2))
                              '(1 2 3)))
        (null (set-difference (nunion (list 1 2 3) (list 2))
                              '(1 2 3)))


        (null (set-difference (union '("Alpha" "Bravo" "Charlie")
                                     '("Bravo" "Charlie" "Delta" "Echo")
                                     :test #'string=)
                              '("Alpha" "Bravo" "Charlie" "Delta" "Echo")
                              :test-not (complement #'string=)))

        (null (set-difference (nunion (list "Alpha" "Bravo" "Charlie")
                                      (list "Bravo" "Charlie" "Delta" "Echo")
                                      :test #'string=)
                              '("Alpha" "Bravo" "Charlie" "Delta" "Echo")
                              :test-not (complement #'string=)))

        (null (set-difference
               (union (copy-tree '(("Alpha") ("Bravo") ("Charlie")))
                      (copy-tree '(("Bravo") ("Charlie") ("Delta") ("Echo")))
                      :test #'string=
                      :key #'car)
               '(("Alpha") ("Bravo") ("Charlie") ("Delta") ("Echo"))
               :test-not (complement #'string=)
               :key #'car))

        (null (set-difference
               (nunion (copy-tree '(("Alpha") ("Bravo") ("Charlie")))
                       (copy-tree '(("Bravo") ("Charlie") ("Delta") ("Echo")))
                       :test #'string=
                       :key #'car)
               '(("Alpha") ("Bravo") ("Charlie") ("Delta") ("Echo"))
               :test-not (complement #'string=)
               :key #'car))


        (null (set-difference (union '("Alpha" "Bravo" "Charlie")
                                     '("BRAVO" "CHARLIE" "DELTA" "ECHO")
                                     :test #'string-equal)
                              '("ALPHA" "BRAVO" "CHARLIE" "DELTA" "ECHO")
                              :test-not (complement #'string-equal)))



        )


      (c3* (gensym "aaa")
        (defun line (s)
          (write-text (s+ "
" s "
")))
        (defun run-tests ()
          ;(ftrace "running tests...")
          (line (list->str (:foo)))
          ;(ftrace "...")
          (line (list->str ("more-tests")))
          (line (list->str ("old-tests")))
          (line (list->str ("lambda-list-tests")))
          (line (list->str ("sacla-cons-tests")))
          (line (list->str ("expected-fail")))
          (line (list->str ("expected error")))
          (line (list->str ("bad-abc")))
          (line (list->str ("bad1-abc")))
          (line (list->str ("bad2-abc")))
          ("bad4-abc")
          (handler-case
              (line (list->str ("verify-error")))
            (t (e)
              (line (s+ "verify error tests failed: " e))))
          (line "done tests..."))

        (defun main (arg)
          (let ((foo (%new- flash:flash.text.Text-Field))
                (rfoo (%new- flash:flash.text.Text-Field))
                (canvas (%new- flash:flash.display.Sprite)))
            (setf (flash:.y foo) 20)
            (setf (flash:.width foo) 600)
            (setf (flash:.auto-size foo) "left")
            (setf (flash:.text-color foo) #x30e830)
            (setf (flash:.word-wrap foo) t)
            (setf (flash:.background foo) t)
            (setf (flash:.background-color foo) #x20202020)
            (setf (flash:.width rfoo) 600)
            (setf (flash:.auto-size rfoo) "left")
            (setf (flash:.text-color rfoo) #x30e830)
            (setf (flash:.word-wrap rfoo) t)
            (setf (flash:.background rfoo) t)
            (setf (flash:.background-color rfoo) #x20202020)
            (flash:add-child arg canvas)
            (flash:add-child arg foo)
            (flash:add-child arg rfoo)

            (%set-property this :canvas canvas)
            (frame nil)
            (flash:add-event-listener canvas "click" (%asm (:get-lex frame)))
            (setf (flash:.text foo) "run tests...
")
            (setf (flash:.text rfoo) "x")
            (setf (running (app)) rfoo)
            (setf (text (app)) foo)
            ;(ftrace "calling run-tests...")
            (run-tests)))

        (defmacro with-fill (gfx (color alpha &key line-style) &body body)
          `(progn
             ,@(when line-style
                     `((flash:line-style ,gfx ,@line-style)))
             (flash:begin-fill ,gfx ,color ,alpha)
             ,@body
             (flash:end-fill ,gfx)))
        (defun foo ()
          (lambda (a) (lambda (b) (lambda (c) (+ a c b)))))

        (defun frame (evt)
          (let* ((canvas (slot-value this :canvas))
                 (gfx (flash:.graphics canvas))
                 (matrix (%new- flash:flash.geom.Matrix)))

            (setf (flash:.opaque-background canvas) #x0d0f00)
            (flash:clear gfx)
            (with-fill gfx (#x202600  0.5)
                       (flash:draw-rect gfx 0 0 600 400 ))
            (flash:create-gradient-box matrix
                                       600 400 0 0 0)
            (flash:begin-gradient-fill gfx "radial"
                                       (vector #x202600 #x0d0f00) ;; colors
                                       (vector 1 1)   ;; alpha
                                       (vector 0 255) ;; ratios
                                       matrix)
            (flash:draw-rect gfx 0 0 600 400 )
            (flash:trace "click")
            (flash:end-fill gfx)
            #++(when evt (run-tests))
))))
    (list
     (3b-swf:show-frame)))
   :x-twips 600
   :y-twips 400
   :frame-rate 30
   :compress t
   :flash-version 9))
