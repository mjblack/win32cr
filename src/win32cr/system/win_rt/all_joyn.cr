require "./../win_rt.cr"
require "./../../foundation.cr"

module Win32cr::System::WinRT::AllJoyn


  @[Extern]
  record IWindowsDevicesAllJoynBusAttachmentInteropVtbl,
    query_interface : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt32),
    release : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt32),
    get_iids : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_Win32Handle : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsDevicesAllJoynBusAttachmentInterop, lpVtbl : IWindowsDevicesAllJoynBusAttachmentInteropVtbl* do
    GUID = LibC::GUID.new(0xfd89c65b_u32, 0xb50e_u16, 0x4a19_u16, StaticArray[0x9d_u8, 0xc_u8, 0xb4_u8, 0x2b_u8, 0x78_u8, 0x32_u8, 0x81_u8, 0xcd_u8])
    def query_interface(this : IWindowsDevicesAllJoynBusAttachmentInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDevicesAllJoynBusAttachmentInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDevicesAllJoynBusAttachmentInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IWindowsDevicesAllJoynBusAttachmentInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IWindowsDevicesAllJoynBusAttachmentInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IWindowsDevicesAllJoynBusAttachmentInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_Win32Handle(this : IWindowsDevicesAllJoynBusAttachmentInterop*, value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Win32Handle.call(this, value)
    end

  end

  @[Extern]
  record IWindowsDevicesAllJoynBusAttachmentFactoryInteropVtbl,
    query_interface : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt32),
    release : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt32),
    get_iids : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_from_win32_handle : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt64, UInt8, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsDevicesAllJoynBusAttachmentFactoryInterop, lpVtbl : IWindowsDevicesAllJoynBusAttachmentFactoryInteropVtbl* do
    GUID = LibC::GUID.new(0x4b8f7505_u32, 0xb239_u16, 0x4e7b_u16, StaticArray[0x88_u8, 0xaf_u8, 0xf6_u8, 0x68_u8, 0x25_u8, 0x75_u8, 0xd8_u8, 0x61_u8])
    def query_interface(this : IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDevicesAllJoynBusAttachmentFactoryInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDevicesAllJoynBusAttachmentFactoryInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_from_win32_handle(this : IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, win32handle : UInt64, enableAboutData : UInt8, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_win32_handle.call(this, win32handle, enableAboutData, riid, ppv)
    end

  end

  @[Extern]
  record IWindowsDevicesAllJoynBusObjectInteropVtbl,
    query_interface : Proc(IWindowsDevicesAllJoynBusObjectInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt32),
    release : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt32),
    get_iids : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusObjectInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IWindowsDevicesAllJoynBusObjectInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    add_property_get_handler : Proc(IWindowsDevicesAllJoynBusObjectInterop*, Void*, Win32cr::System::WinRT::HSTRING, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    add_property_set_handler : Proc(IWindowsDevicesAllJoynBusObjectInterop*, Void*, Win32cr::System::WinRT::HSTRING, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_Win32Handle : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsDevicesAllJoynBusObjectInterop, lpVtbl : IWindowsDevicesAllJoynBusObjectInteropVtbl* do
    GUID = LibC::GUID.new(0xd78aa3d5_u32, 0x5054_u16, 0x428f_u16, StaticArray[0x99_u8, 0xf2_u8, 0xec_u8, 0x3a_u8, 0x5d_u8, 0xe3_u8, 0xc3_u8, 0xbc_u8])
    def query_interface(this : IWindowsDevicesAllJoynBusObjectInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDevicesAllJoynBusObjectInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDevicesAllJoynBusObjectInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IWindowsDevicesAllJoynBusObjectInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IWindowsDevicesAllJoynBusObjectInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IWindowsDevicesAllJoynBusObjectInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def add_property_get_handler(this : IWindowsDevicesAllJoynBusObjectInterop*, context : Void*, interfaceName : Win32cr::System::WinRT::HSTRING, callback : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_get_handler.call(this, context, interfaceName, callback)
    end
    def add_property_set_handler(this : IWindowsDevicesAllJoynBusObjectInterop*, context : Void*, interfaceName : Win32cr::System::WinRT::HSTRING, callback : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_set_handler.call(this, context, interfaceName, callback)
    end
    def get_Win32Handle(this : IWindowsDevicesAllJoynBusObjectInterop*, value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Win32Handle.call(this, value)
    end

  end

  @[Extern]
  record IWindowsDevicesAllJoynBusObjectFactoryInteropVtbl,
    query_interface : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt32),
    release : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt32),
    get_iids : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_from_win32_handle : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt64, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsDevicesAllJoynBusObjectFactoryInterop, lpVtbl : IWindowsDevicesAllJoynBusObjectFactoryInteropVtbl* do
    GUID = LibC::GUID.new(0x6174e506_u32, 0x8b95_u16, 0x4e36_u16, StaticArray[0x95_u8, 0xc0_u8, 0xb8_u8, 0x8f_u8, 0xed_u8, 0x34_u8, 0x93_u8, 0x8c_u8])
    def query_interface(this : IWindowsDevicesAllJoynBusObjectFactoryInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDevicesAllJoynBusObjectFactoryInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDevicesAllJoynBusObjectFactoryInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IWindowsDevicesAllJoynBusObjectFactoryInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IWindowsDevicesAllJoynBusObjectFactoryInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IWindowsDevicesAllJoynBusObjectFactoryInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_from_win32_handle(this : IWindowsDevicesAllJoynBusObjectFactoryInterop*, win32handle : UInt64, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_win32_handle.call(this, win32handle, riid, ppv)
    end

  end

end