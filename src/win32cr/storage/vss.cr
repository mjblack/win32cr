require "../system/com.cr"
require "../foundation.cr"
require "../data/xml/msxml.cr"
require "../storage/virtualdiskservice.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:vssapi.dll")]
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
  VssSnapshotMgmt = LibC::GUID.new(0xb5a2c52_u32, 0x3eb9_u16, 0x470a_u16, StaticArray[0x96_u8, 0xe2_u8, 0x6c_u8, 0x6d_u8, 0x45_u8, 0x70_u8, 0xe4_u8, 0xf_u8])
  VSSCoordinator = LibC::GUID.new(0xe579ab5f_u32, 0x1cc4_u16, 0x44b4_u16, StaticArray[0xbe_u8, 0xd9_u8, 0xde_u8, 0x9_u8, 0x91_u8, 0xff_u8, 0x6_u8, 0x23_u8])

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

  struct IVssAsync
    lpVtbl : IVssAsyncVTbl*
  end

  struct IVssWMFiledescVTbl
    query_interface : Proc(IVssWMFiledesc*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssWMFiledesc*, UInt32)
    release : Proc(IVssWMFiledesc*, UInt32)
    get_path : Proc(IVssWMFiledesc*, UInt8*, HRESULT)
    get_filespec : Proc(IVssWMFiledesc*, UInt8*, HRESULT)
    get_recursive : Proc(IVssWMFiledesc*, Bool*, HRESULT)
    get_alternate_location : Proc(IVssWMFiledesc*, UInt8*, HRESULT)
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
    get_logical_path : Proc(IVssWMDependency*, UInt8*, HRESULT)
    get_component_name : Proc(IVssWMDependency*, UInt8*, HRESULT)
  end

  struct IVssWMDependency
    lpVtbl : IVssWMDependencyVTbl*
  end

  struct IVssComponentVTbl
    query_interface : Proc(IVssComponent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssComponent*, UInt32)
    release : Proc(IVssComponent*, UInt32)
    get_logical_path : Proc(IVssComponent*, UInt8*, HRESULT)
    get_component_type : Proc(IVssComponent*, VSS_COMPONENT_TYPE*, HRESULT)
    get_component_name : Proc(IVssComponent*, UInt8*, HRESULT)
    get_backup_succeeded : Proc(IVssComponent*, Bool*, HRESULT)
    get_alternate_location_mapping_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_alternate_location_mapping : Proc(IVssComponent*, UInt32, IVssWMFiledesc*, HRESULT)
    set_backup_metadata : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_backup_metadata : Proc(IVssComponent*, UInt8*, HRESULT)
    add_partial_file : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_partial_file_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_partial_file : Proc(IVssComponent*, UInt32, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    is_selected_for_restore : Proc(IVssComponent*, Bool*, HRESULT)
    get_additional_restores : Proc(IVssComponent*, Bool*, HRESULT)
    get_new_target_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_new_target : Proc(IVssComponent*, UInt32, IVssWMFiledesc*, HRESULT)
    add_directed_target : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_directed_target_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_directed_target : Proc(IVssComponent*, UInt32, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_restore_metadata : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_restore_metadata : Proc(IVssComponent*, UInt8*, HRESULT)
    set_restore_target : Proc(IVssComponent*, VSS_RESTORE_TARGET, HRESULT)
    get_restore_target : Proc(IVssComponent*, VSS_RESTORE_TARGET*, HRESULT)
    set_pre_restore_failure_msg : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_pre_restore_failure_msg : Proc(IVssComponent*, UInt8*, HRESULT)
    set_post_restore_failure_msg : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_post_restore_failure_msg : Proc(IVssComponent*, UInt8*, HRESULT)
    set_backup_stamp : Proc(IVssComponent*, LibC::LPWSTR, HRESULT)
    get_backup_stamp : Proc(IVssComponent*, UInt8*, HRESULT)
    get_previous_backup_stamp : Proc(IVssComponent*, UInt8*, HRESULT)
    get_backup_options : Proc(IVssComponent*, UInt8*, HRESULT)
    get_restore_options : Proc(IVssComponent*, UInt8*, HRESULT)
    get_restore_subcomponent_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_restore_subcomponent : Proc(IVssComponent*, UInt32, UInt8*, UInt8*, Bool*, HRESULT)
    get_file_restore_status : Proc(IVssComponent*, VSS_FILE_RESTORE_STATUS*, HRESULT)
    add_differenced_files_by_last_modify_time : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponent*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8, HRESULT)
    get_differenced_files_count : Proc(IVssComponent*, UInt32*, HRESULT)
    get_differenced_file : Proc(IVssComponent*, UInt32, UInt8*, UInt8*, LibC::BOOL*, UInt8*, FILETIME*, HRESULT)
  end

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
    get_logical_path : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_component_type : Proc(IVssComponentEx*, VSS_COMPONENT_TYPE*, HRESULT)
    get_component_name : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_backup_succeeded : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_alternate_location_mapping_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_alternate_location_mapping : Proc(IVssComponentEx*, UInt32, IVssWMFiledesc*, HRESULT)
    set_backup_metadata : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_backup_metadata : Proc(IVssComponentEx*, UInt8*, HRESULT)
    add_partial_file : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_partial_file_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_partial_file : Proc(IVssComponentEx*, UInt32, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    is_selected_for_restore : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_additional_restores : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_new_target_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_new_target : Proc(IVssComponentEx*, UInt32, IVssWMFiledesc*, HRESULT)
    add_directed_target : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_directed_target_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_directed_target : Proc(IVssComponentEx*, UInt32, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_restore_metadata : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_restore_metadata : Proc(IVssComponentEx*, UInt8*, HRESULT)
    set_restore_target : Proc(IVssComponentEx*, VSS_RESTORE_TARGET, HRESULT)
    get_restore_target : Proc(IVssComponentEx*, VSS_RESTORE_TARGET*, HRESULT)
    set_pre_restore_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_pre_restore_failure_msg : Proc(IVssComponentEx*, UInt8*, HRESULT)
    set_post_restore_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_post_restore_failure_msg : Proc(IVssComponentEx*, UInt8*, HRESULT)
    set_backup_stamp : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_backup_stamp : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_previous_backup_stamp : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_backup_options : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_restore_options : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_restore_subcomponent_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_restore_subcomponent : Proc(IVssComponentEx*, UInt32, UInt8*, UInt8*, Bool*, HRESULT)
    get_file_restore_status : Proc(IVssComponentEx*, VSS_FILE_RESTORE_STATUS*, HRESULT)
    add_differenced_files_by_last_modify_time : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponentEx*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8, HRESULT)
    get_differenced_files_count : Proc(IVssComponentEx*, UInt32*, HRESULT)
    get_differenced_file : Proc(IVssComponentEx*, UInt32, UInt8*, UInt8*, LibC::BOOL*, UInt8*, FILETIME*, HRESULT)
    set_prepare_for_backup_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    set_post_snapshot_failure_msg : Proc(IVssComponentEx*, LibC::LPWSTR, HRESULT)
    get_prepare_for_backup_failure_msg : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_post_snapshot_failure_msg : Proc(IVssComponentEx*, UInt8*, HRESULT)
    get_authoritative_restore : Proc(IVssComponentEx*, Bool*, HRESULT)
    get_roll_forward : Proc(IVssComponentEx*, VSS_ROLLFORWARD_TYPE*, UInt8*, HRESULT)
    get_restore_name : Proc(IVssComponentEx*, UInt8*, HRESULT)
  end

  struct IVssComponentEx
    lpVtbl : IVssComponentExVTbl*
  end

  struct IVssComponentEx2VTbl
    query_interface : Proc(IVssComponentEx2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssComponentEx2*, UInt32)
    release : Proc(IVssComponentEx2*, UInt32)
    get_logical_path : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_component_type : Proc(IVssComponentEx2*, VSS_COMPONENT_TYPE*, HRESULT)
    get_component_name : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_backup_succeeded : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_alternate_location_mapping_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_alternate_location_mapping : Proc(IVssComponentEx2*, UInt32, IVssWMFiledesc*, HRESULT)
    set_backup_metadata : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_backup_metadata : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    add_partial_file : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_partial_file_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_partial_file : Proc(IVssComponentEx2*, UInt32, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    is_selected_for_restore : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_additional_restores : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_new_target_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_new_target : Proc(IVssComponentEx2*, UInt32, IVssWMFiledesc*, HRESULT)
    add_directed_target : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_directed_target_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_directed_target : Proc(IVssComponentEx2*, UInt32, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_restore_metadata : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_restore_metadata : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    set_restore_target : Proc(IVssComponentEx2*, VSS_RESTORE_TARGET, HRESULT)
    get_restore_target : Proc(IVssComponentEx2*, VSS_RESTORE_TARGET*, HRESULT)
    set_pre_restore_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_pre_restore_failure_msg : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    set_post_restore_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_post_restore_failure_msg : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    set_backup_stamp : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_backup_stamp : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_previous_backup_stamp : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_backup_options : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_restore_options : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_restore_subcomponent_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_restore_subcomponent : Proc(IVssComponentEx2*, UInt32, UInt8*, UInt8*, Bool*, HRESULT)
    get_file_restore_status : Proc(IVssComponentEx2*, VSS_FILE_RESTORE_STATUS*, HRESULT)
    add_differenced_files_by_last_modify_time : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, FILETIME, HRESULT)
    add_differenced_files_by_last_modify_lsn : Proc(IVssComponentEx2*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, UInt8, HRESULT)
    get_differenced_files_count : Proc(IVssComponentEx2*, UInt32*, HRESULT)
    get_differenced_file : Proc(IVssComponentEx2*, UInt32, UInt8*, UInt8*, LibC::BOOL*, UInt8*, FILETIME*, HRESULT)
    set_prepare_for_backup_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    set_post_snapshot_failure_msg : Proc(IVssComponentEx2*, LibC::LPWSTR, HRESULT)
    get_prepare_for_backup_failure_msg : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_post_snapshot_failure_msg : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    get_authoritative_restore : Proc(IVssComponentEx2*, Bool*, HRESULT)
    get_roll_forward : Proc(IVssComponentEx2*, VSS_ROLLFORWARD_TYPE*, UInt8*, HRESULT)
    get_restore_name : Proc(IVssComponentEx2*, UInt8*, HRESULT)
    set_failure : Proc(IVssComponentEx2*, HRESULT, HRESULT, LibC::LPWSTR, UInt32, HRESULT)
    get_failure : Proc(IVssComponentEx2*, HRESULT*, HRESULT*, UInt8*, UInt32*, HRESULT)
  end

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
    save_as_xml : Proc(IVssCreateWriterMetadata*, UInt8*, HRESULT)
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
    save_as_xml : Proc(IVssCreateExpressWriterMetadata*, UInt8*, HRESULT)
  end

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

  struct IVssSnapshotMgmt
    lpVtbl : IVssSnapshotMgmtVTbl*
  end

  struct IVssSnapshotMgmt2VTbl
    query_interface : Proc(IVssSnapshotMgmt2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVssSnapshotMgmt2*, UInt32)
    release : Proc(IVssSnapshotMgmt2*, UInt32)
    get_min_diff_area_size : Proc(IVssSnapshotMgmt2*, Int64*, HRESULT)
  end

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

  struct IVssFileShareSnapshotProvider
    lpVtbl : IVssFileShareSnapshotProviderVTbl*
  end


  # Params # ppwriter : IVssExpressWriter* [In]
  fun CreateVssExpressWriterInternal(ppwriter : IVssExpressWriter*) : HRESULT
end
