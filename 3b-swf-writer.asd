
(asdf:defsystem :3b-swf-writer
  :depends-on ("avm2-lib"
               "chipz"
               "salza2")
  :components ((:module
                "file"
                :serial t
                :components
                ((:file "png")
                 (:file "util")
                 (:file "3b-swf-write")
                 )))
  :serial t)
