require "./../../foundation.cr"
require "./../text_services.cr"

module Win32cr::UI::Input::KeyboardAndMouse
  extend self
  EXTENDED_BIT = 16777216_u32
  DONTCARE_BIT = 33554432_u32
  FAKE_KEYSTROKE = 33554432_u32
  KBDBASE = 0_u32
  KBDSHIFT = 1_u32
  KBDCTRL = 2_u32
  KBDALT = 4_u32
  KBDKANA = 8_u32
  KBDROYA = 16_u32
  KBDLOYA = 32_u32
  KBDGRPSELTAP = 128_u32
  GRAVE = 768_u32
  ACUTE = 769_u32
  CIRCUMFLEX = 770_u32
  TILDE = 771_u32
  MACRON = 772_u32
  OVERSCORE = 773_u32
  BREVE = 774_u32
  DOT_ABOVE = 775_u32
  UMLAUT = 776_u32
  DIARESIS = 776_u32
  HOOK_ABOVE = 777_u32
  RING = 778_u32
  DOUBLE_ACUTE = 779_u32
  HACEK = 780_u32
  CEDILLA = 807_u32
  OGONEK = 808_u32
  TONOS = 900_u32
  DIARESIS_TONOS = 901_u32
  Wszgrave = "̀"
  Wszacute = "́"
  Wszcircumflex = "̂"
  Wsztilde = "̃"
  Wszmacron = "̄"
  Wszoverscore = "̅"
  Wszbreve = "̆"
  Wszdot_above = "̇"
  Wszumlaut = "̈"
  Wszhook_above = "̉"
  Wszring = "̊"
  Wszdouble_acute = "̋"
  Wszhacek = "̌"
  Wszcedilla = "̧"
  Wszogonek = "̨"
  Wsztonos = "΄"
  Wszdiaresis_tonos = "΅"
  SHFT_INVALID = 15_u32
  WCH_NONE = 61440_u32
  WCH_DEAD = 61441_u32
  WCH_LGTR = 61442_u32
  CAPLOK = 1_u32
  SGCAPS = 2_u32
  CAPLOKALTGR = 4_u32
  KANALOK = 8_u32
  GRPSELTAP = 128_u32
  DKF_DEAD = 1_u32
  KBD_VERSION = 1_u32
  KLLF_ALTGR = 1_u32
  KLLF_SHIFTLOCK = 2_u32
  KLLF_LRM_RLM = 4_u32
  KLLF_GLOBAL_ATTRS = 2_u32
  KBDTABLE_MULTI_MAX = 8_u32
  KEYBOARD_TYPE_GENERIC_101 = 4_u32
  KEYBOARD_TYPE_JAPAN = 7_u32
  KEYBOARD_TYPE_KOREA = 8_u32
  KEYBOARD_TYPE_UNKNOWN = 81_u32
  NLSKBD_OEM_MICROSOFT = 0_u32
  NLSKBD_OEM_AX = 1_u32
  NLSKBD_OEM_EPSON = 4_u32
  NLSKBD_OEM_FUJITSU = 5_u32
  NLSKBD_OEM_IBM = 7_u32
  NLSKBD_OEM_MATSUSHITA = 10_u32
  NLSKBD_OEM_NEC = 13_u32
  NLSKBD_OEM_TOSHIBA = 18_u32
  NLSKBD_OEM_DEC = 24_u32
  MICROSOFT_KBD_101_TYPE = 0_u32
  MICROSOFT_KBD_AX_TYPE = 1_u32
  MICROSOFT_KBD_106_TYPE = 2_u32
  MICROSOFT_KBD_002_TYPE = 3_u32
  MICROSOFT_KBD_001_TYPE = 4_u32
  MICROSOFT_KBD_FUNC = 12_u32
  AX_KBD_DESKTOP_TYPE = 1_u32
  FMR_KBD_JIS_TYPE = 0_u32
  FMR_KBD_OASYS_TYPE = 1_u32
  FMV_KBD_OASYS_TYPE = 2_u32
  NEC_KBD_NORMAL_TYPE = 1_u32
  NEC_KBD_N_MODE_TYPE = 2_u32
  NEC_KBD_H_MODE_TYPE = 3_u32
  NEC_KBD_LAPTOP_TYPE = 4_u32
  NEC_KBD_106_TYPE = 5_u32
  TOSHIBA_KBD_DESKTOP_TYPE = 13_u32
  TOSHIBA_KBD_LAPTOP_TYPE = 15_u32
  DEC_KBD_ANSI_LAYOUT_TYPE = 1_u32
  DEC_KBD_JIS_LAYOUT_TYPE = 2_u32
  MICROSOFT_KBD_101A_TYPE = 0_u32
  MICROSOFT_KBD_101B_TYPE = 4_u32
  MICROSOFT_KBD_101C_TYPE = 5_u32
  MICROSOFT_KBD_103_TYPE = 6_u32
  NLSKBD_INFO_SEND_IME_NOTIFICATION = 1_u32
  NLSKBD_INFO_ACCESSIBILITY_KEYMAP = 2_u32
  NLSKBD_INFO_EMURATE_101_KEYBOARD = 16_u32
  NLSKBD_INFO_EMURATE_106_KEYBOARD = 32_u32
  KBDNLS_TYPE_NULL = 0_u32
  KBDNLS_TYPE_NORMAL = 1_u32
  KBDNLS_TYPE_TOGGLE = 2_u32
  KBDNLS_INDEX_NORMAL = 1_u32
  KBDNLS_INDEX_ALT = 2_u32
  KBDNLS_NULL = 0_u32
  KBDNLS_NOEVENT = 1_u32
  KBDNLS_SEND_BASE_VK = 2_u32
  KBDNLS_SEND_PARAM_VK = 3_u32
  KBDNLS_KANALOCK = 4_u32
  KBDNLS_ALPHANUM = 5_u32
  KBDNLS_HIRAGANA = 6_u32
  KBDNLS_KATAKANA = 7_u32
  KBDNLS_SBCSDBCS = 8_u32
  KBDNLS_ROMAN = 9_u32
  KBDNLS_CODEINPUT = 10_u32
  KBDNLS_HELP_OR_END = 11_u32
  KBDNLS_HOME_OR_CLEAR = 12_u32
  KBDNLS_NUMPAD = 13_u32
  KBDNLS_KANAEVENT = 14_u32
  KBDNLS_CONV_OR_NONCONV = 15_u32
  KBD_TYPE = 4_u32
  VK__none_ = 255_u32
  VK_ABNT_C1 = 193_u32
  VK_ABNT_C2 = 194_u32
  SCANCODE_LSHIFT = 42_u32
  SCANCODE_RSHIFT = 54_u32
  SCANCODE_CTRL = 29_u32
  SCANCODE_ALT = 56_u32
  SCANCODE_NUMPAD_FIRST = 71_u32
  SCANCODE_NUMPAD_LAST = 82_u32
  SCANCODE_LWIN = 91_u32
  SCANCODE_RWIN = 92_u32
  SCANCODE_THAI_LAYOUT_TOGGLE = 41_u32
  VK_DBE_ALPHANUMERIC = 240_u32
  VK_DBE_KATAKANA = 241_u32
  VK_DBE_HIRAGANA = 242_u32
  VK_DBE_SBCSCHAR = 243_u32
  VK_DBE_DBCSCHAR = 244_u32
  VK_DBE_ROMAN = 245_u32
  VK_DBE_NOROMAN = 246_u32
  VK_DBE_ENTERWORDREGISTERMODE = 247_u32
  VK_DBE_ENTERIMECONFIGMODE = 248_u32
  VK_DBE_FLUSHSTRING = 249_u32
  VK_DBE_CODEINPUT = 250_u32
  VK_DBE_NOCODEINPUT = 251_u32
  VK_DBE_DETERMINESTRING = 252_u32
  VK_DBE_ENTERDLGCONVERSIONMODE = 253_u32

  @[Flags]
  enum HOT_KEY_MODIFIERS : UInt32
    MOD_ALT = 1_u32
    MOD_CONTROL = 2_u32
    MOD_NOREPEAT = 16384_u32
    MOD_SHIFT = 4_u32
    MOD_WIN = 8_u32
  end
  enum ACTIVATE_KEYBOARD_LAYOUT_FLAGS : UInt32
    KLF_REORDER = 8_u32
    KLF_RESET = 1073741824_u32
    KLF_SETFORPROCESS = 256_u32
    KLF_SHIFTLOCK = 65536_u32
    KLF_ACTIVATE = 1_u32
    KLF_NOTELLSHELL = 128_u32
    KLF_REPLACELANG = 16_u32
    KLF_SUBSTITUTE_OK = 2_u32
  end
  enum GET_MOUSE_MOVE_POINTS_EX_RESOLUTION : UInt32
    GMMP_USE_DISPLAY_POINTS = 1_u32
    GMMP_USE_HIGH_RESOLUTION_POINTS = 2_u32
  end
  @[Flags]
  enum KEYBD_EVENT_FLAGS : UInt32
    KEYEVENTF_EXTENDEDKEY = 1_u32
    KEYEVENTF_KEYUP = 2_u32
    KEYEVENTF_SCANCODE = 8_u32
    KEYEVENTF_UNICODE = 4_u32
  end
  @[Flags]
  enum MOUSE_EVENT_FLAGS : UInt32
    MOUSEEVENTF_ABSOLUTE = 32768_u32
    MOUSEEVENTF_LEFTDOWN = 2_u32
    MOUSEEVENTF_LEFTUP = 4_u32
    MOUSEEVENTF_MIDDLEDOWN = 32_u32
    MOUSEEVENTF_MIDDLEUP = 64_u32
    MOUSEEVENTF_MOVE = 1_u32
    MOUSEEVENTF_RIGHTDOWN = 8_u32
    MOUSEEVENTF_RIGHTUP = 16_u32
    MOUSEEVENTF_WHEEL = 2048_u32
    MOUSEEVENTF_XDOWN = 128_u32
    MOUSEEVENTF_XUP = 256_u32
    MOUSEEVENTF_HWHEEL = 4096_u32
    MOUSEEVENTF_MOVE_NOCOALESCE = 8192_u32
    MOUSEEVENTF_VIRTUALDESK = 16384_u32
  end
  enum INPUT_TYPE : UInt32
    INPUT_MOUSE = 0_u32
    INPUT_KEYBOARD = 1_u32
    INPUT_HARDWARE = 2_u32
  end
  @[Flags]
  enum TRACKMOUSEEVENT_FLAGS : UInt32
    TME_CANCEL = 2147483648_u32
    TME_HOVER = 1_u32
    TME_LEAVE = 2_u32
    TME_NONCLIENT = 16_u32
    TME_QUERY = 1073741824_u32
  end
  enum VIRTUAL_KEY : UInt16
    VK_0 = 48_u16
    VK_1 = 49_u16
    VK_2 = 50_u16
    VK_3 = 51_u16
    VK_4 = 52_u16
    VK_5 = 53_u16
    VK_6 = 54_u16
    VK_7 = 55_u16
    VK_8 = 56_u16
    VK_9 = 57_u16
    VK_A = 65_u16
    VK_B = 66_u16
    VK_C = 67_u16
    VK_D = 68_u16
    VK_E = 69_u16
    VK_F = 70_u16
    VK_G = 71_u16
    VK_H = 72_u16
    VK_I = 73_u16
    VK_J = 74_u16
    VK_K = 75_u16
    VK_L = 76_u16
    VK_M = 77_u16
    VK_N = 78_u16
    VK_O = 79_u16
    VK_P = 80_u16
    VK_Q = 81_u16
    VK_R = 82_u16
    VK_S = 83_u16
    VK_T = 84_u16
    VK_U = 85_u16
    VK_V = 86_u16
    VK_W = 87_u16
    VK_X = 88_u16
    VK_Y = 89_u16
    VK_Z = 90_u16
    VK_LBUTTON = 1_u16
    VK_RBUTTON = 2_u16
    VK_CANCEL = 3_u16
    VK_MBUTTON = 4_u16
    VK_XBUTTON1 = 5_u16
    VK_XBUTTON2 = 6_u16
    VK_BACK = 8_u16
    VK_TAB = 9_u16
    VK_CLEAR = 12_u16
    VK_RETURN = 13_u16
    VK_SHIFT = 16_u16
    VK_CONTROL = 17_u16
    VK_MENU = 18_u16
    VK_PAUSE = 19_u16
    VK_CAPITAL = 20_u16
    VK_KANA = 21_u16
    VK_HANGEUL = 21_u16
    VK_HANGUL = 21_u16
    VK_IME_ON = 22_u16
    VK_JUNJA = 23_u16
    VK_FINAL = 24_u16
    VK_HANJA = 25_u16
    VK_KANJI = 25_u16
    VK_IME_OFF = 26_u16
    VK_ESCAPE = 27_u16
    VK_CONVERT = 28_u16
    VK_NONCONVERT = 29_u16
    VK_ACCEPT = 30_u16
    VK_MODECHANGE = 31_u16
    VK_SPACE = 32_u16
    VK_PRIOR = 33_u16
    VK_NEXT = 34_u16
    VK_END = 35_u16
    VK_HOME = 36_u16
    VK_LEFT = 37_u16
    VK_UP = 38_u16
    VK_RIGHT = 39_u16
    VK_DOWN = 40_u16
    VK_SELECT = 41_u16
    VK_PRINT = 42_u16
    VK_EXECUTE = 43_u16
    VK_SNAPSHOT = 44_u16
    VK_INSERT = 45_u16
    VK_DELETE = 46_u16
    VK_HELP = 47_u16
    VK_LWIN = 91_u16
    VK_RWIN = 92_u16
    VK_APPS = 93_u16
    VK_SLEEP = 95_u16
    VK_NUMPAD0 = 96_u16
    VK_NUMPAD1 = 97_u16
    VK_NUMPAD2 = 98_u16
    VK_NUMPAD3 = 99_u16
    VK_NUMPAD4 = 100_u16
    VK_NUMPAD5 = 101_u16
    VK_NUMPAD6 = 102_u16
    VK_NUMPAD7 = 103_u16
    VK_NUMPAD8 = 104_u16
    VK_NUMPAD9 = 105_u16
    VK_MULTIPLY = 106_u16
    VK_ADD = 107_u16
    VK_SEPARATOR = 108_u16
    VK_SUBTRACT = 109_u16
    VK_DECIMAL = 110_u16
    VK_DIVIDE = 111_u16
    VK_F1 = 112_u16
    VK_F2 = 113_u16
    VK_F3 = 114_u16
    VK_F4 = 115_u16
    VK_F5 = 116_u16
    VK_F6 = 117_u16
    VK_F7 = 118_u16
    VK_F8 = 119_u16
    VK_F9 = 120_u16
    VK_F10 = 121_u16
    VK_F11 = 122_u16
    VK_F12 = 123_u16
    VK_F13 = 124_u16
    VK_F14 = 125_u16
    VK_F15 = 126_u16
    VK_F16 = 127_u16
    VK_F17 = 128_u16
    VK_F18 = 129_u16
    VK_F19 = 130_u16
    VK_F20 = 131_u16
    VK_F21 = 132_u16
    VK_F22 = 133_u16
    VK_F23 = 134_u16
    VK_F24 = 135_u16
    VK_NAVIGATION_VIEW = 136_u16
    VK_NAVIGATION_MENU = 137_u16
    VK_NAVIGATION_UP = 138_u16
    VK_NAVIGATION_DOWN = 139_u16
    VK_NAVIGATION_LEFT = 140_u16
    VK_NAVIGATION_RIGHT = 141_u16
    VK_NAVIGATION_ACCEPT = 142_u16
    VK_NAVIGATION_CANCEL = 143_u16
    VK_NUMLOCK = 144_u16
    VK_SCROLL = 145_u16
    VK_OEM_NEC_EQUAL = 146_u16
    VK_OEM_FJ_JISHO = 146_u16
    VK_OEM_FJ_MASSHOU = 147_u16
    VK_OEM_FJ_TOUROKU = 148_u16
    VK_OEM_FJ_LOYA = 149_u16
    VK_OEM_FJ_ROYA = 150_u16
    VK_LSHIFT = 160_u16
    VK_RSHIFT = 161_u16
    VK_LCONTROL = 162_u16
    VK_RCONTROL = 163_u16
    VK_LMENU = 164_u16
    VK_RMENU = 165_u16
    VK_BROWSER_BACK = 166_u16
    VK_BROWSER_FORWARD = 167_u16
    VK_BROWSER_REFRESH = 168_u16
    VK_BROWSER_STOP = 169_u16
    VK_BROWSER_SEARCH = 170_u16
    VK_BROWSER_FAVORITES = 171_u16
    VK_BROWSER_HOME = 172_u16
    VK_VOLUME_MUTE = 173_u16
    VK_VOLUME_DOWN = 174_u16
    VK_VOLUME_UP = 175_u16
    VK_MEDIA_NEXT_TRACK = 176_u16
    VK_MEDIA_PREV_TRACK = 177_u16
    VK_MEDIA_STOP = 178_u16
    VK_MEDIA_PLAY_PAUSE = 179_u16
    VK_LAUNCH_MAIL = 180_u16
    VK_LAUNCH_MEDIA_SELECT = 181_u16
    VK_LAUNCH_APP1 = 182_u16
    VK_LAUNCH_APP2 = 183_u16
    VK_OEM_1 = 186_u16
    VK_OEM_PLUS = 187_u16
    VK_OEM_COMMA = 188_u16
    VK_OEM_MINUS = 189_u16
    VK_OEM_PERIOD = 190_u16
    VK_OEM_2 = 191_u16
    VK_OEM_3 = 192_u16
    VK_GAMEPAD_A = 195_u16
    VK_GAMEPAD_B = 196_u16
    VK_GAMEPAD_X = 197_u16
    VK_GAMEPAD_Y = 198_u16
    VK_GAMEPAD_RIGHT_SHOULDER = 199_u16
    VK_GAMEPAD_LEFT_SHOULDER = 200_u16
    VK_GAMEPAD_LEFT_TRIGGER = 201_u16
    VK_GAMEPAD_RIGHT_TRIGGER = 202_u16
    VK_GAMEPAD_DPAD_UP = 203_u16
    VK_GAMEPAD_DPAD_DOWN = 204_u16
    VK_GAMEPAD_DPAD_LEFT = 205_u16
    VK_GAMEPAD_DPAD_RIGHT = 206_u16
    VK_GAMEPAD_MENU = 207_u16
    VK_GAMEPAD_VIEW = 208_u16
    VK_GAMEPAD_LEFT_THUMBSTICK_BUTTON = 209_u16
    VK_GAMEPAD_RIGHT_THUMBSTICK_BUTTON = 210_u16
    VK_GAMEPAD_LEFT_THUMBSTICK_UP = 211_u16
    VK_GAMEPAD_LEFT_THUMBSTICK_DOWN = 212_u16
    VK_GAMEPAD_LEFT_THUMBSTICK_RIGHT = 213_u16
    VK_GAMEPAD_LEFT_THUMBSTICK_LEFT = 214_u16
    VK_GAMEPAD_RIGHT_THUMBSTICK_UP = 215_u16
    VK_GAMEPAD_RIGHT_THUMBSTICK_DOWN = 216_u16
    VK_GAMEPAD_RIGHT_THUMBSTICK_RIGHT = 217_u16
    VK_GAMEPAD_RIGHT_THUMBSTICK_LEFT = 218_u16
    VK_OEM_4 = 219_u16
    VK_OEM_5 = 220_u16
    VK_OEM_6 = 221_u16
    VK_OEM_7 = 222_u16
    VK_OEM_8 = 223_u16
    VK_OEM_AX = 225_u16
    VK_OEM_102 = 226_u16
    VK_ICO_HELP = 227_u16
    VK_ICO_00 = 228_u16
    VK_PROCESSKEY = 229_u16
    VK_ICO_CLEAR = 230_u16
    VK_PACKET = 231_u16
    VK_OEM_RESET = 233_u16
    VK_OEM_JUMP = 234_u16
    VK_OEM_PA1 = 235_u16
    VK_OEM_PA2 = 236_u16
    VK_OEM_PA3 = 237_u16
    VK_OEM_WSCTRL = 238_u16
    VK_OEM_CUSEL = 239_u16
    VK_OEM_ATTN = 240_u16
    VK_OEM_FINISH = 241_u16
    VK_OEM_COPY = 242_u16
    VK_OEM_AUTO = 243_u16
    VK_OEM_ENLW = 244_u16
    VK_OEM_BACKTAB = 245_u16
    VK_ATTN = 246_u16
    VK_CRSEL = 247_u16
    VK_EXSEL = 248_u16
    VK_EREOF = 249_u16
    VK_PLAY = 250_u16
    VK_ZOOM = 251_u16
    VK_NONAME = 252_u16
    VK_PA1 = 253_u16
    VK_OEM_CLEAR = 254_u16
  end

  @[Extern]
  struct VK_TO_BIT
    property vk : UInt8
    property mod_bits : UInt8
    def initialize(@vk : UInt8, @mod_bits : UInt8)
    end
  end

  @[Extern]
  struct MODIFIERS
    property pVkToBit : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_BIT*
    property wMaxModBits : UInt16
    property mod_number : UInt8*
    def initialize(@pVkToBit : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_BIT*, @wMaxModBits : UInt16, @mod_number : UInt8*)
    end
  end

  @[Extern]
  struct VSC_VK
    property vsc : UInt8
    property vk : UInt16
    def initialize(@vsc : UInt8, @vk : UInt16)
    end
  end

  @[Extern]
  struct VK_VSC
    property vk : UInt8
    property vsc : UInt8
    def initialize(@vk : UInt8, @vsc : UInt8)
    end
  end

  @[Extern]
  struct VK_TO_WCHARS1
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16*
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16*)
    end
  end

  @[Extern]
  struct VK_TO_WCHARS2
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[2]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[2])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS3
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[3]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[3])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS4
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[4]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[4])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS5
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[5]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[5])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS6
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[6]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[6])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS7
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[7]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[7])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS8
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[8]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[8])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS9
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[9]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[9])
    end
  end

  @[Extern]
  struct VK_TO_WCHARS10
    property virtual_key : UInt8
    property attributes : UInt8
    property wch : UInt16[10]
    def initialize(@virtual_key : UInt8, @attributes : UInt8, @wch : UInt16[10])
    end
  end

  @[Extern]
  struct VK_TO_WCHAR_TABLE
    property pVkToWchars : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_WCHARS1*
    property nModifications : UInt8
    property cbSize : UInt8
    def initialize(@pVkToWchars : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_WCHARS1*, @nModifications : UInt8, @cbSize : UInt8)
    end
  end

  @[Extern]
  struct DEADKEY
    property dwBoth : UInt32
    property wchComposed : UInt16
    property uFlags : UInt16
    def initialize(@dwBoth : UInt32, @wchComposed : UInt16, @uFlags : UInt16)
    end
  end

  @[Extern]
  struct LIGATURE1
    property virtual_key : UInt8
    property modification_number : UInt16
    property wch : UInt16*
    def initialize(@virtual_key : UInt8, @modification_number : UInt16, @wch : UInt16*)
    end
  end

  @[Extern]
  struct LIGATURE2
    property virtual_key : UInt8
    property modification_number : UInt16
    property wch : UInt16[2]
    def initialize(@virtual_key : UInt8, @modification_number : UInt16, @wch : UInt16[2])
    end
  end

  @[Extern]
  struct LIGATURE3
    property virtual_key : UInt8
    property modification_number : UInt16
    property wch : UInt16[3]
    def initialize(@virtual_key : UInt8, @modification_number : UInt16, @wch : UInt16[3])
    end
  end

  @[Extern]
  struct LIGATURE4
    property virtual_key : UInt8
    property modification_number : UInt16
    property wch : UInt16[4]
    def initialize(@virtual_key : UInt8, @modification_number : UInt16, @wch : UInt16[4])
    end
  end

  @[Extern]
  struct LIGATURE5
    property virtual_key : UInt8
    property modification_number : UInt16
    property wch : UInt16[5]
    def initialize(@virtual_key : UInt8, @modification_number : UInt16, @wch : UInt16[5])
    end
  end

  @[Extern]
  struct VSC_LPWSTR
    property vsc : UInt8
    property pwsz : Win32cr::Foundation::PWSTR
    def initialize(@vsc : UInt8, @pwsz : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct KbdLayer
    property pCharModifiers : Win32cr::UI::Input::KeyboardAndMouse::MODIFIERS*
    property pVkToWcharTable : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_WCHAR_TABLE*
    property pDeadKey : Win32cr::UI::Input::KeyboardAndMouse::DEADKEY*
    property pKeyNames : Win32cr::UI::Input::KeyboardAndMouse::VSC_LPWSTR*
    property pKeyNamesExt : Win32cr::UI::Input::KeyboardAndMouse::VSC_LPWSTR*
    property pKeyNamesDead : UInt16**
    property pusVSCtoVK : UInt16*
    property bMaxVSCtoVK : UInt8
    property pVSCtoVK_E0 : Win32cr::UI::Input::KeyboardAndMouse::VSC_VK*
    property pVSCtoVK_E1 : Win32cr::UI::Input::KeyboardAndMouse::VSC_VK*
    property fLocaleFlags : UInt32
    property nLgMax : UInt8
    property cbLgEntry : UInt8
    property pLigature : Win32cr::UI::Input::KeyboardAndMouse::LIGATURE1*
    property dwType : UInt32
    property dwSubType : UInt32
    def initialize(@pCharModifiers : Win32cr::UI::Input::KeyboardAndMouse::MODIFIERS*, @pVkToWcharTable : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_WCHAR_TABLE*, @pDeadKey : Win32cr::UI::Input::KeyboardAndMouse::DEADKEY*, @pKeyNames : Win32cr::UI::Input::KeyboardAndMouse::VSC_LPWSTR*, @pKeyNamesExt : Win32cr::UI::Input::KeyboardAndMouse::VSC_LPWSTR*, @pKeyNamesDead : UInt16**, @pusVSCtoVK : UInt16*, @bMaxVSCtoVK : UInt8, @pVSCtoVK_E0 : Win32cr::UI::Input::KeyboardAndMouse::VSC_VK*, @pVSCtoVK_E1 : Win32cr::UI::Input::KeyboardAndMouse::VSC_VK*, @fLocaleFlags : UInt32, @nLgMax : UInt8, @cbLgEntry : UInt8, @pLigature : Win32cr::UI::Input::KeyboardAndMouse::LIGATURE1*, @dwType : UInt32, @dwSubType : UInt32)
    end
  end

  @[Extern]
  struct VK_FUNCTION_PARAM_
    property nlsfe_proc_index : UInt8
    property nlsfe_proc_param : UInt32
    def initialize(@nlsfe_proc_index : UInt8, @nlsfe_proc_param : UInt32)
    end
  end

  @[Extern]
  struct VK_TO_FUNCTION_TABLE_
    property vk : UInt8
    property nlsfe_proc_type : UInt8
    property nlsfe_proc_current : UInt8
    property nlsfe_proc_switch : UInt8
    property nlsfe_proc : Win32cr::UI::Input::KeyboardAndMouse::VK_FUNCTION_PARAM_[8]
    property nlsfe_proc_alt : Win32cr::UI::Input::KeyboardAndMouse::VK_FUNCTION_PARAM_[8]
    def initialize(@vk : UInt8, @nlsfe_proc_type : UInt8, @nlsfe_proc_current : UInt8, @nlsfe_proc_switch : UInt8, @nlsfe_proc : Win32cr::UI::Input::KeyboardAndMouse::VK_FUNCTION_PARAM_[8], @nlsfe_proc_alt : Win32cr::UI::Input::KeyboardAndMouse::VK_FUNCTION_PARAM_[8])
    end
  end

  @[Extern]
  struct KbdNlsLayer
    property oem_identifier : UInt16
    property layout_information : UInt16
    property num_of_vk_to_f : UInt32
    property pVkToF : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_FUNCTION_TABLE_*
    property num_of_mouse_v_key : Int32
    property pusMouseVKey : UInt16*
    def initialize(@oem_identifier : UInt16, @layout_information : UInt16, @num_of_vk_to_f : UInt32, @pVkToF : Win32cr::UI::Input::KeyboardAndMouse::VK_TO_FUNCTION_TABLE_*, @num_of_mouse_v_key : Int32, @pusMouseVKey : UInt16*)
    end
  end

  @[Extern]
  struct KBDTABLE_DESC
    property wszDllName : UInt16[32]
    property dwType : UInt32
    property dwSubType : UInt32
    def initialize(@wszDllName : UInt16[32], @dwType : UInt32, @dwSubType : UInt32)
    end
  end

  @[Extern]
  struct KBDTABLE_MULTI
    property nTables : UInt32
    property aKbdTables : Win32cr::UI::Input::KeyboardAndMouse::KBDTABLE_DESC[8]
    def initialize(@nTables : UInt32, @aKbdTables : Win32cr::UI::Input::KeyboardAndMouse::KBDTABLE_DESC[8])
    end
  end

  @[Extern]
  struct KBD_TYPE_INFO
    property dwVersion : UInt32
    property dwType : UInt32
    property dwSubType : UInt32
    def initialize(@dwVersion : UInt32, @dwType : UInt32, @dwSubType : UInt32)
    end
  end

  @[Extern]
  struct MOUSEMOVEPOINT
    property x : Int32
    property y : Int32
    property time : UInt32
    property dwExtraInfo : LibC::UIntPtrT
    def initialize(@x : Int32, @y : Int32, @time : UInt32, @dwExtraInfo : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct TRACKMOUSEEVENT
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Input::KeyboardAndMouse::TRACKMOUSEEVENT_FLAGS
    property hwndTrack : Win32cr::Foundation::HWND
    property dwHoverTime : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Input::KeyboardAndMouse::TRACKMOUSEEVENT_FLAGS, @hwndTrack : Win32cr::Foundation::HWND, @dwHoverTime : UInt32)
    end
  end

  @[Extern]
  struct MOUSEINPUT
    property dx : Int32
    property dy : Int32
    property mouseData : Int32
    property dwFlags : Win32cr::UI::Input::KeyboardAndMouse::MOUSE_EVENT_FLAGS
    property time : UInt32
    property dwExtraInfo : LibC::UIntPtrT
    def initialize(@dx : Int32, @dy : Int32, @mouseData : Int32, @dwFlags : Win32cr::UI::Input::KeyboardAndMouse::MOUSE_EVENT_FLAGS, @time : UInt32, @dwExtraInfo : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct KEYBDINPUT
    property wVk : Win32cr::UI::Input::KeyboardAndMouse::VIRTUAL_KEY
    property wScan : UInt16
    property dwFlags : Win32cr::UI::Input::KeyboardAndMouse::KEYBD_EVENT_FLAGS
    property time : UInt32
    property dwExtraInfo : LibC::UIntPtrT
    def initialize(@wVk : Win32cr::UI::Input::KeyboardAndMouse::VIRTUAL_KEY, @wScan : UInt16, @dwFlags : Win32cr::UI::Input::KeyboardAndMouse::KEYBD_EVENT_FLAGS, @time : UInt32, @dwExtraInfo : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct HARDWAREINPUT
    property uMsg : UInt32
    property wParamL : UInt16
    property wParamH : UInt16
    def initialize(@uMsg : UInt32, @wParamL : UInt16, @wParamH : UInt16)
    end
  end

  @[Extern]
  struct INPUT
    property type__ : Win32cr::UI::Input::KeyboardAndMouse::INPUT_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property mi : Win32cr::UI::Input::KeyboardAndMouse::MOUSEINPUT
    property ki : Win32cr::UI::Input::KeyboardAndMouse::KEYBDINPUT
    property hi : Win32cr::UI::Input::KeyboardAndMouse::HARDWAREINPUT
    def initialize(@mi : Win32cr::UI::Input::KeyboardAndMouse::MOUSEINPUT, @ki : Win32cr::UI::Input::KeyboardAndMouse::KEYBDINPUT, @hi : Win32cr::UI::Input::KeyboardAndMouse::HARDWAREINPUT)
    end
    end

    def initialize(@type__ : Win32cr::UI::Input::KeyboardAndMouse::INPUT_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct LASTINPUTINFO
    property cbSize : UInt32
    property dwTime : UInt32
    def initialize(@cbSize : UInt32, @dwTime : UInt32)
    end
  end

  def _TrackMouseEvent(lpEventTrack : Win32cr::UI::Input::KeyboardAndMouse::TRACKMOUSEEVENT*) : Win32cr::Foundation::BOOL
    C._TrackMouseEvent(lpEventTrack)
  end

  def loadKeyboardLayoutA(pwszKLID : Win32cr::Foundation::PSTR, flags : Win32cr::UI::Input::KeyboardAndMouse::ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : Win32cr::UI::TextServices::HKL
    C.LoadKeyboardLayoutA(pwszKLID, flags)
  end

  def loadKeyboardLayoutW(pwszKLID : Win32cr::Foundation::PWSTR, flags : Win32cr::UI::Input::KeyboardAndMouse::ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : Win32cr::UI::TextServices::HKL
    C.LoadKeyboardLayoutW(pwszKLID, flags)
  end

  def activateKeyboardLayout(hkl : Win32cr::UI::TextServices::HKL, flags : Win32cr::UI::Input::KeyboardAndMouse::ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : Win32cr::UI::TextServices::HKL
    C.ActivateKeyboardLayout(hkl, flags)
  end

  def toUnicodeEx(wVirtKey : UInt32, wScanCode : UInt32, lpKeyState : UInt8*, pwszBuff : UInt16*, cchBuff : Int32, wFlags : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : Int32
    C.ToUnicodeEx(wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags, dwhkl)
  end

  def unloadKeyboardLayout(hkl : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::BOOL
    C.UnloadKeyboardLayout(hkl)
  end

  def getKeyboardLayoutNameA(pwszKLID : UInt8*) : Win32cr::Foundation::BOOL
    C.GetKeyboardLayoutNameA(pwszKLID)
  end

  def getKeyboardLayoutNameW(pwszKLID : UInt16*) : Win32cr::Foundation::BOOL
    C.GetKeyboardLayoutNameW(pwszKLID)
  end

  def getKeyboardLayoutList(nBuff : Int32, lpList : Win32cr::UI::TextServices::HKL*) : Int32
    C.GetKeyboardLayoutList(nBuff, lpList)
  end

  def getKeyboardLayout(idThread : UInt32) : Win32cr::UI::TextServices::HKL
    C.GetKeyboardLayout(idThread)
  end

  def getMouseMovePointsEx(cbSize : UInt32, lppt : Win32cr::UI::Input::KeyboardAndMouse::MOUSEMOVEPOINT*, lpptBuf : Win32cr::UI::Input::KeyboardAndMouse::MOUSEMOVEPOINT*, nBufPoints : Int32, resolution : Win32cr::UI::Input::KeyboardAndMouse::GET_MOUSE_MOVE_POINTS_EX_RESOLUTION) : Int32
    C.GetMouseMovePointsEx(cbSize, lppt, lpptBuf, nBufPoints, resolution)
  end

  def trackMouseEvent(lpEventTrack : Win32cr::UI::Input::KeyboardAndMouse::TRACKMOUSEEVENT*) : Win32cr::Foundation::BOOL
    C.TrackMouseEvent(lpEventTrack)
  end

  def registerHotKey(hWnd : Win32cr::Foundation::HWND, id : Int32, fsModifiers : Win32cr::UI::Input::KeyboardAndMouse::HOT_KEY_MODIFIERS, vk : UInt32) : Win32cr::Foundation::BOOL
    C.RegisterHotKey(hWnd, id, fsModifiers, vk)
  end

  def unregisterHotKey(hWnd : Win32cr::Foundation::HWND, id : Int32) : Win32cr::Foundation::BOOL
    C.UnregisterHotKey(hWnd, id)
  end

  def swapMouseButton(fSwap : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SwapMouseButton(fSwap)
  end

  def getDoubleClickTime : UInt32
    C.GetDoubleClickTime
  end

  def setDoubleClickTime(param0 : UInt32) : Win32cr::Foundation::BOOL
    C.SetDoubleClickTime(param0)
  end

  def setFocus(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND
    C.SetFocus(hWnd)
  end

  def getActiveWindow : Win32cr::Foundation::HWND
    C.GetActiveWindow
  end

  def getFocus : Win32cr::Foundation::HWND
    C.GetFocus
  end

  def getKBCodePage : UInt32
    C.GetKBCodePage
  end

  def getKeyState(nVirtKey : Int32) : Int16
    C.GetKeyState(nVirtKey)
  end

  def getAsyncKeyState(vKey : Int32) : Int16
    C.GetAsyncKeyState(vKey)
  end

  def getKeyboardState(lpKeyState : UInt8*) : Win32cr::Foundation::BOOL
    C.GetKeyboardState(lpKeyState)
  end

  def setKeyboardState(lpKeyState : UInt8*) : Win32cr::Foundation::BOOL
    C.SetKeyboardState(lpKeyState)
  end

  def getKeyNameTextA(lParam : Int32, lpString : UInt8*, cchSize : Int32) : Int32
    C.GetKeyNameTextA(lParam, lpString, cchSize)
  end

  def getKeyNameTextW(lParam : Int32, lpString : UInt16*, cchSize : Int32) : Int32
    C.GetKeyNameTextW(lParam, lpString, cchSize)
  end

  def getKeyboardType(nTypeFlag : Int32) : Int32
    C.GetKeyboardType(nTypeFlag)
  end

  def toAscii(uVirtKey : UInt32, uScanCode : UInt32, lpKeyState : UInt8*, lpChar : UInt16*, uFlags : UInt32) : Int32
    C.ToAscii(uVirtKey, uScanCode, lpKeyState, lpChar, uFlags)
  end

  def toAsciiEx(uVirtKey : UInt32, uScanCode : UInt32, lpKeyState : UInt8*, lpChar : UInt16*, uFlags : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : Int32
    C.ToAsciiEx(uVirtKey, uScanCode, lpKeyState, lpChar, uFlags, dwhkl)
  end

  def toUnicode(wVirtKey : UInt32, wScanCode : UInt32, lpKeyState : UInt8*, pwszBuff : UInt16*, cchBuff : Int32, wFlags : UInt32) : Int32
    C.ToUnicode(wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags)
  end

  def oemKeyScan(wOemChar : UInt16) : UInt32
    C.OemKeyScan(wOemChar)
  end

  def vkKeyScanA(ch : Win32cr::Foundation::CHAR) : Int16
    C.VkKeyScanA(ch)
  end

  def vkKeyScanW(ch : UInt16) : Int16
    C.VkKeyScanW(ch)
  end

  def vkKeyScanExA(ch : Win32cr::Foundation::CHAR, dwhkl : Win32cr::UI::TextServices::HKL) : Int16
    C.VkKeyScanExA(ch, dwhkl)
  end

  def vkKeyScanExW(ch : UInt16, dwhkl : Win32cr::UI::TextServices::HKL) : Int16
    C.VkKeyScanExW(ch, dwhkl)
  end

  def keybdEvent(bVk : UInt8, bScan : UInt8, dwFlags : Win32cr::UI::Input::KeyboardAndMouse::KEYBD_EVENT_FLAGS, dwExtraInfo : LibC::UIntPtrT) : Void
    C.keybd_event(bVk, bScan, dwFlags, dwExtraInfo)
  end

  def mouseEvent(dwFlags : Win32cr::UI::Input::KeyboardAndMouse::MOUSE_EVENT_FLAGS, dx : Int32, dy : Int32, dwData : UInt32, dwExtraInfo : LibC::UIntPtrT) : Void
    C.mouse_event(dwFlags, dx, dy, dwData, dwExtraInfo)
  end

  def sendInput(cInputs : UInt32, pInputs : Win32cr::UI::Input::KeyboardAndMouse::INPUT*, cbSize : Int32) : UInt32
    C.SendInput(cInputs, pInputs, cbSize)
  end

  def getLastInputInfo(plii : Win32cr::UI::Input::KeyboardAndMouse::LASTINPUTINFO*) : Win32cr::Foundation::BOOL
    C.GetLastInputInfo(plii)
  end

  def mapVirtualKeyA(uCode : UInt32, uMapType : UInt32) : UInt32
    C.MapVirtualKeyA(uCode, uMapType)
  end

  def mapVirtualKeyW(uCode : UInt32, uMapType : UInt32) : UInt32
    C.MapVirtualKeyW(uCode, uMapType)
  end

  def mapVirtualKeyExA(uCode : UInt32, uMapType : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : UInt32
    C.MapVirtualKeyExA(uCode, uMapType, dwhkl)
  end

  def mapVirtualKeyExW(uCode : UInt32, uMapType : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : UInt32
    C.MapVirtualKeyExW(uCode, uMapType, dwhkl)
  end

  def getCapture : Win32cr::Foundation::HWND
    C.GetCapture
  end

  def setCapture(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND
    C.SetCapture(hWnd)
  end

  def releaseCapture : Win32cr::Foundation::BOOL
    C.ReleaseCapture
  end

  def enableWindow(hWnd : Win32cr::Foundation::HWND, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.EnableWindow(hWnd, bEnable)
  end

  def isWindowEnabled(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.IsWindowEnabled(hWnd)
  end

  def dragDetect(hwnd : Win32cr::Foundation::HWND, pt : Win32cr::Foundation::POINT) : Win32cr::Foundation::BOOL
    C.DragDetect(hwnd, pt)
  end

  def setActiveWindow(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND
    C.SetActiveWindow(hWnd)
  end

  def blockInput(fBlockIt : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.BlockInput(fBlockIt)
  end

  @[Link("comctl32")]
  @[Link("user32")]
  lib C
    # :nodoc:
    fun _TrackMouseEvent(lpEventTrack : Win32cr::UI::Input::KeyboardAndMouse::TRACKMOUSEEVENT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LoadKeyboardLayoutA(pwszKLID : Win32cr::Foundation::PSTR, flags : Win32cr::UI::Input::KeyboardAndMouse::ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : Win32cr::UI::TextServices::HKL

    # :nodoc:
    fun LoadKeyboardLayoutW(pwszKLID : Win32cr::Foundation::PWSTR, flags : Win32cr::UI::Input::KeyboardAndMouse::ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : Win32cr::UI::TextServices::HKL

    # :nodoc:
    fun ActivateKeyboardLayout(hkl : Win32cr::UI::TextServices::HKL, flags : Win32cr::UI::Input::KeyboardAndMouse::ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : Win32cr::UI::TextServices::HKL

    # :nodoc:
    fun ToUnicodeEx(wVirtKey : UInt32, wScanCode : UInt32, lpKeyState : UInt8*, pwszBuff : UInt16*, cchBuff : Int32, wFlags : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : Int32

    # :nodoc:
    fun UnloadKeyboardLayout(hkl : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetKeyboardLayoutNameA(pwszKLID : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetKeyboardLayoutNameW(pwszKLID : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetKeyboardLayoutList(nBuff : Int32, lpList : Win32cr::UI::TextServices::HKL*) : Int32

    # :nodoc:
    fun GetKeyboardLayout(idThread : UInt32) : Win32cr::UI::TextServices::HKL

    # :nodoc:
    fun GetMouseMovePointsEx(cbSize : UInt32, lppt : Win32cr::UI::Input::KeyboardAndMouse::MOUSEMOVEPOINT*, lpptBuf : Win32cr::UI::Input::KeyboardAndMouse::MOUSEMOVEPOINT*, nBufPoints : Int32, resolution : Win32cr::UI::Input::KeyboardAndMouse::GET_MOUSE_MOVE_POINTS_EX_RESOLUTION) : Int32

    # :nodoc:
    fun TrackMouseEvent(lpEventTrack : Win32cr::UI::Input::KeyboardAndMouse::TRACKMOUSEEVENT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterHotKey(hWnd : Win32cr::Foundation::HWND, id : Int32, fsModifiers : Win32cr::UI::Input::KeyboardAndMouse::HOT_KEY_MODIFIERS, vk : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterHotKey(hWnd : Win32cr::Foundation::HWND, id : Int32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SwapMouseButton(fSwap : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDoubleClickTime : UInt32

    # :nodoc:
    fun SetDoubleClickTime(param0 : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetFocus(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND

    # :nodoc:
    fun GetActiveWindow : Win32cr::Foundation::HWND

    # :nodoc:
    fun GetFocus : Win32cr::Foundation::HWND

    # :nodoc:
    fun GetKBCodePage : UInt32

    # :nodoc:
    fun GetKeyState(nVirtKey : Int32) : Int16

    # :nodoc:
    fun GetAsyncKeyState(vKey : Int32) : Int16

    # :nodoc:
    fun GetKeyboardState(lpKeyState : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetKeyboardState(lpKeyState : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetKeyNameTextA(lParam : Int32, lpString : UInt8*, cchSize : Int32) : Int32

    # :nodoc:
    fun GetKeyNameTextW(lParam : Int32, lpString : UInt16*, cchSize : Int32) : Int32

    # :nodoc:
    fun GetKeyboardType(nTypeFlag : Int32) : Int32

    # :nodoc:
    fun ToAscii(uVirtKey : UInt32, uScanCode : UInt32, lpKeyState : UInt8*, lpChar : UInt16*, uFlags : UInt32) : Int32

    # :nodoc:
    fun ToAsciiEx(uVirtKey : UInt32, uScanCode : UInt32, lpKeyState : UInt8*, lpChar : UInt16*, uFlags : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : Int32

    # :nodoc:
    fun ToUnicode(wVirtKey : UInt32, wScanCode : UInt32, lpKeyState : UInt8*, pwszBuff : UInt16*, cchBuff : Int32, wFlags : UInt32) : Int32

    # :nodoc:
    fun OemKeyScan(wOemChar : UInt16) : UInt32

    # :nodoc:
    fun VkKeyScanA(ch : Win32cr::Foundation::CHAR) : Int16

    # :nodoc:
    fun VkKeyScanW(ch : UInt16) : Int16

    # :nodoc:
    fun VkKeyScanExA(ch : Win32cr::Foundation::CHAR, dwhkl : Win32cr::UI::TextServices::HKL) : Int16

    # :nodoc:
    fun VkKeyScanExW(ch : UInt16, dwhkl : Win32cr::UI::TextServices::HKL) : Int16

    # :nodoc:
    fun keybd_event(bVk : UInt8, bScan : UInt8, dwFlags : Win32cr::UI::Input::KeyboardAndMouse::KEYBD_EVENT_FLAGS, dwExtraInfo : LibC::UIntPtrT) : Void

    # :nodoc:
    fun mouse_event(dwFlags : Win32cr::UI::Input::KeyboardAndMouse::MOUSE_EVENT_FLAGS, dx : Int32, dy : Int32, dwData : UInt32, dwExtraInfo : LibC::UIntPtrT) : Void

    # :nodoc:
    fun SendInput(cInputs : UInt32, pInputs : Win32cr::UI::Input::KeyboardAndMouse::INPUT*, cbSize : Int32) : UInt32

    # :nodoc:
    fun GetLastInputInfo(plii : Win32cr::UI::Input::KeyboardAndMouse::LASTINPUTINFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MapVirtualKeyA(uCode : UInt32, uMapType : UInt32) : UInt32

    # :nodoc:
    fun MapVirtualKeyW(uCode : UInt32, uMapType : UInt32) : UInt32

    # :nodoc:
    fun MapVirtualKeyExA(uCode : UInt32, uMapType : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : UInt32

    # :nodoc:
    fun MapVirtualKeyExW(uCode : UInt32, uMapType : UInt32, dwhkl : Win32cr::UI::TextServices::HKL) : UInt32

    # :nodoc:
    fun GetCapture : Win32cr::Foundation::HWND

    # :nodoc:
    fun SetCapture(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND

    # :nodoc:
    fun ReleaseCapture : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnableWindow(hWnd : Win32cr::Foundation::HWND, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsWindowEnabled(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DragDetect(hwnd : Win32cr::Foundation::HWND, pt : Win32cr::Foundation::POINT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetActiveWindow(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND

    # :nodoc:
    fun BlockInput(fBlockIt : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

  end
end