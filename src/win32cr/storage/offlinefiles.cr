require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:cscapi.dll")]
{% else %}
@[Link("cscapi")]
{% end %}
lib LibWin32
  OFFLINEFILES_SYNC_STATE_LOCAL_KNOWN = 1_u32
  OFFLINEFILES_SYNC_STATE_REMOTE_KNOWN = 2_u32
  OFFLINEFILES_CHANGES_NONE = 0_u32
  OFFLINEFILES_CHANGES_LOCAL_SIZE = 1_u32
  OFFLINEFILES_CHANGES_LOCAL_ATTRIBUTES = 2_u32
  OFFLINEFILES_CHANGES_LOCAL_TIME = 4_u32
  OFFLINEFILES_CHANGES_REMOTE_SIZE = 8_u32
  OFFLINEFILES_CHANGES_REMOTE_ATTRIBUTES = 16_u32
  OFFLINEFILES_CHANGES_REMOTE_TIME = 32_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED_DATA = 1_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED_ATTRIBUTES = 2_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED = 4_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_CREATED = 8_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_DELETED = 16_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_DIRTY = 32_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_SPARSE = 64_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_FILE = 128_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_DIRECTORY = 256_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_USER = 512_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_OTHERS = 1024_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_COMPUTER = 2048_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_PINNED = 4096_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_GHOST = 8192_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_SUSPENDED = 16384_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_OFFLINE = 32768_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_ONLINE = 65536_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_USER_WRITE = 131072_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_USER_READ = 262144_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_USER_ANYACCESS = 524288_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_WRITE = 1048576_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_READ = 2097152_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_ANYACCESS = 4194304_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_WRITE = 8388608_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_READ = 16777216_u32
  OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_ANYACCESS = 33554432_u32
  OFFLINEFILES_ITEM_QUERY_REMOTEINFO = 1_u32
  OFFLINEFILES_ITEM_QUERY_CONNECTIONSTATE = 2_u32
  OFFLINEFILES_ITEM_QUERY_LOCALDIRTYBYTECOUNT = 4_u32
  OFFLINEFILES_ITEM_QUERY_REMOTEDIRTYBYTECOUNT = 8_u32
  OFFLINEFILES_ITEM_QUERY_INCLUDETRANSPARENTCACHE = 16_u32
  OFFLINEFILES_ITEM_QUERY_ATTEMPT_TRANSITIONONLINE = 32_u32
  OFFLINEFILES_ITEM_QUERY_ADMIN = 2147483648_u32
  OFFLINEFILES_ENUM_FLAT = 1_u32
  OFFLINEFILES_ENUM_FLAT_FILESONLY = 2_u32
  OFFLINEFILES_SETTING_SCOPE_USER = 1_u32
  OFFLINEFILES_SETTING_SCOPE_COMPUTER = 2_u32
  OFFLINEFILES_PINLINKTARGETS_NEVER = 0_u32
  OFFLINEFILES_PINLINKTARGETS_EXPLICIT = 1_u32
  OFFLINEFILES_PINLINKTARGETS_ALWAYS = 2_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_FILLSPARSE = 1_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_SYNCIN = 2_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_SYNCOUT = 4_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_PINNEWFILES = 8_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_PINLINKTARGETS = 16_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORUSER = 32_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORUSER_POLICY = 64_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORALL = 128_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORREDIR = 256_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_LOWPRIORITY = 512_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_ASYNCPROGRESS = 1024_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_INTERACTIVE = 2048_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_CONSOLE = 4096_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_SKIPSUSPENDEDDIRS = 8192_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_BACKGROUND = 65536_u32
  OFFLINEFILES_SYNC_CONTROL_FLAG_NONEWFILESOUT = 131072_u32
  OFFLINEFILES_SYNC_CONTROL_CR_MASK = 4026531840_u32
  OFFLINEFILES_SYNC_CONTROL_CR_DEFAULT = 0_u32
  OFFLINEFILES_SYNC_CONTROL_CR_KEEPLOCAL = 268435456_u32
  OFFLINEFILES_SYNC_CONTROL_CR_KEEPREMOTE = 536870912_u32
  OFFLINEFILES_SYNC_CONTROL_CR_KEEPLATEST = 805306368_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER = 32_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER_POLICY = 64_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_FORALL = 128_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_FORREDIR = 256_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_FILL = 1_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_LOWPRIORITY = 512_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_ASYNCPROGRESS = 1024_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_INTERACTIVE = 2048_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_CONSOLE = 4096_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_PINLINKTARGETS = 16_u32
  OFFLINEFILES_PIN_CONTROL_FLAG_BACKGROUND = 65536_u32
  OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_LOWPRIORITY = 512_u32
  OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_ASYNCPROGRESS = 1024_u32
  OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_INTERACTIVE = 2048_u32
  OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_CONSOLE = 4096_u32
  OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_BACKGROUND = 65536_u32
  OFFLINEFILES_DELETE_FLAG_NOAUTOCACHED = 1_u32
  OFFLINEFILES_DELETE_FLAG_NOPINNED = 2_u32
  OFFLINEFILES_DELETE_FLAG_DELMODIFIED = 4_u32
  OFFLINEFILES_DELETE_FLAG_ADMIN = 2147483648_u32
  OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE = 1_u32
  OFFLINEFILES_TRANSITION_FLAG_CONSOLE = 2_u32
  OFFLINEFILES_SYNC_ITEM_CHANGE_NONE = 0_u32
  OFFLINEFILES_SYNC_ITEM_CHANGE_CHANGETIME = 1_u32
  OFFLINEFILES_SYNC_ITEM_CHANGE_WRITETIME = 2_u32
  OFFLINEFILES_SYNC_ITEM_CHANGE_FILESIZE = 4_u32
  OFFLINEFILES_SYNC_ITEM_CHANGE_ATTRIBUTES = 8_u32
  CLSID_OfflineFilesSetting = LibC::GUID.new(0xfd3659e9_u32, 0xa920_u16, 0x4123_u16, StaticArray[0xad_u8, 0x64_u8, 0x7f_u8, 0xc7_u8, 0x6c_u8, 0x7a_u8, 0xac_u8, 0xdf_u8])
  CLSID_OfflineFilesCache = LibC::GUID.new(0x48c6be7c_u32, 0x3871_u16, 0x43cc_u16, StaticArray[0xb4_u8, 0x6f_u8, 0x14_u8, 0x49_u8, 0xa1_u8, 0xbb_u8, 0x2f_u8, 0xf3_u8])


  enum OFFLINEFILES_ITEM_TYPE : Int32
    OFFLINEFILES_ITEM_TYPE_FILE = 0
    OFFLINEFILES_ITEM_TYPE_DIRECTORY = 1
    OFFLINEFILES_ITEM_TYPE_SHARE = 2
    OFFLINEFILES_ITEM_TYPE_SERVER = 3
  end

  enum OFFLINEFILES_ITEM_COPY : Int32
    OFFLINEFILES_ITEM_COPY_LOCAL = 0
    OFFLINEFILES_ITEM_COPY_REMOTE = 1
    OFFLINEFILES_ITEM_COPY_ORIGINAL = 2
  end

  enum OFFLINEFILES_CONNECT_STATE : Int32
    OFFLINEFILES_CONNECT_STATE_UNKNOWN = 0
    OFFLINEFILES_CONNECT_STATE_OFFLINE = 1
    OFFLINEFILES_CONNECT_STATE_ONLINE = 2
    OFFLINEFILES_CONNECT_STATE_TRANSPARENTLY_CACHED = 3
    OFFLINEFILES_CONNECT_STATE_PARTLY_TRANSPARENTLY_CACHED = 4
  end

  enum OFFLINEFILES_OFFLINE_REASON : Int32
    OFFLINEFILES_OFFLINE_REASON_UNKNOWN = 0
    OFFLINEFILES_OFFLINE_REASON_NOT_APPLICABLE = 1
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_FORCED = 2
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_SLOW = 3
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_ERROR = 4
    OFFLINEFILES_OFFLINE_REASON_ITEM_VERSION_CONFLICT = 5
    OFFLINEFILES_OFFLINE_REASON_ITEM_SUSPENDED = 6
  end

  enum OFFLINEFILES_CACHING_MODE : Int32
    OFFLINEFILES_CACHING_MODE_NONE = 0
    OFFLINEFILES_CACHING_MODE_NOCACHING = 1
    OFFLINEFILES_CACHING_MODE_MANUAL = 2
    OFFLINEFILES_CACHING_MODE_AUTO_DOC = 3
    OFFLINEFILES_CACHING_MODE_AUTO_PROGANDDOC = 4
  end

  enum OFFLINEFILES_OP_RESPONSE : Int32
    OFFLINEFILES_OP_CONTINUE = 0
    OFFLINEFILES_OP_RETRY = 1
    OFFLINEFILES_OP_ABORT = 2
  end

  enum OFFLINEFILES_EVENTS : Int32
    OFFLINEFILES_EVENT_CACHEMOVED = 0
    OFFLINEFILES_EVENT_CACHEISFULL = 1
    OFFLINEFILES_EVENT_CACHEISCORRUPTED = 2
    OFFLINEFILES_EVENT_ENABLED = 3
    OFFLINEFILES_EVENT_ENCRYPTIONCHANGED = 4
    OFFLINEFILES_EVENT_SYNCBEGIN = 5
    OFFLINEFILES_EVENT_SYNCFILERESULT = 6
    OFFLINEFILES_EVENT_SYNCCONFLICTRECADDED = 7
    OFFLINEFILES_EVENT_SYNCCONFLICTRECUPDATED = 8
    OFFLINEFILES_EVENT_SYNCCONFLICTRECREMOVED = 9
    OFFLINEFILES_EVENT_SYNCEND = 10
    OFFLINEFILES_EVENT_BACKGROUNDSYNCBEGIN = 11
    OFFLINEFILES_EVENT_BACKGROUNDSYNCEND = 12
    OFFLINEFILES_EVENT_NETTRANSPORTARRIVED = 13
    OFFLINEFILES_EVENT_NONETTRANSPORTS = 14
    OFFLINEFILES_EVENT_ITEMDISCONNECTED = 15
    OFFLINEFILES_EVENT_ITEMRECONNECTED = 16
    OFFLINEFILES_EVENT_ITEMAVAILABLEOFFLINE = 17
    OFFLINEFILES_EVENT_ITEMNOTAVAILABLEOFFLINE = 18
    OFFLINEFILES_EVENT_ITEMPINNED = 19
    OFFLINEFILES_EVENT_ITEMNOTPINNED = 20
    OFFLINEFILES_EVENT_ITEMMODIFIED = 21
    OFFLINEFILES_EVENT_ITEMADDEDTOCACHE = 22
    OFFLINEFILES_EVENT_ITEMDELETEDFROMCACHE = 23
    OFFLINEFILES_EVENT_ITEMRENAMED = 24
    OFFLINEFILES_EVENT_DATALOST = 25
    OFFLINEFILES_EVENT_PING = 26
    OFFLINEFILES_EVENT_ITEMRECONNECTBEGIN = 27
    OFFLINEFILES_EVENT_ITEMRECONNECTEND = 28
    OFFLINEFILES_EVENT_CACHEEVICTBEGIN = 29
    OFFLINEFILES_EVENT_CACHEEVICTEND = 30
    OFFLINEFILES_EVENT_POLICYCHANGEDETECTED = 31
    OFFLINEFILES_EVENT_PREFERENCECHANGEDETECTED = 32
    OFFLINEFILES_EVENT_SETTINGSCHANGESAPPLIED = 33
    OFFLINEFILES_EVENT_TRANSPARENTCACHEITEMNOTIFY = 34
    OFFLINEFILES_EVENT_PREFETCHFILEBEGIN = 35
    OFFLINEFILES_EVENT_PREFETCHFILEEND = 36
    OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEBEGIN = 37
    OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEEND = 38
    OFFLINEFILES_NUM_EVENTS = 39
  end

  enum OFFLINEFILES_PATHFILTER_MATCH : Int32
    OFFLINEFILES_PATHFILTER_SELF = 0
    OFFLINEFILES_PATHFILTER_CHILD = 1
    OFFLINEFILES_PATHFILTER_DESCENDENT = 2
    OFFLINEFILES_PATHFILTER_SELFORCHILD = 3
    OFFLINEFILES_PATHFILTER_SELFORDESCENDENT = 4
  end

  enum OFFLINEFILES_SYNC_CONFLICT_RESOLVE : Int32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NONE = 0
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLOCAL = 1
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPREMOTE = 2
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPALLCHANGES = 3
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLATEST = 4
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_LOG = 5
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_SKIP = 6
    OFFLINEFILES_SYNC_CONFLICT_ABORT = 7
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NUMCODES = 8
  end

  enum OFFLINEFILES_ITEM_TIME : Int32
    OFFLINEFILES_ITEM_TIME_CREATION = 0
    OFFLINEFILES_ITEM_TIME_LASTACCESS = 1
    OFFLINEFILES_ITEM_TIME_LASTWRITE = 2
  end

  enum OFFLINEFILES_COMPARE : Int32
    OFFLINEFILES_COMPARE_EQ = 0
    OFFLINEFILES_COMPARE_NEQ = 1
    OFFLINEFILES_COMPARE_LT = 2
    OFFLINEFILES_COMPARE_GT = 3
    OFFLINEFILES_COMPARE_LTE = 4
    OFFLINEFILES_COMPARE_GTE = 5
  end

  enum OFFLINEFILES_SETTING_VALUE_TYPE : Int32
    OFFLINEFILES_SETTING_VALUE_UI4 = 0
    OFFLINEFILES_SETTING_VALUE_BSTR = 1
    OFFLINEFILES_SETTING_VALUE_BSTR_DBLNULTERM = 2
    OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_UI4 = 3
    OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_BSTR = 4
  end

  enum OFFLINEFILES_SYNC_OPERATION : Int32
    OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_SERVER = 0
    OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_CLIENT = 1
    OFFLINEFILES_SYNC_OPERATION_SYNC_TO_SERVER = 2
    OFFLINEFILES_SYNC_OPERATION_SYNC_TO_CLIENT = 3
    OFFLINEFILES_SYNC_OPERATION_DELETE_SERVER_COPY = 4
    OFFLINEFILES_SYNC_OPERATION_DELETE_CLIENT_COPY = 5
    OFFLINEFILES_SYNC_OPERATION_PIN = 6
    OFFLINEFILES_SYNC_OPERATION_PREPARE = 7
  end

  enum OFFLINEFILES_SYNC_STATE : Int32
    OFFLINEFILES_SYNC_STATE_Stable = 0
    OFFLINEFILES_SYNC_STATE_FileOnClient_DirOnServer = 1
    OFFLINEFILES_SYNC_STATE_FileOnClient_NoServerCopy = 2
    OFFLINEFILES_SYNC_STATE_DirOnClient_FileOnServer = 3
    OFFLINEFILES_SYNC_STATE_DirOnClient_FileChangedOnServer = 4
    OFFLINEFILES_SYNC_STATE_DirOnClient_NoServerCopy = 5
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_NoServerCopy = 6
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileChangedOnServer = 7
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirChangedOnServer = 8
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileOnServer = 9
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirOnServer = 10
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DeletedOnServer = 11
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer = 12
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirOnServer = 13
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirChangedOnServer = 14
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DeletedOnServer = 15
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_ChangedOnServer = 16
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DeletedOnServer = 17
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirOnServer = 18
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirChangedOnServer = 19
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_NoServerCopy = 20
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirOnServer = 21
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileOnServer = 22
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileChangedOnServer = 23
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirChangedOnServer = 24
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DeletedOnServer = 25
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileOnServer = 26
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileChangedOnServer = 27
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_ChangedOnServer = 28
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_DeletedOnServer = 29
    OFFLINEFILES_SYNC_STATE_NoClientCopy_FileOnServer = 30
    OFFLINEFILES_SYNC_STATE_NoClientCopy_DirOnServer = 31
    OFFLINEFILES_SYNC_STATE_NoClientCopy_FileChangedOnServer = 32
    OFFLINEFILES_SYNC_STATE_NoClientCopy_DirChangedOnServer = 33
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileOnServer = 34
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirOnServer = 35
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileChangedOnServer = 36
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirChangedOnServer = 37
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient = 38
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient = 39
    OFFLINEFILES_SYNC_STATE_FileRenamedOnClient = 40
    OFFLINEFILES_SYNC_STATE_DirSparseOnClient = 41
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient = 42
    OFFLINEFILES_SYNC_STATE_DirRenamedOnClient = 43
    OFFLINEFILES_SYNC_STATE_FileChangedOnServer = 44
    OFFLINEFILES_SYNC_STATE_FileRenamedOnServer = 45
    OFFLINEFILES_SYNC_STATE_FileDeletedOnServer = 46
    OFFLINEFILES_SYNC_STATE_DirChangedOnServer = 47
    OFFLINEFILES_SYNC_STATE_DirRenamedOnServer = 48
    OFFLINEFILES_SYNC_STATE_DirDeletedOnServer = 49
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileOnServer = 50
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileChangedOnServer = 51
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirOnServer = 52
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirChangedOnServer = 53
    OFFLINEFILES_SYNC_STATE_NUMSTATES = 54
  end


  struct IOfflineFilesEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cache_moved : UInt64
    cache_is_full : UInt64
    cache_is_corrupted : UInt64
    enabled : UInt64
    encryption_changed : UInt64
    sync_begin : UInt64
    sync_file_result : UInt64
    sync_conflict_rec_added : UInt64
    sync_conflict_rec_updated : UInt64
    sync_conflict_rec_removed : UInt64
    sync_end : UInt64
    net_transport_arrived : UInt64
    no_net_transports : UInt64
    item_disconnected : UInt64
    item_reconnected : UInt64
    item_available_offline : UInt64
    item_not_available_offline : UInt64
    item_pinned : UInt64
    item_not_pinned : UInt64
    item_modified : UInt64
    item_added_to_cache : UInt64
    item_deleted_from_cache : UInt64
    item_renamed : UInt64
    data_lost : UInt64
    ping : UInt64
  end

  IOfflineFilesEvents_GUID = "e25585c1-0caa-4eb1-873b-1cae5b77c314"
  IID_IOfflineFilesEvents = LibC::GUID.new(0xe25585c1_u32, 0xcaa_u16, 0x4eb1_u16, StaticArray[0x87_u8, 0x3b_u8, 0x1c_u8, 0xae_u8, 0x5b_u8, 0x77_u8, 0xc3_u8, 0x14_u8])
  struct IOfflineFilesEvents
    lpVtbl : IOfflineFilesEventsVTbl*
  end

  struct IOfflineFilesEvents2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cache_moved : UInt64
    cache_is_full : UInt64
    cache_is_corrupted : UInt64
    enabled : UInt64
    encryption_changed : UInt64
    sync_begin : UInt64
    sync_file_result : UInt64
    sync_conflict_rec_added : UInt64
    sync_conflict_rec_updated : UInt64
    sync_conflict_rec_removed : UInt64
    sync_end : UInt64
    net_transport_arrived : UInt64
    no_net_transports : UInt64
    item_disconnected : UInt64
    item_reconnected : UInt64
    item_available_offline : UInt64
    item_not_available_offline : UInt64
    item_pinned : UInt64
    item_not_pinned : UInt64
    item_modified : UInt64
    item_added_to_cache : UInt64
    item_deleted_from_cache : UInt64
    item_renamed : UInt64
    data_lost : UInt64
    ping : UInt64
    item_reconnect_begin : UInt64
    item_reconnect_end : UInt64
    cache_evict_begin : UInt64
    cache_evict_end : UInt64
    background_sync_begin : UInt64
    background_sync_end : UInt64
    policy_change_detected : UInt64
    preference_change_detected : UInt64
    settings_changes_applied : UInt64
  end

  IOfflineFilesEvents2_GUID = "1ead8f56-ff76-4faa-a795-6f6ef792498b"
  IID_IOfflineFilesEvents2 = LibC::GUID.new(0x1ead8f56_u32, 0xff76_u16, 0x4faa_u16, StaticArray[0xa7_u8, 0x95_u8, 0x6f_u8, 0x6e_u8, 0xf7_u8, 0x92_u8, 0x49_u8, 0x8b_u8])
  struct IOfflineFilesEvents2
    lpVtbl : IOfflineFilesEvents2VTbl*
  end

  struct IOfflineFilesEvents3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cache_moved : UInt64
    cache_is_full : UInt64
    cache_is_corrupted : UInt64
    enabled : UInt64
    encryption_changed : UInt64
    sync_begin : UInt64
    sync_file_result : UInt64
    sync_conflict_rec_added : UInt64
    sync_conflict_rec_updated : UInt64
    sync_conflict_rec_removed : UInt64
    sync_end : UInt64
    net_transport_arrived : UInt64
    no_net_transports : UInt64
    item_disconnected : UInt64
    item_reconnected : UInt64
    item_available_offline : UInt64
    item_not_available_offline : UInt64
    item_pinned : UInt64
    item_not_pinned : UInt64
    item_modified : UInt64
    item_added_to_cache : UInt64
    item_deleted_from_cache : UInt64
    item_renamed : UInt64
    data_lost : UInt64
    ping : UInt64
    item_reconnect_begin : UInt64
    item_reconnect_end : UInt64
    cache_evict_begin : UInt64
    cache_evict_end : UInt64
    background_sync_begin : UInt64
    background_sync_end : UInt64
    policy_change_detected : UInt64
    preference_change_detected : UInt64
    settings_changes_applied : UInt64
    transparent_cache_item_notify : UInt64
    prefetch_file_begin : UInt64
    prefetch_file_end : UInt64
  end

  IOfflineFilesEvents3_GUID = "9ba04a45-ee69-42f0-9ab1-7db5c8805808"
  IID_IOfflineFilesEvents3 = LibC::GUID.new(0x9ba04a45_u32, 0xee69_u16, 0x42f0_u16, StaticArray[0x9a_u8, 0xb1_u8, 0x7d_u8, 0xb5_u8, 0xc8_u8, 0x80_u8, 0x58_u8, 0x8_u8])
  struct IOfflineFilesEvents3
    lpVtbl : IOfflineFilesEvents3VTbl*
  end

  struct IOfflineFilesEvents4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cache_moved : UInt64
    cache_is_full : UInt64
    cache_is_corrupted : UInt64
    enabled : UInt64
    encryption_changed : UInt64
    sync_begin : UInt64
    sync_file_result : UInt64
    sync_conflict_rec_added : UInt64
    sync_conflict_rec_updated : UInt64
    sync_conflict_rec_removed : UInt64
    sync_end : UInt64
    net_transport_arrived : UInt64
    no_net_transports : UInt64
    item_disconnected : UInt64
    item_reconnected : UInt64
    item_available_offline : UInt64
    item_not_available_offline : UInt64
    item_pinned : UInt64
    item_not_pinned : UInt64
    item_modified : UInt64
    item_added_to_cache : UInt64
    item_deleted_from_cache : UInt64
    item_renamed : UInt64
    data_lost : UInt64
    ping : UInt64
    item_reconnect_begin : UInt64
    item_reconnect_end : UInt64
    cache_evict_begin : UInt64
    cache_evict_end : UInt64
    background_sync_begin : UInt64
    background_sync_end : UInt64
    policy_change_detected : UInt64
    preference_change_detected : UInt64
    settings_changes_applied : UInt64
    transparent_cache_item_notify : UInt64
    prefetch_file_begin : UInt64
    prefetch_file_end : UInt64
    prefetch_close_handle_begin : UInt64
    prefetch_close_handle_end : UInt64
  end

  IOfflineFilesEvents4_GUID = "dbd69b1e-c7d2-473e-b35f-9d8c24c0c484"
  IID_IOfflineFilesEvents4 = LibC::GUID.new(0xdbd69b1e_u32, 0xc7d2_u16, 0x473e_u16, StaticArray[0xb3_u8, 0x5f_u8, 0x9d_u8, 0x8c_u8, 0x24_u8, 0xc0_u8, 0xc4_u8, 0x84_u8])
  struct IOfflineFilesEvents4
    lpVtbl : IOfflineFilesEvents4VTbl*
  end

  struct IOfflineFilesEventsFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_path_filter : UInt64
    get_included_events : UInt64
    get_excluded_events : UInt64
  end

  IOfflineFilesEventsFilter_GUID = "33fc4e1b-0716-40fa-ba65-6e62a84a846f"
  IID_IOfflineFilesEventsFilter = LibC::GUID.new(0x33fc4e1b_u32, 0x716_u16, 0x40fa_u16, StaticArray[0xba_u8, 0x65_u8, 0x6e_u8, 0x62_u8, 0xa8_u8, 0x4a_u8, 0x84_u8, 0x6f_u8])
  struct IOfflineFilesEventsFilter
    lpVtbl : IOfflineFilesEventsFilterVTbl*
  end

  struct IOfflineFilesErrorInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_raw_data : UInt64
    get_description : UInt64
  end

  IOfflineFilesErrorInfo_GUID = "7112fa5f-7571-435a-8eb7-195c7c1429bc"
  IID_IOfflineFilesErrorInfo = LibC::GUID.new(0x7112fa5f_u32, 0x7571_u16, 0x435a_u16, StaticArray[0x8e_u8, 0xb7_u8, 0x19_u8, 0x5c_u8, 0x7c_u8, 0x14_u8, 0x29_u8, 0xbc_u8])
  struct IOfflineFilesErrorInfo
    lpVtbl : IOfflineFilesErrorInfoVTbl*
  end

  struct IOfflineFilesSyncErrorItemInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_file_attributes : UInt64
    get_file_times : UInt64
    get_file_size : UInt64
  end

  IOfflineFilesSyncErrorItemInfo_GUID = "ecdbaf0d-6a18-4d55-8017-108f7660ba44"
  IID_IOfflineFilesSyncErrorItemInfo = LibC::GUID.new(0xecdbaf0d_u32, 0x6a18_u16, 0x4d55_u16, StaticArray[0x80_u8, 0x17_u8, 0x10_u8, 0x8f_u8, 0x76_u8, 0x60_u8, 0xba_u8, 0x44_u8])
  struct IOfflineFilesSyncErrorItemInfo
    lpVtbl : IOfflineFilesSyncErrorItemInfoVTbl*
  end

  struct IOfflineFilesSyncErrorInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_raw_data : UInt64
    get_description : UInt64
    get_sync_operation : UInt64
    get_item_change_flags : UInt64
    info_enumerated : UInt64
    info_available : UInt64
    get_local_info : UInt64
    get_remote_info : UInt64
    get_original_info : UInt64
  end

  IOfflineFilesSyncErrorInfo_GUID = "59f95e46-eb54-49d1-be76-de95458d01b0"
  IID_IOfflineFilesSyncErrorInfo = LibC::GUID.new(0x59f95e46_u32, 0xeb54_u16, 0x49d1_u16, StaticArray[0xbe_u8, 0x76_u8, 0xde_u8, 0x95_u8, 0x45_u8, 0x8d_u8, 0x1_u8, 0xb0_u8])
  struct IOfflineFilesSyncErrorInfo
    lpVtbl : IOfflineFilesSyncErrorInfoVTbl*
  end

  struct IOfflineFilesProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ : UInt64
    query_abort : UInt64
    end_ : UInt64
  end

  IOfflineFilesProgress_GUID = "fad63237-c55b-4911-9850-bcf96d4c979e"
  IID_IOfflineFilesProgress = LibC::GUID.new(0xfad63237_u32, 0xc55b_u16, 0x4911_u16, StaticArray[0x98_u8, 0x50_u8, 0xbc_u8, 0xf9_u8, 0x6d_u8, 0x4c_u8, 0x97_u8, 0x9e_u8])
  struct IOfflineFilesProgress
    lpVtbl : IOfflineFilesProgressVTbl*
  end

  struct IOfflineFilesSimpleProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ : UInt64
    query_abort : UInt64
    end_ : UInt64
    item_begin : UInt64
    item_result : UInt64
  end

  IOfflineFilesSimpleProgress_GUID = "c34f7f9b-c43d-4f9d-a776-c0eb6de5d401"
  IID_IOfflineFilesSimpleProgress = LibC::GUID.new(0xc34f7f9b_u32, 0xc43d_u16, 0x4f9d_u16, StaticArray[0xa7_u8, 0x76_u8, 0xc0_u8, 0xeb_u8, 0x6d_u8, 0xe5_u8, 0xd4_u8, 0x1_u8])
  struct IOfflineFilesSimpleProgress
    lpVtbl : IOfflineFilesSimpleProgressVTbl*
  end

  struct IOfflineFilesSyncProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ : UInt64
    query_abort : UInt64
    end_ : UInt64
    sync_item_begin : UInt64
    sync_item_result : UInt64
  end

  IOfflineFilesSyncProgress_GUID = "6931f49a-6fc7-4c1b-b265-56793fc451b7"
  IID_IOfflineFilesSyncProgress = LibC::GUID.new(0x6931f49a_u32, 0x6fc7_u16, 0x4c1b_u16, StaticArray[0xb2_u8, 0x65_u8, 0x56_u8, 0x79_u8, 0x3f_u8, 0xc4_u8, 0x51_u8, 0xb7_u8])
  struct IOfflineFilesSyncProgress
    lpVtbl : IOfflineFilesSyncProgressVTbl*
  end

  struct IOfflineFilesSyncConflictHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    resolve_conflict : UInt64
  end

  IOfflineFilesSyncConflictHandler_GUID = "b6dd5092-c65c-46b6-97b8-fadd08e7e1be"
  IID_IOfflineFilesSyncConflictHandler = LibC::GUID.new(0xb6dd5092_u32, 0xc65c_u16, 0x46b6_u16, StaticArray[0x97_u8, 0xb8_u8, 0xfa_u8, 0xdd_u8, 0x8_u8, 0xe7_u8, 0xe1_u8, 0xbe_u8])
  struct IOfflineFilesSyncConflictHandler
    lpVtbl : IOfflineFilesSyncConflictHandlerVTbl*
  end

  struct IOfflineFilesItemFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_filter_flags : UInt64
    get_time_filter : UInt64
    get_pattern_filter : UInt64
  end

  IOfflineFilesItemFilter_GUID = "f4b5a26c-dc05-4f20-ada4-551f1077be5c"
  IID_IOfflineFilesItemFilter = LibC::GUID.new(0xf4b5a26c_u32, 0xdc05_u16, 0x4f20_u16, StaticArray[0xad_u8, 0xa4_u8, 0x55_u8, 0x1f_u8, 0x10_u8, 0x77_u8, 0xbe_u8, 0x5c_u8])
  struct IOfflineFilesItemFilter
    lpVtbl : IOfflineFilesItemFilterVTbl*
  end

  struct IOfflineFilesItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_type : UInt64
    get_path : UInt64
    get_parent_item : UInt64
    refresh : UInt64
    is_marked_for_deletion : UInt64
  end

  IOfflineFilesItem_GUID = "4a753da6-e044-4f12-a718-5d14d079a906"
  IID_IOfflineFilesItem = LibC::GUID.new(0x4a753da6_u32, 0xe044_u16, 0x4f12_u16, StaticArray[0xa7_u8, 0x18_u8, 0x5d_u8, 0x14_u8, 0xd0_u8, 0x79_u8, 0xa9_u8, 0x6_u8])
  struct IOfflineFilesItem
    lpVtbl : IOfflineFilesItemVTbl*
  end

  struct IOfflineFilesServerItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_type : UInt64
    get_path : UInt64
    get_parent_item : UInt64
    refresh : UInt64
    is_marked_for_deletion : UInt64
  end

  IOfflineFilesServerItem_GUID = "9b1c9576-a92b-4151-8e9e-7c7b3ec2e016"
  IID_IOfflineFilesServerItem = LibC::GUID.new(0x9b1c9576_u32, 0xa92b_u16, 0x4151_u16, StaticArray[0x8e_u8, 0x9e_u8, 0x7c_u8, 0x7b_u8, 0x3e_u8, 0xc2_u8, 0xe0_u8, 0x16_u8])
  struct IOfflineFilesServerItem
    lpVtbl : IOfflineFilesServerItemVTbl*
  end

  struct IOfflineFilesShareItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_type : UInt64
    get_path : UInt64
    get_parent_item : UInt64
    refresh : UInt64
    is_marked_for_deletion : UInt64
  end

  IOfflineFilesShareItem_GUID = "bab7e48d-4804-41b5-a44d-0f199b06b145"
  IID_IOfflineFilesShareItem = LibC::GUID.new(0xbab7e48d_u32, 0x4804_u16, 0x41b5_u16, StaticArray[0xa4_u8, 0x4d_u8, 0xf_u8, 0x19_u8, 0x9b_u8, 0x6_u8, 0xb1_u8, 0x45_u8])
  struct IOfflineFilesShareItem
    lpVtbl : IOfflineFilesShareItemVTbl*
  end

  struct IOfflineFilesDirectoryItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_type : UInt64
    get_path : UInt64
    get_parent_item : UInt64
    refresh : UInt64
    is_marked_for_deletion : UInt64
  end

  IOfflineFilesDirectoryItem_GUID = "2273597a-a08c-4a00-a37a-c1ae4e9a1cfd"
  IID_IOfflineFilesDirectoryItem = LibC::GUID.new(0x2273597a_u32, 0xa08c_u16, 0x4a00_u16, StaticArray[0xa3_u8, 0x7a_u8, 0xc1_u8, 0xae_u8, 0x4e_u8, 0x9a_u8, 0x1c_u8, 0xfd_u8])
  struct IOfflineFilesDirectoryItem
    lpVtbl : IOfflineFilesDirectoryItemVTbl*
  end

  struct IOfflineFilesFileItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_type : UInt64
    get_path : UInt64
    get_parent_item : UInt64
    refresh : UInt64
    is_marked_for_deletion : UInt64
    is_sparse : UInt64
    is_encrypted : UInt64
  end

  IOfflineFilesFileItem_GUID = "8dfadead-26c2-4eff-8a72-6b50723d9a00"
  IID_IOfflineFilesFileItem = LibC::GUID.new(0x8dfadead_u32, 0x26c2_u16, 0x4eff_u16, StaticArray[0x8a_u8, 0x72_u8, 0x6b_u8, 0x50_u8, 0x72_u8, 0x3d_u8, 0x9a_u8, 0x0_u8])
  struct IOfflineFilesFileItem
    lpVtbl : IOfflineFilesFileItemVTbl*
  end

  struct IEnumOfflineFilesItemsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumOfflineFilesItems_GUID = "da70e815-c361-4407-bc0b-0d7046e5f2cd"
  IID_IEnumOfflineFilesItems = LibC::GUID.new(0xda70e815_u32, 0xc361_u16, 0x4407_u16, StaticArray[0xbc_u8, 0xb_u8, 0xd_u8, 0x70_u8, 0x46_u8, 0xe5_u8, 0xf2_u8, 0xcd_u8])
  struct IEnumOfflineFilesItems
    lpVtbl : IEnumOfflineFilesItemsVTbl*
  end

  struct IOfflineFilesItemContainerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_items : UInt64
    enum_items_ex : UInt64
  end

  IOfflineFilesItemContainer_GUID = "3836f049-9413-45dd-bf46-b5aaa82dc310"
  IID_IOfflineFilesItemContainer = LibC::GUID.new(0x3836f049_u32, 0x9413_u16, 0x45dd_u16, StaticArray[0xbf_u8, 0x46_u8, 0xb5_u8, 0xaa_u8, 0xa8_u8, 0x2d_u8, 0xc3_u8, 0x10_u8])
  struct IOfflineFilesItemContainer
    lpVtbl : IOfflineFilesItemContainerVTbl*
  end

  struct IOfflineFilesChangeInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_dirty : UInt64
    is_deleted_offline : UInt64
    is_created_offline : UInt64
    is_locally_modified_data : UInt64
    is_locally_modified_attributes : UInt64
    is_locally_modified_time : UInt64
  end

  IOfflineFilesChangeInfo_GUID = "a96e6fa4-e0d1-4c29-960b-ee508fe68c72"
  IID_IOfflineFilesChangeInfo = LibC::GUID.new(0xa96e6fa4_u32, 0xe0d1_u16, 0x4c29_u16, StaticArray[0x96_u8, 0xb_u8, 0xee_u8, 0x50_u8, 0x8f_u8, 0xe6_u8, 0x8c_u8, 0x72_u8])
  struct IOfflineFilesChangeInfo
    lpVtbl : IOfflineFilesChangeInfoVTbl*
  end

  struct IOfflineFilesDirtyInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    local_dirty_byte_count : UInt64
    remote_dirty_byte_count : UInt64
  end

  IOfflineFilesDirtyInfo_GUID = "0f50ce33-bac9-4eaa-a11d-da0e527d047d"
  IID_IOfflineFilesDirtyInfo = LibC::GUID.new(0xf50ce33_u32, 0xbac9_u16, 0x4eaa_u16, StaticArray[0xa1_u8, 0x1d_u8, 0xda_u8, 0xe_u8, 0x52_u8, 0x7d_u8, 0x4_u8, 0x7d_u8])
  struct IOfflineFilesDirtyInfo
    lpVtbl : IOfflineFilesDirtyInfoVTbl*
  end

  struct IOfflineFilesFileSysInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attributes : UInt64
    get_times : UInt64
    get_file_size : UInt64
  end

  IOfflineFilesFileSysInfo_GUID = "bc1a163f-7bfd-4d88-9c66-96ea9a6a3d6b"
  IID_IOfflineFilesFileSysInfo = LibC::GUID.new(0xbc1a163f_u32, 0x7bfd_u16, 0x4d88_u16, StaticArray[0x9c_u8, 0x66_u8, 0x96_u8, 0xea_u8, 0x9a_u8, 0x6a_u8, 0x3d_u8, 0x6b_u8])
  struct IOfflineFilesFileSysInfo
    lpVtbl : IOfflineFilesFileSysInfoVTbl*
  end

  struct IOfflineFilesPinInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_pinned : UInt64
    is_pinned_for_user : UInt64
    is_pinned_for_user_by_policy : UInt64
    is_pinned_for_computer : UInt64
    is_pinned_for_folder_redirection : UInt64
  end

  IOfflineFilesPinInfo_GUID = "5b2b0655-b3fd-497d-adeb-bd156bc8355b"
  IID_IOfflineFilesPinInfo = LibC::GUID.new(0x5b2b0655_u32, 0xb3fd_u16, 0x497d_u16, StaticArray[0xad_u8, 0xeb_u8, 0xbd_u8, 0x15_u8, 0x6b_u8, 0xc8_u8, 0x35_u8, 0x5b_u8])
  struct IOfflineFilesPinInfo
    lpVtbl : IOfflineFilesPinInfoVTbl*
  end

  struct IOfflineFilesPinInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_pinned : UInt64
    is_pinned_for_user : UInt64
    is_pinned_for_user_by_policy : UInt64
    is_pinned_for_computer : UInt64
    is_pinned_for_folder_redirection : UInt64
    is_partly_pinned : UInt64
  end

  IOfflineFilesPinInfo2_GUID = "623c58a2-42ed-4ad7-b69a-0f1b30a72d0d"
  IID_IOfflineFilesPinInfo2 = LibC::GUID.new(0x623c58a2_u32, 0x42ed_u16, 0x4ad7_u16, StaticArray[0xb6_u8, 0x9a_u8, 0xf_u8, 0x1b_u8, 0x30_u8, 0xa7_u8, 0x2d_u8, 0xd_u8])
  struct IOfflineFilesPinInfo2
    lpVtbl : IOfflineFilesPinInfo2VTbl*
  end

  struct IOfflineFilesTransparentCacheInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_transparently_cached : UInt64
  end

  IOfflineFilesTransparentCacheInfo_GUID = "bcaf4a01-5b68-4b56-a6a1-8d2786ede8e3"
  IID_IOfflineFilesTransparentCacheInfo = LibC::GUID.new(0xbcaf4a01_u32, 0x5b68_u16, 0x4b56_u16, StaticArray[0xa6_u8, 0xa1_u8, 0x8d_u8, 0x27_u8, 0x86_u8, 0xed_u8, 0xe8_u8, 0xe3_u8])
  struct IOfflineFilesTransparentCacheInfo
    lpVtbl : IOfflineFilesTransparentCacheInfoVTbl*
  end

  struct IOfflineFilesGhostInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_ghosted : UInt64
  end

  IOfflineFilesGhostInfo_GUID = "2b09d48c-8ab5-464f-a755-a59d92f99429"
  IID_IOfflineFilesGhostInfo = LibC::GUID.new(0x2b09d48c_u32, 0x8ab5_u16, 0x464f_u16, StaticArray[0xa7_u8, 0x55_u8, 0xa5_u8, 0x9d_u8, 0x92_u8, 0xf9_u8, 0x94_u8, 0x29_u8])
  struct IOfflineFilesGhostInfo
    lpVtbl : IOfflineFilesGhostInfoVTbl*
  end

  struct IOfflineFilesConnectionInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_connect_state : UInt64
    set_connect_state : UInt64
    transition_online : UInt64
    transition_offline : UInt64
  end

  IOfflineFilesConnectionInfo_GUID = "efb23a09-a867-4be8-83a6-86969a7d0856"
  IID_IOfflineFilesConnectionInfo = LibC::GUID.new(0xefb23a09_u32, 0xa867_u16, 0x4be8_u16, StaticArray[0x83_u8, 0xa6_u8, 0x86_u8, 0x96_u8, 0x9a_u8, 0x7d_u8, 0x8_u8, 0x56_u8])
  struct IOfflineFilesConnectionInfo
    lpVtbl : IOfflineFilesConnectionInfoVTbl*
  end

  struct IOfflineFilesShareInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_share_item : UInt64
    get_share_caching_mode : UInt64
    is_share_dfs_junction : UInt64
  end

  IOfflineFilesShareInfo_GUID = "7bcc43e7-31ce-4ca4-8ccd-1cff2dc494da"
  IID_IOfflineFilesShareInfo = LibC::GUID.new(0x7bcc43e7_u32, 0x31ce_u16, 0x4ca4_u16, StaticArray[0x8c_u8, 0xcd_u8, 0x1c_u8, 0xff_u8, 0x2d_u8, 0xc4_u8, 0x94_u8, 0xda_u8])
  struct IOfflineFilesShareInfo
    lpVtbl : IOfflineFilesShareInfoVTbl*
  end

  struct IOfflineFilesSuspendVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    suspend_root : UInt64
  end

  IOfflineFilesSuspend_GUID = "62c4560f-bc0b-48ca-ad9d-34cb528d99a9"
  IID_IOfflineFilesSuspend = LibC::GUID.new(0x62c4560f_u32, 0xbc0b_u16, 0x48ca_u16, StaticArray[0xad_u8, 0x9d_u8, 0x34_u8, 0xcb_u8, 0x52_u8, 0x8d_u8, 0x99_u8, 0xa9_u8])
  struct IOfflineFilesSuspend
    lpVtbl : IOfflineFilesSuspendVTbl*
  end

  struct IOfflineFilesSuspendInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_suspended : UInt64
  end

  IOfflineFilesSuspendInfo_GUID = "a457c25b-4e9c-4b04-85af-8932ccd97889"
  IID_IOfflineFilesSuspendInfo = LibC::GUID.new(0xa457c25b_u32, 0x4e9c_u16, 0x4b04_u16, StaticArray[0x85_u8, 0xaf_u8, 0x89_u8, 0x32_u8, 0xcc_u8, 0xd9_u8, 0x78_u8, 0x89_u8])
  struct IOfflineFilesSuspendInfo
    lpVtbl : IOfflineFilesSuspendInfoVTbl*
  end

  struct IOfflineFilesSettingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_value_type : UInt64
    get_preference : UInt64
    get_preference_scope : UInt64
    set_preference : UInt64
    delete_preference : UInt64
    get_policy : UInt64
    get_policy_scope : UInt64
    get_value : UInt64
  end

  IOfflineFilesSetting_GUID = "d871d3f7-f613-48a1-827e-7a34e560fff6"
  IID_IOfflineFilesSetting = LibC::GUID.new(0xd871d3f7_u32, 0xf613_u16, 0x48a1_u16, StaticArray[0x82_u8, 0x7e_u8, 0x7a_u8, 0x34_u8, 0xe5_u8, 0x60_u8, 0xff_u8, 0xf6_u8])
  struct IOfflineFilesSetting
    lpVtbl : IOfflineFilesSettingVTbl*
  end

  struct IEnumOfflineFilesSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumOfflineFilesSettings_GUID = "729680c4-1a38-47bc-9e5c-02c51562ac30"
  IID_IEnumOfflineFilesSettings = LibC::GUID.new(0x729680c4_u32, 0x1a38_u16, 0x47bc_u16, StaticArray[0x9e_u8, 0x5c_u8, 0x2_u8, 0xc5_u8, 0x15_u8, 0x62_u8, 0xac_u8, 0x30_u8])
  struct IEnumOfflineFilesSettings
    lpVtbl : IEnumOfflineFilesSettingsVTbl*
  end

  struct IOfflineFilesCacheVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    synchronize : UInt64
    delete_items : UInt64
    delete_items_for_user : UInt64
    pin : UInt64
    unpin : UInt64
    get_encryption_status : UInt64
    encrypt : UInt64
    find_item : UInt64
    find_item_ex : UInt64
    rename_item : UInt64
    get_location : UInt64
    get_disk_space_information : UInt64
    set_disk_space_limits : UInt64
    process_admin_pin_policy : UInt64
    get_setting_object : UInt64
    enum_setting_objects : UInt64
    is_path_cacheable : UInt64
  end

  IOfflineFilesCache_GUID = "855d6203-7914-48b9-8d40-4c56f5acffc5"
  IID_IOfflineFilesCache = LibC::GUID.new(0x855d6203_u32, 0x7914_u16, 0x48b9_u16, StaticArray[0x8d_u8, 0x40_u8, 0x4c_u8, 0x56_u8, 0xf5_u8, 0xac_u8, 0xff_u8, 0xc5_u8])
  struct IOfflineFilesCache
    lpVtbl : IOfflineFilesCacheVTbl*
  end

  struct IOfflineFilesCache2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    synchronize : UInt64
    delete_items : UInt64
    delete_items_for_user : UInt64
    pin : UInt64
    unpin : UInt64
    get_encryption_status : UInt64
    encrypt : UInt64
    find_item : UInt64
    find_item_ex : UInt64
    rename_item : UInt64
    get_location : UInt64
    get_disk_space_information : UInt64
    set_disk_space_limits : UInt64
    process_admin_pin_policy : UInt64
    get_setting_object : UInt64
    enum_setting_objects : UInt64
    is_path_cacheable : UInt64
    rename_item_ex : UInt64
  end

  IOfflineFilesCache2_GUID = "8c075039-1551-4ed9-8781-56705c04d3c0"
  IID_IOfflineFilesCache2 = LibC::GUID.new(0x8c075039_u32, 0x1551_u16, 0x4ed9_u16, StaticArray[0x87_u8, 0x81_u8, 0x56_u8, 0x70_u8, 0x5c_u8, 0x4_u8, 0xd3_u8, 0xc0_u8])
  struct IOfflineFilesCache2
    lpVtbl : IOfflineFilesCache2VTbl*
  end


  # Params # benable : LibC::BOOL [In],pbrebootrequired : LibC::BOOL* [In]
  fun OfflineFilesEnable(benable : LibC::BOOL, pbrebootrequired : LibC::BOOL*) : UInt32

  # Params # 
  fun OfflineFilesStart : UInt32

  # Params # pbactive : LibC::BOOL* [In],pbenabled : LibC::BOOL* [In]
  fun OfflineFilesQueryStatus(pbactive : LibC::BOOL*, pbenabled : LibC::BOOL*) : UInt32

  # Params # pbactive : LibC::BOOL* [In],pbenabled : LibC::BOOL* [In],pbavailable : LibC::BOOL* [In]
  fun OfflineFilesQueryStatusEx(pbactive : LibC::BOOL*, pbenabled : LibC::BOOL*, pbavailable : LibC::BOOL*) : UInt32
