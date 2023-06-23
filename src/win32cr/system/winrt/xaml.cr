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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_device : UInt64
    begin_draw : UInt64
    end_draw : UInt64
  end

  ISurfaceImageSourceNative_GUID = "f2e9edc1-d307-4525-9886-0fafaa44163c"
  IID_ISurfaceImageSourceNative = LibC::GUID.new(0xf2e9edc1_u32, 0xd307_u16, 0x4525_u16, StaticArray[0x98_u8, 0x86_u8, 0xf_u8, 0xaf_u8, 0xaa_u8, 0x44_u8, 0x16_u8, 0x3c_u8])
  struct ISurfaceImageSourceNative
    lpVtbl : ISurfaceImageSourceNativeVTbl*
  end

  struct IVirtualSurfaceUpdatesCallbackNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    updates_needed : UInt64
  end

  IVirtualSurfaceUpdatesCallbackNative_GUID = "dbf2e947-8e6c-4254-9eee-7738f71386c9"
  IID_IVirtualSurfaceUpdatesCallbackNative = LibC::GUID.new(0xdbf2e947_u32, 0x8e6c_u16, 0x4254_u16, StaticArray[0x9e_u8, 0xee_u8, 0x77_u8, 0x38_u8, 0xf7_u8, 0x13_u8, 0x86_u8, 0xc9_u8])
  struct IVirtualSurfaceUpdatesCallbackNative
    lpVtbl : IVirtualSurfaceUpdatesCallbackNativeVTbl*
  end

  struct IVirtualSurfaceImageSourceNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_device : UInt64
    begin_draw : UInt64
    end_draw : UInt64
    invalidate : UInt64
    get_update_rect_count : UInt64
    get_update_rects : UInt64
    get_visible_bounds : UInt64
    register_for_updates_needed : UInt64
    resize : UInt64
  end

  IVirtualSurfaceImageSourceNative_GUID = "e9550983-360b-4f53-b391-afd695078691"
  IID_IVirtualSurfaceImageSourceNative = LibC::GUID.new(0xe9550983_u32, 0x360b_u16, 0x4f53_u16, StaticArray[0xb3_u8, 0x91_u8, 0xaf_u8, 0xd6_u8, 0x95_u8, 0x7_u8, 0x86_u8, 0x91_u8])
  struct IVirtualSurfaceImageSourceNative
    lpVtbl : IVirtualSurfaceImageSourceNativeVTbl*
  end

  struct ISwapChainBackgroundPanelNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_swap_chain : UInt64
  end

  ISwapChainBackgroundPanelNative_GUID = "43bebd4e-add5-4035-8f85-5608d08e9dc9"
  IID_ISwapChainBackgroundPanelNative = LibC::GUID.new(0x43bebd4e_u32, 0xadd5_u16, 0x4035_u16, StaticArray[0x8f_u8, 0x85_u8, 0x56_u8, 0x8_u8, 0xd0_u8, 0x8e_u8, 0x9d_u8, 0xc9_u8])
  struct ISwapChainBackgroundPanelNative
    lpVtbl : ISwapChainBackgroundPanelNativeVTbl*
  end

  struct ISurfaceImageSourceManagerNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    flush_all_surfaces_with_device : UInt64
  end

  ISurfaceImageSourceManagerNative_GUID = "4c8798b7-1d88-4a0f-b59b-b93f600de8c8"
  IID_ISurfaceImageSourceManagerNative = LibC::GUID.new(0x4c8798b7_u32, 0x1d88_u16, 0x4a0f_u16, StaticArray[0xb5_u8, 0x9b_u8, 0xb9_u8, 0x3f_u8, 0x60_u8, 0xd_u8, 0xe8_u8, 0xc8_u8])
  struct ISurfaceImageSourceManagerNative
    lpVtbl : ISurfaceImageSourceManagerNativeVTbl*
  end

  struct ISurfaceImageSourceNativeWithD2DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_device : UInt64
    begin_draw : UInt64
    end_draw : UInt64
    suspend_draw : UInt64
    resume_draw : UInt64
  end

  ISurfaceImageSourceNativeWithD2D_GUID = "54298223-41e1-4a41-9c08-02e8256864a1"
  IID_ISurfaceImageSourceNativeWithD2D = LibC::GUID.new(0x54298223_u32, 0x41e1_u16, 0x4a41_u16, StaticArray[0x9c_u8, 0x8_u8, 0x2_u8, 0xe8_u8, 0x25_u8, 0x68_u8, 0x64_u8, 0xa1_u8])
  struct ISurfaceImageSourceNativeWithD2D
    lpVtbl : ISurfaceImageSourceNativeWithD2DVTbl*
  end

  struct ISwapChainPanelNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_swap_chain : UInt64
  end

  ISwapChainPanelNative_GUID = "f92f19d2-3ade-45a6-a20c-f6f1ea90554b"
  IID_ISwapChainPanelNative = LibC::GUID.new(0xf92f19d2_u32, 0x3ade_u16, 0x45a6_u16, StaticArray[0xa2_u8, 0xc_u8, 0xf6_u8, 0xf1_u8, 0xea_u8, 0x90_u8, 0x55_u8, 0x4b_u8])
  struct ISwapChainPanelNative
    lpVtbl : ISwapChainPanelNativeVTbl*
  end

  struct ISwapChainPanelNative2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_swap_chain : UInt64
    set_swap_chain_handle : UInt64
  end

  ISwapChainPanelNative2_GUID = "d5a2f60c-37b2-44a2-937b-8d8eb9726821"
  IID_ISwapChainPanelNative2 = LibC::GUID.new(0xd5a2f60c_u32, 0x37b2_u16, 0x44a2_u16, StaticArray[0x93_u8, 0x7b_u8, 0x8d_u8, 0x8e_u8, 0xb9_u8, 0x72_u8, 0x68_u8, 0x21_u8])
  struct ISwapChainPanelNative2
    lpVtbl : ISwapChainPanelNative2VTbl*
  end

  struct IDesktopWindowXamlSourceNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    attach_to_window : UInt64
    get_window_handle : UInt64
  end

  IDesktopWindowXamlSourceNative_GUID = "3cbcf1bf-2f76-4e9c-96ab-e84b37972554"
  IID_IDesktopWindowXamlSourceNative = LibC::GUID.new(0x3cbcf1bf_u32, 0x2f76_u16, 0x4e9c_u16, StaticArray[0x96_u8, 0xab_u8, 0xe8_u8, 0x4b_u8, 0x37_u8, 0x97_u8, 0x25_u8, 0x54_u8])
  struct IDesktopWindowXamlSourceNative
    lpVtbl : IDesktopWindowXamlSourceNativeVTbl*
  end

  struct IDesktopWindowXamlSourceNative2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    attach_to_window : UInt64
    get_window_handle : UInt64
    pre_translate_message : UInt64
  end

  IDesktopWindowXamlSourceNative2_GUID = "e3dcd8c7-3057-4692-99c3-7b7720afda31"
  IID_IDesktopWindowXamlSourceNative2 = LibC::GUID.new(0xe3dcd8c7_u32, 0x3057_u16, 0x4692_u16, StaticArray[0x99_u8, 0xc3_u8, 0x7b_u8, 0x77_u8, 0x20_u8, 0xaf_u8, 0xda_u8, 0x31_u8])
  struct IDesktopWindowXamlSourceNative2
    lpVtbl : IDesktopWindowXamlSourceNative2VTbl*
  end

  struct IReferenceTrackerTargetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_ref_from_reference_tracker : UInt64
    release_from_reference_tracker : UInt64
    peg : UInt64
    unpeg : UInt64
  end

  IReferenceTrackerTarget_GUID = "64bd43f8-bfee-4ec4-b7eb-2935158dae21"
  IID_IReferenceTrackerTarget = LibC::GUID.new(0x64bd43f8_u32, 0xbfee_u16, 0x4ec4_u16, StaticArray[0xb7_u8, 0xeb_u8, 0x29_u8, 0x35_u8, 0x15_u8, 0x8d_u8, 0xae_u8, 0x21_u8])
  struct IReferenceTrackerTarget
    lpVtbl : IReferenceTrackerTargetVTbl*
  end

  struct IReferenceTrackerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    connect_from_tracker_source : UInt64
    disconnect_from_tracker_source : UInt64
    find_tracker_targets : UInt64
    get_reference_tracker_manager : UInt64
    add_ref_from_tracker_source : UInt64
    release_from_tracker_source : UInt64
    peg_from_tracker_source : UInt64
  end

  IReferenceTracker_GUID = "11d3b13a-180e-4789-a8be-7712882893e6"
  IID_IReferenceTracker = LibC::GUID.new(0x11d3b13a_u32, 0x180e_u16, 0x4789_u16, StaticArray[0xa8_u8, 0xbe_u8, 0x77_u8, 0x12_u8, 0x88_u8, 0x28_u8, 0x93_u8, 0xe6_u8])
  struct IReferenceTracker
    lpVtbl : IReferenceTrackerVTbl*
  end

  struct IReferenceTrackerManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reference_tracking_started : UInt64
    find_tracker_targets_completed : UInt64
    reference_tracking_completed : UInt64
    set_reference_tracker_host : UInt64
  end

  IReferenceTrackerManager_GUID = "3cf184b4-7ccb-4dda-8455-7e6ce99a3298"
  IID_IReferenceTrackerManager = LibC::GUID.new(0x3cf184b4_u32, 0x7ccb_u16, 0x4dda_u16, StaticArray[0x84_u8, 0x55_u8, 0x7e_u8, 0x6c_u8, 0xe9_u8, 0x9a_u8, 0x32_u8, 0x98_u8])
  struct IReferenceTrackerManager
    lpVtbl : IReferenceTrackerManagerVTbl*
  end

  struct IFindReferenceTargetsCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    found_tracker_target : UInt64
  end

  IFindReferenceTargetsCallback_GUID = "04b3486c-4687-4229-8d14-505ab584dd88"
  IID_IFindReferenceTargetsCallback = LibC::GUID.new(0x4b3486c_u32, 0x4687_u16, 0x4229_u16, StaticArray[0x8d_u8, 0x14_u8, 0x50_u8, 0x5a_u8, 0xb5_u8, 0x84_u8, 0xdd_u8, 0x88_u8])
  struct IFindReferenceTargetsCallback
    lpVtbl : IFindReferenceTargetsCallbackVTbl*
  end

  struct IReferenceTrackerHostVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    disconnect_unused_reference_sources : UInt64
    release_disconnected_reference_sources : UInt64
    notify_end_of_reference_tracking_on_thread : UInt64
    get_tracker_target : UInt64
    add_memory_pressure : UInt64
    remove_memory_pressure : UInt64
  end

  IReferenceTrackerHost_GUID = "29a71c6a-3c42-4416-a39d-e2825a07a773"
  IID_IReferenceTrackerHost = LibC::GUID.new(0x29a71c6a_u32, 0x3c42_u16, 0x4416_u16, StaticArray[0xa3_u8, 0x9d_u8, 0xe2_u8, 0x82_u8, 0x5a_u8, 0x7_u8, 0xa7_u8, 0x73_u8])
  struct IReferenceTrackerHost
    lpVtbl : IReferenceTrackerHostVTbl*
  end

  struct IReferenceTrackerExtensionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IReferenceTrackerExtension_GUID = "4e897caa-59d5-4613-8f8c-f7ebd1f399b0"
  IID_IReferenceTrackerExtension = LibC::GUID.new(0x4e897caa_u32, 0x59d5_u16, 0x4613_u16, StaticArray[0x8f_u8, 0x8c_u8, 0xf7_u8, 0xeb_u8, 0xd1_u8, 0xf3_u8, 0x99_u8, 0xb0_u8])
  struct IReferenceTrackerExtension
    lpVtbl : IReferenceTrackerExtensionVTbl*
  end

  struct ITrackerOwnerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_tracker_handle : UInt64
    delete_tracker_handle : UInt64
    set_tracker_value : UInt64
    try_get_safe_tracker_value : UInt64
  end

  ITrackerOwner_GUID = "eb24c20b-9816-4ac7-8cff-36f67a118f4e"
  IID_ITrackerOwner = LibC::GUID.new(0xeb24c20b_u32, 0x9816_u16, 0x4ac7_u16, StaticArray[0x8c_u8, 0xff_u8, 0x36_u8, 0xf6_u8, 0x7a_u8, 0x11_u8, 0x8f_u8, 0x4e_u8])
  struct ITrackerOwner
    lpVtbl : ITrackerOwnerVTbl*
  end

