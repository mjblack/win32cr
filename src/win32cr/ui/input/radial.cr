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

  struct IRadialControllerInteropVTbl
    query_interface : Proc(IRadialControllerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadialControllerInterop*, UInt32)
    release : Proc(IRadialControllerInterop*, UInt32)
    get_iids : Proc(IRadialControllerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IRadialControllerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IRadialControllerInterop*, TrustLevel*, HRESULT)
    create_for_window : Proc(IRadialControllerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IRadialControllerInterop_GUID = LibC::GUID.new("1b0535c9-57ad-45c1-9d79-ad5c34360513")
  CLSID_IRadialControllerInterop = "1b0535c9-57ad-45c1-9d79-ad5c34360513"
  struct IRadialControllerInterop
    lpVtbl : IRadialControllerInteropVTbl*
  end

  struct IRadialControllerConfigurationInteropVTbl
    query_interface : Proc(IRadialControllerConfigurationInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadialControllerConfigurationInterop*, UInt32)
    release : Proc(IRadialControllerConfigurationInterop*, UInt32)
    get_iids : Proc(IRadialControllerConfigurationInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IRadialControllerConfigurationInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IRadialControllerConfigurationInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IRadialControllerConfigurationInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IRadialControllerConfigurationInterop_GUID = LibC::GUID.new("787cdaac-3186-476d-87e4-b9374a7b9970")
  CLSID_IRadialControllerConfigurationInterop = "787cdaac-3186-476d-87e4-b9374a7b9970"
  struct IRadialControllerConfigurationInterop
    lpVtbl : IRadialControllerConfigurationInteropVTbl*
  end

  struct IRadialControllerIndependentInputSourceInteropVTbl
    query_interface : Proc(IRadialControllerIndependentInputSourceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32)
    release : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32)
    get_iids : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IRadialControllerIndependentInputSourceInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IRadialControllerIndependentInputSourceInterop*, TrustLevel*, HRESULT)
    create_for_window : Proc(IRadialControllerIndependentInputSourceInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IRadialControllerIndependentInputSourceInterop_GUID = LibC::GUID.new("3d577eff-4cee-11e6-b535-001bdc06ab3b")
  CLSID_IRadialControllerIndependentInputSourceInterop = "3d577eff-4cee-11e6-b535-001bdc06ab3b"
  struct IRadialControllerIndependentInputSourceInterop
    lpVtbl : IRadialControllerIndependentInputSourceInteropVTbl*
  end

end
