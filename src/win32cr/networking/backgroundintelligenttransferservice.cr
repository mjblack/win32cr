require "../foundation.cr"
require "../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
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
  CLSID_BackgroundCopyManager = LibC::GUID.new(0x4991d34b_u32, 0x80a1_u16, 0x4291_u16, StaticArray[0x83_u8, 0xb6_u8, 0x33_u8, 0x28_u8, 0x36_u8, 0x6b_u8, 0x90_u8, 0x97_u8])
  CLSID_BackgroundCopyManager1_5 = LibC::GUID.new(0xf087771f_u32, 0xd74f_u16, 0x4c1a_u16, StaticArray[0xbb_u8, 0x8a_u8, 0xe1_u8, 0x6a_u8, 0xca_u8, 0x91_u8, 0x24_u8, 0xea_u8])
  CLSID_BackgroundCopyManager2_0 = LibC::GUID.new(0x6d18ad12_u32, 0xbde3_u16, 0x4393_u16, StaticArray[0xb3_u8, 0x11_u8, 0x9_u8, 0x9c_u8, 0x34_u8, 0x6e_u8, 0x6d_u8, 0xf9_u8])
  CLSID_BackgroundCopyManager2_5 = LibC::GUID.new(0x3ca98d6_u32, 0xff5d_u16, 0x49b8_u16, StaticArray[0xab_u8, 0xc6_u8, 0x3_u8, 0xdd_u8, 0x84_u8, 0x12_u8, 0x70_u8, 0x20_u8])
  CLSID_BackgroundCopyManager3_0 = LibC::GUID.new(0x659cdea7_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  CLSID_BackgroundCopyManager4_0 = LibC::GUID.new(0xbb6df56b_u32, 0xcace_u16, 0x11dc_u16, StaticArray[0x99_u8, 0x92_u8, 0x0_u8, 0x19_u8, 0xb9_u8, 0x3a_u8, 0x3a_u8, 0x84_u8])
  CLSID_BackgroundCopyManager5_0 = LibC::GUID.new(0x1ecca34c_u32, 0xe88a_u16, 0x44e3_u16, StaticArray[0x8d_u8, 0x6a_u8, 0x89_u8, 0x21_u8, 0xbd_u8, 0xe9_u8, 0xe4_u8, 0x52_u8])
  CLSID_BackgroundCopyManager10_1 = LibC::GUID.new(0x4bd3e4e1_u32, 0x7bd4_u16, 0x4a2b_u16, StaticArray[0x99_u8, 0x64_u8, 0x49_u8, 0x64_u8, 0x0_u8, 0xde_u8, 0x51_u8, 0x93_u8])
  CLSID_BackgroundCopyManager10_2 = LibC::GUID.new(0x4575438f_u32, 0xa6c8_u16, 0x4976_u16, StaticArray[0xb0_u8, 0xfe_u8, 0x2f_u8, 0x26_u8, 0xb8_u8, 0xd_u8, 0x95_u8, 0x9e_u8])
  CLSID_BackgroundCopyManager10_3 = LibC::GUID.new(0x5fd42ad5_u32, 0xc04e_u16, 0x4d36_u16, StaticArray[0xad_u8, 0xc7_u8, 0xe0_u8, 0x8f_u8, 0xf1_u8, 0x57_u8, 0x37_u8, 0xad_u8])
  CLSID_BITSExtensionSetupFactory = LibC::GUID.new(0xefbbab68_u32, 0x7286_u16, 0x4783_u16, StaticArray[0x94_u8, 0xbf_u8, 0x94_u8, 0x61_u8, 0xd8_u8, 0xb7_u8, 0xe7_u8, 0xe9_u8])
  CLSID_BackgroundCopyQMgr = LibC::GUID.new(0x69ad4aee_u32, 0x51be_u16, 0x439b_u16, StaticArray[0xa9_u8, 0x2c_u8, 0x86_u8, 0xae_u8, 0x49_u8, 0xe_u8, 0x8b_u8, 0x30_u8])


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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_remote_name : UInt64
    get_local_name : UInt64
    get_progress : UInt64
  end

  IBackgroundCopyFile_GUID = "01b7bd23-fb88-4a77-8490-5891d3e4653a"
  IID_IBackgroundCopyFile = LibC::GUID.new(0x1b7bd23_u32, 0xfb88_u16, 0x4a77_u16, StaticArray[0x84_u8, 0x90_u8, 0x58_u8, 0x91_u8, 0xd3_u8, 0xe4_u8, 0x65_u8, 0x3a_u8])
  struct IBackgroundCopyFile
    lpVtbl : IBackgroundCopyFileVTbl*
  end

  struct IEnumBackgroundCopyFilesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
    get_count : UInt64
  end

  IEnumBackgroundCopyFiles_GUID = "ca51e165-c365-424c-8d41-24aaa4ff3c40"
  IID_IEnumBackgroundCopyFiles = LibC::GUID.new(0xca51e165_u32, 0xc365_u16, 0x424c_u16, StaticArray[0x8d_u8, 0x41_u8, 0x24_u8, 0xaa_u8, 0xa4_u8, 0xff_u8, 0x3c_u8, 0x40_u8])
  struct IEnumBackgroundCopyFiles
    lpVtbl : IEnumBackgroundCopyFilesVTbl*
  end

  struct IBackgroundCopyErrorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_error : UInt64
    get_file : UInt64
    get_error_description : UInt64
    get_error_context_description : UInt64
    get_protocol : UInt64
  end

  IBackgroundCopyError_GUID = "19c613a0-fcb8-4f28-81ae-897c3d078f81"
  IID_IBackgroundCopyError = LibC::GUID.new(0x19c613a0_u32, 0xfcb8_u16, 0x4f28_u16, StaticArray[0x81_u8, 0xae_u8, 0x89_u8, 0x7c_u8, 0x3d_u8, 0x7_u8, 0x8f_u8, 0x81_u8])
  struct IBackgroundCopyError
    lpVtbl : IBackgroundCopyErrorVTbl*
  end

  struct IBackgroundCopyJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_file_set : UInt64
    add_file : UInt64
    enum_files : UInt64
    suspend : UInt64
    resume : UInt64
    cancel : UInt64
    complete : UInt64
    get_id : UInt64
    get_type : UInt64
    get_progress : UInt64
    get_times : UInt64
    get_state : UInt64
    get_error : UInt64
    get_owner : UInt64
    set_display_name : UInt64
    get_display_name : UInt64
    set_description : UInt64
    get_description : UInt64
    set_priority : UInt64
    get_priority : UInt64
    set_notify_flags : UInt64
    get_notify_flags : UInt64
    set_notify_interface : UInt64
    get_notify_interface : UInt64
    set_minimum_retry_delay : UInt64
    get_minimum_retry_delay : UInt64
    set_no_progress_timeout : UInt64
    get_no_progress_timeout : UInt64
    get_error_count : UInt64
    set_proxy_settings : UInt64
    get_proxy_settings : UInt64
    take_ownership : UInt64
  end

  IBackgroundCopyJob_GUID = "37668d37-507e-4160-9316-26306d150b12"
  IID_IBackgroundCopyJob = LibC::GUID.new(0x37668d37_u32, 0x507e_u16, 0x4160_u16, StaticArray[0x93_u8, 0x16_u8, 0x26_u8, 0x30_u8, 0x6d_u8, 0x15_u8, 0xb_u8, 0x12_u8])
  struct IBackgroundCopyJob
    lpVtbl : IBackgroundCopyJobVTbl*
  end

  struct IEnumBackgroundCopyJobsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
    get_count : UInt64
  end

  IEnumBackgroundCopyJobs_GUID = "1af4f612-3b71-466f-8f58-7b6f73ac57ad"
  IID_IEnumBackgroundCopyJobs = LibC::GUID.new(0x1af4f612_u32, 0x3b71_u16, 0x466f_u16, StaticArray[0x8f_u8, 0x58_u8, 0x7b_u8, 0x6f_u8, 0x73_u8, 0xac_u8, 0x57_u8, 0xad_u8])
  struct IEnumBackgroundCopyJobs
    lpVtbl : IEnumBackgroundCopyJobsVTbl*
  end

  struct IBackgroundCopyCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    job_transferred : UInt64
    job_error : UInt64
    job_modification : UInt64
  end

  IBackgroundCopyCallback_GUID = "97ea99c7-0186-4ad4-8df9-c5b4e0ed6b22"
  IID_IBackgroundCopyCallback = LibC::GUID.new(0x97ea99c7_u32, 0x186_u16, 0x4ad4_u16, StaticArray[0x8d_u8, 0xf9_u8, 0xc5_u8, 0xb4_u8, 0xe0_u8, 0xed_u8, 0x6b_u8, 0x22_u8])
  struct IBackgroundCopyCallback
    lpVtbl : IBackgroundCopyCallbackVTbl*
  end

  struct AsyncIBackgroundCopyCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_job_transferred : UInt64
    finish_job_transferred : UInt64
    begin_job_error : UInt64
    finish_job_error : UInt64
    begin_job_modification : UInt64
    finish_job_modification : UInt64
  end

  AsyncIBackgroundCopyCallback_GUID = "ca29d251-b4bb-4679-a3d9-ae8006119d54"
  IID_AsyncIBackgroundCopyCallback = LibC::GUID.new(0xca29d251_u32, 0xb4bb_u16, 0x4679_u16, StaticArray[0xa3_u8, 0xd9_u8, 0xae_u8, 0x80_u8, 0x6_u8, 0x11_u8, 0x9d_u8, 0x54_u8])
  struct AsyncIBackgroundCopyCallback
    lpVtbl : AsyncIBackgroundCopyCallbackVTbl*
  end

  struct IBackgroundCopyManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_job : UInt64
    get_job : UInt64
    enum_jobs : UInt64
    get_error_description : UInt64
  end

  IBackgroundCopyManager_GUID = "5ce34c0d-0dc9-4c1f-897c-daa1b78cee7c"
  IID_IBackgroundCopyManager = LibC::GUID.new(0x5ce34c0d_u32, 0xdc9_u16, 0x4c1f_u16, StaticArray[0x89_u8, 0x7c_u8, 0xda_u8, 0xa1_u8, 0xb7_u8, 0x8c_u8, 0xee_u8, 0x7c_u8])
  struct IBackgroundCopyManager
    lpVtbl : IBackgroundCopyManagerVTbl*
  end

  struct IBackgroundCopyJob2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_file_set : UInt64
    add_file : UInt64
    enum_files : UInt64
    suspend : UInt64
    resume : UInt64
    cancel : UInt64
    complete : UInt64
    get_id : UInt64
    get_type : UInt64
    get_progress : UInt64
    get_times : UInt64
    get_state : UInt64
    get_error : UInt64
    get_owner : UInt64
    set_display_name : UInt64
    get_display_name : UInt64
    set_description : UInt64
    get_description : UInt64
    set_priority : UInt64
    get_priority : UInt64
    set_notify_flags : UInt64
    get_notify_flags : UInt64
    set_notify_interface : UInt64
    get_notify_interface : UInt64
    set_minimum_retry_delay : UInt64
    get_minimum_retry_delay : UInt64
    set_no_progress_timeout : UInt64
    get_no_progress_timeout : UInt64
    get_error_count : UInt64
    set_proxy_settings : UInt64
    get_proxy_settings : UInt64
    take_ownership : UInt64
    set_notify_cmd_line : UInt64
    get_notify_cmd_line : UInt64
    get_reply_progress : UInt64
    get_reply_data : UInt64
    set_reply_file_name : UInt64
    get_reply_file_name : UInt64
    set_credentials : UInt64
    remove_credentials : UInt64
  end

  IBackgroundCopyJob2_GUID = "54b50739-686f-45eb-9dff-d6a9a0faa9af"
  IID_IBackgroundCopyJob2 = LibC::GUID.new(0x54b50739_u32, 0x686f_u16, 0x45eb_u16, StaticArray[0x9d_u8, 0xff_u8, 0xd6_u8, 0xa9_u8, 0xa0_u8, 0xfa_u8, 0xa9_u8, 0xaf_u8])
  struct IBackgroundCopyJob2
    lpVtbl : IBackgroundCopyJob2VTbl*
  end

  struct IBackgroundCopyJob3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_file_set : UInt64
    add_file : UInt64
    enum_files : UInt64
    suspend : UInt64
    resume : UInt64
    cancel : UInt64
    complete : UInt64
    get_id : UInt64
    get_type : UInt64
    get_progress : UInt64
    get_times : UInt64
    get_state : UInt64
    get_error : UInt64
    get_owner : UInt64
    set_display_name : UInt64
    get_display_name : UInt64
    set_description : UInt64
    get_description : UInt64
    set_priority : UInt64
    get_priority : UInt64
    set_notify_flags : UInt64
    get_notify_flags : UInt64
    set_notify_interface : UInt64
    get_notify_interface : UInt64
    set_minimum_retry_delay : UInt64
    get_minimum_retry_delay : UInt64
    set_no_progress_timeout : UInt64
    get_no_progress_timeout : UInt64
    get_error_count : UInt64
    set_proxy_settings : UInt64
    get_proxy_settings : UInt64
    take_ownership : UInt64
    set_notify_cmd_line : UInt64
    get_notify_cmd_line : UInt64
    get_reply_progress : UInt64
    get_reply_data : UInt64
    set_reply_file_name : UInt64
    get_reply_file_name : UInt64
    set_credentials : UInt64
    remove_credentials : UInt64
    replace_remote_prefix : UInt64
    add_file_with_ranges : UInt64
    set_file_acl_flags : UInt64
    get_file_acl_flags : UInt64
  end

  IBackgroundCopyJob3_GUID = "443c8934-90ff-48ed-bcde-26f5c7450042"
  IID_IBackgroundCopyJob3 = LibC::GUID.new(0x443c8934_u32, 0x90ff_u16, 0x48ed_u16, StaticArray[0xbc_u8, 0xde_u8, 0x26_u8, 0xf5_u8, 0xc7_u8, 0x45_u8, 0x0_u8, 0x42_u8])
  struct IBackgroundCopyJob3
    lpVtbl : IBackgroundCopyJob3VTbl*
  end

  struct IBackgroundCopyFile2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_remote_name : UInt64
    get_local_name : UInt64
    get_progress : UInt64
    get_file_ranges : UInt64
    set_remote_name : UInt64
  end

  IBackgroundCopyFile2_GUID = "83e81b93-0873-474d-8a8c-f2018b1a939c"
  IID_IBackgroundCopyFile2 = LibC::GUID.new(0x83e81b93_u32, 0x873_u16, 0x474d_u16, StaticArray[0x8a_u8, 0x8c_u8, 0xf2_u8, 0x1_u8, 0x8b_u8, 0x1a_u8, 0x93_u8, 0x9c_u8])
  struct IBackgroundCopyFile2
    lpVtbl : IBackgroundCopyFile2VTbl*
  end

  struct IBackgroundCopyJobHttpOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_client_certificate_by_id : UInt64
    set_client_certificate_by_name : UInt64
    remove_client_certificate : UInt64
    get_client_certificate : UInt64
    set_custom_headers : UInt64
    get_custom_headers : UInt64
    set_security_flags : UInt64
    get_security_flags : UInt64
  end

  IBackgroundCopyJobHttpOptions_GUID = "f1bd1079-9f01-4bdc-8036-f09b70095066"
  IID_IBackgroundCopyJobHttpOptions = LibC::GUID.new(0xf1bd1079_u32, 0x9f01_u16, 0x4bdc_u16, StaticArray[0x80_u8, 0x36_u8, 0xf0_u8, 0x9b_u8, 0x70_u8, 0x9_u8, 0x50_u8, 0x66_u8])
  struct IBackgroundCopyJobHttpOptions
    lpVtbl : IBackgroundCopyJobHttpOptionsVTbl*
  end

  struct IBitsPeerCacheRecordVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_id : UInt64
    get_origin_url : UInt64
    get_file_size : UInt64
    get_file_modification_time : UInt64
    get_last_access_time : UInt64
    is_file_validated : UInt64
    get_file_ranges : UInt64
  end

  IBitsPeerCacheRecord_GUID = "659cdeaf-489e-11d9-a9cd-000d56965251"
  IID_IBitsPeerCacheRecord = LibC::GUID.new(0x659cdeaf_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IBitsPeerCacheRecord
    lpVtbl : IBitsPeerCacheRecordVTbl*
  end

  struct IEnumBitsPeerCacheRecordsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
    get_count : UInt64
  end

  IEnumBitsPeerCacheRecords_GUID = "659cdea4-489e-11d9-a9cd-000d56965251"
  IID_IEnumBitsPeerCacheRecords = LibC::GUID.new(0x659cdea4_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IEnumBitsPeerCacheRecords
    lpVtbl : IEnumBitsPeerCacheRecordsVTbl*
  end

  struct IBitsPeerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_peer_name : UInt64
    is_authenticated : UInt64
    is_available : UInt64
  end

  IBitsPeer_GUID = "659cdea2-489e-11d9-a9cd-000d56965251"
  IID_IBitsPeer = LibC::GUID.new(0x659cdea2_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IBitsPeer
    lpVtbl : IBitsPeerVTbl*
  end

  struct IEnumBitsPeersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
    get_count : UInt64
  end

  IEnumBitsPeers_GUID = "659cdea5-489e-11d9-a9cd-000d56965251"
  IID_IEnumBitsPeers = LibC::GUID.new(0x659cdea5_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IEnumBitsPeers
    lpVtbl : IEnumBitsPeersVTbl*
  end

  struct IBitsPeerCacheAdministrationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_maximum_cache_size : UInt64
    set_maximum_cache_size : UInt64
    get_maximum_content_age : UInt64
    set_maximum_content_age : UInt64
    get_configuration_flags : UInt64
    set_configuration_flags : UInt64
    enum_records : UInt64
    get_record : UInt64
    clear_records : UInt64
    delete_record : UInt64
    delete_url : UInt64
    enum_peers : UInt64
    clear_peers : UInt64
    discover_peers : UInt64
  end

  IBitsPeerCacheAdministration_GUID = "659cdead-489e-11d9-a9cd-000d56965251"
  IID_IBitsPeerCacheAdministration = LibC::GUID.new(0x659cdead_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IBitsPeerCacheAdministration
    lpVtbl : IBitsPeerCacheAdministrationVTbl*
  end

  struct IBackgroundCopyJob4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_file_set : UInt64
    add_file : UInt64
    enum_files : UInt64
    suspend : UInt64
    resume : UInt64
    cancel : UInt64
    complete : UInt64
    get_id : UInt64
    get_type : UInt64
    get_progress : UInt64
    get_times : UInt64
    get_state : UInt64
    get_error : UInt64
    get_owner : UInt64
    set_display_name : UInt64
    get_display_name : UInt64
    set_description : UInt64
    get_description : UInt64
    set_priority : UInt64
    get_priority : UInt64
    set_notify_flags : UInt64
    get_notify_flags : UInt64
    set_notify_interface : UInt64
    get_notify_interface : UInt64
    set_minimum_retry_delay : UInt64
    get_minimum_retry_delay : UInt64
    set_no_progress_timeout : UInt64
    get_no_progress_timeout : UInt64
    get_error_count : UInt64
    set_proxy_settings : UInt64
    get_proxy_settings : UInt64
    take_ownership : UInt64
    set_notify_cmd_line : UInt64
    get_notify_cmd_line : UInt64
    get_reply_progress : UInt64
    get_reply_data : UInt64
    set_reply_file_name : UInt64
    get_reply_file_name : UInt64
    set_credentials : UInt64
    remove_credentials : UInt64
    replace_remote_prefix : UInt64
    add_file_with_ranges : UInt64
    set_file_acl_flags : UInt64
    get_file_acl_flags : UInt64
    set_peer_caching_flags : UInt64
    get_peer_caching_flags : UInt64
    get_owner_integrity_level : UInt64
    get_owner_elevation_state : UInt64
    set_maximum_download_time : UInt64
    get_maximum_download_time : UInt64
  end

  IBackgroundCopyJob4_GUID = "659cdeae-489e-11d9-a9cd-000d56965251"
  IID_IBackgroundCopyJob4 = LibC::GUID.new(0x659cdeae_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IBackgroundCopyJob4
    lpVtbl : IBackgroundCopyJob4VTbl*
  end

  struct IBackgroundCopyFile3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_remote_name : UInt64
    get_local_name : UInt64
    get_progress : UInt64
    get_file_ranges : UInt64
    set_remote_name : UInt64
    get_temporary_name : UInt64
    set_validation_state : UInt64
    get_validation_state : UInt64
    is_downloaded_from_peer : UInt64
  end

  IBackgroundCopyFile3_GUID = "659cdeaa-489e-11d9-a9cd-000d56965251"
  IID_IBackgroundCopyFile3 = LibC::GUID.new(0x659cdeaa_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IBackgroundCopyFile3
    lpVtbl : IBackgroundCopyFile3VTbl*
  end

  struct IBackgroundCopyCallback2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    job_transferred : UInt64
    job_error : UInt64
    job_modification : UInt64
    file_transferred : UInt64
  end

  IBackgroundCopyCallback2_GUID = "659cdeac-489e-11d9-a9cd-000d56965251"
  IID_IBackgroundCopyCallback2 = LibC::GUID.new(0x659cdeac_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
  struct IBackgroundCopyCallback2
    lpVtbl : IBackgroundCopyCallback2VTbl*
  end

  struct IBitsTokenOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_helper_token_flags : UInt64
    get_helper_token_flags : UInt64
    set_helper_token : UInt64
    clear_helper_token : UInt64
    get_helper_token_sid : UInt64
  end

  IBitsTokenOptions_GUID = "9a2584c3-f7d2-457a-9a5e-22b67bffc7d2"
  IID_IBitsTokenOptions = LibC::GUID.new(0x9a2584c3_u32, 0xf7d2_u16, 0x457a_u16, StaticArray[0x9a_u8, 0x5e_u8, 0x22_u8, 0xb6_u8, 0x7b_u8, 0xff_u8, 0xc7_u8, 0xd2_u8])
  struct IBitsTokenOptions
    lpVtbl : IBitsTokenOptionsVTbl*
  end

  struct IBackgroundCopyFile4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_remote_name : UInt64
    get_local_name : UInt64
    get_progress : UInt64
    get_file_ranges : UInt64
    set_remote_name : UInt64
    get_temporary_name : UInt64
    set_validation_state : UInt64
    get_validation_state : UInt64
    is_downloaded_from_peer : UInt64
    get_peer_download_stats : UInt64
  end

  IBackgroundCopyFile4_GUID = "ef7e0655-7888-4960-b0e5-730846e03492"
  IID_IBackgroundCopyFile4 = LibC::GUID.new(0xef7e0655_u32, 0x7888_u16, 0x4960_u16, StaticArray[0xb0_u8, 0xe5_u8, 0x73_u8, 0x8_u8, 0x46_u8, 0xe0_u8, 0x34_u8, 0x92_u8])
  struct IBackgroundCopyFile4
    lpVtbl : IBackgroundCopyFile4VTbl*
  end

  struct IBackgroundCopyJob5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_file_set : UInt64
    add_file : UInt64
    enum_files : UInt64
    suspend : UInt64
    resume : UInt64
    cancel : UInt64
    complete : UInt64
    get_id : UInt64
    get_type : UInt64
    get_progress : UInt64
    get_times : UInt64
    get_state : UInt64
    get_error : UInt64
    get_owner : UInt64
    set_display_name : UInt64
    get_display_name : UInt64
    set_description : UInt64
    get_description : UInt64
    set_priority : UInt64
    get_priority : UInt64
    set_notify_flags : UInt64
    get_notify_flags : UInt64
    set_notify_interface : UInt64
    get_notify_interface : UInt64
    set_minimum_retry_delay : UInt64
    get_minimum_retry_delay : UInt64
    set_no_progress_timeout : UInt64
    get_no_progress_timeout : UInt64
    get_error_count : UInt64
    set_proxy_settings : UInt64
    get_proxy_settings : UInt64
    take_ownership : UInt64
    set_notify_cmd_line : UInt64
    get_notify_cmd_line : UInt64
    get_reply_progress : UInt64
    get_reply_data : UInt64
    set_reply_file_name : UInt64
    get_reply_file_name : UInt64
    set_credentials : UInt64
    remove_credentials : UInt64
    replace_remote_prefix : UInt64
    add_file_with_ranges : UInt64
    set_file_acl_flags : UInt64
    get_file_acl_flags : UInt64
    set_peer_caching_flags : UInt64
    get_peer_caching_flags : UInt64
    get_owner_integrity_level : UInt64
    get_owner_elevation_state : UInt64
    set_maximum_download_time : UInt64
    get_maximum_download_time : UInt64
    set_property : UInt64
    get_property : UInt64
  end

  IBackgroundCopyJob5_GUID = "e847030c-bbba-4657-af6d-484aa42bf1fe"
  IID_IBackgroundCopyJob5 = LibC::GUID.new(0xe847030c_u32, 0xbbba_u16, 0x4657_u16, StaticArray[0xaf_u8, 0x6d_u8, 0x48_u8, 0x4a_u8, 0xa4_u8, 0x2b_u8, 0xf1_u8, 0xfe_u8])
  struct IBackgroundCopyJob5
    lpVtbl : IBackgroundCopyJob5VTbl*
  end

  struct IBackgroundCopyFile5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_remote_name : UInt64
    get_local_name : UInt64
    get_progress : UInt64
    get_file_ranges : UInt64
    set_remote_name : UInt64
    get_temporary_name : UInt64
    set_validation_state : UInt64
    get_validation_state : UInt64
    is_downloaded_from_peer : UInt64
    get_peer_download_stats : UInt64
    set_property : UInt64
    get_property : UInt64
  end

  IBackgroundCopyFile5_GUID = "85c1657f-dafc-40e8-8834-df18ea25717e"
  IID_IBackgroundCopyFile5 = LibC::GUID.new(0x85c1657f_u32, 0xdafc_u16, 0x40e8_u16, StaticArray[0x88_u8, 0x34_u8, 0xdf_u8, 0x18_u8, 0xea_u8, 0x25_u8, 0x71_u8, 0x7e_u8])
  struct IBackgroundCopyFile5
    lpVtbl : IBackgroundCopyFile5VTbl*
  end

  struct IBackgroundCopyCallback3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    job_transferred : UInt64
    job_error : UInt64
    job_modification : UInt64
    file_transferred : UInt64
    file_ranges_transferred : UInt64
  end

  IBackgroundCopyCallback3_GUID = "98c97bd2-e32b-4ad8-a528-95fd8b16bd42"
  IID_IBackgroundCopyCallback3 = LibC::GUID.new(0x98c97bd2_u32, 0xe32b_u16, 0x4ad8_u16, StaticArray[0xa5_u8, 0x28_u8, 0x95_u8, 0xfd_u8, 0x8b_u8, 0x16_u8, 0xbd_u8, 0x42_u8])
  struct IBackgroundCopyCallback3
    lpVtbl : IBackgroundCopyCallback3VTbl*
  end

  struct IBackgroundCopyFile6VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_remote_name : UInt64
    get_local_name : UInt64
    get_progress : UInt64
    get_file_ranges : UInt64
    set_remote_name : UInt64
    get_temporary_name : UInt64
    set_validation_state : UInt64
    get_validation_state : UInt64
    is_downloaded_from_peer : UInt64
    get_peer_download_stats : UInt64
    set_property : UInt64
    get_property : UInt64
    update_download_position : UInt64
    request_file_ranges : UInt64
    get_filled_file_ranges : UInt64
  end

  IBackgroundCopyFile6_GUID = "cf6784f7-d677-49fd-9368-cb47aee9d1ad"
  IID_IBackgroundCopyFile6 = LibC::GUID.new(0xcf6784f7_u32, 0xd677_u16, 0x49fd_u16, StaticArray[0x93_u8, 0x68_u8, 0xcb_u8, 0x47_u8, 0xae_u8, 0xe9_u8, 0xd1_u8, 0xad_u8])
  struct IBackgroundCopyFile6
    lpVtbl : IBackgroundCopyFile6VTbl*
  end

  struct IBackgroundCopyJobHttpOptions2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_client_certificate_by_id : UInt64
    set_client_certificate_by_name : UInt64
    remove_client_certificate : UInt64
    get_client_certificate : UInt64
    set_custom_headers : UInt64
    get_custom_headers : UInt64
    set_security_flags : UInt64
    get_security_flags : UInt64
    set_http_method : UInt64
    get_http_method : UInt64
  end

  IBackgroundCopyJobHttpOptions2_GUID = "b591a192-a405-4fc3-8323-4c5c542578fc"
  IID_IBackgroundCopyJobHttpOptions2 = LibC::GUID.new(0xb591a192_u32, 0xa405_u16, 0x4fc3_u16, StaticArray[0x83_u8, 0x23_u8, 0x4c_u8, 0x5c_u8, 0x54_u8, 0x25_u8, 0x78_u8, 0xfc_u8])
  struct IBackgroundCopyJobHttpOptions2
    lpVtbl : IBackgroundCopyJobHttpOptions2VTbl*
  end

  struct IBackgroundCopyServerCertificateValidationCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    validate_server_certificate : UInt64
  end

  IBackgroundCopyServerCertificateValidationCallback_GUID = "4cec0d02-def7-4158-813a-c32a46945ff7"
  IID_IBackgroundCopyServerCertificateValidationCallback = LibC::GUID.new(0x4cec0d02_u32, 0xdef7_u16, 0x4158_u16, StaticArray[0x81_u8, 0x3a_u8, 0xc3_u8, 0x2a_u8, 0x46_u8, 0x94_u8, 0x5f_u8, 0xf7_u8])
  struct IBackgroundCopyServerCertificateValidationCallback
    lpVtbl : IBackgroundCopyServerCertificateValidationCallbackVTbl*
  end

  struct IBackgroundCopyJobHttpOptions3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_client_certificate_by_id : UInt64
    set_client_certificate_by_name : UInt64
    remove_client_certificate : UInt64
    get_client_certificate : UInt64
    set_custom_headers : UInt64
    get_custom_headers : UInt64
    set_security_flags : UInt64
    get_security_flags : UInt64
    set_http_method : UInt64
    get_http_method : UInt64
    set_server_certificate_validation_interface : UInt64
    make_custom_headers_write_only : UInt64
  end

  IBackgroundCopyJobHttpOptions3_GUID = "8a9263d3-fd4c-4eda-9b28-30132a4d4e3c"
  IID_IBackgroundCopyJobHttpOptions3 = LibC::GUID.new(0x8a9263d3_u32, 0xfd4c_u16, 0x4eda_u16, StaticArray[0x9b_u8, 0x28_u8, 0x30_u8, 0x13_u8, 0x2a_u8, 0x4d_u8, 0x4e_u8, 0x3c_u8])
  struct IBackgroundCopyJobHttpOptions3
    lpVtbl : IBackgroundCopyJobHttpOptions3VTbl*
  end

  struct IBITSExtensionSetupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    enable_bits_uploads : UInt64
    disable_bits_uploads : UInt64
    get_cleanup_task_name : UInt64
    get_cleanup_task : UInt64
  end

  IBITSExtensionSetup_GUID = "29cfbbf7-09e4-4b97-b0bc-f2287e3d8eb3"
  IID_IBITSExtensionSetup = LibC::GUID.new(0x29cfbbf7_u32, 0x9e4_u16, 0x4b97_u16, StaticArray[0xb0_u8, 0xbc_u8, 0xf2_u8, 0x28_u8, 0x7e_u8, 0x3d_u8, 0x8e_u8, 0xb3_u8])
  struct IBITSExtensionSetup
    lpVtbl : IBITSExtensionSetupVTbl*
  end

  struct IBITSExtensionSetupFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_object : UInt64
  end

  IBITSExtensionSetupFactory_GUID = "d5d2d542-5503-4e64-8b48-72ef91a32ee1"
  IID_IBITSExtensionSetupFactory = LibC::GUID.new(0xd5d2d542_u32, 0x5503_u16, 0x4e64_u16, StaticArray[0x8b_u8, 0x48_u8, 0x72_u8, 0xef_u8, 0x91_u8, 0xa3_u8, 0x2e_u8, 0xe1_u8])
  struct IBITSExtensionSetupFactory
    lpVtbl : IBITSExtensionSetupFactoryVTbl*
  end

  struct IBackgroundCopyJob1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cancel_job : UInt64
    get_progress : UInt64
    get_status : UInt64
    add_files : UInt64
    get_file : UInt64
    get_file_count : UInt64
    switch_to_foreground : UInt64
    get_job_id : UInt64
  end

  IBackgroundCopyJob1_GUID = "59f5553c-2031-4629-bb18-2645a6970947"
  IID_IBackgroundCopyJob1 = LibC::GUID.new(0x59f5553c_u32, 0x2031_u16, 0x4629_u16, StaticArray[0xbb_u8, 0x18_u8, 0x26_u8, 0x45_u8, 0xa6_u8, 0x97_u8, 0x9_u8, 0x47_u8])
  struct IBackgroundCopyJob1
    lpVtbl : IBackgroundCopyJob1VTbl*
  end

  struct IEnumBackgroundCopyJobs1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
    get_count : UInt64
  end

  IEnumBackgroundCopyJobs1_GUID = "8baeba9d-8f1c-42c4-b82c-09ae79980d25"
  IID_IEnumBackgroundCopyJobs1 = LibC::GUID.new(0x8baeba9d_u32, 0x8f1c_u16, 0x42c4_u16, StaticArray[0xb8_u8, 0x2c_u8, 0x9_u8, 0xae_u8, 0x79_u8, 0x98_u8, 0xd_u8, 0x25_u8])
  struct IEnumBackgroundCopyJobs1
    lpVtbl : IEnumBackgroundCopyJobs1VTbl*
  end

  struct IBackgroundCopyGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_prop : UInt64
    set_prop : UInt64
    get_progress : UInt64
    get_status : UInt64
    get_job : UInt64
    suspend_group : UInt64
    resume_group : UInt64
    cancel_group : UInt64
    get_size : UInt64
    get_group_id : UInt64
    create_job : UInt64
    enum_jobs : UInt64
    switch_to_foreground : UInt64
    query_new_job_interface : UInt64
    set_notification_pointer : UInt64
  end

  IBackgroundCopyGroup_GUID = "1ded80a7-53ea-424f-8a04-17fea9adc4f5"
  IID_IBackgroundCopyGroup = LibC::GUID.new(0x1ded80a7_u32, 0x53ea_u16, 0x424f_u16, StaticArray[0x8a_u8, 0x4_u8, 0x17_u8, 0xfe_u8, 0xa9_u8, 0xad_u8, 0xc4_u8, 0xf5_u8])
  struct IBackgroundCopyGroup
    lpVtbl : IBackgroundCopyGroupVTbl*
  end

  struct IEnumBackgroundCopyGroupsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
    get_count : UInt64
  end

  IEnumBackgroundCopyGroups_GUID = "d993e603-4aa4-47c5-8665-c20d39c2ba4f"
  IID_IEnumBackgroundCopyGroups = LibC::GUID.new(0xd993e603_u32, 0x4aa4_u16, 0x47c5_u16, StaticArray[0x86_u8, 0x65_u8, 0xc2_u8, 0xd_u8, 0x39_u8, 0xc2_u8, 0xba_u8, 0x4f_u8])
  struct IEnumBackgroundCopyGroups
    lpVtbl : IEnumBackgroundCopyGroupsVTbl*
  end

  struct IBackgroundCopyCallback1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_status : UInt64
    on_progress : UInt64
    on_progress_ex : UInt64
  end

  IBackgroundCopyCallback1_GUID = "084f6593-3800-4e08-9b59-99fa59addf82"
  IID_IBackgroundCopyCallback1 = LibC::GUID.new(0x84f6593_u32, 0x3800_u16, 0x4e08_u16, StaticArray[0x9b_u8, 0x59_u8, 0x99_u8, 0xfa_u8, 0x59_u8, 0xad_u8, 0xdf_u8, 0x82_u8])
  struct IBackgroundCopyCallback1
    lpVtbl : IBackgroundCopyCallback1VTbl*
  end

  struct IBackgroundCopyQMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_group : UInt64
    get_group : UInt64
    enum_groups : UInt64
  end

  IBackgroundCopyQMgr_GUID = "16f41c69-09f5-41d2-8cd8-3c08c47bc8a8"
  IID_IBackgroundCopyQMgr = LibC::GUID.new(0x16f41c69_u32, 0x9f5_u16, 0x41d2_u16, StaticArray[0x8c_u8, 0xd8_u8, 0x3c_u8, 0x8_u8, 0xc4_u8, 0x7b_u8, 0xc8_u8, 0xa8_u8])
  struct IBackgroundCopyQMgr
    lpVtbl : IBackgroundCopyQMgrVTbl*
  end

end
struct LibWin32::IBackgroundCopyFile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_remote_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_local_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_FILE_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_FILE_PROGRESS*, HRESULT)).call(pval)
  end
end
struct LibWin32::IEnumBackgroundCopyFiles
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IBackgroundCopyFile*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IBackgroundCopyFile*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumBackgroundCopyFiles*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumBackgroundCopyFiles*, HRESULT)).call(ppenum)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
end
struct LibWin32::IBackgroundCopyError
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_error(pcontext : BG_ERROR_CONTEXT*, pcode : HRESULT*) : HRESULT
    @lpVtbl.value.get_error.unsafe_as(Proc(BG_ERROR_CONTEXT*, HRESULT*, HRESULT)).call(pcontext, pcode)
  end
  def get_file(pval : IBackgroundCopyFile*) : HRESULT
    @lpVtbl.value.get_file.unsafe_as(Proc(IBackgroundCopyFile*, HRESULT)).call(pval)
  end
  def get_error_description(languageid : UInt32, perrordescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_error_description.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(languageid, perrordescription)
  end
  def get_error_context_description(languageid : UInt32, pcontextdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_error_context_description.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(languageid, pcontextdescription)
  end
  def get_protocol(pprotocol : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pprotocol)
  end
end
struct LibWin32::IBackgroundCopyJob
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_file_set(cfilecount : UInt32, pfileset : BG_FILE_INFO*) : HRESULT
    @lpVtbl.value.add_file_set.unsafe_as(Proc(UInt32, BG_FILE_INFO*, HRESULT)).call(cfilecount, pfileset)
  end
  def add_file(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(remoteurl, localname)
  end
  def enum_files(penum : IEnumBackgroundCopyFiles*) : HRESULT
    @lpVtbl.value.enum_files.unsafe_as(Proc(IEnumBackgroundCopyFiles*, HRESULT)).call(penum)
  end
  def suspend : HRESULT
    @lpVtbl.value.suspend.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def complete : HRESULT
    @lpVtbl.value.complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_id(pval : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(pval)
  end
  def get_type(pval : BG_JOB_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(BG_JOB_TYPE*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_JOB_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_JOB_PROGRESS*, HRESULT)).call(pval)
  end
  def get_times(pval : BG_JOB_TIMES*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(BG_JOB_TIMES*, HRESULT)).call(pval)
  end
  def get_state(pval : BG_JOB_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(BG_JOB_STATE*, HRESULT)).call(pval)
  end
  def get_error(pperror : IBackgroundCopyError*) : HRESULT
    @lpVtbl.value.get_error.unsafe_as(Proc(IBackgroundCopyError*, HRESULT)).call(pperror)
  end
  def get_owner(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_display_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_display_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_description(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_description(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_priority(val : BG_JOB_PRIORITY) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(BG_JOB_PRIORITY, HRESULT)).call(val)
  end
  def get_priority(pval : BG_JOB_PRIORITY*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(BG_JOB_PRIORITY*, HRESULT)).call(pval)
  end
  def set_notify_flags(val : UInt32) : HRESULT
    @lpVtbl.value.set_notify_flags.unsafe_as(Proc(UInt32, HRESULT)).call(val)
  end
  def get_notify_flags(pval : UInt32*) : HRESULT
    @lpVtbl.value.get_notify_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pval)
  end
  def set_notify_interface(val : IUnknown) : HRESULT
    @lpVtbl.value.set_notify_interface.unsafe_as(Proc(IUnknown, HRESULT)).call(val)
  end
  def get_notify_interface(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get_notify_interface.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def set_minimum_retry_delay(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_minimum_retry_delay.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_minimum_retry_delay(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_minimum_retry_delay.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def set_no_progress_timeout(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_no_progress_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_no_progress_timeout(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_no_progress_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def get_error_count(errors : UInt32*) : HRESULT
    @lpVtbl.value.get_error_count.unsafe_as(Proc(UInt32*, HRESULT)).call(errors)
  end
  def set_proxy_settings(proxyusage : BG_JOB_PROXY_USAGE, proxylist : LibC::LPWSTR, proxybypasslist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(proxyusage, proxylist, proxybypasslist)
  end
  def get_proxy_settings(pproxyusage : BG_JOB_PROXY_USAGE*, pproxylist : LibC::LPWSTR*, pproxybypasslist : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pproxyusage, pproxylist, pproxybypasslist)
  end
  def take_ownership : HRESULT
    @lpVtbl.value.take_ownership.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IEnumBackgroundCopyJobs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IBackgroundCopyJob*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IBackgroundCopyJob*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumBackgroundCopyJobs*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumBackgroundCopyJobs*, HRESULT)).call(ppenum)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
end
struct LibWin32::IBackgroundCopyCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def job_transferred(pjob : IBackgroundCopyJob) : HRESULT
    @lpVtbl.value.job_transferred.unsafe_as(Proc(IBackgroundCopyJob, HRESULT)).call(pjob)
  end
  def job_error(pjob : IBackgroundCopyJob, perror : IBackgroundCopyError) : HRESULT
    @lpVtbl.value.job_error.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyError, HRESULT)).call(pjob, perror)
  end
  def job_modification(pjob : IBackgroundCopyJob, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.job_modification.unsafe_as(Proc(IBackgroundCopyJob, UInt32, HRESULT)).call(pjob, dwreserved)
  end
end
struct LibWin32::AsyncIBackgroundCopyCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_job_transferred(pjob : IBackgroundCopyJob) : HRESULT
    @lpVtbl.value.begin_job_transferred.unsafe_as(Proc(IBackgroundCopyJob, HRESULT)).call(pjob)
  end
  def finish_job_transferred : HRESULT
    @lpVtbl.value.finish_job_transferred.unsafe_as(Proc(HRESULT)).call
  end
  def begin_job_error(pjob : IBackgroundCopyJob, perror : IBackgroundCopyError) : HRESULT
    @lpVtbl.value.begin_job_error.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyError, HRESULT)).call(pjob, perror)
  end
  def finish_job_error : HRESULT
    @lpVtbl.value.finish_job_error.unsafe_as(Proc(HRESULT)).call
  end
  def begin_job_modification(pjob : IBackgroundCopyJob, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.begin_job_modification.unsafe_as(Proc(IBackgroundCopyJob, UInt32, HRESULT)).call(pjob, dwreserved)
  end
  def finish_job_modification : HRESULT
    @lpVtbl.value.finish_job_modification.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IBackgroundCopyManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_job(displayname : LibC::LPWSTR, type : BG_JOB_TYPE, pjobid : Guid*, ppjob : IBackgroundCopyJob*) : HRESULT
    @lpVtbl.value.create_job.unsafe_as(Proc(LibC::LPWSTR, BG_JOB_TYPE, Guid*, IBackgroundCopyJob*, HRESULT)).call(displayname, type, pjobid, ppjob)
  end
  def get_job(jobid : Guid*, ppjob : IBackgroundCopyJob*) : HRESULT
    @lpVtbl.value.get_job.unsafe_as(Proc(Guid*, IBackgroundCopyJob*, HRESULT)).call(jobid, ppjob)
  end
  def enum_jobs(dwflags : UInt32, ppenum : IEnumBackgroundCopyJobs*) : HRESULT
    @lpVtbl.value.enum_jobs.unsafe_as(Proc(UInt32, IEnumBackgroundCopyJobs*, HRESULT)).call(dwflags, ppenum)
  end
  def get_error_description(hresult : HRESULT, languageid : UInt32, perrordescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_error_description.unsafe_as(Proc(HRESULT, UInt32, LibC::LPWSTR*, HRESULT)).call(hresult, languageid, perrordescription)
  end
end
struct LibWin32::IBackgroundCopyJob2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_file_set(cfilecount : UInt32, pfileset : BG_FILE_INFO*) : HRESULT
    @lpVtbl.value.add_file_set.unsafe_as(Proc(UInt32, BG_FILE_INFO*, HRESULT)).call(cfilecount, pfileset)
  end
  def add_file(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(remoteurl, localname)
  end
  def enum_files(penum : IEnumBackgroundCopyFiles*) : HRESULT
    @lpVtbl.value.enum_files.unsafe_as(Proc(IEnumBackgroundCopyFiles*, HRESULT)).call(penum)
  end
  def suspend : HRESULT
    @lpVtbl.value.suspend.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def complete : HRESULT
    @lpVtbl.value.complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_id(pval : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(pval)
  end
  def get_type(pval : BG_JOB_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(BG_JOB_TYPE*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_JOB_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_JOB_PROGRESS*, HRESULT)).call(pval)
  end
  def get_times(pval : BG_JOB_TIMES*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(BG_JOB_TIMES*, HRESULT)).call(pval)
  end
  def get_state(pval : BG_JOB_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(BG_JOB_STATE*, HRESULT)).call(pval)
  end
  def get_error(pperror : IBackgroundCopyError*) : HRESULT
    @lpVtbl.value.get_error.unsafe_as(Proc(IBackgroundCopyError*, HRESULT)).call(pperror)
  end
  def get_owner(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_display_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_display_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_description(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_description(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_priority(val : BG_JOB_PRIORITY) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(BG_JOB_PRIORITY, HRESULT)).call(val)
  end
  def get_priority(pval : BG_JOB_PRIORITY*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(BG_JOB_PRIORITY*, HRESULT)).call(pval)
  end
  def set_notify_flags(val : UInt32) : HRESULT
    @lpVtbl.value.set_notify_flags.unsafe_as(Proc(UInt32, HRESULT)).call(val)
  end
  def get_notify_flags(pval : UInt32*) : HRESULT
    @lpVtbl.value.get_notify_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pval)
  end
  def set_notify_interface(val : IUnknown) : HRESULT
    @lpVtbl.value.set_notify_interface.unsafe_as(Proc(IUnknown, HRESULT)).call(val)
  end
  def get_notify_interface(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get_notify_interface.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def set_minimum_retry_delay(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_minimum_retry_delay.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_minimum_retry_delay(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_minimum_retry_delay.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def set_no_progress_timeout(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_no_progress_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_no_progress_timeout(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_no_progress_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def get_error_count(errors : UInt32*) : HRESULT
    @lpVtbl.value.get_error_count.unsafe_as(Proc(UInt32*, HRESULT)).call(errors)
  end
  def set_proxy_settings(proxyusage : BG_JOB_PROXY_USAGE, proxylist : LibC::LPWSTR, proxybypasslist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(proxyusage, proxylist, proxybypasslist)
  end
  def get_proxy_settings(pproxyusage : BG_JOB_PROXY_USAGE*, pproxylist : LibC::LPWSTR*, pproxybypasslist : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pproxyusage, pproxylist, pproxybypasslist)
  end
  def take_ownership : HRESULT
    @lpVtbl.value.take_ownership.unsafe_as(Proc(HRESULT)).call
  end
  def set_notify_cmd_line(program : LibC::LPWSTR, parameters : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(program, parameters)
  end
  def get_notify_cmd_line(pprogram : LibC::LPWSTR*, pparameters : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pprogram, pparameters)
  end
  def get_reply_progress(pprogress : BG_JOB_REPLY_PROGRESS*) : HRESULT
    @lpVtbl.value.get_reply_progress.unsafe_as(Proc(BG_JOB_REPLY_PROGRESS*, HRESULT)).call(pprogress)
  end
  def get_reply_data(ppbuffer : UInt8**, plength : UInt64*) : HRESULT
    @lpVtbl.value.get_reply_data.unsafe_as(Proc(UInt8**, UInt64*, HRESULT)).call(ppbuffer, plength)
  end
  def set_reply_file_name(replyfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_reply_file_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(replyfilename)
  end
  def get_reply_file_name(preplyfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_reply_file_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(preplyfilename)
  end
  def set_credentials(credentials : BG_AUTH_CREDENTIALS*) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(BG_AUTH_CREDENTIALS*, HRESULT)).call(credentials)
  end
  def remove_credentials(target : BG_AUTH_TARGET, scheme : BG_AUTH_SCHEME) : HRESULT
    @lpVtbl.value.remove_credentials.unsafe_as(Proc(BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)).call(target, scheme)
  end
end
struct LibWin32::IBackgroundCopyJob3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_file_set(cfilecount : UInt32, pfileset : BG_FILE_INFO*) : HRESULT
    @lpVtbl.value.add_file_set.unsafe_as(Proc(UInt32, BG_FILE_INFO*, HRESULT)).call(cfilecount, pfileset)
  end
  def add_file(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(remoteurl, localname)
  end
  def enum_files(penum : IEnumBackgroundCopyFiles*) : HRESULT
    @lpVtbl.value.enum_files.unsafe_as(Proc(IEnumBackgroundCopyFiles*, HRESULT)).call(penum)
  end
  def suspend : HRESULT
    @lpVtbl.value.suspend.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def complete : HRESULT
    @lpVtbl.value.complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_id(pval : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(pval)
  end
  def get_type(pval : BG_JOB_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(BG_JOB_TYPE*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_JOB_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_JOB_PROGRESS*, HRESULT)).call(pval)
  end
  def get_times(pval : BG_JOB_TIMES*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(BG_JOB_TIMES*, HRESULT)).call(pval)
  end
  def get_state(pval : BG_JOB_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(BG_JOB_STATE*, HRESULT)).call(pval)
  end
  def get_error(pperror : IBackgroundCopyError*) : HRESULT
    @lpVtbl.value.get_error.unsafe_as(Proc(IBackgroundCopyError*, HRESULT)).call(pperror)
  end
  def get_owner(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_display_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_display_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_description(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_description(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_priority(val : BG_JOB_PRIORITY) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(BG_JOB_PRIORITY, HRESULT)).call(val)
  end
  def get_priority(pval : BG_JOB_PRIORITY*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(BG_JOB_PRIORITY*, HRESULT)).call(pval)
  end
  def set_notify_flags(val : UInt32) : HRESULT
    @lpVtbl.value.set_notify_flags.unsafe_as(Proc(UInt32, HRESULT)).call(val)
  end
  def get_notify_flags(pval : UInt32*) : HRESULT
    @lpVtbl.value.get_notify_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pval)
  end
  def set_notify_interface(val : IUnknown) : HRESULT
    @lpVtbl.value.set_notify_interface.unsafe_as(Proc(IUnknown, HRESULT)).call(val)
  end
  def get_notify_interface(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get_notify_interface.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def set_minimum_retry_delay(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_minimum_retry_delay.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_minimum_retry_delay(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_minimum_retry_delay.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def set_no_progress_timeout(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_no_progress_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_no_progress_timeout(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_no_progress_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def get_error_count(errors : UInt32*) : HRESULT
    @lpVtbl.value.get_error_count.unsafe_as(Proc(UInt32*, HRESULT)).call(errors)
  end
  def set_proxy_settings(proxyusage : BG_JOB_PROXY_USAGE, proxylist : LibC::LPWSTR, proxybypasslist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(proxyusage, proxylist, proxybypasslist)
  end
  def get_proxy_settings(pproxyusage : BG_JOB_PROXY_USAGE*, pproxylist : LibC::LPWSTR*, pproxybypasslist : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pproxyusage, pproxylist, pproxybypasslist)
  end
  def take_ownership : HRESULT
    @lpVtbl.value.take_ownership.unsafe_as(Proc(HRESULT)).call
  end
  def set_notify_cmd_line(program : LibC::LPWSTR, parameters : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(program, parameters)
  end
  def get_notify_cmd_line(pprogram : LibC::LPWSTR*, pparameters : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pprogram, pparameters)
  end
  def get_reply_progress(pprogress : BG_JOB_REPLY_PROGRESS*) : HRESULT
    @lpVtbl.value.get_reply_progress.unsafe_as(Proc(BG_JOB_REPLY_PROGRESS*, HRESULT)).call(pprogress)
  end
  def get_reply_data(ppbuffer : UInt8**, plength : UInt64*) : HRESULT
    @lpVtbl.value.get_reply_data.unsafe_as(Proc(UInt8**, UInt64*, HRESULT)).call(ppbuffer, plength)
  end
  def set_reply_file_name(replyfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_reply_file_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(replyfilename)
  end
  def get_reply_file_name(preplyfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_reply_file_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(preplyfilename)
  end
  def set_credentials(credentials : BG_AUTH_CREDENTIALS*) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(BG_AUTH_CREDENTIALS*, HRESULT)).call(credentials)
  end
  def remove_credentials(target : BG_AUTH_TARGET, scheme : BG_AUTH_SCHEME) : HRESULT
    @lpVtbl.value.remove_credentials.unsafe_as(Proc(BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)).call(target, scheme)
  end
  def replace_remote_prefix(oldprefix : LibC::LPWSTR, newprefix : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.replace_remote_prefix.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(oldprefix, newprefix)
  end
  def add_file_with_ranges(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR, rangecount : UInt32, ranges : BG_FILE_RANGE*) : HRESULT
    @lpVtbl.value.add_file_with_ranges.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, BG_FILE_RANGE*, HRESULT)).call(remoteurl, localname, rangecount, ranges)
  end
  def set_file_acl_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_file_acl_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_file_acl_flags(flags : UInt32*) : HRESULT
    @lpVtbl.value.get_file_acl_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(flags)
  end
end
struct LibWin32::IBackgroundCopyFile2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_remote_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_local_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_FILE_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_FILE_PROGRESS*, HRESULT)).call(pval)
  end
  def get_file_ranges(rangecount : UInt32*, ranges : BG_FILE_RANGE**) : HRESULT
    @lpVtbl.value.get_file_ranges.unsafe_as(Proc(UInt32*, BG_FILE_RANGE**, HRESULT)).call(rangecount, ranges)
  end
  def set_remote_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_remote_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
end
struct LibWin32::IBackgroundCopyJobHttpOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_client_certificate_by_id(storelocation : BG_CERT_STORE_LOCATION, storename : LibC::LPWSTR, pcerthashblob : UInt8*) : HRESULT
    @lpVtbl.value.set_client_certificate_by_id.unsafe_as(Proc(BG_CERT_STORE_LOCATION, LibC::LPWSTR, UInt8*, HRESULT)).call(storelocation, storename, pcerthashblob)
  end
  def set_client_certificate_by_name(storelocation : BG_CERT_STORE_LOCATION, storename : LibC::LPWSTR, subjectname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_client_certificate_by_name.unsafe_as(Proc(BG_CERT_STORE_LOCATION, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(storelocation, storename, subjectname)
  end
  def remove_client_certificate : HRESULT
    @lpVtbl.value.remove_client_certificate.unsafe_as(Proc(HRESULT)).call
  end
  def get_client_certificate(pstorelocation : BG_CERT_STORE_LOCATION*, pstorename : LibC::LPWSTR*, ppcerthashblob : UInt8**, psubjectname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_client_certificate.unsafe_as(Proc(BG_CERT_STORE_LOCATION*, LibC::LPWSTR*, UInt8**, LibC::LPWSTR*, HRESULT)).call(pstorelocation, pstorename, ppcerthashblob, psubjectname)
  end
  def set_custom_headers(requestheaders : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_custom_headers.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(requestheaders)
  end
  def get_custom_headers(prequestheaders : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_custom_headers.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(prequestheaders)
  end
  def set_security_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_security_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_security_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_security_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
end
struct LibWin32::IBitsPeerCacheRecord
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_id(pval : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(pval)
  end
  def get_origin_url(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_origin_url.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_file_size(pval : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(UInt64*, HRESULT)).call(pval)
  end
  def get_file_modification_time(pval : FILETIME*) : HRESULT
    @lpVtbl.value.get_file_modification_time.unsafe_as(Proc(FILETIME*, HRESULT)).call(pval)
  end
  def get_last_access_time(pval : FILETIME*) : HRESULT
    @lpVtbl.value.get_last_access_time.unsafe_as(Proc(FILETIME*, HRESULT)).call(pval)
  end
  def is_file_validated : HRESULT
    @lpVtbl.value.is_file_validated.unsafe_as(Proc(HRESULT)).call
  end
  def get_file_ranges(prangecount : UInt32*, ppranges : BG_FILE_RANGE**) : HRESULT
    @lpVtbl.value.get_file_ranges.unsafe_as(Proc(UInt32*, BG_FILE_RANGE**, HRESULT)).call(prangecount, ppranges)
  end
end
struct LibWin32::IEnumBitsPeerCacheRecords
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IBitsPeerCacheRecord*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IBitsPeerCacheRecord*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumBitsPeerCacheRecords*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumBitsPeerCacheRecords*, HRESULT)).call(ppenum)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
end
struct LibWin32::IBitsPeer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_peer_name(pname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_peer_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pname)
  end
  def is_authenticated(pauth : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_authenticated.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pauth)
  end
  def is_available(ponline : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_available.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ponline)
  end
end
struct LibWin32::IEnumBitsPeers
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IBitsPeer*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IBitsPeer*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumBitsPeers*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumBitsPeers*, HRESULT)).call(ppenum)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
end
struct LibWin32::IBitsPeerCacheAdministration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_maximum_cache_size(pbytes : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_cache_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pbytes)
  end
  def set_maximum_cache_size(bytes : UInt32) : HRESULT
    @lpVtbl.value.set_maximum_cache_size.unsafe_as(Proc(UInt32, HRESULT)).call(bytes)
  end
  def get_maximum_content_age(pseconds : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_content_age.unsafe_as(Proc(UInt32*, HRESULT)).call(pseconds)
  end
  def set_maximum_content_age(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_maximum_content_age.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_configuration_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_configuration_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
  def set_configuration_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_configuration_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def enum_records(ppenum : IEnumBitsPeerCacheRecords*) : HRESULT
    @lpVtbl.value.enum_records.unsafe_as(Proc(IEnumBitsPeerCacheRecords*, HRESULT)).call(ppenum)
  end
  def get_record(id : Guid*, pprecord : IBitsPeerCacheRecord*) : HRESULT
    @lpVtbl.value.get_record.unsafe_as(Proc(Guid*, IBitsPeerCacheRecord*, HRESULT)).call(id, pprecord)
  end
  def clear_records : HRESULT
    @lpVtbl.value.clear_records.unsafe_as(Proc(HRESULT)).call
  end
  def delete_record(id : Guid*) : HRESULT
    @lpVtbl.value.delete_record.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def delete_url(url : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_url.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(url)
  end
  def enum_peers(ppenum : IEnumBitsPeers*) : HRESULT
    @lpVtbl.value.enum_peers.unsafe_as(Proc(IEnumBitsPeers*, HRESULT)).call(ppenum)
  end
  def clear_peers : HRESULT
    @lpVtbl.value.clear_peers.unsafe_as(Proc(HRESULT)).call
  end
  def discover_peers : HRESULT
    @lpVtbl.value.discover_peers.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IBackgroundCopyJob4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_file_set(cfilecount : UInt32, pfileset : BG_FILE_INFO*) : HRESULT
    @lpVtbl.value.add_file_set.unsafe_as(Proc(UInt32, BG_FILE_INFO*, HRESULT)).call(cfilecount, pfileset)
  end
  def add_file(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(remoteurl, localname)
  end
  def enum_files(penum : IEnumBackgroundCopyFiles*) : HRESULT
    @lpVtbl.value.enum_files.unsafe_as(Proc(IEnumBackgroundCopyFiles*, HRESULT)).call(penum)
  end
  def suspend : HRESULT
    @lpVtbl.value.suspend.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def complete : HRESULT
    @lpVtbl.value.complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_id(pval : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(pval)
  end
  def get_type(pval : BG_JOB_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(BG_JOB_TYPE*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_JOB_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_JOB_PROGRESS*, HRESULT)).call(pval)
  end
  def get_times(pval : BG_JOB_TIMES*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(BG_JOB_TIMES*, HRESULT)).call(pval)
  end
  def get_state(pval : BG_JOB_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(BG_JOB_STATE*, HRESULT)).call(pval)
  end
  def get_error(pperror : IBackgroundCopyError*) : HRESULT
    @lpVtbl.value.get_error.unsafe_as(Proc(IBackgroundCopyError*, HRESULT)).call(pperror)
  end
  def get_owner(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_display_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_display_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_description(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_description(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_priority(val : BG_JOB_PRIORITY) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(BG_JOB_PRIORITY, HRESULT)).call(val)
  end
  def get_priority(pval : BG_JOB_PRIORITY*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(BG_JOB_PRIORITY*, HRESULT)).call(pval)
  end
  def set_notify_flags(val : UInt32) : HRESULT
    @lpVtbl.value.set_notify_flags.unsafe_as(Proc(UInt32, HRESULT)).call(val)
  end
  def get_notify_flags(pval : UInt32*) : HRESULT
    @lpVtbl.value.get_notify_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pval)
  end
  def set_notify_interface(val : IUnknown) : HRESULT
    @lpVtbl.value.set_notify_interface.unsafe_as(Proc(IUnknown, HRESULT)).call(val)
  end
  def get_notify_interface(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get_notify_interface.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def set_minimum_retry_delay(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_minimum_retry_delay.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_minimum_retry_delay(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_minimum_retry_delay.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def set_no_progress_timeout(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_no_progress_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_no_progress_timeout(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_no_progress_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def get_error_count(errors : UInt32*) : HRESULT
    @lpVtbl.value.get_error_count.unsafe_as(Proc(UInt32*, HRESULT)).call(errors)
  end
  def set_proxy_settings(proxyusage : BG_JOB_PROXY_USAGE, proxylist : LibC::LPWSTR, proxybypasslist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(proxyusage, proxylist, proxybypasslist)
  end
  def get_proxy_settings(pproxyusage : BG_JOB_PROXY_USAGE*, pproxylist : LibC::LPWSTR*, pproxybypasslist : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pproxyusage, pproxylist, pproxybypasslist)
  end
  def take_ownership : HRESULT
    @lpVtbl.value.take_ownership.unsafe_as(Proc(HRESULT)).call
  end
  def set_notify_cmd_line(program : LibC::LPWSTR, parameters : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(program, parameters)
  end
  def get_notify_cmd_line(pprogram : LibC::LPWSTR*, pparameters : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pprogram, pparameters)
  end
  def get_reply_progress(pprogress : BG_JOB_REPLY_PROGRESS*) : HRESULT
    @lpVtbl.value.get_reply_progress.unsafe_as(Proc(BG_JOB_REPLY_PROGRESS*, HRESULT)).call(pprogress)
  end
  def get_reply_data(ppbuffer : UInt8**, plength : UInt64*) : HRESULT
    @lpVtbl.value.get_reply_data.unsafe_as(Proc(UInt8**, UInt64*, HRESULT)).call(ppbuffer, plength)
  end
  def set_reply_file_name(replyfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_reply_file_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(replyfilename)
  end
  def get_reply_file_name(preplyfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_reply_file_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(preplyfilename)
  end
  def set_credentials(credentials : BG_AUTH_CREDENTIALS*) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(BG_AUTH_CREDENTIALS*, HRESULT)).call(credentials)
  end
  def remove_credentials(target : BG_AUTH_TARGET, scheme : BG_AUTH_SCHEME) : HRESULT
    @lpVtbl.value.remove_credentials.unsafe_as(Proc(BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)).call(target, scheme)
  end
  def replace_remote_prefix(oldprefix : LibC::LPWSTR, newprefix : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.replace_remote_prefix.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(oldprefix, newprefix)
  end
  def add_file_with_ranges(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR, rangecount : UInt32, ranges : BG_FILE_RANGE*) : HRESULT
    @lpVtbl.value.add_file_with_ranges.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, BG_FILE_RANGE*, HRESULT)).call(remoteurl, localname, rangecount, ranges)
  end
  def set_file_acl_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_file_acl_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_file_acl_flags(flags : UInt32*) : HRESULT
    @lpVtbl.value.get_file_acl_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(flags)
  end
  def set_peer_caching_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_peer_caching_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_peer_caching_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_peer_caching_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
  def get_owner_integrity_level(plevel : UInt32*) : HRESULT
    @lpVtbl.value.get_owner_integrity_level.unsafe_as(Proc(UInt32*, HRESULT)).call(plevel)
  end
  def get_owner_elevation_state(pelevated : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_owner_elevation_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pelevated)
  end
  def set_maximum_download_time(timeout : UInt32) : HRESULT
    @lpVtbl.value.set_maximum_download_time.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def get_maximum_download_time(ptimeout : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_download_time.unsafe_as(Proc(UInt32*, HRESULT)).call(ptimeout)
  end
end
struct LibWin32::IBackgroundCopyFile3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_remote_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_local_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_FILE_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_FILE_PROGRESS*, HRESULT)).call(pval)
  end
  def get_file_ranges(rangecount : UInt32*, ranges : BG_FILE_RANGE**) : HRESULT
    @lpVtbl.value.get_file_ranges.unsafe_as(Proc(UInt32*, BG_FILE_RANGE**, HRESULT)).call(rangecount, ranges)
  end
  def set_remote_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_remote_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_temporary_name(pfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_temporary_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pfilename)
  end
  def set_validation_state(state : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_validation_state.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(state)
  end
  def get_validation_state(pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_validation_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pstate)
  end
  def is_downloaded_from_peer(pval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_downloaded_from_peer.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pval)
  end
end
struct LibWin32::IBackgroundCopyCallback2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def job_transferred(pjob : IBackgroundCopyJob) : HRESULT
    @lpVtbl.value.job_transferred.unsafe_as(Proc(IBackgroundCopyJob, HRESULT)).call(pjob)
  end
  def job_error(pjob : IBackgroundCopyJob, perror : IBackgroundCopyError) : HRESULT
    @lpVtbl.value.job_error.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyError, HRESULT)).call(pjob, perror)
  end
  def job_modification(pjob : IBackgroundCopyJob, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.job_modification.unsafe_as(Proc(IBackgroundCopyJob, UInt32, HRESULT)).call(pjob, dwreserved)
  end
  def file_transferred(pjob : IBackgroundCopyJob, pfile : IBackgroundCopyFile) : HRESULT
    @lpVtbl.value.file_transferred.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyFile, HRESULT)).call(pjob, pfile)
  end
end
struct LibWin32::IBitsTokenOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_helper_token_flags(usageflags : BG_TOKEN) : HRESULT
    @lpVtbl.value.set_helper_token_flags.unsafe_as(Proc(BG_TOKEN, HRESULT)).call(usageflags)
  end
  def get_helper_token_flags(pflags : BG_TOKEN*) : HRESULT
    @lpVtbl.value.get_helper_token_flags.unsafe_as(Proc(BG_TOKEN*, HRESULT)).call(pflags)
  end
  def set_helper_token : HRESULT
    @lpVtbl.value.set_helper_token.unsafe_as(Proc(HRESULT)).call
  end
  def clear_helper_token : HRESULT
    @lpVtbl.value.clear_helper_token.unsafe_as(Proc(HRESULT)).call
  end
  def get_helper_token_sid(psid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_helper_token_sid.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(psid)
  end
end
struct LibWin32::IBackgroundCopyFile4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_remote_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_local_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_FILE_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_FILE_PROGRESS*, HRESULT)).call(pval)
  end
  def get_file_ranges(rangecount : UInt32*, ranges : BG_FILE_RANGE**) : HRESULT
    @lpVtbl.value.get_file_ranges.unsafe_as(Proc(UInt32*, BG_FILE_RANGE**, HRESULT)).call(rangecount, ranges)
  end
  def set_remote_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_remote_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_temporary_name(pfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_temporary_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pfilename)
  end
  def set_validation_state(state : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_validation_state.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(state)
  end
  def get_validation_state(pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_validation_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pstate)
  end
  def is_downloaded_from_peer(pval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_downloaded_from_peer.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pval)
  end
  def get_peer_download_stats(pfromorigin : UInt64*, pfrompeers : UInt64*) : HRESULT
    @lpVtbl.value.get_peer_download_stats.unsafe_as(Proc(UInt64*, UInt64*, HRESULT)).call(pfromorigin, pfrompeers)
  end
end
struct LibWin32::IBackgroundCopyJob5
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_file_set(cfilecount : UInt32, pfileset : BG_FILE_INFO*) : HRESULT
    @lpVtbl.value.add_file_set.unsafe_as(Proc(UInt32, BG_FILE_INFO*, HRESULT)).call(cfilecount, pfileset)
  end
  def add_file(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(remoteurl, localname)
  end
  def enum_files(penum : IEnumBackgroundCopyFiles*) : HRESULT
    @lpVtbl.value.enum_files.unsafe_as(Proc(IEnumBackgroundCopyFiles*, HRESULT)).call(penum)
  end
  def suspend : HRESULT
    @lpVtbl.value.suspend.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def complete : HRESULT
    @lpVtbl.value.complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_id(pval : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(pval)
  end
  def get_type(pval : BG_JOB_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(BG_JOB_TYPE*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_JOB_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_JOB_PROGRESS*, HRESULT)).call(pval)
  end
  def get_times(pval : BG_JOB_TIMES*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(BG_JOB_TIMES*, HRESULT)).call(pval)
  end
  def get_state(pval : BG_JOB_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(BG_JOB_STATE*, HRESULT)).call(pval)
  end
  def get_error(pperror : IBackgroundCopyError*) : HRESULT
    @lpVtbl.value.get_error.unsafe_as(Proc(IBackgroundCopyError*, HRESULT)).call(pperror)
  end
  def get_owner(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_display_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_display_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_description(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_description(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def set_priority(val : BG_JOB_PRIORITY) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(BG_JOB_PRIORITY, HRESULT)).call(val)
  end
  def get_priority(pval : BG_JOB_PRIORITY*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(BG_JOB_PRIORITY*, HRESULT)).call(pval)
  end
  def set_notify_flags(val : UInt32) : HRESULT
    @lpVtbl.value.set_notify_flags.unsafe_as(Proc(UInt32, HRESULT)).call(val)
  end
  def get_notify_flags(pval : UInt32*) : HRESULT
    @lpVtbl.value.get_notify_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pval)
  end
  def set_notify_interface(val : IUnknown) : HRESULT
    @lpVtbl.value.set_notify_interface.unsafe_as(Proc(IUnknown, HRESULT)).call(val)
  end
  def get_notify_interface(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get_notify_interface.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def set_minimum_retry_delay(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_minimum_retry_delay.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_minimum_retry_delay(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_minimum_retry_delay.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def set_no_progress_timeout(seconds : UInt32) : HRESULT
    @lpVtbl.value.set_no_progress_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_no_progress_timeout(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_no_progress_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def get_error_count(errors : UInt32*) : HRESULT
    @lpVtbl.value.get_error_count.unsafe_as(Proc(UInt32*, HRESULT)).call(errors)
  end
  def set_proxy_settings(proxyusage : BG_JOB_PROXY_USAGE, proxylist : LibC::LPWSTR, proxybypasslist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(proxyusage, proxylist, proxybypasslist)
  end
  def get_proxy_settings(pproxyusage : BG_JOB_PROXY_USAGE*, pproxylist : LibC::LPWSTR*, pproxybypasslist : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_proxy_settings.unsafe_as(Proc(BG_JOB_PROXY_USAGE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pproxyusage, pproxylist, pproxybypasslist)
  end
  def take_ownership : HRESULT
    @lpVtbl.value.take_ownership.unsafe_as(Proc(HRESULT)).call
  end
  def set_notify_cmd_line(program : LibC::LPWSTR, parameters : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(program, parameters)
  end
  def get_notify_cmd_line(pprogram : LibC::LPWSTR*, pparameters : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_notify_cmd_line.unsafe_as(Proc(LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pprogram, pparameters)
  end
  def get_reply_progress(pprogress : BG_JOB_REPLY_PROGRESS*) : HRESULT
    @lpVtbl.value.get_reply_progress.unsafe_as(Proc(BG_JOB_REPLY_PROGRESS*, HRESULT)).call(pprogress)
  end
  def get_reply_data(ppbuffer : UInt8**, plength : UInt64*) : HRESULT
    @lpVtbl.value.get_reply_data.unsafe_as(Proc(UInt8**, UInt64*, HRESULT)).call(ppbuffer, plength)
  end
  def set_reply_file_name(replyfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_reply_file_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(replyfilename)
  end
  def get_reply_file_name(preplyfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_reply_file_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(preplyfilename)
  end
  def set_credentials(credentials : BG_AUTH_CREDENTIALS*) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(BG_AUTH_CREDENTIALS*, HRESULT)).call(credentials)
  end
  def remove_credentials(target : BG_AUTH_TARGET, scheme : BG_AUTH_SCHEME) : HRESULT
    @lpVtbl.value.remove_credentials.unsafe_as(Proc(BG_AUTH_TARGET, BG_AUTH_SCHEME, HRESULT)).call(target, scheme)
  end
  def replace_remote_prefix(oldprefix : LibC::LPWSTR, newprefix : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.replace_remote_prefix.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(oldprefix, newprefix)
  end
  def add_file_with_ranges(remoteurl : LibC::LPWSTR, localname : LibC::LPWSTR, rangecount : UInt32, ranges : BG_FILE_RANGE*) : HRESULT
    @lpVtbl.value.add_file_with_ranges.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, BG_FILE_RANGE*, HRESULT)).call(remoteurl, localname, rangecount, ranges)
  end
  def set_file_acl_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_file_acl_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_file_acl_flags(flags : UInt32*) : HRESULT
    @lpVtbl.value.get_file_acl_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(flags)
  end
  def set_peer_caching_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_peer_caching_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_peer_caching_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_peer_caching_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
  def get_owner_integrity_level(plevel : UInt32*) : HRESULT
    @lpVtbl.value.get_owner_integrity_level.unsafe_as(Proc(UInt32*, HRESULT)).call(plevel)
  end
  def get_owner_elevation_state(pelevated : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_owner_elevation_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pelevated)
  end
  def set_maximum_download_time(timeout : UInt32) : HRESULT
    @lpVtbl.value.set_maximum_download_time.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def get_maximum_download_time(ptimeout : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_download_time.unsafe_as(Proc(UInt32*, HRESULT)).call(ptimeout)
  end
  def set_property(propertyid : BITS_JOB_PROPERTY_ID, propertyvalue : BITS_JOB_PROPERTY_VALUE) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(BITS_JOB_PROPERTY_ID, BITS_JOB_PROPERTY_VALUE, HRESULT)).call(propertyid, propertyvalue)
  end
  def get_property(propertyid : BITS_JOB_PROPERTY_ID, propertyvalue : BITS_JOB_PROPERTY_VALUE*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(BITS_JOB_PROPERTY_ID, BITS_JOB_PROPERTY_VALUE*, HRESULT)).call(propertyid, propertyvalue)
  end
end
struct LibWin32::IBackgroundCopyFile5
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_remote_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_local_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_FILE_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_FILE_PROGRESS*, HRESULT)).call(pval)
  end
  def get_file_ranges(rangecount : UInt32*, ranges : BG_FILE_RANGE**) : HRESULT
    @lpVtbl.value.get_file_ranges.unsafe_as(Proc(UInt32*, BG_FILE_RANGE**, HRESULT)).call(rangecount, ranges)
  end
  def set_remote_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_remote_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_temporary_name(pfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_temporary_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pfilename)
  end
  def set_validation_state(state : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_validation_state.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(state)
  end
  def get_validation_state(pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_validation_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pstate)
  end
  def is_downloaded_from_peer(pval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_downloaded_from_peer.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pval)
  end
  def get_peer_download_stats(pfromorigin : UInt64*, pfrompeers : UInt64*) : HRESULT
    @lpVtbl.value.get_peer_download_stats.unsafe_as(Proc(UInt64*, UInt64*, HRESULT)).call(pfromorigin, pfrompeers)
  end
  def set_property(propertyid : BITS_FILE_PROPERTY_ID, propertyvalue : BITS_FILE_PROPERTY_VALUE) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE, HRESULT)).call(propertyid, propertyvalue)
  end
  def get_property(propertyid : BITS_FILE_PROPERTY_ID, propertyvalue : BITS_FILE_PROPERTY_VALUE*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE*, HRESULT)).call(propertyid, propertyvalue)
  end
end
struct LibWin32::IBackgroundCopyCallback3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def job_transferred(pjob : IBackgroundCopyJob) : HRESULT
    @lpVtbl.value.job_transferred.unsafe_as(Proc(IBackgroundCopyJob, HRESULT)).call(pjob)
  end
  def job_error(pjob : IBackgroundCopyJob, perror : IBackgroundCopyError) : HRESULT
    @lpVtbl.value.job_error.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyError, HRESULT)).call(pjob, perror)
  end
  def job_modification(pjob : IBackgroundCopyJob, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.job_modification.unsafe_as(Proc(IBackgroundCopyJob, UInt32, HRESULT)).call(pjob, dwreserved)
  end
  def file_transferred(pjob : IBackgroundCopyJob, pfile : IBackgroundCopyFile) : HRESULT
    @lpVtbl.value.file_transferred.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyFile, HRESULT)).call(pjob, pfile)
  end
  def file_ranges_transferred(job : IBackgroundCopyJob, file : IBackgroundCopyFile, rangecount : UInt32, ranges : BG_FILE_RANGE*) : HRESULT
    @lpVtbl.value.file_ranges_transferred.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyFile, UInt32, BG_FILE_RANGE*, HRESULT)).call(job, file, rangecount, ranges)
  end
end
struct LibWin32::IBackgroundCopyFile6
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_remote_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_local_name(pval : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pval)
  end
  def get_progress(pval : BG_FILE_PROGRESS*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(BG_FILE_PROGRESS*, HRESULT)).call(pval)
  end
  def get_file_ranges(rangecount : UInt32*, ranges : BG_FILE_RANGE**) : HRESULT
    @lpVtbl.value.get_file_ranges.unsafe_as(Proc(UInt32*, BG_FILE_RANGE**, HRESULT)).call(rangecount, ranges)
  end
  def set_remote_name(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_remote_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_temporary_name(pfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_temporary_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pfilename)
  end
  def set_validation_state(state : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_validation_state.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(state)
  end
  def get_validation_state(pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_validation_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pstate)
  end
  def is_downloaded_from_peer(pval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_downloaded_from_peer.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pval)
  end
  def get_peer_download_stats(pfromorigin : UInt64*, pfrompeers : UInt64*) : HRESULT
    @lpVtbl.value.get_peer_download_stats.unsafe_as(Proc(UInt64*, UInt64*, HRESULT)).call(pfromorigin, pfrompeers)
  end
  def set_property(propertyid : BITS_FILE_PROPERTY_ID, propertyvalue : BITS_FILE_PROPERTY_VALUE) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE, HRESULT)).call(propertyid, propertyvalue)
  end
  def get_property(propertyid : BITS_FILE_PROPERTY_ID, propertyvalue : BITS_FILE_PROPERTY_VALUE*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE*, HRESULT)).call(propertyid, propertyvalue)
  end
  def update_download_position(offset : UInt64) : HRESULT
    @lpVtbl.value.update_download_position.unsafe_as(Proc(UInt64, HRESULT)).call(offset)
  end
  def request_file_ranges(rangecount : UInt32, ranges : BG_FILE_RANGE*) : HRESULT
    @lpVtbl.value.request_file_ranges.unsafe_as(Proc(UInt32, BG_FILE_RANGE*, HRESULT)).call(rangecount, ranges)
  end
  def get_filled_file_ranges(rangecount : UInt32*, ranges : BG_FILE_RANGE**) : HRESULT
    @lpVtbl.value.get_filled_file_ranges.unsafe_as(Proc(UInt32*, BG_FILE_RANGE**, HRESULT)).call(rangecount, ranges)
  end
end
struct LibWin32::IBackgroundCopyJobHttpOptions2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_client_certificate_by_id(storelocation : BG_CERT_STORE_LOCATION, storename : LibC::LPWSTR, pcerthashblob : UInt8*) : HRESULT
    @lpVtbl.value.set_client_certificate_by_id.unsafe_as(Proc(BG_CERT_STORE_LOCATION, LibC::LPWSTR, UInt8*, HRESULT)).call(storelocation, storename, pcerthashblob)
  end
  def set_client_certificate_by_name(storelocation : BG_CERT_STORE_LOCATION, storename : LibC::LPWSTR, subjectname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_client_certificate_by_name.unsafe_as(Proc(BG_CERT_STORE_LOCATION, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(storelocation, storename, subjectname)
  end
  def remove_client_certificate : HRESULT
    @lpVtbl.value.remove_client_certificate.unsafe_as(Proc(HRESULT)).call
  end
  def get_client_certificate(pstorelocation : BG_CERT_STORE_LOCATION*, pstorename : LibC::LPWSTR*, ppcerthashblob : UInt8**, psubjectname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_client_certificate.unsafe_as(Proc(BG_CERT_STORE_LOCATION*, LibC::LPWSTR*, UInt8**, LibC::LPWSTR*, HRESULT)).call(pstorelocation, pstorename, ppcerthashblob, psubjectname)
  end
  def set_custom_headers(requestheaders : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_custom_headers.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(requestheaders)
  end
  def get_custom_headers(prequestheaders : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_custom_headers.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(prequestheaders)
  end
  def set_security_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_security_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_security_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_security_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
  def set_http_method(method : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_http_method.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(method)
  end
  def get_http_method(method : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_http_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(method)
  end
end
struct LibWin32::IBackgroundCopyServerCertificateValidationCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def validate_server_certificate(job : IBackgroundCopyJob, file : IBackgroundCopyFile, certlength : UInt32, certdata : UInt8*, certencodingtype : UInt32, certstorelength : UInt32, certstoredata : UInt8*) : HRESULT
    @lpVtbl.value.validate_server_certificate.unsafe_as(Proc(IBackgroundCopyJob, IBackgroundCopyFile, UInt32, UInt8*, UInt32, UInt32, UInt8*, HRESULT)).call(job, file, certlength, certdata, certencodingtype, certstorelength, certstoredata)
  end
end
struct LibWin32::IBackgroundCopyJobHttpOptions3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_client_certificate_by_id(storelocation : BG_CERT_STORE_LOCATION, storename : LibC::LPWSTR, pcerthashblob : UInt8*) : HRESULT
    @lpVtbl.value.set_client_certificate_by_id.unsafe_as(Proc(BG_CERT_STORE_LOCATION, LibC::LPWSTR, UInt8*, HRESULT)).call(storelocation, storename, pcerthashblob)
  end
  def set_client_certificate_by_name(storelocation : BG_CERT_STORE_LOCATION, storename : LibC::LPWSTR, subjectname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_client_certificate_by_name.unsafe_as(Proc(BG_CERT_STORE_LOCATION, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(storelocation, storename, subjectname)
  end
  def remove_client_certificate : HRESULT
    @lpVtbl.value.remove_client_certificate.unsafe_as(Proc(HRESULT)).call
  end
  def get_client_certificate(pstorelocation : BG_CERT_STORE_LOCATION*, pstorename : LibC::LPWSTR*, ppcerthashblob : UInt8**, psubjectname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_client_certificate.unsafe_as(Proc(BG_CERT_STORE_LOCATION*, LibC::LPWSTR*, UInt8**, LibC::LPWSTR*, HRESULT)).call(pstorelocation, pstorename, ppcerthashblob, psubjectname)
  end
  def set_custom_headers(requestheaders : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_custom_headers.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(requestheaders)
  end
  def get_custom_headers(prequestheaders : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_custom_headers.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(prequestheaders)
  end
  def set_security_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_security_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def get_security_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_security_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
  def set_http_method(method : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_http_method.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(method)
  end
  def get_http_method(method : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_http_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(method)
  end
  def set_server_certificate_validation_interface(certvalidationcallback : IUnknown) : HRESULT
    @lpVtbl.value.set_server_certificate_validation_interface.unsafe_as(Proc(IUnknown, HRESULT)).call(certvalidationcallback)
  end
  def make_custom_headers_write_only : HRESULT
    @lpVtbl.value.make_custom_headers_write_only.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IBITSExtensionSetup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def enable_bits_uploads : HRESULT
    @lpVtbl.value.enable_bits_uploads.unsafe_as(Proc(HRESULT)).call
  end
  def disable_bits_uploads : HRESULT
    @lpVtbl.value.disable_bits_uploads.unsafe_as(Proc(HRESULT)).call
  end
  def get_cleanup_task_name(ptaskname : UInt8**) : HRESULT
    @lpVtbl.value.get_cleanup_task_name.unsafe_as(Proc(UInt8**, HRESULT)).call(ptaskname)
  end
  def get_cleanup_task(riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_cleanup_task.unsafe_as(Proc(Guid*, IUnknown*, HRESULT)).call(riid, ppunk)
  end
end
struct LibWin32::IBITSExtensionSetupFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_object(path : UInt8*, ppextensionsetup : IBITSExtensionSetup*) : HRESULT
    @lpVtbl.value.get_object.unsafe_as(Proc(UInt8*, IBITSExtensionSetup*, HRESULT)).call(path, ppextensionsetup)
  end
end
struct LibWin32::IBackgroundCopyJob1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cancel_job : HRESULT
    @lpVtbl.value.cancel_job.unsafe_as(Proc(HRESULT)).call
  end
  def get_progress(dwflags : UInt32, pdwprogress : UInt32*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwflags, pdwprogress)
  end
  def get_status(pdwstatus : UInt32*, pdwwin32result : UInt32*, pdwtransportresult : UInt32*, pdwnumofretries : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, UInt32*, UInt32*, UInt32*, HRESULT)).call(pdwstatus, pdwwin32result, pdwtransportresult, pdwnumofretries)
  end
  def add_files(cfilecount : UInt32, ppfileset : FILESETINFO**) : HRESULT
    @lpVtbl.value.add_files.unsafe_as(Proc(UInt32, FILESETINFO**, HRESULT)).call(cfilecount, ppfileset)
  end
  def get_file(cfileindex : UInt32, pfileinfo : FILESETINFO*) : HRESULT
    @lpVtbl.value.get_file.unsafe_as(Proc(UInt32, FILESETINFO*, HRESULT)).call(cfileindex, pfileinfo)
  end
  def get_file_count(pdwfilecount : UInt32*) : HRESULT
    @lpVtbl.value.get_file_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwfilecount)
  end
  def switch_to_foreground : HRESULT
    @lpVtbl.value.switch_to_foreground.unsafe_as(Proc(HRESULT)).call
  end
  def get_job_id(pguidjobid : Guid*) : HRESULT
    @lpVtbl.value.get_job_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguidjobid)
  end
end
struct LibWin32::IEnumBackgroundCopyJobs1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : Guid*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, Guid*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumBackgroundCopyJobs1*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumBackgroundCopyJobs1*, HRESULT)).call(ppenum)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
end
struct LibWin32::IBackgroundCopyGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_prop(propid : GROUPPROP, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_prop.unsafe_as(Proc(GROUPPROP, VARIANT*, HRESULT)).call(propid, pvarval)
  end
  def set_prop(propid : GROUPPROP, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.set_prop.unsafe_as(Proc(GROUPPROP, VARIANT*, HRESULT)).call(propid, pvarval)
  end
  def get_progress(dwflags : UInt32, pdwprogress : UInt32*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwflags, pdwprogress)
  end
  def get_status(pdwstatus : UInt32*, pdwjobindex : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwstatus, pdwjobindex)
  end
  def get_job(jobid : Guid, ppjob : IBackgroundCopyJob1*) : HRESULT
    @lpVtbl.value.get_job.unsafe_as(Proc(Guid, IBackgroundCopyJob1*, HRESULT)).call(jobid, ppjob)
  end
  def suspend_group : HRESULT
    @lpVtbl.value.suspend_group.unsafe_as(Proc(HRESULT)).call
  end
  def resume_group : HRESULT
    @lpVtbl.value.resume_group.unsafe_as(Proc(HRESULT)).call
  end
  def cancel_group : HRESULT
    @lpVtbl.value.cancel_group.unsafe_as(Proc(HRESULT)).call
  end
  def get_size(pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwsize)
  end
  def get_group_id(pguidgroupid : Guid*) : HRESULT
    @lpVtbl.value.get_group_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguidgroupid)
  end
  def create_job(guidjobid : Guid, ppjob : IBackgroundCopyJob1*) : HRESULT
    @lpVtbl.value.create_job.unsafe_as(Proc(Guid, IBackgroundCopyJob1*, HRESULT)).call(guidjobid, ppjob)
  end
  def enum_jobs(dwflags : UInt32, ppenumjobs : IEnumBackgroundCopyJobs1*) : HRESULT
    @lpVtbl.value.enum_jobs.unsafe_as(Proc(UInt32, IEnumBackgroundCopyJobs1*, HRESULT)).call(dwflags, ppenumjobs)
  end
  def switch_to_foreground : HRESULT
    @lpVtbl.value.switch_to_foreground.unsafe_as(Proc(HRESULT)).call
  end
  def query_new_job_interface(iid : Guid*, punk : IUnknown*) : HRESULT
    @lpVtbl.value.query_new_job_interface.unsafe_as(Proc(Guid*, IUnknown*, HRESULT)).call(iid, punk)
  end
  def set_notification_pointer(iid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.set_notification_pointer.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(iid, punk)
  end
end
struct LibWin32::IEnumBackgroundCopyGroups
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : Guid*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, Guid*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumBackgroundCopyGroups*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumBackgroundCopyGroups*, HRESULT)).call(ppenum)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
end
struct LibWin32::IBackgroundCopyCallback1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_status(pgroup : IBackgroundCopyGroup, pjob : IBackgroundCopyJob1, dwfileindex : UInt32, dwstatus : UInt32, dwnumofretries : UInt32, dwwin32result : UInt32, dwtransportresult : UInt32) : HRESULT
    @lpVtbl.value.on_status.unsafe_as(Proc(IBackgroundCopyGroup, IBackgroundCopyJob1, UInt32, UInt32, UInt32, UInt32, UInt32, HRESULT)).call(pgroup, pjob, dwfileindex, dwstatus, dwnumofretries, dwwin32result, dwtransportresult)
  end
  def on_progress(progresstype : UInt32, pgroup : IBackgroundCopyGroup, pjob : IBackgroundCopyJob1, dwfileindex : UInt32, dwprogressvalue : UInt32) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(UInt32, IBackgroundCopyGroup, IBackgroundCopyJob1, UInt32, UInt32, HRESULT)).call(progresstype, pgroup, pjob, dwfileindex, dwprogressvalue)
  end
  def on_progress_ex(progresstype : UInt32, pgroup : IBackgroundCopyGroup, pjob : IBackgroundCopyJob1, dwfileindex : UInt32, dwprogressvalue : UInt32, dwbytearraysize : UInt32, pbyte : UInt8*) : HRESULT
    @lpVtbl.value.on_progress_ex.unsafe_as(Proc(UInt32, IBackgroundCopyGroup, IBackgroundCopyJob1, UInt32, UInt32, UInt32, UInt8*, HRESULT)).call(progresstype, pgroup, pjob, dwfileindex, dwprogressvalue, dwbytearraysize, pbyte)
  end
end
struct LibWin32::IBackgroundCopyQMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_group(guidgroupid : Guid, ppgroup : IBackgroundCopyGroup*) : HRESULT
    @lpVtbl.value.create_group.unsafe_as(Proc(Guid, IBackgroundCopyGroup*, HRESULT)).call(guidgroupid, ppgroup)
  end
  def get_group(groupid : Guid, ppgroup : IBackgroundCopyGroup*) : HRESULT
    @lpVtbl.value.get_group.unsafe_as(Proc(Guid, IBackgroundCopyGroup*, HRESULT)).call(groupid, ppgroup)
  end
  def enum_groups(dwflags : UInt32, ppenumgroups : IEnumBackgroundCopyGroups*) : HRESULT
    @lpVtbl.value.enum_groups.unsafe_as(Proc(UInt32, IEnumBackgroundCopyGroups*, HRESULT)).call(dwflags, ppenumgroups)
  end
end
