(in-package :as3-compiler)
;;; sample from old version. works but needs more refactoring

(define-special %to-double (a)
  `(,@(scompile a)
    (:convert-double)))

(define-special %to-integer (a)
  `(,@(scompile a)
    (:convert-integer)))

(with-open-file (s "/tmp/roots.swf"
                   :direction :output
                              :element-type '(unsigned-byte 8)
                              :if-exists :supersede)
  (with-compilation-to-stream s ("frame1" `((0 "testClass")))

    (def-swf-class :test-class "test-class" flash.display::sprite ()
                   (()
                    (main this)))

    (swf-defmemfun random-range (a b)
      (+ a (floor (random (- b a)))))

    #+nil(swf-defmemfun radians (a)
           (/ (* a flash::math.PI) 180.0))
    (swf-defmemfun radians (a)
      (/ (* a #.pi) 180.0))

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
          (%set-local str (+ str (flash::string.from-char-code 21566)))
          (%set-local str (+ str (%get-property str :length )))
          (let ((cc (cons 0 2)))
            (%set-local str (+ str (cons 2 3)))
            (%set-local str (+ str "=(" (car cc) " " (cdr cc) ")"))
            (%set-local str (+ str " car(nil)=" (car nil)))
            (%set-local str (+ str " %typeof=" (%type-of cc)))
            (%set-local str (+ str " %typep...=" (%typep cc cons-type)))
            (%set-local str (+ str " %typep.1.=" (%typep 1 cons-type)))
            (%set-local str (+ str " case="
                               (case (car cc)
                                 (1 "-1-")
                                 (0 "-0-")
                                 (2 "-2-")
                                 (otherwise "-t-")
)))
            (%set-local str (+ str " case2="
                               (case (cdr cc)
                                 (1 "-1-")
                                 (0 "-0-")
                                 (2 "-2-"))))
            (%set-local str (+ str " block="
                               (block foo
                                 1
                                 (if t (return-from foo "-ret-") 4)
                                 2)))
            #+nil(%set-local str (+ str " uwp=" (uwp-test)))
            (%set-local str (+ str " cons=" (cons-test)))
            (%set-local str (+ str " %flet=" (flet-test1)))
            ;;(%set-local str (+ str " %flet=" (flet-test2 "a" "b" "c")))
            ;;(%set-local str (+ str " cdr(1)=" (cdr 1)))
            (%set-local str (+ str " <" (if (car :null) "t" "f") ">")))

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
        (:end-fill gfx)
        (root canvas 200 150 (random 360) 7 1.0 0.005 )))

    (swf-defmemfun root (canvas x y angle depth alpha decay)
      (%set-local alpha (%to-double alpha))
      (%set-local x (%to-double x))
      (%set-local y (%to-double y))
      (let* ((s (* depth 0.5))
             (w (* s 6.0))
             (line-size (* s 0.5))
             (gfx (:graphics canvas )))
        (dotimes (i (%to-integer (* depth (random-range 10 20))))
          (let* ((v (/ depth 5.0))
                 (color (rgb  (- 0.8 (* v 0.25))
                              0.8
                              (- 0.8 v))))
            (%set-local alpha (flash::Math.max 0.0 (- alpha (* i decay))))

            ;; stop if alpha gets below 1/256 or so
            (when (> alpha 0.004)
              (%set-local angle (+ angle (random-range -60 60)))
              (let ((dx (+ x (* (cos (radians angle)) w)))
                    (dy (+ y (* (sin (radians angle)) w))))

                ;; drop shadow
                (with-fill gfx (0 (* alpha 0.6) :line-style (:nan 0 alpha))
                           (:draw-circle gfx (+ x s 1) (1- (+ y s)) (/ w 3)))

                ;; line segment to next position:
                (with-fill gfx (color (* alpha 0.6)
                                      :line-style (line-size color alpha))
                           (:move-to gfx x y)
                           (:line-to gfx dx dy))

                ;; filled circle
                (with-fill gfx (color (* alpha 0.5)
                                      :line-style ((* 0.5 line-size)
                                                   color alpha))
                           (:draw-circle gfx x y (/ w 4)))

                (when (and (> depth 0) (> (random 1.0) 0.85))
                  (root canvas x y (+ angle (random-range -60 60))
                        (1- depth) alpha decay))
                (%set-local x (%to-double dx))
                (%set-local y (%to-double dy))))))

        (when (and (> depth 0) (> (random 1.0) 0.7))
          (root canvas x y angle (1- depth) alpha decay))))))