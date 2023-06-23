require "../system/com.cr"
require "../foundation.cr"
require "../data/xml/msxml.cr"
require "../storage/virtualdiskservice.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:vssapi.dll")]
{% else %}
@[Link("vssapi")]
{% end %}
lib LibWin32
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

  type IVssExamineWriterMetadata = Void


  enum VSS_OBJECT_TYPE : Int32
    VSS_OBJECT_UNKNOWN = 0
    VSS_OBJECT_NONE = 1
    VSS_OBJECT_SNAPSHOT_SET = 2
    VSS_OBJECT_SNAPSHOT = 3
    VSS_OBJECT_PROVIDER = 4
    VSS_OBJECT_TYPE_COUNT = 5
  end

  enum VSS_SNAPSHOT_STATE : Int32
    VSS_SS_UNKNOWN = 0
    VSS_SS_PREPARING = 1
    VSS_SS_PROCESSING_PREPARE = 2
    VSS_SS_PREPARED = 3
    VSS_SS_PROCESSING_PRECOMMIT = 4
    VSS_SS_PRECOMMITTED = 5
    VSS_SS_PROCESSING_COMMIT = 6
    VSS_SS_COMMITTED = 7
    VSS_SS_PROCESSING_POSTCOMMIT = 8
    VSS_SS_PROCESSING_PREFINALCOMMIT = 9
    VSS_SS_PREFINALCOMMITTED = 10
    VSS_SS_PROCESSING_POSTFINALCOMMIT = 11
    VSS_SS_CREATED = 12
    VSS_SS_ABORTED = 13
    VSS_SS_DELETED = 14
    VSS_SS_POSTCOMMITTED = 15
    VSS_SS_COUNT = 16
  end

  enum VSS_VOLUME_SNAPSHOT_ATTRIBUTES : Int32
    VSS_VOLSNAP_ATTR_PERSISTENT = 1
    VSS_VOLSNAP_ATTR_NO_AUTORECOVERY = 2
    VSS_VOLSNAP_ATTR_CLIENT_ACCESSIBLE = 4
    VSS_VOLSNAP_ATTR_NO_AUTO_RELEASE = 8
    VSS_VOLSNAP_ATTR_NO_WRITERS = 16
    VSS_VOLSNAP_ATTR_TRANSPORTABLE = 32
    VSS_VOLSNAP_ATTR_NOT_SURFACED = 64
    VSS_VOLSNAP_ATTR_NOT_TRANSACTED = 128
    VSS_VOLSNAP_ATTR_HARDWARE_ASSISTED = 65536
    VSS_VOLSNAP_ATTR_DIFFERENTIAL = 131072
    VSS_VOLSNAP_ATTR_PLEX = 262144
    VSS_VOLSNAP_ATTR_IMPORTED = 524288
    VSS_VOLSNAP_ATTR_EXPOSED_LOCALLY = 1048576
    VSS_VOLSNAP_ATTR_EXPOSED_REMOTELY = 2097152
    VSS_VOLSNAP_ATTR_AUTORECOVER = 4194304
    VSS_VOLSNAP_ATTR_ROLLBACK_RECOVERY = 8388608
    VSS_VOLSNAP_ATTR_DELAYED_POSTSNAPSHOT = 16777216
    VSS_VOLSNAP_ATTR_TXF_RECOVERY = 33554432
    VSS_VOLSNAP_ATTR_FILE_SHARE = 67108864
  end

  enum VSS_SNAPSHOT_CONTEXT : Int32
    VSS_CTX_BACKUP = 0
    VSS_CTX_FILE_SHARE_BACKUP = 16
    VSS_CTX_NAS_ROLLBACK = 25
    VSS_CTX_APP_ROLLBACK = 9
    VSS_CTX_CLIENT_ACCESSIBLE = 29
    VSS_CTX_CLIENT_ACCESSIBLE_WRITERS = 13
    VSS_CTX_ALL = -1
  end

  enum VSS_PROVIDER_CAPABILITIES : Int32
    VSS_PRV_CAPABILITY_LEGACY = 1
    VSS_PRV_CAPABILITY_COMPLIANT = 2
    VSS_PRV_CAPABILITY_LUN_REPOINT = 4
    VSS_PRV_CAPABILITY_LUN_RESYNC = 8
    VSS_PRV_CAPABILITY_OFFLINE_CREATION = 16
    VSS_PRV_CAPABILITY_MULTIPLE_IMPORT = 32
    VSS_PRV_CAPABILITY_RECYCLING = 64
    VSS_PRV_CAPABILITY_PLEX = 128
    VSS_PRV_CAPABILITY_DIFFERENTIAL = 256
    VSS_PRV_CAPABILITY_CLUSTERED = 512
  end

  enum VSS_HARDWARE_OPTIONS : Int32
    VSS_BREAKEX_FLAG_MASK_LUNS = 1
    VSS_BREAKEX_FLAG_MAKE_READ_WRITE = 2
    VSS_BREAKEX_FLAG_REVERT_IDENTITY_ALL = 4
    VSS_BREAKEX_FLAG_REVERT_IDENTITY_NONE = 8
    VSS_ONLUNSTATECHANGE_NOTIFY_READ_WRITE = 256
    VSS_ONLUNSTATECHANGE_NOTIFY_LUN_PRE_RECOVERY = 512
    VSS_ONLUNSTATECHANGE_NOTIFY_LUN_POST_RECOVERY = 1024
    VSS_ONLUNSTATECHANGE_DO_MASK_LUNS = 2048
  end

  enum VSS_RECOVERY_OPTIONS : Int32
    VSS_RECOVERY_REVERT_IDENTITY_ALL = 256
    VSS_RECOVERY_NO_VOLUME_CHECK = 512
  end

  enum VSS_WRITER_STATE : Int32
    VSS_WS_UNKNOWN = 0
    VSS_WS_STABLE = 1
    VSS_WS_WAITING_FOR_FREEZE = 2
    VSS_WS_WAITING_FOR_THAW = 3
    VSS_WS_WAITING_FOR_POST_SNAPSHOT = 4
    VSS_WS_WAITING_FOR_BACKUP_COMPLETE = 5
    VSS_WS_FAILED_AT_IDENTIFY = 6
    VSS_WS_FAILED_AT_PREPARE_BACKUP = 7
    VSS_WS_FAILED_AT_PREPARE_SNAPSHOT = 8
    VSS_WS_FAILED_AT_FREEZE = 9
    VSS_WS_FAILED_AT_THAW = 10
    VSS_WS_FAILED_AT_POST_SNAPSHOT = 11
    VSS_WS_FAILED_AT_BACKUP_COMPLETE = 12
    VSS_WS_FAILED_AT_PRE_RESTORE = 13
    VSS_WS_FAILED_AT_POST_RESTORE = 14
    VSS_WS_FAILED_AT_BACKUPSHUTDOWN = 15
    VSS_WS_COUNT = 16
  end

  enum VSS_BACKUP_TYPE : Int32
    VSS_BT_UNDEFINED = 0
    VSS_BT_FULL = 1
    VSS_BT_INCREMENTAL = 2
    VSS_BT_DIFFERENTIAL = 3
    VSS_BT_LOG = 4
    VSS_BT_COPY = 5
    VSS_BT_OTHER = 6
  end

  enum VSS_RESTORE_TYPE : Int32
    VSS_RTYPE_UNDEFINED = 0
    VSS_RTYPE_BY_COPY = 1
    VSS_RTYPE_IMPORT = 2
    VSS_RTYPE_OTHER = 3
  end

  enum VSS_ROLLFORWARD_TYPE : Int32
    VSS_RF_UNDEFINED = 0
    VSS_RF_NONE = 1
    VSS_RF_ALL = 2
    VSS_RF_PARTIAL = 3
  end

  enum VSS_PROVIDER_TYPE : Int32
    VSS_PROV_UNKNOWN = 0
    VSS_PROV_SYSTEM = 1
    VSS_PROV_SOFTWARE = 2
    VSS_PROV_HARDWARE = 3
    VSS_PROV_FILESHARE = 4
  end

  enum VSS_APPLICATION_LEVEL : Int32
    VSS_APP_UNKNOWN = 0
    VSS_APP_SYSTEM = 1
    VSS_APP_BACK_END = 2
    VSS_APP_FRONT_END = 3
    VSS_APP_SYSTEM_RM = 4
    VSS_APP_AUTO = -1
  end

  enum VSS_SNAPSHOT_COMPATIBILITY : Int32
    VSS_SC_DISABLE_DEFRAG = 1
    VSS_SC_DISABLE_CONTENTINDEX = 2
  end

  enum VSS_SNAPSHOT_PROPERTY_ID : Int32
    VSS_SPROPID_UNKNOWN = 0
    VSS_SPROPID_SNAPSHOT_ID = 1
    VSS_SPROPID_SNAPSHOT_SET_ID = 2
    VSS_SPROPID_SNAPSHOTS_COUNT = 3
    VSS_SPROPID_SNAPSHOT_DEVICE = 4
    VSS_SPROPID_ORIGINAL_VOLUME = 5
    VSS_SPROPID_ORIGINATING_MACHINE = 6
    VSS_SPROPID_SERVICE_MACHINE = 7
    VSS_SPROPID_EXPOSED_NAME = 8
    VSS_SPROPID_EXPOSED_PATH = 9
    VSS_SPROPID_PROVIDER_ID = 10
    VSS_SPROPID_SNAPSHOT_ATTRIBUTES = 11
    VSS_SPROPID_CREATION_TIMESTAMP = 12
    VSS_SPROPID_STATUS = 13
  end

  enum VSS_FILE_SPEC_BACKUP_TYPE : Int32
    VSS_FSBT_FULL_BACKUP_REQUIRED = 1
    VSS_FSBT_DIFFERENTIAL_BACKUP_REQUIRED = 2
    VSS_FSBT_INCREMENTAL_BACKUP_REQUIRED = 4
    VSS_FSBT_LOG_BACKUP_REQUIRED = 8
    VSS_FSBT_FULL_SNAPSHOT_REQUIRED = 256
    VSS_FSBT_DIFFERENTIAL_SNAPSHOT_REQUIRED = 512
    VSS_FSBT_INCREMENTAL_SNAPSHOT_REQUIRED = 1024
    VSS_FSBT_LOG_SNAPSHOT_REQUIRED = 2048
    VSS_FSBT_CREATED_DURING_BACKUP = 65536
    VSS_FSBT_ALL_BACKUP_REQUIRED = 15
    VSS_FSBT_ALL_SNAPSHOT_REQUIRED = 3840
  end

  enum VSS_BACKUP_SCHEMA : Int32
    VSS_BS_UNDEFINED = 0
    VSS_BS_DIFFERENTIAL = 1
    VSS_BS_INCREMENTAL = 2
    VSS_BS_EXCLUSIVE_INCREMENTAL_DIFFERENTIAL = 4
    VSS_BS_LOG = 8
    VSS_BS_COPY = 16
    VSS_BS_TIMESTAMPED = 32
    VSS_BS_LAST_MODIFY = 64
    VSS_BS_LSN = 128
    VSS_BS_WRITER_SUPPORTS_NEW_TARGET = 256
    VSS_BS_WRITER_SUPPORTS_RESTORE_WITH_MOVE = 512
    VSS_BS_INDEPENDENT_SYSTEM_STATE = 1024
    VSS_BS_ROLLFORWARD_RESTORE = 4096
    VSS_BS_RESTORE_RENAME = 8192
    VSS_BS_AUTHORITATIVE_RESTORE = 16384
    VSS_BS_WRITER_SUPPORTS_PARALLEL_RESTORES = 32768
  end

  enum VSS_USAGE_TYPE : Int32
    VSS_UT_UNDEFINED = 0
    VSS_UT_BOOTABLESYSTEMSTATE = 1
    VSS_UT_SYSTEMSERVICE = 2
    VSS_UT_USERDATA = 3
    VSS_UT_OTHER = 4
  end

  enum VSS_SOURCE_TYPE : Int32
    VSS_ST_UNDEFINED = 0
    VSS_ST_TRANSACTEDDB = 1
    VSS_ST_NONTRANSACTEDDB = 2
    VSS_ST_OTHER = 3
  end

  enum VSS_RESTOREMETHOD_ENUM : Int32
    VSS_RME_UNDEFINED = 0
    VSS_RME_RESTORE_IF_NOT_THERE = 1
    VSS_RME_RESTORE_IF_CAN_REPLACE = 2
    VSS_RME_STOP_RESTORE_START = 3
    VSS_RME_RESTORE_TO_ALTERNATE_LOCATION = 4
    VSS_RME_RESTORE_AT_REBOOT = 5
    VSS_RME_RESTORE_AT_REBOOT_IF_CANNOT_REPLACE = 6
    VSS_RME_CUSTOM = 7
    VSS_RME_RESTORE_STOP_START = 8
  end

  enum VSS_WRITERRESTORE_ENUM : Int32
    VSS_WRE_UNDEFINED = 0
    VSS_WRE_NEVER = 1
    VSS_WRE_IF_REPLACE_FAILS = 2
    VSS_WRE_ALWAYS = 3
  end

  enum VSS_COMPONENT_TYPE : Int32
    VSS_CT_UNDEFINED = 0
    VSS_CT_DATABASE = 1
    VSS_CT_FILEGROUP = 2
  end

  enum VSS_ALTERNATE_WRITER_STATE : Int32
    VSS_AWS_UNDEFINED = 0
    VSS_AWS_NO_ALTERNATE_WRITER = 1
    VSS_AWS_ALTERNATE_WRITER_EXISTS = 2
    VSS_AWS_THIS_IS_ALTERNATE_WRITER = 3
  end

  enum VSS_SUBSCRIBE_MASK : Int32
    VSS_SM_POST_SNAPSHOT_FLAG = 1
    VSS_SM_BACKUP_EVENTS_FLAG = 2
    VSS_SM_RESTORE_EVENTS_FLAG = 4
    VSS_SM_IO_THROTTLING_FLAG = 8
    VSS_SM_ALL_FLAGS = -1
  end

  enum VSS_RESTORE_TARGET : Int32
    VSS_RT_UNDEFINED = 0
    VSS_RT_ORIGINAL = 1
    VSS_RT_ALTERNATE = 2
    VSS_RT_DIRECTED = 3
    VSS_RT_ORIGINAL_LOCATION = 4
  end

  enum VSS_FILE_RESTORE_STATUS : Int32
    VSS_RS_UNDEFINED = 0
    VSS_RS_NONE = 1
    VSS_RS_ALL = 2
    VSS_RS_FAILED = 3
  end

  enum VSS_COMPONENT_FLAGS : Int32
    VSS_CF_BACKUP_RECOVERY = 1
    VSS_CF_APP_ROLLBACK_RECOVERY = 2
    VSS_CF_NOT_SYSTEM_STATE = 4
  end

  enum VSS_MGMT_OBJECT_TYPE : Int32
    VSS_MGMT_OBJECT_UNKNOWN = 0
    VSS_MGMT_OBJECT_VOLUME = 1
    VSS_MGMT_OBJECT_DIFF_VOLUME = 2
    VSS_MGMT_OBJECT_DIFF_AREA = 3
  end

  enum VSS_PROTECTION_LEVEL : Int32
    VSS_PROTECTION_LEVEL_ORIGINAL_VOLUME = 0
    VSS_PROTECTION_LEVEL_SNAPSHOT = 1
  end

  enum VSS_PROTECTION_FAULT : Int32
    VSS_PROTECTION_FAULT_NONE = 0
    VSS_PROTECTION_FAULT_DIFF_AREA_MISSING = 1
    VSS_PROTECTION_FAULT_IO_FAILURE_DURING_ONLINE = 2
    VSS_PROTECTION_FAULT_META_DATA_CORRUPTION = 3
    VSS_PROTECTION_FAULT_MEMORY_ALLOCATION_FAILURE = 4
    VSS_PROTECTION_FAULT_MAPPED_MEMORY_FAILURE = 5
    VSS_PROTECTION_FAULT_COW_READ_FAILURE = 6
    VSS_PROTECTION_FAULT_COW_WRITE_FAILURE = 7
    VSS_PROTECTION_FAULT_DIFF_AREA_FULL = 8
    VSS_PROTECTION_FAULT_GROW_TOO_SLOW = 9
    VSS_PROTECTION_FAULT_GROW_FAILED = 10
    VSS_PROTECTION_FAULT_DESTROY_ALL_SNAPSHOTS = 11
    VSS_PROTECTION_FAULT_FILE_SYSTEM_FAILURE = 12
    VSS_PROTECTION_FAULT_IO_FAILURE = 13
    VSS_PROTECTION_FAULT_DIFF_AREA_REMOVED = 14
    VSS_PROTECTION_FAULT_EXTERNAL_WRITER_TO_DIFF_AREA = 15
    VSS_PROTECTION_FAULT_MOUNT_DURING_CLUSTER_OFFLINE = 16
  end

  union VSS_OBJECT_UNION
    snap : VSS_SNAPSHOT_PROP
    prov : VSS_PROVIDER_PROP
  end
  union VSS_MGMT_OBJECT_UNION
    vol : VSS_VOLUME_PROP
    diff_vol : VSS_DIFF_VOLUME_PROP
    diff_area : VSS_DIFF_AREA_PROP
  end

  struct VSS_SNAPSHOT_PROP
    m_snapshot_id : Guid
    m_snapshot_set_id : Guid
    m_l_snapshots_count : Int32
    m_pwsz_snapshot_device_object : UInt16*
    m_pwsz_original_volume_name : UInt16*
    m_pwsz_originating_machine : UInt16*
    m_pwsz_service_machine : UInt16*
    m_pwsz_exposed_name : UInt16*
    m_pwsz_exposed_path : UInt16*
    m_provider_id : Guid
    m_l_snapshot_attributes : Int32
    m_ts_creation_timestamp : Int64
    m_e_status : VSS_SNAPSHOT_STATE
  end
  struct VSS_PROVIDER_PROP
    m_provider_id : Guid
    m_pwsz_provider_name : UInt16*
    m_e_provider_type : VSS_PROVIDER_TYPE
    m_pwsz_provider_version : UInt16*
    m_provider_version_id : Guid
    m_class_id : Guid
  end
  struct VSS_OBJECT_PROP
    type : VSS_OBJECT_TYPE
    obj : VSS_OBJECT_UNION
  end
  struct VSS_VOLUME_PROP
    m_pwsz_volume_name : UInt16*
    m_pwsz_volume_display_name : UInt16*
  end
  struct VSS_DIFF_VOLUME_PROP
    m_pwsz_volume_name : UInt16*
    m_pwsz_volume_display_name : UInt16*
    m_ll_volume_free_space : Int64
    m_ll_volume_total_space : Int64
  end
  struct VSS_DIFF_AREA_PROP
    m_pwsz_volume_name : UInt16*
    m_pwsz_diff_area_volume_name : UInt16*
    m_ll_maximum_diff_space : Int64
    m_ll_allocated_diff_space : Int64
    m_ll_used_diff_space : Int64
  end
  struct VSS_MGMT_OBJECT_PROP
    type : VSS_MGMT_OBJECT_TYPE
    obj : VSS_MGMT_OBJECT_UNION
  end
  struct VSS_VOLUME_PROTECTION_INFO
    m_protection_level : VSS_PROTECTION_LEVEL
    m_volume_is_offline_for_protection : LibC::BOOL
    m_protection_fault : VSS_PROTECTION_FAULT
    m_failure_status : Int32
    m_volume_has_unused_diff_area : LibC::BOOL
    m_reserved : UInt32
  end


  struct IVssEnumObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IVssEnumObject_GUID = "ae1c7110-2f60-11d3-8a39-00c04f72d8e3"
  IID_IVssEnumObject = LibC::GUID.new(0xae1c7110_u32, 0x2f60_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x39_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x72_u8, 0xd8_u8, 0xe3_u8])
  struct IVssEnumObject
    lpVtbl : IVssEnumObjectVTbl*
  end

  struct IVssAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cancel : UInt64
    wait : UInt64
    query_status : UInt64
  end

  IVssAsync_GUID = "507c37b4-cf5b-4e95-b0af-14eb9767467e"
  IID_IVssAsync = LibC::GUID.new(0x507c37b4_u32, 0xcf5b_u16, 0x4e95_u16, StaticArray[0xb0_u8, 0xaf_u8, 0x14_u8, 0xeb_u8, 0x97_u8, 0x67_u8, 0x46_u8, 0x7e_u8])
  struct IVssAsync
    lpVtbl : IVssAsyncVTbl*
  end

  struct IVssWMFiledescVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_path : UInt64
    get_filespec : UInt64
    get_recursive : UInt64
    get_alternate_location : UInt64
    get_backup_type_mask : UInt64
  end

  struct IVssWMFiledesc
    lpVtbl : IVssWMFiledescVTbl*
  end

  struct IVssWMDependencyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_writer_id : UInt64
    get_logical_path : UInt64
    get_component_name : UInt64
  end

  struct IVssWMDependency
    lpVtbl : IVssWMDependencyVTbl*
  end

  struct IVssComponentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_logical_path : UInt64
    get_component_type : UInt64
    get_component_name : UInt64
    get_backup_succeeded : UInt64
    get_alternate_location_mapping_count : UInt64
    get_alternate_location_mapping : UInt64
    set_backup_metadata : UInt64
    get_backup_metadata : UInt64
    add_partial_file : UInt64
    get_partial_file_count : UInt64
    get_partial_file : UInt64
    is_selected_for_restore : UInt64
    get_additional_restores : UInt64
    get_new_target_count : UInt64
    get_new_target : UInt64
    add_directed_target : UInt64
    get_directed_target_count : UInt64
    get_directed_target : UInt64
    set_restore_metadata : UInt64
    get_restore_metadata : UInt64
    set_restore_target : UInt64
    get_restore_target : UInt64
    set_pre_restore_failure_msg : UInt64
    get_pre_restore_failure_msg : UInt64
    set_post_restore_failure_msg : UInt64
    get_post_restore_failure_msg : UInt64
    set_backup_stamp : UInt64
    get_backup_stamp : UInt64
    get_previous_backup_stamp : UInt64
    get_backup_options : UInt64
    get_restore_options : UInt64
    get_restore_subcomponent_count : UInt64
    get_restore_subcomponent : UInt64
    get_file_restore_status : UInt64
    add_differenced_files_by_last_modify_time : UInt64
    add_differenced_files_by_last_modify_lsn : UInt64
    get_differenced_files_count : UInt64
    get_differenced_file : UInt64
  end

  IVssComponent_GUID = "d2c72c96-c121-4518-b627-e5a93d010ead"
  IID_IVssComponent = LibC::GUID.new(0xd2c72c96_u32, 0xc121_u16, 0x4518_u16, StaticArray[0xb6_u8, 0x27_u8, 0xe5_u8, 0xa9_u8, 0x3d_u8, 0x1_u8, 0xe_u8, 0xad_u8])
  struct IVssComponent
    lpVtbl : IVssComponentVTbl*
  end

  struct IVssWriterComponentsVTbl
    get_component_count : UInt64
    get_writer_info : UInt64
    get_component : UInt64
  end

  struct IVssWriterComponents
    lpVtbl : IVssWriterComponentsVTbl*
  end

  struct IVssComponentExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_logical_path : UInt64
    get_component_type : UInt64
    get_component_name : UInt64
    get_backup_succeeded : UInt64
    get_alternate_location_mapping_count : UInt64
    get_alternate_location_mapping : UInt64
    set_backup_metadata : UInt64
    get_backup_metadata : UInt64
    add_partial_file : UInt64
    get_partial_file_count : UInt64
    get_partial_file : UInt64
    is_selected_for_restore : UInt64
    get_additional_restores : UInt64
    get_new_target_count : UInt64
    get_new_target : UInt64
    add_directed_target : UInt64
    get_directed_target_count : UInt64
    get_directed_target : UInt64
    set_restore_metadata : UInt64
    get_restore_metadata : UInt64
    set_restore_target : UInt64
    get_restore_target : UInt64
    set_pre_restore_failure_msg : UInt64
    get_pre_restore_failure_msg : UInt64
    set_post_restore_failure_msg : UInt64
    get_post_restore_failure_msg : UInt64
    set_backup_stamp : UInt64
    get_backup_stamp : UInt64
    get_previous_backup_stamp : UInt64
    get_backup_options : UInt64
    get_restore_options : UInt64
    get_restore_subcomponent_count : UInt64
    get_restore_subcomponent : UInt64
    get_file_restore_status : UInt64
    add_differenced_files_by_last_modify_time : UInt64
    add_differenced_files_by_last_modify_lsn : UInt64
    get_differenced_files_count : UInt64
    get_differenced_file : UInt64
    set_prepare_for_backup_failure_msg : UInt64
    set_post_snapshot_failure_msg : UInt64
    get_prepare_for_backup_failure_msg : UInt64
    get_post_snapshot_failure_msg : UInt64
    get_authoritative_restore : UInt64
    get_roll_forward : UInt64
    get_restore_name : UInt64
  end

  IVssComponentEx_GUID = "156c8b5e-f131-4bd7-9c97-d1923be7e1fa"
  IID_IVssComponentEx = LibC::GUID.new(0x156c8b5e_u32, 0xf131_u16, 0x4bd7_u16, StaticArray[0x9c_u8, 0x97_u8, 0xd1_u8, 0x92_u8, 0x3b_u8, 0xe7_u8, 0xe1_u8, 0xfa_u8])
  struct IVssComponentEx
    lpVtbl : IVssComponentExVTbl*
  end

  struct IVssComponentEx2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_logical_path : UInt64
    get_component_type : UInt64
    get_component_name : UInt64
    get_backup_succeeded : UInt64
    get_alternate_location_mapping_count : UInt64
    get_alternate_location_mapping : UInt64
    set_backup_metadata : UInt64
    get_backup_metadata : UInt64
    add_partial_file : UInt64
    get_partial_file_count : UInt64
    get_partial_file : UInt64
    is_selected_for_restore : UInt64
    get_additional_restores : UInt64
    get_new_target_count : UInt64
    get_new_target : UInt64
    add_directed_target : UInt64
    get_directed_target_count : UInt64
    get_directed_target : UInt64
    set_restore_metadata : UInt64
    get_restore_metadata : UInt64
    set_restore_target : UInt64
    get_restore_target : UInt64
    set_pre_restore_failure_msg : UInt64
    get_pre_restore_failure_msg : UInt64
    set_post_restore_failure_msg : UInt64
    get_post_restore_failure_msg : UInt64
    set_backup_stamp : UInt64
    get_backup_stamp : UInt64
    get_previous_backup_stamp : UInt64
    get_backup_options : UInt64
    get_restore_options : UInt64
    get_restore_subcomponent_count : UInt64
    get_restore_subcomponent : UInt64
    get_file_restore_status : UInt64
    add_differenced_files_by_last_modify_time : UInt64
    add_differenced_files_by_last_modify_lsn : UInt64
    get_differenced_files_count : UInt64
    get_differenced_file : UInt64
    set_prepare_for_backup_failure_msg : UInt64
    set_post_snapshot_failure_msg : UInt64
    get_prepare_for_backup_failure_msg : UInt64
    get_post_snapshot_failure_msg : UInt64
    get_authoritative_restore : UInt64
    get_roll_forward : UInt64
    get_restore_name : UInt64
    set_failure : UInt64
    get_failure : UInt64
  end

  IVssComponentEx2_GUID = "3b5be0f2-07a9-4e4b-bdd3-cfdc8e2c0d2d"
  IID_IVssComponentEx2 = LibC::GUID.new(0x3b5be0f2_u32, 0x7a9_u16, 0x4e4b_u16, StaticArray[0xbd_u8, 0xd3_u8, 0xcf_u8, 0xdc_u8, 0x8e_u8, 0x2c_u8, 0xd_u8, 0x2d_u8])
  struct IVssComponentEx2
    lpVtbl : IVssComponentEx2VTbl*
  end

  struct IVssCreateWriterMetadataVTbl
    add_include_files : UInt64
    add_exclude_files : UInt64
    add_component : UInt64
    add_database_files : UInt64
    add_database_log_files : UInt64
    add_files_to_file_group : UInt64
    set_restore_method : UInt64
    add_alternate_location_mapping : UInt64
    add_component_dependency : UInt64
    set_backup_schema : UInt64
    get_document : UInt64
    save_as_xml : UInt64
  end

  struct IVssCreateWriterMetadata
    lpVtbl : IVssCreateWriterMetadataVTbl*
  end

  struct IVssWriterImplVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    subscribe : UInt64
    unsubscribe : UInt64
    uninitialize : UInt64
    get_current_volume_array : UInt64
    get_current_volume_count : UInt64
    get_snapshot_device_name : UInt64
    get_current_snapshot_set_id : UInt64
    get_context : UInt64
    get_current_level : UInt64
    is_path_affected : UInt64
    is_bootable_system_state_backed_up : UInt64
    are_components_selected : UInt64
    get_backup_type : UInt64
    get_restore_type : UInt64
    set_writer_failure : UInt64
    is_partial_file_support_enabled : UInt64
    install_alternate_writer : UInt64
    get_identity_information : UInt64
    set_writer_failure_ex : UInt64
    get_session_id : UInt64
    is_writer_shutting_down : UInt64
  end

  struct IVssWriterImpl
    lpVtbl : IVssWriterImplVTbl*
  end

  struct IVssCreateExpressWriterMetadataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_exclude_files : UInt64
    add_component : UInt64
    add_files_to_file_group : UInt64
    set_restore_method : UInt64
    add_component_dependency : UInt64
    set_backup_schema : UInt64
    save_as_xml : UInt64
  end

  IVssCreateExpressWriterMetadata_GUID = "9c772e77-b26e-427f-92dd-c996f41ea5e3"
  IID_IVssCreateExpressWriterMetadata = LibC::GUID.new(0x9c772e77_u32, 0xb26e_u16, 0x427f_u16, StaticArray[0x92_u8, 0xdd_u8, 0xc9_u8, 0x96_u8, 0xf4_u8, 0x1e_u8, 0xa5_u8, 0xe3_u8])
  struct IVssCreateExpressWriterMetadata
    lpVtbl : IVssCreateExpressWriterMetadataVTbl*
  end

  struct IVssExpressWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_metadata : UInt64
    load_metadata : UInt64
    register : UInt64
    unregister : UInt64
  end

  IVssExpressWriter_GUID = "e33affdc-59c7-47b1-97d5-4266598f6235"
  IID_IVssExpressWriter = LibC::GUID.new(0xe33affdc_u32, 0x59c7_u16, 0x47b1_u16, StaticArray[0x97_u8, 0xd5_u8, 0x42_u8, 0x66_u8, 0x59_u8, 0x8f_u8, 0x62_u8, 0x35_u8])
  struct IVssExpressWriter
    lpVtbl : IVssExpressWriterVTbl*
  end

  struct IVssSnapshotMgmtVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_provider_mgmt_interface : UInt64
    query_volumes_supported_for_snapshots : UInt64
    query_snapshots_by_volume : UInt64
  end

  IVssSnapshotMgmt_GUID = "fa7df749-66e7-4986-a27f-e2f04ae53772"
  IID_IVssSnapshotMgmt = LibC::GUID.new(0xfa7df749_u32, 0x66e7_u16, 0x4986_u16, StaticArray[0xa2_u8, 0x7f_u8, 0xe2_u8, 0xf0_u8, 0x4a_u8, 0xe5_u8, 0x37_u8, 0x72_u8])
  struct IVssSnapshotMgmt
    lpVtbl : IVssSnapshotMgmtVTbl*
  end

  struct IVssSnapshotMgmt2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_min_diff_area_size : UInt64
  end

  IVssSnapshotMgmt2_GUID = "0f61ec39-fe82-45f2-a3f0-768b5d427102"
  IID_IVssSnapshotMgmt2 = LibC::GUID.new(0xf61ec39_u32, 0xfe82_u16, 0x45f2_u16, StaticArray[0xa3_u8, 0xf0_u8, 0x76_u8, 0x8b_u8, 0x5d_u8, 0x42_u8, 0x71_u8, 0x2_u8])
  struct IVssSnapshotMgmt2
    lpVtbl : IVssSnapshotMgmt2VTbl*
  end

  struct IVssDifferentialSoftwareSnapshotMgmtVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_diff_area : UInt64
    change_diff_area_maximum_size : UInt64
    query_volumes_supported_for_diff_areas : UInt64
    query_diff_areas_for_volume : UInt64
    query_diff_areas_on_volume : UInt64
    query_diff_areas_for_snapshot : UInt64
  end

  IVssDifferentialSoftwareSnapshotMgmt_GUID = "214a0f28-b737-4026-b847-4f9e37d79529"
  IID_IVssDifferentialSoftwareSnapshotMgmt = LibC::GUID.new(0x214a0f28_u32, 0xb737_u16, 0x4026_u16, StaticArray[0xb8_u8, 0x47_u8, 0x4f_u8, 0x9e_u8, 0x37_u8, 0xd7_u8, 0x95_u8, 0x29_u8])
  struct IVssDifferentialSoftwareSnapshotMgmt
    lpVtbl : IVssDifferentialSoftwareSnapshotMgmtVTbl*
  end

  struct IVssDifferentialSoftwareSnapshotMgmt2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_diff_area : UInt64
    change_diff_area_maximum_size : UInt64
    query_volumes_supported_for_diff_areas : UInt64
    query_diff_areas_for_volume : UInt64
    query_diff_areas_on_volume : UInt64
    query_diff_areas_for_snapshot : UInt64
    change_diff_area_maximum_size_ex : UInt64
    migrate_diff_areas : UInt64
    query_migration_status : UInt64
    set_snapshot_priority : UInt64
  end

  IVssDifferentialSoftwareSnapshotMgmt2_GUID = "949d7353-675f-4275-8969-f044c6277815"
  IID_IVssDifferentialSoftwareSnapshotMgmt2 = LibC::GUID.new(0x949d7353_u32, 0x675f_u16, 0x4275_u16, StaticArray[0x89_u8, 0x69_u8, 0xf0_u8, 0x44_u8, 0xc6_u8, 0x27_u8, 0x78_u8, 0x15_u8])
  struct IVssDifferentialSoftwareSnapshotMgmt2
    lpVtbl : IVssDifferentialSoftwareSnapshotMgmt2VTbl*
  end

  struct IVssDifferentialSoftwareSnapshotMgmt3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_diff_area : UInt64
    change_diff_area_maximum_size : UInt64
    query_volumes_supported_for_diff_areas : UInt64
    query_diff_areas_for_volume : UInt64
    query_diff_areas_on_volume : UInt64
    query_diff_areas_for_snapshot : UInt64
    change_diff_area_maximum_size_ex : UInt64
    migrate_diff_areas : UInt64
    query_migration_status : UInt64
    set_snapshot_priority : UInt64
    set_volume_protect_level : UInt64
    get_volume_protect_level : UInt64
    clear_volume_protect_fault : UInt64
    delete_unused_diff_areas : UInt64
    query_snapshot_delta_bitmap : UInt64
  end

  IVssDifferentialSoftwareSnapshotMgmt3_GUID = "383f7e71-a4c5-401f-b27f-f826289f8458"
  IID_IVssDifferentialSoftwareSnapshotMgmt3 = LibC::GUID.new(0x383f7e71_u32, 0xa4c5_u16, 0x401f_u16, StaticArray[0xb2_u8, 0x7f_u8, 0xf8_u8, 0x26_u8, 0x28_u8, 0x9f_u8, 0x84_u8, 0x58_u8])
  struct IVssDifferentialSoftwareSnapshotMgmt3
    lpVtbl : IVssDifferentialSoftwareSnapshotMgmt3VTbl*
  end

  struct IVssEnumMgmtObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IVssEnumMgmtObject_GUID = "01954e6b-9254-4e6e-808c-c9e05d007696"
  IID_IVssEnumMgmtObject = LibC::GUID.new(0x1954e6b_u32, 0x9254_u16, 0x4e6e_u16, StaticArray[0x80_u8, 0x8c_u8, 0xc9_u8, 0xe0_u8, 0x5d_u8, 0x0_u8, 0x76_u8, 0x96_u8])
  struct IVssEnumMgmtObject
    lpVtbl : IVssEnumMgmtObjectVTbl*
  end

  struct IVssAdminVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_provider : UInt64
    unregister_provider : UInt64
    query_providers : UInt64
    abort_all_snapshots_in_progress : UInt64
  end

  IVssAdmin_GUID = "77ed5996-2f63-11d3-8a39-00c04f72d8e3"
  IID_IVssAdmin = LibC::GUID.new(0x77ed5996_u32, 0x2f63_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x39_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x72_u8, 0xd8_u8, 0xe3_u8])
  struct IVssAdmin
    lpVtbl : IVssAdminVTbl*
  end

  struct IVssAdminExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_provider : UInt64
    unregister_provider : UInt64
    query_providers : UInt64
    abort_all_snapshots_in_progress : UInt64
    get_provider_capability : UInt64
    get_provider_context : UInt64
    set_provider_context : UInt64
  end

  IVssAdminEx_GUID = "7858a9f8-b1fa-41a6-964f-b9b36b8cd8d8"
  IID_IVssAdminEx = LibC::GUID.new(0x7858a9f8_u32, 0xb1fa_u16, 0x41a6_u16, StaticArray[0x96_u8, 0x4f_u8, 0xb9_u8, 0xb3_u8, 0x6b_u8, 0x8c_u8, 0xd8_u8, 0xd8_u8])
  struct IVssAdminEx
    lpVtbl : IVssAdminExVTbl*
  end

  struct IVssSoftwareSnapshotProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_context : UInt64
    get_snapshot_properties : UInt64
    query : UInt64
    delete_snapshots : UInt64
    begin_prepare_snapshot : UInt64
    is_volume_supported : UInt64
    is_volume_snapshotted : UInt64
    set_snapshot_property : UInt64
    revert_to_snapshot : UInt64
    query_revert_status : UInt64
  end

  IVssSoftwareSnapshotProvider_GUID = "609e123e-2c5a-44d3-8f01-0b1d9a47d1ff"
  IID_IVssSoftwareSnapshotProvider = LibC::GUID.new(0x609e123e_u32, 0x2c5a_u16, 0x44d3_u16, StaticArray[0x8f_u8, 0x1_u8, 0xb_u8, 0x1d_u8, 0x9a_u8, 0x47_u8, 0xd1_u8, 0xff_u8])
  struct IVssSoftwareSnapshotProvider
    lpVtbl : IVssSoftwareSnapshotProviderVTbl*
  end

  struct IVssProviderCreateSnapshotSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    end_prepare_snapshots : UInt64
    pre_commit_snapshots : UInt64
    commit_snapshots : UInt64
    post_commit_snapshots : UInt64
    pre_final_commit_snapshots : UInt64
    post_final_commit_snapshots : UInt64
    abort_snapshots : UInt64
  end

  IVssProviderCreateSnapshotSet_GUID = "5f894e5b-1e39-4778-8e23-9abad9f0e08c"
  IID_IVssProviderCreateSnapshotSet = LibC::GUID.new(0x5f894e5b_u32, 0x1e39_u16, 0x4778_u16, StaticArray[0x8e_u8, 0x23_u8, 0x9a_u8, 0xba_u8, 0xd9_u8, 0xf0_u8, 0xe0_u8, 0x8c_u8])
  struct IVssProviderCreateSnapshotSet
    lpVtbl : IVssProviderCreateSnapshotSetVTbl*
  end

  struct IVssProviderNotificationsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_load : UInt64
    on_unload : UInt64
  end

  IVssProviderNotifications_GUID = "e561901f-03a5-4afe-86d0-72baeece7004"
  IID_IVssProviderNotifications = LibC::GUID.new(0xe561901f_u32, 0x3a5_u16, 0x4afe_u16, StaticArray[0x86_u8, 0xd0_u8, 0x72_u8, 0xba_u8, 0xee_u8, 0xce_u8, 0x70_u8, 0x4_u8])
  struct IVssProviderNotifications
    lpVtbl : IVssProviderNotificationsVTbl*
  end

  struct IVssHardwareSnapshotProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    are_luns_supported : UInt64
    fill_in_lun_info : UInt64
    begin_prepare_snapshot : UInt64
    get_target_luns : UInt64
    locate_luns : UInt64
    on_lun_empty : UInt64
  end

  IVssHardwareSnapshotProvider_GUID = "9593a157-44e9-4344-bbeb-44fbf9b06b10"
  IID_IVssHardwareSnapshotProvider = LibC::GUID.new(0x9593a157_u32, 0x44e9_u16, 0x4344_u16, StaticArray[0xbb_u8, 0xeb_u8, 0x44_u8, 0xfb_u8, 0xf9_u8, 0xb0_u8, 0x6b_u8, 0x10_u8])
  struct IVssHardwareSnapshotProvider
    lpVtbl : IVssHardwareSnapshotProviderVTbl*
  end

  struct IVssHardwareSnapshotProviderExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    are_luns_supported : UInt64
    fill_in_lun_info : UInt64
    begin_prepare_snapshot : UInt64
    get_target_luns : UInt64
    locate_luns : UInt64
    on_lun_empty : UInt64
    get_provider_capabilities : UInt64
    on_lun_state_change : UInt64
    resync_luns : UInt64
    on_reuse_luns : UInt64
  end

  IVssHardwareSnapshotProviderEx_GUID = "7f5ba925-cdb1-4d11-a71f-339eb7e709fd"
  IID_IVssHardwareSnapshotProviderEx = LibC::GUID.new(0x7f5ba925_u32, 0xcdb1_u16, 0x4d11_u16, StaticArray[0xa7_u8, 0x1f_u8, 0x33_u8, 0x9e_u8, 0xb7_u8, 0xe7_u8, 0x9_u8, 0xfd_u8])
  struct IVssHardwareSnapshotProviderEx
    lpVtbl : IVssHardwareSnapshotProviderExVTbl*
  end

  struct IVssFileShareSnapshotProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_context : UInt64
    get_snapshot_properties : UInt64
    query : UInt64
    delete_snapshots : UInt64
    begin_prepare_snapshot : UInt64
    is_path_supported : UInt64
    is_path_snapshotted : UInt64
    set_snapshot_property : UInt64
  end

  IVssFileShareSnapshotProvider_GUID = "c8636060-7c2e-11df-8c4a-0800200c9a66"
  IID_IVssFileShareSnapshotProvider = LibC::GUID.new(0xc8636060_u32, 0x7c2e_u16, 0x11df_u16, StaticArray[0x8c_u8, 0x4a_u8, 0x8_u8, 0x0_u8, 0x20_u8, 0xc_u8, 0x9a_u8, 0x66_u8])
  struct IVssFileShareSnapshotProvider
    lpVtbl : IVssFileShareSnapshotProviderVTbl*
  end


  # Params # ppwriter : IVssExpressWriter* [In]
  fun CreateVssExpressWriterInternal(ppwriter : IVssExpressWriter*) : HRESULT
