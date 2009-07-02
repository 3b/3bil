(in-package :avm2-compiler)

;;; minimal sample, for new5 compiler/3b-swf


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

      (compile-abc-tag (((nil :test-Class)))
        #+nil
        (def-swf-class :test-class "test-class" %flash.display:sprite (blob)
                       (()
                        (main this)))
        (c3* :top-level

         (defclass-swf :test-class ( %flash.display:sprite)
            ((blob))
           (:constructor ()
              (main this)))

         #++(swf-constructor :test-class ()
            (main this))

         (defun main (arg)
           (let ((foo (%new- %flash.text:Text-Field))
                 (canvas (%new- %flash.display:Sprite)))
             (setf (%flash.display:width foo) 350)
             (setf (%flash.text:auto-size foo) "left")
             (setf (%flash.text:text-color foo) #x30e830)
             (setf (%flash.text:word-wrap foo) t)
             (setf (%flash.text:background foo) t)
             (setf (%flash.text:background-color foo) #x20202020)
             (setf (%flash.text:text foo) "abc")

             (%flash.display:add-child arg canvas)
             (%flash.display:add-child arg foo)

             (%set-property- this :canvas canvas)
             (frame nil)

             (%flash.display:add-event-listener canvas "click" #'frame)))

         (defmacro with-fill (gfx (color alpha &key line-style) &body body)
           `(progn
              ,@(when line-style
                      `((%flash.display:line-style ,gfx ,@line-style)))
              (%flash.display:begin-fill ,gfx ,color ,alpha)
              ,@body
              (%flash.display:end-fill ,gfx)))

         (defun frame (evt)
           (let* ((canvas (slot-value this :canvas))
                  (gfx (slot-value canvas '%flash.display:graphics))
                  (matrix (%new- %flash.geom:Matrix)))

             (setf (%flash.display:opaque-background canvas) #x0d0f00)
             (%flash.display:clear gfx)
             (with-fill gfx (#x202600  0.5)
               (%flash.display:draw-rect gfx 0 0 400 300 ))
             (%flash.geom:create-gradient-box matrix
                                              400 300 0 0 0)
             (%flash.display:begin-gradient-fill gfx "radial"
                                                 (vector #x202600 #x0d0f00) ;; colors
                                                 (vector 1 1) ;; alpha
                                                 (vector 0 255) ;; ratios
                                                 matrix)
             (%flash.display:draw-rect gfx 0 0 400 300 )
             (ftrace "1click")
             (%flash.display:end-fill gfx)))))

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
