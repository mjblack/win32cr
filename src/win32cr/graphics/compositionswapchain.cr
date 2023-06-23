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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_available_event : UInt64
    is_available : UInt64
  end

  IPresentationBuffer_GUID = "2e217d3a-5abb-4138-9a13-a775593c89ca"
  IID_IPresentationBuffer = LibC::GUID.new(0x2e217d3a_u32, 0x5abb_u16, 0x4138_u16, StaticArray[0x9a_u8, 0x13_u8, 0xa7_u8, 0x75_u8, 0x59_u8, 0x3c_u8, 0x89_u8, 0xca_u8])
  struct IPresentationBuffer
    lpVtbl : IPresentationBufferVTbl*
  end

  struct IPresentationContentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_tag : UInt64
  end

  IPresentationContent_GUID = "5668bb79-3d8e-415c-b215-f38020f2d252"
  IID_IPresentationContent = LibC::GUID.new(0x5668bb79_u32, 0x3d8e_u16, 0x415c_u16, StaticArray[0xb2_u8, 0x15_u8, 0xf3_u8, 0x80_u8, 0x20_u8, 0xf2_u8, 0xd2_u8, 0x52_u8])
  struct IPresentationContent
    lpVtbl : IPresentationContentVTbl*
  end

  struct IPresentationSurfaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_tag : UInt64
    set_buffer : UInt64
    set_color_space : UInt64
    set_alpha_mode : UInt64
    set_source_rect : UInt64
    set_transform : UInt64
    restrict_to_output : UInt64
    set_disable_readback : UInt64
    set_letterboxing_margins : UInt64
  end

  IPresentationSurface_GUID = "956710fb-ea40-4eba-a3eb-4375a0eb4edc"
  IID_IPresentationSurface = LibC::GUID.new(0x956710fb_u32, 0xea40_u16, 0x4eba_u16, StaticArray[0xa3_u8, 0xeb_u8, 0x43_u8, 0x75_u8, 0xa0_u8, 0xeb_u8, 0x4e_u8, 0xdc_u8])
  struct IPresentationSurface
    lpVtbl : IPresentationSurfaceVTbl*
  end

  struct IPresentStatisticsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_present_id : UInt64
    get_kind : UInt64
  end

  IPresentStatistics_GUID = "b44b8bda-7282-495d-9dd7-ceadd8b4bb86"
  IID_IPresentStatistics = LibC::GUID.new(0xb44b8bda_u32, 0x7282_u16, 0x495d_u16, StaticArray[0x9d_u8, 0xd7_u8, 0xce_u8, 0xad_u8, 0xd8_u8, 0xb4_u8, 0xbb_u8, 0x86_u8])
  struct IPresentStatistics
    lpVtbl : IPresentStatisticsVTbl*
  end

  struct IPresentationManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_buffer_from_resource : UInt64
    create_presentation_surface : UInt64
    get_next_present_id : UInt64
    set_target_time : UInt64
    set_preferred_present_duration : UInt64
    force_v_sync_interrupt : UInt64
    present : UInt64
    get_present_retiring_fence : UInt64
    cancel_presents_from : UInt64
    get_lost_event : UInt64
    get_present_statistics_available_event : UInt64
    enable_present_statistics_kind : UInt64
    get_next_present_statistics : UInt64
  end

  IPresentationManager_GUID = "fb562f82-6292-470a-88b1-843661e7f20c"
  IID_IPresentationManager = LibC::GUID.new(0xfb562f82_u32, 0x6292_u16, 0x470a_u16, StaticArray[0x88_u8, 0xb1_u8, 0x84_u8, 0x36_u8, 0x61_u8, 0xe7_u8, 0xf2_u8, 0xc_u8])
  struct IPresentationManager
    lpVtbl : IPresentationManagerVTbl*
  end

  struct IPresentationFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_presentation_supported : UInt64
    is_presentation_supported_with_independent_flip : UInt64
    create_presentation_manager : UInt64
  end

  IPresentationFactory_GUID = "8fb37b58-1d74-4f64-a49c-1f97a80a2ec0"
  IID_IPresentationFactory = LibC::GUID.new(0x8fb37b58_u32, 0x1d74_u16, 0x4f64_u16, StaticArray[0xa4_u8, 0x9c_u8, 0x1f_u8, 0x97_u8, 0xa8_u8, 0xa_u8, 0x2e_u8, 0xc0_u8])
  struct IPresentationFactory
    lpVtbl : IPresentationFactoryVTbl*
  end

  struct IPresentStatusPresentStatisticsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_present_id : UInt64
    get_kind : UInt64
    get_composition_frame_id : UInt64
    get_present_status : UInt64
  end

  IPresentStatusPresentStatistics_GUID = "c9ed2a41-79cb-435e-964e-c8553055420c"
  IID_IPresentStatusPresentStatistics = LibC::GUID.new(0xc9ed2a41_u32, 0x79cb_u16, 0x435e_u16, StaticArray[0x96_u8, 0x4e_u8, 0xc8_u8, 0x55_u8, 0x30_u8, 0x55_u8, 0x42_u8, 0xc_u8])
  struct IPresentStatusPresentStatistics
    lpVtbl : IPresentStatusPresentStatisticsVTbl*
  end

  struct ICompositionFramePresentStatisticsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_present_id : UInt64
    get_kind : UInt64
    get_content_tag : UInt64
    get_composition_frame_id : UInt64
    get_display_instance_array : UInt64
  end

  ICompositionFramePresentStatistics_GUID = "ab41d127-c101-4c0a-911d-f9f2e9d08e64"
  IID_ICompositionFramePresentStatistics = LibC::GUID.new(0xab41d127_u32, 0xc101_u16, 0x4c0a_u16, StaticArray[0x91_u8, 0x1d_u8, 0xf9_u8, 0xf2_u8, 0xe9_u8, 0xd0_u8, 0x8e_u8, 0x64_u8])
  struct ICompositionFramePresentStatistics
    lpVtbl : ICompositionFramePresentStatisticsVTbl*
  end

  struct IIndependentFlipFramePresentStatisticsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_present_id : UInt64
    get_kind : UInt64
    get_output_adapter_luid : UInt64
    get_output_vid_pn_source_id : UInt64
    get_content_tag : UInt64
    get_displayed_time : UInt64
    get_present_duration : UInt64
  end

  IIndependentFlipFramePresentStatistics_GUID = "8c93be27-ad94-4da0-8fd4-2413132d124e"
  IID_IIndependentFlipFramePresentStatistics = LibC::GUID.new(0x8c93be27_u32, 0xad94_u16, 0x4da0_u16, StaticArray[0x8f_u8, 0xd4_u8, 0x24_u8, 0x13_u8, 0x13_u8, 0x2d_u8, 0x12_u8, 0x4e_u8])
  struct IIndependentFlipFramePresentStatistics
    lpVtbl : IIndependentFlipFramePresentStatisticsVTbl*
  end


  # Params # d3ddevice : IUnknown [In],riid : Guid* [In],presentationfactory : Void** [In]
  fun CreatePresentationFactory(d3ddevice : IUnknown, riid : Guid*, presentationfactory : Void**) : HRESULT
