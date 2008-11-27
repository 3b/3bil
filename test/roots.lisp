(in-package :avm2-compiler)
;;; sample from old version. works but needs more refactoring

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

    (swf-defmemfun i255 (a)
      (max (min (floor (* a 256)) 255) 0))

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
          (%set-property foo :text (+ str (:to-string (vector 1 2 3)))))
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
                              (vector #x202600 #x0d0f00) ;; colors
                              (vector 1 1)               ;; alpha
                              (vector 0 255)             ;; ratios
                              matrix)
        (:draw-rect gfx 0 0 400 300 )
        (:end-fill gfx)
        (root canvas 200 150 (random 360) 7 1.0 0.005 )))

    (swf-defmemfun root (canvas x y angle depth alpha decay)
      (let* ((s (* depth 0.5))
             (w (* s 6.0))
             (line-size (* s 0.5))
             (gfx (:graphics canvas )))
        (dotimes (i (* depth (random-range 10 20)))
          (let* ((v (/ depth 5.0))
                 (color (rgb  (- 0.8 (* v 0.25))
                              0.8
                              (- 0.8 v))))
            (setf alpha (max 0.0 (- alpha (* i decay))))

            ;; stop if alpha gets below 1/256 or so
            (when (> alpha 0.004)
              (setf angle (+ angle (random-range -60 60)))
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
                (setf x dx)
                (setf y dy)))))

        (when (and (> depth 0) (> (random 1.0) 0.7))
          (root canvas x y angle (1- depth) alpha decay))))))