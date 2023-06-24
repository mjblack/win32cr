require "../foundation.cr"
require "../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:msdmo.dll")]
{% else %}
@[Link("msdmo")]
{% end %}
lib LibWin32
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


  enum DMO_INPUT_DATA_BUFFER_FLAGS : Int32
    DMO_INPUT_DATA_BUFFERF_SYNCPOINT = 1
    DMO_INPUT_DATA_BUFFERF_TIME = 2
    DMO_INPUT_DATA_BUFFERF_TIMELENGTH = 4
    DMO_INPUT_DATA_BUFFERF_DISCONTINUITY = 8
  end

  enum DMO_OUTPUT_DATA_BUFFER_FLAGS : Int32
    DMO_OUTPUT_DATA_BUFFERF_SYNCPOINT = 1
    DMO_OUTPUT_DATA_BUFFERF_TIME = 2
    DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH = 4
    DMO_OUTPUT_DATA_BUFFERF_DISCONTINUITY = 8
    DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE = 16777216
  end

  enum DMO_INPUT_STATUS_FLAGS : Int32
    DMO_INPUT_STATUSF_ACCEPT_DATA = 1
  end

  enum DMO_INPUT_STREAM_INFO_FLAGS : Int32
    DMO_INPUT_STREAMF_WHOLE_SAMPLES = 1
    DMO_INPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 2
    DMO_INPUT_STREAMF_FIXED_SAMPLE_SIZE = 4
    DMO_INPUT_STREAMF_HOLDS_BUFFERS = 8
  end

  enum DMO_OUTPUT_STREAM_INFO_FLAGS : Int32
    DMO_OUTPUT_STREAMF_WHOLE_SAMPLES = 1
    DMO_OUTPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 2
    DMO_OUTPUT_STREAMF_FIXED_SAMPLE_SIZE = 4
    DMO_OUTPUT_STREAMF_DISCARDABLE = 8
    DMO_OUTPUT_STREAMF_OPTIONAL = 16
  end

  enum DMO_SET_TYPE_FLAGS : Int32
    DMO_SET_TYPEF_TEST_ONLY = 1
    DMO_SET_TYPEF_CLEAR = 2
  end

  enum DMO_PROCESS_OUTPUT_FLAGS : Int32
    DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER = 1
  end

  enum DMO_INPLACE_PROCESS_FLAGS : Int32
    DMO_INPLACE_NORMAL = 0
    DMO_INPLACE_ZERO = 1
  end

  enum DMO_QUALITY_STATUS_FLAGS : Int32
    DMO_QUALITY_STATUS_ENABLED = 1
  end

  enum DMO_VIDEO_OUTPUT_STREAM_FLAGS : Int32
    DMO_VOSF_NEEDS_PREVIOUS_SAMPLE = 1
  end

  enum DMO_REGISTER_FLAGS : Int32
    DMO_REGISTERF_IS_KEYED = 1
  end

  enum DMO_ENUM_FLAGS : Int32
    DMO_ENUMF_INCLUDE_KEYED = 1
  end

  struct DMO_MEDIA_TYPE
    majortype : Guid
    subtype : Guid
    b_fixed_size_samples : LibC::BOOL
    b_temporal_compression : LibC::BOOL
    l_sample_size : UInt32
    formattype : Guid
    p_unk : IUnknown
    cb_format : UInt32
    pb_format : UInt8*
  end
  struct DMO_OUTPUT_DATA_BUFFER
    p_buffer : IMediaBuffer
    dw_status : UInt32
    rt_timestamp : Int64
    rt_timelength : Int64
  end
  struct DMO_PARTIAL_MEDIATYPE
    type : Guid
    subtype : Guid
  end


  struct IMediaBufferVTbl
    query_interface : Proc(IMediaBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMediaBuffer*, UInt32)
    release : Proc(IMediaBuffer*, UInt32)
    set_length : Proc(IMediaBuffer*, UInt32, HRESULT)
    get_max_length : Proc(IMediaBuffer*, UInt32*, HRESULT)
    get_buffer_and_length : Proc(IMediaBuffer*, UInt8**, UInt32*, HRESULT)
  end

  IMediaBuffer_GUID = "59eff8b9-938c-4a26-82f2-95cb84cdc837"
  IID_IMediaBuffer = LibC::GUID.new(0x59eff8b9_u32, 0x938c_u16, 0x4a26_u16, StaticArray[0x82_u8, 0xf2_u8, 0x95_u8, 0xcb_u8, 0x84_u8, 0xcd_u8, 0xc8_u8, 0x37_u8])
  struct IMediaBuffer
    lpVtbl : IMediaBufferVTbl*
  end

  struct IMediaObjectVTbl
    query_interface : Proc(IMediaObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMediaObject*, UInt32)
    release : Proc(IMediaObject*, UInt32)
    get_stream_count : Proc(IMediaObject*, UInt32*, UInt32*, HRESULT)
    get_input_stream_info : Proc(IMediaObject*, UInt32, UInt32*, HRESULT)
    get_output_stream_info : Proc(IMediaObject*, UInt32, UInt32*, HRESULT)
    get_input_type : Proc(IMediaObject*, UInt32, UInt32, DMO_MEDIA_TYPE*, HRESULT)
    get_output_type : Proc(IMediaObject*, UInt32, UInt32, DMO_MEDIA_TYPE*, HRESULT)
    set_input_type : Proc(IMediaObject*, UInt32, DMO_MEDIA_TYPE*, UInt32, HRESULT)
    set_output_type : Proc(IMediaObject*, UInt32, DMO_MEDIA_TYPE*, UInt32, HRESULT)
    get_input_current_type : Proc(IMediaObject*, UInt32, DMO_MEDIA_TYPE*, HRESULT)
    get_output_current_type : Proc(IMediaObject*, UInt32, DMO_MEDIA_TYPE*, HRESULT)
    get_input_size_info : Proc(IMediaObject*, UInt32, UInt32*, UInt32*, UInt32*, HRESULT)
    get_output_size_info : Proc(IMediaObject*, UInt32, UInt32*, UInt32*, HRESULT)
    get_input_max_latency : Proc(IMediaObject*, UInt32, Int64*, HRESULT)
    set_input_max_latency : Proc(IMediaObject*, UInt32, Int64, HRESULT)
    flush : Proc(IMediaObject*, HRESULT)
    discontinuity : Proc(IMediaObject*, UInt32, HRESULT)
    allocate_streaming_resources : Proc(IMediaObject*, HRESULT)
    free_streaming_resources : Proc(IMediaObject*, HRESULT)
    get_input_status : Proc(IMediaObject*, UInt32, UInt32*, HRESULT)
    process_input : Proc(IMediaObject*, UInt32, IMediaBuffer, UInt32, Int64, Int64, HRESULT)
    process_output : Proc(IMediaObject*, UInt32, UInt32, DMO_OUTPUT_DATA_BUFFER*, UInt32*, HRESULT)
    lock : Proc(IMediaObject*, Int32, HRESULT)
  end

  IMediaObject_GUID = "d8ad0f58-5494-4102-97c5-ec798e59bcf4"
  IID_IMediaObject = LibC::GUID.new(0xd8ad0f58_u32, 0x5494_u16, 0x4102_u16, StaticArray[0x97_u8, 0xc5_u8, 0xec_u8, 0x79_u8, 0x8e_u8, 0x59_u8, 0xbc_u8, 0xf4_u8])
  struct IMediaObject
    lpVtbl : IMediaObjectVTbl*
  end

  struct IEnumDMOVTbl
    query_interface : Proc(IEnumDMO*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumDMO*, UInt32)
    release : Proc(IEnumDMO*, UInt32)
    next : Proc(IEnumDMO*, UInt32, Guid*, LibC::LPWSTR*, UInt32*, HRESULT)
    skip : Proc(IEnumDMO*, UInt32, HRESULT)
    reset : Proc(IEnumDMO*, HRESULT)
    clone : Proc(IEnumDMO*, IEnumDMO*, HRESULT)
  end

  IEnumDMO_GUID = "2c3cd98a-2bfa-4a53-9c27-5249ba64ba0f"
  IID_IEnumDMO = LibC::GUID.new(0x2c3cd98a_u32, 0x2bfa_u16, 0x4a53_u16, StaticArray[0x9c_u8, 0x27_u8, 0x52_u8, 0x49_u8, 0xba_u8, 0x64_u8, 0xba_u8, 0xf_u8])
  struct IEnumDMO
    lpVtbl : IEnumDMOVTbl*
  end

  struct IMediaObjectInPlaceVTbl
    query_interface : Proc(IMediaObjectInPlace*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMediaObjectInPlace*, UInt32)
    release : Proc(IMediaObjectInPlace*, UInt32)
    process : Proc(IMediaObjectInPlace*, UInt32, UInt8*, Int64, UInt32, HRESULT)
    clone : Proc(IMediaObjectInPlace*, IMediaObjectInPlace*, HRESULT)
    get_latency : Proc(IMediaObjectInPlace*, Int64*, HRESULT)
  end

  IMediaObjectInPlace_GUID = "651b9ad0-0fc7-4aa9-9538-d89931010741"
  IID_IMediaObjectInPlace = LibC::GUID.new(0x651b9ad0_u32, 0xfc7_u16, 0x4aa9_u16, StaticArray[0x95_u8, 0x38_u8, 0xd8_u8, 0x99_u8, 0x31_u8, 0x1_u8, 0x7_u8, 0x41_u8])
  struct IMediaObjectInPlace
    lpVtbl : IMediaObjectInPlaceVTbl*
  end

  struct IDMOQualityControlVTbl
    query_interface : Proc(IDMOQualityControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDMOQualityControl*, UInt32)
    release : Proc(IDMOQualityControl*, UInt32)
    set_now : Proc(IDMOQualityControl*, Int64, HRESULT)
    set_status : Proc(IDMOQualityControl*, UInt32, HRESULT)
    get_status : Proc(IDMOQualityControl*, UInt32*, HRESULT)
  end

  IDMOQualityControl_GUID = "65abea96-cf36-453f-af8a-705e98f16260"
  IID_IDMOQualityControl = LibC::GUID.new(0x65abea96_u32, 0xcf36_u16, 0x453f_u16, StaticArray[0xaf_u8, 0x8a_u8, 0x70_u8, 0x5e_u8, 0x98_u8, 0xf1_u8, 0x62_u8, 0x60_u8])
  struct IDMOQualityControl
    lpVtbl : IDMOQualityControlVTbl*
  end

  struct IDMOVideoOutputOptimizationsVTbl
    query_interface : Proc(IDMOVideoOutputOptimizations*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDMOVideoOutputOptimizations*, UInt32)
    release : Proc(IDMOVideoOutputOptimizations*, UInt32)
    query_operation_mode_preferences : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32*, HRESULT)
    set_operation_mode : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32, HRESULT)
    get_current_operation_mode : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32*, HRESULT)
    get_current_sample_requirements : Proc(IDMOVideoOutputOptimizations*, UInt32, UInt32*, HRESULT)
  end

  IDMOVideoOutputOptimizations_GUID = "be8f4f4e-5b16-4d29-b350-7f6b5d9298ac"
  IID_IDMOVideoOutputOptimizations = LibC::GUID.new(0xbe8f4f4e_u32, 0x5b16_u16, 0x4d29_u16, StaticArray[0xb3_u8, 0x50_u8, 0x7f_u8, 0x6b_u8, 0x5d_u8, 0x92_u8, 0x98_u8, 0xac_u8])
  struct IDMOVideoOutputOptimizations
    lpVtbl : IDMOVideoOutputOptimizationsVTbl*
  end


  # Params # szname : LibC::LPWSTR [In],clsiddmo : Guid* [In],guidcategory : Guid* [In],dwflags : UInt32 [In],cintypes : UInt32 [In],pintypes : DMO_PARTIAL_MEDIATYPE* [In],couttypes : UInt32 [In],pouttypes : DMO_PARTIAL_MEDIATYPE* [In]
  fun DMORegister(szname : LibC::LPWSTR, clsiddmo : Guid*, guidcategory : Guid*, dwflags : UInt32, cintypes : UInt32, pintypes : DMO_PARTIAL_MEDIATYPE*, couttypes : UInt32, pouttypes : DMO_PARTIAL_MEDIATYPE*) : HRESULT

  # Params # clsiddmo : Guid* [In],guidcategory : Guid* [In]
  fun DMOUnregister(clsiddmo : Guid*, guidcategory : Guid*) : HRESULT

  # Params # guidcategory : Guid* [In],dwflags : UInt32 [In],cintypes : UInt32 [In],pintypes : DMO_PARTIAL_MEDIATYPE* [In],couttypes : UInt32 [In],pouttypes : DMO_PARTIAL_MEDIATYPE* [In],ppenum : IEnumDMO* [In]
  fun DMOEnum(guidcategory : Guid*, dwflags : UInt32, cintypes : UInt32, pintypes : DMO_PARTIAL_MEDIATYPE*, couttypes : UInt32, pouttypes : DMO_PARTIAL_MEDIATYPE*, ppenum : IEnumDMO*) : HRESULT

  # Params # clsiddmo : Guid* [In],ulinputtypesrequested : UInt32 [In],pulinputtypessupplied : UInt32* [In],pinputtypes : DMO_PARTIAL_MEDIATYPE* [In],uloutputtypesrequested : UInt32 [In],puloutputtypessupplied : UInt32* [In],poutputtypes : DMO_PARTIAL_MEDIATYPE* [In]
  fun DMOGetTypes(clsiddmo : Guid*, ulinputtypesrequested : UInt32, pulinputtypessupplied : UInt32*, pinputtypes : DMO_PARTIAL_MEDIATYPE*, uloutputtypesrequested : UInt32, puloutputtypessupplied : UInt32*, poutputtypes : DMO_PARTIAL_MEDIATYPE*) : HRESULT

  # Params # clsiddmo : Guid* [In],szname : Char* [In]
  fun DMOGetName(clsiddmo : Guid*, szname : Char*) : HRESULT

  # Params # pmt : DMO_MEDIA_TYPE* [In],cbformat : UInt32 [In]
  fun MoInitMediaType(pmt : DMO_MEDIA_TYPE*, cbformat : UInt32) : HRESULT

  # Params # pmt : DMO_MEDIA_TYPE* [In]
  fun MoFreeMediaType(pmt : DMO_MEDIA_TYPE*) : HRESULT

  # Params # pmtdest : DMO_MEDIA_TYPE* [In],pmtsrc : DMO_MEDIA_TYPE* [In]
  fun MoCopyMediaType(pmtdest : DMO_MEDIA_TYPE*, pmtsrc : DMO_MEDIA_TYPE*) : HRESULT

  # Params # ppmt : DMO_MEDIA_TYPE** [In],cbformat : UInt32 [In]
  fun MoCreateMediaType(ppmt : DMO_MEDIA_TYPE**, cbformat : UInt32) : HRESULT

  # Params # pmt : DMO_MEDIA_TYPE* [In]
  fun MoDeleteMediaType(pmt : DMO_MEDIA_TYPE*) : HRESULT

  # Params # ppmtdest : DMO_MEDIA_TYPE** [In],pmtsrc : DMO_MEDIA_TYPE* [In]
  fun MoDuplicateMediaType(ppmtdest : DMO_MEDIA_TYPE**, pmtsrc : DMO_MEDIA_TYPE*) : HRESULT
