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

  ICoreFrameworkInputViewInterop_GUID = "0e3da342-b11c-484b-9c1c-be0d61c2f6c5"
  IID_ICoreFrameworkInputViewInterop = LibC::GUID.new(0xe3da342_u32, 0xb11c_u16, 0x484b_u16, StaticArray[0x9c_u8, 0x1c_u8, 0xbe_u8, 0xd_u8, 0x61_u8, 0xc2_u8, 0xf6_u8, 0xc5_u8])
  struct ICoreFrameworkInputViewInterop
    lpVtbl : ICoreFrameworkInputViewInteropVTbl*
  end

end
