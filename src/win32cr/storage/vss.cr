require "./../system/com.cr"
require "./../foundation.cr"
require "./../data/xml/ms_xml.cr"
require "./virtual_disk_service.cr"

module Win32cr::Storage::Vss
  VSS_ASSOC_NO_MAX_SPACE = -1_i32
  VSS_ASSOC_REMOVE = 0_u32
  VSS_E_BAD_STATE = -2147212543_i32
  VSS_E_UNEXPECTED = -2147212542_i32
  VSS_E_PROVIDER_ALREADY_REGISTERED = -2147212541_i32
  VSS_E_PROVIDER_NOT_REGISTERED = -2147212540_i32
  VSS_E_PROVIDER_VETO = -2147212538_i32
  VSS_E_PROVIDER_IN_USE = -2147212537_i32
  VSS_E_OBJECT_NOT_FOUND = -2147212536_i32
  VSS_S_ASYNC_PENDING = 271113_i32
  VSS_S_ASYNC_FINISHED = 271114_i32
  VSS_S_ASYNC_CANCELLED = 271115_i32
  VSS_E_VOLUME_NOT_SUPPORTED = -2147212532_i32
  VSS_E_VOLUME_NOT_SUPPORTED_BY_PROVIDER = -2147212530_i32
  VSS_E_OBJECT_ALREADY_EXISTS = -2147212531_i32
  VSS_E_UNEXPECTED_PROVIDER_ERROR = -2147212529_i32
  VSS_E_CORRUPT_XML_DOCUMENT = -2147212528_i32
  VSS_E_INVALID_XML_DOCUMENT = -2147212527_i32
  VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED = -2147212526_i32
  VSS_E_FLUSH_WRITES_TIMEOUT = -2147212525_i32
  VSS_E_HOLD_WRITES_TIMEOUT = -2147212524_i32
  VSS_E_UNEXPECTED_WRITER_ERROR = -2147212523_i32
  VSS_E_SNAPSHOT_SET_IN_PROGRESS = -2147212522_i32
  VSS_E_MAXIMUM_NUMBER_OF_SNAPSHOTS_REACHED = -2147212521_i32
  VSS_E_WRITER_INFRASTRUCTURE = -2147212520_i32
  VSS_E_WRITER_NOT_RESPONDING = -2147212519_i32
  VSS_E_WRITER_ALREADY_SUBSCRIBED = -2147212518_i32
  VSS_E_UNSUPPORTED_CONTEXT = -2147212517_i32
  VSS_E_VOLUME_IN_USE = -2147212515_i32
  VSS_E_MAXIMUM_DIFFAREA_ASSOCIATIONS_REACHED = -2147212514_i32
  VSS_E_INSUFFICIENT_STORAGE = -2147212513_i32
  VSS_E_NO_SNAPSHOTS_IMPORTED = -2147212512_i32
  VSS_S_SOME_SNAPSHOTS_NOT_IMPORTED = 271137_i32
  VSS_E_SOME_SNAPSHOTS_NOT_IMPORTED = -2147212511_i32
  VSS_E_MAXIMUM_NUMBER_OF_REMOTE_MACHINES_REACHED = -2147212510_i32
  VSS_E_REMOTE_SERVER_UNAVAILABLE = -2147212509_i32
  VSS_E_REMOTE_SERVER_UNSUPPORTED = -2147212508_i32
  VSS_E_REVERT_IN_PROGRESS = -2147212507_i32
  VSS_E_REVERT_VOLUME_LOST = -2147212506_i32
  VSS_E_REBOOT_REQUIRED = -2147212505_i32
  VSS_E_TRANSACTION_FREEZE_TIMEOUT = -2147212504_i32
  VSS_E_TRANSACTION_THAW_TIMEOUT = -2147212503_i32
  VSS_E_VOLUME_NOT_LOCAL = -2147212499_i32
  VSS_E_CLUSTER_TIMEOUT = -2147212498_i32
  VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT = -2147212304_i32
  VSS_E_WRITERERROR_OUTOFRESOURCES = -2147212303_i32
  VSS_E_WRITERERROR_TIMEOUT = -2147212302_i32
  VSS_E_WRITERERROR_RETRYABLE = -2147212301_i32
  VSS_E_WRITERERROR_NONRETRYABLE = -2147212300_i32
  VSS_E_WRITERERROR_RECOVERY_FAILED = -2147212299_i32
  VSS_E_BREAK_REVERT_ID_FAILED = -2147212298_i32
  VSS_E_LEGACY_PROVIDER = -2147212297_i32
  VSS_E_MISSING_DISK = -2147212296_i32
  VSS_E_MISSING_HIDDEN_VOLUME = -2147212295_i32
  VSS_E_MISSING_VOLUME = -2147212294_i32
  VSS_E_AUTORECOVERY_FAILED = -2147212293_i32
  VSS_E_DYNAMIC_DISK_ERROR = -2147212292_i32
  VSS_E_NONTRANSPORTABLE_BCD = -2147212291_i32
  VSS_E_CANNOT_REVERT_DISKID = -2147212290_i32
  VSS_E_RESYNC_IN_PROGRESS = -2147212289_i32
  VSS_E_CLUSTER_ERROR = -2147212288_i32
  VSS_E_UNSELECTED_VOLUME = -2147212502_i32
  VSS_E_SNAPSHOT_NOT_IN_SET = -2147212501_i32
  VSS_E_NESTED_VOLUME_LIMIT = -2147212500_i32
  VSS_E_NOT_SUPPORTED = -2147212497_i32
  VSS_E_WRITERERROR_PARTIAL_FAILURE = -2147212490_i32
  VSS_E_ASRERROR_DISK_ASSIGNMENT_FAILED = -2147212287_i32
  VSS_E_ASRERROR_DISK_RECREATION_FAILED = -2147212286_i32
  VSS_E_ASRERROR_NO_ARCPATH = -2147212285_i32
  VSS_E_ASRERROR_MISSING_DYNDISK = -2147212284_i32
  VSS_E_ASRERROR_SHARED_CRIDISK = -2147212283_i32
  VSS_E_ASRERROR_DATADISK_RDISK0 = -2147212282_i32
  VSS_E_ASRERROR_RDISK0_TOOSMALL = -2147212281_i32
  VSS_E_ASRERROR_CRITICAL_DISKS_TOO_SMALL = -2147212280_i32
  VSS_E_WRITER_STATUS_NOT_AVAILABLE = -2147212279_i32
  VSS_E_ASRERROR_DYNAMIC_VHD_NOT_SUPPORTED = -2147212278_i32
  VSS_E_CRITICAL_VOLUME_ON_INVALID_DISK = -2147212271_i32
  VSS_E_ASRERROR_RDISK_FOR_SYSTEM_DISK_NOT_FOUND = -2147212270_i32
  VSS_E_ASRERROR_NO_PHYSICAL_DISK_AVAILABLE = -2147212269_i32
  VSS_E_ASRERROR_FIXED_PHYSICAL_DISK_AVAILABLE_AFTER_DISK_EXCLUSION = -2147212268_i32
  VSS_E_ASRERROR_CRITICAL_DISK_CANNOT_BE_EXCLUDED = -2147212267_i32
  VSS_E_ASRERROR_SYSTEM_PARTITION_HIDDEN = -2147212266_i32
  VSS_E_FSS_TIMEOUT = -2147212265_i32

  CLSID_VssSnapshotMgmt = LibC::GUID.new(0xb5a2c52_u32, 0x3eb9_u16, 0x470a_u16, StaticArray[0x96_u8, 0xe2_u8, 0x6c_u8, 0x6d_u8, 0x45_u8, 0x70_u8, 0xe4_u8, 0xf_u8])

  CLSID_VSSCoordinator = LibC::GUID.new(0xe579ab5f_u32, 0x1cc4_u16, 0x44b4_u16, StaticArray[0xbe_u8, 0xd9_u8, 0xde_u8, 0x9_u8, 0x91_u8, 0xff_u8, 0x6_u8, 0x23_u8])

  enum VSS_OBJECT_TYPE
    VSS_OBJECT_UNKNOWN = 0_i32
    VSS_OBJECT_NONE = 1_i32
    VSS_OBJECT_SNAPSHOT_SET = 2_i32
    VSS_OBJECT_SNAPSHOT = 3_i32
    VSS_OBJECT_PROVIDER = 4_i32
    VSS_OBJECT_TYPE_COUNT = 5_i32
  end
  enum VSS_SNAPSHOT_STATE
    VSS_SS_UNKNOWN = 0_i32
    VSS_SS_PREPARING = 1_i32
    VSS_SS_PROCESSING_PREPARE = 2_i32
    VSS_SS_PREPARED = 3_i32
    VSS_SS_PROCESSING_PRECOMMIT = 4_i32
    VSS_SS_PRECOMMITTED = 5_i32
    VSS_SS_PROCESSING_COMMIT = 6_i32
    VSS_SS_COMMITTED = 7_i32
    VSS_SS_PROCESSING_POSTCOMMIT = 8_i32
    VSS_SS_PROCESSING_PREFINALCOMMIT = 9_i32
    VSS_SS_PREFINALCOMMITTED = 10_i32
    VSS_SS_PROCESSING_POSTFINALCOMMIT = 11_i32
    VSS_SS_CREATED = 12_i32
    VSS_SS_ABORTED = 13_i32
    VSS_SS_DELETED = 14_i32
    VSS_SS_POSTCOMMITTED = 15_i32
    VSS_SS_COUNT = 16_i32
  end
  enum VSS_VOLUME_SNAPSHOT_ATTRIBUTES
    VSS_VOLSNAP_ATTR_PERSISTENT = 1_i32
    VSS_VOLSNAP_ATTR_NO_AUTORECOVERY = 2_i32
    VSS_VOLSNAP_ATTR_CLIENT_ACCESSIBLE = 4_i32
    VSS_VOLSNAP_ATTR_NO_AUTO_RELEASE = 8_i32
    VSS_VOLSNAP_ATTR_NO_WRITERS = 16_i32
    VSS_VOLSNAP_ATTR_TRANSPORTABLE = 32_i32
    VSS_VOLSNAP_ATTR_NOT_SURFACED = 64_i32
    VSS_VOLSNAP_ATTR_NOT_TRANSACTED = 128_i32
    VSS_VOLSNAP_ATTR_HARDWARE_ASSISTED = 65536_i32
    VSS_VOLSNAP_ATTR_DIFFERENTIAL = 131072_i32
    VSS_VOLSNAP_ATTR_PLEX = 262144_i32
    VSS_VOLSNAP_ATTR_IMPORTED = 524288_i32
    VSS_VOLSNAP_ATTR_EXPOSED_LOCALLY = 1048576_i32
    VSS_VOLSNAP_ATTR_EXPOSED_REMOTELY = 2097152_i32
    VSS_VOLSNAP_ATTR_AUTORECOVER = 4194304_i32
    VSS_VOLSNAP_ATTR_ROLLBACK_RECOVERY = 8388608_i32
    VSS_VOLSNAP_ATTR_DELAYED_POSTSNAPSHOT = 16777216_i32
    VSS_VOLSNAP_ATTR_TXF_RECOVERY = 33554432_i32
    VSS_VOLSNAP_ATTR_FILE_SHARE = 67108864_i32
  end
  enum VSS_SNAPSHOT_CONTEXT
    VSS_CTX_BACKUP = 0_i32
    VSS_CTX_FILE_SHARE_BACKUP = 16_i32
    VSS_CTX_NAS_ROLLBACK = 25_i32
    VSS_CTX_APP_ROLLBACK = 9_i32
    VSS_CTX_CLIENT_ACCESSIBLE = 29_i32
    VSS_CTX_CLIENT_ACCESSIBLE_WRITERS = 13_i32
    VSS_CTX_ALL = -1_i32
  end
  enum VSS_PROVIDER_CAPABILITIES
    VSS_PRV_CAPABILITY_LEGACY = 1_i32
    VSS_PRV_CAPABILITY_COMPLIANT = 2_i32
    VSS_PRV_CAPABILITY_LUN_REPOINT = 4_i32
    VSS_PRV_CAPABILITY_LUN_RESYNC = 8_i32
    VSS_PRV_CAPABILITY_OFFLINE_CREATION = 16_i32
    VSS_PRV_CAPABILITY_MULTIPLE_IMPORT = 32_i32
    VSS_PRV_CAPABILITY_RECYCLING = 64_i32
    VSS_PRV_CAPABILITY_PLEX = 128_i32
    VSS_PRV_CAPABILITY_DIFFERENTIAL = 256_i32
    VSS_PRV_CAPABILITY_CLUSTERED = 512_i32
  end
  enum VSS_HARDWARE_OPTIONS
    VSS_BREAKEX_FLAG_MASK_LUNS = 1_i32
    VSS_BREAKEX_FLAG_MAKE_READ_WRITE = 2_i32
    VSS_BREAKEX_FLAG_REVERT_IDENTITY_ALL = 4_i32
    VSS_BREAKEX_FLAG_REVERT_IDENTITY_NONE = 8_i32
    VSS_ONLUNSTATECHANGE_NOTIFY_READ_WRITE = 256_i32
    VSS_ONLUNSTATECHANGE_NOTIFY_LUN_PRE_RECOVERY = 512_i32
    VSS_ONLUNSTATECHANGE_NOTIFY_LUN_POST_RECOVERY = 1024_i32
    VSS_ONLUNSTATECHANGE_DO_MASK_LUNS = 2048_i32
  end
  enum VSS_RECOVERY_OPTIONS
    VSS_RECOVERY_REVERT_IDENTITY_ALL = 256_i32
    VSS_RECOVERY_NO_VOLUME_CHECK = 512_i32
  end
  enum VSS_WRITER_STATE
    VSS_WS_UNKNOWN = 0_i32
    VSS_WS_STABLE = 1_i32
    VSS_WS_WAITING_FOR_FREEZE = 2_i32
    VSS_WS_WAITING_FOR_THAW = 3_i32
    VSS_WS_WAITING_FOR_POST_SNAPSHOT = 4_i32
    VSS_WS_WAITING_FOR_BACKUP_COMPLETE = 5_i32
    VSS_WS_FAILED_AT_IDENTIFY = 6_i32
    VSS_WS_FAILED_AT_PREPARE_BACKUP = 7_i32
    VSS_WS_FAILED_AT_PREPARE_SNAPSHOT = 8_i32
    VSS_WS_FAILED_AT_FREEZE = 9_i32
    VSS_WS_FAILED_AT_THAW = 10_i32
    VSS_WS_FAILED_AT_POST_SNAPSHOT = 11_i32
    VSS_WS_FAILED_AT_BACKUP_COMPLETE = 12_i32
    VSS_WS_FAILED_AT_PRE_RESTORE = 13_i32
    VSS_WS_FAILED_AT_POST_RESTORE = 14_i32
    VSS_WS_FAILED_AT_BACKUPSHUTDOWN = 15_i32
    VSS_WS_COUNT = 16_i32
  end
  enum VSS_BACKUP_TYPE
    VSS_BT_UNDEFINED = 0_i32
    VSS_BT_FULL = 1_i32
    VSS_BT_INCREMENTAL = 2_i32
    VSS_BT_DIFFERENTIAL = 3_i32
    VSS_BT_LOG = 4_i32
    VSS_BT_COPY = 5_i32
    VSS_BT_OTHER = 6_i32
  end
  enum VSS_RESTORE_TYPE
    VSS_RTYPE_UNDEFINED = 0_i32
    VSS_RTYPE_BY_COPY = 1_i32
    VSS_RTYPE_IMPORT = 2_i32
    VSS_RTYPE_OTHER = 3_i32
  end
  enum VSS_ROLLFORWARD_TYPE
    VSS_RF_UNDEFINED = 0_i32
    VSS_RF_NONE = 1_i32
    VSS_RF_ALL = 2_i32
    VSS_RF_PARTIAL = 3_i32
  end
  enum VSS_PROVIDER_TYPE
    VSS_PROV_UNKNOWN = 0_i32
    VSS_PROV_SYSTEM = 1_i32
    VSS_PROV_SOFTWARE = 2_i32
    VSS_PROV_HARDWARE = 3_i32
    VSS_PROV_FILESHARE = 4_i32
  end
  enum VSS_APPLICATION_LEVEL
    VSS_APP_UNKNOWN = 0_i32
    VSS_APP_SYSTEM = 1_i32
    VSS_APP_BACK_END = 2_i32
    VSS_APP_FRONT_END = 3_i32
    VSS_APP_SYSTEM_RM = 4_i32
    VSS_APP_AUTO = -1_i32
  end
  enum VSS_SNAPSHOT_COMPATIBILITY
    VSS_SC_DISABLE_DEFRAG = 1_i32
    VSS_SC_DISABLE_CONTENTINDEX = 2_i32
  end
  enum VSS_SNAPSHOT_PROPERTY_ID
    VSS_SPROPID_UNKNOWN = 0_i32
    VSS_SPROPID_SNAPSHOT_ID = 1_i32
    VSS_SPROPID_SNAPSHOT_SET_ID = 2_i32
    VSS_SPROPID_SNAPSHOTS_COUNT = 3_i32
    VSS_SPROPID_SNAPSHOT_DEVICE = 4_i32
    VSS_SPROPID_ORIGINAL_VOLUME = 5_i32
    VSS_SPROPID_ORIGINATING_MACHINE = 6_i32
    VSS_SPROPID_SERVICE_MACHINE = 7_i32
    VSS_SPROPID_EXPOSED_NAME = 8_i32
    VSS_SPROPID_EXPOSED_PATH = 9_i32
    VSS_SPROPID_PROVIDER_ID = 10_i32
    VSS_SPROPID_SNAPSHOT_ATTRIBUTES = 11_i32
    VSS_SPROPID_CREATION_TIMESTAMP = 12_i32
    VSS_SPROPID_STATUS = 13_i32
  end
  enum VSS_FILE_SPEC_BACKUP_TYPE
    VSS_FSBT_FULL_BACKUP_REQUIRED = 1_i32
    VSS_FSBT_DIFFERENTIAL_BACKUP_REQUIRED = 2_i32
    VSS_FSBT_INCREMENTAL_BACKUP_REQUIRED = 4_i32
    VSS_FSBT_LOG_BACKUP_REQUIRED = 8_i32
    VSS_FSBT_FULL_SNAPSHOT_REQUIRED = 256_i32
    VSS_FSBT_DIFFERENTIAL_SNAPSHOT_REQUIRED = 512_i32
    VSS_FSBT_INCREMENTAL_SNAPSHOT_REQUIRED = 1024_i32
    VSS_FSBT_LOG_SNAPSHOT_REQUIRED = 2048_i32
    VSS_FSBT_CREATED_DURING_BACKUP = 65536_i32
    VSS_FSBT_ALL_BACKUP_REQUIRED = 15_i32
    VSS_FSBT_ALL_SNAPSHOT_REQUIRED = 3840_i32
  end
  enum VSS_BACKUP_SCHEMA
    VSS_BS_UNDEFINED = 0_i32
    VSS_BS_DIFFERENTIAL = 1_i32
    VSS_BS_INCREMENTAL = 2_i32
    VSS_BS_EXCLUSIVE_INCREMENTAL_DIFFERENTIAL = 4_i32
    VSS_BS_LOG = 8_i32
    VSS_BS_COPY = 16_i32
    VSS_BS_TIMESTAMPED = 32_i32
    VSS_BS_LAST_MODIFY = 64_i32
    VSS_BS_LSN = 128_i32
    VSS_BS_WRITER_SUPPORTS_NEW_TARGET = 256_i32
    VSS_BS_WRITER_SUPPORTS_RESTORE_WITH_MOVE = 512_i32
    VSS_BS_INDEPENDENT_SYSTEM_STATE = 1024_i32
    VSS_BS_ROLLFORWARD_RESTORE = 4096_i32
    VSS_BS_RESTORE_RENAME = 8192_i32
    VSS_BS_AUTHORITATIVE_RESTORE = 16384_i32
    VSS_BS_WRITER_SUPPORTS_PARALLEL_RESTORES = 32768_i32
  end
  enum VSS_USAGE_TYPE
    VSS_UT_UNDEFINED = 0_i32
    VSS_UT_BOOTABLESYSTEMSTATE = 1_i32
    VSS_UT_SYSTEMSERVICE = 2_i32
    VSS_UT_USERDATA = 3_i32
    VSS_UT_OTHER = 4_i32
  end
  enum VSS_SOURCE_TYPE
    VSS_ST_UNDEFINED = 0_i32
    VSS_ST_TRANSACTEDDB = 1_i32
    VSS_ST_NONTRANSACTEDDB = 2_i32
    VSS_ST_OTHER = 3_i32
  end
  enum VSS_RESTOREMETHOD_ENUM
    VSS_RME_UNDEFINED = 0_i32
    VSS_RME_RESTORE_IF_NOT_THERE = 1_i32
    VSS_RME_RESTORE_IF_CAN_REPLACE = 2_i32
    VSS_RME_STOP_RESTORE_START = 3_i32
    VSS_RME_RESTORE_TO_ALTERNATE_LOCATION = 4_i32
    VSS_RME_RESTORE_AT_REBOOT = 5_i32
    VSS_RME_RESTORE_AT_REBOOT_IF_CANNOT_REPLACE = 6_i32
    VSS_RME_CUSTOM = 7_i32
    VSS_RME_RESTORE_STOP_START = 8_i32
  end
  enum VSS_WRITERRESTORE_ENUM
    VSS_WRE_UNDEFINED = 0_i32
    VSS_WRE_NEVER = 1_i32
    VSS_WRE_IF_REPLACE_FAILS = 2_i32
    VSS_WRE_ALWAYS = 3_i32
  end
  enum VSS_COMPONENT_TYPE
    VSS_CT_UNDEFINED = 0_i32
    VSS_CT_DATABASE = 1_i32
    VSS_CT_FILEGROUP = 2_i32
  end
  enum VSS_ALTERNATE_WRITER_STATE
    VSS_AWS_UNDEFINED = 0_i32
    VSS_AWS_NO_ALTERNATE_WRITER = 1_i32
    VSS_AWS_ALTERNATE_WRITER_EXISTS = 2_i32
    VSS_AWS_THIS_IS_ALTERNATE_WRITER = 3_i32
  end
  enum VSS_SUBSCRIBE_MASK
    VSS_SM_POST_SNAPSHOT_FLAG = 1_i32
    VSS_SM_BACKUP_EVENTS_FLAG = 2_i32
    VSS_SM_RESTORE_EVENTS_FLAG = 4_i32
    VSS_SM_IO_THROTTLING_FLAG = 8_i32
    VSS_SM_ALL_FLAGS = -1_i32
  end
  enum VSS_RESTORE_TARGET
    VSS_RT_UNDEFINED = 0_i32
    VSS_RT_ORIGINAL = 1_i32
    VSS_RT_ALTERNATE = 2_i32
    VSS_RT_DIRECTED = 3_i32
    VSS_RT_ORIGINAL_LOCATION = 4_i32
  end
  enum VSS_FILE_RESTORE_STATUS
    VSS_RS_UNDEFINED = 0_i32
    VSS_RS_NONE = 1_i32
    VSS_RS_ALL = 2_i32
    VSS_RS_FAILED = 3_i32
  end
  enum VSS_COMPONENT_FLAGS
    VSS_CF_BACKUP_RECOVERY = 1_i32
    VSS_CF_APP_ROLLBACK_RECOVERY = 2_i32
    VSS_CF_NOT_SYSTEM_STATE = 4_i32
  end
  enum VSS_MGMT_OBJECT_TYPE
    VSS_MGMT_OBJECT_UNKNOWN = 0_i32
    VSS_MGMT_OBJECT_VOLUME = 1_i32
    VSS_MGMT_OBJECT_DIFF_VOLUME = 2_i32
    VSS_MGMT_OBJECT_DIFF_AREA = 3_i32
  end
  enum VSS_PROTECTION_LEVEL
    VSS_PROTECTION_LEVEL_ORIGINAL_VOLUME = 0_i32
    VSS_PROTECTION_LEVEL_SNAPSHOT = 1_i32
  end
  enum VSS_PROTECTION_FAULT
    VSS_PROTECTION_FAULT_NONE = 0_i32
    VSS_PROTECTION_FAULT_DIFF_AREA_MISSING = 1_i32
    VSS_PROTECTION_FAULT_IO_FAILURE_DURING_ONLINE = 2_i32
    VSS_PROTECTION_FAULT_META_DATA_CORRUPTION = 3_i32
    VSS_PROTECTION_FAULT_MEMORY_ALLOCATION_FAILURE = 4_i32
    VSS_PROTECTION_FAULT_MAPPED_MEMORY_FAILURE = 5_i32
    VSS_PROTECTION_FAULT_COW_READ_FAILURE = 6_i32
    VSS_PROTECTION_FAULT_COW_WRITE_FAILURE = 7_i32
    VSS_PROTECTION_FAULT_DIFF_AREA_FULL = 8_i32
    VSS_PROTECTION_FAULT_GROW_TOO_SLOW = 9_i32
    VSS_PROTECTION_FAULT_GROW_FAILED = 10_i32
    VSS_PROTECTION_FAULT_DESTROY_ALL_SNAPSHOTS = 11_i32
    VSS_PROTECTION_FAULT_FILE_SYSTEM_FAILURE = 12_i32
    VSS_PROTECTION_FAULT_IO_FAILURE = 13_i32
    VSS_PROTECTION_FAULT_DIFF_AREA_REMOVED = 14_i32
    VSS_PROTECTION_FAULT_EXTERNAL_WRITER_TO_DIFF_AREA = 15_i32
    VSS_PROTECTION_FAULT_MOUNT_DURING_CLUSTER_OFFLINE = 16_i32
  end

  @[Extern]
  struct VSS_SNAPSHOT_PROP
    property m_SnapshotId : LibC::GUID
    property m_SnapshotSetId : LibC::GUID
    property m_lSnapshotsCount : Int32
    property m_pwszSnapshotDeviceObject : UInt16*
    property m_pwszOriginalVolumeName : UInt16*
    property m_pwszOriginatingMachine : UInt16*
    property m_pwszServiceMachine : UInt16*
    property m_pwszExposedName : UInt16*
    property m_pwszExposedPath : UInt16*
    property m_ProviderId : LibC::GUID
    property m_lSnapshotAttributes : Int32
    property m_tsCreationTimestamp : Int64
    property m_eStatus : Win32cr::Storage::Vss::VSS_SNAPSHOT_STATE
    def initialize(@m_SnapshotId : LibC::GUID, @m_SnapshotSetId : LibC::GUID, @m_lSnapshotsCount : Int32, @m_pwszSnapshotDeviceObject : UInt16*, @m_pwszOriginalVolumeName : UInt16*, @m_pwszOriginatingMachine : UInt16*, @m_pwszServiceMachine : UInt16*, @m_pwszExposedName : UInt16*, @m_pwszExposedPath : UInt16*, @m_ProviderId : LibC::GUID, @m_lSnapshotAttributes : Int32, @m_tsCreationTimestamp : Int64, @m_eStatus : Win32cr::Storage::Vss::VSS_SNAPSHOT_STATE)
    end
  end

  @[Extern]
  struct VSS_PROVIDER_PROP
    property m_ProviderId : LibC::GUID
    property m_pwszProviderName : UInt16*
    property m_eProviderType : Win32cr::Storage::Vss::VSS_PROVIDER_TYPE
    property m_pwszProviderVersion : UInt16*
    property m_ProviderVersionId : LibC::GUID
    property m_ClassId : LibC::GUID
    def initialize(@m_ProviderId : LibC::GUID, @m_pwszProviderName : UInt16*, @m_eProviderType : Win32cr::Storage::Vss::VSS_PROVIDER_TYPE, @m_pwszProviderVersion : UInt16*, @m_ProviderVersionId : LibC::GUID, @m_ClassId : LibC::GUID)
    end
  end

  @[Extern(union: true)]
  struct VSS_OBJECT_UNION
    property snap : Win32cr::Storage::Vss::VSS_SNAPSHOT_PROP
    property prov : Win32cr::Storage::Vss::VSS_PROVIDER_PROP
    def initialize(@snap : Win32cr::Storage::Vss::VSS_SNAPSHOT_PROP, @prov : Win32cr::Storage::Vss::VSS_PROVIDER_PROP)
    end
  end

  @[Extern]
  struct VSS_OBJECT_PROP
    property type__ : Win32cr::Storage::Vss::VSS_OBJECT_TYPE
    property obj : Win32cr::Storage::Vss::VSS_OBJECT_UNION
    def initialize(@type__ : Win32cr::Storage::Vss::VSS_OBJECT_TYPE, @obj : Win32cr::Storage::Vss::VSS_OBJECT_UNION)
    end
  end

  @[Extern]
  struct IVssExamineWriterMetadata
    def initialize()
    end
  end

  @[Extern]
  struct VSS_VOLUME_PROP
    property m_pwszVolumeName : UInt16*
    property m_pwszVolumeDisplayName : UInt16*
    def initialize(@m_pwszVolumeName : UInt16*, @m_pwszVolumeDisplayName : UInt16*)
    end
  end

  @[Extern]
  struct VSS_DIFF_VOLUME_PROP
    property m_pwszVolumeName : UInt16*
    property m_pwszVolumeDisplayName : UInt16*
    property m_llVolumeFreeSpace : Int64
    property m_llVolumeTotalSpace : Int64
    def initialize(@m_pwszVolumeName : UInt16*, @m_pwszVolumeDisplayName : UInt16*, @m_llVolumeFreeSpace : Int64, @m_llVolumeTotalSpace : Int64)
    end
  end

  @[Extern]
  struct VSS_DIFF_AREA_PROP
    property m_pwszVolumeName : UInt16*
    property m_pwszDiffAreaVolumeName : UInt16*
    property m_llMaximumDiffSpace : Int64
    property m_llAllocatedDiffSpace : Int64
    property m_llUsedDiffSpace : Int64
    def initialize(@m_pwszVolumeName : UInt16*, @m_pwszDiffAreaVolumeName : UInt16*, @m_llMaximumDiffSpace : Int64, @m_llAllocatedDiffSpace : Int64, @m_llUsedDiffSpace : Int64)
    end
  end

  @[Extern(union: true)]
  struct VSS_MGMT_OBJECT_UNION
    property vol : Win32cr::Storage::Vss::VSS_VOLUME_PROP
    property diff_vol : Win32cr::Storage::Vss::VSS_DIFF_VOLUME_PROP
    property diff_area : Win32cr::Storage::Vss::VSS_DIFF_AREA_PROP
    def initialize(@vol : Win32cr::Storage::Vss::VSS_VOLUME_PROP, @diff_vol : Win32cr::Storage::Vss::VSS_DIFF_VOLUME_PROP, @diff_area : Win32cr::Storage::Vss::VSS_DIFF_AREA_PROP)
    end
  end

  @[Extern]
  struct VSS_MGMT_OBJECT_PROP
    property type__ : Win32cr::Storage::Vss::VSS_MGMT_OBJECT_TYPE
    property obj : Win32cr::Storage::Vss::VSS_MGMT_OBJECT_UNION
    def initialize(@type__ : Win32cr::Storage::Vss::VSS_MGMT_OBJECT_TYPE, @obj : Win32cr::Storage::Vss::VSS_MGMT_OBJECT_UNION)
    end
  end

  @[Extern]
  struct VSS_VOLUME_PROTECTION_INFO
    property m_protectionLevel : Win32cr::Storage::Vss::VSS_PROTECTION_LEVEL
    property m_volumeIsOfflineForProtection : Win32cr::Foundation::BOOL
    property m_protectionFault : Win32cr::Storage::Vss::VSS_PROTECTION_FAULT
    property m_failureStatus : Int32
    property m_volumeHasUnusedDiffArea : Win32cr::Foundation::BOOL
    property m_reserved : UInt32
    def initialize(@m_protectionLevel : Win32cr::Storage::Vss::VSS_PROTECTION_LEVEL, @m_volumeIsOfflineForProtection : Win32cr::Foundation::BOOL, @m_protectionFault : Win32cr::Storage::Vss::VSS_PROTECTION_FAULT, @m_failureStatus : Int32, @m_volumeHasUnusedDiffArea : Win32cr::Foundation::BOOL, @m_reserved : UInt32)
    end
  end

  @[Extern]
  record IVssEnumObjectVtbl,
    query_interface : Proc(IVssEnumObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssEnumObject*, UInt32),
    release : Proc(IVssEnumObject*, UInt32),
    next__ : Proc(IVssEnumObject*, UInt32, Win32cr::Storage::Vss::VSS_OBJECT_PROP*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IVssEnumObject*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IVssEnumObject*, Win32cr::Foundation::HRESULT),
    clone : Proc(IVssEnumObject*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssEnumObject, lpVtbl : IVssEnumObjectVtbl* do
    GUID = LibC::GUID.new(0xae1c7110_u32, 0x2f60_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x39_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x72_u8, 0xd8_u8, 0xe3_u8])
    def query_interface(this : IVssEnumObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssEnumObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssEnumObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IVssEnumObject*, celt : UInt32, rgelt : Win32cr::Storage::Vss::VSS_OBJECT_PROP*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IVssEnumObject*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IVssEnumObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IVssEnumObject*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IVssAsyncVtbl,
    query_interface : Proc(IVssAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssAsync*, UInt32),
    release : Proc(IVssAsync*, UInt32),
    cancel : Proc(IVssAsync*, Win32cr::Foundation::HRESULT),
    wait : Proc(IVssAsync*, UInt32, Win32cr::Foundation::HRESULT),
    query_status : Proc(IVssAsync*, Win32cr::Foundation::HRESULT*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssAsync, lpVtbl : IVssAsyncVtbl* do
    GUID = LibC::GUID.new(0x507c37b4_u32, 0xcf5b_u16, 0x4e95_u16, StaticArray[0xb0_u8, 0xaf_u8, 0x14_u8, 0xeb_u8, 0x97_u8, 0x67_u8, 0x46_u8, 0x7e_u8])
    def query_interface(this : IVssAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cancel(this : IVssAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def wait(this : IVssAsync*, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, dwMilliseconds)
    end
    def query_status(this : IVssAsync*, pHrResult : Win32cr::Foundation::HRESULT*, pReserved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_status.call(this, pHrResult, pReserved)
    end

  end

  @[Extern]
  record IVssWMFiledescVtbl,
    query_interface : Proc(IVssWMFiledesc*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssWMFiledesc*, UInt32),
    release : Proc(IVssWMFiledesc*, UInt32),
    get_path : Proc(IVssWMFiledesc*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_filespec : Proc(IVssWMFiledesc*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_recursive : Proc(IVssWMFiledesc*, Bool*, Win32cr::Foundation::HRESULT),
    get_alternate_location : Proc(IVssWMFiledesc*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup_type_mask : Proc(IVssWMFiledesc*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssWMFiledesc, lpVtbl : IVssWMFiledescVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IVssWMFiledesc*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssWMFiledesc*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssWMFiledesc*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_path(this : IVssWMFiledesc*, pbstrPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, pbstrPath)
    end
    def get_filespec(this : IVssWMFiledesc*, pbstrFilespec : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filespec.call(this, pbstrFilespec)
    end
    def get_recursive(this : IVssWMFiledesc*, pbRecursive : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recursive.call(this, pbRecursive)
    end
    def get_alternate_location(this : IVssWMFiledesc*, pbstrAlternateLocation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternate_location.call(this, pbstrAlternateLocation)
    end
    def get_backup_type_mask(this : IVssWMFiledesc*, pdwTypeMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_type_mask.call(this, pdwTypeMask)
    end

  end

  @[Extern]
  record IVssWMDependencyVtbl,
    query_interface : Proc(IVssWMDependency*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssWMDependency*, UInt32),
    release : Proc(IVssWMDependency*, UInt32),
    get_writer_id : Proc(IVssWMDependency*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_logical_path : Proc(IVssWMDependency*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_component_name : Proc(IVssWMDependency*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssWMDependency, lpVtbl : IVssWMDependencyVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IVssWMDependency*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssWMDependency*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssWMDependency*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_writer_id(this : IVssWMDependency*, pWriterId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_writer_id.call(this, pWriterId)
    end
    def get_logical_path(this : IVssWMDependency*, pbstrLogicalPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logical_path.call(this, pbstrLogicalPath)
    end
    def get_component_name(this : IVssWMDependency*, pbstrComponentName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_name.call(this, pbstrComponentName)
    end

  end

  @[Extern]
  record IVssComponentVtbl,
    query_interface : Proc(IVssComponent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssComponent*, UInt32),
    release : Proc(IVssComponent*, UInt32),
    get_logical_path : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_component_type : Proc(IVssComponent*, Win32cr::Storage::Vss::VSS_COMPONENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_component_name : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup_succeeded : Proc(IVssComponent*, Bool*, Win32cr::Foundation::HRESULT),
    get_alternate_location_mapping_count : Proc(IVssComponent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_alternate_location_mapping : Proc(IVssComponent*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_backup_metadata : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_backup_metadata : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_partial_file : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_partial_file_count : Proc(IVssComponent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_partial_file : Proc(IVssComponent*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_selected_for_restore : Proc(IVssComponent*, Bool*, Win32cr::Foundation::HRESULT),
    get_additional_restores : Proc(IVssComponent*, Bool*, Win32cr::Foundation::HRESULT),
    get_new_target_count : Proc(IVssComponent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_new_target : Proc(IVssComponent*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_directed_target : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_directed_target_count : Proc(IVssComponent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_directed_target : Proc(IVssComponent*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_restore_metadata : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_restore_metadata : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_restore_target : Proc(IVssComponent*, Win32cr::Storage::Vss::VSS_RESTORE_TARGET, Win32cr::Foundation::HRESULT),
    get_restore_target : Proc(IVssComponent*, Win32cr::Storage::Vss::VSS_RESTORE_TARGET*, Win32cr::Foundation::HRESULT),
    set_pre_restore_failure_msg : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_pre_restore_failure_msg : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_post_restore_failure_msg : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_post_restore_failure_msg : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_backup_stamp : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_backup_stamp : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_previous_backup_stamp : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup_options : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_options : Proc(IVssComponent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_subcomponent_count : Proc(IVssComponent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_restore_subcomponent : Proc(IVssComponent*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Bool*, Win32cr::Foundation::HRESULT),
    get_file_restore_status : Proc(IVssComponent*, Win32cr::Storage::Vss::VSS_FILE_RESTORE_STATUS*, Win32cr::Foundation::HRESULT),
    add_differenced_files_by_last_modify_time : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::FILETIME, Win32cr::Foundation::HRESULT),
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponent*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_differenced_files_count : Proc(IVssComponent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_differenced_file : Proc(IVssComponent*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssComponent, lpVtbl : IVssComponentVtbl* do
    GUID = LibC::GUID.new(0xd2c72c96_u32, 0xc121_u16, 0x4518_u16, StaticArray[0xb6_u8, 0x27_u8, 0xe5_u8, 0xa9_u8, 0x3d_u8, 0x1_u8, 0xe_u8, 0xad_u8])
    def query_interface(this : IVssComponent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssComponent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssComponent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_logical_path(this : IVssComponent*, pbstrPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logical_path.call(this, pbstrPath)
    end
    def get_component_type(this : IVssComponent*, pct : Win32cr::Storage::Vss::VSS_COMPONENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pct)
    end
    def get_component_name(this : IVssComponent*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_name.call(this, pbstrName)
    end
    def get_backup_succeeded(this : IVssComponent*, pbSucceeded : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_succeeded.call(this, pbSucceeded)
    end
    def get_alternate_location_mapping_count(this : IVssComponent*, pcMappings : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternate_location_mapping_count.call(this, pcMappings)
    end
    def get_alternate_location_mapping(this : IVssComponent*, iMapping : UInt32, ppFiledesc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternate_location_mapping.call(this, iMapping, ppFiledesc)
    end
    def set_backup_metadata(this : IVssComponent*, wszData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_metadata.call(this, wszData)
    end
    def get_backup_metadata(this : IVssComponent*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_metadata.call(this, pbstrData)
    end
    def add_partial_file(this : IVssComponent*, wszPath : Win32cr::Foundation::PWSTR, wszFilename : Win32cr::Foundation::PWSTR, wszRanges : Win32cr::Foundation::PWSTR, wszMetadata : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_partial_file.call(this, wszPath, wszFilename, wszRanges, wszMetadata)
    end
    def get_partial_file_count(this : IVssComponent*, pcPartialFiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partial_file_count.call(this, pcPartialFiles)
    end
    def get_partial_file(this : IVssComponent*, iPartialFile : UInt32, pbstrPath : Win32cr::Foundation::BSTR*, pbstrFilename : Win32cr::Foundation::BSTR*, pbstrRange : Win32cr::Foundation::BSTR*, pbstrMetadata : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partial_file.call(this, iPartialFile, pbstrPath, pbstrFilename, pbstrRange, pbstrMetadata)
    end
    def is_selected_for_restore(this : IVssComponent*, pbSelectedForRestore : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_selected_for_restore.call(this, pbSelectedForRestore)
    end
    def get_additional_restores(this : IVssComponent*, pbAdditionalRestores : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_additional_restores.call(this, pbAdditionalRestores)
    end
    def get_new_target_count(this : IVssComponent*, pcNewTarget : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_target_count.call(this, pcNewTarget)
    end
    def get_new_target(this : IVssComponent*, iNewTarget : UInt32, ppFiledesc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_target.call(this, iNewTarget, ppFiledesc)
    end
    def add_directed_target(this : IVssComponent*, wszSourcePath : Win32cr::Foundation::PWSTR, wszSourceFilename : Win32cr::Foundation::PWSTR, wszSourceRangeList : Win32cr::Foundation::PWSTR, wszDestinationPath : Win32cr::Foundation::PWSTR, wszDestinationFilename : Win32cr::Foundation::PWSTR, wszDestinationRangeList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_directed_target.call(this, wszSourcePath, wszSourceFilename, wszSourceRangeList, wszDestinationPath, wszDestinationFilename, wszDestinationRangeList)
    end
    def get_directed_target_count(this : IVssComponent*, pcDirectedTarget : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_directed_target_count.call(this, pcDirectedTarget)
    end
    def get_directed_target(this : IVssComponent*, iDirectedTarget : UInt32, pbstrSourcePath : Win32cr::Foundation::BSTR*, pbstrSourceFileName : Win32cr::Foundation::BSTR*, pbstrSourceRangeList : Win32cr::Foundation::BSTR*, pbstrDestinationPath : Win32cr::Foundation::BSTR*, pbstrDestinationFilename : Win32cr::Foundation::BSTR*, pbstrDestinationRangeList : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_directed_target.call(this, iDirectedTarget, pbstrSourcePath, pbstrSourceFileName, pbstrSourceRangeList, pbstrDestinationPath, pbstrDestinationFilename, pbstrDestinationRangeList)
    end
    def set_restore_metadata(this : IVssComponent*, wszRestoreMetadata : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_metadata.call(this, wszRestoreMetadata)
    end
    def get_restore_metadata(this : IVssComponent*, pbstrRestoreMetadata : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_metadata.call(this, pbstrRestoreMetadata)
    end
    def set_restore_target(this : IVssComponent*, target : Win32cr::Storage::Vss::VSS_RESTORE_TARGET) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_target.call(this, target)
    end
    def get_restore_target(this : IVssComponent*, pTarget : Win32cr::Storage::Vss::VSS_RESTORE_TARGET*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_target.call(this, pTarget)
    end
    def set_pre_restore_failure_msg(this : IVssComponent*, wszPreRestoreFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pre_restore_failure_msg.call(this, wszPreRestoreFailureMsg)
    end
    def get_pre_restore_failure_msg(this : IVssComponent*, pbstrPreRestoreFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pre_restore_failure_msg.call(this, pbstrPreRestoreFailureMsg)
    end
    def set_post_restore_failure_msg(this : IVssComponent*, wszPostRestoreFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_post_restore_failure_msg.call(this, wszPostRestoreFailureMsg)
    end
    def get_post_restore_failure_msg(this : IVssComponent*, pbstrPostRestoreFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_restore_failure_msg.call(this, pbstrPostRestoreFailureMsg)
    end
    def set_backup_stamp(this : IVssComponent*, wszBackupStamp : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_stamp.call(this, wszBackupStamp)
    end
    def get_backup_stamp(this : IVssComponent*, pbstrBackupStamp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_stamp.call(this, pbstrBackupStamp)
    end
    def get_previous_backup_stamp(this : IVssComponent*, pbstrBackupStamp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_backup_stamp.call(this, pbstrBackupStamp)
    end
    def get_backup_options(this : IVssComponent*, pbstrBackupOptions : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_options.call(this, pbstrBackupOptions)
    end
    def get_restore_options(this : IVssComponent*, pbstrRestoreOptions : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_options.call(this, pbstrRestoreOptions)
    end
    def get_restore_subcomponent_count(this : IVssComponent*, pcRestoreSubcomponent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_subcomponent_count.call(this, pcRestoreSubcomponent)
    end
    def get_restore_subcomponent(this : IVssComponent*, iComponent : UInt32, pbstrLogicalPath : Win32cr::Foundation::BSTR*, pbstrComponentName : Win32cr::Foundation::BSTR*, pbRepair : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_subcomponent.call(this, iComponent, pbstrLogicalPath, pbstrComponentName, pbRepair)
    end
    def get_file_restore_status(this : IVssComponent*, pStatus : Win32cr::Storage::Vss::VSS_FILE_RESTORE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_restore_status.call(this, pStatus)
    end
    def add_differenced_files_by_last_modify_time(this : IVssComponent*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : Win32cr::Foundation::BOOL, ftLastModifyTime : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_differenced_files_by_last_modify_time.call(this, wszPath, wszFilespec, bRecursive, ftLastModifyTime)
    end
    def add_differenced_files_by_last_modify_lsn(this : IVssComponent*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : Win32cr::Foundation::BOOL, bstrLsnString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_differenced_files_by_last_modify_lsn.call(this, wszPath, wszFilespec, bRecursive, bstrLsnString)
    end
    def get_differenced_files_count(this : IVssComponent*, pcDifferencedFiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_differenced_files_count.call(this, pcDifferencedFiles)
    end
    def get_differenced_file(this : IVssComponent*, iDifferencedFile : UInt32, pbstrPath : Win32cr::Foundation::BSTR*, pbstrFilespec : Win32cr::Foundation::BSTR*, pbRecursive : Win32cr::Foundation::BOOL*, pbstrLsnString : Win32cr::Foundation::BSTR*, pftLastModifyTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_differenced_file.call(this, iDifferencedFile, pbstrPath, pbstrFilespec, pbRecursive, pbstrLsnString, pftLastModifyTime)
    end

  end

  @[Extern]
  record IVssWriterComponentsVtbl,
    get_component_count : Proc(IVssWriterComponents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_writer_info : Proc(IVssWriterComponents*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_component : Proc(IVssWriterComponents*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssWriterComponents, lpVtbl : IVssWriterComponentsVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def get_component_count(this : IVssWriterComponents*, pcComponents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_count.call(this, pcComponents)
    end
    def get_writer_info(this : IVssWriterComponents*, pidInstance : LibC::GUID*, pidWriter : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_writer_info.call(this, pidInstance, pidWriter)
    end
    def get_component(this : IVssWriterComponents*, iComponent : UInt32, ppComponent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component.call(this, iComponent, ppComponent)
    end

  end

  @[Extern]
  record IVssComponentExVtbl,
    query_interface : Proc(IVssComponentEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssComponentEx*, UInt32),
    release : Proc(IVssComponentEx*, UInt32),
    get_logical_path : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_component_type : Proc(IVssComponentEx*, Win32cr::Storage::Vss::VSS_COMPONENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_component_name : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup_succeeded : Proc(IVssComponentEx*, Bool*, Win32cr::Foundation::HRESULT),
    get_alternate_location_mapping_count : Proc(IVssComponentEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_alternate_location_mapping : Proc(IVssComponentEx*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_backup_metadata : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_backup_metadata : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_partial_file : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_partial_file_count : Proc(IVssComponentEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_partial_file : Proc(IVssComponentEx*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_selected_for_restore : Proc(IVssComponentEx*, Bool*, Win32cr::Foundation::HRESULT),
    get_additional_restores : Proc(IVssComponentEx*, Bool*, Win32cr::Foundation::HRESULT),
    get_new_target_count : Proc(IVssComponentEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_new_target : Proc(IVssComponentEx*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_directed_target : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_directed_target_count : Proc(IVssComponentEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_directed_target : Proc(IVssComponentEx*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_restore_metadata : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_restore_metadata : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_restore_target : Proc(IVssComponentEx*, Win32cr::Storage::Vss::VSS_RESTORE_TARGET, Win32cr::Foundation::HRESULT),
    get_restore_target : Proc(IVssComponentEx*, Win32cr::Storage::Vss::VSS_RESTORE_TARGET*, Win32cr::Foundation::HRESULT),
    set_pre_restore_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_pre_restore_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_post_restore_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_post_restore_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_backup_stamp : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_backup_stamp : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_previous_backup_stamp : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup_options : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_options : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_subcomponent_count : Proc(IVssComponentEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_restore_subcomponent : Proc(IVssComponentEx*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Bool*, Win32cr::Foundation::HRESULT),
    get_file_restore_status : Proc(IVssComponentEx*, Win32cr::Storage::Vss::VSS_FILE_RESTORE_STATUS*, Win32cr::Foundation::HRESULT),
    add_differenced_files_by_last_modify_time : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::FILETIME, Win32cr::Foundation::HRESULT),
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_differenced_files_count : Proc(IVssComponentEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_differenced_file : Proc(IVssComponentEx*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    set_prepare_for_backup_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_post_snapshot_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_prepare_for_backup_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_post_snapshot_failure_msg : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_authoritative_restore : Proc(IVssComponentEx*, Bool*, Win32cr::Foundation::HRESULT),
    get_roll_forward : Proc(IVssComponentEx*, Win32cr::Storage::Vss::VSS_ROLLFORWARD_TYPE*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_name : Proc(IVssComponentEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssComponentEx, lpVtbl : IVssComponentExVtbl* do
    GUID = LibC::GUID.new(0x156c8b5e_u32, 0xf131_u16, 0x4bd7_u16, StaticArray[0x9c_u8, 0x97_u8, 0xd1_u8, 0x92_u8, 0x3b_u8, 0xe7_u8, 0xe1_u8, 0xfa_u8])
    def query_interface(this : IVssComponentEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssComponentEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssComponentEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_logical_path(this : IVssComponentEx*, pbstrPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logical_path.call(this, pbstrPath)
    end
    def get_component_type(this : IVssComponentEx*, pct : Win32cr::Storage::Vss::VSS_COMPONENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pct)
    end
    def get_component_name(this : IVssComponentEx*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_name.call(this, pbstrName)
    end
    def get_backup_succeeded(this : IVssComponentEx*, pbSucceeded : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_succeeded.call(this, pbSucceeded)
    end
    def get_alternate_location_mapping_count(this : IVssComponentEx*, pcMappings : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternate_location_mapping_count.call(this, pcMappings)
    end
    def get_alternate_location_mapping(this : IVssComponentEx*, iMapping : UInt32, ppFiledesc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternate_location_mapping.call(this, iMapping, ppFiledesc)
    end
    def set_backup_metadata(this : IVssComponentEx*, wszData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_metadata.call(this, wszData)
    end
    def get_backup_metadata(this : IVssComponentEx*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_metadata.call(this, pbstrData)
    end
    def add_partial_file(this : IVssComponentEx*, wszPath : Win32cr::Foundation::PWSTR, wszFilename : Win32cr::Foundation::PWSTR, wszRanges : Win32cr::Foundation::PWSTR, wszMetadata : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_partial_file.call(this, wszPath, wszFilename, wszRanges, wszMetadata)
    end
    def get_partial_file_count(this : IVssComponentEx*, pcPartialFiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partial_file_count.call(this, pcPartialFiles)
    end
    def get_partial_file(this : IVssComponentEx*, iPartialFile : UInt32, pbstrPath : Win32cr::Foundation::BSTR*, pbstrFilename : Win32cr::Foundation::BSTR*, pbstrRange : Win32cr::Foundation::BSTR*, pbstrMetadata : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partial_file.call(this, iPartialFile, pbstrPath, pbstrFilename, pbstrRange, pbstrMetadata)
    end
    def is_selected_for_restore(this : IVssComponentEx*, pbSelectedForRestore : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_selected_for_restore.call(this, pbSelectedForRestore)
    end
    def get_additional_restores(this : IVssComponentEx*, pbAdditionalRestores : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_additional_restores.call(this, pbAdditionalRestores)
    end
    def get_new_target_count(this : IVssComponentEx*, pcNewTarget : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_target_count.call(this, pcNewTarget)
    end
    def get_new_target(this : IVssComponentEx*, iNewTarget : UInt32, ppFiledesc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_target.call(this, iNewTarget, ppFiledesc)
    end
    def add_directed_target(this : IVssComponentEx*, wszSourcePath : Win32cr::Foundation::PWSTR, wszSourceFilename : Win32cr::Foundation::PWSTR, wszSourceRangeList : Win32cr::Foundation::PWSTR, wszDestinationPath : Win32cr::Foundation::PWSTR, wszDestinationFilename : Win32cr::Foundation::PWSTR, wszDestinationRangeList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_directed_target.call(this, wszSourcePath, wszSourceFilename, wszSourceRangeList, wszDestinationPath, wszDestinationFilename, wszDestinationRangeList)
    end
    def get_directed_target_count(this : IVssComponentEx*, pcDirectedTarget : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_directed_target_count.call(this, pcDirectedTarget)
    end
    def get_directed_target(this : IVssComponentEx*, iDirectedTarget : UInt32, pbstrSourcePath : Win32cr::Foundation::BSTR*, pbstrSourceFileName : Win32cr::Foundation::BSTR*, pbstrSourceRangeList : Win32cr::Foundation::BSTR*, pbstrDestinationPath : Win32cr::Foundation::BSTR*, pbstrDestinationFilename : Win32cr::Foundation::BSTR*, pbstrDestinationRangeList : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_directed_target.call(this, iDirectedTarget, pbstrSourcePath, pbstrSourceFileName, pbstrSourceRangeList, pbstrDestinationPath, pbstrDestinationFilename, pbstrDestinationRangeList)
    end
    def set_restore_metadata(this : IVssComponentEx*, wszRestoreMetadata : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_metadata.call(this, wszRestoreMetadata)
    end
    def get_restore_metadata(this : IVssComponentEx*, pbstrRestoreMetadata : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_metadata.call(this, pbstrRestoreMetadata)
    end
    def set_restore_target(this : IVssComponentEx*, target : Win32cr::Storage::Vss::VSS_RESTORE_TARGET) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_target.call(this, target)
    end
    def get_restore_target(this : IVssComponentEx*, pTarget : Win32cr::Storage::Vss::VSS_RESTORE_TARGET*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_target.call(this, pTarget)
    end
    def set_pre_restore_failure_msg(this : IVssComponentEx*, wszPreRestoreFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pre_restore_failure_msg.call(this, wszPreRestoreFailureMsg)
    end
    def get_pre_restore_failure_msg(this : IVssComponentEx*, pbstrPreRestoreFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pre_restore_failure_msg.call(this, pbstrPreRestoreFailureMsg)
    end
    def set_post_restore_failure_msg(this : IVssComponentEx*, wszPostRestoreFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_post_restore_failure_msg.call(this, wszPostRestoreFailureMsg)
    end
    def get_post_restore_failure_msg(this : IVssComponentEx*, pbstrPostRestoreFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_restore_failure_msg.call(this, pbstrPostRestoreFailureMsg)
    end
    def set_backup_stamp(this : IVssComponentEx*, wszBackupStamp : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_stamp.call(this, wszBackupStamp)
    end
    def get_backup_stamp(this : IVssComponentEx*, pbstrBackupStamp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_stamp.call(this, pbstrBackupStamp)
    end
    def get_previous_backup_stamp(this : IVssComponentEx*, pbstrBackupStamp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_backup_stamp.call(this, pbstrBackupStamp)
    end
    def get_backup_options(this : IVssComponentEx*, pbstrBackupOptions : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_options.call(this, pbstrBackupOptions)
    end
    def get_restore_options(this : IVssComponentEx*, pbstrRestoreOptions : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_options.call(this, pbstrRestoreOptions)
    end
    def get_restore_subcomponent_count(this : IVssComponentEx*, pcRestoreSubcomponent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_subcomponent_count.call(this, pcRestoreSubcomponent)
    end
    def get_restore_subcomponent(this : IVssComponentEx*, iComponent : UInt32, pbstrLogicalPath : Win32cr::Foundation::BSTR*, pbstrComponentName : Win32cr::Foundation::BSTR*, pbRepair : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_subcomponent.call(this, iComponent, pbstrLogicalPath, pbstrComponentName, pbRepair)
    end
    def get_file_restore_status(this : IVssComponentEx*, pStatus : Win32cr::Storage::Vss::VSS_FILE_RESTORE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_restore_status.call(this, pStatus)
    end
    def add_differenced_files_by_last_modify_time(this : IVssComponentEx*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : Win32cr::Foundation::BOOL, ftLastModifyTime : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_differenced_files_by_last_modify_time.call(this, wszPath, wszFilespec, bRecursive, ftLastModifyTime)
    end
    def add_differenced_files_by_last_modify_lsn(this : IVssComponentEx*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : Win32cr::Foundation::BOOL, bstrLsnString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_differenced_files_by_last_modify_lsn.call(this, wszPath, wszFilespec, bRecursive, bstrLsnString)
    end
    def get_differenced_files_count(this : IVssComponentEx*, pcDifferencedFiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_differenced_files_count.call(this, pcDifferencedFiles)
    end
    def get_differenced_file(this : IVssComponentEx*, iDifferencedFile : UInt32, pbstrPath : Win32cr::Foundation::BSTR*, pbstrFilespec : Win32cr::Foundation::BSTR*, pbRecursive : Win32cr::Foundation::BOOL*, pbstrLsnString : Win32cr::Foundation::BSTR*, pftLastModifyTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_differenced_file.call(this, iDifferencedFile, pbstrPath, pbstrFilespec, pbRecursive, pbstrLsnString, pftLastModifyTime)
    end
    def set_prepare_for_backup_failure_msg(this : IVssComponentEx*, wszFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prepare_for_backup_failure_msg.call(this, wszFailureMsg)
    end
    def set_post_snapshot_failure_msg(this : IVssComponentEx*, wszFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_post_snapshot_failure_msg.call(this, wszFailureMsg)
    end
    def get_prepare_for_backup_failure_msg(this : IVssComponentEx*, pbstrFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prepare_for_backup_failure_msg.call(this, pbstrFailureMsg)
    end
    def get_post_snapshot_failure_msg(this : IVssComponentEx*, pbstrFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_snapshot_failure_msg.call(this, pbstrFailureMsg)
    end
    def get_authoritative_restore(this : IVssComponentEx*, pbAuth : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authoritative_restore.call(this, pbAuth)
    end
    def get_roll_forward(this : IVssComponentEx*, pRollType : Win32cr::Storage::Vss::VSS_ROLLFORWARD_TYPE*, pbstrPoint : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_roll_forward.call(this, pRollType, pbstrPoint)
    end
    def get_restore_name(this : IVssComponentEx*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_name.call(this, pbstrName)
    end

  end

  @[Extern]
  record IVssComponentEx2Vtbl,
    query_interface : Proc(IVssComponentEx2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssComponentEx2*, UInt32),
    release : Proc(IVssComponentEx2*, UInt32),
    get_logical_path : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_component_type : Proc(IVssComponentEx2*, Win32cr::Storage::Vss::VSS_COMPONENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_component_name : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup_succeeded : Proc(IVssComponentEx2*, Bool*, Win32cr::Foundation::HRESULT),
    get_alternate_location_mapping_count : Proc(IVssComponentEx2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_alternate_location_mapping : Proc(IVssComponentEx2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_backup_metadata : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_backup_metadata : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_partial_file : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_partial_file_count : Proc(IVssComponentEx2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_partial_file : Proc(IVssComponentEx2*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_selected_for_restore : Proc(IVssComponentEx2*, Bool*, Win32cr::Foundation::HRESULT),
    get_additional_restores : Proc(IVssComponentEx2*, Bool*, Win32cr::Foundation::HRESULT),
    get_new_target_count : Proc(IVssComponentEx2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_new_target : Proc(IVssComponentEx2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_directed_target : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_directed_target_count : Proc(IVssComponentEx2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_directed_target : Proc(IVssComponentEx2*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_restore_metadata : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_restore_metadata : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_restore_target : Proc(IVssComponentEx2*, Win32cr::Storage::Vss::VSS_RESTORE_TARGET, Win32cr::Foundation::HRESULT),
    get_restore_target : Proc(IVssComponentEx2*, Win32cr::Storage::Vss::VSS_RESTORE_TARGET*, Win32cr::Foundation::HRESULT),
    set_pre_restore_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_pre_restore_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_post_restore_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_post_restore_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_backup_stamp : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_backup_stamp : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_previous_backup_stamp : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup_options : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_options : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_subcomponent_count : Proc(IVssComponentEx2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_restore_subcomponent : Proc(IVssComponentEx2*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Bool*, Win32cr::Foundation::HRESULT),
    get_file_restore_status : Proc(IVssComponentEx2*, Win32cr::Storage::Vss::VSS_FILE_RESTORE_STATUS*, Win32cr::Foundation::HRESULT),
    add_differenced_files_by_last_modify_time : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::FILETIME, Win32cr::Foundation::HRESULT),
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_differenced_files_count : Proc(IVssComponentEx2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_differenced_file : Proc(IVssComponentEx2*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    set_prepare_for_backup_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_post_snapshot_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_prepare_for_backup_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_post_snapshot_failure_msg : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_authoritative_restore : Proc(IVssComponentEx2*, Bool*, Win32cr::Foundation::HRESULT),
    get_roll_forward : Proc(IVssComponentEx2*, Win32cr::Storage::Vss::VSS_ROLLFORWARD_TYPE*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restore_name : Proc(IVssComponentEx2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_failure : Proc(IVssComponentEx2*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_failure : Proc(IVssComponentEx2*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssComponentEx2, lpVtbl : IVssComponentEx2Vtbl* do
    GUID = LibC::GUID.new(0x3b5be0f2_u32, 0x7a9_u16, 0x4e4b_u16, StaticArray[0xbd_u8, 0xd3_u8, 0xcf_u8, 0xdc_u8, 0x8e_u8, 0x2c_u8, 0xd_u8, 0x2d_u8])
    def query_interface(this : IVssComponentEx2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssComponentEx2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssComponentEx2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_logical_path(this : IVssComponentEx2*, pbstrPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logical_path.call(this, pbstrPath)
    end
    def get_component_type(this : IVssComponentEx2*, pct : Win32cr::Storage::Vss::VSS_COMPONENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pct)
    end
    def get_component_name(this : IVssComponentEx2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_name.call(this, pbstrName)
    end
    def get_backup_succeeded(this : IVssComponentEx2*, pbSucceeded : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_succeeded.call(this, pbSucceeded)
    end
    def get_alternate_location_mapping_count(this : IVssComponentEx2*, pcMappings : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternate_location_mapping_count.call(this, pcMappings)
    end
    def get_alternate_location_mapping(this : IVssComponentEx2*, iMapping : UInt32, ppFiledesc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternate_location_mapping.call(this, iMapping, ppFiledesc)
    end
    def set_backup_metadata(this : IVssComponentEx2*, wszData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_metadata.call(this, wszData)
    end
    def get_backup_metadata(this : IVssComponentEx2*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_metadata.call(this, pbstrData)
    end
    def add_partial_file(this : IVssComponentEx2*, wszPath : Win32cr::Foundation::PWSTR, wszFilename : Win32cr::Foundation::PWSTR, wszRanges : Win32cr::Foundation::PWSTR, wszMetadata : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_partial_file.call(this, wszPath, wszFilename, wszRanges, wszMetadata)
    end
    def get_partial_file_count(this : IVssComponentEx2*, pcPartialFiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partial_file_count.call(this, pcPartialFiles)
    end
    def get_partial_file(this : IVssComponentEx2*, iPartialFile : UInt32, pbstrPath : Win32cr::Foundation::BSTR*, pbstrFilename : Win32cr::Foundation::BSTR*, pbstrRange : Win32cr::Foundation::BSTR*, pbstrMetadata : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partial_file.call(this, iPartialFile, pbstrPath, pbstrFilename, pbstrRange, pbstrMetadata)
    end
    def is_selected_for_restore(this : IVssComponentEx2*, pbSelectedForRestore : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_selected_for_restore.call(this, pbSelectedForRestore)
    end
    def get_additional_restores(this : IVssComponentEx2*, pbAdditionalRestores : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_additional_restores.call(this, pbAdditionalRestores)
    end
    def get_new_target_count(this : IVssComponentEx2*, pcNewTarget : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_target_count.call(this, pcNewTarget)
    end
    def get_new_target(this : IVssComponentEx2*, iNewTarget : UInt32, ppFiledesc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_target.call(this, iNewTarget, ppFiledesc)
    end
    def add_directed_target(this : IVssComponentEx2*, wszSourcePath : Win32cr::Foundation::PWSTR, wszSourceFilename : Win32cr::Foundation::PWSTR, wszSourceRangeList : Win32cr::Foundation::PWSTR, wszDestinationPath : Win32cr::Foundation::PWSTR, wszDestinationFilename : Win32cr::Foundation::PWSTR, wszDestinationRangeList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_directed_target.call(this, wszSourcePath, wszSourceFilename, wszSourceRangeList, wszDestinationPath, wszDestinationFilename, wszDestinationRangeList)
    end
    def get_directed_target_count(this : IVssComponentEx2*, pcDirectedTarget : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_directed_target_count.call(this, pcDirectedTarget)
    end
    def get_directed_target(this : IVssComponentEx2*, iDirectedTarget : UInt32, pbstrSourcePath : Win32cr::Foundation::BSTR*, pbstrSourceFileName : Win32cr::Foundation::BSTR*, pbstrSourceRangeList : Win32cr::Foundation::BSTR*, pbstrDestinationPath : Win32cr::Foundation::BSTR*, pbstrDestinationFilename : Win32cr::Foundation::BSTR*, pbstrDestinationRangeList : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_directed_target.call(this, iDirectedTarget, pbstrSourcePath, pbstrSourceFileName, pbstrSourceRangeList, pbstrDestinationPath, pbstrDestinationFilename, pbstrDestinationRangeList)
    end
    def set_restore_metadata(this : IVssComponentEx2*, wszRestoreMetadata : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_metadata.call(this, wszRestoreMetadata)
    end
    def get_restore_metadata(this : IVssComponentEx2*, pbstrRestoreMetadata : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_metadata.call(this, pbstrRestoreMetadata)
    end
    def set_restore_target(this : IVssComponentEx2*, target : Win32cr::Storage::Vss::VSS_RESTORE_TARGET) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_target.call(this, target)
    end
    def get_restore_target(this : IVssComponentEx2*, pTarget : Win32cr::Storage::Vss::VSS_RESTORE_TARGET*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_target.call(this, pTarget)
    end
    def set_pre_restore_failure_msg(this : IVssComponentEx2*, wszPreRestoreFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pre_restore_failure_msg.call(this, wszPreRestoreFailureMsg)
    end
    def get_pre_restore_failure_msg(this : IVssComponentEx2*, pbstrPreRestoreFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pre_restore_failure_msg.call(this, pbstrPreRestoreFailureMsg)
    end
    def set_post_restore_failure_msg(this : IVssComponentEx2*, wszPostRestoreFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_post_restore_failure_msg.call(this, wszPostRestoreFailureMsg)
    end
    def get_post_restore_failure_msg(this : IVssComponentEx2*, pbstrPostRestoreFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_restore_failure_msg.call(this, pbstrPostRestoreFailureMsg)
    end
    def set_backup_stamp(this : IVssComponentEx2*, wszBackupStamp : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_stamp.call(this, wszBackupStamp)
    end
    def get_backup_stamp(this : IVssComponentEx2*, pbstrBackupStamp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_stamp.call(this, pbstrBackupStamp)
    end
    def get_previous_backup_stamp(this : IVssComponentEx2*, pbstrBackupStamp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_backup_stamp.call(this, pbstrBackupStamp)
    end
    def get_backup_options(this : IVssComponentEx2*, pbstrBackupOptions : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_options.call(this, pbstrBackupOptions)
    end
    def get_restore_options(this : IVssComponentEx2*, pbstrRestoreOptions : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_options.call(this, pbstrRestoreOptions)
    end
    def get_restore_subcomponent_count(this : IVssComponentEx2*, pcRestoreSubcomponent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_subcomponent_count.call(this, pcRestoreSubcomponent)
    end
    def get_restore_subcomponent(this : IVssComponentEx2*, iComponent : UInt32, pbstrLogicalPath : Win32cr::Foundation::BSTR*, pbstrComponentName : Win32cr::Foundation::BSTR*, pbRepair : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_subcomponent.call(this, iComponent, pbstrLogicalPath, pbstrComponentName, pbRepair)
    end
    def get_file_restore_status(this : IVssComponentEx2*, pStatus : Win32cr::Storage::Vss::VSS_FILE_RESTORE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_restore_status.call(this, pStatus)
    end
    def add_differenced_files_by_last_modify_time(this : IVssComponentEx2*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : Win32cr::Foundation::BOOL, ftLastModifyTime : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_differenced_files_by_last_modify_time.call(this, wszPath, wszFilespec, bRecursive, ftLastModifyTime)
    end
    def add_differenced_files_by_last_modify_lsn(this : IVssComponentEx2*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : Win32cr::Foundation::BOOL, bstrLsnString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_differenced_files_by_last_modify_lsn.call(this, wszPath, wszFilespec, bRecursive, bstrLsnString)
    end
    def get_differenced_files_count(this : IVssComponentEx2*, pcDifferencedFiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_differenced_files_count.call(this, pcDifferencedFiles)
    end
    def get_differenced_file(this : IVssComponentEx2*, iDifferencedFile : UInt32, pbstrPath : Win32cr::Foundation::BSTR*, pbstrFilespec : Win32cr::Foundation::BSTR*, pbRecursive : Win32cr::Foundation::BOOL*, pbstrLsnString : Win32cr::Foundation::BSTR*, pftLastModifyTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_differenced_file.call(this, iDifferencedFile, pbstrPath, pbstrFilespec, pbRecursive, pbstrLsnString, pftLastModifyTime)
    end
    def set_prepare_for_backup_failure_msg(this : IVssComponentEx2*, wszFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prepare_for_backup_failure_msg.call(this, wszFailureMsg)
    end
    def set_post_snapshot_failure_msg(this : IVssComponentEx2*, wszFailureMsg : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_post_snapshot_failure_msg.call(this, wszFailureMsg)
    end
    def get_prepare_for_backup_failure_msg(this : IVssComponentEx2*, pbstrFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prepare_for_backup_failure_msg.call(this, pbstrFailureMsg)
    end
    def get_post_snapshot_failure_msg(this : IVssComponentEx2*, pbstrFailureMsg : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_snapshot_failure_msg.call(this, pbstrFailureMsg)
    end
    def get_authoritative_restore(this : IVssComponentEx2*, pbAuth : Bool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authoritative_restore.call(this, pbAuth)
    end
    def get_roll_forward(this : IVssComponentEx2*, pRollType : Win32cr::Storage::Vss::VSS_ROLLFORWARD_TYPE*, pbstrPoint : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_roll_forward.call(this, pRollType, pbstrPoint)
    end
    def get_restore_name(this : IVssComponentEx2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restore_name.call(this, pbstrName)
    end
    def set_failure(this : IVssComponentEx2*, hr : Win32cr::Foundation::HRESULT, hrApplication : Win32cr::Foundation::HRESULT, wszApplicationMessage : Win32cr::Foundation::PWSTR, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_failure.call(this, hr, hrApplication, wszApplicationMessage, dwReserved)
    end
    def get_failure(this : IVssComponentEx2*, phr : Win32cr::Foundation::HRESULT*, phrApplication : Win32cr::Foundation::HRESULT*, pbstrApplicationMessage : Win32cr::Foundation::BSTR*, pdwReserved : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_failure.call(this, phr, phrApplication, pbstrApplicationMessage, pdwReserved)
    end

  end

  @[Extern]
  record IVssCreateWriterMetadataVtbl,
    add_include_files : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_exclude_files : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8, Win32cr::Foundation::HRESULT),
    add_component : Proc(IVssCreateWriterMetadata*, Win32cr::Storage::Vss::VSS_COMPONENT_TYPE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, Win32cr::Foundation::HRESULT),
    add_database_files : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    add_database_log_files : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    add_files_to_file_group : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    set_restore_method : Proc(IVssCreateWriterMetadata*, Win32cr::Storage::Vss::VSS_RESTOREMETHOD_ENUM, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::Vss::VSS_WRITERRESTORE_ENUM, UInt8, Win32cr::Foundation::HRESULT),
    add_alternate_location_mapping : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_component_dependency : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_backup_schema : Proc(IVssCreateWriterMetadata*, UInt32, Win32cr::Foundation::HRESULT),
    get_document : Proc(IVssCreateWriterMetadata*, Void**, Win32cr::Foundation::HRESULT),
    save_as_xml : Proc(IVssCreateWriterMetadata*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssCreateWriterMetadata, lpVtbl : IVssCreateWriterMetadataVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def add_include_files(this : IVssCreateWriterMetadata*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : UInt8, wszAlternateLocation : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_include_files.call(this, wszPath, wszFilespec, bRecursive, wszAlternateLocation)
    end
    def add_exclude_files(this : IVssCreateWriterMetadata*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_exclude_files.call(this, wszPath, wszFilespec, bRecursive)
    end
    def add_component(this : IVssCreateWriterMetadata*, ct : Win32cr::Storage::Vss::VSS_COMPONENT_TYPE, wszLogicalPath : Win32cr::Foundation::PWSTR, wszComponentName : Win32cr::Foundation::PWSTR, wszCaption : Win32cr::Foundation::PWSTR, pbIcon : UInt8*, cbIcon : UInt32, bRestoreMetadata : UInt8, bNotifyOnBackupComplete : UInt8, bSelectable : UInt8, bSelectableForRestore : UInt8, dwComponentFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_component.call(this, ct, wszLogicalPath, wszComponentName, wszCaption, pbIcon, cbIcon, bRestoreMetadata, bNotifyOnBackupComplete, bSelectable, bSelectableForRestore, dwComponentFlags)
    end
    def add_database_files(this : IVssCreateWriterMetadata*, wszLogicalPath : Win32cr::Foundation::PWSTR, wszDatabaseName : Win32cr::Foundation::PWSTR, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, dwBackupTypeMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_database_files.call(this, wszLogicalPath, wszDatabaseName, wszPath, wszFilespec, dwBackupTypeMask)
    end
    def add_database_log_files(this : IVssCreateWriterMetadata*, wszLogicalPath : Win32cr::Foundation::PWSTR, wszDatabaseName : Win32cr::Foundation::PWSTR, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, dwBackupTypeMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_database_log_files.call(this, wszLogicalPath, wszDatabaseName, wszPath, wszFilespec, dwBackupTypeMask)
    end
    def add_files_to_file_group(this : IVssCreateWriterMetadata*, wszLogicalPath : Win32cr::Foundation::PWSTR, wszGroupName : Win32cr::Foundation::PWSTR, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : UInt8, wszAlternateLocation : Win32cr::Foundation::PWSTR, dwBackupTypeMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_files_to_file_group.call(this, wszLogicalPath, wszGroupName, wszPath, wszFilespec, bRecursive, wszAlternateLocation, dwBackupTypeMask)
    end
    def set_restore_method(this : IVssCreateWriterMetadata*, method : Win32cr::Storage::Vss::VSS_RESTOREMETHOD_ENUM, wszService : Win32cr::Foundation::PWSTR, wszUserProcedure : Win32cr::Foundation::PWSTR, writerRestore : Win32cr::Storage::Vss::VSS_WRITERRESTORE_ENUM, bRebootRequired : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_method.call(this, method, wszService, wszUserProcedure, writerRestore, bRebootRequired)
    end
    def add_alternate_location_mapping(this : IVssCreateWriterMetadata*, wszSourcePath : Win32cr::Foundation::PWSTR, wszSourceFilespec : Win32cr::Foundation::PWSTR, bRecursive : UInt8, wszDestination : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_alternate_location_mapping.call(this, wszSourcePath, wszSourceFilespec, bRecursive, wszDestination)
    end
    def add_component_dependency(this : IVssCreateWriterMetadata*, wszForLogicalPath : Win32cr::Foundation::PWSTR, wszForComponentName : Win32cr::Foundation::PWSTR, onWriterId : LibC::GUID, wszOnLogicalPath : Win32cr::Foundation::PWSTR, wszOnComponentName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_component_dependency.call(this, wszForLogicalPath, wszForComponentName, onWriterId, wszOnLogicalPath, wszOnComponentName)
    end
    def set_backup_schema(this : IVssCreateWriterMetadata*, dwSchemaMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_schema.call(this, dwSchemaMask)
    end
    def get_document(this : IVssCreateWriterMetadata*, pDoc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document.call(this, pDoc)
    end
    def save_as_xml(this : IVssCreateWriterMetadata*, pbstrXML : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_as_xml.call(this, pbstrXML)
    end

  end

  @[Extern]
  record IVssWriterImplVtbl,
    query_interface : Proc(IVssWriterImpl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssWriterImpl*, UInt32),
    release : Proc(IVssWriterImpl*, UInt32),
    initialize__ : Proc(IVssWriterImpl*, LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Storage::Vss::VSS_USAGE_TYPE, Win32cr::Storage::Vss::VSS_SOURCE_TYPE, Win32cr::Storage::Vss::VSS_APPLICATION_LEVEL, UInt32, Win32cr::Storage::Vss::VSS_ALTERNATE_WRITER_STATE, UInt8, Win32cr::Foundation::HRESULT),
    subscribe : Proc(IVssWriterImpl*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    unsubscribe : Proc(IVssWriterImpl*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IVssWriterImpl*, Void),
    get_current_volume_array : Proc(IVssWriterImpl*, Win32cr::Foundation::PWSTR*),
    get_current_volume_count : Proc(IVssWriterImpl*, UInt32),
    get_snapshot_device_name : Proc(IVssWriterImpl*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_current_snapshot_set_id : Proc(IVssWriterImpl*, LibC::GUID),
    get_context : Proc(IVssWriterImpl*, Int32),
    get_current_level : Proc(IVssWriterImpl*, Win32cr::Storage::Vss::VSS_APPLICATION_LEVEL),
    is_path_affected : Proc(IVssWriterImpl*, Win32cr::Foundation::PWSTR, Bool),
    is_bootable_system_state_backed_up : Proc(IVssWriterImpl*, Bool),
    are_components_selected : Proc(IVssWriterImpl*, Bool),
    get_backup_type : Proc(IVssWriterImpl*, Win32cr::Storage::Vss::VSS_BACKUP_TYPE),
    get_restore_type : Proc(IVssWriterImpl*, Win32cr::Storage::Vss::VSS_RESTORE_TYPE),
    set_writer_failure : Proc(IVssWriterImpl*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    is_partial_file_support_enabled : Proc(IVssWriterImpl*, Bool),
    install_alternate_writer : Proc(IVssWriterImpl*, LibC::GUID, LibC::GUID, Win32cr::Foundation::HRESULT),
    get_identity_information : Proc(IVssWriterImpl*, Win32cr::Storage::Vss::IVssExamineWriterMetadata*),
    set_writer_failure_ex : Proc(IVssWriterImpl*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_session_id : Proc(IVssWriterImpl*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_writer_shutting_down : Proc(IVssWriterImpl*, Bool)


  @[Extern]
  record IVssWriterImpl, lpVtbl : IVssWriterImplVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IVssWriterImpl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssWriterImpl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssWriterImpl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IVssWriterImpl*, writerId : LibC::GUID, wszWriterName : Win32cr::Foundation::PWSTR, wszWriterInstanceName : Win32cr::Foundation::PWSTR, dwMajorVersion : UInt32, dwMinorVersion : UInt32, ut : Win32cr::Storage::Vss::VSS_USAGE_TYPE, st : Win32cr::Storage::Vss::VSS_SOURCE_TYPE, nLevel : Win32cr::Storage::Vss::VSS_APPLICATION_LEVEL, dwTimeout : UInt32, aws : Win32cr::Storage::Vss::VSS_ALTERNATE_WRITER_STATE, bIOThrottlingOnly : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, writerId, wszWriterName, wszWriterInstanceName, dwMajorVersion, dwMinorVersion, ut, st, nLevel, dwTimeout, aws, bIOThrottlingOnly)
    end
    def subscribe(this : IVssWriterImpl*, dwSubscribeTimeout : UInt32, dwEventFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.subscribe.call(this, dwSubscribeTimeout, dwEventFlags)
    end
    def unsubscribe(this : IVssWriterImpl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unsubscribe.call(this)
    end
    def uninitialize(this : IVssWriterImpl*) : Void
      @lpVtbl.try &.value.uninitialize.call(this)
    end
    def get_current_volume_array(this : IVssWriterImpl*) : Win32cr::Foundation::PWSTR*
      @lpVtbl.try &.value.get_current_volume_array.call(this)
    end
    def get_current_volume_count(this : IVssWriterImpl*) : UInt32
      @lpVtbl.try &.value.get_current_volume_count.call(this)
    end
    def get_snapshot_device_name(this : IVssWriterImpl*, wszOriginalVolume : Win32cr::Foundation::PWSTR, ppwszSnapshotDevice : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snapshot_device_name.call(this, wszOriginalVolume, ppwszSnapshotDevice)
    end
    def get_current_snapshot_set_id(this : IVssWriterImpl*) : LibC::GUID
      @lpVtbl.try &.value.get_current_snapshot_set_id.call(this)
    end
    def get_context(this : IVssWriterImpl*) : Int32
      @lpVtbl.try &.value.get_context.call(this)
    end
    def get_current_level(this : IVssWriterImpl*) : Win32cr::Storage::Vss::VSS_APPLICATION_LEVEL
      @lpVtbl.try &.value.get_current_level.call(this)
    end
    def is_path_affected(this : IVssWriterImpl*, wszPath : Win32cr::Foundation::PWSTR) : Bool
      @lpVtbl.try &.value.is_path_affected.call(this, wszPath)
    end
    def is_bootable_system_state_backed_up(this : IVssWriterImpl*) : Bool
      @lpVtbl.try &.value.is_bootable_system_state_backed_up.call(this)
    end
    def are_components_selected(this : IVssWriterImpl*) : Bool
      @lpVtbl.try &.value.are_components_selected.call(this)
    end
    def get_backup_type(this : IVssWriterImpl*) : Win32cr::Storage::Vss::VSS_BACKUP_TYPE
      @lpVtbl.try &.value.get_backup_type.call(this)
    end
    def get_restore_type(this : IVssWriterImpl*) : Win32cr::Storage::Vss::VSS_RESTORE_TYPE
      @lpVtbl.try &.value.get_restore_type.call(this)
    end
    def set_writer_failure(this : IVssWriterImpl*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_writer_failure.call(this, hr)
    end
    def is_partial_file_support_enabled(this : IVssWriterImpl*) : Bool
      @lpVtbl.try &.value.is_partial_file_support_enabled.call(this)
    end
    def install_alternate_writer(this : IVssWriterImpl*, idWriter : LibC::GUID, clsid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_alternate_writer.call(this, idWriter, clsid)
    end
    def get_identity_information(this : IVssWriterImpl*) : Win32cr::Storage::Vss::IVssExamineWriterMetadata*
      @lpVtbl.try &.value.get_identity_information.call(this)
    end
    def set_writer_failure_ex(this : IVssWriterImpl*, hr : Win32cr::Foundation::HRESULT, hrApplication : Win32cr::Foundation::HRESULT, wszApplicationMessage : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_writer_failure_ex.call(this, hr, hrApplication, wszApplicationMessage)
    end
    def get_session_id(this : IVssWriterImpl*, idSession : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_session_id.call(this, idSession)
    end
    def is_writer_shutting_down(this : IVssWriterImpl*) : Bool
      @lpVtbl.try &.value.is_writer_shutting_down.call(this)
    end

  end

  @[Extern]
  record IVssCreateExpressWriterMetadataVtbl,
    query_interface : Proc(IVssCreateExpressWriterMetadata*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssCreateExpressWriterMetadata*, UInt32),
    release : Proc(IVssCreateExpressWriterMetadata*, UInt32),
    add_exclude_files : Proc(IVssCreateExpressWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8, Win32cr::Foundation::HRESULT),
    add_component : Proc(IVssCreateExpressWriterMetadata*, Win32cr::Storage::Vss::VSS_COMPONENT_TYPE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, Win32cr::Foundation::HRESULT),
    add_files_to_file_group : Proc(IVssCreateExpressWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    set_restore_method : Proc(IVssCreateExpressWriterMetadata*, Win32cr::Storage::Vss::VSS_RESTOREMETHOD_ENUM, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::Vss::VSS_WRITERRESTORE_ENUM, UInt8, Win32cr::Foundation::HRESULT),
    add_component_dependency : Proc(IVssCreateExpressWriterMetadata*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_backup_schema : Proc(IVssCreateExpressWriterMetadata*, UInt32, Win32cr::Foundation::HRESULT),
    save_as_xml : Proc(IVssCreateExpressWriterMetadata*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssCreateExpressWriterMetadata, lpVtbl : IVssCreateExpressWriterMetadataVtbl* do
    GUID = LibC::GUID.new(0x9c772e77_u32, 0xb26e_u16, 0x427f_u16, StaticArray[0x92_u8, 0xdd_u8, 0xc9_u8, 0x96_u8, 0xf4_u8, 0x1e_u8, 0xa5_u8, 0xe3_u8])
    def query_interface(this : IVssCreateExpressWriterMetadata*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssCreateExpressWriterMetadata*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssCreateExpressWriterMetadata*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_exclude_files(this : IVssCreateExpressWriterMetadata*, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_exclude_files.call(this, wszPath, wszFilespec, bRecursive)
    end
    def add_component(this : IVssCreateExpressWriterMetadata*, ct : Win32cr::Storage::Vss::VSS_COMPONENT_TYPE, wszLogicalPath : Win32cr::Foundation::PWSTR, wszComponentName : Win32cr::Foundation::PWSTR, wszCaption : Win32cr::Foundation::PWSTR, pbIcon : UInt8*, cbIcon : UInt32, bRestoreMetadata : UInt8, bNotifyOnBackupComplete : UInt8, bSelectable : UInt8, bSelectableForRestore : UInt8, dwComponentFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_component.call(this, ct, wszLogicalPath, wszComponentName, wszCaption, pbIcon, cbIcon, bRestoreMetadata, bNotifyOnBackupComplete, bSelectable, bSelectableForRestore, dwComponentFlags)
    end
    def add_files_to_file_group(this : IVssCreateExpressWriterMetadata*, wszLogicalPath : Win32cr::Foundation::PWSTR, wszGroupName : Win32cr::Foundation::PWSTR, wszPath : Win32cr::Foundation::PWSTR, wszFilespec : Win32cr::Foundation::PWSTR, bRecursive : UInt8, wszAlternateLocation : Win32cr::Foundation::PWSTR, dwBackupTypeMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_files_to_file_group.call(this, wszLogicalPath, wszGroupName, wszPath, wszFilespec, bRecursive, wszAlternateLocation, dwBackupTypeMask)
    end
    def set_restore_method(this : IVssCreateExpressWriterMetadata*, method : Win32cr::Storage::Vss::VSS_RESTOREMETHOD_ENUM, wszService : Win32cr::Foundation::PWSTR, wszUserProcedure : Win32cr::Foundation::PWSTR, writerRestore : Win32cr::Storage::Vss::VSS_WRITERRESTORE_ENUM, bRebootRequired : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_restore_method.call(this, method, wszService, wszUserProcedure, writerRestore, bRebootRequired)
    end
    def add_component_dependency(this : IVssCreateExpressWriterMetadata*, wszForLogicalPath : Win32cr::Foundation::PWSTR, wszForComponentName : Win32cr::Foundation::PWSTR, onWriterId : LibC::GUID, wszOnLogicalPath : Win32cr::Foundation::PWSTR, wszOnComponentName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_component_dependency.call(this, wszForLogicalPath, wszForComponentName, onWriterId, wszOnLogicalPath, wszOnComponentName)
    end
    def set_backup_schema(this : IVssCreateExpressWriterMetadata*, dwSchemaMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_schema.call(this, dwSchemaMask)
    end
    def save_as_xml(this : IVssCreateExpressWriterMetadata*, pbstrXML : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_as_xml.call(this, pbstrXML)
    end

  end

  @[Extern]
  record IVssExpressWriterVtbl,
    query_interface : Proc(IVssExpressWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssExpressWriter*, UInt32),
    release : Proc(IVssExpressWriter*, UInt32),
    create_metadata : Proc(IVssExpressWriter*, LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Storage::Vss::VSS_USAGE_TYPE, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    load_metadata : Proc(IVssExpressWriter*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    register : Proc(IVssExpressWriter*, Win32cr::Foundation::HRESULT),
    unregister : Proc(IVssExpressWriter*, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssExpressWriter, lpVtbl : IVssExpressWriterVtbl* do
    GUID = LibC::GUID.new(0xe33affdc_u32, 0x59c7_u16, 0x47b1_u16, StaticArray[0x97_u8, 0xd5_u8, 0x42_u8, 0x66_u8, 0x59_u8, 0x8f_u8, 0x62_u8, 0x35_u8])
    def query_interface(this : IVssExpressWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssExpressWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssExpressWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_metadata(this : IVssExpressWriter*, writerId : LibC::GUID, writerName : Win32cr::Foundation::PWSTR, usageType : Win32cr::Storage::Vss::VSS_USAGE_TYPE, versionMajor : UInt32, versionMinor : UInt32, reserved : UInt32, ppMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_metadata.call(this, writerId, writerName, usageType, versionMajor, versionMinor, reserved, ppMetadata)
    end
    def load_metadata(this : IVssExpressWriter*, metadata : Win32cr::Foundation::PWSTR, reserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_metadata.call(this, metadata, reserved)
    end
    def register(this : IVssExpressWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this)
    end
    def unregister(this : IVssExpressWriter*, writerId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister.call(this, writerId)
    end

  end

  @[Extern]
  record IVssSnapshotMgmtVtbl,
    query_interface : Proc(IVssSnapshotMgmt*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssSnapshotMgmt*, UInt32),
    release : Proc(IVssSnapshotMgmt*, UInt32),
    get_provider_mgmt_interface : Proc(IVssSnapshotMgmt*, LibC::GUID, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    query_volumes_supported_for_snapshots : Proc(IVssSnapshotMgmt*, LibC::GUID, Int32, Void**, Win32cr::Foundation::HRESULT),
    query_snapshots_by_volume : Proc(IVssSnapshotMgmt*, UInt16*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssSnapshotMgmt, lpVtbl : IVssSnapshotMgmtVtbl* do
    GUID = LibC::GUID.new(0xfa7df749_u32, 0x66e7_u16, 0x4986_u16, StaticArray[0xa2_u8, 0x7f_u8, 0xe2_u8, 0xf0_u8, 0x4a_u8, 0xe5_u8, 0x37_u8, 0x72_u8])
    def query_interface(this : IVssSnapshotMgmt*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssSnapshotMgmt*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssSnapshotMgmt*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_provider_mgmt_interface(this : IVssSnapshotMgmt*, provider_id : LibC::GUID, interface_id : LibC::GUID*, ppItf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_mgmt_interface.call(this, provider_id, interface_id, ppItf)
    end
    def query_volumes_supported_for_snapshots(this : IVssSnapshotMgmt*, provider_id : LibC::GUID, lContext : Int32, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_volumes_supported_for_snapshots.call(this, provider_id, lContext, ppEnum)
    end
    def query_snapshots_by_volume(this : IVssSnapshotMgmt*, pwszVolumeName : UInt16*, provider_id : LibC::GUID, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_snapshots_by_volume.call(this, pwszVolumeName, provider_id, ppEnum)
    end

  end

  @[Extern]
  record IVssSnapshotMgmt2Vtbl,
    query_interface : Proc(IVssSnapshotMgmt2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssSnapshotMgmt2*, UInt32),
    release : Proc(IVssSnapshotMgmt2*, UInt32),
    get_min_diff_area_size : Proc(IVssSnapshotMgmt2*, Int64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssSnapshotMgmt2, lpVtbl : IVssSnapshotMgmt2Vtbl* do
    GUID = LibC::GUID.new(0xf61ec39_u32, 0xfe82_u16, 0x45f2_u16, StaticArray[0xa3_u8, 0xf0_u8, 0x76_u8, 0x8b_u8, 0x5d_u8, 0x42_u8, 0x71_u8, 0x2_u8])
    def query_interface(this : IVssSnapshotMgmt2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssSnapshotMgmt2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssSnapshotMgmt2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_min_diff_area_size(this : IVssSnapshotMgmt2*, pllMinDiffAreaSize : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_diff_area_size.call(this, pllMinDiffAreaSize)
    end

  end

  @[Extern]
  record IVssDifferentialSoftwareSnapshotMgmtVtbl,
    query_interface : Proc(IVssDifferentialSoftwareSnapshotMgmt*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt32),
    release : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt32),
    add_diff_area : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, UInt16*, Int64, Win32cr::Foundation::HRESULT),
    change_diff_area_maximum_size : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, UInt16*, Int64, Win32cr::Foundation::HRESULT),
    query_volumes_supported_for_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_for_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_on_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_for_snapshot : Proc(IVssDifferentialSoftwareSnapshotMgmt*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssDifferentialSoftwareSnapshotMgmt, lpVtbl : IVssDifferentialSoftwareSnapshotMgmtVtbl* do
    GUID = LibC::GUID.new(0x214a0f28_u32, 0xb737_u16, 0x4026_u16, StaticArray[0xb8_u8, 0x47_u8, 0x4f_u8, 0x9e_u8, 0x37_u8, 0xd7_u8, 0x95_u8, 0x29_u8])
    def query_interface(this : IVssDifferentialSoftwareSnapshotMgmt*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssDifferentialSoftwareSnapshotMgmt*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssDifferentialSoftwareSnapshotMgmt*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_diff_area(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_diff_area.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace)
    end
    def change_diff_area_maximum_size(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_diff_area_maximum_size.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace)
    end
    def query_volumes_supported_for_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszOriginalVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_volumes_supported_for_diff_areas.call(this, pwszOriginalVolumeName, ppEnum)
    end
    def query_diff_areas_for_volume(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_for_volume.call(this, pwszVolumeName, ppEnum)
    end
    def query_diff_areas_on_volume(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_on_volume.call(this, pwszVolumeName, ppEnum)
    end
    def query_diff_areas_for_snapshot(this : IVssDifferentialSoftwareSnapshotMgmt*, snapshot_id : LibC::GUID, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_for_snapshot.call(this, snapshot_id, ppEnum)
    end

  end

  @[Extern]
  record IVssDifferentialSoftwareSnapshotMgmt2Vtbl,
    query_interface : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt32),
    release : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt32),
    add_diff_area : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, Int64, Win32cr::Foundation::HRESULT),
    change_diff_area_maximum_size : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, Int64, Win32cr::Foundation::HRESULT),
    query_volumes_supported_for_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_for_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_on_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_for_snapshot : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    change_diff_area_maximum_size_ex : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, Int64, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    migrate_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    query_migration_status : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    set_snapshot_priority : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, LibC::GUID, UInt8, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssDifferentialSoftwareSnapshotMgmt2, lpVtbl : IVssDifferentialSoftwareSnapshotMgmt2Vtbl* do
    GUID = LibC::GUID.new(0x949d7353_u32, 0x675f_u16, 0x4275_u16, StaticArray[0x89_u8, 0x69_u8, 0xf0_u8, 0x44_u8, 0xc6_u8, 0x27_u8, 0x78_u8, 0x15_u8])
    def query_interface(this : IVssDifferentialSoftwareSnapshotMgmt2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssDifferentialSoftwareSnapshotMgmt2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssDifferentialSoftwareSnapshotMgmt2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_diff_area(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_diff_area.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace)
    end
    def change_diff_area_maximum_size(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_diff_area_maximum_size.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace)
    end
    def query_volumes_supported_for_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszOriginalVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_volumes_supported_for_diff_areas.call(this, pwszOriginalVolumeName, ppEnum)
    end
    def query_diff_areas_for_volume(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_for_volume.call(this, pwszVolumeName, ppEnum)
    end
    def query_diff_areas_on_volume(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_on_volume.call(this, pwszVolumeName, ppEnum)
    end
    def query_diff_areas_for_snapshot(this : IVssDifferentialSoftwareSnapshotMgmt2*, snapshot_id : LibC::GUID, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_for_snapshot.call(this, snapshot_id, ppEnum)
    end
    def change_diff_area_maximum_size_ex(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64, bVolatile : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_diff_area_maximum_size_ex.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace, bVolatile)
    end
    def migrate_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, pwszNewDiffAreaVolumeName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.migrate_diff_areas.call(this, pwszVolumeName, pwszDiffAreaVolumeName, pwszNewDiffAreaVolumeName)
    end
    def query_migration_status(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, ppAsync : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_migration_status.call(this, pwszVolumeName, pwszDiffAreaVolumeName, ppAsync)
    end
    def set_snapshot_priority(this : IVssDifferentialSoftwareSnapshotMgmt2*, idSnapshot : LibC::GUID, priority : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snapshot_priority.call(this, idSnapshot, priority)
    end

  end

  @[Extern]
  record IVssDifferentialSoftwareSnapshotMgmt3Vtbl,
    query_interface : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt32),
    release : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt32),
    add_diff_area : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, Int64, Win32cr::Foundation::HRESULT),
    change_diff_area_maximum_size : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, Int64, Win32cr::Foundation::HRESULT),
    query_volumes_supported_for_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_for_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_on_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    query_diff_areas_for_snapshot : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    change_diff_area_maximum_size_ex : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, Int64, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    migrate_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    query_migration_status : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    set_snapshot_priority : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, LibC::GUID, UInt8, Win32cr::Foundation::HRESULT),
    set_volume_protect_level : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, Win32cr::Storage::Vss::VSS_PROTECTION_LEVEL, Win32cr::Foundation::HRESULT),
    get_volume_protect_level : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, Win32cr::Storage::Vss::VSS_VOLUME_PROTECTION_INFO*, Win32cr::Foundation::HRESULT),
    clear_volume_protect_fault : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, Win32cr::Foundation::HRESULT),
    delete_unused_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, Win32cr::Foundation::HRESULT),
    query_snapshot_delta_bitmap : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, LibC::GUID, LibC::GUID, UInt32*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssDifferentialSoftwareSnapshotMgmt3, lpVtbl : IVssDifferentialSoftwareSnapshotMgmt3Vtbl* do
    GUID = LibC::GUID.new(0x383f7e71_u32, 0xa4c5_u16, 0x401f_u16, StaticArray[0xb2_u8, 0x7f_u8, 0xf8_u8, 0x26_u8, 0x28_u8, 0x9f_u8, 0x84_u8, 0x58_u8])
    def query_interface(this : IVssDifferentialSoftwareSnapshotMgmt3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssDifferentialSoftwareSnapshotMgmt3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssDifferentialSoftwareSnapshotMgmt3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_diff_area(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_diff_area.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace)
    end
    def change_diff_area_maximum_size(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_diff_area_maximum_size.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace)
    end
    def query_volumes_supported_for_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszOriginalVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_volumes_supported_for_diff_areas.call(this, pwszOriginalVolumeName, ppEnum)
    end
    def query_diff_areas_for_volume(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_for_volume.call(this, pwszVolumeName, ppEnum)
    end
    def query_diff_areas_on_volume(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_on_volume.call(this, pwszVolumeName, ppEnum)
    end
    def query_diff_areas_for_snapshot(this : IVssDifferentialSoftwareSnapshotMgmt3*, snapshot_id : LibC::GUID, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_diff_areas_for_snapshot.call(this, snapshot_id, ppEnum)
    end
    def change_diff_area_maximum_size_ex(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, llMaximumDiffSpace : Int64, bVolatile : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_diff_area_maximum_size_ex.call(this, pwszVolumeName, pwszDiffAreaVolumeName, llMaximumDiffSpace, bVolatile)
    end
    def migrate_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, pwszNewDiffAreaVolumeName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.migrate_diff_areas.call(this, pwszVolumeName, pwszDiffAreaVolumeName, pwszNewDiffAreaVolumeName)
    end
    def query_migration_status(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, pwszDiffAreaVolumeName : UInt16*, ppAsync : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_migration_status.call(this, pwszVolumeName, pwszDiffAreaVolumeName, ppAsync)
    end
    def set_snapshot_priority(this : IVssDifferentialSoftwareSnapshotMgmt3*, idSnapshot : LibC::GUID, priority : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snapshot_priority.call(this, idSnapshot, priority)
    end
    def set_volume_protect_level(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, protectionLevel : Win32cr::Storage::Vss::VSS_PROTECTION_LEVEL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume_protect_level.call(this, pwszVolumeName, protectionLevel)
    end
    def get_volume_protect_level(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*, protectionLevel : Win32cr::Storage::Vss::VSS_VOLUME_PROTECTION_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_protect_level.call(this, pwszVolumeName, protectionLevel)
    end
    def clear_volume_protect_fault(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszVolumeName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_volume_protect_fault.call(this, pwszVolumeName)
    end
    def delete_unused_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszDiffAreaVolumeName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_unused_diff_areas.call(this, pwszDiffAreaVolumeName)
    end
    def query_snapshot_delta_bitmap(this : IVssDifferentialSoftwareSnapshotMgmt3*, idSnapshotOlder : LibC::GUID, idSnapshotYounger : LibC::GUID, pcBlockSizePerBit : UInt32*, pcBitmapLength : UInt32*, ppbBitmap : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_snapshot_delta_bitmap.call(this, idSnapshotOlder, idSnapshotYounger, pcBlockSizePerBit, pcBitmapLength, ppbBitmap)
    end

  end

  @[Extern]
  record IVssEnumMgmtObjectVtbl,
    query_interface : Proc(IVssEnumMgmtObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssEnumMgmtObject*, UInt32),
    release : Proc(IVssEnumMgmtObject*, UInt32),
    next__ : Proc(IVssEnumMgmtObject*, UInt32, Win32cr::Storage::Vss::VSS_MGMT_OBJECT_PROP*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IVssEnumMgmtObject*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IVssEnumMgmtObject*, Win32cr::Foundation::HRESULT),
    clone : Proc(IVssEnumMgmtObject*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssEnumMgmtObject, lpVtbl : IVssEnumMgmtObjectVtbl* do
    GUID = LibC::GUID.new(0x1954e6b_u32, 0x9254_u16, 0x4e6e_u16, StaticArray[0x80_u8, 0x8c_u8, 0xc9_u8, 0xe0_u8, 0x5d_u8, 0x0_u8, 0x76_u8, 0x96_u8])
    def query_interface(this : IVssEnumMgmtObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssEnumMgmtObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssEnumMgmtObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IVssEnumMgmtObject*, celt : UInt32, rgelt : Win32cr::Storage::Vss::VSS_MGMT_OBJECT_PROP*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IVssEnumMgmtObject*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IVssEnumMgmtObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IVssEnumMgmtObject*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IVssAdminVtbl,
    query_interface : Proc(IVssAdmin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssAdmin*, UInt32),
    release : Proc(IVssAdmin*, UInt32),
    register_provider : Proc(IVssAdmin*, LibC::GUID, LibC::GUID, UInt16*, Win32cr::Storage::Vss::VSS_PROVIDER_TYPE, UInt16*, LibC::GUID, Win32cr::Foundation::HRESULT),
    unregister_provider : Proc(IVssAdmin*, LibC::GUID, Win32cr::Foundation::HRESULT),
    query_providers : Proc(IVssAdmin*, Void**, Win32cr::Foundation::HRESULT),
    abort_all_snapshots_in_progress : Proc(IVssAdmin*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssAdmin, lpVtbl : IVssAdminVtbl* do
    GUID = LibC::GUID.new(0x77ed5996_u32, 0x2f63_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x39_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x72_u8, 0xd8_u8, 0xe3_u8])
    def query_interface(this : IVssAdmin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssAdmin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssAdmin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_provider(this : IVssAdmin*, pProviderId : LibC::GUID, class_id : LibC::GUID, pwszProviderName : UInt16*, eProviderType : Win32cr::Storage::Vss::VSS_PROVIDER_TYPE, pwszProviderVersion : UInt16*, provider_version_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_provider.call(this, pProviderId, class_id, pwszProviderName, eProviderType, pwszProviderVersion, provider_version_id)
    end
    def unregister_provider(this : IVssAdmin*, provider_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_provider.call(this, provider_id)
    end
    def query_providers(this : IVssAdmin*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_providers.call(this, ppEnum)
    end
    def abort_all_snapshots_in_progress(this : IVssAdmin*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_all_snapshots_in_progress.call(this)
    end

  end

  @[Extern]
  record IVssAdminExVtbl,
    query_interface : Proc(IVssAdminEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssAdminEx*, UInt32),
    release : Proc(IVssAdminEx*, UInt32),
    register_provider : Proc(IVssAdminEx*, LibC::GUID, LibC::GUID, UInt16*, Win32cr::Storage::Vss::VSS_PROVIDER_TYPE, UInt16*, LibC::GUID, Win32cr::Foundation::HRESULT),
    unregister_provider : Proc(IVssAdminEx*, LibC::GUID, Win32cr::Foundation::HRESULT),
    query_providers : Proc(IVssAdminEx*, Void**, Win32cr::Foundation::HRESULT),
    abort_all_snapshots_in_progress : Proc(IVssAdminEx*, Win32cr::Foundation::HRESULT),
    get_provider_capability : Proc(IVssAdminEx*, LibC::GUID, UInt64*, Win32cr::Foundation::HRESULT),
    get_provider_context : Proc(IVssAdminEx*, LibC::GUID, Int32*, Win32cr::Foundation::HRESULT),
    set_provider_context : Proc(IVssAdminEx*, LibC::GUID, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssAdminEx, lpVtbl : IVssAdminExVtbl* do
    GUID = LibC::GUID.new(0x7858a9f8_u32, 0xb1fa_u16, 0x41a6_u16, StaticArray[0x96_u8, 0x4f_u8, 0xb9_u8, 0xb3_u8, 0x6b_u8, 0x8c_u8, 0xd8_u8, 0xd8_u8])
    def query_interface(this : IVssAdminEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssAdminEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssAdminEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_provider(this : IVssAdminEx*, pProviderId : LibC::GUID, class_id : LibC::GUID, pwszProviderName : UInt16*, eProviderType : Win32cr::Storage::Vss::VSS_PROVIDER_TYPE, pwszProviderVersion : UInt16*, provider_version_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_provider.call(this, pProviderId, class_id, pwszProviderName, eProviderType, pwszProviderVersion, provider_version_id)
    end
    def unregister_provider(this : IVssAdminEx*, provider_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_provider.call(this, provider_id)
    end
    def query_providers(this : IVssAdminEx*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_providers.call(this, ppEnum)
    end
    def abort_all_snapshots_in_progress(this : IVssAdminEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_all_snapshots_in_progress.call(this)
    end
    def get_provider_capability(this : IVssAdminEx*, pProviderId : LibC::GUID, pllOriginalCapabilityMask : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_capability.call(this, pProviderId, pllOriginalCapabilityMask)
    end
    def get_provider_context(this : IVssAdminEx*, provider_id : LibC::GUID, plContext : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_context.call(this, provider_id, plContext)
    end
    def set_provider_context(this : IVssAdminEx*, provider_id : LibC::GUID, lContext : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_provider_context.call(this, provider_id, lContext)
    end

  end

  @[Extern]
  record IVssSoftwareSnapshotProviderVtbl,
    query_interface : Proc(IVssSoftwareSnapshotProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssSoftwareSnapshotProvider*, UInt32),
    release : Proc(IVssSoftwareSnapshotProvider*, UInt32),
    set_context : Proc(IVssSoftwareSnapshotProvider*, Int32, Win32cr::Foundation::HRESULT),
    get_snapshot_properties : Proc(IVssSoftwareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_SNAPSHOT_PROP*, Win32cr::Foundation::HRESULT),
    query : Proc(IVssSoftwareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_OBJECT_TYPE, Win32cr::Storage::Vss::VSS_OBJECT_TYPE, Void**, Win32cr::Foundation::HRESULT),
    delete_snapshots : Proc(IVssSoftwareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_OBJECT_TYPE, Win32cr::Foundation::BOOL, Int32*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    begin_prepare_snapshot : Proc(IVssSoftwareSnapshotProvider*, LibC::GUID, LibC::GUID, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    is_volume_supported : Proc(IVssSoftwareSnapshotProvider*, UInt16*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_volume_snapshotted : Proc(IVssSoftwareSnapshotProvider*, UInt16*, Win32cr::Foundation::BOOL*, Int32*, Win32cr::Foundation::HRESULT),
    set_snapshot_property : Proc(IVssSoftwareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_SNAPSHOT_PROPERTY_ID, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    revert_to_snapshot : Proc(IVssSoftwareSnapshotProvider*, LibC::GUID, Win32cr::Foundation::HRESULT),
    query_revert_status : Proc(IVssSoftwareSnapshotProvider*, UInt16*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssSoftwareSnapshotProvider, lpVtbl : IVssSoftwareSnapshotProviderVtbl* do
    GUID = LibC::GUID.new(0x609e123e_u32, 0x2c5a_u16, 0x44d3_u16, StaticArray[0x8f_u8, 0x1_u8, 0xb_u8, 0x1d_u8, 0x9a_u8, 0x47_u8, 0xd1_u8, 0xff_u8])
    def query_interface(this : IVssSoftwareSnapshotProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssSoftwareSnapshotProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssSoftwareSnapshotProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_context(this : IVssSoftwareSnapshotProvider*, lContext : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_context.call(this, lContext)
    end
    def get_snapshot_properties(this : IVssSoftwareSnapshotProvider*, snapshot_id : LibC::GUID, pProp : Win32cr::Storage::Vss::VSS_SNAPSHOT_PROP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snapshot_properties.call(this, snapshot_id, pProp)
    end
    def query(this : IVssSoftwareSnapshotProvider*, queried_object_id : LibC::GUID, eQueriedObjectType : Win32cr::Storage::Vss::VSS_OBJECT_TYPE, eReturnedObjectsType : Win32cr::Storage::Vss::VSS_OBJECT_TYPE, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, queried_object_id, eQueriedObjectType, eReturnedObjectsType, ppEnum)
    end
    def delete_snapshots(this : IVssSoftwareSnapshotProvider*, source_object_id : LibC::GUID, eSourceObjectType : Win32cr::Storage::Vss::VSS_OBJECT_TYPE, bForceDelete : Win32cr::Foundation::BOOL, plDeletedSnapshots : Int32*, pNondeletedSnapshotID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_snapshots.call(this, source_object_id, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID)
    end
    def begin_prepare_snapshot(this : IVssSoftwareSnapshotProvider*, snapshot_set_id : LibC::GUID, snapshot_id : LibC::GUID, pwszVolumeName : UInt16*, lNewContext : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_prepare_snapshot.call(this, snapshot_set_id, snapshot_id, pwszVolumeName, lNewContext)
    end
    def is_volume_supported(this : IVssSoftwareSnapshotProvider*, pwszVolumeName : UInt16*, pbSupportedByThisProvider : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_volume_supported.call(this, pwszVolumeName, pbSupportedByThisProvider)
    end
    def is_volume_snapshotted(this : IVssSoftwareSnapshotProvider*, pwszVolumeName : UInt16*, pbSnapshotsPresent : Win32cr::Foundation::BOOL*, plSnapshotCompatibility : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_volume_snapshotted.call(this, pwszVolumeName, pbSnapshotsPresent, plSnapshotCompatibility)
    end
    def set_snapshot_property(this : IVssSoftwareSnapshotProvider*, snapshot_id : LibC::GUID, eSnapshotPropertyId : Win32cr::Storage::Vss::VSS_SNAPSHOT_PROPERTY_ID, vProperty : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snapshot_property.call(this, snapshot_id, eSnapshotPropertyId, vProperty)
    end
    def revert_to_snapshot(this : IVssSoftwareSnapshotProvider*, snapshot_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert_to_snapshot.call(this, snapshot_id)
    end
    def query_revert_status(this : IVssSoftwareSnapshotProvider*, pwszVolume : UInt16*, ppAsync : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_revert_status.call(this, pwszVolume, ppAsync)
    end

  end

  @[Extern]
  record IVssProviderCreateSnapshotSetVtbl,
    query_interface : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssProviderCreateSnapshotSet*, UInt32),
    release : Proc(IVssProviderCreateSnapshotSet*, UInt32),
    end_prepare_snapshots : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID, Win32cr::Foundation::HRESULT),
    pre_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID, Win32cr::Foundation::HRESULT),
    commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID, Win32cr::Foundation::HRESULT),
    post_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID, Int32, Win32cr::Foundation::HRESULT),
    pre_final_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID, Win32cr::Foundation::HRESULT),
    post_final_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID, Win32cr::Foundation::HRESULT),
    abort_snapshots : Proc(IVssProviderCreateSnapshotSet*, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssProviderCreateSnapshotSet, lpVtbl : IVssProviderCreateSnapshotSetVtbl* do
    GUID = LibC::GUID.new(0x5f894e5b_u32, 0x1e39_u16, 0x4778_u16, StaticArray[0x8e_u8, 0x23_u8, 0x9a_u8, 0xba_u8, 0xd9_u8, 0xf0_u8, 0xe0_u8, 0x8c_u8])
    def query_interface(this : IVssProviderCreateSnapshotSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssProviderCreateSnapshotSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssProviderCreateSnapshotSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def end_prepare_snapshots(this : IVssProviderCreateSnapshotSet*, snapshot_set_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_prepare_snapshots.call(this, snapshot_set_id)
    end
    def pre_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshot_set_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_commit_snapshots.call(this, snapshot_set_id)
    end
    def commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshot_set_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_snapshots.call(this, snapshot_set_id)
    end
    def post_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshot_set_id : LibC::GUID, lSnapshotsCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.post_commit_snapshots.call(this, snapshot_set_id, lSnapshotsCount)
    end
    def pre_final_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshot_set_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_final_commit_snapshots.call(this, snapshot_set_id)
    end
    def post_final_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshot_set_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.post_final_commit_snapshots.call(this, snapshot_set_id)
    end
    def abort_snapshots(this : IVssProviderCreateSnapshotSet*, snapshot_set_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_snapshots.call(this, snapshot_set_id)
    end

  end

  @[Extern]
  record IVssProviderNotificationsVtbl,
    query_interface : Proc(IVssProviderNotifications*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssProviderNotifications*, UInt32),
    release : Proc(IVssProviderNotifications*, UInt32),
    on_load : Proc(IVssProviderNotifications*, Void*, Win32cr::Foundation::HRESULT),
    on_unload : Proc(IVssProviderNotifications*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssProviderNotifications, lpVtbl : IVssProviderNotificationsVtbl* do
    GUID = LibC::GUID.new(0xe561901f_u32, 0x3a5_u16, 0x4afe_u16, StaticArray[0x86_u8, 0xd0_u8, 0x72_u8, 0xba_u8, 0xee_u8, 0xce_u8, 0x70_u8, 0x4_u8])
    def query_interface(this : IVssProviderNotifications*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssProviderNotifications*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssProviderNotifications*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_load(this : IVssProviderNotifications*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_load.call(this, pCallback)
    end
    def on_unload(this : IVssProviderNotifications*, bForceUnload : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_unload.call(this, bForceUnload)
    end

  end

  @[Extern]
  record IVssHardwareSnapshotProviderVtbl,
    query_interface : Proc(IVssHardwareSnapshotProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssHardwareSnapshotProvider*, UInt32),
    release : Proc(IVssHardwareSnapshotProvider*, UInt32),
    are_luns_supported : Proc(IVssHardwareSnapshotProvider*, Int32, Int32, UInt16**, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    fill_in_lun_info : Proc(IVssHardwareSnapshotProvider*, UInt16*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    begin_prepare_snapshot : Proc(IVssHardwareSnapshotProvider*, LibC::GUID, LibC::GUID, Int32, Int32, UInt16**, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT),
    get_target_luns : Proc(IVssHardwareSnapshotProvider*, Int32, UInt16**, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT),
    locate_luns : Proc(IVssHardwareSnapshotProvider*, Int32, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT),
    on_lun_empty : Proc(IVssHardwareSnapshotProvider*, UInt16*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssHardwareSnapshotProvider, lpVtbl : IVssHardwareSnapshotProviderVtbl* do
    GUID = LibC::GUID.new(0x9593a157_u32, 0x44e9_u16, 0x4344_u16, StaticArray[0xbb_u8, 0xeb_u8, 0x44_u8, 0xfb_u8, 0xf9_u8, 0xb0_u8, 0x6b_u8, 0x10_u8])
    def query_interface(this : IVssHardwareSnapshotProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssHardwareSnapshotProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssHardwareSnapshotProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def are_luns_supported(this : IVssHardwareSnapshotProvider*, lLunCount : Int32, lContext : Int32, rgwszDevices : UInt16**, pLunInformation : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, pbIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.are_luns_supported.call(this, lLunCount, lContext, rgwszDevices, pLunInformation, pbIsSupported)
    end
    def fill_in_lun_info(this : IVssHardwareSnapshotProvider*, wszDeviceName : UInt16*, pLunInfo : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, pbIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fill_in_lun_info.call(this, wszDeviceName, pLunInfo, pbIsSupported)
    end
    def begin_prepare_snapshot(this : IVssHardwareSnapshotProvider*, snapshot_set_id : LibC::GUID, snapshot_id : LibC::GUID, lContext : Int32, lLunCount : Int32, rgDeviceNames : UInt16**, rgLunInformation : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_prepare_snapshot.call(this, snapshot_set_id, snapshot_id, lContext, lLunCount, rgDeviceNames, rgLunInformation)
    end
    def get_target_luns(this : IVssHardwareSnapshotProvider*, lLunCount : Int32, rgDeviceNames : UInt16**, rgSourceLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, rgDestinationLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_luns.call(this, lLunCount, rgDeviceNames, rgSourceLuns, rgDestinationLuns)
    end
    def locate_luns(this : IVssHardwareSnapshotProvider*, lLunCount : Int32, rgSourceLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.locate_luns.call(this, lLunCount, rgSourceLuns)
    end
    def on_lun_empty(this : IVssHardwareSnapshotProvider*, wszDeviceName : UInt16*, pInformation : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lun_empty.call(this, wszDeviceName, pInformation)
    end

  end

  @[Extern]
  record IVssHardwareSnapshotProviderExVtbl,
    query_interface : Proc(IVssHardwareSnapshotProviderEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssHardwareSnapshotProviderEx*, UInt32),
    release : Proc(IVssHardwareSnapshotProviderEx*, UInt32),
    are_luns_supported : Proc(IVssHardwareSnapshotProviderEx*, Int32, Int32, UInt16**, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    fill_in_lun_info : Proc(IVssHardwareSnapshotProviderEx*, UInt16*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    begin_prepare_snapshot : Proc(IVssHardwareSnapshotProviderEx*, LibC::GUID, LibC::GUID, Int32, Int32, UInt16**, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT),
    get_target_luns : Proc(IVssHardwareSnapshotProviderEx*, Int32, UInt16**, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT),
    locate_luns : Proc(IVssHardwareSnapshotProviderEx*, Int32, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT),
    on_lun_empty : Proc(IVssHardwareSnapshotProviderEx*, UInt16*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Foundation::HRESULT),
    get_provider_capabilities : Proc(IVssHardwareSnapshotProviderEx*, UInt64*, Win32cr::Foundation::HRESULT),
    on_lun_state_change : Proc(IVssHardwareSnapshotProviderEx*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    resync_luns : Proc(IVssHardwareSnapshotProviderEx*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_reuse_luns : Proc(IVssHardwareSnapshotProviderEx*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssHardwareSnapshotProviderEx, lpVtbl : IVssHardwareSnapshotProviderExVtbl* do
    GUID = LibC::GUID.new(0x7f5ba925_u32, 0xcdb1_u16, 0x4d11_u16, StaticArray[0xa7_u8, 0x1f_u8, 0x33_u8, 0x9e_u8, 0xb7_u8, 0xe7_u8, 0x9_u8, 0xfd_u8])
    def query_interface(this : IVssHardwareSnapshotProviderEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssHardwareSnapshotProviderEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssHardwareSnapshotProviderEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def are_luns_supported(this : IVssHardwareSnapshotProviderEx*, lLunCount : Int32, lContext : Int32, rgwszDevices : UInt16**, pLunInformation : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, pbIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.are_luns_supported.call(this, lLunCount, lContext, rgwszDevices, pLunInformation, pbIsSupported)
    end
    def fill_in_lun_info(this : IVssHardwareSnapshotProviderEx*, wszDeviceName : UInt16*, pLunInfo : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, pbIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fill_in_lun_info.call(this, wszDeviceName, pLunInfo, pbIsSupported)
    end
    def begin_prepare_snapshot(this : IVssHardwareSnapshotProviderEx*, snapshot_set_id : LibC::GUID, snapshot_id : LibC::GUID, lContext : Int32, lLunCount : Int32, rgDeviceNames : UInt16**, rgLunInformation : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_prepare_snapshot.call(this, snapshot_set_id, snapshot_id, lContext, lLunCount, rgDeviceNames, rgLunInformation)
    end
    def get_target_luns(this : IVssHardwareSnapshotProviderEx*, lLunCount : Int32, rgDeviceNames : UInt16**, rgSourceLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, rgDestinationLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_luns.call(this, lLunCount, rgDeviceNames, rgSourceLuns, rgDestinationLuns)
    end
    def locate_luns(this : IVssHardwareSnapshotProviderEx*, lLunCount : Int32, rgSourceLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.locate_luns.call(this, lLunCount, rgSourceLuns)
    end
    def on_lun_empty(this : IVssHardwareSnapshotProviderEx*, wszDeviceName : UInt16*, pInformation : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lun_empty.call(this, wszDeviceName, pInformation)
    end
    def get_provider_capabilities(this : IVssHardwareSnapshotProviderEx*, pllOriginalCapabilityMask : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_capabilities.call(this, pllOriginalCapabilityMask)
    end
    def on_lun_state_change(this : IVssHardwareSnapshotProviderEx*, pSnapshotLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, pOriginalLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, dwCount : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lun_state_change.call(this, pSnapshotLuns, pOriginalLuns, dwCount, dwFlags)
    end
    def resync_luns(this : IVssHardwareSnapshotProviderEx*, pSourceLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, pTargetLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, dwCount : UInt32, ppAsync : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resync_luns.call(this, pSourceLuns, pTargetLuns, dwCount, ppAsync)
    end
    def on_reuse_luns(this : IVssHardwareSnapshotProviderEx*, pSnapshotLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, pOriginalLuns : Win32cr::Storage::VirtualDiskService::VDS_LUN_INFORMATION*, dwCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_reuse_luns.call(this, pSnapshotLuns, pOriginalLuns, dwCount)
    end

  end

  @[Extern]
  record IVssFileShareSnapshotProviderVtbl,
    query_interface : Proc(IVssFileShareSnapshotProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVssFileShareSnapshotProvider*, UInt32),
    release : Proc(IVssFileShareSnapshotProvider*, UInt32),
    set_context : Proc(IVssFileShareSnapshotProvider*, Int32, Win32cr::Foundation::HRESULT),
    get_snapshot_properties : Proc(IVssFileShareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_SNAPSHOT_PROP*, Win32cr::Foundation::HRESULT),
    query : Proc(IVssFileShareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_OBJECT_TYPE, Win32cr::Storage::Vss::VSS_OBJECT_TYPE, Void**, Win32cr::Foundation::HRESULT),
    delete_snapshots : Proc(IVssFileShareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_OBJECT_TYPE, Win32cr::Foundation::BOOL, Int32*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    begin_prepare_snapshot : Proc(IVssFileShareSnapshotProvider*, LibC::GUID, LibC::GUID, UInt16*, Int32, LibC::GUID, Win32cr::Foundation::HRESULT),
    is_path_supported : Proc(IVssFileShareSnapshotProvider*, UInt16*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_path_snapshotted : Proc(IVssFileShareSnapshotProvider*, UInt16*, Win32cr::Foundation::BOOL*, Int32*, Win32cr::Foundation::HRESULT),
    set_snapshot_property : Proc(IVssFileShareSnapshotProvider*, LibC::GUID, Win32cr::Storage::Vss::VSS_SNAPSHOT_PROPERTY_ID, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVssFileShareSnapshotProvider, lpVtbl : IVssFileShareSnapshotProviderVtbl* do
    GUID = LibC::GUID.new(0xc8636060_u32, 0x7c2e_u16, 0x11df_u16, StaticArray[0x8c_u8, 0x4a_u8, 0x8_u8, 0x0_u8, 0x20_u8, 0xc_u8, 0x9a_u8, 0x66_u8])
    def query_interface(this : IVssFileShareSnapshotProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVssFileShareSnapshotProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVssFileShareSnapshotProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_context(this : IVssFileShareSnapshotProvider*, lContext : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_context.call(this, lContext)
    end
    def get_snapshot_properties(this : IVssFileShareSnapshotProvider*, snapshot_id : LibC::GUID, pProp : Win32cr::Storage::Vss::VSS_SNAPSHOT_PROP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snapshot_properties.call(this, snapshot_id, pProp)
    end
    def query(this : IVssFileShareSnapshotProvider*, queried_object_id : LibC::GUID, eQueriedObjectType : Win32cr::Storage::Vss::VSS_OBJECT_TYPE, eReturnedObjectsType : Win32cr::Storage::Vss::VSS_OBJECT_TYPE, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, queried_object_id, eQueriedObjectType, eReturnedObjectsType, ppEnum)
    end
    def delete_snapshots(this : IVssFileShareSnapshotProvider*, source_object_id : LibC::GUID, eSourceObjectType : Win32cr::Storage::Vss::VSS_OBJECT_TYPE, bForceDelete : Win32cr::Foundation::BOOL, plDeletedSnapshots : Int32*, pNondeletedSnapshotID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_snapshots.call(this, source_object_id, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID)
    end
    def begin_prepare_snapshot(this : IVssFileShareSnapshotProvider*, snapshot_set_id : LibC::GUID, snapshot_id : LibC::GUID, pwszSharePath : UInt16*, lNewContext : Int32, provider_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_prepare_snapshot.call(this, snapshot_set_id, snapshot_id, pwszSharePath, lNewContext, provider_id)
    end
    def is_path_supported(this : IVssFileShareSnapshotProvider*, pwszSharePath : UInt16*, pbSupportedByThisProvider : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_path_supported.call(this, pwszSharePath, pbSupportedByThisProvider)
    end
    def is_path_snapshotted(this : IVssFileShareSnapshotProvider*, pwszSharePath : UInt16*, pbSnapshotsPresent : Win32cr::Foundation::BOOL*, plSnapshotCompatibility : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_path_snapshotted.call(this, pwszSharePath, pbSnapshotsPresent, plSnapshotCompatibility)
    end
    def set_snapshot_property(this : IVssFileShareSnapshotProvider*, snapshot_id : LibC::GUID, eSnapshotPropertyId : Win32cr::Storage::Vss::VSS_SNAPSHOT_PROPERTY_ID, vProperty : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snapshot_property.call(this, snapshot_id, eSnapshotPropertyId, vProperty)
    end

  end

  @[Link("vssapi")]
  lib C
    fun CreateVssExpressWriterInternal(ppWriter : Void**) : Win32cr::Foundation::HRESULT

  end
end