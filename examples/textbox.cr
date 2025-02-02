require "../src/win32cr"
require "../src/win32cr/ui/windows_and_messaging"
require "../src/win32cr/ui/shell"
require "../src/win32cr/ui/input/keyboard_and_mouse"
require "../src/win32cr/system/library_loader"

alias Fd = Win32cr::Foundation
alias WM = Win32cr::UI::WindowsAndMessaging
alias UIShell = Win32cr::UI::Shell
alias LibLoad = Win32cr::System::LibraryLoader
alias GDI = Win32cr::Graphics::Gdi
alias KM = Win32cr::UI::Input::KeyboardAndMouse

NULL = Pointer(Void).null

module Crystal
  def self.exit(status : Int32, exception : Exception?) : Int32
    status = Crystal::AtExitHandlers.run status, exception

    if exception
      title = pwstr("Unhandled Exception")
      message = pwstr(exception.inspect_with_backtrace)
      WM.messageBoxW(NULL, message, title, WM::MESSAGEBOX_STYLE::MB_ICONERROR)
    end

    status
  end
end

module AppData
  class_property hInstance : Fd::HINSTANCE = Pointer(Void).null
  class_property hPrevInstance : Void*?
  class_property hwnd : Fd::HWND  = Fd::HWND.malloc(sizeof(Fd::HWND))
  class_property hwndEdit : Fd::HWND = Fd::HWND.malloc(sizeof(Fd::HWND))

  def self.hwdEdit : Fd::HWND
    if @@hwndEdit.nil?
      raise Exception.new("hwndEdit was nil!")
    end
    h = @@hwndEdit.not_nil!
    h
  end
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
pARGV = pwstr((PROGRAM_NAME + " " + nARGV.join(" ") + "\0"))

winARGC = 0
winARGV = UIShell.commandLineToArgvW(pARGV, pointerof(winARGC))

hInstance = LibLoad.getModuleHandleW(Pointer(UInt16).null)
G_HINSTANCE = hInstance
hPrevInstance = Pointer(Void).null
AppData.hInstance = hInstance
AppData.hPrevInstance = hPrevInstance
CLASS_NAME = pwstr("WIN_CLASS1")
MENU_NAME = pwstr("ExampleWindow")
APP_NAME = pwstr("Simple Window")

def winproc(hwnd : Fd::HWND, uMsg : UInt32, wParam : Fd::WPARAM, lParam : Fd::LPARAM) : Fd::LRESULT
  lresult = 0_i64
  case uMsg
  when WM::WM_CREATE
    hMenu = WM.createMenu
    hFileMenu = WM.createPopupMenu

    WM.appendMenuW(hFileMenu, :mf_string, MNU_ITEM_FILE_QUIT, pwstr("E&xit"))
    WM.appendMenuW(hMenu, :mf_popup, hFileMenu.unsafe_as(LibC::UINT_PTR), pwstr("&File"))

    if WM.setMenu(hwnd, hMenu) == 0
      if (err = LibC.GetLastError) > 0
        WM.messageBoxW(Pointer(Void).null, pwstr("Got error #{err}"), pwstr("winapp log"), WM::MESSAGEBOX_STYLE::MB_ICONERROR)
      end
    end

    if WM.setMenu(hwnd, hMenu) == 0
      if (err = LibC.GetLastError) > 0
        WM.messageBoxW(Pointer(Void).null, pwstr("Got error #{err}"), pwstr("winapp log"), WM::MESSAGEBOX_STYLE::MB_ICONERROR)
      end
    end

    hwndEdit = WM.createWindowExW(
      WM::WINDOW_EX_STYLE::WS_EX_LEFT.value,                                # Optional window styles
      pwstr("EDIT"),                                                        # Window class
      Pointer(UInt16).null,                                                 # Application Name
      WM::WINDOW_STYLE[:ws_child, :ws_visible,
                      :ws_border, :ws_hscroll,
                      :ws_vscroll, :ws_childwindow].value,
      # Size and position
      10,
      10,
      100,
      50,
      hwnd,                                                                 # Parent window
      0_i64,                                                                # Menu
      lParam.unsafe_as(Pointer(WM::CREATESTRUCTW)).value.hInstance,         # Instance handle
      Pointer(Void).null                                                    # Additional application data
    )

    if (err = LibC.GetLastError) > 0
      WM.messageBoxW(Pointer(Void).null, pwstr("Got error #{err}"), pwstr("winapp log"), WM::MESSAGEBOX_STYLE::MB_ICONERROR)
    end
    AppData.hwndEdit = hwndEdit
  when WM::WM_SETFOCUS
    KM.setFocus(AppData.hwndEdit.not_nil!)
  when WM::WM_SIZE
    WM.moveWindow(AppData.hwndEdit.unsafe_as(Fd::HWND), 0, 0, loword(lParam), hiword(pointerof(lParam)), 1)
  when WM::WM_COMMAND
    case loword(wParam)
    when MNU_ITEM_FILE_QUIT
      WM.postMessageW(hwnd, WM::WM_CLOSE, 0_u64, 0_i64)
    end
  when WM::WM_CLOSE, WM::WM_QUIT
    WM.destroyWindow(hwnd)
    WM.postQuitMessage(0)
  when WM::WM_DESTROY
    WM.postQuitMessage(0)
  when WM::WM_PAINT
    ps = uninitialized GDI::PAINTSTRUCT
    # ps = GDI::PAINTSTRUCT.new(
    #   hdc: 0,
    #   fErase: 0,
    #   fRestore: 0,
    #   fIncUpdate: 0,
    #   rcPaint: Fd::RECT.new(
    #     left: 0,
    #     top: 0,
    #     right: 0,
    #     bottom: 0
    #   )
    # )
    hdc = GDI.beginPaint(hwnd, pointerof(ps))
    psrcPaint = ps.rcPaint
    GDI.fillRect(hdc, pointerof(psrcPaint), (WM::SYS_COLOR_INDEX::COLOR_WINDOW + 1).unsafe_as(GDI::HBRUSH))
    ps.rcPaint = psrcPaint
    GDI.endPaint(hwnd, pointerof(ps))
  else
    return WM.defWindowProcW(hwnd, uMsg, wParam, lParam)
  end
  return lresult
