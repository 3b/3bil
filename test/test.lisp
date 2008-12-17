(in-package :avm2-compiler)
;;; random tests for various features, need to figure out how to
;;; automate these at some point

(with-open-file (s "/tmp/tests.swf"
                   :direction :output
                              :element-type '(unsigned-byte 8)
                              :if-exists :supersede)
  (with-compilation-to-stream s ("frame1" `((0 "testClass")) :swf-version 9)

    (def-swf-class :test-class "test-class" %flash.display::sprite (blob)
                   (()
                    (main this)))


    #+nil(swf-defmemfun flet-test1 ()
           (%flet (foo (a b c) (+ a b c))
                  (call-%flet foo "a" "b" "c")
                  (call-%flet foo "1" "2" "3")))

    (swf-defmemfun flet-test1 ()
      (%flet (foo (a b c) (+ a b c))
             (call-%flet foo (%flet (afoo (a b c) (+ a b c))
                                    (call-%flet afoo "a" "b" "c"))
                         "b" "c" )))

    #+nil(swf-defmemfun uwp-test ()
           (let ((s2 "<"))
             (block foo
               1
               (unwind-protect
                    (if :true (return-from foo "-ret-") 4)
                 (setf s2 (+ s2 "uwp")))
               2)
             (+ s2 ">")))

    (swf-defmemfun uwp-test ()
      (let* ((s2 "<")
             (s3 (block foo
                   (unwind-protect
                        (progn
                          (return-from foo "-ret-")
                          "bleh")
                     (setf s2 (+ s2 123))))))
        (+ s2 s3 ">")))

    (swf-defmemfun cons-test ()
      (let* ((a (cons 2 3))
             (b (cons 1 a)))
        (rplaca (cdr b) 123)
        (+ "(" (car a) " " (car b) ")")))

    (swf-defmemfun dolist-test ()
      (let ((temp ""))
        (dolist (a (cons "a" (cons "b" (cons "c" nil)))
                 temp)
          (setf temp (+ temp (%flash:to-string a))))))

    (swf-defmemfun dotimes-test ()
      (let ((temp "{"))
        (setf temp (+ (dotimes (a 5 temp)
                              (setf temp (+ temp a)))
                            "}"))))

    (swf-defmemfun do/do*-tests ()
      (+ ""
         ;; examples from clhs
         (do ((temp-one 1 (1+ temp-one))
              (temp-two 0 (1- temp-two)))
             ((> (- temp-one temp-two) 5) temp-one))
         " "
         (do ((temp-one 1 (1+ temp-one))
              (temp-two 0 (1+ temp-one)))
             ((= 3 temp-two) temp-one))
         " "
         (do* ((temp-one 1 (1+ temp-one))
               (temp-two 0 (1+ temp-one)))
              ((= 3 temp-two) temp-one))))

    (swf-defmemfun rest-test (a b c &arest d)
      (+ "(" a " " b " " c " " d ")"))

    (swf-defmemfun space-test (obj count)
      (let ((now (%new %flash:date 0))
            (cons nil))
        (setf (blob obj) (dotimes (a count cons)
                           (push 1 cons)))
        (+ "[" (/ (- (%new %flash:date 0) now) 1000.0) "sec]")))

    (swf-defmemfun car-speed-test (obj count)
      (let ((now (%new %flash:date 0))
            (sum 0))
        (dolist (a (blob obj))
          (incf sum a))
        (+ "[" (/ (- (%new %flash:date 0) now) 1000.0) "sec,sum=" sum "]")))

    (swf-defmemfun space-test2 (obj count)
      (let ((now (%new %flash:date 0))
            (cons nil))
        (setf (blob obj) (dotimes (a count cons)
                           (push (+ "Hello World" a) cons)))
        (+ "[" (/ (- (%new %flash:date 0) now) 1000.0) "sec]")))

    (swf-defmemfun unused-args-test (a b c) "ok")

    (swf-defmemfun list->str (l)
      (if (atom l)
          (%flash:to-string l)
          (let ((s "("))
            (tagbody
             :start
               (incf s (car l))
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

    (swf-defmemfun i255 (a)
      (max (min (floor (* a 256)) 255) 0))

    (swf-defmemfun rgb (r g b)
      (+ (* (i255 r) 65536) (* (i255 g) 256) (i255 b)))

    (swf-defmemfun rgba (r g b a)
      (+ (* (i255 a) 65536 256) (rgb r g b)))

    (swf-defmemfun main (arg)
      (let ((foo (%new %flash.text:Text-Field 0))
            (canvas (%new %flash.display:Sprite 0)))
        (setf (%flash.display:width foo) 350)
        (setf (%flash.text:auto-size foo) "left")
        (setf (%flash.text:text-color foo) (rgb 0.2 0.9 0.2 ))
        (setf (%flash.text:word-wrap foo) t)
        (setf (%flash.text:background foo) t)
        (setf (%flash.text:background-color foo) (rgba 0.1 0.1 0.1 0.1))
        (let ((str "abc..."))
          (setf str (+ str (%flash:from-char-code 26085 26412 #x8a9e)))
          (let ((cc (cons 0 2)))
            (setf str (+ str (cons 2 3)))
            (setf str (+ str "=(" (car cc) " " (cdr cc) ")"))
            (setf str (+ str "cons size=" (%flash.sampler:get-size cc)))
            (setf str (+ str "int size=" (%flash.sampler:get-size 1)))
            (setf str (+ str " || car(nil)=" (car nil)))
            (setf str (+ str " || %typeof=" (%type-of cc)))
            (setf str (+ str " || %typep...=" (%typep cc cons-type)))
            (setf str (+ str " || %typep.1.=" (%typep 1 cons-type)))
            (setf str (+ str " || case="
                               (case (car cc)
                                 (1 "-1-")
                                 (0 "-0-")
                                 (2 "-2-")
                                 (otherwise "-t-")
                                 )))
            (setf str (+ str " || case2="
                               (case (cdr cc)
                                 (1 "-1-")
                                 (0 "-0-")
                                 (2 "-2-"))))
            (setf str (+ str " || block="
                               (block foo
                                 1
                                 (if t (return-from foo "-ret-") 4)
                                 2)))
            (setf str (+ str " uwp=" (uwp-test)))
            (setf str (+ str " || cons=" (cons-test)))
            (setf str (+ str " || %flet=" (flet-test1)))
            ;;(setf str (+ str " %flet=" (flet-test2 "a" "b" "c")))
            ;;(setf str (+ str " cdr(1)=" (cdr 1)))
            (setf str (+ str " || <" (if (car nil) "t" "f") ">"))
            (setf str (+ str " || typecase 123="
                               (typecase 123
                                 (cons-type "-cons-")
                                 (:int "-:int-")
                                 (otherwise "-t-"))))
            (setf str (+ str " || typecase cons="
                               (typecase cc
                                 (cons-type "-cons-")
                                 (otherwise "-t-"))))
            (setf str (+ str " || when t ="
                               (when t "-t-")))
            (setf str (+ str " || when nil ="
                               (when nil "-t-")))
            (setf str (+ str " || unless t ="
                               (unless t "-t-")))
            (setf str (+ str " || unless nil ="
                               (unless nil "-t-")))
            (setf str (+ str " || and ="
                               (and)))
            (setf str (+ str " || and t ="
                               (and "t")))
            (setf str (+ str " || and t nil ="
                               (and "t" nil)))
            (setf str (+ str " || and nil t ="
                               (and nil "t")))
            (setf str (+ str " || and t t ="
                               (and "t1" "t2")))
            (setf str (+ str " || or ="
                               (or)))
            (setf str (+ str " || or t ="
                               (or "t")))
            (setf str (+ str " || or t nil ="
                               (or "t" nil)))
            (setf str (+ str " || or nil t ="
                               (or nil "t")))
            (setf str (+ str " || or t t ="
                               (or "t1" "t2")))
            (setf str (+ str " || cond="
                               (cond
                                 ((eq 1 cc) "-foo-")
                                 ((> 3 2) "-3>2-")
                                 (nil "-nil-")
                                 (t "-t-"))))
            (let ((c2 (cons "a" (cons "b" nil))))
              (setf str (+ str " || pop1 =" (pop c2)))
              (setf str (+ str " || pop2 = (" (car c2) " . " (cdr c2) ")")))

            (setf str (+ str " || dolist=" (dolist-test)))
            (incf str (+ " || dotimes=" (dotimes-test)))
            ;;(dotimes (a 5) (incf str a))
            (incf str (+ " || nth (0 1 2 3 4) 3=" (nth 3 (list 0 1 2 3 4))))
            (incf str (+ " || nthcdr (0 1 2 3 4) 3=" (list->str (nthcdr 3 (list 0 1 2 3 4)))))
            (incf str (+ " || last (0 1 2 3 4) 3=" (list->str (last (list 0 1 2 3 4)))))
            (incf str (+ " || last (0 1 . 2) 3=" (list->str (last (cons 0 (cons 1 2))))))
            (incf str (+ " || arest test=" (rest-test 1 2 3 4 5 6 )))
            #+nil(incf str (+ " || car 0=" (car 0)))
            (when nil
              (incf str (+ " || space test=" (space-test arg 10000000)))
              (incf str (+ " || car speed =" (car-speed-test arg 10000000))))
            #+nil(incf str (+ " || space test2=" (space-test2 arg 1000000)
                         (nth 1000 (blob arg))))
            (incf str (+ " || keyword =" :foo))
            (incf str (+ " || eq :foo :foo =" (eq :foo :foo)))
            (incf str (+ " || eql :foo :foo =" (eql :foo :foo)))
            (incf str (+ " || equal \"2\" 2 =" (equal "2" 2)))
            (incf str (+ " || '(1 a :b) =" (list->str '(1 a :b))))
            (incf str (+ " || #(1 2 3) =" #(1 2 3 )))
            (incf str (+ " || aref #(1 2 3) 1 =" (aref #(1 2 3) 1)))
            (incf str (+ " || aref \"piyo\" 1 =" (aref "piyo" 1)))
            (incf str (+ " || a-r-m-i ="
                         (array-row-major-index (%new* not-simple-array-type
                                                      #(2 3 4) nil nil
                                                      #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24)
                                                      0)
                                                0 2 1)))
            (incf str (+ " || aref 0 2 1 ="
                         (aref (%new* not-simple-array-type
                                                      #(2 3 4) nil nil
                                                      #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24)
                                                      0)
                                                0 2 1)))
            (incf str (+ " || reverse #(1 2 3) =" (reverse #(1 2 3))))
            (incf str (+ " || reverse \"hoge\" =" (reverse "hoge")))
            (let ((foo 4))
              (when (and (> foo 0) (> (random 1.0) 0.2))
                (incf str "||rand")))
            (incf str (+ " || nconc test="  (list->str (nconc (cons 1 2) (cons 3 4)))))
            (incf str (+ " || do test: 4,3,2=" (do/do*-tests)))
            (incf str (+ " || unused args: " (unused-args-test 1 2 3)))
            (incf str (+ " || pi: " %flash:+pi+))
            (incf str (+ " || length '(1 2 3): " (list-length '(1 2 3))))
            (%flash:trace (+ " || unused args: " (unused-args-test 1 2 3)))
)

          (setf (%flash.text:text foo) (+ str " || " (%flash:to-string (%array 1 2 3)))))
        (%flash.display:add-child arg canvas)
        (%flash.display:add-child arg foo)
        (%set-property this :tc arg)
        (%set-property this :canvas canvas)
        (frame nil)
        #+nil(:add-event-listener arg "enterFrame" (%get-lex :frame))
        (%flash.display:add-event-listener canvas "click" (%asm (:get-lex frame)))))

    (swf-defmacro with-fill (gfx (color alpha &key line-style) &body body)
      `(progn
         ,@(when line-style
                 `((%flash.display:line-style ,gfx ,@line-style)))
         (%flash.display:begin-fill ,gfx ,color ,alpha)
         ,@body
         (%flash.display:end-fill ,gfx)))

    (swf-defmemfun frame (evt)
      (let* ((canvas (%get-property this :canvas))
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
