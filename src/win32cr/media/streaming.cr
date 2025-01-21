require "./../foundation.cr"

module Win32cr::Media::Streaming

  enum MF_TRANSFER_VIDEO_FRAME_FLAGS
    MF_TRANSFER_VIDEO_FRAME_DEFAULT = 0_i32
    MF_TRANSFER_VIDEO_FRAME_STRETCH = 1_i32
    MF_TRANSFER_VIDEO_FRAME_IGNORE_PAR = 2_i32
  end
  enum MF_MEDIASOURCE_STATUS_INFO
    MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED = 0_i32
    MF_MEDIASOURCE_STATUS_INFO_UNKNOWN = 1_i32
  end

  @[Extern]
  record FaceRectInfoBlobHeader,
    size : UInt32,
    count : UInt32

  @[Extern]
  record FaceRectInfo,
    region : Win32cr::Foundation::RECT,
    confidenceLevel : Int32

  @[Extern]
  record FaceCharacterizationBlobHeader,
    size : UInt32,
    count : UInt32

  @[Extern]
  record FaceCharacterization,
    blink_score_left : UInt32,
    blink_score_right : UInt32,
    facial_expression : UInt32,
    facial_expression_score : UInt32

  @[Extern]
  record CapturedMetadataExposureCompensation,
    flags : UInt64,
    value : Int32

  @[Extern]
  record CapturedMetadataISOGains,
    analog_gain : Float32,
    digital_gain : Float32

  @[Extern]
  record CapturedMetadataWhiteBalanceGains,
    r : Float32,
    g : Float32,
    b : Float32

  @[Extern]
  record MetadataTimeStamps,
    flags : UInt32,
    device : Int64,
    presentation : Int64

  @[Extern]
  record HistogramGrid,
    width : UInt32,
    height : UInt32,
    region : Win32cr::Foundation::RECT

  @[Extern]
  record HistogramBlobHeader,
    size : UInt32,
    histograms : UInt32

  @[Extern]
  record HistogramHeader,
    size : UInt32,
    bins : UInt32,
    four_cc : UInt32,
    channel_masks : UInt32,
    grid : Win32cr::Media::Streaming::HistogramGrid

  @[Extern]
  record HistogramDataHeader,
    size : UInt32,
    channel_mask : UInt32,
    linear : UInt32

end