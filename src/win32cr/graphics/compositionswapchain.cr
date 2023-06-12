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

  IPresentationBuffer_GUID = LibC::GUID.new("2e217d3a-5abb-4138-9a13-a775593c89ca")
  CLSID_IPresentationBuffer = "2e217d3a-5abb-4138-9a13-a775593c89ca"
  struct IPresentationBuffer
    lpVtbl : IPresentationBufferVTbl*
  end

  struct IPresentationContentVTbl
    query_interface : Proc(IPresentationContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPresentationContent*, UInt32)
    release : Proc(IPresentationContent*, UInt32)
    set_tag : Proc(IPresentationContent*, LibC::UINT_PTR, Void)
  end

  IPresentationContent_GUID = LibC::GUID.new("5668bb79-3d8e-415c-b215-f38020f2d252")
  CLSID_IPresentationContent = "5668bb79-3d8e-415c-b215-f38020f2d252"
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

  IPresentationSurface_GUID = LibC::GUID.new("956710fb-ea40-4eba-a3eb-4375a0eb4edc")
  CLSID_IPresentationSurface = "956710fb-ea40-4eba-a3eb-4375a0eb4edc"
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

  IPresentStatistics_GUID = LibC::GUID.new("b44b8bda-7282-495d-9dd7-ceadd8b4bb86")
  CLSID_IPresentStatistics = "b44b8bda-7282-495d-9dd7-ceadd8b4bb86"
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

  IPresentationManager_GUID = LibC::GUID.new("fb562f82-6292-470a-88b1-843661e7f20c")
  CLSID_IPresentationManager = "fb562f82-6292-470a-88b1-843661e7f20c"
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

  IPresentationFactory_GUID = LibC::GUID.new("8fb37b58-1d74-4f64-a49c-1f97a80a2ec0")
  CLSID_IPresentationFactory = "8fb37b58-1d74-4f64-a49c-1f97a80a2ec0"
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

  IPresentStatusPresentStatistics_GUID = LibC::GUID.new("c9ed2a41-79cb-435e-964e-c8553055420c")
  CLSID_IPresentStatusPresentStatistics = "c9ed2a41-79cb-435e-964e-c8553055420c"
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

  ICompositionFramePresentStatistics_GUID = LibC::GUID.new("ab41d127-c101-4c0a-911d-f9f2e9d08e64")
  CLSID_ICompositionFramePresentStatistics = "ab41d127-c101-4c0a-911d-f9f2e9d08e64"
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

  IIndependentFlipFramePresentStatistics_GUID = LibC::GUID.new("8c93be27-ad94-4da0-8fd4-2413132d124e")
  CLSID_IIndependentFlipFramePresentStatistics = "8c93be27-ad94-4da0-8fd4-2413132d124e"
  struct IIndependentFlipFramePresentStatistics
    lpVtbl : IIndependentFlipFramePresentStatisticsVTbl*
  end


  # Params # d3ddevice : IUnknown [In],riid : Guid* [In],presentationfactory : Void** [In]
  fun CreatePresentationFactory(d3ddevice : IUnknown, riid : Guid*, presentationfactory : Void**) : HRESULT
end