end



icon = 0_i64
cursor = 0_i64

funptr =->winproc(Fd::HWND, UInt32, Fd::WPARAM, Fd::LPARAM)
wc = WM::WNDCLASSEXW.new(
  cbSize: sizeof(WM::WNDCLASSEXW).to_u32,
  lpfnWndProc: funptr,
  lpszClassName: CLASS_NAME,
  style: WM::WNDCLASS_STYLES[:cs_hredraw, :cs_vredraw],
  cbClsExtra: 0,
  cbWndExtra: 0,
  hInstance: hInstance,
  hIcon: icon,
  hCursor: cursor,
  hbrBackground: (WM::SYS_COLOR_INDEX::COLOR_WINDOW.value + 1),
  lpszMenuName: MENU_NAME,
  hIconSm: icon
)

if WM.registerClassExW(pointerof(wc)) == 0
  err = LibC.GetLastError
  raise "window class register failed because #{err}"
  exit 1
end

hwnd = WM.createWindowExW(
  WM::WINDOW_EX_STYLE::WS_EX_LEFT.value,       # Optional window styles
  CLASS_NAME,                                  # Window class
  APP_NAME,                                    # Application Name
  WM::WINDOW_STYLE::WS_OVERLAPPEDWINDOW.value, # Window style

  # Size and position
  WM::CW_USEDEFAULT,
  WM::CW_USEDEFAULT,
  WM::CW_USEDEFAULT,
  WM::CW_USEDEFAULT,
  Pointer(Void).null,                          # Parent window
  0_i64,                                       # Menu
  hInstance,                                   # Instance handle
  Pointer(Void).null                           # Additional application data
)

AppData.hwnd = hwnd

WM.showWindow(hwnd, :sw_normal)
WM.drawMenuBar(hwnd)
GDI.updateWindow(hwnd)

msg = Pointer(WM::MSG).malloc(sizeof(WM::MSG))
while (WM.getMessageW(msg, Pointer(Void).null, 0_u32, 0_u32) > 0)
  WM.translateMessage(msg)
  WM.dispatchMessageW(msg)
  if msg.value.message == WM::WM_QUIT
    WM.messageBoxW(Pointer(Void).null, pwstr("Quit called"), pwstr("Event"), WM::MESSAGEBOX_STYLE::MB_OK)
    break
  end
  msg.clear(sizeof(WM::MSG))
end

if (err = LibC.GetLastError) > 0
  if !err == Fd::WIN32_ERROR::ERROR_INVALID_WINDOW_HANDLE
    WM.messageBoxW(Pointer(Void).null, pwstr("Error code: #{err}"), pwstr("Exit Error"), WM::MESSAGEBOX_STYLE::MB_ICONERROR)
  end
end
