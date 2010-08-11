(cl:defpackage #:flash-utils
  (:nicknames #:fu)
  (:use #:avm2-compiler #:cl)
  (:import-from #:avm2-compiler
                #:s+)
  (:export
   #:s+ ;; from avm2-compiler for now, since existing code use it directly
   #:with-fill
   #:display
   #:text
   #:text-field
   #:button
   #:radians
   #:i255
   #:rgb
   #:rgba
   #:object))
(cl:in-package #:flash-utils)
;; misc utilities

(cl:defparameter %*fu-symbol-table*
  (cl:make-instance 'avm2-compiler::symbol-table
                    :inherit (list avm2-compiler::*cl-symbol-table*)))

(cl:let ((avm2-compiler::*symbol-table* %*fu-symbol-table*))
  (c3* :fu-top-level

    (defmacro with-fill (gfx (color alpha &key line-style) &body body)
      `(progn
         ,@(when line-style
                 `((flash:line-style ,gfx ,@line-style)))
         (flash:begin-fill ,gfx ,color ,alpha)
         ,@body
         (flash:end-fill ,gfx)))

        (defmacro object (&rest rest)
          `(%asm
            ,@(loop for (name val) on rest by #'cddr
                 ;; fixme: figure out how to specify desired type directly
                 collect `(:@ ,(if (and (symbolp name) (keywordp name))
                                   (avm2-asm::symbol-to-export-string name)
                                   name))
                 collect `(:coerce-string)
                 collect `(:@ ,val))
            (:new-object ,(/ (length rest) 2))))

        (defmacro display (object
                           &key (x 0 xp) (y 0 yp) (width 0 wp) (height 0 hp)
                           (visible nil vp) (background-color 0 bgp)
                           scale-x scale-y scale-z
                           parent
                           opaque-background
                           &allow-other-keys)
          (let ((o (gensym)))
            `(let ((,o ,object))
               ,@(loop for f in '(flash:.x
                                  flash:.y
                                  flash:.width
                                  flash:.height
                                  flash:.visible
                                  flash:.background-color
                                  flash:.scale-x
                                  flash:.scale-y
                                  flash:.scale-z
                                  flash:.opaque-background)
                    for v in (list x y width height visible background-color
                                   scale-x scale-y scale-z
                                   opaque-background)
                    for p in (list xp yp wp hp vp bgp
                                   scale-x scale-y scale-z
                                   opaque-background)
                    when p
                    collect `(setf (,f ,o) ,v))
               ,@(when parent `((flash:add-child ,parent ,o)))
               ,o)))


        (defmacro text (object
                        &rest args
                        &key (auto-size nil asp) (text-color 0 tcp)
                        (word-wrap nil wwp)
                        (background nil bgp) (background-color 0 bgcp)
                        (border nil borderp) (border-color 0 bcp)
                        (mouse-wheel-enabled nil mwep)
                        (text "" tp) (font "" fp)
                        (color 0 cp)
                        (size 0 sp)
                        (selectable t selp)
                        &allow-other-keys)
          (let ((o (gensym))
                (tf (gensym)))
            (declare (ignorable tf))
            `(let* ((,o ,object)
                    ,@ (when (or fp sp)
                         `((,tf (%new- flash:flash.text.text-format)))))
               (display ,o ,@args)
               ,@ (when (or fp sp)
                    (loop for f in '(flash:.font
                                     flash:.size
                                     flash:.color)
                       for v in (list font size color)
                       for p in (list fp sp cp)
                       when p
                       collect `(setf (,f ,tf) ,v)))
               ,@ (when (or fp sp cp)
                    `((setf (flash:.default-text-format ,o) ,tf)))

               ,@(loop for f in '(flash:.auto-size
                                  flash:.text-color
                                  flash:.word-wrap
                                  flash:.background
                                  flash:.background-color
                                  flash:.border
                                  flash:.border-color
                                  flash:.mouse-wheel-enabled
                                  flash:.text
                                  flash:.selectable)
                    for v in (list auto-size text-color word-wrap
                                   background background-color
                                   border border-color mouse-wheel-enabled
                                   text
                                   selectable)
                    for p in (list asp tcp wwp bgp bgcp borderp bcp mwep tp
                                   selp)
                    when p
                    collect `(setf (,f ,o) ,v))
               ,o)))

        (defmacro text-field (&rest args)
          `(text (%new- flash:flash.text.text-field)
                 ,@args
                 ;; default settings used if not overridden in args
                 :width 650 :auto-size "none"
                 :text-color #x30e830
                 :word-wrap t :background t
                 :background-color #x20202020
                 :border t :border-color #xff000000
                 :mouse-wheel-enabled t
                 :text "..."
                 :font "Arial"))

        (defun dump-object (o)
          (let ((s ""))
            (loop for k being the hash-keys of o using (hash-value v)
               do (setf s (avm2-compiler::s+ s k " = " v "
")))
            s))
        (defun dump-object2 (o)
          (let ((s ""))
            (loop for k being the hash-keys of o using (hash-value v)
               do (setf s (avm2-compiler::s+ s k " = " v " ; ")))
            s))
        (defun dump-objects (o)
          (let ((s ""))
            (loop for k being the hash-keys of o using (hash-value v)
               do (setf s (avm2-compiler::s+ s k " = " (dump-object2 v) "
")))
            s))


    (defmacro button (text click bg &rest display-args)
      (let ((tf (gensym))
            (button (gensym)))
        `(let* ((,tf (text-field
                      :width 150
                      :background-color ,bg
                      :text ,text
                      :size 24
                      :font "Arial"
                      ,@(when (getf display-args :height)
                              (list :height (getf display-args :height)))))
                (,button (%new- flash:flash.display.simple-button ,tf ,tf ,tf ,tf)))
           (flash:add-event-listener ,button "click" ,click)
           (display ,button ,@display-args))))

    (defun dump-object2 (o)
      (let ((s ""))
        (loop for k being the hash-keys of o using (hash-value v)
           do (setf s (avm2-compiler::s+ s k " = " v " ; ")))
        s))


    (defun radians (a)
      (declare (double-float a))
      (/ (* a flash:+math.pi+) 180.0))

    (defun i255 (a)
      (declare (double-float a))
      (max (min (floor (* a 256)) 255) 0))

    (defun rgb (r g b)
      (declare (double-float r g b))
      (+ (* (i255 r) 65536) (* (i255 g) 256) (i255 b)))

    (defun rgba (r g b a)
      (declare (double-float r g b a))
      (+ (* (i255 a) 65536 256) (rgb r g b)))


    (defun list->str (l)
      (if (atom l)
          (if l (flash:to-string l) l)
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

    (defmacro drop-shadow (&key (distance 4.0) (angle 45) (color 0)
                           (alpha 1.0) (blur-x 4.0) (blur-y 4.0)
                           (strength 1.0) (quality 1)
                           (inner nil) (knockout nil)
                           (hide-object nil))
      `(%new- flash:flash.filters.drop-shadow-filter
              ,distance ,angle ,color
              ,alpha ,blur-x ,blur-y
              ,strength ,quality
              ,inner ,knockout
              ,hide-object))

))

