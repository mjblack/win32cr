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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_for_window : UInt64
  end

  IRadialControllerInterop_GUID = "1b0535c9-57ad-45c1-9d79-ad5c34360513"
  IID_IRadialControllerInterop = LibC::GUID.new(0x1b0535c9_u32, 0x57ad_u16, 0x45c1_u16, StaticArray[0x9d_u8, 0x79_u8, 0xad_u8, 0x5c_u8, 0x34_u8, 0x36_u8, 0x5_u8, 0x13_u8])
  struct IRadialControllerInterop
    lpVtbl : IRadialControllerInteropVTbl*
  end

  struct IRadialControllerConfigurationInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  IRadialControllerConfigurationInterop_GUID = "787cdaac-3186-476d-87e4-b9374a7b9970"
  IID_IRadialControllerConfigurationInterop = LibC::GUID.new(0x787cdaac_u32, 0x3186_u16, 0x476d_u16, StaticArray[0x87_u8, 0xe4_u8, 0xb9_u8, 0x37_u8, 0x4a_u8, 0x7b_u8, 0x99_u8, 0x70_u8])
  struct IRadialControllerConfigurationInterop
    lpVtbl : IRadialControllerConfigurationInteropVTbl*
  end

  struct IRadialControllerIndependentInputSourceInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_for_window : UInt64
  end

  IRadialControllerIndependentInputSourceInterop_GUID = "3d577eff-4cee-11e6-b535-001bdc06ab3b"
  IID_IRadialControllerIndependentInputSourceInterop = LibC::GUID.new(0x3d577eff_u32, 0x4cee_u16, 0x11e6_u16, StaticArray[0xb5_u8, 0x35_u8, 0x0_u8, 0x1b_u8, 0xdc_u8, 0x6_u8, 0xab_u8, 0x3b_u8])
  struct IRadialControllerIndependentInputSourceInterop
    lpVtbl : IRadialControllerIndependentInputSourceInteropVTbl*
  end

end
struct LibWin32::IRadialControllerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def create_for_window(hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(hwnd, riid, ppv)
  end
end
struct LibWin32::IRadialControllerConfigurationInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(hwnd, riid, ppv)
  end
end
struct LibWin32::IRadialControllerIndependentInputSourceInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def create_for_window(hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(hwnd, riid, ppv)
  end
end