end
struct LibWin32::IVssEnumObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : VSS_OBJECT_PROP*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, VSS_OBJECT_PROP*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IVssEnumObject*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IVssAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def wait(dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait.unsafe_as(Proc(UInt32, HRESULT)).call(dwmilliseconds)
  end
  def query_status(phrresult : HRESULT*, preserved : Int32*) : HRESULT
    @lpVtbl.value.query_status.unsafe_as(Proc(HRESULT*, Int32*, HRESULT)).call(phrresult, preserved)
  end
end
struct LibWin32::IVssWMFiledesc
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_path(pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpath)
  end
  def get_filespec(pbstrfilespec : UInt8**) : HRESULT
    @lpVtbl.value.get_filespec.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfilespec)
  end
  def get_recursive(pbrecursive : Bool*) : HRESULT
    @lpVtbl.value.get_recursive.unsafe_as(Proc(Bool*, HRESULT)).call(pbrecursive)
  end
  def get_alternate_location(pbstralternatelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_alternate_location.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstralternatelocation)
  end
  def get_backup_type_mask(pdwtypemask : UInt32*) : HRESULT
    @lpVtbl.value.get_backup_type_mask.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtypemask)
  end
end
struct LibWin32::IVssWMDependency
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_writer_id(pwriterid : Guid*) : HRESULT
    @lpVtbl.value.get_writer_id.unsafe_as(Proc(Guid*, HRESULT)).call(pwriterid)
  end
  def get_logical_path(pbstrlogicalpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlogicalpath)
  end
  def get_component_name(pbstrcomponentname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcomponentname)
  end
