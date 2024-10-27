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
  record RAWINPUTHEADER,
    dwType : UInt32,
    dwSize : UInt32,
    hDevice : Win32cr::Foundation::HANDLE,
    wParam : Win32cr::Foundation::WPARAM

  @[Extern]
  record RAWMOUSE,
    usFlags : UInt16,
    anonymous : Anonymous_e__Union,
    ulRawButtons : UInt32,
    lLastX : Int32,
    lLastY : Int32,
    ulExtraInformation : UInt32 do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      ulButtons : UInt32,
      anonymous : Anonymous_e__Struct do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        usButtonFlags : UInt16,
        usButtonData : UInt16

    end

  end

  @[Extern]
  record RAWKEYBOARD,
    make_code : UInt16,
    flags : UInt16,
    reserved : UInt16,
    v_key : UInt16,
    message : UInt32,
    extra_information : UInt32

  @[Extern]
  record RAWHID,
    dwSizeHid : UInt32,
    dwCount : UInt32,
    bRawData : UInt8*

  @[Extern]
  record RAWINPUT,
    header : Win32cr::UI::Input::RAWINPUTHEADER,
    data : Data_e__union do

    # Nested Type Data_e__union
    @[Extern(union: true)]
    record Data_e__union,
      mouse : Win32cr::UI::Input::RAWMOUSE,
      keyboard : Win32cr::UI::Input::RAWKEYBOARD,
      hid : Win32cr::UI::Input::RAWHID

  end

  @[Extern]
  record RID_DEVICE_INFO_MOUSE,
    dwId : UInt32,
    dwNumberOfButtons : UInt32,
    dwSampleRate : UInt32,
    fHasHorizontalWheel : Win32cr::Foundation::BOOL

  @[Extern]
  record RID_DEVICE_INFO_KEYBOARD,
    dwType : UInt32,
    dwSubType : UInt32,
    dwKeyboardMode : UInt32,
    dwNumberOfFunctionKeys : UInt32,
    dwNumberOfIndicators : UInt32,
    dwNumberOfKeysTotal : UInt32

  @[Extern]
  record RID_DEVICE_INFO_HID,
    dwVendorId : UInt32,
    dwProductId : UInt32,
    dwVersionNumber : UInt32,
    usUsagePage : UInt16,
    usUsage : UInt16

  @[Extern]
  record RID_DEVICE_INFO,
    cbSize : UInt32,
    dwType : Win32cr::UI::Input::RID_DEVICE_INFO_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      mouse : Win32cr::UI::Input::RID_DEVICE_INFO_MOUSE,
      keyboard : Win32cr::UI::Input::RID_DEVICE_INFO_KEYBOARD,
      hid : Win32cr::UI::Input::RID_DEVICE_INFO_HID

  end

  @[Extern]
  record RAWINPUTDEVICE,
    usUsagePage : UInt16,
    usUsage : UInt16,
    dwFlags : Win32cr::UI::Input::RAWINPUTDEVICE_FLAGS,
    hwndTarget : Win32cr::Foundation::HWND

  @[Extern]
  record RAWINPUTDEVICELIST,
    hDevice : Win32cr::Foundation::HANDLE,
    dwType : Win32cr::UI::Input::RID_DEVICE_INFO_TYPE

  @[Extern]
  record INPUT_MESSAGE_SOURCE,
    deviceType : Win32cr::UI::Input::INPUT_MESSAGE_DEVICE_TYPE,
    originId : Win32cr::UI::Input::INPUT_MESSAGE_ORIGIN_ID

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