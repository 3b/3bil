
(asdf:defsystem :3b-swf-writer
  :description "'Front-end' of 3bil, a (common) lisp -> flash avm2 bytecode compiler."
  :depends-on ("avm2-lib"
               "chipz"
               "salza2"
               "3b-swf")
  :components ((:module
                "file"
                :serial t
                :components
                ((:file "png")
                 (:file "util")
                 (:file "3b-swf-write")
                 )))
  :serial t)
