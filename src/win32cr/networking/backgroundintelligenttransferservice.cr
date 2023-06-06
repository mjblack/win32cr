require "../foundation.cr"
require "../system/com.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  BG_NOTIFY_JOB_TRANSFERRED = 1_u32
  BG_NOTIFY_JOB_ERROR = 2_u32
  BG_NOTIFY_DISABLE = 4_u32
  BG_NOTIFY_JOB_MODIFICATION = 8_u32
  BG_NOTIFY_FILE_TRANSFERRED = 16_u32
  BG_NOTIFY_FILE_RANGES_TRANSFERRED = 32_u32
  BG_JOB_ENUM_ALL_USERS = 1_u32
  BG_COPY_FILE_OWNER = 1_u32
  BG_COPY_FILE_GROUP = 2_u32
  BG_COPY_FILE_DACL = 4_u32
  BG_COPY_FILE_SACL = 8_u32
  BG_COPY_FILE_ALL = 15_u32
  BG_SSL_ENABLE_CRL_CHECK = 1_u32
  BG_SSL_IGNORE_CERT_CN_INVALID = 2_u32
  BG_SSL_IGNORE_CERT_DATE_INVALID = 4_u32
  BG_SSL_IGNORE_UNKNOWN_CA = 8_u32
  BG_SSL_IGNORE_CERT_WRONG_USAGE = 16_u32
  BG_HTTP_REDIRECT_POLICY_MASK = 1792_u32
  BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT = 0_u32
  BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT = 256_u32
  BG_HTTP_REDIRECT_POLICY_DISALLOW = 512_u32
  BG_HTTP_REDIRECT_POLICY_ALLOW_HTTPS_TO_HTTP = 2048_u32
  BG_ENABLE_PEERCACHING_CLIENT = 1_u32
  BG_ENABLE_PEERCACHING_SERVER = 2_u32
  BG_DISABLE_BRANCH_CACHE = 4_u32
  BG_JOB_ENABLE_PEERCACHING_CLIENT = 1_u32
  BG_JOB_ENABLE_PEERCACHING_SERVER = 2_u32
  BG_JOB_DISABLE_BRANCH_CACHE = 4_u32
  BITS_COST_STATE_UNRESTRICTED = 1_u32
  BITS_COST_STATE_CAPPED_USAGE_UNKNOWN = 2_u32
  BITS_COST_STATE_BELOW_CAP = 4_u32
  BITS_COST_STATE_NEAR_CAP = 8_u32
  BITS_COST_STATE_OVERCAP_CHARGED = 16_u32
  BITS_COST_STATE_OVERCAP_THROTTLED = 32_u32
  BITS_COST_STATE_USAGE_BASED = 64_u32
  BITS_COST_STATE_ROAMING = 128_u32
  BITS_COST_OPTION_IGNORE_CONGESTION = 2147483648_u32
  BITS_COST_STATE_RESERVED = 1073741824_u32
  QM_NOTIFY_FILE_DONE = 1_u32
  QM_NOTIFY_JOB_DONE = 2_u32
  QM_NOTIFY_GROUP_DONE = 4_u32
  QM_NOTIFY_DISABLE_NOTIFY = 64_u32
  QM_NOTIFY_USE_PROGRESSEX = 128_u32
  QM_STATUS_FILE_COMPLETE = 1_u32
  QM_STATUS_FILE_INCOMPLETE = 2_u32
  QM_STATUS_JOB_COMPLETE = 4_u32
  QM_STATUS_JOB_INCOMPLETE = 8_u32
  QM_STATUS_JOB_ERROR = 16_u32
  QM_STATUS_JOB_FOREGROUND = 32_u32
  QM_STATUS_GROUP_COMPLETE = 64_u32
  QM_STATUS_GROUP_INCOMPLETE = 128_u32
  QM_STATUS_GROUP_SUSPENDED = 256_u32
  QM_STATUS_GROUP_ERROR = 512_u32
  QM_STATUS_GROUP_FOREGROUND = 1024_u32
  QM_PROTOCOL_HTTP = 1_u32
  QM_PROTOCOL_FTP = 2_u32
  QM_PROTOCOL_SMB = 3_u32
  QM_PROTOCOL_CUSTOM = 4_u32
  QM_PROGRESS_PERCENT_DONE = 1_u32
  QM_PROGRESS_TIME_DONE = 2_u32
  QM_PROGRESS_SIZE_DONE = 3_u32
  QM_E_INVALID_STATE = 2164264961_u32
  QM_E_SERVICE_UNAVAILABLE = 2164264962_u32
  QM_E_DOWNLOADER_UNAVAILABLE = 2164264963_u32
  QM_E_ITEM_NOT_FOUND = 2164264964_u32
  BG_E_NOT_FOUND = -2145386495_i32
  BG_E_INVALID_STATE = -2145386494_i32
  BG_E_EMPTY = -2145386493_i32
  BG_E_FILE_NOT_AVAILABLE = -2145386492_i32
  BG_E_PROTOCOL_NOT_AVAILABLE = -2145386491_i32
  BG_S_ERROR_CONTEXT_NONE = 2097158_i32
  BG_E_ERROR_CONTEXT_UNKNOWN = -2145386489_i32
  BG_E_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER = -2145386488_i32
  BG_E_ERROR_CONTEXT_LOCAL_FILE = -2145386487_i32
  BG_E_ERROR_CONTEXT_REMOTE_FILE = -2145386486_i32
  BG_E_ERROR_CONTEXT_GENERAL_TRANSPORT = -2145386485_i32
  BG_E_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION = -2145386484_i32
  BG_E_DESTINATION_LOCKED = -2145386483_i32
  BG_E_VOLUME_CHANGED = -2145386482_i32
  BG_E_ERROR_INFORMATION_UNAVAILABLE = -2145386481_i32
  BG_E_NETWORK_DISCONNECTED = -2145386480_i32
  BG_E_MISSING_FILE_SIZE = -2145386479_i32
  BG_E_INSUFFICIENT_HTTP_SUPPORT = -2145386478_i32
  BG_E_INSUFFICIENT_RANGE_SUPPORT = -2145386477_i32
  BG_E_REMOTE_NOT_SUPPORTED = -2145386476_i32
  BG_E_NEW_OWNER_DIFF_MAPPING = -2145386475_i32
  BG_E_NEW_OWNER_NO_FILE_ACCESS = -2145386474_i32
  BG_S_PARTIAL_COMPLETE = 2097175_i32
  BG_E_PROXY_LIST_TOO_LARGE = -2145386472_i32
  BG_E_PROXY_BYPASS_LIST_TOO_LARGE = -2145386471_i32
  BG_S_UNABLE_TO_DELETE_FILES = 2097178_i32
  BG_E_INVALID_SERVER_RESPONSE = -2145386469_i32
  BG_E_TOO_MANY_FILES = -2145386468_i32
  BG_E_LOCAL_FILE_CHANGED = -2145386467_i32
  BG_E_ERROR_CONTEXT_REMOTE_APPLICATION = -2145386466_i32
  BG_E_SESSION_NOT_FOUND = -2145386465_i32
  BG_E_TOO_LARGE = -2145386464_i32
  BG_E_STRING_TOO_LONG = -2145386463_i32
  BG_E_CLIENT_SERVER_PROTOCOL_MISMATCH = -2145386462_i32
  BG_E_SERVER_EXECUTE_ENABLE = -2145386461_i32
  BG_E_NO_PROGRESS = -2145386460_i32
  BG_E_USERNAME_TOO_LARGE = -2145386459_i32
  BG_E_PASSWORD_TOO_LARGE = -2145386458_i32
  BG_E_INVALID_AUTH_TARGET = -2145386457_i32
  BG_E_INVALID_AUTH_SCHEME = -2145386456_i32
  BG_E_FILE_NOT_FOUND = -2145386455_i32
  BG_S_PROXY_CHANGED = 2097194_i32
  BG_E_INVALID_RANGE = -2145386453_i32
  BG_E_OVERLAPPING_RANGES = -2145386452_i32
  BG_E_CONNECT_FAILURE = -2145386451_i32
  BG_E_CONNECTION_CLOSED = -2145386450_i32
  BG_E_BLOCKED_BY_POLICY = -2145386434_i32
  BG_E_INVALID_PROXY_INFO = -2145386433_i32
  BG_E_INVALID_CREDENTIALS = -2145386432_i32
  BG_E_INVALID_HASH_ALGORITHM = -2145386431_i32
  BG_E_RECORD_DELETED = -2145386430_i32
  BG_E_COMMIT_IN_PROGRESS = -2145386429_i32
  BG_E_DISCOVERY_IN_PROGRESS = -2145386428_i32
  BG_E_UPNP_ERROR = -2145386427_i32
  BG_E_TEST_OPTION_BLOCKED_DOWNLOAD = -2145386426_i32
  BG_E_PEERCACHING_DISABLED = -2145386425_i32
  BG_E_BUSYCACHERECORD = -2145386424_i32
  BG_E_TOO_MANY_JOBS_PER_USER = -2145386423_i32
  BG_E_TOO_MANY_JOBS_PER_MACHINE = -2145386416_i32
  BG_E_TOO_MANY_FILES_IN_JOB = -2145386415_i32
  BG_E_TOO_MANY_RANGES_IN_FILE = -2145386414_i32
  BG_E_VALIDATION_FAILED = -2145386413_i32
  BG_E_MAXDOWNLOAD_TIMEOUT = -2145386412_i32
  BG_S_OVERRIDDEN_BY_POLICY = 2097237_i32
  BG_E_TOKEN_REQUIRED = -2145386410_i32
  BG_E_UNKNOWN_PROPERTY_ID = -2145386409_i32
  BG_E_READ_ONLY_PROPERTY = -2145386408_i32
  BG_E_BLOCKED_BY_COST_TRANSFER_POLICY = -2145386407_i32
  BG_E_PROPERTY_SUPPORTED_FOR_DOWNLOAD_JOBS_ONLY = -2145386400_i32
  BG_E_READ_ONLY_PROPERTY_AFTER_ADDFILE = -2145386399_i32
  BG_E_READ_ONLY_PROPERTY_AFTER_RESUME = -2145386398_i32
  BG_E_MAX_DOWNLOAD_SIZE_INVALID_VALUE = -2145386397_i32
  BG_E_MAX_DOWNLOAD_SIZE_LIMIT_REACHED = -2145386396_i32
  BG_E_STANDBY_MODE = -2145386395_i32
  BG_E_USE_STORED_CREDENTIALS_NOT_SUPPORTED = -2145386394_i32
  BG_E_BLOCKED_BY_BATTERY_POLICY = -2145386393_i32
  BG_E_BLOCKED_BY_BATTERY_SAVER = -2145386392_i32
  BG_E_WATCHDOG_TIMEOUT = -2145386391_i32
  BG_E_APP_PACKAGE_NOT_FOUND = -2145386390_i32
  BG_E_APP_PACKAGE_SCENARIO_NOT_SUPPORTED = -2145386389_i32
  BG_E_DATABASE_CORRUPT = -2145386388_i32
  BG_E_RANDOM_ACCESS_NOT_SUPPORTED = -2145386387_i32
  BG_E_BLOCKED_BY_BACKGROUND_ACCESS_POLICY = -2145386386_i32
  BG_E_BLOCKED_BY_GAME_MODE = -2145386385_i32
  BG_E_BLOCKED_BY_SYSTEM_POLICY = -2145386384_i32
  BG_E_NOT_SUPPORTED_WITH_CUSTOM_HTTP_METHOD = -2145386383_i32
  BG_E_UNSUPPORTED_JOB_CONFIGURATION = -2145386382_i32
  BG_E_REMOTE_FILE_CHANGED = -2145386381_i32
  BG_E_SERVER_CERT_VALIDATION_INTERFACE_REQUIRED = -2145386380_i32
  BG_E_READ_ONLY_WHEN_JOB_ACTIVE = -2145386379_i32
  BG_E_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK = -2145386378_i32
  BG_E_HTTP_ERROR_100 = -2145845148_i32
  BG_E_HTTP_ERROR_101 = -2145845147_i32
  BG_E_HTTP_ERROR_200 = -2145845048_i32
  BG_E_HTTP_ERROR_201 = -2145845047_i32
  BG_E_HTTP_ERROR_202 = -2145845046_i32
  BG_E_HTTP_ERROR_203 = -2145845045_i32
  BG_E_HTTP_ERROR_204 = -2145845044_i32
  BG_E_HTTP_ERROR_205 = -2145845043_i32
  BG_E_HTTP_ERROR_206 = -2145845042_i32
  BG_E_HTTP_ERROR_300 = -2145844948_i32
  BG_E_HTTP_ERROR_301 = -2145844947_i32
  BG_E_HTTP_ERROR_302 = -2145844946_i32
  BG_E_HTTP_ERROR_303 = -2145844945_i32
  BG_E_HTTP_ERROR_304 = -2145844944_i32
  BG_E_HTTP_ERROR_305 = -2145844943_i32
  BG_E_HTTP_ERROR_307 = -2145844941_i32
  BG_E_HTTP_ERROR_400 = -2145844848_i32
  BG_E_HTTP_ERROR_401 = -2145844847_i32
  BG_E_HTTP_ERROR_402 = -2145844846_i32
  BG_E_HTTP_ERROR_403 = -2145844845_i32
  BG_E_HTTP_ERROR_404 = -2145844844_i32
  BG_E_HTTP_ERROR_405 = -2145844843_i32
  BG_E_HTTP_ERROR_406 = -2145844842_i32
  BG_E_HTTP_ERROR_407 = -2145844841_i32
  BG_E_HTTP_ERROR_408 = -2145844840_i32
  BG_E_HTTP_ERROR_409 = -2145844839_i32
  BG_E_HTTP_ERROR_410 = -2145844838_i32
  BG_E_HTTP_ERROR_411 = -2145844837_i32
  BG_E_HTTP_ERROR_412 = -2145844836_i32
  BG_E_HTTP_ERROR_413 = -2145844835_i32
  BG_E_HTTP_ERROR_414 = -2145844834_i32
  BG_E_HTTP_ERROR_415 = -2145844833_i32
  BG_E_HTTP_ERROR_416 = -2145844832_i32
  BG_E_HTTP_ERROR_417 = -2145844831_i32
  BG_E_HTTP_ERROR_449 = -2145844799_i32
  BG_E_HTTP_ERROR_500 = -2145844748_i32
  BG_E_HTTP_ERROR_501 = -2145844747_i32
  BG_E_HTTP_ERROR_502 = -2145844746_i32
  BG_E_HTTP_ERROR_503 = -2145844745_i32
  BG_E_HTTP_ERROR_504 = -2145844744_i32
  BG_E_HTTP_ERROR_505 = -2145844743_i32
  BITS_MC_JOB_CANCELLED = -2145828864_i32
  BITS_MC_FILE_DELETION_FAILED = -2145828863_i32
  BITS_MC_FILE_DELETION_FAILED_MORE = -2145828862_i32
  BITS_MC_JOB_PROPERTY_CHANGE = -2145828861_i32
  BITS_MC_JOB_TAKE_OWNERSHIP = -2145828860_i32
  BITS_MC_JOB_SCAVENGED = -2145828859_i32
  BITS_MC_JOB_NOTIFICATION_FAILURE = -2145828858_i32
  BITS_MC_STATE_FILE_CORRUPT = -2145828857_i32
  BITS_MC_FAILED_TO_START = -2145828856_i32
  BITS_MC_FATAL_IGD_ERROR = -2145828855_i32
  BITS_MC_PEERCACHING_PORT = -2145828854_i32
  BITS_MC_WSD_PORT = -2145828853_i32
  BackgroundCopyManager = LibC::GUID.new(0x4991d34b_u32, 0x80a1_u16, 0x4291_u16, StaticArray[0x83_u8, 0xb6_u8, 0x33_u8, 0x28_u8, 0x36_u8, 0x6b_u8, 0x90_u8, 0x97_u8])
  BackgroundCopyManager1_5 = LibC::GUID.new(0xf087771f_u32, 0xd74f_u16, 0x4c1a_u16, StaticArray[0xbb_u8, 0x8a_u8, 0xe1_u8, 0x6a_u8, 0xca_u8, 0x91_u8, 0x24_u8, 0xea_u8])
  BackgroundCopyManager2_0 = LibC::GUID.new(0x6d18ad12_u32, 0xbde3_u16, 0x4393_u16, StaticArray[0xb3_u8, 0x11_u8, 0x9_u8, 0x9c_u8, 0x34_u8, 0x6e_u8, 0x6d_u8, 0xf9_u8])
  BackgroundCopyManager2_5 = LibC::GUID.new(0x3ca98d6_u32, 0xff5d_u16, 0x49b8_u16, StaticArray[0xab_u8, 0xc6_u8, 0x3_u8, 0xdd_u8, 0x84_u8, 0x12_u8, 0x70_u8, 0x20_u8])
  BackgroundCopyManager3_0 = LibC::GUID.new(0x659cdea7_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  BackgroundCopyManager4_0 = LibC::GUID.new(0xbb6df56b_u32, 0xcace_u16, 0x11dc_u16, StaticArray[0x99_u8, 0x92_u8, 0x0_u8, 0x19_u8, 0xb9_u8, 0x3a_u8, 0x3a_u8, 0x84_u8])
  BackgroundCopyManager5_0 = LibC::GUID.new(0x1ecca34c_u32, 0xe88a_u16, 0x44e3_u16, StaticArray[0x8d_u8, 0x6a_u8, 0x89_u8, 0x21_u8, 0xbd_u8, 0xe9_u8, 0xe4_u8, 0x52_u8])
  BackgroundCopyManager10_1 = LibC::GUID.new(0x4bd3e4e1_u32, 0x7bd4_u16, 0x4a2b_u16, StaticArray[0x99_u8, 0x64_u8, 0x49_u8, 0x64_u8, 0x0_u8, 0xde_u8, 0x51_u8, 0x93_u8])
  BackgroundCopyManager10_2 = LibC::GUID.new(0x4575438f_u32, 0xa6c8_u16, 0x4976_u16, StaticArray[0xb0_u8, 0xfe_u8, 0x2f_u8, 0x26_u8, 0xb8_u8, 0xd_u8, 0x95_u8, 0x9e_u8])
  BackgroundCopyManager10_3 = LibC::GUID.new(0x5fd42ad5_u32, 0xc04e_u16, 0x4d36_u16, StaticArray[0xad_u8, 0xc7_u8, 0xe0_u8, 0x8f_u8, 0xf1_u8, 0x57_u8, 0x37_u8, 0xad_u8])
  BITSExtensionSetupFactory = LibC::GUID.new(0xefbbab68_u32, 0x7286_u16, 0x4783_u16, StaticArray[0x94_u8, 0xbf_u8, 0x94_u8, 0x61_u8, 0xd8_u8, 0xb7_u8, 0xe7_u8, 0xe9_u8])
  BackgroundCopyQMgr = LibC::GUID.new(0x69ad4aee_u32, 0x51be_u16, 0x439b_u16, StaticArray[0xa9_u8, 0x2c_u8, 0x86_u8, 0xae_u8, 0x49_u8, 0xe_u8, 0x8b_u8, 0x30_u8])


  enum BG_TOKEN : UInt32
    BG_TOKEN_LOCAL_FILE = 1
    BG_TOKEN_NETWORK = 2
  end

  enum BG_ERROR_CONTEXT : Int32
    BG_ERROR_CONTEXT_NONE = 0
    BG_ERROR_CONTEXT_UNKNOWN = 1
    BG_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER = 2
    BG_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION = 3
    BG_ERROR_CONTEXT_LOCAL_FILE = 4
    BG_ERROR_CONTEXT_REMOTE_FILE = 5
    BG_ERROR_CONTEXT_GENERAL_TRANSPORT = 6
    BG_ERROR_CONTEXT_REMOTE_APPLICATION = 7
    BG_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK = 8
  end

  enum BG_JOB_PRIORITY : Int32
    BG_JOB_PRIORITY_FOREGROUND = 0
    BG_JOB_PRIORITY_HIGH = 1
    BG_JOB_PRIORITY_NORMAL = 2
    BG_JOB_PRIORITY_LOW = 3
  end

  enum BG_JOB_STATE : Int32
    BG_JOB_STATE_QUEUED = 0
    BG_JOB_STATE_CONNECTING = 1
    BG_JOB_STATE_TRANSFERRING = 2
    BG_JOB_STATE_SUSPENDED = 3
    BG_JOB_STATE_ERROR = 4
    BG_JOB_STATE_TRANSIENT_ERROR = 5
    BG_JOB_STATE_TRANSFERRED = 6
    BG_JOB_STATE_ACKNOWLEDGED = 7
    BG_JOB_STATE_CANCELLED = 8
  end

  enum BG_JOB_TYPE : Int32
    BG_JOB_TYPE_DOWNLOAD = 0
    BG_JOB_TYPE_UPLOAD = 1
    BG_JOB_TYPE_UPLOAD_REPLY = 2
  end

  enum BG_JOB_PROXY_USAGE : Int32
    BG_JOB_PROXY_USAGE_PRECONFIG = 0
    BG_JOB_PROXY_USAGE_NO_PROXY = 1
    BG_JOB_PROXY_USAGE_OVERRIDE = 2
    BG_JOB_PROXY_USAGE_AUTODETECT = 3
  end

  enum BG_AUTH_TARGET : Int32
    BG_AUTH_TARGET_SERVER = 1
    BG_AUTH_TARGET_PROXY = 2
  end

  enum BG_AUTH_SCHEME : Int32
    BG_AUTH_SCHEME_BASIC = 1
    BG_AUTH_SCHEME_DIGEST = 2
    BG_AUTH_SCHEME_NTLM = 3
    BG_AUTH_SCHEME_NEGOTIATE = 4
    BG_AUTH_SCHEME_PASSPORT = 5
  end

  enum BG_CERT_STORE_LOCATION : Int32
    BG_CERT_STORE_LOCATION_CURRENT_USER = 0
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE = 1
    BG_CERT_STORE_LOCATION_CURRENT_SERVICE = 2
    BG_CERT_STORE_LOCATION_SERVICES = 3
    BG_CERT_STORE_LOCATION_USERS = 4
    BG_CERT_STORE_LOCATION_CURRENT_USER_GROUP_POLICY = 5
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE_GROUP_POLICY = 6
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE_ENTERPRISE = 7
  end

  enum BITS_JOB_TRANSFER_POLICY : Int32
    BITS_JOB_TRANSFER_POLICY_ALWAYS = -2147483393
    BITS_JOB_TRANSFER_POLICY_NOT_ROAMING = -2147483521
    BITS_JOB_TRANSFER_POLICY_NO_SURCHARGE = -2147483537
    BITS_JOB_TRANSFER_POLICY_STANDARD = -2147483545
    BITS_JOB_TRANSFER_POLICY_UNRESTRICTED = -2147483615
  end

  enum BITS_JOB_PROPERTY_ID : Int32
    BITS_JOB_PROPERTY_ID_COST_FLAGS = 1
    BITS_JOB_PROPERTY_NOTIFICATION_CLSID = 2
    BITS_JOB_PROPERTY_DYNAMIC_CONTENT = 3
    BITS_JOB_PROPERTY_HIGH_PERFORMANCE = 4
    BITS_JOB_PROPERTY_MAX_DOWNLOAD_SIZE = 5
    BITS_JOB_PROPERTY_USE_STORED_CREDENTIALS = 7
    BITS_JOB_PROPERTY_MINIMUM_NOTIFICATION_INTERVAL_MS = 9
    BITS_JOB_PROPERTY_ON_DEMAND_MODE = 10
  end

  enum BITS_FILE_PROPERTY_ID : Int32
    BITS_FILE_PROPERTY_ID_HTTP_RESPONSE_HEADERS = 1
  end

  enum GROUPPROP : Int32
    GROUPPROP_PRIORITY = 0
    GROUPPROP_REMOTEUSERID = 1
    GROUPPROP_REMOTEUSERPWD = 2
    GROUPPROP_LOCALUSERID = 3
    GROUPPROP_LOCALUSERPWD = 4
    GROUPPROP_PROTOCOLFLAGS = 5
    GROUPPROP_NOTIFYFLAGS = 6
    GROUPPROP_NOTIFYCLSID = 7
    GROUPPROP_PROGRESSSIZE = 8
    GROUPPROP_PROGRESSPERCENT = 9
    GROUPPROP_PROGRESSTIME = 10
    GROUPPROP_DISPLAYNAME = 11
    GROUPPROP_DESCRIPTION = 12
  end

  union BG_AUTH_CREDENTIALS_UNION
    basic : BG_BASIC_CREDENTIALS
  end
  union BITS_JOB_PROPERTY_VALUE
    dword : UInt32
    cls_id : Guid
    enable : LibC::BOOL
    uint64 : UInt64
    target : BG_AUTH_TARGET
  end
  union BITS_FILE_PROPERTY_VALUE
    string : LibC::LPWSTR
  end

  struct BG_FILE_PROGRESS
    bytes_total : UInt64
    bytes_transferred : UInt64
    completed : LibC::BOOL
  end
  struct BG_FILE_INFO
    remote_name : LibC::LPWSTR
    local_name : LibC::LPWSTR
  end
  struct BG_JOB_PROGRESS
    bytes_total : UInt64
    bytes_transferred : UInt64
    files_total : UInt32
    files_transferred : UInt32
  end
  struct BG_JOB_TIMES
    creation_time : FILETIME
    modification_time : FILETIME
    transfer_completion_time : FILETIME
  end
  struct BG_JOB_REPLY_PROGRESS
    bytes_total : UInt64
    bytes_transferred : UInt64
  end
  struct BG_BASIC_CREDENTIALS
    user_name : LibC::LPWSTR
    password : LibC::LPWSTR
  end
  struct BG_AUTH_CREDENTIALS
    target : BG_AUTH_TARGET
    scheme : BG_AUTH_SCHEME
    credentials : BG_AUTH_CREDENTIALS_UNION
  end
  struct BG_FILE_RANGE
    initial_offset : UInt64
    length : UInt64
  end
  struct FILESETINFO
    bstr_remote_file : UInt8*
    bstr_local_file : UInt8*
    dw_size_hint : UInt32
  end


  struct IBackgroundCopyFileVTbl
    query_interface : Proc(IBackgroundCopyFile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyFile*, UInt32)
    release : Proc(IBackgroundCopyFile*, UInt32)
    get_remote_name : Proc(IBackgroundCopyFile*, LibC::LPWSTR*, HRESULT)
    get_local_name : Proc(IBackgroundCopyFile*, LibC::LPWSTR*, HRESULT)
    get_progress : Proc(IBackgroundCopyFile*, BG_FILE_PROGRESS*, HRESULT)
  end

  struct IBackgroundCopyFile
    lpVtbl : IBackgroundCopyFileVTbl*
  end

  struct IEnumBackgroundCopyFilesVTbl
    query_interface : Proc(IEnumBackgroundCopyFiles*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumBackgroundCopyFiles*, UInt32)
    release : Proc(IEnumBackgroundCopyFiles*, UInt32)
    next : Proc(IEnumBackgroundCopyFiles*, UInt32, IBackgroundCopyFile*, UInt32*, HRESULT)
    skip : Proc(IEnumBackgroundCopyFiles*, UInt32, HRESULT)
    reset : Proc(IEnumBackgroundCopyFiles*, HRESULT)
    clone : Proc(IEnumBackgroundCopyFiles*, IEnumBackgroundCopyFiles*, HRESULT)
    get_count : Proc(IEnumBackgroundCopyFiles*, UInt32*, HRESULT)
  end

  struct IEnumBackgroundCopyFiles
    lpVtbl : IEnumBackgroundCopyFilesVTbl*
  end

  struct IBackgroundCopyErrorVTbl
    query_interface : Proc(IBackgroundCopyError*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyError*, UInt32)
    release : Proc(IBackgroundCopyError*, UInt32)
    get_error : Proc(IBackgroundCopyError*, BG_ERROR_CONTEXT*, HRESULT*, HRESULT)
    get_file : Proc(IBackgroundCopyError*, IBackgroundCopyFile*, HRESULT)
    get_error_description : Proc(IBackgroundCopyError*, UInt32, LibC::LPWSTR*, HRESULT)
    get_error_context_description : Proc(IBackgroundCopyError*, UInt32, LibC::LPWSTR*, HRESULT)
    get_protocol : Proc(IBackgroundCopyError*, LibC::LPWSTR*, HRESULT)
  end

  struct IBackgroundCopyError
    lpVtbl : IBackgroundCopyErrorVTbl*
  end

  struct IBackgroundCopyJobVTbl
    query_interface : Proc(IBackgroundCopyJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJob*, UInt32)
    release : Proc(IBackgroundCopyJob*, UInt32)
    add_file_set : Proc(IBackgroundCopyJob*, UInt32, BG_FILE_INFO*, HRESULT)
    add_file : Proc(IBackgroundCopyJob*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    enum_files : Proc(IBackgroundCopyJob*, IEnumBackgroundCopyFiles*, HRESULT)
    suspend : Proc(IBackgroundCopyJob*, HRESULT)
    resume : Proc(IBackgroundCopyJob*, HRESULT)
    cancel : Proc(IBackgroundCopyJob*, HRESULT)
    complete : Proc(IBackgroundCopyJob*, HRESULT)
    get_id : Proc(IBackgroundCopyJob*, Guid*, HRESULT)
    get_type : Proc(IBackgroundCopyJob*, BG_JOB_TYPE*, HRESULT)
    get_progress : Proc(IBackgroundCopyJob*, BG_JOB_PROGRESS*, HRESULT)
    get_times : Proc(IBackgroundCopyJob*, BG_JOB_TIMES*, HRESULT)
    get_state : Proc(IBackgroundCopyJob*, BG_JOB_STATE*, HRESULT)
    get_error : Proc(IBackgroundCopyJob*, IBackgroundCopyError*, HRESULT)
    get_owner : Proc(IBackgroundCopyJob*, LibC::LPWSTR*, HRESULT)
    set_display_name : Proc(IBackgroundCopyJob*, LibC::LPWSTR, HRESULT)
    get_display_name : Proc(IBackgroundCopyJob*, LibC::LPWSTR*, HRESULT)
    set_description : Proc(IBackgroundCopyJob*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IBackgroundCopyJob*, LibC::LPWSTR*, HRESULT)
    set_priority : Proc(IBackgroundCopyJob*, BG_JOB_PRIORITY, HRESULT)
    get_priority : Proc(IBackgroundCopyJob*, BG_JOB_PRIORITY*, HRESULT)
    set_notify_flags : Proc(IBackgroundCopyJob*, UInt32, HRESULT)
    get_notify_flags : Proc(IBackgroundCopyJob*, UInt32*, HRESULT)
    set_notify_interface : Proc(IBackgroundCopyJob*, IUnknown, HRESULT)
    get_notify_interface : Proc(IBackgroundCopyJob*, IUnknown*, HRESULT)
    set_minimum_retry_delay : Proc(IBackgroundCopyJob*, UInt32, HRESULT)
    get_minimum_retry_delay : Proc(IBackgroundCopyJob*, UInt32*, HRESULT)
    set_no_progress_timeout : Proc(IBackgroundCopyJob*, UInt32, HRESULT)
    get_no_progress_timeout : Proc(IBackgroundCopyJob*, UInt32*, HRESULT)
    get_error_count : Proc(IBackgroundCopyJob*, UInt32*, HRESULT)
    set_proxy_settings : Proc(IBackgroundCopyJob*, BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_settings : Proc(IBackgroundCopyJob*, BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    take_ownership : Proc(IBackgroundCopyJob*, HRESULT)
  end

  struct IBackgroundCopyJob
    lpVtbl : IBackgroundCopyJobVTbl*
  end

  struct IEnumBackgroundCopyJobsVTbl
    query_interface : Proc(IEnumBackgroundCopyJobs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumBackgroundCopyJobs*, UInt32)
    release : Proc(IEnumBackgroundCopyJobs*, UInt32)
    next : Proc(IEnumBackgroundCopyJobs*, UInt32, IBackgroundCopyJob*, UInt32*, HRESULT)
    skip : Proc(IEnumBackgroundCopyJobs*, UInt32, HRESULT)
    reset : Proc(IEnumBackgroundCopyJobs*, HRESULT)
    clone : Proc(IEnumBackgroundCopyJobs*, IEnumBackgroundCopyJobs*, HRESULT)
    get_count : Proc(IEnumBackgroundCopyJobs*, UInt32*, HRESULT)
  end

  struct IEnumBackgroundCopyJobs
    lpVtbl : IEnumBackgroundCopyJobsVTbl*
  end

  struct IBackgroundCopyCallbackVTbl
    query_interface : Proc(IBackgroundCopyCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyCallback*, UInt32)
    release : Proc(IBackgroundCopyCallback*, UInt32)
    job_transferred : Proc(IBackgroundCopyCallback*, IBackgroundCopyJob, HRESULT)
    job_error : Proc(IBackgroundCopyCallback*, IBackgroundCopyJob, IBackgroundCopyError, HRESULT)
    job_modification : Proc(IBackgroundCopyCallback*, IBackgroundCopyJob, UInt32, HRESULT)
  end

  struct IBackgroundCopyCallback
    lpVtbl : IBackgroundCopyCallbackVTbl*
  end

  struct AsyncIBackgroundCopyCallbackVTbl
    query_interface : Proc(AsyncIBackgroundCopyCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIBackgroundCopyCallback*, UInt32)
    release : Proc(AsyncIBackgroundCopyCallback*, UInt32)
    begin_job_transferred : Proc(AsyncIBackgroundCopyCallback*, IBackgroundCopyJob, HRESULT)
    finish_job_transferred : Proc(AsyncIBackgroundCopyCallback*, HRESULT)
    begin_job_error : Proc(AsyncIBackgroundCopyCallback*, IBackgroundCopyJob, IBackgroundCopyError, HRESULT)
    finish_job_error : Proc(AsyncIBackgroundCopyCallback*, HRESULT)
    begin_job_modification : Proc(AsyncIBackgroundCopyCallback*, IBackgroundCopyJob, UInt32, HRESULT)
    finish_job_modification : Proc(AsyncIBackgroundCopyCallback*, HRESULT)
  end

  struct AsyncIBackgroundCopyCallback
    lpVtbl : AsyncIBackgroundCopyCallbackVTbl*
  end

  struct IBackgroundCopyManagerVTbl
    query_interface : Proc(IBackgroundCopyManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyManager*, UInt32)
    release : Proc(IBackgroundCopyManager*, UInt32)
    create_job : Proc(IBackgroundCopyManager*, LibC::LPWSTR, BG_JOB_TYPE, Guid*, IBackgroundCopyJob*, HRESULT)
    get_job : Proc(IBackgroundCopyManager*, Guid*, IBackgroundCopyJob*, HRESULT)
    enum_jobs : Proc(IBackgroundCopyManager*, UInt32, IEnumBackgroundCopyJobs*, HRESULT)
    get_error_description : Proc(IBackgroundCopyManager*, HRESULT, UInt32, LibC::LPWSTR*, HRESULT)
  end

  struct IBackgroundCopyManager
    lpVtbl : IBackgroundCopyManagerVTbl*
  end

  struct IBackgroundCopyJob2VTbl
    query_interface : Proc(IBackgroundCopyJob2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJob2*, UInt32)
    release : Proc(IBackgroundCopyJob2*, UInt32)
    add_file_set : Proc(IBackgroundCopyJob2*, UInt32, BG_FILE_INFO*, HRESULT)
    add_file : Proc(IBackgroundCopyJob2*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    enum_files : Proc(IBackgroundCopyJob2*, IEnumBackgroundCopyFiles*, HRESULT)
    suspend : Proc(IBackgroundCopyJob2*, HRESULT)
    resume : Proc(IBackgroundCopyJob2*, HRESULT)
    cancel : Proc(IBackgroundCopyJob2*, HRESULT)
    complete : Proc(IBackgroundCopyJob2*, HRESULT)
    get_id : Proc(IBackgroundCopyJob2*, Guid*, HRESULT)
    get_type : Proc(IBackgroundCopyJob2*, BG_JOB_TYPE*, HRESULT)
    get_progress : Proc(IBackgroundCopyJob2*, BG_JOB_PROGRESS*, HRESULT)
    get_times : Proc(IBackgroundCopyJob2*, BG_JOB_TIMES*, HRESULT)
    get_state : Proc(IBackgroundCopyJob2*, BG_JOB_STATE*, HRESULT)
    get_error : Proc(IBackgroundCopyJob2*, IBackgroundCopyError*, HRESULT)
    get_owner : Proc(IBackgroundCopyJob2*, LibC::LPWSTR*, HRESULT)
    set_display_name : Proc(IBackgroundCopyJob2*, LibC::LPWSTR, HRESULT)
    get_display_name : Proc(IBackgroundCopyJob2*, LibC::LPWSTR*, HRESULT)
    set_description : Proc(IBackgroundCopyJob2*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IBackgroundCopyJob2*, LibC::LPWSTR*, HRESULT)
    set_priority : Proc(IBackgroundCopyJob2*, BG_JOB_PRIORITY, HRESULT)
    get_priority : Proc(IBackgroundCopyJob2*, BG_JOB_PRIORITY*, HRESULT)
    set_notify_flags : Proc(IBackgroundCopyJob2*, UInt32, HRESULT)
    get_notify_flags : Proc(IBackgroundCopyJob2*, UInt32*, HRESULT)
    set_notify_interface : Proc(IBackgroundCopyJob2*, IUnknown, HRESULT)
    get_notify_interface : Proc(IBackgroundCopyJob2*, IUnknown*, HRESULT)
    set_minimum_retry_delay : Proc(IBackgroundCopyJob2*, UInt32, HRESULT)
    get_minimum_retry_delay : Proc(IBackgroundCopyJob2*, UInt32*, HRESULT)
    set_no_progress_timeout : Proc(IBackgroundCopyJob2*, UInt32, HRESULT)
    get_no_progress_timeout : Proc(IBackgroundCopyJob2*, UInt32*, HRESULT)
    get_error_count : Proc(IBackgroundCopyJob2*, UInt32*, HRESULT)
    set_proxy_settings : Proc(IBackgroundCopyJob2*, BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_settings : Proc(IBackgroundCopyJob2*, BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    take_ownership : Proc(IBackgroundCopyJob2*, HRESULT)
    set_notify_cmd_line : Proc(IBackgroundCopyJob2*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_notify_cmd_line : Proc(IBackgroundCopyJob2*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_reply_progress : Proc(IBackgroundCopyJob2*, BG_JOB_REPLY_PROGRESS*, HRESULT)
    get_reply_data : Proc(IBackgroundCopyJob2*, UInt8**, UInt64*, HRESULT)
    set_reply_file_name : Proc(IBackgroundCopyJob2*, LibC::LPWSTR, HRESULT)
    get_reply_file_name : Proc(IBackgroundCopyJob2*, LibC::LPWSTR*, HRESULT)
    set_credentials : Proc(IBackgroundCopyJob2*, BG_AUTH_CREDENTIALS*, HRESULT)
    remove_credentials : Proc(IBackgroundCopyJob2*, BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)
  end

  struct IBackgroundCopyJob2
    lpVtbl : IBackgroundCopyJob2VTbl*
  end

  struct IBackgroundCopyJob3VTbl
    query_interface : Proc(IBackgroundCopyJob3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJob3*, UInt32)
    release : Proc(IBackgroundCopyJob3*, UInt32)
    add_file_set : Proc(IBackgroundCopyJob3*, UInt32, BG_FILE_INFO*, HRESULT)
    add_file : Proc(IBackgroundCopyJob3*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    enum_files : Proc(IBackgroundCopyJob3*, IEnumBackgroundCopyFiles*, HRESULT)
    suspend : Proc(IBackgroundCopyJob3*, HRESULT)
    resume : Proc(IBackgroundCopyJob3*, HRESULT)
    cancel : Proc(IBackgroundCopyJob3*, HRESULT)
    complete : Proc(IBackgroundCopyJob3*, HRESULT)
    get_id : Proc(IBackgroundCopyJob3*, Guid*, HRESULT)
    get_type : Proc(IBackgroundCopyJob3*, BG_JOB_TYPE*, HRESULT)
    get_progress : Proc(IBackgroundCopyJob3*, BG_JOB_PROGRESS*, HRESULT)
    get_times : Proc(IBackgroundCopyJob3*, BG_JOB_TIMES*, HRESULT)
    get_state : Proc(IBackgroundCopyJob3*, BG_JOB_STATE*, HRESULT)
    get_error : Proc(IBackgroundCopyJob3*, IBackgroundCopyError*, HRESULT)
    get_owner : Proc(IBackgroundCopyJob3*, LibC::LPWSTR*, HRESULT)
    set_display_name : Proc(IBackgroundCopyJob3*, LibC::LPWSTR, HRESULT)
    get_display_name : Proc(IBackgroundCopyJob3*, LibC::LPWSTR*, HRESULT)
    set_description : Proc(IBackgroundCopyJob3*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IBackgroundCopyJob3*, LibC::LPWSTR*, HRESULT)
    set_priority : Proc(IBackgroundCopyJob3*, BG_JOB_PRIORITY, HRESULT)
    get_priority : Proc(IBackgroundCopyJob3*, BG_JOB_PRIORITY*, HRESULT)
    set_notify_flags : Proc(IBackgroundCopyJob3*, UInt32, HRESULT)
    get_notify_flags : Proc(IBackgroundCopyJob3*, UInt32*, HRESULT)
    set_notify_interface : Proc(IBackgroundCopyJob3*, IUnknown, HRESULT)
    get_notify_interface : Proc(IBackgroundCopyJob3*, IUnknown*, HRESULT)
    set_minimum_retry_delay : Proc(IBackgroundCopyJob3*, UInt32, HRESULT)
    get_minimum_retry_delay : Proc(IBackgroundCopyJob3*, UInt32*, HRESULT)
    set_no_progress_timeout : Proc(IBackgroundCopyJob3*, UInt32, HRESULT)
    get_no_progress_timeout : Proc(IBackgroundCopyJob3*, UInt32*, HRESULT)
    get_error_count : Proc(IBackgroundCopyJob3*, UInt32*, HRESULT)
    set_proxy_settings : Proc(IBackgroundCopyJob3*, BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_settings : Proc(IBackgroundCopyJob3*, BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    take_ownership : Proc(IBackgroundCopyJob3*, HRESULT)
    set_notify_cmd_line : Proc(IBackgroundCopyJob3*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_notify_cmd_line : Proc(IBackgroundCopyJob3*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_reply_progress : Proc(IBackgroundCopyJob3*, BG_JOB_REPLY_PROGRESS*, HRESULT)
    get_reply_data : Proc(IBackgroundCopyJob3*, UInt8**, UInt64*, HRESULT)
    set_reply_file_name : Proc(IBackgroundCopyJob3*, LibC::LPWSTR, HRESULT)
    get_reply_file_name : Proc(IBackgroundCopyJob3*, LibC::LPWSTR*, HRESULT)
    set_credentials : Proc(IBackgroundCopyJob3*, BG_AUTH_CREDENTIALS*, HRESULT)
    remove_credentials : Proc(IBackgroundCopyJob3*, BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)
    replace_remote_prefix : Proc(IBackgroundCopyJob3*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    add_file_with_ranges : Proc(IBackgroundCopyJob3*, LibC::LPWSTR, LibC::LPWSTR, UInt32, BG_FILE_RANGE*, HRESULT)
    set_file_acl_flags : Proc(IBackgroundCopyJob3*, UInt32, HRESULT)
    get_file_acl_flags : Proc(IBackgroundCopyJob3*, UInt32*, HRESULT)
  end

  struct IBackgroundCopyJob3
    lpVtbl : IBackgroundCopyJob3VTbl*
  end

  struct IBackgroundCopyFile2VTbl
    query_interface : Proc(IBackgroundCopyFile2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyFile2*, UInt32)
    release : Proc(IBackgroundCopyFile2*, UInt32)
    get_remote_name : Proc(IBackgroundCopyFile2*, LibC::LPWSTR*, HRESULT)
    get_local_name : Proc(IBackgroundCopyFile2*, LibC::LPWSTR*, HRESULT)
    get_progress : Proc(IBackgroundCopyFile2*, BG_FILE_PROGRESS*, HRESULT)
    get_file_ranges : Proc(IBackgroundCopyFile2*, UInt32*, BG_FILE_RANGE**, HRESULT)
    set_remote_name : Proc(IBackgroundCopyFile2*, LibC::LPWSTR, HRESULT)
  end

  struct IBackgroundCopyFile2
    lpVtbl : IBackgroundCopyFile2VTbl*
  end

  struct IBackgroundCopyJobHttpOptionsVTbl
    query_interface : Proc(IBackgroundCopyJobHttpOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJobHttpOptions*, UInt32)
    release : Proc(IBackgroundCopyJobHttpOptions*, UInt32)
    set_client_certificate_by_id : Proc(IBackgroundCopyJobHttpOptions*, BG_CERT_STORE_LOCATION, LibC::LPWSTR, UInt8*, HRESULT)
    set_client_certificate_by_name : Proc(IBackgroundCopyJobHttpOptions*, BG_CERT_STORE_LOCATION, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    remove_client_certificate : Proc(IBackgroundCopyJobHttpOptions*, HRESULT)
    get_client_certificate : Proc(IBackgroundCopyJobHttpOptions*, BG_CERT_STORE_LOCATION*, LibC::LPWSTR*, UInt8**, LibC::LPWSTR*, HRESULT)
    set_custom_headers : Proc(IBackgroundCopyJobHttpOptions*, LibC::LPWSTR, HRESULT)
    get_custom_headers : Proc(IBackgroundCopyJobHttpOptions*, LibC::LPWSTR*, HRESULT)
    set_security_flags : Proc(IBackgroundCopyJobHttpOptions*, UInt32, HRESULT)
    get_security_flags : Proc(IBackgroundCopyJobHttpOptions*, UInt32*, HRESULT)
  end

  struct IBackgroundCopyJobHttpOptions
    lpVtbl : IBackgroundCopyJobHttpOptionsVTbl*
  end

  struct IBitsPeerCacheRecordVTbl
    query_interface : Proc(IBitsPeerCacheRecord*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBitsPeerCacheRecord*, UInt32)
    release : Proc(IBitsPeerCacheRecord*, UInt32)
    get_id : Proc(IBitsPeerCacheRecord*, Guid*, HRESULT)
    get_origin_url : Proc(IBitsPeerCacheRecord*, LibC::LPWSTR*, HRESULT)
    get_file_size : Proc(IBitsPeerCacheRecord*, UInt64*, HRESULT)
    get_file_modification_time : Proc(IBitsPeerCacheRecord*, FILETIME*, HRESULT)
    get_last_access_time : Proc(IBitsPeerCacheRecord*, FILETIME*, HRESULT)
    is_file_validated : Proc(IBitsPeerCacheRecord*, HRESULT)
    get_file_ranges : Proc(IBitsPeerCacheRecord*, UInt32*, BG_FILE_RANGE**, HRESULT)
  end

  struct IBitsPeerCacheRecord
    lpVtbl : IBitsPeerCacheRecordVTbl*
  end

  struct IEnumBitsPeerCacheRecordsVTbl
    query_interface : Proc(IEnumBitsPeerCacheRecords*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumBitsPeerCacheRecords*, UInt32)
    release : Proc(IEnumBitsPeerCacheRecords*, UInt32)
    next : Proc(IEnumBitsPeerCacheRecords*, UInt32, IBitsPeerCacheRecord*, UInt32*, HRESULT)
    skip : Proc(IEnumBitsPeerCacheRecords*, UInt32, HRESULT)
    reset : Proc(IEnumBitsPeerCacheRecords*, HRESULT)
    clone : Proc(IEnumBitsPeerCacheRecords*, IEnumBitsPeerCacheRecords*, HRESULT)
    get_count : Proc(IEnumBitsPeerCacheRecords*, UInt32*, HRESULT)
  end

  struct IEnumBitsPeerCacheRecords
    lpVtbl : IEnumBitsPeerCacheRecordsVTbl*
  end

  struct IBitsPeerVTbl
    query_interface : Proc(IBitsPeer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBitsPeer*, UInt32)
    release : Proc(IBitsPeer*, UInt32)
    get_peer_name : Proc(IBitsPeer*, LibC::LPWSTR*, HRESULT)
    is_authenticated : Proc(IBitsPeer*, LibC::BOOL*, HRESULT)
    is_available : Proc(IBitsPeer*, LibC::BOOL*, HRESULT)
  end

  struct IBitsPeer
    lpVtbl : IBitsPeerVTbl*
  end

  struct IEnumBitsPeersVTbl
    query_interface : Proc(IEnumBitsPeers*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumBitsPeers*, UInt32)
    release : Proc(IEnumBitsPeers*, UInt32)
    next : Proc(IEnumBitsPeers*, UInt32, IBitsPeer*, UInt32*, HRESULT)
    skip : Proc(IEnumBitsPeers*, UInt32, HRESULT)
    reset : Proc(IEnumBitsPeers*, HRESULT)
    clone : Proc(IEnumBitsPeers*, IEnumBitsPeers*, HRESULT)
    get_count : Proc(IEnumBitsPeers*, UInt32*, HRESULT)
  end

  struct IEnumBitsPeers
    lpVtbl : IEnumBitsPeersVTbl*
  end

  struct IBitsPeerCacheAdministrationVTbl
    query_interface : Proc(IBitsPeerCacheAdministration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBitsPeerCacheAdministration*, UInt32)
    release : Proc(IBitsPeerCacheAdministration*, UInt32)
    get_maximum_cache_size : Proc(IBitsPeerCacheAdministration*, UInt32*, HRESULT)
    set_maximum_cache_size : Proc(IBitsPeerCacheAdministration*, UInt32, HRESULT)
    get_maximum_content_age : Proc(IBitsPeerCacheAdministration*, UInt32*, HRESULT)
    set_maximum_content_age : Proc(IBitsPeerCacheAdministration*, UInt32, HRESULT)
    get_configuration_flags : Proc(IBitsPeerCacheAdministration*, UInt32*, HRESULT)
    set_configuration_flags : Proc(IBitsPeerCacheAdministration*, UInt32, HRESULT)
    enum_records : Proc(IBitsPeerCacheAdministration*, IEnumBitsPeerCacheRecords*, HRESULT)
    get_record : Proc(IBitsPeerCacheAdministration*, Guid*, IBitsPeerCacheRecord*, HRESULT)
    clear_records : Proc(IBitsPeerCacheAdministration*, HRESULT)
    delete_record : Proc(IBitsPeerCacheAdministration*, Guid*, HRESULT)
    delete_url : Proc(IBitsPeerCacheAdministration*, LibC::LPWSTR, HRESULT)
    enum_peers : Proc(IBitsPeerCacheAdministration*, IEnumBitsPeers*, HRESULT)
    clear_peers : Proc(IBitsPeerCacheAdministration*, HRESULT)
    discover_peers : Proc(IBitsPeerCacheAdministration*, HRESULT)
  end

  struct IBitsPeerCacheAdministration
    lpVtbl : IBitsPeerCacheAdministrationVTbl*
  end

  struct IBackgroundCopyJob4VTbl
    query_interface : Proc(IBackgroundCopyJob4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJob4*, UInt32)
    release : Proc(IBackgroundCopyJob4*, UInt32)
    add_file_set : Proc(IBackgroundCopyJob4*, UInt32, BG_FILE_INFO*, HRESULT)
    add_file : Proc(IBackgroundCopyJob4*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    enum_files : Proc(IBackgroundCopyJob4*, IEnumBackgroundCopyFiles*, HRESULT)
    suspend : Proc(IBackgroundCopyJob4*, HRESULT)
    resume : Proc(IBackgroundCopyJob4*, HRESULT)
    cancel : Proc(IBackgroundCopyJob4*, HRESULT)
    complete : Proc(IBackgroundCopyJob4*, HRESULT)
    get_id : Proc(IBackgroundCopyJob4*, Guid*, HRESULT)
    get_type : Proc(IBackgroundCopyJob4*, BG_JOB_TYPE*, HRESULT)
    get_progress : Proc(IBackgroundCopyJob4*, BG_JOB_PROGRESS*, HRESULT)
    get_times : Proc(IBackgroundCopyJob4*, BG_JOB_TIMES*, HRESULT)
    get_state : Proc(IBackgroundCopyJob4*, BG_JOB_STATE*, HRESULT)
    get_error : Proc(IBackgroundCopyJob4*, IBackgroundCopyError*, HRESULT)
    get_owner : Proc(IBackgroundCopyJob4*, LibC::LPWSTR*, HRESULT)
    set_display_name : Proc(IBackgroundCopyJob4*, LibC::LPWSTR, HRESULT)
    get_display_name : Proc(IBackgroundCopyJob4*, LibC::LPWSTR*, HRESULT)
    set_description : Proc(IBackgroundCopyJob4*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IBackgroundCopyJob4*, LibC::LPWSTR*, HRESULT)
    set_priority : Proc(IBackgroundCopyJob4*, BG_JOB_PRIORITY, HRESULT)
    get_priority : Proc(IBackgroundCopyJob4*, BG_JOB_PRIORITY*, HRESULT)
    set_notify_flags : Proc(IBackgroundCopyJob4*, UInt32, HRESULT)
    get_notify_flags : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
    set_notify_interface : Proc(IBackgroundCopyJob4*, IUnknown, HRESULT)
    get_notify_interface : Proc(IBackgroundCopyJob4*, IUnknown*, HRESULT)
    set_minimum_retry_delay : Proc(IBackgroundCopyJob4*, UInt32, HRESULT)
    get_minimum_retry_delay : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
    set_no_progress_timeout : Proc(IBackgroundCopyJob4*, UInt32, HRESULT)
    get_no_progress_timeout : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
    get_error_count : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
    set_proxy_settings : Proc(IBackgroundCopyJob4*, BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_settings : Proc(IBackgroundCopyJob4*, BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    take_ownership : Proc(IBackgroundCopyJob4*, HRESULT)
    set_notify_cmd_line : Proc(IBackgroundCopyJob4*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_notify_cmd_line : Proc(IBackgroundCopyJob4*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_reply_progress : Proc(IBackgroundCopyJob4*, BG_JOB_REPLY_PROGRESS*, HRESULT)
    get_reply_data : Proc(IBackgroundCopyJob4*, UInt8**, UInt64*, HRESULT)
    set_reply_file_name : Proc(IBackgroundCopyJob4*, LibC::LPWSTR, HRESULT)
    get_reply_file_name : Proc(IBackgroundCopyJob4*, LibC::LPWSTR*, HRESULT)
    set_credentials : Proc(IBackgroundCopyJob4*, BG_AUTH_CREDENTIALS*, HRESULT)
    remove_credentials : Proc(IBackgroundCopyJob4*, BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)
    replace_remote_prefix : Proc(IBackgroundCopyJob4*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    add_file_with_ranges : Proc(IBackgroundCopyJob4*, LibC::LPWSTR, LibC::LPWSTR, UInt32, BG_FILE_RANGE*, HRESULT)
    set_file_acl_flags : Proc(IBackgroundCopyJob4*, UInt32, HRESULT)
    get_file_acl_flags : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
    set_peer_caching_flags : Proc(IBackgroundCopyJob4*, UInt32, HRESULT)
    get_peer_caching_flags : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
    get_owner_integrity_level : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
    get_owner_elevation_state : Proc(IBackgroundCopyJob4*, LibC::BOOL*, HRESULT)
    set_maximum_download_time : Proc(IBackgroundCopyJob4*, UInt32, HRESULT)
    get_maximum_download_time : Proc(IBackgroundCopyJob4*, UInt32*, HRESULT)
  end

  struct IBackgroundCopyJob4
    lpVtbl : IBackgroundCopyJob4VTbl*
  end

  struct IBackgroundCopyFile3VTbl
    query_interface : Proc(IBackgroundCopyFile3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyFile3*, UInt32)
    release : Proc(IBackgroundCopyFile3*, UInt32)
    get_remote_name : Proc(IBackgroundCopyFile3*, LibC::LPWSTR*, HRESULT)
    get_local_name : Proc(IBackgroundCopyFile3*, LibC::LPWSTR*, HRESULT)
    get_progress : Proc(IBackgroundCopyFile3*, BG_FILE_PROGRESS*, HRESULT)
    get_file_ranges : Proc(IBackgroundCopyFile3*, UInt32*, BG_FILE_RANGE**, HRESULT)
    set_remote_name : Proc(IBackgroundCopyFile3*, LibC::LPWSTR, HRESULT)
    get_temporary_name : Proc(IBackgroundCopyFile3*, LibC::LPWSTR*, HRESULT)
    set_validation_state : Proc(IBackgroundCopyFile3*, LibC::BOOL, HRESULT)
    get_validation_state : Proc(IBackgroundCopyFile3*, LibC::BOOL*, HRESULT)
    is_downloaded_from_peer : Proc(IBackgroundCopyFile3*, LibC::BOOL*, HRESULT)
  end

  struct IBackgroundCopyFile3
    lpVtbl : IBackgroundCopyFile3VTbl*
  end

  struct IBackgroundCopyCallback2VTbl
    query_interface : Proc(IBackgroundCopyCallback2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyCallback2*, UInt32)
    release : Proc(IBackgroundCopyCallback2*, UInt32)
    job_transferred : Proc(IBackgroundCopyCallback2*, IBackgroundCopyJob, HRESULT)
    job_error : Proc(IBackgroundCopyCallback2*, IBackgroundCopyJob, IBackgroundCopyError, HRESULT)
    job_modification : Proc(IBackgroundCopyCallback2*, IBackgroundCopyJob, UInt32, HRESULT)
    file_transferred : Proc(IBackgroundCopyCallback2*, IBackgroundCopyJob, IBackgroundCopyFile, HRESULT)
  end

  struct IBackgroundCopyCallback2
    lpVtbl : IBackgroundCopyCallback2VTbl*
  end

  struct IBitsTokenOptionsVTbl
    query_interface : Proc(IBitsTokenOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBitsTokenOptions*, UInt32)
    release : Proc(IBitsTokenOptions*, UInt32)
    set_helper_token_flags : Proc(IBitsTokenOptions*, BG_TOKEN, HRESULT)
    get_helper_token_flags : Proc(IBitsTokenOptions*, BG_TOKEN*, HRESULT)
    set_helper_token : Proc(IBitsTokenOptions*, HRESULT)
    clear_helper_token : Proc(IBitsTokenOptions*, HRESULT)
    get_helper_token_sid : Proc(IBitsTokenOptions*, LibC::LPWSTR*, HRESULT)
  end

  struct IBitsTokenOptions
    lpVtbl : IBitsTokenOptionsVTbl*
  end

  struct IBackgroundCopyFile4VTbl
    query_interface : Proc(IBackgroundCopyFile4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyFile4*, UInt32)
    release : Proc(IBackgroundCopyFile4*, UInt32)
    get_remote_name : Proc(IBackgroundCopyFile4*, LibC::LPWSTR*, HRESULT)
    get_local_name : Proc(IBackgroundCopyFile4*, LibC::LPWSTR*, HRESULT)
    get_progress : Proc(IBackgroundCopyFile4*, BG_FILE_PROGRESS*, HRESULT)
    get_file_ranges : Proc(IBackgroundCopyFile4*, UInt32*, BG_FILE_RANGE**, HRESULT)
    set_remote_name : Proc(IBackgroundCopyFile4*, LibC::LPWSTR, HRESULT)
    get_temporary_name : Proc(IBackgroundCopyFile4*, LibC::LPWSTR*, HRESULT)
    set_validation_state : Proc(IBackgroundCopyFile4*, LibC::BOOL, HRESULT)
    get_validation_state : Proc(IBackgroundCopyFile4*, LibC::BOOL*, HRESULT)
    is_downloaded_from_peer : Proc(IBackgroundCopyFile4*, LibC::BOOL*, HRESULT)
    get_peer_download_stats : Proc(IBackgroundCopyFile4*, UInt64*, UInt64*, HRESULT)
  end

  struct IBackgroundCopyFile4
    lpVtbl : IBackgroundCopyFile4VTbl*
  end

  struct IBackgroundCopyJob5VTbl
    query_interface : Proc(IBackgroundCopyJob5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJob5*, UInt32)
    release : Proc(IBackgroundCopyJob5*, UInt32)
    add_file_set : Proc(IBackgroundCopyJob5*, UInt32, BG_FILE_INFO*, HRESULT)
    add_file : Proc(IBackgroundCopyJob5*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    enum_files : Proc(IBackgroundCopyJob5*, IEnumBackgroundCopyFiles*, HRESULT)
    suspend : Proc(IBackgroundCopyJob5*, HRESULT)
    resume : Proc(IBackgroundCopyJob5*, HRESULT)
    cancel : Proc(IBackgroundCopyJob5*, HRESULT)
    complete : Proc(IBackgroundCopyJob5*, HRESULT)
    get_id : Proc(IBackgroundCopyJob5*, Guid*, HRESULT)
    get_type : Proc(IBackgroundCopyJob5*, BG_JOB_TYPE*, HRESULT)
    get_progress : Proc(IBackgroundCopyJob5*, BG_JOB_PROGRESS*, HRESULT)
    get_times : Proc(IBackgroundCopyJob5*, BG_JOB_TIMES*, HRESULT)
    get_state : Proc(IBackgroundCopyJob5*, BG_JOB_STATE*, HRESULT)
    get_error : Proc(IBackgroundCopyJob5*, IBackgroundCopyError*, HRESULT)
    get_owner : Proc(IBackgroundCopyJob5*, LibC::LPWSTR*, HRESULT)
    set_display_name : Proc(IBackgroundCopyJob5*, LibC::LPWSTR, HRESULT)
    get_display_name : Proc(IBackgroundCopyJob5*, LibC::LPWSTR*, HRESULT)
    set_description : Proc(IBackgroundCopyJob5*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IBackgroundCopyJob5*, LibC::LPWSTR*, HRESULT)
    set_priority : Proc(IBackgroundCopyJob5*, BG_JOB_PRIORITY, HRESULT)
    get_priority : Proc(IBackgroundCopyJob5*, BG_JOB_PRIORITY*, HRESULT)
    set_notify_flags : Proc(IBackgroundCopyJob5*, UInt32, HRESULT)
    get_notify_flags : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    set_notify_interface : Proc(IBackgroundCopyJob5*, IUnknown, HRESULT)
    get_notify_interface : Proc(IBackgroundCopyJob5*, IUnknown*, HRESULT)
    set_minimum_retry_delay : Proc(IBackgroundCopyJob5*, UInt32, HRESULT)
    get_minimum_retry_delay : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    set_no_progress_timeout : Proc(IBackgroundCopyJob5*, UInt32, HRESULT)
    get_no_progress_timeout : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    get_error_count : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    set_proxy_settings : Proc(IBackgroundCopyJob5*, BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_settings : Proc(IBackgroundCopyJob5*, BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    take_ownership : Proc(IBackgroundCopyJob5*, HRESULT)
    set_notify_cmd_line : Proc(IBackgroundCopyJob5*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_notify_cmd_line : Proc(IBackgroundCopyJob5*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_reply_progress : Proc(IBackgroundCopyJob5*, BG_JOB_REPLY_PROGRESS*, HRESULT)
    get_reply_data : Proc(IBackgroundCopyJob5*, UInt8**, UInt64*, HRESULT)
    set_reply_file_name : Proc(IBackgroundCopyJob5*, LibC::LPWSTR, HRESULT)
    get_reply_file_name : Proc(IBackgroundCopyJob5*, LibC::LPWSTR*, HRESULT)
    set_credentials : Proc(IBackgroundCopyJob5*, BG_AUTH_CREDENTIALS*, HRESULT)
    remove_credentials : Proc(IBackgroundCopyJob5*, BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)
    replace_remote_prefix : Proc(IBackgroundCopyJob5*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    add_file_with_ranges : Proc(IBackgroundCopyJob5*, LibC::LPWSTR, LibC::LPWSTR, UInt32, BG_FILE_RANGE*, HRESULT)
    set_file_acl_flags : Proc(IBackgroundCopyJob5*, UInt32, HRESULT)
    get_file_acl_flags : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    set_peer_caching_flags : Proc(IBackgroundCopyJob5*, UInt32, HRESULT)
    get_peer_caching_flags : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    get_owner_integrity_level : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    get_owner_elevation_state : Proc(IBackgroundCopyJob5*, LibC::BOOL*, HRESULT)
    set_maximum_download_time : Proc(IBackgroundCopyJob5*, UInt32, HRESULT)
    get_maximum_download_time : Proc(IBackgroundCopyJob5*, UInt32*, HRESULT)
    set_property : Proc(IBackgroundCopyJob5*, BITS_JOB_PROPERTY_ID, BITS_JOB_PROPERTY_VALUE, HRESULT)
    get_property : Proc(IBackgroundCopyJob5*, BITS_JOB_PROPERTY_ID, BITS_JOB_PROPERTY_VALUE*, HRESULT)
  end

  struct IBackgroundCopyJob5
    lpVtbl : IBackgroundCopyJob5VTbl*
  end

  struct IBackgroundCopyFile5VTbl
    query_interface : Proc(IBackgroundCopyFile5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyFile5*, UInt32)
    release : Proc(IBackgroundCopyFile5*, UInt32)
    get_remote_name : Proc(IBackgroundCopyFile5*, LibC::LPWSTR*, HRESULT)
    get_local_name : Proc(IBackgroundCopyFile5*, LibC::LPWSTR*, HRESULT)
    get_progress : Proc(IBackgroundCopyFile5*, BG_FILE_PROGRESS*, HRESULT)
    get_file_ranges : Proc(IBackgroundCopyFile5*, UInt32*, BG_FILE_RANGE**, HRESULT)
    set_remote_name : Proc(IBackgroundCopyFile5*, LibC::LPWSTR, HRESULT)
    get_temporary_name : Proc(IBackgroundCopyFile5*, LibC::LPWSTR*, HRESULT)
    set_validation_state : Proc(IBackgroundCopyFile5*, LibC::BOOL, HRESULT)
    get_validation_state : Proc(IBackgroundCopyFile5*, LibC::BOOL*, HRESULT)
    is_downloaded_from_peer : Proc(IBackgroundCopyFile5*, LibC::BOOL*, HRESULT)
    get_peer_download_stats : Proc(IBackgroundCopyFile5*, UInt64*, UInt64*, HRESULT)
    set_property : Proc(IBackgroundCopyFile5*, BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE, HRESULT)
    get_property : Proc(IBackgroundCopyFile5*, BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE*, HRESULT)
  end

  struct IBackgroundCopyFile5
    lpVtbl : IBackgroundCopyFile5VTbl*
  end

  struct IBackgroundCopyCallback3VTbl
    query_interface : Proc(IBackgroundCopyCallback3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyCallback3*, UInt32)
    release : Proc(IBackgroundCopyCallback3*, UInt32)
    job_transferred : Proc(IBackgroundCopyCallback3*, IBackgroundCopyJob, HRESULT)
    job_error : Proc(IBackgroundCopyCallback3*, IBackgroundCopyJob, IBackgroundCopyError, HRESULT)
    job_modification : Proc(IBackgroundCopyCallback3*, IBackgroundCopyJob, UInt32, HRESULT)
    file_transferred : Proc(IBackgroundCopyCallback3*, IBackgroundCopyJob, IBackgroundCopyFile, HRESULT)
    file_ranges_transferred : Proc(IBackgroundCopyCallback3*, IBackgroundCopyJob, IBackgroundCopyFile, UInt32, BG_FILE_RANGE*, HRESULT)
  end

  struct IBackgroundCopyCallback3
    lpVtbl : IBackgroundCopyCallback3VTbl*
  end

  struct IBackgroundCopyFile6VTbl
    query_interface : Proc(IBackgroundCopyFile6*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyFile6*, UInt32)
    release : Proc(IBackgroundCopyFile6*, UInt32)
    get_remote_name : Proc(IBackgroundCopyFile6*, LibC::LPWSTR*, HRESULT)
    get_local_name : Proc(IBackgroundCopyFile6*, LibC::LPWSTR*, HRESULT)
    get_progress : Proc(IBackgroundCopyFile6*, BG_FILE_PROGRESS*, HRESULT)
    get_file_ranges : Proc(IBackgroundCopyFile6*, UInt32*, BG_FILE_RANGE**, HRESULT)
    set_remote_name : Proc(IBackgroundCopyFile6*, LibC::LPWSTR, HRESULT)
    get_temporary_name : Proc(IBackgroundCopyFile6*, LibC::LPWSTR*, HRESULT)
    set_validation_state : Proc(IBackgroundCopyFile6*, LibC::BOOL, HRESULT)
    get_validation_state : Proc(IBackgroundCopyFile6*, LibC::BOOL*, HRESULT)
    is_downloaded_from_peer : Proc(IBackgroundCopyFile6*, LibC::BOOL*, HRESULT)
    get_peer_download_stats : Proc(IBackgroundCopyFile6*, UInt64*, UInt64*, HRESULT)
    set_property : Proc(IBackgroundCopyFile6*, BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE, HRESULT)
    get_property : Proc(IBackgroundCopyFile6*, BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE*, HRESULT)
    update_download_position : Proc(IBackgroundCopyFile6*, UInt64, HRESULT)
    request_file_ranges : Proc(IBackgroundCopyFile6*, UInt32, BG_FILE_RANGE*, HRESULT)
    get_filled_file_ranges : Proc(IBackgroundCopyFile6*, UInt32*, BG_FILE_RANGE**, HRESULT)
  end

  struct IBackgroundCopyFile6
    lpVtbl : IBackgroundCopyFile6VTbl*
  end

  struct IBackgroundCopyJobHttpOptions2VTbl
    query_interface : Proc(IBackgroundCopyJobHttpOptions2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJobHttpOptions2*, UInt32)
    release : Proc(IBackgroundCopyJobHttpOptions2*, UInt32)
    set_client_certificate_by_id : Proc(IBackgroundCopyJobHttpOptions2*, BG_CERT_STORE_LOCATION, LibC::LPWSTR, UInt8*, HRESULT)
    set_client_certificate_by_name : Proc(IBackgroundCopyJobHttpOptions2*, BG_CERT_STORE_LOCATION, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    remove_client_certificate : Proc(IBackgroundCopyJobHttpOptions2*, HRESULT)
    get_client_certificate : Proc(IBackgroundCopyJobHttpOptions2*, BG_CERT_STORE_LOCATION*, LibC::LPWSTR*, UInt8**, LibC::LPWSTR*, HRESULT)
    set_custom_headers : Proc(IBackgroundCopyJobHttpOptions2*, LibC::LPWSTR, HRESULT)
    get_custom_headers : Proc(IBackgroundCopyJobHttpOptions2*, LibC::LPWSTR*, HRESULT)
    set_security_flags : Proc(IBackgroundCopyJobHttpOptions2*, UInt32, HRESULT)
    get_security_flags : Proc(IBackgroundCopyJobHttpOptions2*, UInt32*, HRESULT)
    set_http_method : Proc(IBackgroundCopyJobHttpOptions2*, LibC::LPWSTR, HRESULT)
    get_http_method : Proc(IBackgroundCopyJobHttpOptions2*, LibC::LPWSTR*, HRESULT)
  end

  struct IBackgroundCopyJobHttpOptions2
    lpVtbl : IBackgroundCopyJobHttpOptions2VTbl*
  end

  struct IBackgroundCopyServerCertificateValidationCallbackVTbl
    query_interface : Proc(IBackgroundCopyServerCertificateValidationCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyServerCertificateValidationCallback*, UInt32)
    release : Proc(IBackgroundCopyServerCertificateValidationCallback*, UInt32)
    validate_server_certificate : Proc(IBackgroundCopyServerCertificateValidationCallback*, IBackgroundCopyJob, IBackgroundCopyFile, UInt32, UInt8*, UInt32, UInt32, UInt8*, HRESULT)
  end

  struct IBackgroundCopyServerCertificateValidationCallback
    lpVtbl : IBackgroundCopyServerCertificateValidationCallbackVTbl*
  end

  struct IBackgroundCopyJobHttpOptions3VTbl
    query_interface : Proc(IBackgroundCopyJobHttpOptions3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJobHttpOptions3*, UInt32)
    release : Proc(IBackgroundCopyJobHttpOptions3*, UInt32)
    set_client_certificate_by_id : Proc(IBackgroundCopyJobHttpOptions3*, BG_CERT_STORE_LOCATION, LibC::LPWSTR, UInt8*, HRESULT)
    set_client_certificate_by_name : Proc(IBackgroundCopyJobHttpOptions3*, BG_CERT_STORE_LOCATION, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    remove_client_certificate : Proc(IBackgroundCopyJobHttpOptions3*, HRESULT)
    get_client_certificate : Proc(IBackgroundCopyJobHttpOptions3*, BG_CERT_STORE_LOCATION*, LibC::LPWSTR*, UInt8**, LibC::LPWSTR*, HRESULT)
    set_custom_headers : Proc(IBackgroundCopyJobHttpOptions3*, LibC::LPWSTR, HRESULT)
    get_custom_headers : Proc(IBackgroundCopyJobHttpOptions3*, LibC::LPWSTR*, HRESULT)
    set_security_flags : Proc(IBackgroundCopyJobHttpOptions3*, UInt32, HRESULT)
    get_security_flags : Proc(IBackgroundCopyJobHttpOptions3*, UInt32*, HRESULT)
    set_http_method : Proc(IBackgroundCopyJobHttpOptions3*, LibC::LPWSTR, HRESULT)
    get_http_method : Proc(IBackgroundCopyJobHttpOptions3*, LibC::LPWSTR*, HRESULT)
    set_server_certificate_validation_interface : Proc(IBackgroundCopyJobHttpOptions3*, IUnknown, HRESULT)
    make_custom_headers_write_only : Proc(IBackgroundCopyJobHttpOptions3*, HRESULT)
  end

  struct IBackgroundCopyJobHttpOptions3
    lpVtbl : IBackgroundCopyJobHttpOptions3VTbl*
  end

  struct IBITSExtensionSetupVTbl
    query_interface : Proc(IBITSExtensionSetup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBITSExtensionSetup*, UInt32)
    release : Proc(IBITSExtensionSetup*, UInt32)
    get_type_info_count : Proc(IBITSExtensionSetup*, UInt32*, HRESULT)
    get_type_info : Proc(IBITSExtensionSetup*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IBITSExtensionSetup*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IBITSExtensionSetup*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    enable_bits_uploads : Proc(IBITSExtensionSetup*, HRESULT)
    disable_bits_uploads : Proc(IBITSExtensionSetup*, HRESULT)
    get_cleanup_task_name : Proc(IBITSExtensionSetup*, UInt8**, HRESULT)
    get_cleanup_task : Proc(IBITSExtensionSetup*, Guid*, IUnknown*, HRESULT)
  end

  struct IBITSExtensionSetup
    lpVtbl : IBITSExtensionSetupVTbl*
  end

  struct IBITSExtensionSetupFactoryVTbl
    query_interface : Proc(IBITSExtensionSetupFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBITSExtensionSetupFactory*, UInt32)
    release : Proc(IBITSExtensionSetupFactory*, UInt32)
    get_type_info_count : Proc(IBITSExtensionSetupFactory*, UInt32*, HRESULT)
    get_type_info : Proc(IBITSExtensionSetupFactory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IBITSExtensionSetupFactory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IBITSExtensionSetupFactory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_object : Proc(IBITSExtensionSetupFactory*, UInt8*, IBITSExtensionSetup*, HRESULT)
  end

  struct IBITSExtensionSetupFactory
    lpVtbl : IBITSExtensionSetupFactoryVTbl*
  end

  struct IBackgroundCopyJob1VTbl
    query_interface : Proc(IBackgroundCopyJob1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyJob1*, UInt32)
    release : Proc(IBackgroundCopyJob1*, UInt32)
    cancel_job : Proc(IBackgroundCopyJob1*, HRESULT)
    get_progress : Proc(IBackgroundCopyJob1*, UInt32, UInt32*, HRESULT)
    get_status : Proc(IBackgroundCopyJob1*, UInt32*, UInt32*, UInt32*, UInt32*, HRESULT)
    add_files : Proc(IBackgroundCopyJob1*, UInt32, FILESETINFO**, HRESULT)
    get_file : Proc(IBackgroundCopyJob1*, UInt32, FILESETINFO*, HRESULT)
    get_file_count : Proc(IBackgroundCopyJob1*, UInt32*, HRESULT)
    switch_to_foreground : Proc(IBackgroundCopyJob1*, HRESULT)
    get_job_id : Proc(IBackgroundCopyJob1*, Guid*, HRESULT)
  end

  struct IBackgroundCopyJob1
    lpVtbl : IBackgroundCopyJob1VTbl*
  end

  struct IEnumBackgroundCopyJobs1VTbl
    query_interface : Proc(IEnumBackgroundCopyJobs1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumBackgroundCopyJobs1*, UInt32)
    release : Proc(IEnumBackgroundCopyJobs1*, UInt32)
    next : Proc(IEnumBackgroundCopyJobs1*, UInt32, Guid*, UInt32*, HRESULT)
    skip : Proc(IEnumBackgroundCopyJobs1*, UInt32, HRESULT)
    reset : Proc(IEnumBackgroundCopyJobs1*, HRESULT)
    clone : Proc(IEnumBackgroundCopyJobs1*, IEnumBackgroundCopyJobs1*, HRESULT)
    get_count : Proc(IEnumBackgroundCopyJobs1*, UInt32*, HRESULT)
  end

  struct IEnumBackgroundCopyJobs1
    lpVtbl : IEnumBackgroundCopyJobs1VTbl*
  end

  struct IBackgroundCopyGroupVTbl
    query_interface : Proc(IBackgroundCopyGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyGroup*, UInt32)
    release : Proc(IBackgroundCopyGroup*, UInt32)
    get_prop : Proc(IBackgroundCopyGroup*, GROUPPROP, VARIANT*, HRESULT)
    set_prop : Proc(IBackgroundCopyGroup*, GROUPPROP, VARIANT*, HRESULT)
    get_progress : Proc(IBackgroundCopyGroup*, UInt32, UInt32*, HRESULT)
    get_status : Proc(IBackgroundCopyGroup*, UInt32*, UInt32*, HRESULT)
    get_job : Proc(IBackgroundCopyGroup*, Guid, IBackgroundCopyJob1*, HRESULT)
    suspend_group : Proc(IBackgroundCopyGroup*, HRESULT)
    resume_group : Proc(IBackgroundCopyGroup*, HRESULT)
    cancel_group : Proc(IBackgroundCopyGroup*, HRESULT)
    get_size : Proc(IBackgroundCopyGroup*, UInt32*, HRESULT)
    get_group_id : Proc(IBackgroundCopyGroup*, Guid*, HRESULT)
    create_job : Proc(IBackgroundCopyGroup*, Guid, IBackgroundCopyJob1*, HRESULT)
    enum_jobs : Proc(IBackgroundCopyGroup*, UInt32, IEnumBackgroundCopyJobs1*, HRESULT)
    switch_to_foreground : Proc(IBackgroundCopyGroup*, HRESULT)
    query_new_job_interface : Proc(IBackgroundCopyGroup*, Guid*, IUnknown*, HRESULT)
    set_notification_pointer : Proc(IBackgroundCopyGroup*, Guid*, IUnknown, HRESULT)
  end

  struct IBackgroundCopyGroup
    lpVtbl : IBackgroundCopyGroupVTbl*
  end

  struct IEnumBackgroundCopyGroupsVTbl
    query_interface : Proc(IEnumBackgroundCopyGroups*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumBackgroundCopyGroups*, UInt32)
    release : Proc(IEnumBackgroundCopyGroups*, UInt32)
    next : Proc(IEnumBackgroundCopyGroups*, UInt32, Guid*, UInt32*, HRESULT)
    skip : Proc(IEnumBackgroundCopyGroups*, UInt32, HRESULT)
    reset : Proc(IEnumBackgroundCopyGroups*, HRESULT)
    clone : Proc(IEnumBackgroundCopyGroups*, IEnumBackgroundCopyGroups*, HRESULT)
    get_count : Proc(IEnumBackgroundCopyGroups*, UInt32*, HRESULT)
  end

  struct IEnumBackgroundCopyGroups
    lpVtbl : IEnumBackgroundCopyGroupsVTbl*
  end

  struct IBackgroundCopyCallback1VTbl
    query_interface : Proc(IBackgroundCopyCallback1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyCallback1*, UInt32)
    release : Proc(IBackgroundCopyCallback1*, UInt32)
    on_status : Proc(IBackgroundCopyCallback1*, IBackgroundCopyGroup, IBackgroundCopyJob1, UInt32, UInt32, UInt32, UInt32, UInt32, HRESULT)
    on_progress : Proc(IBackgroundCopyCallback1*, UInt32, IBackgroundCopyGroup, IBackgroundCopyJob1, UInt32, UInt32, HRESULT)
    on_progress_ex : Proc(IBackgroundCopyCallback1*, UInt32, IBackgroundCopyGroup, IBackgroundCopyJob1, UInt32, UInt32, UInt32, UInt8*, HRESULT)
  end

  struct IBackgroundCopyCallback1
    lpVtbl : IBackgroundCopyCallback1VTbl*
  end

  struct IBackgroundCopyQMgrVTbl
    query_interface : Proc(IBackgroundCopyQMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBackgroundCopyQMgr*, UInt32)
    release : Proc(IBackgroundCopyQMgr*, UInt32)
    create_group : Proc(IBackgroundCopyQMgr*, Guid, IBackgroundCopyGroup*, HRESULT)
    get_group : Proc(IBackgroundCopyQMgr*, Guid, IBackgroundCopyGroup*, HRESULT)
    enum_groups : Proc(IBackgroundCopyQMgr*, UInt32, IEnumBackgroundCopyGroups*, HRESULT)
  end

  struct IBackgroundCopyQMgr
    lpVtbl : IBackgroundCopyQMgrVTbl*
  end

end
