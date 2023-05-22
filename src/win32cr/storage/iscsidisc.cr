require "../foundation.cr"
require "../system/ioctl.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:iscsidsc.dll")]
lib LibWin32
  IOCTL_SCSI_BASE = 4_u32
  ScsiRawInterfaceGuid = "53f56309-b6bf-11d0-94f2-00a0c91efb8b"
  WmiScsiAddressGuid = "53f5630f-b6bf-11d0-94f2-00a0c91efb8b"
  FILE_DEVICE_SCSI = 27_u32
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
  ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED = 64_u32
  ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED = 32_u32
  ISCSI_SECURITY_FLAG_PFS_ENABLED = 16_u32
  ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED = 8_u32
  ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED = 4_u32
  ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED = 2_u32
  ISCSI_SECURITY_FLAG_VALID = 1_u32
  ISCSI_LOGIN_FLAG_REQUIRE_IPSEC = 1_u32
  ISCSI_LOGIN_FLAG_MULTIPATH_ENABLED = 2_u32
  ISCSI_LOGIN_FLAG_RESERVED1 = 4_u32
  ISCSI_LOGIN_FLAG_ALLOW_PORTAL_HOPPING = 8_u32
  ISCSI_LOGIN_FLAG_USE_RADIUS_RESPONSE = 16_u32
  ISCSI_LOGIN_FLAG_USE_RADIUS_VERIFICATION = 32_u32
  ISCSI_LOGIN_OPTIONS_HEADER_DIGEST = 1_u32
  ISCSI_LOGIN_OPTIONS_DATA_DIGEST = 2_u32
  ISCSI_LOGIN_OPTIONS_MAXIMUM_CONNECTIONS = 4_u32
  ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_WAIT = 8_u32
  ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_RETAIN = 16_u32
  ISCSI_LOGIN_OPTIONS_USERNAME = 32_u32
  ISCSI_LOGIN_OPTIONS_PASSWORD = 64_u32
  ISCSI_LOGIN_OPTIONS_AUTH_TYPE = 128_u32
  ISCSI_LOGIN_OPTIONS_VERSION = 0_u32
  ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET = 2_u32
  ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION = 4_u32
  ID_IPV4_ADDR = 1_u32
  ID_FQDN = 2_u32
  ID_USER_FQDN = 3_u32
  ID_IPV6_ADDR = 5_u32

  type ADAPTER_OBJECT = Void

  alias DUMP_DEVICE_POWERON_ROUTINE = Proc(Void*, Int32)
  alias PDUMP_DEVICE_POWERON_ROUTINE = Proc(Int32)


  enum NV_SEP_WRITE_CACHE_TYPE : Int32
    NVSEPWriteCacheTypeUnknown = 0
    NVSEPWriteCacheTypeNone = 1
    NVSEPWriteCacheTypeWriteBack = 2
    NVSEPWriteCacheTypeWriteThrough = 3
  end

  enum MP_STORAGE_DIAGNOSTIC_LEVEL : Int32
    MpStorageDiagnosticLevelDefault = 0
    MpStorageDiagnosticLevelMax = 1
  end

  enum MP_STORAGE_DIAGNOSTIC_TARGET_TYPE : Int32
    MpStorageDiagnosticTargetTypeUndefined = 0
    MpStorageDiagnosticTargetTypeMiniport = 2
    MpStorageDiagnosticTargetTypeHbaFirmware = 3
    MpStorageDiagnosticTargetTypeMax = 4
  end

  enum NVCACHE_TYPE : Int32
    NvCacheTypeUnknown = 0
    NvCacheTypeNone = 1
    NvCacheTypeWriteBack = 2
    NvCacheTypeWriteThrough = 3
  end

  enum NVCACHE_STATUS : Int32
    NvCacheStatusUnknown = 0
    NvCacheStatusDisabling = 1
    NvCacheStatusDisabled = 2
    NvCacheStatusEnabled = 3
  end

  enum ISCSI_DIGEST_TYPES : Int32
    ISCSI_DIGEST_TYPE_NONE = 0
    ISCSI_DIGEST_TYPE_CRC32C = 1
  end

  enum ISCSI_AUTH_TYPES : Int32
    ISCSI_NO_AUTH_TYPE = 0
    ISCSI_CHAP_AUTH_TYPE = 1
    ISCSI_MUTUAL_CHAP_AUTH_TYPE = 2
  end

  enum IKE_AUTHENTICATION_METHOD : Int32
    IKE_AUTHENTICATION_PRESHARED_KEY_METHOD = 1
  end

  enum TARGETPROTOCOLTYPE : Int32
    ISCSI_TCP_PROTOCOL_TYPE = 0
  end

  enum TARGET_INFORMATION_CLASS : Int32
    ProtocolType = 0
    TargetAlias = 1
    DiscoveryMechanisms = 2
    PortalGroups = 3
    PersistentTargetMappings = 4
    InitiatorName = 5
    TargetFlags = 6
    LoginOptions = 7
  end

union NV_SEP_CACHE_PARAMETER_Flags_e__Union
  cache_flags : NV_SEP_CACHE_PARAMETER_Flags_e__Union_CacheFlags_e__Struct
  cache_flags_set : UInt8
end
union STORAGE_FIRMWARE_SLOT_INFO_Revision_e__Union
  info : UInt8[8]*
  as_ulonglong : UInt64
end
union IKE_AUTHENTICATION_INFORMATION_Anonymous_e__Union
  ps_key : IKE_AUTHENTICATION_PRESHARED_KEY
