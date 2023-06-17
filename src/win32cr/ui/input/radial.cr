require "../../system/winrt.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
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

  IRadialControllerInterop_GUID = "1b0535c9-57ad-45c1-9d79-ad5c34360513"
  IID_IRadialControllerInterop = LibC::GUID.new(0x1b0535c9_u32, 0x57ad_u16, 0x45c1_u16, StaticArray[0x9d_u8, 0x79_u8, 0xad_u8, 0x5c_u8, 0x34_u8, 0x36_u8, 0x5_u8, 0x13_u8])
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

  IRadialControllerConfigurationInterop_GUID = "787cdaac-3186-476d-87e4-b9374a7b9970"
  IID_IRadialControllerConfigurationInterop = LibC::GUID.new(0x787cdaac_u32, 0x3186_u16, 0x476d_u16, StaticArray[0x87_u8, 0xe4_u8, 0xb9_u8, 0x37_u8, 0x4a_u8, 0x7b_u8, 0x99_u8, 0x70_u8])
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

  IRadialControllerIndependentInputSourceInterop_GUID = "3d577eff-4cee-11e6-b535-001bdc06ab3b"
  IID_IRadialControllerIndependentInputSourceInterop = LibC::GUID.new(0x3d577eff_u32, 0x4cee_u16, 0x11e6_u16, StaticArray[0xb5_u8, 0x35_u8, 0x0_u8, 0x1b_u8, 0xdc_u8, 0x6_u8, 0xab_u8, 0x3b_u8])
  struct IRadialControllerIndependentInputSourceInterop
    lpVtbl : IRadialControllerIndependentInputSourceInteropVTbl*
  end

end