end
struct LibWin32::IVssComponent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_logical_path(pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpath)
  end
  def get_component_type(pct : VSS_COMPONENT_TYPE*) : HRESULT
    @lpVtbl.value.get_component_type.unsafe_as(Proc(VSS_COMPONENT_TYPE*, HRESULT)).call(pct)
  end
  def get_component_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_backup_succeeded(pbsucceeded : Bool*) : HRESULT
    @lpVtbl.value.get_backup_succeeded.unsafe_as(Proc(Bool*, HRESULT)).call(pbsucceeded)
  end
  def get_alternate_location_mapping_count(pcmappings : UInt32*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcmappings)
  end
  def get_alternate_location_mapping(imapping : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping.unsafe_as(Proc(UInt32, IVssWMFiledesc*, HRESULT)).call(imapping, ppfiledesc)
  end
  def set_backup_metadata(wszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_metadata.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszdata)
  end
  def get_backup_metadata(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_metadata.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def add_partial_file(wszpath : LibC::LPWSTR, wszfilename : LibC::LPWSTR, wszranges : LibC::LPWSTR, wszmetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_partial_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszpath, wszfilename, wszranges, wszmetadata)
  end
  def get_partial_file_count(pcpartialfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_partial_file_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcpartialfiles)
  end
  def get_partial_file(ipartialfile : UInt32, pbstrpath : UInt8**, pbstrfilename : UInt8**, pbstrrange : UInt8**, pbstrmetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_partial_file.unsafe_as(Proc(UInt32, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)).call(ipartialfile, pbstrpath, pbstrfilename, pbstrrange, pbstrmetadata)
  end
  def is_selected_for_restore(pbselectedforrestore : Bool*) : HRESULT
    @lpVtbl.value.is_selected_for_restore.unsafe_as(Proc(Bool*, HRESULT)).call(pbselectedforrestore)
  end
  def get_additional_restores(pbadditionalrestores : Bool*) : HRESULT
    @lpVtbl.value.get_additional_restores.unsafe_as(Proc(Bool*, HRESULT)).call(pbadditionalrestores)
  end
  def get_new_target_count(pcnewtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_new_target_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcnewtarget)
  end
  def get_new_target(inewtarget : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_new_target.unsafe_as(Proc(UInt32, IVssWMFiledesc*, HRESULT)).call(inewtarget, ppfiledesc)
  end
  def add_directed_target(wszsourcepath : LibC::LPWSTR, wszsourcefilename : LibC::LPWSTR, wszsourcerangelist : LibC::LPWSTR, wszdestinationpath : LibC::LPWSTR, wszdestinationfilename : LibC::LPWSTR, wszdestinationrangelist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_directed_target.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszsourcepath, wszsourcefilename, wszsourcerangelist, wszdestinationpath, wszdestinationfilename, wszdestinationrangelist)
  end
  def get_directed_target_count(pcdirectedtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_directed_target_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcdirectedtarget)
  end
  def get_directed_target(idirectedtarget : UInt32, pbstrsourcepath : UInt8**, pbstrsourcefilename : UInt8**, pbstrsourcerangelist : UInt8**, pbstrdestinationpath : UInt8**, pbstrdestinationfilename : UInt8**, pbstrdestinationrangelist : UInt8**) : HRESULT
    @lpVtbl.value.get_directed_target.unsafe_as(Proc(UInt32, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)).call(idirectedtarget, pbstrsourcepath, pbstrsourcefilename, pbstrsourcerangelist, pbstrdestinationpath, pbstrdestinationfilename, pbstrdestinationrangelist)
  end
  def set_restore_metadata(wszrestoremetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_restore_metadata.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszrestoremetadata)
  end
  def get_restore_metadata(pbstrrestoremetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_metadata.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrestoremetadata)
  end
  def set_restore_target(target : VSS_RESTORE_TARGET) : HRESULT
    @lpVtbl.value.set_restore_target.unsafe_as(Proc(VSS_RESTORE_TARGET, HRESULT)).call(target)
  end
  def get_restore_target(ptarget : VSS_RESTORE_TARGET*) : HRESULT
    @lpVtbl.value.get_restore_target.unsafe_as(Proc(VSS_RESTORE_TARGET*, HRESULT)).call(ptarget)
  end
  def set_pre_restore_failure_msg(wszprerestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_pre_restore_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszprerestorefailuremsg)
  end
  def get_pre_restore_failure_msg(pbstrprerestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_pre_restore_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrprerestorefailuremsg)
  end
  def set_post_restore_failure_msg(wszpostrestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_restore_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszpostrestorefailuremsg)
  end
  def get_post_restore_failure_msg(pbstrpostrestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_restore_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpostrestorefailuremsg)
  end
  def set_backup_stamp(wszbackupstamp : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_stamp.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszbackupstamp)
  end
  def get_backup_stamp(pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_stamp.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupstamp)
  end
  def get_previous_backup_stamp(pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_previous_backup_stamp.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupstamp)
  end
  def get_backup_options(pbstrbackupoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_options.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupoptions)
  end
  def get_restore_options(pbstrrestoreoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_options.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrestoreoptions)
  end
  def get_restore_subcomponent_count(pcrestoresubcomponent : UInt32*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcrestoresubcomponent)
  end
  def get_restore_subcomponent(icomponent : UInt32, pbstrlogicalpath : UInt8**, pbstrcomponentname : UInt8**, pbrepair : Bool*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent.unsafe_as(Proc(UInt32, UInt8**, UInt8**, Bool*, HRESULT)).call(icomponent, pbstrlogicalpath, pbstrcomponentname, pbrepair)
  end
  def get_file_restore_status(pstatus : VSS_FILE_RESTORE_STATUS*) : HRESULT
    @lpVtbl.value.get_file_restore_status.unsafe_as(Proc(VSS_FILE_RESTORE_STATUS*, HRESULT)).call(pstatus)
  end
  def add_differenced_files_by_last_modify_time(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, ftlastmodifytime : FILETIME) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_time.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)).call(wszpath, wszfilespec, brecursive, ftlastmodifytime)
  end
  def add_differenced_files_by_last_modify_lsn(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, bstrlsnstring : UInt8*) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_lsn.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8*, HRESULT)).call(wszpath, wszfilespec, brecursive, bstrlsnstring)
  end
  def get_differenced_files_count(pcdifferencedfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_differenced_files_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcdifferencedfiles)
  end
  def get_differenced_file(idifferencedfile : UInt32, pbstrpath : UInt8**, pbstrfilespec : UInt8**, pbrecursive : LibC::BOOL*, pbstrlsnstring : UInt8**, pftlastmodifytime : FILETIME*) : HRESULT
    @lpVtbl.value.get_differenced_file.unsafe_as(Proc(UInt32, UInt8**, UInt8**, LibC::BOOL*, UInt8**, FILETIME*, HRESULT)).call(idifferencedfile, pbstrpath, pbstrfilespec, pbrecursive, pbstrlsnstring, pftlastmodifytime)
  end
end
struct LibWin32::IVssWriterComponents
  def get_component_count(pccomponents : UInt32*) : HRESULT
    @lpVtbl.value.get_component_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pccomponents)
  end
  def get_writer_info(pidinstance : Guid*, pidwriter : Guid*) : HRESULT
    @lpVtbl.value.get_writer_info.unsafe_as(Proc(Guid*, Guid*, HRESULT)).call(pidinstance, pidwriter)
  end
  def get_component(icomponent : UInt32, ppcomponent : IVssComponent*) : HRESULT
    @lpVtbl.value.get_component.unsafe_as(Proc(UInt32, IVssComponent*, HRESULT)).call(icomponent, ppcomponent)
  end
