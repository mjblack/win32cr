require "../../system/com.cr"
require "../../foundation.cr"
require "../../graphics/dxgi.cr"
require "../../system/winrt.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:d3d11.dll")]
{% else %}
@[Link("d3d11")]
{% end %}
lib LibWin32

  struct IDirect3DDxgiInterfaceAccessVTbl
    query_interface : Proc(IDirect3DDxgiInterfaceAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirect3DDxgiInterfaceAccess*, UInt32)
    release : Proc(IDirect3DDxgiInterfaceAccess*, UInt32)
    get_interface : Proc(IDirect3DDxgiInterfaceAccess*, Guid*, Void**, HRESULT)
  end

  IDirect3DDxgiInterfaceAccess_GUID = "a9b3d012-3df2-4ee3-b8d1-8695f457d3c1"
  IID_IDirect3DDxgiInterfaceAccess = LibC::GUID.new(0xa9b3d012_u32, 0x3df2_u16, 0x4ee3_u16, StaticArray[0xb8_u8, 0xd1_u8, 0x86_u8, 0x95_u8, 0xf4_u8, 0x57_u8, 0xd3_u8, 0xc1_u8])
  struct IDirect3DDxgiInterfaceAccess
    lpVtbl : IDirect3DDxgiInterfaceAccessVTbl*
  end


  # Params # dxgidevice : IDXGIDevice [In],graphicsdevice : IInspectable* [In]
  fun CreateDirect3D11DeviceFromDXGIDevice(dxgidevice : IDXGIDevice, graphicsdevice : IInspectable*) : HRESULT

  # Params # dgxisurface : IDXGISurface [In],graphicssurface : IInspectable* [In]
  fun CreateDirect3D11SurfaceFromDXGISurface(dgxisurface : IDXGISurface, graphicssurface : IInspectable*) : HRESULT
end
