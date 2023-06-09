require "../system/com.cr"
require "../foundation.cr"
require "../media/mediafoundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  enum MF_TRANSFER_VIDEO_FRAME_FLAGS : Int32
    MF_TRANSFER_VIDEO_FRAME_DEFAULT = 0
    MF_TRANSFER_VIDEO_FRAME_STRETCH = 1
    MF_TRANSFER_VIDEO_FRAME_IGNORE_PAR = 2
  end

  enum MF_MEDIASOURCE_STATUS_INFO : Int32
    MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED = 0
    MF_MEDIASOURCE_STATUS_INFO_UNKNOWN = 1
  end

  struct FaceRectInfoBlobHeader
    size : UInt32
    count : UInt32
  end
  struct FaceRectInfo
    region : RECT
    confidence_level : Int32
  end
  struct FaceCharacterizationBlobHeader
    size : UInt32
    count : UInt32
  end
  struct FaceCharacterization
    blink_score_left : UInt32
    blink_score_right : UInt32
    facial_expression : UInt32
    facial_expression_score : UInt32
  end
  struct CapturedMetadataExposureCompensation
    flags : UInt64
    value : Int32
  end
  struct CapturedMetadataISOGains
    analog_gain : Float32
    digital_gain : Float32
  end
  struct CapturedMetadataWhiteBalanceGains
    r : Float32
    g : Float32
    b : Float32
  end
  struct MetadataTimeStamps
    flags : UInt32
    device : Int64
    presentation : Int64
  end
  struct HistogramGrid
    width : UInt32
    height : UInt32
    region : RECT
  end
  struct HistogramBlobHeader
    size : UInt32
    histograms : UInt32
  end
  struct HistogramHeader
    size : UInt32
    bins : UInt32
    four_cc : UInt32
    channel_masks : UInt32
    grid : HistogramGrid
  end
  struct HistogramDataHeader
    size : UInt32
    channel_mask : UInt32
    linear : UInt32
  end


  struct IMFDeviceTransformVTbl
    query_interface : Proc(IMFDeviceTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMFDeviceTransform*, UInt32)
    release : Proc(IMFDeviceTransform*, UInt32)
    initialize_transform : Proc(IMFDeviceTransform*, IMFAttributes, HRESULT)
    get_input_available_type : Proc(IMFDeviceTransform*, UInt32, UInt32, IMFMediaType*, HRESULT)
    get_input_current_type : Proc(IMFDeviceTransform*, UInt32, IMFMediaType*, HRESULT)
    get_input_stream_attributes : Proc(IMFDeviceTransform*, UInt32, IMFAttributes*, HRESULT)
    get_output_available_type : Proc(IMFDeviceTransform*, UInt32, UInt32, IMFMediaType*, HRESULT)
    get_output_current_type : Proc(IMFDeviceTransform*, UInt32, IMFMediaType*, HRESULT)
    get_output_stream_attributes : Proc(IMFDeviceTransform*, UInt32, IMFAttributes*, HRESULT)
    get_stream_count : Proc(IMFDeviceTransform*, UInt32*, UInt32*, HRESULT)
    get_stream_i_ds : Proc(IMFDeviceTransform*, UInt32, UInt32*, UInt32, UInt32*, HRESULT)
    process_event : Proc(IMFDeviceTransform*, UInt32, IMFMediaEvent, HRESULT)
    process_input : Proc(IMFDeviceTransform*, UInt32, IMFSample, UInt32, HRESULT)
    process_message : Proc(IMFDeviceTransform*, MFT_MESSAGE_TYPE, LibC::UINT_PTR, HRESULT)
    process_output : Proc(IMFDeviceTransform*, UInt32, UInt32, MFT_OUTPUT_DATA_BUFFER*, UInt32*, HRESULT)
    set_input_stream_state : Proc(IMFDeviceTransform*, UInt32, IMFMediaType, DeviceStreamState, UInt32, HRESULT)
    get_input_stream_state : Proc(IMFDeviceTransform*, UInt32, DeviceStreamState*, HRESULT)
    set_output_stream_state : Proc(IMFDeviceTransform*, UInt32, IMFMediaType, DeviceStreamState, UInt32, HRESULT)
    get_output_stream_state : Proc(IMFDeviceTransform*, UInt32, DeviceStreamState*, HRESULT)
    get_input_stream_preferred_state : Proc(IMFDeviceTransform*, UInt32, DeviceStreamState*, IMFMediaType*, HRESULT)
    flush_input_stream : Proc(IMFDeviceTransform*, UInt32, UInt32, HRESULT)
    flush_output_stream : Proc(IMFDeviceTransform*, UInt32, UInt32, HRESULT)
  end

  IMFDeviceTransform_GUID = "d818fbd8-fc46-42f2-87ac-1ea2d1f9bf32"
  IID_IMFDeviceTransform = LibC::GUID.new(0xd818fbd8_u32, 0xfc46_u16, 0x42f2_u16, StaticArray[0x87_u8, 0xac_u8, 0x1e_u8, 0xa2_u8, 0xd1_u8, 0xf9_u8, 0xbf_u8, 0x32_u8])
  struct IMFDeviceTransform
    lpVtbl : IMFDeviceTransformVTbl*
  end

  struct IMFDeviceTransformCallbackVTbl
    query_interface : Proc(IMFDeviceTransformCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMFDeviceTransformCallback*, UInt32)
    release : Proc(IMFDeviceTransformCallback*, UInt32)
    on_buffer_sent : Proc(IMFDeviceTransformCallback*, IMFAttributes, UInt32, HRESULT)
  end

  IMFDeviceTransformCallback_GUID = "6d5cb646-29ec-41fb-8179-8c4c6d750811"
  IID_IMFDeviceTransformCallback = LibC::GUID.new(0x6d5cb646_u32, 0x29ec_u16, 0x41fb_u16, StaticArray[0x81_u8, 0x79_u8, 0x8c_u8, 0x4c_u8, 0x6d_u8, 0x75_u8, 0x8_u8, 0x11_u8])
  struct IMFDeviceTransformCallback
    lpVtbl : IMFDeviceTransformCallbackVTbl*
  end

