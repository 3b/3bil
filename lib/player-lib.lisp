(in-package :as3-compiler)

;;; top level globals/static/whatever functions that didn't get added by the
;;; automatic reflection stuff in player-class-decl.lisp

(let ((*symbol-table* *player-symbol-table*))
  ;;; *

  (swf-ffi-defun-lex flash::array "" "Array" (&rest args) Array)
  (swf-ffi-defun-lex flash::Boolean "" "Boolean" (expr) Boolean)
  (swf-ffi-defun-lex flash::date "" "Date" () String)
  (swf-ffi-defun-lex flash::decode-uri "" "decodeURI" (uri) String)
  (swf-ffi-defun-lex flash::decode-uri-component "" "decodeURIComponent" (uri) String)
  (swf-ffi-defun-lex flash::encode-uri "" "encodeURI" (uri) String)
  (swf-ffi-defun-lex flash::encode-uri-component "" "encodeURIComponent" (uri) String)
  (swf-ffi-defun-lex flash::escape "" "escape" (string) String)
  (swf-ffi-defun-lex flash::int "" "int" (value) int)
  (swf-ffi-defun-lex flash::is-finite "" "isFinite" (number) Boolean)
  (swf-ffi-defun-lex flash::is-nan "" "isNaN" (number) Boolean)
  (swf-ffi-defun-lex flash::is-xml-name "" "isXMLName" (str) Boolean)
  (swf-ffi-defun-lex flash::number "" "Number" (expr) Number)
  (swf-ffi-defun-lex flash::object "" "Object" (value) Object)
  (swf-ffi-defun-lex flash::parse-float "" "parseFloat" (string) Number)
  (swf-ffi-defun-lex flash::parse-int "" "parseInt" (string &optional (radix 0)) Number)
  (swf-ffi-defun-lex flash::string "" "String" (expression) String)
  (swf-ffi-defun-lex flash::trace "" "trace" (&rest args) void)
  (swf-ffi-defun-lex flash::uint "" "uint" (value) uint)
  (swf-ffi-defun-lex flash::unescape "" "unescape" (string) String)
  (swf-ffi-defun-lex flash::xml "" "XML" (expression) XML)
  (swf-ffi-defun-lex flash::xml-list "" "XMLList" (expression) XMLList)

  (swf-ffi-defconstant-lex flash::infinity "" "Inifinity" Number)
  (swf-ffi-defconstant-lex flash::negative-infinity "" "-Inifinity" Number)
  (swf-ffi-defconstant-lex flash::nan "" "NaN" Number)
  (swf-ffi-defconstant-lex flash::undefined "" "undefined" *)

;;; Array.*
  (swf-ffi-defun-lex flash::.Array "Array" "Array" (&optional (numElements 0)) :Array)
  (swf-ffi-defun-lex flash::.Array "Array" "Array" (&rest values) :Array)

  (swf-ffi-defmethod flash::.concat :Array "concat" (&rest args):Array)
  (swf-ffi-defmethod flash::.every :Array "every" ((callback :Function) (thisObject * null)) :Boolean)
  (swf-ffi-defmethod flash::.filter :Array "filter" ((callback :Function) (thisObject :* null)):Array)

  (swf-ffi-defmethod flash::.for-each :Array "forEach" ((callback :Function) (thisObject :* null)):void)
  (swf-ffi-defmethod flash::.index-Of :Array "indexOf" ((searchElement :*) (fromIndex :int)) :int)
  (swf-ffi-defmethod flash::.join :Array "join" ((sep :*)) :String)
  (swf-ffi-defmethod flash::.last-Index-Of :Array "lastIndexOf" ((searchElement :*) (fromIndex :int #x7fffffff)) :int)
  (swf-ffi-defmethod flash::.map :Array "map" ((callback :Function) (thisObject :* null)):Array)
  (swf-ffi-defmethod flash::.pop :Array "pop" () :*)
  (swf-ffi-defmethod flash::.push :Array "push" (&rest args) :uint)
  (swf-ffi-defmethod flash::.reverse :Array "reverse" () :Array)
  (swf-ffi-defmethod flash::.shift :Array "shift" ():*)
  (swf-ffi-defmethod flash::.slice :Array "slice" ((startIndex :int 0) (endIndex :int 16777215)) :Array)
  (swf-ffi-defmethod flash::.some :Array "some" ((callback :Function) (thisObject :* null)):Boolean)
  (swf-ffi-defmethod flash::.sort :Array "sort" (&rest args) :Array)
  (swf-ffi-defmethod flash::.sort-on :Array "sortOn" ((fieldName :Object) (options :Object null)):Array)
  (swf-ffi-defmethod flash::.splice :Array "splice" ((startIndex :int) (deleteCount :uint) &rest values) :Array)
  (swf-ffi-defmethod flash::.to-locale-string :Array "toLocaleString" () :String)
  (swf-ffi-defmethod flash::.to-string :Array "toString" ():String)
  (swf-ffi-defmethod flash::.unshift :Array "unshift" (&rest args):uint)


  (swf-ffi-defconstant-lex flash::array.case-insensitive "Array" "CASEINSENSITIVE" uint)
  (swf-ffi-defconstant-lex flash::array.descending "Array" "DESCENDING" uint)
  (swf-ffi-defconstant-lex flash::array.numeric "Array" "NUMERIC" uint)
  (swf-ffi-defconstant-lex flash::array.return-indexed-array "Array" "RETURNINDEXEDARRAY" uint)
  (swf-ffi-defconstant-lex flash::array.unique-sort "Array" "UNIQUESORT" uint)

;;; Boolean.*

  (swf-ffi-defun-lex flash::Boolean "Boolean" "Boolean" ((expression :Object false)):Boolean)
  (swf-ffi-defmethod flash::.to-String :Boolean "toString" ():String)
  (swf-ffi-defmethod flash::.value-Of :Boolean "valueOf" ():Boolean)

;;; Function.*
  (swf-ffi-defmethod flash::.apply :Function "apply" ((this :*) (arg-array :*)):*)
  (swf-ffi-defmethod flash::.call :Function "call" (this &rest args) :*)

;;; int.*
  (swf-ffi-defmethod flash::.to-exponential :int "toExponential" ((fraction-digits :uint)) :string)
  (swf-ffi-defmethod flash::.to-fixed :int "toFixed" ((fraction-digits :uint)) :string)
  (swf-ffi-defmethod flash::.to-precision :int "toPrecision" ((precision :uint)) :string)
  (swf-ffi-defmethod flash::.to-string :int "toString" ((radix :uint)) :string)
  (swf-ffi-defconstant-lex flash::int.max-value "int" "MAX_VALUE" int)
  (swf-ffi-defconstant-lex flash::int.min-value "int" "MIN_VALUE" int)

;;; Math.*

  (swf-ffi-defun-lex flash::math.abs "Math" "abs" (val) :Number)
  (swf-ffi-defun-lex flash::math.acos "Math" "acos" (val) :Number)
  (swf-ffi-defun-lex flash::math.asin "Math" "asin" (val) :Number)
  (swf-ffi-defun-lex flash::math.atan "Math" "atan" (val) :Number)
  (swf-ffi-defun-lex flash::math.atan2 "Math" "atan2" (y x) :Number)
  (swf-ffi-defun-lex flash::math.ceil "Math" "ceil" (val) :Number)
  (swf-ffi-defun-lex flash::math.cos "Math" "cos" (angle-radians) :Number)
  (swf-ffi-defun-lex flash::math.exp "Math" "exp" (val) :Number)
  (swf-ffi-defun-lex flash::math.floor "Math" "floor" (val) :Number)
  (swf-ffi-defun-lex flash::math.log "Math" "log" (val) :Number)
  (swf-ffi-defun-lex flash::math.max "Math" "max" (val1 val2 &rest rest) :Number)
  (swf-ffi-defun-lex flash::math.min "Math" "min" (val1 val2 &rest rest) :Number)
  (swf-ffi-defun-lex flash::math.pow "Math" "pow" (val1 val2):Number)
  (swf-ffi-defun-lex flash::math.random "Math" "random" () :Number)
  (swf-ffi-defun-lex flash::math.round "Math" "round" (val):Number)
  (swf-ffi-defun-lex flash::math.sin "Math" "sin" (angle-Radians):Number)
  (swf-ffi-defun-lex flash::math.sqrt "Math" "sqrt" (val):Number)
  (swf-ffi-defun-lex flash::math.tan "Math" "tan" (angle-Radians):Number)

  (swf-ffi-defconstant-lex flash::math.e "Math" "E" Number)
  (swf-ffi-defconstant-lex flash::math.ln10 "Math" "LN10" Number)
  (swf-ffi-defconstant-lex flash::math.ln2 "Math" "LN2" Number)
  (swf-ffi-defconstant-lex flash::math.log10e "Math" "LOG10E" Number)
  (swf-ffi-defconstant-lex flash::math.log2e "Math" "LOG2E" Number)
  (swf-ffi-defconstant-lex flash::math.pi "Math" "PI" Number)
  (swf-ffi-defconstant-lex flash::math.sqrt1/2 "Math" "SQRT1_2" Number)
  (swf-ffi-defconstant-lex flash::math.sqrt2 "Math" "SQRT2" Number)

;;; String.*


  (swf-ffi-defmethod flash::.char-at :String "charAt" ((index :Number 0)):String)
  (swf-ffi-defmethod flash::.char-code-at :String "charCodeAt" ((index :Number 0)):Number)
  (swf-ffi-defmethod flash::.concat :String "concat" (&rest args):String)
  (swf-ffi-defun-lex flash::string.from-char-code "String" "fromCharCode" (&rest charCodes):String)
  (swf-ffi-defmethod flash::.index-of :String "indexOf" ((val :String) (startIndex :Number 0)):int)
  (swf-ffi-defmethod flash::.last-index-of :String "lastIndexOf" ((val :String) (startIndex :Number #x7FFFFFFF)):int)
  (swf-ffi-defmethod flash::.locale-compare :String "localeCompare" ((other :String) &rest values):int)
  (swf-ffi-defmethod flash::.match :String "match" (pattern):Array)
  (swf-ffi-defmethod flash::.replace :String "replace" (pattern (repl :Object)):String)
  (swf-ffi-defmethod flash::.search :String "search" (pattern):int)
  (swf-ffi-defmethod flash::.slice :String "slice" ((startIndex :Number 0) (endIndex :Number #x7fffffff)):String)
  (swf-ffi-defmethod flash::.split :String "split" (delimiter (limit :Number #x7fffffff)):Array)
  (swf-ffi-defmethod flash::.substr :String "substr" ((startIndex :Number 0) (len :Number #x7fffffff)):String)
  (swf-ffi-defmethod flash::.substring :String "substring" ((startIndex :Number 0) (endIndex :Number #x7fffffff)):String)
  (swf-ffi-defmethod flash::.to-locale-lower-case :String "toLocaleLowerCase" ():String)
  (swf-ffi-defmethod flash::.to-locale-upper-case :String "toLocaleUpperCase" ():String)
  (swf-ffi-defmethod flash::.to-lower-case :String "toLowerCase" ():String)
  (swf-ffi-defmethod flash::.to-string :String "toString" ():String)
  (swf-ffi-defmethod flash::.to-upper-case :String "toUpperCase" ():String)
  (swf-ffi-defmethod flash::.value-of :String "valueOf" ():String)
)