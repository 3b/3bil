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
                         for string = (format nil "~s" i)
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
        (if 1 'a)                   ;; compile error
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
        "more tests")


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
