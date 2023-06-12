require "../../system/com.cr"
require "../../foundation.cr"
require "../../system/winrt.cr"
require "../../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32

  struct IDisplayDeviceInteropVTbl
    query_interface : Proc(IDisplayDeviceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDisplayDeviceInterop*, UInt32)
    release : Proc(IDisplayDeviceInterop*, UInt32)
    create_shared_handle : Proc(IDisplayDeviceInterop*, IInspectable, SECURITY_ATTRIBUTES*, UInt32, HSTRING, LibC::HANDLE*, HRESULT)
    open_shared_handle : Proc(IDisplayDeviceInterop*, LibC::HANDLE, Guid, Void**, HRESULT)
  end

  IDisplayDeviceInterop_GUID = LibC::GUID.new("64338358-366a-471b-bd56-dd8ef48e439b")
  CLSID_IDisplayDeviceInterop = "64338358-366a-471b-bd56-dd8ef48e439b"
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

  IDisplayPathInterop_GUID = LibC::GUID.new("a6ba4205-e59e-4e71-b25b-4e436d21ee3d")
  CLSID_IDisplayPathInterop = "a6ba4205-e59e-4e71-b25b-4e436d21ee3d"
  struct IDisplayPathInterop
    lpVtbl : IDisplayPathInteropVTbl*
  end

end
