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

    (swf-defmemfun %intern (package name)
      (%new* %flash:q-name package name))

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
    (c3 '(progn
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
;;; fixme: jump out of function call
          ;;(ftrace (tagbody (+ 1 2 (go foo) 3 4) foo))
          ;;(ftrace (tagbody (+ 1 2 (if (baz) 3 (go foo)) 4 5) foo))
          ;(ftrace (let ((a 1) (b 2)) (lambda (a c) (+ a b c))))
          (ftrace :here3)
          (ftrace (let ((a 1)) (flet ((foo (b) (+ a b))) (foo 10))))
          (ftracef (let ((a 1) (b 10)) (lambda (a c) (+ a b c))) 100 1000)
          (ftrace (let ((a 1) (b 10))
                    (flet ((foo (a c) (+ a b c)))
                      (foo 100 1000))))
          ;;(ftrace (+ 1 2 (block foo (flet ((bar () (return-from foo 3))) (bar))) 4 5))

          (ftrace (let ((x 1)) (lambda (y) (+ x y))))
          (ftracef (lambda (a) (lambda (b) (+ a b))) 1234)
          (ftracef (lambda (a) (let ((j 123)) (lambda (b) (+ a b j)))))

          (ftrace (lambda (a) (tagbody (let ((j 123)) (lambda (b) (+ a b j))))))
          (ftrace (lambda (a) (tagbody (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (+ a b j))))))))
          (ftrace (lambda (a) (tagbody foo (let ((k 123)) (let ((j 1)) (let ((l k)) (lambda (b) (if (zerop a) (go bar) (+ a b j)))))) bar)))
          ;;(ftrace (flet ((x (a) (list (y (return-from x 1) a))) (y (a) (x a))) #'x))

          (ftrace (lambda (a) (lambda (x) (+ x a)) a))
          ;;(ftrace (lambda () (tagbody foo (go bar) bar (lambda () (go foo)))))

          ;;(ftrace (tagbody 1 (lambda (x) (go 1))))
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
          ;;(ftrace (flet (((setf foo) (&rest r) r)) (setf (foo 1 2 3) 4))) ;;fixme
          ;;(ftrace (flet (((setf foo) (&rest r) r)) (function (setf foo)))) ;;fixme

          (ftrace :done)
))

    (swf-defmemfun run-tests ()
      (+ "| =" (:top-level)))

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