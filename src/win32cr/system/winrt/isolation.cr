require "../../system/com.cr"
require "../../foundation.cr"

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

  struct IIsolatedEnvironmentInteropVTbl
    query_interface : Proc(IIsolatedEnvironmentInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIsolatedEnvironmentInterop*, UInt32)
    release : Proc(IIsolatedEnvironmentInterop*, UInt32)
    get_host_hwnd_interop : Proc(IIsolatedEnvironmentInterop*, LibC::HANDLE, HANDLE*, HRESULT)
  end

  IIsolatedEnvironmentInterop_GUID = LibC::GUID.new("85713c2e-8e62-46c5-8de2-c647e1d54636")
  CLSID_IIsolatedEnvironmentInterop = "85713c2e-8e62-46c5-8de2-c647e1d54636"
  struct IIsolatedEnvironmentInterop
    lpVtbl : IIsolatedEnvironmentInteropVTbl*
  end

end
