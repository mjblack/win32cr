require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("user32")]
{% end %}
lib LibWin32
  alias HRAWINPUT = LibC::IntPtrT


  enum RAW_INPUT_DATA_COMMAND_FLAGS : UInt32
    RID_HEADER = 268435461
    RID_INPUT = 268435459
  end

  enum RAW_INPUT_DEVICE_INFO_COMMAND : UInt32
    RIDI_PREPARSEDDATA = 536870917
    RIDI_DEVICENAME = 536870919
    RIDI_DEVICEINFO = 536870923
  end

  enum RID_DEVICE_INFO_TYPE : UInt32
    RIM_TYPEMOUSE = 0
    RIM_TYPEKEYBOARD = 1
    RIM_TYPEHID = 2
  end

  enum RAWINPUTDEVICE_FLAGS : UInt32
    RIDEV_REMOVE = 1
    RIDEV_EXCLUDE = 16
    RIDEV_PAGEONLY = 32
    RIDEV_NOLEGACY = 48
    RIDEV_INPUTSINK = 256
    RIDEV_CAPTUREMOUSE = 512
    RIDEV_NOHOTKEYS = 512
    RIDEV_APPKEYS = 1024
    RIDEV_EXINPUTSINK = 4096
    RIDEV_DEVNOTIFY = 8192
  end

  enum INPUT_MESSAGE_DEVICE_TYPE : Int32
    IMDT_UNAVAILABLE = 0
    IMDT_KEYBOARD = 1
    IMDT_MOUSE = 2
    IMDT_TOUCH = 4
    IMDT_PEN = 8
    IMDT_TOUCHPAD = 16
  end

  enum INPUT_MESSAGE_ORIGIN_ID : Int32
    IMO_UNAVAILABLE = 0
    IMO_HARDWARE = 1
    IMO_INJECTED = 2
    IMO_SYSTEM = 4
  end

  union RAWMOUSE_Anonymous_e__Union
    ul_buttons : UInt32
    anonymous : RAWMOUSE_Anonymous_e__Union_Anonymous_e__Struct
  end
  union RAWINPUT_data_e__Union
    mouse : RAWMOUSE
    keyboard : RAWKEYBOARD
    hid : RAWHID
  end
  union RID_DEVICE_INFO_Anonymous_e__Union
    mouse : RID_DEVICE_INFO_MOUSE
    keyboard : RID_DEVICE_INFO_KEYBOARD
    hid : RID_DEVICE_INFO_HID
  end

  struct RAWINPUTHEADER
    dw_type : UInt32
    dw_size : UInt32
    h_device : LibC::HANDLE
    w_param : LibC::UINT_PTR
  end
  struct RAWMOUSE
    us_flags : UInt16
    anonymous : RAWMOUSE_Anonymous_e__Union
    ul_raw_buttons : UInt32
    l_last_x : Int32
    l_last_y : Int32
    ul_extra_information : UInt32
  end
  struct RAWMOUSE_Anonymous_e__Union_Anonymous_e__Struct
    us_button_flags : UInt16
    us_button_data : UInt16
  end
  struct RAWKEYBOARD
    make_code : UInt16
    flags : UInt16
    reserved : UInt16
    v_key : UInt16
    message : UInt32
    extra_information : UInt32
  end
  struct RAWHID
    dw_size_hid : UInt32
    dw_count : UInt32
    b_raw_data : UInt8[0]*
  end
  struct RAWINPUT
    header : RAWINPUTHEADER
    data : RAWINPUT_data_e__Union
  end
  struct RID_DEVICE_INFO_MOUSE
    dw_id : UInt32
    dw_number_of_buttons : UInt32
    dw_sample_rate : UInt32
    f_has_horizontal_wheel : LibC::BOOL
  end
  struct RID_DEVICE_INFO_KEYBOARD
    dw_type : UInt32
    dw_sub_type : UInt32
    dw_keyboard_mode : UInt32
    dw_number_of_function_keys : UInt32
    dw_number_of_indicators : UInt32
    dw_number_of_keys_total : UInt32
  end
  struct RID_DEVICE_INFO_HID
    dw_vendor_id : UInt32
    dw_product_id : UInt32
    dw_version_number : UInt32
    us_usage_page : UInt16
    us_usage : UInt16
  end
  struct RID_DEVICE_INFO
    cb_size : UInt32
    dw_type : RID_DEVICE_INFO_TYPE
    anonymous : RID_DEVICE_INFO_Anonymous_e__Union
  end
  struct RAWINPUTDEVICE
    us_usage_page : UInt16
    us_usage : UInt16
    dw_flags : RAWINPUTDEVICE_FLAGS
    hwnd_target : HANDLE
  end
  struct RAWINPUTDEVICELIST
    h_device : LibC::HANDLE
    dw_type : RID_DEVICE_INFO_TYPE
  end
  struct INPUT_MESSAGE_SOURCE
    device_type : INPUT_MESSAGE_DEVICE_TYPE
    origin_id : INPUT_MESSAGE_ORIGIN_ID
  end


  # Params # hrawinput : HRAWINPUT [In],uicommand : RAW_INPUT_DATA_COMMAND_FLAGS [In],pdata : Void* [In],pcbsize : UInt32* [In],cbsizeheader : UInt32 [In]
  fun GetRawInputData(hrawinput : HRAWINPUT, uicommand : RAW_INPUT_DATA_COMMAND_FLAGS, pdata : Void*, pcbsize : UInt32*, cbsizeheader : UInt32) : UInt32

  # Params # hdevice : LibC::HANDLE [In],uicommand : RAW_INPUT_DEVICE_INFO_COMMAND [In],pdata : Void* [In],pcbsize : UInt32* [In]
  fun GetRawInputDeviceInfoA(hdevice : LibC::HANDLE, uicommand : RAW_INPUT_DEVICE_INFO_COMMAND, pdata : Void*, pcbsize : UInt32*) : UInt32

  # Params # hdevice : LibC::HANDLE [In],uicommand : RAW_INPUT_DEVICE_INFO_COMMAND [In],pdata : Void* [In],pcbsize : UInt32* [In]
  fun GetRawInputDeviceInfoW(hdevice : LibC::HANDLE, uicommand : RAW_INPUT_DEVICE_INFO_COMMAND, pdata : Void*, pcbsize : UInt32*) : UInt32

  # Params # pdata : RAWINPUT* [In],pcbsize : UInt32* [In],cbsizeheader : UInt32 [In]
  fun GetRawInputBuffer(pdata : RAWINPUT*, pcbsize : UInt32*, cbsizeheader : UInt32) : UInt32

  # Params # prawinputdevices : RAWINPUTDEVICE* [In],uinumdevices : UInt32 [In],cbsize : UInt32 [In]
  fun RegisterRawInputDevices(prawinputdevices : RAWINPUTDEVICE*, uinumdevices : UInt32, cbsize : UInt32) : LibC::BOOL

  # Params # prawinputdevices : RAWINPUTDEVICE* [In],puinumdevices : UInt32* [In],cbsize : UInt32 [In]
  fun GetRegisteredRawInputDevices(prawinputdevices : RAWINPUTDEVICE*, puinumdevices : UInt32*, cbsize : UInt32) : UInt32

  # Params # prawinputdevicelist : RAWINPUTDEVICELIST* [In],puinumdevices : UInt32* [In],cbsize : UInt32 [In]
  fun GetRawInputDeviceList(prawinputdevicelist : RAWINPUTDEVICELIST*, puinumdevices : UInt32*, cbsize : UInt32) : UInt32

  # Params # parawinput : RAWINPUT** [In],ninput : Int32 [In],cbsizeheader : UInt32 [In]
  fun DefRawInputProc(parawinput : RAWINPUT**, ninput : Int32, cbsizeheader : UInt32) : LRESULT

  # Params # inputmessagesource : INPUT_MESSAGE_SOURCE* [In]
  fun GetCurrentInputMessageSource(inputmessagesource : INPUT_MESSAGE_SOURCE*) : LibC::BOOL

  # Params # inputmessagesource : INPUT_MESSAGE_SOURCE* [In]
  fun GetCIMSSM(inputmessagesource : INPUT_MESSAGE_SOURCE*) : LibC::BOOL
end
