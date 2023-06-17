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

  IDisplayDeviceInterop_GUID = "64338358-366a-471b-bd56-dd8ef48e439b"
  IID_IDisplayDeviceInterop = LibC::GUID.new(0x64338358_u32, 0x366a_u16, 0x471b_u16, StaticArray[0xbd_u8, 0x56_u8, 0xdd_u8, 0x8e_u8, 0xf4_u8, 0x8e_u8, 0x43_u8, 0x9b_u8])
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

  IDisplayPathInterop_GUID = "a6ba4205-e59e-4e71-b25b-4e436d21ee3d"
  IID_IDisplayPathInterop = LibC::GUID.new(0xa6ba4205_u32, 0xe59e_u16, 0x4e71_u16, StaticArray[0xb2_u8, 0x5b_u8, 0x4e_u8, 0x43_u8, 0x6d_u8, 0x21_u8, 0xee_u8, 0x3d_u8])
  struct IDisplayPathInterop
    lpVtbl : IDisplayPathInteropVTbl*
  end

end
