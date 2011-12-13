
(asdf:defsystem :swf-writer-hack
  :description "old test code from 3bil, use 3b-swf-writer instead"
  :depends-on ("avm2-lib"
               "chipz"
               "salza2")
  :components ((:module
                "file"
                :serial t
                :components
                ((:file "png")
                 (:file "util")
                 (:file "write")
                 )))
  :serial t)
