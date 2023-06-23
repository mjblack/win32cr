require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  CLSID_InkDesktopHost = LibC::GUID.new(0x62584a6_u32, 0xf830_u16, 0x4bdc_u16, StaticArray[0xa4_u8, 0xd2_u8, 0xa_u8, 0x10_u8, 0xab_u8, 0x6_u8, 0x2b_u8, 0x1d_u8])
  CLSID_InkD2DRenderer = LibC::GUID.new(0x4044e60c_u32, 0x7b01_u16, 0x4671_u16, StaticArray[0xa9_u8, 0x7c_u8, 0x4_u8, 0xe0_u8, 0x21_u8, 0xa_u8, 0x7_u8, 0xa5_u8])


  enum INK_HIGH_CONTRAST_ADJUSTMENT : Int32
    USE_SYSTEM_COLORS_WHEN_NECESSARY = 0
    USE_SYSTEM_COLORS = 1
    USE_ORIGINAL_COLORS = 2
  end


  struct IInkCommitRequestHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_commit_requested : UInt64
  end

  IInkCommitRequestHandler_GUID = "fabea3fc-b108-45b6-a9fc-8d08fa9f85cf"
  IID_IInkCommitRequestHandler = LibC::GUID.new(0xfabea3fc_u32, 0xb108_u16, 0x45b6_u16, StaticArray[0xa9_u8, 0xfc_u8, 0x8d_u8, 0x8_u8, 0xfa_u8, 0x9f_u8, 0x85_u8, 0xcf_u8])
  struct IInkCommitRequestHandler
    lpVtbl : IInkCommitRequestHandlerVTbl*
  end

  struct IInkPresenterDesktopVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_root_visual : UInt64
    set_commit_request_handler : UInt64
    get_size : UInt64
    set_size : UInt64
    on_high_contrast_changed : UInt64
  end

  IInkPresenterDesktop_GUID = "73f3c0d9-2e8b-48f3-895e-20cbd27b723b"
  IID_IInkPresenterDesktop = LibC::GUID.new(0x73f3c0d9_u32, 0x2e8b_u16, 0x48f3_u16, StaticArray[0x89_u8, 0x5e_u8, 0x20_u8, 0xcb_u8, 0xd2_u8, 0x7b_u8, 0x72_u8, 0x3b_u8])
  struct IInkPresenterDesktop
    lpVtbl : IInkPresenterDesktopVTbl*
  end

  struct IInkHostWorkItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IInkHostWorkItem_GUID = "ccda0a9a-1b78-4632-bb96-97800662e26c"
  IID_IInkHostWorkItem = LibC::GUID.new(0xccda0a9a_u32, 0x1b78_u16, 0x4632_u16, StaticArray[0xbb_u8, 0x96_u8, 0x97_u8, 0x80_u8, 0x6_u8, 0x62_u8, 0xe2_u8, 0x6c_u8])
  struct IInkHostWorkItem
    lpVtbl : IInkHostWorkItemVTbl*
  end

  struct IInkDesktopHostVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    queue_work_item : UInt64
    create_ink_presenter : UInt64
    create_and_initialize_ink_presenter : UInt64
  end

  IInkDesktopHost_GUID = "4ce7d875-a981-4140-a1ff-ad93258e8d59"
  IID_IInkDesktopHost = LibC::GUID.new(0x4ce7d875_u32, 0xa981_u16, 0x4140_u16, StaticArray[0xa1_u8, 0xff_u8, 0xad_u8, 0x93_u8, 0x25_u8, 0x8e_u8, 0x8d_u8, 0x59_u8])
  struct IInkDesktopHost
    lpVtbl : IInkDesktopHostVTbl*
  end

  struct IInkD2DRendererVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    draw : UInt64
  end

  IInkD2DRenderer_GUID = "407fb1de-f85a-4150-97cf-b7fb274fb4f8"
  IID_IInkD2DRenderer = LibC::GUID.new(0x407fb1de_u32, 0xf85a_u16, 0x4150_u16, StaticArray[0x97_u8, 0xcf_u8, 0xb7_u8, 0xfb_u8, 0x27_u8, 0x4f_u8, 0xb4_u8, 0xf8_u8])
  struct IInkD2DRenderer
    lpVtbl : IInkD2DRendererVTbl*
  end

  struct IInkD2DRenderer2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    draw : UInt64
  end

  IInkD2DRenderer2_GUID = "0a95dcd9-4578-4b71-b20b-bf664d4bfeee"
  IID_IInkD2DRenderer2 = LibC::GUID.new(0xa95dcd9_u32, 0x4578_u16, 0x4b71_u16, StaticArray[0xb2_u8, 0xb_u8, 0xbf_u8, 0x66_u8, 0x4d_u8, 0x4b_u8, 0xfe_u8, 0xee_u8])
  struct IInkD2DRenderer2
    lpVtbl : IInkD2DRenderer2VTbl*
  end

end
struct LibWin32::IInkCommitRequestHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_commit_requested : HRESULT
    @lpVtbl.value.on_commit_requested.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IInkPresenterDesktop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_root_visual(rootvisual : IUnknown, device : IUnknown) : HRESULT
    @lpVtbl.value.set_root_visual.unsafe_as(Proc(IUnknown, IUnknown, HRESULT)).call(rootvisual, device)
  end
  def set_commit_request_handler(handler : IInkCommitRequestHandler) : HRESULT
    @lpVtbl.value.set_commit_request_handler.unsafe_as(Proc(IInkCommitRequestHandler, HRESULT)).call(handler)
  end
  def get_size(width : Float32*, height : Float32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Float32*, Float32*, HRESULT)).call(width, height)
  end
  def set_size(width : Float32, height : Float32) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(Float32, Float32, HRESULT)).call(width, height)
  end
  def on_high_contrast_changed : HRESULT
    @lpVtbl.value.on_high_contrast_changed.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IInkHostWorkItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IInkDesktopHost
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def queue_work_item(workitem : IInkHostWorkItem) : HRESULT
    @lpVtbl.value.queue_work_item.unsafe_as(Proc(IInkHostWorkItem, HRESULT)).call(workitem)
  end
  def create_ink_presenter(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_ink_presenter.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def create_and_initialize_ink_presenter(rootvisual : IUnknown, width : Float32, height : Float32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_and_initialize_ink_presenter.unsafe_as(Proc(IUnknown, Float32, Float32, Guid*, Void**, HRESULT)).call(rootvisual, width, height, riid, ppv)
  end
end
struct LibWin32::IInkD2DRenderer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def draw(pd2d1devicecontext : IUnknown, pinkstrokeiterable : IUnknown, fhighcontrast : LibC::BOOL) : HRESULT
    @lpVtbl.value.draw.unsafe_as(Proc(IUnknown, IUnknown, LibC::BOOL, HRESULT)).call(pd2d1devicecontext, pinkstrokeiterable, fhighcontrast)
  end
end
struct LibWin32::IInkD2DRenderer2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def draw(pd2d1devicecontext : IUnknown, pinkstrokeiterable : IUnknown, highcontrastadjustment : INK_HIGH_CONTRAST_ADJUSTMENT) : HRESULT
    @lpVtbl.value.draw.unsafe_as(Proc(IUnknown, IUnknown, INK_HIGH_CONTRAST_ADJUSTMENT, HRESULT)).call(pd2d1devicecontext, pinkstrokeiterable, highcontrastadjustment)
  end
end
