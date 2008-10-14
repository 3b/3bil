
(defsystem :as3-compile
           :depends-on ("as3-asm")
           :components ((:file "package")
                        (:file "compiler-context")
                        (:file "compiler")
                        )
           :serial t)
