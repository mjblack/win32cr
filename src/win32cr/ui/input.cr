require "./../foundation.cr"

module Win32cr::UI::Input
  alias HRAWINPUT = LibC::IntPtrT

  enum RAW_INPUT_DATA_COMMAND_FLAGS : UInt32
    RID_HEADER = 268435461_u32
    RID_INPUT = 268435459_u32
  end
  enum RAW_INPUT_DEVICE_INFO_COMMAND : UInt32
    RIDI_PREPARSEDDATA = 536870917_u32
    RIDI_DEVICENAME = 536870919_u32
    RIDI_DEVICEINFO = 536870923_u32
  end
  enum RID_DEVICE_INFO_TYPE : UInt32
    RIM_TYPEMOUSE = 0_u32
    RIM_TYPEKEYBOARD = 1_u32
    RIM_TYPEHID = 2_u32
  end
  @[Flags]
  enum RAWINPUTDEVICE_FLAGS : UInt32
    RIDEV_REMOVE = 1_u32
    RIDEV_EXCLUDE = 16_u32
    RIDEV_PAGEONLY = 32_u32
    RIDEV_NOLEGACY = 48_u32
    RIDEV_INPUTSINK = 256_u32
    RIDEV_CAPTUREMOUSE = 512_u32
    RIDEV_NOHOTKEYS = 512_u32
    RIDEV_APPKEYS = 1024_u32
    RIDEV_EXINPUTSINK = 4096_u32
    RIDEV_DEVNOTIFY = 8192_u32
  end
  enum INPUT_MESSAGE_DEVICE_TYPE
    IMDT_UNAVAILABLE = 0_i32
    IMDT_KEYBOARD = 1_i32
    IMDT_MOUSE = 2_i32
    IMDT_TOUCH = 4_i32
    IMDT_PEN = 8_i32
    IMDT_TOUCHPAD = 16_i32
  end
  enum INPUT_MESSAGE_ORIGIN_ID
    IMO_UNAVAILABLE = 0_i32
    IMO_HARDWARE = 1_i32
    IMO_INJECTED = 2_i32
    IMO_SYSTEM = 4_i32
  end

  @[Extern]
  struct RAWINPUTHEADER
    property dwType : UInt32
    property dwSize : UInt32
    property hDevice : Win32cr::Foundation::HANDLE
    property wParam : Win32cr::Foundation::WPARAM
    def initialize(@dwType : UInt32, @dwSize : UInt32, @hDevice : Win32cr::Foundation::HANDLE, @wParam : Win32cr::Foundation::WPARAM)
    end
  end

  @[Extern]
  struct RAWMOUSE
    property usFlags : UInt16
    property anonymous : Anonymous_e__Union_
    property ulRawButtons : UInt32
    property lLastX : Int32
    property lLastY : Int32
    property ulExtraInformation : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property ulButtons : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property usButtonFlags : UInt16
    property usButtonData : UInt16
    def initialize(@usButtonFlags : UInt16, @usButtonData : UInt16)
    end
      end

    def initialize(@ulButtons : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@usFlags : UInt16, @anonymous : Anonymous_e__Union_, @ulRawButtons : UInt32, @lLastX : Int32, @lLastY : Int32, @ulExtraInformation : UInt32)
    end
  end

  @[Extern]
  struct RAWKEYBOARD
    property make_code : UInt16
    property flags : UInt16
    property reserved : UInt16
    property v_key : UInt16
    property message : UInt32
    property extra_information : UInt32
    def initialize(@make_code : UInt16, @flags : UInt16, @reserved : UInt16, @v_key : UInt16, @message : UInt32, @extra_information : UInt32)
    end
  end

  @[Extern]
  struct RAWHID
    property dwSizeHid : UInt32
    property dwCount : UInt32
    property bRawData : UInt8*
    def initialize(@dwSizeHid : UInt32, @dwCount : UInt32, @bRawData : UInt8*)
    end
  end

  @[Extern]
  struct RAWINPUT
    property header : Win32cr::UI::Input::RAWINPUTHEADER
    property data : Data_e__union_

    # Nested Type Data_e__union_
    @[Extern(union: true)]
    struct Data_e__union_
    property mouse : Win32cr::UI::Input::RAWMOUSE
    property keyboard : Win32cr::UI::Input::RAWKEYBOARD
    property hid : Win32cr::UI::Input::RAWHID
    def initialize(@mouse : Win32cr::UI::Input::RAWMOUSE, @keyboard : Win32cr::UI::Input::RAWKEYBOARD, @hid : Win32cr::UI::Input::RAWHID)
    end
    end

    def initialize(@header : Win32cr::UI::Input::RAWINPUTHEADER, @data : Data_e__union_)
    end
  end

  @[Extern]
  struct RID_DEVICE_INFO_MOUSE
    property dwId : UInt32
    property dwNumberOfButtons : UInt32
    property dwSampleRate : UInt32
    property fHasHorizontalWheel : Win32cr::Foundation::BOOL
    def initialize(@dwId : UInt32, @dwNumberOfButtons : UInt32, @dwSampleRate : UInt32, @fHasHorizontalWheel : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct RID_DEVICE_INFO_KEYBOARD
    property dwType : UInt32
    property dwSubType : UInt32
    property dwKeyboardMode : UInt32
    property dwNumberOfFunctionKeys : UInt32
    property dwNumberOfIndicators : UInt32
    property dwNumberOfKeysTotal : UInt32
    def initialize(@dwType : UInt32, @dwSubType : UInt32, @dwKeyboardMode : UInt32, @dwNumberOfFunctionKeys : UInt32, @dwNumberOfIndicators : UInt32, @dwNumberOfKeysTotal : UInt32)
    end
  end

  @[Extern]
  struct RID_DEVICE_INFO_HID
    property dwVendorId : UInt32
    property dwProductId : UInt32
    property dwVersionNumber : UInt32
    property usUsagePage : UInt16
    property usUsage : UInt16
    def initialize(@dwVendorId : UInt32, @dwProductId : UInt32, @dwVersionNumber : UInt32, @usUsagePage : UInt16, @usUsage : UInt16)
    end
  end

  @[Extern]
  struct RID_DEVICE_INFO
    property cbSize : UInt32
    property dwType : Win32cr::UI::Input::RID_DEVICE_INFO_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property mouse : Win32cr::UI::Input::RID_DEVICE_INFO_MOUSE
    property keyboard : Win32cr::UI::Input::RID_DEVICE_INFO_KEYBOARD
    property hid : Win32cr::UI::Input::RID_DEVICE_INFO_HID
    def initialize(@mouse : Win32cr::UI::Input::RID_DEVICE_INFO_MOUSE, @keyboard : Win32cr::UI::Input::RID_DEVICE_INFO_KEYBOARD, @hid : Win32cr::UI::Input::RID_DEVICE_INFO_HID)
    end
    end

    def initialize(@cbSize : UInt32, @dwType : Win32cr::UI::Input::RID_DEVICE_INFO_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct RAWINPUTDEVICE
    property usUsagePage : UInt16
    property usUsage : UInt16
    property dwFlags : Win32cr::UI::Input::RAWINPUTDEVICE_FLAGS
    property hwndTarget : Win32cr::Foundation::HWND
    def initialize(@usUsagePage : UInt16, @usUsage : UInt16, @dwFlags : Win32cr::UI::Input::RAWINPUTDEVICE_FLAGS, @hwndTarget : Win32cr::Foundation::HWND)
    end
  end

  @[Extern]
  struct RAWINPUTDEVICELIST
    property hDevice : Win32cr::Foundation::HANDLE
    property dwType : Win32cr::UI::Input::RID_DEVICE_INFO_TYPE
    def initialize(@hDevice : Win32cr::Foundation::HANDLE, @dwType : Win32cr::UI::Input::RID_DEVICE_INFO_TYPE)
    end
  end

  @[Extern]
  struct INPUT_MESSAGE_SOURCE
    property deviceType : Win32cr::UI::Input::INPUT_MESSAGE_DEVICE_TYPE
    property originId : Win32cr::UI::Input::INPUT_MESSAGE_ORIGIN_ID
    def initialize(@deviceType : Win32cr::UI::Input::INPUT_MESSAGE_DEVICE_TYPE, @originId : Win32cr::UI::Input::INPUT_MESSAGE_ORIGIN_ID)
    end
  end

  @[Link("user32")]
  lib C
    fun GetRawInputData(hRawInput : Win32cr::UI::Input::HRAWINPUT, uiCommand : Win32cr::UI::Input::RAW_INPUT_DATA_COMMAND_FLAGS, pData : Void*, pcbSize : UInt32*, cbSizeHeader : UInt32) : UInt32

    fun GetRawInputDeviceInfoA(hDevice : Win32cr::Foundation::HANDLE, uiCommand : Win32cr::UI::Input::RAW_INPUT_DEVICE_INFO_COMMAND, pData : Void*, pcbSize : UInt32*) : UInt32

    fun GetRawInputDeviceInfoW(hDevice : Win32cr::Foundation::HANDLE, uiCommand : Win32cr::UI::Input::RAW_INPUT_DEVICE_INFO_COMMAND, pData : Void*, pcbSize : UInt32*) : UInt32

    fun GetRawInputBuffer(pData : Win32cr::UI::Input::RAWINPUT*, pcbSize : UInt32*, cbSizeHeader : UInt32) : UInt32

    fun RegisterRawInputDevices(pRawInputDevices : Win32cr::UI::Input::RAWINPUTDEVICE*, uiNumDevices : UInt32, cbSize : UInt32) : Win32cr::Foundation::BOOL

    fun GetRegisteredRawInputDevices(pRawInputDevices : Win32cr::UI::Input::RAWINPUTDEVICE*, puiNumDevices : UInt32*, cbSize : UInt32) : UInt32

    fun GetRawInputDeviceList(pRawInputDeviceList : Win32cr::UI::Input::RAWINPUTDEVICELIST*, puiNumDevices : UInt32*, cbSize : UInt32) : UInt32

    fun DefRawInputProc(paRawInput : Win32cr::UI::Input::RAWINPUT**, nInput : Int32, cbSizeHeader : UInt32) : Win32cr::Foundation::LRESULT

    fun GetCurrentInputMessageSource(inputMessageSource : Win32cr::UI::Input::INPUT_MESSAGE_SOURCE*) : Win32cr::Foundation::BOOL

    fun GetCIMSSM(inputMessageSource : Win32cr::UI::Input::INPUT_MESSAGE_SOURCE*) : Win32cr::Foundation::BOOL

  end
end