
(asdf:defsystem :avm2-compile
           :depends-on ("avm2-asm")
           :components ((:file "package")
                        (:file "compiler-context")
                        (:file "compiler")
                        (:file "special-forms")
                        (:file "defun")
                        (:file "swfclass")
                        (:file "low-level")
                        (:file "math-ops")
                        (:file "ffi")
                        )
           :serial t)
