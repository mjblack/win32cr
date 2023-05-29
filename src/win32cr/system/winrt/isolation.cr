require "../../system/com.cr"
require "../../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  struct IIsolatedEnvironmentInteropVTbl
    query_interface : Proc(IIsolatedEnvironmentInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIsolatedEnvironmentInterop*, UInt32)
    release : Proc(IIsolatedEnvironmentInterop*, UInt32)
    get_host_hwnd_interop : Proc(IIsolatedEnvironmentInterop*, LibC::HANDLE, HANDLE*, HRESULT)
  end

  struct IIsolatedEnvironmentInterop
    lpVtbl : IIsolatedEnvironmentInteropVTbl*
  end

end
