require "./../windows_and_messaging.cr"
require "./../../foundation.cr"
require "./../controls.cr"

module Win32cr::UI::Input::Pointer

  @[Flags]
  enum POINTER_FLAGS : UInt32
    POINTER_FLAG_NONE = 0_u32
    POINTER_FLAG_NEW = 1_u32
    POINTER_FLAG_INRANGE = 2_u32
    POINTER_FLAG_INCONTACT = 4_u32
    POINTER_FLAG_FIRSTBUTTON = 16_u32
    POINTER_FLAG_SECONDBUTTON = 32_u32
    POINTER_FLAG_THIRDBUTTON = 64_u32
    POINTER_FLAG_FOURTHBUTTON = 128_u32
    POINTER_FLAG_FIFTHBUTTON = 256_u32
    POINTER_FLAG_PRIMARY = 8192_u32
    POINTER_FLAG_CONFIDENCE = 16384_u32
    POINTER_FLAG_CANCELED = 32768_u32
    POINTER_FLAG_DOWN = 65536_u32
    POINTER_FLAG_UPDATE = 131072_u32
    POINTER_FLAG_UP = 262144_u32
    POINTER_FLAG_WHEEL = 524288_u32
    POINTER_FLAG_HWHEEL = 1048576_u32
    POINTER_FLAG_CAPTURECHANGED = 2097152_u32
    POINTER_FLAG_HASTRANSFORM = 4194304_u32
  end
  enum TOUCH_FEEDBACK_MODE : UInt32
    TOUCH_FEEDBACK_DEFAULT = 1_u32
    TOUCH_FEEDBACK_INDIRECT = 2_u32
    TOUCH_FEEDBACK_NONE = 3_u32
  end
  enum POINTER_BUTTON_CHANGE_TYPE
    POINTER_CHANGE_NONE = 0_i32
    POINTER_CHANGE_FIRSTBUTTON_DOWN = 1_i32
    POINTER_CHANGE_FIRSTBUTTON_UP = 2_i32
    POINTER_CHANGE_SECONDBUTTON_DOWN = 3_i32
    POINTER_CHANGE_SECONDBUTTON_UP = 4_i32
    POINTER_CHANGE_THIRDBUTTON_DOWN = 5_i32
    POINTER_CHANGE_THIRDBUTTON_UP = 6_i32
    POINTER_CHANGE_FOURTHBUTTON_DOWN = 7_i32
    POINTER_CHANGE_FOURTHBUTTON_UP = 8_i32
    POINTER_CHANGE_FIFTHBUTTON_DOWN = 9_i32
    POINTER_CHANGE_FIFTHBUTTON_UP = 10_i32
  end

  @[Extern]
  struct POINTER_INFO
    property pointerType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE
    property pointerId : UInt32
    property frameId : UInt32
    property pointerFlags : Win32cr::UI::Input::Pointer::POINTER_FLAGS
    property sourceDevice : Win32cr::Foundation::HANDLE
    property hwndTarget : Win32cr::Foundation::HWND
    property ptPixelLocation : Win32cr::Foundation::POINT
    property ptHimetricLocation : Win32cr::Foundation::POINT
    property ptPixelLocationRaw : Win32cr::Foundation::POINT
    property ptHimetricLocationRaw : Win32cr::Foundation::POINT
    property dwTime : UInt32
    property historyCount : UInt32
    property input_data : Int32
    property dwKeyStates : UInt32
    property performance_count : UInt64
    property button_change_type : Win32cr::UI::Input::Pointer::POINTER_BUTTON_CHANGE_TYPE
    def initialize(@pointerType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE, @pointerId : UInt32, @frameId : UInt32, @pointerFlags : Win32cr::UI::Input::Pointer::POINTER_FLAGS, @sourceDevice : Win32cr::Foundation::HANDLE, @hwndTarget : Win32cr::Foundation::HWND, @ptPixelLocation : Win32cr::Foundation::POINT, @ptHimetricLocation : Win32cr::Foundation::POINT, @ptPixelLocationRaw : Win32cr::Foundation::POINT, @ptHimetricLocationRaw : Win32cr::Foundation::POINT, @dwTime : UInt32, @historyCount : UInt32, @input_data : Int32, @dwKeyStates : UInt32, @performance_count : UInt64, @button_change_type : Win32cr::UI::Input::Pointer::POINTER_BUTTON_CHANGE_TYPE)
    end
  end

  @[Extern]
  struct POINTER_TOUCH_INFO
    property pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO
    property touchFlags : UInt32
    property touchMask : UInt32
    property rcContact : Win32cr::Foundation::RECT
    property rcContactRaw : Win32cr::Foundation::RECT
    property orientation : UInt32
    property pressure : UInt32
    def initialize(@pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO, @touchFlags : UInt32, @touchMask : UInt32, @rcContact : Win32cr::Foundation::RECT, @rcContactRaw : Win32cr::Foundation::RECT, @orientation : UInt32, @pressure : UInt32)
    end
  end

  @[Extern]
  struct POINTER_PEN_INFO
    property pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO
    property penFlags : UInt32
    property penMask : UInt32
    property pressure : UInt32
    property rotation : UInt32
    property tiltX : Int32
    property tiltY : Int32
    def initialize(@pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO, @penFlags : UInt32, @penMask : UInt32, @pressure : UInt32, @rotation : UInt32, @tiltX : Int32, @tiltY : Int32)
    end
  end

  @[Extern]
  struct INPUT_INJECTION_VALUE
    property page : UInt16
    property usage : UInt16
    property value : Int32
    property index : UInt16
    def initialize(@page : UInt16, @usage : UInt16, @value : Int32, @index : UInt16)
    end
  end

  @[Extern]
  struct INPUT_TRANSFORM
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property m : Float32[16]

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _11 : Float32
    property _12 : Float32
    property _13 : Float32
    property _14 : Float32
    property _21 : Float32
    property _22 : Float32
    property _23 : Float32
    property _24 : Float32
    property _31 : Float32
    property _32 : Float32
    property _33 : Float32
    property _34 : Float32
    property _41 : Float32
    property _42 : Float32
    property _43 : Float32
    property _44 : Float32
    def initialize(@_11 : Float32, @_12 : Float32, @_13 : Float32, @_14 : Float32, @_21 : Float32, @_22 : Float32, @_23 : Float32, @_24 : Float32, @_31 : Float32, @_32 : Float32, @_33 : Float32, @_34 : Float32, @_41 : Float32, @_42 : Float32, @_43 : Float32, @_44 : Float32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @m : Float32[16])
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_)
    end
  end

  @[Link("user32")]
  lib C
    fun GetUnpredictedMessagePos : UInt32

    fun InitializeTouchInjection(maxCount : UInt32, dwMode : Win32cr::UI::Input::Pointer::TOUCH_FEEDBACK_MODE) : Win32cr::Foundation::BOOL

    fun InjectTouchInput(count : UInt32, contacts : Win32cr::UI::Input::Pointer::POINTER_TOUCH_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerType(pointerId : UInt32, pointerType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE*) : Win32cr::Foundation::BOOL

    fun GetPointerCursorId(pointerId : UInt32, cursorId : UInt32*) : Win32cr::Foundation::BOOL

    fun GetPointerInfo(pointerId : UInt32, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerInfoHistory(pointerId : UInt32, entriesCount : UInt32*, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerFrameInfo(pointerId : UInt32, pointerCount : UInt32*, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerFrameInfoHistory(pointerId : UInt32, entriesCount : UInt32*, pointerCount : UInt32*, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerTouchInfo(pointerId : UInt32, touchInfo : Win32cr::UI::Input::Pointer::POINTER_TOUCH_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerTouchInfoHistory(pointerId : UInt32, entriesCount : UInt32*, touchInfo : Win32cr::UI::Input::Pointer::POINTER_TOUCH_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerFrameTouchInfo(pointerId : UInt32, pointerCount : UInt32*, touchInfo : Win32cr::UI::Input::Pointer::POINTER_TOUCH_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerFrameTouchInfoHistory(pointerId : UInt32, entriesCount : UInt32*, pointerCount : UInt32*, touchInfo : Win32cr::UI::Input::Pointer::POINTER_TOUCH_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerPenInfo(pointerId : UInt32, penInfo : Win32cr::UI::Input::Pointer::POINTER_PEN_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerPenInfoHistory(pointerId : UInt32, entriesCount : UInt32*, penInfo : Win32cr::UI::Input::Pointer::POINTER_PEN_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerFramePenInfo(pointerId : UInt32, pointerCount : UInt32*, penInfo : Win32cr::UI::Input::Pointer::POINTER_PEN_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerFramePenInfoHistory(pointerId : UInt32, entriesCount : UInt32*, pointerCount : UInt32*, penInfo : Win32cr::UI::Input::Pointer::POINTER_PEN_INFO*) : Win32cr::Foundation::BOOL

    fun SkipPointerFrameMessages(pointerId : UInt32) : Win32cr::Foundation::BOOL

    fun InjectSyntheticPointerInput(device : Win32cr::UI::Controls::HSYNTHETICPOINTERDEVICE, pointerInfo : Win32cr::UI::Controls::POINTER_TYPE_INFO*, count : UInt32) : Win32cr::Foundation::BOOL

    fun EnableMouseInPointer(fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun IsMouseInPointerEnabled : Win32cr::Foundation::BOOL

    fun GetPointerInputTransform(pointerId : UInt32, historyCount : UInt32, inputTransform : Win32cr::UI::Input::Pointer::INPUT_TRANSFORM*) : Win32cr::Foundation::BOOL

    fun GetPointerDevices(deviceCount : UInt32*, pointerDevices : Win32cr::UI::Controls::POINTER_DEVICE_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerDevice(device : Win32cr::Foundation::HANDLE, pointerDevice : Win32cr::UI::Controls::POINTER_DEVICE_INFO*) : Win32cr::Foundation::BOOL

    fun GetPointerDeviceProperties(device : Win32cr::Foundation::HANDLE, propertyCount : UInt32*, pointerProperties : Win32cr::UI::Controls::POINTER_DEVICE_PROPERTY*) : Win32cr::Foundation::BOOL

    fun GetPointerDeviceRects(device : Win32cr::Foundation::HANDLE, pointerDeviceRect : Win32cr::Foundation::RECT*, displayRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL

    fun GetPointerDeviceCursors(device : Win32cr::Foundation::HANDLE, cursorCount : UInt32*, deviceCursors : Win32cr::UI::Controls::POINTER_DEVICE_CURSOR_INFO*) : Win32cr::Foundation::BOOL

    fun GetRawPointerDeviceData(pointerId : UInt32, historyCount : UInt32, propertiesCount : UInt32, pProperties : Win32cr::UI::Controls::POINTER_DEVICE_PROPERTY*, pValues : Int32*) : Win32cr::Foundation::BOOL

  end
end