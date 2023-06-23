require "../../system/com.cr"
require "../../foundation.cr"
require "../../ui/input/pointer.cr"
require "../../system/winrt.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  struct ICompositionDrawingSurfaceInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_draw : UInt64
    end_draw : UInt64
    resize : UInt64
    scroll : UInt64
    resume_draw : UInt64
    suspend_draw : UInt64
  end

  ICompositionDrawingSurfaceInterop_GUID = "fd04e6e3-fe0c-4c3c-ab19-a07601a576ee"
  IID_ICompositionDrawingSurfaceInterop = LibC::GUID.new(0xfd04e6e3_u32, 0xfe0c_u16, 0x4c3c_u16, StaticArray[0xab_u8, 0x19_u8, 0xa0_u8, 0x76_u8, 0x1_u8, 0xa5_u8, 0x76_u8, 0xee_u8])
  struct ICompositionDrawingSurfaceInterop
    lpVtbl : ICompositionDrawingSurfaceInteropVTbl*
  end

  struct ICompositionDrawingSurfaceInterop2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_draw : UInt64
    end_draw : UInt64
    resize : UInt64
    scroll : UInt64
    resume_draw : UInt64
    suspend_draw : UInt64
    copy_surface : UInt64
  end

  ICompositionDrawingSurfaceInterop2_GUID = "41e64aae-98c0-4239-8e95-a330dd6aa18b"
  IID_ICompositionDrawingSurfaceInterop2 = LibC::GUID.new(0x41e64aae_u32, 0x98c0_u16, 0x4239_u16, StaticArray[0x8e_u8, 0x95_u8, 0xa3_u8, 0x30_u8, 0xdd_u8, 0x6a_u8, 0xa1_u8, 0x8b_u8])
  struct ICompositionDrawingSurfaceInterop2
    lpVtbl : ICompositionDrawingSurfaceInterop2VTbl*
  end

  struct ICompositionGraphicsDeviceInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_rendering_device : UInt64
    set_rendering_device : UInt64
  end

  ICompositionGraphicsDeviceInterop_GUID = "a116ff71-f8bf-4c8a-9c98-70779a32a9c8"
  IID_ICompositionGraphicsDeviceInterop = LibC::GUID.new(0xa116ff71_u32, 0xf8bf_u16, 0x4c8a_u16, StaticArray[0x9c_u8, 0x98_u8, 0x70_u8, 0x77_u8, 0x9a_u8, 0x32_u8, 0xa9_u8, 0xc8_u8])
  struct ICompositionGraphicsDeviceInterop
    lpVtbl : ICompositionGraphicsDeviceInteropVTbl*
  end

  struct ICompositorInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_composition_surface_for_handle : UInt64
    create_composition_surface_for_swap_chain : UInt64
    create_graphics_device : UInt64
  end

  ICompositorInterop_GUID = "25297d5c-3ad4-4c9c-b5cf-e36a38512330"
  IID_ICompositorInterop = LibC::GUID.new(0x25297d5c_u32, 0x3ad4_u16, 0x4c9c_u16, StaticArray[0xb5_u8, 0xcf_u8, 0xe3_u8, 0x6a_u8, 0x38_u8, 0x51_u8, 0x23_u8, 0x30_u8])
  struct ICompositorInterop
    lpVtbl : ICompositorInteropVTbl*
  end

  struct ISwapChainInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_swap_chain : UInt64
  end

  ISwapChainInterop_GUID = "26f496a0-7f38-45fb-88f7-faaabe67dd59"
  IID_ISwapChainInterop = LibC::GUID.new(0x26f496a0_u32, 0x7f38_u16, 0x45fb_u16, StaticArray[0x88_u8, 0xf7_u8, 0xfa_u8, 0xaa_u8, 0xbe_u8, 0x67_u8, 0xdd_u8, 0x59_u8])
  struct ISwapChainInterop
    lpVtbl : ISwapChainInteropVTbl*
  end

  struct IVisualInteractionSourceInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    try_redirect_for_manipulation : UInt64
  end

  IVisualInteractionSourceInterop_GUID = "11f62cd1-2f9d-42d3-b05f-d6790d9e9f8e"
  IID_IVisualInteractionSourceInterop = LibC::GUID.new(0x11f62cd1_u32, 0x2f9d_u16, 0x42d3_u16, StaticArray[0xb0_u8, 0x5f_u8, 0xd6_u8, 0x79_u8, 0xd_u8, 0x9e_u8, 0x9f_u8, 0x8e_u8])
  struct IVisualInteractionSourceInterop
    lpVtbl : IVisualInteractionSourceInteropVTbl*
  end

  struct ICompositionCapabilitiesInteropFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  ICompositionCapabilitiesInteropFactory_GUID = "2c9db356-e70d-4642-8298-bc4aa5b4865c"
  IID_ICompositionCapabilitiesInteropFactory = LibC::GUID.new(0x2c9db356_u32, 0xe70d_u16, 0x4642_u16, StaticArray[0x82_u8, 0x98_u8, 0xbc_u8, 0x4a_u8, 0xa5_u8, 0xb4_u8, 0x86_u8, 0x5c_u8])
  struct ICompositionCapabilitiesInteropFactory
    lpVtbl : ICompositionCapabilitiesInteropFactoryVTbl*
  end

  struct ICompositorDesktopInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_desktop_window_target : UInt64
    ensure_on_thread : UInt64
  end

  ICompositorDesktopInterop_GUID = "29e691fa-4567-4dca-b319-d0f207eb6807"
  IID_ICompositorDesktopInterop = LibC::GUID.new(0x29e691fa_u32, 0x4567_u16, 0x4dca_u16, StaticArray[0xb3_u8, 0x19_u8, 0xd0_u8, 0xf2_u8, 0x7_u8, 0xeb_u8, 0x68_u8, 0x7_u8])
  struct ICompositorDesktopInterop
    lpVtbl : ICompositorDesktopInteropVTbl*
  end

  struct IDesktopWindowTargetInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_hwnd : UInt64
  end

  IDesktopWindowTargetInterop_GUID = "35dbf59e-e3f9-45b0-81e7-fe75f4145dc9"
  IID_IDesktopWindowTargetInterop = LibC::GUID.new(0x35dbf59e_u32, 0xe3f9_u16, 0x45b0_u16, StaticArray[0x81_u8, 0xe7_u8, 0xfe_u8, 0x75_u8, 0xf4_u8, 0x14_u8, 0x5d_u8, 0xc9_u8])
  struct IDesktopWindowTargetInterop
    lpVtbl : IDesktopWindowTargetInteropVTbl*
  end

