(in-package #:avm2-compiler)

;; code to regenerate the top level flash ffi
(error "run the playerglobal ffi generation stuff by hand for now...")

;; adjust paths as needed...
;(3b-swf::read-swc "../../tmp/playerglobal.swc")
#++
(loop for tag in (getf (cdr (3b-swf::read-swc  "../../tmp/playerglobal.swc")) :tags)
   when (typep tag '%3b-swf:do-abc-tag)
   collect "=============="
   and collect (%3b-swf:name tag)
   and append (%3b-swf:strings (%3b-swf:constant-pool tag)))

(with-open-file (*standard-output* "source/3bil/lib/player-ffi-new.lisp" :direction :output  :if-exists :supersede)
  (avm2-compiler::ffi-from-swc "../../tmp/playerglobal.swc"
                               "avm2-compiler::*player-symbol-table*"
                               "flash"
                               :use () #++'(":cl"))
  )

#++
(setf (inherited-symbol-tables *cl-symbol-table*) (list flash::*%SYMBOL-TABLE*))