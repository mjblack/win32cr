require "../src/win32cr"
require "../src/win32cr/ui/windowsandmessaging"
require "../src/win32cr/ui/shell"
require "../src/win32cr/ui/input/keyboardandmouse"
require "../src/win32cr/system/libraryloader"


module Crystal
  def self.exit(status : Int32, exception : Exception?) : Int32
    status = Crystal::AtExitHandlers.run status, exception

    if exception
      title = "Unhandled Exception".to_utf16
      message = exception.inspect_with_backtrace.to_utf16
      LibWin32.MessageBoxW(nil, message, title, LibWin32::MESSAGEBOX_STYLE::MB_OK)
    end

    status
  end
end

module AppData
  class_property hInstance : LibWin32::HINSTANCE = 0_i64
  class_property hPrevInstance : Void*?
  class_property hwnd : LibWin32::HWND  = Pointer(Void).new(sizeof(LibWin32::HWND))
  class_property hwndEdit : LibWin32::HWND = Pointer(Void).new(sizeof(LibWin32::HWND))

  def self.hwdEdit : LibWin32::HWND
    if @@hwndEdit.nil?
      raise Exception.new("hwndEdit was nil!")
    end
    h = @@hwndEdit.not_nil!
    h
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
pARGV = (PROGRAM_NAME + " " + nARGV.join(" ") + "\0").to_utf16

winARGV = LibWin32.CommandLineToArgvW(pARGV, out winARGC)
hInstance = LibWin32.GetModuleHandleW(nil)
G_HINSTANCE = hInstance
hPrevInstance = Pointer(Void).null
AppData.hInstance = hInstance
AppData.hPrevInstance = hPrevInstance
CLASS_NAME = "WIN_CLASS1".to_utf16
MENU_NAME = "ExampleWindow".to_utf16
APP_NAME = "Simple Window".to_utf16

def winproc(hwnd : LibWin32::HWND, uMsg : UInt32, wParam : LibWin32::WPARAM, lParam : LibWin32::LPARAM) : LibWin32::LRESULT
  lresult = 0_i64
  case uMsg
  when LibWin32::WM_CREATE
    hMenu = LibWin32.CreateMenu
    hFileMenu = LibWin32.CreatePopupMenu

    LibWin32.AppendMenuW(hFileMenu, LibWin32::MENU_ITEM_FLAGS::MF_STRING, MNU_ITEM_FILE_QUIT, "E&xit".to_utf16)
    LibWin32.AppendMenuW(hMenu, LibWin32::MENU_ITEM_FLAGS::MF_POPUP, hFileMenu.unsafe_as(LibC::UINT_PTR), "&File".to_utf16)

    if LibWin32.SetMenu(hwnd, hMenu) == 0
      if (err = LibC.GetLastError) > 0
        LibWin32.MessageBoxW(nil, "Got error #{err}".to_utf16, "winapp log".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_OK)
      end
    end

    if LibWin32.SetMenu(hwnd, hMenu) == 0
      if (err = LibC.GetLastError) > 0
        LibWin32.MessageBoxW(nil, "Got error #{err}".to_utf16, "winapp log".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_OK)
      end
    end

    hwndEdit = LibWin32.CreateWindowExW(
      LibWin32::WINDOW_EX_STYLE::WS_EX_LEFT,                                # Optional window styles
      "EDIT".to_utf16,                                                      # Window class
      nil,                                                                  # Application Name
      LibWin32::WINDOW_STYLE::WS_CHILD |
        LibWin32::WINDOW_STYLE::WS_VISIBLE |
        LibWin32::WINDOW_STYLE::WS_BORDER |
        LibWin32::WINDOW_STYLE::WS_HSCROLL |
        LibWin32::WINDOW_STYLE::WS_VSCROLL |
        LibWin32::WINDOW_STYLE::WS_CHILDWINDOW,# |
        #LibWin32::WINDOW_STYLE::ES_MULTILINE,
    # Size and position
      10,
      10,
      100,
      50,
      hwnd,                                                                 # Parent window
      nil,                                                                  # Menu
      lParam.unsafe_as(Pointer(LibWin32::CREATESTRUCTW)).value.h_instance,  # Instance handle
      nil                                                                   # Additional application data
    )

    if (err = LibC.GetLastError) > 0
      LibWin32.MessageBoxW(nil, "Got error #{err}".to_utf16, "winapp log".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_OK)
    end
    AppData.hwndEdit = hwndEdit
  when LibWin32::WM_SETFOCUS
    LibWin32.SetFocus(AppData.hwndEdit.not_nil!)
  when LibWin32::WM_SIZE
    LibWin32.MoveWindow(AppData.hwndEdit.unsafe_as(LibWin32::HWND), 0, 0, loword(lParam), hiword(pointerof(lParam)), 1)
  when LibWin32::WM_COMMAND
    case loword(wParam)
    when MNU_ITEM_FILE_QUIT
      LibWin32.PostMessageW(hwnd, LibWin32::WM_CLOSE, 0_u64, 0_i64)
    end
  when LibWin32::WM_CLOSE, LibWin32::WM_QUIT
    LibWin32.DestroyWindow(hwnd)
    LibWin32.PostQuitMessage(0)
  when LibWin32::WM_DESTROY
    LibWin32.PostQuitMessage(0)
  when LibWin32::WM_PAINT
    ps = LibWin32::PAINTSTRUCT.new
    hdc = LibWin32.BeginPaint(hwnd, pointerof(ps))
    psrcPaint = ps.rc_paint
    LibWin32.FillRect(hdc, pointerof(psrcPaint), (LibWin32::SYS_COLOR_INDEX::COLOR_WINDOW + 1).unsafe_as(LibWin32::HBRUSH))
    ps.rc_paint = psrcPaint
    LibWin32.EndPaint(hwnd, pointerof(ps))
  else
    return LibWin32.DefWindowProcW(hwnd, uMsg, wParam, lParam)
  end
  return lresult