end
struct LibWin32::IPresentationBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_available_event(availableeventhandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_available_event.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(availableeventhandle)
  end
  def is_available(isavailable : UInt8*) : HRESULT
    @lpVtbl.value.is_available.unsafe_as(Proc(UInt8*, HRESULT)).call(isavailable)
  end
end
struct LibWin32::IPresentationContent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_tag(tag : LibC::UINT_PTR) : Void
    @lpVtbl.value.set_tag.unsafe_as(Proc(LibC::UINT_PTR, Void)).call(tag)
  end
end
struct LibWin32::IPresentationSurface
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_tag(tag : LibC::UINT_PTR) : Void
    @lpVtbl.value.set_tag.unsafe_as(Proc(LibC::UINT_PTR, Void)).call(tag)
  end
  def set_buffer(presentationbuffer : IPresentationBuffer) : HRESULT
    @lpVtbl.value.set_buffer.unsafe_as(Proc(IPresentationBuffer, HRESULT)).call(presentationbuffer)
  end
  def set_color_space(colorspace : DXGI_COLOR_SPACE_TYPE) : HRESULT
    @lpVtbl.value.set_color_space.unsafe_as(Proc(DXGI_COLOR_SPACE_TYPE, HRESULT)).call(colorspace)
  end
  def set_alpha_mode(alphamode : DXGI_ALPHA_MODE) : HRESULT
    @lpVtbl.value.set_alpha_mode.unsafe_as(Proc(DXGI_ALPHA_MODE, HRESULT)).call(alphamode)
  end
  def set_source_rect(sourcerect : RECT*) : HRESULT
    @lpVtbl.value.set_source_rect.unsafe_as(Proc(RECT*, HRESULT)).call(sourcerect)
  end
  def set_transform(transform : PresentationTransform*) : HRESULT
    @lpVtbl.value.set_transform.unsafe_as(Proc(PresentationTransform*, HRESULT)).call(transform)
  end
  def restrict_to_output(output : IUnknown) : HRESULT
    @lpVtbl.value.restrict_to_output.unsafe_as(Proc(IUnknown, HRESULT)).call(output)
  end
  def set_disable_readback(value : UInt8) : HRESULT
    @lpVtbl.value.set_disable_readback.unsafe_as(Proc(UInt8, HRESULT)).call(value)
  end
  def set_letterboxing_margins(leftletterboxsize : Float32, topletterboxsize : Float32, rightletterboxsize : Float32, bottomletterboxsize : Float32) : HRESULT
    @lpVtbl.value.set_letterboxing_margins.unsafe_as(Proc(Float32, Float32, Float32, Float32, HRESULT)).call(leftletterboxsize, topletterboxsize, rightletterboxsize, bottomletterboxsize)
  end
end
struct LibWin32::IPresentStatistics
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_present_id : UInt64
    @lpVtbl.value.get_present_id.unsafe_as(Proc(UInt64)).call
  end
  def get_kind : PresentStatisticsKind
    @lpVtbl.value.get_kind.unsafe_as(Proc(PresentStatisticsKind)).call
  end
end
struct LibWin32::IPresentationManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_buffer_from_resource(resource : IUnknown, presentationbuffer : IPresentationBuffer*) : HRESULT
    @lpVtbl.value.add_buffer_from_resource.unsafe_as(Proc(IUnknown, IPresentationBuffer*, HRESULT)).call(resource, presentationbuffer)
  end
  def create_presentation_surface(compositionsurfacehandle : LibC::HANDLE, presentationsurface : IPresentationSurface*) : HRESULT
    @lpVtbl.value.create_presentation_surface.unsafe_as(Proc(LibC::HANDLE, IPresentationSurface*, HRESULT)).call(compositionsurfacehandle, presentationsurface)
  end
  def get_next_present_id : UInt64
    @lpVtbl.value.get_next_present_id.unsafe_as(Proc(UInt64)).call
  end
  def set_target_time(targettime : SystemInterruptTime) : HRESULT
    @lpVtbl.value.set_target_time.unsafe_as(Proc(SystemInterruptTime, HRESULT)).call(targettime)
  end
  def set_preferred_present_duration(preferredduration : SystemInterruptTime, deviationtolerance : SystemInterruptTime) : HRESULT
    @lpVtbl.value.set_preferred_present_duration.unsafe_as(Proc(SystemInterruptTime, SystemInterruptTime, HRESULT)).call(preferredduration, deviationtolerance)
  end
  def force_v_sync_interrupt(forcevsyncinterrupt : UInt8) : HRESULT
    @lpVtbl.value.force_v_sync_interrupt.unsafe_as(Proc(UInt8, HRESULT)).call(forcevsyncinterrupt)
  end
  def present : HRESULT
    @lpVtbl.value.present.unsafe_as(Proc(HRESULT)).call
  end
  def get_present_retiring_fence(riid : Guid*, fence : Void**) : HRESULT
    @lpVtbl.value.get_present_retiring_fence.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, fence)
  end
  def cancel_presents_from(presentidtocancelfrom : UInt64) : HRESULT
    @lpVtbl.value.cancel_presents_from.unsafe_as(Proc(UInt64, HRESULT)).call(presentidtocancelfrom)
  end
  def get_lost_event(losteventhandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_lost_event.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(losteventhandle)
  end
  def get_present_statistics_available_event(presentstatisticsavailableeventhandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_present_statistics_available_event.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(presentstatisticsavailableeventhandle)
  end
  def enable_present_statistics_kind(presentstatisticskind : PresentStatisticsKind, enabled : UInt8) : HRESULT
    @lpVtbl.value.enable_present_statistics_kind.unsafe_as(Proc(PresentStatisticsKind, UInt8, HRESULT)).call(presentstatisticskind, enabled)
  end
  def get_next_present_statistics(nextpresentstatistics : IPresentStatistics*) : HRESULT
    @lpVtbl.value.get_next_present_statistics.unsafe_as(Proc(IPresentStatistics*, HRESULT)).call(nextpresentstatistics)
  end
end
struct LibWin32::IPresentationFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_presentation_supported : UInt8
    @lpVtbl.value.is_presentation_supported.unsafe_as(Proc(UInt8)).call
  end
  def is_presentation_supported_with_independent_flip : UInt8
    @lpVtbl.value.is_presentation_supported_with_independent_flip.unsafe_as(Proc(UInt8)).call
  end
  def create_presentation_manager(pppresentationmanager : IPresentationManager*) : HRESULT
    @lpVtbl.value.create_presentation_manager.unsafe_as(Proc(IPresentationManager*, HRESULT)).call(pppresentationmanager)
  end
end
struct LibWin32::IPresentStatusPresentStatistics
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_present_id : UInt64
    @lpVtbl.value.get_present_id.unsafe_as(Proc(UInt64)).call
  end
  def get_kind : PresentStatisticsKind
    @lpVtbl.value.get_kind.unsafe_as(Proc(PresentStatisticsKind)).call
  end
  def get_composition_frame_id : UInt64
    @lpVtbl.value.get_composition_frame_id.unsafe_as(Proc(UInt64)).call
  end
  def get_present_status : PresentStatus
    @lpVtbl.value.get_present_status.unsafe_as(Proc(PresentStatus)).call
  end
end
struct LibWin32::ICompositionFramePresentStatistics
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_present_id : UInt64
    @lpVtbl.value.get_present_id.unsafe_as(Proc(UInt64)).call
  end
  def get_kind : PresentStatisticsKind
    @lpVtbl.value.get_kind.unsafe_as(Proc(PresentStatisticsKind)).call
  end
  def get_content_tag : LibC::UINT_PTR
    @lpVtbl.value.get_content_tag.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
  def get_composition_frame_id : UInt64
    @lpVtbl.value.get_composition_frame_id.unsafe_as(Proc(UInt64)).call
  end
  def get_display_instance_array(displayinstancearraycount : UInt32*, displayinstancearray : CompositionFrameDisplayInstance**) : Void
    @lpVtbl.value.get_display_instance_array.unsafe_as(Proc(UInt32*, CompositionFrameDisplayInstance**, Void)).call(displayinstancearraycount, displayinstancearray)
  end
end
struct LibWin32::IIndependentFlipFramePresentStatistics
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_present_id : UInt64
    @lpVtbl.value.get_present_id.unsafe_as(Proc(UInt64)).call
  end
  def get_kind : PresentStatisticsKind
    @lpVtbl.value.get_kind.unsafe_as(Proc(PresentStatisticsKind)).call
  end
  def get_output_adapter_luid : LUID
    @lpVtbl.value.get_output_adapter_luid.unsafe_as(Proc(LUID)).call
  end
  def get_output_vid_pn_source_id : UInt32
    @lpVtbl.value.get_output_vid_pn_source_id.unsafe_as(Proc(UInt32)).call
  end
  def get_content_tag : LibC::UINT_PTR
    @lpVtbl.value.get_content_tag.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
  def get_displayed_time : SystemInterruptTime
    @lpVtbl.value.get_displayed_time.unsafe_as(Proc(SystemInterruptTime)).call
  end
  def get_present_duration : SystemInterruptTime
    @lpVtbl.value.get_present_duration.unsafe_as(Proc(SystemInterruptTime)).call
  end
end
