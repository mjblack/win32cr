require "../src/win32cr"
require "../src/win32cr/ui/windows_and_messaging"
require "../src/win32cr/ui/shell"
require "../src/win32cr/ui/input/keyboard_and_mouse"
require "../src/win32cr/system/library_loader"


module Crystal
  def self.exit(status : Int32, exception : Exception?) : Int32
    status = Crystal::AtExitHandlers.run status, exception

    if exception
      title = "Unhandled Exception".to_utf16
      message = exception.inspect_with_backtrace.to_utf16
      Win32cr::UI::WindowsAndMessaging::C.MessageBoxW(nil, message, title, Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE::MB_OK)
    end

    status
  end
end

module AppData
  class_property hInstance : Win32cr::Foundation::HINSTANCE = Pointer(Void).null
  class_property hPrevInstance : Void*?
  class_property hwnd : Win32cr::Foundation::HWND  = Win32cr::Foundation::HWND.malloc(sizeof(Win32cr::Foundation::HWND))
  class_property hwndEdit : Win32cr::Foundation::HWND = Win32cr::Foundation::HWND.malloc(sizeof(Win32cr::Foundation::HWND))

  def self.hwdEdit : Win32cr::Foundation::HWND
    if h = @@hwndEdit
      h
    else
      raise Exception.new("hwndEdit was nil!")
    end
  end
end

def loword(i : UInt64) : UInt16
  val = (i & 0xffff).to_u16
  val
end

def loword(i : Int64) : UInt16
  val = (i.to_u64 & 0xffff).to_u16
  val
end

def hiword(i : UInt32*) : UInt16
  val = ((i.value >> 16) & 0xFFFF).to_u16
  val
end

def hiword(i : Int64*) : UInt16
  val = ((i.value.to_u64 >> 16) & 0xFFFF).to_u16
  val
end

IDC_WIN_CLASS1        = 100

MNU_MAIN_FILE         = 101
MNU_MAIN_EDIT         = 102
MNU_MAIN_HELP         = 103

MNU_ITEM_FILE_QUIT    = 399_u64

MNU_ITEM_EDIT_UNDO    = 400
MNU_ITEM_EDIT_COPY    = 401
MNU_ITEM_EDIT_CUT     = 402
MNU_ITEM_EDIT_PASTE   = 403

ID_EDIT_BOX = 600

nARGV = Array.new(ARGC_UNSAFE) do |i|
  String.new(ARGV_UNSAFE[i])
end
pARGV = (PROGRAM_NAME + " " + nARGV.join(" ")).to_utf16

winARGV = Win32cr::UI::Shell::C.CommandLineToArgvW(pARGV, out winARGC)
hInstance = Win32cr::System::LibraryLoader::C.GetModuleHandleW(nil)
if hInstance.null?
  puts "Failed to get module handle"
  exit 1
end
HINSTANCE = hInstance
hPrevInstance = Pointer(Void).null
AppData.hInstance = hInstance
AppData.hPrevInstance = hPrevInstance
CLASS_NAME = "WIN_CLASS1".to_utf16
MENU_NAME = "ExampleWindow".to_utf16
APP_NAME = "Simple Window".to_utf16

