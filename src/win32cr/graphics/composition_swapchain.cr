require "./../system/com.cr"
require "./../foundation.cr"
require "./dxgi/common.cr"

module Win32cr::Graphics::CompositionSwapchain
  extend self

  enum PresentStatisticsKind
    PresentStatisticsKind_PresentStatus = 1_i32
    PresentStatisticsKind_CompositionFrame = 2_i32
    PresentStatisticsKind_IndependentFlipFrame = 3_i32
  end
  enum PresentStatus
    PresentStatus_Queued = 0_i32
    PresentStatus_Skipped = 1_i32
    PresentStatus_Canceled = 2_i32
  end
  enum CompositionFrameInstanceKind
    CompositionFrameInstanceKind_ComposedOnScreen = 0_i32
    CompositionFrameInstanceKind_ScanoutOnScreen = 1_i32
    CompositionFrameInstanceKind_ComposedToIntermediate = 2_i32
  end

  @[Extern]
  struct SystemInterruptTime
    property value : UInt64
    def initialize(@value : UInt64)
    end
  end

  @[Extern]
  struct PresentationTransform
    property m11 : Float32
    property m12 : Float32
    property m21 : Float32
    property m22 : Float32
    property m31 : Float32
    property m32 : Float32
    def initialize(@m11 : Float32, @m12 : Float32, @m21 : Float32, @m22 : Float32, @m31 : Float32, @m32 : Float32)
    end
  end

  @[Extern]
  struct CompositionFrameDisplayInstance
    property displayAdapterLUID : Win32cr::Foundation::LUID
    property displayVidPnSourceId : UInt32
    property displayUniqueId : UInt32
    property renderAdapterLUID : Win32cr::Foundation::LUID
    property instanceKind : Win32cr::Graphics::CompositionSwapchain::CompositionFrameInstanceKind
    property finalTransform : Win32cr::Graphics::CompositionSwapchain::PresentationTransform
    property requiredCrossAdapterCopy : UInt8
    property colorSpace : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE
    def initialize(@displayAdapterLUID : Win32cr::Foundation::LUID, @displayVidPnSourceId : UInt32, @displayUniqueId : UInt32, @renderAdapterLUID : Win32cr::Foundation::LUID, @instanceKind : Win32cr::Graphics::CompositionSwapchain::CompositionFrameInstanceKind, @finalTransform : Win32cr::Graphics::CompositionSwapchain::PresentationTransform, @requiredCrossAdapterCopy : UInt8, @colorSpace : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE)
    end
  end

  @[Extern]
  record IPresentationBufferVtbl,
    query_interface : Proc(IPresentationBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPresentationBuffer*, UInt32),
    release : Proc(IPresentationBuffer*, UInt32),
    get_available_event : Proc(IPresentationBuffer*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    is_available : Proc(IPresentationBuffer*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPresentationBuffer, lpVtbl : IPresentationBufferVtbl* do
    GUID = LibC::GUID.new(0x2e217d3a_u32, 0x5abb_u16, 0x4138_u16, StaticArray[0x9a_u8, 0x13_u8, 0xa7_u8, 0x75_u8, 0x59_u8, 0x3c_u8, 0x89_u8, 0xca_u8])
    def query_interface(this : IPresentationBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPresentationBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPresentationBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_available_event(this : IPresentationBuffer*, availableEventHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_available_event.call(this, availableEventHandle)
    end
    def is_available(this : IPresentationBuffer*, isAvailable : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_available.call(this, isAvailable)
    end

  end

  @[Extern]
  record IPresentationContentVtbl,
    query_interface : Proc(IPresentationContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPresentationContent*, UInt32),
    release : Proc(IPresentationContent*, UInt32),
    set_tag : Proc(IPresentationContent*, LibC::UIntPtrT, Void)


  @[Extern]
  record IPresentationContent, lpVtbl : IPresentationContentVtbl* do
    GUID = LibC::GUID.new(0x5668bb79_u32, 0x3d8e_u16, 0x415c_u16, StaticArray[0xb2_u8, 0x15_u8, 0xf3_u8, 0x80_u8, 0x20_u8, 0xf2_u8, 0xd2_u8, 0x52_u8])
    def query_interface(this : IPresentationContent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPresentationContent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPresentationContent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_tag(this : IPresentationContent*, tag : LibC::UIntPtrT) : Void
      @lpVtbl.try &.value.set_tag.call(this, tag)
    end

  end

  @[Extern]
  record IPresentationSurfaceVtbl,
    query_interface : Proc(IPresentationSurface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPresentationSurface*, UInt32),
    release : Proc(IPresentationSurface*, UInt32),
    set_tag : Proc(IPresentationSurface*, LibC::UIntPtrT, Void),
    set_buffer : Proc(IPresentationSurface*, Void*, Win32cr::Foundation::HRESULT),
    set_color_space : Proc(IPresentationSurface*, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, Win32cr::Foundation::HRESULT),
    set_alpha_mode : Proc(IPresentationSurface*, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Win32cr::Foundation::HRESULT),
    set_source_rect : Proc(IPresentationSurface*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    set_transform : Proc(IPresentationSurface*, Win32cr::Graphics::CompositionSwapchain::PresentationTransform*, Win32cr::Foundation::HRESULT),
    restrict_to_output : Proc(IPresentationSurface*, Void*, Win32cr::Foundation::HRESULT),
    set_disable_readback : Proc(IPresentationSurface*, UInt8, Win32cr::Foundation::HRESULT),
    set_letterboxing_margins : Proc(IPresentationSurface*, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPresentationSurface, lpVtbl : IPresentationSurfaceVtbl* do
    GUID = LibC::GUID.new(0x956710fb_u32, 0xea40_u16, 0x4eba_u16, StaticArray[0xa3_u8, 0xeb_u8, 0x43_u8, 0x75_u8, 0xa0_u8, 0xeb_u8, 0x4e_u8, 0xdc_u8])
    def query_interface(this : IPresentationSurface*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPresentationSurface*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPresentationSurface*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_tag(this : IPresentationSurface*, tag : LibC::UIntPtrT) : Void
      @lpVtbl.try &.value.set_tag.call(this, tag)
    end
    def set_buffer(this : IPresentationSurface*, presentationBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer.call(this, presentationBuffer)
    end
    def set_color_space(this : IPresentationSurface*, colorSpace : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_space.call(this, colorSpace)
    end
    def set_alpha_mode(this : IPresentationSurface*, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_mode.call(this, alphaMode)
    end
    def set_source_rect(this : IPresentationSurface*, sourceRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_rect.call(this, sourceRect)
    end
    def set_transform(this : IPresentationSurface*, transform : Win32cr::Graphics::CompositionSwapchain::PresentationTransform*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform.call(this, transform)
    end
    def restrict_to_output(this : IPresentationSurface*, output : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restrict_to_output.call(this, output)
    end
    def set_disable_readback(this : IPresentationSurface*, value : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_disable_readback.call(this, value)
    end
    def set_letterboxing_margins(this : IPresentationSurface*, leftLetterboxSize : Float32, topLetterboxSize : Float32, rightLetterboxSize : Float32, bottomLetterboxSize : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_letterboxing_margins.call(this, leftLetterboxSize, topLetterboxSize, rightLetterboxSize, bottomLetterboxSize)
    end

  end

  @[Extern]
  record IPresentStatisticsVtbl,
    query_interface : Proc(IPresentStatistics*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPresentStatistics*, UInt32),
    release : Proc(IPresentStatistics*, UInt32),
    get_present_id : Proc(IPresentStatistics*, UInt64),
    get_kind : Proc(IPresentStatistics*, Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind)


  @[Extern]
  record IPresentStatistics, lpVtbl : IPresentStatisticsVtbl* do
    GUID = LibC::GUID.new(0xb44b8bda_u32, 0x7282_u16, 0x495d_u16, StaticArray[0x9d_u8, 0xd7_u8, 0xce_u8, 0xad_u8, 0xd8_u8, 0xb4_u8, 0xbb_u8, 0x86_u8])
    def query_interface(this : IPresentStatistics*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPresentStatistics*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPresentStatistics*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_present_id(this : IPresentStatistics*) : UInt64
      @lpVtbl.try &.value.get_present_id.call(this)
    end
    def get_kind(this : IPresentStatistics*) : Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind
      @lpVtbl.try &.value.get_kind.call(this)
    end

  end

  @[Extern]
  record IPresentationManagerVtbl,
    query_interface : Proc(IPresentationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPresentationManager*, UInt32),
    release : Proc(IPresentationManager*, UInt32),
    add_buffer_from_resource : Proc(IPresentationManager*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_presentation_surface : Proc(IPresentationManager*, Win32cr::Foundation::HANDLE, Void**, Win32cr::Foundation::HRESULT),
    get_next_present_id : Proc(IPresentationManager*, UInt64),
    set_target_time : Proc(IPresentationManager*, Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime, Win32cr::Foundation::HRESULT),
    set_preferred_present_duration : Proc(IPresentationManager*, Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime, Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime, Win32cr::Foundation::HRESULT),
    force_v_sync_interrupt : Proc(IPresentationManager*, UInt8, Win32cr::Foundation::HRESULT),
    present : Proc(IPresentationManager*, Win32cr::Foundation::HRESULT),
    get_present_retiring_fence : Proc(IPresentationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    cancel_presents_from : Proc(IPresentationManager*, UInt64, Win32cr::Foundation::HRESULT),
    get_lost_event : Proc(IPresentationManager*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_present_statistics_available_event : Proc(IPresentationManager*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    enable_present_statistics_kind : Proc(IPresentationManager*, Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind, UInt8, Win32cr::Foundation::HRESULT),
    get_next_present_statistics : Proc(IPresentationManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPresentationManager, lpVtbl : IPresentationManagerVtbl* do
    GUID = LibC::GUID.new(0xfb562f82_u32, 0x6292_u16, 0x470a_u16, StaticArray[0x88_u8, 0xb1_u8, 0x84_u8, 0x36_u8, 0x61_u8, 0xe7_u8, 0xf2_u8, 0xc_u8])
    def query_interface(this : IPresentationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPresentationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPresentationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_buffer_from_resource(this : IPresentationManager*, resource : Void*, presentationBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_buffer_from_resource.call(this, resource, presentationBuffer)
    end
    def create_presentation_surface(this : IPresentationManager*, compositionSurfaceHandle : Win32cr::Foundation::HANDLE, presentationSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_presentation_surface.call(this, compositionSurfaceHandle, presentationSurface)
    end
    def get_next_present_id(this : IPresentationManager*) : UInt64
      @lpVtbl.try &.value.get_next_present_id.call(this)
    end
    def set_target_time(this : IPresentationManager*, targetTime : Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_time.call(this, targetTime)
    end
    def set_preferred_present_duration(this : IPresentationManager*, preferredDuration : Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime, deviationTolerance : Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preferred_present_duration.call(this, preferredDuration, deviationTolerance)
    end
    def force_v_sync_interrupt(this : IPresentationManager*, forceVsyncInterrupt : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_v_sync_interrupt.call(this, forceVsyncInterrupt)
    end
    def present(this : IPresentationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present.call(this)
    end
    def get_present_retiring_fence(this : IPresentationManager*, riid : LibC::GUID*, fence : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_present_retiring_fence.call(this, riid, fence)
    end
    def cancel_presents_from(this : IPresentationManager*, presentIdToCancelFrom : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_presents_from.call(this, presentIdToCancelFrom)
    end
    def get_lost_event(this : IPresentationManager*, lostEventHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lost_event.call(this, lostEventHandle)
    end
    def get_present_statistics_available_event(this : IPresentationManager*, presentStatisticsAvailableEventHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_present_statistics_available_event.call(this, presentStatisticsAvailableEventHandle)
    end
    def enable_present_statistics_kind(this : IPresentationManager*, presentStatisticsKind : Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind, enabled : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_present_statistics_kind.call(this, presentStatisticsKind, enabled)
    end
    def get_next_present_statistics(this : IPresentationManager*, nextPresentStatistics : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_present_statistics.call(this, nextPresentStatistics)
    end

  end

  @[Extern]
  record IPresentationFactoryVtbl,
    query_interface : Proc(IPresentationFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPresentationFactory*, UInt32),
    release : Proc(IPresentationFactory*, UInt32),
    is_presentation_supported : Proc(IPresentationFactory*, UInt8),
    is_presentation_supported_with_independent_flip : Proc(IPresentationFactory*, UInt8),
    create_presentation_manager : Proc(IPresentationFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPresentationFactory, lpVtbl : IPresentationFactoryVtbl* do
    GUID = LibC::GUID.new(0x8fb37b58_u32, 0x1d74_u16, 0x4f64_u16, StaticArray[0xa4_u8, 0x9c_u8, 0x1f_u8, 0x97_u8, 0xa8_u8, 0xa_u8, 0x2e_u8, 0xc0_u8])
    def query_interface(this : IPresentationFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPresentationFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPresentationFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_presentation_supported(this : IPresentationFactory*) : UInt8
      @lpVtbl.try &.value.is_presentation_supported.call(this)
    end
    def is_presentation_supported_with_independent_flip(this : IPresentationFactory*) : UInt8
      @lpVtbl.try &.value.is_presentation_supported_with_independent_flip.call(this)
    end
    def create_presentation_manager(this : IPresentationFactory*, ppPresentationManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_presentation_manager.call(this, ppPresentationManager)
    end

  end

  @[Extern]
  record IPresentStatusPresentStatisticsVtbl,
    query_interface : Proc(IPresentStatusPresentStatistics*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPresentStatusPresentStatistics*, UInt32),
    release : Proc(IPresentStatusPresentStatistics*, UInt32),
    get_present_id : Proc(IPresentStatusPresentStatistics*, UInt64),
    get_kind : Proc(IPresentStatusPresentStatistics*, Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind),
    get_composition_frame_id : Proc(IPresentStatusPresentStatistics*, UInt64),
    get_present_status : Proc(IPresentStatusPresentStatistics*, Win32cr::Graphics::CompositionSwapchain::PresentStatus)


  @[Extern]
  record IPresentStatusPresentStatistics, lpVtbl : IPresentStatusPresentStatisticsVtbl* do
    GUID = LibC::GUID.new(0xc9ed2a41_u32, 0x79cb_u16, 0x435e_u16, StaticArray[0x96_u8, 0x4e_u8, 0xc8_u8, 0x55_u8, 0x30_u8, 0x55_u8, 0x42_u8, 0xc_u8])
    def query_interface(this : IPresentStatusPresentStatistics*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPresentStatusPresentStatistics*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPresentStatusPresentStatistics*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_present_id(this : IPresentStatusPresentStatistics*) : UInt64
      @lpVtbl.try &.value.get_present_id.call(this)
    end
    def get_kind(this : IPresentStatusPresentStatistics*) : Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind
      @lpVtbl.try &.value.get_kind.call(this)
    end
    def get_composition_frame_id(this : IPresentStatusPresentStatistics*) : UInt64
      @lpVtbl.try &.value.get_composition_frame_id.call(this)
    end
    def get_present_status(this : IPresentStatusPresentStatistics*) : Win32cr::Graphics::CompositionSwapchain::PresentStatus
      @lpVtbl.try &.value.get_present_status.call(this)
    end

  end

  @[Extern]
  record ICompositionFramePresentStatisticsVtbl,
    query_interface : Proc(ICompositionFramePresentStatistics*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICompositionFramePresentStatistics*, UInt32),
    release : Proc(ICompositionFramePresentStatistics*, UInt32),
    get_present_id : Proc(ICompositionFramePresentStatistics*, UInt64),
    get_kind : Proc(ICompositionFramePresentStatistics*, Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind),
    get_content_tag : Proc(ICompositionFramePresentStatistics*, LibC::UIntPtrT),
    get_composition_frame_id : Proc(ICompositionFramePresentStatistics*, UInt64),
    get_display_instance_array : Proc(ICompositionFramePresentStatistics*, UInt32*, Win32cr::Graphics::CompositionSwapchain::CompositionFrameDisplayInstance**, Void)


  @[Extern]
  record ICompositionFramePresentStatistics, lpVtbl : ICompositionFramePresentStatisticsVtbl* do
    GUID = LibC::GUID.new(0xab41d127_u32, 0xc101_u16, 0x4c0a_u16, StaticArray[0x91_u8, 0x1d_u8, 0xf9_u8, 0xf2_u8, 0xe9_u8, 0xd0_u8, 0x8e_u8, 0x64_u8])
    def query_interface(this : ICompositionFramePresentStatistics*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICompositionFramePresentStatistics*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICompositionFramePresentStatistics*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_present_id(this : ICompositionFramePresentStatistics*) : UInt64
      @lpVtbl.try &.value.get_present_id.call(this)
    end
    def get_kind(this : ICompositionFramePresentStatistics*) : Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind
      @lpVtbl.try &.value.get_kind.call(this)
    end
    def get_content_tag(this : ICompositionFramePresentStatistics*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_content_tag.call(this)
    end
    def get_composition_frame_id(this : ICompositionFramePresentStatistics*) : UInt64
      @lpVtbl.try &.value.get_composition_frame_id.call(this)
    end
    def get_display_instance_array(this : ICompositionFramePresentStatistics*, displayInstanceArrayCount : UInt32*, displayInstanceArray : Win32cr::Graphics::CompositionSwapchain::CompositionFrameDisplayInstance**) : Void
      @lpVtbl.try &.value.get_display_instance_array.call(this, displayInstanceArrayCount, displayInstanceArray)
    end

  end

  @[Extern]
  record IIndependentFlipFramePresentStatisticsVtbl,
    query_interface : Proc(IIndependentFlipFramePresentStatistics*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIndependentFlipFramePresentStatistics*, UInt32),
    release : Proc(IIndependentFlipFramePresentStatistics*, UInt32),
    get_present_id : Proc(IIndependentFlipFramePresentStatistics*, UInt64),
    get_kind : Proc(IIndependentFlipFramePresentStatistics*, Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind),
    get_output_adapter_luid : Proc(IIndependentFlipFramePresentStatistics*, Win32cr::Foundation::LUID),
    get_output_vid_pn_source_id : Proc(IIndependentFlipFramePresentStatistics*, UInt32),
    get_content_tag : Proc(IIndependentFlipFramePresentStatistics*, LibC::UIntPtrT),
    get_displayed_time : Proc(IIndependentFlipFramePresentStatistics*, Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime),
    get_present_duration : Proc(IIndependentFlipFramePresentStatistics*, Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime)


  @[Extern]
  record IIndependentFlipFramePresentStatistics, lpVtbl : IIndependentFlipFramePresentStatisticsVtbl* do
    GUID = LibC::GUID.new(0x8c93be27_u32, 0xad94_u16, 0x4da0_u16, StaticArray[0x8f_u8, 0xd4_u8, 0x24_u8, 0x13_u8, 0x13_u8, 0x2d_u8, 0x12_u8, 0x4e_u8])
    def query_interface(this : IIndependentFlipFramePresentStatistics*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIndependentFlipFramePresentStatistics*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIndependentFlipFramePresentStatistics*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_present_id(this : IIndependentFlipFramePresentStatistics*) : UInt64
      @lpVtbl.try &.value.get_present_id.call(this)
    end
    def get_kind(this : IIndependentFlipFramePresentStatistics*) : Win32cr::Graphics::CompositionSwapchain::PresentStatisticsKind
      @lpVtbl.try &.value.get_kind.call(this)
    end
    def get_output_adapter_luid(this : IIndependentFlipFramePresentStatistics*) : Win32cr::Foundation::LUID
      @lpVtbl.try &.value.get_output_adapter_luid.call(this)
    end
    def get_output_vid_pn_source_id(this : IIndependentFlipFramePresentStatistics*) : UInt32
      @lpVtbl.try &.value.get_output_vid_pn_source_id.call(this)
    end
    def get_content_tag(this : IIndependentFlipFramePresentStatistics*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_content_tag.call(this)
    end
    def get_displayed_time(this : IIndependentFlipFramePresentStatistics*) : Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime
      @lpVtbl.try &.value.get_displayed_time.call(this)
    end
    def get_present_duration(this : IIndependentFlipFramePresentStatistics*) : Win32cr::Graphics::CompositionSwapchain::SystemInterruptTime
      @lpVtbl.try &.value.get_present_duration.call(this)
    end

  end

  def createPresentationFactory(d3dDevice : Void*, riid : LibC::GUID*, presentationFactory : Void**) : Win32cr::Foundation::HRESULT
    C.CreatePresentationFactory(d3dDevice, riid, presentationFactory)
  end

  @[Link("dcomp")]
  lib C
    # :nodoc:
    fun CreatePresentationFactory(d3dDevice : Void*, riid : LibC::GUID*, presentationFactory : Void**) : Win32cr::Foundation::HRESULT

  end
end