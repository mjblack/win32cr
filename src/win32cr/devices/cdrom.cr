require "./../foundation.cr"

module Win32cr::Devices::Cdrom
  extend self
  IOCTL_CDROM_BASE = 2_i32
  IOCTL_CDROM_UNLOAD_DRIVER = 151560_u32
  IOCTL_CDROM_READ_TOC = 147456_u32
  IOCTL_CDROM_SEEK_AUDIO_MSF = 147460_u32
  IOCTL_CDROM_STOP_AUDIO = 147464_u32
  IOCTL_CDROM_PAUSE_AUDIO = 147468_u32
  IOCTL_CDROM_RESUME_AUDIO = 147472_u32
  IOCTL_CDROM_GET_VOLUME = 147476_u32
  IOCTL_CDROM_PLAY_AUDIO_MSF = 147480_u32
  IOCTL_CDROM_SET_VOLUME = 147496_u32
  IOCTL_CDROM_READ_Q_CHANNEL = 147500_u32
  IOCTL_CDROM_GET_CONTROL = 147508_u32
  OBSOLETE_IOCTL_CDROM_GET_CONTROL = 147508_u32
  IOCTL_CDROM_GET_LAST_SESSION = 147512_u32
  IOCTL_CDROM_RAW_READ = 147518_u32
  IOCTL_CDROM_DISK_TYPE = 131136_u32
  IOCTL_CDROM_GET_DRIVE_GEOMETRY = 147532_u32
  IOCTL_CDROM_GET_DRIVE_GEOMETRY_EX = 147536_u32
  IOCTL_CDROM_READ_TOC_EX = 147540_u32
  IOCTL_CDROM_GET_CONFIGURATION = 147544_u32
  IOCTL_CDROM_EXCLUSIVE_ACCESS = 180316_u32
  IOCTL_CDROM_SET_SPEED = 147552_u32
  IOCTL_CDROM_GET_INQUIRY_DATA = 147556_u32
  IOCTL_CDROM_ENABLE_STREAMING = 147560_u32
  IOCTL_CDROM_SEND_OPC_INFORMATION = 180332_u32
  IOCTL_CDROM_GET_PERFORMANCE = 147568_u32
  IOCTL_CDROM_CHECK_VERIFY = 149504_u32
  IOCTL_CDROM_MEDIA_REMOVAL = 149508_u32
  IOCTL_CDROM_EJECT_MEDIA = 149512_u32
  IOCTL_CDROM_LOAD_MEDIA = 149516_u32
  IOCTL_CDROM_RESERVE = 149520_u32
  IOCTL_CDROM_RELEASE = 149524_u32
  IOCTL_CDROM_FIND_NEW_DEVICES = 149528_u32
  MINIMUM_CDROM_INQUIRY_SIZE = 36_u32
  MAXIMUM_CDROM_INQUIRY_SIZE = 260_u32
  IOCTL_CDROM_SIMBAD = 147468_u32
  MAXIMUM_NUMBER_TRACKS = 100_u32
  MAXIMUM_CDROM_SIZE = 804_u32
  MINIMUM_CDROM_READ_TOC_EX_SIZE = 2_u32
  CDROM_READ_TOC_EX_FORMAT_TOC = 0_u32
  CDROM_READ_TOC_EX_FORMAT_SESSION = 1_u32
  CDROM_READ_TOC_EX_FORMAT_FULL_TOC = 2_u32
  CDROM_READ_TOC_EX_FORMAT_PMA = 3_u32
  CDROM_READ_TOC_EX_FORMAT_ATIP = 4_u32
  CDROM_READ_TOC_EX_FORMAT_CDTEXT = 5_u32
  CDROM_CD_TEXT_PACK_ALBUM_NAME = 128_u32
  CDROM_CD_TEXT_PACK_PERFORMER = 129_u32
  CDROM_CD_TEXT_PACK_SONGWRITER = 130_u32
  CDROM_CD_TEXT_PACK_COMPOSER = 131_u32
  CDROM_CD_TEXT_PACK_ARRANGER = 132_u32
  CDROM_CD_TEXT_PACK_MESSAGES = 133_u32
  CDROM_CD_TEXT_PACK_DISC_ID = 134_u32
  CDROM_CD_TEXT_PACK_GENRE = 135_u32
  CDROM_CD_TEXT_PACK_TOC_INFO = 136_u32
  CDROM_CD_TEXT_PACK_TOC_INFO2 = 137_u32
  CDROM_CD_TEXT_PACK_UPC_EAN = 142_u32
  CDROM_CD_TEXT_PACK_SIZE_INFO = 143_u32
  CDROM_DISK_AUDIO_TRACK = 1_u32
  CDROM_DISK_DATA_TRACK = 2_u32
  IOCTL_CDROM_SUB_Q_CHANNEL = 0_u32
  IOCTL_CDROM_CURRENT_POSITION = 1_u32
  IOCTL_CDROM_MEDIA_CATALOG = 2_u32
  IOCTL_CDROM_TRACK_ISRC = 3_u32
  AUDIO_STATUS_NOT_SUPPORTED = 0_u32
  AUDIO_STATUS_IN_PROGRESS = 17_u32
  AUDIO_STATUS_PAUSED = 18_u32
  AUDIO_STATUS_PLAY_COMPLETE = 19_u32
  AUDIO_STATUS_PLAY_ERROR = 20_u32
  AUDIO_STATUS_NO_STATUS = 21_u32
  ADR_NO_MODE_INFORMATION = 0_u32
  ADR_ENCODES_CURRENT_POSITION = 1_u32
  ADR_ENCODES_MEDIA_CATALOG = 2_u32
  ADR_ENCODES_ISRC = 3_u32
  AUDIO_WITH_PREEMPHASIS = 1_u32
  DIGITAL_COPY_PERMITTED = 2_u32
  AUDIO_DATA_TRACK = 4_u32
  TWO_FOUR_CHANNEL_AUDIO = 8_u32
  CD_RAW_READ_C2_SIZE = 296_u32
  CD_RAW_READ_SUBCODE_SIZE = 96_u32
  CD_RAW_SECTOR_WITH_C2_SIZE = 2648_u32
  CD_RAW_SECTOR_WITH_SUBCODE_SIZE = 2448_u32
  CDROM_EXCLUSIVE_CALLER_LENGTH = 64_u32
  CDROM_LOCK_IGNORE_VOLUME = 1_u32
  CDROM_NO_MEDIA_NOTIFICATIONS = 2_u32
  CDROM_NOT_IN_EXCLUSIVE_MODE = 0_u32
  CDROM_IN_EXCLUSIVE_MODE = 1_u32

  enum TRACK_MODE_TYPE
    YellowMode2 = 0_i32
    XAForm2 = 1_i32
    CDDA = 2_i32
    RawWithC2AndSubCode = 3_i32
    RawWithC2 = 4_i32
    RawWithSubCode = 5_i32
  end
  enum MEDIA_BLANK_TYPE
    MediaBlankTypeFull = 0_i32
    MediaBlankTypeMinimal = 1_i32
    MediaBlankTypeIncompleteTrack = 2_i32
    MediaBlankTypeUnreserveLastTrack = 3_i32
    MediaBlankTypeTrackTail = 4_i32
    MediaBlankTypeUncloseLastSession = 5_i32
    MediaBlankTypeEraseLastSession = 6_i32
  end
  enum EXCLUSIVE_ACCESS_REQUEST_TYPE
    ExclusiveAccessQueryState = 0_i32
    ExclusiveAccessLockDevice = 1_i32
    ExclusiveAccessUnlockDevice = 2_i32
  end
  enum CDROM_SPEED_REQUEST
    CdromSetSpeed = 0_i32
    CdromSetStreaming = 1_i32
  end
  enum WRITE_ROTATION
    CdromDefaultRotation = 0_i32
    CdromCAVRotation = 1_i32
  end
  enum STREAMING_CONTROL_REQUEST_TYPE
    CdromStreamingDisable = 1_i32
    CdromStreamingEnableForReadOnly = 2_i32
    CdromStreamingEnableForWriteOnly = 3_i32
    CdromStreamingEnableForReadWrite = 4_i32
  end
  enum CDROM_OPC_INFO_TYPE
    SimpleOpcInfo = 1_i32
  end
  enum CDROM_PERFORMANCE_REQUEST_TYPE
    CdromPerformanceRequest = 1_i32
    CdromWriteSpeedRequest = 2_i32
  end
  enum CDROM_PERFORMANCE_TYPE
    CdromReadPerformance = 1_i32
    CdromWritePerformance = 2_i32
  end
  enum CDROM_PERFORMANCE_EXCEPTION_TYPE
    CdromNominalPerformance = 1_i32
    CdromEntirePerformanceList = 2_i32
    CdromPerformanceExceptionsOnly = 3_i32
  end
  enum CDROM_PERFORMANCE_TOLERANCE_TYPE
    Cdrom10Nominal20Exceptions = 1_i32
  end

  @[Extern]
  struct CDROM_READ_TOC_EX
    property _bitfield : UInt8
    property session_track : UInt8
    property reserved2 : UInt8
    property reserved3 : UInt8
    def initialize(@_bitfield : UInt8, @session_track : UInt8, @reserved2 : UInt8, @reserved3 : UInt8)
    end
  end

  @[Extern]
  struct TRACK_DATA
    property reserved : UInt8
    property _bitfield : UInt8
    property track_number : UInt8
    property reserved1 : UInt8
    property address : UInt8[4]
    def initialize(@reserved : UInt8, @_bitfield : UInt8, @track_number : UInt8, @reserved1 : UInt8, @address : UInt8[4])
    end
  end

  @[Extern]
  struct CDROM_TOC
    property length : UInt8[2]
    property first_track : UInt8
    property last_track : UInt8
    property track_data : Win32cr::Devices::Cdrom::TRACK_DATA[100]
    def initialize(@length : UInt8[2], @first_track : UInt8, @last_track : UInt8, @track_data : Win32cr::Devices::Cdrom::TRACK_DATA[100])
    end
  end

  @[Extern]
  struct CDROM_TOC_SESSION_DATA
    property length : UInt8[2]
    property first_complete_session : UInt8
    property last_complete_session : UInt8
    property track_data : Win32cr::Devices::Cdrom::TRACK_DATA[1]
    def initialize(@length : UInt8[2], @first_complete_session : UInt8, @last_complete_session : UInt8, @track_data : Win32cr::Devices::Cdrom::TRACK_DATA[1])
    end
  end

  @[Extern]
  struct CDROM_TOC_FULL_TOC_DATA_BLOCK
    property session_number : UInt8
    property _bitfield : UInt8
    property reserved1 : UInt8
    property point : UInt8
    property msf_extra : UInt8[3]
    property zero : UInt8
    property msf : UInt8[3]
    def initialize(@session_number : UInt8, @_bitfield : UInt8, @reserved1 : UInt8, @point : UInt8, @msf_extra : UInt8[3], @zero : UInt8, @msf : UInt8[3])
    end
  end

  @[Extern]
  struct CDROM_TOC_FULL_TOC_DATA
    property length : UInt8[2]
    property first_complete_session : UInt8
    property last_complete_session : UInt8
    property descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_FULL_TOC_DATA_BLOCK[1]
    def initialize(@length : UInt8[2], @first_complete_session : UInt8, @last_complete_session : UInt8, @descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_FULL_TOC_DATA_BLOCK[1])
    end
  end

  @[Extern]
  struct CDROM_TOC_PMA_DATA
    property length : UInt8[2]
    property reserved1 : UInt8
    property reserved2 : UInt8
    property descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_FULL_TOC_DATA_BLOCK[1]
    def initialize(@length : UInt8[2], @reserved1 : UInt8, @reserved2 : UInt8, @descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_FULL_TOC_DATA_BLOCK[1])
    end
  end

  @[Extern]
  struct CDROM_TOC_ATIP_DATA_BLOCK
    property _bitfield1 : UInt8
    property _bitfield2 : UInt8
    property _bitfield3 : UInt8
    property reserved7 : UInt8
    property lead_in_msf : UInt8[3]
    property reserved8 : UInt8
    property lead_out_msf : UInt8[3]
    property reserved9 : UInt8
    property a1_values : UInt8[3]
    property reserved10 : UInt8
    property a2_values : UInt8[3]
    property reserved11 : UInt8
    property a3_values : UInt8[3]
    property reserved12 : UInt8
    def initialize(@_bitfield1 : UInt8, @_bitfield2 : UInt8, @_bitfield3 : UInt8, @reserved7 : UInt8, @lead_in_msf : UInt8[3], @reserved8 : UInt8, @lead_out_msf : UInt8[3], @reserved9 : UInt8, @a1_values : UInt8[3], @reserved10 : UInt8, @a2_values : UInt8[3], @reserved11 : UInt8, @a3_values : UInt8[3], @reserved12 : UInt8)
    end
  end

  @[Extern]
  struct CDROM_TOC_ATIP_DATA
    property length : UInt8[2]
    property reserved1 : UInt8
    property reserved2 : UInt8
    property descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_ATIP_DATA_BLOCK[1]
    def initialize(@length : UInt8[2], @reserved1 : UInt8, @reserved2 : UInt8, @descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_ATIP_DATA_BLOCK[1])
    end
  end

  @[Extern]
  struct CDROM_TOC_CD_TEXT_DATA_BLOCK
    property pack_type : UInt8
    property _bitfield1 : UInt8
    property sequence_number : UInt8
    property _bitfield2 : UInt8
    property anonymous : Anonymous_e__Union_
    property crc : UInt8[2]

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property text : UInt8[12]
    property w_text : UInt16[6]
    def initialize(@text : UInt8[12], @w_text : UInt16[6])
    end
    end

    def initialize(@pack_type : UInt8, @_bitfield1 : UInt8, @sequence_number : UInt8, @_bitfield2 : UInt8, @anonymous : Anonymous_e__Union_, @crc : UInt8[2])
    end
  end

  @[Extern]
  struct CDROM_TOC_CD_TEXT_DATA
    property length : UInt8[2]
    property reserved1 : UInt8
    property reserved2 : UInt8
    property descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_CD_TEXT_DATA_BLOCK[1]
    def initialize(@length : UInt8[2], @reserved1 : UInt8, @reserved2 : UInt8, @descriptors : Win32cr::Devices::Cdrom::CDROM_TOC_CD_TEXT_DATA_BLOCK[1])
    end
  end

  @[Extern]
  struct CDROM_PLAY_AUDIO_MSF
    property starting_m : UInt8
    property starting_s : UInt8
    property starting_f : UInt8
    property ending_m : UInt8
    property ending_s : UInt8
    property ending_f : UInt8
    def initialize(@starting_m : UInt8, @starting_s : UInt8, @starting_f : UInt8, @ending_m : UInt8, @ending_s : UInt8, @ending_f : UInt8)
    end
  end

  @[Extern]
  struct CDROM_SEEK_AUDIO_MSF
    property m : UInt8
    property s : UInt8
    property f : UInt8
    def initialize(@m : UInt8, @s : UInt8, @f : UInt8)
    end
  end

  @[Extern]
  struct CDROM_DISK_DATA
    property disk_data : UInt32
    def initialize(@disk_data : UInt32)
    end
  end

  @[Extern]
  struct CDROM_SUB_Q_DATA_FORMAT
    property format : UInt8
    property track : UInt8
    def initialize(@format : UInt8, @track : UInt8)
    end
  end

  @[Extern]
  struct SUB_Q_HEADER
    property reserved : UInt8
    property audio_status : UInt8
    property data_length : UInt8[2]
    def initialize(@reserved : UInt8, @audio_status : UInt8, @data_length : UInt8[2])
    end
  end

  @[Extern]
  struct SUB_Q_CURRENT_POSITION
    property header : Win32cr::Devices::Cdrom::SUB_Q_HEADER
    property format_code : UInt8
    property _bitfield : UInt8
    property track_number : UInt8
    property index_number : UInt8
    property absolute_address : UInt8[4]
    property track_relative_address : UInt8[4]
    def initialize(@header : Win32cr::Devices::Cdrom::SUB_Q_HEADER, @format_code : UInt8, @_bitfield : UInt8, @track_number : UInt8, @index_number : UInt8, @absolute_address : UInt8[4], @track_relative_address : UInt8[4])
    end
  end

  @[Extern]
  struct SUB_Q_MEDIA_CATALOG_NUMBER
    property header : Win32cr::Devices::Cdrom::SUB_Q_HEADER
    property format_code : UInt8
    property reserved : UInt8[3]
    property _bitfield : UInt8
    property media_catalog : UInt8[15]
    def initialize(@header : Win32cr::Devices::Cdrom::SUB_Q_HEADER, @format_code : UInt8, @reserved : UInt8[3], @_bitfield : UInt8, @media_catalog : UInt8[15])
    end
  end

  @[Extern]
  struct SUB_Q_TRACK_ISRC
    property header : Win32cr::Devices::Cdrom::SUB_Q_HEADER
    property format_code : UInt8
    property reserved0 : UInt8
    property track : UInt8
    property reserved1 : UInt8
    property _bitfield : UInt8
    property track_isrc : UInt8[15]
    def initialize(@header : Win32cr::Devices::Cdrom::SUB_Q_HEADER, @format_code : UInt8, @reserved0 : UInt8, @track : UInt8, @reserved1 : UInt8, @_bitfield : UInt8, @track_isrc : UInt8[15])
    end
  end

  @[Extern(union: true)]
  struct SUB_Q_CHANNEL_DATA
    property current_position : Win32cr::Devices::Cdrom::SUB_Q_CURRENT_POSITION
    property media_catalog : Win32cr::Devices::Cdrom::SUB_Q_MEDIA_CATALOG_NUMBER
    property track_isrc : Win32cr::Devices::Cdrom::SUB_Q_TRACK_ISRC
    def initialize(@current_position : Win32cr::Devices::Cdrom::SUB_Q_CURRENT_POSITION, @media_catalog : Win32cr::Devices::Cdrom::SUB_Q_MEDIA_CATALOG_NUMBER, @track_isrc : Win32cr::Devices::Cdrom::SUB_Q_TRACK_ISRC)
    end
  end

  @[Extern]
  struct VOLUME_CONTROL
    property port_volume : UInt8[4]
    def initialize(@port_volume : UInt8[4])
    end
  end

  @[Extern]
  struct RAW_READ_INFO
    property disk_offset : Int64
    property sector_count : UInt32
    property track_mode : Win32cr::Devices::Cdrom::TRACK_MODE_TYPE
    def initialize(@disk_offset : Int64, @sector_count : UInt32, @track_mode : Win32cr::Devices::Cdrom::TRACK_MODE_TYPE)
    end
  end

  @[Extern]
  struct CDROM_EXCLUSIVE_ACCESS
    property request_type : Win32cr::Devices::Cdrom::EXCLUSIVE_ACCESS_REQUEST_TYPE
    property flags : UInt32
    def initialize(@request_type : Win32cr::Devices::Cdrom::EXCLUSIVE_ACCESS_REQUEST_TYPE, @flags : UInt32)
    end
  end

  @[Extern]
  struct CDROM_EXCLUSIVE_LOCK
    property access : Win32cr::Devices::Cdrom::CDROM_EXCLUSIVE_ACCESS
    property caller_name : UInt8[64]
    def initialize(@access : Win32cr::Devices::Cdrom::CDROM_EXCLUSIVE_ACCESS, @caller_name : UInt8[64])
    end
  end

  @[Extern]
  struct CDROM_EXCLUSIVE_LOCK_STATE
    property lock_state : Win32cr::Foundation::BOOLEAN
    property caller_name : UInt8[64]
    def initialize(@lock_state : Win32cr::Foundation::BOOLEAN, @caller_name : UInt8[64])
    end
  end

  @[Extern]
  struct CDROM_SET_SPEED
    property request_type : Win32cr::Devices::Cdrom::CDROM_SPEED_REQUEST
    property read_speed : UInt16
    property write_speed : UInt16
    property rotation_control : Win32cr::Devices::Cdrom::WRITE_ROTATION
    def initialize(@request_type : Win32cr::Devices::Cdrom::CDROM_SPEED_REQUEST, @read_speed : UInt16, @write_speed : UInt16, @rotation_control : Win32cr::Devices::Cdrom::WRITE_ROTATION)
    end
  end

  @[Extern]
  struct CDROM_SET_STREAMING
    property request_type : Win32cr::Devices::Cdrom::CDROM_SPEED_REQUEST
    property read_size : UInt32
    property read_time : UInt32
    property write_size : UInt32
    property write_time : UInt32
    property start_lba : UInt32
    property end_lba : UInt32
    property rotation_control : Win32cr::Devices::Cdrom::WRITE_ROTATION
    property restore_defaults : Win32cr::Foundation::BOOLEAN
    property set_exact : Win32cr::Foundation::BOOLEAN
    property random_access : Win32cr::Foundation::BOOLEAN
    property persistent : Win32cr::Foundation::BOOLEAN
    def initialize(@request_type : Win32cr::Devices::Cdrom::CDROM_SPEED_REQUEST, @read_size : UInt32, @read_time : UInt32, @write_size : UInt32, @write_time : UInt32, @start_lba : UInt32, @end_lba : UInt32, @rotation_control : Win32cr::Devices::Cdrom::WRITE_ROTATION, @restore_defaults : Win32cr::Foundation::BOOLEAN, @set_exact : Win32cr::Foundation::BOOLEAN, @random_access : Win32cr::Foundation::BOOLEAN, @persistent : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct CDROM_STREAMING_CONTROL
    property request_type : Win32cr::Devices::Cdrom::STREAMING_CONTROL_REQUEST_TYPE
    def initialize(@request_type : Win32cr::Devices::Cdrom::STREAMING_CONTROL_REQUEST_TYPE)
    end
  end

  @[Extern]
  struct CDROM_SIMPLE_OPC_INFO
    property request_type : Win32cr::Devices::Cdrom::CDROM_OPC_INFO_TYPE
    property exclude0 : Win32cr::Foundation::BOOLEAN
    property exclude1 : Win32cr::Foundation::BOOLEAN
    def initialize(@request_type : Win32cr::Devices::Cdrom::CDROM_OPC_INFO_TYPE, @exclude0 : Win32cr::Foundation::BOOLEAN, @exclude1 : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct CDROM_PERFORMANCE_REQUEST
    property request_type : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_REQUEST_TYPE
    property performance_type : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_TYPE
    property exceptions : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_EXCEPTION_TYPE
    property tolerance : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_TOLERANCE_TYPE
    property staring_lba : UInt32
    def initialize(@request_type : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_REQUEST_TYPE, @performance_type : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_TYPE, @exceptions : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_EXCEPTION_TYPE, @tolerance : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_TOLERANCE_TYPE, @staring_lba : UInt32)
    end
  end

  @[Extern]
  struct CDROM_WRITE_SPEED_REQUEST
    property request_type : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_REQUEST_TYPE
    def initialize(@request_type : Win32cr::Devices::Cdrom::CDROM_PERFORMANCE_REQUEST_TYPE)
    end
  end

  @[Extern]
  struct CDROM_PERFORMANCE_HEADER
    property data_length : UInt8[4]
    property _bitfield : UInt8
    property reserved2 : UInt8[3]
    property data : UInt8[1]
    def initialize(@data_length : UInt8[4], @_bitfield : UInt8, @reserved2 : UInt8[3], @data : UInt8[1])
    end
  end

  @[Extern]
  struct CDROM_NOMINAL_PERFORMANCE_DESCRIPTOR
    property start_lba : UInt8[4]
    property start_performance : UInt8[4]
    property end_lba : UInt8[4]
    property end_performance : UInt8[4]
    def initialize(@start_lba : UInt8[4], @start_performance : UInt8[4], @end_lba : UInt8[4], @end_performance : UInt8[4])
    end
  end

  @[Extern]
  struct CDROM_EXCEPTION_PERFORMANCE_DESCRIPTOR
    property lba : UInt8[4]
    property time : UInt8[2]
    def initialize(@lba : UInt8[4], @time : UInt8[2])
    end
  end

  @[Extern]
  struct CDROM_WRITE_SPEED_DESCRIPTOR
    property _bitfield : UInt8
    property reserved3 : UInt8[3]
    property end_lba : UInt8[4]
    property read_speed : UInt8[4]
    property write_speed : UInt8[4]
    def initialize(@_bitfield : UInt8, @reserved3 : UInt8[3], @end_lba : UInt8[4], @read_speed : UInt8[4], @write_speed : UInt8[4])
    end
  end

end