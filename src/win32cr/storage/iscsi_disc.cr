require "./../foundation.cr"
require "./../system/ioctl.cr"

module Win32cr::Storage::IscsiDisc
  alias PDUMP_DEVICE_POWERON_ROUTINE = Proc(Void*, Int32)*

  IOCTL_SCSI_BASE = 4_u32
  ScsiRawInterfaceGuid = "53f56309-b6bf-11d0-94f2-00a0c91efb8b"
  WmiScsiAddressGuid = "53f5630f-b6bf-11d0-94f2-00a0c91efb8b"
  FILE_DEVICE_SCSI = 27_u32
  DD_SCSI_DEVICE_NAME = "\\Device\\ScsiPort"
  IOCTL_SCSI_PASS_THROUGH = 315396_u32
  IOCTL_SCSI_MINIPORT = 315400_u32
  IOCTL_SCSI_GET_INQUIRY_DATA = 266252_u32
  IOCTL_SCSI_GET_CAPABILITIES = 266256_u32
  IOCTL_SCSI_PASS_THROUGH_DIRECT = 315412_u32
  IOCTL_SCSI_GET_ADDRESS = 266264_u32
  IOCTL_SCSI_RESCAN_BUS = 266268_u32
  IOCTL_SCSI_GET_DUMP_POINTERS = 266272_u32
  IOCTL_SCSI_FREE_DUMP_POINTERS = 266276_u32
  IOCTL_IDE_PASS_THROUGH = 315432_u32
  IOCTL_ATA_PASS_THROUGH = 315436_u32
  IOCTL_ATA_PASS_THROUGH_DIRECT = 315440_u32
  IOCTL_ATA_MINIPORT = 315444_u32
  IOCTL_MINIPORT_PROCESS_SERVICE_IRP = 315448_u32
  IOCTL_MPIO_PASS_THROUGH_PATH = 315452_u32
  IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT = 315456_u32
  IOCTL_SCSI_PASS_THROUGH_EX = 315460_u32
  IOCTL_SCSI_PASS_THROUGH_DIRECT_EX = 315464_u32
  IOCTL_MPIO_PASS_THROUGH_PATH_EX = 315468_u32
  IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT_EX = 315472_u32
  ATA_FLAGS_DRDY_REQUIRED = 1_u32
  ATA_FLAGS_DATA_IN = 2_u32
  ATA_FLAGS_DATA_OUT = 4_u32
  ATA_FLAGS_48BIT_COMMAND = 8_u32
  ATA_FLAGS_USE_DMA = 16_u32
  ATA_FLAGS_NO_MULTIPLE = 32_u32
  IOCTL_MINIPORT_SIGNATURE_SCSIDISK = "SCSIDISK"
  IOCTL_MINIPORT_SIGNATURE_HYBRDISK = "HYBRDISK"
  IOCTL_MINIPORT_SIGNATURE_DSM_NOTIFICATION = "MPDSM   "
  IOCTL_MINIPORT_SIGNATURE_DSM_GENERAL = "MPDSMGEN"
  IOCTL_MINIPORT_SIGNATURE_FIRMWARE = "FIRMWARE"
  IOCTL_MINIPORT_SIGNATURE_QUERY_PROTOCOL = "PROTOCOL"
  IOCTL_MINIPORT_SIGNATURE_SET_PROTOCOL = "SETPROTO"
  IOCTL_MINIPORT_SIGNATURE_QUERY_TEMPERATURE = "TEMPERAT"
  IOCTL_MINIPORT_SIGNATURE_SET_TEMPERATURE_THRESHOLD = "SETTEMPT"
  IOCTL_MINIPORT_SIGNATURE_QUERY_PHYSICAL_TOPOLOGY = "TOPOLOGY"
  IOCTL_MINIPORT_SIGNATURE_ENDURANCE_INFO = "ENDURINF"
  NRB_FUNCTION_NVCACHE_INFO = 236_u32
  NRB_FUNCTION_SPINDLE_STATUS = 229_u32
  NRB_FUNCTION_NVCACHE_POWER_MODE_SET = 0_u32
  NRB_FUNCTION_NVCACHE_POWER_MODE_RETURN = 1_u32
  NRB_FUNCTION_FLUSH_NVCACHE = 20_u32
  NRB_FUNCTION_QUERY_PINNED_SET = 18_u32
  NRB_FUNCTION_QUERY_CACHE_MISS = 19_u32
  NRB_FUNCTION_ADD_LBAS_PINNED_SET = 16_u32
  NRB_FUNCTION_REMOVE_LBAS_PINNED_SET = 17_u32
  NRB_FUNCTION_QUERY_ASCENDER_STATUS = 208_u32
  NRB_FUNCTION_QUERY_HYBRID_DISK_STATUS = 209_u32
  NRB_FUNCTION_PASS_HINT_PAYLOAD = 224_u32
  NRB_FUNCTION_NVSEPARATED_INFO = 192_u32
  NRB_FUNCTION_NVSEPARATED_FLUSH = 193_u32
  NRB_FUNCTION_NVSEPARATED_WB_DISABLE = 194_u32
  NRB_FUNCTION_NVSEPARATED_WB_REVERT_DEFAULT = 195_u32
  NRB_SUCCESS = 0_u32
  NRB_ILLEGAL_REQUEST = 1_u32
  NRB_INVALID_PARAMETER = 2_u32
  NRB_INPUT_DATA_OVERRUN = 3_u32
  NRB_INPUT_DATA_UNDERRUN = 4_u32
  NRB_OUTPUT_DATA_OVERRUN = 5_u32
  NRB_OUTPUT_DATA_UNDERRUN = 6_u32
  NV_SEP_CACHE_PARAMETER_VERSION_1 = 1_u32
  NV_SEP_CACHE_PARAMETER_VERSION = 1_u32
  STORAGE_DIAGNOSTIC_STATUS_SUCCESS = 0_u32
  STORAGE_DIAGNOSTIC_STATUS_BUFFER_TOO_SMALL = 1_u32
  STORAGE_DIAGNOSTIC_STATUS_UNSUPPORTED_VERSION = 2_u32
  STORAGE_DIAGNOSTIC_STATUS_INVALID_PARAMETER = 3_u32
  STORAGE_DIAGNOSTIC_STATUS_INVALID_SIGNATURE = 4_u32
  STORAGE_DIAGNOSTIC_STATUS_INVALID_TARGET_TYPE = 5_u32
  STORAGE_DIAGNOSTIC_STATUS_MORE_DATA = 6_u32
  MINIPORT_DSM_NOTIFICATION_VERSION_1 = 1_u32
  MINIPORT_DSM_NOTIFICATION_VERSION = 1_u32
  MINIPORT_DSM_PROFILE_UNKNOWN = 0_u32
  MINIPORT_DSM_PROFILE_PAGE_FILE = 1_u32
  MINIPORT_DSM_PROFILE_HIBERNATION_FILE = 2_u32
  MINIPORT_DSM_PROFILE_CRASHDUMP_FILE = 3_u32
  MINIPORT_DSM_NOTIFY_FLAG_BEGIN = 1_u32
  MINIPORT_DSM_NOTIFY_FLAG_END = 2_u32
  HYBRID_FUNCTION_GET_INFO = 1_u32
  HYBRID_FUNCTION_DISABLE_CACHING_MEDIUM = 16_u32
  HYBRID_FUNCTION_ENABLE_CACHING_MEDIUM = 17_u32
  HYBRID_FUNCTION_SET_DIRTY_THRESHOLD = 18_u32
  HYBRID_FUNCTION_DEMOTE_BY_SIZE = 19_u32
  HYBRID_STATUS_SUCCESS = 0_u32
  HYBRID_STATUS_ILLEGAL_REQUEST = 1_u32
  HYBRID_STATUS_INVALID_PARAMETER = 2_u32
  HYBRID_STATUS_OUTPUT_BUFFER_TOO_SMALL = 3_u32
  HYBRID_STATUS_ENABLE_REFCOUNT_HOLD = 16_u32
  HYBRID_REQUEST_BLOCK_STRUCTURE_VERSION = 1_u32
  HYBRID_REQUEST_INFO_STRUCTURE_VERSION = 1_u32
  FIRMWARE_FUNCTION_GET_INFO = 1_u32
  FIRMWARE_FUNCTION_DOWNLOAD = 2_u32
  FIRMWARE_FUNCTION_ACTIVATE = 3_u32
  FIRMWARE_STATUS_SUCCESS = 0_u32
  FIRMWARE_STATUS_ERROR = 1_u32
  FIRMWARE_STATUS_ILLEGAL_REQUEST = 2_u32
  FIRMWARE_STATUS_INVALID_PARAMETER = 3_u32
  FIRMWARE_STATUS_INPUT_BUFFER_TOO_BIG = 4_u32
  FIRMWARE_STATUS_OUTPUT_BUFFER_TOO_SMALL = 5_u32
  FIRMWARE_STATUS_INVALID_SLOT = 6_u32
  FIRMWARE_STATUS_INVALID_IMAGE = 7_u32
  FIRMWARE_STATUS_CONTROLLER_ERROR = 16_u32
  FIRMWARE_STATUS_POWER_CYCLE_REQUIRED = 32_u32
  FIRMWARE_STATUS_DEVICE_ERROR = 64_u32
  FIRMWARE_STATUS_INTERFACE_CRC_ERROR = 128_u32
  FIRMWARE_STATUS_UNCORRECTABLE_DATA_ERROR = 129_u32
  FIRMWARE_STATUS_MEDIA_CHANGE = 130_u32
  FIRMWARE_STATUS_ID_NOT_FOUND = 131_u32
  FIRMWARE_STATUS_MEDIA_CHANGE_REQUEST = 132_u32
  FIRMWARE_STATUS_COMMAND_ABORT = 133_u32
  FIRMWARE_STATUS_END_OF_MEDIA = 134_u32
  FIRMWARE_STATUS_ILLEGAL_LENGTH = 135_u32
  FIRMWARE_REQUEST_BLOCK_STRUCTURE_VERSION = 1_u32
  FIRMWARE_REQUEST_FLAG_CONTROLLER = 1_u32
  FIRMWARE_REQUEST_FLAG_LAST_SEGMENT = 2_u32
  FIRMWARE_REQUEST_FLAG_FIRST_SEGMENT = 4_u32
  FIRMWARE_REQUEST_FLAG_SWITCH_TO_EXISTING_FIRMWARE = 2147483648_u32
  STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION = 1_u32
  STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION_V2 = 2_u32
  STORAGE_FIRMWARE_INFO_INVALID_SLOT = 255_u32
  STORAGE_FIRMWARE_SLOT_INFO_V2_REVISION_LENGTH = 16_u32
  STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION = 1_u32
  STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION_V2 = 2_u32
  STORAGE_FIRMWARE_ACTIVATE_STRUCTURE_VERSION = 1_u32
  DUMP_POINTERS_VERSION_1 = 1_u32
  DUMP_POINTERS_VERSION_2 = 2_u32
  DUMP_POINTERS_VERSION_3 = 3_u32
  DUMP_POINTERS_VERSION_4 = 4_u32
  DUMP_DRIVER_NAME_LENGTH = 15_u32
  DUMP_EX_FLAG_SUPPORT_64BITMEMORY = 1_u32
  DUMP_EX_FLAG_SUPPORT_DD_TELEMETRY = 2_u32
  DUMP_EX_FLAG_RESUME_SUPPORT = 4_u32
  DUMP_EX_FLAG_DRIVER_FULL_PATH_SUPPORT = 8_u32
  SCSI_IOCTL_DATA_OUT = 0_u32
  SCSI_IOCTL_DATA_IN = 1_u32
  SCSI_IOCTL_DATA_UNSPECIFIED = 2_u32
  SCSI_IOCTL_DATA_BIDIRECTIONAL = 3_u32
  MPIO_IOCTL_FLAG_USE_PATHID = 1_u32
  MPIO_IOCTL_FLAG_USE_SCSIADDRESS = 2_u32
  MPIO_IOCTL_FLAG_INVOLVE_DSM = 4_u32
  MAX_ISCSI_HBANAME_LEN = 256_u32
  MAX_ISCSI_NAME_LEN = 223_u32
  MAX_ISCSI_ALIAS_LEN = 255_u32
  MAX_ISCSI_PORTAL_NAME_LEN = 256_u32
  MAX_ISCSI_PORTAL_ALIAS_LEN = 256_u32
  MAX_ISCSI_TEXT_ADDRESS_LEN = 256_u32
  MAX_ISCSI_PORTAL_ADDRESS_LEN = 256_u32
  MAX_ISCSI_DISCOVERY_DOMAIN_LEN = 256_u32
  MAX_RADIUS_ADDRESS_LEN = 41_u32
  ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED = "0x00000040"
  ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED = "0x00000020"
  ISCSI_SECURITY_FLAG_PFS_ENABLED = "0x00000010"
  ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED = "0x00000008"
  ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED = "0x00000004"
  ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED = "0x00000002"
  ISCSI_SECURITY_FLAG_VALID = "0x00000001"
  ISCSI_LOGIN_OPTIONS_HEADER_DIGEST = "0x00000001"
  ISCSI_LOGIN_OPTIONS_DATA_DIGEST = "0x00000002"
  ISCSI_LOGIN_OPTIONS_MAXIMUM_CONNECTIONS = "0x00000004"
  ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_WAIT = "0x00000008"
  ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_RETAIN = "0x00000010"
  ISCSI_LOGIN_OPTIONS_USERNAME = "0x00000020"
  ISCSI_LOGIN_OPTIONS_PASSWORD = "0x00000040"
  ISCSI_LOGIN_OPTIONS_AUTH_TYPE = "0x00000080"
  ID_IPV4_ADDR = "1"
  ID_FQDN = "2"
  ID_USER_FQDN = "3"
  ID_IPV6_ADDR = "5"
  ISCSI_LOGIN_FLAG_REQUIRE_IPSEC = 1_u32
  ISCSI_LOGIN_FLAG_MULTIPATH_ENABLED = 2_u32
  ISCSI_LOGIN_FLAG_RESERVED1 = 4_u32
  ISCSI_LOGIN_FLAG_ALLOW_PORTAL_HOPPING = 8_u32
  ISCSI_LOGIN_FLAG_USE_RADIUS_RESPONSE = 16_u32
  ISCSI_LOGIN_FLAG_USE_RADIUS_VERIFICATION = 32_u32
  ISCSI_LOGIN_OPTIONS_VERSION = 0_u32
  ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET = 2_u32
  ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION = 4_u32

  enum NV_SEP_WRITE_CACHE_TYPE
    NVSEPWriteCacheTypeUnknown = 0_i32
    NVSEPWriteCacheTypeNone = 1_i32
    NVSEPWriteCacheTypeWriteBack = 2_i32
    NVSEPWriteCacheTypeWriteThrough = 3_i32
  end
  enum MP_STORAGE_DIAGNOSTIC_LEVEL
    MpStorageDiagnosticLevelDefault = 0_i32
    MpStorageDiagnosticLevelMax = 1_i32
  end
  enum MP_STORAGE_DIAGNOSTIC_TARGET_TYPE
    MpStorageDiagnosticTargetTypeUndefined = 0_i32
    MpStorageDiagnosticTargetTypeMiniport = 2_i32
    MpStorageDiagnosticTargetTypeHbaFirmware = 3_i32
    MpStorageDiagnosticTargetTypeMax = 4_i32
  end
  enum NVCACHE_TYPE
    NvCacheTypeUnknown = 0_i32
    NvCacheTypeNone = 1_i32
    NvCacheTypeWriteBack = 2_i32
    NvCacheTypeWriteThrough = 3_i32
  end
  enum NVCACHE_STATUS
    NvCacheStatusUnknown = 0_i32
    NvCacheStatusDisabling = 1_i32
    NvCacheStatusDisabled = 2_i32
    NvCacheStatusEnabled = 3_i32
  end
  enum ISCSI_DIGEST_TYPES
    ISCSI_DIGEST_TYPE_NONE = 0_i32
    ISCSI_DIGEST_TYPE_CRC32C = 1_i32
  end
  enum ISCSI_AUTH_TYPES
    ISCSI_NO_AUTH_TYPE = 0_i32
    ISCSI_CHAP_AUTH_TYPE = 1_i32
    ISCSI_MUTUAL_CHAP_AUTH_TYPE = 2_i32
  end
  enum IKE_AUTHENTICATION_METHOD
    IKE_AUTHENTICATION_PRESHARED_KEY_METHOD = 1_i32
  end
  enum TARGETPROTOCOLTYPE
    ISCSI_TCP_PROTOCOL_TYPE = 0_i32
  end
  enum TARGET_INFORMATION_CLASS
    ProtocolType = 0_i32
    TargetAlias = 1_i32
    DiscoveryMechanisms = 2_i32
    PortalGroups = 3_i32
    PersistentTargetMappings = 4_i32
    InitiatorName = 5_i32
    TargetFlags = 6_i32
    LoginOptions = 7_i32
  end

  @[Extern]
  record ADAPTER_OBJECT
  @[Extern]
  record SCSI_PASS_THROUGH,
    length : UInt16,
    scsi_status : UInt8,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    cdb_length : UInt8,
    sense_info_length : UInt8,
    data_in : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    data_buffer_offset : LibC::UIntPtrT,
    sense_info_offset : UInt32,
    cdb : UInt8[16]

  @[Extern]
  record SCSI_PASS_THROUGH_DIRECT,
    length : UInt16,
    scsi_status : UInt8,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    cdb_length : UInt8,
    sense_info_length : UInt8,
    data_in : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    data_buffer : Void*,
    sense_info_offset : UInt32,
    cdb : UInt8[16]

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record SCSI_PASS_THROUGH32,
    length : UInt16,
    scsi_status : UInt8,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    cdb_length : UInt8,
    sense_info_length : UInt8,
    data_in : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    data_buffer_offset : UInt32,
    sense_info_offset : UInt32,
    cdb : UInt8[16]
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record SCSI_PASS_THROUGH_DIRECT32,
    length : UInt16,
    scsi_status : UInt8,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    cdb_length : UInt8,
    sense_info_length : UInt8,
    data_in : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    data_buffer : Void*,
    sense_info_offset : UInt32,
    cdb : UInt8[16]
  {% end %}

  @[Extern]
  record SCSI_PASS_THROUGH_EX,
    version : UInt32,
    length : UInt32,
    cdb_length : UInt32,
    stor_address_length : UInt32,
    scsi_status : UInt8,
    sense_info_length : UInt8,
    data_direction : UInt8,
    reserved : UInt8,
    time_out_value : UInt32,
    stor_address_offset : UInt32,
    sense_info_offset : UInt32,
    data_out_transfer_length : UInt32,
    data_in_transfer_length : UInt32,
    data_out_buffer_offset : LibC::UIntPtrT,
    data_in_buffer_offset : LibC::UIntPtrT,
    cdb : UInt8*

  @[Extern]
  record SCSI_PASS_THROUGH_DIRECT_EX,
    version : UInt32,
    length : UInt32,
    cdb_length : UInt32,
    stor_address_length : UInt32,
    scsi_status : UInt8,
    sense_info_length : UInt8,
    data_direction : UInt8,
    reserved : UInt8,
    time_out_value : UInt32,
    stor_address_offset : UInt32,
    sense_info_offset : UInt32,
    data_out_transfer_length : UInt32,
    data_in_transfer_length : UInt32,
    data_out_buffer : Void*,
    data_in_buffer : Void*,
    cdb : UInt8*

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record SCSI_PASS_THROUGH32_EX,
    version : UInt32,
    length : UInt32,
    cdb_length : UInt32,
    stor_address_length : UInt32,
    scsi_status : UInt8,
    sense_info_length : UInt8,
    data_direction : UInt8,
    reserved : UInt8,
    time_out_value : UInt32,
    stor_address_offset : UInt32,
    sense_info_offset : UInt32,
    data_out_transfer_length : UInt32,
    data_in_transfer_length : UInt32,
    data_out_buffer_offset : UInt32,
    data_in_buffer_offset : UInt32,
    cdb : UInt8*
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record SCSI_PASS_THROUGH_DIRECT32_EX,
    version : UInt32,
    length : UInt32,
    cdb_length : UInt32,
    stor_address_length : UInt32,
    scsi_status : UInt8,
    sense_info_length : UInt8,
    data_direction : UInt8,
    reserved : UInt8,
    time_out_value : UInt32,
    stor_address_offset : UInt32,
    sense_info_offset : UInt32,
    data_out_transfer_length : UInt32,
    data_in_transfer_length : UInt32,
    data_out_buffer : Void*,
    data_in_buffer : Void*,
    cdb : UInt8*
  {% end %}

  @[Extern]
  record ATA_PASS_THROUGH_EX,
    length : UInt16,
    ata_flags : UInt16,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    reserved_as_uchar : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    reserved_as_ulong : UInt32,
    data_buffer_offset : LibC::UIntPtrT,
    previous_task_file : UInt8[8],
    current_task_file : UInt8[8]

  @[Extern]
  record ATA_PASS_THROUGH_DIRECT,
    length : UInt16,
    ata_flags : UInt16,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    reserved_as_uchar : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    reserved_as_ulong : UInt32,
    data_buffer : Void*,
    previous_task_file : UInt8[8],
    current_task_file : UInt8[8]

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record ATA_PASS_THROUGH_EX32,
    length : UInt16,
    ata_flags : UInt16,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    reserved_as_uchar : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    reserved_as_ulong : UInt32,
    data_buffer_offset : UInt32,
    previous_task_file : UInt8[8],
    current_task_file : UInt8[8]
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record ATA_PASS_THROUGH_DIRECT32,
    length : UInt16,
    ata_flags : UInt16,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    reserved_as_uchar : UInt8,
    data_transfer_length : UInt32,
    time_out_value : UInt32,
    reserved_as_ulong : UInt32,
    data_buffer : Void*,
    previous_task_file : UInt8[8],
    current_task_file : UInt8[8]
  {% end %}

  @[Extern]
  record IDE_IO_CONTROL,
    header_length : UInt32,
    signature : UInt8[8],
    timeout : UInt32,
    control_code : UInt32,
    return_status : UInt32,
    data_length : UInt32

  @[Extern]
  record MPIO_PASS_THROUGH_PATH,
    pass_through : Win32cr::Storage::IscsiDisc::SCSI_PASS_THROUGH,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64

  @[Extern]
  record MPIO_PASS_THROUGH_PATH_DIRECT,
    pass_through : Win32cr::Storage::IscsiDisc::SCSI_PASS_THROUGH_DIRECT,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64

  @[Extern]
  record MPIO_PASS_THROUGH_PATH_EX,
    pass_through_offset : UInt32,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64

  @[Extern]
  record MPIO_PASS_THROUGH_PATH_DIRECT_EX,
    pass_through_offset : UInt32,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record MPIO_PASS_THROUGH_PATH32,
    pass_through : Win32cr::Storage::IscsiDisc::SCSI_PASS_THROUGH32,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record MPIO_PASS_THROUGH_PATH_DIRECT32,
    pass_through : Win32cr::Storage::IscsiDisc::SCSI_PASS_THROUGH_DIRECT32,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record MPIO_PASS_THROUGH_PATH32_EX,
    pass_through_offset : UInt32,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record MPIO_PASS_THROUGH_PATH_DIRECT32_EX,
    pass_through_offset : UInt32,
    version : UInt32,
    length : UInt16,
    flags : UInt8,
    port_number : UInt8,
    mpio_path_id : UInt64
  {% end %}

  @[Extern]
  record SCSI_BUS_DATA,
    number_of_logical_units : UInt8,
    initiator_bus_id : UInt8,
    inquiry_data_offset : UInt32

  @[Extern]
  record SCSI_ADAPTER_BUS_INFO,
    number_of_buses : UInt8,
    bus_data : Win32cr::Storage::IscsiDisc::SCSI_BUS_DATA*

  @[Extern]
  record SCSI_INQUIRY_DATA,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8,
    device_claimed : Win32cr::Foundation::BOOLEAN,
    inquiry_data_length : UInt32,
    next_inquiry_data_offset : UInt32,
    inquiry_data : UInt8*

  @[Extern]
  record SRB_IO_CONTROL,
    header_length : UInt32,
    signature : UInt8[8],
    timeout : UInt32,
    control_code : UInt32,
    return_code : UInt32,
    length : UInt32

  @[Extern]
  record NVCACHE_REQUEST_BLOCK,
    nrb_size : UInt32,
    function : UInt16,
    nrb_flags : UInt32,
    nrb_status : UInt32,
    count : UInt32,
    lba : UInt64,
    data_buf_size : UInt32,
    nv_cache_status : UInt32,
    nv_cache_sub_status : UInt32

  @[Extern]
  record NV_FEATURE_PARAMETER,
    nv_power_mode_enabled : UInt16,
    nv_parameter_reserv1 : UInt16,
    nv_cmd_enabled : UInt16,
    nv_parameter_reserv2 : UInt16,
    nv_power_mode_ver : UInt16,
    nv_cmd_ver : UInt16,
    nv_size : UInt32,
    nv_read_speed : UInt16,
    nv_wrt_speed : UInt16,
    device_spin_up_time : UInt32

  @[Extern]
  record NVCACHE_HINT_PAYLOAD,
    command : UInt8,
    feature7_0 : UInt8,
    feature15_8 : UInt8,
    count15_8 : UInt8,
    lba7_0 : UInt8,
    lba15_8 : UInt8,
    lba23_16 : UInt8,
    lba31_24 : UInt8,
    lba39_32 : UInt8,
    lba47_40 : UInt8,
    auxiliary7_0 : UInt8,
    auxiliary23_16 : UInt8,
    reserved : UInt8[4]

  @[Extern]
  record NV_SEP_CACHE_PARAMETER,
    version : UInt32,
    size : UInt32,
    flags : Flags_e__Union,
    write_cache_type : UInt8,
    write_cache_type_effective : UInt8,
    parameter_reserve1 : UInt8[3] do

    # Nested Type Flags_e__Union
    @[Extern(union: true)]
    record Flags_e__Union,
      cache_flags : CacheFlags_e__Struct,
      cache_flags_set : UInt8 do

      # Nested Type CacheFlags_e__Struct
      @[Extern]
      record CacheFlags_e__Struct,
        _bitfield : UInt8

    end

  end

  @[Extern]
  record STORAGE_DIAGNOSTIC_MP_REQUEST,
    version : UInt32,
    size : UInt32,
    target_type : Win32cr::Storage::IscsiDisc::MP_STORAGE_DIAGNOSTIC_TARGET_TYPE,
    level : Win32cr::Storage::IscsiDisc::MP_STORAGE_DIAGNOSTIC_LEVEL,
    provider_id : LibC::GUID,
    buffer_size : UInt32,
    reserved : UInt32,
    data_buffer : UInt8*

  @[Extern]
  record MP_DEVICE_DATA_SET_RANGE,
    starting_offset : Int64,
    length_in_bytes : UInt64

  @[Extern]
  record DSM_NOTIFICATION_REQUEST_BLOCK,
    size : UInt32,
    version : UInt32,
    notify_flags : UInt32,
    data_set_profile : UInt32,
    reserved : UInt32[3],
    data_set_ranges_count : UInt32,
    data_set_ranges : Win32cr::Storage::IscsiDisc::MP_DEVICE_DATA_SET_RANGE*

  @[Extern]
  record HYBRID_REQUEST_BLOCK,
    version : UInt32,
    size : UInt32,
    function : UInt32,
    flags : UInt32,
    data_buffer_offset : UInt32,
    data_buffer_length : UInt32

  @[Extern]
  record NVCACHE_PRIORITY_LEVEL_DESCRIPTOR,
    priority_level : UInt8,
    reserved0 : UInt8[3],
    consumed_nvm_size_fraction : UInt32,
    consumed_mapping_resources_fraction : UInt32,
    consumed_nvm_size_for_dirty_data_fraction : UInt32,
    consumed_mapping_resources_for_dirty_data_fraction : UInt32,
    reserved1 : UInt32

  @[Extern]
  record HYBRID_INFORMATION,
    version : UInt32,
    size : UInt32,
    hybrid_supported : Win32cr::Foundation::BOOLEAN,
    status : Win32cr::Storage::IscsiDisc::NVCACHE_STATUS,
    cache_type_effective : Win32cr::Storage::IscsiDisc::NVCACHE_TYPE,
    cache_type_default : Win32cr::Storage::IscsiDisc::NVCACHE_TYPE,
    fraction_base : UInt32,
    cache_size : UInt64,
    attributes : Attributes_e__Struct,
    priorities : Priorities_e__Struct do

    # Nested Type Priorities_e__Struct
    @[Extern]
    record Priorities_e__Struct,
      priority_level_count : UInt8,
      max_priority_behavior : Win32cr::Foundation::BOOLEAN,
      optimal_write_granularity : UInt8,
      reserved : UInt8,
      dirty_threshold_low : UInt32,
      dirty_threshold_high : UInt32,
      supported_commands : SupportedCommands_e__Struct,
      priority : Win32cr::Storage::IscsiDisc::NVCACHE_PRIORITY_LEVEL_DESCRIPTOR* do

      # Nested Type SupportedCommands_e__Struct
      @[Extern]
      record SupportedCommands_e__Struct,
        _bitfield : UInt32,
        max_evict_commands : UInt32,
        max_lba_range_count_for_evict : UInt32,
        max_lba_range_count_for_change_lba : UInt32

    end


    # Nested Type Attributes_e__Struct
    @[Extern]
    record Attributes_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record HYBRID_DIRTY_THRESHOLDS,
    version : UInt32,
    size : UInt32,
    dirty_low_threshold : UInt32,
    dirty_high_threshold : UInt32

  @[Extern]
  record HYBRID_DEMOTE_BY_SIZE,
    version : UInt32,
    size : UInt32,
    source_priority : UInt8,
    target_priority : UInt8,
    reserved0 : UInt16,
    reserved1 : UInt32,
    lba_count : UInt64

  @[Extern]
  record FIRMWARE_REQUEST_BLOCK,
    version : UInt32,
    size : UInt32,
    function : UInt32,
    flags : UInt32,
    data_buffer_offset : UInt32,
    data_buffer_length : UInt32

  @[Extern]
  record STORAGE_FIRMWARE_SLOT_INFO,
    slot_number : UInt8,
    read_only : Win32cr::Foundation::BOOLEAN,
    reserved : UInt8[6],
    revision : Revision_e__Union do

    # Nested Type Revision_e__Union
    @[Extern(union: true)]
    record Revision_e__Union,
      info : UInt8[8],
      as_ulonglong : UInt64

  end

  @[Extern]
  record STORAGE_FIRMWARE_SLOT_INFO_V2,
    slot_number : UInt8,
    read_only : Win32cr::Foundation::BOOLEAN,
    reserved : UInt8[6],
    revision : UInt8[16]

  @[Extern]
  record STORAGE_FIRMWARE_INFO,
    version : UInt32,
    size : UInt32,
    upgrade_support : Win32cr::Foundation::BOOLEAN,
    slot_count : UInt8,
    active_slot : UInt8,
    pending_activate_slot : UInt8,
    reserved : UInt32,
    slot : Win32cr::Storage::IscsiDisc::STORAGE_FIRMWARE_SLOT_INFO*

  @[Extern]
  record STORAGE_FIRMWARE_INFO_V2,
    version : UInt32,
    size : UInt32,
    upgrade_support : Win32cr::Foundation::BOOLEAN,
    slot_count : UInt8,
    active_slot : UInt8,
    pending_activate_slot : UInt8,
    firmware_shared : Win32cr::Foundation::BOOLEAN,
    reserved : UInt8[3],
    image_payload_alignment : UInt32,
    image_payload_max_size : UInt32,
    slot : Win32cr::Storage::IscsiDisc::STORAGE_FIRMWARE_SLOT_INFO_V2*

  @[Extern]
  record STORAGE_FIRMWARE_DOWNLOAD,
    version : UInt32,
    size : UInt32,
    offset : UInt64,
    buffer_size : UInt64,
    image_buffer : UInt8*

  @[Extern]
  record STORAGE_FIRMWARE_DOWNLOAD_V2,
    version : UInt32,
    size : UInt32,
    offset : UInt64,
    buffer_size : UInt64,
    slot : UInt8,
    reserved : UInt8[3],
    image_size : UInt32,
    image_buffer : UInt8*

  @[Extern]
  record STORAGE_FIRMWARE_ACTIVATE,
    version : UInt32,
    size : UInt32,
    slot_to_activate : UInt8,
    reserved0 : UInt8[3]

  @[Extern]
  record IO_SCSI_CAPABILITIES,
    length : UInt32,
    maximum_transfer_length : UInt32,
    maximum_physical_pages : UInt32,
    supported_asynchronous_events : UInt32,
    alignment_mask : UInt32,
    tagged_queuing : Win32cr::Foundation::BOOLEAN,
    adapter_scans_down : Win32cr::Foundation::BOOLEAN,
    adapter_uses_pio : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record SCSI_ADDRESS,
    length : UInt32,
    port_number : UInt8,
    path_id : UInt8,
    target_id : UInt8,
    lun : UInt8

  @[Extern]
  record DUMP_POINTERS_VERSION,
    version : UInt32,
    size : UInt32

  @[Extern]
  record DUMP_POINTERS,
    adapter_object : Win32cr::Storage::IscsiDisc::ADAPTER_OBJECT*,
    mapped_register_base : Void*,
    dump_data : Void*,
    common_buffer_va : Void*,
    common_buffer_pa : Win32cr::Foundation::LARGE_INTEGER,
    common_buffer_size : UInt32,
    allocate_common_buffers : Win32cr::Foundation::BOOLEAN,
    use_disk_dump : Win32cr::Foundation::BOOLEAN,
    spare1 : UInt8[2],
    device_object : Void*

  @[Extern]
  record DUMP_POINTERS_EX,
    header : Win32cr::Storage::IscsiDisc::DUMP_POINTERS_VERSION,
    dump_data : Void*,
    common_buffer_va : Void*,
    common_buffer_size : UInt32,
    allocate_common_buffers : Win32cr::Foundation::BOOLEAN,
    device_object : Void*,
    driver_list : Void*,
    dwPortFlags : UInt32,
    max_device_dump_section_size : UInt32,
    max_device_dump_level : UInt32,
    max_transfer_size : UInt32,
    adapter_object : Void*,
    mapped_register_base : Void*,
    device_ready : Win32cr::Foundation::BOOLEAN*,
    dump_device_power_on : Win32cr::Storage::IscsiDisc::PDUMP_DEVICE_POWERON_ROUTINE,
    dump_device_power_on_context : Void*

  @[Extern]
  record DUMP_DRIVER,
    dump_driver_list : Void*,
    driver_name : UInt16[15],
    base_name : UInt16[15]

  @[Extern]
  record NTSCSI_UNICODE_STRING,
    length : UInt16,
    maximum_length : UInt16,
    buffer : Win32cr::Foundation::PWSTR

  @[Extern]
  record DUMP_DRIVER_EX,
    dump_driver_list : Void*,
    driver_name : UInt16[15],
    base_name : UInt16[15],
    driver_full_path : Win32cr::Storage::IscsiDisc::NTSCSI_UNICODE_STRING

  @[Extern]
  record STORAGE_ENDURANCE_INFO,
    valid_fields : UInt32,
    group_id : UInt32,
    flags : Flags_e__Struct,
    life_percentage : UInt32,
    bytes_read_count : UInt8[16],
    byte_write_count : UInt8[16] do

    # Nested Type Flags_e__Struct
    @[Extern]
    record Flags_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record STORAGE_ENDURANCE_DATA_DESCRIPTOR,
    version : UInt32,
    size : UInt32,
    endurance_info : Win32cr::Storage::IscsiDisc::STORAGE_ENDURANCE_INFO

  @[Extern]
  record ISCSI_LOGIN_OPTIONS,
    version : UInt32,
    information_specified : UInt32,
    login_flags : UInt32,
    auth_type : Win32cr::Storage::IscsiDisc::ISCSI_AUTH_TYPES,
    header_digest : Win32cr::Storage::IscsiDisc::ISCSI_DIGEST_TYPES,
    data_digest : Win32cr::Storage::IscsiDisc::ISCSI_DIGEST_TYPES,
    maximum_connections : UInt32,
    default_time2_wait : UInt32,
    default_time2_retain : UInt32,
    username_length : UInt32,
    password_length : UInt32,
    username : UInt8*,
    password : UInt8*

  @[Extern]
  record IKE_AUTHENTICATION_PRESHARED_KEY,
    security_flags : UInt64,
    id_type : UInt8,
    id_length_in_bytes : UInt32,
    id : UInt8*,
    key_length_in_bytes : UInt32,
    key : UInt8*

  @[Extern]
  record IKE_AUTHENTICATION_INFORMATION,
    auth_method : Win32cr::Storage::IscsiDisc::IKE_AUTHENTICATION_METHOD,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      ps_key : Win32cr::Storage::IscsiDisc::IKE_AUTHENTICATION_PRESHARED_KEY

  end

  @[Extern]
  record ISCSI_UNIQUE_SESSION_ID,
    adapter_unique : UInt64,
    adapter_specific : UInt64

  @[Extern]
  record SCSI_LUN_LIST,
    oslun : UInt32,
    target_lun : UInt64

  @[Extern]
  record ISCSI_TARGET_MAPPINGW,
    initiator_name : UInt16[256],
    target_name : UInt16[224],
    os_device_name : UInt16[260],
    session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    os_bus_number : UInt32,
    os_target_number : UInt32,
    lun_count : UInt32,
    lun_list : Win32cr::Storage::IscsiDisc::SCSI_LUN_LIST*

  @[Extern]
  record ISCSI_TARGET_MAPPINGA,
    initiator_name : Win32cr::Foundation::CHAR[256],
    target_name : Win32cr::Foundation::CHAR[224],
    os_device_name : Win32cr::Foundation::CHAR[260],
    session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    os_bus_number : UInt32,
    os_target_number : UInt32,
    lun_count : UInt32,
    lun_list : Win32cr::Storage::IscsiDisc::SCSI_LUN_LIST*

  @[Extern]
  record ISCSI_TARGET_PORTALW,
    symbolic_name : UInt16[256],
    address : UInt16[256],
    socket : UInt16

  @[Extern]
  record ISCSI_TARGET_PORTALA,
    symbolic_name : Win32cr::Foundation::CHAR[256],
    address : Win32cr::Foundation::CHAR[256],
    socket : UInt16

  @[Extern]
  record ISCSI_TARGET_PORTAL_INFOW,
    initiator_name : UInt16[256],
    initiator_port_number : UInt32,
    symbolic_name : UInt16[256],
    address : UInt16[256],
    socket : UInt16

  @[Extern]
  record ISCSI_TARGET_PORTAL_INFOA,
    initiator_name : Win32cr::Foundation::CHAR[256],
    initiator_port_number : UInt32,
    symbolic_name : Win32cr::Foundation::CHAR[256],
    address : Win32cr::Foundation::CHAR[256],
    socket : UInt16

  @[Extern]
  record ISCSI_TARGET_PORTAL_INFO_EXW,
    initiator_name : UInt16[256],
    initiator_port_number : UInt32,
    symbolic_name : UInt16[256],
    address : UInt16[256],
    socket : UInt16,
    security_flags : UInt64,
    login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS

  @[Extern]
  record ISCSI_TARGET_PORTAL_INFO_EXA,
    initiator_name : Win32cr::Foundation::CHAR[256],
    initiator_port_number : UInt32,
    symbolic_name : Win32cr::Foundation::CHAR[256],
    address : Win32cr::Foundation::CHAR[256],
    socket : UInt16,
    security_flags : UInt64,
    login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS

  @[Extern]
  record ISCSI_TARGET_PORTAL_GROUPW,
    count : UInt32,
    portals : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*

  @[Extern]
  record ISCSI_TARGET_PORTAL_GROUPA,
    count : UInt32,
    portals : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*

  @[Extern]
  record ISCSI_CONNECTION_INFOW,
    connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    initiator_address : Win32cr::Foundation::PWSTR,
    target_address : Win32cr::Foundation::PWSTR,
    initiator_socket : UInt16,
    target_socket : UInt16,
    cid : UInt8[2]

  @[Extern]
  record ISCSI_SESSION_INFOW,
    session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    initiator_name : Win32cr::Foundation::PWSTR,
    target_node_name : Win32cr::Foundation::PWSTR,
    target_name : Win32cr::Foundation::PWSTR,
    isid : UInt8[6],
    tsid : UInt8[2],
    connection_count : UInt32,
    connections : Win32cr::Storage::IscsiDisc::ISCSI_CONNECTION_INFOW*

  @[Extern]
  record ISCSI_CONNECTION_INFOA,
    connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    initiator_address : Win32cr::Foundation::PSTR,
    target_address : Win32cr::Foundation::PSTR,
    initiator_socket : UInt16,
    target_socket : UInt16,
    cid : UInt8[2]

  @[Extern]
  record ISCSI_SESSION_INFOA,
    session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    initiator_name : Win32cr::Foundation::PSTR,
    target_node_name : Win32cr::Foundation::PSTR,
    target_name : Win32cr::Foundation::PSTR,
    isid : UInt8[6],
    tsid : UInt8[2],
    connection_count : UInt32,
    connections : Win32cr::Storage::IscsiDisc::ISCSI_CONNECTION_INFOA*

  @[Extern]
  record ISCSI_CONNECTION_INFO_EX,
    connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    state : UInt8,
    protocol : UInt8,
    header_digest : UInt8,
    data_digest : UInt8,
    max_recv_data_segment_length : UInt32,
    auth_type : Win32cr::Storage::IscsiDisc::ISCSI_AUTH_TYPES,
    estimated_throughput : UInt64,
    max_datagram_size : UInt32

  @[Extern]
  record ISCSI_SESSION_INFO_EX,
    session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID,
    initial_r2t : Win32cr::Foundation::BOOLEAN,
    immediate_data : Win32cr::Foundation::BOOLEAN,
    type__ : UInt8,
    data_sequence_in_order : Win32cr::Foundation::BOOLEAN,
    data_pdu_in_order : Win32cr::Foundation::BOOLEAN,
    error_recovery_level : UInt8,
    max_outstanding_r2t : UInt32,
    first_burst_length : UInt32,
    max_burst_length : UInt32,
    maximum_connections : UInt32,
    connection_count : UInt32,
    connections : Win32cr::Storage::IscsiDisc::ISCSI_CONNECTION_INFO_EX*

  @[Extern]
  record ISCSI_DEVICE_ON_SESSIONW,
    initiator_name : UInt16[256],
    target_name : UInt16[224],
    scsi_address : Win32cr::Storage::IscsiDisc::SCSI_ADDRESS,
    device_interface_type : LibC::GUID,
    device_interface_name : UInt16[260],
    legacy_name : UInt16[260],
    storage_device_number : Win32cr::System::Ioctl::STORAGE_DEVICE_NUMBER,
    device_instance : UInt32

  @[Extern]
  record ISCSI_DEVICE_ON_SESSIONA,
    initiator_name : Win32cr::Foundation::CHAR[256],
    target_name : Win32cr::Foundation::CHAR[224],
    scsi_address : Win32cr::Storage::IscsiDisc::SCSI_ADDRESS,
    device_interface_type : LibC::GUID,
    device_interface_name : Win32cr::Foundation::CHAR[260],
    legacy_name : Win32cr::Foundation::CHAR[260],
    storage_device_number : Win32cr::System::Ioctl::STORAGE_DEVICE_NUMBER,
    device_instance : UInt32

  @[Extern]
  record PERSISTENT_ISCSI_LOGIN_INFOW,
    target_name : UInt16[224],
    is_informational_session : Win32cr::Foundation::BOOLEAN,
    initiator_instance : UInt16[256],
    initiator_port_number : UInt32,
    target_portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW,
    security_flags : UInt64,
    mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGW*,
    login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS

  @[Extern]
  record PERSISTENT_ISCSI_LOGIN_INFOA,
    target_name : Win32cr::Foundation::CHAR[224],
    is_informational_session : Win32cr::Foundation::BOOLEAN,
    initiator_instance : Win32cr::Foundation::CHAR[256],
    initiator_port_number : UInt32,
    target_portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA,
    security_flags : UInt64,
    mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGA*,
    login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS

  @[Extern]
  record ISCSI_VERSION_INFO,
    major_version : UInt32,
    minor_version : UInt32,
    build_number : UInt32

  @[Link("iscsidsc")]
  lib C
    fun GetIScsiVersionInformation(version_info : Win32cr::Storage::IscsiDisc::ISCSI_VERSION_INFO*) : UInt32

    fun GetIScsiTargetInformationW(target_name : Win32cr::Foundation::PWSTR, discovery_mechanism : Win32cr::Foundation::PWSTR, info_class : Win32cr::Storage::IscsiDisc::TARGET_INFORMATION_CLASS, buffer_size : UInt32*, buffer : Void*) : UInt32

    fun GetIScsiTargetInformationA(target_name : Win32cr::Foundation::PSTR, discovery_mechanism : Win32cr::Foundation::PSTR, info_class : Win32cr::Storage::IscsiDisc::TARGET_INFORMATION_CLASS, buffer_size : UInt32*, buffer : Void*) : UInt32

    fun AddIScsiConnectionW(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, reserved : Void*, initiator_port_number : UInt32, target_portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*, security_flags : UInt64, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, key_size : UInt32, key : UInt8*, connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*) : UInt32

    fun AddIScsiConnectionA(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, reserved : Void*, initiator_port_number : UInt32, target_portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*, security_flags : UInt64, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, key_size : UInt32, key : UInt8*, connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*) : UInt32

    fun RemoveIScsiConnection(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*) : UInt32

    fun ReportIScsiTargetsW(force_update : Win32cr::Foundation::BOOLEAN, buffer_size : UInt32*, buffer : UInt16*) : UInt32

    fun ReportIScsiTargetsA(force_update : Win32cr::Foundation::BOOLEAN, buffer_size : UInt32*, buffer : UInt8*) : UInt32

    fun AddIScsiStaticTargetW(target_name : Win32cr::Foundation::PWSTR, target_alias : Win32cr::Foundation::PWSTR, target_flags : UInt32, persist : Win32cr::Foundation::BOOLEAN, mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGW*, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, portal_group : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTAL_GROUPW*) : UInt32

    fun AddIScsiStaticTargetA(target_name : Win32cr::Foundation::PSTR, target_alias : Win32cr::Foundation::PSTR, target_flags : UInt32, persist : Win32cr::Foundation::BOOLEAN, mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGA*, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, portal_group : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTAL_GROUPA*) : UInt32

    fun RemoveIScsiStaticTargetW(target_name : Win32cr::Foundation::PWSTR) : UInt32

    fun RemoveIScsiStaticTargetA(target_name : Win32cr::Foundation::PSTR) : UInt32

    fun AddIScsiSendTargetPortalW(initiator_instance : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, security_flags : UInt64, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*) : UInt32

    fun AddIScsiSendTargetPortalA(initiator_instance : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, security_flags : UInt64, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*) : UInt32

    fun RemoveIScsiSendTargetPortalW(initiator_instance : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*) : UInt32

    fun RemoveIScsiSendTargetPortalA(initiator_instance : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*) : UInt32

    fun RefreshIScsiSendTargetPortalW(initiator_instance : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*) : UInt32

    fun RefreshIScsiSendTargetPortalA(initiator_instance : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*) : UInt32

    fun ReportIScsiSendTargetPortalsW(portal_count : UInt32*, portal_info : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTAL_INFOW*) : UInt32

    fun ReportIScsiSendTargetPortalsA(portal_count : UInt32*, portal_info : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTAL_INFOA*) : UInt32

    fun ReportIScsiSendTargetPortalsExW(portal_count : UInt32*, portal_info_size : UInt32*, portal_info : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTAL_INFO_EXW*) : UInt32

    fun ReportIScsiSendTargetPortalsExA(portal_count : UInt32*, portal_info_size : UInt32*, portal_info : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTAL_INFO_EXA*) : UInt32

    fun LoginIScsiTargetW(target_name : Win32cr::Foundation::PWSTR, is_informational_session : Win32cr::Foundation::BOOLEAN, initiator_instance : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, target_portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*, security_flags : UInt64, mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGW*, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, key_size : UInt32, key : UInt8*, is_persistent : Win32cr::Foundation::BOOLEAN, unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, unique_connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*) : UInt32

    fun LoginIScsiTargetA(target_name : Win32cr::Foundation::PSTR, is_informational_session : Win32cr::Foundation::BOOLEAN, initiator_instance : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, target_portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*, security_flags : UInt64, mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGA*, login_options : Win32cr::Storage::IscsiDisc::ISCSI_LOGIN_OPTIONS*, key_size : UInt32, key : UInt8*, is_persistent : Win32cr::Foundation::BOOLEAN, unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, unique_connection_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*) : UInt32

    fun ReportIScsiPersistentLoginsW(count : UInt32*, persistent_login_info : Win32cr::Storage::IscsiDisc::PERSISTENT_ISCSI_LOGIN_INFOW*, buffer_size_in_bytes : UInt32*) : UInt32

    fun ReportIScsiPersistentLoginsA(count : UInt32*, persistent_login_info : Win32cr::Storage::IscsiDisc::PERSISTENT_ISCSI_LOGIN_INFOA*, buffer_size_in_bytes : UInt32*) : UInt32

    fun LogoutIScsiTarget(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*) : UInt32

    fun RemoveIScsiPersistentTargetW(initiator_instance : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, target_name : Win32cr::Foundation::PWSTR, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*) : UInt32

    fun RemoveIScsiPersistentTargetA(initiator_instance : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, target_name : Win32cr::Foundation::PSTR, portal : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*) : UInt32

    fun SendScsiInquiry(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, lun : UInt64, evpd_cmddt : UInt8, page_code : UInt8, scsi_status : UInt8*, response_size : UInt32*, response_buffer : UInt8*, sense_size : UInt32*, sense_buffer : UInt8*) : UInt32

    fun SendScsiReadCapacity(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, lun : UInt64, scsi_status : UInt8*, response_size : UInt32*, response_buffer : UInt8*, sense_size : UInt32*, sense_buffer : UInt8*) : UInt32

    fun SendScsiReportLuns(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, scsi_status : UInt8*, response_size : UInt32*, response_buffer : UInt8*, sense_size : UInt32*, sense_buffer : UInt8*) : UInt32

    fun ReportIScsiInitiatorListW(buffer_size : UInt32*, buffer : UInt16*) : UInt32

    fun ReportIScsiInitiatorListA(buffer_size : UInt32*, buffer : UInt8*) : UInt32

    fun ReportActiveIScsiTargetMappingsW(buffer_size : UInt32*, mapping_count : UInt32*, mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGW*) : UInt32

    fun ReportActiveIScsiTargetMappingsA(buffer_size : UInt32*, mapping_count : UInt32*, mappings : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_MAPPINGA*) : UInt32

    fun SetIScsiTunnelModeOuterAddressW(initiator_name : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, destination_address : Win32cr::Foundation::PWSTR, outer_mode_address : Win32cr::Foundation::PWSTR, persist : Win32cr::Foundation::BOOLEAN) : UInt32

    fun SetIScsiTunnelModeOuterAddressA(initiator_name : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, destination_address : Win32cr::Foundation::PSTR, outer_mode_address : Win32cr::Foundation::PSTR, persist : Win32cr::Foundation::BOOLEAN) : UInt32

    fun SetIScsiIKEInfoW(initiator_name : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, auth_info : Win32cr::Storage::IscsiDisc::IKE_AUTHENTICATION_INFORMATION*, persist : Win32cr::Foundation::BOOLEAN) : UInt32

    fun SetIScsiIKEInfoA(initiator_name : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, auth_info : Win32cr::Storage::IscsiDisc::IKE_AUTHENTICATION_INFORMATION*, persist : Win32cr::Foundation::BOOLEAN) : UInt32

    fun GetIScsiIKEInfoW(initiator_name : Win32cr::Foundation::PWSTR, initiator_port_number : UInt32, reserved : UInt32*, auth_info : Win32cr::Storage::IscsiDisc::IKE_AUTHENTICATION_INFORMATION*) : UInt32

    fun GetIScsiIKEInfoA(initiator_name : Win32cr::Foundation::PSTR, initiator_port_number : UInt32, reserved : UInt32*, auth_info : Win32cr::Storage::IscsiDisc::IKE_AUTHENTICATION_INFORMATION*) : UInt32

    fun SetIScsiGroupPresharedKey(key_length : UInt32, key : UInt8*, persist : Win32cr::Foundation::BOOLEAN) : UInt32

    fun SetIScsiInitiatorCHAPSharedSecret(shared_secret_length : UInt32, shared_secret : UInt8*) : UInt32

    fun SetIScsiInitiatorRADIUSSharedSecret(shared_secret_length : UInt32, shared_secret : UInt8*) : UInt32

    fun SetIScsiInitiatorNodeNameW(initiator_node_name : Win32cr::Foundation::PWSTR) : UInt32

    fun SetIScsiInitiatorNodeNameA(initiator_node_name : Win32cr::Foundation::PSTR) : UInt32

    fun GetIScsiInitiatorNodeNameW(initiator_node_name : Win32cr::Foundation::PWSTR) : UInt32

    fun GetIScsiInitiatorNodeNameA(initiator_node_name : Win32cr::Foundation::PSTR) : UInt32

    fun AddISNSServerW(address : Win32cr::Foundation::PWSTR) : UInt32

    fun AddISNSServerA(address : Win32cr::Foundation::PSTR) : UInt32

    fun RemoveISNSServerW(address : Win32cr::Foundation::PWSTR) : UInt32

    fun RemoveISNSServerA(address : Win32cr::Foundation::PSTR) : UInt32

    fun RefreshISNSServerW(address : Win32cr::Foundation::PWSTR) : UInt32

    fun RefreshISNSServerA(address : Win32cr::Foundation::PSTR) : UInt32

    fun ReportISNSServerListW(buffer_size_in_char : UInt32*, buffer : UInt16*) : UInt32

    fun ReportISNSServerListA(buffer_size_in_char : UInt32*, buffer : UInt8*) : UInt32

    fun GetIScsiSessionListW(buffer_size : UInt32*, session_count : UInt32*, session_info : Win32cr::Storage::IscsiDisc::ISCSI_SESSION_INFOW*) : UInt32

    fun GetIScsiSessionListA(buffer_size : UInt32*, session_count : UInt32*, session_info : Win32cr::Storage::IscsiDisc::ISCSI_SESSION_INFOA*) : UInt32

    fun GetIScsiSessionListEx(buffer_size : UInt32*, session_count_ptr : UInt32*, session_info : Win32cr::Storage::IscsiDisc::ISCSI_SESSION_INFO_EX*) : UInt32

    fun GetDevicesForIScsiSessionW(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, device_count : UInt32*, devices : Win32cr::Storage::IscsiDisc::ISCSI_DEVICE_ON_SESSIONW*) : UInt32

    fun GetDevicesForIScsiSessionA(unique_session_id : Win32cr::Storage::IscsiDisc::ISCSI_UNIQUE_SESSION_ID*, device_count : UInt32*, devices : Win32cr::Storage::IscsiDisc::ISCSI_DEVICE_ON_SESSIONA*) : UInt32

    fun SetupPersistentIScsiVolumes : UInt32

    fun SetupPersistentIScsiDevices : UInt32

    fun AddPersistentIScsiDeviceW(device_path : Win32cr::Foundation::PWSTR) : UInt32

    fun AddPersistentIScsiDeviceA(device_path : Win32cr::Foundation::PSTR) : UInt32

    fun RemovePersistentIScsiDeviceW(device_path : Win32cr::Foundation::PWSTR) : UInt32

    fun RemovePersistentIScsiDeviceA(device_path : Win32cr::Foundation::PSTR) : UInt32

    fun ClearPersistentIScsiDevices : UInt32

    fun ReportPersistentIScsiDevicesW(buffer_size_in_char : UInt32*, buffer : UInt16*) : UInt32

    fun ReportPersistentIScsiDevicesA(buffer_size_in_char : UInt32*, buffer : UInt8*) : UInt32

    fun ReportIScsiTargetPortalsW(initiator_name : Win32cr::Foundation::PWSTR, target_name : Win32cr::Foundation::PWSTR, target_portal_tag : UInt16*, element_count : UInt32*, portals : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALW*) : UInt32

    fun ReportIScsiTargetPortalsA(initiator_name : Win32cr::Foundation::PSTR, target_name : Win32cr::Foundation::PSTR, target_portal_tag : UInt16*, element_count : UInt32*, portals : Win32cr::Storage::IscsiDisc::ISCSI_TARGET_PORTALA*) : UInt32

    fun AddRadiusServerW(address : Win32cr::Foundation::PWSTR) : UInt32

    fun AddRadiusServerA(address : Win32cr::Foundation::PSTR) : UInt32

    fun RemoveRadiusServerW(address : Win32cr::Foundation::PWSTR) : UInt32

    fun RemoveRadiusServerA(address : Win32cr::Foundation::PSTR) : UInt32

    fun ReportRadiusServerListW(buffer_size_in_char : UInt32*, buffer : UInt16*) : UInt32

    fun ReportRadiusServerListA(buffer_size_in_char : UInt32*, buffer : UInt8*) : UInt32

  end
end