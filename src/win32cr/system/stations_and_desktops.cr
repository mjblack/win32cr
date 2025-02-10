require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../security.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::System::StationsAndDesktops
  extend self
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

  def createDesktopA(lpszDesktop : Win32cr::Foundation::PSTR, lpszDevice : Win32cr::Foundation::PSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.CreateDesktopA(lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa)
    {% end %}
  end

  def createDesktopW(lpszDesktop : Win32cr::Foundation::PWSTR, lpszDevice : Win32cr::Foundation::PWSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEW*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.CreateDesktopW(lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa)
    {% end %}
  end

  def createDesktopExA(lpszDesktop : Win32cr::Foundation::PSTR, lpszDevice : Win32cr::Foundation::PSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*, ulHeapSize : UInt32, pvoid : Void*) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.CreateDesktopExA(lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa, ulHeapSize, pvoid)
    {% end %}
  end

  def createDesktopExW(lpszDesktop : Win32cr::Foundation::PWSTR, lpszDevice : Win32cr::Foundation::PWSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEW*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*, ulHeapSize : UInt32, pvoid : Void*) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.CreateDesktopExW(lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa, ulHeapSize, pvoid)
    {% end %}
  end

  def openDesktopA(lpszDesktop : Win32cr::Foundation::PSTR, dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.OpenDesktopA(lpszDesktop, dwFlags, fInherit, dwDesiredAccess)
    {% end %}
  end

  def openDesktopW(lpszDesktop : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.OpenDesktopW(lpszDesktop, dwFlags, fInherit, dwDesiredAccess)
    {% end %}
  end

  def openInputDesktop(dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.OpenInputDesktop(dwFlags, fInherit, dwDesiredAccess)
    {% end %}
  end

  def enumDesktopsA(hwinsta : Win32cr::System::StationsAndDesktops::HWINSTA, lpEnumFunc : Win32cr::System::StationsAndDesktops::DESKTOPENUMPROCA, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumDesktopsA(hwinsta, lpEnumFunc, lParam)
    {% end %}
  end

  def enumDesktopsW(hwinsta : Win32cr::System::StationsAndDesktops::HWINSTA, lpEnumFunc : Win32cr::System::StationsAndDesktops::DESKTOPENUMPROCW, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumDesktopsW(hwinsta, lpEnumFunc, lParam)
    {% end %}
  end

  def enumDesktopWindows(hDesktop : Win32cr::System::StationsAndDesktops::HDESK, lpfn : Win32cr::UI::WindowsAndMessaging::WNDENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumDesktopWindows(hDesktop, lpfn, lParam)
    {% end %}
  end

  def switchDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SwitchDesktop(hDesktop)
    {% end %}
  end

  def setThreadDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetThreadDesktop(hDesktop)
    {% end %}
  end

  def closeDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.CloseDesktop(hDesktop)
    {% end %}
  end

  def getThreadDesktop(dwThreadId : UInt32) : Win32cr::System::StationsAndDesktops::HDESK
    {% if !flag?(:docs) %}
    C.GetThreadDesktop(dwThreadId)
    {% end %}
  end

  def createWindowStationA(lpwinsta : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HWINSTA
    {% if !flag?(:docs) %}
    C.CreateWindowStationA(lpwinsta, dwFlags, dwDesiredAccess, lpsa)
    {% end %}
  end

  def createWindowStationW(lpwinsta : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HWINSTA
    {% if !flag?(:docs) %}
    C.CreateWindowStationW(lpwinsta, dwFlags, dwDesiredAccess, lpsa)
    {% end %}
  end

  def openWindowStationA(lpszWinSta : Win32cr::Foundation::PSTR, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HWINSTA
    {% if !flag?(:docs) %}
    C.OpenWindowStationA(lpszWinSta, fInherit, dwDesiredAccess)
    {% end %}
  end

  def openWindowStationW(lpszWinSta : Win32cr::Foundation::PWSTR, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HWINSTA
    {% if !flag?(:docs) %}
    C.OpenWindowStationW(lpszWinSta, fInherit, dwDesiredAccess)
    {% end %}
  end

  def enumWindowStationsA(lpEnumFunc : Win32cr::System::StationsAndDesktops::WINSTAENUMPROCA, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumWindowStationsA(lpEnumFunc, lParam)
    {% end %}
  end

  def enumWindowStationsW(lpEnumFunc : Win32cr::System::StationsAndDesktops::WINSTAENUMPROCW, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumWindowStationsW(lpEnumFunc, lParam)
    {% end %}
  end

  def closeWindowStation(hWinSta : Win32cr::System::StationsAndDesktops::HWINSTA) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.CloseWindowStation(hWinSta)
    {% end %}
  end

  def setProcessWindowStation(hWinSta : Win32cr::System::StationsAndDesktops::HWINSTA) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetProcessWindowStation(hWinSta)
    {% end %}
  end

  def getProcessWindowStation : Win32cr::System::StationsAndDesktops::HWINSTA
    {% if !flag?(:docs) %}
    C.GetProcessWindowStation
    {% end %}
  end

  def getUserObjectInformationA(hObj : Win32cr::Foundation::HANDLE, nIndex : Win32cr::System::StationsAndDesktops::USER_OBJECT_INFORMATION_INDEX, pvInfo : Void*, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetUserObjectInformationA(hObj, nIndex, pvInfo, nLength, lpnLengthNeeded)
    {% end %}
  end

  def getUserObjectInformationW(hObj : Win32cr::Foundation::HANDLE, nIndex : Win32cr::System::StationsAndDesktops::USER_OBJECT_INFORMATION_INDEX, pvInfo : Void*, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetUserObjectInformationW(hObj, nIndex, pvInfo, nLength, lpnLengthNeeded)
    {% end %}
  end

  def setUserObjectInformationA(hObj : Win32cr::Foundation::HANDLE, nIndex : Int32, pvInfo : Void*, nLength : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetUserObjectInformationA(hObj, nIndex, pvInfo, nLength)
    {% end %}
  end

  def setUserObjectInformationW(hObj : Win32cr::Foundation::HANDLE, nIndex : Int32, pvInfo : Void*, nLength : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetUserObjectInformationW(hObj, nIndex, pvInfo, nLength)
    {% end %}
  end

  def broadcastSystemMessageExA(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pbsmInfo : Win32cr::System::StationsAndDesktops::BSMINFO*) : Int32
    {% if !flag?(:docs) %}
    C.BroadcastSystemMessageExA(flags, lpInfo, msg, wParam, lParam, pbsmInfo)
    {% end %}
  end

  def broadcastSystemMessageExW(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pbsmInfo : Win32cr::System::StationsAndDesktops::BSMINFO*) : Int32
    {% if !flag?(:docs) %}
    C.BroadcastSystemMessageExW(flags, lpInfo, msg, wParam, lParam, pbsmInfo)
    {% end %}
  end

  def broadcastSystemMessageA(flags : UInt32, lpInfo : UInt32*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Int32
    {% if !flag?(:docs) %}
    C.BroadcastSystemMessageA(flags, lpInfo, msg, wParam, lParam)
    {% end %}
  end

  def broadcastSystemMessageW(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Int32
    {% if !flag?(:docs) %}
    C.BroadcastSystemMessageW(flags, lpInfo, msg, wParam, lParam)
    {% end %}
  end

  @[Link("user32")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun CreateDesktopA(lpszDesktop : Win32cr::Foundation::PSTR, lpszDevice : Win32cr::Foundation::PSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun CreateDesktopW(lpszDesktop : Win32cr::Foundation::PWSTR, lpszDevice : Win32cr::Foundation::PWSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEW*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun CreateDesktopExA(lpszDesktop : Win32cr::Foundation::PSTR, lpszDevice : Win32cr::Foundation::PSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*, ulHeapSize : UInt32, pvoid : Void*) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun CreateDesktopExW(lpszDesktop : Win32cr::Foundation::PWSTR, lpszDevice : Win32cr::Foundation::PWSTR, pDevmode : Win32cr::Graphics::Gdi::DEVMODEW*, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*, ulHeapSize : UInt32, pvoid : Void*) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun OpenDesktopA(lpszDesktop : Win32cr::Foundation::PSTR, dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun OpenDesktopW(lpszDesktop : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun OpenInputDesktop(dwFlags : UInt32, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun EnumDesktopsA(hwinsta : Win32cr::System::StationsAndDesktops::HWINSTA, lpEnumFunc : Win32cr::System::StationsAndDesktops::DESKTOPENUMPROCA, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumDesktopsW(hwinsta : Win32cr::System::StationsAndDesktops::HWINSTA, lpEnumFunc : Win32cr::System::StationsAndDesktops::DESKTOPENUMPROCW, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumDesktopWindows(hDesktop : Win32cr::System::StationsAndDesktops::HDESK, lpfn : Win32cr::UI::WindowsAndMessaging::WNDENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SwitchDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CloseDesktop(hDesktop : Win32cr::System::StationsAndDesktops::HDESK) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadDesktop(dwThreadId : UInt32) : Win32cr::System::StationsAndDesktops::HDESK

    # :nodoc:
    fun CreateWindowStationA(lpwinsta : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HWINSTA

    # :nodoc:
    fun CreateWindowStationW(lpwinsta : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32, lpsa : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::System::StationsAndDesktops::HWINSTA

    # :nodoc:
    fun OpenWindowStationA(lpszWinSta : Win32cr::Foundation::PSTR, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HWINSTA

    # :nodoc:
    fun OpenWindowStationW(lpszWinSta : Win32cr::Foundation::PWSTR, fInherit : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::System::StationsAndDesktops::HWINSTA

    # :nodoc:
    fun EnumWindowStationsA(lpEnumFunc : Win32cr::System::StationsAndDesktops::WINSTAENUMPROCA, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumWindowStationsW(lpEnumFunc : Win32cr::System::StationsAndDesktops::WINSTAENUMPROCW, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CloseWindowStation(hWinSta : Win32cr::System::StationsAndDesktops::HWINSTA) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessWindowStation(hWinSta : Win32cr::System::StationsAndDesktops::HWINSTA) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessWindowStation : Win32cr::System::StationsAndDesktops::HWINSTA

    # :nodoc:
    fun GetUserObjectInformationA(hObj : Win32cr::Foundation::HANDLE, nIndex : Win32cr::System::StationsAndDesktops::USER_OBJECT_INFORMATION_INDEX, pvInfo : Void*, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetUserObjectInformationW(hObj : Win32cr::Foundation::HANDLE, nIndex : Win32cr::System::StationsAndDesktops::USER_OBJECT_INFORMATION_INDEX, pvInfo : Void*, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetUserObjectInformationA(hObj : Win32cr::Foundation::HANDLE, nIndex : Int32, pvInfo : Void*, nLength : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetUserObjectInformationW(hObj : Win32cr::Foundation::HANDLE, nIndex : Int32, pvInfo : Void*, nLength : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun BroadcastSystemMessageExA(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pbsmInfo : Win32cr::System::StationsAndDesktops::BSMINFO*) : Int32

    # :nodoc:
    fun BroadcastSystemMessageExW(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pbsmInfo : Win32cr::System::StationsAndDesktops::BSMINFO*) : Int32

    # :nodoc:
    fun BroadcastSystemMessageA(flags : UInt32, lpInfo : UInt32*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Int32

    # :nodoc:
    fun BroadcastSystemMessageW(flags : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_FLAGS, lpInfo : Win32cr::System::StationsAndDesktops::BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Int32

  end
  {% end %}
end