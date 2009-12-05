(in-package #:avm2-compiler)

;; profiler support, need to be run in localTrusted sandbox, see
;; http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager04.html


(let ((*symbol-table* *cl-symbol-table*))


  (c3* :%sprof

    (defmacro %set-property-by-name (object prop value)
      `(%asm
        (:@ ,value)
        (:dup)
        (:@ ,object)
        (:swap)
        (:@ ,prop)
        (:swap)
        (:set-property (:multiname-l "" ""))))
    (defmacro %get-property-by-name (object prop)
      `(%asm
        (:@ ,object)
        (:@ ,prop)
        (:get-property (:multiname-l "" ""))))


    (defun profile-report ()
      (let ((out "")
            (n (flash::flash.sampler.get-sample-count))
            (cs 0)
            (ns 0)
            (ds 0)
            (cpu nil)
            (hist (%new- flash:object)))
        (flet ((line (&arest rest)
                 (ftrace  (s+ "line :" (flash:apply #'s+ nil rest) " ||"))
                 #++(setf out (s+ out "
"
                                  a
                                  (flash:apply #'s+ nil rest)))))
          (line "testing" "1" 2 "3")
          (unless (equal "localTrusted" (%get-lex-property-static
                                         flash::flash.system.Security
                                         "sandboxType"))
            (line "not running in localTrusted sandbox, no profiling support"))
          (line "sample count =" n)
          (line "sample object count = "
                (loop with samples = (flash::flash.sampler.get-samples)
                   for i from 0 below (- n 10)
                   for dump from 0
                   for k being the hash-keys of samples using (hash-value v)
                   do (when (zerop (mod i 10000)) (line "i = " i))
                   do (if (%typep v flash:flash.sampler.new-object-sample)
                          (incf ns)
                          (if (%typep v flash:flash.sampler.delete-object-sample)
                              (incf ds)
                              (when (%typep v flash:flash.sampler.sample)
                                (incf cs)
                                (push v cpu)
                                (let ((stack (svref v "stack")))
                                  (dotimes (ii (length stack))
                                    (unless (svref hist (svref stack ii))
                                      (setf (svref hist (svref stack ii)) 0))
                                    (setf (svref hist (svref stack ii))
                                          (1+ (svref hist (svref stack ii)))))
                                  nil)
                                #++(when (< cs 100)
                                     (ftrace (s+ "sample = " v) )
                                     (ftrace (s+ "sample@" (flash:.time v)))
                                     (let ((stack (%get-property- v :stack)))
                                       (ftrace (s+ "stack=" stack
                                                   #++ #++ "fun=" (when stack (flash:.name (aref stack 0)))))))
                                )))
                   #++(when (%typep v flash:flash.sampler.sample)
                        (when (< dump 100)
                          (ftrace (s+ "sample = " v) )
                          (ftrace (s+ "sample@" (flash:.time v)))
                          (let ((stack (%get-property- v :stack)))
                            (ftrace (s+ "stack=" stack
                                        "
    fun=" (when stack (flash:.name (aref stack 0))))))))
                     (when (%typep v flash:flash.sampler.sample)
                       (when (< dump 3)
                         (ftrace (s+ "sample = " v) )
                         (ftrace (s+ "sample@" (flash:.time v)))
                         (let ((stack (svref v "stack")))
                           (ftrace (s+ "stack=" stack
                                       "
    fun=" (when stack (flash:.name (aref stack 0)))))
                           (dotimes (ii (length stack))
                             (ftrace (s+ " " (svref stack i)
                                         " = " (%get-property-by-name hist (svref stack i))
                                         " = " (svref hist (svref stack i)))
))
                           #++(loop for a across stack
                              for i from 0
                              do (ftrace (s+ "  " i " " a))
                                (list)
                              finally (return nil)))
))
                   sum 1))
          (line "samples = " ns " new, " ds " delete, " cs "cpu")
          (loop
             for k being the hash-keys of hist using (hash-value v)
             do (line v " = " k))
          nil)))

    (defmacro with-profiling ((&key ) &body body)
      (let ((now (gensym)))
        `(let ((,now (%new- flash:date)))
           (flash::system.gc)
           (flash::flash.sampler.start-sampling)
           (unwind-protect
                (progn ,@body)
             (flash::flash.sampler.pause-sampling)
             (ftrace
              (s+ "execution time :" (/ (- (%new- flash:date) ,now) 1000.0) "sec"))
             (ftrace (s+ "profiled :"
                         (flash::flash.sampler.get-sample-count) "samples"))
             (let ((o (profile-report)))
               (ftrace o)
               (flash::flash.sampler.clear-samples)
               (flash::flash.sampler.stop-sampling)

               o)))))))
