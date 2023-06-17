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
    query_interface : Proc(ICompositionDrawingSurfaceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICompositionDrawingSurfaceInterop*, UInt32)
    release : Proc(ICompositionDrawingSurfaceInterop*, UInt32)
    begin_draw : Proc(ICompositionDrawingSurfaceInterop*, RECT*, Guid*, Void**, POINT*, HRESULT)
    end_draw : Proc(ICompositionDrawingSurfaceInterop*, HRESULT)
    resize : Proc(ICompositionDrawingSurfaceInterop*, SIZE, HRESULT)
    scroll : Proc(ICompositionDrawingSurfaceInterop*, RECT*, RECT*, Int32, Int32, HRESULT)
    resume_draw : Proc(ICompositionDrawingSurfaceInterop*, HRESULT)
    suspend_draw : Proc(ICompositionDrawingSurfaceInterop*, HRESULT)
  end

  ICompositionDrawingSurfaceInterop_GUID = "fd04e6e3-fe0c-4c3c-ab19-a07601a576ee"
  IID_ICompositionDrawingSurfaceInterop = LibC::GUID.new(0xfd04e6e3_u32, 0xfe0c_u16, 0x4c3c_u16, StaticArray[0xab_u8, 0x19_u8, 0xa0_u8, 0x76_u8, 0x1_u8, 0xa5_u8, 0x76_u8, 0xee_u8])
  struct ICompositionDrawingSurfaceInterop
    lpVtbl : ICompositionDrawingSurfaceInteropVTbl*
  end

  struct ICompositionDrawingSurfaceInterop2VTbl
    query_interface : Proc(ICompositionDrawingSurfaceInterop2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICompositionDrawingSurfaceInterop2*, UInt32)
    release : Proc(ICompositionDrawingSurfaceInterop2*, UInt32)
    begin_draw : Proc(ICompositionDrawingSurfaceInterop2*, RECT*, Guid*, Void**, POINT*, HRESULT)
    end_draw : Proc(ICompositionDrawingSurfaceInterop2*, HRESULT)
    resize : Proc(ICompositionDrawingSurfaceInterop2*, SIZE, HRESULT)
    scroll : Proc(ICompositionDrawingSurfaceInterop2*, RECT*, RECT*, Int32, Int32, HRESULT)
    resume_draw : Proc(ICompositionDrawingSurfaceInterop2*, HRESULT)
    suspend_draw : Proc(ICompositionDrawingSurfaceInterop2*, HRESULT)
    copy_surface : Proc(ICompositionDrawingSurfaceInterop2*, IUnknown, Int32, Int32, RECT*, HRESULT)
  end

  ICompositionDrawingSurfaceInterop2_GUID = "41e64aae-98c0-4239-8e95-a330dd6aa18b"
  IID_ICompositionDrawingSurfaceInterop2 = LibC::GUID.new(0x41e64aae_u32, 0x98c0_u16, 0x4239_u16, StaticArray[0x8e_u8, 0x95_u8, 0xa3_u8, 0x30_u8, 0xdd_u8, 0x6a_u8, 0xa1_u8, 0x8b_u8])
  struct ICompositionDrawingSurfaceInterop2
    lpVtbl : ICompositionDrawingSurfaceInterop2VTbl*
  end

  struct ICompositionGraphicsDeviceInteropVTbl
    query_interface : Proc(ICompositionGraphicsDeviceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICompositionGraphicsDeviceInterop*, UInt32)
    release : Proc(ICompositionGraphicsDeviceInterop*, UInt32)
    get_rendering_device : Proc(ICompositionGraphicsDeviceInterop*, IUnknown*, HRESULT)
    set_rendering_device : Proc(ICompositionGraphicsDeviceInterop*, IUnknown, HRESULT)
  end

  ICompositionGraphicsDeviceInterop_GUID = "a116ff71-f8bf-4c8a-9c98-70779a32a9c8"
  IID_ICompositionGraphicsDeviceInterop = LibC::GUID.new(0xa116ff71_u32, 0xf8bf_u16, 0x4c8a_u16, StaticArray[0x9c_u8, 0x98_u8, 0x70_u8, 0x77_u8, 0x9a_u8, 0x32_u8, 0xa9_u8, 0xc8_u8])
  struct ICompositionGraphicsDeviceInterop
    lpVtbl : ICompositionGraphicsDeviceInteropVTbl*
  end

  struct ICompositorInteropVTbl
    query_interface : Proc(ICompositorInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICompositorInterop*, UInt32)
    release : Proc(ICompositorInterop*, UInt32)
    create_composition_surface_for_handle : Proc(ICompositorInterop*, LibC::HANDLE, ICompositionSurface*, HRESULT)
    create_composition_surface_for_swap_chain : Proc(ICompositorInterop*, IUnknown, ICompositionSurface*, HRESULT)
    create_graphics_device : Proc(ICompositorInterop*, IUnknown, CompositionGraphicsDevice*, HRESULT)
  end

  ICompositorInterop_GUID = "25297d5c-3ad4-4c9c-b5cf-e36a38512330"
  IID_ICompositorInterop = LibC::GUID.new(0x25297d5c_u32, 0x3ad4_u16, 0x4c9c_u16, StaticArray[0xb5_u8, 0xcf_u8, 0xe3_u8, 0x6a_u8, 0x38_u8, 0x51_u8, 0x23_u8, 0x30_u8])
  struct ICompositorInterop
    lpVtbl : ICompositorInteropVTbl*
  end

  struct ISwapChainInteropVTbl
    query_interface : Proc(ISwapChainInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainInterop*, UInt32)
    release : Proc(ISwapChainInterop*, UInt32)
    set_swap_chain : Proc(ISwapChainInterop*, IUnknown, HRESULT)
  end

  ISwapChainInterop_GUID = "26f496a0-7f38-45fb-88f7-faaabe67dd59"
  IID_ISwapChainInterop = LibC::GUID.new(0x26f496a0_u32, 0x7f38_u16, 0x45fb_u16, StaticArray[0x88_u8, 0xf7_u8, 0xfa_u8, 0xaa_u8, 0xbe_u8, 0x67_u8, 0xdd_u8, 0x59_u8])
  struct ISwapChainInterop
    lpVtbl : ISwapChainInteropVTbl*
  end

  struct IVisualInteractionSourceInteropVTbl
    query_interface : Proc(IVisualInteractionSourceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualInteractionSourceInterop*, UInt32)
    release : Proc(IVisualInteractionSourceInterop*, UInt32)
    try_redirect_for_manipulation : Proc(IVisualInteractionSourceInterop*, POINTER_INFO*, HRESULT)
  end

  IVisualInteractionSourceInterop_GUID = "11f62cd1-2f9d-42d3-b05f-d6790d9e9f8e"
  IID_IVisualInteractionSourceInterop = LibC::GUID.new(0x11f62cd1_u32, 0x2f9d_u16, 0x42d3_u16, StaticArray[0xb0_u8, 0x5f_u8, 0xd6_u8, 0x79_u8, 0xd_u8, 0x9e_u8, 0x9f_u8, 0x8e_u8])
  struct IVisualInteractionSourceInterop
    lpVtbl : IVisualInteractionSourceInteropVTbl*
  end

  struct ICompositionCapabilitiesInteropFactoryVTbl
    query_interface : Proc(ICompositionCapabilitiesInteropFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICompositionCapabilitiesInteropFactory*, UInt32)
    release : Proc(ICompositionCapabilitiesInteropFactory*, UInt32)
    get_iids : Proc(ICompositionCapabilitiesInteropFactory*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ICompositionCapabilitiesInteropFactory*, HSTRING*, HRESULT)
    get_trust_level : Proc(ICompositionCapabilitiesInteropFactory*, TrustLevel*, HRESULT)
    get_for_window : Proc(ICompositionCapabilitiesInteropFactory*, LibC::HANDLE, CompositionCapabilities*, HRESULT)
  end

  ICompositionCapabilitiesInteropFactory_GUID = "2c9db356-e70d-4642-8298-bc4aa5b4865c"
  IID_ICompositionCapabilitiesInteropFactory = LibC::GUID.new(0x2c9db356_u32, 0xe70d_u16, 0x4642_u16, StaticArray[0x82_u8, 0x98_u8, 0xbc_u8, 0x4a_u8, 0xa5_u8, 0xb4_u8, 0x86_u8, 0x5c_u8])
  struct ICompositionCapabilitiesInteropFactory
    lpVtbl : ICompositionCapabilitiesInteropFactoryVTbl*
  end

  struct ICompositorDesktopInteropVTbl
    query_interface : Proc(ICompositorDesktopInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICompositorDesktopInterop*, UInt32)
    release : Proc(ICompositorDesktopInterop*, UInt32)
    create_desktop_window_target : Proc(ICompositorDesktopInterop*, LibC::HANDLE, LibC::BOOL, DesktopWindowTarget*, HRESULT)
    ensure_on_thread : Proc(ICompositorDesktopInterop*, UInt32, HRESULT)
  end

  ICompositorDesktopInterop_GUID = "29e691fa-4567-4dca-b319-d0f207eb6807"
  IID_ICompositorDesktopInterop = LibC::GUID.new(0x29e691fa_u32, 0x4567_u16, 0x4dca_u16, StaticArray[0xb3_u8, 0x19_u8, 0xd0_u8, 0xf2_u8, 0x7_u8, 0xeb_u8, 0x68_u8, 0x7_u8])
  struct ICompositorDesktopInterop
    lpVtbl : ICompositorDesktopInteropVTbl*
  end

  struct IDesktopWindowTargetInteropVTbl
    query_interface : Proc(IDesktopWindowTargetInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDesktopWindowTargetInterop*, UInt32)
    release : Proc(IDesktopWindowTargetInterop*, UInt32)
    get_hwnd : Proc(IDesktopWindowTargetInterop*, HANDLE*, HRESULT)
  end

  IDesktopWindowTargetInterop_GUID = "35dbf59e-e3f9-45b0-81e7-fe75f4145dc9"
  IID_IDesktopWindowTargetInterop = LibC::GUID.new(0x35dbf59e_u32, 0xe3f9_u16, 0x45b0_u16, StaticArray[0x81_u8, 0xe7_u8, 0xfe_u8, 0x75_u8, 0xf4_u8, 0x14_u8, 0x5d_u8, 0xc9_u8])
  struct IDesktopWindowTargetInterop
    lpVtbl : IDesktopWindowTargetInteropVTbl*
  end

end