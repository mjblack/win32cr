require "../../system/com.cr"
require "../../foundation.cr"
require "../../ui/input/pointer.cr"
require "../../system/winrt.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
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

  struct ICompositorInterop
    lpVtbl : ICompositorInteropVTbl*
  end

  struct ISwapChainInteropVTbl
    query_interface : Proc(ISwapChainInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainInterop*, UInt32)
    release : Proc(ISwapChainInterop*, UInt32)
    set_swap_chain : Proc(ISwapChainInterop*, IUnknown, HRESULT)
  end

  struct ISwapChainInterop
    lpVtbl : ISwapChainInteropVTbl*
  end

  struct IVisualInteractionSourceInteropVTbl
    query_interface : Proc(IVisualInteractionSourceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualInteractionSourceInterop*, UInt32)
    release : Proc(IVisualInteractionSourceInterop*, UInt32)
    try_redirect_for_manipulation : Proc(IVisualInteractionSourceInterop*, POINTER_INFO*, HRESULT)
  end

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

  struct ICompositorDesktopInterop
    lpVtbl : ICompositorDesktopInteropVTbl*
  end

  struct IDesktopWindowTargetInteropVTbl
    query_interface : Proc(IDesktopWindowTargetInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDesktopWindowTargetInterop*, UInt32)
    release : Proc(IDesktopWindowTargetInterop*, UInt32)
    get_hwnd : Proc(IDesktopWindowTargetInterop*, HANDLE*, HRESULT)
  end

  struct IDesktopWindowTargetInterop
    lpVtbl : IDesktopWindowTargetInteropVTbl*
  end

end
