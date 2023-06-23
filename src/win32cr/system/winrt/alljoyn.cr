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

  struct IWindowsDevicesAllJoynBusAttachmentInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_win32_handle : UInt64
  end

  IWindowsDevicesAllJoynBusAttachmentInterop_GUID = "fd89c65b-b50e-4a19-9d0c-b42b783281cd"
  IID_IWindowsDevicesAllJoynBusAttachmentInterop = LibC::GUID.new(0xfd89c65b_u32, 0xb50e_u16, 0x4a19_u16, StaticArray[0x9d_u8, 0xc_u8, 0xb4_u8, 0x2b_u8, 0x78_u8, 0x32_u8, 0x81_u8, 0xcd_u8])
  struct IWindowsDevicesAllJoynBusAttachmentInterop
    lpVtbl : IWindowsDevicesAllJoynBusAttachmentInteropVTbl*
  end

  struct IWindowsDevicesAllJoynBusAttachmentFactoryInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_from_win32_handle : UInt64
  end

  IWindowsDevicesAllJoynBusAttachmentFactoryInterop_GUID = "4b8f7505-b239-4e7b-88af-f6682575d861"
  IID_IWindowsDevicesAllJoynBusAttachmentFactoryInterop = LibC::GUID.new(0x4b8f7505_u32, 0xb239_u16, 0x4e7b_u16, StaticArray[0x88_u8, 0xaf_u8, 0xf6_u8, 0x68_u8, 0x25_u8, 0x75_u8, 0xd8_u8, 0x61_u8])
  struct IWindowsDevicesAllJoynBusAttachmentFactoryInterop
    lpVtbl : IWindowsDevicesAllJoynBusAttachmentFactoryInteropVTbl*
  end

  struct IWindowsDevicesAllJoynBusObjectInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    add_property_get_handler : UInt64
    add_property_set_handler : UInt64
    get_win32_handle : UInt64
  end

  IWindowsDevicesAllJoynBusObjectInterop_GUID = "d78aa3d5-5054-428f-99f2-ec3a5de3c3bc"
  IID_IWindowsDevicesAllJoynBusObjectInterop = LibC::GUID.new(0xd78aa3d5_u32, 0x5054_u16, 0x428f_u16, StaticArray[0x99_u8, 0xf2_u8, 0xec_u8, 0x3a_u8, 0x5d_u8, 0xe3_u8, 0xc3_u8, 0xbc_u8])
  struct IWindowsDevicesAllJoynBusObjectInterop
    lpVtbl : IWindowsDevicesAllJoynBusObjectInteropVTbl*
  end

  struct IWindowsDevicesAllJoynBusObjectFactoryInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_from_win32_handle : UInt64
  end

  IWindowsDevicesAllJoynBusObjectFactoryInterop_GUID = "6174e506-8b95-4e36-95c0-b88fed34938c"
  IID_IWindowsDevicesAllJoynBusObjectFactoryInterop = LibC::GUID.new(0x6174e506_u32, 0x8b95_u16, 0x4e36_u16, StaticArray[0x95_u8, 0xc0_u8, 0xb8_u8, 0x8f_u8, 0xed_u8, 0x34_u8, 0x93_u8, 0x8c_u8])
  struct IWindowsDevicesAllJoynBusObjectFactoryInterop
    lpVtbl : IWindowsDevicesAllJoynBusObjectFactoryInteropVTbl*
  end

end
struct LibWin32::IWindowsDevicesAllJoynBusAttachmentInterop
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
  def get_win32_handle(value : UInt64*) : HRESULT
    @lpVtbl.value.get_win32_handle.unsafe_as(Proc(UInt64*, HRESULT)).call(value)
  end
end
struct LibWin32::IWindowsDevicesAllJoynBusAttachmentFactoryInterop
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
  def create_from_win32_handle(win32handle : UInt64, enableaboutdata : UInt8, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_win32_handle.unsafe_as(Proc(UInt64, UInt8, Guid*, Void**, HRESULT)).call(win32handle, enableaboutdata, riid, ppv)
  end
end
struct LibWin32::IWindowsDevicesAllJoynBusObjectInterop
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
  def add_property_get_handler(context : Void*, interfacename : HSTRING, callback : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.add_property_get_handler.unsafe_as(Proc(Void*, HSTRING, LibC::IntPtrT, HRESULT)).call(context, interfacename, callback)
  end
  def add_property_set_handler(context : Void*, interfacename : HSTRING, callback : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.add_property_set_handler.unsafe_as(Proc(Void*, HSTRING, LibC::IntPtrT, HRESULT)).call(context, interfacename, callback)
  end
  def get_win32_handle(value : UInt64*) : HRESULT
    @lpVtbl.value.get_win32_handle.unsafe_as(Proc(UInt64*, HRESULT)).call(value)
  end
end
struct LibWin32::IWindowsDevicesAllJoynBusObjectFactoryInterop
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
  def create_from_win32_handle(win32handle : UInt64, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_win32_handle.unsafe_as(Proc(UInt64, Guid*, Void**, HRESULT)).call(win32handle, riid, ppv)
  end
end
