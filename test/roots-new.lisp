(in-package :avm2-compiler)

(with-open-file (s "/tmp/roots5.swf"
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

    (compile-abc-tag (((nil :roots-class))
                      :inherit (avm2-compiler::*cl-symbol-table*
                                fu::%*fu-symbol-table*))

      (c3* :top-level
        (defclass-swf :roots-class (flash:flash.display.sprite)
          (text
           canvas
           (%app :allocation :class ))
          (:fake-accessors t)
          (:constructor ()
            (%set-property-static :roots-class %app this)
            (main this)))

        (defun app ()
          (%get-property-static :roots-class %app))

        (defun random-range (a b)
          (+ a (floor (random (- b a)))))

        (defun main (arg)
          (let ((canvas (fu:display (%new- flash:flash.display.sprite)
                                    :parent arg))
                (foo (fu:text-field :width 200
                                    :auto-size "left"
                                    :text-color (fu:rgb 0.2 0.9 0.2)
                                    :word-wrap t
                                    :background t
                                    :background-color (fu:rgba 0.1 0.1 0.1 0.1)
                                    :text "..."
                                    :parent arg)))
            ;(%set-property-static :roots-class %app arg)
            (setf (canvas arg) canvas)
            (setf (text arg) foo)
            (frame nil)
            (flash:add-event-listener canvas "click" #'frame)))

        (defun frame (evt)
          (let* ((canvas (canvas (app)))
                 (gfx (flash:.graphics canvas))
                 (matrix (%new- flash:flash.geom.matrix)))

            (setf (flash:.opaque-background canvas) #x0d0f00)
            (flash:clear gfx)
            (fu:with-fill gfx (#x202600  0.5)
                          (flash:draw-rect gfx 0 0 400 300 ))
            (flash:create-gradient-box matrix 400 300 0 0 0)
            (flash:begin-gradient-fill gfx "radial"
                                       (vector #x202600 #x0d0f00) ;; colors
                                       (vector 1 1)  ;; alpha
                                       (vector 0 255) ;; ratios
                                       matrix)
            (flash:draw-rect gfx 0 0 400 300 )
            (flash:end-fill gfx)
            (ftrace "click")
            (time
             (setf (flash:.text (text (app)))
                   (+ "==" (root canvas 200 150 (random 360) 7 1.0 0.005 0))))
            (ftrace "frame done")))

        (defun root (canvas x y angle depth alpha decay count)
          (let* ((s (* depth 0.5))
                 (w (* s 6.0))
                 (line-size (* s 0.5))
                 (gfx (flash:.graphics canvas))
                 (times (* depth (random-range 10 20))))
            (when (< times 0)
              (ftrace (s+ " root: times = " times))
              (return-from root 0))
            (dotimes (i times)
              (let* ((v (/ depth 5.0))
                     (color (fu:rgb  (- 0.8 (* v 0.25))
                                     0.8
                                     (- 0.8 v))))
                (setf alpha (max 0.0 (- alpha (* i decay))))
                ;; stop if alpha gets below 1/256 or so
                (when (> alpha 0.004)
                  (setf angle (+ angle (random-range -60 60)))
                  (let ((dx (+ x (* (cos (fu:radians angle)) w)))
                        (dy (+ y (* (sin (fu:radians angle)) w))))

                    ;; drop shadow
                    (fu:with-fill gfx (0 (* alpha 0.6)
                                         :line-style (flash:+number.nan+ 0 alpha))
                                  (flash:draw-circle gfx
                                                     (+ x s 1) (1- (+ y s))
                                                     (/ w 3)))

                    ;; line segment to next position:
                    (fu:with-fill gfx (color (* alpha 0.6)
                                             :line-style (line-size color alpha))
                                  (flash:move-to gfx x y)
                                  (flash:line-to gfx dx dy))

                    ;; filled circle
                    (fu:with-fill gfx (color (* alpha 0.5)
                                             :line-style ((* 0.5 line-size)
                                                          color alpha))
                                  (flash:draw-circle gfx x y (/ w 4)))
                    (incf count)
                    (when (and (> depth 0) (> (random 1.0) 0.85))
                      (setf count
                            (root canvas x y (+ angle (random-range -60 60))
                                  (1- depth) alpha decay (1+ count))))
                    (setf x dx)
                    (setf y dy)))))

            (when (and (> depth 0) (> (random 1.0) 0.7))
              (setf count (root canvas x y angle (1- depth) alpha decay (1+ count)))))
          count)))
    (list
     (3b-swf:show-frame)))

   :x-twips 400
   :y-twips 300
   :frame-rate 30
   :flash-version 9))
