
(asdf:defsystem :as3-compile
           :depends-on ("as3-asm")
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
