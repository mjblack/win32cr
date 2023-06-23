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

  struct ICoreFrameworkInputViewInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  ICoreFrameworkInputViewInterop_GUID = "0e3da342-b11c-484b-9c1c-be0d61c2f6c5"
  IID_ICoreFrameworkInputViewInterop = LibC::GUID.new(0xe3da342_u32, 0xb11c_u16, 0x484b_u16, StaticArray[0x9c_u8, 0x1c_u8, 0xbe_u8, 0xd_u8, 0x61_u8, 0xc2_u8, 0xf6_u8, 0xc5_u8])
  struct ICoreFrameworkInputViewInterop
    lpVtbl : ICoreFrameworkInputViewInteropVTbl*
  end

end
struct LibWin32::ICoreFrameworkInputViewInterop
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
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, coreframeworkinputview : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, coreframeworkinputview)
  end
end