end
struct LibWin32::IVssComponentEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_logical_path(pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpath)
  end
  def get_component_type(pct : VSS_COMPONENT_TYPE*) : HRESULT
    @lpVtbl.value.get_component_type.unsafe_as(Proc(VSS_COMPONENT_TYPE*, HRESULT)).call(pct)
  end
  def get_component_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_backup_succeeded(pbsucceeded : Bool*) : HRESULT
    @lpVtbl.value.get_backup_succeeded.unsafe_as(Proc(Bool*, HRESULT)).call(pbsucceeded)
  end
  def get_alternate_location_mapping_count(pcmappings : UInt32*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcmappings)
  end
  def get_alternate_location_mapping(imapping : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping.unsafe_as(Proc(UInt32, IVssWMFiledesc*, HRESULT)).call(imapping, ppfiledesc)
  end
  def set_backup_metadata(wszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_metadata.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszdata)
  end
  def get_backup_metadata(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_metadata.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def add_partial_file(wszpath : LibC::LPWSTR, wszfilename : LibC::LPWSTR, wszranges : LibC::LPWSTR, wszmetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_partial_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszpath, wszfilename, wszranges, wszmetadata)
  end
  def get_partial_file_count(pcpartialfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_partial_file_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcpartialfiles)
  end
  def get_partial_file(ipartialfile : UInt32, pbstrpath : UInt8**, pbstrfilename : UInt8**, pbstrrange : UInt8**, pbstrmetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_partial_file.unsafe_as(Proc(UInt32, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)).call(ipartialfile, pbstrpath, pbstrfilename, pbstrrange, pbstrmetadata)
  end
  def is_selected_for_restore(pbselectedforrestore : Bool*) : HRESULT
    @lpVtbl.value.is_selected_for_restore.unsafe_as(Proc(Bool*, HRESULT)).call(pbselectedforrestore)
  end
  def get_additional_restores(pbadditionalrestores : Bool*) : HRESULT
    @lpVtbl.value.get_additional_restores.unsafe_as(Proc(Bool*, HRESULT)).call(pbadditionalrestores)
  end
  def get_new_target_count(pcnewtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_new_target_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcnewtarget)
  end
  def get_new_target(inewtarget : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_new_target.unsafe_as(Proc(UInt32, IVssWMFiledesc*, HRESULT)).call(inewtarget, ppfiledesc)
  end
  def add_directed_target(wszsourcepath : LibC::LPWSTR, wszsourcefilename : LibC::LPWSTR, wszsourcerangelist : LibC::LPWSTR, wszdestinationpath : LibC::LPWSTR, wszdestinationfilename : LibC::LPWSTR, wszdestinationrangelist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_directed_target.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszsourcepath, wszsourcefilename, wszsourcerangelist, wszdestinationpath, wszdestinationfilename, wszdestinationrangelist)
  end
  def get_directed_target_count(pcdirectedtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_directed_target_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcdirectedtarget)
  end
  def get_directed_target(idirectedtarget : UInt32, pbstrsourcepath : UInt8**, pbstrsourcefilename : UInt8**, pbstrsourcerangelist : UInt8**, pbstrdestinationpath : UInt8**, pbstrdestinationfilename : UInt8**, pbstrdestinationrangelist : UInt8**) : HRESULT
    @lpVtbl.value.get_directed_target.unsafe_as(Proc(UInt32, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)).call(idirectedtarget, pbstrsourcepath, pbstrsourcefilename, pbstrsourcerangelist, pbstrdestinationpath, pbstrdestinationfilename, pbstrdestinationrangelist)
  end
  def set_restore_metadata(wszrestoremetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_restore_metadata.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszrestoremetadata)
  end
  def get_restore_metadata(pbstrrestoremetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_metadata.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrestoremetadata)
  end
  def set_restore_target(target : VSS_RESTORE_TARGET) : HRESULT
    @lpVtbl.value.set_restore_target.unsafe_as(Proc(VSS_RESTORE_TARGET, HRESULT)).call(target)
  end
  def get_restore_target(ptarget : VSS_RESTORE_TARGET*) : HRESULT
    @lpVtbl.value.get_restore_target.unsafe_as(Proc(VSS_RESTORE_TARGET*, HRESULT)).call(ptarget)
  end
  def set_pre_restore_failure_msg(wszprerestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_pre_restore_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszprerestorefailuremsg)
  end
  def get_pre_restore_failure_msg(pbstrprerestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_pre_restore_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrprerestorefailuremsg)
  end
  def set_post_restore_failure_msg(wszpostrestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_restore_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszpostrestorefailuremsg)
  end
  def get_post_restore_failure_msg(pbstrpostrestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_restore_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpostrestorefailuremsg)
  end
  def set_backup_stamp(wszbackupstamp : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_stamp.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszbackupstamp)
  end
  def get_backup_stamp(pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_stamp.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupstamp)
  end
  def get_previous_backup_stamp(pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_previous_backup_stamp.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupstamp)
  end
  def get_backup_options(pbstrbackupoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_options.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupoptions)
  end
  def get_restore_options(pbstrrestoreoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_options.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrestoreoptions)
  end
  def get_restore_subcomponent_count(pcrestoresubcomponent : UInt32*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcrestoresubcomponent)
  end
  def get_restore_subcomponent(icomponent : UInt32, pbstrlogicalpath : UInt8**, pbstrcomponentname : UInt8**, pbrepair : Bool*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent.unsafe_as(Proc(UInt32, UInt8**, UInt8**, Bool*, HRESULT)).call(icomponent, pbstrlogicalpath, pbstrcomponentname, pbrepair)
  end
  def get_file_restore_status(pstatus : VSS_FILE_RESTORE_STATUS*) : HRESULT
    @lpVtbl.value.get_file_restore_status.unsafe_as(Proc(VSS_FILE_RESTORE_STATUS*, HRESULT)).call(pstatus)
  end
  def add_differenced_files_by_last_modify_time(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, ftlastmodifytime : FILETIME) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_time.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)).call(wszpath, wszfilespec, brecursive, ftlastmodifytime)
  end
  def add_differenced_files_by_last_modify_lsn(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, bstrlsnstring : UInt8*) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_lsn.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8*, HRESULT)).call(wszpath, wszfilespec, brecursive, bstrlsnstring)
  end
  def get_differenced_files_count(pcdifferencedfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_differenced_files_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcdifferencedfiles)
  end
  def get_differenced_file(idifferencedfile : UInt32, pbstrpath : UInt8**, pbstrfilespec : UInt8**, pbrecursive : LibC::BOOL*, pbstrlsnstring : UInt8**, pftlastmodifytime : FILETIME*) : HRESULT
    @lpVtbl.value.get_differenced_file.unsafe_as(Proc(UInt32, UInt8**, UInt8**, LibC::BOOL*, UInt8**, FILETIME*, HRESULT)).call(idifferencedfile, pbstrpath, pbstrfilespec, pbrecursive, pbstrlsnstring, pftlastmodifytime)
  end
  def set_prepare_for_backup_failure_msg(wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_prepare_for_backup_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszfailuremsg)
  end
  def set_post_snapshot_failure_msg(wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_snapshot_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszfailuremsg)
  end
  def get_prepare_for_backup_failure_msg(pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_prepare_for_backup_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfailuremsg)
  end
  def get_post_snapshot_failure_msg(pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_snapshot_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfailuremsg)
  end
  def get_authoritative_restore(pbauth : Bool*) : HRESULT
    @lpVtbl.value.get_authoritative_restore.unsafe_as(Proc(Bool*, HRESULT)).call(pbauth)
  end
  def get_roll_forward(prolltype : VSS_ROLLFORWARD_TYPE*, pbstrpoint : UInt8**) : HRESULT
    @lpVtbl.value.get_roll_forward.unsafe_as(Proc(VSS_ROLLFORWARD_TYPE*, UInt8**, HRESULT)).call(prolltype, pbstrpoint)
  end
  def get_restore_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
end
struct LibWin32::IVssComponentEx2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_logical_path(pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpath)
  end
  def get_component_type(pct : VSS_COMPONENT_TYPE*) : HRESULT
    @lpVtbl.value.get_component_type.unsafe_as(Proc(VSS_COMPONENT_TYPE*, HRESULT)).call(pct)
  end
  def get_component_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_backup_succeeded(pbsucceeded : Bool*) : HRESULT
    @lpVtbl.value.get_backup_succeeded.unsafe_as(Proc(Bool*, HRESULT)).call(pbsucceeded)
  end
  def get_alternate_location_mapping_count(pcmappings : UInt32*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcmappings)
  end
  def get_alternate_location_mapping(imapping : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping.unsafe_as(Proc(UInt32, IVssWMFiledesc*, HRESULT)).call(imapping, ppfiledesc)
  end
  def set_backup_metadata(wszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_metadata.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszdata)
  end
  def get_backup_metadata(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_metadata.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def add_partial_file(wszpath : LibC::LPWSTR, wszfilename : LibC::LPWSTR, wszranges : LibC::LPWSTR, wszmetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_partial_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszpath, wszfilename, wszranges, wszmetadata)
  end
  def get_partial_file_count(pcpartialfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_partial_file_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcpartialfiles)
  end
  def get_partial_file(ipartialfile : UInt32, pbstrpath : UInt8**, pbstrfilename : UInt8**, pbstrrange : UInt8**, pbstrmetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_partial_file.unsafe_as(Proc(UInt32, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)).call(ipartialfile, pbstrpath, pbstrfilename, pbstrrange, pbstrmetadata)
  end
  def is_selected_for_restore(pbselectedforrestore : Bool*) : HRESULT
    @lpVtbl.value.is_selected_for_restore.unsafe_as(Proc(Bool*, HRESULT)).call(pbselectedforrestore)
  end
  def get_additional_restores(pbadditionalrestores : Bool*) : HRESULT
    @lpVtbl.value.get_additional_restores.unsafe_as(Proc(Bool*, HRESULT)).call(pbadditionalrestores)
  end
  def get_new_target_count(pcnewtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_new_target_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcnewtarget)
  end
  def get_new_target(inewtarget : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_new_target.unsafe_as(Proc(UInt32, IVssWMFiledesc*, HRESULT)).call(inewtarget, ppfiledesc)
  end
  def add_directed_target(wszsourcepath : LibC::LPWSTR, wszsourcefilename : LibC::LPWSTR, wszsourcerangelist : LibC::LPWSTR, wszdestinationpath : LibC::LPWSTR, wszdestinationfilename : LibC::LPWSTR, wszdestinationrangelist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_directed_target.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszsourcepath, wszsourcefilename, wszsourcerangelist, wszdestinationpath, wszdestinationfilename, wszdestinationrangelist)
  end
  def get_directed_target_count(pcdirectedtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_directed_target_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcdirectedtarget)
  end
  def get_directed_target(idirectedtarget : UInt32, pbstrsourcepath : UInt8**, pbstrsourcefilename : UInt8**, pbstrsourcerangelist : UInt8**, pbstrdestinationpath : UInt8**, pbstrdestinationfilename : UInt8**, pbstrdestinationrangelist : UInt8**) : HRESULT
    @lpVtbl.value.get_directed_target.unsafe_as(Proc(UInt32, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)).call(idirectedtarget, pbstrsourcepath, pbstrsourcefilename, pbstrsourcerangelist, pbstrdestinationpath, pbstrdestinationfilename, pbstrdestinationrangelist)
  end
  def set_restore_metadata(wszrestoremetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_restore_metadata.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszrestoremetadata)
  end
  def get_restore_metadata(pbstrrestoremetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_metadata.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrestoremetadata)
  end
  def set_restore_target(target : VSS_RESTORE_TARGET) : HRESULT
    @lpVtbl.value.set_restore_target.unsafe_as(Proc(VSS_RESTORE_TARGET, HRESULT)).call(target)
  end
  def get_restore_target(ptarget : VSS_RESTORE_TARGET*) : HRESULT
    @lpVtbl.value.get_restore_target.unsafe_as(Proc(VSS_RESTORE_TARGET*, HRESULT)).call(ptarget)
  end
  def set_pre_restore_failure_msg(wszprerestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_pre_restore_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszprerestorefailuremsg)
  end
  def get_pre_restore_failure_msg(pbstrprerestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_pre_restore_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrprerestorefailuremsg)
  end
  def set_post_restore_failure_msg(wszpostrestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_restore_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszpostrestorefailuremsg)
  end
  def get_post_restore_failure_msg(pbstrpostrestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_restore_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpostrestorefailuremsg)
  end
  def set_backup_stamp(wszbackupstamp : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_stamp.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszbackupstamp)
  end
  def get_backup_stamp(pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_stamp.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupstamp)
  end
  def get_previous_backup_stamp(pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_previous_backup_stamp.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupstamp)
  end
  def get_backup_options(pbstrbackupoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_options.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupoptions)
  end
  def get_restore_options(pbstrrestoreoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_options.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrestoreoptions)
  end
  def get_restore_subcomponent_count(pcrestoresubcomponent : UInt32*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcrestoresubcomponent)
  end
  def get_restore_subcomponent(icomponent : UInt32, pbstrlogicalpath : UInt8**, pbstrcomponentname : UInt8**, pbrepair : Bool*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent.unsafe_as(Proc(UInt32, UInt8**, UInt8**, Bool*, HRESULT)).call(icomponent, pbstrlogicalpath, pbstrcomponentname, pbrepair)
  end
  def get_file_restore_status(pstatus : VSS_FILE_RESTORE_STATUS*) : HRESULT
    @lpVtbl.value.get_file_restore_status.unsafe_as(Proc(VSS_FILE_RESTORE_STATUS*, HRESULT)).call(pstatus)
  end
  def add_differenced_files_by_last_modify_time(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, ftlastmodifytime : FILETIME) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_time.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)).call(wszpath, wszfilespec, brecursive, ftlastmodifytime)
  end
  def add_differenced_files_by_last_modify_lsn(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, bstrlsnstring : UInt8*) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_lsn.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8*, HRESULT)).call(wszpath, wszfilespec, brecursive, bstrlsnstring)
  end
  def get_differenced_files_count(pcdifferencedfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_differenced_files_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcdifferencedfiles)
  end
  def get_differenced_file(idifferencedfile : UInt32, pbstrpath : UInt8**, pbstrfilespec : UInt8**, pbrecursive : LibC::BOOL*, pbstrlsnstring : UInt8**, pftlastmodifytime : FILETIME*) : HRESULT
    @lpVtbl.value.get_differenced_file.unsafe_as(Proc(UInt32, UInt8**, UInt8**, LibC::BOOL*, UInt8**, FILETIME*, HRESULT)).call(idifferencedfile, pbstrpath, pbstrfilespec, pbrecursive, pbstrlsnstring, pftlastmodifytime)
  end
  def set_prepare_for_backup_failure_msg(wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_prepare_for_backup_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszfailuremsg)
  end
  def set_post_snapshot_failure_msg(wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_snapshot_failure_msg.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(wszfailuremsg)
  end
  def get_prepare_for_backup_failure_msg(pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_prepare_for_backup_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfailuremsg)
  end
  def get_post_snapshot_failure_msg(pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_snapshot_failure_msg.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfailuremsg)
  end
  def get_authoritative_restore(pbauth : Bool*) : HRESULT
    @lpVtbl.value.get_authoritative_restore.unsafe_as(Proc(Bool*, HRESULT)).call(pbauth)
  end
  def get_roll_forward(prolltype : VSS_ROLLFORWARD_TYPE*, pbstrpoint : UInt8**) : HRESULT
    @lpVtbl.value.get_roll_forward.unsafe_as(Proc(VSS_ROLLFORWARD_TYPE*, UInt8**, HRESULT)).call(prolltype, pbstrpoint)
  end
  def get_restore_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def set_failure(hr : HRESULT, hrapplication : HRESULT, wszapplicationmessage : LibC::LPWSTR, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.set_failure.unsafe_as(Proc(HRESULT, HRESULT, LibC::LPWSTR, UInt32, HRESULT)).call(hr, hrapplication, wszapplicationmessage, dwreserved)
  end
  def get_failure(phr : HRESULT*, phrapplication : HRESULT*, pbstrapplicationmessage : UInt8**, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_failure.unsafe_as(Proc(HRESULT*, HRESULT*, UInt8**, UInt32*, HRESULT)).call(phr, phrapplication, pbstrapplicationmessage, pdwreserved)
  end
end
struct LibWin32::IVssCreateWriterMetadata
  def add_include_files(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8, wszalternatelocation : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_include_files.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, HRESULT)).call(wszpath, wszfilespec, brecursive, wszalternatelocation)
  end
  def add_exclude_files(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8) : HRESULT
    @lpVtbl.value.add_exclude_files.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt8, HRESULT)).call(wszpath, wszfilespec, brecursive)
  end
  def add_component(ct : VSS_COMPONENT_TYPE, wszlogicalpath : LibC::LPWSTR, wszcomponentname : LibC::LPWSTR, wszcaption : LibC::LPWSTR, pbicon : UInt8*, cbicon : UInt32, brestoremetadata : UInt8, bnotifyonbackupcomplete : UInt8, bselectable : UInt8, bselectableforrestore : UInt8, dwcomponentflags : UInt32) : HRESULT
    @lpVtbl.value.add_component.unsafe_as(Proc(VSS_COMPONENT_TYPE, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8*, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, HRESULT)).call(ct, wszlogicalpath, wszcomponentname, wszcaption, pbicon, cbicon, brestoremetadata, bnotifyonbackupcomplete, bselectable, bselectableforrestore, dwcomponentflags)
  end
  def add_database_files(wszlogicalpath : LibC::LPWSTR, wszdatabasename : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_database_files.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)).call(wszlogicalpath, wszdatabasename, wszpath, wszfilespec, dwbackuptypemask)
  end
  def add_database_log_files(wszlogicalpath : LibC::LPWSTR, wszdatabasename : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_database_log_files.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)).call(wszlogicalpath, wszdatabasename, wszpath, wszfilespec, dwbackuptypemask)
  end
  def add_files_to_file_group(wszlogicalpath : LibC::LPWSTR, wszgroupname : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8, wszalternatelocation : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_files_to_file_group.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, UInt32, HRESULT)).call(wszlogicalpath, wszgroupname, wszpath, wszfilespec, brecursive, wszalternatelocation, dwbackuptypemask)
  end
  def set_restore_method(method : VSS_RESTOREMETHOD_ENUM, wszservice : LibC::LPWSTR, wszuserprocedure : LibC::LPWSTR, writerrestore : VSS_WRITERRESTORE_ENUM, brebootrequired : UInt8) : HRESULT
    @lpVtbl.value.set_restore_method.unsafe_as(Proc(VSS_RESTOREMETHOD_ENUM, LibC::LPWSTR, LibC::LPWSTR, VSS_WRITERRESTORE_ENUM, UInt8, HRESULT)).call(method, wszservice, wszuserprocedure, writerrestore, brebootrequired)
  end
  def add_alternate_location_mapping(wszsourcepath : LibC::LPWSTR, wszsourcefilespec : LibC::LPWSTR, brecursive : UInt8, wszdestination : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_alternate_location_mapping.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, HRESULT)).call(wszsourcepath, wszsourcefilespec, brecursive, wszdestination)
  end
  def add_component_dependency(wszforlogicalpath : LibC::LPWSTR, wszforcomponentname : LibC::LPWSTR, onwriterid : Guid, wszonlogicalpath : LibC::LPWSTR, wszoncomponentname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_component_dependency.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Guid, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszforlogicalpath, wszforcomponentname, onwriterid, wszonlogicalpath, wszoncomponentname)
  end
  def set_backup_schema(dwschemamask : UInt32) : HRESULT
    @lpVtbl.value.set_backup_schema.unsafe_as(Proc(UInt32, HRESULT)).call(dwschemamask)
  end
  def get_document(pdoc : IXMLDOMDocument*) : HRESULT
    @lpVtbl.value.get_document.unsafe_as(Proc(IXMLDOMDocument*, HRESULT)).call(pdoc)
  end
  def save_as_xml(pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.save_as_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrxml)
  end
