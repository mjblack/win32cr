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
    query_interface : Proc(ISurfaceImageSourceNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISurfaceImageSourceNative*, UInt32)
    release : Proc(ISurfaceImageSourceNative*, UInt32)
    set_device : Proc(ISurfaceImageSourceNative*, IDXGIDevice, HRESULT)
    begin_draw : Proc(ISurfaceImageSourceNative*, RECT, IDXGISurface*, POINT*, HRESULT)
    end_draw : Proc(ISurfaceImageSourceNative*, HRESULT)
  end

  ISurfaceImageSourceNative_GUID = "f2e9edc1-d307-4525-9886-0fafaa44163c"
  IID_ISurfaceImageSourceNative = LibC::GUID.new(0xf2e9edc1_u32, 0xd307_u16, 0x4525_u16, StaticArray[0x98_u8, 0x86_u8, 0xf_u8, 0xaf_u8, 0xaa_u8, 0x44_u8, 0x16_u8, 0x3c_u8])
  struct ISurfaceImageSourceNative
    lpVtbl : ISurfaceImageSourceNativeVTbl*
  end

  struct IVirtualSurfaceUpdatesCallbackNativeVTbl
    query_interface : Proc(IVirtualSurfaceUpdatesCallbackNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVirtualSurfaceUpdatesCallbackNative*, UInt32)
    release : Proc(IVirtualSurfaceUpdatesCallbackNative*, UInt32)
    updates_needed : Proc(IVirtualSurfaceUpdatesCallbackNative*, HRESULT)
  end

  IVirtualSurfaceUpdatesCallbackNative_GUID = "dbf2e947-8e6c-4254-9eee-7738f71386c9"
  IID_IVirtualSurfaceUpdatesCallbackNative = LibC::GUID.new(0xdbf2e947_u32, 0x8e6c_u16, 0x4254_u16, StaticArray[0x9e_u8, 0xee_u8, 0x77_u8, 0x38_u8, 0xf7_u8, 0x13_u8, 0x86_u8, 0xc9_u8])
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

  IVirtualSurfaceImageSourceNative_GUID = "e9550983-360b-4f53-b391-afd695078691"
  IID_IVirtualSurfaceImageSourceNative = LibC::GUID.new(0xe9550983_u32, 0x360b_u16, 0x4f53_u16, StaticArray[0xb3_u8, 0x91_u8, 0xaf_u8, 0xd6_u8, 0x95_u8, 0x7_u8, 0x86_u8, 0x91_u8])
  struct IVirtualSurfaceImageSourceNative
    lpVtbl : IVirtualSurfaceImageSourceNativeVTbl*
  end

  struct ISwapChainBackgroundPanelNativeVTbl
    query_interface : Proc(ISwapChainBackgroundPanelNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainBackgroundPanelNative*, UInt32)
    release : Proc(ISwapChainBackgroundPanelNative*, UInt32)
    set_swap_chain : Proc(ISwapChainBackgroundPanelNative*, IDXGISwapChain, HRESULT)
  end

  ISwapChainBackgroundPanelNative_GUID = "43bebd4e-add5-4035-8f85-5608d08e9dc9"
  IID_ISwapChainBackgroundPanelNative = LibC::GUID.new(0x43bebd4e_u32, 0xadd5_u16, 0x4035_u16, StaticArray[0x8f_u8, 0x85_u8, 0x56_u8, 0x8_u8, 0xd0_u8, 0x8e_u8, 0x9d_u8, 0xc9_u8])
  struct ISwapChainBackgroundPanelNative
    lpVtbl : ISwapChainBackgroundPanelNativeVTbl*
  end

  struct ISurfaceImageSourceManagerNativeVTbl
    query_interface : Proc(ISurfaceImageSourceManagerNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISurfaceImageSourceManagerNative*, UInt32)
    release : Proc(ISurfaceImageSourceManagerNative*, UInt32)
    flush_all_surfaces_with_device : Proc(ISurfaceImageSourceManagerNative*, IUnknown, HRESULT)
  end

  ISurfaceImageSourceManagerNative_GUID = "4c8798b7-1d88-4a0f-b59b-b93f600de8c8"
  IID_ISurfaceImageSourceManagerNative = LibC::GUID.new(0x4c8798b7_u32, 0x1d88_u16, 0x4a0f_u16, StaticArray[0xb5_u8, 0x9b_u8, 0xb9_u8, 0x3f_u8, 0x60_u8, 0xd_u8, 0xe8_u8, 0xc8_u8])
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

  ISurfaceImageSourceNativeWithD2D_GUID = "54298223-41e1-4a41-9c08-02e8256864a1"
  IID_ISurfaceImageSourceNativeWithD2D = LibC::GUID.new(0x54298223_u32, 0x41e1_u16, 0x4a41_u16, StaticArray[0x9c_u8, 0x8_u8, 0x2_u8, 0xe8_u8, 0x25_u8, 0x68_u8, 0x64_u8, 0xa1_u8])
  struct ISurfaceImageSourceNativeWithD2D
    lpVtbl : ISurfaceImageSourceNativeWithD2DVTbl*
  end

  struct ISwapChainPanelNativeVTbl
    query_interface : Proc(ISwapChainPanelNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISwapChainPanelNative*, UInt32)
    release : Proc(ISwapChainPanelNative*, UInt32)
    set_swap_chain : Proc(ISwapChainPanelNative*, IDXGISwapChain, HRESULT)
  end

  ISwapChainPanelNative_GUID = "f92f19d2-3ade-45a6-a20c-f6f1ea90554b"
  IID_ISwapChainPanelNative = LibC::GUID.new(0xf92f19d2_u32, 0x3ade_u16, 0x45a6_u16, StaticArray[0xa2_u8, 0xc_u8, 0xf6_u8, 0xf1_u8, 0xea_u8, 0x90_u8, 0x55_u8, 0x4b_u8])
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

  ISwapChainPanelNative2_GUID = "d5a2f60c-37b2-44a2-937b-8d8eb9726821"
  IID_ISwapChainPanelNative2 = LibC::GUID.new(0xd5a2f60c_u32, 0x37b2_u16, 0x44a2_u16, StaticArray[0x93_u8, 0x7b_u8, 0x8d_u8, 0x8e_u8, 0xb9_u8, 0x72_u8, 0x68_u8, 0x21_u8])
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

  IDesktopWindowXamlSourceNative_GUID = "3cbcf1bf-2f76-4e9c-96ab-e84b37972554"
  IID_IDesktopWindowXamlSourceNative = LibC::GUID.new(0x3cbcf1bf_u32, 0x2f76_u16, 0x4e9c_u16, StaticArray[0x96_u8, 0xab_u8, 0xe8_u8, 0x4b_u8, 0x37_u8, 0x97_u8, 0x25_u8, 0x54_u8])
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

  IDesktopWindowXamlSourceNative2_GUID = "e3dcd8c7-3057-4692-99c3-7b7720afda31"
  IID_IDesktopWindowXamlSourceNative2 = LibC::GUID.new(0xe3dcd8c7_u32, 0x3057_u16, 0x4692_u16, StaticArray[0x99_u8, 0xc3_u8, 0x7b_u8, 0x77_u8, 0x20_u8, 0xaf_u8, 0xda_u8, 0x31_u8])
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

  IReferenceTrackerTarget_GUID = "64bd43f8-bfee-4ec4-b7eb-2935158dae21"
  IID_IReferenceTrackerTarget = LibC::GUID.new(0x64bd43f8_u32, 0xbfee_u16, 0x4ec4_u16, StaticArray[0xb7_u8, 0xeb_u8, 0x29_u8, 0x35_u8, 0x15_u8, 0x8d_u8, 0xae_u8, 0x21_u8])
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

  IReferenceTracker_GUID = "11d3b13a-180e-4789-a8be-7712882893e6"
  IID_IReferenceTracker = LibC::GUID.new(0x11d3b13a_u32, 0x180e_u16, 0x4789_u16, StaticArray[0xa8_u8, 0xbe_u8, 0x77_u8, 0x12_u8, 0x88_u8, 0x28_u8, 0x93_u8, 0xe6_u8])
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

  IReferenceTrackerManager_GUID = "3cf184b4-7ccb-4dda-8455-7e6ce99a3298"
  IID_IReferenceTrackerManager = LibC::GUID.new(0x3cf184b4_u32, 0x7ccb_u16, 0x4dda_u16, StaticArray[0x84_u8, 0x55_u8, 0x7e_u8, 0x6c_u8, 0xe9_u8, 0x9a_u8, 0x32_u8, 0x98_u8])
  struct IReferenceTrackerManager
    lpVtbl : IReferenceTrackerManagerVTbl*
  end

  struct IFindReferenceTargetsCallbackVTbl
    query_interface : Proc(IFindReferenceTargetsCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFindReferenceTargetsCallback*, UInt32)
    release : Proc(IFindReferenceTargetsCallback*, UInt32)
    found_tracker_target : Proc(IFindReferenceTargetsCallback*, IReferenceTrackerTarget, HRESULT)
  end

  IFindReferenceTargetsCallback_GUID = "04b3486c-4687-4229-8d14-505ab584dd88"
  IID_IFindReferenceTargetsCallback = LibC::GUID.new(0x4b3486c_u32, 0x4687_u16, 0x4229_u16, StaticArray[0x8d_u8, 0x14_u8, 0x50_u8, 0x5a_u8, 0xb5_u8, 0x84_u8, 0xdd_u8, 0x88_u8])
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

  IReferenceTrackerHost_GUID = "29a71c6a-3c42-4416-a39d-e2825a07a773"
  IID_IReferenceTrackerHost = LibC::GUID.new(0x29a71c6a_u32, 0x3c42_u16, 0x4416_u16, StaticArray[0xa3_u8, 0x9d_u8, 0xe2_u8, 0x82_u8, 0x5a_u8, 0x7_u8, 0xa7_u8, 0x73_u8])
  struct IReferenceTrackerHost
    lpVtbl : IReferenceTrackerHostVTbl*
  end

  struct IReferenceTrackerExtensionVTbl
    query_interface : Proc(IReferenceTrackerExtension*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceTrackerExtension*, UInt32)
    release : Proc(IReferenceTrackerExtension*, UInt32)
  end

  IReferenceTrackerExtension_GUID = "4e897caa-59d5-4613-8f8c-f7ebd1f399b0"
  IID_IReferenceTrackerExtension = LibC::GUID.new(0x4e897caa_u32, 0x59d5_u16, 0x4613_u16, StaticArray[0x8f_u8, 0x8c_u8, 0xf7_u8, 0xeb_u8, 0xd1_u8, 0xf3_u8, 0x99_u8, 0xb0_u8])
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

  ITrackerOwner_GUID = "eb24c20b-9816-4ac7-8cff-36f67a118f4e"
  IID_ITrackerOwner = LibC::GUID.new(0xeb24c20b_u32, 0x9816_u16, 0x4ac7_u16, StaticArray[0x8c_u8, 0xff_u8, 0x36_u8, 0xf6_u8, 0x7a_u8, 0x11_u8, 0x8f_u8, 0x4e_u8])
  struct ITrackerOwner
    lpVtbl : ITrackerOwnerVTbl*
  end

