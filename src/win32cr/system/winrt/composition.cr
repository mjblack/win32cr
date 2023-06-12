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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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

  ICompositionDrawingSurfaceInterop_GUID = LibC::GUID.new("fd04e6e3-fe0c-4c3c-ab19-a07601a576ee")
  CLSID_ICompositionDrawingSurfaceInterop = "fd04e6e3-fe0c-4c3c-ab19-a07601a576ee"
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

  ICompositionDrawingSurfaceInterop2_GUID = LibC::GUID.new("41e64aae-98c0-4239-8e95-a330dd6aa18b")
  CLSID_ICompositionDrawingSurfaceInterop2 = "41e64aae-98c0-4239-8e95-a330dd6aa18b"
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

  ICompositionGraphicsDeviceInterop_GUID = LibC::GUID.new("a116ff71-f8bf-4c8a-9c98-70779a32a9c8")
  CLSID_ICompositionGraphicsDeviceInterop = "a116ff71-f8bf-4c8a-9c98-70779a32a9c8"
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

  ICompositorInterop_GUID = LibC::GUID.new("25297d5c-3ad4-4c9c-b5cf-e36a38512330")
  CLSID_ICompositorInterop = "25297d5c-3ad4-4c9c-b5cf-e36a38512330"
  struct ICompositorInterop
    lpVtbl : ICompositorInteropVTbl*
  end

  struct ISwapChainInteropVTbl
    query_interface : Proc(ISwapChainInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainInterop*, UInt32)
    release : Proc(ISwapChainInterop*, UInt32)
    set_swap_chain : Proc(ISwapChainInterop*, IUnknown, HRESULT)
  end

  ISwapChainInterop_GUID = LibC::GUID.new("26f496a0-7f38-45fb-88f7-faaabe67dd59")
  CLSID_ISwapChainInterop = "26f496a0-7f38-45fb-88f7-faaabe67dd59"
  struct ISwapChainInterop
    lpVtbl : ISwapChainInteropVTbl*
  end

  struct IVisualInteractionSourceInteropVTbl
    query_interface : Proc(IVisualInteractionSourceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualInteractionSourceInterop*, UInt32)
    release : Proc(IVisualInteractionSourceInterop*, UInt32)
    try_redirect_for_manipulation : Proc(IVisualInteractionSourceInterop*, POINTER_INFO*, HRESULT)
  end

  IVisualInteractionSourceInterop_GUID = LibC::GUID.new("11f62cd1-2f9d-42d3-b05f-d6790d9e9f8e")
  CLSID_IVisualInteractionSourceInterop = "11f62cd1-2f9d-42d3-b05f-d6790d9e9f8e"
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

  ICompositionCapabilitiesInteropFactory_GUID = LibC::GUID.new("2c9db356-e70d-4642-8298-bc4aa5b4865c")
  CLSID_ICompositionCapabilitiesInteropFactory = "2c9db356-e70d-4642-8298-bc4aa5b4865c"
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

  ICompositorDesktopInterop_GUID = LibC::GUID.new("29e691fa-4567-4dca-b319-d0f207eb6807")
  CLSID_ICompositorDesktopInterop = "29e691fa-4567-4dca-b319-d0f207eb6807"
  struct ICompositorDesktopInterop
    lpVtbl : ICompositorDesktopInteropVTbl*
  end

  struct IDesktopWindowTargetInteropVTbl
    query_interface : Proc(IDesktopWindowTargetInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDesktopWindowTargetInterop*, UInt32)
    release : Proc(IDesktopWindowTargetInterop*, UInt32)
    get_hwnd : Proc(IDesktopWindowTargetInterop*, HANDLE*, HRESULT)
  end

  IDesktopWindowTargetInterop_GUID = LibC::GUID.new("35dbf59e-e3f9-45b0-81e7-fe75f4145dc9")
  CLSID_IDesktopWindowTargetInterop = "35dbf59e-e3f9-45b0-81e7-fe75f4145dc9"
  struct IDesktopWindowTargetInterop
    lpVtbl : IDesktopWindowTargetInteropVTbl*
  end

end
