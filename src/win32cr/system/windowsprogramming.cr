require "../foundation.cr"
require "../system/kernel.cr"
require "../system/com.cr"
require "../security.cr"
require "../graphics/gdi.cr"
require "../system/registry.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:onecore.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:shcore.dll")]
@[Link(ldflags: "/DELAYLOAD:dciman32.dll")]
@[Link(ldflags: "/DELAYLOAD:gdi32.dll")]
@[Link(ldflags: "/DELAYLOAD:advpack.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
@[Link(ldflags: "/DELAYLOAD:wldp.dll")]
{% else %}
@[Link("onecore")]
@[Link("advapi32")]
@[Link("shcore")]
@[Link("dciman32")]
@[Link("gdi32")]
@[Link("advpack")]
@[Link("user32")]
@[Link("wldp")]
{% end %}
lib LibWin32
  alias HWINWATCH = LibC::IntPtrT
  alias FEATURE_STATE_CHANGE_SUBSCRIPTION = LibC::IntPtrT
  alias FH_SERVICE_PIPE_HANDLE = LibC::IntPtrT

  WLDP_LOCKDOWN_UNDEFINED = 0_u32
  WLDP_LOCKDOWN_DEFINED_FLAG = 2147483648_u32
  WLDP_LOCKDOWN_CONFIG_CI_FLAG = 1_u32
  WLDP_LOCKDOWN_CONFIG_CI_AUDIT_FLAG = 2_u32
  WLDP_LOCKDOWN_UMCIENFORCE_FLAG = 4_u32
  WLDP_LOCKDOWN_AUDIT_FLAG = 8_u32
  WLDP_LOCKDOWN_EXCLUSION_FLAG = 16_u32
  WLDP_LOCKDOWN_OFF = 2147483648_u32
  WLDP_HOST_INFORMATION_REVISION = 1_u32
  WLDP_FLAGS_SKIPSIGNATUREVALIDATION = 256_u32
  MAX_TDI_ENTITIES = 4096_u32
  INFO_CLASS_GENERIC = 256_u32
  INFO_CLASS_PROTOCOL = 512_u32
  INFO_CLASS_IMPLEMENTATION = 768_u32
  INFO_TYPE_PROVIDER = 256_u32
  INFO_TYPE_ADDRESS_OBJECT = 512_u32
  INFO_TYPE_CONNECTION = 768_u32
  ENTITY_LIST_ID = 0_u32
  INVALID_ENTITY_INSTANCE = -1_i32
  CONTEXT_SIZE = 16_u32
  ENTITY_TYPE_ID = 1_u32
  CO_TL_NBF = 1024_u32
  CO_TL_SPX = 1026_u32
  CO_TL_TCP = 1028_u32
  CO_TL_SPP = 1030_u32
  CL_TL_NBF = 1025_u32
  CL_TL_UDP = 1027_u32
  ER_ICMP = 896_u32
  CL_NL_IPX = 769_u32
  CL_NL_IP = 771_u32
  AT_ARP = 640_u32
  AT_NULL = 642_u32
  IF_GENERIC = 512_u32
  IF_MIB = 514_u32
  IOCTL_TDI_TL_IO_CONTROL_ENDPOINT = 2162744_u32
  DCI_VERSION = 256_u32
  DCICREATEPRIMARYSURFACE = 1_u32
  DCICREATEOFFSCREENSURFACE = 2_u32
  DCICREATEOVERLAYSURFACE = 3_u32
  DCIENUMSURFACE = 4_u32
  DCIESCAPE = 5_u32
  DCI_OK = 0_u32
  DCI_FAIL_GENERIC = -1_i32
  DCI_FAIL_UNSUPPORTEDVERSION = -2_i32
  DCI_FAIL_INVALIDSURFACE = -3_i32
  DCI_FAIL_UNSUPPORTED = -4_i32
  DCI_ERR_CURRENTLYNOTAVAIL = -5_i32
  DCI_ERR_INVALIDRECT = -6_i32
  DCI_ERR_UNSUPPORTEDFORMAT = -7_i32
  DCI_ERR_UNSUPPORTEDMASK = -8_i32
  DCI_ERR_TOOBIGHEIGHT = -9_i32
  DCI_ERR_TOOBIGWIDTH = -10_i32
  DCI_ERR_TOOBIGSIZE = -11_i32
  DCI_ERR_OUTOFMEMORY = -12_i32
  DCI_ERR_INVALIDPOSITION = -13_i32
  DCI_ERR_INVALIDSTRETCH = -14_i32
  DCI_ERR_INVALIDCLIPLIST = -15_i32
  DCI_ERR_SURFACEISOBSCURED = -16_i32
  DCI_ERR_XALIGN = -17_i32
  DCI_ERR_YALIGN = -18_i32
  DCI_ERR_XYALIGN = -19_i32
  DCI_ERR_WIDTHALIGN = -20_i32
  DCI_ERR_HEIGHTALIGN = -21_i32
  DCI_STATUS_POINTERCHANGED = 1_u32
  DCI_STATUS_STRIDECHANGED = 2_u32
  DCI_STATUS_FORMATCHANGED = 4_u32
  DCI_STATUS_SURFACEINFOCHANGED = 8_u32
  DCI_STATUS_CHROMAKEYCHANGED = 16_u32
  DCI_STATUS_WASSTILLDRAWING = 32_u32
  DCI_SURFACE_TYPE = 15_u32
  DCI_PRIMARY = 0_u32
  DCI_OFFSCREEN = 1_u32
  DCI_OVERLAY = 2_u32
  DCI_VISIBLE = 16_u32
  DCI_CHROMAKEY = 32_u32
  DCI_1632_ACCESS = 64_u32
  DCI_DWORDSIZE = 128_u32
  DCI_DWORDALIGN = 256_u32
  DCI_WRITEONLY = 512_u32
  DCI_ASYNC = 1024_u32
  DCI_CAN_STRETCHX = 4096_u32
  DCI_CAN_STRETCHY = 8192_u32
  DCI_CAN_STRETCHXN = 16384_u32
  DCI_CAN_STRETCHYN = 32768_u32
  DCI_CANOVERLAY = 65536_u32
  FILE_FLAG_OPEN_REQUIRING_OPLOCK = 262144_u32
  PROGRESS_CONTINUE = 0_u32
  PROGRESS_CANCEL = 1_u32
  PROGRESS_STOP = 2_u32
  PROGRESS_QUIET = 3_u32
  COPY_FILE_FAIL_IF_EXISTS = 1_u32
  COPY_FILE_RESTARTABLE = 2_u32
  COPY_FILE_OPEN_SOURCE_FOR_WRITE = 4_u32
  COPY_FILE_ALLOW_DECRYPTED_DESTINATION = 8_u32
  COPY_FILE_COPY_SYMLINK = 2048_u32
  COPY_FILE_NO_BUFFERING = 4096_u32
  COPY_FILE_REQUEST_SECURITY_PRIVILEGES = 8192_u32
  COPY_FILE_RESUME_FROM_PAUSE = 16384_u32
  COPY_FILE_NO_OFFLOAD = 262144_u32
  COPY_FILE_IGNORE_EDP_BLOCK = 4194304_u32
  COPY_FILE_IGNORE_SOURCE_ENCRYPTION = 8388608_u32
  COPY_FILE_DONT_REQUEST_DEST_WRITE_DAC = 33554432_u32
  COPY_FILE_REQUEST_COMPRESSED_TRAFFIC = 268435456_u32
  COPY_FILE_OPEN_AND_COPY_REPARSE_POINT = 2097152_u32
  COPY_FILE_DIRECTORY = 128_u32
  COPY_FILE_SKIP_ALTERNATE_STREAMS = 32768_u32
  COPY_FILE_DISABLE_PRE_ALLOCATION = 67108864_u32
  COPY_FILE_ENABLE_LOW_FREE_SPACE_MODE = 134217728_u32
  FAIL_FAST_GENERATE_EXCEPTION_ADDRESS = 1_u32
  FAIL_FAST_NO_HARD_ERROR_DLG = 2_u32
  DTR_CONTROL_DISABLE = 0_u32
  DTR_CONTROL_ENABLE = 1_u32
  DTR_CONTROL_HANDSHAKE = 2_u32
  RTS_CONTROL_DISABLE = 0_u32
  RTS_CONTROL_ENABLE = 1_u32
  RTS_CONTROL_HANDSHAKE = 2_u32
  RTS_CONTROL_TOGGLE = 3_u32
  GMEM_NOCOMPACT = 16_u32
  GMEM_NODISCARD = 32_u32
  GMEM_MODIFY = 128_u32
  GMEM_DISCARDABLE = 256_u32
  GMEM_NOT_BANKED = 4096_u32
  GMEM_SHARE = 8192_u32
  GMEM_DDESHARE = 8192_u32
  GMEM_NOTIFY = 16384_u32
  GMEM_LOWER = 4096_u32
  GMEM_VALID_FLAGS = 32626_u32
  GMEM_INVALID_HANDLE = 32768_u32
  GMEM_DISCARDED = 16384_u32
  GMEM_LOCKCOUNT = 255_u32
  THREAD_PRIORITY_ERROR_RETURN = 2147483647_u32
  VOLUME_NAME_DOS = 0_u32
  VOLUME_NAME_GUID = 1_u32
  VOLUME_NAME_NT = 2_u32
  VOLUME_NAME_NONE = 4_u32
  DRIVE_UNKNOWN = 0_u32
  DRIVE_NO_ROOT_DIR = 1_u32
  DRIVE_REMOVABLE = 2_u32
  DRIVE_FIXED = 3_u32
  DRIVE_REMOTE = 4_u32
  DRIVE_CDROM = 5_u32
  DRIVE_RAMDISK = 6_u32
  FILE_TYPE_UNKNOWN = 0_u32
  FILE_TYPE_DISK = 1_u32
  FILE_TYPE_CHAR = 2_u32
  FILE_TYPE_PIPE = 3_u32
  FILE_TYPE_REMOTE = 32768_u32
  NOPARITY = 0_u32
  ODDPARITY = 1_u32
  EVENPARITY = 2_u32
  MARKPARITY = 3_u32
  SPACEPARITY = 4_u32
  ONESTOPBIT = 0_u32
  ONE5STOPBITS = 1_u32
  TWOSTOPBITS = 2_u32
  IGNORE = 0_u32
  INFINITE = 4294967295_u32
  CBR_110 = 110_u32
  CBR_300 = 300_u32
  CBR_600 = 600_u32
  CBR_1200 = 1200_u32
  CBR_2400 = 2400_u32
  CBR_4800 = 4800_u32
  CBR_9600 = 9600_u32
  CBR_14400 = 14400_u32
  CBR_19200 = 19200_u32
  CBR_38400 = 38400_u32
  CBR_56000 = 56000_u32
  CBR_57600 = 57600_u32
  CBR_115200 = 115200_u32
  CBR_128000 = 128000_u32
  CBR_256000 = 256000_u32
  CE_TXFULL = 256_u32
  CE_PTO = 512_u32
  CE_IOE = 1024_u32
  CE_DNS = 2048_u32
  CE_OOP = 4096_u32
  CE_MODE = 32768_u32
  IE_BADID = -1_i32
  IE_OPEN = -2_i32
  IE_NOPEN = -3_i32
  IE_MEMORY = -4_i32
  IE_DEFAULT = -5_i32
  IE_HARDWARE = -10_i32
  IE_BYTESIZE = -11_i32
  IE_BAUDRATE = -12_i32
  RESETDEV = 7_u32
  LPTx = 128_u32
  S_QUEUEEMPTY = 0_u32
  S_THRESHOLD = 1_u32
  S_ALLTHRESHOLD = 2_u32
  S_NORMAL = 0_u32
  S_LEGATO = 1_u32
  S_STACCATO = 2_u32
  S_PERIOD512 = 0_u32
  S_PERIOD1024 = 1_u32
  S_PERIOD2048 = 2_u32
  S_PERIODVOICE = 3_u32
  S_WHITE512 = 4_u32
  S_WHITE1024 = 5_u32
  S_WHITE2048 = 6_u32
  S_WHITEVOICE = 7_u32
  S_SERDVNA = -1_i32
  S_SEROFM = -2_i32
  S_SERMACT = -3_i32
  S_SERQFUL = -4_i32
  S_SERBDNT = -5_i32
  S_SERDLN = -6_i32
  S_SERDCC = -7_i32
  S_SERDTP = -8_i32
  S_SERDVL = -9_i32
  S_SERDMD = -10_i32
  S_SERDSH = -11_i32
  S_SERDPT = -12_i32
  S_SERDFQ = -13_i32
  S_SERDDR = -14_i32
  S_SERDSR = -15_i32
  S_SERDST = -16_i32
  FS_CASE_IS_PRESERVED = 2_u32
  FS_CASE_SENSITIVE = 1_u32
  FS_UNICODE_STORED_ON_DISK = 4_u32
  FS_PERSISTENT_ACLS = 8_u32
  FS_VOL_IS_COMPRESSED = 32768_u32
  FS_FILE_COMPRESSION = 16_u32
  FS_FILE_ENCRYPTION = 131072_u32
  OFS_MAXPATHNAME = 128_u32
  MAXINTATOM = 49152_u32
  SCS_32BIT_BINARY = 0_u32
  SCS_DOS_BINARY = 1_u32
  SCS_WOW_BINARY = 2_u32
  SCS_PIF_BINARY = 3_u32
  SCS_POSIX_BINARY = 4_u32
  SCS_OS216_BINARY = 5_u32
  SCS_64BIT_BINARY = 6_u32
  FIBER_FLAG_FLOAT_SWITCH = 1_u32
  UMS_VERSION = 256_u32
  FILE_SKIP_COMPLETION_PORT_ON_SUCCESS = 1_u32
  FILE_SKIP_SET_EVENT_ON_HANDLE = 2_u32
  CRITICAL_SECTION_NO_DEBUG_INFO = 16777216_u32
  HINSTANCE_ERROR = 32_u32
  FORMAT_MESSAGE_MAX_WIDTH_MASK = 255_u32
  FILE_ENCRYPTABLE = 0_u32
  FILE_IS_ENCRYPTED = 1_u32
  FILE_SYSTEM_ATTR = 2_u32
  FILE_ROOT_DIR = 3_u32
  FILE_SYSTEM_DIR = 4_u32
  FILE_UNKNOWN = 5_u32
  FILE_SYSTEM_NOT_SUPPORT = 6_u32
  FILE_USER_DISALLOWED = 7_u32
  FILE_READ_ONLY = 8_u32
  FILE_DIR_DISALLOWED = 9_u32
  EFS_USE_RECOVERY_KEYS = 1_u32
  CREATE_FOR_IMPORT = 1_u32
  CREATE_FOR_DIR = 2_u32
  OVERWRITE_HIDDEN = 4_u32
  EFSRPC_SECURE_ONLY = 8_u32
  EFS_DROP_ALTERNATE_STREAMS = 16_u32
  BACKUP_INVALID = 0_u32
  BACKUP_GHOSTED_FILE_EXTENTS = 11_u32
  STREAM_NORMAL_ATTRIBUTE = 0_u32
  STREAM_MODIFIED_WHEN_READ = 1_u32
  STREAM_CONTAINS_SECURITY = 2_u32
  STREAM_CONTAINS_PROPERTIES = 4_u32
  STREAM_SPARSE_ATTRIBUTE = 8_u32
  STREAM_CONTAINS_GHOSTED_FILE_EXTENTS = 16_u32
  STARTF_HOLOGRAPHIC = 262144_u32
  SHUTDOWN_NORETRY = 1_u32
  PROTECTION_LEVEL_SAME = 4294967295_u32
  PROC_THREAD_ATTRIBUTE_NUMBER = 65535_u32
  PROC_THREAD_ATTRIBUTE_THREAD = 65536_u32
  PROC_THREAD_ATTRIBUTE_INPUT = 131072_u32
  PROC_THREAD_ATTRIBUTE_ADDITIVE = 262144_u32
  PROCESS_CREATION_MITIGATION_POLICY_DEP_ENABLE = 1_u32
  PROCESS_CREATION_MITIGATION_POLICY_DEP_ATL_THUNK_ENABLE = 2_u32
  PROCESS_CREATION_MITIGATION_POLICY_SEHOP_ENABLE = 4_u32
  PROCESS_CREATION_CHILD_PROCESS_RESTRICTED = 1_u32
  PROCESS_CREATION_CHILD_PROCESS_OVERRIDE = 2_u32
  PROCESS_CREATION_CHILD_PROCESS_RESTRICTED_UNLESS_SECURE = 4_u32
  PROCESS_CREATION_ALL_APPLICATION_PACKAGES_OPT_OUT = 1_u32
  PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_ENABLE_PROCESS_TREE = 1_u32
  PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_DISABLE_PROCESS_TREE = 2_u32
  PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_OVERRIDE = 4_u32
  ATOM_FLAG_GLOBAL = 2_u32
  BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE = 1_u32
  BASE_SEARCH_PATH_DISABLE_SAFE_SEARCHMODE = 65536_u32
  BASE_SEARCH_PATH_PERMANENT = 32768_u32
  COPYFILE2_MESSAGE_COPY_OFFLOAD = 1_i32
  COPYFILE2_IO_CYCLE_SIZE_MIN = 4096_u32
  COPYFILE2_IO_CYCLE_SIZE_MAX = 1073741824_u32
  COPYFILE2_IO_RATE_MIN = 512_u32
  EVENTLOG_FULL_INFO = 0_u32
  OPERATION_API_VERSION = 1_u32
  MAX_COMPUTERNAME_LENGTH = 15_u32
  LOGON32_PROVIDER_WINNT35 = 1_u32
  LOGON32_PROVIDER_VIRTUAL = 4_u32
  LOGON_ZERO_PASSWORD_BUFFER = 2147483648_u32
  HW_PROFILE_GUIDLEN = 39_u32
  DOCKINFO_UNDOCKED = 1_u32
  DOCKINFO_DOCKED = 2_u32
  DOCKINFO_USER_SUPPLIED = 4_u32
  TC_NORMAL = 0_u32
  TC_HARDERR = 1_u32
  TC_GP_TRAP = 2_u32
  TC_SIGNAL = 3_u32
  AC_LINE_OFFLINE = 0_u32
  AC_LINE_ONLINE = 1_u32
  AC_LINE_BACKUP_POWER = 2_u32
  AC_LINE_UNKNOWN = 255_u32
  BATTERY_FLAG_HIGH = 1_u32
  BATTERY_FLAG_LOW = 2_u32
  BATTERY_FLAG_CRITICAL = 4_u32
  BATTERY_FLAG_CHARGING = 8_u32
  BATTERY_FLAG_NO_BATTERY = 128_u32
  BATTERY_FLAG_UNKNOWN = 255_u32
  BATTERY_PERCENTAGE_UNKNOWN = 255_u32
  SYSTEM_STATUS_FLAG_POWER_SAVING_ON = 1_u32
  BATTERY_LIFE_UNKNOWN = 4294967295_u32
  ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID = 1_u32
  ACTCTX_FLAG_LANGID_VALID = 2_u32
  ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID = 4_u32
  ACTCTX_FLAG_RESOURCE_NAME_VALID = 8_u32
  ACTCTX_FLAG_SET_PROCESS_DEFAULT = 16_u32
  ACTCTX_FLAG_APPLICATION_NAME_VALID = 32_u32
  ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF = 64_u32
  ACTCTX_FLAG_HMODULE_VALID = 128_u32
  DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION = 1_u32
  FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX = 1_u32
  FIND_ACTCTX_SECTION_KEY_RETURN_FLAGS = 2_u32
  FIND_ACTCTX_SECTION_KEY_RETURN_ASSEMBLY_METADATA = 4_u32
  ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED = 1_u32
  QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX = 4_u32
  QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE = 8_u32
  QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS = 16_u32
  QUERY_ACTCTX_FLAG_NO_ADDREF = 2147483648_u32
  RESTART_MAX_CMD_LINE = 1024_u32
  RECOVERY_DEFAULT_PING_INTERVAL = 5000_u32
  FILE_RENAME_FLAG_REPLACE_IF_EXISTS = 1_u32
  FILE_RENAME_FLAG_POSIX_SEMANTICS = 2_u32
  FILE_RENAME_FLAG_SUPPRESS_PIN_STATE_INHERITANCE = 4_u32
  FILE_DISPOSITION_FLAG_DO_NOT_DELETE = 0_u32
  FILE_DISPOSITION_FLAG_DELETE = 1_u32
  FILE_DISPOSITION_FLAG_POSIX_SEMANTICS = 2_u32
  FILE_DISPOSITION_FLAG_FORCE_IMAGE_SECTION_CHECK = 4_u32
  FILE_DISPOSITION_FLAG_ON_CLOSE = 8_u32
  FILE_DISPOSITION_FLAG_IGNORE_READONLY_ATTRIBUTE = 16_u32
  STORAGE_INFO_FLAGS_ALIGNED_DEVICE = 1_u32
  STORAGE_INFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE = 2_u32
  STORAGE_INFO_OFFSET_UNKNOWN = 4294967295_u32
  REMOTE_PROTOCOL_INFO_FLAG_LOOPBACK = 1_u32
  REMOTE_PROTOCOL_INFO_FLAG_OFFLINE = 2_u32
  REMOTE_PROTOCOL_INFO_FLAG_PERSISTENT_HANDLE = 4_u32
  RPI_FLAG_SMB2_SHARECAP_TIMEWARP = 2_u32
  RPI_FLAG_SMB2_SHARECAP_DFS = 8_u32
  RPI_FLAG_SMB2_SHARECAP_CONTINUOUS_AVAILABILITY = 16_u32
  RPI_FLAG_SMB2_SHARECAP_SCALEOUT = 32_u32
  RPI_FLAG_SMB2_SHARECAP_CLUSTER = 64_u32
  RPI_SMB2_FLAG_SERVERCAP_DFS = 1_u32
  RPI_SMB2_FLAG_SERVERCAP_LEASING = 2_u32
  RPI_SMB2_FLAG_SERVERCAP_LARGEMTU = 4_u32
  RPI_SMB2_FLAG_SERVERCAP_MULTICHANNEL = 8_u32
  RPI_SMB2_FLAG_SERVERCAP_PERSISTENT_HANDLES = 16_u32
  RPI_SMB2_FLAG_SERVERCAP_DIRECTORY_LEASING = 32_u32
  MICROSOFT_WINDOWS_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS = 0_u32
  MICROSOFT_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS = 0_u32
  CODEINTEGRITY_OPTION_ENABLED = 1_u32
  CODEINTEGRITY_OPTION_TESTSIGN = 2_u32
  CODEINTEGRITY_OPTION_UMCI_ENABLED = 4_u32
  CODEINTEGRITY_OPTION_UMCI_AUDITMODE_ENABLED = 8_u32
  CODEINTEGRITY_OPTION_UMCI_EXCLUSIONPATHS_ENABLED = 16_u32
  CODEINTEGRITY_OPTION_TEST_BUILD = 32_u32
  CODEINTEGRITY_OPTION_PREPRODUCTION_BUILD = 64_u32
  CODEINTEGRITY_OPTION_DEBUGMODE_ENABLED = 128_u32
  CODEINTEGRITY_OPTION_FLIGHT_BUILD = 256_u32
  CODEINTEGRITY_OPTION_FLIGHTING_ENABLED = 512_u32
  CODEINTEGRITY_OPTION_HVCI_KMCI_ENABLED = 1024_u32
  CODEINTEGRITY_OPTION_HVCI_KMCI_AUDITMODE_ENABLED = 2048_u32
  CODEINTEGRITY_OPTION_HVCI_KMCI_STRICTMODE_ENABLED = 4096_u32
  CODEINTEGRITY_OPTION_HVCI_IUM_ENABLED = 8192_u32
  FILE_MAXIMUM_DISPOSITION = 5_u32
  FILE_DIRECTORY_FILE = 1_u32
  FILE_WRITE_THROUGH = 2_u32
  FILE_SEQUENTIAL_ONLY = 4_u32
  FILE_NO_INTERMEDIATE_BUFFERING = 8_u32
  FILE_SYNCHRONOUS_IO_ALERT = 16_u32
  FILE_SYNCHRONOUS_IO_NONALERT = 32_u32
  FILE_NON_DIRECTORY_FILE = 64_u32
  FILE_CREATE_TREE_CONNECTION = 128_u32
  FILE_COMPLETE_IF_OPLOCKED = 256_u32
  FILE_NO_EA_KNOWLEDGE = 512_u32
  FILE_OPEN_REMOTE_INSTANCE = 1024_u32
  FILE_RANDOM_ACCESS = 2048_u32
  FILE_DELETE_ON_CLOSE = 4096_u32
  FILE_OPEN_BY_FILE_ID = 8192_u32
  FILE_OPEN_FOR_BACKUP_INTENT = 16384_u32
  FILE_NO_COMPRESSION = 32768_u32
  FILE_OPEN_REQUIRING_OPLOCK = 65536_u32
  FILE_RESERVE_OPFILTER = 1048576_u32
  FILE_OPEN_REPARSE_POINT = 2097152_u32
  FILE_OPEN_NO_RECALL = 4194304_u32
  FILE_OPEN_FOR_FREE_SPACE_QUERY = 8388608_u32
  FILE_VALID_OPTION_FLAGS = 16777215_u32
  FILE_VALID_PIPE_OPTION_FLAGS = 50_u32
  FILE_VALID_MAILSLOT_OPTION_FLAGS = 50_u32
  FILE_VALID_SET_FLAGS = 54_u32
  FILE_SUPERSEDED = 0_u32
  FILE_OPENED = 1_u32
  FILE_CREATED = 2_u32
  FILE_OVERWRITTEN = 3_u32
  FILE_EXISTS = 4_u32
  FILE_DOES_NOT_EXIST = 5_u32
  WINWATCHNOTIFY_START = 0_u32
  WINWATCHNOTIFY_STOP = 1_u32
  WINWATCHNOTIFY_DESTROY = 2_u32
  WINWATCHNOTIFY_CHANGING = 3_u32
  WINWATCHNOTIFY_CHANGED = 4_u32
  RSC_FLAG_INF = 1_u32
  RSC_FLAG_SKIPDISKSPACECHECK = 2_u32
  RSC_FLAG_QUIET = 4_u32
  RSC_FLAG_NGCONV = 8_u32
  RSC_FLAG_UPDHLPDLLS = 16_u32
  RSC_FLAG_DELAYREGISTEROCX = 512_u32
  RSC_FLAG_SETUPAPI = 1024_u32
  ALINF_QUIET = 4_u32
  ALINF_NGCONV = 8_u32
  ALINF_UPDHLPDLLS = 16_u32
  ALINF_BKINSTALL = 32_u32
  ALINF_ROLLBACK = 64_u32
  ALINF_CHECKBKDATA = 128_u32
  ALINF_ROLLBKDOALL = 256_u32
  ALINF_DELAYREGISTEROCX = 512_u32
  AIF_WARNIFSKIP = 1_u32
  AIF_NOSKIP = 2_u32
  AIF_NOVERSIONCHECK = 4_u32
  AIF_FORCE_FILE_IN_USE = 8_u32
  AIF_NOOVERWRITE = 16_u32
  AIF_NO_VERSION_DIALOG = 32_u32
  AIF_REPLACEONLY = 1024_u32
  AIF_NOLANGUAGECHECK = 268435456_u32
  AIF_QUIET = 536870912_u32
  IE4_RESTORE = 1_u32
  IE4_BACKNEW = 2_u32
  IE4_NODELETENEW = 4_u32
  IE4_NOMESSAGES = 8_u32
  IE4_NOPROGRESS = 16_u32
  IE4_NOENUMKEY = 32_u32
  IE4_NO_CRC_MAPPING = 64_u32
  IE4_REGSECTION = 128_u32
  IE4_FRDOALL = 256_u32
  IE4_UPDREFCNT = 512_u32
  IE4_USEREFCNT = 1024_u32
  IE4_EXTRAINCREFCNT = 2048_u32
  IE4_REMOVREGBKDATA = 4096_u32
  ARSR_RESTORE = 1_u32
  ARSR_NOMESSAGES = 8_u32
  ARSR_REGSECTION = 128_u32
  ARSR_REMOVREGBKDATA = 4096_u32
  AFSR_RESTORE = 1_u32
  AFSR_BACKNEW = 2_u32
  AFSR_NODELETENEW = 4_u32
  AFSR_NOMESSAGES = 8_u32
  AFSR_NOPROGRESS = 16_u32
  AFSR_UPDREFCNT = 512_u32
  AFSR_USEREFCNT = 1024_u32
  AFSR_EXTRAINCREFCNT = 2048_u32
  AADBE_ADD_ENTRY = 1_u32
  AADBE_DEL_ENTRY = 2_u32
  ADN_DEL_IF_EMPTY = 1_u32
  ADN_DONT_DEL_SUBDIRS = 2_u32
  ADN_DONT_DEL_DIR = 4_u32
  ADN_DEL_UNC_PATHS = 8_u32
  LIS_QUIET = 1_u32
  LIS_NOGRPCONV = 2_u32
  RUNCMDS_QUIET = 1_u32
  RUNCMDS_NOWAIT = 2_u32
  RUNCMDS_DELAYPOSTCMD = 4_u32
  IME_MAXPROCESS = 32_u32
  CP_HWND = 0_u32
  CP_OPEN = 1_u32
  CP_DIRECT = 2_u32
  CP_LEVEL = 3_u32
  MCW_DEFAULT = 0_u32
  MCW_RECT = 1_u32
  MCW_WINDOW = 2_u32
  MCW_SCREEN = 4_u32
  MCW_VERTICAL = 8_u32
  MCW_HIDDEN = 16_u32
  IME_MODE_ALPHANUMERIC = 1_u32
  IME_MODE_SBCSCHAR = 2_u32
  IME_MODE_KATAKANA = 2_u32
  IME_MODE_HIRAGANA = 4_u32
  IME_MODE_HANJACONVERT = 4_u32
  IME_MODE_DBCSCHAR = 16_u32
  IME_MODE_ROMAN = 32_u32
  IME_MODE_NOROMAN = 64_u32
  IME_MODE_CODEINPUT = 128_u32
  IME_MODE_NOCODEINPUT = 256_u32
  IME_GETIMECAPS = 3_u32
  IME_SETOPEN = 4_u32
  IME_GETOPEN = 5_u32
  IME_GETVERSION = 7_u32
  IME_SETCONVERSIONWINDOW = 8_u32
  IME_MOVEIMEWINDOW = 8_u32
  IME_SETCONVERSIONMODE = 16_u32
  IME_GETCONVERSIONMODE = 17_u32
  IME_SET_MODE = 18_u32
  IME_SENDVKEY = 19_u32
  IME_ENTERWORDREGISTERMODE = 24_u32
  IME_SETCONVERSIONFONTEX = 25_u32
  IME_BANJAtoJUNJA = 19_u32
  IME_JUNJAtoBANJA = 20_u32
  IME_JOHABtoKS = 21_u32
  IME_KStoJOHAB = 22_u32
  IMEA_INIT = 1_u32
  IMEA_NEXT = 2_u32
  IMEA_PREV = 3_u32
  IME_REQUEST_CONVERT = 1_u32
  IME_ENABLE_CONVERT = 2_u32
  INTERIM_WINDOW = 0_u32
  MODE_WINDOW = 1_u32
  HANJA_WINDOW = 2_u32
  IME_RS_ERROR = 1_u32
  IME_RS_NOIME = 2_u32
  IME_RS_TOOLONG = 5_u32
  IME_RS_ILLEGAL = 6_u32
  IME_RS_NOTFOUND = 7_u32
  IME_RS_NOROOM = 10_u32
  IME_RS_DISKERROR = 14_u32
  IME_RS_INVALID = 17_u32
  IME_RS_NEST = 18_u32
  IME_RS_SYSTEMMODAL = 19_u32
  WM_IME_REPORT = 640_u32
  IR_STRINGSTART = 256_u32
  IR_STRINGEND = 257_u32
  IR_OPENCONVERT = 288_u32
  IR_CHANGECONVERT = 289_u32
  IR_CLOSECONVERT = 290_u32
  IR_FULLCONVERT = 291_u32
  IR_IMESELECT = 304_u32
  IR_STRING = 320_u32
  IR_DBCSCHAR = 352_u32
  IR_UNDETERMINE = 368_u32
  IR_STRINGEX = 384_u32
  IR_MODEINFO = 400_u32
  WM_WNT_CONVERTREQUESTEX = 265_u32
  WM_CONVERTREQUEST = 266_u32
  WM_CONVERTRESULT = 267_u32
  WM_INTERIM = 268_u32
  WM_IMEKEYDOWN = 656_u32
  WM_IMEKEYUP = 657_u32
  DELAYLOAD_GPA_FAILURE = 4_u32
  CATID_DeleteBrowsingHistory = "31caf6e4-d6aa-4090-a050-a5ac8972e9ef"
  DELETE_BROWSING_HISTORY_HISTORY = 1_u32
  DELETE_BROWSING_HISTORY_COOKIES = 2_u32
  DELETE_BROWSING_HISTORY_TIF = 4_u32
  DELETE_BROWSING_HISTORY_FORMDATA = 8_u32
  DELETE_BROWSING_HISTORY_PASSWORDS = 16_u32
  DELETE_BROWSING_HISTORY_PRESERVEFAVORITES = 32_u32
  DELETE_BROWSING_HISTORY_DOWNLOADHISTORY = 64_u32
  CameraUIControl = LibC::GUID.new(0x16d5a2be_u32, 0xb1c5_u16, 0x47b3_u16, StaticArray[0x8e_u8, 0xae_u8, 0xcc_u8, 0xbc_u8, 0xf4_u8, 0x52_u8, 0xc7_u8, 0xe8_u8])
  EditionUpgradeHelper = LibC::GUID.new(0x1776df3_u32, 0xb9af_u16, 0x4e50_u16, StaticArray[0x9b_u8, 0x1c_u8, 0x56_u8, 0xe9_u8, 0x31_u8, 0x16_u8, 0xd7_u8, 0x4_u8])
  EditionUpgradeBroker = LibC::GUID.new(0xc4270827_u32, 0x4f39_u16, 0x45df_u16, StaticArray[0x92_u8, 0x88_u8, 0x12_u8, 0xff_u8, 0x6b_u8, 0x85_u8, 0xa9_u8, 0x21_u8])
  DefaultBrowserSyncSettings = LibC::GUID.new(0x3ac83423_u32, 0x3112_u16, 0x4aa6_u16, StaticArray[0x9b_u8, 0x5b_u8, 0x1f_u8, 0xeb_u8, 0x23_u8, 0xd0_u8, 0xc5_u8, 0xf9_u8])

  type D3DHAL_CALLBACKS = Void
  type D3DHAL_GLOBALDRIVERDATA = Void

  alias PFIBER_CALLOUT_ROUTINE = Proc(Void*, Void*)
  alias PQUERYACTCTXW_FUNC = Proc(UInt32, LibC::HANDLE, Void*, UInt32, Void*, LibC::UINT_PTR, LibC::UINT_PTR*, LibC::BOOL)
  alias APPLICATION_RECOVERY_CALLBACK = Proc(Void*, UInt32)
  alias PIO_APC_ROUTINE = Proc(Void*, IO_STATUS_BLOCK*, UInt32, Void)
  alias PWINSTATIONQUERYINFORMATIONW = Proc(LibC::HANDLE, UInt32, WINSTATIONINFOCLASS, Void*, UInt32, UInt32*, BOOLEAN)
  alias PFEATURE_STATE_CHANGE_CALLBACK = Proc(Void*, Void)
  alias ENUM_CALLBACK = Proc(DCISURFACEINFO*, Void*, Void)
  alias WINWATCHNOTIFYPROC = Proc(HWINWATCH, LibC::HANDLE, UInt32, LPARAM, Void)
  alias REGINSTALLA = Proc(HINSTANCE, PSTR, STRTABLEA*, HRESULT)
  alias PWLDP_SETDYNAMICCODETRUST_API = Proc(LibC::HANDLE, HRESULT)
  alias PWLDP_ISDYNAMICCODEPOLICYENABLED_API = Proc(LibC::BOOL*, HRESULT)
  alias PWLDP_QUERYDYNAMICODETRUST_API = Proc(LibC::HANDLE, Void*, UInt32, HRESULT)
  alias PWLDP_QUERYWINDOWSLOCKDOWNMODE_API = Proc(WLDP_WINDOWS_LOCKDOWN_MODE*, HRESULT)
  alias PWLDP_QUERYDEVICESECURITYINFORMATION_API = Proc(WLDP_DEVICE_SECURITY_INFORMATION*, UInt32, UInt32*, HRESULT)
  alias PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API = Proc(WLDP_WINDOWS_LOCKDOWN_RESTRICTION*, HRESULT)
  alias PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API = Proc(WLDP_WINDOWS_LOCKDOWN_RESTRICTION, HRESULT)
  alias PWLDP_ISAPPAPPROVEDBYPOLICY_API = Proc(LibC::LPWSTR, UInt64, HRESULT)
  alias PWLDP_QUERYPOLICYSETTINGENABLED_API = Proc(WLDP_POLICY_SETTING, LibC::BOOL*, HRESULT)
  alias PWLDP_QUERYPOLICYSETTINGENABLED2_API = Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)
  alias PWLDP_ISWCOSPRODUCTIONCONFIGURATION_API = Proc(LibC::BOOL*, HRESULT)
  alias PWLDP_RESETWCOSPRODUCTIONCONFIGURATION_API = Proc(HRESULT)
  alias PWLDP_ISPRODUCTIONCONFIGURATION_API = Proc(LibC::BOOL*, HRESULT)
  alias PWLDP_RESETPRODUCTIONCONFIGURATION_API = Proc(HRESULT)
  alias PDELAYLOAD_FAILURE_DLL_CALLBACK = Proc(UInt32, DELAYLOAD_INFO*, Void*)


  enum TDIENTITY_ENTITY_TYPE : UInt32
    GENERIC_ENTITY = 0
    AT_ENTITY = 640
    CL_NL_ENTITY = 769
    CO_NL_ENTITY = 768
    CL_TL_ENTITY = 1025
    CO_TL_ENTITY = 1024
    ER_ENTITY = 896
    IF_ENTITY = 512
  end

  enum PROC_THREAD_ATTRIBUTE_NUM : Int32
    ProcThreadAttributeParentProcess = 0
    ProcThreadAttributeHandleList = 2
    ProcThreadAttributeGroupAffinity = 3
    ProcThreadAttributePreferredNode = 4
    ProcThreadAttributeIdealProcessor = 5
    ProcThreadAttributeUmsThread = 6
    ProcThreadAttributeMitigationPolicy = 7
    ProcThreadAttributeSecurityCapabilities = 9
    ProcThreadAttributeProtectionLevel = 11
    ProcThreadAttributeJobList = 13
    ProcThreadAttributeChildProcessPolicy = 14
    ProcThreadAttributeAllApplicationPackagesPolicy = 15
    ProcThreadAttributeWin32kFilter = 16
    ProcThreadAttributeSafeOpenPromptOriginClaim = 17
    ProcThreadAttributeDesktopAppPolicy = 18
    ProcThreadAttributePseudoConsole = 22
    ProcThreadAttributeMitigationAuditPolicy = 24
    ProcThreadAttributeMachineType = 25
    ProcThreadAttributeComponentFilter = 26
    ProcThreadAttributeEnableOptionalXStateFeatures = 27
  end

  enum FILE_INFORMATION_CLASS : Int32
    FileDirectoryInformation = 1
  end

  enum SYSTEM_INFORMATION_CLASS : Int32
    SystemBasicInformation = 0
    SystemPerformanceInformation = 2
    SystemTimeOfDayInformation = 3
    SystemProcessInformation = 5
    SystemProcessorPerformanceInformation = 8
    SystemInterruptInformation = 23
    SystemExceptionInformation = 33
    SystemRegistryQuotaInformation = 37
    SystemLookasideInformation = 45
    SystemCodeIntegrityInformation = 103
    SystemPolicyInformation = 134
  end

  enum OBJECT_INFORMATION_CLASS : Int32
    ObjectBasicInformation = 0
    ObjectTypeInformation = 2
  end

  enum KEY_SET_INFORMATION_CLASS : Int32
    KeyWriteTimeInformation = 0
    KeyWow64FlagsInformation = 1
    KeyControlFlagsInformation = 2
    KeySetVirtualizationInformation = 3
    KeySetDebugInformation = 4
    KeySetHandleTagsInformation = 5
    MaxKeySetInfoClass = 6
  end

  enum WINSTATIONINFOCLASS : Int32
    WinStationInformation = 8
  end

  enum CameraUIControlMode : Int32
    Browse = 0
    Linear = 1
  end

  enum CameraUIControlLinearSelectionMode : Int32
    Single = 0
    Multiple = 1
  end

  enum CameraUIControlCaptureMode : Int32
    PhotoOrVideo = 0
    Photo = 1
    Video = 2
  end

  enum CameraUIControlPhotoFormat : Int32
    Jpeg = 0
    Png = 1
    JpegXR = 2
  end

  enum CameraUIControlVideoFormat : Int32
    Mp4 = 0
    Wmv = 1
  end

  enum CameraUIControlViewType : Int32
    SingleItem = 0
    ItemList = 1
  end

  enum FEATURE_CHANGE_TIME : Int32
    FEATURE_CHANGE_TIME_READ = 0
    FEATURE_CHANGE_TIME_MODULE_RELOAD = 1
    FEATURE_CHANGE_TIME_SESSION = 2
    FEATURE_CHANGE_TIME_REBOOT = 3
  end

  enum FEATURE_ENABLED_STATE : Int32
    FEATURE_ENABLED_STATE_DEFAULT = 0
    FEATURE_ENABLED_STATE_DISABLED = 1
    FEATURE_ENABLED_STATE_ENABLED = 2
  end

  enum TDI_TL_IO_CONTROL_TYPE : Int32
    EndpointIoControlType = 0
    SetSockOptIoControlType = 1
    GetSockOptIoControlType = 2
    SocketIoControlType = 3
  end

  enum WLDP_HOST : Int32
    WLDP_HOST_RUNDLL32 = 0
    WLDP_HOST_SVCHOST = 1
    WLDP_HOST_MAX = 2
  end

  enum WLDP_HOST_ID : Int32
    WLDP_HOST_ID_UNKNOWN = 0
    WLDP_HOST_ID_GLOBAL = 1
    WLDP_HOST_ID_VBA = 2
    WLDP_HOST_ID_WSH = 3
    WLDP_HOST_ID_POWERSHELL = 4
    WLDP_HOST_ID_IE = 5
    WLDP_HOST_ID_MSI = 6
    WLDP_HOST_ID_ALL = 7
    WLDP_HOST_ID_MAX = 8
  end

  enum DECISION_LOCATION : Int32
    DECISION_LOCATION_REFRESH_GLOBAL_DATA = 0
    DECISION_LOCATION_PARAMETER_VALIDATION = 1
    DECISION_LOCATION_AUDIT = 2
    DECISION_LOCATION_FAILED_CONVERT_GUID = 3
    DECISION_LOCATION_ENTERPRISE_DEFINED_CLASS_ID = 4
    DECISION_LOCATION_GLOBAL_BUILT_IN_LIST = 5
    DECISION_LOCATION_PROVIDER_BUILT_IN_LIST = 6
    DECISION_LOCATION_ENFORCE_STATE_LIST = 7
    DECISION_LOCATION_NOT_FOUND = 8
    DECISION_LOCATION_UNKNOWN = 9
  end

  enum WLDP_KEY : Int32
    KEY_UNKNOWN = 0
    KEY_OVERRIDE = 1
    KEY_ALL_KEYS = 2
  end

  enum VALUENAME : Int32
    VALUENAME_UNKNOWN = 0
    VALUENAME_ENTERPRISE_DEFINED_CLASS_ID = 1
    VALUENAME_BUILT_IN_LIST = 2
  end

  enum WLDP_WINDOWS_LOCKDOWN_MODE : Int32
    WLDP_WINDOWS_LOCKDOWN_MODE_UNLOCKED = 0
    WLDP_WINDOWS_LOCKDOWN_MODE_TRIAL = 1
    WLDP_WINDOWS_LOCKDOWN_MODE_LOCKED = 2
    WLDP_WINDOWS_LOCKDOWN_MODE_MAX = 3
  end

  enum WLDP_WINDOWS_LOCKDOWN_RESTRICTION : Int32
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NONE = 0
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK = 1
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK_PERMANENT = 2
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_MAX = 3
  end

  enum WLDP_POLICY_SETTING : Int32
    WLDP_POLICY_SETTING_AV_PERF_MODE = 1000
  end

  union IMAGE_THUNK_DATA64_u1_e__Union
    forwarder_string : UInt64
    function : UInt64
    ordinal : UInt64
    address_of_data : UInt64
  end
  union IMAGE_THUNK_DATA32_u1_e__Union
    forwarder_string : UInt32
    function : UInt32
    ordinal : UInt32
    address_of_data : UInt32
  end
  union IMAGE_DELAYLOAD_DESCRIPTOR_Attributes_e__Union
    all_attributes : UInt32
    anonymous : IMAGE_DELAYLOAD_DESCRIPTOR_Attributes_e__Union_Anonymous_e__Struct
  end
  union LDR_DATA_TABLE_ENTRY_Anonymous_e__Union
    check_sum : UInt32
    reserved6 : Void*
  end
  union IO_STATUS_BLOCK_Anonymous_e__Union
    status : NTSTATUS
    pointer : Void*
  end
  union TDI_TL_IO_CONTROL_ENDPOINT_Anonymous_e__Union
    io_control_code : UInt32
    option_name : UInt32
  end
  union DELAYLOAD_PROC_DESCRIPTOR_Description_e__Union
    name : PSTR
    ordinal : UInt32
  end

  struct IMAGE_THUNK_DATA64
    u1 : IMAGE_THUNK_DATA64_u1_e__Union
  end
  struct IMAGE_THUNK_DATA32
    u1 : IMAGE_THUNK_DATA32_u1_e__Union
  end
  struct IMAGE_DELAYLOAD_DESCRIPTOR
    attributes : IMAGE_DELAYLOAD_DESCRIPTOR_Attributes_e__Union
    dll_name_rva : UInt32
    module_handle_rva : UInt32
    import_address_table_rva : UInt32
    import_name_table_rva : UInt32
    bound_import_address_table_rva : UInt32
    unload_information_table_rva : UInt32
    time_date_stamp : UInt32
  end
  struct IMAGE_DELAYLOAD_DESCRIPTOR_Attributes_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG
    size : UInt32
    trigger_id : LibC::LPWSTR
  end
  struct JIT_DEBUG_INFO
    dw_size : UInt32
    dw_processor_architecture : UInt32
    dw_thread_id : UInt32
    dw_reserved0 : UInt32
    lp_exception_address : UInt64
    lp_exception_record : UInt64
    lp_context_record : UInt64
  end
  struct HW_PROFILE_INFOA
    dw_dock_info : UInt32
    sz_hw_profile_guid : CHAR[39]*
    sz_hw_profile_name : CHAR[80]*
  end
  struct HW_PROFILE_INFOW
    dw_dock_info : UInt32
    sz_hw_profile_guid : Char[39]*
    sz_hw_profile_name : Char[80]*
  end
  struct ACTCTX_SECTION_KEYED_DATA_2600
    cb_size : UInt32
    ul_data_format_version : UInt32
    lp_data : Void*
    ul_length : UInt32
    lp_section_global_data : Void*
    ul_section_global_data_length : UInt32
    lp_section_base : Void*
    ul_section_total_length : UInt32
    h_act_ctx : LibC::HANDLE
    ul_assembly_roster_index : UInt32
  end
  struct ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
    lp_information : Void*
    lp_section_base : Void*
    ul_section_length : UInt32
    lp_section_global_data_base : Void*
    ul_section_global_data_length : UInt32
  end
  struct ACTIVATION_CONTEXT_BASIC_INFORMATION
    h_act_ctx : LibC::HANDLE
    dw_flags : UInt32
  end
  struct FILE_CASE_SENSITIVE_INFO
    flags : UInt32
  end
  struct FILE_DISPOSITION_INFO_EX
    flags : UInt32
  end
  struct CLIENT_ID
    unique_process : LibC::HANDLE
    unique_thread : LibC::HANDLE
  end
  struct LDR_DATA_TABLE_ENTRY
    reserved1 : Void[2]**
    in_memory_order_links : LIST_ENTRY
    reserved2 : Void[2]**
    dll_base : Void*
    reserved3 : Void[2]**
    full_dll_name : UNICODE_STRING
    reserved4 : UInt8[8]*
    reserved5 : Void[3]**
    anonymous : LDR_DATA_TABLE_ENTRY_Anonymous_e__Union
    time_date_stamp : UInt32
  end
  struct OBJECT_ATTRIBUTES
    length : UInt32
    root_directory : LibC::HANDLE
    object_name : UNICODE_STRING*
    attributes : UInt32
    security_descriptor : Void*
    security_quality_of_service : Void*
  end
  struct IO_STATUS_BLOCK
    anonymous : IO_STATUS_BLOCK_Anonymous_e__Union
    information : LibC::UINT_PTR
  end
  struct SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION
    idle_time : LARGE_INTEGER
    kernel_time : LARGE_INTEGER
    user_time : LARGE_INTEGER
    reserved1 : LARGE_INTEGER[2]*
    reserved2 : UInt32
  end
  struct SYSTEM_PROCESS_INFORMATION
    next_entry_offset : UInt32
    number_of_threads : UInt32
    reserved1 : UInt8[48]*
    image_name : UNICODE_STRING
    base_priority : Int32
    unique_process_id : LibC::HANDLE
    reserved2 : Void*
    handle_count : UInt32
    session_id : UInt32
    reserved3 : Void*
    peak_virtual_size : LibC::UINT_PTR
    virtual_size : LibC::UINT_PTR
    reserved4 : UInt32
    peak_working_set_size : LibC::UINT_PTR
    working_set_size : LibC::UINT_PTR
    reserved5 : Void*
    quota_paged_pool_usage : LibC::UINT_PTR
    reserved6 : Void*
    quota_non_paged_pool_usage : LibC::UINT_PTR
    pagefile_usage : LibC::UINT_PTR
    peak_pagefile_usage : LibC::UINT_PTR
    private_page_count : LibC::UINT_PTR
    reserved7 : LARGE_INTEGER[6]*
  end
  struct SYSTEM_THREAD_INFORMATION
    reserved1 : LARGE_INTEGER[3]*
    reserved2 : UInt32
    start_address : Void*
    client_id : CLIENT_ID
    priority : Int32
    base_priority : Int32
    reserved3 : UInt32
    thread_state : UInt32
    wait_reason : UInt32
  end
  struct SYSTEM_REGISTRY_QUOTA_INFORMATION
    registry_quota_allowed : UInt32
    registry_quota_used : UInt32
    reserved1 : Void*
  end
  struct SYSTEM_BASIC_INFORMATION
    reserved1 : UInt8[24]*
    reserved2 : Void[4]**
    number_of_processors : Int8
  end
  struct SYSTEM_TIMEOFDAY_INFORMATION
    reserved1 : UInt8[48]*
  end
  struct SYSTEM_PERFORMANCE_INFORMATION
    reserved1 : UInt8[312]*
  end
  struct SYSTEM_EXCEPTION_INFORMATION
    reserved1 : UInt8[16]*
  end
  struct SYSTEM_LOOKASIDE_INFORMATION
    reserved1 : UInt8[32]*
  end
  struct SYSTEM_INTERRUPT_INFORMATION
    reserved1 : UInt8[24]*
  end
  struct SYSTEM_POLICY_INFORMATION
    reserved1 : Void[2]**
    reserved2 : UInt32[3]*
  end
  struct THREAD_NAME_INFORMATION
    thread_name : UNICODE_STRING
  end
  struct SYSTEM_CODEINTEGRITY_INFORMATION
    length : UInt32
    code_integrity_options : UInt32
  end
  struct PUBLIC_OBJECT_BASIC_INFORMATION
    attributes : UInt32
    granted_access : UInt32
    handle_count : UInt32
    pointer_count : UInt32
    reserved : UInt32[10]*
  end
  struct PUBLIC_OBJECT_TYPE_INFORMATION
    type_name : UNICODE_STRING
    reserved : UInt32[22]*
  end
  struct KEY_VALUE_ENTRY
    value_name : UNICODE_STRING*
    data_length : UInt32
    data_offset : UInt32
    type : UInt32
  end
  struct WINSTATIONINFORMATIONW
    reserved2 : UInt8[70]*
    logon_id : UInt32
    reserved3 : UInt8[1140]*
  end
  struct FEATURE_ERROR
    hr : HRESULT
    line_number : UInt16
    file : PSTR
    process : PSTR
    module : PSTR
    caller_return_address_offset : UInt32
    caller_module : PSTR
    message : PSTR
    origin_line_number : UInt16
    origin_file : PSTR
    origin_module : PSTR
    origin_caller_return_address_offset : UInt32
    origin_caller_module : PSTR
    origin_name : PSTR
  end
  struct DCICMD
    dw_command : UInt32
    dw_param1 : UInt32
    dw_param2 : UInt32
    dw_version : UInt32
    dw_reserved : UInt32
  end
  struct DCICREATEINPUT
    cmd : DCICMD
    dw_compression : UInt32
    dw_mask : UInt32[3]*
    dw_width : UInt32
    dw_height : UInt32
    dw_dci_caps : UInt32
    dw_bit_count : UInt32
    lp_surface : Void*
  end
  struct DCISURFACEINFO
    dw_size : UInt32
    dw_dci_caps : UInt32
    dw_compression : UInt32
    dw_mask : UInt32[3]*
    dw_width : UInt32
    dw_height : UInt32
    l_stride : Int32
    dw_bit_count : UInt32
    dw_off_surface : LibC::UINT_PTR
    w_sel_surface : UInt16
    w_reserved : UInt16
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
    dw_reserved3 : UInt32
    begin_access : LibC::IntPtrT
    end_access : LibC::IntPtrT
    destroy_surface : LibC::IntPtrT
  end
  struct DCIENUMINPUT
    cmd : DCICMD
    r_src : RECT
    r_dst : RECT
    enum_callback : LibC::IntPtrT
    lp_context : Void*
  end
  struct DCIOFFSCREEN
    dci_info : DCISURFACEINFO
    draw : LibC::IntPtrT
    set_clip_list : LibC::IntPtrT
    set_destination : LibC::IntPtrT
  end
  struct DCIOVERLAY
    dci_info : DCISURFACEINFO
    dw_chromakey_value : UInt32
    dw_chromakey_mask : UInt32
  end
  struct STRENTRYA
    psz_name : PSTR
    psz_value : PSTR
  end
  struct STRENTRYW
    psz_name : LibC::LPWSTR
    psz_value : LibC::LPWSTR
  end
  struct STRTABLEA
    c_entries : UInt32
    pse : STRENTRYA*
  end
  struct STRTABLEW
    c_entries : UInt32
    pse : STRENTRYW*
  end
  struct CABINFOA
    psz_cab : PSTR
    psz_inf : PSTR
    psz_section : PSTR
    sz_src_path : CHAR[260]*
    dw_flags : UInt32
  end
  struct CABINFOW
    psz_cab : LibC::LPWSTR
    psz_inf : LibC::LPWSTR
    psz_section : LibC::LPWSTR
    sz_src_path : Char[260]*
    dw_flags : UInt32
  end
  struct PERUSERSECTIONA
    sz_guid : CHAR[59]*
    sz_disp_name : CHAR[128]*
    sz_locale : CHAR[10]*
    sz_stub : CHAR[1040]*
    sz_version : CHAR[32]*
    sz_comp_id : CHAR[128]*
    dw_is_installed : UInt32
    b_rollback : LibC::BOOL
  end
  struct PERUSERSECTIONW
    sz_guid : Char[59]*
    sz_disp_name : Char[128]*
    sz_locale : Char[10]*
    sz_stub : Char[1040]*
    sz_version : Char[32]*
    sz_comp_id : Char[128]*
    dw_is_installed : UInt32
    b_rollback : LibC::BOOL
  end
  struct IMESTRUCT
    fnc : UInt32
    w_param : LibC::UINT_PTR
    w_count : UInt32
    dch_source : UInt32
    dch_dest : UInt32
    l_param1 : LPARAM
    l_param2 : LPARAM
    l_param3 : LPARAM
  end
  struct UNDETERMINESTRUCT
    dw_size : UInt32
    u_def_ime_size : UInt32
    u_def_ime_pos : UInt32
    u_undet_text_len : UInt32
    u_undet_text_pos : UInt32
    u_undet_attr_pos : UInt32
    u_cursor_pos : UInt32
    u_delta_start : UInt32
    u_determine_text_len : UInt32
    u_determine_text_pos : UInt32
    u_determine_delim_pos : UInt32
    u_yomi_text_len : UInt32
    u_yomi_text_pos : UInt32
    u_yomi_delim_pos : UInt32
  end
  struct STRINGEXSTRUCT
    dw_size : UInt32
    u_determine_pos : UInt32
    u_determine_delim_pos : UInt32
    u_yomi_pos : UInt32
    u_yomi_delim_pos : UInt32
  end
  struct DATETIME
    year : UInt16
    month : UInt16
    day : UInt16
    hour : UInt16
    min : UInt16
    sec : UInt16
  end
  struct IMEPROA
    h_wnd : HANDLE
    inst_date : DATETIME
    w_version : UInt32
    sz_description : UInt8[50]*
    sz_name : UInt8[80]*
    sz_options : UInt8[30]*
  end
  struct IMEPROW
    h_wnd : HANDLE
    inst_date : DATETIME
    w_version : UInt32
    sz_description : Char[50]*
    sz_name : Char[80]*
    sz_options : Char[30]*
  end
  struct JAVA_TRUST
    cb_size : UInt32
    flag : UInt32
    f_all_active_x_permissions : LibC::BOOL
    f_all_permissions : LibC::BOOL
    dw_encoding_type : UInt32
    pb_java_permissions : UInt8*
    cb_java_permissions : UInt32
    pb_signer : UInt8*
    cb_signer : UInt32
    pwsz_zone : LibC::LPWSTR
    guid_zone : Guid
    h_verify : HRESULT
  end
  struct TDIEntityID
    tei_entity : TDIENTITY_ENTITY_TYPE
    tei_instance : UInt32
  end
  struct TDIObjectID
    toi_entity : TDIEntityID
    toi_class : UInt32
    toi_type : UInt32
    toi_id : UInt32
  end
  struct Tcp_request_query_information_ex_xp
    id : TDIObjectID
    context : LibC::UINT_PTR[2]*
  end
  struct Tcp_request_query_information_ex32_xp
    id : TDIObjectID
    context : UInt32[4]*
  end
  struct Tcp_request_query_information_ex_w2k
    id : TDIObjectID
    context : UInt8[16]*
  end
  struct Tcp_request_set_information_ex
    id : TDIObjectID
    buffer_size : UInt32
    buffer : UInt8[0]*
  end
  struct TDI_TL_IO_CONTROL_ENDPOINT
    type : TDI_TL_IO_CONTROL_TYPE
    level : UInt32
    anonymous : TDI_TL_IO_CONTROL_ENDPOINT_Anonymous_e__Union
    input_buffer : Void*
    input_buffer_length : UInt32
    output_buffer : Void*
    output_buffer_length : UInt32
  end
  struct WLDP_HOST_INFORMATION
    dw_revision : UInt32
    dw_host_id : WLDP_HOST_ID
    sz_source : LibC::LPWSTR
    h_source : LibC::HANDLE
  end
  struct WLDP_DEVICE_SECURITY_INFORMATION
    unlock_id_size : UInt32
    unlock_id : UInt8*
    manufacturer_id_length : UInt32
    manufacturer_id : LibC::LPWSTR
  end
  struct DELAYLOAD_PROC_DESCRIPTOR
    import_described_by_name : UInt32
    description : DELAYLOAD_PROC_DESCRIPTOR_Description_e__Union
  end
  struct DELAYLOAD_INFO
    size : UInt32
    delayload_descriptor : IMAGE_DELAYLOAD_DESCRIPTOR*
    thunk_address : IMAGE_THUNK_DATA64*
    target_dll_name : PSTR
    target_api_descriptor : DELAYLOAD_PROC_DESCRIPTOR
    target_module_base : Void*
    unused : Void*
    last_error : UInt32
  end


  struct ICameraUIControlEventCallbackVTbl
    query_interface : Proc(ICameraUIControlEventCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICameraUIControlEventCallback*, UInt32)
    release : Proc(ICameraUIControlEventCallback*, UInt32)
    on_startup_complete : Proc(ICameraUIControlEventCallback*, Void)
    on_suspend_complete : Proc(ICameraUIControlEventCallback*, Void)
    on_item_captured : Proc(ICameraUIControlEventCallback*, LibC::LPWSTR, Void)
    on_item_deleted : Proc(ICameraUIControlEventCallback*, LibC::LPWSTR, Void)
    on_closed : Proc(ICameraUIControlEventCallback*, Void)
  end

  ICameraUIControlEventCallback_GUID = LibC::GUID.new("1bfa0c2c-fbcd-4776-bda4-88bf974e74f4")
  CLSID_ICameraUIControlEventCallback = "1bfa0c2c-fbcd-4776-bda4-88bf974e74f4"
  struct ICameraUIControlEventCallback
    lpVtbl : ICameraUIControlEventCallbackVTbl*
  end

  struct ICameraUIControlVTbl
    query_interface : Proc(ICameraUIControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICameraUIControl*, UInt32)
    release : Proc(ICameraUIControl*, UInt32)
    show : Proc(ICameraUIControl*, IUnknown, CameraUIControlMode, CameraUIControlLinearSelectionMode, CameraUIControlCaptureMode, CameraUIControlPhotoFormat, CameraUIControlVideoFormat, LibC::BOOL, ICameraUIControlEventCallback, HRESULT)
    close : Proc(ICameraUIControl*, HRESULT)
    suspend : Proc(ICameraUIControl*, LibC::BOOL*, HRESULT)
    resume : Proc(ICameraUIControl*, HRESULT)
    get_current_view_type : Proc(ICameraUIControl*, CameraUIControlViewType*, HRESULT)
    get_active_item : Proc(ICameraUIControl*, UInt8**, HRESULT)
    get_selected_items : Proc(ICameraUIControl*, SAFEARRAY**, HRESULT)
    remove_captured_item : Proc(ICameraUIControl*, LibC::LPWSTR, HRESULT)
  end

  ICameraUIControl_GUID = LibC::GUID.new("b8733adf-3d68-4b8f-bb08-e28a0bed0376")
  CLSID_ICameraUIControl = "b8733adf-3d68-4b8f-bb08-e28a0bed0376"
  struct ICameraUIControl
    lpVtbl : ICameraUIControlVTbl*
  end

  struct IEditionUpgradeHelperVTbl
    query_interface : Proc(IEditionUpgradeHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEditionUpgradeHelper*, UInt32)
    release : Proc(IEditionUpgradeHelper*, UInt32)
    can_upgrade : Proc(IEditionUpgradeHelper*, LibC::BOOL*, HRESULT)
    update_operating_system : Proc(IEditionUpgradeHelper*, LibC::LPWSTR, HRESULT)
    show_product_key_ui : Proc(IEditionUpgradeHelper*, HRESULT)
    get_os_product_content_id : Proc(IEditionUpgradeHelper*, LibC::LPWSTR*, HRESULT)
    get_genuine_local_status : Proc(IEditionUpgradeHelper*, LibC::BOOL*, HRESULT)
  end

  IEditionUpgradeHelper_GUID = LibC::GUID.new("d3e9e342-5deb-43b6-849e-6913b85d503a")
  CLSID_IEditionUpgradeHelper = "d3e9e342-5deb-43b6-849e-6913b85d503a"
  struct IEditionUpgradeHelper
    lpVtbl : IEditionUpgradeHelperVTbl*
  end

  struct IWindowsLockModeHelperVTbl
    query_interface : Proc(IWindowsLockModeHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsLockModeHelper*, UInt32)
    release : Proc(IWindowsLockModeHelper*, UInt32)
    get_s_mode : Proc(IWindowsLockModeHelper*, LibC::BOOL*, HRESULT)
  end

  IWindowsLockModeHelper_GUID = LibC::GUID.new("f342d19e-cc22-4648-bb5d-03ccf75b47c5")
  CLSID_IWindowsLockModeHelper = "f342d19e-cc22-4648-bb5d-03ccf75b47c5"
  struct IWindowsLockModeHelper
    lpVtbl : IWindowsLockModeHelperVTbl*
  end

  struct IEditionUpgradeBrokerVTbl
    query_interface : Proc(IEditionUpgradeBroker*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEditionUpgradeBroker*, UInt32)
    release : Proc(IEditionUpgradeBroker*, UInt32)
    initialize_parent_window : Proc(IEditionUpgradeBroker*, UInt32, HRESULT)
    update_operating_system : Proc(IEditionUpgradeBroker*, UInt8*, HRESULT)
    show_product_key_ui : Proc(IEditionUpgradeBroker*, HRESULT)
    can_upgrade : Proc(IEditionUpgradeBroker*, HRESULT)
  end

  IEditionUpgradeBroker_GUID = LibC::GUID.new("ff19cbcf-9455-4937-b872-6b7929a460af")
  CLSID_IEditionUpgradeBroker = "ff19cbcf-9455-4937-b872-6b7929a460af"
  struct IEditionUpgradeBroker
    lpVtbl : IEditionUpgradeBrokerVTbl*
  end

  struct IContainerActivationHelperVTbl
    query_interface : Proc(IContainerActivationHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContainerActivationHelper*, UInt32)
    release : Proc(IContainerActivationHelper*, UInt32)
    can_activate_client_vm : Proc(IContainerActivationHelper*, Int16*, HRESULT)
  end

  IContainerActivationHelper_GUID = LibC::GUID.new("b524f93f-80d5-4ec7-ae9e-d66e93ade1fa")
  CLSID_IContainerActivationHelper = "b524f93f-80d5-4ec7-ae9e-d66e93ade1fa"
  struct IContainerActivationHelper
    lpVtbl : IContainerActivationHelperVTbl*
  end

  struct IClipServiceNotificationHelperVTbl
    query_interface : Proc(IClipServiceNotificationHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IClipServiceNotificationHelper*, UInt32)
    release : Proc(IClipServiceNotificationHelper*, UInt32)
    show_toast : Proc(IClipServiceNotificationHelper*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
  end

  IClipServiceNotificationHelper_GUID = LibC::GUID.new("c39948f0-6142-44fd-98ca-e1681a8d68b5")
  CLSID_IClipServiceNotificationHelper = "c39948f0-6142-44fd-98ca-e1681a8d68b5"
  struct IClipServiceNotificationHelper
    lpVtbl : IClipServiceNotificationHelperVTbl*
  end

  struct IDefaultBrowserSyncSettingsVTbl
    query_interface : Proc(IDefaultBrowserSyncSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDefaultBrowserSyncSettings*, UInt32)
    release : Proc(IDefaultBrowserSyncSettings*, UInt32)
    is_enabled : Proc(IDefaultBrowserSyncSettings*, LibC::BOOL)
  end

  IDefaultBrowserSyncSettings_GUID = LibC::GUID.new("7a27faad-5ae6-4255-9030-c530936292e3")
  CLSID_IDefaultBrowserSyncSettings = "7a27faad-5ae6-4255-9030-c530936292e3"
  struct IDefaultBrowserSyncSettings
    lpVtbl : IDefaultBrowserSyncSettingsVTbl*
  end

  struct IDeleteBrowsingHistoryVTbl
    query_interface : Proc(IDeleteBrowsingHistory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDeleteBrowsingHistory*, UInt32)
    release : Proc(IDeleteBrowsingHistory*, UInt32)
    delete_browsing_history : Proc(IDeleteBrowsingHistory*, UInt32, HRESULT)
  end

  IDeleteBrowsingHistory_GUID = LibC::GUID.new("cf38ed4b-2be7-4461-8b5e-9a466dc82ae3")
  CLSID_IDeleteBrowsingHistory = "cf38ed4b-2be7-4461-8b5e-9a466dc82ae3"
  struct IDeleteBrowsingHistory
    lpVtbl : IDeleteBrowsingHistoryVTbl*
  end


  # Params # 
  fun RtlGetReturnAddressHijackTarget : LibC::UINT_PTR

  # Params # triggerconfig : CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG* [In]
  fun RtlRaiseCustomSystemEventTrigger(triggerconfig : CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*) : UInt32

  # Params # contract : PSTR [In]
  fun IsApiSetImplemented(contract : PSTR) : LibC::BOOL

  # Params # threadhandle : LibC::HANDLE [In],cycletime : UInt64* [In]
  fun QueryThreadCycleTime(threadhandle : LibC::HANDLE, cycletime : UInt64*) : LibC::BOOL

  # Params # processhandle : LibC::HANDLE [In],cycletime : UInt64* [In]
  fun QueryProcessCycleTime(processhandle : LibC::HANDLE, cycletime : UInt64*) : LibC::BOOL

  # Params # bufferlength : UInt32* [In],processoridlecycletime : UInt64* [In]
  fun QueryIdleProcessorCycleTime(bufferlength : UInt32*, processoridlecycletime : UInt64*) : LibC::BOOL

  # Params # group : UInt16 [In],bufferlength : UInt32* [In],processoridlecycletime : UInt64* [In]
  fun QueryIdleProcessorCycleTimeEx(group : UInt16, bufferlength : UInt32*, processoridlecycletime : UInt64*) : LibC::BOOL

  # Params # lpinterrupttimeprecise : UInt64* [In]
  fun QueryInterruptTimePrecise(lpinterrupttimeprecise : UInt64*)

  # Params # lpunbiasedinterrupttimeprecise : UInt64* [In]
  fun QueryUnbiasedInterruptTimePrecise(lpunbiasedinterrupttimeprecise : UInt64*)

  # Params # lpinterrupttime : UInt64* [In]
  fun QueryInterruptTime(lpinterrupttime : UInt64*)

  # Params # unbiasedtime : UInt64* [In]
  fun QueryUnbiasedInterruptTime(unbiasedtime : UInt64*) : LibC::BOOL

  # Params # lpauxiliarycounterfrequency : UInt64* [In]
  fun QueryAuxiliaryCounterFrequency(lpauxiliarycounterfrequency : UInt64*) : HRESULT

  # Params # ullauxiliarycountervalue : UInt64 [In],lpperformancecountervalue : UInt64* [In],lpconversionerror : UInt64* [In]
  fun ConvertAuxiliaryCounterToPerformanceCounter(ullauxiliarycountervalue : UInt64, lpperformancecountervalue : UInt64*, lpconversionerror : UInt64*) : HRESULT

  # Params # ullperformancecountervalue : UInt64 [In],lpauxiliarycountervalue : UInt64* [In],lpconversionerror : UInt64* [In]
  fun ConvertPerformanceCounterToAuxiliaryCounter(ullperformancecountervalue : UInt64, lpauxiliarycountervalue : UInt64*, lpconversionerror : UInt64*) : HRESULT

  # Params # dwminfree : UInt32 [In]
  fun GlobalCompact(dwminfree : UInt32) : LibC::UINT_PTR

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalFix(hmem : LibC::IntPtrT)

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalUnfix(hmem : LibC::IntPtrT)

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalWire(hmem : LibC::IntPtrT) : Void*

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalUnWire(hmem : LibC::IntPtrT) : LibC::BOOL

  # Params # hmem : LibC::IntPtrT [In],cbnewsize : UInt32 [In]
  fun LocalShrink(hmem : LibC::IntPtrT, cbnewsize : UInt32) : LibC::UINT_PTR

  # Params # uminfree : UInt32 [In]
  fun LocalCompact(uminfree : UInt32) : LibC::UINT_PTR

  # Params # newenvironment : PSTR [In]
  fun SetEnvironmentStringsA(newenvironment : PSTR) : LibC::BOOL

  # Params # unumber : UInt32 [In]
  fun SetHandleCount(unumber : UInt32) : UInt32

  # Params # hdevice : LibC::HANDLE [In]
  fun RequestDeviceWakeup(hdevice : LibC::HANDLE) : LibC::BOOL

  # Params # hdevice : LibC::HANDLE [In]
  fun CancelDeviceWakeupRequest(hdevice : LibC::HANDLE) : LibC::BOOL

  # Params # hmsgindicator : LibC::HANDLE [In],ulmsgcount : UInt32 [In]
  fun SetMessageWaitingIndicator(hmsgindicator : LibC::HANDLE, ulmsgcount : UInt32) : LibC::BOOL

  # Params # nnumber : Int32 [In],nnumerator : Int32 [In],ndenominator : Int32 [In]
  fun MulDiv(nnumber : Int32, nnumerator : Int32, ndenominator : Int32) : Int32

  # Params # pdwquotaallowed : UInt32* [In],pdwquotaused : UInt32* [In]
  fun GetSystemRegistryQuota(pdwquotaallowed : UInt32*, pdwquotaused : UInt32*) : LibC::BOOL

  # Params # lpfiletime : FILETIME* [In],lpfatdate : UInt16* [In],lpfattime : UInt16* [In]
  fun FileTimeToDosDateTime(lpfiletime : FILETIME*, lpfatdate : UInt16*, lpfattime : UInt16*) : LibC::BOOL

  # Params # wfatdate : UInt16 [In],wfattime : UInt16 [In],lpfiletime : FILETIME* [In]
  fun DosDateTimeToFileTime(wfatdate : UInt16, wfattime : UInt16, lpfiletime : FILETIME*) : LibC::BOOL

  # Params # lppathname : PSTR [In],ireadwrite : Int32 [In]
  fun _lopen(lppathname : PSTR, ireadwrite : Int32) : Int32

  # Params # lppathname : PSTR [In],iattribute : Int32 [In]
  fun _lcreat(lppathname : PSTR, iattribute : Int32) : Int32

  # Params # hfile : Int32 [In],lpbuffer : Void* [In],ubytes : UInt32 [In]
  fun _lread(hfile : Int32, lpbuffer : Void*, ubytes : UInt32) : UInt32

  # Params # hfile : Int32 [In],lpbuffer : PSTR [In],ubytes : UInt32 [In]
  fun _lwrite(hfile : Int32, lpbuffer : PSTR, ubytes : UInt32) : UInt32

  # Params # hfile : Int32 [In],lpbuffer : Void* [In],lbytes : Int32 [In]
  fun _hread(hfile : Int32, lpbuffer : Void*, lbytes : Int32) : Int32

  # Params # hfile : Int32 [In],lpbuffer : PSTR [In],lbytes : Int32 [In]
  fun _hwrite(hfile : Int32, lpbuffer : PSTR, lbytes : Int32) : Int32

  # Params # hfile : Int32 [In]
  fun _lclose(hfile : Int32) : Int32

  # Params # hfile : Int32 [In],loffset : Int32 [In],iorigin : Int32 [In]
  fun _llseek(hfile : Int32, loffset : Int32, iorigin : Int32) : Int32

  # Params # hobjecttosignal : LibC::HANDLE [In],hobjecttowaiton : LibC::HANDLE [In],dwmilliseconds : UInt32 [In],balertable : LibC::BOOL [In]
  fun SignalObjectAndWait(hobjecttosignal : LibC::HANDLE, hobjecttowaiton : LibC::HANDLE, dwmilliseconds : UInt32, balertable : LibC::BOOL) : UInt32

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : PSTR [In]
  fun OpenMutexA(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : PSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : PSTR [In]
  fun OpenSemaphoreA(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : PSTR) : LibC::HANDLE

  # Params # lptimerattributes : SECURITY_ATTRIBUTES* [In],bmanualreset : LibC::BOOL [In],lptimername : PSTR [In]
  fun CreateWaitableTimerA(lptimerattributes : SECURITY_ATTRIBUTES*, bmanualreset : LibC::BOOL, lptimername : PSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lptimername : PSTR [In]
  fun OpenWaitableTimerA(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lptimername : PSTR) : LibC::HANDLE

  # Params # lptimerattributes : SECURITY_ATTRIBUTES* [In],lptimername : PSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In]
  fun CreateWaitableTimerExA(lptimerattributes : SECURITY_ATTRIBUTES*, lptimername : PSTR, dwflags : UInt32, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # lpname : PSTR [In],lpguid : PSTR [In],pbuffer : Void* [In],nsize : UInt32 [In]
  fun GetFirmwareEnvironmentVariableA(lpname : PSTR, lpguid : PSTR, pbuffer : Void*, nsize : UInt32) : UInt32

  # Params # lpname : LibC::LPWSTR [In],lpguid : LibC::LPWSTR [In],pbuffer : Void* [In],nsize : UInt32 [In]
  fun GetFirmwareEnvironmentVariableW(lpname : LibC::LPWSTR, lpguid : LibC::LPWSTR, pbuffer : Void*, nsize : UInt32) : UInt32

  # Params # lpname : PSTR [In],lpguid : PSTR [In],pbuffer : Void* [In],nsize : UInt32 [In],pdwattribubutes : UInt32* [In]
  fun GetFirmwareEnvironmentVariableExA(lpname : PSTR, lpguid : PSTR, pbuffer : Void*, nsize : UInt32, pdwattribubutes : UInt32*) : UInt32

  # Params # lpname : LibC::LPWSTR [In],lpguid : LibC::LPWSTR [In],pbuffer : Void* [In],nsize : UInt32 [In],pdwattribubutes : UInt32* [In]
  fun GetFirmwareEnvironmentVariableExW(lpname : LibC::LPWSTR, lpguid : LibC::LPWSTR, pbuffer : Void*, nsize : UInt32, pdwattribubutes : UInt32*) : UInt32

  # Params # lpname : PSTR [In],lpguid : PSTR [In],pvalue : Void* [In],nsize : UInt32 [In]
  fun SetFirmwareEnvironmentVariableA(lpname : PSTR, lpguid : PSTR, pvalue : Void*, nsize : UInt32) : LibC::BOOL

  # Params # lpname : LibC::LPWSTR [In],lpguid : LibC::LPWSTR [In],pvalue : Void* [In],nsize : UInt32 [In]
  fun SetFirmwareEnvironmentVariableW(lpname : LibC::LPWSTR, lpguid : LibC::LPWSTR, pvalue : Void*, nsize : UInt32) : LibC::BOOL

  # Params # lpname : PSTR [In],lpguid : PSTR [In],pvalue : Void* [In],nsize : UInt32 [In],dwattributes : UInt32 [In]
  fun SetFirmwareEnvironmentVariableExA(lpname : PSTR, lpguid : PSTR, pvalue : Void*, nsize : UInt32, dwattributes : UInt32) : LibC::BOOL

  # Params # lpname : LibC::LPWSTR [In],lpguid : LibC::LPWSTR [In],pvalue : Void* [In],nsize : UInt32 [In],dwattributes : UInt32 [In]
  fun SetFirmwareEnvironmentVariableExW(lpname : LibC::LPWSTR, lpguid : LibC::LPWSTR, pvalue : Void*, nsize : UInt32, dwattributes : UInt32) : LibC::BOOL

  # Params # nativevhdboot : LibC::BOOL* [In]
  fun IsNativeVhdBoot(nativevhdboot : LibC::BOOL*) : LibC::BOOL

  # Params # lpappname : PSTR [In],lpkeyname : PSTR [In],ndefault : Int32 [In]
  fun GetProfileIntA(lpappname : PSTR, lpkeyname : PSTR, ndefault : Int32) : UInt32

  # Params # lpappname : LibC::LPWSTR [In],lpkeyname : LibC::LPWSTR [In],ndefault : Int32 [In]
  fun GetProfileIntW(lpappname : LibC::LPWSTR, lpkeyname : LibC::LPWSTR, ndefault : Int32) : UInt32

  # Params # lpappname : PSTR [In],lpkeyname : PSTR [In],lpdefault : PSTR [In],lpreturnedstring : UInt8* [In],nsize : UInt32 [In]
  fun GetProfileStringA(lpappname : PSTR, lpkeyname : PSTR, lpdefault : PSTR, lpreturnedstring : UInt8*, nsize : UInt32) : UInt32

  # Params # lpappname : LibC::LPWSTR [In],lpkeyname : LibC::LPWSTR [In],lpdefault : LibC::LPWSTR [In],lpreturnedstring : Char* [In],nsize : UInt32 [In]
  fun GetProfileStringW(lpappname : LibC::LPWSTR, lpkeyname : LibC::LPWSTR, lpdefault : LibC::LPWSTR, lpreturnedstring : Char*, nsize : UInt32) : UInt32

  # Params # lpappname : PSTR [In],lpkeyname : PSTR [In],lpstring : PSTR [In]
  fun WriteProfileStringA(lpappname : PSTR, lpkeyname : PSTR, lpstring : PSTR) : LibC::BOOL

  # Params # lpappname : LibC::LPWSTR [In],lpkeyname : LibC::LPWSTR [In],lpstring : LibC::LPWSTR [In]
  fun WriteProfileStringW(lpappname : LibC::LPWSTR, lpkeyname : LibC::LPWSTR, lpstring : LibC::LPWSTR) : LibC::BOOL

  # Params # lpappname : PSTR [In],lpreturnedstring : UInt8* [In],nsize : UInt32 [In]
  fun GetProfileSectionA(lpappname : PSTR, lpreturnedstring : UInt8*, nsize : UInt32) : UInt32

  # Params # lpappname : LibC::LPWSTR [In],lpreturnedstring : Char* [In],nsize : UInt32 [In]
  fun GetProfileSectionW(lpappname : LibC::LPWSTR, lpreturnedstring : Char*, nsize : UInt32) : UInt32

  # Params # lpappname : PSTR [In],lpstring : PSTR [In]
  fun WriteProfileSectionA(lpappname : PSTR, lpstring : PSTR) : LibC::BOOL

  # Params # lpappname : LibC::LPWSTR [In],lpstring : LibC::LPWSTR [In]
  fun WriteProfileSectionW(lpappname : LibC::LPWSTR, lpstring : LibC::LPWSTR) : LibC::BOOL

  # Params # lpappname : PSTR [In],lpkeyname : PSTR [In],ndefault : Int32 [In],lpfilename : PSTR [In]
  fun GetPrivateProfileIntA(lpappname : PSTR, lpkeyname : PSTR, ndefault : Int32, lpfilename : PSTR) : UInt32

  # Params # lpappname : LibC::LPWSTR [In],lpkeyname : LibC::LPWSTR [In],ndefault : Int32 [In],lpfilename : LibC::LPWSTR [In]
  fun GetPrivateProfileIntW(lpappname : LibC::LPWSTR, lpkeyname : LibC::LPWSTR, ndefault : Int32, lpfilename : LibC::LPWSTR) : UInt32

  # Params # lpappname : PSTR [In],lpkeyname : PSTR [In],lpdefault : PSTR [In],lpreturnedstring : UInt8* [In],nsize : UInt32 [In],lpfilename : PSTR [In]
  fun GetPrivateProfileStringA(lpappname : PSTR, lpkeyname : PSTR, lpdefault : PSTR, lpreturnedstring : UInt8*, nsize : UInt32, lpfilename : PSTR) : UInt32

  # Params # lpappname : LibC::LPWSTR [In],lpkeyname : LibC::LPWSTR [In],lpdefault : LibC::LPWSTR [In],lpreturnedstring : Char* [In],nsize : UInt32 [In],lpfilename : LibC::LPWSTR [In]
  fun GetPrivateProfileStringW(lpappname : LibC::LPWSTR, lpkeyname : LibC::LPWSTR, lpdefault : LibC::LPWSTR, lpreturnedstring : Char*, nsize : UInt32, lpfilename : LibC::LPWSTR) : UInt32

  # Params # lpappname : PSTR [In],lpkeyname : PSTR [In],lpstring : PSTR [In],lpfilename : PSTR [In]
  fun WritePrivateProfileStringA(lpappname : PSTR, lpkeyname : PSTR, lpstring : PSTR, lpfilename : PSTR) : LibC::BOOL

  # Params # lpappname : LibC::LPWSTR [In],lpkeyname : LibC::LPWSTR [In],lpstring : LibC::LPWSTR [In],lpfilename : LibC::LPWSTR [In]
  fun WritePrivateProfileStringW(lpappname : LibC::LPWSTR, lpkeyname : LibC::LPWSTR, lpstring : LibC::LPWSTR, lpfilename : LibC::LPWSTR) : LibC::BOOL

  # Params # lpappname : PSTR [In],lpreturnedstring : UInt8* [In],nsize : UInt32 [In],lpfilename : PSTR [In]
  fun GetPrivateProfileSectionA(lpappname : PSTR, lpreturnedstring : UInt8*, nsize : UInt32, lpfilename : PSTR) : UInt32

  # Params # lpappname : LibC::LPWSTR [In],lpreturnedstring : Char* [In],nsize : UInt32 [In],lpfilename : LibC::LPWSTR [In]
  fun GetPrivateProfileSectionW(lpappname : LibC::LPWSTR, lpreturnedstring : Char*, nsize : UInt32, lpfilename : LibC::LPWSTR) : UInt32

  # Params # lpappname : PSTR [In],lpstring : PSTR [In],lpfilename : PSTR [In]
  fun WritePrivateProfileSectionA(lpappname : PSTR, lpstring : PSTR, lpfilename : PSTR) : LibC::BOOL

  # Params # lpappname : LibC::LPWSTR [In],lpstring : LibC::LPWSTR [In],lpfilename : LibC::LPWSTR [In]
  fun WritePrivateProfileSectionW(lpappname : LibC::LPWSTR, lpstring : LibC::LPWSTR, lpfilename : LibC::LPWSTR) : LibC::BOOL

  # Params # lpszreturnbuffer : UInt8* [In],nsize : UInt32 [In],lpfilename : PSTR [In]
  fun GetPrivateProfileSectionNamesA(lpszreturnbuffer : UInt8*, nsize : UInt32, lpfilename : PSTR) : UInt32

  # Params # lpszreturnbuffer : Char* [In],nsize : UInt32 [In],lpfilename : LibC::LPWSTR [In]
  fun GetPrivateProfileSectionNamesW(lpszreturnbuffer : Char*, nsize : UInt32, lpfilename : LibC::LPWSTR) : UInt32

  # Params # lpszsection : PSTR [In],lpszkey : PSTR [In],lpstruct : Void* [In],usizestruct : UInt32 [In],szfile : PSTR [In]
  fun GetPrivateProfileStructA(lpszsection : PSTR, lpszkey : PSTR, lpstruct : Void*, usizestruct : UInt32, szfile : PSTR) : LibC::BOOL

  # Params # lpszsection : LibC::LPWSTR [In],lpszkey : LibC::LPWSTR [In],lpstruct : Void* [In],usizestruct : UInt32 [In],szfile : LibC::LPWSTR [In]
  fun GetPrivateProfileStructW(lpszsection : LibC::LPWSTR, lpszkey : LibC::LPWSTR, lpstruct : Void*, usizestruct : UInt32, szfile : LibC::LPWSTR) : LibC::BOOL

  # Params # lpszsection : PSTR [In],lpszkey : PSTR [In],lpstruct : Void* [In],usizestruct : UInt32 [In],szfile : PSTR [In]
  fun WritePrivateProfileStructA(lpszsection : PSTR, lpszkey : PSTR, lpstruct : Void*, usizestruct : UInt32, szfile : PSTR) : LibC::BOOL

  # Params # lpszsection : LibC::LPWSTR [In],lpszkey : LibC::LPWSTR [In],lpstruct : Void* [In],usizestruct : UInt32 [In],szfile : LibC::LPWSTR [In]
  fun WritePrivateProfileStructW(lpszsection : LibC::LPWSTR, lpszkey : LibC::LPWSTR, lpstruct : Void*, usizestruct : UInt32, szfile : LibC::LPWSTR) : LibC::BOOL

  # Params # lp : Void* [In],ucb : LibC::UINT_PTR [In]
  fun IsBadHugeReadPtr(lp : Void*, ucb : LibC::UINT_PTR) : LibC::BOOL

  # Params # lp : Void* [In],ucb : LibC::UINT_PTR [In]
  fun IsBadHugeWritePtr(lp : Void*, ucb : LibC::UINT_PTR) : LibC::BOOL

  # Params # lpbuffer : UInt8* [In],nsize : UInt32* [In]
  fun GetComputerNameA(lpbuffer : UInt8*, nsize : UInt32*) : LibC::BOOL

  # Params # lpbuffer : Char* [In],nsize : UInt32* [In]
  fun GetComputerNameW(lpbuffer : Char*, nsize : UInt32*) : LibC::BOOL

  # Params # hostname : PSTR [In],computername : UInt8* [In],nsize : UInt32* [In]
  fun DnsHostnameToComputerNameA(hostname : PSTR, computername : UInt8*, nsize : UInt32*) : LibC::BOOL

  # Params # hostname : LibC::LPWSTR [In],computername : Char* [In],nsize : UInt32* [In]
  fun DnsHostnameToComputerNameW(hostname : LibC::LPWSTR, computername : Char*, nsize : UInt32*) : LibC::BOOL

  # Params # lpbuffer : UInt8* [In],pcbbuffer : UInt32* [In]
  fun GetUserNameA(lpbuffer : UInt8*, pcbbuffer : UInt32*) : LibC::BOOL

  # Params # lpbuffer : Char* [In],pcbbuffer : UInt32* [In]
  fun GetUserNameW(lpbuffer : Char*, pcbbuffer : UInt32*) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In]
  fun IsTokenUntrusted(tokenhandle : LibC::HANDLE) : LibC::BOOL

  # Params # timerqueue : LibC::HANDLE [In],timer : LibC::HANDLE [In]
  fun CancelTimerQueueTimer(timerqueue : LibC::HANDLE, timer : LibC::HANDLE) : LibC::BOOL

  # Params # lphwprofileinfo : HW_PROFILE_INFOA* [In]
  fun GetCurrentHwProfileA(lphwprofileinfo : HW_PROFILE_INFOA*) : LibC::BOOL

  # Params # lphwprofileinfo : HW_PROFILE_INFOW* [In]
  fun GetCurrentHwProfileW(lphwprofileinfo : HW_PROFILE_INFOW*) : LibC::BOOL

  # Params # targetpartition : LibC::LPWSTR [In],sparepartition : LibC::LPWSTR [In],flags : UInt32 [In]
  fun ReplacePartitionUnit(targetpartition : LibC::LPWSTR, sparepartition : LibC::LPWSTR, flags : UInt32) : LibC::BOOL

  # Params # 
  fun GetThreadEnabledXStateFeatures : UInt64

  # Params # features : UInt64 [In]
  fun EnableProcessOptionalXStateFeatures(features : UInt64) : LibC::BOOL

  # Params # customsystemeventtriggerconfig : CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG* [In]
  fun RaiseCustomSystemEventTrigger(customsystemeventtriggerconfig : CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*) : UInt32

  # Params # string1 : UInt16* [In],string2 : UInt16* [In]
  fun uaw_lstrcmpW(string1 : UInt16*, string2 : UInt16*) : Int32

  # Params # string1 : UInt16* [In],string2 : UInt16* [In]
  fun uaw_lstrcmpiW(string1 : UInt16*, string2 : UInt16*) : Int32

  # Params # string : UInt16* [In]
  fun uaw_lstrlenW(string : UInt16*) : Int32

  # Params # string : UInt16* [In],character : Char [In]
  fun uaw_wcschr(string : UInt16*, character : Char) : UInt16*

  # Params # destination : UInt16* [In],source : UInt16* [In]
  fun uaw_wcscpy(destination : UInt16*, source : UInt16*) : UInt16*

  # Params # string1 : UInt16* [In],string2 : UInt16* [In]
  fun uaw_wcsicmp(string1 : UInt16*, string2 : UInt16*) : Int32

  # Params # string : UInt16* [In]
  fun uaw_wcslen(string : UInt16*) : LibC::UINT_PTR

  # Params # string : UInt16* [In],character : Char [In]
  fun uaw_wcsrchr(string : UInt16*, character : Char) : UInt16*

  # Params # handle : LibC::HANDLE [In]
  fun NtClose(handle : LibC::HANDLE) : NTSTATUS

  # Params # filehandle : LibC::HANDLE* [In],desiredaccess : UInt32 [In],objectattributes : OBJECT_ATTRIBUTES* [In],iostatusblock : IO_STATUS_BLOCK* [In],shareaccess : UInt32 [In],openoptions : UInt32 [In]
  fun NtOpenFile(filehandle : LibC::HANDLE*, desiredaccess : UInt32, objectattributes : OBJECT_ATTRIBUTES*, iostatusblock : IO_STATUS_BLOCK*, shareaccess : UInt32, openoptions : UInt32) : NTSTATUS

  # Params # keyhandle : LibC::HANDLE [In],newname : UNICODE_STRING* [In]
  fun NtRenameKey(keyhandle : LibC::HANDLE, newname : UNICODE_STRING*) : NTSTATUS

  # Params # masterkeyhandle : LibC::HANDLE [In],count : UInt32 [In],subordinateobjects : OBJECT_ATTRIBUTES* [In],event : LibC::HANDLE [In],apcroutine : PIO_APC_ROUTINE [In],apccontext : Void* [In],iostatusblock : IO_STATUS_BLOCK* [In],completionfilter : UInt32 [In],watchtree : BOOLEAN [In],buffer : Void* [In],buffersize : UInt32 [In],asynchronous : BOOLEAN [In]
  fun NtNotifyChangeMultipleKeys(masterkeyhandle : LibC::HANDLE, count : UInt32, subordinateobjects : OBJECT_ATTRIBUTES*, event : LibC::HANDLE, apcroutine : PIO_APC_ROUTINE, apccontext : Void*, iostatusblock : IO_STATUS_BLOCK*, completionfilter : UInt32, watchtree : BOOLEAN, buffer : Void*, buffersize : UInt32, asynchronous : BOOLEAN) : NTSTATUS

  # Params # keyhandle : LibC::HANDLE [In],valueentries : KEY_VALUE_ENTRY* [In],entrycount : UInt32 [In],valuebuffer : Void* [In],bufferlength : UInt32* [In],requiredbufferlength : UInt32* [In]
  fun NtQueryMultipleValueKey(keyhandle : LibC::HANDLE, valueentries : KEY_VALUE_ENTRY*, entrycount : UInt32, valuebuffer : Void*, bufferlength : UInt32*, requiredbufferlength : UInt32*) : NTSTATUS

  # Params # keyhandle : LibC::HANDLE [In],keysetinformationclass : KEY_SET_INFORMATION_CLASS [In],keysetinformation : Void* [In],keysetinformationlength : UInt32 [In]
  fun NtSetInformationKey(keyhandle : LibC::HANDLE, keysetinformationclass : KEY_SET_INFORMATION_CLASS, keysetinformation : Void*, keysetinformationlength : UInt32) : NTSTATUS

  # Params # filehandle : LibC::HANDLE [In],event : LibC::HANDLE [In],apcroutine : PIO_APC_ROUTINE [In],apccontext : Void* [In],iostatusblock : IO_STATUS_BLOCK* [In],iocontrolcode : UInt32 [In],inputbuffer : Void* [In],inputbufferlength : UInt32 [In],outputbuffer : Void* [In],outputbufferlength : UInt32 [In]
  fun NtDeviceIoControlFile(filehandle : LibC::HANDLE, event : LibC::HANDLE, apcroutine : PIO_APC_ROUTINE, apccontext : Void*, iostatusblock : IO_STATUS_BLOCK*, iocontrolcode : UInt32, inputbuffer : Void*, inputbufferlength : UInt32, outputbuffer : Void*, outputbufferlength : UInt32) : NTSTATUS

  # Params # handle : LibC::HANDLE [In],alertable : BOOLEAN [In],timeout : LARGE_INTEGER* [In]
  fun NtWaitForSingleObject(handle : LibC::HANDLE, alertable : BOOLEAN, timeout : LARGE_INTEGER*) : NTSTATUS

  # Params # name : UNICODE_STRING* [In],oemname : STRING* [In],namecontainsspaces : BOOLEAN* [In]
  fun RtlIsNameLegalDOS8Dot3(name : UNICODE_STRING*, oemname : STRING*, namecontainsspaces : BOOLEAN*) : BOOLEAN

  # Params # handle : LibC::HANDLE [In],objectinformationclass : OBJECT_INFORMATION_CLASS [In],objectinformation : Void* [In],objectinformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun NtQueryObject(handle : LibC::HANDLE, objectinformationclass : OBJECT_INFORMATION_CLASS, objectinformation : Void*, objectinformationlength : UInt32, returnlength : UInt32*) : NTSTATUS

  # Params # systeminformationclass : SYSTEM_INFORMATION_CLASS [In],systeminformation : Void* [In],systeminformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun NtQuerySystemInformation(systeminformationclass : SYSTEM_INFORMATION_CLASS, systeminformation : Void*, systeminformationlength : UInt32, returnlength : UInt32*) : NTSTATUS

  # Params # systemtime : LARGE_INTEGER* [In]
  fun NtQuerySystemTime(systemtime : LARGE_INTEGER*) : NTSTATUS

  # Params # maximumtime : UInt32* [In],minimumtime : UInt32* [In],currenttime : UInt32* [In]
  fun NtQueryTimerResolution(maximumtime : UInt32*, minimumtime : UInt32*, currenttime : UInt32*) : NTSTATUS

  # Params # localtime : LARGE_INTEGER* [In],systemtime : LARGE_INTEGER* [In]
  fun RtlLocalTimeToSystemTime(localtime : LARGE_INTEGER*, systemtime : LARGE_INTEGER*) : NTSTATUS

  # Params # time : LARGE_INTEGER* [In],elapsedseconds : UInt32* [In]
  fun RtlTimeToSecondsSince1970(time : LARGE_INTEGER*, elapsedseconds : UInt32*) : BOOLEAN

  # Params # ansistring : STRING* [In]
  fun RtlFreeAnsiString(ansistring : STRING*)

  # Params # unicodestring : UNICODE_STRING* [In]
  fun RtlFreeUnicodeString(unicodestring : UNICODE_STRING*)

  # Params # oemstring : STRING* [In]
  fun RtlFreeOemString(oemstring : STRING*)

  # Params # destinationstring : STRING* [In],sourcestring : Int8* [In]
  fun RtlInitString(destinationstring : STRING*, sourcestring : Int8*)

  # Params # destinationstring : STRING* [In],sourcestring : Int8* [In]
  fun RtlInitStringEx(destinationstring : STRING*, sourcestring : Int8*) : NTSTATUS

  # Params # destinationstring : STRING* [In],sourcestring : Int8* [In]
  fun RtlInitAnsiString(destinationstring : STRING*, sourcestring : Int8*)

  # Params # destinationstring : STRING* [In],sourcestring : Int8* [In]
  fun RtlInitAnsiStringEx(destinationstring : STRING*, sourcestring : Int8*) : NTSTATUS

  # Params # destinationstring : UNICODE_STRING* [In],sourcestring : LibC::LPWSTR [In]
  fun RtlInitUnicodeString(destinationstring : UNICODE_STRING*, sourcestring : LibC::LPWSTR)

  # Params # destinationstring : UNICODE_STRING* [In],sourcestring : STRING* [In],allocatedestinationstring : BOOLEAN [In]
  fun RtlAnsiStringToUnicodeString(destinationstring : UNICODE_STRING*, sourcestring : STRING*, allocatedestinationstring : BOOLEAN) : NTSTATUS

  # Params # destinationstring : STRING* [In],sourcestring : UNICODE_STRING* [In],allocatedestinationstring : BOOLEAN [In]
  fun RtlUnicodeStringToAnsiString(destinationstring : STRING*, sourcestring : UNICODE_STRING*, allocatedestinationstring : BOOLEAN) : NTSTATUS

  # Params # destinationstring : STRING* [In],sourcestring : UNICODE_STRING* [In],allocatedestinationstring : BOOLEAN [In]
  fun RtlUnicodeStringToOemString(destinationstring : STRING*, sourcestring : UNICODE_STRING*, allocatedestinationstring : BOOLEAN) : NTSTATUS

  # Params # bytesinmultibytestring : UInt32* [In],unicodestring : LibC::LPWSTR [In],bytesinunicodestring : UInt32 [In]
  fun RtlUnicodeToMultiByteSize(bytesinmultibytestring : UInt32*, unicodestring : LibC::LPWSTR, bytesinunicodestring : UInt32) : NTSTATUS

  # Params # string : Int8* [In],base : UInt32 [In],value : UInt32* [In]
  fun RtlCharToInteger(string : Int8*, base : UInt32, value : UInt32*) : NTSTATUS

  # Params # seed : UInt32* [In]
  fun RtlUniform(seed : UInt32*) : UInt32

  # Params # featureid : UInt32 [In],changetime : FEATURE_CHANGE_TIME [In]
  fun GetFeatureEnabledState(featureid : UInt32, changetime : FEATURE_CHANGE_TIME) : FEATURE_ENABLED_STATE

  # Params # featureid : UInt32 [In],kind : UInt32 [In],addend : UInt32 [In],originname : PSTR [In]
  fun RecordFeatureUsage(featureid : UInt32, kind : UInt32, addend : UInt32, originname : PSTR)

  # Params # featureid : UInt32 [In],error : FEATURE_ERROR* [In]
  fun RecordFeatureError(featureid : UInt32, error : FEATURE_ERROR*)

  # Params # subscription : FEATURE_STATE_CHANGE_SUBSCRIPTION* [In],callback : PFEATURE_STATE_CHANGE_CALLBACK [In],context : Void* [In]
  fun SubscribeFeatureStateChangeNotification(subscription : FEATURE_STATE_CHANGE_SUBSCRIPTION*, callback : PFEATURE_STATE_CHANGE_CALLBACK, context : Void*)

  # Params # subscription : FEATURE_STATE_CHANGE_SUBSCRIPTION [In]
  fun UnsubscribeFeatureStateChangeNotification(subscription : FEATURE_STATE_CHANGE_SUBSCRIPTION)

  # Params # featureid : UInt32 [In],changetime : FEATURE_CHANGE_TIME [In],payloadid : UInt32* [In],hasnotification : LibC::BOOL* [In]
  fun GetFeatureVariant(featureid : UInt32, changetime : FEATURE_CHANGE_TIME, payloadid : UInt32*, hasnotification : LibC::BOOL*) : UInt32

  # Params # 
  fun DCIOpenProvider : HDC

  # Params # hdc : HDC [In]
  fun DCICloseProvider(hdc : HDC)

  # Params # hdc : HDC [In],lplpsurface : DCISURFACEINFO** [In]
  fun DCICreatePrimary(hdc : HDC, lplpsurface : DCISURFACEINFO**) : Int32

  # Params # hdc : HDC [In],dwcompression : UInt32 [In],dwredmask : UInt32 [In],dwgreenmask : UInt32 [In],dwbluemask : UInt32 [In],dwwidth : UInt32 [In],dwheight : UInt32 [In],dwdcicaps : UInt32 [In],dwbitcount : UInt32 [In],lplpsurface : DCIOFFSCREEN** [In]
  fun DCICreateOffscreen(hdc : HDC, dwcompression : UInt32, dwredmask : UInt32, dwgreenmask : UInt32, dwbluemask : UInt32, dwwidth : UInt32, dwheight : UInt32, dwdcicaps : UInt32, dwbitcount : UInt32, lplpsurface : DCIOFFSCREEN**) : Int32

  # Params # hdc : HDC [In],lpoffscreensurf : Void* [In],lplpsurface : DCIOVERLAY** [In]
  fun DCICreateOverlay(hdc : HDC, lpoffscreensurf : Void*, lplpsurface : DCIOVERLAY**) : Int32

  # Params # hdc : HDC [In],lprdst : RECT* [In],lprsrc : RECT* [In],lpfncallback : Void* [In],lpcontext : Void* [In]
  fun DCIEnum(hdc : HDC, lprdst : RECT*, lprsrc : RECT*, lpfncallback : Void*, lpcontext : Void*) : Int32

  # Params # pdci : DCIOFFSCREEN* [In],srcrc : RECT* [In],destrc : RECT* [In],prd : RGNDATA* [In]
  fun DCISetSrcDestClip(pdci : DCIOFFSCREEN*, srcrc : RECT*, destrc : RECT*, prd : RGNDATA*) : Int32

  # Params # hwnd : LibC::HANDLE [In]
  fun WinWatchOpen(hwnd : LibC::HANDLE) : HWINWATCH

  # Params # hww : HWINWATCH [In]
  fun WinWatchClose(hww : HWINWATCH)

  # Params # hww : HWINWATCH [In],prc : RECT* [In],size : UInt32 [In],prd : RGNDATA* [In]
  fun WinWatchGetClipList(hww : HWINWATCH, prc : RECT*, size : UInt32, prd : RGNDATA*) : UInt32

  # Params # hww : HWINWATCH [In]
  fun WinWatchDidStatusChange(hww : HWINWATCH) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],size : UInt32 [In],prd : RGNDATA* [In]
  fun GetWindowRegionData(hwnd : LibC::HANDLE, size : UInt32, prd : RGNDATA*) : UInt32

  # Params # hdc : HDC [In],size : UInt32 [In],prd : RGNDATA* [In]
  fun GetDCRegionData(hdc : HDC, size : UInt32, prd : RGNDATA*) : UInt32

  # Params # hww : HWINWATCH [In],notifycallback : WINWATCHNOTIFYPROC [In],notifyparam : LPARAM [In]
  fun WinWatchNotify(hww : HWINWATCH, notifycallback : WINWATCHNOTIFYPROC, notifyparam : LPARAM) : LibC::BOOL

  # Params # pdci : DCISURFACEINFO* [In]
  fun DCIEndAccess(pdci : DCISURFACEINFO*)

  # Params # pdci : DCISURFACEINFO* [In],x : Int32 [In],y : Int32 [In],dx : Int32 [In],dy : Int32 [In]
  fun DCIBeginAccess(pdci : DCISURFACEINFO*, x : Int32, y : Int32, dx : Int32, dy : Int32) : Int32

  # Params # pdci : DCISURFACEINFO* [In]
  fun DCIDestroy(pdci : DCISURFACEINFO*)

  # Params # pdci : DCIOFFSCREEN* [In]
  fun DCIDraw(pdci : DCIOFFSCREEN*) : Int32

  # Params # pdci : DCIOFFSCREEN* [In],prd : RGNDATA* [In]
  fun DCISetClipList(pdci : DCIOFFSCREEN*, prd : RGNDATA*) : Int32

  # Params # pdci : DCIOFFSCREEN* [In],dst : RECT* [In],src : RECT* [In]
  fun DCISetDestination(pdci : DCIOFFSCREEN*, dst : RECT*, src : RECT*) : Int32

  # Params # 
  fun GdiEntry13 : UInt32

  # Params # hwnd : LibC::HANDLE [In],szcmdname : PSTR [In],szinfsection : PSTR [In],szdir : PSTR [In],lpsztitle : PSTR [In],phexe : LibC::HANDLE* [In],dwflags : UInt32 [In],pvreserved : Void* [In]
  fun RunSetupCommandA(hwnd : LibC::HANDLE, szcmdname : PSTR, szinfsection : PSTR, szdir : PSTR, lpsztitle : PSTR, phexe : LibC::HANDLE*, dwflags : UInt32, pvreserved : Void*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],szcmdname : LibC::LPWSTR [In],szinfsection : LibC::LPWSTR [In],szdir : LibC::LPWSTR [In],lpsztitle : LibC::LPWSTR [In],phexe : LibC::HANDLE* [In],dwflags : UInt32 [In],pvreserved : Void* [In]
  fun RunSetupCommandW(hwnd : LibC::HANDLE, szcmdname : LibC::LPWSTR, szinfsection : LibC::LPWSTR, szdir : LibC::LPWSTR, lpsztitle : LibC::LPWSTR, phexe : LibC::HANDLE*, dwflags : UInt32, pvreserved : Void*) : HRESULT

  # Params # 
  fun NeedRebootInit : UInt32

  # Params # dwrebootcheck : UInt32 [In]
  fun NeedReboot(dwrebootcheck : UInt32) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pszinf : PSTR [In],pszsec : PSTR [In],dwreserved : UInt32 [In]
  fun RebootCheckOnInstallA(hwnd : LibC::HANDLE, pszinf : PSTR, pszsec : PSTR, dwreserved : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],pszinf : LibC::LPWSTR [In],pszsec : LibC::LPWSTR [In],dwreserved : UInt32 [In]
  fun RebootCheckOnInstallW(hwnd : LibC::HANDLE, pszinf : LibC::LPWSTR, pszsec : LibC::LPWSTR, dwreserved : UInt32) : HRESULT

  # Params # pszinffilename : PSTR [In],pszinstallsection : PSTR [In],psztranslatesection : PSTR [In],psztranslatekey : PSTR [In],pszbuffer : UInt8* [In],cchbuffer : UInt32 [In],pdwrequiredsize : UInt32* [In],pvreserved : Void* [In]
  fun TranslateInfStringA(pszinffilename : PSTR, pszinstallsection : PSTR, psztranslatesection : PSTR, psztranslatekey : PSTR, pszbuffer : UInt8*, cchbuffer : UInt32, pdwrequiredsize : UInt32*, pvreserved : Void*) : HRESULT

  # Params # pszinffilename : LibC::LPWSTR [In],pszinstallsection : LibC::LPWSTR [In],psztranslatesection : LibC::LPWSTR [In],psztranslatekey : LibC::LPWSTR [In],pszbuffer : Char* [In],cchbuffer : UInt32 [In],pdwrequiredsize : UInt32* [In],pvreserved : Void* [In]
  fun TranslateInfStringW(pszinffilename : LibC::LPWSTR, pszinstallsection : LibC::LPWSTR, psztranslatesection : LibC::LPWSTR, psztranslatekey : LibC::LPWSTR, pszbuffer : Char*, cchbuffer : UInt32, pdwrequiredsize : UInt32*, pvreserved : Void*) : HRESULT

  # Params # hmod : HINSTANCE [In],pszsection : PSTR [In],psttable : STRTABLEA* [In]
  fun RegInstallA(hmod : HINSTANCE, pszsection : PSTR, psttable : STRTABLEA*) : HRESULT

  # Params # hmod : HINSTANCE [In],pszsection : LibC::LPWSTR [In],psttable : STRTABLEW* [In]
  fun RegInstallW(hmod : HINSTANCE, pszsection : LibC::LPWSTR, psttable : STRTABLEW*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],hinstance : HINSTANCE [In],pszparms : LibC::LPWSTR [In],nshow : Int32 [In]
  fun LaunchINFSectionExW(hwnd : LibC::HANDLE, hinstance : HINSTANCE, pszparms : LibC::LPWSTR, nshow : Int32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],pcab : CABINFOA* [In],preserved : Void* [In]
  fun ExecuteCabA(hwnd : LibC::HANDLE, pcab : CABINFOA*, preserved : Void*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],pcab : CABINFOW* [In],preserved : Void* [In]
  fun ExecuteCabW(hwnd : LibC::HANDLE, pcab : CABINFOW*, preserved : Void*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],lpszsourcedir : PSTR [In],lpszsourcefile : PSTR [In],lpszdestdir : PSTR [In],lpszdestfile : PSTR [In],dwflags : UInt32 [In],dwreserved : UInt32 [In]
  fun AdvInstallFileA(hwnd : LibC::HANDLE, lpszsourcedir : PSTR, lpszsourcefile : PSTR, lpszdestdir : PSTR, lpszdestfile : PSTR, dwflags : UInt32, dwreserved : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],lpszsourcedir : LibC::LPWSTR [In],lpszsourcefile : LibC::LPWSTR [In],lpszdestdir : LibC::LPWSTR [In],lpszdestfile : LibC::LPWSTR [In],dwflags : UInt32 [In],dwreserved : UInt32 [In]
  fun AdvInstallFileW(hwnd : LibC::HANDLE, lpszsourcedir : LibC::LPWSTR, lpszsourcefile : LibC::LPWSTR, lpszdestdir : LibC::LPWSTR, lpszdestfile : LibC::LPWSTR, dwflags : UInt32, dwreserved : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitlestring : PSTR [In],hkbckupkey : HKEY [In],pcszrootkey : PSTR [In],pcszsubkey : PSTR [In],pcszvaluename : PSTR [In],dwflags : UInt32 [In]
  fun RegSaveRestoreA(hwnd : LibC::HANDLE, psztitlestring : PSTR, hkbckupkey : HKEY, pcszrootkey : PSTR, pcszsubkey : PSTR, pcszvaluename : PSTR, dwflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitlestring : LibC::LPWSTR [In],hkbckupkey : HKEY [In],pcszrootkey : LibC::LPWSTR [In],pcszsubkey : LibC::LPWSTR [In],pcszvaluename : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun RegSaveRestoreW(hwnd : LibC::HANDLE, psztitlestring : LibC::LPWSTR, hkbckupkey : HKEY, pcszrootkey : LibC::LPWSTR, pcszsubkey : LibC::LPWSTR, pcszvaluename : LibC::LPWSTR, dwflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitle : PSTR [In],pszinf : PSTR [In],pszsection : PSTR [In],hhklmbackkey : HKEY [In],hhkcubackkey : HKEY [In],dwflags : UInt32 [In]
  fun RegSaveRestoreOnINFA(hwnd : LibC::HANDLE, psztitle : PSTR, pszinf : PSTR, pszsection : PSTR, hhklmbackkey : HKEY, hhkcubackkey : HKEY, dwflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitle : LibC::LPWSTR [In],pszinf : LibC::LPWSTR [In],pszsection : LibC::LPWSTR [In],hhklmbackkey : HKEY [In],hhkcubackkey : HKEY [In],dwflags : UInt32 [In]
  fun RegSaveRestoreOnINFW(hwnd : LibC::HANDLE, psztitle : LibC::LPWSTR, pszinf : LibC::LPWSTR, pszsection : LibC::LPWSTR, hhklmbackkey : HKEY, hhkcubackkey : HKEY, dwflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitlestring : PSTR [In],hkbckupkey : HKEY [In]
  fun RegRestoreAllA(hwnd : LibC::HANDLE, psztitlestring : PSTR, hkbckupkey : HKEY) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitlestring : LibC::LPWSTR [In],hkbckupkey : HKEY [In]
  fun RegRestoreAllW(hwnd : LibC::HANDLE, psztitlestring : LibC::LPWSTR, hkbckupkey : HKEY) : HRESULT

  # Params # hdlg : LibC::HANDLE [In],lpfilelist : LibC::LPWSTR [In],lpdir : LibC::LPWSTR [In],lpbasename : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun FileSaveRestoreW(hdlg : LibC::HANDLE, lpfilelist : LibC::LPWSTR, lpdir : LibC::LPWSTR, lpbasename : LibC::LPWSTR, dwflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitle : PSTR [In],pszinf : PSTR [In],pszsection : PSTR [In],pszbackupdir : PSTR [In],pszbasebackupfile : PSTR [In],dwflags : UInt32 [In]
  fun FileSaveRestoreOnINFA(hwnd : LibC::HANDLE, psztitle : PSTR, pszinf : PSTR, pszsection : PSTR, pszbackupdir : PSTR, pszbasebackupfile : PSTR, dwflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],psztitle : LibC::LPWSTR [In],pszinf : LibC::LPWSTR [In],pszsection : LibC::LPWSTR [In],pszbackupdir : LibC::LPWSTR [In],pszbasebackupfile : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun FileSaveRestoreOnINFW(hwnd : LibC::HANDLE, psztitle : LibC::LPWSTR, pszinf : LibC::LPWSTR, pszsection : LibC::LPWSTR, pszbackupdir : LibC::LPWSTR, pszbasebackupfile : LibC::LPWSTR, dwflags : UInt32) : HRESULT

  # Params # lpcszfilelist : PSTR [In],lpcszbackupdir : PSTR [In],lpcszbasename : PSTR [In],dwflags : UInt32 [In]
  fun AddDelBackupEntryA(lpcszfilelist : PSTR, lpcszbackupdir : PSTR, lpcszbasename : PSTR, dwflags : UInt32) : HRESULT

  # Params # lpcszfilelist : LibC::LPWSTR [In],lpcszbackupdir : LibC::LPWSTR [In],lpcszbasename : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun AddDelBackupEntryW(lpcszfilelist : LibC::LPWSTR, lpcszbackupdir : LibC::LPWSTR, lpcszbasename : LibC::LPWSTR, dwflags : UInt32) : HRESULT

  # Params # lpfilelist : PSTR [In],lpdir : PSTR [In],lpbasename : PSTR [In]
  fun FileSaveMarkNotExistA(lpfilelist : PSTR, lpdir : PSTR, lpbasename : PSTR) : HRESULT

  # Params # lpfilelist : LibC::LPWSTR [In],lpdir : LibC::LPWSTR [In],lpbasename : LibC::LPWSTR [In]
  fun FileSaveMarkNotExistW(lpfilelist : LibC::LPWSTR, lpdir : LibC::LPWSTR, lpbasename : LibC::LPWSTR) : HRESULT

  # Params # lpszfilename : PSTR [In],pdwmsver : UInt32* [In],pdwlsver : UInt32* [In],bversion : LibC::BOOL [In]
  fun GetVersionFromFileA(lpszfilename : PSTR, pdwmsver : UInt32*, pdwlsver : UInt32*, bversion : LibC::BOOL) : HRESULT

  # Params # lpszfilename : LibC::LPWSTR [In],pdwmsver : UInt32* [In],pdwlsver : UInt32* [In],bversion : LibC::BOOL [In]
  fun GetVersionFromFileW(lpszfilename : LibC::LPWSTR, pdwmsver : UInt32*, pdwlsver : UInt32*, bversion : LibC::BOOL) : HRESULT

  # Params # lpszfilename : PSTR [In],pdwmsver : UInt32* [In],pdwlsver : UInt32* [In],bversion : LibC::BOOL [In]
  fun GetVersionFromFileExA(lpszfilename : PSTR, pdwmsver : UInt32*, pdwlsver : UInt32*, bversion : LibC::BOOL) : HRESULT

  # Params # lpszfilename : LibC::LPWSTR [In],pdwmsver : UInt32* [In],pdwlsver : UInt32* [In],bversion : LibC::BOOL [In]
  fun GetVersionFromFileExW(lpszfilename : LibC::LPWSTR, pdwmsver : UInt32*, pdwlsver : UInt32*, bversion : LibC::BOOL) : HRESULT

  # Params # dwreserved : UInt32 [In],lpdwreserved : UInt32* [In]
  fun IsNTAdmin(dwreserved : UInt32, lpdwreserved : UInt32*) : LibC::BOOL

  # Params # pszfileordirname : PSTR [In],dwflags : UInt32 [In]
  fun DelNodeA(pszfileordirname : PSTR, dwflags : UInt32) : HRESULT

  # Params # pszfileordirname : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun DelNodeW(pszfileordirname : LibC::LPWSTR, dwflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],hinstance : HINSTANCE [In],pszparms : LibC::LPWSTR [In],nshow : Int32 [In]
  fun DelNodeRunDLL32W(hwnd : LibC::HANDLE, hinstance : HINSTANCE, pszparms : LibC::LPWSTR, nshow : Int32) : HRESULT

  # Params # pszinffilename : PSTR [In],pszinstallsection : PSTR [In],dwflags : UInt32 [In],phinf : Void** [In],pvreserved : Void* [In]
  fun OpenINFEngineA(pszinffilename : PSTR, pszinstallsection : PSTR, dwflags : UInt32, phinf : Void**, pvreserved : Void*) : HRESULT

  # Params # pszinffilename : LibC::LPWSTR [In],pszinstallsection : LibC::LPWSTR [In],dwflags : UInt32 [In],phinf : Void** [In],pvreserved : Void* [In]
  fun OpenINFEngineW(pszinffilename : LibC::LPWSTR, pszinstallsection : LibC::LPWSTR, dwflags : UInt32, phinf : Void**, pvreserved : Void*) : HRESULT

  # Params # hinf : Void* [In],pszinffilename : PSTR [In],psztranslatesection : PSTR [In],psztranslatekey : PSTR [In],pszbuffer : UInt8* [In],dwbuffersize : UInt32 [In],pdwrequiredsize : UInt32* [In],pvreserved : Void* [In]
  fun TranslateInfStringExA(hinf : Void*, pszinffilename : PSTR, psztranslatesection : PSTR, psztranslatekey : PSTR, pszbuffer : UInt8*, dwbuffersize : UInt32, pdwrequiredsize : UInt32*, pvreserved : Void*) : HRESULT

  # Params # hinf : Void* [In],pszinffilename : LibC::LPWSTR [In],psztranslatesection : LibC::LPWSTR [In],psztranslatekey : LibC::LPWSTR [In],pszbuffer : Char* [In],dwbuffersize : UInt32 [In],pdwrequiredsize : UInt32* [In],pvreserved : Void* [In]
  fun TranslateInfStringExW(hinf : Void*, pszinffilename : LibC::LPWSTR, psztranslatesection : LibC::LPWSTR, psztranslatekey : LibC::LPWSTR, pszbuffer : Char*, dwbuffersize : UInt32, pdwrequiredsize : UInt32*, pvreserved : Void*) : HRESULT

  # Params # hinf : Void* [In]
  fun CloseINFEngine(hinf : Void*) : HRESULT

  # Params # pszcabname : PSTR [In],pszexpanddir : PSTR [In],dwflags : UInt32 [In],pszfilelist : PSTR [In],lpreserved : Void* [In],dwreserved : UInt32 [In]
  fun ExtractFilesA(pszcabname : PSTR, pszexpanddir : PSTR, dwflags : UInt32, pszfilelist : PSTR, lpreserved : Void*, dwreserved : UInt32) : HRESULT

  # Params # pszcabname : LibC::LPWSTR [In],pszexpanddir : LibC::LPWSTR [In],dwflags : UInt32 [In],pszfilelist : LibC::LPWSTR [In],lpreserved : Void* [In],dwreserved : UInt32 [In]
  fun ExtractFilesW(pszcabname : LibC::LPWSTR, pszexpanddir : LibC::LPWSTR, dwflags : UInt32, pszfilelist : LibC::LPWSTR, lpreserved : Void*, dwreserved : UInt32) : HRESULT

  # Params # hwndowner : LibC::HANDLE [In],hinstance : HINSTANCE [In],pszparams : LibC::LPWSTR [In],nshow : Int32 [In]
  fun LaunchINFSectionW(hwndowner : LibC::HANDLE, hinstance : HINSTANCE, pszparams : LibC::LPWSTR, nshow : Int32) : Int32

  # Params # hwnd : LibC::HANDLE [In],hinstance : HINSTANCE [In],pszparms : PSTR [In],nshow : Int32 [In]
  fun UserInstStubWrapperA(hwnd : LibC::HANDLE, hinstance : HINSTANCE, pszparms : PSTR, nshow : Int32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],hinstance : HINSTANCE [In],pszparms : LibC::LPWSTR [In],nshow : Int32 [In]
  fun UserInstStubWrapperW(hwnd : LibC::HANDLE, hinstance : HINSTANCE, pszparms : LibC::LPWSTR, nshow : Int32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],hinstance : HINSTANCE [In],pszparms : PSTR [In],nshow : Int32 [In]
  fun UserUnInstStubWrapperA(hwnd : LibC::HANDLE, hinstance : HINSTANCE, pszparms : PSTR, nshow : Int32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],hinstance : HINSTANCE [In],pszparms : LibC::LPWSTR [In],nshow : Int32 [In]
  fun UserUnInstStubWrapperW(hwnd : LibC::HANDLE, hinstance : HINSTANCE, pszparms : LibC::LPWSTR, nshow : Int32) : HRESULT

  # Params # pperuser : PERUSERSECTIONA* [In]
  fun SetPerUserSecValuesA(pperuser : PERUSERSECTIONA*) : HRESULT

  # Params # pperuser : PERUSERSECTIONW* [In]
  fun SetPerUserSecValuesW(pperuser : PERUSERSECTIONW*) : HRESULT

  # Params # param0 : LibC::HANDLE [In],param1 : LPARAM [In]
  fun SendIMEMessageExA(param0 : LibC::HANDLE, param1 : LPARAM) : LRESULT

  # Params # param0 : LibC::HANDLE [In],param1 : LPARAM [In]
  fun SendIMEMessageExW(param0 : LibC::HANDLE, param1 : LPARAM) : LRESULT

  # Params # param0 : LibC::HANDLE [In],param1 : IMEPROA* [In]
  fun IMPGetIMEA(param0 : LibC::HANDLE, param1 : IMEPROA*) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : IMEPROW* [In]
  fun IMPGetIMEW(param0 : LibC::HANDLE, param1 : IMEPROW*) : LibC::BOOL

  # Params # param0 : IMEPROA* [In]
  fun IMPQueryIMEA(param0 : IMEPROA*) : LibC::BOOL

  # Params # param0 : IMEPROW* [In]
  fun IMPQueryIMEW(param0 : IMEPROW*) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : IMEPROA* [In]
  fun IMPSetIMEA(param0 : LibC::HANDLE, param1 : IMEPROA*) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : IMEPROW* [In]
  fun IMPSetIMEW(param0 : LibC::HANDLE, param1 : IMEPROW*) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In]
  fun WINNLSGetIMEHotkey(param0 : LibC::HANDLE) : UInt32

  # Params # param0 : LibC::HANDLE [In],param1 : LibC::BOOL [In]
  fun WINNLSEnableIME(param0 : LibC::HANDLE, param1 : LibC::BOOL) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In]
  fun WINNLSGetEnableStatus(param0 : LibC::HANDLE) : LibC::BOOL

  # Params # objectclsid : Guid* [In],bshimifnecessary : LibC::BOOL [In],pullflags : UInt64* [In]
  fun ApphelpCheckShellObject(objectclsid : Guid*, bshimifnecessary : LibC::BOOL, pullflags : UInt64*) : LibC::BOOL

  # Params # hostinformation : WLDP_HOST_INFORMATION* [In],lockdownstate : UInt32* [In],lockdownflags : UInt32 [In]
  fun WldpGetLockdownPolicy(hostinformation : WLDP_HOST_INFORMATION*, lockdownstate : UInt32*, lockdownflags : UInt32) : HRESULT

  # Params # classid : Guid* [In],hostinformation : WLDP_HOST_INFORMATION* [In],isapproved : LibC::BOOL* [In],optionalflags : UInt32 [In]
  fun WldpIsClassInApprovedList(classid : Guid*, hostinformation : WLDP_HOST_INFORMATION*, isapproved : LibC::BOOL*, optionalflags : UInt32) : HRESULT

  # Params # filehandle : LibC::HANDLE [In]
  fun WldpSetDynamicCodeTrust(filehandle : LibC::HANDLE) : HRESULT

  # Params # isenabled : LibC::BOOL* [In]
  fun WldpIsDynamicCodePolicyEnabled(isenabled : LibC::BOOL*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],baseimage : Void* [In],imagesize : UInt32 [In]
  fun WldpQueryDynamicCodeTrust(filehandle : LibC::HANDLE, baseimage : Void*, imagesize : UInt32) : HRESULT

  # Params # information : WLDP_DEVICE_SECURITY_INFORMATION* [In],informationlength : UInt32 [In],returnlength : UInt32* [In]
  fun WldpQueryDeviceSecurityInformation(information : WLDP_DEVICE_SECURITY_INFORMATION*, informationlength : UInt32, returnlength : UInt32*) : HRESULT
end
