require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../security.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::System::StationsAndDesktops
  alias HWINSTA = LibC::IntPtrT
  alias HDESK = LibC::IntPtrT
  alias WINSTAENUMPROCA = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias WINSTAENUMPROCW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias DESKTOPENUMPROCA = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias DESKTOPENUMPROCW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)


  @[Flags]
  enum BROADCAST_SYSTEM_MESSAGE_FLAGS : UInt32
    BSF_ALLOWSFW = 128_u32
    BSF_FLUSHDISK = 4_u32
    BSF_FORCEIFHUNG = 32_u32
    BSF_IGNORECURRENTTASK = 2_u32
    BSF_NOHANG = 8_u32
    BSF_NOTIMEOUTIFNOTHUNG = 64_u32
    BSF_POSTMESSAGE = 16_u32
    BSF_QUERY = 1_u32
    BSF_SENDNOTIFYMESSAGE = 256_u32
    BSF_LUID = 1024_u32
    BSF_RETURNHDESK = 512_u32
  end
  @[Flags]
  enum BROADCAST_SYSTEM_MESSAGE_INFO : UInt32
    BSM_ALLCOMPONENTS = 0_u32
    BSM_ALLDESKTOPS = 16_u32
    BSM_APPLICATIONS = 8_u32
  end
  enum USER_OBJECT_INFORMATION_INDEX : UInt32
    UOI_FLAGS = 1_u32
    UOI_HEAPSIZE = 5_u32
    UOI_IO = 6_u32
    UOI_NAME = 2_u32
    UOI_TYPE = 3_u32
    UOI_USER_SID = 4_u32
  end

  @[Extern]
  struct USEROBJECTFLAGS
    property fInherit : Win32cr::Foundation::BOOL
    property fReserved : Win32cr::Foundation::BOOL
    property dwFlags : UInt32
    def initialize(@fInherit : Win32cr::Foundation::BOOL, @fReserved : Win32cr::Foundation::BOOL, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct BSMINFO
    property cbSize : UInt32
    property hdesk : Win32cr::System::StationsAndDesktops::HDESK
    property hwnd : Win32cr::Foundation::HWND
    property luid : Win32cr::Foundation::LUID
    def initialize(@cbSize : UInt32, @hdesk : Win32cr::System::StationsAndDesktops::HDESK, @hwnd : Win32cr::Foundation::HWND, @luid : Win32cr::Foundation::LUID)
    end
  end

  @[Link("user32")]
  lib C
    fun CreateDesktopA(lpszDesktop : Win32cr::Foundation::PSTR, lpszDevice : Win32cr::Foundation::PSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HDESK

    fun CreateDesktopW(lpszDesktop : Win32cr::Foundation::PWSTR, lpszDevice : Win32cr::Foundation::PWSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEW*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HDESK

    fun CreateDesktopExA(lpszDesktop : Win32cr::Foundation::PSTR, lpszDevice : Win32cr::Foundation::PSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*, ulHeapSize : UInt32, pvoid : Void*) : Win32cr::System::StationsAndDesktops::HDESK

    fun CreateDesktopExW(lpszDesktop : Win32cr::Foundation::PWSTR, lpszDevice : Win32cr::Foundation::PWSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEW*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*, ulHeapSize : UInt32, pvoid : Void*) : Win32cr::System::StationsAndDesktops::HDESK

    fun OpenDesktopA(lpszDesktop : Win32cr::Foundation::PSTR, dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    fun OpenDesktopW(lpszDesktop : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    fun OpenInputDesktop(dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    fun EnumDesktopsA(hwinsta : Win32cr::System::StationsAndDesktops::HWINSTA, lpEnumFunc : Win32cr::System::StationsAndDesktops::DESKTOPENUMPROCA, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun EnumDesktopsW(hwinsta : Win32cr::System::StationsAndDesktops::HWINSTA, lpEnumFunc : Win32cr::System::StationsAndDesktops::DESKTOPENUMPROCW, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun EnumDesktopWindows(hDesktop : Win32cr::System::StationsAndDesktops::HDESK, lpfn : Win32cr::UI::WindowsAndMessaging::WNDENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun SwitchDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL

    fun SetThreadDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL

    fun CloseDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL

    fun GetThreadDesktop(dwThreadId : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    fun CreateWindowStationA(lpwinsta : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HWINSTA

    fun CreateWindowStationW(lpwinsta : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HWINSTA

    fun OpenWindowStationA(lpszWinSta : Win32cr::Foundation::PSTR, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HWINSTA

    fun OpenWindowStationW(lpszWinSta : Win32cr::Foundation::PWSTR, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HWINSTA

    fun EnumWindowStationsA(lpEnumFunc : Win32cr::System::StationsAndDesktops::WINSTAENUMPROCA, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun EnumWindowStationsW(lpEnumFunc : Win32cr::System::StationsAndDesktops::WINSTAENUMPROCW, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun CloseWindowStation(hWinSta : Win32cr::System::StationsAndDesktops::HWINSTA) : Win32cr::Foundation::BOOL

    fun SetProcessWindowStation(hWinSta : Win32cr::System::StationsAndDesktops::HWINSTA) : Win32cr::Foundation::BOOL

    fun GetProcessWindowStation : Win32cr::System::StationsAndDesktops::HWINSTA

    fun GetUserObjectInformationA(hObj : Win32cr::Foundation::HANDLE, nIndex : Win32cr::System::StationsAndDesktops::USER_OBJECT_INFORMATION_INDEX, pvInfo : Void*, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun GetUserObjectInformationW(hObj : Win32cr::Foundation::HANDLE, nIndex : Win32cr::System::StationsAndDesktops::USER_OBJECT_INFORMATION_INDEX, pvInfo : Void*, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun SetUserObjectInformationA(hObj : Win32cr::Foundation::HANDLE, nIndex : Int32, pvInfo : Void*, nLength : UInt32) : Win32cr::Foundation::BOOL

    fun SetUserObjectInformationW(hObj : Win32cr::Foundation::HANDLE, nIndex : Int32, pvInfo : Void*, nLength : UInt32) : Win32cr::Foundation::BOOL

    fun BroadcastSystemMessageExA(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pbsmInfo : Win32cr::System::StationsAndDesktops::BSMINFO*) : Int32

    fun BroadcastSystemMessageExW(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pbsmInfo : Win32cr::System::StationsAndDesktops::BSMINFO*) : Int32

    fun BroadcastSystemMessageA(flags : UInt32, lpInfo : UInt32*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Int32

    fun BroadcastSystemMessageW(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Int32

  end
end