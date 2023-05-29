require "../../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:xinputuap.dll")]
lib LibWin32
  XINPUT_DEVTYPE_GAMEPAD = 1_u32
  XINPUT_DEVSUBTYPE_GAMEPAD = 1_u32
  XINPUT_DEVSUBTYPE_UNKNOWN = 0_u32
  XINPUT_DEVSUBTYPE_WHEEL = 2_u32
  XINPUT_DEVSUBTYPE_ARCADE_STICK = 3_u32
  XINPUT_DEVSUBTYPE_FLIGHT_STICK = 4_u32
  XINPUT_DEVSUBTYPE_DANCE_PAD = 5_u32
  XINPUT_DEVSUBTYPE_GUITAR = 6_u32
  XINPUT_DEVSUBTYPE_GUITAR_ALTERNATE = 7_u32
  XINPUT_DEVSUBTYPE_DRUM_KIT = 8_u32
  XINPUT_DEVSUBTYPE_GUITAR_BASS = 11_u32
  XINPUT_DEVSUBTYPE_ARCADE_PAD = 19_u32
  XINPUT_CAPS_VOICE_SUPPORTED = 4_u32
  XINPUT_CAPS_FFB_SUPPORTED = 1_u32
  XINPUT_CAPS_WIRELESS = 2_u32
  XINPUT_CAPS_PMD_SUPPORTED = 8_u32
  XINPUT_CAPS_NO_NAVIGATION = 16_u32
  XINPUT_GAMEPAD_DPAD_UP = 1_u32
  XINPUT_GAMEPAD_DPAD_DOWN = 2_u32
  XINPUT_GAMEPAD_DPAD_LEFT = 4_u32
  XINPUT_GAMEPAD_DPAD_RIGHT = 8_u32
  XINPUT_GAMEPAD_START = 16_u32
  XINPUT_GAMEPAD_BACK = 32_u32
  XINPUT_GAMEPAD_LEFT_THUMB = 64_u32
  XINPUT_GAMEPAD_RIGHT_THUMB = 128_u32
  XINPUT_GAMEPAD_LEFT_SHOULDER = 256_u32
  XINPUT_GAMEPAD_RIGHT_SHOULDER = 512_u32
  XINPUT_GAMEPAD_A = 4096_u32
  XINPUT_GAMEPAD_B = 8192_u32
  XINPUT_GAMEPAD_X = 16384_u32
  XINPUT_GAMEPAD_Y = 32768_u32
  XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE = 7849_u32
  XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE = 8689_u32
  XINPUT_GAMEPAD_TRIGGER_THRESHOLD = 30_u32
  XINPUT_FLAG_GAMEPAD = 1_u32
  BATTERY_DEVTYPE_GAMEPAD = 0_u32
  BATTERY_DEVTYPE_HEADSET = 1_u32
  BATTERY_TYPE_DISCONNECTED = 0_u32
  BATTERY_TYPE_WIRED = 1_u32
  BATTERY_TYPE_ALKALINE = 2_u32
  BATTERY_TYPE_NIMH = 3_u32
  BATTERY_TYPE_UNKNOWN = 255_u32
  BATTERY_LEVEL_EMPTY = 0_u32
  BATTERY_LEVEL_LOW = 1_u32
  BATTERY_LEVEL_MEDIUM = 2_u32
  BATTERY_LEVEL_FULL = 3_u32
  XUSER_MAX_COUNT = 4_u32
  XUSER_INDEX_ANY = 255_u32
  XINPUT_KEYSTROKE_KEYDOWN = 1_u32
  XINPUT_KEYSTROKE_KEYUP = 2_u32
  XINPUT_KEYSTROKE_REPEAT = 4_u32


  enum XINPUT_VIRTUAL_KEY : UInt16
    VK_PAD_A = 22528
    VK_PAD_B = 22529
    VK_PAD_X = 22530
    VK_PAD_Y = 22531
    VK_PAD_RSHOULDER = 22532
    VK_PAD_LSHOULDER = 22533
    VK_PAD_LTRIGGER = 22534
    VK_PAD_RTRIGGER = 22535
    VK_PAD_DPAD_UP = 22544
    VK_PAD_DPAD_DOWN = 22545
    VK_PAD_DPAD_LEFT = 22546
    VK_PAD_DPAD_RIGHT = 22547
    VK_PAD_START = 22548
    VK_PAD_BACK = 22549
    VK_PAD_LTHUMB_PRESS = 22550
    VK_PAD_RTHUMB_PRESS = 22551
    VK_PAD_LTHUMB_UP = 22560
    VK_PAD_LTHUMB_DOWN = 22561
    VK_PAD_LTHUMB_RIGHT = 22562
    VK_PAD_LTHUMB_LEFT = 22563
    VK_PAD_LTHUMB_UPLEFT = 22564
    VK_PAD_LTHUMB_UPRIGHT = 22565
    VK_PAD_LTHUMB_DOWNRIGHT = 22566
    VK_PAD_LTHUMB_DOWNLEFT = 22567
    VK_PAD_RTHUMB_UP = 22576
    VK_PAD_RTHUMB_DOWN = 22577
    VK_PAD_RTHUMB_RIGHT = 22578
    VK_PAD_RTHUMB_LEFT = 22579
    VK_PAD_RTHUMB_UPLEFT = 22580
    VK_PAD_RTHUMB_UPRIGHT = 22581
    VK_PAD_RTHUMB_DOWNRIGHT = 22582
    VK_PAD_RTHUMB_DOWNLEFT = 22583
  end

  struct XINPUT_GAMEPAD
    w_buttons : UInt16
    b_left_trigger : UInt8
    b_right_trigger : UInt8
    s_thumb_lx : Int16
    s_thumb_ly : Int16
    s_thumb_rx : Int16
    s_thumb_ry : Int16
  end
  struct XINPUT_STATE
    dw_packet_number : UInt32
    gamepad : XINPUT_GAMEPAD
  end
  struct XINPUT_VIBRATION
    w_left_motor_speed : UInt16
    w_right_motor_speed : UInt16
  end
  struct XINPUT_CAPABILITIES
    type : UInt8
    sub_type : UInt8
    flags : UInt16
    gamepad : XINPUT_GAMEPAD
    vibration : XINPUT_VIBRATION
  end
  struct XINPUT_BATTERY_INFORMATION
    battery_type : UInt8
    battery_level : UInt8
  end
  struct XINPUT_KEYSTROKE
    virtual_key : XINPUT_VIRTUAL_KEY
    unicode : Char
    flags : UInt16
    user_index : UInt8
    hid_code : UInt8
  end


  # Params # dwuserindex : UInt32 [In],pstate : XINPUT_STATE* [In]
  fun XInputGetState(dwuserindex : UInt32, pstate : XINPUT_STATE*) : UInt32

  # Params # dwuserindex : UInt32 [In],pvibration : XINPUT_VIBRATION* [In]
  fun XInputSetState(dwuserindex : UInt32, pvibration : XINPUT_VIBRATION*) : UInt32

  # Params # dwuserindex : UInt32 [In],dwflags : UInt32 [In],pcapabilities : XINPUT_CAPABILITIES* [In]
  fun XInputGetCapabilities(dwuserindex : UInt32, dwflags : UInt32, pcapabilities : XINPUT_CAPABILITIES*) : UInt32

  # Params # enable : LibC::BOOL [In]
  fun XInputEnable(enable : LibC::BOOL)

  # Params # dwuserindex : UInt32 [In],prenderdeviceid : Char* [In],prendercount : UInt32* [In],pcapturedeviceid : Char* [In],pcapturecount : UInt32* [In]
  fun XInputGetAudioDeviceIds(dwuserindex : UInt32, prenderdeviceid : Char*, prendercount : UInt32*, pcapturedeviceid : Char*, pcapturecount : UInt32*) : UInt32

  # Params # dwuserindex : UInt32 [In],devtype : UInt8 [In],pbatteryinformation : XINPUT_BATTERY_INFORMATION* [In]
  fun XInputGetBatteryInformation(dwuserindex : UInt32, devtype : UInt8, pbatteryinformation : XINPUT_BATTERY_INFORMATION*) : UInt32

  # Params # dwuserindex : UInt32 [In],dwreserved : UInt32 [In],pkeystroke : XINPUT_KEYSTROKE* [In]
  fun XInputGetKeystroke(dwuserindex : UInt32, dwreserved : UInt32, pkeystroke : XINPUT_KEYSTROKE*) : UInt32
end
