(in-package :avm2-asm)

(defun runtime-name-count (index)
  "some opcodes need extra args when passed a runtime multiname, check
for that here and return count of extra args"
  (let* ((mn (aref (avm2-asm::multinames avm2-asm::*assembler-context*) index))
         (kind (car mn)))
    (cond
      ((or (= kind avm2-asm::+rt-qname+)
           (= kind avm2-asm::+rt-qname-a+))
       1)
      ((or (= kind avm2-asm::+rt-qname-l+)
           (= kind avm2-asm::+rt-qname-la+))
       2)
      (t 0))))

;;; opcode lists:
;;; http://ncannasse.fr/blog/adobe_alchemy
;;;-- missing some from this one:
;;; http://www.libspark.org/svn/as3/ByteCodeDisassembler/org/libspark/disassemble/abc/AbcParser.as

(define-ops
  ;; name   (args)    opcode    pop push   pop-scope push-scope  local  flags
  (:breakpoint ()                      #x01  0 0) ;
  (:nop        ()                      #x02  0 0) ;
  (:throw      ()                      #x03  1 0) ;
  (:get-super  ((multiname multiname-q30)) #x04  (1+ (runtime-name-count multiname)) 1)
  (:set-super  ((multiname multiname-q30)) #x05  (+ 2 (runtime-name-count multiname)))
  (:dxns       ((string string-u30))    #x06  0 0 0 0 0 +set-dxns+)
  (:dxnslate   ()                      #x07  1 0 0 0 0 +set-dxns+)
  (:kill       ((local-index u30))     #x08  0 0)
  (:label      ()                      #x09  0 0)
  ;; #x0a
  ;; #x0b
  (:if-nlt     ((offset ofs24))          #x0c  2 0)
  (:if-nle     ((offset ofs24))          #x0d  2 0)
  (:if-ngt     ((offset ofs24))          #x0e  2 0)
  (:if-nge     ((offset ofs24))          #x0f  2 0)
  (:jump         ((offset ofs24)) #x10  0 0)
  (:if-true      ((offset ofs24)) #x11  1 0)
  (:if-false     ((offset ofs24)) #x12  1 0)
  (:if-eq        ((offset ofs24)) #x13  2 0)
  (:if-ne        ((offset ofs24)) #x14  2 0)
  (:if-lt        ((offset ofs24)) #x15  2 0)
  (:if-le        ((offset ofs24)) #x16  2 0)
  (:if-gt        ((offset ofs24)) #x17  2 0)
  (:if-ge        ((offset ofs24)) #x18  2 0)
  (:if-strict-eq ((offset ofs24)) #x19  2 0)
  (:if-strict-ne ((offset ofs24)) #x1a  2 0)
  (:lookup-switch ((default-offset ofs24) (offsets counted-ofs24)) #x1b  1 0)
  (:push-with    ()             #x1c 1 0 0 1)
  (:pop-scope    ()             #x1d 0 0 1 0)
  (:next-name    ()             #x1e  2 1)
  (:has-next     ()             #x1f  2 1)
  (:push-null      ()                     #x20  0 1)
  (:push-undefined ()                     #x21  0 1)
  ;; (:push-constant ?                    #x22  ? ?) -- fp10 = illegal opcode
  (:next-value     ()                     #x23  2 1)
  (:push-byte      ((byte u8))            #x24  0 1)
  (:push-short     ((value u30))          #x25  0 1)
  (:push-true      ()                     #x26  0 1)
  (:push-false     ()                     #x27  0 1)
  (:push-nan       ()                     #x28  0 1)
  (:pop            ()                     #x29  1 0)
  (:dup            ()                     #x2a  1 2)
  (:swap           ()                     #x2b  2 2)
  (:push-string    ((string string-u30))   #x2c  0 1)
  (:push-int       ((integer  int-u30))  #x2d  0 1)
  (:push-uint      ((uinteger uint-u30)) #x2e  0 1)
  (:push-double    ((double double-u30))         #x2f  0 1)
  (:push-scope     ()                                             #x30  1 0 0 1)
  (:push-namespace ((namespace namespace-q30))                        #x31  0 1)
  (:has-next-2     ((object-local-reg u30) (index-local-reg u30)) #x32  0 1 0 0 (max object-local-reg index-local-reg))
  ;; #x33
  ;; #x34
  ;; #x35-#x3e: flash 10/alchemy instrs
  ;; see http://ncannasse.fr/blog/adobe_alchemy
  ;; (are these backwards? tamarin has li*/lf* then si*/sf*
  (:store-int-8     ()   #x35 2 0) ;; stack=value,addr -> .
  (:store-int-16    ()   #x36 2 0) ;; stack=value,addr -> .
  (:store-int-32    ()   #x37 2 0) ;; stack=value,addr -> .
  (:store-float-32  ()   #x38 2 0) ;; stack=value,addr -> .
  (:store-float-64  ()   #x39 2 0) ;; stack=value,addr -> .
  (:load-int-8      ()   #x3a 1 1) ;; stack=addr -> value
  (:load-int-16     ()   #x3b 1 1) ;; stack=addr -> value
  (:load-int-32     ()   #x3c 1 1) ;; stack=addr -> value
  (:load-float-32   ()   #x3d 1 1) ;; stack=addr -> value
  (:load-float-64   ()   #x3e 1 1) ;; stack=addr -> value
  ;; #x3f
  (:new-function    ((method-index method-u30))                    #x40  0 1)
  (:call            ((arg-count u30))                       #x41  (+ 2 arg-count) 1)
  (:construct       ((arg-count u30))                       #x42  (1+ arg-count) 1)
  (:call-method     ((method-index method-u30) (arg-count u30))    #x43  (+ 1 arg-count) 1)
  (:call-static     ((method-index method-u30) (arg-count u30))    #x44  (+ 1 arg-count) 1)
  (:call-super      ((multiname multiname-q30) (arg-count u30)) #x45  (+ 1 arg-count (runtime-name-count multiname)) 1)
  (:call-property   ((multiname multiname-q30) (arg-count u30)) #x46  (+ 1 arg-count (runtime-name-count multiname)) 1)
  (:return-void     ()                                      #x47 0 0)
  (:return-value    ()                                      #x48 1 0)
  (:construct-super ((arg-count u30))                       #x49  (1+ arg-count) 0)
  (:construct-prop  ((multiname multiname-q30) (arg-count u30)) #x4a  (+ 1 arg-count (runtime-name-count multiname)) 1)
  ;;(:call-super-id ?                                           #x4b ? ?)
  (:call-prop-lex   ((multiname multiname-q30) (arg-count u30)) #x4c  (+ 1 arg-count (runtime-name-count multiname)) 1)
  ;;(:call-interface ?                                          #x4d ? ?)
  (:call-super-void ((multiname multiname-q30) (arg-count u30)) #x4e  (+ 1 arg-count (runtime-name-count multiname)) 0)
  (:call-prop-void  ((multiname multiname-q30) (arg-count u30)) #x4f  (+ 1 arg-count (runtime-name-count multiname)) 0)
  ;; #50-#x52: flash 10/alchemy instructions
  (:sign-extend-1to32     ()   #x50 1 1) ;; stack=value,value
  (:sign-extend-8to32     ()   #x51 1 1) ;; stack=value,value
  (:sign-extend-16to32    ()   #x52 1 1) ;; stack=value,value
  ;; (:apply-type (?) #x53 1 1) ??
  ;; #x54
  (:new-object           ((arg-count u32))       #x55  (* 2 arg-count) 1)
  (:new-array            ((arg-count u30))       #x56  arg-count 1)
  (:new-activation       ()                      #x57  0 1 0 0 0 +need-activation+)
  (:new-class            ((class-index u30))     #x58  1 1)  ;; 2->1 ? also see docs about scope stuff
  (:get-descendants      ((multiname multiname-q30)) #x59  (1+ (runtime-name-count multiname)) 1)
  (:new-catch            ((exception-index u30)) #x5a  0 1)
  ;; #x5b
  ;; #x5c
  (:find-property-strict ((multiname multiname-q30)) #x5d  (runtime-name-count multiname) 1)
  (:find-property        ((multiname multiname-q30)) #x5e  (runtime-name-count multiname) 1)
  (:find-def             ((string string-u30))    #x5f  0 1) ;; ??
  (:get-lex          ((multiname multiname-q30)) #x60  0 1)
  (:set-property     ((multiname multiname-q30)) #x61  (+ 2 (runtime-name-count multiname)) 0)
  (:get-local        ((local-index u30))     #x62  0 1 0 0 local-index)
  (:set-local        ((local-index u30))     #x63  1 0 0 0 local-index)
  (:get-global-scope ()                      #x64  0 1)
  (:get-scope-object ((scope-index u8))      #x65  0 1)
  (:get-property     ((multiname multiname-q30)) #x66  (1+ (runtime-name-count multiname)) 1)
  ;;(:get-outer-scope (?) #x67 0 1) ??
  (:init-property    ((multiname multiname-q30)) #x68  (+ 2 (runtime-name-count multiname)) 0)
  ;; #x69
  (:delete-property  ((multiname multiname-q30)) #x6a (1+ (runtime-name-count multiname)) 1)
  ;; #x6b
  (:get-slot         ((slot-index u30))      #x6c  1 1)
  (:set-slot         ((slot-index u30))      #x6d  2 0)
  (:get-global-slot  ((slot-index u30))      #x6e  0 1) ;; deprecated?
  (:set-global-slot  ((slot-index u30))      #x6f  1 0) ;; deprecated?
  (:convert-string   () #x70  1 1)
  (:esc_xelem        () #x71  1 1)
  (:esc_xattr        () #x72  1 1)
  (:convert-integer  () #x73  1 1)
  (:convert-unsigned () #x74  1 1)
  (:convert-double   () #x75  1 1)
  (:convert-boolean  () #x76  1 1)
  (:convert-object   () #x77  1 1)
  (:check-filter     () #x78  1 1)
  ;; #x79
  ;; #x7a
  ;; #x7b
  ;; #x7c
  ;; #x7d
  ;; #x7e
  ;; #x7f
  (:coerce        ((multiname multiname-q30)) #x80  1 1)
  (:coerce-b      ()                      #x81  1 1) ;; deprecated?
  (:coerce-any    ()                      #x82  1 1)
  (:coerce-i      ()                      #x83  1 1) ;; deprecated?
  (:coerce-d      ()                      #x84  1 1) ;; deprecated?
  (:coerce-string ()                      #x85  1 1)
  (:as-type       ((multiname multiname-q30)) #x86  1 1)
  (:as-type-late  ()                      #x87  2 1)
  (:coerce-u      ()                      #x88  1 1) ;; deprecated?
  (:coerce-object ()                      #x89  1 1)
  ;; #x8a
  ;; #x8b
  ;; #x8c
  ;; #x8d
  ;; #x8e
  ;; #x8f
  (:negate    ()                  #x90  1 1)
  (:increment ()                  #x91  1 1)
  (:inc-local ((local-index u30)) #x92  0 0 0 0 local-index)
  (:decrement ()                  #x93  1 1)
  (:dec-local ((local-index u30)) #x94  0 0 0 0 local-index)
  (:type-of    ()                 #x95  1 1)
  (:not       ()                  #x96  1 1)
  (:bit-not   ()                  #x97  1 1)
  ;; (:concat ?                   #x9a ? ?)
  ;; (:add_d  ?                   #x9b ? ?)
  ;; #x9b
  ;; #x9e
  ;; #x9d
  ;; #x9f
  (:add             () #xa0  2 1)
  (:subtract        () #xa1  2 1)
  (:multiply        () #xa2  2 1)
  (:divide          () #xa3  2 1)
  (:modulo          () #xa4  2 1)
  (:lshift          () #xa5  2 1)
  (:rshift          () #xa6  2 1)
  (:unsigned-rshift () #xa7  2 1)
  (:bit-and         () #xa8  2 1)
  (:bit-or          () #xa9  2 1)
  (:bit-xor         () #xaa  2 1)
  (:equals          () #xab  2 1)
  (:strict-equals   () #xac  2 1)
  (:less-than       () #xad  2 1)
  (:less-equals     () #xae  2 1)
  (:greater-than    () #xaf  2 1)
  (:greater-equals ()                      #xb0  2 1)
  (:instance-of    ()                      #xb1  2 1)
  ;; :is-type seems broken (in player 10), unpredictably changes type
  ;;  of things on stack or scope stack causing verifier errors
  (:is-type        ((multiname multiname-q30)) #xb2  1 1)
  (:is-type-late   ()                      #xb3  2 1)
  (:in             ()                      #xb4  2 1)
  ;; #xb5
  ;; #xb6
  ;; #xb7
  ;; #xb8
  ;; #xb9
  ;; #xba
  ;; #xbb
  ;; #xbc
  ;; #xbd
  ;; #xbe
  ;; #xbf
  (:increment-i ()                  #xc0  1 1)
  (:decrement-i ()                  #xc1  1 1)
  (:inc-local-i ((local-index u30)) #xc2  0 0 0 0 local-index)
  (:dec-local-i ((local-index u30)) #xc3  0 0 0 0 local-index)
  (:negate-i    ()                  #xc4  1 1)
  (:add-i       ()                  #xc5  2 1)
  (:subtract-i  ()                  #xc6  2 1)
  (:multiply-i  ()                  #xc7  2 1)
  ;; #xc8
  ;; #xc9
  ;; #xca
  ;; #xcb
  ;; #xcc
  ;; #xcd
  ;; #xce
  ;; #xcf
  (:get-local-0 () #xd0  0 1 0 0 0)
  (:get-local-1 () #xd1  0 1 0 0 1)
  (:get-local-2 () #xd2  0 1 0 0 2)
  (:get-local-3 () #xd3  0 1 0 0 3)
  (:set-local-0 () #xd4  1 0 0 0 0)
  (:set-local-1 () #xd5  1 0 0 0 1)
  (:set-local-2 () #xd6  1 0 0 0 2)
  (:set-local-3 () #xd7  1 0 0 0 3)
  ;; #xd8
  ;; #xd9
  ;; #xda
  ;; #xdb
  ;; #xdc
  ;; #xdd
  ;; #xde
  ;; #xdf
  ;; #xe0
  ;; #xe1
  ;; #xe2
  ;; #xe3
  ;; #xe4
  ;; #xe5
  ;; #xe6
  ;; #xe7
  ;; #xe8
  ;; #xe9
  ;; #xea
  ;; #xeb
  ;; #xec
  ;; #xed
  ;; (:abs-jump () #xee 0 0) ?
  (:debug ((debug-type u8) (string string-u30) (register u8) (extra u30)) #xef  0 0)
  (:debug-line ((line-number u30))  #xf0  0 0)
  (:debug-file ((string string-u30)) #xf1  0 0)
  #+ (or) (:breakpoint-line ((line ?) #xf2))
  (:timestamp () #xf3 0 0)
  ;;(:verify-pass ? #xf5 ? ?)
  ;;(:alloc       ? #xf6 ? ?)
  ;;(:mark        ? #xf7 ? ?)
  ;;(:wb          ? #xf8 ? ?)
  ;;(:prologue    ? #xf9 ? ?)
  ;;(:send-enter  ? #xfa ? ?)
  ;;(:double-to-atom ? #xfb ? ?)
  ;;(:sweep       ? #xfc ? ?)
  ;;(:codegen-op  ? #xfd ? ?)
  ;;(:verify-op   ? #xfe ? ?)
  ;;(:decode      ? #xff ? ?)
)




#+nil(format t "~{ ~x ~}~% "
             (avm2-asm:assemble '((get-local-0)
                                 (push-scope)
                                 (return-void))))
;; D0 30 47


#+nil
(let ((*assembler-context* (make-instance 'assembler-context)))
  ;; intern some names so the code compiles
  (avm2-intern "")
  (avm2-ns-intern "")
  (qname "a" "b")
  (qname "b" "b")
  (qname "c" "b")
  (qname "d" "b")
  (qname "e" "b")
  (format t "~{ ~2,'0x~}~% "
          (assemble '((:get-local-0)
                      (:push-scope)
                      (:get-local-0)
                      (:construct-super 0)
                      (:find-property-strict 3)
                      (:construct-prop 3 0)
                      (:coerce 3)
                      (:set-local-1)
                      (:get-local-1)
                      (:push-string 7)
                      (:push-string 7)
                      (:add)
                      (:set-property 4)
                      (:find-property-strict 5)
                      (:get-local-1)
                      (:call-prop-void 5 1)
                      (:return-void)))))
;; D0 30 D0 49 00 5D 03 4A 03 00 80 03 D5 D1 2C 07 2C 07 A0 61 04 5D 05 D1 4F 05 01 47
;; D0 30 D0 49 00 5D 03 4A 03 00 80 03 D5 D1 2C 07 2C 07 A0 61 04 5D 05 D1 4F 05 01 47



#+nil
(let ((*assembler-context* (make-instance 'assembler-context)))
   ;; intern some names so the code compiles
   (avm2-intern "")
   (avm2-ns-intern "")
   (qname "a" "b")
   (qname "b" "b")
   (qname "c" "b")
   (qname "d" "b")
   (qname "e" "b")
   (format t "~{ ~2,'0x~}~% "
           (assemble '((:get-local-0)
                       (:push-scope)
                       (:get-local-0)
                       (:construct-super 0)
                       (:find-property-strict 3)
                       (:construct-prop 3 0)
                       (:coerce 3)
                       (:push-null)
                       (:pop)
                       (:set-local-1)
                       (:get-local-1)
                       (:push-string 7)
                       (:push-string 7)
                       (:add)
                       (:set-property 4)
                       (:find-property-strict 5)
                       (:get-local-1)
                       (:call-prop-void 5 1)
                       (:return-void)))))

#+nil
(let ((*assembler-context* (make-instance 'assembler-context)))
   ;; intern some names so the code compiles
   (avm2-intern "")
   (avm2-ns-intern "")
   (qname "a" "b")
   (qname "b" "b")
   (qname "c" "b")
   (qname "d" "b")
   (qname "e" "b")
   (format t "~{ ~s~%~}~% "
           (avm2-disassemble
            (assemble '((:get-local-0)
                        (:push-scope)
                        (:get-local-0)
                        (:construct-super 0)
                        (:find-property-strict (:id 3))
                        (:construct-prop (:id 3) 0)
                        (:coerce (:id 3))
                        (:push-null)
                        (:pop)
                        (:set-local-1)
                        (:get-local-1)
                        (:push-string "string1")
                        (:push-string "string2")
                        (:add)
                        (:set-property "foo:bar")
                        (:set-property (:qname "foo" "baz"))
                        (:set-property (:id 3))
                        (:find-property-strict "string1")
                        (:get-local-1)
                        (:call-prop-void (:id 5) 1)
                        (:return-void))))))

#+nil
(format t "~{ ~s~%~}"
        (avm2-disassemble #(#xD0 #x30 #xD0 #x49 #x00 #x5D #x03 #x4A #x03 #x00
                           #x80 #x03 #xD5 #xD1 #x2C #x07 #x2C #x07 #xA0 #x61
                           #x04 #x5D #x05 #xD1 #x4F #x05 #x01 #x47)))

#+nil
(format t "~{ #x~2,'0x~}~%"
        (assemble '( (:GET-LOCAL-0)
 (:PUSH-SCOPE)
 (:GET-LOCAL-0)
 (:CONSTRUCT-SUPER 0)
 (:FIND-PROPERTY-STRICT (:QNAME "flash.text" ":TextField"))
 (:CONSTRUCT-PROP (:QNAME "flash.text" ":TextField") 0)
 (:COERCE (:QNAME "flash.text" ":TextField"))
 (:SET-LOCAL-1)
 (:GET-LOCAL-1)
 (:PUSH-STRING "TextField")
 (:PUSH-STRING "TextField")
 (:ADD)
 (:SET-PROPERTY (:QNAME "" "foo"))
 (:FIND-PROPERTY-STRICT (:QNAME "flash.text" "TextField"))
 (:GET-LOCAL-1)
 (:CALL-PROP-VOID (:QNAME "flash.text" "TextField") 1)
 (:RETURN-VOID))))

#+nil
(format t "~{ ~s~%~}"
        (avm2-disassemble
         #( #xD0 #x30 #xD0 #x49 #x00 #x5D #x03 #x4A #x03 #x00 #x80 #x03 #xD5 #xD1 #x2C #x07 #x2C #x07 #xA0 #x61 #x04 #x5D #x05 #xD1 #x4F #x05 #x01 #x47)
))
