
(asdf:defsystem :avm2-lib
  :description "CL and utility libraries for 3bil"
  :depends-on ("avm2-compile")
  :components ((:module
                "lib"
                :serial t
                :components
                (;; (:file "player-ffi-packages")
                 ;; (:file "player-ffi-defs")
                 (:file "player-ffi-new")
                 (:file "bootstrap")
                 (:file "setf")
                 (:file "sicl-setf-expanders")
                 (:file "cl")
                 (:file "cl-conses")
                 (:file "sicl-conditionals")
                 (:file "sicl-iteration")
                 ;; (:file "cl-conses2")
                 (:file "cl-arrays")
                 ;; temprorary hack for new compiler
                 (:file "misc")
                 (:file "cl-new")
                 (:file "sacla-loop")
                 ;; probably should move this earlier at some point
                 (:file "m-v-b")
                 (:file "sicl-cons-high")
                 (:file "cl-sequences")
                 (:file "cl-late")
                 ;; misc extra stuff...
                 (:file "fu")
                 )))
  :serial t)