end
struct LibWin32::ISurfaceImageSourceNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_device(device : IDXGIDevice) : HRESULT
    @lpVtbl.value.set_device.unsafe_as(Proc(IDXGIDevice, HRESULT)).call(device)
  end
  def begin_draw(updaterect : RECT, surface : IDXGISurface*, offset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.unsafe_as(Proc(RECT, IDXGISurface*, POINT*, HRESULT)).call(updaterect, surface, offset)
  end
  def end_draw : HRESULT
    @lpVtbl.value.end_draw.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IVirtualSurfaceUpdatesCallbackNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def updates_needed : HRESULT
    @lpVtbl.value.updates_needed.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IVirtualSurfaceImageSourceNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_device(device : IDXGIDevice) : HRESULT
    @lpVtbl.value.set_device.unsafe_as(Proc(IDXGIDevice, HRESULT)).call(device)
  end
  def begin_draw(updaterect : RECT, surface : IDXGISurface*, offset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.unsafe_as(Proc(RECT, IDXGISurface*, POINT*, HRESULT)).call(updaterect, surface, offset)
  end
  def end_draw : HRESULT
    @lpVtbl.value.end_draw.unsafe_as(Proc(HRESULT)).call
  end
  def invalidate(updaterect : RECT) : HRESULT
    @lpVtbl.value.invalidate.unsafe_as(Proc(RECT, HRESULT)).call(updaterect)
  end
  def get_update_rect_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_update_rect_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_update_rects(updates : RECT*, count : UInt32) : HRESULT
    @lpVtbl.value.get_update_rects.unsafe_as(Proc(RECT*, UInt32, HRESULT)).call(updates, count)
  end
  def get_visible_bounds(bounds : RECT*) : HRESULT
    @lpVtbl.value.get_visible_bounds.unsafe_as(Proc(RECT*, HRESULT)).call(bounds)
  end
  def register_for_updates_needed(callback : IVirtualSurfaceUpdatesCallbackNative) : HRESULT
    @lpVtbl.value.register_for_updates_needed.unsafe_as(Proc(IVirtualSurfaceUpdatesCallbackNative, HRESULT)).call(callback)
  end
  def resize(newwidth : Int32, newheight : Int32) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(Int32, Int32, HRESULT)).call(newwidth, newheight)
  end
end
struct LibWin32::ISwapChainBackgroundPanelNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_swap_chain(swapchain : IDXGISwapChain) : HRESULT
    @lpVtbl.value.set_swap_chain.unsafe_as(Proc(IDXGISwapChain, HRESULT)).call(swapchain)
  end
end
struct LibWin32::ISurfaceImageSourceManagerNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def flush_all_surfaces_with_device(device : IUnknown) : HRESULT
    @lpVtbl.value.flush_all_surfaces_with_device.unsafe_as(Proc(IUnknown, HRESULT)).call(device)
  end
end
struct LibWin32::ISurfaceImageSourceNativeWithD2D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_device(device : IUnknown) : HRESULT
    @lpVtbl.value.set_device.unsafe_as(Proc(IUnknown, HRESULT)).call(device)
  end
  def begin_draw(updaterect : RECT*, iid : Guid*, updateobject : Void**, offset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.unsafe_as(Proc(RECT*, Guid*, Void**, POINT*, HRESULT)).call(updaterect, iid, updateobject, offset)
  end
  def end_draw : HRESULT
    @lpVtbl.value.end_draw.unsafe_as(Proc(HRESULT)).call
  end
  def suspend_draw : HRESULT
    @lpVtbl.value.suspend_draw.unsafe_as(Proc(HRESULT)).call
  end
  def resume_draw : HRESULT
    @lpVtbl.value.resume_draw.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISwapChainPanelNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_swap_chain(swapchain : IDXGISwapChain) : HRESULT
    @lpVtbl.value.set_swap_chain.unsafe_as(Proc(IDXGISwapChain, HRESULT)).call(swapchain)
  end
end
struct LibWin32::ISwapChainPanelNative2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_swap_chain(swapchain : IDXGISwapChain) : HRESULT
    @lpVtbl.value.set_swap_chain.unsafe_as(Proc(IDXGISwapChain, HRESULT)).call(swapchain)
  end
  def set_swap_chain_handle(swapchainhandle : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_swap_chain_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(swapchainhandle)
  end
end
struct LibWin32::IDesktopWindowXamlSourceNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def attach_to_window(parentwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.attach_to_window.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(parentwnd)
  end
  def get_window_handle(hwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_window_handle.unsafe_as(Proc(HANDLE*, HRESULT)).call(hwnd)
  end
end
struct LibWin32::IDesktopWindowXamlSourceNative2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def attach_to_window(parentwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.attach_to_window.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(parentwnd)
  end
  def get_window_handle(hwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_window_handle.unsafe_as(Proc(HANDLE*, HRESULT)).call(hwnd)
  end
  def pre_translate_message(message : MSG*, result : LibC::BOOL*) : HRESULT
    @lpVtbl.value.pre_translate_message.unsafe_as(Proc(MSG*, LibC::BOOL*, HRESULT)).call(message, result)
  end
end
struct LibWin32::IReferenceTrackerTarget
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_ref_from_reference_tracker : UInt32
    @lpVtbl.value.add_ref_from_reference_tracker.unsafe_as(Proc(UInt32)).call
  end
  def release_from_reference_tracker : UInt32
    @lpVtbl.value.release_from_reference_tracker.unsafe_as(Proc(UInt32)).call
  end
  def peg : HRESULT
    @lpVtbl.value.peg.unsafe_as(Proc(HRESULT)).call
  end
  def unpeg : HRESULT
    @lpVtbl.value.unpeg.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IReferenceTracker
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def connect_from_tracker_source : HRESULT
    @lpVtbl.value.connect_from_tracker_source.unsafe_as(Proc(HRESULT)).call
  end
  def disconnect_from_tracker_source : HRESULT
    @lpVtbl.value.disconnect_from_tracker_source.unsafe_as(Proc(HRESULT)).call
  end
  def find_tracker_targets(callback : IFindReferenceTargetsCallback) : HRESULT
    @lpVtbl.value.find_tracker_targets.unsafe_as(Proc(IFindReferenceTargetsCallback, HRESULT)).call(callback)
  end
  def get_reference_tracker_manager(value : IReferenceTrackerManager*) : HRESULT
    @lpVtbl.value.get_reference_tracker_manager.unsafe_as(Proc(IReferenceTrackerManager*, HRESULT)).call(value)
  end
  def add_ref_from_tracker_source : HRESULT
    @lpVtbl.value.add_ref_from_tracker_source.unsafe_as(Proc(HRESULT)).call
  end
  def release_from_tracker_source : HRESULT
    @lpVtbl.value.release_from_tracker_source.unsafe_as(Proc(HRESULT)).call
  end
  def peg_from_tracker_source : HRESULT
    @lpVtbl.value.peg_from_tracker_source.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IReferenceTrackerManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reference_tracking_started : HRESULT
    @lpVtbl.value.reference_tracking_started.unsafe_as(Proc(HRESULT)).call
  end
  def find_tracker_targets_completed(findfailed : UInt8) : HRESULT
    @lpVtbl.value.find_tracker_targets_completed.unsafe_as(Proc(UInt8, HRESULT)).call(findfailed)
  end
  def reference_tracking_completed : HRESULT
    @lpVtbl.value.reference_tracking_completed.unsafe_as(Proc(HRESULT)).call
  end
  def set_reference_tracker_host(value : IReferenceTrackerHost) : HRESULT
    @lpVtbl.value.set_reference_tracker_host.unsafe_as(Proc(IReferenceTrackerHost, HRESULT)).call(value)
  end
end
struct LibWin32::IFindReferenceTargetsCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def found_tracker_target(target : IReferenceTrackerTarget) : HRESULT
    @lpVtbl.value.found_tracker_target.unsafe_as(Proc(IReferenceTrackerTarget, HRESULT)).call(target)
  end
end
struct LibWin32::IReferenceTrackerHost
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def disconnect_unused_reference_sources(options : XAML_REFERENCETRACKER_DISCONNECT) : HRESULT
    @lpVtbl.value.disconnect_unused_reference_sources.unsafe_as(Proc(XAML_REFERENCETRACKER_DISCONNECT, HRESULT)).call(options)
  end
  def release_disconnected_reference_sources : HRESULT
    @lpVtbl.value.release_disconnected_reference_sources.unsafe_as(Proc(HRESULT)).call
  end
  def notify_end_of_reference_tracking_on_thread : HRESULT
    @lpVtbl.value.notify_end_of_reference_tracking_on_thread.unsafe_as(Proc(HRESULT)).call
  end
  def get_tracker_target(unknown : IUnknown, newreference : IReferenceTrackerTarget*) : HRESULT
    @lpVtbl.value.get_tracker_target.unsafe_as(Proc(IUnknown, IReferenceTrackerTarget*, HRESULT)).call(unknown, newreference)
  end
  def add_memory_pressure(bytesallocated : UInt64) : HRESULT
    @lpVtbl.value.add_memory_pressure.unsafe_as(Proc(UInt64, HRESULT)).call(bytesallocated)
  end
  def remove_memory_pressure(bytesallocated : UInt64) : HRESULT
    @lpVtbl.value.remove_memory_pressure.unsafe_as(Proc(UInt64, HRESULT)).call(bytesallocated)
  end
end
struct LibWin32::IReferenceTrackerExtension
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::ITrackerOwner
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_tracker_handle(returnvalue : TrackerHandle__**) : HRESULT
    @lpVtbl.value.create_tracker_handle.unsafe_as(Proc(TrackerHandle__**, HRESULT)).call(returnvalue)
  end
  def delete_tracker_handle(handle : TrackerHandle__*) : HRESULT
    @lpVtbl.value.delete_tracker_handle.unsafe_as(Proc(TrackerHandle__*, HRESULT)).call(handle)
  end
  def set_tracker_value(handle : TrackerHandle__*, value : IUnknown) : HRESULT
    @lpVtbl.value.set_tracker_value.unsafe_as(Proc(TrackerHandle__*, IUnknown, HRESULT)).call(handle, value)
  end
  def try_get_safe_tracker_value(handle : TrackerHandle__*, returnvalue : IUnknown*) : UInt8
    @lpVtbl.value.try_get_safe_tracker_value.unsafe_as(Proc(TrackerHandle__*, IUnknown*, UInt8)).call(handle, returnvalue)
  end
end