end
struct LibWin32::IOfflineFilesEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cache_moved(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszoldpath, psznewpath)
  end
  def cache_is_full : HRESULT
    @lpVtbl.value.cache_is_full.unsafe_as(Proc(HRESULT)).call
  end
  def cache_is_corrupted : HRESULT
    @lpVtbl.value.cache_is_corrupted.unsafe_as(Proc(HRESULT)).call
  end
  def enabled(benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(benabled)
  end
  def encryption_changed(bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)).call(bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.unsafe_as(Proc(Guid*, HRESULT)).call(rsyncid)
  end
  def sync_file_result(rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.unsafe_as(Proc(Guid*, LibC::LPWSTR, HRESULT, HRESULT)).call(rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.unsafe_as(Proc(Guid*, HRESULT, HRESULT)).call(rsyncid, hrresult)
  end
  def net_transport_arrived : HRESULT
    @lpVtbl.value.net_transport_arrived.unsafe_as(Proc(HRESULT)).call
  end
  def no_net_transports : HRESULT
    @lpVtbl.value.no_net_transports.unsafe_as(Proc(HRESULT)).call
  end
  def item_disconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_reconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_modified(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)).call(pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_deleted_from_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_renamed(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszoldpath, psznewpath, itemtype)
  end
  def data_lost : HRESULT
    @lpVtbl.value.data_lost.unsafe_as(Proc(HRESULT)).call
  end
  def ping : HRESULT
    @lpVtbl.value.ping.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IOfflineFilesEvents2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cache_moved(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszoldpath, psznewpath)
  end
  def cache_is_full : HRESULT
    @lpVtbl.value.cache_is_full.unsafe_as(Proc(HRESULT)).call
  end
  def cache_is_corrupted : HRESULT
    @lpVtbl.value.cache_is_corrupted.unsafe_as(Proc(HRESULT)).call
  end
  def enabled(benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(benabled)
  end
  def encryption_changed(bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)).call(bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.unsafe_as(Proc(Guid*, HRESULT)).call(rsyncid)
  end
  def sync_file_result(rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.unsafe_as(Proc(Guid*, LibC::LPWSTR, HRESULT, HRESULT)).call(rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.unsafe_as(Proc(Guid*, HRESULT, HRESULT)).call(rsyncid, hrresult)
  end
  def net_transport_arrived : HRESULT
    @lpVtbl.value.net_transport_arrived.unsafe_as(Proc(HRESULT)).call
  end
  def no_net_transports : HRESULT
    @lpVtbl.value.no_net_transports.unsafe_as(Proc(HRESULT)).call
  end
  def item_disconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_reconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_modified(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)).call(pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_deleted_from_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_renamed(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszoldpath, psznewpath, itemtype)
  end
  def data_lost : HRESULT
    @lpVtbl.value.data_lost.unsafe_as(Proc(HRESULT)).call
  end
  def ping : HRESULT
    @lpVtbl.value.ping.unsafe_as(Proc(HRESULT)).call
  end
  def item_reconnect_begin : HRESULT
    @lpVtbl.value.item_reconnect_begin.unsafe_as(Proc(HRESULT)).call
  end
  def item_reconnect_end : HRESULT
    @lpVtbl.value.item_reconnect_end.unsafe_as(Proc(HRESULT)).call
  end
  def cache_evict_begin : HRESULT
    @lpVtbl.value.cache_evict_begin.unsafe_as(Proc(HRESULT)).call
  end
  def cache_evict_end : HRESULT
    @lpVtbl.value.cache_evict_end.unsafe_as(Proc(HRESULT)).call
  end
  def background_sync_begin(dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_begin.unsafe_as(Proc(UInt32, HRESULT)).call(dwsynccontrolflags)
  end
  def background_sync_end(dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_end.unsafe_as(Proc(UInt32, HRESULT)).call(dwsynccontrolflags)
  end
  def policy_change_detected : HRESULT
    @lpVtbl.value.policy_change_detected.unsafe_as(Proc(HRESULT)).call
  end
  def preference_change_detected : HRESULT
    @lpVtbl.value.preference_change_detected.unsafe_as(Proc(HRESULT)).call
  end
  def settings_changes_applied : HRESULT
    @lpVtbl.value.settings_changes_applied.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IOfflineFilesEvents3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cache_moved(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszoldpath, psznewpath)
  end
  def cache_is_full : HRESULT
    @lpVtbl.value.cache_is_full.unsafe_as(Proc(HRESULT)).call
  end
  def cache_is_corrupted : HRESULT
    @lpVtbl.value.cache_is_corrupted.unsafe_as(Proc(HRESULT)).call
  end
  def enabled(benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(benabled)
  end
  def encryption_changed(bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)).call(bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.unsafe_as(Proc(Guid*, HRESULT)).call(rsyncid)
  end
  def sync_file_result(rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.unsafe_as(Proc(Guid*, LibC::LPWSTR, HRESULT, HRESULT)).call(rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.unsafe_as(Proc(Guid*, HRESULT, HRESULT)).call(rsyncid, hrresult)
  end
  def net_transport_arrived : HRESULT
    @lpVtbl.value.net_transport_arrived.unsafe_as(Proc(HRESULT)).call
  end
  def no_net_transports : HRESULT
    @lpVtbl.value.no_net_transports.unsafe_as(Proc(HRESULT)).call
  end
  def item_disconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_reconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_modified(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)).call(pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_deleted_from_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_renamed(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszoldpath, psznewpath, itemtype)
  end
  def data_lost : HRESULT
    @lpVtbl.value.data_lost.unsafe_as(Proc(HRESULT)).call
  end
  def ping : HRESULT
    @lpVtbl.value.ping.unsafe_as(Proc(HRESULT)).call
  end
  def item_reconnect_begin : HRESULT
    @lpVtbl.value.item_reconnect_begin.unsafe_as(Proc(HRESULT)).call
  end
  def item_reconnect_end : HRESULT
    @lpVtbl.value.item_reconnect_end.unsafe_as(Proc(HRESULT)).call
  end
  def cache_evict_begin : HRESULT
    @lpVtbl.value.cache_evict_begin.unsafe_as(Proc(HRESULT)).call
  end
  def cache_evict_end : HRESULT
    @lpVtbl.value.cache_evict_end.unsafe_as(Proc(HRESULT)).call
  end
  def background_sync_begin(dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_begin.unsafe_as(Proc(UInt32, HRESULT)).call(dwsynccontrolflags)
  end
  def background_sync_end(dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_end.unsafe_as(Proc(UInt32, HRESULT)).call(dwsynccontrolflags)
  end
  def policy_change_detected : HRESULT
    @lpVtbl.value.policy_change_detected.unsafe_as(Proc(HRESULT)).call
  end
  def preference_change_detected : HRESULT
    @lpVtbl.value.preference_change_detected.unsafe_as(Proc(HRESULT)).call
  end
  def settings_changes_applied : HRESULT
    @lpVtbl.value.settings_changes_applied.unsafe_as(Proc(HRESULT)).call
  end
  def transparent_cache_item_notify(pszpath : LibC::LPWSTR, eventtype : OFFLINEFILES_EVENTS, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL, pzsoldpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.transparent_cache_item_notify.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_EVENTS, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, LibC::LPWSTR, HRESULT)).call(pszpath, eventtype, itemtype, bmodifieddata, bmodifiedattributes, pzsoldpath)
  end
  def prefetch_file_begin(pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.prefetch_file_begin.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszpath)
  end
  def prefetch_file_end(pszpath : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.prefetch_file_end.unsafe_as(Proc(LibC::LPWSTR, HRESULT, HRESULT)).call(pszpath, hrresult)
  end
end
struct LibWin32::IOfflineFilesEvents4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cache_moved(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszoldpath, psznewpath)
  end
  def cache_is_full : HRESULT
    @lpVtbl.value.cache_is_full.unsafe_as(Proc(HRESULT)).call
  end
  def cache_is_corrupted : HRESULT
    @lpVtbl.value.cache_is_corrupted.unsafe_as(Proc(HRESULT)).call
  end
  def enabled(benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(benabled)
  end
  def encryption_changed(bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)).call(bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.unsafe_as(Proc(Guid*, HRESULT)).call(rsyncid)
  end
  def sync_file_result(rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.unsafe_as(Proc(Guid*, LibC::LPWSTR, HRESULT, HRESULT)).call(rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)).call(pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.unsafe_as(Proc(Guid*, HRESULT, HRESULT)).call(rsyncid, hrresult)
  end
  def net_transport_arrived : HRESULT
    @lpVtbl.value.net_transport_arrived.unsafe_as(Proc(HRESULT)).call
  end
  def no_net_transports : HRESULT
    @lpVtbl.value.no_net_transports.unsafe_as(Proc(HRESULT)).call
  end
  def item_disconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_reconnected(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_available_offline(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_not_pinned(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_modified(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)).call(pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_deleted_from_cache(pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszpath, itemtype)
  end
  def item_renamed(pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)).call(pszoldpath, psznewpath, itemtype)
  end
  def data_lost : HRESULT
    @lpVtbl.value.data_lost.unsafe_as(Proc(HRESULT)).call
  end
  def ping : HRESULT
    @lpVtbl.value.ping.unsafe_as(Proc(HRESULT)).call
  end
  def item_reconnect_begin : HRESULT
    @lpVtbl.value.item_reconnect_begin.unsafe_as(Proc(HRESULT)).call
  end
  def item_reconnect_end : HRESULT
    @lpVtbl.value.item_reconnect_end.unsafe_as(Proc(HRESULT)).call
  end
  def cache_evict_begin : HRESULT
    @lpVtbl.value.cache_evict_begin.unsafe_as(Proc(HRESULT)).call
  end
  def cache_evict_end : HRESULT
    @lpVtbl.value.cache_evict_end.unsafe_as(Proc(HRESULT)).call
  end
  def background_sync_begin(dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_begin.unsafe_as(Proc(UInt32, HRESULT)).call(dwsynccontrolflags)
  end
  def background_sync_end(dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_end.unsafe_as(Proc(UInt32, HRESULT)).call(dwsynccontrolflags)
  end
  def policy_change_detected : HRESULT
    @lpVtbl.value.policy_change_detected.unsafe_as(Proc(HRESULT)).call
  end
  def preference_change_detected : HRESULT
    @lpVtbl.value.preference_change_detected.unsafe_as(Proc(HRESULT)).call
  end
  def settings_changes_applied : HRESULT
    @lpVtbl.value.settings_changes_applied.unsafe_as(Proc(HRESULT)).call
  end
  def transparent_cache_item_notify(pszpath : LibC::LPWSTR, eventtype : OFFLINEFILES_EVENTS, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL, pzsoldpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.transparent_cache_item_notify.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_EVENTS, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, LibC::LPWSTR, HRESULT)).call(pszpath, eventtype, itemtype, bmodifieddata, bmodifiedattributes, pzsoldpath)
  end
  def prefetch_file_begin(pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.prefetch_file_begin.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszpath)
  end
  def prefetch_file_end(pszpath : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.prefetch_file_end.unsafe_as(Proc(LibC::LPWSTR, HRESULT, HRESULT)).call(pszpath, hrresult)
  end
  def prefetch_close_handle_begin : HRESULT
    @lpVtbl.value.prefetch_close_handle_begin.unsafe_as(Proc(HRESULT)).call
  end
  def prefetch_close_handle_end(dwclosedhandlecount : UInt32, dwopenhandlecount : UInt32, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.prefetch_close_handle_end.unsafe_as(Proc(UInt32, UInt32, HRESULT, HRESULT)).call(dwclosedhandlecount, dwopenhandlecount, hrresult)
  end
end
struct LibWin32::IOfflineFilesEventsFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_path_filter(ppszfilter : LibC::LPWSTR*, pmatch : OFFLINEFILES_PATHFILTER_MATCH*) : HRESULT
    @lpVtbl.value.get_path_filter.unsafe_as(Proc(LibC::LPWSTR*, OFFLINEFILES_PATHFILTER_MATCH*, HRESULT)).call(ppszfilter, pmatch)
  end
  def get_included_events(celements : UInt32, prgevents : OFFLINEFILES_EVENTS*, pcevents : UInt32*) : HRESULT
    @lpVtbl.value.get_included_events.unsafe_as(Proc(UInt32, OFFLINEFILES_EVENTS*, UInt32*, HRESULT)).call(celements, prgevents, pcevents)
  end
  def get_excluded_events(celements : UInt32, prgevents : OFFLINEFILES_EVENTS*, pcevents : UInt32*) : HRESULT
    @lpVtbl.value.get_excluded_events.unsafe_as(Proc(UInt32, OFFLINEFILES_EVENTS*, UInt32*, HRESULT)).call(celements, prgevents, pcevents)
  end
end
struct LibWin32::IOfflineFilesErrorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_raw_data(ppblob : BYTE_BLOB**) : HRESULT
    @lpVtbl.value.get_raw_data.unsafe_as(Proc(BYTE_BLOB**, HRESULT)).call(ppblob)
  end
  def get_description(ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszdescription)
  end
end
struct LibWin32::IOfflineFilesSyncErrorItemInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_file_attributes(pdwattributes : UInt32*) : HRESULT
    @lpVtbl.value.get_file_attributes.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwattributes)
  end
  def get_file_times(pftlastwrite : FILETIME*, pftchange : FILETIME*) : HRESULT
    @lpVtbl.value.get_file_times.unsafe_as(Proc(FILETIME*, FILETIME*, HRESULT)).call(pftlastwrite, pftchange)
  end
  def get_file_size(psize : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(LARGE_INTEGER*, HRESULT)).call(psize)
  end
end
struct LibWin32::IOfflineFilesSyncErrorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_raw_data(ppblob : BYTE_BLOB**) : HRESULT
    @lpVtbl.value.get_raw_data.unsafe_as(Proc(BYTE_BLOB**, HRESULT)).call(ppblob)
  end
  def get_description(ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszdescription)
  end
  def get_sync_operation(psyncop : OFFLINEFILES_SYNC_OPERATION*) : HRESULT
    @lpVtbl.value.get_sync_operation.unsafe_as(Proc(OFFLINEFILES_SYNC_OPERATION*, HRESULT)).call(psyncop)
  end
  def get_item_change_flags(pdwitemchangeflags : UInt32*) : HRESULT
    @lpVtbl.value.get_item_change_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwitemchangeflags)
  end
  def info_enumerated(pblocalenumerated : LibC::BOOL*, pbremoteenumerated : LibC::BOOL*, pboriginalenumerated : LibC::BOOL*) : HRESULT
    @lpVtbl.value.info_enumerated.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pblocalenumerated, pbremoteenumerated, pboriginalenumerated)
  end
  def info_available(pblocalinfo : LibC::BOOL*, pbremoteinfo : LibC::BOOL*, pboriginalinfo : LibC::BOOL*) : HRESULT
    @lpVtbl.value.info_available.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pblocalinfo, pbremoteinfo, pboriginalinfo)
  end
  def get_local_info(ppinfo : IOfflineFilesSyncErrorItemInfo*) : HRESULT
    @lpVtbl.value.get_local_info.unsafe_as(Proc(IOfflineFilesSyncErrorItemInfo*, HRESULT)).call(ppinfo)
  end
  def get_remote_info(ppinfo : IOfflineFilesSyncErrorItemInfo*) : HRESULT
    @lpVtbl.value.get_remote_info.unsafe_as(Proc(IOfflineFilesSyncErrorItemInfo*, HRESULT)).call(ppinfo)
  end
  def get_original_info(ppinfo : IOfflineFilesSyncErrorItemInfo*) : HRESULT
    @lpVtbl.value.get_original_info.unsafe_as(Proc(IOfflineFilesSyncErrorItemInfo*, HRESULT)).call(ppinfo)
  end
end
struct LibWin32::IOfflineFilesProgress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_(pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.begin_.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbabort)
  end
  def query_abort(pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_abort.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbabort)
  end
  def end_(hrresult : HRESULT) : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT, HRESULT)).call(hrresult)
  end
end
struct LibWin32::IOfflineFilesSimpleProgress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_(pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.begin_.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbabort)
  end
  def query_abort(pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_abort.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbabort)
  end
  def end_(hrresult : HRESULT) : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT, HRESULT)).call(hrresult)
  end
  def item_begin(pszfile : LibC::LPWSTR, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.item_begin.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_OP_RESPONSE*, HRESULT)).call(pszfile, presponse)
  end
  def item_result(pszfile : LibC::LPWSTR, hrresult : HRESULT, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.item_result.unsafe_as(Proc(LibC::LPWSTR, HRESULT, OFFLINEFILES_OP_RESPONSE*, HRESULT)).call(pszfile, hrresult, presponse)
  end
end
struct LibWin32::IOfflineFilesSyncProgress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_(pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.begin_.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbabort)
  end
  def query_abort(pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_abort.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbabort)
  end
  def end_(hrresult : HRESULT) : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT, HRESULT)).call(hrresult)
  end
  def sync_item_begin(pszfile : LibC::LPWSTR, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.sync_item_begin.unsafe_as(Proc(LibC::LPWSTR, OFFLINEFILES_OP_RESPONSE*, HRESULT)).call(pszfile, presponse)
  end
  def sync_item_result(pszfile : LibC::LPWSTR, hrresult : HRESULT, perrorinfo : IOfflineFilesSyncErrorInfo, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.sync_item_result.unsafe_as(Proc(LibC::LPWSTR, HRESULT, IOfflineFilesSyncErrorInfo, OFFLINEFILES_OP_RESPONSE*, HRESULT)).call(pszfile, hrresult, perrorinfo, presponse)
  end
end
struct LibWin32::IOfflineFilesSyncConflictHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def resolve_conflict(pszpath : LibC::LPWSTR, fstateknown : UInt32, state : OFFLINEFILES_SYNC_STATE, fchangedetails : UInt32, pconflictresolution : OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, ppsznewname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.resolve_conflict.unsafe_as(Proc(LibC::LPWSTR, UInt32, OFFLINEFILES_SYNC_STATE, UInt32, OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, LibC::LPWSTR*, HRESULT)).call(pszpath, fstateknown, state, fchangedetails, pconflictresolution, ppsznewname)
  end
end
struct LibWin32::IOfflineFilesItemFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_filter_flags(pullflags : UInt64*, pullmask : UInt64*) : HRESULT
    @lpVtbl.value.get_filter_flags.unsafe_as(Proc(UInt64*, UInt64*, HRESULT)).call(pullflags, pullmask)
  end
  def get_time_filter(pfttime : FILETIME*, pbevaltimeofday : LibC::BOOL*, ptimetype : OFFLINEFILES_ITEM_TIME*, pcompare : OFFLINEFILES_COMPARE*) : HRESULT
    @lpVtbl.value.get_time_filter.unsafe_as(Proc(FILETIME*, LibC::BOOL*, OFFLINEFILES_ITEM_TIME*, OFFLINEFILES_COMPARE*, HRESULT)).call(pfttime, pbevaltimeofday, ptimetype, pcompare)
  end
  def get_pattern_filter(pszpattern : Char*, cchpattern : UInt32) : HRESULT
    @lpVtbl.value.get_pattern_filter.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pszpattern, cchpattern)
  end
end
struct LibWin32::IOfflineFilesItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_type(pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.unsafe_as(Proc(OFFLINEFILES_ITEM_TYPE*, HRESULT)).call(pitemtype)
  end
  def get_path(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def get_parent_item(ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.unsafe_as(Proc(IOfflineFilesItem*, HRESULT)).call(ppitem)
  end
  def refresh(dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(UInt32, HRESULT)).call(dwqueryflags)
  end
  def is_marked_for_deletion(pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesServerItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_type(pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.unsafe_as(Proc(OFFLINEFILES_ITEM_TYPE*, HRESULT)).call(pitemtype)
  end
  def get_path(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def get_parent_item(ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.unsafe_as(Proc(IOfflineFilesItem*, HRESULT)).call(ppitem)
  end
  def refresh(dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(UInt32, HRESULT)).call(dwqueryflags)
  end
  def is_marked_for_deletion(pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesShareItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_type(pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.unsafe_as(Proc(OFFLINEFILES_ITEM_TYPE*, HRESULT)).call(pitemtype)
  end
  def get_path(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def get_parent_item(ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.unsafe_as(Proc(IOfflineFilesItem*, HRESULT)).call(ppitem)
  end
  def refresh(dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(UInt32, HRESULT)).call(dwqueryflags)
  end
  def is_marked_for_deletion(pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesDirectoryItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_type(pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.unsafe_as(Proc(OFFLINEFILES_ITEM_TYPE*, HRESULT)).call(pitemtype)
  end
  def get_path(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def get_parent_item(ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.unsafe_as(Proc(IOfflineFilesItem*, HRESULT)).call(ppitem)
  end
  def refresh(dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(UInt32, HRESULT)).call(dwqueryflags)
  end
  def is_marked_for_deletion(pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesFileItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_type(pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.unsafe_as(Proc(OFFLINEFILES_ITEM_TYPE*, HRESULT)).call(pitemtype)
  end
  def get_path(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def get_parent_item(ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.unsafe_as(Proc(IOfflineFilesItem*, HRESULT)).call(ppitem)
  end
  def refresh(dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(UInt32, HRESULT)).call(dwqueryflags)
  end
  def is_marked_for_deletion(pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmarkedfordeletion)
  end
  def is_sparse(pbissparse : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_sparse.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbissparse)
  end
  def is_encrypted(pbisencrypted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_encrypted.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbisencrypted)
  end
end
struct LibWin32::IEnumOfflineFilesItems
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IOfflineFilesItem*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IOfflineFilesItem*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumOfflineFilesItems*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumOfflineFilesItems*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IOfflineFilesItemContainer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_items(dwqueryflags : UInt32, ppenum : IEnumOfflineFilesItems*) : HRESULT
    @lpVtbl.value.enum_items.unsafe_as(Proc(UInt32, IEnumOfflineFilesItems*, HRESULT)).call(dwqueryflags, ppenum)
  end
  def enum_items_ex(pincludefilefilter : IOfflineFilesItemFilter, pincludedirfilter : IOfflineFilesItemFilter, pexcludefilefilter : IOfflineFilesItemFilter, pexcludedirfilter : IOfflineFilesItemFilter, dwenumflags : UInt32, dwqueryflags : UInt32, ppenum : IEnumOfflineFilesItems*) : HRESULT
    @lpVtbl.value.enum_items_ex.unsafe_as(Proc(IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, UInt32, UInt32, IEnumOfflineFilesItems*, HRESULT)).call(pincludefilefilter, pincludedirfilter, pexcludefilefilter, pexcludedirfilter, dwenumflags, dwqueryflags, ppenum)
  end
end
struct LibWin32::IOfflineFilesChangeInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_dirty(pbdirty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbdirty)
  end
  def is_deleted_offline(pbdeletedoffline : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_deleted_offline.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbdeletedoffline)
  end
  def is_created_offline(pbcreatedoffline : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_created_offline.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbcreatedoffline)
  end
  def is_locally_modified_data(pblocallymodifieddata : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_locally_modified_data.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pblocallymodifieddata)
  end
  def is_locally_modified_attributes(pblocallymodifiedattributes : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_locally_modified_attributes.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pblocallymodifiedattributes)
  end
  def is_locally_modified_time(pblocallymodifiedtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_locally_modified_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pblocallymodifiedtime)
  end
end
struct LibWin32::IOfflineFilesDirtyInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def local_dirty_byte_count(pdirtybytecount : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.local_dirty_byte_count.unsafe_as(Proc(LARGE_INTEGER*, HRESULT)).call(pdirtybytecount)
  end
  def remote_dirty_byte_count(pdirtybytecount : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.remote_dirty_byte_count.unsafe_as(Proc(LARGE_INTEGER*, HRESULT)).call(pdirtybytecount)
  end
end
struct LibWin32::IOfflineFilesFileSysInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attributes(copy : OFFLINEFILES_ITEM_COPY, pdwattributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(OFFLINEFILES_ITEM_COPY, UInt32*, HRESULT)).call(copy, pdwattributes)
  end
  def get_times(copy : OFFLINEFILES_ITEM_COPY, pftcreationtime : FILETIME*, pftlastwritetime : FILETIME*, pftchangetime : FILETIME*, pftlastaccesstime : FILETIME*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(OFFLINEFILES_ITEM_COPY, FILETIME*, FILETIME*, FILETIME*, FILETIME*, HRESULT)).call(copy, pftcreationtime, pftlastwritetime, pftchangetime, pftlastaccesstime)
  end
  def get_file_size(copy : OFFLINEFILES_ITEM_COPY, psize : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(OFFLINEFILES_ITEM_COPY, LARGE_INTEGER*, HRESULT)).call(copy, psize)
  end
end
struct LibWin32::IOfflineFilesPinInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_pinned(pbpinned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbpinned)
  end
  def is_pinned_for_user(pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_user_by_policy(pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user_by_policy.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_computer(pbpinnedforcomputer : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_computer.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforcomputer, pbinherit)
  end
  def is_pinned_for_folder_redirection(pbpinnedforfolderredirection : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_folder_redirection.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforfolderredirection, pbinherit)
  end
end
struct LibWin32::IOfflineFilesPinInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_pinned(pbpinned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbpinned)
  end
  def is_pinned_for_user(pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_user_by_policy(pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user_by_policy.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_computer(pbpinnedforcomputer : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_computer.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforcomputer, pbinherit)
  end
  def is_pinned_for_folder_redirection(pbpinnedforfolderredirection : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_folder_redirection.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbpinnedforfolderredirection, pbinherit)
  end
  def is_partly_pinned(pbpartlypinned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_partly_pinned.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbpartlypinned)
  end
end
struct LibWin32::IOfflineFilesTransparentCacheInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_transparently_cached(pbtransparentlycached : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_transparently_cached.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbtransparentlycached)
  end
end
struct LibWin32::IOfflineFilesGhostInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_ghosted(pbghosted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_ghosted.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbghosted)
  end
end
struct LibWin32::IOfflineFilesConnectionInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_connect_state(pconnectstate : OFFLINEFILES_CONNECT_STATE*, pofflinereason : OFFLINEFILES_OFFLINE_REASON*) : HRESULT
    @lpVtbl.value.get_connect_state.unsafe_as(Proc(OFFLINEFILES_CONNECT_STATE*, OFFLINEFILES_OFFLINE_REASON*, HRESULT)).call(pconnectstate, pofflinereason)
  end
  def set_connect_state(hwndparent : LibC::HANDLE, dwflags : UInt32, connectstate : OFFLINEFILES_CONNECT_STATE) : HRESULT
    @lpVtbl.value.set_connect_state.unsafe_as(Proc(LibC::HANDLE, UInt32, OFFLINEFILES_CONNECT_STATE, HRESULT)).call(hwndparent, dwflags, connectstate)
  end
  def transition_online(hwndparent : LibC::HANDLE, dwflags : UInt32) : HRESULT
    @lpVtbl.value.transition_online.unsafe_as(Proc(LibC::HANDLE, UInt32, HRESULT)).call(hwndparent, dwflags)
  end
  def transition_offline(hwndparent : LibC::HANDLE, dwflags : UInt32, bforceopenfilesclosed : LibC::BOOL, pbopenfilespreventedtransition : LibC::BOOL*) : HRESULT
    @lpVtbl.value.transition_offline.unsafe_as(Proc(LibC::HANDLE, UInt32, LibC::BOOL, LibC::BOOL*, HRESULT)).call(hwndparent, dwflags, bforceopenfilesclosed, pbopenfilespreventedtransition)
  end
end
struct LibWin32::IOfflineFilesShareInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_share_item(ppshareitem : IOfflineFilesShareItem*) : HRESULT
    @lpVtbl.value.get_share_item.unsafe_as(Proc(IOfflineFilesShareItem*, HRESULT)).call(ppshareitem)
  end
  def get_share_caching_mode(pcachingmode : OFFLINEFILES_CACHING_MODE*) : HRESULT
    @lpVtbl.value.get_share_caching_mode.unsafe_as(Proc(OFFLINEFILES_CACHING_MODE*, HRESULT)).call(pcachingmode)
  end
  def is_share_dfs_junction(pbisdfsjunction : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_share_dfs_junction.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbisdfsjunction)
  end
end
struct LibWin32::IOfflineFilesSuspend
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def suspend_root(bsuspend : LibC::BOOL) : HRESULT
    @lpVtbl.value.suspend_root.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bsuspend)
  end
end
struct LibWin32::IOfflineFilesSuspendInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_suspended(pbsuspended : LibC::BOOL*, pbsuspendedroot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_suspended.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbsuspended, pbsuspendedroot)
  end
end
struct LibWin32::IOfflineFilesSetting
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_value_type(ptype : OFFLINEFILES_SETTING_VALUE_TYPE*) : HRESULT
    @lpVtbl.value.get_value_type.unsafe_as(Proc(OFFLINEFILES_SETTING_VALUE_TYPE*, HRESULT)).call(ptype)
  end
  def get_preference(pvarvalue : VARIANT*, dwscope : UInt32) : HRESULT
    @lpVtbl.value.get_preference.unsafe_as(Proc(VARIANT*, UInt32, HRESULT)).call(pvarvalue, dwscope)
  end
  def get_preference_scope(pdwscope : UInt32*) : HRESULT
    @lpVtbl.value.get_preference_scope.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwscope)
  end
  def set_preference(pvarvalue : VARIANT*, dwscope : UInt32) : HRESULT
    @lpVtbl.value.set_preference.unsafe_as(Proc(VARIANT*, UInt32, HRESULT)).call(pvarvalue, dwscope)
  end
  def delete_preference(dwscope : UInt32) : HRESULT
    @lpVtbl.value.delete_preference.unsafe_as(Proc(UInt32, HRESULT)).call(dwscope)
  end
  def get_policy(pvarvalue : VARIANT*, dwscope : UInt32) : HRESULT
    @lpVtbl.value.get_policy.unsafe_as(Proc(VARIANT*, UInt32, HRESULT)).call(pvarvalue, dwscope)
  end
  def get_policy_scope(pdwscope : UInt32*) : HRESULT
    @lpVtbl.value.get_policy_scope.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwscope)
  end
  def get_value(pvarvalue : VARIANT*, pbsetbypolicy : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, LibC::BOOL*, HRESULT)).call(pvarvalue, pbsetbypolicy)
  end
end
struct LibWin32::IEnumOfflineFilesSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IOfflineFilesSetting*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IOfflineFilesSetting*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumOfflineFilesSettings*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumOfflineFilesSettings*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IOfflineFilesCache
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def synchronize(hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, basync : LibC::BOOL, dwsynccontrol : UInt32, pisyncconflicthandler : IOfflineFilesSyncConflictHandler, piprogress : IOfflineFilesSyncProgress, psyncid : Guid*) : HRESULT
    @lpVtbl.value.synchronize.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, UInt32, IOfflineFilesSyncConflictHandler, IOfflineFilesSyncProgress, Guid*, HRESULT)).call(hwndparent, rgpszpaths, cpaths, basync, dwsynccontrol, pisyncconflicthandler, piprogress, psyncid)
  end
  def delete_items(rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items.unsafe_as(Proc(LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)).call(rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def delete_items_for_user(pszuser : LibC::LPWSTR, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items_for_user.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)).call(pszuser, rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def pin(hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.pin.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)).call(hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def unpin(hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.unpin.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)).call(hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def get_encryption_status(pbencrypted : LibC::BOOL*, pbpartial : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_encryption_status.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbencrypted, pbpartial)
  end
  def encrypt(hwndparent : LibC::HANDLE, bencrypt : LibC::BOOL, dwencryptioncontrolflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.encrypt.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, UInt32, LibC::BOOL, IOfflineFilesSyncProgress, HRESULT)).call(hwndparent, bencrypt, dwencryptioncontrolflags, basync, piprogress)
  end
  def find_item(pszpath : LibC::LPWSTR, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item.unsafe_as(Proc(LibC::LPWSTR, UInt32, IOfflineFilesItem*, HRESULT)).call(pszpath, dwqueryflags, ppitem)
  end
  def find_item_ex(pszpath : LibC::LPWSTR, pincludefilefilter : IOfflineFilesItemFilter, pincludedirfilter : IOfflineFilesItemFilter, pexcludefilefilter : IOfflineFilesItemFilter, pexcludedirfilter : IOfflineFilesItemFilter, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item_ex.unsafe_as(Proc(LibC::LPWSTR, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, UInt32, IOfflineFilesItem*, HRESULT)).call(pszpath, pincludefilefilter, pincludedirfilter, pexcludefilefilter, pexcludedirfilter, dwqueryflags, ppitem)
  end
  def rename_item(pszpathoriginal : LibC::LPWSTR, pszpathnew : LibC::LPWSTR, breplaceifexists : LibC::BOOL) : HRESULT
    @lpVtbl.value.rename_item.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszpathoriginal, pszpathnew, breplaceifexists)
  end
  def get_location(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_location.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def get_disk_space_information(pcbvolumetotal : UInt64*, pcblimit : UInt64*, pcbused : UInt64*, pcbunpinnedlimit : UInt64*, pcbunpinnedused : UInt64*) : HRESULT
    @lpVtbl.value.get_disk_space_information.unsafe_as(Proc(UInt64*, UInt64*, UInt64*, UInt64*, UInt64*, HRESULT)).call(pcbvolumetotal, pcblimit, pcbused, pcbunpinnedlimit, pcbunpinnedused)
  end
  def set_disk_space_limits(cblimit : UInt64, cbunpinnedlimit : UInt64) : HRESULT
    @lpVtbl.value.set_disk_space_limits.unsafe_as(Proc(UInt64, UInt64, HRESULT)).call(cblimit, cbunpinnedlimit)
  end
  def process_admin_pin_policy(ppinprogress : IOfflineFilesSyncProgress, punpinprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.process_admin_pin_policy.unsafe_as(Proc(IOfflineFilesSyncProgress, IOfflineFilesSyncProgress, HRESULT)).call(ppinprogress, punpinprogress)
  end
  def get_setting_object(pszsettingname : LibC::LPWSTR, ppsetting : IOfflineFilesSetting*) : HRESULT
    @lpVtbl.value.get_setting_object.unsafe_as(Proc(LibC::LPWSTR, IOfflineFilesSetting*, HRESULT)).call(pszsettingname, ppsetting)
  end
  def enum_setting_objects(ppenum : IEnumOfflineFilesSettings*) : HRESULT
    @lpVtbl.value.enum_setting_objects.unsafe_as(Proc(IEnumOfflineFilesSettings*, HRESULT)).call(ppenum)
  end
  def is_path_cacheable(pszpath : LibC::LPWSTR, pbcacheable : LibC::BOOL*, psharecachingmode : OFFLINEFILES_CACHING_MODE*) : HRESULT
    @lpVtbl.value.is_path_cacheable.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, OFFLINEFILES_CACHING_MODE*, HRESULT)).call(pszpath, pbcacheable, psharecachingmode)
  end
end
struct LibWin32::IOfflineFilesCache2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def synchronize(hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, basync : LibC::BOOL, dwsynccontrol : UInt32, pisyncconflicthandler : IOfflineFilesSyncConflictHandler, piprogress : IOfflineFilesSyncProgress, psyncid : Guid*) : HRESULT
    @lpVtbl.value.synchronize.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, UInt32, IOfflineFilesSyncConflictHandler, IOfflineFilesSyncProgress, Guid*, HRESULT)).call(hwndparent, rgpszpaths, cpaths, basync, dwsynccontrol, pisyncconflicthandler, piprogress, psyncid)
  end
  def delete_items(rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items.unsafe_as(Proc(LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)).call(rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def delete_items_for_user(pszuser : LibC::LPWSTR, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items_for_user.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)).call(pszuser, rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def pin(hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.pin.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)).call(hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def unpin(hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.unpin.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)).call(hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def get_encryption_status(pbencrypted : LibC::BOOL*, pbpartial : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_encryption_status.unsafe_as(Proc(LibC::BOOL*, LibC::BOOL*, HRESULT)).call(pbencrypted, pbpartial)
  end
  def encrypt(hwndparent : LibC::HANDLE, bencrypt : LibC::BOOL, dwencryptioncontrolflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.encrypt.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, UInt32, LibC::BOOL, IOfflineFilesSyncProgress, HRESULT)).call(hwndparent, bencrypt, dwencryptioncontrolflags, basync, piprogress)
  end
  def find_item(pszpath : LibC::LPWSTR, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item.unsafe_as(Proc(LibC::LPWSTR, UInt32, IOfflineFilesItem*, HRESULT)).call(pszpath, dwqueryflags, ppitem)
  end
  def find_item_ex(pszpath : LibC::LPWSTR, pincludefilefilter : IOfflineFilesItemFilter, pincludedirfilter : IOfflineFilesItemFilter, pexcludefilefilter : IOfflineFilesItemFilter, pexcludedirfilter : IOfflineFilesItemFilter, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item_ex.unsafe_as(Proc(LibC::LPWSTR, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, UInt32, IOfflineFilesItem*, HRESULT)).call(pszpath, pincludefilefilter, pincludedirfilter, pexcludefilefilter, pexcludedirfilter, dwqueryflags, ppitem)
  end
  def rename_item(pszpathoriginal : LibC::LPWSTR, pszpathnew : LibC::LPWSTR, breplaceifexists : LibC::BOOL) : HRESULT
    @lpVtbl.value.rename_item.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszpathoriginal, pszpathnew, breplaceifexists)
  end
  def get_location(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_location.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def get_disk_space_information(pcbvolumetotal : UInt64*, pcblimit : UInt64*, pcbused : UInt64*, pcbunpinnedlimit : UInt64*, pcbunpinnedused : UInt64*) : HRESULT
    @lpVtbl.value.get_disk_space_information.unsafe_as(Proc(UInt64*, UInt64*, UInt64*, UInt64*, UInt64*, HRESULT)).call(pcbvolumetotal, pcblimit, pcbused, pcbunpinnedlimit, pcbunpinnedused)
  end
  def set_disk_space_limits(cblimit : UInt64, cbunpinnedlimit : UInt64) : HRESULT
    @lpVtbl.value.set_disk_space_limits.unsafe_as(Proc(UInt64, UInt64, HRESULT)).call(cblimit, cbunpinnedlimit)
  end
  def process_admin_pin_policy(ppinprogress : IOfflineFilesSyncProgress, punpinprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.process_admin_pin_policy.unsafe_as(Proc(IOfflineFilesSyncProgress, IOfflineFilesSyncProgress, HRESULT)).call(ppinprogress, punpinprogress)
  end
  def get_setting_object(pszsettingname : LibC::LPWSTR, ppsetting : IOfflineFilesSetting*) : HRESULT
    @lpVtbl.value.get_setting_object.unsafe_as(Proc(LibC::LPWSTR, IOfflineFilesSetting*, HRESULT)).call(pszsettingname, ppsetting)
  end
  def enum_setting_objects(ppenum : IEnumOfflineFilesSettings*) : HRESULT
    @lpVtbl.value.enum_setting_objects.unsafe_as(Proc(IEnumOfflineFilesSettings*, HRESULT)).call(ppenum)
  end
  def is_path_cacheable(pszpath : LibC::LPWSTR, pbcacheable : LibC::BOOL*, psharecachingmode : OFFLINEFILES_CACHING_MODE*) : HRESULT
    @lpVtbl.value.is_path_cacheable.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, OFFLINEFILES_CACHING_MODE*, HRESULT)).call(pszpath, pbcacheable, psharecachingmode)
  end
  def rename_item_ex(pszpathoriginal : LibC::LPWSTR, pszpathnew : LibC::LPWSTR, breplaceifexists : LibC::BOOL) : HRESULT
    @lpVtbl.value.rename_item_ex.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszpathoriginal, pszpathnew, breplaceifexists)
  end
end
