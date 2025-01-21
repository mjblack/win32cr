require "./../foundation.cr"
require "./../system/com.cr"

module Win32cr::Media::DxMediaObjects
  DMO_E_INVALIDSTREAMINDEX = -2147220991_i32
  DMO_E_INVALIDTYPE = -2147220990_i32
  DMO_E_TYPE_NOT_SET = -2147220989_i32
  DMO_E_NOTACCEPTING = -2147220988_i32
  DMO_E_TYPE_NOT_ACCEPTED = -2147220987_i32
  DMO_E_NO_MORE_ITEMS = -2147220986_i32
  DMOCATEGORY_AUDIO_DECODER = "57f2db8b-e6bb-4513-9d43-dcd2a6593125"
  DMOCATEGORY_AUDIO_ENCODER = "33d9a761-90c8-11d0-bd43-00a0c911ce86"
  DMOCATEGORY_VIDEO_DECODER = "4a69b442-28be-4991-969c-b500adf5d8a8"
  DMOCATEGORY_VIDEO_ENCODER = "33d9a760-90c8-11d0-bd43-00a0c911ce86"
  DMOCATEGORY_AUDIO_EFFECT = "f3602b3f-0592-48df-a4cd-674721e7ebeb"
  DMOCATEGORY_VIDEO_EFFECT = "d990ee14-776c-4723-be46-3da2f56f10b9"
  DMOCATEGORY_AUDIO_CAPTURE_EFFECT = "f665aaba-3e09-4920-aa5f-219811148f09"
  DMOCATEGORY_ACOUSTIC_ECHO_CANCEL = "bf963d80-c559-11d0-8a2b-00a0c9255ac1"
  DMOCATEGORY_AUDIO_NOISE_SUPPRESS = "e07f903f-62fd-4e60-8cdd-dea7236665b5"
  DMOCATEGORY_AGC = "e88c9ba0-c557-11d0-8a2b-00a0c9255ac1"

  enum DMO_INPUT_DATA_BUFFER_FLAGS_
    DMO_INPUT_DATA_BUFFERF_SYNCPOINT = 1_i32
    DMO_INPUT_DATA_BUFFERF_TIME = 2_i32
    DMO_INPUT_DATA_BUFFERF_TIMELENGTH = 4_i32
    DMO_INPUT_DATA_BUFFERF_DISCONTINUITY = 8_i32
  end
  enum DMO_OUTPUT_DATA_BUFFER_FLAGS_
    DMO_OUTPUT_DATA_BUFFERF_SYNCPOINT = 1_i32
    DMO_OUTPUT_DATA_BUFFERF_TIME = 2_i32
    DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH = 4_i32
    DMO_OUTPUT_DATA_BUFFERF_DISCONTINUITY = 8_i32
    DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE = 16777216_i32
  end
  enum DMO_INPUT_STATUS_FLAGS_
    DMO_INPUT_STATUSF_ACCEPT_DATA = 1_i32
  end
  enum DMO_INPUT_STREAM_INFO_FLAGS_
    DMO_INPUT_STREAMF_WHOLE_SAMPLES = 1_i32
    DMO_INPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 2_i32
    DMO_INPUT_STREAMF_FIXED_SAMPLE_SIZE = 4_i32
    DMO_INPUT_STREAMF_HOLDS_BUFFERS = 8_i32
  end
  enum DMO_OUTPUT_STREAM_INFO_FLAGS_
    DMO_OUTPUT_STREAMF_WHOLE_SAMPLES = 1_i32
    DMO_OUTPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 2_i32
    DMO_OUTPUT_STREAMF_FIXED_SAMPLE_SIZE = 4_i32
    DMO_OUTPUT_STREAMF_DISCARDABLE = 8_i32
    DMO_OUTPUT_STREAMF_OPTIONAL = 16_i32
  end
  enum DMO_SET_TYPE_FLAGS_
    DMO_SET_TYPEF_TEST_ONLY = 1_i32
    DMO_SET_TYPEF_CLEAR = 2_i32
  end
  enum DMO_PROCESS_OUTPUT_FLAGS_
    DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER = 1_i32
  end
  enum DMO_INPLACE_PROCESS_FLAGS_
    DMO_INPLACE_NORMAL = 0_i32
    DMO_INPLACE_ZERO = 1_i32
  end
  enum DMO_QUALITY_STATUS_FLAGS_
    DMO_QUALITY_STATUS_ENABLED = 1_i32
  end
  enum DMO_VIDEO_OUTPUT_STREAM_FLAGS_
    DMO_VOSF_NEEDS_PREVIOUS_SAMPLE = 1_i32
  end
  enum DMO_REGISTER_FLAGS
    DMO_REGISTERF_IS_KEYED = 1_i32
  end
  enum DMO_ENUM_FLAGS
    DMO_ENUMF_INCLUDE_KEYED = 1_i32
  end

  @[Extern]
  record DMO_MEDIA_TYPE,
    majortype : LibC::GUID,
    subtype : LibC::GUID,
    bFixedSizeSamples : Win32cr::Foundation::BOOL,
    bTemporalCompression : Win32cr::Foundation::BOOL,
    lSampleSize : UInt32,
    formattype : LibC::GUID,
    pUnk : Void*,
    cbFormat : UInt32,
    pbFormat : UInt8*

  @[Extern]
  record DMO_OUTPUT_DATA_BUFFER,
    pBuffer : Void*,
    dwStatus : UInt32,
    rtTimestamp : Int64,
    rtTimelength : Int64

  @[Extern]
  record DMO_PARTIAL_MEDIATYPE,
    type__ : LibC::GUID,
    subtype : LibC::GUID

  @[Extern]
  record IMediaBufferVtbl,
    query_interface : Proc(IMediaBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMediaBuffer*, UInt32),
    release : Proc(IMediaBuffer*, UInt32),
    set_length : Proc(IMediaBuffer*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_length : Proc(IMediaBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_buffer_and_length : Proc(IMediaBuffer*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("59eff8b9-938c-4a26-82f2-95cb84cdc837")]
  record IMediaBuffer, lpVtbl : IMediaBufferVtbl* do
    GUID = LibC::GUID.new(0x59eff8b9_u32, 0x938c_u16, 0x4a26_u16, StaticArray[0x82_u8, 0xf2_u8, 0x95_u8, 0xcb_u8, 0x84_u8, 0xcd_u8, 0xc8_u8, 0x37_u8])
    def query_interface(this : IMediaBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMediaBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMediaBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_length(this : IMediaBuffer*, cbLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_length.call(this, cbLength)
    end
    def get_max_length(this : IMediaBuffer*, pcbMaxLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_length.call(this, pcbMaxLength)
    end
    def get_buffer_and_length(this : IMediaBuffer*, ppBuffer : UInt8**, pcbLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_and_length.call(this, ppBuffer, pcbLength)
    end

  end

  @[Extern]
  record IMediaObjectVtbl,
    query_interface : Proc(IMediaObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMediaObject*, UInt32),
    release : Proc(IMediaObject*, UInt32),
    get_stream_count : Proc(IMediaObject*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_stream_info : Proc(IMediaObject*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_stream_info : Proc(IMediaObject*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_type : Proc(IMediaObject*, UInt32, UInt32, Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, Win32cr::Foundation::HRESULT),
    get_output_type : Proc(IMediaObject*, UInt32, UInt32, Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, Win32cr::Foundation::HRESULT),
    set_input_type : Proc(IMediaObject*, UInt32, Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, UInt32, Win32cr::Foundation::HRESULT),
    set_output_type : Proc(IMediaObject*, UInt32, Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, UInt32, Win32cr::Foundation::HRESULT),
    get_input_current_type : Proc(IMediaObject*, UInt32, Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, Win32cr::Foundation::HRESULT),
    get_output_current_type : Proc(IMediaObject*, UInt32, Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, Win32cr::Foundation::HRESULT),
    get_input_size_info : Proc(IMediaObject*, UInt32, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_size_info : Proc(IMediaObject*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_max_latency : Proc(IMediaObject*, UInt32, Int64*, Win32cr::Foundation::HRESULT),
    set_input_max_latency : Proc(IMediaObject*, UInt32, Int64, Win32cr::Foundation::HRESULT),
    flush : Proc(IMediaObject*, Win32cr::Foundation::HRESULT),
    discontinuity : Proc(IMediaObject*, UInt32, Win32cr::Foundation::HRESULT),
    allocate_streaming_resources : Proc(IMediaObject*, Win32cr::Foundation::HRESULT),
    free_streaming_resources : Proc(IMediaObject*, Win32cr::Foundation::HRESULT),
    get_input_status : Proc(IMediaObject*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    process_input : Proc(IMediaObject*, UInt32, Void*, UInt32, Int64, Int64, Win32cr::Foundation::HRESULT),
    process_output : Proc(IMediaObject*, UInt32, UInt32, Win32cr::Media::DxMediaObjects::DMO_OUTPUT_DATA_BUFFER*, UInt32*, Win32cr::Foundation::HRESULT),
    lock : Proc(IMediaObject*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d8ad0f58-5494-4102-97c5-ec798e59bcf4")]
  record IMediaObject, lpVtbl : IMediaObjectVtbl* do
    GUID = LibC::GUID.new(0xd8ad0f58_u32, 0x5494_u16, 0x4102_u16, StaticArray[0x97_u8, 0xc5_u8, 0xec_u8, 0x79_u8, 0x8e_u8, 0x59_u8, 0xbc_u8, 0xf4_u8])
    def query_interface(this : IMediaObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMediaObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMediaObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stream_count(this : IMediaObject*, pcInputStreams : UInt32*, pcOutputStreams : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_count.call(this, pcInputStreams, pcOutputStreams)
    end
    def get_input_stream_info(this : IMediaObject*, dwInputStreamIndex : UInt32, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_stream_info.call(this, dwInputStreamIndex, pdwFlags)
    end
    def get_output_stream_info(this : IMediaObject*, dwOutputStreamIndex : UInt32, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_stream_info.call(this, dwOutputStreamIndex, pdwFlags)
    end
    def get_input_type(this : IMediaObject*, dwInputStreamIndex : UInt32, dwTypeIndex : UInt32, pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_type.call(this, dwInputStreamIndex, dwTypeIndex, pmt)
    end
    def get_output_type(this : IMediaObject*, dwOutputStreamIndex : UInt32, dwTypeIndex : UInt32, pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_type.call(this, dwOutputStreamIndex, dwTypeIndex, pmt)
    end
    def set_input_type(this : IMediaObject*, dwInputStreamIndex : UInt32, pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_type.call(this, dwInputStreamIndex, pmt, dwFlags)
    end
    def set_output_type(this : IMediaObject*, dwOutputStreamIndex : UInt32, pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_type.call(this, dwOutputStreamIndex, pmt, dwFlags)
    end
    def get_input_current_type(this : IMediaObject*, dwInputStreamIndex : UInt32, pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_current_type.call(this, dwInputStreamIndex, pmt)
    end
    def get_output_current_type(this : IMediaObject*, dwOutputStreamIndex : UInt32, pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_current_type.call(this, dwOutputStreamIndex, pmt)
    end
    def get_input_size_info(this : IMediaObject*, dwInputStreamIndex : UInt32, pcbSize : UInt32*, pcbMaxLookahead : UInt32*, pcbAlignment : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_size_info.call(this, dwInputStreamIndex, pcbSize, pcbMaxLookahead, pcbAlignment)
    end
    def get_output_size_info(this : IMediaObject*, dwOutputStreamIndex : UInt32, pcbSize : UInt32*, pcbAlignment : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_size_info.call(this, dwOutputStreamIndex, pcbSize, pcbAlignment)
    end
    def get_input_max_latency(this : IMediaObject*, dwInputStreamIndex : UInt32, prtMaxLatency : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_max_latency.call(this, dwInputStreamIndex, prtMaxLatency)
    end
    def set_input_max_latency(this : IMediaObject*, dwInputStreamIndex : UInt32, rtMaxLatency : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_max_latency.call(this, dwInputStreamIndex, rtMaxLatency)
    end
    def flush(this : IMediaObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end
    def discontinuity(this : IMediaObject*, dwInputStreamIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discontinuity.call(this, dwInputStreamIndex)
    end
    def allocate_streaming_resources(this : IMediaObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_streaming_resources.call(this)
    end
    def free_streaming_resources(this : IMediaObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_streaming_resources.call(this)
    end
    def get_input_status(this : IMediaObject*, dwInputStreamIndex : UInt32, dwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_status.call(this, dwInputStreamIndex, dwFlags)
    end
    def process_input(this : IMediaObject*, dwInputStreamIndex : UInt32, pBuffer : Void*, dwFlags : UInt32, rtTimestamp : Int64, rtTimelength : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_input.call(this, dwInputStreamIndex, pBuffer, dwFlags, rtTimestamp, rtTimelength)
    end
    def process_output(this : IMediaObject*, dwFlags : UInt32, cOutputBufferCount : UInt32, pOutputBuffers : Win32cr::Media::DxMediaObjects::DMO_OUTPUT_DATA_BUFFER*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_output.call(this, dwFlags, cOutputBufferCount, pOutputBuffers, pdwStatus)
    end
    def lock(this : IMediaObject*, bLock : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock.call(this, bLock)
    end

  end

  @[Extern]
  record IEnumDMOVtbl,
    query_interface : Proc(IEnumDMO*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumDMO*, UInt32),
    release : Proc(IEnumDMO*, UInt32),
    next__ : Proc(IEnumDMO*, UInt32, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumDMO*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumDMO*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumDMO*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2c3cd98a-2bfa-4a53-9c27-5249ba64ba0f")]
  record IEnumDMO, lpVtbl : IEnumDMOVtbl* do
    GUID = LibC::GUID.new(0x2c3cd98a_u32, 0x2bfa_u16, 0x4a53_u16, StaticArray[0x9c_u8, 0x27_u8, 0x52_u8, 0x49_u8, 0xba_u8, 0x64_u8, 0xba_u8, 0xf_u8])
    def query_interface(this : IEnumDMO*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumDMO*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumDMO*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumDMO*, cItemsToFetch : UInt32, pCLSID : LibC::GUID*, names : Win32cr::Foundation::PWSTR*, pcItemsFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cItemsToFetch, pCLSID, names, pcItemsFetched)
    end
    def skip(this : IEnumDMO*, cItemsToSkip : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cItemsToSkip)
    end
    def reset(this : IEnumDMO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumDMO*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IMediaObjectInPlaceVtbl,
    query_interface : Proc(IMediaObjectInPlace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMediaObjectInPlace*, UInt32),
    release : Proc(IMediaObjectInPlace*, UInt32),
    process : Proc(IMediaObjectInPlace*, UInt32, UInt8*, Int64, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IMediaObjectInPlace*, Void**, Win32cr::Foundation::HRESULT),
    get_latency : Proc(IMediaObjectInPlace*, Int64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("651b9ad0-0fc7-4aa9-9538-d89931010741")]
  record IMediaObjectInPlace, lpVtbl : IMediaObjectInPlaceVtbl* do
    GUID = LibC::GUID.new(0x651b9ad0_u32, 0xfc7_u16, 0x4aa9_u16, StaticArray[0x95_u8, 0x38_u8, 0xd8_u8, 0x99_u8, 0x31_u8, 0x1_u8, 0x7_u8, 0x41_u8])
    def query_interface(this : IMediaObjectInPlace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMediaObjectInPlace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMediaObjectInPlace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def process(this : IMediaObjectInPlace*, ulSize : UInt32, pData : UInt8*, refTimeStart : Int64, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process.call(this, ulSize, pData, refTimeStart, dwFlags)
    end
    def clone(this : IMediaObjectInPlace*, ppMediaObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppMediaObject)
    end
    def get_latency(this : IMediaObjectInPlace*, pLatencyTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latency.call(this, pLatencyTime)
    end

  end

  @[Extern]
  record IDMOQualityControlVtbl,
    query_interface : Proc(IDMOQualityControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMOQualityControl*, UInt32),
    release : Proc(IDMOQualityControl*, UInt32),
    set_now : Proc(IDMOQualityControl*, Int64, Win32cr::Foundation::HRESULT),
    set_status : Proc(IDMOQualityControl*, UInt32, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDMOQualityControl*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("65abea96-cf36-453f-af8a-705e98f16260")]
  record IDMOQualityControl, lpVtbl : IDMOQualityControlVtbl* do
    GUID = LibC::GUID.new(0x65abea96_u32, 0xcf36_u16, 0x453f_u16, StaticArray[0xaf_u8, 0x8a_u8, 0x70_u8, 0x5e_u8, 0x98_u8, 0xf1_u8, 0x62_u8, 0x60_u8])
    def query_interface(this : IDMOQualityControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMOQualityControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMOQualityControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_now(this : IDMOQualityControl*, rtNow : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_now.call(this, rtNow)
    end
    def set_status(this : IDMOQualityControl*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_status.call(this, dwFlags)
    end
    def get_status(this : IDMOQualityControl*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwFlags)
    end

  end

  @[Extern]
  record IDMOVideoOutputOptimizationsVtbl,
    query_interface : Proc(IDMOVideoOutputOptimizations*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMOVideoOutputOptimizations*, UInt32),
    release : Proc(IDMOVideoOutputOptimizations*, UInt32),
    query_operation_mode_preferences : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_operation_mode : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_current_operation_mode : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_sample_requirements : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("be8f4f4e-5b16-4d29-b350-7f6b5d9298ac")]
  record IDMOVideoOutputOptimizations, lpVtbl : IDMOVideoOutputOptimizationsVtbl* do
    GUID = LibC::GUID.new(0xbe8f4f4e_u32, 0x5b16_u16, 0x4d29_u16, StaticArray[0xb3_u8, 0x50_u8, 0x7f_u8, 0x6b_u8, 0x5d_u8, 0x92_u8, 0x98_u8, 0xac_u8])
    def query_interface(this : IDMOVideoOutputOptimizations*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMOVideoOutputOptimizations*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMOVideoOutputOptimizations*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_operation_mode_preferences(this : IDMOVideoOutputOptimizations*, ulOutputStreamIndex : UInt32, pdwRequestedCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_operation_mode_preferences.call(this, ulOutputStreamIndex, pdwRequestedCapabilities)
    end
    def set_operation_mode(this : IDMOVideoOutputOptimizations*, ulOutputStreamIndex : UInt32, dwEnabledFeatures : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_operation_mode.call(this, ulOutputStreamIndex, dwEnabledFeatures)
    end
    def get_current_operation_mode(this : IDMOVideoOutputOptimizations*, ulOutputStreamIndex : UInt32, pdwEnabledFeatures : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_operation_mode.call(this, ulOutputStreamIndex, pdwEnabledFeatures)
    end
    def get_current_sample_requirements(this : IDMOVideoOutputOptimizations*, ulOutputStreamIndex : UInt32, pdwRequestedFeatures : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_sample_requirements.call(this, ulOutputStreamIndex, pdwRequestedFeatures)
    end

  end

  @[Link("msdmo")]
  lib C
    fun DMORegister(szName : Win32cr::Foundation::PWSTR, clsidDMO : LibC::GUID*, guidCategory : LibC::GUID*, dwFlags : UInt32, cInTypes : UInt32, pInTypes : Win32cr::Media::DxMediaObjects::DMO_PARTIAL_MEDIATYPE*, cOutTypes : UInt32, pOutTypes : Win32cr::Media::DxMediaObjects::DMO_PARTIAL_MEDIATYPE*) : Win32cr::Foundation::HRESULT

    fun DMOUnregister(clsidDMO : LibC::GUID*, guidCategory : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun DMOEnum(guidCategory : LibC::GUID*, dwFlags : UInt32, cInTypes : UInt32, pInTypes : Win32cr::Media::DxMediaObjects::DMO_PARTIAL_MEDIATYPE*, cOutTypes : UInt32, pOutTypes : Win32cr::Media::DxMediaObjects::DMO_PARTIAL_MEDIATYPE*, ppEnum : Void**) : Win32cr::Foundation::HRESULT

    fun DMOGetTypes(clsidDMO : LibC::GUID*, ulInputTypesRequested : UInt32, pulInputTypesSupplied : UInt32*, pInputTypes : Win32cr::Media::DxMediaObjects::DMO_PARTIAL_MEDIATYPE*, ulOutputTypesRequested : UInt32, pulOutputTypesSupplied : UInt32*, pOutputTypes : Win32cr::Media::DxMediaObjects::DMO_PARTIAL_MEDIATYPE*) : Win32cr::Foundation::HRESULT

    fun DMOGetName(clsidDMO : LibC::GUID*, szName : UInt16*) : Win32cr::Foundation::HRESULT

    fun MoInitMediaType(pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, cbFormat : UInt32) : Win32cr::Foundation::HRESULT

    fun MoFreeMediaType(pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT

    fun MoCopyMediaType(pmtDest : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*, pmtSrc : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT

    fun MoCreateMediaType(ppmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE**, cbFormat : UInt32) : Win32cr::Foundation::HRESULT

    fun MoDeleteMediaType(pmt : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT

    fun MoDuplicateMediaType(ppmtDest : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE**, pmtSrc : Win32cr::Media::DxMediaObjects::DMO_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT

  end
end