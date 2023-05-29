require "../foundation.cr"
require "../graphics/gdi.cr"
require "../security.cr"
require "../ui/windowsandmessaging.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
lib LibWin32
  alias HWINSTA = LibC::IntPtrT
  alias HDESK = LibC::IntPtrT

  alias WINSTAENUMPROCA = Proc(PSTR, LPARAM, LibC::BOOL)
  alias WINSTAENUMPROCW = Proc(LibC::LPWSTR, LPARAM, LibC::BOOL)
  alias DESKTOPENUMPROCA = Proc(PSTR, LPARAM, LibC::BOOL)
  alias DESKTOPENUMPROCW = Proc(LibC::LPWSTR, LPARAM, LibC::BOOL)


  enum BROADCAST_SYSTEM_MESSAGE_FLAGS : UInt32
    BSF_ALLOWSFW = 128
    BSF_FLUSHDISK = 4
    BSF_FORCEIFHUNG = 32
    BSF_IGNORECURRENTTASK = 2
    BSF_NOHANG = 8
    BSF_NOTIMEOUTIFNOTHUNG = 64
    BSF_POSTMESSAGE = 16
    BSF_QUERY = 1
    BSF_SENDNOTIFYMESSAGE = 256
    BSF_LUID = 1024
    BSF_RETURNHDESK = 512
  end

  enum BROADCAST_SYSTEM_MESSAGE_INFO : UInt32
    BSM_ALLCOMPONENTS = 0
    BSM_ALLDESKTOPS = 16
    BSM_APPLICATIONS = 8
  end

  enum USER_OBJECT_INFORMATION_INDEX : UInt32
    UOI_FLAGS = 1
    UOI_HEAPSIZE = 5
    UOI_IO = 6
    UOI_NAME = 2
    UOI_TYPE = 3
    UOI_USER_SID = 4
  end

  struct USEROBJECTFLAGS
    f_inherit : LibC::BOOL
    f_reserved : LibC::BOOL
    dw_flags : UInt32
  end
  struct BSMINFO
    cb_size : UInt32
    hdesk : HDESK
    hwnd : HANDLE
    luid : LUID
  end


  # Params # lpszdesktop : PSTR [In],lpszdevice : PSTR [In],pdevmode : DEVMODEA* [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In],lpsa : SECURITY_ATTRIBUTES* [In]
  fun CreateDesktopA(lpszdesktop : PSTR, lpszdevice : PSTR, pdevmode : DEVMODEA*, dwflags : UInt32, dwdesiredaccess : UInt32, lpsa : SECURITY_ATTRIBUTES*) : HDESK

  # Params # lpszdesktop : LibC::LPWSTR [In],lpszdevice : LibC::LPWSTR [In],pdevmode : DEVMODEW* [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In],lpsa : SECURITY_ATTRIBUTES* [In]
  fun CreateDesktopW(lpszdesktop : LibC::LPWSTR, lpszdevice : LibC::LPWSTR, pdevmode : DEVMODEW*, dwflags : UInt32, dwdesiredaccess : UInt32, lpsa : SECURITY_ATTRIBUTES*) : HDESK

  # Params # lpszdesktop : PSTR [In],lpszdevice : PSTR [In],pdevmode : DEVMODEA* [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In],lpsa : SECURITY_ATTRIBUTES* [In],ulheapsize : UInt32 [In],pvoid : Void* [In]
  fun CreateDesktopExA(lpszdesktop : PSTR, lpszdevice : PSTR, pdevmode : DEVMODEA*, dwflags : UInt32, dwdesiredaccess : UInt32, lpsa : SECURITY_ATTRIBUTES*, ulheapsize : UInt32, pvoid : Void*) : HDESK

  # Params # lpszdesktop : LibC::LPWSTR [In],lpszdevice : LibC::LPWSTR [In],pdevmode : DEVMODEW* [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In],lpsa : SECURITY_ATTRIBUTES* [In],ulheapsize : UInt32 [In],pvoid : Void* [In]
  fun CreateDesktopExW(lpszdesktop : LibC::LPWSTR, lpszdevice : LibC::LPWSTR, pdevmode : DEVMODEW*, dwflags : UInt32, dwdesiredaccess : UInt32, lpsa : SECURITY_ATTRIBUTES*, ulheapsize : UInt32, pvoid : Void*) : HDESK

  # Params # lpszdesktop : PSTR [In],dwflags : UInt32 [In],finherit : LibC::BOOL [In],dwdesiredaccess : UInt32 [In]
  fun OpenDesktopA(lpszdesktop : PSTR, dwflags : UInt32, finherit : LibC::BOOL, dwdesiredaccess : UInt32) : HDESK

  # Params # lpszdesktop : LibC::LPWSTR [In],dwflags : UInt32 [In],finherit : LibC::BOOL [In],dwdesiredaccess : UInt32 [In]
  fun OpenDesktopW(lpszdesktop : LibC::LPWSTR, dwflags : UInt32, finherit : LibC::BOOL, dwdesiredaccess : UInt32) : HDESK

  # Params # dwflags : UInt32 [In],finherit : LibC::BOOL [In],dwdesiredaccess : UInt32 [In]
  fun OpenInputDesktop(dwflags : UInt32, finherit : LibC::BOOL, dwdesiredaccess : UInt32) : HDESK

  # Params # hwinsta : HWINSTA [In],lpenumfunc : DESKTOPENUMPROCA [In],lparam : LPARAM [In]
  fun EnumDesktopsA(hwinsta : HWINSTA, lpenumfunc : DESKTOPENUMPROCA, lparam : LPARAM) : LibC::BOOL

  # Params # hwinsta : HWINSTA [In],lpenumfunc : DESKTOPENUMPROCW [In],lparam : LPARAM [In]
  fun EnumDesktopsW(hwinsta : HWINSTA, lpenumfunc : DESKTOPENUMPROCW, lparam : LPARAM) : LibC::BOOL

  # Params # hdesktop : HDESK [In],lpfn : WNDENUMPROC [In],lparam : LPARAM [In]
  fun EnumDesktopWindows(hdesktop : HDESK, lpfn : WNDENUMPROC, lparam : LPARAM) : LibC::BOOL

  # Params # hdesktop : HDESK [In]
  fun SwitchDesktop(hdesktop : HDESK) : LibC::BOOL

  # Params # hdesktop : HDESK [In]
  fun SetThreadDesktop(hdesktop : HDESK) : LibC::BOOL

  # Params # hdesktop : HDESK [In]
  fun CloseDesktop(hdesktop : HDESK) : LibC::BOOL

  # Params # dwthreadid : UInt32 [In]
  fun GetThreadDesktop(dwthreadid : UInt32) : HDESK

  # Params # lpwinsta : PSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In],lpsa : SECURITY_ATTRIBUTES* [In]
  fun CreateWindowStationA(lpwinsta : PSTR, dwflags : UInt32, dwdesiredaccess : UInt32, lpsa : SECURITY_ATTRIBUTES*) : HWINSTA

  # Params # lpwinsta : LibC::LPWSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In],lpsa : SECURITY_ATTRIBUTES* [In]
  fun CreateWindowStationW(lpwinsta : LibC::LPWSTR, dwflags : UInt32, dwdesiredaccess : UInt32, lpsa : SECURITY_ATTRIBUTES*) : HWINSTA

  # Params # lpszwinsta : PSTR [In],finherit : LibC::BOOL [In],dwdesiredaccess : UInt32 [In]
  fun OpenWindowStationA(lpszwinsta : PSTR, finherit : LibC::BOOL, dwdesiredaccess : UInt32) : HWINSTA

  # Params # lpszwinsta : LibC::LPWSTR [In],finherit : LibC::BOOL [In],dwdesiredaccess : UInt32 [In]
  fun OpenWindowStationW(lpszwinsta : LibC::LPWSTR, finherit : LibC::BOOL, dwdesiredaccess : UInt32) : HWINSTA

  # Params # lpenumfunc : WINSTAENUMPROCA [In],lparam : LPARAM [In]
  fun EnumWindowStationsA(lpenumfunc : WINSTAENUMPROCA, lparam : LPARAM) : LibC::BOOL

  # Params # lpenumfunc : WINSTAENUMPROCW [In],lparam : LPARAM [In]
  fun EnumWindowStationsW(lpenumfunc : WINSTAENUMPROCW, lparam : LPARAM) : LibC::BOOL

  # Params # hwinsta : HWINSTA [In]
  fun CloseWindowStation(hwinsta : HWINSTA) : LibC::BOOL

  # Params # hwinsta : HWINSTA [In]
  fun SetProcessWindowStation(hwinsta : HWINSTA) : LibC::BOOL

  # Params # 
  fun GetProcessWindowStation : HWINSTA

  # Params # hobj : LibC::HANDLE [In],nindex : USER_OBJECT_INFORMATION_INDEX [In],pvinfo : Void* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun GetUserObjectInformationA(hobj : LibC::HANDLE, nindex : USER_OBJECT_INFORMATION_INDEX, pvinfo : Void*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # hobj : LibC::HANDLE [In],nindex : USER_OBJECT_INFORMATION_INDEX [In],pvinfo : Void* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun GetUserObjectInformationW(hobj : LibC::HANDLE, nindex : USER_OBJECT_INFORMATION_INDEX, pvinfo : Void*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # hobj : LibC::HANDLE [In],nindex : Int32 [In],pvinfo : Void* [In],nlength : UInt32 [In]
  fun SetUserObjectInformationA(hobj : LibC::HANDLE, nindex : Int32, pvinfo : Void*, nlength : UInt32) : LibC::BOOL

  # Params # hobj : LibC::HANDLE [In],nindex : Int32 [In],pvinfo : Void* [In],nlength : UInt32 [In]
  fun SetUserObjectInformationW(hobj : LibC::HANDLE, nindex : Int32, pvinfo : Void*, nlength : UInt32) : LibC::BOOL

  # Params # flags : BROADCAST_SYSTEM_MESSAGE_FLAGS [In],lpinfo : BROADCAST_SYSTEM_MESSAGE_INFO* [In],msg : UInt32 [In],wparam : LibC::UINT_PTR [In],lparam : LPARAM [In],pbsminfo : BSMINFO* [In]
  fun BroadcastSystemMessageExA(flags : BROADCAST_SYSTEM_MESSAGE_FLAGS, lpinfo : BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM, pbsminfo : BSMINFO*) : Int32

  # Params # flags : BROADCAST_SYSTEM_MESSAGE_FLAGS [In],lpinfo : BROADCAST_SYSTEM_MESSAGE_INFO* [In],msg : UInt32 [In],wparam : LibC::UINT_PTR [In],lparam : LPARAM [In],pbsminfo : BSMINFO* [In]
  fun BroadcastSystemMessageExW(flags : BROADCAST_SYSTEM_MESSAGE_FLAGS, lpinfo : BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM, pbsminfo : BSMINFO*) : Int32

  # Params # flags : UInt32 [In],lpinfo : UInt32* [In],msg : UInt32 [In],wparam : LibC::UINT_PTR [In],lparam : LPARAM [In]
  fun BroadcastSystemMessageA(flags : UInt32, lpinfo : UInt32*, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : Int32

  # Params # flags : BROADCAST_SYSTEM_MESSAGE_FLAGS [In],lpinfo : BROADCAST_SYSTEM_MESSAGE_INFO* [In],msg : UInt32 [In],wparam : LibC::UINT_PTR [In],lparam : LPARAM [In]
  fun BroadcastSystemMessageW(flags : BROADCAST_SYSTEM_MESSAGE_FLAGS, lpinfo : BROADCAST_SYSTEM_MESSAGE_INFO*, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : Int32
end
