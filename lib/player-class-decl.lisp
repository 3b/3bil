(in-package :as3-compiler)

;; wrapping the whole file in a let makes it take too long to compile, so
;;; we save and restore *symbol-table* for now
;; fixme: use a macro to let bind *symbol-table* for each class def?
(defparameter *%temp-symbol-table%* *symbol-table*)
(setf *symbol-table* *player-symbol-table*)

  (declare-swf-class object ()
    :swf-name "Object"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((+length+ :swf-name "length" :type int))
    :properties
    ()
    :methods
    ((:has-own-property :swf-name "hasOwnProperty" :return-type boolean :declared-by object
          :args ((:index 1 :type * :optional T)))
     (:is-prototype-of :swf-name "isPrototypeOf" :return-type boolean :declared-by object
          :args ((:index 1 :type * :optional T)))
     (:property-is-enumerable :swf-name "propertyIsEnumerable" :return-type boolean :declared-by object
          :args ((:index 1 :type * :optional T)))))

  (declare-swf-class class (object)
    :swf-name "Class"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:prototype :swf-name "prototype" :type * :access :readonly :declared-by class))
    :methods
    ())

  (declare-swf-class function (object)
    :swf-name "Function"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:prototype :swf-name "prototype" :type * :access :readwrite :declared-by function)
     (:length :swf-name "length" :type int :access :readonly :declared-by function))
    :methods
    ())

  (declare-swf-class namespace (object)
    :swf-name "Namespace"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type *))
    :properties
    ((:prefix :swf-name "prefix" :type * :access :readonly :declared-by namespace)
     (:uri :swf-name "uri" :type string :access :readonly :declared-by namespace))
    :methods
    ())

  (declare-swf-class boolean (object)
    :swf-name "Boolean"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ()
    :methods
    ())

  (declare-swf-class number (object)
    :swf-name "Number"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+nan+ :swf-name "NaN" :type number)
     (:+length+ :swf-name "length" :type int)
     (:+positive-infinity+ :swf-name "POSITIVE_INFINITY" :type number)
     (:+max-value+ :swf-name "MAX_VALUE" :type number)
     (:+min-value+ :swf-name "MIN_VALUE" :type number)
     (:+negative-infinity+ :swf-name "NEGATIVE_INFINITY" :type number))
    :properties
    ()
    :methods
    ())

  (declare-swf-class int (object)
    :swf-name "int"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+min-value+ :swf-name "MIN_VALUE" :type int)
     (:+max-value+ :swf-name "MAX_VALUE" :type int)
     (:+length+ :swf-name "length" :type int))
    :properties
    ()
    :methods
    ())

  (declare-swf-class uint (object)
    :swf-name "uint"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+min-value+ :swf-name "MIN_VALUE" :type uint)
     (:+max-value+ :swf-name "MAX_VALUE" :type uint)
     (:+length+ :swf-name "length" :type int))
    :properties
    ()
    :methods
    ())

  (declare-swf-class string (object)
    :swf-name "String"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:length :swf-name "length" :type int :access :readonly :declared-by string))
    :methods
    ())

  (declare-swf-class array (object)
    :swf-name "Array"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+returnindexedarray+ :swf-name "RETURNINDEXEDARRAY" :type uint)
     (:+numeric+ :swf-name "NUMERIC" :type uint)
     (:+uniquesort+ :swf-name "UNIQUESORT" :type uint)
     (:+caseinsensitive+ :swf-name "CASEINSENSITIVE" :type uint)
     (:+length+ :swf-name "length" :type int)
     (:+descending+ :swf-name "DESCENDING" :type uint))
    :properties
    ((:length :swf-name "length" :type uint :access :readwrite :declared-by array))
    :methods
    ())

  (declare-swf-class flash.sampler::stack-frame (object)
    :swf-name "flash.sampler::StackFrame"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+name+ :swf-name "name" :type string)
     (:+line+ :swf-name "line" :type uint)
     (:+file+ :swf-name "file" :type string))
    :properties
    ()
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.sampler::stack-frame
          :args ())))

  (declare-swf-class flash.sampler::sample (object)
    :swf-name "flash.sampler::Sample"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+stack+ :swf-name "stack" :type array)
     (:+time+ :swf-name "time" :type number))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.sampler::new-object-sample (flash.sampler::sample)
    :swf-name "flash.sampler::NewObjectSample"
    ;; :supers (flash.sampler::sample object)
    ;;   = ("flash.sampler::Sample" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+type+ :swf-name "type" :type class)
     (:+id+ :swf-name "id" :type number)
     (:+stack+ :swf-name "stack" :type array)
     (:+time+ :swf-name "time" :type number))
    :properties
    ((:object :swf-name "object" :type * :access :readonly :declared-by flash.sampler::new-object-sample))
    :methods
    ())

  (declare-swf-class flash.sampler::delete-object-sample (flash.sampler::sample)
    :swf-name "flash.sampler::DeleteObjectSample"
    ;; :supers (flash.sampler::sample object)
    ;;   = ("flash.sampler::Sample" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+size+ :swf-name "size" :type number)
     (:+id+ :swf-name "id" :type number)
     (:+stack+ :swf-name "stack" :type array)
     (:+time+ :swf-name "time" :type number))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.system::system (object)
    :swf-name "flash.system::System"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::event (object)
    :swf-name "flash.events::Event"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+complete+ :swf-name "COMPLETE" :type string)
     (:+close+ :swf-name "CLOSE" :type string)
     (:+render+ :swf-name "RENDER" :type string)
     (:+removed-from-stage+ :swf-name "REMOVED_FROM_STAGE" :type string)
     (:+change+ :swf-name "CHANGE" :type string)
     (:+cancel+ :swf-name "CANCEL" :type string)
     (:+added-to-stage+ :swf-name "ADDED_TO_STAGE" :type string)
     (:+fullscreen+ :swf-name "FULLSCREEN" :type string)
     (:+tab-enabled-change+ :swf-name "TAB_ENABLED_CHANGE" :type string)
     (:+removed+ :swf-name "REMOVED" :type string)
     (:+tab-children-change+ :swf-name "TAB_CHILDREN_CHANGE" :type string)
     (:+open+ :swf-name "OPEN" :type string)
     (:+sound-complete+ :swf-name "SOUND_COMPLETE" :type string)
     (:+mouse-leave+ :swf-name "MOUSE_LEAVE" :type string)
     (:+id3+ :swf-name "ID3" :type string)
     (:+init+ :swf-name "INIT" :type string)
     (:+enter-frame+ :swf-name "ENTER_FRAME" :type string)
     (:+tab-index-change+ :swf-name "TAB_INDEX_CHANGE" :type string)
     (:+activate+ :swf-name "ACTIVATE" :type string)
     (:+scroll+ :swf-name "SCROLL" :type string)
     (:+unload+ :swf-name "UNLOAD" :type string)
     (:+deactivate+ :swf-name "DEACTIVATE" :type string)
     (:+connect+ :swf-name "CONNECT" :type string)
     (:+select+ :swf-name "SELECT" :type string)
     (:+resize+ :swf-name "RESIZE" :type string)
     (:+added+ :swf-name "ADDED" :type string))
    :properties
    ((:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event
          :args ())
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.events::text-event (flash.events::event)
    :swf-name "flash.events::TextEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+text-input+ :swf-name "TEXT_INPUT" :type string)
     (:+link+ :swf-name "LINK" :type string))
    :properties
    ((:text :swf-name "text" :type string :access :readwrite :declared-by flash.events::text-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::text-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::text-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.events::error-event (flash.events::text-event)
    :swf-name "flash.events::ErrorEvent"
    ;; :supers (flash.events::text-event flash.events::event object)
    ;;   = ("flash.events::TextEvent" "flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+error+ :swf-name "ERROR" :type string))
    :properties
    ((:text :swf-name "text" :type string :access :readwrite :declared-by flash.events::text-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::error-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::error-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.events::async-error-event (flash.events::error-event)
    :swf-name "flash.events::AsyncErrorEvent"
    ;; :supers (flash.events::error-event flash.events::text-event
    ;;          flash.events::event object)
    ;;   = ("flash.events::ErrorEvent" "flash.events::TextEvent"
    ;;      "flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+async-error+ :swf-name "ASYNC_ERROR" :type string))
    :properties
    ((:text :swf-name "text" :type string :access :readwrite :declared-by flash.events::text-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::async-error-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::async-error-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.utils::i-data-output ()
    :swf-name "flash.utils::IDataOutput"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:endian :swf-name "endian" :type string :access :readwrite :declared-by flash.utils::i-data-output)
     (:object-encoding :swf-name "objectEncoding" :type uint :access :readwrite :declared-by flash.utils::i-data-output))
    :methods
    ((:write-float :swf-name "writeFloat" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type number :optional NIL)))
     (:write-object :swf-name "writeObject" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type * :optional NIL)))
     (:write-utf :swf-name "writeUTF" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type string :optional NIL)))
     (:write-double :swf-name "writeDouble" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type number :optional NIL)))
     (:write-byte :swf-name "writeByte" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type int :optional NIL)))
     (:write-short :swf-name "writeShort" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type int :optional NIL)))
     (:write-unsigned-int :swf-name "writeUnsignedInt" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type uint :optional NIL)))
     (:write-utf-bytes :swf-name "writeUTFBytes" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type string :optional NIL)))
     (:write-multi-byte :swf-name "writeMultiByte" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:write-bytes :swf-name "writeBytes" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)))
     (:write-boolean :swf-name "writeBoolean" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type boolean :optional NIL)))
     (:write-int :swf-name "writeInt" :return-type void :declared-by flash.utils::i-data-output
          :args ((:index 1 :type int :optional NIL)))))

  (declare-swf-class flash.utils::i-data-input ()
    :swf-name "flash.utils::IDataInput"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:endian :swf-name "endian" :type string :access :readwrite :declared-by flash.utils::i-data-input)
     (:object-encoding :swf-name "objectEncoding" :type uint :access :readwrite :declared-by flash.utils::i-data-input)
     (:bytes-available :swf-name "bytesAvailable" :type uint :access :readonly :declared-by flash.utils::i-data-input))
    :methods
    ((:read-unsigned-int :swf-name "readUnsignedInt" :return-type uint :declared-by flash.utils::i-data-input
          :args ())
     (:read-unsigned-short :swf-name "readUnsignedShort" :return-type uint :declared-by flash.utils::i-data-input
          :args ())
     (:read-byte :swf-name "readByte" :return-type int :declared-by flash.utils::i-data-input
          :args ())
     (:read-double :swf-name "readDouble" :return-type number :declared-by flash.utils::i-data-input
          :args ())
     (:read-float :swf-name "readFloat" :return-type number :declared-by flash.utils::i-data-input
          :args ())
     (:read-utf :swf-name "readUTF" :return-type string :declared-by flash.utils::i-data-input
          :args ())
     (:read-multi-byte :swf-name "readMultiByte" :return-type string :declared-by flash.utils::i-data-input
          :args ((:index 1 :type uint :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:read-object :swf-name "readObject" :return-type * :declared-by flash.utils::i-data-input
          :args ())
     (:read-utf-bytes :swf-name "readUTFBytes" :return-type string :declared-by flash.utils::i-data-input
          :args ((:index 1 :type uint :optional NIL)))
     (:read-unsigned-byte :swf-name "readUnsignedByte" :return-type uint :declared-by flash.utils::i-data-input
          :args ())
     (:read-bytes :swf-name "readBytes" :return-type void :declared-by flash.utils::i-data-input
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)))
     (:read-short :swf-name "readShort" :return-type int :declared-by flash.utils::i-data-input
          :args ())
     (:read-int :swf-name "readInt" :return-type int :declared-by flash.utils::i-data-input
          :args ())
     (:read-boolean :swf-name "readBoolean" :return-type boolean :declared-by flash.utils::i-data-input
          :args ())))

  (declare-swf-class flash.utils::byte-array (object)
    :swf-name "flash.utils::ByteArray"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces (flash.utils::i-data-output flash.utils::i-data-input)
    ;;   = ("flash.utils::IDataOutput" "flash.utils::IDataInput")
    :constants
    ()
    :properties
    ((:object-encoding :swf-name "objectEncoding" :type uint :access :readwrite :declared-by flash.utils::byte-array)
     (:bytes-available :swf-name "bytesAvailable" :type uint :access :readonly :declared-by flash.utils::byte-array)
     (:position :swf-name "position" :type uint :access :readwrite :declared-by flash.utils::byte-array)
     (:length :swf-name "length" :type uint :access :readwrite :declared-by flash.utils::byte-array)
     (:endian :swf-name "endian" :type string :access :readwrite :declared-by flash.utils::byte-array))
    :methods
    ((:read-double :swf-name "readDouble" :return-type number :declared-by flash.utils::byte-array
          :args ())
     (:read-unsigned-short :swf-name "readUnsignedShort" :return-type uint :declared-by flash.utils::byte-array
          :args ())
     (:write-unsigned-int :swf-name "writeUnsignedInt" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type uint :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.utils::byte-array
          :args ())
     (:write-float :swf-name "writeFloat" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type number :optional NIL)))
     (:write-double :swf-name "writeDouble" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type number :optional NIL)))
     (:read-multi-byte :swf-name "readMultiByte" :return-type string :declared-by flash.utils::byte-array
          :args ((:index 1 :type uint :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:write-int :swf-name "writeInt" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type int :optional NIL)))
     (:read-short :swf-name "readShort" :return-type int :declared-by flash.utils::byte-array
          :args ())
     (:write-bytes :swf-name "writeBytes" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)))
     (:read-unsigned-int :swf-name "readUnsignedInt" :return-type uint :declared-by flash.utils::byte-array
          :args ())
     (:write-object :swf-name "writeObject" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type * :optional NIL)))
     (:read-float :swf-name "readFloat" :return-type number :declared-by flash.utils::byte-array
          :args ())
     (:write-utf :swf-name "writeUTF" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type string :optional NIL)))
     (:write-byte :swf-name "writeByte" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type int :optional NIL)))
     (:uncompress :swf-name "uncompress" :return-type void :declared-by flash.utils::byte-array
          :args ())
     (:write-short :swf-name "writeShort" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type int :optional NIL)))
     (:compress :swf-name "compress" :return-type void :declared-by flash.utils::byte-array
          :args ())
     (:write-boolean :swf-name "writeBoolean" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type boolean :optional NIL)))
     (:write-multi-byte :swf-name "writeMultiByte" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:write-utf-bytes :swf-name "writeUTFBytes" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type string :optional NIL)))
     (:read-object :swf-name "readObject" :return-type * :declared-by flash.utils::byte-array
          :args ())
     (:read-byte :swf-name "readByte" :return-type int :declared-by flash.utils::byte-array
          :args ())
     (:read-utf-bytes :swf-name "readUTFBytes" :return-type string :declared-by flash.utils::byte-array
          :args ((:index 1 :type uint :optional NIL)))
     (:read-int :swf-name "readInt" :return-type int :declared-by flash.utils::byte-array
          :args ())
     (:read-utf :swf-name "readUTF" :return-type string :declared-by flash.utils::byte-array
          :args ())
     (:read-bytes :swf-name "readBytes" :return-type void :declared-by flash.utils::byte-array
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)))
     (:read-unsigned-byte :swf-name "readUnsignedByte" :return-type uint :declared-by flash.utils::byte-array
          :args ())
     (:read-boolean :swf-name "readBoolean" :return-type boolean :declared-by flash.utils::byte-array
          :args ())))

  (declare-swf-class error (object)
    :swf-name "Error"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class definition-error (error)
    :swf-name "DefinitionError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class eval-error (error)
    :swf-name "EvalError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class range-error (error)
    :swf-name "RangeError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class reference-error (error)
    :swf-name "ReferenceError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class security-error (error)
    :swf-name "SecurityError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class syntax-error (error)
    :swf-name "SyntaxError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class type-error (error)
    :swf-name "TypeError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class uri-error (error)
    :swf-name "URIError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class verify-error (error)
    :swf-name "VerifyError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class uninitialized-error (error)
    :swf-name "UninitializedError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class argument-error (error)
    :swf-name "ArgumentError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class math (object)
    :swf-name "Math"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+e+ :swf-name "E" :type number)
     (:+sqrt2+ :swf-name "SQRT2" :type number)
     (:+log10e+ :swf-name "LOG10E" :type number)
     (:+sqrt1-2+ :swf-name "SQRT1_2" :type number)
     (:+log2e+ :swf-name "LOG2E" :type number)
     (:+ln2+ :swf-name "LN2" :type number)
     (:+ln10+ :swf-name "LN10" :type number)
     (:+pi+ :swf-name "PI" :type number))
    :properties
    ()
    :methods
    ())

  (declare-swf-class reg-exp (object)
    :swf-name "RegExp"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:multiline :swf-name "multiline" :type boolean :access :readonly :declared-by reg-exp)
     (:dotall :swf-name "dotall" :type boolean :access :readonly :declared-by reg-exp)
     (:source :swf-name "source" :type string :access :readonly :declared-by reg-exp)
     (:last-index :swf-name "lastIndex" :type int :access :readwrite :declared-by reg-exp)
     (:ignore-case :swf-name "ignoreCase" :type boolean :access :readonly :declared-by reg-exp)
     (:extended :swf-name "extended" :type boolean :access :readonly :declared-by reg-exp)
     (:global :swf-name "global" :type boolean :access :readonly :declared-by reg-exp))
    :methods
    ())

  (declare-swf-class flash.events::i-event-dispatcher ()
    :swf-name "flash.events::IEventDispatcher"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::i-event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::i-event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::i-event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::i-event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::i-event-dispatcher
          :args ((:index 1 :type string :optional NIL)))))

  (declare-swf-class flash.events::event-dispatcher (object)
    :swf-name "flash.events::EventDispatcher"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ()
    :methods
    ((:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.ui::context-menu-item (flash.events::event-dispatcher)
    :swf-name "flash.ui::ContextMenuItem"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:enabled :swf-name "enabled" :type boolean :access :readwrite :declared-by flash.ui::context-menu-item)
     (:separator-before :swf-name "separatorBefore" :type boolean :access :readwrite :declared-by flash.ui::context-menu-item)
     (:caption :swf-name "caption" :type string :access :readwrite :declared-by flash.ui::context-menu-item)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.ui::context-menu-item))
    :methods
    ((:clone :swf-name "clone" :return-type flash.ui::context-menu-item :declared-by flash.ui::context-menu-item
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.system::application-domain (object)
    :swf-name "flash.system::ApplicationDomain"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:parent-domain :swf-name "parentDomain" :type flash.system::application-domain :access :readonly :declared-by flash.system::application-domain))
    :methods
    ((:get-definition :swf-name "getDefinition" :return-type object :declared-by flash.system::application-domain
          :args ((:index 1 :type string :optional NIL)))
     (:has-definition :swf-name "hasDefinition" :return-type boolean :declared-by flash.system::application-domain
          :args ((:index 1 :type string :optional NIL)))))

  (declare-swf-class flash.display::scene (object)
    :swf-name "flash.display::Scene"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:labels :swf-name "labels" :type array :access :readonly :declared-by flash.display::scene)
     (:num-frames :swf-name "numFrames" :type int :access :readonly :declared-by flash.display::scene)
     (:name :swf-name "name" :type string :access :readonly :declared-by flash.display::scene))
    :methods
    ())

  (declare-swf-class flash.printing::print-job (flash.events::event-dispatcher)
    :swf-name "flash.printing::PrintJob"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:orientation :swf-name "orientation" :type string :access :readonly :declared-by flash.printing::print-job)
     (:page-width :swf-name "pageWidth" :type int :access :readonly :declared-by flash.printing::print-job)
     (:paper-width :swf-name "paperWidth" :type int :access :readonly :declared-by flash.printing::print-job)
     (:page-height :swf-name "pageHeight" :type int :access :readonly :declared-by flash.printing::print-job)
     (:paper-height :swf-name "paperHeight" :type int :access :readonly :declared-by flash.printing::print-job))
    :methods
    ((:send :swf-name "send" :return-type void :declared-by flash.printing::print-job
          :args ())
     (:add-page :swf-name "addPage" :return-type void :declared-by flash.printing::print-job
          :args ((:index 1 :type flash.display::sprite :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional T)
       (:index 3 :type flash.printing::print-job-options :optional T)
       (:index 4 :type int :optional T)))
     (:start :swf-name "start" :return-type boolean :declared-by flash.printing::print-job
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.geom::matrix (object)
    :swf-name "flash.geom::Matrix"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:create-box :swf-name "createBox" :return-type void :declared-by flash.geom::matrix
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional T)
       (:index 4 :type number :optional T)
       (:index 5 :type number :optional T)))
     (:concat :swf-name "concat" :return-type void :declared-by flash.geom::matrix
          :args ((:index 1 :type flash.geom::matrix :optional NIL)))
     (:scale :swf-name "scale" :return-type void :declared-by flash.geom::matrix
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:rotate :swf-name "rotate" :return-type void :declared-by flash.geom::matrix
          :args ((:index 1 :type number :optional NIL)))
     (:clone :swf-name "clone" :return-type flash.geom::matrix :declared-by flash.geom::matrix
          :args ())
     (:delta-transform-point :swf-name "deltaTransformPoint" :return-type flash.geom::point :declared-by flash.geom::matrix
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:transform-point :swf-name "transformPoint" :return-type flash.geom::point :declared-by flash.geom::matrix
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.geom::matrix
          :args ())
     (:create-gradient-box :swf-name "createGradientBox" :return-type void :declared-by flash.geom::matrix
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional T)
       (:index 4 :type number :optional T)
       (:index 5 :type number :optional T)))
     (:identity :swf-name "identity" :return-type void :declared-by flash.geom::matrix
          :args ())
     (:translate :swf-name "translate" :return-type void :declared-by flash.geom::matrix
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:invert :swf-name "invert" :return-type void :declared-by flash.geom::matrix
          :args ())))

  (declare-swf-class flash.display::i-bitmap-drawable ()
    :swf-name "flash.display::IBitmapDrawable"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::display-object (flash.events::event-dispatcher)
    :swf-name "flash.display::DisplayObject"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::bitmap (flash.display::display-object)
    :swf-name "flash.display::Bitmap"
    ;; :supers (flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:smoothing :swf-name "smoothing" :type boolean :access :readwrite :declared-by flash.display::bitmap)
     (:bitmap-data :swf-name "bitmapData" :type flash.display::bitmap-data :access :readwrite :declared-by flash.display::bitmap)
     (:pixel-snapping :swf-name "pixelSnapping" :type string :access :readwrite :declared-by flash.display::bitmap)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.xml::-xml-node (object)
    :swf-name "flash.xml::XMLNode"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:child-nodes :swf-name "childNodes" :type array :access :readonly :declared-by flash.xml::-xml-node)
     (:namespace-uri :swf-name "namespaceURI" :type string :access :readonly :declared-by flash.xml::-xml-node)
     (:local-name :swf-name "localName" :type string :access :readonly :declared-by flash.xml::-xml-node)
     (:attributes :swf-name "attributes" :type object :access :readwrite :declared-by flash.xml::-xml-node)
     (:prefix :swf-name "prefix" :type string :access :readonly :declared-by flash.xml::-xml-node))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.xml::-xml-node
          :args ())
     (:get-prefix-for-namespace :swf-name "getPrefixForNamespace" :return-type string :declared-by flash.xml::-xml-node
          :args ((:index 1 :type string :optional NIL)))
     (:has-child-nodes :swf-name "hasChildNodes" :return-type boolean :declared-by flash.xml::-xml-node
          :args ())
     (:clone-node :swf-name "cloneNode" :return-type flash.xml::-xml-node :declared-by flash.xml::-xml-node
          :args ((:index 1 :type boolean :optional NIL)))
     (:remove-node :swf-name "removeNode" :return-type void :declared-by flash.xml::-xml-node
          :args ())
     (:insert-before :swf-name "insertBefore" :return-type void :declared-by flash.xml::-xml-node
          :args ((:index 1 :type flash.xml::-xml-node :optional NIL)
       (:index 2 :type flash.xml::-xml-node :optional NIL)))
     (:get-namespace-for-prefix :swf-name "getNamespaceForPrefix" :return-type string :declared-by flash.xml::-xml-node
          :args ((:index 1 :type string :optional NIL)))
     (:append-child :swf-name "appendChild" :return-type void :declared-by flash.xml::-xml-node
          :args ((:index 1 :type flash.xml::-xml-node :optional NIL)))))

  (declare-swf-class flash.xml::-xml-document (flash.xml::-xml-node)
    :swf-name "flash.xml::XMLDocument"
    ;; :supers (flash.xml::-xml-node object)
    ;;   = ("flash.xml::XMLNode" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:child-nodes :swf-name "childNodes" :type array :access :readonly :declared-by flash.xml::-xml-node)
     (:namespace-uri :swf-name "namespaceURI" :type string :access :readonly :declared-by flash.xml::-xml-node)
     (:local-name :swf-name "localName" :type string :access :readonly :declared-by flash.xml::-xml-node)
     (:attributes :swf-name "attributes" :type object :access :readwrite :declared-by flash.xml::-xml-node)
     (:prefix :swf-name "prefix" :type string :access :readonly :declared-by flash.xml::-xml-node))
    :methods
    ((:create-text-node :swf-name "createTextNode" :return-type flash.xml::-xml-node :declared-by flash.xml::-xml-document
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.xml::-xml-document
          :args ())
     (:create-element :swf-name "createElement" :return-type flash.xml::-xml-node :declared-by flash.xml::-xml-document
          :args ((:index 1 :type string :optional NIL)))
     (:parse-xml :swf-name "parseXML" :return-type void :declared-by flash.xml::-xml-document
          :args ((:index 1 :type string :optional NIL)))
     (:get-prefix-for-namespace :swf-name "getPrefixForNamespace" :return-type string :declared-by flash.xml::-xml-node
          :args ((:index 1 :type string :optional NIL)))
     (:has-child-nodes :swf-name "hasChildNodes" :return-type boolean :declared-by flash.xml::-xml-node
          :args ())
     (:clone-node :swf-name "cloneNode" :return-type flash.xml::-xml-node :declared-by flash.xml::-xml-node
          :args ((:index 1 :type boolean :optional NIL)))
     (:remove-node :swf-name "removeNode" :return-type void :declared-by flash.xml::-xml-node
          :args ())
     (:insert-before :swf-name "insertBefore" :return-type void :declared-by flash.xml::-xml-node
          :args ((:index 1 :type flash.xml::-xml-node :optional NIL)
       (:index 2 :type flash.xml::-xml-node :optional NIL)))
     (:get-namespace-for-prefix :swf-name "getNamespaceForPrefix" :return-type string :declared-by flash.xml::-xml-node
          :args ((:index 1 :type string :optional NIL)))
     (:append-child :swf-name "appendChild" :return-type void :declared-by flash.xml::-xml-node
          :args ((:index 1 :type flash.xml::-xml-node :optional NIL)))))

  (declare-swf-class flash.text::text-renderer (object)
    :swf-name "flash.text::TextRenderer"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class xml (object)
    :swf-name "XML"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type *))
    :properties
    ()
    :methods
    ())

  (declare-swf-class xml-list (object)
    :swf-name "XMLList"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type *))
    :properties
    ()
    :methods
    ())

  (declare-swf-class q-name (object)
    :swf-name "QName"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type *))
    :properties
    ((:local-name :swf-name "localName" :type string :access :readonly :declared-by q-name)
     (:uri :swf-name "uri" :type * :access :readonly :declared-by q-name))
    :methods
    ())

  (declare-swf-class flash.display::stage-align (object)
    :swf-name "flash.display::StageAlign"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+top-right+ :swf-name "TOP_RIGHT" :type string)
     (:+bottom-left+ :swf-name "BOTTOM_LEFT" :type string)
     (:+left+ :swf-name "LEFT" :type string)
     (:+right+ :swf-name "RIGHT" :type string)
     (:+bottom-right+ :swf-name "BOTTOM_RIGHT" :type string)
     (:+bottom+ :swf-name "BOTTOM" :type string)
     (:+top-left+ :swf-name "TOP_LEFT" :type string)
     (:+top+ :swf-name "TOP" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.errors::illegal-operation-error (error)
    :swf-name "flash.errors::IllegalOperationError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class flash.errors::-io-error (error)
    :swf-name "flash.errors::IOError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class flash.errors::memory-error (error)
    :swf-name "flash.errors::MemoryError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class flash.errors::-eof-error (flash.errors::-io-error)
    :swf-name "flash.errors::EOFError"
    ;; :supers (flash.errors::-io-error error object)
    ;;   = ("flash.errors::IOError" "Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class flash.errors::stack-overflow-error (error)
    :swf-name "flash.errors::StackOverflowError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class flash.errors::script-timeout-error (error)
    :swf-name "flash.errors::ScriptTimeoutError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class flash.errors::invalid-swf-error (error)
    :swf-name "flash.errors::InvalidSWFError"
    ;; :supers (error object)
    ;;   = ("Error" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:error-id :swf-name "errorID" :type int :access :readonly :declared-by error))
    :methods
    ((:get-stack-trace :swf-name "getStackTrace" :return-type string :declared-by error
          :args ())))

  (declare-swf-class flash.display::line-scale-mode (object)
    :swf-name "flash.display::LineScaleMode"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+normal+ :swf-name "NORMAL" :type string)
     (:+vertical+ :swf-name "VERTICAL" :type string)
     (:+horizontal+ :swf-name "HORIZONTAL" :type string)
     (:+none+ :swf-name "NONE" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::font-style (object)
    :swf-name "flash.text::FontStyle"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+bold+ :swf-name "BOLD" :type string)
     (:+bold-italic+ :swf-name "BOLD_ITALIC" :type string)
     (:+italic+ :swf-name "ITALIC" :type string)
     (:+regular+ :swf-name "REGULAR" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.system::-ime-conversion-mode (object)
    :swf-name "flash.system::IMEConversionMode"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+korean+ :swf-name "KOREAN" :type string)
     (:+alphanumeric-full+ :swf-name "ALPHANUMERIC_FULL" :type string)
     (:+chinese+ :swf-name "CHINESE" :type string)
     (:+japanese-katakana-full+ :swf-name "JAPANESE_KATAKANA_FULL" :type string)
     (:+alphanumeric-half+ :swf-name "ALPHANUMERIC_HALF" :type string)
     (:+japanese-katakana-half+ :swf-name "JAPANESE_KATAKANA_HALF" :type string)
     (:+japanese-hiragana+ :swf-name "JAPANESE_HIRAGANA" :type string)
     (:+unknown+ :swf-name "UNKNOWN" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::net-stream (flash.events::event-dispatcher)
    :swf-name "flash.net::NetStream"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:check-policy-file :swf-name "checkPolicyFile" :type boolean :access :readwrite :declared-by flash.net::net-stream)
     (:current-fps :swf-name "currentFPS" :type number :access :readonly :declared-by flash.net::net-stream)
     (:decoded-frames :swf-name "decodedFrames" :type uint :access :readonly :declared-by flash.net::net-stream)
     (:client :swf-name "client" :type object :access :readwrite :declared-by flash.net::net-stream)
     (:bytes-total :swf-name "bytesTotal" :type uint :access :readonly :declared-by flash.net::net-stream)
     (:object-encoding :swf-name "objectEncoding" :type uint :access :readonly :declared-by flash.net::net-stream)
     (:video-codec :swf-name "videoCodec" :type uint :access :readonly :declared-by flash.net::net-stream)
     (:bytes-loaded :swf-name "bytesLoaded" :type uint :access :readonly :declared-by flash.net::net-stream)
     (:buffer-length :swf-name "bufferLength" :type number :access :readonly :declared-by flash.net::net-stream)
     (:audio-codec :swf-name "audioCodec" :type uint :access :readonly :declared-by flash.net::net-stream)
     (:live-delay :swf-name "liveDelay" :type number :access :readonly :declared-by flash.net::net-stream)
     (:time :swf-name "time" :type number :access :readonly :declared-by flash.net::net-stream)
     (:buffer-time :swf-name "bufferTime" :type number :access :readwrite :declared-by flash.net::net-stream)
     (:sound-transform :swf-name "soundTransform" :type flash.media::sound-transform :access :readwrite :declared-by flash.net::net-stream))
    :methods
    ((:receive-audio :swf-name "receiveAudio" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type boolean :optional NIL)))
     (:attach-camera :swf-name "attachCamera" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type flash.media::camera :optional NIL)
       (:index 2 :type int :optional T)))
     (:pause :swf-name "pause" :return-type void :declared-by flash.net::net-stream
          :args ())
     (:send :swf-name "send" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type string :optional NIL)))
     (:play :swf-name "play" :return-type void :declared-by flash.net::net-stream
          :args ())
     (:attach-audio :swf-name "attachAudio" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type flash.media::microphone :optional NIL)))
     (:toggle-pause :swf-name "togglePause" :return-type void :declared-by flash.net::net-stream
          :args ())
     (:resume :swf-name "resume" :return-type void :declared-by flash.net::net-stream
          :args ())
     (:publish :swf-name "publish" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type string :optional T)
       (:index 2 :type string :optional T)))
     (:receive-video-fps :swf-name "receiveVideoFPS" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type number :optional NIL)))
     (:seek :swf-name "seek" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type number :optional NIL)))
     (:receive-video :swf-name "receiveVideo" :return-type void :declared-by flash.net::net-stream
          :args ((:index 1 :type boolean :optional NIL)))
     (:close :swf-name "close" :return-type void :declared-by flash.net::net-stream
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.xml::-xml-node-type (object)
    :swf-name "flash.xml::XMLNodeType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+element-node+ :swf-name "ELEMENT_NODE" :type uint)
     (:+processing-instruct-io-n-node+ :swf-name "PROCESSING_INSTRUCTION_NODE" :type uint)
     (:+document-type-node+ :swf-name "DOCUMENT_TYPE_NODE" :type uint)
     (:+xml-declarat-io-n+ :swf-name "XML_DECLARATION" :type uint)
     (:+comment-node+ :swf-name "COMMENT_NODE" :type uint)
     (:+cdata-node+ :swf-name "CDATA_NODE" :type uint)
     (:+text-node+ :swf-name "TEXT_NODE" :type uint))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::-ime-event (flash.events::text-event)
    :swf-name "flash.events::IMEEvent"
    ;; :supers (flash.events::text-event flash.events::event object)
    ;;   = ("flash.events::TextEvent" "flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+ime-composit-io-n+ :swf-name "IME_COMPOSITION" :type string))
    :properties
    ((:text :swf-name "text" :type string :access :readwrite :declared-by flash.events::text-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::-ime-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::-ime-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.filters::bitmap-filter (object)
    :swf-name "flash.filters::BitmapFilter"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::bitmap-filter
          :args ())))

  (declare-swf-class flash.filters::drop-shadow-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::DropShadowFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:blur-y :swf-name "blurY" :type number :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:angle :swf-name "angle" :type number :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:hide-object :swf-name "hideObject" :type boolean :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:blur-x :swf-name "blurX" :type number :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:color :swf-name "color" :type uint :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:distance :swf-name "distance" :type number :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:inner :swf-name "inner" :type boolean :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:knockout :swf-name "knockout" :type boolean :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:strength :swf-name "strength" :type number :access :readwrite :declared-by flash.filters::drop-shadow-filter)
     (:quality :swf-name "quality" :type int :access :readwrite :declared-by flash.filters::drop-shadow-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::drop-shadow-filter
          :args ())))

  (declare-swf-class flash.utils::timer (flash.events::event-dispatcher)
    :swf-name "flash.utils::Timer"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:delay :swf-name "delay" :type number :access :readwrite :declared-by flash.utils::timer)
     (:running :swf-name "running" :type boolean :access :readonly :declared-by flash.utils::timer)
     (:repeat-count :swf-name "repeatCount" :type int :access :readwrite :declared-by flash.utils::timer)
     (:current-count :swf-name "currentCount" :type int :access :readonly :declared-by flash.utils::timer))
    :methods
    ((:start :swf-name "start" :return-type void :declared-by flash.utils::timer
          :args ())
     (:stop :swf-name "stop" :return-type void :declared-by flash.utils::timer
          :args ())
     (:reset :swf-name "reset" :return-type void :declared-by flash.utils::timer
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.ui::keyboard (object)
    :swf-name "flash.ui::Keyboard"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+numpad-2+ :swf-name "NUMPAD_2" :type uint)
     (:+delete+ :swf-name "DELETE" :type uint)
     (:+control+ :swf-name "CONTROL" :type uint)
     (:+up+ :swf-name "UP" :type uint)
     (:+tab+ :swf-name "TAB" :type uint)
     (:+numpad-1+ :swf-name "NUMPAD_1" :type uint)
     (:+space+ :swf-name "SPACE" :type uint)
     (:+left+ :swf-name "LEFT" :type uint)
     (:+caps-lock+ :swf-name "CAPS_LOCK" :type uint)
     (:+right+ :swf-name "RIGHT" :type uint)
     (:+shift+ :swf-name "SHIFT" :type uint)
     (:+insert+ :swf-name "INSERT" :type uint)
     (:+numpad-0+ :swf-name "NUMPAD_0" :type uint)
     (:+page-up+ :swf-name "PAGE_UP" :type uint)
     (:+f15+ :swf-name "F15" :type uint)
     (:+backspace+ :swf-name "BACKSPACE" :type uint)
     (:+page-down+ :swf-name "PAGE_DOWN" :type uint)
     (:+f13+ :swf-name "F13" :type uint)
     (:+home+ :swf-name "HOME" :type uint)
     (:+f12+ :swf-name "F12" :type uint)
     (:+numpad-subtract+ :swf-name "NUMPAD_SUBTRACT" :type uint)
     (:+numpad-enter+ :swf-name "NUMPAD_ENTER" :type uint)
     (:+f14+ :swf-name "F14" :type uint)
     (:+numpad-div-id-e+ :swf-name "NUMPAD_DIVIDE" :type uint)
     (:+f11+ :swf-name "F11" :type uint)
     (:+f9+ :swf-name "F9" :type uint)
     (:+f10+ :swf-name "F10" :type uint)
     (:+numpad-add+ :swf-name "NUMPAD_ADD" :type uint)
     (:+numpad-decimal+ :swf-name "NUMPAD_DECIMAL" :type uint)
     (:+f7+ :swf-name "F7" :type uint)
     (:+f8+ :swf-name "F8" :type uint)
     (:+numpad-9+ :swf-name "NUMPAD_9" :type uint)
     (:+f6+ :swf-name "F6" :type uint)
     (:+f5+ :swf-name "F5" :type uint)
     (:+numpad-multiply+ :swf-name "NUMPAD_MULTIPLY" :type uint)
     (:+f4+ :swf-name "F4" :type uint)
     (:+numpad-8+ :swf-name "NUMPAD_8" :type uint)
     (:+numpad-7+ :swf-name "NUMPAD_7" :type uint)
     (:+f2+ :swf-name "F2" :type uint)
     (:+f3+ :swf-name "F3" :type uint)
     (:+f1+ :swf-name "F1" :type uint)
     (:+numpad-6+ :swf-name "NUMPAD_6" :type uint)
     (:+escape+ :swf-name "ESCAPE" :type uint)
     (:+enter+ :swf-name "ENTER" :type uint)
     (:+numpad-5+ :swf-name "NUMPAD_5" :type uint)
     (:+end+ :swf-name "END" :type uint)
     (:+numpad-4+ :swf-name "NUMPAD_4" :type uint)
     (:+numpad-3+ :swf-name "NUMPAD_3" :type uint)
     (:+down+ :swf-name "DOWN" :type uint))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.media::sound-mixer (object)
    :swf-name "flash.media::SoundMixer"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::bitmap-data (object)
    :swf-name "flash.display::BitmapData"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces (flash.display::i-bitmap-drawable)
    ;;   = ("flash.display::IBitmapDrawable")
    :constants
    ()
    :properties
    ((:transparent :swf-name "transparent" :type boolean :access :readonly :declared-by flash.display::bitmap-data)
     (:rect :swf-name "rect" :type flash.geom::rectangle :access :readonly :declared-by flash.display::bitmap-data)
     (:width :swf-name "width" :type int :access :readonly :declared-by flash.display::bitmap-data)
     (:height :swf-name "height" :type int :access :readonly :declared-by flash.display::bitmap-data))
    :methods
    ((:set-pixel :swf-name "setPixel" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type uint :optional NIL)))
     (:get-pixel32 :swf-name "getPixel32" :return-type uint :declared-by flash.display::bitmap-data
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:copy-pixels :swf-name "copyPixels" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional NIL)
       (:index 3 :type flash.geom::point :optional NIL)
       (:index 4 :type flash.display::bitmap-data :optional T)
       (:index 5 :type flash.geom::point :optional T)
       (:index 6 :type boolean :optional T)))
     (:noise :swf-name "noise" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)
       (:index 4 :type uint :optional T)
       (:index 5 :type boolean :optional T)))
     (:scroll :swf-name "scroll" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:pixel-dissolve :swf-name "pixelDissolve" :return-type int :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional NIL)
       (:index 3 :type flash.geom::point :optional NIL)
       (:index 4 :type int :optional T)
       (:index 5 :type int :optional T)
       (:index 6 :type uint :optional T)))
     (:get-pixels :swf-name "getPixels" :return-type flash.utils::byte-array :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)))
     (:merge :swf-name "merge" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional NIL)
       (:index 3 :type flash.geom::point :optional NIL)
       (:index 4 :type uint :optional NIL)
       (:index 5 :type uint :optional NIL)
       (:index 6 :type uint :optional NIL)
       (:index 7 :type uint :optional NIL)))
     (:copy-channel :swf-name "copyChannel" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional NIL)
       (:index 3 :type flash.geom::point :optional NIL)
       (:index 4 :type uint :optional NIL)
       (:index 5 :type uint :optional NIL)))
     (:unlock :swf-name "unlock" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.geom::rectangle :optional T)))
     (:threshold :swf-name "threshold" :return-type uint :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional NIL)
       (:index 3 :type flash.geom::point :optional NIL)
       (:index 4 :type string :optional NIL)
       (:index 5 :type uint :optional NIL)
       (:index 6 :type uint :optional T)
       (:index 7 :type uint :optional T)
       (:index 8 :type boolean :optional T)))
     (:palette-map :swf-name "paletteMap" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional NIL)
       (:index 3 :type flash.geom::point :optional NIL)
       (:index 4 :type array :optional T)
       (:index 5 :type array :optional T)
       (:index 6 :type array :optional T)
       (:index 7 :type array :optional T)))
     (:color-transform :swf-name "colorTransform" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)
       (:index 2 :type flash.geom::color-transform :optional NIL)))
     (:lock :swf-name "lock" :return-type void :declared-by flash.display::bitmap-data
          :args ())
     (:perlin-noise :swf-name "perlinNoise" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type uint :optional NIL)
       (:index 4 :type int :optional NIL)
       (:index 5 :type boolean :optional NIL)
       (:index 6 :type boolean :optional NIL)
       (:index 7 :type uint :optional T)
       (:index 8 :type boolean :optional T)
       (:index 9 :type array :optional T)))
     (:compare :swf-name "compare" :return-type object :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)))
     (:generate-filter-rect :swf-name "generateFilterRect" :return-type flash.geom::rectangle :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)
       (:index 2 :type flash.filters::bitmap-filter :optional NIL)))
     (:get-pixel :swf-name "getPixel" :return-type uint :declared-by flash.display::bitmap-data
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:clone :swf-name "clone" :return-type flash.display::bitmap-data :declared-by flash.display::bitmap-data
          :args ())
     (:fill-rect :swf-name "fillRect" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)
       (:index 2 :type uint :optional NIL)))
     (:set-pixel32 :swf-name "setPixel32" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type uint :optional NIL)))
     (:apply-filter :swf-name "applyFilter" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::rectangle :optional NIL)
       (:index 3 :type flash.geom::point :optional NIL)
       (:index 4 :type flash.filters::bitmap-filter :optional NIL)))
     (:flood-fill :swf-name "floodFill" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type uint :optional NIL)))
     (:set-pixels :swf-name "setPixels" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)
       (:index 2 :type flash.utils::byte-array :optional NIL)))
     (:draw :swf-name "draw" :return-type void :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.display::i-bitmap-drawable :optional NIL)
       (:index 2 :type flash.geom::matrix :optional T)
       (:index 3 :type flash.geom::color-transform :optional T)
       (:index 4 :type string :optional T)
       (:index 5 :type flash.geom::rectangle :optional T)
       (:index 6 :type boolean :optional T)))
     (:hit-test :swf-name "hitTest" :return-type boolean :declared-by flash.display::bitmap-data
          :args ((:index 1 :type flash.geom::point :optional NIL)
       (:index 2 :type uint :optional NIL)
       (:index 3 :type object :optional NIL)
       (:index 4 :type flash.geom::point :optional T)
       (:index 5 :type uint :optional T)))
     (:get-color-bounds-rect :swf-name "getColorBoundsRect" :return-type flash.geom::rectangle :declared-by flash.display::bitmap-data
          :args ((:index 1 :type uint :optional NIL)
       (:index 2 :type uint :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:dispose :swf-name "dispose" :return-type void :declared-by flash.display::bitmap-data
          :args ())))

  (declare-swf-class flash.text::text-field-type (object)
    :swf-name "flash.text::TextFieldType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+input+ :swf-name "INPUT" :type string)
     (:+dynamic+ :swf-name "DYNAMIC" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::net-filter-event (flash.events::event)
    :swf-name "flash.events::NetFilterEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::net-filter-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::net-filter-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.display::gradient-type (object)
    :swf-name "flash.display::GradientType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+linear+ :swf-name "LINEAR" :type string)
     (:+radial+ :swf-name "RADIAL" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::-url-request-method (object)
    :swf-name "flash.net::URLRequestMethod"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+post+ :swf-name "POST" :type string)
     (:+get+ :swf-name "GET" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.accessibility::accessibility-implementation (object)
    :swf-name "flash.accessibility::AccessibilityImplementation"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:get-acc-role :swf-name "get_accRole" :return-type uint :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)))
     (:get-acc-default-action :swf-name "get_accDefaultAction" :return-type string :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)))
     (:get-acc-name :swf-name "get_accName" :return-type string :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)))
     (:acc-do-default-action :swf-name "accDoDefaultAction" :return-type void :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)))
     (:get-acc-focus :swf-name "get_accFocus" :return-type uint :declared-by flash.accessibility::accessibility-implementation
          :args ())
     (:acc-select :swf-name "accSelect" :return-type void :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)
       (:index 2 :type uint :optional NIL)))
     (:get-acc-value :swf-name "get_accValue" :return-type string :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)))
     (:acc-location :swf-name "accLocation" :return-type * :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)))
     (:is-labeled-by :swf-name "isLabeledBy" :return-type boolean :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)))
     (:get-acc-selection :swf-name "get_accSelection" :return-type array :declared-by flash.accessibility::accessibility-implementation
          :args ())
     (:get-acc-state :swf-name "get_accState" :return-type uint :declared-by flash.accessibility::accessibility-implementation
          :args ((:index 1 :type uint :optional NIL)))
     (:get-child-id-array :swf-name "getChildIDArray" :return-type array :declared-by flash.accessibility::accessibility-implementation
          :args ())))

  (declare-swf-class flash.media::camera (flash.events::event-dispatcher)
    :swf-name "flash.media::Camera"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:loopback :swf-name "loopback" :type boolean :access :readonly :declared-by flash.media::camera)
     (:bandwidth :swf-name "bandwidth" :type int :access :readonly :declared-by flash.media::camera)
     (:motion-timeout :swf-name "motionTimeout" :type int :access :readonly :declared-by flash.media::camera)
     (:muted :swf-name "muted" :type boolean :access :readonly :declared-by flash.media::camera)
     (:fps :swf-name "fps" :type number :access :readonly :declared-by flash.media::camera)
     (:index :swf-name "index" :type int :access :readonly :declared-by flash.media::camera)
     (:key-frame-interval :swf-name "keyFrameInterval" :type int :access :readonly :declared-by flash.media::camera)
     (:activity-level :swf-name "activityLevel" :type number :access :readonly :declared-by flash.media::camera)
     (:width :swf-name "width" :type int :access :readonly :declared-by flash.media::camera)
     (:name :swf-name "name" :type string :access :readonly :declared-by flash.media::camera)
     (:height :swf-name "height" :type int :access :readonly :declared-by flash.media::camera)
     (:motion-level :swf-name "motionLevel" :type int :access :readonly :declared-by flash.media::camera)
     (:quality :swf-name "quality" :type int :access :readonly :declared-by flash.media::camera)
     (:current-fps :swf-name "currentFPS" :type number :access :readonly :declared-by flash.media::camera))
    :methods
    ((:set-quality :swf-name "setQuality" :return-type void :declared-by flash.media::camera
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:set-key-frame-interval :swf-name "setKeyFrameInterval" :return-type void :declared-by flash.media::camera
          :args ((:index 1 :type int :optional NIL)))
     (:set-motion-level :swf-name "setMotionLevel" :return-type void :declared-by flash.media::camera
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional T)))
     (:set-mode :swf-name "setMode" :return-type void :declared-by flash.media::camera
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type number :optional NIL)
       (:index 4 :type boolean :optional T)))
     (:set-cursor :swf-name "setCursor" :return-type void :declared-by flash.media::camera
          :args ((:index 1 :type boolean :optional NIL)))
     (:set-loopback :swf-name "setLoopback" :return-type void :declared-by flash.media::camera
          :args ((:index 1 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::-avm1movie (flash.display::display-object)
    :swf-name "flash.display::AVM1Movie"
    ;; :supers (flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:call :swf-name "call" :return-type * :declared-by flash.display::-avm1movie
          :args ((:index 1 :type string :optional NIL)))
     (:add-callback :swf-name "addCallback" :return-type void :declared-by flash.display::-avm1movie
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.filters::displacement-map-filter-mode (object)
    :swf-name "flash.filters::DisplacementMapFilterMode"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+clamp+ :swf-name "CLAMP" :type string)
     (:+ignore+ :swf-name "IGNORE" :type string)
     (:+color+ :swf-name "COLOR" :type string)
     (:+wrap+ :swf-name "WRAP" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.filters::gradient-glow-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::GradientGlowFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:blur-y :swf-name "blurY" :type number :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:angle :swf-name "angle" :type number :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:blur-x :swf-name "blurX" :type number :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:alphas :swf-name "alphas" :type array :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:colors :swf-name "colors" :type array :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:quality :swf-name "quality" :type int :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:type :swf-name "type" :type string :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:knockout :swf-name "knockout" :type boolean :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:ratios :swf-name "ratios" :type array :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:strength :swf-name "strength" :type number :access :readwrite :declared-by flash.filters::gradient-glow-filter)
     (:distance :swf-name "distance" :type number :access :readwrite :declared-by flash.filters::gradient-glow-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::gradient-glow-filter
          :args ())))

  (declare-swf-class flash.display::joint-style (object)
    :swf-name "flash.display::JointStyle"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+miter+ :swf-name "MITER" :type string)
     (:+round+ :swf-name "ROUND" :type string)
     (:+bevel+ :swf-name "BEVEL" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::local-connection (flash.events::event-dispatcher)
    :swf-name "flash.net::LocalConnection"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:client :swf-name "client" :type object :access :readwrite :declared-by flash.net::local-connection)
     (:domain :swf-name "domain" :type string :access :readonly :declared-by flash.net::local-connection))
    :methods
    ((:connect :swf-name "connect" :return-type void :declared-by flash.net::local-connection
          :args ((:index 1 :type string :optional NIL)))
     (:send :swf-name "send" :return-type void :declared-by flash.net::local-connection
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:allow-insecure-domain :swf-name "allowInsecureDomain" :return-type void :declared-by flash.net::local-connection
          :args ())
     (:allow-domain :swf-name "allowDomain" :return-type void :declared-by flash.net::local-connection
          :args ())
     (:close :swf-name "close" :return-type void :declared-by flash.net::local-connection
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.net::-url-request (object)
    :swf-name "flash.net::URLRequest"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:data :swf-name "data" :type object :access :readwrite :declared-by flash.net::-url-request)
     (:digest :swf-name "digest" :type string :access :readwrite :declared-by flash.net::-url-request)
     (:url :swf-name "url" :type string :access :readwrite :declared-by flash.net::-url-request)
     (:request-headers :swf-name "requestHeaders" :type array :access :readwrite :declared-by flash.net::-url-request)
     (:content-type :swf-name "contentType" :type string :access :readwrite :declared-by flash.net::-url-request)
     (:method :swf-name "method" :type string :access :readwrite :declared-by flash.net::-url-request))
    :methods
    ())

  (declare-swf-class flash.events::-io-error-event (flash.events::error-event)
    :swf-name "flash.events::IOErrorEvent"
    ;; :supers (flash.events::error-event flash.events::text-event
    ;;          flash.events::event object)
    ;;   = ("flash.events::ErrorEvent" "flash.events::TextEvent"
    ;;      "flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+network-error+ :swf-name "NETWORK_ERROR" :type string)
     (:+io-error+ :swf-name "IO_ERROR" :type string)
     (:+disk-error+ :swf-name "DISK_ERROR" :type string)
     (:+verify-error+ :swf-name "VERIFY_ERROR" :type string))
    :properties
    ((:text :swf-name "text" :type string :access :readwrite :declared-by flash.events::text-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::-io-error-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::-io-error-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.filters::gradient-bevel-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::GradientBevelFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:blur-y :swf-name "blurY" :type number :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:angle :swf-name "angle" :type number :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:blur-x :swf-name "blurX" :type number :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:alphas :swf-name "alphas" :type array :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:colors :swf-name "colors" :type array :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:quality :swf-name "quality" :type int :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:type :swf-name "type" :type string :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:knockout :swf-name "knockout" :type boolean :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:ratios :swf-name "ratios" :type array :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:strength :swf-name "strength" :type number :access :readwrite :declared-by flash.filters::gradient-bevel-filter)
     (:distance :swf-name "distance" :type number :access :readwrite :declared-by flash.filters::gradient-bevel-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::gradient-bevel-filter
          :args ())))

  (declare-swf-class flash.events::focus-event (flash.events::event)
    :swf-name "flash.events::FocusEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+focus-out+ :swf-name "FOCUS_OUT" :type string)
     (:+focus-in+ :swf-name "FOCUS_IN" :type string)
     (:+mouse-focus-change+ :swf-name "MOUSE_FOCUS_CHANGE" :type string)
     (:+key-focus-change+ :swf-name "KEY_FOCUS_CHANGE" :type string))
    :properties
    ((:shift-key :swf-name "shiftKey" :type boolean :access :readwrite :declared-by flash.events::focus-event)
     (:related-object :swf-name "relatedObject" :type flash.display::interactive-object :access :readwrite :declared-by flash.events::focus-event)
     (:key-code :swf-name "keyCode" :type uint :access :readwrite :declared-by flash.events::focus-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::focus-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::focus-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.display::bitmap-data-channel (object)
    :swf-name "flash.display::BitmapDataChannel"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+red+ :swf-name "RED" :type uint)
     (:+alpha+ :swf-name "ALPHA" :type uint)
     (:+green+ :swf-name "GREEN" :type uint)
     (:+blue+ :swf-name "BLUE" :type uint))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::interactive-object (flash.display::display-object)
    :swf-name "flash.display::InteractiveObject"
    ;; :supers (flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.ui::context-menu (flash.events::event-dispatcher)
    :swf-name "flash.ui::ContextMenu"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:custom-items :swf-name "customItems" :type array :access :readwrite :declared-by flash.ui::context-menu)
     (:built-in-items :swf-name "builtInItems" :type flash.ui::context-menu-built-in-items :access :readwrite :declared-by flash.ui::context-menu))
    :methods
    ((:hide-built-in-items :swf-name "hideBuiltInItems" :return-type void :declared-by flash.ui::context-menu
          :args ())
     (:clone :swf-name "clone" :return-type flash.ui::context-menu :declared-by flash.ui::context-menu
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::loader-info (flash.events::event-dispatcher)
    :swf-name "flash.display::LoaderInfo"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:bytes-loaded :swf-name "bytesLoaded" :type uint :access :readonly :declared-by flash.display::loader-info)
     (:content :swf-name "content" :type flash.display::display-object :access :readonly :declared-by flash.display::loader-info)
     (:same-domain :swf-name "sameDomain" :type boolean :access :readonly :declared-by flash.display::loader-info)
     (:loader-url :swf-name "loaderURL" :type string :access :readonly :declared-by flash.display::loader-info)
     (:application-domain :swf-name "applicationDomain" :type flash.system::application-domain :access :readonly :declared-by flash.display::loader-info)
     (:shared-events :swf-name "sharedEvents" :type flash.events::event-dispatcher :access :readonly :declared-by flash.display::loader-info)
     (:bytes :swf-name "bytes" :type flash.utils::byte-array :access :readonly :declared-by flash.display::loader-info)
     (:frame-rate :swf-name "frameRate" :type number :access :readonly :declared-by flash.display::loader-info)
     (:loader :swf-name "loader" :type flash.display::loader :access :readonly :declared-by flash.display::loader-info)
     (:parameters :swf-name "parameters" :type object :access :readonly :declared-by flash.display::loader-info)
     (:child-allows-parent :swf-name "childAllowsParent" :type boolean :access :readonly :declared-by flash.display::loader-info)
     (:height :swf-name "height" :type int :access :readonly :declared-by flash.display::loader-info)
     (:content-type :swf-name "contentType" :type string :access :readonly :declared-by flash.display::loader-info)
     (:url :swf-name "url" :type string :access :readonly :declared-by flash.display::loader-info)
     (:action-script-version :swf-name "actionScriptVersion" :type uint :access :readonly :declared-by flash.display::loader-info)
     (:parent-allows-child :swf-name "parentAllowsChild" :type boolean :access :readonly :declared-by flash.display::loader-info)
     (:bytes-total :swf-name "bytesTotal" :type uint :access :readonly :declared-by flash.display::loader-info)
     (:swf-version :swf-name "swfVersion" :type uint :access :readonly :declared-by flash.display::loader-info)
     (:width :swf-name "width" :type int :access :readonly :declared-by flash.display::loader-info))
    :methods
    ((:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.display::loader-info
          :args ((:index 1 :type flash.events::event :optional NIL)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))))

  (declare-swf-class flash.display::shape (flash.display::display-object)
    :swf-name "flash.display::Shape"
    ;; :supers (flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:graphics :swf-name "graphics" :type flash.display::graphics :access :readonly :declared-by flash.display::shape)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.events::sync-event (flash.events::event)
    :swf-name "flash.events::SyncEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+sync+ :swf-name "SYNC" :type string))
    :properties
    ((:change-list :swf-name "changeList" :type array :access :readwrite :declared-by flash.events::sync-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::sync-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::sync-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.filters::bevel-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::BevelFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:type :swf-name "type" :type string :access :readwrite :declared-by flash.filters::bevel-filter)
     (:angle :swf-name "angle" :type number :access :readwrite :declared-by flash.filters::bevel-filter)
     (:blur-x :swf-name "blurX" :type number :access :readwrite :declared-by flash.filters::bevel-filter)
     (:blur-y :swf-name "blurY" :type number :access :readwrite :declared-by flash.filters::bevel-filter)
     (:shadow-alpha :swf-name "shadowAlpha" :type number :access :readwrite :declared-by flash.filters::bevel-filter)
     (:quality :swf-name "quality" :type int :access :readwrite :declared-by flash.filters::bevel-filter)
     (:shadow-color :swf-name "shadowColor" :type uint :access :readwrite :declared-by flash.filters::bevel-filter)
     (:highlight-alpha :swf-name "highlightAlpha" :type number :access :readwrite :declared-by flash.filters::bevel-filter)
     (:highlight-color :swf-name "highlightColor" :type uint :access :readwrite :declared-by flash.filters::bevel-filter)
     (:knockout :swf-name "knockout" :type boolean :access :readwrite :declared-by flash.filters::bevel-filter)
     (:strength :swf-name "strength" :type number :access :readwrite :declared-by flash.filters::bevel-filter)
     (:distance :swf-name "distance" :type number :access :readwrite :declared-by flash.filters::bevel-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::bevel-filter
          :args ())))

  (declare-swf-class flash.geom::rectangle (object)
    :swf-name "flash.geom::Rectangle"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:right :swf-name "right" :type number :access :readwrite :declared-by flash.geom::rectangle)
     (:top-left :swf-name "topLeft" :type flash.geom::point :access :readwrite :declared-by flash.geom::rectangle)
     (:left :swf-name "left" :type number :access :readwrite :declared-by flash.geom::rectangle)
     (:bottom :swf-name "bottom" :type number :access :readwrite :declared-by flash.geom::rectangle)
     (:bottom-right :swf-name "bottomRight" :type flash.geom::point :access :readwrite :declared-by flash.geom::rectangle)
     (:top :swf-name "top" :type number :access :readwrite :declared-by flash.geom::rectangle)
     (:size :swf-name "size" :type flash.geom::point :access :readwrite :declared-by flash.geom::rectangle))
    :methods
    ((:offset-point :swf-name "offsetPoint" :return-type void :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:set-empty :swf-name "setEmpty" :return-type void :declared-by flash.geom::rectangle
          :args ())
     (:contains :swf-name "contains" :return-type boolean :declared-by flash.geom::rectangle
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:is-empty :swf-name "isEmpty" :return-type boolean :declared-by flash.geom::rectangle
          :args ())
     (:intersects :swf-name "intersects" :return-type boolean :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)))
     (:contains-rect :swf-name "containsRect" :return-type boolean :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)))
     (:inflate :swf-name "inflate" :return-type void :declared-by flash.geom::rectangle
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:union :swf-name "union" :return-type flash.geom::rectangle :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)))
     (:equals :swf-name "equals" :return-type boolean :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)))
     (:intersection :swf-name "intersection" :return-type flash.geom::rectangle :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::rectangle :optional NIL)))
     (:offset :swf-name "offset" :return-type void :declared-by flash.geom::rectangle
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:clone :swf-name "clone" :return-type flash.geom::rectangle :declared-by flash.geom::rectangle
          :args ())
     (:inflate-point :swf-name "inflatePoint" :return-type void :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:contains-point :swf-name "containsPoint" :return-type boolean :declared-by flash.geom::rectangle
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.geom::rectangle
          :args ())))

  (declare-swf-class flash.display::-swf-version (object)
    :swf-name "flash.display::SWFVersion"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+flash2+ :swf-name "FLASH2" :type uint)
     (:+flash7+ :swf-name "FLASH7" :type uint)
     (:+flash3+ :swf-name "FLASH3" :type uint)
     (:+flash8+ :swf-name "FLASH8" :type uint)
     (:+flash9+ :swf-name "FLASH9" :type uint)
     (:+flash6+ :swf-name "FLASH6" :type uint)
     (:+flash5+ :swf-name "FLASH5" :type uint)
     (:+flash1+ :swf-name "FLASH1" :type uint)
     (:+flash4+ :swf-name "FLASH4" :type uint))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::responder (object)
    :swf-name "flash.net::Responder"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.system::capabilities (object)
    :swf-name "flash.system::Capabilities"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::i-dynamic-property-output ()
    :swf-name "flash.net::IDynamicPropertyOutput"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:write-dynamic-property :swf-name "writeDynamicProperty" :return-type void :declared-by flash.net::i-dynamic-property-output
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type * :optional NIL)))))

  (declare-swf-class flash.display::stage-display-state (object)
    :swf-name "flash.display::StageDisplayState"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+full-screen+ :swf-name "FULL_SCREEN" :type string)
     (:+normal+ :swf-name "NORMAL" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class adobe.utils::product-manager (flash.events::event-dispatcher)
    :swf-name "adobe.utils::ProductManager"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:installed :swf-name "installed" :type boolean :access :readonly :declared-by adobe.utils::product-manager)
     (:running :swf-name "running" :type boolean :access :readonly :declared-by adobe.utils::product-manager)
     (:installed-version :swf-name "installedVersion" :type string :access :readonly :declared-by adobe.utils::product-manager))
    :methods
    ((:download :swf-name "download" :return-type boolean :declared-by adobe.utils::product-manager
          :args ((:index 1 :type string :optional T)
       (:index 2 :type string :optional T)
       (:index 3 :type array :optional T)))
     (:launch :swf-name "launch" :return-type boolean :declared-by adobe.utils::product-manager
          :args ((:index 1 :type string :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::frame-label (object)
    :swf-name "flash.display::FrameLabel"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:frame :swf-name "frame" :type int :access :readonly :declared-by flash.display::frame-label)
     (:name :swf-name "name" :type string :access :readonly :declared-by flash.display::frame-label))
    :methods
    ())

  (declare-swf-class flash.text::text-format-align (object)
    :swf-name "flash.text::TextFormatAlign"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+justify+ :swf-name "JUSTIFY" :type string)
     (:+right+ :swf-name "RIGHT" :type string)
     (:+left+ :swf-name "LEFT" :type string)
     (:+center+ :swf-name "CENTER" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.utils::dictionary (object)
    :swf-name "flash.utils::Dictionary"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::shared-object (flash.events::event-dispatcher)
    :swf-name "flash.net::SharedObject"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:fps :swf-name "fps" :type number :access :writeonly :declared-by flash.net::shared-object)
     (:data :swf-name "data" :type object :access :readonly :declared-by flash.net::shared-object)
     (:size :swf-name "size" :type uint :access :readonly :declared-by flash.net::shared-object)
     (:client :swf-name "client" :type object :access :readwrite :declared-by flash.net::shared-object)
     (:object-encoding :swf-name "objectEncoding" :type uint :access :readwrite :declared-by flash.net::shared-object))
    :methods
    ((:flush :swf-name "flush" :return-type string :declared-by flash.net::shared-object
          :args ((:index 1 :type int :optional T)))
     (:set-dirty :swf-name "setDirty" :return-type void :declared-by flash.net::shared-object
          :args ((:index 1 :type string :optional NIL)))
     (:set-property :swf-name "setProperty" :return-type void :declared-by flash.net::shared-object
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type object :optional T)))
     (:connect :swf-name "connect" :return-type void :declared-by flash.net::shared-object
          :args ((:index 1 :type flash.net::net-connection :optional NIL)
       (:index 2 :type string :optional T)))
     (:send :swf-name "send" :return-type void :declared-by flash.net::shared-object
          :args ())
     (:close :swf-name "close" :return-type void :declared-by flash.net::shared-object
          :args ())
     (:clear :swf-name "clear" :return-type void :declared-by flash.net::shared-object
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.net::socket (flash.events::event-dispatcher)
    :swf-name "flash.net::Socket"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.utils::i-data-output
    ;;              flash.events::i-event-dispatcher
    ;;              flash.utils::i-data-input)
    ;;   = ("flash.utils::IDataOutput" "flash.events::IEventDispatcher"
    ;;      "flash.utils::IDataInput")
    :constants
    ()
    :properties
    ((:object-encoding :swf-name "objectEncoding" :type uint :access :readwrite :declared-by flash.net::socket)
     (:connected :swf-name "connected" :type boolean :access :readonly :declared-by flash.net::socket)
     (:bytes-available :swf-name "bytesAvailable" :type uint :access :readonly :declared-by flash.net::socket)
     (:endian :swf-name "endian" :type string :access :readwrite :declared-by flash.net::socket))
    :methods
    ((:read-double :swf-name "readDouble" :return-type number :declared-by flash.net::socket
          :args ())
     (:write-unsigned-int :swf-name "writeUnsignedInt" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type uint :optional NIL)))
     (:write-float :swf-name "writeFloat" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type number :optional NIL)))
     (:write-double :swf-name "writeDouble" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type number :optional NIL)))
     (:read-multi-byte :swf-name "readMultiByte" :return-type string :declared-by flash.net::socket
          :args ((:index 1 :type uint :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:write-int :swf-name "writeInt" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type int :optional NIL)))
     (:write-bytes :swf-name "writeBytes" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)))
     (:read-short :swf-name "readShort" :return-type int :declared-by flash.net::socket
          :args ())
     (:read-unsigned-int :swf-name "readUnsignedInt" :return-type uint :declared-by flash.net::socket
          :args ())
     (:flush :swf-name "flush" :return-type void :declared-by flash.net::socket
          :args ())
     (:read-unsigned-short :swf-name "readUnsignedShort" :return-type uint :declared-by flash.net::socket
          :args ())
     (:read-float :swf-name "readFloat" :return-type number :declared-by flash.net::socket
          :args ())
     (:write-utf :swf-name "writeUTF" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type string :optional NIL)))
     (:write-byte :swf-name "writeByte" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type int :optional NIL)))
     (:write-short :swf-name "writeShort" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type int :optional NIL)))
     (:connect :swf-name "connect" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:write-boolean :swf-name "writeBoolean" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type boolean :optional NIL)))
     (:write-multi-byte :swf-name "writeMultiByte" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:write-utf-bytes :swf-name "writeUTFBytes" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type string :optional NIL)))
     (:read-byte :swf-name "readByte" :return-type int :declared-by flash.net::socket
          :args ())
     (:read-object :swf-name "readObject" :return-type * :declared-by flash.net::socket
          :args ())
     (:read-utf-bytes :swf-name "readUTFBytes" :return-type string :declared-by flash.net::socket
          :args ((:index 1 :type uint :optional NIL)))
     (:read-int :swf-name "readInt" :return-type int :declared-by flash.net::socket
          :args ())
     (:close :swf-name "close" :return-type void :declared-by flash.net::socket
          :args ())
     (:read-utf :swf-name "readUTF" :return-type string :declared-by flash.net::socket
          :args ())
     (:read-bytes :swf-name "readBytes" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)))
     (:read-unsigned-byte :swf-name "readUnsignedByte" :return-type uint :declared-by flash.net::socket
          :args ())
     (:read-boolean :swf-name "readBoolean" :return-type boolean :declared-by flash.net::socket
          :args ())
     (:write-object :swf-name "writeObject" :return-type void :declared-by flash.net::socket
          :args ((:index 1 :type * :optional NIL)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.filters::color-matrix-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::ColorMatrixFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:matrix :swf-name "matrix" :type array :access :readwrite :declared-by flash.filters::color-matrix-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::color-matrix-filter
          :args ())))

  (declare-swf-class flash.filters::bitmap-filter-type (object)
    :swf-name "flash.filters::BitmapFilterType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+outer+ :swf-name "OUTER" :type string)
     (:+full+ :swf-name "FULL" :type string)
     (:+inner+ :swf-name "INNER" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::text-color-type (object)
    :swf-name "flash.text::TextColorType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+dark-color+ :swf-name "DARK_COLOR" :type string)
     (:+light-color+ :swf-name "LIGHT_COLOR" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.filters::displacement-map-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::DisplacementMapFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:map-bitmap :swf-name "mapBitmap" :type flash.display::bitmap-data :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:component-y :swf-name "componentY" :type uint :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:color :swf-name "color" :type uint :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:component-x :swf-name "componentX" :type uint :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:mode :swf-name "mode" :type string :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:map-point :swf-name "mapPoint" :type flash.geom::point :access :readwrite :declared-by flash.filters::displacement-map-filter)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.filters::displacement-map-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::displacement-map-filter
          :args ())))

  (declare-swf-class flash.net::i-dynamic-property-writer ()
    :swf-name "flash.net::IDynamicPropertyWriter"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:write-dynamic-properties :swf-name "writeDynamicProperties" :return-type void :declared-by flash.net::i-dynamic-property-writer
          :args ((:index 1 :type object :optional NIL)
       (:index 2 :type flash.net::i-dynamic-property-output :optional NIL)))))

  (declare-swf-class flash.external::external-interface (object)
    :swf-name "flash.external::ExternalInterface"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::text-run (object)
    :swf-name "flash.text::TextRun"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.media::video (flash.display::display-object)
    :swf-name "flash.media::Video"
    ;; :supers (flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:deblocking :swf-name "deblocking" :type int :access :readwrite :declared-by flash.media::video)
     (:smoothing :swf-name "smoothing" :type boolean :access :readwrite :declared-by flash.media::video)
     (:video-width :swf-name "videoWidth" :type int :access :readonly :declared-by flash.media::video)
     (:video-height :swf-name "videoHeight" :type int :access :readonly :declared-by flash.media::video)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:clear :swf-name "clear" :return-type void :declared-by flash.media::video
          :args ())
     (:attach-net-stream :swf-name "attachNetStream" :return-type void :declared-by flash.media::video
          :args ((:index 1 :type flash.net::net-stream :optional NIL)))
     (:attach-camera :swf-name "attachCamera" :return-type void :declared-by flash.media::video
          :args ((:index 1 :type flash.media::camera :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.text::text-format-display (object)
    :swf-name "flash.text::TextFormatDisplay"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+inline+ :swf-name "INLINE" :type string)
     (:+block+ :swf-name "BLOCK" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.media::-id3info (object)
    :swf-name "flash.media::ID3Info"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.media::sound-transform (object)
    :swf-name "flash.media::SoundTransform"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:left-to-left :swf-name "leftToLeft" :type number :access :readwrite :declared-by flash.media::sound-transform)
     (:pan :swf-name "pan" :type number :access :readwrite :declared-by flash.media::sound-transform)
     (:volume :swf-name "volume" :type number :access :readwrite :declared-by flash.media::sound-transform)
     (:right-to-right :swf-name "rightToRight" :type number :access :readwrite :declared-by flash.media::sound-transform)
     (:right-to-left :swf-name "rightToLeft" :type number :access :readwrite :declared-by flash.media::sound-transform)
     (:left-to-right :swf-name "leftToRight" :type number :access :readwrite :declared-by flash.media::sound-transform))
    :methods
    ())

  (declare-swf-class flash.trace::trace (object)
    :swf-name "flash.trace::Trace"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+methods-with-args+ :swf-name "METHODS_WITH_ARGS" :type int)
     (:+file+ :swf-name "FILE" :type *)
     (:+listener+ :swf-name "LISTENER" :type *)
     (:+off+ :swf-name "OFF" :type int)
     (:+methods+ :swf-name "METHODS" :type int)
     (:+methods-and-lines-with-args+ :swf-name "METHODS_AND_LINES_WITH_ARGS" :type int)
     (:+methods-and-lines+ :swf-name "METHODS_AND_LINES" :type int))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::text-snapshot (object)
    :swf-name "flash.text::TextSnapshot"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:char-count :swf-name "charCount" :type int :access :readonly :declared-by flash.text::text-snapshot))
    :methods
    ((:find-text :swf-name "findText" :return-type int :declared-by flash.text::text-snapshot
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type string :optional NIL)
       (:index 3 :type boolean :optional NIL)))
     (:hit-test-text-near-pos :swf-name "hitTestTextNearPos" :return-type number :declared-by flash.text::text-snapshot
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional T)))
     (:set-select-color :swf-name "setSelectColor" :return-type void :declared-by flash.text::text-snapshot
          :args ((:index 1 :type uint :optional T)))
     (:get-selected :swf-name "getSelected" :return-type boolean :declared-by flash.text::text-snapshot
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:get-text-run-info :swf-name "getTextRunInfo" :return-type array :declared-by flash.text::text-snapshot
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:get-text :swf-name "getText" :return-type string :declared-by flash.text::text-snapshot
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:get-selected-text :swf-name "getSelectedText" :return-type string :declared-by flash.text::text-snapshot
          :args ((:index 1 :type boolean :optional T)))
     (:set-selected :swf-name "setSelected" :return-type void :declared-by flash.text::text-snapshot
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type boolean :optional NIL)))))

  (declare-swf-class flash.display::interpolation-method (object)
    :swf-name "flash.display::InterpolationMethod"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+linear-rgb+ :swf-name "LINEAR_RGB" :type string)
     (:+rgb+ :swf-name "RGB" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::text-extent (object)
    :swf-name "flash.text::TextExtent"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.ui::context-menu-built-in-items (object)
    :swf-name "flash.ui::ContextMenuBuiltInItems"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:clone :swf-name "clone" :return-type flash.ui::context-menu-built-in-items :declared-by flash.ui::context-menu-built-in-items
          :args ())))

  (declare-swf-class flash.system::security-domain (object)
    :swf-name "flash.system::SecurityDomain"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class date (object)
    :swf-name "Date"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+length+ :swf-name "length" :type int))
    :properties
    ((:hours-utc :swf-name "hoursUTC" :type number :access :readwrite :declared-by date)
     (:full-year :swf-name "fullYear" :type number :access :readwrite :declared-by date)
     (:date :swf-name "date" :type number :access :readwrite :declared-by date)
     (:month :swf-name "month" :type number :access :readwrite :declared-by date)
     (:seconds :swf-name "seconds" :type number :access :readwrite :declared-by date)
     (:time :swf-name "time" :type number :access :readwrite :declared-by date)
     (:hours :swf-name "hours" :type number :access :readwrite :declared-by date)
     (:timezone-offset :swf-name "timezoneOffset" :type number :access :readonly :declared-by date)
     (:full-year-utc :swf-name "fullYearUTC" :type number :access :readwrite :declared-by date)
     (:milliseconds-utc :swf-name "millisecondsUTC" :type number :access :readwrite :declared-by date)
     (:minutes :swf-name "minutes" :type number :access :readwrite :declared-by date)
     (:date-utc :swf-name "dateUTC" :type number :access :readwrite :declared-by date)
     (:day-utc :swf-name "dayUTC" :type number :access :readonly :declared-by date)
     (:milliseconds :swf-name "milliseconds" :type number :access :readwrite :declared-by date)
     (:month-utc :swf-name "monthUTC" :type number :access :readwrite :declared-by date)
     (:minutes-utc :swf-name "minutesUTC" :type number :access :readwrite :declared-by date)
     (:seconds-utc :swf-name "secondsUTC" :type number :access :readwrite :declared-by date)
     (:day :swf-name "day" :type number :access :readonly :declared-by date))
    :methods
    ())

  (declare-swf-class flash.events::status-event (flash.events::event)
    :swf-name "flash.events::StatusEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+status+ :swf-name "STATUS" :type string))
    :properties
    ((:code :swf-name "code" :type string :access :readwrite :declared-by flash.events::status-event)
     (:level :swf-name "level" :type string :access :readwrite :declared-by flash.events::status-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::status-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::status-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.filters::blur-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::BlurFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:blur-y :swf-name "blurY" :type number :access :readwrite :declared-by flash.filters::blur-filter)
     (:blur-x :swf-name "blurX" :type number :access :readwrite :declared-by flash.filters::blur-filter)
     (:quality :swf-name "quality" :type int :access :readwrite :declared-by flash.filters::blur-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::blur-filter
          :args ())))

  (declare-swf-class flash.geom::color-transform (object)
    :swf-name "flash.geom::ColorTransform"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:color :swf-name "color" :type uint :access :readwrite :declared-by flash.geom::color-transform))
    :methods
    ((:concat :swf-name "concat" :return-type void :declared-by flash.geom::color-transform
          :args ((:index 1 :type flash.geom::color-transform :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.geom::color-transform
          :args ())))

  (declare-swf-class flash.text::static-text (flash.display::display-object)
    :swf-name "flash.text::StaticText"
    ;; :supers (flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:text :swf-name "text" :type string :access :readonly :declared-by flash.text::static-text)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class adobe.utils::custom-actions (object)
    :swf-name "adobe.utils::CustomActions"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::-url-stream (flash.events::event-dispatcher)
    :swf-name "flash.net::URLStream"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher
    ;;              flash.utils::i-data-input)
    ;;   = ("flash.events::IEventDispatcher" "flash.utils::IDataInput")
    :constants
    ()
    :properties
    ((:object-encoding :swf-name "objectEncoding" :type uint :access :readwrite :declared-by flash.net::-url-stream)
     (:connected :swf-name "connected" :type boolean :access :readonly :declared-by flash.net::-url-stream)
     (:bytes-available :swf-name "bytesAvailable" :type uint :access :readonly :declared-by flash.net::-url-stream)
     (:endian :swf-name "endian" :type string :access :readwrite :declared-by flash.net::-url-stream))
    :methods
    ((:read-double :swf-name "readDouble" :return-type number :declared-by flash.net::-url-stream
          :args ())
     (:read-unsigned-short :swf-name "readUnsignedShort" :return-type uint :declared-by flash.net::-url-stream
          :args ())
     (:read-object :swf-name "readObject" :return-type * :declared-by flash.net::-url-stream
          :args ())
     (:read-byte :swf-name "readByte" :return-type int :declared-by flash.net::-url-stream
          :args ())
     (:read-utf-bytes :swf-name "readUTFBytes" :return-type string :declared-by flash.net::-url-stream
          :args ((:index 1 :type uint :optional NIL)))
     (:read-float :swf-name "readFloat" :return-type number :declared-by flash.net::-url-stream
          :args ())
     (:read-multi-byte :swf-name "readMultiByte" :return-type string :declared-by flash.net::-url-stream
          :args ((:index 1 :type uint :optional NIL)
       (:index 2 :type string :optional NIL)))
     (:read-int :swf-name "readInt" :return-type int :declared-by flash.net::-url-stream
          :args ())
     (:load :swf-name "load" :return-type void :declared-by flash.net::-url-stream
          :args ((:index 1 :type flash.net::-url-request :optional NIL)))
     (:read-short :swf-name "readShort" :return-type int :declared-by flash.net::-url-stream
          :args ())
     (:read-utf :swf-name "readUTF" :return-type string :declared-by flash.net::-url-stream
          :args ())
     (:read-unsigned-int :swf-name "readUnsignedInt" :return-type uint :declared-by flash.net::-url-stream
          :args ())
     (:read-bytes :swf-name "readBytes" :return-type void :declared-by flash.net::-url-stream
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type uint :optional T)
       (:index 3 :type uint :optional T)))
     (:read-unsigned-byte :swf-name "readUnsignedByte" :return-type uint :declared-by flash.net::-url-stream
          :args ())
     (:read-boolean :swf-name "readBoolean" :return-type boolean :declared-by flash.net::-url-stream
          :args ())
     (:close :swf-name "close" :return-type void :declared-by flash.net::-url-stream
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.events::security-error-event (flash.events::error-event)
    :swf-name "flash.events::SecurityErrorEvent"
    ;; :supers (flash.events::error-event flash.events::text-event
    ;;          flash.events::event object)
    ;;   = ("flash.events::ErrorEvent" "flash.events::TextEvent"
    ;;      "flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+sec-uri-ty-error+ :swf-name "SECURITY_ERROR" :type string))
    :properties
    ((:text :swf-name "text" :type string :access :readwrite :declared-by flash.events::text-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::security-error-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::security-error-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.display::morph-shape (flash.display::display-object)
    :swf-name "flash.display::MorphShape"
    ;; :supers (flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.text::anti-alias-type (object)
    :swf-name "flash.text::AntiAliasType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+advanced+ :swf-name "ADVANCED" :type string)
     (:+normal+ :swf-name "NORMAL" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.media::microphone (flash.events::event-dispatcher)
    :swf-name "flash.media::Microphone"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:silence-level :swf-name "silenceLevel" :type number :access :readonly :declared-by flash.media::microphone)
     (:silence-timeout :swf-name "silenceTimeout" :type int :access :readonly :declared-by flash.media::microphone)
     (:muted :swf-name "muted" :type boolean :access :readonly :declared-by flash.media::microphone)
     (:use-echo-suppression :swf-name "useEchoSuppression" :type boolean :access :readonly :declared-by flash.media::microphone)
     (:activity-level :swf-name "activityLevel" :type number :access :readonly :declared-by flash.media::microphone)
     (:rate :swf-name "rate" :type int :access :readwrite :declared-by flash.media::microphone)
     (:index :swf-name "index" :type int :access :readonly :declared-by flash.media::microphone)
     (:gain :swf-name "gain" :type number :access :readwrite :declared-by flash.media::microphone)
     (:name :swf-name "name" :type string :access :readonly :declared-by flash.media::microphone)
     (:sound-transform :swf-name "soundTransform" :type flash.media::sound-transform :access :readwrite :declared-by flash.media::microphone))
    :methods
    ((:set-use-echo-suppression :swf-name "setUseEchoSuppression" :return-type void :declared-by flash.media::microphone
          :args ((:index 1 :type boolean :optional NIL)))
     (:set-silence-level :swf-name "setSilenceLevel" :return-type void :declared-by flash.media::microphone
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type int :optional T)))
     (:set-loop-back :swf-name "setLoopBack" :return-type void :declared-by flash.media::microphone
          :args ((:index 1 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.net::-url-loader-data-format (object)
    :swf-name "flash.net::URLLoaderDataFormat"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+binary+ :swf-name "BINARY" :type string)
     (:+text+ :swf-name "TEXT" :type string)
     (:+variables+ :swf-name "VARIABLES" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.media::sound-channel (flash.events::event-dispatcher)
    :swf-name "flash.media::SoundChannel"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:right-peak :swf-name "rightPeak" :type number :access :readonly :declared-by flash.media::sound-channel)
     (:sound-transform :swf-name "soundTransform" :type flash.media::sound-transform :access :readwrite :declared-by flash.media::sound-channel)
     (:position :swf-name "position" :type number :access :readonly :declared-by flash.media::sound-channel)
     (:left-peak :swf-name "leftPeak" :type number :access :readonly :declared-by flash.media::sound-channel))
    :methods
    ((:stop :swf-name "stop" :return-type void :declared-by flash.media::sound-channel
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.events::context-menu-event (flash.events::event)
    :swf-name "flash.events::ContextMenuEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+menu-item-select+ :swf-name "MENU_ITEM_SELECT" :type string)
     (:+menu-select+ :swf-name "MENU_SELECT" :type string))
    :properties
    ((:context-menu-owner :swf-name "contextMenuOwner" :type flash.display::interactive-object :access :readwrite :declared-by flash.events::context-menu-event)
     (:mouse-target :swf-name "mouseTarget" :type flash.display::interactive-object :access :readwrite :declared-by flash.events::context-menu-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::context-menu-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::context-menu-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.events::progress-event (flash.events::event)
    :swf-name "flash.events::ProgressEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+progress+ :swf-name "PROGRESS" :type string)
     (:+socket-data+ :swf-name "SOCKET_DATA" :type string))
    :properties
    ((:bytes-loaded :swf-name "bytesLoaded" :type uint :access :readwrite :declared-by flash.events::progress-event)
     (:bytes-total :swf-name "bytesTotal" :type uint :access :readwrite :declared-by flash.events::progress-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::progress-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::progress-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.text::text-field (flash.display::interactive-object)
    :swf-name "flash.text::TextField"
    ;; :supers (flash.display::interactive-object
    ;;          flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::InteractiveObject"
    ;;      "flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:max-scroll-v :swf-name "maxScrollV" :type int :access :readonly :declared-by flash.text::text-field)
     (:selectable :swf-name "selectable" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:caret-index :swf-name "caretIndex" :type int :access :readonly :declared-by flash.text::text-field)
     (:bottom-scroll-v :swf-name "bottomScrollV" :type int :access :readonly :declared-by flash.text::text-field)
     (:html-text :swf-name "htmlText" :type string :access :readwrite :declared-by flash.text::text-field)
     (:scroll-h :swf-name "scrollH" :type int :access :readwrite :declared-by flash.text::text-field)
     (:num-lines :swf-name "numLines" :type int :access :readonly :declared-by flash.text::text-field)
     (:max-scroll-h :swf-name "maxScrollH" :type int :access :readonly :declared-by flash.text::text-field)
     (:thickness :swf-name "thickness" :type number :access :readwrite :declared-by flash.text::text-field)
     (:text :swf-name "text" :type string :access :readwrite :declared-by flash.text::text-field)
     (:selected-text :swf-name "selectedText" :type string :access :readonly :declared-by flash.text::text-field)
     (:display-as-password :swf-name "displayAsPassword" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:type :swf-name "type" :type string :access :readwrite :declared-by flash.text::text-field)
     (:embed-fonts :swf-name "embedFonts" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:style-sheet :swf-name "styleSheet" :type flash.text::style-sheet :access :readwrite :declared-by flash.text::text-field)
     (:mouse-wheel-enabled :swf-name "mouseWheelEnabled" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:multiline :swf-name "multiline" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:auto-size :swf-name "autoSize" :type string :access :readwrite :declared-by flash.text::text-field)
     (:condense-white :swf-name "condenseWhite" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:default-text-format :swf-name "defaultTextFormat" :type flash.text::text-format :access :readwrite :declared-by flash.text::text-field)
     (:max-chars :swf-name "maxChars" :type int :access :readwrite :declared-by flash.text::text-field)
     (:text-color :swf-name "textColor" :type uint :access :readwrite :declared-by flash.text::text-field)
     (:text-height :swf-name "textHeight" :type number :access :readonly :declared-by flash.text::text-field)
     (:sharpness :swf-name "sharpness" :type number :access :readwrite :declared-by flash.text::text-field)
     (:background-color :swf-name "backgroundColor" :type uint :access :readwrite :declared-by flash.text::text-field)
     (:always-show-selection :swf-name "alwaysShowSelection" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:anti-alias-type :swf-name "antiAliasType" :type string :access :readwrite :declared-by flash.text::text-field)
     (:word-wrap :swf-name "wordWrap" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:border-color :swf-name "borderColor" :type uint :access :readwrite :declared-by flash.text::text-field)
     (:selection-begin-index :swf-name "selectionBeginIndex" :type int :access :readonly :declared-by flash.text::text-field)
     (:selection-end-index :swf-name "selectionEndIndex" :type int :access :readonly :declared-by flash.text::text-field)
     (:background :swf-name "background" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:text-width :swf-name "textWidth" :type number :access :readonly :declared-by flash.text::text-field)
     (:grid-fit-type :swf-name "gridFitType" :type string :access :readwrite :declared-by flash.text::text-field)
     (:length :swf-name "length" :type int :access :readonly :declared-by flash.text::text-field)
     (:border :swf-name "border" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:use-rich-text-clipboard :swf-name "useRichTextClipboard" :type boolean :access :readwrite :declared-by flash.text::text-field)
     (:restrict :swf-name "restrict" :type string :access :readwrite :declared-by flash.text::text-field)
     (:scroll-v :swf-name "scrollV" :type int :access :readwrite :declared-by flash.text::text-field)
     (:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-line-index-at-point :swf-name "getLineIndexAtPoint" :return-type int :declared-by flash.text::text-field
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:append-text :swf-name "appendText" :return-type void :declared-by flash.text::text-field
          :args ((:index 1 :type string :optional NIL)))
     (:set-text-format :swf-name "setTextFormat" :return-type void :declared-by flash.text::text-field
          :args ((:index 1 :type flash.text::text-format :optional NIL)
       (:index 2 :type int :optional T)
       (:index 3 :type int :optional T)))
     (:insert-xml-text :swf-name "insertXMLText" :return-type void :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type string :optional NIL)
       (:index 4 :type boolean :optional T)))
     (:set-selection :swf-name "setSelection" :return-type void :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:get-paragraph-length :swf-name "getParagraphLength" :return-type int :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:get-char-index-at-point :swf-name "getCharIndexAtPoint" :return-type int :declared-by flash.text::text-field
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:get-line-text :swf-name "getLineText" :return-type string :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:get-raw-text :swf-name "getRawText" :return-type string :declared-by flash.text::text-field
          :args ())
     (:get-line-length :swf-name "getLineLength" :return-type int :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:replace-selected-text :swf-name "replaceSelectedText" :return-type void :declared-by flash.text::text-field
          :args ((:index 1 :type string :optional NIL)))
     (:get-line-metrics :swf-name "getLineMetrics" :return-type flash.text::text-line-metrics :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:get-first-char-in-paragraph :swf-name "getFirstCharInParagraph" :return-type int :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:replace-text :swf-name "replaceText" :return-type void :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)
       (:index 3 :type string :optional NIL)))
     (:get-char-boundaries :swf-name "getCharBoundaries" :return-type flash.geom::rectangle :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:get-text-format :swf-name "getTextFormat" :return-type flash.text::text-format :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional T)
       (:index 2 :type int :optional T)))
     (:get-text-runs :swf-name "getTextRuns" :return-type array :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional T)
       (:index 2 :type int :optional T)))
     (:get-xml-text :swf-name "getXMLText" :return-type string :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional T)
       (:index 2 :type int :optional T)))
     (:get-image-reference :swf-name "getImageReference" :return-type flash.display::display-object :declared-by flash.text::text-field
          :args ((:index 1 :type string :optional NIL)))
     (:get-line-offset :swf-name "getLineOffset" :return-type int :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:get-line-index-of-char :swf-name "getLineIndexOfChar" :return-type int :declared-by flash.text::text-field
          :args ((:index 1 :type int :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class adobe.utils::-xml-ui (object)
    :swf-name "adobe.utils::XMLUI"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.ui::mouse (object)
    :swf-name "flash.ui::Mouse"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::activity-event (flash.events::event)
    :swf-name "flash.events::ActivityEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+activity+ :swf-name "ACTIVITY" :type string))
    :properties
    ((:activating :swf-name "activating" :type boolean :access :readwrite :declared-by flash.events::activity-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::activity-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::activity-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.system::-ime (flash.events::event-dispatcher)
    :swf-name "flash.system::IME"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ()
    :methods
    ((:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.net::object-encoding (object)
    :swf-name "flash.net::ObjectEncoding"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+amf3+ :swf-name "AMF3" :type uint)
     (:+amf0+ :swf-name "AMF0" :type uint)
     (:+default+ :swf-name "DEFAULT" :type uint))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.printing::print-job-options (object)
    :swf-name "flash.printing::PrintJobOptions"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::data-event (flash.events::text-event)
    :swf-name "flash.events::DataEvent"
    ;; :supers (flash.events::text-event flash.events::event object)
    ;;   = ("flash.events::TextEvent" "flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+data+ :swf-name "DATA" :type string)
     (:+upload-complete-data+ :swf-name "UPLOAD_COMPLETE_DATA" :type string))
    :properties
    ((:data :swf-name "data" :type string :access :readwrite :declared-by flash.events::data-event)
     (:text :swf-name "text" :type string :access :readwrite :declared-by flash.events::text-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::data-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::data-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.display::stage-quality (object)
    :swf-name "flash.display::StageQuality"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+medium+ :swf-name "MEDIUM" :type string)
     (:+low+ :swf-name "LOW" :type string)
     (:+best+ :swf-name "BEST" :type string)
     (:+high+ :swf-name "HIGH" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::-xml-socket (flash.events::event-dispatcher)
    :swf-name "flash.net::XMLSocket"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:connected :swf-name "connected" :type boolean :access :readonly :declared-by flash.net::-xml-socket))
    :methods
    ((:connect :swf-name "connect" :return-type void :declared-by flash.net::-xml-socket
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:send :swf-name "send" :return-type void :declared-by flash.net::-xml-socket
          :args ((:index 1 :type * :optional NIL)))
     (:close :swf-name "close" :return-type void :declared-by flash.net::-xml-socket
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.accessibility::accessibility-properties (object)
    :swf-name "flash.accessibility::AccessibilityProperties"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::-url-loader (flash.events::event-dispatcher)
    :swf-name "flash.net::URLLoader"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ()
    :methods
    ((:close :swf-name "close" :return-type void :declared-by flash.net::-url-loader
          :args ())
     (:load :swf-name "load" :return-type void :declared-by flash.net::-url-loader
          :args ((:index 1 :type flash.net::-url-request :optional NIL)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.net::net-connection (flash.events::event-dispatcher)
    :swf-name "flash.net::NetConnection"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:proxy-type :swf-name "proxyType" :type string :access :readwrite :declared-by flash.net::net-connection)
     (:connected-proxy-type :swf-name "connectedProxyType" :type string :access :readonly :declared-by flash.net::net-connection)
     (:using-tls :swf-name "usingTLS" :type boolean :access :readonly :declared-by flash.net::net-connection)
     (:client :swf-name "client" :type object :access :readwrite :declared-by flash.net::net-connection)
     (:uri :swf-name "uri" :type string :access :readonly :declared-by flash.net::net-connection)
     (:connected :swf-name "connected" :type boolean :access :readonly :declared-by flash.net::net-connection)
     (:object-encoding :swf-name "objectEncoding" :type uint :access :readwrite :declared-by flash.net::net-connection))
    :methods
    ((:connect :swf-name "connect" :return-type void :declared-by flash.net::net-connection
          :args ((:index 1 :type string :optional NIL)))
     (:call :swf-name "call" :return-type void :declared-by flash.net::net-connection
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type flash.net::responder :optional NIL)))
     (:add-header :swf-name "addHeader" :return-type void :declared-by flash.net::net-connection
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type boolean :optional T)
       (:index 3 :type object :optional T)))
     (:close :swf-name "close" :return-type void :declared-by flash.net::net-connection
          :args ())
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::display-object-container (flash.display::interactive-object)
    :swf-name "flash.display::DisplayObjectContainer"
    ;; :supers (flash.display::interactive-object
    ;;          flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::InteractiveObject"
    ;;      "flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:num-children :swf-name "numChildren" :type int :access :readonly :declared-by flash.display::display-object-container)
     (:mouse-children :swf-name "mouseChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:text-snapshot :swf-name "textSnapshot" :type flash.text::text-snapshot :access :readonly :declared-by flash.display::display-object-container)
     (:tab-children :swf-name "tabChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:add-child :swf-name "addChild" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:are-inaccessible-objects-under-point :swf-name "areInaccessibleObjectsUnderPoint" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:add-child-at :swf-name "addChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:set-child-index :swf-name "setChildIndex" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:remove-child-at :swf-name "removeChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:contains :swf-name "contains" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-index :swf-name "getChildIndex" :return-type int :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-objects-under-point :swf-name "getObjectsUnderPoint" :return-type array :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:swap-children :swf-name "swapChildren" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type flash.display::display-object :optional NIL)))
     (:get-child-by-name :swf-name "getChildByName" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type string :optional NIL)))
     (:remove-child :swf-name "removeChild" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-at :swf-name "getChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:swap-children-at :swf-name "swapChildrenAt" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::sprite (flash.display::display-object-container)
    :swf-name "flash.display::Sprite"
    ;; :supers (flash.display::display-object-container
    ;;          flash.display::interactive-object
    ;;          flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObjectContainer"
    ;;      "flash.display::InteractiveObject"
    ;;      "flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.events::i-event-dispatcher
    ;;              flash.display::i-bitmap-drawable)
    ;;   = ("flash.events::IEventDispatcher"
    ;;      "flash.display::IBitmapDrawable")
    :constants
    ()
    :properties
    ((:graphics :swf-name "graphics" :type flash.display::graphics :access :readonly :declared-by flash.display::sprite)
     (:button-mode :swf-name "buttonMode" :type boolean :access :readwrite :declared-by flash.display::sprite)
     (:use-hand-cursor :swf-name "useHandCursor" :type boolean :access :readwrite :declared-by flash.display::sprite)
     (:drop-target :swf-name "dropTarget" :type flash.display::display-object :access :readonly :declared-by flash.display::sprite)
     (:hit-area :swf-name "hitArea" :type flash.display::sprite :access :readwrite :declared-by flash.display::sprite)
     (:sound-transform :swf-name "soundTransform" :type flash.media::sound-transform :access :readwrite :declared-by flash.display::sprite)
     (:num-children :swf-name "numChildren" :type int :access :readonly :declared-by flash.display::display-object-container)
     (:mouse-children :swf-name "mouseChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:text-snapshot :swf-name "textSnapshot" :type flash.text::text-snapshot :access :readonly :declared-by flash.display::display-object-container)
     (:tab-children :swf-name "tabChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:start-drag :swf-name "startDrag" :return-type void :declared-by flash.display::sprite
          :args ((:index 1 :type boolean :optional T)
       (:index 2 :type flash.geom::rectangle :optional T)))
     (:stop-drag :swf-name "stopDrag" :return-type void :declared-by flash.display::sprite
          :args ())
     (:add-child :swf-name "addChild" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:are-inaccessible-objects-under-point :swf-name "areInaccessibleObjectsUnderPoint" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:add-child-at :swf-name "addChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:set-child-index :swf-name "setChildIndex" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:remove-child-at :swf-name "removeChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:contains :swf-name "contains" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-index :swf-name "getChildIndex" :return-type int :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-objects-under-point :swf-name "getObjectsUnderPoint" :return-type array :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:swap-children :swf-name "swapChildren" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type flash.display::display-object :optional NIL)))
     (:get-child-by-name :swf-name "getChildByName" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type string :optional NIL)))
     (:remove-child :swf-name "removeChild" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-at :swf-name "getChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:swap-children-at :swf-name "swapChildrenAt" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::movie-clip (flash.display::sprite)
    :swf-name "flash.display::MovieClip"
    ;; :supers (flash.display::sprite
    ;;          flash.display::display-object-container
    ;;          flash.display::interactive-object
    ;;          flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::Sprite" "flash.display::DisplayObjectContainer"
    ;;      "flash.display::InteractiveObject"
    ;;      "flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.events::i-event-dispatcher
    ;;              flash.display::i-bitmap-drawable)
    ;;   = ("flash.events::IEventDispatcher"
    ;;      "flash.display::IBitmapDrawable")
    :constants
    ()
    :properties
    ((:frames-loaded :swf-name "framesLoaded" :type int :access :readonly :declared-by flash.display::movie-clip)
     (:enabled :swf-name "enabled" :type boolean :access :readwrite :declared-by flash.display::movie-clip)
     (:current-label :swf-name "currentLabel" :type string :access :readonly :declared-by flash.display::movie-clip)
     (:current-labels :swf-name "currentLabels" :type array :access :readonly :declared-by flash.display::movie-clip)
     (:scenes :swf-name "scenes" :type array :access :readonly :declared-by flash.display::movie-clip)
     (:current-scene :swf-name "currentScene" :type flash.display::scene :access :readonly :declared-by flash.display::movie-clip)
     (:current-frame :swf-name "currentFrame" :type int :access :readonly :declared-by flash.display::movie-clip)
     (:track-as-menu :swf-name "trackAsMenu" :type boolean :access :readwrite :declared-by flash.display::movie-clip)
     (:total-frames :swf-name "totalFrames" :type int :access :readonly :declared-by flash.display::movie-clip)
     (:graphics :swf-name "graphics" :type flash.display::graphics :access :readonly :declared-by flash.display::sprite)
     (:button-mode :swf-name "buttonMode" :type boolean :access :readwrite :declared-by flash.display::sprite)
     (:use-hand-cursor :swf-name "useHandCursor" :type boolean :access :readwrite :declared-by flash.display::sprite)
     (:drop-target :swf-name "dropTarget" :type flash.display::display-object :access :readonly :declared-by flash.display::sprite)
     (:hit-area :swf-name "hitArea" :type flash.display::sprite :access :readwrite :declared-by flash.display::sprite)
     (:sound-transform :swf-name "soundTransform" :type flash.media::sound-transform :access :readwrite :declared-by flash.display::sprite)
     (:num-children :swf-name "numChildren" :type int :access :readonly :declared-by flash.display::display-object-container)
     (:mouse-children :swf-name "mouseChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:text-snapshot :swf-name "textSnapshot" :type flash.text::text-snapshot :access :readonly :declared-by flash.display::display-object-container)
     (:tab-children :swf-name "tabChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:play :swf-name "play" :return-type void :declared-by flash.display::movie-clip
          :args ())
     (:goto-and-play :swf-name "gotoAndPlay" :return-type void :declared-by flash.display::movie-clip
          :args ((:index 1 :type object :optional NIL)
       (:index 2 :type string :optional T)))
     (:prev-frame :swf-name "prevFrame" :return-type void :declared-by flash.display::movie-clip
          :args ())
     (:goto-and-stop :swf-name "gotoAndStop" :return-type void :declared-by flash.display::movie-clip
          :args ((:index 1 :type object :optional NIL)
       (:index 2 :type string :optional T)))
     (:add-frame-script :swf-name "addFrameScript" :return-type void :declared-by flash.display::movie-clip
          :args ())
     (:stop :swf-name "stop" :return-type void :declared-by flash.display::movie-clip
          :args ())
     (:prev-scene :swf-name "prevScene" :return-type void :declared-by flash.display::movie-clip
          :args ())
     (:next-frame :swf-name "nextFrame" :return-type void :declared-by flash.display::movie-clip
          :args ())
     (:next-scene :swf-name "nextScene" :return-type void :declared-by flash.display::movie-clip
          :args ())
     (:start-drag :swf-name "startDrag" :return-type void :declared-by flash.display::sprite
          :args ((:index 1 :type boolean :optional T)
       (:index 2 :type flash.geom::rectangle :optional T)))
     (:stop-drag :swf-name "stopDrag" :return-type void :declared-by flash.display::sprite
          :args ())
     (:add-child :swf-name "addChild" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:are-inaccessible-objects-under-point :swf-name "areInaccessibleObjectsUnderPoint" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:add-child-at :swf-name "addChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:set-child-index :swf-name "setChildIndex" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:remove-child-at :swf-name "removeChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:contains :swf-name "contains" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-index :swf-name "getChildIndex" :return-type int :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-objects-under-point :swf-name "getObjectsUnderPoint" :return-type array :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:swap-children :swf-name "swapChildren" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type flash.display::display-object :optional NIL)))
     (:get-child-by-name :swf-name "getChildByName" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type string :optional NIL)))
     (:remove-child :swf-name "removeChild" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-at :swf-name "getChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:swap-children-at :swf-name "swapChildrenAt" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.events::net-status-event (flash.events::event)
    :swf-name "flash.events::NetStatusEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+net-status+ :swf-name "NET_STATUS" :type string))
    :properties
    ((:info :swf-name "info" :type object :access :readwrite :declared-by flash.events::net-status-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::net-status-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::net-status-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.text::grid-fit-type (object)
    :swf-name "flash.text::GridFitType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+subpixel+ :swf-name "SUBPIXEL" :type string)
     (:+pixel+ :swf-name "PIXEL" :type string)
     (:+none+ :swf-name "NONE" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::caps-style (object)
    :swf-name "flash.display::CapsStyle"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+none+ :swf-name "NONE" :type string)
     (:+round+ :swf-name "ROUND" :type string)
     (:+square+ :swf-name "SQUARE" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::file-filter (object)
    :swf-name "flash.net::FileFilter"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:mac-type :swf-name "macType" :type string :access :readwrite :declared-by flash.net::file-filter)
     (:description :swf-name "description" :type string :access :readwrite :declared-by flash.net::file-filter)
     (:extension :swf-name "extension" :type string :access :readwrite :declared-by flash.net::file-filter))
    :methods
    ())

  (declare-swf-class flash.net::-url-request-header (object)
    :swf-name "flash.net::URLRequestHeader"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::text-display-mode (object)
    :swf-name "flash.text::TextDisplayMode"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+default+ :swf-name "DEFAULT" :type string)
     (:+lcd+ :swf-name "LCD" :type string)
     (:+crt+ :swf-name "CRT" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::-csm-settings (object)
    :swf-name "flash.text::CSMSettings"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.utils::endian (object)
    :swf-name "flash.utils::Endian"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+big-endian+ :swf-name "BIG_ENDIAN" :type string)
     (:+little-endian+ :swf-name "LITTLE_ENDIAN" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::font-type (object)
    :swf-name "flash.text::FontType"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+embedded+ :swf-name "EMBEDDED" :type string)
     (:+device+ :swf-name "DEVICE" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::simple-button (flash.display::interactive-object)
    :swf-name "flash.display::SimpleButton"
    ;; :supers (flash.display::interactive-object
    ;;          flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::InteractiveObject"
    ;;      "flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.display::i-bitmap-drawable
    ;;              flash.events::i-event-dispatcher)
    ;;   = ("flash.display::IBitmapDrawable"
    ;;      "flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:enabled :swf-name "enabled" :type boolean :access :readwrite :declared-by flash.display::simple-button)
     (:down-state :swf-name "downState" :type flash.display::display-object :access :readwrite :declared-by flash.display::simple-button)
     (:over-state :swf-name "overState" :type flash.display::display-object :access :readwrite :declared-by flash.display::simple-button)
     (:track-as-menu :swf-name "trackAsMenu" :type boolean :access :readwrite :declared-by flash.display::simple-button)
     (:use-hand-cursor :swf-name "useHandCursor" :type boolean :access :readwrite :declared-by flash.display::simple-button)
     (:up-state :swf-name "upState" :type flash.display::display-object :access :readwrite :declared-by flash.display::simple-button)
     (:sound-transform :swf-name "soundTransform" :type flash.media::sound-transform :access :readwrite :declared-by flash.display::simple-button)
     (:hit-test-state :swf-name "hitTestState" :type flash.display::display-object :access :readwrite :declared-by flash.display::simple-button)
     (:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.utils::proxy (object)
    :swf-name "flash.utils::Proxy"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:next-value :swf-name "nextValue" :return-type * :declared-by flash.utils::proxy
          :args ((:index 1 :type int :optional NIL)))
     (:set-property :swf-name "setProperty" :return-type void :declared-by flash.utils::proxy
          :args ((:index 1 :type * :optional NIL)
       (:index 2 :type * :optional NIL)))
     (:next-name-index :swf-name "nextNameIndex" :return-type int :declared-by flash.utils::proxy
          :args ((:index 1 :type int :optional NIL)))
     (:delete-property :swf-name "deleteProperty" :return-type boolean :declared-by flash.utils::proxy
          :args ((:index 1 :type * :optional NIL)))
     (:has-property :swf-name "hasProperty" :return-type boolean :declared-by flash.utils::proxy
          :args ((:index 1 :type * :optional NIL)))
     (:get-descendants :swf-name "getDescendants" :return-type * :declared-by flash.utils::proxy
          :args ((:index 1 :type * :optional NIL)))
     (:get-property :swf-name "getProperty" :return-type * :declared-by flash.utils::proxy
          :args ((:index 1 :type * :optional NIL)))
     (:is-attribute :swf-name "isAttribute" :return-type boolean :declared-by flash.utils::proxy
          :args ((:index 1 :type * :optional NIL)))
     (:next-name :swf-name "nextName" :return-type string :declared-by flash.utils::proxy
          :args ((:index 1 :type int :optional NIL)))
     (:call-property :swf-name "callProperty" :return-type * :declared-by flash.utils::proxy
          :args ((:index 1 :type * :optional NIL)))))

  (declare-swf-class flash.system::security-panel (object)
    :swf-name "flash.system::SecurityPanel"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+local-storage+ :swf-name "LOCAL_STORAGE" :type string)
     (:+default+ :swf-name "DEFAULT" :type string)
     (:+microphone+ :swf-name "MICROPHONE" :type string)
     (:+display+ :swf-name "DISPLAY" :type string)
     (:+privacy+ :swf-name "PRIVACY" :type string)
     (:+camera+ :swf-name "CAMERA" :type string)
     (:+settings-manager+ :swf-name "SETTINGS_MANAGER" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.filters::glow-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::GlowFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:blur-y :swf-name "blurY" :type number :access :readwrite :declared-by flash.filters::glow-filter)
     (:strength :swf-name "strength" :type number :access :readwrite :declared-by flash.filters::glow-filter)
     (:blur-x :swf-name "blurX" :type number :access :readwrite :declared-by flash.filters::glow-filter)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.filters::glow-filter)
     (:color :swf-name "color" :type uint :access :readwrite :declared-by flash.filters::glow-filter)
     (:knockout :swf-name "knockout" :type boolean :access :readwrite :declared-by flash.filters::glow-filter)
     (:inner :swf-name "inner" :type boolean :access :readwrite :declared-by flash.filters::glow-filter)
     (:quality :swf-name "quality" :type int :access :readwrite :declared-by flash.filters::glow-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::glow-filter
          :args ())))

  (declare-swf-class flash.net::-url-variables (object)
    :swf-name "flash.net::URLVariables"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:decode :swf-name "decode" :return-type void :declared-by flash.net::-url-variables
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.net::-url-variables
          :args ())))

  (declare-swf-class flash.events::full-screen-event (flash.events::activity-event)
    :swf-name "flash.events::FullScreenEvent"
    ;; :supers (flash.events::activity-event flash.events::event object)
    ;;   = ("flash.events::ActivityEvent" "flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+full-screen+ :swf-name "FULL_SCREEN" :type string))
    :properties
    ((:full-screen :swf-name "fullScreen" :type boolean :access :readonly :declared-by flash.events::full-screen-event)
     (:activating :swf-name "activating" :type boolean :access :readwrite :declared-by flash.events::activity-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::full-screen-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::full-screen-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.media::sound-loader-context (object)
    :swf-name "flash.media::SoundLoaderContext"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::file-reference-list (flash.events::event-dispatcher)
    :swf-name "flash.net::FileReferenceList"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:file-list :swf-name "fileList" :type array :access :readonly :declared-by flash.net::file-reference-list))
    :methods
    ((:browse :swf-name "browse" :return-type boolean :declared-by flash.net::file-reference-list
          :args ((:index 1 :type array :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.filters::bitmap-filter-quality (object)
    :swf-name "flash.filters::BitmapFilterQuality"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+low+ :swf-name "LOW" :type int)
     (:+high+ :swf-name "HIGH" :type int)
     (:+medium+ :swf-name "MEDIUM" :type int))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::graphics (object)
    :swf-name "flash.display::Graphics"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:begin-bitmap-fill :swf-name "beginBitmapFill" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type flash.display::bitmap-data :optional NIL)
       (:index 2 :type flash.geom::matrix :optional T)
       (:index 3 :type boolean :optional T)
       (:index 4 :type boolean :optional T)))
     (:line-gradient-style :swf-name "lineGradientStyle" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type array :optional NIL)
       (:index 3 :type array :optional NIL)
       (:index 4 :type array :optional NIL)
       (:index 5 :type flash.geom::matrix :optional T)
       (:index 6 :type string :optional T)
       (:index 7 :type string :optional T)
       (:index 8 :type number :optional T)))
     (:begin-fill :swf-name "beginFill" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type uint :optional NIL)
       (:index 2 :type number :optional T)))
     (:draw-ellipse :swf-name "drawEllipse" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional NIL)
       (:index 4 :type number :optional NIL)))
     (:line-style :swf-name "lineStyle" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional T)
       (:index 2 :type uint :optional T)
       (:index 3 :type number :optional T)
       (:index 4 :type boolean :optional T)
       (:index 5 :type string :optional T)
       (:index 6 :type string :optional T)
       (:index 7 :type string :optional T)
       (:index 8 :type number :optional T)))
     (:draw-round-rect :swf-name "drawRoundRect" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional NIL)
       (:index 4 :type number :optional NIL)
       (:index 5 :type number :optional NIL)
       (:index 6 :type number :optional T)))
     (:curve-to :swf-name "curveTo" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional NIL)
       (:index 4 :type number :optional NIL)))
     (:clear :swf-name "clear" :return-type void :declared-by flash.display::graphics
          :args ())
     (:line-to :swf-name "lineTo" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))
     (:draw-rect :swf-name "drawRect" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional NIL)
       (:index 4 :type number :optional NIL)))
     (:end-fill :swf-name "endFill" :return-type void :declared-by flash.display::graphics
          :args ())
     (:draw-circle :swf-name "drawCircle" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional NIL)))
     (:draw-round-rect-complex :swf-name "drawRoundRectComplex" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type number :optional NIL)
       (:index 4 :type number :optional NIL)
       (:index 5 :type number :optional NIL)
       (:index 6 :type number :optional NIL)
       (:index 7 :type number :optional NIL)
       (:index 8 :type number :optional NIL)))
     (:begin-gradient-fill :swf-name "beginGradientFill" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type array :optional NIL)
       (:index 3 :type array :optional NIL)
       (:index 4 :type array :optional NIL)
       (:index 5 :type flash.geom::matrix :optional T)
       (:index 6 :type string :optional T)
       (:index 7 :type string :optional T)
       (:index 8 :type number :optional T)))
     (:move-to :swf-name "moveTo" :return-type void :declared-by flash.display::graphics
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))))

  (declare-swf-class flash.text::text-format (object)
    :swf-name "flash.text::TextFormat"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:indent :swf-name "indent" :type object :access :readwrite :declared-by flash.text::text-format)
     (:right-margin :swf-name "rightMargin" :type object :access :readwrite :declared-by flash.text::text-format)
     (:left-margin :swf-name "leftMargin" :type object :access :readwrite :declared-by flash.text::text-format)
     (:align :swf-name "align" :type string :access :readwrite :declared-by flash.text::text-format)
     (:display :swf-name "display" :type string :access :readwrite :declared-by flash.text::text-format)
     (:color :swf-name "color" :type object :access :readwrite :declared-by flash.text::text-format)
     (:leading :swf-name "leading" :type object :access :readwrite :declared-by flash.text::text-format)
     (:underline :swf-name "underline" :type object :access :readwrite :declared-by flash.text::text-format)
     (:target :swf-name "target" :type string :access :readwrite :declared-by flash.text::text-format)
     (:italic :swf-name "italic" :type object :access :readwrite :declared-by flash.text::text-format)
     (:url :swf-name "url" :type string :access :readwrite :declared-by flash.text::text-format)
     (:bold :swf-name "bold" :type object :access :readwrite :declared-by flash.text::text-format)
     (:font :swf-name "font" :type string :access :readwrite :declared-by flash.text::text-format)
     (:kerning :swf-name "kerning" :type object :access :readwrite :declared-by flash.text::text-format)
     (:size :swf-name "size" :type object :access :readwrite :declared-by flash.text::text-format)
     (:tab-stops :swf-name "tabStops" :type array :access :readwrite :declared-by flash.text::text-format)
     (:letter-spacing :swf-name "letterSpacing" :type object :access :readwrite :declared-by flash.text::text-format)
     (:block-indent :swf-name "blockIndent" :type object :access :readwrite :declared-by flash.text::text-format)
     (:bullet :swf-name "bullet" :type object :access :readwrite :declared-by flash.text::text-format))
    :methods
    ())

  (declare-swf-class flash.events::timer-event (flash.events::event)
    :swf-name "flash.events::TimerEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+t-ime-r-complete+ :swf-name "TIMER_COMPLETE" :type string)
     (:+t-ime-r+ :swf-name "TIMER" :type string))
    :properties
    ((:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::timer-event
          :args ())
     (:update-after-event :swf-name "updateAfterEvent" :return-type void :declared-by flash.events::timer-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::timer-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.utils::i-externalizable ()
    :swf-name "flash.utils::IExternalizable"
    ;; :supers NIL
    ;;   = NIL
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ((:read-external :swf-name "readExternal" :return-type void :declared-by flash.utils::i-externalizable
          :args ((:index 1 :type flash.utils::i-data-input :optional NIL)))
     (:write-external :swf-name "writeExternal" :return-type void :declared-by flash.utils::i-externalizable
          :args ((:index 1 :type flash.utils::i-data-output :optional NIL)))))

  (declare-swf-class flash.media::sound (flash.events::event-dispatcher)
    :swf-name "flash.media::Sound"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:id3 :swf-name "id3" :type flash.media::-id3info :access :readonly :declared-by flash.media::sound)
     (:bytes-loaded :swf-name "bytesLoaded" :type uint :access :readonly :declared-by flash.media::sound)
     (:is-buffering :swf-name "isBuffering" :type boolean :access :readonly :declared-by flash.media::sound)
     (:url :swf-name "url" :type string :access :readonly :declared-by flash.media::sound)
     (:bytes-total :swf-name "bytesTotal" :type int :access :readonly :declared-by flash.media::sound)
     (:length :swf-name "length" :type number :access :readonly :declared-by flash.media::sound))
    :methods
    ((:load :swf-name "load" :return-type void :declared-by flash.media::sound
          :args ((:index 1 :type flash.net::-url-request :optional NIL)
       (:index 2 :type flash.media::sound-loader-context :optional T)))
     (:close :swf-name "close" :return-type void :declared-by flash.media::sound
          :args ())
     (:play :swf-name "play" :return-type flash.media::sound-channel :declared-by flash.media::sound
          :args ((:index 1 :type number :optional T)
       (:index 2 :type int :optional T)
       (:index 3 :type flash.media::sound-transform :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.text::style-sheet (flash.events::event-dispatcher)
    :swf-name "flash.text::StyleSheet"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:style-names :swf-name "styleNames" :type array :access :readonly :declared-by flash.text::style-sheet))
    :methods
    ((:parse-css :swf-name "parseCSS" :return-type void :declared-by flash.text::style-sheet
          :args ((:index 1 :type string :optional NIL)))
     (:set-style :swf-name "setStyle" :return-type void :declared-by flash.text::style-sheet
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type object :optional NIL)))
     (:transform :swf-name "transform" :return-type flash.text::text-format :declared-by flash.text::style-sheet
          :args ((:index 1 :type object :optional NIL)))
     (:clear :swf-name "clear" :return-type void :declared-by flash.text::style-sheet
          :args ())
     (:get-style :swf-name "getStyle" :return-type object :declared-by flash.text::style-sheet
          :args ((:index 1 :type string :optional NIL)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::loader (flash.display::display-object-container)
    :swf-name "flash.display::Loader"
    ;; :supers (flash.display::display-object-container
    ;;          flash.display::interactive-object
    ;;          flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObjectContainer"
    ;;      "flash.display::InteractiveObject"
    ;;      "flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.events::i-event-dispatcher
    ;;              flash.display::i-bitmap-drawable)
    ;;   = ("flash.events::IEventDispatcher"
    ;;      "flash.display::IBitmapDrawable")
    :constants
    ()
    :properties
    ((:content-loader-info :swf-name "contentLoaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::loader)
     (:content :swf-name "content" :type flash.display::display-object :access :readonly :declared-by flash.display::loader)
     (:num-children :swf-name "numChildren" :type int :access :readonly :declared-by flash.display::display-object-container)
     (:mouse-children :swf-name "mouseChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:text-snapshot :swf-name "textSnapshot" :type flash.text::text-snapshot :access :readonly :declared-by flash.display::display-object-container)
     (:tab-children :swf-name "tabChildren" :type boolean :access :readwrite :declared-by flash.display::display-object-container)
     (:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:add-child :swf-name "addChild" :return-type flash.display::display-object :declared-by flash.display::loader
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:add-child-at :swf-name "addChildAt" :return-type flash.display::display-object :declared-by flash.display::loader
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:set-child-index :swf-name "setChildIndex" :return-type void :declared-by flash.display::loader
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:remove-child-at :swf-name "removeChildAt" :return-type flash.display::display-object :declared-by flash.display::loader
          :args ((:index 1 :type int :optional NIL)))
     (:remove-child :swf-name "removeChild" :return-type flash.display::display-object :declared-by flash.display::loader
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:load :swf-name "load" :return-type void :declared-by flash.display::loader
          :args ((:index 1 :type flash.net::-url-request :optional NIL)
       (:index 2 :type flash.system::loader-context :optional T)))
     (:load-bytes :swf-name "loadBytes" :return-type void :declared-by flash.display::loader
          :args ((:index 1 :type flash.utils::byte-array :optional NIL)
       (:index 2 :type flash.system::loader-context :optional T)))
     (:unload :swf-name "unload" :return-type void :declared-by flash.display::loader
          :args ())
     (:close :swf-name "close" :return-type void :declared-by flash.display::loader
          :args ())
     (:are-inaccessible-objects-under-point :swf-name "areInaccessibleObjectsUnderPoint" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:contains :swf-name "contains" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-index :swf-name "getChildIndex" :return-type int :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-objects-under-point :swf-name "getObjectsUnderPoint" :return-type array :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:swap-children :swf-name "swapChildren" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type flash.display::display-object :optional NIL)))
     (:get-child-by-name :swf-name "getChildByName" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type string :optional NIL)))
     (:get-child-at :swf-name "getChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:swap-children-at :swf-name "swapChildrenAt" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::blend-mode (object)
    :swf-name "flash.display::BlendMode"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+subtract+ :swf-name "SUBTRACT" :type string)
     (:+screen+ :swf-name "SCREEN" :type string)
     (:+add+ :swf-name "ADD" :type string)
     (:+layer+ :swf-name "LAYER" :type string)
     (:+multiply+ :swf-name "MULTIPLY" :type string)
     (:+darken+ :swf-name "DARKEN" :type string)
     (:+overlay+ :swf-name "OVERLAY" :type string)
     (:+normal+ :swf-name "NORMAL" :type string)
     (:+hardlight+ :swf-name "HARDLIGHT" :type string)
     (:+invert+ :swf-name "INVERT" :type string)
     (:+erase+ :swf-name "ERASE" :type string)
     (:+lighten+ :swf-name "LIGHTEN" :type string)
     (:+alpha+ :swf-name "ALPHA" :type string)
     (:+difference+ :swf-name "DIFFERENCE" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.geom::point (object)
    :swf-name "flash.geom::Point"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:length :swf-name "length" :type number :access :readonly :declared-by flash.geom::point))
    :methods
    ((:subtract :swf-name "subtract" :return-type flash.geom::point :declared-by flash.geom::point
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:equals :swf-name "equals" :return-type boolean :declared-by flash.geom::point
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.geom::point
          :args ())
     (:clone :swf-name "clone" :return-type flash.geom::point :declared-by flash.geom::point
          :args ())
     (:add :swf-name "add" :return-type flash.geom::point :declared-by flash.geom::point
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:normalize :swf-name "normalize" :return-type void :declared-by flash.geom::point
          :args ((:index 1 :type number :optional NIL)))
     (:offset :swf-name "offset" :return-type void :declared-by flash.geom::point
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)))))

  (declare-swf-class flash.events::mouse-event (flash.events::event)
    :swf-name "flash.events::MouseEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+roll-out+ :swf-name "ROLL_OUT" :type string)
     (:+mouse-down+ :swf-name "MOUSE_DOWN" :type string)
     (:+mouse-up+ :swf-name "MOUSE_UP" :type string)
     (:+mouse-wheel+ :swf-name "MOUSE_WHEEL" :type string)
     (:+mouse-over+ :swf-name "MOUSE_OVER" :type string)
     (:+click+ :swf-name "CLICK" :type string)
     (:+roll-over+ :swf-name "ROLL_OVER" :type string)
     (:+double-click+ :swf-name "DOUBLE_CLICK" :type string)
     (:+mouse-move+ :swf-name "MOUSE_MOVE" :type string)
     (:+mouse-out+ :swf-name "MOUSE_OUT" :type string))
    :properties
    ((:alt-key :swf-name "altKey" :type boolean :access :readwrite :declared-by flash.events::mouse-event)
     (:delta :swf-name "delta" :type int :access :readwrite :declared-by flash.events::mouse-event)
     (:ctrl-key :swf-name "ctrlKey" :type boolean :access :readwrite :declared-by flash.events::mouse-event)
     (:stage-y :swf-name "stageY" :type number :access :readonly :declared-by flash.events::mouse-event)
     (:stage-x :swf-name "stageX" :type number :access :readonly :declared-by flash.events::mouse-event)
     (:local-y :swf-name "localY" :type number :access :readwrite :declared-by flash.events::mouse-event)
     (:local-x :swf-name "localX" :type number :access :readwrite :declared-by flash.events::mouse-event)
     (:shift-key :swf-name "shiftKey" :type boolean :access :readwrite :declared-by flash.events::mouse-event)
     (:related-object :swf-name "relatedObject" :type flash.display::interactive-object :access :readwrite :declared-by flash.events::mouse-event)
     (:button-down :swf-name "buttonDown" :type boolean :access :readwrite :declared-by flash.events::mouse-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::mouse-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::mouse-event
          :args ())
     (:update-after-event :swf-name "updateAfterEvent" :return-type void :declared-by flash.events::mouse-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.text::font (object)
    :swf-name "flash.text::Font"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:font-style :swf-name "fontStyle" :type string :access :readonly :declared-by flash.text::font)
     (:font-type :swf-name "fontType" :type string :access :readonly :declared-by flash.text::font)
     (:font-name :swf-name "fontName" :type string :access :readonly :declared-by flash.text::font))
    :methods
    ((:has-glyphs :swf-name "hasGlyphs" :return-type boolean :declared-by flash.text::font
          :args ((:index 1 :type string :optional NIL)))))

  (declare-swf-class flash.display::stage (flash.display::display-object-container)
    :swf-name "flash.display::Stage"
    ;; :supers (flash.display::display-object-container
    ;;          flash.display::interactive-object
    ;;          flash.display::display-object flash.events::event-dispatcher
    ;;          object)
    ;;   = ("flash.display::DisplayObjectContainer"
    ;;      "flash.display::InteractiveObject"
    ;;      "flash.display::DisplayObject" "flash.events::EventDispatcher"
    ;;      "Object")
    ;; :interfaces (flash.events::i-event-dispatcher
    ;;              flash.display::i-bitmap-drawable)
    ;;   = ("flash.events::IEventDispatcher"
    ;;      "flash.display::IBitmapDrawable")
    :constants
    ()
    :properties
    ((:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-children :swf-name "tabChildren" :type boolean :access :readwrite :declared-by flash.display::stage)
     (:num-children :swf-name "numChildren" :type int :access :readonly :declared-by flash.display::stage)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:display-state :swf-name "displayState" :type string :access :readwrite :declared-by flash.display::stage)
     (:height :swf-name "height" :type number :access :readwrite :declared-by flash.display::stage)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-children :swf-name "mouseChildren" :type boolean :access :readwrite :declared-by flash.display::stage)
     (:text-snapshot :swf-name "textSnapshot" :type flash.text::text-snapshot :access :readonly :declared-by flash.display::stage)
     (:width :swf-name "width" :type number :access :readwrite :declared-by flash.display::stage)
     (:quality :swf-name "quality" :type string :access :readwrite :declared-by flash.display::stage)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object)
     (:full-screen-height :swf-name "fullScreenHeight" :type uint :access :readonly :declared-by flash.display::stage)
     (:stage-width :swf-name "stageWidth" :type int :access :readwrite :declared-by flash.display::stage)
     (:show-default-context-menu :swf-name "showDefaultContextMenu" :type boolean :access :readwrite :declared-by flash.display::stage)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:full-screen-source-rect :swf-name "fullScreenSourceRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::stage)
     (:frame-rate :swf-name "frameRate" :type number :access :readwrite :declared-by flash.display::stage)
     (:scale-mode :swf-name "scaleMode" :type string :access :readwrite :declared-by flash.display::stage)
     (:full-screen-width :swf-name "fullScreenWidth" :type uint :access :readonly :declared-by flash.display::stage)
     (:align :swf-name "align" :type string :access :readwrite :declared-by flash.display::stage)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:stage-focus-rect :swf-name "stageFocusRect" :type boolean :access :readwrite :declared-by flash.display::stage)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:stage-height :swf-name "stageHeight" :type int :access :readwrite :declared-by flash.display::stage)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:focus :swf-name "focus" :type flash.display::interactive-object :access :readwrite :declared-by flash.display::stage)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:double-click-enabled :swf-name "doubleClickEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-enabled :swf-name "tabEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:tab-index :swf-name "tabIndex" :type int :access :readwrite :declared-by flash.display::interactive-object)
     (:focus-rect :swf-name "focusRect" :type object :access :readwrite :declared-by flash.display::interactive-object)
     (:mouse-enabled :swf-name "mouseEnabled" :type boolean :access :readwrite :declared-by flash.display::interactive-object)
     (:accessibility-implementation :swf-name "accessibilityImplementation" :type flash.accessibility::accessibility-implementation :access :readwrite :declared-by flash.display::interactive-object)
     (:context-menu :swf-name "contextMenu" :type flash.ui::context-menu :access :readwrite :declared-by flash.display::interactive-object)
     (:rotation :swf-name "rotation" :type number :access :readwrite :declared-by flash.display::display-object)
     (:cache-as-bitmap :swf-name "cacheAsBitmap" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:scroll-rect :swf-name "scrollRect" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:filters :swf-name "filters" :type array :access :readwrite :declared-by flash.display::display-object)
     (:accessibility-properties :swf-name "accessibilityProperties" :type flash.accessibility::accessibility-properties :access :readwrite :declared-by flash.display::display-object)
     (:mouse-x :swf-name "mouseX" :type number :access :readonly :declared-by flash.display::display-object)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.display::display-object)
     (:parent :swf-name "parent" :type flash.display::display-object-container :access :readonly :declared-by flash.display::display-object)
     (:root :swf-name "root" :type flash.display::display-object :access :readonly :declared-by flash.display::display-object)
     (:scale9grid :swf-name "scale9Grid" :type flash.geom::rectangle :access :readwrite :declared-by flash.display::display-object)
     (:loader-info :swf-name "loaderInfo" :type flash.display::loader-info :access :readonly :declared-by flash.display::display-object)
     (:scale-y :swf-name "scaleY" :type number :access :readwrite :declared-by flash.display::display-object)
     (:x :swf-name "x" :type number :access :readwrite :declared-by flash.display::display-object)
     (:visible :swf-name "visible" :type boolean :access :readwrite :declared-by flash.display::display-object)
     (:blend-mode :swf-name "blendMode" :type string :access :readwrite :declared-by flash.display::display-object)
     (:mouse-y :swf-name "mouseY" :type number :access :readonly :declared-by flash.display::display-object)
     (:stage :swf-name "stage" :type flash.display::stage :access :readonly :declared-by flash.display::display-object)
     (:scale-x :swf-name "scaleX" :type number :access :readwrite :declared-by flash.display::display-object)
     (:mask :swf-name "mask" :type flash.display::display-object :access :readwrite :declared-by flash.display::display-object)
     (:transform :swf-name "transform" :type flash.geom::transform :access :readwrite :declared-by flash.display::display-object)
     (:y :swf-name "y" :type number :access :readwrite :declared-by flash.display::display-object)
     (:name :swf-name "name" :type string :access :readwrite :declared-by flash.display::display-object)
     (:opaque-background :swf-name "opaqueBackground" :type object :access :readwrite :declared-by flash.display::display-object))
    :methods
    ((:remove-child-at :swf-name "removeChildAt" :return-type flash.display::display-object :declared-by flash.display::stage
          :args ((:index 1 :type int :optional NIL)))
     (:swap-children-at :swf-name "swapChildrenAt" :return-type void :declared-by flash.display::stage
          :args ((:index 1 :type int :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:add-child-at :swf-name "addChildAt" :return-type flash.display::display-object :declared-by flash.display::stage
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:set-child-index :swf-name "setChildIndex" :return-type void :declared-by flash.display::stage
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type int :optional NIL)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.display::stage
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.display::stage
          :args ((:index 1 :type flash.events::event :optional NIL)))
     (:is-focus-inaccessible :swf-name "isFocusInaccessible" :return-type boolean :declared-by flash.display::stage
          :args ())
     (:add-child :swf-name "addChild" :return-type flash.display::display-object :declared-by flash.display::stage
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:invalidate :swf-name "invalidate" :return-type void :declared-by flash.display::stage
          :args ())
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.display::stage
          :args ((:index 1 :type string :optional NIL)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.display::stage
          :args ((:index 1 :type string :optional NIL)))
     (:are-inaccessible-objects-under-point :swf-name "areInaccessibleObjectsUnderPoint" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:contains :swf-name "contains" :return-type boolean :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-index :swf-name "getChildIndex" :return-type int :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-objects-under-point :swf-name "getObjectsUnderPoint" :return-type array :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:swap-children :swf-name "swapChildren" :return-type void :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)
       (:index 2 :type flash.display::display-object :optional NIL)))
     (:get-child-by-name :swf-name "getChildByName" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type string :optional NIL)))
     (:remove-child :swf-name "removeChild" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-child-at :swf-name "getChildAt" :return-type flash.display::display-object :declared-by flash.display::display-object-container
          :args ((:index 1 :type int :optional NIL)))
     (:get-bounds :swf-name "getBounds" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:global-to-local :swf-name "globalToLocal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:local-to-global :swf-name "localToGlobal" :return-type flash.geom::point :declared-by flash.display::display-object
          :args ((:index 1 :type flash.geom::point :optional NIL)))
     (:hit-test-object :swf-name "hitTestObject" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:get-rect :swf-name "getRect" :return-type flash.geom::rectangle :declared-by flash.display::display-object
          :args ((:index 1 :type flash.display::display-object :optional NIL)))
     (:hit-test-point :swf-name "hitTestPoint" :return-type boolean :declared-by flash.display::display-object
          :args ((:index 1 :type number :optional NIL)
       (:index 2 :type number :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))))

  (declare-swf-class flash.system::loader-context (object)
    :swf-name "flash.system::LoaderContext"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.geom::transform (object)
    :swf-name "flash.geom::Transform"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:matrix :swf-name "matrix" :type flash.geom::matrix :access :readwrite :declared-by flash.geom::transform)
     (:concatenated-matrix :swf-name "concatenatedMatrix" :type flash.geom::matrix :access :readonly :declared-by flash.geom::transform)
     (:pixel-bounds :swf-name "pixelBounds" :type flash.geom::rectangle :access :readonly :declared-by flash.geom::transform)
     (:concatenated-color-transform :swf-name "concatenatedColorTransform" :type flash.geom::color-transform :access :readonly :declared-by flash.geom::transform)
     (:color-transform :swf-name "colorTransform" :type flash.geom::color-transform :access :readwrite :declared-by flash.geom::transform))
    :methods
    ())

  (declare-swf-class flash.system::security (object)
    :swf-name "flash.system::Security"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+local-trusted+ :swf-name "LOCAL_TRUSTED" :type string)
     (:+remote+ :swf-name "REMOTE" :type string)
     (:+local-with-network+ :swf-name "LOCAL_WITH_NETWORK" :type string)
     (:+local-with-file+ :swf-name "LOCAL_WITH_FILE" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::keyboard-event (flash.events::event)
    :swf-name "flash.events::KeyboardEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+key-down+ :swf-name "KEY_DOWN" :type string)
     (:+key-up+ :swf-name "KEY_UP" :type string))
    :properties
    ((:alt-key :swf-name "altKey" :type boolean :access :readwrite :declared-by flash.events::keyboard-event)
     (:key-location :swf-name "keyLocation" :type uint :access :readwrite :declared-by flash.events::keyboard-event)
     (:key-code :swf-name "keyCode" :type uint :access :readwrite :declared-by flash.events::keyboard-event)
     (:shift-key :swf-name "shiftKey" :type boolean :access :readwrite :declared-by flash.events::keyboard-event)
     (:char-code :swf-name "charCode" :type uint :access :readwrite :declared-by flash.events::keyboard-event)
     (:ctrl-key :swf-name "ctrlKey" :type boolean :access :readwrite :declared-by flash.events::keyboard-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::keyboard-event
          :args ())
     (:update-after-event :swf-name "updateAfterEvent" :return-type void :declared-by flash.events::keyboard-event
          :args ())
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::keyboard-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.display::spread-method (object)
    :swf-name "flash.display::SpreadMethod"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+pad+ :swf-name "PAD" :type string)
     (:+reflect+ :swf-name "REFLECT" :type string)
     (:+repeat+ :swf-name "REPEAT" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::event-phase (object)
    :swf-name "flash.events::EventPhase"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+bubbling-phase+ :swf-name "BUBBLING_PHASE" :type uint)
     (:+capt-uri-ng-phase+ :swf-name "CAPTURING_PHASE" :type uint)
     (:+at-target+ :swf-name "AT_TARGET" :type uint))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::pixel-snapping (object)
    :swf-name "flash.display::PixelSnapping"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+always+ :swf-name "ALWAYS" :type string)
     (:+auto+ :swf-name "AUTO" :type string)
     (:+never+ :swf-name "NEVER" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::text-line-metrics (object)
    :swf-name "flash.text::TextLineMetrics"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::file-reference (flash.events::event-dispatcher)
    :swf-name "flash.net::FileReference"
    ;; :supers (flash.events::event-dispatcher object)
    ;;   = ("flash.events::EventDispatcher" "Object")
    ;; :interfaces (flash.events::i-event-dispatcher)
    ;;   = ("flash.events::IEventDispatcher")
    :constants
    ()
    :properties
    ((:size :swf-name "size" :type uint :access :readonly :declared-by flash.net::file-reference)
     (:creator :swf-name "creator" :type string :access :readonly :declared-by flash.net::file-reference)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.net::file-reference)
     (:creation-date :swf-name "creationDate" :type date :access :readonly :declared-by flash.net::file-reference)
     (:modification-date :swf-name "modificationDate" :type date :access :readonly :declared-by flash.net::file-reference)
     (:name :swf-name "name" :type string :access :readonly :declared-by flash.net::file-reference))
    :methods
    ((:upload :swf-name "upload" :return-type void :declared-by flash.net::file-reference
          :args ((:index 1 :type flash.net::-url-request :optional NIL)
       (:index 2 :type string :optional T)
       (:index 3 :type boolean :optional T)))
     (:download :swf-name "download" :return-type void :declared-by flash.net::file-reference
          :args ((:index 1 :type flash.net::-url-request :optional NIL)
       (:index 2 :type string :optional T)))
     (:cancel :swf-name "cancel" :return-type void :declared-by flash.net::file-reference
          :args ())
     (:browse :swf-name "browse" :return-type boolean :declared-by flash.net::file-reference
          :args ((:index 1 :type array :optional T)))
     (:has-event-listener :swf-name "hasEventListener" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:to-string :swf-name "toString" :return-type string :declared-by flash.events::event-dispatcher
          :args ())
     (:remove-event-listener :swf-name "removeEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)))
     (:add-event-listener :swf-name "addEventListener" :return-type void :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)
       (:index 2 :type function :optional NIL)
       (:index 3 :type boolean :optional T)
       (:index 4 :type int :optional T)
       (:index 5 :type boolean :optional T)))
     (:will-trigger :swf-name "willTrigger" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type string :optional NIL)))
     (:dispatch-event :swf-name "dispatchEvent" :return-type boolean :declared-by flash.events::event-dispatcher
          :args ((:index 1 :type flash.events::event :optional NIL)))))

  (declare-swf-class flash.display::stage-scale-mode (object)
    :swf-name "flash.display::StageScaleMode"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+exact-fit+ :swf-name "EXACT_FIT" :type string)
     (:+no-scale+ :swf-name "NO_SCALE" :type string)
     (:+show-all+ :swf-name "SHOW_ALL" :type string)
     (:+no-border+ :swf-name "NO_BORDER" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.text::text-field-auto-size (object)
    :swf-name "flash.text::TextFieldAutoSize"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+center+ :swf-name "CENTER" :type string)
     (:+right+ :swf-name "RIGHT" :type string)
     (:+left+ :swf-name "LEFT" :type string)
     (:+none+ :swf-name "NONE" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.net::shared-object-flush-status (object)
    :swf-name "flash.net::SharedObjectFlushStatus"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+flushed+ :swf-name "FLUSHED" :type string)
     (:+pending+ :swf-name "PENDING" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.printing::print-job-orientation (object)
    :swf-name "flash.printing::PrintJobOrientation"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+landscape+ :swf-name "LANDSCAPE" :type string)
     (:+portrait+ :swf-name "PORTRAIT" :type string))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.events::-http-status-event (flash.events::event)
    :swf-name "flash.events::HTTPStatusEvent"
    ;; :supers (flash.events::event object)
    ;;   = ("flash.events::Event" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+http-status+ :swf-name "HTTP_STATUS" :type string))
    :properties
    ((:status :swf-name "status" :type int :access :readonly :declared-by flash.events::-http-status-event)
     (:event-phase :swf-name "eventPhase" :type uint :access :readonly :declared-by flash.events::event)
     (:type :swf-name "type" :type string :access :readonly :declared-by flash.events::event)
     (:cancelable :swf-name "cancelable" :type boolean :access :readonly :declared-by flash.events::event)
     (:target :swf-name "target" :type object :access :readonly :declared-by flash.events::event)
     (:current-target :swf-name "currentTarget" :type object :access :readonly :declared-by flash.events::event)
     (:bubbles :swf-name "bubbles" :type boolean :access :readonly :declared-by flash.events::event))
    :methods
    ((:to-string :swf-name "toString" :return-type string :declared-by flash.events::-http-status-event
          :args ())
     (:clone :swf-name "clone" :return-type flash.events::event :declared-by flash.events::-http-status-event
          :args ())
     (:is-default-prevented :swf-name "isDefaultPrevented" :return-type boolean :declared-by flash.events::event
          :args ())
     (:format-to-string :swf-name "formatToString" :return-type string :declared-by flash.events::event
          :args ((:index 1 :type string :optional NIL)))
     (:stop-propagation :swf-name "stopPropagation" :return-type void :declared-by flash.events::event
          :args ())
     (:prevent-default :swf-name "preventDefault" :return-type void :declared-by flash.events::event
          :args ())
     (:stop-immediate-propagation :swf-name "stopImmediatePropagation" :return-type void :declared-by flash.events::event
          :args ())))

  (declare-swf-class flash.filters::convolution-filter (flash.filters::bitmap-filter)
    :swf-name "flash.filters::ConvolutionFilter"
    ;; :supers (flash.filters::bitmap-filter object)
    ;;   = ("flash.filters::BitmapFilter" "Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ((:matrix-y :swf-name "matrixY" :type number :access :readwrite :declared-by flash.filters::convolution-filter)
     (:matrix :swf-name "matrix" :type array :access :readwrite :declared-by flash.filters::convolution-filter)
     (:preserve-alpha :swf-name "preserveAlpha" :type boolean :access :readwrite :declared-by flash.filters::convolution-filter)
     (:color :swf-name "color" :type uint :access :readwrite :declared-by flash.filters::convolution-filter)
     (:alpha :swf-name "alpha" :type number :access :readwrite :declared-by flash.filters::convolution-filter)
     (:clamp :swf-name "clamp" :type boolean :access :readwrite :declared-by flash.filters::convolution-filter)
     (:bias :swf-name "bias" :type number :access :readwrite :declared-by flash.filters::convolution-filter)
     (:divisor :swf-name "divisor" :type number :access :readwrite :declared-by flash.filters::convolution-filter)
     (:matrix-x :swf-name "matrixX" :type number :access :readwrite :declared-by flash.filters::convolution-filter))
    :methods
    ((:clone :swf-name "clone" :return-type flash.filters::bitmap-filter :declared-by flash.filters::convolution-filter
          :args ())))

  (declare-swf-class flash.ui::key-location (object)
    :swf-name "flash.ui::KeyLocation"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+num-pad+ :swf-name "NUM_PAD" :type uint)
     (:+standard+ :swf-name "STANDARD" :type uint)
     (:+left+ :swf-name "LEFT" :type uint)
     (:+right+ :swf-name "RIGHT" :type uint))
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.accessibility::accessibility (object)
    :swf-name "flash.accessibility::Accessibility"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ()
    :properties
    ()
    :methods
    ())

  (declare-swf-class flash.display::action-script-version (object)
    :swf-name "flash.display::ActionScriptVersion"
    ;; :supers (object)
    ;;   = ("Object")
    ;; :interfaces NIL
    ;;   = NIL
    :constants
    ((:+actionscript2+ :swf-name "ACTIONSCRIPT2" :type uint)
     (:+actionscript3+ :swf-name "ACTIONSCRIPT3" :type uint))
    :properties
    ()
    :methods
    ())


(setf *symbol-table* *%temp-symbol-table%*)