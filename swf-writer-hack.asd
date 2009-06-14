
(asdf:defsystem :swf-writer-hack
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
