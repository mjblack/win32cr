require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Storage::OfflineFiles
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
  OFFLINEFILES_SETTING_PinLinkTargets = "LinkTargetCaching"
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

  enum OFFLINEFILES_ITEM_TYPE
    OFFLINEFILES_ITEM_TYPE_FILE = 0_i32
    OFFLINEFILES_ITEM_TYPE_DIRECTORY = 1_i32
    OFFLINEFILES_ITEM_TYPE_SHARE = 2_i32
    OFFLINEFILES_ITEM_TYPE_SERVER = 3_i32
  end
  enum OFFLINEFILES_ITEM_COPY
    OFFLINEFILES_ITEM_COPY_LOCAL = 0_i32
    OFFLINEFILES_ITEM_COPY_REMOTE = 1_i32
    OFFLINEFILES_ITEM_COPY_ORIGINAL = 2_i32
  end
  enum OFFLINEFILES_CONNECT_STATE
    OFFLINEFILES_CONNECT_STATE_UNKNOWN = 0_i32
    OFFLINEFILES_CONNECT_STATE_OFFLINE = 1_i32
    OFFLINEFILES_CONNECT_STATE_ONLINE = 2_i32
    OFFLINEFILES_CONNECT_STATE_TRANSPARENTLY_CACHED = 3_i32
    OFFLINEFILES_CONNECT_STATE_PARTLY_TRANSPARENTLY_CACHED = 4_i32
  end
  enum OFFLINEFILES_OFFLINE_REASON
    OFFLINEFILES_OFFLINE_REASON_UNKNOWN = 0_i32
    OFFLINEFILES_OFFLINE_REASON_NOT_APPLICABLE = 1_i32
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_FORCED = 2_i32
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_SLOW = 3_i32
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_ERROR = 4_i32
    OFFLINEFILES_OFFLINE_REASON_ITEM_VERSION_CONFLICT = 5_i32
    OFFLINEFILES_OFFLINE_REASON_ITEM_SUSPENDED = 6_i32
  end
  enum OFFLINEFILES_CACHING_MODE
    OFFLINEFILES_CACHING_MODE_NONE = 0_i32
    OFFLINEFILES_CACHING_MODE_NOCACHING = 1_i32
    OFFLINEFILES_CACHING_MODE_MANUAL = 2_i32
    OFFLINEFILES_CACHING_MODE_AUTO_DOC = 3_i32
    OFFLINEFILES_CACHING_MODE_AUTO_PROGANDDOC = 4_i32
  end
  enum OFFLINEFILES_OP_RESPONSE
    OFFLINEFILES_OP_CONTINUE = 0_i32
    OFFLINEFILES_OP_RETRY = 1_i32
    OFFLINEFILES_OP_ABORT = 2_i32
  end
  enum OFFLINEFILES_EVENTS
    OFFLINEFILES_EVENT_CACHEMOVED = 0_i32
    OFFLINEFILES_EVENT_CACHEISFULL = 1_i32
    OFFLINEFILES_EVENT_CACHEISCORRUPTED = 2_i32
    OFFLINEFILES_EVENT_ENABLED = 3_i32
    OFFLINEFILES_EVENT_ENCRYPTIONCHANGED = 4_i32
    OFFLINEFILES_EVENT_SYNCBEGIN = 5_i32
    OFFLINEFILES_EVENT_SYNCFILERESULT = 6_i32
    OFFLINEFILES_EVENT_SYNCCONFLICTRECADDED = 7_i32
    OFFLINEFILES_EVENT_SYNCCONFLICTRECUPDATED = 8_i32
    OFFLINEFILES_EVENT_SYNCCONFLICTRECREMOVED = 9_i32
    OFFLINEFILES_EVENT_SYNCEND = 10_i32
    OFFLINEFILES_EVENT_BACKGROUNDSYNCBEGIN = 11_i32
    OFFLINEFILES_EVENT_BACKGROUNDSYNCEND = 12_i32
    OFFLINEFILES_EVENT_NETTRANSPORTARRIVED = 13_i32
    OFFLINEFILES_EVENT_NONETTRANSPORTS = 14_i32
    OFFLINEFILES_EVENT_ITEMDISCONNECTED = 15_i32
    OFFLINEFILES_EVENT_ITEMRECONNECTED = 16_i32
    OFFLINEFILES_EVENT_ITEMAVAILABLEOFFLINE = 17_i32
    OFFLINEFILES_EVENT_ITEMNOTAVAILABLEOFFLINE = 18_i32
    OFFLINEFILES_EVENT_ITEMPINNED = 19_i32
    OFFLINEFILES_EVENT_ITEMNOTPINNED = 20_i32
    OFFLINEFILES_EVENT_ITEMMODIFIED = 21_i32
    OFFLINEFILES_EVENT_ITEMADDEDTOCACHE = 22_i32
    OFFLINEFILES_EVENT_ITEMDELETEDFROMCACHE = 23_i32
    OFFLINEFILES_EVENT_ITEMRENAMED = 24_i32
    OFFLINEFILES_EVENT_DATALOST = 25_i32
    OFFLINEFILES_EVENT_PING = 26_i32
    OFFLINEFILES_EVENT_ITEMRECONNECTBEGIN = 27_i32
    OFFLINEFILES_EVENT_ITEMRECONNECTEND = 28_i32
    OFFLINEFILES_EVENT_CACHEEVICTBEGIN = 29_i32
    OFFLINEFILES_EVENT_CACHEEVICTEND = 30_i32
    OFFLINEFILES_EVENT_POLICYCHANGEDETECTED = 31_i32
    OFFLINEFILES_EVENT_PREFERENCECHANGEDETECTED = 32_i32
    OFFLINEFILES_EVENT_SETTINGSCHANGESAPPLIED = 33_i32
    OFFLINEFILES_EVENT_TRANSPARENTCACHEITEMNOTIFY = 34_i32
    OFFLINEFILES_EVENT_PREFETCHFILEBEGIN = 35_i32
    OFFLINEFILES_EVENT_PREFETCHFILEEND = 36_i32
    OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEBEGIN = 37_i32
    OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEEND = 38_i32
    OFFLINEFILES_NUM_EVENTS = 39_i32
  end
  enum OFFLINEFILES_PATHFILTER_MATCH
    OFFLINEFILES_PATHFILTER_SELF = 0_i32
    OFFLINEFILES_PATHFILTER_CHILD = 1_i32
    OFFLINEFILES_PATHFILTER_DESCENDENT = 2_i32
    OFFLINEFILES_PATHFILTER_SELFORCHILD = 3_i32
    OFFLINEFILES_PATHFILTER_SELFORDESCENDENT = 4_i32
  end
  enum OFFLINEFILES_SYNC_CONFLICT_RESOLVE
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NONE = 0_i32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLOCAL = 1_i32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPREMOTE = 2_i32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPALLCHANGES = 3_i32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLATEST = 4_i32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_LOG = 5_i32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_SKIP = 6_i32
    OFFLINEFILES_SYNC_CONFLICT_ABORT = 7_i32
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NUMCODES = 8_i32
  end
  enum OFFLINEFILES_ITEM_TIME
    OFFLINEFILES_ITEM_TIME_CREATION = 0_i32
    OFFLINEFILES_ITEM_TIME_LASTACCESS = 1_i32
    OFFLINEFILES_ITEM_TIME_LASTWRITE = 2_i32
  end
  enum OFFLINEFILES_COMPARE
    OFFLINEFILES_COMPARE_EQ = 0_i32
    OFFLINEFILES_COMPARE_NEQ = 1_i32
    OFFLINEFILES_COMPARE_LT = 2_i32
    OFFLINEFILES_COMPARE_GT = 3_i32
    OFFLINEFILES_COMPARE_LTE = 4_i32
    OFFLINEFILES_COMPARE_GTE = 5_i32
  end
  enum OFFLINEFILES_SETTING_VALUE_TYPE
    OFFLINEFILES_SETTING_VALUE_UI4 = 0_i32
    OFFLINEFILES_SETTING_VALUE_BSTR = 1_i32
    OFFLINEFILES_SETTING_VALUE_BSTR_DBLNULTERM = 2_i32
    OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_UI4 = 3_i32
    OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_BSTR = 4_i32
  end
  enum OFFLINEFILES_SYNC_OPERATION
    OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_SERVER = 0_i32
    OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_CLIENT = 1_i32
    OFFLINEFILES_SYNC_OPERATION_SYNC_TO_SERVER = 2_i32
    OFFLINEFILES_SYNC_OPERATION_SYNC_TO_CLIENT = 3_i32
    OFFLINEFILES_SYNC_OPERATION_DELETE_SERVER_COPY = 4_i32
    OFFLINEFILES_SYNC_OPERATION_DELETE_CLIENT_COPY = 5_i32
    OFFLINEFILES_SYNC_OPERATION_PIN = 6_i32
    OFFLINEFILES_SYNC_OPERATION_PREPARE = 7_i32
  end
  enum OFFLINEFILES_SYNC_STATE
    OFFLINEFILES_SYNC_STATE_Stable = 0_i32
    OFFLINEFILES_SYNC_STATE_FileOnClient_DirOnServer = 1_i32
    OFFLINEFILES_SYNC_STATE_FileOnClient_NoServerCopy = 2_i32
    OFFLINEFILES_SYNC_STATE_DirOnClient_FileOnServer = 3_i32
    OFFLINEFILES_SYNC_STATE_DirOnClient_FileChangedOnServer = 4_i32
    OFFLINEFILES_SYNC_STATE_DirOnClient_NoServerCopy = 5_i32
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_NoServerCopy = 6_i32
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileChangedOnServer = 7_i32
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirChangedOnServer = 8_i32
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileOnServer = 9_i32
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirOnServer = 10_i32
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DeletedOnServer = 11_i32
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer = 12_i32
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirOnServer = 13_i32
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirChangedOnServer = 14_i32
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DeletedOnServer = 15_i32
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_ChangedOnServer = 16_i32
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DeletedOnServer = 17_i32
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirOnServer = 18_i32
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirChangedOnServer = 19_i32
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_NoServerCopy = 20_i32
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirOnServer = 21_i32
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileOnServer = 22_i32
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileChangedOnServer = 23_i32
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirChangedOnServer = 24_i32
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DeletedOnServer = 25_i32
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileOnServer = 26_i32
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileChangedOnServer = 27_i32
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_ChangedOnServer = 28_i32
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_DeletedOnServer = 29_i32
    OFFLINEFILES_SYNC_STATE_NoClientCopy_FileOnServer = 30_i32
    OFFLINEFILES_SYNC_STATE_NoClientCopy_DirOnServer = 31_i32
    OFFLINEFILES_SYNC_STATE_NoClientCopy_FileChangedOnServer = 32_i32
    OFFLINEFILES_SYNC_STATE_NoClientCopy_DirChangedOnServer = 33_i32
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileOnServer = 34_i32
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirOnServer = 35_i32
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileChangedOnServer = 36_i32
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirChangedOnServer = 37_i32
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient = 38_i32
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient = 39_i32
    OFFLINEFILES_SYNC_STATE_FileRenamedOnClient = 40_i32
    OFFLINEFILES_SYNC_STATE_DirSparseOnClient = 41_i32
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient = 42_i32
    OFFLINEFILES_SYNC_STATE_DirRenamedOnClient = 43_i32
    OFFLINEFILES_SYNC_STATE_FileChangedOnServer = 44_i32
    OFFLINEFILES_SYNC_STATE_FileRenamedOnServer = 45_i32
    OFFLINEFILES_SYNC_STATE_FileDeletedOnServer = 46_i32
    OFFLINEFILES_SYNC_STATE_DirChangedOnServer = 47_i32
    OFFLINEFILES_SYNC_STATE_DirRenamedOnServer = 48_i32
    OFFLINEFILES_SYNC_STATE_DirDeletedOnServer = 49_i32
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileOnServer = 50_i32
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileChangedOnServer = 51_i32
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirOnServer = 52_i32
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirChangedOnServer = 53_i32
    OFFLINEFILES_SYNC_STATE_NUMSTATES = 54_i32
  end

  @[Extern]
  record IOfflineFilesEventsVtbl,
    query_interface : Proc(IOfflineFilesEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesEvents*, UInt32),
    release : Proc(IOfflineFilesEvents*, UInt32),
    cache_moved : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    cache_is_full : Proc(IOfflineFilesEvents*, Win32cr::Foundation::HRESULT),
    cache_is_corrupted : Proc(IOfflineFilesEvents*, Win32cr::Foundation::HRESULT),
    enabled : Proc(IOfflineFilesEvents*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    encryption_changed : Proc(IOfflineFilesEvents*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    sync_begin : Proc(IOfflineFilesEvents*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    sync_file_result : Proc(IOfflineFilesEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_added : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_end : Proc(IOfflineFilesEvents*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    net_transport_arrived : Proc(IOfflineFilesEvents*, Win32cr::Foundation::HRESULT),
    no_net_transports : Proc(IOfflineFilesEvents*, Win32cr::Foundation::HRESULT),
    item_disconnected : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_reconnected : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_available_offline : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_available_offline : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_pinned : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_pinned : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_modified : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    item_added_to_cache : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_deleted_from_cache : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_renamed : Proc(IOfflineFilesEvents*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    data_lost : Proc(IOfflineFilesEvents*, Win32cr::Foundation::HRESULT),
    ping : Proc(IOfflineFilesEvents*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e25585c1-0caa-4eb1-873b-1cae5b77c314")]
  record IOfflineFilesEvents, lpVtbl : IOfflineFilesEventsVtbl* do
    GUID = LibC::GUID.new(0xe25585c1_u32, 0xcaa_u16, 0x4eb1_u16, StaticArray[0x87_u8, 0x3b_u8, 0x1c_u8, 0xae_u8, 0x5b_u8, 0x77_u8, 0xc3_u8, 0x14_u8])
    def query_interface(this : IOfflineFilesEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cache_moved(this : IOfflineFilesEvents*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_moved.call(this, pszOldPath, pszNewPath)
    end
    def cache_is_full(this : IOfflineFilesEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_full.call(this)
    end
    def cache_is_corrupted(this : IOfflineFilesEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_corrupted.call(this)
    end
    def enabled(this : IOfflineFilesEvents*, bEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enabled.call(this, bEnabled)
    end
    def encryption_changed(this : IOfflineFilesEvents*, bWasEncrypted : Win32cr::Foundation::BOOL, bWasPartial : Win32cr::Foundation::BOOL, bIsEncrypted : Win32cr::Foundation::BOOL, bIsPartial : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encryption_changed.call(this, bWasEncrypted, bWasPartial, bIsEncrypted, bIsPartial)
    end
    def sync_begin(this : IOfflineFilesEvents*, rSyncId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_begin.call(this, rSyncId)
    end
    def sync_file_result(this : IOfflineFilesEvents*, rSyncId : LibC::GUID*, pszFile : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_file_result.call(this, rSyncId, pszFile, hrResult)
    end
    def sync_conflict_rec_added(this : IOfflineFilesEvents*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_added.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_updated(this : IOfflineFilesEvents*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_updated.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_removed(this : IOfflineFilesEvents*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_removed.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_end(this : IOfflineFilesEvents*, rSyncId : LibC::GUID*, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_end.call(this, rSyncId, hrResult)
    end
    def net_transport_arrived(this : IOfflineFilesEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.net_transport_arrived.call(this)
    end
    def no_net_transports(this : IOfflineFilesEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.no_net_transports.call(this)
    end
    def item_disconnected(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_disconnected.call(this, pszPath, item_type)
    end
    def item_reconnected(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnected.call(this, pszPath, item_type)
    end
    def item_available_offline(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_available_offline.call(this, pszPath, item_type)
    end
    def item_not_available_offline(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_available_offline.call(this, pszPath, item_type)
    end
    def item_pinned(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_pinned.call(this, pszPath, item_type)
    end
    def item_not_pinned(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_pinned.call(this, pszPath, item_type)
    end
    def item_modified(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, bModifiedData : Win32cr::Foundation::BOOL, bModifiedAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_modified.call(this, pszPath, item_type, bModifiedData, bModifiedAttributes)
    end
    def item_added_to_cache(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_added_to_cache.call(this, pszPath, item_type)
    end
    def item_deleted_from_cache(this : IOfflineFilesEvents*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_deleted_from_cache.call(this, pszPath, item_type)
    end
    def item_renamed(this : IOfflineFilesEvents*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_renamed.call(this, pszOldPath, pszNewPath, item_type)
    end
    def data_lost(this : IOfflineFilesEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_lost.call(this)
    end
    def ping(this : IOfflineFilesEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ping.call(this)
    end

  end

  @[Extern]
  record IOfflineFilesEvents2Vtbl,
    query_interface : Proc(IOfflineFilesEvents2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesEvents2*, UInt32),
    release : Proc(IOfflineFilesEvents2*, UInt32),
    cache_moved : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    cache_is_full : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    cache_is_corrupted : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    enabled : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    encryption_changed : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    sync_begin : Proc(IOfflineFilesEvents2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    sync_file_result : Proc(IOfflineFilesEvents2*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_added : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_end : Proc(IOfflineFilesEvents2*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    net_transport_arrived : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    no_net_transports : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    item_disconnected : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_reconnected : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_available_offline : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_available_offline : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_pinned : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_pinned : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_modified : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    item_added_to_cache : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_deleted_from_cache : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_renamed : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    data_lost : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    ping : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    item_reconnect_begin : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    item_reconnect_end : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    cache_evict_begin : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    cache_evict_end : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    background_sync_begin : Proc(IOfflineFilesEvents2*, UInt32, Win32cr::Foundation::HRESULT),
    background_sync_end : Proc(IOfflineFilesEvents2*, UInt32, Win32cr::Foundation::HRESULT),
    policy_change_detected : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    preference_change_detected : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT),
    settings_changes_applied : Proc(IOfflineFilesEvents2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1ead8f56-ff76-4faa-a795-6f6ef792498b")]
  record IOfflineFilesEvents2, lpVtbl : IOfflineFilesEvents2Vtbl* do
    GUID = LibC::GUID.new(0x1ead8f56_u32, 0xff76_u16, 0x4faa_u16, StaticArray[0xa7_u8, 0x95_u8, 0x6f_u8, 0x6e_u8, 0xf7_u8, 0x92_u8, 0x49_u8, 0x8b_u8])
    def query_interface(this : IOfflineFilesEvents2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesEvents2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesEvents2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cache_moved(this : IOfflineFilesEvents2*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_moved.call(this, pszOldPath, pszNewPath)
    end
    def cache_is_full(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_full.call(this)
    end
    def cache_is_corrupted(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_corrupted.call(this)
    end
    def enabled(this : IOfflineFilesEvents2*, bEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enabled.call(this, bEnabled)
    end
    def encryption_changed(this : IOfflineFilesEvents2*, bWasEncrypted : Win32cr::Foundation::BOOL, bWasPartial : Win32cr::Foundation::BOOL, bIsEncrypted : Win32cr::Foundation::BOOL, bIsPartial : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encryption_changed.call(this, bWasEncrypted, bWasPartial, bIsEncrypted, bIsPartial)
    end
    def sync_begin(this : IOfflineFilesEvents2*, rSyncId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_begin.call(this, rSyncId)
    end
    def sync_file_result(this : IOfflineFilesEvents2*, rSyncId : LibC::GUID*, pszFile : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_file_result.call(this, rSyncId, pszFile, hrResult)
    end
    def sync_conflict_rec_added(this : IOfflineFilesEvents2*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_added.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_updated(this : IOfflineFilesEvents2*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_updated.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_removed(this : IOfflineFilesEvents2*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_removed.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_end(this : IOfflineFilesEvents2*, rSyncId : LibC::GUID*, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_end.call(this, rSyncId, hrResult)
    end
    def net_transport_arrived(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.net_transport_arrived.call(this)
    end
    def no_net_transports(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.no_net_transports.call(this)
    end
    def item_disconnected(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_disconnected.call(this, pszPath, item_type)
    end
    def item_reconnected(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnected.call(this, pszPath, item_type)
    end
    def item_available_offline(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_available_offline.call(this, pszPath, item_type)
    end
    def item_not_available_offline(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_available_offline.call(this, pszPath, item_type)
    end
    def item_pinned(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_pinned.call(this, pszPath, item_type)
    end
    def item_not_pinned(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_pinned.call(this, pszPath, item_type)
    end
    def item_modified(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, bModifiedData : Win32cr::Foundation::BOOL, bModifiedAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_modified.call(this, pszPath, item_type, bModifiedData, bModifiedAttributes)
    end
    def item_added_to_cache(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_added_to_cache.call(this, pszPath, item_type)
    end
    def item_deleted_from_cache(this : IOfflineFilesEvents2*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_deleted_from_cache.call(this, pszPath, item_type)
    end
    def item_renamed(this : IOfflineFilesEvents2*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_renamed.call(this, pszOldPath, pszNewPath, item_type)
    end
    def data_lost(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_lost.call(this)
    end
    def ping(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ping.call(this)
    end
    def item_reconnect_begin(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnect_begin.call(this)
    end
    def item_reconnect_end(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnect_end.call(this)
    end
    def cache_evict_begin(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_evict_begin.call(this)
    end
    def cache_evict_end(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_evict_end.call(this)
    end
    def background_sync_begin(this : IOfflineFilesEvents2*, dwSyncControlFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_sync_begin.call(this, dwSyncControlFlags)
    end
    def background_sync_end(this : IOfflineFilesEvents2*, dwSyncControlFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_sync_end.call(this, dwSyncControlFlags)
    end
    def policy_change_detected(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.policy_change_detected.call(this)
    end
    def preference_change_detected(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preference_change_detected.call(this)
    end
    def settings_changes_applied(this : IOfflineFilesEvents2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.settings_changes_applied.call(this)
    end

  end

  @[Extern]
  record IOfflineFilesEvents3Vtbl,
    query_interface : Proc(IOfflineFilesEvents3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesEvents3*, UInt32),
    release : Proc(IOfflineFilesEvents3*, UInt32),
    cache_moved : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    cache_is_full : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    cache_is_corrupted : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    enabled : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    encryption_changed : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    sync_begin : Proc(IOfflineFilesEvents3*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    sync_file_result : Proc(IOfflineFilesEvents3*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_added : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_end : Proc(IOfflineFilesEvents3*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    net_transport_arrived : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    no_net_transports : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    item_disconnected : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_reconnected : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_available_offline : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_available_offline : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_pinned : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_pinned : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_modified : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    item_added_to_cache : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_deleted_from_cache : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_renamed : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    data_lost : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    ping : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    item_reconnect_begin : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    item_reconnect_end : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    cache_evict_begin : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    cache_evict_end : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    background_sync_begin : Proc(IOfflineFilesEvents3*, UInt32, Win32cr::Foundation::HRESULT),
    background_sync_end : Proc(IOfflineFilesEvents3*, UInt32, Win32cr::Foundation::HRESULT),
    policy_change_detected : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    preference_change_detected : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    settings_changes_applied : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::HRESULT),
    transparent_cache_item_notify : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    prefetch_file_begin : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    prefetch_file_end : Proc(IOfflineFilesEvents3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9ba04a45-ee69-42f0-9ab1-7db5c8805808")]
  record IOfflineFilesEvents3, lpVtbl : IOfflineFilesEvents3Vtbl* do
    GUID = LibC::GUID.new(0x9ba04a45_u32, 0xee69_u16, 0x42f0_u16, StaticArray[0x9a_u8, 0xb1_u8, 0x7d_u8, 0xb5_u8, 0xc8_u8, 0x80_u8, 0x58_u8, 0x8_u8])
    def query_interface(this : IOfflineFilesEvents3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesEvents3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesEvents3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cache_moved(this : IOfflineFilesEvents3*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_moved.call(this, pszOldPath, pszNewPath)
    end
    def cache_is_full(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_full.call(this)
    end
    def cache_is_corrupted(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_corrupted.call(this)
    end
    def enabled(this : IOfflineFilesEvents3*, bEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enabled.call(this, bEnabled)
    end
    def encryption_changed(this : IOfflineFilesEvents3*, bWasEncrypted : Win32cr::Foundation::BOOL, bWasPartial : Win32cr::Foundation::BOOL, bIsEncrypted : Win32cr::Foundation::BOOL, bIsPartial : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encryption_changed.call(this, bWasEncrypted, bWasPartial, bIsEncrypted, bIsPartial)
    end
    def sync_begin(this : IOfflineFilesEvents3*, rSyncId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_begin.call(this, rSyncId)
    end
    def sync_file_result(this : IOfflineFilesEvents3*, rSyncId : LibC::GUID*, pszFile : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_file_result.call(this, rSyncId, pszFile, hrResult)
    end
    def sync_conflict_rec_added(this : IOfflineFilesEvents3*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_added.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_updated(this : IOfflineFilesEvents3*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_updated.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_removed(this : IOfflineFilesEvents3*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_removed.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_end(this : IOfflineFilesEvents3*, rSyncId : LibC::GUID*, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_end.call(this, rSyncId, hrResult)
    end
    def net_transport_arrived(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.net_transport_arrived.call(this)
    end
    def no_net_transports(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.no_net_transports.call(this)
    end
    def item_disconnected(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_disconnected.call(this, pszPath, item_type)
    end
    def item_reconnected(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnected.call(this, pszPath, item_type)
    end
    def item_available_offline(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_available_offline.call(this, pszPath, item_type)
    end
    def item_not_available_offline(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_available_offline.call(this, pszPath, item_type)
    end
    def item_pinned(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_pinned.call(this, pszPath, item_type)
    end
    def item_not_pinned(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_pinned.call(this, pszPath, item_type)
    end
    def item_modified(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, bModifiedData : Win32cr::Foundation::BOOL, bModifiedAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_modified.call(this, pszPath, item_type, bModifiedData, bModifiedAttributes)
    end
    def item_added_to_cache(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_added_to_cache.call(this, pszPath, item_type)
    end
    def item_deleted_from_cache(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_deleted_from_cache.call(this, pszPath, item_type)
    end
    def item_renamed(this : IOfflineFilesEvents3*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_renamed.call(this, pszOldPath, pszNewPath, item_type)
    end
    def data_lost(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_lost.call(this)
    end
    def ping(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ping.call(this)
    end
    def item_reconnect_begin(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnect_begin.call(this)
    end
    def item_reconnect_end(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnect_end.call(this)
    end
    def cache_evict_begin(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_evict_begin.call(this)
    end
    def cache_evict_end(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_evict_end.call(this)
    end
    def background_sync_begin(this : IOfflineFilesEvents3*, dwSyncControlFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_sync_begin.call(this, dwSyncControlFlags)
    end
    def background_sync_end(this : IOfflineFilesEvents3*, dwSyncControlFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_sync_end.call(this, dwSyncControlFlags)
    end
    def policy_change_detected(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.policy_change_detected.call(this)
    end
    def preference_change_detected(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preference_change_detected.call(this)
    end
    def settings_changes_applied(this : IOfflineFilesEvents3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.settings_changes_applied.call(this)
    end
    def transparent_cache_item_notify(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, event_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, bModifiedData : Win32cr::Foundation::BOOL, bModifiedAttributes : Win32cr::Foundation::BOOL, pzsOldPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transparent_cache_item_notify.call(this, pszPath, event_type, item_type, bModifiedData, bModifiedAttributes, pzsOldPath)
    end
    def prefetch_file_begin(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prefetch_file_begin.call(this, pszPath)
    end
    def prefetch_file_end(this : IOfflineFilesEvents3*, pszPath : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prefetch_file_end.call(this, pszPath, hrResult)
    end

  end

  @[Extern]
  record IOfflineFilesEvents4Vtbl,
    query_interface : Proc(IOfflineFilesEvents4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesEvents4*, UInt32),
    release : Proc(IOfflineFilesEvents4*, UInt32),
    cache_moved : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    cache_is_full : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    cache_is_corrupted : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    enabled : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    encryption_changed : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    sync_begin : Proc(IOfflineFilesEvents4*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    sync_file_result : Proc(IOfflineFilesEvents4*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_added : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_updated : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_conflict_rec_removed : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, Win32cr::Foundation::HRESULT),
    sync_end : Proc(IOfflineFilesEvents4*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    net_transport_arrived : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    no_net_transports : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    item_disconnected : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_reconnected : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_available_offline : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_available_offline : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_pinned : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_not_pinned : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_modified : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    item_added_to_cache : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_deleted_from_cache : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    item_renamed : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::HRESULT),
    data_lost : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    ping : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    item_reconnect_begin : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    item_reconnect_end : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    cache_evict_begin : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    cache_evict_end : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    background_sync_begin : Proc(IOfflineFilesEvents4*, UInt32, Win32cr::Foundation::HRESULT),
    background_sync_end : Proc(IOfflineFilesEvents4*, UInt32, Win32cr::Foundation::HRESULT),
    policy_change_detected : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    preference_change_detected : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    settings_changes_applied : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    transparent_cache_item_notify : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    prefetch_file_begin : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    prefetch_file_end : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    prefetch_close_handle_begin : Proc(IOfflineFilesEvents4*, Win32cr::Foundation::HRESULT),
    prefetch_close_handle_end : Proc(IOfflineFilesEvents4*, UInt32, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dbd69b1e-c7d2-473e-b35f-9d8c24c0c484")]
  record IOfflineFilesEvents4, lpVtbl : IOfflineFilesEvents4Vtbl* do
    GUID = LibC::GUID.new(0xdbd69b1e_u32, 0xc7d2_u16, 0x473e_u16, StaticArray[0xb3_u8, 0x5f_u8, 0x9d_u8, 0x8c_u8, 0x24_u8, 0xc0_u8, 0xc4_u8, 0x84_u8])
    def query_interface(this : IOfflineFilesEvents4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesEvents4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesEvents4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cache_moved(this : IOfflineFilesEvents4*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_moved.call(this, pszOldPath, pszNewPath)
    end
    def cache_is_full(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_full.call(this)
    end
    def cache_is_corrupted(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_is_corrupted.call(this)
    end
    def enabled(this : IOfflineFilesEvents4*, bEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enabled.call(this, bEnabled)
    end
    def encryption_changed(this : IOfflineFilesEvents4*, bWasEncrypted : Win32cr::Foundation::BOOL, bWasPartial : Win32cr::Foundation::BOOL, bIsEncrypted : Win32cr::Foundation::BOOL, bIsPartial : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encryption_changed.call(this, bWasEncrypted, bWasPartial, bIsEncrypted, bIsPartial)
    end
    def sync_begin(this : IOfflineFilesEvents4*, rSyncId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_begin.call(this, rSyncId)
    end
    def sync_file_result(this : IOfflineFilesEvents4*, rSyncId : LibC::GUID*, pszFile : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_file_result.call(this, rSyncId, pszFile, hrResult)
    end
    def sync_conflict_rec_added(this : IOfflineFilesEvents4*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_added.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_updated(this : IOfflineFilesEvents4*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_updated.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_conflict_rec_removed(this : IOfflineFilesEvents4*, pszConflictPath : Win32cr::Foundation::PWSTR, pftConflictDateTime : Win32cr::Foundation::FILETIME*, conflict_sync_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_conflict_rec_removed.call(this, pszConflictPath, pftConflictDateTime, conflict_sync_state)
    end
    def sync_end(this : IOfflineFilesEvents4*, rSyncId : LibC::GUID*, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_end.call(this, rSyncId, hrResult)
    end
    def net_transport_arrived(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.net_transport_arrived.call(this)
    end
    def no_net_transports(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.no_net_transports.call(this)
    end
    def item_disconnected(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_disconnected.call(this, pszPath, item_type)
    end
    def item_reconnected(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnected.call(this, pszPath, item_type)
    end
    def item_available_offline(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_available_offline.call(this, pszPath, item_type)
    end
    def item_not_available_offline(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_available_offline.call(this, pszPath, item_type)
    end
    def item_pinned(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_pinned.call(this, pszPath, item_type)
    end
    def item_not_pinned(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_not_pinned.call(this, pszPath, item_type)
    end
    def item_modified(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, bModifiedData : Win32cr::Foundation::BOOL, bModifiedAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_modified.call(this, pszPath, item_type, bModifiedData, bModifiedAttributes)
    end
    def item_added_to_cache(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_added_to_cache.call(this, pszPath, item_type)
    end
    def item_deleted_from_cache(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_deleted_from_cache.call(this, pszPath, item_type)
    end
    def item_renamed(this : IOfflineFilesEvents4*, pszOldPath : Win32cr::Foundation::PWSTR, pszNewPath : Win32cr::Foundation::PWSTR, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_renamed.call(this, pszOldPath, pszNewPath, item_type)
    end
    def data_lost(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_lost.call(this)
    end
    def ping(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ping.call(this)
    end
    def item_reconnect_begin(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnect_begin.call(this)
    end
    def item_reconnect_end(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_reconnect_end.call(this)
    end
    def cache_evict_begin(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_evict_begin.call(this)
    end
    def cache_evict_end(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_evict_end.call(this)
    end
    def background_sync_begin(this : IOfflineFilesEvents4*, dwSyncControlFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_sync_begin.call(this, dwSyncControlFlags)
    end
    def background_sync_end(this : IOfflineFilesEvents4*, dwSyncControlFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_sync_end.call(this, dwSyncControlFlags)
    end
    def policy_change_detected(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.policy_change_detected.call(this)
    end
    def preference_change_detected(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preference_change_detected.call(this)
    end
    def settings_changes_applied(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.settings_changes_applied.call(this)
    end
    def transparent_cache_item_notify(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, event_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS, item_type : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE, bModifiedData : Win32cr::Foundation::BOOL, bModifiedAttributes : Win32cr::Foundation::BOOL, pzsOldPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transparent_cache_item_notify.call(this, pszPath, event_type, item_type, bModifiedData, bModifiedAttributes, pzsOldPath)
    end
    def prefetch_file_begin(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prefetch_file_begin.call(this, pszPath)
    end
    def prefetch_file_end(this : IOfflineFilesEvents4*, pszPath : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prefetch_file_end.call(this, pszPath, hrResult)
    end
    def prefetch_close_handle_begin(this : IOfflineFilesEvents4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prefetch_close_handle_begin.call(this)
    end
    def prefetch_close_handle_end(this : IOfflineFilesEvents4*, dwClosedHandleCount : UInt32, dwOpenHandleCount : UInt32, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prefetch_close_handle_end.call(this, dwClosedHandleCount, dwOpenHandleCount, hrResult)
    end

  end

  @[Extern]
  record IOfflineFilesEventsFilterVtbl,
    query_interface : Proc(IOfflineFilesEventsFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesEventsFilter*, UInt32),
    release : Proc(IOfflineFilesEventsFilter*, UInt32),
    get_path_filter : Proc(IOfflineFilesEventsFilter*, Win32cr::Foundation::PWSTR*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_PATHFILTER_MATCH*, Win32cr::Foundation::HRESULT),
    get_included_events : Proc(IOfflineFilesEventsFilter*, UInt32, Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS*, UInt32*, Win32cr::Foundation::HRESULT),
    get_excluded_events : Proc(IOfflineFilesEventsFilter*, UInt32, Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("33fc4e1b-0716-40fa-ba65-6e62a84a846f")]
  record IOfflineFilesEventsFilter, lpVtbl : IOfflineFilesEventsFilterVtbl* do
    GUID = LibC::GUID.new(0x33fc4e1b_u32, 0x716_u16, 0x40fa_u16, StaticArray[0xba_u8, 0x65_u8, 0x6e_u8, 0x62_u8, 0xa8_u8, 0x4a_u8, 0x84_u8, 0x6f_u8])
    def query_interface(this : IOfflineFilesEventsFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesEventsFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesEventsFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_path_filter(this : IOfflineFilesEventsFilter*, ppszFilter : Win32cr::Foundation::PWSTR*, pMatch : Win32cr::Storage::OfflineFiles::OFFLINEFILES_PATHFILTER_MATCH*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path_filter.call(this, ppszFilter, pMatch)
    end
    def get_included_events(this : IOfflineFilesEventsFilter*, cElements : UInt32, prgEvents : Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS*, pcEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_included_events.call(this, cElements, prgEvents, pcEvents)
    end
    def get_excluded_events(this : IOfflineFilesEventsFilter*, cElements : UInt32, prgEvents : Win32cr::Storage::OfflineFiles::OFFLINEFILES_EVENTS*, pcEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_excluded_events.call(this, cElements, prgEvents, pcEvents)
    end

  end

  @[Extern]
  record IOfflineFilesErrorInfoVtbl,
    query_interface : Proc(IOfflineFilesErrorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesErrorInfo*, UInt32),
    release : Proc(IOfflineFilesErrorInfo*, UInt32),
    get_raw_data : Proc(IOfflineFilesErrorInfo*, Win32cr::System::Com::BYTE_BLOB**, Win32cr::Foundation::HRESULT),
    get_description : Proc(IOfflineFilesErrorInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7112fa5f-7571-435a-8eb7-195c7c1429bc")]
  record IOfflineFilesErrorInfo, lpVtbl : IOfflineFilesErrorInfoVtbl* do
    GUID = LibC::GUID.new(0x7112fa5f_u32, 0x7571_u16, 0x435a_u16, StaticArray[0x8e_u8, 0xb7_u8, 0x19_u8, 0x5c_u8, 0x7c_u8, 0x14_u8, 0x29_u8, 0xbc_u8])
    def query_interface(this : IOfflineFilesErrorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesErrorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesErrorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_raw_data(this : IOfflineFilesErrorInfo*, ppBlob : Win32cr::System::Com::BYTE_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_raw_data.call(this, ppBlob)
    end
    def get_description(this : IOfflineFilesErrorInfo*, ppszDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, ppszDescription)
    end

  end

  @[Extern]
  record IOfflineFilesSyncErrorItemInfoVtbl,
    query_interface : Proc(IOfflineFilesSyncErrorItemInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSyncErrorItemInfo*, UInt32),
    release : Proc(IOfflineFilesSyncErrorItemInfo*, UInt32),
    get_file_attributes : Proc(IOfflineFilesSyncErrorItemInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_times : Proc(IOfflineFilesSyncErrorItemInfo*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_file_size : Proc(IOfflineFilesSyncErrorItemInfo*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ecdbaf0d-6a18-4d55-8017-108f7660ba44")]
  record IOfflineFilesSyncErrorItemInfo, lpVtbl : IOfflineFilesSyncErrorItemInfoVtbl* do
    GUID = LibC::GUID.new(0xecdbaf0d_u32, 0x6a18_u16, 0x4d55_u16, StaticArray[0x80_u8, 0x17_u8, 0x10_u8, 0x8f_u8, 0x76_u8, 0x60_u8, 0xba_u8, 0x44_u8])
    def query_interface(this : IOfflineFilesSyncErrorItemInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSyncErrorItemInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSyncErrorItemInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_file_attributes(this : IOfflineFilesSyncErrorItemInfo*, pdwAttributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_attributes.call(this, pdwAttributes)
    end
    def get_file_times(this : IOfflineFilesSyncErrorItemInfo*, pftLastWrite : Win32cr::Foundation::FILETIME*, pftChange : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_times.call(this, pftLastWrite, pftChange)
    end
    def get_file_size(this : IOfflineFilesSyncErrorItemInfo*, pSize : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, pSize)
    end

  end

  @[Extern]
  record IOfflineFilesSyncErrorInfoVtbl,
    query_interface : Proc(IOfflineFilesSyncErrorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSyncErrorInfo*, UInt32),
    release : Proc(IOfflineFilesSyncErrorInfo*, UInt32),
    get_raw_data : Proc(IOfflineFilesSyncErrorInfo*, Win32cr::System::Com::BYTE_BLOB**, Win32cr::Foundation::HRESULT),
    get_description : Proc(IOfflineFilesSyncErrorInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sync_operation : Proc(IOfflineFilesSyncErrorInfo*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_OPERATION*, Win32cr::Foundation::HRESULT),
    get_item_change_flags : Proc(IOfflineFilesSyncErrorInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    info_enumerated : Proc(IOfflineFilesSyncErrorInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    info_available : Proc(IOfflineFilesSyncErrorInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_local_info : Proc(IOfflineFilesSyncErrorInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_remote_info : Proc(IOfflineFilesSyncErrorInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_original_info : Proc(IOfflineFilesSyncErrorInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("59f95e46-eb54-49d1-be76-de95458d01b0")]
  record IOfflineFilesSyncErrorInfo, lpVtbl : IOfflineFilesSyncErrorInfoVtbl* do
    GUID = LibC::GUID.new(0x59f95e46_u32, 0xeb54_u16, 0x49d1_u16, StaticArray[0xbe_u8, 0x76_u8, 0xde_u8, 0x95_u8, 0x45_u8, 0x8d_u8, 0x1_u8, 0xb0_u8])
    def query_interface(this : IOfflineFilesSyncErrorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSyncErrorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSyncErrorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_raw_data(this : IOfflineFilesSyncErrorInfo*, ppBlob : Win32cr::System::Com::BYTE_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_raw_data.call(this, ppBlob)
    end
    def get_description(this : IOfflineFilesSyncErrorInfo*, ppszDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, ppszDescription)
    end
    def get_sync_operation(this : IOfflineFilesSyncErrorInfo*, pSyncOp : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_operation.call(this, pSyncOp)
    end
    def get_item_change_flags(this : IOfflineFilesSyncErrorInfo*, pdwItemChangeFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_change_flags.call(this, pdwItemChangeFlags)
    end
    def info_enumerated(this : IOfflineFilesSyncErrorInfo*, pbLocalEnumerated : Win32cr::Foundation::BOOL*, pbRemoteEnumerated : Win32cr::Foundation::BOOL*, pbOriginalEnumerated : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.info_enumerated.call(this, pbLocalEnumerated, pbRemoteEnumerated, pbOriginalEnumerated)
    end
    def info_available(this : IOfflineFilesSyncErrorInfo*, pbLocalInfo : Win32cr::Foundation::BOOL*, pbRemoteInfo : Win32cr::Foundation::BOOL*, pbOriginalInfo : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.info_available.call(this, pbLocalInfo, pbRemoteInfo, pbOriginalInfo)
    end
    def get_local_info(this : IOfflineFilesSyncErrorInfo*, ppInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_info.call(this, ppInfo)
    end
    def get_remote_info(this : IOfflineFilesSyncErrorInfo*, ppInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_info.call(this, ppInfo)
    end
    def get_original_info(this : IOfflineFilesSyncErrorInfo*, ppInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_original_info.call(this, ppInfo)
    end

  end

  @[Extern]
  record IOfflineFilesProgressVtbl,
    query_interface : Proc(IOfflineFilesProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesProgress*, UInt32),
    release : Proc(IOfflineFilesProgress*, UInt32),
    begin__ : Proc(IOfflineFilesProgress*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    query_abort : Proc(IOfflineFilesProgress*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    end__ : Proc(IOfflineFilesProgress*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fad63237-c55b-4911-9850-bcf96d4c979e")]
  record IOfflineFilesProgress, lpVtbl : IOfflineFilesProgressVtbl* do
    GUID = LibC::GUID.new(0xfad63237_u32, 0xc55b_u16, 0x4911_u16, StaticArray[0x98_u8, 0x50_u8, 0xbc_u8, 0xf9_u8, 0x6d_u8, 0x4c_u8, 0x97_u8, 0x9e_u8])
    def query_interface(this : IOfflineFilesProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin__(this : IOfflineFilesProgress*, pbAbort : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin__.call(this, pbAbort)
    end
    def query_abort(this : IOfflineFilesProgress*, pbAbort : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_abort.call(this, pbAbort)
    end
    def end__(this : IOfflineFilesProgress*, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this, hrResult)
    end

  end

  @[Extern]
  record IOfflineFilesSimpleProgressVtbl,
    query_interface : Proc(IOfflineFilesSimpleProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSimpleProgress*, UInt32),
    release : Proc(IOfflineFilesSimpleProgress*, UInt32),
    begin__ : Proc(IOfflineFilesSimpleProgress*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    query_abort : Proc(IOfflineFilesSimpleProgress*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    end__ : Proc(IOfflineFilesSimpleProgress*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    item_begin : Proc(IOfflineFilesSimpleProgress*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*, Win32cr::Foundation::HRESULT),
    item_result : Proc(IOfflineFilesSimpleProgress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c34f7f9b-c43d-4f9d-a776-c0eb6de5d401")]
  record IOfflineFilesSimpleProgress, lpVtbl : IOfflineFilesSimpleProgressVtbl* do
    GUID = LibC::GUID.new(0xc34f7f9b_u32, 0xc43d_u16, 0x4f9d_u16, StaticArray[0xa7_u8, 0x76_u8, 0xc0_u8, 0xeb_u8, 0x6d_u8, 0xe5_u8, 0xd4_u8, 0x1_u8])
    def query_interface(this : IOfflineFilesSimpleProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSimpleProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSimpleProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin__(this : IOfflineFilesSimpleProgress*, pbAbort : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin__.call(this, pbAbort)
    end
    def query_abort(this : IOfflineFilesSimpleProgress*, pbAbort : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_abort.call(this, pbAbort)
    end
    def end__(this : IOfflineFilesSimpleProgress*, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this, hrResult)
    end
    def item_begin(this : IOfflineFilesSimpleProgress*, pszFile : Win32cr::Foundation::PWSTR, pResponse : Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_begin.call(this, pszFile, pResponse)
    end
    def item_result(this : IOfflineFilesSimpleProgress*, pszFile : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT, pResponse : Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_result.call(this, pszFile, hrResult, pResponse)
    end

  end

  @[Extern]
  record IOfflineFilesSyncProgressVtbl,
    query_interface : Proc(IOfflineFilesSyncProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSyncProgress*, UInt32),
    release : Proc(IOfflineFilesSyncProgress*, UInt32),
    begin__ : Proc(IOfflineFilesSyncProgress*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    query_abort : Proc(IOfflineFilesSyncProgress*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    end__ : Proc(IOfflineFilesSyncProgress*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    sync_item_begin : Proc(IOfflineFilesSyncProgress*, Win32cr::Foundation::PWSTR, Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*, Win32cr::Foundation::HRESULT),
    sync_item_result : Proc(IOfflineFilesSyncProgress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Void*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6931f49a-6fc7-4c1b-b265-56793fc451b7")]
  record IOfflineFilesSyncProgress, lpVtbl : IOfflineFilesSyncProgressVtbl* do
    GUID = LibC::GUID.new(0x6931f49a_u32, 0x6fc7_u16, 0x4c1b_u16, StaticArray[0xb2_u8, 0x65_u8, 0x56_u8, 0x79_u8, 0x3f_u8, 0xc4_u8, 0x51_u8, 0xb7_u8])
    def query_interface(this : IOfflineFilesSyncProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSyncProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSyncProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin__(this : IOfflineFilesSyncProgress*, pbAbort : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin__.call(this, pbAbort)
    end
    def query_abort(this : IOfflineFilesSyncProgress*, pbAbort : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_abort.call(this, pbAbort)
    end
    def end__(this : IOfflineFilesSyncProgress*, hrResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this, hrResult)
    end
    def sync_item_begin(this : IOfflineFilesSyncProgress*, pszFile : Win32cr::Foundation::PWSTR, pResponse : Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_item_begin.call(this, pszFile, pResponse)
    end
    def sync_item_result(this : IOfflineFilesSyncProgress*, pszFile : Win32cr::Foundation::PWSTR, hrResult : Win32cr::Foundation::HRESULT, pErrorInfo : Void*, pResponse : Win32cr::Storage::OfflineFiles::OFFLINEFILES_OP_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_item_result.call(this, pszFile, hrResult, pErrorInfo, pResponse)
    end

  end

  @[Extern]
  record IOfflineFilesSyncConflictHandlerVtbl,
    query_interface : Proc(IOfflineFilesSyncConflictHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSyncConflictHandler*, UInt32),
    release : Proc(IOfflineFilesSyncConflictHandler*, UInt32),
    resolve_conflict : Proc(IOfflineFilesSyncConflictHandler*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, UInt32, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b6dd5092-c65c-46b6-97b8-fadd08e7e1be")]
  record IOfflineFilesSyncConflictHandler, lpVtbl : IOfflineFilesSyncConflictHandlerVtbl* do
    GUID = LibC::GUID.new(0xb6dd5092_u32, 0xc65c_u16, 0x46b6_u16, StaticArray[0x97_u8, 0xb8_u8, 0xfa_u8, 0xdd_u8, 0x8_u8, 0xe7_u8, 0xe1_u8, 0xbe_u8])
    def query_interface(this : IOfflineFilesSyncConflictHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSyncConflictHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSyncConflictHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resolve_conflict(this : IOfflineFilesSyncConflictHandler*, pszPath : Win32cr::Foundation::PWSTR, fStateKnown : UInt32, state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_STATE, fChangeDetails : UInt32, pConflictResolution : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, ppszNewName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_conflict.call(this, pszPath, fStateKnown, state, fChangeDetails, pConflictResolution, ppszNewName)
    end

  end

  @[Extern]
  record IOfflineFilesItemFilterVtbl,
    query_interface : Proc(IOfflineFilesItemFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesItemFilter*, UInt32),
    release : Proc(IOfflineFilesItemFilter*, UInt32),
    get_filter_flags : Proc(IOfflineFilesItemFilter*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_time_filter : Proc(IOfflineFilesItemFilter*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::BOOL*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TIME*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_COMPARE*, Win32cr::Foundation::HRESULT),
    get_pattern_filter : Proc(IOfflineFilesItemFilter*, UInt16*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f4b5a26c-dc05-4f20-ada4-551f1077be5c")]
  record IOfflineFilesItemFilter, lpVtbl : IOfflineFilesItemFilterVtbl* do
    GUID = LibC::GUID.new(0xf4b5a26c_u32, 0xdc05_u16, 0x4f20_u16, StaticArray[0xad_u8, 0xa4_u8, 0x55_u8, 0x1f_u8, 0x10_u8, 0x77_u8, 0xbe_u8, 0x5c_u8])
    def query_interface(this : IOfflineFilesItemFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesItemFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesItemFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_filter_flags(this : IOfflineFilesItemFilter*, pullFlags : UInt64*, pullMask : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_flags.call(this, pullFlags, pullMask)
    end
    def get_time_filter(this : IOfflineFilesItemFilter*, pftTime : Win32cr::Foundation::FILETIME*, pbEvalTimeOfDay : Win32cr::Foundation::BOOL*, pTimeType : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TIME*, pCompare : Win32cr::Storage::OfflineFiles::OFFLINEFILES_COMPARE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time_filter.call(this, pftTime, pbEvalTimeOfDay, pTimeType, pCompare)
    end
    def get_pattern_filter(this : IOfflineFilesItemFilter*, pszPattern : UInt16*, cchPattern : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_filter.call(this, pszPattern, cchPattern)
    end

  end

  @[Extern]
  record IOfflineFilesItemVtbl,
    query_interface : Proc(IOfflineFilesItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesItem*, UInt32),
    release : Proc(IOfflineFilesItem*, UInt32),
    get_item_type : Proc(IOfflineFilesItem*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IOfflineFilesItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_parent_item : Proc(IOfflineFilesItem*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IOfflineFilesItem*, UInt32, Win32cr::Foundation::HRESULT),
    is_marked_for_deletion : Proc(IOfflineFilesItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4a753da6-e044-4f12-a718-5d14d079a906")]
  record IOfflineFilesItem, lpVtbl : IOfflineFilesItemVtbl* do
    GUID = LibC::GUID.new(0x4a753da6_u32, 0xe044_u16, 0x4f12_u16, StaticArray[0xa7_u8, 0x18_u8, 0x5d_u8, 0x14_u8, 0xd0_u8, 0x79_u8, 0xa9_u8, 0x6_u8])
    def query_interface(this : IOfflineFilesItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_type(this : IOfflineFilesItem*, pItemType : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_type.call(this, pItemType)
    end
    def get_path(this : IOfflineFilesItem*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, ppszPath)
    end
    def get_parent_item(this : IOfflineFilesItem*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_item.call(this, ppItem)
    end
    def refresh(this : IOfflineFilesItem*, dwQueryFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this, dwQueryFlags)
    end
    def is_marked_for_deletion(this : IOfflineFilesItem*, pbMarkedForDeletion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_marked_for_deletion.call(this, pbMarkedForDeletion)
    end

  end

  @[Extern]
  record IOfflineFilesServerItemVtbl,
    query_interface : Proc(IOfflineFilesServerItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesServerItem*, UInt32),
    release : Proc(IOfflineFilesServerItem*, UInt32),
    get_item_type : Proc(IOfflineFilesServerItem*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IOfflineFilesServerItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_parent_item : Proc(IOfflineFilesServerItem*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IOfflineFilesServerItem*, UInt32, Win32cr::Foundation::HRESULT),
    is_marked_for_deletion : Proc(IOfflineFilesServerItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9b1c9576-a92b-4151-8e9e-7c7b3ec2e016")]
  record IOfflineFilesServerItem, lpVtbl : IOfflineFilesServerItemVtbl* do
    GUID = LibC::GUID.new(0x9b1c9576_u32, 0xa92b_u16, 0x4151_u16, StaticArray[0x8e_u8, 0x9e_u8, 0x7c_u8, 0x7b_u8, 0x3e_u8, 0xc2_u8, 0xe0_u8, 0x16_u8])
    def query_interface(this : IOfflineFilesServerItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesServerItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesServerItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_type(this : IOfflineFilesServerItem*, pItemType : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_type.call(this, pItemType)
    end
    def get_path(this : IOfflineFilesServerItem*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, ppszPath)
    end
    def get_parent_item(this : IOfflineFilesServerItem*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_item.call(this, ppItem)
    end
    def refresh(this : IOfflineFilesServerItem*, dwQueryFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this, dwQueryFlags)
    end
    def is_marked_for_deletion(this : IOfflineFilesServerItem*, pbMarkedForDeletion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_marked_for_deletion.call(this, pbMarkedForDeletion)
    end

  end

  @[Extern]
  record IOfflineFilesShareItemVtbl,
    query_interface : Proc(IOfflineFilesShareItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesShareItem*, UInt32),
    release : Proc(IOfflineFilesShareItem*, UInt32),
    get_item_type : Proc(IOfflineFilesShareItem*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IOfflineFilesShareItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_parent_item : Proc(IOfflineFilesShareItem*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IOfflineFilesShareItem*, UInt32, Win32cr::Foundation::HRESULT),
    is_marked_for_deletion : Proc(IOfflineFilesShareItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bab7e48d-4804-41b5-a44d-0f199b06b145")]
  record IOfflineFilesShareItem, lpVtbl : IOfflineFilesShareItemVtbl* do
    GUID = LibC::GUID.new(0xbab7e48d_u32, 0x4804_u16, 0x41b5_u16, StaticArray[0xa4_u8, 0x4d_u8, 0xf_u8, 0x19_u8, 0x9b_u8, 0x6_u8, 0xb1_u8, 0x45_u8])
    def query_interface(this : IOfflineFilesShareItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesShareItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesShareItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_type(this : IOfflineFilesShareItem*, pItemType : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_type.call(this, pItemType)
    end
    def get_path(this : IOfflineFilesShareItem*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, ppszPath)
    end
    def get_parent_item(this : IOfflineFilesShareItem*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_item.call(this, ppItem)
    end
    def refresh(this : IOfflineFilesShareItem*, dwQueryFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this, dwQueryFlags)
    end
    def is_marked_for_deletion(this : IOfflineFilesShareItem*, pbMarkedForDeletion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_marked_for_deletion.call(this, pbMarkedForDeletion)
    end

  end

  @[Extern]
  record IOfflineFilesDirectoryItemVtbl,
    query_interface : Proc(IOfflineFilesDirectoryItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesDirectoryItem*, UInt32),
    release : Proc(IOfflineFilesDirectoryItem*, UInt32),
    get_item_type : Proc(IOfflineFilesDirectoryItem*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IOfflineFilesDirectoryItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_parent_item : Proc(IOfflineFilesDirectoryItem*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IOfflineFilesDirectoryItem*, UInt32, Win32cr::Foundation::HRESULT),
    is_marked_for_deletion : Proc(IOfflineFilesDirectoryItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2273597a-a08c-4a00-a37a-c1ae4e9a1cfd")]
  record IOfflineFilesDirectoryItem, lpVtbl : IOfflineFilesDirectoryItemVtbl* do
    GUID = LibC::GUID.new(0x2273597a_u32, 0xa08c_u16, 0x4a00_u16, StaticArray[0xa3_u8, 0x7a_u8, 0xc1_u8, 0xae_u8, 0x4e_u8, 0x9a_u8, 0x1c_u8, 0xfd_u8])
    def query_interface(this : IOfflineFilesDirectoryItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesDirectoryItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesDirectoryItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_type(this : IOfflineFilesDirectoryItem*, pItemType : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_type.call(this, pItemType)
    end
    def get_path(this : IOfflineFilesDirectoryItem*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, ppszPath)
    end
    def get_parent_item(this : IOfflineFilesDirectoryItem*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_item.call(this, ppItem)
    end
    def refresh(this : IOfflineFilesDirectoryItem*, dwQueryFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this, dwQueryFlags)
    end
    def is_marked_for_deletion(this : IOfflineFilesDirectoryItem*, pbMarkedForDeletion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_marked_for_deletion.call(this, pbMarkedForDeletion)
    end

  end

  @[Extern]
  record IOfflineFilesFileItemVtbl,
    query_interface : Proc(IOfflineFilesFileItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesFileItem*, UInt32),
    release : Proc(IOfflineFilesFileItem*, UInt32),
    get_item_type : Proc(IOfflineFilesFileItem*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IOfflineFilesFileItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_parent_item : Proc(IOfflineFilesFileItem*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IOfflineFilesFileItem*, UInt32, Win32cr::Foundation::HRESULT),
    is_marked_for_deletion : Proc(IOfflineFilesFileItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_sparse : Proc(IOfflineFilesFileItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_encrypted : Proc(IOfflineFilesFileItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8dfadead-26c2-4eff-8a72-6b50723d9a00")]
  record IOfflineFilesFileItem, lpVtbl : IOfflineFilesFileItemVtbl* do
    GUID = LibC::GUID.new(0x8dfadead_u32, 0x26c2_u16, 0x4eff_u16, StaticArray[0x8a_u8, 0x72_u8, 0x6b_u8, 0x50_u8, 0x72_u8, 0x3d_u8, 0x9a_u8, 0x0_u8])
    def query_interface(this : IOfflineFilesFileItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesFileItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesFileItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_type(this : IOfflineFilesFileItem*, pItemType : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_type.call(this, pItemType)
    end
    def get_path(this : IOfflineFilesFileItem*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, ppszPath)
    end
    def get_parent_item(this : IOfflineFilesFileItem*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_item.call(this, ppItem)
    end
    def refresh(this : IOfflineFilesFileItem*, dwQueryFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this, dwQueryFlags)
    end
    def is_marked_for_deletion(this : IOfflineFilesFileItem*, pbMarkedForDeletion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_marked_for_deletion.call(this, pbMarkedForDeletion)
    end
    def is_sparse(this : IOfflineFilesFileItem*, pbIsSparse : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_sparse.call(this, pbIsSparse)
    end
    def is_encrypted(this : IOfflineFilesFileItem*, pbIsEncrypted : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_encrypted.call(this, pbIsEncrypted)
    end

  end

  @[Extern]
  record IEnumOfflineFilesItemsVtbl,
    query_interface : Proc(IEnumOfflineFilesItems*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumOfflineFilesItems*, UInt32),
    release : Proc(IEnumOfflineFilesItems*, UInt32),
    next__ : Proc(IEnumOfflineFilesItems*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumOfflineFilesItems*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumOfflineFilesItems*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumOfflineFilesItems*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("da70e815-c361-4407-bc0b-0d7046e5f2cd")]
  record IEnumOfflineFilesItems, lpVtbl : IEnumOfflineFilesItemsVtbl* do
    GUID = LibC::GUID.new(0xda70e815_u32, 0xc361_u16, 0x4407_u16, StaticArray[0xbc_u8, 0xb_u8, 0xd_u8, 0x70_u8, 0x46_u8, 0xe5_u8, 0xf2_u8, 0xcd_u8])
    def query_interface(this : IEnumOfflineFilesItems*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumOfflineFilesItems*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumOfflineFilesItems*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumOfflineFilesItems*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumOfflineFilesItems*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumOfflineFilesItems*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumOfflineFilesItems*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IOfflineFilesItemContainerVtbl,
    query_interface : Proc(IOfflineFilesItemContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesItemContainer*, UInt32),
    release : Proc(IOfflineFilesItemContainer*, UInt32),
    enum_items : Proc(IOfflineFilesItemContainer*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    enum_items_ex : Proc(IOfflineFilesItemContainer*, Void*, Void*, Void*, Void*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3836f049-9413-45dd-bf46-b5aaa82dc310")]
  record IOfflineFilesItemContainer, lpVtbl : IOfflineFilesItemContainerVtbl* do
    GUID = LibC::GUID.new(0x3836f049_u32, 0x9413_u16, 0x45dd_u16, StaticArray[0xbf_u8, 0x46_u8, 0xb5_u8, 0xaa_u8, 0xa8_u8, 0x2d_u8, 0xc3_u8, 0x10_u8])
    def query_interface(this : IOfflineFilesItemContainer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesItemContainer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesItemContainer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_items(this : IOfflineFilesItemContainer*, dwQueryFlags : UInt32, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_items.call(this, dwQueryFlags, ppenum)
    end
    def enum_items_ex(this : IOfflineFilesItemContainer*, pIncludeFileFilter : Void*, pIncludeDirFilter : Void*, pExcludeFileFilter : Void*, pExcludeDirFilter : Void*, dwEnumFlags : UInt32, dwQueryFlags : UInt32, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_items_ex.call(this, pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwEnumFlags, dwQueryFlags, ppenum)
    end

  end

  @[Extern]
  record IOfflineFilesChangeInfoVtbl,
    query_interface : Proc(IOfflineFilesChangeInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesChangeInfo*, UInt32),
    release : Proc(IOfflineFilesChangeInfo*, UInt32),
    is_dirty : Proc(IOfflineFilesChangeInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_deleted_offline : Proc(IOfflineFilesChangeInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_created_offline : Proc(IOfflineFilesChangeInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_locally_modified_data : Proc(IOfflineFilesChangeInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_locally_modified_attributes : Proc(IOfflineFilesChangeInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_locally_modified_time : Proc(IOfflineFilesChangeInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a96e6fa4-e0d1-4c29-960b-ee508fe68c72")]
  record IOfflineFilesChangeInfo, lpVtbl : IOfflineFilesChangeInfoVtbl* do
    GUID = LibC::GUID.new(0xa96e6fa4_u32, 0xe0d1_u16, 0x4c29_u16, StaticArray[0x96_u8, 0xb_u8, 0xee_u8, 0x50_u8, 0x8f_u8, 0xe6_u8, 0x8c_u8, 0x72_u8])
    def query_interface(this : IOfflineFilesChangeInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesChangeInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesChangeInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_dirty(this : IOfflineFilesChangeInfo*, pbDirty : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this, pbDirty)
    end
    def is_deleted_offline(this : IOfflineFilesChangeInfo*, pbDeletedOffline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_deleted_offline.call(this, pbDeletedOffline)
    end
    def is_created_offline(this : IOfflineFilesChangeInfo*, pbCreatedOffline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_created_offline.call(this, pbCreatedOffline)
    end
    def is_locally_modified_data(this : IOfflineFilesChangeInfo*, pbLocallyModifiedData : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_locally_modified_data.call(this, pbLocallyModifiedData)
    end
    def is_locally_modified_attributes(this : IOfflineFilesChangeInfo*, pbLocallyModifiedAttributes : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_locally_modified_attributes.call(this, pbLocallyModifiedAttributes)
    end
    def is_locally_modified_time(this : IOfflineFilesChangeInfo*, pbLocallyModifiedTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_locally_modified_time.call(this, pbLocallyModifiedTime)
    end

  end

  @[Extern]
  record IOfflineFilesDirtyInfoVtbl,
    query_interface : Proc(IOfflineFilesDirtyInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesDirtyInfo*, UInt32),
    release : Proc(IOfflineFilesDirtyInfo*, UInt32),
    local_dirty_byte_count : Proc(IOfflineFilesDirtyInfo*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    remote_dirty_byte_count : Proc(IOfflineFilesDirtyInfo*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0f50ce33-bac9-4eaa-a11d-da0e527d047d")]
  record IOfflineFilesDirtyInfo, lpVtbl : IOfflineFilesDirtyInfoVtbl* do
    GUID = LibC::GUID.new(0xf50ce33_u32, 0xbac9_u16, 0x4eaa_u16, StaticArray[0xa1_u8, 0x1d_u8, 0xda_u8, 0xe_u8, 0x52_u8, 0x7d_u8, 0x4_u8, 0x7d_u8])
    def query_interface(this : IOfflineFilesDirtyInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesDirtyInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesDirtyInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def local_dirty_byte_count(this : IOfflineFilesDirtyInfo*, pDirtyByteCount : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.local_dirty_byte_count.call(this, pDirtyByteCount)
    end
    def remote_dirty_byte_count(this : IOfflineFilesDirtyInfo*, pDirtyByteCount : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remote_dirty_byte_count.call(this, pDirtyByteCount)
    end

  end

  @[Extern]
  record IOfflineFilesFileSysInfoVtbl,
    query_interface : Proc(IOfflineFilesFileSysInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesFileSysInfo*, UInt32),
    release : Proc(IOfflineFilesFileSysInfo*, UInt32),
    get_attributes : Proc(IOfflineFilesFileSysInfo*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_COPY, UInt32*, Win32cr::Foundation::HRESULT),
    get_times : Proc(IOfflineFilesFileSysInfo*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_COPY, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_file_size : Proc(IOfflineFilesFileSysInfo*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_COPY, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bc1a163f-7bfd-4d88-9c66-96ea9a6a3d6b")]
  record IOfflineFilesFileSysInfo, lpVtbl : IOfflineFilesFileSysInfoVtbl* do
    GUID = LibC::GUID.new(0xbc1a163f_u32, 0x7bfd_u16, 0x4d88_u16, StaticArray[0x9c_u8, 0x66_u8, 0x96_u8, 0xea_u8, 0x9a_u8, 0x6a_u8, 0x3d_u8, 0x6b_u8])
    def query_interface(this : IOfflineFilesFileSysInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesFileSysInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesFileSysInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attributes(this : IOfflineFilesFileSysInfo*, copy : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_COPY, pdwAttributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, copy, pdwAttributes)
    end
    def get_times(this : IOfflineFilesFileSysInfo*, copy : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_COPY, pftCreationTime : Win32cr::Foundation::FILETIME*, pftLastWriteTime : Win32cr::Foundation::FILETIME*, pftChangeTime : Win32cr::Foundation::FILETIME*, pftLastAccessTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_times.call(this, copy, pftCreationTime, pftLastWriteTime, pftChangeTime, pftLastAccessTime)
    end
    def get_file_size(this : IOfflineFilesFileSysInfo*, copy : Win32cr::Storage::OfflineFiles::OFFLINEFILES_ITEM_COPY, pSize : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, copy, pSize)
    end

  end

  @[Extern]
  record IOfflineFilesPinInfoVtbl,
    query_interface : Proc(IOfflineFilesPinInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesPinInfo*, UInt32),
    release : Proc(IOfflineFilesPinInfo*, UInt32),
    is_pinned : Proc(IOfflineFilesPinInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_user : Proc(IOfflineFilesPinInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_user_by_policy : Proc(IOfflineFilesPinInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_computer : Proc(IOfflineFilesPinInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_folder_redirection : Proc(IOfflineFilesPinInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5b2b0655-b3fd-497d-adeb-bd156bc8355b")]
  record IOfflineFilesPinInfo, lpVtbl : IOfflineFilesPinInfoVtbl* do
    GUID = LibC::GUID.new(0x5b2b0655_u32, 0xb3fd_u16, 0x497d_u16, StaticArray[0xad_u8, 0xeb_u8, 0xbd_u8, 0x15_u8, 0x6b_u8, 0xc8_u8, 0x35_u8, 0x5b_u8])
    def query_interface(this : IOfflineFilesPinInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesPinInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesPinInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_pinned(this : IOfflineFilesPinInfo*, pbPinned : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned.call(this, pbPinned)
    end
    def is_pinned_for_user(this : IOfflineFilesPinInfo*, pbPinnedForUser : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_user.call(this, pbPinnedForUser, pbInherit)
    end
    def is_pinned_for_user_by_policy(this : IOfflineFilesPinInfo*, pbPinnedForUser : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_user_by_policy.call(this, pbPinnedForUser, pbInherit)
    end
    def is_pinned_for_computer(this : IOfflineFilesPinInfo*, pbPinnedForComputer : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_computer.call(this, pbPinnedForComputer, pbInherit)
    end
    def is_pinned_for_folder_redirection(this : IOfflineFilesPinInfo*, pbPinnedForFolderRedirection : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_folder_redirection.call(this, pbPinnedForFolderRedirection, pbInherit)
    end

  end

  @[Extern]
  record IOfflineFilesPinInfo2Vtbl,
    query_interface : Proc(IOfflineFilesPinInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesPinInfo2*, UInt32),
    release : Proc(IOfflineFilesPinInfo2*, UInt32),
    is_pinned : Proc(IOfflineFilesPinInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_user : Proc(IOfflineFilesPinInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_user_by_policy : Proc(IOfflineFilesPinInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_computer : Proc(IOfflineFilesPinInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_pinned_for_folder_redirection : Proc(IOfflineFilesPinInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_partly_pinned : Proc(IOfflineFilesPinInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("623c58a2-42ed-4ad7-b69a-0f1b30a72d0d")]
  record IOfflineFilesPinInfo2, lpVtbl : IOfflineFilesPinInfo2Vtbl* do
    GUID = LibC::GUID.new(0x623c58a2_u32, 0x42ed_u16, 0x4ad7_u16, StaticArray[0xb6_u8, 0x9a_u8, 0xf_u8, 0x1b_u8, 0x30_u8, 0xa7_u8, 0x2d_u8, 0xd_u8])
    def query_interface(this : IOfflineFilesPinInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesPinInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesPinInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_pinned(this : IOfflineFilesPinInfo2*, pbPinned : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned.call(this, pbPinned)
    end
    def is_pinned_for_user(this : IOfflineFilesPinInfo2*, pbPinnedForUser : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_user.call(this, pbPinnedForUser, pbInherit)
    end
    def is_pinned_for_user_by_policy(this : IOfflineFilesPinInfo2*, pbPinnedForUser : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_user_by_policy.call(this, pbPinnedForUser, pbInherit)
    end
    def is_pinned_for_computer(this : IOfflineFilesPinInfo2*, pbPinnedForComputer : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_computer.call(this, pbPinnedForComputer, pbInherit)
    end
    def is_pinned_for_folder_redirection(this : IOfflineFilesPinInfo2*, pbPinnedForFolderRedirection : Win32cr::Foundation::BOOL*, pbInherit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pinned_for_folder_redirection.call(this, pbPinnedForFolderRedirection, pbInherit)
    end
    def is_partly_pinned(this : IOfflineFilesPinInfo2*, pbPartlyPinned : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_partly_pinned.call(this, pbPartlyPinned)
    end

  end

  @[Extern]
  record IOfflineFilesTransparentCacheInfoVtbl,
    query_interface : Proc(IOfflineFilesTransparentCacheInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesTransparentCacheInfo*, UInt32),
    release : Proc(IOfflineFilesTransparentCacheInfo*, UInt32),
    is_transparently_cached : Proc(IOfflineFilesTransparentCacheInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bcaf4a01-5b68-4b56-a6a1-8d2786ede8e3")]
  record IOfflineFilesTransparentCacheInfo, lpVtbl : IOfflineFilesTransparentCacheInfoVtbl* do
    GUID = LibC::GUID.new(0xbcaf4a01_u32, 0x5b68_u16, 0x4b56_u16, StaticArray[0xa6_u8, 0xa1_u8, 0x8d_u8, 0x27_u8, 0x86_u8, 0xed_u8, 0xe8_u8, 0xe3_u8])
    def query_interface(this : IOfflineFilesTransparentCacheInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesTransparentCacheInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesTransparentCacheInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_transparently_cached(this : IOfflineFilesTransparentCacheInfo*, pbTransparentlyCached : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_transparently_cached.call(this, pbTransparentlyCached)
    end

  end

  @[Extern]
  record IOfflineFilesGhostInfoVtbl,
    query_interface : Proc(IOfflineFilesGhostInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesGhostInfo*, UInt32),
    release : Proc(IOfflineFilesGhostInfo*, UInt32),
    is_ghosted : Proc(IOfflineFilesGhostInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2b09d48c-8ab5-464f-a755-a59d92f99429")]
  record IOfflineFilesGhostInfo, lpVtbl : IOfflineFilesGhostInfoVtbl* do
    GUID = LibC::GUID.new(0x2b09d48c_u32, 0x8ab5_u16, 0x464f_u16, StaticArray[0xa7_u8, 0x55_u8, 0xa5_u8, 0x9d_u8, 0x92_u8, 0xf9_u8, 0x94_u8, 0x29_u8])
    def query_interface(this : IOfflineFilesGhostInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesGhostInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesGhostInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_ghosted(this : IOfflineFilesGhostInfo*, pbGhosted : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ghosted.call(this, pbGhosted)
    end

  end

  @[Extern]
  record IOfflineFilesConnectionInfoVtbl,
    query_interface : Proc(IOfflineFilesConnectionInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesConnectionInfo*, UInt32),
    release : Proc(IOfflineFilesConnectionInfo*, UInt32),
    get_connect_state : Proc(IOfflineFilesConnectionInfo*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_CONNECT_STATE*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_OFFLINE_REASON*, Win32cr::Foundation::HRESULT),
    set_connect_state : Proc(IOfflineFilesConnectionInfo*, Win32cr::Foundation::HWND, UInt32, Win32cr::Storage::OfflineFiles::OFFLINEFILES_CONNECT_STATE, Win32cr::Foundation::HRESULT),
    transition_online : Proc(IOfflineFilesConnectionInfo*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    transition_offline : Proc(IOfflineFilesConnectionInfo*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("efb23a09-a867-4be8-83a6-86969a7d0856")]
  record IOfflineFilesConnectionInfo, lpVtbl : IOfflineFilesConnectionInfoVtbl* do
    GUID = LibC::GUID.new(0xefb23a09_u32, 0xa867_u16, 0x4be8_u16, StaticArray[0x83_u8, 0xa6_u8, 0x86_u8, 0x96_u8, 0x9a_u8, 0x7d_u8, 0x8_u8, 0x56_u8])
    def query_interface(this : IOfflineFilesConnectionInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesConnectionInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesConnectionInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_connect_state(this : IOfflineFilesConnectionInfo*, pConnectState : Win32cr::Storage::OfflineFiles::OFFLINEFILES_CONNECT_STATE*, pOfflineReason : Win32cr::Storage::OfflineFiles::OFFLINEFILES_OFFLINE_REASON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connect_state.call(this, pConnectState, pOfflineReason)
    end
    def set_connect_state(this : IOfflineFilesConnectionInfo*, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, connect_state : Win32cr::Storage::OfflineFiles::OFFLINEFILES_CONNECT_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connect_state.call(this, hwndParent, dwFlags, connect_state)
    end
    def transition_online(this : IOfflineFilesConnectionInfo*, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transition_online.call(this, hwndParent, dwFlags)
    end
    def transition_offline(this : IOfflineFilesConnectionInfo*, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, bForceOpenFilesClosed : Win32cr::Foundation::BOOL, pbOpenFilesPreventedTransition : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transition_offline.call(this, hwndParent, dwFlags, bForceOpenFilesClosed, pbOpenFilesPreventedTransition)
    end

  end

  @[Extern]
  record IOfflineFilesShareInfoVtbl,
    query_interface : Proc(IOfflineFilesShareInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesShareInfo*, UInt32),
    release : Proc(IOfflineFilesShareInfo*, UInt32),
    get_share_item : Proc(IOfflineFilesShareInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_share_caching_mode : Proc(IOfflineFilesShareInfo*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_CACHING_MODE*, Win32cr::Foundation::HRESULT),
    is_share_dfs_junction : Proc(IOfflineFilesShareInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7bcc43e7-31ce-4ca4-8ccd-1cff2dc494da")]
  record IOfflineFilesShareInfo, lpVtbl : IOfflineFilesShareInfoVtbl* do
    GUID = LibC::GUID.new(0x7bcc43e7_u32, 0x31ce_u16, 0x4ca4_u16, StaticArray[0x8c_u8, 0xcd_u8, 0x1c_u8, 0xff_u8, 0x2d_u8, 0xc4_u8, 0x94_u8, 0xda_u8])
    def query_interface(this : IOfflineFilesShareInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesShareInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesShareInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_share_item(this : IOfflineFilesShareInfo*, ppShareItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_share_item.call(this, ppShareItem)
    end
    def get_share_caching_mode(this : IOfflineFilesShareInfo*, pCachingMode : Win32cr::Storage::OfflineFiles::OFFLINEFILES_CACHING_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_share_caching_mode.call(this, pCachingMode)
    end
    def is_share_dfs_junction(this : IOfflineFilesShareInfo*, pbIsDfsJunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_share_dfs_junction.call(this, pbIsDfsJunction)
    end

  end

  @[Extern]
  record IOfflineFilesSuspendVtbl,
    query_interface : Proc(IOfflineFilesSuspend*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSuspend*, UInt32),
    release : Proc(IOfflineFilesSuspend*, UInt32),
    suspend_root : Proc(IOfflineFilesSuspend*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("62c4560f-bc0b-48ca-ad9d-34cb528d99a9")]
  record IOfflineFilesSuspend, lpVtbl : IOfflineFilesSuspendVtbl* do
    GUID = LibC::GUID.new(0x62c4560f_u32, 0xbc0b_u16, 0x48ca_u16, StaticArray[0xad_u8, 0x9d_u8, 0x34_u8, 0xcb_u8, 0x52_u8, 0x8d_u8, 0x99_u8, 0xa9_u8])
    def query_interface(this : IOfflineFilesSuspend*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSuspend*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSuspend*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def suspend_root(this : IOfflineFilesSuspend*, bSuspend : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_root.call(this, bSuspend)
    end

  end

  @[Extern]
  record IOfflineFilesSuspendInfoVtbl,
    query_interface : Proc(IOfflineFilesSuspendInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSuspendInfo*, UInt32),
    release : Proc(IOfflineFilesSuspendInfo*, UInt32),
    is_suspended : Proc(IOfflineFilesSuspendInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a457c25b-4e9c-4b04-85af-8932ccd97889")]
  record IOfflineFilesSuspendInfo, lpVtbl : IOfflineFilesSuspendInfoVtbl* do
    GUID = LibC::GUID.new(0xa457c25b_u32, 0x4e9c_u16, 0x4b04_u16, StaticArray[0x85_u8, 0xaf_u8, 0x89_u8, 0x32_u8, 0xcc_u8, 0xd9_u8, 0x78_u8, 0x89_u8])
    def query_interface(this : IOfflineFilesSuspendInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSuspendInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSuspendInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_suspended(this : IOfflineFilesSuspendInfo*, pbSuspended : Win32cr::Foundation::BOOL*, pbSuspendedRoot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_suspended.call(this, pbSuspended, pbSuspendedRoot)
    end

  end

  @[Extern]
  record IOfflineFilesSettingVtbl,
    query_interface : Proc(IOfflineFilesSetting*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesSetting*, UInt32),
    release : Proc(IOfflineFilesSetting*, UInt32),
    get_name : Proc(IOfflineFilesSetting*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_value_type : Proc(IOfflineFilesSetting*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_SETTING_VALUE_TYPE*, Win32cr::Foundation::HRESULT),
    get_preference : Proc(IOfflineFilesSetting*, Win32cr::System::Com::VARIANT*, UInt32, Win32cr::Foundation::HRESULT),
    get_preference_scope : Proc(IOfflineFilesSetting*, UInt32*, Win32cr::Foundation::HRESULT),
    set_preference : Proc(IOfflineFilesSetting*, Win32cr::System::Com::VARIANT*, UInt32, Win32cr::Foundation::HRESULT),
    delete_preference : Proc(IOfflineFilesSetting*, UInt32, Win32cr::Foundation::HRESULT),
    get_policy : Proc(IOfflineFilesSetting*, Win32cr::System::Com::VARIANT*, UInt32, Win32cr::Foundation::HRESULT),
    get_policy_scope : Proc(IOfflineFilesSetting*, UInt32*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IOfflineFilesSetting*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d871d3f7-f613-48a1-827e-7a34e560fff6")]
  record IOfflineFilesSetting, lpVtbl : IOfflineFilesSettingVtbl* do
    GUID = LibC::GUID.new(0xd871d3f7_u32, 0xf613_u16, 0x48a1_u16, StaticArray[0x82_u8, 0x7e_u8, 0x7a_u8, 0x34_u8, 0xe5_u8, 0x60_u8, 0xff_u8, 0xf6_u8])
    def query_interface(this : IOfflineFilesSetting*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesSetting*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesSetting*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IOfflineFilesSetting*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, ppszName)
    end
    def get_value_type(this : IOfflineFilesSetting*, pType : Win32cr::Storage::OfflineFiles::OFFLINEFILES_SETTING_VALUE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value_type.call(this, pType)
    end
    def get_preference(this : IOfflineFilesSetting*, pvarValue : Win32cr::System::Com::VARIANT*, dwScope : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preference.call(this, pvarValue, dwScope)
    end
    def get_preference_scope(this : IOfflineFilesSetting*, pdwScope : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preference_scope.call(this, pdwScope)
    end
    def set_preference(this : IOfflineFilesSetting*, pvarValue : Win32cr::System::Com::VARIANT*, dwScope : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preference.call(this, pvarValue, dwScope)
    end
    def delete_preference(this : IOfflineFilesSetting*, dwScope : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_preference.call(this, dwScope)
    end
    def get_policy(this : IOfflineFilesSetting*, pvarValue : Win32cr::System::Com::VARIANT*, dwScope : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_policy.call(this, pvarValue, dwScope)
    end
    def get_policy_scope(this : IOfflineFilesSetting*, pdwScope : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_policy_scope.call(this, pdwScope)
    end
    def get_value(this : IOfflineFilesSetting*, pvarValue : Win32cr::System::Com::VARIANT*, pbSetByPolicy : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pvarValue, pbSetByPolicy)
    end

  end

  @[Extern]
  record IEnumOfflineFilesSettingsVtbl,
    query_interface : Proc(IEnumOfflineFilesSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumOfflineFilesSettings*, UInt32),
    release : Proc(IEnumOfflineFilesSettings*, UInt32),
    next__ : Proc(IEnumOfflineFilesSettings*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumOfflineFilesSettings*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumOfflineFilesSettings*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumOfflineFilesSettings*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("729680c4-1a38-47bc-9e5c-02c51562ac30")]
  record IEnumOfflineFilesSettings, lpVtbl : IEnumOfflineFilesSettingsVtbl* do
    GUID = LibC::GUID.new(0x729680c4_u32, 0x1a38_u16, 0x47bc_u16, StaticArray[0x9e_u8, 0x5c_u8, 0x2_u8, 0xc5_u8, 0x15_u8, 0x62_u8, 0xac_u8, 0x30_u8])
    def query_interface(this : IEnumOfflineFilesSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumOfflineFilesSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumOfflineFilesSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumOfflineFilesSettings*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumOfflineFilesSettings*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumOfflineFilesSettings*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumOfflineFilesSettings*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IOfflineFilesCacheVtbl,
    query_interface : Proc(IOfflineFilesCache*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesCache*, UInt32),
    release : Proc(IOfflineFilesCache*, UInt32),
    synchronize : Proc(IOfflineFilesCache*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::BOOL, UInt32, Void*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    delete_items : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    delete_items_for_user : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    pin : Proc(IOfflineFilesCache*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, UInt32, Void*, Win32cr::Foundation::HRESULT),
    unpin : Proc(IOfflineFilesCache*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_encryption_status : Proc(IOfflineFilesCache*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    encrypt : Proc(IOfflineFilesCache*, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    find_item : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    find_item_ex : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR, Void*, Void*, Void*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    rename_item : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_location : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_disk_space_information : Proc(IOfflineFilesCache*, UInt64*, UInt64*, UInt64*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    set_disk_space_limits : Proc(IOfflineFilesCache*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    process_admin_pin_policy : Proc(IOfflineFilesCache*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_setting_object : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_setting_objects : Proc(IOfflineFilesCache*, Void**, Win32cr::Foundation::HRESULT),
    is_path_cacheable : Proc(IOfflineFilesCache*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_CACHING_MODE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("855d6203-7914-48b9-8d40-4c56f5acffc5")]
  record IOfflineFilesCache, lpVtbl : IOfflineFilesCacheVtbl* do
    GUID = LibC::GUID.new(0x855d6203_u32, 0x7914_u16, 0x48b9_u16, StaticArray[0x8d_u8, 0x40_u8, 0x4c_u8, 0x56_u8, 0xf5_u8, 0xac_u8, 0xff_u8, 0xc5_u8])
    def query_interface(this : IOfflineFilesCache*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesCache*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesCache*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def synchronize(this : IOfflineFilesCache*, hwndParent : Win32cr::Foundation::HWND, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, bAsync : Win32cr::Foundation::BOOL, dwSyncControl : UInt32, pISyncConflictHandler : Void*, pIProgress : Void*, pSyncId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronize.call(this, hwndParent, rgpszPaths, cPaths, bAsync, dwSyncControl, pISyncConflictHandler, pIProgress, pSyncId)
    end
    def delete_items(this : IOfflineFilesCache*, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, dwFlags : UInt32, bAsync : Win32cr::Foundation::BOOL, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_items.call(this, rgpszPaths, cPaths, dwFlags, bAsync, pIProgress)
    end
    def delete_items_for_user(this : IOfflineFilesCache*, pszUser : Win32cr::Foundation::PWSTR, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, dwFlags : UInt32, bAsync : Win32cr::Foundation::BOOL, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_items_for_user.call(this, pszUser, rgpszPaths, cPaths, dwFlags, bAsync, pIProgress)
    end
    def pin(this : IOfflineFilesCache*, hwndParent : Win32cr::Foundation::HWND, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, bDeep : Win32cr::Foundation::BOOL, bAsync : Win32cr::Foundation::BOOL, dwPinControlFlags : UInt32, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pin.call(this, hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress)
    end
    def unpin(this : IOfflineFilesCache*, hwndParent : Win32cr::Foundation::HWND, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, bDeep : Win32cr::Foundation::BOOL, bAsync : Win32cr::Foundation::BOOL, dwPinControlFlags : UInt32, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unpin.call(this, hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress)
    end
    def get_encryption_status(this : IOfflineFilesCache*, pbEncrypted : Win32cr::Foundation::BOOL*, pbPartial : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_encryption_status.call(this, pbEncrypted, pbPartial)
    end
    def encrypt(this : IOfflineFilesCache*, hwndParent : Win32cr::Foundation::HWND, bEncrypt : Win32cr::Foundation::BOOL, dwEncryptionControlFlags : UInt32, bAsync : Win32cr::Foundation::BOOL, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encrypt.call(this, hwndParent, bEncrypt, dwEncryptionControlFlags, bAsync, pIProgress)
    end
    def find_item(this : IOfflineFilesCache*, pszPath : Win32cr::Foundation::PWSTR, dwQueryFlags : UInt32, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item.call(this, pszPath, dwQueryFlags, ppItem)
    end
    def find_item_ex(this : IOfflineFilesCache*, pszPath : Win32cr::Foundation::PWSTR, pIncludeFileFilter : Void*, pIncludeDirFilter : Void*, pExcludeFileFilter : Void*, pExcludeDirFilter : Void*, dwQueryFlags : UInt32, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item_ex.call(this, pszPath, pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwQueryFlags, ppItem)
    end
    def rename_item(this : IOfflineFilesCache*, pszPathOriginal : Win32cr::Foundation::PWSTR, pszPathNew : Win32cr::Foundation::PWSTR, bReplaceIfExists : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_item.call(this, pszPathOriginal, pszPathNew, bReplaceIfExists)
    end
    def get_location(this : IOfflineFilesCache*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_location.call(this, ppszPath)
    end
    def get_disk_space_information(this : IOfflineFilesCache*, pcbVolumeTotal : UInt64*, pcbLimit : UInt64*, pcbUsed : UInt64*, pcbUnpinnedLimit : UInt64*, pcbUnpinnedUsed : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_disk_space_information.call(this, pcbVolumeTotal, pcbLimit, pcbUsed, pcbUnpinnedLimit, pcbUnpinnedUsed)
    end
    def set_disk_space_limits(this : IOfflineFilesCache*, cbLimit : UInt64, cbUnpinnedLimit : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_disk_space_limits.call(this, cbLimit, cbUnpinnedLimit)
    end
    def process_admin_pin_policy(this : IOfflineFilesCache*, pPinProgress : Void*, pUnpinProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_admin_pin_policy.call(this, pPinProgress, pUnpinProgress)
    end
    def get_setting_object(this : IOfflineFilesCache*, pszSettingName : Win32cr::Foundation::PWSTR, ppSetting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_setting_object.call(this, pszSettingName, ppSetting)
    end
    def enum_setting_objects(this : IOfflineFilesCache*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_setting_objects.call(this, ppEnum)
    end
    def is_path_cacheable(this : IOfflineFilesCache*, pszPath : Win32cr::Foundation::PWSTR, pbCacheable : Win32cr::Foundation::BOOL*, pShareCachingMode : Win32cr::Storage::OfflineFiles::OFFLINEFILES_CACHING_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_path_cacheable.call(this, pszPath, pbCacheable, pShareCachingMode)
    end

  end

  @[Extern]
  record IOfflineFilesCache2Vtbl,
    query_interface : Proc(IOfflineFilesCache2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOfflineFilesCache2*, UInt32),
    release : Proc(IOfflineFilesCache2*, UInt32),
    synchronize : Proc(IOfflineFilesCache2*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::BOOL, UInt32, Void*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    delete_items : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    delete_items_for_user : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    pin : Proc(IOfflineFilesCache2*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, UInt32, Void*, Win32cr::Foundation::HRESULT),
    unpin : Proc(IOfflineFilesCache2*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_encryption_status : Proc(IOfflineFilesCache2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    encrypt : Proc(IOfflineFilesCache2*, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    find_item : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    find_item_ex : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR, Void*, Void*, Void*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    rename_item : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_location : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_disk_space_information : Proc(IOfflineFilesCache2*, UInt64*, UInt64*, UInt64*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    set_disk_space_limits : Proc(IOfflineFilesCache2*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    process_admin_pin_policy : Proc(IOfflineFilesCache2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_setting_object : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_setting_objects : Proc(IOfflineFilesCache2*, Void**, Win32cr::Foundation::HRESULT),
    is_path_cacheable : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Storage::OfflineFiles::OFFLINEFILES_CACHING_MODE*, Win32cr::Foundation::HRESULT),
    rename_item_ex : Proc(IOfflineFilesCache2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8c075039-1551-4ed9-8781-56705c04d3c0")]
  record IOfflineFilesCache2, lpVtbl : IOfflineFilesCache2Vtbl* do
    GUID = LibC::GUID.new(0x8c075039_u32, 0x1551_u16, 0x4ed9_u16, StaticArray[0x87_u8, 0x81_u8, 0x56_u8, 0x70_u8, 0x5c_u8, 0x4_u8, 0xd3_u8, 0xc0_u8])
    def query_interface(this : IOfflineFilesCache2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOfflineFilesCache2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOfflineFilesCache2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def synchronize(this : IOfflineFilesCache2*, hwndParent : Win32cr::Foundation::HWND, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, bAsync : Win32cr::Foundation::BOOL, dwSyncControl : UInt32, pISyncConflictHandler : Void*, pIProgress : Void*, pSyncId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronize.call(this, hwndParent, rgpszPaths, cPaths, bAsync, dwSyncControl, pISyncConflictHandler, pIProgress, pSyncId)
    end
    def delete_items(this : IOfflineFilesCache2*, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, dwFlags : UInt32, bAsync : Win32cr::Foundation::BOOL, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_items.call(this, rgpszPaths, cPaths, dwFlags, bAsync, pIProgress)
    end
    def delete_items_for_user(this : IOfflineFilesCache2*, pszUser : Win32cr::Foundation::PWSTR, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, dwFlags : UInt32, bAsync : Win32cr::Foundation::BOOL, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_items_for_user.call(this, pszUser, rgpszPaths, cPaths, dwFlags, bAsync, pIProgress)
    end
    def pin(this : IOfflineFilesCache2*, hwndParent : Win32cr::Foundation::HWND, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, bDeep : Win32cr::Foundation::BOOL, bAsync : Win32cr::Foundation::BOOL, dwPinControlFlags : UInt32, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pin.call(this, hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress)
    end
    def unpin(this : IOfflineFilesCache2*, hwndParent : Win32cr::Foundation::HWND, rgpszPaths : Win32cr::Foundation::PWSTR*, cPaths : UInt32, bDeep : Win32cr::Foundation::BOOL, bAsync : Win32cr::Foundation::BOOL, dwPinControlFlags : UInt32, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unpin.call(this, hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress)
    end
    def get_encryption_status(this : IOfflineFilesCache2*, pbEncrypted : Win32cr::Foundation::BOOL*, pbPartial : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_encryption_status.call(this, pbEncrypted, pbPartial)
    end
    def encrypt(this : IOfflineFilesCache2*, hwndParent : Win32cr::Foundation::HWND, bEncrypt : Win32cr::Foundation::BOOL, dwEncryptionControlFlags : UInt32, bAsync : Win32cr::Foundation::BOOL, pIProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encrypt.call(this, hwndParent, bEncrypt, dwEncryptionControlFlags, bAsync, pIProgress)
    end
    def find_item(this : IOfflineFilesCache2*, pszPath : Win32cr::Foundation::PWSTR, dwQueryFlags : UInt32, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item.call(this, pszPath, dwQueryFlags, ppItem)
    end
    def find_item_ex(this : IOfflineFilesCache2*, pszPath : Win32cr::Foundation::PWSTR, pIncludeFileFilter : Void*, pIncludeDirFilter : Void*, pExcludeFileFilter : Void*, pExcludeDirFilter : Void*, dwQueryFlags : UInt32, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item_ex.call(this, pszPath, pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwQueryFlags, ppItem)
    end
    def rename_item(this : IOfflineFilesCache2*, pszPathOriginal : Win32cr::Foundation::PWSTR, pszPathNew : Win32cr::Foundation::PWSTR, bReplaceIfExists : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_item.call(this, pszPathOriginal, pszPathNew, bReplaceIfExists)
    end
    def get_location(this : IOfflineFilesCache2*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_location.call(this, ppszPath)
    end
    def get_disk_space_information(this : IOfflineFilesCache2*, pcbVolumeTotal : UInt64*, pcbLimit : UInt64*, pcbUsed : UInt64*, pcbUnpinnedLimit : UInt64*, pcbUnpinnedUsed : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_disk_space_information.call(this, pcbVolumeTotal, pcbLimit, pcbUsed, pcbUnpinnedLimit, pcbUnpinnedUsed)
    end
    def set_disk_space_limits(this : IOfflineFilesCache2*, cbLimit : UInt64, cbUnpinnedLimit : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_disk_space_limits.call(this, cbLimit, cbUnpinnedLimit)
    end
    def process_admin_pin_policy(this : IOfflineFilesCache2*, pPinProgress : Void*, pUnpinProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_admin_pin_policy.call(this, pPinProgress, pUnpinProgress)
    end
    def get_setting_object(this : IOfflineFilesCache2*, pszSettingName : Win32cr::Foundation::PWSTR, ppSetting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_setting_object.call(this, pszSettingName, ppSetting)
    end
    def enum_setting_objects(this : IOfflineFilesCache2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_setting_objects.call(this, ppEnum)
    end
    def is_path_cacheable(this : IOfflineFilesCache2*, pszPath : Win32cr::Foundation::PWSTR, pbCacheable : Win32cr::Foundation::BOOL*, pShareCachingMode : Win32cr::Storage::OfflineFiles::OFFLINEFILES_CACHING_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_path_cacheable.call(this, pszPath, pbCacheable, pShareCachingMode)
    end
    def rename_item_ex(this : IOfflineFilesCache2*, pszPathOriginal : Win32cr::Foundation::PWSTR, pszPathNew : Win32cr::Foundation::PWSTR, bReplaceIfExists : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_item_ex.call(this, pszPathOriginal, pszPathNew, bReplaceIfExists)
    end

  end

  @[Link("cscapi")]
  lib C
    fun OfflineFilesEnable(bEnable : Win32cr::Foundation::BOOL, pbRebootRequired : Win32cr::Foundation::BOOL*) : UInt32

    fun OfflineFilesStart : UInt32

    fun OfflineFilesQueryStatus(pbActive : Win32cr::Foundation::BOOL*, pbEnabled : Win32cr::Foundation::BOOL*) : UInt32

    fun OfflineFilesQueryStatusEx(pbActive : Win32cr::Foundation::BOOL*, pbEnabled : Win32cr::Foundation::BOOL*, pbAvailable : Win32cr::Foundation::BOOL*) : UInt32

  end
end