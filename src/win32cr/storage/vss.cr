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
    query_interface : Proc(IVssEnumObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssEnumObject*, UInt32)
    release : Proc(IVssEnumObject*, UInt32)
    next : Proc(IVssEnumObject*, UInt32, VSS_OBJECT_PROP*, UInt32*, HRESULT)
    skip : Proc(IVssEnumObject*, UInt32, HRESULT)
    reset : Proc(IVssEnumObject*, HRESULT)
    clone : Proc(IVssEnumObject*, IVssEnumObject*, HRESULT)
  end

  IVssEnumObject_GUID = "ae1c7110-2f60-11d3-8a39-00c04f72d8e3"
  IID_IVssEnumObject = LibC::GUID.new(0xae1c7110_u32, 0x2f60_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x39_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x72_u8, 0xd8_u8, 0xe3_u8])
  struct IVssEnumObject
    lpVtbl : IVssEnumObjectVTbl*
  end

  struct IVssAsyncVTbl
    query_interface : Proc(IVssAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssAsync*, UInt32)
    release : Proc(IVssAsync*, UInt32)
    cancel : Proc(IVssAsync*, HRESULT)
    wait : Proc(IVssAsync*, UInt32, HRESULT)
    query_status : Proc(IVssAsync*, HRESULT*, Int32*, HRESULT)
  end

  IVssAsync_GUID = "507c37b4-cf5b-4e95-b0af-14eb9767467e"
  IID_IVssAsync = LibC::GUID.new(0x507c37b4_u32, 0xcf5b_u16, 0x4e95_u16, StaticArray[0xb0_u8, 0xaf_u8, 0x14_u8, 0xeb_u8, 0x97_u8, 0x67_u8, 0x46_u8, 0x7e_u8])
  struct IVssAsync
    lpVtbl : IVssAsyncVTbl*
  end

  struct IVssWMFiledescVTbl
    query_interface : Proc(IVssWMFiledesc*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssWMFiledesc*, UInt32)
    release : Proc(IVssWMFiledesc*, UInt32)
    get_path : Proc(IVssWMFiledesc*, UInt8**, HRESULT)
    get_filespec : Proc(IVssWMFiledesc*, UInt8**, HRESULT)
    get_recursive : Proc(IVssWMFiledesc*, Bool*, HRESULT)
    get_alternate_location : Proc(IVssWMFiledesc*, UInt8**, HRESULT)
    get_backup_type_mask : Proc(IVssWMFiledesc*, UInt32*, HRESULT)
  end

  struct IVssWMFiledesc
    lpVtbl : IVssWMFiledescVTbl*
  end

  struct IVssWMDependencyVTbl
    query_interface : Proc(IVssWMDependency*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssWMDependency*, UInt32)
    release : Proc(IVssWMDependency*, UInt32)
    get_writer_id : Proc(IVssWMDependency*, Guid*, HRESULT)
    get_logical_path : Proc(IVssWMDependency*, UInt8**, HRESULT)
    get_component_name : Proc(IVssWMDependency*, UInt8**, HRESULT)
  end

  struct IVssWMDependency
    lpVtbl : IVssWMDependencyVTbl*
  end

  struct IVssComponentVTbl
    query_interface : Proc(IVssComponent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssComponent*, UInt32)
    release : Proc(IVssComponent*, UInt32)
    get_logical_path : Proc(IVssComponent*, UInt8**, HRESULT)
    get_component_type : Proc(IVssComponent*, VSS_COMPONENT_TYPE*, HRESULT)
    get_component_name : Proc(IVssComponent*, UInt8**, HRESULT)
    get_backup_succeeded : Proc(IVssComponent*, Bool*, HRESULT)
    get_alternate_location_mapping_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_alternate_location_mapping : Proc(IVssComponent*, UInt32, IVssWMFiledesc*, HRESULT)
    set_backup_metadata : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_backup_metadata : Proc(IVssComponent*, UInt8**, HRESULT)
    add_partial_file : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_partial_file_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_partial_file : Proc(IVssComponent*, UInt32, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)
    is_selected_for_restore : Proc(IVssComponent*, Bool*, HRESULT)
    get_additional_restores : Proc(IVssComponent*, Bool*, HRESULT)
    get_new_target_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_new_target : Proc(IVssComponent*, UInt32, IVssWMFiledesc*, HRESULT)
    add_directed_target : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_directed_target_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_directed_target : Proc(IVssComponent*, UInt32, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)
    set_restore_metadata : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_restore_metadata : Proc(IVssComponent*, UInt8**, HRESULT)
    set_restore_target : Proc(IVssComponent*, VSS_RESTORE_TARGET, HRESULT)
    get_restore_target : Proc(IVssComponent*, VSS_RESTORE_TARGET*, HRESULT)
    set_pre_restore_failure_msg : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_pre_restore_failure_msg : Proc(IVssComponent*, UInt8**, HRESULT)
    set_post_restore_failure_msg : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_post_restore_failure_msg : Proc(IVssComponent*, UInt8**, HRESULT)
    set_backup_stamp : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_backup_stamp : Proc(IVssComponent*, UInt8**, HRESULT)
    get_previous_backup_stamp : Proc(IVssComponent*, UInt8**, HRESULT)
    get_backup_options : Proc(IVssComponent*, UInt8**, HRESULT)
    get_restore_options : Proc(IVssComponent*, UInt8**, HRESULT)
    get_restore_subcomponent_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_restore_subcomponent : Proc(IVssComponent*, UInt32, UInt8**, UInt8**, Bool*, HRESULT)
    get_file_restore_status : Proc(IVssComponent*, VSS_FILE_RESTORE_STATUS*, HRESULT)
    add_differenced_files_by_last_modify_time : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8*, HRESULT)
    get_differenced_files_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_differenced_file : Proc(IVssComponent*, UInt32, UInt8**, UInt8**, LibC::BOOL*, UInt8**, FILETIME*, HRESULT)
  end

  IVssComponent_GUID = "d2c72c96-c121-4518-b627-e5a93d010ead"
  IID_IVssComponent = LibC::GUID.new(0xd2c72c96_u32, 0xc121_u16, 0x4518_u16, StaticArray[0xb6_u8, 0x27_u8, 0xe5_u8, 0xa9_u8, 0x3d_u8, 0x1_u8, 0xe_u8, 0xad_u8])
  struct IVssComponent
    lpVtbl : IVssComponentVTbl*
  end

  struct IVssWriterComponentsVTbl
    get_component_count : Proc(IVssWriterComponents*, UInt32*, HRESULT)
    get_writer_info : Proc(IVssWriterComponents*, Guid*, Guid*, HRESULT)
    get_component : Proc(IVssWriterComponents*, UInt32, IVssComponent*, HRESULT)
  end

  struct IVssWriterComponents
    lpVtbl : IVssWriterComponentsVTbl*
  end

  struct IVssComponentExVTbl
    query_interface : Proc(IVssComponentEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssComponentEx*, UInt32)
    release : Proc(IVssComponentEx*, UInt32)
    get_logical_path : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_component_type : Proc(IVssComponentEx*, VSS_COMPONENT_TYPE*, HRESULT)
    get_component_name : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_backup_succeeded : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_alternate_location_mapping_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_alternate_location_mapping : Proc(IVssComponentEx*, UInt32, IVssWMFiledesc*, HRESULT)
    set_backup_metadata : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_backup_metadata : Proc(IVssComponentEx*, UInt8**, HRESULT)
    add_partial_file : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_partial_file_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_partial_file : Proc(IVssComponentEx*, UInt32, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)
    is_selected_for_restore : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_additional_restores : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_new_target_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_new_target : Proc(IVssComponentEx*, UInt32, IVssWMFiledesc*, HRESULT)
    add_directed_target : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_directed_target_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_directed_target : Proc(IVssComponentEx*, UInt32, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)
    set_restore_metadata : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_restore_metadata : Proc(IVssComponentEx*, UInt8**, HRESULT)
    set_restore_target : Proc(IVssComponentEx*, VSS_RESTORE_TARGET, HRESULT)
    get_restore_target : Proc(IVssComponentEx*, VSS_RESTORE_TARGET*, HRESULT)
    set_pre_restore_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_pre_restore_failure_msg : Proc(IVssComponentEx*, UInt8**, HRESULT)
    set_post_restore_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_post_restore_failure_msg : Proc(IVssComponentEx*, UInt8**, HRESULT)
    set_backup_stamp : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_backup_stamp : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_previous_backup_stamp : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_backup_options : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_restore_options : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_restore_subcomponent_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_restore_subcomponent : Proc(IVssComponentEx*, UInt32, UInt8**, UInt8**, Bool*, HRESULT)
    get_file_restore_status : Proc(IVssComponentEx*, VSS_FILE_RESTORE_STATUS*, HRESULT)
    add_differenced_files_by_last_modify_time : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8*, HRESULT)
    get_differenced_files_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_differenced_file : Proc(IVssComponentEx*, UInt32, UInt8**, UInt8**, LibC::BOOL*, UInt8**, FILETIME*, HRESULT)
    set_prepare_for_backup_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    set_post_snapshot_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_prepare_for_backup_failure_msg : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_post_snapshot_failure_msg : Proc(IVssComponentEx*, UInt8**, HRESULT)
    get_authoritative_restore : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_roll_forward : Proc(IVssComponentEx*, VSS_ROLLFORWARD_TYPE*, UInt8**, HRESULT)
    get_restore_name : Proc(IVssComponentEx*, UInt8**, HRESULT)
  end

  IVssComponentEx_GUID = "156c8b5e-f131-4bd7-9c97-d1923be7e1fa"
  IID_IVssComponentEx = LibC::GUID.new(0x156c8b5e_u32, 0xf131_u16, 0x4bd7_u16, StaticArray[0x9c_u8, 0x97_u8, 0xd1_u8, 0x92_u8, 0x3b_u8, 0xe7_u8, 0xe1_u8, 0xfa_u8])
  struct IVssComponentEx
    lpVtbl : IVssComponentExVTbl*
  end

  struct IVssComponentEx2VTbl
    query_interface : Proc(IVssComponentEx2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssComponentEx2*, UInt32)
    release : Proc(IVssComponentEx2*, UInt32)
    get_logical_path : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_component_type : Proc(IVssComponentEx2*, VSS_COMPONENT_TYPE*, HRESULT)
    get_component_name : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_backup_succeeded : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_alternate_location_mapping_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_alternate_location_mapping : Proc(IVssComponentEx2*, UInt32, IVssWMFiledesc*, HRESULT)
    set_backup_metadata : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_backup_metadata : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    add_partial_file : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_partial_file_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_partial_file : Proc(IVssComponentEx2*, UInt32, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)
    is_selected_for_restore : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_additional_restores : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_new_target_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_new_target : Proc(IVssComponentEx2*, UInt32, IVssWMFiledesc*, HRESULT)
    add_directed_target : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_directed_target_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_directed_target : Proc(IVssComponentEx2*, UInt32, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, UInt8**, HRESULT)
    set_restore_metadata : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_restore_metadata : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    set_restore_target : Proc(IVssComponentEx2*, VSS_RESTORE_TARGET, HRESULT)
    get_restore_target : Proc(IVssComponentEx2*, VSS_RESTORE_TARGET*, HRESULT)
    set_pre_restore_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_pre_restore_failure_msg : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    set_post_restore_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_post_restore_failure_msg : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    set_backup_stamp : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_backup_stamp : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_previous_backup_stamp : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_backup_options : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_restore_options : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_restore_subcomponent_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_restore_subcomponent : Proc(IVssComponentEx2*, UInt32, UInt8**, UInt8**, Bool*, HRESULT)
    get_file_restore_status : Proc(IVssComponentEx2*, VSS_FILE_RESTORE_STATUS*, HRESULT)
    add_differenced_files_by_last_modify_time : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8*, HRESULT)
    get_differenced_files_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_differenced_file : Proc(IVssComponentEx2*, UInt32, UInt8**, UInt8**, LibC::BOOL*, UInt8**, FILETIME*, HRESULT)
    set_prepare_for_backup_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    set_post_snapshot_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_prepare_for_backup_failure_msg : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_post_snapshot_failure_msg : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    get_authoritative_restore : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_roll_forward : Proc(IVssComponentEx2*, VSS_ROLLFORWARD_TYPE*, UInt8**, HRESULT)
    get_restore_name : Proc(IVssComponentEx2*, UInt8**, HRESULT)
    set_failure : Proc(IVssComponentEx2*, HRESULT, HRESULT, LibC::LPWSTR, UInt32, HRESULT)
    get_failure : Proc(IVssComponentEx2*, HRESULT*, HRESULT*, UInt8**, UInt32*, HRESULT)
  end

  IVssComponentEx2_GUID = "3b5be0f2-07a9-4e4b-bdd3-cfdc8e2c0d2d"
  IID_IVssComponentEx2 = LibC::GUID.new(0x3b5be0f2_u32, 0x7a9_u16, 0x4e4b_u16, StaticArray[0xbd_u8, 0xd3_u8, 0xcf_u8, 0xdc_u8, 0x8e_u8, 0x2c_u8, 0xd_u8, 0x2d_u8])
  struct IVssComponentEx2
    lpVtbl : IVssComponentEx2VTbl*
  end

  struct IVssCreateWriterMetadataVTbl
    add_include_files : Proc(IVssCreateWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, HRESULT)
    add_exclude_files : Proc(IVssCreateWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, UInt8, HRESULT)
    add_component : Proc(IVssCreateWriterMetadata*, VSS_COMPONENT_TYPE, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8*, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, HRESULT)
    add_database_files : Proc(IVssCreateWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)
    add_database_log_files : Proc(IVssCreateWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)
    add_files_to_file_group : Proc(IVssCreateWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, UInt32, HRESULT)
    set_restore_method : Proc(IVssCreateWriterMetadata*, VSS_RESTOREMETHOD_ENUM, LibC::LPWSTR, LibC::LPWSTR, VSS_WRITERRESTORE_ENUM, UInt8, HRESULT)
    add_alternate_location_mapping : Proc(IVssCreateWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, HRESULT)
    add_component_dependency : Proc(IVssCreateWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, Guid, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_backup_schema : Proc(IVssCreateWriterMetadata*, UInt32, HRESULT)
    get_document : Proc(IVssCreateWriterMetadata*, IXMLDOMDocument*, HRESULT)
    save_as_xml : Proc(IVssCreateWriterMetadata*, UInt8**, HRESULT)
  end

  struct IVssCreateWriterMetadata
    lpVtbl : IVssCreateWriterMetadataVTbl*
  end

  struct IVssWriterImplVTbl
    query_interface : Proc(IVssWriterImpl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssWriterImpl*, UInt32)
    release : Proc(IVssWriterImpl*, UInt32)
    initialize : Proc(IVssWriterImpl*, Guid, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32, VSS_USAGE_TYPE, VSS_SOURCE_TYPE, VSS_APPLICATION_LEVEL, UInt32, VSS_ALTERNATE_WRITER_STATE, UInt8, HRESULT)
    subscribe : Proc(IVssWriterImpl*, UInt32, UInt32, HRESULT)
    unsubscribe : Proc(IVssWriterImpl*, HRESULT)
    uninitialize : Proc(IVssWriterImpl*, Void)
    get_current_volume_array : Proc(IVssWriterImpl*, LibC::LPWSTR**)
    get_current_volume_count : Proc(IVssWriterImpl*, UInt32)
    get_snapshot_device_name : Proc(IVssWriterImpl*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    get_current_snapshot_set_id : Proc(IVssWriterImpl*, Guid)
    get_context : Proc(IVssWriterImpl*, Int32)
    get_current_level : Proc(IVssWriterImpl*, VSS_APPLICATION_LEVEL)
    is_path_affected : Proc(IVssWriterImpl*, LibC::LPWSTR, Bool)
    is_bootable_system_state_backed_up : Proc(IVssWriterImpl*, Bool)
    are_components_selected : Proc(IVssWriterImpl*, Bool)
    get_backup_type : Proc(IVssWriterImpl*, VSS_BACKUP_TYPE)
    get_restore_type : Proc(IVssWriterImpl*, VSS_RESTORE_TYPE)
    set_writer_failure : Proc(IVssWriterImpl*, HRESULT, HRESULT)
    is_partial_file_support_enabled : Proc(IVssWriterImpl*, Bool)
    install_alternate_writer : Proc(IVssWriterImpl*, Guid, Guid, HRESULT)
    get_identity_information : Proc(IVssWriterImpl*, IVssExamineWriterMetadata**)
    set_writer_failure_ex : Proc(IVssWriterImpl*, HRESULT, HRESULT, LibC::LPWSTR, HRESULT)
    get_session_id : Proc(IVssWriterImpl*, Guid*, HRESULT)
    is_writer_shutting_down : Proc(IVssWriterImpl*, Bool)
  end

  struct IVssWriterImpl
    lpVtbl : IVssWriterImplVTbl*
  end

  struct IVssCreateExpressWriterMetadataVTbl
    query_interface : Proc(IVssCreateExpressWriterMetadata*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssCreateExpressWriterMetadata*, UInt32)
    release : Proc(IVssCreateExpressWriterMetadata*, UInt32)
    add_exclude_files : Proc(IVssCreateExpressWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, UInt8, HRESULT)
    add_component : Proc(IVssCreateExpressWriterMetadata*, VSS_COMPONENT_TYPE, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8*, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, HRESULT)
    add_files_to_file_group : Proc(IVssCreateExpressWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8, LibC::LPWSTR, UInt32, HRESULT)
    set_restore_method : Proc(IVssCreateExpressWriterMetadata*, VSS_RESTOREMETHOD_ENUM, LibC::LPWSTR, LibC::LPWSTR, VSS_WRITERRESTORE_ENUM, UInt8, HRESULT)
    add_component_dependency : Proc(IVssCreateExpressWriterMetadata*, LibC::LPWSTR, LibC::LPWSTR, Guid, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_backup_schema : Proc(IVssCreateExpressWriterMetadata*, UInt32, HRESULT)
    save_as_xml : Proc(IVssCreateExpressWriterMetadata*, UInt8**, HRESULT)
  end

  IVssCreateExpressWriterMetadata_GUID = "9c772e77-b26e-427f-92dd-c996f41ea5e3"
  IID_IVssCreateExpressWriterMetadata = LibC::GUID.new(0x9c772e77_u32, 0xb26e_u16, 0x427f_u16, StaticArray[0x92_u8, 0xdd_u8, 0xc9_u8, 0x96_u8, 0xf4_u8, 0x1e_u8, 0xa5_u8, 0xe3_u8])
  struct IVssCreateExpressWriterMetadata
    lpVtbl : IVssCreateExpressWriterMetadataVTbl*
  end

  struct IVssExpressWriterVTbl
    query_interface : Proc(IVssExpressWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssExpressWriter*, UInt32)
    release : Proc(IVssExpressWriter*, UInt32)
    create_metadata : Proc(IVssExpressWriter*, Guid, LibC::LPWSTR, VSS_USAGE_TYPE, UInt32, UInt32, UInt32, IVssCreateExpressWriterMetadata*, HRESULT)
    load_metadata : Proc(IVssExpressWriter*, LibC::LPWSTR, UInt32, HRESULT)
    register : Proc(IVssExpressWriter*, HRESULT)
    unregister : Proc(IVssExpressWriter*, Guid, HRESULT)
  end

  IVssExpressWriter_GUID = "e33affdc-59c7-47b1-97d5-4266598f6235"
  IID_IVssExpressWriter = LibC::GUID.new(0xe33affdc_u32, 0x59c7_u16, 0x47b1_u16, StaticArray[0x97_u8, 0xd5_u8, 0x42_u8, 0x66_u8, 0x59_u8, 0x8f_u8, 0x62_u8, 0x35_u8])
  struct IVssExpressWriter
    lpVtbl : IVssExpressWriterVTbl*
  end

  struct IVssSnapshotMgmtVTbl
    query_interface : Proc(IVssSnapshotMgmt*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssSnapshotMgmt*, UInt32)
    release : Proc(IVssSnapshotMgmt*, UInt32)
    get_provider_mgmt_interface : Proc(IVssSnapshotMgmt*, Guid, Guid*, IUnknown*, HRESULT)
    query_volumes_supported_for_snapshots : Proc(IVssSnapshotMgmt*, Guid, Int32, IVssEnumMgmtObject*, HRESULT)
    query_snapshots_by_volume : Proc(IVssSnapshotMgmt*, UInt16*, Guid, IVssEnumObject*, HRESULT)
  end

  IVssSnapshotMgmt_GUID = "fa7df749-66e7-4986-a27f-e2f04ae53772"
  IID_IVssSnapshotMgmt = LibC::GUID.new(0xfa7df749_u32, 0x66e7_u16, 0x4986_u16, StaticArray[0xa2_u8, 0x7f_u8, 0xe2_u8, 0xf0_u8, 0x4a_u8, 0xe5_u8, 0x37_u8, 0x72_u8])
  struct IVssSnapshotMgmt
    lpVtbl : IVssSnapshotMgmtVTbl*
  end

  struct IVssSnapshotMgmt2VTbl
    query_interface : Proc(IVssSnapshotMgmt2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssSnapshotMgmt2*, UInt32)
    release : Proc(IVssSnapshotMgmt2*, UInt32)
    get_min_diff_area_size : Proc(IVssSnapshotMgmt2*, Int64*, HRESULT)
  end

  IVssSnapshotMgmt2_GUID = "0f61ec39-fe82-45f2-a3f0-768b5d427102"
  IID_IVssSnapshotMgmt2 = LibC::GUID.new(0xf61ec39_u32, 0xfe82_u16, 0x45f2_u16, StaticArray[0xa3_u8, 0xf0_u8, 0x76_u8, 0x8b_u8, 0x5d_u8, 0x42_u8, 0x71_u8, 0x2_u8])
  struct IVssSnapshotMgmt2
    lpVtbl : IVssSnapshotMgmt2VTbl*
  end

  struct IVssDifferentialSoftwareSnapshotMgmtVTbl
    query_interface : Proc(IVssDifferentialSoftwareSnapshotMgmt*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt32)
    release : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt32)
    add_diff_area : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, UInt16*, Int64, HRESULT)
    change_diff_area_maximum_size : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, UInt16*, Int64, HRESULT)
    query_volumes_supported_for_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_for_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_on_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_for_snapshot : Proc(IVssDifferentialSoftwareSnapshotMgmt*, Guid, IVssEnumMgmtObject*, HRESULT)
  end

  IVssDifferentialSoftwareSnapshotMgmt_GUID = "214a0f28-b737-4026-b847-4f9e37d79529"
  IID_IVssDifferentialSoftwareSnapshotMgmt = LibC::GUID.new(0x214a0f28_u32, 0xb737_u16, 0x4026_u16, StaticArray[0xb8_u8, 0x47_u8, 0x4f_u8, 0x9e_u8, 0x37_u8, 0xd7_u8, 0x95_u8, 0x29_u8])
  struct IVssDifferentialSoftwareSnapshotMgmt
    lpVtbl : IVssDifferentialSoftwareSnapshotMgmtVTbl*
  end

  struct IVssDifferentialSoftwareSnapshotMgmt2VTbl
    query_interface : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt32)
    release : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt32)
    add_diff_area : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, Int64, HRESULT)
    change_diff_area_maximum_size : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, Int64, HRESULT)
    query_volumes_supported_for_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_for_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_on_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_for_snapshot : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, Guid, IVssEnumMgmtObject*, HRESULT)
    change_diff_area_maximum_size_ex : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, Int64, LibC::BOOL, HRESULT)
    migrate_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, UInt16*, HRESULT)
    query_migration_status : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, UInt16*, UInt16*, IVssAsync*, HRESULT)
    set_snapshot_priority : Proc(IVssDifferentialSoftwareSnapshotMgmt2*, Guid, UInt8, HRESULT)
  end

  IVssDifferentialSoftwareSnapshotMgmt2_GUID = "949d7353-675f-4275-8969-f044c6277815"
  IID_IVssDifferentialSoftwareSnapshotMgmt2 = LibC::GUID.new(0x949d7353_u32, 0x675f_u16, 0x4275_u16, StaticArray[0x89_u8, 0x69_u8, 0xf0_u8, 0x44_u8, 0xc6_u8, 0x27_u8, 0x78_u8, 0x15_u8])
  struct IVssDifferentialSoftwareSnapshotMgmt2
    lpVtbl : IVssDifferentialSoftwareSnapshotMgmt2VTbl*
  end

  struct IVssDifferentialSoftwareSnapshotMgmt3VTbl
    query_interface : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt32)
    release : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt32)
    add_diff_area : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, Int64, HRESULT)
    change_diff_area_maximum_size : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, Int64, HRESULT)
    query_volumes_supported_for_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_for_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_on_volume : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, IVssEnumMgmtObject*, HRESULT)
    query_diff_areas_for_snapshot : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, Guid, IVssEnumMgmtObject*, HRESULT)
    change_diff_area_maximum_size_ex : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, Int64, LibC::BOOL, HRESULT)
    migrate_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, UInt16*, HRESULT)
    query_migration_status : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, UInt16*, IVssAsync*, HRESULT)
    set_snapshot_priority : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, Guid, UInt8, HRESULT)
    set_volume_protect_level : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, VSS_PROTECTION_LEVEL, HRESULT)
    get_volume_protect_level : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, VSS_VOLUME_PROTECTION_INFO*, HRESULT)
    clear_volume_protect_fault : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, HRESULT)
    delete_unused_diff_areas : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, UInt16*, HRESULT)
    query_snapshot_delta_bitmap : Proc(IVssDifferentialSoftwareSnapshotMgmt3*, Guid, Guid, UInt32*, UInt32*, UInt8**, HRESULT)
  end

  IVssDifferentialSoftwareSnapshotMgmt3_GUID = "383f7e71-a4c5-401f-b27f-f826289f8458"
  IID_IVssDifferentialSoftwareSnapshotMgmt3 = LibC::GUID.new(0x383f7e71_u32, 0xa4c5_u16, 0x401f_u16, StaticArray[0xb2_u8, 0x7f_u8, 0xf8_u8, 0x26_u8, 0x28_u8, 0x9f_u8, 0x84_u8, 0x58_u8])
  struct IVssDifferentialSoftwareSnapshotMgmt3
    lpVtbl : IVssDifferentialSoftwareSnapshotMgmt3VTbl*
  end

  struct IVssEnumMgmtObjectVTbl
    query_interface : Proc(IVssEnumMgmtObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssEnumMgmtObject*, UInt32)
    release : Proc(IVssEnumMgmtObject*, UInt32)
    next : Proc(IVssEnumMgmtObject*, UInt32, VSS_MGMT_OBJECT_PROP*, UInt32*, HRESULT)
    skip : Proc(IVssEnumMgmtObject*, UInt32, HRESULT)
    reset : Proc(IVssEnumMgmtObject*, HRESULT)
    clone : Proc(IVssEnumMgmtObject*, IVssEnumMgmtObject*, HRESULT)
  end

  IVssEnumMgmtObject_GUID = "01954e6b-9254-4e6e-808c-c9e05d007696"
  IID_IVssEnumMgmtObject = LibC::GUID.new(0x1954e6b_u32, 0x9254_u16, 0x4e6e_u16, StaticArray[0x80_u8, 0x8c_u8, 0xc9_u8, 0xe0_u8, 0x5d_u8, 0x0_u8, 0x76_u8, 0x96_u8])
  struct IVssEnumMgmtObject
    lpVtbl : IVssEnumMgmtObjectVTbl*
  end

  struct IVssAdminVTbl
    query_interface : Proc(IVssAdmin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssAdmin*, UInt32)
    release : Proc(IVssAdmin*, UInt32)
    register_provider : Proc(IVssAdmin*, Guid, Guid, UInt16*, VSS_PROVIDER_TYPE, UInt16*, Guid, HRESULT)
    unregister_provider : Proc(IVssAdmin*, Guid, HRESULT)
    query_providers : Proc(IVssAdmin*, IVssEnumObject*, HRESULT)
    abort_all_snapshots_in_progress : Proc(IVssAdmin*, HRESULT)
  end

  IVssAdmin_GUID = "77ed5996-2f63-11d3-8a39-00c04f72d8e3"
  IID_IVssAdmin = LibC::GUID.new(0x77ed5996_u32, 0x2f63_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x39_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x72_u8, 0xd8_u8, 0xe3_u8])
  struct IVssAdmin
    lpVtbl : IVssAdminVTbl*
  end

  struct IVssAdminExVTbl
    query_interface : Proc(IVssAdminEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssAdminEx*, UInt32)
    release : Proc(IVssAdminEx*, UInt32)
    register_provider : Proc(IVssAdminEx*, Guid, Guid, UInt16*, VSS_PROVIDER_TYPE, UInt16*, Guid, HRESULT)
    unregister_provider : Proc(IVssAdminEx*, Guid, HRESULT)
    query_providers : Proc(IVssAdminEx*, IVssEnumObject*, HRESULT)
    abort_all_snapshots_in_progress : Proc(IVssAdminEx*, HRESULT)
    get_provider_capability : Proc(IVssAdminEx*, Guid, UInt64*, HRESULT)
    get_provider_context : Proc(IVssAdminEx*, Guid, Int32*, HRESULT)
    set_provider_context : Proc(IVssAdminEx*, Guid, Int32, HRESULT)
  end

  IVssAdminEx_GUID = "7858a9f8-b1fa-41a6-964f-b9b36b8cd8d8"
  IID_IVssAdminEx = LibC::GUID.new(0x7858a9f8_u32, 0xb1fa_u16, 0x41a6_u16, StaticArray[0x96_u8, 0x4f_u8, 0xb9_u8, 0xb3_u8, 0x6b_u8, 0x8c_u8, 0xd8_u8, 0xd8_u8])
  struct IVssAdminEx
    lpVtbl : IVssAdminExVTbl*
  end

  struct IVssSoftwareSnapshotProviderVTbl
    query_interface : Proc(IVssSoftwareSnapshotProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssSoftwareSnapshotProvider*, UInt32)
    release : Proc(IVssSoftwareSnapshotProvider*, UInt32)
    set_context : Proc(IVssSoftwareSnapshotProvider*, Int32, HRESULT)
    get_snapshot_properties : Proc(IVssSoftwareSnapshotProvider*, Guid, VSS_SNAPSHOT_PROP*, HRESULT)
    query : Proc(IVssSoftwareSnapshotProvider*, Guid, VSS_OBJECT_TYPE, VSS_OBJECT_TYPE, IVssEnumObject*, HRESULT)
    delete_snapshots : Proc(IVssSoftwareSnapshotProvider*, Guid, VSS_OBJECT_TYPE, LibC::BOOL, Int32*, Guid*, HRESULT)
    begin_prepare_snapshot : Proc(IVssSoftwareSnapshotProvider*, Guid, Guid, UInt16*, Int32, HRESULT)
    is_volume_supported : Proc(IVssSoftwareSnapshotProvider*, UInt16*, LibC::BOOL*, HRESULT)
    is_volume_snapshotted : Proc(IVssSoftwareSnapshotProvider*, UInt16*, LibC::BOOL*, Int32*, HRESULT)
    set_snapshot_property : Proc(IVssSoftwareSnapshotProvider*, Guid, VSS_SNAPSHOT_PROPERTY_ID, VARIANT, HRESULT)
    revert_to_snapshot : Proc(IVssSoftwareSnapshotProvider*, Guid, HRESULT)
    query_revert_status : Proc(IVssSoftwareSnapshotProvider*, UInt16*, IVssAsync*, HRESULT)
  end

  IVssSoftwareSnapshotProvider_GUID = "609e123e-2c5a-44d3-8f01-0b1d9a47d1ff"
  IID_IVssSoftwareSnapshotProvider = LibC::GUID.new(0x609e123e_u32, 0x2c5a_u16, 0x44d3_u16, StaticArray[0x8f_u8, 0x1_u8, 0xb_u8, 0x1d_u8, 0x9a_u8, 0x47_u8, 0xd1_u8, 0xff_u8])
  struct IVssSoftwareSnapshotProvider
    lpVtbl : IVssSoftwareSnapshotProviderVTbl*
  end

  struct IVssProviderCreateSnapshotSetVTbl
    query_interface : Proc(IVssProviderCreateSnapshotSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssProviderCreateSnapshotSet*, UInt32)
    release : Proc(IVssProviderCreateSnapshotSet*, UInt32)
    end_prepare_snapshots : Proc(IVssProviderCreateSnapshotSet*, Guid, HRESULT)
    pre_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, Guid, HRESULT)
    commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, Guid, HRESULT)
    post_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, Guid, Int32, HRESULT)
    pre_final_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, Guid, HRESULT)
    post_final_commit_snapshots : Proc(IVssProviderCreateSnapshotSet*, Guid, HRESULT)
    abort_snapshots : Proc(IVssProviderCreateSnapshotSet*, Guid, HRESULT)
  end

  IVssProviderCreateSnapshotSet_GUID = "5f894e5b-1e39-4778-8e23-9abad9f0e08c"
  IID_IVssProviderCreateSnapshotSet = LibC::GUID.new(0x5f894e5b_u32, 0x1e39_u16, 0x4778_u16, StaticArray[0x8e_u8, 0x23_u8, 0x9a_u8, 0xba_u8, 0xd9_u8, 0xf0_u8, 0xe0_u8, 0x8c_u8])
  struct IVssProviderCreateSnapshotSet
    lpVtbl : IVssProviderCreateSnapshotSetVTbl*
  end

  struct IVssProviderNotificationsVTbl
    query_interface : Proc(IVssProviderNotifications*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssProviderNotifications*, UInt32)
    release : Proc(IVssProviderNotifications*, UInt32)
    on_load : Proc(IVssProviderNotifications*, IUnknown, HRESULT)
    on_unload : Proc(IVssProviderNotifications*, LibC::BOOL, HRESULT)
  end

  IVssProviderNotifications_GUID = "e561901f-03a5-4afe-86d0-72baeece7004"
  IID_IVssProviderNotifications = LibC::GUID.new(0xe561901f_u32, 0x3a5_u16, 0x4afe_u16, StaticArray[0x86_u8, 0xd0_u8, 0x72_u8, 0xba_u8, 0xee_u8, 0xce_u8, 0x70_u8, 0x4_u8])
  struct IVssProviderNotifications
    lpVtbl : IVssProviderNotificationsVTbl*
  end

  struct IVssHardwareSnapshotProviderVTbl
    query_interface : Proc(IVssHardwareSnapshotProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssHardwareSnapshotProvider*, UInt32)
    release : Proc(IVssHardwareSnapshotProvider*, UInt32)
    are_luns_supported : Proc(IVssHardwareSnapshotProvider*, Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)
    fill_in_lun_info : Proc(IVssHardwareSnapshotProvider*, UInt16*, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)
    begin_prepare_snapshot : Proc(IVssHardwareSnapshotProvider*, Guid, Guid, Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, HRESULT)
    get_target_luns : Proc(IVssHardwareSnapshotProvider*, Int32, UInt16**, VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, HRESULT)
    locate_luns : Proc(IVssHardwareSnapshotProvider*, Int32, VDS_LUN_INFORMATION*, HRESULT)
    on_lun_empty : Proc(IVssHardwareSnapshotProvider*, UInt16*, VDS_LUN_INFORMATION*, HRESULT)
  end

  IVssHardwareSnapshotProvider_GUID = "9593a157-44e9-4344-bbeb-44fbf9b06b10"
  IID_IVssHardwareSnapshotProvider = LibC::GUID.new(0x9593a157_u32, 0x44e9_u16, 0x4344_u16, StaticArray[0xbb_u8, 0xeb_u8, 0x44_u8, 0xfb_u8, 0xf9_u8, 0xb0_u8, 0x6b_u8, 0x10_u8])
  struct IVssHardwareSnapshotProvider
    lpVtbl : IVssHardwareSnapshotProviderVTbl*
  end

  struct IVssHardwareSnapshotProviderExVTbl
    query_interface : Proc(IVssHardwareSnapshotProviderEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssHardwareSnapshotProviderEx*, UInt32)
    release : Proc(IVssHardwareSnapshotProviderEx*, UInt32)
    are_luns_supported : Proc(IVssHardwareSnapshotProviderEx*, Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)
    fill_in_lun_info : Proc(IVssHardwareSnapshotProviderEx*, UInt16*, VDS_LUN_INFORMATION*, LibC::BOOL*, HRESULT)
    begin_prepare_snapshot : Proc(IVssHardwareSnapshotProviderEx*, Guid, Guid, Int32, Int32, UInt16**, VDS_LUN_INFORMATION*, HRESULT)
    get_target_luns : Proc(IVssHardwareSnapshotProviderEx*, Int32, UInt16**, VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, HRESULT)
    locate_luns : Proc(IVssHardwareSnapshotProviderEx*, Int32, VDS_LUN_INFORMATION*, HRESULT)
    on_lun_empty : Proc(IVssHardwareSnapshotProviderEx*, UInt16*, VDS_LUN_INFORMATION*, HRESULT)
    get_provider_capabilities : Proc(IVssHardwareSnapshotProviderEx*, UInt64*, HRESULT)
    on_lun_state_change : Proc(IVssHardwareSnapshotProviderEx*, VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, UInt32, UInt32, HRESULT)
    resync_luns : Proc(IVssHardwareSnapshotProviderEx*, VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, UInt32, IVssAsync*, HRESULT)
    on_reuse_luns : Proc(IVssHardwareSnapshotProviderEx*, VDS_LUN_INFORMATION*, VDS_LUN_INFORMATION*, UInt32, HRESULT)
  end

  IVssHardwareSnapshotProviderEx_GUID = "7f5ba925-cdb1-4d11-a71f-339eb7e709fd"
  IID_IVssHardwareSnapshotProviderEx = LibC::GUID.new(0x7f5ba925_u32, 0xcdb1_u16, 0x4d11_u16, StaticArray[0xa7_u8, 0x1f_u8, 0x33_u8, 0x9e_u8, 0xb7_u8, 0xe7_u8, 0x9_u8, 0xfd_u8])
  struct IVssHardwareSnapshotProviderEx
    lpVtbl : IVssHardwareSnapshotProviderExVTbl*
  end

  struct IVssFileShareSnapshotProviderVTbl
    query_interface : Proc(IVssFileShareSnapshotProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssFileShareSnapshotProvider*, UInt32)
    release : Proc(IVssFileShareSnapshotProvider*, UInt32)
    set_context : Proc(IVssFileShareSnapshotProvider*, Int32, HRESULT)
    get_snapshot_properties : Proc(IVssFileShareSnapshotProvider*, Guid, VSS_SNAPSHOT_PROP*, HRESULT)
    query : Proc(IVssFileShareSnapshotProvider*, Guid, VSS_OBJECT_TYPE, VSS_OBJECT_TYPE, IVssEnumObject*, HRESULT)
    delete_snapshots : Proc(IVssFileShareSnapshotProvider*, Guid, VSS_OBJECT_TYPE, LibC::BOOL, Int32*, Guid*, HRESULT)
    begin_prepare_snapshot : Proc(IVssFileShareSnapshotProvider*, Guid, Guid, UInt16*, Int32, Guid, HRESULT)
    is_path_supported : Proc(IVssFileShareSnapshotProvider*, UInt16*, LibC::BOOL*, HRESULT)
    is_path_snapshotted : Proc(IVssFileShareSnapshotProvider*, UInt16*, LibC::BOOL*, Int32*, HRESULT)
    set_snapshot_property : Proc(IVssFileShareSnapshotProvider*, Guid, VSS_SNAPSHOT_PROPERTY_ID, VARIANT, HRESULT)
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
  def query_interface(this : IVssEnumObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssEnumObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssEnumObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IVssEnumObject*, celt : UInt32, rgelt : VSS_OBJECT_PROP*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IVssEnumObject*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IVssEnumObject*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IVssEnumObject*, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IVssAsync
  def query_interface(this : IVssAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cancel(this : IVssAsync*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def wait(this : IVssAsync*, dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait.call(this, dwmilliseconds)
  end
  def query_status(this : IVssAsync*, phrresult : HRESULT*, preserved : Int32*) : HRESULT
    @lpVtbl.value.query_status.call(this, phrresult, preserved)
  end
end
struct LibWin32::IVssWMFiledesc
  def query_interface(this : IVssWMFiledesc*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssWMFiledesc*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssWMFiledesc*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_path(this : IVssWMFiledesc*, pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pbstrpath)
  end
  def get_filespec(this : IVssWMFiledesc*, pbstrfilespec : UInt8**) : HRESULT
    @lpVtbl.value.get_filespec.call(this, pbstrfilespec)
  end
  def get_recursive(this : IVssWMFiledesc*, pbrecursive : Bool*) : HRESULT
    @lpVtbl.value.get_recursive.call(this, pbrecursive)
  end
  def get_alternate_location(this : IVssWMFiledesc*, pbstralternatelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_alternate_location.call(this, pbstralternatelocation)
  end
  def get_backup_type_mask(this : IVssWMFiledesc*, pdwtypemask : UInt32*) : HRESULT
    @lpVtbl.value.get_backup_type_mask.call(this, pdwtypemask)
  end
end
struct LibWin32::IVssWMDependency
  def query_interface(this : IVssWMDependency*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssWMDependency*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssWMDependency*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_writer_id(this : IVssWMDependency*, pwriterid : Guid*) : HRESULT
    @lpVtbl.value.get_writer_id.call(this, pwriterid)
  end
  def get_logical_path(this : IVssWMDependency*, pbstrlogicalpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.call(this, pbstrlogicalpath)
  end
  def get_component_name(this : IVssWMDependency*, pbstrcomponentname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.call(this, pbstrcomponentname)
  end
end
struct LibWin32::IVssComponent
  def query_interface(this : IVssComponent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssComponent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssComponent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_logical_path(this : IVssComponent*, pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.call(this, pbstrpath)
  end
  def get_component_type(this : IVssComponent*, pct : VSS_COMPONENT_TYPE*) : HRESULT
    @lpVtbl.value.get_component_type.call(this, pct)
  end
  def get_component_name(this : IVssComponent*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.call(this, pbstrname)
  end
  def get_backup_succeeded(this : IVssComponent*, pbsucceeded : Bool*) : HRESULT
    @lpVtbl.value.get_backup_succeeded.call(this, pbsucceeded)
  end
  def get_alternate_location_mapping_count(this : IVssComponent*, pcmappings : UInt32*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping_count.call(this, pcmappings)
  end
  def get_alternate_location_mapping(this : IVssComponent*, imapping : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping.call(this, imapping, ppfiledesc)
  end
  def set_backup_metadata(this : IVssComponent*, wszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_metadata.call(this, wszdata)
  end
  def get_backup_metadata(this : IVssComponent*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_metadata.call(this, pbstrdata)
  end
  def add_partial_file(this : IVssComponent*, wszpath : LibC::LPWSTR, wszfilename : LibC::LPWSTR, wszranges : LibC::LPWSTR, wszmetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_partial_file.call(this, wszpath, wszfilename, wszranges, wszmetadata)
  end
  def get_partial_file_count(this : IVssComponent*, pcpartialfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_partial_file_count.call(this, pcpartialfiles)
  end
  def get_partial_file(this : IVssComponent*, ipartialfile : UInt32, pbstrpath : UInt8**, pbstrfilename : UInt8**, pbstrrange : UInt8**, pbstrmetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_partial_file.call(this, ipartialfile, pbstrpath, pbstrfilename, pbstrrange, pbstrmetadata)
  end
  def is_selected_for_restore(this : IVssComponent*, pbselectedforrestore : Bool*) : HRESULT
    @lpVtbl.value.is_selected_for_restore.call(this, pbselectedforrestore)
  end
  def get_additional_restores(this : IVssComponent*, pbadditionalrestores : Bool*) : HRESULT
    @lpVtbl.value.get_additional_restores.call(this, pbadditionalrestores)
  end
  def get_new_target_count(this : IVssComponent*, pcnewtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_new_target_count.call(this, pcnewtarget)
  end
  def get_new_target(this : IVssComponent*, inewtarget : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_new_target.call(this, inewtarget, ppfiledesc)
  end
  def add_directed_target(this : IVssComponent*, wszsourcepath : LibC::LPWSTR, wszsourcefilename : LibC::LPWSTR, wszsourcerangelist : LibC::LPWSTR, wszdestinationpath : LibC::LPWSTR, wszdestinationfilename : LibC::LPWSTR, wszdestinationrangelist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_directed_target.call(this, wszsourcepath, wszsourcefilename, wszsourcerangelist, wszdestinationpath, wszdestinationfilename, wszdestinationrangelist)
  end
  def get_directed_target_count(this : IVssComponent*, pcdirectedtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_directed_target_count.call(this, pcdirectedtarget)
  end
  def get_directed_target(this : IVssComponent*, idirectedtarget : UInt32, pbstrsourcepath : UInt8**, pbstrsourcefilename : UInt8**, pbstrsourcerangelist : UInt8**, pbstrdestinationpath : UInt8**, pbstrdestinationfilename : UInt8**, pbstrdestinationrangelist : UInt8**) : HRESULT
    @lpVtbl.value.get_directed_target.call(this, idirectedtarget, pbstrsourcepath, pbstrsourcefilename, pbstrsourcerangelist, pbstrdestinationpath, pbstrdestinationfilename, pbstrdestinationrangelist)
  end
  def set_restore_metadata(this : IVssComponent*, wszrestoremetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_restore_metadata.call(this, wszrestoremetadata)
  end
  def get_restore_metadata(this : IVssComponent*, pbstrrestoremetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_metadata.call(this, pbstrrestoremetadata)
  end
  def set_restore_target(this : IVssComponent*, target : VSS_RESTORE_TARGET) : HRESULT
    @lpVtbl.value.set_restore_target.call(this, target)
  end
  def get_restore_target(this : IVssComponent*, ptarget : VSS_RESTORE_TARGET*) : HRESULT
    @lpVtbl.value.get_restore_target.call(this, ptarget)
  end
  def set_pre_restore_failure_msg(this : IVssComponent*, wszprerestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_pre_restore_failure_msg.call(this, wszprerestorefailuremsg)
  end
  def get_pre_restore_failure_msg(this : IVssComponent*, pbstrprerestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_pre_restore_failure_msg.call(this, pbstrprerestorefailuremsg)
  end
  def set_post_restore_failure_msg(this : IVssComponent*, wszpostrestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_restore_failure_msg.call(this, wszpostrestorefailuremsg)
  end
  def get_post_restore_failure_msg(this : IVssComponent*, pbstrpostrestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_restore_failure_msg.call(this, pbstrpostrestorefailuremsg)
  end
  def set_backup_stamp(this : IVssComponent*, wszbackupstamp : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_stamp.call(this, wszbackupstamp)
  end
  def get_backup_stamp(this : IVssComponent*, pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_stamp.call(this, pbstrbackupstamp)
  end
  def get_previous_backup_stamp(this : IVssComponent*, pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_previous_backup_stamp.call(this, pbstrbackupstamp)
  end
  def get_backup_options(this : IVssComponent*, pbstrbackupoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_options.call(this, pbstrbackupoptions)
  end
  def get_restore_options(this : IVssComponent*, pbstrrestoreoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_options.call(this, pbstrrestoreoptions)
  end
  def get_restore_subcomponent_count(this : IVssComponent*, pcrestoresubcomponent : UInt32*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent_count.call(this, pcrestoresubcomponent)
  end
  def get_restore_subcomponent(this : IVssComponent*, icomponent : UInt32, pbstrlogicalpath : UInt8**, pbstrcomponentname : UInt8**, pbrepair : Bool*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent.call(this, icomponent, pbstrlogicalpath, pbstrcomponentname, pbrepair)
  end
  def get_file_restore_status(this : IVssComponent*, pstatus : VSS_FILE_RESTORE_STATUS*) : HRESULT
    @lpVtbl.value.get_file_restore_status.call(this, pstatus)
  end
  def add_differenced_files_by_last_modify_time(this : IVssComponent*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, ftlastmodifytime : FILETIME) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_time.call(this, wszpath, wszfilespec, brecursive, ftlastmodifytime)
  end
  def add_differenced_files_by_last_modify_lsn(this : IVssComponent*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, bstrlsnstring : UInt8*) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_lsn.call(this, wszpath, wszfilespec, brecursive, bstrlsnstring)
  end
  def get_differenced_files_count(this : IVssComponent*, pcdifferencedfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_differenced_files_count.call(this, pcdifferencedfiles)
  end
  def get_differenced_file(this : IVssComponent*, idifferencedfile : UInt32, pbstrpath : UInt8**, pbstrfilespec : UInt8**, pbrecursive : LibC::BOOL*, pbstrlsnstring : UInt8**, pftlastmodifytime : FILETIME*) : HRESULT
    @lpVtbl.value.get_differenced_file.call(this, idifferencedfile, pbstrpath, pbstrfilespec, pbrecursive, pbstrlsnstring, pftlastmodifytime)
  end
end
struct LibWin32::IVssWriterComponents
  def get_component_count(this : IVssWriterComponents*, pccomponents : UInt32*) : HRESULT
    @lpVtbl.value.get_component_count.call(this, pccomponents)
  end
  def get_writer_info(this : IVssWriterComponents*, pidinstance : Guid*, pidwriter : Guid*) : HRESULT
    @lpVtbl.value.get_writer_info.call(this, pidinstance, pidwriter)
  end
  def get_component(this : IVssWriterComponents*, icomponent : UInt32, ppcomponent : IVssComponent*) : HRESULT
    @lpVtbl.value.get_component.call(this, icomponent, ppcomponent)
  end
end
struct LibWin32::IVssComponentEx
  def query_interface(this : IVssComponentEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssComponentEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssComponentEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_logical_path(this : IVssComponentEx*, pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.call(this, pbstrpath)
  end
  def get_component_type(this : IVssComponentEx*, pct : VSS_COMPONENT_TYPE*) : HRESULT
    @lpVtbl.value.get_component_type.call(this, pct)
  end
  def get_component_name(this : IVssComponentEx*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.call(this, pbstrname)
  end
  def get_backup_succeeded(this : IVssComponentEx*, pbsucceeded : Bool*) : HRESULT
    @lpVtbl.value.get_backup_succeeded.call(this, pbsucceeded)
  end
  def get_alternate_location_mapping_count(this : IVssComponentEx*, pcmappings : UInt32*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping_count.call(this, pcmappings)
  end
  def get_alternate_location_mapping(this : IVssComponentEx*, imapping : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping.call(this, imapping, ppfiledesc)
  end
  def set_backup_metadata(this : IVssComponentEx*, wszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_metadata.call(this, wszdata)
  end
  def get_backup_metadata(this : IVssComponentEx*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_metadata.call(this, pbstrdata)
  end
  def add_partial_file(this : IVssComponentEx*, wszpath : LibC::LPWSTR, wszfilename : LibC::LPWSTR, wszranges : LibC::LPWSTR, wszmetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_partial_file.call(this, wszpath, wszfilename, wszranges, wszmetadata)
  end
  def get_partial_file_count(this : IVssComponentEx*, pcpartialfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_partial_file_count.call(this, pcpartialfiles)
  end
  def get_partial_file(this : IVssComponentEx*, ipartialfile : UInt32, pbstrpath : UInt8**, pbstrfilename : UInt8**, pbstrrange : UInt8**, pbstrmetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_partial_file.call(this, ipartialfile, pbstrpath, pbstrfilename, pbstrrange, pbstrmetadata)
  end
  def is_selected_for_restore(this : IVssComponentEx*, pbselectedforrestore : Bool*) : HRESULT
    @lpVtbl.value.is_selected_for_restore.call(this, pbselectedforrestore)
  end
  def get_additional_restores(this : IVssComponentEx*, pbadditionalrestores : Bool*) : HRESULT
    @lpVtbl.value.get_additional_restores.call(this, pbadditionalrestores)
  end
  def get_new_target_count(this : IVssComponentEx*, pcnewtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_new_target_count.call(this, pcnewtarget)
  end
  def get_new_target(this : IVssComponentEx*, inewtarget : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_new_target.call(this, inewtarget, ppfiledesc)
  end
  def add_directed_target(this : IVssComponentEx*, wszsourcepath : LibC::LPWSTR, wszsourcefilename : LibC::LPWSTR, wszsourcerangelist : LibC::LPWSTR, wszdestinationpath : LibC::LPWSTR, wszdestinationfilename : LibC::LPWSTR, wszdestinationrangelist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_directed_target.call(this, wszsourcepath, wszsourcefilename, wszsourcerangelist, wszdestinationpath, wszdestinationfilename, wszdestinationrangelist)
  end
  def get_directed_target_count(this : IVssComponentEx*, pcdirectedtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_directed_target_count.call(this, pcdirectedtarget)
  end
  def get_directed_target(this : IVssComponentEx*, idirectedtarget : UInt32, pbstrsourcepath : UInt8**, pbstrsourcefilename : UInt8**, pbstrsourcerangelist : UInt8**, pbstrdestinationpath : UInt8**, pbstrdestinationfilename : UInt8**, pbstrdestinationrangelist : UInt8**) : HRESULT
    @lpVtbl.value.get_directed_target.call(this, idirectedtarget, pbstrsourcepath, pbstrsourcefilename, pbstrsourcerangelist, pbstrdestinationpath, pbstrdestinationfilename, pbstrdestinationrangelist)
  end
  def set_restore_metadata(this : IVssComponentEx*, wszrestoremetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_restore_metadata.call(this, wszrestoremetadata)
  end
  def get_restore_metadata(this : IVssComponentEx*, pbstrrestoremetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_metadata.call(this, pbstrrestoremetadata)
  end
  def set_restore_target(this : IVssComponentEx*, target : VSS_RESTORE_TARGET) : HRESULT
    @lpVtbl.value.set_restore_target.call(this, target)
  end
  def get_restore_target(this : IVssComponentEx*, ptarget : VSS_RESTORE_TARGET*) : HRESULT
    @lpVtbl.value.get_restore_target.call(this, ptarget)
  end
  def set_pre_restore_failure_msg(this : IVssComponentEx*, wszprerestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_pre_restore_failure_msg.call(this, wszprerestorefailuremsg)
  end
  def get_pre_restore_failure_msg(this : IVssComponentEx*, pbstrprerestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_pre_restore_failure_msg.call(this, pbstrprerestorefailuremsg)
  end
  def set_post_restore_failure_msg(this : IVssComponentEx*, wszpostrestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_restore_failure_msg.call(this, wszpostrestorefailuremsg)
  end
  def get_post_restore_failure_msg(this : IVssComponentEx*, pbstrpostrestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_restore_failure_msg.call(this, pbstrpostrestorefailuremsg)
  end
  def set_backup_stamp(this : IVssComponentEx*, wszbackupstamp : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_stamp.call(this, wszbackupstamp)
  end
  def get_backup_stamp(this : IVssComponentEx*, pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_stamp.call(this, pbstrbackupstamp)
  end
  def get_previous_backup_stamp(this : IVssComponentEx*, pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_previous_backup_stamp.call(this, pbstrbackupstamp)
  end
  def get_backup_options(this : IVssComponentEx*, pbstrbackupoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_options.call(this, pbstrbackupoptions)
  end
  def get_restore_options(this : IVssComponentEx*, pbstrrestoreoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_options.call(this, pbstrrestoreoptions)
  end
  def get_restore_subcomponent_count(this : IVssComponentEx*, pcrestoresubcomponent : UInt32*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent_count.call(this, pcrestoresubcomponent)
  end
  def get_restore_subcomponent(this : IVssComponentEx*, icomponent : UInt32, pbstrlogicalpath : UInt8**, pbstrcomponentname : UInt8**, pbrepair : Bool*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent.call(this, icomponent, pbstrlogicalpath, pbstrcomponentname, pbrepair)
  end
  def get_file_restore_status(this : IVssComponentEx*, pstatus : VSS_FILE_RESTORE_STATUS*) : HRESULT
    @lpVtbl.value.get_file_restore_status.call(this, pstatus)
  end
  def add_differenced_files_by_last_modify_time(this : IVssComponentEx*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, ftlastmodifytime : FILETIME) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_time.call(this, wszpath, wszfilespec, brecursive, ftlastmodifytime)
  end
  def add_differenced_files_by_last_modify_lsn(this : IVssComponentEx*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, bstrlsnstring : UInt8*) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_lsn.call(this, wszpath, wszfilespec, brecursive, bstrlsnstring)
  end
  def get_differenced_files_count(this : IVssComponentEx*, pcdifferencedfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_differenced_files_count.call(this, pcdifferencedfiles)
  end
  def get_differenced_file(this : IVssComponentEx*, idifferencedfile : UInt32, pbstrpath : UInt8**, pbstrfilespec : UInt8**, pbrecursive : LibC::BOOL*, pbstrlsnstring : UInt8**, pftlastmodifytime : FILETIME*) : HRESULT
    @lpVtbl.value.get_differenced_file.call(this, idifferencedfile, pbstrpath, pbstrfilespec, pbrecursive, pbstrlsnstring, pftlastmodifytime)
  end
  def set_prepare_for_backup_failure_msg(this : IVssComponentEx*, wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_prepare_for_backup_failure_msg.call(this, wszfailuremsg)
  end
  def set_post_snapshot_failure_msg(this : IVssComponentEx*, wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_snapshot_failure_msg.call(this, wszfailuremsg)
  end
  def get_prepare_for_backup_failure_msg(this : IVssComponentEx*, pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_prepare_for_backup_failure_msg.call(this, pbstrfailuremsg)
  end
  def get_post_snapshot_failure_msg(this : IVssComponentEx*, pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_snapshot_failure_msg.call(this, pbstrfailuremsg)
  end
  def get_authoritative_restore(this : IVssComponentEx*, pbauth : Bool*) : HRESULT
    @lpVtbl.value.get_authoritative_restore.call(this, pbauth)
  end
  def get_roll_forward(this : IVssComponentEx*, prolltype : VSS_ROLLFORWARD_TYPE*, pbstrpoint : UInt8**) : HRESULT
    @lpVtbl.value.get_roll_forward.call(this, prolltype, pbstrpoint)
  end
  def get_restore_name(this : IVssComponentEx*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_name.call(this, pbstrname)
  end
end
struct LibWin32::IVssComponentEx2
  def query_interface(this : IVssComponentEx2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssComponentEx2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssComponentEx2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_logical_path(this : IVssComponentEx2*, pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_logical_path.call(this, pbstrpath)
  end
  def get_component_type(this : IVssComponentEx2*, pct : VSS_COMPONENT_TYPE*) : HRESULT
    @lpVtbl.value.get_component_type.call(this, pct)
  end
  def get_component_name(this : IVssComponentEx2*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_component_name.call(this, pbstrname)
  end
  def get_backup_succeeded(this : IVssComponentEx2*, pbsucceeded : Bool*) : HRESULT
    @lpVtbl.value.get_backup_succeeded.call(this, pbsucceeded)
  end
  def get_alternate_location_mapping_count(this : IVssComponentEx2*, pcmappings : UInt32*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping_count.call(this, pcmappings)
  end
  def get_alternate_location_mapping(this : IVssComponentEx2*, imapping : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_alternate_location_mapping.call(this, imapping, ppfiledesc)
  end
  def set_backup_metadata(this : IVssComponentEx2*, wszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_metadata.call(this, wszdata)
  end
  def get_backup_metadata(this : IVssComponentEx2*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_metadata.call(this, pbstrdata)
  end
  def add_partial_file(this : IVssComponentEx2*, wszpath : LibC::LPWSTR, wszfilename : LibC::LPWSTR, wszranges : LibC::LPWSTR, wszmetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_partial_file.call(this, wszpath, wszfilename, wszranges, wszmetadata)
  end
  def get_partial_file_count(this : IVssComponentEx2*, pcpartialfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_partial_file_count.call(this, pcpartialfiles)
  end
  def get_partial_file(this : IVssComponentEx2*, ipartialfile : UInt32, pbstrpath : UInt8**, pbstrfilename : UInt8**, pbstrrange : UInt8**, pbstrmetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_partial_file.call(this, ipartialfile, pbstrpath, pbstrfilename, pbstrrange, pbstrmetadata)
  end
  def is_selected_for_restore(this : IVssComponentEx2*, pbselectedforrestore : Bool*) : HRESULT
    @lpVtbl.value.is_selected_for_restore.call(this, pbselectedforrestore)
  end
  def get_additional_restores(this : IVssComponentEx2*, pbadditionalrestores : Bool*) : HRESULT
    @lpVtbl.value.get_additional_restores.call(this, pbadditionalrestores)
  end
  def get_new_target_count(this : IVssComponentEx2*, pcnewtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_new_target_count.call(this, pcnewtarget)
  end
  def get_new_target(this : IVssComponentEx2*, inewtarget : UInt32, ppfiledesc : IVssWMFiledesc*) : HRESULT
    @lpVtbl.value.get_new_target.call(this, inewtarget, ppfiledesc)
  end
  def add_directed_target(this : IVssComponentEx2*, wszsourcepath : LibC::LPWSTR, wszsourcefilename : LibC::LPWSTR, wszsourcerangelist : LibC::LPWSTR, wszdestinationpath : LibC::LPWSTR, wszdestinationfilename : LibC::LPWSTR, wszdestinationrangelist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_directed_target.call(this, wszsourcepath, wszsourcefilename, wszsourcerangelist, wszdestinationpath, wszdestinationfilename, wszdestinationrangelist)
  end
  def get_directed_target_count(this : IVssComponentEx2*, pcdirectedtarget : UInt32*) : HRESULT
    @lpVtbl.value.get_directed_target_count.call(this, pcdirectedtarget)
  end
  def get_directed_target(this : IVssComponentEx2*, idirectedtarget : UInt32, pbstrsourcepath : UInt8**, pbstrsourcefilename : UInt8**, pbstrsourcerangelist : UInt8**, pbstrdestinationpath : UInt8**, pbstrdestinationfilename : UInt8**, pbstrdestinationrangelist : UInt8**) : HRESULT
    @lpVtbl.value.get_directed_target.call(this, idirectedtarget, pbstrsourcepath, pbstrsourcefilename, pbstrsourcerangelist, pbstrdestinationpath, pbstrdestinationfilename, pbstrdestinationrangelist)
  end
  def set_restore_metadata(this : IVssComponentEx2*, wszrestoremetadata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_restore_metadata.call(this, wszrestoremetadata)
  end
  def get_restore_metadata(this : IVssComponentEx2*, pbstrrestoremetadata : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_metadata.call(this, pbstrrestoremetadata)
  end
  def set_restore_target(this : IVssComponentEx2*, target : VSS_RESTORE_TARGET) : HRESULT
    @lpVtbl.value.set_restore_target.call(this, target)
  end
  def get_restore_target(this : IVssComponentEx2*, ptarget : VSS_RESTORE_TARGET*) : HRESULT
    @lpVtbl.value.get_restore_target.call(this, ptarget)
  end
  def set_pre_restore_failure_msg(this : IVssComponentEx2*, wszprerestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_pre_restore_failure_msg.call(this, wszprerestorefailuremsg)
  end
  def get_pre_restore_failure_msg(this : IVssComponentEx2*, pbstrprerestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_pre_restore_failure_msg.call(this, pbstrprerestorefailuremsg)
  end
  def set_post_restore_failure_msg(this : IVssComponentEx2*, wszpostrestorefailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_restore_failure_msg.call(this, wszpostrestorefailuremsg)
  end
  def get_post_restore_failure_msg(this : IVssComponentEx2*, pbstrpostrestorefailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_restore_failure_msg.call(this, pbstrpostrestorefailuremsg)
  end
  def set_backup_stamp(this : IVssComponentEx2*, wszbackupstamp : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_backup_stamp.call(this, wszbackupstamp)
  end
  def get_backup_stamp(this : IVssComponentEx2*, pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_stamp.call(this, pbstrbackupstamp)
  end
  def get_previous_backup_stamp(this : IVssComponentEx2*, pbstrbackupstamp : UInt8**) : HRESULT
    @lpVtbl.value.get_previous_backup_stamp.call(this, pbstrbackupstamp)
  end
  def get_backup_options(this : IVssComponentEx2*, pbstrbackupoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_options.call(this, pbstrbackupoptions)
  end
  def get_restore_options(this : IVssComponentEx2*, pbstrrestoreoptions : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_options.call(this, pbstrrestoreoptions)
  end
  def get_restore_subcomponent_count(this : IVssComponentEx2*, pcrestoresubcomponent : UInt32*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent_count.call(this, pcrestoresubcomponent)
  end
  def get_restore_subcomponent(this : IVssComponentEx2*, icomponent : UInt32, pbstrlogicalpath : UInt8**, pbstrcomponentname : UInt8**, pbrepair : Bool*) : HRESULT
    @lpVtbl.value.get_restore_subcomponent.call(this, icomponent, pbstrlogicalpath, pbstrcomponentname, pbrepair)
  end
  def get_file_restore_status(this : IVssComponentEx2*, pstatus : VSS_FILE_RESTORE_STATUS*) : HRESULT
    @lpVtbl.value.get_file_restore_status.call(this, pstatus)
  end
  def add_differenced_files_by_last_modify_time(this : IVssComponentEx2*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, ftlastmodifytime : FILETIME) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_time.call(this, wszpath, wszfilespec, brecursive, ftlastmodifytime)
  end
  def add_differenced_files_by_last_modify_lsn(this : IVssComponentEx2*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : LibC::BOOL, bstrlsnstring : UInt8*) : HRESULT
    @lpVtbl.value.add_differenced_files_by_last_modify_lsn.call(this, wszpath, wszfilespec, brecursive, bstrlsnstring)
  end
  def get_differenced_files_count(this : IVssComponentEx2*, pcdifferencedfiles : UInt32*) : HRESULT
    @lpVtbl.value.get_differenced_files_count.call(this, pcdifferencedfiles)
  end
  def get_differenced_file(this : IVssComponentEx2*, idifferencedfile : UInt32, pbstrpath : UInt8**, pbstrfilespec : UInt8**, pbrecursive : LibC::BOOL*, pbstrlsnstring : UInt8**, pftlastmodifytime : FILETIME*) : HRESULT
    @lpVtbl.value.get_differenced_file.call(this, idifferencedfile, pbstrpath, pbstrfilespec, pbrecursive, pbstrlsnstring, pftlastmodifytime)
  end
  def set_prepare_for_backup_failure_msg(this : IVssComponentEx2*, wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_prepare_for_backup_failure_msg.call(this, wszfailuremsg)
  end
  def set_post_snapshot_failure_msg(this : IVssComponentEx2*, wszfailuremsg : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_post_snapshot_failure_msg.call(this, wszfailuremsg)
  end
  def get_prepare_for_backup_failure_msg(this : IVssComponentEx2*, pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_prepare_for_backup_failure_msg.call(this, pbstrfailuremsg)
  end
  def get_post_snapshot_failure_msg(this : IVssComponentEx2*, pbstrfailuremsg : UInt8**) : HRESULT
    @lpVtbl.value.get_post_snapshot_failure_msg.call(this, pbstrfailuremsg)
  end
  def get_authoritative_restore(this : IVssComponentEx2*, pbauth : Bool*) : HRESULT
    @lpVtbl.value.get_authoritative_restore.call(this, pbauth)
  end
  def get_roll_forward(this : IVssComponentEx2*, prolltype : VSS_ROLLFORWARD_TYPE*, pbstrpoint : UInt8**) : HRESULT
    @lpVtbl.value.get_roll_forward.call(this, prolltype, pbstrpoint)
  end
  def get_restore_name(this : IVssComponentEx2*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_restore_name.call(this, pbstrname)
  end
  def set_failure(this : IVssComponentEx2*, hr : HRESULT, hrapplication : HRESULT, wszapplicationmessage : LibC::LPWSTR, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.set_failure.call(this, hr, hrapplication, wszapplicationmessage, dwreserved)
  end
  def get_failure(this : IVssComponentEx2*, phr : HRESULT*, phrapplication : HRESULT*, pbstrapplicationmessage : UInt8**, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_failure.call(this, phr, phrapplication, pbstrapplicationmessage, pdwreserved)
  end
end
struct LibWin32::IVssCreateWriterMetadata
  def add_include_files(this : IVssCreateWriterMetadata*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8, wszalternatelocation : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_include_files.call(this, wszpath, wszfilespec, brecursive, wszalternatelocation)
  end
  def add_exclude_files(this : IVssCreateWriterMetadata*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8) : HRESULT
    @lpVtbl.value.add_exclude_files.call(this, wszpath, wszfilespec, brecursive)
  end
  def add_component(this : IVssCreateWriterMetadata*, ct : VSS_COMPONENT_TYPE, wszlogicalpath : LibC::LPWSTR, wszcomponentname : LibC::LPWSTR, wszcaption : LibC::LPWSTR, pbicon : UInt8*, cbicon : UInt32, brestoremetadata : UInt8, bnotifyonbackupcomplete : UInt8, bselectable : UInt8, bselectableforrestore : UInt8, dwcomponentflags : UInt32) : HRESULT
    @lpVtbl.value.add_component.call(this, ct, wszlogicalpath, wszcomponentname, wszcaption, pbicon, cbicon, brestoremetadata, bnotifyonbackupcomplete, bselectable, bselectableforrestore, dwcomponentflags)
  end
  def add_database_files(this : IVssCreateWriterMetadata*, wszlogicalpath : LibC::LPWSTR, wszdatabasename : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_database_files.call(this, wszlogicalpath, wszdatabasename, wszpath, wszfilespec, dwbackuptypemask)
  end
  def add_database_log_files(this : IVssCreateWriterMetadata*, wszlogicalpath : LibC::LPWSTR, wszdatabasename : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_database_log_files.call(this, wszlogicalpath, wszdatabasename, wszpath, wszfilespec, dwbackuptypemask)
  end
  def add_files_to_file_group(this : IVssCreateWriterMetadata*, wszlogicalpath : LibC::LPWSTR, wszgroupname : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8, wszalternatelocation : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_files_to_file_group.call(this, wszlogicalpath, wszgroupname, wszpath, wszfilespec, brecursive, wszalternatelocation, dwbackuptypemask)
  end
  def set_restore_method(this : IVssCreateWriterMetadata*, method : VSS_RESTOREMETHOD_ENUM, wszservice : LibC::LPWSTR, wszuserprocedure : LibC::LPWSTR, writerrestore : VSS_WRITERRESTORE_ENUM, brebootrequired : UInt8) : HRESULT
    @lpVtbl.value.set_restore_method.call(this, method, wszservice, wszuserprocedure, writerrestore, brebootrequired)
  end
  def add_alternate_location_mapping(this : IVssCreateWriterMetadata*, wszsourcepath : LibC::LPWSTR, wszsourcefilespec : LibC::LPWSTR, brecursive : UInt8, wszdestination : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_alternate_location_mapping.call(this, wszsourcepath, wszsourcefilespec, brecursive, wszdestination)
  end
  def add_component_dependency(this : IVssCreateWriterMetadata*, wszforlogicalpath : LibC::LPWSTR, wszforcomponentname : LibC::LPWSTR, onwriterid : Guid, wszonlogicalpath : LibC::LPWSTR, wszoncomponentname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_component_dependency.call(this, wszforlogicalpath, wszforcomponentname, onwriterid, wszonlogicalpath, wszoncomponentname)
  end
  def set_backup_schema(this : IVssCreateWriterMetadata*, dwschemamask : UInt32) : HRESULT
    @lpVtbl.value.set_backup_schema.call(this, dwschemamask)
  end
  def get_document(this : IVssCreateWriterMetadata*, pdoc : IXMLDOMDocument*) : HRESULT
    @lpVtbl.value.get_document.call(this, pdoc)
  end
  def save_as_xml(this : IVssCreateWriterMetadata*, pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.save_as_xml.call(this, pbstrxml)
  end
end
struct LibWin32::IVssWriterImpl
  def query_interface(this : IVssWriterImpl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssWriterImpl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssWriterImpl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IVssWriterImpl*, writerid : Guid, wszwritername : LibC::LPWSTR, wszwriterinstancename : LibC::LPWSTR, dwmajorversion : UInt32, dwminorversion : UInt32, ut : VSS_USAGE_TYPE, st : VSS_SOURCE_TYPE, nlevel : VSS_APPLICATION_LEVEL, dwtimeout : UInt32, aws : VSS_ALTERNATE_WRITER_STATE, biothrottlingonly : UInt8) : HRESULT
    @lpVtbl.value.initialize.call(this, writerid, wszwritername, wszwriterinstancename, dwmajorversion, dwminorversion, ut, st, nlevel, dwtimeout, aws, biothrottlingonly)
  end
  def subscribe(this : IVssWriterImpl*, dwsubscribetimeout : UInt32, dweventflags : UInt32) : HRESULT
    @lpVtbl.value.subscribe.call(this, dwsubscribetimeout, dweventflags)
  end
  def unsubscribe(this : IVssWriterImpl*) : HRESULT
    @lpVtbl.value.unsubscribe.call(this)
  end
  def uninitialize(this : IVssWriterImpl*) : Void
    @lpVtbl.value.uninitialize.call(this)
  end
  def get_current_volume_array(this : IVssWriterImpl*) : LibC::LPWSTR*
    @lpVtbl.value.get_current_volume_array.call(this)
  end
  def get_current_volume_count(this : IVssWriterImpl*) : UInt32
    @lpVtbl.value.get_current_volume_count.call(this)
  end
  def get_snapshot_device_name(this : IVssWriterImpl*, wszoriginalvolume : LibC::LPWSTR, ppwszsnapshotdevice : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_snapshot_device_name.call(this, wszoriginalvolume, ppwszsnapshotdevice)
  end
  def get_current_snapshot_set_id(this : IVssWriterImpl*) : Guid
    @lpVtbl.value.get_current_snapshot_set_id.call(this)
  end
  def get_context(this : IVssWriterImpl*) : Int32
    @lpVtbl.value.get_context.call(this)
  end
  def get_current_level(this : IVssWriterImpl*) : VSS_APPLICATION_LEVEL
    @lpVtbl.value.get_current_level.call(this)
  end
  def is_path_affected(this : IVssWriterImpl*, wszpath : LibC::LPWSTR) : Bool
    @lpVtbl.value.is_path_affected.call(this, wszpath)
  end
  def is_bootable_system_state_backed_up(this : IVssWriterImpl*) : Bool
    @lpVtbl.value.is_bootable_system_state_backed_up.call(this)
  end
  def are_components_selected(this : IVssWriterImpl*) : Bool
    @lpVtbl.value.are_components_selected.call(this)
  end
  def get_backup_type(this : IVssWriterImpl*) : VSS_BACKUP_TYPE
    @lpVtbl.value.get_backup_type.call(this)
  end
  def get_restore_type(this : IVssWriterImpl*) : VSS_RESTORE_TYPE
    @lpVtbl.value.get_restore_type.call(this)
  end
  def set_writer_failure(this : IVssWriterImpl*, hr : HRESULT) : HRESULT
    @lpVtbl.value.set_writer_failure.call(this, hr)
  end
  def is_partial_file_support_enabled(this : IVssWriterImpl*) : Bool
    @lpVtbl.value.is_partial_file_support_enabled.call(this)
  end
  def install_alternate_writer(this : IVssWriterImpl*, idwriter : Guid, clsid : Guid) : HRESULT
    @lpVtbl.value.install_alternate_writer.call(this, idwriter, clsid)
  end
  def get_identity_information(this : IVssWriterImpl*) : IVssExamineWriterMetadata*
    @lpVtbl.value.get_identity_information.call(this)
  end
  def set_writer_failure_ex(this : IVssWriterImpl*, hr : HRESULT, hrapplication : HRESULT, wszapplicationmessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_writer_failure_ex.call(this, hr, hrapplication, wszapplicationmessage)
  end
  def get_session_id(this : IVssWriterImpl*, idsession : Guid*) : HRESULT
    @lpVtbl.value.get_session_id.call(this, idsession)
  end
  def is_writer_shutting_down(this : IVssWriterImpl*) : Bool
    @lpVtbl.value.is_writer_shutting_down.call(this)
  end
end
struct LibWin32::IVssCreateExpressWriterMetadata
  def query_interface(this : IVssCreateExpressWriterMetadata*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssCreateExpressWriterMetadata*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssCreateExpressWriterMetadata*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_exclude_files(this : IVssCreateExpressWriterMetadata*, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8) : HRESULT
    @lpVtbl.value.add_exclude_files.call(this, wszpath, wszfilespec, brecursive)
  end
  def add_component(this : IVssCreateExpressWriterMetadata*, ct : VSS_COMPONENT_TYPE, wszlogicalpath : LibC::LPWSTR, wszcomponentname : LibC::LPWSTR, wszcaption : LibC::LPWSTR, pbicon : UInt8*, cbicon : UInt32, brestoremetadata : UInt8, bnotifyonbackupcomplete : UInt8, bselectable : UInt8, bselectableforrestore : UInt8, dwcomponentflags : UInt32) : HRESULT
    @lpVtbl.value.add_component.call(this, ct, wszlogicalpath, wszcomponentname, wszcaption, pbicon, cbicon, brestoremetadata, bnotifyonbackupcomplete, bselectable, bselectableforrestore, dwcomponentflags)
  end
  def add_files_to_file_group(this : IVssCreateExpressWriterMetadata*, wszlogicalpath : LibC::LPWSTR, wszgroupname : LibC::LPWSTR, wszpath : LibC::LPWSTR, wszfilespec : LibC::LPWSTR, brecursive : UInt8, wszalternatelocation : LibC::LPWSTR, dwbackuptypemask : UInt32) : HRESULT
    @lpVtbl.value.add_files_to_file_group.call(this, wszlogicalpath, wszgroupname, wszpath, wszfilespec, brecursive, wszalternatelocation, dwbackuptypemask)
  end
  def set_restore_method(this : IVssCreateExpressWriterMetadata*, method : VSS_RESTOREMETHOD_ENUM, wszservice : LibC::LPWSTR, wszuserprocedure : LibC::LPWSTR, writerrestore : VSS_WRITERRESTORE_ENUM, brebootrequired : UInt8) : HRESULT
    @lpVtbl.value.set_restore_method.call(this, method, wszservice, wszuserprocedure, writerrestore, brebootrequired)
  end
  def add_component_dependency(this : IVssCreateExpressWriterMetadata*, wszforlogicalpath : LibC::LPWSTR, wszforcomponentname : LibC::LPWSTR, onwriterid : Guid, wszonlogicalpath : LibC::LPWSTR, wszoncomponentname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_component_dependency.call(this, wszforlogicalpath, wszforcomponentname, onwriterid, wszonlogicalpath, wszoncomponentname)
  end
  def set_backup_schema(this : IVssCreateExpressWriterMetadata*, dwschemamask : UInt32) : HRESULT
    @lpVtbl.value.set_backup_schema.call(this, dwschemamask)
  end
  def save_as_xml(this : IVssCreateExpressWriterMetadata*, pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.save_as_xml.call(this, pbstrxml)
  end
end
struct LibWin32::IVssExpressWriter
  def query_interface(this : IVssExpressWriter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssExpressWriter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssExpressWriter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_metadata(this : IVssExpressWriter*, writerid : Guid, writername : LibC::LPWSTR, usagetype : VSS_USAGE_TYPE, versionmajor : UInt32, versionminor : UInt32, reserved : UInt32, ppmetadata : IVssCreateExpressWriterMetadata*) : HRESULT
    @lpVtbl.value.create_metadata.call(this, writerid, writername, usagetype, versionmajor, versionminor, reserved, ppmetadata)
  end
  def load_metadata(this : IVssExpressWriter*, metadata : LibC::LPWSTR, reserved : UInt32) : HRESULT
    @lpVtbl.value.load_metadata.call(this, metadata, reserved)
  end
  def register(this : IVssExpressWriter*) : HRESULT
    @lpVtbl.value.register.call(this)
  end
  def unregister(this : IVssExpressWriter*, writerid : Guid) : HRESULT
    @lpVtbl.value.unregister.call(this, writerid)
  end
end
struct LibWin32::IVssSnapshotMgmt
  def query_interface(this : IVssSnapshotMgmt*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssSnapshotMgmt*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssSnapshotMgmt*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_provider_mgmt_interface(this : IVssSnapshotMgmt*, providerid : Guid, interfaceid : Guid*, ppitf : IUnknown*) : HRESULT
    @lpVtbl.value.get_provider_mgmt_interface.call(this, providerid, interfaceid, ppitf)
  end
  def query_volumes_supported_for_snapshots(this : IVssSnapshotMgmt*, providerid : Guid, lcontext : Int32, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_snapshots.call(this, providerid, lcontext, ppenum)
  end
  def query_snapshots_by_volume(this : IVssSnapshotMgmt*, pwszvolumename : UInt16*, providerid : Guid, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query_snapshots_by_volume.call(this, pwszvolumename, providerid, ppenum)
  end
end
struct LibWin32::IVssSnapshotMgmt2
  def query_interface(this : IVssSnapshotMgmt2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssSnapshotMgmt2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssSnapshotMgmt2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_min_diff_area_size(this : IVssSnapshotMgmt2*, pllmindiffareasize : Int64*) : HRESULT
    @lpVtbl.value.get_min_diff_area_size.call(this, pllmindiffareasize)
  end
end
struct LibWin32::IVssDifferentialSoftwareSnapshotMgmt
  def query_interface(this : IVssDifferentialSoftwareSnapshotMgmt*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssDifferentialSoftwareSnapshotMgmt*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssDifferentialSoftwareSnapshotMgmt*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_diff_area(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.add_diff_area.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def change_diff_area_maximum_size(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def query_volumes_supported_for_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszoriginalvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_diff_areas.call(this, pwszoriginalvolumename, ppenum)
  end
  def query_diff_areas_for_volume(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_volume.call(this, pwszvolumename, ppenum)
  end
  def query_diff_areas_on_volume(this : IVssDifferentialSoftwareSnapshotMgmt*, pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_on_volume.call(this, pwszvolumename, ppenum)
  end
  def query_diff_areas_for_snapshot(this : IVssDifferentialSoftwareSnapshotMgmt*, snapshotid : Guid, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_snapshot.call(this, snapshotid, ppenum)
  end
end
struct LibWin32::IVssDifferentialSoftwareSnapshotMgmt2
  def query_interface(this : IVssDifferentialSoftwareSnapshotMgmt2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssDifferentialSoftwareSnapshotMgmt2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssDifferentialSoftwareSnapshotMgmt2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_diff_area(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.add_diff_area.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def change_diff_area_maximum_size(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def query_volumes_supported_for_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszoriginalvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_diff_areas.call(this, pwszoriginalvolumename, ppenum)
  end
  def query_diff_areas_for_volume(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_volume.call(this, pwszvolumename, ppenum)
  end
  def query_diff_areas_on_volume(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_on_volume.call(this, pwszvolumename, ppenum)
  end
  def query_diff_areas_for_snapshot(this : IVssDifferentialSoftwareSnapshotMgmt2*, snapshotid : Guid, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_snapshot.call(this, snapshotid, ppenum)
  end
  def change_diff_area_maximum_size_ex(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64, bvolatile : LibC::BOOL) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size_ex.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace, bvolatile)
  end
  def migrate_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, pwsznewdiffareavolumename : UInt16*) : HRESULT
    @lpVtbl.value.migrate_diff_areas.call(this, pwszvolumename, pwszdiffareavolumename, pwsznewdiffareavolumename)
  end
  def query_migration_status(this : IVssDifferentialSoftwareSnapshotMgmt2*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.query_migration_status.call(this, pwszvolumename, pwszdiffareavolumename, ppasync)
  end
  def set_snapshot_priority(this : IVssDifferentialSoftwareSnapshotMgmt2*, idsnapshot : Guid, priority : UInt8) : HRESULT
    @lpVtbl.value.set_snapshot_priority.call(this, idsnapshot, priority)
  end
end
struct LibWin32::IVssDifferentialSoftwareSnapshotMgmt3
  def query_interface(this : IVssDifferentialSoftwareSnapshotMgmt3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssDifferentialSoftwareSnapshotMgmt3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssDifferentialSoftwareSnapshotMgmt3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_diff_area(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.add_diff_area.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def change_diff_area_maximum_size(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace)
  end
  def query_volumes_supported_for_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszoriginalvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_volumes_supported_for_diff_areas.call(this, pwszoriginalvolumename, ppenum)
  end
  def query_diff_areas_for_volume(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_volume.call(this, pwszvolumename, ppenum)
  end
  def query_diff_areas_on_volume(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_on_volume.call(this, pwszvolumename, ppenum)
  end
  def query_diff_areas_for_snapshot(this : IVssDifferentialSoftwareSnapshotMgmt3*, snapshotid : Guid, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.query_diff_areas_for_snapshot.call(this, snapshotid, ppenum)
  end
  def change_diff_area_maximum_size_ex(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, llmaximumdiffspace : Int64, bvolatile : LibC::BOOL) : HRESULT
    @lpVtbl.value.change_diff_area_maximum_size_ex.call(this, pwszvolumename, pwszdiffareavolumename, llmaximumdiffspace, bvolatile)
  end
  def migrate_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, pwsznewdiffareavolumename : UInt16*) : HRESULT
    @lpVtbl.value.migrate_diff_areas.call(this, pwszvolumename, pwszdiffareavolumename, pwsznewdiffareavolumename)
  end
  def query_migration_status(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, pwszdiffareavolumename : UInt16*, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.query_migration_status.call(this, pwszvolumename, pwszdiffareavolumename, ppasync)
  end
  def set_snapshot_priority(this : IVssDifferentialSoftwareSnapshotMgmt3*, idsnapshot : Guid, priority : UInt8) : HRESULT
    @lpVtbl.value.set_snapshot_priority.call(this, idsnapshot, priority)
  end
  def set_volume_protect_level(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, protectionlevel : VSS_PROTECTION_LEVEL) : HRESULT
    @lpVtbl.value.set_volume_protect_level.call(this, pwszvolumename, protectionlevel)
  end
  def get_volume_protect_level(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*, protectionlevel : VSS_VOLUME_PROTECTION_INFO*) : HRESULT
    @lpVtbl.value.get_volume_protect_level.call(this, pwszvolumename, protectionlevel)
  end
  def clear_volume_protect_fault(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszvolumename : UInt16*) : HRESULT
    @lpVtbl.value.clear_volume_protect_fault.call(this, pwszvolumename)
  end
  def delete_unused_diff_areas(this : IVssDifferentialSoftwareSnapshotMgmt3*, pwszdiffareavolumename : UInt16*) : HRESULT
    @lpVtbl.value.delete_unused_diff_areas.call(this, pwszdiffareavolumename)
  end
  def query_snapshot_delta_bitmap(this : IVssDifferentialSoftwareSnapshotMgmt3*, idsnapshotolder : Guid, idsnapshotyounger : Guid, pcblocksizeperbit : UInt32*, pcbitmaplength : UInt32*, ppbbitmap : UInt8**) : HRESULT
    @lpVtbl.value.query_snapshot_delta_bitmap.call(this, idsnapshotolder, idsnapshotyounger, pcblocksizeperbit, pcbitmaplength, ppbbitmap)
  end
end
struct LibWin32::IVssEnumMgmtObject
  def query_interface(this : IVssEnumMgmtObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssEnumMgmtObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssEnumMgmtObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IVssEnumMgmtObject*, celt : UInt32, rgelt : VSS_MGMT_OBJECT_PROP*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IVssEnumMgmtObject*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IVssEnumMgmtObject*, ppenum : IVssEnumMgmtObject*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IVssAdmin
  def query_interface(this : IVssAdmin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssAdmin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssAdmin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_provider(this : IVssAdmin*, pproviderid : Guid, classid : Guid, pwszprovidername : UInt16*, eprovidertype : VSS_PROVIDER_TYPE, pwszproviderversion : UInt16*, providerversionid : Guid) : HRESULT
    @lpVtbl.value.register_provider.call(this, pproviderid, classid, pwszprovidername, eprovidertype, pwszproviderversion, providerversionid)
  end
  def unregister_provider(this : IVssAdmin*, providerid : Guid) : HRESULT
    @lpVtbl.value.unregister_provider.call(this, providerid)
  end
  def query_providers(this : IVssAdmin*, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query_providers.call(this, ppenum)
  end
  def abort_all_snapshots_in_progress(this : IVssAdmin*) : HRESULT
    @lpVtbl.value.abort_all_snapshots_in_progress.call(this)
  end
end
struct LibWin32::IVssAdminEx
  def query_interface(this : IVssAdminEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssAdminEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssAdminEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_provider(this : IVssAdminEx*, pproviderid : Guid, classid : Guid, pwszprovidername : UInt16*, eprovidertype : VSS_PROVIDER_TYPE, pwszproviderversion : UInt16*, providerversionid : Guid) : HRESULT
    @lpVtbl.value.register_provider.call(this, pproviderid, classid, pwszprovidername, eprovidertype, pwszproviderversion, providerversionid)
  end
  def unregister_provider(this : IVssAdminEx*, providerid : Guid) : HRESULT
    @lpVtbl.value.unregister_provider.call(this, providerid)
  end
  def query_providers(this : IVssAdminEx*, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query_providers.call(this, ppenum)
  end
  def abort_all_snapshots_in_progress(this : IVssAdminEx*) : HRESULT
    @lpVtbl.value.abort_all_snapshots_in_progress.call(this)
  end
  def get_provider_capability(this : IVssAdminEx*, pproviderid : Guid, plloriginalcapabilitymask : UInt64*) : HRESULT
    @lpVtbl.value.get_provider_capability.call(this, pproviderid, plloriginalcapabilitymask)
  end
  def get_provider_context(this : IVssAdminEx*, providerid : Guid, plcontext : Int32*) : HRESULT
    @lpVtbl.value.get_provider_context.call(this, providerid, plcontext)
  end
  def set_provider_context(this : IVssAdminEx*, providerid : Guid, lcontext : Int32) : HRESULT
    @lpVtbl.value.set_provider_context.call(this, providerid, lcontext)
  end
end
struct LibWin32::IVssSoftwareSnapshotProvider
  def query_interface(this : IVssSoftwareSnapshotProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssSoftwareSnapshotProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssSoftwareSnapshotProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_context(this : IVssSoftwareSnapshotProvider*, lcontext : Int32) : HRESULT
    @lpVtbl.value.set_context.call(this, lcontext)
  end
  def get_snapshot_properties(this : IVssSoftwareSnapshotProvider*, snapshotid : Guid, pprop : VSS_SNAPSHOT_PROP*) : HRESULT
    @lpVtbl.value.get_snapshot_properties.call(this, snapshotid, pprop)
  end
  def query(this : IVssSoftwareSnapshotProvider*, queriedobjectid : Guid, equeriedobjecttype : VSS_OBJECT_TYPE, ereturnedobjectstype : VSS_OBJECT_TYPE, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query.call(this, queriedobjectid, equeriedobjecttype, ereturnedobjectstype, ppenum)
  end
  def delete_snapshots(this : IVssSoftwareSnapshotProvider*, sourceobjectid : Guid, esourceobjecttype : VSS_OBJECT_TYPE, bforcedelete : LibC::BOOL, pldeletedsnapshots : Int32*, pnondeletedsnapshotid : Guid*) : HRESULT
    @lpVtbl.value.delete_snapshots.call(this, sourceobjectid, esourceobjecttype, bforcedelete, pldeletedsnapshots, pnondeletedsnapshotid)
  end
  def begin_prepare_snapshot(this : IVssSoftwareSnapshotProvider*, snapshotsetid : Guid, snapshotid : Guid, pwszvolumename : UInt16*, lnewcontext : Int32) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.call(this, snapshotsetid, snapshotid, pwszvolumename, lnewcontext)
  end
  def is_volume_supported(this : IVssSoftwareSnapshotProvider*, pwszvolumename : UInt16*, pbsupportedbythisprovider : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_volume_supported.call(this, pwszvolumename, pbsupportedbythisprovider)
  end
  def is_volume_snapshotted(this : IVssSoftwareSnapshotProvider*, pwszvolumename : UInt16*, pbsnapshotspresent : LibC::BOOL*, plsnapshotcompatibility : Int32*) : HRESULT
    @lpVtbl.value.is_volume_snapshotted.call(this, pwszvolumename, pbsnapshotspresent, plsnapshotcompatibility)
  end
  def set_snapshot_property(this : IVssSoftwareSnapshotProvider*, snapshotid : Guid, esnapshotpropertyid : VSS_SNAPSHOT_PROPERTY_ID, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_snapshot_property.call(this, snapshotid, esnapshotpropertyid, vproperty)
  end
  def revert_to_snapshot(this : IVssSoftwareSnapshotProvider*, snapshotid : Guid) : HRESULT
    @lpVtbl.value.revert_to_snapshot.call(this, snapshotid)
  end
  def query_revert_status(this : IVssSoftwareSnapshotProvider*, pwszvolume : UInt16*, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.query_revert_status.call(this, pwszvolume, ppasync)
  end
end
struct LibWin32::IVssProviderCreateSnapshotSet
  def query_interface(this : IVssProviderCreateSnapshotSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssProviderCreateSnapshotSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssProviderCreateSnapshotSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def end_prepare_snapshots(this : IVssProviderCreateSnapshotSet*, snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.end_prepare_snapshots.call(this, snapshotsetid)
  end
  def pre_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.pre_commit_snapshots.call(this, snapshotsetid)
  end
  def commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.commit_snapshots.call(this, snapshotsetid)
  end
  def post_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshotsetid : Guid, lsnapshotscount : Int32) : HRESULT
    @lpVtbl.value.post_commit_snapshots.call(this, snapshotsetid, lsnapshotscount)
  end
  def pre_final_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.pre_final_commit_snapshots.call(this, snapshotsetid)
  end
  def post_final_commit_snapshots(this : IVssProviderCreateSnapshotSet*, snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.post_final_commit_snapshots.call(this, snapshotsetid)
  end
  def abort_snapshots(this : IVssProviderCreateSnapshotSet*, snapshotsetid : Guid) : HRESULT
    @lpVtbl.value.abort_snapshots.call(this, snapshotsetid)
  end
end
struct LibWin32::IVssProviderNotifications
  def query_interface(this : IVssProviderNotifications*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssProviderNotifications*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssProviderNotifications*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_load(this : IVssProviderNotifications*, pcallback : IUnknown) : HRESULT
    @lpVtbl.value.on_load.call(this, pcallback)
  end
  def on_unload(this : IVssProviderNotifications*, bforceunload : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_unload.call(this, bforceunload)
  end
end
struct LibWin32::IVssHardwareSnapshotProvider
  def query_interface(this : IVssHardwareSnapshotProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssHardwareSnapshotProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssHardwareSnapshotProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def are_luns_supported(this : IVssHardwareSnapshotProvider*, lluncount : Int32, lcontext : Int32, rgwszdevices : UInt16**, pluninformation : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.are_luns_supported.call(this, lluncount, lcontext, rgwszdevices, pluninformation, pbissupported)
  end
  def fill_in_lun_info(this : IVssHardwareSnapshotProvider*, wszdevicename : UInt16*, pluninfo : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.fill_in_lun_info.call(this, wszdevicename, pluninfo, pbissupported)
  end
  def begin_prepare_snapshot(this : IVssHardwareSnapshotProvider*, snapshotsetid : Guid, snapshotid : Guid, lcontext : Int32, lluncount : Int32, rgdevicenames : UInt16**, rgluninformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.call(this, snapshotsetid, snapshotid, lcontext, lluncount, rgdevicenames, rgluninformation)
  end
  def get_target_luns(this : IVssHardwareSnapshotProvider*, lluncount : Int32, rgdevicenames : UInt16**, rgsourceluns : VDS_LUN_INFORMATION*, rgdestinationluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.get_target_luns.call(this, lluncount, rgdevicenames, rgsourceluns, rgdestinationluns)
  end
  def locate_luns(this : IVssHardwareSnapshotProvider*, lluncount : Int32, rgsourceluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.locate_luns.call(this, lluncount, rgsourceluns)
  end
  def on_lun_empty(this : IVssHardwareSnapshotProvider*, wszdevicename : UInt16*, pinformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.on_lun_empty.call(this, wszdevicename, pinformation)
  end
end
struct LibWin32::IVssHardwareSnapshotProviderEx
  def query_interface(this : IVssHardwareSnapshotProviderEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssHardwareSnapshotProviderEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssHardwareSnapshotProviderEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def are_luns_supported(this : IVssHardwareSnapshotProviderEx*, lluncount : Int32, lcontext : Int32, rgwszdevices : UInt16**, pluninformation : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.are_luns_supported.call(this, lluncount, lcontext, rgwszdevices, pluninformation, pbissupported)
  end
  def fill_in_lun_info(this : IVssHardwareSnapshotProviderEx*, wszdevicename : UInt16*, pluninfo : VDS_LUN_INFORMATION*, pbissupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.fill_in_lun_info.call(this, wszdevicename, pluninfo, pbissupported)
  end
  def begin_prepare_snapshot(this : IVssHardwareSnapshotProviderEx*, snapshotsetid : Guid, snapshotid : Guid, lcontext : Int32, lluncount : Int32, rgdevicenames : UInt16**, rgluninformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.call(this, snapshotsetid, snapshotid, lcontext, lluncount, rgdevicenames, rgluninformation)
  end
  def get_target_luns(this : IVssHardwareSnapshotProviderEx*, lluncount : Int32, rgdevicenames : UInt16**, rgsourceluns : VDS_LUN_INFORMATION*, rgdestinationluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.get_target_luns.call(this, lluncount, rgdevicenames, rgsourceluns, rgdestinationluns)
  end
  def locate_luns(this : IVssHardwareSnapshotProviderEx*, lluncount : Int32, rgsourceluns : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.locate_luns.call(this, lluncount, rgsourceluns)
  end
  def on_lun_empty(this : IVssHardwareSnapshotProviderEx*, wszdevicename : UInt16*, pinformation : VDS_LUN_INFORMATION*) : HRESULT
    @lpVtbl.value.on_lun_empty.call(this, wszdevicename, pinformation)
  end
  def get_provider_capabilities(this : IVssHardwareSnapshotProviderEx*, plloriginalcapabilitymask : UInt64*) : HRESULT
    @lpVtbl.value.get_provider_capabilities.call(this, plloriginalcapabilitymask)
  end
  def on_lun_state_change(this : IVssHardwareSnapshotProviderEx*, psnapshotluns : VDS_LUN_INFORMATION*, poriginalluns : VDS_LUN_INFORMATION*, dwcount : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_lun_state_change.call(this, psnapshotluns, poriginalluns, dwcount, dwflags)
  end
  def resync_luns(this : IVssHardwareSnapshotProviderEx*, psourceluns : VDS_LUN_INFORMATION*, ptargetluns : VDS_LUN_INFORMATION*, dwcount : UInt32, ppasync : IVssAsync*) : HRESULT
    @lpVtbl.value.resync_luns.call(this, psourceluns, ptargetluns, dwcount, ppasync)
  end
  def on_reuse_luns(this : IVssHardwareSnapshotProviderEx*, psnapshotluns : VDS_LUN_INFORMATION*, poriginalluns : VDS_LUN_INFORMATION*, dwcount : UInt32) : HRESULT
    @lpVtbl.value.on_reuse_luns.call(this, psnapshotluns, poriginalluns, dwcount)
  end
end
struct LibWin32::IVssFileShareSnapshotProvider
  def query_interface(this : IVssFileShareSnapshotProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVssFileShareSnapshotProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVssFileShareSnapshotProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_context(this : IVssFileShareSnapshotProvider*, lcontext : Int32) : HRESULT
    @lpVtbl.value.set_context.call(this, lcontext)
  end
  def get_snapshot_properties(this : IVssFileShareSnapshotProvider*, snapshotid : Guid, pprop : VSS_SNAPSHOT_PROP*) : HRESULT
    @lpVtbl.value.get_snapshot_properties.call(this, snapshotid, pprop)
  end
  def query(this : IVssFileShareSnapshotProvider*, queriedobjectid : Guid, equeriedobjecttype : VSS_OBJECT_TYPE, ereturnedobjectstype : VSS_OBJECT_TYPE, ppenum : IVssEnumObject*) : HRESULT
    @lpVtbl.value.query.call(this, queriedobjectid, equeriedobjecttype, ereturnedobjectstype, ppenum)
  end
  def delete_snapshots(this : IVssFileShareSnapshotProvider*, sourceobjectid : Guid, esourceobjecttype : VSS_OBJECT_TYPE, bforcedelete : LibC::BOOL, pldeletedsnapshots : Int32*, pnondeletedsnapshotid : Guid*) : HRESULT
    @lpVtbl.value.delete_snapshots.call(this, sourceobjectid, esourceobjecttype, bforcedelete, pldeletedsnapshots, pnondeletedsnapshotid)
  end
  def begin_prepare_snapshot(this : IVssFileShareSnapshotProvider*, snapshotsetid : Guid, snapshotid : Guid, pwszsharepath : UInt16*, lnewcontext : Int32, providerid : Guid) : HRESULT
    @lpVtbl.value.begin_prepare_snapshot.call(this, snapshotsetid, snapshotid, pwszsharepath, lnewcontext, providerid)
  end
  def is_path_supported(this : IVssFileShareSnapshotProvider*, pwszsharepath : UInt16*, pbsupportedbythisprovider : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_path_supported.call(this, pwszsharepath, pbsupportedbythisprovider)
  end
  def is_path_snapshotted(this : IVssFileShareSnapshotProvider*, pwszsharepath : UInt16*, pbsnapshotspresent : LibC::BOOL*, plsnapshotcompatibility : Int32*) : HRESULT
    @lpVtbl.value.is_path_snapshotted.call(this, pwszsharepath, pbsnapshotspresent, plsnapshotcompatibility)
  end
  def set_snapshot_property(this : IVssFileShareSnapshotProvider*, snapshotid : Guid, esnapshotpropertyid : VSS_SNAPSHOT_PROPERTY_ID, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_snapshot_property.call(this, snapshotid, esnapshotpropertyid, vproperty)
  end
end
