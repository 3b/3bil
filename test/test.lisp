(in-package :as3-compiler)
;;; random tests for various features, need to figure out how to
;;; automate these at some point

(with-open-file (s "/tmp/tests.swf"
                   :direction :output
                              :element-type '(unsigned-byte 8)
                              :if-exists :supersede)
  (with-compilation-to-stream s ("frame1" `((0 "testClass")))

    (def-swf-class :test-class "test-class" flash.display::sprite ()
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
                 (%set-local s2 (+ s2 "uwp")))
               2)
             (+ s2 ">")))

    (swf-defmemfun uwp-test ()
      (let ((s2 "<"))
        (block foo
          (unwind-protect
               (progn
                 (return-from foo "-ret-")
                 "bleh")
            (%set-local s2 (+ s2 123))))
        (+ s2 "<")))

    (swf-defmemfun cons-test ()
      (let* ((a (cons 2 3))
             (b (cons 1 a)))
        (%set-property (cdr b) %car 123)
        (+ "(" (car a) " " (car b) ")"))
      )

    (swf-defmemfun i255 (a)
      (flash::Math.max (flash::Math.min (floor (* a 256)) 255) 0))

    (swf-defmemfun rgb (r g b)
      (+ (* (i255 r) 65536) (* (i255 g) 256) (i255 b)))

    (swf-defmemfun rgba (r g b a)
      (+ (* (i255 a) 65536 256) (rgb r g b)))

    (swf-defmemfun main (arg)
      (let ((foo (%new flash.text::Text-Field 0))
            (canvas (%new flash.display::Sprite 0)))
        (%set-property foo :width 200)
        (%set-property foo :auto-size "left")
        (%set-property foo :text-color (rgb 0.2 0.9 0.2 ))
        (%set-property foo :word-wrap :true)
        (%set-property foo :background :true)
        (%set-property foo :background-color (rgba 0.1 0.1 0.1 0.1))
        (let ((str "abc..."))
          (%set-local str (+ str (flash::string.from-char-code 26085)))
          (%set-local str (+ str (flash::string.from-char-code 26412)))
          (%set-local str (+ str (flash::string.from-char-code #x8a9e)))
          (let ((cc (cons 0 2)))
            (%set-local str (+ str (cons 2 3)))
            (%set-local str (+ str "=(" (car cc) " " (cdr cc) ")"))
            (%set-local str (+ str " || car(nil)=" (car nil)))
            (%set-local str (+ str " || %typeof=" (%type-of cc)))
            (%set-local str (+ str " || %typep...=" (%typep cc cons-type)))
            (%set-local str (+ str " || %typep.1.=" (%typep 1 cons-type)))
            (%set-local str (+ str " || case="
                               (case (car cc)
                                 (1 "-1-")
                                 (0 "-0-")
                                 (2 "-2-")
                                 (otherwise "-t-")
                                 )))
            (%set-local str (+ str " || case2="
                               (case (cdr cc)
                                 (1 "-1-")
                                 (0 "-0-")
                                 (2 "-2-"))))
            (%set-local str (+ str " || block="
                               (block foo
                                 1
                                 (if t (return-from foo "-ret-") 4)
                                 2)))
            #+nil(%set-local str (+ str " uwp=" (uwp-test)))
            (%set-local str (+ str " || cons=" (cons-test)))
            (%set-local str (+ str " || %flet=" (flet-test1)))
            ;;(%set-local str (+ str " %flet=" (flet-test2 "a" "b" "c")))
            ;;(%set-local str (+ str " cdr(1)=" (cdr 1)))
            (%set-local str (+ str " || <" (if (car :null) "t" "f") ">")))

          (%set-property foo :text (+ str (%call-property (%array 1 2 3) :to-string))))
        (:add-child arg canvas)
        (:add-child arg foo)
        (%set-property this :canvas canvas)
        (frame :null)
        #+nil(:add-event-listener arg "enterFrame" (%get-lex :frame))
        (:add-event-listener canvas "click" (%asm (:get-lex frame)))))

    (swf-defmacro with-fill (gfx (color alpha &key line-style) &body body)
      `(progn
         ,@(when line-style
                 `((:line-style ,gfx ,@line-style)))
         (:begin-fill ,gfx ,color ,alpha)
         ,@body
         (:end-fill ,gfx)))

    (swf-defmemfun frame (evt)
      (let* ((canvas (%get-property this :canvas))
             (gfx (:graphics canvas))
             (matrix (%new flash.geom::Matrix 0)))

        (%set-property canvas :opaque-background #x0d0f00)
        (:clear gfx)
        (with-fill gfx (#x202600  0.5)
                   (:draw-rect gfx 0 0 400 300 ))
        (:create-gradient-box matrix
                              400 300 0 0 0)
        (:begin-gradient-fill gfx "radial"
                              (%array #x202600 #x0d0f00) ;; colors
                              (%array 1 1)               ;; alpha
                              (%array 0 255)             ;; ratios
                              matrix)
        (:draw-rect gfx 0 0 400 300 )
        (:end-fill gfx)))))