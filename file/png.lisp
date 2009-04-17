;;; ---------------------------------------------------------------------------
;;;     Title: Reading .png Files
;;;   Created: 1997-04-24
;;;    Author: Gilbert Baumann <gilbert@base-engineering.com>
;;;   License: MIT style (see below)
;;; ---------------------------------------------------------------------------
;;;  (c) copyright 1997-1998,2001 by Gilbert Baumann

;;;  Permission is hereby granted, free of charge, to any person obtaining
;;;  a copy of this software and associated documentation files (the
;;;  "Software"), to deal in the Software without restriction, including
;;;  without limitation the rights to use, copy, modify, merge, publish,
;;;  distribute, sublicense, and/or sell copies of the Software, and to
;;;  permit persons to whom the Software is furnished to do so, subject to
;;;  the following conditions:
;;;
;;;  The above copyright notice and this permission notice shall be
;;;  included in all copies or substantial portions of the Software.
;;;
;;;  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;;;  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;;;  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;;;  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;;;  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;;;  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;;;  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
(defpackage :png (:use :cl)
            (:export :png-stream->aimage
                     :print-aimage
                     :aimage-width
                     :aimage-height
                     :aimage-data
                     :aimage-alpha-p
                     :aimage-plist))
(in-package :PNG)

;;; When        Who     What
;;; --------------------------------------------------------------------------------
;;; 2009-03-31  3b      remove closure deps, use chipz for decompression
;;; 2001-12-30  gb      implemented tRNS chunk for color model 0 and 2
;;;

;;;; TODO

;; we want to go with more speed still.

;;; Image formats to support:
;;;
;;;   Color    Allowed    Interpretation
;;;   Type    Bit Depths
;;;
;;;   0       1,2,4,8,16  Each pixel is a grayscale sample.
;;;   2       8,16        Each pixel is an R,G,B triple.
;;;   3       1,2,4,8     Each pixel is a palette index; a PLTE chunk must appear.
;;;   4       8,16        Each pixel is a grayscale sample, followed by an alpha sample.
;;;   6       8,16        Each pixel is an R,G,B triple, followed by an alpha sample.
;;;

(defstruct (aimage
            (:constructor make-aimage/low)
            (:copier nil)
            (:print-function print-aimage))
  (width  0 :type fixnum)
  (height 0 :type fixnum)
  (data   nil :type (or null (simple-array (unsigned-byte 8)  (*))))
  alpha-p
  plist)
(defun print-aimage (self sink depth)
  (declare (ignore depth))
  (format sink "<~S ~D x ~D from ~S>" 'aimage
          (aimage-width self) (aimage-height self)
          (getf (aimage-plist self) :url)))

