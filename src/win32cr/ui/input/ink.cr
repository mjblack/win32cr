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
  CLSID_InkDesktopHost = LibC::GUID.new(0x62584a6_u32, 0xf830_u16, 0x4bdc_u16, StaticArray[0xa4_u8, 0xd2_u8, 0xa_u8, 0x10_u8, 0xab_u8, 0x6_u8, 0x2b_u8, 0x1d_u8])
  CLSID_InkD2DRenderer = LibC::GUID.new(0x4044e60c_u32, 0x7b01_u16, 0x4671_u16, StaticArray[0xa9_u8, 0x7c_u8, 0x4_u8, 0xe0_u8, 0x21_u8, 0xa_u8, 0x7_u8, 0xa5_u8])


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

  IInkCommitRequestHandler_GUID = "fabea3fc-b108-45b6-a9fc-8d08fa9f85cf"
  IID_IInkCommitRequestHandler = LibC::GUID.new(0xfabea3fc_u32, 0xb108_u16, 0x45b6_u16, StaticArray[0xa9_u8, 0xfc_u8, 0x8d_u8, 0x8_u8, 0xfa_u8, 0x9f_u8, 0x85_u8, 0xcf_u8])
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

  IInkPresenterDesktop_GUID = "73f3c0d9-2e8b-48f3-895e-20cbd27b723b"
  IID_IInkPresenterDesktop = LibC::GUID.new(0x73f3c0d9_u32, 0x2e8b_u16, 0x48f3_u16, StaticArray[0x89_u8, 0x5e_u8, 0x20_u8, 0xcb_u8, 0xd2_u8, 0x7b_u8, 0x72_u8, 0x3b_u8])
  struct IInkPresenterDesktop
    lpVtbl : IInkPresenterDesktopVTbl*
  end

  struct IInkHostWorkItemVTbl
    query_interface : Proc(IInkHostWorkItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkHostWorkItem*, UInt32)
    release : Proc(IInkHostWorkItem*, UInt32)
    invoke : Proc(IInkHostWorkItem*, HRESULT)
  end

  IInkHostWorkItem_GUID = "ccda0a9a-1b78-4632-bb96-97800662e26c"
  IID_IInkHostWorkItem = LibC::GUID.new(0xccda0a9a_u32, 0x1b78_u16, 0x4632_u16, StaticArray[0xbb_u8, 0x96_u8, 0x97_u8, 0x80_u8, 0x6_u8, 0x62_u8, 0xe2_u8, 0x6c_u8])
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

  IInkDesktopHost_GUID = "4ce7d875-a981-4140-a1ff-ad93258e8d59"
  IID_IInkDesktopHost = LibC::GUID.new(0x4ce7d875_u32, 0xa981_u16, 0x4140_u16, StaticArray[0xa1_u8, 0xff_u8, 0xad_u8, 0x93_u8, 0x25_u8, 0x8e_u8, 0x8d_u8, 0x59_u8])
  struct IInkDesktopHost
    lpVtbl : IInkDesktopHostVTbl*
  end

  struct IInkD2DRendererVTbl
    query_interface : Proc(IInkD2DRenderer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkD2DRenderer*, UInt32)
    release : Proc(IInkD2DRenderer*, UInt32)
    draw : Proc(IInkD2DRenderer*, IUnknown, IUnknown, LibC::BOOL, HRESULT)
  end

  IInkD2DRenderer_GUID = "407fb1de-f85a-4150-97cf-b7fb274fb4f8"
  IID_IInkD2DRenderer = LibC::GUID.new(0x407fb1de_u32, 0xf85a_u16, 0x4150_u16, StaticArray[0x97_u8, 0xcf_u8, 0xb7_u8, 0xfb_u8, 0x27_u8, 0x4f_u8, 0xb4_u8, 0xf8_u8])
  struct IInkD2DRenderer
    lpVtbl : IInkD2DRendererVTbl*
  end

  struct IInkD2DRenderer2VTbl
    query_interface : Proc(IInkD2DRenderer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkD2DRenderer2*, UInt32)
    release : Proc(IInkD2DRenderer2*, UInt32)
    draw : Proc(IInkD2DRenderer2*, IUnknown, IUnknown, INK_HIGH_CONTRAST_ADJUSTMENT, HRESULT)
  end

  IInkD2DRenderer2_GUID = "0a95dcd9-4578-4b71-b20b-bf664d4bfeee"
  IID_IInkD2DRenderer2 = LibC::GUID.new(0xa95dcd9_u32, 0x4578_u16, 0x4b71_u16, StaticArray[0xb2_u8, 0xb_u8, 0xbf_u8, 0x66_u8, 0x4d_u8, 0x4b_u8, 0xfe_u8, 0xee_u8])
  struct IInkD2DRenderer2
    lpVtbl : IInkD2DRenderer2VTbl*
  end

end
