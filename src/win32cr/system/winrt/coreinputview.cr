require "../../system/winrt.cr"
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

  struct ICoreFrameworkInputViewInteropVTbl
    query_interface : Proc(ICoreFrameworkInputViewInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICoreFrameworkInputViewInterop*, UInt32)
    release : Proc(ICoreFrameworkInputViewInterop*, UInt32)
    get_iids : Proc(ICoreFrameworkInputViewInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ICoreFrameworkInputViewInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(ICoreFrameworkInputViewInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(ICoreFrameworkInputViewInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  ICoreFrameworkInputViewInterop_GUID = LibC::GUID.new("0e3da342-b11c-484b-9c1c-be0d61c2f6c5")
  CLSID_ICoreFrameworkInputViewInterop = "0e3da342-b11c-484b-9c1c-be0d61c2f6c5"
  struct ICoreFrameworkInputViewInterop
    lpVtbl : ICoreFrameworkInputViewInteropVTbl*
  end

end