end

  struct SCSI_PASS_THROUGH
    length : UInt16
    scsi_status : UInt8
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    cdb_length : UInt8
    sense_info_length : UInt8
    data_in : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    data_buffer_offset : LibC::UINT_PTR
    sense_info_offset : UInt32
    cdb : UInt8[16]*
  end
  struct SCSI_PASS_THROUGH_DIRECT
    length : UInt16
    scsi_status : UInt8
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    cdb_length : UInt8
    sense_info_length : UInt8
    data_in : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    data_buffer : Void*
    sense_info_offset : UInt32
    cdb : UInt8[16]*
  end
  struct SCSI_PASS_THROUGH32
    length : UInt16
    scsi_status : UInt8
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    cdb_length : UInt8
    sense_info_length : UInt8
    data_in : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    data_buffer_offset : UInt32
    sense_info_offset : UInt32
    cdb : UInt8[16]*
  end
  struct SCSI_PASS_THROUGH_DIRECT32
    length : UInt16
    scsi_status : UInt8
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    cdb_length : UInt8
    sense_info_length : UInt8
    data_in : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    data_buffer : Void*
    sense_info_offset : UInt32
    cdb : UInt8[16]*
  end
  struct SCSI_PASS_THROUGH_EX
    version : UInt32
    length : UInt32
    cdb_length : UInt32
    stor_address_length : UInt32
    scsi_status : UInt8
    sense_info_length : UInt8
    data_direction : UInt8
    reserved : UInt8
    time_out_value : UInt32
    stor_address_offset : UInt32
    sense_info_offset : UInt32
    data_out_transfer_length : UInt32
    data_in_transfer_length : UInt32
    data_out_buffer_offset : LibC::UINT_PTR
    data_in_buffer_offset : LibC::UINT_PTR
    cdb : UInt8[0]*
  end
  struct SCSI_PASS_THROUGH_DIRECT_EX
    version : UInt32
    length : UInt32
    cdb_length : UInt32
    stor_address_length : UInt32
    scsi_status : UInt8
    sense_info_length : UInt8
    data_direction : UInt8
    reserved : UInt8
    time_out_value : UInt32
    stor_address_offset : UInt32
    sense_info_offset : UInt32
    data_out_transfer_length : UInt32
    data_in_transfer_length : UInt32
    data_out_buffer : Void*
    data_in_buffer : Void*
    cdb : UInt8[0]*
  end
  struct SCSI_PASS_THROUGH32_EX
    version : UInt32
    length : UInt32
    cdb_length : UInt32
    stor_address_length : UInt32
    scsi_status : UInt8
    sense_info_length : UInt8
    data_direction : UInt8
    reserved : UInt8
    time_out_value : UInt32
    stor_address_offset : UInt32
    sense_info_offset : UInt32
    data_out_transfer_length : UInt32
    data_in_transfer_length : UInt32
    data_out_buffer_offset : UInt32
    data_in_buffer_offset : UInt32
    cdb : UInt8[0]*
  end
  struct SCSI_PASS_THROUGH_DIRECT32_EX
    version : UInt32
    length : UInt32
    cdb_length : UInt32
    stor_address_length : UInt32
    scsi_status : UInt8
    sense_info_length : UInt8
    data_direction : UInt8
    reserved : UInt8
    time_out_value : UInt32
    stor_address_offset : UInt32
    sense_info_offset : UInt32
    data_out_transfer_length : UInt32
    data_in_transfer_length : UInt32
    data_out_buffer : Void*
    data_in_buffer : Void*
    cdb : UInt8[0]*
  end
  struct ATA_PASS_THROUGH_EX
    length : UInt16
    ata_flags : UInt16
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    reserved_as_uchar : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    reserved_as_ulong : UInt32
    data_buffer_offset : LibC::UINT_PTR
    previous_task_file : UInt8[8]*
    current_task_file : UInt8[8]*
  end
  struct ATA_PASS_THROUGH_DIRECT
    length : UInt16
    ata_flags : UInt16
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    reserved_as_uchar : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    reserved_as_ulong : UInt32
    data_buffer : Void*
    previous_task_file : UInt8[8]*
    current_task_file : UInt8[8]*
  end
  struct ATA_PASS_THROUGH_EX32
    length : UInt16
    ata_flags : UInt16
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    reserved_as_uchar : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    reserved_as_ulong : UInt32
    data_buffer_offset : UInt32
    previous_task_file : UInt8[8]*
    current_task_file : UInt8[8]*
  end
  struct ATA_PASS_THROUGH_DIRECT32
    length : UInt16
    ata_flags : UInt16
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    reserved_as_uchar : UInt8
    data_transfer_length : UInt32
    time_out_value : UInt32
    reserved_as_ulong : UInt32
    data_buffer : Void*
    previous_task_file : UInt8[8]*
    current_task_file : UInt8[8]*
  end
  struct IDE_IO_CONTROL
    header_length : UInt32
    signature : UInt8[8]*
    timeout : UInt32
    control_code : UInt32
    return_status : UInt32
    data_length : UInt32
  end
  struct MPIO_PASS_THROUGH_PATH
    pass_through : SCSI_PASS_THROUGH
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct MPIO_PASS_THROUGH_PATH_DIRECT
    pass_through : SCSI_PASS_THROUGH_DIRECT
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct MPIO_PASS_THROUGH_PATH_EX
    pass_through_offset : UInt32
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct MPIO_PASS_THROUGH_PATH_DIRECT_EX
    pass_through_offset : UInt32
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct MPIO_PASS_THROUGH_PATH32
    pass_through : SCSI_PASS_THROUGH32
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct MPIO_PASS_THROUGH_PATH_DIRECT32
    pass_through : SCSI_PASS_THROUGH_DIRECT32
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct MPIO_PASS_THROUGH_PATH32_EX
    pass_through_offset : UInt32
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct MPIO_PASS_THROUGH_PATH_DIRECT32_EX
    pass_through_offset : UInt32
    version : UInt32
    length : UInt16
    flags : UInt8
    port_number : UInt8
    mpio_path_id : UInt64
  end
  struct SCSI_BUS_DATA
    number_of_logical_units : UInt8
    initiator_bus_id : UInt8
    inquiry_data_offset : UInt32
  end
  struct SCSI_ADAPTER_BUS_INFO
    number_of_buses : UInt8
    bus_data : SCSI_BUS_DATA[0]*
  end
  struct SCSI_INQUIRY_DATA
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
    device_claimed : BOOLEAN
    inquiry_data_length : UInt32
    next_inquiry_data_offset : UInt32
    inquiry_data : UInt8[0]*
  end
  struct SRB_IO_CONTROL
    header_length : UInt32
    signature : UInt8[8]*
    timeout : UInt32
    control_code : UInt32
    return_code : UInt32
    length : UInt32
  end
  struct NVCACHE_REQUEST_BLOCK
    nrb_size : UInt32
    function : UInt16
    nrb_flags : UInt32
    nrb_status : UInt32
    count : UInt32
    lba : UInt64
    data_buf_size : UInt32
    nv_cache_status : UInt32
    nv_cache_sub_status : UInt32
  end
  struct NV_FEATURE_PARAMETER
    nv_power_mode_enabled : UInt16
    nv_parameter_reserv1 : UInt16
    nv_cmd_enabled : UInt16
    nv_parameter_reserv2 : UInt16
    nv_power_mode_ver : UInt16
    nv_cmd_ver : UInt16
    nv_size : UInt32
    nv_read_speed : UInt16
    nv_wrt_speed : UInt16
    device_spin_up_time : UInt32
  end
  struct NVCACHE_HINT_PAYLOAD
    command : UInt8
    feature7_0 : UInt8
    feature15_8 : UInt8
    count15_8 : UInt8
    lba7_0 : UInt8
    lba15_8 : UInt8
    lba23_16 : UInt8
    lba31_24 : UInt8
    lba39_32 : UInt8
    lba47_40 : UInt8
    auxiliary7_0 : UInt8
    auxiliary23_16 : UInt8
    reserved : UInt8[4]*
  end
  struct NV_SEP_CACHE_PARAMETER
    version : UInt32
    size : UInt32
    flags : NV_SEP_CACHE_PARAMETER_Flags_e__Union
    write_cache_type : UInt8
    write_cache_type_effective : UInt8
    parameter_reserve1 : UInt8[3]*
  end
  struct NV_SEP_CACHE_PARAMETER_Flags_e__Union_CacheFlags_e__Struct
    _bitfield : UInt8
  end
  struct STORAGE_DIAGNOSTIC_MP_REQUEST
    version : UInt32
    size : UInt32
    target_type : MP_STORAGE_DIAGNOSTIC_TARGET_TYPE
    level : MP_STORAGE_DIAGNOSTIC_LEVEL
    provider_id : Guid
    buffer_size : UInt32
    reserved : UInt32
    data_buffer : UInt8[0]*
  end
  struct MP_DEVICE_DATA_SET_RANGE
    starting_offset : Int64
    length_in_bytes : UInt64
  end
  struct DSM_NOTIFICATION_REQUEST_BLOCK
    size : UInt32
    version : UInt32
    notify_flags : UInt32
    data_set_profile : UInt32
    reserved : UInt32[3]*
    data_set_ranges_count : UInt32
    data_set_ranges : MP_DEVICE_DATA_SET_RANGE[0]*
  end
  struct HYBRID_REQUEST_BLOCK
    version : UInt32
    size : UInt32
    function : UInt32
    flags : UInt32
    data_buffer_offset : UInt32
    data_buffer_length : UInt32
  end
  struct NVCACHE_PRIORITY_LEVEL_DESCRIPTOR
    priority_level : UInt8
    reserved0 : UInt8[3]*
    consumed_nvm_size_fraction : UInt32
    consumed_mapping_resources_fraction : UInt32
    consumed_nvm_size_for_dirty_data_fraction : UInt32
    consumed_mapping_resources_for_dirty_data_fraction : UInt32
    reserved1 : UInt32
  end
  struct HYBRID_INFORMATION
    version : UInt32
    size : UInt32
    hybrid_supported : BOOLEAN
    status : NVCACHE_STATUS
    cache_type_effective : NVCACHE_TYPE
    cache_type_default : NVCACHE_TYPE
    fraction_base : UInt32
    cache_size : UInt64
    attributes : HYBRID_INFORMATION_Attributes_e__Struct
    priorities : HYBRID_INFORMATION_Priorities_e__Struct
  end
  struct HYBRID_INFORMATION_Priorities_e__Struct
    priority_level_count : UInt8
    max_priority_behavior : BOOLEAN
    optimal_write_granularity : UInt8
    reserved : UInt8
    dirty_threshold_low : UInt32
    dirty_threshold_high : UInt32
    supported_commands : HYBRID_INFORMATION_Priorities_e__Struct_SupportedCommands_e__Struct
    priority : NVCACHE_PRIORITY_LEVEL_DESCRIPTOR[0]*
  end
  struct HYBRID_INFORMATION_Priorities_e__Struct_SupportedCommands_e__Struct
    _bitfield : UInt32
    max_evict_commands : UInt32
    max_lba_range_count_for_evict : UInt32
    max_lba_range_count_for_change_lba : UInt32
  end
  struct HYBRID_INFORMATION_Attributes_e__Struct
    _bitfield : UInt32
  end
  struct HYBRID_DIRTY_THRESHOLDS
    version : UInt32
    size : UInt32
    dirty_low_threshold : UInt32
    dirty_high_threshold : UInt32
  end
  struct HYBRID_DEMOTE_BY_SIZE
    version : UInt32
    size : UInt32
    source_priority : UInt8
    target_priority : UInt8
    reserved0 : UInt16
    reserved1 : UInt32
    lba_count : UInt64
  end
  struct FIRMWARE_REQUEST_BLOCK
    version : UInt32
    size : UInt32
    function : UInt32
    flags : UInt32
    data_buffer_offset : UInt32
    data_buffer_length : UInt32
  end
  struct STORAGE_FIRMWARE_SLOT_INFO
    slot_number : UInt8
    read_only : BOOLEAN
    reserved : UInt8[6]*
    revision : STORAGE_FIRMWARE_SLOT_INFO_Revision_e__Union
  end
  struct STORAGE_FIRMWARE_SLOT_INFO_V2
    slot_number : UInt8
    read_only : BOOLEAN
    reserved : UInt8[6]*
    revision : UInt8[16]*
  end
  struct STORAGE_FIRMWARE_INFO
    version : UInt32
    size : UInt32
    upgrade_support : BOOLEAN
    slot_count : UInt8
    active_slot : UInt8
    pending_activate_slot : UInt8
    reserved : UInt32
    slot : STORAGE_FIRMWARE_SLOT_INFO[0]*
  end
  struct STORAGE_FIRMWARE_INFO_V2
    version : UInt32
    size : UInt32
    upgrade_support : BOOLEAN
    slot_count : UInt8
    active_slot : UInt8
    pending_activate_slot : UInt8
    firmware_shared : BOOLEAN
    reserved : UInt8[3]*
    image_payload_alignment : UInt32
    image_payload_max_size : UInt32
    slot : STORAGE_FIRMWARE_SLOT_INFO_V2[0]*
  end
  struct STORAGE_FIRMWARE_DOWNLOAD
    version : UInt32
    size : UInt32
    offset : UInt64
    buffer_size : UInt64
    image_buffer : UInt8[0]*
  end
  struct STORAGE_FIRMWARE_DOWNLOAD_V2
    version : UInt32
    size : UInt32
    offset : UInt64
    buffer_size : UInt64
    slot : UInt8
    reserved : UInt8[3]*
    image_size : UInt32
    image_buffer : UInt8[0]*
  end
  struct STORAGE_FIRMWARE_ACTIVATE
    version : UInt32
    size : UInt32
    slot_to_activate : UInt8
    reserved0 : UInt8[3]*
  end
  struct IO_SCSI_CAPABILITIES
    length : UInt32
    maximum_transfer_length : UInt32
    maximum_physical_pages : UInt32
    supported_asynchronous_events : UInt32
    alignment_mask : UInt32
    tagged_queuing : BOOLEAN
    adapter_scans_down : BOOLEAN
    adapter_uses_pio : BOOLEAN
  end
  struct SCSI_ADDRESS
    length : UInt32
    port_number : UInt8
    path_id : UInt8
    target_id : UInt8
    lun : UInt8
  end
  struct DUMP_POINTERS_VERSION
    version : UInt32
    size : UInt32
  end
  struct DUMP_POINTERS
    adapter_object : ADAPTER_OBJECT*
    mapped_register_base : Void*
    dump_data : Void*
    common_buffer_va : Void*
    common_buffer_pa : LARGE_INTEGER
    common_buffer_size : UInt32
    allocate_common_buffers : BOOLEAN
    use_disk_dump : BOOLEAN
    spare1 : UInt8[2]*
    device_object : Void*
  end
  struct DUMP_POINTERS_EX
    header : DUMP_POINTERS_VERSION
    dump_data : Void*
    common_buffer_va : Void*
    common_buffer_size : UInt32
    allocate_common_buffers : BOOLEAN
    device_object : Void*
    driver_list : Void*
    dw_port_flags : UInt32
    max_device_dump_section_size : UInt32
    max_device_dump_level : UInt32
    max_transfer_size : UInt32
    adapter_object : Void*
    mapped_register_base : Void*
    device_ready : BOOLEAN*
    dump_device_power_on : PDUMP_DEVICE_POWERON_ROUTINE
    dump_device_power_on_context : Void*
  end
  struct DUMP_DRIVER
    dump_driver_list : Void*
    driver_name : Char[15]*
    base_name : Char[15]*
  end
  struct NTSCSI_UNICODE_STRING
    length : UInt16
    maximum_length : UInt16
    buffer : LibC::LPWSTR
  end
  struct DUMP_DRIVER_EX
    dump_driver_list : Void*
    driver_name : Char[15]*
    base_name : Char[15]*
    driver_full_path : NTSCSI_UNICODE_STRING
  end
  struct STORAGE_ENDURANCE_INFO
    valid_fields : UInt32
    group_id : UInt32
    flags : STORAGE_ENDURANCE_INFO_Flags_e__Struct
    life_percentage : UInt32
    bytes_read_count : UInt8[16]*
    byte_write_count : UInt8[16]*
  end
  struct STORAGE_ENDURANCE_INFO_Flags_e__Struct
    _bitfield : UInt32
  end
  struct STORAGE_ENDURANCE_DATA_DESCRIPTOR
    version : UInt32
    size : UInt32
    endurance_info : STORAGE_ENDURANCE_INFO
  end
  struct ISCSI_LOGIN_OPTIONS
    version : UInt32
    information_specified : UInt32
    login_flags : UInt32
    auth_type : ISCSI_AUTH_TYPES
    header_digest : ISCSI_DIGEST_TYPES
    data_digest : ISCSI_DIGEST_TYPES
    maximum_connections : UInt32
    default_time2_wait : UInt32
    default_time2_retain : UInt32
    username_length : UInt32
    password_length : UInt32
    username : UInt8*
    password : UInt8*
  end
  struct IKE_AUTHENTICATION_PRESHARED_KEY
    security_flags : UInt64
    id_type : UInt8
    id_length_in_bytes : UInt32
    id : UInt8*
    key_length_in_bytes : UInt32
    key : UInt8*
  end
  struct IKE_AUTHENTICATION_INFORMATION
    auth_method : IKE_AUTHENTICATION_METHOD
    anonymous : IKE_AUTHENTICATION_INFORMATION_Anonymous_e__Union
  end
  struct ISCSI_UNIQUE_SESSION_ID
    adapter_unique : UInt64
    adapter_specific : UInt64
  end
  struct SCSI_LUN_LIST
    oslun : UInt32
    target_lun : UInt64
  end
  struct ISCSI_TARGET_MAPPINGW
    initiator_name : Char[256]*
    target_name : Char[224]*
    os_device_name : Char[260]*
    session_id : ISCSI_UNIQUE_SESSION_ID
    os_bus_number : UInt32
    os_target_number : UInt32
    lun_count : UInt32
    lun_list : SCSI_LUN_LIST*
  end
  struct ISCSI_TARGET_MAPPINGA
    initiator_name : CHAR[256]*
    target_name : CHAR[224]*
    os_device_name : CHAR[260]*
    session_id : ISCSI_UNIQUE_SESSION_ID
    os_bus_number : UInt32
    os_target_number : UInt32
    lun_count : UInt32
    lun_list : SCSI_LUN_LIST*
  end
  struct ISCSI_TARGET_PORTALW
    symbolic_name : Char[256]*
    address : Char[256]*
    socket : UInt16
  end
  struct ISCSI_TARGET_PORTALA
    symbolic_name : CHAR[256]*
    address : CHAR[256]*
    socket : UInt16
  end
  struct ISCSI_TARGET_PORTAL_INFOW
    initiator_name : Char[256]*
    initiator_port_number : UInt32
    symbolic_name : Char[256]*
    address : Char[256]*
    socket : UInt16
  end
  struct ISCSI_TARGET_PORTAL_INFOA
    initiator_name : CHAR[256]*
    initiator_port_number : UInt32
    symbolic_name : CHAR[256]*
    address : CHAR[256]*
    socket : UInt16
  end
  struct ISCSI_TARGET_PORTAL_INFO_EXW
    initiator_name : Char[256]*
    initiator_port_number : UInt32
    symbolic_name : Char[256]*
    address : Char[256]*
    socket : UInt16
    security_flags : UInt64
    login_options : ISCSI_LOGIN_OPTIONS
  end
  struct ISCSI_TARGET_PORTAL_INFO_EXA
    initiator_name : CHAR[256]*
    initiator_port_number : UInt32
    symbolic_name : CHAR[256]*
    address : CHAR[256]*
    socket : UInt16
    security_flags : UInt64
    login_options : ISCSI_LOGIN_OPTIONS
  end
  struct ISCSI_TARGET_PORTAL_GROUPW
    count : UInt32
    portals : ISCSI_TARGET_PORTALW[0]*
  end
  struct ISCSI_TARGET_PORTAL_GROUPA
    count : UInt32
    portals : ISCSI_TARGET_PORTALA[0]*
  end
  struct ISCSI_CONNECTION_INFOW
    connection_id : ISCSI_UNIQUE_SESSION_ID
    initiator_address : LibC::LPWSTR
    target_address : LibC::LPWSTR
    initiator_socket : UInt16
    target_socket : UInt16
    cid : UInt8[2]*
  end
  struct ISCSI_SESSION_INFOW
    session_id : ISCSI_UNIQUE_SESSION_ID
    initiator_name : LibC::LPWSTR
    target_node_name : LibC::LPWSTR
    target_name : LibC::LPWSTR
    isid : UInt8[6]*
    tsid : UInt8[2]*
    connection_count : UInt32
    connections : ISCSI_CONNECTION_INFOW*
  end
  struct ISCSI_CONNECTION_INFOA
    connection_id : ISCSI_UNIQUE_SESSION_ID
    initiator_address : PSTR
    target_address : PSTR
    initiator_socket : UInt16
    target_socket : UInt16
    cid : UInt8[2]*
  end
  struct ISCSI_SESSION_INFOA
    session_id : ISCSI_UNIQUE_SESSION_ID
    initiator_name : PSTR
    target_node_name : PSTR
    target_name : PSTR
    isid : UInt8[6]*
    tsid : UInt8[2]*
    connection_count : UInt32
    connections : ISCSI_CONNECTION_INFOA*
  end
  struct ISCSI_CONNECTION_INFO_EX
    connection_id : ISCSI_UNIQUE_SESSION_ID
    state : UInt8
    protocol : UInt8
    header_digest : UInt8
    data_digest : UInt8
    max_recv_data_segment_length : UInt32
    auth_type : ISCSI_AUTH_TYPES
    estimated_throughput : UInt64
    max_datagram_size : UInt32
  end
  struct ISCSI_SESSION_INFO_EX
    session_id : ISCSI_UNIQUE_SESSION_ID
    initial_r2t : BOOLEAN
    immediate_data : BOOLEAN
    type : UInt8
    data_sequence_in_order : BOOLEAN
    data_pdu_in_order : BOOLEAN
    error_recovery_level : UInt8
    max_outstanding_r2t : UInt32
    first_burst_length : UInt32
    max_burst_length : UInt32
    maximum_connections : UInt32
    connection_count : UInt32
    connections : ISCSI_CONNECTION_INFO_EX*
  end
  struct ISCSI_DEVICE_ON_SESSIONW
    initiator_name : Char[256]*
    target_name : Char[224]*
    scsi_address : SCSI_ADDRESS
    device_interface_type : Guid
    device_interface_name : Char[260]*
    legacy_name : Char[260]*
    storage_device_number : STORAGE_DEVICE_NUMBER
    device_instance : UInt32
  end
  struct ISCSI_DEVICE_ON_SESSIONA
    initiator_name : CHAR[256]*
    target_name : CHAR[224]*
    scsi_address : SCSI_ADDRESS
    device_interface_type : Guid
    device_interface_name : CHAR[260]*
    legacy_name : CHAR[260]*
    storage_device_number : STORAGE_DEVICE_NUMBER
    device_instance : UInt32
  end
  struct PERSISTENT_ISCSI_LOGIN_INFOW
    target_name : Char[224]*
    is_informational_session : BOOLEAN
    initiator_instance : Char[256]*
    initiator_port_number : UInt32
    target_portal : ISCSI_TARGET_PORTALW
    security_flags : UInt64
    mappings : ISCSI_TARGET_MAPPINGW*
    login_options : ISCSI_LOGIN_OPTIONS
  end
  struct PERSISTENT_ISCSI_LOGIN_INFOA
    target_name : CHAR[224]*
    is_informational_session : BOOLEAN
    initiator_instance : CHAR[256]*
    initiator_port_number : UInt32
    target_portal : ISCSI_TARGET_PORTALA
    security_flags : UInt64
    mappings : ISCSI_TARGET_MAPPINGA*
    login_options : ISCSI_LOGIN_OPTIONS
  end
  struct ISCSI_VERSION_INFO
    major_version : UInt32
    minor_version : UInt32
    build_number : UInt32
  end


  # Params # versioninfo : ISCSI_VERSION_INFO* [In]
  fun GetIScsiVersionInformation(versioninfo : ISCSI_VERSION_INFO*) : UInt32

  # Params # targetname : LibC::LPWSTR [In],discoverymechanism : LibC::LPWSTR [In],infoclass : TARGET_INFORMATION_CLASS [In],buffersize : UInt32* [In],buffer : Void* [In]
  fun GetIScsiTargetInformationW(targetname : LibC::LPWSTR, discoverymechanism : LibC::LPWSTR, infoclass : TARGET_INFORMATION_CLASS, buffersize : UInt32*, buffer : Void*) : UInt32

  # Params # targetname : PSTR [In],discoverymechanism : PSTR [In],infoclass : TARGET_INFORMATION_CLASS [In],buffersize : UInt32* [In],buffer : Void* [In]
  fun GetIScsiTargetInformationA(targetname : PSTR, discoverymechanism : PSTR, infoclass : TARGET_INFORMATION_CLASS, buffersize : UInt32*, buffer : Void*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],reserved : Void* [In],initiatorportnumber : UInt32 [In],targetportal : ISCSI_TARGET_PORTALW* [In],securityflags : UInt64 [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],keysize : UInt32 [In],key : UInt8* [In],connectionid : ISCSI_UNIQUE_SESSION_ID* [In]
  fun AddIScsiConnectionW(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, reserved : Void*, initiatorportnumber : UInt32, targetportal : ISCSI_TARGET_PORTALW*, securityflags : UInt64, loginoptions : ISCSI_LOGIN_OPTIONS*, keysize : UInt32, key : UInt8*, connectionid : ISCSI_UNIQUE_SESSION_ID*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],reserved : Void* [In],initiatorportnumber : UInt32 [In],targetportal : ISCSI_TARGET_PORTALA* [In],securityflags : UInt64 [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],keysize : UInt32 [In],key : UInt8* [In],connectionid : ISCSI_UNIQUE_SESSION_ID* [In]
  fun AddIScsiConnectionA(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, reserved : Void*, initiatorportnumber : UInt32, targetportal : ISCSI_TARGET_PORTALA*, securityflags : UInt64, loginoptions : ISCSI_LOGIN_OPTIONS*, keysize : UInt32, key : UInt8*, connectionid : ISCSI_UNIQUE_SESSION_ID*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],connectionid : ISCSI_UNIQUE_SESSION_ID* [In]
  fun RemoveIScsiConnection(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, connectionid : ISCSI_UNIQUE_SESSION_ID*) : UInt32

  # Params # forceupdate : BOOLEAN [In],buffersize : UInt32* [In],buffer : Char* [In]
  fun ReportIScsiTargetsW(forceupdate : BOOLEAN, buffersize : UInt32*, buffer : Char*) : UInt32

  # Params # forceupdate : BOOLEAN [In],buffersize : UInt32* [In],buffer : UInt8* [In]
  fun ReportIScsiTargetsA(forceupdate : BOOLEAN, buffersize : UInt32*, buffer : UInt8*) : UInt32

  # Params # targetname : LibC::LPWSTR [In],targetalias : LibC::LPWSTR [In],targetflags : UInt32 [In],persist : BOOLEAN [In],mappings : ISCSI_TARGET_MAPPINGW* [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],portalgroup : ISCSI_TARGET_PORTAL_GROUPW* [In]
  fun AddIScsiStaticTargetW(targetname : LibC::LPWSTR, targetalias : LibC::LPWSTR, targetflags : UInt32, persist : BOOLEAN, mappings : ISCSI_TARGET_MAPPINGW*, loginoptions : ISCSI_LOGIN_OPTIONS*, portalgroup : ISCSI_TARGET_PORTAL_GROUPW*) : UInt32

  # Params # targetname : PSTR [In],targetalias : PSTR [In],targetflags : UInt32 [In],persist : BOOLEAN [In],mappings : ISCSI_TARGET_MAPPINGA* [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],portalgroup : ISCSI_TARGET_PORTAL_GROUPA* [In]
  fun AddIScsiStaticTargetA(targetname : PSTR, targetalias : PSTR, targetflags : UInt32, persist : BOOLEAN, mappings : ISCSI_TARGET_MAPPINGA*, loginoptions : ISCSI_LOGIN_OPTIONS*, portalgroup : ISCSI_TARGET_PORTAL_GROUPA*) : UInt32

  # Params # targetname : LibC::LPWSTR [In]
  fun RemoveIScsiStaticTargetW(targetname : LibC::LPWSTR) : UInt32

  # Params # targetname : PSTR [In]
  fun RemoveIScsiStaticTargetA(targetname : PSTR) : UInt32

  # Params # initiatorinstance : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],securityflags : UInt64 [In],portal : ISCSI_TARGET_PORTALW* [In]
  fun AddIScsiSendTargetPortalW(initiatorinstance : LibC::LPWSTR, initiatorportnumber : UInt32, loginoptions : ISCSI_LOGIN_OPTIONS*, securityflags : UInt64, portal : ISCSI_TARGET_PORTALW*) : UInt32

  # Params # initiatorinstance : PSTR [In],initiatorportnumber : UInt32 [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],securityflags : UInt64 [In],portal : ISCSI_TARGET_PORTALA* [In]
  fun AddIScsiSendTargetPortalA(initiatorinstance : PSTR, initiatorportnumber : UInt32, loginoptions : ISCSI_LOGIN_OPTIONS*, securityflags : UInt64, portal : ISCSI_TARGET_PORTALA*) : UInt32

  # Params # initiatorinstance : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],portal : ISCSI_TARGET_PORTALW* [In]
  fun RemoveIScsiSendTargetPortalW(initiatorinstance : LibC::LPWSTR, initiatorportnumber : UInt32, portal : ISCSI_TARGET_PORTALW*) : UInt32

  # Params # initiatorinstance : PSTR [In],initiatorportnumber : UInt32 [In],portal : ISCSI_TARGET_PORTALA* [In]
  fun RemoveIScsiSendTargetPortalA(initiatorinstance : PSTR, initiatorportnumber : UInt32, portal : ISCSI_TARGET_PORTALA*) : UInt32

  # Params # initiatorinstance : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],portal : ISCSI_TARGET_PORTALW* [In]
  fun RefreshIScsiSendTargetPortalW(initiatorinstance : LibC::LPWSTR, initiatorportnumber : UInt32, portal : ISCSI_TARGET_PORTALW*) : UInt32

  # Params # initiatorinstance : PSTR [In],initiatorportnumber : UInt32 [In],portal : ISCSI_TARGET_PORTALA* [In]
  fun RefreshIScsiSendTargetPortalA(initiatorinstance : PSTR, initiatorportnumber : UInt32, portal : ISCSI_TARGET_PORTALA*) : UInt32

  # Params # portalcount : UInt32* [In],portalinfo : ISCSI_TARGET_PORTAL_INFOW* [In]
  fun ReportIScsiSendTargetPortalsW(portalcount : UInt32*, portalinfo : ISCSI_TARGET_PORTAL_INFOW*) : UInt32

  # Params # portalcount : UInt32* [In],portalinfo : ISCSI_TARGET_PORTAL_INFOA* [In]
  fun ReportIScsiSendTargetPortalsA(portalcount : UInt32*, portalinfo : ISCSI_TARGET_PORTAL_INFOA*) : UInt32

  # Params # portalcount : UInt32* [In],portalinfosize : UInt32* [In],portalinfo : ISCSI_TARGET_PORTAL_INFO_EXW* [In]
  fun ReportIScsiSendTargetPortalsExW(portalcount : UInt32*, portalinfosize : UInt32*, portalinfo : ISCSI_TARGET_PORTAL_INFO_EXW*) : UInt32

  # Params # portalcount : UInt32* [In],portalinfosize : UInt32* [In],portalinfo : ISCSI_TARGET_PORTAL_INFO_EXA* [In]
  fun ReportIScsiSendTargetPortalsExA(portalcount : UInt32*, portalinfosize : UInt32*, portalinfo : ISCSI_TARGET_PORTAL_INFO_EXA*) : UInt32

  # Params # targetname : LibC::LPWSTR [In],isinformationalsession : BOOLEAN [In],initiatorinstance : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],targetportal : ISCSI_TARGET_PORTALW* [In],securityflags : UInt64 [In],mappings : ISCSI_TARGET_MAPPINGW* [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],keysize : UInt32 [In],key : UInt8* [In],ispersistent : BOOLEAN [In],uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],uniqueconnectionid : ISCSI_UNIQUE_SESSION_ID* [In]
  fun LoginIScsiTargetW(targetname : LibC::LPWSTR, isinformationalsession : BOOLEAN, initiatorinstance : LibC::LPWSTR, initiatorportnumber : UInt32, targetportal : ISCSI_TARGET_PORTALW*, securityflags : UInt64, mappings : ISCSI_TARGET_MAPPINGW*, loginoptions : ISCSI_LOGIN_OPTIONS*, keysize : UInt32, key : UInt8*, ispersistent : BOOLEAN, uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, uniqueconnectionid : ISCSI_UNIQUE_SESSION_ID*) : UInt32

  # Params # targetname : PSTR [In],isinformationalsession : BOOLEAN [In],initiatorinstance : PSTR [In],initiatorportnumber : UInt32 [In],targetportal : ISCSI_TARGET_PORTALA* [In],securityflags : UInt64 [In],mappings : ISCSI_TARGET_MAPPINGA* [In],loginoptions : ISCSI_LOGIN_OPTIONS* [In],keysize : UInt32 [In],key : UInt8* [In],ispersistent : BOOLEAN [In],uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],uniqueconnectionid : ISCSI_UNIQUE_SESSION_ID* [In]
  fun LoginIScsiTargetA(targetname : PSTR, isinformationalsession : BOOLEAN, initiatorinstance : PSTR, initiatorportnumber : UInt32, targetportal : ISCSI_TARGET_PORTALA*, securityflags : UInt64, mappings : ISCSI_TARGET_MAPPINGA*, loginoptions : ISCSI_LOGIN_OPTIONS*, keysize : UInt32, key : UInt8*, ispersistent : BOOLEAN, uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, uniqueconnectionid : ISCSI_UNIQUE_SESSION_ID*) : UInt32

  # Params # count : UInt32* [In],persistentlogininfo : PERSISTENT_ISCSI_LOGIN_INFOW* [In],buffersizeinbytes : UInt32* [In]
  fun ReportIScsiPersistentLoginsW(count : UInt32*, persistentlogininfo : PERSISTENT_ISCSI_LOGIN_INFOW*, buffersizeinbytes : UInt32*) : UInt32

  # Params # count : UInt32* [In],persistentlogininfo : PERSISTENT_ISCSI_LOGIN_INFOA* [In],buffersizeinbytes : UInt32* [In]
  fun ReportIScsiPersistentLoginsA(count : UInt32*, persistentlogininfo : PERSISTENT_ISCSI_LOGIN_INFOA*, buffersizeinbytes : UInt32*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In]
  fun LogoutIScsiTarget(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*) : UInt32

  # Params # initiatorinstance : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],targetname : LibC::LPWSTR [In],portal : ISCSI_TARGET_PORTALW* [In]
  fun RemoveIScsiPersistentTargetW(initiatorinstance : LibC::LPWSTR, initiatorportnumber : UInt32, targetname : LibC::LPWSTR, portal : ISCSI_TARGET_PORTALW*) : UInt32

  # Params # initiatorinstance : PSTR [In],initiatorportnumber : UInt32 [In],targetname : PSTR [In],portal : ISCSI_TARGET_PORTALA* [In]
  fun RemoveIScsiPersistentTargetA(initiatorinstance : PSTR, initiatorportnumber : UInt32, targetname : PSTR, portal : ISCSI_TARGET_PORTALA*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],lun : UInt64 [In],evpdcmddt : UInt8 [In],pagecode : UInt8 [In],scsistatus : UInt8* [In],responsesize : UInt32* [In],responsebuffer : UInt8* [In],sensesize : UInt32* [In],sensebuffer : UInt8* [In]
  fun SendScsiInquiry(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, lun : UInt64, evpdcmddt : UInt8, pagecode : UInt8, scsistatus : UInt8*, responsesize : UInt32*, responsebuffer : UInt8*, sensesize : UInt32*, sensebuffer : UInt8*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],lun : UInt64 [In],scsistatus : UInt8* [In],responsesize : UInt32* [In],responsebuffer : UInt8* [In],sensesize : UInt32* [In],sensebuffer : UInt8* [In]
  fun SendScsiReadCapacity(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, lun : UInt64, scsistatus : UInt8*, responsesize : UInt32*, responsebuffer : UInt8*, sensesize : UInt32*, sensebuffer : UInt8*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],scsistatus : UInt8* [In],responsesize : UInt32* [In],responsebuffer : UInt8* [In],sensesize : UInt32* [In],sensebuffer : UInt8* [In]
  fun SendScsiReportLuns(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, scsistatus : UInt8*, responsesize : UInt32*, responsebuffer : UInt8*, sensesize : UInt32*, sensebuffer : UInt8*) : UInt32

  # Params # buffersize : UInt32* [In],buffer : Char* [In]
  fun ReportIScsiInitiatorListW(buffersize : UInt32*, buffer : Char*) : UInt32

  # Params # buffersize : UInt32* [In],buffer : UInt8* [In]
  fun ReportIScsiInitiatorListA(buffersize : UInt32*, buffer : UInt8*) : UInt32

  # Params # buffersize : UInt32* [In],mappingcount : UInt32* [In],mappings : ISCSI_TARGET_MAPPINGW* [In]
  fun ReportActiveIScsiTargetMappingsW(buffersize : UInt32*, mappingcount : UInt32*, mappings : ISCSI_TARGET_MAPPINGW*) : UInt32

  # Params # buffersize : UInt32* [In],mappingcount : UInt32* [In],mappings : ISCSI_TARGET_MAPPINGA* [In]
  fun ReportActiveIScsiTargetMappingsA(buffersize : UInt32*, mappingcount : UInt32*, mappings : ISCSI_TARGET_MAPPINGA*) : UInt32

  # Params # initiatorname : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],destinationaddress : LibC::LPWSTR [In],outermodeaddress : LibC::LPWSTR [In],persist : BOOLEAN [In]
  fun SetIScsiTunnelModeOuterAddressW(initiatorname : LibC::LPWSTR, initiatorportnumber : UInt32, destinationaddress : LibC::LPWSTR, outermodeaddress : LibC::LPWSTR, persist : BOOLEAN) : UInt32

  # Params # initiatorname : PSTR [In],initiatorportnumber : UInt32 [In],destinationaddress : PSTR [In],outermodeaddress : PSTR [In],persist : BOOLEAN [In]
  fun SetIScsiTunnelModeOuterAddressA(initiatorname : PSTR, initiatorportnumber : UInt32, destinationaddress : PSTR, outermodeaddress : PSTR, persist : BOOLEAN) : UInt32

  # Params # initiatorname : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],authinfo : IKE_AUTHENTICATION_INFORMATION* [In],persist : BOOLEAN [In]
  fun SetIScsiIKEInfoW(initiatorname : LibC::LPWSTR, initiatorportnumber : UInt32, authinfo : IKE_AUTHENTICATION_INFORMATION*, persist : BOOLEAN) : UInt32

  # Params # initiatorname : PSTR [In],initiatorportnumber : UInt32 [In],authinfo : IKE_AUTHENTICATION_INFORMATION* [In],persist : BOOLEAN [In]
  fun SetIScsiIKEInfoA(initiatorname : PSTR, initiatorportnumber : UInt32, authinfo : IKE_AUTHENTICATION_INFORMATION*, persist : BOOLEAN) : UInt32

  # Params # initiatorname : LibC::LPWSTR [In],initiatorportnumber : UInt32 [In],reserved : UInt32* [In],authinfo : IKE_AUTHENTICATION_INFORMATION* [In]
  fun GetIScsiIKEInfoW(initiatorname : LibC::LPWSTR, initiatorportnumber : UInt32, reserved : UInt32*, authinfo : IKE_AUTHENTICATION_INFORMATION*) : UInt32

  # Params # initiatorname : PSTR [In],initiatorportnumber : UInt32 [In],reserved : UInt32* [In],authinfo : IKE_AUTHENTICATION_INFORMATION* [In]
  fun GetIScsiIKEInfoA(initiatorname : PSTR, initiatorportnumber : UInt32, reserved : UInt32*, authinfo : IKE_AUTHENTICATION_INFORMATION*) : UInt32

  # Params # keylength : UInt32 [In],key : UInt8* [In],persist : BOOLEAN [In]
  fun SetIScsiGroupPresharedKey(keylength : UInt32, key : UInt8*, persist : BOOLEAN) : UInt32

  # Params # sharedsecretlength : UInt32 [In],sharedsecret : UInt8* [In]
  fun SetIScsiInitiatorCHAPSharedSecret(sharedsecretlength : UInt32, sharedsecret : UInt8*) : UInt32

  # Params # sharedsecretlength : UInt32 [In],sharedsecret : UInt8* [In]
  fun SetIScsiInitiatorRADIUSSharedSecret(sharedsecretlength : UInt32, sharedsecret : UInt8*) : UInt32

  # Params # initiatornodename : LibC::LPWSTR [In]
  fun SetIScsiInitiatorNodeNameW(initiatornodename : LibC::LPWSTR) : UInt32

  # Params # initiatornodename : PSTR [In]
  fun SetIScsiInitiatorNodeNameA(initiatornodename : PSTR) : UInt32

  # Params # initiatornodename : LibC::LPWSTR [In]
  fun GetIScsiInitiatorNodeNameW(initiatornodename : LibC::LPWSTR) : UInt32

  # Params # initiatornodename : PSTR [In]
  fun GetIScsiInitiatorNodeNameA(initiatornodename : PSTR) : UInt32

  # Params # address : LibC::LPWSTR [In]
  fun AddISNSServerW(address : LibC::LPWSTR) : UInt32

  # Params # address : PSTR [In]
  fun AddISNSServerA(address : PSTR) : UInt32

  # Params # address : LibC::LPWSTR [In]
  fun RemoveISNSServerW(address : LibC::LPWSTR) : UInt32

  # Params # address : PSTR [In]
  fun RemoveISNSServerA(address : PSTR) : UInt32

  # Params # address : LibC::LPWSTR [In]
  fun RefreshISNSServerW(address : LibC::LPWSTR) : UInt32

  # Params # address : PSTR [In]
  fun RefreshISNSServerA(address : PSTR) : UInt32

  # Params # buffersizeinchar : UInt32* [In],buffer : Char* [In]
  fun ReportISNSServerListW(buffersizeinchar : UInt32*, buffer : Char*) : UInt32

  # Params # buffersizeinchar : UInt32* [In],buffer : UInt8* [In]
  fun ReportISNSServerListA(buffersizeinchar : UInt32*, buffer : UInt8*) : UInt32

  # Params # buffersize : UInt32* [In],sessioncount : UInt32* [In],sessioninfo : ISCSI_SESSION_INFOW* [In]
  fun GetIScsiSessionListW(buffersize : UInt32*, sessioncount : UInt32*, sessioninfo : ISCSI_SESSION_INFOW*) : UInt32

  # Params # buffersize : UInt32* [In],sessioncount : UInt32* [In],sessioninfo : ISCSI_SESSION_INFOA* [In]
  fun GetIScsiSessionListA(buffersize : UInt32*, sessioncount : UInt32*, sessioninfo : ISCSI_SESSION_INFOA*) : UInt32

  # Params # buffersize : UInt32* [In],sessioncountptr : UInt32* [In],sessioninfo : ISCSI_SESSION_INFO_EX* [In]
  fun GetIScsiSessionListEx(buffersize : UInt32*, sessioncountptr : UInt32*, sessioninfo : ISCSI_SESSION_INFO_EX*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],devicecount : UInt32* [In],devices : ISCSI_DEVICE_ON_SESSIONW* [In]
  fun GetDevicesForIScsiSessionW(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, devicecount : UInt32*, devices : ISCSI_DEVICE_ON_SESSIONW*) : UInt32

  # Params # uniquesessionid : ISCSI_UNIQUE_SESSION_ID* [In],devicecount : UInt32* [In],devices : ISCSI_DEVICE_ON_SESSIONA* [In]
  fun GetDevicesForIScsiSessionA(uniquesessionid : ISCSI_UNIQUE_SESSION_ID*, devicecount : UInt32*, devices : ISCSI_DEVICE_ON_SESSIONA*) : UInt32

  # Params # 
  fun SetupPersistentIScsiVolumes : UInt32

  # Params # 
  fun SetupPersistentIScsiDevices : UInt32

  # Params # devicepath : LibC::LPWSTR [In]
  fun AddPersistentIScsiDeviceW(devicepath : LibC::LPWSTR) : UInt32

  # Params # devicepath : PSTR [In]
  fun AddPersistentIScsiDeviceA(devicepath : PSTR) : UInt32

  # Params # devicepath : LibC::LPWSTR [In]
  fun RemovePersistentIScsiDeviceW(devicepath : LibC::LPWSTR) : UInt32

  # Params # devicepath : PSTR [In]
  fun RemovePersistentIScsiDeviceA(devicepath : PSTR) : UInt32

  # Params # 
  fun ClearPersistentIScsiDevices : UInt32

  # Params # buffersizeinchar : UInt32* [In],buffer : Char* [In]
  fun ReportPersistentIScsiDevicesW(buffersizeinchar : UInt32*, buffer : Char*) : UInt32

  # Params # buffersizeinchar : UInt32* [In],buffer : UInt8* [In]
  fun ReportPersistentIScsiDevicesA(buffersizeinchar : UInt32*, buffer : UInt8*) : UInt32

  # Params # initiatorname : LibC::LPWSTR [In],targetname : LibC::LPWSTR [In],targetportaltag : UInt16* [In],elementcount : UInt32* [In],portals : ISCSI_TARGET_PORTALW* [In]
  fun ReportIScsiTargetPortalsW(initiatorname : LibC::LPWSTR, targetname : LibC::LPWSTR, targetportaltag : UInt16*, elementcount : UInt32*, portals : ISCSI_TARGET_PORTALW*) : UInt32

  # Params # initiatorname : PSTR [In],targetname : PSTR [In],targetportaltag : UInt16* [In],elementcount : UInt32* [In],portals : ISCSI_TARGET_PORTALA* [In]
  fun ReportIScsiTargetPortalsA(initiatorname : PSTR, targetname : PSTR, targetportaltag : UInt16*, elementcount : UInt32*, portals : ISCSI_TARGET_PORTALA*) : UInt32

  # Params # address : LibC::LPWSTR [In]
  fun AddRadiusServerW(address : LibC::LPWSTR) : UInt32

  # Params # address : PSTR [In]
  fun AddRadiusServerA(address : PSTR) : UInt32

  # Params # address : LibC::LPWSTR [In]
  fun RemoveRadiusServerW(address : LibC::LPWSTR) : UInt32

  # Params # address : PSTR [In]
  fun RemoveRadiusServerA(address : PSTR) : UInt32

  # Params # buffersizeinchar : UInt32* [In],buffer : Char* [In]
  fun ReportRadiusServerListW(buffersizeinchar : UInt32*, buffer : Char*) : UInt32

  # Params # buffersizeinchar : UInt32* [In],buffer : UInt8* [In]
  fun ReportRadiusServerListA(buffersizeinchar : UInt32*, buffer : UInt8*) : UInt32
end
