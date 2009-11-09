(in-package :avm2-compiler)

;;; minimal sample, for new5 compiler/3b-swf/fu

(with-open-file (s "/tmp/foo.swf" :direction :output
                   :element-type '(unsigned-byte 8) :if-exists :supersede)
  (3b-swf:write-swf
   s
   (append
    (list
     (3b-swf:file-attributes :has-metadata t :as3 t :use-network t
                             :use-gpu t :direct-blit t)
     (3b-swf:script-limits 60 1000)
     (3b-swf:background-color #x869ca7)
     (3b-swf:frame-label "frame1"))

      (compile-abc-tag (((nil :test-Class))
                        :inherit (avm2-compiler::*cl-symbol-table*
                                  fu::%*fu-symbol-table*))

        (c3* :top-level

          (defclass-swf :test-class (flash:flash.display.sprite)
            (text
             canvas
             (%app :allocation :class ))
            (:fake-accessors t)
            (:constructor ()
              (%set-property-static :test-class %app this)
              (main this)))

        (defun app ()
          (%get-property-static :test-class %app))

         (defun main (arg)
           (let ((canvas (fu:display (%new- flash:flash.display.sprite)
                                    :parent arg))
                 (foo (fu:text-field :width 350
                                     :auto-size "left"
                                     :text-color (fu:rgb 0.2 0.9 0.2)
                                     :word-wrap t
                                     :background t
                                     :background-color #x20202020
                                     :text "Hello World"
                                     :parent arg)))
             (setf (text (app)) foo)
             (setf (canvas (app)) canvas)
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
                                        (vector 1 1) ;; alpha
                                        (vector 0 255) ;; ratios
                                        matrix)
             (flash:draw-rect gfx 0 0 400 300 )
             (ftrace "1click")
             (when evt
               (incf (flash:.text (text (app))) " click!"))
             (flash:end-fill gfx)))))

    (list
     (3b-swf:show-frame)))
   :x-twips 400
   :y-twips 300
   :frame-rate 30
   :flash-version 9)
  )



#+nil
(defparameter *foo-swf*
  (let ((%swf::*blob-tags* (list))
        (%swf::*trace-tags* (list)))
    (with-open-file (s "/tmp/foo.swf"
                       :element-type '(unsigned-byte 8))
      (%swf:read-swf s))))
