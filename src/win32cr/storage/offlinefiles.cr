require "../system/com.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:cscapi.dll")]
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
  OfflineFilesSetting = LibC::GUID.new(0xfd3659e9_u32, 0xa920_u16, 0x4123_u16, StaticArray[0xad_u8, 0x64_u8, 0x7f_u8, 0xc7_u8, 0x6c_u8, 0x7a_u8, 0xac_u8, 0xdf_u8])
  OfflineFilesCache = LibC::GUID.new(0x48c6be7c_u32, 0x3871_u16, 0x43cc_u16, StaticArray[0xb4_u8, 0x6f_u8, 0x14_u8, 0x49_u8, 0xa1_u8, 0xbb_u8, 0x2f_u8, 0xf3_u8])


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
    query_interface : Proc(IOfflineFilesEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesEvents*, UInt32)
    release : Proc(IOfflineFilesEvents*, UInt32)
    cache_moved : Proc(IOfflineFilesEvents*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    cache_is_full : Proc(IOfflineFilesEvents*, HRESULT)
    cache_is_corrupted : Proc(IOfflineFilesEvents*, HRESULT)
    enabled : Proc(IOfflineFilesEvents*, LibC::BOOL, HRESULT)
    encryption_changed : Proc(IOfflineFilesEvents*, LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)
    sync_begin : Proc(IOfflineFilesEvents*, Guid*, HRESULT)
    sync_file_result : Proc(IOfflineFilesEvents*, Guid*, LibC::LPWSTR, HRESULT, HRESULT)
    sync_conflict_rec_added : Proc(IOfflineFilesEvents*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_end : Proc(IOfflineFilesEvents*, Guid*, HRESULT, HRESULT)
    net_transport_arrived : Proc(IOfflineFilesEvents*, HRESULT)
    no_net_transports : Proc(IOfflineFilesEvents*, HRESULT)
    item_disconnected : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_reconnected : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_available_offline : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_available_offline : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_pinned : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_pinned : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_modified : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)
    item_added_to_cache : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_deleted_from_cache : Proc(IOfflineFilesEvents*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_renamed : Proc(IOfflineFilesEvents*, LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    data_lost : Proc(IOfflineFilesEvents*, HRESULT)
    ping : Proc(IOfflineFilesEvents*, HRESULT)
  end

  struct IOfflineFilesEvents
    lpVtbl : IOfflineFilesEventsVTbl*
  end

  struct IOfflineFilesEvents2VTbl
    query_interface : Proc(IOfflineFilesEvents2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesEvents2*, UInt32)
    release : Proc(IOfflineFilesEvents2*, UInt32)
    cache_moved : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    cache_is_full : Proc(IOfflineFilesEvents2*, HRESULT)
    cache_is_corrupted : Proc(IOfflineFilesEvents2*, HRESULT)
    enabled : Proc(IOfflineFilesEvents2*, LibC::BOOL, HRESULT)
    encryption_changed : Proc(IOfflineFilesEvents2*, LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)
    sync_begin : Proc(IOfflineFilesEvents2*, Guid*, HRESULT)
    sync_file_result : Proc(IOfflineFilesEvents2*, Guid*, LibC::LPWSTR, HRESULT, HRESULT)
    sync_conflict_rec_added : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_end : Proc(IOfflineFilesEvents2*, Guid*, HRESULT, HRESULT)
    net_transport_arrived : Proc(IOfflineFilesEvents2*, HRESULT)
    no_net_transports : Proc(IOfflineFilesEvents2*, HRESULT)
    item_disconnected : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_reconnected : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_available_offline : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_available_offline : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_pinned : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_pinned : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_modified : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)
    item_added_to_cache : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_deleted_from_cache : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_renamed : Proc(IOfflineFilesEvents2*, LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    data_lost : Proc(IOfflineFilesEvents2*, HRESULT)
    ping : Proc(IOfflineFilesEvents2*, HRESULT)
    item_reconnect_begin : Proc(IOfflineFilesEvents2*, HRESULT)
    item_reconnect_end : Proc(IOfflineFilesEvents2*, HRESULT)
    cache_evict_begin : Proc(IOfflineFilesEvents2*, HRESULT)
    cache_evict_end : Proc(IOfflineFilesEvents2*, HRESULT)
    background_sync_begin : Proc(IOfflineFilesEvents2*, UInt32, HRESULT)
    background_sync_end : Proc(IOfflineFilesEvents2*, UInt32, HRESULT)
    policy_change_detected : Proc(IOfflineFilesEvents2*, HRESULT)
    preference_change_detected : Proc(IOfflineFilesEvents2*, HRESULT)
    settings_changes_applied : Proc(IOfflineFilesEvents2*, HRESULT)
  end

  struct IOfflineFilesEvents2
    lpVtbl : IOfflineFilesEvents2VTbl*
  end

  struct IOfflineFilesEvents3VTbl
    query_interface : Proc(IOfflineFilesEvents3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesEvents3*, UInt32)
    release : Proc(IOfflineFilesEvents3*, UInt32)
    cache_moved : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    cache_is_full : Proc(IOfflineFilesEvents3*, HRESULT)
    cache_is_corrupted : Proc(IOfflineFilesEvents3*, HRESULT)
    enabled : Proc(IOfflineFilesEvents3*, LibC::BOOL, HRESULT)
    encryption_changed : Proc(IOfflineFilesEvents3*, LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)
    sync_begin : Proc(IOfflineFilesEvents3*, Guid*, HRESULT)
    sync_file_result : Proc(IOfflineFilesEvents3*, Guid*, LibC::LPWSTR, HRESULT, HRESULT)
    sync_conflict_rec_added : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_end : Proc(IOfflineFilesEvents3*, Guid*, HRESULT, HRESULT)
    net_transport_arrived : Proc(IOfflineFilesEvents3*, HRESULT)
    no_net_transports : Proc(IOfflineFilesEvents3*, HRESULT)
    item_disconnected : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_reconnected : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_available_offline : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_available_offline : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_pinned : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_pinned : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_modified : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)
    item_added_to_cache : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_deleted_from_cache : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_renamed : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    data_lost : Proc(IOfflineFilesEvents3*, HRESULT)
    ping : Proc(IOfflineFilesEvents3*, HRESULT)
    item_reconnect_begin : Proc(IOfflineFilesEvents3*, HRESULT)
    item_reconnect_end : Proc(IOfflineFilesEvents3*, HRESULT)
    cache_evict_begin : Proc(IOfflineFilesEvents3*, HRESULT)
    cache_evict_end : Proc(IOfflineFilesEvents3*, HRESULT)
    background_sync_begin : Proc(IOfflineFilesEvents3*, UInt32, HRESULT)
    background_sync_end : Proc(IOfflineFilesEvents3*, UInt32, HRESULT)
    policy_change_detected : Proc(IOfflineFilesEvents3*, HRESULT)
    preference_change_detected : Proc(IOfflineFilesEvents3*, HRESULT)
    settings_changes_applied : Proc(IOfflineFilesEvents3*, HRESULT)
    transparent_cache_item_notify : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, OFFLINEFILES_EVENTS, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, LibC::LPWSTR, HRESULT)
    prefetch_file_begin : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, HRESULT)
    prefetch_file_end : Proc(IOfflineFilesEvents3*, LibC::LPWSTR, HRESULT, HRESULT)
  end

  struct IOfflineFilesEvents3
    lpVtbl : IOfflineFilesEvents3VTbl*
  end

  struct IOfflineFilesEvents4VTbl
    query_interface : Proc(IOfflineFilesEvents4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesEvents4*, UInt32)
    release : Proc(IOfflineFilesEvents4*, UInt32)
    cache_moved : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    cache_is_full : Proc(IOfflineFilesEvents4*, HRESULT)
    cache_is_corrupted : Proc(IOfflineFilesEvents4*, HRESULT)
    enabled : Proc(IOfflineFilesEvents4*, LibC::BOOL, HRESULT)
    encryption_changed : Proc(IOfflineFilesEvents4*, LibC::BOOL, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)
    sync_begin : Proc(IOfflineFilesEvents4*, Guid*, HRESULT)
    sync_file_result : Proc(IOfflineFilesEvents4*, Guid*, LibC::LPWSTR, HRESULT, HRESULT)
    sync_conflict_rec_added : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, FILETIME*, OFFLINEFILES_SYNC_STATE, HRESULT)
    sync_end : Proc(IOfflineFilesEvents4*, Guid*, HRESULT, HRESULT)
    net_transport_arrived : Proc(IOfflineFilesEvents4*, HRESULT)
    no_net_transports : Proc(IOfflineFilesEvents4*, HRESULT)
    item_disconnected : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_reconnected : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_available_offline : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_available_offline : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_pinned : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_not_pinned : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_modified : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, HRESULT)
    item_added_to_cache : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_deleted_from_cache : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    item_renamed : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, LibC::LPWSTR, OFFLINEFILES_ITEM_TYPE, HRESULT)
    data_lost : Proc(IOfflineFilesEvents4*, HRESULT)
    ping : Proc(IOfflineFilesEvents4*, HRESULT)
    item_reconnect_begin : Proc(IOfflineFilesEvents4*, HRESULT)
    item_reconnect_end : Proc(IOfflineFilesEvents4*, HRESULT)
    cache_evict_begin : Proc(IOfflineFilesEvents4*, HRESULT)
    cache_evict_end : Proc(IOfflineFilesEvents4*, HRESULT)
    background_sync_begin : Proc(IOfflineFilesEvents4*, UInt32, HRESULT)
    background_sync_end : Proc(IOfflineFilesEvents4*, UInt32, HRESULT)
    policy_change_detected : Proc(IOfflineFilesEvents4*, HRESULT)
    preference_change_detected : Proc(IOfflineFilesEvents4*, HRESULT)
    settings_changes_applied : Proc(IOfflineFilesEvents4*, HRESULT)
    transparent_cache_item_notify : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, OFFLINEFILES_EVENTS, OFFLINEFILES_ITEM_TYPE, LibC::BOOL, LibC::BOOL, LibC::LPWSTR, HRESULT)
    prefetch_file_begin : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, HRESULT)
    prefetch_file_end : Proc(IOfflineFilesEvents4*, LibC::LPWSTR, HRESULT, HRESULT)
    prefetch_close_handle_begin : Proc(IOfflineFilesEvents4*, HRESULT)
    prefetch_close_handle_end : Proc(IOfflineFilesEvents4*, UInt32, UInt32, HRESULT, HRESULT)
  end

  struct IOfflineFilesEvents4
    lpVtbl : IOfflineFilesEvents4VTbl*
  end

  struct IOfflineFilesEventsFilterVTbl
    query_interface : Proc(IOfflineFilesEventsFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesEventsFilter*, UInt32)
    release : Proc(IOfflineFilesEventsFilter*, UInt32)
    get_path_filter : Proc(IOfflineFilesEventsFilter*, LibC::LPWSTR*, OFFLINEFILES_PATHFILTER_MATCH*, HRESULT)
    get_included_events : Proc(IOfflineFilesEventsFilter*, UInt32, OFFLINEFILES_EVENTS*, UInt32*, HRESULT)
    get_excluded_events : Proc(IOfflineFilesEventsFilter*, UInt32, OFFLINEFILES_EVENTS*, UInt32*, HRESULT)
  end

  struct IOfflineFilesEventsFilter
    lpVtbl : IOfflineFilesEventsFilterVTbl*
  end

  struct IOfflineFilesErrorInfoVTbl
    query_interface : Proc(IOfflineFilesErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesErrorInfo*, UInt32)
    release : Proc(IOfflineFilesErrorInfo*, UInt32)
    get_raw_data : Proc(IOfflineFilesErrorInfo*, BYTE_BLOB**, HRESULT)
    get_description : Proc(IOfflineFilesErrorInfo*, LibC::LPWSTR*, HRESULT)
  end

  struct IOfflineFilesErrorInfo
    lpVtbl : IOfflineFilesErrorInfoVTbl*
  end

  struct IOfflineFilesSyncErrorItemInfoVTbl
    query_interface : Proc(IOfflineFilesSyncErrorItemInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSyncErrorItemInfo*, UInt32)
    release : Proc(IOfflineFilesSyncErrorItemInfo*, UInt32)
    get_file_attributes : Proc(IOfflineFilesSyncErrorItemInfo*, UInt32*, HRESULT)
    get_file_times : Proc(IOfflineFilesSyncErrorItemInfo*, FILETIME*, FILETIME*, HRESULT)
    get_file_size : Proc(IOfflineFilesSyncErrorItemInfo*, LARGE_INTEGER*, HRESULT)
  end

  struct IOfflineFilesSyncErrorItemInfo
    lpVtbl : IOfflineFilesSyncErrorItemInfoVTbl*
  end

  struct IOfflineFilesSyncErrorInfoVTbl
    query_interface : Proc(IOfflineFilesSyncErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSyncErrorInfo*, UInt32)
    release : Proc(IOfflineFilesSyncErrorInfo*, UInt32)
    get_raw_data : Proc(IOfflineFilesSyncErrorInfo*, BYTE_BLOB**, HRESULT)
    get_description : Proc(IOfflineFilesSyncErrorInfo*, LibC::LPWSTR*, HRESULT)
    get_sync_operation : Proc(IOfflineFilesSyncErrorInfo*, OFFLINEFILES_SYNC_OPERATION*, HRESULT)
    get_item_change_flags : Proc(IOfflineFilesSyncErrorInfo*, UInt32*, HRESULT)
    info_enumerated : Proc(IOfflineFilesSyncErrorInfo*, LibC::BOOL*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    info_available : Proc(IOfflineFilesSyncErrorInfo*, LibC::BOOL*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    get_local_info : Proc(IOfflineFilesSyncErrorInfo*, IOfflineFilesSyncErrorItemInfo*, HRESULT)
    get_remote_info : Proc(IOfflineFilesSyncErrorInfo*, IOfflineFilesSyncErrorItemInfo*, HRESULT)
    get_original_info : Proc(IOfflineFilesSyncErrorInfo*, IOfflineFilesSyncErrorItemInfo*, HRESULT)
  end

  struct IOfflineFilesSyncErrorInfo
    lpVtbl : IOfflineFilesSyncErrorInfoVTbl*
  end

  struct IOfflineFilesProgressVTbl
    query_interface : Proc(IOfflineFilesProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesProgress*, UInt32)
    release : Proc(IOfflineFilesProgress*, UInt32)
    rbegin : Proc(IOfflineFilesProgress*, LibC::BOOL*, HRESULT)
    query_abort : Proc(IOfflineFilesProgress*, LibC::BOOL*, HRESULT)
    rend : Proc(IOfflineFilesProgress*, HRESULT, HRESULT)
  end

  struct IOfflineFilesProgress
    lpVtbl : IOfflineFilesProgressVTbl*
  end

  struct IOfflineFilesSimpleProgressVTbl
    query_interface : Proc(IOfflineFilesSimpleProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSimpleProgress*, UInt32)
    release : Proc(IOfflineFilesSimpleProgress*, UInt32)
    rbegin : Proc(IOfflineFilesSimpleProgress*, LibC::BOOL*, HRESULT)
    query_abort : Proc(IOfflineFilesSimpleProgress*, LibC::BOOL*, HRESULT)
    rend : Proc(IOfflineFilesSimpleProgress*, HRESULT, HRESULT)
    item_begin : Proc(IOfflineFilesSimpleProgress*, LibC::LPWSTR, OFFLINEFILES_OP_RESPONSE*, HRESULT)
    item_result : Proc(IOfflineFilesSimpleProgress*, LibC::LPWSTR, HRESULT, OFFLINEFILES_OP_RESPONSE*, HRESULT)
  end

  struct IOfflineFilesSimpleProgress
    lpVtbl : IOfflineFilesSimpleProgressVTbl*
  end

  struct IOfflineFilesSyncProgressVTbl
    query_interface : Proc(IOfflineFilesSyncProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSyncProgress*, UInt32)
    release : Proc(IOfflineFilesSyncProgress*, UInt32)
    rbegin : Proc(IOfflineFilesSyncProgress*, LibC::BOOL*, HRESULT)
    query_abort : Proc(IOfflineFilesSyncProgress*, LibC::BOOL*, HRESULT)
    rend : Proc(IOfflineFilesSyncProgress*, HRESULT, HRESULT)
    sync_item_begin : Proc(IOfflineFilesSyncProgress*, LibC::LPWSTR, OFFLINEFILES_OP_RESPONSE*, HRESULT)
    sync_item_result : Proc(IOfflineFilesSyncProgress*, LibC::LPWSTR, HRESULT, IOfflineFilesSyncErrorInfo, OFFLINEFILES_OP_RESPONSE*, HRESULT)
  end

  struct IOfflineFilesSyncProgress
    lpVtbl : IOfflineFilesSyncProgressVTbl*
  end

  struct IOfflineFilesSyncConflictHandlerVTbl
    query_interface : Proc(IOfflineFilesSyncConflictHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSyncConflictHandler*, UInt32)
    release : Proc(IOfflineFilesSyncConflictHandler*, UInt32)
    resolve_conflict : Proc(IOfflineFilesSyncConflictHandler*, LibC::LPWSTR, UInt32, OFFLINEFILES_SYNC_STATE, UInt32, OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, LibC::LPWSTR*, HRESULT)
  end

  struct IOfflineFilesSyncConflictHandler
    lpVtbl : IOfflineFilesSyncConflictHandlerVTbl*
  end

  struct IOfflineFilesItemFilterVTbl
    query_interface : Proc(IOfflineFilesItemFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesItemFilter*, UInt32)
    release : Proc(IOfflineFilesItemFilter*, UInt32)
    get_filter_flags : Proc(IOfflineFilesItemFilter*, UInt64*, UInt64*, HRESULT)
    get_time_filter : Proc(IOfflineFilesItemFilter*, FILETIME*, LibC::BOOL*, OFFLINEFILES_ITEM_TIME*, OFFLINEFILES_COMPARE*, HRESULT)
    get_pattern_filter : Proc(IOfflineFilesItemFilter*, Char*, UInt32, HRESULT)
  end

  struct IOfflineFilesItemFilter
    lpVtbl : IOfflineFilesItemFilterVTbl*
  end

  struct IOfflineFilesItemVTbl
    query_interface : Proc(IOfflineFilesItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesItem*, UInt32)
    release : Proc(IOfflineFilesItem*, UInt32)
    get_item_type : Proc(IOfflineFilesItem*, OFFLINEFILES_ITEM_TYPE*, HRESULT)
    get_path : Proc(IOfflineFilesItem*, LibC::LPWSTR*, HRESULT)
    get_parent_item : Proc(IOfflineFilesItem*, IOfflineFilesItem*, HRESULT)
    refresh : Proc(IOfflineFilesItem*, UInt32, HRESULT)
    is_marked_for_deletion : Proc(IOfflineFilesItem*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesItem
    lpVtbl : IOfflineFilesItemVTbl*
  end

  struct IOfflineFilesServerItemVTbl
    query_interface : Proc(IOfflineFilesServerItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesServerItem*, UInt32)
    release : Proc(IOfflineFilesServerItem*, UInt32)
    get_item_type : Proc(IOfflineFilesServerItem*, OFFLINEFILES_ITEM_TYPE*, HRESULT)
    get_path : Proc(IOfflineFilesServerItem*, LibC::LPWSTR*, HRESULT)
    get_parent_item : Proc(IOfflineFilesServerItem*, IOfflineFilesItem*, HRESULT)
    refresh : Proc(IOfflineFilesServerItem*, UInt32, HRESULT)
    is_marked_for_deletion : Proc(IOfflineFilesServerItem*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesServerItem
    lpVtbl : IOfflineFilesServerItemVTbl*
  end

  struct IOfflineFilesShareItemVTbl
    query_interface : Proc(IOfflineFilesShareItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesShareItem*, UInt32)
    release : Proc(IOfflineFilesShareItem*, UInt32)
    get_item_type : Proc(IOfflineFilesShareItem*, OFFLINEFILES_ITEM_TYPE*, HRESULT)
    get_path : Proc(IOfflineFilesShareItem*, LibC::LPWSTR*, HRESULT)
    get_parent_item : Proc(IOfflineFilesShareItem*, IOfflineFilesItem*, HRESULT)
    refresh : Proc(IOfflineFilesShareItem*, UInt32, HRESULT)
    is_marked_for_deletion : Proc(IOfflineFilesShareItem*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesShareItem
    lpVtbl : IOfflineFilesShareItemVTbl*
  end

  struct IOfflineFilesDirectoryItemVTbl
    query_interface : Proc(IOfflineFilesDirectoryItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesDirectoryItem*, UInt32)
    release : Proc(IOfflineFilesDirectoryItem*, UInt32)
    get_item_type : Proc(IOfflineFilesDirectoryItem*, OFFLINEFILES_ITEM_TYPE*, HRESULT)
    get_path : Proc(IOfflineFilesDirectoryItem*, LibC::LPWSTR*, HRESULT)
    get_parent_item : Proc(IOfflineFilesDirectoryItem*, IOfflineFilesItem*, HRESULT)
    refresh : Proc(IOfflineFilesDirectoryItem*, UInt32, HRESULT)
    is_marked_for_deletion : Proc(IOfflineFilesDirectoryItem*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesDirectoryItem
    lpVtbl : IOfflineFilesDirectoryItemVTbl*
  end

  struct IOfflineFilesFileItemVTbl
    query_interface : Proc(IOfflineFilesFileItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesFileItem*, UInt32)
    release : Proc(IOfflineFilesFileItem*, UInt32)
    get_item_type : Proc(IOfflineFilesFileItem*, OFFLINEFILES_ITEM_TYPE*, HRESULT)
    get_path : Proc(IOfflineFilesFileItem*, LibC::LPWSTR*, HRESULT)
    get_parent_item : Proc(IOfflineFilesFileItem*, IOfflineFilesItem*, HRESULT)
    refresh : Proc(IOfflineFilesFileItem*, UInt32, HRESULT)
    is_marked_for_deletion : Proc(IOfflineFilesFileItem*, LibC::BOOL*, HRESULT)
    is_sparse : Proc(IOfflineFilesFileItem*, LibC::BOOL*, HRESULT)
    is_encrypted : Proc(IOfflineFilesFileItem*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesFileItem
    lpVtbl : IOfflineFilesFileItemVTbl*
  end

  struct IEnumOfflineFilesItemsVTbl
    query_interface : Proc(IEnumOfflineFilesItems*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumOfflineFilesItems*, UInt32)
    release : Proc(IEnumOfflineFilesItems*, UInt32)
    next : Proc(IEnumOfflineFilesItems*, UInt32, IOfflineFilesItem*, UInt32*, HRESULT)
    skip : Proc(IEnumOfflineFilesItems*, UInt32, HRESULT)
    reset : Proc(IEnumOfflineFilesItems*, HRESULT)
    clone : Proc(IEnumOfflineFilesItems*, IEnumOfflineFilesItems*, HRESULT)
  end

  struct IEnumOfflineFilesItems
    lpVtbl : IEnumOfflineFilesItemsVTbl*
  end

  struct IOfflineFilesItemContainerVTbl
    query_interface : Proc(IOfflineFilesItemContainer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesItemContainer*, UInt32)
    release : Proc(IOfflineFilesItemContainer*, UInt32)
    enum_items : Proc(IOfflineFilesItemContainer*, UInt32, IEnumOfflineFilesItems*, HRESULT)
    enum_items_ex : Proc(IOfflineFilesItemContainer*, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, UInt32, UInt32, IEnumOfflineFilesItems*, HRESULT)
  end

  struct IOfflineFilesItemContainer
    lpVtbl : IOfflineFilesItemContainerVTbl*
  end

  struct IOfflineFilesChangeInfoVTbl
    query_interface : Proc(IOfflineFilesChangeInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesChangeInfo*, UInt32)
    release : Proc(IOfflineFilesChangeInfo*, UInt32)
    is_dirty : Proc(IOfflineFilesChangeInfo*, LibC::BOOL*, HRESULT)
    is_deleted_offline : Proc(IOfflineFilesChangeInfo*, LibC::BOOL*, HRESULT)
    is_created_offline : Proc(IOfflineFilesChangeInfo*, LibC::BOOL*, HRESULT)
    is_locally_modified_data : Proc(IOfflineFilesChangeInfo*, LibC::BOOL*, HRESULT)
    is_locally_modified_attributes : Proc(IOfflineFilesChangeInfo*, LibC::BOOL*, HRESULT)
    is_locally_modified_time : Proc(IOfflineFilesChangeInfo*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesChangeInfo
    lpVtbl : IOfflineFilesChangeInfoVTbl*
  end

  struct IOfflineFilesDirtyInfoVTbl
    query_interface : Proc(IOfflineFilesDirtyInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesDirtyInfo*, UInt32)
    release : Proc(IOfflineFilesDirtyInfo*, UInt32)
    local_dirty_byte_count : Proc(IOfflineFilesDirtyInfo*, LARGE_INTEGER*, HRESULT)
    remote_dirty_byte_count : Proc(IOfflineFilesDirtyInfo*, LARGE_INTEGER*, HRESULT)
  end

  struct IOfflineFilesDirtyInfo
    lpVtbl : IOfflineFilesDirtyInfoVTbl*
  end

  struct IOfflineFilesFileSysInfoVTbl
    query_interface : Proc(IOfflineFilesFileSysInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesFileSysInfo*, UInt32)
    release : Proc(IOfflineFilesFileSysInfo*, UInt32)
    get_attributes : Proc(IOfflineFilesFileSysInfo*, OFFLINEFILES_ITEM_COPY, UInt32*, HRESULT)
    get_times : Proc(IOfflineFilesFileSysInfo*, OFFLINEFILES_ITEM_COPY, FILETIME*, FILETIME*, FILETIME*, FILETIME*, HRESULT)
    get_file_size : Proc(IOfflineFilesFileSysInfo*, OFFLINEFILES_ITEM_COPY, LARGE_INTEGER*, HRESULT)
  end

  struct IOfflineFilesFileSysInfo
    lpVtbl : IOfflineFilesFileSysInfoVTbl*
  end

  struct IOfflineFilesPinInfoVTbl
    query_interface : Proc(IOfflineFilesPinInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesPinInfo*, UInt32)
    release : Proc(IOfflineFilesPinInfo*, UInt32)
    is_pinned : Proc(IOfflineFilesPinInfo*, LibC::BOOL*, HRESULT)
    is_pinned_for_user : Proc(IOfflineFilesPinInfo*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    is_pinned_for_user_by_policy : Proc(IOfflineFilesPinInfo*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    is_pinned_for_computer : Proc(IOfflineFilesPinInfo*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    is_pinned_for_folder_redirection : Proc(IOfflineFilesPinInfo*, LibC::BOOL*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesPinInfo
    lpVtbl : IOfflineFilesPinInfoVTbl*
  end

  struct IOfflineFilesPinInfo2VTbl
    query_interface : Proc(IOfflineFilesPinInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesPinInfo2*, UInt32)
    release : Proc(IOfflineFilesPinInfo2*, UInt32)
    is_pinned : Proc(IOfflineFilesPinInfo2*, LibC::BOOL*, HRESULT)
    is_pinned_for_user : Proc(IOfflineFilesPinInfo2*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    is_pinned_for_user_by_policy : Proc(IOfflineFilesPinInfo2*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    is_pinned_for_computer : Proc(IOfflineFilesPinInfo2*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    is_pinned_for_folder_redirection : Proc(IOfflineFilesPinInfo2*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    is_partly_pinned : Proc(IOfflineFilesPinInfo2*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesPinInfo2
    lpVtbl : IOfflineFilesPinInfo2VTbl*
  end

  struct IOfflineFilesTransparentCacheInfoVTbl
    query_interface : Proc(IOfflineFilesTransparentCacheInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesTransparentCacheInfo*, UInt32)
    release : Proc(IOfflineFilesTransparentCacheInfo*, UInt32)
    is_transparently_cached : Proc(IOfflineFilesTransparentCacheInfo*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesTransparentCacheInfo
    lpVtbl : IOfflineFilesTransparentCacheInfoVTbl*
  end

  struct IOfflineFilesGhostInfoVTbl
    query_interface : Proc(IOfflineFilesGhostInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesGhostInfo*, UInt32)
    release : Proc(IOfflineFilesGhostInfo*, UInt32)
    is_ghosted : Proc(IOfflineFilesGhostInfo*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesGhostInfo
    lpVtbl : IOfflineFilesGhostInfoVTbl*
  end

  struct IOfflineFilesConnectionInfoVTbl
    query_interface : Proc(IOfflineFilesConnectionInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesConnectionInfo*, UInt32)
    release : Proc(IOfflineFilesConnectionInfo*, UInt32)
    get_connect_state : Proc(IOfflineFilesConnectionInfo*, OFFLINEFILES_CONNECT_STATE*, OFFLINEFILES_OFFLINE_REASON*, HRESULT)
    set_connect_state : Proc(IOfflineFilesConnectionInfo*, LibC::HANDLE, UInt32, OFFLINEFILES_CONNECT_STATE, HRESULT)
    transition_online : Proc(IOfflineFilesConnectionInfo*, LibC::HANDLE, UInt32, HRESULT)
    transition_offline : Proc(IOfflineFilesConnectionInfo*, LibC::HANDLE, UInt32, LibC::BOOL, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesConnectionInfo
    lpVtbl : IOfflineFilesConnectionInfoVTbl*
  end

  struct IOfflineFilesShareInfoVTbl
    query_interface : Proc(IOfflineFilesShareInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesShareInfo*, UInt32)
    release : Proc(IOfflineFilesShareInfo*, UInt32)
    get_share_item : Proc(IOfflineFilesShareInfo*, IOfflineFilesShareItem*, HRESULT)
    get_share_caching_mode : Proc(IOfflineFilesShareInfo*, OFFLINEFILES_CACHING_MODE*, HRESULT)
    is_share_dfs_junction : Proc(IOfflineFilesShareInfo*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesShareInfo
    lpVtbl : IOfflineFilesShareInfoVTbl*
  end

  struct IOfflineFilesSuspendVTbl
    query_interface : Proc(IOfflineFilesSuspend*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSuspend*, UInt32)
    release : Proc(IOfflineFilesSuspend*, UInt32)
    suspend_root : Proc(IOfflineFilesSuspend*, LibC::BOOL, HRESULT)
  end

  struct IOfflineFilesSuspend
    lpVtbl : IOfflineFilesSuspendVTbl*
  end

  struct IOfflineFilesSuspendInfoVTbl
    query_interface : Proc(IOfflineFilesSuspendInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSuspendInfo*, UInt32)
    release : Proc(IOfflineFilesSuspendInfo*, UInt32)
    is_suspended : Proc(IOfflineFilesSuspendInfo*, LibC::BOOL*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesSuspendInfo
    lpVtbl : IOfflineFilesSuspendInfoVTbl*
  end

  struct IOfflineFilesSettingVTbl
    query_interface : Proc(IOfflineFilesSetting*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSetting*, UInt32)
    release : Proc(IOfflineFilesSetting*, UInt32)
    get_name : Proc(IOfflineFilesSetting*, LibC::LPWSTR*, HRESULT)
    get_value_type : Proc(IOfflineFilesSetting*, OFFLINEFILES_SETTING_VALUE_TYPE*, HRESULT)
    get_preference : Proc(IOfflineFilesSetting*, VARIANT*, UInt32, HRESULT)
    get_preference_scope : Proc(IOfflineFilesSetting*, UInt32*, HRESULT)
    set_preference : Proc(IOfflineFilesSetting*, VARIANT*, UInt32, HRESULT)
    delete_preference : Proc(IOfflineFilesSetting*, UInt32, HRESULT)
    get_policy : Proc(IOfflineFilesSetting*, VARIANT*, UInt32, HRESULT)
    get_policy_scope : Proc(IOfflineFilesSetting*, UInt32*, HRESULT)
    get_value : Proc(IOfflineFilesSetting*, VARIANT*, LibC::BOOL*, HRESULT)
  end

  struct IOfflineFilesSetting
    lpVtbl : IOfflineFilesSettingVTbl*
  end

  struct IEnumOfflineFilesSettingsVTbl
    query_interface : Proc(IEnumOfflineFilesSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumOfflineFilesSettings*, UInt32)
    release : Proc(IEnumOfflineFilesSettings*, UInt32)
    next : Proc(IEnumOfflineFilesSettings*, UInt32, IOfflineFilesSetting*, UInt32*, HRESULT)
    skip : Proc(IEnumOfflineFilesSettings*, UInt32, HRESULT)
    reset : Proc(IEnumOfflineFilesSettings*, HRESULT)
    clone : Proc(IEnumOfflineFilesSettings*, IEnumOfflineFilesSettings*, HRESULT)
  end

  struct IEnumOfflineFilesSettings
    lpVtbl : IEnumOfflineFilesSettingsVTbl*
  end

  struct IOfflineFilesCacheVTbl
    query_interface : Proc(IOfflineFilesCache*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesCache*, UInt32)
    release : Proc(IOfflineFilesCache*, UInt32)
    synchronize : Proc(IOfflineFilesCache*, LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, UInt32, IOfflineFilesSyncConflictHandler, IOfflineFilesSyncProgress, Guid*, HRESULT)
    delete_items : Proc(IOfflineFilesCache*, LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)
    delete_items_for_user : Proc(IOfflineFilesCache*, LibC::LPWSTR, LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)
    pin : Proc(IOfflineFilesCache*, LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)
    unpin : Proc(IOfflineFilesCache*, LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)
    get_encryption_status : Proc(IOfflineFilesCache*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    encrypt : Proc(IOfflineFilesCache*, LibC::HANDLE, LibC::BOOL, UInt32, LibC::BOOL, IOfflineFilesSyncProgress, HRESULT)
    find_item : Proc(IOfflineFilesCache*, LibC::LPWSTR, UInt32, IOfflineFilesItem*, HRESULT)
    find_item_ex : Proc(IOfflineFilesCache*, LibC::LPWSTR, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, UInt32, IOfflineFilesItem*, HRESULT)
    rename_item : Proc(IOfflineFilesCache*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_location : Proc(IOfflineFilesCache*, LibC::LPWSTR*, HRESULT)
    get_disk_space_information : Proc(IOfflineFilesCache*, UInt64*, UInt64*, UInt64*, UInt64*, UInt64*, HRESULT)
    set_disk_space_limits : Proc(IOfflineFilesCache*, UInt64, UInt64, HRESULT)
    process_admin_pin_policy : Proc(IOfflineFilesCache*, IOfflineFilesSyncProgress, IOfflineFilesSyncProgress, HRESULT)
    get_setting_object : Proc(IOfflineFilesCache*, LibC::LPWSTR, IOfflineFilesSetting*, HRESULT)
    enum_setting_objects : Proc(IOfflineFilesCache*, IEnumOfflineFilesSettings*, HRESULT)
    is_path_cacheable : Proc(IOfflineFilesCache*, LibC::LPWSTR, LibC::BOOL*, OFFLINEFILES_CACHING_MODE*, HRESULT)
  end

  struct IOfflineFilesCache
    lpVtbl : IOfflineFilesCacheVTbl*
  end

  struct IOfflineFilesCache2VTbl
    query_interface : Proc(IOfflineFilesCache2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesCache2*, UInt32)
    release : Proc(IOfflineFilesCache2*, UInt32)
    synchronize : Proc(IOfflineFilesCache2*, LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, UInt32, IOfflineFilesSyncConflictHandler, IOfflineFilesSyncProgress, Guid*, HRESULT)
    delete_items : Proc(IOfflineFilesCache2*, LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)
    delete_items_for_user : Proc(IOfflineFilesCache2*, LibC::LPWSTR, LibC::LPWSTR*, UInt32, UInt32, LibC::BOOL, IOfflineFilesSimpleProgress, HRESULT)
    pin : Proc(IOfflineFilesCache2*, LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)
    unpin : Proc(IOfflineFilesCache2*, LibC::HANDLE, LibC::LPWSTR*, UInt32, LibC::BOOL, LibC::BOOL, UInt32, IOfflineFilesSyncProgress, HRESULT)
    get_encryption_status : Proc(IOfflineFilesCache2*, LibC::BOOL*, LibC::BOOL*, HRESULT)
    encrypt : Proc(IOfflineFilesCache2*, LibC::HANDLE, LibC::BOOL, UInt32, LibC::BOOL, IOfflineFilesSyncProgress, HRESULT)
    find_item : Proc(IOfflineFilesCache2*, LibC::LPWSTR, UInt32, IOfflineFilesItem*, HRESULT)
    find_item_ex : Proc(IOfflineFilesCache2*, LibC::LPWSTR, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, UInt32, IOfflineFilesItem*, HRESULT)
    rename_item : Proc(IOfflineFilesCache2*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_location : Proc(IOfflineFilesCache2*, LibC::LPWSTR*, HRESULT)
    get_disk_space_information : Proc(IOfflineFilesCache2*, UInt64*, UInt64*, UInt64*, UInt64*, UInt64*, HRESULT)
    set_disk_space_limits : Proc(IOfflineFilesCache2*, UInt64, UInt64, HRESULT)
    process_admin_pin_policy : Proc(IOfflineFilesCache2*, IOfflineFilesSyncProgress, IOfflineFilesSyncProgress, HRESULT)
    get_setting_object : Proc(IOfflineFilesCache2*, LibC::LPWSTR, IOfflineFilesSetting*, HRESULT)
    enum_setting_objects : Proc(IOfflineFilesCache2*, IEnumOfflineFilesSettings*, HRESULT)
    is_path_cacheable : Proc(IOfflineFilesCache2*, LibC::LPWSTR, LibC::BOOL*, OFFLINEFILES_CACHING_MODE*, HRESULT)
    rename_item_ex : Proc(IOfflineFilesCache2*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)
  end

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
