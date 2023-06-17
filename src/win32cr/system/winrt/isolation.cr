require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  struct IIsolatedEnvironmentInteropVTbl
    query_interface : Proc(IIsolatedEnvironmentInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIsolatedEnvironmentInterop*, UInt32)
    release : Proc(IIsolatedEnvironmentInterop*, UInt32)
    get_host_hwnd_interop : Proc(IIsolatedEnvironmentInterop*, LibC::HANDLE, HANDLE*, HRESULT)
  end

  IIsolatedEnvironmentInterop_GUID = "85713c2e-8e62-46c5-8de2-c647e1d54636"
  IID_IIsolatedEnvironmentInterop = LibC::GUID.new(0x85713c2e_u32, 0x8e62_u16, 0x46c5_u16, StaticArray[0x8d_u8, 0xe2_u8, 0xc6_u8, 0x47_u8, 0xe1_u8, 0xd5_u8, 0x46_u8, 0x36_u8])
  struct IIsolatedEnvironmentInterop
    lpVtbl : IIsolatedEnvironmentInteropVTbl*
  end

end