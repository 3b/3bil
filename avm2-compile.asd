
(asdf:defsystem :avm2-compile
           :depends-on ("avm2-asm")
           :components ((:module
                         "compile"
                         :serial t
                         :components
                         ((:file "package")
                          (:file "compiler-context")
                          (:file "compiler")
                          (:file "special-forms")
                          (:file "macro")
                          (:file "defun")
                          (:file "swfclass")
                          (:file "low-level")
                          (:file "math-ops")
                          (:file "ffi")
                          ;; new stuff in progress...
                          (:file "walker")
                          (:file "environment")
                          (:file "ir0")
                          (:file "ir1")
                          (:file "ir2-simple")
                          )))
           :serial t)