end
struct LibWin32::IMFDeviceTransform
  def query_interface(this : IMFDeviceTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMFDeviceTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMFDeviceTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize_transform(this : IMFDeviceTransform*, pattributes : IMFAttributes) : HRESULT
    @lpVtbl.value.initialize_transform.call(this, pattributes)
  end
  def get_input_available_type(this : IMFDeviceTransform*, dwinputstreamid : UInt32, dwtypeindex : UInt32, pmediatype : IMFMediaType*) : HRESULT
    @lpVtbl.value.get_input_available_type.call(this, dwinputstreamid, dwtypeindex, pmediatype)
  end
  def get_input_current_type(this : IMFDeviceTransform*, dwinputstreamid : UInt32, pmediatype : IMFMediaType*) : HRESULT
    @lpVtbl.value.get_input_current_type.call(this, dwinputstreamid, pmediatype)
  end
  def get_input_stream_attributes(this : IMFDeviceTransform*, dwinputstreamid : UInt32, ppattributes : IMFAttributes*) : HRESULT
    @lpVtbl.value.get_input_stream_attributes.call(this, dwinputstreamid, ppattributes)
  end
  def get_output_available_type(this : IMFDeviceTransform*, dwoutputstreamid : UInt32, dwtypeindex : UInt32, pmediatype : IMFMediaType*) : HRESULT
    @lpVtbl.value.get_output_available_type.call(this, dwoutputstreamid, dwtypeindex, pmediatype)
  end
  def get_output_current_type(this : IMFDeviceTransform*, dwoutputstreamid : UInt32, pmediatype : IMFMediaType*) : HRESULT
    @lpVtbl.value.get_output_current_type.call(this, dwoutputstreamid, pmediatype)
  end
  def get_output_stream_attributes(this : IMFDeviceTransform*, dwoutputstreamid : UInt32, ppattributes : IMFAttributes*) : HRESULT
    @lpVtbl.value.get_output_stream_attributes.call(this, dwoutputstreamid, ppattributes)
  end
  def get_stream_count(this : IMFDeviceTransform*, pcinputstreams : UInt32*, pcoutputstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.call(this, pcinputstreams, pcoutputstreams)
  end
  def get_stream_i_ds(this : IMFDeviceTransform*, dwinputidarraysize : UInt32, pdwinputstreamids : UInt32*, dwoutputidarraysize : UInt32, pdwoutputstreamids : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_i_ds.call(this, dwinputidarraysize, pdwinputstreamids, dwoutputidarraysize, pdwoutputstreamids)
  end
  def process_event(this : IMFDeviceTransform*, dwinputstreamid : UInt32, pevent : IMFMediaEvent) : HRESULT
    @lpVtbl.value.process_event.call(this, dwinputstreamid, pevent)
  end
  def process_input(this : IMFDeviceTransform*, dwinputstreamid : UInt32, psample : IMFSample, dwflags : UInt32) : HRESULT
    @lpVtbl.value.process_input.call(this, dwinputstreamid, psample, dwflags)
  end
  def process_message(this : IMFDeviceTransform*, emessage : MFT_MESSAGE_TYPE, ulparam : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.process_message.call(this, emessage, ulparam)
  end
  def process_output(this : IMFDeviceTransform*, dwflags : UInt32, coutputbuffercount : UInt32, poutputsample : MFT_OUTPUT_DATA_BUFFER*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.process_output.call(this, dwflags, coutputbuffercount, poutputsample, pdwstatus)
  end
  def set_input_stream_state(this : IMFDeviceTransform*, dwstreamid : UInt32, pmediatype : IMFMediaType, value : DeviceStreamState, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_input_stream_state.call(this, dwstreamid, pmediatype, value, dwflags)
  end
  def get_input_stream_state(this : IMFDeviceTransform*, dwstreamid : UInt32, value : DeviceStreamState*) : HRESULT
    @lpVtbl.value.get_input_stream_state.call(this, dwstreamid, value)
  end
  def set_output_stream_state(this : IMFDeviceTransform*, dwstreamid : UInt32, pmediatype : IMFMediaType, value : DeviceStreamState, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_output_stream_state.call(this, dwstreamid, pmediatype, value, dwflags)
  end
  def get_output_stream_state(this : IMFDeviceTransform*, dwstreamid : UInt32, value : DeviceStreamState*) : HRESULT
    @lpVtbl.value.get_output_stream_state.call(this, dwstreamid, value)
  end
  def get_input_stream_preferred_state(this : IMFDeviceTransform*, dwstreamid : UInt32, value : DeviceStreamState*, ppmediatype : IMFMediaType*) : HRESULT
    @lpVtbl.value.get_input_stream_preferred_state.call(this, dwstreamid, value, ppmediatype)
  end
  def flush_input_stream(this : IMFDeviceTransform*, dwstreamindex : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.flush_input_stream.call(this, dwstreamindex, dwflags)
  end
  def flush_output_stream(this : IMFDeviceTransform*, dwstreamindex : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.flush_output_stream.call(this, dwstreamindex, dwflags)
  end
end
struct LibWin32::IMFDeviceTransformCallback
  def query_interface(this : IMFDeviceTransformCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMFDeviceTransformCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMFDeviceTransformCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_buffer_sent(this : IMFDeviceTransformCallback*, pcallbackattributes : IMFAttributes, pinid : UInt32) : HRESULT
    @lpVtbl.value.on_buffer_sent.call(this, pcallbackattributes, pinid)
  end
end
