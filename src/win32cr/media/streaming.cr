require "./../foundation.cr"

module Win32cr::Media::Streaming
  extend self
  DEVPKEY_Device_PacketWakeSupported = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 0_u32)
  DEVPKEY_Device_SendPacketWakeSupported = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 1_u32)
  DEVPKEY_Device_UDN = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 6_u32)
  DEVPKEY_Device_SupportsAudio = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 8_u32)
  DEVPKEY_Device_SupportsVideo = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 9_u32)
  DEVPKEY_Device_SupportsImages = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 10_u32)
  DEVPKEY_Device_SinkProtocolInfo = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 14_u32)
  DEVPKEY_Device_DLNADOC = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 15_u32)
  DEVPKEY_Device_DLNACAP = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 16_u32)
  DEVPKEY_Device_SupportsSearch = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 17_u32)
  DEVPKEY_Device_SupportsMute = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 18_u32)
  DEVPKEY_Device_MaxVolume = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 19_u32)
  DEVPKEY_Device_SupportsSetNextAVT = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x88ad39db_u32, 0xd0c_u16, 0x4a38_u16, StaticArray[0x84_u8, 0x35_u8, 0x40_u8, 0x43_u8, 0x82_u8, 0x6b_u8, 0x5c_u8, 0x91_u8]), 20_u32)
  GUID_DEVINTERFACE_DMR = LibC::GUID.new(0xd0875fb4_u32, 0x2196_u16, 0x4c7a_u16, StaticArray[0xa6_u8, 0x3d_u8, 0xe4_u8, 0x16_u8, 0xad_u8, 0xdd_u8, 0x60_u8, 0xa1_u8])
  GUID_DEVINTERFACE_DMP = LibC::GUID.new(0x25b4e268_u32, 0x2a05_u16, 0x496e_u16, StaticArray[0x80_u8, 0x3b_u8, 0x26_u8, 0x68_u8, 0x37_u8, 0xfb_u8, 0xda_u8, 0x4b_u8])
  GUID_DEVINTERFACE_DMS = LibC::GUID.new(0xc96037ae_u32, 0xa558_u16, 0x4470_u16, StaticArray[0xb4_u8, 0x32_u8, 0x11_u8, 0x5a_u8, 0x31_u8, 0xb8_u8, 0x55_u8, 0x53_u8])

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