def winproc(hwnd : Win32cr::Foundation::HWND, uMsg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::LRESULT
  lresult = 0_i64
  case uMsg
  when Win32cr::UI::WindowsAndMessaging::WM_CREATE
    hMenu = Win32cr::UI::WindowsAndMessaging::C.CreateMenu
    hFileMenu = Win32cr::UI::WindowsAndMessaging::C.CreatePopupMenu

    Win32cr::UI::WindowsAndMessaging::C.AppendMenuW(hFileMenu, Win32cr::UI::WindowsAndMessaging::MENU_ITEM_FLAGS::MF_STRING, MNU_ITEM_FILE_QUIT, "E&xit".to_utf16)
    Win32cr::UI::WindowsAndMessaging::C.AppendMenuW(hMenu, Win32cr::UI::WindowsAndMessaging::MENU_ITEM_FLAGS::MF_POPUP, hFileMenu.unsafe_as(LibC::UINT_PTR), "&File".to_utf16)

    if Win32cr::UI::WindowsAndMessaging::C.SetMenu(hwnd, hMenu) == 0
      if (err = LibC.GetLastError) > 0
        Win32cr::UI::WindowsAndMessaging::C.MessageBoxW(nil, "Got error #{err}".to_utf16, "winapp log".to_utf16, Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE::MB_OK)
      end
    end

    if Win32cr::UI::WindowsAndMessaging::C.SetMenu(hwnd, hMenu) == 0
      if (err = LibC.GetLastError) > 0
        Win32cr::UI::WindowsAndMessaging::C.MessageBoxW(nil, "Got error #{err}".to_utf16, "winapp log".to_utf16, Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE::MB_OK)
      end
    end

    hwndEdit = Win32cr::UI::WindowsAndMessaging::C.CreateWindowExW(
      Win32cr::UI::WindowsAndMessaging::WINDOW_EX_STYLE::WS_EX_LEFT,                              # Optional window styles
      "EDIT".to_utf16,                                                                            # Window class
      nil,                                                                                        # Application Name
      Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE::WS_CHILD |
      Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE::WS_VISIBLE |
      Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE::WS_BORDER |
      Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE::WS_HSCROLL |
      Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE::WS_VSCROLL |
      Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE::WS_CHILDWINDOW,
    # Size and position
      10,
      10,
      100,
      50,
      hwnd,                                                                                        # Parent window
      0_i64,                                                                                       # Menu
      lParam.unsafe_as(Pointer(Win32cr::UI::WindowsAndMessaging::CREATESTRUCTW)).value.hInstance,  # Instance handle
      nil                                                                                          # Additional application data
    )

    if (err = LibC.GetLastError) > 0
      Win32cr::UI::WindowsAndMessaging::C.MessageBoxW(nil, "Got error #{err}".to_utf16, "winapp log".to_utf16, Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE::MB_OK)
    end
    AppData.hwndEdit = hwndEdit
  when Win32cr::UI::WindowsAndMessaging::WM_SETFOCUS
    Win32cr::UI::Input::KeyboardAndMouse::C.SetFocus(AppData.hwndEdit.not_nil!)
  when Win32cr::UI::WindowsAndMessaging::WM_SIZE
    Win32cr::UI::WindowsAndMessaging::C.MoveWindow(AppData.hwndEdit.unsafe_as(Win32cr::Foundation::HWND), 0, 0, loword(lParam), hiword(pointerof(lParam)), 1)
  when Win32cr::UI::WindowsAndMessaging::WM_COMMAND
    case loword(wParam)
    when MNU_ITEM_FILE_QUIT
      Win32cr::UI::WindowsAndMessaging::C.PostMessageW(hwnd, Win32cr::UI::WindowsAndMessaging::WM_CLOSE, 0_u64, 0_i64)
    end
  when Win32cr::UI::WindowsAndMessaging::WM_CLOSE, Win32cr::UI::WindowsAndMessaging::WM_QUIT
    Win32cr::UI::WindowsAndMessaging::C.DestroyWindow(hwnd)
    Win32cr::UI::WindowsAndMessaging::C.PostQuitMessage(0)
  when Win32cr::UI::WindowsAndMessaging::WM_DESTROY
    Win32cr::UI::WindowsAndMessaging::C.PostQuitMessage(0)
  when Win32cr::UI::WindowsAndMessaging::WM_PAINT
    ps = Pointer(Win32cr::Graphics::Gdi::PAINTSTRUCT).malloc(sizeof(Win32cr::Graphics::Gdi::PAINTSTRUCT))
    hdc = Win32cr::Graphics::Gdi::C.BeginPaint(hwnd, ps)
    psrcPaint = ps.value.rcPaint
    Win32cr::Graphics::Gdi::C.FillRect(hdc, pointerof(psrcPaint), (Win32cr::UI::WindowsAndMessaging::SYS_COLOR_INDEX::COLOR_WINDOW + 1).unsafe_as(Win32cr::Graphics::Gdi::HBRUSH))
    ps.value.rcPaint = psrcPaint
    Win32cr::Graphics::Gdi::C.EndPaint(hwnd, ps)
  else
    return Win32cr::UI::WindowsAndMessaging::C.DefWindowProcW(hwnd, uMsg, wParam, lParam)
  end
  return lresult
end



icon = 0_i64
cursor = 0_i64

funptr =->winproc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM)
wc = Win32cr::UI::WindowsAndMessaging::WNDCLASSEXW.new(
  cbSize: sizeof(Win32cr::UI::WindowsAndMessaging::WNDCLASSEXW).to_u32,
  lpfnWndProc: funptr,
  lpszClassName: CLASS_NAME.to_unsafe,
  lpszMenuName: Pointer(UInt16).null,
  style: Win32cr::UI::WindowsAndMessaging::WNDCLASS_STYLES::CS_HREDRAW | Win32cr::UI::WindowsAndMessaging::WNDCLASS_STYLES::CS_VREDRAW,
  cbClsExtra: 0,
  cbWndExtra: 0,
  hInstance: hInstance,
  hIcon: icon,
  hCursor: cursor,
  hbrBackground: 0_i64,
  hIconSm: icon
)

