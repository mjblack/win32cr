require "../../system/com.cr"
require "../../foundation.cr"
require "../../graphics/dxgi.cr"
require "../../system/winrt.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:d3d11.dll")]
lib LibWin32

  struct IDirect3DDxgiInterfaceAccessVTbl
    query_interface : Proc(IDirect3DDxgiInterfaceAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirect3DDxgiInterfaceAccess*, UInt32)
    release : Proc(IDirect3DDxgiInterfaceAccess*, UInt32)
    get_interface : Proc(IDirect3DDxgiInterfaceAccess*, Guid*, Void**, HRESULT)
  end

  struct IDirect3DDxgiInterfaceAccess
    lpVtbl : IDirect3DDxgiInterfaceAccessVTbl*
  end


  # Params # dxgidevice : IDXGIDevice [In],graphicsdevice : IInspectable* [In]
  fun CreateDirect3D11DeviceFromDXGIDevice(dxgidevice : IDXGIDevice, graphicsdevice : IInspectable*) : HRESULT

  # Params # dgxisurface : IDXGISurface [In],graphicssurface : IInspectable* [In]
  fun CreateDirect3D11SurfaceFromDXGISurface(dgxisurface : IDXGISurface, graphicssurface : IInspectable*) : HRESULT
end
