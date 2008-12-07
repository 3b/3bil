;;; extracted from flex 4 /frameworks/libs/player/10/playerglobal.swc
;;; using modified version of ByteCodeDissassembler/ClassPrinter
;;; from http://www.libspark.org/svn/as3/ByteCodeDisassembler/
(:class "Object" :public t :dynamic t
 :properties (
  (:method "_hasOwnProperty" ("o" ("V" "String")) "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_dontEnumPrototype" (("proto" "Object")) "void" :namespace-type :static.protected  :static t :final t )
  (:method "_propertyIsEnumerable" ("o" ("V" "String")) "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_isPrototypeOf" ("o" "V") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_setPropertyIsEnumerable" ("o" ("V" "String") ("enumerable" "Boolean")) "void" :namespace-type :static.protected  :native t :static t :final t )
  (:method "_toString" ("o") "String" :namespace-type :private  :native t :static t :final t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:method "init" () "*" :namespace-type :internal  :static t :final t )
  (:constructor "Object" () "*")
  (:method "hasOwnProperty" (&optional "V") "Boolean" :namespace-type :public  )
  (:method "propertyIsEnumerable" (&optional "V") "Boolean" :namespace-type :public  )
  (:method "isPrototypeOf" (&optional "V") "Boolean" :namespace-type :public  )
))

(:class "Class" :extends "Object" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "Class" () "*")
  (:method-get "prototype" () "*"  :native t :final t )
))

(:class "Function" :extends "Object" :public t :dynamic t
 :properties (
  (:method "emptyCtor" () "*" :namespace-type :private  :static t :final t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "Function" () "*")
  (:method-get "prototype" () "*"  :native t )
  (:method-set "prototype" ("p") "*"  :native t )
  (:method "call" (&rest "thisArg") "*" :namespace-type :public  :native t )
  (:method-get "length" () "int"  :native t )
  (:method "apply" (&optional "thisArg" "argArray") "*" :namespace-type :public  :native t )
))

(:class "Namespace" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "length"    :type "null" :value 2 :static t )
  (:constructor "Namespace" (&optional "prefix" "uri") "*")
  (:method "valueOf" () "String" :namespace-type :public  )
  (:method-get "prefix" () "*"  :native t )
  (:method "toString" () "String" :namespace-type :public  )
  (:method-get "uri" () "String"  :native t )
))

(:class "Boolean" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "Boolean" (&optional "value") "*")
  (:method "valueOf" () "Boolean" :namespace-type :public  )
  (:method "toString" () "String" :namespace-type :public  )
))

(:class "Number" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "MIN_VALUE"    :type "Number" :value 4.9406564584124654e-324 :static t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constant :name "DTOSTR_FIXED"  :namespace-type :private   :type "int" :value 1 :static t )
  (:constant :name "POSITIVE_INFINITY"    :type "Number" :value Infinity :static t )
  (:constant :name "DTOSTR_PRECISION"  :namespace-type :private   :type "int" :value 2 :static t )
  (:constant :name "NEGATIVE_INFINITY"    :type "Number" :value -Infinity :static t )
  (:method "_convert" (("n" "Number") ("precision" "int") ("mode" "int")) "String" :namespace-type :private  :native t :static t :final t )
  (:constant :name "MAX_VALUE"    :type "Number" :value 1.79769313486231e+308 :static t )
  (:constant :name "DTOSTR_EXPONENTIAL"  :namespace-type :private   :type "int" :value 3 :static t )
  (:method "_toString" (("n" "Number") ("radix" "int")) "String" :namespace-type :private  :native t :static t :final t )
  (:constant :name "NaN"    :type "Number" :value NaN :static t )
  (:constructor "Number" (&optional ("value" 0)) "*")
  (:method "toPrecision" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "valueOf" () "Number" :namespace-type :public  )
  (:method "toFixed" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "toExponential" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "toString" (&optional ("radix" 10)) "String" :namespace-type :public  )
))

(:class "int" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "MIN_VALUE"    :type "int" :value -2147483648 :static t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constant :name "MAX_VALUE"    :type "int" :value 2147483647 :static t )
  (:constructor "int" (&optional ("value" 0)) "*")
  (:method "toPrecision" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "valueOf" () "int" :namespace-type :public  )
  (:method "toFixed" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "toExponential" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "toString" (&optional ("radix" 10)) "String" :namespace-type :public  )
))

(:class "uint" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "MIN_VALUE"    :type "uint" :value 0 :static t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constant :name "MAX_VALUE"    :type "uint" :value 4294967295 :static t )
  (:constructor "uint" (&optional ("value" 0)) "*")
  (:method "toPrecision" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "valueOf" () "uint" :namespace-type :public  )
  (:method "toFixed" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "toExponential" (&optional ("p" 0)) "String" :namespace-type :public  )
  (:method "toString" (&optional ("radix" 10)) "String" :namespace-type :public  )
))

(:class "String" :extends "Object" :public t :final t 
 :properties (
  (:method "_replace" (("s" "String") "p" "repl") "String" :namespace-type :private  :native t :static t :final t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:method "_match" (("s" "String") "p") "Array" :namespace-type :private  :native t :static t :final t )
  (:method "_search" (("s" "String") "p") "int" :namespace-type :private  :native t :static t :final t )
  (:method "_split" (("s" "String") "delim" ("limit" "uint")) "Array" :namespace-type :private  :native t :static t :final t )
  (:method "fromCharCode" () "String" :namespace-type :public  :native t :static t :final t )
  (:constructor "String" (&optional ("value" "")) "*")
  (:method "match" (&optional "p") "Array" :namespace-type :public  )
  (:method "_charAt" (&optional (("i" "int") 0)) "String" :namespace-type :private  :native t )
  (:method "indexOf" (&optional (("s" "String") "undefined") (("i" "Number") 0)) "int" :namespace-type :public  :native t )
  (:method "_indexOf" (("s" "String") &optional (("i" "int") 0)) "int" :namespace-type :private  :native t )
  (:method "_substr" (&optional (("start" "int") 0) (("end" "int") 2147483647)) "String" :namespace-type :private  :native t )
  (:method "substring" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "String" :namespace-type :public  :native t )
  (:method "slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "String" :namespace-type :public  :native t )
  (:method "lastIndexOf" (&optional (("s" "String") "undefined") (("i" "Number") 2147483647)) "int" :namespace-type :public  :native t )
  (:method "_lastIndexOf" (("s" "String") &optional (("i" "int") 2147483647)) "int" :namespace-type :private  :native t )
  (:method "_charCodeAt" (&optional (("i" "int") 0)) "Number" :namespace-type :private  :native t )
  (:method "toLowerCase" () "String" :namespace-type :public  :native t )
  (:method "_substring" (&optional (("start" "int") 0) (("end" "int") 2147483647)) "String" :namespace-type :private  :native t )
  (:method "split" (&optional "delim" ("limit" 4294967295)) "Array" :namespace-type :public  )
  (:method "concat" () "String" :namespace-type :public  )
  (:method "toLocaleLowerCase" () "String" :namespace-type :public  )
  (:method "_slice" (&optional (("start" "int") 0) (("end" "int") 2147483647)) "String" :namespace-type :private  :native t )
  (:method-get "length" () "int"  :native t )
  (:method "search" (&optional "p") "int" :namespace-type :public  )
  (:method "charAt" (&optional (("i" "Number") 0)) "String" :namespace-type :public  :native t )
  (:method "localeCompare" (&optional ("other" "String")) "int" :namespace-type :public  :native t )
  (:method "toString" () "String" :namespace-type :public  )
  (:method "valueOf" () "String" :namespace-type :public  )
  (:method "substr" (&optional (("start" "Number") 0) (("len" "Number") 2147483647)) "String" :namespace-type :public  :native t )
  (:method "replace" (&optional "p" "repl") "String" :namespace-type :public  )
  (:method "charCodeAt" (&optional (("i" "Number") 0)) "Number" :namespace-type :public  :native t )
  (:method "toUpperCase" () "String" :namespace-type :public  :native t )
  (:method "toLocaleUpperCase" () "String" :namespace-type :public  )
))

(:class "Array" :extends "Object" :public t :dynamic t
 :properties (
  (:constant :name "CASEINSENSITIVE"    :type "uint" :value 1 :static t )
  (:method "_shift" ("o") "*" :namespace-type :private  :native t :static t :final t )
  (:method "_join" ("o" "sep") "String" :namespace-type :private  :static t :final t )
  (:method "_indexOf" ("o" "searchElement" ("fromIndex" "int")) "int" :namespace-type :private  :native t :static t :final t )
  (:method "_pop" ("o") "*" :namespace-type :private  :native t :static t :final t )
  (:method "_slice" ("o" ("A" "Number") ("B" "Number")) "Array" :namespace-type :private  :native t :static t :final t )
  (:method "_lastIndexOf" ("o" "searchElement" &optional (("fromIndex" "int") 0)) "int" :namespace-type :private  :native t :static t :final t )
  (:method "_filter" ("o" ("callback" "Function") "thisObject") "Array" :namespace-type :private  :native t :static t :final t )
  (:method "_splice" ("o" ("args" "Array")) "Array" :namespace-type :private  :native t :static t :final t )
  (:method "_every" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_map" ("o" ("callback" "Function") "thisObject") "Array" :namespace-type :private  :native t :static t :final t )
  (:method "_reverse" ("o") "*" :namespace-type :private  :native t :static t :final t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:method "_forEach" ("o" ("callback" "Function") "thisObject") "void" :namespace-type :private  :native t :static t :final t )
  (:constant :name "NUMERIC"    :type "uint" :value 16 :static t )
  (:constant :name "UNIQUESORT"    :type "uint" :value 4 :static t )
  (:method "_concat" ("o" ("args" "Array")) "Array" :namespace-type :private  :native t :static t :final t )
  (:method "_some" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:constant :name "RETURNINDEXEDARRAY"    :type "uint" :value 8 :static t )
  (:method "_sortOn" ("o" "names" "options") "*" :namespace-type :private  :native t :static t :final t )
  (:method "_sort" ("o" ("args" "Array")) "*" :namespace-type :private  :native t :static t :final t )
  (:constant :name "DESCENDING"    :type "uint" :value 2 :static t )
  (:constructor "Array" () "*")
  (:method "reverse" () "Array" :namespace-type :public  )
  (:method "map" (("callback" "Function") &optional "thisObject") "Array" :namespace-type :public  )
  (:method "shift" () "*" :namespace-type :public  )
  (:method-get "length" () "uint"  :native t )
  (:method "unshift" () "uint" :namespace-type :public  :native t )
  (:method "join" (&optional "sep") "String" :namespace-type :public  )
  (:method "lastIndexOf" ("searchElement" &optional ("fromIndex" 2147483647)) "int" :namespace-type :public  )
  (:method-set "length" (("newLength" "uint")) "*"  :native t )
  (:method "indexOf" ("searchElement" &optional ("fromIndex" 0)) "int" :namespace-type :public  )
  (:method "pop" () "*" :namespace-type :public  :native t )
  (:method "slice" (&optional ("A" 0) ("B" 4294967295)) "Array" :namespace-type :public  )
  (:method "concat" () "Array" :namespace-type :public  )
  (:method "some" (("callback" "Function") &optional "thisObject") "Boolean" :namespace-type :public  )
  (:method "filter" (("callback" "Function") &optional "thisObject") "Array" :namespace-type :public  )
  (:method "forEach" (("callback" "Function") &optional "thisObject") "void" :namespace-type :public  )
  (:method "push" () "uint" :namespace-type :public  :native t )
  (:method "every" (("callback" "Function") &optional "thisObject") "Boolean" :namespace-type :public  )
  (:method "splice" () "*" :namespace-type :public  )
  (:method "sortOn" (&optional ("names" 0) &rest "options") "*" :namespace-type :public  )
  (:method "sort" () "*" :namespace-type :public  )
))

(:class "__AS3__.vec::Vector" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:constructor "Vector" () "*")
))