end
struct LibWin32::ICompositionDrawingSurfaceInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_draw(updaterect : RECT*, iid : Guid*, updateobject : Void**, updateoffset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.unsafe_as(Proc(RECT*, Guid*, Void**, POINT*, HRESULT)).call(updaterect, iid, updateobject, updateoffset)
  end
  def end_draw : HRESULT
    @lpVtbl.value.end_draw.unsafe_as(Proc(HRESULT)).call
  end
  def resize(sizepixels : SIZE) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(SIZE, HRESULT)).call(sizepixels)
  end
  def scroll(scrollrect : RECT*, cliprect : RECT*, offsetx : Int32, offsety : Int32) : HRESULT
    @lpVtbl.value.scroll.unsafe_as(Proc(RECT*, RECT*, Int32, Int32, HRESULT)).call(scrollrect, cliprect, offsetx, offsety)
  end
  def resume_draw : HRESULT
    @lpVtbl.value.resume_draw.unsafe_as(Proc(HRESULT)).call
  end
  def suspend_draw : HRESULT
    @lpVtbl.value.suspend_draw.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ICompositionDrawingSurfaceInterop2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_draw(updaterect : RECT*, iid : Guid*, updateobject : Void**, updateoffset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.unsafe_as(Proc(RECT*, Guid*, Void**, POINT*, HRESULT)).call(updaterect, iid, updateobject, updateoffset)
  end
  def end_draw : HRESULT
    @lpVtbl.value.end_draw.unsafe_as(Proc(HRESULT)).call
  end
  def resize(sizepixels : SIZE) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(SIZE, HRESULT)).call(sizepixels)
  end
  def scroll(scrollrect : RECT*, cliprect : RECT*, offsetx : Int32, offsety : Int32) : HRESULT
    @lpVtbl.value.scroll.unsafe_as(Proc(RECT*, RECT*, Int32, Int32, HRESULT)).call(scrollrect, cliprect, offsetx, offsety)
  end
  def resume_draw : HRESULT
    @lpVtbl.value.resume_draw.unsafe_as(Proc(HRESULT)).call
  end
  def suspend_draw : HRESULT
    @lpVtbl.value.suspend_draw.unsafe_as(Proc(HRESULT)).call
  end
  def copy_surface(destinationresource : IUnknown, destinationoffsetx : Int32, destinationoffsety : Int32, sourcerectangle : RECT*) : HRESULT
    @lpVtbl.value.copy_surface.unsafe_as(Proc(IUnknown, Int32, Int32, RECT*, HRESULT)).call(destinationresource, destinationoffsetx, destinationoffsety, sourcerectangle)
  end
