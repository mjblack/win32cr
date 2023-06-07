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