if Win32cr::UI::WindowsAndMessaging::C.RegisterClassExW(pointerof(wc)) == 0
  err = LibC.GetLastError
  raise "window class register failed because #{err}"
  exit 1
end

hwnd = Win32cr::UI::WindowsAndMessaging::C.CreateWindowExW(
  Win32cr::UI::WindowsAndMessaging::WINDOW_EX_STYLE::WS_EX_LEFT,         # Optional window styles
  CLASS_NAME,                                                            # Window class
  APP_NAME,                                                              # Application Name
  Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE::WS_OVERLAPPEDWINDOW,   # Window style

  # Size and position
  Win32cr::UI::WindowsAndMessaging::CW_USEDEFAULT,
  Win32cr::UI::WindowsAndMessaging::CW_USEDEFAULT,
  Win32cr::UI::WindowsAndMessaging::CW_USEDEFAULT,
  Win32cr::UI::WindowsAndMessaging::CW_USEDEFAULT,
  nil,                                                                   # Parent window
  0_i64,                                                                 # Menu
  hInstance,                                                             # Instance handle
  nil                                                                    # Additional application data
)

AppData.hwnd = hwnd

Win32cr::UI::WindowsAndMessaging::C.ShowWindow(hwnd, Win32cr::UI::WindowsAndMessaging::SHOW_WINDOW_CMD::SW_NORMAL)
Win32cr::UI::WindowsAndMessaging::C.DrawMenuBar(hwnd)
Win32cr::Graphics::Gdi::C.UpdateWindow(hwnd)

while (Win32cr::UI::WindowsAndMessaging::C.GetMessageW(out msg, nil, 0, 0) > 0)
  pmsg = pointerof(msg)
  Win32cr::UI::WindowsAndMessaging::C.TranslateMessage(pmsg)
  Win32cr::UI::WindowsAndMessaging::C.DispatchMessageW(pmsg)
  if msg.message == Win32cr::UI::WindowsAndMessaging::WM_QUIT
    Win32cr::UI::WindowsAndMessaging::C.MessageBoxW(nil, "Quit called".to_utf16, "Event".to_utf16, Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE::MB_OK)
    break
  end
end

if (err = LibC.GetLastError) > 0
  if !err == Win32cr::Foundation::WIN32_ERROR::ERROR_INVALID_WINDOW_HANDLE
    Win32cr::UI::WindowsAndMessaging::C.MessageBoxW(nil, "Error code: #{err}".to_utf16, "Exit Error".to_utf16, Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE::MB_ICONERROR)
  end
end
