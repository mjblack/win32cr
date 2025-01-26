require "./../../system/com.cr"
require "./../../foundation.cr"

module Win32cr::UI::Input::Ink

  CLSID_InkDesktopHost = LibC::GUID.new(0x62584a6_u32, 0xf830_u16, 0x4bdc_u16, StaticArray[0xa4_u8, 0xd2_u8, 0xa_u8, 0x10_u8, 0xab_u8, 0x6_u8, 0x2b_u8, 0x1d_u8])

  CLSID_InkD2DRenderer = LibC::GUID.new(0x4044e60c_u32, 0x7b01_u16, 0x4671_u16, StaticArray[0xa9_u8, 0x7c_u8, 0x4_u8, 0xe0_u8, 0x21_u8, 0xa_u8, 0x7_u8, 0xa5_u8])

  enum INK_HIGH_CONTRAST_ADJUSTMENT
    USE_SYSTEM_COLORS_WHEN_NECESSARY = 0_i32
    USE_SYSTEM_COLORS = 1_i32
    USE_ORIGINAL_COLORS = 2_i32
  end

  @[Extern]
  record IInkCommitRequestHandlerVtbl,
    query_interface : Proc(IInkCommitRequestHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCommitRequestHandler*, UInt32),
    release : Proc(IInkCommitRequestHandler*, UInt32),
    on_commit_requested : Proc(IInkCommitRequestHandler*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInkCommitRequestHandler, lpVtbl : IInkCommitRequestHandlerVtbl* do
    GUID = LibC::GUID.new(0xfabea3fc_u32, 0xb108_u16, 0x45b6_u16, StaticArray[0xa9_u8, 0xfc_u8, 0x8d_u8, 0x8_u8, 0xfa_u8, 0x9f_u8, 0x85_u8, 0xcf_u8])
    def query_interface(this : IInkCommitRequestHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCommitRequestHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCommitRequestHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_commit_requested(this : IInkCommitRequestHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_commit_requested.call(this)
    end

  end

  @[Extern]
  record IInkPresenterDesktopVtbl,
    query_interface : Proc(IInkPresenterDesktop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkPresenterDesktop*, UInt32),
    release : Proc(IInkPresenterDesktop*, UInt32),
    set_root_visual : Proc(IInkPresenterDesktop*, Void*, Void*, Win32cr::Foundation::HRESULT),
    set_commit_request_handler : Proc(IInkPresenterDesktop*, Void*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IInkPresenterDesktop*, Float32*, Float32*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IInkPresenterDesktop*, Float32, Float32, Win32cr::Foundation::HRESULT),
    on_high_contrast_changed : Proc(IInkPresenterDesktop*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInkPresenterDesktop, lpVtbl : IInkPresenterDesktopVtbl* do
    GUID = LibC::GUID.new(0x73f3c0d9_u32, 0x2e8b_u16, 0x48f3_u16, StaticArray[0x89_u8, 0x5e_u8, 0x20_u8, 0xcb_u8, 0xd2_u8, 0x7b_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : IInkPresenterDesktop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkPresenterDesktop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkPresenterDesktop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_root_visual(this : IInkPresenterDesktop*, rootVisual : Void*, device : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_root_visual.call(this, rootVisual, device)
    end
    def set_commit_request_handler(this : IInkPresenterDesktop*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_commit_request_handler.call(this, handler)
    end
    def get_size(this : IInkPresenterDesktop*, width : Float32*, height : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, width, height)
    end
    def set_size(this : IInkPresenterDesktop*, width : Float32, height : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, width, height)
    end
    def on_high_contrast_changed(this : IInkPresenterDesktop*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_high_contrast_changed.call(this)
    end

  end

  @[Extern]
  record IInkHostWorkItemVtbl,
    query_interface : Proc(IInkHostWorkItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkHostWorkItem*, UInt32),
    release : Proc(IInkHostWorkItem*, UInt32),
    invoke : Proc(IInkHostWorkItem*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInkHostWorkItem, lpVtbl : IInkHostWorkItemVtbl* do
    GUID = LibC::GUID.new(0xccda0a9a_u32, 0x1b78_u16, 0x4632_u16, StaticArray[0xbb_u8, 0x96_u8, 0x97_u8, 0x80_u8, 0x6_u8, 0x62_u8, 0xe2_u8, 0x6c_u8])
    def query_interface(this : IInkHostWorkItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkHostWorkItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkHostWorkItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IInkHostWorkItem*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this)
    end

  end

  @[Extern]
  record IInkDesktopHostVtbl,
    query_interface : Proc(IInkDesktopHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkDesktopHost*, UInt32),
    release : Proc(IInkDesktopHost*, UInt32),
    queue_work_item : Proc(IInkDesktopHost*, Void*, Win32cr::Foundation::HRESULT),
    create_ink_presenter : Proc(IInkDesktopHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_and_initialize_ink_presenter : Proc(IInkDesktopHost*, Void*, Float32, Float32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInkDesktopHost, lpVtbl : IInkDesktopHostVtbl* do
    GUID = LibC::GUID.new(0x4ce7d875_u32, 0xa981_u16, 0x4140_u16, StaticArray[0xa1_u8, 0xff_u8, 0xad_u8, 0x93_u8, 0x25_u8, 0x8e_u8, 0x8d_u8, 0x59_u8])
    def query_interface(this : IInkDesktopHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkDesktopHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkDesktopHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def queue_work_item(this : IInkDesktopHost*, workItem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.queue_work_item.call(this, workItem)
    end
    def create_ink_presenter(this : IInkDesktopHost*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_ink_presenter.call(this, riid, ppv)
    end
    def create_and_initialize_ink_presenter(this : IInkDesktopHost*, rootVisual : Void*, width : Float32, height : Float32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_initialize_ink_presenter.call(this, rootVisual, width, height, riid, ppv)
    end

  end

  @[Extern]
  record IInkD2DRendererVtbl,
    query_interface : Proc(IInkD2DRenderer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkD2DRenderer*, UInt32),
    release : Proc(IInkD2DRenderer*, UInt32),
    draw : Proc(IInkD2DRenderer*, Void*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInkD2DRenderer, lpVtbl : IInkD2DRendererVtbl* do
    GUID = LibC::GUID.new(0x407fb1de_u32, 0xf85a_u16, 0x4150_u16, StaticArray[0x97_u8, 0xcf_u8, 0xb7_u8, 0xfb_u8, 0x27_u8, 0x4f_u8, 0xb4_u8, 0xf8_u8])
    def query_interface(this : IInkD2DRenderer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkD2DRenderer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkD2DRenderer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def draw(this : IInkD2DRenderer*, pD2D1DeviceContext : Void*, pInkStrokeIterable : Void*, fHighContrast : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw.call(this, pD2D1DeviceContext, pInkStrokeIterable, fHighContrast)
    end

  end

  @[Extern]
  record IInkD2DRenderer2Vtbl,
    query_interface : Proc(IInkD2DRenderer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkD2DRenderer2*, UInt32),
    release : Proc(IInkD2DRenderer2*, UInt32),
    draw : Proc(IInkD2DRenderer2*, Void*, Void*, Win32cr::UI::Input::Ink::INK_HIGH_CONTRAST_ADJUSTMENT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInkD2DRenderer2, lpVtbl : IInkD2DRenderer2Vtbl* do
    GUID = LibC::GUID.new(0xa95dcd9_u32, 0x4578_u16, 0x4b71_u16, StaticArray[0xb2_u8, 0xb_u8, 0xbf_u8, 0x66_u8, 0x4d_u8, 0x4b_u8, 0xfe_u8, 0xee_u8])
    def query_interface(this : IInkD2DRenderer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkD2DRenderer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkD2DRenderer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def draw(this : IInkD2DRenderer2*, pD2D1DeviceContext : Void*, pInkStrokeIterable : Void*, highContrastAdjustment : Win32cr::UI::Input::Ink::INK_HIGH_CONTRAST_ADJUSTMENT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw.call(this, pD2D1DeviceContext, pInkStrokeIterable, highContrastAdjustment)
    end

  end

end