end
struct LibWin32::IMediaBuffer
  def query_interface(this : IMediaBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMediaBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMediaBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_length(this : IMediaBuffer*, cblength : UInt32) : HRESULT
    @lpVtbl.value.set_length.call(this, cblength)
  end
  def get_max_length(this : IMediaBuffer*, pcbmaxlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.call(this, pcbmaxlength)
  end
  def get_buffer_and_length(this : IMediaBuffer*, ppbuffer : UInt8**, pcblength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.call(this, ppbuffer, pcblength)
  end
end
struct LibWin32::IMediaObject
  def query_interface(this : IMediaObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMediaObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMediaObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_stream_count(this : IMediaObject*, pcinputstreams : UInt32*, pcoutputstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.call(this, pcinputstreams, pcoutputstreams)
  end
  def get_input_stream_info(this : IMediaObject*, dwinputstreamindex : UInt32, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_input_stream_info.call(this, dwinputstreamindex, pdwflags)
  end
  def get_output_stream_info(this : IMediaObject*, dwoutputstreamindex : UInt32, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_output_stream_info.call(this, dwoutputstreamindex, pdwflags)
  end
  def get_input_type(this : IMediaObject*, dwinputstreamindex : UInt32, dwtypeindex : UInt32, pmt : DMO_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.get_input_type.call(this, dwinputstreamindex, dwtypeindex, pmt)
  end
  def get_output_type(this : IMediaObject*, dwoutputstreamindex : UInt32, dwtypeindex : UInt32, pmt : DMO_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.get_output_type.call(this, dwoutputstreamindex, dwtypeindex, pmt)
  end
  def set_input_type(this : IMediaObject*, dwinputstreamindex : UInt32, pmt : DMO_MEDIA_TYPE*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_input_type.call(this, dwinputstreamindex, pmt, dwflags)
  end
  def set_output_type(this : IMediaObject*, dwoutputstreamindex : UInt32, pmt : DMO_MEDIA_TYPE*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_output_type.call(this, dwoutputstreamindex, pmt, dwflags)
  end
  def get_input_current_type(this : IMediaObject*, dwinputstreamindex : UInt32, pmt : DMO_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.get_input_current_type.call(this, dwinputstreamindex, pmt)
  end
  def get_output_current_type(this : IMediaObject*, dwoutputstreamindex : UInt32, pmt : DMO_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.get_output_current_type.call(this, dwoutputstreamindex, pmt)
  end
  def get_input_size_info(this : IMediaObject*, dwinputstreamindex : UInt32, pcbsize : UInt32*, pcbmaxlookahead : UInt32*, pcbalignment : UInt32*) : HRESULT
    @lpVtbl.value.get_input_size_info.call(this, dwinputstreamindex, pcbsize, pcbmaxlookahead, pcbalignment)
  end
  def get_output_size_info(this : IMediaObject*, dwoutputstreamindex : UInt32, pcbsize : UInt32*, pcbalignment : UInt32*) : HRESULT
    @lpVtbl.value.get_output_size_info.call(this, dwoutputstreamindex, pcbsize, pcbalignment)
  end
  def get_input_max_latency(this : IMediaObject*, dwinputstreamindex : UInt32, prtmaxlatency : Int64*) : HRESULT
    @lpVtbl.value.get_input_max_latency.call(this, dwinputstreamindex, prtmaxlatency)
  end
  def set_input_max_latency(this : IMediaObject*, dwinputstreamindex : UInt32, rtmaxlatency : Int64) : HRESULT
    @lpVtbl.value.set_input_max_latency.call(this, dwinputstreamindex, rtmaxlatency)
  end
  def flush(this : IMediaObject*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
  def discontinuity(this : IMediaObject*, dwinputstreamindex : UInt32) : HRESULT
    @lpVtbl.value.discontinuity.call(this, dwinputstreamindex)
  end
  def allocate_streaming_resources(this : IMediaObject*) : HRESULT
    @lpVtbl.value.allocate_streaming_resources.call(this)
  end
  def free_streaming_resources(this : IMediaObject*) : HRESULT
    @lpVtbl.value.free_streaming_resources.call(this)
  end
  def get_input_status(this : IMediaObject*, dwinputstreamindex : UInt32, dwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_input_status.call(this, dwinputstreamindex, dwflags)
  end
  def process_input(this : IMediaObject*, dwinputstreamindex : UInt32, pbuffer : IMediaBuffer, dwflags : UInt32, rttimestamp : Int64, rttimelength : Int64) : HRESULT
    @lpVtbl.value.process_input.call(this, dwinputstreamindex, pbuffer, dwflags, rttimestamp, rttimelength)
  end
  def process_output(this : IMediaObject*, dwflags : UInt32, coutputbuffercount : UInt32, poutputbuffers : DMO_OUTPUT_DATA_BUFFER*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.process_output.call(this, dwflags, coutputbuffercount, poutputbuffers, pdwstatus)
  end
  def lock(this : IMediaObject*, block : Int32) : HRESULT
    @lpVtbl.value.lock.call(this, block)
  end
end
struct LibWin32::IEnumDMO
  def query_interface(this : IEnumDMO*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumDMO*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumDMO*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumDMO*, citemstofetch : UInt32, pclsid : Guid*, names : LibC::LPWSTR*, pcitemsfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, citemstofetch, pclsid, names, pcitemsfetched)
  end
  def skip(this : IEnumDMO*, citemstoskip : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, citemstoskip)
  end
  def reset(this : IEnumDMO*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumDMO*, ppenum : IEnumDMO*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IMediaObjectInPlace
  def query_interface(this : IMediaObjectInPlace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMediaObjectInPlace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMediaObjectInPlace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def process(this : IMediaObjectInPlace*, ulsize : UInt32, pdata : UInt8*, reftimestart : Int64, dwflags : UInt32) : HRESULT
    @lpVtbl.value.process.call(this, ulsize, pdata, reftimestart, dwflags)
  end
  def clone(this : IMediaObjectInPlace*, ppmediaobject : IMediaObjectInPlace*) : HRESULT
    @lpVtbl.value.clone.call(this, ppmediaobject)
  end
  def get_latency(this : IMediaObjectInPlace*, platencytime : Int64*) : HRESULT
    @lpVtbl.value.get_latency.call(this, platencytime)
  end
end
struct LibWin32::IDMOQualityControl
  def query_interface(this : IDMOQualityControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDMOQualityControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDMOQualityControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_now(this : IDMOQualityControl*, rtnow : Int64) : HRESULT
    @lpVtbl.value.set_now.call(this, rtnow)
  end
  def set_status(this : IDMOQualityControl*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_status.call(this, dwflags)
  end
  def get_status(this : IDMOQualityControl*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwflags)
  end
end
struct LibWin32::IDMOVideoOutputOptimizations
  def query_interface(this : IDMOVideoOutputOptimizations*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDMOVideoOutputOptimizations*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDMOVideoOutputOptimizations*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_operation_mode_preferences(this : IDMOVideoOutputOptimizations*, uloutputstreamindex : UInt32, pdwrequestedcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.query_operation_mode_preferences.call(this, uloutputstreamindex, pdwrequestedcapabilities)
  end
  def set_operation_mode(this : IDMOVideoOutputOptimizations*, uloutputstreamindex : UInt32, dwenabledfeatures : UInt32) : HRESULT
    @lpVtbl.value.set_operation_mode.call(this, uloutputstreamindex, dwenabledfeatures)
  end
  def get_current_operation_mode(this : IDMOVideoOutputOptimizations*, uloutputstreamindex : UInt32, pdwenabledfeatures : UInt32*) : HRESULT
    @lpVtbl.value.get_current_operation_mode.call(this, uloutputstreamindex, pdwenabledfeatures)
  end
  def get_current_sample_requirements(this : IDMOVideoOutputOptimizations*, uloutputstreamindex : UInt32, pdwrequestedfeatures : UInt32*) : HRESULT
    @lpVtbl.value.get_current_sample_requirements.call(this, uloutputstreamindex, pdwrequestedfeatures)
  end
end
