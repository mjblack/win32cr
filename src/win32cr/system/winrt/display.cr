require "../../system/com.cr"
require "../../foundation.cr"
require "../../system/winrt.cr"
require "../../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  struct IDisplayDeviceInteropVTbl
    query_interface : Proc(IDisplayDeviceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDisplayDeviceInterop*, UInt32)
    release : Proc(IDisplayDeviceInterop*, UInt32)
    create_shared_handle : Proc(IDisplayDeviceInterop*, IInspectable, SECURITY_ATTRIBUTES*, UInt32, HSTRING, LibC::HANDLE*, HRESULT)
    open_shared_handle : Proc(IDisplayDeviceInterop*, LibC::HANDLE, Guid, Void**, HRESULT)
  end

  struct IDisplayDeviceInterop
    lpVtbl : IDisplayDeviceInteropVTbl*
  end

  struct IDisplayPathInteropVTbl
    query_interface : Proc(IDisplayPathInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDisplayPathInterop*, UInt32)
    release : Proc(IDisplayPathInterop*, UInt32)
    create_source_presentation_handle : Proc(IDisplayPathInterop*, LibC::HANDLE*, HRESULT)
    get_source_id : Proc(IDisplayPathInterop*, UInt32*, HRESULT)
  end

  struct IDisplayPathInterop
    lpVtbl : IDisplayPathInteropVTbl*
  end

end
