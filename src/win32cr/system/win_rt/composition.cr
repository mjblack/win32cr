require "./../com.cr"
require "./../../foundation.cr"
require "./../../ui/input/pointer.cr"
require "./../win_rt.cr"

module Win32cr::System::WinRT::Composition


  @[Extern]
  record ICompositionDrawingSurfaceInteropVtbl,
    query_interface : Proc(ICompositionDrawingSurfaceInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICompositionDrawingSurfaceInterop*, UInt32),
    release : Proc(ICompositionDrawingSurfaceInterop*, UInt32),
    begin_draw : Proc(ICompositionDrawingSurfaceInterop*, Win32cr::Foundation::RECT*, LibC::GUID*, Void**, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    end_draw : Proc(ICompositionDrawingSurfaceInterop*, Win32cr::Foundation::HRESULT),
    resize : Proc(ICompositionDrawingSurfaceInterop*, Win32cr::Foundation::SIZE, Win32cr::Foundation::HRESULT),
    scroll : Proc(ICompositionDrawingSurfaceInterop*, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    resume_draw : Proc(ICompositionDrawingSurfaceInterop*, Win32cr::Foundation::HRESULT),
    suspend_draw : Proc(ICompositionDrawingSurfaceInterop*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICompositionDrawingSurfaceInterop, lpVtbl : ICompositionDrawingSurfaceInteropVtbl* do
    GUID = LibC::GUID.new(0xfd04e6e3_u32, 0xfe0c_u16, 0x4c3c_u16, StaticArray[0xab_u8, 0x19_u8, 0xa0_u8, 0x76_u8, 0x1_u8, 0xa5_u8, 0x76_u8, 0xee_u8])
    def query_interface(this : ICompositionDrawingSurfaceInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICompositionDrawingSurfaceInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICompositionDrawingSurfaceInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_draw(this : ICompositionDrawingSurfaceInterop*, updateRect : Win32cr::Foundation::RECT*, iid : LibC::GUID*, updateObject : Void**, updateOffset : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, updateRect, iid, updateObject, updateOffset)
    end
    def end_draw(this : ICompositionDrawingSurfaceInterop*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end
    def resize(this : ICompositionDrawingSurfaceInterop*, sizePixels : Win32cr::Foundation::SIZE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, sizePixels)
    end
    def scroll(this : ICompositionDrawingSurfaceInterop*, scrollRect : Win32cr::Foundation::RECT*, clipRect : Win32cr::Foundation::RECT*, offsetX : Int32, offsetY : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll.call(this, scrollRect, clipRect, offsetX, offsetY)
    end
    def resume_draw(this : ICompositionDrawingSurfaceInterop*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_draw.call(this)
    end
    def suspend_draw(this : ICompositionDrawingSurfaceInterop*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_draw.call(this)
    end

  end

  @[Extern]
  record ICompositionDrawingSurfaceInterop2Vtbl,
    query_interface : Proc(ICompositionDrawingSurfaceInterop2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICompositionDrawingSurfaceInterop2*, UInt32),
    release : Proc(ICompositionDrawingSurfaceInterop2*, UInt32),
    begin_draw : Proc(ICompositionDrawingSurfaceInterop2*, Win32cr::Foundation::RECT*, LibC::GUID*, Void**, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    end_draw : Proc(ICompositionDrawingSurfaceInterop2*, Win32cr::Foundation::HRESULT),
    resize : Proc(ICompositionDrawingSurfaceInterop2*, Win32cr::Foundation::SIZE, Win32cr::Foundation::HRESULT),
    scroll : Proc(ICompositionDrawingSurfaceInterop2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    resume_draw : Proc(ICompositionDrawingSurfaceInterop2*, Win32cr::Foundation::HRESULT),
    suspend_draw : Proc(ICompositionDrawingSurfaceInterop2*, Win32cr::Foundation::HRESULT),
    copy_surface : Proc(ICompositionDrawingSurfaceInterop2*, Void*, Int32, Int32, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICompositionDrawingSurfaceInterop2, lpVtbl : ICompositionDrawingSurfaceInterop2Vtbl* do
    GUID = LibC::GUID.new(0x41e64aae_u32, 0x98c0_u16, 0x4239_u16, StaticArray[0x8e_u8, 0x95_u8, 0xa3_u8, 0x30_u8, 0xdd_u8, 0x6a_u8, 0xa1_u8, 0x8b_u8])
    def query_interface(this : ICompositionDrawingSurfaceInterop2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICompositionDrawingSurfaceInterop2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICompositionDrawingSurfaceInterop2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_draw(this : ICompositionDrawingSurfaceInterop2*, updateRect : Win32cr::Foundation::RECT*, iid : LibC::GUID*, updateObject : Void**, updateOffset : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, updateRect, iid, updateObject, updateOffset)
    end
    def end_draw(this : ICompositionDrawingSurfaceInterop2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end
    def resize(this : ICompositionDrawingSurfaceInterop2*, sizePixels : Win32cr::Foundation::SIZE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, sizePixels)
    end
    def scroll(this : ICompositionDrawingSurfaceInterop2*, scrollRect : Win32cr::Foundation::RECT*, clipRect : Win32cr::Foundation::RECT*, offsetX : Int32, offsetY : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll.call(this, scrollRect, clipRect, offsetX, offsetY)
    end
    def resume_draw(this : ICompositionDrawingSurfaceInterop2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_draw.call(this)
    end
    def suspend_draw(this : ICompositionDrawingSurfaceInterop2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_draw.call(this)
    end
    def copy_surface(this : ICompositionDrawingSurfaceInterop2*, destinationResource : Void*, destinationOffsetX : Int32, destinationOffsetY : Int32, sourceRectangle : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_surface.call(this, destinationResource, destinationOffsetX, destinationOffsetY, sourceRectangle)
    end

  end

  @[Extern]
  record ICompositionGraphicsDeviceInteropVtbl,
    query_interface : Proc(ICompositionGraphicsDeviceInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICompositionGraphicsDeviceInterop*, UInt32),
    release : Proc(ICompositionGraphicsDeviceInterop*, UInt32),
    get_rendering_device : Proc(ICompositionGraphicsDeviceInterop*, Void**, Win32cr::Foundation::HRESULT),
    set_rendering_device : Proc(ICompositionGraphicsDeviceInterop*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICompositionGraphicsDeviceInterop, lpVtbl : ICompositionGraphicsDeviceInteropVtbl* do
    GUID = LibC::GUID.new(0xa116ff71_u32, 0xf8bf_u16, 0x4c8a_u16, StaticArray[0x9c_u8, 0x98_u8, 0x70_u8, 0x77_u8, 0x9a_u8, 0x32_u8, 0xa9_u8, 0xc8_u8])
    def query_interface(this : ICompositionGraphicsDeviceInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICompositionGraphicsDeviceInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICompositionGraphicsDeviceInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_rendering_device(this : ICompositionGraphicsDeviceInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rendering_device.call(this, value)
    end
    def set_rendering_device(this : ICompositionGraphicsDeviceInterop*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rendering_device.call(this, value)
    end

  end

  @[Extern]
  record ICompositorInteropVtbl,
    query_interface : Proc(ICompositorInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICompositorInterop*, UInt32),
    release : Proc(ICompositorInterop*, UInt32),
    create_composition_surface_for_handle : Proc(ICompositorInterop*, Win32cr::Foundation::HANDLE, Void**, Win32cr::Foundation::HRESULT),
    create_composition_surface_for_swap_chain : Proc(ICompositorInterop*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_graphics_device : Proc(ICompositorInterop*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICompositorInterop, lpVtbl : ICompositorInteropVtbl* do
    GUID = LibC::GUID.new(0x25297d5c_u32, 0x3ad4_u16, 0x4c9c_u16, StaticArray[0xb5_u8, 0xcf_u8, 0xe3_u8, 0x6a_u8, 0x38_u8, 0x51_u8, 0x23_u8, 0x30_u8])
    def query_interface(this : ICompositorInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICompositorInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICompositorInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_composition_surface_for_handle(this : ICompositorInterop*, swapChain : Win32cr::Foundation::HANDLE, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_composition_surface_for_handle.call(this, swapChain, result)
    end
    def create_composition_surface_for_swap_chain(this : ICompositorInterop*, swapChain : Void*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_composition_surface_for_swap_chain.call(this, swapChain, result)
    end
    def create_graphics_device(this : ICompositorInterop*, renderingDevice : Void*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_graphics_device.call(this, renderingDevice, result)
    end

  end

  @[Extern]
  record ISwapChainInteropVtbl,
    query_interface : Proc(ISwapChainInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISwapChainInterop*, UInt32),
    release : Proc(ISwapChainInterop*, UInt32),
    set_swap_chain : Proc(ISwapChainInterop*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISwapChainInterop, lpVtbl : ISwapChainInteropVtbl* do
    GUID = LibC::GUID.new(0x26f496a0_u32, 0x7f38_u16, 0x45fb_u16, StaticArray[0x88_u8, 0xf7_u8, 0xfa_u8, 0xaa_u8, 0xbe_u8, 0x67_u8, 0xdd_u8, 0x59_u8])
    def query_interface(this : ISwapChainInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISwapChainInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISwapChainInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_swap_chain(this : ISwapChainInterop*, swapChain : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_swap_chain.call(this, swapChain)
    end

  end

  @[Extern]
  record IVisualInteractionSourceInteropVtbl,
    query_interface : Proc(IVisualInteractionSourceInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVisualInteractionSourceInterop*, UInt32),
    release : Proc(IVisualInteractionSourceInterop*, UInt32),
    try_redirect_for_manipulation : Proc(IVisualInteractionSourceInterop*, Win32cr::UI::Input::Pointer::POINTER_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVisualInteractionSourceInterop, lpVtbl : IVisualInteractionSourceInteropVtbl* do
    GUID = LibC::GUID.new(0x11f62cd1_u32, 0x2f9d_u16, 0x42d3_u16, StaticArray[0xb0_u8, 0x5f_u8, 0xd6_u8, 0x79_u8, 0xd_u8, 0x9e_u8, 0x9f_u8, 0x8e_u8])
    def query_interface(this : IVisualInteractionSourceInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVisualInteractionSourceInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVisualInteractionSourceInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def try_redirect_for_manipulation(this : IVisualInteractionSourceInterop*, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.try_redirect_for_manipulation.call(this, pointerInfo)
    end

  end

  @[Extern]
  record ICompositionCapabilitiesInteropFactoryVtbl,
    query_interface : Proc(ICompositionCapabilitiesInteropFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICompositionCapabilitiesInteropFactory*, UInt32),
    release : Proc(ICompositionCapabilitiesInteropFactory*, UInt32),
    get_iids : Proc(ICompositionCapabilitiesInteropFactory*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ICompositionCapabilitiesInteropFactory*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ICompositionCapabilitiesInteropFactory*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(ICompositionCapabilitiesInteropFactory*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICompositionCapabilitiesInteropFactory, lpVtbl : ICompositionCapabilitiesInteropFactoryVtbl* do
    GUID = LibC::GUID.new(0x2c9db356_u32, 0xe70d_u16, 0x4642_u16, StaticArray[0x82_u8, 0x98_u8, 0xbc_u8, 0x4a_u8, 0xa5_u8, 0xb4_u8, 0x86_u8, 0x5c_u8])
    def query_interface(this : ICompositionCapabilitiesInteropFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICompositionCapabilitiesInteropFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICompositionCapabilitiesInteropFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ICompositionCapabilitiesInteropFactory*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ICompositionCapabilitiesInteropFactory*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ICompositionCapabilitiesInteropFactory*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : ICompositionCapabilitiesInteropFactory*, hwnd : Win32cr::Foundation::HWND, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, hwnd, result)
    end

  end

  @[Extern]
  record ICompositorDesktopInteropVtbl,
    query_interface : Proc(ICompositorDesktopInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICompositorDesktopInterop*, UInt32),
    release : Proc(ICompositorDesktopInterop*, UInt32),
    create_desktop_window_target : Proc(ICompositorDesktopInterop*, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    ensure_on_thread : Proc(ICompositorDesktopInterop*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICompositorDesktopInterop, lpVtbl : ICompositorDesktopInteropVtbl* do
    GUID = LibC::GUID.new(0x29e691fa_u32, 0x4567_u16, 0x4dca_u16, StaticArray[0xb3_u8, 0x19_u8, 0xd0_u8, 0xf2_u8, 0x7_u8, 0xeb_u8, 0x68_u8, 0x7_u8])
    def query_interface(this : ICompositorDesktopInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICompositorDesktopInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICompositorDesktopInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_desktop_window_target(this : ICompositorDesktopInterop*, hwndTarget : Win32cr::Foundation::HWND, isTopmost : Win32cr::Foundation::BOOL, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_desktop_window_target.call(this, hwndTarget, isTopmost, result)
    end
    def ensure_on_thread(this : ICompositorDesktopInterop*, threadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ensure_on_thread.call(this, threadId)
    end

  end

  @[Extern]
  record IDesktopWindowTargetInteropVtbl,
    query_interface : Proc(IDesktopWindowTargetInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDesktopWindowTargetInterop*, UInt32),
    release : Proc(IDesktopWindowTargetInterop*, UInt32),
    get_Hwnd : Proc(IDesktopWindowTargetInterop*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDesktopWindowTargetInterop, lpVtbl : IDesktopWindowTargetInteropVtbl* do
    GUID = LibC::GUID.new(0x35dbf59e_u32, 0xe3f9_u16, 0x45b0_u16, StaticArray[0x81_u8, 0xe7_u8, 0xfe_u8, 0x75_u8, 0xf4_u8, 0x14_u8, 0x5d_u8, 0xc9_u8])
    def query_interface(this : IDesktopWindowTargetInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDesktopWindowTargetInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDesktopWindowTargetInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Hwnd(this : IDesktopWindowTargetInterop*, value : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Hwnd.call(this, value)
    end

  end

end