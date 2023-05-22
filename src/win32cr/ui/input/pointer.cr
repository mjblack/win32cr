require "../../ui/windowsandmessaging.cr"
require "../../foundation.cr"
require "../../ui/controls.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
lib LibWin32

  enum POINTER_FLAGS : UInt32
    POINTER_FLAG_NONE = 0
    POINTER_FLAG_NEW = 1
    POINTER_FLAG_INRANGE = 2
    POINTER_FLAG_INCONTACT = 4
    POINTER_FLAG_FIRSTBUTTON = 16
    POINTER_FLAG_SECONDBUTTON = 32
    POINTER_FLAG_THIRDBUTTON = 64
    POINTER_FLAG_FOURTHBUTTON = 128
    POINTER_FLAG_FIFTHBUTTON = 256
    POINTER_FLAG_PRIMARY = 8192
    POINTER_FLAG_CONFIDENCE = 16384
    POINTER_FLAG_CANCELED = 32768
    POINTER_FLAG_DOWN = 65536
    POINTER_FLAG_UPDATE = 131072
    POINTER_FLAG_UP = 262144
    POINTER_FLAG_WHEEL = 524288
    POINTER_FLAG_HWHEEL = 1048576
    POINTER_FLAG_CAPTURECHANGED = 2097152
    POINTER_FLAG_HASTRANSFORM = 4194304
  end

  enum TOUCH_FEEDBACK_MODE : UInt32
    TOUCH_FEEDBACK_DEFAULT = 1
    TOUCH_FEEDBACK_INDIRECT = 2
    TOUCH_FEEDBACK_NONE = 3
  end

  enum POINTER_BUTTON_CHANGE_TYPE : Int32
    POINTER_CHANGE_NONE = 0
    POINTER_CHANGE_FIRSTBUTTON_DOWN = 1
    POINTER_CHANGE_FIRSTBUTTON_UP = 2
    POINTER_CHANGE_SECONDBUTTON_DOWN = 3
    POINTER_CHANGE_SECONDBUTTON_UP = 4
    POINTER_CHANGE_THIRDBUTTON_DOWN = 5
    POINTER_CHANGE_THIRDBUTTON_UP = 6
    POINTER_CHANGE_FOURTHBUTTON_DOWN = 7
    POINTER_CHANGE_FOURTHBUTTON_UP = 8
    POINTER_CHANGE_FIFTHBUTTON_DOWN = 9
    POINTER_CHANGE_FIFTHBUTTON_UP = 10
  end

union INPUT_TRANSFORM_Anonymous_e__Union
  anonymous : INPUT_TRANSFORM_Anonymous_e__Union_Anonymous_e__Struct
  m : Float32[16]*
