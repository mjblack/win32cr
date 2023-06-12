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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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

  IMFDeviceTransform_GUID = LibC::GUID.new("d818fbd8-fc46-42f2-87ac-1ea2d1f9bf32")
  CLSID_IMFDeviceTransform = "d818fbd8-fc46-42f2-87ac-1ea2d1f9bf32"
  struct IMFDeviceTransform
    lpVtbl : IMFDeviceTransformVTbl*
  end

  struct IMFDeviceTransformCallbackVTbl
    query_interface : Proc(IMFDeviceTransformCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMFDeviceTransformCallback*, UInt32)
    release : Proc(IMFDeviceTransformCallback*, UInt32)
    on_buffer_sent : Proc(IMFDeviceTransformCallback*, IMFAttributes, UInt32, HRESULT)
  end

  IMFDeviceTransformCallback_GUID = LibC::GUID.new("6d5cb646-29ec-41fb-8179-8c4c6d750811")
  CLSID_IMFDeviceTransformCallback = "6d5cb646-29ec-41fb-8179-8c4c6d750811"
  struct IMFDeviceTransformCallback
    lpVtbl : IMFDeviceTransformCallbackVTbl*
  end

end
