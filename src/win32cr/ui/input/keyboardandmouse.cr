require "../../foundation.cr"
require "../../ui/textservices.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:comctl32.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
lib LibWin32
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


  enum HOT_KEY_MODIFIERS : UInt32
    MOD_ALT = 1
    MOD_CONTROL = 2
    MOD_NOREPEAT = 16384
    MOD_SHIFT = 4
    MOD_WIN = 8
  end

  enum ACTIVATE_KEYBOARD_LAYOUT_FLAGS : UInt32
    KLF_REORDER = 8
    KLF_RESET = 1073741824
    KLF_SETFORPROCESS = 256
    KLF_SHIFTLOCK = 65536
    KLF_ACTIVATE = 1
    KLF_NOTELLSHELL = 128
    KLF_REPLACELANG = 16
    KLF_SUBSTITUTE_OK = 2
  end

  enum GET_MOUSE_MOVE_POINTS_EX_RESOLUTION : UInt32
    GMMP_USE_DISPLAY_POINTS = 1
    GMMP_USE_HIGH_RESOLUTION_POINTS = 2
  end

  enum KEYBD_EVENT_FLAGS : UInt32
    KEYEVENTF_EXTENDEDKEY = 1
    KEYEVENTF_KEYUP = 2
    KEYEVENTF_SCANCODE = 8
    KEYEVENTF_UNICODE = 4
  end

  enum MOUSE_EVENT_FLAGS : UInt32
    MOUSEEVENTF_ABSOLUTE = 32768
    MOUSEEVENTF_LEFTDOWN = 2
    MOUSEEVENTF_LEFTUP = 4
    MOUSEEVENTF_MIDDLEDOWN = 32
    MOUSEEVENTF_MIDDLEUP = 64
    MOUSEEVENTF_MOVE = 1
    MOUSEEVENTF_RIGHTDOWN = 8
    MOUSEEVENTF_RIGHTUP = 16
    MOUSEEVENTF_WHEEL = 2048
    MOUSEEVENTF_XDOWN = 128
    MOUSEEVENTF_XUP = 256
    MOUSEEVENTF_HWHEEL = 4096
    MOUSEEVENTF_MOVE_NOCOALESCE = 8192
    MOUSEEVENTF_VIRTUALDESK = 16384
  end

  enum INPUT_TYPE : UInt32
    INPUT_MOUSE = 0
    INPUT_KEYBOARD = 1
    INPUT_HARDWARE = 2
  end

  enum TRACKMOUSEEVENT_FLAGS : UInt32
    TME_CANCEL = 2147483648
    TME_HOVER = 1
    TME_LEAVE = 2
    TME_NONCLIENT = 16
    TME_QUERY = 1073741824
  end

  enum VIRTUAL_KEY : UInt16
    VK_0 = 48
    VK_1 = 49
    VK_2 = 50
    VK_3 = 51
    VK_4 = 52
    VK_5 = 53
    VK_6 = 54
    VK_7 = 55
    VK_8 = 56
    VK_9 = 57
    VK_A = 65
    VK_B = 66
    VK_C = 67
    VK_D = 68
    VK_E = 69
    VK_F = 70
    VK_G = 71
    VK_H = 72
    VK_I = 73
    VK_J = 74
    VK_K = 75
    VK_L = 76
    VK_M = 77
    VK_N = 78
    VK_O = 79
    VK_P = 80
    VK_Q = 81
    VK_R = 82
    VK_S = 83
    VK_T = 84
    VK_U = 85
    VK_V = 86
    VK_W = 87
    VK_X = 88
    VK_Y = 89
    VK_Z = 90
    VK_LBUTTON = 1
    VK_RBUTTON = 2
    VK_CANCEL = 3
    VK_MBUTTON = 4
    VK_XBUTTON1 = 5
    VK_XBUTTON2 = 6
    VK_BACK = 8
    VK_TAB = 9
    VK_CLEAR = 12
    VK_RETURN = 13
    VK_SHIFT = 16
    VK_CONTROL = 17
    VK_MENU = 18
    VK_PAUSE = 19
    VK_CAPITAL = 20
    VK_KANA = 21
    VK_HANGEUL = 21
    VK_HANGUL = 21
    VK_IME_ON = 22
    VK_JUNJA = 23
    VK_FINAL = 24
    VK_HANJA = 25
    VK_KANJI = 25
    VK_IME_OFF = 26
    VK_ESCAPE = 27
    VK_CONVERT = 28
    VK_NONCONVERT = 29
    VK_ACCEPT = 30
    VK_MODECHANGE = 31
    VK_SPACE = 32
    VK_PRIOR = 33
    VK_NEXT = 34
    VK_END = 35
    VK_HOME = 36
    VK_LEFT = 37
    VK_UP = 38
    VK_RIGHT = 39
    VK_DOWN = 40
    VK_SELECT = 41
    VK_PRINT = 42
    VK_EXECUTE = 43
    VK_SNAPSHOT = 44
    VK_INSERT = 45
    VK_DELETE = 46
    VK_HELP = 47
    VK_LWIN = 91
    VK_RWIN = 92
    VK_APPS = 93
    VK_SLEEP = 95
    VK_NUMPAD0 = 96
    VK_NUMPAD1 = 97
    VK_NUMPAD2 = 98
    VK_NUMPAD3 = 99
    VK_NUMPAD4 = 100
    VK_NUMPAD5 = 101
    VK_NUMPAD6 = 102
    VK_NUMPAD7 = 103
    VK_NUMPAD8 = 104
    VK_NUMPAD9 = 105
    VK_MULTIPLY = 106
    VK_ADD = 107
    VK_SEPARATOR = 108
    VK_SUBTRACT = 109
    VK_DECIMAL = 110
    VK_DIVIDE = 111
    VK_F1 = 112
    VK_F2 = 113
    VK_F3 = 114
    VK_F4 = 115
    VK_F5 = 116
    VK_F6 = 117
    VK_F7 = 118
    VK_F8 = 119
    VK_F9 = 120
    VK_F10 = 121
    VK_F11 = 122
    VK_F12 = 123
    VK_F13 = 124
    VK_F14 = 125
    VK_F15 = 126
    VK_F16 = 127
    VK_F17 = 128
    VK_F18 = 129
    VK_F19 = 130
    VK_F20 = 131
    VK_F21 = 132
    VK_F22 = 133
    VK_F23 = 134
    VK_F24 = 135
    VK_NAVIGATION_VIEW = 136
    VK_NAVIGATION_MENU = 137
    VK_NAVIGATION_UP = 138
    VK_NAVIGATION_DOWN = 139
    VK_NAVIGATION_LEFT = 140
    VK_NAVIGATION_RIGHT = 141
    VK_NAVIGATION_ACCEPT = 142
    VK_NAVIGATION_CANCEL = 143
    VK_NUMLOCK = 144
    VK_SCROLL = 145
    VK_OEM_NEC_EQUAL = 146
    VK_OEM_FJ_JISHO = 146
    VK_OEM_FJ_MASSHOU = 147
    VK_OEM_FJ_TOUROKU = 148
    VK_OEM_FJ_LOYA = 149
    VK_OEM_FJ_ROYA = 150
    VK_LSHIFT = 160
    VK_RSHIFT = 161
    VK_LCONTROL = 162
    VK_RCONTROL = 163
    VK_LMENU = 164
    VK_RMENU = 165
    VK_BROWSER_BACK = 166
    VK_BROWSER_FORWARD = 167
    VK_BROWSER_REFRESH = 168
    VK_BROWSER_STOP = 169
    VK_BROWSER_SEARCH = 170
    VK_BROWSER_FAVORITES = 171
    VK_BROWSER_HOME = 172
    VK_VOLUME_MUTE = 173
    VK_VOLUME_DOWN = 174
    VK_VOLUME_UP = 175
    VK_MEDIA_NEXT_TRACK = 176
    VK_MEDIA_PREV_TRACK = 177
    VK_MEDIA_STOP = 178
    VK_MEDIA_PLAY_PAUSE = 179
    VK_LAUNCH_MAIL = 180
    VK_LAUNCH_MEDIA_SELECT = 181
    VK_LAUNCH_APP1 = 182
    VK_LAUNCH_APP2 = 183
    VK_OEM_1 = 186
    VK_OEM_PLUS = 187
    VK_OEM_COMMA = 188
    VK_OEM_MINUS = 189
    VK_OEM_PERIOD = 190
    VK_OEM_2 = 191
    VK_OEM_3 = 192
    VK_GAMEPAD_A = 195
    VK_GAMEPAD_B = 196
    VK_GAMEPAD_X = 197
    VK_GAMEPAD_Y = 198
    VK_GAMEPAD_RIGHT_SHOULDER = 199
    VK_GAMEPAD_LEFT_SHOULDER = 200
    VK_GAMEPAD_LEFT_TRIGGER = 201
    VK_GAMEPAD_RIGHT_TRIGGER = 202
    VK_GAMEPAD_DPAD_UP = 203
    VK_GAMEPAD_DPAD_DOWN = 204
    VK_GAMEPAD_DPAD_LEFT = 205
    VK_GAMEPAD_DPAD_RIGHT = 206
    VK_GAMEPAD_MENU = 207
    VK_GAMEPAD_VIEW = 208
    VK_GAMEPAD_LEFT_THUMBSTICK_BUTTON = 209
    VK_GAMEPAD_RIGHT_THUMBSTICK_BUTTON = 210
    VK_GAMEPAD_LEFT_THUMBSTICK_UP = 211
    VK_GAMEPAD_LEFT_THUMBSTICK_DOWN = 212
    VK_GAMEPAD_LEFT_THUMBSTICK_RIGHT = 213
    VK_GAMEPAD_LEFT_THUMBSTICK_LEFT = 214
    VK_GAMEPAD_RIGHT_THUMBSTICK_UP = 215
    VK_GAMEPAD_RIGHT_THUMBSTICK_DOWN = 216
    VK_GAMEPAD_RIGHT_THUMBSTICK_RIGHT = 217
    VK_GAMEPAD_RIGHT_THUMBSTICK_LEFT = 218
    VK_OEM_4 = 219
    VK_OEM_5 = 220
    VK_OEM_6 = 221
    VK_OEM_7 = 222
    VK_OEM_8 = 223
    VK_OEM_AX = 225
    VK_OEM_102 = 226
    VK_ICO_HELP = 227
    VK_ICO_00 = 228
    VK_PROCESSKEY = 229
    VK_ICO_CLEAR = 230
    VK_PACKET = 231
    VK_OEM_RESET = 233
    VK_OEM_JUMP = 234
    VK_OEM_PA1 = 235
    VK_OEM_PA2 = 236
    VK_OEM_PA3 = 237
    VK_OEM_WSCTRL = 238
    VK_OEM_CUSEL = 239
    VK_OEM_ATTN = 240
    VK_OEM_FINISH = 241
    VK_OEM_COPY = 242
    VK_OEM_AUTO = 243
    VK_OEM_ENLW = 244
    VK_OEM_BACKTAB = 245
    VK_ATTN = 246
    VK_CRSEL = 247
    VK_EXSEL = 248
    VK_EREOF = 249
    VK_PLAY = 250
    VK_ZOOM = 251
    VK_NONAME = 252
    VK_PA1 = 253
    VK_OEM_CLEAR = 254
  end

  union INPUT_Anonymous_e__Union
    mi : MOUSEINPUT
    ki : KEYBDINPUT
    hi : HARDWAREINPUT
  end

  struct VK_TO_BIT
    vk : UInt8
    mod_bits : UInt8
  end
  struct MODIFIERS
    p_vk_to_bit : VK_TO_BIT*
    w_max_mod_bits : UInt16
    mod_number : UInt8[0]*
  end
  struct VSC_VK
    vsc : UInt8
    vk : UInt16
  end
  struct VK_VSC
    vk : UInt8
    vsc : UInt8
  end
  struct VK_TO_WCHARS1
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[0]*
  end
  struct VK_TO_WCHARS2
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[2]*
  end
  struct VK_TO_WCHARS3
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[3]*
  end
  struct VK_TO_WCHARS4
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[4]*
  end
  struct VK_TO_WCHARS5
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[5]*
  end
  struct VK_TO_WCHARS6
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[6]*
  end
  struct VK_TO_WCHARS7
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[7]*
  end
  struct VK_TO_WCHARS8
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[8]*
  end
  struct VK_TO_WCHARS9
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[9]*
  end
  struct VK_TO_WCHARS10
    virtual_key : UInt8
    attributes : UInt8
    wch : Char[10]*
  end
  struct VK_TO_WCHAR_TABLE
    p_vk_to_wchars : VK_TO_WCHARS1*
    n_modifications : UInt8
    cb_size : UInt8
  end
  struct DEADKEY
    dw_both : UInt32
    wch_composed : Char
    u_flags : UInt16
  end
  struct LIGATURE1
    virtual_key : UInt8
    modification_number : UInt16
    wch : Char[0]*
  end
  struct LIGATURE2
    virtual_key : UInt8
    modification_number : UInt16
    wch : Char[2]*
  end
  struct LIGATURE3
    virtual_key : UInt8
    modification_number : UInt16
    wch : Char[3]*
  end
  struct LIGATURE4
    virtual_key : UInt8
    modification_number : UInt16
    wch : Char[4]*
  end
  struct LIGATURE5
    virtual_key : UInt8
    modification_number : UInt16
    wch : Char[5]*
  end
  struct VSC_LPWSTR
    vsc : UInt8
    pwsz : LibC::LPWSTR
  end
  struct Tagkbdlayer
    p_char_modifiers : MODIFIERS*
    p_vk_to_wchar_table : VK_TO_WCHAR_TABLE*
    p_dead_key : DEADKEY*
    p_key_names : VSC_LPWSTR*
    p_key_names_ext : VSC_LPWSTR*
    p_key_names_dead : UInt16**
    pus_vs_cto_vk : UInt16*
    b_max_vs_cto_vk : UInt8
    p_vs_cto_vk_e0 : VSC_VK*
    p_vs_cto_vk_e1 : VSC_VK*
    f_locale_flags : UInt32
    n_lg_max : UInt8
    cb_lg_entry : UInt8
    p_ligature : LIGATURE1*
    dw_type : UInt32
    dw_sub_type : UInt32
  end
  struct VK_FUNCTION_PARAM
    nlsfe_proc_index : UInt8
    nlsfe_proc_param : UInt32
  end
  struct VK_TO_FUNCTION_TABLE
    vk : UInt8
    nlsfe_proc_type : UInt8
    nlsfe_proc_current : UInt8
    nlsfe_proc_switch : UInt8
    nlsfe_proc : VK_FUNCTION_PARAM[8]*
    nlsfe_proc_alt : VK_FUNCTION_PARAM[8]*
  end
  struct Tagkbdnlslayer
    oem_identifier : UInt16
    layout_information : UInt16
    num_of_vk_to_f : UInt32
    p_vk_to_f : VK_TO_FUNCTION_TABLE*
    num_of_mouse_v_key : Int32
    pus_mouse_v_key : UInt16*
  end
  struct KBDTABLE_DESC
    wsz_dll_name : Char[32]*
    dw_type : UInt32
    dw_sub_type : UInt32
  end
  struct KBDTABLE_MULTI
    n_tables : UInt32
    a_kbd_tables : KBDTABLE_DESC[8]*
  end
  struct KBD_TYPE_INFO
    dw_version : UInt32
    dw_type : UInt32
    dw_sub_type : UInt32
  end
  struct MOUSEMOVEPOINT
    x : Int32
    y : Int32
    time : UInt32
    dw_extra_info : LibC::UINT_PTR
  end
  struct TRACKMOUSEEVENT
    cb_size : UInt32
    dw_flags : TRACKMOUSEEVENT_FLAGS
    hwnd_track : HANDLE
    dw_hover_time : UInt32
  end
  struct MOUSEINPUT
    dx : Int32
    dy : Int32
    mouse_data : UInt32
    dw_flags : MOUSE_EVENT_FLAGS
    time : UInt32
    dw_extra_info : LibC::UINT_PTR
  end
  struct KEYBDINPUT
    w_vk : VIRTUAL_KEY
    w_scan : UInt16
    dw_flags : KEYBD_EVENT_FLAGS
    time : UInt32
    dw_extra_info : LibC::UINT_PTR
  end
  struct HARDWAREINPUT
    u_msg : UInt32
    w_param_l : UInt16
    w_param_h : UInt16
  end
  struct INPUT
    type : INPUT_TYPE
    anonymous : INPUT_Anonymous_e__Union
  end
  struct LASTINPUTINFO
    cb_size : UInt32
    dw_time : UInt32
  end


  # Params # lpeventtrack : TRACKMOUSEEVENT* [In]
  fun _TrackMouseEvent(lpeventtrack : TRACKMOUSEEVENT*) : LibC::BOOL

  # Params # pwszklid : PSTR [In],flags : ACTIVATE_KEYBOARD_LAYOUT_FLAGS [In]
  fun LoadKeyboardLayoutA(pwszklid : PSTR, flags : ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : HKL

  # Params # pwszklid : LibC::LPWSTR [In],flags : ACTIVATE_KEYBOARD_LAYOUT_FLAGS [In]
  fun LoadKeyboardLayoutW(pwszklid : LibC::LPWSTR, flags : ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : HKL

  # Params # hkl : HKL [In],flags : ACTIVATE_KEYBOARD_LAYOUT_FLAGS [In]
  fun ActivateKeyboardLayout(hkl : HKL, flags : ACTIVATE_KEYBOARD_LAYOUT_FLAGS) : HKL

  # Params # wvirtkey : UInt32 [In],wscancode : UInt32 [In],lpkeystate : UInt8* [In],pwszbuff : Char* [In],cchbuff : Int32 [In],wflags : UInt32 [In],dwhkl : HKL [In]
  fun ToUnicodeEx(wvirtkey : UInt32, wscancode : UInt32, lpkeystate : UInt8*, pwszbuff : Char*, cchbuff : Int32, wflags : UInt32, dwhkl : HKL) : Int32

  # Params # hkl : HKL [In]
  fun UnloadKeyboardLayout(hkl : HKL) : LibC::BOOL

  # Params # pwszklid : UInt8* [In]
  fun GetKeyboardLayoutNameA(pwszklid : UInt8*) : LibC::BOOL

  # Params # pwszklid : Char* [In]
  fun GetKeyboardLayoutNameW(pwszklid : Char*) : LibC::BOOL

  # Params # nbuff : Int32 [In],lplist : HKL* [In]
  fun GetKeyboardLayoutList(nbuff : Int32, lplist : HKL*) : Int32

  # Params # idthread : UInt32 [In]
  fun GetKeyboardLayout(idthread : UInt32) : HKL

  # Params # cbsize : UInt32 [In],lppt : MOUSEMOVEPOINT* [In],lpptbuf : MOUSEMOVEPOINT* [In],nbufpoints : Int32 [In],resolution : GET_MOUSE_MOVE_POINTS_EX_RESOLUTION [In]
  fun GetMouseMovePointsEx(cbsize : UInt32, lppt : MOUSEMOVEPOINT*, lpptbuf : MOUSEMOVEPOINT*, nbufpoints : Int32, resolution : GET_MOUSE_MOVE_POINTS_EX_RESOLUTION) : Int32

  # Params # lpeventtrack : TRACKMOUSEEVENT* [In]
  fun TrackMouseEvent(lpeventtrack : TRACKMOUSEEVENT*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],id : Int32 [In],fsmodifiers : HOT_KEY_MODIFIERS [In],vk : UInt32 [In]
  fun RegisterHotKey(hwnd : LibC::HANDLE, id : Int32, fsmodifiers : HOT_KEY_MODIFIERS, vk : UInt32) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],id : Int32 [In]
  fun UnregisterHotKey(hwnd : LibC::HANDLE, id : Int32) : LibC::BOOL

  # Params # fswap : LibC::BOOL [In]
  fun SwapMouseButton(fswap : LibC::BOOL) : LibC::BOOL

  # Params # 
  fun GetDoubleClickTime : UInt32

  # Params # param0 : UInt32 [In]
  fun SetDoubleClickTime(param0 : UInt32) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun SetFocus(hwnd : LibC::HANDLE) : HANDLE

  # Params # 
  fun GetActiveWindow : HANDLE

  # Params # 
  fun GetFocus : HANDLE

  # Params # 
  fun GetKBCodePage : UInt32

  # Params # nvirtkey : Int32 [In]
  fun GetKeyState(nvirtkey : Int32) : Int16

  # Params # vkey : Int32 [In]
  fun GetAsyncKeyState(vkey : Int32) : Int16

  # Params # lpkeystate : UInt8* [In]
  fun GetKeyboardState(lpkeystate : UInt8*) : LibC::BOOL

  # Params # lpkeystate : UInt8* [In]
  fun SetKeyboardState(lpkeystate : UInt8*) : LibC::BOOL

  # Params # lparam : Int32 [In],lpstring : UInt8* [In],cchsize : Int32 [In]
  fun GetKeyNameTextA(lparam : Int32, lpstring : UInt8*, cchsize : Int32) : Int32

  # Params # lparam : Int32 [In],lpstring : Char* [In],cchsize : Int32 [In]
  fun GetKeyNameTextW(lparam : Int32, lpstring : Char*, cchsize : Int32) : Int32

  # Params # ntypeflag : Int32 [In]
  fun GetKeyboardType(ntypeflag : Int32) : Int32

  # Params # uvirtkey : UInt32 [In],uscancode : UInt32 [In],lpkeystate : UInt8* [In],lpchar : UInt16* [In],uflags : UInt32 [In]
  fun ToAscii(uvirtkey : UInt32, uscancode : UInt32, lpkeystate : UInt8*, lpchar : UInt16*, uflags : UInt32) : Int32

  # Params # uvirtkey : UInt32 [In],uscancode : UInt32 [In],lpkeystate : UInt8* [In],lpchar : UInt16* [In],uflags : UInt32 [In],dwhkl : HKL [In]
  fun ToAsciiEx(uvirtkey : UInt32, uscancode : UInt32, lpkeystate : UInt8*, lpchar : UInt16*, uflags : UInt32, dwhkl : HKL) : Int32

  # Params # wvirtkey : UInt32 [In],wscancode : UInt32 [In],lpkeystate : UInt8* [In],pwszbuff : Char* [In],cchbuff : Int32 [In],wflags : UInt32 [In]
  fun ToUnicode(wvirtkey : UInt32, wscancode : UInt32, lpkeystate : UInt8*, pwszbuff : Char*, cchbuff : Int32, wflags : UInt32) : Int32

  # Params # woemchar : UInt16 [In]
  fun OemKeyScan(woemchar : UInt16) : UInt32

  # Params # ch : CHAR [In]
  fun VkKeyScanA(ch : CHAR) : Int16

  # Params # ch : Char [In]
  fun VkKeyScanW(ch : Char) : Int16

  # Params # ch : CHAR [In],dwhkl : HKL [In]
  fun VkKeyScanExA(ch : CHAR, dwhkl : HKL) : Int16

  # Params # ch : Char [In],dwhkl : HKL [In]
  fun VkKeyScanExW(ch : Char, dwhkl : HKL) : Int16

  # Params # bvk : UInt8 [In],bscan : UInt8 [In],dwflags : KEYBD_EVENT_FLAGS [In],dwextrainfo : LibC::UINT_PTR [In]
  fun keybd_event(bvk : UInt8, bscan : UInt8, dwflags : KEYBD_EVENT_FLAGS, dwextrainfo : LibC::UINT_PTR)

  # Params # dwflags : MOUSE_EVENT_FLAGS [In],dx : Int32 [In],dy : Int32 [In],dwdata : UInt32 [In],dwextrainfo : LibC::UINT_PTR [In]
  fun mouse_event(dwflags : MOUSE_EVENT_FLAGS, dx : Int32, dy : Int32, dwdata : UInt32, dwextrainfo : LibC::UINT_PTR)

  # Params # cinputs : UInt32 [In],pinputs : INPUT* [In],cbsize : Int32 [In]
  fun SendInput(cinputs : UInt32, pinputs : INPUT*, cbsize : Int32) : UInt32

  # Params # plii : LASTINPUTINFO* [In]
  fun GetLastInputInfo(plii : LASTINPUTINFO*) : LibC::BOOL

  # Params # ucode : UInt32 [In],umaptype : UInt32 [In]
  fun MapVirtualKeyA(ucode : UInt32, umaptype : UInt32) : UInt32

  # Params # ucode : UInt32 [In],umaptype : UInt32 [In]
  fun MapVirtualKeyW(ucode : UInt32, umaptype : UInt32) : UInt32

  # Params # ucode : UInt32 [In],umaptype : UInt32 [In],dwhkl : HKL [In]
  fun MapVirtualKeyExA(ucode : UInt32, umaptype : UInt32, dwhkl : HKL) : UInt32

  # Params # ucode : UInt32 [In],umaptype : UInt32 [In],dwhkl : HKL [In]
  fun MapVirtualKeyExW(ucode : UInt32, umaptype : UInt32, dwhkl : HKL) : UInt32

  # Params # 
  fun GetCapture : HANDLE

  # Params # hwnd : LibC::HANDLE [In]
  fun SetCapture(hwnd : LibC::HANDLE) : HANDLE

  # Params # 
  fun ReleaseCapture : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],benable : LibC::BOOL [In]
  fun EnableWindow(hwnd : LibC::HANDLE, benable : LibC::BOOL) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun IsWindowEnabled(hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pt : POINT [In]
  fun DragDetect(hwnd : LibC::HANDLE, pt : POINT) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun SetActiveWindow(hwnd : LibC::HANDLE) : HANDLE

  # Params # fblockit : LibC::BOOL [In]
  fun BlockInput(fblockit : LibC::BOOL) : LibC::BOOL
end
