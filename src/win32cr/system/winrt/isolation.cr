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

  struct IIsolatedEnvironmentInterop
    lpVtbl : IIsolatedEnvironmentInteropVTbl*
  end

end
