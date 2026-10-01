require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../security.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::System::Console
  extend self
  alias HPCON = LibC::IntPtrT
  alias PHANDLER_ROUTINE = Proc(UInt32, Win32cr::Foundation::BOOL)

  CONSOLE_TEXTMODE_BUFFER = 1_u32
  CONSOLE_SELECTION_INVERTED = 16_u32
  VDM_HIDE_WINDOW = 1_u32
  VDM_IS_ICONIC = 2_u32
  VDM_CLIENT_RECT = 3_u32
  VDM_CLIENT_TO_SCREEN = 4_u32
  VDM_SCREEN_TO_CLIENT = 5_u32
  VDM_IS_HIDDEN = 6_u32
  VDM_FULLSCREEN_NOPAINT = 7_u32
  VDM_SET_VIDEO_MODE = 8_u32
  CONSOLE_UNREGISTER_VDM = 0_u32
  CONSOLE_REGISTER_VDM = 1_u32
  CONSOLE_REGISTER_WOW = 2_u32
  CONSOLE_NOSHORTCUTKEY = 0_u32
  CONSOLE_ALTTAB = 1_u32
  CONSOLE_ALTESC = 2_u32
  CONSOLE_ALTSPACE = 4_u32
  CONSOLE_ALTENTER = 8_u32
  CONSOLE_ALTPRTSC = 16_u32
  CONSOLE_PRTSC = 32_u32
  CONSOLE_CTRLESC = 64_u32
  CONSOLE_MODIFIER_SHIFT = 3_u32
  CONSOLE_MODIFIER_CONTROL = 4_u32
  CONSOLE_MODIFIER_ALT = 8_u32
  CHAR_TYPE_SBCS = 0_u32
  CHAR_TYPE_LEADING = 2_u32
  CHAR_TYPE_TRAILING = 3_u32
  CONSOLE_HANDLE_SIGNATURE = 3_u32
  CONSOLE_HANDLE_NEVERSET = 268435456_u32
  CONSOLE_INPUT_STRING = "CONIN$"
  CONSOLE_OUTPUT_STRING = "CONOUT$"
  CONSOLE_GENERIC = "CON"
  PID_CONSOLE_FORCEV2 = 1_u32
  PID_CONSOLE_WRAPTEXT = 2_u32
  PID_CONSOLE_FILTERONPASTE = 3_u32
  PID_CONSOLE_CTRLKEYSDISABLED = 4_u32
  PID_CONSOLE_LINESELECTION = 5_u32
  PID_CONSOLE_WINDOWTRANSPARENCY = 6_u32
  PID_CONSOLE_WINDOWMAXIMIZED = 7_u32
  PID_CONSOLE_CURSOR_TYPE = 8_u32
  PID_CONSOLE_CURSOR_COLOR = 9_u32
  PID_CONSOLE_INTERCEPT_COPY_PASTE = 10_u32
  PID_CONSOLE_DEFAULTFOREGROUND = 11_u32
  PID_CONSOLE_DEFAULTBACKGROUND = 12_u32
  PID_CONSOLE_TERMINALSCROLLING = 13_u32
  ATTACH_PARENT_PROCESS = 4294967295_u32
  CTRL_C_EVENT = 0_u32
  CTRL_BREAK_EVENT = 1_u32
  CTRL_CLOSE_EVENT = 2_u32
  CTRL_LOGOFF_EVENT = 5_u32
  CTRL_SHUTDOWN_EVENT = 6_u32
  PSEUDOCONSOLE_INHERIT_CURSOR = 1_u32
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

  @[Flags]
  enum CONSOLE_MODE : UInt32
    ENABLE_PROCESSED_INPUT = 1_u32
    ENABLE_LINE_INPUT = 2_u32
    ENABLE_ECHO_INPUT = 4_u32
    ENABLE_WINDOW_INPUT = 8_u32
    ENABLE_MOUSE_INPUT = 16_u32
    ENABLE_INSERT_MODE = 32_u32
    ENABLE_QUICK_EDIT_MODE = 64_u32
    ENABLE_EXTENDED_FLAGS = 128_u32
    ENABLE_AUTO_POSITION = 256_u32
    ENABLE_VIRTUAL_TERMINAL_INPUT = 512_u32
    ENABLE_PROCESSED_OUTPUT = 1_u32
    ENABLE_WRAP_AT_EOL_OUTPUT = 2_u32
    ENABLE_VIRTUAL_TERMINAL_PROCESSING = 4_u32
    DISABLE_NEWLINE_AUTO_RETURN = 8_u32
    ENABLE_LVB_GRID_WORLDWIDE = 16_u32
  end
  enum STD_HANDLE : UInt32
    STD_INPUT_HANDLE = 4294967286_u32
    STD_OUTPUT_HANDLE = 4294967285_u32
    STD_ERROR_HANDLE = 4294967284_u32
  end
  @[Flags]
  enum CONSOLE_CHARACTER_ATTRIBUTES : UInt16
    FOREGROUND_BLUE = 1_u16
    FOREGROUND_GREEN = 2_u16
    FOREGROUND_RED = 4_u16
    FOREGROUND_INTENSITY = 8_u16
    BACKGROUND_BLUE = 16_u16
    BACKGROUND_GREEN = 32_u16
    BACKGROUND_RED = 64_u16
    BACKGROUND_INTENSITY = 128_u16
    COMMON_LVB_LEADING_BYTE = 256_u16
    COMMON_LVB_TRAILING_BYTE = 512_u16
    COMMON_LVB_GRID_HORIZONTAL = 1024_u16
    COMMON_LVB_GRID_LVERTICAL = 2048_u16
    COMMON_LVB_GRID_RVERTICAL = 4096_u16
    COMMON_LVB_REVERSE_VIDEO = 16384_u16
    COMMON_LVB_UNDERSCORE = 32768_u16
    COMMON_LVB_SBCSDBCS = 768_u16
  end
  enum ALLOC_CONSOLE_MODE
    ALLOC_CONSOLE_MODE_DEFAULT = 0_i32
    ALLOC_CONSOLE_MODE_NEW_WINDOW = 1_i32
    ALLOC_CONSOLE_MODE_NO_WINDOW = 2_i32
  end
  enum ALLOC_CONSOLE_RESULT
    ALLOC_CONSOLE_RESULT_NO_CONSOLE = 0_i32
    ALLOC_CONSOLE_RESULT_NEW_CONSOLE = 1_i32
    ALLOC_CONSOLE_RESULT_EXISTING_CONSOLE = 2_i32
  end
  enum CONSOLECONTROL
    Reserved1 = 0_i32
    ConsoleNotifyConsoleApplication = 1_i32
    Reserved2 = 2_i32
    ConsoleSetCaretInfo = 3_i32
    Reserved3 = 4_i32
    ConsoleSetForeground = 5_i32
    ConsoleSetWindowOwner = 6_i32
    ConsoleEndTask = 7_i32
  end

  @[Extern]
  struct COORD
    property x : Int16
    property y : Int16
    def initialize(@x : Int16, @y : Int16)
    end
  end

  @[Extern]
  struct SMALL_RECT
    property left : Int16
    property top : Int16
    property right : Int16
    property bottom : Int16
    def initialize(@left : Int16, @top : Int16, @right : Int16, @bottom : Int16)
    end
  end

  @[Extern]
  struct KEY_EVENT_RECORD
    property bKeyDown : Win32cr::Foundation::BOOL
    property wRepeatCount : UInt16
    property wVirtualKeyCode : UInt16
    property wVirtualScanCode : UInt16
    property uChar : Uchar_e__union_
    property dwControlKeyState : UInt32

    # Nested Type Uchar_e__union_
    @[Extern(union: true)]
    struct Uchar_e__union_
    property unicode_char : UInt16
    property ascii_char : Win32cr::Foundation::CHAR
    def initialize(@unicode_char : UInt16, @ascii_char : Win32cr::Foundation::CHAR)
    end
    end

    def initialize(@bKeyDown : Win32cr::Foundation::BOOL, @wRepeatCount : UInt16, @wVirtualKeyCode : UInt16, @wVirtualScanCode : UInt16, @uChar : Uchar_e__union_, @dwControlKeyState : UInt32)
    end
  end

  @[Extern]
  struct MOUSE_EVENT_RECORD
    property dwMousePosition : Win32cr::System::Console::COORD
    property dwButtonState : UInt32
    property dwControlKeyState : UInt32
    property dwEventFlags : UInt32
    def initialize(@dwMousePosition : Win32cr::System::Console::COORD, @dwButtonState : UInt32, @dwControlKeyState : UInt32, @dwEventFlags : UInt32)
    end
  end

  @[Extern]
  struct WINDOW_BUFFER_SIZE_RECORD
    property dwSize : Win32cr::System::Console::COORD
    def initialize(@dwSize : Win32cr::System::Console::COORD)
    end
  end

  @[Extern]
  struct MENU_EVENT_RECORD
    property dwCommandId : UInt32
    def initialize(@dwCommandId : UInt32)
    end
  end

  @[Extern]
  struct FOCUS_EVENT_RECORD
    property bSetFocus : Win32cr::Foundation::BOOL
    def initialize(@bSetFocus : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct INPUT_RECORD
    property event_type : UInt16
    property event : Event_e__Union_

    # Nested Type Event_e__Union_
    @[Extern(union: true)]
    struct Event_e__Union_
    property key_event : Win32cr::System::Console::KEY_EVENT_RECORD
    property mouse_event : Win32cr::System::Console::MOUSE_EVENT_RECORD
    property window_buffer_size_event : Win32cr::System::Console::WINDOW_BUFFER_SIZE_RECORD
    property menu_event : Win32cr::System::Console::MENU_EVENT_RECORD
    property focus_event : Win32cr::System::Console::FOCUS_EVENT_RECORD
    def initialize(@key_event : Win32cr::System::Console::KEY_EVENT_RECORD, @mouse_event : Win32cr::System::Console::MOUSE_EVENT_RECORD, @window_buffer_size_event : Win32cr::System::Console::WINDOW_BUFFER_SIZE_RECORD, @menu_event : Win32cr::System::Console::MENU_EVENT_RECORD, @focus_event : Win32cr::System::Console::FOCUS_EVENT_RECORD)
    end
    end

    def initialize(@event_type : UInt16, @event : Event_e__Union_)
    end
  end

  @[Extern]
  struct CHAR_INFO
    property char : Char_e__Union_
    property attributes : UInt16

    # Nested Type Char_e__Union_
    @[Extern(union: true)]
    struct Char_e__Union_
    property unicode_char : UInt16
    property ascii_char : Win32cr::Foundation::CHAR
    def initialize(@unicode_char : UInt16, @ascii_char : Win32cr::Foundation::CHAR)
    end
    end

    def initialize(@char : Char_e__Union_, @attributes : UInt16)
    end
  end

  @[Extern]
  struct CONSOLE_FONT_INFO
    property nFont : UInt32
    property dwFontSize : Win32cr::System::Console::COORD
    def initialize(@nFont : UInt32, @dwFontSize : Win32cr::System::Console::COORD)
    end
  end

  @[Extern]
  struct ALLOC_CONSOLE_OPTIONS
    property mode : Win32cr::System::Console::ALLOC_CONSOLE_MODE
    property useShowWindow : Win32cr::Foundation::BOOL
    property showWindow : UInt16
    def initialize(@mode : Win32cr::System::Console::ALLOC_CONSOLE_MODE, @useShowWindow : Win32cr::Foundation::BOOL, @showWindow : UInt16)
    end
  end

  @[Extern]
  struct CONSOLE_READCONSOLE_CONTROL
    property nLength : UInt32
    property nInitialChars : UInt32
    property dwCtrlWakeupMask : UInt32
    property dwControlKeyState : UInt32
    def initialize(@nLength : UInt32, @nInitialChars : UInt32, @dwCtrlWakeupMask : UInt32, @dwControlKeyState : UInt32)
    end
  end

  @[Extern]
  struct CONSOLE_CURSOR_INFO
    property dwSize : UInt32
    property bVisible : Win32cr::Foundation::BOOL
    def initialize(@dwSize : UInt32, @bVisible : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct CONSOLE_SCREEN_BUFFER_INFO
    property dwSize : Win32cr::System::Console::COORD
    property dwCursorPosition : Win32cr::System::Console::COORD
    property wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES
    property srWindow : Win32cr::System::Console::SMALL_RECT
    property dwMaximumWindowSize : Win32cr::System::Console::COORD
    def initialize(@dwSize : Win32cr::System::Console::COORD, @dwCursorPosition : Win32cr::System::Console::COORD, @wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES, @srWindow : Win32cr::System::Console::SMALL_RECT, @dwMaximumWindowSize : Win32cr::System::Console::COORD)
    end
  end

  @[Extern]
  struct CONSOLE_SCREEN_BUFFER_INFOEX
    property cbSize : UInt32
    property dwSize : Win32cr::System::Console::COORD
    property dwCursorPosition : Win32cr::System::Console::COORD
    property wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES
    property srWindow : Win32cr::System::Console::SMALL_RECT
    property dwMaximumWindowSize : Win32cr::System::Console::COORD
    property wPopupAttributes : UInt16
    property bFullscreenSupported : Win32cr::Foundation::BOOL
    property color_table : Win32cr::Foundation::COLORREF[16]
    def initialize(@cbSize : UInt32, @dwSize : Win32cr::System::Console::COORD, @dwCursorPosition : Win32cr::System::Console::COORD, @wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES, @srWindow : Win32cr::System::Console::SMALL_RECT, @dwMaximumWindowSize : Win32cr::System::Console::COORD, @wPopupAttributes : UInt16, @bFullscreenSupported : Win32cr::Foundation::BOOL, @color_table : Win32cr::Foundation::COLORREF[16])
    end
  end

  @[Extern]
  struct CONSOLE_FONT_INFOEX
    property cbSize : UInt32
    property nFont : UInt32
    property dwFontSize : Win32cr::System::Console::COORD
    property font_family : UInt32
    property font_weight : UInt32
    property face_name : UInt16[32]
    def initialize(@cbSize : UInt32, @nFont : UInt32, @dwFontSize : Win32cr::System::Console::COORD, @font_family : UInt32, @font_weight : UInt32, @face_name : UInt16[32])
    end
  end

  @[Extern]
  struct CONSOLE_SELECTION_INFO
    property dwFlags : UInt32
    property dwSelectionAnchor : Win32cr::System::Console::COORD
    property srSelection : Win32cr::System::Console::SMALL_RECT
    def initialize(@dwFlags : UInt32, @dwSelectionAnchor : Win32cr::System::Console::COORD, @srSelection : Win32cr::System::Console::SMALL_RECT)
    end
  end

  @[Extern]
  struct CONSOLE_HISTORY_INFO
    property cbSize : UInt32
    property history_buffer_size : UInt32
    property number_of_history_buffers : UInt32
    property dwFlags : UInt32
    def initialize(@cbSize : UInt32, @history_buffer_size : UInt32, @number_of_history_buffers : UInt32, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct CONSOLE_GRAPHICS_BUFFER_INFO
    property dwBitMapInfoLength : UInt32
    property lpBitMapInfo : Win32cr::Graphics::Gdi::BITMAPINFO*
    property dwUsage : UInt32
    property hMutex : Win32cr::Foundation::HANDLE
    property lpBitMap : Void*
    def initialize(@dwBitMapInfoLength : UInt32, @lpBitMapInfo : Win32cr::Graphics::Gdi::BITMAPINFO*, @dwUsage : UInt32, @hMutex : Win32cr::Foundation::HANDLE, @lpBitMap : Void*)
    end
  end

  @[Extern]
  struct APPKEY
    property modifier : UInt16
    property scan_code : UInt16
    def initialize(@modifier : UInt16, @scan_code : UInt16)
    end
  end

  @[Extern]
  struct ExtKeySubst
    property wMod : UInt16
    property wVirKey : UInt16
    property wUnicodeChar : UInt16
    def initialize(@wMod : UInt16, @wVirKey : UInt16, @wUnicodeChar : UInt16)
    end
  end

  @[Extern]
  struct ExtKeyDef
    property keys : Win32cr::System::Console::ExtKeySubst[3]
    def initialize(@keys : Win32cr::System::Console::ExtKeySubst[3])
    end
  end

  @[Extern]
  struct ExtKeyDefBuf
    property dwVersion : UInt32
    property dwCheckSum : UInt32
    property table : Win32cr::System::Console::ExtKeyDef[26]
    def initialize(@dwVersion : UInt32, @dwCheckSum : UInt32, @table : Win32cr::System::Console::ExtKeyDef[26])
    end
  end

  @[Extern]
  struct CONSOLEENDTASK
    property process_id : Win32cr::Foundation::HANDLE
    property hwnd : Win32cr::Foundation::HWND
    property console_event_code : UInt32
    property console_flags : UInt32
    def initialize(@process_id : Win32cr::Foundation::HANDLE, @hwnd : Win32cr::Foundation::HWND, @console_event_code : UInt32, @console_flags : UInt32)
    end
  end

  @[Extern]
  struct CONSOLEWINDOWOWNER
    property hwnd : Win32cr::Foundation::HWND
    property process_id : UInt32
    property thread_id : UInt32
    def initialize(@hwnd : Win32cr::Foundation::HWND, @process_id : UInt32, @thread_id : UInt32)
    end
  end

  @[Extern]
  struct CONSOLESETFOREGROUND
    property hProcess : Win32cr::Foundation::HANDLE
    property bForeground : Win32cr::Foundation::BOOL
    def initialize(@hProcess : Win32cr::Foundation::HANDLE, @bForeground : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct CONSOLE_PROCESS_INFO
    property dwProcessID : UInt32
    property dwFlags : UInt32
    def initialize(@dwProcessID : UInt32, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct CONSOLE_CARET_INFO
    property hwnd : Win32cr::Foundation::HWND
    property rc : Win32cr::Foundation::RECT
    def initialize(@hwnd : Win32cr::Foundation::HWND, @rc : Win32cr::Foundation::RECT)
    end
  end

  def allocConsole : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.AllocConsole
    {% end %}
  end

  def allocConsoleWithOptions(options : Win32cr::System::Console::ALLOC_CONSOLE_OPTIONS*, result : Win32cr::System::Console::ALLOC_CONSOLE_RESULT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.AllocConsoleWithOptions(options, result)
    {% end %}
  end

  def freeConsole : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.FreeConsole
    {% end %}
  end

  def attachConsole(dwProcessId : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.AttachConsole(dwProcessId)
    {% end %}
  end

  #def getConsoleCP : UInt32
    #C.GetConsoleCP
  #end

  #def getConsoleOutputCP : UInt32
    #C.GetConsoleOutputCP
  #end

  #def getConsoleMode(hConsoleHandle : Win32cr::Foundation::HANDLE, lpMode : Win32cr::System::Console::CONSOLE_MODE*) : Win32cr::Foundation::BOOL
    #C.GetConsoleMode(hConsoleHandle, lpMode)
  #end

  #def setConsoleMode(hConsoleHandle : Win32cr::Foundation::HANDLE, dwMode : Win32cr::System::Console::CONSOLE_MODE) : Win32cr::Foundation::BOOL
    #C.SetConsoleMode(hConsoleHandle, dwMode)
  #end

  def getNumberOfConsoleInputEvents(hConsoleInput : Win32cr::Foundation::HANDLE, lpNumberOfEvents : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetNumberOfConsoleInputEvents(hConsoleInput, lpNumberOfEvents)
    {% end %}
  end

  def readConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
    {% end %}
  end

  def readConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
    {% end %}
  end

  def peekConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.PeekConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
    {% end %}
  end

  def peekConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.PeekConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
    {% end %}
  end

  def readConsoleA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleA(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl)
    {% end %}
  end

  #def readConsoleW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL
    #C.ReadConsoleW(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl)
  #end

  def writeConsoleA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::Foundation::PSTR, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleA(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten, lpReserved)
    {% end %}
  end

  def writeConsoleW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::Foundation::PWSTR, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleW(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten, lpReserved)
    {% end %}
  end

  #def setConsoleCtrlHandler(handler_routine : Win32cr::System::Console::PHANDLER_ROUTINE, add : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    #C.SetConsoleCtrlHandler(handler_routine, add)
  #end

  def createPseudoConsole(size : Win32cr::System::Console::COORD, hInput : Win32cr::Foundation::HANDLE, hOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, phPC : Win32cr::System::Console::HPCON*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CreatePseudoConsole(size, hInput, hOutput, dwFlags, phPC)
    {% end %}
  end

  def resizePseudoConsole(hPC : Win32cr::System::Console::HPCON, size : Win32cr::System::Console::COORD) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ResizePseudoConsole(hPC, size)
    {% end %}
  end

  def closePseudoConsole(hPC : Win32cr::System::Console::HPCON) : Void
    {% if !flag?(:docs) %}
    C.ClosePseudoConsole(hPC)
    {% end %}
  end

  def releasePseudoConsole(hPC : Win32cr::System::Console::HPCON) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReleasePseudoConsole(hPC)
    {% end %}
  end

  def fillConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : Win32cr::Foundation::CHAR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.FillConsoleOutputCharacterA(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
    {% end %}
  end

  def fillConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.FillConsoleOutputCharacterW(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
    {% end %}
  end

  def fillConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttribute : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.FillConsoleOutputAttribute(hConsoleOutput, wAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten)
    {% end %}
  end

  def generateConsoleCtrlEvent(dwCtrlEvent : UInt32, dwProcessGroupId : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GenerateConsoleCtrlEvent(dwCtrlEvent, dwProcessGroupId)
    {% end %}
  end

  def createConsoleScreenBuffer(dwDesiredAccess : UInt32, dwShareMode : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwFlags : UInt32, lpScreenBufferData : Void*) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.CreateConsoleScreenBuffer(dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlags, lpScreenBufferData)
    {% end %}
  end

  def setConsoleActiveScreenBuffer(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleActiveScreenBuffer(hConsoleOutput)
    {% end %}
  end

  def flushConsoleInputBuffer(hConsoleInput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.FlushConsoleInputBuffer(hConsoleInput)
    {% end %}
  end

  #def setConsoleCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL
    #C.SetConsoleCP(wCodePageID)
  #end

  #def setConsoleOutputCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL
    #C.SetConsoleOutputCP(wCodePageID)
  #end

  def getConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo)
    {% end %}
  end

  def setConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo)
    {% end %}
  end

  def getConsoleScreenBufferInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfo : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleScreenBufferInfo(hConsoleOutput, lpConsoleScreenBufferInfo)
    {% end %}
  end

  def getConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx)
    {% end %}
  end

  def setConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx)
    {% end %}
  end

  def setConsoleScreenBufferSize(hConsoleOutput : Win32cr::Foundation::HANDLE, dwSize : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleScreenBufferSize(hConsoleOutput, dwSize)
    {% end %}
  end

  def setConsoleCursorPosition(hConsoleOutput : Win32cr::Foundation::HANDLE, dwCursorPosition : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleCursorPosition(hConsoleOutput, dwCursorPosition)
    {% end %}
  end

  def getLargestConsoleWindowSize(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::System::Console::COORD
    {% if !flag?(:docs) %}
    C.GetLargestConsoleWindowSize(hConsoleOutput)
    {% end %}
  end

  def setConsoleTextAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleTextAttribute(hConsoleOutput, wAttributes)
    {% end %}
  end

  def setConsoleWindowInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, bAbsolute : Win32cr::Foundation::BOOL, lpConsoleWindow : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleWindowInfo(hConsoleOutput, bAbsolute, lpConsoleWindow)
    {% end %}
  end

  def writeConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PSTR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
    {% end %}
  end

  def writeConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PWSTR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
    {% end %}
  end

  def writeConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten)
    {% end %}
  end

  def readConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PSTR, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead)
    {% end %}
  end

  def readConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PWSTR, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead)
    {% end %}
  end

  def readConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsRead : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwReadCoord, lpNumberOfAttrsRead)
    {% end %}
  end

  def writeConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten)
    {% end %}
  end

  def writeConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten)
    {% end %}
  end

  def scrollConsoleScreenBufferA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ScrollConsoleScreenBufferA(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill)
    {% end %}
  end

  def scrollConsoleScreenBufferW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ScrollConsoleScreenBufferW(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill)
    {% end %}
  end

  def writeConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion)
    {% end %}
  end

  def writeConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion)
    {% end %}
  end

  def readConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion)
    {% end %}
  end

  def readConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion)
    {% end %}
  end

  def getConsoleTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR, nSize : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleTitleA(lpConsoleTitle, nSize)
    {% end %}
  end

  def getConsoleTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR, nSize : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleTitleW(lpConsoleTitle, nSize)
    {% end %}
  end

  def getConsoleOriginalTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR, nSize : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleOriginalTitleA(lpConsoleTitle, nSize)
    {% end %}
  end

  def getConsoleOriginalTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR, nSize : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleOriginalTitleW(lpConsoleTitle, nSize)
    {% end %}
  end

  def setConsoleTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleTitleA(lpConsoleTitle)
    {% end %}
  end

  def setConsoleTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleTitleW(lpConsoleTitle)
    {% end %}
  end

  def getNumberOfConsoleMouseButtons(lpNumberOfMouseButtons : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetNumberOfConsoleMouseButtons(lpNumberOfMouseButtons)
    {% end %}
  end

  def getConsoleFontSize(hConsoleOutput : Win32cr::Foundation::HANDLE, nFont : UInt32) : Win32cr::System::Console::COORD
    {% if !flag?(:docs) %}
    C.GetConsoleFontSize(hConsoleOutput, nFont)
    {% end %}
  end

  def getCurrentConsoleFont(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFont : Win32cr::System::Console::CONSOLE_FONT_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetCurrentConsoleFont(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFont)
    {% end %}
  end

  def getCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx)
    {% end %}
  end

  def setCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx)
    {% end %}
  end

  def getConsoleSelectionInfo(lpConsoleSelectionInfo : Win32cr::System::Console::CONSOLE_SELECTION_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleSelectionInfo(lpConsoleSelectionInfo)
    {% end %}
  end

  def getConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleHistoryInfo(lpConsoleHistoryInfo)
    {% end %}
  end

  def setConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleHistoryInfo(lpConsoleHistoryInfo)
    {% end %}
  end

  def getConsoleDisplayMode(lpModeFlags : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleDisplayMode(lpModeFlags)
    {% end %}
  end

  def setConsoleDisplayMode(hConsoleOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, lpNewScreenBufferDimensions : Win32cr::System::Console::COORD*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleDisplayMode(hConsoleOutput, dwFlags, lpNewScreenBufferDimensions)
    {% end %}
  end

  def getConsoleWindow : Win32cr::Foundation::HWND
    {% if !flag?(:docs) %}
    C.GetConsoleWindow
    {% end %}
  end

  def addConsoleAliasA(source : Win32cr::Foundation::PSTR, target : Win32cr::Foundation::PSTR, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.AddConsoleAliasA(source, target, exe_name)
    {% end %}
  end

  def addConsoleAliasW(source : Win32cr::Foundation::PWSTR, target : Win32cr::Foundation::PWSTR, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.AddConsoleAliasW(source, target, exe_name)
    {% end %}
  end

  def getConsoleAliasA(source : Win32cr::Foundation::PSTR, target_buffer : Win32cr::Foundation::PSTR, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasA(source, target_buffer, target_buffer_length, exe_name)
    {% end %}
  end

  def getConsoleAliasW(source : Win32cr::Foundation::PWSTR, target_buffer : Win32cr::Foundation::PWSTR, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasW(source, target_buffer, target_buffer_length, exe_name)
    {% end %}
  end

  def getConsoleAliasesLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasesLengthA(exe_name)
    {% end %}
  end

  def getConsoleAliasesLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasesLengthW(exe_name)
    {% end %}
  end

  def getConsoleAliasExesLengthA : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasExesLengthA
    {% end %}
  end

  def getConsoleAliasExesLengthW : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasExesLengthW
    {% end %}
  end

  def getConsoleAliasesA(alias_buffer : Win32cr::Foundation::PSTR, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasesA(alias_buffer, alias_buffer_length, exe_name)
    {% end %}
  end

  def getConsoleAliasesW(alias_buffer : Win32cr::Foundation::PWSTR, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasesW(alias_buffer, alias_buffer_length, exe_name)
    {% end %}
  end

  def getConsoleAliasExesA(exe_name_buffer : Win32cr::Foundation::PSTR, exe_name_buffer_length : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasExesA(exe_name_buffer, exe_name_buffer_length)
    {% end %}
  end

  def getConsoleAliasExesW(exe_name_buffer : Win32cr::Foundation::PWSTR, exe_name_buffer_length : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleAliasExesW(exe_name_buffer, exe_name_buffer_length)
    {% end %}
  end

  def expungeConsoleCommandHistoryA(exe_name : Win32cr::Foundation::PSTR) : Void
    {% if !flag?(:docs) %}
    C.ExpungeConsoleCommandHistoryA(exe_name)
    {% end %}
  end

  def expungeConsoleCommandHistoryW(exe_name : Win32cr::Foundation::PWSTR) : Void
    {% if !flag?(:docs) %}
    C.ExpungeConsoleCommandHistoryW(exe_name)
    {% end %}
  end

  def setConsoleNumberOfCommandsA(number : UInt32, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleNumberOfCommandsA(number, exe_name)
    {% end %}
  end

  def setConsoleNumberOfCommandsW(number : UInt32, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleNumberOfCommandsW(number, exe_name)
    {% end %}
  end

  def getConsoleCommandHistoryLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleCommandHistoryLengthA(exe_name)
    {% end %}
  end

  def getConsoleCommandHistoryLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleCommandHistoryLengthW(exe_name)
    {% end %}
  end

  def getConsoleCommandHistoryA(commands : Win32cr::Foundation::PSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleCommandHistoryA(commands, command_buffer_length, exe_name)
    {% end %}
  end

  def getConsoleCommandHistoryW(commands : Win32cr::Foundation::PWSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleCommandHistoryW(commands, command_buffer_length, exe_name)
    {% end %}
  end

  def getConsoleProcessList(lpdwProcessList : UInt32*, dwProcessCount : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleProcessList(lpdwProcessList, dwProcessCount)
    {% end %}
  end

  def getConsoleKeyboardLayoutNameA(pszLayout : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleKeyboardLayoutNameA(pszLayout)
    {% end %}
  end

  def getConsoleKeyboardLayoutNameW(pszLayout : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleKeyboardLayoutNameW(pszLayout)
    {% end %}
  end

  def invalidateConsoleDIBits(hConsoleOutput : Win32cr::Foundation::HANDLE, lpRect : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.InvalidateConsoleDIBits(hConsoleOutput, lpRect)
    {% end %}
  end

  def setLastConsoleEventActive : Void
    {% if !flag?(:docs) %}
    C.SetLastConsoleEventActive
    {% end %}
  end

  def vDMConsoleOperation(iFunction : UInt32, lpData : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.VDMConsoleOperation(iFunction, lpData)
    {% end %}
  end

  def setConsoleIcon(hIcon : Win32cr::UI::WindowsAndMessaging::HICON) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleIcon(hIcon)
    {% end %}
  end

  def setConsoleFont(hConsoleOutput : Win32cr::Foundation::HANDLE, nFont : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleFont(hConsoleOutput, nFont)
    {% end %}
  end

  def getConsoleFontInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, nLength : UInt32, lpConsoleFontInfo : Win32cr::System::Console::CONSOLE_FONT_INFO*) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleFontInfo(hConsoleOutput, bMaximumWindow, nLength, lpConsoleFontInfo)
    {% end %}
  end

  def getNumberOfConsoleFonts : UInt32
    {% if !flag?(:docs) %}
    C.GetNumberOfConsoleFonts
    {% end %}
  end

  def setConsoleCursor(hConsoleOutput : Win32cr::Foundation::HANDLE, hCursor : Win32cr::UI::WindowsAndMessaging::HCURSOR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleCursor(hConsoleOutput, hCursor)
    {% end %}
  end

  def showConsoleCursor(hConsoleOutput : Win32cr::Foundation::HANDLE, bShow : Win32cr::Foundation::BOOL) : Int32
    {% if !flag?(:docs) %}
    C.ShowConsoleCursor(hConsoleOutput, bShow)
    {% end %}
  end

  def consoleMenuControl(hConsoleOutput : Win32cr::Foundation::HANDLE, dwCommandIdLow : UInt32, dwCommandIdHigh : UInt32) : Win32cr::UI::WindowsAndMessaging::HMENU
    {% if !flag?(:docs) %}
    C.ConsoleMenuControl(hConsoleOutput, dwCommandIdLow, dwCommandIdHigh)
    {% end %}
  end

  def setConsolePalette(hConsoleOutput : Win32cr::Foundation::HANDLE, hPalette : Win32cr::Graphics::Gdi::HPALETTE, dwUsage : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsolePalette(hConsoleOutput, hPalette, dwUsage)
    {% end %}
  end

  def registerConsoleVDM(dwRegisterFlags : UInt32, hStartHardwareEvent : Win32cr::Foundation::HANDLE, hEndHardwareEvent : Win32cr::Foundation::HANDLE, hErrorhardwareEvent : Win32cr::Foundation::HANDLE, reserved : UInt32, lpStateLength : UInt32*, lpState : Void**, vdm_buffer_size : Win32cr::System::Console::COORD, lpVDMBuffer : Void**) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.RegisterConsoleVDM(dwRegisterFlags, hStartHardwareEvent, hEndHardwareEvent, hErrorhardwareEvent, reserved, lpStateLength, lpState, vdm_buffer_size, lpVDMBuffer)
    {% end %}
  end

  def getConsoleHardwareState(hConsoleOutput : Win32cr::Foundation::HANDLE, lpResolution : Win32cr::System::Console::COORD*, lpFontSize : Win32cr::System::Console::COORD*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleHardwareState(hConsoleOutput, lpResolution, lpFontSize)
    {% end %}
  end

  def setConsoleHardwareState(hConsoleOutput : Win32cr::Foundation::HANDLE, dwResolution : Win32cr::System::Console::COORD, dwFontSize : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleHardwareState(hConsoleOutput, dwResolution, dwFontSize)
    {% end %}
  end

  def setConsoleKeyShortcuts(bSet : Win32cr::Foundation::BOOL, bReserveKeys : UInt8, lpAppKeys : Win32cr::System::Console::APPKEY*, dwNumAppKeys : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleKeyShortcuts(bSet, bReserveKeys, lpAppKeys, dwNumAppKeys)
    {% end %}
  end

  def setConsoleMenuClose(bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleMenuClose(bEnable)
    {% end %}
  end

  def getConsoleInputExeNameA(nBufferLength : UInt32, lpBuffer : Win32cr::Foundation::PSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleInputExeNameA(nBufferLength, lpBuffer)
    {% end %}
  end

  def getConsoleInputExeNameW(nBufferLength : UInt32, lpBuffer : Win32cr::Foundation::PWSTR) : UInt32
    {% if !flag?(:docs) %}
    C.GetConsoleInputExeNameW(nBufferLength, lpBuffer)
    {% end %}
  end

  def setConsoleInputExeNameA(lpExeName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleInputExeNameA(lpExeName)
    {% end %}
  end

  def setConsoleInputExeNameW(lpExeName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleInputExeNameW(lpExeName)
    {% end %}
  end

  def readConsoleInputExA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*, wFlags : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleInputExA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead, wFlags)
    {% end %}
  end

  def readConsoleInputExW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*, wFlags : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.ReadConsoleInputExW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead, wFlags)
    {% end %}
  end

  def writeConsoleInputVDMA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleInputVDMA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten)
    {% end %}
  end

  def writeConsoleInputVDMW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.WriteConsoleInputVDMW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten)
    {% end %}
  end

  def getConsoleNlsMode(hConsole : Win32cr::Foundation::HANDLE, lpdwNlsMode : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleNlsMode(hConsole, lpdwNlsMode)
    {% end %}
  end

  def setConsoleNlsMode(hConsole : Win32cr::Foundation::HANDLE, fdwNlsMode : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleNlsMode(hConsole, fdwNlsMode)
    {% end %}
  end

  def getConsoleCharType(hConsole : Win32cr::Foundation::HANDLE, coordCheck : Win32cr::System::Console::COORD, pdwType : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleCharType(hConsole, coordCheck, pdwType)
    {% end %}
  end

  def setConsoleLocalEUDC(hConsoleHandle : Win32cr::Foundation::HANDLE, wCodePoint : UInt16, cFontSize : Win32cr::System::Console::COORD, lpSB : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleLocalEUDC(hConsoleHandle, wCodePoint, cFontSize, lpSB)
    {% end %}
  end

  def setConsoleCursorMode(hConsoleHandle : Win32cr::Foundation::HANDLE, blink : Win32cr::Foundation::BOOL, db_enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleCursorMode(hConsoleHandle, blink, db_enable)
    {% end %}
  end

  def getConsoleCursorMode(hConsoleHandle : Win32cr::Foundation::HANDLE, pbBlink : Win32cr::Foundation::BOOL*, pbDBEnable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetConsoleCursorMode(hConsoleHandle, pbBlink, pbDBEnable)
    {% end %}
  end

  def registerConsoleOS2(fOs2Register : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.RegisterConsoleOS2(fOs2Register)
    {% end %}
  end

  def setConsoleOS2OemFormat(fOs2OemFormat : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetConsoleOS2OemFormat(fOs2OemFormat)
    {% end %}
  end

  def registerConsoleIME(hWndConsoleIME : Win32cr::Foundation::HWND, lpdwConsoleThreadId : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.RegisterConsoleIME(hWndConsoleIME, lpdwConsoleThreadId)
    {% end %}
  end

  def unregisterConsoleIME : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.UnregisterConsoleIME
    {% end %}
  end

  def openConsoleW(lpConsoleDevice : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, dwShareMode : UInt32) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.OpenConsoleW(lpConsoleDevice, dwDesiredAccess, bInheritHandle, dwShareMode)
    {% end %}
  end

  def duplicateConsoleHandle(hSourceHandle : Win32cr::Foundation::HANDLE, dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, dwOptions : UInt32) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.DuplicateConsoleHandle(hSourceHandle, dwDesiredAccess, bInheritHandle, dwOptions)
    {% end %}
  end

  def closeConsoleHandle(hConsole : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.CloseConsoleHandle(hConsole)
    {% end %}
  end

  def verifyConsoleIoHandle(hIoHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.VerifyConsoleIoHandle(hIoHandle)
    {% end %}
  end

  def getConsoleInputWaitHandle : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.GetConsoleInputWaitHandle
    {% end %}
  end

  def consoleControl(command : Win32cr::System::Console::CONSOLECONTROL, console_information : Void*, console_information_length : UInt32) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.ConsoleControl(command, console_information, console_information_length)
    {% end %}
  end

  #def getStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE) : Win32cr::Foundation::HANDLE
    #C.GetStdHandle(nStdHandle)
  #end

  def setStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetStdHandle(nStdHandle, hHandle)
    {% end %}
  end

  def setStdHandleEx(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE, phPrevValue : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetStdHandleEx(nStdHandle, hHandle, phPrevValue)
    {% end %}
  end

  @[Link("kernel32")]
  @[Link("user32")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun AllocConsole : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AllocConsoleWithOptions(options : Win32cr::System::Console::ALLOC_CONSOLE_OPTIONS*, result : Win32cr::System::Console::ALLOC_CONSOLE_RESULT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FreeConsole : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AttachConsole(dwProcessId : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetConsoleCP : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetConsoleOutputCP : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetConsoleMode(hConsoleHandle : Win32cr::Foundation::HANDLE, lpMode : Win32cr::System::Console::CONSOLE_MODE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetConsoleMode(hConsoleHandle : Win32cr::Foundation::HANDLE, dwMode : Win32cr::System::Console::CONSOLE_MODE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumberOfConsoleInputEvents(hConsoleInput : Win32cr::Foundation::HANDLE, lpNumberOfEvents : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PeekConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PeekConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun ReadConsoleW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::Foundation::PSTR, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::Foundation::PWSTR, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetConsoleCtrlHandler(handler_routine : Win32cr::System::Console::PHANDLER_ROUTINE, add : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreatePseudoConsole(size : Win32cr::System::Console::COORD, hInput : Win32cr::Foundation::HANDLE, hOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, phPC : Win32cr::System::Console::HPCON*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ResizePseudoConsole(hPC : Win32cr::System::Console::HPCON, size : Win32cr::System::Console::COORD) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ClosePseudoConsole(hPC : Win32cr::System::Console::HPCON) : Void

    # :nodoc:
    fun ReleasePseudoConsole(hPC : Win32cr::System::Console::HPCON) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FillConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : Win32cr::Foundation::CHAR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FillConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FillConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttribute : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GenerateConsoleCtrlEvent(dwCtrlEvent : UInt32, dwProcessGroupId : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateConsoleScreenBuffer(dwDesiredAccess : UInt32, dwShareMode : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwFlags : UInt32, lpScreenBufferData : Void*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun SetConsoleActiveScreenBuffer(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FlushConsoleInputBuffer(hConsoleInput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetConsoleCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetConsoleOutputCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleScreenBufferInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfo : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleScreenBufferSize(hConsoleOutput : Win32cr::Foundation::HANDLE, dwSize : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleCursorPosition(hConsoleOutput : Win32cr::Foundation::HANDLE, dwCursorPosition : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetLargestConsoleWindowSize(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::System::Console::COORD

    # :nodoc:
    fun SetConsoleTextAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleWindowInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, bAbsolute : Win32cr::Foundation::BOOL, lpConsoleWindow : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PSTR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PWSTR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PSTR, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : Win32cr::Foundation::PWSTR, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ScrollConsoleScreenBufferA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ScrollConsoleScreenBufferW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleOriginalTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleOriginalTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR, nSize : UInt32) : UInt32

    # :nodoc:
    fun SetConsoleTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumberOfConsoleMouseButtons(lpNumberOfMouseButtons : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleFontSize(hConsoleOutput : Win32cr::Foundation::HANDLE, nFont : UInt32) : Win32cr::System::Console::COORD

    # :nodoc:
    fun GetCurrentConsoleFont(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFont : Win32cr::System::Console::CONSOLE_FONT_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleSelectionInfo(lpConsoleSelectionInfo : Win32cr::System::Console::CONSOLE_SELECTION_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleDisplayMode(lpModeFlags : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleDisplayMode(hConsoleOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, lpNewScreenBufferDimensions : Win32cr::System::Console::COORD*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleWindow : Win32cr::Foundation::HWND

    # :nodoc:
    fun AddConsoleAliasA(source : Win32cr::Foundation::PSTR, target : Win32cr::Foundation::PSTR, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddConsoleAliasW(source : Win32cr::Foundation::PWSTR, target : Win32cr::Foundation::PWSTR, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleAliasA(source : Win32cr::Foundation::PSTR, target_buffer : Win32cr::Foundation::PSTR, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasW(source : Win32cr::Foundation::PWSTR, target_buffer : Win32cr::Foundation::PWSTR, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasesLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasesLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasExesLengthA : UInt32

    # :nodoc:
    fun GetConsoleAliasExesLengthW : UInt32

    # :nodoc:
    fun GetConsoleAliasesA(alias_buffer : Win32cr::Foundation::PSTR, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasesW(alias_buffer : Win32cr::Foundation::PWSTR, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasExesA(exe_name_buffer : Win32cr::Foundation::PSTR, exe_name_buffer_length : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleAliasExesW(exe_name_buffer : Win32cr::Foundation::PWSTR, exe_name_buffer_length : UInt32) : UInt32

    # :nodoc:
    fun ExpungeConsoleCommandHistoryA(exe_name : Win32cr::Foundation::PSTR) : Void

    # :nodoc:
    fun ExpungeConsoleCommandHistoryW(exe_name : Win32cr::Foundation::PWSTR) : Void

    # :nodoc:
    fun SetConsoleNumberOfCommandsA(number : UInt32, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleNumberOfCommandsW(number : UInt32, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleCommandHistoryLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleCommandHistoryLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleCommandHistoryA(commands : Win32cr::Foundation::PSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleCommandHistoryW(commands : Win32cr::Foundation::PWSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleProcessList(lpdwProcessList : UInt32*, dwProcessCount : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleKeyboardLayoutNameA(pszLayout : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleKeyboardLayoutNameW(pszLayout : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InvalidateConsoleDIBits(hConsoleOutput : Win32cr::Foundation::HANDLE, lpRect : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetLastConsoleEventActive : Void

    # :nodoc:
    fun VDMConsoleOperation(iFunction : UInt32, lpData : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleIcon(hIcon : Win32cr::UI::WindowsAndMessaging::HICON) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleFont(hConsoleOutput : Win32cr::Foundation::HANDLE, nFont : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleFontInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, nLength : UInt32, lpConsoleFontInfo : Win32cr::System::Console::CONSOLE_FONT_INFO*) : UInt32

    # :nodoc:
    fun GetNumberOfConsoleFonts : UInt32

    # :nodoc:
    fun SetConsoleCursor(hConsoleOutput : Win32cr::Foundation::HANDLE, hCursor : Win32cr::UI::WindowsAndMessaging::HCURSOR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ShowConsoleCursor(hConsoleOutput : Win32cr::Foundation::HANDLE, bShow : Win32cr::Foundation::BOOL) : Int32

    # :nodoc:
    fun ConsoleMenuControl(hConsoleOutput : Win32cr::Foundation::HANDLE, dwCommandIdLow : UInt32, dwCommandIdHigh : UInt32) : Win32cr::UI::WindowsAndMessaging::HMENU

    # :nodoc:
    fun SetConsolePalette(hConsoleOutput : Win32cr::Foundation::HANDLE, hPalette : Win32cr::Graphics::Gdi::HPALETTE, dwUsage : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterConsoleVDM(dwRegisterFlags : UInt32, hStartHardwareEvent : Win32cr::Foundation::HANDLE, hEndHardwareEvent : Win32cr::Foundation::HANDLE, hErrorhardwareEvent : Win32cr::Foundation::HANDLE, reserved : UInt32, lpStateLength : UInt32*, lpState : Void**, vdm_buffer_size : Win32cr::System::Console::COORD, lpVDMBuffer : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleHardwareState(hConsoleOutput : Win32cr::Foundation::HANDLE, lpResolution : Win32cr::System::Console::COORD*, lpFontSize : Win32cr::System::Console::COORD*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleHardwareState(hConsoleOutput : Win32cr::Foundation::HANDLE, dwResolution : Win32cr::System::Console::COORD, dwFontSize : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleKeyShortcuts(bSet : Win32cr::Foundation::BOOL, bReserveKeys : UInt8, lpAppKeys : Win32cr::System::Console::APPKEY*, dwNumAppKeys : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleMenuClose(bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleInputExeNameA(nBufferLength : UInt32, lpBuffer : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleInputExeNameW(nBufferLength : UInt32, lpBuffer : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun SetConsoleInputExeNameA(lpExeName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleInputExeNameW(lpExeName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleInputExA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*, wFlags : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleInputExW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*, wFlags : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleInputVDMA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleInputVDMW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleNlsMode(hConsole : Win32cr::Foundation::HANDLE, lpdwNlsMode : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleNlsMode(hConsole : Win32cr::Foundation::HANDLE, fdwNlsMode : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleCharType(hConsole : Win32cr::Foundation::HANDLE, coordCheck : Win32cr::System::Console::COORD, pdwType : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleLocalEUDC(hConsoleHandle : Win32cr::Foundation::HANDLE, wCodePoint : UInt16, cFontSize : Win32cr::System::Console::COORD, lpSB : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleCursorMode(hConsoleHandle : Win32cr::Foundation::HANDLE, blink : Win32cr::Foundation::BOOL, db_enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleCursorMode(hConsoleHandle : Win32cr::Foundation::HANDLE, pbBlink : Win32cr::Foundation::BOOL*, pbDBEnable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterConsoleOS2(fOs2Register : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetConsoleOS2OemFormat(fOs2OemFormat : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterConsoleIME(hWndConsoleIME : Win32cr::Foundation::HWND, lpdwConsoleThreadId : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterConsoleIME : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OpenConsoleW(lpConsoleDevice : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, dwShareMode : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun DuplicateConsoleHandle(hSourceHandle : Win32cr::Foundation::HANDLE, dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, dwOptions : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CloseConsoleHandle(hConsole : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VerifyConsoleIoHandle(hIoHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetConsoleInputWaitHandle : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun ConsoleControl(command : Win32cr::System::Console::CONSOLECONTROL, console_information : Void*, console_information_length : UInt32) : Win32cr::Foundation::NTSTATUS

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun SetStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetStdHandleEx(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE, phPrevValue : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

  end
  {% end %}
end