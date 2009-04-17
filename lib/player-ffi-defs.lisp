;;; --generated file, do not edit--

(in-package :avm2-compiler)
(clrhash (functions *player-symbol-table*))
(clrhash (variables *player-symbol-table*))
(clrhash (properties *player-symbol-table*))
(clrhash (constants *player-symbol-table*))
(clrhash (class-methods *player-symbol-table*))
(clrhash (class-static-methods *player-symbol-table*))
(clrhash (classes *player-symbol-table*))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defconstant %flash:+as3+ "AS3" "null")
  (swf-ffi-defconstant %flash:+infinity+ "Infinity" "Number")
  (swf-ffi-defconstant %flash:+undefined+ "undefined" "null")
  (swf-ffi-defconstant %flash:+nan+ "NaN" "Number")
  (swf-ffi-defconstant %flash:+flash-proxy+ "flash_proxy" "null")
)

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:dont-enum-prototype "_dontEnumPrototype"
    (("proto" "Object")) "void" :class %flash:object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:set-property-is-enumerable "_setPropertyIsEnumerable"
    ("o" ("V" "String") ("enumerable" "Boolean")) "void" :class %flash:object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:object "Object"
    NIL "*" :class %flash:object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:class "Class"
    NIL "*" :class %flash:class))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:function "Function"
    NIL "*" :class %flash:function))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:namespace "Namespace"
    (&OPTIONAL "prefix" "uri") "*" :class %flash:namespace))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:boolean "Boolean"
    (&OPTIONAL "value") "*" :class %flash:boolean))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:number "Number"
    (&OPTIONAL ("value" 0)) "*" :class %flash:number))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:int "int"
    (&OPTIONAL ("value" 0)) "*" :class %flash:int))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:uint "uint"
    (&OPTIONAL ("value" 0)) "*" :class %flash:uint))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:from-char-code "fromCharCode"
    NIL "String" :class %flash:string))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:string "String"
    (&OPTIONAL ("value" "")) "*" :class %flash:string))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:array "Array"
    NIL "*" :class %flash:array))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %__AS3__.vec:vector "Vector"
    NIL "*" :class %__AS3__.vec:vector))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %__AS3__.vec:vector$object "Vector$object"
    (&OPTIONAL (("length" "uint") 0) (("fixed" "Boolean") NIL)) "*" :class %__AS3__.vec:vector$object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %__AS3__.vec:vector$int "Vector$int"
    (&OPTIONAL (("length" "uint") 0) (("fixed" "Boolean") NIL)) "*" :class %__AS3__.vec:vector$int))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %__AS3__.vec:vector$uint "Vector$uint"
    (&OPTIONAL (("length" "uint") 0) (("fixed" "Boolean") NIL)) "*" :class %__AS3__.vec:vector$uint))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %__AS3__.vec:vector$double "Vector$double"
    (&OPTIONAL (("length" "uint") 0) (("fixed" "Boolean") NIL)) "*" :class %__AS3__.vec:vector$double))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %builtin.as$0:method-closure "MethodClosure"
    NIL "*" :class %builtin.as$0:method-closure))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:escape "escape"
    (&OPTIONAL (("s" "String") "undefined")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:encode-uri "encodeURI"
    (&OPTIONAL (("uri" "String") "undefined")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:decode-uri "decodeURI"
    (&OPTIONAL (("uri" "String") "undefined")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:encode-uri-component "encodeURIComponent"
    (&OPTIONAL (("uri" "String") "undefined")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:parse-int "parseInt"
    (&OPTIONAL (("s" "String") "NaN") (("radix" "int") 0)) "Number"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:unescape "unescape"
    (&OPTIONAL (("s" "String") "undefined")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:parse-float "parseFloat"
    (&OPTIONAL (("str" "String") "NaN")) "Number"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:is-nan "isNaN"
    (&OPTIONAL ("n" "Number")) "Boolean"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:is-finite "isFinite"
    (&OPTIONAL ("n" "Number")) "Boolean"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:decode-uri-component "decodeURIComponent"
    (&OPTIONAL (("uri" "String") "undefined")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:ime "ime"
    NIL "flash.system::IME" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:use-code-page "useCodePage"
    NIL "Boolean" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:total-memory "totalMemory"
    NIL "uint" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:use-code-page "useCodePage"
    (("value" "Boolean")) "void" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:vm-version "vmVersion"
    NIL "String" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:resume "resume"
    NIL "void" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:set-clipboard "setClipboard"
    (("string" "String")) "void" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:pause "pause"
    NIL "void" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:gc "gc"
    NIL "void" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:exit "exit"
    (("code" "uint")) "void" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:system "System"
    NIL "*" :class %flash.system:system))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.sampler:stack-frame "StackFrame"
    NIL "*" :class %flash.sampler:stack-frame))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.sampler:sample "Sample"
    NIL "*" :class %flash.sampler:sample))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.sampler:new-object-sample "NewObjectSample"
    NIL "*" :class %flash.sampler:new-object-sample))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.sampler:delete-object-sample "DeleteObjectSample"
    NIL "*" :class %flash.sampler:delete-object-sample))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:pause-sampling "flash.sampler:pauseSampling"
    NIL "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:stop-sampling "flash.sampler:stopSampling"
    NIL "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:get-member-names "flash.sampler:getMemberNames"
    (("o" "Object") &OPTIONAL (("instanceNames" "Boolean") NIL)) "Object"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:get-getter-invocation-count "flash.sampler:getGetterInvocationCount"
    (("obj" "Object") ("qname" "QName")) "Number"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:get-invocation-count "flash.sampler:getInvocationCount"
    (("obj" "Object") ("qname" "QName")) "Number"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:get-setter-invocation-count "flash.sampler:getSetterInvocationCount"
    (("obj" "Object") ("qname" "QName")) "Number"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:is-getter-setter "flash.sampler:isGetterSetter"
    (("obj" "Object") ("qname" "QName")) "Boolean"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:get-samples "flash.sampler:getSamples"
    NIL "Object"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:get-sample-count "flash.sampler:getSampleCount"
    NIL "Number"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:start-sampling "flash.sampler:startSampling"
    NIL "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:get-size "flash.sampler:getSize"
    ("o") "Number"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.sampler:clear-samples "flash.sampler:clearSamples"
    NIL "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:event "Event"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL)) "*" :class %flash.events:event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:text-event "TextEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("text" "String") "")) "*" :class %flash.events:text-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:error-event "ErrorEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("text" "String") "")) "*" :class %flash.events:error-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:async-error-event "AsyncErrorEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("text" "String") "") ("error" "Error")) "*" :class %flash.events:async-error-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:i-data-output "IDataOutput"
    NIL "*" :class %flash.utils:i-data-output))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:i-data-input "IDataInput"
    NIL "*" :class %flash.utils:i-data-input))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:default-object-encoding "defaultObjectEncoding"
    NIL "uint" :class %flash.utils:byte-array))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:default-object-encoding "defaultObjectEncoding"
    (("version" "uint")) "void" :class %flash.utils:byte-array))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:byte-array "ByteArray"
    NIL "*" :class %flash.utils:byte-array))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:throw-error "throwError"
    (("type" "Class") &REST ("index" "uint")) "*" :class %flash:error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:get-error-message "getErrorMessage"
    (("index" "int")) "String" :class %flash:error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:error "Error"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:definition-error "DefinitionError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:definition-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:eval-error "EvalError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:eval-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:range-error "RangeError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:range-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:reference-error "ReferenceError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:reference-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:security-error "SecurityError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:security-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:syntax-error "SyntaxError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:syntax-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:type-error "TypeError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:type-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:uri-error "URIError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:uri-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:verify-error "VerifyError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:verify-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:uninitialized-error "UninitializedError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:uninitialized-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:argument-error "ArgumentError"
    (&OPTIONAL ("message" "") ("id" 0)) "*" :class %flash:argument-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shader-precision "ShaderPrecision"
    NIL "*" :class %flash.display:shader-precision))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:abs "abs"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:random "random"
    NIL "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:acos "acos"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:cos "cos"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:ceil "ceil"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:round "round"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:asin "asin"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:sin "sin"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:atan2 "atan2"
    (("x" "Number") ("y" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:floor "floor"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:log "log"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:exp "exp"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:pow "pow"
    (("x" "Number") ("y" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:atan "atan"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:tan "tan"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:min "min"
    (("x" "Number") &REST ("y" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:max "max"
    (("x" "Number") &REST ("y" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:sqrt "sqrt"
    (("x" "Number")) "Number" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:math "Math"
    NIL "*" :class %flash:math))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:reg-exp "RegExp"
    (&OPTIONAL "pattern" "options") "*" :class %flash:reg-exp))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:i-event-dispatcher "IEventDispatcher"
    NIL "*" :class %flash.events:i-event-dispatcher))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:weak-method-closure "WeakMethodClosure"
    NIL "*" :class %flash.events:weak-method-closure))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:weak-function-closure "WeakFunctionClosure"
    NIL "*" :class %flash.events:weak-function-closure))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:event-dispatcher "EventDispatcher"
    (&OPTIONAL ("target" "flash.events::IEventDispatcher")) "*" :class %flash.events:event-dispatcher))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:context-menu-item "ContextMenuItem"
    (("caption" "String") &OPTIONAL (("separatorBefore" "Boolean") NIL)
     (("enabled" "Boolean") T) (("visible" "Boolean") T)) "*" :class %flash.ui:context-menu-item))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:current-domain "currentDomain"
    NIL "flash.system::ApplicationDomain" :class %flash.system:application-domain))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:min-domain-memory-length "MIN_DOMAIN_MEMORY_LENGTH"
    NIL "uint" :class %flash.system:application-domain))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:application-domain "ApplicationDomain"
    (&OPTIONAL ("parentDomain" "flash.system::ApplicationDomain")) "*" :class %flash.system:application-domain))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:content-element "ContentElement"
    (&OPTIONAL ("elementFormat" "flash.text.engine::ElementFormat")
     ("eventMirror" "flash.events::EventDispatcher")
     (("textRotation" "String") "rotate0")) "*" :class %flash.text.engine:content-element))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:scene "Scene"
    (("name" "String") ("labels" "Array") ("numFrames" "int")) "*" :class %flash.display:scene))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.printing:print-job "PrintJob"
    NIL "*" :class %flash.printing:print-job))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:i-graphics-path "IGraphicsPath"
    NIL "*" :class %flash.display:i-graphics-path))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:i-graphics-data "IGraphicsData"
    NIL "*" :class %flash.display:i-graphics-data))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-path "GraphicsPath"
    (&OPTIONAL ("commands" "__AS3__.vec::Vector.<int>")
     ("data" "__AS3__.vec::Vector.<Number>") (("winding" "String") "evenOdd")) "*" :class %flash.display:graphics-path))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:matrix "Matrix"
    (&OPTIONAL (("a" "Number") 1) (("b" "Number") 0) (("c" "Number") 0)
     (("d" "Number") 1) (("tx" "Number") 0) (("ty" "Number") 0)) "*" :class %flash.geom:matrix))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:get-justifier-for-locale "getJustifierForLocale"
    (("locale" "String")) "flash.text.engine::TextJustifier" :class %flash.text.engine:text-justifier))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-justifier "TextJustifier"
    (("locale" "String") ("lineJustification" "String")) "*" :class %flash.text.engine:text-justifier))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:space-justifier "SpaceJustifier"
    (&OPTIONAL (("locale" "String") "en")
     (("lineJustification" "String") "unjustified")
     (("letterSpacing" "Boolean") NIL)) "*" :class %flash.text.engine:space-justifier))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:i-bitmap-drawable "IBitmapDrawable"
    NIL "*" :class %flash.display:i-bitmap-drawable))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:display-object "DisplayObject"
    NIL "*" :class %flash.display:display-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:bitmap "Bitmap"
    (&OPTIONAL ("bitmapData" "flash.display::BitmapData")
     (("pixelSnapping" "String") "auto") (("smoothing" "Boolean") NIL)) "*" :class %flash.display:bitmap))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.xml:xml-node "XMLNode"
    (("type" "uint") ("value" "String")) "*" :class %flash.xml:xml-node))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.xml:xml-document "XMLDocument"
    (&OPTIONAL ("source" "String")) "*" :class %flash.xml:xml-document))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:east-asian-justifier "EastAsianJustifier"
    (&OPTIONAL (("locale" "String") "ja")
     (("lineJustification" "String") "allButLast")
     (("justificationStyle" "String") "pushInKinsoku")) "*" :class %flash.text.engine:east-asian-justifier))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:max-level "maxLevel"
    (("value" "int")) "void" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:display-mode "displayMode"
    NIL "String" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:set-advanced-anti-aliasing-table "setAdvancedAntiAliasingTable"
    (("fontName" "String") ("fontStyle" "String") ("colorType" "String")
     ("advancedAntiAliasingTable" "Array")) "void" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:max-level "maxLevel"
    NIL "int" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:anti-alias-type "antiAliasType"
    NIL "String" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:display-mode "displayMode"
    (("value" "String")) "void" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:anti-alias-type "antiAliasType"
    (("value" "String")) "void" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-renderer "TextRenderer"
    NIL "*" :class %flash.text:text-renderer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:settings "settings"
    NIL "Object" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:pretty-indent "prettyIndent"
    (("newIndent" "int")) "*" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:set-settings "setSettings"
    (&OPTIONAL ("o" "Object")) "void" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:ignore-comments "ignoreComments"
    NIL "Boolean" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:pretty-indent "prettyIndent"
    NIL "int" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:ignore-processing-instructions "ignoreProcessingInstructions"
    NIL "Boolean" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:pretty-printing "prettyPrinting"
    NIL "Boolean" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:ignore-whitespace "ignoreWhitespace"
    NIL "Boolean" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:ignore-comments "ignoreComments"
    (("newIgnore" "Boolean")) "*" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:ignore-processing-instructions "ignoreProcessingInstructions"
    (("newIgnore" "Boolean")) "*" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:pretty-printing "prettyPrinting"
    (("newPretty" "Boolean")) "*" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:default-settings "defaultSettings"
    NIL "Object" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:ignore-whitespace "ignoreWhitespace"
    (("newIgnore" "Boolean")) "*" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:xml "XML"
    (&OPTIONAL "value") "*" :class %flash:xml))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:xml-list "XMLList"
    (&OPTIONAL "value") "*" :class %flash:xml-list))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:q-name "QName"
    (&OPTIONAL "namespace" "name") "*" :class %flash:q-name))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:is-xml-name "isXMLName"
    (&OPTIONAL "str") "Boolean"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:stage-align "StageAlign"
    NIL "*" :class %flash.display:stage-align))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.profiler:show-redraw-regions "flash.profiler:showRedrawRegions"
    (("on" "Boolean") &OPTIONAL (("color" "uint") 16711680)) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.profiler:profile "flash.profiler:profile"
    (("on" "Boolean")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:color-correction-support "ColorCorrectionSupport"
    NIL "*" :class %flash.display:color-correction-support))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.errors:illegal-operation-error "IllegalOperationError"
    (&OPTIONAL (("message" "String") "") (("id" "int") 0)) "*" :class %flash.errors:illegal-operation-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.errors:io-error "IOError"
    (&OPTIONAL (("message" "String") "") (("id" "int") 0)) "*" :class %flash.errors:io-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.errors:memory-error "MemoryError"
    (&OPTIONAL (("message" "String") "") (("id" "int") 0)) "*" :class %flash.errors:memory-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.errors:stack-overflow-error "StackOverflowError"
    (&OPTIONAL (("message" "String") "") (("id" "int") 0)) "*" :class %flash.errors:stack-overflow-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.errors:script-timeout-error "ScriptTimeoutError"
    (&OPTIONAL (("message" "String") "") (("id" "int") 0)) "*" :class %flash.errors:script-timeout-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.errors:invalid-swf-error "InvalidSWFError"
    (&OPTIONAL (("message" "String") "") (("id" "int") 0)) "*" :class %flash.errors:invalid-swf-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.errors:eof-error "EOFError"
    (&OPTIONAL (("message" "String") "") (("id" "int") 0)) "*" :class %flash.errors:eof-error))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:line-scale-mode "LineScaleMode"
    NIL "*" :class %flash.display:line-scale-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:font-style "FontStyle"
    NIL "*" :class %flash.text:font-style))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:point-towards "pointTowards"
    (("percent" "Number") ("mat" "flash.geom::Matrix3D")
     ("pos" "flash.geom::Vector3D") &OPTIONAL ("at" "flash.geom::Vector3D")
     ("up" "flash.geom::Vector3D")) "flash.geom::Matrix3D" :class %flash.geom:utils3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:project-vector "projectVector"
    (("m" "flash.geom::Matrix3D") ("v" "flash.geom::Vector3D")) "flash.geom::Vector3D" :class %flash.geom:utils3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:project-vectors "projectVectors"
    (("m" "flash.geom::Matrix3D") ("verts" "__AS3__.vec::Vector.<Number>")
     ("projectedVerts" "__AS3__.vec::Vector.<Number>")
     ("uvts" "__AS3__.vec::Vector.<Number>")) "void" :class %flash.geom:utils3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:utils3d "Utils3D"
    NIL "*" :class %flash.geom:utils3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:typographic-case "TypographicCase"
    NIL "*" :class %flash.text.engine:typographic-case))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:tab-alignment "TabAlignment"
    NIL "*" :class %flash.text.engine:tab-alignment))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:ime-conversion-mode "IMEConversionMode"
    NIL "*" :class %flash.system:ime-conversion-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.net:navigate-to-url "flash.net:navigateToURL"
    (("request" "flash.net::URLRequest") &OPTIONAL ("window" "String")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.net:get-class-by-alias "flash.net:getClassByAlias"
    (("aliasName" "String")) "Class"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.net:register-class-alias "flash.net:registerClassAlias"
    (("aliasName" "String") ("classObject" "Class")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.net:send-to-url "flash.net:sendToURL"
    (("request" "flash.net::URLRequest")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:fscommand "_fscommand"
    (("command" "String") ("args" "String")) "void" :class %flash.system:fscommand))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:fscommand "FSCommand"
    NIL "*" :class %flash.system:fscommand))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.system:fscommand "flash.system:fscommand"
    (("command" "String") &OPTIONAL (("args" "String") "")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:tab-stop "TabStop"
    (&OPTIONAL (("alignment" "String") "start") (("position" "Number") 0)
     (("decimalAlignmentToken" "String") "")) "*" :class %flash.text.engine:tab-stop))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:i-graphics-fill "IGraphicsFill"
    NIL "*" :class %flash.display:i-graphics-fill))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-gradient-fill "GraphicsGradientFill"
    (&OPTIONAL (("type" "String") "linear") ("colors" "Array")
     ("alphas" "Array") ("ratios" "Array") "matrix" ("spreadMethod" "pad")
     (("interpolationMethod" "String") "rgb") (("focalPointRatio" "Number") 0)) "*" :class %flash.display:graphics-gradient-fill))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:is-font-compatible "isFontCompatible"
    (("fontName" "String") ("fontWeight" "String") ("fontPosture" "String")) "Boolean" :class %flash.text.engine:font-description))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:font-description "FontDescription"
    (&OPTIONAL (("fontName" "String") "_serif")
     (("fontWeight" "String") "normal") (("fontPosture" "String") "normal")
     (("fontLookup" "String") "device") (("renderingMode" "String") "cff")
     (("cffHinting" "String") "horizontalStem")) "*" :class %flash.text.engine:font-description))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:net-stream "NetStream"
    (("connection" "flash.net::NetConnection") &OPTIONAL
     (("peerID" "String") "connectToFMS")) "*" :class %flash.net:net-stream))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.xml:xml-node-type "XMLNodeType"
    NIL "*" :class %flash.xml:xml-node-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:ime-event "IMEEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("text" "String") "")) "*" :class %flash.events:ime-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:bitmap-filter "BitmapFilter"
    NIL "*" :class %flash.filters:bitmap-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:drop-shadow-filter "DropShadowFilter"
    (&OPTIONAL (("distance" "Number") 4) (("angle" "Number") 45)
     (("color" "uint") 0) (("alpha" "Number") 1) (("blurX" "Number") 4)
     (("blurY" "Number") 4) (("strength" "Number") 1) (("quality" "int") 1)
     (("inner" "Boolean") NIL) (("knockout" "Boolean") NIL)
     (("hideObject" "Boolean") NIL)) "*" :class %flash.filters:drop-shadow-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:timer "Timer"
    (("delay" "Number") &OPTIONAL (("repeatCount" "int") 0)) "*" :class %flash.utils:timer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:set-interval-timer "SetIntervalTimer"
    (("closure" "Function") ("delay" "Number") ("repeats" "Boolean")
     ("rest" "Array")) "*" :class %flash.utils:set-interval-timer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:set-timeout "flash.utils:setTimeout"
    (("closure" "Function") &REST ("delay" "Number")) "uint"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:set-interval "flash.utils:setInterval"
    (("closure" "Function") &REST ("delay" "Number")) "uint"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:clear-timeout "flash.utils:clearTimeout"
    (("id" "uint")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:clear-interval "flash.utils:clearInterval"
    (("id" "uint")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:caps-lock "capsLock"
    NIL "Boolean" :class %flash.ui:keyboard))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:is-accessible "isAccessible"
    NIL "Boolean" :class %flash.ui:keyboard))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:num-lock "numLock"
    NIL "Boolean" :class %flash.ui:keyboard))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:keyboard "Keyboard"
    NIL "*" :class %flash.ui:keyboard))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound-transform "soundTransform"
    (("sndTransform" "flash.media::SoundTransform")) "void" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:are-sounds-inaccessible "areSoundsInaccessible"
    NIL "Boolean" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:buffer-time "bufferTime"
    NIL "int" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:compute-spectrum "computeSpectrum"
    (("outputArray" "flash.utils::ByteArray") &OPTIONAL
     (("FFTMode" "Boolean") NIL) (("stretchFactor" "int") 0)) "void" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:buffer-time "bufferTime"
    (("bufferTime" "int")) "void" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound-transform "soundTransform"
    NIL "flash.media::SoundTransform" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:stop-all "stopAll"
    NIL "void" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound-mixer "SoundMixer"
    NIL "*" :class %flash.media:sound-mixer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shader-data "ShaderData"
    (("byteCode" "flash.utils::ByteArray")) "*" :class %flash.display:shader-data))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:bitmap-data "BitmapData"
    (("width" "int") ("height" "int") &OPTIONAL (("transparent" "Boolean") T)
     (("fillColor" "uint") 4294967295)) "*" :class %flash.display:bitmap-data))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-field-type "TextFieldType"
    NIL "*" :class %flash.text:text-field-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-end-fill "GraphicsEndFill"
    NIL "*" :class %flash.display:graphics-end-fill))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:net-filter-event "NetFilterEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) ("header" "flash.utils::ByteArray")
     ("data" "flash.utils::ByteArray")) "*" :class %flash.events:net-filter-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-triangle-path "GraphicsTrianglePath"
    (&OPTIONAL ("vertices" "__AS3__.vec::Vector.<Number>")
     ("indices" "__AS3__.vec::Vector.<int>")
     ("uvtData" "__AS3__.vec::Vector.<Number>") (("culling" "String") "none")) "*" :class %flash.display:graphics-triangle-path))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:gradient-type "GradientType"
    NIL "*" :class %flash.display:gradient-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:url-request-method "URLRequestMethod"
    NIL "*" :class %flash.net:url-request-method))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:object-input "ObjectInput"
    NIL "*" :class %flash.utils:object-input))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.accessibility:accessibility-implementation "AccessibilityImplementation"
    NIL "*" :class %flash.accessibility:accessibility-implementation))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:names "names"
    NIL "Array" :class %flash.media:camera))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:get-camera "getCamera"
    (&OPTIONAL ("name" "String")) "flash.media::Camera" :class %flash.media:camera))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:camera "Camera"
    NIL "*" :class %flash.media:camera))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:font-metrics "FontMetrics"
    (("emBox" "flash.geom::Rectangle") ("strikethroughOffset" "Number")
     ("strikethroughThickness" "Number") ("underlineOffset" "Number")
     ("underlineThickness" "Number") ("subscriptOffset" "Number")
     ("subscriptScale" "Number") ("superscriptOffset" "Number")
     ("superscriptScale" "Number")) "*" :class %flash.text.engine:font-metrics))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:avm1movie "AVM1Movie"
    NIL "*" :class %flash.display:avm1movie))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:displacement-map-filter-mode "DisplacementMapFilterMode"
    NIL "*" :class %flash.filters:displacement-map-filter-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:gradient-glow-filter "GradientGlowFilter"
    (&OPTIONAL (("distance" "Number") 4) (("angle" "Number") 45)
     ("colors" "Array") ("alphas" "Array") ("ratios" "Array")
     (("blurX" "Number") 4) (("blurY" "Number") 4) (("strength" "Number") 1)
     (("quality" "int") 1) (("type" "String") "inner")
     (("knockout" "Boolean") NIL)) "*" :class %flash.filters:gradient-glow-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:get-qualified-superclass-name "flash.utils:getQualifiedSuperclassName"
    ("value") "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:get-timer "flash.utils:getTimer"
    NIL "int"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:describe-type "flash.utils:describeType"
    ("value") "XML"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:get-definition-by-name "flash.utils:getDefinitionByName"
    (("name" "String")) "Object"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:unescape-multi-byte "flash.utils:unescapeMultiByte"
    (("value" "String")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash:trace "trace"
    NIL "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:get-qualified-class-name "flash.utils:getQualifiedClassName"
    ("value") "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.utils:escape-multi-byte "flash.utils:escapeMultiByte"
    (("value" "String")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:joint-style "JointStyle"
    NIL "*" :class %flash.display:joint-style))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:local-connection "LocalConnection"
    NIL "*" :class %flash.net:local-connection))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:font-weight "FontWeight"
    NIL "*" :class %flash.text.engine:font-weight))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:url-request "URLRequest"
    (&OPTIONAL ("url" "String")) "*" :class %flash.net:url-request))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:i-graphics-stroke "IGraphicsStroke"
    NIL "*" :class %flash.display:i-graphics-stroke))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-stroke "GraphicsStroke"
    (&OPTIONAL (("thickness" "Number") NAN) (("pixelHinting" "Boolean") NIL)
     (("scaleMode" "String") "normal") (("caps" "String") "none")
     (("joints" "String") "round") (("miterLimit" "Number") 3)
     ("fill" "flash.display::IGraphicsFill")) "*" :class %flash.display:graphics-stroke))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.xml:xml-tag "XMLTag"
    NIL "*" :class %flash.xml:xml-tag))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:io-error-event "IOErrorEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("text" "String") "")) "*" :class %flash.events:io-error-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:graphic-element "GraphicElement"
    (&OPTIONAL ("graphic" "flash.display::DisplayObject")
     (("elementWidth" "Number") 15) (("elementHeight" "Number") 15)
     ("elementFormat" "flash.text.engine::ElementFormat")
     ("eventMirror" "flash.events::EventDispatcher")
     (("textRotation" "String") "rotate0")) "*" :class %flash.text.engine:graphic-element))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.desktop:clipboard-formats "ClipboardFormats"
    NIL "*" :class %flash.desktop:clipboard-formats))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.desktop:clipboard-transfer-mode "ClipboardTransferMode"
    NIL "*" :class %flash.desktop:clipboard-transfer-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.desktop:general-clipboard "generalClipboard"
    NIL "flash.desktop::Clipboard" :class %flash.desktop:clipboard))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.desktop:clipboard "Clipboard"
    NIL "*" :class %flash.desktop:clipboard))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:break-opportunity "BreakOpportunity"
    NIL "*" :class %flash.text.engine:break-opportunity))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:gradient-bevel-filter "GradientBevelFilter"
    (&OPTIONAL (("distance" "Number") 4) (("angle" "Number") 45)
     ("colors" "Array") ("alphas" "Array") ("ratios" "Array")
     (("blurX" "Number") 4) (("blurY" "Number") 4) (("strength" "Number") 1)
     (("quality" "int") 1) (("type" "String") "inner")
     (("knockout" "Boolean") NIL)) "*" :class %flash.filters:gradient-bevel-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-path-command "GraphicsPathCommand"
    NIL "*" :class %flash.display:graphics-path-command))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:focus-event "FocusEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") T)
     (("cancelable" "Boolean") NIL)
     ("relatedObject" "flash.display::InteractiveObject")
     (("shiftKey" "Boolean") NIL) (("keyCode" "uint") 0)) "*" :class %flash.events:focus-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:interpolate "interpolate"
    (("thisMat" "flash.geom::Matrix3D") ("toMat" "flash.geom::Matrix3D")
     ("percent" "Number")) "flash.geom::Matrix3D" :class %flash.geom:matrix3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:matrix3d "Matrix3D"
    (&OPTIONAL ("v" "__AS3__.vec::Vector.<Number>")) "*" :class %flash.geom:matrix3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-rotation "TextRotation"
    NIL "*" :class %flash.text.engine:text-rotation))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:sample-data-event "SampleDataEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("theposition" "Number") 0)
     ("thedata" "flash.utils::ByteArray")) "*" :class %flash.events:sample-data-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:bitmap-data-channel "BitmapDataChannel"
    NIL "*" :class %flash.display:bitmap-data-channel))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:distance "distance"
    (("pt1" "flash.geom::Vector3D") ("pt2" "flash.geom::Vector3D")) "Number" :class %flash.geom:vector3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:angle-between "angleBetween"
    (("a" "flash.geom::Vector3D") ("b" "flash.geom::Vector3D")) "Number" :class %flash.geom:vector3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:vector3d "Vector3D"
    (&OPTIONAL (("x" "Number") 0) (("y" "Number") 0) (("z" "Number") 0)
     (("w" "Number") 0)) "*" :class %flash.geom:vector3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:interactive-object "InteractiveObject"
    NIL "*" :class %flash.display:interactive-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:context-menu "ContextMenu"
    NIL "*" :class %flash.ui:context-menu))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:kerning "Kerning"
    NIL "*" :class %flash.text.engine:kerning))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:get-loader-info-by-definition "getLoaderInfoByDefinition"
    (("object" "Object")) "flash.display::LoaderInfo" :class %flash.display:loader-info))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:loader-info "LoaderInfo"
    NIL "*" :class %flash.display:loader-info))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shape "Shape"
    NIL "*" :class %flash.display:shape))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:sync-event "SyncEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) ("changeList" "Array")) "*" :class %flash.events:sync-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:bevel-filter "BevelFilter"
    (&OPTIONAL (("distance" "Number") 4) (("angle" "Number") 45)
     (("highlightColor" "uint") 16777215) (("highlightAlpha" "Number") 1)
     (("shadowColor" "uint") 0) (("shadowAlpha" "Number") 1)
     (("blurX" "Number") 4) (("blurY" "Number") 4) (("strength" "Number") 1)
     (("quality" "int") 1) (("type" "String") "inner")
     (("knockout" "Boolean") NIL)) "*" :class %flash.filters:bevel-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:shader-filter "ShaderFilter"
    (&OPTIONAL ("shader" "flash.display::Shader")) "*" :class %flash.filters:shader-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:rectangle "Rectangle"
    (&OPTIONAL (("x" "Number") 0) (("y" "Number") 0) (("width" "Number") 0)
     (("height" "Number") 0)) "*" :class %flash.geom:rectangle))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:swf-version "SWFVersion"
    NIL "*" :class %flash.display:swf-version))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:responder "Responder"
    (("result" "Function") &OPTIONAL ("status" "Function")) "*" :class %flash.net:responder))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-tls "hasTLS"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-screen-broadcast "hasScreenBroadcast"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-ime "hasIME"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:max-level-id-c "maxLevelIDC"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-streaming-audio "hasStreamingAudio"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-printing "hasPrinting"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:screen-dpi "screenDPI"
    NIL "Number" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-accessibility "hasAccessibility"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-mp3 "hasMP3"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-embedded-video "hasEmbeddedVideo"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:manufacturer "manufacturer"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-video-encoder "hasVideoEncoder"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-audio "hasAudio"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:screen-color "screenColor"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:language "language"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-audio-encoder "hasAudioEncoder"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-screen-playback "hasScreenPlayback"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:internal "_internal"
    NIL "uint" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:os "os"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:version "version"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:screen-resolution-y "screenResolutionY"
    NIL "Number" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:av-hardware-disable "avHardwareDisable"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:pixel-aspect-ratio "pixelAspectRatio"
    NIL "Number" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:screen-resolution-x "screenResolutionX"
    NIL "Number" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:is-debugger "isDebugger"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:has-streaming-video "hasStreamingVideo"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:server-string "serverString"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:local-file-read-disable "localFileReadDisable"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:player-type "playerType"
    NIL "String" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:is-embedded-in-acrobat "isEmbeddedInAcrobat"
    NIL "Boolean" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:capabilities "Capabilities"
    NIL "*" :class %flash.system:capabilities))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:net-stream-info "NetStreamInfo"
    (("curBPS" "Number") ("byteCount" "Number") ("maxBPS" "Number")
     ("audioBPS" "Number") ("audioByteCount" "Number") ("videoBPS" "Number")
     ("videoByteCount" "Number") ("dataBPS" "Number")
     ("dataByteCount" "Number") ("playbackBPS" "Number")
     ("droppedFrames" "Number") ("audioBufferByteLength" "Number")
     ("videoBufferByteLength" "Number") ("dataBufferByteLength" "Number")
     ("audioBufferLength" "Number") ("videoBufferLength" "Number")
     ("dataBufferLength" "Number") ("srtt" "Number") ("audioLossRate" "Number")) "*" :class %flash.net:net-stream-info))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-element "TextElement"
    (&OPTIONAL ("text" "String")
     ("elementFormat" "flash.text.engine::ElementFormat")
     ("eventMirror" "flash.events::EventDispatcher")
     (("textRotation" "String") "rotate0")) "*" :class %flash.text.engine:text-element))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:i-dynamic-property-output "IDynamicPropertyOutput"
    NIL "*" :class %flash.net:i-dynamic-property-output))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:justification-style "JustificationStyle"
    NIL "*" :class %flash.text.engine:justification-style))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:stage-display-state "StageDisplayState"
    NIL "*" :class %flash.display:stage-display-state))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:product-manager "ProductManager"
    (("name" "String")) "*" :class %adobe.utils:product-manager))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:frame-label "FrameLabel"
    (("name" "String") ("frame" "int")) "*" :class %flash.display:frame-label))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:element-format "ElementFormat"
    (&OPTIONAL ("fontDescription" "flash.text.engine::FontDescription")
     (("fontSize" "Number") 12) (("color" "uint") 0) (("alpha" "Number") 1)
     (("textRotation" "String") "auto") (("dominantBaseline" "String") "roman")
     (("alignmentBaseline" "String") "useDominantBaseline")
     (("baselineShift" "Number") 0) (("kerning" "String") "on")
     (("trackingRight" "Number") 0) (("trackingLeft" "Number") 0)
     (("locale" "String") "en") (("breakOpportunity" "String") "auto")
     (("digitCase" "String") "default") (("digitWidth" "String") "default")
     (("ligatureLevel" "String") "common")
     (("typographicCase" "String") "default")) "*" :class %flash.text.engine:element-format))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shader-parameter "ShaderParameter"
    NIL "*" :class %flash.display:shader-parameter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shader-job "ShaderJob"
    (&OPTIONAL ("shader" "flash.display::Shader") ("target" "Object")
     (("width" "int") 0) (("height" "int") 0)) "*" :class %flash.display:shader-job))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:color-correction "ColorCorrection"
    NIL "*" :class %flash.display:color-correction))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-format-align "TextFormatAlign"
    NIL "*" :class %flash.text:text-format-align))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:dictionary "Dictionary"
    (&OPTIONAL (("weakKeys" "Boolean") NIL)) "*" :class %flash.utils:dictionary))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:default-object-encoding "defaultObjectEncoding"
    (("version" "uint")) "void" :class %flash.net:shared-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:get-disk-usage "getDiskUsage"
    (("url" "String")) "int" :class %flash.net:shared-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:default-object-encoding "defaultObjectEncoding"
    NIL "uint" :class %flash.net:shared-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:get-local "getLocal"
    (("name" "String") &OPTIONAL ("localPath" "String")
     (("secure" "Boolean") NIL)) "flash.net::SharedObject" :class %flash.net:shared-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:delete-all "deleteAll"
    (("url" "String")) "int" :class %flash.net:shared-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:get-remote "getRemote"
    (("name" "String") &OPTIONAL ("remotePath" "String")
     (("persistence" "Object") NIL) (("secure" "Boolean") NIL)) "flash.net::SharedObject" :class %flash.net:shared-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:shared-object "SharedObject"
    NIL "*" :class %flash.net:shared-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:socket "Socket"
    (&OPTIONAL ("host" "String") (("port" "int") 0)) "*" :class %flash.net:socket))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:color-matrix-filter "ColorMatrixFilter"
    (&OPTIONAL ("matrix" "Array")) "*" :class %flash.filters:color-matrix-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:bitmap-filter-type "BitmapFilterType"
    NIL "*" :class %flash.filters:bitmap-filter-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-color-type "TextColorType"
    NIL "*" :class %flash.text:text-color-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:displacement-map-filter "DisplacementMapFilter"
    (&OPTIONAL ("mapBitmap" "flash.display::BitmapData")
     ("mapPoint" "flash.geom::Point") (("componentX" "uint") 0)
     (("componentY" "uint") 0) (("scaleX" "Number") 0) (("scaleY" "Number") 0)
     (("mode" "String") "wrap") (("color" "uint") 0) (("alpha" "Number") 0)) "*" :class %flash.filters:displacement-map-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-path-winding "GraphicsPathWinding"
    NIL "*" :class %flash.display:graphics-path-winding))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:i-dynamic-property-writer "IDynamicPropertyWriter"
    NIL "*" :class %flash.net:i-dynamic-property-writer))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.external:add-callback "addCallback"
    (("functionName" "String") ("closure" "Function")) "void" :class %flash.external:external-interface))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.external:available "available"
    NIL "Boolean" :class %flash.external:external-interface))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.external:object-id "objectID"
    NIL "String" :class %flash.external:external-interface))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.external:call "call"
    (&REST ("functionName" "String")) "*" :class %flash.external:external-interface))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.external:external-interface "ExternalInterface"
    NIL "*" :class %flash.external:external-interface))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-run "TextRun"
    (("beginIndex" "int") ("endIndex" "int")
     ("textFormat" "flash.text::TextFormat")) "*" :class %flash.text:text-run))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shader "Shader"
    (&OPTIONAL ("code" "flash.utils::ByteArray")) "*" :class %flash.display:shader))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:video "Video"
    (&OPTIONAL (("width" "int") 320) (("height" "int") 240)) "*" :class %flash.media:video))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-format-display "TextFormatDisplay"
    NIL "*" :class %flash.text:text-format-display))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:id3info "ID3Info"
    NIL "*" :class %flash.media:id3info))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound-transform "SoundTransform"
    (&OPTIONAL (("vol" "Number") 1) (("panning" "Number") 0)) "*" :class %flash.media:sound-transform))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.trace:get-listener "getListener"
    NIL "Function" :class %flash.trace:trace))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.trace:get-level "getLevel"
    (&OPTIONAL (("target" "int") 2)) "int" :class %flash.trace:trace))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.trace:set-level "setLevel"
    (("l" "int") &OPTIONAL (("target" "int") 2)) "*" :class %flash.trace:trace))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.trace:set-listener "setListener"
    (("f" "Function")) "*" :class %flash.trace:trace))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.trace:trace "Trace"
    NIL "*" :class %flash.trace:trace))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-snapshot "TextSnapshot"
    NIL "*" :class %flash.text:text-snapshot))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:interpolation-method "InterpolationMethod"
    NIL "*" :class %flash.display:interpolation-method))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:context-menu-built-in-items "ContextMenuBuiltInItems"
    NIL "*" :class %flash.ui:context-menu-built-in-items))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-extent "TextExtent"
    (("width" "Number") ("height" "Number") ("textFieldWidth" "Number")
     ("textFieldHeight" "Number") ("ascent" "Number") ("descent" "Number")) "*" :class %flash.text:text-extent))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:cff-hinting "CFFHinting"
    NIL "*" :class %flash.text.engine:cff-hinting))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:current-domain "currentDomain"
    NIL "flash.system::SecurityDomain" :class %flash.system:security-domain))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:security-domain "SecurityDomain"
    NIL "*" :class %flash.system:security-domain))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:utc "UTC"
    ("year" &OPTIONAL ("month" 1) ("date" 0) ("hours" 0) ("minutes" 0)
     ("seconds" 0) &REST "ms") "Number" :class %flash:date))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:parse "parse"
    ("s") "Number" :class %flash:date))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash:date "Date"
    (&OPTIONAL "year" "month" "date" "hours" "minutes" "seconds" "ms") "*" :class %flash:date))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:dynamic-property-output "DynamicPropertyOutput"
    NIL "*" :class %flash.net:dynamic-property-output))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:blur-filter "BlurFilter"
    (&OPTIONAL (("blurX" "Number") 4) (("blurY" "Number") 4)
     (("quality" "int") 1)) "*" :class %flash.filters:blur-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-bitmap-fill "GraphicsBitmapFill"
    (&OPTIONAL ("bitmapData" "flash.display::BitmapData")
     ("matrix" "flash.geom::Matrix") (("repeat" "Boolean") T)
     (("smooth" "Boolean") NIL)) "*" :class %flash.display:graphics-bitmap-fill))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:status-event "StatusEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("code" "String") "")
     (("level" "String") "")) "*" :class %flash.events:status-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:orientation3d "Orientation3D"
    NIL "*" :class %flash.geom:orientation3d))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:color-transform "ColorTransform"
    (&OPTIONAL (("redMultiplier" "Number") 1) (("greenMultiplier" "Number") 1)
     (("blueMultiplier" "Number") 1) (("alphaMultiplier" "Number") 1)
     (("redOffset" "Number") 0) (("greenOffset" "Number") 0)
     (("blueOffset" "Number") 0) (("alphaOffset" "Number") 0)) "*" :class %flash.geom:color-transform))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:static-text "StaticText"
    NIL "*" :class %flash.text:static-text))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:install-actions "installActions"
    (("name" "String") ("data" "String")) "void" :class %adobe.utils:custom-actions))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:uninstall-actions "uninstallActions"
    (("name" "String")) "void" :class %adobe.utils:custom-actions))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:actions-list "actionsList"
    NIL "Array" :class %adobe.utils:custom-actions))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:get-actions "getActions"
    (("name" "String")) "String" :class %adobe.utils:custom-actions))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:custom-actions "CustomActions"
    NIL "*" :class %adobe.utils:custom-actions))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:url-stream "URLStream"
    NIL "*" :class %flash.net:url-stream))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:security-error-event "SecurityErrorEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("text" "String") "")) "*" :class %flash.events:security-error-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:ligature-level "LigatureLevel"
    NIL "*" :class %flash.text.engine:ligature-level))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:morph-shape "MorphShape"
    NIL "*" :class %flash.display:morph-shape))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:anti-alias-type "AntiAliasType"
    NIL "*" :class %flash.text:anti-alias-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:get-microphone "getMicrophone"
    (&OPTIONAL (("index" "int") -1)) "flash.media::Microphone" :class %flash.media:microphone))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:names "names"
    NIL "Array" :class %flash.media:microphone))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:microphone "Microphone"
    NIL "*" :class %flash.media:microphone))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:url-loader-data-format "URLLoaderDataFormat"
    NIL "*" :class %flash.net:url-loader-data-format))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound-channel "SoundChannel"
    NIL "*" :class %flash.media:sound-channel))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:progress-event "ProgressEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("bytesLoaded" "uint") 0)
     (("bytesTotal" "uint") 0)) "*" :class %flash.events:progress-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:context-menu-event "ContextMenuEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL)
     ("mouseTarget" "flash.display::InteractiveObject")
     ("contextMenuOwner" "flash.display::InteractiveObject")) "*" :class %flash.events:context-menu-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:is-font-compatible "isFontCompatible"
    (("fontName" "String") ("fontStyle" "String")) "Boolean" :class %flash.text:text-field))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-field "TextField"
    NIL "*" :class %flash.text:text-field))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.xml:xml-parser "XMLParser"
    NIL "*" :class %flash.xml:xml-parser))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:accept "accept"
    NIL "void" :class %adobe.utils:xml-ui))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:cancel "cancel"
    NIL "void" :class %adobe.utils:xml-ui))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:get-property "getProperty"
    (("name" "String")) "String" :class %adobe.utils:xml-ui))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:set-property "setProperty"
    (("name" "String") ("value" "String")) "void" :class %adobe.utils:xml-ui))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %adobe.utils:xml-ui "XMLUI"
    NIL "*" :class %adobe.utils:xml-ui))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:hide "hide"
    NIL "void" :class %flash.ui:mouse))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:cursor "cursor"
    (("value" "String")) "void" :class %flash.ui:mouse))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:show "show"
    NIL "void" :class %flash.ui:mouse))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:cursor "cursor"
    NIL "String" :class %flash.ui:mouse))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:mouse "Mouse"
    NIL "*" :class %flash.ui:mouse))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:activity-event "ActivityEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("activating" "Boolean") NIL)) "*" :class %flash.events:activity-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %adobe.utils:mmend-command "adobe.utils:MMEndCommand"
    (("endStatus" "Boolean") ("notifyString" "String")) "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %adobe.utils:mmexecute "adobe.utils:MMExecute"
    (("name" "String")) "String"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:set-composition-string "setCompositionString"
    (("composition" "String")) "void" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:enabled "enabled"
    NIL "Boolean" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:conversion-mode "conversionMode"
    (("mode" "String")) "void" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:construct-ok "constructOK"
    (("construct" "Boolean")) "void" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:do-conversion "doConversion"
    NIL "void" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:conversion-mode "conversionMode"
    NIL "String" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:enabled "enabled"
    (("enabled" "Boolean")) "void" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:ime "IME"
    NIL "*" :class %flash.system:ime))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:dynamic-property-writer "dynamicPropertyWriter"
    NIL "flash.net::IDynamicPropertyWriter" :class %flash.net:object-encoding))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:dynamic-property-writer "dynamicPropertyWriter"
    (("object" "flash.net::IDynamicPropertyWriter")) "void" :class %flash.net:object-encoding))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:object-encoding "ObjectEncoding"
    NIL "*" :class %flash.net:object-encoding))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:rendering-mode "RenderingMode"
    NIL "*" :class %flash.text.engine:rendering-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.printing:print-job-options "PrintJobOptions"
    (&OPTIONAL (("printAsBitmap" "Boolean") NIL)) "*" :class %flash.printing:print-job-options))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:mouse-cursor "MouseCursor"
    NIL "*" :class %flash.ui:mouse-cursor))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-line-creation-result "TextLineCreationResult"
    NIL "*" :class %flash.text.engine:text-line-creation-result))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:data-event "DataEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("data" "String") "")) "*" :class %flash.events:data-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:stage-quality "StageQuality"
    NIL "*" :class %flash.display:stage-quality))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:xml-socket "XMLSocket"
    (&OPTIONAL ("host" "String") (("port" "int") 0)) "void" :class %flash.net:xml-socket))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-block "TextBlock"
    (&OPTIONAL ("content" "flash.text.engine::ContentElement")
     ("tabStops" "__AS3__.vec::Vector.<flash.text.engine::TabStop>")
     ("textJustifier" "flash.text.engine::TextJustifier")
     (("lineRotation" "String") "rotate0") (("baselineZero" "String") "roman")
     (("bidiLevel" "int") 0) (("applyNonLinearFontScaling" "Boolean") T)
     ("baselineFontDescription" "flash.text.engine::FontDescription")
     (("baselineFontSize" "Number") 12)) "*" :class %flash.text.engine:text-block))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.accessibility:accessibility-properties "AccessibilityProperties"
    NIL "*" :class %flash.accessibility:accessibility-properties))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:font-posture "FontPosture"
    NIL "*" :class %flash.text.engine:font-posture))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-shader-fill "GraphicsShaderFill"
    (&OPTIONAL ("shader" "flash.display::Shader")
     ("matrix" "flash.geom::Matrix")) "*" :class %flash.display:graphics-shader-fill))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:url-loader "URLLoader"
    (&OPTIONAL ("request" "flash.net::URLRequest")) "*" :class %flash.net:url-loader))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:group-element "GroupElement"
    (&OPTIONAL
     ("elements" "__AS3__.vec::Vector.<flash.text.engine::ContentElement>")
     ("elementFormat" "flash.text.engine::ElementFormat")
     ("eventMirror" "flash.events::EventDispatcher")
     (("textRotation" "String") "rotate0")) "*" :class %flash.text.engine:group-element))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:default-object-encoding "defaultObjectEncoding"
    (("version" "uint")) "void" :class %flash.net:net-connection))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:default-object-encoding "defaultObjectEncoding"
    NIL "uint" :class %flash.net:net-connection))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:net-connection "NetConnection"
    NIL "*" :class %flash.net:net-connection))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:display-object-container "DisplayObjectContainer"
    NIL "*" :class %flash.display:display-object-container))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:sprite "Sprite"
    NIL "*" :class %flash.display:sprite))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:movie-clip "MovieClip"
    NIL "*" :class %flash.display:movie-clip))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:net-status-event "NetStatusEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) ("info" "Object")) "*" :class %flash.events:net-status-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:grid-fit-type "GridFitType"
    NIL "*" :class %flash.text:grid-fit-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:caps-style "CapsStyle"
    NIL "*" :class %flash.display:caps-style))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:file-filter "FileFilter"
    (("description" "String") ("extension" "String") &OPTIONAL
     ("macType" "String")) "*" :class %flash.net:file-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:font-lookup "FontLookup"
    NIL "*" :class %flash.text.engine:font-lookup))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:url-request-header "URLRequestHeader"
    (&OPTIONAL (("name" "String") "") (("value" "String") "")) "*" :class %flash.net:url-request-header))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-display-mode "TextDisplayMode"
    NIL "*" :class %flash.text:text-display-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:csm-settings "CSMSettings"
    (("fontSize" "Number") ("insideCutoff" "Number") ("outsideCutoff" "Number")) "*" :class %flash.text:csm-settings))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:endian "Endian"
    NIL "*" :class %flash.utils:endian))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:font-type "FontType"
    NIL "*" :class %flash.text:font-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:simple-button "SimpleButton"
    (&OPTIONAL ("upState" "flash.display::DisplayObject")
     ("overState" "flash.display::DisplayObject")
     ("downState" "flash.display::DisplayObject")
     ("hitTestState" "flash.display::DisplayObject")) "*" :class %flash.display:simple-button))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:proxy "Proxy"
    NIL "*" :class %flash.utils:proxy))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:security-panel "SecurityPanel"
    NIL "*" :class %flash.system:security-panel))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:glow-filter "GlowFilter"
    (&OPTIONAL (("color" "uint") 16711680) (("alpha" "Number") 1)
     (("blurX" "Number") 6) (("blurY" "Number") 6) (("strength" "Number") 2)
     (("quality" "int") 1) (("inner" "Boolean") NIL)
     (("knockout" "Boolean") NIL)) "*" :class %flash.filters:glow-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-find-prop-strict %flash.debugger:enter-debugger "flash.debugger:enterDebugger"
    NIL "void"))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:url-variables "URLVariables"
    (&OPTIONAL ("source" "String")) "*" :class %flash.net:url-variables))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:full-screen-event "FullScreenEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("fullScreen" "Boolean") NIL)) "*" :class %flash.events:full-screen-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:net-stream-play-transitions "NetStreamPlayTransitions"
    NIL "*" :class %flash.net:net-stream-play-transitions))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:digit-case "DigitCase"
    NIL "*" :class %flash.text.engine:digit-case))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound-loader-context "SoundLoaderContext"
    (&OPTIONAL (("bufferTime" "Number") 1000)
     (("checkPolicyFile" "Boolean") NIL)) "*" :class %flash.media:sound-loader-context))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:file-reference-list "FileReferenceList"
    NIL "*" :class %flash.net:file-reference-list))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:shader-event "ShaderEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) ("bitmap" "flash.display::BitmapData")
     ("array" "flash.utils::ByteArray")
     ("vector" "__AS3__.vec::Vector.<Number>")) "*" :class %flash.events:shader-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-line-mirror-region "TextLineMirrorRegion"
    NIL "*" :class %flash.text.engine:text-line-mirror-region))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:bitmap-filter-quality "BitmapFilterQuality"
    NIL "*" :class %flash.filters:bitmap-filter-quality))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-format "TextFormat"
    (&OPTIONAL ("font" "String") ("size" "Object") ("color" "Object")
     ("bold" "Object") ("italic" "Object") ("underline" "Object")
     ("url" "String") ("target" "String") ("align" "String")
     ("leftMargin" "Object") ("rightMargin" "Object") ("indent" "Object")
     ("leading" "Object")) "*" :class %flash.text:text-format))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics "Graphics"
    NIL "*" :class %flash.display:graphics))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:timer-event "TimerEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL)) "*" :class %flash.events:timer-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:object-output "ObjectOutput"
    NIL "*" :class %flash.utils:object-output))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.utils:i-externalizable "IExternalizable"
    NIL "*" :class %flash.utils:i-externalizable))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound "Sound"
    (&OPTIONAL ("stream" "flash.net::URLRequest")
     ("context" "flash.media::SoundLoaderContext")) "*" :class %flash.media:sound))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:style-sheet "StyleSheet"
    NIL "*" :class %flash.text:style-sheet))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:line-justification "LineJustification"
    NIL "*" :class %flash.text.engine:line-justification))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-line-validity "TextLineValidity"
    NIL "*" :class %flash.text.engine:text-line-validity))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:loader "Loader"
    NIL "*" :class %flash.display:loader))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:blend-mode "BlendMode"
    NIL "*" :class %flash.display:blend-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:interpolate "interpolate"
    (("pt1" "flash.geom::Point") ("pt2" "flash.geom::Point") ("f" "Number")) "flash.geom::Point" :class %flash.geom:point))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:distance "distance"
    (("pt1" "flash.geom::Point") ("pt2" "flash.geom::Point")) "Number" :class %flash.geom:point))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:polar "polar"
    (("len" "Number") ("angle" "Number")) "flash.geom::Point" :class %flash.geom:point))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:point "Point"
    (&OPTIONAL (("x" "Number") 0) (("y" "Number") 0)) "*" :class %flash.geom:point))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:loader-context "LoaderContext"
    (&OPTIONAL (("checkPolicyFile" "Boolean") NIL)
     ("applicationDomain" "flash.system::ApplicationDomain")
     ("securityDomain" "flash.system::SecurityDomain")) "*" :class %flash.system:loader-context))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:jpeg-loader-context "JPEGLoaderContext"
    (&OPTIONAL (("deblockingFilter" "Number") 0)
     (("checkPolicyFile" "Boolean") NIL)
     ("applicationDomain" "flash.system::ApplicationDomain")
     ("securityDomain" "flash.system::SecurityDomain")) "*" :class %flash.system:jpeg-loader-context))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:mouse-event "MouseEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") T)
     (("cancelable" "Boolean") NIL) ("localX" "Number") ("localY" "Number")
     ("relatedObject" "flash.display::InteractiveObject")
     (("ctrlKey" "Boolean") NIL) (("altKey" "Boolean") NIL)
     (("shiftKey" "Boolean") NIL) (("buttonDown" "Boolean") NIL)
     (("delta" "int") 0)) "*" :class %flash.events:mouse-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:enumerate-fonts "enumerateFonts"
    (&OPTIONAL (("enumerateDeviceFonts" "Boolean") NIL)) "Array" :class %flash.text:font))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:register-font "registerFont"
    (("font" "Class")) "void" :class %flash.text:font))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:font "Font"
    NIL "*" :class %flash.text:font))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-baseline "TextBaseline"
    NIL "*" :class %flash.text.engine:text-baseline))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:stage "Stage"
    NIL "*" :class %flash.display:stage))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:graphics-solid-fill "GraphicsSolidFill"
    (&OPTIONAL (("color" "uint") 0) (("alpha" "Number") 1)) "*" :class %flash.display:graphics-solid-fill))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:transform "Transform"
    (("displayObject" "flash.display::DisplayObject")) "*" :class %flash.geom:transform))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:context-menu-clipboard-items "ContextMenuClipboardItems"
    NIL "*" :class %flash.ui:context-menu-clipboard-items))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:show-settings "showSettings"
    (&OPTIONAL (("panel" "String") "default")) "void" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:sandbox-type "sandboxType"
    NIL "String" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:exact-settings "exactSettings"
    NIL "Boolean" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:exact-settings "exactSettings"
    (("value" "Boolean")) "void" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:allow-domain "allowDomain"
    NIL "void" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:allow-insecure-domain "allowInsecureDomain"
    NIL "void" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:load-policy-file "loadPolicyFile"
    (("url" "String")) "void" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:disable-avm1loading "disableAVM1Loading"
    (("value" "Boolean")) "void" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:disable-avm1loading "disableAVM1Loading"
    NIL "Boolean" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.system:security "Security"
    NIL "*" :class %flash.system:security))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:keyboard-event "KeyboardEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") T)
     (("cancelable" "Boolean") NIL) (("charCode" "uint") 0)
     (("keyCode" "uint") 0) (("keyLocation" "uint") 0)
     (("ctrlKey" "Boolean") NIL) (("altKey" "Boolean") NIL)
     (("shiftKey" "Boolean") NIL)) "*" :class %flash.events:keyboard-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:spread-method "SpreadMethod"
    NIL "*" :class %flash.display:spread-method))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shader-input "ShaderInput"
    NIL "*" :class %flash.display:shader-input))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:shader-parameter-type "ShaderParameterType"
    NIL "*" :class %flash.display:shader-parameter-type))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:event-phase "EventPhase"
    NIL "*" :class %flash.events:event-phase))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:text-line "TextLine"
    NIL "*" :class %flash.text.engine:text-line))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:pixel-snapping "PixelSnapping"
    NIL "*" :class %flash.display:pixel-snapping))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-line-metrics "TextLineMetrics"
    (("x" "Number") ("width" "Number") ("height" "Number") ("ascent" "Number")
     ("descent" "Number") ("leading" "Number")) "*" :class %flash.text:text-line-metrics))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:file-reference "FileReference"
    NIL "*" :class %flash.net:file-reference))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:stage-scale-mode "StageScaleMode"
    NIL "*" :class %flash.display:stage-scale-mode))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:shared-object-flush-status "SharedObjectFlushStatus"
    NIL "*" :class %flash.net:shared-object-flush-status))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text:text-field-auto-size "TextFieldAutoSize"
    NIL "*" :class %flash.text:text-field-auto-size))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.printing:print-job-orientation "PrintJobOrientation"
    NIL "*" :class %flash.printing:print-job-orientation))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.events:http-status-event "HTTPStatusEvent"
    (("type" "String") &OPTIONAL (("bubbles" "Boolean") NIL)
     (("cancelable" "Boolean") NIL) (("status" "int") 0)) "*" :class %flash.events:http-status-event))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.filters:convolution-filter "ConvolutionFilter"
    (&OPTIONAL (("matrixX" "Number") 0) (("matrixY" "Number") 0)
     ("matrix" "Array") (("divisor" "Number") 1) (("bias" "Number") 0)
     (("preserveAlpha" "Boolean") T) (("clamp" "Boolean") T)
     (("color" "uint") 0) (("alpha" "Number") 0)) "*" :class %flash.filters:convolution-filter))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.ui:key-location "KeyLocation"
    NIL "*" :class %flash.ui:key-location))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.accessibility:send-event "sendEvent"
    (("source" "flash.display::DisplayObject") ("childID" "uint")
     ("eventType" "uint") &OPTIONAL (("nonHTML" "Boolean") NIL)) "void" :class %flash.accessibility:accessibility))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.accessibility:update-properties "updateProperties"
    NIL "void" :class %flash.accessibility:accessibility))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.accessibility:active "active"
    NIL "Boolean" :class %flash.accessibility:accessibility))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.accessibility:accessibility "Accessibility"
    NIL "*" :class %flash.accessibility:accessibility))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.geom:perspective-projection "PerspectiveProjection"
    NIL "*" :class %flash.geom:perspective-projection))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:action-script-version "ActionScriptVersion"
    NIL "*" :class %flash.display:action-script-version))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.net:net-stream-play-options "NetStreamPlayOptions"
    NIL "*" :class %flash.net:net-stream-play-options))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.media:sound-codec "SoundCodec"
    NIL "*" :class %flash.media:sound-codec))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.display:triangle-culling "TriangleCulling"
    NIL "*" :class %flash.display:triangle-culling))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %flash.text.engine:digit-width "DigitWidth"
    NIL "*" :class %flash.text.engine:digit-width))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %authoring:off-screen-surface-rendering-enabled "offScreenSurfaceRenderingEnabled"
    (("value" "Boolean")) "void" :class %authoring:auth-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %authoring:off-screen-surface-rendering-enabled "offScreenSurfaceRenderingEnabled"
    NIL "Boolean" :class %authoring:auth-object))

(let ((*symbol-table* *player-symbol-table*))
  (swf-ffi-defun-lex %authoring:auth-object "authObject"
    (("key" "uint")) "*" :class %authoring:auth-object))

(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:object ()
    :swf-name "Object"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ((%flash:is-prototype-of :swf-name "isPrototypeOf" :return-type "Boolean"
        :args (&OPTIONAL "V"))
     (%flash:property-is-enumerable :swf-name "propertyIsEnumerable" :return-type "Boolean"
        :args (&OPTIONAL "V"))
     (%flash:has-own-property :swf-name "hasOwnProperty" :return-type "Boolean"
        :args (&OPTIONAL "V")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:class (%flash:object)
    :swf-name "Class"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ((%flash:prototype :swf-name "prototype" :type "*" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:function (%flash:object)
    :swf-name "Function"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ((%flash:length :swf-name "length" :type "int" :static NIL)
     (%flash:prototype :swf-name "prototype" :type "*" :static NIL)
     (%flash:prototype :swf-name "prototype" :type "*" :static NIL))
    :methods
    ((%flash:apply :swf-name "apply" :return-type "*"
        :args (&OPTIONAL "thisArg" "argArray"))
     (%flash:call :swf-name "call" :return-type "*"
        :args (&REST "thisArg")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:namespace (%flash:object)
    :swf-name "Namespace"
    :constants
    ((%flash:+length+ :swf-name "length" :type "null" :value 2))
    :properties
    ((%flash:uri :swf-name "uri" :type "String" :static NIL)
     (%flash:prefix :swf-name "prefix" :type "*" :static NIL))
    :methods
    ((%flash:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash:value-of :swf-name "valueOf" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:boolean (%flash:object)
    :swf-name "Boolean"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ((%flash:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash:value-of :swf-name "valueOf" :return-type "Boolean"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:number (%flash:object)
    :swf-name "Number"
    :constants
    ((%flash:+nan+ :swf-name "NaN" :type "Number" :value NAN)
     (%flash:+max-value+ :swf-name "MAX_VALUE" :type "Number" :value 1.79769313486231d308)
     (%flash:+negative-infinity+ :swf-name "NEGATIVE_INFINITY" :type "Number" :value -INFINITY)
     (%flash:+positive-infinity+ :swf-name "POSITIVE_INFINITY" :type "Number" :value INFINITY)
     (%flash:+length+ :swf-name "length" :type "int" :value 1)
     (%flash:+min-value+ :swf-name "MIN_VALUE" :type "Number" :value 4.9406564584124654d-324))
    :properties
    ()
    :methods
    ((%flash:to-string :swf-name "toString" :return-type "String"
        :args (&OPTIONAL ("radix" 10)))
     (%flash:to-exponential :swf-name "toExponential" :return-type "String"
        :args (&OPTIONAL ("p" 0)))
     (%flash:to-fixed :swf-name "toFixed" :return-type "String"
        :args (&OPTIONAL ("p" 0)))
     (%flash:value-of :swf-name "valueOf" :return-type "Number"
        :args NIL)
     (%flash:to-precision :swf-name "toPrecision" :return-type "String"
        :args (&OPTIONAL ("p" 0))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:int (%flash:object)
    :swf-name "int"
    :constants
    ((%flash:+max-value+ :swf-name "MAX_VALUE" :type "int" :value 2147483647)
     (%flash:+length+ :swf-name "length" :type "int" :value 1)
     (%flash:+min-value+ :swf-name "MIN_VALUE" :type "int" :value -2147483648))
    :properties
    ()
    :methods
    ((%flash:to-string :swf-name "toString" :return-type "String"
        :args (&OPTIONAL ("radix" 10)))
     (%flash:to-exponential :swf-name "toExponential" :return-type "String"
        :args (&OPTIONAL ("p" 0)))
     (%flash:to-fixed :swf-name "toFixed" :return-type "String"
        :args (&OPTIONAL ("p" 0)))
     (%flash:value-of :swf-name "valueOf" :return-type "int"
        :args NIL)
     (%flash:to-precision :swf-name "toPrecision" :return-type "String"
        :args (&OPTIONAL ("p" 0))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:uint (%flash:object)
    :swf-name "uint"
    :constants
    ((%flash:+max-value+ :swf-name "MAX_VALUE" :type "uint" :value 4294967295)
     (%flash:+length+ :swf-name "length" :type "int" :value 1)
     (%flash:+min-value+ :swf-name "MIN_VALUE" :type "uint" :value 0))
    :properties
    ()
    :methods
    ((%flash:to-string :swf-name "toString" :return-type "String"
        :args (&OPTIONAL ("radix" 10)))
     (%flash:to-exponential :swf-name "toExponential" :return-type "String"
        :args (&OPTIONAL ("p" 0)))
     (%flash:to-fixed :swf-name "toFixed" :return-type "String"
        :args (&OPTIONAL ("p" 0)))
     (%flash:value-of :swf-name "valueOf" :return-type "uint"
        :args NIL)
     (%flash:to-precision :swf-name "toPrecision" :return-type "String"
        :args (&OPTIONAL ("p" 0))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:string (%flash:object)
    :swf-name "String"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ((%flash:length :swf-name "length" :type "int" :static NIL))
    :methods
    ((%flash:to-locale-upper-case :swf-name "toLocaleUpperCase" :return-type "String"
        :args NIL)
     (%flash:to-upper-case :swf-name "toUpperCase" :return-type "String"
        :args NIL)
     (%flash:char-code-at :swf-name "charCodeAt" :return-type "Number"
        :args (&OPTIONAL (("i" "Number") 0)))
     (%flash:replace :swf-name "replace" :return-type "String"
        :args (&OPTIONAL "p" "repl"))
     (%flash:substr :swf-name "substr" :return-type "String"
        :args (&OPTIONAL (("start" "Number") 0) (("len" "Number") 2147483647)))
     (%flash:value-of :swf-name "valueOf" :return-type "String"
        :args NIL)
     (%flash:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash:locale-compare :swf-name "localeCompare" :return-type "int"
        :args (&OPTIONAL ("other" "String")))
     (%flash:char-at :swf-name "charAt" :return-type "String"
        :args (&OPTIONAL (("i" "Number") 0)))
     (%flash:search :swf-name "search" :return-type "int"
        :args (&OPTIONAL "p"))
     (%flash:to-locale-lower-case :swf-name "toLocaleLowerCase" :return-type "String"
        :args NIL)
     (%flash:concat :swf-name "concat" :return-type "String"
        :args NIL)
     (%flash:split :swf-name "split" :return-type "Array"
        :args (&OPTIONAL "delim" ("limit" 4294967295)))
     (%flash:to-lower-case :swf-name "toLowerCase" :return-type "String"
        :args NIL)
     (%flash:last-index-of :swf-name "lastIndexOf" :return-type "int"
        :args (&OPTIONAL (("s" "String") "undefined")
               (("i" "Number") 2147483647)))
     (%flash:slice :swf-name "slice" :return-type "String"
        :args (&OPTIONAL (("start" "Number") 0) (("end" "Number") 2147483647)))
     (%flash:substring :swf-name "substring" :return-type "String"
        :args (&OPTIONAL (("start" "Number") 0) (("end" "Number") 2147483647)))
     (%flash:index-of :swf-name "indexOf" :return-type "int"
        :args (&OPTIONAL (("s" "String") "undefined") (("i" "Number") 0)))
     (%flash:match :swf-name "match" :return-type "Array"
        :args (&OPTIONAL "p")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:array (%flash:object)
    :swf-name "Array"
    :constants
    ((%flash:+descending+ :swf-name "DESCENDING" :type "uint" :value 2)
     (%flash:+return-indexed-array+ :swf-name "RETURNINDEXEDARRAY" :type "uint" :value 8)
     (%flash:+unique-sort+ :swf-name "UNIQUESORT" :type "uint" :value 4)
     (%flash:+numeric+ :swf-name "NUMERIC" :type "uint" :value 16)
     (%flash:+length+ :swf-name "length" :type "int" :value 1)
     (%flash:+case-insensitive+ :swf-name "CASEINSENSITIVE" :type "uint" :value 1))
    :properties
    ((%flash:length :swf-name "length" :type "*" :static NIL)
     (%flash:length :swf-name "length" :type "uint" :static NIL))
    :methods
    ((%flash:sort :swf-name "sort" :return-type "*"
        :args NIL)
     (%flash:sort-on :swf-name "sortOn" :return-type "*"
        :args (&OPTIONAL ("names" 0) &REST "options"))
     (%flash:splice :swf-name "splice" :return-type "*"
        :args NIL)
     (%flash:every :swf-name "every" :return-type "Boolean"
        :args (("callback" "Function") &OPTIONAL "thisObject"))
     (%flash:push :swf-name "push" :return-type "uint"
        :args NIL)
     (%flash:for-each :swf-name "forEach" :return-type "void"
        :args (("callback" "Function") &OPTIONAL "thisObject"))
     (%flash:filter :swf-name "filter" :return-type "Array"
        :args (("callback" "Function") &OPTIONAL "thisObject"))
     (%flash:some :swf-name "some" :return-type "Boolean"
        :args (("callback" "Function") &OPTIONAL "thisObject"))
     (%flash:concat :swf-name "concat" :return-type "Array"
        :args NIL)
     (%flash:slice :swf-name "slice" :return-type "Array"
        :args (&OPTIONAL ("A" 0) ("B" 4294967295)))
     (%flash:pop :swf-name "pop" :return-type "*"
        :args NIL)
     (%flash:index-of :swf-name "indexOf" :return-type "int"
        :args ("searchElement" &OPTIONAL ("fromIndex" 0)))
     (%flash:last-index-of :swf-name "lastIndexOf" :return-type "int"
        :args ("searchElement" &OPTIONAL ("fromIndex" 2147483647)))
     (%flash:join :swf-name "join" :return-type "String"
        :args (&OPTIONAL "sep"))
     (%flash:unshift :swf-name "unshift" :return-type "uint"
        :args NIL)
     (%flash:shift :swf-name "shift" :return-type "*"
        :args NIL)
     (%flash:map :swf-name "map" :return-type "Array"
        :args (("callback" "Function") &OPTIONAL "thisObject"))
     (%flash:reverse :swf-name "reverse" :return-type "Array"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %__AS3__.vec:vector (%flash:object)
    :swf-name "__AS3__.vec::Vector"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %__AS3__.vec:vector$object (%flash:object)
    :swf-name "__AS3__.vec::Vector$object"
    :constants
    ()
    :properties
    ((%__AS3__.vec:fixed :swf-name "fixed" :type "*" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "uint" :static NIL)
     (%__AS3__.vec:fixed :swf-name "fixed" :type "Boolean" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "*" :static NIL))
    :methods
    ((%__AS3__.vec:filter :swf-name "filter" :return-type "internal::__AS3__.vec::Vector$object"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:splice :swf-name "splice" :return-type "internal::__AS3__.vec::Vector$object"
        :args (("start" "Number") &REST ("deleteCount" "Number")))
     (%__AS3__.vec:some :swf-name "some" :return-type "Boolean"
        :args ("checker" &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:for-each :swf-name "forEach" :return-type "void"
        :args (("eacher" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:to-locale-string :swf-name "toLocaleString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:last-index-of :swf-name "lastIndexOf" :return-type "Number"
        :args (("value" "Object") &OPTIONAL (("from" "Number") 2147483647)))
     (%__AS3__.vec:join :swf-name "join" :return-type "String"
        :args (&OPTIONAL (("separator" "String") ",")))
     (%__AS3__.vec:shift :swf-name "shift" :return-type "*"
        :args NIL)
     (%__AS3__.vec:sort :swf-name "sort" :return-type "internal::__AS3__.vec::Vector$object"
        :args ("comparefn"))
     (%__AS3__.vec:map :swf-name "map" :return-type "*"
        :args (("mapper" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:every :swf-name "every" :return-type "Boolean"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:push :swf-name "push" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:concat :swf-name "concat" :return-type "internal::__AS3__.vec::Vector$object"
        :args NIL)
     (%__AS3__.vec:slice :swf-name "slice" :return-type "internal::__AS3__.vec::Vector$object"
        :args (&OPTIONAL (("start" "Number") 0) (("end" "Number") 2147483647)))
     (%__AS3__.vec:pop :swf-name "pop" :return-type "*"
        :args NIL)
     (%__AS3__.vec:index-of :swf-name "indexOf" :return-type "Number"
        :args (("value" "Object") &OPTIONAL (("from" "Number") 0)))
     (%__AS3__.vec:unshift :swf-name "unshift" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:reverse :swf-name "reverse" :return-type "internal::__AS3__.vec::Vector$object"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %__AS3__.vec:vector$int (%flash:object)
    :swf-name "__AS3__.vec::Vector$int"
    :constants
    ()
    :properties
    ((%__AS3__.vec:fixed :swf-name "fixed" :type "Boolean" :static NIL)
     (%__AS3__.vec:fixed :swf-name "fixed" :type "*" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "uint" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "*" :static NIL))
    :methods
    ((%__AS3__.vec:splice :swf-name "splice" :return-type "internal::__AS3__.vec::Vector$int"
        :args (("start" "Number") &REST ("deleteCount" "Number")))
     (%__AS3__.vec:filter :swf-name "filter" :return-type "internal::__AS3__.vec::Vector$int"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:join :swf-name "join" :return-type "String"
        :args (&OPTIONAL (("separator" "String") ",")))
     (%__AS3__.vec:to-locale-string :swf-name "toLocaleString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:last-index-of :swf-name "lastIndexOf" :return-type "Number"
        :args (("value" "int") &OPTIONAL (("from" "Number") 2147483647)))
     (%__AS3__.vec:for-each :swf-name "forEach" :return-type "void"
        :args (("eacher" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:sort :swf-name "sort" :return-type "internal::__AS3__.vec::Vector$int"
        :args ("comparefn"))
     (%__AS3__.vec:map :swf-name "map" :return-type "*"
        :args (("mapper" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:every :swf-name "every" :return-type "Boolean"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:push :swf-name "push" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:some :swf-name "some" :return-type "Boolean"
        :args ("checker" &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:concat :swf-name "concat" :return-type "internal::__AS3__.vec::Vector$int"
        :args NIL)
     (%__AS3__.vec:slice :swf-name "slice" :return-type "internal::__AS3__.vec::Vector$int"
        :args (&OPTIONAL (("start" "Number") 0) (("end" "Number") 2147483647)))
     (%__AS3__.vec:pop :swf-name "pop" :return-type "int"
        :args NIL)
     (%__AS3__.vec:index-of :swf-name "indexOf" :return-type "Number"
        :args (("value" "int") &OPTIONAL (("from" "Number") 0)))
     (%__AS3__.vec:unshift :swf-name "unshift" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:reverse :swf-name "reverse" :return-type "internal::__AS3__.vec::Vector$int"
        :args NIL)
     (%__AS3__.vec:shift :swf-name "shift" :return-type "int"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %__AS3__.vec:vector$uint (%flash:object)
    :swf-name "__AS3__.vec::Vector$uint"
    :constants
    ()
    :properties
    ((%__AS3__.vec:fixed :swf-name "fixed" :type "Boolean" :static NIL)
     (%__AS3__.vec:fixed :swf-name "fixed" :type "*" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "uint" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "*" :static NIL))
    :methods
    ((%__AS3__.vec:splice :swf-name "splice" :return-type "internal::__AS3__.vec::Vector$uint"
        :args (("start" "Number") &REST ("deleteCount" "Number")))
     (%__AS3__.vec:filter :swf-name "filter" :return-type "internal::__AS3__.vec::Vector$uint"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:join :swf-name "join" :return-type "String"
        :args (&OPTIONAL (("separator" "String") ",")))
     (%__AS3__.vec:to-locale-string :swf-name "toLocaleString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:last-index-of :swf-name "lastIndexOf" :return-type "Number"
        :args (("value" "uint") &OPTIONAL (("from" "Number") 2147483647)))
     (%__AS3__.vec:for-each :swf-name "forEach" :return-type "void"
        :args (("eacher" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:sort :swf-name "sort" :return-type "internal::__AS3__.vec::Vector$uint"
        :args ("comparefn"))
     (%__AS3__.vec:map :swf-name "map" :return-type "*"
        :args (("mapper" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:every :swf-name "every" :return-type "Boolean"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:push :swf-name "push" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:some :swf-name "some" :return-type "Boolean"
        :args ("checker" &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:concat :swf-name "concat" :return-type "internal::__AS3__.vec::Vector$uint"
        :args NIL)
     (%__AS3__.vec:slice :swf-name "slice" :return-type "internal::__AS3__.vec::Vector$uint"
        :args (&OPTIONAL (("start" "Number") 0) (("end" "Number") 2147483647)))
     (%__AS3__.vec:pop :swf-name "pop" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:index-of :swf-name "indexOf" :return-type "Number"
        :args (("value" "uint") &OPTIONAL (("from" "Number") 0)))
     (%__AS3__.vec:unshift :swf-name "unshift" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:reverse :swf-name "reverse" :return-type "internal::__AS3__.vec::Vector$uint"
        :args NIL)
     (%__AS3__.vec:shift :swf-name "shift" :return-type "uint"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %__AS3__.vec:vector$double (%flash:object)
    :swf-name "__AS3__.vec::Vector$double"
    :constants
    ()
    :properties
    ((%__AS3__.vec:fixed :swf-name "fixed" :type "Boolean" :static NIL)
     (%__AS3__.vec:fixed :swf-name "fixed" :type "*" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "uint" :static NIL)
     (%__AS3__.vec:length :swf-name "length" :type "*" :static NIL))
    :methods
    ((%__AS3__.vec:splice :swf-name "splice" :return-type "internal::__AS3__.vec::Vector$double"
        :args (("start" "Number") &REST ("deleteCount" "Number")))
     (%__AS3__.vec:filter :swf-name "filter" :return-type "internal::__AS3__.vec::Vector$double"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:join :swf-name "join" :return-type "String"
        :args (&OPTIONAL (("separator" "String") ",")))
     (%__AS3__.vec:to-locale-string :swf-name "toLocaleString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%__AS3__.vec:last-index-of :swf-name "lastIndexOf" :return-type "Number"
        :args (("value" "Number") &OPTIONAL (("from" "Number") 2147483647)))
     (%__AS3__.vec:for-each :swf-name "forEach" :return-type "void"
        :args (("eacher" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:sort :swf-name "sort" :return-type "internal::__AS3__.vec::Vector$double"
        :args ("comparefn"))
     (%__AS3__.vec:map :swf-name "map" :return-type "*"
        :args (("mapper" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:every :swf-name "every" :return-type "Boolean"
        :args (("checker" "Function") &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:push :swf-name "push" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:some :swf-name "some" :return-type "Boolean"
        :args ("checker" &OPTIONAL ("thisObj" "Object")))
     (%__AS3__.vec:concat :swf-name "concat" :return-type "internal::__AS3__.vec::Vector$double"
        :args NIL)
     (%__AS3__.vec:slice :swf-name "slice" :return-type "internal::__AS3__.vec::Vector$double"
        :args (&OPTIONAL (("start" "Number") 0) (("end" "Number") 2147483647)))
     (%__AS3__.vec:pop :swf-name "pop" :return-type "Number"
        :args NIL)
     (%__AS3__.vec:index-of :swf-name "indexOf" :return-type "Number"
        :args (("value" "Number") &OPTIONAL (("from" "Number") 0)))
     (%__AS3__.vec:unshift :swf-name "unshift" :return-type "uint"
        :args NIL)
     (%__AS3__.vec:reverse :swf-name "reverse" :return-type "internal::__AS3__.vec::Vector$double"
        :args NIL)
     (%__AS3__.vec:shift :swf-name "shift" :return-type "Number"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %builtin.as$0:method-closure (%flash:function)
    :swf-name "builtin.as$0::MethodClosure"
    :constants
    ()
    :properties
    ((%builtin.as$0:length :swf-name "length" :type "int" :static NIL)
     (%builtin.as$0:prototype :swf-name "prototype" :type "*" :static NIL)
     (%builtin.as$0:prototype :swf-name "prototype" :type "*" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:system (%flash:object)
    :swf-name "flash.system::System"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.sampler:stack-frame (%flash:object)
    :swf-name "flash.sampler::StackFrame"
    :constants
    ((%flash.sampler:+file+ :swf-name "file" :type "String" :value NIL)
     (%flash.sampler:+name+ :swf-name "name" :type "String" :value NIL)
     (%flash.sampler:+line+ :swf-name "line" :type "uint" :value NIL))
    :properties
    ()
    :methods
    ((%flash.sampler:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.sampler:sample (%flash:object)
    :swf-name "flash.sampler::Sample"
    :constants
    ((%flash.sampler:+time+ :swf-name "time" :type "Number" :value NIL)
     (%flash.sampler:+stack+ :swf-name "stack" :type "Array" :value NIL))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.sampler:new-object-sample (%flash.sampler:sample)
    :swf-name "flash.sampler::NewObjectSample"
    :constants
    ((%flash.sampler:+id+ :swf-name "id" :type "Number" :value NIL)
     (%flash.sampler:+type+ :swf-name "type" :type "Class" :value NIL))
    :properties
    ((%flash.sampler:object :swf-name "object" :type "*" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.sampler:delete-object-sample (%flash.sampler:sample)
    :swf-name "flash.sampler::DeleteObjectSample"
    :constants
    ((%flash.sampler:+id+ :swf-name "id" :type "Number" :value NIL)
     (%flash.sampler:+size+ :swf-name "size" :type "Number" :value NIL))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:event (%flash:object)
    :swf-name "flash.events::Event"
    :constants
    ((%flash.events:+select+ :swf-name "SELECT" :type "String" :value "select")
     (%flash.events:+activate+ :swf-name "ACTIVATE" :type "String" :value "activate")
     (%flash.events:+id3+ :swf-name "ID3" :type "String" :value "id3")
     (%flash.events:+copy+ :swf-name "COPY" :type "String" :value "copy")
     (%flash.events:+deactivate+ :swf-name "DEACTIVATE" :type "String" :value "deactivate")
     (%flash.events:+paste+ :swf-name "PASTE" :type "String" :value "paste")
     (%flash.events:+tab-index-change+ :swf-name "TAB_INDEX_CHANGE" :type "String" :value "tabIndexChange")
     (%flash.events:+exit-frame+ :swf-name "EXIT_FRAME" :type "String" :value "exitFrame")
     (%flash.events:+removed-from-stage+ :swf-name "REMOVED_FROM_STAGE" :type "String" :value "removedFromStage")
     (%flash.events:+added+ :swf-name "ADDED" :type "String" :value "added")
     (%flash.events:+mouse-leave+ :swf-name "MOUSE_LEAVE" :type "String" :value "mouseLeave")
     (%flash.events:+close+ :swf-name "CLOSE" :type "String" :value "close")
     (%flash.events:+open+ :swf-name "OPEN" :type "String" :value "open")
     (%flash.events:+scroll+ :swf-name "SCROLL" :type "String" :value "scroll")
     (%flash.events:+connect+ :swf-name "CONNECT" :type "String" :value "connect")
     (%flash.events:+removed+ :swf-name "REMOVED" :type "String" :value "removed")
     (%flash.events:+select-all+ :swf-name "SELECT_ALL" :type "String" :value "selectAll")
     (%flash.events:+fullscreen+ :swf-name "FULLSCREEN" :type "String" :value "fullScreen")
     (%flash.events:+complete+ :swf-name "COMPLETE" :type "String" :value "complete")
     (%flash.events:+resize+ :swf-name "RESIZE" :type "String" :value "resize")
     (%flash.events:+change+ :swf-name "CHANGE" :type "String" :value "change")
     (%flash.events:+clear+ :swf-name "CLEAR" :type "String" :value "clear")
     (%flash.events:+cut+ :swf-name "CUT" :type "String" :value "cut")
     (%flash.events:+tab-children-change+ :swf-name "TAB_CHILDREN_CHANGE" :type "String" :value "tabChildrenChange")
     (%flash.events:+frame-constructed+ :swf-name "FRAME_CONSTRUCTED" :type "String" :value "frameConstructed")
     (%flash.events:+added-to-stage+ :swf-name "ADDED_TO_STAGE" :type "String" :value "addedToStage")
     (%flash.events:+tab-enabled-change+ :swf-name "TAB_ENABLED_CHANGE" :type "String" :value "tabEnabledChange")
     (%flash.events:+render+ :swf-name "RENDER" :type "String" :value "render")
     (%flash.events:+init+ :swf-name "INIT" :type "String" :value "init")
     (%flash.events:+unload+ :swf-name "UNLOAD" :type "String" :value "unload")
     (%flash.events:+sound-complete+ :swf-name "SOUND_COMPLETE" :type "String" :value "soundComplete")
     (%flash.events:+enter-frame+ :swf-name "ENTER_FRAME" :type "String" :value "enterFrame")
     (%flash.events:+cancel+ :swf-name "CANCEL" :type "String" :value "cancel"))
    :properties
    ((%flash.events:type :swf-name "type" :type "String" :static NIL)
     (%flash.events:current-target :swf-name "currentTarget" :type "Object" :static NIL)
     (%flash.events:cancelable :swf-name "cancelable" :type "Boolean" :static NIL)
     (%flash.events:target :swf-name "target" :type "Object" :static NIL)
     (%flash.events:bubbles :swf-name "bubbles" :type "Boolean" :static NIL)
     (%flash.events:event-phase :swf-name "eventPhase" :type "uint" :static NIL))
    :methods
    ((%flash.events:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type "void"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.events:stop-propagation :swf-name "stopPropagation" :return-type "void"
        :args NIL)
     (%flash.events:prevent-default :swf-name "preventDefault" :return-type "void"
        :args NIL)
     (%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:format-to-string :swf-name "formatToString" :return-type "String"
        :args (&REST ("className" "String")))
     (%flash.events:is-default-prevented :swf-name "isDefaultPrevented" :return-type "Boolean"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:text-event (%flash.events:event)
    :swf-name "flash.events::TextEvent"
    :constants
    ((%flash.events:+link+ :swf-name "LINK" :type "String" :value "link")
     (%flash.events:+text-input+ :swf-name "TEXT_INPUT" :type "String" :value "textInput"))
    :properties
    ((%flash.events:text :swf-name "text" :type "void" :static NIL)
     (%flash.events:text :swf-name "text" :type "String" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:error-event (%flash.events:text-event)
    :swf-name "flash.events::ErrorEvent"
    :constants
    ((%flash.events:+error+ :swf-name "ERROR" :type "String" :value "error"))
    :properties
    ()
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:async-error-event (%flash.events:error-event)
    :swf-name "flash.events::AsyncErrorEvent"
    :constants
    ((%flash.events:+async-error+ :swf-name "ASYNC_ERROR" :type "String" :value "asyncError"))
    :properties
    ((%flash.events:error :swf-name "error" :type "Error" :value NIL :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:i-data-output ()
    :swf-name "flash.utils::IDataOutput"
    :constants
    ()
    :properties
    ((%flash.utils:endian :swf-name "endian" :type "void" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.utils:endian :swf-name "endian" :type "String" :static NIL))
    :methods
    ((%flash.utils:write-object :swf-name "writeObject" :return-type "void"
        :args ("object"))
     (%flash.utils:write-float :swf-name "writeFloat" :return-type "void"
        :args (("value" "Number")))
     (%flash.utils:write-unsigned-int :swf-name "writeUnsignedInt" :return-type "void"
        :args (("value" "uint")))
     (%flash.utils:write-double :swf-name "writeDouble" :return-type "void"
        :args (("value" "Number")))
     (%flash.utils:write-int :swf-name "writeInt" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:write-bytes :swf-name "writeBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.utils:write-boolean :swf-name "writeBoolean" :return-type "void"
        :args (("value" "Boolean")))
     (%flash.utils:write-utf :swf-name "writeUTF" :return-type "void"
        :args (("value" "String")))
     (%flash.utils:write-byte :swf-name "writeByte" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:write-short :swf-name "writeShort" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:write-utf-bytes :swf-name "writeUTFBytes" :return-type "void"
        :args (("value" "String")))
     (%flash.utils:write-multi-byte :swf-name "writeMultiByte" :return-type "void"
        :args (("value" "String") ("charSet" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:i-data-input ()
    :swf-name "flash.utils::IDataInput"
    :constants
    ()
    :properties
    ((%flash.utils:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.utils:endian :swf-name "endian" :type "String" :static NIL)
     (%flash.utils:endian :swf-name "endian" :type "void" :static NIL)
     (%flash.utils:bytes-available :swf-name "bytesAvailable" :type "uint" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL))
    :methods
    ((%flash.utils:read-byte :swf-name "readByte" :return-type "int"
        :args NIL)
     (%flash.utils:read-object :swf-name "readObject" :return-type "*"
        :args NIL)
     (%flash.utils:read-utf-bytes :swf-name "readUTFBytes" :return-type "String"
        :args (("length" "uint")))
     (%flash.utils:read-int :swf-name "readInt" :return-type "int"
        :args NIL)
     (%flash.utils:read-utf :swf-name "readUTF" :return-type "String"
        :args NIL)
     (%flash.utils:read-bytes :swf-name "readBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.utils:read-unsigned-byte :swf-name "readUnsignedByte" :return-type "uint"
        :args NIL)
     (%flash.utils:read-boolean :swf-name "readBoolean" :return-type "Boolean"
        :args NIL)
     (%flash.utils:read-unsigned-short :swf-name "readUnsignedShort" :return-type "uint"
        :args NIL)
     (%flash.utils:read-float :swf-name "readFloat" :return-type "Number"
        :args NIL)
     (%flash.utils:read-multi-byte :swf-name "readMultiByte" :return-type "String"
        :args (("length" "uint") ("charSet" "String")))
     (%flash.utils:read-double :swf-name "readDouble" :return-type "Number"
        :args NIL)
     (%flash.utils:read-short :swf-name "readShort" :return-type "int"
        :args NIL)
     (%flash.utils:read-unsigned-int :swf-name "readUnsignedInt" :return-type "uint"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:byte-array (%flash:object)
    :swf-name "flash.utils::ByteArray"
    :constants
    ()
    :properties
    ((%flash.utils:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.utils:length :swf-name "length" :type "void" :static NIL)
     (%flash.utils:length :swf-name "length" :type "uint" :static NIL)
     (%flash.utils:position :swf-name "position" :type "void" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.utils:endian :swf-name "endian" :type "void" :static NIL)
     (%flash.utils:position :swf-name "position" :type "uint" :static NIL)
     (%flash.utils:bytes-available :swf-name "bytesAvailable" :type "uint" :static NIL)
     (%flash.utils:endian :swf-name "endian" :type "String" :static NIL))
    :methods
    ((%flash.utils:write-object :swf-name "writeObject" :return-type "void"
        :args ("object"))
     (%flash.utils:read-bytes :swf-name "readBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.utils:uncompress :swf-name "uncompress" :return-type "void"
        :args NIL)
     (%flash.utils:read-multi-byte :swf-name "readMultiByte" :return-type "String"
        :args (("length" "uint") ("charSet" "String")))
     (%flash.utils:read-int :swf-name "readInt" :return-type "int"
        :args NIL)
     (%flash.utils:read-float :swf-name "readFloat" :return-type "Number"
        :args NIL)
     (%flash.utils:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.utils:compress :swf-name "compress" :return-type "void"
        :args NIL)
     (%flash.utils:write-short :swf-name "writeShort" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:write-unsigned-int :swf-name "writeUnsignedInt" :return-type "void"
        :args (("value" "uint")))
     (%flash.utils:read-unsigned-byte :swf-name "readUnsignedByte" :return-type "uint"
        :args NIL)
     (%flash.utils:write-boolean :swf-name "writeBoolean" :return-type "void"
        :args (("value" "Boolean")))
     (%flash.utils:write-utf :swf-name "writeUTF" :return-type "void"
        :args (("value" "String")))
     (%flash.utils:clear :swf-name "clear" :return-type "void"
        :args NIL)
     (%flash.utils:write-bytes :swf-name "writeBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.utils:read-byte :swf-name "readByte" :return-type "int"
        :args NIL)
     (%flash.utils:read-unsigned-int :swf-name "readUnsignedInt" :return-type "uint"
        :args NIL)
     (%flash.utils:write-multi-byte :swf-name "writeMultiByte" :return-type "void"
        :args (("value" "String") ("charSet" "String")))
     (%flash.utils:write-float :swf-name "writeFloat" :return-type "void"
        :args (("value" "Number")))
     (%flash.utils:read-utf-bytes :swf-name "readUTFBytes" :return-type "String"
        :args (("length" "uint")))
     (%flash.utils:read-utf :swf-name "readUTF" :return-type "String"
        :args NIL)
     (%flash.utils:inflate :swf-name "inflate" :return-type "void"
        :args NIL)
     (%flash.utils:read-boolean :swf-name "readBoolean" :return-type "Boolean"
        :args NIL)
     (%flash.utils:deflate :swf-name "deflate" :return-type "void"
        :args NIL)
     (%flash.utils:read-object :swf-name "readObject" :return-type "*"
        :args NIL)
     (%flash.utils:write-int :swf-name "writeInt" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:read-double :swf-name "readDouble" :return-type "Number"
        :args NIL)
     (%flash.utils:read-unsigned-short :swf-name "readUnsignedShort" :return-type "uint"
        :args NIL)
     (%flash.utils:write-double :swf-name "writeDouble" :return-type "void"
        :args (("value" "Number")))
     (%flash.utils:write-byte :swf-name "writeByte" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:read-short :swf-name "readShort" :return-type "int"
        :args NIL)
     (%flash.utils:write-utf-bytes :swf-name "writeUTFBytes" :return-type "void"
        :args (("value" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:error (%flash:object)
    :swf-name "Error"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ((%flash:name :swf-name "name" :type "null" :value NIL :static NIL)
     (%flash:message :swf-name "message" :type "null" :value NIL :static NIL)
     (%flash:error-id :swf-name "errorID" :type "int" :static NIL))
    :methods
    ((%flash:get-stack-trace :swf-name "getStackTrace" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:definition-error (%flash:error)
    :swf-name "DefinitionError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:eval-error (%flash:error)
    :swf-name "EvalError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:range-error (%flash:error)
    :swf-name "RangeError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:reference-error (%flash:error)
    :swf-name "ReferenceError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:security-error (%flash:error)
    :swf-name "SecurityError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:syntax-error (%flash:error)
    :swf-name "SyntaxError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:type-error (%flash:error)
    :swf-name "TypeError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:uri-error (%flash:error)
    :swf-name "URIError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:verify-error (%flash:error)
    :swf-name "VerifyError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:uninitialized-error (%flash:error)
    :swf-name "UninitializedError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:argument-error (%flash:error)
    :swf-name "ArgumentError"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shader-precision (%flash:object)
    :swf-name "flash.display::ShaderPrecision"
    :constants
    ((%flash.display:+full+ :swf-name "FULL" :type "String" :value "full")
     (%flash.display:+fast+ :swf-name "FAST" :type "String" :value "fast"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:math (%flash:object)
    :swf-name "Math"
    :constants
    ((%flash:+pi+ :swf-name "PI" :type "Number" :value 3.141592653589793d0)
     (%flash:+log2e+ :swf-name "LOG2E" :type "Number" :value 1.4426950408889634d0)
     (%flash:+ln2+ :swf-name "LN2" :type "Number" :value 0.6931471805599453d0)
     (%flash:+log10e+ :swf-name "LOG10E" :type "Number" :value 0.4342944819032518d0)
     (%flash:+ln10+ :swf-name "LN10" :type "Number" :value 2.302585092994046d0)
     (%flash:+sqrt2+ :swf-name "SQRT2" :type "Number" :value 1.4142135623730951d0)
     (%flash:+sqrt-1/2+ :swf-name "SQRT1_2" :type "Number" :value 0.7071067811865476d0)
     (%flash:+e+ :swf-name "E" :type "Number" :value 2.718281828459045d0))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:reg-exp (%flash:object)
    :swf-name "RegExp"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 1))
    :properties
    ((%flash:dotall :swf-name "dotall" :type "Boolean" :static NIL)
     (%flash:multiline :swf-name "multiline" :type "Boolean" :static NIL)
     (%flash:last-index :swf-name "lastIndex" :type "int" :static NIL)
     (%flash:source :swf-name "source" :type "String" :static NIL)
     (%flash:extended :swf-name "extended" :type "Boolean" :static NIL)
     (%flash:last-index :swf-name "lastIndex" :type "*" :static NIL)
     (%flash:global :swf-name "global" :type "Boolean" :static NIL)
     (%flash:ignore-case :swf-name "ignoreCase" :type "Boolean" :static NIL))
    :methods
    ((%flash:test :swf-name "test" :return-type "Boolean"
        :args (&OPTIONAL (("s" "String") "")))
     (%flash:exec :swf-name "exec" :return-type "*"
        :args (&OPTIONAL (("s" "String") ""))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:i-event-dispatcher ()
    :swf-name "flash.events::IEventDispatcher"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.events:add-event-listener :swf-name "addEventListener" :return-type "void"
        :args (("type" "String") ("listener" "Function") &OPTIONAL
               (("useCapture" "Boolean") NIL) (("priority" "int") 0)
               (("useWeakReference" "Boolean") NIL)))
     (%flash.events:remove-event-listener :swf-name "removeEventListener" :return-type "void"
        :args (("type" "String") ("listener" "Function") &OPTIONAL
               (("useCapture" "Boolean") NIL)))
     (%flash.events:will-trigger :swf-name "willTrigger" :return-type "Boolean"
        :args (("type" "String")))
     (%flash.events:has-event-listener :swf-name "hasEventListener" :return-type "Boolean"
        :args (("type" "String")))
     (%flash.events:dispatch-event :swf-name "dispatchEvent" :return-type "Boolean"
        :args (("event" "flash.events::Event"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:weak-method-closure (%flash:object)
    :swf-name "flash.events::WeakMethodClosure"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:weak-function-closure (%flash:object)
    :swf-name "flash.events::WeakFunctionClosure"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:event-dispatcher (%flash:object)
    :swf-name "flash.events::EventDispatcher"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.events:add-event-listener :swf-name "addEventListener" :return-type "void"
        :args (("type" "String") ("listener" "Function") &OPTIONAL
               (("useCapture" "Boolean") NIL) (("priority" "int") 0)
               (("useWeakReference" "Boolean") NIL)))
     (%flash.events:has-event-listener :swf-name "hasEventListener" :return-type "Boolean"
        :args (("type" "String")))
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.events:remove-event-listener :swf-name "removeEventListener" :return-type "void"
        :args (("type" "String") ("listener" "Function") &OPTIONAL
               (("useCapture" "Boolean") NIL)))
     (%flash.events:will-trigger :swf-name "willTrigger" :return-type "Boolean"
        :args (("type" "String")))
     (%flash.events:dispatch-event :swf-name "dispatchEvent" :return-type "Boolean"
        :args (("event" "flash.events::Event"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:context-menu-item (%flash.events:event-dispatcher)
    :swf-name "flash.ui::ContextMenuItem"
    :constants
    ()
    :properties
    ((%flash.ui:caption :swf-name "caption" :type "void" :static NIL)
     (%flash.ui:visible :swf-name "visible" :type "void" :static NIL)
     (%flash.ui:visible :swf-name "visible" :type "Boolean" :static NIL)
     (%flash.ui:separator-before :swf-name "separatorBefore" :type "void" :static NIL)
     (%flash.ui:caption :swf-name "caption" :type "String" :static NIL)
     (%flash.ui:separator-before :swf-name "separatorBefore" :type "Boolean" :static NIL)
     (%flash.ui:enabled :swf-name "enabled" :type "void" :static NIL)
     (%flash.ui:enabled :swf-name "enabled" :type "Boolean" :static NIL))
    :methods
    ((%flash.ui:clone :swf-name "clone" :return-type "flash.ui::ContextMenuItem"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:application-domain (%flash:object)
    :swf-name "flash.system::ApplicationDomain"
    :constants
    ()
    :properties
    ((%flash.system:parent-domain :swf-name "parentDomain" :type "flash.system::ApplicationDomain" :static NIL)
     (%flash.system:domain-memory :swf-name "domainMemory" :type "*" :static NIL)
     (%flash.system:domain-memory :swf-name "domainMemory" :type "flash.utils::ByteArray" :static NIL))
    :methods
    ((%flash.system:has-definition :swf-name "hasDefinition" :return-type "Boolean"
        :args (("name" "String")))
     (%flash.system:get-definition :swf-name "getDefinition" :return-type "Object"
        :args (("name" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:content-element (%flash:object)
    :swf-name "flash.text.engine::ContentElement"
    :constants
    ((%flash.text.engine:+graphic-element+ :swf-name "GRAPHIC_ELEMENT" :type "uint" :value 65007))
    :properties
    ((%flash.text.engine:group-element :swf-name "groupElement" :type "flash.text.engine::GroupElement" :static NIL)
     (%flash.text.engine:raw-text :swf-name "rawText" :type "String" :static NIL)
     (%flash.text.engine:event-mirror :swf-name "eventMirror" :type "flash.events::EventDispatcher" :static NIL)
     (%flash.text.engine:text-rotation :swf-name "textRotation" :type "void" :static NIL)
     (%flash.text.engine:user-data :swf-name "userData" :type "null" :value NIL :static NIL)
     (%flash.text.engine:element-format :swf-name "elementFormat" :type "flash.text.engine::ElementFormat" :static NIL)
     (%flash.text.engine:event-mirror :swf-name "eventMirror" :type "void" :static NIL)
     (%flash.text.engine:text :swf-name "text" :type "String" :static NIL)
     (%flash.text.engine:text-rotation :swf-name "textRotation" :type "String" :static NIL)
     (%flash.text.engine:text-block-begin-index :swf-name "textBlockBeginIndex" :type "int" :static NIL)
     (%flash.text.engine:element-format :swf-name "elementFormat" :type "void" :static NIL)
     (%flash.text.engine:text-block :swf-name "textBlock" :type "flash.text.engine::TextBlock" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:scene (%flash:object)
    :swf-name "flash.display::Scene"
    :constants
    ()
    :properties
    ((%flash.display:labels :swf-name "labels" :type "Array" :static NIL)
     (%flash.display:name :swf-name "name" :type "String" :static NIL)
     (%flash.display:num-frames :swf-name "numFrames" :type "int" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.printing:print-job (%flash.events:event-dispatcher)
    :swf-name "flash.printing::PrintJob"
    :constants
    ()
    :properties
    ((%flash.printing:paper-width :swf-name "paperWidth" :type "int" :static NIL)
     (%flash.printing:page-width :swf-name "pageWidth" :type "int" :static NIL)
     (%flash.printing:page-height :swf-name "pageHeight" :type "int" :static NIL)
     (%flash.printing:paper-height :swf-name "paperHeight" :type "int" :static NIL)
     (%flash.printing:orientation :swf-name "orientation" :type "String" :static NIL))
    :methods
    ((%flash.printing:send :swf-name "send" :return-type "void"
        :args NIL)
     (%flash.printing:add-page :swf-name "addPage" :return-type "void"
        :args (("sprite" "flash.display::Sprite") &OPTIONAL
               ("printArea" "flash.geom::Rectangle")
               ("options" "flash.printing::PrintJobOptions")
               (("frameNum" "int") 0)))
     (%flash.printing:start :swf-name "start" :return-type "Boolean"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:i-graphics-path ()
    :swf-name "flash.display::IGraphicsPath"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:i-graphics-data ()
    :swf-name "flash.display::IGraphicsData"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-path (%flash:object)
    :swf-name "flash.display::GraphicsPath"
    :constants
    ()
    :properties
    ((%flash.display:winding :swf-name "winding" :type "String" :static NIL)
     (%flash.display:data :swf-name "data" :type "__AS3__.vec::Vector.<Number>" :value NIL :static NIL)
     (%flash.display:commands :swf-name "commands" :type "__AS3__.vec::Vector.<int>" :value NIL :static NIL)
     (%flash.display:winding :swf-name "winding" :type "*" :static NIL))
    :methods
    ((%flash.display:wide-move-to :swf-name "wideMoveTo" :return-type "void"
        :args (("x" "Number") ("y" "Number")))
     (%flash.display:curve-to :swf-name "curveTo" :return-type "void"
        :args (("controlX" "Number") ("controlY" "Number") ("anchorX" "Number")
               ("anchorY" "Number")))
     (%flash.display:line-to :swf-name "lineTo" :return-type "void"
        :args (("x" "Number") ("y" "Number")))
     (%flash.display:move-to :swf-name "moveTo" :return-type "void"
        :args (("x" "Number") ("y" "Number")))
     (%flash.display:wide-line-to :swf-name "wideLineTo" :return-type "void"
        :args (("x" "Number") ("y" "Number"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:matrix (%flash:object)
    :swf-name "flash.geom::Matrix"
    :constants
    ()
    :properties
    ((%flash.geom:tx :swf-name "tx" :type "Number" :value NIL :static NIL)
     (%flash.geom:d :swf-name "d" :type "Number" :value NIL :static NIL)
     (%flash.geom:b :swf-name "b" :type "Number" :value NIL :static NIL)
     (%flash.geom:ty :swf-name "ty" :type "Number" :value NIL :static NIL)
     (%flash.geom:c :swf-name "c" :type "Number" :value NIL :static NIL)
     (%flash.geom:a :swf-name "a" :type "Number" :value NIL :static NIL))
    :methods
    ((%flash.geom:create-gradient-box :swf-name "createGradientBox" :return-type "void"
        :args (("width" "Number") ("height" "Number") &OPTIONAL
               (("rotation" "Number") 0) (("tx" "Number") 0)
               (("ty" "Number") 0)))
     (%flash.geom:identity :swf-name "identity" :return-type "void"
        :args NIL)
     (%flash.geom:clone :swf-name "clone" :return-type "flash.geom::Matrix"
        :args NIL)
     (%flash.geom:delta-transform-point :swf-name "deltaTransformPoint" :return-type "flash.geom::Point"
        :args (("point" "flash.geom::Point")))
     (%flash.geom:rotate :swf-name "rotate" :return-type "void"
        :args (("angle" "Number")))
     (%flash.geom:transform-point :swf-name "transformPoint" :return-type "flash.geom::Point"
        :args (("point" "flash.geom::Point")))
     (%flash.geom:invert :swf-name "invert" :return-type "void"
        :args NIL)
     (%flash.geom:concat :swf-name "concat" :return-type "void"
        :args (("m" "flash.geom::Matrix")))
     (%flash.geom:scale :swf-name "scale" :return-type "void"
        :args (("sx" "Number") ("sy" "Number")))
     (%flash.geom:translate :swf-name "translate" :return-type "void"
        :args (("dx" "Number") ("dy" "Number")))
     (%flash.geom:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.geom:create-box :swf-name "createBox" :return-type "void"
        :args (("scaleX" "Number") ("scaleY" "Number") &OPTIONAL
               (("rotation" "Number") 0) (("tx" "Number") 0)
               (("ty" "Number") 0))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-justifier (%flash:object)
    :swf-name "flash.text.engine::TextJustifier"
    :constants
    ()
    :properties
    ((%flash.text.engine:line-justification :swf-name "lineJustification" :type "String" :static NIL)
     (%flash.text.engine:locale :swf-name "locale" :type "String" :static NIL)
     (%flash.text.engine:line-justification :swf-name "lineJustification" :type "void" :static NIL))
    :methods
    ((%flash.text.engine:clone :swf-name "clone" :return-type "flash.text.engine::TextJustifier"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:space-justifier (%flash.text.engine:text-justifier)
    :swf-name "flash.text.engine::SpaceJustifier"
    :constants
    ()
    :properties
    ((%flash.text.engine:letter-spacing :swf-name "letterSpacing" :type "Boolean" :static NIL)
     (%flash.text.engine:letter-spacing :swf-name "letterSpacing" :type "void" :static NIL))
    :methods
    ((%flash.text.engine:clone :swf-name "clone" :return-type "flash.text.engine::TextJustifier"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:i-bitmap-drawable ()
    :swf-name "flash.display::IBitmapDrawable"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:display-object (%flash.events:event-dispatcher)
    :swf-name "flash.display::DisplayObject"
    :constants
    ()
    :properties
    ((%flash.display:stage :swf-name "stage" :type "flash.display::Stage" :static NIL)
     (%flash.display:rotation :swf-name "rotation" :type "void" :static NIL)
     (%flash.display:filters :swf-name "filters" :type "Array" :static NIL)
     (%flash.display:z :swf-name "z" :type "Number" :static NIL)
     (%flash.display:y :swf-name "y" :type "Number" :static NIL)
     (%flash.display:x :swf-name "x" :type "Number" :static NIL)
     (%flash.display:filters :swf-name "filters" :type "void" :static NIL)
     (%flash.display:z :swf-name "z" :type "void" :static NIL)
     (%flash.display:transform :swf-name "transform" :type "flash.geom::Transform" :static NIL)
     (%flash.display:y :swf-name "y" :type "void" :static NIL)
     (%flash.display:x :swf-name "x" :type "void" :static NIL)
     (%flash.display:mask :swf-name "mask" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:opaque-background :swf-name "opaqueBackground" :type "void" :static NIL)
     (%flash.display:visible :swf-name "visible" :type "void" :static NIL)
     (%flash.display:root :swf-name "root" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:loader-info :swf-name "loaderInfo" :type "flash.display::LoaderInfo" :static NIL)
     (%flash.display:transform :swf-name "transform" :type "void" :static NIL)
     (%flash.display:alpha :swf-name "alpha" :type "Number" :static NIL)
     (%flash.display:mask :swf-name "mask" :type "void" :static NIL)
     (%flash.display:height :swf-name "height" :type "void" :static NIL)
     (%flash.display:mouse-y :swf-name "mouseY" :type "Number" :static NIL)
     (%flash.display:mouse-x :swf-name "mouseX" :type "Number" :static NIL)
     (%flash.display:scroll-rect :swf-name "scrollRect" :type "flash.geom::Rectangle" :static NIL)
     (%flash.display:scale-z :swf-name "scaleZ" :type "Number" :static NIL)
     (%flash.display:scale-y :swf-name "scaleY" :type "Number" :static NIL)
     (%flash.display:scale-x :swf-name "scaleX" :type "Number" :static NIL)
     (%flash.display:cache-as-bitmap :swf-name "cacheAsBitmap" :type "void" :static NIL)
     (%flash.display:width :swf-name "width" :type "Number" :static NIL)
     (%flash.display:accessibility-properties :swf-name "accessibilityProperties" :type "void" :static NIL)
     (%flash.display:alpha :swf-name "alpha" :type "void" :static NIL)
     (%flash.display:rotation-z :swf-name "rotationZ" :type "void" :static NIL)
     (%flash.display:rotation-y :swf-name "rotationY" :type "void" :static NIL)
     (%flash.display:rotation-x :swf-name "rotationX" :type "void" :static NIL)
     (%flash.display:cache-as-bitmap :swf-name "cacheAsBitmap" :type "Boolean" :static NIL)
     (%flash.display:parent :swf-name "parent" :type "flash.display::DisplayObjectContainer" :static NIL)
     (%flash.display:opaque-background :swf-name "opaqueBackground" :type "Object" :static NIL)
     (%flash.display:blend-shader :swf-name "blendShader" :type "void" :static NIL)
     (%flash.display:scale-9-grid :swf-name "scale9Grid" :type "void" :static NIL)
     (%flash.display:blend-mode :swf-name "blendMode" :type "void" :static NIL)
     (%flash.display:height :swf-name "height" :type "Number" :static NIL)
     (%flash.display:rotation-z :swf-name "rotationZ" :type "Number" :static NIL)
     (%flash.display:scroll-rect :swf-name "scrollRect" :type "void" :static NIL)
     (%flash.display:accessibility-properties :swf-name "accessibilityProperties" :type "flash.accessibility::AccessibilityProperties" :static NIL)
     (%flash.display:scale-z :swf-name "scaleZ" :type "void" :static NIL)
     (%flash.display:scale-y :swf-name "scaleY" :type "void" :static NIL)
     (%flash.display:scale-x :swf-name "scaleX" :type "void" :static NIL)
     (%flash.display:rotation-y :swf-name "rotationY" :type "Number" :static NIL)
     (%flash.display:rotation-x :swf-name "rotationX" :type "Number" :static NIL)
     (%flash.display:name :swf-name "name" :type "void" :static NIL)
     (%flash.display:scale-9-grid :swf-name "scale9Grid" :type "flash.geom::Rectangle" :static NIL)
     (%flash.display:blend-mode :swf-name "blendMode" :type "String" :static NIL)
     (%flash.display:width :swf-name "width" :type "void" :static NIL)
     (%flash.display:name :swf-name "name" :type "String" :static NIL)
     (%flash.display:rotation :swf-name "rotation" :type "Number" :static NIL)
     (%flash.display:visible :swf-name "visible" :type "Boolean" :static NIL))
    :methods
    ((%flash.display:hit-test-object :swf-name "hitTestObject" :return-type "Boolean"
        :args (("obj" "flash.display::DisplayObject")))
     (%flash.display:get-rect :swf-name "getRect" :return-type "flash.geom::Rectangle"
        :args (("targetCoordinateSpace" "flash.display::DisplayObject")))
     (%flash.display:hit-test-point :swf-name "hitTestPoint" :return-type "Boolean"
        :args (("x" "Number") ("y" "Number") &OPTIONAL
               (("shapeFlag" "Boolean") NIL)))
     (%flash.display:global-to-local3d :swf-name "globalToLocal3D" :return-type "flash.geom::Vector3D"
        :args (("point" "flash.geom::Point")))
     (%flash.display:local3d-to-global :swf-name "local3DToGlobal" :return-type "flash.geom::Point"
        :args (("point3d" "flash.geom::Vector3D")))
     (%flash.display:get-bounds :swf-name "getBounds" :return-type "flash.geom::Rectangle"
        :args (("targetCoordinateSpace" "flash.display::DisplayObject")))
     (%flash.display:global-to-local :swf-name "globalToLocal" :return-type "flash.geom::Point"
        :args (("point" "flash.geom::Point")))
     (%flash.display:local-to-global :swf-name "localToGlobal" :return-type "flash.geom::Point"
        :args (("point" "flash.geom::Point"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:bitmap (%flash.display:display-object)
    :swf-name "flash.display::Bitmap"
    :constants
    ()
    :properties
    ((%flash.display:smoothing :swf-name "smoothing" :type "Boolean" :static NIL)
     (%flash.display:bitmap-data :swf-name "bitmapData" :type "flash.display::BitmapData" :static NIL)
     (%flash.display:smoothing :swf-name "smoothing" :type "void" :static NIL)
     (%flash.display:pixel-snapping :swf-name "pixelSnapping" :type "void" :static NIL)
     (%flash.display:pixel-snapping :swf-name "pixelSnapping" :type "String" :static NIL)
     (%flash.display:bitmap-data :swf-name "bitmapData" :type "void" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.xml:xml-node (%flash:object)
    :swf-name "flash.xml::XMLNode"
    :constants
    ()
    :properties
    ((%flash.xml:local-name :swf-name "localName" :type "String" :static NIL)
     (%flash.xml:child-nodes :swf-name "childNodes" :type "Array" :static NIL)
     (%flash.xml:attributes :swf-name "attributes" :type "void" :static NIL)
     (%flash.xml:node-name :swf-name "nodeName" :type "String" :value NIL :static NIL)
     (%flash.xml:last-child :swf-name "lastChild" :type "flash.xml::XMLNode" :value NIL :static NIL)
     (%flash.xml:node-type :swf-name "nodeType" :type "uint" :value NIL :static NIL)
     (%flash.xml:attributes :swf-name "attributes" :type "Object" :static NIL)
     (%flash.xml:node-value :swf-name "nodeValue" :type "String" :value NIL :static NIL)
     (%flash.xml:first-child :swf-name "firstChild" :type "flash.xml::XMLNode" :value NIL :static NIL)
     (%flash.xml:prefix :swf-name "prefix" :type "String" :static NIL)
     (%flash.xml:namespace-uri :swf-name "namespaceURI" :type "String" :static NIL)
     (%flash.xml:next-sibling :swf-name "nextSibling" :type "flash.xml::XMLNode" :value NIL :static NIL)
     (%flash.xml:parent-node :swf-name "parentNode" :type "flash.xml::XMLNode" :value NIL :static NIL)
     (%flash.xml:previous-sibling :swf-name "previousSibling" :type "flash.xml::XMLNode" :value NIL :static NIL))
    :methods
    ((%flash.xml:clone-node :swf-name "cloneNode" :return-type "flash.xml::XMLNode"
        :args (("deep" "Boolean")))
     (%flash.xml:remove-node :swf-name "removeNode" :return-type "void"
        :args NIL)
     (%flash.xml:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.xml:get-prefix-for-namespace :swf-name "getPrefixForNamespace" :return-type "String"
        :args (("ns" "String")))
     (%flash.xml:has-child-nodes :swf-name "hasChildNodes" :return-type "Boolean"
        :args NIL)
     (%flash.xml:get-namespace-for-prefix :swf-name "getNamespaceForPrefix" :return-type "String"
        :args (("prefix" "String")))
     (%flash.xml:insert-before :swf-name "insertBefore" :return-type "void"
        :args (("node" "flash.xml::XMLNode") ("before" "flash.xml::XMLNode")))
     (%flash.xml:append-child :swf-name "appendChild" :return-type "void"
        :args (("node" "flash.xml::XMLNode"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.xml:xml-document (%flash.xml:xml-node)
    :swf-name "flash.xml::XMLDocument"
    :constants
    ()
    :properties
    ((%flash.xml:doc-type-decl :swf-name "docTypeDecl" :type "Object" :value :NULL :static NIL)
     (%flash.xml:ignore-white :swf-name "ignoreWhite" :type "Boolean" :value NIL :static NIL)
     (%flash.xml:xml-decl :swf-name "xmlDecl" :type "Object" :value :NULL :static NIL)
     (%flash.xml:id-map :swf-name "idMap" :type "Object" :value NIL :static NIL))
    :methods
    ((%flash.xml:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.xml:create-text-node :swf-name "createTextNode" :return-type "flash.xml::XMLNode"
        :args (("text" "String")))
     (%flash.xml:parse-xml :swf-name "parseXML" :return-type "void"
        :args (("source" "String")))
     (%flash.xml:create-element :swf-name "createElement" :return-type "flash.xml::XMLNode"
        :args (("name" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:east-asian-justifier (%flash.text.engine:text-justifier)
    :swf-name "flash.text.engine::EastAsianJustifier"
    :constants
    ()
    :properties
    ((%flash.text.engine:justification-style :swf-name "justificationStyle" :type "String" :static NIL)
     (%flash.text.engine:justification-style :swf-name "justificationStyle" :type "void" :static NIL))
    :methods
    ((%flash.text.engine:clone :swf-name "clone" :return-type "flash.text.engine::TextJustifier"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-renderer (%flash:object)
    :swf-name "flash.text::TextRenderer"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:xml (%flash:object)
    :swf-name "XML"
    :constants
    ((%flash:+length+ :swf-name "length" :type "null" :value 1))
    :properties
    ()
    :methods
    ((%flash:children :swf-name "children" :return-type "XMLList"
        :args NIL)
     (%flash:remove-namespace :swf-name "removeNamespace" :return-type "XML"
        :args ("ns"))
     (%flash:text :swf-name "text" :return-type "XMLList"
        :args NIL)
     (%flash:namespace-declarations :swf-name "namespaceDeclarations" :return-type "Array"
        :args NIL)
     (%flash:add-namespace :swf-name "addNamespace" :return-type "XML"
        :args ("ns"))
     (%flash:insert-child-after :swf-name "insertChildAfter" :return-type "*"
        :args ("child1" "child2"))
     (%flash:elements :swf-name "elements" :return-type "XMLList"
        :args (&OPTIONAL ("name" "*")))
     (%flash:node-kind :swf-name "nodeKind" :return-type "String"
        :args NIL)
     (%flash:copy :swf-name "copy" :return-type "XML"
        :args NIL)
     (%flash:comments :swf-name "comments" :return-type "XMLList"
        :args NIL)
     (%flash:notification :swf-name "notification" :return-type "Function"
        :args NIL)
     (%flash:set-name :swf-name "setName" :return-type "void"
        :args ("name"))
     (%flash:prepend-child :swf-name "prependChild" :return-type "XML"
        :args ("value"))
     (%flash:has-simple-content :swf-name "hasSimpleContent" :return-type "Boolean"
        :args NIL)
     (%flash:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash:attribute :swf-name "attribute" :return-type "XMLList"
        :args ("arg"))
     (%flash:parent :swf-name "parent" :return-type "*"
        :args NIL)
     (%flash:value-of :swf-name "valueOf" :return-type "XML"
        :args NIL)
     (%flash:length :swf-name "length" :return-type "int"
        :args NIL)
     (%flash:descendants :swf-name "descendants" :return-type "XMLList"
        :args (&OPTIONAL ("name" "*")))
     (%flash:has-complex-content :swf-name "hasComplexContent" :return-type "Boolean"
        :args NIL)
     (%flash:append-child :swf-name "appendChild" :return-type "XML"
        :args ("child"))
     (%flash:contains :swf-name "contains" :return-type "Boolean"
        :args ("value"))
     (%flash:child-index :swf-name "childIndex" :return-type "int"
        :args NIL)
     (%flash:child :swf-name "child" :return-type "XMLList"
        :args ("propertyName"))
     (%flash:namespace :swf-name "namespace" :return-type "*"
        :args (&OPTIONAL "prefix"))
     (%flash:set-namespace :swf-name "setNamespace" :return-type "void"
        :args ("ns"))
     (%flash:processing-instructions :swf-name "processingInstructions" :return-type "XMLList"
        :args (&OPTIONAL ("name" "*")))
     (%flash:attributes :swf-name "attributes" :return-type "XMLList"
        :args NIL)
     (%flash:local-name :swf-name "localName" :return-type "Object"
        :args NIL)
     (%flash:set-local-name :swf-name "setLocalName" :return-type "void"
        :args ("name"))
     (%flash:in-scope-namespaces :swf-name "inScopeNamespaces" :return-type "Array"
        :args NIL)
     (%flash:normalize :swf-name "normalize" :return-type "XML"
        :args NIL)
     (%flash:name :swf-name "name" :return-type "Object"
        :args NIL)
     (%flash:set-children :swf-name "setChildren" :return-type "XML"
        :args ("value"))
     (%flash:property-is-enumerable :swf-name "propertyIsEnumerable" :return-type "Boolean"
        :args (&OPTIONAL "P"))
     (%flash:to-xml-string :swf-name "toXMLString" :return-type "String"
        :args NIL)
     (%flash:set-notification :swf-name "setNotification" :return-type "*"
        :args (("f" "Function")))
     (%flash:replace :swf-name "replace" :return-type "XML"
        :args ("propertyName" "value"))
     (%flash:insert-child-before :swf-name "insertChildBefore" :return-type "*"
        :args ("child1" "child2"))
     (%flash:has-own-property :swf-name "hasOwnProperty" :return-type "Boolean"
        :args (&OPTIONAL "P")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:xml-list (%flash:object)
    :swf-name "XMLList"
    :constants
    ((%flash:+length+ :swf-name "length" :type "null" :value 1))
    :properties
    ()
    :methods
    ((%flash:children :swf-name "children" :return-type "XMLList"
        :args NIL)
     (%flash:remove-namespace :swf-name "removeNamespace" :return-type "XML"
        :args ("ns"))
     (%flash:comments :swf-name "comments" :return-type "XMLList"
        :args NIL)
     (%flash:add-namespace :swf-name "addNamespace" :return-type "XML"
        :args ("ns"))
     (%flash:insert-child-after :swf-name "insertChildAfter" :return-type "*"
        :args ("child1" "child2"))
     (%flash:elements :swf-name "elements" :return-type "XMLList"
        :args (&OPTIONAL ("name" "*")))
     (%flash:node-kind :swf-name "nodeKind" :return-type "String"
        :args NIL)
     (%flash:copy :swf-name "copy" :return-type "XMLList"
        :args NIL)
     (%flash:text :swf-name "text" :return-type "XMLList"
        :args NIL)
     (%flash:set-name :swf-name "setName" :return-type "void"
        :args ("name"))
     (%flash:prepend-child :swf-name "prependChild" :return-type "XML"
        :args ("value"))
     (%flash:has-simple-content :swf-name "hasSimpleContent" :return-type "Boolean"
        :args NIL)
     (%flash:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash:child :swf-name "child" :return-type "XMLList"
        :args ("propertyName"))
     (%flash:parent :swf-name "parent" :return-type "*"
        :args NIL)
     (%flash:value-of :swf-name "valueOf" :return-type "XMLList"
        :args NIL)
     (%flash:length :swf-name "length" :return-type "int"
        :args NIL)
     (%flash:local-name :swf-name "localName" :return-type "Object"
        :args NIL)
     (%flash:has-complex-content :swf-name "hasComplexContent" :return-type "Boolean"
        :args NIL)
     (%flash:append-child :swf-name "appendChild" :return-type "XML"
        :args ("child"))
     (%flash:contains :swf-name "contains" :return-type "Boolean"
        :args ("value"))
     (%flash:child-index :swf-name "childIndex" :return-type "int"
        :args NIL)
     (%flash:attribute :swf-name "attribute" :return-type "XMLList"
        :args ("arg"))
     (%flash:namespace :swf-name "namespace" :return-type "*"
        :args (&OPTIONAL "prefix"))
     (%flash:set-local-name :swf-name "setLocalName" :return-type "void"
        :args ("name"))
     (%flash:set-namespace :swf-name "setNamespace" :return-type "void"
        :args ("ns"))
     (%flash:processing-instructions :swf-name "processingInstructions" :return-type "XMLList"
        :args (&OPTIONAL ("name" "*")))
     (%flash:attributes :swf-name "attributes" :return-type "XMLList"
        :args NIL)
     (%flash:descendants :swf-name "descendants" :return-type "XMLList"
        :args (&OPTIONAL ("name" "*")))
     (%flash:to-xml-string :swf-name "toXMLString" :return-type "String"
        :args NIL)
     (%flash:in-scope-namespaces :swf-name "inScopeNamespaces" :return-type "Array"
        :args NIL)
     (%flash:normalize :swf-name "normalize" :return-type "XMLList"
        :args NIL)
     (%flash:replace :swf-name "replace" :return-type "XML"
        :args ("propertyName" "value"))
     (%flash:name :swf-name "name" :return-type "Object"
        :args NIL)
     (%flash:set-children :swf-name "setChildren" :return-type "XML"
        :args ("value"))
     (%flash:property-is-enumerable :swf-name "propertyIsEnumerable" :return-type "Boolean"
        :args (&OPTIONAL "P"))
     (%flash:namespace-declarations :swf-name "namespaceDeclarations" :return-type "Array"
        :args NIL)
     (%flash:insert-child-before :swf-name "insertChildBefore" :return-type "*"
        :args ("child1" "child2"))
     (%flash:has-own-property :swf-name "hasOwnProperty" :return-type "Boolean"
        :args (&OPTIONAL "P")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:q-name (%flash:object)
    :swf-name "QName"
    :constants
    ((%flash:+length+ :swf-name "length" :type "null" :value 2))
    :properties
    ((%flash:local-name :swf-name "localName" :type "String" :static NIL)
     (%flash:uri :swf-name "uri" :type "*" :static NIL))
    :methods
    ((%flash:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash:value-of :swf-name "valueOf" :return-type "QName"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:stage-align (%flash:object)
    :swf-name "flash.display::StageAlign"
    :constants
    ((%flash.display:+right+ :swf-name "RIGHT" :type "String" :value "R")
     (%flash.display:+bottom-left+ :swf-name "BOTTOM_LEFT" :type "String" :value "BL")
     (%flash.display:+top+ :swf-name "TOP" :type "String" :value "T")
     (%flash.display:+top-right+ :swf-name "TOP_RIGHT" :type "String" :value "TR")
     (%flash.display:+top-left+ :swf-name "TOP_LEFT" :type "String" :value "TL")
     (%flash.display:+bottom+ :swf-name "BOTTOM" :type "String" :value "B")
     (%flash.display:+bottom-right+ :swf-name "BOTTOM_RIGHT" :type "String" :value "BR")
     (%flash.display:+left+ :swf-name "LEFT" :type "String" :value "L"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:color-correction-support (%flash:object)
    :swf-name "flash.display::ColorCorrectionSupport"
    :constants
    ((%flash.display:+default-on+ :swf-name "DEFAULT_ON" :type "String" :value "defaultOn")
     (%flash.display:+unsupported+ :swf-name "UNSUPPORTED" :type "String" :value "unsupported")
     (%flash.display:+default-off+ :swf-name "DEFAULT_OFF" :type "String" :value "defaultOff"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.errors:illegal-operation-error (%flash:error)
    :swf-name "flash.errors::IllegalOperationError"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.errors:io-error (%flash:error)
    :swf-name "flash.errors::IOError"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.errors:memory-error (%flash:error)
    :swf-name "flash.errors::MemoryError"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.errors:stack-overflow-error (%flash:error)
    :swf-name "flash.errors::StackOverflowError"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.errors:script-timeout-error (%flash:error)
    :swf-name "flash.errors::ScriptTimeoutError"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.errors:invalid-swf-error (%flash:error)
    :swf-name "flash.errors::InvalidSWFError"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.errors:eof-error (%flash.errors:io-error)
    :swf-name "flash.errors::EOFError"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:line-scale-mode (%flash:object)
    :swf-name "flash.display::LineScaleMode"
    :constants
    ((%flash.display:+none+ :swf-name "NONE" :type "String" :value "none")
     (%flash.display:+normal+ :swf-name "NORMAL" :type "String" :value "normal")
     (%flash.display:+vertical+ :swf-name "VERTICAL" :type "String" :value "vertical")
     (%flash.display:+horizontal+ :swf-name "HORIZONTAL" :type "String" :value "horizontal"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:font-style (%flash:object)
    :swf-name "flash.text::FontStyle"
    :constants
    ((%flash.text:+regular+ :swf-name "REGULAR" :type "String" :value "regular")
     (%flash.text:+bold+ :swf-name "BOLD" :type "String" :value "bold")
     (%flash.text:+bold-italic+ :swf-name "BOLD_ITALIC" :type "String" :value "boldItalic")
     (%flash.text:+italic+ :swf-name "ITALIC" :type "String" :value "italic"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:utils3d (%flash:object)
    :swf-name "flash.geom::Utils3D"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:typographic-case (%flash:object)
    :swf-name "flash.text.engine::TypographicCase"
    :constants
    ((%flash.text.engine:+caps-and-small-caps+ :swf-name "CAPS_AND_SMALL_CAPS" :type "String" :value "capsAndSmallCaps")
     (%flash.text.engine:+small-caps+ :swf-name "SMALL_CAPS" :type "String" :value "smallCaps")
     (%flash.text.engine:+title+ :swf-name "TITLE" :type "String" :value "title")
     (%flash.text.engine:+uppercase+ :swf-name "UPPERCASE" :type "String" :value "uppercase")
     (%flash.text.engine:+default+ :swf-name "DEFAULT" :type "String" :value "default")
     (%flash.text.engine:+caps+ :swf-name "CAPS" :type "String" :value "caps")
     (%flash.text.engine:+lowercase+ :swf-name "LOWERCASE" :type "String" :value "lowercase"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:tab-alignment (%flash:object)
    :swf-name "flash.text.engine::TabAlignment"
    :constants
    ((%flash.text.engine:+end+ :swf-name "END" :type "String" :value "end")
     (%flash.text.engine:+center+ :swf-name "CENTER" :type "String" :value "center")
     (%flash.text.engine:+start+ :swf-name "START" :type "String" :value "start")
     (%flash.text.engine:+decimal+ :swf-name "DECIMAL" :type "String" :value "decimal"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:ime-conversion-mode (%flash:object)
    :swf-name "flash.system::IMEConversionMode"
    :constants
    ((%flash.system:+alphanumeric-full+ :swf-name "ALPHANUMERIC_FULL" :type "String" :value "ALPHANUMERIC_FULL")
     (%flash.system:+japanese-katakana-half+ :swf-name "JAPANESE_KATAKANA_HALF" :type "String" :value "JAPANESE_KATAKANA_HALF")
     (%flash.system:+japanese-katakana-full+ :swf-name "JAPANESE_KATAKANA_FULL" :type "String" :value "JAPANESE_KATAKANA_FULL")
     (%flash.system:+chinese+ :swf-name "CHINESE" :type "String" :value "CHINESE")
     (%flash.system:+japanese-hiragana+ :swf-name "JAPANESE_HIRAGANA" :type "String" :value "JAPANESE_HIRAGANA")
     (%flash.system:+unknown+ :swf-name "UNKNOWN" :type "String" :value "UNKNOWN")
     (%flash.system:+korean+ :swf-name "KOREAN" :type "String" :value "KOREAN")
     (%flash.system:+alphanumeric-half+ :swf-name "ALPHANUMERIC_HALF" :type "String" :value "ALPHANUMERIC_HALF"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:fscommand (%flash:object)
    :swf-name "flash.system::FSCommand"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:tab-stop (%flash:object)
    :swf-name "flash.text.engine::TabStop"
    :constants
    ()
    :properties
    ((%flash.text.engine:decimal-alignment-token :swf-name "decimalAlignmentToken" :type "void" :static NIL)
     (%flash.text.engine:position :swf-name "position" :type "Number" :static NIL)
     (%flash.text.engine:decimal-alignment-token :swf-name "decimalAlignmentToken" :type "String" :static NIL)
     (%flash.text.engine:alignment :swf-name "alignment" :type "void" :static NIL)
     (%flash.text.engine:alignment :swf-name "alignment" :type "String" :static NIL)
     (%flash.text.engine:position :swf-name "position" :type "void" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:i-graphics-fill ()
    :swf-name "flash.display::IGraphicsFill"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-gradient-fill (%flash:object)
    :swf-name "flash.display::GraphicsGradientFill"
    :constants
    ()
    :properties
    ((%flash.display:spread-method :swf-name "spreadMethod" :type "String" :static NIL)
     (%flash.display:type :swf-name "type" :type "String" :static NIL)
     (%flash.display:alphas :swf-name "alphas" :type "Array" :value NIL :static NIL)
     (%flash.display:type :swf-name "type" :type "*" :static NIL)
     (%flash.display:interpolation-method :swf-name "interpolationMethod" :type "*" :static NIL)
     (%flash.display:colors :swf-name "colors" :type "Array" :value NIL :static NIL)
     (%flash.display:spread-method :swf-name "spreadMethod" :type "*" :static NIL)
     (%flash.display:ratios :swf-name "ratios" :type "Array" :value NIL :static NIL)
     (%flash.display:focal-point-ratio :swf-name "focalPointRatio" :type "Number" :value NIL :static NIL)
     (%flash.display:interpolation-method :swf-name "interpolationMethod" :type "String" :static NIL)
     (%flash.display:matrix :swf-name "matrix" :type "flash.geom::Matrix" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:font-description (%flash:object)
    :swf-name "flash.text.engine::FontDescription"
    :constants
    ()
    :properties
    ((%flash.text.engine:rendering-mode :swf-name "renderingMode" :type "void" :static NIL)
     (%flash.text.engine:locked :swf-name "locked" :type "void" :static NIL)
     (%flash.text.engine:font-name :swf-name "fontName" :type "String" :static NIL)
     (%flash.text.engine:font-posture :swf-name "fontPosture" :type "String" :static NIL)
     (%flash.text.engine:cff-hinting :swf-name "cffHinting" :type "String" :static NIL)
     (%flash.text.engine:font-name :swf-name "fontName" :type "void" :static NIL)
     (%flash.text.engine:font-posture :swf-name "fontPosture" :type "void" :static NIL)
     (%flash.text.engine:cff-hinting :swf-name "cffHinting" :type "void" :static NIL)
     (%flash.text.engine:rendering-mode :swf-name "renderingMode" :type "String" :static NIL)
     (%flash.text.engine:font-weight :swf-name "fontWeight" :type "void" :static NIL)
     (%flash.text.engine:locked :swf-name "locked" :type "Boolean" :static NIL)
     (%flash.text.engine:font-lookup :swf-name "fontLookup" :type "String" :static NIL)
     (%flash.text.engine:font-weight :swf-name "fontWeight" :type "String" :static NIL)
     (%flash.text.engine:font-lookup :swf-name "fontLookup" :type "void" :static NIL))
    :methods
    ((%flash.text.engine:clone :swf-name "clone" :return-type "flash.text.engine::FontDescription"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:net-stream (%flash.events:event-dispatcher)
    :swf-name "flash.net::NetStream"
    :constants
    ((%flash.net:+direct-connections+ :swf-name "DIRECT_CONNECTIONS" :type "String" :value "directConnections")
     (%flash.net:+connect-to-fms+ :swf-name "CONNECT_TO_FMS" :type "String" :value "connectToFMS"))
    :properties
    ((%flash.net:check-policy-file :swf-name "checkPolicyFile" :type "Boolean" :static NIL)
     (%flash.net:decoded-frames :swf-name "decodedFrames" :type "uint" :static NIL)
     (%flash.net:far-id :swf-name "farID" :type "String" :static NIL)
     (%flash.net:live-delay :swf-name "liveDelay" :type "Number" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.net:current-fps :swf-name "currentFPS" :type "Number" :static NIL)
     (%flash.net:info :swf-name "info" :type "flash.net::NetStreamInfo" :static NIL)
     (%flash.net:buffer-time :swf-name "bufferTime" :type "Number" :static NIL)
     (%flash.net:check-policy-file :swf-name "checkPolicyFile" :type "void" :static NIL)
     (%flash.net:near-nonce :swf-name "nearNonce" :type "String" :static NIL)
     (%flash.net:audio-codec :swf-name "audioCodec" :type "uint" :static NIL)
     (%flash.net:far-nonce :swf-name "farNonce" :type "String" :static NIL)
     (%flash.net:sound-transform :swf-name "soundTransform" :type "flash.media::SoundTransform" :static NIL)
     (%flash.net:video-codec :swf-name "videoCodec" :type "uint" :static NIL)
     (%flash.net:buffer-time :swf-name "bufferTime" :type "void" :static NIL)
     (%flash.net:bytes-total :swf-name "bytesTotal" :type "uint" :static NIL)
     (%flash.net:client :swf-name "client" :type "void" :static NIL)
     (%flash.net:buffer-length :swf-name "bufferLength" :type "Number" :static NIL)
     (%flash.net:time :swf-name "time" :type "Number" :static NIL)
     (%flash.net:bytes-loaded :swf-name "bytesLoaded" :type "uint" :static NIL)
     (%flash.net:client :swf-name "client" :type "Object" :static NIL)
     (%flash.net:peer-streams :swf-name "peerStreams" :type "Array" :static NIL)
     (%flash.net:max-pause-buffer-time :swf-name "maxPauseBufferTime" :type "Number" :static NIL)
     (%flash.net:max-pause-buffer-time :swf-name "maxPauseBufferTime" :type "void" :static NIL)
     (%flash.net:sound-transform :swf-name "soundTransform" :type "void" :static NIL))
    :methods
    ((%flash.net:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.net:play2 :swf-name "play2" :return-type "void"
        :args (("param" "flash.net::NetStreamPlayOptions")))
     (%flash.net:play :swf-name "play" :return-type "void"
        :args NIL)
     (%flash.net:pause :swf-name "pause" :return-type "void"
        :args NIL)
     (%flash.net:resume :swf-name "resume" :return-type "void"
        :args NIL)
     (%flash.net:receive-audio :swf-name "receiveAudio" :return-type "void"
        :args (("flag" "Boolean")))
     (%flash.net:receive-video-fps :swf-name "receiveVideoFPS" :return-type "void"
        :args (("FPS" "Number")))
     (%flash.net:on-peer-connect :swf-name "onPeerConnect" :return-type "Boolean"
        :args (("subscriber" "flash.net::NetStream")))
     (%flash.net:receive-video :swf-name "receiveVideo" :return-type "void"
        :args (("flag" "Boolean")))
     (%flash.net:attach-audio :swf-name "attachAudio" :return-type "void"
        :args (("microphone" "flash.media::Microphone")))
     (%flash.net:publish :swf-name "publish" :return-type "void"
        :args (&OPTIONAL ("name" "String") ("type" "String")))
     (%flash.net:attach-camera :swf-name "attachCamera" :return-type "void"
        :args (("theCamera" "flash.media::Camera") &OPTIONAL
               (("snapshotMilliseconds" "int") -1)))
     (%flash.net:send :swf-name "send" :return-type "void"
        :args (&REST ("handlerName" "String")))
     (%flash.net:seek :swf-name "seek" :return-type "void"
        :args (("offset" "Number")))
     (%flash.net:toggle-pause :swf-name "togglePause" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.xml:xml-node-type (%flash:object)
    :swf-name "flash.xml::XMLNodeType"
    :constants
    ((%flash.xml:+processing-instruction-node+ :swf-name "PROCESSING_INSTRUCTION_NODE" :type "uint" :value 7)
     (%flash.xml:+text-node+ :swf-name "TEXT_NODE" :type "uint" :value 3)
     (%flash.xml:+cdata-node+ :swf-name "CDATA_NODE" :type "uint" :value 4)
     (%flash.xml:+xml-declaration+ :swf-name "XML_DECLARATION" :type "uint" :value 13)
     (%flash.xml:+comment-node+ :swf-name "COMMENT_NODE" :type "uint" :value 8)
     (%flash.xml:+element-node+ :swf-name "ELEMENT_NODE" :type "uint" :value 1)
     (%flash.xml:+document-type-node+ :swf-name "DOCUMENT_TYPE_NODE" :type "uint" :value 10))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:ime-event (%flash.events:text-event)
    :swf-name "flash.events::IMEEvent"
    :constants
    ((%flash.events:+ime-composition+ :swf-name "IME_COMPOSITION" :type "String" :value "imeComposition"))
    :properties
    ()
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:bitmap-filter (%flash:object)
    :swf-name "flash.filters::BitmapFilter"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:drop-shadow-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::DropShadowFilter"
    :constants
    ()
    :properties
    ((%flash.filters:quality :swf-name "quality" :type "int" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "Number" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "void" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "Boolean" :static NIL)
     (%flash.filters:inner :swf-name "inner" :type "Boolean" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "Number" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "void" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "Number" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "Number" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "Number" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "void" :static NIL)
     (%flash.filters:color :swf-name "color" :type "void" :static NIL)
     (%flash.filters:inner :swf-name "inner" :type "void" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "void" :static NIL)
     (%flash.filters:hide-object :swf-name "hideObject" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "Number" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "void" :static NIL)
     (%flash.filters:quality :swf-name "quality" :type "void" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "void" :static NIL)
     (%flash.filters:color :swf-name "color" :type "uint" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "void" :static NIL)
     (%flash.filters:hide-object :swf-name "hideObject" :type "Boolean" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:timer (%flash.events:event-dispatcher)
    :swf-name "flash.utils::Timer"
    :constants
    ()
    :properties
    ((%flash.utils:running :swf-name "running" :type "Boolean" :static NIL)
     (%flash.utils:current-count :swf-name "currentCount" :type "int" :static NIL)
     (%flash.utils:repeat-count :swf-name "repeatCount" :type "int" :static NIL)
     (%flash.utils:repeat-count :swf-name "repeatCount" :type "void" :static NIL)
     (%flash.utils:delay :swf-name "delay" :type "void" :static NIL)
     (%flash.utils:delay :swf-name "delay" :type "Number" :static NIL))
    :methods
    ((%flash.utils:stop :swf-name "stop" :return-type "void"
        :args NIL)
     (%flash.utils:start :swf-name "start" :return-type "void"
        :args NIL)
     (%flash.utils:reset :swf-name "reset" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:set-interval-timer (%flash.utils:timer)
    :swf-name "flash.utils::SetIntervalTimer"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:keyboard (%flash:object)
    :swf-name "flash.ui::Keyboard"
    :constants
    ((%flash.ui:+numpad-multiply+ :swf-name "NUMPAD_MULTIPLY" :type "uint" :value 106)
     (%flash.ui:+f11+ :swf-name "F11" :type "uint" :value 122)
     (%flash.ui:+numpad-subtract+ :swf-name "NUMPAD_SUBTRACT" :type "uint" :value 109)
     (%flash.ui:+shift+ :swf-name "SHIFT" :type "uint" :value 16)
     (%flash.ui:+f15+ :swf-name "F15" :type "uint" :value 126)
     (%flash.ui:+f14+ :swf-name "F14" :type "uint" :value 125)
     (%flash.ui:+f13+ :swf-name "F13" :type "uint" :value 124)
     (%flash.ui:+f12+ :swf-name "F12" :type "uint" :value 123)
     (%flash.ui:+home+ :swf-name "HOME" :type "uint" :value 36)
     (%flash.ui:+f10+ :swf-name "F10" :type "uint" :value 121)
     (%flash.ui:+page-up+ :swf-name "PAGE_UP" :type "uint" :value 33)
     (%flash.ui:+page-down+ :swf-name "PAGE_DOWN" :type "uint" :value 34)
     (%flash.ui:+backspace+ :swf-name "BACKSPACE" :type "uint" :value 8)
     (%flash.ui:+numpad-decimal+ :swf-name "NUMPAD_DECIMAL" :type "uint" :value 110)
     (%flash.ui:+numpad-enter+ :swf-name "NUMPAD_ENTER" :type "uint" :value 108)
     (%flash.ui:+numpad-0+ :swf-name "NUMPAD_0" :type "uint" :value 96)
     (%flash.ui:+numpad-6+ :swf-name "NUMPAD_6" :type "uint" :value 102)
     (%flash.ui:+caps-lock+ :swf-name "CAPS_LOCK" :type "uint" :value 20)
     (%flash.ui:+numpad-3+ :swf-name "NUMPAD_3" :type "uint" :value 99)
     (%flash.ui:+numpad-9+ :swf-name "NUMPAD_9" :type "uint" :value 105)
     (%flash.ui:+numpad-8+ :swf-name "NUMPAD_8" :type "uint" :value 104)
     (%flash.ui:+numpad-5+ :swf-name "NUMPAD_5" :type "uint" :value 101)
     (%flash.ui:+numpad-4+ :swf-name "NUMPAD_4" :type "uint" :value 100)
     (%flash.ui:+f8+ :swf-name "F8" :type "uint" :value 119)
     (%flash.ui:+numpad-2+ :swf-name "NUMPAD_2" :type "uint" :value 98)
     (%flash.ui:+numpad-1+ :swf-name "NUMPAD_1" :type "uint" :value 97)
     (%flash.ui:+control+ :swf-name "CONTROL" :type "uint" :value 17)
     (%flash.ui:+end+ :swf-name "END" :type "uint" :value 35)
     (%flash.ui:+numpad-divide+ :swf-name "NUMPAD_DIVIDE" :type "uint" :value 111)
     (%flash.ui:+insert+ :swf-name "INSERT" :type "uint" :value 45)
     (%flash.ui:+enter+ :swf-name "ENTER" :type "uint" :value 13)
     (%flash.ui:+f9+ :swf-name "F9" :type "uint" :value 120)
     (%flash.ui:+delete+ :swf-name "DELETE" :type "uint" :value 46)
     (%flash.ui:+f7+ :swf-name "F7" :type "uint" :value 118)
     (%flash.ui:+f6+ :swf-name "F6" :type "uint" :value 117)
     (%flash.ui:+f5+ :swf-name "F5" :type "uint" :value 116)
     (%flash.ui:+f4+ :swf-name "F4" :type "uint" :value 115)
     (%flash.ui:+f3+ :swf-name "F3" :type "uint" :value 114)
     (%flash.ui:+f2+ :swf-name "F2" :type "uint" :value 113)
     (%flash.ui:+f1+ :swf-name "F1" :type "uint" :value 112)
     (%flash.ui:+up+ :swf-name "UP" :type "uint" :value 38)
     (%flash.ui:+down+ :swf-name "DOWN" :type "uint" :value 40)
     (%flash.ui:+space+ :swf-name "SPACE" :type "uint" :value 32)
     (%flash.ui:+numpad-add+ :swf-name "NUMPAD_ADD" :type "uint" :value 107)
     (%flash.ui:+tab+ :swf-name "TAB" :type "uint" :value 9)
     (%flash.ui:+numpad-7+ :swf-name "NUMPAD_7" :type "uint" :value 103)
     (%flash.ui:+left+ :swf-name "LEFT" :type "uint" :value 37)
     (%flash.ui:+right+ :swf-name "RIGHT" :type "uint" :value 39)
     (%flash.ui:+escape+ :swf-name "ESCAPE" :type "uint" :value 27))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:sound-mixer (%flash:object)
    :swf-name "flash.media::SoundMixer"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shader-data (%flash:object)
    :swf-name "flash.display::ShaderData"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:bitmap-data (%flash:object)
    :swf-name "flash.display::BitmapData"
    :constants
    ()
    :properties
    ((%flash.display:height :swf-name "height" :type "int" :static NIL)
     (%flash.display:rect :swf-name "rect" :type "flash.geom::Rectangle" :static NIL)
     (%flash.display:transparent :swf-name "transparent" :type "Boolean" :static NIL)
     (%flash.display:width :swf-name "width" :type "int" :static NIL))
    :methods
    ((%flash.display:histogram :swf-name "histogram" :return-type "__AS3__.vec::Vector.<__AS3__.vec::Vector.<Number>>"
        :args (&OPTIONAL ("hRect" "flash.geom::Rectangle")))
     (%flash.display:get-vector :swf-name "getVector" :return-type "__AS3__.vec::Vector.<uint>"
        :args (("rect" "flash.geom::Rectangle")))
     (%flash.display:merge :swf-name "merge" :return-type "void"
        :args (("sourceBitmapData" "flash.display::BitmapData")
               ("sourceRect" "flash.geom::Rectangle")
               ("destPoint" "flash.geom::Point") ("redMultiplier" "uint")
               ("greenMultiplier" "uint") ("blueMultiplier" "uint")
               ("alphaMultiplier" "uint")))
     (%flash.display:set-pixels :swf-name "setPixels" :return-type "void"
        :args (("rect" "flash.geom::Rectangle")
               ("inputByteArray" "flash.utils::ByteArray")))
     (%flash.display:lock :swf-name "lock" :return-type "void"
        :args NIL)
     (%flash.display:get-pixel32 :swf-name "getPixel32" :return-type "uint"
        :args (("x" "int") ("y" "int")))
     (%flash.display:threshold :swf-name "threshold" :return-type "uint"
        :args (("sourceBitmapData" "flash.display::BitmapData")
               ("sourceRect" "flash.geom::Rectangle")
               ("destPoint" "flash.geom::Point") ("operation" "String")
               ("threshold" "uint") &OPTIONAL (("color" "uint") 0)
               (("mask" "uint") 4294967295) (("copySource" "Boolean") NIL)))
     (%flash.display:get-pixels :swf-name "getPixels" :return-type "flash.utils::ByteArray"
        :args (("rect" "flash.geom::Rectangle")))
     (%flash.display:palette-map :swf-name "paletteMap" :return-type "void"
        :args (("sourceBitmapData" "flash.display::BitmapData")
               ("sourceRect" "flash.geom::Rectangle")
               ("destPoint" "flash.geom::Point") &OPTIONAL ("redArray" "Array")
               ("greenArray" "Array") ("blueArray" "Array")
               ("alphaArray" "Array")))
     (%flash.display:perlin-noise :swf-name "perlinNoise" :return-type "void"
        :args (("baseX" "Number") ("baseY" "Number") ("numOctaves" "uint")
               ("randomSeed" "int") ("stitch" "Boolean")
               ("fractalNoise" "Boolean") &OPTIONAL
               (("channelOptions" "uint") 7) (("grayScale" "Boolean") NIL)
               ("offsets" "Array")))
     (%flash.display:compare :swf-name "compare" :return-type "Object"
        :args (("otherBitmapData" "flash.display::BitmapData")))
     (%flash.display:set-pixel32 :swf-name "setPixel32" :return-type "void"
        :args (("x" "int") ("y" "int") ("color" "uint")))
     (%flash.display:flood-fill :swf-name "floodFill" :return-type "void"
        :args (("x" "int") ("y" "int") ("color" "uint")))
     (%flash.display:dispose :swf-name "dispose" :return-type "void"
        :args NIL)
     (%flash.display:clone :swf-name "clone" :return-type "flash.display::BitmapData"
        :args NIL)
     (%flash.display:noise :swf-name "noise" :return-type "void"
        :args (("randomSeed" "int") &OPTIONAL (("low" "uint") 0)
               (("high" "uint") 255) (("channelOptions" "uint") 7)
               (("grayScale" "Boolean") NIL)))
     (%flash.display:pixel-dissolve :swf-name "pixelDissolve" :return-type "int"
        :args (("sourceBitmapData" "flash.display::BitmapData")
               ("sourceRect" "flash.geom::Rectangle")
               ("destPoint" "flash.geom::Point") &OPTIONAL
               (("randomSeed" "int") 0) (("numPixels" "int") 0)
               (("fillColor" "uint") 0)))
     (%flash.display:get-color-bounds-rect :swf-name "getColorBoundsRect" :return-type "flash.geom::Rectangle"
        :args (("mask" "uint") ("color" "uint") &OPTIONAL
               (("findColor" "Boolean") T)))
     (%flash.display:scroll :swf-name "scroll" :return-type "void"
        :args (("x" "int") ("y" "int")))
     (%flash.display:unlock :swf-name "unlock" :return-type "void"
        :args (&OPTIONAL ("changeRect" "flash.geom::Rectangle")))
     (%flash.display:generate-filter-rect :swf-name "generateFilterRect" :return-type "flash.geom::Rectangle"
        :args (("sourceRect" "flash.geom::Rectangle")
               ("filter" "flash.filters::BitmapFilter")))
     (%flash.display:get-pixel :swf-name "getPixel" :return-type "uint"
        :args (("x" "int") ("y" "int")))
     (%flash.display:copy-channel :swf-name "copyChannel" :return-type "void"
        :args (("sourceBitmapData" "flash.display::BitmapData")
               ("sourceRect" "flash.geom::Rectangle")
               ("destPoint" "flash.geom::Point") ("sourceChannel" "uint")
               ("destChannel" "uint")))
     (%flash.display:set-vector :swf-name "setVector" :return-type "void"
        :args (("rect" "flash.geom::Rectangle")
               ("inputVector" "__AS3__.vec::Vector.<uint>")))
     (%flash.display:draw :swf-name "draw" :return-type "void"
        :args (("source" "flash.display::IBitmapDrawable") &OPTIONAL
               ("matrix" "flash.geom::Matrix")
               ("colorTransform" "flash.geom::ColorTransform")
               ("blendMode" "String") ("clipRect" "flash.geom::Rectangle")
               (("smoothing" "Boolean") NIL)))
     (%flash.display:color-transform :swf-name "colorTransform" :return-type "void"
        :args (("rect" "flash.geom::Rectangle")
               ("colorTransform" "flash.geom::ColorTransform")))
     (%flash.display:fill-rect :swf-name "fillRect" :return-type "void"
        :args (("rect" "flash.geom::Rectangle") ("color" "uint")))
     (%flash.display:apply-filter :swf-name "applyFilter" :return-type "void"
        :args (("sourceBitmapData" "flash.display::BitmapData")
               ("sourceRect" "flash.geom::Rectangle")
               ("destPoint" "flash.geom::Point")
               ("filter" "flash.filters::BitmapFilter")))
     (%flash.display:hit-test :swf-name "hitTest" :return-type "Boolean"
        :args (("firstPoint" "flash.geom::Point")
               ("firstAlphaThreshold" "uint") ("secondObject" "Object")
               &OPTIONAL ("secondBitmapDataPoint" "flash.geom::Point")
               (("secondAlphaThreshold" "uint") 1)))
     (%flash.display:set-pixel :swf-name "setPixel" :return-type "void"
        :args (("x" "int") ("y" "int") ("color" "uint")))
     (%flash.display:copy-pixels :swf-name "copyPixels" :return-type "void"
        :args (("sourceBitmapData" "flash.display::BitmapData")
               ("sourceRect" "flash.geom::Rectangle")
               ("destPoint" "flash.geom::Point") &OPTIONAL
               ("alphaBitmapData" "flash.display::BitmapData")
               ("alphaPoint" "flash.geom::Point")
               (("mergeAlpha" "Boolean") NIL))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-field-type (%flash:object)
    :swf-name "flash.text::TextFieldType"
    :constants
    ((%flash.text:+dynamic+ :swf-name "DYNAMIC" :type "String" :value "dynamic")
     (%flash.text:+input+ :swf-name "INPUT" :type "String" :value "input"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-end-fill (%flash:object)
    :swf-name "flash.display::GraphicsEndFill"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:net-filter-event (%flash.events:event)
    :swf-name "flash.events::NetFilterEvent"
    :constants
    ()
    :properties
    ((%flash.events:header :swf-name "header" :type "flash.utils::ByteArray" :value NIL :static NIL)
     (%flash.events:data :swf-name "data" :type "flash.utils::ByteArray" :value NIL :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-triangle-path (%flash:object)
    :swf-name "flash.display::GraphicsTrianglePath"
    :constants
    ()
    :properties
    ((%flash.display:culling :swf-name "culling" :type "void" :static NIL)
     (%flash.display:uvt-data :swf-name "uvtData" :type "__AS3__.vec::Vector.<Number>" :value NIL :static NIL)
     (%flash.display:vertices :swf-name "vertices" :type "__AS3__.vec::Vector.<Number>" :value NIL :static NIL)
     (%flash.display:indices :swf-name "indices" :type "__AS3__.vec::Vector.<int>" :value NIL :static NIL)
     (%flash.display:culling :swf-name "culling" :type "String" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:gradient-type (%flash:object)
    :swf-name "flash.display::GradientType"
    :constants
    ((%flash.display:+radial+ :swf-name "RADIAL" :type "String" :value "radial")
     (%flash.display:+linear+ :swf-name "LINEAR" :type "String" :value "linear"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:url-request-method (%flash:object)
    :swf-name "flash.net::URLRequestMethod"
    :constants
    ((%flash.net:+get+ :swf-name "GET" :type "String" :value "GET")
     (%flash.net:+post+ :swf-name "POST" :type "String" :value "POST"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:object-input (%flash:object)
    :swf-name "flash.utils::ObjectInput"
    :constants
    ()
    :properties
    ((%flash.utils:endian :swf-name "endian" :type "void" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.utils:bytes-available :swf-name "bytesAvailable" :type "uint" :static NIL)
     (%flash.utils:endian :swf-name "endian" :type "String" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL))
    :methods
    ((%flash.utils:read-bytes :swf-name "readBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.utils:read-utf-bytes :swf-name "readUTFBytes" :return-type "String"
        :args (("length" "uint")))
     (%flash.utils:read-int :swf-name "readInt" :return-type "int"
        :args NIL)
     (%flash.utils:read-utf :swf-name "readUTF" :return-type "String"
        :args NIL)
     (%flash.utils:read-float :swf-name "readFloat" :return-type "Number"
        :args NIL)
     (%flash.utils:read-multi-byte :swf-name "readMultiByte" :return-type "String"
        :args (("length" "uint") ("charSet" "String")))
     (%flash.utils:read-unsigned-short :swf-name "readUnsignedShort" :return-type "uint"
        :args NIL)
     (%flash.utils:read-object :swf-name "readObject" :return-type "*"
        :args NIL)
     (%flash.utils:read-unsigned-byte :swf-name "readUnsignedByte" :return-type "uint"
        :args NIL)
     (%flash.utils:read-boolean :swf-name "readBoolean" :return-type "Boolean"
        :args NIL)
     (%flash.utils:read-double :swf-name "readDouble" :return-type "Number"
        :args NIL)
     (%flash.utils:read-short :swf-name "readShort" :return-type "int"
        :args NIL)
     (%flash.utils:read-byte :swf-name "readByte" :return-type "int"
        :args NIL)
     (%flash.utils:read-unsigned-int :swf-name "readUnsignedInt" :return-type "uint"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.accessibility:accessibility-implementation (%flash:object)
    :swf-name "flash.accessibility::AccessibilityImplementation"
    :constants
    ()
    :properties
    ((%flash.accessibility:stub :swf-name "stub" :type "Boolean" :value NIL :static NIL)
     (%flash.accessibility:errno :swf-name "errno" :type "uint" :value NIL :static NIL))
    :methods
    ((%flash.accessibility:get-acc-default-action :swf-name "get_accDefaultAction" :return-type "String"
        :args (("childID" "uint")))
     (%flash.accessibility:acc-select :swf-name "accSelect" :return-type "void"
        :args (("operation" "uint") ("childID" "uint")))
     (%flash.accessibility:get-acc-state :swf-name "get_accState" :return-type "uint"
        :args (("childID" "uint")))
     (%flash.accessibility:get-child-id-array :swf-name "getChildIDArray" :return-type "Array"
        :args NIL)
     (%flash.accessibility:acc-location :swf-name "accLocation" :return-type "*"
        :args (("childID" "uint")))
     (%flash.accessibility:get-acc-role :swf-name "get_accRole" :return-type "uint"
        :args (("childID" "uint")))
     (%flash.accessibility:get-acc-selection :swf-name "get_accSelection" :return-type "Array"
        :args NIL)
     (%flash.accessibility:acc-do-default-action :swf-name "accDoDefaultAction" :return-type "void"
        :args (("childID" "uint")))
     (%flash.accessibility:get-acc-value :swf-name "get_accValue" :return-type "String"
        :args (("childID" "uint")))
     (%flash.accessibility:get-acc-focus :swf-name "get_accFocus" :return-type "uint"
        :args NIL)
     (%flash.accessibility:get-acc-name :swf-name "get_accName" :return-type "String"
        :args (("childID" "uint")))
     (%flash.accessibility:is-labeled-by :swf-name "isLabeledBy" :return-type "Boolean"
        :args (("labelBounds" "flash.geom::Rectangle"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:camera (%flash.events:event-dispatcher)
    :swf-name "flash.media::Camera"
    :constants
    ()
    :properties
    ((%flash.media:quality :swf-name "quality" :type "int" :static NIL)
     (%flash.media:motion-timeout :swf-name "motionTimeout" :type "int" :static NIL)
     (%flash.media:activity-level :swf-name "activityLevel" :type "Number" :static NIL)
     (%flash.media:key-frame-interval :swf-name "keyFrameInterval" :type "int" :static NIL)
     (%flash.media:index :swf-name "index" :type "int" :static NIL)
     (%flash.media:bandwidth :swf-name "bandwidth" :type "int" :static NIL)
     (%flash.media:current-fps :swf-name "currentFPS" :type "Number" :static NIL)
     (%flash.media:motion-level :swf-name "motionLevel" :type "int" :static NIL)
     (%flash.media:muted :swf-name "muted" :type "Boolean" :static NIL)
     (%flash.media:name :swf-name "name" :type "String" :static NIL)
     (%flash.media:fps :swf-name "fps" :type "Number" :static NIL)
     (%flash.media:height :swf-name "height" :type "int" :static NIL)
     (%flash.media:width :swf-name "width" :type "int" :static NIL)
     (%flash.media:loopback :swf-name "loopback" :type "Boolean" :static NIL))
    :methods
    ((%flash.media:set-quality :swf-name "setQuality" :return-type "void"
        :args (("bandwidth" "int") ("quality" "int")))
     (%flash.media:set-key-frame-interval :swf-name "setKeyFrameInterval" :return-type "void"
        :args (("keyFrameInterval" "int")))
     (%flash.media:set-cursor :swf-name "setCursor" :return-type "void"
        :args (("value" "Boolean")))
     (%flash.media:set-loopback :swf-name "setLoopback" :return-type "void"
        :args (&OPTIONAL (("compress" "Boolean") NIL)))
     (%flash.media:set-motion-level :swf-name "setMotionLevel" :return-type "void"
        :args (("motionLevel" "int") &OPTIONAL (("timeout" "int") 2000)))
     (%flash.media:set-mode :swf-name "setMode" :return-type "void"
        :args (("width" "int") ("height" "int") ("fps" "Number") &OPTIONAL
               (("favorArea" "Boolean") T))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:font-metrics (%flash:object)
    :swf-name "flash.text.engine::FontMetrics"
    :constants
    ()
    :properties
    ((%flash.text.engine:underline-offset :swf-name "underlineOffset" :type "Number" :value NIL :static NIL)
     (%flash.text.engine:subscript-offset :swf-name "subscriptOffset" :type "Number" :value NIL :static NIL)
     (%flash.text.engine:superscript-offset :swf-name "superscriptOffset" :type "Number" :value NIL :static NIL)
     (%flash.text.engine:subscript-scale :swf-name "subscriptScale" :type "Number" :value NIL :static NIL)
     (%flash.text.engine:underline-thickness :swf-name "underlineThickness" :type "Number" :value NIL :static NIL)
     (%flash.text.engine:strikethrough-offset :swf-name "strikethroughOffset" :type "Number" :value NIL :static NIL)
     (%flash.text.engine:superscript-scale :swf-name "superscriptScale" :type "Number" :value NIL :static NIL)
     (%flash.text.engine:em-box :swf-name "emBox" :type "flash.geom::Rectangle" :value NIL :static NIL)
     (%flash.text.engine:strikethrough-thickness :swf-name "strikethroughThickness" :type "Number" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:avm1movie (%flash.display:display-object)
    :swf-name "flash.display::AVM1Movie"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.display:call :swf-name "call" :return-type "*"
        :args (&REST ("functionName" "String")))
     (%flash.display:add-callback :swf-name "addCallback" :return-type "void"
        :args (("functionName" "String") ("closure" "Function"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:displacement-map-filter-mode (%flash:object)
    :swf-name "flash.filters::DisplacementMapFilterMode"
    :constants
    ((%flash.filters:+clamp+ :swf-name "CLAMP" :type "String" :value "clamp")
     (%flash.filters:+wrap+ :swf-name "WRAP" :type "String" :value "wrap")
     (%flash.filters:+ignore+ :swf-name "IGNORE" :type "String" :value "ignore")
     (%flash.filters:+color+ :swf-name "COLOR" :type "String" :value "color"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:gradient-glow-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::GradientGlowFilter"
    :constants
    ()
    :properties
    ((%flash.filters:quality :swf-name "quality" :type "int" :static NIL)
     (%flash.filters:quality :swf-name "quality" :type "void" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "Number" :static NIL)
     (%flash.filters:type :swf-name "type" :type "void" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "Boolean" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "void" :static NIL)
     (%flash.filters:ratios :swf-name "ratios" :type "void" :static NIL)
     (%flash.filters:alphas :swf-name "alphas" :type "Array" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "void" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "Number" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "Number" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "Number" :static NIL)
     (%flash.filters:colors :swf-name "colors" :type "Array" :static NIL)
     (%flash.filters:alphas :swf-name "alphas" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "void" :static NIL)
     (%flash.filters:ratios :swf-name "ratios" :type "Array" :static NIL)
     (%flash.filters:type :swf-name "type" :type "String" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "void" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "void" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "Number" :static NIL)
     (%flash.filters:colors :swf-name "colors" :type "void" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:joint-style (%flash:object)
    :swf-name "flash.display::JointStyle"
    :constants
    ((%flash.display:+round+ :swf-name "ROUND" :type "String" :value "round")
     (%flash.display:+bevel+ :swf-name "BEVEL" :type "String" :value "bevel")
     (%flash.display:+miter+ :swf-name "MITER" :type "String" :value "miter"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:local-connection (%flash.events:event-dispatcher)
    :swf-name "flash.net::LocalConnection"
    :constants
    ()
    :properties
    ((%flash.net:client :swf-name "client" :type "Object" :static NIL)
     (%flash.net:client :swf-name "client" :type "void" :static NIL)
     (%flash.net:domain :swf-name "domain" :type "String" :static NIL))
    :methods
    ((%flash.net:send :swf-name "send" :return-type "void"
        :args (("connectionName" "String") &REST ("methodName" "String")))
     (%flash.net:allow-domain :swf-name "allowDomain" :return-type "void"
        :args NIL)
     (%flash.net:connect :swf-name "connect" :return-type "void"
        :args (("connectionName" "String")))
     (%flash.net:allow-insecure-domain :swf-name "allowInsecureDomain" :return-type "void"
        :args NIL)
     (%flash.net:close :swf-name "close" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:font-weight (%flash:object)
    :swf-name "flash.text.engine::FontWeight"
    :constants
    ((%flash.text.engine:+normal+ :swf-name "NORMAL" :type "String" :value "normal")
     (%flash.text.engine:+bold+ :swf-name "BOLD" :type "String" :value "bold"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:url-request (%flash:object)
    :swf-name "flash.net::URLRequest"
    :constants
    ()
    :properties
    ((%flash.net:url :swf-name "url" :type "void" :static NIL)
     (%flash.net:content-type :swf-name "contentType" :type "String" :static NIL)
     (%flash.net:request-headers :swf-name "requestHeaders" :type "Array" :static NIL)
     (%flash.net:data :swf-name "data" :type "void" :static NIL)
     (%flash.net:url :swf-name "url" :type "String" :static NIL)
     (%flash.net:request-headers :swf-name "requestHeaders" :type "void" :static NIL)
     (%flash.net:data :swf-name "data" :type "Object" :static NIL)
     (%flash.net:digest :swf-name "digest" :type "void" :static NIL)
     (%flash.net:content-type :swf-name "contentType" :type "void" :static NIL)
     (%flash.net:digest :swf-name "digest" :type "String" :static NIL)
     (%flash.net:method :swf-name "method" :type "void" :static NIL)
     (%flash.net:method :swf-name "method" :type "String" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:i-graphics-stroke ()
    :swf-name "flash.display::IGraphicsStroke"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-stroke (%flash:object)
    :swf-name "flash.display::GraphicsStroke"
    :constants
    ()
    :properties
    ((%flash.display:scale-mode :swf-name "scaleMode" :type "void" :static NIL)
     (%flash.display:miter-limit :swf-name "miterLimit" :type "Number" :value NIL :static NIL)
     (%flash.display:pixel-hinting :swf-name "pixelHinting" :type "Boolean" :value NIL :static NIL)
     (%flash.display:thickness :swf-name "thickness" :type "Number" :value NIL :static NIL)
     (%flash.display:joints :swf-name "joints" :type "*" :static NIL)
     (%flash.display:scale-mode :swf-name "scaleMode" :type "String" :static NIL)
     (%flash.display:joints :swf-name "joints" :type "String" :static NIL)
     (%flash.display:fill :swf-name "fill" :type "flash.display::IGraphicsFill" :value NIL :static NIL)
     (%flash.display:caps :swf-name "caps" :type "void" :static NIL)
     (%flash.display:caps :swf-name "caps" :type "String" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.xml:xml-tag (%flash:object)
    :swf-name "flash.xml::XMLTag"
    :constants
    ()
    :properties
    ((%flash.xml:attrs :swf-name "attrs" :type "Object" :static NIL)
     (%flash.xml:empty :swf-name "empty" :type "Boolean" :static NIL)
     (%flash.xml:attrs :swf-name "attrs" :type "void" :static NIL)
     (%flash.xml:empty :swf-name "empty" :type "void" :static NIL)
     (%flash.xml:type :swf-name "type" :type "uint" :static NIL)
     (%flash.xml:type :swf-name "type" :type "void" :static NIL)
     (%flash.xml:value :swf-name "value" :type "void" :static NIL)
     (%flash.xml:value :swf-name "value" :type "String" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:io-error-event (%flash.events:error-event)
    :swf-name "flash.events::IOErrorEvent"
    :constants
    ((%flash.events:+io-error+ :swf-name "IO_ERROR" :type "String" :value "ioError")
     (%flash.events:+verify-error+ :swf-name "VERIFY_ERROR" :type "String" :value "verifyError")
     (%flash.events:+network-error+ :swf-name "NETWORK_ERROR" :type "String" :value "networkError")
     (%flash.events:+disk-error+ :swf-name "DISK_ERROR" :type "String" :value "diskError"))
    :properties
    ()
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:graphic-element (%flash.text.engine:content-element)
    :swf-name "flash.text.engine::GraphicElement"
    :constants
    ()
    :properties
    ((%flash.text.engine:element-width :swf-name "elementWidth" :type "Number" :static NIL)
     (%flash.text.engine:graphic :swf-name "graphic" :type "flash.display::DisplayObject" :static NIL)
     (%flash.text.engine:element-height :swf-name "elementHeight" :type "void" :static NIL)
     (%flash.text.engine:element-width :swf-name "elementWidth" :type "void" :static NIL)
     (%flash.text.engine:element-height :swf-name "elementHeight" :type "Number" :static NIL)
     (%flash.text.engine:graphic :swf-name "graphic" :type "void" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.desktop:clipboard-formats (%flash:object)
    :swf-name "flash.desktop::ClipboardFormats"
    :constants
    ((%flash.desktop:+url-format+ :swf-name "URL_FORMAT" :type "String" :value "air:url")
     (%flash.desktop:+file-list-format+ :swf-name "FILE_LIST_FORMAT" :type "String" :value "air:file list")
     (%flash.desktop:+bitmap-format+ :swf-name "BITMAP_FORMAT" :type "String" :value "air:bitmap")
     (%flash.desktop:+rich-text-format+ :swf-name "RICH_TEXT_FORMAT" :type "String" :value "air:rtf")
     (%flash.desktop:+html-format+ :swf-name "HTML_FORMAT" :type "String" :value "air:html")
     (%flash.desktop:+text-format+ :swf-name "TEXT_FORMAT" :type "String" :value "air:text"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.desktop:clipboard-transfer-mode (%flash:object)
    :swf-name "flash.desktop::ClipboardTransferMode"
    :constants
    ((%flash.desktop:+clone-preferred+ :swf-name "CLONE_PREFERRED" :type "String" :value "clonePreferred")
     (%flash.desktop:+original-only+ :swf-name "ORIGINAL_ONLY" :type "String" :value "originalOnly")
     (%flash.desktop:+clone-only+ :swf-name "CLONE_ONLY" :type "String" :value "cloneOnly")
     (%flash.desktop:+original-preferred+ :swf-name "ORIGINAL_PREFERRED" :type "String" :value "originalPreferred"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.desktop:clipboard (%flash:object)
    :swf-name "flash.desktop::Clipboard"
    :constants
    ()
    :properties
    ((%flash.desktop:formats :swf-name "formats" :type "Array" :static NIL))
    :methods
    ((%flash.desktop:set-data-handler :swf-name "setDataHandler" :return-type "Boolean"
        :args (("format" "String") ("handler" "Function") &OPTIONAL
               (("serializable" "Boolean") T)))
     (%flash.desktop:has-format :swf-name "hasFormat" :return-type "Boolean"
        :args (("format" "String")))
     (%flash.desktop:set-data :swf-name "setData" :return-type "Boolean"
        :args (("format" "String") ("data" "Object") &OPTIONAL
               (("serializable" "Boolean") T)))
     (%flash.desktop:get-data :swf-name "getData" :return-type "Object"
        :args (("format" "String") &OPTIONAL
               (("transferMode" "String") "originalPreferred")))
     (%flash.desktop:clear-data :swf-name "clearData" :return-type "void"
        :args (("format" "String")))
     (%flash.desktop:clear :swf-name "clear" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:break-opportunity (%flash:object)
    :swf-name "flash.text.engine::BreakOpportunity"
    :constants
    ((%flash.text.engine:+none+ :swf-name "NONE" :type "String" :value "none")
     (%flash.text.engine:+any+ :swf-name "ANY" :type "String" :value "any")
     (%flash.text.engine:+auto+ :swf-name "AUTO" :type "String" :value "auto")
     (%flash.text.engine:+all+ :swf-name "ALL" :type "String" :value "all"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:gradient-bevel-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::GradientBevelFilter"
    :constants
    ()
    :properties
    ((%flash.filters:quality :swf-name "quality" :type "int" :static NIL)
     (%flash.filters:quality :swf-name "quality" :type "void" :static NIL)
     (%flash.filters:alphas :swf-name "alphas" :type "Array" :static NIL)
     (%flash.filters:type :swf-name "type" :type "void" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "Boolean" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "void" :static NIL)
     (%flash.filters:ratios :swf-name "ratios" :type "void" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "Number" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "void" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "Number" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "Number" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "Number" :static NIL)
     (%flash.filters:colors :swf-name "colors" :type "Array" :static NIL)
     (%flash.filters:alphas :swf-name "alphas" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "void" :static NIL)
     (%flash.filters:ratios :swf-name "ratios" :type "Array" :static NIL)
     (%flash.filters:type :swf-name "type" :type "String" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "void" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "void" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "Number" :static NIL)
     (%flash.filters:colors :swf-name "colors" :type "void" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-path-command (%flash:object)
    :swf-name "flash.display::GraphicsPathCommand"
    :constants
    ((%flash.display:+no-op+ :swf-name "NO_OP" :type "int" :value 0)
     (%flash.display:+wide-move-to+ :swf-name "WIDE_MOVE_TO" :type "int" :value 4)
     (%flash.display:+wide-line-to+ :swf-name "WIDE_LINE_TO" :type "int" :value 5)
     (%flash.display:+curve-to+ :swf-name "CURVE_TO" :type "int" :value 3)
     (%flash.display:+move-to+ :swf-name "MOVE_TO" :type "int" :value 1)
     (%flash.display:+line-to+ :swf-name "LINE_TO" :type "int" :value 2))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:focus-event (%flash.events:event)
    :swf-name "flash.events::FocusEvent"
    :constants
    ((%flash.events:+focus-in+ :swf-name "FOCUS_IN" :type "String" :value "focusIn")
     (%flash.events:+key-focus-change+ :swf-name "KEY_FOCUS_CHANGE" :type "String" :value "keyFocusChange")
     (%flash.events:+focus-out+ :swf-name "FOCUS_OUT" :type "String" :value "focusOut")
     (%flash.events:+mouse-focus-change+ :swf-name "MOUSE_FOCUS_CHANGE" :type "String" :value "mouseFocusChange"))
    :properties
    ((%flash.events:key-code :swf-name "keyCode" :type "void" :static NIL)
     (%flash.events:related-object :swf-name "relatedObject" :type "void" :static NIL)
     (%flash.events:is-related-object-inaccessible :swf-name "isRelatedObjectInaccessible" :type "void" :static NIL)
     (%flash.events:key-code :swf-name "keyCode" :type "uint" :static NIL)
     (%flash.events:related-object :swf-name "relatedObject" :type "flash.display::InteractiveObject" :static NIL)
     (%flash.events:shift-key :swf-name "shiftKey" :type "Boolean" :static NIL)
     (%flash.events:is-related-object-inaccessible :swf-name "isRelatedObjectInaccessible" :type "Boolean" :static NIL)
     (%flash.events:shift-key :swf-name "shiftKey" :type "void" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:matrix3d (%flash:object)
    :swf-name "flash.geom::Matrix3D"
    :constants
    ()
    :properties
    ((%flash.geom:position :swf-name "position" :type "void" :static NIL)
     (%flash.geom:determinant :swf-name "determinant" :type "Number" :static NIL)
     (%flash.geom:raw-data :swf-name "rawData" :type "__AS3__.vec::Vector.<Number>" :static NIL)
     (%flash.geom:position :swf-name "position" :type "flash.geom::Vector3D" :static NIL)
     (%flash.geom:raw-data :swf-name "rawData" :type "void" :static NIL))
    :methods
    ((%flash.geom:recompose :swf-name "recompose" :return-type "Boolean"
        :args (("components" "__AS3__.vec::Vector.<flash.geom::Vector3D>")
               &OPTIONAL (("orientationStyle" "String") "eulerAngles")))
     (%flash.geom:identity :swf-name "identity" :return-type "void"
        :args NIL)
     (%flash.geom:clone :swf-name "clone" :return-type "flash.geom::Matrix3D"
        :args NIL)
     (%flash.geom:prepend-scale :swf-name "prependScale" :return-type "void"
        :args (("xScale" "Number") ("yScale" "Number") ("zScale" "Number")))
     (%flash.geom:append :swf-name "append" :return-type "void"
        :args (("lhs" "flash.geom::Matrix3D")))
     (%flash.geom:append-rotation :swf-name "appendRotation" :return-type "void"
        :args (("degrees" "Number") ("axis" "flash.geom::Vector3D") &OPTIONAL
               ("pivotPoint" "flash.geom::Vector3D")))
     (%flash.geom:append-translation :swf-name "appendTranslation" :return-type "void"
        :args (("x" "Number") ("y" "Number") ("z" "Number")))
     (%flash.geom:invert :swf-name "invert" :return-type "Boolean"
        :args NIL)
     (%flash.geom:interpolate-to :swf-name "interpolateTo" :return-type "void"
        :args (("toMat" "flash.geom::Matrix3D") ("percent" "Number")))
     (%flash.geom:decompose :swf-name "decompose" :return-type "__AS3__.vec::Vector.<flash.geom::Vector3D>"
        :args (&OPTIONAL (("orientationStyle" "String") "eulerAngles")))
     (%flash.geom:append-scale :swf-name "appendScale" :return-type "void"
        :args (("xScale" "Number") ("yScale" "Number") ("zScale" "Number")))
     (%flash.geom:transform-vector :swf-name "transformVector" :return-type "flash.geom::Vector3D"
        :args (("v" "flash.geom::Vector3D")))
     (%flash.geom:prepend :swf-name "prepend" :return-type "void"
        :args (("rhs" "flash.geom::Matrix3D")))
     (%flash.geom:prepend-rotation :swf-name "prependRotation" :return-type "void"
        :args (("degrees" "Number") ("axis" "flash.geom::Vector3D") &OPTIONAL
               ("pivotPoint" "flash.geom::Vector3D")))
     (%flash.geom:transform-vectors :swf-name "transformVectors" :return-type "void"
        :args (("vin" "__AS3__.vec::Vector.<Number>")
               ("vout" "__AS3__.vec::Vector.<Number>")))
     (%flash.geom:point-at :swf-name "pointAt" :return-type "void"
        :args (("pos" "flash.geom::Vector3D") &OPTIONAL
               ("at" "flash.geom::Vector3D") ("up" "flash.geom::Vector3D")))
     (%flash.geom:delta-transform-vector :swf-name "deltaTransformVector" :return-type "flash.geom::Vector3D"
        :args (("v" "flash.geom::Vector3D")))
     (%flash.geom:prepend-translation :swf-name "prependTranslation" :return-type "void"
        :args (("x" "Number") ("y" "Number") ("z" "Number")))
     (%flash.geom:transpose :swf-name "transpose" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-rotation (%flash:object)
    :swf-name "flash.text.engine::TextRotation"
    :constants
    ((%flash.text.engine:+auto+ :swf-name "AUTO" :type "String" :value "auto")
     (%flash.text.engine:+rotate-0+ :swf-name "ROTATE_0" :type "String" :value "rotate0")
     (%flash.text.engine:+rotate-90+ :swf-name "ROTATE_90" :type "String" :value "rotate90")
     (%flash.text.engine:+rotate-270+ :swf-name "ROTATE_270" :type "String" :value "rotate270")
     (%flash.text.engine:+rotate-180+ :swf-name "ROTATE_180" :type "String" :value "rotate180"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:sample-data-event (%flash.events:event)
    :swf-name "flash.events::SampleDataEvent"
    :constants
    ((%flash.events:+sample-data+ :swf-name "SAMPLE_DATA" :type "String" :value "sampleData"))
    :properties
    ((%flash.events:data :swf-name "data" :type "flash.utils::ByteArray" :static NIL)
     (%flash.events:position :swf-name "position" :type "Number" :static NIL)
     (%flash.events:data :swf-name "data" :type "*" :static NIL)
     (%flash.events:position :swf-name "position" :type "*" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:bitmap-data-channel (%flash:object)
    :swf-name "flash.display::BitmapDataChannel"
    :constants
    ((%flash.display:+alpha+ :swf-name "ALPHA" :type "uint" :value 8)
     (%flash.display:+blue+ :swf-name "BLUE" :type "uint" :value 4)
     (%flash.display:+green+ :swf-name "GREEN" :type "uint" :value 2)
     (%flash.display:+red+ :swf-name "RED" :type "uint" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:vector3d (%flash:object)
    :swf-name "flash.geom::Vector3D"
    :constants
    ((%flash.geom:+x-axis+ :swf-name "X_AXIS" :type "flash.geom::Vector3D" :value NIL)
     (%flash.geom:+y-axis+ :swf-name "Y_AXIS" :type "flash.geom::Vector3D" :value NIL)
     (%flash.geom:+z-axis+ :swf-name "Z_AXIS" :type "flash.geom::Vector3D" :value NIL))
    :properties
    ((%flash.geom:z :swf-name "z" :type "Number" :value NIL :static NIL)
     (%flash.geom:y :swf-name "y" :type "Number" :value NIL :static NIL)
     (%flash.geom:x :swf-name "x" :type "Number" :value NIL :static NIL)
     (%flash.geom:w :swf-name "w" :type "Number" :value NIL :static NIL)
     (%flash.geom:length :swf-name "length" :type "Number" :static NIL)
     (%flash.geom:length-squared :swf-name "lengthSquared" :type "Number" :static NIL))
    :methods
    ((%flash.geom:equals :swf-name "equals" :return-type "Boolean"
        :args (("toCompare" "flash.geom::Vector3D") &OPTIONAL
               (("allFour" "Boolean") NIL)))
     (%flash.geom:clone :swf-name "clone" :return-type "flash.geom::Vector3D"
        :args NIL)
     (%flash.geom:normalize :swf-name "normalize" :return-type "Number"
        :args NIL)
     (%flash.geom:subtract :swf-name "subtract" :return-type "flash.geom::Vector3D"
        :args (("a" "flash.geom::Vector3D")))
     (%flash.geom:increment-by :swf-name "incrementBy" :return-type "void"
        :args (("a" "flash.geom::Vector3D")))
     (%flash.geom:cross-product :swf-name "crossProduct" :return-type "flash.geom::Vector3D"
        :args (("a" "flash.geom::Vector3D")))
     (%flash.geom:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.geom:decrement-by :swf-name "decrementBy" :return-type "void"
        :args (("a" "flash.geom::Vector3D")))
     (%flash.geom:scale-by :swf-name "scaleBy" :return-type "void"
        :args (("s" "Number")))
     (%flash.geom:near-equals :swf-name "nearEquals" :return-type "Boolean"
        :args (("toCompare" "flash.geom::Vector3D") ("tolerance" "Number")
               &OPTIONAL (("allFour" "Boolean") NIL)))
     (%flash.geom:dot-product :swf-name "dotProduct" :return-type "Number"
        :args (("a" "flash.geom::Vector3D")))
     (%flash.geom:add :swf-name "add" :return-type "flash.geom::Vector3D"
        :args (("a" "flash.geom::Vector3D")))
     (%flash.geom:negate :swf-name "negate" :return-type "void"
        :args NIL)
     (%flash.geom:project :swf-name "project" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:interactive-object (%flash.display:display-object)
    :swf-name "flash.display::InteractiveObject"
    :constants
    ()
    :properties
    ((%flash.display:tab-enabled :swf-name "tabEnabled" :type "void" :static NIL)
     (%flash.display:tab-index :swf-name "tabIndex" :type "int" :static NIL)
     (%flash.display:mouse-enabled :swf-name "mouseEnabled" :type "Boolean" :static NIL)
     (%flash.display:tab-index :swf-name "tabIndex" :type "void" :static NIL)
     (%flash.display:mouse-enabled :swf-name "mouseEnabled" :type "void" :static NIL)
     (%flash.display:double-click-enabled :swf-name "doubleClickEnabled" :type "void" :static NIL)
     (%flash.display:accessibility-implementation :swf-name "accessibilityImplementation" :type "void" :static NIL)
     (%flash.display:context-menu :swf-name "contextMenu" :type "flash.ui::ContextMenu" :static NIL)
     (%flash.display:tab-enabled :swf-name "tabEnabled" :type "Boolean" :static NIL)
     (%flash.display:context-menu :swf-name "contextMenu" :type "void" :static NIL)
     (%flash.display:double-click-enabled :swf-name "doubleClickEnabled" :type "Boolean" :static NIL)
     (%flash.display:focus-rect :swf-name "focusRect" :type "void" :static NIL)
     (%flash.display:focus-rect :swf-name "focusRect" :type "Object" :static NIL)
     (%flash.display:accessibility-implementation :swf-name "accessibilityImplementation" :type "flash.accessibility::AccessibilityImplementation" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:context-menu (%flash.events:event-dispatcher)
    :swf-name "flash.ui::ContextMenu"
    :constants
    ()
    :properties
    ((%flash.ui:custom-items :swf-name "customItems" :type "void" :static NIL)
     (%flash.ui:clipboard-items :swf-name "clipboardItems" :type "void" :static NIL)
     (%flash.ui:link :swf-name "link" :type "flash.net::URLRequest" :static NIL)
     (%flash.ui:clipboard-menu :swf-name "clipboardMenu" :type "Boolean" :static NIL)
     (%flash.ui:link :swf-name "link" :type "void" :static NIL)
     (%flash.ui:clipboard-menu :swf-name "clipboardMenu" :type "void" :static NIL)
     (%flash.ui:custom-items :swf-name "customItems" :type "Array" :static NIL)
     (%flash.ui:clipboard-items :swf-name "clipboardItems" :type "flash.ui::ContextMenuClipboardItems" :static NIL)
     (%flash.ui:built-in-items :swf-name "builtInItems" :type "flash.ui::ContextMenuBuiltInItems" :static NIL)
     (%flash.ui:built-in-items :swf-name "builtInItems" :type "void" :static NIL))
    :methods
    ((%flash.ui:hide-built-in-items :swf-name "hideBuiltInItems" :return-type "void"
        :args NIL)
     (%flash.ui:clone :swf-name "clone" :return-type "flash.ui::ContextMenu"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:kerning (%flash:object)
    :swf-name "flash.text.engine::Kerning"
    :constants
    ((%flash.text.engine:+off+ :swf-name "OFF" :type "String" :value "off")
     (%flash.text.engine:+on+ :swf-name "ON" :type "String" :value "on")
     (%flash.text.engine:+auto+ :swf-name "AUTO" :type "String" :value "auto"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:loader-info (%flash.events:event-dispatcher)
    :swf-name "flash.display::LoaderInfo"
    :constants
    ()
    :properties
    ((%flash.display:child-allows-parent :swf-name "childAllowsParent" :type "Boolean" :static NIL)
     (%flash.display:shared-events :swf-name "sharedEvents" :type "flash.events::EventDispatcher" :static NIL)
     (%flash.display:loader-url :swf-name "loaderURL" :type "String" :static NIL)
     (%flash.display:content :swf-name "content" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:loader :swf-name "loader" :type "flash.display::Loader" :static NIL)
     (%flash.display:bytes-total :swf-name "bytesTotal" :type "uint" :static NIL)
     (%flash.display:action-script-version :swf-name "actionScriptVersion" :type "uint" :static NIL)
     (%flash.display:swf-version :swf-name "swfVersion" :type "uint" :static NIL)
     (%flash.display:application-domain :swf-name "applicationDomain" :type "flash.system::ApplicationDomain" :static NIL)
     (%flash.display:content-type :swf-name "contentType" :type "String" :static NIL)
     (%flash.display:same-domain :swf-name "sameDomain" :type "Boolean" :static NIL)
     (%flash.display:bytes-loaded :swf-name "bytesLoaded" :type "uint" :static NIL)
     (%flash.display:url :swf-name "url" :type "String" :static NIL)
     (%flash.display:frame-rate :swf-name "frameRate" :type "Number" :static NIL)
     (%flash.display:bytes :swf-name "bytes" :type "flash.utils::ByteArray" :static NIL)
     (%flash.display:parameters :swf-name "parameters" :type "Object" :static NIL)
     (%flash.display:parent-allows-child :swf-name "parentAllowsChild" :type "Boolean" :static NIL)
     (%flash.display:height :swf-name "height" :type "int" :static NIL)
     (%flash.display:width :swf-name "width" :type "int" :static NIL))
    :methods
    ((%flash.display:dispatch-event :swf-name "dispatchEvent" :return-type "Boolean"
        :args (("event" "flash.events::Event"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shape (%flash.display:display-object)
    :swf-name "flash.display::Shape"
    :constants
    ()
    :properties
    ((%flash.display:graphics :swf-name "graphics" :type "flash.display::Graphics" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:sync-event (%flash.events:event)
    :swf-name "flash.events::SyncEvent"
    :constants
    ((%flash.events:+sync+ :swf-name "SYNC" :type "String" :value "sync"))
    :properties
    ((%flash.events:change-list :swf-name "changeList" :type "Array" :static NIL)
     (%flash.events:change-list :swf-name "changeList" :type "void" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:bevel-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::BevelFilter"
    :constants
    ()
    :properties
    ((%flash.filters:quality :swf-name "quality" :type "int" :static NIL)
     (%flash.filters:quality :swf-name "quality" :type "void" :static NIL)
     (%flash.filters:shadow-alpha :swf-name "shadowAlpha" :type "void" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "void" :static NIL)
     (%flash.filters:type :swf-name "type" :type "String" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "Number" :static NIL)
     (%flash.filters:type :swf-name "type" :type "void" :static NIL)
     (%flash.filters:distance :swf-name "distance" :type "void" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "void" :static NIL)
     (%flash.filters:shadow-alpha :swf-name "shadowAlpha" :type "Number" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "void" :static NIL)
     (%flash.filters:shadow-color :swf-name "shadowColor" :type "uint" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "void" :static NIL)
     (%flash.filters:highlight-color :swf-name "highlightColor" :type "void" :static NIL)
     (%flash.filters:highlight-alpha :swf-name "highlightAlpha" :type "void" :static NIL)
     (%flash.filters:angle :swf-name "angle" :type "Number" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "Number" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "Number" :static NIL)
     (%flash.filters:highlight-color :swf-name "highlightColor" :type "uint" :static NIL)
     (%flash.filters:highlight-alpha :swf-name "highlightAlpha" :type "Number" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "Boolean" :static NIL)
     (%flash.filters:shadow-color :swf-name "shadowColor" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "Number" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:shader-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::ShaderFilter"
    :constants
    ()
    :properties
    ((%flash.filters:bottom-extension :swf-name "bottomExtension" :type "int" :static NIL)
     (%flash.filters:left-extension :swf-name "leftExtension" :type "int" :static NIL)
     (%flash.filters:top-extension :swf-name "topExtension" :type "void" :static NIL)
     (%flash.filters:top-extension :swf-name "topExtension" :type "int" :static NIL)
     (%flash.filters:left-extension :swf-name "leftExtension" :type "void" :static NIL)
     (%flash.filters:shader :swf-name "shader" :type "void" :static NIL)
     (%flash.filters:bottom-extension :swf-name "bottomExtension" :type "void" :static NIL)
     (%flash.filters:right-extension :swf-name "rightExtension" :type "void" :static NIL)
     (%flash.filters:shader :swf-name "shader" :type "flash.display::Shader" :static NIL)
     (%flash.filters:right-extension :swf-name "rightExtension" :type "int" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:rectangle (%flash:object)
    :swf-name "flash.geom::Rectangle"
    :constants
    ()
    :properties
    ((%flash.geom:top-left :swf-name "topLeft" :type "void" :static NIL)
     (%flash.geom:top-left :swf-name "topLeft" :type "flash.geom::Point" :static NIL)
     (%flash.geom:y :swf-name "y" :type "Number" :value NIL :static NIL)
     (%flash.geom:x :swf-name "x" :type "Number" :value NIL :static NIL)
     (%flash.geom:bottom-right :swf-name "bottomRight" :type "flash.geom::Point" :static NIL)
     (%flash.geom:bottom :swf-name "bottom" :type "Number" :static NIL)
     (%flash.geom:top :swf-name "top" :type "void" :static NIL)
     (%flash.geom:height :swf-name "height" :type "Number" :value NIL :static NIL)
     (%flash.geom:bottom-right :swf-name "bottomRight" :type "void" :static NIL)
     (%flash.geom:right :swf-name "right" :type "Number" :static NIL)
     (%flash.geom:bottom :swf-name "bottom" :type "void" :static NIL)
     (%flash.geom:top :swf-name "top" :type "Number" :static NIL)
     (%flash.geom:right :swf-name "right" :type "void" :static NIL)
     (%flash.geom:left :swf-name "left" :type "void" :static NIL)
     (%flash.geom:left :swf-name "left" :type "Number" :static NIL)
     (%flash.geom:width :swf-name "width" :type "Number" :value NIL :static NIL)
     (%flash.geom:size :swf-name "size" :type "void" :static NIL)
     (%flash.geom:size :swf-name "size" :type "flash.geom::Point" :static NIL))
    :methods
    ((%flash.geom:offset-point :swf-name "offsetPoint" :return-type "void"
        :args (("point" "flash.geom::Point")))
     (%flash.geom:intersects :swf-name "intersects" :return-type "Boolean"
        :args (("toIntersect" "flash.geom::Rectangle")))
     (%flash.geom:contains :swf-name "contains" :return-type "Boolean"
        :args (("x" "Number") ("y" "Number")))
     (%flash.geom:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.geom:contains-rect :swf-name "containsRect" :return-type "Boolean"
        :args (("rect" "flash.geom::Rectangle")))
     (%flash.geom:inflate :swf-name "inflate" :return-type "void"
        :args (("dx" "Number") ("dy" "Number")))
     (%flash.geom:clone :swf-name "clone" :return-type "flash.geom::Rectangle"
        :args NIL)
     (%flash.geom:intersection :swf-name "intersection" :return-type "flash.geom::Rectangle"
        :args (("toIntersect" "flash.geom::Rectangle")))
     (%flash.geom:equals :swf-name "equals" :return-type "Boolean"
        :args (("toCompare" "flash.geom::Rectangle")))
     (%flash.geom:offset :swf-name "offset" :return-type "void"
        :args (("dx" "Number") ("dy" "Number")))
     (%flash.geom:union :swf-name "union" :return-type "flash.geom::Rectangle"
        :args (("toUnion" "flash.geom::Rectangle")))
     (%flash.geom:set-empty :swf-name "setEmpty" :return-type "void"
        :args NIL)
     (%flash.geom:inflate-point :swf-name "inflatePoint" :return-type "void"
        :args (("point" "flash.geom::Point")))
     (%flash.geom:is-empty :swf-name "isEmpty" :return-type "Boolean"
        :args NIL)
     (%flash.geom:contains-point :swf-name "containsPoint" :return-type "Boolean"
        :args (("point" "flash.geom::Point"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:swf-version (%flash:object)
    :swf-name "flash.display::SWFVersion"
    :constants
    ((%flash.display:+flash9+ :swf-name "FLASH9" :type "uint" :value 9)
     (%flash.display:+flash10+ :swf-name "FLASH10" :type "uint" :value 10)
     (%flash.display:+flash2+ :swf-name "FLASH2" :type "uint" :value 2)
     (%flash.display:+flash8+ :swf-name "FLASH8" :type "uint" :value 8)
     (%flash.display:+flash6+ :swf-name "FLASH6" :type "uint" :value 6)
     (%flash.display:+flash4+ :swf-name "FLASH4" :type "uint" :value 4)
     (%flash.display:+flash7+ :swf-name "FLASH7" :type "uint" :value 7)
     (%flash.display:+flash5+ :swf-name "FLASH5" :type "uint" :value 5)
     (%flash.display:+flash3+ :swf-name "FLASH3" :type "uint" :value 3)
     (%flash.display:+flash1+ :swf-name "FLASH1" :type "uint" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:responder (%flash:object)
    :swf-name "flash.net::Responder"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:capabilities (%flash:object)
    :swf-name "flash.system::Capabilities"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:net-stream-info (%flash:object)
    :swf-name "flash.net::NetStreamInfo"
    :constants
    ()
    :properties
    ((%flash.net:byte-count :swf-name "byteCount" :type "Number" :static NIL)
     (%flash.net:audio-buffer-byte-length :swf-name "audioBufferByteLength" :type "Number" :static NIL)
     (%flash.net:video-buffer-length :swf-name "videoBufferLength" :type "Number" :static NIL)
     (%flash.net:audio-buffer-length :swf-name "audioBufferLength" :type "Number" :static NIL)
     (%flash.net:data-byte-count :swf-name "dataByteCount" :type "Number" :static NIL)
     (%flash.net:max-bytes-per-second :swf-name "maxBytesPerSecond" :type "Number" :static NIL)
     (%flash.net:playback-bytes-per-second :swf-name "playbackBytesPerSecond" :type "Number" :static NIL)
     (%flash.net:data-buffer-byte-length :swf-name "dataBufferByteLength" :type "Number" :static NIL)
     (%flash.net:audio-bytes-per-second :swf-name "audioBytesPerSecond" :type "Number" :static NIL)
     (%flash.net:audio-byte-count :swf-name "audioByteCount" :type "Number" :static NIL)
     (%flash.net:srtt :swf-name "SRTT" :type "Number" :static NIL)
     (%flash.net:video-byte-count :swf-name "videoByteCount" :type "Number" :static NIL)
     (%flash.net:video-bytes-per-second :swf-name "videoBytesPerSecond" :type "Number" :static NIL)
     (%flash.net:current-bytes-per-second :swf-name "currentBytesPerSecond" :type "Number" :static NIL)
     (%flash.net:audio-loss-rate :swf-name "audioLossRate" :type "Number" :static NIL)
     (%flash.net:data-buffer-length :swf-name "dataBufferLength" :type "Number" :static NIL)
     (%flash.net:data-bytes-per-second :swf-name "dataBytesPerSecond" :type "Number" :static NIL)
     (%flash.net:dropped-frames :swf-name "droppedFrames" :type "Number" :static NIL)
     (%flash.net:video-buffer-byte-length :swf-name "videoBufferByteLength" :type "Number" :static NIL))
    :methods
    ((%flash.net:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-element (%flash.text.engine:content-element)
    :swf-name "flash.text.engine::TextElement"
    :constants
    ()
    :properties
    ((%flash.text.engine:text :swf-name "text" :type "void" :static NIL))
    :methods
    ((%flash.text.engine:replace-text :swf-name "replaceText" :return-type "void"
        :args (("beginIndex" "int") ("endIndex" "int") ("newText" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:i-dynamic-property-output ()
    :swf-name "flash.net::IDynamicPropertyOutput"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.net:write-dynamic-property :swf-name "writeDynamicProperty" :return-type "void"
        :args (("name" "String") "value")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:justification-style (%flash:object)
    :swf-name "flash.text.engine::JustificationStyle"
    :constants
    ((%flash.text.engine:+push-out-only+ :swf-name "PUSH_OUT_ONLY" :type "String" :value "pushOutOnly")
     (%flash.text.engine:+prioritize-least-adjustment+ :swf-name "PRIORITIZE_LEAST_ADJUSTMENT" :type "String" :value "prioritizeLeastAdjustment")
     (%flash.text.engine:+push-in-kinsoku+ :swf-name "PUSH_IN_KINSOKU" :type "String" :value "pushInKinsoku"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:stage-display-state (%flash:object)
    :swf-name "flash.display::StageDisplayState"
    :constants
    ((%flash.display:+normal+ :swf-name "NORMAL" :type "String" :value "normal")
     (%flash.display:+full-screen+ :swf-name "FULL_SCREEN" :type "String" :value "fullScreen"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %adobe.utils:product-manager (%flash.events:event-dispatcher)
    :swf-name "adobe.utils::ProductManager"
    :constants
    ()
    :properties
    ((%adobe.utils:running :swf-name "running" :type "Boolean" :static NIL)
     (%adobe.utils:installed-version :swf-name "installedVersion" :type "String" :static NIL)
     (%adobe.utils:installed :swf-name "installed" :type "Boolean" :static NIL))
    :methods
    ((%adobe.utils:download :swf-name "download" :return-type "Boolean"
        :args (&OPTIONAL ("caption" "String") ("fileName" "String")
               ("pathElements" "Array")))
     (%adobe.utils:launch :swf-name "launch" :return-type "Boolean"
        :args (&OPTIONAL ("parameters" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:frame-label (%flash:object)
    :swf-name "flash.display::FrameLabel"
    :constants
    ()
    :properties
    ((%flash.display:frame :swf-name "frame" :type "int" :static NIL)
     (%flash.display:name :swf-name "name" :type "String" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:element-format (%flash:object)
    :swf-name "flash.text.engine::ElementFormat"
    :constants
    ()
    :properties
    ((%flash.text.engine:digit-case :swf-name "digitCase" :type "String" :static NIL)
     (%flash.text.engine:alpha :swf-name "alpha" :type "void" :static NIL)
     (%flash.text.engine:typographic-case :swf-name "typographicCase" :type "String" :static NIL)
     (%flash.text.engine:digit-case :swf-name "digitCase" :type "void" :static NIL)
     (%flash.text.engine:ligature-level :swf-name "ligatureLevel" :type "String" :static NIL)
     (%flash.text.engine:tracking-left :swf-name "trackingLeft" :type "Number" :static NIL)
     (%flash.text.engine:locale :swf-name "locale" :type "void" :static NIL)
     (%flash.text.engine:digit-width :swf-name "digitWidth" :type "void" :static NIL)
     (%flash.text.engine:font-size :swf-name "fontSize" :type "Number" :static NIL)
     (%flash.text.engine:typographic-case :swf-name "typographicCase" :type "void" :static NIL)
     (%flash.text.engine:font-description :swf-name "fontDescription" :type "flash.text.engine::FontDescription" :static NIL)
     (%flash.text.engine:break-opportunity :swf-name "breakOpportunity" :type "void" :static NIL)
     (%flash.text.engine:tracking-right :swf-name "trackingRight" :type "Number" :static NIL)
     (%flash.text.engine:color :swf-name "color" :type "uint" :static NIL)
     (%flash.text.engine:locked :swf-name "locked" :type "Boolean" :static NIL)
     (%flash.text.engine:locale :swf-name "locale" :type "String" :static NIL)
     (%flash.text.engine:font-size :swf-name "fontSize" :type "void" :static NIL)
     (%flash.text.engine:ligature-level :swf-name "ligatureLevel" :type "void" :static NIL)
     (%flash.text.engine:alpha :swf-name "alpha" :type "Number" :static NIL)
     (%flash.text.engine:locked :swf-name "locked" :type "void" :static NIL)
     (%flash.text.engine:font-description :swf-name "fontDescription" :type "void" :static NIL)
     (%flash.text.engine:digit-width :swf-name "digitWidth" :type "String" :static NIL)
     (%flash.text.engine:kerning :swf-name "kerning" :type "void" :static NIL)
     (%flash.text.engine:text-rotation :swf-name "textRotation" :type "void" :static NIL)
     (%flash.text.engine:break-opportunity :swf-name "breakOpportunity" :type "String" :static NIL)
     (%flash.text.engine:tracking-right :swf-name "trackingRight" :type "void" :static NIL)
     (%flash.text.engine:alignment-baseline :swf-name "alignmentBaseline" :type "void" :static NIL)
     (%flash.text.engine:kerning :swf-name "kerning" :type "String" :static NIL)
     (%flash.text.engine:text-rotation :swf-name "textRotation" :type "String" :static NIL)
     (%flash.text.engine:dominant-baseline :swf-name "dominantBaseline" :type "void" :static NIL)
     (%flash.text.engine:alignment-baseline :swf-name "alignmentBaseline" :type "String" :static NIL)
     (%flash.text.engine:color :swf-name "color" :type "void" :static NIL)
     (%flash.text.engine:dominant-baseline :swf-name "dominantBaseline" :type "String" :static NIL)
     (%flash.text.engine:baseline-shift :swf-name "baselineShift" :type "Number" :static NIL)
     (%flash.text.engine:tracking-left :swf-name "trackingLeft" :type "void" :static NIL)
     (%flash.text.engine:baseline-shift :swf-name "baselineShift" :type "void" :static NIL))
    :methods
    ((%flash.text.engine:get-font-metrics :swf-name "getFontMetrics" :return-type "flash.text.engine::FontMetrics"
        :args NIL)
     (%flash.text.engine:clone :swf-name "clone" :return-type "flash.text.engine::ElementFormat"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shader-parameter (%flash:object)
    :swf-name "flash.display::ShaderParameter"
    :constants
    ()
    :properties
    ((%flash.display:index :swf-name "index" :type "int" :static NIL)
     (%flash.display:type :swf-name "type" :type "String" :static NIL)
     (%flash.display:value :swf-name "value" :type "void" :static NIL)
     (%flash.display:value :swf-name "value" :type "Array" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shader-job (%flash.events:event-dispatcher)
    :swf-name "flash.display::ShaderJob"
    :constants
    ()
    :properties
    ((%flash.display:target :swf-name "target" :type "Object" :static NIL)
     (%flash.display:height :swf-name "height" :type "void" :static NIL)
     (%flash.display:progress :swf-name "progress" :type "Number" :static NIL)
     (%flash.display:width :swf-name "width" :type "void" :static NIL)
     (%flash.display:shader :swf-name "shader" :type "void" :static NIL)
     (%flash.display:target :swf-name "target" :type "void" :static NIL)
     (%flash.display:height :swf-name "height" :type "int" :static NIL)
     (%flash.display:width :swf-name "width" :type "int" :static NIL)
     (%flash.display:shader :swf-name "shader" :type "flash.display::Shader" :static NIL))
    :methods
    ((%flash.display:cancel :swf-name "cancel" :return-type "void"
        :args NIL)
     (%flash.display:start :swf-name "start" :return-type "void"
        :args (&OPTIONAL (("waitForCompletion" "Boolean") NIL))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:color-correction (%flash:object)
    :swf-name "flash.display::ColorCorrection"
    :constants
    ((%flash.display:+off+ :swf-name "OFF" :type "String" :value "off")
     (%flash.display:+on+ :swf-name "ON" :type "String" :value "on")
     (%flash.display:+default+ :swf-name "DEFAULT" :type "String" :value "default"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-format-align (%flash:object)
    :swf-name "flash.text::TextFormatAlign"
    :constants
    ((%flash.text:+right+ :swf-name "RIGHT" :type "String" :value "right")
     (%flash.text:+left+ :swf-name "LEFT" :type "String" :value "left")
     (%flash.text:+center+ :swf-name "CENTER" :type "String" :value "center")
     (%flash.text:+justify+ :swf-name "JUSTIFY" :type "String" :value "justify"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:dictionary (%flash:object)
    :swf-name "flash.utils::Dictionary"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:shared-object (%flash.events:event-dispatcher)
    :swf-name "flash.net::SharedObject"
    :constants
    ()
    :properties
    ((%flash.net:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.net:client :swf-name "client" :type "void" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.net:fps :swf-name "fps" :type "void" :static NIL)
     (%flash.net:client :swf-name "client" :type "Object" :static NIL)
     (%flash.net:data :swf-name "data" :type "Object" :static NIL)
     (%flash.net:size :swf-name "size" :type "uint" :static NIL))
    :methods
    ((%flash.net:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.net:set-property :swf-name "setProperty" :return-type "void"
        :args (("propertyName" "String") &OPTIONAL ("value" "Object")))
     (%flash.net:connect :swf-name "connect" :return-type "void"
        :args (("myConnection" "flash.net::NetConnection") &OPTIONAL
               ("params" "String")))
     (%flash.net:set-dirty :swf-name "setDirty" :return-type "void"
        :args (("propertyName" "String")))
     (%flash.net:clear :swf-name "clear" :return-type "void"
        :args NIL)
     (%flash.net:send :swf-name "send" :return-type "void"
        :args NIL)
     (%flash.net:flush :swf-name "flush" :return-type "String"
        :args (&OPTIONAL (("minDiskSpace" "int") 0))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:socket (%flash.events:event-dispatcher)
    :swf-name "flash.net::Socket"
    :constants
    ()
    :properties
    ((%flash.net:timeout :swf-name "timeout" :type "uint" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.net:timeout :swf-name "timeout" :type "void" :static NIL)
     (%flash.net:endian :swf-name "endian" :type "void" :static NIL)
     (%flash.net:bytes-available :swf-name "bytesAvailable" :type "uint" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.net:endian :swf-name "endian" :type "String" :static NIL)
     (%flash.net:connected :swf-name "connected" :type "Boolean" :static NIL))
    :methods
    ((%flash.net:read-int :swf-name "readInt" :return-type "int"
        :args NIL)
     (%flash.net:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.net:read-bytes :swf-name "readBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.net:read-multi-byte :swf-name "readMultiByte" :return-type "String"
        :args (("length" "uint") ("charSet" "String")))
     (%flash.net:connect :swf-name "connect" :return-type "void"
        :args (("host" "String") ("port" "int")))
     (%flash.net:read-float :swf-name "readFloat" :return-type "Number"
        :args NIL)
     (%flash.net:write-short :swf-name "writeShort" :return-type "void"
        :args (("value" "int")))
     (%flash.net:write-unsigned-int :swf-name "writeUnsignedInt" :return-type "void"
        :args (("value" "uint")))
     (%flash.net:read-unsigned-byte :swf-name "readUnsignedByte" :return-type "uint"
        :args NIL)
     (%flash.net:write-multi-byte :swf-name "writeMultiByte" :return-type "void"
        :args (("value" "String") ("charSet" "String")))
     (%flash.net:write-bytes :swf-name "writeBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.net:read-unsigned-int :swf-name "readUnsignedInt" :return-type "uint"
        :args NIL)
     (%flash.net:write-boolean :swf-name "writeBoolean" :return-type "void"
        :args (("value" "Boolean")))
     (%flash.net:write-utf :swf-name "writeUTF" :return-type "void"
        :args (("value" "String")))
     (%flash.net:read-byte :swf-name "readByte" :return-type "int"
        :args NIL)
     (%flash.net:write-float :swf-name "writeFloat" :return-type "void"
        :args (("value" "Number")))
     (%flash.net:read-utf-bytes :swf-name "readUTFBytes" :return-type "String"
        :args (("length" "uint")))
     (%flash.net:read-boolean :swf-name "readBoolean" :return-type "Boolean"
        :args NIL)
     (%flash.net:read-utf :swf-name "readUTF" :return-type "String"
        :args NIL)
     (%flash.net:read-object :swf-name "readObject" :return-type "*"
        :args NIL)
     (%flash.net:write-double :swf-name "writeDouble" :return-type "void"
        :args (("value" "Number")))
     (%flash.net:write-int :swf-name "writeInt" :return-type "void"
        :args (("value" "int")))
     (%flash.net:read-double :swf-name "readDouble" :return-type "Number"
        :args NIL)
     (%flash.net:read-unsigned-short :swf-name "readUnsignedShort" :return-type "uint"
        :args NIL)
     (%flash.net:read-short :swf-name "readShort" :return-type "int"
        :args NIL)
     (%flash.net:write-byte :swf-name "writeByte" :return-type "void"
        :args (("value" "int")))
     (%flash.net:write-object :swf-name "writeObject" :return-type "void"
        :args ("object"))
     (%flash.net:flush :swf-name "flush" :return-type "void"
        :args NIL)
     (%flash.net:write-utf-bytes :swf-name "writeUTFBytes" :return-type "void"
        :args (("value" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:color-matrix-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::ColorMatrixFilter"
    :constants
    ()
    :properties
    ((%flash.filters:matrix :swf-name "matrix" :type "void" :static NIL)
     (%flash.filters:matrix :swf-name "matrix" :type "Array" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:bitmap-filter-type (%flash:object)
    :swf-name "flash.filters::BitmapFilterType"
    :constants
    ((%flash.filters:+full+ :swf-name "FULL" :type "String" :value "full")
     (%flash.filters:+inner+ :swf-name "INNER" :type "String" :value "inner")
     (%flash.filters:+outer+ :swf-name "OUTER" :type "String" :value "outer"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-color-type (%flash:object)
    :swf-name "flash.text::TextColorType"
    :constants
    ((%flash.text:+light-color+ :swf-name "LIGHT_COLOR" :type "String" :value "light")
     (%flash.text:+dark-color+ :swf-name "DARK_COLOR" :type "String" :value "dark"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:displacement-map-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::DisplacementMapFilter"
    :constants
    ()
    :properties
    ((%flash.filters:scale-y :swf-name "scaleY" :type "void" :static NIL)
     (%flash.filters:map-bitmap :swf-name "mapBitmap" :type "void" :static NIL)
     (%flash.filters:scale-x :swf-name "scaleX" :type "void" :static NIL)
     (%flash.filters:component-x :swf-name "componentX" :type "uint" :static NIL)
     (%flash.filters:component-y :swf-name "componentY" :type "void" :static NIL)
     (%flash.filters:component-x :swf-name "componentX" :type "void" :static NIL)
     (%flash.filters:map-point :swf-name "mapPoint" :type "flash.geom::Point" :static NIL)
     (%flash.filters:color :swf-name "color" :type "uint" :static NIL)
     (%flash.filters:scale-y :swf-name "scaleY" :type "Number" :static NIL)
     (%flash.filters:scale-x :swf-name "scaleX" :type "Number" :static NIL)
     (%flash.filters:color :swf-name "color" :type "void" :static NIL)
     (%flash.filters:map-bitmap :swf-name "mapBitmap" :type "flash.display::BitmapData" :static NIL)
     (%flash.filters:mode :swf-name "mode" :type "String" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "void" :static NIL)
     (%flash.filters:map-point :swf-name "mapPoint" :type "void" :static NIL)
     (%flash.filters:mode :swf-name "mode" :type "void" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "Number" :static NIL)
     (%flash.filters:component-y :swf-name "componentY" :type "uint" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-path-winding (%flash:object)
    :swf-name "flash.display::GraphicsPathWinding"
    :constants
    ((%flash.display:+non-zero+ :swf-name "NON_ZERO" :type "String" :value "nonZero")
     (%flash.display:+even-odd+ :swf-name "EVEN_ODD" :type "String" :value "evenOdd"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:i-dynamic-property-writer ()
    :swf-name "flash.net::IDynamicPropertyWriter"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.net:write-dynamic-properties :swf-name "writeDynamicProperties" :return-type "void"
        :args (("obj" "Object") ("output" "flash.net::IDynamicPropertyOutput"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.external:external-interface (%flash:object)
    :swf-name "flash.external::ExternalInterface"
    :constants
    ()
    :properties
    ((%flash.external:marshall-exceptions :swf-name "marshallExceptions" :type "Boolean" :value NIL :static T))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-run (%flash:object)
    :swf-name "flash.text::TextRun"
    :constants
    ()
    :properties
    ((%flash.text:begin-index :swf-name "beginIndex" :type "int" :value NIL :static NIL)
     (%flash.text:end-index :swf-name "endIndex" :type "int" :value NIL :static NIL)
     (%flash.text:text-format :swf-name "textFormat" :type "flash.text::TextFormat" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shader (%flash:object)
    :swf-name "flash.display::Shader"
    :constants
    ()
    :properties
    ((%flash.display:precision-hint :swf-name "precisionHint" :type "void" :static NIL)
     (%flash.display:data :swf-name "data" :type "flash.display::ShaderData" :static NIL)
     (%flash.display:precision-hint :swf-name "precisionHint" :type "String" :static NIL)
     (%flash.display:data :swf-name "data" :type "void" :static NIL)
     (%flash.display:byte-code :swf-name "byteCode" :type "void" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:video (%flash.display:display-object)
    :swf-name "flash.media::Video"
    :constants
    ()
    :properties
    ((%flash.media:deblocking :swf-name "deblocking" :type "void" :static NIL)
     (%flash.media:video-width :swf-name "videoWidth" :type "int" :static NIL)
     (%flash.media:smoothing :swf-name "smoothing" :type "void" :static NIL)
     (%flash.media:deblocking :swf-name "deblocking" :type "int" :static NIL)
     (%flash.media:smoothing :swf-name "smoothing" :type "Boolean" :static NIL)
     (%flash.media:video-height :swf-name "videoHeight" :type "int" :static NIL))
    :methods
    ((%flash.media:attach-net-stream :swf-name "attachNetStream" :return-type "void"
        :args (("netStream" "flash.net::NetStream")))
     (%flash.media:clear :swf-name "clear" :return-type "void"
        :args NIL)
     (%flash.media:attach-camera :swf-name "attachCamera" :return-type "void"
        :args (("camera" "flash.media::Camera"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-format-display (%flash:object)
    :swf-name "flash.text::TextFormatDisplay"
    :constants
    ((%flash.text:+block+ :swf-name "BLOCK" :type "String" :value "block")
     (%flash.text:+inline+ :swf-name "INLINE" :type "String" :value "inline"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:id3info (%flash:object)
    :swf-name "flash.media::ID3Info"
    :constants
    ()
    :properties
    ((%flash.media:comment :swf-name "comment" :type "String" :value NIL :static NIL)
     (%flash.media:year :swf-name "year" :type "String" :value NIL :static NIL)
     (%flash.media:album :swf-name "album" :type "String" :value NIL :static NIL)
     (%flash.media:track :swf-name "track" :type "String" :value NIL :static NIL)
     (%flash.media:artist :swf-name "artist" :type "String" :value NIL :static NIL)
     (%flash.media:genre :swf-name "genre" :type "String" :value NIL :static NIL)
     (%flash.media:song-name :swf-name "songName" :type "String" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:sound-transform (%flash:object)
    :swf-name "flash.media::SoundTransform"
    :constants
    ()
    :properties
    ((%flash.media:right-to-left :swf-name "rightToLeft" :type "Number" :static NIL)
     (%flash.media:pan :swf-name "pan" :type "Number" :static NIL)
     (%flash.media:right-to-left :swf-name "rightToLeft" :type "void" :static NIL)
     (%flash.media:volume :swf-name "volume" :type "void" :static NIL)
     (%flash.media:left-to-right :swf-name "leftToRight" :type "Number" :static NIL)
     (%flash.media:left-to-right :swf-name "leftToRight" :type "void" :static NIL)
     (%flash.media:left-to-left :swf-name "leftToLeft" :type "void" :static NIL)
     (%flash.media:right-to-right :swf-name "rightToRight" :type "void" :static NIL)
     (%flash.media:left-to-left :swf-name "leftToLeft" :type "Number" :static NIL)
     (%flash.media:volume :swf-name "volume" :type "Number" :static NIL)
     (%flash.media:right-to-right :swf-name "rightToRight" :type "Number" :static NIL)
     (%flash.media:pan :swf-name "pan" :type "void" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.trace:trace (%flash:object)
    :swf-name "flash.trace::Trace"
    :constants
    ((%flash.trace:+file+ :swf-name "FILE" :type "null" :value 1)
     (%flash.trace:+listener+ :swf-name "LISTENER" :type "null" :value 2)
     (%flash.trace:+methods+ :swf-name "METHODS" :type "int" :value 1)
     (%flash.trace:+methods-with-args+ :swf-name "METHODS_WITH_ARGS" :type "int" :value 2)
     (%flash.trace:+off+ :swf-name "OFF" :type "int" :value 0)
     (%flash.trace:+methods-and-lines+ :swf-name "METHODS_AND_LINES" :type "int" :value 3)
     (%flash.trace:+methods-and-lines-with-args+ :swf-name "METHODS_AND_LINES_WITH_ARGS" :type "int" :value 4))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-snapshot (%flash:object)
    :swf-name "flash.text::TextSnapshot"
    :constants
    ()
    :properties
    ((%flash.text:char-count :swf-name "charCount" :type "int" :static NIL))
    :methods
    ((%flash.text:get-selected-text :swf-name "getSelectedText" :return-type "String"
        :args (&OPTIONAL (("includeLineEndings" "Boolean") NIL)))
     (%flash.text:get-text-run-info :swf-name "getTextRunInfo" :return-type "Array"
        :args (("beginIndex" "int") ("endIndex" "int")))
     (%flash.text:hit-test-text-near-pos :swf-name "hitTestTextNearPos" :return-type "Number"
        :args (("x" "Number") ("y" "Number") &OPTIONAL
               (("maxDistance" "Number") 0)))
     (%flash.text:find-text :swf-name "findText" :return-type "int"
        :args (("beginIndex" "int") ("textToFind" "String")
               ("caseSensitive" "Boolean")))
     (%flash.text:set-select-color :swf-name "setSelectColor" :return-type "void"
        :args (&OPTIONAL (("hexColor" "uint") 16776960)))
     (%flash.text:set-selected :swf-name "setSelected" :return-type "void"
        :args (("beginIndex" "int") ("endIndex" "int") ("select" "Boolean")))
     (%flash.text:get-text :swf-name "getText" :return-type "String"
        :args (("beginIndex" "int") ("endIndex" "int") &OPTIONAL
               (("includeLineEndings" "Boolean") NIL)))
     (%flash.text:get-selected :swf-name "getSelected" :return-type "Boolean"
        :args (("beginIndex" "int") ("endIndex" "int"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:interpolation-method (%flash:object)
    :swf-name "flash.display::InterpolationMethod"
    :constants
    ((%flash.display:+rgb+ :swf-name "RGB" :type "String" :value "rgb")
     (%flash.display:+linear-rgb+ :swf-name "LINEAR_RGB" :type "String" :value "linearRGB"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:context-menu-built-in-items (%flash:object)
    :swf-name "flash.ui::ContextMenuBuiltInItems"
    :constants
    ()
    :properties
    ((%flash.ui:quality :swf-name "quality" :type "Boolean" :value T :static NIL)
     (%flash.ui:save :swf-name "save" :type "Boolean" :value T :static NIL)
     (%flash.ui:rewind :swf-name "rewind" :type "Boolean" :value T :static NIL)
     (%flash.ui:forward-and-back :swf-name "forwardAndBack" :type "Boolean" :value T :static NIL)
     (%flash.ui:play :swf-name "play" :type "Boolean" :value T :static NIL)
     (%flash.ui:zoom :swf-name "zoom" :type "Boolean" :value T :static NIL)
     (%flash.ui:print :swf-name "print" :type "Boolean" :value T :static NIL)
     (%flash.ui:loop :swf-name "loop" :type "Boolean" :value T :static NIL))
    :methods
    ((%flash.ui:clone :swf-name "clone" :return-type "flash.ui::ContextMenuBuiltInItems"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-extent (%flash:object)
    :swf-name "flash.text::TextExtent"
    :constants
    ()
    :properties
    ((%flash.text:text-field-height :swf-name "textFieldHeight" :type "Number" :value NIL :static NIL)
     (%flash.text:descent :swf-name "descent" :type "Number" :value NIL :static NIL)
     (%flash.text:text-field-width :swf-name "textFieldWidth" :type "Number" :value NIL :static NIL)
     (%flash.text:height :swf-name "height" :type "Number" :value NIL :static NIL)
     (%flash.text:width :swf-name "width" :type "Number" :value NIL :static NIL)
     (%flash.text:ascent :swf-name "ascent" :type "Number" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:cff-hinting (%flash:object)
    :swf-name "flash.text.engine::CFFHinting"
    :constants
    ((%flash.text.engine:+horizontal-stem+ :swf-name "HORIZONTAL_STEM" :type "String" :value "horizontalStem")
     (%flash.text.engine:+none+ :swf-name "NONE" :type "String" :value "none"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:security-domain (%flash:object)
    :swf-name "flash.system::SecurityDomain"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash:date (%flash:object)
    :swf-name "Date"
    :constants
    ((%flash:+length+ :swf-name "length" :type "int" :value 7))
    :properties
    ((%flash:seconds :swf-name "seconds" :type "Number" :static NIL)
     (%flash:seconds :swf-name "seconds" :type "*" :static NIL)
     (%flash:timezone-offset :swf-name "timezoneOffset" :type "Number" :static NIL)
     (%flash:full-year :swf-name "fullYear" :type "Number" :static NIL)
     (%flash:milliseconds-utc :swf-name "millisecondsUTC" :type "Number" :static NIL)
     (%flash:day-utc :swf-name "dayUTC" :type "Number" :static NIL)
     (%flash:time :swf-name "time" :type "Number" :static NIL)
     (%flash:milliseconds-utc :swf-name "millisecondsUTC" :type "*" :static NIL)
     (%flash:minutes :swf-name "minutes" :type "Number" :static NIL)
     (%flash:date :swf-name "date" :type "*" :static NIL)
     (%flash:full-year :swf-name "fullYear" :type "*" :static NIL)
     (%flash:minutes :swf-name "minutes" :type "*" :static NIL)
     (%flash:seconds-utc :swf-name "secondsUTC" :type "*" :static NIL)
     (%flash:minutes-utc :swf-name "minutesUTC" :type "Number" :static NIL)
     (%flash:full-year-utc :swf-name "fullYearUTC" :type "*" :static NIL)
     (%flash:hours-utc :swf-name "hoursUTC" :type "*" :static NIL)
     (%flash:date-utc :swf-name "dateUTC" :type "*" :static NIL)
     (%flash:date :swf-name "date" :type "Number" :static NIL)
     (%flash:milliseconds :swf-name "milliseconds" :type "*" :static NIL)
     (%flash:month-utc :swf-name "monthUTC" :type "*" :static NIL)
     (%flash:seconds-utc :swf-name "secondsUTC" :type "Number" :static NIL)
     (%flash:time :swf-name "time" :type "*" :static NIL)
     (%flash:hours :swf-name "hours" :type "*" :static NIL)
     (%flash:day :swf-name "day" :type "Number" :static NIL)
     (%flash:full-year-utc :swf-name "fullYearUTC" :type "Number" :static NIL)
     (%flash:date-utc :swf-name "dateUTC" :type "Number" :static NIL)
     (%flash:hours-utc :swf-name "hoursUTC" :type "Number" :static NIL)
     (%flash:milliseconds :swf-name "milliseconds" :type "Number" :static NIL)
     (%flash:hours :swf-name "hours" :type "Number" :static NIL)
     (%flash:minutes-utc :swf-name "minutesUTC" :type "*" :static NIL)
     (%flash:month :swf-name "month" :type "*" :static NIL)
     (%flash:month-utc :swf-name "monthUTC" :type "Number" :static NIL)
     (%flash:month :swf-name "month" :type "Number" :static NIL))
    :methods
    ((%flash:get-utc-full-year :swf-name "getUTCFullYear" :return-type "Number"
        :args NIL)
     (%flash:set-utc-full-year :swf-name "setUTCFullYear" :return-type "Number"
        :args (&OPTIONAL "year" "month" "date"))
     (%flash:to-locale-date-string :swf-name "toLocaleDateString" :return-type "String"
        :args NIL)
     (%flash:set-full-year :swf-name "setFullYear" :return-type "Number"
        :args (&OPTIONAL "year" "month" "date"))
     (%flash:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash:get-full-year :swf-name "getFullYear" :return-type "Number"
        :args NIL)
     (%flash:get-day :swf-name "getDay" :return-type "Number"
        :args NIL)
     (%flash:get-timezone-offset :swf-name "getTimezoneOffset" :return-type "Number"
        :args NIL)
     (%flash:get-hours :swf-name "getHours" :return-type "Number"
        :args NIL)
     (%flash:set-utc-hours :swf-name "setUTCHours" :return-type "Number"
        :args (&OPTIONAL "hour" "min" "sec" "ms"))
     (%flash:to-locale-time-string :swf-name "toLocaleTimeString" :return-type "String"
        :args NIL)
     (%flash:set-time :swf-name "setTime" :return-type "Number"
        :args (&OPTIONAL "t"))
     (%flash:get-utc-day :swf-name "getUTCDay" :return-type "Number"
        :args NIL)
     (%flash:set-hours :swf-name "setHours" :return-type "Number"
        :args (&OPTIONAL "hour" "min" "sec" "ms"))
     (%flash:get-month :swf-name "getMonth" :return-type "Number"
        :args NIL)
     (%flash:get-seconds :swf-name "getSeconds" :return-type "Number"
        :args NIL)
     (%flash:set-month :swf-name "setMonth" :return-type "Number"
        :args (&OPTIONAL "month" "date"))
     (%flash:set-seconds :swf-name "setSeconds" :return-type "Number"
        :args (&OPTIONAL "sec" "ms"))
     (%flash:get-time :swf-name "getTime" :return-type "Number"
        :args NIL)
     (%flash:get-utc-hours :swf-name "getUTCHours" :return-type "Number"
        :args NIL)
     (%flash:set-utc-month :swf-name "setUTCMonth" :return-type "Number"
        :args (&OPTIONAL "month" "date"))
     (%flash:set-utc-seconds :swf-name "setUTCSeconds" :return-type "Number"
        :args (&OPTIONAL "sec" "ms"))
     (%flash:get-utc-date :swf-name "getUTCDate" :return-type "Number"
        :args NIL)
     (%flash:to-date-string :swf-name "toDateString" :return-type "String"
        :args NIL)
     (%flash:set-utc-date :swf-name "setUTCDate" :return-type "Number"
        :args (&OPTIONAL "date"))
     (%flash:get-utc-month :swf-name "getUTCMonth" :return-type "Number"
        :args NIL)
     (%flash:get-utc-seconds :swf-name "getUTCSeconds" :return-type "Number"
        :args NIL)
     (%flash:set-date :swf-name "setDate" :return-type "Number"
        :args (&OPTIONAL "date"))
     (%flash:set-utc-minutes :swf-name "setUTCMinutes" :return-type "Number"
        :args (&OPTIONAL "min" "sec" "ms"))
     (%flash:get-minutes :swf-name "getMinutes" :return-type "Number"
        :args NIL)
     (%flash:value-of :swf-name "valueOf" :return-type "Number"
        :args NIL)
     (%flash:to-locale-string :swf-name "toLocaleString" :return-type "String"
        :args NIL)
     (%flash:get-date :swf-name "getDate" :return-type "Number"
        :args NIL)
     (%flash:get-utc-milliseconds :swf-name "getUTCMilliseconds" :return-type "Number"
        :args NIL)
     (%flash:set-minutes :swf-name "setMinutes" :return-type "Number"
        :args (&OPTIONAL "min" "sec" "ms"))
     (%flash:set-utc-milliseconds :swf-name "setUTCMilliseconds" :return-type "Number"
        :args (&OPTIONAL "ms"))
     (%flash:to-utc-string :swf-name "toUTCString" :return-type "String"
        :args NIL)
     (%flash:to-time-string :swf-name "toTimeString" :return-type "String"
        :args NIL)
     (%flash:set-milliseconds :swf-name "setMilliseconds" :return-type "Number"
        :args (&OPTIONAL "ms"))
     (%flash:get-utc-minutes :swf-name "getUTCMinutes" :return-type "Number"
        :args NIL)
     (%flash:get-milliseconds :swf-name "getMilliseconds" :return-type "Number"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:dynamic-property-output (%flash:object)
    :swf-name "flash.net::DynamicPropertyOutput"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.net:write-dynamic-property :swf-name "writeDynamicProperty" :return-type "void"
        :args (("name" "String") "value")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:blur-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::BlurFilter"
    :constants
    ()
    :properties
    ((%flash.filters:quality :swf-name "quality" :type "int" :static NIL)
     (%flash.filters:quality :swf-name "quality" :type "void" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "Number" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "void" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "void" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "Number" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-bitmap-fill (%flash:object)
    :swf-name "flash.display::GraphicsBitmapFill"
    :constants
    ()
    :properties
    ((%flash.display:smooth :swf-name "smooth" :type "Boolean" :value NIL :static NIL)
     (%flash.display:repeat :swf-name "repeat" :type "Boolean" :value NIL :static NIL)
     (%flash.display:bitmap-data :swf-name "bitmapData" :type "flash.display::BitmapData" :value NIL :static NIL)
     (%flash.display:matrix :swf-name "matrix" :type "flash.geom::Matrix" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:status-event (%flash.events:event)
    :swf-name "flash.events::StatusEvent"
    :constants
    ((%flash.events:+status+ :swf-name "STATUS" :type "String" :value "status"))
    :properties
    ((%flash.events:level :swf-name "level" :type "String" :static NIL)
     (%flash.events:code :swf-name "code" :type "void" :static NIL)
     (%flash.events:level :swf-name "level" :type "void" :static NIL)
     (%flash.events:code :swf-name "code" :type "String" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:orientation3d (%flash:object)
    :swf-name "flash.geom::Orientation3D"
    :constants
    ((%flash.geom:+quaternion+ :swf-name "QUATERNION" :type "String" :value "quaternion")
     (%flash.geom:+euler-angles+ :swf-name "EULER_ANGLES" :type "String" :value "eulerAngles")
     (%flash.geom:+axis-angle+ :swf-name "AXIS_ANGLE" :type "String" :value "axisAngle"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:color-transform (%flash:object)
    :swf-name "flash.geom::ColorTransform"
    :constants
    ()
    :properties
    ((%flash.geom:alpha-multiplier :swf-name "alphaMultiplier" :type "Number" :value NIL :static NIL)
     (%flash.geom:green-offset :swf-name "greenOffset" :type "Number" :value NIL :static NIL)
     (%flash.geom:blue-multiplier :swf-name "blueMultiplier" :type "Number" :value NIL :static NIL)
     (%flash.geom:red-multiplier :swf-name "redMultiplier" :type "Number" :value NIL :static NIL)
     (%flash.geom:alpha-offset :swf-name "alphaOffset" :type "Number" :value NIL :static NIL)
     (%flash.geom:blue-offset :swf-name "blueOffset" :type "Number" :value NIL :static NIL)
     (%flash.geom:green-multiplier :swf-name "greenMultiplier" :type "Number" :value NIL :static NIL)
     (%flash.geom:color :swf-name "color" :type "void" :static NIL)
     (%flash.geom:red-offset :swf-name "redOffset" :type "Number" :value NIL :static NIL)
     (%flash.geom:color :swf-name "color" :type "uint" :static NIL))
    :methods
    ((%flash.geom:concat :swf-name "concat" :return-type "void"
        :args (("second" "flash.geom::ColorTransform")))
     (%flash.geom:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:static-text (%flash.display:display-object)
    :swf-name "flash.text::StaticText"
    :constants
    ()
    :properties
    ((%flash.text:text :swf-name "text" :type "String" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %adobe.utils:custom-actions (%flash:object)
    :swf-name "adobe.utils::CustomActions"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:url-stream (%flash.events:event-dispatcher)
    :swf-name "flash.net::URLStream"
    :constants
    ()
    :properties
    ((%flash.net:endian :swf-name "endian" :type "void" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.net:bytes-available :swf-name "bytesAvailable" :type "uint" :static NIL)
     (%flash.net:endian :swf-name "endian" :type "String" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.net:connected :swf-name "connected" :type "Boolean" :static NIL))
    :methods
    ((%flash.net:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.net:read-byte :swf-name "readByte" :return-type "int"
        :args NIL)
     (%flash.net:read-bytes :swf-name "readBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.net:read-utf-bytes :swf-name "readUTFBytes" :return-type "String"
        :args (("length" "uint")))
     (%flash.net:read-int :swf-name "readInt" :return-type "int"
        :args NIL)
     (%flash.net:read-utf :swf-name "readUTF" :return-type "String"
        :args NIL)
     (%flash.net:read-multi-byte :swf-name "readMultiByte" :return-type "String"
        :args (("length" "uint") ("charSet" "String")))
     (%flash.net:load :swf-name "load" :return-type "void"
        :args (("request" "flash.net::URLRequest")))
     (%flash.net:read-object :swf-name "readObject" :return-type "*"
        :args NIL)
     (%flash.net:read-unsigned-byte :swf-name "readUnsignedByte" :return-type "uint"
        :args NIL)
     (%flash.net:read-unsigned-short :swf-name "readUnsignedShort" :return-type "uint"
        :args NIL)
     (%flash.net:read-short :swf-name "readShort" :return-type "int"
        :args NIL)
     (%flash.net:read-boolean :swf-name "readBoolean" :return-type "Boolean"
        :args NIL)
     (%flash.net:read-float :swf-name "readFloat" :return-type "Number"
        :args NIL)
     (%flash.net:read-double :swf-name "readDouble" :return-type "Number"
        :args NIL)
     (%flash.net:read-unsigned-int :swf-name "readUnsignedInt" :return-type "uint"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:security-error-event (%flash.events:error-event)
    :swf-name "flash.events::SecurityErrorEvent"
    :constants
    ((%flash.events:+security-error+ :swf-name "SECURITY_ERROR" :type "String" :value "securityError"))
    :properties
    ()
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:ligature-level (%flash:object)
    :swf-name "flash.text.engine::LigatureLevel"
    :constants
    ((%flash.text.engine:+minimum+ :swf-name "MINIMUM" :type "String" :value "minimum")
     (%flash.text.engine:+common+ :swf-name "COMMON" :type "String" :value "common")
     (%flash.text.engine:+exotic+ :swf-name "EXOTIC" :type "String" :value "exotic")
     (%flash.text.engine:+none+ :swf-name "NONE" :type "String" :value "none")
     (%flash.text.engine:+uncommon+ :swf-name "UNCOMMON" :type "String" :value "uncommon"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:morph-shape (%flash.display:display-object)
    :swf-name "flash.display::MorphShape"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:anti-alias-type (%flash:object)
    :swf-name "flash.text::AntiAliasType"
    :constants
    ((%flash.text:+normal+ :swf-name "NORMAL" :type "String" :value "normal")
     (%flash.text:+advanced+ :swf-name "ADVANCED" :type "String" :value "advanced"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:microphone (%flash.events:event-dispatcher)
    :swf-name "flash.media::Microphone"
    :constants
    ()
    :properties
    ((%flash.media:frames-per-packet :swf-name "framesPerPacket" :type "int" :static NIL)
     (%flash.media:frames-per-packet :swf-name "framesPerPacket" :type "void" :static NIL)
     (%flash.media:sound-transform :swf-name "soundTransform" :type "flash.media::SoundTransform" :static NIL)
     (%flash.media:name :swf-name "name" :type "String" :static NIL)
     (%flash.media:index :swf-name "index" :type "int" :static NIL)
     (%flash.media:codec :swf-name "codec" :type "String" :static NIL)
     (%flash.media:activity-level :swf-name "activityLevel" :type "Number" :static NIL)
     (%flash.media:encode-quality :swf-name "encodeQuality" :type "void" :static NIL)
     (%flash.media:encode-quality :swf-name "encodeQuality" :type "int" :static NIL)
     (%flash.media:silence-timeout :swf-name "silenceTimeout" :type "int" :static NIL)
     (%flash.media:use-echo-suppression :swf-name "useEchoSuppression" :type "Boolean" :static NIL)
     (%flash.media:gain :swf-name "gain" :type "void" :static NIL)
     (%flash.media:codec :swf-name "codec" :type "void" :static NIL)
     (%flash.media:muted :swf-name "muted" :type "Boolean" :static NIL)
     (%flash.media:rate :swf-name "rate" :type "int" :static NIL)
     (%flash.media:gain :swf-name "gain" :type "Number" :static NIL)
     (%flash.media:silence-level :swf-name "silenceLevel" :type "Number" :static NIL)
     (%flash.media:sound-transform :swf-name "soundTransform" :type "void" :static NIL)
     (%flash.media:rate :swf-name "rate" :type "void" :static NIL))
    :methods
    ((%flash.media:set-loop-back :swf-name "setLoopBack" :return-type "void"
        :args (&OPTIONAL (("state" "Boolean") T)))
     (%flash.media:set-use-echo-suppression :swf-name "setUseEchoSuppression" :return-type "void"
        :args (("useEchoSuppression" "Boolean")))
     (%flash.media:set-silence-level :swf-name "setSilenceLevel" :return-type "void"
        :args (("silenceLevel" "Number") &OPTIONAL (("timeout" "int") -1))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:url-loader-data-format (%flash:object)
    :swf-name "flash.net::URLLoaderDataFormat"
    :constants
    ((%flash.net:+text+ :swf-name "TEXT" :type "String" :value "text")
     (%flash.net:+variables+ :swf-name "VARIABLES" :type "String" :value "variables")
     (%flash.net:+binary+ :swf-name "BINARY" :type "String" :value "binary"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:sound-channel (%flash.events:event-dispatcher)
    :swf-name "flash.media::SoundChannel"
    :constants
    ()
    :properties
    ((%flash.media:sound-transform :swf-name "soundTransform" :type "flash.media::SoundTransform" :static NIL)
     (%flash.media:right-peak :swf-name "rightPeak" :type "Number" :static NIL)
     (%flash.media:sound-transform :swf-name "soundTransform" :type "void" :static NIL)
     (%flash.media:position :swf-name "position" :type "Number" :static NIL)
     (%flash.media:left-peak :swf-name "leftPeak" :type "Number" :static NIL))
    :methods
    ((%flash.media:stop :swf-name "stop" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:progress-event (%flash.events:event)
    :swf-name "flash.events::ProgressEvent"
    :constants
    ((%flash.events:+socket-data+ :swf-name "SOCKET_DATA" :type "String" :value "socketData")
     (%flash.events:+progress+ :swf-name "PROGRESS" :type "String" :value "progress"))
    :properties
    ((%flash.events:bytes-total :swf-name "bytesTotal" :type "uint" :static NIL)
     (%flash.events:bytes-loaded :swf-name "bytesLoaded" :type "void" :static NIL)
     (%flash.events:bytes-total :swf-name "bytesTotal" :type "void" :static NIL)
     (%flash.events:bytes-loaded :swf-name "bytesLoaded" :type "uint" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:context-menu-event (%flash.events:event)
    :swf-name "flash.events::ContextMenuEvent"
    :constants
    ((%flash.events:+menu-select+ :swf-name "MENU_SELECT" :type "String" :value "menuSelect")
     (%flash.events:+menu-item-select+ :swf-name "MENU_ITEM_SELECT" :type "String" :value "menuItemSelect"))
    :properties
    ((%flash.events:mouse-target :swf-name "mouseTarget" :type "flash.display::InteractiveObject" :static NIL)
     (%flash.events:context-menu-owner :swf-name "contextMenuOwner" :type "void" :static NIL)
     (%flash.events:mouse-target :swf-name "mouseTarget" :type "void" :static NIL)
     (%flash.events:is-mouse-target-inaccessible :swf-name "isMouseTargetInaccessible" :type "Boolean" :static NIL)
     (%flash.events:is-mouse-target-inaccessible :swf-name "isMouseTargetInaccessible" :type "void" :static NIL)
     (%flash.events:context-menu-owner :swf-name "contextMenuOwner" :type "flash.display::InteractiveObject" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-field (%flash.display:interactive-object)
    :swf-name "flash.text::TextField"
    :constants
    ()
    :properties
    ((%flash.text:restrict :swf-name "restrict" :type "void" :static NIL)
     (%flash.text:bottom-scroll-v :swf-name "bottomScrollV" :type "int" :static NIL)
     (%flash.text:type :swf-name "type" :type "void" :static NIL)
     (%flash.text:html-text :swf-name "htmlText" :type "String" :static NIL)
     (%flash.text:thickness :swf-name "thickness" :type "void" :static NIL)
     (%flash.text:thickness :swf-name "thickness" :type "Number" :static NIL)
     (%flash.text:text :swf-name "text" :type "String" :static NIL)
     (%flash.text:html-text :swf-name "htmlText" :type "void" :static NIL)
     (%flash.text:selected-text :swf-name "selectedText" :type "String" :static NIL)
     (%flash.text:text-color :swf-name "textColor" :type "void" :static NIL)
     (%flash.text:style-sheet :swf-name "styleSheet" :type "void" :static NIL)
     (%flash.text:anti-alias-type :swf-name "antiAliasType" :type "String" :static NIL)
     (%flash.text:length :swf-name "length" :type "int" :static NIL)
     (%flash.text:mouse-wheel-enabled :swf-name "mouseWheelEnabled" :type "void" :static NIL)
     (%flash.text:selection-begin-index :swf-name "selectionBeginIndex" :type "int" :static NIL)
     (%flash.text:selection-end-index :swf-name "selectionEndIndex" :type "int" :static NIL)
     (%flash.text:text :swf-name "text" :type "void" :static NIL)
     (%flash.text:embed-fonts :swf-name "embedFonts" :type "void" :static NIL)
     (%flash.text:background :swf-name "background" :type "void" :static NIL)
     (%flash.text:multiline :swf-name "multiline" :type "void" :static NIL)
     (%flash.text:max-chars :swf-name "maxChars" :type "int" :static NIL)
     (%flash.text:border :swf-name "border" :type "void" :static NIL)
     (%flash.text:anti-alias-type :swf-name "antiAliasType" :type "void" :static NIL)
     (%flash.text:selectable :swf-name "selectable" :type "Boolean" :static NIL)
     (%flash.text:background-color :swf-name "backgroundColor" :type "uint" :static NIL)
     (%flash.text:use-rich-text-clipboard :swf-name "useRichTextClipboard" :type "void" :static NIL)
     (%flash.text:scroll-v :swf-name "scrollV" :type "void" :static NIL)
     (%flash.text:auto-size :swf-name "autoSize" :type "String" :static NIL)
     (%flash.text:display-as-password :swf-name "displayAsPassword" :type "Boolean" :static NIL)
     (%flash.text:text-color :swf-name "textColor" :type "uint" :static NIL)
     (%flash.text:condense-white :swf-name "condenseWhite" :type "Boolean" :static NIL)
     (%flash.text:default-text-format :swf-name "defaultTextFormat" :type "void" :static NIL)
     (%flash.text:type :swf-name "type" :type "String" :static NIL)
     (%flash.text:use-rich-text-clipboard :swf-name "useRichTextClipboard" :type "Boolean" :static NIL)
     (%flash.text:style-sheet :swf-name "styleSheet" :type "flash.text::StyleSheet" :static NIL)
     (%flash.text:grid-fit-type :swf-name "gridFitType" :type "String" :static NIL)
     (%flash.text:sharpness :swf-name "sharpness" :type "Number" :static NIL)
     (%flash.text:always-show-selection :swf-name "alwaysShowSelection" :type "Boolean" :static NIL)
     (%flash.text:scroll-h :swf-name "scrollH" :type "void" :static NIL)
     (%flash.text:restrict :swf-name "restrict" :type "String" :static NIL)
     (%flash.text:text-height :swf-name "textHeight" :type "Number" :static NIL)
     (%flash.text:mouse-wheel-enabled :swf-name "mouseWheelEnabled" :type "Boolean" :static NIL)
     (%flash.text:display-as-password :swf-name "displayAsPassword" :type "void" :static NIL)
     (%flash.text:border-color :swf-name "borderColor" :type "void" :static NIL)
     (%flash.text:max-scroll-v :swf-name "maxScrollV" :type "int" :static NIL)
     (%flash.text:selectable :swf-name "selectable" :type "void" :static NIL)
     (%flash.text:max-chars :swf-name "maxChars" :type "void" :static NIL)
     (%flash.text:background :swf-name "background" :type "Boolean" :static NIL)
     (%flash.text:multiline :swf-name "multiline" :type "Boolean" :static NIL)
     (%flash.text:border :swf-name "border" :type "Boolean" :static NIL)
     (%flash.text:embed-fonts :swf-name "embedFonts" :type "Boolean" :static NIL)
     (%flash.text:background-color :swf-name "backgroundColor" :type "void" :static NIL)
     (%flash.text:scroll-v :swf-name "scrollV" :type "int" :static NIL)
     (%flash.text:text-width :swf-name "textWidth" :type "Number" :static NIL)
     (%flash.text:default-text-format :swf-name "defaultTextFormat" :type "flash.text::TextFormat" :static NIL)
     (%flash.text:auto-size :swf-name "autoSize" :type "void" :static NIL)
     (%flash.text:max-scroll-h :swf-name "maxScrollH" :type "int" :static NIL)
     (%flash.text:scroll-h :swf-name "scrollH" :type "int" :static NIL)
     (%flash.text:num-lines :swf-name "numLines" :type "int" :static NIL)
     (%flash.text:condense-white :swf-name "condenseWhite" :type "void" :static NIL)
     (%flash.text:border-color :swf-name "borderColor" :type "uint" :static NIL)
     (%flash.text:word-wrap :swf-name "wordWrap" :type "void" :static NIL)
     (%flash.text:caret-index :swf-name "caretIndex" :type "int" :static NIL)
     (%flash.text:grid-fit-type :swf-name "gridFitType" :type "void" :static NIL)
     (%flash.text:word-wrap :swf-name "wordWrap" :type "Boolean" :static NIL)
     (%flash.text:sharpness :swf-name "sharpness" :type "void" :static NIL)
     (%flash.text:always-show-selection :swf-name "alwaysShowSelection" :type "void" :static NIL))
    :methods
    ((%flash.text:get-line-index-of-char :swf-name "getLineIndexOfChar" :return-type "int"
        :args (("charIndex" "int")))
     (%flash.text:get-text-format :swf-name "getTextFormat" :return-type "flash.text::TextFormat"
        :args (&OPTIONAL (("beginIndex" "int") -1) (("endIndex" "int") -1)))
     (%flash.text:get-line-metrics :swf-name "getLineMetrics" :return-type "flash.text::TextLineMetrics"
        :args (("lineIndex" "int")))
     (%flash.text:get-line-index-at-point :swf-name "getLineIndexAtPoint" :return-type "int"
        :args (("x" "Number") ("y" "Number")))
     (%flash.text:insert-xml-text :swf-name "insertXMLText" :return-type "void"
        :args (("beginIndex" "int") ("endIndex" "int") ("richText" "String")
               &OPTIONAL (("pasting" "Boolean") NIL)))
     (%flash.text:append-text :swf-name "appendText" :return-type "void"
        :args (("newText" "String")))
     (%flash.text:get-char-index-at-point :swf-name "getCharIndexAtPoint" :return-type "int"
        :args (("x" "Number") ("y" "Number")))
     (%flash.text:get-xml-text :swf-name "getXMLText" :return-type "String"
        :args (&OPTIONAL (("beginIndex" "int") 0)
               (("endIndex" "int") 2147483647)))
     (%flash.text:set-selection :swf-name "setSelection" :return-type "void"
        :args (("beginIndex" "int") ("endIndex" "int")))
     (%flash.text:get-paragraph-length :swf-name "getParagraphLength" :return-type "int"
        :args (("charIndex" "int")))
     (%flash.text:replace-selected-text :swf-name "replaceSelectedText" :return-type "void"
        :args (("value" "String")))
     (%flash.text:get-char-boundaries :swf-name "getCharBoundaries" :return-type "flash.geom::Rectangle"
        :args (("charIndex" "int")))
     (%flash.text:get-raw-text :swf-name "getRawText" :return-type "String"
        :args NIL)
     (%flash.text:get-first-char-in-paragraph :swf-name "getFirstCharInParagraph" :return-type "int"
        :args (("charIndex" "int")))
     (%flash.text:get-line-text :swf-name "getLineText" :return-type "String"
        :args (("lineIndex" "int")))
     (%flash.text:get-image-reference :swf-name "getImageReference" :return-type "flash.display::DisplayObject"
        :args (("id" "String")))
     (%flash.text:get-line-offset :swf-name "getLineOffset" :return-type "int"
        :args (("lineIndex" "int")))
     (%flash.text:get-text-runs :swf-name "getTextRuns" :return-type "Array"
        :args (&OPTIONAL (("beginIndex" "int") 0)
               (("endIndex" "int") 2147483647)))
     (%flash.text:get-line-length :swf-name "getLineLength" :return-type "int"
        :args (("lineIndex" "int")))
     (%flash.text:set-text-format :swf-name "setTextFormat" :return-type "void"
        :args (("format" "flash.text::TextFormat") &OPTIONAL
               (("beginIndex" "int") -1) (("endIndex" "int") -1)))
     (%flash.text:replace-text :swf-name "replaceText" :return-type "void"
        :args (("beginIndex" "int") ("endIndex" "int") ("newText" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.xml:xml-parser (%flash:object)
    :swf-name "flash.xml::XMLParser"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.xml:start-parse :swf-name "startParse" :return-type "void"
        :args (("source" "String") ("ignoreWhite" "Boolean")))
     (%flash.xml:get-next :swf-name "getNext" :return-type "int"
        :args (("tag" "internal::flash.xml::XMLTag"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %adobe.utils:xml-ui (%flash:object)
    :swf-name "adobe.utils::XMLUI"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:mouse (%flash:object)
    :swf-name "flash.ui::Mouse"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:activity-event (%flash.events:event)
    :swf-name "flash.events::ActivityEvent"
    :constants
    ((%flash.events:+activity+ :swf-name "ACTIVITY" :type "String" :value "activity"))
    :properties
    ((%flash.events:activating :swf-name "activating" :type "void" :static NIL)
     (%flash.events:activating :swf-name "activating" :type "Boolean" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:ime (%flash.events:event-dispatcher)
    :swf-name "flash.system::IME"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:object-encoding (%flash:object)
    :swf-name "flash.net::ObjectEncoding"
    :constants
    ((%flash.net:+amf3+ :swf-name "AMF3" :type "uint" :value 3)
     (%flash.net:+amf0+ :swf-name "AMF0" :type "uint" :value 0)
     (%flash.net:+default+ :swf-name "DEFAULT" :type "uint" :value 3))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:rendering-mode (%flash:object)
    :swf-name "flash.text.engine::RenderingMode"
    :constants
    ((%flash.text.engine:+normal+ :swf-name "NORMAL" :type "String" :value "normal")
     (%flash.text.engine:+cff+ :swf-name "CFF" :type "String" :value "cff"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.printing:print-job-options (%flash:object)
    :swf-name "flash.printing::PrintJobOptions"
    :constants
    ()
    :properties
    ((%flash.printing:print-as-bitmap :swf-name "printAsBitmap" :type "Boolean" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:mouse-cursor (%flash:object)
    :swf-name "flash.ui::MouseCursor"
    :constants
    ((%flash.ui:+auto+ :swf-name "AUTO" :type "String" :value "auto")
     (%flash.ui:+arrow+ :swf-name "ARROW" :type "String" :value "arrow")
     (%flash.ui:+i-beam+ :swf-name "IBEAM" :type "String" :value "ibeam")
     (%flash.ui:+hand+ :swf-name "HAND" :type "String" :value "hand")
     (%flash.ui:+button+ :swf-name "BUTTON" :type "String" :value "button"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-line-creation-result (%flash:object)
    :swf-name "flash.text.engine::TextLineCreationResult"
    :constants
    ((%flash.text.engine:+insufficient-width+ :swf-name "INSUFFICIENT_WIDTH" :type "String" :value "insufficientWidth")
     (%flash.text.engine:+complete+ :swf-name "COMPLETE" :type "String" :value "complete")
     (%flash.text.engine:+success+ :swf-name "SUCCESS" :type "String" :value "success")
     (%flash.text.engine:+emergency+ :swf-name "EMERGENCY" :type "String" :value "emergency"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:data-event (%flash.events:text-event)
    :swf-name "flash.events::DataEvent"
    :constants
    ((%flash.events:+upload-complete-data+ :swf-name "UPLOAD_COMPLETE_DATA" :type "String" :value "uploadCompleteData")
     (%flash.events:+data+ :swf-name "DATA" :type "String" :value "data"))
    :properties
    ((%flash.events:data :swf-name "data" :type "void" :static NIL)
     (%flash.events:data :swf-name "data" :type "String" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:stage-quality (%flash:object)
    :swf-name "flash.display::StageQuality"
    :constants
    ((%flash.display:+high+ :swf-name "HIGH" :type "String" :value "high")
     (%flash.display:+medium+ :swf-name "MEDIUM" :type "String" :value "medium")
     (%flash.display:+low+ :swf-name "LOW" :type "String" :value "low")
     (%flash.display:+best+ :swf-name "BEST" :type "String" :value "best"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:xml-socket (%flash.events:event-dispatcher)
    :swf-name "flash.net::XMLSocket"
    :constants
    ()
    :properties
    ((%flash.net:connected :swf-name "connected" :type "Boolean" :static NIL)
     (%flash.net:timeout :swf-name "timeout" :type "void" :static NIL)
     (%flash.net:timeout :swf-name "timeout" :type "int" :static NIL))
    :methods
    ((%flash.net:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.net:connect :swf-name "connect" :return-type "void"
        :args (("host" "String") ("port" "int")))
     (%flash.net:send :swf-name "send" :return-type "void"
        :args ("object")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-block (%flash:object)
    :swf-name "flash.text.engine::TextBlock"
    :constants
    ()
    :properties
    ((%flash.text.engine:text-line-creation-result :swf-name "textLineCreationResult" :type "String" :static NIL)
     (%flash.text.engine:first-invalid-line :swf-name "firstInvalidLine" :type "flash.text.engine::TextLine" :static NIL)
     (%flash.text.engine:tab-stops :swf-name "tabStops" :type "void" :static NIL)
     (%flash.text.engine:content :swf-name "content" :type "void" :static NIL)
     (%flash.text.engine:baseline-font-size :swf-name "baselineFontSize" :type "void" :static NIL)
     (%flash.text.engine:bidi-level :swf-name "bidiLevel" :type "void" :static NIL)
     (%flash.text.engine:baseline-font-description :swf-name "baselineFontDescription" :type "flash.text.engine::FontDescription" :static NIL)
     (%flash.text.engine:last-line :swf-name "lastLine" :type "flash.text.engine::TextLine" :static NIL)
     (%flash.text.engine:apply-non-linear-font-scaling :swf-name "applyNonLinearFontScaling" :type "void" :static NIL)
     (%flash.text.engine:line-rotation :swf-name "lineRotation" :type "void" :static NIL)
     (%flash.text.engine:tab-stops :swf-name "tabStops" :type "__AS3__.vec::Vector.<flash.text.engine::TabStop>" :static NIL)
     (%flash.text.engine:baseline-font-size :swf-name "baselineFontSize" :type "Number" :static NIL)
     (%flash.text.engine:baseline-zero :swf-name "baselineZero" :type "void" :static NIL)
     (%flash.text.engine:bidi-level :swf-name "bidiLevel" :type "int" :static NIL)
     (%flash.text.engine:user-data :swf-name "userData" :type "null" :value NIL :static NIL)
     (%flash.text.engine:apply-non-linear-font-scaling :swf-name "applyNonLinearFontScaling" :type "Boolean" :static NIL)
     (%flash.text.engine:line-rotation :swf-name "lineRotation" :type "String" :static NIL)
     (%flash.text.engine:baseline-font-description :swf-name "baselineFontDescription" :type "void" :static NIL)
     (%flash.text.engine:baseline-zero :swf-name "baselineZero" :type "String" :static NIL)
     (%flash.text.engine:content :swf-name "content" :type "flash.text.engine::ContentElement" :static NIL)
     (%flash.text.engine:text-justifier :swf-name "textJustifier" :type "void" :static NIL)
     (%flash.text.engine:first-line :swf-name "firstLine" :type "flash.text.engine::TextLine" :static NIL)
     (%flash.text.engine:text-justifier :swf-name "textJustifier" :type "flash.text.engine::TextJustifier" :static NIL))
    :methods
    ((%flash.text.engine:release-lines :swf-name "releaseLines" :return-type "void"
        :args (("firstLine" "flash.text.engine::TextLine")
               ("lastLine" "flash.text.engine::TextLine")))
     (%flash.text.engine:dump :swf-name "dump" :return-type "String"
        :args NIL)
     (%flash.text.engine:create-text-line :swf-name "createTextLine" :return-type "flash.text.engine::TextLine"
        :args (&OPTIONAL ("previousLine" "flash.text.engine::TextLine")
               (("width" "Number") 1000000) (("lineOffset" "Number") 0)
               (("fitSomething" "Boolean") NIL)))
     (%flash.text.engine:find-previous-word-boundary :swf-name "findPreviousWordBoundary" :return-type "int"
        :args (("beforeCharIndex" "int")))
     (%flash.text.engine:find-next-word-boundary :swf-name "findNextWordBoundary" :return-type "int"
        :args (("afterCharIndex" "int")))
     (%flash.text.engine:find-next-atom-boundary :swf-name "findNextAtomBoundary" :return-type "int"
        :args (("afterCharIndex" "int")))
     (%flash.text.engine:find-previous-atom-boundary :swf-name "findPreviousAtomBoundary" :return-type "int"
        :args (("beforeCharIndex" "int")))
     (%flash.text.engine:get-text-line-at-char-index :swf-name "getTextLineAtCharIndex" :return-type "flash.text.engine::TextLine"
        :args (("charIndex" "int"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.accessibility:accessibility-properties (%flash:object)
    :swf-name "flash.accessibility::AccessibilityProperties"
    :constants
    ()
    :properties
    ((%flash.accessibility:no-auto-labeling :swf-name "noAutoLabeling" :type "Boolean" :value NIL :static NIL)
     (%flash.accessibility:force-simple :swf-name "forceSimple" :type "Boolean" :value NIL :static NIL)
     (%flash.accessibility:description :swf-name "description" :type "String" :value NIL :static NIL)
     (%flash.accessibility:silent :swf-name "silent" :type "Boolean" :value NIL :static NIL)
     (%flash.accessibility:name :swf-name "name" :type "String" :value NIL :static NIL)
     (%flash.accessibility:shortcut :swf-name "shortcut" :type "String" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:font-posture (%flash:object)
    :swf-name "flash.text.engine::FontPosture"
    :constants
    ((%flash.text.engine:+normal+ :swf-name "NORMAL" :type "String" :value "normal")
     (%flash.text.engine:+italic+ :swf-name "ITALIC" :type "String" :value "italic"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-shader-fill (%flash:object)
    :swf-name "flash.display::GraphicsShaderFill"
    :constants
    ()
    :properties
    ((%flash.display:shader :swf-name "shader" :type "flash.display::Shader" :value NIL :static NIL)
     (%flash.display:matrix :swf-name "matrix" :type "flash.geom::Matrix" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:url-loader (%flash.events:event-dispatcher)
    :swf-name "flash.net::URLLoader"
    :constants
    ()
    :properties
    ((%flash.net:bytes-total :swf-name "bytesTotal" :type "uint" :value 0 :static NIL)
     (%flash.net:bytes-loaded :swf-name "bytesLoaded" :type "uint" :value 0 :static NIL)
     (%flash.net:data :swf-name "data" :type "null" :value NIL :static NIL)
     (%flash.net:data-format :swf-name "dataFormat" :type "String" :value "text" :static NIL))
    :methods
    ((%flash.net:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.net:load :swf-name "load" :return-type "void"
        :args (("request" "flash.net::URLRequest"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:group-element (%flash.text.engine:content-element)
    :swf-name "flash.text.engine::GroupElement"
    :constants
    ()
    :properties
    ((%flash.text.engine:element-count :swf-name "elementCount" :type "int" :static NIL))
    :methods
    ((%flash.text.engine:ungroup-elements :swf-name "ungroupElements" :return-type "void"
        :args (("groupIndex" "int")))
     (%flash.text.engine:merge-text-elements :swf-name "mergeTextElements" :return-type "flash.text.engine::TextElement"
        :args (("beginIndex" "int") ("endIndex" "int")))
     (%flash.text.engine:replace-elements :swf-name "replaceElements" :return-type "__AS3__.vec::Vector.<flash.text.engine::ContentElement>"
        :args (("beginIndex" "int") ("endIndex" "int")
               ("newElements"
                "__AS3__.vec::Vector.<flash.text.engine::ContentElement>")))
     (%flash.text.engine:set-elements :swf-name "setElements" :return-type "void"
        :args (("value"
                "__AS3__.vec::Vector.<flash.text.engine::ContentElement>")))
     (%flash.text.engine:group-elements :swf-name "groupElements" :return-type "flash.text.engine::GroupElement"
        :args (("beginIndex" "int") ("endIndex" "int")))
     (%flash.text.engine:split-text-element :swf-name "splitTextElement" :return-type "flash.text.engine::TextElement"
        :args (("elementIndex" "int") ("splitIndex" "int")))
     (%flash.text.engine:get-element-index :swf-name "getElementIndex" :return-type "int"
        :args (("element" "flash.text.engine::ContentElement")))
     (%flash.text.engine:get-element-at-char-index :swf-name "getElementAtCharIndex" :return-type "flash.text.engine::ContentElement"
        :args (("charIndex" "int")))
     (%flash.text.engine:get-element-at :swf-name "getElementAt" :return-type "flash.text.engine::ContentElement"
        :args (("index" "int"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:net-connection (%flash.events:event-dispatcher)
    :swf-name "flash.net::NetConnection"
    :constants
    ()
    :properties
    ((%flash.net:connected-proxy-type :swf-name "connectedProxyType" :type "String" :static NIL)
     (%flash.net:far-nonce :swf-name "farNonce" :type "String" :static NIL)
     (%flash.net:far-id :swf-name "farID" :type "String" :static NIL)
     (%flash.net:using-tls :swf-name "usingTLS" :type "Boolean" :static NIL)
     (%flash.net:client :swf-name "client" :type "void" :static NIL)
     (%flash.net:near-nonce :swf-name "nearNonce" :type "String" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.net:proxy-type :swf-name "proxyType" :type "void" :static NIL)
     (%flash.net:max-peer-connections :swf-name "maxPeerConnections" :type "uint" :static NIL)
     (%flash.net:uri :swf-name "uri" :type "String" :static NIL)
     (%flash.net:client :swf-name "client" :type "Object" :static NIL)
     (%flash.net:connected :swf-name "connected" :type "Boolean" :static NIL)
     (%flash.net:proxy-type :swf-name "proxyType" :type "String" :static NIL)
     (%flash.net:protocol :swf-name "protocol" :type "String" :static NIL)
     (%flash.net:max-peer-connections :swf-name "maxPeerConnections" :type "void" :static NIL)
     (%flash.net:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.net:near-id :swf-name "nearID" :type "String" :static NIL)
     (%flash.net:unconnected-peer-streams :swf-name "unconnectedPeerStreams" :type "Array" :static NIL))
    :methods
    ((%flash.net:call :swf-name "call" :return-type "void"
        :args (("command" "String") &REST ("responder" "flash.net::Responder")))
     (%flash.net:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.net:add-header :swf-name "addHeader" :return-type "void"
        :args (("operation" "String") &OPTIONAL
               (("mustUnderstand" "Boolean") NIL) ("param" "Object")))
     (%flash.net:connect :swf-name "connect" :return-type "void"
        :args (&REST ("command" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:display-object-container (%flash.display:interactive-object)
    :swf-name "flash.display::DisplayObjectContainer"
    :constants
    ()
    :properties
    ((%flash.display:mouse-children :swf-name "mouseChildren" :type "void" :static NIL)
     (%flash.display:tab-children :swf-name "tabChildren" :type "Boolean" :static NIL)
     (%flash.display:text-snapshot :swf-name "textSnapshot" :type "flash.text::TextSnapshot" :static NIL)
     (%flash.display:tab-children :swf-name "tabChildren" :type "void" :static NIL)
     (%flash.display:num-children :swf-name "numChildren" :type "int" :static NIL)
     (%flash.display:mouse-children :swf-name "mouseChildren" :type "Boolean" :static NIL))
    :methods
    ((%flash.display:set-child-index :swf-name "setChildIndex" :return-type "void"
        :args (("child" "flash.display::DisplayObject") ("index" "int")))
     (%flash.display:are-inaccessible-objects-under-point :swf-name "areInaccessibleObjectsUnderPoint" :return-type "Boolean"
        :args (("point" "flash.geom::Point")))
     (%flash.display:add-child :swf-name "addChild" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject")))
     (%flash.display:get-child-at :swf-name "getChildAt" :return-type "flash.display::DisplayObject"
        :args (("index" "int")))
     (%flash.display:remove-child :swf-name "removeChild" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject")))
     (%flash.display:get-objects-under-point :swf-name "getObjectsUnderPoint" :return-type "Array"
        :args (("point" "flash.geom::Point")))
     (%flash.display:swap-children :swf-name "swapChildren" :return-type "void"
        :args (("child1" "flash.display::DisplayObject")
               ("child2" "flash.display::DisplayObject")))
     (%flash.display:add-child-at :swf-name "addChildAt" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject") ("index" "int")))
     (%flash.display:get-child-index :swf-name "getChildIndex" :return-type "int"
        :args (("child" "flash.display::DisplayObject")))
     (%flash.display:remove-child-at :swf-name "removeChildAt" :return-type "flash.display::DisplayObject"
        :args (("index" "int")))
     (%flash.display:get-child-by-name :swf-name "getChildByName" :return-type "flash.display::DisplayObject"
        :args (("name" "String")))
     (%flash.display:swap-children-at :swf-name "swapChildrenAt" :return-type "void"
        :args (("index1" "int") ("index2" "int")))
     (%flash.display:contains :swf-name "contains" :return-type "Boolean"
        :args (("child" "flash.display::DisplayObject"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:sprite (%flash.display:display-object-container)
    :swf-name "flash.display::Sprite"
    :constants
    ()
    :properties
    ((%flash.display:sound-transform :swf-name "soundTransform" :type "void" :static NIL)
     (%flash.display:use-hand-cursor :swf-name "useHandCursor" :type "void" :static NIL)
     (%flash.display:button-mode :swf-name "buttonMode" :type "Boolean" :static NIL)
     (%flash.display:hit-area :swf-name "hitArea" :type "void" :static NIL)
     (%flash.display:use-hand-cursor :swf-name "useHandCursor" :type "Boolean" :static NIL)
     (%flash.display:graphics :swf-name "graphics" :type "flash.display::Graphics" :static NIL)
     (%flash.display:button-mode :swf-name "buttonMode" :type "void" :static NIL)
     (%flash.display:hit-area :swf-name "hitArea" :type "flash.display::Sprite" :static NIL)
     (%flash.display:sound-transform :swf-name "soundTransform" :type "flash.media::SoundTransform" :static NIL)
     (%flash.display:drop-target :swf-name "dropTarget" :type "flash.display::DisplayObject" :static NIL))
    :methods
    ((%flash.display:start-drag :swf-name "startDrag" :return-type "void"
        :args (&OPTIONAL (("lockCenter" "Boolean") NIL)
               ("bounds" "flash.geom::Rectangle")))
     (%flash.display:stop-drag :swf-name "stopDrag" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:movie-clip (%flash.display:sprite)
    :swf-name "flash.display::MovieClip"
    :constants
    ()
    :properties
    ((%flash.display:current-labels :swf-name "currentLabels" :type "Array" :static NIL)
     (%flash.display:current-label :swf-name "currentLabel" :type "String" :static NIL)
     (%flash.display:track-as-menu :swf-name "trackAsMenu" :type "Boolean" :static NIL)
     (%flash.display:track-as-menu :swf-name "trackAsMenu" :type "void" :static NIL)
     (%flash.display:current-scene :swf-name "currentScene" :type "flash.display::Scene" :static NIL)
     (%flash.display:current-frame :swf-name "currentFrame" :type "int" :static NIL)
     (%flash.display:enabled :swf-name "enabled" :type "Boolean" :static NIL)
     (%flash.display:frames-loaded :swf-name "framesLoaded" :type "int" :static NIL)
     (%flash.display:total-frames :swf-name "totalFrames" :type "int" :static NIL)
     (%flash.display:enabled :swf-name "enabled" :type "void" :static NIL)
     (%flash.display:scenes :swf-name "scenes" :type "Array" :static NIL)
     (%flash.display:current-frame-label :swf-name "currentFrameLabel" :type "String" :static NIL))
    :methods
    ((%flash.display:play :swf-name "play" :return-type "void"
        :args NIL)
     (%flash.display:next-frame :swf-name "nextFrame" :return-type "void"
        :args NIL)
     (%flash.display:prev-scene :swf-name "prevScene" :return-type "void"
        :args NIL)
     (%flash.display:add-frame-script :swf-name "addFrameScript" :return-type "void"
        :args NIL)
     (%flash.display:goto-and-stop :swf-name "gotoAndStop" :return-type "void"
        :args (("frame" "Object") &OPTIONAL ("scene" "String")))
     (%flash.display:next-scene :swf-name "nextScene" :return-type "void"
        :args NIL)
     (%flash.display:goto-and-play :swf-name "gotoAndPlay" :return-type "void"
        :args (("frame" "Object") &OPTIONAL ("scene" "String")))
     (%flash.display:stop :swf-name "stop" :return-type "void"
        :args NIL)
     (%flash.display:prev-frame :swf-name "prevFrame" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:net-status-event (%flash.events:event)
    :swf-name "flash.events::NetStatusEvent"
    :constants
    ((%flash.events:+net-status+ :swf-name "NET_STATUS" :type "String" :value "netStatus"))
    :properties
    ((%flash.events:info :swf-name "info" :type "Object" :static NIL)
     (%flash.events:info :swf-name "info" :type "void" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:grid-fit-type (%flash:object)
    :swf-name "flash.text::GridFitType"
    :constants
    ((%flash.text:+pixel+ :swf-name "PIXEL" :type "String" :value "pixel")
     (%flash.text:+none+ :swf-name "NONE" :type "String" :value "none")
     (%flash.text:+subpixel+ :swf-name "SUBPIXEL" :type "String" :value "subpixel"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:caps-style (%flash:object)
    :swf-name "flash.display::CapsStyle"
    :constants
    ((%flash.display:+round+ :swf-name "ROUND" :type "String" :value "round")
     (%flash.display:+square+ :swf-name "SQUARE" :type "String" :value "square")
     (%flash.display:+none+ :swf-name "NONE" :type "String" :value "none"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:file-filter (%flash:object)
    :swf-name "flash.net::FileFilter"
    :constants
    ()
    :properties
    ((%flash.net:extension :swf-name "extension" :type "String" :static NIL)
     (%flash.net:extension :swf-name "extension" :type "void" :static NIL)
     (%flash.net:description :swf-name "description" :type "String" :static NIL)
     (%flash.net:mac-type :swf-name "macType" :type "String" :static NIL)
     (%flash.net:description :swf-name "description" :type "void" :static NIL)
     (%flash.net:mac-type :swf-name "macType" :type "void" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:font-lookup (%flash:object)
    :swf-name "flash.text.engine::FontLookup"
    :constants
    ((%flash.text.engine:+device+ :swf-name "DEVICE" :type "String" :value "device")
     (%flash.text.engine:+embedded-cff+ :swf-name "EMBEDDED_CFF" :type "String" :value "embeddedCFF"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:url-request-header (%flash:object)
    :swf-name "flash.net::URLRequestHeader"
    :constants
    ()
    :properties
    ((%flash.net:name :swf-name "name" :type "String" :value NIL :static NIL)
     (%flash.net:value :swf-name "value" :type "String" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-display-mode (%flash:object)
    :swf-name "flash.text::TextDisplayMode"
    :constants
    ((%flash.text:+lcd+ :swf-name "LCD" :type "String" :value "lcd")
     (%flash.text:+crt+ :swf-name "CRT" :type "String" :value "crt")
     (%flash.text:+default+ :swf-name "DEFAULT" :type "String" :value "default"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:csm-settings (%flash:object)
    :swf-name "flash.text::CSMSettings"
    :constants
    ()
    :properties
    ((%flash.text:inside-cutoff :swf-name "insideCutoff" :type "Number" :value NIL :static NIL)
     (%flash.text:outside-cutoff :swf-name "outsideCutoff" :type "Number" :value NIL :static NIL)
     (%flash.text:font-size :swf-name "fontSize" :type "Number" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:endian (%flash:object)
    :swf-name "flash.utils::Endian"
    :constants
    ((%flash.utils:+little-endian+ :swf-name "LITTLE_ENDIAN" :type "String" :value "littleEndian")
     (%flash.utils:+big-endian+ :swf-name "BIG_ENDIAN" :type "String" :value "bigEndian"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:font-type (%flash:object)
    :swf-name "flash.text::FontType"
    :constants
    ((%flash.text:+embedded-cff+ :swf-name "EMBEDDED_CFF" :type "String" :value "embeddedCFF")
     (%flash.text:+embedded+ :swf-name "EMBEDDED" :type "String" :value "embedded")
     (%flash.text:+device+ :swf-name "DEVICE" :type "String" :value "device"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:simple-button (%flash.display:interactive-object)
    :swf-name "flash.display::SimpleButton"
    :constants
    ()
    :properties
    ((%flash.display:track-as-menu :swf-name "trackAsMenu" :type "void" :static NIL)
     (%flash.display:down-state :swf-name "downState" :type "void" :static NIL)
     (%flash.display:over-state :swf-name "overState" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:track-as-menu :swf-name "trackAsMenu" :type "Boolean" :static NIL)
     (%flash.display:use-hand-cursor :swf-name "useHandCursor" :type "Boolean" :static NIL)
     (%flash.display:over-state :swf-name "overState" :type "void" :static NIL)
     (%flash.display:use-hand-cursor :swf-name "useHandCursor" :type "void" :static NIL)
     (%flash.display:up-state :swf-name "upState" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:sound-transform :swf-name "soundTransform" :type "flash.media::SoundTransform" :static NIL)
     (%flash.display:sound-transform :swf-name "soundTransform" :type "void" :static NIL)
     (%flash.display:down-state :swf-name "downState" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:up-state :swf-name "upState" :type "void" :static NIL)
     (%flash.display:hit-test-state :swf-name "hitTestState" :type "void" :static NIL)
     (%flash.display:hit-test-state :swf-name "hitTestState" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:enabled :swf-name "enabled" :type "void" :static NIL)
     (%flash.display:enabled :swf-name "enabled" :type "Boolean" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:proxy (%flash:object)
    :swf-name "flash.utils::Proxy"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.utils:has-property :swf-name "hasProperty" :return-type "Boolean"
        :args ("name"))
     (%flash.utils:set-property :swf-name "setProperty" :return-type "void"
        :args ("name" "value"))
     (%flash.utils:next-value :swf-name "nextValue" :return-type "*"
        :args (("index" "int")))
     (%flash.utils:get-property :swf-name "getProperty" :return-type "*"
        :args ("name"))
     (%flash.utils:get-descendants :swf-name "getDescendants" :return-type "*"
        :args ("name"))
     (%flash.utils:next-name :swf-name "nextName" :return-type "String"
        :args (("index" "int")))
     (%flash.utils:next-name-index :swf-name "nextNameIndex" :return-type "int"
        :args (("index" "int")))
     (%flash.utils:call-property :swf-name "callProperty" :return-type "*"
        :args (&REST "name"))
     (%flash.utils:is-attribute :swf-name "isAttribute" :return-type "Boolean"
        :args ("name"))
     (%flash.utils:delete-property :swf-name "deleteProperty" :return-type "Boolean"
        :args ("name")))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:security-panel (%flash:object)
    :swf-name "flash.system::SecurityPanel"
    :constants
    ((%flash.system:+display+ :swf-name "DISPLAY" :type "String" :value "display")
     (%flash.system:+settings-manager+ :swf-name "SETTINGS_MANAGER" :type "String" :value "settingsManager")
     (%flash.system:+microphone+ :swf-name "MICROPHONE" :type "String" :value "microphone")
     (%flash.system:+privacy+ :swf-name "PRIVACY" :type "String" :value "privacy")
     (%flash.system:+local-storage+ :swf-name "LOCAL_STORAGE" :type "String" :value "localStorage")
     (%flash.system:+camera+ :swf-name "CAMERA" :type "String" :value "camera")
     (%flash.system:+default+ :swf-name "DEFAULT" :type "String" :value "default"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:glow-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::GlowFilter"
    :constants
    ()
    :properties
    ((%flash.filters:quality :swf-name "quality" :type "int" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "Number" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "void" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "Boolean" :static NIL)
     (%flash.filters:inner :swf-name "inner" :type "Boolean" :static NIL)
     (%flash.filters:knockout :swf-name "knockout" :type "void" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "Number" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "Number" :static NIL)
     (%flash.filters:inner :swf-name "inner" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "void" :static NIL)
     (%flash.filters:color :swf-name "color" :type "void" :static NIL)
     (%flash.filters:quality :swf-name "quality" :type "void" :static NIL)
     (%flash.filters:blur-y :swf-name "blurY" :type "void" :static NIL)
     (%flash.filters:color :swf-name "color" :type "uint" :static NIL)
     (%flash.filters:blur-x :swf-name "blurX" :type "void" :static NIL)
     (%flash.filters:strength :swf-name "strength" :type "Number" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:url-variables (%flash:object)
    :swf-name "flash.net::URLVariables"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.net:decode :swf-name "decode" :return-type "void"
        :args (("source" "String")))
     (%flash.net:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:full-screen-event (%flash.events:activity-event)
    :swf-name "flash.events::FullScreenEvent"
    :constants
    ((%flash.events:+full-screen+ :swf-name "FULL_SCREEN" :type "String" :value "fullScreen"))
    :properties
    ((%flash.events:full-screen :swf-name "fullScreen" :type "Boolean" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:net-stream-play-transitions (%flash:object)
    :swf-name "flash.net::NetStreamPlayTransitions"
    :constants
    ((%flash.net:+reset+ :swf-name "RESET" :type "null" :value "reset")
     (%flash.net:+append+ :swf-name "APPEND" :type "null" :value "append")
     (%flash.net:+stop+ :swf-name "STOP" :type "null" :value "stop")
     (%flash.net:+switch+ :swf-name "SWITCH" :type "null" :value "switch")
     (%flash.net:+swap+ :swf-name "SWAP" :type "null" :value "swap"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:digit-case (%flash:object)
    :swf-name "flash.text.engine::DigitCase"
    :constants
    ((%flash.text.engine:+old-style+ :swf-name "OLD_STYLE" :type "String" :value "oldStyle")
     (%flash.text.engine:+default+ :swf-name "DEFAULT" :type "String" :value "default")
     (%flash.text.engine:+lining+ :swf-name "LINING" :type "String" :value "lining"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:sound-loader-context (%flash:object)
    :swf-name "flash.media::SoundLoaderContext"
    :constants
    ()
    :properties
    ((%flash.media:check-policy-file :swf-name "checkPolicyFile" :type "Boolean" :value NIL :static NIL)
     (%flash.media:buffer-time :swf-name "bufferTime" :type "Number" :value 1000 :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:file-reference-list (%flash.events:event-dispatcher)
    :swf-name "flash.net::FileReferenceList"
    :constants
    ()
    :properties
    ((%flash.net:file-list :swf-name "fileList" :type "Array" :static NIL))
    :methods
    ((%flash.net:browse :swf-name "browse" :return-type "Boolean"
        :args (&OPTIONAL ("typeFilter" "Array"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:shader-event (%flash.events:event)
    :swf-name "flash.events::ShaderEvent"
    :constants
    ((%flash.events:+complete+ :swf-name "COMPLETE" :type "String" :value "complete"))
    :properties
    ((%flash.events:bitmap-data :swf-name "bitmapData" :type "flash.display::BitmapData" :static NIL)
     (%flash.events:bitmap-data :swf-name "bitmapData" :type "*" :static NIL)
     (%flash.events:byte-array :swf-name "byteArray" :type "flash.utils::ByteArray" :static NIL)
     (%flash.events:vector :swf-name "vector" :type "*" :static NIL)
     (%flash.events:vector :swf-name "vector" :type "__AS3__.vec::Vector.<Number>" :static NIL)
     (%flash.events:byte-array :swf-name "byteArray" :type "*" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-line-mirror-region (%flash:object)
    :swf-name "flash.text.engine::TextLineMirrorRegion"
    :constants
    ()
    :properties
    ((%flash.text.engine:mirror :swf-name "mirror" :type "flash.events::EventDispatcher" :static NIL)
     (%flash.text.engine:element :swf-name "element" :type "flash.text.engine::ContentElement" :static NIL)
     (%flash.text.engine:previous-region :swf-name "previousRegion" :type "flash.text.engine::TextLineMirrorRegion" :static NIL)
     (%flash.text.engine:next-region :swf-name "nextRegion" :type "flash.text.engine::TextLineMirrorRegion" :static NIL)
     (%flash.text.engine:bounds :swf-name "bounds" :type "flash.geom::Rectangle" :static NIL)
     (%flash.text.engine:text-line :swf-name "textLine" :type "flash.text.engine::TextLine" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:bitmap-filter-quality (%flash:object)
    :swf-name "flash.filters::BitmapFilterQuality"
    :constants
    ((%flash.filters:+high+ :swf-name "HIGH" :type "int" :value 3)
     (%flash.filters:+medium+ :swf-name "MEDIUM" :type "int" :value 2)
     (%flash.filters:+low+ :swf-name "LOW" :type "int" :value 1))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-format (%flash:object)
    :swf-name "flash.text::TextFormat"
    :constants
    ()
    :properties
    ((%flash.text:letter-spacing :swf-name "letterSpacing" :type "Object" :static NIL)
     (%flash.text:letter-spacing :swf-name "letterSpacing" :type "void" :static NIL)
     (%flash.text:tab-stops :swf-name "tabStops" :type "void" :static NIL)
     (%flash.text:block-indent :swf-name "blockIndent" :type "void" :static NIL)
     (%flash.text:right-margin :swf-name "rightMargin" :type "Object" :static NIL)
     (%flash.text:italic :swf-name "italic" :type "Object" :static NIL)
     (%flash.text:url :swf-name "url" :type "String" :static NIL)
     (%flash.text:indent :swf-name "indent" :type "Object" :static NIL)
     (%flash.text:left-margin :swf-name "leftMargin" :type "void" :static NIL)
     (%flash.text:target :swf-name "target" :type "String" :static NIL)
     (%flash.text:underline :swf-name "underline" :type "void" :static NIL)
     (%flash.text:url :swf-name "url" :type "void" :static NIL)
     (%flash.text:underline :swf-name "underline" :type "Object" :static NIL)
     (%flash.text:color :swf-name "color" :type "Object" :static NIL)
     (%flash.text:target :swf-name "target" :type "void" :static NIL)
     (%flash.text:italic :swf-name "italic" :type "void" :static NIL)
     (%flash.text:kerning :swf-name "kerning" :type "void" :static NIL)
     (%flash.text:font :swf-name "font" :type "void" :static NIL)
     (%flash.text:tab-stops :swf-name "tabStops" :type "Array" :static NIL)
     (%flash.text:kerning :swf-name "kerning" :type "Object" :static NIL)
     (%flash.text:size :swf-name "size" :type "void" :static NIL)
     (%flash.text:block-indent :swf-name "blockIndent" :type "Object" :static NIL)
     (%flash.text:indent :swf-name "indent" :type "void" :static NIL)
     (%flash.text:left-margin :swf-name "leftMargin" :type "Object" :static NIL)
     (%flash.text:right-margin :swf-name "rightMargin" :type "void" :static NIL)
     (%flash.text:leading :swf-name "leading" :type "void" :static NIL)
     (%flash.text:align :swf-name "align" :type "void" :static NIL)
     (%flash.text:font :swf-name "font" :type "String" :static NIL)
     (%flash.text:leading :swf-name "leading" :type "Object" :static NIL)
     (%flash.text:bold :swf-name "bold" :type "Object" :static NIL)
     (%flash.text:display :swf-name "display" :type "void" :static NIL)
     (%flash.text:bold :swf-name "bold" :type "void" :static NIL)
     (%flash.text:display :swf-name "display" :type "String" :static NIL)
     (%flash.text:color :swf-name "color" :type "void" :static NIL)
     (%flash.text:align :swf-name "align" :type "String" :static NIL)
     (%flash.text:bullet :swf-name "bullet" :type "void" :static NIL)
     (%flash.text:bullet :swf-name "bullet" :type "Object" :static NIL)
     (%flash.text:size :swf-name "size" :type "Object" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics (%flash:object)
    :swf-name "flash.display::Graphics"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.display:copy-from :swf-name "copyFrom" :return-type "void"
        :args (("sourceGraphics" "flash.display::Graphics")))
     (%flash.display:end-fill :swf-name "endFill" :return-type "void"
        :args NIL)
     (%flash.display:draw-ellipse :swf-name "drawEllipse" :return-type "void"
        :args (("x" "Number") ("y" "Number") ("width" "Number")
               ("height" "Number")))
     (%flash.display:draw-graphics-data :swf-name "drawGraphicsData" :return-type "void"
        :args (("graphicsData"
                "__AS3__.vec::Vector.<flash.display::IGraphicsData>")))
     (%flash.display:line-shader-style :swf-name "lineShaderStyle" :return-type "void"
        :args (("shader" "flash.display::Shader") &OPTIONAL
               ("matrix" "flash.geom::Matrix")))
     (%flash.display:line-bitmap-style :swf-name "lineBitmapStyle" :return-type "void"
        :args (("bitmap" "flash.display::BitmapData") &OPTIONAL
               ("matrix" "flash.geom::Matrix") (("repeat" "Boolean") T)
               (("smooth" "Boolean") NIL)))
     (%flash.display:draw-circle :swf-name "drawCircle" :return-type "void"
        :args (("x" "Number") ("y" "Number") ("radius" "Number")))
     (%flash.display:draw-round-rect :swf-name "drawRoundRect" :return-type "void"
        :args (("x" "Number") ("y" "Number") ("width" "Number")
               ("height" "Number") ("ellipseWidth" "Number") &OPTIONAL
               ("ellipseHeight" "Number")))
     (%flash.display:move-to :swf-name "moveTo" :return-type "void"
        :args (("x" "Number") ("y" "Number")))
     (%flash.display:draw-round-rect-complex :swf-name "drawRoundRectComplex" :return-type "void"
        :args (("x" "Number") ("y" "Number") ("width" "Number")
               ("height" "Number") ("topLeftRadius" "Number")
               ("topRightRadius" "Number") ("bottomLeftRadius" "Number")
               ("bottomRightRadius" "Number")))
     (%flash.display:line-style :swf-name "lineStyle" :return-type "void"
        :args (&OPTIONAL ("thickness" "Number") (("color" "uint") 0)
               (("alpha" "Number") 1) (("pixelHinting" "Boolean") NIL)
               (("scaleMode" "String") "normal") ("caps" "String")
               ("joints" "String") (("miterLimit" "Number") 3)))
     (%flash.display:begin-gradient-fill :swf-name "beginGradientFill" :return-type "void"
        :args (("type" "String") ("colors" "Array") ("alphas" "Array")
               ("ratios" "Array") &OPTIONAL ("matrix" "flash.geom::Matrix")
               (("spreadMethod" "String") "pad")
               (("interpolationMethod" "String") "rgb")
               (("focalPointRatio" "Number") 0)))
     (%flash.display:begin-bitmap-fill :swf-name "beginBitmapFill" :return-type "void"
        :args (("bitmap" "flash.display::BitmapData") &OPTIONAL
               ("matrix" "flash.geom::Matrix") (("repeat" "Boolean") T)
               (("smooth" "Boolean") NIL)))
     (%flash.display:line-gradient-style :swf-name "lineGradientStyle" :return-type "void"
        :args (("type" "String") ("colors" "Array") ("alphas" "Array")
               ("ratios" "Array") &OPTIONAL ("matrix" "flash.geom::Matrix")
               (("spreadMethod" "String") "pad")
               (("interpolationMethod" "String") "rgb")
               (("focalPointRatio" "Number") 0)))
     (%flash.display:begin-shader-fill :swf-name "beginShaderFill" :return-type "void"
        :args (("shader" "flash.display::Shader") &OPTIONAL
               ("matrix" "flash.geom::Matrix")))
     (%flash.display:line-to :swf-name "lineTo" :return-type "void"
        :args (("x" "Number") ("y" "Number")))
     (%flash.display:clear :swf-name "clear" :return-type "void"
        :args NIL)
     (%flash.display:begin-fill :swf-name "beginFill" :return-type "void"
        :args (("color" "uint") &OPTIONAL (("alpha" "Number") 1)))
     (%flash.display:curve-to :swf-name "curveTo" :return-type "void"
        :args (("controlX" "Number") ("controlY" "Number") ("anchorX" "Number")
               ("anchorY" "Number")))
     (%flash.display:draw-path :swf-name "drawPath" :return-type "void"
        :args (("commands" "__AS3__.vec::Vector.<int>")
               ("data" "__AS3__.vec::Vector.<Number>") &OPTIONAL
               (("winding" "String") "evenOdd")))
     (%flash.display:draw-rect :swf-name "drawRect" :return-type "void"
        :args (("x" "Number") ("y" "Number") ("width" "Number")
               ("height" "Number")))
     (%flash.display:draw-triangles :swf-name "drawTriangles" :return-type "void"
        :args (("vertices" "__AS3__.vec::Vector.<Number>") &OPTIONAL
               ("indices" "__AS3__.vec::Vector.<int>")
               ("uvtData" "__AS3__.vec::Vector.<Number>")
               (("culling" "String") "none"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:timer-event (%flash.events:event)
    :swf-name "flash.events::TimerEvent"
    :constants
    ((%flash.events:+timer+ :swf-name "TIMER" :type "String" :value "timer")
     (%flash.events:+timer-complete+ :swf-name "TIMER_COMPLETE" :type "String" :value "timerComplete"))
    :properties
    ()
    :methods
    ((%flash.events:update-after-event :swf-name "updateAfterEvent" :return-type "void"
        :args NIL)
     (%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:object-output (%flash:object)
    :swf-name "flash.utils::ObjectOutput"
    :constants
    ()
    :properties
    ((%flash.utils:endian :swf-name "endian" :type "void" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "uint" :static NIL)
     (%flash.utils:object-encoding :swf-name "objectEncoding" :type "void" :static NIL)
     (%flash.utils:endian :swf-name "endian" :type "String" :static NIL))
    :methods
    ((%flash.utils:write-float :swf-name "writeFloat" :return-type "void"
        :args (("value" "Number")))
     (%flash.utils:write-int :swf-name "writeInt" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:write-short :swf-name "writeShort" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:write-unsigned-int :swf-name "writeUnsignedInt" :return-type "void"
        :args (("value" "uint")))
     (%flash.utils:write-double :swf-name "writeDouble" :return-type "void"
        :args (("value" "Number")))
     (%flash.utils:write-utf :swf-name "writeUTF" :return-type "void"
        :args (("value" "String")))
     (%flash.utils:write-byte :swf-name "writeByte" :return-type "void"
        :args (("value" "int")))
     (%flash.utils:write-bytes :swf-name "writeBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               (("offset" "uint") 0) (("length" "uint") 0)))
     (%flash.utils:write-boolean :swf-name "writeBoolean" :return-type "void"
        :args (("value" "Boolean")))
     (%flash.utils:write-object :swf-name "writeObject" :return-type "void"
        :args ("object"))
     (%flash.utils:write-utf-bytes :swf-name "writeUTFBytes" :return-type "void"
        :args (("value" "String")))
     (%flash.utils:write-multi-byte :swf-name "writeMultiByte" :return-type "void"
        :args (("value" "String") ("charSet" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.utils:i-externalizable ()
    :swf-name "flash.utils::IExternalizable"
    :constants
    ()
    :properties
    ()
    :methods
    ((%flash.utils:write-external :swf-name "writeExternal" :return-type "void"
        :args (("output" "flash.utils::IDataOutput")))
     (%flash.utils:read-external :swf-name "readExternal" :return-type "void"
        :args (("input" "flash.utils::IDataInput"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:sound (%flash.events:event-dispatcher)
    :swf-name "flash.media::Sound"
    :constants
    ()
    :properties
    ((%flash.media:is-buffering :swf-name "isBuffering" :type "Boolean" :static NIL)
     (%flash.media:bytes-total :swf-name "bytesTotal" :type "int" :static NIL)
     (%flash.media:id3 :swf-name "id3" :type "flash.media::ID3Info" :static NIL)
     (%flash.media:length :swf-name "length" :type "Number" :static NIL)
     (%flash.media:bytes-loaded :swf-name "bytesLoaded" :type "uint" :static NIL)
     (%flash.media:url :swf-name "url" :type "String" :static NIL))
    :methods
    ((%flash.media:play :swf-name "play" :return-type "flash.media::SoundChannel"
        :args (&OPTIONAL (("startTime" "Number") 0) (("loops" "int") 0)
               ("sndTransform" "flash.media::SoundTransform")))
     (%flash.media:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.media:load :swf-name "load" :return-type "void"
        :args (("stream" "flash.net::URLRequest") &OPTIONAL
               ("context" "flash.media::SoundLoaderContext")))
     (%flash.media:extract :swf-name "extract" :return-type "Number"
        :args (("target" "flash.utils::ByteArray") ("length" "Number")
               &OPTIONAL (("startPosition" "Number") -1))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:style-sheet (%flash.events:event-dispatcher)
    :swf-name "flash.text::StyleSheet"
    :constants
    ()
    :properties
    ((%flash.text:style-names :swf-name "styleNames" :type "Array" :static NIL))
    :methods
    ((%flash.text:get-style :swf-name "getStyle" :return-type "Object"
        :args (("styleName" "String")))
     (%flash.text:parse-css :swf-name "parseCSS" :return-type "void"
        :args (("CSSText" "String")))
     (%flash.text:set-style :swf-name "setStyle" :return-type "void"
        :args (("styleName" "String") ("styleObject" "Object")))
     (%flash.text:clear :swf-name "clear" :return-type "void"
        :args NIL)
     (%flash.text:transform :swf-name "transform" :return-type "flash.text::TextFormat"
        :args (("formatObject" "Object"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:line-justification (%flash:object)
    :swf-name "flash.text.engine::LineJustification"
    :constants
    ((%flash.text.engine:+all-including-last+ :swf-name "ALL_INCLUDING_LAST" :type "String" :value "allIncludingLast")
     (%flash.text.engine:+unjustified+ :swf-name "UNJUSTIFIED" :type "String" :value "unjustified")
     (%flash.text.engine:+all-but-last+ :swf-name "ALL_BUT_LAST" :type "String" :value "allButLast"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-line-validity (%flash:object)
    :swf-name "flash.text.engine::TextLineValidity"
    :constants
    ((%flash.text.engine:+possibly-invalid+ :swf-name "POSSIBLY_INVALID" :type "String" :value "possiblyInvalid")
     (%flash.text.engine:+valid+ :swf-name "VALID" :type "String" :value "valid")
     (%flash.text.engine:+invalid+ :swf-name "INVALID" :type "String" :value "invalid")
     (%flash.text.engine:+static+ :swf-name "STATIC" :type "String" :value "static"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:loader (%flash.display:display-object-container)
    :swf-name "flash.display::Loader"
    :constants
    ()
    :properties
    ((%flash.display:content :swf-name "content" :type "flash.display::DisplayObject" :static NIL)
     (%flash.display:content-loader-info :swf-name "contentLoaderInfo" :type "flash.display::LoaderInfo" :static NIL))
    :methods
    ((%flash.display:unload :swf-name "unload" :return-type "void"
        :args NIL)
     (%flash.display:add-child :swf-name "addChild" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject")))
     (%flash.display:unload-and-stop :swf-name "unloadAndStop" :return-type "void"
        :args (&OPTIONAL (("gc" "Boolean") T)))
     (%flash.display:close :swf-name "close" :return-type "void"
        :args NIL)
     (%flash.display:remove-child-at :swf-name "removeChildAt" :return-type "flash.display::DisplayObject"
        :args (("index" "int")))
     (%flash.display:set-child-index :swf-name "setChildIndex" :return-type "void"
        :args (("child" "flash.display::DisplayObject") ("index" "int")))
     (%flash.display:add-child-at :swf-name "addChildAt" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject") ("index" "int")))
     (%flash.display:load-bytes :swf-name "loadBytes" :return-type "void"
        :args (("bytes" "flash.utils::ByteArray") &OPTIONAL
               ("context" "flash.system::LoaderContext")))
     (%flash.display:remove-child :swf-name "removeChild" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject")))
     (%flash.display:load :swf-name "load" :return-type "void"
        :args (("request" "flash.net::URLRequest") &OPTIONAL
               ("context" "flash.system::LoaderContext"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:blend-mode (%flash:object)
    :swf-name "flash.display::BlendMode"
    :constants
    ((%flash.display:+difference+ :swf-name "DIFFERENCE" :type "String" :value "difference")
     (%flash.display:+layer+ :swf-name "LAYER" :type "String" :value "layer")
     (%flash.display:+overlay+ :swf-name "OVERLAY" :type "String" :value "overlay")
     (%flash.display:+screen+ :swf-name "SCREEN" :type "String" :value "screen")
     (%flash.display:+hardlight+ :swf-name "HARDLIGHT" :type "String" :value "hardlight")
     (%flash.display:+normal+ :swf-name "NORMAL" :type "String" :value "normal")
     (%flash.display:+darken+ :swf-name "DARKEN" :type "String" :value "darken")
     (%flash.display:+shader+ :swf-name "SHADER" :type "String" :value "shader")
     (%flash.display:+multiply+ :swf-name "MULTIPLY" :type "String" :value "multiply")
     (%flash.display:+lighten+ :swf-name "LIGHTEN" :type "String" :value "lighten")
     (%flash.display:+invert+ :swf-name "INVERT" :type "String" :value "invert")
     (%flash.display:+subtract+ :swf-name "SUBTRACT" :type "String" :value "subtract")
     (%flash.display:+alpha+ :swf-name "ALPHA" :type "String" :value "alpha")
     (%flash.display:+erase+ :swf-name "ERASE" :type "String" :value "erase")
     (%flash.display:+add+ :swf-name "ADD" :type "String" :value "add"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:point (%flash:object)
    :swf-name "flash.geom::Point"
    :constants
    ()
    :properties
    ((%flash.geom:y :swf-name "y" :type "Number" :value NIL :static NIL)
     (%flash.geom:x :swf-name "x" :type "Number" :value NIL :static NIL)
     (%flash.geom:length :swf-name "length" :type "Number" :static NIL))
    :methods
    ((%flash.geom:equals :swf-name "equals" :return-type "Boolean"
        :args (("toCompare" "flash.geom::Point")))
     (%flash.geom:clone :swf-name "clone" :return-type "flash.geom::Point"
        :args NIL)
     (%flash.geom:offset :swf-name "offset" :return-type "void"
        :args (("dx" "Number") ("dy" "Number")))
     (%flash.geom:subtract :swf-name "subtract" :return-type "flash.geom::Point"
        :args (("v" "flash.geom::Point")))
     (%flash.geom:normalize :swf-name "normalize" :return-type "void"
        :args (("thickness" "Number")))
     (%flash.geom:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.geom:add :swf-name "add" :return-type "flash.geom::Point"
        :args (("v" "flash.geom::Point"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:loader-context (%flash:object)
    :swf-name "flash.system::LoaderContext"
    :constants
    ()
    :properties
    ((%flash.system:security-domain :swf-name "securityDomain" :type "flash.system::SecurityDomain" :value :NULL :static NIL)
     (%flash.system:check-policy-file :swf-name "checkPolicyFile" :type "Boolean" :value NIL :static NIL)
     (%flash.system:application-domain :swf-name "applicationDomain" :type "flash.system::ApplicationDomain" :value :NULL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:jpeg-loader-context (%flash.system:loader-context)
    :swf-name "flash.system::JPEGLoaderContext"
    :constants
    ()
    :properties
    ((%flash.system:deblocking-filter :swf-name "deblockingFilter" :type "Number" :value 0 :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:mouse-event (%flash.events:event)
    :swf-name "flash.events::MouseEvent"
    :constants
    ((%flash.events:+roll-over+ :swf-name "ROLL_OVER" :type "String" :value "rollOver")
     (%flash.events:+mouse-down+ :swf-name "MOUSE_DOWN" :type "String" :value "mouseDown")
     (%flash.events:+double-click+ :swf-name "DOUBLE_CLICK" :type "String" :value "doubleClick")
     (%flash.events:+mouse-up+ :swf-name "MOUSE_UP" :type "String" :value "mouseUp")
     (%flash.events:+mouse-out+ :swf-name "MOUSE_OUT" :type "String" :value "mouseOut")
     (%flash.events:+click+ :swf-name "CLICK" :type "String" :value "click")
     (%flash.events:+mouse-over+ :swf-name "MOUSE_OVER" :type "String" :value "mouseOver")
     (%flash.events:+roll-out+ :swf-name "ROLL_OUT" :type "String" :value "rollOut")
     (%flash.events:+mouse-move+ :swf-name "MOUSE_MOVE" :type "String" :value "mouseMove")
     (%flash.events:+mouse-wheel+ :swf-name "MOUSE_WHEEL" :type "String" :value "mouseWheel"))
    :properties
    ((%flash.events:delta :swf-name "delta" :type "int" :static NIL)
     (%flash.events:shift-key :swf-name "shiftKey" :type "Boolean" :static NIL)
     (%flash.events:alt-key :swf-name "altKey" :type "void" :static NIL)
     (%flash.events:shift-key :swf-name "shiftKey" :type "void" :static NIL)
     (%flash.events:delta :swf-name "delta" :type "void" :static NIL)
     (%flash.events:alt-key :swf-name "altKey" :type "Boolean" :static NIL)
     (%flash.events:ctrl-key :swf-name "ctrlKey" :type "Boolean" :static NIL)
     (%flash.events:button-down :swf-name "buttonDown" :type "void" :static NIL)
     (%flash.events:ctrl-key :swf-name "ctrlKey" :type "void" :static NIL)
     (%flash.events:stage-x :swf-name "stageX" :type "Number" :static NIL)
     (%flash.events:local-y :swf-name "localY" :type "void" :static NIL)
     (%flash.events:stage-y :swf-name "stageY" :type "Number" :static NIL)
     (%flash.events:local-x :swf-name "localX" :type "void" :static NIL)
     (%flash.events:related-object :swf-name "relatedObject" :type "void" :static NIL)
     (%flash.events:local-y :swf-name "localY" :type "Number" :static NIL)
     (%flash.events:local-x :swf-name "localX" :type "Number" :static NIL)
     (%flash.events:related-object :swf-name "relatedObject" :type "flash.display::InteractiveObject" :static NIL)
     (%flash.events:is-related-object-inaccessible :swf-name "isRelatedObjectInaccessible" :type "void" :static NIL)
     (%flash.events:button-down :swf-name "buttonDown" :type "Boolean" :static NIL)
     (%flash.events:is-related-object-inaccessible :swf-name "isRelatedObjectInaccessible" :type "Boolean" :static NIL))
    :methods
    ((%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:update-after-event :swf-name "updateAfterEvent" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:font (%flash:object)
    :swf-name "flash.text::Font"
    :constants
    ()
    :properties
    ((%flash.text:font-name :swf-name "fontName" :type "String" :static NIL)
     (%flash.text:font-style :swf-name "fontStyle" :type "String" :static NIL)
     (%flash.text:font-type :swf-name "fontType" :type "String" :static NIL))
    :methods
    ((%flash.text:has-glyphs :swf-name "hasGlyphs" :return-type "Boolean"
        :args (("str" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-baseline (%flash:object)
    :swf-name "flash.text.engine::TextBaseline"
    :constants
    ((%flash.text.engine:+roman+ :swf-name "ROMAN" :type "String" :value "roman")
     (%flash.text.engine:+ascent+ :swf-name "ASCENT" :type "String" :value "ascent")
     (%flash.text.engine:+ideographic-top+ :swf-name "IDEOGRAPHIC_TOP" :type "String" :value "ideographicTop")
     (%flash.text.engine:+ideographic-center+ :swf-name "IDEOGRAPHIC_CENTER" :type "String" :value "ideographicCenter")
     (%flash.text.engine:+use-dominant-baseline+ :swf-name "USE_DOMINANT_BASELINE" :type "String" :value "useDominantBaseline")
     (%flash.text.engine:+ideographic-bottom+ :swf-name "IDEOGRAPHIC_BOTTOM" :type "String" :value "ideographicBottom")
     (%flash.text.engine:+descent+ :swf-name "DESCENT" :type "String" :value "descent"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:stage (%flash.display:display-object-container)
    :swf-name "flash.display::Stage"
    :constants
    ()
    :properties
    ((%flash.display:quality :swf-name "quality" :type "String" :static NIL)
     (%flash.display:stage-focus-rect :swf-name "stageFocusRect" :type "Boolean" :static NIL)
     (%flash.display:rotation :swf-name "rotation" :type "void" :static NIL)
     (%flash.display:tab-enabled :swf-name "tabEnabled" :type "void" :static NIL)
     (%flash.display:tab-children :swf-name "tabChildren" :type "void" :static NIL)
     (%flash.display:filters :swf-name "filters" :type "void" :static NIL)
     (%flash.display:z :swf-name "z" :type "void" :static NIL)
     (%flash.display:y :swf-name "y" :type "void" :static NIL)
     (%flash.display:x :swf-name "x" :type "void" :static NIL)
     (%flash.display:display-state :swf-name "displayState" :type "String" :static NIL)
     (%flash.display:color-correction-support :swf-name "colorCorrectionSupport" :type "String" :static NIL)
     (%flash.display:frame-rate :swf-name "frameRate" :type "Number" :static NIL)
     (%flash.display:stage-width :swf-name "stageWidth" :type "int" :static NIL)
     (%flash.display:transform :swf-name "transform" :type "void" :static NIL)
     (%flash.display:display-state :swf-name "displayState" :type "void" :static NIL)
     (%flash.display:visible :swf-name "visible" :type "void" :static NIL)
     (%flash.display:full-screen-height :swf-name "fullScreenHeight" :type "uint" :static NIL)
     (%flash.display:full-screen-source-rect :swf-name "fullScreenSourceRect" :type "flash.geom::Rectangle" :static NIL)
     (%flash.display:mask :swf-name "mask" :type "void" :static NIL)
     (%flash.display:opaque-background :swf-name "opaqueBackground" :type "void" :static NIL)
     (%flash.display:context-menu :swf-name "contextMenu" :type "void" :static NIL)
     (%flash.display:frame-rate :swf-name "frameRate" :type "void" :static NIL)
     (%flash.display:focus :swf-name "focus" :type "flash.display::InteractiveObject" :static NIL)
     (%flash.display:width :swf-name "width" :type "Number" :static NIL)
     (%flash.display:stage-width :swf-name "stageWidth" :type "void" :static NIL)
     (%flash.display:height :swf-name "height" :type "void" :static NIL)
     (%flash.display:accessibility-properties :swf-name "accessibilityProperties" :type "void" :static NIL)
     (%flash.display:mouse-enabled :swf-name "mouseEnabled" :type "void" :static NIL)
     (%flash.display:cache-as-bitmap :swf-name "cacheAsBitmap" :type "void" :static NIL)
     (%flash.display:stage-height :swf-name "stageHeight" :type "int" :static NIL)
     (%flash.display:mouse-children :swf-name "mouseChildren" :type "Boolean" :static NIL)
     (%flash.display:tab-children :swf-name "tabChildren" :type "Boolean" :static NIL)
     (%flash.display:color-correction :swf-name "colorCorrection" :type "void" :static NIL)
     (%flash.display:accessibility-implementation :swf-name "accessibilityImplementation" :type "void" :static NIL)
     (%flash.display:focus-rect :swf-name "focusRect" :type "void" :static NIL)
     (%flash.display:alpha :swf-name "alpha" :type "void" :static NIL)
     (%flash.display:rotation-x :swf-name "rotationX" :type "void" :static NIL)
     (%flash.display:rotation-z :swf-name "rotationZ" :type "void" :static NIL)
     (%flash.display:quality :swf-name "quality" :type "void" :static NIL)
     (%flash.display:rotation-y :swf-name "rotationY" :type "void" :static NIL)
     (%flash.display:full-screen-source-rect :swf-name "fullScreenSourceRect" :type "void" :static NIL)
     (%flash.display:focus :swf-name "focus" :type "void" :static NIL)
     (%flash.display:full-screen-width :swf-name "fullScreenWidth" :type "uint" :static NIL)
     (%flash.display:scale-9-grid :swf-name "scale9Grid" :type "void" :static NIL)
     (%flash.display:text-snapshot :swf-name "textSnapshot" :type "flash.text::TextSnapshot" :static NIL)
     (%flash.display:blend-mode :swf-name "blendMode" :type "void" :static NIL)
     (%flash.display:height :swf-name "height" :type "Number" :static NIL)
     (%flash.display:num-children :swf-name "numChildren" :type "int" :static NIL)
     (%flash.display:scroll-rect :swf-name "scrollRect" :type "void" :static NIL)
     (%flash.display:color-correction :swf-name "colorCorrection" :type "String" :static NIL)
     (%flash.display:scale-z :swf-name "scaleZ" :type "void" :static NIL)
     (%flash.display:scale-y :swf-name "scaleY" :type "void" :static NIL)
     (%flash.display:scale-x :swf-name "scaleX" :type "void" :static NIL)
     (%flash.display:scale-mode :swf-name "scaleMode" :type "void" :static NIL)
     (%flash.display:align :swf-name "align" :type "void" :static NIL)
     (%flash.display:name :swf-name "name" :type "void" :static NIL)
     (%flash.display:show-default-context-menu :swf-name "showDefaultContextMenu" :type "void" :static NIL)
     (%flash.display:width :swf-name "width" :type "void" :static NIL)
     (%flash.display:show-default-context-menu :swf-name "showDefaultContextMenu" :type "Boolean" :static NIL)
     (%flash.display:scale-mode :swf-name "scaleMode" :type "String" :static NIL)
     (%flash.display:stage-height :swf-name "stageHeight" :type "void" :static NIL)
     (%flash.display:mouse-children :swf-name "mouseChildren" :type "void" :static NIL)
     (%flash.display:align :swf-name "align" :type "String" :static NIL)
     (%flash.display:stage-focus-rect :swf-name "stageFocusRect" :type "void" :static NIL)
     (%flash.display:tab-index :swf-name "tabIndex" :type "void" :static NIL))
    :methods
    ((%flash.display:add-child :swf-name "addChild" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject")))
     (%flash.display:dispatch-event :swf-name "dispatchEvent" :return-type "Boolean"
        :args (("event" "flash.events::Event")))
     (%flash.display:add-event-listener :swf-name "addEventListener" :return-type "void"
        :args (("type" "String") ("listener" "Function") &OPTIONAL
               (("useCapture" "Boolean") NIL) (("priority" "int") 0)
               (("useWeakReference" "Boolean") NIL)))
     (%flash.display:remove-child-at :swf-name "removeChildAt" :return-type "flash.display::DisplayObject"
        :args (("index" "int")))
     (%flash.display:invalidate :swf-name "invalidate" :return-type "void"
        :args NIL)
     (%flash.display:swap-children-at :swf-name "swapChildrenAt" :return-type "void"
        :args (("index1" "int") ("index2" "int")))
     (%flash.display:set-child-index :swf-name "setChildIndex" :return-type "void"
        :args (("child" "flash.display::DisplayObject") ("index" "int")))
     (%flash.display:add-child-at :swf-name "addChildAt" :return-type "flash.display::DisplayObject"
        :args (("child" "flash.display::DisplayObject") ("index" "int")))
     (%flash.display:has-event-listener :swf-name "hasEventListener" :return-type "Boolean"
        :args (("type" "String")))
     (%flash.display:is-focus-inaccessible :swf-name "isFocusInaccessible" :return-type "Boolean"
        :args NIL)
     (%flash.display:will-trigger :swf-name "willTrigger" :return-type "Boolean"
        :args (("type" "String"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:graphics-solid-fill (%flash:object)
    :swf-name "flash.display::GraphicsSolidFill"
    :constants
    ()
    :properties
    ((%flash.display:alpha :swf-name "alpha" :type "Number" :value 1 :static NIL)
     (%flash.display:color :swf-name "color" :type "uint" :value 0 :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:transform (%flash:object)
    :swf-name "flash.geom::Transform"
    :constants
    ()
    :properties
    ((%flash.geom:pixel-bounds :swf-name "pixelBounds" :type "flash.geom::Rectangle" :static NIL)
     (%flash.geom:color-transform :swf-name "colorTransform" :type "void" :static NIL)
     (%flash.geom:concatenated-color-transform :swf-name "concatenatedColorTransform" :type "flash.geom::ColorTransform" :static NIL)
     (%flash.geom:perspective-projection :swf-name "perspectiveProjection" :type "void" :static NIL)
     (%flash.geom:matrix3d :swf-name "matrix3D" :type "flash.geom::Matrix3D" :static NIL)
     (%flash.geom:concatenated-matrix :swf-name "concatenatedMatrix" :type "flash.geom::Matrix" :static NIL)
     (%flash.geom:perspective-projection :swf-name "perspectiveProjection" :type "flash.geom::PerspectiveProjection" :static NIL)
     (%flash.geom:color-transform :swf-name "colorTransform" :type "flash.geom::ColorTransform" :static NIL)
     (%flash.geom:matrix3d :swf-name "matrix3D" :type "*" :static NIL)
     (%flash.geom:matrix :swf-name "matrix" :type "void" :static NIL)
     (%flash.geom:matrix :swf-name "matrix" :type "flash.geom::Matrix" :static NIL))
    :methods
    ((%flash.geom:get-relative-matrix3d :swf-name "getRelativeMatrix3D" :return-type "flash.geom::Matrix3D"
        :args (("relativeTo" "flash.display::DisplayObject"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:context-menu-clipboard-items (%flash:object)
    :swf-name "flash.ui::ContextMenuClipboardItems"
    :constants
    ()
    :properties
    ((%flash.ui:clear :swf-name "clear" :type "Boolean" :value NIL :static NIL)
     (%flash.ui:select-all :swf-name "selectAll" :type "Boolean" :value T :static NIL)
     (%flash.ui:copy :swf-name "copy" :type "Boolean" :value NIL :static NIL)
     (%flash.ui:paste :swf-name "paste" :type "Boolean" :value NIL :static NIL)
     (%flash.ui:cut :swf-name "cut" :type "Boolean" :value NIL :static NIL))
    :methods
    ((%flash.ui:clone :swf-name "clone" :return-type "flash.ui::ContextMenuClipboardItems"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.system:security (%flash:object)
    :swf-name "flash.system::Security"
    :constants
    ((%flash.system:+local-with-network+ :swf-name "LOCAL_WITH_NETWORK" :type "String" :value "localWithNetwork")
     (%flash.system:+local-with-file+ :swf-name "LOCAL_WITH_FILE" :type "String" :value "localWithFile")
     (%flash.system:+remote+ :swf-name "REMOTE" :type "String" :value "remote")
     (%flash.system:+local-trusted+ :swf-name "LOCAL_TRUSTED" :type "String" :value "localTrusted"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:keyboard-event (%flash.events:event)
    :swf-name "flash.events::KeyboardEvent"
    :constants
    ((%flash.events:+key-up+ :swf-name "KEY_UP" :type "String" :value "keyUp")
     (%flash.events:+key-down+ :swf-name "KEY_DOWN" :type "String" :value "keyDown"))
    :properties
    ((%flash.events:shift-key :swf-name "shiftKey" :type "Boolean" :static NIL)
     (%flash.events:alt-key :swf-name "altKey" :type "Boolean" :static NIL)
     (%flash.events:ctrl-key :swf-name "ctrlKey" :type "Boolean" :static NIL)
     (%flash.events:alt-key :swf-name "altKey" :type "void" :static NIL)
     (%flash.events:key-location :swf-name "keyLocation" :type "void" :static NIL)
     (%flash.events:ctrl-key :swf-name "ctrlKey" :type "void" :static NIL)
     (%flash.events:char-code :swf-name "charCode" :type "uint" :static NIL)
     (%flash.events:key-code :swf-name "keyCode" :type "void" :static NIL)
     (%flash.events:key-code :swf-name "keyCode" :type "uint" :static NIL)
     (%flash.events:char-code :swf-name "charCode" :type "void" :static NIL)
     (%flash.events:key-location :swf-name "keyLocation" :type "uint" :static NIL)
     (%flash.events:shift-key :swf-name "shiftKey" :type "void" :static NIL))
    :methods
    ((%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL)
     (%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:update-after-event :swf-name "updateAfterEvent" :return-type "void"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:spread-method (%flash:object)
    :swf-name "flash.display::SpreadMethod"
    :constants
    ((%flash.display:+reflect+ :swf-name "REFLECT" :type "String" :value "reflect")
     (%flash.display:+repeat+ :swf-name "REPEAT" :type "String" :value "repeat")
     (%flash.display:+pad+ :swf-name "PAD" :type "String" :value "pad"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shader-input (%flash:object)
    :swf-name "flash.display::ShaderInput"
    :constants
    ()
    :properties
    ((%flash.display:height :swf-name "height" :type "void" :static NIL)
     (%flash.display:width :swf-name "width" :type "void" :static NIL)
     (%flash.display:input :swf-name "input" :type "Object" :static NIL)
     (%flash.display:height :swf-name "height" :type "int" :static NIL)
     (%flash.display:width :swf-name "width" :type "int" :static NIL)
     (%flash.display:input :swf-name "input" :type "void" :static NIL)
     (%flash.display:index :swf-name "index" :type "int" :static NIL)
     (%flash.display:channels :swf-name "channels" :type "int" :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:shader-parameter-type (%flash:object)
    :swf-name "flash.display::ShaderParameterType"
    :constants
    ((%flash.display:+float4+ :swf-name "FLOAT4" :type "String" :value "float4")
     (%flash.display:+float+ :swf-name "FLOAT" :type "String" :value "float")
     (%flash.display:+float3+ :swf-name "FLOAT3" :type "String" :value "float3")
     (%flash.display:+float2+ :swf-name "FLOAT2" :type "String" :value "float2")
     (%flash.display:+matrix4x4+ :swf-name "MATRIX4X4" :type "String" :value "matrix4x4")
     (%flash.display:+matrix3x3+ :swf-name "MATRIX3X3" :type "String" :value "matrix3x3")
     (%flash.display:+matrix2x2+ :swf-name "MATRIX2X2" :type "String" :value "matrix2x2")
     (%flash.display:+bool+ :swf-name "BOOL" :type "String" :value "bool")
     (%flash.display:+int+ :swf-name "INT" :type "String" :value "int")
     (%flash.display:+bool4+ :swf-name "BOOL4" :type "String" :value "bool4")
     (%flash.display:+bool3+ :swf-name "BOOL3" :type "String" :value "bool3")
     (%flash.display:+bool2+ :swf-name "BOOL2" :type "String" :value "bool2")
     (%flash.display:+int4+ :swf-name "INT4" :type "String" :value "int4")
     (%flash.display:+int3+ :swf-name "INT3" :type "String" :value "int3")
     (%flash.display:+int2+ :swf-name "INT2" :type "String" :value "int2"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:event-phase (%flash:object)
    :swf-name "flash.events::EventPhase"
    :constants
    ((%flash.events:+capturing-phase+ :swf-name "CAPTURING_PHASE" :type "uint" :value 1)
     (%flash.events:+at-target+ :swf-name "AT_TARGET" :type "uint" :value 2)
     (%flash.events:+bubbling-phase+ :swf-name "BUBBLING_PHASE" :type "uint" :value 3))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:text-line (%flash.display:display-object-container)
    :swf-name "flash.text.engine::TextLine"
    :constants
    ((%flash.text.engine:+max-line-width+ :swf-name "MAX_LINE_WIDTH" :type "int" :value 1000000))
    :properties
    ((%flash.text.engine:atom-count :swf-name "atomCount" :type "int" :static NIL)
     (%flash.text.engine:raw-text-length :swf-name "rawTextLength" :type "int" :static NIL)
     (%flash.text.engine:tab-index :swf-name "tabIndex" :type "void" :static NIL)
     (%flash.text.engine:focus-rect :swf-name "focusRect" :type "void" :static NIL)
     (%flash.text.engine:specified-width :swf-name "specifiedWidth" :type "Number" :static NIL)
     (%flash.text.engine:text-height :swf-name "textHeight" :type "Number" :static NIL)
     (%flash.text.engine:validity :swf-name "validity" :type "String" :static NIL)
     (%flash.text.engine:has-graphic-element :swf-name "hasGraphicElement" :type "Boolean" :static NIL)
     (%flash.text.engine:text-block-begin-index :swf-name "textBlockBeginIndex" :type "int" :static NIL)
     (%flash.text.engine:tab-children :swf-name "tabChildren" :type "void" :static NIL)
     (%flash.text.engine:validity :swf-name "validity" :type "void" :static NIL)
     (%flash.text.engine:text-block :swf-name "textBlock" :type "flash.text.engine::TextBlock" :static NIL)
     (%flash.text.engine:context-menu :swf-name "contextMenu" :type "void" :static NIL)
     (%flash.text.engine:ascent :swf-name "ascent" :type "Number" :static NIL)
     (%flash.text.engine:text-width :swf-name "textWidth" :type "Number" :static NIL)
     (%flash.text.engine:tab-enabled :swf-name "tabEnabled" :type "void" :static NIL)
     (%flash.text.engine:user-data :swf-name "userData" :type "null" :value NIL :static NIL)
     (%flash.text.engine:unjustified-text-width :swf-name "unjustifiedTextWidth" :type "Number" :static NIL)
     (%flash.text.engine:previous-line :swf-name "previousLine" :type "flash.text.engine::TextLine" :static NIL)
     (%flash.text.engine:next-line :swf-name "nextLine" :type "flash.text.engine::TextLine" :static NIL)
     (%flash.text.engine:descent :swf-name "descent" :type "Number" :static NIL)
     (%flash.text.engine:mirror-regions :swf-name "mirrorRegions" :type "__AS3__.vec::Vector.<flash.text.engine::TextLineMirrorRegion>" :static NIL))
    :methods
    ((%flash.text.engine:flush-atom-data :swf-name "flushAtomData" :return-type "void"
        :args NIL)
     (%flash.text.engine:get-atom-center :swf-name "getAtomCenter" :return-type "Number"
        :args (("atomIndex" "int")))
     (%flash.text.engine:get-atom-text-rotation :swf-name "getAtomTextRotation" :return-type "String"
        :args (("atomIndex" "int")))
     (%flash.text.engine:get-atom-text-block-end-index :swf-name "getAtomTextBlockEndIndex" :return-type "int"
        :args (("atomIndex" "int")))
     (%flash.text.engine:get-atom-bounds :swf-name "getAtomBounds" :return-type "flash.geom::Rectangle"
        :args (("atomIndex" "int")))
     (%flash.text.engine:get-atom-text-block-begin-index :swf-name "getAtomTextBlockBeginIndex" :return-type "int"
        :args (("atomIndex" "int")))
     (%flash.text.engine:get-atom-word-boundary-on-left :swf-name "getAtomWordBoundaryOnLeft" :return-type "Boolean"
        :args (("atomIndex" "int")))
     (%flash.text.engine:get-atom-index-at-char-index :swf-name "getAtomIndexAtCharIndex" :return-type "int"
        :args (("charIndex" "int")))
     (%flash.text.engine:get-atom-index-at-point :swf-name "getAtomIndexAtPoint" :return-type "int"
        :args (("stageX" "Number") ("stageY" "Number")))
     (%flash.text.engine:get-atom-bidi-level :swf-name "getAtomBidiLevel" :return-type "int"
        :args (("atomIndex" "int")))
     (%flash.text.engine:dump :swf-name "dump" :return-type "String"
        :args NIL)
     (%flash.text.engine:get-mirror-region :swf-name "getMirrorRegion" :return-type "flash.text.engine::TextLineMirrorRegion"
        :args (("mirror" "flash.events::EventDispatcher")))
     (%flash.text.engine:get-baseline-position :swf-name "getBaselinePosition" :return-type "Number"
        :args (("baseline" "String")))
     (%flash.text.engine:get-atom-graphic :swf-name "getAtomGraphic" :return-type "flash.display::DisplayObject"
        :args (("atomIndex" "int"))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:pixel-snapping (%flash:object)
    :swf-name "flash.display::PixelSnapping"
    :constants
    ((%flash.display:+auto+ :swf-name "AUTO" :type "String" :value "auto")
     (%flash.display:+never+ :swf-name "NEVER" :type "String" :value "never")
     (%flash.display:+always+ :swf-name "ALWAYS" :type "String" :value "always"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-line-metrics (%flash:object)
    :swf-name "flash.text::TextLineMetrics"
    :constants
    ()
    :properties
    ((%flash.text:descent :swf-name "descent" :type "Number" :value NIL :static NIL)
     (%flash.text:x :swf-name "x" :type "Number" :value NIL :static NIL)
     (%flash.text:leading :swf-name "leading" :type "Number" :value NIL :static NIL)
     (%flash.text:height :swf-name "height" :type "Number" :value NIL :static NIL)
     (%flash.text:width :swf-name "width" :type "Number" :value NIL :static NIL)
     (%flash.text:ascent :swf-name "ascent" :type "Number" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:file-reference (%flash.events:event-dispatcher)
    :swf-name "flash.net::FileReference"
    :constants
    ()
    :properties
    ((%flash.net:data :swf-name "data" :type "flash.utils::ByteArray" :static NIL)
     (%flash.net:modification-date :swf-name "modificationDate" :type "Date" :static NIL)
     (%flash.net:creation-date :swf-name "creationDate" :type "Date" :static NIL)
     (%flash.net:creator :swf-name "creator" :type "String" :static NIL)
     (%flash.net:name :swf-name "name" :type "String" :static NIL)
     (%flash.net:type :swf-name "type" :type "String" :static NIL)
     (%flash.net:size :swf-name "size" :type "uint" :static NIL))
    :methods
    ((%flash.net:save :swf-name "save" :return-type "void"
        :args ("data" &OPTIONAL ("defaultFileName" "String")))
     (%flash.net:cancel :swf-name "cancel" :return-type "void"
        :args NIL)
     (%flash.net:download :swf-name "download" :return-type "void"
        :args (("request" "flash.net::URLRequest") &OPTIONAL
               ("defaultFileName" "String")))
     (%flash.net:browse :swf-name "browse" :return-type "Boolean"
        :args (&OPTIONAL ("typeFilter" "Array")))
     (%flash.net:load :swf-name "load" :return-type "void"
        :args NIL)
     (%flash.net:upload :swf-name "upload" :return-type "void"
        :args (("request" "flash.net::URLRequest") &OPTIONAL
               (("uploadDataFieldName" "String") "Filedata")
               (("testUpload" "Boolean") NIL))))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:stage-scale-mode (%flash:object)
    :swf-name "flash.display::StageScaleMode"
    :constants
    ((%flash.display:+show-all+ :swf-name "SHOW_ALL" :type "String" :value "showAll")
     (%flash.display:+no-scale+ :swf-name "NO_SCALE" :type "String" :value "noScale")
     (%flash.display:+no-border+ :swf-name "NO_BORDER" :type "String" :value "noBorder")
     (%flash.display:+exact-fit+ :swf-name "EXACT_FIT" :type "String" :value "exactFit"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:shared-object-flush-status (%flash:object)
    :swf-name "flash.net::SharedObjectFlushStatus"
    :constants
    ((%flash.net:+pending+ :swf-name "PENDING" :type "String" :value "pending")
     (%flash.net:+flushed+ :swf-name "FLUSHED" :type "String" :value "flushed"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text:text-field-auto-size (%flash:object)
    :swf-name "flash.text::TextFieldAutoSize"
    :constants
    ((%flash.text:+right+ :swf-name "RIGHT" :type "String" :value "right")
     (%flash.text:+none+ :swf-name "NONE" :type "String" :value "none")
     (%flash.text:+left+ :swf-name "LEFT" :type "String" :value "left")
     (%flash.text:+center+ :swf-name "CENTER" :type "String" :value "center"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.printing:print-job-orientation (%flash:object)
    :swf-name "flash.printing::PrintJobOrientation"
    :constants
    ((%flash.printing:+portrait+ :swf-name "PORTRAIT" :type "String" :value "portrait")
     (%flash.printing:+landscape+ :swf-name "LANDSCAPE" :type "String" :value "landscape"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.events:http-status-event (%flash.events:event)
    :swf-name "flash.events::HTTPStatusEvent"
    :constants
    ((%flash.events:+http-status+ :swf-name "HTTP_STATUS" :type "String" :value "httpStatus"))
    :properties
    ((%flash.events:status :swf-name "status" :type "int" :static NIL))
    :methods
    ((%flash.events:clone :swf-name "clone" :return-type "flash.events::Event"
        :args NIL)
     (%flash.events:to-string :swf-name "toString" :return-type "String"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.filters:convolution-filter (%flash.filters:bitmap-filter)
    :swf-name "flash.filters::ConvolutionFilter"
    :constants
    ()
    :properties
    ((%flash.filters:divisor :swf-name "divisor" :type "Number" :static NIL)
     (%flash.filters:divisor :swf-name "divisor" :type "void" :static NIL)
     (%flash.filters:clamp :swf-name "clamp" :type "Boolean" :static NIL)
     (%flash.filters:bias :swf-name "bias" :type "Number" :static NIL)
     (%flash.filters:matrix-y :swf-name "matrixY" :type "Number" :static NIL)
     (%flash.filters:matrix-x :swf-name "matrixX" :type "Number" :static NIL)
     (%flash.filters:clamp :swf-name "clamp" :type "void" :static NIL)
     (%flash.filters:preserve-alpha :swf-name "preserveAlpha" :type "Boolean" :static NIL)
     (%flash.filters:matrix-y :swf-name "matrixY" :type "void" :static NIL)
     (%flash.filters:matrix-x :swf-name "matrixX" :type "void" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "void" :static NIL)
     (%flash.filters:bias :swf-name "bias" :type "void" :static NIL)
     (%flash.filters:color :swf-name "color" :type "void" :static NIL)
     (%flash.filters:alpha :swf-name "alpha" :type "Number" :static NIL)
     (%flash.filters:preserve-alpha :swf-name "preserveAlpha" :type "void" :static NIL)
     (%flash.filters:color :swf-name "color" :type "uint" :static NIL)
     (%flash.filters:matrix :swf-name "matrix" :type "void" :static NIL)
     (%flash.filters:matrix :swf-name "matrix" :type "Array" :static NIL))
    :methods
    ((%flash.filters:clone :swf-name "clone" :return-type "flash.filters::BitmapFilter"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.ui:key-location (%flash:object)
    :swf-name "flash.ui::KeyLocation"
    :constants
    ((%flash.ui:+key-location-standard+ :swf-name "STANDARD" :type "uint" :value 0)
     (%flash.ui:+key-location-right+ :swf-name "RIGHT" :type "uint" :value 2)
     (%flash.ui:+key-location-left+ :swf-name "LEFT" :type "uint" :value 1)
     (%flash.ui:+key-location-num-pad+ :swf-name "NUM_PAD" :type "uint" :value 3))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.accessibility:accessibility (%flash:object)
    :swf-name "flash.accessibility::Accessibility"
    :constants
    ()
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.geom:perspective-projection (%flash:object)
    :swf-name "flash.geom::PerspectiveProjection"
    :constants
    ()
    :properties
    ((%flash.geom:focal-length :swf-name "focalLength" :type "void" :static NIL)
     (%flash.geom:field-of-view :swf-name "fieldOfView" :type "void" :static NIL)
     (%flash.geom:focal-length :swf-name "focalLength" :type "Number" :static NIL)
     (%flash.geom:projection-center :swf-name "projectionCenter" :type "*" :static NIL)
     (%flash.geom:field-of-view :swf-name "fieldOfView" :type "Number" :static NIL)
     (%flash.geom:projection-center :swf-name "projectionCenter" :type "flash.geom::Point" :static NIL))
    :methods
    ((%flash.geom:to-matrix3d :swf-name "toMatrix3D" :return-type "flash.geom::Matrix3D"
        :args NIL))))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:action-script-version (%flash:object)
    :swf-name "flash.display::ActionScriptVersion"
    :constants
    ((%flash.display:+actionscript3+ :swf-name "ACTIONSCRIPT3" :type "uint" :value 3)
     (%flash.display:+actionscript2+ :swf-name "ACTIONSCRIPT2" :type "uint" :value 2))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.net:net-stream-play-options (%flash.events:event-dispatcher)
    :swf-name "flash.net::NetStreamPlayOptions"
    :constants
    ()
    :properties
    ((%flash.net:transition :swf-name "transition" :type "String" :value NIL :static NIL)
     (%flash.net:stream-name :swf-name "streamName" :type "String" :value NIL :static NIL)
     (%flash.net:start :swf-name "start" :type "Number" :value NIL :static NIL)
     (%flash.net:len :swf-name "len" :type "Number" :value NIL :static NIL)
     (%flash.net:old-stream-name :swf-name "oldStreamName" :type "String" :value NIL :static NIL))
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.media:sound-codec (%flash:object)
    :swf-name "flash.media::SoundCodec"
    :constants
    ((%flash.media:+nellymoser+ :swf-name "NELLYMOSER" :type "String" :value "NellyMoser")
     (%flash.media:+speex+ :swf-name "SPEEX" :type "String" :value "Speex"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.display:triangle-culling (%flash:object)
    :swf-name "flash.display::TriangleCulling"
    :constants
    ((%flash.display:+positive+ :swf-name "POSITIVE" :type "String" :value "positive")
     (%flash.display:+none+ :swf-name "NONE" :type "String" :value "none")
     (%flash.display:+negative+ :swf-name "NEGATIVE" :type "String" :value "negative"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %flash.text.engine:digit-width (%flash:object)
    :swf-name "flash.text.engine::DigitWidth"
    :constants
    ((%flash.text.engine:+tabular+ :swf-name "TABULAR" :type "String" :value "tabular")
     (%flash.text.engine:+proportional+ :swf-name "PROPORTIONAL" :type "String" :value "proportional")
     (%flash.text.engine:+default+ :swf-name "DEFAULT" :type "String" :value "default"))
    :properties
    ()
    :methods
    ()))
(let ((*symbol-table* *player-symbol-table*))
  (declare-swf-class %authoring:auth-object (%flash:object)
    :swf-name "authoring::authObject"
    :constants
    ()
    :properties
    ((%authoring:next-sibling :swf-name "NextSibling" :type "authoring::authObject" :static NIL)
     (%authoring:first-child :swf-name "FirstChild" :type "authoring::authObject" :static NIL)
     (%authoring:swf-key :swf-name "SwfKey" :type "uint" :static NIL)
     (%authoring:type :swf-name "Type" :type "uint" :static NIL)
     (%authoring:key :swf-name "Key" :type "uint" :static NIL))
    :methods
    ((%authoring:obj-matrix :swf-name "ObjMatrix" :return-type "flash.geom::Matrix"
        :args NIL)
     (%authoring:is-primitive :swf-name "IsPrimitive" :return-type "Boolean"
        :args NIL)
     (%authoring:symbol-mode :swf-name "SymbolMode" :return-type "int"
        :args NIL)
     (%authoring:frame-for-frame-number :swf-name "FrameForFrameNumber" :return-type "authoring::authObject"
        :args (("frameNum" "int")))
     (%authoring:has-empty-path :swf-name "HasEmptyPath" :return-type "Boolean"
        :args NIL)
     (%authoring:registration-point :swf-name "RegistrationPoint" :return-type "flash.geom::Point"
        :args NIL)
     (%authoring:live-preview-size :swf-name "LivePreviewSize" :return-type "flash.geom::Point"
        :args NIL)
     (%authoring:scale9grid :swf-name "Scale9Grid" :return-type "flash.geom::Rectangle"
        :args NIL)
     (%authoring:symbol-behavior :swf-name "SymbolBehavior" :return-type "int"
        :args NIL)
     (%authoring:three-dmatrix :swf-name "ThreeDMatrix" :return-type "flash.geom::Matrix3D"
        :args NIL)
     (%authoring:locked :swf-name "Locked" :return-type "Boolean"
        :args NIL)
     (%authoring:frame-type :swf-name "FrameType" :return-type "uint"
        :args NIL)
     (%authoring:outline-mode :swf-name "OutlineMode" :return-type "Boolean"
        :args NIL)
     (%authoring:blending-mode :swf-name "BlendingMode" :return-type "String"
        :args NIL)
     (%authoring:filters :swf-name "Filters" :return-type "Array"
        :args NIL)
     (%authoring:outline-color :swf-name "OutlineColor" :return-type "uint"
        :args NIL)
     (%authoring:is-floater :swf-name "IsFloater" :return-type "Boolean"
        :args NIL)
     (%authoring:center-point :swf-name "CenterPoint" :return-type "flash.geom::Point"
        :args NIL)
     (%authoring:color-xform :swf-name "ColorXForm" :return-type "flash.geom::ColorTransform"
        :args NIL)
     (%authoring:three-d-translation-handle-points :swf-name "ThreeDTranslationHandlePoints" :return-type "Array"
        :args NIL)
     (%authoring:bounds :swf-name "Bounds" :return-type "flash.geom::Rectangle"
        :args (("flags" "uint") &OPTIONAL (("minFrame" "int") -16000)
               (("maxFrame" "int") 16000)))
     (%authoring:motion-path :swf-name "MotionPath" :return-type "authoring::authObject"
        :args NIL)
     (%authoring:has-shape-selection :swf-name "HasShapeSelection" :return-type "Boolean"
        :args NIL)
     (%authoring:start-position :swf-name "StartPosition" :return-type "int"
        :args NIL)
     (%authoring:is-visible :swf-name "IsVisible" :return-type "Boolean"
        :args (("inThumbnailPreview" "Boolean")))
     (%authoring:is-selected :swf-name "IsSelected" :return-type "Boolean"
        :args NIL)
     (%authoring:end-position :swf-name "EndPosition" :return-type "int"
        :args NIL)
     (%authoring:cache-as-bitmap :swf-name "CacheAsBitmap" :return-type "Boolean"
        :args NIL)
     (%authoring:frame-offset :swf-name "FrameOffset" :return-type "int"
        :args NIL))))
