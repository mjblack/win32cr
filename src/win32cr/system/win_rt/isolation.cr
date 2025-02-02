require "./../com.cr"
require "./../../foundation.cr"

module Win32cr::System::WinRT::Isolation
  extend self


  @[Extern]
  record IIsolatedEnvironmentInteropVtbl,
    query_interface : Proc(IIsolatedEnvironmentInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIsolatedEnvironmentInterop*, UInt32),
    release : Proc(IIsolatedEnvironmentInterop*, UInt32),
    get_host_hwnd_interop : Proc(IIsolatedEnvironmentInterop*, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIsolatedEnvironmentInterop, lpVtbl : IIsolatedEnvironmentInteropVtbl* do
    GUID = LibC::GUID.new(0x85713c2e_u32, 0x8e62_u16, 0x46c5_u16, StaticArray[0x8d_u8, 0xe2_u8, 0xc6_u8, 0x47_u8, 0xe1_u8, 0xd5_u8, 0x46_u8, 0x36_u8])
    def query_interface(this : IIsolatedEnvironmentInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIsolatedEnvironmentInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIsolatedEnvironmentInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_host_hwnd_interop(this : IIsolatedEnvironmentInterop*, containerHwnd : Win32cr::Foundation::HWND, hostHwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_hwnd_interop.call(this, containerHwnd, hostHwnd)
    end

  end

end