(defun make-aimage (width height &key (alpha-p nil))
  ;(incf width)
  ;(incf height)
  (let ((a (make-aimage/low :width width
                            :height height
                            :data (make-array (* height width 4)
                                              :element-type '(unsigned-byte 8))
                            :alpha-p alpha-p)))
    (loop for x below width
          do (loop for y below height
                   for i = (* 4 (+ x (* y width)))
                   do
                   (setf (aref (aimage-data a) (+ i 0)) 255
                         (aref (aimage-data a) (+ i 1)) 0
                         (aref (aimage-data a) (+ i 2)) 0
                         (aref (aimage-data a) (+ i 3)) 255)))
    a)
)




(defvar *png-magic* '#(137 80 78 71 13 10 26 10)
  "The first eight bytes of a png file.")

;; largest prime smaller than 65536
(defconstant +adler-base+ 65521)

(defstruct png-image
  ihdr
  idat
  plte
  transparent-color     ;either nil or
                        ; color model 0: a gray scale sample
                        ; color model 2: #(r g b)
  )

(defstruct ihdr
  width height bit-depth color-type compression-method filter-method interlace-method)

;; CODE DUPLICATION ALERT! killed+yanked from images.lisp
(defun full-read-byte-sequence (sequence input &key (start 0) (end (length sequence)))
  (unless (<= end start)
    (do ((i 0 n)
         (n (read-sequence sequence input :start 0)
            (read-sequence sequence input :start n)))
        ((or (= i n)
             (>= n end))
         (when (= i n)
           (error "EOF during ~S." 'full-read-byte-sequence))))))

(defun read-unsigned-byte-32 (source &optional (eof-error-p t) eof-value)
  "Reads unsigned byte 32 from an byte stream in network order"
  (let (b1 b2 b3 b4)
    (if (and (setq b1 (read-byte source eof-error-p nil))
             (setq b2 (read-byte source eof-error-p nil))
             (setq b3 (read-byte source eof-error-p nil))
             (setq b4 (read-byte source eof-error-p nil)))
        (logior (ash b1 24) (ash b2 16) (ash b3 8) (ash b4 0))
      eof-value)))

(defun read-unsigned-byte-16 (source &optional (eof-error-p t) eof-value)
  "Reads unsigned byte 16 from an byte stream in network order"
  (let (b1 b2)
    (if (and (setq b1 (read-byte source eof-error-p nil))
             (setq b2 (read-byte source eof-error-p nil)) )
        (logior (ash b1 8) (ash b2 0))
        eof-value)))

(defun read-png-signature-p (source)
  "Checks for PNG signature."
  ;; Returns non-NIL if the first eight bytes read from 'source' is the valid PNG header, NIL otherwise.
  ;; If eof occurs while reading from source NIL is returned
  (dotimes (i (length *png-magic*) t)
    (when (not (eql (read-byte source nil 256) (aref *png-magic* i)))
      (return nil))))

(defun read-fixed-string (source n)
 "Read exactly 'n' bytes from 'source' and makeup an iso-latin-1 string."
  ;;Bug: iso-latin-1 encoding of chars expected
  (let ((temp (make-array n :element-type '(unsigned-byte 8))))
    (full-read-byte-sequence temp source)
    (map 'string #'code-char temp) ))

(defun read-chunk (source)
 "Read a PNG chunk from 'source' and return the chunk type, a four
  character string, and a vector containing the data bytes. The CRC is
  not included into the data bytes.
  If eof occurs return NIL."
  ;;TODO: check for CRC errors
  (let ((length (read-unsigned-byte-32 source nil nil)))
    (cond (length
           (let* ((type (read-fixed-string source 4))
                 (data (make-array length :element-type '(unsigned-byte 8) :initial-element 0)))
             (full-read-byte-sequence data source)
             (read-unsigned-byte-32 source);the crc
             (values type data) ))
          (t
           nil) )))

(defun decode-unsigned-byte-32 (data offset)
 "Decode an (unsigned-byte 32) from the byte vector 'data' starting at 'offset' in
  network order."
  (declare (type (vector (unsigned-byte 8)) data)
           (type fixnum offset))
  (logior (ash (aref data (+ offset 0)) 24)
          (ash (aref data (+ offset 1)) 16)
          (ash (aref data (+ offset 2))  8)
          (ash (aref data (+ offset 3))  0)))

(defun decode-unsigned-byte-16 (data offset)
 "Decode an (unsigned-byte 16) from the byte vector 'data' starting at 'offset' in
  network order."
  (declare (type (vector (unsigned-byte 8)) data)
           (type fixnum offset))
  (logior (ash (aref data (+ offset 0))  8)
          (ash (aref data (+ offset 1))  0)))

(defun decode-ihdr (data)
 "Decode an IHDR chunk from data."
  (declare (type (vector (unsigned-byte 8)) data))
  (make-ihdr :width              (decode-unsigned-byte-32 data 0)
             :height             (decode-unsigned-byte-32 data 4)
             :bit-depth          (aref data 8)
             :color-type         (aref data 9)
             :compression-method (aref data 10)
             :filter-method      (aref data 11)
             :interlace-method   (aref data 12)))

(defun decode-plte (data)
 "Decode a PLTE chunk from the byte vector 'data'."
  (declare (type (vector (unsigned-byte 8)) data))
  (assert (zerop (mod (length data) 3)))
  (let* ((len (floor (length data) 3))
         (palette (make-array len)))
    (loop
        for i from 0 to (1- len)
        do
          (setf (aref palette i)
            (vector (aref data (+ (* i 3) 0))
                    (aref data (+ (* i 3) 1))
                    (aref data (+ (* i 3) 2))
                    255)) )
    palette))

(defun decode-trns (palette data)
  (when palette
    (dotimes (i (length data))
      (setf (svref (aref palette i) 3) (aref data i)))))

(defun read-png-image (input)
  (unless (read-png-signature-p input)
    (error "~A is probably no PNG file." input))
  (let ((idat '#())
        (plte nil)
        (ihdr nil)
        (transparent-color nil))
    (do ((x (multiple-value-list (read-chunk input))
            (multiple-value-list (read-chunk input))))
        ((or (null (car x)) (string= (car x) "IEND"))
         (cond ((null (car x))
                (error "png file lacks an IEND chunk"))))
      (let ((data (cadr x))
            (type (car x)))
        (let ((*print-array* nil))
          (cond ((string= type "IHDR")
                 (setq ihdr (decode-ihdr data)) )
                ((string= type "PLTE")
                 (setq plte (decode-plte data)) )
                ;;
                ((string= type "tRNS")
                 (cond ((null ihdr)
                        (warn "tRNS chunk without IHDR ignored"))
                       ((case (ihdr-color-type ihdr)
                          (3
                           (if plte
                               (decode-trns plte data)
                               (warn "tRNS chunk without PLTE.")))
                          (2
                           (setf transparent-color
                                 (vector (decode-unsigned-byte-16 data 0)
                                         (decode-unsigned-byte-16 data 2)
                                         (decode-unsigned-byte-16 data 4))))
                          (0
                           (setf transparent-color (decode-unsigned-byte-16 data 0)))
                          (otherwise
                           (warn "tRNS chunk with color model ~D ignored."
                                 (ihdr-color-type ihdr))) ))))
                ;;
                ((string= type "tEXt")
                 (let ((p (position 0 data)))
                   (format nil "~%;Text: `~A' = `~A'."
                           (map 'string #'code-char (subseq data 0 p))
                           (map 'string #'code-char (subseq data (+ p 1))))))
                ((string= type "zTXt")
                 (let ((p (position 0 data)))
                   (format t "ztxt ~s~%" (map 'string #'code-char (subseq data 0 p)))
                   (format nil "~%;zText: `~A' = `~A'."
                           (map 'string #'code-char (subseq data 0 p))
                           (map 'string #'code-char
                                (chipz:decompress nil 'chipz:zlib (subseq data (+ p 4))) ))))
                ((string= type "IDAT")
                 (setf idat (concatenate '(simple-array (unsigned-byte 8) (*)) idat data)))
                (t
                 ) ))))
    (make-png-image :plte plte
                    :idat (chipz:decompress nil 'chipz:deflate idat :input-start 2)
                    :ihdr ihdr
                    :transparent-color transparent-color) ))


(defun png-image-row-length (im)
  (let ((width (ihdr-width (png-image-ihdr im)))
        (bit-depth (ihdr-bit-depth (png-image-ihdr im)))
        (color-type (ihdr-color-type (png-image-ihdr im))))
    (+ 1
       (ceiling
        (* width (ecase color-type
                   (0 bit-depth)
                   (2 (* 3 bit-depth))
                   (3 bit-depth)
                   (4 (* 2 bit-depth))
                   (6 (* 4 bit-depth))))
        8)) ))

(defun paeth-predictor (a b c)
  (let* ((p  (- (+ a b) c))             ;initial estimate
         (pa (abs (- p a)))             ;distances to a, b, c
         (pb (abs (- p b)))
         (pc (abs (- p c))))
    ;; return nearest of a,b,c,
    ;; breaking ties in order a,b,c.
    (cond ((and (<= pa pb) (<= pa pc)) a)
          ((<= pb pc) b)
          (t c) ) ))

(defun apply-png-filter (filter data j j0 len bpp)
  (dotimes (x len)
    (let ((raw (aref data (+ j x)))
          (above (if j0 (aref data (+ j0 x)) 0))
          (left  (if (>= (- x bpp) 0) (aref data (+ j x (- bpp))) 0))
          (left-above (if (and j0 (>= (- x bpp) 0)) (aref data (+ j0 x (- bpp))) 0)))
      (setf (aref data (+ j x))
        (ecase filter
          (0 raw)
          (1 (logand #xFF (+ raw left)))
          (2 (logand #xFF (+ raw above)))
          (3 (logand #xFF (+ raw (floor (+ left above) 2))))
          (4 (logand #xFF (+ raw (paeth-predictor left above left-above)) )))))))

(defun png-image-bits-per-pixel (im)
  (let ((bit-depth (ihdr-bit-depth (png-image-ihdr im)))
        (color-type (ihdr-color-type (png-image-ihdr im))))
    (ecase color-type
      (0 bit-depth)
      (2 (* 3 bit-depth))
      (3 bit-depth)
      (4 (* 2 bit-depth))
      (6 (* 4 bit-depth)))))

(defun png-image-bytes-per-pixel (im)
  (ceiling (png-image-bits-per-pixel im) 8))

(defun get-sample (data i j bit-depth)
  (ecase bit-depth
    (1 (ldb (byte 1 (- 7 (mod i 8))) (aref data (+ (floor i 8) j))))
    (2 (ldb (byte 2 (* 2 (- 3 (mod i 4)))) (aref data (+ (floor i 4) j))))
    (4 (ldb (byte 4 (* 4 (- 1 (mod i 2)))) (aref data (+ (floor i 2) j))))
    (8 (aref data (+ i j)))
    (16 (logior (ash (aref data (+ (* 2 i) j)) 8)
                (aref data (+ (* 2 i) 1 j)))) ))

(defun get-sample* (data i j bit-depth)
  (ecase bit-depth
    (1 (* 255 (get-sample data i j bit-depth)))
    (2 (* 85 (get-sample data i j bit-depth)))
    (4 (* 17 (get-sample data i j bit-depth)))
    (8 (get-sample data i j bit-depth))
    (16 (ldb (byte 8 8) (get-sample data i j bit-depth))) ))

(defun render-filtered-row (im bit-depth color-type transparent-color data j y x0 dx width pw ph put-pixel)
  (do ((x x0 (+ x dx))
       (i 0 (+ i 1)))
      ((>= x width))
    (ecase color-type
      (0
       (if (and transparent-color (= transparent-color (get-sample data i (+ j 1) bit-depth)))
           (funcall put-pixel x y 0 0 0 0 pw ph)
           (let ((v (get-sample* data i (+ j 1) bit-depth)))
             (funcall put-pixel x y v v v 255 pw ph))))
      (2
       (if (and (not (null transparent-color))
                (let ((rsample (get-sample data (+ 0 (* 3 i)) (+ j 1) bit-depth))
                      (gsample (get-sample data (+ 1 (* 3 i)) (+ j 1) bit-depth))
                      (bsample (get-sample data (+ 2 (* 3 i)) (+ j 1) bit-depth)))
                  (and (eql rsample (aref transparent-color 0))
                       (eql gsample (aref transparent-color 1))
                       (eql bsample (aref transparent-color 2)))))
           (funcall put-pixel x y 0 0 0 0 pw ph)
           (let ((r (get-sample* data (+ 0 (* 3 i)) (+ j 1) bit-depth))
                 (g (get-sample* data (+ 1 (* 3 i)) (+ j 1) bit-depth))
                 (b (get-sample* data (+ 2 (* 3 i)) (+ j 1) bit-depth)))
             (funcall put-pixel x y r g b 255 pw ph))))
      (3
       (let* ((i (get-sample data i (+ j 1) bit-depth))
              (p (aref (png-image-plte im) i)))
         (funcall put-pixel x y (aref p 0) (aref p 1) (aref p 2) (aref p 3) pw ph)))
      (4
       (let ((v (get-sample* data (+ 0 (* i 2)) (+ j 1) bit-depth))
             (a (get-sample* data (+ 1 (* i 2)) (+ j 1) bit-depth)))
         (funcall put-pixel x y v v v a pw ph)))
      (6
       (let ((r (get-sample* data (+ 0 (* 4 i)) (+ j 1) bit-depth))
             (g (get-sample* data (+ 1 (* 4 i)) (+ j 1) bit-depth))
             (b (get-sample* data (+ 2 (* 4 i)) (+ j 1) bit-depth))
             (a (get-sample* data (+ 3 (* 4 i)) (+ j 1) bit-depth)))
         (funcall put-pixel x y r g b a pw ph))) ) ))

(defun render-png-image-to-aimage (im)
  (let* ((bpp (png-image-bytes-per-pixel im))
         (data (png-image-idat im))
         (bit-depth (ihdr-bit-depth (png-image-ihdr im)))
         (width (ihdr-width (png-image-ihdr im)))
         (height (ihdr-height (png-image-ihdr im)))
         (color-type (ihdr-color-type (png-image-ihdr im)))
         (res (make-aimage width height :alpha-p t))
         (res-data (aimage-data res))
         (transparent-color (png-image-transparent-color im)))
    (labels ((put-pixel (x y r g b a pw ph)
               (declare (ignorable pw ph  r g b a))
               (let ((i (* 4 (+ x (* y (aimage-width res))))))
                 ;;(format t "~s=~s,~s = ~s ~s ~s ~s~%" i x y r g b a)
                 (setf (aref res-data (+ i 0)) r)
                 (setf (aref res-data (+ i 1)) g)
                 (setf (aref res-data (+ i 2)) b)
                 (setf (aref res-data (+ i 3)) a))))
 
      (case (ihdr-interlace-method (png-image-ihdr im))
        (0
         (let ((row-len (png-image-row-length im)))
           (do ((y 0 (+ y 1))
                (j 0 (+ j row-len))
                (j0 nil j))
               ((>= j (length data)))
             (apply-png-filter (aref data j) data (+ j 1) (if j0 (+ j0 1) nil) (1- row-len) bpp)
             (render-filtered-row im bit-depth color-type transparent-color data j y 0 1 width 1 1 #'put-pixel))))
        (1
         (let (j0 (j 0))
           (do ((pass 7 (- pass 1)))
               ((< pass 1))
             (let* ((y0 (aref '#(0 1 0 2 0 4 0 0) pass))
                    (x0 (aref '#(0 0 1 0 2 0 4 0) pass))
                    (dy (aref '#(1 2 2 4 4 8 8 8) pass))
                    (ph (aref '#(1 1 2 2 4 4 8 8) pass))
                    (dx (aref '#(1 1 2 2 4 4 8 8) pass))
                    (pw (aref '#(1 1 1 2 2 4 4 8) pass)) )
               (let ((row-len (+ 1 (ceiling (* (png-image-bits-per-pixel im) (ceiling (- width x0) dx))
                                            8))))
                 (setf j0 nil)
                 (when (> row-len 1)
                   (do ((y y0 (+ y dy)))
                       ((>= y height))
                     (apply-png-filter (aref data j) data (+ j 1) (if j0 (+ j0 1) nil) (1- row-len) bpp)
                     (render-filtered-row im bit-depth color-type transparent-color data j y x0 dx width pw ph #'put-pixel)
                     (psetf j (+ j row-len) j0 j))))))
           (assert (= j (length data))) ))
        (t
         (error "Unknown interlace method: ~D." (ihdr-interlace-method (png-image-ihdr im)))) ))
    res))

(defun png-stream->aimage (stream)
  (render-png-image-to-aimage (read-png-image stream)))

;;; todo: add some tests to replace the ones from closure (or put them back and make them compile)