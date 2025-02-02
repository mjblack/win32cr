require "./../foundation.cr"
require "./../system/com.cr"

module Win32cr::Networking::BackgroundIntelligentTransferService
  extend self
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
    BG_TOKEN_LOCAL_FILE = 1_u32
    BG_TOKEN_NETWORK = 2_u32
  end
  enum BG_ERROR_CONTEXT
    BG_ERROR_CONTEXT_NONE = 0_i32
    BG_ERROR_CONTEXT_UNKNOWN = 1_i32
    BG_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER = 2_i32
    BG_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION = 3_i32
    BG_ERROR_CONTEXT_LOCAL_FILE = 4_i32
    BG_ERROR_CONTEXT_REMOTE_FILE = 5_i32
    BG_ERROR_CONTEXT_GENERAL_TRANSPORT = 6_i32
    BG_ERROR_CONTEXT_REMOTE_APPLICATION = 7_i32
    BG_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK = 8_i32
  end
  enum BG_JOB_PRIORITY
    BG_JOB_PRIORITY_FOREGROUND = 0_i32
    BG_JOB_PRIORITY_HIGH = 1_i32
    BG_JOB_PRIORITY_NORMAL = 2_i32
    BG_JOB_PRIORITY_LOW = 3_i32
  end
  enum BG_JOB_STATE
    BG_JOB_STATE_QUEUED = 0_i32
    BG_JOB_STATE_CONNECTING = 1_i32
    BG_JOB_STATE_TRANSFERRING = 2_i32
    BG_JOB_STATE_SUSPENDED = 3_i32
    BG_JOB_STATE_ERROR = 4_i32
    BG_JOB_STATE_TRANSIENT_ERROR = 5_i32
    BG_JOB_STATE_TRANSFERRED = 6_i32
    BG_JOB_STATE_ACKNOWLEDGED = 7_i32
    BG_JOB_STATE_CANCELLED = 8_i32
  end
  enum BG_JOB_TYPE
    BG_JOB_TYPE_DOWNLOAD = 0_i32
    BG_JOB_TYPE_UPLOAD = 1_i32
    BG_JOB_TYPE_UPLOAD_REPLY = 2_i32
  end
  enum BG_JOB_PROXY_USAGE
    BG_JOB_PROXY_USAGE_PRECONFIG = 0_i32
    BG_JOB_PROXY_USAGE_NO_PROXY = 1_i32
    BG_JOB_PROXY_USAGE_OVERRIDE = 2_i32
    BG_JOB_PROXY_USAGE_AUTODETECT = 3_i32
  end
  enum BG_AUTH_TARGET
    BG_AUTH_TARGET_SERVER = 1_i32
    BG_AUTH_TARGET_PROXY = 2_i32
  end
  enum BG_AUTH_SCHEME
    BG_AUTH_SCHEME_BASIC = 1_i32
    BG_AUTH_SCHEME_DIGEST = 2_i32
    BG_AUTH_SCHEME_NTLM = 3_i32
    BG_AUTH_SCHEME_NEGOTIATE = 4_i32
    BG_AUTH_SCHEME_PASSPORT = 5_i32
  end
  enum BG_CERT_STORE_LOCATION
    BG_CERT_STORE_LOCATION_CURRENT_USER = 0_i32
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE = 1_i32
    BG_CERT_STORE_LOCATION_CURRENT_SERVICE = 2_i32
    BG_CERT_STORE_LOCATION_SERVICES = 3_i32
    BG_CERT_STORE_LOCATION_USERS = 4_i32
    BG_CERT_STORE_LOCATION_CURRENT_USER_GROUP_POLICY = 5_i32
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE_GROUP_POLICY = 6_i32
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE_ENTERPRISE = 7_i32
  end
  enum BITS_JOB_TRANSFER_POLICY
    BITS_JOB_TRANSFER_POLICY_ALWAYS = -2147483393_i32
    BITS_JOB_TRANSFER_POLICY_NOT_ROAMING = -2147483521_i32
    BITS_JOB_TRANSFER_POLICY_NO_SURCHARGE = -2147483537_i32
    BITS_JOB_TRANSFER_POLICY_STANDARD = -2147483545_i32
    BITS_JOB_TRANSFER_POLICY_UNRESTRICTED = -2147483615_i32
  end
  enum BITS_JOB_PROPERTY_ID
    BITS_JOB_PROPERTY_ID_COST_FLAGS = 1_i32
    BITS_JOB_PROPERTY_NOTIFICATION_CLSID = 2_i32
    BITS_JOB_PROPERTY_DYNAMIC_CONTENT = 3_i32
    BITS_JOB_PROPERTY_HIGH_PERFORMANCE = 4_i32
    BITS_JOB_PROPERTY_MAX_DOWNLOAD_SIZE = 5_i32
    BITS_JOB_PROPERTY_USE_STORED_CREDENTIALS = 7_i32
    BITS_JOB_PROPERTY_MINIMUM_NOTIFICATION_INTERVAL_MS = 9_i32
    BITS_JOB_PROPERTY_ON_DEMAND_MODE = 10_i32
  end
  enum BITS_FILE_PROPERTY_ID
    BITS_FILE_PROPERTY_ID_HTTP_RESPONSE_HEADERS = 1_i32
  end
  enum GROUPPROP
    GROUPPROP_PRIORITY = 0_i32
    GROUPPROP_REMOTEUSERID = 1_i32
    GROUPPROP_REMOTEUSERPWD = 2_i32
    GROUPPROP_LOCALUSERID = 3_i32
    GROUPPROP_LOCALUSERPWD = 4_i32
    GROUPPROP_PROTOCOLFLAGS = 5_i32
    GROUPPROP_NOTIFYFLAGS = 6_i32
    GROUPPROP_NOTIFYCLSID = 7_i32
    GROUPPROP_PROGRESSSIZE = 8_i32
    GROUPPROP_PROGRESSPERCENT = 9_i32
    GROUPPROP_PROGRESSTIME = 10_i32
    GROUPPROP_DISPLAYNAME = 11_i32
    GROUPPROP_DESCRIPTION = 12_i32
  end

  @[Extern]
  struct BG_FILE_PROGRESS
    property bytes_total : UInt64
    property bytes_transferred : UInt64
    property completed : Win32cr::Foundation::BOOL
    def initialize(@bytes_total : UInt64, @bytes_transferred : UInt64, @completed : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct BG_FILE_INFO
    property remote_name : Win32cr::Foundation::PWSTR
    property local_name : Win32cr::Foundation::PWSTR
    def initialize(@remote_name : Win32cr::Foundation::PWSTR, @local_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct BG_JOB_PROGRESS
    property bytes_total : UInt64
    property bytes_transferred : UInt64
    property files_total : UInt32
    property files_transferred : UInt32
    def initialize(@bytes_total : UInt64, @bytes_transferred : UInt64, @files_total : UInt32, @files_transferred : UInt32)
    end
  end

  @[Extern]
  struct BG_JOB_TIMES
    property creation_time : Win32cr::Foundation::FILETIME
    property modification_time : Win32cr::Foundation::FILETIME
    property transfer_completion_time : Win32cr::Foundation::FILETIME
    def initialize(@creation_time : Win32cr::Foundation::FILETIME, @modification_time : Win32cr::Foundation::FILETIME, @transfer_completion_time : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  struct BG_JOB_REPLY_PROGRESS
    property bytes_total : UInt64
    property bytes_transferred : UInt64
    def initialize(@bytes_total : UInt64, @bytes_transferred : UInt64)
    end
  end

  @[Extern]
  struct BG_BASIC_CREDENTIALS
    property user_name : Win32cr::Foundation::PWSTR
    property password : Win32cr::Foundation::PWSTR
    def initialize(@user_name : Win32cr::Foundation::PWSTR, @password : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern(union: true)]
  struct BG_AUTH_CREDENTIALS_UNION
    property basic : Win32cr::Networking::BackgroundIntelligentTransferService::BG_BASIC_CREDENTIALS
    def initialize(@basic : Win32cr::Networking::BackgroundIntelligentTransferService::BG_BASIC_CREDENTIALS)
    end
  end

  @[Extern]
  struct BG_AUTH_CREDENTIALS
    property target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET
    property scheme : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME
    property credentials : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS_UNION
    def initialize(@target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, @scheme : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME, @credentials : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS_UNION)
    end
  end

  @[Extern]
  struct BG_FILE_RANGE
    property initial_offset : UInt64
    property length : UInt64
    def initialize(@initial_offset : UInt64, @length : UInt64)
    end
  end

  @[Extern(union: true)]
  struct BITS_JOB_PROPERTY_VALUE
    property dword : UInt32
    property cls_id : LibC::GUID
    property enable : Win32cr::Foundation::BOOL
    property uint64 : UInt64
    property target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET
    def initialize(@dword : UInt32, @cls_id : LibC::GUID, @enable : Win32cr::Foundation::BOOL, @uint64 : UInt64, @target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET)
    end
  end

  @[Extern(union: true)]
  struct BITS_FILE_PROPERTY_VALUE
    property string : Win32cr::Foundation::PWSTR
    def initialize(@string : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct FILESETINFO
    property bstrRemoteFile : Win32cr::Foundation::BSTR
    property bstrLocalFile : Win32cr::Foundation::BSTR
    property dwSizeHint : UInt32
    def initialize(@bstrRemoteFile : Win32cr::Foundation::BSTR, @bstrLocalFile : Win32cr::Foundation::BSTR, @dwSizeHint : UInt32)
    end
  end

  @[Extern]
  record IBackgroundCopyFileVtbl,
    query_interface : Proc(IBackgroundCopyFile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyFile*, UInt32),
    release : Proc(IBackgroundCopyFile*, UInt32),
    get_remote_name : Proc(IBackgroundCopyFile*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_name : Proc(IBackgroundCopyFile*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyFile*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyFile, lpVtbl : IBackgroundCopyFileVtbl* do
    GUID = LibC::GUID.new(0x1b7bd23_u32, 0xfb88_u16, 0x4a77_u16, StaticArray[0x84_u8, 0x90_u8, 0x58_u8, 0x91_u8, 0xd3_u8, 0xe4_u8, 0x65_u8, 0x3a_u8])
    def query_interface(this : IBackgroundCopyFile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyFile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyFile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_remote_name(this : IBackgroundCopyFile*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_name.call(this, pVal)
    end
    def get_local_name(this : IBackgroundCopyFile*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_name.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyFile*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end

  end

  @[Extern]
  record IEnumBackgroundCopyFilesVtbl,
    query_interface : Proc(IEnumBackgroundCopyFiles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumBackgroundCopyFiles*, UInt32),
    release : Proc(IEnumBackgroundCopyFiles*, UInt32),
    next__ : Proc(IEnumBackgroundCopyFiles*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumBackgroundCopyFiles*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumBackgroundCopyFiles*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumBackgroundCopyFiles*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IEnumBackgroundCopyFiles*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumBackgroundCopyFiles, lpVtbl : IEnumBackgroundCopyFilesVtbl* do
    GUID = LibC::GUID.new(0xca51e165_u32, 0xc365_u16, 0x424c_u16, StaticArray[0x8d_u8, 0x41_u8, 0x24_u8, 0xaa_u8, 0xa4_u8, 0xff_u8, 0x3c_u8, 0x40_u8])
    def query_interface(this : IEnumBackgroundCopyFiles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumBackgroundCopyFiles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumBackgroundCopyFiles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumBackgroundCopyFiles*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumBackgroundCopyFiles*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumBackgroundCopyFiles*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumBackgroundCopyFiles*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end
    def get_count(this : IEnumBackgroundCopyFiles*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end

  end

  @[Extern]
  record IBackgroundCopyErrorVtbl,
    query_interface : Proc(IBackgroundCopyError*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyError*, UInt32),
    release : Proc(IBackgroundCopyError*, UInt32),
    get_error : Proc(IBackgroundCopyError*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_ERROR_CONTEXT*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_file : Proc(IBackgroundCopyError*, Void**, Win32cr::Foundation::HRESULT),
    get_error_description : Proc(IBackgroundCopyError*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_error_context_description : Proc(IBackgroundCopyError*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_protocol : Proc(IBackgroundCopyError*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyError, lpVtbl : IBackgroundCopyErrorVtbl* do
    GUID = LibC::GUID.new(0x19c613a0_u32, 0xfcb8_u16, 0x4f28_u16, StaticArray[0x81_u8, 0xae_u8, 0x89_u8, 0x7c_u8, 0x3d_u8, 0x7_u8, 0x8f_u8, 0x81_u8])
    def query_interface(this : IBackgroundCopyError*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyError*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyError*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_error(this : IBackgroundCopyError*, pContext : Win32cr::Networking::BackgroundIntelligentTransferService::BG_ERROR_CONTEXT*, pCode : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error.call(this, pContext, pCode)
    end
    def get_file(this : IBackgroundCopyError*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file.call(this, pVal)
    end
    def get_error_description(this : IBackgroundCopyError*, language_id : UInt32, pErrorDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_description.call(this, language_id, pErrorDescription)
    end
    def get_error_context_description(this : IBackgroundCopyError*, language_id : UInt32, pContextDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_context_description.call(this, language_id, pContextDescription)
    end
    def get_protocol(this : IBackgroundCopyError*, pProtocol : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol.call(this, pProtocol)
    end

  end

  @[Extern]
  record IBackgroundCopyJobVtbl,
    query_interface : Proc(IBackgroundCopyJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJob*, UInt32),
    release : Proc(IBackgroundCopyJob*, UInt32),
    add_file_set : Proc(IBackgroundCopyJob*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*, Win32cr::Foundation::HRESULT),
    add_file : Proc(IBackgroundCopyJob*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_files : Proc(IBackgroundCopyJob*, Void**, Win32cr::Foundation::HRESULT),
    suspend : Proc(IBackgroundCopyJob*, Win32cr::Foundation::HRESULT),
    resume : Proc(IBackgroundCopyJob*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IBackgroundCopyJob*, Win32cr::Foundation::HRESULT),
    complete : Proc(IBackgroundCopyJob*, Win32cr::Foundation::HRESULT),
    get_id : Proc(IBackgroundCopyJob*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_times : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*, Win32cr::Foundation::HRESULT),
    get_error : Proc(IBackgroundCopyJob*, Void**, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IBackgroundCopyJob*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_display_name : Proc(IBackgroundCopyJob*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IBackgroundCopyJob*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IBackgroundCopyJob*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IBackgroundCopyJob*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*, Win32cr::Foundation::HRESULT),
    set_notify_flags : Proc(IBackgroundCopyJob*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_flags : Proc(IBackgroundCopyJob*, UInt32*, Win32cr::Foundation::HRESULT),
    set_notify_interface : Proc(IBackgroundCopyJob*, Void*, Win32cr::Foundation::HRESULT),
    get_notify_interface : Proc(IBackgroundCopyJob*, Void**, Win32cr::Foundation::HRESULT),
    set_minimum_retry_delay : Proc(IBackgroundCopyJob*, UInt32, Win32cr::Foundation::HRESULT),
    get_minimum_retry_delay : Proc(IBackgroundCopyJob*, UInt32*, Win32cr::Foundation::HRESULT),
    set_no_progress_timeout : Proc(IBackgroundCopyJob*, UInt32, Win32cr::Foundation::HRESULT),
    get_no_progress_timeout : Proc(IBackgroundCopyJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_error_count : Proc(IBackgroundCopyJob*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_settings : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_settings : Proc(IBackgroundCopyJob*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IBackgroundCopyJob*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJob, lpVtbl : IBackgroundCopyJobVtbl* do
    GUID = LibC::GUID.new(0x37668d37_u32, 0x507e_u16, 0x4160_u16, StaticArray[0x93_u8, 0x16_u8, 0x26_u8, 0x30_u8, 0x6d_u8, 0x15_u8, 0xb_u8, 0x12_u8])
    def query_interface(this : IBackgroundCopyJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_file_set(this : IBackgroundCopyJob*, cFileCount : UInt32, pFileSet : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_set.call(this, cFileCount, pFileSet)
    end
    def add_file(this : IBackgroundCopyJob*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file.call(this, remote_url, local_name)
    end
    def enum_files(this : IBackgroundCopyJob*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_files.call(this, pEnum)
    end
    def suspend(this : IBackgroundCopyJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this)
    end
    def resume(this : IBackgroundCopyJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def cancel(this : IBackgroundCopyJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def complete(this : IBackgroundCopyJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete.call(this)
    end
    def get_id(this : IBackgroundCopyJob*, pVal : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pVal)
    end
    def get_type(this : IBackgroundCopyJob*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyJob*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_times(this : IBackgroundCopyJob*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_times.call(this, pVal)
    end
    def get_state(this : IBackgroundCopyJob*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pVal)
    end
    def get_error(this : IBackgroundCopyJob*, ppError : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error.call(this, ppError)
    end
    def get_owner(this : IBackgroundCopyJob*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, pVal)
    end
    def set_display_name(this : IBackgroundCopyJob*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_name.call(this, val)
    end
    def get_display_name(this : IBackgroundCopyJob*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pVal)
    end
    def set_description(this : IBackgroundCopyJob*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, val)
    end
    def get_description(this : IBackgroundCopyJob*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pVal)
    end
    def set_priority(this : IBackgroundCopyJob*, val : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, val)
    end
    def get_priority(this : IBackgroundCopyJob*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pVal)
    end
    def set_notify_flags(this : IBackgroundCopyJob*, val : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_flags.call(this, val)
    end
    def get_notify_flags(this : IBackgroundCopyJob*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_flags.call(this, pVal)
    end
    def set_notify_interface(this : IBackgroundCopyJob*, val : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_interface.call(this, val)
    end
    def get_notify_interface(this : IBackgroundCopyJob*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_interface.call(this, pVal)
    end
    def set_minimum_retry_delay(this : IBackgroundCopyJob*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_minimum_retry_delay.call(this, seconds)
    end
    def get_minimum_retry_delay(this : IBackgroundCopyJob*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_minimum_retry_delay.call(this, seconds)
    end
    def set_no_progress_timeout(this : IBackgroundCopyJob*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_no_progress_timeout.call(this, seconds)
    end
    def get_no_progress_timeout(this : IBackgroundCopyJob*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_no_progress_timeout.call(this, seconds)
    end
    def get_error_count(this : IBackgroundCopyJob*, errors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_count.call(this, errors)
    end
    def set_proxy_settings(this : IBackgroundCopyJob*, proxy_usage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, proxy_list : Win32cr::Foundation::PWSTR, proxy_bypass_list : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_settings.call(this, proxy_usage, proxy_list, proxy_bypass_list)
    end
    def get_proxy_settings(this : IBackgroundCopyJob*, pProxyUsage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, pProxyList : Win32cr::Foundation::PWSTR*, pProxyBypassList : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_settings.call(this, pProxyUsage, pProxyList, pProxyBypassList)
    end
    def take_ownership(this : IBackgroundCopyJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this)
    end

  end

  @[Extern]
  record IEnumBackgroundCopyJobsVtbl,
    query_interface : Proc(IEnumBackgroundCopyJobs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumBackgroundCopyJobs*, UInt32),
    release : Proc(IEnumBackgroundCopyJobs*, UInt32),
    next__ : Proc(IEnumBackgroundCopyJobs*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumBackgroundCopyJobs*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumBackgroundCopyJobs*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumBackgroundCopyJobs*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IEnumBackgroundCopyJobs*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumBackgroundCopyJobs, lpVtbl : IEnumBackgroundCopyJobsVtbl* do
    GUID = LibC::GUID.new(0x1af4f612_u32, 0x3b71_u16, 0x466f_u16, StaticArray[0x8f_u8, 0x58_u8, 0x7b_u8, 0x6f_u8, 0x73_u8, 0xac_u8, 0x57_u8, 0xad_u8])
    def query_interface(this : IEnumBackgroundCopyJobs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumBackgroundCopyJobs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumBackgroundCopyJobs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumBackgroundCopyJobs*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumBackgroundCopyJobs*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumBackgroundCopyJobs*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumBackgroundCopyJobs*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end
    def get_count(this : IEnumBackgroundCopyJobs*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end

  end

  @[Extern]
  record IBackgroundCopyCallbackVtbl,
    query_interface : Proc(IBackgroundCopyCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyCallback*, UInt32),
    release : Proc(IBackgroundCopyCallback*, UInt32),
    job_transferred : Proc(IBackgroundCopyCallback*, Void*, Win32cr::Foundation::HRESULT),
    job_error : Proc(IBackgroundCopyCallback*, Void*, Void*, Win32cr::Foundation::HRESULT),
    job_modification : Proc(IBackgroundCopyCallback*, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyCallback, lpVtbl : IBackgroundCopyCallbackVtbl* do
    GUID = LibC::GUID.new(0x97ea99c7_u32, 0x186_u16, 0x4ad4_u16, StaticArray[0x8d_u8, 0xf9_u8, 0xc5_u8, 0xb4_u8, 0xe0_u8, 0xed_u8, 0x6b_u8, 0x22_u8])
    def query_interface(this : IBackgroundCopyCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def job_transferred(this : IBackgroundCopyCallback*, pJob : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_transferred.call(this, pJob)
    end
    def job_error(this : IBackgroundCopyCallback*, pJob : Void*, pError : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_error.call(this, pJob, pError)
    end
    def job_modification(this : IBackgroundCopyCallback*, pJob : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_modification.call(this, pJob, dwReserved)
    end

  end

  @[Extern]
  record AsyncIBackgroundCopyCallbackVtbl,
    query_interface : Proc(AsyncIBackgroundCopyCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIBackgroundCopyCallback*, UInt32),
    release : Proc(AsyncIBackgroundCopyCallback*, UInt32),
    begin_job_transferred : Proc(AsyncIBackgroundCopyCallback*, Void*, Win32cr::Foundation::HRESULT),
    finish_job_transferred : Proc(AsyncIBackgroundCopyCallback*, Win32cr::Foundation::HRESULT),
    begin_job_error : Proc(AsyncIBackgroundCopyCallback*, Void*, Void*, Win32cr::Foundation::HRESULT),
    finish_job_error : Proc(AsyncIBackgroundCopyCallback*, Win32cr::Foundation::HRESULT),
    begin_job_modification : Proc(AsyncIBackgroundCopyCallback*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    finish_job_modification : Proc(AsyncIBackgroundCopyCallback*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIBackgroundCopyCallback, lpVtbl : AsyncIBackgroundCopyCallbackVtbl* do
    GUID = LibC::GUID.new(0xca29d251_u32, 0xb4bb_u16, 0x4679_u16, StaticArray[0xa3_u8, 0xd9_u8, 0xae_u8, 0x80_u8, 0x6_u8, 0x11_u8, 0x9d_u8, 0x54_u8])
    def query_interface(this : AsyncIBackgroundCopyCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIBackgroundCopyCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIBackgroundCopyCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_job_transferred(this : AsyncIBackgroundCopyCallback*, pJob : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_job_transferred.call(this, pJob)
    end
    def finish_job_transferred(this : AsyncIBackgroundCopyCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_job_transferred.call(this)
    end
    def begin_job_error(this : AsyncIBackgroundCopyCallback*, pJob : Void*, pError : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_job_error.call(this, pJob, pError)
    end
    def finish_job_error(this : AsyncIBackgroundCopyCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_job_error.call(this)
    end
    def begin_job_modification(this : AsyncIBackgroundCopyCallback*, pJob : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_job_modification.call(this, pJob, dwReserved)
    end
    def finish_job_modification(this : AsyncIBackgroundCopyCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_job_modification.call(this)
    end

  end

  @[Extern]
  record IBackgroundCopyManagerVtbl,
    query_interface : Proc(IBackgroundCopyManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyManager*, UInt32),
    release : Proc(IBackgroundCopyManager*, UInt32),
    create_job : Proc(IBackgroundCopyManager*, Win32cr::Foundation::PWSTR, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_job : Proc(IBackgroundCopyManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_jobs : Proc(IBackgroundCopyManager*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_error_description : Proc(IBackgroundCopyManager*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyManager, lpVtbl : IBackgroundCopyManagerVtbl* do
    GUID = LibC::GUID.new(0x5ce34c0d_u32, 0xdc9_u16, 0x4c1f_u16, StaticArray[0x89_u8, 0x7c_u8, 0xda_u8, 0xa1_u8, 0xb7_u8, 0x8c_u8, 0xee_u8, 0x7c_u8])
    def query_interface(this : IBackgroundCopyManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_job(this : IBackgroundCopyManager*, display_name : Win32cr::Foundation::PWSTR, type__ : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE, pJobId : LibC::GUID*, ppJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_job.call(this, display_name, type__, pJobId, ppJob)
    end
    def get_job(this : IBackgroundCopyManager*, jobID : LibC::GUID*, ppJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_job.call(this, jobID, ppJob)
    end
    def enum_jobs(this : IBackgroundCopyManager*, dwFlags : UInt32, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_jobs.call(this, dwFlags, ppEnum)
    end
    def get_error_description(this : IBackgroundCopyManager*, hResult : Win32cr::Foundation::HRESULT, language_id : UInt32, pErrorDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_description.call(this, hResult, language_id, pErrorDescription)
    end

  end

  @[Extern]
  record IBackgroundCopyJob2Vtbl,
    query_interface : Proc(IBackgroundCopyJob2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJob2*, UInt32),
    release : Proc(IBackgroundCopyJob2*, UInt32),
    add_file_set : Proc(IBackgroundCopyJob2*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*, Win32cr::Foundation::HRESULT),
    add_file : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_files : Proc(IBackgroundCopyJob2*, Void**, Win32cr::Foundation::HRESULT),
    suspend : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::HRESULT),
    resume : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::HRESULT),
    complete : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::HRESULT),
    get_id : Proc(IBackgroundCopyJob2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_times : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*, Win32cr::Foundation::HRESULT),
    get_error : Proc(IBackgroundCopyJob2*, Void**, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_display_name : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*, Win32cr::Foundation::HRESULT),
    set_notify_flags : Proc(IBackgroundCopyJob2*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_flags : Proc(IBackgroundCopyJob2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_notify_interface : Proc(IBackgroundCopyJob2*, Void*, Win32cr::Foundation::HRESULT),
    get_notify_interface : Proc(IBackgroundCopyJob2*, Void**, Win32cr::Foundation::HRESULT),
    set_minimum_retry_delay : Proc(IBackgroundCopyJob2*, UInt32, Win32cr::Foundation::HRESULT),
    get_minimum_retry_delay : Proc(IBackgroundCopyJob2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_no_progress_timeout : Proc(IBackgroundCopyJob2*, UInt32, Win32cr::Foundation::HRESULT),
    get_no_progress_timeout : Proc(IBackgroundCopyJob2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_error_count : Proc(IBackgroundCopyJob2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_settings : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_settings : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::HRESULT),
    set_notify_cmd_line : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_notify_cmd_line : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_reply_progress : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_reply_data : Proc(IBackgroundCopyJob2*, UInt8**, UInt64*, Win32cr::Foundation::HRESULT),
    set_reply_file_name : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_reply_file_name : Proc(IBackgroundCopyJob2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*, Win32cr::Foundation::HRESULT),
    remove_credentials : Proc(IBackgroundCopyJob2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJob2, lpVtbl : IBackgroundCopyJob2Vtbl* do
    GUID = LibC::GUID.new(0x54b50739_u32, 0x686f_u16, 0x45eb_u16, StaticArray[0x9d_u8, 0xff_u8, 0xd6_u8, 0xa9_u8, 0xa0_u8, 0xfa_u8, 0xa9_u8, 0xaf_u8])
    def query_interface(this : IBackgroundCopyJob2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJob2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJob2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_file_set(this : IBackgroundCopyJob2*, cFileCount : UInt32, pFileSet : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_set.call(this, cFileCount, pFileSet)
    end
    def add_file(this : IBackgroundCopyJob2*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file.call(this, remote_url, local_name)
    end
    def enum_files(this : IBackgroundCopyJob2*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_files.call(this, pEnum)
    end
    def suspend(this : IBackgroundCopyJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this)
    end
    def resume(this : IBackgroundCopyJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def cancel(this : IBackgroundCopyJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def complete(this : IBackgroundCopyJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete.call(this)
    end
    def get_id(this : IBackgroundCopyJob2*, pVal : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pVal)
    end
    def get_type(this : IBackgroundCopyJob2*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyJob2*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_times(this : IBackgroundCopyJob2*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_times.call(this, pVal)
    end
    def get_state(this : IBackgroundCopyJob2*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pVal)
    end
    def get_error(this : IBackgroundCopyJob2*, ppError : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error.call(this, ppError)
    end
    def get_owner(this : IBackgroundCopyJob2*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, pVal)
    end
    def set_display_name(this : IBackgroundCopyJob2*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_name.call(this, val)
    end
    def get_display_name(this : IBackgroundCopyJob2*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pVal)
    end
    def set_description(this : IBackgroundCopyJob2*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, val)
    end
    def get_description(this : IBackgroundCopyJob2*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pVal)
    end
    def set_priority(this : IBackgroundCopyJob2*, val : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, val)
    end
    def get_priority(this : IBackgroundCopyJob2*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pVal)
    end
    def set_notify_flags(this : IBackgroundCopyJob2*, val : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_flags.call(this, val)
    end
    def get_notify_flags(this : IBackgroundCopyJob2*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_flags.call(this, pVal)
    end
    def set_notify_interface(this : IBackgroundCopyJob2*, val : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_interface.call(this, val)
    end
    def get_notify_interface(this : IBackgroundCopyJob2*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_interface.call(this, pVal)
    end
    def set_minimum_retry_delay(this : IBackgroundCopyJob2*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_minimum_retry_delay.call(this, seconds)
    end
    def get_minimum_retry_delay(this : IBackgroundCopyJob2*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_minimum_retry_delay.call(this, seconds)
    end
    def set_no_progress_timeout(this : IBackgroundCopyJob2*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_no_progress_timeout.call(this, seconds)
    end
    def get_no_progress_timeout(this : IBackgroundCopyJob2*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_no_progress_timeout.call(this, seconds)
    end
    def get_error_count(this : IBackgroundCopyJob2*, errors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_count.call(this, errors)
    end
    def set_proxy_settings(this : IBackgroundCopyJob2*, proxy_usage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, proxy_list : Win32cr::Foundation::PWSTR, proxy_bypass_list : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_settings.call(this, proxy_usage, proxy_list, proxy_bypass_list)
    end
    def get_proxy_settings(this : IBackgroundCopyJob2*, pProxyUsage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, pProxyList : Win32cr::Foundation::PWSTR*, pProxyBypassList : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_settings.call(this, pProxyUsage, pProxyList, pProxyBypassList)
    end
    def take_ownership(this : IBackgroundCopyJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this)
    end
    def set_notify_cmd_line(this : IBackgroundCopyJob2*, program : Win32cr::Foundation::PWSTR, parameters : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_cmd_line.call(this, program, parameters)
    end
    def get_notify_cmd_line(this : IBackgroundCopyJob2*, pProgram : Win32cr::Foundation::PWSTR*, pParameters : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_cmd_line.call(this, pProgram, pParameters)
    end
    def get_reply_progress(this : IBackgroundCopyJob2*, pProgress : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_progress.call(this, pProgress)
    end
    def get_reply_data(this : IBackgroundCopyJob2*, ppBuffer : UInt8**, pLength : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_data.call(this, ppBuffer, pLength)
    end
    def set_reply_file_name(this : IBackgroundCopyJob2*, reply_file_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_reply_file_name.call(this, reply_file_name)
    end
    def get_reply_file_name(this : IBackgroundCopyJob2*, pReplyFileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_file_name.call(this, pReplyFileName)
    end
    def set_credentials(this : IBackgroundCopyJob2*, credentials : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, credentials)
    end
    def remove_credentials(this : IBackgroundCopyJob2*, target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, scheme : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_credentials.call(this, target, scheme)
    end

  end

  @[Extern]
  record IBackgroundCopyJob3Vtbl,
    query_interface : Proc(IBackgroundCopyJob3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJob3*, UInt32),
    release : Proc(IBackgroundCopyJob3*, UInt32),
    add_file_set : Proc(IBackgroundCopyJob3*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*, Win32cr::Foundation::HRESULT),
    add_file : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_files : Proc(IBackgroundCopyJob3*, Void**, Win32cr::Foundation::HRESULT),
    suspend : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::HRESULT),
    resume : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::HRESULT),
    complete : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::HRESULT),
    get_id : Proc(IBackgroundCopyJob3*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_times : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*, Win32cr::Foundation::HRESULT),
    get_error : Proc(IBackgroundCopyJob3*, Void**, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_display_name : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*, Win32cr::Foundation::HRESULT),
    set_notify_flags : Proc(IBackgroundCopyJob3*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_flags : Proc(IBackgroundCopyJob3*, UInt32*, Win32cr::Foundation::HRESULT),
    set_notify_interface : Proc(IBackgroundCopyJob3*, Void*, Win32cr::Foundation::HRESULT),
    get_notify_interface : Proc(IBackgroundCopyJob3*, Void**, Win32cr::Foundation::HRESULT),
    set_minimum_retry_delay : Proc(IBackgroundCopyJob3*, UInt32, Win32cr::Foundation::HRESULT),
    get_minimum_retry_delay : Proc(IBackgroundCopyJob3*, UInt32*, Win32cr::Foundation::HRESULT),
    set_no_progress_timeout : Proc(IBackgroundCopyJob3*, UInt32, Win32cr::Foundation::HRESULT),
    get_no_progress_timeout : Proc(IBackgroundCopyJob3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_error_count : Proc(IBackgroundCopyJob3*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_settings : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_settings : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::HRESULT),
    set_notify_cmd_line : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_notify_cmd_line : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_reply_progress : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_reply_data : Proc(IBackgroundCopyJob3*, UInt8**, UInt64*, Win32cr::Foundation::HRESULT),
    set_reply_file_name : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_reply_file_name : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*, Win32cr::Foundation::HRESULT),
    remove_credentials : Proc(IBackgroundCopyJob3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME, Win32cr::Foundation::HRESULT),
    replace_remote_prefix : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_file_with_ranges : Proc(IBackgroundCopyJob3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*, Win32cr::Foundation::HRESULT),
    set_file_acl_flags : Proc(IBackgroundCopyJob3*, UInt32, Win32cr::Foundation::HRESULT),
    get_file_acl_flags : Proc(IBackgroundCopyJob3*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJob3, lpVtbl : IBackgroundCopyJob3Vtbl* do
    GUID = LibC::GUID.new(0x443c8934_u32, 0x90ff_u16, 0x48ed_u16, StaticArray[0xbc_u8, 0xde_u8, 0x26_u8, 0xf5_u8, 0xc7_u8, 0x45_u8, 0x0_u8, 0x42_u8])
    def query_interface(this : IBackgroundCopyJob3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJob3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJob3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_file_set(this : IBackgroundCopyJob3*, cFileCount : UInt32, pFileSet : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_set.call(this, cFileCount, pFileSet)
    end
    def add_file(this : IBackgroundCopyJob3*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file.call(this, remote_url, local_name)
    end
    def enum_files(this : IBackgroundCopyJob3*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_files.call(this, pEnum)
    end
    def suspend(this : IBackgroundCopyJob3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this)
    end
    def resume(this : IBackgroundCopyJob3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def cancel(this : IBackgroundCopyJob3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def complete(this : IBackgroundCopyJob3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete.call(this)
    end
    def get_id(this : IBackgroundCopyJob3*, pVal : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pVal)
    end
    def get_type(this : IBackgroundCopyJob3*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyJob3*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_times(this : IBackgroundCopyJob3*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_times.call(this, pVal)
    end
    def get_state(this : IBackgroundCopyJob3*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pVal)
    end
    def get_error(this : IBackgroundCopyJob3*, ppError : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error.call(this, ppError)
    end
    def get_owner(this : IBackgroundCopyJob3*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, pVal)
    end
    def set_display_name(this : IBackgroundCopyJob3*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_name.call(this, val)
    end
    def get_display_name(this : IBackgroundCopyJob3*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pVal)
    end
    def set_description(this : IBackgroundCopyJob3*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, val)
    end
    def get_description(this : IBackgroundCopyJob3*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pVal)
    end
    def set_priority(this : IBackgroundCopyJob3*, val : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, val)
    end
    def get_priority(this : IBackgroundCopyJob3*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pVal)
    end
    def set_notify_flags(this : IBackgroundCopyJob3*, val : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_flags.call(this, val)
    end
    def get_notify_flags(this : IBackgroundCopyJob3*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_flags.call(this, pVal)
    end
    def set_notify_interface(this : IBackgroundCopyJob3*, val : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_interface.call(this, val)
    end
    def get_notify_interface(this : IBackgroundCopyJob3*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_interface.call(this, pVal)
    end
    def set_minimum_retry_delay(this : IBackgroundCopyJob3*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_minimum_retry_delay.call(this, seconds)
    end
    def get_minimum_retry_delay(this : IBackgroundCopyJob3*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_minimum_retry_delay.call(this, seconds)
    end
    def set_no_progress_timeout(this : IBackgroundCopyJob3*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_no_progress_timeout.call(this, seconds)
    end
    def get_no_progress_timeout(this : IBackgroundCopyJob3*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_no_progress_timeout.call(this, seconds)
    end
    def get_error_count(this : IBackgroundCopyJob3*, errors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_count.call(this, errors)
    end
    def set_proxy_settings(this : IBackgroundCopyJob3*, proxy_usage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, proxy_list : Win32cr::Foundation::PWSTR, proxy_bypass_list : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_settings.call(this, proxy_usage, proxy_list, proxy_bypass_list)
    end
    def get_proxy_settings(this : IBackgroundCopyJob3*, pProxyUsage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, pProxyList : Win32cr::Foundation::PWSTR*, pProxyBypassList : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_settings.call(this, pProxyUsage, pProxyList, pProxyBypassList)
    end
    def take_ownership(this : IBackgroundCopyJob3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this)
    end
    def set_notify_cmd_line(this : IBackgroundCopyJob3*, program : Win32cr::Foundation::PWSTR, parameters : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_cmd_line.call(this, program, parameters)
    end
    def get_notify_cmd_line(this : IBackgroundCopyJob3*, pProgram : Win32cr::Foundation::PWSTR*, pParameters : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_cmd_line.call(this, pProgram, pParameters)
    end
    def get_reply_progress(this : IBackgroundCopyJob3*, pProgress : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_progress.call(this, pProgress)
    end
    def get_reply_data(this : IBackgroundCopyJob3*, ppBuffer : UInt8**, pLength : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_data.call(this, ppBuffer, pLength)
    end
    def set_reply_file_name(this : IBackgroundCopyJob3*, reply_file_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_reply_file_name.call(this, reply_file_name)
    end
    def get_reply_file_name(this : IBackgroundCopyJob3*, pReplyFileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_file_name.call(this, pReplyFileName)
    end
    def set_credentials(this : IBackgroundCopyJob3*, credentials : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, credentials)
    end
    def remove_credentials(this : IBackgroundCopyJob3*, target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, scheme : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_credentials.call(this, target, scheme)
    end
    def replace_remote_prefix(this : IBackgroundCopyJob3*, old_prefix : Win32cr::Foundation::PWSTR, new_prefix : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace_remote_prefix.call(this, old_prefix, new_prefix)
    end
    def add_file_with_ranges(this : IBackgroundCopyJob3*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR, range_count : UInt32, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_with_ranges.call(this, remote_url, local_name, range_count, ranges)
    end
    def set_file_acl_flags(this : IBackgroundCopyJob3*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_acl_flags.call(this, flags)
    end
    def get_file_acl_flags(this : IBackgroundCopyJob3*, flags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_acl_flags.call(this, flags)
    end

  end

  @[Extern]
  record IBackgroundCopyFile2Vtbl,
    query_interface : Proc(IBackgroundCopyFile2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyFile2*, UInt32),
    release : Proc(IBackgroundCopyFile2*, UInt32),
    get_remote_name : Proc(IBackgroundCopyFile2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_name : Proc(IBackgroundCopyFile2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyFile2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_file_ranges : Proc(IBackgroundCopyFile2*, UInt32*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**, Win32cr::Foundation::HRESULT),
    set_remote_name : Proc(IBackgroundCopyFile2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyFile2, lpVtbl : IBackgroundCopyFile2Vtbl* do
    GUID = LibC::GUID.new(0x83e81b93_u32, 0x873_u16, 0x474d_u16, StaticArray[0x8a_u8, 0x8c_u8, 0xf2_u8, 0x1_u8, 0x8b_u8, 0x1a_u8, 0x93_u8, 0x9c_u8])
    def query_interface(this : IBackgroundCopyFile2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyFile2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyFile2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_remote_name(this : IBackgroundCopyFile2*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_name.call(this, pVal)
    end
    def get_local_name(this : IBackgroundCopyFile2*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_name.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyFile2*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_file_ranges(this : IBackgroundCopyFile2*, range_count : UInt32*, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_ranges.call(this, range_count, ranges)
    end
    def set_remote_name(this : IBackgroundCopyFile2*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_name.call(this, val)
    end

  end

  @[Extern]
  record IBackgroundCopyJobHttpOptionsVtbl,
    query_interface : Proc(IBackgroundCopyJobHttpOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJobHttpOptions*, UInt32),
    release : Proc(IBackgroundCopyJobHttpOptions*, UInt32),
    set_client_certificate_by_id : Proc(IBackgroundCopyJobHttpOptions*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, Win32cr::Foundation::PWSTR, UInt8*, Win32cr::Foundation::HRESULT),
    set_client_certificate_by_name : Proc(IBackgroundCopyJobHttpOptions*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    remove_client_certificate : Proc(IBackgroundCopyJobHttpOptions*, Win32cr::Foundation::HRESULT),
    get_client_certificate : Proc(IBackgroundCopyJobHttpOptions*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION*, Win32cr::Foundation::PWSTR*, UInt8**, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_custom_headers : Proc(IBackgroundCopyJobHttpOptions*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_custom_headers : Proc(IBackgroundCopyJobHttpOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_security_flags : Proc(IBackgroundCopyJobHttpOptions*, UInt32, Win32cr::Foundation::HRESULT),
    get_security_flags : Proc(IBackgroundCopyJobHttpOptions*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJobHttpOptions, lpVtbl : IBackgroundCopyJobHttpOptionsVtbl* do
    GUID = LibC::GUID.new(0xf1bd1079_u32, 0x9f01_u16, 0x4bdc_u16, StaticArray[0x80_u8, 0x36_u8, 0xf0_u8, 0x9b_u8, 0x70_u8, 0x9_u8, 0x50_u8, 0x66_u8])
    def query_interface(this : IBackgroundCopyJobHttpOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJobHttpOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJobHttpOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_client_certificate_by_id(this : IBackgroundCopyJobHttpOptions*, store_location : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, store_name : Win32cr::Foundation::PWSTR, pCertHashBlob : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_by_id.call(this, store_location, store_name, pCertHashBlob)
    end
    def set_client_certificate_by_name(this : IBackgroundCopyJobHttpOptions*, store_location : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, store_name : Win32cr::Foundation::PWSTR, subject_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_by_name.call(this, store_location, store_name, subject_name)
    end
    def remove_client_certificate(this : IBackgroundCopyJobHttpOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_client_certificate.call(this)
    end
    def get_client_certificate(this : IBackgroundCopyJobHttpOptions*, pStoreLocation : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION*, pStoreName : Win32cr::Foundation::PWSTR*, ppCertHashBlob : UInt8**, pSubjectName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_certificate.call(this, pStoreLocation, pStoreName, ppCertHashBlob, pSubjectName)
    end
    def set_custom_headers(this : IBackgroundCopyJobHttpOptions*, request_headers : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_custom_headers.call(this, request_headers)
    end
    def get_custom_headers(this : IBackgroundCopyJobHttpOptions*, pRequestHeaders : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_headers.call(this, pRequestHeaders)
    end
    def set_security_flags(this : IBackgroundCopyJobHttpOptions*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_flags.call(this, flags)
    end
    def get_security_flags(this : IBackgroundCopyJobHttpOptions*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_flags.call(this, pFlags)
    end

  end

  @[Extern]
  record IBitsPeerCacheRecordVtbl,
    query_interface : Proc(IBitsPeerCacheRecord*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBitsPeerCacheRecord*, UInt32),
    release : Proc(IBitsPeerCacheRecord*, UInt32),
    get_id : Proc(IBitsPeerCacheRecord*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_origin_url : Proc(IBitsPeerCacheRecord*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_file_size : Proc(IBitsPeerCacheRecord*, UInt64*, Win32cr::Foundation::HRESULT),
    get_file_modification_time : Proc(IBitsPeerCacheRecord*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_last_access_time : Proc(IBitsPeerCacheRecord*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    is_file_validated : Proc(IBitsPeerCacheRecord*, Win32cr::Foundation::HRESULT),
    get_file_ranges : Proc(IBitsPeerCacheRecord*, UInt32*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBitsPeerCacheRecord, lpVtbl : IBitsPeerCacheRecordVtbl* do
    GUID = LibC::GUID.new(0x659cdeaf_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IBitsPeerCacheRecord*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBitsPeerCacheRecord*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBitsPeerCacheRecord*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id(this : IBitsPeerCacheRecord*, pVal : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pVal)
    end
    def get_origin_url(this : IBitsPeerCacheRecord*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_origin_url.call(this, pVal)
    end
    def get_file_size(this : IBitsPeerCacheRecord*, pVal : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, pVal)
    end
    def get_file_modification_time(this : IBitsPeerCacheRecord*, pVal : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_modification_time.call(this, pVal)
    end
    def get_last_access_time(this : IBitsPeerCacheRecord*, pVal : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_access_time.call(this, pVal)
    end
    def is_file_validated(this : IBitsPeerCacheRecord*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_file_validated.call(this)
    end
    def get_file_ranges(this : IBitsPeerCacheRecord*, pRangeCount : UInt32*, ppRanges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_ranges.call(this, pRangeCount, ppRanges)
    end

  end

  @[Extern]
  record IEnumBitsPeerCacheRecordsVtbl,
    query_interface : Proc(IEnumBitsPeerCacheRecords*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumBitsPeerCacheRecords*, UInt32),
    release : Proc(IEnumBitsPeerCacheRecords*, UInt32),
    next__ : Proc(IEnumBitsPeerCacheRecords*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumBitsPeerCacheRecords*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumBitsPeerCacheRecords*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumBitsPeerCacheRecords*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IEnumBitsPeerCacheRecords*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumBitsPeerCacheRecords, lpVtbl : IEnumBitsPeerCacheRecordsVtbl* do
    GUID = LibC::GUID.new(0x659cdea4_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IEnumBitsPeerCacheRecords*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumBitsPeerCacheRecords*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumBitsPeerCacheRecords*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumBitsPeerCacheRecords*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumBitsPeerCacheRecords*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumBitsPeerCacheRecords*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumBitsPeerCacheRecords*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end
    def get_count(this : IEnumBitsPeerCacheRecords*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end

  end

  @[Extern]
  record IBitsPeerVtbl,
    query_interface : Proc(IBitsPeer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBitsPeer*, UInt32),
    release : Proc(IBitsPeer*, UInt32),
    get_peer_name : Proc(IBitsPeer*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_authenticated : Proc(IBitsPeer*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_available : Proc(IBitsPeer*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBitsPeer, lpVtbl : IBitsPeerVtbl* do
    GUID = LibC::GUID.new(0x659cdea2_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IBitsPeer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBitsPeer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBitsPeer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_peer_name(this : IBitsPeer*, pName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peer_name.call(this, pName)
    end
    def is_authenticated(this : IBitsPeer*, pAuth : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_authenticated.call(this, pAuth)
    end
    def is_available(this : IBitsPeer*, pOnline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_available.call(this, pOnline)
    end

  end

  @[Extern]
  record IEnumBitsPeersVtbl,
    query_interface : Proc(IEnumBitsPeers*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumBitsPeers*, UInt32),
    release : Proc(IEnumBitsPeers*, UInt32),
    next__ : Proc(IEnumBitsPeers*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumBitsPeers*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumBitsPeers*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumBitsPeers*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IEnumBitsPeers*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumBitsPeers, lpVtbl : IEnumBitsPeersVtbl* do
    GUID = LibC::GUID.new(0x659cdea5_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IEnumBitsPeers*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumBitsPeers*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumBitsPeers*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumBitsPeers*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumBitsPeers*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumBitsPeers*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumBitsPeers*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end
    def get_count(this : IEnumBitsPeers*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end

  end

  @[Extern]
  record IBitsPeerCacheAdministrationVtbl,
    query_interface : Proc(IBitsPeerCacheAdministration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBitsPeerCacheAdministration*, UInt32),
    release : Proc(IBitsPeerCacheAdministration*, UInt32),
    get_maximum_cache_size : Proc(IBitsPeerCacheAdministration*, UInt32*, Win32cr::Foundation::HRESULT),
    set_maximum_cache_size : Proc(IBitsPeerCacheAdministration*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_content_age : Proc(IBitsPeerCacheAdministration*, UInt32*, Win32cr::Foundation::HRESULT),
    set_maximum_content_age : Proc(IBitsPeerCacheAdministration*, UInt32, Win32cr::Foundation::HRESULT),
    get_configuration_flags : Proc(IBitsPeerCacheAdministration*, UInt32*, Win32cr::Foundation::HRESULT),
    set_configuration_flags : Proc(IBitsPeerCacheAdministration*, UInt32, Win32cr::Foundation::HRESULT),
    enum_records : Proc(IBitsPeerCacheAdministration*, Void**, Win32cr::Foundation::HRESULT),
    get_record : Proc(IBitsPeerCacheAdministration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    clear_records : Proc(IBitsPeerCacheAdministration*, Win32cr::Foundation::HRESULT),
    delete_record : Proc(IBitsPeerCacheAdministration*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    delete_url : Proc(IBitsPeerCacheAdministration*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_peers : Proc(IBitsPeerCacheAdministration*, Void**, Win32cr::Foundation::HRESULT),
    clear_peers : Proc(IBitsPeerCacheAdministration*, Win32cr::Foundation::HRESULT),
    discover_peers : Proc(IBitsPeerCacheAdministration*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBitsPeerCacheAdministration, lpVtbl : IBitsPeerCacheAdministrationVtbl* do
    GUID = LibC::GUID.new(0x659cdead_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IBitsPeerCacheAdministration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBitsPeerCacheAdministration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBitsPeerCacheAdministration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_maximum_cache_size(this : IBitsPeerCacheAdministration*, pBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_cache_size.call(this, pBytes)
    end
    def set_maximum_cache_size(this : IBitsPeerCacheAdministration*, bytes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_cache_size.call(this, bytes)
    end
    def get_maximum_content_age(this : IBitsPeerCacheAdministration*, pSeconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_content_age.call(this, pSeconds)
    end
    def set_maximum_content_age(this : IBitsPeerCacheAdministration*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_content_age.call(this, seconds)
    end
    def get_configuration_flags(this : IBitsPeerCacheAdministration*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_configuration_flags.call(this, pFlags)
    end
    def set_configuration_flags(this : IBitsPeerCacheAdministration*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_configuration_flags.call(this, flags)
    end
    def enum_records(this : IBitsPeerCacheAdministration*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_records.call(this, ppEnum)
    end
    def get_record(this : IBitsPeerCacheAdministration*, id : LibC::GUID*, ppRecord : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_record.call(this, id, ppRecord)
    end
    def clear_records(this : IBitsPeerCacheAdministration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_records.call(this)
    end
    def delete_record(this : IBitsPeerCacheAdministration*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_record.call(this, id)
    end
    def delete_url(this : IBitsPeerCacheAdministration*, url : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_url.call(this, url)
    end
    def enum_peers(this : IBitsPeerCacheAdministration*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_peers.call(this, ppEnum)
    end
    def clear_peers(this : IBitsPeerCacheAdministration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_peers.call(this)
    end
    def discover_peers(this : IBitsPeerCacheAdministration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discover_peers.call(this)
    end

  end

  @[Extern]
  record IBackgroundCopyJob4Vtbl,
    query_interface : Proc(IBackgroundCopyJob4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJob4*, UInt32),
    release : Proc(IBackgroundCopyJob4*, UInt32),
    add_file_set : Proc(IBackgroundCopyJob4*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*, Win32cr::Foundation::HRESULT),
    add_file : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_files : Proc(IBackgroundCopyJob4*, Void**, Win32cr::Foundation::HRESULT),
    suspend : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::HRESULT),
    resume : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::HRESULT),
    complete : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::HRESULT),
    get_id : Proc(IBackgroundCopyJob4*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_times : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*, Win32cr::Foundation::HRESULT),
    get_error : Proc(IBackgroundCopyJob4*, Void**, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_display_name : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*, Win32cr::Foundation::HRESULT),
    set_notify_flags : Proc(IBackgroundCopyJob4*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_flags : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT),
    set_notify_interface : Proc(IBackgroundCopyJob4*, Void*, Win32cr::Foundation::HRESULT),
    get_notify_interface : Proc(IBackgroundCopyJob4*, Void**, Win32cr::Foundation::HRESULT),
    set_minimum_retry_delay : Proc(IBackgroundCopyJob4*, UInt32, Win32cr::Foundation::HRESULT),
    get_minimum_retry_delay : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT),
    set_no_progress_timeout : Proc(IBackgroundCopyJob4*, UInt32, Win32cr::Foundation::HRESULT),
    get_no_progress_timeout : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_error_count : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_settings : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_settings : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::HRESULT),
    set_notify_cmd_line : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_notify_cmd_line : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_reply_progress : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_reply_data : Proc(IBackgroundCopyJob4*, UInt8**, UInt64*, Win32cr::Foundation::HRESULT),
    set_reply_file_name : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_reply_file_name : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*, Win32cr::Foundation::HRESULT),
    remove_credentials : Proc(IBackgroundCopyJob4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME, Win32cr::Foundation::HRESULT),
    replace_remote_prefix : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_file_with_ranges : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*, Win32cr::Foundation::HRESULT),
    set_file_acl_flags : Proc(IBackgroundCopyJob4*, UInt32, Win32cr::Foundation::HRESULT),
    get_file_acl_flags : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT),
    set_peer_caching_flags : Proc(IBackgroundCopyJob4*, UInt32, Win32cr::Foundation::HRESULT),
    get_peer_caching_flags : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_owner_integrity_level : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_owner_elevation_state : Proc(IBackgroundCopyJob4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_maximum_download_time : Proc(IBackgroundCopyJob4*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_download_time : Proc(IBackgroundCopyJob4*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJob4, lpVtbl : IBackgroundCopyJob4Vtbl* do
    GUID = LibC::GUID.new(0x659cdeae_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IBackgroundCopyJob4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJob4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJob4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_file_set(this : IBackgroundCopyJob4*, cFileCount : UInt32, pFileSet : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_set.call(this, cFileCount, pFileSet)
    end
    def add_file(this : IBackgroundCopyJob4*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file.call(this, remote_url, local_name)
    end
    def enum_files(this : IBackgroundCopyJob4*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_files.call(this, pEnum)
    end
    def suspend(this : IBackgroundCopyJob4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this)
    end
    def resume(this : IBackgroundCopyJob4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def cancel(this : IBackgroundCopyJob4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def complete(this : IBackgroundCopyJob4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete.call(this)
    end
    def get_id(this : IBackgroundCopyJob4*, pVal : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pVal)
    end
    def get_type(this : IBackgroundCopyJob4*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyJob4*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_times(this : IBackgroundCopyJob4*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_times.call(this, pVal)
    end
    def get_state(this : IBackgroundCopyJob4*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pVal)
    end
    def get_error(this : IBackgroundCopyJob4*, ppError : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error.call(this, ppError)
    end
    def get_owner(this : IBackgroundCopyJob4*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, pVal)
    end
    def set_display_name(this : IBackgroundCopyJob4*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_name.call(this, val)
    end
    def get_display_name(this : IBackgroundCopyJob4*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pVal)
    end
    def set_description(this : IBackgroundCopyJob4*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, val)
    end
    def get_description(this : IBackgroundCopyJob4*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pVal)
    end
    def set_priority(this : IBackgroundCopyJob4*, val : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, val)
    end
    def get_priority(this : IBackgroundCopyJob4*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pVal)
    end
    def set_notify_flags(this : IBackgroundCopyJob4*, val : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_flags.call(this, val)
    end
    def get_notify_flags(this : IBackgroundCopyJob4*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_flags.call(this, pVal)
    end
    def set_notify_interface(this : IBackgroundCopyJob4*, val : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_interface.call(this, val)
    end
    def get_notify_interface(this : IBackgroundCopyJob4*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_interface.call(this, pVal)
    end
    def set_minimum_retry_delay(this : IBackgroundCopyJob4*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_minimum_retry_delay.call(this, seconds)
    end
    def get_minimum_retry_delay(this : IBackgroundCopyJob4*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_minimum_retry_delay.call(this, seconds)
    end
    def set_no_progress_timeout(this : IBackgroundCopyJob4*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_no_progress_timeout.call(this, seconds)
    end
    def get_no_progress_timeout(this : IBackgroundCopyJob4*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_no_progress_timeout.call(this, seconds)
    end
    def get_error_count(this : IBackgroundCopyJob4*, errors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_count.call(this, errors)
    end
    def set_proxy_settings(this : IBackgroundCopyJob4*, proxy_usage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, proxy_list : Win32cr::Foundation::PWSTR, proxy_bypass_list : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_settings.call(this, proxy_usage, proxy_list, proxy_bypass_list)
    end
    def get_proxy_settings(this : IBackgroundCopyJob4*, pProxyUsage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, pProxyList : Win32cr::Foundation::PWSTR*, pProxyBypassList : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_settings.call(this, pProxyUsage, pProxyList, pProxyBypassList)
    end
    def take_ownership(this : IBackgroundCopyJob4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this)
    end
    def set_notify_cmd_line(this : IBackgroundCopyJob4*, program : Win32cr::Foundation::PWSTR, parameters : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_cmd_line.call(this, program, parameters)
    end
    def get_notify_cmd_line(this : IBackgroundCopyJob4*, pProgram : Win32cr::Foundation::PWSTR*, pParameters : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_cmd_line.call(this, pProgram, pParameters)
    end
    def get_reply_progress(this : IBackgroundCopyJob4*, pProgress : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_progress.call(this, pProgress)
    end
    def get_reply_data(this : IBackgroundCopyJob4*, ppBuffer : UInt8**, pLength : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_data.call(this, ppBuffer, pLength)
    end
    def set_reply_file_name(this : IBackgroundCopyJob4*, reply_file_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_reply_file_name.call(this, reply_file_name)
    end
    def get_reply_file_name(this : IBackgroundCopyJob4*, pReplyFileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_file_name.call(this, pReplyFileName)
    end
    def set_credentials(this : IBackgroundCopyJob4*, credentials : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, credentials)
    end
    def remove_credentials(this : IBackgroundCopyJob4*, target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, scheme : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_credentials.call(this, target, scheme)
    end
    def replace_remote_prefix(this : IBackgroundCopyJob4*, old_prefix : Win32cr::Foundation::PWSTR, new_prefix : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace_remote_prefix.call(this, old_prefix, new_prefix)
    end
    def add_file_with_ranges(this : IBackgroundCopyJob4*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR, range_count : UInt32, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_with_ranges.call(this, remote_url, local_name, range_count, ranges)
    end
    def set_file_acl_flags(this : IBackgroundCopyJob4*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_acl_flags.call(this, flags)
    end
    def get_file_acl_flags(this : IBackgroundCopyJob4*, flags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_acl_flags.call(this, flags)
    end
    def set_peer_caching_flags(this : IBackgroundCopyJob4*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_peer_caching_flags.call(this, flags)
    end
    def get_peer_caching_flags(this : IBackgroundCopyJob4*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peer_caching_flags.call(this, pFlags)
    end
    def get_owner_integrity_level(this : IBackgroundCopyJob4*, pLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_integrity_level.call(this, pLevel)
    end
    def get_owner_elevation_state(this : IBackgroundCopyJob4*, pElevated : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_elevation_state.call(this, pElevated)
    end
    def set_maximum_download_time(this : IBackgroundCopyJob4*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_download_time.call(this, timeout)
    end
    def get_maximum_download_time(this : IBackgroundCopyJob4*, pTimeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_download_time.call(this, pTimeout)
    end

  end

  @[Extern]
  record IBackgroundCopyFile3Vtbl,
    query_interface : Proc(IBackgroundCopyFile3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyFile3*, UInt32),
    release : Proc(IBackgroundCopyFile3*, UInt32),
    get_remote_name : Proc(IBackgroundCopyFile3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_name : Proc(IBackgroundCopyFile3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyFile3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_file_ranges : Proc(IBackgroundCopyFile3*, UInt32*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**, Win32cr::Foundation::HRESULT),
    set_remote_name : Proc(IBackgroundCopyFile3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_temporary_name : Proc(IBackgroundCopyFile3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_validation_state : Proc(IBackgroundCopyFile3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_validation_state : Proc(IBackgroundCopyFile3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_downloaded_from_peer : Proc(IBackgroundCopyFile3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyFile3, lpVtbl : IBackgroundCopyFile3Vtbl* do
    GUID = LibC::GUID.new(0x659cdeaa_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IBackgroundCopyFile3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyFile3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyFile3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_remote_name(this : IBackgroundCopyFile3*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_name.call(this, pVal)
    end
    def get_local_name(this : IBackgroundCopyFile3*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_name.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyFile3*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_file_ranges(this : IBackgroundCopyFile3*, range_count : UInt32*, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_ranges.call(this, range_count, ranges)
    end
    def set_remote_name(this : IBackgroundCopyFile3*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_name.call(this, val)
    end
    def get_temporary_name(this : IBackgroundCopyFile3*, pFilename : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_temporary_name.call(this, pFilename)
    end
    def set_validation_state(this : IBackgroundCopyFile3*, state : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_validation_state.call(this, state)
    end
    def get_validation_state(this : IBackgroundCopyFile3*, pState : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_validation_state.call(this, pState)
    end
    def is_downloaded_from_peer(this : IBackgroundCopyFile3*, pVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_downloaded_from_peer.call(this, pVal)
    end

  end

  @[Extern]
  record IBackgroundCopyCallback2Vtbl,
    query_interface : Proc(IBackgroundCopyCallback2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyCallback2*, UInt32),
    release : Proc(IBackgroundCopyCallback2*, UInt32),
    job_transferred : Proc(IBackgroundCopyCallback2*, Void*, Win32cr::Foundation::HRESULT),
    job_error : Proc(IBackgroundCopyCallback2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    job_modification : Proc(IBackgroundCopyCallback2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    file_transferred : Proc(IBackgroundCopyCallback2*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyCallback2, lpVtbl : IBackgroundCopyCallback2Vtbl* do
    GUID = LibC::GUID.new(0x659cdeac_u32, 0x489e_u16, 0x11d9_u16, StaticArray[0xa9_u8, 0xcd_u8, 0x0_u8, 0xd_u8, 0x56_u8, 0x96_u8, 0x52_u8, 0x51_u8])
    def query_interface(this : IBackgroundCopyCallback2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyCallback2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyCallback2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def job_transferred(this : IBackgroundCopyCallback2*, pJob : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_transferred.call(this, pJob)
    end
    def job_error(this : IBackgroundCopyCallback2*, pJob : Void*, pError : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_error.call(this, pJob, pError)
    end
    def job_modification(this : IBackgroundCopyCallback2*, pJob : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_modification.call(this, pJob, dwReserved)
    end
    def file_transferred(this : IBackgroundCopyCallback2*, pJob : Void*, pFile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.file_transferred.call(this, pJob, pFile)
    end

  end

  @[Extern]
  record IBitsTokenOptionsVtbl,
    query_interface : Proc(IBitsTokenOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBitsTokenOptions*, UInt32),
    release : Proc(IBitsTokenOptions*, UInt32),
    set_helper_token_flags : Proc(IBitsTokenOptions*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_TOKEN, Win32cr::Foundation::HRESULT),
    get_helper_token_flags : Proc(IBitsTokenOptions*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_TOKEN*, Win32cr::Foundation::HRESULT),
    set_helper_token : Proc(IBitsTokenOptions*, Win32cr::Foundation::HRESULT),
    clear_helper_token : Proc(IBitsTokenOptions*, Win32cr::Foundation::HRESULT),
    get_helper_token_sid : Proc(IBitsTokenOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBitsTokenOptions, lpVtbl : IBitsTokenOptionsVtbl* do
    GUID = LibC::GUID.new(0x9a2584c3_u32, 0xf7d2_u16, 0x457a_u16, StaticArray[0x9a_u8, 0x5e_u8, 0x22_u8, 0xb6_u8, 0x7b_u8, 0xff_u8, 0xc7_u8, 0xd2_u8])
    def query_interface(this : IBitsTokenOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBitsTokenOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBitsTokenOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_helper_token_flags(this : IBitsTokenOptions*, usage_flags : Win32cr::Networking::BackgroundIntelligentTransferService::BG_TOKEN) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_helper_token_flags.call(this, usage_flags)
    end
    def get_helper_token_flags(this : IBitsTokenOptions*, pFlags : Win32cr::Networking::BackgroundIntelligentTransferService::BG_TOKEN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_helper_token_flags.call(this, pFlags)
    end
    def set_helper_token(this : IBitsTokenOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_helper_token.call(this)
    end
    def clear_helper_token(this : IBitsTokenOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_helper_token.call(this)
    end
    def get_helper_token_sid(this : IBitsTokenOptions*, pSid : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_helper_token_sid.call(this, pSid)
    end

  end

  @[Extern]
  record IBackgroundCopyFile4Vtbl,
    query_interface : Proc(IBackgroundCopyFile4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyFile4*, UInt32),
    release : Proc(IBackgroundCopyFile4*, UInt32),
    get_remote_name : Proc(IBackgroundCopyFile4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_name : Proc(IBackgroundCopyFile4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyFile4*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_file_ranges : Proc(IBackgroundCopyFile4*, UInt32*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**, Win32cr::Foundation::HRESULT),
    set_remote_name : Proc(IBackgroundCopyFile4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_temporary_name : Proc(IBackgroundCopyFile4*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_validation_state : Proc(IBackgroundCopyFile4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_validation_state : Proc(IBackgroundCopyFile4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_downloaded_from_peer : Proc(IBackgroundCopyFile4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_peer_download_stats : Proc(IBackgroundCopyFile4*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyFile4, lpVtbl : IBackgroundCopyFile4Vtbl* do
    GUID = LibC::GUID.new(0xef7e0655_u32, 0x7888_u16, 0x4960_u16, StaticArray[0xb0_u8, 0xe5_u8, 0x73_u8, 0x8_u8, 0x46_u8, 0xe0_u8, 0x34_u8, 0x92_u8])
    def query_interface(this : IBackgroundCopyFile4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyFile4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyFile4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_remote_name(this : IBackgroundCopyFile4*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_name.call(this, pVal)
    end
    def get_local_name(this : IBackgroundCopyFile4*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_name.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyFile4*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_file_ranges(this : IBackgroundCopyFile4*, range_count : UInt32*, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_ranges.call(this, range_count, ranges)
    end
    def set_remote_name(this : IBackgroundCopyFile4*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_name.call(this, val)
    end
    def get_temporary_name(this : IBackgroundCopyFile4*, pFilename : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_temporary_name.call(this, pFilename)
    end
    def set_validation_state(this : IBackgroundCopyFile4*, state : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_validation_state.call(this, state)
    end
    def get_validation_state(this : IBackgroundCopyFile4*, pState : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_validation_state.call(this, pState)
    end
    def is_downloaded_from_peer(this : IBackgroundCopyFile4*, pVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_downloaded_from_peer.call(this, pVal)
    end
    def get_peer_download_stats(this : IBackgroundCopyFile4*, pFromOrigin : UInt64*, pFromPeers : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peer_download_stats.call(this, pFromOrigin, pFromPeers)
    end

  end

  @[Extern]
  record IBackgroundCopyJob5Vtbl,
    query_interface : Proc(IBackgroundCopyJob5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJob5*, UInt32),
    release : Proc(IBackgroundCopyJob5*, UInt32),
    add_file_set : Proc(IBackgroundCopyJob5*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*, Win32cr::Foundation::HRESULT),
    add_file : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_files : Proc(IBackgroundCopyJob5*, Void**, Win32cr::Foundation::HRESULT),
    suspend : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::HRESULT),
    resume : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::HRESULT),
    complete : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::HRESULT),
    get_id : Proc(IBackgroundCopyJob5*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_times : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*, Win32cr::Foundation::HRESULT),
    get_error : Proc(IBackgroundCopyJob5*, Void**, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_display_name : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*, Win32cr::Foundation::HRESULT),
    set_notify_flags : Proc(IBackgroundCopyJob5*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_flags : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    set_notify_interface : Proc(IBackgroundCopyJob5*, Void*, Win32cr::Foundation::HRESULT),
    get_notify_interface : Proc(IBackgroundCopyJob5*, Void**, Win32cr::Foundation::HRESULT),
    set_minimum_retry_delay : Proc(IBackgroundCopyJob5*, UInt32, Win32cr::Foundation::HRESULT),
    get_minimum_retry_delay : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    set_no_progress_timeout : Proc(IBackgroundCopyJob5*, UInt32, Win32cr::Foundation::HRESULT),
    get_no_progress_timeout : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    get_error_count : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_settings : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_settings : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::HRESULT),
    set_notify_cmd_line : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_notify_cmd_line : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_reply_progress : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_reply_data : Proc(IBackgroundCopyJob5*, UInt8**, UInt64*, Win32cr::Foundation::HRESULT),
    set_reply_file_name : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_reply_file_name : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*, Win32cr::Foundation::HRESULT),
    remove_credentials : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME, Win32cr::Foundation::HRESULT),
    replace_remote_prefix : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_file_with_ranges : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*, Win32cr::Foundation::HRESULT),
    set_file_acl_flags : Proc(IBackgroundCopyJob5*, UInt32, Win32cr::Foundation::HRESULT),
    get_file_acl_flags : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    set_peer_caching_flags : Proc(IBackgroundCopyJob5*, UInt32, Win32cr::Foundation::HRESULT),
    get_peer_caching_flags : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    get_owner_integrity_level : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    get_owner_elevation_state : Proc(IBackgroundCopyJob5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_maximum_download_time : Proc(IBackgroundCopyJob5*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_download_time : Proc(IBackgroundCopyJob5*, UInt32*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_ID, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_VALUE, Win32cr::Foundation::HRESULT),
    get_property : Proc(IBackgroundCopyJob5*, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_ID, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_VALUE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJob5, lpVtbl : IBackgroundCopyJob5Vtbl* do
    GUID = LibC::GUID.new(0xe847030c_u32, 0xbbba_u16, 0x4657_u16, StaticArray[0xaf_u8, 0x6d_u8, 0x48_u8, 0x4a_u8, 0xa4_u8, 0x2b_u8, 0xf1_u8, 0xfe_u8])
    def query_interface(this : IBackgroundCopyJob5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJob5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJob5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_file_set(this : IBackgroundCopyJob5*, cFileCount : UInt32, pFileSet : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_set.call(this, cFileCount, pFileSet)
    end
    def add_file(this : IBackgroundCopyJob5*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file.call(this, remote_url, local_name)
    end
    def enum_files(this : IBackgroundCopyJob5*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_files.call(this, pEnum)
    end
    def suspend(this : IBackgroundCopyJob5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this)
    end
    def resume(this : IBackgroundCopyJob5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def cancel(this : IBackgroundCopyJob5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def complete(this : IBackgroundCopyJob5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete.call(this)
    end
    def get_id(this : IBackgroundCopyJob5*, pVal : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pVal)
    end
    def get_type(this : IBackgroundCopyJob5*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyJob5*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_times(this : IBackgroundCopyJob5*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_TIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_times.call(this, pVal)
    end
    def get_state(this : IBackgroundCopyJob5*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pVal)
    end
    def get_error(this : IBackgroundCopyJob5*, ppError : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error.call(this, ppError)
    end
    def get_owner(this : IBackgroundCopyJob5*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, pVal)
    end
    def set_display_name(this : IBackgroundCopyJob5*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_name.call(this, val)
    end
    def get_display_name(this : IBackgroundCopyJob5*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pVal)
    end
    def set_description(this : IBackgroundCopyJob5*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, val)
    end
    def get_description(this : IBackgroundCopyJob5*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pVal)
    end
    def set_priority(this : IBackgroundCopyJob5*, val : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, val)
    end
    def get_priority(this : IBackgroundCopyJob5*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pVal)
    end
    def set_notify_flags(this : IBackgroundCopyJob5*, val : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_flags.call(this, val)
    end
    def get_notify_flags(this : IBackgroundCopyJob5*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_flags.call(this, pVal)
    end
    def set_notify_interface(this : IBackgroundCopyJob5*, val : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_interface.call(this, val)
    end
    def get_notify_interface(this : IBackgroundCopyJob5*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_interface.call(this, pVal)
    end
    def set_minimum_retry_delay(this : IBackgroundCopyJob5*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_minimum_retry_delay.call(this, seconds)
    end
    def get_minimum_retry_delay(this : IBackgroundCopyJob5*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_minimum_retry_delay.call(this, seconds)
    end
    def set_no_progress_timeout(this : IBackgroundCopyJob5*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_no_progress_timeout.call(this, seconds)
    end
    def get_no_progress_timeout(this : IBackgroundCopyJob5*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_no_progress_timeout.call(this, seconds)
    end
    def get_error_count(this : IBackgroundCopyJob5*, errors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_count.call(this, errors)
    end
    def set_proxy_settings(this : IBackgroundCopyJob5*, proxy_usage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE, proxy_list : Win32cr::Foundation::PWSTR, proxy_bypass_list : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_settings.call(this, proxy_usage, proxy_list, proxy_bypass_list)
    end
    def get_proxy_settings(this : IBackgroundCopyJob5*, pProxyUsage : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_PROXY_USAGE*, pProxyList : Win32cr::Foundation::PWSTR*, pProxyBypassList : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_settings.call(this, pProxyUsage, pProxyList, pProxyBypassList)
    end
    def take_ownership(this : IBackgroundCopyJob5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this)
    end
    def set_notify_cmd_line(this : IBackgroundCopyJob5*, program : Win32cr::Foundation::PWSTR, parameters : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_cmd_line.call(this, program, parameters)
    end
    def get_notify_cmd_line(this : IBackgroundCopyJob5*, pProgram : Win32cr::Foundation::PWSTR*, pParameters : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notify_cmd_line.call(this, pProgram, pParameters)
    end
    def get_reply_progress(this : IBackgroundCopyJob5*, pProgress : Win32cr::Networking::BackgroundIntelligentTransferService::BG_JOB_REPLY_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_progress.call(this, pProgress)
    end
    def get_reply_data(this : IBackgroundCopyJob5*, ppBuffer : UInt8**, pLength : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_data.call(this, ppBuffer, pLength)
    end
    def set_reply_file_name(this : IBackgroundCopyJob5*, reply_file_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_reply_file_name.call(this, reply_file_name)
    end
    def get_reply_file_name(this : IBackgroundCopyJob5*, pReplyFileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reply_file_name.call(this, pReplyFileName)
    end
    def set_credentials(this : IBackgroundCopyJob5*, credentials : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_CREDENTIALS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, credentials)
    end
    def remove_credentials(this : IBackgroundCopyJob5*, target : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_TARGET, scheme : Win32cr::Networking::BackgroundIntelligentTransferService::BG_AUTH_SCHEME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_credentials.call(this, target, scheme)
    end
    def replace_remote_prefix(this : IBackgroundCopyJob5*, old_prefix : Win32cr::Foundation::PWSTR, new_prefix : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace_remote_prefix.call(this, old_prefix, new_prefix)
    end
    def add_file_with_ranges(this : IBackgroundCopyJob5*, remote_url : Win32cr::Foundation::PWSTR, local_name : Win32cr::Foundation::PWSTR, range_count : UInt32, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_file_with_ranges.call(this, remote_url, local_name, range_count, ranges)
    end
    def set_file_acl_flags(this : IBackgroundCopyJob5*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_acl_flags.call(this, flags)
    end
    def get_file_acl_flags(this : IBackgroundCopyJob5*, flags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_acl_flags.call(this, flags)
    end
    def set_peer_caching_flags(this : IBackgroundCopyJob5*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_peer_caching_flags.call(this, flags)
    end
    def get_peer_caching_flags(this : IBackgroundCopyJob5*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peer_caching_flags.call(this, pFlags)
    end
    def get_owner_integrity_level(this : IBackgroundCopyJob5*, pLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_integrity_level.call(this, pLevel)
    end
    def get_owner_elevation_state(this : IBackgroundCopyJob5*, pElevated : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_elevation_state.call(this, pElevated)
    end
    def set_maximum_download_time(this : IBackgroundCopyJob5*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_download_time.call(this, timeout)
    end
    def get_maximum_download_time(this : IBackgroundCopyJob5*, pTimeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_download_time.call(this, pTimeout)
    end
    def set_property(this : IBackgroundCopyJob5*, property_id : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_ID, property_value : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_VALUE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, property_id, property_value)
    end
    def get_property(this : IBackgroundCopyJob5*, property_id : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_ID, property_value : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_JOB_PROPERTY_VALUE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, property_id, property_value)
    end

  end

  @[Extern]
  record IBackgroundCopyFile5Vtbl,
    query_interface : Proc(IBackgroundCopyFile5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyFile5*, UInt32),
    release : Proc(IBackgroundCopyFile5*, UInt32),
    get_remote_name : Proc(IBackgroundCopyFile5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_name : Proc(IBackgroundCopyFile5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyFile5*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_file_ranges : Proc(IBackgroundCopyFile5*, UInt32*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**, Win32cr::Foundation::HRESULT),
    set_remote_name : Proc(IBackgroundCopyFile5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_temporary_name : Proc(IBackgroundCopyFile5*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_validation_state : Proc(IBackgroundCopyFile5*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_validation_state : Proc(IBackgroundCopyFile5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_downloaded_from_peer : Proc(IBackgroundCopyFile5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_peer_download_stats : Proc(IBackgroundCopyFile5*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IBackgroundCopyFile5*, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE, Win32cr::Foundation::HRESULT),
    get_property : Proc(IBackgroundCopyFile5*, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyFile5, lpVtbl : IBackgroundCopyFile5Vtbl* do
    GUID = LibC::GUID.new(0x85c1657f_u32, 0xdafc_u16, 0x40e8_u16, StaticArray[0x88_u8, 0x34_u8, 0xdf_u8, 0x18_u8, 0xea_u8, 0x25_u8, 0x71_u8, 0x7e_u8])
    def query_interface(this : IBackgroundCopyFile5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyFile5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyFile5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_remote_name(this : IBackgroundCopyFile5*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_name.call(this, pVal)
    end
    def get_local_name(this : IBackgroundCopyFile5*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_name.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyFile5*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_file_ranges(this : IBackgroundCopyFile5*, range_count : UInt32*, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_ranges.call(this, range_count, ranges)
    end
    def set_remote_name(this : IBackgroundCopyFile5*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_name.call(this, val)
    end
    def get_temporary_name(this : IBackgroundCopyFile5*, pFilename : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_temporary_name.call(this, pFilename)
    end
    def set_validation_state(this : IBackgroundCopyFile5*, state : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_validation_state.call(this, state)
    end
    def get_validation_state(this : IBackgroundCopyFile5*, pState : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_validation_state.call(this, pState)
    end
    def is_downloaded_from_peer(this : IBackgroundCopyFile5*, pVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_downloaded_from_peer.call(this, pVal)
    end
    def get_peer_download_stats(this : IBackgroundCopyFile5*, pFromOrigin : UInt64*, pFromPeers : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peer_download_stats.call(this, pFromOrigin, pFromPeers)
    end
    def set_property(this : IBackgroundCopyFile5*, property_id : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, property_value : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, property_id, property_value)
    end
    def get_property(this : IBackgroundCopyFile5*, property_id : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, property_value : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, property_id, property_value)
    end

  end

  @[Extern]
  record IBackgroundCopyCallback3Vtbl,
    query_interface : Proc(IBackgroundCopyCallback3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyCallback3*, UInt32),
    release : Proc(IBackgroundCopyCallback3*, UInt32),
    job_transferred : Proc(IBackgroundCopyCallback3*, Void*, Win32cr::Foundation::HRESULT),
    job_error : Proc(IBackgroundCopyCallback3*, Void*, Void*, Win32cr::Foundation::HRESULT),
    job_modification : Proc(IBackgroundCopyCallback3*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    file_transferred : Proc(IBackgroundCopyCallback3*, Void*, Void*, Win32cr::Foundation::HRESULT),
    file_ranges_transferred : Proc(IBackgroundCopyCallback3*, Void*, Void*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyCallback3, lpVtbl : IBackgroundCopyCallback3Vtbl* do
    GUID = LibC::GUID.new(0x98c97bd2_u32, 0xe32b_u16, 0x4ad8_u16, StaticArray[0xa5_u8, 0x28_u8, 0x95_u8, 0xfd_u8, 0x8b_u8, 0x16_u8, 0xbd_u8, 0x42_u8])
    def query_interface(this : IBackgroundCopyCallback3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyCallback3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyCallback3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def job_transferred(this : IBackgroundCopyCallback3*, pJob : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_transferred.call(this, pJob)
    end
    def job_error(this : IBackgroundCopyCallback3*, pJob : Void*, pError : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_error.call(this, pJob, pError)
    end
    def job_modification(this : IBackgroundCopyCallback3*, pJob : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.job_modification.call(this, pJob, dwReserved)
    end
    def file_transferred(this : IBackgroundCopyCallback3*, pJob : Void*, pFile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.file_transferred.call(this, pJob, pFile)
    end
    def file_ranges_transferred(this : IBackgroundCopyCallback3*, job : Void*, file : Void*, rangeCount : UInt32, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.file_ranges_transferred.call(this, job, file, rangeCount, ranges)
    end

  end

  @[Extern]
  record IBackgroundCopyFile6Vtbl,
    query_interface : Proc(IBackgroundCopyFile6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyFile6*, UInt32),
    release : Proc(IBackgroundCopyFile6*, UInt32),
    get_remote_name : Proc(IBackgroundCopyFile6*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_name : Proc(IBackgroundCopyFile6*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyFile6*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*, Win32cr::Foundation::HRESULT),
    get_file_ranges : Proc(IBackgroundCopyFile6*, UInt32*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**, Win32cr::Foundation::HRESULT),
    set_remote_name : Proc(IBackgroundCopyFile6*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_temporary_name : Proc(IBackgroundCopyFile6*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_validation_state : Proc(IBackgroundCopyFile6*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_validation_state : Proc(IBackgroundCopyFile6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_downloaded_from_peer : Proc(IBackgroundCopyFile6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_peer_download_stats : Proc(IBackgroundCopyFile6*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IBackgroundCopyFile6*, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE, Win32cr::Foundation::HRESULT),
    get_property : Proc(IBackgroundCopyFile6*, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE*, Win32cr::Foundation::HRESULT),
    update_download_position : Proc(IBackgroundCopyFile6*, UInt64, Win32cr::Foundation::HRESULT),
    request_file_ranges : Proc(IBackgroundCopyFile6*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*, Win32cr::Foundation::HRESULT),
    get_filled_file_ranges : Proc(IBackgroundCopyFile6*, UInt32*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyFile6, lpVtbl : IBackgroundCopyFile6Vtbl* do
    GUID = LibC::GUID.new(0xcf6784f7_u32, 0xd677_u16, 0x49fd_u16, StaticArray[0x93_u8, 0x68_u8, 0xcb_u8, 0x47_u8, 0xae_u8, 0xe9_u8, 0xd1_u8, 0xad_u8])
    def query_interface(this : IBackgroundCopyFile6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyFile6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyFile6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_remote_name(this : IBackgroundCopyFile6*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_name.call(this, pVal)
    end
    def get_local_name(this : IBackgroundCopyFile6*, pVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_name.call(this, pVal)
    end
    def get_progress(this : IBackgroundCopyFile6*, pVal : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_PROGRESS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, pVal)
    end
    def get_file_ranges(this : IBackgroundCopyFile6*, range_count : UInt32*, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_ranges.call(this, range_count, ranges)
    end
    def set_remote_name(this : IBackgroundCopyFile6*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_name.call(this, val)
    end
    def get_temporary_name(this : IBackgroundCopyFile6*, pFilename : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_temporary_name.call(this, pFilename)
    end
    def set_validation_state(this : IBackgroundCopyFile6*, state : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_validation_state.call(this, state)
    end
    def get_validation_state(this : IBackgroundCopyFile6*, pState : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_validation_state.call(this, pState)
    end
    def is_downloaded_from_peer(this : IBackgroundCopyFile6*, pVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_downloaded_from_peer.call(this, pVal)
    end
    def get_peer_download_stats(this : IBackgroundCopyFile6*, pFromOrigin : UInt64*, pFromPeers : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peer_download_stats.call(this, pFromOrigin, pFromPeers)
    end
    def set_property(this : IBackgroundCopyFile6*, property_id : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, property_value : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, property_id, property_value)
    end
    def get_property(this : IBackgroundCopyFile6*, property_id : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_ID, property_value : Win32cr::Networking::BackgroundIntelligentTransferService::BITS_FILE_PROPERTY_VALUE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, property_id, property_value)
    end
    def update_download_position(this : IBackgroundCopyFile6*, offset : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_download_position.call(this, offset)
    end
    def request_file_ranges(this : IBackgroundCopyFile6*, rangeCount : UInt32, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_file_ranges.call(this, rangeCount, ranges)
    end
    def get_filled_file_ranges(this : IBackgroundCopyFile6*, rangeCount : UInt32*, ranges : Win32cr::Networking::BackgroundIntelligentTransferService::BG_FILE_RANGE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filled_file_ranges.call(this, rangeCount, ranges)
    end

  end

  @[Extern]
  record IBackgroundCopyJobHttpOptions2Vtbl,
    query_interface : Proc(IBackgroundCopyJobHttpOptions2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJobHttpOptions2*, UInt32),
    release : Proc(IBackgroundCopyJobHttpOptions2*, UInt32),
    set_client_certificate_by_id : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, Win32cr::Foundation::PWSTR, UInt8*, Win32cr::Foundation::HRESULT),
    set_client_certificate_by_name : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    remove_client_certificate : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Foundation::HRESULT),
    get_client_certificate : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION*, Win32cr::Foundation::PWSTR*, UInt8**, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_custom_headers : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_custom_headers : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_security_flags : Proc(IBackgroundCopyJobHttpOptions2*, UInt32, Win32cr::Foundation::HRESULT),
    get_security_flags : Proc(IBackgroundCopyJobHttpOptions2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_http_method : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_http_method : Proc(IBackgroundCopyJobHttpOptions2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJobHttpOptions2, lpVtbl : IBackgroundCopyJobHttpOptions2Vtbl* do
    GUID = LibC::GUID.new(0xb591a192_u32, 0xa405_u16, 0x4fc3_u16, StaticArray[0x83_u8, 0x23_u8, 0x4c_u8, 0x5c_u8, 0x54_u8, 0x25_u8, 0x78_u8, 0xfc_u8])
    def query_interface(this : IBackgroundCopyJobHttpOptions2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJobHttpOptions2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJobHttpOptions2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_client_certificate_by_id(this : IBackgroundCopyJobHttpOptions2*, store_location : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, store_name : Win32cr::Foundation::PWSTR, pCertHashBlob : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_by_id.call(this, store_location, store_name, pCertHashBlob)
    end
    def set_client_certificate_by_name(this : IBackgroundCopyJobHttpOptions2*, store_location : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, store_name : Win32cr::Foundation::PWSTR, subject_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_by_name.call(this, store_location, store_name, subject_name)
    end
    def remove_client_certificate(this : IBackgroundCopyJobHttpOptions2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_client_certificate.call(this)
    end
    def get_client_certificate(this : IBackgroundCopyJobHttpOptions2*, pStoreLocation : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION*, pStoreName : Win32cr::Foundation::PWSTR*, ppCertHashBlob : UInt8**, pSubjectName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_certificate.call(this, pStoreLocation, pStoreName, ppCertHashBlob, pSubjectName)
    end
    def set_custom_headers(this : IBackgroundCopyJobHttpOptions2*, request_headers : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_custom_headers.call(this, request_headers)
    end
    def get_custom_headers(this : IBackgroundCopyJobHttpOptions2*, pRequestHeaders : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_headers.call(this, pRequestHeaders)
    end
    def set_security_flags(this : IBackgroundCopyJobHttpOptions2*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_flags.call(this, flags)
    end
    def get_security_flags(this : IBackgroundCopyJobHttpOptions2*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_flags.call(this, pFlags)
    end
    def set_http_method(this : IBackgroundCopyJobHttpOptions2*, method : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_http_method.call(this, method)
    end
    def get_http_method(this : IBackgroundCopyJobHttpOptions2*, method : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_http_method.call(this, method)
    end

  end

  @[Extern]
  record IBackgroundCopyServerCertificateValidationCallbackVtbl,
    query_interface : Proc(IBackgroundCopyServerCertificateValidationCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyServerCertificateValidationCallback*, UInt32),
    release : Proc(IBackgroundCopyServerCertificateValidationCallback*, UInt32),
    validate_server_certificate : Proc(IBackgroundCopyServerCertificateValidationCallback*, Void*, Void*, UInt32, UInt8*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyServerCertificateValidationCallback, lpVtbl : IBackgroundCopyServerCertificateValidationCallbackVtbl* do
    GUID = LibC::GUID.new(0x4cec0d02_u32, 0xdef7_u16, 0x4158_u16, StaticArray[0x81_u8, 0x3a_u8, 0xc3_u8, 0x2a_u8, 0x46_u8, 0x94_u8, 0x5f_u8, 0xf7_u8])
    def query_interface(this : IBackgroundCopyServerCertificateValidationCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyServerCertificateValidationCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyServerCertificateValidationCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def validate_server_certificate(this : IBackgroundCopyServerCertificateValidationCallback*, job : Void*, file : Void*, certLength : UInt32, certData : UInt8*, certEncodingType : UInt32, certStoreLength : UInt32, certStoreData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_server_certificate.call(this, job, file, certLength, certData, certEncodingType, certStoreLength, certStoreData)
    end

  end

  @[Extern]
  record IBackgroundCopyJobHttpOptions3Vtbl,
    query_interface : Proc(IBackgroundCopyJobHttpOptions3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJobHttpOptions3*, UInt32),
    release : Proc(IBackgroundCopyJobHttpOptions3*, UInt32),
    set_client_certificate_by_id : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, Win32cr::Foundation::PWSTR, UInt8*, Win32cr::Foundation::HRESULT),
    set_client_certificate_by_name : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    remove_client_certificate : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Foundation::HRESULT),
    get_client_certificate : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION*, Win32cr::Foundation::PWSTR*, UInt8**, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_custom_headers : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_custom_headers : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_security_flags : Proc(IBackgroundCopyJobHttpOptions3*, UInt32, Win32cr::Foundation::HRESULT),
    get_security_flags : Proc(IBackgroundCopyJobHttpOptions3*, UInt32*, Win32cr::Foundation::HRESULT),
    set_http_method : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_http_method : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_server_certificate_validation_interface : Proc(IBackgroundCopyJobHttpOptions3*, Void*, Win32cr::Foundation::HRESULT),
    make_custom_headers_write_only : Proc(IBackgroundCopyJobHttpOptions3*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJobHttpOptions3, lpVtbl : IBackgroundCopyJobHttpOptions3Vtbl* do
    GUID = LibC::GUID.new(0x8a9263d3_u32, 0xfd4c_u16, 0x4eda_u16, StaticArray[0x9b_u8, 0x28_u8, 0x30_u8, 0x13_u8, 0x2a_u8, 0x4d_u8, 0x4e_u8, 0x3c_u8])
    def query_interface(this : IBackgroundCopyJobHttpOptions3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJobHttpOptions3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJobHttpOptions3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_client_certificate_by_id(this : IBackgroundCopyJobHttpOptions3*, store_location : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, store_name : Win32cr::Foundation::PWSTR, pCertHashBlob : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_by_id.call(this, store_location, store_name, pCertHashBlob)
    end
    def set_client_certificate_by_name(this : IBackgroundCopyJobHttpOptions3*, store_location : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION, store_name : Win32cr::Foundation::PWSTR, subject_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_by_name.call(this, store_location, store_name, subject_name)
    end
    def remove_client_certificate(this : IBackgroundCopyJobHttpOptions3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_client_certificate.call(this)
    end
    def get_client_certificate(this : IBackgroundCopyJobHttpOptions3*, pStoreLocation : Win32cr::Networking::BackgroundIntelligentTransferService::BG_CERT_STORE_LOCATION*, pStoreName : Win32cr::Foundation::PWSTR*, ppCertHashBlob : UInt8**, pSubjectName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_certificate.call(this, pStoreLocation, pStoreName, ppCertHashBlob, pSubjectName)
    end
    def set_custom_headers(this : IBackgroundCopyJobHttpOptions3*, request_headers : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_custom_headers.call(this, request_headers)
    end
    def get_custom_headers(this : IBackgroundCopyJobHttpOptions3*, pRequestHeaders : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_headers.call(this, pRequestHeaders)
    end
    def set_security_flags(this : IBackgroundCopyJobHttpOptions3*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_flags.call(this, flags)
    end
    def get_security_flags(this : IBackgroundCopyJobHttpOptions3*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_flags.call(this, pFlags)
    end
    def set_http_method(this : IBackgroundCopyJobHttpOptions3*, method : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_http_method.call(this, method)
    end
    def get_http_method(this : IBackgroundCopyJobHttpOptions3*, method : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_http_method.call(this, method)
    end
    def set_server_certificate_validation_interface(this : IBackgroundCopyJobHttpOptions3*, certValidationCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_server_certificate_validation_interface.call(this, certValidationCallback)
    end
    def make_custom_headers_write_only(this : IBackgroundCopyJobHttpOptions3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_custom_headers_write_only.call(this)
    end

  end

  @[Extern]
  record IBITSExtensionSetupVtbl,
    query_interface : Proc(IBITSExtensionSetup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBITSExtensionSetup*, UInt32),
    release : Proc(IBITSExtensionSetup*, UInt32),
    get_type_info_count : Proc(IBITSExtensionSetup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IBITSExtensionSetup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IBITSExtensionSetup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IBITSExtensionSetup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    enable_bits_uploads : Proc(IBITSExtensionSetup*, Win32cr::Foundation::HRESULT),
    disable_bits_uploads : Proc(IBITSExtensionSetup*, Win32cr::Foundation::HRESULT),
    get_cleanup_task_name : Proc(IBITSExtensionSetup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_cleanup_task : Proc(IBITSExtensionSetup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBITSExtensionSetup, lpVtbl : IBITSExtensionSetupVtbl* do
    GUID = LibC::GUID.new(0x29cfbbf7_u32, 0x9e4_u16, 0x4b97_u16, StaticArray[0xb0_u8, 0xbc_u8, 0xf2_u8, 0x28_u8, 0x7e_u8, 0x3d_u8, 0x8e_u8, 0xb3_u8])
    def query_interface(this : IBITSExtensionSetup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBITSExtensionSetup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBITSExtensionSetup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IBITSExtensionSetup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IBITSExtensionSetup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IBITSExtensionSetup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IBITSExtensionSetup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def enable_bits_uploads(this : IBITSExtensionSetup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_bits_uploads.call(this)
    end
    def disable_bits_uploads(this : IBITSExtensionSetup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_bits_uploads.call(this)
    end
    def get_cleanup_task_name(this : IBITSExtensionSetup*, pTaskName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cleanup_task_name.call(this, pTaskName)
    end
    def get_cleanup_task(this : IBITSExtensionSetup*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cleanup_task.call(this, riid, ppUnk)
    end

  end

  @[Extern]
  record IBITSExtensionSetupFactoryVtbl,
    query_interface : Proc(IBITSExtensionSetupFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBITSExtensionSetupFactory*, UInt32),
    release : Proc(IBITSExtensionSetupFactory*, UInt32),
    get_type_info_count : Proc(IBITSExtensionSetupFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IBITSExtensionSetupFactory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IBITSExtensionSetupFactory*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IBITSExtensionSetupFactory*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_object : Proc(IBITSExtensionSetupFactory*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBITSExtensionSetupFactory, lpVtbl : IBITSExtensionSetupFactoryVtbl* do
    GUID = LibC::GUID.new(0xd5d2d542_u32, 0x5503_u16, 0x4e64_u16, StaticArray[0x8b_u8, 0x48_u8, 0x72_u8, 0xef_u8, 0x91_u8, 0xa3_u8, 0x2e_u8, 0xe1_u8])
    def query_interface(this : IBITSExtensionSetupFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBITSExtensionSetupFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBITSExtensionSetupFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IBITSExtensionSetupFactory*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IBITSExtensionSetupFactory*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IBITSExtensionSetupFactory*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IBITSExtensionSetupFactory*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_object(this : IBITSExtensionSetupFactory*, path : Win32cr::Foundation::BSTR, ppExtensionSetup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object.call(this, path, ppExtensionSetup)
    end

  end

  @[Extern]
  record IBackgroundCopyJob1Vtbl,
    query_interface : Proc(IBackgroundCopyJob1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyJob1*, UInt32),
    release : Proc(IBackgroundCopyJob1*, UInt32),
    cancel_job : Proc(IBackgroundCopyJob1*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyJob1*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IBackgroundCopyJob1*, UInt32*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    add_files : Proc(IBackgroundCopyJob1*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::FILESETINFO**, Win32cr::Foundation::HRESULT),
    get_file : Proc(IBackgroundCopyJob1*, UInt32, Win32cr::Networking::BackgroundIntelligentTransferService::FILESETINFO*, Win32cr::Foundation::HRESULT),
    get_file_count : Proc(IBackgroundCopyJob1*, UInt32*, Win32cr::Foundation::HRESULT),
    switch_to_foreground : Proc(IBackgroundCopyJob1*, Win32cr::Foundation::HRESULT),
    get_JobID : Proc(IBackgroundCopyJob1*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyJob1, lpVtbl : IBackgroundCopyJob1Vtbl* do
    GUID = LibC::GUID.new(0x59f5553c_u32, 0x2031_u16, 0x4629_u16, StaticArray[0xbb_u8, 0x18_u8, 0x26_u8, 0x45_u8, 0xa6_u8, 0x97_u8, 0x9_u8, 0x47_u8])
    def query_interface(this : IBackgroundCopyJob1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyJob1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyJob1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cancel_job(this : IBackgroundCopyJob1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_job.call(this)
    end
    def get_progress(this : IBackgroundCopyJob1*, dwFlags : UInt32, pdwProgress : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, dwFlags, pdwProgress)
    end
    def get_status(this : IBackgroundCopyJob1*, pdwStatus : UInt32*, pdwWin32Result : UInt32*, pdwTransportResult : UInt32*, pdwNumOfRetries : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus, pdwWin32Result, pdwTransportResult, pdwNumOfRetries)
    end
    def add_files(this : IBackgroundCopyJob1*, cFileCount : UInt32, ppFileSet : Win32cr::Networking::BackgroundIntelligentTransferService::FILESETINFO**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_files.call(this, cFileCount, ppFileSet)
    end
    def get_file(this : IBackgroundCopyJob1*, cFileIndex : UInt32, pFileInfo : Win32cr::Networking::BackgroundIntelligentTransferService::FILESETINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file.call(this, cFileIndex, pFileInfo)
    end
    def get_file_count(this : IBackgroundCopyJob1*, pdwFileCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_count.call(this, pdwFileCount)
    end
    def switch_to_foreground(this : IBackgroundCopyJob1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_to_foreground.call(this)
    end
    def get_JobID(this : IBackgroundCopyJob1*, pguidJobID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JobID.call(this, pguidJobID)
    end

  end

  @[Extern]
  record IEnumBackgroundCopyJobs1Vtbl,
    query_interface : Proc(IEnumBackgroundCopyJobs1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumBackgroundCopyJobs1*, UInt32),
    release : Proc(IEnumBackgroundCopyJobs1*, UInt32),
    next__ : Proc(IEnumBackgroundCopyJobs1*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumBackgroundCopyJobs1*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumBackgroundCopyJobs1*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumBackgroundCopyJobs1*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IEnumBackgroundCopyJobs1*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumBackgroundCopyJobs1, lpVtbl : IEnumBackgroundCopyJobs1Vtbl* do
    GUID = LibC::GUID.new(0x8baeba9d_u32, 0x8f1c_u16, 0x42c4_u16, StaticArray[0xb8_u8, 0x2c_u8, 0x9_u8, 0xae_u8, 0x79_u8, 0x98_u8, 0xd_u8, 0x25_u8])
    def query_interface(this : IEnumBackgroundCopyJobs1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumBackgroundCopyJobs1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumBackgroundCopyJobs1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumBackgroundCopyJobs1*, celt : UInt32, rgelt : LibC::GUID*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumBackgroundCopyJobs1*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumBackgroundCopyJobs1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumBackgroundCopyJobs1*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end
    def get_count(this : IEnumBackgroundCopyJobs1*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end

  end

  @[Extern]
  record IBackgroundCopyGroupVtbl,
    query_interface : Proc(IBackgroundCopyGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyGroup*, UInt32),
    release : Proc(IBackgroundCopyGroup*, UInt32),
    get_prop : Proc(IBackgroundCopyGroup*, Win32cr::Networking::BackgroundIntelligentTransferService::GROUPPROP, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_prop : Proc(IBackgroundCopyGroup*, Win32cr::Networking::BackgroundIntelligentTransferService::GROUPPROP, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IBackgroundCopyGroup*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IBackgroundCopyGroup*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_job : Proc(IBackgroundCopyGroup*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    suspend_group : Proc(IBackgroundCopyGroup*, Win32cr::Foundation::HRESULT),
    resume_group : Proc(IBackgroundCopyGroup*, Win32cr::Foundation::HRESULT),
    cancel_group : Proc(IBackgroundCopyGroup*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IBackgroundCopyGroup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_GroupID : Proc(IBackgroundCopyGroup*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    create_job : Proc(IBackgroundCopyGroup*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    enum_jobs : Proc(IBackgroundCopyGroup*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    switch_to_foreground : Proc(IBackgroundCopyGroup*, Win32cr::Foundation::HRESULT),
    query_new_job_interface : Proc(IBackgroundCopyGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_notification_pointer : Proc(IBackgroundCopyGroup*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyGroup, lpVtbl : IBackgroundCopyGroupVtbl* do
    GUID = LibC::GUID.new(0x1ded80a7_u32, 0x53ea_u16, 0x424f_u16, StaticArray[0x8a_u8, 0x4_u8, 0x17_u8, 0xfe_u8, 0xa9_u8, 0xad_u8, 0xc4_u8, 0xf5_u8])
    def query_interface(this : IBackgroundCopyGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_prop(this : IBackgroundCopyGroup*, propID : Win32cr::Networking::BackgroundIntelligentTransferService::GROUPPROP, pvarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop.call(this, propID, pvarVal)
    end
    def set_prop(this : IBackgroundCopyGroup*, propID : Win32cr::Networking::BackgroundIntelligentTransferService::GROUPPROP, pvarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prop.call(this, propID, pvarVal)
    end
    def get_progress(this : IBackgroundCopyGroup*, dwFlags : UInt32, pdwProgress : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, dwFlags, pdwProgress)
    end
    def get_status(this : IBackgroundCopyGroup*, pdwStatus : UInt32*, pdwJobIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus, pdwJobIndex)
    end
    def get_job(this : IBackgroundCopyGroup*, jobID : LibC::GUID, ppJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_job.call(this, jobID, ppJob)
    end
    def suspend_group(this : IBackgroundCopyGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_group.call(this)
    end
    def resume_group(this : IBackgroundCopyGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_group.call(this)
    end
    def cancel_group(this : IBackgroundCopyGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_group.call(this)
    end
    def get_Size(this : IBackgroundCopyGroup*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, pdwSize)
    end
    def get_GroupID(this : IBackgroundCopyGroup*, pguidGroupID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupID.call(this, pguidGroupID)
    end
    def create_job(this : IBackgroundCopyGroup*, guidJobID : LibC::GUID, ppJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_job.call(this, guidJobID, ppJob)
    end
    def enum_jobs(this : IBackgroundCopyGroup*, dwFlags : UInt32, ppEnumJobs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_jobs.call(this, dwFlags, ppEnumJobs)
    end
    def switch_to_foreground(this : IBackgroundCopyGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_to_foreground.call(this)
    end
    def query_new_job_interface(this : IBackgroundCopyGroup*, iid : LibC::GUID*, pUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_new_job_interface.call(this, iid, pUnk)
    end
    def set_notification_pointer(this : IBackgroundCopyGroup*, iid : LibC::GUID*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notification_pointer.call(this, iid, pUnk)
    end

  end

  @[Extern]
  record IEnumBackgroundCopyGroupsVtbl,
    query_interface : Proc(IEnumBackgroundCopyGroups*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumBackgroundCopyGroups*, UInt32),
    release : Proc(IEnumBackgroundCopyGroups*, UInt32),
    next__ : Proc(IEnumBackgroundCopyGroups*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumBackgroundCopyGroups*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumBackgroundCopyGroups*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumBackgroundCopyGroups*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IEnumBackgroundCopyGroups*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumBackgroundCopyGroups, lpVtbl : IEnumBackgroundCopyGroupsVtbl* do
    GUID = LibC::GUID.new(0xd993e603_u32, 0x4aa4_u16, 0x47c5_u16, StaticArray[0x86_u8, 0x65_u8, 0xc2_u8, 0xd_u8, 0x39_u8, 0xc2_u8, 0xba_u8, 0x4f_u8])
    def query_interface(this : IEnumBackgroundCopyGroups*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumBackgroundCopyGroups*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumBackgroundCopyGroups*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumBackgroundCopyGroups*, celt : UInt32, rgelt : LibC::GUID*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumBackgroundCopyGroups*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumBackgroundCopyGroups*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumBackgroundCopyGroups*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end
    def get_count(this : IEnumBackgroundCopyGroups*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end

  end

  @[Extern]
  record IBackgroundCopyCallback1Vtbl,
    query_interface : Proc(IBackgroundCopyCallback1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyCallback1*, UInt32),
    release : Proc(IBackgroundCopyCallback1*, UInt32),
    on_status : Proc(IBackgroundCopyCallback1*, Void*, Void*, UInt32, UInt32, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_progress : Proc(IBackgroundCopyCallback1*, UInt32, Void*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_progress_ex : Proc(IBackgroundCopyCallback1*, UInt32, Void*, Void*, UInt32, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyCallback1, lpVtbl : IBackgroundCopyCallback1Vtbl* do
    GUID = LibC::GUID.new(0x84f6593_u32, 0x3800_u16, 0x4e08_u16, StaticArray[0x9b_u8, 0x59_u8, 0x99_u8, 0xfa_u8, 0x59_u8, 0xad_u8, 0xdf_u8, 0x82_u8])
    def query_interface(this : IBackgroundCopyCallback1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyCallback1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyCallback1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_status(this : IBackgroundCopyCallback1*, pGroup : Void*, pJob : Void*, dwFileIndex : UInt32, dwStatus : UInt32, dwNumOfRetries : UInt32, dwWin32Result : UInt32, dwTransportResult : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status.call(this, pGroup, pJob, dwFileIndex, dwStatus, dwNumOfRetries, dwWin32Result, dwTransportResult)
    end
    def on_progress(this : IBackgroundCopyCallback1*, progress_type : UInt32, pGroup : Void*, pJob : Void*, dwFileIndex : UInt32, dwProgressValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, progress_type, pGroup, pJob, dwFileIndex, dwProgressValue)
    end
    def on_progress_ex(this : IBackgroundCopyCallback1*, progress_type : UInt32, pGroup : Void*, pJob : Void*, dwFileIndex : UInt32, dwProgressValue : UInt32, dwByteArraySize : UInt32, pByte : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress_ex.call(this, progress_type, pGroup, pJob, dwFileIndex, dwProgressValue, dwByteArraySize, pByte)
    end

  end

  @[Extern]
  record IBackgroundCopyQMgrVtbl,
    query_interface : Proc(IBackgroundCopyQMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBackgroundCopyQMgr*, UInt32),
    release : Proc(IBackgroundCopyQMgr*, UInt32),
    create_group : Proc(IBackgroundCopyQMgr*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    get_group : Proc(IBackgroundCopyQMgr*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    enum_groups : Proc(IBackgroundCopyQMgr*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBackgroundCopyQMgr, lpVtbl : IBackgroundCopyQMgrVtbl* do
    GUID = LibC::GUID.new(0x16f41c69_u32, 0x9f5_u16, 0x41d2_u16, StaticArray[0x8c_u8, 0xd8_u8, 0x3c_u8, 0x8_u8, 0xc4_u8, 0x7b_u8, 0xc8_u8, 0xa8_u8])
    def query_interface(this : IBackgroundCopyQMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBackgroundCopyQMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBackgroundCopyQMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_group(this : IBackgroundCopyQMgr*, guidGroupID : LibC::GUID, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_group.call(this, guidGroupID, ppGroup)
    end
    def get_group(this : IBackgroundCopyQMgr*, groupID : LibC::GUID, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_group.call(this, groupID, ppGroup)
    end
    def enum_groups(this : IBackgroundCopyQMgr*, dwFlags : UInt32, ppEnumGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_groups.call(this, dwFlags, ppEnumGroups)
    end

  end

end