require "../../system/com.cr"
require "../../foundation.cr"

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
  InkDesktopHost = LibC::GUID.new(0x62584a6_u32, 0xf830_u16, 0x4bdc_u16, StaticArray[0xa4_u8, 0xd2_u8, 0xa_u8, 0x10_u8, 0xab_u8, 0x6_u8, 0x2b_u8, 0x1d_u8])
  InkD2DRenderer = LibC::GUID.new(0x4044e60c_u32, 0x7b01_u16, 0x4671_u16, StaticArray[0xa9_u8, 0x7c_u8, 0x4_u8, 0xe0_u8, 0x21_u8, 0xa_u8, 0x7_u8, 0xa5_u8])


  enum INK_HIGH_CONTRAST_ADJUSTMENT : Int32
    USE_SYSTEM_COLORS_WHEN_NECESSARY = 0
    USE_SYSTEM_COLORS = 1
    USE_ORIGINAL_COLORS = 2
  end


  struct IInkCommitRequestHandlerVTbl
    query_interface : Proc(IInkCommitRequestHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCommitRequestHandler*, UInt32)
    release : Proc(IInkCommitRequestHandler*, UInt32)
    on_commit_requested : Proc(IInkCommitRequestHandler*, HRESULT)
  end

  struct IInkCommitRequestHandler
    lpVtbl : IInkCommitRequestHandlerVTbl*
  end

  struct IInkPresenterDesktopVTbl
    query_interface : Proc(IInkPresenterDesktop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkPresenterDesktop*, UInt32)
    release : Proc(IInkPresenterDesktop*, UInt32)
    set_root_visual : Proc(IInkPresenterDesktop*, IUnknown, IUnknown, HRESULT)
    set_commit_request_handler : Proc(IInkPresenterDesktop*, IInkCommitRequestHandler, HRESULT)
    get_size : Proc(IInkPresenterDesktop*, Float32*, Float32*, HRESULT)
    set_size : Proc(IInkPresenterDesktop*, Float32, Float32, HRESULT)
    on_high_contrast_changed : Proc(IInkPresenterDesktop*, HRESULT)
  end

  struct IInkPresenterDesktop
    lpVtbl : IInkPresenterDesktopVTbl*
  end

  struct IInkHostWorkItemVTbl
    query_interface : Proc(IInkHostWorkItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkHostWorkItem*, UInt32)
    release : Proc(IInkHostWorkItem*, UInt32)
    invoke : Proc(IInkHostWorkItem*, HRESULT)
  end

  struct IInkHostWorkItem
    lpVtbl : IInkHostWorkItemVTbl*
  end

  struct IInkDesktopHostVTbl
    query_interface : Proc(IInkDesktopHost*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkDesktopHost*, UInt32)
    release : Proc(IInkDesktopHost*, UInt32)
    queue_work_item : Proc(IInkDesktopHost*, IInkHostWorkItem, HRESULT)
    create_ink_presenter : Proc(IInkDesktopHost*, Guid*, Void**, HRESULT)
    create_and_initialize_ink_presenter : Proc(IInkDesktopHost*, IUnknown, Float32, Float32, Guid*, Void**, HRESULT)
  end

  struct IInkDesktopHost
    lpVtbl : IInkDesktopHostVTbl*
  end

  struct IInkD2DRendererVTbl
    query_interface : Proc(IInkD2DRenderer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkD2DRenderer*, UInt32)
    release : Proc(IInkD2DRenderer*, UInt32)
    draw : Proc(IInkD2DRenderer*, IUnknown, IUnknown, LibC::BOOL, HRESULT)
  end

  struct IInkD2DRenderer
    lpVtbl : IInkD2DRendererVTbl*
  end

  struct IInkD2DRenderer2VTbl
    query_interface : Proc(IInkD2DRenderer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkD2DRenderer2*, UInt32)
    release : Proc(IInkD2DRenderer2*, UInt32)
    draw : Proc(IInkD2DRenderer2*, IUnknown, IUnknown, INK_HIGH_CONTRAST_ADJUSTMENT, HRESULT)
  end

  struct IInkD2DRenderer2
    lpVtbl : IInkD2DRenderer2VTbl*
  end

end
