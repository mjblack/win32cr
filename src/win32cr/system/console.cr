require "../foundation.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  alias HPCON = LibC::IntPtrT

  CONSOLE_TEXTMODE_BUFFER = 1_u32
  ATTACH_PARENT_PROCESS = 4294967295_u32
  CTRL_C_EVENT = 0_u32
  CTRL_BREAK_EVENT = 1_u32
  CTRL_CLOSE_EVENT = 2_u32
  CTRL_LOGOFF_EVENT = 5_u32
  CTRL_SHUTDOWN_EVENT = 6_u32
  PSEUDOCONSOLE_INHERIT_CURSOR = 1_u32
  FOREGROUND_BLUE = 1_u32
  FOREGROUND_GREEN = 2_u32
  FOREGROUND_RED = 4_u32
  FOREGROUND_INTENSITY = 8_u32
  BACKGROUND_BLUE = 16_u32
  BACKGROUND_GREEN = 32_u32
  BACKGROUND_RED = 64_u32
  BACKGROUND_INTENSITY = 128_u32
  COMMON_LVB_LEADING_BYTE = 256_u32
  COMMON_LVB_TRAILING_BYTE = 512_u32
  COMMON_LVB_GRID_HORIZONTAL = 1024_u32
  COMMON_LVB_GRID_LVERTICAL = 2048_u32
  COMMON_LVB_GRID_RVERTICAL = 4096_u32
  COMMON_LVB_REVERSE_VIDEO = 16384_u32
  COMMON_LVB_UNDERSCORE = 32768_u32
  COMMON_LVB_SBCSDBCS = 768_u32
  CONSOLE_NO_SELECTION = 0_u32
  CONSOLE_SELECTION_IN_PROGRESS = 1_u32
  CONSOLE_SELECTION_NOT_EMPTY = 2_u32
  CONSOLE_MOUSE_SELECTION = 4_u32
  CONSOLE_MOUSE_DOWN = 8_u32
  HISTORY_NO_DUP_FLAG = 1_u32
  CONSOLE_FULLSCREEN = 1_u32
  CONSOLE_FULLSCREEN_HARDWARE = 2_u32
  CONSOLE_FULLSCREEN_MODE = 1_u32
  CONSOLE_WINDOWED_MODE = 2_u32
  RIGHT_ALT_PRESSED = 1_u32
  LEFT_ALT_PRESSED = 2_u32
  RIGHT_CTRL_PRESSED = 4_u32
  LEFT_CTRL_PRESSED = 8_u32
  SHIFT_PRESSED = 16_u32
  NUMLOCK_ON = 32_u32
  SCROLLLOCK_ON = 64_u32
  CAPSLOCK_ON = 128_u32
  ENHANCED_KEY = 256_u32
  NLS_DBCSCHAR = 65536_u32
  NLS_ALPHANUMERIC = 0_u32
  NLS_KATAKANA = 131072_u32
  NLS_HIRAGANA = 262144_u32
  NLS_ROMAN = 4194304_u32
  NLS_IME_CONVERSION = 8388608_u32
  ALTNUMPAD_BIT = 67108864_u32
  NLS_IME_DISABLE = 536870912_u32
  FROM_LEFT_1ST_BUTTON_PRESSED = 1_u32
  RIGHTMOST_BUTTON_PRESSED = 2_u32
  FROM_LEFT_2ND_BUTTON_PRESSED = 4_u32
  FROM_LEFT_3RD_BUTTON_PRESSED = 8_u32
  FROM_LEFT_4TH_BUTTON_PRESSED = 16_u32
  MOUSE_MOVED = 1_u32
  DOUBLE_CLICK = 2_u32
  MOUSE_WHEELED = 4_u32
  MOUSE_HWHEELED = 8_u32
  KEY_EVENT = 1_u32
  MOUSE_EVENT = 2_u32
  WINDOW_BUFFER_SIZE_EVENT = 4_u32
  MENU_EVENT = 8_u32
  FOCUS_EVENT = 16_u32

  alias PHANDLER_ROUTINE = Proc(UInt32, LibC::BOOL)


  enum CONSOLE_MODE : UInt32
    ENABLE_PROCESSED_INPUT = 1
    ENABLE_LINE_INPUT = 2
    ENABLE_ECHO_INPUT = 4
    ENABLE_WINDOW_INPUT = 8
    ENABLE_MOUSE_INPUT = 16
    ENABLE_INSERT_MODE = 32
    ENABLE_QUICK_EDIT_MODE = 64
    ENABLE_EXTENDED_FLAGS = 128
    ENABLE_AUTO_POSITION = 256
    ENABLE_VIRTUAL_TERMINAL_INPUT = 512
    ENABLE_PROCESSED_OUTPUT = 1
    ENABLE_WRAP_AT_EOL_OUTPUT = 2
    ENABLE_VIRTUAL_TERMINAL_PROCESSING = 4
    DISABLE_NEWLINE_AUTO_RETURN = 8
    ENABLE_LVB_GRID_WORLDWIDE = 16
  end

  enum STD_HANDLE : UInt32
    STD_INPUT_HANDLE = 4294967286
    STD_OUTPUT_HANDLE = 4294967285
    STD_ERROR_HANDLE = 4294967284
  end

  union KEY_EVENT_RECORD_uChar_e__Union
    unicode_char : Char
    ascii_char : CHAR
  end
  union INPUT_RECORD_Event_e__Union
    key_event : KEY_EVENT_RECORD
    mouse_event : MOUSE_EVENT_RECORD
    window_buffer_size_event : WINDOW_BUFFER_SIZE_RECORD
    menu_event : MENU_EVENT_RECORD
    focus_event : FOCUS_EVENT_RECORD
  end
  union CHAR_INFO_Char_e__Union
    unicode_char : Char
    ascii_char : CHAR
  end

  struct COORD
    x : Int16
    y : Int16
  end
  struct SMALL_RECT
    left : Int16
    top : Int16
    right : Int16
    bottom : Int16
  end
  struct KEY_EVENT_RECORD
    b_key_down : LibC::BOOL
    w_repeat_count : UInt16
    w_virtual_key_code : UInt16
    w_virtual_scan_code : UInt16
    u_char : KEY_EVENT_RECORD_uChar_e__Union
    dw_control_key_state : UInt32
  end
  struct MOUSE_EVENT_RECORD
    dw_mouse_position : COORD
    dw_button_state : UInt32
    dw_control_key_state : UInt32
    dw_event_flags : UInt32
  end
  struct WINDOW_BUFFER_SIZE_RECORD
    dw_size : COORD
  end
  struct MENU_EVENT_RECORD
    dw_command_id : UInt32
  end
  struct FOCUS_EVENT_RECORD
    b_set_focus : LibC::BOOL
  end
  struct INPUT_RECORD
    event_type : UInt16
    event : INPUT_RECORD_Event_e__Union
  end
  struct CHAR_INFO
    char : CHAR_INFO_Char_e__Union
    attributes : UInt16
  end
  struct CONSOLE_FONT_INFO
    n_font : UInt32
    dw_font_size : COORD
  end
  struct CONSOLE_READCONSOLE_CONTROL
    n_length : UInt32
    n_initial_chars : UInt32
    dw_ctrl_wakeup_mask : UInt32
    dw_control_key_state : UInt32
  end
  struct CONSOLE_CURSOR_INFO
    dw_size : UInt32
    b_visible : LibC::BOOL
  end
  struct CONSOLE_SCREEN_BUFFER_INFO
    dw_size : COORD
    dw_cursor_position : COORD
    w_attributes : UInt16
    sr_window : SMALL_RECT
    dw_maximum_window_size : COORD
  end
  struct CONSOLE_SCREEN_BUFFER_INFOEX
    cb_size : UInt32
    dw_size : COORD
    dw_cursor_position : COORD
    w_attributes : UInt16
    sr_window : SMALL_RECT
    dw_maximum_window_size : COORD
    w_popup_attributes : UInt16
    b_fullscreen_supported : LibC::BOOL
    color_table : UInt32[16]*
  end
  struct CONSOLE_FONT_INFOEX
    cb_size : UInt32
    n_font : UInt32
    dw_font_size : COORD
    font_family : UInt32
    font_weight : UInt32
    face_name : Char[32]*
  end
  struct CONSOLE_SELECTION_INFO
    dw_flags : UInt32
    dw_selection_anchor : COORD
    sr_selection : SMALL_RECT
  end
  struct CONSOLE_HISTORY_INFO
    cb_size : UInt32
    history_buffer_size : UInt32
    number_of_history_buffers : UInt32
    dw_flags : UInt32
  end


  # Params # 
  fun AllocConsole : LibC::BOOL

  # Params # 
  fun FreeConsole : LibC::BOOL

  # Params # dwprocessid : UInt32 [In]
  fun AttachConsole(dwprocessid : UInt32) : LibC::BOOL

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetConsoleCP : UInt32

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetConsoleOutputCP : UInt32

  # Params # hconsolehandle : LibC::HANDLE [In],lpmode : CONSOLE_MODE* [In]
  # Commented out because function is part of Lib C
  #fun GetConsoleMode(hconsolehandle : LibC::HANDLE, lpmode : CONSOLE_MODE*) : LibC::BOOL

  # Params # hconsolehandle : LibC::HANDLE [In],dwmode : CONSOLE_MODE [In]
  # Commented out because function is part of Lib C
  #fun SetConsoleMode(hconsolehandle : LibC::HANDLE, dwmode : CONSOLE_MODE) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpnumberofevents : UInt32* [In]
  fun GetNumberOfConsoleInputEvents(hconsoleinput : LibC::HANDLE, lpnumberofevents : UInt32*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : INPUT_RECORD* [In],nlength : UInt32 [In],lpnumberofeventsread : UInt32* [In]
  fun ReadConsoleInputA(hconsoleinput : LibC::HANDLE, lpbuffer : INPUT_RECORD*, nlength : UInt32, lpnumberofeventsread : UInt32*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : INPUT_RECORD* [In],nlength : UInt32 [In],lpnumberofeventsread : UInt32* [In]
  fun ReadConsoleInputW(hconsoleinput : LibC::HANDLE, lpbuffer : INPUT_RECORD*, nlength : UInt32, lpnumberofeventsread : UInt32*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : INPUT_RECORD* [In],nlength : UInt32 [In],lpnumberofeventsread : UInt32* [In]
  fun PeekConsoleInputA(hconsoleinput : LibC::HANDLE, lpbuffer : INPUT_RECORD*, nlength : UInt32, lpnumberofeventsread : UInt32*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : INPUT_RECORD* [In],nlength : UInt32 [In],lpnumberofeventsread : UInt32* [In]
  fun PeekConsoleInputW(hconsoleinput : LibC::HANDLE, lpbuffer : INPUT_RECORD*, nlength : UInt32, lpnumberofeventsread : UInt32*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : Void* [In],nnumberofcharstoread : UInt32 [In],lpnumberofcharsread : UInt32* [In],pinputcontrol : CONSOLE_READCONSOLE_CONTROL* [In]
  fun ReadConsoleA(hconsoleinput : LibC::HANDLE, lpbuffer : Void*, nnumberofcharstoread : UInt32, lpnumberofcharsread : UInt32*, pinputcontrol : CONSOLE_READCONSOLE_CONTROL*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : Void* [In],nnumberofcharstoread : UInt32 [In],lpnumberofcharsread : UInt32* [In],pinputcontrol : CONSOLE_READCONSOLE_CONTROL* [In]
  fun ReadConsoleW(hconsoleinput : LibC::HANDLE, lpbuffer : Void*, nnumberofcharstoread : UInt32, lpnumberofcharsread : UInt32*, pinputcontrol : CONSOLE_READCONSOLE_CONTROL*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpbuffer : Void* [In],nnumberofcharstowrite : UInt32 [In],lpnumberofcharswritten : UInt32* [In],lpreserved : Void* [In]
  fun WriteConsoleA(hconsoleoutput : LibC::HANDLE, lpbuffer : Void*, nnumberofcharstowrite : UInt32, lpnumberofcharswritten : UInt32*, lpreserved : Void*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpbuffer : Void* [In],nnumberofcharstowrite : UInt32 [In],lpnumberofcharswritten : UInt32* [In],lpreserved : Void* [In]
  fun WriteConsoleW(hconsoleoutput : LibC::HANDLE, lpbuffer : Void*, nnumberofcharstowrite : UInt32, lpnumberofcharswritten : UInt32*, lpreserved : Void*) : LibC::BOOL

  # Params # handlerroutine : PHANDLER_ROUTINE [In],add : LibC::BOOL [In]
  # Commented out because function is part of Lib C
  #fun SetConsoleCtrlHandler(handlerroutine : PHANDLER_ROUTINE, add : LibC::BOOL) : LibC::BOOL

  # Params # size : COORD [In],hinput : LibC::HANDLE [In],houtput : LibC::HANDLE [In],dwflags : UInt32 [In],phpc : HPCON* [In]
  fun CreatePseudoConsole(size : COORD, hinput : LibC::HANDLE, houtput : LibC::HANDLE, dwflags : UInt32, phpc : HPCON*) : HRESULT

  # Params # hpc : HPCON [In],size : COORD [In]
  fun ResizePseudoConsole(hpc : HPCON, size : COORD) : HRESULT

  # Params # hpc : HPCON [In]
  fun ClosePseudoConsole(hpc : HPCON) : Void

  # Params # hconsoleoutput : LibC::HANDLE [In],ccharacter : CHAR [In],nlength : UInt32 [In],dwwritecoord : COORD [In],lpnumberofcharswritten : UInt32* [In]
  fun FillConsoleOutputCharacterA(hconsoleoutput : LibC::HANDLE, ccharacter : CHAR, nlength : UInt32, dwwritecoord : COORD, lpnumberofcharswritten : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],ccharacter : Char [In],nlength : UInt32 [In],dwwritecoord : COORD [In],lpnumberofcharswritten : UInt32* [In]
  fun FillConsoleOutputCharacterW(hconsoleoutput : LibC::HANDLE, ccharacter : Char, nlength : UInt32, dwwritecoord : COORD, lpnumberofcharswritten : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],wattribute : UInt16 [In],nlength : UInt32 [In],dwwritecoord : COORD [In],lpnumberofattrswritten : UInt32* [In]
  fun FillConsoleOutputAttribute(hconsoleoutput : LibC::HANDLE, wattribute : UInt16, nlength : UInt32, dwwritecoord : COORD, lpnumberofattrswritten : UInt32*) : LibC::BOOL

  # Params # dwctrlevent : UInt32 [In],dwprocessgroupid : UInt32 [In]
  fun GenerateConsoleCtrlEvent(dwctrlevent : UInt32, dwprocessgroupid : UInt32) : LibC::BOOL

  # Params # dwdesiredaccess : UInt32 [In],dwsharemode : UInt32 [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],dwflags : UInt32 [In],lpscreenbufferdata : Void* [In]
  fun CreateConsoleScreenBuffer(dwdesiredaccess : UInt32, dwsharemode : UInt32, lpsecurityattributes : SECURITY_ATTRIBUTES*, dwflags : UInt32, lpscreenbufferdata : Void*) : LibC::HANDLE

  # Params # hconsoleoutput : LibC::HANDLE [In]
  fun SetConsoleActiveScreenBuffer(hconsoleoutput : LibC::HANDLE) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In]
  fun FlushConsoleInputBuffer(hconsoleinput : LibC::HANDLE) : LibC::BOOL

  # Params # wcodepageid : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun SetConsoleCP(wcodepageid : UInt32) : LibC::BOOL

  # Params # wcodepageid : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun SetConsoleOutputCP(wcodepageid : UInt32) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpconsolecursorinfo : CONSOLE_CURSOR_INFO* [In]
  fun GetConsoleCursorInfo(hconsoleoutput : LibC::HANDLE, lpconsolecursorinfo : CONSOLE_CURSOR_INFO*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpconsolecursorinfo : CONSOLE_CURSOR_INFO* [In]
  fun SetConsoleCursorInfo(hconsoleoutput : LibC::HANDLE, lpconsolecursorinfo : CONSOLE_CURSOR_INFO*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpconsolescreenbufferinfo : CONSOLE_SCREEN_BUFFER_INFO* [In]
  fun GetConsoleScreenBufferInfo(hconsoleoutput : LibC::HANDLE, lpconsolescreenbufferinfo : CONSOLE_SCREEN_BUFFER_INFO*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpconsolescreenbufferinfoex : CONSOLE_SCREEN_BUFFER_INFOEX* [In]
  fun GetConsoleScreenBufferInfoEx(hconsoleoutput : LibC::HANDLE, lpconsolescreenbufferinfoex : CONSOLE_SCREEN_BUFFER_INFOEX*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpconsolescreenbufferinfoex : CONSOLE_SCREEN_BUFFER_INFOEX* [In]
  fun SetConsoleScreenBufferInfoEx(hconsoleoutput : LibC::HANDLE, lpconsolescreenbufferinfoex : CONSOLE_SCREEN_BUFFER_INFOEX*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],dwsize : COORD [In]
  fun SetConsoleScreenBufferSize(hconsoleoutput : LibC::HANDLE, dwsize : COORD) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],dwcursorposition : COORD [In]
  fun SetConsoleCursorPosition(hconsoleoutput : LibC::HANDLE, dwcursorposition : COORD) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In]
  fun GetLargestConsoleWindowSize(hconsoleoutput : LibC::HANDLE) : COORD

  # Params # hconsoleoutput : LibC::HANDLE [In],wattributes : UInt16 [In]
  fun SetConsoleTextAttribute(hconsoleoutput : LibC::HANDLE, wattributes : UInt16) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],babsolute : LibC::BOOL [In],lpconsolewindow : SMALL_RECT* [In]
  fun SetConsoleWindowInfo(hconsoleoutput : LibC::HANDLE, babsolute : LibC::BOOL, lpconsolewindow : SMALL_RECT*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpcharacter : UInt8* [In],nlength : UInt32 [In],dwwritecoord : COORD [In],lpnumberofcharswritten : UInt32* [In]
  fun WriteConsoleOutputCharacterA(hconsoleoutput : LibC::HANDLE, lpcharacter : UInt8*, nlength : UInt32, dwwritecoord : COORD, lpnumberofcharswritten : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpcharacter : Char* [In],nlength : UInt32 [In],dwwritecoord : COORD [In],lpnumberofcharswritten : UInt32* [In]
  fun WriteConsoleOutputCharacterW(hconsoleoutput : LibC::HANDLE, lpcharacter : Char*, nlength : UInt32, dwwritecoord : COORD, lpnumberofcharswritten : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpattribute : UInt16* [In],nlength : UInt32 [In],dwwritecoord : COORD [In],lpnumberofattrswritten : UInt32* [In]
  fun WriteConsoleOutputAttribute(hconsoleoutput : LibC::HANDLE, lpattribute : UInt16*, nlength : UInt32, dwwritecoord : COORD, lpnumberofattrswritten : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpcharacter : UInt8* [In],nlength : UInt32 [In],dwreadcoord : COORD [In],lpnumberofcharsread : UInt32* [In]
  fun ReadConsoleOutputCharacterA(hconsoleoutput : LibC::HANDLE, lpcharacter : UInt8*, nlength : UInt32, dwreadcoord : COORD, lpnumberofcharsread : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpcharacter : Char* [In],nlength : UInt32 [In],dwreadcoord : COORD [In],lpnumberofcharsread : UInt32* [In]
  fun ReadConsoleOutputCharacterW(hconsoleoutput : LibC::HANDLE, lpcharacter : Char*, nlength : UInt32, dwreadcoord : COORD, lpnumberofcharsread : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpattribute : UInt16* [In],nlength : UInt32 [In],dwreadcoord : COORD [In],lpnumberofattrsread : UInt32* [In]
  fun ReadConsoleOutputAttribute(hconsoleoutput : LibC::HANDLE, lpattribute : UInt16*, nlength : UInt32, dwreadcoord : COORD, lpnumberofattrsread : UInt32*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : INPUT_RECORD* [In],nlength : UInt32 [In],lpnumberofeventswritten : UInt32* [In]
  fun WriteConsoleInputA(hconsoleinput : LibC::HANDLE, lpbuffer : INPUT_RECORD*, nlength : UInt32, lpnumberofeventswritten : UInt32*) : LibC::BOOL

  # Params # hconsoleinput : LibC::HANDLE [In],lpbuffer : INPUT_RECORD* [In],nlength : UInt32 [In],lpnumberofeventswritten : UInt32* [In]
  fun WriteConsoleInputW(hconsoleinput : LibC::HANDLE, lpbuffer : INPUT_RECORD*, nlength : UInt32, lpnumberofeventswritten : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpscrollrectangle : SMALL_RECT* [In],lpcliprectangle : SMALL_RECT* [In],dwdestinationorigin : COORD [In],lpfill : CHAR_INFO* [In]
  fun ScrollConsoleScreenBufferA(hconsoleoutput : LibC::HANDLE, lpscrollrectangle : SMALL_RECT*, lpcliprectangle : SMALL_RECT*, dwdestinationorigin : COORD, lpfill : CHAR_INFO*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpscrollrectangle : SMALL_RECT* [In],lpcliprectangle : SMALL_RECT* [In],dwdestinationorigin : COORD [In],lpfill : CHAR_INFO* [In]
  fun ScrollConsoleScreenBufferW(hconsoleoutput : LibC::HANDLE, lpscrollrectangle : SMALL_RECT*, lpcliprectangle : SMALL_RECT*, dwdestinationorigin : COORD, lpfill : CHAR_INFO*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpbuffer : CHAR_INFO* [In],dwbuffersize : COORD [In],dwbuffercoord : COORD [In],lpwriteregion : SMALL_RECT* [In]
  fun WriteConsoleOutputA(hconsoleoutput : LibC::HANDLE, lpbuffer : CHAR_INFO*, dwbuffersize : COORD, dwbuffercoord : COORD, lpwriteregion : SMALL_RECT*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpbuffer : CHAR_INFO* [In],dwbuffersize : COORD [In],dwbuffercoord : COORD [In],lpwriteregion : SMALL_RECT* [In]
  fun WriteConsoleOutputW(hconsoleoutput : LibC::HANDLE, lpbuffer : CHAR_INFO*, dwbuffersize : COORD, dwbuffercoord : COORD, lpwriteregion : SMALL_RECT*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpbuffer : CHAR_INFO* [In],dwbuffersize : COORD [In],dwbuffercoord : COORD [In],lpreadregion : SMALL_RECT* [In]
  fun ReadConsoleOutputA(hconsoleoutput : LibC::HANDLE, lpbuffer : CHAR_INFO*, dwbuffersize : COORD, dwbuffercoord : COORD, lpreadregion : SMALL_RECT*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],lpbuffer : CHAR_INFO* [In],dwbuffersize : COORD [In],dwbuffercoord : COORD [In],lpreadregion : SMALL_RECT* [In]
  fun ReadConsoleOutputW(hconsoleoutput : LibC::HANDLE, lpbuffer : CHAR_INFO*, dwbuffersize : COORD, dwbuffercoord : COORD, lpreadregion : SMALL_RECT*) : LibC::BOOL

  # Params # lpconsoletitle : UInt8* [In],nsize : UInt32 [In]
  fun GetConsoleTitleA(lpconsoletitle : UInt8*, nsize : UInt32) : UInt32

  # Params # lpconsoletitle : Char* [In],nsize : UInt32 [In]
  fun GetConsoleTitleW(lpconsoletitle : Char*, nsize : UInt32) : UInt32

  # Params # lpconsoletitle : UInt8* [In],nsize : UInt32 [In]
  fun GetConsoleOriginalTitleA(lpconsoletitle : UInt8*, nsize : UInt32) : UInt32

  # Params # lpconsoletitle : Char* [In],nsize : UInt32 [In]
  fun GetConsoleOriginalTitleW(lpconsoletitle : Char*, nsize : UInt32) : UInt32

  # Params # lpconsoletitle : PSTR [In]
  fun SetConsoleTitleA(lpconsoletitle : PSTR) : LibC::BOOL

  # Params # lpconsoletitle : LibC::LPWSTR [In]
  fun SetConsoleTitleW(lpconsoletitle : LibC::LPWSTR) : LibC::BOOL

  # Params # lpnumberofmousebuttons : UInt32* [In]
  fun GetNumberOfConsoleMouseButtons(lpnumberofmousebuttons : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],nfont : UInt32 [In]
  fun GetConsoleFontSize(hconsoleoutput : LibC::HANDLE, nfont : UInt32) : COORD

  # Params # hconsoleoutput : LibC::HANDLE [In],bmaximumwindow : LibC::BOOL [In],lpconsolecurrentfont : CONSOLE_FONT_INFO* [In]
  fun GetCurrentConsoleFont(hconsoleoutput : LibC::HANDLE, bmaximumwindow : LibC::BOOL, lpconsolecurrentfont : CONSOLE_FONT_INFO*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],bmaximumwindow : LibC::BOOL [In],lpconsolecurrentfontex : CONSOLE_FONT_INFOEX* [In]
  fun GetCurrentConsoleFontEx(hconsoleoutput : LibC::HANDLE, bmaximumwindow : LibC::BOOL, lpconsolecurrentfontex : CONSOLE_FONT_INFOEX*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],bmaximumwindow : LibC::BOOL [In],lpconsolecurrentfontex : CONSOLE_FONT_INFOEX* [In]
  fun SetCurrentConsoleFontEx(hconsoleoutput : LibC::HANDLE, bmaximumwindow : LibC::BOOL, lpconsolecurrentfontex : CONSOLE_FONT_INFOEX*) : LibC::BOOL

  # Params # lpconsoleselectioninfo : CONSOLE_SELECTION_INFO* [In]
  fun GetConsoleSelectionInfo(lpconsoleselectioninfo : CONSOLE_SELECTION_INFO*) : LibC::BOOL

  # Params # lpconsolehistoryinfo : CONSOLE_HISTORY_INFO* [In]
  fun GetConsoleHistoryInfo(lpconsolehistoryinfo : CONSOLE_HISTORY_INFO*) : LibC::BOOL

  # Params # lpconsolehistoryinfo : CONSOLE_HISTORY_INFO* [In]
  fun SetConsoleHistoryInfo(lpconsolehistoryinfo : CONSOLE_HISTORY_INFO*) : LibC::BOOL

  # Params # lpmodeflags : UInt32* [In]
  fun GetConsoleDisplayMode(lpmodeflags : UInt32*) : LibC::BOOL

  # Params # hconsoleoutput : LibC::HANDLE [In],dwflags : UInt32 [In],lpnewscreenbufferdimensions : COORD* [In]
  fun SetConsoleDisplayMode(hconsoleoutput : LibC::HANDLE, dwflags : UInt32, lpnewscreenbufferdimensions : COORD*) : LibC::BOOL

  # Params # 
  fun GetConsoleWindow : HANDLE

  # Params # source : PSTR [In],target : PSTR [In],exename : PSTR [In]
  fun AddConsoleAliasA(source : PSTR, target : PSTR, exename : PSTR) : LibC::BOOL

  # Params # source : LibC::LPWSTR [In],target : LibC::LPWSTR [In],exename : LibC::LPWSTR [In]
  fun AddConsoleAliasW(source : LibC::LPWSTR, target : LibC::LPWSTR, exename : LibC::LPWSTR) : LibC::BOOL

  # Params # source : PSTR [In],targetbuffer : UInt8* [In],targetbufferlength : UInt32 [In],exename : PSTR [In]
  fun GetConsoleAliasA(source : PSTR, targetbuffer : UInt8*, targetbufferlength : UInt32, exename : PSTR) : UInt32

  # Params # source : LibC::LPWSTR [In],targetbuffer : Char* [In],targetbufferlength : UInt32 [In],exename : LibC::LPWSTR [In]
  fun GetConsoleAliasW(source : LibC::LPWSTR, targetbuffer : Char*, targetbufferlength : UInt32, exename : LibC::LPWSTR) : UInt32

  # Params # exename : PSTR [In]
  fun GetConsoleAliasesLengthA(exename : PSTR) : UInt32

  # Params # exename : LibC::LPWSTR [In]
  fun GetConsoleAliasesLengthW(exename : LibC::LPWSTR) : UInt32

  # Params # 
  fun GetConsoleAliasExesLengthA : UInt32

  # Params # 
  fun GetConsoleAliasExesLengthW : UInt32

  # Params # aliasbuffer : UInt8* [In],aliasbufferlength : UInt32 [In],exename : PSTR [In]
  fun GetConsoleAliasesA(aliasbuffer : UInt8*, aliasbufferlength : UInt32, exename : PSTR) : UInt32

  # Params # aliasbuffer : Char* [In],aliasbufferlength : UInt32 [In],exename : LibC::LPWSTR [In]
  fun GetConsoleAliasesW(aliasbuffer : Char*, aliasbufferlength : UInt32, exename : LibC::LPWSTR) : UInt32

  # Params # exenamebuffer : UInt8* [In],exenamebufferlength : UInt32 [In]
  fun GetConsoleAliasExesA(exenamebuffer : UInt8*, exenamebufferlength : UInt32) : UInt32

  # Params # exenamebuffer : Char* [In],exenamebufferlength : UInt32 [In]
  fun GetConsoleAliasExesW(exenamebuffer : Char*, exenamebufferlength : UInt32) : UInt32

  # Params # exename : PSTR [In]
  fun ExpungeConsoleCommandHistoryA(exename : PSTR) : Void

  # Params # exename : LibC::LPWSTR [In]
  fun ExpungeConsoleCommandHistoryW(exename : LibC::LPWSTR) : Void

  # Params # number : UInt32 [In],exename : PSTR [In]
  fun SetConsoleNumberOfCommandsA(number : UInt32, exename : PSTR) : LibC::BOOL

  # Params # number : UInt32 [In],exename : LibC::LPWSTR [In]
  fun SetConsoleNumberOfCommandsW(number : UInt32, exename : LibC::LPWSTR) : LibC::BOOL

  # Params # exename : PSTR [In]
  fun GetConsoleCommandHistoryLengthA(exename : PSTR) : UInt32

  # Params # exename : LibC::LPWSTR [In]
  fun GetConsoleCommandHistoryLengthW(exename : LibC::LPWSTR) : UInt32

  # Params # commands : PSTR [In],commandbufferlength : UInt32 [In],exename : PSTR [In]
  fun GetConsoleCommandHistoryA(commands : PSTR, commandbufferlength : UInt32, exename : PSTR) : UInt32

  # Params # commands : LibC::LPWSTR [In],commandbufferlength : UInt32 [In],exename : LibC::LPWSTR [In]
  fun GetConsoleCommandHistoryW(commands : LibC::LPWSTR, commandbufferlength : UInt32, exename : LibC::LPWSTR) : UInt32

  # Params # lpdwprocesslist : UInt32* [In],dwprocesscount : UInt32 [In]
  fun GetConsoleProcessList(lpdwprocesslist : UInt32*, dwprocesscount : UInt32) : UInt32

  # Params # nstdhandle : STD_HANDLE [In]
  # Commented out because function is part of Lib C
  #fun GetStdHandle(nstdhandle : STD_HANDLE) : LibC::HANDLE

  # Params # nstdhandle : STD_HANDLE [In],hhandle : LibC::HANDLE [In]
  fun SetStdHandle(nstdhandle : STD_HANDLE, hhandle : LibC::HANDLE) : LibC::BOOL

  # Params # nstdhandle : STD_HANDLE [In],hhandle : LibC::HANDLE [In],phprevvalue : LibC::HANDLE* [In]
  fun SetStdHandleEx(nstdhandle : STD_HANDLE, hhandle : LibC::HANDLE, phprevvalue : LibC::HANDLE*) : LibC::BOOL
end