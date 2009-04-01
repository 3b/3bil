
(asdf:defsystem :avm2-lib
           :depends-on ("avm2-compile")
           :components ((:file "player-ffi-packages")
                        (:file "player-ffi-defs")
                        (:file "cl")
                        (:file "cl-conses")
                        (:file "sicl-conditionals")
                        (:file "sicl-iteration")
                        (:file "cl-conses2")
                        (:file "cl-arrays")
                        (:file "cl-sequences")
                        ;; temprorary hack for new compiler
                        (:file "cl-new")
                        )
           :serial t)
