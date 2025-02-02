require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::Console
  extend self
  alias HPCON = LibC::IntPtrT
  alias PHANDLER_ROUTINE = Proc(UInt32, Win32cr::Foundation::BOOL)

  CONSOLE_TEXTMODE_BUFFER = 1_u32
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
    property color_table : UInt32[16]
    def initialize(@cbSize : UInt32, @dwSize : Win32cr::System::Console::COORD, @dwCursorPosition : Win32cr::System::Console::COORD, @wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES, @srWindow : Win32cr::System::Console::SMALL_RECT, @dwMaximumWindowSize : Win32cr::System::Console::COORD, @wPopupAttributes : UInt16, @bFullscreenSupported : Win32cr::Foundation::BOOL, @color_table : UInt32[16])
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

  def allocConsole : Win32cr::Foundation::BOOL
    C.AllocConsole
  end

  def freeConsole : Win32cr::Foundation::BOOL
    C.FreeConsole
  end

  def attachConsole(dwProcessId : UInt32) : Win32cr::Foundation::BOOL
    C.AttachConsole(dwProcessId)
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
    C.GetNumberOfConsoleInputEvents(hConsoleInput, lpNumberOfEvents)
  end

  def readConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    C.ReadConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
  end

  def readConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    C.ReadConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
  end

  def peekConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    C.PeekConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
  end

  def peekConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsRead : UInt32*) : Win32cr::Foundation::BOOL
    C.PeekConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead)
  end

  def readConsoleA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL
    C.ReadConsoleA(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl)
  end

  #def readConsoleW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToRead : UInt32, lpNumberOfCharsRead : UInt32*, pInputControl : Win32cr::System::Console::CONSOLE_READCONSOLE_CONTROL*) : Win32cr::Foundation::BOOL
    #C.ReadConsoleW(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl)
  #end

  def writeConsoleA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL
    C.WriteConsoleA(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten, lpReserved)
  end

  def writeConsoleW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL
    C.WriteConsoleW(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten, lpReserved)
  end

  #def setConsoleCtrlHandler(handler_routine : Win32cr::System::Console::PHANDLER_ROUTINE, add : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    #C.SetConsoleCtrlHandler(handler_routine, add)
  #end

  def createPseudoConsole(size : Win32cr::System::Console::COORD, hInput : Win32cr::Foundation::HANDLE, hOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, phPC : Win32cr::System::Console::HPCON*) : Win32cr::Foundation::HRESULT
    C.CreatePseudoConsole(size, hInput, hOutput, dwFlags, phPC)
  end

  def resizePseudoConsole(hPC : Win32cr::System::Console::HPCON, size : Win32cr::System::Console::COORD) : Win32cr::Foundation::HRESULT
    C.ResizePseudoConsole(hPC, size)
  end

  def closePseudoConsole(hPC : Win32cr::System::Console::HPCON) : Void
    C.ClosePseudoConsole(hPC)
  end

  def fillConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : Win32cr::Foundation::CHAR, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.FillConsoleOutputCharacterA(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
  end

  def fillConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, cCharacter : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.FillConsoleOutputCharacterW(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
  end

  def fillConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttribute : UInt16, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.FillConsoleOutputAttribute(hConsoleOutput, wAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten)
  end

  def generateConsoleCtrlEvent(dwCtrlEvent : UInt32, dwProcessGroupId : UInt32) : Win32cr::Foundation::BOOL
    C.GenerateConsoleCtrlEvent(dwCtrlEvent, dwProcessGroupId)
  end

  def createConsoleScreenBuffer(dwDesiredAccess : UInt32, dwShareMode : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwFlags : UInt32, lpScreenBufferData : Void*) : Win32cr::Foundation::HANDLE
    C.CreateConsoleScreenBuffer(dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlags, lpScreenBufferData)
  end

  def setConsoleActiveScreenBuffer(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetConsoleActiveScreenBuffer(hConsoleOutput)
  end

  def flushConsoleInputBuffer(hConsoleInput : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.FlushConsoleInputBuffer(hConsoleInput)
  end

  #def setConsoleCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL
    #C.SetConsoleCP(wCodePageID)
  #end

  #def setConsoleOutputCP(wCodePageID : UInt32) : Win32cr::Foundation::BOOL
    #C.SetConsoleOutputCP(wCodePageID)
  #end

  def getConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL
    C.GetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo)
  end

  def setConsoleCursorInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleCursorInfo : Win32cr::System::Console::CONSOLE_CURSOR_INFO*) : Win32cr::Foundation::BOOL
    C.SetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo)
  end

  def getConsoleScreenBufferInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfo : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFO*) : Win32cr::Foundation::BOOL
    C.GetConsoleScreenBufferInfo(hConsoleOutput, lpConsoleScreenBufferInfo)
  end

  def getConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL
    C.GetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx)
  end

  def setConsoleScreenBufferInfoEx(hConsoleOutput : Win32cr::Foundation::HANDLE, lpConsoleScreenBufferInfoEx : Win32cr::System::Console::CONSOLE_SCREEN_BUFFER_INFOEX*) : Win32cr::Foundation::BOOL
    C.SetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx)
  end

  def setConsoleScreenBufferSize(hConsoleOutput : Win32cr::Foundation::HANDLE, dwSize : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL
    C.SetConsoleScreenBufferSize(hConsoleOutput, dwSize)
  end

  def setConsoleCursorPosition(hConsoleOutput : Win32cr::Foundation::HANDLE, dwCursorPosition : Win32cr::System::Console::COORD) : Win32cr::Foundation::BOOL
    C.SetConsoleCursorPosition(hConsoleOutput, dwCursorPosition)
  end

  def getLargestConsoleWindowSize(hConsoleOutput : Win32cr::Foundation::HANDLE) : Win32cr::System::Console::COORD
    C.GetLargestConsoleWindowSize(hConsoleOutput)
  end

  def setConsoleTextAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, wAttributes : Win32cr::System::Console::CONSOLE_CHARACTER_ATTRIBUTES) : Win32cr::Foundation::BOOL
    C.SetConsoleTextAttribute(hConsoleOutput, wAttributes)
  end

  def setConsoleWindowInfo(hConsoleOutput : Win32cr::Foundation::HANDLE, bAbsolute : Win32cr::Foundation::BOOL, lpConsoleWindow : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    C.SetConsoleWindowInfo(hConsoleOutput, bAbsolute, lpConsoleWindow)
  end

  def writeConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt8*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.WriteConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
  end

  def writeConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.WriteConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten)
  end

  def writeConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.WriteConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten)
  end

  def readConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt8*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL
    C.ReadConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead)
  end

  def readConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt16*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL
    C.ReadConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead)
  end

  def readConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsRead : UInt32*) : Win32cr::Foundation::BOOL
    C.ReadConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwReadCoord, lpNumberOfAttrsRead)
  end

  def writeConsoleInputA(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.WriteConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten)
  end

  def writeConsoleInputW(hConsoleInput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::INPUT_RECORD*, nLength : UInt32, lpNumberOfEventsWritten : UInt32*) : Win32cr::Foundation::BOOL
    C.WriteConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten)
  end

  def scrollConsoleScreenBufferA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL
    C.ScrollConsoleScreenBufferA(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill)
  end

  def scrollConsoleScreenBufferW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpScrollRectangle : Win32cr::System::Console::SMALL_RECT*, lpClipRectangle : Win32cr::System::Console::SMALL_RECT*, dwDestinationOrigin : Win32cr::System::Console::COORD, lpFill : Win32cr::System::Console::CHAR_INFO*) : Win32cr::Foundation::BOOL
    C.ScrollConsoleScreenBufferW(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill)
  end

  def writeConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    C.WriteConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion)
  end

  def writeConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpWriteRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    C.WriteConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion)
  end

  def readConsoleOutputA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    C.ReadConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion)
  end

  def readConsoleOutputW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Win32cr::System::Console::CHAR_INFO*, dwBufferSize : Win32cr::System::Console::COORD, dwBufferCoord : Win32cr::System::Console::COORD, lpReadRegion : Win32cr::System::Console::SMALL_RECT*) : Win32cr::Foundation::BOOL
    C.ReadConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion)
  end

  def getConsoleTitleA(lpConsoleTitle : UInt8*, nSize : UInt32) : UInt32
    C.GetConsoleTitleA(lpConsoleTitle, nSize)
  end

  def getConsoleTitleW(lpConsoleTitle : UInt16*, nSize : UInt32) : UInt32
    C.GetConsoleTitleW(lpConsoleTitle, nSize)
  end

  def getConsoleOriginalTitleA(lpConsoleTitle : UInt8*, nSize : UInt32) : UInt32
    C.GetConsoleOriginalTitleA(lpConsoleTitle, nSize)
  end

  def getConsoleOriginalTitleW(lpConsoleTitle : UInt16*, nSize : UInt32) : UInt32
    C.GetConsoleOriginalTitleW(lpConsoleTitle, nSize)
  end

  def setConsoleTitleA(lpConsoleTitle : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.SetConsoleTitleA(lpConsoleTitle)
  end

  def setConsoleTitleW(lpConsoleTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.SetConsoleTitleW(lpConsoleTitle)
  end

  def getNumberOfConsoleMouseButtons(lpNumberOfMouseButtons : UInt32*) : Win32cr::Foundation::BOOL
    C.GetNumberOfConsoleMouseButtons(lpNumberOfMouseButtons)
  end

  def getConsoleFontSize(hConsoleOutput : Win32cr::Foundation::HANDLE, nFont : UInt32) : Win32cr::System::Console::COORD
    C.GetConsoleFontSize(hConsoleOutput, nFont)
  end

  def getCurrentConsoleFont(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFont : Win32cr::System::Console::CONSOLE_FONT_INFO*) : Win32cr::Foundation::BOOL
    C.GetCurrentConsoleFont(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFont)
  end

  def getCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL
    C.GetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx)
  end

  def setCurrentConsoleFontEx(hConsoleOutput : Win32cr::Foundation::HANDLE, bMaximumWindow : Win32cr::Foundation::BOOL, lpConsoleCurrentFontEx : Win32cr::System::Console::CONSOLE_FONT_INFOEX*) : Win32cr::Foundation::BOOL
    C.SetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx)
  end

  def getConsoleSelectionInfo(lpConsoleSelectionInfo : Win32cr::System::Console::CONSOLE_SELECTION_INFO*) : Win32cr::Foundation::BOOL
    C.GetConsoleSelectionInfo(lpConsoleSelectionInfo)
  end

  def getConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL
    C.GetConsoleHistoryInfo(lpConsoleHistoryInfo)
  end

  def setConsoleHistoryInfo(lpConsoleHistoryInfo : Win32cr::System::Console::CONSOLE_HISTORY_INFO*) : Win32cr::Foundation::BOOL
    C.SetConsoleHistoryInfo(lpConsoleHistoryInfo)
  end

  def getConsoleDisplayMode(lpModeFlags : UInt32*) : Win32cr::Foundation::BOOL
    C.GetConsoleDisplayMode(lpModeFlags)
  end

  def setConsoleDisplayMode(hConsoleOutput : Win32cr::Foundation::HANDLE, dwFlags : UInt32, lpNewScreenBufferDimensions : Win32cr::System::Console::COORD*) : Win32cr::Foundation::BOOL
    C.SetConsoleDisplayMode(hConsoleOutput, dwFlags, lpNewScreenBufferDimensions)
  end

  def getConsoleWindow : Win32cr::Foundation::HWND
    C.GetConsoleWindow
  end

  def addConsoleAliasA(source : Win32cr::Foundation::PSTR, target : Win32cr::Foundation::PSTR, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.AddConsoleAliasA(source, target, exe_name)
  end

  def addConsoleAliasW(source : Win32cr::Foundation::PWSTR, target : Win32cr::Foundation::PWSTR, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.AddConsoleAliasW(source, target, exe_name)
  end

  def getConsoleAliasA(source : Win32cr::Foundation::PSTR, target_buffer : UInt8*, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32
    C.GetConsoleAliasA(source, target_buffer, target_buffer_length, exe_name)
  end

  def getConsoleAliasW(source : Win32cr::Foundation::PWSTR, target_buffer : UInt16*, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32
    C.GetConsoleAliasW(source, target_buffer, target_buffer_length, exe_name)
  end

  def getConsoleAliasesLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32
    C.GetConsoleAliasesLengthA(exe_name)
  end

  def getConsoleAliasesLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32
    C.GetConsoleAliasesLengthW(exe_name)
  end

  def getConsoleAliasExesLengthA : UInt32
    C.GetConsoleAliasExesLengthA
  end

  def getConsoleAliasExesLengthW : UInt32
    C.GetConsoleAliasExesLengthW
  end

  def getConsoleAliasesA(alias_buffer : UInt8*, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32
    C.GetConsoleAliasesA(alias_buffer, alias_buffer_length, exe_name)
  end

  def getConsoleAliasesW(alias_buffer : UInt16*, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32
    C.GetConsoleAliasesW(alias_buffer, alias_buffer_length, exe_name)
  end

  def getConsoleAliasExesA(exe_name_buffer : UInt8*, exe_name_buffer_length : UInt32) : UInt32
    C.GetConsoleAliasExesA(exe_name_buffer, exe_name_buffer_length)
  end

  def getConsoleAliasExesW(exe_name_buffer : UInt16*, exe_name_buffer_length : UInt32) : UInt32
    C.GetConsoleAliasExesW(exe_name_buffer, exe_name_buffer_length)
  end

  def expungeConsoleCommandHistoryA(exe_name : Win32cr::Foundation::PSTR) : Void
    C.ExpungeConsoleCommandHistoryA(exe_name)
  end

  def expungeConsoleCommandHistoryW(exe_name : Win32cr::Foundation::PWSTR) : Void
    C.ExpungeConsoleCommandHistoryW(exe_name)
  end

  def setConsoleNumberOfCommandsA(number : UInt32, exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.SetConsoleNumberOfCommandsA(number, exe_name)
  end

  def setConsoleNumberOfCommandsW(number : UInt32, exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.SetConsoleNumberOfCommandsW(number, exe_name)
  end

  def getConsoleCommandHistoryLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32
    C.GetConsoleCommandHistoryLengthA(exe_name)
  end

  def getConsoleCommandHistoryLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32
    C.GetConsoleCommandHistoryLengthW(exe_name)
  end

  def getConsoleCommandHistoryA(commands : Win32cr::Foundation::PSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32
    C.GetConsoleCommandHistoryA(commands, command_buffer_length, exe_name)
  end

  def getConsoleCommandHistoryW(commands : Win32cr::Foundation::PWSTR, command_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32
    C.GetConsoleCommandHistoryW(commands, command_buffer_length, exe_name)
  end

  def getConsoleProcessList(lpdwProcessList : UInt32*, dwProcessCount : UInt32) : UInt32
    C.GetConsoleProcessList(lpdwProcessList, dwProcessCount)
  end

  #def getStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE) : Win32cr::Foundation::HANDLE
    #C.GetStdHandle(nStdHandle)
  #end

  def setStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetStdHandle(nStdHandle, hHandle)
  end

  def setStdHandleEx(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE, phPrevValue : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.SetStdHandleEx(nStdHandle, hHandle, phPrevValue)
  end

  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun AllocConsole : Win32cr::Foundation::BOOL

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
    fun WriteConsoleA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nNumberOfCharsToWrite : UInt32, lpNumberOfCharsWritten : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL

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
    fun WriteConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt8*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfCharsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteConsoleOutputAttribute(hConsoleOutput : Win32cr::Foundation::HANDLE, lpAttribute : UInt16*, nLength : UInt32, dwWriteCoord : Win32cr::System::Console::COORD, lpNumberOfAttrsWritten : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleOutputCharacterA(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt8*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReadConsoleOutputCharacterW(hConsoleOutput : Win32cr::Foundation::HANDLE, lpCharacter : UInt16*, nLength : UInt32, dwReadCoord : Win32cr::System::Console::COORD, lpNumberOfCharsRead : UInt32*) : Win32cr::Foundation::BOOL

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
    fun GetConsoleTitleA(lpConsoleTitle : UInt8*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleTitleW(lpConsoleTitle : UInt16*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleOriginalTitleA(lpConsoleTitle : UInt8*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleOriginalTitleW(lpConsoleTitle : UInt16*, nSize : UInt32) : UInt32

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
    fun GetConsoleAliasA(source : Win32cr::Foundation::PSTR, target_buffer : UInt8*, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasW(source : Win32cr::Foundation::PWSTR, target_buffer : UInt16*, target_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasesLengthA(exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasesLengthW(exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasExesLengthA : UInt32

    # :nodoc:
    fun GetConsoleAliasExesLengthW : UInt32

    # :nodoc:
    fun GetConsoleAliasesA(alias_buffer : UInt8*, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasesW(alias_buffer : UInt16*, alias_buffer_length : UInt32, exe_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetConsoleAliasExesA(exe_name_buffer : UInt8*, exe_name_buffer_length : UInt32) : UInt32

    # :nodoc:
    fun GetConsoleAliasExesW(exe_name_buffer : UInt16*, exe_name_buffer_length : UInt32) : UInt32

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

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun SetStdHandle(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetStdHandleEx(nStdHandle : Win32cr::System::Console::STD_HANDLE, hHandle : Win32cr::Foundation::HANDLE, phPrevValue : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

  end
end