end



icon = nil
cursor = nil

funptr =->winproc(LibWin32::HWND, UInt32, LibWin32::WPARAM, LibWin32::LPARAM)
wc = LibWin32::WNDCLASSEXW.new
wc.cb_size = sizeof(LibWin32::WNDCLASSEXW)
wc.lpfn_wnd_proc = funptr
wc.lpsz_class_name = CLASS_NAME
#wc.lpszMenuName = to_lpcwstr("MNU_MAIN")
wc.style = LibWin32::WNDCLASS_STYLES::CS_HREDRAW | LibWin32::WNDCLASS_STYLES::CS_VREDRAW
wc.cb_cls_extra = 0
wc.cb_wnd_extra = 0
wc.h_instance = hInstance
wc.h_icon = icon

if LibWin32.RegisterClassExW(pointerof(wc)) == 0
  err = LibC.GetLastError
  raise "window class register failed because #{err}"
  exit 1
end

hwnd = LibWin32.CreateWindowExW(
LibWin32::WINDOW_EX_STYLE::WS_EX_LEFT,       # Optional window styles
CLASS_NAME,                                  # Window class
APP_NAME,                                    # Application Name
LibWin32::WINDOW_STYLE::WS_OVERLAPPEDWINDOW, # Window style

# Size and position
LibWin32::CW_USEDEFAULT,
LibWin32::CW_USEDEFAULT,
LibWin32::CW_USEDEFAULT,
LibWin32::CW_USEDEFAULT,
nil,                                  # Parent window
nil,                                  # Menu
hInstance,                            # Instance handle
nil                                   # Additional application data
)

AppData.hwnd = hwnd

LibWin32.ShowWindow(hwnd, LibWin32::SHOW_WINDOW_CMD::SW_NORMAL)
LibWin32.DrawMenuBar(hwnd)
LibWin32.UpdateWindow(hwnd)

while (LibWin32.GetMessageW(out msg, nil, 0, 0) > 0)
  pmsg = pointerof(msg)
  LibWin32.TranslateMessage(pmsg)
  LibWin32.DispatchMessageW(pmsg)
  if msg.message == LibWin32::WM_QUIT
    LibWin32.MessageBoxW(nil, "Quit called".to_utf16, "Event".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_OK)
    break
  end
  #LibWin32.MessageBoxW(nil, "#{msg.message.to_s}".to_utf16, "Event".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_OK)
end

if (err = LibC.GetLastError) > 0
  if !err == LibWin32::WIN32_ERROR::ERROR_INVALID_WINDOW_HANDLE
    LibWin32.MessageBoxW(nil, "Error code: #{err}".to_utf16, "Exit Error".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_ICONERROR)
  end
end