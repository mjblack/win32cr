require "../../system/com.cr"
require "../../foundation.cr"
require "../../graphics/dxgi.cr"
require "../../ui/windowsandmessaging.cr"

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
  E_SURFACE_CONTENTS_LOST = 2150301728_u32


  enum XAML_REFERENCETRACKER_DISCONNECT : Int32
    XAML_REFERENCETRACKER_DISCONNECT_DEFAULT = 0
    XAML_REFERENCETRACKER_DISCONNECT_SUSPEND = 1
  end

  struct TrackerHandle__
    unused : Int32
  end


  struct ISurfaceImageSourceNativeVTbl
    query_interface : Proc(ISurfaceImageSourceNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISurfaceImageSourceNative*, UInt32)
    release : Proc(ISurfaceImageSourceNative*, UInt32)
    set_device : Proc(ISurfaceImageSourceNative*, IDXGIDevice, HRESULT)
    begin_draw : Proc(ISurfaceImageSourceNative*, RECT, IDXGISurface*, POINT*, HRESULT)
    end_draw : Proc(ISurfaceImageSourceNative*, HRESULT)
  end

  struct ISurfaceImageSourceNative
    lpVtbl : ISurfaceImageSourceNativeVTbl*
  end

  struct IVirtualSurfaceUpdatesCallbackNativeVTbl
    query_interface : Proc(IVirtualSurfaceUpdatesCallbackNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVirtualSurfaceUpdatesCallbackNative*, UInt32)
    release : Proc(IVirtualSurfaceUpdatesCallbackNative*, UInt32)
    updates_needed : Proc(IVirtualSurfaceUpdatesCallbackNative*, HRESULT)
  end

  struct IVirtualSurfaceUpdatesCallbackNative
    lpVtbl : IVirtualSurfaceUpdatesCallbackNativeVTbl*
  end

  struct IVirtualSurfaceImageSourceNativeVTbl
    query_interface : Proc(IVirtualSurfaceImageSourceNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVirtualSurfaceImageSourceNative*, UInt32)
    release : Proc(IVirtualSurfaceImageSourceNative*, UInt32)
    set_device : Proc(IVirtualSurfaceImageSourceNative*, IDXGIDevice, HRESULT)
    begin_draw : Proc(IVirtualSurfaceImageSourceNative*, RECT, IDXGISurface*, POINT*, HRESULT)
    end_draw : Proc(IVirtualSurfaceImageSourceNative*, HRESULT)
    invalidate : Proc(IVirtualSurfaceImageSourceNative*, RECT, HRESULT)
    get_update_rect_count : Proc(IVirtualSurfaceImageSourceNative*, UInt32*, HRESULT)
    get_update_rects : Proc(IVirtualSurfaceImageSourceNative*, RECT*, UInt32, HRESULT)
    get_visible_bounds : Proc(IVirtualSurfaceImageSourceNative*, RECT*, HRESULT)
    register_for_updates_needed : Proc(IVirtualSurfaceImageSourceNative*, IVirtualSurfaceUpdatesCallbackNative, HRESULT)
    resize : Proc(IVirtualSurfaceImageSourceNative*, Int32, Int32, HRESULT)
  end

  struct IVirtualSurfaceImageSourceNative
    lpVtbl : IVirtualSurfaceImageSourceNativeVTbl*
  end

  struct ISwapChainBackgroundPanelNativeVTbl
    query_interface : Proc(ISwapChainBackgroundPanelNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainBackgroundPanelNative*, UInt32)
    release : Proc(ISwapChainBackgroundPanelNative*, UInt32)
    set_swap_chain : Proc(ISwapChainBackgroundPanelNative*, IDXGISwapChain, HRESULT)
  end

  struct ISwapChainBackgroundPanelNative
    lpVtbl : ISwapChainBackgroundPanelNativeVTbl*
  end

  struct ISurfaceImageSourceManagerNativeVTbl
    query_interface : Proc(ISurfaceImageSourceManagerNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISurfaceImageSourceManagerNative*, UInt32)
    release : Proc(ISurfaceImageSourceManagerNative*, UInt32)
    flush_all_surfaces_with_device : Proc(ISurfaceImageSourceManagerNative*, IUnknown, HRESULT)
  end

  struct ISurfaceImageSourceManagerNative
    lpVtbl : ISurfaceImageSourceManagerNativeVTbl*
  end

  struct ISurfaceImageSourceNativeWithD2DVTbl
    query_interface : Proc(ISurfaceImageSourceNativeWithD2D*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISurfaceImageSourceNativeWithD2D*, UInt32)
    release : Proc(ISurfaceImageSourceNativeWithD2D*, UInt32)
    set_device : Proc(ISurfaceImageSourceNativeWithD2D*, IUnknown, HRESULT)
    begin_draw : Proc(ISurfaceImageSourceNativeWithD2D*, RECT*, Guid*, Void**, POINT*, HRESULT)
    end_draw : Proc(ISurfaceImageSourceNativeWithD2D*, HRESULT)
    suspend_draw : Proc(ISurfaceImageSourceNativeWithD2D*, HRESULT)
    resume_draw : Proc(ISurfaceImageSourceNativeWithD2D*, HRESULT)
  end

  struct ISurfaceImageSourceNativeWithD2D
    lpVtbl : ISurfaceImageSourceNativeWithD2DVTbl*
  end

  struct ISwapChainPanelNativeVTbl
    query_interface : Proc(ISwapChainPanelNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainPanelNative*, UInt32)
    release : Proc(ISwapChainPanelNative*, UInt32)
    set_swap_chain : Proc(ISwapChainPanelNative*, IDXGISwapChain, HRESULT)
  end

  struct ISwapChainPanelNative
    lpVtbl : ISwapChainPanelNativeVTbl*
  end

  struct ISwapChainPanelNative2VTbl
    query_interface : Proc(ISwapChainPanelNative2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainPanelNative2*, UInt32)
    release : Proc(ISwapChainPanelNative2*, UInt32)
    set_swap_chain : Proc(ISwapChainPanelNative2*, IDXGISwapChain, HRESULT)
    set_swap_chain_handle : Proc(ISwapChainPanelNative2*, LibC::HANDLE, HRESULT)
  end

  struct ISwapChainPanelNative2
    lpVtbl : ISwapChainPanelNative2VTbl*
  end

  struct IDesktopWindowXamlSourceNativeVTbl
    query_interface : Proc(IDesktopWindowXamlSourceNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDesktopWindowXamlSourceNative*, UInt32)
    release : Proc(IDesktopWindowXamlSourceNative*, UInt32)
    attach_to_window : Proc(IDesktopWindowXamlSourceNative*, LibC::HANDLE, HRESULT)
    get_window_handle : Proc(IDesktopWindowXamlSourceNative*, HANDLE*, HRESULT)
  end

  struct IDesktopWindowXamlSourceNative
    lpVtbl : IDesktopWindowXamlSourceNativeVTbl*
  end

  struct IDesktopWindowXamlSourceNative2VTbl
    query_interface : Proc(IDesktopWindowXamlSourceNative2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDesktopWindowXamlSourceNative2*, UInt32)
    release : Proc(IDesktopWindowXamlSourceNative2*, UInt32)
    attach_to_window : Proc(IDesktopWindowXamlSourceNative2*, LibC::HANDLE, HRESULT)
    get_window_handle : Proc(IDesktopWindowXamlSourceNative2*, HANDLE*, HRESULT)
    pre_translate_message : Proc(IDesktopWindowXamlSourceNative2*, MSG*, LibC::BOOL*, HRESULT)
  end

  struct IDesktopWindowXamlSourceNative2
    lpVtbl : IDesktopWindowXamlSourceNative2VTbl*
  end

  struct IReferenceTrackerTargetVTbl
    query_interface : Proc(IReferenceTrackerTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceTrackerTarget*, UInt32)
    release : Proc(IReferenceTrackerTarget*, UInt32)
    add_ref_from_reference_tracker : Proc(IReferenceTrackerTarget*, UInt32)
    release_from_reference_tracker : Proc(IReferenceTrackerTarget*, UInt32)
    peg : Proc(IReferenceTrackerTarget*, HRESULT)
    unpeg : Proc(IReferenceTrackerTarget*, HRESULT)
  end

  struct IReferenceTrackerTarget
    lpVtbl : IReferenceTrackerTargetVTbl*
  end

  struct IReferenceTrackerVTbl
    query_interface : Proc(IReferenceTracker*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceTracker*, UInt32)
    release : Proc(IReferenceTracker*, UInt32)
    connect_from_tracker_source : Proc(IReferenceTracker*, HRESULT)
    disconnect_from_tracker_source : Proc(IReferenceTracker*, HRESULT)
    find_tracker_targets : Proc(IReferenceTracker*, IFindReferenceTargetsCallback, HRESULT)
    get_reference_tracker_manager : Proc(IReferenceTracker*, IReferenceTrackerManager*, HRESULT)
    add_ref_from_tracker_source : Proc(IReferenceTracker*, HRESULT)
    release_from_tracker_source : Proc(IReferenceTracker*, HRESULT)
    peg_from_tracker_source : Proc(IReferenceTracker*, HRESULT)
  end

  struct IReferenceTracker
    lpVtbl : IReferenceTrackerVTbl*
  end

  struct IReferenceTrackerManagerVTbl
    query_interface : Proc(IReferenceTrackerManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceTrackerManager*, UInt32)
    release : Proc(IReferenceTrackerManager*, UInt32)
    reference_tracking_started : Proc(IReferenceTrackerManager*, HRESULT)
    find_tracker_targets_completed : Proc(IReferenceTrackerManager*, UInt8, HRESULT)
    reference_tracking_completed : Proc(IReferenceTrackerManager*, HRESULT)
    set_reference_tracker_host : Proc(IReferenceTrackerManager*, IReferenceTrackerHost, HRESULT)
  end

  struct IReferenceTrackerManager
    lpVtbl : IReferenceTrackerManagerVTbl*
  end

  struct IFindReferenceTargetsCallbackVTbl
    query_interface : Proc(IFindReferenceTargetsCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFindReferenceTargetsCallback*, UInt32)
    release : Proc(IFindReferenceTargetsCallback*, UInt32)
    found_tracker_target : Proc(IFindReferenceTargetsCallback*, IReferenceTrackerTarget, HRESULT)
  end

  struct IFindReferenceTargetsCallback
    lpVtbl : IFindReferenceTargetsCallbackVTbl*
  end

  struct IReferenceTrackerHostVTbl
    query_interface : Proc(IReferenceTrackerHost*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceTrackerHost*, UInt32)
    release : Proc(IReferenceTrackerHost*, UInt32)
    disconnect_unused_reference_sources : Proc(IReferenceTrackerHost*, XAML_REFERENCETRACKER_DISCONNECT, HRESULT)
    release_disconnected_reference_sources : Proc(IReferenceTrackerHost*, HRESULT)
    notify_end_of_reference_tracking_on_thread : Proc(IReferenceTrackerHost*, HRESULT)
    get_tracker_target : Proc(IReferenceTrackerHost*, IUnknown, IReferenceTrackerTarget*, HRESULT)
    add_memory_pressure : Proc(IReferenceTrackerHost*, UInt64, HRESULT)
    remove_memory_pressure : Proc(IReferenceTrackerHost*, UInt64, HRESULT)
  end

  struct IReferenceTrackerHost
    lpVtbl : IReferenceTrackerHostVTbl*
  end

  struct IReferenceTrackerExtensionVTbl
    query_interface : Proc(IReferenceTrackerExtension*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceTrackerExtension*, UInt32)
    release : Proc(IReferenceTrackerExtension*, UInt32)
  end

  struct IReferenceTrackerExtension
    lpVtbl : IReferenceTrackerExtensionVTbl*
  end

  struct ITrackerOwnerVTbl
    query_interface : Proc(ITrackerOwner*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITrackerOwner*, UInt32)
    release : Proc(ITrackerOwner*, UInt32)
    create_tracker_handle : Proc(ITrackerOwner*, TrackerHandle__**, HRESULT)
    delete_tracker_handle : Proc(ITrackerOwner*, TrackerHandle__*, HRESULT)
    set_tracker_value : Proc(ITrackerOwner*, TrackerHandle__*, IUnknown, HRESULT)
    try_get_safe_tracker_value : Proc(ITrackerOwner*, TrackerHandle__*, IUnknown*, UInt8)
  end

  struct ITrackerOwner
    lpVtbl : ITrackerOwnerVTbl*
  end

end