end
struct LibWin32::IVssWriterImpl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(writerid : Guid, wszwritername : LibC::LPWSTR, wszwriterinstancename : LibC::LPWSTR, dwmajorversion : UInt32, dwminorversion : UInt32, ut : VSS_USAGE_TYPE, st : VSS_SOURCE_TYPE, nlevel : VSS_APPLICATION_LEVEL, dwtimeout : UInt32, aws : VSS_ALTERNATE_WRITER_STATE, biothrottlingonly : UInt8) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Guid, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32, VSS_USAGE_TYPE, VSS_SOURCE_TYPE, VSS_APPLICATION_LEVEL, UInt32, VSS_ALTERNATE_WRITER_STATE, UInt8, HRESULT)).call(writerid, wszwritername, wszwriterinstancename, dwmajorversion, dwminorversion, ut, st, nlevel, dwtimeout, aws, biothrottlingonly)
  end
  def subscribe(dwsubscribetimeout : UInt32, dweventflags : UInt32) : HRESULT
    @lpVtbl.value.subscribe.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwsubscribetimeout, dweventflags)
  end
  def unsubscribe : HRESULT
    @lpVtbl.value.unsubscribe.unsafe_as(Proc(HRESULT)).call
  end
  def uninitialize : Void
    @lpVtbl.value.uninitialize.unsafe_as(Proc(Void)).call
  end
  def get_current_volume_array : LibC::LPWSTR*
    @lpVtbl.value.get_current_volume_array.unsafe_as(Proc(LibC::LPWSTR**)).call
  end
  def get_current_volume_count : UInt32
    @lpVtbl.value.get_current_volume_count.unsafe_as(Proc(UInt32)).call
  end
  def get_snapshot_device_name(wszoriginalvolume : LibC::LPWSTR, ppwszsnapshotdevice : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_snapshot_device_name.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(wszoriginalvolume, ppwszsnapshotdevice)
  end
  def get_current_snapshot_set_id : Guid
    @lpVtbl.value.get_current_snapshot_set_id.unsafe_as(Proc(Guid)).call
  end
  def get_context : Int32
    @lpVtbl.value.get_context.unsafe_as(Proc(Int32)).call
  end
  def get_current_level : VSS_APPLICATION_LEVEL
    @lpVtbl.value.get_current_level.unsafe_as(Proc(VSS_APPLICATION_LEVEL)).call
  end
  def is_path_affected(wszpath : LibC::LPWSTR) : Bool
    @lpVtbl.value.is_path_affected.unsafe_as(Proc(LibC::LPWSTR, Bool)).call(wszpath)
  end
  def is_bootable_system_state_backed_up : Bool
    @lpVtbl.value.is_bootable_system_state_backed_up.unsafe_as(Proc(Bool)).call
  end
  def are_components_selected : Bool
    @lpVtbl.value.are_components_selected.unsafe_as(Proc(Bool)).call
  end
  def get_backup_type : VSS_BACKUP_TYPE
    @lpVtbl.value.get_backup_type.unsafe_as(Proc(VSS_BACKUP_TYPE)).call
  end
  def get_restore_type : VSS_RESTORE_TYPE
    @lpVtbl.value.get_restore_type.unsafe_as(Proc(VSS_RESTORE_TYPE)).call
  end
  def set_writer_failure(hr : HRESULT) : HRESULT
    @lpVtbl.value.set_writer_failure.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
  def is_partial_file_support_enabled : Bool
    @lpVtbl.value.is_partial_file_support_enabled.unsafe_as(Proc(Bool)).call
  end
  def install_alternate_writer(idwriter : Guid, clsid : Guid) : HRESULT
    @lpVtbl.value.install_alternate_writer.unsafe_as(Proc(Guid, Guid, HRESULT)).call(idwriter, clsid)
  end
  def get_identity_information : IVssExamineWriterMetadata*
    @lpVtbl.value.get_identity_information.unsafe_as(Proc(IVssExamineWriterMetadata**)).call
  end
  def set_writer_failure_ex(hr : HRESULT, hrapplication : HRESULT, wszapplicationmessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_writer_failure_ex.unsafe_as(Proc(HRESULT, HRESULT, LibC::LPWSTR, HRESULT)).call(hr, hrapplication, wszapplicationmessage)
  end
  def get_session_id(idsession : Guid*) : HRESULT
    @lpVtbl.value.get_session_id.unsafe_as(Proc(Guid*, HRESULT)).call(idsession)
  end
  def is_writer_shutting_down : Bool
    @lpVtbl.value.is_writer_shutting_down.unsafe_as(Proc(Bool)).call
  end
end
struct LibWin32::IVssCreateExpressWriterMetadata
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_exclude_files(wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8) : HRESULT
    @lpVtbl.value.add_exclude_files.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt8, HRESULT)).call(wszpath, wszfilespec, brecursive)
  end
  def add_component(ct : VSS_COMPONENT_TYPE, wszlogicalpath : LibC::LPWSTR, wszcomponentname : LibC::LPWSTR, wszcaption : LibC::LPWSTR, pbicon : UInt8*, cbicon : UInt32, brestoremetadata : UInt8, bnotifyonbackupcomplete : UInt8, bselectable : UInt8, bselectableforrestore : UInt8, dwcomponentflags : UInt32) : HRESULT
    @lpVtbl.value.add_component.unsafe_as(Proc(VSS_COMPONENT_TYPE, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8*, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, HRESULT)).call(ct, wszlogicalpath, wszcomponentname, wszcaption, pbicon, cbicon, brestoremetadata, bnotifyonbackupcomplete, bselectable, bselectableforrestore, dwcomponentflags)
  end
  def add_files_to_file_group(wszlogicalpath : LibC::LPWSTR, wszgroupname : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8, wszalternatelocation : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_files_to_file_group.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, UInt32, HRESULT)).call(wszlogicalpath, wszgroupname, wszpath, wszfilespec, brecursive, wszalternatelocation, dwbackuptypemask)
  end
  def set_restore_method(method : VSS_RESTOREMETHOD_ENUM, wszservice : LibC::LPWSTR, wszuserprocedure : LibC::LPWSTR, writerrestore : VSS_WRITERRESTORE_ENUM, brebootrequired : UInt8) : HRESULT
    @lpVtbl.value.set_restore_method.unsafe_as(Proc(VSS_RESTOREMETHOD_ENUM, LibC::LPWSTR, LibC::LPWSTR, VSS_WRITERRESTORE_ENUM, UInt8, HRESULT)).call(method, wszservice, wszuserprocedure, writerrestore, brebootrequired)
  end
  def add_component_dependency(wszforlogicalpath : LibC::LPWSTR, wszforcomponentname : LibC::LPWSTR, onwriterid : Guid, wszonlogicalpath : LibC::LPWSTR, wszoncomponentname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_component_dependency.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Guid, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszforlogicalpath, wszforcomponentname, onwriterid, wszonlogicalpath, wszoncomponentname)
  end
  def set_backup_schema(dwschemamask : UInt32) : HRESULT
    @lpVtbl.value.set_backup_schema.unsafe_as(Proc(UInt32, HRESULT)).call(dwschemamask)
  end
  def save_as_xml(pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.save_as_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrxml)
  end
