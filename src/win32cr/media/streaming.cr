require "./../foundation.cr"

module Win32cr::Media::Streaming
  extend self

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
  struct FaceRectInfoBlobHeader
    property size : UInt32
    property count : UInt32
    def initialize(@size : UInt32, @count : UInt32)
    end
  end

  @[Extern]
  struct FaceRectInfo
    property region : Win32cr::Foundation::RECT
    property confidenceLevel : Int32
    def initialize(@region : Win32cr::Foundation::RECT, @confidenceLevel : Int32)
    end
  end

  @[Extern]
  struct FaceCharacterizationBlobHeader
    property size : UInt32
    property count : UInt32
    def initialize(@size : UInt32, @count : UInt32)
    end
  end

  @[Extern]
  struct FaceCharacterization
    property blink_score_left : UInt32
    property blink_score_right : UInt32
    property facial_expression : UInt32
    property facial_expression_score : UInt32
    def initialize(@blink_score_left : UInt32, @blink_score_right : UInt32, @facial_expression : UInt32, @facial_expression_score : UInt32)
    end
  end

  @[Extern]
  struct CapturedMetadataExposureCompensation
    property flags : UInt64
    property value : Int32
    def initialize(@flags : UInt64, @value : Int32)
    end
  end

  @[Extern]
  struct CapturedMetadataISOGains
    property analog_gain : Float32
    property digital_gain : Float32
    def initialize(@analog_gain : Float32, @digital_gain : Float32)
    end
  end

  @[Extern]
  struct CapturedMetadataWhiteBalanceGains
    property r : Float32
    property g : Float32
    property b : Float32
    def initialize(@r : Float32, @g : Float32, @b : Float32)
    end
  end

  @[Extern]
  struct MetadataTimeStamps
    property flags : UInt32
    property device : Int64
    property presentation : Int64
    def initialize(@flags : UInt32, @device : Int64, @presentation : Int64)
    end
  end

  @[Extern]
  struct HistogramGrid
    property width : UInt32
    property height : UInt32
    property region : Win32cr::Foundation::RECT
    def initialize(@width : UInt32, @height : UInt32, @region : Win32cr::Foundation::RECT)
    end
  end

  @[Extern]
  struct HistogramBlobHeader
    property size : UInt32
    property histograms : UInt32
    def initialize(@size : UInt32, @histograms : UInt32)
    end
  end

  @[Extern]
  struct HistogramHeader
    property size : UInt32
    property bins : UInt32
    property four_cc : UInt32
    property channel_masks : UInt32
    property grid : Win32cr::Media::Streaming::HistogramGrid
    def initialize(@size : UInt32, @bins : UInt32, @four_cc : UInt32, @channel_masks : UInt32, @grid : Win32cr::Media::Streaming::HistogramGrid)
    end
  end

  @[Extern]
  struct HistogramDataHeader
    property size : UInt32
    property channel_mask : UInt32
    property linear : UInt32
    def initialize(@size : UInt32, @channel_mask : UInt32, @linear : UInt32)
    end
  end

end