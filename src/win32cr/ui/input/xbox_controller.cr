require "./../../foundation.cr"

module Win32cr::UI::Input::XboxController
  XINPUT_DLL_A = "xinput1_4.dll"
  XINPUT_DLL_W = "xinput1_4.dll"
  XINPUT_DLL = "xinput1_4.dll"
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
    VK_PAD_A = 22528_u16
    VK_PAD_B = 22529_u16
    VK_PAD_X = 22530_u16
    VK_PAD_Y = 22531_u16
    VK_PAD_RSHOULDER = 22532_u16
    VK_PAD_LSHOULDER = 22533_u16
    VK_PAD_LTRIGGER = 22534_u16
    VK_PAD_RTRIGGER = 22535_u16
    VK_PAD_DPAD_UP = 22544_u16
    VK_PAD_DPAD_DOWN = 22545_u16
    VK_PAD_DPAD_LEFT = 22546_u16
    VK_PAD_DPAD_RIGHT = 22547_u16
    VK_PAD_START = 22548_u16
    VK_PAD_BACK = 22549_u16
    VK_PAD_LTHUMB_PRESS = 22550_u16
    VK_PAD_RTHUMB_PRESS = 22551_u16
    VK_PAD_LTHUMB_UP = 22560_u16
    VK_PAD_LTHUMB_DOWN = 22561_u16
    VK_PAD_LTHUMB_RIGHT = 22562_u16
    VK_PAD_LTHUMB_LEFT = 22563_u16
    VK_PAD_LTHUMB_UPLEFT = 22564_u16
    VK_PAD_LTHUMB_UPRIGHT = 22565_u16
    VK_PAD_LTHUMB_DOWNRIGHT = 22566_u16
    VK_PAD_LTHUMB_DOWNLEFT = 22567_u16
    VK_PAD_RTHUMB_UP = 22576_u16
    VK_PAD_RTHUMB_DOWN = 22577_u16
    VK_PAD_RTHUMB_RIGHT = 22578_u16
    VK_PAD_RTHUMB_LEFT = 22579_u16
    VK_PAD_RTHUMB_UPLEFT = 22580_u16
    VK_PAD_RTHUMB_UPRIGHT = 22581_u16
    VK_PAD_RTHUMB_DOWNRIGHT = 22582_u16
    VK_PAD_RTHUMB_DOWNLEFT = 22583_u16
  end

  @[Extern]
  struct XINPUT_GAMEPAD
    property wButtons : UInt16
    property bLeftTrigger : UInt8
    property bRightTrigger : UInt8
    property sThumbLX : Int16
    property sThumbLY : Int16
    property sThumbRX : Int16
    property sThumbRY : Int16
    def initialize(@wButtons : UInt16, @bLeftTrigger : UInt8, @bRightTrigger : UInt8, @sThumbLX : Int16, @sThumbLY : Int16, @sThumbRX : Int16, @sThumbRY : Int16)
    end
  end

  @[Extern]
  struct XINPUT_STATE
    property dwPacketNumber : UInt32
    property gamepad : Win32cr::UI::Input::XboxController::XINPUT_GAMEPAD
    def initialize(@dwPacketNumber : UInt32, @gamepad : Win32cr::UI::Input::XboxController::XINPUT_GAMEPAD)
    end
  end

  @[Extern]
  struct XINPUT_VIBRATION
    property wLeftMotorSpeed : UInt16
    property wRightMotorSpeed : UInt16
    def initialize(@wLeftMotorSpeed : UInt16, @wRightMotorSpeed : UInt16)
    end
  end

  @[Extern]
  struct XINPUT_CAPABILITIES
    property type__ : UInt8
    property sub_type : UInt8
    property flags : UInt16
    property gamepad : Win32cr::UI::Input::XboxController::XINPUT_GAMEPAD
    property vibration : Win32cr::UI::Input::XboxController::XINPUT_VIBRATION
    def initialize(@type__ : UInt8, @sub_type : UInt8, @flags : UInt16, @gamepad : Win32cr::UI::Input::XboxController::XINPUT_GAMEPAD, @vibration : Win32cr::UI::Input::XboxController::XINPUT_VIBRATION)
    end
  end

  @[Extern]
  struct XINPUT_BATTERY_INFORMATION
    property battery_type : UInt8
    property battery_level : UInt8
    def initialize(@battery_type : UInt8, @battery_level : UInt8)
    end
  end

  @[Extern]
  struct XINPUT_KEYSTROKE
    property virtual_key : Win32cr::UI::Input::XboxController::XINPUT_VIRTUAL_KEY
    property unicode : UInt16
    property flags : UInt16
    property user_index : UInt8
    property hid_code : UInt8
    def initialize(@virtual_key : Win32cr::UI::Input::XboxController::XINPUT_VIRTUAL_KEY, @unicode : UInt16, @flags : UInt16, @user_index : UInt8, @hid_code : UInt8)
    end
  end

  @[Link("xinputuap")]
  lib C
    fun XInputGetState(dwUserIndex : UInt32, pState : Win32cr::UI::Input::XboxController::XINPUT_STATE*) : UInt32

    fun XInputSetState(dwUserIndex : UInt32, pVibration : Win32cr::UI::Input::XboxController::XINPUT_VIBRATION*) : UInt32

    fun XInputGetCapabilities(dwUserIndex : UInt32, dwFlags : UInt32, pCapabilities : Win32cr::UI::Input::XboxController::XINPUT_CAPABILITIES*) : UInt32

    fun XInputEnable(enable : Win32cr::Foundation::BOOL) : Void

    fun XInputGetAudioDeviceIds(dwUserIndex : UInt32, pRenderDeviceId : UInt16*, pRenderCount : UInt32*, pCaptureDeviceId : UInt16*, pCaptureCount : UInt32*) : UInt32

    fun XInputGetBatteryInformation(dwUserIndex : UInt32, devType : UInt8, pBatteryInformation : Win32cr::UI::Input::XboxController::XINPUT_BATTERY_INFORMATION*) : UInt32

    fun XInputGetKeystroke(dwUserIndex : UInt32, dwReserved : UInt32, pKeystroke : Win32cr::UI::Input::XboxController::XINPUT_KEYSTROKE*) : UInt32

  end
end