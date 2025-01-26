require "./../com.cr"
require "./../../foundation.cr"
require "./../../graphics/dxgi.cr"
require "./../win_rt.cr"

module Win32cr::System::WinRT::Direct3D11


  @[Extern]
  record IDirect3DDxgiInterfaceAccessVtbl,
    query_interface : Proc(IDirect3DDxgiInterfaceAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirect3DDxgiInterfaceAccess*, UInt32),
    release : Proc(IDirect3DDxgiInterfaceAccess*, UInt32),
    get_interface : Proc(IDirect3DDxgiInterfaceAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirect3DDxgiInterfaceAccess, lpVtbl : IDirect3DDxgiInterfaceAccessVtbl* do
    GUID = LibC::GUID.new(0xa9b3d012_u32, 0x3df2_u16, 0x4ee3_u16, StaticArray[0xb8_u8, 0xd1_u8, 0x86_u8, 0x95_u8, 0xf4_u8, 0x57_u8, 0xd3_u8, 0xc1_u8])
    def query_interface(this : IDirect3DDxgiInterfaceAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirect3DDxgiInterfaceAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirect3DDxgiInterfaceAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_interface(this : IDirect3DDxgiInterfaceAccess*, iid : LibC::GUID*, p : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface.call(this, iid, p)
    end

  end

  @[Link("d3d11")]
  lib C
    fun CreateDirect3D11DeviceFromDXGIDevice(dxgiDevice : Void*, graphicsDevice : Void**) : Win32cr::Foundation::HRESULT

    fun CreateDirect3D11SurfaceFromDXGISurface(dgxiSurface : Void*, graphicsSurface : Void**) : Win32cr::Foundation::HRESULT

  end
end