end
struct LibWin32::ISurfaceImageSourceNative
  def query_interface(this : ISurfaceImageSourceNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISurfaceImageSourceNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISurfaceImageSourceNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_device(this : ISurfaceImageSourceNative*, device : IDXGIDevice) : HRESULT
    @lpVtbl.value.set_device.call(this, device)
  end
  def begin_draw(this : ISurfaceImageSourceNative*, updaterect : RECT, surface : IDXGISurface*, offset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.call(this, updaterect, surface, offset)
  end
  def end_draw(this : ISurfaceImageSourceNative*) : HRESULT
    @lpVtbl.value.end_draw.call(this)
  end
end
struct LibWin32::IVirtualSurfaceUpdatesCallbackNative
  def query_interface(this : IVirtualSurfaceUpdatesCallbackNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVirtualSurfaceUpdatesCallbackNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVirtualSurfaceUpdatesCallbackNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def updates_needed(this : IVirtualSurfaceUpdatesCallbackNative*) : HRESULT
    @lpVtbl.value.updates_needed.call(this)
  end
end
struct LibWin32::IVirtualSurfaceImageSourceNative
  def query_interface(this : IVirtualSurfaceImageSourceNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVirtualSurfaceImageSourceNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVirtualSurfaceImageSourceNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_device(this : IVirtualSurfaceImageSourceNative*, device : IDXGIDevice) : HRESULT
    @lpVtbl.value.set_device.call(this, device)
  end
  def begin_draw(this : IVirtualSurfaceImageSourceNative*, updaterect : RECT, surface : IDXGISurface*, offset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.call(this, updaterect, surface, offset)
  end
  def end_draw(this : IVirtualSurfaceImageSourceNative*) : HRESULT
    @lpVtbl.value.end_draw.call(this)
  end
  def invalidate(this : IVirtualSurfaceImageSourceNative*, updaterect : RECT) : HRESULT
    @lpVtbl.value.invalidate.call(this, updaterect)
  end
  def get_update_rect_count(this : IVirtualSurfaceImageSourceNative*, count : UInt32*) : HRESULT
    @lpVtbl.value.get_update_rect_count.call(this, count)
  end
  def get_update_rects(this : IVirtualSurfaceImageSourceNative*, updates : RECT*, count : UInt32) : HRESULT
    @lpVtbl.value.get_update_rects.call(this, updates, count)
  end
  def get_visible_bounds(this : IVirtualSurfaceImageSourceNative*, bounds : RECT*) : HRESULT
    @lpVtbl.value.get_visible_bounds.call(this, bounds)
  end
  def register_for_updates_needed(this : IVirtualSurfaceImageSourceNative*, callback : IVirtualSurfaceUpdatesCallbackNative) : HRESULT
    @lpVtbl.value.register_for_updates_needed.call(this, callback)
  end
  def resize(this : IVirtualSurfaceImageSourceNative*, newwidth : Int32, newheight : Int32) : HRESULT
    @lpVtbl.value.resize.call(this, newwidth, newheight)
  end
end
struct LibWin32::ISwapChainBackgroundPanelNative
  def query_interface(this : ISwapChainBackgroundPanelNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISwapChainBackgroundPanelNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISwapChainBackgroundPanelNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_swap_chain(this : ISwapChainBackgroundPanelNative*, swapchain : IDXGISwapChain) : HRESULT
    @lpVtbl.value.set_swap_chain.call(this, swapchain)
  end
end
struct LibWin32::ISurfaceImageSourceManagerNative
  def query_interface(this : ISurfaceImageSourceManagerNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISurfaceImageSourceManagerNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISurfaceImageSourceManagerNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def flush_all_surfaces_with_device(this : ISurfaceImageSourceManagerNative*, device : IUnknown) : HRESULT
    @lpVtbl.value.flush_all_surfaces_with_device.call(this, device)
  end
end
struct LibWin32::ISurfaceImageSourceNativeWithD2D
  def query_interface(this : ISurfaceImageSourceNativeWithD2D*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISurfaceImageSourceNativeWithD2D*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISurfaceImageSourceNativeWithD2D*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_device(this : ISurfaceImageSourceNativeWithD2D*, device : IUnknown) : HRESULT
    @lpVtbl.value.set_device.call(this, device)
  end
  def begin_draw(this : ISurfaceImageSourceNativeWithD2D*, updaterect : RECT*, iid : Guid*, updateobject : Void**, offset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.call(this, updaterect, iid, updateobject, offset)
  end
  def end_draw(this : ISurfaceImageSourceNativeWithD2D*) : HRESULT
    @lpVtbl.value.end_draw.call(this)
  end
  def suspend_draw(this : ISurfaceImageSourceNativeWithD2D*) : HRESULT
    @lpVtbl.value.suspend_draw.call(this)
  end
  def resume_draw(this : ISurfaceImageSourceNativeWithD2D*) : HRESULT
    @lpVtbl.value.resume_draw.call(this)
  end
end
struct LibWin32::ISwapChainPanelNative
  def query_interface(this : ISwapChainPanelNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISwapChainPanelNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISwapChainPanelNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_swap_chain(this : ISwapChainPanelNative*, swapchain : IDXGISwapChain) : HRESULT
    @lpVtbl.value.set_swap_chain.call(this, swapchain)
  end
end
struct LibWin32::ISwapChainPanelNative2
  def query_interface(this : ISwapChainPanelNative2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISwapChainPanelNative2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISwapChainPanelNative2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_swap_chain(this : ISwapChainPanelNative2*, swapchain : IDXGISwapChain) : HRESULT
    @lpVtbl.value.set_swap_chain.call(this, swapchain)
  end
  def set_swap_chain_handle(this : ISwapChainPanelNative2*, swapchainhandle : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_swap_chain_handle.call(this, swapchainhandle)
  end
end
struct LibWin32::IDesktopWindowXamlSourceNative
  def query_interface(this : IDesktopWindowXamlSourceNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDesktopWindowXamlSourceNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDesktopWindowXamlSourceNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def attach_to_window(this : IDesktopWindowXamlSourceNative*, parentwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.attach_to_window.call(this, parentwnd)
  end
  def get_window_handle(this : IDesktopWindowXamlSourceNative*, hwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_window_handle.call(this, hwnd)
  end
end
struct LibWin32::IDesktopWindowXamlSourceNative2
  def query_interface(this : IDesktopWindowXamlSourceNative2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDesktopWindowXamlSourceNative2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDesktopWindowXamlSourceNative2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def attach_to_window(this : IDesktopWindowXamlSourceNative2*, parentwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.attach_to_window.call(this, parentwnd)
  end
  def get_window_handle(this : IDesktopWindowXamlSourceNative2*, hwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_window_handle.call(this, hwnd)
  end
  def pre_translate_message(this : IDesktopWindowXamlSourceNative2*, message : MSG*, result : LibC::BOOL*) : HRESULT
    @lpVtbl.value.pre_translate_message.call(this, message, result)
  end
end
struct LibWin32::IReferenceTrackerTarget
  def query_interface(this : IReferenceTrackerTarget*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IReferenceTrackerTarget*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IReferenceTrackerTarget*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_ref_from_reference_tracker(this : IReferenceTrackerTarget*) : UInt32
    @lpVtbl.value.add_ref_from_reference_tracker.call(this)
  end
  def release_from_reference_tracker(this : IReferenceTrackerTarget*) : UInt32
    @lpVtbl.value.release_from_reference_tracker.call(this)
  end
  def peg(this : IReferenceTrackerTarget*) : HRESULT
    @lpVtbl.value.peg.call(this)
  end
  def unpeg(this : IReferenceTrackerTarget*) : HRESULT
    @lpVtbl.value.unpeg.call(this)
  end
end
struct LibWin32::IReferenceTracker
  def query_interface(this : IReferenceTracker*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IReferenceTracker*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IReferenceTracker*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connect_from_tracker_source(this : IReferenceTracker*) : HRESULT
    @lpVtbl.value.connect_from_tracker_source.call(this)
  end
  def disconnect_from_tracker_source(this : IReferenceTracker*) : HRESULT
    @lpVtbl.value.disconnect_from_tracker_source.call(this)
  end
  def find_tracker_targets(this : IReferenceTracker*, callback : IFindReferenceTargetsCallback) : HRESULT
    @lpVtbl.value.find_tracker_targets.call(this, callback)
  end
  def get_reference_tracker_manager(this : IReferenceTracker*, value : IReferenceTrackerManager*) : HRESULT
    @lpVtbl.value.get_reference_tracker_manager.call(this, value)
  end
  def add_ref_from_tracker_source(this : IReferenceTracker*) : HRESULT
    @lpVtbl.value.add_ref_from_tracker_source.call(this)
  end
  def release_from_tracker_source(this : IReferenceTracker*) : HRESULT
    @lpVtbl.value.release_from_tracker_source.call(this)
  end
  def peg_from_tracker_source(this : IReferenceTracker*) : HRESULT
    @lpVtbl.value.peg_from_tracker_source.call(this)
  end
end
struct LibWin32::IReferenceTrackerManager
  def query_interface(this : IReferenceTrackerManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IReferenceTrackerManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IReferenceTrackerManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reference_tracking_started(this : IReferenceTrackerManager*) : HRESULT
    @lpVtbl.value.reference_tracking_started.call(this)
  end
  def find_tracker_targets_completed(this : IReferenceTrackerManager*, findfailed : UInt8) : HRESULT
    @lpVtbl.value.find_tracker_targets_completed.call(this, findfailed)
  end
  def reference_tracking_completed(this : IReferenceTrackerManager*) : HRESULT
    @lpVtbl.value.reference_tracking_completed.call(this)
  end
  def set_reference_tracker_host(this : IReferenceTrackerManager*, value : IReferenceTrackerHost) : HRESULT
    @lpVtbl.value.set_reference_tracker_host.call(this, value)
  end
end
struct LibWin32::IFindReferenceTargetsCallback
  def query_interface(this : IFindReferenceTargetsCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFindReferenceTargetsCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFindReferenceTargetsCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def found_tracker_target(this : IFindReferenceTargetsCallback*, target : IReferenceTrackerTarget) : HRESULT
    @lpVtbl.value.found_tracker_target.call(this, target)
  end
end
struct LibWin32::IReferenceTrackerHost
  def query_interface(this : IReferenceTrackerHost*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IReferenceTrackerHost*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IReferenceTrackerHost*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def disconnect_unused_reference_sources(this : IReferenceTrackerHost*, options : XAML_REFERENCETRACKER_DISCONNECT) : HRESULT
    @lpVtbl.value.disconnect_unused_reference_sources.call(this, options)
  end
  def release_disconnected_reference_sources(this : IReferenceTrackerHost*) : HRESULT
    @lpVtbl.value.release_disconnected_reference_sources.call(this)
  end
  def notify_end_of_reference_tracking_on_thread(this : IReferenceTrackerHost*) : HRESULT
    @lpVtbl.value.notify_end_of_reference_tracking_on_thread.call(this)
  end
  def get_tracker_target(this : IReferenceTrackerHost*, unknown : IUnknown, newreference : IReferenceTrackerTarget*) : HRESULT
    @lpVtbl.value.get_tracker_target.call(this, unknown, newreference)
  end
  def add_memory_pressure(this : IReferenceTrackerHost*, bytesallocated : UInt64) : HRESULT
    @lpVtbl.value.add_memory_pressure.call(this, bytesallocated)
  end
  def remove_memory_pressure(this : IReferenceTrackerHost*, bytesallocated : UInt64) : HRESULT
    @lpVtbl.value.remove_memory_pressure.call(this, bytesallocated)
  end
end
struct LibWin32::IReferenceTrackerExtension
  def query_interface(this : IReferenceTrackerExtension*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IReferenceTrackerExtension*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IReferenceTrackerExtension*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::ITrackerOwner
  def query_interface(this : ITrackerOwner*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITrackerOwner*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITrackerOwner*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_tracker_handle(this : ITrackerOwner*, returnvalue : TrackerHandle__**) : HRESULT
    @lpVtbl.value.create_tracker_handle.call(this, returnvalue)
  end
  def delete_tracker_handle(this : ITrackerOwner*, handle : TrackerHandle__*) : HRESULT
    @lpVtbl.value.delete_tracker_handle.call(this, handle)
  end
  def set_tracker_value(this : ITrackerOwner*, handle : TrackerHandle__*, value : IUnknown) : HRESULT
    @lpVtbl.value.set_tracker_value.call(this, handle, value)
  end
  def try_get_safe_tracker_value(this : ITrackerOwner*, handle : TrackerHandle__*, returnvalue : IUnknown*) : UInt8
    @lpVtbl.value.try_get_safe_tracker_value.call(this, handle, returnvalue)
  end
end