end
struct LibWin32::IVssExpressWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_metadata(writerid : Guid, writername : LibC::LPWSTR, usagetype : VSS_USAGE_TYPE, versionmajor : UInt32, versionminor : UInt32, reserved : UInt32, ppmetadata : IVssCreateExpressWriterMetadata*) : HRESULT
    @lpVtbl.value.create_metadata.unsafe_as(Proc(Guid, LibC::LPWSTR, VSS_USAGE_TYPE, UInt32, UInt32, UInt32, IVssCreateExpressWriterMetadata*, HRESULT)).call(writerid, writername, usagetype, versionmajor, versionminor, reserved, ppmetadata)
  end
  def load_metadata(metadata : LibC::LPWSTR, reserved : UInt32) : HRESULT
    @lpVtbl.value.load_metadata.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(metadata, reserved)
  end
  def register : HRESULT
    @lpVtbl.value.register.unsafe_as(Proc(HRESULT)).call
  end
  def unregister(writerid : Guid) : HRESULT
    @lpVtbl.value.unregister.unsafe_as(Proc(Guid, HRESULT)).call(writerid)
  end
end
struct LibWin32::IVssSnapshotMgmt
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_provider_mgmt_interface(providerid : Guid, interfaceid : Guid*, ppitf : IUnknown*) : HRESULT
    @lpVtbl.value.get_provider_mgmt_interface.unsafe_as(Proc(Guid, Guid*, IUnknown*, HRESULT)).call(providerid, interfaceid, ppitf)
  end
  def query_volumes_supported_for_snapshots(providerid : Guid, lcontext : Int32, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_snapshots.unsafe_as(Proc(Guid, Int32, IVssEnumMgmtObject*, HRESULT)).call(providerid, lcontext, ppenum)
  end
  def query_snapshots_by_volume(pwszvolumename : UInt16*, providerid : Guid, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query_snapshots_by_volume.unsafe_as(Proc(UInt16*, Guid, IVssEnumObject*, HRESULT)).call(pwszvolumename, providerid, ppenum)
  end
end
struct LibWin32::IVssSnapshotMgmt2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_min_diff_area_size(pllmindiffareasize : Int64*) : HRESULT
    @lpVtbl.value.get_min_diff_area_size.unsafe_as(Proc(Int64*, HRESULT)).call(pllmindiffareasize)
  end
end
struct LibWin32::IVssDifferentialSoftwareSnapshotMgmt
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_diff_area(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.add_diff_area.unsafe_as(Proc(UInt16*, UInt16*, Int64, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def change_diff_area_maximum_size(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size.unsafe_as(Proc(UInt16*, UInt16*, Int64, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def query_volumes_supported_for_diff_areas(pwszoriginalvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_diff_areas.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszoriginalvolumename, ppenum)
  end
  def query_diff_areas_for_volume(pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_volume.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszvolumename, ppenum)
  end
  def query_diff_areas_on_volume(pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_on_volume.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszvolumename, ppenum)
  end
  def query_diff_areas_for_snapshot(snapshotid : Guid, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_snapshot.unsafe_as(Proc(Guid, IVssEnumMgmtObject*, HRESULT)).call(snapshotid, ppenum)
  end
end
struct LibWin32::IVssDifferentialSoftwareSnapshotMgmt2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_diff_area(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.add_diff_area.unsafe_as(Proc(UInt16*, UInt16*, Int64, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def change_diff_area_maximum_size(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size.unsafe_as(Proc(UInt16*, UInt16*, Int64, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def query_volumes_supported_for_diff_areas(pwszoriginalvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_diff_areas.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszoriginalvolumename, ppenum)
  end
  def query_diff_areas_for_volume(pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_volume.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszvolumename, ppenum)
  end
  def query_diff_areas_on_volume(pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_on_volume.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszvolumename, ppenum)
  end
  def query_diff_areas_for_snapshot(snapshotid : Guid, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_snapshot.unsafe_as(Proc(Guid, IVssEnumMgmtObject*, HRESULT)).call(snapshotid, ppenum)
  end
  def change_diff_area_maximum_size_ex(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64, bvolatile : LibC::BOOL) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size_ex.unsafe_as(Proc(UInt16*, UInt16*, Int64, LibC::BOOL, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace, bvolatile)
  end
  def migrate_diff_areas(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, pwsznewdiffareavolumename : UInt16*) : HRESULT
    @lpVtbl.value.migrate_diff_areas.unsafe_as(Proc(UInt16*, UInt16*, UInt16*, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, pwsznewdiffareavolumename)
  end
  def query_migration_status(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.query_migration_status.unsafe_as(Proc(UInt16*, UInt16*, IVssAsync*, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, ppasync)
  end
  def set_snapshot_priority(idsnapshot : Guid, priority : UInt8) : HRESULT
    @lpVtbl.value.set_snapshot_priority.unsafe_as(Proc(Guid, UInt8, HRESULT)).call(idsnapshot, priority)
  end
end
struct LibWin32::IVssDifferentialSoftwareSnapshotMgmt3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_diff_area(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.add_diff_area.unsafe_as(Proc(UInt16*, UInt16*, Int64, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def change_diff_area_maximum_size(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size.unsafe_as(Proc(UInt16*, UInt16*, Int64, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def query_volumes_supported_for_diff_areas(pwszoriginalvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_diff_areas.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszoriginalvolumename, ppenum)
  end
  def query_diff_areas_for_volume(pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_volume.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszvolumename, ppenum)
  end
  def query_diff_areas_on_volume(pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_on_volume.unsafe_as(Proc(UInt16*, IVssEnumMgmtObject*, HRESULT)).call(pwszvolumename, ppenum)
  end
  def query_diff_areas_for_snapshot(snapshotid : Guid, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_snapshot.unsafe_as(Proc(Guid, IVssEnumMgmtObject*, HRESULT)).call(snapshotid, ppenum)
  end
  def change_diff_area_maximum_size_ex(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64, bvolatile : LibC::BOOL) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size_ex.unsafe_as(Proc(UInt16*, UInt16*, Int64, LibC::BOOL, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace, bvolatile)
  end
  def migrate_diff_areas(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, pwsznewdiffareavolumename : UInt16*) : HRESULT
    @lpVtbl.value.migrate_diff_areas.unsafe_as(Proc(UInt16*, UInt16*, UInt16*, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, pwsznewdiffareavolumename)
  end
  def query_migration_status(pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.query_migration_status.unsafe_as(Proc(UInt16*, UInt16*, IVssAsync*, HRESULT)).call(pwszvolumename, pwszdiffareavolumename, ppasync)
  end
  def set_snapshot_priority(idsnapshot : Guid, priority : UInt8) : HRESULT
    @lpVtbl.value.set_snapshot_priority.unsafe_as(Proc(Guid, UInt8, HRESULT)).call(idsnapshot, priority)
  end
  def set_volume_protect_level(pwszvolumename : UInt16*, protectionlevel : VSS_PROTECTION_LEVEL) : HRESULT
    @lpVtbl.value.set_volume_protect_level.unsafe_as(Proc(UInt16*, VSS_PROTECTION_LEVEL, HRESULT)).call(pwszvolumename, protectionlevel)
  end
  def get_volume_protect_level(pwszvolumename : UInt16*, protectionlevel : VSS_VOLUME_PROTECTION_INFO*) : HRESULT
    @lpVtbl.value.get_volume_protect_level.unsafe_as(Proc(UInt16*, VSS_VOLUME_PROTECTION_INFO*, HRESULT)).call(pwszvolumename, protectionlevel)
  end
  def clear_volume_protect_fault(pwszvolumename : UInt16*) : HRESULT
    @lpVtbl.value.clear_volume_protect_fault.unsafe_as(Proc(UInt16*, HRESULT)).call(pwszvolumename)
  end
  def delete_unused_diff_areas(pwszdiffareavolumename : UInt16*) : HRESULT
    @lpVtbl.value.delete_unused_diff_areas.unsafe_as(Proc(UInt16*, HRESULT)).call(pwszdiffareavolumename)
  end
  def query_snapshot_delta_bitmap(idsnapshotolder : Guid, idsnapshotyounger : Guid, pcblocksizeperbit : UInt32*, pcbitmaplength : UInt32*, ppbbitmap : UInt8**) : HRESULT
    @lpVtbl.value.query_snapshot_delta_bitmap.unsafe_as(Proc(Guid, Guid, UInt32*, UInt32*, UInt8**, HRESULT)).call(idsnapshotolder, idsnapshotyounger, pcblocksizeperbit, pcbitmaplength, ppbbitmap)
  end
end
struct LibWin32::IVssEnumMgmtObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : VSS_MGMT_OBJECT_PROP*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, VSS_MGMT_OBJECT_PROP*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IVssEnumMgmtObject*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IVssAdmin
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_provider(pproviderid : Guid, classid : Guid, pwszprovidername : UInt16*, eprovidertype : VSS_PROVIDER_TYPE, pwszproviderversion : UInt16*, providerversionid : Guid) : HRESULT
    @lpVtbl.value.register_provider.unsafe_as(Proc(Guid, Guid, UInt16*, VSS_PROVIDER_TYPE, UInt16*, Guid, HRESULT)).call(pproviderid, classid, pwszprovidername, eprovidertype, pwszproviderversion, providerversionid)
  end
  def unregister_provider(providerid : Guid) : HRESULT
    @lpVtbl.value.unregister_provider.unsafe_as(Proc(Guid, HRESULT)).call(providerid)
  end
  def query_providers(ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query_providers.unsafe_as(Proc(IVssEnumObject*, HRESULT)).call(ppenum)
  end
  def abort_all_snapshots_in_progress : HRESULT
    @lpVtbl.value.abort_all_snapshots_in_progress.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IVssAdminEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_provider(pproviderid : Guid, classid : Guid, pwszprovidername : UInt16*, eprovidertype : VSS_PROVIDER_TYPE, pwszproviderversion : UInt16*, providerversionid : Guid) : HRESULT
    @lpVtbl.value.register_provider.unsafe_as(Proc(Guid, Guid, UInt16*, VSS_PROVIDER_TYPE, UInt16*, Guid, HRESULT)).call(pproviderid, classid, pwszprovidername, eprovidertype, pwszproviderversion, providerversionid)
  end
  def unregister_provider(providerid : Guid) : HRESULT
    @lpVtbl.value.unregister_provider.unsafe_as(Proc(Guid, HRESULT)).call(providerid)
  end
  def query_providers(ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query_providers.unsafe_as(Proc(IVssEnumObject*, HRESULT)).call(ppenum)
  end
  def abort_all_snapshots_in_progress : HRESULT
    @lpVtbl.value.abort_all_snapshots_in_progress.unsafe_as(Proc(HRESULT)).call
  end
  def get_provider_capability(pproviderid : Guid, plloriginalcapabilitymask : UInt64*) : HRESULT
    @lpVtbl.value.get_provider_capability.unsafe_as(Proc(Guid, UInt64*, HRESULT)).call(pproviderid, plloriginalcapabilitymask)
  end
  def get_provider_context(providerid : Guid, plcontext : Int32*) : HRESULT
    @lpVtbl.value.get_provider_context.unsafe_as(Proc(Guid, Int32*, HRESULT)).call(providerid, plcontext)
  end
  def set_provider_context(providerid : Guid, lcontext : Int32) : HRESULT
    @lpVtbl.value.set_provider_context.unsafe_as(Proc(Guid, Int32, HRESULT)).call(providerid, lcontext)
  end
end
struct LibWin32::IVssSoftwareSnapshotProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_context(lcontext : Int32) : HRESULT
    @lpVtbl.value.set_context.unsafe_as(Proc(Int32, HRESULT)).call(lcontext)
  end
  def get_snapshot_properties(snapshotid : Guid, pprop : VSS_SNAPSHOT_PROP*) : HRESULT
    @lpVtbl.value.get_snapshot_properties.unsafe_as(Proc(Guid, VSS_SNAPSHOT_PROP*, HRESULT)).call(snapshotid, pprop)
  end
  def query(queriedobjectid : Guid, equeriedobjecttype : VSS_OBJECT_TYPE, ereturnedobjectstype : VSS_OBJECT_TYPE, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query.unsafe_as(Proc(Guid, VSS_OBJECT_TYPE, VSS_OBJECT_TYPE, IVssEnumObject*, HRESULT)).call(queriedobjectid, equeriedobjecttype, ereturnedobjectstype, ppenum)
  end
  def delete_snapshots(sourceobjectid : Guid, esourceobjecttype : VSS_OBJECT_TYPE, bforcedelete : LibC::BOOL, pldeletedsnapshots : Int32*, pnondeletedsnapshotid : Guid*) : HRESULT
    @lpVtbl.value.delete_snapshots.unsafe_as(Proc(Guid, VSS_OBJECT_TYPE, LibC::BOOL, Int32*, Guid*, HRESULT)).call(sourceobjectid, esourceobjecttype, bforcedelete, pldeletedsnapshots, pnondeletedsnapshotid)
  end
  def begin_prepare_snapshot(snapshotsetid : Guid, snapshotid : Guid, pwszvolumename : UInt16*, lnewcontext : Int32) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.unsafe_as(Proc(Guid, Guid, UInt16*, Int32, HRESULT)).call(snapshotsetid, snapshotid, pwszvolumename, lnewcontext)
  end
  def is_volume_supported(pwszvolumename : UInt16*, pbsupportedbythisprovider : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_volume_supported.unsafe_as(Proc(UInt16*, LibC::BOOL*, HRESULT)).call(pwszvolumename, pbsupportedbythisprovider)
  end
  def is_volume_snapshotted(pwszvolumename : UInt16*, pbsnapshotspresent : LibC::BOOL*, plsnapshotcompatibility : Int32*) : HRESULT
    @lpVtbl.value.is_volume_snapshotted.unsafe_as(Proc(UInt16*, LibC::BOOL*, Int32*, HRESULT)).call(pwszvolumename, pbsnapshotspresent, plsnapshotcompatibility)
  end
  def set_snapshot_property(snapshotid : Guid, esnapshotpropertyid : VSS_SNAPSHOT_PROPERTY_ID, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_snapshot_property.unsafe_as(Proc(Guid, VSS_SNAPSHOT_PROPERTY_ID, VARIANT, HRESULT)).call(snapshotid, esnapshotpropertyid, vproperty)
  end
  def revert_to_snapshot(snapshotid : Guid) : HRESULT
    @lpVtbl.value.revert_to_snapshot.unsafe_as(Proc(Guid, HRESULT)).call(snapshotid)
  end
  def query_revert_status(pwszvolume : UInt16*, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.query_revert_status.unsafe_as(Proc(UInt16*, IVssAsync*, HRESULT)).call(pwszvolume, ppasync)
  end
end
struct LibWin32::IVssProviderCreateSnapshotSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def end_prepare_snapshots(snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.end_prepare_snapshots.unsafe_as(Proc(Guid, HRESULT)).call(snapshotsetid)
  end
  def pre_commit_snapshots(snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.pre_commit_snapshots.unsafe_as(Proc(Guid, HRESULT)).call(snapshotsetid)
  end
  def commit_snapshots(snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.commit_snapshots.unsafe_as(Proc(Guid, HRESULT)).call(snapshotsetid)
  end
  def post_commit_snapshots(snapshotsetid : Guid, lsnapshotscount : Int32) : HRESULT
    @lpVtbl.value.post_commit_snapshots.unsafe_as(Proc(Guid, Int32, HRESULT)).call(snapshotsetid, lsnapshotscount)
  end
  def pre_final_commit_snapshots(snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.pre_final_commit_snapshots.unsafe_as(Proc(Guid, HRESULT)).call(snapshotsetid)
  end
  def post_final_commit_snapshots(snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.post_final_commit_snapshots.unsafe_as(Proc(Guid, HRESULT)).call(snapshotsetid)
  end
  def abort_snapshots(snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.abort_snapshots.unsafe_as(Proc(Guid, HRESULT)).call(snapshotsetid)
  end
end
struct LibWin32::IVssProviderNotifications
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_load(pcallback : IUnknown) : HRESULT
    @lpVtbl.value.on_load.unsafe_as(Proc(IUnknown, HRESULT)).call(pcallback)
  end
  def on_unload(bforceunload : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_unload.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bforceunload)
  end
end
struct LibWin32::IVssHardwareSnapshotProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def are_luns_supported(lluncount : Int32, lcontext : Int32, rgwszdevices : UInt16**, pluninformation : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.are_luns_supported.unsafe_as(Proc(Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)).call(lluncount, lcontext, rgwszdevices, pluninformation, pbissupported)
  end
  def fill_in_lun_info(wszdevicename : UInt16*, pluninfo : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.fill_in_lun_info.unsafe_as(Proc(UInt16*, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)).call(wszdevicename, pluninfo, pbissupported)
  end
  def begin_prepare_snapshot(snapshotsetid : Guid, snapshotid : Guid, lcontext : Int32, lluncount : Int32, rgdevicenames : UInt16**, rgluninformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.unsafe_as(Proc(Guid, Guid, Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, HRESULT)).call(snapshotsetid, snapshotid, lcontext, lluncount, rgdevicenames, rgluninformation)
  end
  def get_target_luns(lluncount : Int32, rgdevicenames : UInt16**, rgsourceluns : VDS_LUN_INFORMATION*, rgdestinationluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.get_target_luns.unsafe_as(Proc(Int32, UInt16**, VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, HRESULT)).call(lluncount, rgdevicenames, rgsourceluns, rgdestinationluns)
  end
  def locate_luns(lluncount : Int32, rgsourceluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.locate_luns.unsafe_as(Proc(Int32, VDS_LUN_INFORMATION*, HRESULT)).call(lluncount, rgsourceluns)
  end
  def on_lun_empty(wszdevicename : UInt16*, pinformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.on_lun_empty.unsafe_as(Proc(UInt16*, VDS_LUN_INFORMATION*, HRESULT)).call(wszdevicename, pinformation)
  end
end
struct LibWin32::IVssHardwareSnapshotProviderEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def are_luns_supported(lluncount : Int32, lcontext : Int32, rgwszdevices : UInt16**, pluninformation : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.are_luns_supported.unsafe_as(Proc(Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)).call(lluncount, lcontext, rgwszdevices, pluninformation, pbissupported)
  end
  def fill_in_lun_info(wszdevicename : UInt16*, pluninfo : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.fill_in_lun_info.unsafe_as(Proc(UInt16*, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)).call(wszdevicename, pluninfo, pbissupported)
  end
  def begin_prepare_snapshot(snapshotsetid : Guid, snapshotid : Guid, lcontext : Int32, lluncount : Int32, rgdevicenames : UInt16**, rgluninformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.unsafe_as(Proc(Guid, Guid, Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, HRESULT)).call(snapshotsetid, snapshotid, lcontext, lluncount, rgdevicenames, rgluninformation)
  end
  def get_target_luns(lluncount : Int32, rgdevicenames : UInt16**, rgsourceluns : VDS_LUN_INFORMATION*, rgdestinationluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.get_target_luns.unsafe_as(Proc(Int32, UInt16**, VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, HRESULT)).call(lluncount, rgdevicenames, rgsourceluns, rgdestinationluns)
  end
  def locate_luns(lluncount : Int32, rgsourceluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.locate_luns.unsafe_as(Proc(Int32, VDS_LUN_INFORMATION*, HRESULT)).call(lluncount, rgsourceluns)
  end
  def on_lun_empty(wszdevicename : UInt16*, pinformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.on_lun_empty.unsafe_as(Proc(UInt16*, VDS_LUN_INFORMATION*, HRESULT)).call(wszdevicename, pinformation)
  end
  def get_provider_capabilities(plloriginalcapabilitymask : UInt64*) : HRESULT
    @lpVtbl.value.get_provider_capabilities.unsafe_as(Proc(UInt64*, HRESULT)).call(plloriginalcapabilitymask)
  end
  def on_lun_state_change(psnapshotluns : VDS_LUN_INFORMATION*, poriginalluns : VDS_LUN_INFORMATION*, dwcount : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_lun_state_change.unsafe_as(Proc(VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, UInt32, UInt32, HRESULT)).call(psnapshotluns, poriginalluns, dwcount, dwflags)
  end
  def resync_luns(psourceluns : VDS_LUN_INFORMATION*, ptargetluns : VDS_LUN_INFORMATION*, dwcount : UInt32, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.resync_luns.unsafe_as(Proc(VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, UInt32, IVssAsync*, HRESULT)).call(psourceluns, ptargetluns, dwcount, ppasync)
  end
  def on_reuse_luns(psnapshotluns : VDS_LUN_INFORMATION*, poriginalluns : VDS_LUN_INFORMATION*, dwcount : UInt32) : HRESULT
    @lpVtbl.value.on_reuse_luns.unsafe_as(Proc(VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, UInt32, HRESULT)).call(psnapshotluns, poriginalluns, dwcount)
  end
end
struct LibWin32::IVssFileShareSnapshotProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_context(lcontext : Int32) : HRESULT
    @lpVtbl.value.set_context.unsafe_as(Proc(Int32, HRESULT)).call(lcontext)
  end
  def get_snapshot_properties(snapshotid : Guid, pprop : VSS_SNAPSHOT_PROP*) : HRESULT
    @lpVtbl.value.get_snapshot_properties.unsafe_as(Proc(Guid, VSS_SNAPSHOT_PROP*, HRESULT)).call(snapshotid, pprop)
  end
  def query(queriedobjectid : Guid, equeriedobjecttype : VSS_OBJECT_TYPE, ereturnedobjectstype : VSS_OBJECT_TYPE, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query.unsafe_as(Proc(Guid, VSS_OBJECT_TYPE, VSS_OBJECT_TYPE, IVssEnumObject*, HRESULT)).call(queriedobjectid, equeriedobjecttype, ereturnedobjectstype, ppenum)
  end
  def delete_snapshots(sourceobjectid : Guid, esourceobjecttype : VSS_OBJECT_TYPE, bforcedelete : LibC::BOOL, pldeletedsnapshots : Int32*, pnondeletedsnapshotid : Guid*) : HRESULT
    @lpVtbl.value.delete_snapshots.unsafe_as(Proc(Guid, VSS_OBJECT_TYPE, LibC::BOOL, Int32*, Guid*, HRESULT)).call(sourceobjectid, esourceobjecttype, bforcedelete, pldeletedsnapshots, pnondeletedsnapshotid)
  end
  def begin_prepare_snapshot(snapshotsetid : Guid, snapshotid : Guid, pwszsharepath : UInt16*, lnewcontext : Int32, providerid : Guid) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.unsafe_as(Proc(Guid, Guid, UInt16*, Int32, Guid, HRESULT)).call(snapshotsetid, snapshotid, pwszsharepath, lnewcontext, providerid)
  end
  def is_path_supported(pwszsharepath : UInt16*, pbsupportedbythisprovider : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_path_supported.unsafe_as(Proc(UInt16*, LibC::BOOL*, HRESULT)).call(pwszsharepath, pbsupportedbythisprovider)
  end
  def is_path_snapshotted(pwszsharepath : UInt16*, pbsnapshotspresent : LibC::BOOL*, plsnapshotcompatibility : Int32*) : HRESULT
    @lpVtbl.value.is_path_snapshotted.unsafe_as(Proc(UInt16*, LibC::BOOL*, Int32*, HRESULT)).call(pwszsharepath, pbsnapshotspresent, plsnapshotcompatibility)
  end
  def set_snapshot_property(snapshotid : Guid, esnapshotpropertyid : VSS_SNAPSHOT_PROPERTY_ID, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_snapshot_property.unsafe_as(Proc(Guid, VSS_SNAPSHOT_PROPERTY_ID, VARIANT, HRESULT)).call(snapshotid, esnapshotpropertyid, vproperty)
  end
end
