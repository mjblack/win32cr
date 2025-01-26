require "./../com.cr"
require "./../../foundation.cr"
require "./../win_rt.cr"
require "./../../security.cr"

module Win32cr::System::WinRT::Display


  @[Extern]
  record IDisplayDeviceInteropVtbl,
    query_interface : Proc(IDisplayDeviceInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDisplayDeviceInterop*, UInt32),
    release : Proc(IDisplayDeviceInterop*, UInt32),
    create_shared_handle : Proc(IDisplayDeviceInterop*, Void*, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::System::WinRT::HSTRING, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    open_shared_handle : Proc(IDisplayDeviceInterop*, Win32cr::Foundation::HANDLE, LibC::GUID, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDisplayDeviceInterop, lpVtbl : IDisplayDeviceInteropVtbl* do
    GUID = LibC::GUID.new(0x64338358_u32, 0x366a_u16, 0x471b_u16, StaticArray[0xbd_u8, 0x56_u8, 0xdd_u8, 0x8e_u8, 0xf4_u8, 0x8e_u8, 0x43_u8, 0x9b_u8])
    def query_interface(this : IDisplayDeviceInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDisplayDeviceInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDisplayDeviceInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_shared_handle(this : IDisplayDeviceInterop*, pObject : Void*, pSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, access : UInt32, name : Win32cr::System::WinRT::HSTRING, pHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_shared_handle.call(this, pObject, pSecurityAttributes, access, name, pHandle)
    end
    def open_shared_handle(this : IDisplayDeviceInterop*, nt_handle : Win32cr::Foundation::HANDLE, riid : LibC::GUID, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_shared_handle.call(this, nt_handle, riid, ppvObj)
    end

  end

  @[Extern]
  record IDisplayPathInteropVtbl,
    query_interface : Proc(IDisplayPathInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDisplayPathInterop*, UInt32),
    release : Proc(IDisplayPathInterop*, UInt32),
    create_source_presentation_handle : Proc(IDisplayPathInterop*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_source_id : Proc(IDisplayPathInterop*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDisplayPathInterop, lpVtbl : IDisplayPathInteropVtbl* do
    GUID = LibC::GUID.new(0xa6ba4205_u32, 0xe59e_u16, 0x4e71_u16, StaticArray[0xb2_u8, 0x5b_u8, 0x4e_u8, 0x43_u8, 0x6d_u8, 0x21_u8, 0xee_u8, 0x3d_u8])
    def query_interface(this : IDisplayPathInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDisplayPathInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDisplayPathInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_source_presentation_handle(this : IDisplayPathInterop*, pValue : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_source_presentation_handle.call(this, pValue)
    end
    def get_source_id(this : IDisplayPathInterop*, pSourceId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_id.call(this, pSourceId)
    end

  end

end