end
struct LibWin32::ICompositionGraphicsDeviceInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_rendering_device(value : IUnknown*) : HRESULT
    @lpVtbl.value.get_rendering_device.unsafe_as(Proc(IUnknown*, HRESULT)).call(value)
  end
  def set_rendering_device(value : IUnknown) : HRESULT
    @lpVtbl.value.set_rendering_device.unsafe_as(Proc(IUnknown, HRESULT)).call(value)
  end
end
struct LibWin32::ICompositorInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_composition_surface_for_handle(swapchain : LibC::HANDLE, result : ICompositionSurface*) : HRESULT
    @lpVtbl.value.create_composition_surface_for_handle.unsafe_as(Proc(LibC::HANDLE, ICompositionSurface*, HRESULT)).call(swapchain, result)
  end
  def create_composition_surface_for_swap_chain(swapchain : IUnknown, result : ICompositionSurface*) : HRESULT
    @lpVtbl.value.create_composition_surface_for_swap_chain.unsafe_as(Proc(IUnknown, ICompositionSurface*, HRESULT)).call(swapchain, result)
  end
  def create_graphics_device(renderingdevice : IUnknown, result : CompositionGraphicsDevice*) : HRESULT
    @lpVtbl.value.create_graphics_device.unsafe_as(Proc(IUnknown, CompositionGraphicsDevice*, HRESULT)).call(renderingdevice, result)
  end
end
struct LibWin32::ISwapChainInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_swap_chain(swapchain : IUnknown) : HRESULT
    @lpVtbl.value.set_swap_chain.unsafe_as(Proc(IUnknown, HRESULT)).call(swapchain)
  end
end
struct LibWin32::IVisualInteractionSourceInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def try_redirect_for_manipulation(pointerinfo : POINTER_INFO*) : HRESULT
    @lpVtbl.value.try_redirect_for_manipulation.unsafe_as(Proc(POINTER_INFO*, HRESULT)).call(pointerinfo)
  end
end
struct LibWin32::ICompositionCapabilitiesInteropFactory
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
  def get_for_window(hwnd : LibC::HANDLE, result : CompositionCapabilities*) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, CompositionCapabilities*, HRESULT)).call(hwnd, result)
  end
end
struct LibWin32::ICompositorDesktopInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_desktop_window_target(hwndtarget : LibC::HANDLE, istopmost : LibC::BOOL, result : DesktopWindowTarget*) : HRESULT
    @lpVtbl.value.create_desktop_window_target.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, DesktopWindowTarget*, HRESULT)).call(hwndtarget, istopmost, result)
  end
  def ensure_on_thread(threadid : UInt32) : HRESULT
    @lpVtbl.value.ensure_on_thread.unsafe_as(Proc(UInt32, HRESULT)).call(threadid)
  end
end
struct LibWin32::IDesktopWindowTargetInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_hwnd(value : HANDLE*) : HRESULT
    @lpVtbl.value.get_hwnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(value)
  end
end
