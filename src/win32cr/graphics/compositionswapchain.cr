require "../system/com.cr"
require "../foundation.cr"
require "../graphics/dxgi/common.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dcomp.dll")]
{% else %}
@[Link("dcomp")]
{% end %}
lib LibWin32

  enum PresentStatisticsKind : Int32
    PresentStatisticsKind_PresentStatus = 1
    PresentStatisticsKind_CompositionFrame = 2
    PresentStatisticsKind_IndependentFlipFrame = 3
  end

  enum PresentStatus : Int32
    PresentStatus_Queued = 0
    PresentStatus_Skipped = 1
    PresentStatus_Canceled = 2
  end

  enum CompositionFrameInstanceKind : Int32
    CompositionFrameInstanceKind_ComposedOnScreen = 0
    CompositionFrameInstanceKind_ScanoutOnScreen = 1
    CompositionFrameInstanceKind_ComposedToIntermediate = 2
  end

  struct SystemInterruptTime
    value : UInt64
  end
  struct PresentationTransform
    m11 : Float32
    m12 : Float32
    m21 : Float32
    m22 : Float32
    m31 : Float32
    m32 : Float32
  end
  struct CompositionFrameDisplayInstance
    display_adapter_luid : LUID
    display_vid_pn_source_id : UInt32
    display_unique_id : UInt32
    render_adapter_luid : LUID
    instance_kind : CompositionFrameInstanceKind
    final_transform : PresentationTransform
    required_cross_adapter_copy : UInt8
    color_space : DXGI_COLOR_SPACE_TYPE
  end


  struct IPresentationBufferVTbl
    query_interface : Proc(IPresentationBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentationBuffer*, UInt32)
    release : Proc(IPresentationBuffer*, UInt32)
    get_available_event : Proc(IPresentationBuffer*, LibC::HANDLE*, HRESULT)
    is_available : Proc(IPresentationBuffer*, UInt8*, HRESULT)
  end

  IPresentationBuffer_GUID = "2e217d3a-5abb-4138-9a13-a775593c89ca"
  IID_IPresentationBuffer = LibC::GUID.new(0x2e217d3a_u32, 0x5abb_u16, 0x4138_u16, StaticArray[0x9a_u8, 0x13_u8, 0xa7_u8, 0x75_u8, 0x59_u8, 0x3c_u8, 0x89_u8, 0xca_u8])
  struct IPresentationBuffer
    lpVtbl : IPresentationBufferVTbl*
  end

  struct IPresentationContentVTbl
    query_interface : Proc(IPresentationContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentationContent*, UInt32)
    release : Proc(IPresentationContent*, UInt32)
    set_tag : Proc(IPresentationContent*, LibC::UINT_PTR, Void)
  end

  IPresentationContent_GUID = "5668bb79-3d8e-415c-b215-f38020f2d252"
  IID_IPresentationContent = LibC::GUID.new(0x5668bb79_u32, 0x3d8e_u16, 0x415c_u16, StaticArray[0xb2_u8, 0x15_u8, 0xf3_u8, 0x80_u8, 0x20_u8, 0xf2_u8, 0xd2_u8, 0x52_u8])
  struct IPresentationContent
    lpVtbl : IPresentationContentVTbl*
  end

  struct IPresentationSurfaceVTbl
    query_interface : Proc(IPresentationSurface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentationSurface*, UInt32)
    release : Proc(IPresentationSurface*, UInt32)
    set_tag : Proc(IPresentationSurface*, LibC::UINT_PTR, Void)
    set_buffer : Proc(IPresentationSurface*, IPresentationBuffer, HRESULT)
    set_color_space : Proc(IPresentationSurface*, DXGI_COLOR_SPACE_TYPE, HRESULT)
    set_alpha_mode : Proc(IPresentationSurface*, DXGI_ALPHA_MODE, HRESULT)
    set_source_rect : Proc(IPresentationSurface*, RECT*, HRESULT)
    set_transform : Proc(IPresentationSurface*, PresentationTransform*, HRESULT)
    restrict_to_output : Proc(IPresentationSurface*, IUnknown, HRESULT)
    set_disable_readback : Proc(IPresentationSurface*, UInt8, HRESULT)
    set_letterboxing_margins : Proc(IPresentationSurface*, Float32, Float32, Float32, Float32, HRESULT)
  end

  IPresentationSurface_GUID = "956710fb-ea40-4eba-a3eb-4375a0eb4edc"
  IID_IPresentationSurface = LibC::GUID.new(0x956710fb_u32, 0xea40_u16, 0x4eba_u16, StaticArray[0xa3_u8, 0xeb_u8, 0x43_u8, 0x75_u8, 0xa0_u8, 0xeb_u8, 0x4e_u8, 0xdc_u8])
  struct IPresentationSurface
    lpVtbl : IPresentationSurfaceVTbl*
  end

  struct IPresentStatisticsVTbl
    query_interface : Proc(IPresentStatistics*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentStatistics*, UInt32)
    release : Proc(IPresentStatistics*, UInt32)
    get_present_id : Proc(IPresentStatistics*, UInt64)
    get_kind : Proc(IPresentStatistics*, PresentStatisticsKind)
  end

  IPresentStatistics_GUID = "b44b8bda-7282-495d-9dd7-ceadd8b4bb86"
  IID_IPresentStatistics = LibC::GUID.new(0xb44b8bda_u32, 0x7282_u16, 0x495d_u16, StaticArray[0x9d_u8, 0xd7_u8, 0xce_u8, 0xad_u8, 0xd8_u8, 0xb4_u8, 0xbb_u8, 0x86_u8])
  struct IPresentStatistics
    lpVtbl : IPresentStatisticsVTbl*
  end

  struct IPresentationManagerVTbl
    query_interface : Proc(IPresentationManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentationManager*, UInt32)
    release : Proc(IPresentationManager*, UInt32)
    add_buffer_from_resource : Proc(IPresentationManager*, IUnknown, IPresentationBuffer*, HRESULT)
    create_presentation_surface : Proc(IPresentationManager*, LibC::HANDLE, IPresentationSurface*, HRESULT)
    get_next_present_id : Proc(IPresentationManager*, UInt64)
    set_target_time : Proc(IPresentationManager*, SystemInterruptTime, HRESULT)
    set_preferred_present_duration : Proc(IPresentationManager*, SystemInterruptTime, SystemInterruptTime, HRESULT)
    force_v_sync_interrupt : Proc(IPresentationManager*, UInt8, HRESULT)
    present : Proc(IPresentationManager*, HRESULT)
    get_present_retiring_fence : Proc(IPresentationManager*, Guid*, Void**, HRESULT)
    cancel_presents_from : Proc(IPresentationManager*, UInt64, HRESULT)
    get_lost_event : Proc(IPresentationManager*, LibC::HANDLE*, HRESULT)
    get_present_statistics_available_event : Proc(IPresentationManager*, LibC::HANDLE*, HRESULT)
    enable_present_statistics_kind : Proc(IPresentationManager*, PresentStatisticsKind, UInt8, HRESULT)
    get_next_present_statistics : Proc(IPresentationManager*, IPresentStatistics*, HRESULT)
  end

  IPresentationManager_GUID = "fb562f82-6292-470a-88b1-843661e7f20c"
  IID_IPresentationManager = LibC::GUID.new(0xfb562f82_u32, 0x6292_u16, 0x470a_u16, StaticArray[0x88_u8, 0xb1_u8, 0x84_u8, 0x36_u8, 0x61_u8, 0xe7_u8, 0xf2_u8, 0xc_u8])
  struct IPresentationManager
    lpVtbl : IPresentationManagerVTbl*
  end

  struct IPresentationFactoryVTbl
    query_interface : Proc(IPresentationFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentationFactory*, UInt32)
    release : Proc(IPresentationFactory*, UInt32)
    is_presentation_supported : Proc(IPresentationFactory*, UInt8)
    is_presentation_supported_with_independent_flip : Proc(IPresentationFactory*, UInt8)
    create_presentation_manager : Proc(IPresentationFactory*, IPresentationManager*, HRESULT)
  end

  IPresentationFactory_GUID = "8fb37b58-1d74-4f64-a49c-1f97a80a2ec0"
  IID_IPresentationFactory = LibC::GUID.new(0x8fb37b58_u32, 0x1d74_u16, 0x4f64_u16, StaticArray[0xa4_u8, 0x9c_u8, 0x1f_u8, 0x97_u8, 0xa8_u8, 0xa_u8, 0x2e_u8, 0xc0_u8])
  struct IPresentationFactory
    lpVtbl : IPresentationFactoryVTbl*
  end

  struct IPresentStatusPresentStatisticsVTbl
    query_interface : Proc(IPresentStatusPresentStatistics*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentStatusPresentStatistics*, UInt32)
    release : Proc(IPresentStatusPresentStatistics*, UInt32)
    get_present_id : Proc(IPresentStatusPresentStatistics*, UInt64)
    get_kind : Proc(IPresentStatusPresentStatistics*, PresentStatisticsKind)
    get_composition_frame_id : Proc(IPresentStatusPresentStatistics*, UInt64)
    get_present_status : Proc(IPresentStatusPresentStatistics*, PresentStatus)
  end

  IPresentStatusPresentStatistics_GUID = "c9ed2a41-79cb-435e-964e-c8553055420c"
  IID_IPresentStatusPresentStatistics = LibC::GUID.new(0xc9ed2a41_u32, 0x79cb_u16, 0x435e_u16, StaticArray[0x96_u8, 0x4e_u8, 0xc8_u8, 0x55_u8, 0x30_u8, 0x55_u8, 0x42_u8, 0xc_u8])
  struct IPresentStatusPresentStatistics
    lpVtbl : IPresentStatusPresentStatisticsVTbl*
  end

  struct ICompositionFramePresentStatisticsVTbl
    query_interface : Proc(ICompositionFramePresentStatistics*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICompositionFramePresentStatistics*, UInt32)
    release : Proc(ICompositionFramePresentStatistics*, UInt32)
    get_present_id : Proc(ICompositionFramePresentStatistics*, UInt64)
    get_kind : Proc(ICompositionFramePresentStatistics*, PresentStatisticsKind)
    get_content_tag : Proc(ICompositionFramePresentStatistics*, LibC::UINT_PTR)
    get_composition_frame_id : Proc(ICompositionFramePresentStatistics*, UInt64)
    get_display_instance_array : Proc(ICompositionFramePresentStatistics*, UInt32*, CompositionFrameDisplayInstance**, Void)
  end

  ICompositionFramePresentStatistics_GUID = "ab41d127-c101-4c0a-911d-f9f2e9d08e64"
  IID_ICompositionFramePresentStatistics = LibC::GUID.new(0xab41d127_u32, 0xc101_u16, 0x4c0a_u16, StaticArray[0x91_u8, 0x1d_u8, 0xf9_u8, 0xf2_u8, 0xe9_u8, 0xd0_u8, 0x8e_u8, 0x64_u8])
  struct ICompositionFramePresentStatistics
    lpVtbl : ICompositionFramePresentStatisticsVTbl*
  end

  struct IIndependentFlipFramePresentStatisticsVTbl
    query_interface : Proc(IIndependentFlipFramePresentStatistics*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIndependentFlipFramePresentStatistics*, UInt32)
    release : Proc(IIndependentFlipFramePresentStatistics*, UInt32)
    get_present_id : Proc(IIndependentFlipFramePresentStatistics*, UInt64)
    get_kind : Proc(IIndependentFlipFramePresentStatistics*, PresentStatisticsKind)
    get_output_adapter_luid : Proc(IIndependentFlipFramePresentStatistics*, LUID)
    get_output_vid_pn_source_id : Proc(IIndependentFlipFramePresentStatistics*, UInt32)
    get_content_tag : Proc(IIndependentFlipFramePresentStatistics*, LibC::UINT_PTR)
    get_displayed_time : Proc(IIndependentFlipFramePresentStatistics*, SystemInterruptTime)
    get_present_duration : Proc(IIndependentFlipFramePresentStatistics*, SystemInterruptTime)
  end

  IIndependentFlipFramePresentStatistics_GUID = "8c93be27-ad94-4da0-8fd4-2413132d124e"
  IID_IIndependentFlipFramePresentStatistics = LibC::GUID.new(0x8c93be27_u32, 0xad94_u16, 0x4da0_u16, StaticArray[0x8f_u8, 0xd4_u8, 0x24_u8, 0x13_u8, 0x13_u8, 0x2d_u8, 0x12_u8, 0x4e_u8])
  struct IIndependentFlipFramePresentStatistics
    lpVtbl : IIndependentFlipFramePresentStatisticsVTbl*
  end


  # Params # d3ddevice : IUnknown [In],riid : Guid* [In],presentationfactory : Void** [In]
  fun CreatePresentationFactory(d3ddevice : IUnknown, riid : Guid*, presentationfactory : Void**) : HRESULT
end