end

  struct POINTER_INFO
    pointer_type : POINTER_INPUT_TYPE
    pointer_id : UInt32
    frame_id : UInt32
    pointer_flags : POINTER_FLAGS
    source_device : LibC::HANDLE
    hwnd_target : HANDLE
    pt_pixel_location : POINT
    pt_himetric_location : POINT
    pt_pixel_location_raw : POINT
    pt_himetric_location_raw : POINT
    dw_time : UInt32
    history_count : UInt32
    input_data : Int32
    dw_key_states : UInt32
    performance_count : UInt64
    button_change_type : POINTER_BUTTON_CHANGE_TYPE
  end
  struct POINTER_TOUCH_INFO
    pointer_info : POINTER_INFO
    touch_flags : UInt32
    touch_mask : UInt32
    rc_contact : RECT
    rc_contact_raw : RECT
    orientation : UInt32
    pressure : UInt32
  end
  struct POINTER_PEN_INFO
    pointer_info : POINTER_INFO
    pen_flags : UInt32
    pen_mask : UInt32
    pressure : UInt32
    rotation : UInt32
    tilt_x : Int32
    tilt_y : Int32
  end
  struct INPUT_INJECTION_VALUE
    page : UInt16
    usage : UInt16
    value : Int32
    index : UInt16
  end
  struct INPUT_TRANSFORM
    anonymous : INPUT_TRANSFORM_Anonymous_e__Union
  end
  struct INPUT_TRANSFORM_Anonymous_e__Union_Anonymous_e__Struct
    _11 : Float32
    _12 : Float32
    _13 : Float32
    _14 : Float32
    _21 : Float32
    _22 : Float32
    _23 : Float32
    _24 : Float32
    _31 : Float32
    _32 : Float32
    _33 : Float32
    _34 : Float32
    _41 : Float32
    _42 : Float32
    _43 : Float32
    _44 : Float32
  end


  # Params # 
  fun GetUnpredictedMessagePos : UInt32

  # Params # maxcount : UInt32 [In],dwmode : TOUCH_FEEDBACK_MODE [In]
  fun InitializeTouchInjection(maxcount : UInt32, dwmode : TOUCH_FEEDBACK_MODE) : LibC::BOOL

  # Params # count : UInt32 [In],contacts : POINTER_TOUCH_INFO* [In]
  fun InjectTouchInput(count : UInt32, contacts : POINTER_TOUCH_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],pointertype : POINTER_INPUT_TYPE* [In]
  fun GetPointerType(pointerid : UInt32, pointertype : POINTER_INPUT_TYPE*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],cursorid : UInt32* [In]
  fun GetPointerCursorId(pointerid : UInt32, cursorid : UInt32*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],pointerinfo : POINTER_INFO* [In]
  fun GetPointerInfo(pointerid : UInt32, pointerinfo : POINTER_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],entriescount : UInt32* [In],pointerinfo : POINTER_INFO* [In]
  fun GetPointerInfoHistory(pointerid : UInt32, entriescount : UInt32*, pointerinfo : POINTER_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],pointercount : UInt32* [In],pointerinfo : POINTER_INFO* [In]
  fun GetPointerFrameInfo(pointerid : UInt32, pointercount : UInt32*, pointerinfo : POINTER_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],entriescount : UInt32* [In],pointercount : UInt32* [In],pointerinfo : POINTER_INFO* [In]
  fun GetPointerFrameInfoHistory(pointerid : UInt32, entriescount : UInt32*, pointercount : UInt32*, pointerinfo : POINTER_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],touchinfo : POINTER_TOUCH_INFO* [In]
  fun GetPointerTouchInfo(pointerid : UInt32, touchinfo : POINTER_TOUCH_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],entriescount : UInt32* [In],touchinfo : POINTER_TOUCH_INFO* [In]
  fun GetPointerTouchInfoHistory(pointerid : UInt32, entriescount : UInt32*, touchinfo : POINTER_TOUCH_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],pointercount : UInt32* [In],touchinfo : POINTER_TOUCH_INFO* [In]
  fun GetPointerFrameTouchInfo(pointerid : UInt32, pointercount : UInt32*, touchinfo : POINTER_TOUCH_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],entriescount : UInt32* [In],pointercount : UInt32* [In],touchinfo : POINTER_TOUCH_INFO* [In]
  fun GetPointerFrameTouchInfoHistory(pointerid : UInt32, entriescount : UInt32*, pointercount : UInt32*, touchinfo : POINTER_TOUCH_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],peninfo : POINTER_PEN_INFO* [In]
  fun GetPointerPenInfo(pointerid : UInt32, peninfo : POINTER_PEN_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],entriescount : UInt32* [In],peninfo : POINTER_PEN_INFO* [In]
  fun GetPointerPenInfoHistory(pointerid : UInt32, entriescount : UInt32*, peninfo : POINTER_PEN_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],pointercount : UInt32* [In],peninfo : POINTER_PEN_INFO* [In]
  fun GetPointerFramePenInfo(pointerid : UInt32, pointercount : UInt32*, peninfo : POINTER_PEN_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],entriescount : UInt32* [In],pointercount : UInt32* [In],peninfo : POINTER_PEN_INFO* [In]
  fun GetPointerFramePenInfoHistory(pointerid : UInt32, entriescount : UInt32*, pointercount : UInt32*, peninfo : POINTER_PEN_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In]
  fun SkipPointerFrameMessages(pointerid : UInt32) : LibC::BOOL

  # Params # device : HSYNTHETICPOINTERDEVICE [In],pointerinfo : POINTER_TYPE_INFO* [In],count : UInt32 [In]
  fun InjectSyntheticPointerInput(device : HSYNTHETICPOINTERDEVICE, pointerinfo : POINTER_TYPE_INFO*, count : UInt32) : LibC::BOOL

  # Params # fenable : LibC::BOOL [In]
  fun EnableMouseInPointer(fenable : LibC::BOOL) : LibC::BOOL

  # Params # 
  fun IsMouseInPointerEnabled : LibC::BOOL

  # Params # pointerid : UInt32 [In],historycount : UInt32 [In],inputtransform : INPUT_TRANSFORM* [In]
  fun GetPointerInputTransform(pointerid : UInt32, historycount : UInt32, inputtransform : INPUT_TRANSFORM*) : LibC::BOOL

  # Params # devicecount : UInt32* [In],pointerdevices : POINTER_DEVICE_INFO* [In]
  fun GetPointerDevices(devicecount : UInt32*, pointerdevices : POINTER_DEVICE_INFO*) : LibC::BOOL

  # Params # device : LibC::HANDLE [In],pointerdevice : POINTER_DEVICE_INFO* [In]
  fun GetPointerDevice(device : LibC::HANDLE, pointerdevice : POINTER_DEVICE_INFO*) : LibC::BOOL

  # Params # device : LibC::HANDLE [In],propertycount : UInt32* [In],pointerproperties : POINTER_DEVICE_PROPERTY* [In]
  fun GetPointerDeviceProperties(device : LibC::HANDLE, propertycount : UInt32*, pointerproperties : POINTER_DEVICE_PROPERTY*) : LibC::BOOL

  # Params # device : LibC::HANDLE [In],pointerdevicerect : RECT* [In],displayrect : RECT* [In]
  fun GetPointerDeviceRects(device : LibC::HANDLE, pointerdevicerect : RECT*, displayrect : RECT*) : LibC::BOOL

  # Params # device : LibC::HANDLE [In],cursorcount : UInt32* [In],devicecursors : POINTER_DEVICE_CURSOR_INFO* [In]
  fun GetPointerDeviceCursors(device : LibC::HANDLE, cursorcount : UInt32*, devicecursors : POINTER_DEVICE_CURSOR_INFO*) : LibC::BOOL

  # Params # pointerid : UInt32 [In],historycount : UInt32 [In],propertiescount : UInt32 [In],pproperties : POINTER_DEVICE_PROPERTY* [In],pvalues : Int32* [In]
  fun GetRawPointerDeviceData(pointerid : UInt32, historycount : UInt32, propertiescount : UInt32, pproperties : POINTER_DEVICE_PROPERTY*, pvalues : Int32*) : LibC::BOOL
end
