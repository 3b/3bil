(in-package #:as3-compiler)

;;(defpackage #:flash)

(defpackage #:flash
  ;; these are accessed with no package name, but putting them in
  ;; keyword would be ugly...
    (:export
     ;; functions
     #:decode-uri
     #:decode-uri-component
     #:encode-uri
     #:encode-uri-component
     #:escape
     #:is-finite
     #:is-nan
     #:is-xml-name
     #:parse-float
     #:parse-int
     #:trace
     #:unescape
     ;; constants
     #:+infinity+          ;; Infinity
     #:+negative-infinity+ ;; -Infinity
     #:+nan+               ;; NaN
     #:+undefined+         ;; undefined
     ;; classes
     #:argument-error
     #:arguments
     #:array
     #:boolean
     #:class
     #:date
     #:definition-error
     #:error
     #:eval-error
     #:function
     #:int
     #:math
     #:namespace
     #:number
     #:object
     #:q-name
     #:range-error
     #:reference-error
     #:reg-exp
     #:security-error
     #:string
     #:syntax-error
     #:type-error
     #:uint
     #:URI-Error
     #:verify-error
     #:xml
     #:xml-list

     ;; we also get the names of most of the members/accessors/methods
     ;; from other namespaces here, unlike CL where they would
     ;; probably be in the same package as the class
     ;; adding as needed...

     ;; from flash.text.TextFieldAutoSize
     #:+center+
     #:+left+
     #:+right+
     #:+none+
     ;; properties from flash.text.TextField
     #:always-Show-Selection
     #:anti-alias-type
     #:auto-size
     #:background
     #:background-color
     #:border
     #:border-color
     #:bottom-scroll-v
     #:caret-index
     #:condense-white
     #:context-menu
     #:default-text-format
     #:display-as-password
     #:embed-fonts
     #:grid-fit-type
     #:html-text
     #:length
     #:max-chars
     #:max-scroll-h
     #:max-scroll-v
     #:mouse-wheel-enabled
     #:multiline
     #:num-lines
     #:restrict
     #:scroll-h
     #:scroll-v
     #:selectable
     #:selection-begin-index
     #:selection-end-index
     #:sharpness
     #:style-sheet
     #:text
     #:text-color
     #:text-height
     #:text-width
     #:thickness
     #:type
     #:use-rich-text-clipboard
     #:word-wrap
     ;; methods from flash.text.TextField
     #:text-field
     #:append-text
     #:get-char-boundaries
     #:get-char-index-at-point
     #:get-first-char-in-paragraph
     #:get-image-reference
     #:get-line-index-at-point
     #:get-line-index-of-char
     #:get-line-length
     #:get-line-metrics
     #:get-line-offset
     #:get-line-text
     #:get-paragraph-length
     #:get-text-format
     #:replace-selected-text
     #:replace-text
     #:set-selection
     #:set-text-format
     ;; events from flash.text.TextField
     #:change
     #:link
     #:scroll
     #:text-input
     ;; flash.public:object
     #:constructor
     #:prototype
     #:object
     #:has-own-property
     #:is-prototype-of
     #:property-is-enumerable
     #:set-property-is-enumerable
     #:to-string
     #:value-of
     ;; flash.events:event-dispatcher

     ))


(defpackage #:flash.text
  (:export
   #:text-field-auto-size
   #:anti-alias-type
   #:csm-settings
   #:font
   #:font-style
   #:font-type
   #:grid-fit-type
   #:static-text
   #:style-sheet
   #:text-color-type
   #:text-display-mode
   #:text-field
   #:text-field-auto-size
   #:text-field-type
   #:text-format
   #:text-format-align
   #:text-line-metrics
   #:text-renderer
   #:text-snapshot
   )
  )
(defpackage #:adobe.utils)
(defpackage #:flash.accessibility)
(defpackage #:flash.display)
(defpackage #:flash.errors)
(defpackage #:flash.events)
(defpackage #:flash.external)
(defpackage #:flash.filters)
(defpackage #:flash.geom)
(defpackage #:flash.media)
(defpackage #:flash.net)
(defpackage #:flash.printing)
(defpackage #:flash.sampler)
(defpackage #:flash.system)
(defpackage #:flash.system)
;(defpackage #:flash.text)
(defpackage #:flash.trace)
(defpackage #:flash.ui)
(defpackage #:flash.utils)
(defpackage #:flash.xml)