(:class "__AS3__.vec::Vector$object" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:method "castToThisType" ("item") "internal::__AS3__.vec::Vector$object" :namespace-type :private  :static t :final t )
  (:method "_forEach" ("o" ("callback" "Function") "thisObject") "void" :namespace-type :private  :native t :static t :final t )
  (:method "_every" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_some" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_sort" ("o" ("args" "Array")) "*" :namespace-type :private  :native t :static t :final t )
  (:constructor "Vector$object" (&optional (("length" "uint") 0) (("fixed" "Boolean") nil #|| false||# )) "*")
  (:method "_shift" () "*" :namespace-type :private  )
  (:method "reverse" () "internal::__AS3__.vec::Vector$object" :namespace-type :public  )
  (:method "unshift" () "uint" :namespace-type :public  :native t )
  (:method "clamp" (("val" "Number") ("len" "uint")) "uint" :namespace-type :private  )
  (:method-set "length" (("value" "uint")) "*"  :native t )
  (:method "indexOf" (("value" "Object") &optional (("from" "Number") 0)) "Number" :namespace-type :public  )
  (:method "pop" () "*" :namespace-type :public  :native t )
  (:method "slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "internal::__AS3__.vec::Vector$object" :namespace-type :public  )
  (:method "_slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "*" :namespace-type :private  )
  (:method "concat" () "internal::__AS3__.vec::Vector$object" :namespace-type :public  )
  (:method-get "fixed" () "Boolean"  :native t )
  (:method "_filter" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "push" () "uint" :namespace-type :public  :native t )
  (:method "every" (("checker" "Function") &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "map" (("mapper" "Function") &optional ("thisObj" "Object")) "*" :namespace-type :public  )
  (:method "_map" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "sort" ("comparefn") "internal::__AS3__.vec::Vector$object" :namespace-type :public  )
  (:method "_splice" ("start" "deleteCount" ("items" "Array")) "*" :namespace-type :private  )
  (:method "_reverse" () "void" :namespace-type :private  :native t )
  (:method "shift" () "*" :namespace-type :public  )
  (:method-get "length" () "uint"  :native t )
  (:method-set "fixed" (("f" "Boolean")) "*"  :native t )
  (:method "_spliceHelper" (("insertpoint" "uint") ("insertcount" "uint") ("deleteCount" "uint") ("args" "Object") ("offset" "int")) "void" :namespace-type :private  :native t )
  (:method "join" (&optional (("separator" "String") ",")) "String" :namespace-type :public  )
  (:method "lastIndexOf" (("value" "Object") &optional (("from" "Number") 2147483647)) "Number" :namespace-type :public  )
  (:method "toString" () "String" :namespace-type :public  )
  (:method "toLocaleString" () "String" :namespace-type :public  )
  (:method "forEach" (("eacher" "Function") &optional ("thisObj" "Object")) "void" :namespace-type :public  )
  (:method "_concat" (("items" "Array")) "*" :namespace-type :private  )
  (:method-set "type" (("t" "Object")) "void" :namespace-type :private  :native t )
  (:method "newThisType" (&optional (("length" "uint") 0)) "internal::__AS3__.vec::Vector$object" :namespace-type :private  )
  (:method-get "type" () "Object" :namespace-type :private  :native t )
  (:method "some" ("checker" &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "splice" (("start" "Number") &rest ("deleteCount" "Number")) "internal::__AS3__.vec::Vector$object" :namespace-type :public  )
  (:method "filter" (("checker" "Function") &optional ("thisObj" "Object")) "internal::__AS3__.vec::Vector$object" :namespace-type :public  )
))

(:class "__AS3__.vec::Vector$int" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:method "castToThisType" ("item") "internal::__AS3__.vec::Vector$int" :namespace-type :private  :static t :final t )
  (:method "_some" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "newThisType" (&optional (("length" "uint") 0)) "internal::__AS3__.vec::Vector$int" :namespace-type :private  :static t :final t )
  (:method "_forEach" ("o" ("callback" "Function") "thisObject") "void" :namespace-type :private  :native t :static t :final t )
  (:method "_every" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_sort" ("o" ("args" "Array")) "*" :namespace-type :private  :native t :static t :final t )
  (:constructor "Vector$int" (&optional (("length" "uint") 0) (("fixed" "Boolean") nil #|| false||# )) "*")
  (:method "shift" () "int" :namespace-type :public  )
  (:method "_shift" () "*" :namespace-type :private  )
  (:method "reverse" () "internal::__AS3__.vec::Vector$int" :namespace-type :public  )
  (:method "unshift" () "uint" :namespace-type :public  :native t )
  (:method-set "length" (("value" "uint")) "*"  :native t )
  (:method "indexOf" (("value" "int") &optional (("from" "Number") 0)) "Number" :namespace-type :public  )
  (:method "pop" () "int" :namespace-type :public  :native t )
  (:method "slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "internal::__AS3__.vec::Vector$int" :namespace-type :public  )
  (:method "_slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "*" :namespace-type :private  )
  (:method "concat" () "internal::__AS3__.vec::Vector$int" :namespace-type :public  )
  (:method "some" ("checker" &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "_filter" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "push" () "uint" :namespace-type :public  :native t )
  (:method "every" (("checker" "Function") &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "map" (("mapper" "Function") &optional ("thisObj" "Object")) "*" :namespace-type :public  )
  (:method "_map" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "sort" ("comparefn") "internal::__AS3__.vec::Vector$int" :namespace-type :public  )
  (:method "_splice" ("start" "deleteCount" ("items" "Array")) "*" :namespace-type :private  )
  (:method "_reverse" () "void" :namespace-type :private  :native t )
  (:method-get "length" () "uint"  :native t )
  (:method-set "fixed" (("f" "Boolean")) "*"  :native t )
  (:method "_spliceHelper" (("insertpoint" "uint") ("insertcount" "uint") ("deleteCount" "uint") ("args" "Object") ("offset" "int")) "void" :namespace-type :private  :native t )
  (:method "forEach" (("eacher" "Function") &optional ("thisObj" "Object")) "void" :namespace-type :public  )
  (:method "lastIndexOf" (("value" "int") &optional (("from" "Number") 2147483647)) "Number" :namespace-type :public  )
  (:method "toString" () "String" :namespace-type :public  )
  (:method "toLocaleString" () "String" :namespace-type :public  )
  (:method "join" (&optional (("separator" "String") ",")) "String" :namespace-type :public  )
  (:method "_concat" (("items" "Array")) "*" :namespace-type :private  )
  (:method-get "fixed" () "Boolean"  :native t )
  (:method "filter" (("checker" "Function") &optional ("thisObj" "Object")) "internal::__AS3__.vec::Vector$int" :namespace-type :public  )
  (:method "clamp" (("val" "Number") ("len" "uint")) "uint" :namespace-type :private  )
  (:method "splice" (("start" "Number") &rest ("deleteCount" "Number")) "internal::__AS3__.vec::Vector$int" :namespace-type :public  )
))

(:class "__AS3__.vec::Vector$uint" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:method "castToThisType" ("item") "internal::__AS3__.vec::Vector$uint" :namespace-type :private  :static t :final t )
  (:method "_some" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "newThisType" (&optional (("length" "uint") 0)) "internal::__AS3__.vec::Vector$uint" :namespace-type :private  :static t :final t )
  (:method "_forEach" ("o" ("callback" "Function") "thisObject") "void" :namespace-type :private  :native t :static t :final t )
  (:method "_every" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_sort" ("o" ("args" "Array")) "*" :namespace-type :private  :native t :static t :final t )
  (:constructor "Vector$uint" (&optional (("length" "uint") 0) (("fixed" "Boolean") nil #|| false||# )) "*")
  (:method "shift" () "uint" :namespace-type :public  )
  (:method "_shift" () "*" :namespace-type :private  )
  (:method "reverse" () "internal::__AS3__.vec::Vector$uint" :namespace-type :public  )
  (:method "unshift" () "uint" :namespace-type :public  :native t )
  (:method-set "length" (("value" "uint")) "*"  :native t )
  (:method "indexOf" (("value" "uint") &optional (("from" "Number") 0)) "Number" :namespace-type :public  )
  (:method "pop" () "uint" :namespace-type :public  :native t )
  (:method "slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "internal::__AS3__.vec::Vector$uint" :namespace-type :public  )
  (:method "_slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "*" :namespace-type :private  )
  (:method "concat" () "internal::__AS3__.vec::Vector$uint" :namespace-type :public  )
  (:method "some" ("checker" &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "_filter" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "push" () "uint" :namespace-type :public  :native t )
  (:method "every" (("checker" "Function") &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "map" (("mapper" "Function") &optional ("thisObj" "Object")) "*" :namespace-type :public  )
  (:method "_map" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "sort" ("comparefn") "internal::__AS3__.vec::Vector$uint" :namespace-type :public  )
  (:method "_splice" ("start" "deleteCount" ("items" "Array")) "*" :namespace-type :private  )
  (:method "_reverse" () "void" :namespace-type :private  :native t )
  (:method-get "length" () "uint"  :native t )
  (:method-set "fixed" (("f" "Boolean")) "*"  :native t )
  (:method "_spliceHelper" (("insertpoint" "uint") ("insertcount" "uint") ("deleteCount" "uint") ("args" "Object") ("offset" "int")) "void" :namespace-type :private  :native t )
  (:method "forEach" (("eacher" "Function") &optional ("thisObj" "Object")) "void" :namespace-type :public  )
  (:method "lastIndexOf" (("value" "uint") &optional (("from" "Number") 2147483647)) "Number" :namespace-type :public  )
  (:method "toString" () "String" :namespace-type :public  )
  (:method "toLocaleString" () "String" :namespace-type :public  )
  (:method "join" (&optional (("separator" "String") ",")) "String" :namespace-type :public  )
  (:method "_concat" (("items" "Array")) "*" :namespace-type :private  )
  (:method-get "fixed" () "Boolean"  :native t )
  (:method "filter" (("checker" "Function") &optional ("thisObj" "Object")) "internal::__AS3__.vec::Vector$uint" :namespace-type :public  )
  (:method "clamp" (("val" "Number") ("len" "uint")) "uint" :namespace-type :private  )
  (:method "splice" (("start" "Number") &rest ("deleteCount" "Number")) "internal::__AS3__.vec::Vector$uint" :namespace-type :public  )
))

(:class "__AS3__.vec::Vector$double" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:method "castToThisType" ("item") "internal::__AS3__.vec::Vector$double" :namespace-type :private  :static t :final t )
  (:method "_some" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "newThisType" (&optional (("length" "uint") 0)) "internal::__AS3__.vec::Vector$double" :namespace-type :private  :static t :final t )
  (:method "_forEach" ("o" ("callback" "Function") "thisObject") "void" :namespace-type :private  :native t :static t :final t )
  (:method "_every" ("o" ("callback" "Function") "thisObject") "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_sort" ("o" ("args" "Array")) "*" :namespace-type :private  :native t :static t :final t )
  (:constructor "Vector$double" (&optional (("length" "uint") 0) (("fixed" "Boolean") nil #|| false||# )) "*")
  (:method "shift" () "Number" :namespace-type :public  )
  (:method "_shift" () "*" :namespace-type :private  )
  (:method "reverse" () "internal::__AS3__.vec::Vector$double" :namespace-type :public  )
  (:method "unshift" () "uint" :namespace-type :public  :native t )
  (:method-set "length" (("value" "uint")) "*"  :native t )
  (:method "indexOf" (("value" "Number") &optional (("from" "Number") 0)) "Number" :namespace-type :public  )
  (:method "pop" () "Number" :namespace-type :public  :native t )
  (:method "slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "internal::__AS3__.vec::Vector$double" :namespace-type :public  )
  (:method "_slice" (&optional (("start" "Number") 0) (("end" "Number") 2147483647)) "*" :namespace-type :private  )
  (:method "concat" () "internal::__AS3__.vec::Vector$double" :namespace-type :public  )
  (:method "some" ("checker" &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "_filter" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "push" () "uint" :namespace-type :public  :native t )
  (:method "every" (("checker" "Function") &optional ("thisObj" "Object")) "Boolean" :namespace-type :public  )
  (:method "map" (("mapper" "Function") &optional ("thisObj" "Object")) "*" :namespace-type :public  )
  (:method "_map" (("callback" "Function") "thisObject") "*" :namespace-type :private  :native t )
  (:method "sort" ("comparefn") "internal::__AS3__.vec::Vector$double" :namespace-type :public  )
  (:method "_splice" ("start" "deleteCount" ("items" "Array")) "*" :namespace-type :private  )
  (:method "_reverse" () "void" :namespace-type :private  :native t )
  (:method-get "length" () "uint"  :native t )
  (:method-set "fixed" (("f" "Boolean")) "*"  :native t )
  (:method "_spliceHelper" (("insertpoint" "uint") ("insertcount" "uint") ("deleteCount" "uint") ("args" "Object") ("offset" "int")) "void" :namespace-type :private  :native t )
  (:method "forEach" (("eacher" "Function") &optional ("thisObj" "Object")) "void" :namespace-type :public  )
  (:method "lastIndexOf" (("value" "Number") &optional (("from" "Number") 2147483647)) "Number" :namespace-type :public  )
  (:method "toString" () "String" :namespace-type :public  )
  (:method "toLocaleString" () "String" :namespace-type :public  )
  (:method "join" (&optional (("separator" "String") ",")) "String" :namespace-type :public  )
  (:method "_concat" (("items" "Array")) "*" :namespace-type :private  )
  (:method-get "fixed" () "Boolean"  :native t )
  (:method "filter" (("checker" "Function") &optional ("thisObj" "Object")) "internal::__AS3__.vec::Vector$double" :namespace-type :public  )
  (:method "clamp" (("val" "Number") ("len" "uint")) "uint" :namespace-type :private  )
  (:method "splice" (("start" "Number") &rest ("deleteCount" "Number")) "internal::__AS3__.vec::Vector$double" :namespace-type :public  )
))

(:class "builtin.as$0::MethodClosure" :extends "Function" :public t :final t 
 :properties (
  (:constructor "MethodClosure" () "*")
  (:method-get "prototype" () "*"  :override t )
  (:method-set "prototype" ("p") "*"  :override t )
  (:method-get "savedThis" () "Object" :namespace-type :private  :native t )
  (:method-get "length" () "int"  :native t :override t )
))

  (:method "escape" (&optional (("s" "String") "undefined")) "String"  :native t )
  (:method "encodeURI" (&optional (("uri" "String") "undefined")) "String"  :native t )
  (:method "decodeURI" (&optional (("uri" "String") "undefined")) "String"  :native t )
  (:method "encodeURIComponent" (&optional (("uri" "String") "undefined")) "String"  :native t )
  (:method "parseInt" (&optional (("s" "String") "NaN") (("radix" "int") 0)) "Number"  :native t )
  (:constant :name "AS3"    :type "null" :value "public::http://adobe.com/AS3/2006/builtin" )
  (:constant :name "Infinity"    :type "Number" :value Infinity )
  (:constant :name "undefined"    :type "null" )
  (:constant :name "NaN"    :type "Number" :value NaN )
  (:method "unescape" (&optional (("s" "String") "undefined")) "String"  :native t )
  (:method "parseFloat" (&optional (("str" "String") "NaN")) "Number"  :native t )
  (:method "isNaN" (&optional ("n" "Number")) "Boolean"  :native t )
  (:method "isFinite" (&optional ("n" "Number")) "Boolean"  :native t )
  (:method "decodeURIComponent" (&optional (("uri" "String") "undefined")) "String"  :native t )

(:class "flash.system::System" :extends "Object" :public t :final t 
 :properties (
  (:method-get "ime" () "flash.system::IME"  :static t :final t )
  (:method-get "useCodePage" () "Boolean"  :native t :static t :final t )
  (:method-get "totalMemory" () "uint"  :native t :static t :final t )
  (:method-set "useCodePage" (("value" "Boolean")) "void"  :native t :static t :final t )
  (:method-get "vmVersion" () "String"  :native t :static t :final t )
  (:method "resume" () "void"  :native t :static t :final t )
  (:variable :name "theIME"  :namespace-type :private   :type "flash.system::IME" :value :null #|| null||#  :static t )
  (:method "setClipboard" (("string" "String")) "void"  :native t :static t :final t )
  (:method "pause" () "void"  :native t :static t :final t )
  (:method "gc" () "void"  :native t :static t :final t )
  (:method "exit" (("code" "uint")) "void"  :native t :static t :final t )
  (:constructor "System" () "*")
))


(:class "flash.sampler::StackFrame" :extends "Object" :public t :final t 
 :properties (
  (:constructor "StackFrame" () "*")
  (:method "toString" () "String"  )
  (:constant :name "line"    :type "uint" )
  (:constant :name "name"    :type "String" )
  (:constant :name "file"    :type "String" )
))

(:class "flash.sampler::Sample" :extends "Object" :public t 
 :properties (
  (:constructor "Sample" () "*")
  (:constant :name "stack"    :type "Array" )
  (:constant :name "time"    :type "Number" )
))

(:class "flash.sampler::NewObjectSample" :extends "flash.sampler::Sample" :public t :final t 
 :properties (
  (:constructor "NewObjectSample" () "*")
  (:constant :name "type"    :type "Class" )
  (:constant :name "id"    :type "Number" )
  (:method-get "object" () "*"  :native t )
))

(:class "flash.sampler::DeleteObjectSample" :extends "flash.sampler::Sample" :public t :final t 
 :properties (
  (:constructor "DeleteObjectSample" () "*")
  (:constant :name "size"    :type "Number" )
  (:constant :name "id"    :type "Number" )
))

  (:method "pauseSampling" () "void"  :native t :uri "flash.sampler" )
  (:method "stopSampling" () "void"  :native t :uri "flash.sampler" )
  (:method "getMemberNames" (("o" "Object") &optional (("instanceNames" "Boolean") nil #|| false||# )) "Object"  :native t :uri "flash.sampler" )
  (:method "getGetterInvocationCount" (("obj" "Object") ("qname" "QName")) "Number"  :uri "flash.sampler" )
  (:method "getInvocationCount" (("obj" "Object") ("qname" "QName")) "Number"  :uri "flash.sampler" )
  (:method "getSetterInvocationCount" (("obj" "Object") ("qname" "QName")) "Number"  :uri "flash.sampler" )
  (:method "isGetterSetter" (("obj" "Object") ("qname" "QName")) "Boolean"  :native t :uri "flash.sampler" )
  (:method "_getInvocationCount" (("obj" "Object") ("qname" "QName") ("type" "uint")) "Number" :namespace-type :internal  :native t :uri "flash.sampler" )
  (:method "getSamples" () "Object"  :native t :uri "flash.sampler" )
  (:method "getSampleCount" () "Number"  :native t :uri "flash.sampler" )
  (:method "startSampling" () "void"  :native t :uri "flash.sampler" )
  (:method "getSize" ("o") "Number"  :native t :uri "flash.sampler" )
  (:method "clearSamples" () "void"  :native t :uri "flash.sampler" )

(:class "flash.events::Event" :extends "Object" :public t 
 :properties (
  (:constant :name "CANCEL"    :type "String" :value "cancel" :static t )
  (:constant :name "ENTER_FRAME"    :type "String" :value "enterFrame" :static t )
  (:constant :name "SOUND_COMPLETE"    :type "String" :value "soundComplete" :static t )
  (:constant :name "UNLOAD"    :type "String" :value "unload" :static t )
  (:constant :name "INIT"    :type "String" :value "init" :static t )
  (:constant :name "RENDER"    :type "String" :value "render" :static t )
  (:constant :name "TAB_ENABLED_CHANGE"    :type "String" :value "tabEnabledChange" :static t )
  (:constant :name "ADDED_TO_STAGE"    :type "String" :value "addedToStage" :static t )
  (:constant :name "FRAME_CONSTRUCTED"    :type "String" :value "frameConstructed" :static t )
  (:constant :name "TAB_CHILDREN_CHANGE"    :type "String" :value "tabChildrenChange" :static t )
  (:constant :name "CUT"    :type "String" :value "cut" :static t )
  (:constant :name "CLEAR"    :type "String" :value "clear" :static t )
  (:constant :name "CHANGE"    :type "String" :value "change" :static t )
  (:constant :name "RESIZE"    :type "String" :value "resize" :static t )
  (:constant :name "COMPLETE"    :type "String" :value "complete" :static t )
  (:constant :name "FULLSCREEN"    :type "String" :value "fullScreen" :static t )
  (:constant :name "SELECT_ALL"    :type "String" :value "selectAll" :static t )
  (:constant :name "REMOVED"    :type "String" :value "removed" :static t )
  (:constant :name "CONNECT"    :type "String" :value "connect" :static t )
  (:constant :name "SCROLL"    :type "String" :value "scroll" :static t )
  (:constant :name "OPEN"    :type "String" :value "open" :static t )
  (:constant :name "CLOSE"    :type "String" :value "close" :static t )
  (:constant :name "MOUSE_LEAVE"    :type "String" :value "mouseLeave" :static t )
  (:constant :name "ADDED"    :type "String" :value "added" :static t )
  (:constant :name "REMOVED_FROM_STAGE"    :type "String" :value "removedFromStage" :static t )
  (:constant :name "EXIT_FRAME"    :type "String" :value "exitFrame" :static t )
  (:constant :name "TAB_INDEX_CHANGE"    :type "String" :value "tabIndexChange" :static t )
  (:constant :name "PASTE"    :type "String" :value "paste" :static t )
  (:constant :name "DEACTIVATE"    :type "String" :value "deactivate" :static t )
  (:constant :name "COPY"    :type "String" :value "copy" :static t )
  (:constant :name "ID3"    :type "String" :value "id3" :static t )
  (:constant :name "ACTIVATE"    :type "String" :value "activate" :static t )
  (:constant :name "SELECT"    :type "String" :value "select" :static t )
  (:constructor "Event" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# )) "*")
  (:method "isDefaultPrevented" () "Boolean"  :native t )
  (:method-get "eventPhase" () "uint"  :native t )
  (:method "formatToString" (&rest ("className" "String")) "String"  )
  (:method "clone" () "flash.events::Event"  )
  (:method-get "bubbles" () "Boolean"  :native t )
  (:method "preventDefault" () "void"  :native t )
  (:method "stopPropagation" () "void"  :native t )
  (:method "toString" () "String"  )
  (:method-get "target" () "Object"  :native t )
  (:method-get "cancelable" () "Boolean"  :native t )
  (:method-get "currentTarget" () "Object"  :native t )
  (:method-get "type" () "String"  :native t )
  (:method "stopImmediatePropagation" () "void"  :native t )
))


(:class "flash.events::TextEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "TEXT_INPUT"    :type "String" :value "textInput" :static t )
  (:constant :name "LINK"    :type "String" :value "link" :static t )
  (:constructor "TextEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("text" "String") "")) "*")
  (:method-get "text" () "String"  )
  (:method-set "text" (("value" "String")) "void"  )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:variable :name "m_text"  :namespace-type :private   :type "String" )
))


(:class "flash.events::ErrorEvent" :extends "flash.events::TextEvent" :public t 
 :properties (
  (:constant :name "ERROR"    :type "String" :value "error" :static t )
  (:constructor "ErrorEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("text" "String") "")) "*")
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:class "flash.events::AsyncErrorEvent" :extends "flash.events::ErrorEvent" :public t 
 :properties (
  (:constant :name "ASYNC_ERROR"    :type "String" :value "asyncError" :static t )
  (:constructor "AsyncErrorEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("text" "String") "") ("error" "Error")) "*")
  (:variable :name "error"    :type "Error" )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:interface "flash.utils::IDataOutput" :public t 
 :properties (
  (:constructor "IDataOutput" () "*")
  (:method "writeMultiByte" (("value" "String") ("charSet" "String")) "void" :namespace-type :public  )
  (:method "writeUTFBytes" (("value" "String")) "void" :namespace-type :public  )
  (:method "writeShort" (("value" "int")) "void" :namespace-type :public  )
  (:method "writeByte" (("value" "int")) "void" :namespace-type :public  )
  (:method "writeUTF" (("value" "String")) "void" :namespace-type :public  )
  (:method "writeBoolean" (("value" "Boolean")) "void" :namespace-type :public  )
  (:method-get "endian" () "String" :namespace-type :public  )
  (:method-set "objectEncoding" (("version" "uint")) "void" :namespace-type :public  )
  (:method "writeBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void" :namespace-type :public  )
  (:method "writeInt" (("value" "int")) "void" :namespace-type :public  )
  (:method-get "objectEncoding" () "uint" :namespace-type :public  )
  (:method-set "endian" (("type" "String")) "void" :namespace-type :public  )
  (:method "writeDouble" (("value" "Number")) "void" :namespace-type :public  )
  (:method "writeUnsignedInt" (("value" "uint")) "void" :namespace-type :public  )
  (:method "writeFloat" (("value" "Number")) "void" :namespace-type :public  )
  (:method "writeObject" ("object") "void" :namespace-type :public  )
))


(:interface "flash.utils::IDataInput" :public t 
 :properties (
  (:constructor "IDataInput" () "*")
  (:method-get "objectEncoding" () "uint" :namespace-type :public  )
  (:method "readUnsignedInt" () "uint" :namespace-type :public  )
  (:method-get "bytesAvailable" () "uint" :namespace-type :public  )
  (:method "readShort" () "int" :namespace-type :public  )
  (:method "readDouble" () "Number" :namespace-type :public  )
  (:method "readMultiByte" (("length" "uint") ("charSet" "String")) "String" :namespace-type :public  )
  (:method "readFloat" () "Number" :namespace-type :public  )
  (:method "readUnsignedShort" () "uint" :namespace-type :public  )
  (:method "readBoolean" () "Boolean" :namespace-type :public  )
  (:method "readUnsignedByte" () "uint" :namespace-type :public  )
  (:method "readBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void" :namespace-type :public  )
  (:method-set "endian" (("type" "String")) "void" :namespace-type :public  )
  (:method "readUTF" () "String" :namespace-type :public  )
  (:method "readInt" () "int" :namespace-type :public  )
  (:method "readUTFBytes" (("length" "uint")) "String" :namespace-type :public  )
  (:method-get "endian" () "String" :namespace-type :public  )
  (:method "readObject" () "*" :namespace-type :public  )
  (:method-set "objectEncoding" (("version" "uint")) "void" :namespace-type :public  )
  (:method "readByte" () "int" :namespace-type :public  )
))


(:class "flash.utils::ByteArray" :extends "Object" :implements ("IDataOutput"  ) :public t 
 :properties (
  (:method-get "defaultObjectEncoding" () "uint"  :native t :static t :final t )
  (:method-set "defaultObjectEncoding" (("version" "uint")) "void"  :native t :static t :final t )
  (:constructor "ByteArray" () "*")
  (:method "writeUTFBytes" (("value" "String")) "void"  :native t )
  (:method "readShort" () "int"  :native t )
  (:method "writeByte" (("value" "int")) "void"  :native t )
  (:method "writeDouble" (("value" "Number")) "void"  :native t )
  (:method "readUnsignedShort" () "uint"  :native t )
  (:method "readDouble" () "Number"  :native t )
  (:method "writeInt" (("value" "int")) "void"  :native t )
  (:method "_uncompress" (("algorithm" "String")) "void" :namespace-type :private  :native t )
  (:method-get "endian" () "String"  :native t )
  (:method-get "bytesAvailable" () "uint"  :native t )
  (:method "readObject" () "*"  :native t )
  (:method "deflate" () "void"  )
  (:method-get "position" () "uint"  :native t )
  (:method "readBoolean" () "Boolean"  :native t )
  (:method "inflate" () "void"  )
  (:method-set "endian" (("type" "String")) "void"  :native t )
  (:method "readUTF" () "String"  :native t )
  (:method "readUTFBytes" (("length" "uint")) "String"  :native t )
  (:method "writeFloat" (("value" "Number")) "void"  :native t )
  (:method "writeMultiByte" (("value" "String") ("charSet" "String")) "void"  :native t )
  (:method "readUnsignedInt" () "uint"  :native t )
  (:method "readByte" () "int"  :native t )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method "writeBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void"  :native t )
  (:method "clear" () "void"  :native t )
  (:method "writeUTF" (("value" "String")) "void"  :native t )
  (:method "writeBoolean" (("value" "Boolean")) "void"  :native t )
  (:method-set "position" (("offset" "uint")) "void"  :native t )
  (:method "_compress" (("algorithm" "String")) "void" :namespace-type :private  :native t )
  (:method "readUnsignedByte" () "uint"  :native t )
  (:method "writeUnsignedInt" (("value" "uint")) "void"  :native t )
  (:method "writeShort" (("value" "int")) "void"  :native t )
  (:method-get "length" () "uint"  :native t )
  (:method "compress" () "void"  )
  (:method "toString" () "String"  :native t )
  (:method-set "length" (("value" "uint")) "void"  :native t )
  (:method-set "objectEncoding" (("version" "uint")) "void"  :native t )
  (:method "readFloat" () "Number"  :native t )
  (:method "readInt" () "int"  :native t )
  (:method "readMultiByte" (("length" "uint") ("charSet" "String")) "String"  :native t )
  (:method "uncompress" () "void"  )
  (:method "readBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void"  :native t )
  (:method "writeObject" ("object") "void"  :native t )
))


(:class "Error" :extends "Object" :public t :dynamic t
 :properties (
  (:method "throwError" (("type" "Class") &rest ("index" "uint")) "*"  :static t :final t )
  (:method "getErrorMessage" (("index" "int")) "String"  :native t :static t :final t )
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "Error" (&optional ("message" "") ("id" 0)) "*")
  (:method "getStackTrace" () "String"  :native t )
  (:variable :name "_errorID"  :namespace-type :private   :type "int" )
  (:method-get "errorID" () "int"  )
  (:variable :name "message"    :type "null" )
  (:variable :name "name"    :type "null" )
))

(:class "DefinitionError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "DefinitionError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "EvalError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "EvalError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "RangeError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "RangeError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "ReferenceError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "ReferenceError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "SecurityError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "SecurityError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "SyntaxError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "SyntaxError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "TypeError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "TypeError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "URIError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "URIError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "VerifyError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "VerifyError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "UninitializedError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "UninitializedError" (&optional ("message" "") ("id" 0)) "*")
))

(:class "ArgumentError" :extends "Error" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "ArgumentError" (&optional ("message" "") ("id" 0)) "*")
))


(:class "flash.display::ShaderPrecision" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "FAST"    :type "String" :value "fast" :static t )
  (:constant :name "FULL"    :type "String" :value "full" :static t )
  (:constructor "ShaderPrecision" () "*")
))


(:class "Math" :extends "Object" :public t :final t 
 :properties (
  (:method "abs" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "random" () "Number"  :native t :static t :final t )
  (:constant :name "E"    :type "Number" :value 2.718281828459045 :static t )
  (:method "acos" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "cos" (("x" "Number")) "Number"  :native t :static t :final t )
  (:constant :name "SQRT1_2"    :type "Number" :value 0.7071067811865476 :static t )
  (:method "ceil" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "round" (("x" "Number")) "Number"  :native t :static t :final t )
  (:constant :name "SQRT2"    :type "Number" :value 1.4142135623730951 :static t )
  (:method "_min" (("x" "Number") ("y" "Number")) "Number" :namespace-type :private  :native t :static t :final t )
  (:method "asin" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "sin" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "atan2" (("x" "Number") ("y" "Number")) "Number"  :native t :static t :final t )
  (:method "floor" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "log" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "exp" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "pow" (("x" "Number") ("y" "Number")) "Number"  :native t :static t :final t )
  (:constant :name "LN10"    :type "Number" :value 2.302585092994046 :static t )
  (:method "_max" (("x" "Number") ("y" "Number")) "Number" :namespace-type :private  :native t :static t :final t )
  (:method "atan" (("x" "Number")) "Number"  :native t :static t :final t )
  (:method "tan" (("x" "Number")) "Number"  :native t :static t :final t )
  (:constant :name "LOG10E"    :type "Number" :value 0.4342944819032518 :static t )
  (:method "min" (("x" "Number") &rest ("y" "Number")) "Number"  :native t :static t :final t )
  (:method "max" (("x" "Number") &rest ("y" "Number")) "Number"  :native t :static t :final t )
  (:method "sqrt" (("x" "Number")) "Number"  :native t :static t :final t )
  (:constant :name "LN2"    :type "Number" :value 0.6931471805599453 :static t )
  (:constant :name "LOG2E"    :type "Number" :value 1.4426950408889634 :static t )
  (:constant :name "PI"    :type "Number" :value 3.141592653589793 :static t )
  (:constructor "Math" () "*")
))


(:class "RegExp" :extends "Object" :public t :dynamic t
 :properties (
  (:constant :name "length"    :type "int" :value 1 :static t )
  (:constructor "RegExp" (&optional "pattern" "options") "*")
  (:method "exec" (&optional (("s" "String") "")) "*" :namespace-type :public  :native t )
  (:method-get "ignoreCase" () "Boolean"  :native t )
  (:method-get "global" () "Boolean"  :native t )
  (:method-set "lastIndex" (("i" "int")) "*"  :native t )
  (:method-get "extended" () "Boolean"  :native t )
  (:method "test" (&optional (("s" "String") "")) "Boolean" :namespace-type :public  )
  (:method-get "source" () "String"  :native t )
  (:method-get "lastIndex" () "int"  :native t )
  (:method-get "multiline" () "Boolean"  :native t )
  (:method-get "dotall" () "Boolean"  :native t )
))


(:interface "flash.events::IEventDispatcher" :public t 
 :properties (
  (:constructor "IEventDispatcher" () "*")
  (:method "dispatchEvent" (("event" "flash.events::Event")) "Boolean" :namespace-type :public  )
  (:method "hasEventListener" (("type" "String")) "Boolean" :namespace-type :public  )
  (:method "willTrigger" (("type" "String")) "Boolean" :namespace-type :public  )
  (:method "removeEventListener" (("type" "String") ("listener" "Function") &optional (("useCapture" "Boolean") nil #|| false||# )) "void" :namespace-type :public  )
  (:method "addEventListener" (("type" "String") ("listener" "Function") &optional (("useCapture" "Boolean") nil #|| false||# ) (("priority" "int") 0) (("useWeakReference" "Boolean") nil #|| false||# )) "void" :namespace-type :public  )
))


(:class "flash.events::WeakMethodClosure" :extends "Object" :public t 
 :properties (
  (:constructor "WeakMethodClosure" () "*")
  (:method-get "savedThis" () "Object" :namespace-type :private  :native t )
))

(:class "flash.events::WeakFunctionClosure" :extends "Object" :public t 
 :properties (
  (:constructor "WeakFunctionClosure" () "*")
))

(:class "flash.events::EventDispatcher" :extends "Object" :implements (    "IEventDispatcher") :public t 
 :properties (
  (:constructor "EventDispatcher" (&optional ("target" "flash.events::IEventDispatcher")) "*")
  (:method "dispatchEvent" (("event" "flash.events::Event")) "Boolean"  )
  (:method "willTrigger" (("type" "String")) "Boolean"  :native t )
  (:method "removeEventListener" (("type" "String") ("listener" "Function") &optional (("useCapture" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method "toString" () "String"  )
  (:method "dispatchEventFunction" (("event" "flash.events::Event")) "Boolean" :namespace-type :private  :native t )
  (:method "hasEventListener" (("type" "String")) "Boolean"  :native t )
  (:method "addEventListener" (("type" "String") ("listener" "Function") &optional (("useCapture" "Boolean") nil #|| false||# ) (("priority" "int") 0) (("useWeakReference" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method-get "listeners" () "Array" :namespace-type :private  :native t )
))


(:class "flash.ui::ContextMenuItem" :extends "flash.events::EventDispatcher" :public t :final t 
 :properties (
  (:constructor "ContextMenuItem" (("caption" "String") &optional (("separatorBefore" "Boolean") nil #|| false||# ) (("enabled" "Boolean") t #|| true||# ) (("visible" "Boolean") t #|| true||# )) "*")
  (:method-get "enabled" () "Boolean"  :native t )
  (:method-set "enabled" (("value" "Boolean")) "void"  :native t )
  (:method-get "separatorBefore" () "Boolean"  :native t )
  (:method-get "caption" () "String"  :native t )
  (:method-set "separatorBefore" (("value" "Boolean")) "void"  :native t )
  (:method-get "visible" () "Boolean"  :native t )
  (:method-set "visible" (("value" "Boolean")) "void"  :native t )
  (:method-set "caption" (("value" "String")) "void"  :native t )
  (:method "clone" () "flash.ui::ContextMenuItem"  )
))


(:class "flash.system::ApplicationDomain" :extends "Object" :public t :final t 
 :properties (
  (:method-get "currentDomain" () "flash.system::ApplicationDomain"  :native t :static t :final t )
  (:method-get "MIN_DOMAIN_MEMORY_LENGTH" () "uint"  :native t :static t :final t )
  (:constructor "ApplicationDomain" (&optional ("parentDomain" "flash.system::ApplicationDomain")) "*")
  (:method-get "domainMemory" () "flash.utils::ByteArray"  :native t )
  (:method "getDefinition" (("name" "String")) "Object"  :native t )
  (:method-set "domainMemory" (("mem" "flash.utils::ByteArray")) "*"  :native t )
  (:method "hasDefinition" (("name" "String")) "Boolean"  :native t )
  (:method-get "parentDomain" () "flash.system::ApplicationDomain"  :native t )
))


(:class "flash.text.engine::ContentElement" :extends "Object" :public t 
 :properties (
  (:constant :name "GRAPHIC_ELEMENT"    :type "uint" :value 65007 :static t )
  (:constructor "ContentElement" (&optional ("elementFormat" "flash.text.engine::ElementFormat") ("eventMirror" "flash.events::EventDispatcher") (("textRotation" "String") "rotate0")) "*")
  (:method-get "textBlock" () "flash.text.engine::TextBlock"  :native t )
  (:method-set "elementFormat" (("value" "flash.text.engine::ElementFormat")) "void"  :native t )
  (:method-get "textBlockBeginIndex" () "int"  :native t )
  (:method-get "textRotation" () "String"  :native t )
  (:method-get "text" () "String"  :native t )
  (:method-set "eventMirror" (("value" "flash.events::EventDispatcher")) "void"  :native t )
  (:method-get "elementFormat" () "flash.text.engine::ElementFormat"  :native t )
  (:variable :name "userData"    :type "null" )
  (:method-set "textRotation" (("value" "String")) "void"  :native t )
  (:method-get "eventMirror" () "flash.events::EventDispatcher"  :native t )
  (:method-get "rawText" () "String"  :native t )
  (:method-get "groupElement" () "flash.text.engine::GroupElement"  :native t )
))


(:class "flash.display::Scene" :extends "Object" :public t :final t 
 :properties (
  (:constructor "Scene" (("name" "String") ("labels" "Array") ("numFrames" "int")) "*")
  (:variable :name "_name"  :namespace-type :private   :type "String" )
  (:method-get "numFrames" () "int"  )
  (:method-get "name" () "String"  )
  (:variable :name "_numFrames"  :namespace-type :private   :type "int" )
  (:variable :name "_labels"  :namespace-type :private   :type "Array" )
  (:method-get "labels" () "Array"  )
))


(:class "flash.printing::PrintJob" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constant :name "kGetPageHeight"  :namespace-type :private   :type "uint" :value 5 :static t )
  (:constant :name "kGetOrientation"  :namespace-type :private   :type "uint" :value 9 :static t )
  (:constant :name "kGetPaperHeight"  :namespace-type :private   :type "uint" :value 1 :static t )
  (:constant :name "kGetPaperWidth"  :namespace-type :private   :type "uint" :value 3 :static t )
  (:constant :name "kGetPageWidth"  :namespace-type :private   :type "uint" :value 7 :static t )
  (:constant :name "kAddPage"  :namespace-type :private   :type "uint" :value 101 :static t )
  (:constant :name "kStart"  :namespace-type :private   :type "uint" :value 100 :static t )
  (:constant :name "kSend"  :namespace-type :private   :type "uint" :value 102 :static t )
  (:constructor "PrintJob" () "*")
  (:method-get "orientation" () "String"  )
  (:method-get "paperHeight" () "int"  )
  (:method "toClassicRectangle" (("printArea" "flash.geom::Rectangle")) "*" :namespace-type :private  )
  (:method-get "pageHeight" () "int"  )
  (:method-get "pageWidth" () "int"  )
  (:method "invoke" (&rest ("index" "uint")) "*" :namespace-type :private  :native t )
  (:method "start" () "Boolean"  )
  (:method-get "paperWidth" () "int"  )
  (:method "addPage" (("sprite" "flash.display::Sprite") &optional ("printArea" "flash.geom::Rectangle") ("options" "flash.printing::PrintJobOptions") (("frameNum" "int") 0)) "void"  )
  (:method "_invoke" (&rest "index") "*" :namespace-type :private  :native t )
  (:method "send" () "void"  )
))


(:interface "flash.display::IGraphicsPath" :public t 
 :properties (
  (:constructor "IGraphicsPath" () "*")
))


(:interface "flash.display::IGraphicsData" :public t 
 :properties (
  (:constructor "IGraphicsData" () "*")
))


(:class "flash.display::GraphicsPath" :extends "Object" :implements ("GraphicsPath.as$193::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsPath" (&optional ("commands" "__AS3__.vec::Vector.<int>") ("data" "__AS3__.vec::Vector.<Number>") (("winding" "String") "evenOdd")) "*")
  (:method "wideLineTo" (("x" "Number") ("y" "Number")) "void"  )
  (:method-set "winding" (("value" "String")) "*"  )
  (:variable :name "commands"    :type "__AS3__.vec::Vector.<int>" )
  (:variable :name "data"    :type "__AS3__.vec::Vector.<Number>" )
  (:method "moveTo" (("x" "Number") ("y" "Number")) "void"  )
  (:method "lineTo" (("x" "Number") ("y" "Number")) "void"  )
  (:method "curveTo" (("controlX" "Number") ("controlY" "Number") ("anchorX" "Number") ("anchorY" "Number")) "void"  )
  (:method-get "winding" () "String"  )
  (:variable :name "_winding"  :namespace-type :private   :type "String" )
  (:method "wideMoveTo" (("x" "Number") ("y" "Number")) "void"  )
))


(:class "flash.geom::Matrix" :extends "Object" :public t 
 :properties (
  (:constructor "Matrix" (&optional (("a" "Number") 1) (("b" "Number") 0) (("c" "Number") 0) (("d" "Number") 1) (("tx" "Number") 0) (("ty" "Number") 0)) "*")
  (:variable :name "a"    :type "Number" )
  (:variable :name "c"    :type "Number" )
  (:variable :name "ty"    :type "Number" )
  (:method "createBox" (("scaleX" "Number") ("scaleY" "Number") &optional (("rotation" "Number") 0) (("tx" "Number") 0) (("ty" "Number") 0)) "void"  )
  (:variable :name "b"    :type "Number" )
  (:variable :name "d"    :type "Number" )
  (:method "toString" () "String"  )
  (:method "translate" (("dx" "Number") ("dy" "Number")) "void"  )
  (:method "scale" (("sx" "Number") ("sy" "Number")) "void"  )
  (:variable :name "tx"    :type "Number" )
  (:method "concat" (("m" "flash.geom::Matrix")) "void"  )
  (:method "invert" () "void"  )
  (:method "transformPoint" (("point" "flash.geom::Point")) "flash.geom::Point"  )
  (:method "rotate" (("angle" "Number")) "void"  )
  (:method "deltaTransformPoint" (("point" "flash.geom::Point")) "flash.geom::Point"  )
  (:method "clone" () "flash.geom::Matrix"  )
  (:method "identity" () "void"  )
  (:method "createGradientBox" (("width" "Number") ("height" "Number") &optional (("rotation" "Number") 0) (("tx" "Number") 0) (("ty" "Number") 0)) "void"  )
))


(:class "flash.text.engine::TextJustifier" :extends "Object" :public t 
 :properties (
  (:method "getJustifierForLocale" (("locale" "String")) "flash.text.engine::TextJustifier"  :static t :final t )
  (:constructor "TextJustifier" (("locale" "String") ("lineJustification" "String")) "*")
  (:method-set "lineJustification" (("value" "String")) "void"  :native t )
  (:method-get "locale" () "String"  :native t )
  (:method "setLocale" (("value" "String")) "void" :namespace-type :private  :native t )
  (:method "clone" () "flash.text.engine::TextJustifier"  )
  (:method-get "lineJustification" () "String"  :native t )
))


(:class "flash.text.engine::SpaceJustifier" :extends "flash.text.engine::TextJustifier" :public t :final t 
 :properties (
  (:constructor "SpaceJustifier" (&optional (("locale" "String") "en") (("lineJustification" "String") "unjustified") (("letterSpacing" "Boolean") nil #|| false||# )) "*")
  (:method-set "letterSpacing" (("value" "Boolean")) "void"  :native t )
  (:method "clone" () "flash.text.engine::TextJustifier"  :override t )
  (:method-get "letterSpacing" () "Boolean"  :native t )
))


(:interface "flash.display::IBitmapDrawable" :public t 
 :properties (
  (:constructor "IBitmapDrawable" () "*")
))


(:class "flash.display::DisplayObject" :extends "flash.events::EventDispatcher" :implements ("flash.display::IBitmapDrawable") :public t 
 :properties (
  (:constructor "DisplayObject" () "*")
  (:method-get "visible" () "Boolean"  :native t )
  (:method-get "rotation" () "Number"  :native t )
  (:method "_hitTest" (("use_xy" "Boolean") ("x" "Number") ("y" "Number") ("useShape" "Boolean") ("hitTestObject" "flash.display::DisplayObject")) "Boolean" :namespace-type :private  :native t )
  (:method "localToGlobal" (("point" "flash.geom::Point")) "flash.geom::Point"  :native t )
  (:method-get "name" () "String"  :native t )
  (:method-set "width" (("value" "Number")) "void"  :native t )
  (:method "globalToLocal" (("point" "flash.geom::Point")) "flash.geom::Point"  :native t )
  (:method-get "blendMode" () "String"  :native t )
  (:method-get "scale9Grid" () "flash.geom::Rectangle"  :native t )
  (:method-set "name" (("value" "String")) "void"  :native t )
  (:method-get "rotationX" () "Number"  :native t )
  (:method-get "rotationY" () "Number"  :native t )
  (:method-set "scaleX" (("value" "Number")) "void"  :native t )
  (:method-set "scaleY" (("value" "Number")) "void"  :native t )
  (:method-set "scaleZ" (("value" "Number")) "void"  :native t )
  (:method-get "accessibilityProperties" () "flash.accessibility::AccessibilityProperties"  :native t )
  (:method-set "scrollRect" (("value" "flash.geom::Rectangle")) "void"  :native t )
  (:method-get "rotationZ" () "Number"  :native t )
  (:method-get "height" () "Number"  :native t )
  (:method-set "blendMode" (("value" "String")) "void"  :native t )
  (:method-set "scale9Grid" (("innerRectangle" "flash.geom::Rectangle")) "void"  :native t )
  (:method "getBounds" (("targetCoordinateSpace" "flash.display::DisplayObject")) "flash.geom::Rectangle"  :native t )
  (:method-set "blendShader" (("value" "flash.display::Shader")) "void"  :native t )
  (:method-get "opaqueBackground" () "Object"  :native t )
  (:method-get "parent" () "flash.display::DisplayObjectContainer"  :native t )
  (:method-get "cacheAsBitmap" () "Boolean"  :native t )
  (:method-set "rotationX" (("value" "Number")) "void"  :native t )
  (:method-set "rotationY" (("value" "Number")) "void"  :native t )
  (:method-set "rotationZ" (("value" "Number")) "void"  :native t )
  (:method "local3DToGlobal" (("point3d" "flash.geom::Vector3D")) "flash.geom::Point"  :native t )
  (:method-set "alpha" (("value" "Number")) "void"  :native t )
  (:method "globalToLocal3D" (("point" "flash.geom::Point")) "flash.geom::Vector3D"  :native t )
  (:method-set "accessibilityProperties" (("value" "flash.accessibility::AccessibilityProperties")) "void"  :native t )
  (:method-get "width" () "Number"  :native t )
  (:method "hitTestPoint" (("x" "Number") ("y" "Number") &optional (("shapeFlag" "Boolean") nil #|| false||# )) "Boolean"  )
  (:method-set "cacheAsBitmap" (("value" "Boolean")) "void"  :native t )
  (:method-get "scaleX" () "Number"  :native t )
  (:method-get "scaleY" () "Number"  :native t )
  (:method-get "scaleZ" () "Number"  :native t )
  (:method-get "scrollRect" () "flash.geom::Rectangle"  :native t )
  (:method-get "mouseX" () "Number"  :native t )
  (:method-get "mouseY" () "Number"  :native t )
  (:method-set "height" (("value" "Number")) "void"  :native t )
  (:method-set "mask" (("value" "flash.display::DisplayObject")) "void"  :native t )
  (:method "getRect" (("targetCoordinateSpace" "flash.display::DisplayObject")) "flash.geom::Rectangle"  :native t )
  (:method-get "alpha" () "Number"  :native t )
  (:method-set "transform" (("value" "flash.geom::Transform")) "void"  :native t )
  (:method-get "loaderInfo" () "flash.display::LoaderInfo"  :native t )
  (:method-get "root" () "flash.display::DisplayObject"  :native t )
  (:method-set "visible" (("value" "Boolean")) "void"  :native t )
  (:method-set "opaqueBackground" (("value" "Object")) "void"  :native t )
  (:method "hitTestObject" (("obj" "flash.display::DisplayObject")) "Boolean"  )
  (:method-get "mask" () "flash.display::DisplayObject"  :native t )
  (:method-set "x" (("value" "Number")) "void"  :native t )
  (:method-set "y" (("value" "Number")) "void"  :native t )
  (:method-get "transform" () "flash.geom::Transform"  :native t )
  (:method-set "z" (("value" "Number")) "void"  :native t )
  (:method-set "filters" (("value" "Array")) "void"  :native t )
  (:method-get "x" () "Number"  :native t )
  (:method-get "y" () "Number"  :native t )
  (:method-get "z" () "Number"  :native t )
  (:method-get "filters" () "Array"  :native t )
  (:method-set "rotation" (("value" "Number")) "void"  :native t )
  (:method-get "stage" () "flash.display::Stage"  :native t )
))


(:class "flash.display::Bitmap" :extends "flash.display::DisplayObject" :public t 
 :properties (
  (:constructor "Bitmap" (&optional ("bitmapData" "flash.display::BitmapData") (("pixelSnapping" "String") "auto") (("smoothing" "Boolean") nil #|| false||# )) "*")
  (:method-set "bitmapData" (("value" "flash.display::BitmapData")) "void"  :native t )
  (:method-get "pixelSnapping" () "String"  :native t )
  (:method-set "pixelSnapping" (("value" "String")) "void"  :native t )
  (:method-set "smoothing" (("value" "Boolean")) "void"  :native t )
  (:method-get "bitmapData" () "flash.display::BitmapData"  :native t )
  (:method-get "smoothing" () "Boolean"  :native t )
))


(:class "flash.xml::XMLNode" :extends "Object" :public t 
 :properties (
  (:constructor "XMLNode" (("type" "uint") ("value" "String")) "*")
  (:method "escapeXML" (("value" "String")) "String" :namespace-type :private  :native t )
  (:variable :name "previousSibling"    :type "flash.xml::XMLNode" )
  (:variable :name "parentNode"    :type "flash.xml::XMLNode" )
  (:variable :name "nextSibling"    :type "flash.xml::XMLNode" )
  (:method "init" (("type" "uint") ("value" "String")) "void" :namespace-type :private  )
  (:method-get "namespaceURI" () "String"  )
  (:method-get "prefix" () "String"  )
  (:variable :name "firstChild"    :type "flash.xml::XMLNode" )
  (:variable :name "_childNodes"  :namespace-type :private   :type "Array" )
  (:variable :name "nodeValue"    :type "String" )
  (:method-get "attributes" () "Object"  )
  (:variable :name "nodeType"    :type "uint" )
  (:method "appendChild" (("node" "flash.xml::XMLNode")) "void"  )
  (:variable :name "lastChild"    :type "flash.xml::XMLNode" )
  (:method "insertBefore" (("node" "flash.xml::XMLNode") ("before" "flash.xml::XMLNode")) "void"  )
  (:method "getNamespaceForPrefix" (("prefix" "String")) "String"  )
  (:variable :name "nodeName"    :type "String" )
  (:method-set "attributes" (("value" "Object")) "void"  )
  (:method "hasChildNodes" () "Boolean"  )
  (:method-get "childNodes" () "Array"  )
  (:variable :name "_attributes"  :namespace-type :private   :type "Object" )
  (:method-get "localName" () "String"  )
  (:method "getPrefixForNamespace" (("ns" "String")) "String"  )
  (:method "toString" () "String"  )
  (:method "removeNode" () "void"  )
  (:method "cloneNode" (("deep" "Boolean")) "flash.xml::XMLNode"  )
))


(:class "flash.xml::XMLDocument" :extends "flash.xml::XMLNode" :public t 
 :properties (
  (:constant :name "kEndOfDocument"  :namespace-type :private   :type "int" :value -1 :static t )
  (:constant :name "kUnterminatedAttributeValue"  :namespace-type :private   :type "int" :value -8 :static t )
  (:constant :name "kUnterminatedCdata"  :namespace-type :private   :type "int" :value -2 :static t )
  (:constant :name "kElementNeverBegun"  :namespace-type :private   :type "int" :value -10 :static t )
  (:constant :name "kUnterminatedXmlDeclaration"  :namespace-type :private   :type "int" :value -3 :static t )
  (:constant :name "kUnterminatedDoctypeDeclaration"  :namespace-type :private   :type "int" :value -4 :static t )
  (:constant :name "kMalformedElement"  :namespace-type :private   :type "int" :value -6 :static t )
  (:constant :name "kUnterminatedElement"  :namespace-type :private   :type "int" :value -9 :static t )
  (:constant :name "kUnterminatedComment"  :namespace-type :private   :type "int" :value -5 :static t )
  (:constant :name "kOutOfMemory"  :namespace-type :private   :type "int" :value -7 :static t )
  (:constant :name "kNoError"  :namespace-type :private   :type "int" :value 0 :static t )
  (:constructor "XMLDocument" (&optional ("source" "String")) "*")
  (:method "createElement" (("name" "String")) "flash.xml::XMLNode"  )
  (:variable :name "idMap"    :type "Object" )
  (:method "parseXML" (("source" "String")) "void"  )
  (:variable :name "xmlDecl"    :type "Object" :value :null #|| null||#  )
  (:method "createTextNode" (("text" "String")) "flash.xml::XMLNode"  )
  (:method "toString" () "String"  :override t )
  (:variable :name "ignoreWhite"    :type "Boolean" :value nil #|| false||#  )
  (:variable :name "docTypeDecl"    :type "Object" :value :null #|| null||#  )
))


(:class "flash.text.engine::EastAsianJustifier" :extends "flash.text.engine::TextJustifier" :public t :final t 
 :properties (
  (:constructor "EastAsianJustifier" (&optional (("locale" "String") "ja") (("lineJustification" "String") "allButLast") (("justificationStyle" "String") "pushInKinsoku")) "*")
  (:method "clone" () "flash.text.engine::TextJustifier"  :override t )
  (:method-set "justificationStyle" (("value" "String")) "void"  :native t )
  (:method-get "justificationStyle" () "String"  :native t )
))


(:class "flash.text::TextRenderer" :extends "Object" :public t :final t 
 :properties (
  (:method-set "maxLevel" (("value" "int")) "void"  :native t :static t :final t )
  (:method-get "displayMode" () "String"  :native t :static t :final t )
  (:method "setAdvancedAntiAliasingTable" (("fontName" "String") ("fontStyle" "String") ("colorType" "String") ("advancedAntiAliasingTable" "Array")) "void"  :native t :static t :final t )
  (:method-get "maxLevel" () "int"  :native t :static t :final t )
  (:method-get "antiAliasType" () "String"  :native t :static t :final t )
  (:method-set "displayMode" (("value" "String")) "void"  :native t :static t :final t )
  (:method-set "antiAliasType" (("value" "String")) "void"  :native t :static t :final t )
  (:constructor "TextRenderer" () "*")
))


(:class "XML" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:method "settings" () "Object" :namespace-type :public  :static t :final t )
  (:method-set "prettyIndent" (("newIndent" "int")) "*"  :native t :static t :final t )
  (:method "setSettings" (&optional ("o" "Object")) "void" :namespace-type :public  :static t :final t )
  (:method-get "ignoreComments" () "Boolean"  :native t :static t :final t )
  (:method-get "prettyIndent" () "int"  :native t :static t :final t )
  (:method-get "ignoreProcessingInstructions" () "Boolean"  :native t :static t :final t )
  (:method-get "prettyPrinting" () "Boolean"  :native t :static t :final t )
  (:constant :name "length"    :type "null" :value 1 :static t )
  (:method-get "ignoreWhitespace" () "Boolean"  :native t :static t :final t )
  (:method-set "ignoreComments" (("newIgnore" "Boolean")) "*"  :native t :static t :final t )
  (:method-set "ignoreProcessingInstructions" (("newIgnore" "Boolean")) "*"  :native t :static t :final t )
  (:method-set "prettyPrinting" (("newPretty" "Boolean")) "*"  :native t :static t :final t )
  (:method "defaultSettings" () "Object" :namespace-type :public  :static t :final t )
  (:method-set "ignoreWhitespace" (("newIgnore" "Boolean")) "*"  :native t :static t :final t )
  (:constructor "XML" (&optional "value") "*")
  (:method "hasOwnProperty" (&optional "P") "Boolean" :namespace-type :public  :native t :override t )
  (:method "insertChildBefore" ("child1" "child2") "*" :namespace-type :public  :native t )
  (:method "replace" ("propertyName" "value") "XML" :namespace-type :public  :native t )
  (:method "setNotification" (("f" "Function")) "*" :namespace-type :public  :native t )
  (:method "toXMLString" () "String" :namespace-type :public  :native t )
  (:method "propertyIsEnumerable" (&optional "P") "Boolean" :namespace-type :public  :native t :override t )
  (:method "setChildren" ("value") "XML" :namespace-type :public  :native t )
  (:method "name" () "Object" :namespace-type :public  :native t )
  (:method "normalize" () "XML" :namespace-type :public  :native t )
  (:method "inScopeNamespaces" () "Array" :namespace-type :public  :native t )
  (:method "setLocalName" ("name") "void" :namespace-type :public  :native t )
  (:method "localName" () "Object" :namespace-type :public  :native t )
  (:method "attributes" () "XMLList" :namespace-type :public  :native t )
  (:method "processingInstructions" (&optional ("name" "*")) "XMLList" :namespace-type :public  :native t )
  (:method "setNamespace" ("ns") "void" :namespace-type :public  :native t )
  (:method "namespace" (&optional "prefix") "*" :namespace-type :public  :native t )
  (:method "child" ("propertyName") "XMLList" :namespace-type :public  :native t )
  (:method "childIndex" () "int" :namespace-type :public  :native t )
  (:method "contains" ("value") "Boolean" :namespace-type :public  :native t )
  (:method "appendChild" ("child") "XML" :namespace-type :public  :native t )
  (:method "hasComplexContent" () "Boolean" :namespace-type :public  :native t )
  (:method "descendants" (&optional ("name" "*")) "XMLList" :namespace-type :public  :native t )
  (:method "length" () "int" :namespace-type :public  )
  (:method "valueOf" () "XML" :namespace-type :public  )
  (:method "parent" () "*" :namespace-type :public  :native t )
  (:method "attribute" ("arg") "XMLList" :namespace-type :public  :native t )
  (:method "toString" () "String" :namespace-type :public  :native t )
  (:method "hasSimpleContent" () "Boolean" :namespace-type :public  :native t )
  (:method "prependChild" ("value") "XML" :namespace-type :public  :native t )
  (:method "setName" ("name") "void" :namespace-type :public  :native t )
  (:method "notification" () "Function" :namespace-type :public  :native t )
  (:method "comments" () "XMLList" :namespace-type :public  :native t )
  (:method "copy" () "XML" :namespace-type :public  :native t )
  (:method "nodeKind" () "String" :namespace-type :public  :native t )
  (:method "elements" (&optional ("name" "*")) "XMLList" :namespace-type :public  :native t )
  (:method "insertChildAfter" ("child1" "child2") "*" :namespace-type :public  :native t )
  (:method "addNamespace" ("ns") "XML" :namespace-type :public  :native t )
  (:method "namespaceDeclarations" () "Array" :namespace-type :public  :native t )
  (:method "text" () "XMLList" :namespace-type :public  :native t )
  (:method "removeNamespace" ("ns") "XML" :namespace-type :public  :native t )
  (:method "children" () "XMLList" :namespace-type :public  :native t )
))

(:class "XMLList" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:constant :name "length"    :type "null" :value 1 :static t )
  (:constructor "XMLList" (&optional "value") "*")
  (:method "hasOwnProperty" (&optional "P") "Boolean" :namespace-type :public  :native t :override t )
  (:method "insertChildBefore" ("child1" "child2") "*" :namespace-type :public  :native t )
  (:method "namespaceDeclarations" () "Array" :namespace-type :public  :native t )
  (:method "propertyIsEnumerable" (&optional "P") "Boolean" :namespace-type :public  :native t :override t )
  (:method "setChildren" ("value") "XML" :namespace-type :public  :native t )
  (:method "name" () "Object" :namespace-type :public  :native t )
  (:method "replace" ("propertyName" "value") "XML" :namespace-type :public  :native t )
  (:method "normalize" () "XMLList" :namespace-type :public  :native t )
  (:method "inScopeNamespaces" () "Array" :namespace-type :public  :native t )
  (:method "toXMLString" () "String" :namespace-type :public  :native t )
  (:method "descendants" (&optional ("name" "*")) "XMLList" :namespace-type :public  :native t )
  (:method "attributes" () "XMLList" :namespace-type :public  :native t )
  (:method "processingInstructions" (&optional ("name" "*")) "XMLList" :namespace-type :public  :native t )
  (:method "setNamespace" ("ns") "void" :namespace-type :public  :native t )
  (:method "setLocalName" ("name") "void" :namespace-type :public  :native t )
  (:method "namespace" (&optional "prefix") "*" :namespace-type :public  :native t )
  (:method "attribute" ("arg") "XMLList" :namespace-type :public  :native t )
  (:method "childIndex" () "int" :namespace-type :public  :native t )
  (:method "contains" ("value") "Boolean" :namespace-type :public  :native t )
  (:method "appendChild" ("child") "XML" :namespace-type :public  :native t )
  (:method "hasComplexContent" () "Boolean" :namespace-type :public  :native t )
  (:method "localName" () "Object" :namespace-type :public  :native t )
  (:method "length" () "int" :namespace-type :public  :native t )
  (:method "valueOf" () "XMLList" :namespace-type :public  )
  (:method "parent" () "*" :namespace-type :public  :native t )
  (:method "child" ("propertyName") "XMLList" :namespace-type :public  :native t )
  (:method "toString" () "String" :namespace-type :public  :native t )
  (:method "hasSimpleContent" () "Boolean" :namespace-type :public  :native t )
  (:method "prependChild" ("value") "XML" :namespace-type :public  :native t )
  (:method "setName" ("name") "void" :namespace-type :public  :native t )
  (:method "text" () "XMLList" :namespace-type :public  :native t )
  (:method "copy" () "XMLList" :namespace-type :public  :native t )
  (:method "nodeKind" () "String" :namespace-type :public  :native t )
  (:method "elements" (&optional ("name" "*")) "XMLList" :namespace-type :public  :native t )
  (:method "insertChildAfter" ("child1" "child2") "*" :namespace-type :public  :native t )
  (:method "addNamespace" ("ns") "XML" :namespace-type :public  :native t )
  (:method "comments" () "XMLList" :namespace-type :public  :native t )
  (:method "removeNamespace" ("ns") "XML" :namespace-type :public  :native t )
  (:method "children" () "XMLList" :namespace-type :public  :native t )
))

(:class "QName" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "length"    :type "null" :value 2 :static t )
  (:constructor "QName" (&optional "namespace" "name") "*")
  (:method "valueOf" () "QName" :namespace-type :public  )
  (:method "toString" () "String" :namespace-type :public  )
  (:method-get "uri" () "*"  :native t )
  (:method-get "localName" () "String"  :native t )
))

  (:method "isXMLName" (&optional "str") "Boolean"  :native t )

(:class "flash.display::StageAlign" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LEFT"    :type "String" :value "L" :static t )
  (:constant :name "BOTTOM_RIGHT"    :type "String" :value "BR" :static t )
  (:constant :name "BOTTOM"    :type "String" :value "B" :static t )
  (:constant :name "TOP_LEFT"    :type "String" :value "TL" :static t )
  (:constant :name "TOP_RIGHT"    :type "String" :value "TR" :static t )
  (:constant :name "TOP"    :type "String" :value "T" :static t )
  (:constant :name "BOTTOM_LEFT"    :type "String" :value "BL" :static t )
  (:constant :name "RIGHT"    :type "String" :value "R" :static t )
  (:constructor "StageAlign" () "*")
))


  (:method "showRedrawRegions" (("on" "Boolean") &optional (("color" "uint") 16711680)) "void"  :native t :uri "flash.profiler" )
  (:method "profile" (("on" "Boolean")) "void"  :native t :uri "flash.profiler" )

(:class "flash.display::ColorCorrectionSupport" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DEFAULT_OFF"    :type "String" :value "defaultOff" :static t )
  (:constant :name "UNSUPPORTED"    :type "String" :value "unsupported" :static t )
  (:constant :name "DEFAULT_ON"    :type "String" :value "defaultOn" :static t )
  (:constructor "ColorCorrectionSupport" () "*")
))


(:class "flash.errors::IllegalOperationError" :extends "Error" :public t :dynamic t
 :properties (
  (:constructor "IllegalOperationError" (&optional (("message" "String") "") (("id" "int") 0)) "*")
))

(:class "flash.errors::IOError" :extends "Error" :public t :dynamic t
 :properties (
  (:constructor "IOError" (&optional (("message" "String") "") (("id" "int") 0)) "*")
))

(:class "flash.errors::MemoryError" :extends "Error" :public t :dynamic t
 :properties (
  (:constructor "MemoryError" (&optional (("message" "String") "") (("id" "int") 0)) "*")
))

(:class "flash.errors::StackOverflowError" :extends "Error" :public t :dynamic t
 :properties (
  (:constructor "StackOverflowError" (&optional (("message" "String") "") (("id" "int") 0)) "*")
))

(:class "flash.errors::ScriptTimeoutError" :extends "Error" :public t :dynamic t
 :properties (
  (:constructor "ScriptTimeoutError" (&optional (("message" "String") "") (("id" "int") 0)) "*")
))

(:class "flash.errors::InvalidSWFError" :extends "Error" :public t :dynamic t
 :properties (
  (:constructor "InvalidSWFError" (&optional (("message" "String") "") (("id" "int") 0)) "*")
))

(:class "flash.errors::EOFError" :extends "flash.errors::IOError" :public t :dynamic t
 :properties (
  (:constructor "EOFError" (&optional (("message" "String") "") (("id" "int") 0)) "*")
))


(:class "flash.display::LineScaleMode" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "HORIZONTAL"    :type "String" :value "horizontal" :static t )
  (:constant :name "VERTICAL"    :type "String" :value "vertical" :static t )
  (:constant :name "NORMAL"    :type "String" :value "normal" :static t )
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constructor "LineScaleMode" () "*")
))


(:class "flash.text::FontStyle" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ITALIC"    :type "String" :value "italic" :static t )
  (:constant :name "BOLD_ITALIC"    :type "String" :value "boldItalic" :static t )
  (:constant :name "BOLD"    :type "String" :value "bold" :static t )
  (:constant :name "REGULAR"    :type "String" :value "regular" :static t )
  (:constructor "FontStyle" () "*")
))


(:class "flash.geom::Utils3D" :extends "Object" :public t 
 :properties (
  (:method "pointTowards" (("percent" "Number") ("mat" "flash.geom::Matrix3D") ("pos" "flash.geom::Vector3D") &optional ("at" "flash.geom::Vector3D") ("up" "flash.geom::Vector3D")) "flash.geom::Matrix3D"  :native t :static t :final t )
  (:method "projectVector" (("m" "flash.geom::Matrix3D") ("v" "flash.geom::Vector3D")) "flash.geom::Vector3D"  :native t :static t :final t )
  (:method "projectVectors" (("m" "flash.geom::Matrix3D") ("verts" "__AS3__.vec::Vector.<Number>") ("projectedVerts" "__AS3__.vec::Vector.<Number>") ("uvts" "__AS3__.vec::Vector.<Number>")) "void"  :native t :static t :final t )
  (:constructor "Utils3D" () "*")
))


(:class "flash.text.engine::TypographicCase" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LOWERCASE"    :type "String" :value "lowercase" :static t )
  (:constant :name "CAPS"    :type "String" :value "caps" :static t )
  (:constant :name "DEFAULT"    :type "String" :value "default" :static t )
  (:constant :name "UPPERCASE"    :type "String" :value "uppercase" :static t )
  (:constant :name "TITLE"    :type "String" :value "title" :static t )
  (:constant :name "SMALL_CAPS"    :type "String" :value "smallCaps" :static t )
  (:constant :name "CAPS_AND_SMALL_CAPS"    :type "String" :value "capsAndSmallCaps" :static t )
  (:constructor "TypographicCase" () "*")
))


(:class "flash.text.engine::TabAlignment" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DECIMAL"    :type "String" :value "decimal" :static t )
  (:constant :name "START"    :type "String" :value "start" :static t )
  (:constant :name "CENTER"    :type "String" :value "center" :static t )
  (:constant :name "END"    :type "String" :value "end" :static t )
  (:constructor "TabAlignment" () "*")
))


(:class "flash.system::IMEConversionMode" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ALPHANUMERIC_HALF"    :type "String" :value "ALPHANUMERIC_HALF" :static t )
  (:constant :name "KOREAN"    :type "String" :value "KOREAN" :static t )
  (:constant :name "UNKNOWN"    :type "String" :value "UNKNOWN" :static t )
  (:constant :name "JAPANESE_HIRAGANA"    :type "String" :value "JAPANESE_HIRAGANA" :static t )
  (:constant :name "CHINESE"    :type "String" :value "CHINESE" :static t )
  (:constant :name "JAPANESE_KATAKANA_FULL"    :type "String" :value "JAPANESE_KATAKANA_FULL" :static t )
  (:constant :name "JAPANESE_KATAKANA_HALF"    :type "String" :value "JAPANESE_KATAKANA_HALF" :static t )
  (:constant :name "ALPHANUMERIC_FULL"    :type "String" :value "ALPHANUMERIC_FULL" :static t )
  (:constructor "IMEConversionMode" () "*")
))


  (:method "navigateToURL" (("request" "flash.net::URLRequest") &optional ("window" "String")) "void"  :native t :uri "flash.net" )
  (:method "getClassByAlias" (("aliasName" "String")) "Class"  :native t :uri "flash.net" )
  (:method "registerClassAlias" (("aliasName" "String") ("classObject" "Class")) "void"  :native t :uri "flash.net" )
  (:method "sendToURL" (("request" "flash.net::URLRequest")) "void"  :native t :uri "flash.net" )

(:class "flash.system::FSCommand" :extends "Object" :public t :final t 
 :properties (
  (:method "_fscommand" (("command" "String") ("args" "String")) "void"  :native t :static t :final t )
  (:constructor "FSCommand" () "*")
))

  (:method "fscommand" (("command" "String") &optional (("args" "String") "")) "void"  :uri "flash.system" )

(:class "flash.text.engine::TabStop" :extends "Object" :public t :final t 
 :properties (
  (:constructor "TabStop" (&optional (("alignment" "String") "start") (("position" "Number") 0) (("decimalAlignmentToken" "String") "")) "*")
  (:method-set "position" (("value" "Number")) "void"  :native t )
  (:method-get "alignment" () "String"  :native t )
  (:method-set "alignment" (("value" "String")) "void"  :native t )
  (:method-get "decimalAlignmentToken" () "String"  :native t )
  (:method-get "position" () "Number"  :native t )
  (:method-set "decimalAlignmentToken" (("value" "String")) "void"  :native t )
))


(:interface "flash.display::IGraphicsFill" :public t 
 :properties (
  (:constructor "IGraphicsFill" () "*")
))


(:class "flash.display::GraphicsGradientFill" :extends "Object" :implements ("GraphicsGradientFill.as$190::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsGradientFill" (&optional (("type" "String") "linear") ("colors" "Array") ("alphas" "Array") ("ratios" "Array") "matrix" ("spreadMethod" "pad") (("interpolationMethod" "String") "rgb") (("focalPointRatio" "Number") 0)) "*")
  (:variable :name "matrix"    :type "flash.geom::Matrix" )
  (:method-get "interpolationMethod" () "String"  )
  (:variable :name "focalPointRatio"    :type "Number" )
  (:variable :name "ratios"    :type "Array" )
  (:variable :name "_spreadMethod"  :namespace-type :private   :type "String" )
  (:variable :name "_interpolationMethod"  :namespace-type :private   :type "String" )
  (:method-set "spreadMethod" (("value" "String")) "*"  )
  (:variable :name "colors"    :type "Array" )
  (:method-set "interpolationMethod" (("value" "String")) "*"  )
  (:method-set "type" (("value" "String")) "*"  )
  (:variable :name "alphas"    :type "Array" )
  (:variable :name "_type"  :namespace-type :private   :type "String" )
  (:method-get "type" () "String"  )
  (:method-get "spreadMethod" () "String"  )
))


(:class "flash.text.engine::FontDescription" :extends "Object" :public t :final t 
 :properties (
  (:method "isFontCompatible" (("fontName" "String") ("fontWeight" "String") ("fontPosture" "String")) "Boolean"  :native t :static t :final t )
  (:constructor "FontDescription" (&optional (("fontName" "String") "_serif") (("fontWeight" "String") "normal") (("fontPosture" "String") "normal") (("fontLookup" "String") "device") (("renderingMode" "String") "cff") (("cffHinting" "String") "horizontalStem")) "*")
  (:method-set "fontLookup" (("value" "String")) "void"  :native t )
  (:method-get "fontWeight" () "String"  :native t )
  (:method-get "fontLookup" () "String"  :native t )
  (:method-get "locked" () "Boolean"  :native t )
  (:method-set "fontWeight" (("value" "String")) "void"  :native t )
  (:method-get "renderingMode" () "String"  :native t )
  (:method-set "cffHinting" (("value" "String")) "void"  :native t )
  (:method-set "fontPosture" (("value" "String")) "void"  :native t )
  (:method-set "fontName" (("value" "String")) "void"  :native t )
  (:method-get "cffHinting" () "String"  :native t )
  (:method-get "fontPosture" () "String"  :native t )
  (:method-get "fontName" () "String"  :native t )
  (:method-set "locked" (("value" "Boolean")) "void"  :native t )
  (:method "clone" () "flash.text.engine::FontDescription"  )
  (:method-set "renderingMode" (("value" "String")) "void"  :native t )
))


(:class "flash.net::NetStream" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constant :name "kSetBufferTime"  :namespace-type :private   :type "uint" :value 4 :static t )
  (:constant :name "kGetAudioCodecID"  :namespace-type :private   :type "uint" :value 313 :static t )
  (:constant :name "kGetMaxPauseBufferTime"  :namespace-type :private   :type "null" :value 400 :static t )
  (:constant :name "kSetAudioCodecID"  :namespace-type :private   :type "uint" :value 314 :static t )
  (:constant :name "kSend"  :namespace-type :private   :type "uint" :value 3 :static t )
  (:constant :name "kSetMaxPauseBufferTime"  :namespace-type :private   :type "null" :value 401 :static t )
  (:constant :name "kGetTotalFrames"  :namespace-type :private   :type "uint" :value 307 :static t )
  (:constant :name "kGetFarNonce"  :namespace-type :private   :type "uint" :value 342 :static t )
  (:constant :name "kAttachAudio"  :namespace-type :private   :type "uint" :value 1 :static t )
  (:constant :name "kSetTotalFrames"  :namespace-type :private   :type "uint" :value 308 :static t )
  (:constant :name "kGetInfo"  :namespace-type :private   :type "uint" :value 343 :static t )
  (:constant :name "CONNECT_TO_FMS"    :type "String" :value "connectToFMS" :static t )
  (:constant :name "kGetVideoCodecID"  :namespace-type :private   :type "uint" :value 311 :static t )
  (:constant :name "kGetFarID"  :namespace-type :private   :type "uint" :value 340 :static t )
  (:constant :name "kAttachVideo"  :namespace-type :private   :type "uint" :value 2 :static t )
  (:constant :name "kClose"  :namespace-type :private   :type "uint" :value 0 :static t )
  (:constant :name "kGetBufferLength"  :namespace-type :private   :type "uint" :value 303 :static t )
  (:constant :name "kGetLiveDelay"  :namespace-type :private   :type "uint" :value 304 :static t )
  (:constant :name "kSetVideoCodecID"  :namespace-type :private   :type "uint" :value 312 :static t )
  (:constant :name "kGetTime"  :namespace-type :private   :type "uint" :value 300 :static t )
  (:constant :name "DIRECT_CONNECTIONS"    :type "String" :value "directConnections" :static t )
  (:constant :name "kGetBytesTotal"  :namespace-type :private   :type "uint" :value 306 :static t )
  (:constant :name "kGetBytesLoaded"  :namespace-type :private   :type "uint" :value 305 :static t )
  (:constant :name "kCall"  :namespace-type :private   :type "uint" :value 202 :static t )
  (:constant :name "kGetBufferTime"  :namespace-type :private   :type "uint" :value 302 :static t )
  (:constant :name "kGetCurrentFps"  :namespace-type :private   :type "uint" :value 301 :static t )
  (:constant :name "kGetNearNonce"  :namespace-type :private   :type "uint" :value 341 :static t )
  (:constructor "NetStream" (("connection" "flash.net::NetConnection") &optional (("peerID" "String") "connectToFMS")) "*")
  (:method "onStatus" ("info") "void" :namespace-type :private  )
  (:method-set "soundTransform" (("sndTransform" "flash.media::SoundTransform")) "void"  :native t )
  (:method "togglePause" () "void"  )
  (:method-set "maxPauseBufferTime" (("pauseBufferTime" "Number")) "void"  )
  (:method-get "maxPauseBufferTime" () "Number"  )
  (:method "seek" (("offset" "Number")) "void"  )
  (:method "send" (&rest ("handlerName" "String")) "void"  )
  (:method-get "peerStreams" () "Array"  :native t )
  (:method "attachCamera" (("theCamera" "flash.media::Camera") &optional (("snapshotMilliseconds" "int") -1)) "void"  )
  (:method-get "client" () "Object"  :native t )
  (:method "invokeWithArgsArray" (("index" "uint") ("p_arguments" "Array")) "*" :namespace-type :private  :native t )
  (:method "publish" (&optional ("name" "String") ("type" "String")) "void"  )
  (:method-get "bytesLoaded" () "uint"  )
  (:method "attachAudio" (("microphone" "flash.media::Microphone")) "void"  )
  (:method-get "time" () "Number"  )
  (:method-get "bufferLength" () "Number"  )
  (:method-set "client" (("object" "Object")) "void"  :native t )
  (:method "construct" (("connection" "flash.net::NetConnection") ("peerID" "String")) "void" :namespace-type :private  :native t )
  (:method "receiveVideo" (("flag" "Boolean")) "void"  )
  (:method-get "bytesTotal" () "uint"  )
  (:method-set "bufferTime" (("bufferTime" "Number")) "void"  )
  (:method-get "videoCodec" () "uint"  )
  (:method "onResult" (("streamId" "int")) "void" :namespace-type :private  :native t )
  (:method-get "soundTransform" () "flash.media::SoundTransform"  :native t )
  (:method "call" (("stream" "flash.net::NetStream") ("command" "String") &rest ("responder" "flash.net::Responder")) "void" :namespace-type :private  )
  (:method-get "farNonce" () "String"  :native t )
  (:method-get "audioCodec" () "uint"  )
  (:method "onPeerConnect" (("subscriber" "flash.net::NetStream")) "Boolean"  )
  (:method-get "nearNonce" () "String"  :native t )
  (:method-set "checkPolicyFile" (("state" "Boolean")) "void"  :native t )
  (:method-get "bufferTime" () "Number"  )
  (:method-get "info" () "flash.net::NetStreamInfo"  :native t )
  (:method-get "currentFPS" () "Number"  )
  (:method "receiveVideoFPS" (("FPS" "Number")) "void"  )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method "receiveAudio" (("flag" "Boolean")) "void"  )
  (:method "resume" () "void"  )
  (:method "pause" () "void"  )
  (:method-get "liveDelay" () "Number"  )
  (:method "invoke" (&rest ("index" "uint")) "*" :namespace-type :private  :native t )
  (:method-get "farID" () "String"  :native t )
  (:method "play" () "void"  :native t )
  (:method-get "decodedFrames" () "uint"  )
  (:method-get "checkPolicyFile" () "Boolean"  :native t )
  (:method "play2" (("param" "flash.net::NetStreamPlayOptions")) "void"  :native t )
  (:method "close" () "void"  )
))


(:class "flash.xml::XMLNodeType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DOCUMENT_TYPE_NODE"    :type "uint" :value 10 :static t )
  (:constant :name "ELEMENT_NODE"    :type "uint" :value 1 :static t )
  (:constant :name "COMMENT_NODE"    :type "uint" :value 8 :static t )
  (:constant :name "XML_DECLARATION"    :type "uint" :value 13 :static t )
  (:constant :name "CDATA_NODE"    :type "uint" :value 4 :static t )
  (:constant :name "TEXT_NODE"    :type "uint" :value 3 :static t )
  (:constant :name "PROCESSING_INSTRUCTION_NODE"    :type "uint" :value 7 :static t )
  (:constructor "XMLNodeType" () "*")
))


(:class "flash.events::IMEEvent" :extends "flash.events::TextEvent" :public t 
 :properties (
  (:constant :name "IME_COMPOSITION"    :type "String" :value "imeComposition" :static t )
  (:constructor "IMEEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("text" "String") "")) "*")
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:class "flash.filters::BitmapFilter" :extends "Object" :public t 
 :properties (
  (:constructor "BitmapFilter" () "*")
  (:method "clone" () "flash.filters::BitmapFilter"  )
))


(:class "flash.filters::DropShadowFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "DropShadowFilter" (&optional (("distance" "Number") 4) (("angle" "Number") 45) (("color" "uint") 0) (("alpha" "Number") 1) (("blurX" "Number") 4) (("blurY" "Number") 4) (("strength" "Number") 1) (("quality" "int") 1) (("inner" "Boolean") nil #|| false||# ) (("knockout" "Boolean") nil #|| false||# ) (("hideObject" "Boolean") nil #|| false||# )) "*")
  (:method-get "hideObject" () "Boolean"  :native t )
  (:method-set "blurX" (("value" "Number")) "void"  :native t )
  (:method-get "color" () "uint"  :native t )
  (:method-set "blurY" (("value" "Number")) "void"  :native t )
  (:method-set "quality" (("value" "int")) "void"  :native t )
  (:method-set "angle" (("value" "Number")) "void"  :native t )
  (:method-get "strength" () "Number"  :native t )
  (:method-set "hideObject" (("value" "Boolean")) "void"  :native t )
  (:method-set "distance" (("value" "Number")) "void"  :native t )
  (:method-set "inner" (("value" "Boolean")) "void"  :native t )
  (:method-set "color" (("value" "uint")) "void"  :native t )
  (:method-set "strength" (("value" "Number")) "void"  :native t )
  (:method-get "blurX" () "Number"  :native t )
  (:method-get "blurY" () "Number"  :native t )
  (:method-get "angle" () "Number"  :native t )
  (:method-set "knockout" (("value" "Boolean")) "void"  :native t )
  (:method-get "distance" () "Number"  :native t )
  (:method-get "inner" () "Boolean"  :native t )
  (:method-get "knockout" () "Boolean"  :native t )
  (:method-set "alpha" (("value" "Number")) "void"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-get "alpha" () "Number"  :native t )
  (:method-get "quality" () "int"  :native t )
))


(:class "flash.utils::Timer" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "Timer" (("delay" "Number") &optional (("repeatCount" "int") 0)) "*")
  (:method "_timerDispatch" () "void" :namespace-type :private  :native t )
  (:method-get "delay" () "Number"  )
  (:method-set "delay" (("value" "Number")) "void"  )
  (:method-set "repeatCount" (("value" "int")) "void"  )
  (:variable :name "m_repeatCount"  :namespace-type :private   :type "int" )
  (:method "_start" (("delay" "Number") ("closure" "Function")) "void" :namespace-type :private  :native t )
  (:variable :name "m_iteration"  :namespace-type :private   :type "int" )
  (:method "tick" () "void" :namespace-type :private  )
  (:method "reset" () "void"  )
  (:variable :name "m_delay"  :namespace-type :private   :type "Number" )
  (:method-get "repeatCount" () "int"  )
  (:method "start" () "void"  )
  (:method "stop" () "void"  :native t )
  (:method-get "currentCount" () "int"  )
  (:method-get "running" () "Boolean"  :native t )
))


(:class "flash.utils::SetIntervalTimer" :extends "flash.utils::Timer" :public t :final t 
 :properties (
  (:method "clearInterval" (("id" "uint")) "void" :namespace-type :internal  :static t :final t )
  (:variable :name "intervals"  :namespace-type :private   :type "Array" :static t )
  (:constructor "SetIntervalTimer" (("closure" "Function") ("delay" "Number") ("repeats" "Boolean") ("rest" "Array")) "*")
  (:variable :name "closure"  :namespace-type :private   :type "Function" )
  (:variable :name "rest"  :namespace-type :private   :type "Array" )
  (:method "onTimer" (("event" "flash.events::Event")) "void" :namespace-type :private  )
  (:variable :name "id"  :namespace-type :internal   :type "uint" )
  (:method "clearArrayEntry" () "void" :namespace-type :internal  )
))

  (:method "setTimeout" (("closure" "Function") &rest ("delay" "Number")) "uint"  :uri "flash.utils" )
  (:method "setInterval" (("closure" "Function") &rest ("delay" "Number")) "uint"  :uri "flash.utils" )
  (:method "clearTimeout" (("id" "uint")) "void"  :uri "flash.utils" )
  (:method "clearInterval" (("id" "uint")) "void"  :uri "flash.utils" )

(:class "flash.ui::Keyboard" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ESCAPE"    :type "uint" :value 27 :static t )
  (:constant :name "RIGHT"    :type "uint" :value 39 :static t )
  (:constant :name "LEFT"    :type "uint" :value 37 :static t )
  (:constant :name "NUMPAD_7"    :type "uint" :value 103 :static t )
  (:constant :name "TAB"    :type "uint" :value 9 :static t )
  (:constant :name "NUMPAD_ADD"    :type "uint" :value 107 :static t )
  (:method-get "capsLock" () "Boolean"  :native t :static t :final t )
  (:method "isAccessible" () "Boolean"  :native t :static t :final t )
  (:constant :name "SPACE"    :type "uint" :value 32 :static t )
  (:constant :name "DOWN"    :type "uint" :value 40 :static t )
  (:constant :name "UP"    :type "uint" :value 38 :static t )
  (:constant :name "F1"    :type "uint" :value 112 :static t )
  (:constant :name "F2"    :type "uint" :value 113 :static t )
  (:constant :name "F3"    :type "uint" :value 114 :static t )
  (:constant :name "F4"    :type "uint" :value 115 :static t )
  (:constant :name "F5"    :type "uint" :value 116 :static t )
  (:constant :name "F6"    :type "uint" :value 117 :static t )
  (:constant :name "F7"    :type "uint" :value 118 :static t )
  (:constant :name "DELETE"    :type "uint" :value 46 :static t )
  (:constant :name "F9"    :type "uint" :value 120 :static t )
  (:constant :name "ENTER"    :type "uint" :value 13 :static t )
  (:constant :name "INSERT"    :type "uint" :value 45 :static t )
  (:constant :name "NUMPAD_DIVIDE"    :type "uint" :value 111 :static t )
  (:constant :name "END"    :type "uint" :value 35 :static t )
  (:constant :name "CONTROL"    :type "uint" :value 17 :static t )
  (:constant :name "NUMPAD_1"    :type "uint" :value 97 :static t )
  (:constant :name "NUMPAD_2"    :type "uint" :value 98 :static t )
  (:constant :name "F8"    :type "uint" :value 119 :static t )
  (:constant :name "NUMPAD_4"    :type "uint" :value 100 :static t )
  (:constant :name "NUMPAD_5"    :type "uint" :value 101 :static t )
  (:constant :name "NUMPAD_8"    :type "uint" :value 104 :static t )
  (:constant :name "NUMPAD_9"    :type "uint" :value 105 :static t )
  (:constant :name "NUMPAD_3"    :type "uint" :value 99 :static t )
  (:constant :name "CAPS_LOCK"    :type "uint" :value 20 :static t )
  (:constant :name "NUMPAD_6"    :type "uint" :value 102 :static t )
  (:constant :name "NUMPAD_0"    :type "uint" :value 96 :static t )
  (:method-get "numLock" () "Boolean"  :native t :static t :final t )
  (:constant :name "NUMPAD_ENTER"    :type "uint" :value 108 :static t )
  (:constant :name "NUMPAD_DECIMAL"    :type "uint" :value 110 :static t )
  (:constant :name "BACKSPACE"    :type "uint" :value 8 :static t )
  (:constant :name "PAGE_DOWN"    :type "uint" :value 34 :static t )
  (:constant :name "PAGE_UP"    :type "uint" :value 33 :static t )
  (:constant :name "F10"    :type "uint" :value 121 :static t )
  (:constant :name "HOME"    :type "uint" :value 36 :static t )
  (:constant :name "F12"    :type "uint" :value 123 :static t )
  (:constant :name "F13"    :type "uint" :value 124 :static t )
  (:constant :name "F14"    :type "uint" :value 125 :static t )
  (:constant :name "F15"    :type "uint" :value 126 :static t )
  (:constant :name "SHIFT"    :type "uint" :value 16 :static t )
  (:constant :name "NUMPAD_SUBTRACT"    :type "uint" :value 109 :static t )
  (:constant :name "F11"    :type "uint" :value 122 :static t )
  (:constant :name "NUMPAD_MULTIPLY"    :type "uint" :value 106 :static t )
  (:constructor "Keyboard" () "*")
))


(:class "flash.media::SoundMixer" :extends "Object" :public t :final t 
 :properties (
  (:method-set "soundTransform" (("sndTransform" "flash.media::SoundTransform")) "void"  :native t :static t :final t )
  (:method "areSoundsInaccessible" () "Boolean"  :native t :static t :final t )
  (:method-get "bufferTime" () "int"  :native t :static t :final t )
  (:method "computeSpectrum" (("outputArray" "flash.utils::ByteArray") &optional (("FFTMode" "Boolean") nil #|| false||# ) (("stretchFactor" "int") 0)) "void"  :native t :static t :final t )
  (:method-set "bufferTime" (("bufferTime" "int")) "void"  :native t :static t :final t )
  (:method-get "soundTransform" () "flash.media::SoundTransform"  :native t :static t :final t )
  (:method "stopAll" () "void"  :native t :static t :final t )
  (:constructor "SoundMixer" () "*")
))


(:class "flash.display::ShaderData" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:constructor "ShaderData" (("byteCode" "flash.utils::ByteArray")) "*")
  (:method "_setByteCode" (("code" "flash.utils::ByteArray")) "void" :namespace-type :private  :native t )
))


(:class "flash.display::BitmapData" :extends "Object" :implements ("IBitmapDrawable") :public t 
 :properties (
  (:constructor "BitmapData" (("width" "int") ("height" "int") &optional (("transparent" "Boolean") t #|| true||# ) (("fillColor" "uint") 4294967295)) "*")
  (:method "copyPixels" (("sourceBitmapData" "flash.display::BitmapData") ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point") &optional ("alphaBitmapData" "flash.display::BitmapData") ("alphaPoint" "flash.geom::Point") (("mergeAlpha" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method "setPixel" (("x" "int") ("y" "int") ("color" "uint")) "void"  :native t )
  (:method "hitTest" (("firstPoint" "flash.geom::Point") ("firstAlphaThreshold" "uint") ("secondObject" "Object") &optional ("secondBitmapDataPoint" "flash.geom::Point") (("secondAlphaThreshold" "uint") 1)) "Boolean"  :native t )
  (:method "applyFilter" (("sourceBitmapData" "flash.display::BitmapData") ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point") ("filter" "flash.filters::BitmapFilter")) "void"  :native t )
  (:method "fillRect" (("rect" "flash.geom::Rectangle") ("color" "uint")) "void"  :native t )
  (:method "colorTransform" (("rect" "flash.geom::Rectangle") ("colorTransform" "flash.geom::ColorTransform")) "void"  :native t )
  (:method "draw" (("source" "flash.display::IBitmapDrawable") &optional ("matrix" "flash.geom::Matrix") ("colorTransform" "flash.geom::ColorTransform") ("blendMode" "String") ("clipRect" "flash.geom::Rectangle") (("smoothing" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method "setVector" (("rect" "flash.geom::Rectangle") ("inputVector" "__AS3__.vec::Vector.<uint>")) "void"  )
  (:method-get "width" () "int"  :native t )
  (:method "copyChannel" (("sourceBitmapData" "flash.display::BitmapData") ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point") ("sourceChannel" "uint") ("destChannel" "uint")) "void"  :native t )
  (:method "getPixel" (("x" "int") ("y" "int")) "uint"  :native t )
  (:method "generateFilterRect" (("sourceRect" "flash.geom::Rectangle") ("filter" "flash.filters::BitmapFilter")) "flash.geom::Rectangle"  :native t )
  (:method-get "transparent" () "Boolean"  :native t )
  (:method "unlock" (&optional ("changeRect" "flash.geom::Rectangle")) "void"  :native t )
  (:method "scroll" (("x" "int") ("y" "int")) "void"  :native t )
  (:method "getColorBoundsRect" (("mask" "uint") ("color" "uint") &optional (("findColor" "Boolean") t #|| true||# )) "flash.geom::Rectangle"  :native t )
  (:method "pixelDissolve" (("sourceBitmapData" "flash.display::BitmapData") ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point") &optional (("randomSeed" "int") 0) (("numPixels" "int") 0) (("fillColor" "uint") 0)) "int"  :native t )
  (:method "noise" (("randomSeed" "int") &optional (("low" "uint") 0) (("high" "uint") 255) (("channelOptions" "uint") 7) (("grayScale" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method "clone" () "flash.display::BitmapData"  :native t )
  (:method "_setVector" (("inputVector" "__AS3__.vec::Vector.<uint>") ("x" "int") ("y" "int") ("width" "int") ("height" "int")) "void" :namespace-type :private  :native t )
  (:method "dispose" () "void"  :native t )
  (:method "floodFill" (("x" "int") ("y" "int") ("color" "uint")) "void"  :native t )
  (:method "setPixel32" (("x" "int") ("y" "int") ("color" "uint")) "void"  :native t )
  (:method-get "rect" () "flash.geom::Rectangle"  )
  (:method "compare" (("otherBitmapData" "flash.display::BitmapData")) "Object"  :native t )
  (:method "perlinNoise" (("baseX" "Number") ("baseY" "Number") ("numOctaves" "uint") ("randomSeed" "int") ("stitch" "Boolean") ("fractalNoise" "Boolean") &optional (("channelOptions" "uint") 7) (("grayScale" "Boolean") nil #|| false||# ) ("offsets" "Array")) "void"  :native t )
  (:method-get "height" () "int"  :native t )
  (:method "paletteMap" (("sourceBitmapData" "flash.display::BitmapData") ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point") &optional ("redArray" "Array") ("greenArray" "Array") ("blueArray" "Array") ("alphaArray" "Array")) "void"  :native t )
  (:method "getPixels" (("rect" "flash.geom::Rectangle")) "flash.utils::ByteArray"  :native t )
  (:method "threshold" (("sourceBitmapData" "flash.display::BitmapData") ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point") ("operation" "String") ("threshold" "uint") &optional (("color" "uint") 0) (("mask" "uint") 4294967295) (("copySource" "Boolean") nil #|| false||# )) "uint"  :native t )
  (:method "getPixel32" (("x" "int") ("y" "int")) "uint"  :native t )
  (:method "lock" () "void"  :native t )
  (:method "setPixels" (("rect" "flash.geom::Rectangle") ("inputByteArray" "flash.utils::ByteArray")) "void"  :native t )
  (:method "merge" (("sourceBitmapData" "flash.display::BitmapData") ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point") ("redMultiplier" "uint") ("greenMultiplier" "uint") ("blueMultiplier" "uint") ("alphaMultiplier" "uint")) "void"  :native t )
  (:method "getVector" (("rect" "flash.geom::Rectangle")) "__AS3__.vec::Vector.<uint>"  )
  (:method "_getVector" (("v" "__AS3__.vec::Vector.<uint>") ("x" "int") ("y" "int") ("width" "int") ("height" "int")) "*" :namespace-type :private  :native t )
  (:method "histogram" (&optional ("hRect" "flash.geom::Rectangle")) "__AS3__.vec::Vector.<__AS3__.vec::Vector.<Number>>"  :native t )
))


(:class "flash.text::TextFieldType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "INPUT"    :type "String" :value "input" :static t )
  (:constant :name "DYNAMIC"    :type "String" :value "dynamic" :static t )
  (:constructor "TextFieldType" () "*")
))


(:class "flash.display::GraphicsEndFill" :extends "Object" :implements ("GraphicsEndFill.as$191::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsEndFill" () "*")
))


(:class "flash.events::NetFilterEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constructor "NetFilterEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) ("header" "flash.utils::ByteArray") ("data" "flash.utils::ByteArray")) "*")
  (:variable :name "data"    :type "flash.utils::ByteArray" )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:variable :name "header"    :type "flash.utils::ByteArray" )
))


(:class "flash.display::GraphicsTrianglePath" :extends "Object" :implements ("GraphicsTrianglePath.as$194::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsTrianglePath" (&optional ("vertices" "__AS3__.vec::Vector.<Number>") ("indices" "__AS3__.vec::Vector.<int>") ("uvtData" "__AS3__.vec::Vector.<Number>") (("culling" "String") "none")) "*")
  (:method-get "culling" () "String"  )
  (:variable :name "_culling"  :namespace-type :private   :type "String" )
  (:variable :name "indices"    :type "__AS3__.vec::Vector.<int>" )
  (:variable :name "vertices"    :type "__AS3__.vec::Vector.<Number>" )
  (:variable :name "uvtData"    :type "__AS3__.vec::Vector.<Number>" )
  (:method-set "culling" (("value" "String")) "void"  )
))


(:class "flash.display::GradientType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LINEAR"    :type "String" :value "linear" :static t )
  (:constant :name "RADIAL"    :type "String" :value "radial" :static t )
  (:constructor "GradientType" () "*")
))


(:class "flash.net::URLRequestMethod" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "POST"    :type "String" :value "POST" :static t )
  (:constant :name "GET"    :type "String" :value "GET" :static t )
  (:constructor "URLRequestMethod" () "*")
))


(:class "flash.utils::ObjectInput" :extends "Object" :implements ("IDataInput") :public t 
 :properties (
  (:constructor "ObjectInput" () "*")
  (:method "readUnsignedInt" () "uint"  :native t )
  (:method "readByte" () "int"  :native t )
  (:method "readShort" () "int"  :native t )
  (:method "readDouble" () "Number"  :native t )
  (:method "readBoolean" () "Boolean"  :native t )
  (:method "readUnsignedByte" () "uint"  :native t )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method "readObject" () "*"  :native t )
  (:method "readUnsignedShort" () "uint"  :native t )
  (:method-get "endian" () "String"  :native t )
  (:method-get "bytesAvailable" () "uint"  :native t )
  (:method-set "objectEncoding" (("version" "uint")) "void"  :native t )
  (:method "readMultiByte" (("length" "uint") ("charSet" "String")) "String"  :native t )
  (:method "readFloat" () "Number"  :native t )
  (:method "readUTF" () "String"  :native t )
  (:method-set "endian" (("type" "String")) "void"  :native t )
  (:method "readInt" () "int"  :native t )
  (:method "readUTFBytes" (("length" "uint")) "String"  :native t )
  (:method "readBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void"  :native t )
))


(:class "flash.accessibility::AccessibilityImplementation" :extends "Object" :public t 
 :properties (
  (:constructor "AccessibilityImplementation" () "*")
  (:method "isLabeledBy" (("labelBounds" "flash.geom::Rectangle")) "Boolean"  )
  (:method "get_accName" (("childID" "uint")) "String"  )
  (:variable :name "errno"    :type "uint" )
  (:method "get_accFocus" () "uint"  )
  (:method "get_accValue" (("childID" "uint")) "String"  )
  (:method "accDoDefaultAction" (("childID" "uint")) "void"  )
  (:variable :name "stub"    :type "Boolean" )
  (:method "get_accSelection" () "Array"  )
  (:method "get_accRole" (("childID" "uint")) "uint"  )
  (:method "accLocation" (("childID" "uint")) "*"  )
  (:method "getChildIDArray" () "Array"  )
  (:method "get_accState" (("childID" "uint")) "uint"  )
  (:method "accSelect" (("operation" "uint") ("childID" "uint")) "void"  )
  (:method "get_accDefaultAction" (("childID" "uint")) "String"  )
))


(:class "flash.media::Camera" :extends "flash.events::EventDispatcher" :public t :final t 
 :properties (
  (:method-get "names" () "Array"  :native t :static t :final t )
  (:method "getCamera" (&optional ("name" "String")) "flash.media::Camera"  :native t :static t :final t )
  (:constructor "Camera" () "*")
  (:method-get "loopback" () "Boolean"  :native t )
  (:method "setMode" (("width" "int") ("height" "int") ("fps" "Number") &optional (("favorArea" "Boolean") t #|| true||# )) "void"  :native t )
  (:method-get "width" () "int"  :native t )
  (:method-get "height" () "int"  :native t )
  (:method-get "fps" () "Number"  :native t )
  (:method-get "name" () "String"  :native t )
  (:method "setMotionLevel" (("motionLevel" "int") &optional (("timeout" "int") 2000)) "void"  :native t )
  (:method-get "muted" () "Boolean"  :native t )
  (:method-get "motionLevel" () "int"  :native t )
  (:method-get "currentFPS" () "Number"  :native t )
  (:method-get "bandwidth" () "int"  :native t )
  (:method-get "index" () "int"  :native t )
  (:method-get "keyFrameInterval" () "int"  :native t )
  (:method "setLoopback" (&optional (("compress" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method-get "activityLevel" () "Number"  :native t )
  (:method "setCursor" (("value" "Boolean")) "void"  :native t )
  (:method-get "motionTimeout" () "int"  :native t )
  (:method "setKeyFrameInterval" (("keyFrameInterval" "int")) "void"  :native t )
  (:method "setQuality" (("bandwidth" "int") ("quality" "int")) "void"  :native t )
  (:method-get "quality" () "int"  :native t )
))


(:class "flash.text.engine::FontMetrics" :extends "Object" :public t :final t 
 :properties (
  (:constructor "FontMetrics" (("emBox" "flash.geom::Rectangle") ("strikethroughOffset" "Number") ("strikethroughThickness" "Number") ("underlineOffset" "Number") ("underlineThickness" "Number") ("subscriptOffset" "Number") ("subscriptScale" "Number") ("superscriptOffset" "Number") ("superscriptScale" "Number")) "*")
  (:variable :name "strikethroughThickness"    :type "Number" )
  (:variable :name "emBox"    :type "flash.geom::Rectangle" )
  (:variable :name "superscriptScale"    :type "Number" )
  (:variable :name "strikethroughOffset"    :type "Number" )
  (:variable :name "underlineThickness"    :type "Number" )
  (:variable :name "subscriptScale"    :type "Number" )
  (:variable :name "superscriptOffset"    :type "Number" )
  (:variable :name "subscriptOffset"    :type "Number" )
  (:variable :name "underlineOffset"    :type "Number" )
))


(:class "flash.display::AVM1Movie" :extends "flash.display::DisplayObject" :public t 
 :properties (
  (:constructor "AVM1Movie" () "*")
  (:method "_setCallAS3" (("closure" "Function")) "void" :namespace-type :private  :native t )
  (:method "_callAS3" (("functionName" "String") ("data" "flash.utils::ByteArray")) "void" :namespace-type :private  )
  (:method "addCallback" (("functionName" "String") ("closure" "Function")) "void"  )
  (:variable :name "callbackTable"  :namespace-type :private   :type "Object" )
  (:method "_callAS2" (("functionName" "String") ("arguments" "flash.utils::ByteArray")) "flash.utils::ByteArray" :namespace-type :private  :native t )
  (:method-get "_interopAvailable" () "Boolean" :namespace-type :private  :native t )
  (:method "call" (&rest ("functionName" "String")) "*"  )
))


(:class "flash.filters::DisplacementMapFilterMode" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "COLOR"    :type "String" :value "color" :static t )
  (:constant :name "IGNORE"    :type "String" :value "ignore" :static t )
  (:constant :name "WRAP"    :type "String" :value "wrap" :static t )
  (:constant :name "CLAMP"    :type "String" :value "clamp" :static t )
  (:constructor "DisplacementMapFilterMode" () "*")
))


(:class "flash.filters::GradientGlowFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "GradientGlowFilter" (&optional (("distance" "Number") 4) (("angle" "Number") 45) ("colors" "Array") ("alphas" "Array") ("ratios" "Array") (("blurX" "Number") 4) (("blurY" "Number") 4) (("strength" "Number") 1) (("quality" "int") 1) (("type" "String") "inner") (("knockout" "Boolean") nil #|| false||# )) "*")
  (:method-set "colors" (("value" "Array")) "void"  :native t )
  (:method-get "strength" () "Number"  :native t )
  (:method-set "blurX" (("value" "Number")) "void"  :native t )
  (:method-set "blurY" (("value" "Number")) "void"  :native t )
  (:method-set "angle" (("value" "Number")) "void"  :native t )
  (:method-get "type" () "String"  :native t )
  (:method-get "ratios" () "Array"  :native t )
  (:method-set "strength" (("value" "Number")) "void"  :native t )
  (:method-set "alphas" (("value" "Array")) "void"  :native t )
  (:method-get "colors" () "Array"  :native t )
  (:method-get "blurX" () "Number"  :native t )
  (:method-get "blurY" () "Number"  :native t )
  (:method-get "angle" () "Number"  :native t )
  (:method-set "knockout" (("value" "Boolean")) "void"  :native t )
  (:method-get "alphas" () "Array"  :native t )
  (:method-set "ratios" (("value" "Array")) "void"  :native t )
  (:method-set "distance" (("value" "Number")) "void"  :native t )
  (:method-get "knockout" () "Boolean"  :native t )
  (:method-set "type" (("value" "String")) "void"  :native t )
  (:method-get "distance" () "Number"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-set "quality" (("value" "int")) "void"  :native t )
  (:method-get "quality" () "int"  :native t )
))


  (:method "getQualifiedSuperclassName" ("value") "String"  :native t :uri "flash.utils" )
  (:method "getTimer" () "int"  :native t :uri "flash.utils" )
  (:method "describeType" ("value") "XML"  :native t :uri "flash.utils" )
  (:method "getDefinitionByName" (("name" "String")) "Object"  :native t :uri "flash.utils" )
  (:method "unescapeMultiByte" (("value" "String")) "String"  :native t :uri "flash.utils" )
  (:method "trace" () "void"  :native t )
  (:method "getQualifiedClassName" ("value") "String"  :native t :uri "flash.utils" )
  (:method "escapeMultiByte" (("value" "String")) "String"  :native t :uri "flash.utils" )

(:class "flash.display::JointStyle" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "MITER"    :type "String" :value "miter" :static t )
  (:constant :name "BEVEL"    :type "String" :value "bevel" :static t )
  (:constant :name "ROUND"    :type "String" :value "round" :static t )
  (:constructor "JointStyle" () "*")
))


(:class "flash.net::LocalConnection" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "LocalConnection" () "*")
  (:method-get "domain" () "String"  :native t )
  (:method-set "client" (("client" "Object")) "void"  :native t )
  (:method "close" () "void"  :native t )
  (:method "allowInsecureDomain" () "void"  :native t )
  (:method "connect" (("connectionName" "String")) "void"  :native t )
  (:method-get "client" () "Object"  :native t )
  (:method "allowDomain" () "void"  :native t )
  (:method "send" (("connectionName" "String") &rest ("methodName" "String")) "void"  :native t )
))


(:class "flash.text.engine::FontWeight" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "BOLD"    :type "String" :value "bold" :static t )
  (:constant :name "NORMAL"    :type "String" :value "normal" :static t )
  (:constructor "FontWeight" () "*")
))


(:class "flash.net::URLRequest" :extends "Object" :public t :final t 
 :properties (
  (:constructor "URLRequest" (&optional ("url" "String")) "*")
  (:method "shouldFilterHTTPHeader" (("header" "String")) "Boolean" :namespace-type :private  )
  (:method-get "method" () "String"  :native t )
  (:method-set "method" (("value" "String")) "void"  :native t )
  (:method-get "digest" () "String"  :native t )
  (:method-set "contentType" (("value" "String")) "void"  :native t )
  (:method-set "digest" (("value" "String")) "void"  :native t )
  (:method-get "data" () "Object"  :native t )
  (:method-set "requestHeaders" (("value" "Array")) "void"  :native t )
  (:method-get "url" () "String"  :native t )
  (:method-set "data" (("value" "Object")) "void"  :native t )
  (:method-get "requestHeaders" () "Array"  :native t )
  (:method-get "contentType" () "String"  :native t )
  (:method-set "url" (("value" "String")) "void"  :native t )
))


(:interface "flash.display::IGraphicsStroke" :public t 
 :properties (
  (:constructor "IGraphicsStroke" () "*")
))


(:class "flash.display::GraphicsStroke" :extends "Object" :implements ("GraphicsStroke.as$189::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsStroke" (&optional (("thickness" "Number") NaN) (("pixelHinting" "Boolean") nil #|| false||# ) (("scaleMode" "String") "normal") (("caps" "String") "none") (("joints" "String") "round") (("miterLimit" "Number") 3) ("fill" "flash.display::IGraphicsFill")) "*")
  (:variable :name "_caps"  :namespace-type :private   :type "String" )
  (:method-get "caps" () "String"  )
  (:method-set "caps" (("value" "String")) "void"  )
  (:variable :name "fill"    :type "flash.display::IGraphicsFill" )
  (:method-get "joints" () "String"  )
  (:method-get "scaleMode" () "String"  )
  (:variable :name "_scaleMode"  :namespace-type :private   :type "String" )
  (:variable :name "_joints"  :namespace-type :private   :type "String" )
  (:method-set "joints" (("value" "String")) "*"  )
  (:variable :name "thickness"    :type "Number" )
  (:variable :name "pixelHinting"    :type "Boolean" )
  (:variable :name "miterLimit"    :type "Number" )
  (:method-set "scaleMode" (("value" "String")) "void"  )
))


(:class "flash.xml::XMLTag" :extends "Object" :public t :final t 
 :properties (
  (:constructor "XMLTag" () "*")
  (:method-get "value" () "String"  :native t )
  (:method-set "value" (("v" "String")) "void"  :native t )
  (:method-set "type" (("value" "uint")) "void"  :native t )
  (:method-get "type" () "uint"  :native t )
  (:method-set "empty" (("value" "Boolean")) "void"  :native t )
  (:method-set "attrs" (("value" "Object")) "void"  :native t )
  (:method-get "empty" () "Boolean"  :native t )
  (:method-get "attrs" () "Object"  :native t )
))


(:class "flash.events::IOErrorEvent" :extends "flash.events::ErrorEvent" :public t 
 :properties (
  (:constant :name "DISK_ERROR"    :type "String" :value "diskError" :static t )
  (:constant :name "NETWORK_ERROR"    :type "String" :value "networkError" :static t )
  (:constant :name "VERIFY_ERROR"    :type "String" :value "verifyError" :static t )
  (:constant :name "IO_ERROR"    :type "String" :value "ioError" :static t )
  (:constructor "IOErrorEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("text" "String") "")) "*")
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:class "flash.text.engine::GraphicElement" :extends "flash.text.engine::ContentElement" :public t :final t 
 :properties (
  (:constructor "GraphicElement" (&optional ("graphic" "flash.display::DisplayObject") (("elementWidth" "Number") 15) (("elementHeight" "Number") 15) ("elementFormat" "flash.text.engine::ElementFormat") ("eventMirror" "flash.events::EventDispatcher") (("textRotation" "String") "rotate0")) "*")
  (:method-set "graphic" (("value" "flash.display::DisplayObject")) "void"  :native t )
  (:method-get "elementHeight" () "Number"  :native t )
  (:method-set "elementWidth" (("value" "Number")) "void"  :native t )
  (:method-set "elementHeight" (("value" "Number")) "void"  :native t )
  (:method-get "graphic" () "flash.display::DisplayObject"  :native t )
  (:method-get "elementWidth" () "Number"  :native t )
))


(:class "flash.desktop::ClipboardFormats" :extends "Object" :public t 
 :properties (
  (:constant :name "FLASH_PREFIX"  :namespace-type :internal   :type "String" :value "flash:" :static t )
  (:constant :name "REFERENCE_PREFIX"  :namespace-type :internal   :type "String" :value "air:reference:" :static t )
  (:constant :name "AIR_PREFIX"  :namespace-type :internal   :type "String" :value "air:" :static t )
  (:constant :name "SERIALIZATION_PREFIX"  :namespace-type :internal   :type "String" :value "air:serialization:" :static t )
  (:constant :name "TEXT_FORMAT"    :type "String" :value "air:text" :static t )
  (:constant :name "HTML_FORMAT"    :type "String" :value "air:html" :static t )
  (:constant :name "RICH_TEXT_FORMAT"    :type "String" :value "air:rtf" :static t )
  (:constant :name "BITMAP_FORMAT"    :type "String" :value "air:bitmap" :static t )
  (:constant :name "FILE_LIST_FORMAT"    :type "String" :value "air:file list" :static t )
  (:constant :name "URL_FORMAT"    :type "String" :value "air:url" :static t )
  (:constructor "ClipboardFormats" () "*")
))

(:class "flash.desktop::ClipboardTransferMode" :extends "Object" :public t 
 :properties (
  (:constant :name "ORIGINAL_PREFERRED"    :type "String" :value "originalPreferred" :static t )
  (:constant :name "CLONE_ONLY"    :type "String" :value "cloneOnly" :static t )
  (:constant :name "ORIGINAL_ONLY"    :type "String" :value "originalOnly" :static t )
  (:constant :name "CLONE_PREFERRED"    :type "String" :value "clonePreferred" :static t )
  (:constructor "ClipboardTransferMode" () "*")
))

(:class "flash.desktop::Clipboard" :extends "Object" :public t 
 :properties (
  (:variable :name "_toFlash"  :namespace-type :private   :type "flash.utils::Dictionary" :static t )
  (:variable :name "_fromFlash"  :namespace-type :private   :type "flash.utils::Dictionary" :static t )
  (:constant :name "WRITE_ACCESS_ERROR"  :namespace-type :private   :type "String" :value "Writing to clipboard not permitted in this context" :static t )
  (:method-get "generalClipboard" () "flash.desktop::Clipboard"  :native t :static t :final t )
  (:method "isSystemFormat" (("format" "String")) "Boolean" :namespace-type :private  :static t :final t )
  (:constant :name "LIFETIME_ERROR"  :namespace-type :private   :type "String" :value "Attempt to access a dead clipboard" :static t )
  (:method "initFormatMap" () "void" :namespace-type :private  :static t :final t )
  (:constant :name "READ_ACCESS_ERROR"  :namespace-type :private   :type "String" :value "Reading from clipboard not permitted in this context" :static t )
  (:variable :name "_wasFormatMapInitialized"  :namespace-type :private   :type "Boolean" :value nil #|| false||#  :static t )
  (:method "addFormatMapping" (("flashFormat" "String") ("exportFromFlash" "Function") ("importToFlash" "Function")) "*" :namespace-type :private  :static t :final t )
  (:constructor "Clipboard" () "*")
  (:method-get "canReadContents" () "Boolean" :namespace-type :private  :native t )
  (:method "getHTML" () "String" :namespace-type :private  :native t )
  (:method "getOriginal" (("format" "String")) "Object" :namespace-type :private  )
  (:method "convertNativeFormat" (("format" "String")) "Object" :namespace-type :private  )
  (:method "checkAccess" (("requestRead" "Boolean") ("requestWrite" "Boolean")) "void" :namespace-type :private  )
  (:method-get "alive" () "Boolean" :namespace-type :private  :native t )
  (:method "getString" () "String" :namespace-type :private  :native t )
  (:method "putString" (("s" "String")) "void" :namespace-type :private  :native t )
  (:method "clear" () "void"  :native t )
  (:method "putRTF" (("rtf" "flash.utils::ByteArray")) "void" :namespace-type :private  :native t )
  (:method "getObjectReference" (("format" "String")) "Object" :namespace-type :private  :native t )
  (:method "clearData" (("format" "String")) "void"  :native t )
  (:method "getDeserialization" (("format" "String")) "Object" :namespace-type :private  )
  (:method "convertFlashFormat" (("flashFormat" "String") ("data" "Object") ("serializable" "Boolean")) "Boolean" :namespace-type :private  )
  (:method-get "formats" () "Array"  :native t )
  (:method "getData" (("format" "String") &optional (("transferMode" "String") "originalPreferred")) "Object"  )
  (:method "putSerialization" (("format" "String") ("data" "Object")) "void" :namespace-type :private  )
  (:method "putByteArray" (("format" "String") ("bytes" "flash.utils::ByteArray")) "void" :namespace-type :private  :native t )
  (:method "getClone" (("format" "String")) "Object" :namespace-type :private  )
  (:method-get "canWriteContents" () "Boolean" :namespace-type :private  :native t )
  (:method "setData" (("format" "String") ("data" "Object") &optional (("serializable" "Boolean") t #|| true||# )) "Boolean"  )
  (:method "getRTF" () "flash.utils::ByteArray" :namespace-type :private  :native t )
  (:method "hasFormat" (("format" "String")) "Boolean"  )
  (:method "putHTML" (("html" "String")) "void" :namespace-type :private  :native t )
  (:method "getByteArray" (("format" "String")) "flash.utils::ByteArray" :namespace-type :private  :native t )
  (:method "putObjectReference" (("format" "String") ("data" "Object")) "void" :namespace-type :private  :native t )
  (:method "setDataHandler" (("format" "String") ("handler" "Function") &optional (("serializable" "Boolean") t #|| true||# )) "Boolean"  )
  (:method "nativeSetHandler" (("format" "String") ("handler" "Function")) "void" :namespace-type :private  :native t )
))


(:class "flash.text.engine::BreakOpportunity" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ALL"    :type "String" :value "all" :static t )
  (:constant :name "AUTO"    :type "String" :value "auto" :static t )
  (:constant :name "ANY"    :type "String" :value "any" :static t )
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constructor "BreakOpportunity" () "*")
))


(:class "flash.filters::GradientBevelFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "GradientBevelFilter" (&optional (("distance" "Number") 4) (("angle" "Number") 45) ("colors" "Array") ("alphas" "Array") ("ratios" "Array") (("blurX" "Number") 4) (("blurY" "Number") 4) (("strength" "Number") 1) (("quality" "int") 1) (("type" "String") "inner") (("knockout" "Boolean") nil #|| false||# )) "*")
  (:method-set "colors" (("value" "Array")) "void"  :native t )
  (:method-get "strength" () "Number"  :native t )
  (:method-set "blurX" (("value" "Number")) "void"  :native t )
  (:method-set "blurY" (("value" "Number")) "void"  :native t )
  (:method-set "angle" (("value" "Number")) "void"  :native t )
  (:method-get "type" () "String"  :native t )
  (:method-get "ratios" () "Array"  :native t )
  (:method-set "strength" (("value" "Number")) "void"  :native t )
  (:method-set "alphas" (("value" "Array")) "void"  :native t )
  (:method-get "colors" () "Array"  :native t )
  (:method-get "blurX" () "Number"  :native t )
  (:method-get "blurY" () "Number"  :native t )
  (:method-get "angle" () "Number"  :native t )
  (:method-set "knockout" (("value" "Boolean")) "void"  :native t )
  (:method-get "distance" () "Number"  :native t )
  (:method-set "ratios" (("value" "Array")) "void"  :native t )
  (:method-set "distance" (("value" "Number")) "void"  :native t )
  (:method-get "knockout" () "Boolean"  :native t )
  (:method-set "type" (("value" "String")) "void"  :native t )
  (:method-get "alphas" () "Array"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-set "quality" (("value" "int")) "void"  :native t )
  (:method-get "quality" () "int"  :native t )
))


(:class "flash.display::GraphicsPathCommand" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LINE_TO"    :type "int" :value 2 :static t )
  (:constant :name "MOVE_TO"    :type "int" :value 1 :static t )
  (:constant :name "CURVE_TO"    :type "int" :value 3 :static t )
  (:constant :name "WIDE_LINE_TO"    :type "int" :value 5 :static t )
  (:constant :name "WIDE_MOVE_TO"    :type "int" :value 4 :static t )
  (:constant :name "NO_OP"    :type "int" :value 0 :static t )
  (:constructor "GraphicsPathCommand" () "*")
))


(:class "flash.events::FocusEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "MOUSE_FOCUS_CHANGE"    :type "String" :value "mouseFocusChange" :static t )
  (:constant :name "FOCUS_OUT"    :type "String" :value "focusOut" :static t )
  (:constant :name "KEY_FOCUS_CHANGE"    :type "String" :value "keyFocusChange" :static t )
  (:constant :name "FOCUS_IN"    :type "String" :value "focusIn" :static t )
  (:constructor "FocusEvent" (("type" "String") &optional (("bubbles" "Boolean") t #|| true||# ) (("cancelable" "Boolean") nil #|| false||# ) ("relatedObject" "flash.display::InteractiveObject") (("shiftKey" "Boolean") nil #|| false||# ) (("keyCode" "uint") 0)) "*")
  (:method-set "shiftKey" (("value" "Boolean")) "void"  )
  (:method-get "isRelatedObjectInaccessible" () "Boolean"  )
  (:method-get "shiftKey" () "Boolean"  )
  (:variable :name "m_isRelatedObjectInaccessible"  :namespace-type :private   :type "Boolean" )
  (:method-get "relatedObject" () "flash.display::InteractiveObject"  )
  (:method "toString" () "String"  :override t )
  (:method-get "keyCode" () "uint"  )
  (:variable :name "m_shiftKey"  :namespace-type :private   :type "Boolean" )
  (:method-set "isRelatedObjectInaccessible" (("value" "Boolean")) "void"  )
  (:variable :name "m_relatedObject"  :namespace-type :private   :type "flash.display::InteractiveObject" )
  (:variable :name "m_keyCode"  :namespace-type :private   :type "uint" )
  (:method-set "relatedObject" (("value" "flash.display::InteractiveObject")) "void"  )
  (:method "clone" () "flash.events::Event"  :override t )
  (:method-set "keyCode" (("value" "uint")) "void"  )
))


(:class "flash.geom::Matrix3D" :extends "Object" :public t 
 :properties (
  (:method "interpolate" (("thisMat" "flash.geom::Matrix3D") ("toMat" "flash.geom::Matrix3D") ("percent" "Number")) "flash.geom::Matrix3D"  :native t :static t :final t )
  (:constructor "Matrix3D" (&optional ("v" "__AS3__.vec::Vector.<Number>")) "*")
  (:method "transpose" () "void"  :native t )
  (:method "prependTranslation" (("x" "Number") ("y" "Number") ("z" "Number")) "void"  :native t )
  (:method-set "rawData" (("v" "__AS3__.vec::Vector.<Number>")) "void"  :native t )
  (:method "deltaTransformVector" (("v" "flash.geom::Vector3D")) "flash.geom::Vector3D"  :native t )
  (:method-get "position" () "flash.geom::Vector3D"  :native t )
  (:method "pointAt" (("pos" "flash.geom::Vector3D") &optional ("at" "flash.geom::Vector3D") ("up" "flash.geom::Vector3D")) "void"  :native t )
  (:method "transformVectors" (("vin" "__AS3__.vec::Vector.<Number>") ("vout" "__AS3__.vec::Vector.<Number>")) "void"  :native t )
  (:method "prependRotation" (("degrees" "Number") ("axis" "flash.geom::Vector3D") &optional ("pivotPoint" "flash.geom::Vector3D")) "void"  :native t )
  (:method "prepend" (("rhs" "flash.geom::Matrix3D")) "void"  :native t )
  (:method "transformVector" (("v" "flash.geom::Vector3D")) "flash.geom::Vector3D"  :native t )
  (:method "appendScale" (("xScale" "Number") ("yScale" "Number") ("zScale" "Number")) "void"  :native t )
  (:method "decompose" (&optional (("orientationStyle" "String") "eulerAngles")) "__AS3__.vec::Vector.<flash.geom::Vector3D>"  :native t )
  (:method-get "rawData" () "__AS3__.vec::Vector.<Number>"  :native t )
  (:method "interpolateTo" (("toMat" "flash.geom::Matrix3D") ("percent" "Number")) "void"  :native t )
  (:method-get "determinant" () "Number"  :native t )
  (:method "invert" () "Boolean"  :native t )
  (:method "appendTranslation" (("x" "Number") ("y" "Number") ("z" "Number")) "void"  :native t )
  (:method "appendRotation" (("degrees" "Number") ("axis" "flash.geom::Vector3D") &optional ("pivotPoint" "flash.geom::Vector3D")) "void"  :native t )
  (:method-set "position" (("pos" "flash.geom::Vector3D")) "void"  :native t )
  (:method "append" (("lhs" "flash.geom::Matrix3D")) "void"  :native t )
  (:method "prependScale" (("xScale" "Number") ("yScale" "Number") ("zScale" "Number")) "void"  :native t )
  (:method "clone" () "flash.geom::Matrix3D"  )
  (:method "identity" () "void"  :native t )
  (:method "recompose" (("components" "__AS3__.vec::Vector.<flash.geom::Vector3D>") &optional (("orientationStyle" "String") "eulerAngles")) "Boolean"  :native t )
))


(:class "flash.text.engine::TextRotation" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ROTATE_180"    :type "String" :value "rotate180" :static t )
  (:constant :name "ROTATE_270"    :type "String" :value "rotate270" :static t )
  (:constant :name "ROTATE_90"    :type "String" :value "rotate90" :static t )
  (:constant :name "ROTATE_0"    :type "String" :value "rotate0" :static t )
  (:constant :name "AUTO"    :type "String" :value "auto" :static t )
  (:constructor "TextRotation" () "*")
))


(:class "flash.events::SampleDataEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "SAMPLE_DATA"    :type "String" :value "sampleData" :static t )
  (:constructor "SampleDataEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("theposition" "Number") 0) ("thedata" "flash.utils::ByteArray")) "*")
  (:method-set "position" (("theposition" "Number")) "*"  )
  (:method-set "data" (("thedata" "flash.utils::ByteArray")) "*"  )
  (:method-get "position" () "Number"  )
  (:method-get "data" () "flash.utils::ByteArray"  )
  (:variable :name "m_position"  :namespace-type :private   :type "Number" )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:variable :name "m_data"  :namespace-type :private   :type "flash.utils::ByteArray" )
))


(:class "flash.display::BitmapDataChannel" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "RED"    :type "uint" :value 1 :static t )
  (:constant :name "GREEN"    :type "uint" :value 2 :static t )
  (:constant :name "BLUE"    :type "uint" :value 4 :static t )
  (:constant :name "ALPHA"    :type "uint" :value 8 :static t )
  (:constructor "BitmapDataChannel" () "*")
))


(:class "flash.geom::Vector3D" :extends "Object" :public t 
 :properties (
  (:method "distance" (("pt1" "flash.geom::Vector3D") ("pt2" "flash.geom::Vector3D")) "Number"  :static t :final t )
  (:method "angleBetween" (("a" "flash.geom::Vector3D") ("b" "flash.geom::Vector3D")) "Number"  :static t :final t )
  (:constant :name "Z_AXIS"    :type "flash.geom::Vector3D" :static t )
  (:constant :name "Y_AXIS"    :type "flash.geom::Vector3D" :static t )
  (:constant :name "X_AXIS"    :type "flash.geom::Vector3D" :static t )
  (:constructor "Vector3D" (&optional (("x" "Number") 0) (("y" "Number") 0) (("z" "Number") 0) (("w" "Number") 0)) "*")
  (:method "project" () "void"  )
  (:method-get "lengthSquared" () "Number"  )
  (:method "negate" () "void"  )
  (:method "add" (("a" "flash.geom::Vector3D")) "flash.geom::Vector3D"  )
  (:method "dotProduct" (("a" "flash.geom::Vector3D")) "Number"  )
  (:method "nearEquals" (("toCompare" "flash.geom::Vector3D") ("tolerance" "Number") &optional (("allFour" "Boolean") nil #|| false||# )) "Boolean"  )
  (:method "scaleBy" (("s" "Number")) "void"  )
  (:method "decrementBy" (("a" "flash.geom::Vector3D")) "void"  )
  (:method "toString" () "String"  )
  (:method-get "length" () "Number"  )
  (:method "crossProduct" (("a" "flash.geom::Vector3D")) "flash.geom::Vector3D"  )
  (:method "incrementBy" (("a" "flash.geom::Vector3D")) "void"  )
  (:variable :name "w"    :type "Number" )
  (:variable :name "x"    :type "Number" )
  (:variable :name "y"    :type "Number" )
  (:variable :name "z"    :type "Number" )
  (:method "subtract" (("a" "flash.geom::Vector3D")) "flash.geom::Vector3D"  )
  (:method "normalize" () "Number"  )
  (:method "clone" () "flash.geom::Vector3D"  )
  (:method "equals" (("toCompare" "flash.geom::Vector3D") &optional (("allFour" "Boolean") nil #|| false||# )) "Boolean"  )
))


(:class "flash.display::InteractiveObject" :extends "flash.display::DisplayObject" :public t 
 :properties (
  (:constructor "InteractiveObject" () "*")
  (:method-get "accessibilityImplementation" () "flash.accessibility::AccessibilityImplementation"  :native t )
  (:method-get "focusRect" () "Object"  :native t )
  (:method-set "focusRect" (("focusRect" "Object")) "void"  :native t )
  (:method-get "doubleClickEnabled" () "Boolean"  :native t )
  (:method-set "contextMenu" (("cm" "flash.ui::ContextMenu")) "void"  :native t )
  (:method-get "tabEnabled" () "Boolean"  :native t )
  (:method-get "contextMenu" () "flash.ui::ContextMenu"  :native t )
  (:method-set "accessibilityImplementation" (("value" "flash.accessibility::AccessibilityImplementation")) "void"  :native t )
  (:method-set "doubleClickEnabled" (("enabled" "Boolean")) "void"  :native t )
  (:method-set "mouseEnabled" (("enabled" "Boolean")) "void"  :native t )
  (:method-set "tabIndex" (("index" "int")) "void"  :native t )
  (:method-get "mouseEnabled" () "Boolean"  :native t )
  (:method-get "tabIndex" () "int"  :native t )
  (:method-set "tabEnabled" (("enabled" "Boolean")) "void"  :native t )
))


(:class "flash.ui::ContextMenu" :extends "flash.events::EventDispatcher" :public t :final t 
 :properties (
  (:constructor "ContextMenu" () "*")
  (:method-set "builtInItems" (("value" "flash.ui::ContextMenuBuiltInItems")) "void"  :native t )
  (:method-get "builtInItems" () "flash.ui::ContextMenuBuiltInItems"  :native t )
  (:method "cloneLinkAndClipboardProperties" (("c" "flash.ui::ContextMenu")) "void" :namespace-type :private  :native t )
  (:method-get "clipboardItems" () "flash.ui::ContextMenuClipboardItems"  :native t )
  (:method-get "customItems" () "Array"  :native t )
  (:method-set "clipboardMenu" (("value" "Boolean")) "void"  :native t )
  (:method-set "link" (("value" "flash.net::URLRequest")) "void"  :native t )
  (:method-get "clipboardMenu" () "Boolean"  :native t )
  (:method-get "link" () "flash.net::URLRequest"  :native t )
  (:method-set "clipboardItems" (("value" "flash.ui::ContextMenuClipboardItems")) "void"  :native t )
  (:method "initLinkAndClipboardProperties" () "void" :namespace-type :private  :native t )
  (:method "clone" () "flash.ui::ContextMenu"  )
  (:method-set "customItems" (("value" "Array")) "void"  :native t )
  (:method "hideBuiltInItems" () "void"  )
))


(:class "flash.text.engine::Kerning" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "AUTO"    :type "String" :value "auto" :static t )
  (:constant :name "ON"    :type "String" :value "on" :static t )
  (:constant :name "OFF"    :type "String" :value "off" :static t )
  (:constructor "Kerning" () "*")
))


(:class "flash.display::LoaderInfo" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:method "getLoaderInfoByDefinition" (("object" "Object")) "flash.display::LoaderInfo"  :native t :static t :final t )
  (:constructor "LoaderInfo" () "*")
  (:method "dispatchEvent" (("event" "flash.events::Event")) "Boolean"  :override t )
  (:method "_getArgs" () "Object" :namespace-type :private  :native t )
  (:method-get "width" () "int"  :native t )
  (:method-get "height" () "int"  :native t )
  (:method-get "parentAllowsChild" () "Boolean"  :native t )
  (:method-get "parameters" () "Object"  )
  (:method-get "bytes" () "flash.utils::ByteArray"  :native t )
  (:method-get "frameRate" () "Number"  :native t )
  (:method-get "url" () "String"  :native t )
  (:method-get "bytesLoaded" () "uint"  :native t )
  (:method-get "sameDomain" () "Boolean"  :native t )
  (:method-get "contentType" () "String"  :native t )
  (:method-get "applicationDomain" () "flash.system::ApplicationDomain"  :native t )
  (:method-get "swfVersion" () "uint"  :native t )
  (:method-get "actionScriptVersion" () "uint"  :native t )
  (:method-get "bytesTotal" () "uint"  :native t )
  (:method-get "loader" () "flash.display::Loader"  :native t )
  (:method-get "content" () "flash.display::DisplayObject"  :native t )
  (:method-get "loaderURL" () "String"  :native t )
  (:method-get "sharedEvents" () "flash.events::EventDispatcher"  :native t )
  (:method-get "childAllowsParent" () "Boolean"  :native t )
))


(:class "flash.display::Shape" :extends "flash.display::DisplayObject" :public t 
 :properties (
  (:constructor "Shape" () "*")
  (:method-get "graphics" () "flash.display::Graphics"  :native t )
))


(:class "flash.events::SyncEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "SYNC"    :type "String" :value "sync" :static t )
  (:constructor "SyncEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) ("changeList" "Array")) "*")
  (:variable :name "m_changeList"  :namespace-type :private   :type "Array" )
  (:method-set "changeList" (("value" "Array")) "void"  )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:method-get "changeList" () "Array"  )
))


(:class "flash.filters::BevelFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "BevelFilter" (&optional (("distance" "Number") 4) (("angle" "Number") 45) (("highlightColor" "uint") 16777215) (("highlightAlpha" "Number") 1) (("shadowColor" "uint") 0) (("shadowAlpha" "Number") 1) (("blurX" "Number") 4) (("blurY" "Number") 4) (("strength" "Number") 1) (("quality" "int") 1) (("type" "String") "inner") (("knockout" "Boolean") nil #|| false||# )) "*")
  (:method-get "strength" () "Number"  :native t )
  (:method-set "strength" (("value" "Number")) "void"  :native t )
  (:method-set "shadowColor" (("value" "uint")) "void"  :native t )
  (:method-get "knockout" () "Boolean"  :native t )
  (:method-get "highlightAlpha" () "Number"  :native t )
  (:method-get "highlightColor" () "uint"  :native t )
  (:method-get "blurX" () "Number"  :native t )
  (:method-get "blurY" () "Number"  :native t )
  (:method-get "angle" () "Number"  :native t )
  (:method-set "highlightAlpha" (("value" "Number")) "void"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-set "highlightColor" (("value" "uint")) "void"  :native t )
  (:method-set "blurX" (("value" "Number")) "void"  :native t )
  (:method-get "shadowColor" () "uint"  :native t )
  (:method-set "blurY" (("value" "Number")) "void"  :native t )
  (:method-get "shadowAlpha" () "Number"  :native t )
  (:method-set "angle" (("value" "Number")) "void"  :native t )
  (:method-set "distance" (("value" "Number")) "void"  :native t )
  (:method-set "type" (("value" "String")) "void"  :native t )
  (:method-get "distance" () "Number"  :native t )
  (:method-get "type" () "String"  :native t )
  (:method-set "knockout" (("value" "Boolean")) "void"  :native t )
  (:method-set "shadowAlpha" (("value" "Number")) "void"  :native t )
  (:method-set "quality" (("value" "int")) "void"  :native t )
  (:method-get "quality" () "int"  :native t )
))


(:class "flash.filters::ShaderFilter" :extends "flash.filters::BitmapFilter" :public t 
 :properties (
  (:constructor "ShaderFilter" (&optional ("shader" "flash.display::Shader")) "*")
  (:method-set "_extendBy" (("extend" "flash.geom::Rectangle")) "void" :namespace-type :private  :native t )
  (:method-get "rightExtension" () "int"  )
  (:method-get "shader" () "flash.display::Shader"  :native t )
  (:method-set "rightExtension" (("v" "int")) "void"  )
  (:method-set "bottomExtension" (("v" "int")) "void"  )
  (:method-set "shader" (("shader" "flash.display::Shader")) "void"  :native t )
  (:method-set "leftExtension" (("v" "int")) "void"  )
  (:method-get "topExtension" () "int"  )
  (:method-set "topExtension" (("v" "int")) "void"  )
  (:method-get "_extendBy" () "flash.geom::Rectangle" :namespace-type :private  :native t )
  (:method-get "leftExtension" () "int"  )
  (:method-get "bottomExtension" () "int"  )
))


(:class "flash.geom::Rectangle" :extends "Object" :public t 
 :properties (
  (:constructor "Rectangle" (&optional (("x" "Number") 0) (("y" "Number") 0) (("width" "Number") 0) (("height" "Number") 0)) "*")
  (:method "containsPoint" (("point" "flash.geom::Point")) "Boolean"  )
  (:method-get "size" () "flash.geom::Point"  )
  (:method-set "size" (("value" "flash.geom::Point")) "void"  )
  (:method "isEmpty" () "Boolean"  )
  (:variable :name "width"    :type "Number" )
  (:method-get "left" () "Number"  )
  (:method "inflatePoint" (("point" "flash.geom::Point")) "void"  )
  (:method "setEmpty" () "void"  )
  (:method-set "left" (("value" "Number")) "void"  )
  (:method "union" (("toUnion" "flash.geom::Rectangle")) "flash.geom::Rectangle"  )
  (:method-set "right" (("value" "Number")) "void"  )
  (:method "offset" (("dx" "Number") ("dy" "Number")) "void"  )
  (:method-get "top" () "Number"  )
  (:method-set "bottom" (("value" "Number")) "void"  )
  (:method "equals" (("toCompare" "flash.geom::Rectangle")) "Boolean"  )
  (:method "intersection" (("toIntersect" "flash.geom::Rectangle")) "flash.geom::Rectangle"  )
  (:method-get "right" () "Number"  )
  (:method "clone" () "flash.geom::Rectangle"  )
  (:method "inflate" (("dx" "Number") ("dy" "Number")) "void"  )
  (:method-set "bottomRight" (("value" "flash.geom::Point")) "void"  )
  (:method "containsRect" (("rect" "flash.geom::Rectangle")) "Boolean"  )
  (:variable :name "height"    :type "Number" )
  (:method-set "top" (("value" "Number")) "void"  )
  (:method-get "bottom" () "Number"  )
  (:method "toString" () "String"  )
  (:method "contains" (("x" "Number") ("y" "Number")) "Boolean"  )
  (:method-get "bottomRight" () "flash.geom::Point"  )
  (:method "intersects" (("toIntersect" "flash.geom::Rectangle")) "Boolean"  )
  (:variable :name "x"    :type "Number" )
  (:variable :name "y"    :type "Number" )
  (:method-get "topLeft" () "flash.geom::Point"  )
  (:method "offsetPoint" (("point" "flash.geom::Point")) "void"  )
  (:method-set "topLeft" (("value" "flash.geom::Point")) "void"  )
))


(:class "flash.display::SWFVersion" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "FLASH1"    :type "uint" :value 1 :static t )
  (:constant :name "FLASH3"    :type "uint" :value 3 :static t )
  (:constant :name "FLASH5"    :type "uint" :value 5 :static t )
  (:constant :name "FLASH7"    :type "uint" :value 7 :static t )
  (:constant :name "FLASH4"    :type "uint" :value 4 :static t )
  (:constant :name "FLASH6"    :type "uint" :value 6 :static t )
  (:constant :name "FLASH8"    :type "uint" :value 8 :static t )
  (:constant :name "FLASH2"    :type "uint" :value 2 :static t )
  (:constant :name "FLASH10"    :type "uint" :value 10 :static t )
  (:constant :name "FLASH9"    :type "uint" :value 9 :static t )
  (:constructor "SWFVersion" () "*")
))


(:class "flash.net::Responder" :extends "Object" :public t 
 :properties (
  (:constructor "Responder" (("result" "Function") &optional ("status" "Function")) "*")
))


(:class "flash.system::Capabilities" :extends "Object" :public t :final t 
 :properties (
  (:method-get "hasTLS" () "Boolean"  :native t :static t :final t )
  (:method-get "hasScreenBroadcast" () "Boolean"  :native t :static t :final t )
  (:method-get "hasIME" () "Boolean"  :native t :static t :final t )
  (:method-get "maxLevelIDC" () "String"  :native t :static t :final t )
  (:method-get "hasStreamingAudio" () "Boolean"  :native t :static t :final t )
  (:method-get "hasPrinting" () "Boolean"  :native t :static t :final t )
  (:method-get "screenDPI" () "Number"  :native t :static t :final t )
  (:method-get "hasAccessibility" () "Boolean"  :native t :static t :final t )
  (:method-get "hasMP3" () "Boolean"  :native t :static t :final t )
  (:method-get "hasEmbeddedVideo" () "Boolean"  :native t :static t :final t )
  (:method-get "manufacturer" () "String"  :native t :static t :final t )
  (:method-get "hasVideoEncoder" () "Boolean"  :native t :static t :final t )
  (:method-get "hasAudio" () "Boolean"  :native t :static t :final t )
  (:method-get "screenColor" () "String"  :native t :static t :final t )
  (:method-get "language" () "String"  :native t :static t :final t )
  (:method-get "hasAudioEncoder" () "Boolean"  :native t :static t :final t )
  (:method-get "hasScreenPlayback" () "Boolean"  :native t :static t :final t )
  (:method-get "_internal" () "uint"  :native t :static t :final t )
  (:method-get "os" () "String"  :native t :static t :final t )
  (:method-get "version" () "String"  :native t :static t :final t )
  (:method-get "screenResolutionY" () "Number"  :native t :static t :final t )
  (:method-get "avHardwareDisable" () "Boolean"  :native t :static t :final t )
  (:method-get "pixelAspectRatio" () "Number"  :native t :static t :final t )
  (:method-get "screenResolutionX" () "Number"  :native t :static t :final t )
  (:method-get "isDebugger" () "Boolean"  :native t :static t :final t )
  (:method-get "hasStreamingVideo" () "Boolean"  :native t :static t :final t )
  (:method-get "serverString" () "String"  :native t :static t :final t )
  (:method-get "localFileReadDisable" () "Boolean"  :native t :static t :final t )
  (:method-get "playerType" () "String"  :native t :static t :final t )
  (:method-get "isEmbeddedInAcrobat" () "Boolean"  :native t :static t :final t )
  (:constructor "Capabilities" () "*")
))


(:class "flash.net::NetStreamInfo" :extends "Object" :public t :final t 
 :properties (
  (:constructor "NetStreamInfo" (("curBPS" "Number") ("byteCount" "Number") ("maxBPS" "Number") ("audioBPS" "Number") ("audioByteCount" "Number") ("videoBPS" "Number") ("videoByteCount" "Number") ("dataBPS" "Number") ("dataByteCount" "Number") ("playbackBPS" "Number") ("droppedFrames" "Number") ("audioBufferByteLength" "Number") ("videoBufferByteLength" "Number") ("dataBufferByteLength" "Number") ("audioBufferLength" "Number") ("videoBufferLength" "Number") ("dataBufferLength" "Number") ("srtt" "Number") ("audioLossRate" "Number")) "*")
  (:method-get "videoBufferByteLength" () "Number"  )
  (:variable :name "m_dataByteCount"  :namespace-type :private   :type "Number" )
  (:method-get "droppedFrames" () "Number"  )
  (:variable :name "m_videoBufferLength"  :namespace-type :private   :type "Number" )
  (:method-get "dataBytesPerSecond" () "Number"  )
  (:variable :name "m_audioBufferByteLength"  :namespace-type :private   :type "Number" )
  (:variable :name "m_byteCount"  :namespace-type :private   :type "Number" )
  (:method-get "dataBufferLength" () "Number"  )
  (:method-get "audioLossRate" () "Number"  )
  (:method-get "currentBytesPerSecond" () "Number"  )
  (:method-get "videoBytesPerSecond" () "Number"  )
  (:variable :name "m_dataBytesPerSecond"  :namespace-type :private   :type "Number" )
  (:variable :name "m_dataBufferLength"  :namespace-type :private   :type "Number" )
  (:method-get "videoByteCount" () "Number"  )
  (:method-get "SRTT" () "Number"  )
  (:variable :name "m_srtt"  :namespace-type :private   :type "Number" )
  (:variable :name "m_droppedFrames"  :namespace-type :private   :type "Number" )
  (:variable :name "m_videoBufferByteLength"  :namespace-type :private   :type "Number" )
  (:method-get "audioByteCount" () "Number"  )
  (:method-get "audioBytesPerSecond" () "Number"  )
  (:variable :name "m_videoByteCount"  :namespace-type :private   :type "Number" )
  (:method-get "dataBufferByteLength" () "Number"  )
  (:method-get "playbackBytesPerSecond" () "Number"  )
  (:variable :name "m_audioByteCount"  :namespace-type :private   :type "Number" )
  (:variable :name "m_audioLossRate"  :namespace-type :private   :type "Number" )
  (:variable :name "m_dataBufferByteLength"  :namespace-type :private   :type "Number" )
  (:variable :name "m_currentBytesPerSecond"  :namespace-type :private   :type "Number" )
  (:variable :name "m_videoBytesPerSecond"  :namespace-type :private   :type "Number" )
  (:method-get "maxBytesPerSecond" () "Number"  )
  (:variable :name "m_playbackBytesPerSecond"  :namespace-type :private   :type "Number" )
  (:method-get "dataByteCount" () "Number"  )
  (:method-get "audioBufferLength" () "Number"  )
  (:method-get "videoBufferLength" () "Number"  )
  (:method-get "audioBufferByteLength" () "Number"  )
  (:method-get "byteCount" () "Number"  )
  (:variable :name "m_audioBytesPerSecond"  :namespace-type :private   :type "Number" )
  (:method "toString" () "String"  )
  (:variable :name "m_audioBufferLength"  :namespace-type :private   :type "Number" )
  (:variable :name "m_maxBytesPerSecond"  :namespace-type :private   :type "Number" )
))


(:class "flash.text.engine::TextElement" :extends "flash.text.engine::ContentElement" :public t :final t 
 :properties (
  (:constructor "TextElement" (&optional ("text" "String") ("elementFormat" "flash.text.engine::ElementFormat") ("eventMirror" "flash.events::EventDispatcher") (("textRotation" "String") "rotate0")) "*")
  (:method "replaceText" (("beginIndex" "int") ("endIndex" "int") ("newText" "String")) "void"  :native t )
  (:method-set "text" (("value" "String")) "void"  :native t )
))


(:interface "flash.net::IDynamicPropertyOutput" :public t 
 :properties (
  (:constructor "IDynamicPropertyOutput" () "*")
  (:method "writeDynamicProperty" (("name" "String") "value") "void" :namespace-type :public  )
))


(:class "flash.text.engine::JustificationStyle" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "PUSH_IN_KINSOKU"    :type "String" :value "pushInKinsoku" :static t )
  (:constant :name "PRIORITIZE_LEAST_ADJUSTMENT"    :type "String" :value "prioritizeLeastAdjustment" :static t )
  (:constant :name "PUSH_OUT_ONLY"    :type "String" :value "pushOutOnly" :static t )
  (:constructor "JustificationStyle" () "*")
))


(:class "flash.display::StageDisplayState" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "FULL_SCREEN"    :type "String" :value "fullScreen" :static t )
  (:constant :name "NORMAL"    :type "String" :value "normal" :static t )
  (:constructor "StageDisplayState" () "*")
))


(:class "adobe.utils::ProductManager" :extends "flash.events::EventDispatcher" :public t :final t 
 :properties (
  (:constructor "ProductManager" (("name" "String")) "*")
  (:method "launch" (&optional ("parameters" "String")) "Boolean"  :native t )
  (:method "validate" (("str" "String")) "String" :namespace-type :private  )
  (:method "download" (&optional ("caption" "String") ("fileName" "String") ("pathElements" "Array")) "Boolean"  )
  (:method-get "installed" () "Boolean"  :native t )
  (:method "doDownload" (("caption" "String") ("fileName" "String")) "Boolean" :namespace-type :private  :native t )
  (:method-get "installedVersion" () "String"  :native t )
  (:method-get "running" () "Boolean"  :native t )
))


(:class "flash.display::FrameLabel" :extends "Object" :public t :final t 
 :properties (
  (:constructor "FrameLabel" (("name" "String") ("frame" "int")) "*")
  (:variable :name "_name"  :namespace-type :private   :type "String" )
  (:method-get "name" () "String"  )
  (:method-get "frame" () "int"  )
  (:variable :name "_frame"  :namespace-type :private   :type "int" )
))


(:class "flash.text.engine::ElementFormat" :extends "Object" :public t :final t 
 :properties (
  (:constructor "ElementFormat" (&optional ("fontDescription" "flash.text.engine::FontDescription") (("fontSize" "Number") 12) (("color" "uint") 0) (("alpha" "Number") 1) (("textRotation" "String") "auto") (("dominantBaseline" "String") "roman") (("alignmentBaseline" "String") "useDominantBaseline") (("baselineShift" "Number") 0) (("kerning" "String") "on") (("trackingRight" "Number") 0) (("trackingLeft" "Number") 0) (("locale" "String") "en") (("breakOpportunity" "String") "auto") (("digitCase" "String") "default") (("digitWidth" "String") "default") (("ligatureLevel" "String") "common") (("typographicCase" "String") "default")) "*")
  (:method-set "baselineShift" (("value" "Number")) "void"  :native t )
  (:method-set "trackingLeft" (("value" "Number")) "void"  :native t )
  (:method-get "baselineShift" () "Number"  :native t )
  (:method-get "dominantBaseline" () "String"  :native t )
  (:method-set "color" (("value" "uint")) "void"  :native t )
  (:method-get "alignmentBaseline" () "String"  :native t )
  (:method-set "dominantBaseline" (("dominantBaseline" "String")) "void"  :native t )
  (:method-get "textRotation" () "String"  :native t )
  (:method-get "kerning" () "String"  :native t )
  (:method-set "alignmentBaseline" (("alignmentBaseline" "String")) "void"  :native t )
  (:method-set "trackingRight" (("value" "Number")) "void"  :native t )
  (:method-get "breakOpportunity" () "String"  :native t )
  (:method-set "textRotation" (("value" "String")) "void"  :native t )
  (:method-set "kerning" (("value" "String")) "void"  :native t )
  (:method-get "digitWidth" () "String"  :native t )
  (:method-set "fontDescription" (("value" "flash.text.engine::FontDescription")) "void"  :native t )
  (:method-set "locked" (("value" "Boolean")) "void"  :native t )
  (:method "clone" () "flash.text.engine::ElementFormat"  )
  (:method-get "alpha" () "Number"  :native t )
  (:method-set "ligatureLevel" (("ligatureLevelType" "String")) "void"  :native t )
  (:method-set "fontSize" (("value" "Number")) "void"  :native t )
  (:method-get "locale" () "String"  :native t )
  (:method-get "locked" () "Boolean"  :native t )
  (:method-get "color" () "uint"  :native t )
  (:method-get "trackingRight" () "Number"  :native t )
  (:method-set "breakOpportunity" (("opportunityType" "String")) "void"  :native t )
  (:method-get "fontDescription" () "flash.text.engine::FontDescription"  :native t )
  (:method-set "typographicCase" (("typographicCaseType" "String")) "void"  :native t )
  (:method-get "fontSize" () "Number"  :native t )
  (:method-set "digitWidth" (("digitWidthType" "String")) "void"  :native t )
  (:method-set "locale" (("value" "String")) "void"  :native t )
  (:method-get "trackingLeft" () "Number"  :native t )
  (:method-get "ligatureLevel" () "String"  :native t )
  (:method-set "digitCase" (("digitCaseType" "String")) "void"  :native t )
  (:method-get "typographicCase" () "String"  :native t )
  (:method-set "alpha" (("value" "Number")) "void"  :native t )
  (:method-get "digitCase" () "String"  :native t )
  (:method "getFontMetrics" () "flash.text.engine::FontMetrics"  :native t )
))


(:class "flash.display::ShaderParameter" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:constructor "ShaderParameter" () "*")
  (:method-get "value" () "Array"  :native t )
  (:method-set "value" (("v" "Array")) "void"  :native t )
  (:method-get "type" () "String"  :native t )
  (:method-get "index" () "int"  :native t )
))


(:class "flash.display::ShaderJob" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "ShaderJob" (&optional ("shader" "flash.display::Shader") ("target" "Object") (("width" "int") 0) (("height" "int") 0)) "*")
  (:method "start" (&optional (("waitForCompletion" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method-get "shader" () "flash.display::Shader"  :native t )
  (:method-get "width" () "int"  :native t )
  (:method-get "height" () "int"  :native t )
  (:method-set "target" (("s" "Object")) "void"  :native t )
  (:method-set "shader" (("s" "flash.display::Shader")) "void"  :native t )
  (:method-set "width" (("v" "int")) "void"  :native t )
  (:method-get "progress" () "Number"  :native t )
  (:method-set "height" (("v" "int")) "void"  :native t )
  (:method-get "target" () "Object"  :native t )
  (:method "cancel" () "void"  :native t )
))


(:class "flash.display::ColorCorrection" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DEFAULT"    :type "String" :value "default" :static t )
  (:constant :name "ON"    :type "String" :value "on" :static t )
  (:constant :name "OFF"    :type "String" :value "off" :static t )
  (:constructor "ColorCorrection" () "*")
))


(:class "flash.text::TextFormatAlign" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "JUSTIFY"    :type "String" :value "justify" :static t )
  (:constant :name "CENTER"    :type "String" :value "center" :static t )
  (:constant :name "LEFT"    :type "String" :value "left" :static t )
  (:constant :name "RIGHT"    :type "String" :value "right" :static t )
  (:constructor "TextFormatAlign" () "*")
))


(:class "flash.utils::Dictionary" :extends "Object" :public t :dynamic t
 :properties (
  (:constructor "Dictionary" (&optional (("weakKeys" "Boolean") nil #|| false||# )) "*")
))


(:class "flash.net::SharedObject" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constant :name "kClear"  :namespace-type :private   :type "uint" :value 6 :static t )
  (:constant :name "kSetFps"  :namespace-type :private   :type "uint" :value 5 :static t )
  (:constant :name "kGetSize"  :namespace-type :private   :type "uint" :value 4 :static t )
  (:method-set "defaultObjectEncoding" (("version" "uint")) "void"  :native t :static t :final t )
  (:method "getDiskUsage" (("url" "String")) "int"  :native t :static t :final t )
  (:method-get "defaultObjectEncoding" () "uint"  :native t :static t :final t )
  (:constant :name "kClose"  :namespace-type :private   :type "uint" :value 3 :static t )
  (:method "getLocal" (("name" "String") &optional ("localPath" "String") (("secure" "Boolean") nil #|| false||# )) "flash.net::SharedObject"  :native t :static t :final t )
  (:method "deleteAll" (("url" "String")) "int"  :native t :static t :final t )
  (:constant :name "kFlush"  :namespace-type :private   :type "uint" :value 2 :static t )
  (:constant :name "kSend"  :namespace-type :private   :type "uint" :value 1 :static t )
  (:method "getRemote" (("name" "String") &optional ("remotePath" "String") (("persistence" "Object") nil #|| false||# ) (("secure" "Boolean") nil #|| false||# )) "flash.net::SharedObject"  :native t :static t :final t )
  (:constant :name "kConnect"  :namespace-type :private   :type "uint" :value 0 :static t )
  (:constructor "SharedObject" () "*")
  (:method-get "size" () "uint"  )
  (:method "flush" (&optional (("minDiskSpace" "int") 0)) "String"  )
  (:method "send" () "void"  )
  (:method-get "data" () "Object"  :native t )
  (:method-get "client" () "Object"  :native t )
  (:method "clear" () "void"  )
  (:method "setDirty" (("propertyName" "String")) "void"  :native t )
  (:method "connect" (("myConnection" "flash.net::NetConnection") &optional ("params" "String")) "void"  )
  (:method-set "fps" (("updatesPerSecond" "Number")) "void"  )
  (:method-set "objectEncoding" (("version" "uint")) "void"  :native t )
  (:method-set "client" (("object" "Object")) "void"  :native t )
  (:method "setProperty" (("propertyName" "String") &optional ("value" "Object")) "void"  )
  (:method "close" () "void"  )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method "invokeWithArgsArray" (("index" "uint") ("args" "Array")) "*" :namespace-type :private  :native t )
  (:method "invoke" (&rest ("index" "uint")) "*" :namespace-type :private  :native t )
))


(:class "flash.net::Socket" :extends "flash.events::EventDispatcher" :implements ("Socket.as$220::IDataOutput"  ) :public t 
 :properties (
  (:constant :name "MIN_TIMEOUT"  :namespace-type :private   :type "null" :value 250 :static t )
  (:constructor "Socket" (&optional ("host" "String") (("port" "int") 0)) "*")
  (:method "onTimeout" (("event" "flash.events::TimerEvent")) "void" :namespace-type :private  )
  (:method "writeUTFBytes" (("value" "String")) "void"  :native t )
  (:method "flush" () "void"  :native t )
  (:method "writeObject" ("object") "void"  :native t )
  (:method "writeByte" (("value" "int")) "void"  :native t )
  (:method-get "connected" () "Boolean"  :native t )
  (:method "readShort" () "int"  :native t )
  (:method "readUnsignedShort" () "uint"  :native t )
  (:method "readDouble" () "Number"  :native t )
  (:method "writeInt" (("value" "int")) "void"  :native t )
  (:variable :name "_timeoutEvent"  :namespace-type :private   :type "flash.events::SecurityErrorEvent" )
  (:method-get "endian" () "String"  :native t )
  (:method-set "objectEncoding" (("version" "uint")) "void"  :native t )
  (:method-get "bytesAvailable" () "uint"  :native t )
  (:method "didFailureOccur" () "Boolean" :namespace-type :private  :native t )
  (:variable :name "_timeout"  :namespace-type :private   :type "uint" )
  (:method "writeDouble" (("value" "Number")) "void"  :native t )
  (:method "readObject" () "*"  :native t )
  (:method "readUTF" () "String"  :native t )
  (:method-set "endian" (("type" "String")) "void"  :native t )
  (:method "internalGetSecurityErrorMessage" (("host" "String") ("port" "int")) "String" :namespace-type :private  :native t )
  (:method "readBoolean" () "Boolean"  :native t )
  (:method "readUTFBytes" (("length" "uint")) "String"  :native t )
  (:method "internalClose" () "void" :namespace-type :private  :native t )
  (:method "writeFloat" (("value" "Number")) "void"  :native t )
  (:method-set "timeout" (("value" "uint")) "void"  )
  (:variable :name "_timeoutTimer"  :namespace-type :private   :type "flash.utils::Timer" )
  (:method "readByte" () "int"  :native t )
  (:method "writeUTF" (("value" "String")) "void"  :native t )
  (:method "writeBoolean" (("value" "Boolean")) "void"  :native t )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method "readUnsignedInt" () "uint"  :native t )
  (:method "writeBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void"  :native t )
  (:method "writeMultiByte" (("value" "String") ("charSet" "String")) "void"  :native t )
  (:method "readUnsignedByte" () "uint"  :native t )
  (:method-get "timeout" () "uint"  )
  (:method "writeUnsignedInt" (("value" "uint")) "void"  :native t )
  (:method "writeShort" (("value" "int")) "void"  :native t )
  (:method "readFloat" () "Number"  :native t )
  (:method "connect" (("host" "String") ("port" "int")) "void"  )
  (:method "readMultiByte" (("length" "uint") ("charSet" "String")) "String"  :native t )
  (:method "internalConnect" (("host" "String") ("port" "int")) "void" :namespace-type :private  :native t )
  (:method "_init" () "void" :namespace-type :private  )
  (:method "readBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void"  :native t )
  (:method "close" () "void"  )
  (:method "readInt" () "int"  :native t )
))


(:class "flash.filters::ColorMatrixFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "ColorMatrixFilter" (&optional ("matrix" "Array")) "*")
  (:method-get "matrix" () "Array"  :native t )
  (:method-set "matrix" (("value" "Array")) "void"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
))


(:class "flash.filters::BitmapFilterType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "OUTER"    :type "String" :value "outer" :static t )
  (:constant :name "INNER"    :type "String" :value "inner" :static t )
  (:constant :name "FULL"    :type "String" :value "full" :static t )
  (:constructor "BitmapFilterType" () "*")
))


(:class "flash.text::TextColorType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DARK_COLOR"    :type "String" :value "dark" :static t )
  (:constant :name "LIGHT_COLOR"    :type "String" :value "light" :static t )
  (:constructor "TextColorType" () "*")
))


(:class "flash.filters::DisplacementMapFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "DisplacementMapFilter" (&optional ("mapBitmap" "flash.display::BitmapData") ("mapPoint" "flash.geom::Point") (("componentX" "uint") 0) (("componentY" "uint") 0) (("scaleX" "Number") 0) (("scaleY" "Number") 0) (("mode" "String") "wrap") (("color" "uint") 0) (("alpha" "Number") 0)) "*")
  (:method-get "componentY" () "uint"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-get "alpha" () "Number"  :native t )
  (:method-set "mode" (("value" "String")) "void"  :native t )
  (:method-set "mapPoint" (("value" "flash.geom::Point")) "void"  :native t )
  (:method-set "alpha" (("value" "Number")) "void"  :native t )
  (:method-get "mode" () "String"  :native t )
  (:method-get "mapBitmap" () "flash.display::BitmapData"  :native t )
  (:method-set "color" (("value" "uint")) "void"  :native t )
  (:method-get "scaleX" () "Number"  :native t )
  (:method-get "scaleY" () "Number"  :native t )
  (:method-get "color" () "uint"  :native t )
  (:method-get "mapPoint" () "flash.geom::Point"  :native t )
  (:method-set "componentX" (("value" "uint")) "void"  :native t )
  (:method-set "componentY" (("value" "uint")) "void"  :native t )
  (:method-get "componentX" () "uint"  :native t )
  (:method-set "scaleX" (("value" "Number")) "void"  :native t )
  (:method-set "mapBitmap" (("value" "flash.display::BitmapData")) "void"  :native t )
  (:method-set "scaleY" (("value" "Number")) "void"  :native t )
))


(:class "flash.display::GraphicsPathWinding" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "EVEN_ODD"    :type "String" :value "evenOdd" :static t )
  (:constant :name "NON_ZERO"    :type "String" :value "nonZero" :static t )
  (:constructor "GraphicsPathWinding" () "*")
))


(:interface "flash.net::IDynamicPropertyWriter" :public t 
 :properties (
  (:constructor "IDynamicPropertyWriter" () "*")
  (:method "writeDynamicProperties" (("obj" "Object") ("output" "flash.net::IDynamicPropertyOutput")) "void" :namespace-type :public  )
))


(:class "flash.external::ExternalInterface" :extends "Object" :public t :final t 
 :properties (
  (:method "_objectToJS" ("value") "String" :namespace-type :private  :static t :final t )
  (:method "_evalJS" (("expression" "String")) "String" :namespace-type :private  :native t :static t :final t )
  (:method "_argumentsToXML" (("obj" "Array")) "String" :namespace-type :private  :static t :final t )
  (:method "addCallback" (("functionName" "String") ("closure" "Function")) "void"  :static t :final t )
  (:method "_addCallback" (("functionName" "String") ("closure" "Function")) "void" :namespace-type :private  :native t :static t :final t )
  (:method-get "available" () "Boolean"  :native t :static t :final t )
  (:method "_toAS" (("obj" "Object")) "*" :namespace-type :private  :static t :final t )
  (:method "_getPropNames" (("obj" "Object")) "Array" :namespace-type :private  :native t :static t :final t )
  (:method "_callIn" (("closure" "Function") ("request" "String")) "String" :namespace-type :private  :static t :final t )
  (:method-get "activeX" () "Boolean" :namespace-type :private  :native t :static t :final t )
  (:method "_escapeXML" (("s" "String")) "String" :namespace-type :private  :static t :final t )
  (:method "_callOut" (("request" "String")) "String" :namespace-type :private  :native t :static t :final t )
  (:method-get "objectID" () "String"  :native t :static t :final t )
  (:method "_toXML" ("value") "String" :namespace-type :private  :static t :final t )
  (:method "_objectToXML" ("obj") "String" :namespace-type :private  :static t :final t )
  (:method "_toJS" ("value") "String" :namespace-type :private  :static t :final t )
  (:method "call" (&rest ("functionName" "String")) "*"  :static t :final t )
  (:method "_arrayToAS" (("obj" "Object")) "*" :namespace-type :private  :static t :final t )
  (:method "_arrayToXML" (("obj" "Array")) "String" :namespace-type :private  :static t :final t )
  (:method "_objectToAS" (("obj" "Object")) "*" :namespace-type :private  :static t :final t )
  (:variable :name "marshallExceptions"    :type "Boolean" :value nil #|| false||#  :static t )
  (:method "_argumentsToAS" ("obj") "Array" :namespace-type :private  :static t :final t )
  (:method "_initJS" () "void" :namespace-type :private  :native t :static t :final t )
  (:method "_arrayToJS" (("value" "Array")) "String" :namespace-type :private  :static t :final t )
  (:constructor "ExternalInterface" () "*")
))


(:class "flash.text::TextRun" :extends "Object" :public t 
 :properties (
  (:constructor "TextRun" (("beginIndex" "int") ("endIndex" "int") ("textFormat" "flash.text::TextFormat")) "*")
  (:variable :name "textFormat"    :type "flash.text::TextFormat" )
  (:variable :name "endIndex"    :type "int" )
  (:variable :name "beginIndex"    :type "int" )
))


(:class "flash.display::Shader" :extends "Object" :public t 
 :properties (
  (:constructor "Shader" (&optional ("code" "flash.utils::ByteArray")) "*")
  (:method-set "byteCode" (("code" "flash.utils::ByteArray")) "void"  )
  (:method-set "data" (("p" "flash.display::ShaderData")) "void"  :native t )
  (:method-get "precisionHint" () "String"  :native t )
  (:method-get "data" () "flash.display::ShaderData"  :native t )
  (:method-set "precisionHint" (("p" "String")) "void"  :native t )
))


(:class "flash.media::Video" :extends "flash.display::DisplayObject" :public t 
 :properties (
  (:constructor "Video" (&optional (("width" "int") 320) (("height" "int") 240)) "*")
  (:method-get "videoHeight" () "int"  :native t )
  (:method-get "smoothing" () "Boolean"  :native t )
  (:method-get "deblocking" () "int"  :native t )
  (:method-set "smoothing" (("value" "Boolean")) "void"  :native t )
  (:method "attachCamera" (("camera" "flash.media::Camera")) "void"  :native t )
  (:method-get "videoWidth" () "int"  :native t )
  (:method-set "deblocking" (("value" "int")) "void"  :native t )
  (:method "clear" () "void"  :native t )
  (:method "attachNetStream" (("netStream" "flash.net::NetStream")) "void"  :native t )
))


(:class "flash.text::TextFormatDisplay" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "INLINE"    :type "String" :value "inline" :static t )
  (:constant :name "BLOCK"    :type "String" :value "block" :static t )
  (:constructor "TextFormatDisplay" () "*")
))


(:class "flash.media::ID3Info" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:constructor "ID3Info" () "*")
  (:variable :name "songName"    :type "String" )
  (:variable :name "genre"    :type "String" )
  (:variable :name "artist"    :type "String" )
  (:variable :name "track"    :type "String" )
  (:variable :name "album"    :type "String" )
  (:variable :name "year"    :type "String" )
  (:variable :name "comment"    :type "String" )
))


(:class "flash.media::SoundTransform" :extends "Object" :public t :final t 
 :properties (
  (:constructor "SoundTransform" (&optional (("vol" "Number") 1) (("panning" "Number") 0)) "*")
  (:method-set "pan" (("panning" "Number")) "void"  )
  (:method-get "rightToRight" () "Number"  :native t )
  (:method-get "volume" () "Number"  :native t )
  (:method-get "leftToLeft" () "Number"  :native t )
  (:method-set "rightToRight" (("rightToRight" "Number")) "void"  :native t )
  (:method-set "leftToLeft" (("leftToLeft" "Number")) "void"  :native t )
  (:method-set "leftToRight" (("leftToRight" "Number")) "void"  :native t )
  (:method-get "leftToRight" () "Number"  :native t )
  (:method-set "volume" (("volume" "Number")) "void"  :native t )
  (:method-set "rightToLeft" (("rightToLeft" "Number")) "void"  :native t )
  (:method-get "pan" () "Number"  )
  (:method-get "rightToLeft" () "Number"  :native t )
))


(:class "flash.trace::Trace" :extends "Object" :public t 
 :properties (
  (:constant :name "METHODS_AND_LINES_WITH_ARGS"    :type "int" :value 4 :static t )
  (:constant :name "METHODS_AND_LINES"    :type "int" :value 3 :static t )
  (:method "getListener" () "Function"  :native t :static t :final t )
  (:method "getLevel" (&optional (("target" "int") 2)) "int"  :native t :static t :final t )
  (:constant :name "OFF"    :type "int" :value 0 :static t )
  (:constant :name "METHODS_WITH_ARGS"    :type "int" :value 2 :static t )
  (:method "setLevel" (("l" "int") &optional (("target" "int") 2)) "*"  :native t :static t :final t )
  (:constant :name "METHODS"    :type "int" :value 1 :static t )
  (:method "setListener" (("f" "Function")) "*"  :native t :static t :final t )
  (:constant :name "LISTENER"    :type "null" :value 2 :static t )
  (:constant :name "FILE"    :type "null" :value 1 :static t )
  (:constructor "Trace" () "*")
))


(:class "flash.text::TextSnapshot" :extends "Object" :public t 
 :properties (
  (:constructor "TextSnapshot" () "*")
  (:method "getSelected" (("beginIndex" "int") ("endIndex" "int")) "Boolean"  :native t )
  (:method "getText" (("beginIndex" "int") ("endIndex" "int") &optional (("includeLineEndings" "Boolean") nil #|| false||# )) "String"  :native t )
  (:method "setSelected" (("beginIndex" "int") ("endIndex" "int") ("select" "Boolean")) "void"  :native t )
  (:method "setSelectColor" (&optional (("hexColor" "uint") 16776960)) "void"  :native t )
  (:method "findText" (("beginIndex" "int") ("textToFind" "String") ("caseSensitive" "Boolean")) "int"  :native t )
  (:method-get "charCount" () "int"  :native t )
  (:method "hitTestTextNearPos" (("x" "Number") ("y" "Number") &optional (("maxDistance" "Number") 0)) "Number"  :native t )
  (:method "getTextRunInfo" (("beginIndex" "int") ("endIndex" "int")) "Array"  :native t )
  (:method "getSelectedText" (&optional (("includeLineEndings" "Boolean") nil #|| false||# )) "String"  :native t )
))


(:class "flash.display::InterpolationMethod" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LINEAR_RGB"    :type "String" :value "linearRGB" :static t )
  (:constant :name "RGB"    :type "String" :value "rgb" :static t )
  (:constructor "InterpolationMethod" () "*")
))


(:class "flash.ui::ContextMenuBuiltInItems" :extends "Object" :public t :final t 
 :properties (
  (:constructor "ContextMenuBuiltInItems" () "*")
  (:variable :name "loop"    :type "Boolean" :value t #|| true||#  )
  (:method "clone" () "flash.ui::ContextMenuBuiltInItems"  )
  (:variable :name "print"    :type "Boolean" :value t #|| true||#  )
  (:variable :name "zoom"    :type "Boolean" :value t #|| true||#  )
  (:variable :name "play"    :type "Boolean" :value t #|| true||#  )
  (:variable :name "forwardAndBack"    :type "Boolean" :value t #|| true||#  )
  (:variable :name "rewind"    :type "Boolean" :value t #|| true||#  )
  (:variable :name "save"    :type "Boolean" :value t #|| true||#  )
  (:variable :name "quality"    :type "Boolean" :value t #|| true||#  )
))


(:class "flash.text::TextExtent" :extends "Object" :public t 
 :properties (
  (:constructor "TextExtent" (("width" "Number") ("height" "Number") ("textFieldWidth" "Number") ("textFieldHeight" "Number") ("ascent" "Number") ("descent" "Number")) "*")
  (:variable :name "ascent"    :type "Number" )
  (:variable :name "width"    :type "Number" )
  (:variable :name "height"    :type "Number" )
  (:variable :name "textFieldWidth"    :type "Number" )
  (:variable :name "descent"    :type "Number" )
  (:variable :name "textFieldHeight"    :type "Number" )
))


(:class "flash.text.engine::CFFHinting" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constant :name "HORIZONTAL_STEM"    :type "String" :value "horizontalStem" :static t )
  (:constructor "CFFHinting" () "*")
))


(:class "flash.system::SecurityDomain" :extends "Object" :public t 
 :properties (
  (:method-get "currentDomain" () "flash.system::SecurityDomain"  :native t :static t :final t )
  (:constructor "SecurityDomain" () "*")
))


(:class "Date" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:method "UTC" ("year" &optional ("month" 1) ("date" 0) ("hours" 0) ("minutes" 0) ("seconds" 0) &rest "ms") "Number"  :native t :static t :final t )
  (:method "parse" ("s") "Number"  :native t :static t :final t )
  (:constant :name "length"    :type "int" :value 7 :static t )
  (:constructor "Date" (&optional "year" "month" "date" "hours" "minutes" "seconds" "ms") "*")
  (:method-get "month" () "Number"  )
  (:method-get "monthUTC" () "Number"  )
  (:method-set "month" (("value" "Number")) "*"  )
  (:method "getMilliseconds" () "Number" :namespace-type :public  :native t )
  (:method-set "minutesUTC" (("value" "Number")) "*"  )
  (:method-get "hours" () "Number"  )
  (:method "_setTime" (("value" "Number")) "Number" :namespace-type :private  :native t )
  (:method "getUTCMinutes" () "Number" :namespace-type :public  :native t )
  (:method-get "milliseconds" () "Number"  )
  (:method "setMilliseconds" (&optional "ms") "Number" :namespace-type :public  :native t )
  (:method-get "hoursUTC" () "Number"  )
  (:method-get "dateUTC" () "Number"  )
  (:method "_get" (("index" "int")) "Number" :namespace-type :private  :native t )
  (:method-get "fullYearUTC" () "Number"  )
  (:method "toTimeString" () "String" :namespace-type :public  )
  (:method "toUTCString" () "String" :namespace-type :public  )
  (:method "setUTCMilliseconds" (&optional "ms") "Number" :namespace-type :public  :native t )
  (:method-get "day" () "Number"  )
  (:method "setMinutes" (&optional "min" "sec" "ms") "Number" :namespace-type :public  :native t )
  (:method-set "hours" (("value" "Number")) "*"  )
  (:method "getUTCMilliseconds" () "Number" :namespace-type :public  :native t )
  (:method-set "time" (("value" "Number")) "*"  )
  (:method "getDate" () "Number" :namespace-type :public  :native t )
  (:method-get "secondsUTC" () "Number"  )
  (:method "toLocaleString" () "String" :namespace-type :public  )
  (:method "valueOf" () "Number" :namespace-type :public  :native t )
  (:method "getMinutes" () "Number" :namespace-type :public  :native t )
  (:method-set "monthUTC" (("value" "Number")) "*"  )
  (:method-set "milliseconds" (("value" "Number")) "*"  )
  (:method "setUTCMinutes" (&optional "min" "sec" "ms") "Number" :namespace-type :public  :native t )
  (:method-get "date" () "Number"  )
  (:method "setDate" (&optional "date") "Number" :namespace-type :public  :native t )
  (:method "getUTCSeconds" () "Number" :namespace-type :public  :native t )
  (:method "getUTCMonth" () "Number" :namespace-type :public  :native t )
  (:method-set "dateUTC" (("value" "Number")) "*"  )
  (:method "setUTCDate" (&optional "date") "Number" :namespace-type :public  :native t )
  (:method-set "hoursUTC" (("value" "Number")) "*"  )
  (:method "toDateString" () "String" :namespace-type :public  )
  (:method "getUTCDate" () "Number" :namespace-type :public  :native t )
  (:method "setUTCSeconds" (&optional "sec" "ms") "Number" :namespace-type :public  :native t )
  (:method "setUTCMonth" (&optional "month" "date") "Number" :namespace-type :public  :native t )
  (:method-set "fullYearUTC" (("value" "Number")) "*"  )
  (:method "getUTCHours" () "Number" :namespace-type :public  :native t )
  (:method "getTime" () "Number" :namespace-type :public  :native t )
  (:method "setSeconds" (&optional "sec" "ms") "Number" :namespace-type :public  :native t )
  (:method "setMonth" (&optional "month" "date") "Number" :namespace-type :public  :native t )
  (:method "getSeconds" () "Number" :namespace-type :public  :native t )
  (:method "getMonth" () "Number" :namespace-type :public  :native t )
  (:method "_toString" (("index" "int")) "String" :namespace-type :private  :native t )
  (:method-get "minutesUTC" () "Number"  )
  (:method "setHours" (&optional "hour" "min" "sec" "ms") "Number" :namespace-type :public  :native t )
  (:method "getUTCDay" () "Number" :namespace-type :public  :native t )
  (:method "setTime" (&optional "t") "Number" :namespace-type :public  )
  (:method-set "secondsUTC" (("value" "Number")) "*"  )
  (:method "toLocaleTimeString" () "String" :namespace-type :public  )
  (:method "setUTCHours" (&optional "hour" "min" "sec" "ms") "Number" :namespace-type :public  :native t )
  (:method-set "minutes" (("value" "Number")) "*"  )
  (:method-set "fullYear" (("value" "Number")) "*"  )
  (:method "getHours" () "Number" :namespace-type :public  :native t )
  (:method-set "date" (("value" "Number")) "*"  )
  (:method-get "minutes" () "Number"  )
  (:method "getTimezoneOffset" () "Number" :namespace-type :public  :native t )
  (:method-set "millisecondsUTC" (("value" "Number")) "*"  )
  (:method-get "time" () "Number"  )
  (:method "getDay" () "Number" :namespace-type :public  :native t )
  (:method-get "dayUTC" () "Number"  )
  (:method "getFullYear" () "Number" :namespace-type :public  :native t )
  (:method-get "millisecondsUTC" () "Number"  )
  (:method "toString" () "String" :namespace-type :public  )
  (:method "setFullYear" (&optional "year" "month" "date") "Number" :namespace-type :public  :native t )
  (:method-get "fullYear" () "Number"  )
  (:method "toLocaleDateString" () "String" :namespace-type :public  )
  (:method "setUTCFullYear" (&optional "year" "month" "date") "Number" :namespace-type :public  :native t )
  (:method "getUTCFullYear" () "Number" :namespace-type :public  :native t )
  (:method-get "timezoneOffset" () "Number"  )
  (:method-set "seconds" (("value" "Number")) "*"  )
  (:method-get "seconds" () "Number"  )
))


(:class "flash.net::DynamicPropertyOutput" :extends "Object" :implements ("IDynamicPropertyOutput") :public t 
 :properties (
  (:constructor "DynamicPropertyOutput" () "*")
  (:method "writeDynamicProperty" (("name" "String") "value") "void"  :native t )
))


(:class "flash.filters::BlurFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "BlurFilter" (&optional (("blurX" "Number") 4) (("blurY" "Number") 4) (("quality" "int") 1)) "*")
  (:method-get "blurX" () "Number"  :native t )
  (:method-set "blurX" (("value" "Number")) "void"  :native t )
  (:method-set "blurY" (("value" "Number")) "void"  :native t )
  (:method-get "blurY" () "Number"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-set "quality" (("value" "int")) "void"  :native t )
  (:method-get "quality" () "int"  :native t )
))


(:class "flash.display::GraphicsBitmapFill" :extends "Object" :implements ("GraphicsBitmapFill.as$192::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsBitmapFill" (&optional ("bitmapData" "flash.display::BitmapData") ("matrix" "flash.geom::Matrix") (("repeat" "Boolean") t #|| true||# ) (("smooth" "Boolean") nil #|| false||# )) "*")
  (:variable :name "matrix"    :type "flash.geom::Matrix" )
  (:variable :name "bitmapData"    :type "flash.display::BitmapData" )
  (:variable :name "repeat"    :type "Boolean" )
  (:variable :name "smooth"    :type "Boolean" )
))


(:class "flash.events::StatusEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "STATUS"    :type "String" :value "status" :static t )
  (:constructor "StatusEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("code" "String") "") (("level" "String") "")) "*")
  (:variable :name "m_level"  :namespace-type :private   :type "String" )
  (:method-get "code" () "String"  )
  (:method-set "level" (("value" "String")) "void"  )
  (:method-set "code" (("value" "String")) "void"  )
  (:method-get "level" () "String"  )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:variable :name "m_code"  :namespace-type :private   :type "String" )
))


(:class "flash.geom::Orientation3D" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "AXIS_ANGLE"    :type "String" :value "axisAngle" :static t )
  (:constant :name "EULER_ANGLES"    :type "String" :value "eulerAngles" :static t )
  (:constant :name "QUATERNION"    :type "String" :value "quaternion" :static t )
  (:constructor "Orientation3D" () "*")
))


(:class "flash.geom::ColorTransform" :extends "Object" :public t 
 :properties (
  (:constructor "ColorTransform" (&optional (("redMultiplier" "Number") 1) (("greenMultiplier" "Number") 1) (("blueMultiplier" "Number") 1) (("alphaMultiplier" "Number") 1) (("redOffset" "Number") 0) (("greenOffset" "Number") 0) (("blueOffset" "Number") 0) (("alphaOffset" "Number") 0)) "*")
  (:method-get "color" () "uint"  )
  (:variable :name "redOffset"    :type "Number" )
  (:method-set "color" (("newColor" "uint")) "void"  )
  (:variable :name "greenMultiplier"    :type "Number" )
  (:variable :name "blueOffset"    :type "Number" )
  (:method "toString" () "String"  )
  (:variable :name "alphaOffset"    :type "Number" )
  (:variable :name "redMultiplier"    :type "Number" )
  (:method "concat" (("second" "flash.geom::ColorTransform")) "void"  )
  (:variable :name "blueMultiplier"    :type "Number" )
  (:variable :name "greenOffset"    :type "Number" )
  (:variable :name "alphaMultiplier"    :type "Number" )
))


(:class "flash.text::StaticText" :extends "flash.display::DisplayObject" :public t :final t 
 :properties (
  (:constructor "StaticText" () "*")
  (:method-get "text" () "String"  :native t )
))


(:class "adobe.utils::CustomActions" :extends "Object" :public t :final t 
 :properties (
  (:method "installActions" (("name" "String") ("data" "String")) "void"  :native t :static t :final t )
  (:method "uninstallActions" (("name" "String")) "void"  :native t :static t :final t )
  (:method-get "actionsList" () "Array"  :native t :static t :final t )
  (:method "getActions" (("name" "String")) "String"  :native t :static t :final t )
  (:constructor "CustomActions" () "*")
))


(:class "flash.net::URLStream" :extends "flash.events::EventDispatcher" :implements ("IDataInput") :public t 
 :properties (
  (:constructor "URLStream" () "*")
  (:method "readUnsignedInt" () "uint"  :native t )
  (:method "readDouble" () "Number"  :native t )
  (:method "readFloat" () "Number"  :native t )
  (:method "readBoolean" () "Boolean"  :native t )
  (:method "readShort" () "int"  :native t )
  (:method-get "connected" () "Boolean"  :native t )
  (:method "readUnsignedShort" () "uint"  :native t )
  (:method "readUnsignedByte" () "uint"  :native t )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method "readObject" () "*"  :native t )
  (:method-get "endian" () "String"  :native t )
  (:method-get "bytesAvailable" () "uint"  :native t )
  (:method-set "objectEncoding" (("version" "uint")) "void"  :native t )
  (:method "load" (("request" "flash.net::URLRequest")) "void"  :native t )
  (:method "readMultiByte" (("length" "uint") ("charSet" "String")) "String"  :native t )
  (:method "readUTF" () "String"  :native t )
  (:method-set "endian" (("type" "String")) "void"  :native t )
  (:method "readInt" () "int"  :native t )
  (:method "readUTFBytes" (("length" "uint")) "String"  :native t )
  (:method "readBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void"  :native t )
  (:method "readByte" () "int"  :native t )
  (:method "close" () "void"  :native t )
))


(:class "flash.events::SecurityErrorEvent" :extends "flash.events::ErrorEvent" :public t 
 :properties (
  (:constant :name "SECURITY_ERROR"    :type "String" :value "securityError" :static t )
  (:constructor "SecurityErrorEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("text" "String") "")) "*")
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:class "flash.text.engine::LigatureLevel" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "UNCOMMON"    :type "String" :value "uncommon" :static t )
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constant :name "EXOTIC"    :type "String" :value "exotic" :static t )
  (:constant :name "COMMON"    :type "String" :value "common" :static t )
  (:constant :name "MINIMUM"    :type "String" :value "minimum" :static t )
  (:constructor "LigatureLevel" () "*")
))


(:class "flash.display::MorphShape" :extends "flash.display::DisplayObject" :public t :final t 
 :properties (
  (:constructor "MorphShape" () "*")
))


(:class "flash.text::AntiAliasType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ADVANCED"    :type "String" :value "advanced" :static t )
  (:constant :name "NORMAL"    :type "String" :value "normal" :static t )
  (:constructor "AntiAliasType" () "*")
))


(:class "flash.media::Microphone" :extends "flash.events::EventDispatcher" :public t :final t 
 :properties (
  (:method "getMicrophone" (&optional (("index" "int") -1)) "flash.media::Microphone"  :native t :static t :final t )
  (:method-get "names" () "Array"  :native t :static t :final t )
  (:constructor "Microphone" () "*")
  (:method-set "rate" (("rate" "int")) "void"  :native t )
  (:method-set "soundTransform" (("sndTransform" "flash.media::SoundTransform")) "void"  :native t )
  (:method-get "silenceLevel" () "Number"  :native t )
  (:method "setSilenceLevel" (("silenceLevel" "Number") &optional (("timeout" "int") -1)) "void"  :native t )
  (:method-get "gain" () "Number"  :native t )
  (:method-get "rate" () "int"  :native t )
  (:method "setUseEchoSuppression" (("useEchoSuppression" "Boolean")) "void"  :native t )
  (:method-get "muted" () "Boolean"  :native t )
  (:method-set "codec" (("codec" "String")) "void"  :native t )
  (:method-set "gain" (("gain" "Number")) "void"  :native t )
  (:method-get "useEchoSuppression" () "Boolean"  :native t )
  (:method-get "silenceTimeout" () "int"  :native t )
  (:method-get "encodeQuality" () "int"  :native t )
  (:method-set "encodeQuality" (("quality" "int")) "void"  :native t )
  (:method "setLoopBack" (&optional (("state" "Boolean") t #|| true||# )) "void"  :native t )
  (:method-get "activityLevel" () "Number"  :native t )
  (:method-get "codec" () "String"  :native t )
  (:method-get "index" () "int"  :native t )
  (:method-get "name" () "String"  :native t )
  (:method-get "soundTransform" () "flash.media::SoundTransform"  :native t )
  (:method-set "framesPerPacket" (("frames" "int")) "void"  :native t )
  (:method-get "framesPerPacket" () "int"  :native t )
))


(:class "flash.net::URLLoaderDataFormat" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "BINARY"    :type "String" :value "binary" :static t )
  (:constant :name "VARIABLES"    :type "String" :value "variables" :static t )
  (:constant :name "TEXT"    :type "String" :value "text" :static t )
  (:constructor "URLLoaderDataFormat" () "*")
))


(:class "flash.media::SoundChannel" :extends "flash.events::EventDispatcher" :public t :final t 
 :properties (
  (:constructor "SoundChannel" () "*")
  (:method "stop" () "void"  :native t )
  (:method-get "leftPeak" () "Number"  :native t )
  (:method-get "position" () "Number"  :native t )
  (:method-set "soundTransform" (("sndTransform" "flash.media::SoundTransform")) "void"  :native t )
  (:method-get "rightPeak" () "Number"  :native t )
  (:method-get "soundTransform" () "flash.media::SoundTransform"  :native t )
))


(:class "flash.events::ProgressEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "PROGRESS"    :type "String" :value "progress" :static t )
  (:constant :name "SOCKET_DATA"    :type "String" :value "socketData" :static t )
  (:constructor "ProgressEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("bytesLoaded" "uint") 0) (("bytesTotal" "uint") 0)) "*")
  (:method-get "bytesLoaded" () "uint"  )
  (:method-set "bytesTotal" (("value" "uint")) "void"  )
  (:method "toString" () "String"  :override t )
  (:method-set "bytesLoaded" (("value" "uint")) "void"  )
  (:method-get "bytesTotal" () "uint"  )
  (:variable :name "m_bytesTotal"  :namespace-type :private   :type "uint" )
  (:method "clone" () "flash.events::Event"  :override t )
  (:variable :name "m_bytesLoaded"  :namespace-type :private   :type "uint" )
))


(:class "flash.events::ContextMenuEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "MENU_ITEM_SELECT"    :type "String" :value "menuItemSelect" :static t )
  (:constant :name "MENU_SELECT"    :type "String" :value "menuSelect" :static t )
  (:constructor "ContextMenuEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) ("mouseTarget" "flash.display::InteractiveObject") ("contextMenuOwner" "flash.display::InteractiveObject")) "*")
  (:variable :name "m_mouseTarget"  :namespace-type :private   :type "flash.display::InteractiveObject" )
  (:method-get "contextMenuOwner" () "flash.display::InteractiveObject"  )
  (:method-set "isMouseTargetInaccessible" (("value" "Boolean")) "void"  )
  (:method-get "isMouseTargetInaccessible" () "Boolean"  )
  (:method-set "mouseTarget" (("value" "flash.display::InteractiveObject")) "void"  )
  (:method-set "contextMenuOwner" (("value" "flash.display::InteractiveObject")) "void"  )
  (:variable :name "m_isMouseTargetInaccessible"  :namespace-type :private   :type "Boolean" )
  (:method-get "mouseTarget" () "flash.display::InteractiveObject"  )
  (:variable :name "m_contextMenuOwner"  :namespace-type :private   :type "flash.display::InteractiveObject" )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:class "flash.text::TextField" :extends "flash.display::InteractiveObject" :public t 
 :properties (
  (:variable :name "richTextFields"  :namespace-type :private   :type "Array" :static t )
  (:method "isFontCompatible" (("fontName" "String") ("fontStyle" "String")) "Boolean"  :native t :static t :final t )
  (:constructor "TextField" () "*")
  (:method-set "alwaysShowSelection" (("value" "Boolean")) "void"  :native t )
  (:method "replaceText" (("beginIndex" "int") ("endIndex" "int") ("newText" "String")) "void"  :native t )
  (:method-set "sharpness" (("value" "Number")) "void"  :native t )
  (:method-get "wordWrap" () "Boolean"  :native t )
  (:method "setTextFormat" (("format" "flash.text::TextFormat") &optional (("beginIndex" "int") -1) (("endIndex" "int") -1)) "void"  :native t )
  (:method "getLineLength" (("lineIndex" "int")) "int"  :native t )
  (:method "pasteRichText" (("richText" "String")) "Boolean" :namespace-type :internal  )
  (:method-set "gridFitType" (("gridFitType" "String")) "void"  :native t )
  (:method "getTextRuns" (&optional (("beginIndex" "int") 0) (("endIndex" "int") 2147483647)) "Array"  :native t )
  (:method-get "caretIndex" () "int"  :native t )
  (:method-set "wordWrap" (("value" "Boolean")) "void"  :native t )
  (:method-get "borderColor" () "uint"  :native t )
  (:method-set "condenseWhite" (("value" "Boolean")) "void"  :native t )
  (:method-get "numLines" () "int"  :native t )
  (:method-get "scrollH" () "int"  :native t )
  (:method "getLineOffset" (("lineIndex" "int")) "int"  :native t )
  (:method-get "maxScrollH" () "int"  :native t )
  (:method-set "autoSize" (("value" "String")) "void"  :native t )
  (:method-get "defaultTextFormat" () "flash.text::TextFormat"  :native t )
  (:method "getImageReference" (("id" "String")) "flash.display::DisplayObject"  :native t )
  (:method-get "textWidth" () "Number"  :native t )
  (:method-get "scrollV" () "int"  :native t )
  (:method-set "backgroundColor" (("value" "uint")) "void"  :native t )
  (:method-get "embedFonts" () "Boolean"  :native t )
  (:method-get "border" () "Boolean"  :native t )
  (:method-get "multiline" () "Boolean"  :native t )
  (:method-get "background" () "Boolean"  :native t )
  (:method-set "maxChars" (("value" "int")) "void"  :native t )
  (:method-set "selectable" (("value" "Boolean")) "void"  :native t )
  (:method-get "maxScrollV" () "int"  :native t )
  (:method-set "borderColor" (("value" "uint")) "void"  :native t )
  (:method-set "displayAsPassword" (("value" "Boolean")) "void"  :native t )
  (:method "getLineText" (("lineIndex" "int")) "String"  :native t )
  (:method "getFirstCharInParagraph" (("charIndex" "int")) "int"  :native t )
  (:method-get "mouseWheelEnabled" () "Boolean"  :native t )
  (:method-get "textHeight" () "Number"  :native t )
  (:method-get "restrict" () "String"  :native t )
  (:method-set "scrollH" (("value" "int")) "void"  :native t )
  (:method "copyRichText" () "String" :namespace-type :internal  )
  (:method "getRawText" () "String"  :native t )
  (:method-get "alwaysShowSelection" () "Boolean"  :native t )
  (:method-get "sharpness" () "Number"  :native t )
  (:method "getCharBoundaries" (("charIndex" "int")) "flash.geom::Rectangle"  :native t )
  (:method-get "gridFitType" () "String"  :native t )
  (:method-get "styleSheet" () "flash.text::StyleSheet"  :native t )
  (:method-get "useRichTextClipboard" () "Boolean"  :native t )
  (:method-get "type" () "String"  :native t )
  (:method-set "defaultTextFormat" (("format" "flash.text::TextFormat")) "void"  :native t )
  (:method "replaceSelectedText" (("value" "String")) "void"  :native t )
  (:method-get "condenseWhite" () "Boolean"  :native t )
  (:method "getParagraphLength" (("charIndex" "int")) "int"  :native t )
  (:method-get "textColor" () "uint"  :native t )
  (:method-get "displayAsPassword" () "Boolean"  :native t )
  (:method-get "autoSize" () "String"  :native t )
  (:method "setSelection" (("beginIndex" "int") ("endIndex" "int")) "void"  :native t )
  (:method-set "scrollV" (("value" "int")) "void"  :native t )
  (:method-set "useRichTextClipboard" (("value" "Boolean")) "void"  :native t )
  (:method-get "backgroundColor" () "uint"  :native t )
  (:method-get "selectable" () "Boolean"  :native t )
  (:method-set "antiAliasType" (("antiAliasType" "String")) "void"  :native t )
  (:method-set "border" (("value" "Boolean")) "void"  :native t )
  (:method-get "maxChars" () "int"  :native t )
  (:method-set "multiline" (("value" "Boolean")) "void"  :native t )
  (:method "getXMLText" (&optional (("beginIndex" "int") 0) (("endIndex" "int") 2147483647)) "String"  )
  (:method-set "background" (("value" "Boolean")) "void"  :native t )
  (:method-set "embedFonts" (("value" "Boolean")) "void"  :native t )
  (:method "getCharIndexAtPoint" (("x" "Number") ("y" "Number")) "int"  :native t )
  (:method-set "text" (("value" "String")) "void"  :native t )
  (:method-get "selectionEndIndex" () "int"  :native t )
  (:method-get "selectionBeginIndex" () "int"  :native t )
  (:method-set "mouseWheelEnabled" (("value" "Boolean")) "void"  :native t )
  (:method-get "length" () "int"  :native t )
  (:method "appendText" (("newText" "String")) "void"  )
  (:method-get "antiAliasType" () "String"  :native t )
  (:method-set "styleSheet" (("value" "flash.text::StyleSheet")) "void"  :native t )
  (:method-set "textColor" (("value" "uint")) "void"  :native t )
  (:method-get "selectedText" () "String"  )
  (:method-set "htmlText" (("value" "String")) "void"  :native t )
  (:method "insertXMLText" (("beginIndex" "int") ("endIndex" "int") ("richText" "String") &optional (("pasting" "Boolean") nil #|| false||# )) "void"  )
  (:method-get "text" () "String"  :native t )
  (:method-get "thickness" () "Number"  :native t )
  (:method "getLineIndexAtPoint" (("x" "Number") ("y" "Number")) "int"  :native t )
  (:method-set "thickness" (("value" "Number")) "void"  :native t )
  (:method-get "htmlText" () "String"  :native t )
  (:method "getLineMetrics" (("lineIndex" "int")) "flash.text::TextLineMetrics"  :native t )
  (:method "getTextFormat" (&optional (("beginIndex" "int") -1) (("endIndex" "int") -1)) "flash.text::TextFormat"  :native t )
  (:method-set "type" (("value" "String")) "void"  :native t )
  (:method "getLineIndexOfChar" (("charIndex" "int")) "int"  :native t )
  (:method-get "bottomScrollV" () "int"  :native t )
  (:method-set "restrict" (("value" "String")) "void"  :native t )
))


(:class "flash.xml::XMLParser" :extends "Object" :public t :final t 
 :properties (
  (:constructor "XMLParser" () "*")
  (:method "getNext" (("tag" "internal::flash.xml::XMLTag")) "int"  :native t )
  (:method "startParse" (("source" "String") ("ignoreWhite" "Boolean")) "void"  :native t )
))


(:class "adobe.utils::XMLUI" :extends "Object" :public t :final t 
 :properties (
  (:method "accept" () "void"  :native t :static t :final t )
  (:method "cancel" () "void"  :native t :static t :final t )
  (:method "getProperty" (("name" "String")) "String"  :native t :static t :final t )
  (:method "setProperty" (("name" "String") ("value" "String")) "void"  :native t :static t :final t )
  (:constructor "XMLUI" () "*")
))


(:class "flash.ui::Mouse" :extends "Object" :public t :final t 
 :properties (
  (:method "hide" () "void"  :native t :static t :final t )
  (:method-set "cursor" (("value" "String")) "void"  :native t :static t :final t )
  (:method "show" () "void"  :native t :static t :final t )
  (:method-get "cursor" () "String"  :native t :static t :final t )
  (:constructor "Mouse" () "*")
))


(:class "flash.events::ActivityEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "ACTIVITY"    :type "String" :value "activity" :static t )
  (:constructor "ActivityEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("activating" "Boolean") nil #|| false||# )) "*")
  (:method-get "activating" () "Boolean"  )
  (:variable :name "m_activating"  :namespace-type :private   :type "Boolean" )
  (:method-set "activating" (("value" "Boolean")) "void"  )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


  (:method "MMEndCommand" (("endStatus" "Boolean") ("notifyString" "String")) "void"  :native t :uri "adobe.utils" )
  (:method "MMExecute" (("name" "String")) "String"  :native t :uri "adobe.utils" )

(:class "flash.system::IME" :extends "flash.events::EventDispatcher" :public t :final t 
 :properties (
  (:method "setCompositionString" (("composition" "String")) "void"  :native t :static t :final t )
  (:method-get "enabled" () "Boolean"  :native t :static t :final t )
  (:method-set "conversionMode" (("mode" "String")) "void"  :native t :static t :final t )
  (:method-set "constructOK" (("construct" "Boolean")) "void"  :native t :static t :final t )
  (:method "doConversion" () "void"  :native t :static t :final t )
  (:method-get "conversionMode" () "String"  :native t :static t :final t )
  (:method-set "enabled" (("enabled" "Boolean")) "void"  :native t :static t :final t )
  (:constructor "IME" () "*")
))


(:class "flash.net::ObjectEncoding" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DEFAULT"    :type "uint" :value 3 :static t )
  (:constant :name "AMF0"    :type "uint" :value 0 :static t )
  (:method-get "dynamicPropertyWriter" () "flash.net::IDynamicPropertyWriter"  :native t :static t :final t )
  (:constant :name "AMF3"    :type "uint" :value 3 :static t )
  (:method-set "dynamicPropertyWriter" (("object" "flash.net::IDynamicPropertyWriter")) "void"  :native t :static t :final t )
  (:constructor "ObjectEncoding" () "*")
))


(:class "flash.text.engine::RenderingMode" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "CFF"    :type "String" :value "cff" :static t )
  (:constant :name "NORMAL"    :type "String" :value "normal" :static t )
  (:constructor "RenderingMode" () "*")
))


(:class "flash.printing::PrintJobOptions" :extends "Object" :public t 
 :properties (
  (:constructor "PrintJobOptions" (&optional (("printAsBitmap" "Boolean") nil #|| false||# )) "*")
  (:variable :name "printAsBitmap"    :type "Boolean" :value nil #|| false||#  )
))


(:class "flash.ui::MouseCursor" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "BUTTON"    :type "String" :value "button" :static t )
  (:constant :name "HAND"    :type "String" :value "hand" :static t )
  (:constant :name "IBEAM"    :type "String" :value "ibeam" :static t )
  (:constant :name "ARROW"    :type "String" :value "arrow" :static t )
  (:constant :name "AUTO"    :type "String" :value "auto" :static t )
  (:constructor "MouseCursor" () "*")
))


(:class "flash.text.engine::TextLineCreationResult" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "EMERGENCY"    :type "String" :value "emergency" :static t )
  (:constant :name "SUCCESS"    :type "String" :value "success" :static t )
  (:constant :name "COMPLETE"    :type "String" :value "complete" :static t )
  (:constant :name "INSUFFICIENT_WIDTH"    :type "String" :value "insufficientWidth" :static t )
  (:constructor "TextLineCreationResult" () "*")
))


(:class "flash.events::DataEvent" :extends "flash.events::TextEvent" :public t 
 :properties (
  (:constant :name "DATA"    :type "String" :value "data" :static t )
  (:constant :name "UPLOAD_COMPLETE_DATA"    :type "String" :value "uploadCompleteData" :static t )
  (:constructor "DataEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("data" "String") "")) "*")
  (:method-get "data" () "String"  )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:method-set "data" (("value" "String")) "void"  )
))


(:class "flash.display::StageQuality" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "BEST"    :type "String" :value "best" :static t )
  (:constant :name "LOW"    :type "String" :value "low" :static t )
  (:constant :name "MEDIUM"    :type "String" :value "medium" :static t )
  (:constant :name "HIGH"    :type "String" :value "high" :static t )
  (:constructor "StageQuality" () "*")
))


(:class "flash.net::XMLSocket" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "XMLSocket" (&optional ("host" "String") (("port" "int") 0)) "void")
  (:method-get "timeout" () "int"  )
  (:method-set "timeout" (("value" "int")) "void"  )
  (:variable :name "_rcvBuffer"  :namespace-type :private   :type "flash.utils::ByteArray" )
  (:method "send" ("object") "void"  )
  (:method-get "connected" () "Boolean"  )
  (:method "connect" (("host" "String") ("port" "int")) "void"  )
  (:variable :name "_internalSocket"  :namespace-type :private   :type "flash.net::Socket" )
  (:method "scanAndSendEvent" (("e" "flash.events::ProgressEvent")) "void" :namespace-type :private  )
  (:variable :name "_bytesInPacket"  :namespace-type :private   :type "uint" )
  (:method "reflectEvent" (("e" "flash.events::Event")) "void" :namespace-type :private  )
  (:method "close" () "void"  )
))


(:class "flash.text.engine::TextBlock" :extends "Object" :public t :final t 
 :properties (
  (:constructor "TextBlock" (&optional ("content" "flash.text.engine::ContentElement") ("tabStops" "__AS3__.vec::Vector.<flash.text.engine::TabStop>") ("textJustifier" "flash.text.engine::TextJustifier") (("lineRotation" "String") "rotate0") (("baselineZero" "String") "roman") (("bidiLevel" "int") 0) (("applyNonLinearFontScaling" "Boolean") t #|| true||# ) ("baselineFontDescription" "flash.text.engine::FontDescription") (("baselineFontSize" "Number") 12)) "*")
  (:method-get "textJustifier" () "flash.text.engine::TextJustifier"  )
  (:method "getTextLineAtCharIndex" (("charIndex" "int")) "flash.text.engine::TextLine"  :native t )
  (:method-get "firstLine" () "flash.text.engine::TextLine"  :native t )
  (:method-set "textJustifier" (("value" "flash.text.engine::TextJustifier")) "void"  )
  (:method-get "content" () "flash.text.engine::ContentElement"  :native t )
  (:method "getTextJustifier" () "flash.text.engine::TextJustifier" :namespace-type :private  :native t )
  (:method "findPreviousAtomBoundary" (("beforeCharIndex" "int")) "int"  :native t )
  (:method-get "baselineZero" () "String"  :native t )
  (:method "findNextAtomBoundary" (("afterCharIndex" "int")) "int"  :native t )
  (:method "findNextWordBoundary" (("afterCharIndex" "int")) "int"  :native t )
  (:method-set "baselineFontDescription" (("value" "flash.text.engine::FontDescription")) "void"  :native t )
  (:method-get "lineRotation" () "String"  :native t )
  (:method "findPreviousWordBoundary" (("beforeCharIndex" "int")) "int"  :native t )
  (:method-get "applyNonLinearFontScaling" () "Boolean"  :native t )
  (:variable :name "userData"    :type "null" )
  (:method-get "bidiLevel" () "int"  :native t )
  (:method "getTabStops" () "__AS3__.vec::Vector.<flash.text.engine::TabStop>" :namespace-type :private  :native t )
  (:method-set "baselineZero" (("value" "String")) "void"  :native t )
  (:method-get "baselineFontSize" () "Number"  :native t )
  (:method "createTextLine" (&optional ("previousLine" "flash.text.engine::TextLine") (("width" "Number") 1000000) (("lineOffset" "Number") 0) (("fitSomething" "Boolean") nil #|| false||# )) "flash.text.engine::TextLine"  )
  (:method "setTabStops" (("value" "__AS3__.vec::Vector.<flash.text.engine::TabStop>")) "void" :namespace-type :private  :native t )
  (:method-get "tabStops" () "__AS3__.vec::Vector.<flash.text.engine::TabStop>"  )
  (:method-set "lineRotation" (("value" "String")) "void"  :native t )
  (:method-set "applyNonLinearFontScaling" (("value" "Boolean")) "void"  :native t )
  (:method-get "lastLine" () "flash.text.engine::TextLine"  :native t )
  (:method-get "baselineFontDescription" () "flash.text.engine::FontDescription"  :native t )
  (:method-set "bidiLevel" (("value" "int")) "void"  :native t )
  (:method-set "baselineFontSize" (("value" "Number")) "void"  :native t )
  (:method-set "content" (("value" "flash.text.engine::ContentElement")) "void"  :native t )
  (:method "dump" () "String"  :native t )
  (:method "DoCreateTextLine" (("previousLine" "flash.text.engine::TextLine") ("width" "Number") &optional (("lineOffset" "Number") 0) (("fitSomething" "Boolean") nil #|| false||# )) "flash.text.engine::TextLine" :namespace-type :private  :native t )
  (:method-set "tabStops" (("value" "__AS3__.vec::Vector.<flash.text.engine::TabStop>")) "void"  )
  (:method-get "firstInvalidLine" () "flash.text.engine::TextLine"  :native t )
  (:method-get "textLineCreationResult" () "String"  :native t )
  (:method "setTextJustifier" (("value" "flash.text.engine::TextJustifier")) "void" :namespace-type :private  :native t )
  (:method "releaseLines" (("firstLine" "flash.text.engine::TextLine") ("lastLine" "flash.text.engine::TextLine")) "void"  :native t )
))


(:class "flash.accessibility::AccessibilityProperties" :extends "Object" :public t 
 :properties (
  (:constructor "AccessibilityProperties" () "*")
  (:variable :name "shortcut"    :type "String" )
  (:variable :name "name"    :type "String" )
  (:variable :name "silent"    :type "Boolean" )
  (:variable :name "description"    :type "String" )
  (:variable :name "forceSimple"    :type "Boolean" )
  (:variable :name "noAutoLabeling"    :type "Boolean" )
))


(:class "flash.text.engine::FontPosture" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ITALIC"    :type "String" :value "italic" :static t )
  (:constant :name "NORMAL"    :type "String" :value "normal" :static t )
  (:constructor "FontPosture" () "*")
))


(:class "flash.display::GraphicsShaderFill" :extends "Object" :implements ("GraphicsShaderFill.as$195::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsShaderFill" (&optional ("shader" "flash.display::Shader") ("matrix" "flash.geom::Matrix")) "*")
  (:variable :name "matrix"    :type "flash.geom::Matrix" )
  (:variable :name "shader"    :type "flash.display::Shader" )
))


(:class "flash.net::URLLoader" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "URLLoader" (&optional ("request" "flash.net::URLRequest")) "*")
  (:variable :name "stream"  :namespace-type :private   :type "flash.net::URLStream" )
  (:variable :name "dataFormat"    :type "String" :value "text" )
  (:method "load" (("request" "flash.net::URLRequest")) "void"  )
  (:variable :name "data"    :type "null" )
  (:method "onProgress" (("event" "flash.events::ProgressEvent")) "void" :namespace-type :private  )
  (:variable :name "bytesLoaded"    :type "uint" :value 0 )
  (:method "close" () "void"  )
  (:variable :name "bytesTotal"    :type "uint" :value 0 )
  (:method "redirectEvent" (("event" "flash.events::Event")) "void" :namespace-type :private  )
  (:method "onComplete" (("event" "flash.events::Event")) "void" :namespace-type :private  )
))


(:class "flash.text.engine::GroupElement" :extends "flash.text.engine::ContentElement" :public t :final t 
 :properties (
  (:constructor "GroupElement" (&optional ("elements" "__AS3__.vec::Vector.<flash.text.engine::ContentElement>") ("elementFormat" "flash.text.engine::ElementFormat") ("eventMirror" "flash.events::EventDispatcher") (("textRotation" "String") "rotate0")) "*")
  (:method "getElementAt" (("index" "int")) "flash.text.engine::ContentElement"  :native t )
  (:method "getElementAtCharIndex" (("charIndex" "int")) "flash.text.engine::ContentElement"  :native t )
  (:method-get "elementCount" () "int"  :native t )
  (:method "getElementIndex" (("element" "flash.text.engine::ContentElement")) "int"  )
  (:method "splitTextElement" (("elementIndex" "int") ("splitIndex" "int")) "flash.text.engine::TextElement"  :native t )
  (:method "groupElements" (("beginIndex" "int") ("endIndex" "int")) "flash.text.engine::GroupElement"  :native t )
  (:method "setElements" (("value" "__AS3__.vec::Vector.<flash.text.engine::ContentElement>")) "void"  :native t )
  (:method "replaceElements" (("beginIndex" "int") ("endIndex" "int") ("newElements" "__AS3__.vec::Vector.<flash.text.engine::ContentElement>")) "__AS3__.vec::Vector.<flash.text.engine::ContentElement>"  :native t )
  (:method "mergeTextElements" (("beginIndex" "int") ("endIndex" "int")) "flash.text.engine::TextElement"  :native t )
  (:method "ungroupElements" (("groupIndex" "int")) "void"  :native t )
))


(:class "flash.net::NetConnection" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constant :name "kAddHeader"  :namespace-type :private   :type "uint" :value 3 :static t )
  (:constant :name "kGetProtocol"  :namespace-type :private   :type "uint" :value 6 :static t )
  (:constant :name "kGetFarID"  :namespace-type :private   :type "uint" :value 8 :static t )
  (:constant :name "kCall"  :namespace-type :private   :type "uint" :value 2 :static t )
  (:constant :name "kGetConnectedProxyType"  :namespace-type :private   :type "uint" :value 4 :static t )
  (:constant :name "kGetNearNonce"  :namespace-type :private   :type "uint" :value 9 :static t )
  (:method-set "defaultObjectEncoding" (("version" "uint")) "void"  :native t :static t :final t )
  (:constant :name "kGetNearID"  :namespace-type :private   :type "uint" :value 7 :static t )
  (:constant :name "kGetFarNonce"  :namespace-type :private   :type "uint" :value 10 :static t )
  (:constant :name "kGetUsingTLS"  :namespace-type :private   :type "uint" :value 5 :static t )
  (:method-get "defaultObjectEncoding" () "uint"  :native t :static t :final t )
  (:constant :name "kClose"  :namespace-type :private   :type "uint" :value 1 :static t )
  (:constant :name "kConnect"  :namespace-type :private   :type "uint" :value 0 :static t )
  (:constructor "NetConnection" () "*")
  (:method-get "unconnectedPeerStreams" () "Array"  :native t )
  (:method-get "nearID" () "String"  :native t )
  (:method-set "objectEncoding" (("version" "uint")) "void"  :native t )
  (:method-set "maxPeerConnections" (("maxPeers" "uint")) "void"  :native t )
  (:method-get "protocol" () "String"  :native t )
  (:method-get "proxyType" () "String"  :native t )
  (:method-get "connected" () "Boolean"  :native t )
  (:method "connect" (&rest ("command" "String")) "void"  :native t )
  (:method-get "client" () "Object"  :native t )
  (:method-get "uri" () "String"  :native t )
  (:method "invokeWithArgsArray" (("index" "uint") ("args" "Array")) "*" :namespace-type :private  :native t )
  (:method "addHeader" (("operation" "String") &optional (("mustUnderstand" "Boolean") nil #|| false||# ) ("param" "Object")) "void"  )
  (:method-get "maxPeerConnections" () "uint"  :native t )
  (:method-set "proxyType" (("ptype" "String")) "void"  :native t )
  (:method "invoke" (&rest ("index" "uint")) "*" :namespace-type :private  :native t )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method-get "nearNonce" () "String"  :native t )
  (:method-set "client" (("object" "Object")) "void"  :native t )
  (:method-get "usingTLS" () "Boolean"  :native t )
  (:method "close" () "void"  )
  (:method-get "farID" () "String"  :native t )
  (:method-get "farNonce" () "String"  :native t )
  (:method "call" (("command" "String") &rest ("responder" "flash.net::Responder")) "void"  )
  (:method-get "connectedProxyType" () "String"  :native t )
))


(:class "flash.display::DisplayObjectContainer" :extends "flash.display::InteractiveObject" :public t 
 :properties (
  (:constructor "DisplayObjectContainer" () "*")
  (:method-get "mouseChildren" () "Boolean"  :native t )
  (:method-get "numChildren" () "int"  :native t )
  (:method "contains" (("child" "flash.display::DisplayObject")) "Boolean"  :native t )
  (:method "swapChildrenAt" (("index1" "int") ("index2" "int")) "void"  :native t )
  (:method "getChildByName" (("name" "String")) "flash.display::DisplayObject"  :native t )
  (:method "removeChildAt" (("index" "int")) "flash.display::DisplayObject"  :native t )
  (:method "getChildIndex" (("child" "flash.display::DisplayObject")) "int"  :native t )
  (:method "addChildAt" (("child" "flash.display::DisplayObject") ("index" "int")) "flash.display::DisplayObject"  :native t )
  (:method-set "tabChildren" (("enable" "Boolean")) "void"  :native t )
  (:method-get "textSnapshot" () "flash.text::TextSnapshot"  :native t )
  (:method "swapChildren" (("child1" "flash.display::DisplayObject") ("child2" "flash.display::DisplayObject")) "void"  :native t )
  (:method-get "tabChildren" () "Boolean"  :native t )
  (:method "getObjectsUnderPoint" (("point" "flash.geom::Point")) "Array"  :native t )
  (:method-set "mouseChildren" (("enable" "Boolean")) "void"  :native t )
  (:method "removeChild" (("child" "flash.display::DisplayObject")) "flash.display::DisplayObject"  :native t )
  (:method "getChildAt" (("index" "int")) "flash.display::DisplayObject"  :native t )
  (:method "addChild" (("child" "flash.display::DisplayObject")) "flash.display::DisplayObject"  :native t )
  (:method "areInaccessibleObjectsUnderPoint" (("point" "flash.geom::Point")) "Boolean"  :native t )
  (:method "setChildIndex" (("child" "flash.display::DisplayObject") ("index" "int")) "void"  :native t )
))


(:class "flash.display::Sprite" :extends "flash.display::DisplayObjectContainer" :public t 
 :properties (
  (:constructor "Sprite" () "*")
  (:method-get "dropTarget" () "flash.display::DisplayObject"  :native t )
  (:method-get "soundTransform" () "flash.media::SoundTransform"  :native t )
  (:method "constructChildren" () "void" :namespace-type :private  :native t )
  (:method-get "hitArea" () "flash.display::Sprite"  :native t )
  (:method-set "buttonMode" (("value" "Boolean")) "void"  :native t )
  (:method-get "graphics" () "flash.display::Graphics"  :native t )
  (:method-get "useHandCursor" () "Boolean"  :native t )
  (:method-set "hitArea" (("value" "flash.display::Sprite")) "void"  :native t )
  (:method-get "buttonMode" () "Boolean"  :native t )
  (:method "stopDrag" () "void"  :native t )
  (:method-set "useHandCursor" (("value" "Boolean")) "void"  :native t )
  (:method-set "soundTransform" (("sndTransform" "flash.media::SoundTransform")) "void"  :native t )
  (:method "startDrag" (&optional (("lockCenter" "Boolean") nil #|| false||# ) ("bounds" "flash.geom::Rectangle")) "void"  :native t )
))


(:class "flash.display::MovieClip" :extends "flash.display::Sprite" :public t :dynamic t
 :properties (
  (:constructor "MovieClip" () "*")
  (:method-get "currentFrameLabel" () "String"  :native t )
  (:method "prevFrame" () "void"  :native t )
  (:method "stop" () "void"  :native t )
  (:method-get "scenes" () "Array"  :native t )
  (:method "gotoAndPlay" (("frame" "Object") &optional ("scene" "String")) "void"  :native t )
  (:method-set "enabled" (("value" "Boolean")) "void"  :native t )
  (:method-get "totalFrames" () "int"  :native t )
  (:method-get "framesLoaded" () "int"  :native t )
  (:method-get "enabled" () "Boolean"  :native t )
  (:method "nextScene" () "void"  :native t )
  (:method-get "currentFrame" () "int"  :native t )
  (:method-get "currentScene" () "flash.display::Scene"  :native t )
  (:method "gotoAndStop" (("frame" "Object") &optional ("scene" "String")) "void"  :native t )
  (:method "addFrameScript" () "void"  :native t )
  (:method-set "trackAsMenu" (("value" "Boolean")) "void"  :native t )
  (:method "prevScene" () "void"  :native t )
  (:method "nextFrame" () "void"  :native t )
  (:method "play" () "void"  :native t )
  (:method-get "trackAsMenu" () "Boolean"  :native t )
  (:method-get "currentLabel" () "String"  :native t )
  (:method-get "currentLabels" () "Array"  )
))


(:class "flash.events::NetStatusEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "NET_STATUS"    :type "String" :value "netStatus" :static t )
  (:constructor "NetStatusEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) ("info" "Object")) "*")
  (:variable :name "m_info"  :namespace-type :private   :type "Object" )
  (:method-set "info" (("value" "Object")) "void"  )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:method-get "info" () "Object"  )
))


(:class "flash.text::GridFitType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "SUBPIXEL"    :type "String" :value "subpixel" :static t )
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constant :name "PIXEL"    :type "String" :value "pixel" :static t )
  (:constructor "GridFitType" () "*")
))


(:class "flash.display::CapsStyle" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constant :name "SQUARE"    :type "String" :value "square" :static t )
  (:constant :name "ROUND"    :type "String" :value "round" :static t )
  (:constructor "CapsStyle" () "*")
))


(:class "flash.net::FileFilter" :extends "Object" :public t :final t 
 :properties (
  (:constructor "FileFilter" (("description" "String") ("extension" "String") &optional ("macType" "String")) "*")
  (:method-set "macType" (("value" "String")) "void"  :native t )
  (:method-set "description" (("value" "String")) "void"  :native t )
  (:method-get "macType" () "String"  :native t )
  (:method-get "description" () "String"  :native t )
  (:method-set "extension" (("value" "String")) "void"  :native t )
  (:method-get "extension" () "String"  :native t )
))


(:class "flash.text.engine::FontLookup" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "EMBEDDED_CFF"    :type "String" :value "embeddedCFF" :static t )
  (:constant :name "DEVICE"    :type "String" :value "device" :static t )
  (:constructor "FontLookup" () "*")
))


(:class "flash.net::URLRequestHeader" :extends "Object" :public t :final t 
 :properties (
  (:constructor "URLRequestHeader" (&optional (("name" "String") "") (("value" "String") "")) "*")
  (:variable :name "value"    :type "String" )
  (:variable :name "name"    :type "String" )
))


(:class "flash.text::TextDisplayMode" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DEFAULT"    :type "String" :value "default" :static t )
  (:constant :name "CRT"    :type "String" :value "crt" :static t )
  (:constant :name "LCD"    :type "String" :value "lcd" :static t )
  (:constructor "TextDisplayMode" () "*")
))


(:class "flash.text::CSMSettings" :extends "Object" :public t :final t 
 :properties (
  (:constructor "CSMSettings" (("fontSize" "Number") ("insideCutoff" "Number") ("outsideCutoff" "Number")) "*")
  (:variable :name "fontSize"    :type "Number" )
  (:variable :name "outsideCutoff"    :type "Number" )
  (:variable :name "insideCutoff"    :type "Number" )
))


(:class "flash.utils::Endian" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "BIG_ENDIAN"    :type "String" :value "bigEndian" :static t )
  (:constant :name "LITTLE_ENDIAN"    :type "String" :value "littleEndian" :static t )
  (:constructor "Endian" () "*")
))


(:class "flash.text::FontType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DEVICE"    :type "String" :value "device" :static t )
  (:constant :name "EMBEDDED"    :type "String" :value "embedded" :static t )
  (:constant :name "EMBEDDED_CFF"    :type "String" :value "embeddedCFF" :static t )
  (:constructor "FontType" () "*")
))


(:class "flash.display::SimpleButton" :extends "flash.display::InteractiveObject" :public t 
 :properties (
  (:constructor "SimpleButton" (&optional ("upState" "flash.display::DisplayObject") ("overState" "flash.display::DisplayObject") ("downState" "flash.display::DisplayObject") ("hitTestState" "flash.display::DisplayObject")) "*")
  (:method-get "enabled" () "Boolean"  :native t )
  (:method-set "enabled" (("value" "Boolean")) "void"  :native t )
  (:method-get "hitTestState" () "flash.display::DisplayObject"  :native t )
  (:method-set "hitTestState" (("value" "flash.display::DisplayObject")) "void"  :native t )
  (:method "_updateButton" () "void" :namespace-type :private  :native t )
  (:method-set "upState" (("value" "flash.display::DisplayObject")) "void"  :native t )
  (:method-get "downState" () "flash.display::DisplayObject"  :native t )
  (:method-set "soundTransform" (("sndTransform" "flash.media::SoundTransform")) "void"  :native t )
  (:method-get "soundTransform" () "flash.media::SoundTransform"  :native t )
  (:method-get "upState" () "flash.display::DisplayObject"  :native t )
  (:method-set "useHandCursor" (("value" "Boolean")) "void"  :native t )
  (:method-set "overState" (("value" "flash.display::DisplayObject")) "void"  :native t )
  (:method-get "useHandCursor" () "Boolean"  :native t )
  (:method-get "trackAsMenu" () "Boolean"  :native t )
  (:method-get "overState" () "flash.display::DisplayObject"  :native t )
  (:method-set "downState" (("value" "flash.display::DisplayObject")) "void"  :native t )
  (:method-set "trackAsMenu" (("value" "Boolean")) "void"  :native t )
))


(:class "flash.utils::Proxy" :extends "Object" :public t 
 :properties (
  (:constructor "Proxy" () "*")
  (:method "deleteProperty" ("name") "Boolean" :namespace-type :public  )
  (:method "isAttribute" ("name") "Boolean" :namespace-type :public  :native t )
  (:method "callProperty" (&rest "name") "*" :namespace-type :public  )
  (:method "nextNameIndex" (("index" "int")) "int" :namespace-type :public  )
  (:method "nextName" (("index" "int")) "String" :namespace-type :public  )
  (:method "getDescendants" ("name") "*" :namespace-type :public  )
  (:method "getProperty" ("name") "*" :namespace-type :public  )
  (:method "nextValue" (("index" "int")) "*" :namespace-type :public  )
  (:method "setProperty" ("name" "value") "void" :namespace-type :public  )
  (:method "hasProperty" ("name") "Boolean" :namespace-type :public  )
))

  (:constant :name "flash_proxy"    :type "null" :value "public::http://www.adobe.com/2006/actionscript/flash/proxy" )

(:class "flash.system::SecurityPanel" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DEFAULT"    :type "String" :value "default" :static t )
  (:constant :name "CAMERA"    :type "String" :value "camera" :static t )
  (:constant :name "LOCAL_STORAGE"    :type "String" :value "localStorage" :static t )
  (:constant :name "PRIVACY"    :type "String" :value "privacy" :static t )
  (:constant :name "MICROPHONE"    :type "String" :value "microphone" :static t )
  (:constant :name "SETTINGS_MANAGER"    :type "String" :value "settingsManager" :static t )
  (:constant :name "DISPLAY"    :type "String" :value "display" :static t )
  (:constructor "SecurityPanel" () "*")
))


(:class "flash.filters::GlowFilter" :extends "flash.filters::BitmapFilter" :public t :final t 
 :properties (
  (:constructor "GlowFilter" (&optional (("color" "uint") 16711680) (("alpha" "Number") 1) (("blurX" "Number") 6) (("blurY" "Number") 6) (("strength" "Number") 2) (("quality" "int") 1) (("inner" "Boolean") nil #|| false||# ) (("knockout" "Boolean") nil #|| false||# )) "*")
  (:method-get "strength" () "Number"  :native t )
  (:method-set "blurX" (("value" "Number")) "void"  :native t )
  (:method-get "color" () "uint"  :native t )
  (:method-set "blurY" (("value" "Number")) "void"  :native t )
  (:method-set "quality" (("value" "int")) "void"  :native t )
  (:method-set "color" (("value" "uint")) "void"  :native t )
  (:method-set "strength" (("value" "Number")) "void"  :native t )
  (:method-set "inner" (("value" "Boolean")) "void"  :native t )
  (:method-get "blurX" () "Number"  :native t )
  (:method-get "blurY" () "Number"  :native t )
  (:method-set "knockout" (("value" "Boolean")) "void"  :native t )
  (:method-get "inner" () "Boolean"  :native t )
  (:method-get "knockout" () "Boolean"  :native t )
  (:method-set "alpha" (("value" "Number")) "void"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-get "alpha" () "Number"  :native t )
  (:method-get "quality" () "int"  :native t )
))


  (:method "enterDebugger" () "void"  :native t :uri "flash.debugger" )

(:class "flash.net::URLVariables" :extends "Object" :public t :dynamic t
 :properties (
  (:constructor "URLVariables" (&optional ("source" "String")) "*")
  (:method "_unescape" (("value" "String")) "String" :namespace-type :private  )
  (:method "toString" () "String"  )
  (:method "decode" (("source" "String")) "void"  )
))


(:class "flash.events::FullScreenEvent" :extends "flash.events::ActivityEvent" :public t 
 :properties (
  (:constant :name "FULL_SCREEN"    :type "String" :value "fullScreen" :static t )
  (:constructor "FullScreenEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("fullScreen" "Boolean") nil #|| false||# )) "*")
  (:variable :name "m_fullScreen"  :namespace-type :private   :type "Boolean" )
  (:method-get "fullScreen" () "Boolean"  )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:class "flash.net::NetStreamPlayTransitions" :extends "Object" :public t 
 :properties (
  (:constant :name "SWAP"    :type "null" :value "swap" :static t )
  (:constant :name "SWITCH"    :type "null" :value "switch" :static t )
  (:constant :name "STOP"    :type "null" :value "stop" :static t )
  (:constant :name "APPEND"    :type "null" :value "append" :static t )
  (:constant :name "RESET"    :type "null" :value "reset" :static t )
  (:constructor "NetStreamPlayTransitions" () "*")
))


(:class "flash.text.engine::DigitCase" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LINING"    :type "String" :value "lining" :static t )
  (:constant :name "DEFAULT"    :type "String" :value "default" :static t )
  (:constant :name "OLD_STYLE"    :type "String" :value "oldStyle" :static t )
  (:constructor "DigitCase" () "*")
))


(:class "flash.media::SoundLoaderContext" :extends "Object" :public t 
 :properties (
  (:constructor "SoundLoaderContext" (&optional (("bufferTime" "Number") 1000) (("checkPolicyFile" "Boolean") nil #|| false||# )) "*")
  (:variable :name "bufferTime"    :type "Number" :value 1000 )
  (:variable :name "checkPolicyFile"    :type "Boolean" :value nil #|| false||#  )
))


(:class "flash.net::FileReferenceList" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "FileReferenceList" () "*")
  (:method "browse" (&optional ("typeFilter" "Array")) "Boolean"  :native t )
  (:method-get "fileList" () "Array"  :native t )
))


(:class "flash.events::ShaderEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "COMPLETE"    :type "String" :value "complete" :static t )
  (:constructor "ShaderEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) ("bitmap" "flash.display::BitmapData") ("array" "flash.utils::ByteArray") ("vector" "__AS3__.vec::Vector.<Number>")) "*")
  (:method-set "byteArray" (("bArray" "flash.utils::ByteArray")) "*"  )
  (:method-get "vector" () "__AS3__.vec::Vector.<Number>"  )
  (:method-set "vector" (("v" "__AS3__.vec::Vector.<Number>")) "*"  )
  (:variable :name "m_bitmapData"  :namespace-type :private   :type "flash.display::BitmapData" )
  (:method "toString" () "String"  :override t )
  (:method-get "byteArray" () "flash.utils::ByteArray"  )
  (:method-set "bitmapData" (("bmpData" "flash.display::BitmapData")) "*"  )
  (:variable :name "m_vector"  :namespace-type :private   :type "__AS3__.vec::Vector.<Number>" )
  (:method-get "bitmapData" () "flash.display::BitmapData"  )
  (:method "clone" () "flash.events::Event"  :override t )
  (:variable :name "m_byteArray"  :namespace-type :private   :type "flash.utils::ByteArray" )
))


(:class "flash.text.engine::TextLineMirrorRegion" :extends "Object" :public t :final t 
 :properties (
  (:constructor "TextLineMirrorRegion" () "*")
  (:method-get "textLine" () "flash.text.engine::TextLine"  :native t )
  (:method-get "bounds" () "flash.geom::Rectangle"  :native t )
  (:method-get "nextRegion" () "flash.text.engine::TextLineMirrorRegion"  :native t )
  (:method-get "previousRegion" () "flash.text.engine::TextLineMirrorRegion"  :native t )
  (:method-get "element" () "flash.text.engine::ContentElement"  :native t )
  (:method-get "mirror" () "flash.events::EventDispatcher"  :native t )
))


(:class "flash.filters::BitmapFilterQuality" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LOW"    :type "int" :value 1 :static t )
  (:constant :name "MEDIUM"    :type "int" :value 2 :static t )
  (:constant :name "HIGH"    :type "int" :value 3 :static t )
  (:constructor "BitmapFilterQuality" () "*")
))


(:class "flash.text::TextFormat" :extends "Object" :public t 
 :properties (
  (:constructor "TextFormat" (&optional ("font" "String") ("size" "Object") ("color" "Object") ("bold" "Object") ("italic" "Object") ("underline" "Object") ("url" "String") ("target" "String") ("align" "String") ("leftMargin" "Object") ("rightMargin" "Object") ("indent" "Object") ("leading" "Object")) "*")
  (:method-get "size" () "Object"  :native t )
  (:method-get "bullet" () "Object"  :native t )
  (:method-set "bullet" (("value" "Object")) "void"  :native t )
  (:method-get "align" () "String"  :native t )
  (:method-set "color" (("value" "Object")) "void"  :native t )
  (:method-get "display" () "String"  :native t )
  (:method-set "bold" (("value" "Object")) "void"  :native t )
  (:method-set "display" (("value" "String")) "void"  :native t )
  (:method-get "bold" () "Object"  :native t )
  (:method-get "leading" () "Object"  :native t )
  (:method-get "font" () "String"  :native t )
  (:method-set "align" (("value" "String")) "void"  :native t )
  (:method-set "leading" (("value" "Object")) "void"  :native t )
  (:method-set "rightMargin" (("value" "Object")) "void"  :native t )
  (:method-get "leftMargin" () "Object"  :native t )
  (:method-set "indent" (("value" "Object")) "void"  :native t )
  (:method-get "blockIndent" () "Object"  :native t )
  (:method-set "size" (("value" "Object")) "void"  :native t )
  (:method-get "kerning" () "Object"  :native t )
  (:method-get "tabStops" () "Array"  :native t )
  (:method-set "font" (("value" "String")) "void"  :native t )
  (:method-set "kerning" (("value" "Object")) "void"  :native t )
  (:method-set "italic" (("value" "Object")) "void"  :native t )
  (:method-set "target" (("value" "String")) "void"  :native t )
  (:method-get "color" () "Object"  :native t )
  (:method-get "underline" () "Object"  :native t )
  (:method-set "url" (("value" "String")) "void"  :native t )
  (:method-set "underline" (("value" "Object")) "void"  :native t )
  (:method-get "target" () "String"  :native t )
  (:method-set "leftMargin" (("value" "Object")) "void"  :native t )
  (:method-get "indent" () "Object"  :native t )
  (:method-get "url" () "String"  :native t )
  (:method-get "italic" () "Object"  :native t )
  (:method-get "rightMargin" () "Object"  :native t )
  (:method-set "blockIndent" (("value" "Object")) "void"  :native t )
  (:method-set "tabStops" (("value" "Array")) "void"  :native t )
  (:method-set "letterSpacing" (("value" "Object")) "void"  :native t )
  (:method-get "letterSpacing" () "Object"  :native t )
))


(:class "flash.display::Graphics" :extends "Object" :public t :final t 
 :properties (
  (:constructor "Graphics" () "*")
  (:method "drawTriangles" (("vertices" "__AS3__.vec::Vector.<Number>") &optional ("indices" "__AS3__.vec::Vector.<int>") ("uvtData" "__AS3__.vec::Vector.<Number>") (("culling" "String") "none")) "void"  :native t )
  (:method "drawRect" (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number")) "void"  :native t )
  (:method "drawPath" (("commands" "__AS3__.vec::Vector.<int>") ("data" "__AS3__.vec::Vector.<Number>") &optional (("winding" "String") "evenOdd")) "void"  :native t )
  (:method "curveTo" (("controlX" "Number") ("controlY" "Number") ("anchorX" "Number") ("anchorY" "Number")) "void"  :native t )
  (:method "beginFill" (("color" "uint") &optional (("alpha" "Number") 1)) "void"  :native t )
  (:method "clear" () "void"  :native t )
  (:method "lineTo" (("x" "Number") ("y" "Number")) "void"  :native t )
  (:method "beginShaderFill" (("shader" "flash.display::Shader") &optional ("matrix" "flash.geom::Matrix")) "void"  :native t )
  (:method "lineGradientStyle" (("type" "String") ("colors" "Array") ("alphas" "Array") ("ratios" "Array") &optional ("matrix" "flash.geom::Matrix") (("spreadMethod" "String") "pad") (("interpolationMethod" "String") "rgb") (("focalPointRatio" "Number") 0)) "void"  :native t )
  (:method "beginBitmapFill" (("bitmap" "flash.display::BitmapData") &optional ("matrix" "flash.geom::Matrix") (("repeat" "Boolean") t #|| true||# ) (("smooth" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method "beginGradientFill" (("type" "String") ("colors" "Array") ("alphas" "Array") ("ratios" "Array") &optional ("matrix" "flash.geom::Matrix") (("spreadMethod" "String") "pad") (("interpolationMethod" "String") "rgb") (("focalPointRatio" "Number") 0)) "void"  :native t )
  (:method "lineStyle" (&optional ("thickness" "Number") (("color" "uint") 0) (("alpha" "Number") 1) (("pixelHinting" "Boolean") nil #|| false||# ) (("scaleMode" "String") "normal") ("caps" "String") ("joints" "String") (("miterLimit" "Number") 3)) "void"  :native t )
  (:method "beginStrokeObject" (("istroke" "flash.display::IGraphicsStroke")) "void" :namespace-type :private  )
  (:method "drawRoundRectComplex" (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number") ("topLeftRadius" "Number") ("topRightRadius" "Number") ("bottomLeftRadius" "Number") ("bottomRightRadius" "Number")) "void"  :native t )
  (:method "drawPathObject" (("path" "flash.display::IGraphicsPath")) "void" :namespace-type :private  )
  (:method "beginFillObject" (("fill" "flash.display::IGraphicsFill")) "void" :namespace-type :private  )
  (:method "moveTo" (("x" "Number") ("y" "Number")) "void"  :native t )
  (:method "drawRoundRect" (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number") ("ellipseWidth" "Number") &optional ("ellipseHeight" "Number")) "void"  :native t )
  (:method "drawCircle" (("x" "Number") ("y" "Number") ("radius" "Number")) "void"  )
  (:method "lineBitmapStyle" (("bitmap" "flash.display::BitmapData") &optional ("matrix" "flash.geom::Matrix") (("repeat" "Boolean") t #|| true||# ) (("smooth" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method "lineShaderStyle" (("shader" "flash.display::Shader") &optional ("matrix" "flash.geom::Matrix")) "void"  :native t )
  (:method "drawGraphicsData" (("graphicsData" "__AS3__.vec::Vector.<flash.display::IGraphicsData>")) "void"  )
  (:method "drawEllipse" (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number")) "void"  )
  (:method "endFill" () "void"  :native t )
  (:method "copyFrom" (("sourceGraphics" "flash.display::Graphics")) "void"  :native t )
))


(:class "flash.events::TimerEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "TIMER_COMPLETE"    :type "String" :value "timerComplete" :static t )
  (:constant :name "TIMER"    :type "String" :value "timer" :static t )
  (:constructor "TimerEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# )) "*")
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:method "updateAfterEvent" () "void"  :native t )
))


(:class "flash.utils::ObjectOutput" :extends "Object" :implements ("IDataOutput") :public t 
 :properties (
  (:constructor "ObjectOutput" () "*")
  (:method "writeMultiByte" (("value" "String") ("charSet" "String")) "void"  :native t )
  (:method "writeUTFBytes" (("value" "String")) "void"  :native t )
  (:method "writeObject" ("object") "void"  :native t )
  (:method "writeBoolean" (("value" "Boolean")) "void"  :native t )
  (:method "writeBytes" (("bytes" "flash.utils::ByteArray") &optional (("offset" "uint") 0) (("length" "uint") 0)) "void"  :native t )
  (:method "writeByte" (("value" "int")) "void"  :native t )
  (:method "writeUTF" (("value" "String")) "void"  :native t )
  (:method "writeDouble" (("value" "Number")) "void"  :native t )
  (:method "writeUnsignedInt" (("value" "uint")) "void"  :native t )
  (:method "writeShort" (("value" "int")) "void"  :native t )
  (:method "writeInt" (("value" "int")) "void"  :native t )
  (:method-get "endian" () "String"  :native t )
  (:method-set "objectEncoding" (("version" "uint")) "void"  :native t )
  (:method-get "objectEncoding" () "uint"  :native t )
  (:method-set "endian" (("type" "String")) "void"  :native t )
  (:method "writeFloat" (("value" "Number")) "void"  :native t )
))


(:interface "flash.utils::IExternalizable" :public t 
 :properties (
  (:constructor "IExternalizable" () "*")
  (:method "readExternal" (("input" "flash.utils::IDataInput")) "void" :namespace-type :public  )
  (:method "writeExternal" (("output" "flash.utils::IDataOutput")) "void" :namespace-type :public  )
))


(:class "flash.media::Sound" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "Sound" (&optional ("stream" "flash.net::URLRequest") ("context" "flash.media::SoundLoaderContext")) "*")
  (:method "extract" (("target" "flash.utils::ByteArray") ("length" "Number") &optional (("startPosition" "Number") -1)) "Number"  :native t )
  (:method "_load" (("stream" "flash.net::URLRequest") ("checkPolicyFile" "Boolean") ("bufferTime" "Number")) "void" :namespace-type :private  :native t )
  (:method "load" (("stream" "flash.net::URLRequest") &optional ("context" "flash.media::SoundLoaderContext")) "void"  )
  (:method "close" () "void"  :native t )
  (:method "_buildLoaderContext" (("context" "flash.media::SoundLoaderContext")) "flash.media::SoundLoaderContext" :namespace-type :private  )
  (:method-get "url" () "String"  :native t )
  (:method-get "bytesLoaded" () "uint"  :native t )
  (:method "play" (&optional (("startTime" "Number") 0) (("loops" "int") 0) ("sndTransform" "flash.media::SoundTransform")) "flash.media::SoundChannel"  :native t )
  (:method-get "length" () "Number"  :native t )
  (:method-get "id3" () "flash.media::ID3Info"  :native t )
  (:method-get "bytesTotal" () "int"  :native t )
  (:method-get "isBuffering" () "Boolean"  :native t )
))


(:class "flash.text::StyleSheet" :extends "flash.events::EventDispatcher" :public t :dynamic t
 :properties (
  (:constructor "StyleSheet" () "*")
  (:method "_update" () "void" :namespace-type :private  :native t )
  (:method-get "_styles" () "Object" :namespace-type :private  :native t )
  (:method-set "_styles" (("styles" "Object")) "void" :namespace-type :private  :native t )
  (:variable :name "_css"  :namespace-type :private   :type "Object" )
  (:method "_parseCSSFontFamily" (("fontFamily" "String")) "String" :namespace-type :private  :native t )
  (:method "transform" (("formatObject" "Object")) "flash.text::TextFormat"  )
  (:method "clear" () "void"  )
  (:method "_parseCSSInternal" (("cssText" "String")) "Object" :namespace-type :private  :native t )
  (:method "setStyle" (("styleName" "String") ("styleObject" "Object")) "void"  )
  (:method "parseCSS" (("CSSText" "String")) "void"  )
  (:method "_copy" (("o" "Object")) "Object" :namespace-type :private  )
  (:method "_parseColor" (("color" "String")) "uint" :namespace-type :private  :native t )
  (:method-get "styleNames" () "Array"  )
  (:method "doTransform" (("n" "String")) "void" :namespace-type :private  )
  (:method "getStyle" (("styleName" "String")) "Object"  )
))


(:class "flash.text.engine::LineJustification" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ALL_BUT_LAST"    :type "String" :value "allButLast" :static t )
  (:constant :name "UNJUSTIFIED"    :type "String" :value "unjustified" :static t )
  (:constant :name "ALL_INCLUDING_LAST"    :type "String" :value "allIncludingLast" :static t )
  (:constructor "LineJustification" () "*")
))


(:class "flash.text.engine::TextLineValidity" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "STATIC"    :type "String" :value "static" :static t )
  (:constant :name "INVALID"    :type "String" :value "invalid" :static t )
  (:constant :name "VALID"    :type "String" :value "valid" :static t )
  (:constant :name "POSSIBLY_INVALID"    :type "String" :value "possiblyInvalid" :static t )
  (:constructor "TextLineValidity" () "*")
))


(:class "flash.display::Loader" :extends "flash.display::DisplayObjectContainer" :public t 
 :properties (
  (:constructor "Loader" () "*")
  (:method-get "contentLoaderInfo" () "flash.display::LoaderInfo"  :native t )
  (:method "_load" (("request" "flash.net::URLRequest") ("checkPolicyFile" "Boolean") ("applicationDomain" "flash.system::ApplicationDomain") ("securityDomain" "flash.system::SecurityDomain") ("deblockingFilter" "Number")) "void" :namespace-type :private  :native t )
  (:method "load" (("request" "flash.net::URLRequest") &optional ("context" "flash.system::LoaderContext")) "void"  )
  (:method "removeChild" (("child" "flash.display::DisplayObject")) "flash.display::DisplayObject"  :override t )
  (:method "_getJPEGLoaderContextdeblockingfilter" (("context" "Object")) "Number" :namespace-type :private  :native t )
  (:method "loadBytes" (("bytes" "flash.utils::ByteArray") &optional ("context" "flash.system::LoaderContext")) "void"  )
  (:method "_buildLoaderContext" (("context" "flash.system::LoaderContext")) "flash.system::LoaderContext" :namespace-type :private  )
  (:method "addChildAt" (("child" "flash.display::DisplayObject") ("index" "int")) "flash.display::DisplayObject"  :override t )
  (:method "setChildIndex" (("child" "flash.display::DisplayObject") ("index" "int")) "void"  :override t )
  (:method "removeChildAt" (("index" "int")) "flash.display::DisplayObject"  :override t )
  (:method "_loadBytes" (("bytes" "flash.utils::ByteArray") ("checkPolicyFile" "Boolean") ("applicationDomain" "flash.system::ApplicationDomain") ("securityDomain" "flash.system::SecurityDomain") ("deblockingFilter" "Number")) "void" :namespace-type :private  :native t )
  (:method "close" () "void"  :native t )
  (:method-get "content" () "flash.display::DisplayObject"  :native t )
  (:method "unloadAndStop" (&optional (("gc" "Boolean") t #|| true||# )) "void"  )
  (:method "addChild" (("child" "flash.display::DisplayObject")) "flash.display::DisplayObject"  :override t )
  (:method "_unload" (("halt" "Boolean") ("gc" "Boolean")) "void" :namespace-type :private  :native t )
  (:method "unload" () "void"  )
))


(:class "flash.display::BlendMode" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ADD"    :type "String" :value "add" :static t )
  (:constant :name "ERASE"    :type "String" :value "erase" :static t )
  (:constant :name "ALPHA"    :type "String" :value "alpha" :static t )
  (:constant :name "SUBTRACT"    :type "String" :value "subtract" :static t )
  (:constant :name "INVERT"    :type "String" :value "invert" :static t )
  (:constant :name "LIGHTEN"    :type "String" :value "lighten" :static t )
  (:constant :name "MULTIPLY"    :type "String" :value "multiply" :static t )
  (:constant :name "SHADER"    :type "String" :value "shader" :static t )
  (:constant :name "DARKEN"    :type "String" :value "darken" :static t )
  (:constant :name "NORMAL"    :type "String" :value "normal" :static t )
  (:constant :name "HARDLIGHT"    :type "String" :value "hardlight" :static t )
  (:constant :name "SCREEN"    :type "String" :value "screen" :static t )
  (:constant :name "OVERLAY"    :type "String" :value "overlay" :static t )
  (:constant :name "LAYER"    :type "String" :value "layer" :static t )
  (:constant :name "DIFFERENCE"    :type "String" :value "difference" :static t )
  (:constructor "BlendMode" () "*")
))


(:class "flash.geom::Point" :extends "Object" :public t 
 :properties (
  (:method "interpolate" (("pt1" "flash.geom::Point") ("pt2" "flash.geom::Point") ("f" "Number")) "flash.geom::Point"  :static t :final t )
  (:method "distance" (("pt1" "flash.geom::Point") ("pt2" "flash.geom::Point")) "Number"  :static t :final t )
  (:method "polar" (("len" "Number") ("angle" "Number")) "flash.geom::Point"  :static t :final t )
  (:constructor "Point" (&optional (("x" "Number") 0) (("y" "Number") 0)) "*")
  (:method "add" (("v" "flash.geom::Point")) "flash.geom::Point"  )
  (:method-get "length" () "Number"  )
  (:method "toString" () "String"  )
  (:method "normalize" (("thickness" "Number")) "void"  )
  (:method "subtract" (("v" "flash.geom::Point")) "flash.geom::Point"  )
  (:variable :name "x"    :type "Number" )
  (:variable :name "y"    :type "Number" )
  (:method "offset" (("dx" "Number") ("dy" "Number")) "void"  )
  (:method "clone" () "flash.geom::Point"  )
  (:method "equals" (("toCompare" "flash.geom::Point")) "Boolean"  )
))


(:class "flash.system::LoaderContext" :extends "Object" :public t 
 :properties (
  (:constructor "LoaderContext" (&optional (("checkPolicyFile" "Boolean") nil #|| false||# ) ("applicationDomain" "flash.system::ApplicationDomain") ("securityDomain" "flash.system::SecurityDomain")) "*")
  (:variable :name "applicationDomain"    :type "flash.system::ApplicationDomain" :value :null #|| null||#  )
  (:variable :name "checkPolicyFile"    :type "Boolean" :value nil #|| false||#  )
  (:variable :name "securityDomain"    :type "flash.system::SecurityDomain" :value :null #|| null||#  )
))


(:class "flash.system::JPEGLoaderContext" :extends "flash.system::LoaderContext" :public t 
 :properties (
  (:constructor "JPEGLoaderContext" (&optional (("deblockingFilter" "Number") 0) (("checkPolicyFile" "Boolean") nil #|| false||# ) ("applicationDomain" "flash.system::ApplicationDomain") ("securityDomain" "flash.system::SecurityDomain")) "*")
  (:variable :name "deblockingFilter"    :type "Number" :value 0 )
))


(:class "flash.events::MouseEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "MOUSE_WHEEL"    :type "String" :value "mouseWheel" :static t )
  (:constant :name "MOUSE_MOVE"    :type "String" :value "mouseMove" :static t )
  (:constant :name "ROLL_OUT"    :type "String" :value "rollOut" :static t )
  (:constant :name "MOUSE_OVER"    :type "String" :value "mouseOver" :static t )
  (:constant :name "CLICK"    :type "String" :value "click" :static t )
  (:constant :name "MOUSE_OUT"    :type "String" :value "mouseOut" :static t )
  (:constant :name "MOUSE_UP"    :type "String" :value "mouseUp" :static t )
  (:constant :name "DOUBLE_CLICK"    :type "String" :value "doubleClick" :static t )
  (:constant :name "MOUSE_DOWN"    :type "String" :value "mouseDown" :static t )
  (:constant :name "ROLL_OVER"    :type "String" :value "rollOver" :static t )
  (:constructor "MouseEvent" (("type" "String") &optional (("bubbles" "Boolean") t #|| true||# ) (("cancelable" "Boolean") nil #|| false||# ) ("localX" "Number") ("localY" "Number") ("relatedObject" "flash.display::InteractiveObject") (("ctrlKey" "Boolean") nil #|| false||# ) (("altKey" "Boolean") nil #|| false||# ) (("shiftKey" "Boolean") nil #|| false||# ) (("buttonDown" "Boolean") nil #|| false||# ) (("delta" "int") 0)) "*")
  (:method-get "isRelatedObjectInaccessible" () "Boolean"  )
  (:method-get "buttonDown" () "Boolean"  )
  (:method-set "isRelatedObjectInaccessible" (("value" "Boolean")) "void"  )
  (:variable :name "m_buttonDown"  :namespace-type :private   :type "Boolean" )
  (:method "updateAfterEvent" () "void"  :native t )
  (:variable :name "m_altKey"  :namespace-type :private   :type "Boolean" )
  (:method-get "relatedObject" () "flash.display::InteractiveObject"  )
  (:method-get "localX" () "Number"  :native t )
  (:method-get "localY" () "Number"  :native t )
  (:variable :name "m_shiftKey"  :namespace-type :private   :type "Boolean" )
  (:method "getStageY" () "Number" :namespace-type :private  :native t )
  (:method-set "relatedObject" (("value" "flash.display::InteractiveObject")) "void"  )
  (:method "getStageX" () "Number" :namespace-type :private  :native t )
  (:method-set "localX" (("value" "Number")) "void"  :native t )
  (:method-get "stageY" () "Number"  )
  (:method-set "localY" (("value" "Number")) "void"  :native t )
  (:method "clone" () "flash.events::Event"  :override t )
  (:method-get "stageX" () "Number"  )
  (:variable :name "m_ctrlKey"  :namespace-type :private   :type "Boolean" )
  (:variable :name "m_delta"  :namespace-type :private   :type "int" )
  (:method-set "ctrlKey" (("value" "Boolean")) "void"  )
  (:variable :name "m_isRelatedObjectInaccessible"  :namespace-type :private   :type "Boolean" )
  (:method "toString" () "String"  :override t )
  (:method-set "buttonDown" (("value" "Boolean")) "void"  )
  (:method-get "ctrlKey" () "Boolean"  )
  (:method-get "altKey" () "Boolean"  )
  (:method-set "delta" (("value" "int")) "void"  )
  (:variable :name "m_relatedObject"  :namespace-type :private   :type "flash.display::InteractiveObject" )
  (:method-set "shiftKey" (("value" "Boolean")) "void"  )
  (:method-set "altKey" (("value" "Boolean")) "void"  )
  (:method-get "shiftKey" () "Boolean"  )
  (:method-get "delta" () "int"  )
))


(:class "flash.text::Font" :extends "Object" :public t 
 :properties (
  (:method "enumerateFonts" (&optional (("enumerateDeviceFonts" "Boolean") nil #|| false||# )) "Array"  :native t :static t :final t )
  (:method "registerFont" (("font" "Class")) "void"  :native t :static t :final t )
  (:constructor "Font" () "*")
  (:method-get "fontType" () "String"  :native t )
  (:method-get "fontStyle" () "String"  :native t )
  (:method-get "fontName" () "String"  :native t )
  (:method "hasGlyphs" (("str" "String")) "Boolean"  :native t )
))


(:class "flash.text.engine::TextBaseline" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DESCENT"    :type "String" :value "descent" :static t )
  (:constant :name "IDEOGRAPHIC_BOTTOM"    :type "String" :value "ideographicBottom" :static t )
  (:constant :name "USE_DOMINANT_BASELINE"    :type "String" :value "useDominantBaseline" :static t )
  (:constant :name "IDEOGRAPHIC_CENTER"    :type "String" :value "ideographicCenter" :static t )
  (:constant :name "IDEOGRAPHIC_TOP"    :type "String" :value "ideographicTop" :static t )
  (:constant :name "ASCENT"    :type "String" :value "ascent" :static t )
  (:constant :name "ROMAN"    :type "String" :value "roman" :static t )
  (:constructor "TextBaseline" () "*")
))


(:class "flash.display::Stage" :extends "flash.display::DisplayObjectContainer" :public t 
 :properties (
  (:constructor "Stage" () "*")
  (:method-set "tabIndex" (("value" "int")) "void"  :override t )
  (:method-set "stageFocusRect" (("on" "Boolean")) "void"  :native t )
  (:method-get "align" () "String"  :native t )
  (:method "willTrigger" (("type" "String")) "Boolean"  :override t )
  (:method-set "mouseChildren" (("value" "Boolean")) "void"  :override t )
  (:method "isFocusInaccessible" () "Boolean"  :native t )
  (:method-set "stageHeight" (("value" "int")) "void"  :native t )
  (:method "hasEventListener" (("type" "String")) "Boolean"  :override t )
  (:method-get "scaleMode" () "String"  :native t )
  (:method "addChildAt" (("child" "flash.display::DisplayObject") ("index" "int")) "flash.display::DisplayObject"  :override t )
  (:method-get "showDefaultContextMenu" () "Boolean"  :native t )
  (:method-set "width" (("value" "Number")) "void"  :override t )
  (:method-set "showDefaultContextMenu" (("value" "Boolean")) "void"  :native t )
  (:method-set "name" (("value" "String")) "void"  :override t )
  (:method "setChildIndex" (("child" "flash.display::DisplayObject") ("index" "int")) "void"  :override t )
  (:method-set "align" (("value" "String")) "void"  :native t )
  (:method-set "scaleMode" (("value" "String")) "void"  :native t )
  (:method-set "scaleX" (("value" "Number")) "void"  :override t )
  (:method "swapChildrenAt" (("index1" "int") ("index2" "int")) "void"  :native t :override t )
  (:method-set "scaleY" (("value" "Number")) "void"  :override t )
  (:method-set "scaleZ" (("value" "Number")) "void"  :override t )
  (:method-get "colorCorrection" () "String"  :native t )
  (:method-set "scrollRect" (("value" "flash.geom::Rectangle")) "void"  :override t )
  (:method-get "numChildren" () "int"  :override t )
  (:method-get "height" () "Number"  :override t )
  (:method-set "blendMode" (("value" "String")) "void"  :override t )
  (:method-get "textSnapshot" () "flash.text::TextSnapshot"  :override t )
  (:method-set "scale9Grid" (("value" "flash.geom::Rectangle")) "void"  :override t )
  (:method-get "fullScreenWidth" () "uint"  :native t )
  (:method-set "focus" (("newFocus" "flash.display::InteractiveObject")) "void"  :native t )
  (:method-set "fullScreenSourceRect" (("value" "flash.geom::Rectangle")) "void"  :native t )
  (:method-set "rotationY" (("value" "Number")) "void"  :override t )
  (:method-set "quality" (("value" "String")) "void"  :native t )
  (:method-set "rotationZ" (("value" "Number")) "void"  :override t )
  (:method-set "rotationX" (("value" "Number")) "void"  :override t )
  (:method-set "alpha" (("value" "Number")) "void"  :override t )
  (:method-set "focusRect" (("value" "Object")) "void"  :override t )
  (:method-set "accessibilityImplementation" (("value" "flash.accessibility::AccessibilityImplementation")) "void"  :override t )
  (:method-set "colorCorrection" (("value" "String")) "void"  :native t )
  (:method-get "tabChildren" () "Boolean"  :override t )
  (:method-get "mouseChildren" () "Boolean"  :override t )
  (:method-get "stageHeight" () "int"  :native t )
  (:method-set "cacheAsBitmap" (("value" "Boolean")) "void"  :override t )
  (:method-set "mouseEnabled" (("value" "Boolean")) "void"  :override t )
  (:method-set "accessibilityProperties" (("value" "flash.accessibility::AccessibilityProperties")) "void"  :override t )
  (:method "invalidate" () "void"  :native t )
  (:method "removeChildAt" (("index" "int")) "flash.display::DisplayObject"  :native t :override t )
  (:method "addEventListener" (("type" "String") ("listener" "Function") &optional (("useCapture" "Boolean") nil #|| false||# ) (("priority" "int") 0) (("useWeakReference" "Boolean") nil #|| false||# )) "void"  :override t )
  (:method-set "height" (("value" "Number")) "void"  :override t )
  (:method "dispatchEvent" (("event" "flash.events::Event")) "Boolean"  :override t )
  (:method-set "stageWidth" (("value" "int")) "void"  :native t )
  (:method-get "width" () "Number"  :override t )
  (:method "requireOwnerPermissions" () "void" :namespace-type :private  :native t )
  (:method-get "focus" () "flash.display::InteractiveObject"  :native t )
  (:method-set "frameRate" (("value" "Number")) "void"  :native t )
  (:method-set "contextMenu" (("value" "flash.ui::ContextMenu")) "void"  :override t )
  (:method-set "opaqueBackground" (("value" "Object")) "void"  :override t )
  (:method-set "mask" (("value" "flash.display::DisplayObject")) "void"  :override t )
  (:method-get "fullScreenSourceRect" () "flash.geom::Rectangle"  :native t )
  (:method-get "fullScreenHeight" () "uint"  :native t )
  (:method-set "visible" (("value" "Boolean")) "void"  :override t )
  (:method-set "displayState" (("value" "String")) "void"  :native t )
  (:method-set "transform" (("value" "flash.geom::Transform")) "void"  :override t )
  (:method-get "stageWidth" () "int"  :native t )
  (:method-get "frameRate" () "Number"  :native t )
  (:method-get "colorCorrectionSupport" () "String"  :native t )
  (:method-get "displayState" () "String"  :native t )
  (:method-set "x" (("value" "Number")) "void"  :override t )
  (:method-set "y" (("value" "Number")) "void"  :override t )
  (:method-set "z" (("value" "Number")) "void"  :override t )
  (:method-set "filters" (("value" "Array")) "void"  :override t )
  (:method-set "tabChildren" (("value" "Boolean")) "void"  :override t )
  (:method-set "tabEnabled" (("value" "Boolean")) "void"  :override t )
  (:method "addChild" (("child" "flash.display::DisplayObject")) "flash.display::DisplayObject"  :override t )
  (:method-set "rotation" (("value" "Number")) "void"  :override t )
  (:method-get "stageFocusRect" () "Boolean"  :native t )
  (:method-get "quality" () "String"  :native t )
))


(:class "flash.display::GraphicsSolidFill" :extends "Object" :implements ("GraphicsSolidFill.as$196::IGraphicsData"  ) :public t :final t 
 :properties (
  (:constructor "GraphicsSolidFill" (&optional (("color" "uint") 0) (("alpha" "Number") 1)) "*")
  (:variable :name "color"    :type "uint" :value 0 )
  (:variable :name "alpha"    :type "Number" :value 1 )
))


(:class "flash.geom::Transform" :extends "Object" :public t 
 :properties (
  (:constructor "Transform" (("displayObject" "flash.display::DisplayObject")) "*")
  (:method-get "matrix" () "flash.geom::Matrix"  :native t )
  (:method-set "matrix" (("value" "flash.geom::Matrix")) "void"  :native t )
  (:method-set "matrix3D" (("m" "flash.geom::Matrix3D")) "*"  :native t )
  (:method-get "colorTransform" () "flash.geom::ColorTransform"  :native t )
  (:method-get "perspectiveProjection" () "flash.geom::PerspectiveProjection"  :native t )
  (:method-get "concatenatedMatrix" () "flash.geom::Matrix"  :native t )
  (:method-get "matrix3D" () "flash.geom::Matrix3D"  :native t )
  (:method "getRelativeMatrix3D" (("relativeTo" "flash.display::DisplayObject")) "flash.geom::Matrix3D"  :native t )
  (:method-set "perspectiveProjection" (("pm" "flash.geom::PerspectiveProjection")) "void"  :native t )
  (:method-get "concatenatedColorTransform" () "flash.geom::ColorTransform"  :native t )
  (:method-set "colorTransform" (("value" "flash.geom::ColorTransform")) "void"  :native t )
  (:method-get "pixelBounds" () "flash.geom::Rectangle"  :native t )
))


(:class "flash.ui::ContextMenuClipboardItems" :extends "Object" :public t :final t 
 :properties (
  (:constructor "ContextMenuClipboardItems" () "*")
  (:variable :name "cut"    :type "Boolean" :value nil #|| false||#  )
  (:variable :name "paste"    :type "Boolean" :value nil #|| false||#  )
  (:variable :name "copy"    :type "Boolean" :value nil #|| false||#  )
  (:variable :name "selectAll"    :type "Boolean" :value t #|| true||#  )
  (:variable :name "clear"    :type "Boolean" :value nil #|| false||#  )
  (:method "clone" () "flash.ui::ContextMenuClipboardItems"  )
))


(:class "flash.system::Security" :extends "Object" :public t :final t 
 :properties (
  (:method "showSettings" (&optional (("panel" "String") "default")) "void"  :native t :static t :final t )
  (:method-get "sandboxType" () "String"  :native t :static t :final t )
  (:method-get "exactSettings" () "Boolean"  :native t :static t :final t )
  (:constant :name "LOCAL_TRUSTED"    :type "String" :value "localTrusted" :static t )
  (:method-set "exactSettings" (("value" "Boolean")) "void"  :native t :static t :final t )
  (:constant :name "REMOTE"    :type "String" :value "remote" :static t )
  (:constant :name "LOCAL_WITH_FILE"    :type "String" :value "localWithFile" :static t )
  (:method "allowDomain" () "void"  :native t :static t :final t )
  (:method "allowInsecureDomain" () "void"  :native t :static t :final t )
  (:method "loadPolicyFile" (("url" "String")) "void"  :native t :static t :final t )
  (:method-set "disableAVM1Loading" (("value" "Boolean")) "void"  :native t :static t :final t )
  (:constant :name "LOCAL_WITH_NETWORK"    :type "String" :value "localWithNetwork" :static t )
  (:method-get "disableAVM1Loading" () "Boolean"  :native t :static t :final t )
  (:constructor "Security" () "*")
))


(:class "flash.events::KeyboardEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "KEY_DOWN"    :type "String" :value "keyDown" :static t )
  (:constant :name "KEY_UP"    :type "String" :value "keyUp" :static t )
  (:constructor "KeyboardEvent" (("type" "String") &optional (("bubbles" "Boolean") t #|| true||# ) (("cancelable" "Boolean") nil #|| false||# ) (("charCode" "uint") 0) (("keyCode" "uint") 0) (("keyLocation" "uint") 0) (("ctrlKey" "Boolean") nil #|| false||# ) (("altKey" "Boolean") nil #|| false||# ) (("shiftKey" "Boolean") nil #|| false||# )) "*")
  (:method-set "shiftKey" (("value" "Boolean")) "void"  )
  (:method-get "keyLocation" () "uint"  )
  (:method-set "charCode" (("value" "uint")) "void"  )
  (:method "updateAfterEvent" () "void"  :native t )
  (:variable :name "m_altKey"  :namespace-type :private   :type "Boolean" )
  (:method-get "keyCode" () "uint"  )
  (:variable :name "m_shiftKey"  :namespace-type :private   :type "Boolean" )
  (:method-set "keyCode" (("value" "uint")) "void"  )
  (:variable :name "m_keyCode"  :namespace-type :private   :type "uint" )
  (:method "clone" () "flash.events::Event"  :override t )
  (:variable :name "m_keyLocation"  :namespace-type :private   :type "uint" )
  (:method-get "charCode" () "uint"  )
  (:method-set "ctrlKey" (("value" "Boolean")) "void"  )
  (:variable :name "m_ctrlKey"  :namespace-type :private   :type "Boolean" )
  (:method "toString" () "String"  :override t )
  (:method-set "keyLocation" (("value" "uint")) "void"  )
  (:method-set "altKey" (("value" "Boolean")) "void"  )
  (:method-get "ctrlKey" () "Boolean"  )
  (:variable :name "m_charCode"  :namespace-type :private   :type "uint" )
  (:method-get "altKey" () "Boolean"  )
  (:method-get "shiftKey" () "Boolean"  )
))


(:class "flash.display::SpreadMethod" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "PAD"    :type "String" :value "pad" :static t )
  (:constant :name "REPEAT"    :type "String" :value "repeat" :static t )
  (:constant :name "REFLECT"    :type "String" :value "reflect" :static t )
  (:constructor "SpreadMethod" () "*")
))


(:class "flash.display::ShaderInput" :extends "Object" :public t :final t :dynamic t
 :properties (
  (:constructor "ShaderInput" () "*")
  (:method-get "channels" () "int"  :native t )
  (:method-get "index" () "int"  :native t )
  (:method-set "input" (("input" "Object")) "void"  :native t )
  (:method-get "width" () "int"  :native t )
  (:method-get "height" () "int"  :native t )
  (:method-get "input" () "Object"  :native t )
  (:method-set "width" (("value" "int")) "void"  :native t )
  (:method-set "height" (("value" "int")) "void"  :native t )
))


(:class "flash.display::ShaderParameterType" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "INT2"    :type "String" :value "int2" :static t )
  (:constant :name "INT3"    :type "String" :value "int3" :static t )
  (:constant :name "INT4"    :type "String" :value "int4" :static t )
  (:constant :name "BOOL2"    :type "String" :value "bool2" :static t )
  (:constant :name "BOOL3"    :type "String" :value "bool3" :static t )
  (:constant :name "BOOL4"    :type "String" :value "bool4" :static t )
  (:constant :name "INT"    :type "String" :value "int" :static t )
  (:constant :name "BOOL"    :type "String" :value "bool" :static t )
  (:constant :name "MATRIX2X2"    :type "String" :value "matrix2x2" :static t )
  (:constant :name "MATRIX3X3"    :type "String" :value "matrix3x3" :static t )
  (:constant :name "MATRIX4X4"    :type "String" :value "matrix4x4" :static t )
  (:constant :name "FLOAT2"    :type "String" :value "float2" :static t )
  (:constant :name "FLOAT3"    :type "String" :value "float3" :static t )
  (:constant :name "FLOAT"    :type "String" :value "float" :static t )
  (:constant :name "FLOAT4"    :type "String" :value "float4" :static t )
  (:constructor "ShaderParameterType" () "*")
))


(:class "flash.events::EventPhase" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "BUBBLING_PHASE"    :type "uint" :value 3 :static t )
  (:constant :name "AT_TARGET"    :type "uint" :value 2 :static t )
  (:constant :name "CAPTURING_PHASE"    :type "uint" :value 1 :static t )
  (:constructor "EventPhase" () "*")
))


(:class "flash.text.engine::TextLine" :extends "flash.display::DisplayObjectContainer" :public t :final t 
 :properties (
  (:constant :name "MAX_LINE_WIDTH"    :type "int" :value 1000000 :static t )
  (:constructor "TextLine" () "*")
  (:method-get "mirrorRegions" () "__AS3__.vec::Vector.<flash.text.engine::TextLineMirrorRegion>"  :native t )
  (:method-get "descent" () "Number"  :native t )
  (:method "getAtomGraphic" (("atomIndex" "int")) "flash.display::DisplayObject"  :native t )
  (:method "getBaselinePosition" (("baseline" "String")) "Number"  :native t )
  (:method-get "nextLine" () "flash.text.engine::TextLine"  :native t )
  (:method "getMirrorRegion" (("mirror" "flash.events::EventDispatcher")) "flash.text.engine::TextLineMirrorRegion"  )
  (:method-get "previousLine" () "flash.text.engine::TextLine"  :native t )
  (:method "dump" () "String"  :native t )
  (:method "doGetAtomIndexAtPoint" (("x" "Number") ("y" "Number")) "int" :namespace-type :private  :native t )
  (:method "getAtomBidiLevel" (("atomIndex" "int")) "int"  :native t )
  (:method "getAtomIndexAtPoint" (("stageX" "Number") ("stageY" "Number")) "int"  )
  (:method-get "unjustifiedTextWidth" () "Number"  :native t )
  (:variable :name "userData"    :type "null" )
  (:method-set "tabEnabled" (("enabled" "Boolean")) "void"  :override t )
  (:method-get "textWidth" () "Number"  :native t )
  (:method-get "ascent" () "Number"  :native t )
  (:method-set "contextMenu" (("cm" "flash.ui::ContextMenu")) "void"  :override t )
  (:method "getAtomIndexAtCharIndex" (("charIndex" "int")) "int"  )
  (:method-get "textBlock" () "flash.text.engine::TextBlock"  :native t )
  (:method "getAtomWordBoundaryOnLeft" (("atomIndex" "int")) "Boolean"  :native t )
  (:method "getAtomTextBlockBeginIndex" (("atomIndex" "int")) "int"  :native t )
  (:method "getAtomBounds" (("atomIndex" "int")) "flash.geom::Rectangle"  :native t )
  (:method-set "validity" (("value" "String")) "void"  :native t )
  (:method-set "tabChildren" (("enable" "Boolean")) "void"  :override t )
  (:method-get "textBlockBeginIndex" () "int"  :native t )
  (:method-get "hasGraphicElement" () "Boolean"  :native t )
  (:method "getAtomTextBlockEndIndex" (("atomIndex" "int")) "int"  :native t )
  (:method-get "validity" () "String"  :native t )
  (:method-get "textHeight" () "Number"  :native t )
  (:method-get "specifiedWidth" () "Number"  :native t )
  (:method-set "focusRect" (("focusRect" "Object")) "void"  :override t )
  (:method "getAtomTextRotation" (("atomIndex" "int")) "String"  :native t )
  (:method-set "tabIndex" (("index" "int")) "void"  :override t )
  (:method-get "rawTextLength" () "int"  :native t )
  (:method "getAtomCenter" (("atomIndex" "int")) "Number"  :native t )
  (:method-get "atomCount" () "int"  :native t )
  (:method "flushAtomData" () "void"  :native t )
))


(:class "flash.display::PixelSnapping" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ALWAYS"    :type "String" :value "always" :static t )
  (:constant :name "NEVER"    :type "String" :value "never" :static t )
  (:constant :name "AUTO"    :type "String" :value "auto" :static t )
  (:constructor "PixelSnapping" () "*")
))


(:class "flash.text::TextLineMetrics" :extends "Object" :public t 
 :properties (
  (:constructor "TextLineMetrics" (("x" "Number") ("width" "Number") ("height" "Number") ("ascent" "Number") ("descent" "Number") ("leading" "Number")) "*")
  (:variable :name "ascent"    :type "Number" )
  (:variable :name "width"    :type "Number" )
  (:variable :name "height"    :type "Number" )
  (:variable :name "leading"    :type "Number" )
  (:variable :name "x"    :type "Number" )
  (:variable :name "descent"    :type "Number" )
))


(:class "flash.net::FileReference" :extends "flash.events::EventDispatcher" :public t 
 :properties (
  (:constructor "FileReference" () "*")
  (:method "upload" (("request" "flash.net::URLRequest") &optional (("uploadDataFieldName" "String") "Filedata") (("testUpload" "Boolean") nil #|| false||# )) "void"  :native t )
  (:method "_load" (("dest" "flash.utils::ByteArray")) "void" :namespace-type :private  :native t )
  (:method "load" () "void"  )
  (:method-get "size" () "uint"  :native t )
  (:method-get "type" () "String"  :native t )
  (:method "browse" (&optional ("typeFilter" "Array")) "Boolean"  :native t )
  (:method-get "name" () "String"  :native t )
  (:method-get "creator" () "String"  :native t )
  (:method-get "creationDate" () "Date"  :native t )
  (:method "download" (("request" "flash.net::URLRequest") &optional ("defaultFileName" "String")) "void"  :native t )
  (:method-get "modificationDate" () "Date"  :native t )
  (:method-get "data" () "flash.utils::ByteArray"  :native t )
  (:method "cancel" () "void"  :native t )
  (:method "_save" (("data" "flash.utils::ByteArray") ("defaultFileName" "String")) "void" :namespace-type :private  :native t )
  (:method "save" ("data" &optional ("defaultFileName" "String")) "void"  )
))


(:class "flash.display::StageScaleMode" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "EXACT_FIT"    :type "String" :value "exactFit" :static t )
  (:constant :name "NO_BORDER"    :type "String" :value "noBorder" :static t )
  (:constant :name "NO_SCALE"    :type "String" :value "noScale" :static t )
  (:constant :name "SHOW_ALL"    :type "String" :value "showAll" :static t )
  (:constructor "StageScaleMode" () "*")
))


(:class "flash.net::SharedObjectFlushStatus" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "FLUSHED"    :type "String" :value "flushed" :static t )
  (:constant :name "PENDING"    :type "String" :value "pending" :static t )
  (:constructor "SharedObjectFlushStatus" () "*")
))


(:class "flash.text::TextFieldAutoSize" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "CENTER"    :type "String" :value "center" :static t )
  (:constant :name "LEFT"    :type "String" :value "left" :static t )
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constant :name "RIGHT"    :type "String" :value "right" :static t )
  (:constructor "TextFieldAutoSize" () "*")
))


(:class "flash.printing::PrintJobOrientation" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "LANDSCAPE"    :type "String" :value "landscape" :static t )
  (:constant :name "PORTRAIT"    :type "String" :value "portrait" :static t )
  (:constructor "PrintJobOrientation" () "*")
))


(:class "flash.events::HTTPStatusEvent" :extends "flash.events::Event" :public t 
 :properties (
  (:constant :name "HTTP_STATUS"    :type "String" :value "httpStatus" :static t )
  (:constructor "HTTPStatusEvent" (("type" "String") &optional (("bubbles" "Boolean") nil #|| false||# ) (("cancelable" "Boolean") nil #|| false||# ) (("status" "int") 0)) "*")
  (:method-get "status" () "int"  )
  (:variable :name "m_status"  :namespace-type :private   :type "int" )
  (:method "toString" () "String"  :override t )
  (:method "clone" () "flash.events::Event"  :override t )
))


(:class "flash.filters::ConvolutionFilter" :extends "flash.filters::BitmapFilter" :public t 
 :properties (
  (:constructor "ConvolutionFilter" (&optional (("matrixX" "Number") 0) (("matrixY" "Number") 0) ("matrix" "Array") (("divisor" "Number") 1) (("bias" "Number") 0) (("preserveAlpha" "Boolean") t #|| true||# ) (("clamp" "Boolean") t #|| true||# ) (("color" "uint") 0) (("alpha" "Number") 0)) "*")
  (:method-get "matrix" () "Array"  :native t )
  (:method-set "matrix" (("value" "Array")) "void"  :native t )
  (:method-get "color" () "uint"  :native t )
  (:method-set "preserveAlpha" (("value" "Boolean")) "void"  :native t )
  (:method-get "alpha" () "Number"  :native t )
  (:method-set "color" (("value" "uint")) "void"  :native t )
  (:method-set "bias" (("value" "Number")) "void"  :native t )
  (:method-set "alpha" (("value" "Number")) "void"  :native t )
  (:method-set "matrixX" (("value" "Number")) "void"  :native t )
  (:method-set "matrixY" (("value" "Number")) "void"  :native t )
  (:method-get "preserveAlpha" () "Boolean"  :native t )
  (:method-set "clamp" (("value" "Boolean")) "void"  :native t )
  (:method-get "matrixX" () "Number"  :native t )
  (:method-get "matrixY" () "Number"  :native t )
  (:method-get "bias" () "Number"  :native t )
  (:method-get "clamp" () "Boolean"  :native t )
  (:method-set "divisor" (("value" "Number")) "void"  :native t )
  (:method "clone" () "flash.filters::BitmapFilter"  :override t )
  (:method-get "divisor" () "Number"  :native t )
))


(:class "flash.ui::KeyLocation" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "NUM_PAD"    :type "uint" :value 3 :static t )
  (:constant :name "LEFT"    :type "uint" :value 1 :static t )
  (:constant :name "RIGHT"    :type "uint" :value 2 :static t )
  (:constant :name "STANDARD"    :type "uint" :value 0 :static t )
  (:constructor "KeyLocation" () "*")
))


(:class "flash.accessibility::Accessibility" :extends "Object" :public t :final t 
 :properties (
  (:method "sendEvent" (("source" "flash.display::DisplayObject") ("childID" "uint") ("eventType" "uint") &optional (("nonHTML" "Boolean") nil #|| false||# )) "void"  :native t :static t :final t )
  (:method "updateProperties" () "void"  :native t :static t :final t )
  (:method-get "active" () "Boolean"  :native t :static t :final t )
  (:constructor "Accessibility" () "*")
))


(:class "flash.geom::PerspectiveProjection" :extends "Object" :public t 
 :properties (
  (:constructor "PerspectiveProjection" () "*")
  (:method-get "projectionCenter" () "flash.geom::Point"  :native t )
  (:method "toMatrix3D" () "flash.geom::Matrix3D"  :native t )
  (:method-get "fieldOfView" () "Number"  :native t )
  (:method-set "projectionCenter" (("p" "flash.geom::Point")) "*"  :native t )
  (:method-get "focalLength" () "Number"  :native t )
  (:method-set "fieldOfView" (("fieldOfViewAngleInDegrees" "Number")) "void"  :native t )
  (:method-set "focalLength" (("value" "Number")) "void"  :native t )
))


(:class "flash.display::ActionScriptVersion" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "ACTIONSCRIPT2"    :type "uint" :value 2 :static t )
  (:constant :name "ACTIONSCRIPT3"    :type "uint" :value 3 :static t )
  (:constructor "ActionScriptVersion" () "*")
))


(:class "flash.net::NetStreamPlayOptions" :extends "flash.events::EventDispatcher" :public t :dynamic t
 :properties (
  (:constructor "NetStreamPlayOptions" () "*")
  (:variable :name "oldStreamName"    :type "String" )
  (:variable :name "len"    :type "Number" )
  (:variable :name "start"    :type "Number" )
  (:variable :name "streamName"    :type "String" )
  (:variable :name "transition"    :type "String" )
))


(:class "flash.media::SoundCodec" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "SPEEX"    :type "String" :value "Speex" :static t )
  (:constant :name "NELLYMOSER"    :type "String" :value "NellyMoser" :static t )
  (:constructor "SoundCodec" () "*")
))


(:class "flash.display::TriangleCulling" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "NEGATIVE"    :type "String" :value "negative" :static t )
  (:constant :name "NONE"    :type "String" :value "none" :static t )
  (:constant :name "POSITIVE"    :type "String" :value "positive" :static t )
  (:constructor "TriangleCulling" () "*")
))


(:class "flash.text.engine::DigitWidth" :extends "Object" :public t :final t 
 :properties (
  (:constant :name "DEFAULT"    :type "String" :value "default" :static t )
  (:constant :name "PROPORTIONAL"    :type "String" :value "proportional" :static t )
  (:constant :name "TABULAR"    :type "String" :value "tabular" :static t )
  (:constructor "DigitWidth" () "*")
))


(:class "authoring::authObject" :extends "Object" :public t 
 :properties (
  (:method-set "offScreenSurfaceRenderingEnabled" (("value" "Boolean")) "void"  :native t :static t :final t )
  (:method-get "offScreenSurfaceRenderingEnabled" () "Boolean"  :native t :static t :final t )
  (:constructor "authObject" (("key" "uint")) "*")
  (:method "FrameOffset" () "int"  :native t )
  (:method "CacheAsBitmap" () "Boolean"  :native t )
  (:method "EndPosition" () "int"  :native t )
  (:method "IsSelected" () "Boolean"  :native t )
  (:method-get "Key" () "uint"  :native t )
  (:method "IsVisible" (("inThumbnailPreview" "Boolean")) "Boolean"  :native t )
  (:method "StartPosition" () "int"  :native t )
  (:method "HasShapeSelection" () "Boolean"  :native t )
  (:method "MotionPath" () "authoring::authObject"  :native t )
  (:method "Bounds" (("flags" "uint") &optional (("minFrame" "int") -16000) (("maxFrame" "int") 16000)) "flash.geom::Rectangle"  :native t )
  (:method "ThreeDTranslationHandlePoints" () "Array"  :native t )
  (:method "ColorXForm" () "flash.geom::ColorTransform"  :native t )
  (:method-get "Type" () "uint"  :native t )
  (:method "CenterPoint" () "flash.geom::Point"  :native t )
  (:method-get "SwfKey" () "uint"  :native t )
  (:method "IsFloater" () "Boolean"  :native t )
  (:method "OutlineColor" () "uint"  :native t )
  (:method "Filters" () "Array"  :native t )
  (:method "BlendingMode" () "String"  :native t )
  (:method "OutlineMode" () "Boolean"  :native t )
  (:method "FrameType" () "uint"  :native t )
  (:method "Locked" () "Boolean"  :native t )
  (:method-get "FirstChild" () "authoring::authObject"  :native t )
  (:method "ThreeDMatrix" () "flash.geom::Matrix3D"  :native t )
  (:method-get "NextSibling" () "authoring::authObject"  :native t )
  (:method "SymbolBehavior" () "int"  :native t )
  (:method "Scale9Grid" () "flash.geom::Rectangle"  :native t )
  (:method "LivePreviewSize" () "flash.geom::Point"  :native t )
  (:method "RegistrationPoint" () "flash.geom::Point"  :native t )
  (:method "HasEmptyPath" () "Boolean"  :native t )
  (:method "FrameForFrameNumber" (("frameNum" "int")) "authoring::authObject"  :native t )
  (:method "SymbolMode" () "int"  :native t )
  (:method "IsPrimitive" () "Boolean"  :native t )
  (:method "ObjMatrix" () "flash.geom::Matrix"  :native t )
))


