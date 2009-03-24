(in-package :avm2-compiler)
;;; sample from old version. works but needs more refactoring

(with-open-file (s "/tmp/roots5.swf"
                   :direction :output
                              :element-type '(unsigned-byte 8)
                              :if-exists :supersede)
  (with-compilation-to-stream s ("frame1" `((0 "testClass")))

    (def-swf-class :test-class "test-class" %flash.display::sprite (text)
                   (()
                    (ftrace (s+ "constructor - " this))
                    (main this)))

    (def-swf-class setf-namespace-type "what goes here?"
      %flash:object (baz)
      (()
       (%asm (:push-null))))

    (swf-defmemfun = (a &arest x)
      (dotimes (i (length x) t)
        (unless (eql a (aref x i))
          (return nil))))

    (swf-defmemfun + (&arest x)
      (let ((sum 0))
        (dotimes (i (length x) sum)
          (setf sum (%2+ sum (aref x i))))))

    (swf-defmemfun - (a &arest x)
      (let ((sum a))
        (if (= (length x) 0)
            (%asm (:@ a)
                  (:negate)
                  (:coerce-any))
            (dotimes (i (length x) sum)
              (let ((y (aref x i)))
                (%asm (:@ sum)
                      (:@ y)
                      (:subtract)
                      (:coerce-any)
                      (:dup)
                      (:@! sum)))))))

    (swf-defmemfun * (&arest x)
      (let ((sum 1))
        (dotimes (i (length x) sum)
          (let ((y (aref x i)))
            (%asm (:@ sum)
                  (:@ y)
                  (:multiply)
                  (:coerce-any)
                  (:dup)
                  (:@! sum))))))

    (swf-defmemfun / (a &arest x)
      (let ((sum a))
        (if (= (length x) 0)
            (%asm (:push-int 1)
                  (:@ a)
                  (:divide)
                  (:coerce-any))
            (dotimes (i (length x) sum)
              (let ((y (aref x i)))
                (%asm (:@ sum)
                      (:@ y)
                      (:divide)
                      (:coerce-any)
                      (:dup)
                      (:@! sum)))))))

    (swf-defmemfun < (a &arest x)
      (dotimes (i (length x) t)
        (when (>= a (aref x i)) (return nil))
        (setf a (aref x i))))

    (swf-defmemfun > (a &arest x)
      (dotimes (i (length x) t)
        (when (%2<= a (aref x i)) (return nil))
        (setf a (aref x i))))

    (swf-defmemfun s+ (&arest x)
      (let ((sum ""))
        (dotimes (i (length x) sum)
          (setf sum (%2+ sum (aref x i))))))


  (swf-defmemfun ftrace (x)
    (%flash:trace x))


    (swf-defmemfun %exit-point-value ()
      (%new* %flash:q-name "exit" "point"))

    (c3* :top-level
      (defmacro %set-property (object prop value)
        `(%asm
          (:@ ,value)
          (:dup)
          (:@ ,object)
          (:swap)
          (:set-property ,prop)
          ))

      (defmacro %get-property (object prop)
        `(%asm
          (:@ ,object)
          (:get-property ,prop)
          ))

      (defmacro %new (class &rest args)
        (let ((name (typecase class
                      (symbol
                       (let ((c (find-swf-class class)))
                         (assert c) ;; fixme: better error reporting
                         (swf-name c)))
                      (t class))))
          `(%asm (:find-property-strict ,name)
                 ,@(loop for i in args
                         collect `(:@ ,i))
                 (:construct-prop ,name ,(length args)))))

      (defun random-range (a b)
        (+ a (floor (random (- b a)))))

      (defun radians (a)
        (/ (* a %flash:+pi+) 180.0))

      (defun i255 (a)
        (max (min (floor (* a 256)) 255) 0))

      (defun rgb (r g b)
        (+ (* (i255 r) 65536) (* (i255 g) 256) (i255 b)))

      (defun rgba (r g b a)
        (+ (* (i255 a) 65536 256) (rgb r g b)))


      (defun main (arg)
        (let ((foo (%new %flash.text:text-Field))
              (canvas (%new %flash.display:sprite)))
          (setf (%flash.display:width foo) 200)
          (setf (%flash.text:auto-size foo) "left")
          (setf (%flash.text:text-color foo) (rgb 0.2 0.9 0.2 ))
          (setf (%flash.text:word-wrap foo) t)
          (setf (%flash.text:background foo) t)
          (setf (%flash.text:background-color foo) (rgba 0.1 0.1 0.1 0.1))
          (let ((str "abc..."))
            (setf (%flash.text:text foo)
                  (s+ str (%flash:to-string (vector 1 2 3)))))
          (%flash.display:add-child arg canvas)
          (%flash.display:add-child arg foo)
          (%set-property this :tc arg)
          (%set-property this :canvas canvas)
          (setf (text arg) foo)
          (frame nil)
          #+nil(%flash.display:add-event-listener arg "enterFrame" (%asm (:get-lex frame)))
          (%flash.display:add-event-listener canvas "click" (%asm (:get-lex frame)))))

      (defmacro with-fill (gfx (color alpha &key line-style) &body body)
        `(progn
           ,@(when line-style
                   `((%flash.display:line-style ,gfx ,@line-style)))
           (%flash.display:begin-fill ,gfx ,color ,alpha)
           ,@body
           (%flash.display:end-fill ,gfx)))

      (defun frame (evt)
        (let* ((canvas (%get-property this :canvas))
               (gfx (slot-value canvas '%flash.display:graphics ))
               (matrix (%new %flash.geom:Matrix 0)))

          (setf (%flash.display:opaque-background canvas) #x0d0f00)
          (%flash.display:clear gfx)
          (with-fill gfx (#x202600  0.5)
            (%flash.display:draw-rect gfx 0 0 400 300 ))
          (%flash.geom:create-gradient-box matrix
                                           400 300 0 0 0)
          (%flash.display:begin-gradient-fill
           gfx "radial"
           (vector #x202600 #x0d0f00) ;; colors
           (vector 1 1)               ;; alpha
           (vector 0 255)             ;; ratios
           matrix)
          (%flash.display:draw-rect gfx 0 0 400 300 )
          (%flash.display:end-fill gfx)
          (ftrace "click")
          (setf (%flash.text:text (%get-property (%get-property this :tc) text))
                (+ "==" (root canvas 200 150 (random 360) 7 1.0 0.005 0)))
          (ftrace "frame done")))

      (defun root (canvas x y angle depth alpha decay count)
        #+nil(ftrace (s+ "root " canvas " " x " " y " " angle " d=" depth " a=" alpha " " decay " " count))
        (let* ((s (* depth 0.5))
               (w (* s 6.0))
               (line-size (* s 0.5))
               (gfx (slot-value canvas '%flash.display:graphics ))
               (times (* depth (random-range 10 20))))
          #+nil(ftrace (s+ " times = " times))
          (when (< times 0)
            (ftrace (s+ " root: times = " times))
            (return-from root 0))
          (dotimes (i times)
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
                  (with-fill gfx (0 (* alpha 0.6) :line-style (%flash:+nan+ 0 alpha))
                    (%flash.display:draw-circle gfx (+ x s 1) (1- (+ y s)) (/ w 3)))

                  ;; line segment to next position:
                  (with-fill gfx (color (* alpha 0.6)
                                        :line-style (line-size color alpha))
                    (%flash.display:move-to gfx x y)
                    (%flash.display:line-to gfx dx dy))

                  ;; filled circle
                  (with-fill gfx (color (* alpha 0.5)
                                        :line-style ((* 0.5 line-size)
                                                     color alpha))
                    (%flash.display:draw-circle gfx x y (/ w 4)))
                  (incf count)
                  (when (and (> depth 0) (> (random 1.0) 0.85))
                    (setf count
                          (root canvas x y (+ angle (random-range -60 60))
                                (1- depth) alpha decay (1+ count))))
                  (setf x dx)
                  (setf y dy)))))

          (when (and (> depth 0) (> (random 1.0) 0.7))
            (setf count (root canvas x y angle (1- depth) alpha decay (1+ count)))))
        count))))