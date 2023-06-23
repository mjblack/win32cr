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
lib LibWin32

  struct IDisplayDeviceInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_shared_handle : UInt64
    open_shared_handle : UInt64
  end

  IDisplayDeviceInterop_GUID = "64338358-366a-471b-bd56-dd8ef48e439b"
  IID_IDisplayDeviceInterop = LibC::GUID.new(0x64338358_u32, 0x366a_u16, 0x471b_u16, StaticArray[0xbd_u8, 0x56_u8, 0xdd_u8, 0x8e_u8, 0xf4_u8, 0x8e_u8, 0x43_u8, 0x9b_u8])
  struct IDisplayDeviceInterop
    lpVtbl : IDisplayDeviceInteropVTbl*
  end

  struct IDisplayPathInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_source_presentation_handle : UInt64
    get_source_id : UInt64
  end

  IDisplayPathInterop_GUID = "a6ba4205-e59e-4e71-b25b-4e436d21ee3d"
  IID_IDisplayPathInterop = LibC::GUID.new(0xa6ba4205_u32, 0xe59e_u16, 0x4e71_u16, StaticArray[0xb2_u8, 0x5b_u8, 0x4e_u8, 0x43_u8, 0x6d_u8, 0x21_u8, 0xee_u8, 0x3d_u8])
  struct IDisplayPathInterop
    lpVtbl : IDisplayPathInteropVTbl*
  end

end
struct LibWin32::IDisplayDeviceInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_shared_handle(pobject : IInspectable, psecurityattributes : SECURITY_ATTRIBUTES*, access : UInt32, name : HSTRING, phandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.create_shared_handle.unsafe_as(Proc(IInspectable, SECURITY_ATTRIBUTES*, UInt32, HSTRING, LibC::HANDLE*, HRESULT)).call(pobject, psecurityattributes, access, name, phandle)
  end
  def open_shared_handle(nthandle : LibC::HANDLE, riid : Guid, ppvobj : Void**) : HRESULT
    @lpVtbl.value.open_shared_handle.unsafe_as(Proc(LibC::HANDLE, Guid, Void**, HRESULT)).call(nthandle, riid, ppvobj)
  end
end
struct LibWin32::IDisplayPathInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_source_presentation_handle(pvalue : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.create_source_presentation_handle.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(pvalue)
  end
  def get_source_id(psourceid : UInt32*) : HRESULT
    @lpVtbl.value.get_source_id.unsafe_as(Proc(UInt32*, HRESULT)).call(psourceid)
  end
end
