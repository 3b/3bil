(in-package :avm2-compiler)

;;; tests for new compiler

(with-open-file (s "/tmp/foo.swf"
                   :direction :output
                              :element-type '(unsigned-byte 8)
                              :if-exists :supersede)
  (with-compilation-to-stream s ("frame1" `((0 "testClass"))
                                          :swf-version 9
                                          :x-twips (* 20 400)
                                          :y-twips (* 20 300))

    (def-swf-class :test-class "test-class" %flash.display:sprite (blob)
                   (()
                    (main this)))


  (def-swf-class throw-exception-type "what goes here?"
    %flash:object (throw-exception-tag throw-exception-value)
                 ((a b)
                  (%set-property this throw-exception-tag a)
                  (%set-property this throw-exception-value b)))

  (def-swf-class block-exception-type "what goes here?"
    %flash:object (block-exception-tag block-exception-value)
                 ((a b)
                  (%set-property this block-exception-tag a)
                  (%set-property this block-exception-value b)))

  (def-swf-class go-exception-type "what goes here?"
    %flash:object (go-exception-tag go-exception-index)
                 ((a b)
                  ;; fixme: index should be typed as int
                  (%set-property this go-exception-tag a)
                  (%set-property this go-exception-index b)))

    (swf-defmemfun %intern (package name)
      (%new* %flash:q-name package name))

    (swf-defmemfun %exit-point-value ()
      (%new* %flash:q-name "exit" "point"))

    (swf-defmemfun ftrace (x)
      (%flash:trace x))
    (swf-defmemfun ftracef (x &arest args)
      (%flash:trace x)
      (ftrace (+ "=>" (%flash:apply x nil args))))
    (swf-defmemfun funcall (x &arest args)
      (%flash:apply x nil args ))

    (swf-defmemfun + (&arest x)
      (let ((sum 0))
        (dotimes (i (length x) sum)
          (incf sum (aref x i)))))
    (swf-defmemfun s+ (&arest x)
      (let ((sum ""))
        (dotimes (i (length x) sum)
          (incf sum (aref x i)))))

    (swf-defmemfun = (a &arest x)
      (dotimes (i (length x) t)
        (unless (eq a (aref x i))
          (return nil))))

    (swf-defmemfun < (a &arest x)
      (dotimes (i (length x) t)
        (when (>= a (aref x i)) (return nil))
        (setf a (aref x i))))


    (swf-defmemfun baz (&arest x)
      (if (< (random 2) 1) t nil))

    (swf-defmemfun foo (&arest x)
      (ftrace (+ "foo called : " x))
      (aref x 0))
    (swf-defmemfun hoge (&arest x)
      (ftrace (+ "hoge called : " x))
      (aref x 0))

    (swf-defmemfun x (&arest x)
      (ftrace (+ "global X called : " x))
      (aref x 0))
    (swf-defmemfun y (&arest x)
      (ftrace (+ "global Y called : " x))
      (aref x 0))

    (c3 :top-level
        '(progn
          (ftrace "---------------------------------")
          (ftrace "---------------------------------")
          (ftrace '1)
          (ftrace 'a)
          (ftrace '(1 2))
          (ftrace '(1 . 2))
          (ftrace #(1 2))
          (ftrace '#(1 2))
          (ftrace (vector 1 2))
          (ftrace (progn 1))
          (ftrace (progn 1 2 3))
          (ftrace (+ 2 3))
          (ftrace (if (< 1 2 3) '< '>=))
          (ftrace (if (< 2 1 3) '< '>=))
          (ftrace (progn (progn 1 2) 'a (+ 2 3) (progn 3)))
          (ftrace (let ((a 1)) a))
          (ftrace (tagbody foo (go baz) baz))
          (ftrace (tagbody 1 (go 2) 2))
          (ftrace (symbol-macrolet ((a 'foo)) a))
          (ftrace (symbol-macrolet ((a (foo 123))) (+ a 1)))
          ;;(ftrace (symbol-macrolet ((a (foo 123))) (setq a 1)))
          ;;(ftrace (symbol-macrolet ((a (foo 123))) (let ((b 2)) (setq a 1 b 3))))
          (ftrace (macrolet ((x (a) `(list ,a))) (x 123)))
          (ftrace (macrolet ((x (a) (return-from x (list 'list 234 a)) `(list ,a))) (x 123)))
          ;;(ftrace (setq))
          (ftrace (let ((a 2)) (setq a 1)))
          (ftrace (symbol-macrolet ((x 'foo)) (list x (let ((x 'bar)) x))))
          (ftrace (block x (return-from x)))
          (ftrace (block x (return-from x 123)))
          (ftrace :here1)
          (ftrace (let ((x (block x (+ 1 2) (return-from x 123)))) x))
          (ftrace (let ((x (+ 1 2 3))) x))
          (ftrace (let ((x (progn (+ 1 2) (foo 'a) (+ 3 4))) x)))
          (ftrace (let ((x (progn (+ 1 2) (foo 'b) (+ 3 4)))) x))
          (ftrace (labels ((x (a) (list a))) (x 123)))
          (ftrace (flet ((x (a) (list a))) (x 123)))
          (ftrace :here2)
          (ftrace (flet ((x (a) (return-from x 1))) (x 123)))
          (ftrace (flet ((x (a) (return-from x 111) (list a))) (x 123)))
          (ftrace :labels)
          (ftrace (labels ((x (a) (z a))
                          (y (a) (+ a 7000))
                          (z (a) (+ (y a) 80000)))
                   (x 654)))
          (ftrace :flet)
          (ftrace (flet ((x (a) (list (y a)))
                        (y (a) (x a)))
                   (x 1234)))
          (ftracef (function (lambda (x) (+ x 1))) 1000)
          (ftracef (function foo) 1001)
          (ftrace (labels ((x (a) (list (y a))) (y (a) (x a))) (function x)))
          (ftracef (labels ((x (a) (+ (z a))) (y (a) a) (z (a) (+ (y a)))) (function x)) 1002)
          (ftrace (if t 1 2))
          (ftrace (let ((a (if (foo) 1 2))) a))
          ;;(ftrace (return-from a 1)) ;; error
          ;;(ftrace (throw 'a 1)) ;; uncaught exception
          (ftrace (catch 111 (throw 111 'thrown-111)))
 ;; fixme: intern symbols
          ;(ftrace (catch 'a (throw 'a 'thrown-a)))
          ;(ftrace (catch 'a (throw 'b 'thrown-a))) ;; uncaught exception
          (ftrace (let ((a (catch '123 (throw '123 'thrown-123)))) a))
          (ftrace (tagbody (ftrace (+ 1 2 (go foo) 3 4)) (go bar) foo (ftrace "went to foo") bar))
          (ftrace (tagbody (ftrace (+ 1 2 (if (baz) 3 (go foo)) 4 5)) (go bar) foo
                     (ftrace "went to foo") bar))
          (ftrace :here3)
          (ftrace (let ((a 1)) (flet ((foo (b) (+ a b))) (foo 10))))
          (ftracef (let ((a 1) (b 10)) (lambda (a c) (+ a b c))) 100 1000)
          (ftrace (let ((a 1) (b 10))
                    (flet ((foo (a c) (+ a b c)))
                      (foo 100 1000))))
          (ftrace :return-from)
          (ftrace (+ 1 (block xxfoo (flet ((bar () (return-from xxfoo 100) 1000)) (bar) 10000)) 2))

          (ftrace (let ((x 1)) (lambda (y) (+ x y))))
          (ftracef (lambda (a) (lambda (b) (+ a b))) 1234)
          (ftracef (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))))

          (ftrace (lambda (a) (tagbody (let ((j 123)) (lambda (b) (+ a b j))))))
          (ftrace (lambda (a) (tagbody (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (+ a b j))))))))
          (ftrace (lambda (a) (tagbody foo (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (if (zerop a) (go bar) (+ a b j)))))) bar)))
          (ftrace :return-from2)
          (ftracef (flet ((xxxx (a) (list (y (return-from xxxx 100) a)))
                          (y (a) (xxxx a))) #'xxxx) 1)
          ;;(ftracef (block x (lambda (a) (return-from x 100) 10)) 1) ;;uncaught exception
          (ftracef (labels ((x (a) (+ (y (lambda (x) (return-from x (+ a x))))
                                      1000))
                            (y (a) (funcall a 10) 1)) #'x) 1)
          (ftrace (lambda (a) (lambda (x) (+ x a)) a))
          (ftrace (lambda () (tagbody foo (go bar) bar (lambda () (go foo)))))

          (ftrace (tagbody 1 (lambda (x) (go 1))))
          (ftrace :nlx)
          (ftrace (tagbody nlx 1 (flet ((x () (go 2))) (x)) (ftrace "bug!") 2))
          (ftracef (lambda (x) (block blah 1)) 101)
          (ftracef (lambda (x) (block blah 1)) 102)
          (ftracef (lambda (x) (block blah (block baz (return-from blah 2)))) 103)
          (ftrace (lambda (x) (block baz (block blah (lambda (x) (return-from blah 2))))))
          (ftrace (block foo
                   (progn 1 2)
                   (block piyo
                     (progn 1
                            (foo)))
                   (progn (hoge) 3)
                   (return-from foo 1)))
          (ftrace :return-from-3)
          (ftrace
           (labels ((aaa (f c)
                      (ftrace (s+ "enter" c))
                      (if (< 10 c)
                          (funcall f)
                          (if f
                              (aaa f (1+ c))
                              (aaa (lambda () (return-from aaa 123)) (1+ c))))
                      (ftrace (+ "exit " c))))
             (aaa nil 0)))
          (ftrace :exit-extent)
          (ftrace (block ex1 (unwind-protect (return-from ex1 1)
                               (return-from ex1 2)))) ;;=> 2
          (ftrace (block a (block b (unwind-protect (return-from a 1) (return-from b 2))))) ;; 2
          (ftrace (catch nil (unwind-protect (throw nil 1) (throw nil 2)))) ;; 2
          (ftrace (catch 111 (catch 222 (unwind-protect (throw 111 1) (throw 222 2))))) ;; 2
          (ftrace :exit-extent4)
          (ftrace (catch 111
                    (ftrace (s+ "inner catch = "
                               (catch 111
                                 (unwind-protect (throw 111 :first)
                                   (throw 111 :second)))))
                    :outer)) ;; print second, return outer
          (ftrace (catch 111
                    (catch 222
                      (unwind-protect (1+ (catch 111 (throw 222 1)))
                        (throw 111 10))))) ;; 10
          (ftrace (catch 111
                    (catch 222
                      (unwind-protect (throw 111 3)
                        (throw 222 4)
                        (ftrace :xxx))))) ;;return 4, don't print xxx
          (ftrace (catch 111
                    (catch 222
                      (unwind-protect (throw 222 3)
                        (throw 111 4)
                        (print :xxx))))) ;; return 4, don't print xxx
          (ftrace (block nil
                    (let ((x 5))
                      (unwind-protect (return-from nil)
                        (ftrace (s+ "x=" x)))))) ;; print 5, return nil

          (ftrace :exit-extent-errors)
          #+nil(ftrace (funcall (block nil #'(lambda () (return-from nil)))))
          #+nil(ftrace (let ((a nil))
                         (tagbody t (setq a #'(lambda () (go t))))
                         (funcall a)))
          #+nil(ftrace (funcall (block nil
                                  (tagbody a (return-from nil
                                               #'(lambda () (go a)))))))
          (ftrace :here5)
          (ftrace (tagbody a (unwind-protect (go b) (ftrace "unwinding")) b))
          (ftrace (+ 1 (block x (return-from x 2)) 3))
          (ftrace (tagbody (+ 1 (go 2) 3) 2))
;;; setf functions
          (ftrace :flet-setf)
          (ftrace (flet (((setf foo) (a b c d) (s+ a b c d)))
                    (setf (foo 1 2 3) 4)))
          (ftrace (labels (((setf foo) (a b c d) (s+ a b c d))
                           (bar () (setf (foo "a" "b" "c") "d")))
                    (bar)))
          (ftracef (flet (((setf foo) (a b c d) (s+ a b c d)))
                    (function (setf foo))) 1 2 3 4)
;;; fixme: ensure compatible types of branches/jumps when no dest type
          (ftrace (if t 1 "2"))
          (ftrace :done)))
    (swf-defmemfun setf-foo (&arest x)
      (ftrace (+ "setf foo called : " x))
      (aref x 0))

    (swf-defmemfun init-setf1 ()
      (let ((o  (%new* %flash:object)))
        (%asm
         (:@ this)
         (:@ o)
         (:init-property setf-namespace)
         (:push-null))))

    (def-swf-class setf-namespace-type "what goes here?"
      %flash:object ()
      (()
       (%asm (:push-null))))

    (swf-defmemfun init-setf ()
      (%set-property this setf-namespace (%new* setf-namespace-type))
      #+nil(%set-aref-1 (slot-value this setf-namespace) 'foo
                        (function setf-foo))
      (let ((n (slot-value this setf-namespace))
            (f (function setf-foo)))
        (%asm
         (:@ n)
         (:@ f)
         (:init-property foo)
         (:push-null)))
      #+nil(%set-property (slot-value this setf-namespace) foo
                     (function setf-foo)))

    ;;(push 'setf-namespace )


    (push '(setf-namespace 0) (script-slots *compiler-context*))
    #+nil(c4 :top-level-init
        '(progn
          (ftrace "top-level init")
          (init-setf)
          ))
    #+nil(c3 :setf-test
        '(progn
          (ftrace (setf (foo 1 2) 3))))

    (c3 :more-tests
        '(progn
          (ftrace "dotimes 10 :")
          (dotimes (i 10)
            (ftrace (s+ "  i = " i)))
          (ftrace )
          ))

    (swf-defmemfun run-tests ()
      ;;(+ "| =" (:top-level-init))
      ;;(+ "| =" (:setf-test))
      (+ "| =" (:top-level))
      (+ "| =" (:more-tests)))

    (swf-defmemfun main (arg)
      (let ((foo (%new %flash.text:Text-Field 0))
            (canvas (%new %flash.display:Sprite 0)))
        (setf (%flash.display:width foo) 350)
        (setf (%flash.text:auto-size foo) "left")
        (setf (%flash.text:text-color foo) #x30e830)
        (setf (%flash.text:word-wrap foo) t)
        (setf (%flash.text:background foo) t)
        (setf (%flash.text:background-color foo) #x20202020)
        (let ((str "abc"))
          (incf str (run-tests))

          (setf (%flash.text:text foo) str))

        (%flash.display:add-child arg canvas)
        (%flash.display:add-child arg foo)

        (%set-property this :canvas canvas)
        (frame nil)

        (%flash.display:add-event-listener canvas "click" (%asm (:get-lex frame)))))

    (swf-defmacro with-fill (gfx (color alpha &key line-style) &body body)
      `(progn
         ,@(when line-style
                 `((%flash.display:line-style ,gfx ,@line-style)))
         (%flash.display:begin-fill ,gfx ,color ,alpha)
         ,@body
         (%flash.display:end-fill ,gfx)))

    (swf-defmemfun frame (evt)
      (let* ((canvas (slot-value this :canvas))
             (gfx (slot-value canvas '%flash.display:graphics))
             (matrix (%new %flash.geom:Matrix 0)))

        (setf (%flash.display:opaque-background canvas) #x0d0f00)
        (%flash.display:clear gfx)
        (with-fill gfx (#x202600  0.5)
                   (%flash.display:draw-rect gfx 0 0 400 300 ))
        (%flash.geom:create-gradient-box matrix
                              400 300 0 0 0)
        (%flash.display:begin-gradient-fill gfx "radial"
                              (vector #x202600 #x0d0f00) ;; colors
                              (vector 1 1)               ;; alpha
                              (vector 0 255)             ;; ratios
                              matrix)
        (%flash.display:draw-rect gfx 0 0 400 300 )
        (%flash:trace "click")
        (%flash.display:end-fill gfx)))))