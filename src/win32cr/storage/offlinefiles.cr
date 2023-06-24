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

  IOfflineFilesEvents_GUID = "e25585c1-0caa-4eb1-873b-1cae5b77c314"
  IID_IOfflineFilesEvents = LibC::GUID.new(0xe25585c1_u32, 0xcaa_u16, 0x4eb1_u16, StaticArray[0x87_u8, 0x3b_u8, 0x1c_u8, 0xae_u8, 0x5b_u8, 0x77_u8, 0xc3_u8, 0x14_u8])
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

  IOfflineFilesEvents2_GUID = "1ead8f56-ff76-4faa-a795-6f6ef792498b"
  IID_IOfflineFilesEvents2 = LibC::GUID.new(0x1ead8f56_u32, 0xff76_u16, 0x4faa_u16, StaticArray[0xa7_u8, 0x95_u8, 0x6f_u8, 0x6e_u8, 0xf7_u8, 0x92_u8, 0x49_u8, 0x8b_u8])
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

  IOfflineFilesEvents3_GUID = "9ba04a45-ee69-42f0-9ab1-7db5c8805808"
  IID_IOfflineFilesEvents3 = LibC::GUID.new(0x9ba04a45_u32, 0xee69_u16, 0x42f0_u16, StaticArray[0x9a_u8, 0xb1_u8, 0x7d_u8, 0xb5_u8, 0xc8_u8, 0x80_u8, 0x58_u8, 0x8_u8])
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

  IOfflineFilesEvents4_GUID = "dbd69b1e-c7d2-473e-b35f-9d8c24c0c484"
  IID_IOfflineFilesEvents4 = LibC::GUID.new(0xdbd69b1e_u32, 0xc7d2_u16, 0x473e_u16, StaticArray[0xb3_u8, 0x5f_u8, 0x9d_u8, 0x8c_u8, 0x24_u8, 0xc0_u8, 0xc4_u8, 0x84_u8])
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

  IOfflineFilesEventsFilter_GUID = "33fc4e1b-0716-40fa-ba65-6e62a84a846f"
  IID_IOfflineFilesEventsFilter = LibC::GUID.new(0x33fc4e1b_u32, 0x716_u16, 0x40fa_u16, StaticArray[0xba_u8, 0x65_u8, 0x6e_u8, 0x62_u8, 0xa8_u8, 0x4a_u8, 0x84_u8, 0x6f_u8])
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

  IOfflineFilesErrorInfo_GUID = "7112fa5f-7571-435a-8eb7-195c7c1429bc"
  IID_IOfflineFilesErrorInfo = LibC::GUID.new(0x7112fa5f_u32, 0x7571_u16, 0x435a_u16, StaticArray[0x8e_u8, 0xb7_u8, 0x19_u8, 0x5c_u8, 0x7c_u8, 0x14_u8, 0x29_u8, 0xbc_u8])
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

  IOfflineFilesSyncErrorItemInfo_GUID = "ecdbaf0d-6a18-4d55-8017-108f7660ba44"
  IID_IOfflineFilesSyncErrorItemInfo = LibC::GUID.new(0xecdbaf0d_u32, 0x6a18_u16, 0x4d55_u16, StaticArray[0x80_u8, 0x17_u8, 0x10_u8, 0x8f_u8, 0x76_u8, 0x60_u8, 0xba_u8, 0x44_u8])
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

  IOfflineFilesSyncErrorInfo_GUID = "59f95e46-eb54-49d1-be76-de95458d01b0"
  IID_IOfflineFilesSyncErrorInfo = LibC::GUID.new(0x59f95e46_u32, 0xeb54_u16, 0x49d1_u16, StaticArray[0xbe_u8, 0x76_u8, 0xde_u8, 0x95_u8, 0x45_u8, 0x8d_u8, 0x1_u8, 0xb0_u8])
  struct IOfflineFilesSyncErrorInfo
    lpVtbl : IOfflineFilesSyncErrorInfoVTbl*
  end

  struct IOfflineFilesProgressVTbl
    query_interface : Proc(IOfflineFilesProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesProgress*, UInt32)
    release : Proc(IOfflineFilesProgress*, UInt32)
    begin_ : Proc(IOfflineFilesProgress*, LibC::BOOL*, HRESULT)
    query_abort : Proc(IOfflineFilesProgress*, LibC::BOOL*, HRESULT)
    end_ : Proc(IOfflineFilesProgress*, HRESULT, HRESULT)
  end

  IOfflineFilesProgress_GUID = "fad63237-c55b-4911-9850-bcf96d4c979e"
  IID_IOfflineFilesProgress = LibC::GUID.new(0xfad63237_u32, 0xc55b_u16, 0x4911_u16, StaticArray[0x98_u8, 0x50_u8, 0xbc_u8, 0xf9_u8, 0x6d_u8, 0x4c_u8, 0x97_u8, 0x9e_u8])
  struct IOfflineFilesProgress
    lpVtbl : IOfflineFilesProgressVTbl*
  end

  struct IOfflineFilesSimpleProgressVTbl
    query_interface : Proc(IOfflineFilesSimpleProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSimpleProgress*, UInt32)
    release : Proc(IOfflineFilesSimpleProgress*, UInt32)
    begin_ : Proc(IOfflineFilesSimpleProgress*, LibC::BOOL*, HRESULT)
    query_abort : Proc(IOfflineFilesSimpleProgress*, LibC::BOOL*, HRESULT)
    end_ : Proc(IOfflineFilesSimpleProgress*, HRESULT, HRESULT)
    item_begin : Proc(IOfflineFilesSimpleProgress*, LibC::LPWSTR, OFFLINEFILES_OP_RESPONSE*, HRESULT)
    item_result : Proc(IOfflineFilesSimpleProgress*, LibC::LPWSTR, HRESULT, OFFLINEFILES_OP_RESPONSE*, HRESULT)
  end

  IOfflineFilesSimpleProgress_GUID = "c34f7f9b-c43d-4f9d-a776-c0eb6de5d401"
  IID_IOfflineFilesSimpleProgress = LibC::GUID.new(0xc34f7f9b_u32, 0xc43d_u16, 0x4f9d_u16, StaticArray[0xa7_u8, 0x76_u8, 0xc0_u8, 0xeb_u8, 0x6d_u8, 0xe5_u8, 0xd4_u8, 0x1_u8])
  struct IOfflineFilesSimpleProgress
    lpVtbl : IOfflineFilesSimpleProgressVTbl*
  end

  struct IOfflineFilesSyncProgressVTbl
    query_interface : Proc(IOfflineFilesSyncProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSyncProgress*, UInt32)
    release : Proc(IOfflineFilesSyncProgress*, UInt32)
    begin_ : Proc(IOfflineFilesSyncProgress*, LibC::BOOL*, HRESULT)
    query_abort : Proc(IOfflineFilesSyncProgress*, LibC::BOOL*, HRESULT)
    end_ : Proc(IOfflineFilesSyncProgress*, HRESULT, HRESULT)
    sync_item_begin : Proc(IOfflineFilesSyncProgress*, LibC::LPWSTR, OFFLINEFILES_OP_RESPONSE*, HRESULT)
    sync_item_result : Proc(IOfflineFilesSyncProgress*, LibC::LPWSTR, HRESULT, IOfflineFilesSyncErrorInfo, OFFLINEFILES_OP_RESPONSE*, HRESULT)
  end

  IOfflineFilesSyncProgress_GUID = "6931f49a-6fc7-4c1b-b265-56793fc451b7"
  IID_IOfflineFilesSyncProgress = LibC::GUID.new(0x6931f49a_u32, 0x6fc7_u16, 0x4c1b_u16, StaticArray[0xb2_u8, 0x65_u8, 0x56_u8, 0x79_u8, 0x3f_u8, 0xc4_u8, 0x51_u8, 0xb7_u8])
  struct IOfflineFilesSyncProgress
    lpVtbl : IOfflineFilesSyncProgressVTbl*
  end

  struct IOfflineFilesSyncConflictHandlerVTbl
    query_interface : Proc(IOfflineFilesSyncConflictHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSyncConflictHandler*, UInt32)
    release : Proc(IOfflineFilesSyncConflictHandler*, UInt32)
    resolve_conflict : Proc(IOfflineFilesSyncConflictHandler*, LibC::LPWSTR, UInt32, OFFLINEFILES_SYNC_STATE, UInt32, OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, LibC::LPWSTR*, HRESULT)
  end

  IOfflineFilesSyncConflictHandler_GUID = "b6dd5092-c65c-46b6-97b8-fadd08e7e1be"
  IID_IOfflineFilesSyncConflictHandler = LibC::GUID.new(0xb6dd5092_u32, 0xc65c_u16, 0x46b6_u16, StaticArray[0x97_u8, 0xb8_u8, 0xfa_u8, 0xdd_u8, 0x8_u8, 0xe7_u8, 0xe1_u8, 0xbe_u8])
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

  IOfflineFilesItemFilter_GUID = "f4b5a26c-dc05-4f20-ada4-551f1077be5c"
  IID_IOfflineFilesItemFilter = LibC::GUID.new(0xf4b5a26c_u32, 0xdc05_u16, 0x4f20_u16, StaticArray[0xad_u8, 0xa4_u8, 0x55_u8, 0x1f_u8, 0x10_u8, 0x77_u8, 0xbe_u8, 0x5c_u8])
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

  IOfflineFilesItem_GUID = "4a753da6-e044-4f12-a718-5d14d079a906"
  IID_IOfflineFilesItem = LibC::GUID.new(0x4a753da6_u32, 0xe044_u16, 0x4f12_u16, StaticArray[0xa7_u8, 0x18_u8, 0x5d_u8, 0x14_u8, 0xd0_u8, 0x79_u8, 0xa9_u8, 0x6_u8])
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

  IOfflineFilesServerItem_GUID = "9b1c9576-a92b-4151-8e9e-7c7b3ec2e016"
  IID_IOfflineFilesServerItem = LibC::GUID.new(0x9b1c9576_u32, 0xa92b_u16, 0x4151_u16, StaticArray[0x8e_u8, 0x9e_u8, 0x7c_u8, 0x7b_u8, 0x3e_u8, 0xc2_u8, 0xe0_u8, 0x16_u8])
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

  IOfflineFilesShareItem_GUID = "bab7e48d-4804-41b5-a44d-0f199b06b145"
  IID_IOfflineFilesShareItem = LibC::GUID.new(0xbab7e48d_u32, 0x4804_u16, 0x41b5_u16, StaticArray[0xa4_u8, 0x4d_u8, 0xf_u8, 0x19_u8, 0x9b_u8, 0x6_u8, 0xb1_u8, 0x45_u8])
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

  IOfflineFilesDirectoryItem_GUID = "2273597a-a08c-4a00-a37a-c1ae4e9a1cfd"
  IID_IOfflineFilesDirectoryItem = LibC::GUID.new(0x2273597a_u32, 0xa08c_u16, 0x4a00_u16, StaticArray[0xa3_u8, 0x7a_u8, 0xc1_u8, 0xae_u8, 0x4e_u8, 0x9a_u8, 0x1c_u8, 0xfd_u8])
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

  IOfflineFilesFileItem_GUID = "8dfadead-26c2-4eff-8a72-6b50723d9a00"
  IID_IOfflineFilesFileItem = LibC::GUID.new(0x8dfadead_u32, 0x26c2_u16, 0x4eff_u16, StaticArray[0x8a_u8, 0x72_u8, 0x6b_u8, 0x50_u8, 0x72_u8, 0x3d_u8, 0x9a_u8, 0x0_u8])
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

  IEnumOfflineFilesItems_GUID = "da70e815-c361-4407-bc0b-0d7046e5f2cd"
  IID_IEnumOfflineFilesItems = LibC::GUID.new(0xda70e815_u32, 0xc361_u16, 0x4407_u16, StaticArray[0xbc_u8, 0xb_u8, 0xd_u8, 0x70_u8, 0x46_u8, 0xe5_u8, 0xf2_u8, 0xcd_u8])
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

  IOfflineFilesItemContainer_GUID = "3836f049-9413-45dd-bf46-b5aaa82dc310"
  IID_IOfflineFilesItemContainer = LibC::GUID.new(0x3836f049_u32, 0x9413_u16, 0x45dd_u16, StaticArray[0xbf_u8, 0x46_u8, 0xb5_u8, 0xaa_u8, 0xa8_u8, 0x2d_u8, 0xc3_u8, 0x10_u8])
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

  IOfflineFilesChangeInfo_GUID = "a96e6fa4-e0d1-4c29-960b-ee508fe68c72"
  IID_IOfflineFilesChangeInfo = LibC::GUID.new(0xa96e6fa4_u32, 0xe0d1_u16, 0x4c29_u16, StaticArray[0x96_u8, 0xb_u8, 0xee_u8, 0x50_u8, 0x8f_u8, 0xe6_u8, 0x8c_u8, 0x72_u8])
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

  IOfflineFilesDirtyInfo_GUID = "0f50ce33-bac9-4eaa-a11d-da0e527d047d"
  IID_IOfflineFilesDirtyInfo = LibC::GUID.new(0xf50ce33_u32, 0xbac9_u16, 0x4eaa_u16, StaticArray[0xa1_u8, 0x1d_u8, 0xda_u8, 0xe_u8, 0x52_u8, 0x7d_u8, 0x4_u8, 0x7d_u8])
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

  IOfflineFilesFileSysInfo_GUID = "bc1a163f-7bfd-4d88-9c66-96ea9a6a3d6b"
  IID_IOfflineFilesFileSysInfo = LibC::GUID.new(0xbc1a163f_u32, 0x7bfd_u16, 0x4d88_u16, StaticArray[0x9c_u8, 0x66_u8, 0x96_u8, 0xea_u8, 0x9a_u8, 0x6a_u8, 0x3d_u8, 0x6b_u8])
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

  IOfflineFilesPinInfo_GUID = "5b2b0655-b3fd-497d-adeb-bd156bc8355b"
  IID_IOfflineFilesPinInfo = LibC::GUID.new(0x5b2b0655_u32, 0xb3fd_u16, 0x497d_u16, StaticArray[0xad_u8, 0xeb_u8, 0xbd_u8, 0x15_u8, 0x6b_u8, 0xc8_u8, 0x35_u8, 0x5b_u8])
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

  IOfflineFilesPinInfo2_GUID = "623c58a2-42ed-4ad7-b69a-0f1b30a72d0d"
  IID_IOfflineFilesPinInfo2 = LibC::GUID.new(0x623c58a2_u32, 0x42ed_u16, 0x4ad7_u16, StaticArray[0xb6_u8, 0x9a_u8, 0xf_u8, 0x1b_u8, 0x30_u8, 0xa7_u8, 0x2d_u8, 0xd_u8])
  struct IOfflineFilesPinInfo2
    lpVtbl : IOfflineFilesPinInfo2VTbl*
  end

  struct IOfflineFilesTransparentCacheInfoVTbl
    query_interface : Proc(IOfflineFilesTransparentCacheInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesTransparentCacheInfo*, UInt32)
    release : Proc(IOfflineFilesTransparentCacheInfo*, UInt32)
    is_transparently_cached : Proc(IOfflineFilesTransparentCacheInfo*, LibC::BOOL*, HRESULT)
  end

  IOfflineFilesTransparentCacheInfo_GUID = "bcaf4a01-5b68-4b56-a6a1-8d2786ede8e3"
  IID_IOfflineFilesTransparentCacheInfo = LibC::GUID.new(0xbcaf4a01_u32, 0x5b68_u16, 0x4b56_u16, StaticArray[0xa6_u8, 0xa1_u8, 0x8d_u8, 0x27_u8, 0x86_u8, 0xed_u8, 0xe8_u8, 0xe3_u8])
  struct IOfflineFilesTransparentCacheInfo
    lpVtbl : IOfflineFilesTransparentCacheInfoVTbl*
  end

  struct IOfflineFilesGhostInfoVTbl
    query_interface : Proc(IOfflineFilesGhostInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesGhostInfo*, UInt32)
    release : Proc(IOfflineFilesGhostInfo*, UInt32)
    is_ghosted : Proc(IOfflineFilesGhostInfo*, LibC::BOOL*, HRESULT)
  end

  IOfflineFilesGhostInfo_GUID = "2b09d48c-8ab5-464f-a755-a59d92f99429"
  IID_IOfflineFilesGhostInfo = LibC::GUID.new(0x2b09d48c_u32, 0x8ab5_u16, 0x464f_u16, StaticArray[0xa7_u8, 0x55_u8, 0xa5_u8, 0x9d_u8, 0x92_u8, 0xf9_u8, 0x94_u8, 0x29_u8])
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

  IOfflineFilesConnectionInfo_GUID = "efb23a09-a867-4be8-83a6-86969a7d0856"
  IID_IOfflineFilesConnectionInfo = LibC::GUID.new(0xefb23a09_u32, 0xa867_u16, 0x4be8_u16, StaticArray[0x83_u8, 0xa6_u8, 0x86_u8, 0x96_u8, 0x9a_u8, 0x7d_u8, 0x8_u8, 0x56_u8])
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

  IOfflineFilesShareInfo_GUID = "7bcc43e7-31ce-4ca4-8ccd-1cff2dc494da"
  IID_IOfflineFilesShareInfo = LibC::GUID.new(0x7bcc43e7_u32, 0x31ce_u16, 0x4ca4_u16, StaticArray[0x8c_u8, 0xcd_u8, 0x1c_u8, 0xff_u8, 0x2d_u8, 0xc4_u8, 0x94_u8, 0xda_u8])
  struct IOfflineFilesShareInfo
    lpVtbl : IOfflineFilesShareInfoVTbl*
  end

  struct IOfflineFilesSuspendVTbl
    query_interface : Proc(IOfflineFilesSuspend*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSuspend*, UInt32)
    release : Proc(IOfflineFilesSuspend*, UInt32)
    suspend_root : Proc(IOfflineFilesSuspend*, LibC::BOOL, HRESULT)
  end

  IOfflineFilesSuspend_GUID = "62c4560f-bc0b-48ca-ad9d-34cb528d99a9"
  IID_IOfflineFilesSuspend = LibC::GUID.new(0x62c4560f_u32, 0xbc0b_u16, 0x48ca_u16, StaticArray[0xad_u8, 0x9d_u8, 0x34_u8, 0xcb_u8, 0x52_u8, 0x8d_u8, 0x99_u8, 0xa9_u8])
  struct IOfflineFilesSuspend
    lpVtbl : IOfflineFilesSuspendVTbl*
  end

  struct IOfflineFilesSuspendInfoVTbl
    query_interface : Proc(IOfflineFilesSuspendInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOfflineFilesSuspendInfo*, UInt32)
    release : Proc(IOfflineFilesSuspendInfo*, UInt32)
    is_suspended : Proc(IOfflineFilesSuspendInfo*, LibC::BOOL*, LibC::BOOL*, HRESULT)
  end

  IOfflineFilesSuspendInfo_GUID = "a457c25b-4e9c-4b04-85af-8932ccd97889"
  IID_IOfflineFilesSuspendInfo = LibC::GUID.new(0xa457c25b_u32, 0x4e9c_u16, 0x4b04_u16, StaticArray[0x85_u8, 0xaf_u8, 0x89_u8, 0x32_u8, 0xcc_u8, 0xd9_u8, 0x78_u8, 0x89_u8])
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

  IOfflineFilesSetting_GUID = "d871d3f7-f613-48a1-827e-7a34e560fff6"
  IID_IOfflineFilesSetting = LibC::GUID.new(0xd871d3f7_u32, 0xf613_u16, 0x48a1_u16, StaticArray[0x82_u8, 0x7e_u8, 0x7a_u8, 0x34_u8, 0xe5_u8, 0x60_u8, 0xff_u8, 0xf6_u8])
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

  IEnumOfflineFilesSettings_GUID = "729680c4-1a38-47bc-9e5c-02c51562ac30"
  IID_IEnumOfflineFilesSettings = LibC::GUID.new(0x729680c4_u32, 0x1a38_u16, 0x47bc_u16, StaticArray[0x9e_u8, 0x5c_u8, 0x2_u8, 0xc5_u8, 0x15_u8, 0x62_u8, 0xac_u8, 0x30_u8])
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

  IOfflineFilesCache_GUID = "855d6203-7914-48b9-8d40-4c56f5acffc5"
  IID_IOfflineFilesCache = LibC::GUID.new(0x855d6203_u32, 0x7914_u16, 0x48b9_u16, StaticArray[0x8d_u8, 0x40_u8, 0x4c_u8, 0x56_u8, 0xf5_u8, 0xac_u8, 0xff_u8, 0xc5_u8])
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
  def query_interface(this : IOfflineFilesEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cache_moved(this : IOfflineFilesEvents*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.call(this, pszoldpath, psznewpath)
  end
  def cache_is_full(this : IOfflineFilesEvents*) : HRESULT
    @lpVtbl.value.cache_is_full.call(this)
  end
  def cache_is_corrupted(this : IOfflineFilesEvents*) : HRESULT
    @lpVtbl.value.cache_is_corrupted.call(this)
  end
  def enabled(this : IOfflineFilesEvents*, benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.call(this, benabled)
  end
  def encryption_changed(this : IOfflineFilesEvents*, bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.call(this, bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(this : IOfflineFilesEvents*, rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.call(this, rsyncid)
  end
  def sync_file_result(this : IOfflineFilesEvents*, rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.call(this, rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(this : IOfflineFilesEvents*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(this : IOfflineFilesEvents*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(this : IOfflineFilesEvents*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(this : IOfflineFilesEvents*, rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.call(this, rsyncid, hrresult)
  end
  def net_transport_arrived(this : IOfflineFilesEvents*) : HRESULT
    @lpVtbl.value.net_transport_arrived.call(this)
  end
  def no_net_transports(this : IOfflineFilesEvents*) : HRESULT
    @lpVtbl.value.no_net_transports.call(this)
  end
  def item_disconnected(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.call(this, pszpath, itemtype)
  end
  def item_reconnected(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.call(this, pszpath, itemtype)
  end
  def item_available_offline(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.call(this, pszpath, itemtype)
  end
  def item_not_available_offline(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.call(this, pszpath, itemtype)
  end
  def item_pinned(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.call(this, pszpath, itemtype)
  end
  def item_not_pinned(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.call(this, pszpath, itemtype)
  end
  def item_modified(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.call(this, pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.call(this, pszpath, itemtype)
  end
  def item_deleted_from_cache(this : IOfflineFilesEvents*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.call(this, pszpath, itemtype)
  end
  def item_renamed(this : IOfflineFilesEvents*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.call(this, pszoldpath, psznewpath, itemtype)
  end
  def data_lost(this : IOfflineFilesEvents*) : HRESULT
    @lpVtbl.value.data_lost.call(this)
  end
  def ping(this : IOfflineFilesEvents*) : HRESULT
    @lpVtbl.value.ping.call(this)
  end
end
struct LibWin32::IOfflineFilesEvents2
  def query_interface(this : IOfflineFilesEvents2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesEvents2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesEvents2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cache_moved(this : IOfflineFilesEvents2*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.call(this, pszoldpath, psznewpath)
  end
  def cache_is_full(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.cache_is_full.call(this)
  end
  def cache_is_corrupted(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.cache_is_corrupted.call(this)
  end
  def enabled(this : IOfflineFilesEvents2*, benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.call(this, benabled)
  end
  def encryption_changed(this : IOfflineFilesEvents2*, bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.call(this, bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(this : IOfflineFilesEvents2*, rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.call(this, rsyncid)
  end
  def sync_file_result(this : IOfflineFilesEvents2*, rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.call(this, rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(this : IOfflineFilesEvents2*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(this : IOfflineFilesEvents2*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(this : IOfflineFilesEvents2*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(this : IOfflineFilesEvents2*, rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.call(this, rsyncid, hrresult)
  end
  def net_transport_arrived(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.net_transport_arrived.call(this)
  end
  def no_net_transports(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.no_net_transports.call(this)
  end
  def item_disconnected(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.call(this, pszpath, itemtype)
  end
  def item_reconnected(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.call(this, pszpath, itemtype)
  end
  def item_available_offline(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.call(this, pszpath, itemtype)
  end
  def item_not_available_offline(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.call(this, pszpath, itemtype)
  end
  def item_pinned(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.call(this, pszpath, itemtype)
  end
  def item_not_pinned(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.call(this, pszpath, itemtype)
  end
  def item_modified(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.call(this, pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.call(this, pszpath, itemtype)
  end
  def item_deleted_from_cache(this : IOfflineFilesEvents2*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.call(this, pszpath, itemtype)
  end
  def item_renamed(this : IOfflineFilesEvents2*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.call(this, pszoldpath, psznewpath, itemtype)
  end
  def data_lost(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.data_lost.call(this)
  end
  def ping(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.ping.call(this)
  end
  def item_reconnect_begin(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.item_reconnect_begin.call(this)
  end
  def item_reconnect_end(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.item_reconnect_end.call(this)
  end
  def cache_evict_begin(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.cache_evict_begin.call(this)
  end
  def cache_evict_end(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.cache_evict_end.call(this)
  end
  def background_sync_begin(this : IOfflineFilesEvents2*, dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_begin.call(this, dwsynccontrolflags)
  end
  def background_sync_end(this : IOfflineFilesEvents2*, dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_end.call(this, dwsynccontrolflags)
  end
  def policy_change_detected(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.policy_change_detected.call(this)
  end
  def preference_change_detected(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.preference_change_detected.call(this)
  end
  def settings_changes_applied(this : IOfflineFilesEvents2*) : HRESULT
    @lpVtbl.value.settings_changes_applied.call(this)
  end
end
struct LibWin32::IOfflineFilesEvents3
  def query_interface(this : IOfflineFilesEvents3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesEvents3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesEvents3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cache_moved(this : IOfflineFilesEvents3*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.call(this, pszoldpath, psznewpath)
  end
  def cache_is_full(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.cache_is_full.call(this)
  end
  def cache_is_corrupted(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.cache_is_corrupted.call(this)
  end
  def enabled(this : IOfflineFilesEvents3*, benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.call(this, benabled)
  end
  def encryption_changed(this : IOfflineFilesEvents3*, bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.call(this, bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(this : IOfflineFilesEvents3*, rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.call(this, rsyncid)
  end
  def sync_file_result(this : IOfflineFilesEvents3*, rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.call(this, rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(this : IOfflineFilesEvents3*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(this : IOfflineFilesEvents3*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(this : IOfflineFilesEvents3*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(this : IOfflineFilesEvents3*, rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.call(this, rsyncid, hrresult)
  end
  def net_transport_arrived(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.net_transport_arrived.call(this)
  end
  def no_net_transports(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.no_net_transports.call(this)
  end
  def item_disconnected(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.call(this, pszpath, itemtype)
  end
  def item_reconnected(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.call(this, pszpath, itemtype)
  end
  def item_available_offline(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.call(this, pszpath, itemtype)
  end
  def item_not_available_offline(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.call(this, pszpath, itemtype)
  end
  def item_pinned(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.call(this, pszpath, itemtype)
  end
  def item_not_pinned(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.call(this, pszpath, itemtype)
  end
  def item_modified(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.call(this, pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.call(this, pszpath, itemtype)
  end
  def item_deleted_from_cache(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.call(this, pszpath, itemtype)
  end
  def item_renamed(this : IOfflineFilesEvents3*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.call(this, pszoldpath, psznewpath, itemtype)
  end
  def data_lost(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.data_lost.call(this)
  end
  def ping(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.ping.call(this)
  end
  def item_reconnect_begin(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.item_reconnect_begin.call(this)
  end
  def item_reconnect_end(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.item_reconnect_end.call(this)
  end
  def cache_evict_begin(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.cache_evict_begin.call(this)
  end
  def cache_evict_end(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.cache_evict_end.call(this)
  end
  def background_sync_begin(this : IOfflineFilesEvents3*, dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_begin.call(this, dwsynccontrolflags)
  end
  def background_sync_end(this : IOfflineFilesEvents3*, dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_end.call(this, dwsynccontrolflags)
  end
  def policy_change_detected(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.policy_change_detected.call(this)
  end
  def preference_change_detected(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.preference_change_detected.call(this)
  end
  def settings_changes_applied(this : IOfflineFilesEvents3*) : HRESULT
    @lpVtbl.value.settings_changes_applied.call(this)
  end
  def transparent_cache_item_notify(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, eventtype : OFFLINEFILES_EVENTS, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL, pzsoldpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.transparent_cache_item_notify.call(this, pszpath, eventtype, itemtype, bmodifieddata, bmodifiedattributes, pzsoldpath)
  end
  def prefetch_file_begin(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.prefetch_file_begin.call(this, pszpath)
  end
  def prefetch_file_end(this : IOfflineFilesEvents3*, pszpath : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.prefetch_file_end.call(this, pszpath, hrresult)
  end
end
struct LibWin32::IOfflineFilesEvents4
  def query_interface(this : IOfflineFilesEvents4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesEvents4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesEvents4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cache_moved(this : IOfflineFilesEvents4*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.cache_moved.call(this, pszoldpath, psznewpath)
  end
  def cache_is_full(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.cache_is_full.call(this)
  end
  def cache_is_corrupted(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.cache_is_corrupted.call(this)
  end
  def enabled(this : IOfflineFilesEvents4*, benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enabled.call(this, benabled)
  end
  def encryption_changed(this : IOfflineFilesEvents4*, bwasencrypted : LibC::BOOL, bwaspartial : LibC::BOOL, bisencrypted : LibC::BOOL, bispartial : LibC::BOOL) : HRESULT
    @lpVtbl.value.encryption_changed.call(this, bwasencrypted, bwaspartial, bisencrypted, bispartial)
  end
  def sync_begin(this : IOfflineFilesEvents4*, rsyncid : Guid*) : HRESULT
    @lpVtbl.value.sync_begin.call(this, rsyncid)
  end
  def sync_file_result(this : IOfflineFilesEvents4*, rsyncid : Guid*, pszfile : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_file_result.call(this, rsyncid, pszfile, hrresult)
  end
  def sync_conflict_rec_added(this : IOfflineFilesEvents4*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_added.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_updated(this : IOfflineFilesEvents4*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_updated.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_conflict_rec_removed(this : IOfflineFilesEvents4*, pszconflictpath : LibC::LPWSTR, pftconflictdatetime : FILETIME*, conflictsyncstate : OFFLINEFILES_SYNC_STATE) : HRESULT
    @lpVtbl.value.sync_conflict_rec_removed.call(this, pszconflictpath, pftconflictdatetime, conflictsyncstate)
  end
  def sync_end(this : IOfflineFilesEvents4*, rsyncid : Guid*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.sync_end.call(this, rsyncid, hrresult)
  end
  def net_transport_arrived(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.net_transport_arrived.call(this)
  end
  def no_net_transports(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.no_net_transports.call(this)
  end
  def item_disconnected(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_disconnected.call(this, pszpath, itemtype)
  end
  def item_reconnected(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_reconnected.call(this, pszpath, itemtype)
  end
  def item_available_offline(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_available_offline.call(this, pszpath, itemtype)
  end
  def item_not_available_offline(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_available_offline.call(this, pszpath, itemtype)
  end
  def item_pinned(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_pinned.call(this, pszpath, itemtype)
  end
  def item_not_pinned(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_not_pinned.call(this, pszpath, itemtype)
  end
  def item_modified(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.item_modified.call(this, pszpath, itemtype, bmodifieddata, bmodifiedattributes)
  end
  def item_added_to_cache(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_added_to_cache.call(this, pszpath, itemtype)
  end
  def item_deleted_from_cache(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_deleted_from_cache.call(this, pszpath, itemtype)
  end
  def item_renamed(this : IOfflineFilesEvents4*, pszoldpath : LibC::LPWSTR, psznewpath : LibC::LPWSTR, itemtype : OFFLINEFILES_ITEM_TYPE) : HRESULT
    @lpVtbl.value.item_renamed.call(this, pszoldpath, psznewpath, itemtype)
  end
  def data_lost(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.data_lost.call(this)
  end
  def ping(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.ping.call(this)
  end
  def item_reconnect_begin(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.item_reconnect_begin.call(this)
  end
  def item_reconnect_end(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.item_reconnect_end.call(this)
  end
  def cache_evict_begin(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.cache_evict_begin.call(this)
  end
  def cache_evict_end(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.cache_evict_end.call(this)
  end
  def background_sync_begin(this : IOfflineFilesEvents4*, dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_begin.call(this, dwsynccontrolflags)
  end
  def background_sync_end(this : IOfflineFilesEvents4*, dwsynccontrolflags : UInt32) : HRESULT
    @lpVtbl.value.background_sync_end.call(this, dwsynccontrolflags)
  end
  def policy_change_detected(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.policy_change_detected.call(this)
  end
  def preference_change_detected(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.preference_change_detected.call(this)
  end
  def settings_changes_applied(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.settings_changes_applied.call(this)
  end
  def transparent_cache_item_notify(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, eventtype : OFFLINEFILES_EVENTS, itemtype : OFFLINEFILES_ITEM_TYPE, bmodifieddata : LibC::BOOL, bmodifiedattributes : LibC::BOOL, pzsoldpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.transparent_cache_item_notify.call(this, pszpath, eventtype, itemtype, bmodifieddata, bmodifiedattributes, pzsoldpath)
  end
  def prefetch_file_begin(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.prefetch_file_begin.call(this, pszpath)
  end
  def prefetch_file_end(this : IOfflineFilesEvents4*, pszpath : LibC::LPWSTR, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.prefetch_file_end.call(this, pszpath, hrresult)
  end
  def prefetch_close_handle_begin(this : IOfflineFilesEvents4*) : HRESULT
    @lpVtbl.value.prefetch_close_handle_begin.call(this)
  end
  def prefetch_close_handle_end(this : IOfflineFilesEvents4*, dwclosedhandlecount : UInt32, dwopenhandlecount : UInt32, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.prefetch_close_handle_end.call(this, dwclosedhandlecount, dwopenhandlecount, hrresult)
  end
end
struct LibWin32::IOfflineFilesEventsFilter
  def query_interface(this : IOfflineFilesEventsFilter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesEventsFilter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesEventsFilter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_path_filter(this : IOfflineFilesEventsFilter*, ppszfilter : LibC::LPWSTR*, pmatch : OFFLINEFILES_PATHFILTER_MATCH*) : HRESULT
    @lpVtbl.value.get_path_filter.call(this, ppszfilter, pmatch)
  end
  def get_included_events(this : IOfflineFilesEventsFilter*, celements : UInt32, prgevents : OFFLINEFILES_EVENTS*, pcevents : UInt32*) : HRESULT
    @lpVtbl.value.get_included_events.call(this, celements, prgevents, pcevents)
  end
  def get_excluded_events(this : IOfflineFilesEventsFilter*, celements : UInt32, prgevents : OFFLINEFILES_EVENTS*, pcevents : UInt32*) : HRESULT
    @lpVtbl.value.get_excluded_events.call(this, celements, prgevents, pcevents)
  end
end
struct LibWin32::IOfflineFilesErrorInfo
  def query_interface(this : IOfflineFilesErrorInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesErrorInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesErrorInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_raw_data(this : IOfflineFilesErrorInfo*, ppblob : BYTE_BLOB**) : HRESULT
    @lpVtbl.value.get_raw_data.call(this, ppblob)
  end
  def get_description(this : IOfflineFilesErrorInfo*, ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.call(this, ppszdescription)
  end
end
struct LibWin32::IOfflineFilesSyncErrorItemInfo
  def query_interface(this : IOfflineFilesSyncErrorItemInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSyncErrorItemInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSyncErrorItemInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_file_attributes(this : IOfflineFilesSyncErrorItemInfo*, pdwattributes : UInt32*) : HRESULT
    @lpVtbl.value.get_file_attributes.call(this, pdwattributes)
  end
  def get_file_times(this : IOfflineFilesSyncErrorItemInfo*, pftlastwrite : FILETIME*, pftchange : FILETIME*) : HRESULT
    @lpVtbl.value.get_file_times.call(this, pftlastwrite, pftchange)
  end
  def get_file_size(this : IOfflineFilesSyncErrorItemInfo*, psize : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, psize)
  end
end
struct LibWin32::IOfflineFilesSyncErrorInfo
  def query_interface(this : IOfflineFilesSyncErrorInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSyncErrorInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSyncErrorInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_raw_data(this : IOfflineFilesSyncErrorInfo*, ppblob : BYTE_BLOB**) : HRESULT
    @lpVtbl.value.get_raw_data.call(this, ppblob)
  end
  def get_description(this : IOfflineFilesSyncErrorInfo*, ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.call(this, ppszdescription)
  end
  def get_sync_operation(this : IOfflineFilesSyncErrorInfo*, psyncop : OFFLINEFILES_SYNC_OPERATION*) : HRESULT
    @lpVtbl.value.get_sync_operation.call(this, psyncop)
  end
  def get_item_change_flags(this : IOfflineFilesSyncErrorInfo*, pdwitemchangeflags : UInt32*) : HRESULT
    @lpVtbl.value.get_item_change_flags.call(this, pdwitemchangeflags)
  end
  def info_enumerated(this : IOfflineFilesSyncErrorInfo*, pblocalenumerated : LibC::BOOL*, pbremoteenumerated : LibC::BOOL*, pboriginalenumerated : LibC::BOOL*) : HRESULT
    @lpVtbl.value.info_enumerated.call(this, pblocalenumerated, pbremoteenumerated, pboriginalenumerated)
  end
  def info_available(this : IOfflineFilesSyncErrorInfo*, pblocalinfo : LibC::BOOL*, pbremoteinfo : LibC::BOOL*, pboriginalinfo : LibC::BOOL*) : HRESULT
    @lpVtbl.value.info_available.call(this, pblocalinfo, pbremoteinfo, pboriginalinfo)
  end
  def get_local_info(this : IOfflineFilesSyncErrorInfo*, ppinfo : IOfflineFilesSyncErrorItemInfo*) : HRESULT
    @lpVtbl.value.get_local_info.call(this, ppinfo)
  end
  def get_remote_info(this : IOfflineFilesSyncErrorInfo*, ppinfo : IOfflineFilesSyncErrorItemInfo*) : HRESULT
    @lpVtbl.value.get_remote_info.call(this, ppinfo)
  end
  def get_original_info(this : IOfflineFilesSyncErrorInfo*, ppinfo : IOfflineFilesSyncErrorItemInfo*) : HRESULT
    @lpVtbl.value.get_original_info.call(this, ppinfo)
  end
end
struct LibWin32::IOfflineFilesProgress
  def query_interface(this : IOfflineFilesProgress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesProgress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesProgress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_(this : IOfflineFilesProgress*, pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.begin_.call(this, pbabort)
  end
  def query_abort(this : IOfflineFilesProgress*, pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_abort.call(this, pbabort)
  end
  def end_(this : IOfflineFilesProgress*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.end_.call(this, hrresult)
  end
end
struct LibWin32::IOfflineFilesSimpleProgress
  def query_interface(this : IOfflineFilesSimpleProgress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSimpleProgress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSimpleProgress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_(this : IOfflineFilesSimpleProgress*, pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.begin_.call(this, pbabort)
  end
  def query_abort(this : IOfflineFilesSimpleProgress*, pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_abort.call(this, pbabort)
  end
  def end_(this : IOfflineFilesSimpleProgress*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.end_.call(this, hrresult)
  end
  def item_begin(this : IOfflineFilesSimpleProgress*, pszfile : LibC::LPWSTR, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.item_begin.call(this, pszfile, presponse)
  end
  def item_result(this : IOfflineFilesSimpleProgress*, pszfile : LibC::LPWSTR, hrresult : HRESULT, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.item_result.call(this, pszfile, hrresult, presponse)
  end
end
struct LibWin32::IOfflineFilesSyncProgress
  def query_interface(this : IOfflineFilesSyncProgress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSyncProgress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSyncProgress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_(this : IOfflineFilesSyncProgress*, pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.begin_.call(this, pbabort)
  end
  def query_abort(this : IOfflineFilesSyncProgress*, pbabort : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_abort.call(this, pbabort)
  end
  def end_(this : IOfflineFilesSyncProgress*, hrresult : HRESULT) : HRESULT
    @lpVtbl.value.end_.call(this, hrresult)
  end
  def sync_item_begin(this : IOfflineFilesSyncProgress*, pszfile : LibC::LPWSTR, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.sync_item_begin.call(this, pszfile, presponse)
  end
  def sync_item_result(this : IOfflineFilesSyncProgress*, pszfile : LibC::LPWSTR, hrresult : HRESULT, perrorinfo : IOfflineFilesSyncErrorInfo, presponse : OFFLINEFILES_OP_RESPONSE*) : HRESULT
    @lpVtbl.value.sync_item_result.call(this, pszfile, hrresult, perrorinfo, presponse)
  end
end
struct LibWin32::IOfflineFilesSyncConflictHandler
  def query_interface(this : IOfflineFilesSyncConflictHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSyncConflictHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSyncConflictHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def resolve_conflict(this : IOfflineFilesSyncConflictHandler*, pszpath : LibC::LPWSTR, fstateknown : UInt32, state : OFFLINEFILES_SYNC_STATE, fchangedetails : UInt32, pconflictresolution : OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, ppsznewname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.resolve_conflict.call(this, pszpath, fstateknown, state, fchangedetails, pconflictresolution, ppsznewname)
  end
end
struct LibWin32::IOfflineFilesItemFilter
  def query_interface(this : IOfflineFilesItemFilter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesItemFilter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesItemFilter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_filter_flags(this : IOfflineFilesItemFilter*, pullflags : UInt64*, pullmask : UInt64*) : HRESULT
    @lpVtbl.value.get_filter_flags.call(this, pullflags, pullmask)
  end
  def get_time_filter(this : IOfflineFilesItemFilter*, pfttime : FILETIME*, pbevaltimeofday : LibC::BOOL*, ptimetype : OFFLINEFILES_ITEM_TIME*, pcompare : OFFLINEFILES_COMPARE*) : HRESULT
    @lpVtbl.value.get_time_filter.call(this, pfttime, pbevaltimeofday, ptimetype, pcompare)
  end
  def get_pattern_filter(this : IOfflineFilesItemFilter*, pszpattern : Char*, cchpattern : UInt32) : HRESULT
    @lpVtbl.value.get_pattern_filter.call(this, pszpattern, cchpattern)
  end
end
struct LibWin32::IOfflineFilesItem
  def query_interface(this : IOfflineFilesItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item_type(this : IOfflineFilesItem*, pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.call(this, pitemtype)
  end
  def get_path(this : IOfflineFilesItem*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.call(this, ppszpath)
  end
  def get_parent_item(this : IOfflineFilesItem*, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.call(this, ppitem)
  end
  def refresh(this : IOfflineFilesItem*, dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.call(this, dwqueryflags)
  end
  def is_marked_for_deletion(this : IOfflineFilesItem*, pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.call(this, pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesServerItem
  def query_interface(this : IOfflineFilesServerItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesServerItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesServerItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item_type(this : IOfflineFilesServerItem*, pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.call(this, pitemtype)
  end
  def get_path(this : IOfflineFilesServerItem*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.call(this, ppszpath)
  end
  def get_parent_item(this : IOfflineFilesServerItem*, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.call(this, ppitem)
  end
  def refresh(this : IOfflineFilesServerItem*, dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.call(this, dwqueryflags)
  end
  def is_marked_for_deletion(this : IOfflineFilesServerItem*, pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.call(this, pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesShareItem
  def query_interface(this : IOfflineFilesShareItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesShareItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesShareItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item_type(this : IOfflineFilesShareItem*, pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.call(this, pitemtype)
  end
  def get_path(this : IOfflineFilesShareItem*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.call(this, ppszpath)
  end
  def get_parent_item(this : IOfflineFilesShareItem*, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.call(this, ppitem)
  end
  def refresh(this : IOfflineFilesShareItem*, dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.call(this, dwqueryflags)
  end
  def is_marked_for_deletion(this : IOfflineFilesShareItem*, pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.call(this, pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesDirectoryItem
  def query_interface(this : IOfflineFilesDirectoryItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesDirectoryItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesDirectoryItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item_type(this : IOfflineFilesDirectoryItem*, pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.call(this, pitemtype)
  end
  def get_path(this : IOfflineFilesDirectoryItem*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.call(this, ppszpath)
  end
  def get_parent_item(this : IOfflineFilesDirectoryItem*, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.call(this, ppitem)
  end
  def refresh(this : IOfflineFilesDirectoryItem*, dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.call(this, dwqueryflags)
  end
  def is_marked_for_deletion(this : IOfflineFilesDirectoryItem*, pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.call(this, pbmarkedfordeletion)
  end
end
struct LibWin32::IOfflineFilesFileItem
  def query_interface(this : IOfflineFilesFileItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesFileItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesFileItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item_type(this : IOfflineFilesFileItem*, pitemtype : OFFLINEFILES_ITEM_TYPE*) : HRESULT
    @lpVtbl.value.get_item_type.call(this, pitemtype)
  end
  def get_path(this : IOfflineFilesFileItem*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.call(this, ppszpath)
  end
  def get_parent_item(this : IOfflineFilesFileItem*, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.get_parent_item.call(this, ppitem)
  end
  def refresh(this : IOfflineFilesFileItem*, dwqueryflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.call(this, dwqueryflags)
  end
  def is_marked_for_deletion(this : IOfflineFilesFileItem*, pbmarkedfordeletion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_marked_for_deletion.call(this, pbmarkedfordeletion)
  end
  def is_sparse(this : IOfflineFilesFileItem*, pbissparse : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_sparse.call(this, pbissparse)
  end
  def is_encrypted(this : IOfflineFilesFileItem*, pbisencrypted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_encrypted.call(this, pbisencrypted)
  end
end
struct LibWin32::IEnumOfflineFilesItems
  def query_interface(this : IEnumOfflineFilesItems*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumOfflineFilesItems*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumOfflineFilesItems*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumOfflineFilesItems*, celt : UInt32, rgelt : IOfflineFilesItem*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumOfflineFilesItems*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumOfflineFilesItems*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumOfflineFilesItems*, ppenum : IEnumOfflineFilesItems*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IOfflineFilesItemContainer
  def query_interface(this : IOfflineFilesItemContainer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesItemContainer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesItemContainer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enum_items(this : IOfflineFilesItemContainer*, dwqueryflags : UInt32, ppenum : IEnumOfflineFilesItems*) : HRESULT
    @lpVtbl.value.enum_items.call(this, dwqueryflags, ppenum)
  end
  def enum_items_ex(this : IOfflineFilesItemContainer*, pincludefilefilter : IOfflineFilesItemFilter, pincludedirfilter : IOfflineFilesItemFilter, pexcludefilefilter : IOfflineFilesItemFilter, pexcludedirfilter : IOfflineFilesItemFilter, dwenumflags : UInt32, dwqueryflags : UInt32, ppenum : IEnumOfflineFilesItems*) : HRESULT
    @lpVtbl.value.enum_items_ex.call(this, pincludefilefilter, pincludedirfilter, pexcludefilefilter, pexcludedirfilter, dwenumflags, dwqueryflags, ppenum)
  end
end
struct LibWin32::IOfflineFilesChangeInfo
  def query_interface(this : IOfflineFilesChangeInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesChangeInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesChangeInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_dirty(this : IOfflineFilesChangeInfo*, pbdirty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_dirty.call(this, pbdirty)
  end
  def is_deleted_offline(this : IOfflineFilesChangeInfo*, pbdeletedoffline : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_deleted_offline.call(this, pbdeletedoffline)
  end
  def is_created_offline(this : IOfflineFilesChangeInfo*, pbcreatedoffline : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_created_offline.call(this, pbcreatedoffline)
  end
  def is_locally_modified_data(this : IOfflineFilesChangeInfo*, pblocallymodifieddata : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_locally_modified_data.call(this, pblocallymodifieddata)
  end
  def is_locally_modified_attributes(this : IOfflineFilesChangeInfo*, pblocallymodifiedattributes : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_locally_modified_attributes.call(this, pblocallymodifiedattributes)
  end
  def is_locally_modified_time(this : IOfflineFilesChangeInfo*, pblocallymodifiedtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_locally_modified_time.call(this, pblocallymodifiedtime)
  end
end
struct LibWin32::IOfflineFilesDirtyInfo
  def query_interface(this : IOfflineFilesDirtyInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesDirtyInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesDirtyInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def local_dirty_byte_count(this : IOfflineFilesDirtyInfo*, pdirtybytecount : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.local_dirty_byte_count.call(this, pdirtybytecount)
  end
  def remote_dirty_byte_count(this : IOfflineFilesDirtyInfo*, pdirtybytecount : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.remote_dirty_byte_count.call(this, pdirtybytecount)
  end
end
struct LibWin32::IOfflineFilesFileSysInfo
  def query_interface(this : IOfflineFilesFileSysInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesFileSysInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesFileSysInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_attributes(this : IOfflineFilesFileSysInfo*, copy : OFFLINEFILES_ITEM_COPY, pdwattributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, copy, pdwattributes)
  end
  def get_times(this : IOfflineFilesFileSysInfo*, copy : OFFLINEFILES_ITEM_COPY, pftcreationtime : FILETIME*, pftlastwritetime : FILETIME*, pftchangetime : FILETIME*, pftlastaccesstime : FILETIME*) : HRESULT
    @lpVtbl.value.get_times.call(this, copy, pftcreationtime, pftlastwritetime, pftchangetime, pftlastaccesstime)
  end
  def get_file_size(this : IOfflineFilesFileSysInfo*, copy : OFFLINEFILES_ITEM_COPY, psize : LARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, copy, psize)
  end
end
struct LibWin32::IOfflineFilesPinInfo
  def query_interface(this : IOfflineFilesPinInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesPinInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesPinInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_pinned(this : IOfflineFilesPinInfo*, pbpinned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned.call(this, pbpinned)
  end
  def is_pinned_for_user(this : IOfflineFilesPinInfo*, pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user.call(this, pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_user_by_policy(this : IOfflineFilesPinInfo*, pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user_by_policy.call(this, pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_computer(this : IOfflineFilesPinInfo*, pbpinnedforcomputer : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_computer.call(this, pbpinnedforcomputer, pbinherit)
  end
  def is_pinned_for_folder_redirection(this : IOfflineFilesPinInfo*, pbpinnedforfolderredirection : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_folder_redirection.call(this, pbpinnedforfolderredirection, pbinherit)
  end
end
struct LibWin32::IOfflineFilesPinInfo2
  def query_interface(this : IOfflineFilesPinInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesPinInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesPinInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_pinned(this : IOfflineFilesPinInfo2*, pbpinned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned.call(this, pbpinned)
  end
  def is_pinned_for_user(this : IOfflineFilesPinInfo2*, pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user.call(this, pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_user_by_policy(this : IOfflineFilesPinInfo2*, pbpinnedforuser : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_user_by_policy.call(this, pbpinnedforuser, pbinherit)
  end
  def is_pinned_for_computer(this : IOfflineFilesPinInfo2*, pbpinnedforcomputer : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_computer.call(this, pbpinnedforcomputer, pbinherit)
  end
  def is_pinned_for_folder_redirection(this : IOfflineFilesPinInfo2*, pbpinnedforfolderredirection : LibC::BOOL*, pbinherit : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_pinned_for_folder_redirection.call(this, pbpinnedforfolderredirection, pbinherit)
  end
  def is_partly_pinned(this : IOfflineFilesPinInfo2*, pbpartlypinned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_partly_pinned.call(this, pbpartlypinned)
  end
end
struct LibWin32::IOfflineFilesTransparentCacheInfo
  def query_interface(this : IOfflineFilesTransparentCacheInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesTransparentCacheInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesTransparentCacheInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_transparently_cached(this : IOfflineFilesTransparentCacheInfo*, pbtransparentlycached : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_transparently_cached.call(this, pbtransparentlycached)
  end
end
struct LibWin32::IOfflineFilesGhostInfo
  def query_interface(this : IOfflineFilesGhostInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesGhostInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesGhostInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_ghosted(this : IOfflineFilesGhostInfo*, pbghosted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_ghosted.call(this, pbghosted)
  end
end
struct LibWin32::IOfflineFilesConnectionInfo
  def query_interface(this : IOfflineFilesConnectionInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesConnectionInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesConnectionInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_connect_state(this : IOfflineFilesConnectionInfo*, pconnectstate : OFFLINEFILES_CONNECT_STATE*, pofflinereason : OFFLINEFILES_OFFLINE_REASON*) : HRESULT
    @lpVtbl.value.get_connect_state.call(this, pconnectstate, pofflinereason)
  end
  def set_connect_state(this : IOfflineFilesConnectionInfo*, hwndparent : LibC::HANDLE, dwflags : UInt32, connectstate : OFFLINEFILES_CONNECT_STATE) : HRESULT
    @lpVtbl.value.set_connect_state.call(this, hwndparent, dwflags, connectstate)
  end
  def transition_online(this : IOfflineFilesConnectionInfo*, hwndparent : LibC::HANDLE, dwflags : UInt32) : HRESULT
    @lpVtbl.value.transition_online.call(this, hwndparent, dwflags)
  end
  def transition_offline(this : IOfflineFilesConnectionInfo*, hwndparent : LibC::HANDLE, dwflags : UInt32, bforceopenfilesclosed : LibC::BOOL, pbopenfilespreventedtransition : LibC::BOOL*) : HRESULT
    @lpVtbl.value.transition_offline.call(this, hwndparent, dwflags, bforceopenfilesclosed, pbopenfilespreventedtransition)
  end
end
struct LibWin32::IOfflineFilesShareInfo
  def query_interface(this : IOfflineFilesShareInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesShareInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesShareInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_share_item(this : IOfflineFilesShareInfo*, ppshareitem : IOfflineFilesShareItem*) : HRESULT
    @lpVtbl.value.get_share_item.call(this, ppshareitem)
  end
  def get_share_caching_mode(this : IOfflineFilesShareInfo*, pcachingmode : OFFLINEFILES_CACHING_MODE*) : HRESULT
    @lpVtbl.value.get_share_caching_mode.call(this, pcachingmode)
  end
  def is_share_dfs_junction(this : IOfflineFilesShareInfo*, pbisdfsjunction : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_share_dfs_junction.call(this, pbisdfsjunction)
  end
end
struct LibWin32::IOfflineFilesSuspend
  def query_interface(this : IOfflineFilesSuspend*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSuspend*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSuspend*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def suspend_root(this : IOfflineFilesSuspend*, bsuspend : LibC::BOOL) : HRESULT
    @lpVtbl.value.suspend_root.call(this, bsuspend)
  end
end
struct LibWin32::IOfflineFilesSuspendInfo
  def query_interface(this : IOfflineFilesSuspendInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSuspendInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSuspendInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_suspended(this : IOfflineFilesSuspendInfo*, pbsuspended : LibC::BOOL*, pbsuspendedroot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_suspended.call(this, pbsuspended, pbsuspendedroot)
  end
end
struct LibWin32::IOfflineFilesSetting
  def query_interface(this : IOfflineFilesSetting*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesSetting*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesSetting*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IOfflineFilesSetting*, ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.call(this, ppszname)
  end
  def get_value_type(this : IOfflineFilesSetting*, ptype : OFFLINEFILES_SETTING_VALUE_TYPE*) : HRESULT
    @lpVtbl.value.get_value_type.call(this, ptype)
  end
  def get_preference(this : IOfflineFilesSetting*, pvarvalue : VARIANT*, dwscope : UInt32) : HRESULT
    @lpVtbl.value.get_preference.call(this, pvarvalue, dwscope)
  end
  def get_preference_scope(this : IOfflineFilesSetting*, pdwscope : UInt32*) : HRESULT
    @lpVtbl.value.get_preference_scope.call(this, pdwscope)
  end
  def set_preference(this : IOfflineFilesSetting*, pvarvalue : VARIANT*, dwscope : UInt32) : HRESULT
    @lpVtbl.value.set_preference.call(this, pvarvalue, dwscope)
  end
  def delete_preference(this : IOfflineFilesSetting*, dwscope : UInt32) : HRESULT
    @lpVtbl.value.delete_preference.call(this, dwscope)
  end
  def get_policy(this : IOfflineFilesSetting*, pvarvalue : VARIANT*, dwscope : UInt32) : HRESULT
    @lpVtbl.value.get_policy.call(this, pvarvalue, dwscope)
  end
  def get_policy_scope(this : IOfflineFilesSetting*, pdwscope : UInt32*) : HRESULT
    @lpVtbl.value.get_policy_scope.call(this, pdwscope)
  end
  def get_value(this : IOfflineFilesSetting*, pvarvalue : VARIANT*, pbsetbypolicy : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_value.call(this, pvarvalue, pbsetbypolicy)
  end
end
struct LibWin32::IEnumOfflineFilesSettings
  def query_interface(this : IEnumOfflineFilesSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumOfflineFilesSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumOfflineFilesSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumOfflineFilesSettings*, celt : UInt32, rgelt : IOfflineFilesSetting*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumOfflineFilesSettings*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumOfflineFilesSettings*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumOfflineFilesSettings*, ppenum : IEnumOfflineFilesSettings*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IOfflineFilesCache
  def query_interface(this : IOfflineFilesCache*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesCache*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesCache*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def synchronize(this : IOfflineFilesCache*, hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, basync : LibC::BOOL, dwsynccontrol : UInt32, pisyncconflicthandler : IOfflineFilesSyncConflictHandler, piprogress : IOfflineFilesSyncProgress, psyncid : Guid*) : HRESULT
    @lpVtbl.value.synchronize.call(this, hwndparent, rgpszpaths, cpaths, basync, dwsynccontrol, pisyncconflicthandler, piprogress, psyncid)
  end
  def delete_items(this : IOfflineFilesCache*, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items.call(this, rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def delete_items_for_user(this : IOfflineFilesCache*, pszuser : LibC::LPWSTR, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items_for_user.call(this, pszuser, rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def pin(this : IOfflineFilesCache*, hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.pin.call(this, hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def unpin(this : IOfflineFilesCache*, hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.unpin.call(this, hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def get_encryption_status(this : IOfflineFilesCache*, pbencrypted : LibC::BOOL*, pbpartial : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_encryption_status.call(this, pbencrypted, pbpartial)
  end
  def encrypt(this : IOfflineFilesCache*, hwndparent : LibC::HANDLE, bencrypt : LibC::BOOL, dwencryptioncontrolflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.encrypt.call(this, hwndparent, bencrypt, dwencryptioncontrolflags, basync, piprogress)
  end
  def find_item(this : IOfflineFilesCache*, pszpath : LibC::LPWSTR, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item.call(this, pszpath, dwqueryflags, ppitem)
  end
  def find_item_ex(this : IOfflineFilesCache*, pszpath : LibC::LPWSTR, pincludefilefilter : IOfflineFilesItemFilter, pincludedirfilter : IOfflineFilesItemFilter, pexcludefilefilter : IOfflineFilesItemFilter, pexcludedirfilter : IOfflineFilesItemFilter, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item_ex.call(this, pszpath, pincludefilefilter, pincludedirfilter, pexcludefilefilter, pexcludedirfilter, dwqueryflags, ppitem)
  end
  def rename_item(this : IOfflineFilesCache*, pszpathoriginal : LibC::LPWSTR, pszpathnew : LibC::LPWSTR, breplaceifexists : LibC::BOOL) : HRESULT
    @lpVtbl.value.rename_item.call(this, pszpathoriginal, pszpathnew, breplaceifexists)
  end
  def get_location(this : IOfflineFilesCache*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_location.call(this, ppszpath)
  end
  def get_disk_space_information(this : IOfflineFilesCache*, pcbvolumetotal : UInt64*, pcblimit : UInt64*, pcbused : UInt64*, pcbunpinnedlimit : UInt64*, pcbunpinnedused : UInt64*) : HRESULT
    @lpVtbl.value.get_disk_space_information.call(this, pcbvolumetotal, pcblimit, pcbused, pcbunpinnedlimit, pcbunpinnedused)
  end
  def set_disk_space_limits(this : IOfflineFilesCache*, cblimit : UInt64, cbunpinnedlimit : UInt64) : HRESULT
    @lpVtbl.value.set_disk_space_limits.call(this, cblimit, cbunpinnedlimit)
  end
  def process_admin_pin_policy(this : IOfflineFilesCache*, ppinprogress : IOfflineFilesSyncProgress, punpinprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.process_admin_pin_policy.call(this, ppinprogress, punpinprogress)
  end
  def get_setting_object(this : IOfflineFilesCache*, pszsettingname : LibC::LPWSTR, ppsetting : IOfflineFilesSetting*) : HRESULT
    @lpVtbl.value.get_setting_object.call(this, pszsettingname, ppsetting)
  end
  def enum_setting_objects(this : IOfflineFilesCache*, ppenum : IEnumOfflineFilesSettings*) : HRESULT
    @lpVtbl.value.enum_setting_objects.call(this, ppenum)
  end
  def is_path_cacheable(this : IOfflineFilesCache*, pszpath : LibC::LPWSTR, pbcacheable : LibC::BOOL*, psharecachingmode : OFFLINEFILES_CACHING_MODE*) : HRESULT
    @lpVtbl.value.is_path_cacheable.call(this, pszpath, pbcacheable, psharecachingmode)
  end
end
struct LibWin32::IOfflineFilesCache2
  def query_interface(this : IOfflineFilesCache2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOfflineFilesCache2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOfflineFilesCache2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def synchronize(this : IOfflineFilesCache2*, hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, basync : LibC::BOOL, dwsynccontrol : UInt32, pisyncconflicthandler : IOfflineFilesSyncConflictHandler, piprogress : IOfflineFilesSyncProgress, psyncid : Guid*) : HRESULT
    @lpVtbl.value.synchronize.call(this, hwndparent, rgpszpaths, cpaths, basync, dwsynccontrol, pisyncconflicthandler, piprogress, psyncid)
  end
  def delete_items(this : IOfflineFilesCache2*, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items.call(this, rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def delete_items_for_user(this : IOfflineFilesCache2*, pszuser : LibC::LPWSTR, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, dwflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSimpleProgress) : HRESULT
    @lpVtbl.value.delete_items_for_user.call(this, pszuser, rgpszpaths, cpaths, dwflags, basync, piprogress)
  end
  def pin(this : IOfflineFilesCache2*, hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.pin.call(this, hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def unpin(this : IOfflineFilesCache2*, hwndparent : LibC::HANDLE, rgpszpaths : LibC::LPWSTR*, cpaths : UInt32, bdeep : LibC::BOOL, basync : LibC::BOOL, dwpincontrolflags : UInt32, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.unpin.call(this, hwndparent, rgpszpaths, cpaths, bdeep, basync, dwpincontrolflags, piprogress)
  end
  def get_encryption_status(this : IOfflineFilesCache2*, pbencrypted : LibC::BOOL*, pbpartial : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_encryption_status.call(this, pbencrypted, pbpartial)
  end
  def encrypt(this : IOfflineFilesCache2*, hwndparent : LibC::HANDLE, bencrypt : LibC::BOOL, dwencryptioncontrolflags : UInt32, basync : LibC::BOOL, piprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.encrypt.call(this, hwndparent, bencrypt, dwencryptioncontrolflags, basync, piprogress)
  end
  def find_item(this : IOfflineFilesCache2*, pszpath : LibC::LPWSTR, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item.call(this, pszpath, dwqueryflags, ppitem)
  end
  def find_item_ex(this : IOfflineFilesCache2*, pszpath : LibC::LPWSTR, pincludefilefilter : IOfflineFilesItemFilter, pincludedirfilter : IOfflineFilesItemFilter, pexcludefilefilter : IOfflineFilesItemFilter, pexcludedirfilter : IOfflineFilesItemFilter, dwqueryflags : UInt32, ppitem : IOfflineFilesItem*) : HRESULT
    @lpVtbl.value.find_item_ex.call(this, pszpath, pincludefilefilter, pincludedirfilter, pexcludefilefilter, pexcludedirfilter, dwqueryflags, ppitem)
  end
  def rename_item(this : IOfflineFilesCache2*, pszpathoriginal : LibC::LPWSTR, pszpathnew : LibC::LPWSTR, breplaceifexists : LibC::BOOL) : HRESULT
    @lpVtbl.value.rename_item.call(this, pszpathoriginal, pszpathnew, breplaceifexists)
  end
  def get_location(this : IOfflineFilesCache2*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_location.call(this, ppszpath)
  end
  def get_disk_space_information(this : IOfflineFilesCache2*, pcbvolumetotal : UInt64*, pcblimit : UInt64*, pcbused : UInt64*, pcbunpinnedlimit : UInt64*, pcbunpinnedused : UInt64*) : HRESULT
    @lpVtbl.value.get_disk_space_information.call(this, pcbvolumetotal, pcblimit, pcbused, pcbunpinnedlimit, pcbunpinnedused)
  end
  def set_disk_space_limits(this : IOfflineFilesCache2*, cblimit : UInt64, cbunpinnedlimit : UInt64) : HRESULT
    @lpVtbl.value.set_disk_space_limits.call(this, cblimit, cbunpinnedlimit)
  end
  def process_admin_pin_policy(this : IOfflineFilesCache2*, ppinprogress : IOfflineFilesSyncProgress, punpinprogress : IOfflineFilesSyncProgress) : HRESULT
    @lpVtbl.value.process_admin_pin_policy.call(this, ppinprogress, punpinprogress)
  end
  def get_setting_object(this : IOfflineFilesCache2*, pszsettingname : LibC::LPWSTR, ppsetting : IOfflineFilesSetting*) : HRESULT
    @lpVtbl.value.get_setting_object.call(this, pszsettingname, ppsetting)
  end
  def enum_setting_objects(this : IOfflineFilesCache2*, ppenum : IEnumOfflineFilesSettings*) : HRESULT
    @lpVtbl.value.enum_setting_objects.call(this, ppenum)
  end
  def is_path_cacheable(this : IOfflineFilesCache2*, pszpath : LibC::LPWSTR, pbcacheable : LibC::BOOL*, psharecachingmode : OFFLINEFILES_CACHING_MODE*) : HRESULT
    @lpVtbl.value.is_path_cacheable.call(this, pszpath, pbcacheable, psharecachingmode)
  end
  def rename_item_ex(this : IOfflineFilesCache2*, pszpathoriginal : LibC::LPWSTR, pszpathnew : LibC::LPWSTR, breplaceifexists : LibC::BOOL) : HRESULT
    @lpVtbl.value.rename_item_ex.call(this, pszpathoriginal, pszpathnew, breplaceifexists)
  end
end
