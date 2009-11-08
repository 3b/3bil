(in-package :avm2-compiler)

;;; minimal sample

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

    (swf-defmemfun main (arg)
      (let ((foo (%new %flash.text:Text-Field 0))
            (canvas (%new %flash.display:Sprite 0)))
        (setf (%flash.display:width foo) 350)
        (setf (%flash.text:auto-size foo) "left")
        (setf (%flash.text:text-color foo) #x30e830)
        (setf (%flash.text:word-wrap foo) t)
        (setf (%flash.text:background foo) t)
        (setf (%flash.text:background-color foo) #x20202020)
        (setf (%flash.text:text foo) "abc")

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