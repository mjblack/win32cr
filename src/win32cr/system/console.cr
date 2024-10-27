require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::Console
  alias HPCON = LibC::IntPtrT
  alias PHANDLER_ROUTINE = Proc(UInt32, Win32cr::Foundation::BOOL)*

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

  @[Extern]
  record COORD,
    x : Int16,
    y : Int16

  @[Extern]
  record SMALL_RECT,
    left : Int16,
    top : Int16,
    right : Int16,
    bottom : Int16

  @[Extern]
  record KEY_EVENT_RECORD,
    bKeyDown : Win32cr::Foundation::BOOL,
    wRepeatCount : UInt16,
    wVirtualKeyCode : UInt16,
    wVirtualScanCode : UInt16,
    uChar : Uchar_e__union,
    dwControlKeyState : UInt32 do

    # Nested Type Uchar_e__union
    @[Extern(union: true)]
    record Uchar_e__union,
      unicode_char : UInt16,
      ascii_char : Win32cr::Foundation::CHAR

  end

  @[Extern]
  record MOUSE_EVENT_RECORD,
    dwMousePosition : Win32cr::System::Console::COORD,
    dwButtonState : UInt32,
    dwControlKeyState : UInt32,
    dwEventFlags : UInt32

  @[Extern]
  record WINDOW_BUFFER_SIZE_RECORD,
    dwSize : Win32cr::System::Console::COORD

  @[Extern]
  record MENU_EVENT_RECORD,
    dwCommandId : UInt32

  @[Extern]
  record FOCUS_EVENT_RECORD,
    bSetFocus : Win32cr::Foundation::BOOL

  @[Extern]
  record INPUT_RECORD,
    event_type : UInt16,
    event : Event_e__Union do

    # Nested Type Event_e__Union
    @[Extern(union: true)]
    record Event_e__Union,
      key_event : Win32cr::System::Console::KEY_EVENT_RECORD,
      mouse_event : Win32cr::System::Console::MOUSE_EVENT_RECORD,
      window_buffer_size_event : Win32cr::System::Console::WINDOW_BUFFER_SIZE_RECORD,
      menu_event : Win32cr::System::Console::MENU_EVENT_RECORD,
      focus_event : Win32cr::System::Console::FOCUS_EVENT_RECORD

  end

  @[Extern]
  record CHAR_INFO,
    char : Char_e__Union,
    attributes : UInt16 do

    # Nested Type Char_e__Union
    @[Extern(union: true)]
    record Char_e__Union,
      unicode_char : UInt16,
      ascii_char : Win32cr::Foundation::CHAR

  end

  @[Extern]
  record CONSOLE_FONT_INFO,
    nFont : UInt32,
    dwFontSize : Win32cr::System::Console::COORD

  @[Extern]
  record CONSOLE_READCONSOLE_CONTROL,
    nLength : UInt32,
    nInitialChars : UInt32,
    dwCtrlWakeupMask : UInt32,
    dwControlKeyState : UInt32

  @[Extern]
  record CONSOLE_CURSOR_INFO,
    dwSize : UInt32,
    bVisible : Win32cr::Foundation::BOOL

  @[Extern]
  record CONSOLE_SCREEN_BUFFER_INFO,
    dwSize : Win32cr::System::Console::COORD,
    dwCursorPosition : Win32cr::System::Console::COORD,
    wAttributes : UInt16,
    srWindow : Win32cr::System::Console::SMALL_RECT,
    dwMaximumWindowSize : Win32cr::System::Console::COORD

  @[Extern]
  record CONSOLE_SCREEN_BUFFER_INFOEX,
    cbSize : UInt32,
    dwSize : Win32cr::System::Console::COORD,
    dwCursorPosition : Win32cr::System::Console::COORD,
    wAttributes : UInt16,
    srWindow : Win32cr::System::Console::SMALL_RECT,
    dwMaximumWindowSize : Win32cr::System::Console::COORD,
    wPopupAttributes : UInt16,
    bFullscreenSupported : Win32cr::Foundation::BOOL,
    color_table : UInt32[16]

  @[Extern]
  record CONSOLE_FONT_INFOEX,
    cbSize : UInt32,
    nFont : UInt32,
    dwFontSize : Win32cr::System::Console::COORD,
    font_family : UInt32,
    font_weight : UInt32,
    face_name : UInt16[32]

  @[Extern]
  record CONSOLE_SELECTION_INFO,
    dwFlags : UInt32,
    dwSelectionAnchor : Win32cr::System::Console::COORD,
    srSelection : Win32cr::System::Console::SMALL_RECT

  @[Extern]
  record CONSOLE_HISTORY_INFO,
    cbSize : UInt32,
    history_buffer_size : UInt32,
    number_of_history_buffers : UInt32,
    dwFlags : UInt32

  @[Link("kernel32")]
  lib C
    fun AllocConsole : Win32cr::Foundation::BOOL

    fun FreeConsole : Win32cr::Foundation::BOOL

    fun AttachConsole(dwProcessId : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetConsoleCP : UInt32

    # Commented out due to being part of LibC
    #fun GetConsoleOutputCP : UInt32

    # Commented out due to being part of LibC
    #fun GetConsoleMode(hConsoleHandle : Win32cr::Foundation::HANDLE, lpMode : Win32cr::System::Console::CONSOLE_MODE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun SetConsoleMode(hConsoleHandle : Win32cr::Foundation::HANDLE, dwMode : Win32cr::System::Console::CONSOLE_MODE) : Win32cr::Foundation::BOOL

    fun GetNumberOfConsoleInputEvents(hConsoleInput : Win32cr::Foundation::HANDLE, lpNumberOfEvents : UInt32*) : Win32cr::Foundation::BOOL

    fun ReadConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    fun ReadConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    fun PeekConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    fun PeekConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL

    fun ReadConsoleA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun ReadConsoleW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL

    fun WriteConsoleA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    fun WriteConsoleW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun SetConsoleCtrlHandler(handler_routine : Win32cr::System::Console::PHANDLER_ROUTINE, add : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun CreatePseudoConsole(size : Win32cr::System::Console::COORD, hInput : Win32cr::Foundation::HANDLE, hOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, phPC : Win32cr::System::Console::HPCON*) : Win32cr::Foundation::HRESULT

    fun ResizePseudoConsole(hPC : Win32cr::System::Console::HPCON, size : Win32cr::System::Console::COORD) : Win32cr::Foundation::HRESULT

    fun ClosePseudoConsole(hPC : Win32cr::System::Console::HPCON) : Void

    fun FillConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : Win32cr::Foundation::CHAR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun FillConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun FillConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttribute : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun GenerateConsoleCtrlEvent(dwCtrlEvent : UInt32, dwProcessGroupId : UInt32) : Win32cr::Foundation::BOOL

    fun CreateConsoleScreenBuffer(dwDesiredAccess : UInt32, dwShareMode : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwFlags : UInt32, lpScreenBufferData : Void*) : Win32cr::Foundation::HANDLE

    fun SetConsoleActiveScreenBuffer(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun FlushConsoleInputBuffer(hConsoleInput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun SetConsoleCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun SetConsoleOutputCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL

    fun GetConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL

    fun SetConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL

    fun GetConsoleScreenBufferInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfo : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFO*) : Win32cr::Foundation::BOOL

    fun GetConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL

    fun SetConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL

    fun SetConsoleScreenBufferSize(hConsoleOutput : Win32cr::Foundation::HANDLE, dwSize : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL

    fun SetConsoleCursorPosition(hConsoleOutput : Win32cr::Foundation::HANDLE, dwCursorPosition : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL

    fun GetLargestConsoleWindowSize(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::System::Console::COORD

    fun SetConsoleTextAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttributes : UInt16) : Win32cr::Foundation::BOOL

    fun SetConsoleWindowInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, bAbsolute : Win32cr::Foundation::BOOL, lpConsoleWindow : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    fun WriteConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt8*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun WriteConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun WriteConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun ReadConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt8*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL

    fun ReadConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt16*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL

    fun ReadConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsRead : UInt32*) : Win32cr::Foundation::BOOL

    fun WriteConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun WriteConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun ScrollConsoleScreenBufferA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL

    fun ScrollConsoleScreenBufferW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL

    fun WriteConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    fun WriteConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    fun ReadConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    fun ReadConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL

    fun GetConsoleTitleA(lpConsoleTitle : UInt8*, nSize : UInt32) : UInt32

    fun GetConsoleTitleW(lpConsoleTitle : UInt16*, nSize : UInt32) : UInt32

    fun GetConsoleOriginalTitleA(lpConsoleTitle : UInt8*, nSize : UInt32) : UInt32

    fun GetConsoleOriginalTitleW(lpConsoleTitle : UInt16*, nSize : UInt32) : UInt32

    fun SetConsoleTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun SetConsoleTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun GetNumberOfConsoleMouseButtons(lpNumberOfMouseButtons : UInt32*) : Win32cr::Foundation::BOOL

    fun GetConsoleFontSize(hConsoleOutput : Win32cr::Foundation::HANDLE, nFont : UInt32) : Win32cr::System::Console::COORD

    fun GetCurrentConsoleFont(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFont : Win32cr::System::Console::CONSOLE_FONT_INFO*) : Win32cr::Foundation::BOOL

    fun GetCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL

    fun SetCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL

    fun GetConsoleSelectionInfo(lpConsoleSelectionInfo : Win32cr::System::Console::CONSOLE_SELECTION_INFO*) : Win32cr::Foundation::BOOL

    fun GetConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL

    fun SetConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL

    fun GetConsoleDisplayMode(lpModeFlags : UInt32*) : Win32cr::Foundation::BOOL

    fun SetConsoleDisplayMode(hConsoleOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, lpNewScreenBufferDimensions : Win32cr::System::Console::COORD*) : Win32cr::Foundation::BOOL

    fun GetConsoleWindow : Win32cr::Foundation::HWND

    fun AddConsoleAliasA(source : Win32cr::Foundation::PSTR, target : Win32cr::Foundation::PSTR, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun AddConsoleAliasW(source : Win32cr::Foundation::PWSTR, target : Win32cr::Foundation::PWSTR, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun GetConsoleAliasA(source : Win32cr::Foundation::PSTR, target_buffer : UInt8*, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    fun GetConsoleAliasW(source : Win32cr::Foundation::PWSTR, target_buffer : UInt16*, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    fun GetConsoleAliasesLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32

    fun GetConsoleAliasesLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32

    fun GetConsoleAliasExesLengthA : UInt32

    fun GetConsoleAliasExesLengthW : UInt32

    fun GetConsoleAliasesA(alias_buffer : UInt8*, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    fun GetConsoleAliasesW(alias_buffer : UInt16*, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    fun GetConsoleAliasExesA(exe_name_buffer : UInt8*, exe_name_buffer_length : UInt32) : UInt32

    fun GetConsoleAliasExesW(exe_name_buffer : UInt16*, exe_name_buffer_length : UInt32) : UInt32

    fun ExpungeConsoleCommandHistoryA(exe_name : Win32cr::Foundation::PSTR) : Void

    fun ExpungeConsoleCommandHistoryW(exe_name : Win32cr::Foundation::PWSTR) : Void

    fun SetConsoleNumberOfCommandsA(number : UInt32, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun SetConsoleNumberOfCommandsW(number : UInt32, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun GetConsoleCommandHistoryLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32

    fun GetConsoleCommandHistoryLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32

    fun GetConsoleCommandHistoryA(commands : Win32cr::Foundation::PSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    fun GetConsoleCommandHistoryW(commands : Win32cr::Foundation::PWSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    fun GetConsoleProcessList(lpdwProcessList : UInt32*, dwProcessCount : UInt32) : UInt32

    # Commented out due to being part of LibC
    #fun GetStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE) : Win32cr::Foundation::HANDLE

    fun SetStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun SetStdHandleEx(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE, phPrevValue : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

  end
end