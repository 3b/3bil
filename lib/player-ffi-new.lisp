(cl:defpackage #:flash
  (:use )
  (:export
   #:%-as3--.vec.vector
   #:%-as3--.vec.vector$double
   #:%-as3--.vec.vector$int
   #:%-as3--.vec.vector$object
   #:%-as3--.vec.vector$uint
   #:%char-at
   #:%char-code-at
   #:%get
   #:%get-invocation-count
   #:%index-of
   #:%last-index-of
   #:%set-time
   #:%slice
   #:%substr
   #:%substring
   #:%to-string
   #:+action-script-version.actionscript2+
   #:+action-script-version.actionscript3+
   #:+activity-event.activity+
   #:+anti-alias-type.advanced+
   #:+anti-alias-type.normal+
   #:+argument-error.length+
   #:+array.caseinsensitive+
   #:+array.descending+
   #:+array.length+
   #:+array.numeric+
   #:+array.returnindexedarray+
   #:+array.uniquesort+
   #:+as3+
   #:+async-error-event.async-error+
   #:+bitmap-data-channel.alpha+
   #:+bitmap-data-channel.blue+
   #:+bitmap-data-channel.green+
   #:+bitmap-data-channel.red+
   #:+bitmap-filter-quality.high+
   #:+bitmap-filter-quality.low+
   #:+bitmap-filter-quality.medium+
   #:+bitmap-filter-type.full+
   #:+bitmap-filter-type.inner+
   #:+bitmap-filter-type.outer+
   #:+blend-mode.add+
   #:+blend-mode.alpha+
   #:+blend-mode.darken+
   #:+blend-mode.difference+
   #:+blend-mode.erase+
   #:+blend-mode.hardlight+
   #:+blend-mode.invert+
   #:+blend-mode.layer+
   #:+blend-mode.lighten+
   #:+blend-mode.multiply+
   #:+blend-mode.normal+
   #:+blend-mode.overlay+
   #:+blend-mode.screen+
   #:+blend-mode.shader+
   #:+blend-mode.subtract+
   #:+boolean.length+
   #:+break-opportunity.all+
   #:+break-opportunity.any+
   #:+break-opportunity.auto+
   #:+break-opportunity.none+
   #:+caps-style.none+
   #:+caps-style.round+
   #:+caps-style.square+
   #:+cff-hinting.horizontal-stem+
   #:+cff-hinting.none+
   #:+class.length+
   #:+clipboard-formats.air-prefix+
   #:+clipboard-formats.bitmap-format+
   #:+clipboard-formats.file-list-format+
   #:+clipboard-formats.flash-prefix+
   #:+clipboard-formats.html-format+
   #:+clipboard-formats.reference-prefix+
   #:+clipboard-formats.rich-text-format+
   #:+clipboard-formats.serialization-prefix+
   #:+clipboard-formats.text-format+
   #:+clipboard-formats.url-format+
   #:+clipboard-transfer-mode.clone-only+
   #:+clipboard-transfer-mode.clone-preferred+
   #:+clipboard-transfer-mode.original-only+
   #:+clipboard-transfer-mode.original-preferred+
   #:+color-correction-support.default-off+
   #:+color-correction-support.default-on+
   #:+color-correction-support.unsupported+
   #:+color-correction.default+
   #:+color-correction.off+
   #:+color-correction.on+
   #:+content-element.graphic-element+
   #:+context-menu-event.menu-item-select+
   #:+context-menu-event.menu-select+
   #:+data-event.data+
   #:+data-event.upload-complete-data+
   #:+date.length+
   #:+definition-error.length+
   #:+delete-object-sample.id+
   #:+delete-object-sample.size+
   #:+digit-case.default+
   #:+digit-case.lining+
   #:+digit-case.old-style+
   #:+digit-width.default+
   #:+digit-width.proportional+
   #:+digit-width.tabular+
   #:+displacement-map-filter-mode.clamp+
   #:+displacement-map-filter-mode.color+
   #:+displacement-map-filter-mode.ignore+
   #:+displacement-map-filter-mode.wrap+
   #:+endian.big-endian+
   #:+endian.little-endian+
   #:+error-event.error+
   #:+error.length+
   #:+eval-error.length+
   #:+event-phase.at-target+
   #:+event-phase.bubbling-phase+
   #:+event-phase.capturing-phase+
   #:+event.activate+
   #:+event.added+
   #:+event.added-to-stage+
   #:+event.cancel+
   #:+event.change+
   #:+event.clear+
   #:+event.close+
   #:+event.complete+
   #:+event.connect+
   #:+event.copy+
   #:+event.cut+
   #:+event.deactivate+
   #:+event.enter-frame+
   #:+event.exit-frame+
   #:+event.frame-constructed+
   #:+event.fullscreen+
   #:+event.id3+
   #:+event.init+
   #:+event.mouse-leave+
   #:+event.open+
   #:+event.paste+
   #:+event.removed+
   #:+event.removed-from-stage+
   #:+event.render+
   #:+event.resize+
   #:+event.scroll+
   #:+event.select+
   #:+event.select-all+
   #:+event.sound-complete+
   #:+event.tab-children-change+
   #:+event.tab-enabled-change+
   #:+event.tab-index-change+
   #:+event.unload+
   #:+flash-proxy+
   #:+focus-event.focus-in+
   #:+focus-event.focus-out+
   #:+focus-event.key-focus-change+
   #:+focus-event.mouse-focus-change+
   #:+font-lookup.device+
   #:+font-lookup.embedded-cff+
   #:+font-posture.italic+
   #:+font-posture.normal+
   #:+font-style.bold+
   #:+font-style.bold-italic+
   #:+font-style.italic+
   #:+font-style.regular+
   #:+font-type.device+
   #:+font-type.embedded+
   #:+font-type.embedded-cff+
   #:+font-weight.bold+
   #:+font-weight.normal+
   #:+full-screen-event.full-screen+
   #:+function.length+
   #:+gradient-type.linear+
   #:+gradient-type.radial+
   #:+graphics-path-command.curve-to+
   #:+graphics-path-command.line-to+
   #:+graphics-path-command.move-to+
   #:+graphics-path-command.no-op+
   #:+graphics-path-command.wide-line-to+
   #:+graphics-path-command.wide-move-to+
   #:+graphics-path-winding.even-odd+
   #:+graphics-path-winding.non-zero+
   #:+grid-fit-type.none+
   #:+grid-fit-type.pixel+
   #:+grid-fit-type.subpixel+
   #:+http-status-event.http-status+
   #:+i-me-conversion-mode.alphanumeric-full+
   #:+i-me-conversion-mode.alphanumeric-half+
   #:+i-me-conversion-mode.chinese+
   #:+i-me-conversion-mode.japanese-hiragana+
   #:+i-me-conversion-mode.japanese-katakana-full+
   #:+i-me-conversion-mode.japanese-katakana-half+
   #:+i-me-conversion-mode.korean+
   #:+i-me-conversion-mode.unknown+
   #:+i-me-event.ime-composition+
   #:+i-o-error-event.disk-error+
   #:+i-o-error-event.io-error+
   #:+i-o-error-event.network-error+
   #:+i-o-error-event.verify-error+
   #:+infinity+
   #:+int.length+
   #:+int.max-value+
   #:+int.min-value+
   #:+interpolation-method.linear-rgb+
   #:+interpolation-method.rgb+
   #:+joint-style.bevel+
   #:+joint-style.miter+
   #:+joint-style.round+
   #:+justification-style.prioritize-least-adjustment+
   #:+justification-style.push-in-kinsoku+
   #:+justification-style.push-out-only+
   #:+kerning.auto+
   #:+kerning.off+
   #:+kerning.on+
   #:+key-location.left+
   #:+key-location.num-pad+
   #:+key-location.right+
   #:+key-location.standard+
   #:+keyboard-event.key-down+
   #:+keyboard-event.key-up+
   #:+keyboard.backspace+
   #:+keyboard.caps-lock+
   #:+keyboard.control+
   #:+keyboard.delete+
   #:+keyboard.down+
   #:+keyboard.end+
   #:+keyboard.enter+
   #:+keyboard.escape+
   #:+keyboard.f1+
   #:+keyboard.f10+
   #:+keyboard.f11+
   #:+keyboard.f12+
   #:+keyboard.f13+
   #:+keyboard.f14+
   #:+keyboard.f15+
   #:+keyboard.f2+
   #:+keyboard.f3+
   #:+keyboard.f4+
   #:+keyboard.f5+
   #:+keyboard.f6+
   #:+keyboard.f7+
   #:+keyboard.f8+
   #:+keyboard.f9+
   #:+keyboard.home+
   #:+keyboard.insert+
   #:+keyboard.left+
   #:+keyboard.numpad-0+
   #:+keyboard.numpad-1+
   #:+keyboard.numpad-2+
   #:+keyboard.numpad-3+
   #:+keyboard.numpad-4+
   #:+keyboard.numpad-5+
   #:+keyboard.numpad-6+
   #:+keyboard.numpad-7+
   #:+keyboard.numpad-8+
   #:+keyboard.numpad-9+
   #:+keyboard.numpad-add+
   #:+keyboard.numpad-decimal+
   #:+keyboard.numpad-divide+
   #:+keyboard.numpad-enter+
   #:+keyboard.numpad-multiply+
   #:+keyboard.numpad-subtract+
   #:+keyboard.page-down+
   #:+keyboard.page-up+
   #:+keyboard.right+
   #:+keyboard.shift+
   #:+keyboard.space+
   #:+keyboard.tab+
   #:+keyboard.up+
   #:+ligature-level.common+
   #:+ligature-level.exotic+
   #:+ligature-level.minimum+
   #:+ligature-level.none+
   #:+ligature-level.uncommon+
   #:+line-justification.all-but-last+
   #:+line-justification.all-including-last+
   #:+line-justification.unjustified+
   #:+line-scale-mode.horizontal+
   #:+line-scale-mode.none+
   #:+line-scale-mode.normal+
   #:+line-scale-mode.vertical+
   #:+math.e+
   #:+math.ln10+
   #:+math.ln2+
   #:+math.log10-e+
   #:+math.log2-e+
   #:+math.pi+
   #:+math.sqrt1-2+
   #:+math.sqrt2+
   #:+mouse-cursor.arrow+
   #:+mouse-cursor.auto+
   #:+mouse-cursor.button+
   #:+mouse-cursor.hand+
   #:+mouse-cursor.ibeam+
   #:+mouse-event.click+
   #:+mouse-event.double-click+
   #:+mouse-event.mouse-down+
   #:+mouse-event.mouse-move+
   #:+mouse-event.mouse-out+
   #:+mouse-event.mouse-over+
   #:+mouse-event.mouse-up+
   #:+mouse-event.mouse-wheel+
   #:+mouse-event.roll-out+
   #:+mouse-event.roll-over+
   #:+namespace.length+
   #:+nan+
   #:+net-status-event.net-status+
   #:+net-stream-play-transitions.append+
   #:+net-stream-play-transitions.reset+
   #:+net-stream-play-transitions.stop+
   #:+net-stream-play-transitions.swap+
   #:+net-stream-play-transitions.switch+
   #:+net-stream.connect-to-fms+
   #:+net-stream.direct-connections+
   #:+new-object-sample.id+
   #:+new-object-sample.type+
   #:+number.dtostr-exponential+
   #:+number.dtostr-fixed+
   #:+number.dtostr-precision+
   #:+number.length+
   #:+number.max-value+
   #:+number.min-value+
   #:+number.nan+
   #:+number.negative-infinity+
   #:+number.positive-infinity+
   #:+object-encoding.amf0+
   #:+object-encoding.amf3+
   #:+object-encoding.default+
   #:+object.length+
   #:+orientation3-d.axis-angle+
   #:+orientation3-d.euler-angles+
   #:+orientation3-d.quaternion+
   #:+pixel-snapping.always+
   #:+pixel-snapping.auto+
   #:+pixel-snapping.never+
   #:+print-job-orientation.landscape+
   #:+print-job-orientation.portrait+
   #:+progress-event.progress+
   #:+progress-event.socket-data+
   #:+q-name.length+
   #:+range-error.length+
   #:+reference-error.length+
   #:+reg-exp.length+
   #:+rendering-mode.cff+
   #:+rendering-mode.normal+
   #:+sample-data-event.sample-data+
   #:+sample.stack+
   #:+sample.time+
   #:+security-error-event.security-error+
   #:+security-error.length+
   #:+security-panel.camera+
   #:+security-panel.default+
   #:+security-panel.display+
   #:+security-panel.local-storage+
   #:+security-panel.microphone+
   #:+security-panel.privacy+
   #:+security-panel.settings-manager+
   #:+security.local-trusted+
   #:+security.local-with-file+
   #:+security.local-with-network+
   #:+security.remote+
   #:+shader-event.complete+
   #:+shader-parameter-type.bool+
   #:+shader-parameter-type.bool2+
   #:+shader-parameter-type.bool3+
   #:+shader-parameter-type.bool4+
   #:+shader-parameter-type.float+
   #:+shader-parameter-type.float2+
   #:+shader-parameter-type.float3+
   #:+shader-parameter-type.float4+
   #:+shader-parameter-type.int+
   #:+shader-parameter-type.int2+
   #:+shader-parameter-type.int3+
   #:+shader-parameter-type.int4+
   #:+shader-parameter-type.matrix2-x2+
   #:+shader-parameter-type.matrix3-x3+
   #:+shader-parameter-type.matrix4-x4+
   #:+shader-precision.fast+
   #:+shader-precision.full+
   #:+shared-object-flush-status.flushed+
   #:+shared-object-flush-status.pending+
   #:+sound-codec.nellymoser+
   #:+sound-codec.speex+
   #:+spread-method.pad+
   #:+spread-method.reflect+
   #:+spread-method.repeat+
   #:+stack-frame.file+
   #:+stack-frame.line+
   #:+stack-frame.name+
   #:+stage-align.bottom+
   #:+stage-align.bottom-left+
   #:+stage-align.bottom-right+
   #:+stage-align.left+
   #:+stage-align.right+
   #:+stage-align.top+
   #:+stage-align.top-left+
   #:+stage-align.top-right+
   #:+stage-display-state.full-screen+
   #:+stage-display-state.normal+
   #:+stage-quality.best+
   #:+stage-quality.high+
   #:+stage-quality.low+
   #:+stage-quality.medium+
   #:+stage-scale-mode.exact-fit+
   #:+stage-scale-mode.no-border+
   #:+stage-scale-mode.no-scale+
   #:+stage-scale-mode.show-all+
   #:+status-event.status+
   #:+string.length+
   #:+swf-version.flash1+
   #:+swf-version.flash10+
   #:+swf-version.flash2+
   #:+swf-version.flash3+
   #:+swf-version.flash4+
   #:+swf-version.flash5+
   #:+swf-version.flash6+
   #:+swf-version.flash7+
   #:+swf-version.flash8+
   #:+swf-version.flash9+
   #:+sync-event.sync+
   #:+syntax-error.length+
   #:+tab-alignment.center+
   #:+tab-alignment.decimal+
   #:+tab-alignment.end+
   #:+tab-alignment.start+
   #:+text-baseline.ascent+
   #:+text-baseline.descent+
   #:+text-baseline.ideographic-bottom+
   #:+text-baseline.ideographic-center+
   #:+text-baseline.ideographic-top+
   #:+text-baseline.roman+
   #:+text-baseline.use-dominant-baseline+
   #:+text-color-type.dark-color+
   #:+text-color-type.light-color+
   #:+text-display-mode.crt+
   #:+text-display-mode.default+
   #:+text-display-mode.lcd+
   #:+text-event.link+
   #:+text-event.text-input+
   #:+text-field-auto-size.center+
   #:+text-field-auto-size.left+
   #:+text-field-auto-size.none+
   #:+text-field-auto-size.right+
   #:+text-field-type.dynamic+
   #:+text-field-type.input+
   #:+text-format-align.center+
   #:+text-format-align.justify+
   #:+text-format-align.left+
   #:+text-format-align.right+
   #:+text-format-display.block+
   #:+text-format-display.inline+
   #:+text-line-creation-result.complete+
   #:+text-line-creation-result.emergency+
   #:+text-line-creation-result.insufficient-width+
   #:+text-line-creation-result.success+
   #:+text-line-validity.invalid+
   #:+text-line-validity.possibly-invalid+
   #:+text-line-validity.static+
   #:+text-line-validity.valid+
   #:+text-line.max-line-width+
   #:+text-rotation.auto+
   #:+text-rotation.rotate-0+
   #:+text-rotation.rotate-180+
   #:+text-rotation.rotate-270+
   #:+text-rotation.rotate-90+
   #:+timer-event.timer+
   #:+timer-event.timer-complete+
   #:+trace.file+
   #:+trace.listener+
   #:+trace.methods+
   #:+trace.methods-and-lines+
   #:+trace.methods-and-lines-with-args+
   #:+trace.methods-with-args+
   #:+trace.off+
   #:+triangle-culling.negative+
   #:+triangle-culling.none+
   #:+triangle-culling.positive+
   #:+type-error.length+
   #:+typographic-case.caps+
   #:+typographic-case.caps-and-small-caps+
   #:+typographic-case.default+
   #:+typographic-case.lowercase+
   #:+typographic-case.small-caps+
   #:+typographic-case.title+
   #:+typographic-case.uppercase+
   #:+uint.length+
   #:+uint.max-value+
   #:+uint.min-value+
   #:+undefined+
   #:+uninitialized-error.length+
   #:+uri-error.length+
   #:+url-loader-data-format.binary+
   #:+url-loader-data-format.text+
   #:+url-loader-data-format.variables+
   #:+url-request-method.get+
   #:+url-request-method.post+
   #:+vector3-d.x-axis+
   #:+vector3-d.y-axis+
   #:+vector3-d.z-axis+
   #:+verify-error.length+
   #:+xml-list.length+
   #:+xml-node-type.cdata-node+
   #:+xml-node-type.comment-node+
   #:+xml-node-type.document-type-node+
   #:+xml-node-type.element-node+
   #:+xml-node-type.processing-instruction-node+
   #:+xml-node-type.text-node+
   #:+xml-node-type.xml-declaration+
   #:+xml.length+
   #:.%error-id
   #:.%internal
   #:.a
   #:.accessibility
   #:.accessibility-implementation
   #:.accessibility-properties
   #:.action-script-version
   #:.actions-list
   #:.activating
   #:.active
   #:.activity-event
   #:.activity-level
   #:.album
   #:.align
   #:.alignment
   #:.alignment-baseline
   #:.alpha
   #:.alpha-multiplier
   #:.alpha-offset
   #:.alphas
   #:.alt-key
   #:.always-show-selection
   #:.angle
   #:.anti-alias-type
   #:.application-domain
   #:.apply-non-linear-font-scaling
   #:.argument-error
   #:.array
   #:.artist
   #:.ascent
   #:.async-error-event
   #:.atom-count
   #:.attributes
   #:.attrs
   #:.audio-buffer-byte-length
   #:.audio-buffer-length
   #:.audio-byte-count
   #:.audio-bytes-per-second
   #:.audio-codec
   #:.audio-loss-rate
   #:.auth-object
   #:.auto-size
   #:.av-hardware-disable
   #:.available
   #:.avm1-movie
   #:.b
   #:.background
   #:.background-color
   #:.bandwidth
   #:.baseline-font-description
   #:.baseline-font-size
   #:.baseline-shift
   #:.baseline-zero
   #:.begin-index
   #:.bevel-filter
   #:.bias
   #:.bidi-level
   #:.bitmap
   #:.bitmap-data
   #:.bitmap-data-channel
   #:.bitmap-filter
   #:.bitmap-filter-quality
   #:.bitmap-filter-type
   #:.blend-mode
   #:.blend-shader
   #:.block-indent
   #:.blue-multiplier
   #:.blue-offset
   #:.blur-filter
   #:.blur-x
   #:.blur-y
   #:.bold
   #:.boolean
   #:.border
   #:.border-color
   #:.bottom
   #:.bottom-extension
   #:.bottom-right
   #:.bottom-scroll-v
   #:.bounds
   #:.break-opportunity
   #:.bubbles
   #:.buffer-length
   #:.buffer-time
   #:.built-in-items
   #:.bullet
   #:.button-down
   #:.button-mode
   #:.byte-array
   #:.byte-code
   #:.byte-count
   #:.bytes
   #:.bytes-available
   #:.bytes-loaded
   #:.bytes-total
   #:.c
   #:.cache-as-bitmap
   #:.camera
   #:.cancelable
   #:.capabilities
   #:.caps
   #:.caps-lock
   #:.caps-style
   #:.caption
   #:.caret-index
   #:.cff-hinting
   #:.change-list
   #:.channels
   #:.char-code
   #:.char-count
   #:.check-policy-file
   #:.child-allows-parent
   #:.child-nodes
   #:.clamp
   #:.class
   #:.clear
   #:.client
   #:.clipboard
   #:.clipboard-formats
   #:.clipboard-items
   #:.clipboard-menu
   #:.clipboard-transfer-mode
   #:.code
   #:.codec
   #:.color
   #:.color-correction
   #:.color-correction-support
   #:.color-matrix-filter
   #:.color-transform
   #:.colors
   #:.commands
   #:.comment
   #:.component-x
   #:.component-y
   #:.concatenated-color-transform
   #:.concatenated-matrix
   #:.condense-white
   #:.connected
   #:.connected-proxy-type
   #:.construct-ok
   #:.content
   #:.content-element
   #:.content-loader-info
   #:.content-type
   #:.context-menu
   #:.context-menu-built-in-items
   #:.context-menu-clipboard-items
   #:.context-menu-event
   #:.context-menu-item
   #:.context-menu-owner
   #:.conversion-mode
   #:.convolution-filter
   #:.copy
   #:.creation-date
   #:.creator
   #:.csm-settings
   #:.ctrl-key
   #:.culling
   #:.current-bytes-per-second
   #:.current-count
   #:.current-domain
   #:.current-fps
   #:.current-frame
   #:.current-frame-label
   #:.current-label
   #:.current-labels
   #:.current-scene
   #:.current-target
   #:.cursor
   #:.custom-actions
   #:.custom-items
   #:.cut
   #:.d
   #:.data
   #:.data-buffer-byte-length
   #:.data-buffer-length
   #:.data-byte-count
   #:.data-bytes-per-second
   #:.data-event
   #:.data-format
   #:.date
   #:.date-utc
   #:.day
   #:.day-utc
   #:.deblocking
   #:.deblocking-filter
   #:.decimal-alignment-token
   #:.decoded-frames
   #:.default-object-encoding
   #:.default-text-format
   #:.definition-error
   #:.delay
   #:.delete-object-sample
   #:.delta
   #:.descent
   #:.description
   #:.determinant
   #:.dictionary
   #:.digest
   #:.digit-case
   #:.digit-width
   #:.disable-avm1-loading
   #:.displacement-map-filter
   #:.displacement-map-filter-mode
   #:.display
   #:.display-as-password
   #:.display-mode
   #:.display-object
   #:.display-object-container
   #:.display-state
   #:.distance
   #:.divisor
   #:.doc-type-decl
   #:.domain
   #:.domain-memory
   #:.dominant-baseline
   #:.dotall
   #:.double-click-enabled
   #:.down-state
   #:.drop-shadow-filter
   #:.drop-target
   #:.dropped-frames
   #:.dynamic-property-output
   #:.dynamic-property-writer
   #:.east-asian-justifier
   #:.element
   #:.element-count
   #:.element-format
   #:.element-height
   #:.element-width
   #:.em-box
   #:.embed-fonts
   #:.empty
   #:.enabled
   #:.encode-quality
   #:.end-index
   #:.endian
   #:.eof-error
   #:.errno
   #:.error
   #:.error-event
   #:.error-id
   #:.eval-error
   #:.event
   #:.event-dispatcher
   #:.event-mirror
   #:.event-phase
   #:.exact-settings
   #:.extended
   #:.extension
   #:.external-interface
   #:.far-id
   #:.far-nonce
   #:.field-of-view
   #:.file-filter
   #:.file-list
   #:.file-reference
   #:.file-reference-list
   #:.fill
   #:.filters
   #:.first-child
   #:.first-invalid-line
   #:.first-line
   #:.fixed
   #:.focal-length
   #:.focal-point-ratio
   #:.focus
   #:.focus-event
   #:.focus-rect
   #:.font
   #:.font-description
   #:.font-lookup
   #:.font-metrics
   #:.font-name
   #:.font-posture
   #:.font-size
   #:.font-style
   #:.font-type
   #:.font-weight
   #:.force-simple
   #:.formats
   #:.forward-and-back
   #:.fps
   #:.frame
   #:.frame-label
   #:.frame-rate
   #:.frames-loaded
   #:.frames-per-packet
   #:.fs-command
   #:.full-screen
   #:.full-screen-event
   #:.full-screen-height
   #:.full-screen-source-rect
   #:.full-screen-width
   #:.full-year
   #:.full-year-utc
   #:.function
   #:.gain
   #:.general-clipboard
   #:.genre
   #:.global
   #:.glow-filter
   #:.gradient-bevel-filter
   #:.gradient-glow-filter
   #:.gradient-type
   #:.graphic
   #:.graphic-element
   #:.graphics
   #:.graphics-bitmap-fill
   #:.graphics-end-fill
   #:.graphics-gradient-fill
   #:.graphics-path
   #:.graphics-path-command
   #:.graphics-path-winding
   #:.graphics-shader-fill
   #:.graphics-solid-fill
   #:.graphics-stroke
   #:.graphics-triangle-path
   #:.green-multiplier
   #:.green-offset
   #:.grid-fit-type
   #:.group-element
   #:.has-accessibility
   #:.has-audio
   #:.has-audio-encoder
   #:.has-embedded-video
   #:.has-graphic-element
   #:.has-ime
   #:.has-mp3
   #:.has-printing
   #:.has-screen-broadcast
   #:.has-screen-playback
   #:.has-streaming-audio
   #:.has-streaming-video
   #:.has-tls
   #:.has-video-encoder
   #:.header
   #:.height
   #:.hide-object
   #:.highlight-alpha
   #:.highlight-color
   #:.hit-area
   #:.hit-test-state
   #:.hours
   #:.hours-utc
   #:.html-text
   #:.http-status-event
   #:.i-bitmap-drawable
   #:.i-d3-info
   #:.i-data-input
   #:.i-data-output
   #:.i-dynamic-property-output
   #:.i-dynamic-property-writer
   #:.i-event-dispatcher
   #:.i-externalizable
   #:.i-graphics-data
   #:.i-graphics-fill
   #:.i-graphics-path
   #:.i-graphics-stroke
   #:.i-me-conversion-mode
   #:.i-me-event
   #:.i-o-error
   #:.i-o-error-event
   #:.id
   #:.id-map
   #:.id3
   #:.ignore-case
   #:.ignore-comments
   #:.ignore-processing-instructions
   #:.ignore-white
   #:.ignore-whitespace
   #:.illegal-operation-error
   #:.ime
   #:.indent
   #:.index
   #:.indices
   #:.info
   #:.inner
   #:.input
   #:.inside-cutoff
   #:.installed
   #:.installed-version
   #:.int
   #:.interactive-object
   #:.interpolation-method
   #:.invalid-swf-error
   #:.is-buffering
   #:.is-debugger
   #:.is-embedded-in-acrobat
   #:.is-mouse-target-inaccessible
   #:.is-related-object-inaccessible
   #:.italic
   #:.joint-style
   #:.joints
   #:.jpeg-loader-context
   #:.justification-style
   #:.kerning
   #:.key
   #:.key-code
   #:.key-frame-interval
   #:.key-location
   #:.keyboard
   #:.keyboard-event
   #:.knockout
   #:.labels
   #:.language
   #:.last-child
   #:.last-index
   #:.last-line
   #:.leading
   #:.left
   #:.left-extension
   #:.left-margin
   #:.left-peak
   #:.left-to-left
   #:.left-to-right
   #:.len
   #:.length
   #:.length-squared
   #:.letter-spacing
   #:.level
   #:.ligature-level
   #:.line-justification
   #:.line-rotation
   #:.line-scale-mode
   #:.link
   #:.live-delay
   #:.loader
   #:.loader-context
   #:.loader-info
   #:.loader-url
   #:.local-connection
   #:.local-file-read-disable
   #:.local-name
   #:.local-x
   #:.local-y
   #:.locale
   #:.locked
   #:.loop
   #:.loopback
   #:.mac-type
   #:.manufacturer
   #:.map-bitmap
   #:.map-point
   #:.marshall-exceptions
   #:.mask
   #:.math
   #:.matrix
   #:.matrix-x
   #:.matrix-y
   #:.matrix3-d
   #:.max-bytes-per-second
   #:.max-chars
   #:.max-level
   #:.max-level-idc
   #:.max-pause-buffer-time
   #:.max-peer-connections
   #:.max-scroll-h
   #:.max-scroll-v
   #:.memory-error
   #:.message
   #:.method
   #:.method-closure
   #:.microphone
   #:.milliseconds
   #:.milliseconds-utc
   #:.min-domain-memory-length
   #:.minutes
   #:.minutes-utc
   #:.mirror
   #:.mirror-regions
   #:.miter-limit
   #:.mode
   #:.modification-date
   #:.month
   #:.month-utc
   #:.morph-shape
   #:.motion-level
   #:.motion-timeout
   #:.mouse
   #:.mouse-children
   #:.mouse-cursor
   #:.mouse-enabled
   #:.mouse-event
   #:.mouse-target
   #:.mouse-wheel-enabled
   #:.mouse-x
   #:.mouse-y
   #:.movie-clip
   #:.multiline
   #:.muted
   #:.name
   #:.names
   #:.namespace
   #:.namespace-uri
   #:.near-id
   #:.near-nonce
   #:.net-connection
   #:.net-filter-event
   #:.net-status-event
   #:.net-stream
   #:.net-stream-info
   #:.net-stream-play-options
   #:.net-stream-play-transitions
   #:.new-object-sample
   #:.next-line
   #:.next-region
   #:.next-sibling
   #:.no-auto-labeling
   #:.node-name
   #:.node-type
   #:.node-value
   #:.num-children
   #:.num-frames
   #:.num-lines
   #:.num-lock
   #:.number
   #:.object
   #:.object-encoding
   #:.object-id
   #:.object-input
   #:.object-output
   #:.off-screen-surface-rendering-enabled
   #:.old-stream-name
   #:.opaque-background
   #:.orientation
   #:.orientation3-d
   #:.os
   #:.outside-cutoff
   #:.over-state
   #:.page-height
   #:.page-width
   #:.pan
   #:.paper-height
   #:.paper-width
   #:.parameters
   #:.parent
   #:.parent-allows-child
   #:.parent-domain
   #:.parent-node
   #:.paste
   #:.peer-streams
   #:.perspective-projection
   #:.pixel-aspect-ratio
   #:.pixel-bounds
   #:.pixel-hinting
   #:.pixel-snapping
   #:.play
   #:.playback-bytes-per-second
   #:.player-type
   #:.point
   #:.position
   #:.precision-hint
   #:.prefix
   #:.preserve-alpha
   #:.pretty-indent
   #:.pretty-printing
   #:.previous-line
   #:.previous-region
   #:.previous-sibling
   #:.print
   #:.print-as-bitmap
   #:.print-job
   #:.print-job-options
   #:.print-job-orientation
   #:.product-manager
   #:.progress
   #:.progress-event
   #:.projection-center
   #:.protocol
   #:.prototype
   #:.proxy
   #:.proxy-type
   #:.q-name
   #:.quality
   #:.range-error
   #:.rate
   #:.ratios
   #:.raw-data
   #:.raw-text
   #:.raw-text-length
   #:.rect
   #:.rectangle
   #:.red-multiplier
   #:.red-offset
   #:.reference-error
   #:.reg-exp
   #:.related-object
   #:.rendering-mode
   #:.repeat
   #:.repeat-count
   #:.request-headers
   #:.responder
   #:.restrict
   #:.rewind
   #:.right
   #:.right-extension
   #:.right-margin
   #:.right-peak
   #:.right-to-left
   #:.right-to-right
   #:.root
   #:.rotation
   #:.rotation-x
   #:.rotation-y
   #:.rotation-z
   #:.running
   #:.same-domain
   #:.sample
   #:.sample-data-event
   #:.sandbox-type
   #:.save
   #:.scale-mode
   #:.scale-x
   #:.scale-y
   #:.scale-z
   #:.scale9-grid
   #:.scene
   #:.scenes
   #:.screen-color
   #:.screen-dpi
   #:.screen-resolution-x
   #:.screen-resolution-y
   #:.script-timeout-error
   #:.scroll-h
   #:.scroll-rect
   #:.scroll-v
   #:.seconds
   #:.seconds-utc
   #:.security
   #:.security-domain
   #:.security-error
   #:.security-error-event
   #:.security-panel
   #:.select-all
   #:.selectable
   #:.selected-text
   #:.selection-begin-index
   #:.selection-end-index
   #:.separator-before
   #:.server-string
   #:.set-interval-timer
   #:.shader
   #:.shader-data
   #:.shader-event
   #:.shader-filter
   #:.shader-input
   #:.shader-job
   #:.shader-parameter
   #:.shader-parameter-type
   #:.shader-precision
   #:.shadow-alpha
   #:.shadow-color
   #:.shape
   #:.shared-events
   #:.shared-object
   #:.shared-object-flush-status
   #:.sharpness
   #:.shift-key
   #:.shortcut
   #:.show-default-context-menu
   #:.silence-level
   #:.silence-timeout
   #:.silent
   #:.simple-button
   #:.size
   #:.smooth
   #:.smoothing
   #:.socket
   #:.song-name
   #:.sound
   #:.sound-channel
   #:.sound-codec
   #:.sound-loader-context
   #:.sound-mixer
   #:.sound-transform
   #:.source
   #:.space-justifier
   #:.specified-width
   #:.spread-method
   #:.sprite
   #:.srtt
   #:.stack-frame
   #:.stack-overflow-error
   #:.stage
   #:.stage-align
   #:.stage-display-state
   #:.stage-focus-rect
   #:.stage-height
   #:.stage-quality
   #:.stage-scale-mode
   #:.stage-width
   #:.stage-x
   #:.stage-y
   #:.start
   #:.static-text
   #:.status
   #:.status-event
   #:.stream-name
   #:.strength
   #:.strikethrough-offset
   #:.strikethrough-thickness
   #:.string
   #:.stub
   #:.style-names
   #:.style-sheet
   #:.subscript-offset
   #:.subscript-scale
   #:.superscript-offset
   #:.superscript-scale
   #:.swf-key
   #:.swf-version
   #:.sync-event
   #:.syntax-error
   #:.system
   #:.tab-alignment
   #:.tab-children
   #:.tab-enabled
   #:.tab-index
   #:.tab-stop
   #:.tab-stops
   #:.target
   #:.text
   #:.text-baseline
   #:.text-block
   #:.text-block-begin-index
   #:.text-color
   #:.text-color-type
   #:.text-display-mode
   #:.text-element
   #:.text-event
   #:.text-extent
   #:.text-field
   #:.text-field-auto-size
   #:.text-field-height
   #:.text-field-type
   #:.text-field-width
   #:.text-format
   #:.text-format-align
   #:.text-format-display
   #:.text-height
   #:.text-justifier
   #:.text-line
   #:.text-line-creation-result
   #:.text-line-metrics
   #:.text-line-mirror-region
   #:.text-line-validity
   #:.text-renderer
   #:.text-rotation
   #:.text-run
   #:.text-snapshot
   #:.text-width
   #:.thickness
   #:.time
   #:.timeout
   #:.timer
   #:.timer-event
   #:.timezone-offset
   #:.top
   #:.top-extension
   #:.top-left
   #:.total-frames
   #:.total-memory
   #:.trace
   #:.track
   #:.track-as-menu
   #:.tracking-left
   #:.tracking-right
   #:.transform
   #:.transition
   #:.transparent
   #:.triangle-culling
   #:.tx
   #:.ty
   #:.type
   #:.type-error
   #:.typographic-case
   #:.uint
   #:.unconnected-peer-streams
   #:.underline
   #:.underline-offset
   #:.underline-thickness
   #:.uninitialized-error
   #:.unjustified-text-width
   #:.up-state
   #:.uri
   #:.uri-error
   #:.url
   #:.url-loader
   #:.url-loader-data-format
   #:.url-request
   #:.url-request-header
   #:.url-request-method
   #:.url-stream
   #:.url-variables
   #:.use-code-page
   #:.use-echo-suppression
   #:.use-hand-cursor
   #:.use-rich-text-clipboard
   #:.user-data
   #:.using-tls
   #:.utils3-d
   #:.uvt-data
   #:.validity
   #:.value
   #:.vector
   #:.vector$double
   #:.vector$int
   #:.vector$object
   #:.vector$uint
   #:.vector3-d
   #:.verify-error
   #:.version
   #:.vertices
   #:.video
   #:.video-buffer-byte-length
   #:.video-buffer-length
   #:.video-byte-count
   #:.video-bytes-per-second
   #:.video-codec
   #:.video-height
   #:.video-width
   #:.visible
   #:.vm-version
   #:.volume
   #:.w
   #:.weak-function-closure
   #:.weak-method-closure
   #:.width
   #:.winding
   #:.word-wrap
   #:.x
   #:.xml
   #:.xml-decl
   #:.xml-document
   #:.xml-list
   #:.xml-node
   #:.xml-node-type
   #:.xml-parser
   #:.xml-socket
   #:.xml-tag
   #:.xmlui
   #:.y
   #:.year
   #:.z
   #:.zoom
   #:acc-do-default-action
   #:acc-location
   #:acc-select
   #:accessibility.send-event
   #:accessibility.update-properties
   #:add
   #:add-callback
   #:add-child
   #:add-child-at
   #:add-event-listener
   #:add-frame-script
   #:add-header
   #:add-namespace
   #:add-page
   #:adobe.utils.custom-actions
   #:adobe.utils.product-manager
   #:adobe.utils.xmlui
   #:allow-domain
   #:allow-insecure-domain
   #:append
   #:append-child
   #:append-rotation
   #:append-scale
   #:append-text
   #:append-translation
   #:apply
   #:apply-filter
   #:are-inaccessible-objects-under-point
   #:argument-error
   #:array
   #:array.%concat
   #:array.%every
   #:array.%filter
   #:array.%for-each
   #:array.%index-of
   #:array.%join
   #:array.%last-index-of
   #:array.%map
   #:array.%pop
   #:array.%reverse
   #:array.%shift
   #:array.%slice
   #:array.%some
   #:array.%sort
   #:array.%sort-on
   #:array.%splice
   #:attach-audio
   #:attach-camera
   #:attach-net-stream
   #:attribute
   #:attributes
   #:authoring.auth-object
   #:begin-bitmap-fill
   #:begin-fill
   #:begin-gradient-fill
   #:begin-shader-fill
   #:blending-mode
   #:boolean
   #:bounds
   #:browse
   #:cache-as-bitmap
   #:call
   #:call-property
   #:camera.get-camera
   #:cancel
   #:center-point
   #:char-at
   #:char-code-at
   #:child
   #:child-index
   #:children
   #:class
   #:clear
   #:clear-array-entry
   #:clear-data
   #:clear-interval
   #:clear-samples
   #:clear-timeout
   #:clone
   #:clone-node
   #:close
   #:color-transform
   #:color-x-form
   #:comments
   #:compare
   #:compress
   #:concat
   #:connect
   #:contains
   #:contains-point
   #:contains-rect
   #:copy
   #:copy-channel
   #:copy-from
   #:copy-pixels
   #:copy-rich-text
   #:create-box
   #:create-element
   #:create-gradient-box
   #:create-text-line
   #:create-text-node
   #:cross-product
   #:curve-to
   #:custom-actions.get-actions
   #:custom-actions.install-actions
   #:custom-actions.uninstall-actions
   #:date
   #:date.parse
   #:date.utc
   #:decode
   #:decode-uri
   #:decode-uri-component
   #:decompose
   #:decrement-by
   #:definition-error
   #:deflate
   #:delete-property
   #:delta-transform-point
   #:delta-transform-vector
   #:descendants
   #:describe-type
   #:dispatch-event
   #:dispose
   #:dot-product
   #:download
   #:draw
   #:draw-circle
   #:draw-ellipse
   #:draw-graphics-data
   #:draw-path
   #:draw-rect
   #:draw-round-rect
   #:draw-round-rect-complex
   #:draw-triangles
   #:dump
   #:elements
   #:encode-uri
   #:encode-uri-component
   #:end-fill
   #:end-position
   #:enter-debugger
   #:equals
   #:error
   #:error.get-error-message
   #:error.throw-error
   #:escape
   #:escape-multi-byte
   #:eval-error
   #:every
   #:exec
   #:external-interface.add-callback
   #:external-interface.call
   #:extract
   #:fill-rect
   #:filter
   #:filters
   #:find-next-atom-boundary
   #:find-next-word-boundary
   #:find-previous-atom-boundary
   #:find-previous-word-boundary
   #:find-text
   #:flash.accessibility.accessibility
   #:flash.accessibility.accessibility-implementation
   #:flash.accessibility.accessibility-properties
   #:flash.desktop.clipboard
   #:flash.desktop.clipboard-formats
   #:flash.desktop.clipboard-transfer-mode
   #:flash.display.action-script-version
   #:flash.display.avm1-movie
   #:flash.display.bitmap
   #:flash.display.bitmap-data
   #:flash.display.bitmap-data-channel
   #:flash.display.blend-mode
   #:flash.display.caps-style
   #:flash.display.color-correction
   #:flash.display.color-correction-support
   #:flash.display.display-object
   #:flash.display.display-object-container
   #:flash.display.frame-label
   #:flash.display.gradient-type
   #:flash.display.graphics
   #:flash.display.graphics-bitmap-fill
   #:flash.display.graphics-end-fill
   #:flash.display.graphics-gradient-fill
   #:flash.display.graphics-path
   #:flash.display.graphics-path-command
   #:flash.display.graphics-path-winding
   #:flash.display.graphics-shader-fill
   #:flash.display.graphics-solid-fill
   #:flash.display.graphics-stroke
   #:flash.display.graphics-triangle-path
   #:flash.display.i-bitmap-drawable
   #:flash.display.i-graphics-data
   #:flash.display.i-graphics-fill
   #:flash.display.i-graphics-path
   #:flash.display.i-graphics-stroke
   #:flash.display.interactive-object
   #:flash.display.interpolation-method
   #:flash.display.joint-style
   #:flash.display.line-scale-mode
   #:flash.display.loader
   #:flash.display.loader-info
   #:flash.display.morph-shape
   #:flash.display.movie-clip
   #:flash.display.pixel-snapping
   #:flash.display.scene
   #:flash.display.shader
   #:flash.display.shader-data
   #:flash.display.shader-input
   #:flash.display.shader-job
   #:flash.display.shader-parameter
   #:flash.display.shader-parameter-type
   #:flash.display.shader-precision
   #:flash.display.shape
   #:flash.display.simple-button
   #:flash.display.spread-method
   #:flash.display.sprite
   #:flash.display.stage
   #:flash.display.stage-align
   #:flash.display.stage-display-state
   #:flash.display.stage-quality
   #:flash.display.stage-scale-mode
   #:flash.display.swf-version
   #:flash.display.triangle-culling
   #:flash.errors.eof-error
   #:flash.errors.i-o-error
   #:flash.errors.illegal-operation-error
   #:flash.errors.invalid-swf-error
   #:flash.errors.memory-error
   #:flash.errors.script-timeout-error
   #:flash.errors.stack-overflow-error
   #:flash.events.activity-event
   #:flash.events.async-error-event
   #:flash.events.context-menu-event
   #:flash.events.data-event
   #:flash.events.error-event
   #:flash.events.event
   #:flash.events.event-dispatcher
   #:flash.events.event-phase
   #:flash.events.focus-event
   #:flash.events.full-screen-event
   #:flash.events.http-status-event
   #:flash.events.i-event-dispatcher
   #:flash.events.i-me-event
   #:flash.events.i-o-error-event
   #:flash.events.keyboard-event
   #:flash.events.mouse-event
   #:flash.events.net-filter-event
   #:flash.events.net-status-event
   #:flash.events.progress-event
   #:flash.events.sample-data-event
   #:flash.events.security-error-event
   #:flash.events.shader-event
   #:flash.events.status-event
   #:flash.events.sync-event
   #:flash.events.text-event
   #:flash.events.timer-event
   #:flash.events.weak-function-closure
   #:flash.events.weak-method-closure
   #:flash.external.external-interface
   #:flash.filters.bevel-filter
   #:flash.filters.bitmap-filter
   #:flash.filters.bitmap-filter-quality
   #:flash.filters.bitmap-filter-type
   #:flash.filters.blur-filter
   #:flash.filters.color-matrix-filter
   #:flash.filters.convolution-filter
   #:flash.filters.displacement-map-filter
   #:flash.filters.displacement-map-filter-mode
   #:flash.filters.drop-shadow-filter
   #:flash.filters.glow-filter
   #:flash.filters.gradient-bevel-filter
   #:flash.filters.gradient-glow-filter
   #:flash.filters.shader-filter
   #:flash.geom.color-transform
   #:flash.geom.matrix
   #:flash.geom.matrix3-d
   #:flash.geom.orientation3-d
   #:flash.geom.perspective-projection
   #:flash.geom.point
   #:flash.geom.rectangle
   #:flash.geom.transform
   #:flash.geom.utils3-d
   #:flash.geom.vector3-d
   #:flash.media.camera
   #:flash.media.i-d3-info
   #:flash.media.microphone
   #:flash.media.sound
   #:flash.media.sound-channel
   #:flash.media.sound-codec
   #:flash.media.sound-loader-context
   #:flash.media.sound-mixer
   #:flash.media.sound-transform
   #:flash.media.video
   #:flash.net.dynamic-property-output
   #:flash.net.file-filter
   #:flash.net.file-reference
   #:flash.net.file-reference-list
   #:flash.net.i-dynamic-property-output
   #:flash.net.i-dynamic-property-writer
   #:flash.net.local-connection
   #:flash.net.net-connection
   #:flash.net.net-stream
   #:flash.net.net-stream-info
   #:flash.net.net-stream-play-options
   #:flash.net.net-stream-play-transitions
   #:flash.net.object-encoding
   #:flash.net.responder
   #:flash.net.shared-object
   #:flash.net.shared-object-flush-status
   #:flash.net.socket
   #:flash.net.url-loader
   #:flash.net.url-loader-data-format
   #:flash.net.url-request
   #:flash.net.url-request-header
   #:flash.net.url-request-method
   #:flash.net.url-stream
   #:flash.net.url-variables
   #:flash.net.xml-socket
   #:flash.printing.print-job
   #:flash.printing.print-job-options
   #:flash.printing.print-job-orientation
   #:flash.sampler.delete-object-sample
   #:flash.sampler.new-object-sample
   #:flash.sampler.sample
   #:flash.sampler.stack-frame
   #:flash.system.application-domain
   #:flash.system.capabilities
   #:flash.system.fs-command
   #:flash.system.i-me-conversion-mode
   #:flash.system.ime
   #:flash.system.jpeg-loader-context
   #:flash.system.loader-context
   #:flash.system.security
   #:flash.system.security-domain
   #:flash.system.security-panel
   #:flash.system.system
   #:flash.text.anti-alias-type
   #:flash.text.csm-settings
   #:flash.text.engine.break-opportunity
   #:flash.text.engine.cff-hinting
   #:flash.text.engine.content-element
   #:flash.text.engine.digit-case
   #:flash.text.engine.digit-width
   #:flash.text.engine.east-asian-justifier
   #:flash.text.engine.element-format
   #:flash.text.engine.font-description
   #:flash.text.engine.font-lookup
   #:flash.text.engine.font-metrics
   #:flash.text.engine.font-posture
   #:flash.text.engine.font-weight
   #:flash.text.engine.graphic-element
   #:flash.text.engine.group-element
   #:flash.text.engine.justification-style
   #:flash.text.engine.kerning
   #:flash.text.engine.ligature-level
   #:flash.text.engine.line-justification
   #:flash.text.engine.rendering-mode
   #:flash.text.engine.space-justifier
   #:flash.text.engine.tab-alignment
   #:flash.text.engine.tab-stop
   #:flash.text.engine.text-baseline
   #:flash.text.engine.text-block
   #:flash.text.engine.text-element
   #:flash.text.engine.text-justifier
   #:flash.text.engine.text-line
   #:flash.text.engine.text-line-creation-result
   #:flash.text.engine.text-line-mirror-region
   #:flash.text.engine.text-line-validity
   #:flash.text.engine.text-rotation
   #:flash.text.engine.typographic-case
   #:flash.text.font
   #:flash.text.font-style
   #:flash.text.font-type
   #:flash.text.grid-fit-type
   #:flash.text.static-text
   #:flash.text.style-sheet
   #:flash.text.text-color-type
   #:flash.text.text-display-mode
   #:flash.text.text-extent
   #:flash.text.text-field
   #:flash.text.text-field-auto-size
   #:flash.text.text-field-type
   #:flash.text.text-format
   #:flash.text.text-format-align
   #:flash.text.text-format-display
   #:flash.text.text-line-metrics
   #:flash.text.text-renderer
   #:flash.text.text-run
   #:flash.text.text-snapshot
   #:flash.trace.trace
   #:flash.ui.context-menu
   #:flash.ui.context-menu-built-in-items
   #:flash.ui.context-menu-clipboard-items
   #:flash.ui.context-menu-item
   #:flash.ui.key-location
   #:flash.ui.keyboard
   #:flash.ui.mouse
   #:flash.ui.mouse-cursor
   #:flash.utils.byte-array
   #:flash.utils.dictionary
   #:flash.utils.endian
   #:flash.utils.i-data-input
   #:flash.utils.i-data-output
   #:flash.utils.i-externalizable
   #:flash.utils.object-input
   #:flash.utils.object-output
   #:flash.utils.proxy
   #:flash.utils.set-interval-timer
   #:flash.utils.timer
   #:flash.xml.xml-document
   #:flash.xml.xml-node
   #:flash.xml.xml-node-type
   #:flash.xml.xml-parser
   #:flash.xml.xml-tag
   #:flood-fill
   #:flush
   #:flush-atom-data
   #:font-description.is-font-compatible
   #:font.enumerate-fonts
   #:font.register-font
   #:for-each
   #:format-to-string
   #:frame-for-frame-number
   #:frame-offset
   #:frame-type
   #:fs-command.%fscommand
   #:fscommand
   #:function
   #:function.empty-ctor
   #:generate-filter-rect
   #:get-acc-default-action
   #:get-acc-focus
   #:get-acc-name
   #:get-acc-role
   #:get-acc-selection
   #:get-acc-state
   #:get-acc-value
   #:get-atom-bidi-level
   #:get-atom-bounds
   #:get-atom-center
   #:get-atom-graphic
   #:get-atom-index-at-char-index
   #:get-atom-index-at-point
   #:get-atom-text-block-begin-index
   #:get-atom-text-block-end-index
   #:get-atom-text-rotation
   #:get-atom-word-boundary-on-left
   #:get-baseline-position
   #:get-bounds
   #:get-char-boundaries
   #:get-char-index-at-point
   #:get-child-at
   #:get-child-by-name
   #:get-child-id-array
   #:get-child-index
   #:get-class-by-alias
   #:get-color-bounds-rect
   #:get-data
   #:get-date
   #:get-day
   #:get-definition
   #:get-definition-by-name
   #:get-descendants
   #:get-element-at
   #:get-element-at-char-index
   #:get-element-index
   #:get-first-char-in-paragraph
   #:get-font-metrics
   #:get-full-year
   #:get-getter-invocation-count
   #:get-hours
   #:get-image-reference
   #:get-invocation-count
   #:get-line-index-at-point
   #:get-line-index-of-char
   #:get-line-length
   #:get-line-metrics
   #:get-line-offset
   #:get-line-text
   #:get-member-names
   #:get-milliseconds
   #:get-minutes
   #:get-mirror-region
   #:get-month
   #:get-namespace-for-prefix
   #:get-next
   #:get-objects-under-point
   #:get-paragraph-length
   #:get-pixel
   #:get-pixel32
   #:get-pixels
   #:get-prefix-for-namespace
   #:get-property
   #:get-qualified-class-name
   #:get-qualified-superclass-name
   #:get-raw-text
   #:get-rect
   #:get-relative-matrix3-d
   #:get-sample-count
   #:get-samples
   #:get-seconds
   #:get-selected
   #:get-selected-text
   #:get-setter-invocation-count
   #:get-size
   #:get-stack-trace
   #:get-style
   #:get-text
   #:get-text-format
   #:get-text-line-at-char-index
   #:get-text-run-info
   #:get-text-runs
   #:get-time
   #:get-timer
   #:get-timezone-offset
   #:get-utc-date
   #:get-utc-day
   #:get-utc-full-year
   #:get-utc-hours
   #:get-utc-milliseconds
   #:get-utc-minutes
   #:get-utc-month
   #:get-utc-seconds
   #:get-vector
   #:get-xml-text
   #:global-to-local
   #:global-to-local3-d
   #:goto-and-play
   #:goto-and-stop
   #:group-elements
   #:has-child-nodes
   #:has-complex-content
   #:has-definition
   #:has-empty-path
   #:has-event-listener
   #:has-format
   #:has-glyphs
   #:has-own-property
   #:has-property
   #:has-shape-selection
   #:has-simple-content
   #:hide-built-in-items
   #:histogram
   #:hit-test
   #:hit-test-object
   #:hit-test-point
   #:hit-test-text-near-pos
   #:identity
   #:ime.do-conversion
   #:ime.set-composition-string
   #:in-scope-namespaces
   #:increment-by
   #:index-of
   #:inflate
   #:inflate-point
   #:insert-before
   #:insert-child-after
   #:insert-child-before
   #:insert-xml-text
   #:int
   #:interpolate-to
   #:intersection
   #:intersects
   #:invalidate
   #:invert
   #:is-attribute
   #:is-default-prevented
   #:is-empty
   #:is-finite
   #:is-floater
   #:is-focus-inaccessible
   #:is-getter-setter
   #:is-labeled-by
   #:is-na-n
   #:is-primitive
   #:is-prototype-of
   #:is-selected
   #:is-visible
   #:is-xml-name
   #:join
   #:keyboard.is-accessible
   #:last-index-of
   #:launch
   #:length
   #:line-bitmap-style
   #:line-gradient-style
   #:line-shader-style
   #:line-style
   #:line-to
   #:live-preview-size
   #:load
   #:load-bytes
   #:loader-info.get-loader-info-by-definition
   #:local-name
   #:local-to-global
   #:local3-d-to-global
   #:locale-compare
   #:lock
   #:locked
   #:map
   #:match
   #:math
   #:math.%max
   #:math.%min
   #:math.abs
   #:math.acos
   #:math.asin
   #:math.atan
   #:math.atan2
   #:math.ceil
   #:math.cos
   #:math.exp
   #:math.floor
   #:math.log
   #:math.max
   #:math.min
   #:math.pow
   #:math.random
   #:math.round
   #:math.sin
   #:math.sqrt
   #:math.tan
   #:matrix3-d.interpolate
   #:merge
   #:merge-text-elements
   #:microphone.get-microphone
   #:mm-end-command
   #:mm-execute
   #:motion-path
   #:mouse.hide
   #:mouse.show
   #:move-to
   #:name
   #:namespace
   #:namespace-declarations
   #:navigate-to-url
   #:near-equals
   #:negate
   #:next-frame
   #:next-name
   #:next-name-index
   #:next-scene
   #:next-value
   #:node-kind
   #:noise
   #:normalize
   #:notification
   #:number
   #:number.%convert
   #:number.%to-string
   #:obj-matrix
   #:object
   #:object.%dont-enum-prototype
   #:object.%has-own-property
   #:object.%is-prototype-of
   #:object.%property-is-enumerable
   #:object.%set-property-is-enumerable
   #:object.%to-string
   #:object.init
   #:offset
   #:offset-point
   #:on-peer-connect
   #:outline-color
   #:outline-mode
   #:palette-map
   #:parent
   #:parse-css
   #:parse-float
   #:parse-int
   #:parse-xml
   #:paste-rich-text
   #:pause
   #:pause-sampling
   #:perlin-noise
   #:pixel-dissolve
   #:play
   #:play2
   #:point-at
   #:point.distance
   #:point.interpolate
   #:point.polar
   #:pop
   #:prepend
   #:prepend-child
   #:prepend-rotation
   #:prepend-scale
   #:prepend-translation
   #:prev-frame
   #:prev-scene
   #:prevent-default
   #:processing-instructions
   #:profile
   #:project
   #:property-is-enumerable
   #:publish
   #:push
   #:q-name
   #:range-error
   #:read-boolean
   #:read-byte
   #:read-bytes
   #:read-double
   #:read-float
   #:read-int
   #:read-multi-byte
   #:read-object
   #:read-short
   #:read-unsigned-byte
   #:read-unsigned-int
   #:read-unsigned-short
   #:read-utf
   #:read-utf-bytes
   #:receive-audio
   #:receive-video
   #:receive-video-fps
   #:recompose
   #:reference-error
   #:reg-exp
   #:register-class-alias
   #:registration-point
   #:release-lines
   #:remove-child
   #:remove-child-at
   #:remove-event-listener
   #:remove-namespace
   #:remove-node
   #:replace
   #:replace-elements
   #:replace-selected-text
   #:replace-text
   #:reset
   #:resume
   #:reverse
   #:rotate
   #:save
   #:scale
   #:scale-by
   #:scale9-grid
   #:scroll
   #:search
   #:security-error
   #:security.allow-domain
   #:security.allow-insecure-domain
   #:security.load-policy-file
   #:security.show-settings
   #:seek
   #:send
   #:send-to-url
   #:set-child-index
   #:set-children
   #:set-cursor
   #:set-data
   #:set-data-handler
   #:set-date
   #:set-dirty
   #:set-elements
   #:set-empty
   #:set-full-year
   #:set-hours
   #:set-interval
   #:set-interval-timer.clear-interval
   #:set-key-frame-interval
   #:set-local-name
   #:set-loop-back
   #:set-loopback
   #:set-milliseconds
   #:set-minutes
   #:set-mode
   #:set-month
   #:set-motion-level
   #:set-name
   #:set-namespace
   #:set-notification
   #:set-pixel
   #:set-pixel32
   #:set-pixels
   #:set-property
   #:set-quality
   #:set-seconds
   #:set-select-color
   #:set-selected
   #:set-selection
   #:set-silence-level
   #:set-style
   #:set-text-format
   #:set-time
   #:set-timeout
   #:set-use-echo-suppression
   #:set-utc-date
   #:set-utc-full-year
   #:set-utc-hours
   #:set-utc-milliseconds
   #:set-utc-minutes
   #:set-utc-month
   #:set-utc-seconds
   #:set-vector
   #:shared-object.delete-all
   #:shared-object.get-disk-usage
   #:shared-object.get-local
   #:shared-object.get-remote
   #:shift
   #:show-redraw-regions
   #:slice
   #:some
   #:sort
   #:sort-on
   #:sound-mixer.are-sounds-inaccessible
   #:sound-mixer.compute-spectrum
   #:sound-mixer.stop-all
   #:splice
   #:split
   #:split-text-element
   #:start
   #:start-drag
   #:start-parse
   #:start-position
   #:start-sampling
   #:stop
   #:stop-drag
   #:stop-immediate-propagation
   #:stop-propagation
   #:stop-sampling
   #:string
   #:string.%match
   #:string.%replace
   #:string.%search
   #:string.%split
   #:string.from-char-code
   #:substr
   #:substring
   #:subtract
   #:swap-children
   #:swap-children-at
   #:symbol-behavior
   #:symbol-mode
   #:syntax-error
   #:system.exit
   #:system.gc
   #:system.pause
   #:system.resume
   #:system.set-clipboard
   #:test
   #:text
   #:text-field.is-font-compatible
   #:text-justifier.get-justifier-for-locale
   #:text-renderer.set-advanced-anti-aliasing-table
   #:three-d-matrix
   #:three-d-translation-handle-points
   #:threshold
   #:to-date-string
   #:to-exponential
   #:to-fixed
   #:to-locale-date-string
   #:to-locale-lower-case
   #:to-locale-string
   #:to-locale-time-string
   #:to-locale-upper-case
   #:to-lower-case
   #:to-matrix3-d
   #:to-precision
   #:to-string
   #:to-time-string
   #:to-upper-case
   #:to-utc-string
   #:to-xml-string
   #:toggle-pause
   #:trace
   #:trace.get-level
   #:trace.get-listener
   #:trace.set-level
   #:trace.set-listener
   #:transform
   #:transform-point
   #:transform-vector
   #:transform-vectors
   #:translate
   #:transpose
   #:type-error
   #:uint
   #:uncompress
   #:unescape
   #:unescape-multi-byte
   #:ungroup-elements
   #:uninitialized-error
   #:union
   #:unload
   #:unload-and-stop
   #:unlock
   #:unshift
   #:update-after-event
   #:upload
   #:uri-error
   #:utils3-d.point-towards
   #:utils3-d.project-vector
   #:utils3-d.project-vectors
   #:value-of
   #:vector3-d.angle-between
   #:vector3-d.distance
   #:verify-error
   #:wide-line-to
   #:wide-move-to
   #:will-trigger
   #:write-boolean
   #:write-byte
   #:write-bytes
   #:write-double
   #:write-dynamic-property
   #:write-float
   #:write-int
   #:write-multi-byte
   #:write-object
   #:write-short
   #:write-unsigned-int
   #:write-utf
   #:write-utf-bytes
   #:xml
   #:xml-list
   #:xml.default-settings
   #:xml.set-settings
   #:xml.settings
   #:xmlui.accept
   #:xmlui.cancel
   #:xmlui.get-property
   #:xmlui.set-property))

(cl:defvar avm2-compiler::*player-symbol-table* (cl:make-instance 'avm2-compiler::symbol-table))

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defconstant flash:+nan+ "NaN" "Number")
   (avm2-compiler::swf-ffi-defconstant flash:+undefined+ "undefined" "*")
   (avm2-compiler::swf-ffi-defconstant flash:+infinity+ "Infinity" "Number")
   (avm2-compiler::swf-ffi-defconstant flash:+as3+ "AS3" "*")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:decode-uri-component "decodeURIComponent"
    (&OPTIONAL (("uri" "String") "undefined")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:is-finite "isFinite"
    (&OPTIONAL (("n" "Number") "UNDEFINED")) "Boolean")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:is-na-n "isNaN"
    (&OPTIONAL (("n" "Number") "UNDEFINED")) "Boolean")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:parse-float "parseFloat"
    (&OPTIONAL (("str" "String") "NaN")) "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:unescape "unescape"
    (&OPTIONAL (("s" "String") "undefined")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:parse-int "parseInt"
    (&OPTIONAL (("s" "String") "0") (("radix" "int") "NaN")) "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:encode-uri-component "encodeURIComponent"
    (&OPTIONAL (("uri" "String") "undefined")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:decode-uri "decodeURI"
    (&OPTIONAL (("uri" "String") "undefined")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:encode-uri "encodeURI"
    (&OPTIONAL (("uri" "String") "undefined")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:escape "escape"
    (&OPTIONAL (("s" "String") "undefined")) "String")
  (avm2-compiler::declare-swf-class flash:object ()
    :swf-name "Object"
    :constants
    ((flash:+object.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T))
    :properties
    ()
    :methods
    ((flash:is-prototype-of :SWF-NAME "isPrototypeOf" :RETURN-TYPE "Boolean"
      :ARGS (&OPTIONAL (("V" "*") "UNDEFINED")) :STATIC NIL)
     (flash:property-is-enumerable :SWF-NAME "propertyIsEnumerable"
      :RETURN-TYPE "Boolean" :ARGS (&OPTIONAL (("V" "*") "UNDEFINED")) :STATIC
      NIL)
     (flash:has-own-property :SWF-NAME "hasOwnProperty" :RETURN-TYPE "Boolean"
      :ARGS (&OPTIONAL (("V" "*") "UNDEFINED")) :STATIC NIL)
     (flash::object.init :SWF-NAME "init" :RETURN-TYPE "*" :ARGS NIL :STATIC T)
     (flash::object.%to-string :SWF-NAME "Object::_toString" :RETURN-TYPE
      "String" :ARGS (("o" "*")) :STATIC T)
     (flash::object.%set-property-is-enumerable :SWF-NAME
      "Object::_setPropertyIsEnumerable" :RETURN-TYPE "void" :ARGS
      (("o" "*") ("V" "String") ("enumerable" "Boolean")) :STATIC T)
     (flash::object.%is-prototype-of :SWF-NAME "Object::_isPrototypeOf"
      :RETURN-TYPE "Boolean" :ARGS (("o" "*") ("V" "*")) :STATIC T)
     (flash::object.%property-is-enumerable :SWF-NAME
      "Object::_propertyIsEnumerable" :RETURN-TYPE "Boolean" :ARGS
      (("o" "*") ("V" "String")) :STATIC T)
     (flash::object.%dont-enum-prototype :SWF-NAME "Object::_dontEnumPrototype"
      :RETURN-TYPE "void" :ARGS (("proto" "Object")) :STATIC T)
     (flash::object.%has-own-property :SWF-NAME "Object::_hasOwnProperty"
      :RETURN-TYPE "Boolean" :ARGS (("o" "*") ("V" "String")) :STATIC T)))
  (avm2-compiler::declare-swf-class flash:class (flash:object)
    :swf-name "Class"
    :constants
    ((flash:+class.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T))
    :properties
    ((flash::prototype :SWF-NAME "prototype" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.prototype))
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:function (flash:object)
    :swf-name "Function"
    :constants
    ((flash:+function.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC
      T))
    :properties
    ((flash::length :SWF-NAME "length" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.length)
     (flash::prototype :SWF-NAME "prototype" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.prototype))
    :methods
    ((flash:apply :SWF-NAME "apply" :RETURN-TYPE "*" :ARGS
      (&OPTIONAL (("thisArg" "*") "UNDEFINED") (("argArray" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:call :SWF-NAME "call" :RETURN-TYPE "*" :ARGS
      (&OPTIONAL (("thisArg" "*") "UNDEFINED")) :STATIC NIL)
     (flash::function.empty-ctor :SWF-NAME "Function::emptyCtor" :RETURN-TYPE
      "*" :ARGS NIL :STATIC T)))
  (avm2-compiler::declare-swf-class flash:namespace (flash:object)
    :swf-name "Namespace"
    :constants
    ((flash:+namespace.length+ :SWF-NAME "length" :TYPE "*" :VALUE "2" :STATIC
      T))
    :properties
    ((flash::uri :SWF-NAME "uri" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.uri)
     (flash::prefix :SWF-NAME "prefix" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.prefix))
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash:boolean (flash:object)
    :swf-name "Boolean"
    :constants
    ((flash:+boolean.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC
      T))
    :properties
    ()
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "Boolean" :ARGS NIL
      :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash:number (flash:object)
    :swf-name "Number"
    :constants
    ((flash:+number.nan+ :SWF-NAME "NaN" :TYPE "Number" :VALUE "NOT-A-NUMBER"
      :STATIC T)
     (flash:+number.dtostr-exponential+ :SWF-NAME "Number::DTOSTR_EXPONENTIAL"
      :TYPE "int" :VALUE "3" :STATIC T)
     (flash:+number.max-value+ :SWF-NAME "MAX_VALUE" :TYPE "Number" :VALUE
      "1.7976931348623157d308" :STATIC T)
     (flash:+number.negative-infinity+ :SWF-NAME "NEGATIVE_INFINITY" :TYPE
      "Number" :VALUE "NEGATIVE-INFINITY" :STATIC T)
     (flash:+number.dtostr-precision+ :SWF-NAME "Number::DTOSTR_PRECISION"
      :TYPE "int" :VALUE "2" :STATIC T)
     (flash:+number.positive-infinity+ :SWF-NAME "POSITIVE_INFINITY" :TYPE
      "Number" :VALUE "POSITIVE-INFINITY" :STATIC T)
     (flash:+number.dtostr-fixed+ :SWF-NAME "Number::DTOSTR_FIXED" :TYPE "int"
      :VALUE "1" :STATIC T)
     (flash:+number.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T)
     (flash:+number.min-value+ :SWF-NAME "MIN_VALUE" :TYPE "Number" :VALUE
      "4.9406564584124654d-324" :STATIC T))
    :properties
    ()
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("radix" "*") "10")) :STATIC NIL)
     (flash:to-exponential :SWF-NAME "toExponential" :RETURN-TYPE "String"
      :ARGS (&OPTIONAL (("p" "*") "0")) :STATIC NIL)
     (flash:to-fixed :SWF-NAME "toFixed" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("p" "*") "0")) :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:to-precision :SWF-NAME "toPrecision" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("p" "*") "0")) :STATIC NIL)
     (flash::number.%to-string :SWF-NAME "Number::_toString" :RETURN-TYPE
      "String" :ARGS (("n" "Number") ("radix" "int")) :STATIC T)
     (flash::number.%convert :SWF-NAME "Number::_convert" :RETURN-TYPE "String"
      :ARGS (("n" "Number") ("precision" "int") ("mode" "int")) :STATIC T)))
  (avm2-compiler::declare-swf-class flash:int (flash:object)
    :swf-name "int"
    :constants
    ((flash:+int.max-value+ :SWF-NAME "MAX_VALUE" :TYPE "int" :VALUE
      "2147483647" :STATIC T)
     (flash:+int.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T)
     (flash:+int.min-value+ :SWF-NAME "MIN_VALUE" :TYPE "int" :VALUE
      "-2147483648" :STATIC T))
    :properties
    ()
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("radix" "*") "10")) :STATIC NIL)
     (flash:to-exponential :SWF-NAME "toExponential" :RETURN-TYPE "String"
      :ARGS (&OPTIONAL (("p" "*") "0")) :STATIC NIL)
     (flash:to-fixed :SWF-NAME "toFixed" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("p" "*") "0")) :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:to-precision :SWF-NAME "toPrecision" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("p" "*") "0")) :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash:uint (flash:object)
    :swf-name "uint"
    :constants
    ((flash:+uint.max-value+ :SWF-NAME "MAX_VALUE" :TYPE "uint" :VALUE
      "4.294967295d9" :STATIC T)
     (flash:+uint.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T)
     (flash:+uint.min-value+ :SWF-NAME "MIN_VALUE" :TYPE "uint" :VALUE "0"
      :STATIC T))
    :properties
    ()
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("radix" "*") "10")) :STATIC NIL)
     (flash:to-exponential :SWF-NAME "toExponential" :RETURN-TYPE "String"
      :ARGS (&OPTIONAL (("p" "*") "0")) :STATIC NIL)
     (flash:to-fixed :SWF-NAME "toFixed" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("p" "*") "0")) :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "uint" :ARGS NIL :STATIC
      NIL)
     (flash:to-precision :SWF-NAME "toPrecision" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("p" "*") "0")) :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash:string (flash:object)
    :swf-name "String"
    :constants
    ((flash:+string.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T))
    :properties
    ((flash::length :SWF-NAME "length" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.length))
    :methods
    ((flash:to-locale-upper-case :SWF-NAME "toLocaleUpperCase" :RETURN-TYPE
      "String" :ARGS NIL :STATIC NIL)
     (flash:to-upper-case :SWF-NAME "toUpperCase" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash:char-code-at :SWF-NAME "charCodeAt" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("i" "Number") "0")) :STATIC NIL)
     (flash:replace :SWF-NAME "replace" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("p" "*") "UNDEFINED") (("repl" "*") "UNDEFINED")) :STATIC
      NIL)
     (flash:substr :SWF-NAME "substr" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("start" "Number") "2147483647") (("len" "Number") "0"))
      :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:locale-compare :SWF-NAME "localeCompare" :RETURN-TYPE "int" :ARGS
      (&OPTIONAL (("other" "String") "UNDEFINED")) :STATIC NIL)
     (flash:char-at :SWF-NAME "charAt" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("i" "Number") "0")) :STATIC NIL)
     (flash:search :SWF-NAME "search" :RETURN-TYPE "int" :ARGS
      (&OPTIONAL (("p" "*") "UNDEFINED")) :STATIC NIL)
     (flash::string.%slice :SWF-NAME "String::_slice" :RETURN-TYPE "String"
      :ARGS (&OPTIONAL (("start" "int") "2147483647") (("end" "int") "0"))
      :STATIC NIL)
     (flash:to-locale-lower-case :SWF-NAME "toLocaleLowerCase" :RETURN-TYPE
      "String" :ARGS NIL :STATIC NIL)
     (flash:concat :SWF-NAME "concat" :RETURN-TYPE "String" :ARGS NIL :STATIC
      NIL)
     (flash:split :SWF-NAME "split" :RETURN-TYPE "Array" :ARGS
      (&OPTIONAL (("delim" "*") "4.294967295d9") (("limit" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash::string.%substring :SWF-NAME "String::_substring" :RETURN-TYPE
      "String" :ARGS
      (&OPTIONAL (("start" "int") "2147483647") (("end" "int") "0")) :STATIC
      NIL)
     (flash:to-lower-case :SWF-NAME "toLowerCase" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash::string.%char-code-at :SWF-NAME "String::_charCodeAt" :RETURN-TYPE
      "Number" :ARGS (&OPTIONAL (("i" "int") "0")) :STATIC NIL)
     (flash::string.%last-index-of :SWF-NAME "String::_lastIndexOf"
      :RETURN-TYPE "int" :ARGS
      (("s" "String") &OPTIONAL (("i" "int") "2147483647")) :STATIC NIL)
     (flash:last-index-of :SWF-NAME "lastIndexOf" :RETURN-TYPE "int" :ARGS
      (&OPTIONAL (("s" "String") "2147483647") (("i" "Number") "undefined"))
      :STATIC NIL)
     (flash:slice :SWF-NAME "slice" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("start" "Number") "2147483647") (("end" "Number") "0"))
      :STATIC NIL)
     (flash:substring :SWF-NAME "substring" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("start" "Number") "2147483647") (("end" "Number") "0"))
      :STATIC NIL)
     (flash::string.%substr :SWF-NAME "String::_substr" :RETURN-TYPE "String"
      :ARGS (&OPTIONAL (("start" "int") "2147483647") (("end" "int") "0"))
      :STATIC NIL)
     (flash::string.%index-of :SWF-NAME "String::_indexOf" :RETURN-TYPE "int"
      :ARGS (("s" "String") &OPTIONAL (("i" "int") "0")) :STATIC NIL)
     (flash:index-of :SWF-NAME "indexOf" :RETURN-TYPE "int" :ARGS
      (&OPTIONAL (("s" "String") "0") (("i" "Number") "undefined")) :STATIC NIL)
     (flash::string.%char-at :SWF-NAME "String::_charAt" :RETURN-TYPE "String"
      :ARGS (&OPTIONAL (("i" "int") "0")) :STATIC NIL)
     (flash:match :SWF-NAME "match" :RETURN-TYPE "Array" :ARGS
      (&OPTIONAL (("p" "*") "UNDEFINED")) :STATIC NIL)
     (flash::string.from-char-code :SWF-NAME "fromCharCode" :RETURN-TYPE
      "String" :ARGS NIL :STATIC T)
     (flash::string.%split :SWF-NAME "String::_split" :RETURN-TYPE "Array"
      :ARGS (("s" "String") ("delim" "*") ("limit" "uint")) :STATIC T)
     (flash::string.%search :SWF-NAME "String::_search" :RETURN-TYPE "int"
      :ARGS (("s" "String") ("p" "*")) :STATIC T)
     (flash::string.%match :SWF-NAME "String::_match" :RETURN-TYPE "Array"
      :ARGS (("s" "String") ("p" "*")) :STATIC T)
     (flash::string.%replace :SWF-NAME "String::_replace" :RETURN-TYPE "String"
      :ARGS (("s" "String") ("p" "*") ("repl" "*")) :STATIC T)))
  (avm2-compiler::declare-swf-class flash:array (flash:object)
    :swf-name "Array"
    :constants
    ((flash:+array.descending+ :SWF-NAME "DESCENDING" :TYPE "uint" :VALUE "2"
      :STATIC T)
     (flash:+array.returnindexedarray+ :SWF-NAME "RETURNINDEXEDARRAY" :TYPE
      "uint" :VALUE "8" :STATIC T)
     (flash:+array.uniquesort+ :SWF-NAME "UNIQUESORT" :TYPE "uint" :VALUE "4"
      :STATIC T)
     (flash:+array.numeric+ :SWF-NAME "NUMERIC" :TYPE "uint" :VALUE "16"
      :STATIC T)
     (flash:+array.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T)
     (flash:+array.caseinsensitive+ :SWF-NAME "CASEINSENSITIVE" :TYPE "uint"
      :VALUE "1" :STATIC T))
    :properties
    ((flash::length :SWF-NAME "length" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.length))
    :methods
    ((flash:sort :SWF-NAME "sort" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:sort-on :SWF-NAME "sortOn" :RETURN-TYPE "*" :ARGS
      (("names" "*") &OPTIONAL (("options" "*") "0")) :STATIC NIL)
     (flash:splice :SWF-NAME "splice" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:every :SWF-NAME "every" :RETURN-TYPE "Boolean" :ARGS
      (("callback" "Function") &OPTIONAL ("thisObject" "*")) :STATIC NIL)
     (flash:push :SWF-NAME "push" :RETURN-TYPE "uint" :ARGS NIL :STATIC NIL)
     (flash:for-each :SWF-NAME "forEach" :RETURN-TYPE "void" :ARGS
      (("callback" "Function") &OPTIONAL ("thisObject" "*")) :STATIC NIL)
     (flash:filter :SWF-NAME "filter" :RETURN-TYPE "Array" :ARGS
      (("callback" "Function") &OPTIONAL ("thisObject" "*")) :STATIC NIL)
     (flash:some :SWF-NAME "some" :RETURN-TYPE "Boolean" :ARGS
      (("callback" "Function") &OPTIONAL ("thisObject" "*")) :STATIC NIL)
     (flash:concat :SWF-NAME "concat" :RETURN-TYPE "Array" :ARGS NIL :STATIC
      NIL)
     (flash:slice :SWF-NAME "slice" :RETURN-TYPE "Array" :ARGS
      (&OPTIONAL (("A" "*") "4.294967295d9") (("B" "*") "0")) :STATIC NIL)
     (flash:pop :SWF-NAME "pop" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:index-of :SWF-NAME "indexOf" :RETURN-TYPE "int" :ARGS
      (("searchElement" "*") &OPTIONAL (("fromIndex" "*") "0")) :STATIC NIL)
     (flash:last-index-of :SWF-NAME "lastIndexOf" :RETURN-TYPE "int" :ARGS
      (("searchElement" "*") &OPTIONAL (("fromIndex" "*") "2147483647"))
      :STATIC NIL)
     (flash:join :SWF-NAME "join" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("sep" "*") "UNDEFINED")) :STATIC NIL)
     (flash:unshift :SWF-NAME "unshift" :RETURN-TYPE "uint" :ARGS NIL :STATIC
      NIL)
     (flash:shift :SWF-NAME "shift" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:map :SWF-NAME "map" :RETURN-TYPE "Array" :ARGS
      (("callback" "Function") &OPTIONAL ("thisObject" "*")) :STATIC NIL)
     (flash:reverse :SWF-NAME "reverse" :RETURN-TYPE "Array" :ARGS NIL :STATIC
      NIL)
     (flash::array.%sort :SWF-NAME "Array::_sort" :RETURN-TYPE "*" :ARGS
      (("o" "*") ("args" "Array")) :STATIC T)
     (flash::array.%sort-on :SWF-NAME "Array::_sortOn" :RETURN-TYPE "*" :ARGS
      (("o" "*") ("names" "*") ("options" "*")) :STATIC T)
     (flash::array.%some :SWF-NAME "Array::_some" :RETURN-TYPE "Boolean" :ARGS
      (("o" "*") ("callback" "Function") ("thisObject" "*")) :STATIC T)
     (flash::array.%concat :SWF-NAME "Array::_concat" :RETURN-TYPE "Array"
      :ARGS (("o" "*") ("args" "Array")) :STATIC T)
     (flash::array.%for-each :SWF-NAME "Array::_forEach" :RETURN-TYPE "void"
      :ARGS (("o" "*") ("callback" "Function") ("thisObject" "*")) :STATIC T)
     (flash::array.%reverse :SWF-NAME "Array::_reverse" :RETURN-TYPE "*" :ARGS
      (("o" "*")) :STATIC T)
     (flash::array.%map :SWF-NAME "Array::_map" :RETURN-TYPE "Array" :ARGS
      (("o" "*") ("callback" "Function") ("thisObject" "*")) :STATIC T)
     (flash::array.%every :SWF-NAME "Array::_every" :RETURN-TYPE "Boolean"
      :ARGS (("o" "*") ("callback" "Function") ("thisObject" "*")) :STATIC T)
     (flash::array.%splice :SWF-NAME "Array::_splice" :RETURN-TYPE "Array"
      :ARGS (("o" "*") ("args" "Array")) :STATIC T)
     (flash::array.%filter :SWF-NAME "Array::_filter" :RETURN-TYPE "Array"
      :ARGS (("o" "*") ("callback" "Function") ("thisObject" "*")) :STATIC T)
     (flash::array.%last-index-of :SWF-NAME "Array::_lastIndexOf" :RETURN-TYPE
      "int" :ARGS
      (("o" "*") ("searchElement" "*") &OPTIONAL (("fromIndex" "int") "0"))
      :STATIC T)
     (flash::array.%slice :SWF-NAME "Array::_slice" :RETURN-TYPE "Array" :ARGS
      (("o" "*") ("A" "Number") ("B" "Number")) :STATIC T)
     (flash::array.%pop :SWF-NAME "Array::_pop" :RETURN-TYPE "*" :ARGS
      (("o" "*")) :STATIC T)
     (flash::array.%index-of :SWF-NAME "Array::_indexOf" :RETURN-TYPE "int"
      :ARGS (("o" "*") ("searchElement" "*") ("fromIndex" "int")) :STATIC T)
     (flash::array.%join :SWF-NAME "Array::_join" :RETURN-TYPE "String" :ARGS
      (("o" "*") ("sep" "*")) :STATIC T)
     (flash::array.%shift :SWF-NAME "Array::_shift" :RETURN-TYPE "*" :ARGS
      (("o" "*")) :STATIC T)))
  (avm2-compiler::declare-swf-class flash::%-as3--.vec.vector (flash:object)
    :swf-name "__AS3__.vec::Vector"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::%-as3--.vec.vector$object (flash:object)
    :swf-name "__AS3__.vec::Vector$object"
    :constants
    ()
    :properties
    ((flash::length :SWF-NAME "length" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.length)
     (flash::fixed :SWF-NAME "fixed" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.fixed))
    :methods
    ((flash:filter :SWF-NAME "filter" :RETURN-TYPE "__AS3__.vec::Vector$object"
      :ARGS (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:splice :SWF-NAME "splice" :RETURN-TYPE "__AS3__.vec::Vector$object"
      :ARGS (("start" "Number") ("deleteCount" "Number")) :STATIC NIL)
     (flash:some :SWF-NAME "some" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "*") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:for-each :SWF-NAME "forEach" :RETURN-TYPE "void" :ARGS
      (("eacher" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:to-locale-string :SWF-NAME "toLocaleString" :RETURN-TYPE "String"
      :ARGS NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:last-index-of :SWF-NAME "lastIndexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "Object") &OPTIONAL (("from" "Number") "2147483647")) :STATIC
      NIL)
     (flash:join :SWF-NAME "join" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("separator" "String") ",")) :STATIC NIL)
     (flash:shift :SWF-NAME "shift" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:sort :SWF-NAME "sort" :RETURN-TYPE "__AS3__.vec::Vector$object"
      :ARGS (("comparefn" "*")) :STATIC NIL)
     (flash:map :SWF-NAME "map" :RETURN-TYPE "*" :ARGS
      (("mapper" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:every :SWF-NAME "every" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:push :SWF-NAME "push" :RETURN-TYPE "uint" :ARGS NIL :STATIC NIL)
     (flash:concat :SWF-NAME "concat" :RETURN-TYPE "__AS3__.vec::Vector$object"
      :ARGS NIL :STATIC NIL)
     (flash:slice :SWF-NAME "slice" :RETURN-TYPE "__AS3__.vec::Vector$object"
      :ARGS
      (&OPTIONAL (("start" "Number") "2147483647") (("end" "Number") "0"))
      :STATIC NIL)
     (flash:pop :SWF-NAME "pop" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:index-of :SWF-NAME "indexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "Object") &OPTIONAL (("from" "Number") "0")) :STATIC NIL)
     (flash:unshift :SWF-NAME "unshift" :RETURN-TYPE "uint" :ARGS NIL :STATIC
      NIL)
     (flash:reverse :SWF-NAME "reverse" :RETURN-TYPE
      "__AS3__.vec::Vector$object" :ARGS NIL :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash::%-as3--.vec.vector$int (flash:object)
    :swf-name "__AS3__.vec::Vector$int"
    :constants
    ()
    :properties
    ((flash::fixed :SWF-NAME "fixed" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.fixed)
     (flash::length :SWF-NAME "length" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.length))
    :methods
    ((flash:splice :SWF-NAME "splice" :RETURN-TYPE "__AS3__.vec::Vector$int"
      :ARGS (("start" "Number") ("deleteCount" "Number")) :STATIC NIL)
     (flash:filter :SWF-NAME "filter" :RETURN-TYPE "__AS3__.vec::Vector$int"
      :ARGS (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:join :SWF-NAME "join" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("separator" "String") ",")) :STATIC NIL)
     (flash:to-locale-string :SWF-NAME "toLocaleString" :RETURN-TYPE "String"
      :ARGS NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:last-index-of :SWF-NAME "lastIndexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "int") &OPTIONAL (("from" "Number") "2147483647")) :STATIC NIL)
     (flash:for-each :SWF-NAME "forEach" :RETURN-TYPE "void" :ARGS
      (("eacher" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:sort :SWF-NAME "sort" :RETURN-TYPE "__AS3__.vec::Vector$int" :ARGS
      (("comparefn" "*")) :STATIC NIL)
     (flash:map :SWF-NAME "map" :RETURN-TYPE "*" :ARGS
      (("mapper" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:every :SWF-NAME "every" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:push :SWF-NAME "push" :RETURN-TYPE "uint" :ARGS NIL :STATIC NIL)
     (flash:some :SWF-NAME "some" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "*") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:concat :SWF-NAME "concat" :RETURN-TYPE "__AS3__.vec::Vector$int"
      :ARGS NIL :STATIC NIL)
     (flash:slice :SWF-NAME "slice" :RETURN-TYPE "__AS3__.vec::Vector$int"
      :ARGS
      (&OPTIONAL (("start" "Number") "2147483647") (("end" "Number") "0"))
      :STATIC NIL)
     (flash:pop :SWF-NAME "pop" :RETURN-TYPE "int" :ARGS NIL :STATIC NIL)
     (flash:index-of :SWF-NAME "indexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "int") &OPTIONAL (("from" "Number") "0")) :STATIC NIL)
     (flash:unshift :SWF-NAME "unshift" :RETURN-TYPE "uint" :ARGS NIL :STATIC
      NIL)
     (flash:reverse :SWF-NAME "reverse" :RETURN-TYPE "__AS3__.vec::Vector$int"
      :ARGS NIL :STATIC NIL)
     (flash:shift :SWF-NAME "shift" :RETURN-TYPE "int" :ARGS NIL :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash::%-as3--.vec.vector$uint (flash:object)
    :swf-name "__AS3__.vec::Vector$uint"
    :constants
    ()
    :properties
    ((flash::fixed :SWF-NAME "fixed" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.fixed)
     (flash::length :SWF-NAME "length" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.length))
    :methods
    ((flash:splice :SWF-NAME "splice" :RETURN-TYPE "__AS3__.vec::Vector$uint"
      :ARGS (("start" "Number") ("deleteCount" "Number")) :STATIC NIL)
     (flash:filter :SWF-NAME "filter" :RETURN-TYPE "__AS3__.vec::Vector$uint"
      :ARGS (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:join :SWF-NAME "join" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("separator" "String") ",")) :STATIC NIL)
     (flash:to-locale-string :SWF-NAME "toLocaleString" :RETURN-TYPE "String"
      :ARGS NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:last-index-of :SWF-NAME "lastIndexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "uint") &OPTIONAL (("from" "Number") "2147483647")) :STATIC NIL)
     (flash:for-each :SWF-NAME "forEach" :RETURN-TYPE "void" :ARGS
      (("eacher" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:sort :SWF-NAME "sort" :RETURN-TYPE "__AS3__.vec::Vector$uint" :ARGS
      (("comparefn" "*")) :STATIC NIL)
     (flash:map :SWF-NAME "map" :RETURN-TYPE "*" :ARGS
      (("mapper" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:every :SWF-NAME "every" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:push :SWF-NAME "push" :RETURN-TYPE "uint" :ARGS NIL :STATIC NIL)
     (flash:some :SWF-NAME "some" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "*") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:concat :SWF-NAME "concat" :RETURN-TYPE "__AS3__.vec::Vector$uint"
      :ARGS NIL :STATIC NIL)
     (flash:slice :SWF-NAME "slice" :RETURN-TYPE "__AS3__.vec::Vector$uint"
      :ARGS
      (&OPTIONAL (("start" "Number") "2147483647") (("end" "Number") "0"))
      :STATIC NIL)
     (flash:pop :SWF-NAME "pop" :RETURN-TYPE "uint" :ARGS NIL :STATIC NIL)
     (flash:index-of :SWF-NAME "indexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "uint") &OPTIONAL (("from" "Number") "0")) :STATIC NIL)
     (flash:unshift :SWF-NAME "unshift" :RETURN-TYPE "uint" :ARGS NIL :STATIC
      NIL)
     (flash:reverse :SWF-NAME "reverse" :RETURN-TYPE "__AS3__.vec::Vector$uint"
      :ARGS NIL :STATIC NIL)
     (flash:shift :SWF-NAME "shift" :RETURN-TYPE "uint" :ARGS NIL :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash::%-as3--.vec.vector$double (flash:object)
    :swf-name "__AS3__.vec::Vector$double"
    :constants
    ()
    :properties
    ((flash::fixed :SWF-NAME "fixed" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.fixed)
     (flash::length :SWF-NAME "length" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.length))
    :methods
    ((flash:splice :SWF-NAME "splice" :RETURN-TYPE "__AS3__.vec::Vector$double"
      :ARGS (("start" "Number") ("deleteCount" "Number")) :STATIC NIL)
     (flash:filter :SWF-NAME "filter" :RETURN-TYPE "__AS3__.vec::Vector$double"
      :ARGS (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:join :SWF-NAME "join" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("separator" "String") ",")) :STATIC NIL)
     (flash:to-locale-string :SWF-NAME "toLocaleString" :RETURN-TYPE "String"
      :ARGS NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:last-index-of :SWF-NAME "lastIndexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "Number") &OPTIONAL (("from" "Number") "2147483647")) :STATIC
      NIL)
     (flash:for-each :SWF-NAME "forEach" :RETURN-TYPE "void" :ARGS
      (("eacher" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:sort :SWF-NAME "sort" :RETURN-TYPE "__AS3__.vec::Vector$double"
      :ARGS (("comparefn" "*")) :STATIC NIL)
     (flash:map :SWF-NAME "map" :RETURN-TYPE "*" :ARGS
      (("mapper" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:every :SWF-NAME "every" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "Function") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:push :SWF-NAME "push" :RETURN-TYPE "uint" :ARGS NIL :STATIC NIL)
     (flash:some :SWF-NAME "some" :RETURN-TYPE "Boolean" :ARGS
      (("checker" "*") &OPTIONAL ("thisObj" "Object")) :STATIC NIL)
     (flash:concat :SWF-NAME "concat" :RETURN-TYPE "__AS3__.vec::Vector$double"
      :ARGS NIL :STATIC NIL)
     (flash:slice :SWF-NAME "slice" :RETURN-TYPE "__AS3__.vec::Vector$double"
      :ARGS
      (&OPTIONAL (("start" "Number") "2147483647") (("end" "Number") "0"))
      :STATIC NIL)
     (flash:pop :SWF-NAME "pop" :RETURN-TYPE "Number" :ARGS NIL :STATIC NIL)
     (flash:index-of :SWF-NAME "indexOf" :RETURN-TYPE "Number" :ARGS
      (("value" "Number") &OPTIONAL (("from" "Number") "0")) :STATIC NIL)
     (flash:unshift :SWF-NAME "unshift" :RETURN-TYPE "uint" :ARGS NIL :STATIC
      NIL)
     (flash:reverse :SWF-NAME "reverse" :RETURN-TYPE
      "__AS3__.vec::Vector$double" :ARGS NIL :STATIC NIL)
     (flash:shift :SWF-NAME "shift" :RETURN-TYPE "Number" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.system (flash:object)
    :swf-name "flash.system::System"
    :constants
    ()
    :properties
    ((flash::vm-version :SWF-NAME "vmVersion" :TYPE "String" :STATIC T
      :ACCESSOR flash:.vm-version)
     (flash::total-memory :SWF-NAME "totalMemory" :TYPE "uint" :STATIC T
      :ACCESSOR flash:.total-memory)
     (flash::use-code-page :SWF-NAME "useCodePage" :TYPE "Boolean" :STATIC T
      :ACCESSOR flash:.use-code-page)
     (flash::ime :SWF-NAME "ime" :TYPE "flash.system::IME" :STATIC T :ACCESSOR
      flash:.ime))
    :methods
    ((flash::system.exit :SWF-NAME "exit" :RETURN-TYPE "void" :ARGS
      (("code" "uint")) :STATIC T)
     (flash::system.gc :SWF-NAME "gc" :RETURN-TYPE "void" :ARGS NIL :STATIC T)
     (flash::system.pause :SWF-NAME "pause" :RETURN-TYPE "void" :ARGS NIL
      :STATIC T)
     (flash::system.set-clipboard :SWF-NAME "setClipboard" :RETURN-TYPE "void"
      :ARGS (("string" "String")) :STATIC T)
     (flash::system.resume :SWF-NAME "resume" :RETURN-TYPE "void" :ARGS NIL
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.clear-samples "flash.sampler::clearSamples"
    NIL "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.get-size "flash.sampler::getSize"
    (("o" "*")) "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.start-sampling "flash.sampler::startSampling"
    NIL "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.get-sample-count "flash.sampler::getSampleCount"
    NIL "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.get-samples "flash.sampler::getSamples"
    NIL "Object")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.%get-invocation-count "flash.sampler::_getInvocationCount"
    (("obj" "Object") ("qname" "QName") ("type" "uint")) "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.is-getter-setter "flash.sampler::isGetterSetter"
    (("obj" "Object") ("qname" "QName")) "Boolean")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.get-setter-invocation-count "flash.sampler::getSetterInvocationCount"
    (("obj" "Object") ("qname" "QName")) "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.get-invocation-count "flash.sampler::getInvocationCount"
    (("obj" "Object") ("qname" "QName")) "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.get-getter-invocation-count "flash.sampler::getGetterInvocationCount"
    (("obj" "Object") ("qname" "QName")) "Number")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.get-member-names "flash.sampler::getMemberNames"
    (("o" "Object") &OPTIONAL (("instanceNames" "Boolean") "FALSE")) "Object")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.stop-sampling "flash.sampler::stopSampling"
    NIL "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.sampler.pause-sampling "flash.sampler::pauseSampling"
    NIL "void")
  (avm2-compiler::declare-swf-class flash::flash.sampler.stack-frame (flash:object)
    :swf-name "flash.sampler::StackFrame"
    :constants
    ((flash:+stack-frame.file+ :SWF-NAME "file" :TYPE "String" :VALUE "NIL"
      :STATIC NIL)
     (flash:+stack-frame.name+ :SWF-NAME "name" :TYPE "String" :VALUE "NIL"
      :STATIC NIL)
     (flash:+stack-frame.line+ :SWF-NAME "line" :TYPE "uint" :VALUE "NIL"
      :STATIC NIL))
    :properties
    ()
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash::flash.sampler.sample (flash:object)
    :swf-name "flash.sampler::Sample"
    :constants
    ((flash:+sample.time+ :SWF-NAME "time" :TYPE "Number" :VALUE "NIL" :STATIC
      NIL)
     (flash:+sample.stack+ :SWF-NAME "stack" :TYPE "Array" :VALUE "NIL" :STATIC
      NIL))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.sampler.new-object-sample (flash:flash.sampler.sample)
    :swf-name "flash.sampler::NewObjectSample"
    :constants
    ((flash:+new-object-sample.id+ :SWF-NAME "id" :TYPE "Number" :VALUE "NIL"
      :STATIC NIL)
     (flash:+new-object-sample.type+ :SWF-NAME "type" :TYPE "Class" :VALUE
      "NIL" :STATIC NIL))
    :properties
    ((flash::object :SWF-NAME "object" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.object))
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.sampler.delete-object-sample (flash:flash.sampler.sample)
    :swf-name "flash.sampler::DeleteObjectSample"
    :constants
    ((flash:+delete-object-sample.id+ :SWF-NAME "id" :TYPE "Number" :VALUE
      "NIL" :STATIC NIL)
     (flash:+delete-object-sample.size+ :SWF-NAME "size" :TYPE "Number" :VALUE
      "NIL" :STATIC NIL))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.event (flash:object)
    :swf-name "flash.events::Event"
    :constants
    ((flash:+event.select+ :SWF-NAME "SELECT" :TYPE "String" :VALUE "select"
      :STATIC T)
     (flash:+event.activate+ :SWF-NAME "ACTIVATE" :TYPE "String" :VALUE
      "activate" :STATIC T)
     (flash:+event.id3+ :SWF-NAME "ID3" :TYPE "String" :VALUE "id3" :STATIC T)
     (flash:+event.copy+ :SWF-NAME "COPY" :TYPE "String" :VALUE "copy" :STATIC
      T)
     (flash:+event.deactivate+ :SWF-NAME "DEACTIVATE" :TYPE "String" :VALUE
      "deactivate" :STATIC T)
     (flash:+event.paste+ :SWF-NAME "PASTE" :TYPE "String" :VALUE "paste"
      :STATIC T)
     (flash:+event.tab-index-change+ :SWF-NAME "TAB_INDEX_CHANGE" :TYPE
      "String" :VALUE "tabIndexChange" :STATIC T)
     (flash:+event.exit-frame+ :SWF-NAME "EXIT_FRAME" :TYPE "String" :VALUE
      "exitFrame" :STATIC T)
     (flash:+event.removed-from-stage+ :SWF-NAME "REMOVED_FROM_STAGE" :TYPE
      "String" :VALUE "removedFromStage" :STATIC T)
     (flash:+event.added+ :SWF-NAME "ADDED" :TYPE "String" :VALUE "added"
      :STATIC T)
     (flash:+event.mouse-leave+ :SWF-NAME "MOUSE_LEAVE" :TYPE "String" :VALUE
      "mouseLeave" :STATIC T)
     (flash:+event.close+ :SWF-NAME "CLOSE" :TYPE "String" :VALUE "close"
      :STATIC T)
     (flash:+event.open+ :SWF-NAME "OPEN" :TYPE "String" :VALUE "open" :STATIC
      T)
     (flash:+event.scroll+ :SWF-NAME "SCROLL" :TYPE "String" :VALUE "scroll"
      :STATIC T)
     (flash:+event.connect+ :SWF-NAME "CONNECT" :TYPE "String" :VALUE "connect"
      :STATIC T)
     (flash:+event.removed+ :SWF-NAME "REMOVED" :TYPE "String" :VALUE "removed"
      :STATIC T)
     (flash:+event.select-all+ :SWF-NAME "SELECT_ALL" :TYPE "String" :VALUE
      "selectAll" :STATIC T)
     (flash:+event.fullscreen+ :SWF-NAME "FULLSCREEN" :TYPE "String" :VALUE
      "fullScreen" :STATIC T)
     (flash:+event.complete+ :SWF-NAME "COMPLETE" :TYPE "String" :VALUE
      "complete" :STATIC T)
     (flash:+event.resize+ :SWF-NAME "RESIZE" :TYPE "String" :VALUE "resize"
      :STATIC T)
     (flash:+event.change+ :SWF-NAME "CHANGE" :TYPE "String" :VALUE "change"
      :STATIC T)
     (flash:+event.clear+ :SWF-NAME "CLEAR" :TYPE "String" :VALUE "clear"
      :STATIC T)
     (flash:+event.cut+ :SWF-NAME "CUT" :TYPE "String" :VALUE "cut" :STATIC T)
     (flash:+event.tab-children-change+ :SWF-NAME "TAB_CHILDREN_CHANGE" :TYPE
      "String" :VALUE "tabChildrenChange" :STATIC T)
     (flash:+event.frame-constructed+ :SWF-NAME "FRAME_CONSTRUCTED" :TYPE
      "String" :VALUE "frameConstructed" :STATIC T)
     (flash:+event.added-to-stage+ :SWF-NAME "ADDED_TO_STAGE" :TYPE "String"
      :VALUE "addedToStage" :STATIC T)
     (flash:+event.tab-enabled-change+ :SWF-NAME "TAB_ENABLED_CHANGE" :TYPE
      "String" :VALUE "tabEnabledChange" :STATIC T)
     (flash:+event.render+ :SWF-NAME "RENDER" :TYPE "String" :VALUE "render"
      :STATIC T)
     (flash:+event.init+ :SWF-NAME "INIT" :TYPE "String" :VALUE "init" :STATIC
      T)
     (flash:+event.unload+ :SWF-NAME "UNLOAD" :TYPE "String" :VALUE "unload"
      :STATIC T)
     (flash:+event.sound-complete+ :SWF-NAME "SOUND_COMPLETE" :TYPE "String"
      :VALUE "soundComplete" :STATIC T)
     (flash:+event.enter-frame+ :SWF-NAME "ENTER_FRAME" :TYPE "String" :VALUE
      "enterFrame" :STATIC T)
     (flash:+event.cancel+ :SWF-NAME "CANCEL" :TYPE "String" :VALUE "cancel"
      :STATIC T))
    :properties
    ((flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::current-target :SWF-NAME "currentTarget" :TYPE "Object" :STATIC
      NIL :ACCESSOR flash:.current-target)
     (flash::cancelable :SWF-NAME "cancelable" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.cancelable)
     (flash::target :SWF-NAME "target" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.target)
     (flash::bubbles :SWF-NAME "bubbles" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.bubbles)
     (flash::event-phase :SWF-NAME "eventPhase" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.event-phase))
    :methods
    ((flash:stop-immediate-propagation :SWF-NAME "stopImmediatePropagation"
      :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:stop-propagation :SWF-NAME "stopPropagation" :RETURN-TYPE "void"
      :ARGS NIL :STATIC NIL)
     (flash:prevent-default :SWF-NAME "preventDefault" :RETURN-TYPE "void"
      :ARGS NIL :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:format-to-string :SWF-NAME "formatToString" :RETURN-TYPE "String"
      :ARGS (("className" "String")) :STATIC NIL)
     (flash:is-default-prevented :SWF-NAME "isDefaultPrevented" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.text-event (flash:flash.events.event)
    :swf-name "flash.events::TextEvent"
    :constants
    ((flash:+text-event.link+ :SWF-NAME "LINK" :TYPE "String" :VALUE "link"
      :STATIC T)
     (flash:+text-event.text-input+ :SWF-NAME "TEXT_INPUT" :TYPE "String"
      :VALUE "textInput" :STATIC T))
    :properties
    ((flash::text :SWF-NAME "text" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.text))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.error-event (flash:flash.events.text-event)
    :swf-name "flash.events::ErrorEvent"
    :constants
    ((flash:+error-event.error+ :SWF-NAME "ERROR" :TYPE "String" :VALUE "error"
      :STATIC T))
    :properties
    ()
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.async-error-event (flash:flash.events.error-event)
    :swf-name "flash.events::AsyncErrorEvent"
    :constants
    ((flash:+async-error-event.async-error+ :SWF-NAME "ASYNC_ERROR" :TYPE
      "String" :VALUE "asyncError" :STATIC T))
    :properties
    ((flash::error :SWF-NAME "error" :TYPE "Error" :STATIC NIL :ACCESSOR
      flash:.error))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.i-data-output ()
    :swf-name "flash.utils::IDataOutput"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.i-data-input ()
    :swf-name "flash.utils::IDataInput"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.byte-array (flash:object)
    :swf-name "flash.utils::ByteArray"
    :constants
    ()
    :properties
    ((flash::length :SWF-NAME "length" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.length)
     (flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding)
     (flash::position :SWF-NAME "position" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.position)
     (flash::bytes-available :SWF-NAME "bytesAvailable" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.bytes-available)
     (flash::endian :SWF-NAME "endian" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.endian)
     (flash::default-object-encoding :SWF-NAME "defaultObjectEncoding" :TYPE
      "uint" :STATIC T :ACCESSOR flash:.default-object-encoding))
    :methods
    ((flash:write-object :SWF-NAME "writeObject" :RETURN-TYPE "void" :ARGS
      (("object" "*")) :STATIC NIL)
     (flash:read-bytes :SWF-NAME "readBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL (("offset" "uint") "0")
       (("length" "uint") "0"))
      :STATIC NIL)
     (flash:uncompress :SWF-NAME "uncompress" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:read-multi-byte :SWF-NAME "readMultiByte" :RETURN-TYPE "String"
      :ARGS (("length" "uint") ("charSet" "String")) :STATIC NIL)
     (flash:read-int :SWF-NAME "readInt" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:read-float :SWF-NAME "readFloat" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:compress :SWF-NAME "compress" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash:write-short :SWF-NAME "writeShort" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:write-unsigned-int :SWF-NAME "writeUnsignedInt" :RETURN-TYPE "void"
      :ARGS (("value" "uint")) :STATIC NIL)
     (flash:read-unsigned-byte :SWF-NAME "readUnsignedByte" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)
     (flash:write-boolean :SWF-NAME "writeBoolean" :RETURN-TYPE "void" :ARGS
      (("value" "Boolean")) :STATIC NIL)
     (flash:write-utf :SWF-NAME "writeUTF" :RETURN-TYPE "void" :ARGS
      (("value" "String")) :STATIC NIL)
     (flash:clear :SWF-NAME "clear" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:write-bytes :SWF-NAME "writeBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL (("offset" "uint") "0")
       (("length" "uint") "0"))
      :STATIC NIL)
     (flash:read-byte :SWF-NAME "readByte" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:read-unsigned-int :SWF-NAME "readUnsignedInt" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)
     (flash:write-multi-byte :SWF-NAME "writeMultiByte" :RETURN-TYPE "void"
      :ARGS (("value" "String") ("charSet" "String")) :STATIC NIL)
     (flash:write-float :SWF-NAME "writeFloat" :RETURN-TYPE "void" :ARGS
      (("value" "Number")) :STATIC NIL)
     (flash:read-utf-bytes :SWF-NAME "readUTFBytes" :RETURN-TYPE "String" :ARGS
      (("length" "uint")) :STATIC NIL)
     (flash:read-utf :SWF-NAME "readUTF" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:inflate :SWF-NAME "inflate" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash:read-boolean :SWF-NAME "readBoolean" :RETURN-TYPE "Boolean" :ARGS
      NIL :STATIC NIL)
     (flash:deflate :SWF-NAME "deflate" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash:read-object :SWF-NAME "readObject" :RETURN-TYPE "*" :ARGS NIL
      :STATIC NIL)
     (flash:write-int :SWF-NAME "writeInt" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:read-double :SWF-NAME "readDouble" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:read-unsigned-short :SWF-NAME "readUnsignedShort" :RETURN-TYPE
      "uint" :ARGS NIL :STATIC NIL)
     (flash:write-double :SWF-NAME "writeDouble" :RETURN-TYPE "void" :ARGS
      (("value" "Number")) :STATIC NIL)
     (flash:write-byte :SWF-NAME "writeByte" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:read-short :SWF-NAME "readShort" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:write-utf-bytes :SWF-NAME "writeUTFBytes" :RETURN-TYPE "void" :ARGS
      (("value" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash:error (flash:object)
    :swf-name "Error"
    :constants
    ((flash:+error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC T))
    :properties
    ((flash::name :SWF-NAME "name" :TYPE "*" :STATIC NIL :ACCESSOR flash:.name)
     (flash::message :SWF-NAME "message" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.message)
     (flash::error-id :SWF-NAME "errorID" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.error-id)
     (flash::%error-id :SWF-NAME "Error::_errorID" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.%error-id))
    :methods
    ((flash:get-stack-trace :SWF-NAME "getStackTrace" :RETURN-TYPE "String"
      :ARGS NIL :STATIC NIL)
     (flash::error.get-error-message :SWF-NAME "getErrorMessage" :RETURN-TYPE
      "String" :ARGS (("index" "int")) :STATIC T)
     (flash::error.throw-error :SWF-NAME "throwError" :RETURN-TYPE "*" :ARGS
      (("type" "Class") ("index" "uint")) :STATIC T)))
  (avm2-compiler::declare-swf-class flash:definition-error (flash:error)
    :swf-name "DefinitionError"
    :constants
    ((flash:+definition-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:eval-error (flash:error)
    :swf-name "EvalError"
    :constants
    ((flash:+eval-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:range-error (flash:error)
    :swf-name "RangeError"
    :constants
    ((flash:+range-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:reference-error (flash:error)
    :swf-name "ReferenceError"
    :constants
    ((flash:+reference-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:security-error (flash:error)
    :swf-name "SecurityError"
    :constants
    ((flash:+security-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:syntax-error (flash:error)
    :swf-name "SyntaxError"
    :constants
    ((flash:+syntax-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:type-error (flash:error)
    :swf-name "TypeError"
    :constants
    ((flash:+type-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:uri-error (flash:error)
    :swf-name "URIError"
    :constants
    ((flash:+uri-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:verify-error (flash:error)
    :swf-name "VerifyError"
    :constants
    ((flash:+verify-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:uninitialized-error (flash:error)
    :swf-name "UninitializedError"
    :constants
    ((flash:+uninitialized-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE
      "1" :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash:argument-error (flash:error)
    :swf-name "ArgumentError"
    :constants
    ((flash:+argument-error.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shader-precision (flash:object)
    :swf-name "flash.display::ShaderPrecision"
    :constants
    ((flash:+shader-precision.full+ :SWF-NAME "FULL" :TYPE "String" :VALUE
      "full" :STATIC T)
     (flash:+shader-precision.fast+ :SWF-NAME "FAST" :TYPE "String" :VALUE
      "fast" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash:math (flash:object)
    :swf-name "Math"
    :constants
    ((flash:+math.pi+ :SWF-NAME "PI" :TYPE "Number" :VALUE
      "3.141592653589793d0" :STATIC T)
     (flash:+math.log2-e+ :SWF-NAME "LOG2E" :TYPE "Number" :VALUE
      "1.4426950408889634d0" :STATIC T)
     (flash:+math.ln2+ :SWF-NAME "LN2" :TYPE "Number" :VALUE
      "0.6931471805599453d0" :STATIC T)
     (flash:+math.log10-e+ :SWF-NAME "LOG10E" :TYPE "Number" :VALUE
      "0.4342944819032518d0" :STATIC T)
     (flash:+math.ln10+ :SWF-NAME "LN10" :TYPE "Number" :VALUE
      "2.302585092994046d0" :STATIC T)
     (flash:+math.sqrt2+ :SWF-NAME "SQRT2" :TYPE "Number" :VALUE
      "1.4142135623730951d0" :STATIC T)
     (flash:+math.sqrt1-2+ :SWF-NAME "SQRT1_2" :TYPE "Number" :VALUE
      "0.7071067811865476d0" :STATIC T)
     (flash:+math.e+ :SWF-NAME "E" :TYPE "Number" :VALUE "2.718281828459045d0"
      :STATIC T))
    :properties
    ()
    :methods
    ((flash::math.sqrt :SWF-NAME "sqrt" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.max :SWF-NAME "max" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("x" "Number") "UNDEFINED") (("y" "Number") "UNDEFINED"))
      :STATIC T)
     (flash::math.min :SWF-NAME "min" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("x" "Number") "UNDEFINED") (("y" "Number") "UNDEFINED"))
      :STATIC T)
     (flash::math.tan :SWF-NAME "tan" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.atan :SWF-NAME "atan" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.%max :SWF-NAME "Math::_max" :RETURN-TYPE "Number" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC T)
     (flash::math.pow :SWF-NAME "pow" :RETURN-TYPE "Number" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC T)
     (flash::math.exp :SWF-NAME "exp" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.log :SWF-NAME "log" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.floor :SWF-NAME "floor" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.atan2 :SWF-NAME "atan2" :RETURN-TYPE "Number" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC T)
     (flash::math.sin :SWF-NAME "sin" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.asin :SWF-NAME "asin" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.%min :SWF-NAME "Math::_min" :RETURN-TYPE "Number" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC T)
     (flash::math.round :SWF-NAME "round" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.ceil :SWF-NAME "ceil" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.cos :SWF-NAME "cos" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.acos :SWF-NAME "acos" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)
     (flash::math.random :SWF-NAME "random" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC T)
     (flash::math.abs :SWF-NAME "abs" :RETURN-TYPE "Number" :ARGS
      (("x" "Number")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash:reg-exp (flash:object)
    :swf-name "RegExp"
    :constants
    ((flash:+reg-exp.length+ :SWF-NAME "length" :TYPE "int" :VALUE "1" :STATIC
      T))
    :properties
    ((flash::dotall :SWF-NAME "dotall" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.dotall)
     (flash::multiline :SWF-NAME "multiline" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.multiline)
     (flash::last-index :SWF-NAME "lastIndex" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.last-index)
     (flash::source :SWF-NAME "source" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.source)
     (flash::extended :SWF-NAME "extended" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.extended)
     (flash::global :SWF-NAME "global" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.global)
     (flash::ignore-case :SWF-NAME "ignoreCase" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.ignore-case))
    :methods
    ((flash:test :SWF-NAME "test" :RETURN-TYPE "Boolean" :ARGS
      (&OPTIONAL (("s" "String") "")) :STATIC NIL)
     (flash:exec :SWF-NAME "exec" :RETURN-TYPE "*" :ARGS
      (&OPTIONAL (("s" "String") "")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.i-event-dispatcher ()
    :swf-name "flash.events::IEventDispatcher"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.weak-method-closure (flash:object)
    :swf-name "flash.events::WeakMethodClosure"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.events.weak-function-closure (flash:object)
    :swf-name "flash.events::WeakFunctionClosure"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.events.event-dispatcher (flash:object)
    :swf-name "flash.events::EventDispatcher"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:add-event-listener :SWF-NAME "addEventListener" :RETURN-TYPE "void"
      :ARGS
      (("type" "String") ("listener" "Function") &OPTIONAL
       (("useCapture" "Boolean") "FALSE") (("priority" "int") "0")
       (("useWeakReference" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:has-event-listener :SWF-NAME "hasEventListener" :RETURN-TYPE
      "Boolean" :ARGS (("type" "String")) :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:remove-event-listener :SWF-NAME "removeEventListener" :RETURN-TYPE
      "void" :ARGS
      (("type" "String") ("listener" "Function") &OPTIONAL
       (("useCapture" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:will-trigger :SWF-NAME "willTrigger" :RETURN-TYPE "Boolean" :ARGS
      (("type" "String")) :STATIC NIL)
     (flash:dispatch-event :SWF-NAME "dispatchEvent" :RETURN-TYPE "Boolean"
      :ARGS (("event" "flash.events::Event")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.context-menu-item (flash:flash.events.event-dispatcher)
    :swf-name "flash.ui::ContextMenuItem"
    :constants
    ()
    :properties
    ((flash::visible :SWF-NAME "visible" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.visible)
     (flash::caption :SWF-NAME "caption" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.caption)
     (flash::separator-before :SWF-NAME "separatorBefore" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.separator-before)
     (flash::enabled :SWF-NAME "enabled" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.enabled))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.ui::ContextMenuItem"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.application-domain (flash:object)
    :swf-name "flash.system::ApplicationDomain"
    :constants
    ()
    :properties
    ((flash::parent-domain :SWF-NAME "parentDomain" :TYPE
      "flash.system::ApplicationDomain" :STATIC NIL :ACCESSOR
      flash:.parent-domain)
     (flash::domain-memory :SWF-NAME "domainMemory" :TYPE
      "flash.utils::ByteArray" :STATIC NIL :ACCESSOR flash:.domain-memory)
     (flash::min-domain-memory-length :SWF-NAME "MIN_DOMAIN_MEMORY_LENGTH"
      :TYPE "uint" :STATIC T :ACCESSOR flash:.min-domain-memory-length)
     (flash::current-domain :SWF-NAME "currentDomain" :TYPE
      "flash.system::ApplicationDomain" :STATIC T :ACCESSOR
      flash:.current-domain))
    :methods
    ((flash:has-definition :SWF-NAME "hasDefinition" :RETURN-TYPE "Boolean"
      :ARGS (("name" "String")) :STATIC NIL)
     (flash:get-definition :SWF-NAME "getDefinition" :RETURN-TYPE "Object"
      :ARGS (("name" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.content-element (flash:object)
    :swf-name "flash.text.engine::ContentElement"
    :constants
    ((flash:+content-element.graphic-element+ :SWF-NAME "GRAPHIC_ELEMENT" :TYPE
      "uint" :VALUE "65007" :STATIC T))
    :properties
    ((flash::group-element :SWF-NAME "groupElement" :TYPE
      "flash.text.engine::GroupElement" :STATIC NIL :ACCESSOR
      flash:.group-element)
     (flash::raw-text :SWF-NAME "rawText" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.raw-text)
     (flash::event-mirror :SWF-NAME "eventMirror" :TYPE
      "flash.events::EventDispatcher" :STATIC NIL :ACCESSOR flash:.event-mirror)
     (flash::user-data :SWF-NAME "userData" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.user-data)
     (flash::element-format :SWF-NAME "elementFormat" :TYPE
      "flash.text.engine::ElementFormat" :STATIC NIL :ACCESSOR
      flash:.element-format)
     (flash::text :SWF-NAME "text" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.text)
     (flash::text-rotation :SWF-NAME "textRotation" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.text-rotation)
     (flash::text-block-begin-index :SWF-NAME "textBlockBeginIndex" :TYPE "int"
      :STATIC NIL :ACCESSOR flash:.text-block-begin-index)
     (flash::text-block :SWF-NAME "textBlock" :TYPE
      "flash.text.engine::TextBlock" :STATIC NIL :ACCESSOR flash:.text-block))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.scene (flash:object)
    :swf-name "flash.display::Scene"
    :constants
    ()
    :properties
    ((flash::labels :SWF-NAME "labels" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.labels)
     (flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name)
     (flash::num-frames :SWF-NAME "numFrames" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.num-frames))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.printing.print-job (flash:flash.events.event-dispatcher)
    :swf-name "flash.printing::PrintJob"
    :constants
    ()
    :properties
    ((flash::paper-width :SWF-NAME "paperWidth" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.paper-width)
     (flash::page-width :SWF-NAME "pageWidth" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.page-width)
     (flash::page-height :SWF-NAME "pageHeight" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.page-height)
     (flash::paper-height :SWF-NAME "paperHeight" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.paper-height)
     (flash::orientation :SWF-NAME "orientation" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.orientation))
    :methods
    ((flash:send :SWF-NAME "send" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:add-page :SWF-NAME "addPage" :RETURN-TYPE "void" :ARGS
      (("sprite" "flash.display::Sprite") &OPTIONAL
       (("printArea" "flash.geom::Rectangle") "0")
       ("options" "flash.printing::PrintJobOptions") ("frameNum" "int"))
      :STATIC NIL)
     (flash:start :SWF-NAME "start" :RETURN-TYPE "Boolean" :ARGS NIL :STATIC
      NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.i-graphics-path ()
    :swf-name "flash.display::IGraphicsPath"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.i-graphics-data ()
    :swf-name "flash.display::IGraphicsData"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-path (flash:object)
    :swf-name "flash.display::GraphicsPath"
    :constants
    ()
    :properties
    ((flash::winding :SWF-NAME "winding" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.winding)
     (flash::data :SWF-NAME "data" :TYPE "__AS3__.vec::Vector<Number>" :STATIC
      NIL :ACCESSOR flash:.data)
     (flash::commands :SWF-NAME "commands" :TYPE "__AS3__.vec::Vector<int>"
      :STATIC NIL :ACCESSOR flash:.commands))
    :methods
    ((flash:wide-move-to :SWF-NAME "wideMoveTo" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:curve-to :SWF-NAME "curveTo" :RETURN-TYPE "void" :ARGS
      (("controlX" "Number") ("controlY" "Number") ("anchorX" "Number")
       ("anchorY" "Number"))
      :STATIC NIL)
     (flash:line-to :SWF-NAME "lineTo" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:move-to :SWF-NAME "moveTo" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:wide-line-to :SWF-NAME "wideLineTo" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.matrix (flash:object)
    :swf-name "flash.geom::Matrix"
    :constants
    ()
    :properties
    ((flash::tx :SWF-NAME "tx" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.tx)
     (flash::d :SWF-NAME "d" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.d)
     (flash::b :SWF-NAME "b" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.b)
     (flash::ty :SWF-NAME "ty" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.ty)
     (flash::c :SWF-NAME "c" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.c)
     (flash::a :SWF-NAME "a" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.a))
    :methods
    ((flash:create-gradient-box :SWF-NAME "createGradientBox" :RETURN-TYPE
      "void" :ARGS
      (("width" "Number") ("height" "Number") &OPTIONAL
       (("rotation" "Number") "0") (("tx" "Number") "0") (("ty" "Number") "0"))
      :STATIC NIL)
     (flash:identity :SWF-NAME "identity" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.geom::Matrix" :ARGS NIL
      :STATIC NIL)
     (flash:delta-transform-point :SWF-NAME "deltaTransformPoint" :RETURN-TYPE
      "flash.geom::Point" :ARGS (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:rotate :SWF-NAME "rotate" :RETURN-TYPE "void" :ARGS
      (("angle" "Number")) :STATIC NIL)
     (flash:transform-point :SWF-NAME "transformPoint" :RETURN-TYPE
      "flash.geom::Point" :ARGS (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:invert :SWF-NAME "invert" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:concat :SWF-NAME "concat" :RETURN-TYPE "void" :ARGS
      (("m" "flash.geom::Matrix")) :STATIC NIL)
     (flash:scale :SWF-NAME "scale" :RETURN-TYPE "void" :ARGS
      (("sx" "Number") ("sy" "Number")) :STATIC NIL)
     (flash:translate :SWF-NAME "translate" :RETURN-TYPE "void" :ARGS
      (("dx" "Number") ("dy" "Number")) :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:create-box :SWF-NAME "createBox" :RETURN-TYPE "void" :ARGS
      (("scaleX" "Number") ("scaleY" "Number") &OPTIONAL
       (("rotation" "Number") "0") (("tx" "Number") "0") (("ty" "Number") "0"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-justifier (flash:object)
    :swf-name "flash.text.engine::TextJustifier"
    :constants
    ()
    :properties
    ((flash::line-justification :SWF-NAME "lineJustification" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.line-justification)
     (flash::locale :SWF-NAME "locale" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.locale))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE
      "flash.text.engine::TextJustifier" :ARGS NIL :STATIC NIL)
     (flash::text-justifier.get-justifier-for-locale :SWF-NAME
      "getJustifierForLocale" :RETURN-TYPE "flash.text.engine::TextJustifier"
      :ARGS (("locale" "String")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.space-justifier (flash:flash.text.engine.text-justifier)
    :swf-name "flash.text.engine::SpaceJustifier"
    :constants
    ()
    :properties
    ((flash::letter-spacing :SWF-NAME "letterSpacing" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.letter-spacing))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE
      "flash.text.engine::TextJustifier" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.i-bitmap-drawable ()
    :swf-name "flash.display::IBitmapDrawable"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.display-object (flash:flash.events.event-dispatcher)
    :swf-name "flash.display::DisplayObject"
    :constants
    ()
    :properties
    ((flash::stage :SWF-NAME "stage" :TYPE "flash.display::Stage" :STATIC NIL
      :ACCESSOR flash:.stage)
     (flash::filters :SWF-NAME "filters" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.filters)
     (flash::z :SWF-NAME "z" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.z)
     (flash::y :SWF-NAME "y" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.y)
     (flash::x :SWF-NAME "x" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.x)
     (flash::transform :SWF-NAME "transform" :TYPE "flash.geom::Transform"
      :STATIC NIL :ACCESSOR flash:.transform)
     (flash::mask :SWF-NAME "mask" :TYPE "flash.display::DisplayObject" :STATIC
      NIL :ACCESSOR flash:.mask)
     (flash::root :SWF-NAME "root" :TYPE "flash.display::DisplayObject" :STATIC
      NIL :ACCESSOR flash:.root)
     (flash::loader-info :SWF-NAME "loaderInfo" :TYPE
      "flash.display::LoaderInfo" :STATIC NIL :ACCESSOR flash:.loader-info)
     (flash::alpha :SWF-NAME "alpha" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.alpha)
     (flash::mouse-y :SWF-NAME "mouseY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.mouse-y)
     (flash::mouse-x :SWF-NAME "mouseX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.mouse-x)
     (flash::scroll-rect :SWF-NAME "scrollRect" :TYPE "flash.geom::Rectangle"
      :STATIC NIL :ACCESSOR flash:.scroll-rect)
     (flash::scale-z :SWF-NAME "scaleZ" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.scale-z)
     (flash::scale-y :SWF-NAME "scaleY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.scale-y)
     (flash::scale-x :SWF-NAME "scaleX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.scale-x)
     (flash::width :SWF-NAME "width" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::cache-as-bitmap :SWF-NAME "cacheAsBitmap" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.cache-as-bitmap)
     (flash::parent :SWF-NAME "parent" :TYPE
      "flash.display::DisplayObjectContainer" :STATIC NIL :ACCESSOR
      flash:.parent)
     (flash::opaque-background :SWF-NAME "opaqueBackground" :TYPE "Object"
      :STATIC NIL :ACCESSOR flash:.opaque-background)
     (flash::height :SWF-NAME "height" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::rotation-z :SWF-NAME "rotationZ" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.rotation-z)
     (flash::accessibility-properties :SWF-NAME "accessibilityProperties" :TYPE
      "flash.accessibility::AccessibilityProperties" :STATIC NIL :ACCESSOR
      flash:.accessibility-properties)
     (flash::rotation-y :SWF-NAME "rotationY" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.rotation-y)
     (flash::rotation-x :SWF-NAME "rotationX" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.rotation-x)
     (flash::scale9-grid :SWF-NAME "scale9Grid" :TYPE "flash.geom::Rectangle"
      :STATIC NIL :ACCESSOR flash:.scale9-grid)
     (flash::blend-mode :SWF-NAME "blendMode" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.blend-mode)
     (flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name)
     (flash::rotation :SWF-NAME "rotation" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.rotation)
     (flash::visible :SWF-NAME "visible" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.visible))
    :methods
    ((flash:hit-test-object :SWF-NAME "hitTestObject" :RETURN-TYPE "Boolean"
      :ARGS (("obj" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:get-rect :SWF-NAME "getRect" :RETURN-TYPE "flash.geom::Rectangle"
      :ARGS (("targetCoordinateSpace" "flash.display::DisplayObject")) :STATIC
      NIL)
     (flash:hit-test-point :SWF-NAME "hitTestPoint" :RETURN-TYPE "Boolean"
      :ARGS
      (("x" "Number") ("y" "Number") &OPTIONAL
       (("shapeFlag" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:global-to-local3-d :SWF-NAME "globalToLocal3D" :RETURN-TYPE
      "flash.geom::Vector3D" :ARGS (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:local3-d-to-global :SWF-NAME "local3DToGlobal" :RETURN-TYPE
      "flash.geom::Point" :ARGS (("point3d" "flash.geom::Vector3D")) :STATIC
      NIL)
     (flash:get-bounds :SWF-NAME "getBounds" :RETURN-TYPE
      "flash.geom::Rectangle" :ARGS
      (("targetCoordinateSpace" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:global-to-local :SWF-NAME "globalToLocal" :RETURN-TYPE
      "flash.geom::Point" :ARGS (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:local-to-global :SWF-NAME "localToGlobal" :RETURN-TYPE
      "flash.geom::Point" :ARGS (("point" "flash.geom::Point")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.bitmap (flash:flash.display.display-object)
    :swf-name "flash.display::Bitmap"
    :constants
    ()
    :properties
    ((flash::smoothing :SWF-NAME "smoothing" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.smoothing)
     (flash::bitmap-data :SWF-NAME "bitmapData" :TYPE
      "flash.display::BitmapData" :STATIC NIL :ACCESSOR flash:.bitmap-data)
     (flash::pixel-snapping :SWF-NAME "pixelSnapping" :TYPE "String" :STATIC
      NIL :ACCESSOR flash:.pixel-snapping))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.xml.xml-node (flash:object)
    :swf-name "flash.xml::XMLNode"
    :constants
    ()
    :properties
    ((flash::local-name :SWF-NAME "localName" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.local-name)
     (flash::child-nodes :SWF-NAME "childNodes" :TYPE "Array" :STATIC NIL
      :ACCESSOR flash:.child-nodes)
     (flash::node-name :SWF-NAME "nodeName" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.node-name)
     (flash::last-child :SWF-NAME "lastChild" :TYPE "flash.xml::XMLNode"
      :STATIC NIL :ACCESSOR flash:.last-child)
     (flash::node-type :SWF-NAME "nodeType" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.node-type)
     (flash::attributes :SWF-NAME "attributes" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.attributes)
     (flash::node-value :SWF-NAME "nodeValue" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.node-value)
     (flash::first-child :SWF-NAME "firstChild" :TYPE "flash.xml::XMLNode"
      :STATIC NIL :ACCESSOR flash:.first-child)
     (flash::prefix :SWF-NAME "prefix" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.prefix)
     (flash::namespace-uri :SWF-NAME "namespaceURI" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.namespace-uri)
     (flash::next-sibling :SWF-NAME "nextSibling" :TYPE "flash.xml::XMLNode"
      :STATIC NIL :ACCESSOR flash:.next-sibling)
     (flash::parent-node :SWF-NAME "parentNode" :TYPE "flash.xml::XMLNode"
      :STATIC NIL :ACCESSOR flash:.parent-node)
     (flash::previous-sibling :SWF-NAME "previousSibling" :TYPE
      "flash.xml::XMLNode" :STATIC NIL :ACCESSOR flash:.previous-sibling))
    :methods
    ((flash:clone-node :SWF-NAME "cloneNode" :RETURN-TYPE "flash.xml::XMLNode"
      :ARGS (("deep" "Boolean")) :STATIC NIL)
     (flash:remove-node :SWF-NAME "removeNode" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:get-prefix-for-namespace :SWF-NAME "getPrefixForNamespace"
      :RETURN-TYPE "String" :ARGS (("ns" "String")) :STATIC NIL)
     (flash:has-child-nodes :SWF-NAME "hasChildNodes" :RETURN-TYPE "Boolean"
      :ARGS NIL :STATIC NIL)
     (flash:get-namespace-for-prefix :SWF-NAME "getNamespaceForPrefix"
      :RETURN-TYPE "String" :ARGS (("prefix" "String")) :STATIC NIL)
     (flash:insert-before :SWF-NAME "insertBefore" :RETURN-TYPE "void" :ARGS
      (("node" "flash.xml::XMLNode") ("before" "flash.xml::XMLNode")) :STATIC
      NIL)
     (flash:append-child :SWF-NAME "appendChild" :RETURN-TYPE "void" :ARGS
      (("node" "flash.xml::XMLNode")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.xml.xml-document (flash:flash.xml.xml-node)
    :swf-name "flash.xml::XMLDocument"
    :constants
    ()
    :properties
    ((flash::doc-type-decl :SWF-NAME "docTypeDecl" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.doc-type-decl)
     (flash::ignore-white :SWF-NAME "ignoreWhite" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.ignore-white)
     (flash::xml-decl :SWF-NAME "xmlDecl" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.xml-decl)
     (flash::id-map :SWF-NAME "idMap" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.id-map))
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:create-text-node :SWF-NAME "createTextNode" :RETURN-TYPE
      "flash.xml::XMLNode" :ARGS (("text" "String")) :STATIC NIL)
     (flash:parse-xml :SWF-NAME "parseXML" :RETURN-TYPE "void" :ARGS
      (("source" "String")) :STATIC NIL)
     (flash:create-element :SWF-NAME "createElement" :RETURN-TYPE
      "flash.xml::XMLNode" :ARGS (("name" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.east-asian-justifier (flash:flash.text.engine.text-justifier)
    :swf-name "flash.text.engine::EastAsianJustifier"
    :constants
    ()
    :properties
    ((flash::justification-style :SWF-NAME "justificationStyle" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.justification-style))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE
      "flash.text.engine::TextJustifier" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-renderer (flash:object)
    :swf-name "flash.text::TextRenderer"
    :constants
    ()
    :properties
    ((flash::anti-alias-type :SWF-NAME "antiAliasType" :TYPE "String" :STATIC T
      :ACCESSOR flash:.anti-alias-type)
     (flash::max-level :SWF-NAME "maxLevel" :TYPE "int" :STATIC T :ACCESSOR
      flash:.max-level)
     (flash::display-mode :SWF-NAME "displayMode" :TYPE "String" :STATIC T
      :ACCESSOR flash:.display-mode))
    :methods
    ((flash::text-renderer.set-advanced-anti-aliasing-table :SWF-NAME
      "setAdvancedAntiAliasingTable" :RETURN-TYPE "void" :ARGS
      (("fontName" "String") ("fontStyle" "String") ("colorType" "String")
       ("advancedAntiAliasingTable" "Array"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:is-xml-name "isXMLName"
    (&OPTIONAL (("str" "*") "UNDEFINED")) "Boolean")
  (avm2-compiler::declare-swf-class flash:xml (flash:object)
    :swf-name "XML"
    :constants
    ((flash:+xml.length+ :SWF-NAME "length" :TYPE "*" :VALUE "1" :STATIC T))
    :properties
    ((flash::ignore-whitespace :SWF-NAME "ignoreWhitespace" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.ignore-whitespace)
     (flash::pretty-printing :SWF-NAME "prettyPrinting" :TYPE "Boolean" :STATIC
      T :ACCESSOR flash:.pretty-printing)
     (flash::ignore-processing-instructions :SWF-NAME
      "ignoreProcessingInstructions" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.ignore-processing-instructions)
     (flash::pretty-indent :SWF-NAME "prettyIndent" :TYPE "int" :STATIC T
      :ACCESSOR flash:.pretty-indent)
     (flash::ignore-comments :SWF-NAME "ignoreComments" :TYPE "Boolean" :STATIC
      T :ACCESSOR flash:.ignore-comments))
    :methods
    ((flash:children :SWF-NAME "children" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:remove-namespace :SWF-NAME "removeNamespace" :RETURN-TYPE "XML"
      :ARGS (("ns" "*")) :STATIC NIL)
     (flash:text :SWF-NAME "text" :RETURN-TYPE "XMLList" :ARGS NIL :STATIC NIL)
     (flash:namespace-declarations :SWF-NAME "namespaceDeclarations"
      :RETURN-TYPE "Array" :ARGS NIL :STATIC NIL)
     (flash:add-namespace :SWF-NAME "addNamespace" :RETURN-TYPE "XML" :ARGS
      (("ns" "*")) :STATIC NIL)
     (flash:insert-child-after :SWF-NAME "insertChildAfter" :RETURN-TYPE "*"
      :ARGS (("child1" "*") ("child2" "*")) :STATIC NIL)
     (flash:elements :SWF-NAME "elements" :RETURN-TYPE "XMLList" :ARGS
      (&OPTIONAL (("name" "*") "*")) :STATIC NIL)
     (flash:node-kind :SWF-NAME "nodeKind" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:copy :SWF-NAME "copy" :RETURN-TYPE "XML" :ARGS NIL :STATIC NIL)
     (flash:comments :SWF-NAME "comments" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:notification :SWF-NAME "notification" :RETURN-TYPE "Function" :ARGS
      NIL :STATIC NIL)
     (flash:set-name :SWF-NAME "setName" :RETURN-TYPE "void" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:prepend-child :SWF-NAME "prependChild" :RETURN-TYPE "XML" :ARGS
      (("value" "*")) :STATIC NIL)
     (flash:has-simple-content :SWF-NAME "hasSimpleContent" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:attribute :SWF-NAME "attribute" :RETURN-TYPE "XMLList" :ARGS
      (("arg" "*")) :STATIC NIL)
     (flash:parent :SWF-NAME "parent" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "XML" :ARGS NIL :STATIC
      NIL)
     (flash:length :SWF-NAME "length" :RETURN-TYPE "int" :ARGS NIL :STATIC NIL)
     (flash:descendants :SWF-NAME "descendants" :RETURN-TYPE "XMLList" :ARGS
      (&OPTIONAL (("name" "*") "*")) :STATIC NIL)
     (flash:has-complex-content :SWF-NAME "hasComplexContent" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC NIL)
     (flash:append-child :SWF-NAME "appendChild" :RETURN-TYPE "XML" :ARGS
      (("child" "*")) :STATIC NIL)
     (flash:contains :SWF-NAME "contains" :RETURN-TYPE "Boolean" :ARGS
      (("value" "*")) :STATIC NIL)
     (flash:child-index :SWF-NAME "childIndex" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:child :SWF-NAME "child" :RETURN-TYPE "XMLList" :ARGS
      (("propertyName" "*")) :STATIC NIL)
     (flash:namespace :SWF-NAME "namespace" :RETURN-TYPE "*" :ARGS
      (&OPTIONAL ("prefix" "*")) :STATIC NIL)
     (flash:set-namespace :SWF-NAME "setNamespace" :RETURN-TYPE "void" :ARGS
      (("ns" "*")) :STATIC NIL)
     (flash:processing-instructions :SWF-NAME "processingInstructions"
      :RETURN-TYPE "XMLList" :ARGS (&OPTIONAL (("name" "*") "*")) :STATIC NIL)
     (flash:attributes :SWF-NAME "attributes" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:local-name :SWF-NAME "localName" :RETURN-TYPE "Object" :ARGS NIL
      :STATIC NIL)
     (flash:set-local-name :SWF-NAME "setLocalName" :RETURN-TYPE "void" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:in-scope-namespaces :SWF-NAME "inScopeNamespaces" :RETURN-TYPE
      "Array" :ARGS NIL :STATIC NIL)
     (flash:normalize :SWF-NAME "normalize" :RETURN-TYPE "XML" :ARGS NIL
      :STATIC NIL)
     (flash:name :SWF-NAME "name" :RETURN-TYPE "Object" :ARGS NIL :STATIC NIL)
     (flash:set-children :SWF-NAME "setChildren" :RETURN-TYPE "XML" :ARGS
      (("value" "*")) :STATIC NIL)
     (flash:property-is-enumerable :SWF-NAME "propertyIsEnumerable"
      :RETURN-TYPE "Boolean" :ARGS (&OPTIONAL (("P" "*") "UNDEFINED")) :STATIC
      NIL)
     (flash:to-xml-string :SWF-NAME "toXMLString" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash:set-notification :SWF-NAME "setNotification" :RETURN-TYPE "*" :ARGS
      (("f" "Function")) :STATIC NIL)
     (flash:replace :SWF-NAME "replace" :RETURN-TYPE "XML" :ARGS
      (("propertyName" "*") ("value" "*")) :STATIC NIL)
     (flash:insert-child-before :SWF-NAME "insertChildBefore" :RETURN-TYPE "*"
      :ARGS (("child1" "*") ("child2" "*")) :STATIC NIL)
     (flash:has-own-property :SWF-NAME "hasOwnProperty" :RETURN-TYPE "Boolean"
      :ARGS (&OPTIONAL (("P" "*") "UNDEFINED")) :STATIC NIL)
     (flash::xml.default-settings :SWF-NAME "defaultSettings" :RETURN-TYPE
      "Object" :ARGS NIL :STATIC T)
     (flash::xml.set-settings :SWF-NAME "setSettings" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL ("o" "Object")) :STATIC T)
     (flash::xml.settings :SWF-NAME "settings" :RETURN-TYPE "Object" :ARGS NIL
      :STATIC T)))
  (avm2-compiler::declare-swf-class flash:xml-list (flash:object)
    :swf-name "XMLList"
    :constants
    ((flash:+xml-list.length+ :SWF-NAME "length" :TYPE "*" :VALUE "1" :STATIC T))
    :properties
    ()
    :methods
    ((flash:children :SWF-NAME "children" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:remove-namespace :SWF-NAME "removeNamespace" :RETURN-TYPE "XML"
      :ARGS (("ns" "*")) :STATIC NIL)
     (flash:comments :SWF-NAME "comments" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:add-namespace :SWF-NAME "addNamespace" :RETURN-TYPE "XML" :ARGS
      (("ns" "*")) :STATIC NIL)
     (flash:insert-child-after :SWF-NAME "insertChildAfter" :RETURN-TYPE "*"
      :ARGS (("child1" "*") ("child2" "*")) :STATIC NIL)
     (flash:elements :SWF-NAME "elements" :RETURN-TYPE "XMLList" :ARGS
      (&OPTIONAL (("name" "*") "*")) :STATIC NIL)
     (flash:node-kind :SWF-NAME "nodeKind" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:copy :SWF-NAME "copy" :RETURN-TYPE "XMLList" :ARGS NIL :STATIC NIL)
     (flash:text :SWF-NAME "text" :RETURN-TYPE "XMLList" :ARGS NIL :STATIC NIL)
     (flash:set-name :SWF-NAME "setName" :RETURN-TYPE "void" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:prepend-child :SWF-NAME "prependChild" :RETURN-TYPE "XML" :ARGS
      (("value" "*")) :STATIC NIL)
     (flash:has-simple-content :SWF-NAME "hasSimpleContent" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:child :SWF-NAME "child" :RETURN-TYPE "XMLList" :ARGS
      (("propertyName" "*")) :STATIC NIL)
     (flash:parent :SWF-NAME "parent" :RETURN-TYPE "*" :ARGS NIL :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:length :SWF-NAME "length" :RETURN-TYPE "int" :ARGS NIL :STATIC NIL)
     (flash:local-name :SWF-NAME "localName" :RETURN-TYPE "Object" :ARGS NIL
      :STATIC NIL)
     (flash:has-complex-content :SWF-NAME "hasComplexContent" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC NIL)
     (flash:append-child :SWF-NAME "appendChild" :RETURN-TYPE "XML" :ARGS
      (("child" "*")) :STATIC NIL)
     (flash:contains :SWF-NAME "contains" :RETURN-TYPE "Boolean" :ARGS
      (("value" "*")) :STATIC NIL)
     (flash:child-index :SWF-NAME "childIndex" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:attribute :SWF-NAME "attribute" :RETURN-TYPE "XMLList" :ARGS
      (("arg" "*")) :STATIC NIL)
     (flash:namespace :SWF-NAME "namespace" :RETURN-TYPE "*" :ARGS
      (&OPTIONAL ("prefix" "*")) :STATIC NIL)
     (flash:set-local-name :SWF-NAME "setLocalName" :RETURN-TYPE "void" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:set-namespace :SWF-NAME "setNamespace" :RETURN-TYPE "void" :ARGS
      (("ns" "*")) :STATIC NIL)
     (flash:processing-instructions :SWF-NAME "processingInstructions"
      :RETURN-TYPE "XMLList" :ARGS (&OPTIONAL (("name" "*") "*")) :STATIC NIL)
     (flash:attributes :SWF-NAME "attributes" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:descendants :SWF-NAME "descendants" :RETURN-TYPE "XMLList" :ARGS
      (&OPTIONAL (("name" "*") "*")) :STATIC NIL)
     (flash:to-xml-string :SWF-NAME "toXMLString" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash:in-scope-namespaces :SWF-NAME "inScopeNamespaces" :RETURN-TYPE
      "Array" :ARGS NIL :STATIC NIL)
     (flash:normalize :SWF-NAME "normalize" :RETURN-TYPE "XMLList" :ARGS NIL
      :STATIC NIL)
     (flash:replace :SWF-NAME "replace" :RETURN-TYPE "XML" :ARGS
      (("propertyName" "*") ("value" "*")) :STATIC NIL)
     (flash:name :SWF-NAME "name" :RETURN-TYPE "Object" :ARGS NIL :STATIC NIL)
     (flash:set-children :SWF-NAME "setChildren" :RETURN-TYPE "XML" :ARGS
      (("value" "*")) :STATIC NIL)
     (flash:property-is-enumerable :SWF-NAME "propertyIsEnumerable"
      :RETURN-TYPE "Boolean" :ARGS (&OPTIONAL (("P" "*") "UNDEFINED")) :STATIC
      NIL)
     (flash:namespace-declarations :SWF-NAME "namespaceDeclarations"
      :RETURN-TYPE "Array" :ARGS NIL :STATIC NIL)
     (flash:insert-child-before :SWF-NAME "insertChildBefore" :RETURN-TYPE "*"
      :ARGS (("child1" "*") ("child2" "*")) :STATIC NIL)
     (flash:has-own-property :SWF-NAME "hasOwnProperty" :RETURN-TYPE "Boolean"
      :ARGS (&OPTIONAL (("P" "*") "UNDEFINED")) :STATIC NIL)))
  (avm2-compiler::declare-swf-class flash:q-name (flash:object)
    :swf-name "QName"
    :constants
    ((flash:+q-name.length+ :SWF-NAME "length" :TYPE "*" :VALUE "2" :STATIC T))
    :properties
    ((flash::local-name :SWF-NAME "localName" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.local-name)
     (flash::uri :SWF-NAME "uri" :TYPE "*" :STATIC NIL :ACCESSOR flash:.uri))
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "QName" :ARGS NIL :STATIC
      NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.stage-align (flash:object)
    :swf-name "flash.display::StageAlign"
    :constants
    ((flash:+stage-align.right+ :SWF-NAME "RIGHT" :TYPE "String" :VALUE "R"
      :STATIC T)
     (flash:+stage-align.bottom-left+ :SWF-NAME "BOTTOM_LEFT" :TYPE "String"
      :VALUE "BL" :STATIC T)
     (flash:+stage-align.top+ :SWF-NAME "TOP" :TYPE "String" :VALUE "T" :STATIC
      T)
     (flash:+stage-align.top-right+ :SWF-NAME "TOP_RIGHT" :TYPE "String" :VALUE
      "TR" :STATIC T)
     (flash:+stage-align.top-left+ :SWF-NAME "TOP_LEFT" :TYPE "String" :VALUE
      "TL" :STATIC T)
     (flash:+stage-align.bottom+ :SWF-NAME "BOTTOM" :TYPE "String" :VALUE "B"
      :STATIC T)
     (flash:+stage-align.bottom-right+ :SWF-NAME "BOTTOM_RIGHT" :TYPE "String"
      :VALUE "BR" :STATIC T)
     (flash:+stage-align.left+ :SWF-NAME "LEFT" :TYPE "String" :VALUE "L"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.profiler.profile "flash.profiler::profile"
    (("on" "Boolean")) "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.profiler.show-redraw-regions "flash.profiler::showRedrawRegions"
    (("on" "Boolean") &OPTIONAL (("color" "uint") "16711680")) "void")
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.color-correction-support (flash:object)
    :swf-name "flash.display::ColorCorrectionSupport"
    :constants
    ((flash:+color-correction-support.default-on+ :SWF-NAME "DEFAULT_ON" :TYPE
      "String" :VALUE "defaultOn" :STATIC T)
     (flash:+color-correction-support.unsupported+ :SWF-NAME "UNSUPPORTED"
      :TYPE "String" :VALUE "unsupported" :STATIC T)
     (flash:+color-correction-support.default-off+ :SWF-NAME "DEFAULT_OFF"
      :TYPE "String" :VALUE "defaultOff" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.errors.illegal-operation-error (flash:error)
    :swf-name "flash.errors::IllegalOperationError"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.errors.i-o-error (flash:error)
    :swf-name "flash.errors::IOError"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.errors.memory-error (flash:error)
    :swf-name "flash.errors::MemoryError"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.errors.stack-overflow-error (flash:error)
    :swf-name "flash.errors::StackOverflowError"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.errors.script-timeout-error (flash:error)
    :swf-name "flash.errors::ScriptTimeoutError"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.errors.invalid-swf-error (flash:error)
    :swf-name "flash.errors::InvalidSWFError"
    :constants
    ()
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.errors.eof-error (flash:flash.errors.i-o-error)
    :swf-name "flash.errors::EOFError"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.line-scale-mode (flash:object)
    :swf-name "flash.display::LineScaleMode"
    :constants
    ((flash:+line-scale-mode.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE
      "none" :STATIC T)
     (flash:+line-scale-mode.normal+ :SWF-NAME "NORMAL" :TYPE "String" :VALUE
      "normal" :STATIC T)
     (flash:+line-scale-mode.vertical+ :SWF-NAME "VERTICAL" :TYPE "String"
      :VALUE "vertical" :STATIC T)
     (flash:+line-scale-mode.horizontal+ :SWF-NAME "HORIZONTAL" :TYPE "String"
      :VALUE "horizontal" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.font-style (flash:object)
    :swf-name "flash.text::FontStyle"
    :constants
    ((flash:+font-style.regular+ :SWF-NAME "REGULAR" :TYPE "String" :VALUE
      "regular" :STATIC T)
     (flash:+font-style.bold+ :SWF-NAME "BOLD" :TYPE "String" :VALUE "bold"
      :STATIC T)
     (flash:+font-style.bold-italic+ :SWF-NAME "BOLD_ITALIC" :TYPE "String"
      :VALUE "boldItalic" :STATIC T)
     (flash:+font-style.italic+ :SWF-NAME "ITALIC" :TYPE "String" :VALUE
      "italic" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.utils3-d (flash:object)
    :swf-name "flash.geom::Utils3D"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash::utils3-d.project-vectors :SWF-NAME "projectVectors" :RETURN-TYPE
      "void" :ARGS
      (("m" "flash.geom::Matrix3D") ("verts" "__AS3__.vec::Vector<Number>")
       ("projectedVerts" "__AS3__.vec::Vector<Number>")
       ("uvts" "__AS3__.vec::Vector<Number>"))
      :STATIC T)
     (flash::utils3-d.project-vector :SWF-NAME "projectVector" :RETURN-TYPE
      "flash.geom::Vector3D" :ARGS
      (("m" "flash.geom::Matrix3D") ("v" "flash.geom::Vector3D")) :STATIC T)
     (flash::utils3-d.point-towards :SWF-NAME "pointTowards" :RETURN-TYPE
      "flash.geom::Matrix3D" :ARGS
      (("percent" "Number") ("mat" "flash.geom::Matrix3D")
       ("pos" "flash.geom::Vector3D") &OPTIONAL ("at" "flash.geom::Vector3D")
       ("up" "flash.geom::Vector3D"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.typographic-case (flash:object)
    :swf-name "flash.text.engine::TypographicCase"
    :constants
    ((flash:+typographic-case.caps-and-small-caps+ :SWF-NAME
      "CAPS_AND_SMALL_CAPS" :TYPE "String" :VALUE "capsAndSmallCaps" :STATIC T)
     (flash:+typographic-case.small-caps+ :SWF-NAME "SMALL_CAPS" :TYPE "String"
      :VALUE "smallCaps" :STATIC T)
     (flash:+typographic-case.title+ :SWF-NAME "TITLE" :TYPE "String" :VALUE
      "title" :STATIC T)
     (flash:+typographic-case.uppercase+ :SWF-NAME "UPPERCASE" :TYPE "String"
      :VALUE "uppercase" :STATIC T)
     (flash:+typographic-case.default+ :SWF-NAME "DEFAULT" :TYPE "String"
      :VALUE "default" :STATIC T)
     (flash:+typographic-case.caps+ :SWF-NAME "CAPS" :TYPE "String" :VALUE
      "caps" :STATIC T)
     (flash:+typographic-case.lowercase+ :SWF-NAME "LOWERCASE" :TYPE "String"
      :VALUE "lowercase" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.tab-alignment (flash:object)
    :swf-name "flash.text.engine::TabAlignment"
    :constants
    ((flash:+tab-alignment.end+ :SWF-NAME "END" :TYPE "String" :VALUE "end"
      :STATIC T)
     (flash:+tab-alignment.center+ :SWF-NAME "CENTER" :TYPE "String" :VALUE
      "center" :STATIC T)
     (flash:+tab-alignment.start+ :SWF-NAME "START" :TYPE "String" :VALUE
      "start" :STATIC T)
     (flash:+tab-alignment.decimal+ :SWF-NAME "DECIMAL" :TYPE "String" :VALUE
      "decimal" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.i-me-conversion-mode (flash:object)
    :swf-name "flash.system::IMEConversionMode"
    :constants
    ((flash:+i-me-conversion-mode.alphanumeric-full+ :SWF-NAME
      "ALPHANUMERIC_FULL" :TYPE "String" :VALUE "ALPHANUMERIC_FULL" :STATIC T)
     (flash:+i-me-conversion-mode.japanese-katakana-half+ :SWF-NAME
      "JAPANESE_KATAKANA_HALF" :TYPE "String" :VALUE "JAPANESE_KATAKANA_HALF"
      :STATIC T)
     (flash:+i-me-conversion-mode.japanese-katakana-full+ :SWF-NAME
      "JAPANESE_KATAKANA_FULL" :TYPE "String" :VALUE "JAPANESE_KATAKANA_FULL"
      :STATIC T)
     (flash:+i-me-conversion-mode.chinese+ :SWF-NAME "CHINESE" :TYPE "String"
      :VALUE "CHINESE" :STATIC T)
     (flash:+i-me-conversion-mode.japanese-hiragana+ :SWF-NAME
      "JAPANESE_HIRAGANA" :TYPE "String" :VALUE "JAPANESE_HIRAGANA" :STATIC T)
     (flash:+i-me-conversion-mode.unknown+ :SWF-NAME "UNKNOWN" :TYPE "String"
      :VALUE "UNKNOWN" :STATIC T)
     (flash:+i-me-conversion-mode.korean+ :SWF-NAME "KOREAN" :TYPE "String"
      :VALUE "KOREAN" :STATIC T)
     (flash:+i-me-conversion-mode.alphanumeric-half+ :SWF-NAME
      "ALPHANUMERIC_HALF" :TYPE "String" :VALUE "ALPHANUMERIC_HALF" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.net.send-to-url "flash.net::sendToURL"
    (("request" "flash.net::URLRequest")) "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.net.register-class-alias "flash.net::registerClassAlias"
    (("aliasName" "String") ("classObject" "Class")) "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.net.get-class-by-alias "flash.net::getClassByAlias"
    (("aliasName" "String")) "Class")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.net.navigate-to-url "flash.net::navigateToURL"
    (("request" "flash.net::URLRequest") &OPTIONAL ("window" "String")) "void")
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.system.fscommand "flash.system::fscommand"
    (("command" "String") &OPTIONAL (("args" "String") "")) "void")
  (avm2-compiler::declare-swf-class flash::flash.system.fs-command (flash:object)
    :swf-name "flash.system::FSCommand"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash::fs-command.%fscommand :SWF-NAME "_fscommand" :RETURN-TYPE "void"
      :ARGS (("command" "String") ("args" "String")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.tab-stop (flash:object)
    :swf-name "flash.text.engine::TabStop"
    :constants
    ()
    :properties
    ((flash::position :SWF-NAME "position" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.position)
     (flash::decimal-alignment-token :SWF-NAME "decimalAlignmentToken" :TYPE
      "String" :STATIC NIL :ACCESSOR flash:.decimal-alignment-token)
     (flash::alignment :SWF-NAME "alignment" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.alignment))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.i-graphics-fill ()
    :swf-name "flash.display::IGraphicsFill"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-gradient-fill (flash:object)
    :swf-name "flash.display::GraphicsGradientFill"
    :constants
    ()
    :properties
    ((flash::spread-method :SWF-NAME "spreadMethod" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.spread-method)
     (flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::alphas :SWF-NAME "alphas" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.alphas)
     (flash::colors :SWF-NAME "colors" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.colors)
     (flash::ratios :SWF-NAME "ratios" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.ratios)
     (flash::focal-point-ratio :SWF-NAME "focalPointRatio" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.focal-point-ratio)
     (flash::interpolation-method :SWF-NAME "interpolationMethod" :TYPE
      "String" :STATIC NIL :ACCESSOR flash:.interpolation-method)
     (flash::matrix :SWF-NAME "matrix" :TYPE "flash.geom::Matrix" :STATIC NIL
      :ACCESSOR flash:.matrix))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.font-description (flash:object)
    :swf-name "flash.text.engine::FontDescription"
    :constants
    ()
    :properties
    ((flash::font-name :SWF-NAME "fontName" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.font-name)
     (flash::font-posture :SWF-NAME "fontPosture" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.font-posture)
     (flash::cff-hinting :SWF-NAME "cffHinting" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.cff-hinting)
     (flash::rendering-mode :SWF-NAME "renderingMode" :TYPE "String" :STATIC
      NIL :ACCESSOR flash:.rendering-mode)
     (flash::locked :SWF-NAME "locked" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.locked)
     (flash::font-lookup :SWF-NAME "fontLookup" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.font-lookup)
     (flash::font-weight :SWF-NAME "fontWeight" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.font-weight))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE
      "flash.text.engine::FontDescription" :ARGS NIL :STATIC NIL)
     (flash::font-description.is-font-compatible :SWF-NAME "isFontCompatible"
      :RETURN-TYPE "Boolean" :ARGS
      (("fontName" "String") ("fontWeight" "String") ("fontPosture" "String"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.net-stream (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::NetStream"
    :constants
    ((flash:+net-stream.direct-connections+ :SWF-NAME "DIRECT_CONNECTIONS"
      :TYPE "String" :VALUE "directConnections" :STATIC T)
     (flash:+net-stream.connect-to-fms+ :SWF-NAME "CONNECT_TO_FMS" :TYPE
      "String" :VALUE "connectToFMS" :STATIC T))
    :properties
    ((flash::check-policy-file :SWF-NAME "checkPolicyFile" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.check-policy-file)
     (flash::decoded-frames :SWF-NAME "decodedFrames" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.decoded-frames)
     (flash::far-id :SWF-NAME "farID" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.far-id)
     (flash::live-delay :SWF-NAME "liveDelay" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.live-delay)
     (flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding)
     (flash::current-fps :SWF-NAME "currentFPS" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.current-fps)
     (flash::info :SWF-NAME "info" :TYPE "flash.net::NetStreamInfo" :STATIC NIL
      :ACCESSOR flash:.info)
     (flash::buffer-time :SWF-NAME "bufferTime" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.buffer-time)
     (flash::near-nonce :SWF-NAME "nearNonce" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.near-nonce)
     (flash::audio-codec :SWF-NAME "audioCodec" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.audio-codec)
     (flash::far-nonce :SWF-NAME "farNonce" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.far-nonce)
     (flash::sound-transform :SWF-NAME "soundTransform" :TYPE
      "flash.media::SoundTransform" :STATIC NIL :ACCESSOR
      flash:.sound-transform)
     (flash::video-codec :SWF-NAME "videoCodec" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.video-codec)
     (flash::bytes-total :SWF-NAME "bytesTotal" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-total)
     (flash::buffer-length :SWF-NAME "bufferLength" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.buffer-length)
     (flash::time :SWF-NAME "time" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.time)
     (flash::bytes-loaded :SWF-NAME "bytesLoaded" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-loaded)
     (flash::client :SWF-NAME "client" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.client)
     (flash::peer-streams :SWF-NAME "peerStreams" :TYPE "Array" :STATIC NIL
      :ACCESSOR flash:.peer-streams)
     (flash::max-pause-buffer-time :SWF-NAME "maxPauseBufferTime" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.max-pause-buffer-time))
    :methods
    ((flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:play2 :SWF-NAME "play2" :RETURN-TYPE "void" :ARGS
      (("param" "flash.net::NetStreamPlayOptions")) :STATIC NIL)
     (flash:play :SWF-NAME "play" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:pause :SWF-NAME "pause" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:resume :SWF-NAME "resume" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:receive-audio :SWF-NAME "receiveAudio" :RETURN-TYPE "void" :ARGS
      (("flag" "Boolean")) :STATIC NIL)
     (flash:receive-video-fps :SWF-NAME "receiveVideoFPS" :RETURN-TYPE "void"
      :ARGS (("FPS" "Number")) :STATIC NIL)
     (flash:on-peer-connect :SWF-NAME "onPeerConnect" :RETURN-TYPE "Boolean"
      :ARGS (("subscriber" "flash.net::NetStream")) :STATIC NIL)
     (flash:receive-video :SWF-NAME "receiveVideo" :RETURN-TYPE "void" :ARGS
      (("flag" "Boolean")) :STATIC NIL)
     (flash:attach-audio :SWF-NAME "attachAudio" :RETURN-TYPE "void" :ARGS
      (("microphone" "flash.media::Microphone")) :STATIC NIL)
     (flash:publish :SWF-NAME "publish" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL ("name" "String") ("type" "String")) :STATIC NIL)
     (flash:attach-camera :SWF-NAME "attachCamera" :RETURN-TYPE "void" :ARGS
      (("theCamera" "flash.media::Camera") &OPTIONAL
       (("snapshotMilliseconds" "int") "-1"))
      :STATIC NIL)
     (flash:send :SWF-NAME "send" :RETURN-TYPE "void" :ARGS
      (("handlerName" "String")) :STATIC NIL)
     (flash:seek :SWF-NAME "seek" :RETURN-TYPE "void" :ARGS
      (("offset" "Number")) :STATIC NIL)
     (flash:toggle-pause :SWF-NAME "togglePause" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.xml.xml-node-type (flash:object)
    :swf-name "flash.xml::XMLNodeType"
    :constants
    ((flash:+xml-node-type.processing-instruction-node+ :SWF-NAME
      "PROCESSING_INSTRUCTION_NODE" :TYPE "uint" :VALUE "7" :STATIC T)
     (flash:+xml-node-type.text-node+ :SWF-NAME "TEXT_NODE" :TYPE "uint" :VALUE
      "3" :STATIC T)
     (flash:+xml-node-type.cdata-node+ :SWF-NAME "CDATA_NODE" :TYPE "uint"
      :VALUE "4" :STATIC T)
     (flash:+xml-node-type.xml-declaration+ :SWF-NAME "XML_DECLARATION" :TYPE
      "uint" :VALUE "13" :STATIC T)
     (flash:+xml-node-type.comment-node+ :SWF-NAME "COMMENT_NODE" :TYPE "uint"
      :VALUE "8" :STATIC T)
     (flash:+xml-node-type.element-node+ :SWF-NAME "ELEMENT_NODE" :TYPE "uint"
      :VALUE "1" :STATIC T)
     (flash:+xml-node-type.document-type-node+ :SWF-NAME "DOCUMENT_TYPE_NODE"
      :TYPE "uint" :VALUE "10" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.i-me-event (flash:flash.events.text-event)
    :swf-name "flash.events::IMEEvent"
    :constants
    ((flash:+i-me-event.ime-composition+ :SWF-NAME "IME_COMPOSITION" :TYPE
      "String" :VALUE "imeComposition" :STATIC T))
    :properties
    ()
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.bitmap-filter (flash:object)
    :swf-name "flash.filters::BitmapFilter"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.drop-shadow-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::DropShadowFilter"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::alpha :SWF-NAME "alpha" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.alpha)
     (flash::knockout :SWF-NAME "knockout" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.knockout)
     (flash::inner :SWF-NAME "inner" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.inner)
     (flash::distance :SWF-NAME "distance" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.distance)
     (flash::angle :SWF-NAME "angle" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.angle)
     (flash::blur-y :SWF-NAME "blurY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-y)
     (flash::blur-x :SWF-NAME "blurX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-x)
     (flash::strength :SWF-NAME "strength" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.strength)
     (flash::color :SWF-NAME "color" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.color)
     (flash::hide-object :SWF-NAME "hideObject" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.hide-object))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.timer (flash:flash.events.event-dispatcher)
    :swf-name "flash.utils::Timer"
    :constants
    ()
    :properties
    ((flash::running :SWF-NAME "running" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.running)
     (flash::current-count :SWF-NAME "currentCount" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.current-count)
     (flash::repeat-count :SWF-NAME "repeatCount" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.repeat-count)
     (flash::delay :SWF-NAME "delay" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.delay))
    :methods
    ((flash:stop :SWF-NAME "stop" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:start :SWF-NAME "start" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:reset :SWF-NAME "reset" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.clear-interval "flash.utils::clearInterval"
    (("id" "uint")) "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.clear-timeout "flash.utils::clearTimeout"
    (("id" "uint")) "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.set-interval "flash.utils::setInterval"
    (("closure" "Function") ("delay" "Number")) "uint")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.set-timeout "flash.utils::setTimeout"
    (("closure" "Function") ("delay" "Number")) "uint")
  (avm2-compiler::declare-swf-class flash::flash.utils.set-interval-timer (flash:flash.utils.timer)
    :swf-name "flash.utils::SetIntervalTimer"
    :constants
    ()
    :properties
    ((flash::id :SWF-NAME "flash.utils::id" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.id))
    :methods
    ((flash::set-interval-timer.clear-array-entry :SWF-NAME
      "flash.utils::clearArrayEntry" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash::set-interval-timer.clear-interval :SWF-NAME
      "flash.utils::clearInterval" :RETURN-TYPE "void" :ARGS (("id" "uint"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.keyboard (flash:object)
    :swf-name "flash.ui::Keyboard"
    :constants
    ((flash:+keyboard.numpad-multiply+ :SWF-NAME "NUMPAD_MULTIPLY" :TYPE "uint"
      :VALUE "106" :STATIC T)
     (flash:+keyboard.f11+ :SWF-NAME "F11" :TYPE "uint" :VALUE "122" :STATIC T)
     (flash:+keyboard.numpad-subtract+ :SWF-NAME "NUMPAD_SUBTRACT" :TYPE "uint"
      :VALUE "109" :STATIC T)
     (flash:+keyboard.shift+ :SWF-NAME "SHIFT" :TYPE "uint" :VALUE "16" :STATIC
      T)
     (flash:+keyboard.f15+ :SWF-NAME "F15" :TYPE "uint" :VALUE "126" :STATIC T)
     (flash:+keyboard.f14+ :SWF-NAME "F14" :TYPE "uint" :VALUE "125" :STATIC T)
     (flash:+keyboard.f13+ :SWF-NAME "F13" :TYPE "uint" :VALUE "124" :STATIC T)
     (flash:+keyboard.f12+ :SWF-NAME "F12" :TYPE "uint" :VALUE "123" :STATIC T)
     (flash:+keyboard.home+ :SWF-NAME "HOME" :TYPE "uint" :VALUE "36" :STATIC T)
     (flash:+keyboard.f10+ :SWF-NAME "F10" :TYPE "uint" :VALUE "121" :STATIC T)
     (flash:+keyboard.page-up+ :SWF-NAME "PAGE_UP" :TYPE "uint" :VALUE "33"
      :STATIC T)
     (flash:+keyboard.page-down+ :SWF-NAME "PAGE_DOWN" :TYPE "uint" :VALUE "34"
      :STATIC T)
     (flash:+keyboard.backspace+ :SWF-NAME "BACKSPACE" :TYPE "uint" :VALUE "8"
      :STATIC T)
     (flash:+keyboard.numpad-decimal+ :SWF-NAME "NUMPAD_DECIMAL" :TYPE "uint"
      :VALUE "110" :STATIC T)
     (flash:+keyboard.numpad-enter+ :SWF-NAME "NUMPAD_ENTER" :TYPE "uint"
      :VALUE "108" :STATIC T)
     (flash:+keyboard.numpad-0+ :SWF-NAME "NUMPAD_0" :TYPE "uint" :VALUE "96"
      :STATIC T)
     (flash:+keyboard.numpad-6+ :SWF-NAME "NUMPAD_6" :TYPE "uint" :VALUE "102"
      :STATIC T)
     (flash:+keyboard.caps-lock+ :SWF-NAME "CAPS_LOCK" :TYPE "uint" :VALUE "20"
      :STATIC T)
     (flash:+keyboard.numpad-3+ :SWF-NAME "NUMPAD_3" :TYPE "uint" :VALUE "99"
      :STATIC T)
     (flash:+keyboard.numpad-9+ :SWF-NAME "NUMPAD_9" :TYPE "uint" :VALUE "105"
      :STATIC T)
     (flash:+keyboard.numpad-8+ :SWF-NAME "NUMPAD_8" :TYPE "uint" :VALUE "104"
      :STATIC T)
     (flash:+keyboard.numpad-5+ :SWF-NAME "NUMPAD_5" :TYPE "uint" :VALUE "101"
      :STATIC T)
     (flash:+keyboard.numpad-4+ :SWF-NAME "NUMPAD_4" :TYPE "uint" :VALUE "100"
      :STATIC T)
     (flash:+keyboard.f8+ :SWF-NAME "F8" :TYPE "uint" :VALUE "119" :STATIC T)
     (flash:+keyboard.numpad-2+ :SWF-NAME "NUMPAD_2" :TYPE "uint" :VALUE "98"
      :STATIC T)
     (flash:+keyboard.numpad-1+ :SWF-NAME "NUMPAD_1" :TYPE "uint" :VALUE "97"
      :STATIC T)
     (flash:+keyboard.control+ :SWF-NAME "CONTROL" :TYPE "uint" :VALUE "17"
      :STATIC T)
     (flash:+keyboard.end+ :SWF-NAME "END" :TYPE "uint" :VALUE "35" :STATIC T)
     (flash:+keyboard.numpad-divide+ :SWF-NAME "NUMPAD_DIVIDE" :TYPE "uint"
      :VALUE "111" :STATIC T)
     (flash:+keyboard.insert+ :SWF-NAME "INSERT" :TYPE "uint" :VALUE "45"
      :STATIC T)
     (flash:+keyboard.enter+ :SWF-NAME "ENTER" :TYPE "uint" :VALUE "13" :STATIC
      T)
     (flash:+keyboard.f9+ :SWF-NAME "F9" :TYPE "uint" :VALUE "120" :STATIC T)
     (flash:+keyboard.delete+ :SWF-NAME "DELETE" :TYPE "uint" :VALUE "46"
      :STATIC T)
     (flash:+keyboard.f7+ :SWF-NAME "F7" :TYPE "uint" :VALUE "118" :STATIC T)
     (flash:+keyboard.f6+ :SWF-NAME "F6" :TYPE "uint" :VALUE "117" :STATIC T)
     (flash:+keyboard.f5+ :SWF-NAME "F5" :TYPE "uint" :VALUE "116" :STATIC T)
     (flash:+keyboard.f4+ :SWF-NAME "F4" :TYPE "uint" :VALUE "115" :STATIC T)
     (flash:+keyboard.f3+ :SWF-NAME "F3" :TYPE "uint" :VALUE "114" :STATIC T)
     (flash:+keyboard.f2+ :SWF-NAME "F2" :TYPE "uint" :VALUE "113" :STATIC T)
     (flash:+keyboard.f1+ :SWF-NAME "F1" :TYPE "uint" :VALUE "112" :STATIC T)
     (flash:+keyboard.up+ :SWF-NAME "UP" :TYPE "uint" :VALUE "38" :STATIC T)
     (flash:+keyboard.down+ :SWF-NAME "DOWN" :TYPE "uint" :VALUE "40" :STATIC T)
     (flash:+keyboard.space+ :SWF-NAME "SPACE" :TYPE "uint" :VALUE "32" :STATIC
      T)
     (flash:+keyboard.numpad-add+ :SWF-NAME "NUMPAD_ADD" :TYPE "uint" :VALUE
      "107" :STATIC T)
     (flash:+keyboard.tab+ :SWF-NAME "TAB" :TYPE "uint" :VALUE "9" :STATIC T)
     (flash:+keyboard.numpad-7+ :SWF-NAME "NUMPAD_7" :TYPE "uint" :VALUE "103"
      :STATIC T)
     (flash:+keyboard.left+ :SWF-NAME "LEFT" :TYPE "uint" :VALUE "37" :STATIC T)
     (flash:+keyboard.right+ :SWF-NAME "RIGHT" :TYPE "uint" :VALUE "39" :STATIC
      T)
     (flash:+keyboard.escape+ :SWF-NAME "ESCAPE" :TYPE "uint" :VALUE "27"
      :STATIC T))
    :properties
    ((flash::num-lock :SWF-NAME "numLock" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.num-lock)
     (flash::caps-lock :SWF-NAME "capsLock" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.caps-lock))
    :methods
    ((flash::keyboard.is-accessible :SWF-NAME "isAccessible" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.sound-mixer (flash:object)
    :swf-name "flash.media::SoundMixer"
    :constants
    ()
    :properties
    ((flash::sound-transform :SWF-NAME "soundTransform" :TYPE
      "flash.media::SoundTransform" :STATIC T :ACCESSOR flash:.sound-transform)
     (flash::buffer-time :SWF-NAME "bufferTime" :TYPE "int" :STATIC T :ACCESSOR
      flash:.buffer-time))
    :methods
    ((flash::sound-mixer.stop-all :SWF-NAME "stopAll" :RETURN-TYPE "void" :ARGS
      NIL :STATIC T)
     (flash::sound-mixer.compute-spectrum :SWF-NAME "computeSpectrum"
      :RETURN-TYPE "void" :ARGS
      (("outputArray" "flash.utils::ByteArray") &OPTIONAL
       (("FFTMode" "Boolean") "0") (("stretchFactor" "int") "FALSE"))
      :STATIC T)
     (flash::sound-mixer.are-sounds-inaccessible :SWF-NAME
      "areSoundsInaccessible" :RETURN-TYPE "Boolean" :ARGS NIL :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shader-data (flash:object)
    :swf-name "flash.display::ShaderData"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.bitmap-data (flash:object)
    :swf-name "flash.display::BitmapData"
    :constants
    ()
    :properties
    ((flash::height :SWF-NAME "height" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::rect :SWF-NAME "rect" :TYPE "flash.geom::Rectangle" :STATIC NIL
      :ACCESSOR flash:.rect)
     (flash::transparent :SWF-NAME "transparent" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.transparent)
     (flash::width :SWF-NAME "width" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.width))
    :methods
    ((flash:histogram :SWF-NAME "histogram" :RETURN-TYPE
      "__AS3__.vec::Vector<__AS3__.vec::Vector<Number>>" :ARGS
      (&OPTIONAL ("hRect" "flash.geom::Rectangle")) :STATIC NIL)
     (flash:get-vector :SWF-NAME "getVector" :RETURN-TYPE
      "__AS3__.vec::Vector<uint>" :ARGS (("rect" "flash.geom::Rectangle"))
      :STATIC NIL)
     (flash:merge :SWF-NAME "merge" :RETURN-TYPE "void" :ARGS
      (("sourceBitmapData" "flash.display::BitmapData")
       ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point")
       ("redMultiplier" "uint") ("greenMultiplier" "uint")
       ("blueMultiplier" "uint") ("alphaMultiplier" "uint"))
      :STATIC NIL)
     (flash:set-pixels :SWF-NAME "setPixels" :RETURN-TYPE "void" :ARGS
      (("rect" "flash.geom::Rectangle")
       ("inputByteArray" "flash.utils::ByteArray"))
      :STATIC NIL)
     (flash:lock :SWF-NAME "lock" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:get-pixel32 :SWF-NAME "getPixel32" :RETURN-TYPE "uint" :ARGS
      (("x" "int") ("y" "int")) :STATIC NIL)
     (flash:threshold :SWF-NAME "threshold" :RETURN-TYPE "uint" :ARGS
      (("sourceBitmapData" "flash.display::BitmapData")
       ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point")
       ("operation" "String") ("threshold" "uint") &OPTIONAL
       (("color" "uint") "FALSE") (("mask" "uint") "4.294967295d9")
       (("copySource" "Boolean") "0"))
      :STATIC NIL)
     (flash:get-pixels :SWF-NAME "getPixels" :RETURN-TYPE
      "flash.utils::ByteArray" :ARGS (("rect" "flash.geom::Rectangle")) :STATIC
      NIL)
     (flash:palette-map :SWF-NAME "paletteMap" :RETURN-TYPE "void" :ARGS
      (("sourceBitmapData" "flash.display::BitmapData")
       ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point")
       &OPTIONAL ("redArray" "Array") ("greenArray" "Array")
       ("blueArray" "Array") ("alphaArray" "Array"))
      :STATIC NIL)
     (flash:perlin-noise :SWF-NAME "perlinNoise" :RETURN-TYPE "void" :ARGS
      (("baseX" "Number") ("baseY" "Number") ("numOctaves" "uint")
       ("randomSeed" "int") ("stitch" "Boolean") ("fractalNoise" "Boolean")
       &OPTIONAL ("channelOptions" "uint") (("grayScale" "Boolean") "FALSE")
       (("offsets" "Array") "7"))
      :STATIC NIL)
     (flash:compare :SWF-NAME "compare" :RETURN-TYPE "Object" :ARGS
      (("otherBitmapData" "flash.display::BitmapData")) :STATIC NIL)
     (flash:set-pixel32 :SWF-NAME "setPixel32" :RETURN-TYPE "void" :ARGS
      (("x" "int") ("y" "int") ("color" "uint")) :STATIC NIL)
     (flash:flood-fill :SWF-NAME "floodFill" :RETURN-TYPE "void" :ARGS
      (("x" "int") ("y" "int") ("color" "uint")) :STATIC NIL)
     (flash:dispose :SWF-NAME "dispose" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.display::BitmapData"
      :ARGS NIL :STATIC NIL)
     (flash:noise :SWF-NAME "noise" :RETURN-TYPE "void" :ARGS
      (("randomSeed" "int") &OPTIONAL (("low" "uint") "FALSE")
       (("high" "uint") "7") (("channelOptions" "uint") "255")
       (("grayScale" "Boolean") "0"))
      :STATIC NIL)
     (flash:pixel-dissolve :SWF-NAME "pixelDissolve" :RETURN-TYPE "int" :ARGS
      (("sourceBitmapData" "flash.display::BitmapData")
       ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point")
       &OPTIONAL (("randomSeed" "int") "0") (("numPixels" "int") "0")
       (("fillColor" "uint") "0"))
      :STATIC NIL)
     (flash:get-color-bounds-rect :SWF-NAME "getColorBoundsRect" :RETURN-TYPE
      "flash.geom::Rectangle" :ARGS
      (("mask" "uint") ("color" "uint") &OPTIONAL
       (("findColor" "Boolean") "T"))
      :STATIC NIL)
     (flash:scroll :SWF-NAME "scroll" :RETURN-TYPE "void" :ARGS
      (("x" "int") ("y" "int")) :STATIC NIL)
     (flash:unlock :SWF-NAME "unlock" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL ("changeRect" "flash.geom::Rectangle")) :STATIC NIL)
     (flash:generate-filter-rect :SWF-NAME "generateFilterRect" :RETURN-TYPE
      "flash.geom::Rectangle" :ARGS
      (("sourceRect" "flash.geom::Rectangle")
       ("filter" "flash.filters::BitmapFilter"))
      :STATIC NIL)
     (flash:get-pixel :SWF-NAME "getPixel" :RETURN-TYPE "uint" :ARGS
      (("x" "int") ("y" "int")) :STATIC NIL)
     (flash:copy-channel :SWF-NAME "copyChannel" :RETURN-TYPE "void" :ARGS
      (("sourceBitmapData" "flash.display::BitmapData")
       ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point")
       ("sourceChannel" "uint") ("destChannel" "uint"))
      :STATIC NIL)
     (flash:set-vector :SWF-NAME "setVector" :RETURN-TYPE "void" :ARGS
      (("rect" "flash.geom::Rectangle")
       ("inputVector" "__AS3__.vec::Vector<uint>"))
      :STATIC NIL)
     (flash:draw :SWF-NAME "draw" :RETURN-TYPE "void" :ARGS
      (("source" "flash.display::IBitmapDrawable") &OPTIONAL
       (("matrix" "flash.geom::Matrix") "FALSE")
       ("colorTransform" "flash.geom::ColorTransform") ("blendMode" "String")
       ("clipRect" "flash.geom::Rectangle") ("smoothing" "Boolean"))
      :STATIC NIL)
     (flash:color-transform :SWF-NAME "colorTransform" :RETURN-TYPE "void"
      :ARGS
      (("rect" "flash.geom::Rectangle")
       ("colorTransform" "flash.geom::ColorTransform"))
      :STATIC NIL)
     (flash:fill-rect :SWF-NAME "fillRect" :RETURN-TYPE "void" :ARGS
      (("rect" "flash.geom::Rectangle") ("color" "uint")) :STATIC NIL)
     (flash:apply-filter :SWF-NAME "applyFilter" :RETURN-TYPE "void" :ARGS
      (("sourceBitmapData" "flash.display::BitmapData")
       ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point")
       ("filter" "flash.filters::BitmapFilter"))
      :STATIC NIL)
     (flash:hit-test :SWF-NAME "hitTest" :RETURN-TYPE "Boolean" :ARGS
      (("firstPoint" "flash.geom::Point") ("firstAlphaThreshold" "uint")
       ("secondObject" "Object") &OPTIONAL
       (("secondBitmapDataPoint" "flash.geom::Point") "1")
       ("secondAlphaThreshold" "uint"))
      :STATIC NIL)
     (flash:set-pixel :SWF-NAME "setPixel" :RETURN-TYPE "void" :ARGS
      (("x" "int") ("y" "int") ("color" "uint")) :STATIC NIL)
     (flash:copy-pixels :SWF-NAME "copyPixels" :RETURN-TYPE "void" :ARGS
      (("sourceBitmapData" "flash.display::BitmapData")
       ("sourceRect" "flash.geom::Rectangle") ("destPoint" "flash.geom::Point")
       &OPTIONAL (("alphaBitmapData" "flash.display::BitmapData") "FALSE")
       ("alphaPoint" "flash.geom::Point") ("mergeAlpha" "Boolean"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-field-type (flash:object)
    :swf-name "flash.text::TextFieldType"
    :constants
    ((flash:+text-field-type.dynamic+ :SWF-NAME "DYNAMIC" :TYPE "String" :VALUE
      "dynamic" :STATIC T)
     (flash:+text-field-type.input+ :SWF-NAME "INPUT" :TYPE "String" :VALUE
      "input" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-end-fill (flash:object)
    :swf-name "flash.display::GraphicsEndFill"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.net-filter-event (flash:flash.events.event)
    :swf-name "flash.events::NetFilterEvent"
    :constants
    ()
    :properties
    ((flash::header :SWF-NAME "header" :TYPE "flash.utils::ByteArray" :STATIC
      NIL :ACCESSOR flash:.header)
     (flash::data :SWF-NAME "data" :TYPE "flash.utils::ByteArray" :STATIC NIL
      :ACCESSOR flash:.data))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-triangle-path (flash:object)
    :swf-name "flash.display::GraphicsTrianglePath"
    :constants
    ()
    :properties
    ((flash::uvt-data :SWF-NAME "uvtData" :TYPE "__AS3__.vec::Vector<Number>"
      :STATIC NIL :ACCESSOR flash:.uvt-data)
     (flash::vertices :SWF-NAME "vertices" :TYPE "__AS3__.vec::Vector<Number>"
      :STATIC NIL :ACCESSOR flash:.vertices)
     (flash::indices :SWF-NAME "indices" :TYPE "__AS3__.vec::Vector<int>"
      :STATIC NIL :ACCESSOR flash:.indices)
     (flash::culling :SWF-NAME "culling" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.culling))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.gradient-type (flash:object)
    :swf-name "flash.display::GradientType"
    :constants
    ((flash:+gradient-type.radial+ :SWF-NAME "RADIAL" :TYPE "String" :VALUE
      "radial" :STATIC T)
     (flash:+gradient-type.linear+ :SWF-NAME "LINEAR" :TYPE "String" :VALUE
      "linear" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.url-request-method (flash:object)
    :swf-name "flash.net::URLRequestMethod"
    :constants
    ((flash:+url-request-method.get+ :SWF-NAME "GET" :TYPE "String" :VALUE
      "GET" :STATIC T)
     (flash:+url-request-method.post+ :SWF-NAME "POST" :TYPE "String" :VALUE
      "POST" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.object-input (flash:object)
    :swf-name "flash.utils::ObjectInput"
    :constants
    ()
    :properties
    ((flash::bytes-available :SWF-NAME "bytesAvailable" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.bytes-available)
     (flash::endian :SWF-NAME "endian" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.endian)
     (flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding))
    :methods
    ((flash:read-bytes :SWF-NAME "readBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL (("offset" "uint") "0")
       (("length" "uint") "0"))
      :STATIC NIL)
     (flash:read-utf-bytes :SWF-NAME "readUTFBytes" :RETURN-TYPE "String" :ARGS
      (("length" "uint")) :STATIC NIL)
     (flash:read-int :SWF-NAME "readInt" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:read-utf :SWF-NAME "readUTF" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:read-float :SWF-NAME "readFloat" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:read-multi-byte :SWF-NAME "readMultiByte" :RETURN-TYPE "String"
      :ARGS (("length" "uint") ("charSet" "String")) :STATIC NIL)
     (flash:read-unsigned-short :SWF-NAME "readUnsignedShort" :RETURN-TYPE
      "uint" :ARGS NIL :STATIC NIL)
     (flash:read-object :SWF-NAME "readObject" :RETURN-TYPE "*" :ARGS NIL
      :STATIC NIL)
     (flash:read-unsigned-byte :SWF-NAME "readUnsignedByte" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)
     (flash:read-boolean :SWF-NAME "readBoolean" :RETURN-TYPE "Boolean" :ARGS
      NIL :STATIC NIL)
     (flash:read-double :SWF-NAME "readDouble" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:read-short :SWF-NAME "readShort" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:read-byte :SWF-NAME "readByte" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:read-unsigned-int :SWF-NAME "readUnsignedInt" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.accessibility.accessibility-implementation (flash:object)
    :swf-name "flash.accessibility::AccessibilityImplementation"
    :constants
    ()
    :properties
    ((flash::stub :SWF-NAME "stub" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.stub)
     (flash::errno :SWF-NAME "errno" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.errno))
    :methods
    ((flash:get-acc-default-action :SWF-NAME "get_accDefaultAction"
      :RETURN-TYPE "String" :ARGS (("childID" "uint")) :STATIC NIL)
     (flash:acc-select :SWF-NAME "accSelect" :RETURN-TYPE "void" :ARGS
      (("operation" "uint") ("childID" "uint")) :STATIC NIL)
     (flash:get-acc-state :SWF-NAME "get_accState" :RETURN-TYPE "uint" :ARGS
      (("childID" "uint")) :STATIC NIL)
     (flash:get-child-id-array :SWF-NAME "getChildIDArray" :RETURN-TYPE "Array"
      :ARGS NIL :STATIC NIL)
     (flash:acc-location :SWF-NAME "accLocation" :RETURN-TYPE "*" :ARGS
      (("childID" "uint")) :STATIC NIL)
     (flash:get-acc-role :SWF-NAME "get_accRole" :RETURN-TYPE "uint" :ARGS
      (("childID" "uint")) :STATIC NIL)
     (flash:get-acc-selection :SWF-NAME "get_accSelection" :RETURN-TYPE "Array"
      :ARGS NIL :STATIC NIL)
     (flash:acc-do-default-action :SWF-NAME "accDoDefaultAction" :RETURN-TYPE
      "void" :ARGS (("childID" "uint")) :STATIC NIL)
     (flash:get-acc-value :SWF-NAME "get_accValue" :RETURN-TYPE "String" :ARGS
      (("childID" "uint")) :STATIC NIL)
     (flash:get-acc-focus :SWF-NAME "get_accFocus" :RETURN-TYPE "uint" :ARGS
      NIL :STATIC NIL)
     (flash:get-acc-name :SWF-NAME "get_accName" :RETURN-TYPE "String" :ARGS
      (("childID" "uint")) :STATIC NIL)
     (flash:is-labeled-by :SWF-NAME "isLabeledBy" :RETURN-TYPE "Boolean" :ARGS
      (("labelBounds" "flash.geom::Rectangle")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.camera (flash:flash.events.event-dispatcher)
    :swf-name "flash.media::Camera"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::motion-timeout :SWF-NAME "motionTimeout" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.motion-timeout)
     (flash::activity-level :SWF-NAME "activityLevel" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.activity-level)
     (flash::key-frame-interval :SWF-NAME "keyFrameInterval" :TYPE "int"
      :STATIC NIL :ACCESSOR flash:.key-frame-interval)
     (flash::index :SWF-NAME "index" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.index)
     (flash::bandwidth :SWF-NAME "bandwidth" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.bandwidth)
     (flash::current-fps :SWF-NAME "currentFPS" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.current-fps)
     (flash::motion-level :SWF-NAME "motionLevel" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.motion-level)
     (flash::muted :SWF-NAME "muted" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.muted)
     (flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name)
     (flash::fps :SWF-NAME "fps" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.fps)
     (flash::height :SWF-NAME "height" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::width :SWF-NAME "width" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::loopback :SWF-NAME "loopback" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.loopback)
     (flash::names :SWF-NAME "names" :TYPE "Array" :STATIC T :ACCESSOR
      flash:.names))
    :methods
    ((flash:set-quality :SWF-NAME "setQuality" :RETURN-TYPE "void" :ARGS
      (("bandwidth" "int") ("quality" "int")) :STATIC NIL)
     (flash:set-key-frame-interval :SWF-NAME "setKeyFrameInterval" :RETURN-TYPE
      "void" :ARGS (("keyFrameInterval" "int")) :STATIC NIL)
     (flash:set-cursor :SWF-NAME "setCursor" :RETURN-TYPE "void" :ARGS
      (("value" "Boolean")) :STATIC NIL)
     (flash:set-loopback :SWF-NAME "setLoopback" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL (("compress" "Boolean") "FALSE")) :STATIC NIL)
     (flash:set-motion-level :SWF-NAME "setMotionLevel" :RETURN-TYPE "void"
      :ARGS (("motionLevel" "int") &OPTIONAL (("timeout" "int") "2000"))
      :STATIC NIL)
     (flash:set-mode :SWF-NAME "setMode" :RETURN-TYPE "void" :ARGS
      (("width" "int") ("height" "int") ("fps" "Number") &OPTIONAL
       (("favorArea" "Boolean") "T"))
      :STATIC NIL)
     (flash::camera.get-camera :SWF-NAME "getCamera" :RETURN-TYPE
      "flash.media::Camera" :ARGS (&OPTIONAL ("name" "String")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.font-metrics (flash:object)
    :swf-name "flash.text.engine::FontMetrics"
    :constants
    ()
    :properties
    ((flash::underline-offset :SWF-NAME "underlineOffset" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.underline-offset)
     (flash::subscript-offset :SWF-NAME "subscriptOffset" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.subscript-offset)
     (flash::superscript-offset :SWF-NAME "superscriptOffset" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.superscript-offset)
     (flash::subscript-scale :SWF-NAME "subscriptScale" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.subscript-scale)
     (flash::underline-thickness :SWF-NAME "underlineThickness" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.underline-thickness)
     (flash::strikethrough-offset :SWF-NAME "strikethroughOffset" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.strikethrough-offset)
     (flash::superscript-scale :SWF-NAME "superscriptScale" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.superscript-scale)
     (flash::em-box :SWF-NAME "emBox" :TYPE "flash.geom::Rectangle" :STATIC NIL
      :ACCESSOR flash:.em-box)
     (flash::strikethrough-thickness :SWF-NAME "strikethroughThickness" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.strikethrough-thickness))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.avm1-movie (flash:flash.display.display-object)
    :swf-name "flash.display::AVM1Movie"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:call :SWF-NAME "call" :RETURN-TYPE "*" :ARGS
      (("functionName" "String")) :STATIC NIL)
     (flash:add-callback :SWF-NAME "addCallback" :RETURN-TYPE "void" :ARGS
      (("functionName" "String") ("closure" "Function")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.displacement-map-filter-mode (flash:object)
    :swf-name "flash.filters::DisplacementMapFilterMode"
    :constants
    ((flash:+displacement-map-filter-mode.clamp+ :SWF-NAME "CLAMP" :TYPE
      "String" :VALUE "clamp" :STATIC T)
     (flash:+displacement-map-filter-mode.wrap+ :SWF-NAME "WRAP" :TYPE "String"
      :VALUE "wrap" :STATIC T)
     (flash:+displacement-map-filter-mode.ignore+ :SWF-NAME "IGNORE" :TYPE
      "String" :VALUE "ignore" :STATIC T)
     (flash:+displacement-map-filter-mode.color+ :SWF-NAME "COLOR" :TYPE
      "String" :VALUE "color" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.gradient-glow-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::GradientGlowFilter"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::distance :SWF-NAME "distance" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.distance)
     (flash::knockout :SWF-NAME "knockout" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.knockout)
     (flash::alphas :SWF-NAME "alphas" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.alphas)
     (flash::angle :SWF-NAME "angle" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.angle)
     (flash::blur-y :SWF-NAME "blurY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-y)
     (flash::blur-x :SWF-NAME "blurX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-x)
     (flash::colors :SWF-NAME "colors" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.colors)
     (flash::ratios :SWF-NAME "ratios" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.ratios)
     (flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::strength :SWF-NAME "strength" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.strength))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.escape-multi-byte "flash.utils::escapeMultiByte"
    (("value" "String")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.get-qualified-class-name "flash.utils::getQualifiedClassName"
    (("value" "*")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash:trace "trace"
    NIL "void")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.unescape-multi-byte "flash.utils::unescapeMultiByte"
    (("value" "String")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.get-definition-by-name "flash.utils::getDefinitionByName"
    (("name" "String")) "Object")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.describe-type "flash.utils::describeType"
    (("value" "*")) "XML")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.get-timer "flash.utils::getTimer"
    NIL "int")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.utils.get-qualified-superclass-name "flash.utils::getQualifiedSuperclassName"
    (("value" "*")) "String")
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.joint-style (flash:object)
    :swf-name "flash.display::JointStyle"
    :constants
    ((flash:+joint-style.round+ :SWF-NAME "ROUND" :TYPE "String" :VALUE "round"
      :STATIC T)
     (flash:+joint-style.bevel+ :SWF-NAME "BEVEL" :TYPE "String" :VALUE "bevel"
      :STATIC T)
     (flash:+joint-style.miter+ :SWF-NAME "MITER" :TYPE "String" :VALUE "miter"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.local-connection (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::LocalConnection"
    :constants
    ()
    :properties
    ((flash::client :SWF-NAME "client" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.client)
     (flash::domain :SWF-NAME "domain" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.domain))
    :methods
    ((flash:send :SWF-NAME "send" :RETURN-TYPE "void" :ARGS
      (("connectionName" "String") ("methodName" "String")) :STATIC NIL)
     (flash:allow-domain :SWF-NAME "allowDomain" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:connect :SWF-NAME "connect" :RETURN-TYPE "void" :ARGS
      (("connectionName" "String")) :STATIC NIL)
     (flash:allow-insecure-domain :SWF-NAME "allowInsecureDomain" :RETURN-TYPE
      "void" :ARGS NIL :STATIC NIL)
     (flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.font-weight (flash:object)
    :swf-name "flash.text.engine::FontWeight"
    :constants
    ((flash:+font-weight.normal+ :SWF-NAME "NORMAL" :TYPE "String" :VALUE
      "normal" :STATIC T)
     (flash:+font-weight.bold+ :SWF-NAME "BOLD" :TYPE "String" :VALUE "bold"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.url-request (flash:object)
    :swf-name "flash.net::URLRequest"
    :constants
    ()
    :properties
    ((flash::content-type :SWF-NAME "contentType" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.content-type)
     (flash::request-headers :SWF-NAME "requestHeaders" :TYPE "Array" :STATIC
      NIL :ACCESSOR flash:.request-headers)
     (flash::url :SWF-NAME "url" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.url)
     (flash::data :SWF-NAME "data" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.data)
     (flash::digest :SWF-NAME "digest" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.digest)
     (flash::method :SWF-NAME "method" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.method))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.i-graphics-stroke ()
    :swf-name "flash.display::IGraphicsStroke"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-stroke (flash:object)
    :swf-name "flash.display::GraphicsStroke"
    :constants
    ()
    :properties
    ((flash::miter-limit :SWF-NAME "miterLimit" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.miter-limit)
     (flash::pixel-hinting :SWF-NAME "pixelHinting" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.pixel-hinting)
     (flash::thickness :SWF-NAME "thickness" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.thickness)
     (flash::scale-mode :SWF-NAME "scaleMode" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.scale-mode)
     (flash::joints :SWF-NAME "joints" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.joints)
     (flash::fill :SWF-NAME "fill" :TYPE "flash.display::IGraphicsFill" :STATIC
      NIL :ACCESSOR flash:.fill)
     (flash::caps :SWF-NAME "caps" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.caps))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.xml.xml-tag (flash:object)
    :swf-name "flash.xml::XMLTag"
    :constants
    ()
    :properties
    ((flash::attrs :SWF-NAME "attrs" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.attrs)
     (flash::empty :SWF-NAME "empty" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.empty)
     (flash::type :SWF-NAME "type" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::value :SWF-NAME "value" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.value))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.i-o-error-event (flash:flash.events.error-event)
    :swf-name "flash.events::IOErrorEvent"
    :constants
    ((flash:+i-o-error-event.io-error+ :SWF-NAME "IO_ERROR" :TYPE "String"
      :VALUE "ioError" :STATIC T)
     (flash:+i-o-error-event.verify-error+ :SWF-NAME "VERIFY_ERROR" :TYPE
      "String" :VALUE "verifyError" :STATIC T)
     (flash:+i-o-error-event.network-error+ :SWF-NAME "NETWORK_ERROR" :TYPE
      "String" :VALUE "networkError" :STATIC T)
     (flash:+i-o-error-event.disk-error+ :SWF-NAME "DISK_ERROR" :TYPE "String"
      :VALUE "diskError" :STATIC T))
    :properties
    ()
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.graphic-element (flash:flash.text.engine.content-element)
    :swf-name "flash.text.engine::GraphicElement"
    :constants
    ()
    :properties
    ((flash::element-width :SWF-NAME "elementWidth" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.element-width)
     (flash::graphic :SWF-NAME "graphic" :TYPE "flash.display::DisplayObject"
      :STATIC NIL :ACCESSOR flash:.graphic)
     (flash::element-height :SWF-NAME "elementHeight" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.element-height))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.desktop.clipboard-formats (flash:object)
    :swf-name "flash.desktop::ClipboardFormats"
    :constants
    ((flash:+clipboard-formats.url-format+ :SWF-NAME "URL_FORMAT" :TYPE
      "String" :VALUE "air:url" :STATIC T)
     (flash:+clipboard-formats.file-list-format+ :SWF-NAME "FILE_LIST_FORMAT"
      :TYPE "String" :VALUE "air:file list" :STATIC T)
     (flash:+clipboard-formats.bitmap-format+ :SWF-NAME "BITMAP_FORMAT" :TYPE
      "String" :VALUE "air:bitmap" :STATIC T)
     (flash:+clipboard-formats.rich-text-format+ :SWF-NAME "RICH_TEXT_FORMAT"
      :TYPE "String" :VALUE "air:rtf" :STATIC T)
     (flash:+clipboard-formats.html-format+ :SWF-NAME "HTML_FORMAT" :TYPE
      "String" :VALUE "air:html" :STATIC T)
     (flash:+clipboard-formats.text-format+ :SWF-NAME "TEXT_FORMAT" :TYPE
      "String" :VALUE "air:text" :STATIC T)
     (flash:+clipboard-formats.serialization-prefix+ :SWF-NAME
      "flash.desktop::SERIALIZATION_PREFIX" :TYPE "String" :VALUE
      "air:serialization:" :STATIC T)
     (flash:+clipboard-formats.air-prefix+ :SWF-NAME
      "flash.desktop::AIR_PREFIX" :TYPE "String" :VALUE "air:" :STATIC T)
     (flash:+clipboard-formats.reference-prefix+ :SWF-NAME
      "flash.desktop::REFERENCE_PREFIX" :TYPE "String" :VALUE "air:reference:"
      :STATIC T)
     (flash:+clipboard-formats.flash-prefix+ :SWF-NAME
      "flash.desktop::FLASH_PREFIX" :TYPE "String" :VALUE "flash:" :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.desktop.clipboard-transfer-mode (flash:object)
    :swf-name "flash.desktop::ClipboardTransferMode"
    :constants
    ((flash:+clipboard-transfer-mode.clone-preferred+ :SWF-NAME
      "CLONE_PREFERRED" :TYPE "String" :VALUE "clonePreferred" :STATIC T)
     (flash:+clipboard-transfer-mode.original-only+ :SWF-NAME "ORIGINAL_ONLY"
      :TYPE "String" :VALUE "originalOnly" :STATIC T)
     (flash:+clipboard-transfer-mode.clone-only+ :SWF-NAME "CLONE_ONLY" :TYPE
      "String" :VALUE "cloneOnly" :STATIC T)
     (flash:+clipboard-transfer-mode.original-preferred+ :SWF-NAME
      "ORIGINAL_PREFERRED" :TYPE "String" :VALUE "originalPreferred" :STATIC T))
    :properties
    ()
    :methods
    ())
  (avm2-compiler::declare-swf-class flash::flash.desktop.clipboard (flash:object)
    :swf-name "flash.desktop::Clipboard"
    :constants
    ()
    :properties
    ((flash::formats :SWF-NAME "formats" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.formats)
     (flash::general-clipboard :SWF-NAME "generalClipboard" :TYPE
      "flash.desktop::Clipboard" :STATIC T :ACCESSOR flash:.general-clipboard))
    :methods
    ((flash:set-data-handler :SWF-NAME "setDataHandler" :RETURN-TYPE "Boolean"
      :ARGS
      (("format" "String") ("handler" "Function") &OPTIONAL
       (("serializable" "Boolean") "T"))
      :STATIC NIL)
     (flash:has-format :SWF-NAME "hasFormat" :RETURN-TYPE "Boolean" :ARGS
      (("format" "String")) :STATIC NIL)
     (flash:set-data :SWF-NAME "setData" :RETURN-TYPE "Boolean" :ARGS
      (("format" "String") ("data" "Object") &OPTIONAL
       (("serializable" "Boolean") "T"))
      :STATIC NIL)
     (flash:get-data :SWF-NAME "getData" :RETURN-TYPE "Object" :ARGS
      (("format" "String") &OPTIONAL
       (("transferMode" "String") "originalPreferred"))
      :STATIC NIL)
     (flash:clear-data :SWF-NAME "clearData" :RETURN-TYPE "void" :ARGS
      (("format" "String")) :STATIC NIL)
     (flash:clear :SWF-NAME "clear" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.break-opportunity (flash:object)
    :swf-name "flash.text.engine::BreakOpportunity"
    :constants
    ((flash:+break-opportunity.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE
      "none" :STATIC T)
     (flash:+break-opportunity.any+ :SWF-NAME "ANY" :TYPE "String" :VALUE "any"
      :STATIC T)
     (flash:+break-opportunity.auto+ :SWF-NAME "AUTO" :TYPE "String" :VALUE
      "auto" :STATIC T)
     (flash:+break-opportunity.all+ :SWF-NAME "ALL" :TYPE "String" :VALUE "all"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.gradient-bevel-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::GradientBevelFilter"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::alphas :SWF-NAME "alphas" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.alphas)
     (flash::knockout :SWF-NAME "knockout" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.knockout)
     (flash::distance :SWF-NAME "distance" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.distance)
     (flash::angle :SWF-NAME "angle" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.angle)
     (flash::blur-y :SWF-NAME "blurY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-y)
     (flash::blur-x :SWF-NAME "blurX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-x)
     (flash::colors :SWF-NAME "colors" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.colors)
     (flash::ratios :SWF-NAME "ratios" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.ratios)
     (flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::strength :SWF-NAME "strength" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.strength))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-path-command (flash:object)
    :swf-name "flash.display::GraphicsPathCommand"
    :constants
    ((flash:+graphics-path-command.no-op+ :SWF-NAME "NO_OP" :TYPE "int" :VALUE
      "0" :STATIC T)
     (flash:+graphics-path-command.wide-move-to+ :SWF-NAME "WIDE_MOVE_TO" :TYPE
      "int" :VALUE "4" :STATIC T)
     (flash:+graphics-path-command.wide-line-to+ :SWF-NAME "WIDE_LINE_TO" :TYPE
      "int" :VALUE "5" :STATIC T)
     (flash:+graphics-path-command.curve-to+ :SWF-NAME "CURVE_TO" :TYPE "int"
      :VALUE "3" :STATIC T)
     (flash:+graphics-path-command.move-to+ :SWF-NAME "MOVE_TO" :TYPE "int"
      :VALUE "1" :STATIC T)
     (flash:+graphics-path-command.line-to+ :SWF-NAME "LINE_TO" :TYPE "int"
      :VALUE "2" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.focus-event (flash:flash.events.event)
    :swf-name "flash.events::FocusEvent"
    :constants
    ((flash:+focus-event.focus-in+ :SWF-NAME "FOCUS_IN" :TYPE "String" :VALUE
      "focusIn" :STATIC T)
     (flash:+focus-event.key-focus-change+ :SWF-NAME "KEY_FOCUS_CHANGE" :TYPE
      "String" :VALUE "keyFocusChange" :STATIC T)
     (flash:+focus-event.focus-out+ :SWF-NAME "FOCUS_OUT" :TYPE "String" :VALUE
      "focusOut" :STATIC T)
     (flash:+focus-event.mouse-focus-change+ :SWF-NAME "MOUSE_FOCUS_CHANGE"
      :TYPE "String" :VALUE "mouseFocusChange" :STATIC T))
    :properties
    ((flash::key-code :SWF-NAME "keyCode" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.key-code)
     (flash::related-object :SWF-NAME "relatedObject" :TYPE
      "flash.display::InteractiveObject" :STATIC NIL :ACCESSOR
      flash:.related-object)
     (flash::shift-key :SWF-NAME "shiftKey" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.shift-key)
     (flash::is-related-object-inaccessible :SWF-NAME
      "isRelatedObjectInaccessible" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.is-related-object-inaccessible))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.matrix3-d (flash:object)
    :swf-name "flash.geom::Matrix3D"
    :constants
    ()
    :properties
    ((flash::determinant :SWF-NAME "determinant" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.determinant)
     (flash::raw-data :SWF-NAME "rawData" :TYPE "__AS3__.vec::Vector<Number>"
      :STATIC NIL :ACCESSOR flash:.raw-data)
     (flash::position :SWF-NAME "position" :TYPE "flash.geom::Vector3D" :STATIC
      NIL :ACCESSOR flash:.position))
    :methods
    ((flash:recompose :SWF-NAME "recompose" :RETURN-TYPE "Boolean" :ARGS
      (("components" "__AS3__.vec::Vector<flash.geom::Vector3D>") &OPTIONAL
       (("orientationStyle" "String") "eulerAngles"))
      :STATIC NIL)
     (flash:identity :SWF-NAME "identity" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.geom::Matrix3D" :ARGS
      NIL :STATIC NIL)
     (flash:prepend-scale :SWF-NAME "prependScale" :RETURN-TYPE "void" :ARGS
      (("xScale" "Number") ("yScale" "Number") ("zScale" "Number")) :STATIC NIL)
     (flash:append :SWF-NAME "append" :RETURN-TYPE "void" :ARGS
      (("lhs" "flash.geom::Matrix3D")) :STATIC NIL)
     (flash:append-rotation :SWF-NAME "appendRotation" :RETURN-TYPE "void"
      :ARGS
      (("degrees" "Number") ("axis" "flash.geom::Vector3D") &OPTIONAL
       ("pivotPoint" "flash.geom::Vector3D"))
      :STATIC NIL)
     (flash:append-translation :SWF-NAME "appendTranslation" :RETURN-TYPE
      "void" :ARGS (("x" "Number") ("y" "Number") ("z" "Number")) :STATIC NIL)
     (flash:invert :SWF-NAME "invert" :RETURN-TYPE "Boolean" :ARGS NIL :STATIC
      NIL)
     (flash:interpolate-to :SWF-NAME "interpolateTo" :RETURN-TYPE "void" :ARGS
      (("toMat" "flash.geom::Matrix3D") ("percent" "Number")) :STATIC NIL)
     (flash:decompose :SWF-NAME "decompose" :RETURN-TYPE
      "__AS3__.vec::Vector<flash.geom::Vector3D>" :ARGS
      (&OPTIONAL (("orientationStyle" "String") "eulerAngles")) :STATIC NIL)
     (flash:append-scale :SWF-NAME "appendScale" :RETURN-TYPE "void" :ARGS
      (("xScale" "Number") ("yScale" "Number") ("zScale" "Number")) :STATIC NIL)
     (flash:transform-vector :SWF-NAME "transformVector" :RETURN-TYPE
      "flash.geom::Vector3D" :ARGS (("v" "flash.geom::Vector3D")) :STATIC NIL)
     (flash:prepend :SWF-NAME "prepend" :RETURN-TYPE "void" :ARGS
      (("rhs" "flash.geom::Matrix3D")) :STATIC NIL)
     (flash:prepend-rotation :SWF-NAME "prependRotation" :RETURN-TYPE "void"
      :ARGS
      (("degrees" "Number") ("axis" "flash.geom::Vector3D") &OPTIONAL
       ("pivotPoint" "flash.geom::Vector3D"))
      :STATIC NIL)
     (flash:transform-vectors :SWF-NAME "transformVectors" :RETURN-TYPE "void"
      :ARGS
      (("vin" "__AS3__.vec::Vector<Number>")
       ("vout" "__AS3__.vec::Vector<Number>"))
      :STATIC NIL)
     (flash:point-at :SWF-NAME "pointAt" :RETURN-TYPE "void" :ARGS
      (("pos" "flash.geom::Vector3D") &OPTIONAL ("at" "flash.geom::Vector3D")
       ("up" "flash.geom::Vector3D"))
      :STATIC NIL)
     (flash:delta-transform-vector :SWF-NAME "deltaTransformVector"
      :RETURN-TYPE "flash.geom::Vector3D" :ARGS (("v" "flash.geom::Vector3D"))
      :STATIC NIL)
     (flash:prepend-translation :SWF-NAME "prependTranslation" :RETURN-TYPE
      "void" :ARGS (("x" "Number") ("y" "Number") ("z" "Number")) :STATIC NIL)
     (flash:transpose :SWF-NAME "transpose" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash::matrix3-d.interpolate :SWF-NAME "interpolate" :RETURN-TYPE
      "flash.geom::Matrix3D" :ARGS
      (("thisMat" "flash.geom::Matrix3D") ("toMat" "flash.geom::Matrix3D")
       ("percent" "Number"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-rotation (flash:object)
    :swf-name "flash.text.engine::TextRotation"
    :constants
    ((flash:+text-rotation.auto+ :SWF-NAME "AUTO" :TYPE "String" :VALUE "auto"
      :STATIC T)
     (flash:+text-rotation.rotate-0+ :SWF-NAME "ROTATE_0" :TYPE "String" :VALUE
      "rotate0" :STATIC T)
     (flash:+text-rotation.rotate-90+ :SWF-NAME "ROTATE_90" :TYPE "String"
      :VALUE "rotate90" :STATIC T)
     (flash:+text-rotation.rotate-270+ :SWF-NAME "ROTATE_270" :TYPE "String"
      :VALUE "rotate270" :STATIC T)
     (flash:+text-rotation.rotate-180+ :SWF-NAME "ROTATE_180" :TYPE "String"
      :VALUE "rotate180" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.sample-data-event (flash:flash.events.event)
    :swf-name "flash.events::SampleDataEvent"
    :constants
    ((flash:+sample-data-event.sample-data+ :SWF-NAME "SAMPLE_DATA" :TYPE
      "String" :VALUE "sampleData" :STATIC T))
    :properties
    ((flash::data :SWF-NAME "data" :TYPE "flash.utils::ByteArray" :STATIC NIL
      :ACCESSOR flash:.data)
     (flash::position :SWF-NAME "position" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.position))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.bitmap-data-channel (flash:object)
    :swf-name "flash.display::BitmapDataChannel"
    :constants
    ((flash:+bitmap-data-channel.alpha+ :SWF-NAME "ALPHA" :TYPE "uint" :VALUE
      "8" :STATIC T)
     (flash:+bitmap-data-channel.blue+ :SWF-NAME "BLUE" :TYPE "uint" :VALUE "4"
      :STATIC T)
     (flash:+bitmap-data-channel.green+ :SWF-NAME "GREEN" :TYPE "uint" :VALUE
      "2" :STATIC T)
     (flash:+bitmap-data-channel.red+ :SWF-NAME "RED" :TYPE "uint" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.vector3-d (flash:object)
    :swf-name "flash.geom::Vector3D"
    :constants
    ((flash:+vector3-d.x-axis+ :SWF-NAME "X_AXIS" :TYPE "flash.geom::Vector3D"
      :VALUE "NIL" :STATIC T)
     (flash:+vector3-d.y-axis+ :SWF-NAME "Y_AXIS" :TYPE "flash.geom::Vector3D"
      :VALUE "NIL" :STATIC T)
     (flash:+vector3-d.z-axis+ :SWF-NAME "Z_AXIS" :TYPE "flash.geom::Vector3D"
      :VALUE "NIL" :STATIC T))
    :properties
    ((flash::z :SWF-NAME "z" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.z)
     (flash::y :SWF-NAME "y" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.y)
     (flash::x :SWF-NAME "x" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.x)
     (flash::w :SWF-NAME "w" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.w)
     (flash::length :SWF-NAME "length" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.length)
     (flash::length-squared :SWF-NAME "lengthSquared" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.length-squared))
    :methods
    ((flash:equals :SWF-NAME "equals" :RETURN-TYPE "Boolean" :ARGS
      (("toCompare" "flash.geom::Vector3D") &OPTIONAL
       (("allFour" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.geom::Vector3D" :ARGS
      NIL :STATIC NIL)
     (flash:normalize :SWF-NAME "normalize" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:subtract :SWF-NAME "subtract" :RETURN-TYPE "flash.geom::Vector3D"
      :ARGS (("a" "flash.geom::Vector3D")) :STATIC NIL)
     (flash:increment-by :SWF-NAME "incrementBy" :RETURN-TYPE "void" :ARGS
      (("a" "flash.geom::Vector3D")) :STATIC NIL)
     (flash:cross-product :SWF-NAME "crossProduct" :RETURN-TYPE
      "flash.geom::Vector3D" :ARGS (("a" "flash.geom::Vector3D")) :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:decrement-by :SWF-NAME "decrementBy" :RETURN-TYPE "void" :ARGS
      (("a" "flash.geom::Vector3D")) :STATIC NIL)
     (flash:scale-by :SWF-NAME "scaleBy" :RETURN-TYPE "void" :ARGS
      (("s" "Number")) :STATIC NIL)
     (flash:near-equals :SWF-NAME "nearEquals" :RETURN-TYPE "Boolean" :ARGS
      (("toCompare" "flash.geom::Vector3D") ("tolerance" "Number") &OPTIONAL
       (("allFour" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:dot-product :SWF-NAME "dotProduct" :RETURN-TYPE "Number" :ARGS
      (("a" "flash.geom::Vector3D")) :STATIC NIL)
     (flash:add :SWF-NAME "add" :RETURN-TYPE "flash.geom::Vector3D" :ARGS
      (("a" "flash.geom::Vector3D")) :STATIC NIL)
     (flash:negate :SWF-NAME "negate" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:project :SWF-NAME "project" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash::vector3-d.angle-between :SWF-NAME "angleBetween" :RETURN-TYPE
      "Number" :ARGS
      (("a" "flash.geom::Vector3D") ("b" "flash.geom::Vector3D")) :STATIC T)
     (flash::vector3-d.distance :SWF-NAME "distance" :RETURN-TYPE "Number"
      :ARGS (("pt1" "flash.geom::Vector3D") ("pt2" "flash.geom::Vector3D"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.interactive-object (flash:flash.display.display-object)
    :swf-name "flash.display::InteractiveObject"
    :constants
    ()
    :properties
    ((flash::tab-index :SWF-NAME "tabIndex" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.tab-index)
     (flash::mouse-enabled :SWF-NAME "mouseEnabled" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.mouse-enabled)
     (flash::context-menu :SWF-NAME "contextMenu" :TYPE "flash.ui::ContextMenu"
      :STATIC NIL :ACCESSOR flash:.context-menu)
     (flash::tab-enabled :SWF-NAME "tabEnabled" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.tab-enabled)
     (flash::double-click-enabled :SWF-NAME "doubleClickEnabled" :TYPE
      "Boolean" :STATIC NIL :ACCESSOR flash:.double-click-enabled)
     (flash::focus-rect :SWF-NAME "focusRect" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.focus-rect)
     (flash::accessibility-implementation :SWF-NAME
      "accessibilityImplementation" :TYPE
      "flash.accessibility::AccessibilityImplementation" :STATIC NIL :ACCESSOR
      flash:.accessibility-implementation))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.context-menu (flash:flash.events.event-dispatcher)
    :swf-name "flash.ui::ContextMenu"
    :constants
    ()
    :properties
    ((flash::link :SWF-NAME "link" :TYPE "flash.net::URLRequest" :STATIC NIL
      :ACCESSOR flash:.link)
     (flash::clipboard-menu :SWF-NAME "clipboardMenu" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.clipboard-menu)
     (flash::custom-items :SWF-NAME "customItems" :TYPE "Array" :STATIC NIL
      :ACCESSOR flash:.custom-items)
     (flash::clipboard-items :SWF-NAME "clipboardItems" :TYPE
      "flash.ui::ContextMenuClipboardItems" :STATIC NIL :ACCESSOR
      flash:.clipboard-items)
     (flash::built-in-items :SWF-NAME "builtInItems" :TYPE
      "flash.ui::ContextMenuBuiltInItems" :STATIC NIL :ACCESSOR
      flash:.built-in-items))
    :methods
    ((flash:hide-built-in-items :SWF-NAME "hideBuiltInItems" :RETURN-TYPE
      "void" :ARGS NIL :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.ui::ContextMenu" :ARGS
      NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.kerning (flash:object)
    :swf-name "flash.text.engine::Kerning"
    :constants
    ((flash:+kerning.off+ :SWF-NAME "OFF" :TYPE "String" :VALUE "off" :STATIC T)
     (flash:+kerning.on+ :SWF-NAME "ON" :TYPE "String" :VALUE "on" :STATIC T)
     (flash:+kerning.auto+ :SWF-NAME "AUTO" :TYPE "String" :VALUE "auto"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.loader-info (flash:flash.events.event-dispatcher)
    :swf-name "flash.display::LoaderInfo"
    :constants
    ()
    :properties
    ((flash::child-allows-parent :SWF-NAME "childAllowsParent" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.child-allows-parent)
     (flash::shared-events :SWF-NAME "sharedEvents" :TYPE
      "flash.events::EventDispatcher" :STATIC NIL :ACCESSOR
      flash:.shared-events)
     (flash::loader-url :SWF-NAME "loaderURL" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.loader-url)
     (flash::content :SWF-NAME "content" :TYPE "flash.display::DisplayObject"
      :STATIC NIL :ACCESSOR flash:.content)
     (flash::loader :SWF-NAME "loader" :TYPE "flash.display::Loader" :STATIC
      NIL :ACCESSOR flash:.loader)
     (flash::bytes-total :SWF-NAME "bytesTotal" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-total)
     (flash::action-script-version :SWF-NAME "actionScriptVersion" :TYPE "uint"
      :STATIC NIL :ACCESSOR flash:.action-script-version)
     (flash::swf-version :SWF-NAME "swfVersion" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.swf-version)
     (flash::application-domain :SWF-NAME "applicationDomain" :TYPE
      "flash.system::ApplicationDomain" :STATIC NIL :ACCESSOR
      flash:.application-domain)
     (flash::content-type :SWF-NAME "contentType" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.content-type)
     (flash::same-domain :SWF-NAME "sameDomain" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.same-domain)
     (flash::bytes-loaded :SWF-NAME "bytesLoaded" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-loaded)
     (flash::url :SWF-NAME "url" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.url)
     (flash::frame-rate :SWF-NAME "frameRate" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.frame-rate)
     (flash::bytes :SWF-NAME "bytes" :TYPE "flash.utils::ByteArray" :STATIC NIL
      :ACCESSOR flash:.bytes)
     (flash::parameters :SWF-NAME "parameters" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.parameters)
     (flash::parent-allows-child :SWF-NAME "parentAllowsChild" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.parent-allows-child)
     (flash::height :SWF-NAME "height" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::width :SWF-NAME "width" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.width))
    :methods
    ((flash:dispatch-event :SWF-NAME "dispatchEvent" :RETURN-TYPE "Boolean"
      :ARGS (("event" "flash.events::Event")) :STATIC NIL)
     (flash::loader-info.get-loader-info-by-definition :SWF-NAME
      "getLoaderInfoByDefinition" :RETURN-TYPE "flash.display::LoaderInfo"
      :ARGS (("object" "Object")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shape (flash:flash.display.display-object)
    :swf-name "flash.display::Shape"
    :constants
    ()
    :properties
    ((flash::graphics :SWF-NAME "graphics" :TYPE "flash.display::Graphics"
      :STATIC NIL :ACCESSOR flash:.graphics))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.sync-event (flash:flash.events.event)
    :swf-name "flash.events::SyncEvent"
    :constants
    ((flash:+sync-event.sync+ :SWF-NAME "SYNC" :TYPE "String" :VALUE "sync"
      :STATIC T))
    :properties
    ((flash::change-list :SWF-NAME "changeList" :TYPE "Array" :STATIC NIL
      :ACCESSOR flash:.change-list))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.bevel-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::BevelFilter"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::distance :SWF-NAME "distance" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.distance)
     (flash::shadow-alpha :SWF-NAME "shadowAlpha" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.shadow-alpha)
     (flash::shadow-color :SWF-NAME "shadowColor" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.shadow-color)
     (flash::angle :SWF-NAME "angle" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.angle)
     (flash::blur-y :SWF-NAME "blurY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-y)
     (flash::blur-x :SWF-NAME "blurX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-x)
     (flash::highlight-color :SWF-NAME "highlightColor" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.highlight-color)
     (flash::highlight-alpha :SWF-NAME "highlightAlpha" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.highlight-alpha)
     (flash::knockout :SWF-NAME "knockout" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.knockout)
     (flash::strength :SWF-NAME "strength" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.strength))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.shader-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::ShaderFilter"
    :constants
    ()
    :properties
    ((flash::bottom-extension :SWF-NAME "bottomExtension" :TYPE "int" :STATIC
      NIL :ACCESSOR flash:.bottom-extension)
     (flash::left-extension :SWF-NAME "leftExtension" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.left-extension)
     (flash::top-extension :SWF-NAME "topExtension" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.top-extension)
     (flash::shader :SWF-NAME "shader" :TYPE "flash.display::Shader" :STATIC
      NIL :ACCESSOR flash:.shader)
     (flash::right-extension :SWF-NAME "rightExtension" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.right-extension))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.rectangle (flash:object)
    :swf-name "flash.geom::Rectangle"
    :constants
    ()
    :properties
    ((flash::top-left :SWF-NAME "topLeft" :TYPE "flash.geom::Point" :STATIC NIL
      :ACCESSOR flash:.top-left)
     (flash::y :SWF-NAME "y" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.y)
     (flash::x :SWF-NAME "x" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.x)
     (flash::bottom-right :SWF-NAME "bottomRight" :TYPE "flash.geom::Point"
      :STATIC NIL :ACCESSOR flash:.bottom-right)
     (flash::bottom :SWF-NAME "bottom" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.bottom)
     (flash::height :SWF-NAME "height" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::right :SWF-NAME "right" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.right)
     (flash::top :SWF-NAME "top" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.top)
     (flash::left :SWF-NAME "left" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.left)
     (flash::width :SWF-NAME "width" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::size :SWF-NAME "size" :TYPE "flash.geom::Point" :STATIC NIL
      :ACCESSOR flash:.size))
    :methods
    ((flash:offset-point :SWF-NAME "offsetPoint" :RETURN-TYPE "void" :ARGS
      (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:intersects :SWF-NAME "intersects" :RETURN-TYPE "Boolean" :ARGS
      (("toIntersect" "flash.geom::Rectangle")) :STATIC NIL)
     (flash:contains :SWF-NAME "contains" :RETURN-TYPE "Boolean" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:contains-rect :SWF-NAME "containsRect" :RETURN-TYPE "Boolean" :ARGS
      (("rect" "flash.geom::Rectangle")) :STATIC NIL)
     (flash:inflate :SWF-NAME "inflate" :RETURN-TYPE "void" :ARGS
      (("dx" "Number") ("dy" "Number")) :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.geom::Rectangle" :ARGS
      NIL :STATIC NIL)
     (flash:intersection :SWF-NAME "intersection" :RETURN-TYPE
      "flash.geom::Rectangle" :ARGS (("toIntersect" "flash.geom::Rectangle"))
      :STATIC NIL)
     (flash:equals :SWF-NAME "equals" :RETURN-TYPE "Boolean" :ARGS
      (("toCompare" "flash.geom::Rectangle")) :STATIC NIL)
     (flash:offset :SWF-NAME "offset" :RETURN-TYPE "void" :ARGS
      (("dx" "Number") ("dy" "Number")) :STATIC NIL)
     (flash:union :SWF-NAME "union" :RETURN-TYPE "flash.geom::Rectangle" :ARGS
      (("toUnion" "flash.geom::Rectangle")) :STATIC NIL)
     (flash:set-empty :SWF-NAME "setEmpty" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:inflate-point :SWF-NAME "inflatePoint" :RETURN-TYPE "void" :ARGS
      (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:is-empty :SWF-NAME "isEmpty" :RETURN-TYPE "Boolean" :ARGS NIL
      :STATIC NIL)
     (flash:contains-point :SWF-NAME "containsPoint" :RETURN-TYPE "Boolean"
      :ARGS (("point" "flash.geom::Point")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.swf-version (flash:object)
    :swf-name "flash.display::SWFVersion"
    :constants
    ((flash:+swf-version.flash9+ :SWF-NAME "FLASH9" :TYPE "uint" :VALUE "9"
      :STATIC T)
     (flash:+swf-version.flash10+ :SWF-NAME "FLASH10" :TYPE "uint" :VALUE "10"
      :STATIC T)
     (flash:+swf-version.flash2+ :SWF-NAME "FLASH2" :TYPE "uint" :VALUE "2"
      :STATIC T)
     (flash:+swf-version.flash8+ :SWF-NAME "FLASH8" :TYPE "uint" :VALUE "8"
      :STATIC T)
     (flash:+swf-version.flash6+ :SWF-NAME "FLASH6" :TYPE "uint" :VALUE "6"
      :STATIC T)
     (flash:+swf-version.flash4+ :SWF-NAME "FLASH4" :TYPE "uint" :VALUE "4"
      :STATIC T)
     (flash:+swf-version.flash7+ :SWF-NAME "FLASH7" :TYPE "uint" :VALUE "7"
      :STATIC T)
     (flash:+swf-version.flash5+ :SWF-NAME "FLASH5" :TYPE "uint" :VALUE "5"
      :STATIC T)
     (flash:+swf-version.flash3+ :SWF-NAME "FLASH3" :TYPE "uint" :VALUE "3"
      :STATIC T)
     (flash:+swf-version.flash1+ :SWF-NAME "FLASH1" :TYPE "uint" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.responder (flash:object)
    :swf-name "flash.net::Responder"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.capabilities (flash:object)
    :swf-name "flash.system::Capabilities"
    :constants
    ()
    :properties
    ((flash::is-embedded-in-acrobat :SWF-NAME "isEmbeddedInAcrobat" :TYPE
      "Boolean" :STATIC T :ACCESSOR flash:.is-embedded-in-acrobat)
     (flash::player-type :SWF-NAME "playerType" :TYPE "String" :STATIC T
      :ACCESSOR flash:.player-type)
     (flash::local-file-read-disable :SWF-NAME "localFileReadDisable" :TYPE
      "Boolean" :STATIC T :ACCESSOR flash:.local-file-read-disable)
     (flash::server-string :SWF-NAME "serverString" :TYPE "String" :STATIC T
      :ACCESSOR flash:.server-string)
     (flash::has-streaming-video :SWF-NAME "hasStreamingVideo" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.has-streaming-video)
     (flash::is-debugger :SWF-NAME "isDebugger" :TYPE "Boolean" :STATIC T
      :ACCESSOR flash:.is-debugger)
     (flash::screen-resolution-x :SWF-NAME "screenResolutionX" :TYPE "Number"
      :STATIC T :ACCESSOR flash:.screen-resolution-x)
     (flash::pixel-aspect-ratio :SWF-NAME "pixelAspectRatio" :TYPE "Number"
      :STATIC T :ACCESSOR flash:.pixel-aspect-ratio)
     (flash::av-hardware-disable :SWF-NAME "avHardwareDisable" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.av-hardware-disable)
     (flash::screen-resolution-y :SWF-NAME "screenResolutionY" :TYPE "Number"
      :STATIC T :ACCESSOR flash:.screen-resolution-y)
     (flash::version :SWF-NAME "version" :TYPE "String" :STATIC T :ACCESSOR
      flash:.version)
     (flash::os :SWF-NAME "os" :TYPE "String" :STATIC T :ACCESSOR flash:.os)
     (flash::%internal :SWF-NAME "_internal" :TYPE "uint" :STATIC T :ACCESSOR
      flash:.%internal)
     (flash::has-screen-playback :SWF-NAME "hasScreenPlayback" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.has-screen-playback)
     (flash::has-audio-encoder :SWF-NAME "hasAudioEncoder" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.has-audio-encoder)
     (flash::language :SWF-NAME "language" :TYPE "String" :STATIC T :ACCESSOR
      flash:.language)
     (flash::screen-color :SWF-NAME "screenColor" :TYPE "String" :STATIC T
      :ACCESSOR flash:.screen-color)
     (flash::has-audio :SWF-NAME "hasAudio" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.has-audio)
     (flash::has-video-encoder :SWF-NAME "hasVideoEncoder" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.has-video-encoder)
     (flash::manufacturer :SWF-NAME "manufacturer" :TYPE "String" :STATIC T
      :ACCESSOR flash:.manufacturer)
     (flash::has-embedded-video :SWF-NAME "hasEmbeddedVideo" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.has-embedded-video)
     (flash::has-mp3 :SWF-NAME "hasMP3" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.has-mp3)
     (flash::has-accessibility :SWF-NAME "hasAccessibility" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.has-accessibility)
     (flash::screen-dpi :SWF-NAME "screenDPI" :TYPE "Number" :STATIC T
      :ACCESSOR flash:.screen-dpi)
     (flash::has-printing :SWF-NAME "hasPrinting" :TYPE "Boolean" :STATIC T
      :ACCESSOR flash:.has-printing)
     (flash::has-streaming-audio :SWF-NAME "hasStreamingAudio" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.has-streaming-audio)
     (flash::max-level-idc :SWF-NAME "maxLevelIDC" :TYPE "String" :STATIC T
      :ACCESSOR flash:.max-level-idc)
     (flash::has-ime :SWF-NAME "hasIME" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.has-ime)
     (flash::has-screen-broadcast :SWF-NAME "hasScreenBroadcast" :TYPE
      "Boolean" :STATIC T :ACCESSOR flash:.has-screen-broadcast)
     (flash::has-tls :SWF-NAME "hasTLS" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.has-tls))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.net-stream-info (flash:object)
    :swf-name "flash.net::NetStreamInfo"
    :constants
    ()
    :properties
    ((flash::byte-count :SWF-NAME "byteCount" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.byte-count)
     (flash::audio-buffer-byte-length :SWF-NAME "audioBufferByteLength" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.audio-buffer-byte-length)
     (flash::video-buffer-length :SWF-NAME "videoBufferLength" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.video-buffer-length)
     (flash::audio-buffer-length :SWF-NAME "audioBufferLength" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.audio-buffer-length)
     (flash::data-byte-count :SWF-NAME "dataByteCount" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.data-byte-count)
     (flash::max-bytes-per-second :SWF-NAME "maxBytesPerSecond" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.max-bytes-per-second)
     (flash::playback-bytes-per-second :SWF-NAME "playbackBytesPerSecond" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.playback-bytes-per-second)
     (flash::data-buffer-byte-length :SWF-NAME "dataBufferByteLength" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.data-buffer-byte-length)
     (flash::audio-bytes-per-second :SWF-NAME "audioBytesPerSecond" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.audio-bytes-per-second)
     (flash::audio-byte-count :SWF-NAME "audioByteCount" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.audio-byte-count)
     (flash::srtt :SWF-NAME "SRTT" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.srtt)
     (flash::video-byte-count :SWF-NAME "videoByteCount" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.video-byte-count)
     (flash::video-bytes-per-second :SWF-NAME "videoBytesPerSecond" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.video-bytes-per-second)
     (flash::current-bytes-per-second :SWF-NAME "currentBytesPerSecond" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.current-bytes-per-second)
     (flash::audio-loss-rate :SWF-NAME "audioLossRate" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.audio-loss-rate)
     (flash::data-buffer-length :SWF-NAME "dataBufferLength" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.data-buffer-length)
     (flash::data-bytes-per-second :SWF-NAME "dataBytesPerSecond" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.data-bytes-per-second)
     (flash::dropped-frames :SWF-NAME "droppedFrames" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.dropped-frames)
     (flash::video-buffer-byte-length :SWF-NAME "videoBufferByteLength" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.video-buffer-byte-length))
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-element (flash:flash.text.engine.content-element)
    :swf-name "flash.text.engine::TextElement"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:replace-text :SWF-NAME "replaceText" :RETURN-TYPE "void" :ARGS
      (("beginIndex" "int") ("endIndex" "int") ("newText" "String")) :STATIC
      NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.i-dynamic-property-output ()
    :swf-name "flash.net::IDynamicPropertyOutput"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.justification-style (flash:object)
    :swf-name "flash.text.engine::JustificationStyle"
    :constants
    ((flash:+justification-style.push-out-only+ :SWF-NAME "PUSH_OUT_ONLY" :TYPE
      "String" :VALUE "pushOutOnly" :STATIC T)
     (flash:+justification-style.prioritize-least-adjustment+ :SWF-NAME
      "PRIORITIZE_LEAST_ADJUSTMENT" :TYPE "String" :VALUE
      "prioritizeLeastAdjustment" :STATIC T)
     (flash:+justification-style.push-in-kinsoku+ :SWF-NAME "PUSH_IN_KINSOKU"
      :TYPE "String" :VALUE "pushInKinsoku" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.stage-display-state (flash:object)
    :swf-name "flash.display::StageDisplayState"
    :constants
    ((flash:+stage-display-state.normal+ :SWF-NAME "NORMAL" :TYPE "String"
      :VALUE "normal" :STATIC T)
     (flash:+stage-display-state.full-screen+ :SWF-NAME "FULL_SCREEN" :TYPE
      "String" :VALUE "fullScreen" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::adobe.utils.product-manager (flash:flash.events.event-dispatcher)
    :swf-name "adobe.utils::ProductManager"
    :constants
    ()
    :properties
    ((flash::running :SWF-NAME "running" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.running)
     (flash::installed-version :SWF-NAME "installedVersion" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.installed-version)
     (flash::installed :SWF-NAME "installed" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.installed))
    :methods
    ((flash:download :SWF-NAME "download" :RETURN-TYPE "Boolean" :ARGS
      (&OPTIONAL ("caption" "String") ("fileName" "String")
       ("pathElements" "Array"))
      :STATIC NIL)
     (flash:launch :SWF-NAME "launch" :RETURN-TYPE "Boolean" :ARGS
      (&OPTIONAL ("parameters" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.frame-label (flash:object)
    :swf-name "flash.display::FrameLabel"
    :constants
    ()
    :properties
    ((flash::frame :SWF-NAME "frame" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.frame)
     (flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.element-format (flash:object)
    :swf-name "flash.text.engine::ElementFormat"
    :constants
    ()
    :properties
    ((flash::digit-case :SWF-NAME "digitCase" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.digit-case)
     (flash::typographic-case :SWF-NAME "typographicCase" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.typographic-case)
     (flash::ligature-level :SWF-NAME "ligatureLevel" :TYPE "String" :STATIC
      NIL :ACCESSOR flash:.ligature-level)
     (flash::tracking-left :SWF-NAME "trackingLeft" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.tracking-left)
     (flash::font-size :SWF-NAME "fontSize" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.font-size)
     (flash::font-description :SWF-NAME "fontDescription" :TYPE
      "flash.text.engine::FontDescription" :STATIC NIL :ACCESSOR
      flash:.font-description)
     (flash::tracking-right :SWF-NAME "trackingRight" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.tracking-right)
     (flash::color :SWF-NAME "color" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.color)
     (flash::locked :SWF-NAME "locked" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.locked)
     (flash::locale :SWF-NAME "locale" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.locale)
     (flash::alpha :SWF-NAME "alpha" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.alpha)
     (flash::digit-width :SWF-NAME "digitWidth" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.digit-width)
     (flash::break-opportunity :SWF-NAME "breakOpportunity" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.break-opportunity)
     (flash::kerning :SWF-NAME "kerning" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.kerning)
     (flash::text-rotation :SWF-NAME "textRotation" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.text-rotation)
     (flash::alignment-baseline :SWF-NAME "alignmentBaseline" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.alignment-baseline)
     (flash::dominant-baseline :SWF-NAME "dominantBaseline" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.dominant-baseline)
     (flash::baseline-shift :SWF-NAME "baselineShift" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.baseline-shift))
    :methods
    ((flash:get-font-metrics :SWF-NAME "getFontMetrics" :RETURN-TYPE
      "flash.text.engine::FontMetrics" :ARGS NIL :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE
      "flash.text.engine::ElementFormat" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shader-parameter (flash:object)
    :swf-name "flash.display::ShaderParameter"
    :constants
    ()
    :properties
    ((flash::index :SWF-NAME "index" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.index)
     (flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::value :SWF-NAME "value" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.value))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shader-job (flash:flash.events.event-dispatcher)
    :swf-name "flash.display::ShaderJob"
    :constants
    ()
    :properties
    ((flash::target :SWF-NAME "target" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.target)
     (flash::progress :SWF-NAME "progress" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.progress)
     (flash::height :SWF-NAME "height" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::width :SWF-NAME "width" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::shader :SWF-NAME "shader" :TYPE "flash.display::Shader" :STATIC
      NIL :ACCESSOR flash:.shader))
    :methods
    ((flash:cancel :SWF-NAME "cancel" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:start :SWF-NAME "start" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL (("waitForCompletion" "Boolean") "FALSE")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.color-correction (flash:object)
    :swf-name "flash.display::ColorCorrection"
    :constants
    ((flash:+color-correction.off+ :SWF-NAME "OFF" :TYPE "String" :VALUE "off"
      :STATIC T)
     (flash:+color-correction.on+ :SWF-NAME "ON" :TYPE "String" :VALUE "on"
      :STATIC T)
     (flash:+color-correction.default+ :SWF-NAME "DEFAULT" :TYPE "String"
      :VALUE "default" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-format-align (flash:object)
    :swf-name "flash.text::TextFormatAlign"
    :constants
    ((flash:+text-format-align.right+ :SWF-NAME "RIGHT" :TYPE "String" :VALUE
      "right" :STATIC T)
     (flash:+text-format-align.left+ :SWF-NAME "LEFT" :TYPE "String" :VALUE
      "left" :STATIC T)
     (flash:+text-format-align.center+ :SWF-NAME "CENTER" :TYPE "String" :VALUE
      "center" :STATIC T)
     (flash:+text-format-align.justify+ :SWF-NAME "JUSTIFY" :TYPE "String"
      :VALUE "justify" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.dictionary (flash:object)
    :swf-name "flash.utils::Dictionary"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.shared-object (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::SharedObject"
    :constants
    ()
    :properties
    ((flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding)
     (flash::client :SWF-NAME "client" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.client)
     (flash::data :SWF-NAME "data" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.data)
     (flash::size :SWF-NAME "size" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.size)
     (flash::default-object-encoding :SWF-NAME "defaultObjectEncoding" :TYPE
      "uint" :STATIC T :ACCESSOR flash:.default-object-encoding))
    :methods
    ((flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:set-property :SWF-NAME "setProperty" :RETURN-TYPE "void" :ARGS
      (("propertyName" "String") &OPTIONAL ("value" "Object")) :STATIC NIL)
     (flash:connect :SWF-NAME "connect" :RETURN-TYPE "void" :ARGS
      (("myConnection" "flash.net::NetConnection") &OPTIONAL
       ("params" "String"))
      :STATIC NIL)
     (flash:set-dirty :SWF-NAME "setDirty" :RETURN-TYPE "void" :ARGS
      (("propertyName" "String")) :STATIC NIL)
     (flash:clear :SWF-NAME "clear" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:send :SWF-NAME "send" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:flush :SWF-NAME "flush" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("minDiskSpace" "int") "0")) :STATIC NIL)
     (flash::shared-object.get-remote :SWF-NAME "getRemote" :RETURN-TYPE
      "flash.net::SharedObject" :ARGS
      (("name" "String") &OPTIONAL (("remotePath" "String") "FALSE")
       (("persistence" "Object") "FALSE") ("secure" "Boolean"))
      :STATIC T)
     (flash::shared-object.delete-all :SWF-NAME "deleteAll" :RETURN-TYPE "int"
      :ARGS (("url" "String")) :STATIC T)
     (flash::shared-object.get-local :SWF-NAME "getLocal" :RETURN-TYPE
      "flash.net::SharedObject" :ARGS
      (("name" "String") &OPTIONAL (("localPath" "String") "FALSE")
       ("secure" "Boolean"))
      :STATIC T)
     (flash::shared-object.get-disk-usage :SWF-NAME "getDiskUsage" :RETURN-TYPE
      "int" :ARGS (("url" "String")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.socket (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::Socket"
    :constants
    ()
    :properties
    ((flash::timeout :SWF-NAME "timeout" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.timeout)
     (flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding)
     (flash::bytes-available :SWF-NAME "bytesAvailable" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.bytes-available)
     (flash::endian :SWF-NAME "endian" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.endian)
     (flash::connected :SWF-NAME "connected" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.connected))
    :methods
    ((flash:read-int :SWF-NAME "readInt" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:read-bytes :SWF-NAME "readBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL (("offset" "uint") "0")
       (("length" "uint") "0"))
      :STATIC NIL)
     (flash:read-multi-byte :SWF-NAME "readMultiByte" :RETURN-TYPE "String"
      :ARGS (("length" "uint") ("charSet" "String")) :STATIC NIL)
     (flash:connect :SWF-NAME "connect" :RETURN-TYPE "void" :ARGS
      (("host" "String") ("port" "int")) :STATIC NIL)
     (flash:read-float :SWF-NAME "readFloat" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:write-short :SWF-NAME "writeShort" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:write-unsigned-int :SWF-NAME "writeUnsignedInt" :RETURN-TYPE "void"
      :ARGS (("value" "uint")) :STATIC NIL)
     (flash:read-unsigned-byte :SWF-NAME "readUnsignedByte" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)
     (flash:write-multi-byte :SWF-NAME "writeMultiByte" :RETURN-TYPE "void"
      :ARGS (("value" "String") ("charSet" "String")) :STATIC NIL)
     (flash:write-bytes :SWF-NAME "writeBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL (("offset" "uint") "0")
       (("length" "uint") "0"))
      :STATIC NIL)
     (flash:read-unsigned-int :SWF-NAME "readUnsignedInt" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)
     (flash:write-boolean :SWF-NAME "writeBoolean" :RETURN-TYPE "void" :ARGS
      (("value" "Boolean")) :STATIC NIL)
     (flash:write-utf :SWF-NAME "writeUTF" :RETURN-TYPE "void" :ARGS
      (("value" "String")) :STATIC NIL)
     (flash:read-byte :SWF-NAME "readByte" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:write-float :SWF-NAME "writeFloat" :RETURN-TYPE "void" :ARGS
      (("value" "Number")) :STATIC NIL)
     (flash:read-utf-bytes :SWF-NAME "readUTFBytes" :RETURN-TYPE "String" :ARGS
      (("length" "uint")) :STATIC NIL)
     (flash:read-boolean :SWF-NAME "readBoolean" :RETURN-TYPE "Boolean" :ARGS
      NIL :STATIC NIL)
     (flash:read-utf :SWF-NAME "readUTF" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:read-object :SWF-NAME "readObject" :RETURN-TYPE "*" :ARGS NIL
      :STATIC NIL)
     (flash:write-double :SWF-NAME "writeDouble" :RETURN-TYPE "void" :ARGS
      (("value" "Number")) :STATIC NIL)
     (flash:write-int :SWF-NAME "writeInt" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:read-double :SWF-NAME "readDouble" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:read-unsigned-short :SWF-NAME "readUnsignedShort" :RETURN-TYPE
      "uint" :ARGS NIL :STATIC NIL)
     (flash:read-short :SWF-NAME "readShort" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:write-byte :SWF-NAME "writeByte" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:write-object :SWF-NAME "writeObject" :RETURN-TYPE "void" :ARGS
      (("object" "*")) :STATIC NIL)
     (flash:flush :SWF-NAME "flush" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:write-utf-bytes :SWF-NAME "writeUTFBytes" :RETURN-TYPE "void" :ARGS
      (("value" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.color-matrix-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::ColorMatrixFilter"
    :constants
    ()
    :properties
    ((flash::matrix :SWF-NAME "matrix" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.matrix))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.bitmap-filter-type (flash:object)
    :swf-name "flash.filters::BitmapFilterType"
    :constants
    ((flash:+bitmap-filter-type.full+ :SWF-NAME "FULL" :TYPE "String" :VALUE
      "full" :STATIC T)
     (flash:+bitmap-filter-type.inner+ :SWF-NAME "INNER" :TYPE "String" :VALUE
      "inner" :STATIC T)
     (flash:+bitmap-filter-type.outer+ :SWF-NAME "OUTER" :TYPE "String" :VALUE
      "outer" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-color-type (flash:object)
    :swf-name "flash.text::TextColorType"
    :constants
    ((flash:+text-color-type.light-color+ :SWF-NAME "LIGHT_COLOR" :TYPE
      "String" :VALUE "light" :STATIC T)
     (flash:+text-color-type.dark-color+ :SWF-NAME "DARK_COLOR" :TYPE "String"
      :VALUE "dark" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.displacement-map-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::DisplacementMapFilter"
    :constants
    ()
    :properties
    ((flash::component-x :SWF-NAME "componentX" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.component-x)
     (flash::map-point :SWF-NAME "mapPoint" :TYPE "flash.geom::Point" :STATIC
      NIL :ACCESSOR flash:.map-point)
     (flash::color :SWF-NAME "color" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.color)
     (flash::scale-y :SWF-NAME "scaleY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.scale-y)
     (flash::scale-x :SWF-NAME "scaleX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.scale-x)
     (flash::map-bitmap :SWF-NAME "mapBitmap" :TYPE "flash.display::BitmapData"
      :STATIC NIL :ACCESSOR flash:.map-bitmap)
     (flash::mode :SWF-NAME "mode" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.mode)
     (flash::alpha :SWF-NAME "alpha" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.alpha)
     (flash::component-y :SWF-NAME "componentY" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.component-y))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-path-winding (flash:object)
    :swf-name "flash.display::GraphicsPathWinding"
    :constants
    ((flash:+graphics-path-winding.non-zero+ :SWF-NAME "NON_ZERO" :TYPE
      "String" :VALUE "nonZero" :STATIC T)
     (flash:+graphics-path-winding.even-odd+ :SWF-NAME "EVEN_ODD" :TYPE
      "String" :VALUE "evenOdd" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.i-dynamic-property-writer ()
    :swf-name "flash.net::IDynamicPropertyWriter"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.external.external-interface (flash:object)
    :swf-name "flash.external::ExternalInterface"
    :constants
    ()
    :properties
    ((flash::marshall-exceptions :SWF-NAME "marshallExceptions" :TYPE "Boolean"
      :STATIC T :ACCESSOR flash:.marshall-exceptions)
     (flash::object-id :SWF-NAME "objectID" :TYPE "String" :STATIC T :ACCESSOR
      flash:.object-id)
     (flash::available :SWF-NAME "available" :TYPE "Boolean" :STATIC T
      :ACCESSOR flash:.available))
    :methods
    ((flash::external-interface.call :SWF-NAME "call" :RETURN-TYPE "*" :ARGS
      (("functionName" "String")) :STATIC T)
     (flash::external-interface.add-callback :SWF-NAME "addCallback"
      :RETURN-TYPE "void" :ARGS
      (("functionName" "String") ("closure" "Function")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-run (flash:object)
    :swf-name "flash.text::TextRun"
    :constants
    ()
    :properties
    ((flash::begin-index :SWF-NAME "beginIndex" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.begin-index)
     (flash::end-index :SWF-NAME "endIndex" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.end-index)
     (flash::text-format :SWF-NAME "textFormat" :TYPE "flash.text::TextFormat"
      :STATIC NIL :ACCESSOR flash:.text-format))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shader (flash:object)
    :swf-name "flash.display::Shader"
    :constants
    ()
    :properties
    ((flash::data :SWF-NAME "data" :TYPE "flash.display::ShaderData" :STATIC
      NIL :ACCESSOR flash:.data)
     (flash::precision-hint :SWF-NAME "precisionHint" :TYPE "String" :STATIC
      NIL :ACCESSOR flash:.precision-hint))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.video (flash:flash.display.display-object)
    :swf-name "flash.media::Video"
    :constants
    ()
    :properties
    ((flash::video-width :SWF-NAME "videoWidth" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.video-width)
     (flash::deblocking :SWF-NAME "deblocking" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.deblocking)
     (flash::smoothing :SWF-NAME "smoothing" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.smoothing)
     (flash::video-height :SWF-NAME "videoHeight" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.video-height))
    :methods
    ((flash:attach-net-stream :SWF-NAME "attachNetStream" :RETURN-TYPE "void"
      :ARGS (("netStream" "flash.net::NetStream")) :STATIC NIL)
     (flash:clear :SWF-NAME "clear" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:attach-camera :SWF-NAME "attachCamera" :RETURN-TYPE "void" :ARGS
      (("camera" "flash.media::Camera")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-format-display (flash:object)
    :swf-name "flash.text::TextFormatDisplay"
    :constants
    ((flash:+text-format-display.block+ :SWF-NAME "BLOCK" :TYPE "String" :VALUE
      "block" :STATIC T)
     (flash:+text-format-display.inline+ :SWF-NAME "INLINE" :TYPE "String"
      :VALUE "inline" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.i-d3-info (flash:object)
    :swf-name "flash.media::ID3Info"
    :constants
    ()
    :properties
    ((flash::comment :SWF-NAME "comment" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.comment)
     (flash::year :SWF-NAME "year" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.year)
     (flash::album :SWF-NAME "album" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.album)
     (flash::track :SWF-NAME "track" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.track)
     (flash::artist :SWF-NAME "artist" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.artist)
     (flash::genre :SWF-NAME "genre" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.genre)
     (flash::song-name :SWF-NAME "songName" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.song-name))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.sound-transform (flash:object)
    :swf-name "flash.media::SoundTransform"
    :constants
    ()
    :properties
    ((flash::right-to-left :SWF-NAME "rightToLeft" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.right-to-left)
     (flash::pan :SWF-NAME "pan" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.pan)
     (flash::left-to-right :SWF-NAME "leftToRight" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.left-to-right)
     (flash::left-to-left :SWF-NAME "leftToLeft" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.left-to-left)
     (flash::volume :SWF-NAME "volume" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.volume)
     (flash::right-to-right :SWF-NAME "rightToRight" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.right-to-right))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.trace.trace (flash:object)
    :swf-name "flash.trace::Trace"
    :constants
    ((flash:+trace.file+ :SWF-NAME "FILE" :TYPE "*" :VALUE "1" :STATIC T)
     (flash:+trace.listener+ :SWF-NAME "LISTENER" :TYPE "*" :VALUE "2" :STATIC
      T)
     (flash:+trace.methods+ :SWF-NAME "METHODS" :TYPE "int" :VALUE "1" :STATIC
      T)
     (flash:+trace.methods-with-args+ :SWF-NAME "METHODS_WITH_ARGS" :TYPE "int"
      :VALUE "2" :STATIC T)
     (flash:+trace.off+ :SWF-NAME "OFF" :TYPE "int" :VALUE "0" :STATIC T)
     (flash:+trace.methods-and-lines+ :SWF-NAME "METHODS_AND_LINES" :TYPE "int"
      :VALUE "3" :STATIC T)
     (flash:+trace.methods-and-lines-with-args+ :SWF-NAME
      "METHODS_AND_LINES_WITH_ARGS" :TYPE "int" :VALUE "4" :STATIC T))
    :properties
    ()
    :methods
    ((flash::trace.set-listener :SWF-NAME "setListener" :RETURN-TYPE "*" :ARGS
      (("f" "Function")) :STATIC T)
     (flash::trace.set-level :SWF-NAME "setLevel" :RETURN-TYPE "*" :ARGS
      (("l" "int") &OPTIONAL (("target" "int") "2")) :STATIC T)
     (flash::trace.get-level :SWF-NAME "getLevel" :RETURN-TYPE "int" :ARGS
      (&OPTIONAL (("target" "int") "2")) :STATIC T)
     (flash::trace.get-listener :SWF-NAME "getListener" :RETURN-TYPE "Function"
      :ARGS NIL :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-snapshot (flash:object)
    :swf-name "flash.text::TextSnapshot"
    :constants
    ()
    :properties
    ((flash::char-count :SWF-NAME "charCount" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.char-count))
    :methods
    ((flash:get-selected-text :SWF-NAME "getSelectedText" :RETURN-TYPE "String"
      :ARGS (&OPTIONAL (("includeLineEndings" "Boolean") "FALSE")) :STATIC NIL)
     (flash:get-text-run-info :SWF-NAME "getTextRunInfo" :RETURN-TYPE "Array"
      :ARGS (("beginIndex" "int") ("endIndex" "int")) :STATIC NIL)
     (flash:hit-test-text-near-pos :SWF-NAME "hitTestTextNearPos" :RETURN-TYPE
      "Number" :ARGS
      (("x" "Number") ("y" "Number") &OPTIONAL (("maxDistance" "Number") "0"))
      :STATIC NIL)
     (flash:find-text :SWF-NAME "findText" :RETURN-TYPE "int" :ARGS
      (("beginIndex" "int") ("textToFind" "String")
       ("caseSensitive" "Boolean"))
      :STATIC NIL)
     (flash:set-select-color :SWF-NAME "setSelectColor" :RETURN-TYPE "void"
      :ARGS (&OPTIONAL (("hexColor" "uint") "16776960")) :STATIC NIL)
     (flash:set-selected :SWF-NAME "setSelected" :RETURN-TYPE "void" :ARGS
      (("beginIndex" "int") ("endIndex" "int") ("select" "Boolean")) :STATIC
      NIL)
     (flash:get-text :SWF-NAME "getText" :RETURN-TYPE "String" :ARGS
      (("beginIndex" "int") ("endIndex" "int") &OPTIONAL
       (("includeLineEndings" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:get-selected :SWF-NAME "getSelected" :RETURN-TYPE "Boolean" :ARGS
      (("beginIndex" "int") ("endIndex" "int")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.interpolation-method (flash:object)
    :swf-name "flash.display::InterpolationMethod"
    :constants
    ((flash:+interpolation-method.rgb+ :SWF-NAME "RGB" :TYPE "String" :VALUE
      "rgb" :STATIC T)
     (flash:+interpolation-method.linear-rgb+ :SWF-NAME "LINEAR_RGB" :TYPE
      "String" :VALUE "linearRGB" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.context-menu-built-in-items (flash:object)
    :swf-name "flash.ui::ContextMenuBuiltInItems"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::save :SWF-NAME "save" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.save)
     (flash::rewind :SWF-NAME "rewind" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.rewind)
     (flash::forward-and-back :SWF-NAME "forwardAndBack" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.forward-and-back)
     (flash::play :SWF-NAME "play" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.play)
     (flash::zoom :SWF-NAME "zoom" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.zoom)
     (flash::print :SWF-NAME "print" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.print)
     (flash::loop :SWF-NAME "loop" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.loop))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE
      "flash.ui::ContextMenuBuiltInItems" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-extent (flash:object)
    :swf-name "flash.text::TextExtent"
    :constants
    ()
    :properties
    ((flash::text-field-height :SWF-NAME "textFieldHeight" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.text-field-height)
     (flash::descent :SWF-NAME "descent" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.descent)
     (flash::text-field-width :SWF-NAME "textFieldWidth" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.text-field-width)
     (flash::height :SWF-NAME "height" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::width :SWF-NAME "width" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::ascent :SWF-NAME "ascent" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.ascent))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.cff-hinting (flash:object)
    :swf-name "flash.text.engine::CFFHinting"
    :constants
    ((flash:+cff-hinting.horizontal-stem+ :SWF-NAME "HORIZONTAL_STEM" :TYPE
      "String" :VALUE "horizontalStem" :STATIC T)
     (flash:+cff-hinting.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE "none"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.security-domain (flash:object)
    :swf-name "flash.system::SecurityDomain"
    :constants
    ()
    :properties
    ((flash::current-domain :SWF-NAME "currentDomain" :TYPE
      "flash.system::SecurityDomain" :STATIC T :ACCESSOR flash:.current-domain))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash:date (flash:object)
    :swf-name "Date"
    :constants
    ((flash:+date.length+ :SWF-NAME "length" :TYPE "int" :VALUE "7" :STATIC T))
    :properties
    ((flash::seconds :SWF-NAME "seconds" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.seconds)
     (flash::timezone-offset :SWF-NAME "timezoneOffset" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.timezone-offset)
     (flash::full-year :SWF-NAME "fullYear" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.full-year)
     (flash::milliseconds-utc :SWF-NAME "millisecondsUTC" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.milliseconds-utc)
     (flash::day-utc :SWF-NAME "dayUTC" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.day-utc)
     (flash::time :SWF-NAME "time" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.time)
     (flash::minutes :SWF-NAME "minutes" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.minutes)
     (flash::minutes-utc :SWF-NAME "minutesUTC" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.minutes-utc)
     (flash::date :SWF-NAME "date" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.date)
     (flash::seconds-utc :SWF-NAME "secondsUTC" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.seconds-utc)
     (flash::day :SWF-NAME "day" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.day)
     (flash::full-year-utc :SWF-NAME "fullYearUTC" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.full-year-utc)
     (flash::date-utc :SWF-NAME "dateUTC" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.date-utc)
     (flash::hours-utc :SWF-NAME "hoursUTC" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.hours-utc)
     (flash::milliseconds :SWF-NAME "milliseconds" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.milliseconds)
     (flash::hours :SWF-NAME "hours" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.hours)
     (flash::month-utc :SWF-NAME "monthUTC" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.month-utc)
     (flash::month :SWF-NAME "month" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.month))
    :methods
    ((flash:get-utc-full-year :SWF-NAME "getUTCFullYear" :RETURN-TYPE "Number"
      :ARGS NIL :STATIC NIL)
     (flash:set-utc-full-year :SWF-NAME "setUTCFullYear" :RETURN-TYPE "Number"
      :ARGS
      (&OPTIONAL (("year" "*") "UNDEFINED") (("month" "*") "UNDEFINED")
       (("date" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:to-locale-date-string :SWF-NAME "toLocaleDateString" :RETURN-TYPE
      "String" :ARGS NIL :STATIC NIL)
     (flash:set-full-year :SWF-NAME "setFullYear" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("year" "*") "UNDEFINED") (("month" "*") "UNDEFINED")
       (("date" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:get-full-year :SWF-NAME "getFullYear" :RETURN-TYPE "Number" :ARGS
      NIL :STATIC NIL)
     (flash:get-day :SWF-NAME "getDay" :RETURN-TYPE "Number" :ARGS NIL :STATIC
      NIL)
     (flash:get-timezone-offset :SWF-NAME "getTimezoneOffset" :RETURN-TYPE
      "Number" :ARGS NIL :STATIC NIL)
     (flash:get-hours :SWF-NAME "getHours" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:set-utc-hours :SWF-NAME "setUTCHours" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("hour" "*") "UNDEFINED") (("min" "*") "UNDEFINED")
       (("sec" "*") "UNDEFINED") (("ms" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:to-locale-time-string :SWF-NAME "toLocaleTimeString" :RETURN-TYPE
      "String" :ARGS NIL :STATIC NIL)
     (flash:set-time :SWF-NAME "setTime" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("t" "*") "UNDEFINED")) :STATIC NIL)
     (flash:get-utc-day :SWF-NAME "getUTCDay" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:set-hours :SWF-NAME "setHours" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("hour" "*") "UNDEFINED") (("min" "*") "UNDEFINED")
       (("sec" "*") "UNDEFINED") (("ms" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash::date.%to-string :SWF-NAME "Date::_toString" :RETURN-TYPE "String"
      :ARGS (("index" "int")) :STATIC NIL)
     (flash:get-month :SWF-NAME "getMonth" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:get-seconds :SWF-NAME "getSeconds" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:set-month :SWF-NAME "setMonth" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("month" "*") "UNDEFINED") (("date" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:set-seconds :SWF-NAME "setSeconds" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("sec" "*") "UNDEFINED") (("ms" "*") "UNDEFINED")) :STATIC
      NIL)
     (flash:get-time :SWF-NAME "getTime" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:get-utc-hours :SWF-NAME "getUTCHours" :RETURN-TYPE "Number" :ARGS
      NIL :STATIC NIL)
     (flash:set-utc-month :SWF-NAME "setUTCMonth" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("month" "*") "UNDEFINED") (("date" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:set-utc-seconds :SWF-NAME "setUTCSeconds" :RETURN-TYPE "Number"
      :ARGS (&OPTIONAL (("sec" "*") "UNDEFINED") (("ms" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:get-utc-date :SWF-NAME "getUTCDate" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:to-date-string :SWF-NAME "toDateString" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash:set-utc-date :SWF-NAME "setUTCDate" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("date" "*") "UNDEFINED")) :STATIC NIL)
     (flash:get-utc-month :SWF-NAME "getUTCMonth" :RETURN-TYPE "Number" :ARGS
      NIL :STATIC NIL)
     (flash:get-utc-seconds :SWF-NAME "getUTCSeconds" :RETURN-TYPE "Number"
      :ARGS NIL :STATIC NIL)
     (flash:set-date :SWF-NAME "setDate" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("date" "*") "UNDEFINED")) :STATIC NIL)
     (flash:set-utc-minutes :SWF-NAME "setUTCMinutes" :RETURN-TYPE "Number"
      :ARGS
      (&OPTIONAL (("min" "*") "UNDEFINED") (("sec" "*") "UNDEFINED")
       (("ms" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:get-minutes :SWF-NAME "getMinutes" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:value-of :SWF-NAME "valueOf" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:to-locale-string :SWF-NAME "toLocaleString" :RETURN-TYPE "String"
      :ARGS NIL :STATIC NIL)
     (flash:get-date :SWF-NAME "getDate" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:get-utc-milliseconds :SWF-NAME "getUTCMilliseconds" :RETURN-TYPE
      "Number" :ARGS NIL :STATIC NIL)
     (flash:set-minutes :SWF-NAME "setMinutes" :RETURN-TYPE "Number" :ARGS
      (&OPTIONAL (("min" "*") "UNDEFINED") (("sec" "*") "UNDEFINED")
       (("ms" "*") "UNDEFINED"))
      :STATIC NIL)
     (flash:set-utc-milliseconds :SWF-NAME "setUTCMilliseconds" :RETURN-TYPE
      "Number" :ARGS (&OPTIONAL (("ms" "*") "UNDEFINED")) :STATIC NIL)
     (flash:to-utc-string :SWF-NAME "toUTCString" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash:to-time-string :SWF-NAME "toTimeString" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash::date.%get :SWF-NAME "Date::_get" :RETURN-TYPE "Number" :ARGS
      (("index" "int")) :STATIC NIL)
     (flash:set-milliseconds :SWF-NAME "setMilliseconds" :RETURN-TYPE "Number"
      :ARGS (&OPTIONAL (("ms" "*") "UNDEFINED")) :STATIC NIL)
     (flash:get-utc-minutes :SWF-NAME "getUTCMinutes" :RETURN-TYPE "Number"
      :ARGS NIL :STATIC NIL)
     (flash::date.%set-time :SWF-NAME "Date::_setTime" :RETURN-TYPE "Number"
      :ARGS (("value" "Number")) :STATIC NIL)
     (flash:get-milliseconds :SWF-NAME "getMilliseconds" :RETURN-TYPE "Number"
      :ARGS NIL :STATIC NIL)
     (flash::date.parse :SWF-NAME "parse" :RETURN-TYPE "Number" :ARGS
      (("s" "*")) :STATIC T)
     (flash::date.utc :SWF-NAME "UTC" :RETURN-TYPE "Number" :ARGS
      (("year" "*") ("month" "*") &OPTIONAL (("date" "*") "0")
       (("hours" "*") "0") (("minutes" "*") "0") (("seconds" "*") "0")
       (("ms" "*") "1"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.dynamic-property-output (flash:object)
    :swf-name "flash.net::DynamicPropertyOutput"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:write-dynamic-property :SWF-NAME "writeDynamicProperty"
      :RETURN-TYPE "void" :ARGS (("name" "String") ("value" "*")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.blur-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::BlurFilter"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::blur-y :SWF-NAME "blurY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-y)
     (flash::blur-x :SWF-NAME "blurX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-x))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-bitmap-fill (flash:object)
    :swf-name "flash.display::GraphicsBitmapFill"
    :constants
    ()
    :properties
    ((flash::smooth :SWF-NAME "smooth" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.smooth)
     (flash::repeat :SWF-NAME "repeat" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.repeat)
     (flash::bitmap-data :SWF-NAME "bitmapData" :TYPE
      "flash.display::BitmapData" :STATIC NIL :ACCESSOR flash:.bitmap-data)
     (flash::matrix :SWF-NAME "matrix" :TYPE "flash.geom::Matrix" :STATIC NIL
      :ACCESSOR flash:.matrix))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.status-event (flash:flash.events.event)
    :swf-name "flash.events::StatusEvent"
    :constants
    ((flash:+status-event.status+ :SWF-NAME "STATUS" :TYPE "String" :VALUE
      "status" :STATIC T))
    :properties
    ((flash::level :SWF-NAME "level" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.level)
     (flash::code :SWF-NAME "code" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.code))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.orientation3-d (flash:object)
    :swf-name "flash.geom::Orientation3D"
    :constants
    ((flash:+orientation3-d.quaternion+ :SWF-NAME "QUATERNION" :TYPE "String"
      :VALUE "quaternion" :STATIC T)
     (flash:+orientation3-d.euler-angles+ :SWF-NAME "EULER_ANGLES" :TYPE
      "String" :VALUE "eulerAngles" :STATIC T)
     (flash:+orientation3-d.axis-angle+ :SWF-NAME "AXIS_ANGLE" :TYPE "String"
      :VALUE "axisAngle" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.color-transform (flash:object)
    :swf-name "flash.geom::ColorTransform"
    :constants
    ()
    :properties
    ((flash::alpha-multiplier :SWF-NAME "alphaMultiplier" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.alpha-multiplier)
     (flash::green-offset :SWF-NAME "greenOffset" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.green-offset)
     (flash::blue-multiplier :SWF-NAME "blueMultiplier" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.blue-multiplier)
     (flash::red-multiplier :SWF-NAME "redMultiplier" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.red-multiplier)
     (flash::alpha-offset :SWF-NAME "alphaOffset" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.alpha-offset)
     (flash::blue-offset :SWF-NAME "blueOffset" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.blue-offset)
     (flash::green-multiplier :SWF-NAME "greenMultiplier" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.green-multiplier)
     (flash::red-offset :SWF-NAME "redOffset" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.red-offset)
     (flash::color :SWF-NAME "color" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.color))
    :methods
    ((flash:concat :SWF-NAME "concat" :RETURN-TYPE "void" :ARGS
      (("second" "flash.geom::ColorTransform")) :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.static-text (flash:flash.display.display-object)
    :swf-name "flash.text::StaticText"
    :constants
    ()
    :properties
    ((flash::text :SWF-NAME "text" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.text))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::adobe.utils.custom-actions (flash:object)
    :swf-name "adobe.utils::CustomActions"
    :constants
    ()
    :properties
    ((flash::actions-list :SWF-NAME "actionsList" :TYPE "Array" :STATIC T
      :ACCESSOR flash:.actions-list))
    :methods
    ((flash::custom-actions.get-actions :SWF-NAME "getActions" :RETURN-TYPE
      "String" :ARGS (("name" "String")) :STATIC T)
     (flash::custom-actions.uninstall-actions :SWF-NAME "uninstallActions"
      :RETURN-TYPE "void" :ARGS (("name" "String")) :STATIC T)
     (flash::custom-actions.install-actions :SWF-NAME "installActions"
      :RETURN-TYPE "void" :ARGS (("name" "String") ("data" "String")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.url-stream (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::URLStream"
    :constants
    ()
    :properties
    ((flash::bytes-available :SWF-NAME "bytesAvailable" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.bytes-available)
     (flash::endian :SWF-NAME "endian" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.endian)
     (flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding)
     (flash::connected :SWF-NAME "connected" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.connected))
    :methods
    ((flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:read-byte :SWF-NAME "readByte" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:read-bytes :SWF-NAME "readBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL (("offset" "uint") "0")
       (("length" "uint") "0"))
      :STATIC NIL)
     (flash:read-utf-bytes :SWF-NAME "readUTFBytes" :RETURN-TYPE "String" :ARGS
      (("length" "uint")) :STATIC NIL)
     (flash:read-int :SWF-NAME "readInt" :RETURN-TYPE "int" :ARGS NIL :STATIC
      NIL)
     (flash:read-utf :SWF-NAME "readUTF" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:read-multi-byte :SWF-NAME "readMultiByte" :RETURN-TYPE "String"
      :ARGS (("length" "uint") ("charSet" "String")) :STATIC NIL)
     (flash:load :SWF-NAME "load" :RETURN-TYPE "void" :ARGS
      (("request" "flash.net::URLRequest")) :STATIC NIL)
     (flash:read-object :SWF-NAME "readObject" :RETURN-TYPE "*" :ARGS NIL
      :STATIC NIL)
     (flash:read-unsigned-byte :SWF-NAME "readUnsignedByte" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)
     (flash:read-unsigned-short :SWF-NAME "readUnsignedShort" :RETURN-TYPE
      "uint" :ARGS NIL :STATIC NIL)
     (flash:read-short :SWF-NAME "readShort" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:read-boolean :SWF-NAME "readBoolean" :RETURN-TYPE "Boolean" :ARGS
      NIL :STATIC NIL)
     (flash:read-float :SWF-NAME "readFloat" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:read-double :SWF-NAME "readDouble" :RETURN-TYPE "Number" :ARGS NIL
      :STATIC NIL)
     (flash:read-unsigned-int :SWF-NAME "readUnsignedInt" :RETURN-TYPE "uint"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.security-error-event (flash:flash.events.error-event)
    :swf-name "flash.events::SecurityErrorEvent"
    :constants
    ((flash:+security-error-event.security-error+ :SWF-NAME "SECURITY_ERROR"
      :TYPE "String" :VALUE "securityError" :STATIC T))
    :properties
    ()
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.ligature-level (flash:object)
    :swf-name "flash.text.engine::LigatureLevel"
    :constants
    ((flash:+ligature-level.minimum+ :SWF-NAME "MINIMUM" :TYPE "String" :VALUE
      "minimum" :STATIC T)
     (flash:+ligature-level.common+ :SWF-NAME "COMMON" :TYPE "String" :VALUE
      "common" :STATIC T)
     (flash:+ligature-level.exotic+ :SWF-NAME "EXOTIC" :TYPE "String" :VALUE
      "exotic" :STATIC T)
     (flash:+ligature-level.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE "none"
      :STATIC T)
     (flash:+ligature-level.uncommon+ :SWF-NAME "UNCOMMON" :TYPE "String"
      :VALUE "uncommon" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.morph-shape (flash:flash.display.display-object)
    :swf-name "flash.display::MorphShape"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.anti-alias-type (flash:object)
    :swf-name "flash.text::AntiAliasType"
    :constants
    ((flash:+anti-alias-type.normal+ :SWF-NAME "NORMAL" :TYPE "String" :VALUE
      "normal" :STATIC T)
     (flash:+anti-alias-type.advanced+ :SWF-NAME "ADVANCED" :TYPE "String"
      :VALUE "advanced" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.microphone (flash:flash.events.event-dispatcher)
    :swf-name "flash.media::Microphone"
    :constants
    ()
    :properties
    ((flash::frames-per-packet :SWF-NAME "framesPerPacket" :TYPE "int" :STATIC
      NIL :ACCESSOR flash:.frames-per-packet)
     (flash::sound-transform :SWF-NAME "soundTransform" :TYPE
      "flash.media::SoundTransform" :STATIC NIL :ACCESSOR
      flash:.sound-transform)
     (flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name)
     (flash::index :SWF-NAME "index" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.index)
     (flash::codec :SWF-NAME "codec" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.codec)
     (flash::activity-level :SWF-NAME "activityLevel" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.activity-level)
     (flash::encode-quality :SWF-NAME "encodeQuality" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.encode-quality)
     (flash::silence-timeout :SWF-NAME "silenceTimeout" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.silence-timeout)
     (flash::use-echo-suppression :SWF-NAME "useEchoSuppression" :TYPE
      "Boolean" :STATIC NIL :ACCESSOR flash:.use-echo-suppression)
     (flash::muted :SWF-NAME "muted" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.muted)
     (flash::rate :SWF-NAME "rate" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.rate)
     (flash::gain :SWF-NAME "gain" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.gain)
     (flash::silence-level :SWF-NAME "silenceLevel" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.silence-level)
     (flash::names :SWF-NAME "names" :TYPE "Array" :STATIC T :ACCESSOR
      flash:.names))
    :methods
    ((flash:set-loop-back :SWF-NAME "setLoopBack" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL (("state" "Boolean") "T")) :STATIC NIL)
     (flash:set-use-echo-suppression :SWF-NAME "setUseEchoSuppression"
      :RETURN-TYPE "void" :ARGS (("useEchoSuppression" "Boolean")) :STATIC NIL)
     (flash:set-silence-level :SWF-NAME "setSilenceLevel" :RETURN-TYPE "void"
      :ARGS (("silenceLevel" "Number") &OPTIONAL (("timeout" "int") "-1"))
      :STATIC NIL)
     (flash::microphone.get-microphone :SWF-NAME "getMicrophone" :RETURN-TYPE
      "flash.media::Microphone" :ARGS (&OPTIONAL (("index" "int") "-1"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.url-loader-data-format (flash:object)
    :swf-name "flash.net::URLLoaderDataFormat"
    :constants
    ((flash:+url-loader-data-format.text+ :SWF-NAME "TEXT" :TYPE "String"
      :VALUE "text" :STATIC T)
     (flash:+url-loader-data-format.variables+ :SWF-NAME "VARIABLES" :TYPE
      "String" :VALUE "variables" :STATIC T)
     (flash:+url-loader-data-format.binary+ :SWF-NAME "BINARY" :TYPE "String"
      :VALUE "binary" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.sound-channel (flash:flash.events.event-dispatcher)
    :swf-name "flash.media::SoundChannel"
    :constants
    ()
    :properties
    ((flash::sound-transform :SWF-NAME "soundTransform" :TYPE
      "flash.media::SoundTransform" :STATIC NIL :ACCESSOR
      flash:.sound-transform)
     (flash::right-peak :SWF-NAME "rightPeak" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.right-peak)
     (flash::position :SWF-NAME "position" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.position)
     (flash::left-peak :SWF-NAME "leftPeak" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.left-peak))
    :methods
    ((flash:stop :SWF-NAME "stop" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.progress-event (flash:flash.events.event)
    :swf-name "flash.events::ProgressEvent"
    :constants
    ((flash:+progress-event.socket-data+ :SWF-NAME "SOCKET_DATA" :TYPE "String"
      :VALUE "socketData" :STATIC T)
     (flash:+progress-event.progress+ :SWF-NAME "PROGRESS" :TYPE "String"
      :VALUE "progress" :STATIC T))
    :properties
    ((flash::bytes-total :SWF-NAME "bytesTotal" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-total)
     (flash::bytes-loaded :SWF-NAME "bytesLoaded" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-loaded))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.context-menu-event (flash:flash.events.event)
    :swf-name "flash.events::ContextMenuEvent"
    :constants
    ((flash:+context-menu-event.menu-select+ :SWF-NAME "MENU_SELECT" :TYPE
      "String" :VALUE "menuSelect" :STATIC T)
     (flash:+context-menu-event.menu-item-select+ :SWF-NAME "MENU_ITEM_SELECT"
      :TYPE "String" :VALUE "menuItemSelect" :STATIC T))
    :properties
    ((flash::mouse-target :SWF-NAME "mouseTarget" :TYPE
      "flash.display::InteractiveObject" :STATIC NIL :ACCESSOR
      flash:.mouse-target)
     (flash::is-mouse-target-inaccessible :SWF-NAME "isMouseTargetInaccessible"
      :TYPE "Boolean" :STATIC NIL :ACCESSOR flash:.is-mouse-target-inaccessible)
     (flash::context-menu-owner :SWF-NAME "contextMenuOwner" :TYPE
      "flash.display::InteractiveObject" :STATIC NIL :ACCESSOR
      flash:.context-menu-owner))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-field (flash:flash.display.interactive-object)
    :swf-name "flash.text::TextField"
    :constants
    ()
    :properties
    ((flash::bottom-scroll-v :SWF-NAME "bottomScrollV" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.bottom-scroll-v)
     (flash::html-text :SWF-NAME "htmlText" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.html-text)
     (flash::thickness :SWF-NAME "thickness" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.thickness)
     (flash::text :SWF-NAME "text" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.text)
     (flash::selected-text :SWF-NAME "selectedText" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.selected-text)
     (flash::anti-alias-type :SWF-NAME "antiAliasType" :TYPE "String" :STATIC
      NIL :ACCESSOR flash:.anti-alias-type)
     (flash::length :SWF-NAME "length" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.length)
     (flash::selection-begin-index :SWF-NAME "selectionBeginIndex" :TYPE "int"
      :STATIC NIL :ACCESSOR flash:.selection-begin-index)
     (flash::selection-end-index :SWF-NAME "selectionEndIndex" :TYPE "int"
      :STATIC NIL :ACCESSOR flash:.selection-end-index)
     (flash::max-chars :SWF-NAME "maxChars" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.max-chars)
     (flash::selectable :SWF-NAME "selectable" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.selectable)
     (flash::background-color :SWF-NAME "backgroundColor" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.background-color)
     (flash::auto-size :SWF-NAME "autoSize" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.auto-size)
     (flash::display-as-password :SWF-NAME "displayAsPassword" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.display-as-password)
     (flash::text-color :SWF-NAME "textColor" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.text-color)
     (flash::condense-white :SWF-NAME "condenseWhite" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.condense-white)
     (flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::use-rich-text-clipboard :SWF-NAME "useRichTextClipboard" :TYPE
      "Boolean" :STATIC NIL :ACCESSOR flash:.use-rich-text-clipboard)
     (flash::style-sheet :SWF-NAME "styleSheet" :TYPE "flash.text::StyleSheet"
      :STATIC NIL :ACCESSOR flash:.style-sheet)
     (flash::grid-fit-type :SWF-NAME "gridFitType" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.grid-fit-type)
     (flash::sharpness :SWF-NAME "sharpness" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.sharpness)
     (flash::always-show-selection :SWF-NAME "alwaysShowSelection" :TYPE
      "Boolean" :STATIC NIL :ACCESSOR flash:.always-show-selection)
     (flash::restrict :SWF-NAME "restrict" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.restrict)
     (flash::text-height :SWF-NAME "textHeight" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.text-height)
     (flash::mouse-wheel-enabled :SWF-NAME "mouseWheelEnabled" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.mouse-wheel-enabled)
     (flash::max-scroll-v :SWF-NAME "maxScrollV" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.max-scroll-v)
     (flash::background :SWF-NAME "background" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.background)
     (flash::multiline :SWF-NAME "multiline" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.multiline)
     (flash::border :SWF-NAME "border" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.border)
     (flash::embed-fonts :SWF-NAME "embedFonts" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.embed-fonts)
     (flash::scroll-v :SWF-NAME "scrollV" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.scroll-v)
     (flash::text-width :SWF-NAME "textWidth" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.text-width)
     (flash::default-text-format :SWF-NAME "defaultTextFormat" :TYPE
      "flash.text::TextFormat" :STATIC NIL :ACCESSOR flash:.default-text-format)
     (flash::max-scroll-h :SWF-NAME "maxScrollH" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.max-scroll-h)
     (flash::scroll-h :SWF-NAME "scrollH" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.scroll-h)
     (flash::num-lines :SWF-NAME "numLines" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.num-lines)
     (flash::border-color :SWF-NAME "borderColor" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.border-color)
     (flash::caret-index :SWF-NAME "caretIndex" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.caret-index)
     (flash::word-wrap :SWF-NAME "wordWrap" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.word-wrap))
    :methods
    ((flash:get-line-index-of-char :SWF-NAME "getLineIndexOfChar" :RETURN-TYPE
      "int" :ARGS (("charIndex" "int")) :STATIC NIL)
     (flash:get-text-format :SWF-NAME "getTextFormat" :RETURN-TYPE
      "flash.text::TextFormat" :ARGS
      (&OPTIONAL (("beginIndex" "int") "-1") (("endIndex" "int") "-1")) :STATIC
      NIL)
     (flash:get-line-metrics :SWF-NAME "getLineMetrics" :RETURN-TYPE
      "flash.text::TextLineMetrics" :ARGS (("lineIndex" "int")) :STATIC NIL)
     (flash:get-line-index-at-point :SWF-NAME "getLineIndexAtPoint"
      :RETURN-TYPE "int" :ARGS (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:insert-xml-text :SWF-NAME "insertXMLText" :RETURN-TYPE "void" :ARGS
      (("beginIndex" "int") ("endIndex" "int") ("richText" "String") &OPTIONAL
       (("pasting" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:append-text :SWF-NAME "appendText" :RETURN-TYPE "void" :ARGS
      (("newText" "String")) :STATIC NIL)
     (flash:get-char-index-at-point :SWF-NAME "getCharIndexAtPoint"
      :RETURN-TYPE "int" :ARGS (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:get-xml-text :SWF-NAME "getXMLText" :RETURN-TYPE "String" :ARGS
      (&OPTIONAL (("beginIndex" "int") "2147483647") (("endIndex" "int") "0"))
      :STATIC NIL)
     (flash:set-selection :SWF-NAME "setSelection" :RETURN-TYPE "void" :ARGS
      (("beginIndex" "int") ("endIndex" "int")) :STATIC NIL)
     (flash:get-paragraph-length :SWF-NAME "getParagraphLength" :RETURN-TYPE
      "int" :ARGS (("charIndex" "int")) :STATIC NIL)
     (flash:replace-selected-text :SWF-NAME "replaceSelectedText" :RETURN-TYPE
      "void" :ARGS (("value" "String")) :STATIC NIL)
     (flash:get-char-boundaries :SWF-NAME "getCharBoundaries" :RETURN-TYPE
      "flash.geom::Rectangle" :ARGS (("charIndex" "int")) :STATIC NIL)
     (flash:get-raw-text :SWF-NAME "getRawText" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash::text-field.copy-rich-text :SWF-NAME "flash.text::copyRichText"
      :RETURN-TYPE "String" :ARGS NIL :STATIC NIL)
     (flash:get-first-char-in-paragraph :SWF-NAME "getFirstCharInParagraph"
      :RETURN-TYPE "int" :ARGS (("charIndex" "int")) :STATIC NIL)
     (flash:get-line-text :SWF-NAME "getLineText" :RETURN-TYPE "String" :ARGS
      (("lineIndex" "int")) :STATIC NIL)
     (flash:get-image-reference :SWF-NAME "getImageReference" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS (("id" "String")) :STATIC NIL)
     (flash:get-line-offset :SWF-NAME "getLineOffset" :RETURN-TYPE "int" :ARGS
      (("lineIndex" "int")) :STATIC NIL)
     (flash:get-text-runs :SWF-NAME "getTextRuns" :RETURN-TYPE "Array" :ARGS
      (&OPTIONAL (("beginIndex" "int") "2147483647") (("endIndex" "int") "0"))
      :STATIC NIL)
     (flash::text-field.paste-rich-text :SWF-NAME "flash.text::pasteRichText"
      :RETURN-TYPE "Boolean" :ARGS (("richText" "String")) :STATIC NIL)
     (flash:get-line-length :SWF-NAME "getLineLength" :RETURN-TYPE "int" :ARGS
      (("lineIndex" "int")) :STATIC NIL)
     (flash:set-text-format :SWF-NAME "setTextFormat" :RETURN-TYPE "void" :ARGS
      (("format" "flash.text::TextFormat") &OPTIONAL
       (("beginIndex" "int") "-1") (("endIndex" "int") "-1"))
      :STATIC NIL)
     (flash:replace-text :SWF-NAME "replaceText" :RETURN-TYPE "void" :ARGS
      (("beginIndex" "int") ("endIndex" "int") ("newText" "String")) :STATIC
      NIL)
     (flash::text-field.is-font-compatible :SWF-NAME "isFontCompatible"
      :RETURN-TYPE "Boolean" :ARGS
      (("fontName" "String") ("fontStyle" "String")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.xml.xml-parser (flash:object)
    :swf-name "flash.xml::XMLParser"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:start-parse :SWF-NAME "startParse" :RETURN-TYPE "void" :ARGS
      (("source" "String") ("ignoreWhite" "Boolean")) :STATIC NIL)
     (flash:get-next :SWF-NAME "getNext" :RETURN-TYPE "int" :ARGS
      (("tag" "flash.xml::XMLTag")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::adobe.utils.xmlui (flash:object)
    :swf-name "adobe.utils::XMLUI"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash::xmlui.set-property :SWF-NAME "setProperty" :RETURN-TYPE "void"
      :ARGS (("name" "String") ("value" "String")) :STATIC T)
     (flash::xmlui.get-property :SWF-NAME "getProperty" :RETURN-TYPE "String"
      :ARGS (("name" "String")) :STATIC T)
     (flash::xmlui.cancel :SWF-NAME "cancel" :RETURN-TYPE "void" :ARGS NIL
      :STATIC T)
     (flash::xmlui.accept :SWF-NAME "accept" :RETURN-TYPE "void" :ARGS NIL
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.mouse (flash:object)
    :swf-name "flash.ui::Mouse"
    :constants
    ()
    :properties
    ((flash::cursor :SWF-NAME "cursor" :TYPE "String" :STATIC T :ACCESSOR
      flash:.cursor))
    :methods
    ((flash::mouse.show :SWF-NAME "show" :RETURN-TYPE "void" :ARGS NIL :STATIC
      T)
     (flash::mouse.hide :SWF-NAME "hide" :RETURN-TYPE "void" :ARGS NIL :STATIC
      T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.activity-event (flash:flash.events.event)
    :swf-name "flash.events::ActivityEvent"
    :constants
    ((flash:+activity-event.activity+ :SWF-NAME "ACTIVITY" :TYPE "String"
      :VALUE "activity" :STATIC T))
    :properties
    ((flash::activating :SWF-NAME "activating" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.activating))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::adobe.utils.mm-execute "adobe.utils::MMExecute"
    (("name" "String")) "String")
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::adobe.utils.mm-end-command "adobe.utils::MMEndCommand"
    (("endStatus" "Boolean") ("notifyString" "String")) "void")
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.ime (flash:flash.events.event-dispatcher)
    :swf-name "flash.system::IME"
    :constants
    ()
    :properties
    ((flash::conversion-mode :SWF-NAME "conversionMode" :TYPE "String" :STATIC
      T :ACCESSOR flash:.conversion-mode)
     (flash::enabled :SWF-NAME "enabled" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.enabled))
    :methods
    ((flash::ime.do-conversion :SWF-NAME "doConversion" :RETURN-TYPE "void"
      :ARGS NIL :STATIC T)
     (flash::ime.set-composition-string :SWF-NAME "setCompositionString"
      :RETURN-TYPE "void" :ARGS (("composition" "String")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.object-encoding (flash:object)
    :swf-name "flash.net::ObjectEncoding"
    :constants
    ((flash:+object-encoding.amf3+ :SWF-NAME "AMF3" :TYPE "uint" :VALUE "3"
      :STATIC T)
     (flash:+object-encoding.amf0+ :SWF-NAME "AMF0" :TYPE "uint" :VALUE "0"
      :STATIC T)
     (flash:+object-encoding.default+ :SWF-NAME "DEFAULT" :TYPE "uint" :VALUE
      "3" :STATIC T))
    :properties
    ((flash::dynamic-property-writer :SWF-NAME "dynamicPropertyWriter" :TYPE
      "flash.net::IDynamicPropertyWriter" :STATIC T :ACCESSOR
      flash:.dynamic-property-writer))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.rendering-mode (flash:object)
    :swf-name "flash.text.engine::RenderingMode"
    :constants
    ((flash:+rendering-mode.normal+ :SWF-NAME "NORMAL" :TYPE "String" :VALUE
      "normal" :STATIC T)
     (flash:+rendering-mode.cff+ :SWF-NAME "CFF" :TYPE "String" :VALUE "cff"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.printing.print-job-options (flash:object)
    :swf-name "flash.printing::PrintJobOptions"
    :constants
    ()
    :properties
    ((flash::print-as-bitmap :SWF-NAME "printAsBitmap" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.print-as-bitmap))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.mouse-cursor (flash:object)
    :swf-name "flash.ui::MouseCursor"
    :constants
    ((flash:+mouse-cursor.auto+ :SWF-NAME "AUTO" :TYPE "String" :VALUE "auto"
      :STATIC T)
     (flash:+mouse-cursor.arrow+ :SWF-NAME "ARROW" :TYPE "String" :VALUE
      "arrow" :STATIC T)
     (flash:+mouse-cursor.ibeam+ :SWF-NAME "IBEAM" :TYPE "String" :VALUE
      "ibeam" :STATIC T)
     (flash:+mouse-cursor.hand+ :SWF-NAME "HAND" :TYPE "String" :VALUE "hand"
      :STATIC T)
     (flash:+mouse-cursor.button+ :SWF-NAME "BUTTON" :TYPE "String" :VALUE
      "button" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-line-creation-result (flash:object)
    :swf-name "flash.text.engine::TextLineCreationResult"
    :constants
    ((flash:+text-line-creation-result.insufficient-width+ :SWF-NAME
      "INSUFFICIENT_WIDTH" :TYPE "String" :VALUE "insufficientWidth" :STATIC T)
     (flash:+text-line-creation-result.complete+ :SWF-NAME "COMPLETE" :TYPE
      "String" :VALUE "complete" :STATIC T)
     (flash:+text-line-creation-result.success+ :SWF-NAME "SUCCESS" :TYPE
      "String" :VALUE "success" :STATIC T)
     (flash:+text-line-creation-result.emergency+ :SWF-NAME "EMERGENCY" :TYPE
      "String" :VALUE "emergency" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.data-event (flash:flash.events.text-event)
    :swf-name "flash.events::DataEvent"
    :constants
    ((flash:+data-event.upload-complete-data+ :SWF-NAME "UPLOAD_COMPLETE_DATA"
      :TYPE "String" :VALUE "uploadCompleteData" :STATIC T)
     (flash:+data-event.data+ :SWF-NAME "DATA" :TYPE "String" :VALUE "data"
      :STATIC T))
    :properties
    ((flash::data :SWF-NAME "data" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.data))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.stage-quality (flash:object)
    :swf-name "flash.display::StageQuality"
    :constants
    ((flash:+stage-quality.high+ :SWF-NAME "HIGH" :TYPE "String" :VALUE "high"
      :STATIC T)
     (flash:+stage-quality.medium+ :SWF-NAME "MEDIUM" :TYPE "String" :VALUE
      "medium" :STATIC T)
     (flash:+stage-quality.low+ :SWF-NAME "LOW" :TYPE "String" :VALUE "low"
      :STATIC T)
     (flash:+stage-quality.best+ :SWF-NAME "BEST" :TYPE "String" :VALUE "best"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.xml-socket (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::XMLSocket"
    :constants
    ()
    :properties
    ((flash::connected :SWF-NAME "connected" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.connected)
     (flash::timeout :SWF-NAME "timeout" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.timeout))
    :methods
    ((flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:connect :SWF-NAME "connect" :RETURN-TYPE "void" :ARGS
      (("host" "String") ("port" "int")) :STATIC NIL)
     (flash:send :SWF-NAME "send" :RETURN-TYPE "void" :ARGS (("object" "*"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-block (flash:object)
    :swf-name "flash.text.engine::TextBlock"
    :constants
    ()
    :properties
    ((flash::text-line-creation-result :SWF-NAME "textLineCreationResult" :TYPE
      "String" :STATIC NIL :ACCESSOR flash:.text-line-creation-result)
     (flash::first-invalid-line :SWF-NAME "firstInvalidLine" :TYPE
      "flash.text.engine::TextLine" :STATIC NIL :ACCESSOR
      flash:.first-invalid-line)
     (flash::baseline-font-description :SWF-NAME "baselineFontDescription"
      :TYPE "flash.text.engine::FontDescription" :STATIC NIL :ACCESSOR
      flash:.baseline-font-description)
     (flash::last-line :SWF-NAME "lastLine" :TYPE "flash.text.engine::TextLine"
      :STATIC NIL :ACCESSOR flash:.last-line)
     (flash::tab-stops :SWF-NAME "tabStops" :TYPE
      "__AS3__.vec::Vector<flash.text.engine::TabStop>" :STATIC NIL :ACCESSOR
      flash:.tab-stops)
     (flash::baseline-font-size :SWF-NAME "baselineFontSize" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.baseline-font-size)
     (flash::bidi-level :SWF-NAME "bidiLevel" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.bidi-level)
     (flash::user-data :SWF-NAME "userData" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.user-data)
     (flash::apply-non-linear-font-scaling :SWF-NAME
      "applyNonLinearFontScaling" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.apply-non-linear-font-scaling)
     (flash::line-rotation :SWF-NAME "lineRotation" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.line-rotation)
     (flash::baseline-zero :SWF-NAME "baselineZero" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.baseline-zero)
     (flash::content :SWF-NAME "content" :TYPE
      "flash.text.engine::ContentElement" :STATIC NIL :ACCESSOR flash:.content)
     (flash::first-line :SWF-NAME "firstLine" :TYPE
      "flash.text.engine::TextLine" :STATIC NIL :ACCESSOR flash:.first-line)
     (flash::text-justifier :SWF-NAME "textJustifier" :TYPE
      "flash.text.engine::TextJustifier" :STATIC NIL :ACCESSOR
      flash:.text-justifier))
    :methods
    ((flash:release-lines :SWF-NAME "releaseLines" :RETURN-TYPE "void" :ARGS
      (("firstLine" "flash.text.engine::TextLine")
       ("lastLine" "flash.text.engine::TextLine"))
      :STATIC NIL)
     (flash:dump :SWF-NAME "dump" :RETURN-TYPE "String" :ARGS NIL :STATIC NIL)
     (flash:create-text-line :SWF-NAME "createTextLine" :RETURN-TYPE
      "flash.text.engine::TextLine" :ARGS
      (&OPTIONAL (("previousLine" "flash.text.engine::TextLine") "FALSE")
       (("width" "Number") "0.0d0") (("lineOffset" "Number") "1000000")
       ("fitSomething" "Boolean"))
      :STATIC NIL)
     (flash:find-previous-word-boundary :SWF-NAME "findPreviousWordBoundary"
      :RETURN-TYPE "int" :ARGS (("beforeCharIndex" "int")) :STATIC NIL)
     (flash:find-next-word-boundary :SWF-NAME "findNextWordBoundary"
      :RETURN-TYPE "int" :ARGS (("afterCharIndex" "int")) :STATIC NIL)
     (flash:find-next-atom-boundary :SWF-NAME "findNextAtomBoundary"
      :RETURN-TYPE "int" :ARGS (("afterCharIndex" "int")) :STATIC NIL)
     (flash:find-previous-atom-boundary :SWF-NAME "findPreviousAtomBoundary"
      :RETURN-TYPE "int" :ARGS (("beforeCharIndex" "int")) :STATIC NIL)
     (flash:get-text-line-at-char-index :SWF-NAME "getTextLineAtCharIndex"
      :RETURN-TYPE "flash.text.engine::TextLine" :ARGS (("charIndex" "int"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.accessibility.accessibility-properties (flash:object)
    :swf-name "flash.accessibility::AccessibilityProperties"
    :constants
    ()
    :properties
    ((flash::no-auto-labeling :SWF-NAME "noAutoLabeling" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.no-auto-labeling)
     (flash::force-simple :SWF-NAME "forceSimple" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.force-simple)
     (flash::description :SWF-NAME "description" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.description)
     (flash::silent :SWF-NAME "silent" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.silent)
     (flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name)
     (flash::shortcut :SWF-NAME "shortcut" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.shortcut))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.font-posture (flash:object)
    :swf-name "flash.text.engine::FontPosture"
    :constants
    ((flash:+font-posture.normal+ :SWF-NAME "NORMAL" :TYPE "String" :VALUE
      "normal" :STATIC T)
     (flash:+font-posture.italic+ :SWF-NAME "ITALIC" :TYPE "String" :VALUE
      "italic" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-shader-fill (flash:object)
    :swf-name "flash.display::GraphicsShaderFill"
    :constants
    ()
    :properties
    ((flash::shader :SWF-NAME "shader" :TYPE "flash.display::Shader" :STATIC
      NIL :ACCESSOR flash:.shader)
     (flash::matrix :SWF-NAME "matrix" :TYPE "flash.geom::Matrix" :STATIC NIL
      :ACCESSOR flash:.matrix))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.url-loader (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::URLLoader"
    :constants
    ()
    :properties
    ((flash::bytes-total :SWF-NAME "bytesTotal" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-total)
     (flash::bytes-loaded :SWF-NAME "bytesLoaded" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-loaded)
     (flash::data :SWF-NAME "data" :TYPE "*" :STATIC NIL :ACCESSOR flash:.data)
     (flash::data-format :SWF-NAME "dataFormat" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.data-format))
    :methods
    ((flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:load :SWF-NAME "load" :RETURN-TYPE "void" :ARGS
      (("request" "flash.net::URLRequest")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.group-element (flash:flash.text.engine.content-element)
    :swf-name "flash.text.engine::GroupElement"
    :constants
    ()
    :properties
    ((flash::element-count :SWF-NAME "elementCount" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.element-count))
    :methods
    ((flash:ungroup-elements :SWF-NAME "ungroupElements" :RETURN-TYPE "void"
      :ARGS (("groupIndex" "int")) :STATIC NIL)
     (flash:merge-text-elements :SWF-NAME "mergeTextElements" :RETURN-TYPE
      "flash.text.engine::TextElement" :ARGS
      (("beginIndex" "int") ("endIndex" "int")) :STATIC NIL)
     (flash:replace-elements :SWF-NAME "replaceElements" :RETURN-TYPE
      "__AS3__.vec::Vector<flash.text.engine::ContentElement>" :ARGS
      (("beginIndex" "int") ("endIndex" "int")
       ("newElements"
        "__AS3__.vec::Vector<flash.text.engine::ContentElement>"))
      :STATIC NIL)
     (flash:set-elements :SWF-NAME "setElements" :RETURN-TYPE "void" :ARGS
      (("value" "__AS3__.vec::Vector<flash.text.engine::ContentElement>"))
      :STATIC NIL)
     (flash:group-elements :SWF-NAME "groupElements" :RETURN-TYPE
      "flash.text.engine::GroupElement" :ARGS
      (("beginIndex" "int") ("endIndex" "int")) :STATIC NIL)
     (flash:split-text-element :SWF-NAME "splitTextElement" :RETURN-TYPE
      "flash.text.engine::TextElement" :ARGS
      (("elementIndex" "int") ("splitIndex" "int")) :STATIC NIL)
     (flash:get-element-index :SWF-NAME "getElementIndex" :RETURN-TYPE "int"
      :ARGS (("element" "flash.text.engine::ContentElement")) :STATIC NIL)
     (flash:get-element-at-char-index :SWF-NAME "getElementAtCharIndex"
      :RETURN-TYPE "flash.text.engine::ContentElement" :ARGS
      (("charIndex" "int")) :STATIC NIL)
     (flash:get-element-at :SWF-NAME "getElementAt" :RETURN-TYPE
      "flash.text.engine::ContentElement" :ARGS (("index" "int")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.net-connection (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::NetConnection"
    :constants
    ()
    :properties
    ((flash::connected-proxy-type :SWF-NAME "connectedProxyType" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.connected-proxy-type)
     (flash::far-nonce :SWF-NAME "farNonce" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.far-nonce)
     (flash::far-id :SWF-NAME "farID" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.far-id)
     (flash::using-tls :SWF-NAME "usingTLS" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.using-tls)
     (flash::near-nonce :SWF-NAME "nearNonce" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.near-nonce)
     (flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding)
     (flash::max-peer-connections :SWF-NAME "maxPeerConnections" :TYPE "uint"
      :STATIC NIL :ACCESSOR flash:.max-peer-connections)
     (flash::uri :SWF-NAME "uri" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.uri)
     (flash::client :SWF-NAME "client" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.client)
     (flash::connected :SWF-NAME "connected" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.connected)
     (flash::proxy-type :SWF-NAME "proxyType" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.proxy-type)
     (flash::protocol :SWF-NAME "protocol" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.protocol)
     (flash::near-id :SWF-NAME "nearID" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.near-id)
     (flash::unconnected-peer-streams :SWF-NAME "unconnectedPeerStreams" :TYPE
      "Array" :STATIC NIL :ACCESSOR flash:.unconnected-peer-streams)
     (flash::default-object-encoding :SWF-NAME "defaultObjectEncoding" :TYPE
      "uint" :STATIC T :ACCESSOR flash:.default-object-encoding))
    :methods
    ((flash:call :SWF-NAME "call" :RETURN-TYPE "void" :ARGS
      (("command" "String") ("responder" "flash.net::Responder")) :STATIC NIL)
     (flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:add-header :SWF-NAME "addHeader" :RETURN-TYPE "void" :ARGS
      (("operation" "String") &OPTIONAL ("mustUnderstand" "Boolean")
       (("param" "Object") "FALSE"))
      :STATIC NIL)
     (flash:connect :SWF-NAME "connect" :RETURN-TYPE "void" :ARGS
      (("command" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.display-object-container (flash:flash.display.interactive-object)
    :swf-name "flash.display::DisplayObjectContainer"
    :constants
    ()
    :properties
    ((flash::tab-children :SWF-NAME "tabChildren" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.tab-children)
     (flash::text-snapshot :SWF-NAME "textSnapshot" :TYPE
      "flash.text::TextSnapshot" :STATIC NIL :ACCESSOR flash:.text-snapshot)
     (flash::num-children :SWF-NAME "numChildren" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.num-children)
     (flash::mouse-children :SWF-NAME "mouseChildren" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.mouse-children))
    :methods
    ((flash:set-child-index :SWF-NAME "setChildIndex" :RETURN-TYPE "void" :ARGS
      (("child" "flash.display::DisplayObject") ("index" "int")) :STATIC NIL)
     (flash:are-inaccessible-objects-under-point :SWF-NAME
      "areInaccessibleObjectsUnderPoint" :RETURN-TYPE "Boolean" :ARGS
      (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:add-child :SWF-NAME "addChild" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:get-child-at :SWF-NAME "getChildAt" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS (("index" "int")) :STATIC NIL)
     (flash:remove-child :SWF-NAME "removeChild" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:get-objects-under-point :SWF-NAME "getObjectsUnderPoint"
      :RETURN-TYPE "Array" :ARGS (("point" "flash.geom::Point")) :STATIC NIL)
     (flash:swap-children :SWF-NAME "swapChildren" :RETURN-TYPE "void" :ARGS
      (("child1" "flash.display::DisplayObject")
       ("child2" "flash.display::DisplayObject"))
      :STATIC NIL)
     (flash:add-child-at :SWF-NAME "addChildAt" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject") ("index" "int")) :STATIC NIL)
     (flash:get-child-index :SWF-NAME "getChildIndex" :RETURN-TYPE "int" :ARGS
      (("child" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:remove-child-at :SWF-NAME "removeChildAt" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS (("index" "int")) :STATIC NIL)
     (flash:get-child-by-name :SWF-NAME "getChildByName" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS (("name" "String")) :STATIC NIL)
     (flash:swap-children-at :SWF-NAME "swapChildrenAt" :RETURN-TYPE "void"
      :ARGS (("index1" "int") ("index2" "int")) :STATIC NIL)
     (flash:contains :SWF-NAME "contains" :RETURN-TYPE "Boolean" :ARGS
      (("child" "flash.display::DisplayObject")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.sprite (flash:flash.display.display-object-container)
    :swf-name "flash.display::Sprite"
    :constants
    ()
    :properties
    ((flash::button-mode :SWF-NAME "buttonMode" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.button-mode)
     (flash::use-hand-cursor :SWF-NAME "useHandCursor" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.use-hand-cursor)
     (flash::graphics :SWF-NAME "graphics" :TYPE "flash.display::Graphics"
      :STATIC NIL :ACCESSOR flash:.graphics)
     (flash::hit-area :SWF-NAME "hitArea" :TYPE "flash.display::Sprite" :STATIC
      NIL :ACCESSOR flash:.hit-area)
     (flash::sound-transform :SWF-NAME "soundTransform" :TYPE
      "flash.media::SoundTransform" :STATIC NIL :ACCESSOR
      flash:.sound-transform)
     (flash::drop-target :SWF-NAME "dropTarget" :TYPE
      "flash.display::DisplayObject" :STATIC NIL :ACCESSOR flash:.drop-target))
    :methods
    ((flash:start-drag :SWF-NAME "startDrag" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL ("lockCenter" "Boolean")
       (("bounds" "flash.geom::Rectangle") "FALSE"))
      :STATIC NIL)
     (flash:stop-drag :SWF-NAME "stopDrag" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.movie-clip (flash:flash.display.sprite)
    :swf-name "flash.display::MovieClip"
    :constants
    ()
    :properties
    ((flash::current-labels :SWF-NAME "currentLabels" :TYPE "Array" :STATIC NIL
      :ACCESSOR flash:.current-labels)
     (flash::current-label :SWF-NAME "currentLabel" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.current-label)
     (flash::track-as-menu :SWF-NAME "trackAsMenu" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.track-as-menu)
     (flash::current-scene :SWF-NAME "currentScene" :TYPE
      "flash.display::Scene" :STATIC NIL :ACCESSOR flash:.current-scene)
     (flash::current-frame :SWF-NAME "currentFrame" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.current-frame)
     (flash::enabled :SWF-NAME "enabled" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.enabled)
     (flash::frames-loaded :SWF-NAME "framesLoaded" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.frames-loaded)
     (flash::total-frames :SWF-NAME "totalFrames" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.total-frames)
     (flash::scenes :SWF-NAME "scenes" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.scenes)
     (flash::current-frame-label :SWF-NAME "currentFrameLabel" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.current-frame-label))
    :methods
    ((flash:play :SWF-NAME "play" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:next-frame :SWF-NAME "nextFrame" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:prev-scene :SWF-NAME "prevScene" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:add-frame-script :SWF-NAME "addFrameScript" :RETURN-TYPE "void"
      :ARGS NIL :STATIC NIL)
     (flash:goto-and-stop :SWF-NAME "gotoAndStop" :RETURN-TYPE "void" :ARGS
      (("frame" "Object") &OPTIONAL ("scene" "String")) :STATIC NIL)
     (flash:next-scene :SWF-NAME "nextScene" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:goto-and-play :SWF-NAME "gotoAndPlay" :RETURN-TYPE "void" :ARGS
      (("frame" "Object") &OPTIONAL ("scene" "String")) :STATIC NIL)
     (flash:stop :SWF-NAME "stop" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:prev-frame :SWF-NAME "prevFrame" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.net-status-event (flash:flash.events.event)
    :swf-name "flash.events::NetStatusEvent"
    :constants
    ((flash:+net-status-event.net-status+ :SWF-NAME "NET_STATUS" :TYPE "String"
      :VALUE "netStatus" :STATIC T))
    :properties
    ((flash::info :SWF-NAME "info" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.info))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.grid-fit-type (flash:object)
    :swf-name "flash.text::GridFitType"
    :constants
    ((flash:+grid-fit-type.pixel+ :SWF-NAME "PIXEL" :TYPE "String" :VALUE
      "pixel" :STATIC T)
     (flash:+grid-fit-type.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE "none"
      :STATIC T)
     (flash:+grid-fit-type.subpixel+ :SWF-NAME "SUBPIXEL" :TYPE "String" :VALUE
      "subpixel" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.caps-style (flash:object)
    :swf-name "flash.display::CapsStyle"
    :constants
    ((flash:+caps-style.round+ :SWF-NAME "ROUND" :TYPE "String" :VALUE "round"
      :STATIC T)
     (flash:+caps-style.square+ :SWF-NAME "SQUARE" :TYPE "String" :VALUE
      "square" :STATIC T)
     (flash:+caps-style.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE "none"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.file-filter (flash:object)
    :swf-name "flash.net::FileFilter"
    :constants
    ()
    :properties
    ((flash::extension :SWF-NAME "extension" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.extension)
     (flash::description :SWF-NAME "description" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.description)
     (flash::mac-type :SWF-NAME "macType" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.mac-type))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.font-lookup (flash:object)
    :swf-name "flash.text.engine::FontLookup"
    :constants
    ((flash:+font-lookup.device+ :SWF-NAME "DEVICE" :TYPE "String" :VALUE
      "device" :STATIC T)
     (flash:+font-lookup.embedded-cff+ :SWF-NAME "EMBEDDED_CFF" :TYPE "String"
      :VALUE "embeddedCFF" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.url-request-header (flash:object)
    :swf-name "flash.net::URLRequestHeader"
    :constants
    ()
    :properties
    ((flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name)
     (flash::value :SWF-NAME "value" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.value))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-display-mode (flash:object)
    :swf-name "flash.text::TextDisplayMode"
    :constants
    ((flash:+text-display-mode.lcd+ :SWF-NAME "LCD" :TYPE "String" :VALUE "lcd"
      :STATIC T)
     (flash:+text-display-mode.crt+ :SWF-NAME "CRT" :TYPE "String" :VALUE "crt"
      :STATIC T)
     (flash:+text-display-mode.default+ :SWF-NAME "DEFAULT" :TYPE "String"
      :VALUE "default" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.csm-settings (flash:object)
    :swf-name "flash.text::CSMSettings"
    :constants
    ()
    :properties
    ((flash::inside-cutoff :SWF-NAME "insideCutoff" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.inside-cutoff)
     (flash::outside-cutoff :SWF-NAME "outsideCutoff" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.outside-cutoff)
     (flash::font-size :SWF-NAME "fontSize" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.font-size))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.endian (flash:object)
    :swf-name "flash.utils::Endian"
    :constants
    ((flash:+endian.little-endian+ :SWF-NAME "LITTLE_ENDIAN" :TYPE "String"
      :VALUE "littleEndian" :STATIC T)
     (flash:+endian.big-endian+ :SWF-NAME "BIG_ENDIAN" :TYPE "String" :VALUE
      "bigEndian" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.font-type (flash:object)
    :swf-name "flash.text::FontType"
    :constants
    ((flash:+font-type.embedded-cff+ :SWF-NAME "EMBEDDED_CFF" :TYPE "String"
      :VALUE "embeddedCFF" :STATIC T)
     (flash:+font-type.embedded+ :SWF-NAME "EMBEDDED" :TYPE "String" :VALUE
      "embedded" :STATIC T)
     (flash:+font-type.device+ :SWF-NAME "DEVICE" :TYPE "String" :VALUE
      "device" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.simple-button (flash:flash.display.interactive-object)
    :swf-name "flash.display::SimpleButton"
    :constants
    ()
    :properties
    ((flash::over-state :SWF-NAME "overState" :TYPE
      "flash.display::DisplayObject" :STATIC NIL :ACCESSOR flash:.over-state)
     (flash::track-as-menu :SWF-NAME "trackAsMenu" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.track-as-menu)
     (flash::use-hand-cursor :SWF-NAME "useHandCursor" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.use-hand-cursor)
     (flash::up-state :SWF-NAME "upState" :TYPE "flash.display::DisplayObject"
      :STATIC NIL :ACCESSOR flash:.up-state)
     (flash::sound-transform :SWF-NAME "soundTransform" :TYPE
      "flash.media::SoundTransform" :STATIC NIL :ACCESSOR
      flash:.sound-transform)
     (flash::down-state :SWF-NAME "downState" :TYPE
      "flash.display::DisplayObject" :STATIC NIL :ACCESSOR flash:.down-state)
     (flash::hit-test-state :SWF-NAME "hitTestState" :TYPE
      "flash.display::DisplayObject" :STATIC NIL :ACCESSOR
      flash:.hit-test-state)
     (flash::enabled :SWF-NAME "enabled" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.enabled))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defconstant flash:+flash-proxy+ "flash.utils::flash_proxy" "*")
  (avm2-compiler::declare-swf-class flash::flash.utils.proxy (flash:object)
    :swf-name "flash.utils::Proxy"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:has-property :SWF-NAME "hasProperty" :RETURN-TYPE "Boolean" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:set-property :SWF-NAME "setProperty" :RETURN-TYPE "void" :ARGS
      (("name" "*") ("value" "*")) :STATIC NIL)
     (flash:next-value :SWF-NAME "nextValue" :RETURN-TYPE "*" :ARGS
      (("index" "int")) :STATIC NIL)
     (flash:get-property :SWF-NAME "getProperty" :RETURN-TYPE "*" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:get-descendants :SWF-NAME "getDescendants" :RETURN-TYPE "*" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:next-name :SWF-NAME "nextName" :RETURN-TYPE "String" :ARGS
      (("index" "int")) :STATIC NIL)
     (flash:next-name-index :SWF-NAME "nextNameIndex" :RETURN-TYPE "int" :ARGS
      (("index" "int")) :STATIC NIL)
     (flash:call-property :SWF-NAME "callProperty" :RETURN-TYPE "*" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:is-attribute :SWF-NAME "isAttribute" :RETURN-TYPE "Boolean" :ARGS
      (("name" "*")) :STATIC NIL)
     (flash:delete-property :SWF-NAME "deleteProperty" :RETURN-TYPE "Boolean"
      :ARGS (("name" "*")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.security-panel (flash:object)
    :swf-name "flash.system::SecurityPanel"
    :constants
    ((flash:+security-panel.display+ :SWF-NAME "DISPLAY" :TYPE "String" :VALUE
      "display" :STATIC T)
     (flash:+security-panel.settings-manager+ :SWF-NAME "SETTINGS_MANAGER"
      :TYPE "String" :VALUE "settingsManager" :STATIC T)
     (flash:+security-panel.microphone+ :SWF-NAME "MICROPHONE" :TYPE "String"
      :VALUE "microphone" :STATIC T)
     (flash:+security-panel.privacy+ :SWF-NAME "PRIVACY" :TYPE "String" :VALUE
      "privacy" :STATIC T)
     (flash:+security-panel.local-storage+ :SWF-NAME "LOCAL_STORAGE" :TYPE
      "String" :VALUE "localStorage" :STATIC T)
     (flash:+security-panel.camera+ :SWF-NAME "CAMERA" :TYPE "String" :VALUE
      "camera" :STATIC T)
     (flash:+security-panel.default+ :SWF-NAME "DEFAULT" :TYPE "String" :VALUE
      "default" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.glow-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::GlowFilter"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::alpha :SWF-NAME "alpha" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.alpha)
     (flash::knockout :SWF-NAME "knockout" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.knockout)
     (flash::inner :SWF-NAME "inner" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.inner)
     (flash::blur-y :SWF-NAME "blurY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-y)
     (flash::blur-x :SWF-NAME "blurX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.blur-x)
     (flash::color :SWF-NAME "color" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.color)
     (flash::strength :SWF-NAME "strength" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.strength))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
   (avm2-compiler::swf-ffi-defun-find-prop-strict flash::flash.debugger.enter-debugger "flash.debugger::enterDebugger"
    NIL "void")
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.url-variables (flash:object)
    :swf-name "flash.net::URLVariables"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:decode :SWF-NAME "decode" :RETURN-TYPE "void" :ARGS
      (("source" "String")) :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.full-screen-event (flash:flash.events.activity-event)
    :swf-name "flash.events::FullScreenEvent"
    :constants
    ((flash:+full-screen-event.full-screen+ :SWF-NAME "FULL_SCREEN" :TYPE
      "String" :VALUE "fullScreen" :STATIC T))
    :properties
    ((flash::full-screen :SWF-NAME "fullScreen" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.full-screen))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.net-stream-play-transitions (flash:object)
    :swf-name "flash.net::NetStreamPlayTransitions"
    :constants
    ((flash:+net-stream-play-transitions.reset+ :SWF-NAME "RESET" :TYPE "*"
      :VALUE "reset" :STATIC T)
     (flash:+net-stream-play-transitions.append+ :SWF-NAME "APPEND" :TYPE "*"
      :VALUE "append" :STATIC T)
     (flash:+net-stream-play-transitions.stop+ :SWF-NAME "STOP" :TYPE "*"
      :VALUE "stop" :STATIC T)
     (flash:+net-stream-play-transitions.switch+ :SWF-NAME "SWITCH" :TYPE "*"
      :VALUE "switch" :STATIC T)
     (flash:+net-stream-play-transitions.swap+ :SWF-NAME "SWAP" :TYPE "*"
      :VALUE "swap" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.digit-case (flash:object)
    :swf-name "flash.text.engine::DigitCase"
    :constants
    ((flash:+digit-case.old-style+ :SWF-NAME "OLD_STYLE" :TYPE "String" :VALUE
      "oldStyle" :STATIC T)
     (flash:+digit-case.default+ :SWF-NAME "DEFAULT" :TYPE "String" :VALUE
      "default" :STATIC T)
     (flash:+digit-case.lining+ :SWF-NAME "LINING" :TYPE "String" :VALUE
      "lining" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.sound-loader-context (flash:object)
    :swf-name "flash.media::SoundLoaderContext"
    :constants
    ()
    :properties
    ((flash::check-policy-file :SWF-NAME "checkPolicyFile" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.check-policy-file)
     (flash::buffer-time :SWF-NAME "bufferTime" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.buffer-time))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.file-reference-list (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::FileReferenceList"
    :constants
    ()
    :properties
    ((flash::file-list :SWF-NAME "fileList" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.file-list))
    :methods
    ((flash:browse :SWF-NAME "browse" :RETURN-TYPE "Boolean" :ARGS
      (&OPTIONAL ("typeFilter" "Array")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.shader-event (flash:flash.events.event)
    :swf-name "flash.events::ShaderEvent"
    :constants
    ((flash:+shader-event.complete+ :SWF-NAME "COMPLETE" :TYPE "String" :VALUE
      "complete" :STATIC T))
    :properties
    ((flash::bitmap-data :SWF-NAME "bitmapData" :TYPE
      "flash.display::BitmapData" :STATIC NIL :ACCESSOR flash:.bitmap-data)
     (flash::byte-array :SWF-NAME "byteArray" :TYPE "flash.utils::ByteArray"
      :STATIC NIL :ACCESSOR flash:.byte-array)
     (flash::vector :SWF-NAME "vector" :TYPE "__AS3__.vec::Vector<Number>"
      :STATIC NIL :ACCESSOR flash:.vector))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-line-mirror-region (flash:object)
    :swf-name "flash.text.engine::TextLineMirrorRegion"
    :constants
    ()
    :properties
    ((flash::mirror :SWF-NAME "mirror" :TYPE "flash.events::EventDispatcher"
      :STATIC NIL :ACCESSOR flash:.mirror)
     (flash::element :SWF-NAME "element" :TYPE
      "flash.text.engine::ContentElement" :STATIC NIL :ACCESSOR flash:.element)
     (flash::previous-region :SWF-NAME "previousRegion" :TYPE
      "flash.text.engine::TextLineMirrorRegion" :STATIC NIL :ACCESSOR
      flash:.previous-region)
     (flash::next-region :SWF-NAME "nextRegion" :TYPE
      "flash.text.engine::TextLineMirrorRegion" :STATIC NIL :ACCESSOR
      flash:.next-region)
     (flash::bounds :SWF-NAME "bounds" :TYPE "flash.geom::Rectangle" :STATIC
      NIL :ACCESSOR flash:.bounds)
     (flash::text-line :SWF-NAME "textLine" :TYPE "flash.text.engine::TextLine"
      :STATIC NIL :ACCESSOR flash:.text-line))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.bitmap-filter-quality (flash:object)
    :swf-name "flash.filters::BitmapFilterQuality"
    :constants
    ((flash:+bitmap-filter-quality.high+ :SWF-NAME "HIGH" :TYPE "int" :VALUE
      "3" :STATIC T)
     (flash:+bitmap-filter-quality.medium+ :SWF-NAME "MEDIUM" :TYPE "int"
      :VALUE "2" :STATIC T)
     (flash:+bitmap-filter-quality.low+ :SWF-NAME "LOW" :TYPE "int" :VALUE "1"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-format (flash:object)
    :swf-name "flash.text::TextFormat"
    :constants
    ()
    :properties
    ((flash::letter-spacing :SWF-NAME "letterSpacing" :TYPE "Object" :STATIC
      NIL :ACCESSOR flash:.letter-spacing)
     (flash::right-margin :SWF-NAME "rightMargin" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.right-margin)
     (flash::italic :SWF-NAME "italic" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.italic)
     (flash::url :SWF-NAME "url" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.url)
     (flash::indent :SWF-NAME "indent" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.indent)
     (flash::target :SWF-NAME "target" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.target)
     (flash::underline :SWF-NAME "underline" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.underline)
     (flash::color :SWF-NAME "color" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.color)
     (flash::tab-stops :SWF-NAME "tabStops" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.tab-stops)
     (flash::kerning :SWF-NAME "kerning" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.kerning)
     (flash::block-indent :SWF-NAME "blockIndent" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.block-indent)
     (flash::left-margin :SWF-NAME "leftMargin" :TYPE "Object" :STATIC NIL
      :ACCESSOR flash:.left-margin)
     (flash::font :SWF-NAME "font" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.font)
     (flash::leading :SWF-NAME "leading" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.leading)
     (flash::bold :SWF-NAME "bold" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.bold)
     (flash::display :SWF-NAME "display" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.display)
     (flash::align :SWF-NAME "align" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.align)
     (flash::bullet :SWF-NAME "bullet" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.bullet)
     (flash::size :SWF-NAME "size" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.size))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics (flash:object)
    :swf-name "flash.display::Graphics"
    :constants
    ()
    :properties
    ()
    :methods
    ((flash:copy-from :SWF-NAME "copyFrom" :RETURN-TYPE "void" :ARGS
      (("sourceGraphics" "flash.display::Graphics")) :STATIC NIL)
     (flash:end-fill :SWF-NAME "endFill" :RETURN-TYPE "void" :ARGS NIL :STATIC
      NIL)
     (flash:draw-ellipse :SWF-NAME "drawEllipse" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number"))
      :STATIC NIL)
     (flash:draw-graphics-data :SWF-NAME "drawGraphicsData" :RETURN-TYPE "void"
      :ARGS
      (("graphicsData" "__AS3__.vec::Vector<flash.display::IGraphicsData>"))
      :STATIC NIL)
     (flash:line-shader-style :SWF-NAME "lineShaderStyle" :RETURN-TYPE "void"
      :ARGS
      (("shader" "flash.display::Shader") &OPTIONAL
       ("matrix" "flash.geom::Matrix"))
      :STATIC NIL)
     (flash:line-bitmap-style :SWF-NAME "lineBitmapStyle" :RETURN-TYPE "void"
      :ARGS
      (("bitmap" "flash.display::BitmapData") &OPTIONAL
       (("matrix" "flash.geom::Matrix") "FALSE") (("repeat" "Boolean") "T")
       ("smooth" "Boolean"))
      :STATIC NIL)
     (flash:draw-circle :SWF-NAME "drawCircle" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number") ("radius" "Number")) :STATIC NIL)
     (flash:draw-round-rect :SWF-NAME "drawRoundRect" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number")
       ("ellipseWidth" "Number") &OPTIONAL
       (("ellipseHeight" "Number") "UNDEFINED"))
      :STATIC NIL)
     (flash:move-to :SWF-NAME "moveTo" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:draw-round-rect-complex :SWF-NAME "drawRoundRectComplex"
      :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number")
       ("topLeftRadius" "Number") ("topRightRadius" "Number")
       ("bottomLeftRadius" "Number") ("bottomRightRadius" "Number"))
      :STATIC NIL)
     (flash:line-style :SWF-NAME "lineStyle" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL (("thickness" "Number") "3") ("color" "uint")
       ("alpha" "Number") (("pixelHinting" "Boolean") "normal")
       (("scaleMode" "String") "FALSE") (("caps" "String") "1.0d0")
       (("joints" "String") "0") (("miterLimit" "Number") "UNDEFINED"))
      :STATIC NIL)
     (flash:begin-gradient-fill :SWF-NAME "beginGradientFill" :RETURN-TYPE
      "void" :ARGS
      (("type" "String") ("colors" "Array") ("alphas" "Array")
       ("ratios" "Array") &OPTIONAL (("matrix" "flash.geom::Matrix") "0")
       (("spreadMethod" "String") "rgb")
       (("interpolationMethod" "String") "pad") ("focalPointRatio" "Number"))
      :STATIC NIL)
     (flash:begin-bitmap-fill :SWF-NAME "beginBitmapFill" :RETURN-TYPE "void"
      :ARGS
      (("bitmap" "flash.display::BitmapData") &OPTIONAL
       (("matrix" "flash.geom::Matrix") "FALSE") (("repeat" "Boolean") "T")
       ("smooth" "Boolean"))
      :STATIC NIL)
     (flash:line-gradient-style :SWF-NAME "lineGradientStyle" :RETURN-TYPE
      "void" :ARGS
      (("type" "String") ("colors" "Array") ("alphas" "Array")
       ("ratios" "Array") &OPTIONAL (("matrix" "flash.geom::Matrix") "0")
       (("spreadMethod" "String") "rgb")
       (("interpolationMethod" "String") "pad") ("focalPointRatio" "Number"))
      :STATIC NIL)
     (flash:begin-shader-fill :SWF-NAME "beginShaderFill" :RETURN-TYPE "void"
      :ARGS
      (("shader" "flash.display::Shader") &OPTIONAL
       ("matrix" "flash.geom::Matrix"))
      :STATIC NIL)
     (flash:line-to :SWF-NAME "lineTo" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number")) :STATIC NIL)
     (flash:clear :SWF-NAME "clear" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:begin-fill :SWF-NAME "beginFill" :RETURN-TYPE "void" :ARGS
      (("color" "uint") &OPTIONAL (("alpha" "Number") "1.0d0")) :STATIC NIL)
     (flash:curve-to :SWF-NAME "curveTo" :RETURN-TYPE "void" :ARGS
      (("controlX" "Number") ("controlY" "Number") ("anchorX" "Number")
       ("anchorY" "Number"))
      :STATIC NIL)
     (flash:draw-path :SWF-NAME "drawPath" :RETURN-TYPE "void" :ARGS
      (("commands" "__AS3__.vec::Vector<int>")
       ("data" "__AS3__.vec::Vector<Number>") &OPTIONAL
       (("winding" "String") "evenOdd"))
      :STATIC NIL)
     (flash:draw-rect :SWF-NAME "drawRect" :RETURN-TYPE "void" :ARGS
      (("x" "Number") ("y" "Number") ("width" "Number") ("height" "Number"))
      :STATIC NIL)
     (flash:draw-triangles :SWF-NAME "drawTriangles" :RETURN-TYPE "void" :ARGS
      (("vertices" "__AS3__.vec::Vector<Number>") &OPTIONAL
       (("indices" "__AS3__.vec::Vector<int>") "none")
       ("uvtData" "__AS3__.vec::Vector<Number>") ("culling" "String"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.timer-event (flash:flash.events.event)
    :swf-name "flash.events::TimerEvent"
    :constants
    ((flash:+timer-event.timer+ :SWF-NAME "TIMER" :TYPE "String" :VALUE "timer"
      :STATIC T)
     (flash:+timer-event.timer-complete+ :SWF-NAME "TIMER_COMPLETE" :TYPE
      "String" :VALUE "timerComplete" :STATIC T))
    :properties
    ()
    :methods
    ((flash:update-after-event :SWF-NAME "updateAfterEvent" :RETURN-TYPE "void"
      :ARGS NIL :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.object-output (flash:object)
    :swf-name "flash.utils::ObjectOutput"
    :constants
    ()
    :properties
    ((flash::object-encoding :SWF-NAME "objectEncoding" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.object-encoding)
     (flash::endian :SWF-NAME "endian" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.endian))
    :methods
    ((flash:write-float :SWF-NAME "writeFloat" :RETURN-TYPE "void" :ARGS
      (("value" "Number")) :STATIC NIL)
     (flash:write-int :SWF-NAME "writeInt" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:write-short :SWF-NAME "writeShort" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:write-unsigned-int :SWF-NAME "writeUnsignedInt" :RETURN-TYPE "void"
      :ARGS (("value" "uint")) :STATIC NIL)
     (flash:write-double :SWF-NAME "writeDouble" :RETURN-TYPE "void" :ARGS
      (("value" "Number")) :STATIC NIL)
     (flash:write-utf :SWF-NAME "writeUTF" :RETURN-TYPE "void" :ARGS
      (("value" "String")) :STATIC NIL)
     (flash:write-byte :SWF-NAME "writeByte" :RETURN-TYPE "void" :ARGS
      (("value" "int")) :STATIC NIL)
     (flash:write-bytes :SWF-NAME "writeBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL (("offset" "uint") "0")
       (("length" "uint") "0"))
      :STATIC NIL)
     (flash:write-boolean :SWF-NAME "writeBoolean" :RETURN-TYPE "void" :ARGS
      (("value" "Boolean")) :STATIC NIL)
     (flash:write-object :SWF-NAME "writeObject" :RETURN-TYPE "void" :ARGS
      (("object" "*")) :STATIC NIL)
     (flash:write-utf-bytes :SWF-NAME "writeUTFBytes" :RETURN-TYPE "void" :ARGS
      (("value" "String")) :STATIC NIL)
     (flash:write-multi-byte :SWF-NAME "writeMultiByte" :RETURN-TYPE "void"
      :ARGS (("value" "String") ("charSet" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.utils.i-externalizable ()
    :swf-name "flash.utils::IExternalizable"
    :constants
    ()
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.sound (flash:flash.events.event-dispatcher)
    :swf-name "flash.media::Sound"
    :constants
    ()
    :properties
    ((flash::is-buffering :SWF-NAME "isBuffering" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.is-buffering)
     (flash::bytes-total :SWF-NAME "bytesTotal" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.bytes-total)
     (flash::id3 :SWF-NAME "id3" :TYPE "flash.media::ID3Info" :STATIC NIL
      :ACCESSOR flash:.id3)
     (flash::length :SWF-NAME "length" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.length)
     (flash::bytes-loaded :SWF-NAME "bytesLoaded" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.bytes-loaded)
     (flash::url :SWF-NAME "url" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.url))
    :methods
    ((flash:play :SWF-NAME "play" :RETURN-TYPE "flash.media::SoundChannel"
      :ARGS
      (&OPTIONAL ("startTime" "Number") (("loops" "int") "0")
       (("sndTransform" "flash.media::SoundTransform") "0"))
      :STATIC NIL)
     (flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:load :SWF-NAME "load" :RETURN-TYPE "void" :ARGS
      (("stream" "flash.net::URLRequest") &OPTIONAL
       ("context" "flash.media::SoundLoaderContext"))
      :STATIC NIL)
     (flash:extract :SWF-NAME "extract" :RETURN-TYPE "Number" :ARGS
      (("target" "flash.utils::ByteArray") ("length" "Number") &OPTIONAL
       (("startPosition" "Number") "-1"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.style-sheet (flash:flash.events.event-dispatcher)
    :swf-name "flash.text::StyleSheet"
    :constants
    ()
    :properties
    ((flash::style-names :SWF-NAME "styleNames" :TYPE "Array" :STATIC NIL
      :ACCESSOR flash:.style-names))
    :methods
    ((flash:get-style :SWF-NAME "getStyle" :RETURN-TYPE "Object" :ARGS
      (("styleName" "String")) :STATIC NIL)
     (flash:parse-css :SWF-NAME "parseCSS" :RETURN-TYPE "void" :ARGS
      (("CSSText" "String")) :STATIC NIL)
     (flash:set-style :SWF-NAME "setStyle" :RETURN-TYPE "void" :ARGS
      (("styleName" "String") ("styleObject" "Object")) :STATIC NIL)
     (flash:clear :SWF-NAME "clear" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:transform :SWF-NAME "transform" :RETURN-TYPE
      "flash.text::TextFormat" :ARGS (("formatObject" "Object")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.line-justification (flash:object)
    :swf-name "flash.text.engine::LineJustification"
    :constants
    ((flash:+line-justification.all-including-last+ :SWF-NAME
      "ALL_INCLUDING_LAST" :TYPE "String" :VALUE "allIncludingLast" :STATIC T)
     (flash:+line-justification.unjustified+ :SWF-NAME "UNJUSTIFIED" :TYPE
      "String" :VALUE "unjustified" :STATIC T)
     (flash:+line-justification.all-but-last+ :SWF-NAME "ALL_BUT_LAST" :TYPE
      "String" :VALUE "allButLast" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-line-validity (flash:object)
    :swf-name "flash.text.engine::TextLineValidity"
    :constants
    ((flash:+text-line-validity.possibly-invalid+ :SWF-NAME "POSSIBLY_INVALID"
      :TYPE "String" :VALUE "possiblyInvalid" :STATIC T)
     (flash:+text-line-validity.valid+ :SWF-NAME "VALID" :TYPE "String" :VALUE
      "valid" :STATIC T)
     (flash:+text-line-validity.invalid+ :SWF-NAME "INVALID" :TYPE "String"
      :VALUE "invalid" :STATIC T)
     (flash:+text-line-validity.static+ :SWF-NAME "STATIC" :TYPE "String"
      :VALUE "static" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.loader (flash:flash.display.display-object-container)
    :swf-name "flash.display::Loader"
    :constants
    ()
    :properties
    ((flash::content :SWF-NAME "content" :TYPE "flash.display::DisplayObject"
      :STATIC NIL :ACCESSOR flash:.content)
     (flash::content-loader-info :SWF-NAME "contentLoaderInfo" :TYPE
      "flash.display::LoaderInfo" :STATIC NIL :ACCESSOR
      flash:.content-loader-info))
    :methods
    ((flash:unload :SWF-NAME "unload" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:add-child :SWF-NAME "addChild" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:unload-and-stop :SWF-NAME "unloadAndStop" :RETURN-TYPE "void" :ARGS
      (&OPTIONAL (("gc" "Boolean") "T")) :STATIC NIL)
     (flash:close :SWF-NAME "close" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:remove-child-at :SWF-NAME "removeChildAt" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS (("index" "int")) :STATIC NIL)
     (flash:set-child-index :SWF-NAME "setChildIndex" :RETURN-TYPE "void" :ARGS
      (("child" "flash.display::DisplayObject") ("index" "int")) :STATIC NIL)
     (flash:add-child-at :SWF-NAME "addChildAt" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject") ("index" "int")) :STATIC NIL)
     (flash:load-bytes :SWF-NAME "loadBytes" :RETURN-TYPE "void" :ARGS
      (("bytes" "flash.utils::ByteArray") &OPTIONAL
       ("context" "flash.system::LoaderContext"))
      :STATIC NIL)
     (flash:remove-child :SWF-NAME "removeChild" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:load :SWF-NAME "load" :RETURN-TYPE "void" :ARGS
      (("request" "flash.net::URLRequest") &OPTIONAL
       ("context" "flash.system::LoaderContext"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.blend-mode (flash:object)
    :swf-name "flash.display::BlendMode"
    :constants
    ((flash:+blend-mode.difference+ :SWF-NAME "DIFFERENCE" :TYPE "String"
      :VALUE "difference" :STATIC T)
     (flash:+blend-mode.layer+ :SWF-NAME "LAYER" :TYPE "String" :VALUE "layer"
      :STATIC T)
     (flash:+blend-mode.overlay+ :SWF-NAME "OVERLAY" :TYPE "String" :VALUE
      "overlay" :STATIC T)
     (flash:+blend-mode.screen+ :SWF-NAME "SCREEN" :TYPE "String" :VALUE
      "screen" :STATIC T)
     (flash:+blend-mode.hardlight+ :SWF-NAME "HARDLIGHT" :TYPE "String" :VALUE
      "hardlight" :STATIC T)
     (flash:+blend-mode.normal+ :SWF-NAME "NORMAL" :TYPE "String" :VALUE
      "normal" :STATIC T)
     (flash:+blend-mode.darken+ :SWF-NAME "DARKEN" :TYPE "String" :VALUE
      "darken" :STATIC T)
     (flash:+blend-mode.shader+ :SWF-NAME "SHADER" :TYPE "String" :VALUE
      "shader" :STATIC T)
     (flash:+blend-mode.multiply+ :SWF-NAME "MULTIPLY" :TYPE "String" :VALUE
      "multiply" :STATIC T)
     (flash:+blend-mode.lighten+ :SWF-NAME "LIGHTEN" :TYPE "String" :VALUE
      "lighten" :STATIC T)
     (flash:+blend-mode.invert+ :SWF-NAME "INVERT" :TYPE "String" :VALUE
      "invert" :STATIC T)
     (flash:+blend-mode.subtract+ :SWF-NAME "SUBTRACT" :TYPE "String" :VALUE
      "subtract" :STATIC T)
     (flash:+blend-mode.alpha+ :SWF-NAME "ALPHA" :TYPE "String" :VALUE "alpha"
      :STATIC T)
     (flash:+blend-mode.erase+ :SWF-NAME "ERASE" :TYPE "String" :VALUE "erase"
      :STATIC T)
     (flash:+blend-mode.add+ :SWF-NAME "ADD" :TYPE "String" :VALUE "add"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.point (flash:object)
    :swf-name "flash.geom::Point"
    :constants
    ()
    :properties
    ((flash::y :SWF-NAME "y" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.y)
     (flash::x :SWF-NAME "x" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.x)
     (flash::length :SWF-NAME "length" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.length))
    :methods
    ((flash:equals :SWF-NAME "equals" :RETURN-TYPE "Boolean" :ARGS
      (("toCompare" "flash.geom::Point")) :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.geom::Point" :ARGS NIL
      :STATIC NIL)
     (flash:offset :SWF-NAME "offset" :RETURN-TYPE "void" :ARGS
      (("dx" "Number") ("dy" "Number")) :STATIC NIL)
     (flash:subtract :SWF-NAME "subtract" :RETURN-TYPE "flash.geom::Point"
      :ARGS (("v" "flash.geom::Point")) :STATIC NIL)
     (flash:normalize :SWF-NAME "normalize" :RETURN-TYPE "void" :ARGS
      (("thickness" "Number")) :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:add :SWF-NAME "add" :RETURN-TYPE "flash.geom::Point" :ARGS
      (("v" "flash.geom::Point")) :STATIC NIL)
     (flash::point.polar :SWF-NAME "polar" :RETURN-TYPE "flash.geom::Point"
      :ARGS (("len" "Number") ("angle" "Number")) :STATIC T)
     (flash::point.distance :SWF-NAME "distance" :RETURN-TYPE "Number" :ARGS
      (("pt1" "flash.geom::Point") ("pt2" "flash.geom::Point")) :STATIC T)
     (flash::point.interpolate :SWF-NAME "interpolate" :RETURN-TYPE
      "flash.geom::Point" :ARGS
      (("pt1" "flash.geom::Point") ("pt2" "flash.geom::Point") ("f" "Number"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.loader-context (flash:object)
    :swf-name "flash.system::LoaderContext"
    :constants
    ()
    :properties
    ((flash::security-domain :SWF-NAME "securityDomain" :TYPE
      "flash.system::SecurityDomain" :STATIC NIL :ACCESSOR
      flash:.security-domain)
     (flash::check-policy-file :SWF-NAME "checkPolicyFile" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.check-policy-file)
     (flash::application-domain :SWF-NAME "applicationDomain" :TYPE
      "flash.system::ApplicationDomain" :STATIC NIL :ACCESSOR
      flash:.application-domain))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.jpeg-loader-context (flash:flash.system.loader-context)
    :swf-name "flash.system::JPEGLoaderContext"
    :constants
    ()
    :properties
    ((flash::deblocking-filter :SWF-NAME "deblockingFilter" :TYPE "Number"
      :STATIC NIL :ACCESSOR flash:.deblocking-filter))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.mouse-event (flash:flash.events.event)
    :swf-name "flash.events::MouseEvent"
    :constants
    ((flash:+mouse-event.roll-over+ :SWF-NAME "ROLL_OVER" :TYPE "String" :VALUE
      "rollOver" :STATIC T)
     (flash:+mouse-event.mouse-down+ :SWF-NAME "MOUSE_DOWN" :TYPE "String"
      :VALUE "mouseDown" :STATIC T)
     (flash:+mouse-event.double-click+ :SWF-NAME "DOUBLE_CLICK" :TYPE "String"
      :VALUE "doubleClick" :STATIC T)
     (flash:+mouse-event.mouse-up+ :SWF-NAME "MOUSE_UP" :TYPE "String" :VALUE
      "mouseUp" :STATIC T)
     (flash:+mouse-event.mouse-out+ :SWF-NAME "MOUSE_OUT" :TYPE "String" :VALUE
      "mouseOut" :STATIC T)
     (flash:+mouse-event.click+ :SWF-NAME "CLICK" :TYPE "String" :VALUE "click"
      :STATIC T)
     (flash:+mouse-event.mouse-over+ :SWF-NAME "MOUSE_OVER" :TYPE "String"
      :VALUE "mouseOver" :STATIC T)
     (flash:+mouse-event.roll-out+ :SWF-NAME "ROLL_OUT" :TYPE "String" :VALUE
      "rollOut" :STATIC T)
     (flash:+mouse-event.mouse-move+ :SWF-NAME "MOUSE_MOVE" :TYPE "String"
      :VALUE "mouseMove" :STATIC T)
     (flash:+mouse-event.mouse-wheel+ :SWF-NAME "MOUSE_WHEEL" :TYPE "String"
      :VALUE "mouseWheel" :STATIC T))
    :properties
    ((flash::delta :SWF-NAME "delta" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.delta)
     (flash::shift-key :SWF-NAME "shiftKey" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.shift-key)
     (flash::alt-key :SWF-NAME "altKey" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.alt-key)
     (flash::ctrl-key :SWF-NAME "ctrlKey" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.ctrl-key)
     (flash::stage-x :SWF-NAME "stageX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.stage-x)
     (flash::stage-y :SWF-NAME "stageY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.stage-y)
     (flash::local-y :SWF-NAME "localY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.local-y)
     (flash::local-x :SWF-NAME "localX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.local-x)
     (flash::related-object :SWF-NAME "relatedObject" :TYPE
      "flash.display::InteractiveObject" :STATIC NIL :ACCESSOR
      flash:.related-object)
     (flash::button-down :SWF-NAME "buttonDown" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.button-down)
     (flash::is-related-object-inaccessible :SWF-NAME
      "isRelatedObjectInaccessible" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.is-related-object-inaccessible))
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:update-after-event :SWF-NAME "updateAfterEvent" :RETURN-TYPE "void"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.font (flash:object)
    :swf-name "flash.text::Font"
    :constants
    ()
    :properties
    ((flash::font-name :SWF-NAME "fontName" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.font-name)
     (flash::font-style :SWF-NAME "fontStyle" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.font-style)
     (flash::font-type :SWF-NAME "fontType" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.font-type))
    :methods
    ((flash:has-glyphs :SWF-NAME "hasGlyphs" :RETURN-TYPE "Boolean" :ARGS
      (("str" "String")) :STATIC NIL)
     (flash::font.register-font :SWF-NAME "registerFont" :RETURN-TYPE "void"
      :ARGS (("font" "Class")) :STATIC T)
     (flash::font.enumerate-fonts :SWF-NAME "enumerateFonts" :RETURN-TYPE
      "Array" :ARGS (&OPTIONAL (("enumerateDeviceFonts" "Boolean") "FALSE"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-baseline (flash:object)
    :swf-name "flash.text.engine::TextBaseline"
    :constants
    ((flash:+text-baseline.roman+ :SWF-NAME "ROMAN" :TYPE "String" :VALUE
      "roman" :STATIC T)
     (flash:+text-baseline.ascent+ :SWF-NAME "ASCENT" :TYPE "String" :VALUE
      "ascent" :STATIC T)
     (flash:+text-baseline.ideographic-top+ :SWF-NAME "IDEOGRAPHIC_TOP" :TYPE
      "String" :VALUE "ideographicTop" :STATIC T)
     (flash:+text-baseline.ideographic-center+ :SWF-NAME "IDEOGRAPHIC_CENTER"
      :TYPE "String" :VALUE "ideographicCenter" :STATIC T)
     (flash:+text-baseline.use-dominant-baseline+ :SWF-NAME
      "USE_DOMINANT_BASELINE" :TYPE "String" :VALUE "useDominantBaseline"
      :STATIC T)
     (flash:+text-baseline.ideographic-bottom+ :SWF-NAME "IDEOGRAPHIC_BOTTOM"
      :TYPE "String" :VALUE "ideographicBottom" :STATIC T)
     (flash:+text-baseline.descent+ :SWF-NAME "DESCENT" :TYPE "String" :VALUE
      "descent" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.stage (flash:flash.display.display-object-container)
    :swf-name "flash.display::Stage"
    :constants
    ()
    :properties
    ((flash::quality :SWF-NAME "quality" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.quality)
     (flash::stage-focus-rect :SWF-NAME "stageFocusRect" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.stage-focus-rect)
     (flash::display-state :SWF-NAME "displayState" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.display-state)
     (flash::color-correction-support :SWF-NAME "colorCorrectionSupport" :TYPE
      "String" :STATIC NIL :ACCESSOR flash:.color-correction-support)
     (flash::frame-rate :SWF-NAME "frameRate" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.frame-rate)
     (flash::stage-width :SWF-NAME "stageWidth" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.stage-width)
     (flash::full-screen-height :SWF-NAME "fullScreenHeight" :TYPE "uint"
      :STATIC NIL :ACCESSOR flash:.full-screen-height)
     (flash::full-screen-source-rect :SWF-NAME "fullScreenSourceRect" :TYPE
      "flash.geom::Rectangle" :STATIC NIL :ACCESSOR
      flash:.full-screen-source-rect)
     (flash::focus :SWF-NAME "focus" :TYPE "flash.display::InteractiveObject"
      :STATIC NIL :ACCESSOR flash:.focus)
     (flash::width :SWF-NAME "width" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::stage-height :SWF-NAME "stageHeight" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.stage-height)
     (flash::mouse-children :SWF-NAME "mouseChildren" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.mouse-children)
     (flash::tab-children :SWF-NAME "tabChildren" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.tab-children)
     (flash::full-screen-width :SWF-NAME "fullScreenWidth" :TYPE "uint" :STATIC
      NIL :ACCESSOR flash:.full-screen-width)
     (flash::text-snapshot :SWF-NAME "textSnapshot" :TYPE
      "flash.text::TextSnapshot" :STATIC NIL :ACCESSOR flash:.text-snapshot)
     (flash::height :SWF-NAME "height" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::num-children :SWF-NAME "numChildren" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.num-children)
     (flash::color-correction :SWF-NAME "colorCorrection" :TYPE "String"
      :STATIC NIL :ACCESSOR flash:.color-correction)
     (flash::show-default-context-menu :SWF-NAME "showDefaultContextMenu" :TYPE
      "Boolean" :STATIC NIL :ACCESSOR flash:.show-default-context-menu)
     (flash::scale-mode :SWF-NAME "scaleMode" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.scale-mode)
     (flash::align :SWF-NAME "align" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.align))
    :methods
    ((flash:add-child :SWF-NAME "addChild" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject")) :STATIC NIL)
     (flash:dispatch-event :SWF-NAME "dispatchEvent" :RETURN-TYPE "Boolean"
      :ARGS (("event" "flash.events::Event")) :STATIC NIL)
     (flash:add-event-listener :SWF-NAME "addEventListener" :RETURN-TYPE "void"
      :ARGS
      (("type" "String") ("listener" "Function") &OPTIONAL
       (("useCapture" "Boolean") "FALSE") (("priority" "int") "0")
       (("useWeakReference" "Boolean") "FALSE"))
      :STATIC NIL)
     (flash:remove-child-at :SWF-NAME "removeChildAt" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS (("index" "int")) :STATIC NIL)
     (flash:invalidate :SWF-NAME "invalidate" :RETURN-TYPE "void" :ARGS NIL
      :STATIC NIL)
     (flash:swap-children-at :SWF-NAME "swapChildrenAt" :RETURN-TYPE "void"
      :ARGS (("index1" "int") ("index2" "int")) :STATIC NIL)
     (flash:set-child-index :SWF-NAME "setChildIndex" :RETURN-TYPE "void" :ARGS
      (("child" "flash.display::DisplayObject") ("index" "int")) :STATIC NIL)
     (flash:add-child-at :SWF-NAME "addChildAt" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS
      (("child" "flash.display::DisplayObject") ("index" "int")) :STATIC NIL)
     (flash:has-event-listener :SWF-NAME "hasEventListener" :RETURN-TYPE
      "Boolean" :ARGS (("type" "String")) :STATIC NIL)
     (flash:is-focus-inaccessible :SWF-NAME "isFocusInaccessible" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC NIL)
     (flash:will-trigger :SWF-NAME "willTrigger" :RETURN-TYPE "Boolean" :ARGS
      (("type" "String")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.graphics-solid-fill (flash:object)
    :swf-name "flash.display::GraphicsSolidFill"
    :constants
    ()
    :properties
    ((flash::alpha :SWF-NAME "alpha" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.alpha)
     (flash::color :SWF-NAME "color" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.color))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.transform (flash:object)
    :swf-name "flash.geom::Transform"
    :constants
    ()
    :properties
    ((flash::pixel-bounds :SWF-NAME "pixelBounds" :TYPE "flash.geom::Rectangle"
      :STATIC NIL :ACCESSOR flash:.pixel-bounds)
     (flash::concatenated-color-transform :SWF-NAME
      "concatenatedColorTransform" :TYPE "flash.geom::ColorTransform" :STATIC
      NIL :ACCESSOR flash:.concatenated-color-transform)
     (flash::matrix3-d :SWF-NAME "matrix3D" :TYPE "flash.geom::Matrix3D"
      :STATIC NIL :ACCESSOR flash:.matrix3-d)
     (flash::concatenated-matrix :SWF-NAME "concatenatedMatrix" :TYPE
      "flash.geom::Matrix" :STATIC NIL :ACCESSOR flash:.concatenated-matrix)
     (flash::perspective-projection :SWF-NAME "perspectiveProjection" :TYPE
      "flash.geom::PerspectiveProjection" :STATIC NIL :ACCESSOR
      flash:.perspective-projection)
     (flash::color-transform :SWF-NAME "colorTransform" :TYPE
      "flash.geom::ColorTransform" :STATIC NIL :ACCESSOR flash:.color-transform)
     (flash::matrix :SWF-NAME "matrix" :TYPE "flash.geom::Matrix" :STATIC NIL
      :ACCESSOR flash:.matrix))
    :methods
    ((flash:get-relative-matrix3-d :SWF-NAME "getRelativeMatrix3D" :RETURN-TYPE
      "flash.geom::Matrix3D" :ARGS
      (("relativeTo" "flash.display::DisplayObject")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.context-menu-clipboard-items (flash:object)
    :swf-name "flash.ui::ContextMenuClipboardItems"
    :constants
    ()
    :properties
    ((flash::clear :SWF-NAME "clear" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.clear)
     (flash::select-all :SWF-NAME "selectAll" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.select-all)
     (flash::copy :SWF-NAME "copy" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.copy)
     (flash::paste :SWF-NAME "paste" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.paste)
     (flash::cut :SWF-NAME "cut" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.cut))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE
      "flash.ui::ContextMenuClipboardItems" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.system.security (flash:object)
    :swf-name "flash.system::Security"
    :constants
    ((flash:+security.local-with-network+ :SWF-NAME "LOCAL_WITH_NETWORK" :TYPE
      "String" :VALUE "localWithNetwork" :STATIC T)
     (flash:+security.local-with-file+ :SWF-NAME "LOCAL_WITH_FILE" :TYPE
      "String" :VALUE "localWithFile" :STATIC T)
     (flash:+security.remote+ :SWF-NAME "REMOTE" :TYPE "String" :VALUE "remote"
      :STATIC T)
     (flash:+security.local-trusted+ :SWF-NAME "LOCAL_TRUSTED" :TYPE "String"
      :VALUE "localTrusted" :STATIC T))
    :properties
    ((flash::disable-avm1-loading :SWF-NAME "disableAVM1Loading" :TYPE
      "Boolean" :STATIC T :ACCESSOR flash:.disable-avm1-loading)
     (flash::exact-settings :SWF-NAME "exactSettings" :TYPE "Boolean" :STATIC T
      :ACCESSOR flash:.exact-settings)
     (flash::sandbox-type :SWF-NAME "sandboxType" :TYPE "String" :STATIC T
      :ACCESSOR flash:.sandbox-type))
    :methods
    ((flash::security.load-policy-file :SWF-NAME "loadPolicyFile" :RETURN-TYPE
      "void" :ARGS (("url" "String")) :STATIC T)
     (flash::security.allow-insecure-domain :SWF-NAME "allowInsecureDomain"
      :RETURN-TYPE "void" :ARGS NIL :STATIC T)
     (flash::security.allow-domain :SWF-NAME "allowDomain" :RETURN-TYPE "void"
      :ARGS NIL :STATIC T)
     (flash::security.show-settings :SWF-NAME "showSettings" :RETURN-TYPE
      "void" :ARGS (&OPTIONAL (("panel" "String") "default")) :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.keyboard-event (flash:flash.events.event)
    :swf-name "flash.events::KeyboardEvent"
    :constants
    ((flash:+keyboard-event.key-up+ :SWF-NAME "KEY_UP" :TYPE "String" :VALUE
      "keyUp" :STATIC T)
     (flash:+keyboard-event.key-down+ :SWF-NAME "KEY_DOWN" :TYPE "String"
      :VALUE "keyDown" :STATIC T))
    :properties
    ((flash::shift-key :SWF-NAME "shiftKey" :TYPE "Boolean" :STATIC NIL
      :ACCESSOR flash:.shift-key)
     (flash::alt-key :SWF-NAME "altKey" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.alt-key)
     (flash::ctrl-key :SWF-NAME "ctrlKey" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.ctrl-key)
     (flash::char-code :SWF-NAME "charCode" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.char-code)
     (flash::key-code :SWF-NAME "keyCode" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.key-code)
     (flash::key-location :SWF-NAME "keyLocation" :TYPE "uint" :STATIC NIL
      :ACCESSOR flash:.key-location))
    :methods
    ((flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)
     (flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:update-after-event :SWF-NAME "updateAfterEvent" :RETURN-TYPE "void"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.spread-method (flash:object)
    :swf-name "flash.display::SpreadMethod"
    :constants
    ((flash:+spread-method.reflect+ :SWF-NAME "REFLECT" :TYPE "String" :VALUE
      "reflect" :STATIC T)
     (flash:+spread-method.repeat+ :SWF-NAME "REPEAT" :TYPE "String" :VALUE
      "repeat" :STATIC T)
     (flash:+spread-method.pad+ :SWF-NAME "PAD" :TYPE "String" :VALUE "pad"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shader-input (flash:object)
    :swf-name "flash.display::ShaderInput"
    :constants
    ()
    :properties
    ((flash::input :SWF-NAME "input" :TYPE "Object" :STATIC NIL :ACCESSOR
      flash:.input)
     (flash::height :SWF-NAME "height" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::width :SWF-NAME "width" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::index :SWF-NAME "index" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.index)
     (flash::channels :SWF-NAME "channels" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.channels))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.shader-parameter-type (flash:object)
    :swf-name "flash.display::ShaderParameterType"
    :constants
    ((flash:+shader-parameter-type.float4+ :SWF-NAME "FLOAT4" :TYPE "String"
      :VALUE "float4" :STATIC T)
     (flash:+shader-parameter-type.float+ :SWF-NAME "FLOAT" :TYPE "String"
      :VALUE "float" :STATIC T)
     (flash:+shader-parameter-type.float3+ :SWF-NAME "FLOAT3" :TYPE "String"
      :VALUE "float3" :STATIC T)
     (flash:+shader-parameter-type.float2+ :SWF-NAME "FLOAT2" :TYPE "String"
      :VALUE "float2" :STATIC T)
     (flash:+shader-parameter-type.matrix4-x4+ :SWF-NAME "MATRIX4X4" :TYPE
      "String" :VALUE "matrix4x4" :STATIC T)
     (flash:+shader-parameter-type.matrix3-x3+ :SWF-NAME "MATRIX3X3" :TYPE
      "String" :VALUE "matrix3x3" :STATIC T)
     (flash:+shader-parameter-type.matrix2-x2+ :SWF-NAME "MATRIX2X2" :TYPE
      "String" :VALUE "matrix2x2" :STATIC T)
     (flash:+shader-parameter-type.bool+ :SWF-NAME "BOOL" :TYPE "String" :VALUE
      "bool" :STATIC T)
     (flash:+shader-parameter-type.int+ :SWF-NAME "INT" :TYPE "String" :VALUE
      "int" :STATIC T)
     (flash:+shader-parameter-type.bool4+ :SWF-NAME "BOOL4" :TYPE "String"
      :VALUE "bool4" :STATIC T)
     (flash:+shader-parameter-type.bool3+ :SWF-NAME "BOOL3" :TYPE "String"
      :VALUE "bool3" :STATIC T)
     (flash:+shader-parameter-type.bool2+ :SWF-NAME "BOOL2" :TYPE "String"
      :VALUE "bool2" :STATIC T)
     (flash:+shader-parameter-type.int4+ :SWF-NAME "INT4" :TYPE "String" :VALUE
      "int4" :STATIC T)
     (flash:+shader-parameter-type.int3+ :SWF-NAME "INT3" :TYPE "String" :VALUE
      "int3" :STATIC T)
     (flash:+shader-parameter-type.int2+ :SWF-NAME "INT2" :TYPE "String" :VALUE
      "int2" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.event-phase (flash:object)
    :swf-name "flash.events::EventPhase"
    :constants
    ((flash:+event-phase.capturing-phase+ :SWF-NAME "CAPTURING_PHASE" :TYPE
      "uint" :VALUE "1" :STATIC T)
     (flash:+event-phase.at-target+ :SWF-NAME "AT_TARGET" :TYPE "uint" :VALUE
      "2" :STATIC T)
     (flash:+event-phase.bubbling-phase+ :SWF-NAME "BUBBLING_PHASE" :TYPE
      "uint" :VALUE "3" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.text-line (flash:flash.display.display-object-container)
    :swf-name "flash.text.engine::TextLine"
    :constants
    ((flash:+text-line.max-line-width+ :SWF-NAME "MAX_LINE_WIDTH" :TYPE "int"
      :VALUE "1000000" :STATIC T))
    :properties
    ((flash::atom-count :SWF-NAME "atomCount" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.atom-count)
     (flash::raw-text-length :SWF-NAME "rawTextLength" :TYPE "int" :STATIC NIL
      :ACCESSOR flash:.raw-text-length)
     (flash::specified-width :SWF-NAME "specifiedWidth" :TYPE "Number" :STATIC
      NIL :ACCESSOR flash:.specified-width)
     (flash::text-height :SWF-NAME "textHeight" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.text-height)
     (flash::validity :SWF-NAME "validity" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.validity)
     (flash::has-graphic-element :SWF-NAME "hasGraphicElement" :TYPE "Boolean"
      :STATIC NIL :ACCESSOR flash:.has-graphic-element)
     (flash::text-block-begin-index :SWF-NAME "textBlockBeginIndex" :TYPE "int"
      :STATIC NIL :ACCESSOR flash:.text-block-begin-index)
     (flash::text-block :SWF-NAME "textBlock" :TYPE
      "flash.text.engine::TextBlock" :STATIC NIL :ACCESSOR flash:.text-block)
     (flash::ascent :SWF-NAME "ascent" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.ascent)
     (flash::text-width :SWF-NAME "textWidth" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.text-width)
     (flash::user-data :SWF-NAME "userData" :TYPE "*" :STATIC NIL :ACCESSOR
      flash:.user-data)
     (flash::unjustified-text-width :SWF-NAME "unjustifiedTextWidth" :TYPE
      "Number" :STATIC NIL :ACCESSOR flash:.unjustified-text-width)
     (flash::previous-line :SWF-NAME "previousLine" :TYPE
      "flash.text.engine::TextLine" :STATIC NIL :ACCESSOR flash:.previous-line)
     (flash::next-line :SWF-NAME "nextLine" :TYPE "flash.text.engine::TextLine"
      :STATIC NIL :ACCESSOR flash:.next-line)
     (flash::descent :SWF-NAME "descent" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.descent)
     (flash::mirror-regions :SWF-NAME "mirrorRegions" :TYPE
      "__AS3__.vec::Vector<flash.text.engine::TextLineMirrorRegion>" :STATIC
      NIL :ACCESSOR flash:.mirror-regions))
    :methods
    ((flash:flush-atom-data :SWF-NAME "flushAtomData" :RETURN-TYPE "void" :ARGS
      NIL :STATIC NIL)
     (flash:get-atom-center :SWF-NAME "getAtomCenter" :RETURN-TYPE "Number"
      :ARGS (("atomIndex" "int")) :STATIC NIL)
     (flash:get-atom-text-rotation :SWF-NAME "getAtomTextRotation" :RETURN-TYPE
      "String" :ARGS (("atomIndex" "int")) :STATIC NIL)
     (flash:get-atom-text-block-end-index :SWF-NAME "getAtomTextBlockEndIndex"
      :RETURN-TYPE "int" :ARGS (("atomIndex" "int")) :STATIC NIL)
     (flash:get-atom-bounds :SWF-NAME "getAtomBounds" :RETURN-TYPE
      "flash.geom::Rectangle" :ARGS (("atomIndex" "int")) :STATIC NIL)
     (flash:get-atom-text-block-begin-index :SWF-NAME
      "getAtomTextBlockBeginIndex" :RETURN-TYPE "int" :ARGS
      (("atomIndex" "int")) :STATIC NIL)
     (flash:get-atom-word-boundary-on-left :SWF-NAME
      "getAtomWordBoundaryOnLeft" :RETURN-TYPE "Boolean" :ARGS
      (("atomIndex" "int")) :STATIC NIL)
     (flash:get-atom-index-at-char-index :SWF-NAME "getAtomIndexAtCharIndex"
      :RETURN-TYPE "int" :ARGS (("charIndex" "int")) :STATIC NIL)
     (flash:get-atom-index-at-point :SWF-NAME "getAtomIndexAtPoint"
      :RETURN-TYPE "int" :ARGS (("stageX" "Number") ("stageY" "Number"))
      :STATIC NIL)
     (flash:get-atom-bidi-level :SWF-NAME "getAtomBidiLevel" :RETURN-TYPE "int"
      :ARGS (("atomIndex" "int")) :STATIC NIL)
     (flash:dump :SWF-NAME "dump" :RETURN-TYPE "String" :ARGS NIL :STATIC NIL)
     (flash:get-mirror-region :SWF-NAME "getMirrorRegion" :RETURN-TYPE
      "flash.text.engine::TextLineMirrorRegion" :ARGS
      (("mirror" "flash.events::EventDispatcher")) :STATIC NIL)
     (flash:get-baseline-position :SWF-NAME "getBaselinePosition" :RETURN-TYPE
      "Number" :ARGS (("baseline" "String")) :STATIC NIL)
     (flash:get-atom-graphic :SWF-NAME "getAtomGraphic" :RETURN-TYPE
      "flash.display::DisplayObject" :ARGS (("atomIndex" "int")) :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.pixel-snapping (flash:object)
    :swf-name "flash.display::PixelSnapping"
    :constants
    ((flash:+pixel-snapping.auto+ :SWF-NAME "AUTO" :TYPE "String" :VALUE "auto"
      :STATIC T)
     (flash:+pixel-snapping.never+ :SWF-NAME "NEVER" :TYPE "String" :VALUE
      "never" :STATIC T)
     (flash:+pixel-snapping.always+ :SWF-NAME "ALWAYS" :TYPE "String" :VALUE
      "always" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-line-metrics (flash:object)
    :swf-name "flash.text::TextLineMetrics"
    :constants
    ()
    :properties
    ((flash::descent :SWF-NAME "descent" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.descent)
     (flash::x :SWF-NAME "x" :TYPE "Number" :STATIC NIL :ACCESSOR flash:.x)
     (flash::leading :SWF-NAME "leading" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.leading)
     (flash::height :SWF-NAME "height" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.height)
     (flash::width :SWF-NAME "width" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.width)
     (flash::ascent :SWF-NAME "ascent" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.ascent))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.file-reference (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::FileReference"
    :constants
    ()
    :properties
    ((flash::data :SWF-NAME "data" :TYPE "flash.utils::ByteArray" :STATIC NIL
      :ACCESSOR flash:.data)
     (flash::modification-date :SWF-NAME "modificationDate" :TYPE "Date"
      :STATIC NIL :ACCESSOR flash:.modification-date)
     (flash::creation-date :SWF-NAME "creationDate" :TYPE "Date" :STATIC NIL
      :ACCESSOR flash:.creation-date)
     (flash::creator :SWF-NAME "creator" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.creator)
     (flash::name :SWF-NAME "name" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.name)
     (flash::type :SWF-NAME "type" :TYPE "String" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::size :SWF-NAME "size" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.size))
    :methods
    ((flash:save :SWF-NAME "save" :RETURN-TYPE "void" :ARGS
      (("data" "*") &OPTIONAL ("defaultFileName" "String")) :STATIC NIL)
     (flash:cancel :SWF-NAME "cancel" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:download :SWF-NAME "download" :RETURN-TYPE "void" :ARGS
      (("request" "flash.net::URLRequest") &OPTIONAL
       ("defaultFileName" "String"))
      :STATIC NIL)
     (flash:browse :SWF-NAME "browse" :RETURN-TYPE "Boolean" :ARGS
      (&OPTIONAL ("typeFilter" "Array")) :STATIC NIL)
     (flash:load :SWF-NAME "load" :RETURN-TYPE "void" :ARGS NIL :STATIC NIL)
     (flash:upload :SWF-NAME "upload" :RETURN-TYPE "void" :ARGS
      (("request" "flash.net::URLRequest") &OPTIONAL
       (("uploadDataFieldName" "String") "FALSE")
       (("testUpload" "Boolean") "Filedata"))
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.stage-scale-mode (flash:object)
    :swf-name "flash.display::StageScaleMode"
    :constants
    ((flash:+stage-scale-mode.show-all+ :SWF-NAME "SHOW_ALL" :TYPE "String"
      :VALUE "showAll" :STATIC T)
     (flash:+stage-scale-mode.no-scale+ :SWF-NAME "NO_SCALE" :TYPE "String"
      :VALUE "noScale" :STATIC T)
     (flash:+stage-scale-mode.no-border+ :SWF-NAME "NO_BORDER" :TYPE "String"
      :VALUE "noBorder" :STATIC T)
     (flash:+stage-scale-mode.exact-fit+ :SWF-NAME "EXACT_FIT" :TYPE "String"
      :VALUE "exactFit" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.shared-object-flush-status (flash:object)
    :swf-name "flash.net::SharedObjectFlushStatus"
    :constants
    ((flash:+shared-object-flush-status.pending+ :SWF-NAME "PENDING" :TYPE
      "String" :VALUE "pending" :STATIC T)
     (flash:+shared-object-flush-status.flushed+ :SWF-NAME "FLUSHED" :TYPE
      "String" :VALUE "flushed" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.text-field-auto-size (flash:object)
    :swf-name "flash.text::TextFieldAutoSize"
    :constants
    ((flash:+text-field-auto-size.right+ :SWF-NAME "RIGHT" :TYPE "String"
      :VALUE "right" :STATIC T)
     (flash:+text-field-auto-size.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE
      "none" :STATIC T)
     (flash:+text-field-auto-size.left+ :SWF-NAME "LEFT" :TYPE "String" :VALUE
      "left" :STATIC T)
     (flash:+text-field-auto-size.center+ :SWF-NAME "CENTER" :TYPE "String"
      :VALUE "center" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.printing.print-job-orientation (flash:object)
    :swf-name "flash.printing::PrintJobOrientation"
    :constants
    ((flash:+print-job-orientation.portrait+ :SWF-NAME "PORTRAIT" :TYPE
      "String" :VALUE "portrait" :STATIC T)
     (flash:+print-job-orientation.landscape+ :SWF-NAME "LANDSCAPE" :TYPE
      "String" :VALUE "landscape" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.events.http-status-event (flash:flash.events.event)
    :swf-name "flash.events::HTTPStatusEvent"
    :constants
    ((flash:+http-status-event.http-status+ :SWF-NAME "HTTP_STATUS" :TYPE
      "String" :VALUE "httpStatus" :STATIC T))
    :properties
    ((flash::status :SWF-NAME "status" :TYPE "int" :STATIC NIL :ACCESSOR
      flash:.status))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.events::Event" :ARGS
      NIL :STATIC NIL)
     (flash:to-string :SWF-NAME "toString" :RETURN-TYPE "String" :ARGS NIL
      :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.filters.convolution-filter (flash:flash.filters.bitmap-filter)
    :swf-name "flash.filters::ConvolutionFilter"
    :constants
    ()
    :properties
    ((flash::divisor :SWF-NAME "divisor" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.divisor)
     (flash::clamp :SWF-NAME "clamp" :TYPE "Boolean" :STATIC NIL :ACCESSOR
      flash:.clamp)
     (flash::bias :SWF-NAME "bias" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.bias)
     (flash::matrix-y :SWF-NAME "matrixY" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.matrix-y)
     (flash::matrix-x :SWF-NAME "matrixX" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.matrix-x)
     (flash::preserve-alpha :SWF-NAME "preserveAlpha" :TYPE "Boolean" :STATIC
      NIL :ACCESSOR flash:.preserve-alpha)
     (flash::alpha :SWF-NAME "alpha" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.alpha)
     (flash::color :SWF-NAME "color" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.color)
     (flash::matrix :SWF-NAME "matrix" :TYPE "Array" :STATIC NIL :ACCESSOR
      flash:.matrix))
    :methods
    ((flash:clone :SWF-NAME "clone" :RETURN-TYPE "flash.filters::BitmapFilter"
      :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.ui.key-location (flash:object)
    :swf-name "flash.ui::KeyLocation"
    :constants
    ((flash:+key-location.standard+ :SWF-NAME "STANDARD" :TYPE "uint" :VALUE
      "0" :STATIC T)
     (flash:+key-location.right+ :SWF-NAME "RIGHT" :TYPE "uint" :VALUE "2"
      :STATIC T)
     (flash:+key-location.left+ :SWF-NAME "LEFT" :TYPE "uint" :VALUE "1"
      :STATIC T)
     (flash:+key-location.num-pad+ :SWF-NAME "NUM_PAD" :TYPE "uint" :VALUE "3"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.accessibility.accessibility (flash:object)
    :swf-name "flash.accessibility::Accessibility"
    :constants
    ()
    :properties
    ((flash::active :SWF-NAME "active" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.active))
    :methods
    ((flash::accessibility.update-properties :SWF-NAME "updateProperties"
      :RETURN-TYPE "void" :ARGS NIL :STATIC T)
     (flash::accessibility.send-event :SWF-NAME "sendEvent" :RETURN-TYPE "void"
      :ARGS
      (("source" "flash.display::DisplayObject") ("childID" "uint")
       ("eventType" "uint") &OPTIONAL (("nonHTML" "Boolean") "FALSE"))
      :STATIC T)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.geom.perspective-projection (flash:object)
    :swf-name "flash.geom::PerspectiveProjection"
    :constants
    ()
    :properties
    ((flash::focal-length :SWF-NAME "focalLength" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.focal-length)
     (flash::field-of-view :SWF-NAME "fieldOfView" :TYPE "Number" :STATIC NIL
      :ACCESSOR flash:.field-of-view)
     (flash::projection-center :SWF-NAME "projectionCenter" :TYPE
      "flash.geom::Point" :STATIC NIL :ACCESSOR flash:.projection-center))
    :methods
    ((flash:to-matrix3-d :SWF-NAME "toMatrix3D" :RETURN-TYPE
      "flash.geom::Matrix3D" :ARGS NIL :STATIC NIL)))
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.action-script-version (flash:object)
    :swf-name "flash.display::ActionScriptVersion"
    :constants
    ((flash:+action-script-version.actionscript3+ :SWF-NAME "ACTIONSCRIPT3"
      :TYPE "uint" :VALUE "3" :STATIC T)
     (flash:+action-script-version.actionscript2+ :SWF-NAME "ACTIONSCRIPT2"
      :TYPE "uint" :VALUE "2" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.net.net-stream-play-options (flash:flash.events.event-dispatcher)
    :swf-name "flash.net::NetStreamPlayOptions"
    :constants
    ()
    :properties
    ((flash::transition :SWF-NAME "transition" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.transition)
     (flash::stream-name :SWF-NAME "streamName" :TYPE "String" :STATIC NIL
      :ACCESSOR flash:.stream-name)
     (flash::start :SWF-NAME "start" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.start)
     (flash::len :SWF-NAME "len" :TYPE "Number" :STATIC NIL :ACCESSOR
      flash:.len)
     (flash::old-stream-name :SWF-NAME "oldStreamName" :TYPE "String" :STATIC
      NIL :ACCESSOR flash:.old-stream-name))
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.media.sound-codec (flash:object)
    :swf-name "flash.media::SoundCodec"
    :constants
    ((flash:+sound-codec.nellymoser+ :SWF-NAME "NELLYMOSER" :TYPE "String"
      :VALUE "NellyMoser" :STATIC T)
     (flash:+sound-codec.speex+ :SWF-NAME "SPEEX" :TYPE "String" :VALUE "Speex"
      :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.display.triangle-culling (flash:object)
    :swf-name "flash.display::TriangleCulling"
    :constants
    ((flash:+triangle-culling.positive+ :SWF-NAME "POSITIVE" :TYPE "String"
      :VALUE "positive" :STATIC T)
     (flash:+triangle-culling.none+ :SWF-NAME "NONE" :TYPE "String" :VALUE
      "none" :STATIC T)
     (flash:+triangle-culling.negative+ :SWF-NAME "NEGATIVE" :TYPE "String"
      :VALUE "negative" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::flash.text.engine.digit-width (flash:object)
    :swf-name "flash.text.engine::DigitWidth"
    :constants
    ((flash:+digit-width.tabular+ :SWF-NAME "TABULAR" :TYPE "String" :VALUE
      "tabular" :STATIC T)
     (flash:+digit-width.proportional+ :SWF-NAME "PROPORTIONAL" :TYPE "String"
      :VALUE "proportional" :STATIC T)
     (flash:+digit-width.default+ :SWF-NAME "DEFAULT" :TYPE "String" :VALUE
      "default" :STATIC T))
    :properties
    ()
    :methods
    ())
)

(cl:let ((avm2-compiler::*symbol-table* avm2-compiler::*player-symbol-table*))
  (avm2-compiler::declare-swf-class flash::authoring.auth-object (flash:object)
    :swf-name "authoring::authObject"
    :constants
    ()
    :properties
    ((flash::next-sibling :SWF-NAME "NextSibling" :TYPE "authoring::authObject"
      :STATIC NIL :ACCESSOR flash:.next-sibling)
     (flash::first-child :SWF-NAME "FirstChild" :TYPE "authoring::authObject"
      :STATIC NIL :ACCESSOR flash:.first-child)
     (flash::swf-key :SWF-NAME "SwfKey" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.swf-key)
     (flash::type :SWF-NAME "Type" :TYPE "uint" :STATIC NIL :ACCESSOR
      flash:.type)
     (flash::key :SWF-NAME "Key" :TYPE "uint" :STATIC NIL :ACCESSOR flash:.key)
     (flash::off-screen-surface-rendering-enabled :SWF-NAME
      "offScreenSurfaceRenderingEnabled" :TYPE "Boolean" :STATIC T :ACCESSOR
      flash:.off-screen-surface-rendering-enabled))
    :methods
    ((flash:obj-matrix :SWF-NAME "ObjMatrix" :RETURN-TYPE "flash.geom::Matrix"
      :ARGS NIL :STATIC NIL)
     (flash:is-primitive :SWF-NAME "IsPrimitive" :RETURN-TYPE "Boolean" :ARGS
      NIL :STATIC NIL)
     (flash:symbol-mode :SWF-NAME "SymbolMode" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:frame-for-frame-number :SWF-NAME "FrameForFrameNumber" :RETURN-TYPE
      "authoring::authObject" :ARGS (("frameNum" "int")) :STATIC NIL)
     (flash:has-empty-path :SWF-NAME "HasEmptyPath" :RETURN-TYPE "Boolean"
      :ARGS NIL :STATIC NIL)
     (flash:registration-point :SWF-NAME "RegistrationPoint" :RETURN-TYPE
      "flash.geom::Point" :ARGS NIL :STATIC NIL)
     (flash:live-preview-size :SWF-NAME "LivePreviewSize" :RETURN-TYPE
      "flash.geom::Point" :ARGS NIL :STATIC NIL)
     (flash:scale9-grid :SWF-NAME "Scale9Grid" :RETURN-TYPE
      "flash.geom::Rectangle" :ARGS NIL :STATIC NIL)
     (flash:symbol-behavior :SWF-NAME "SymbolBehavior" :RETURN-TYPE "int" :ARGS
      NIL :STATIC NIL)
     (flash:three-d-matrix :SWF-NAME "ThreeDMatrix" :RETURN-TYPE
      "flash.geom::Matrix3D" :ARGS NIL :STATIC NIL)
     (flash:locked :SWF-NAME "Locked" :RETURN-TYPE "Boolean" :ARGS NIL :STATIC
      NIL)
     (flash:frame-type :SWF-NAME "FrameType" :RETURN-TYPE "uint" :ARGS NIL
      :STATIC NIL)
     (flash:outline-mode :SWF-NAME "OutlineMode" :RETURN-TYPE "Boolean" :ARGS
      NIL :STATIC NIL)
     (flash:blending-mode :SWF-NAME "BlendingMode" :RETURN-TYPE "String" :ARGS
      NIL :STATIC NIL)
     (flash:filters :SWF-NAME "Filters" :RETURN-TYPE "Array" :ARGS NIL :STATIC
      NIL)
     (flash:outline-color :SWF-NAME "OutlineColor" :RETURN-TYPE "uint" :ARGS
      NIL :STATIC NIL)
     (flash:is-floater :SWF-NAME "IsFloater" :RETURN-TYPE "Boolean" :ARGS NIL
      :STATIC NIL)
     (flash:center-point :SWF-NAME "CenterPoint" :RETURN-TYPE
      "flash.geom::Point" :ARGS NIL :STATIC NIL)
     (flash:color-x-form :SWF-NAME "ColorXForm" :RETURN-TYPE
      "flash.geom::ColorTransform" :ARGS NIL :STATIC NIL)
     (flash:three-d-translation-handle-points :SWF-NAME
      "ThreeDTranslationHandlePoints" :RETURN-TYPE "Array" :ARGS NIL :STATIC
      NIL)
     (flash:bounds :SWF-NAME "Bounds" :RETURN-TYPE "flash.geom::Rectangle"
      :ARGS
      (("flags" "uint") &OPTIONAL (("minFrame" "int") "16000")
       (("maxFrame" "int") "-16000"))
      :STATIC NIL)
     (flash:motion-path :SWF-NAME "MotionPath" :RETURN-TYPE
      "authoring::authObject" :ARGS NIL :STATIC NIL)
     (flash:has-shape-selection :SWF-NAME "HasShapeSelection" :RETURN-TYPE
      "Boolean" :ARGS NIL :STATIC NIL)
     (flash:start-position :SWF-NAME "StartPosition" :RETURN-TYPE "int" :ARGS
      NIL :STATIC NIL)
     (flash:is-visible :SWF-NAME "IsVisible" :RETURN-TYPE "Boolean" :ARGS
      (("inThumbnailPreview" "Boolean")) :STATIC NIL)
     (flash:is-selected :SWF-NAME "IsSelected" :RETURN-TYPE "Boolean" :ARGS NIL
      :STATIC NIL)
     (flash:end-position :SWF-NAME "EndPosition" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)
     (flash:cache-as-bitmap :SWF-NAME "CacheAsBitmap" :RETURN-TYPE "Boolean"
      :ARGS NIL :STATIC NIL)
     (flash:frame-offset :SWF-NAME "FrameOffset" :RETURN-TYPE "int" :ARGS NIL
      :STATIC NIL)))
)

