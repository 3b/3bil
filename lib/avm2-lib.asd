
(asdf:defsystem :avm2-lib
           :depends-on ("avm2-compile")
           :components ((:file "library-packages")
                        (:file "player-class-decl")
                        (:file "player-classes")
                        (:file "player-lib")
                        (:file "cl")
                        (:file "sicl-conditionals")
                        (:file "cl-conses")
                        )
           :serial t)
