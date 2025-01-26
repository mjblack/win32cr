require "./../com.cr"
require "./../../foundation.cr"
require "./../../graphics/dxgi.cr"
require "./../../ui/windows_and_messaging.cr"

module Win32cr::System::WinRT::Xaml
  E_SURFACE_CONTENTS_LOST = 2150301728_u32

  enum XAML_REFERENCETRACKER_DISCONNECT
    XAML_REFERENCETRACKER_DISCONNECT_DEFAULT = 0_i32
    XAML_REFERENCETRACKER_DISCONNECT_SUSPEND = 1_i32
  end

  @[Extern]
  struct TrackerHandle__
    property unused : Int32
    def initialize(@unused : Int32)
    end
  end

  @[Extern]
  record ISurfaceImageSourceNativeVtbl,
    query_interface : Proc(ISurfaceImageSourceNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurfaceImageSourceNative*, UInt32),
    release : Proc(ISurfaceImageSourceNative*, UInt32),
    set_device : Proc(ISurfaceImageSourceNative*, Void*, Win32cr::Foundation::HRESULT),
    begin_draw : Proc(ISurfaceImageSourceNative*, Win32cr::Foundation::RECT, Void**, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    end_draw : Proc(ISurfaceImageSourceNative*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISurfaceImageSourceNative, lpVtbl : ISurfaceImageSourceNativeVtbl* do
    GUID = LibC::GUID.new(0xf2e9edc1_u32, 0xd307_u16, 0x4525_u16, StaticArray[0x98_u8, 0x86_u8, 0xf_u8, 0xaf_u8, 0xaa_u8, 0x44_u8, 0x16_u8, 0x3c_u8])
    def query_interface(this : ISurfaceImageSourceNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurfaceImageSourceNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurfaceImageSourceNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_device(this : ISurfaceImageSourceNative*, device : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device.call(this, device)
    end
    def begin_draw(this : ISurfaceImageSourceNative*, updateRect : Win32cr::Foundation::RECT, surface : Void**, offset : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, updateRect, surface, offset)
    end
    def end_draw(this : ISurfaceImageSourceNative*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end

  end

  @[Extern]
  record IVirtualSurfaceUpdatesCallbackNativeVtbl,
    query_interface : Proc(IVirtualSurfaceUpdatesCallbackNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVirtualSurfaceUpdatesCallbackNative*, UInt32),
    release : Proc(IVirtualSurfaceUpdatesCallbackNative*, UInt32),
    updates_needed : Proc(IVirtualSurfaceUpdatesCallbackNative*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVirtualSurfaceUpdatesCallbackNative, lpVtbl : IVirtualSurfaceUpdatesCallbackNativeVtbl* do
    GUID = LibC::GUID.new(0xdbf2e947_u32, 0x8e6c_u16, 0x4254_u16, StaticArray[0x9e_u8, 0xee_u8, 0x77_u8, 0x38_u8, 0xf7_u8, 0x13_u8, 0x86_u8, 0xc9_u8])
    def query_interface(this : IVirtualSurfaceUpdatesCallbackNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVirtualSurfaceUpdatesCallbackNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVirtualSurfaceUpdatesCallbackNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def updates_needed(this : IVirtualSurfaceUpdatesCallbackNative*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.updates_needed.call(this)
    end

  end

  @[Extern]
  record IVirtualSurfaceImageSourceNativeVtbl,
    query_interface : Proc(IVirtualSurfaceImageSourceNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVirtualSurfaceImageSourceNative*, UInt32),
    release : Proc(IVirtualSurfaceImageSourceNative*, UInt32),
    set_device : Proc(IVirtualSurfaceImageSourceNative*, Void*, Win32cr::Foundation::HRESULT),
    begin_draw : Proc(IVirtualSurfaceImageSourceNative*, Win32cr::Foundation::RECT, Void**, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    end_draw : Proc(IVirtualSurfaceImageSourceNative*, Win32cr::Foundation::HRESULT),
    invalidate : Proc(IVirtualSurfaceImageSourceNative*, Win32cr::Foundation::RECT, Win32cr::Foundation::HRESULT),
    get_update_rect_count : Proc(IVirtualSurfaceImageSourceNative*, UInt32*, Win32cr::Foundation::HRESULT),
    get_update_rects : Proc(IVirtualSurfaceImageSourceNative*, Win32cr::Foundation::RECT*, UInt32, Win32cr::Foundation::HRESULT),
    get_visible_bounds : Proc(IVirtualSurfaceImageSourceNative*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    register_for_updates_needed : Proc(IVirtualSurfaceImageSourceNative*, Void*, Win32cr::Foundation::HRESULT),
    resize : Proc(IVirtualSurfaceImageSourceNative*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVirtualSurfaceImageSourceNative, lpVtbl : IVirtualSurfaceImageSourceNativeVtbl* do
    GUID = LibC::GUID.new(0xe9550983_u32, 0x360b_u16, 0x4f53_u16, StaticArray[0xb3_u8, 0x91_u8, 0xaf_u8, 0xd6_u8, 0x95_u8, 0x7_u8, 0x86_u8, 0x91_u8])
    def query_interface(this : IVirtualSurfaceImageSourceNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVirtualSurfaceImageSourceNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVirtualSurfaceImageSourceNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_device(this : IVirtualSurfaceImageSourceNative*, device : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device.call(this, device)
    end
    def begin_draw(this : IVirtualSurfaceImageSourceNative*, updateRect : Win32cr::Foundation::RECT, surface : Void**, offset : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, updateRect, surface, offset)
    end
    def end_draw(this : IVirtualSurfaceImageSourceNative*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end
    def invalidate(this : IVirtualSurfaceImageSourceNative*, updateRect : Win32cr::Foundation::RECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invalidate.call(this, updateRect)
    end
    def get_update_rect_count(this : IVirtualSurfaceImageSourceNative*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_rect_count.call(this, count)
    end
    def get_update_rects(this : IVirtualSurfaceImageSourceNative*, updates : Win32cr::Foundation::RECT*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_rects.call(this, updates, count)
    end
    def get_visible_bounds(this : IVirtualSurfaceImageSourceNative*, bounds : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_bounds.call(this, bounds)
    end
    def register_for_updates_needed(this : IVirtualSurfaceImageSourceNative*, callback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_for_updates_needed.call(this, callback)
    end
    def resize(this : IVirtualSurfaceImageSourceNative*, newWidth : Int32, newHeight : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, newWidth, newHeight)
    end

  end

  @[Extern]
  record ISwapChainBackgroundPanelNativeVtbl,
    query_interface : Proc(ISwapChainBackgroundPanelNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISwapChainBackgroundPanelNative*, UInt32),
    release : Proc(ISwapChainBackgroundPanelNative*, UInt32),
    set_swap_chain : Proc(ISwapChainBackgroundPanelNative*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISwapChainBackgroundPanelNative, lpVtbl : ISwapChainBackgroundPanelNativeVtbl* do
    GUID = LibC::GUID.new(0x43bebd4e_u32, 0xadd5_u16, 0x4035_u16, StaticArray[0x8f_u8, 0x85_u8, 0x56_u8, 0x8_u8, 0xd0_u8, 0x8e_u8, 0x9d_u8, 0xc9_u8])
    def query_interface(this : ISwapChainBackgroundPanelNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISwapChainBackgroundPanelNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISwapChainBackgroundPanelNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_swap_chain(this : ISwapChainBackgroundPanelNative*, swapChain : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_swap_chain.call(this, swapChain)
    end

  end

  @[Extern]
  record ISurfaceImageSourceManagerNativeVtbl,
    query_interface : Proc(ISurfaceImageSourceManagerNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurfaceImageSourceManagerNative*, UInt32),
    release : Proc(ISurfaceImageSourceManagerNative*, UInt32),
    flush_all_surfaces_with_device : Proc(ISurfaceImageSourceManagerNative*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISurfaceImageSourceManagerNative, lpVtbl : ISurfaceImageSourceManagerNativeVtbl* do
    GUID = LibC::GUID.new(0x4c8798b7_u32, 0x1d88_u16, 0x4a0f_u16, StaticArray[0xb5_u8, 0x9b_u8, 0xb9_u8, 0x3f_u8, 0x60_u8, 0xd_u8, 0xe8_u8, 0xc8_u8])
    def query_interface(this : ISurfaceImageSourceManagerNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurfaceImageSourceManagerNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurfaceImageSourceManagerNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def flush_all_surfaces_with_device(this : ISurfaceImageSourceManagerNative*, device : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush_all_surfaces_with_device.call(this, device)
    end

  end

  @[Extern]
  record ISurfaceImageSourceNativeWithD2DVtbl,
    query_interface : Proc(ISurfaceImageSourceNativeWithD2D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurfaceImageSourceNativeWithD2D*, UInt32),
    release : Proc(ISurfaceImageSourceNativeWithD2D*, UInt32),
    set_device : Proc(ISurfaceImageSourceNativeWithD2D*, Void*, Win32cr::Foundation::HRESULT),
    begin_draw : Proc(ISurfaceImageSourceNativeWithD2D*, Win32cr::Foundation::RECT*, LibC::GUID*, Void**, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    end_draw : Proc(ISurfaceImageSourceNativeWithD2D*, Win32cr::Foundation::HRESULT),
    suspend_draw : Proc(ISurfaceImageSourceNativeWithD2D*, Win32cr::Foundation::HRESULT),
    resume_draw : Proc(ISurfaceImageSourceNativeWithD2D*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISurfaceImageSourceNativeWithD2D, lpVtbl : ISurfaceImageSourceNativeWithD2DVtbl* do
    GUID = LibC::GUID.new(0x54298223_u32, 0x41e1_u16, 0x4a41_u16, StaticArray[0x9c_u8, 0x8_u8, 0x2_u8, 0xe8_u8, 0x25_u8, 0x68_u8, 0x64_u8, 0xa1_u8])
    def query_interface(this : ISurfaceImageSourceNativeWithD2D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurfaceImageSourceNativeWithD2D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurfaceImageSourceNativeWithD2D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_device(this : ISurfaceImageSourceNativeWithD2D*, device : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device.call(this, device)
    end
    def begin_draw(this : ISurfaceImageSourceNativeWithD2D*, updateRect : Win32cr::Foundation::RECT*, iid : LibC::GUID*, updateObject : Void**, offset : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, updateRect, iid, updateObject, offset)
    end
    def end_draw(this : ISurfaceImageSourceNativeWithD2D*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end
    def suspend_draw(this : ISurfaceImageSourceNativeWithD2D*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_draw.call(this)
    end
    def resume_draw(this : ISurfaceImageSourceNativeWithD2D*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_draw.call(this)
    end

  end

  @[Extern]
  record ISwapChainPanelNativeVtbl,
    query_interface : Proc(ISwapChainPanelNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISwapChainPanelNative*, UInt32),
    release : Proc(ISwapChainPanelNative*, UInt32),
    set_swap_chain : Proc(ISwapChainPanelNative*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISwapChainPanelNative, lpVtbl : ISwapChainPanelNativeVtbl* do
    GUID = LibC::GUID.new(0xf92f19d2_u32, 0x3ade_u16, 0x45a6_u16, StaticArray[0xa2_u8, 0xc_u8, 0xf6_u8, 0xf1_u8, 0xea_u8, 0x90_u8, 0x55_u8, 0x4b_u8])
    def query_interface(this : ISwapChainPanelNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISwapChainPanelNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISwapChainPanelNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_swap_chain(this : ISwapChainPanelNative*, swapChain : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_swap_chain.call(this, swapChain)
    end

  end

  @[Extern]
  record ISwapChainPanelNative2Vtbl,
    query_interface : Proc(ISwapChainPanelNative2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISwapChainPanelNative2*, UInt32),
    release : Proc(ISwapChainPanelNative2*, UInt32),
    set_swap_chain : Proc(ISwapChainPanelNative2*, Void*, Win32cr::Foundation::HRESULT),
    set_swap_chain_handle : Proc(ISwapChainPanelNative2*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISwapChainPanelNative2, lpVtbl : ISwapChainPanelNative2Vtbl* do
    GUID = LibC::GUID.new(0xd5a2f60c_u32, 0x37b2_u16, 0x44a2_u16, StaticArray[0x93_u8, 0x7b_u8, 0x8d_u8, 0x8e_u8, 0xb9_u8, 0x72_u8, 0x68_u8, 0x21_u8])
    def query_interface(this : ISwapChainPanelNative2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISwapChainPanelNative2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISwapChainPanelNative2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_swap_chain(this : ISwapChainPanelNative2*, swapChain : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_swap_chain.call(this, swapChain)
    end
    def set_swap_chain_handle(this : ISwapChainPanelNative2*, swapChainHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_swap_chain_handle.call(this, swapChainHandle)
    end

  end

  @[Extern]
  record IDesktopWindowXamlSourceNativeVtbl,
    query_interface : Proc(IDesktopWindowXamlSourceNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDesktopWindowXamlSourceNative*, UInt32),
    release : Proc(IDesktopWindowXamlSourceNative*, UInt32),
    attach_to_window : Proc(IDesktopWindowXamlSourceNative*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_WindowHandle : Proc(IDesktopWindowXamlSourceNative*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDesktopWindowXamlSourceNative, lpVtbl : IDesktopWindowXamlSourceNativeVtbl* do
    GUID = LibC::GUID.new(0x3cbcf1bf_u32, 0x2f76_u16, 0x4e9c_u16, StaticArray[0x96_u8, 0xab_u8, 0xe8_u8, 0x4b_u8, 0x37_u8, 0x97_u8, 0x25_u8, 0x54_u8])
    def query_interface(this : IDesktopWindowXamlSourceNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDesktopWindowXamlSourceNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDesktopWindowXamlSourceNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def attach_to_window(this : IDesktopWindowXamlSourceNative*, parentWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_to_window.call(this, parentWnd)
    end
    def get_WindowHandle(this : IDesktopWindowXamlSourceNative*, hWnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowHandle.call(this, hWnd)
    end

  end

  @[Extern]
  record IDesktopWindowXamlSourceNative2Vtbl,
    query_interface : Proc(IDesktopWindowXamlSourceNative2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDesktopWindowXamlSourceNative2*, UInt32),
    release : Proc(IDesktopWindowXamlSourceNative2*, UInt32),
    attach_to_window : Proc(IDesktopWindowXamlSourceNative2*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_WindowHandle : Proc(IDesktopWindowXamlSourceNative2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    pre_translate_message : Proc(IDesktopWindowXamlSourceNative2*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDesktopWindowXamlSourceNative2, lpVtbl : IDesktopWindowXamlSourceNative2Vtbl* do
    GUID = LibC::GUID.new(0xe3dcd8c7_u32, 0x3057_u16, 0x4692_u16, StaticArray[0x99_u8, 0xc3_u8, 0x7b_u8, 0x77_u8, 0x20_u8, 0xaf_u8, 0xda_u8, 0x31_u8])
    def query_interface(this : IDesktopWindowXamlSourceNative2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDesktopWindowXamlSourceNative2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDesktopWindowXamlSourceNative2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def attach_to_window(this : IDesktopWindowXamlSourceNative2*, parentWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_to_window.call(this, parentWnd)
    end
    def get_WindowHandle(this : IDesktopWindowXamlSourceNative2*, hWnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowHandle.call(this, hWnd)
    end
    def pre_translate_message(this : IDesktopWindowXamlSourceNative2*, message : Win32cr::UI::WindowsAndMessaging::MSG*, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_translate_message.call(this, message, result)
    end

  end

  @[Extern]
  record IReferenceTrackerTargetVtbl,
    query_interface : Proc(IReferenceTrackerTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceTrackerTarget*, UInt32),
    release : Proc(IReferenceTrackerTarget*, UInt32),
    add_ref_from_reference_tracker : Proc(IReferenceTrackerTarget*, UInt32),
    release_from_reference_tracker : Proc(IReferenceTrackerTarget*, UInt32),
    peg : Proc(IReferenceTrackerTarget*, Win32cr::Foundation::HRESULT),
    unpeg : Proc(IReferenceTrackerTarget*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IReferenceTrackerTarget, lpVtbl : IReferenceTrackerTargetVtbl* do
    GUID = LibC::GUID.new(0x64bd43f8_u32, 0xbfee_u16, 0x4ec4_u16, StaticArray[0xb7_u8, 0xeb_u8, 0x29_u8, 0x35_u8, 0x15_u8, 0x8d_u8, 0xae_u8, 0x21_u8])
    def query_interface(this : IReferenceTrackerTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceTrackerTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceTrackerTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_ref_from_reference_tracker(this : IReferenceTrackerTarget*) : UInt32
      @lpVtbl.try &.value.add_ref_from_reference_tracker.call(this)
    end
    def release_from_reference_tracker(this : IReferenceTrackerTarget*) : UInt32
      @lpVtbl.try &.value.release_from_reference_tracker.call(this)
    end
    def peg(this : IReferenceTrackerTarget*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peg.call(this)
    end
    def unpeg(this : IReferenceTrackerTarget*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unpeg.call(this)
    end

  end

  @[Extern]
  record IReferenceTrackerVtbl,
    query_interface : Proc(IReferenceTracker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceTracker*, UInt32),
    release : Proc(IReferenceTracker*, UInt32),
    connect_from_tracker_source : Proc(IReferenceTracker*, Win32cr::Foundation::HRESULT),
    disconnect_from_tracker_source : Proc(IReferenceTracker*, Win32cr::Foundation::HRESULT),
    find_tracker_targets : Proc(IReferenceTracker*, Void*, Win32cr::Foundation::HRESULT),
    get_reference_tracker_manager : Proc(IReferenceTracker*, Void**, Win32cr::Foundation::HRESULT),
    add_ref_from_tracker_source : Proc(IReferenceTracker*, Win32cr::Foundation::HRESULT),
    release_from_tracker_source : Proc(IReferenceTracker*, Win32cr::Foundation::HRESULT),
    peg_from_tracker_source : Proc(IReferenceTracker*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IReferenceTracker, lpVtbl : IReferenceTrackerVtbl* do
    GUID = LibC::GUID.new(0x11d3b13a_u32, 0x180e_u16, 0x4789_u16, StaticArray[0xa8_u8, 0xbe_u8, 0x77_u8, 0x12_u8, 0x88_u8, 0x28_u8, 0x93_u8, 0xe6_u8])
    def query_interface(this : IReferenceTracker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceTracker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceTracker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect_from_tracker_source(this : IReferenceTracker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_from_tracker_source.call(this)
    end
    def disconnect_from_tracker_source(this : IReferenceTracker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_from_tracker_source.call(this)
    end
    def find_tracker_targets(this : IReferenceTracker*, callback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_tracker_targets.call(this, callback)
    end
    def get_reference_tracker_manager(this : IReferenceTracker*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reference_tracker_manager.call(this, value)
    end
    def add_ref_from_tracker_source(this : IReferenceTracker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_ref_from_tracker_source.call(this)
    end
    def release_from_tracker_source(this : IReferenceTracker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_from_tracker_source.call(this)
    end
    def peg_from_tracker_source(this : IReferenceTracker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peg_from_tracker_source.call(this)
    end

  end

  @[Extern]
  record IReferenceTrackerManagerVtbl,
    query_interface : Proc(IReferenceTrackerManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceTrackerManager*, UInt32),
    release : Proc(IReferenceTrackerManager*, UInt32),
    reference_tracking_started : Proc(IReferenceTrackerManager*, Win32cr::Foundation::HRESULT),
    find_tracker_targets_completed : Proc(IReferenceTrackerManager*, UInt8, Win32cr::Foundation::HRESULT),
    reference_tracking_completed : Proc(IReferenceTrackerManager*, Win32cr::Foundation::HRESULT),
    set_reference_tracker_host : Proc(IReferenceTrackerManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IReferenceTrackerManager, lpVtbl : IReferenceTrackerManagerVtbl* do
    GUID = LibC::GUID.new(0x3cf184b4_u32, 0x7ccb_u16, 0x4dda_u16, StaticArray[0x84_u8, 0x55_u8, 0x7e_u8, 0x6c_u8, 0xe9_u8, 0x9a_u8, 0x32_u8, 0x98_u8])
    def query_interface(this : IReferenceTrackerManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceTrackerManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceTrackerManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reference_tracking_started(this : IReferenceTrackerManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reference_tracking_started.call(this)
    end
    def find_tracker_targets_completed(this : IReferenceTrackerManager*, findFailed : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_tracker_targets_completed.call(this, findFailed)
    end
    def reference_tracking_completed(this : IReferenceTrackerManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reference_tracking_completed.call(this)
    end
    def set_reference_tracker_host(this : IReferenceTrackerManager*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_reference_tracker_host.call(this, value)
    end

  end

  @[Extern]
  record IFindReferenceTargetsCallbackVtbl,
    query_interface : Proc(IFindReferenceTargetsCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFindReferenceTargetsCallback*, UInt32),
    release : Proc(IFindReferenceTargetsCallback*, UInt32),
    found_tracker_target : Proc(IFindReferenceTargetsCallback*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFindReferenceTargetsCallback, lpVtbl : IFindReferenceTargetsCallbackVtbl* do
    GUID = LibC::GUID.new(0x4b3486c_u32, 0x4687_u16, 0x4229_u16, StaticArray[0x8d_u8, 0x14_u8, 0x50_u8, 0x5a_u8, 0xb5_u8, 0x84_u8, 0xdd_u8, 0x88_u8])
    def query_interface(this : IFindReferenceTargetsCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFindReferenceTargetsCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFindReferenceTargetsCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def found_tracker_target(this : IFindReferenceTargetsCallback*, target : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.found_tracker_target.call(this, target)
    end

  end

  @[Extern]
  record IReferenceTrackerHostVtbl,
    query_interface : Proc(IReferenceTrackerHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceTrackerHost*, UInt32),
    release : Proc(IReferenceTrackerHost*, UInt32),
    disconnect_unused_reference_sources : Proc(IReferenceTrackerHost*, Win32cr::System::WinRT::Xaml::XAML_REFERENCETRACKER_DISCONNECT, Win32cr::Foundation::HRESULT),
    release_disconnected_reference_sources : Proc(IReferenceTrackerHost*, Win32cr::Foundation::HRESULT),
    notify_end_of_reference_tracking_on_thread : Proc(IReferenceTrackerHost*, Win32cr::Foundation::HRESULT),
    get_tracker_target : Proc(IReferenceTrackerHost*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_memory_pressure : Proc(IReferenceTrackerHost*, UInt64, Win32cr::Foundation::HRESULT),
    remove_memory_pressure : Proc(IReferenceTrackerHost*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IReferenceTrackerHost, lpVtbl : IReferenceTrackerHostVtbl* do
    GUID = LibC::GUID.new(0x29a71c6a_u32, 0x3c42_u16, 0x4416_u16, StaticArray[0xa3_u8, 0x9d_u8, 0xe2_u8, 0x82_u8, 0x5a_u8, 0x7_u8, 0xa7_u8, 0x73_u8])
    def query_interface(this : IReferenceTrackerHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceTrackerHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceTrackerHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def disconnect_unused_reference_sources(this : IReferenceTrackerHost*, options : Win32cr::System::WinRT::Xaml::XAML_REFERENCETRACKER_DISCONNECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_unused_reference_sources.call(this, options)
    end
    def release_disconnected_reference_sources(this : IReferenceTrackerHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_disconnected_reference_sources.call(this)
    end
    def notify_end_of_reference_tracking_on_thread(this : IReferenceTrackerHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_end_of_reference_tracking_on_thread.call(this)
    end
    def get_tracker_target(this : IReferenceTrackerHost*, unknown : Void*, newReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tracker_target.call(this, unknown, newReference)
    end
    def add_memory_pressure(this : IReferenceTrackerHost*, bytesAllocated : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_memory_pressure.call(this, bytesAllocated)
    end
    def remove_memory_pressure(this : IReferenceTrackerHost*, bytesAllocated : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_memory_pressure.call(this, bytesAllocated)
    end

  end

  @[Extern]
  record IReferenceTrackerExtensionVtbl,
    query_interface : Proc(IReferenceTrackerExtension*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceTrackerExtension*, UInt32),
    release : Proc(IReferenceTrackerExtension*, UInt32)


  @[Extern]
  record IReferenceTrackerExtension, lpVtbl : IReferenceTrackerExtensionVtbl* do
    GUID = LibC::GUID.new(0x4e897caa_u32, 0x59d5_u16, 0x4613_u16, StaticArray[0x8f_u8, 0x8c_u8, 0xf7_u8, 0xeb_u8, 0xd1_u8, 0xf3_u8, 0x99_u8, 0xb0_u8])
    def query_interface(this : IReferenceTrackerExtension*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceTrackerExtension*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceTrackerExtension*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record ITrackerOwnerVtbl,
    query_interface : Proc(ITrackerOwner*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITrackerOwner*, UInt32),
    release : Proc(ITrackerOwner*, UInt32),
    create_tracker_handle : Proc(ITrackerOwner*, Win32cr::System::WinRT::Xaml::TrackerHandle__**, Win32cr::Foundation::HRESULT),
    delete_tracker_handle : Proc(ITrackerOwner*, Win32cr::System::WinRT::Xaml::TrackerHandle__*, Win32cr::Foundation::HRESULT),
    set_tracker_value : Proc(ITrackerOwner*, Win32cr::System::WinRT::Xaml::TrackerHandle__*, Void*, Win32cr::Foundation::HRESULT),
    try_get_safe_tracker_value : Proc(ITrackerOwner*, Win32cr::System::WinRT::Xaml::TrackerHandle__*, Void**, UInt8)


  @[Extern]
  record ITrackerOwner, lpVtbl : ITrackerOwnerVtbl* do
    GUID = LibC::GUID.new(0xeb24c20b_u32, 0x9816_u16, 0x4ac7_u16, StaticArray[0x8c_u8, 0xff_u8, 0x36_u8, 0xf6_u8, 0x7a_u8, 0x11_u8, 0x8f_u8, 0x4e_u8])
    def query_interface(this : ITrackerOwner*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITrackerOwner*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITrackerOwner*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_tracker_handle(this : ITrackerOwner*, returnValue : Win32cr::System::WinRT::Xaml::TrackerHandle__**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_tracker_handle.call(this, returnValue)
    end
    def delete_tracker_handle(this : ITrackerOwner*, handle : Win32cr::System::WinRT::Xaml::TrackerHandle__*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_tracker_handle.call(this, handle)
    end
    def set_tracker_value(this : ITrackerOwner*, handle : Win32cr::System::WinRT::Xaml::TrackerHandle__*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tracker_value.call(this, handle, value)
    end
    def try_get_safe_tracker_value(this : ITrackerOwner*, handle : Win32cr::System::WinRT::Xaml::TrackerHandle__*, returnValue : Void**) : UInt8
      @lpVtbl.try &.value.try_get_safe_tracker_value.call(this, handle, returnValue)
    end

  end

end