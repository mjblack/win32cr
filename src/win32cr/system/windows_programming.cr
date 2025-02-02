require "./../foundation.cr"
require "./kernel.cr"
require "./com.cr"
require "./../security.cr"
require "./../graphics/gdi.cr"
require "./registry.cr"

module Win32cr::System::WindowsProgramming
  extend self
  alias HWINWATCH = LibC::IntPtrT
  alias FEATURE_STATE_CHANGE_SUBSCRIPTION = LibC::IntPtrT
  alias FH_SERVICE_PIPE_HANDLE = LibC::IntPtrT
  alias PFIBER_CALLOUT_ROUTINE = Proc(Void*, Void*)

  alias PQUERYACTCTXW_FUNC = Proc(UInt32, Win32cr::Foundation::HANDLE, Void*, UInt32, Void*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::BOOL)

  alias APPLICATION_RECOVERY_CALLBACK = Proc(Void*, UInt32)

  alias PIO_APC_ROUTINE = Proc(Void*, Win32cr::System::WindowsProgramming::IO_STATUS_BLOCK*, UInt32, Void)

  alias PWINSTATIONQUERYINFORMATIONW = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::System::WindowsProgramming::WINSTATIONINFOCLASS, Void*, UInt32, UInt32*, Win32cr::Foundation::BOOLEAN)

  alias PFEATURE_STATE_CHANGE_CALLBACK = Proc(Void*, Void)

  alias ENUM_CALLBACK = Proc(Win32cr::System::WindowsProgramming::DCISURFACEINFO*, Void*, Void)

  alias WINWATCHNOTIFYPROC = Proc(Win32cr::System::WindowsProgramming::HWINWATCH, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::LPARAM, Void)

  alias REGINSTALLA = Proc(Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PSTR, Win32cr::System::WindowsProgramming::STRTABLEA*, Win32cr::Foundation::HRESULT)

  alias PWLDP_SETDYNAMICCODETRUST_API = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT)

  alias PWLDP_ISDYNAMICCODEPOLICYENABLED_API = Proc(Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)

  alias PWLDP_QUERYDYNAMICODETRUST_API = Proc(Win32cr::Foundation::HANDLE, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias PWLDP_QUERYWINDOWSLOCKDOWNMODE_API = Proc(Win32cr::System::WindowsProgramming::WLDP_WINDOWS_LOCKDOWN_MODE*, Win32cr::Foundation::HRESULT)

  alias PWLDP_QUERYDEVICESECURITYINFORMATION_API = Proc(Win32cr::System::WindowsProgramming::WLDP_DEVICE_SECURITY_INFORMATION*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)

  alias PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API = Proc(Win32cr::System::WindowsProgramming::WLDP_WINDOWS_LOCKDOWN_RESTRICTION*, Win32cr::Foundation::HRESULT)

  alias PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API = Proc(Win32cr::System::WindowsProgramming::WLDP_WINDOWS_LOCKDOWN_RESTRICTION, Win32cr::Foundation::HRESULT)

  alias PWLDP_ISAPPAPPROVEDBYPOLICY_API = Proc(Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT)

  alias PWLDP_QUERYPOLICYSETTINGENABLED_API = Proc(Win32cr::System::WindowsProgramming::WLDP_POLICY_SETTING, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)

  alias PWLDP_QUERYPOLICYSETTINGENABLED2_API = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)

  alias PWLDP_ISWCOSPRODUCTIONCONFIGURATION_API = Proc(Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)

  alias PWLDP_RESETWCOSPRODUCTIONCONFIGURATION_API = Proc(Win32cr::Foundation::HRESULT)

  alias PWLDP_ISPRODUCTIONCONFIGURATION_API = Proc(Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)

  alias PWLDP_RESETPRODUCTIONCONFIGURATION_API = Proc(Win32cr::Foundation::HRESULT)

  alias PDELAYLOAD_FAILURE_DLL_CALLBACK = Proc(UInt32, Win32cr::System::WindowsProgramming::DELAYLOAD_INFO*, Void*)

  WLDP_DLL = "WLDP.DLL"
  WLDP_GETLOCKDOWNPOLICY_FN = "WldpGetLockdownPolicy"
  WLDP_ISCLASSINAPPROVEDLIST_FN = "WldpIsClassInApprovedList"
  WLDP_SETDYNAMICCODETRUST_FN = "WldpSetDynamicCodeTrust"
  WLDP_ISDYNAMICCODEPOLICYENABLED_FN = "WldpIsDynamicCodePolicyEnabled"
  WLDP_QUERYDANAMICCODETRUST_FN = "WldpQueryDynamicCodeTrust"
  WLDP_QUERYDYNAMICCODETRUST_FN = "WldpQueryDynamicCodeTrust"
  WLDP_QUERYWINDOWSLOCKDOWNMODE_FN = "WldpQueryWindowsLockdownMode"
  WLDP_SETWINDOWSLOCKDOWNRESTRICTION_FN = "WldpSetWindowsLockdownRestriction"
  WLDP_QUERYDEVICESECURITYINFORMATION_FN = "WldpQueryDeviceSecurityInformation"
  WLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_FN = "WldpQueryWindowsLockdownRestriction"
  WLDP_ISAPPAPPROVEDBYPOLICY_FN = "WldpIsAppApprovedByPolicy"
  WLDP_QUERYPOLICYSETTINGENABLED_FN = "WldpQueryPolicySettingEnabled"
  WLDP_QUERYPOLICYSETTINGENABLED2_FN = "WldpQueryPolicySettingEnabled2"
  WLDP_ISWCOSPRODUCTIONCONFIGURATION_FN = "WldpIsWcosProductionConfiguration"
  WLDP_RESETWCOSPRODUCTIONCONFIGURATION_FN = "WldpResetWcosProductionConfiguration"
  WLDP_ISPRODUCTIONCONFIGURATION_FN = "WldpIsProductionConfiguration"
  WLDP_RESETPRODUCTIONCONFIGURATION_FN = "WldpResetProductionConfiguration"
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
  SCS_THIS_PLATFORM_BINARY = 6_u32
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
  GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A = "GetSystemWow64DirectoryA"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W = "GetSystemWow64DirectoryA"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T = "GetSystemWow64DirectoryA"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A = "GetSystemWow64DirectoryW"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W = "GetSystemWow64DirectoryW"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T = "GetSystemWow64DirectoryW"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A = "GetSystemWow64DirectoryW"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W = "GetSystemWow64DirectoryW"
  GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T = "GetSystemWow64DirectoryW"
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
  REG_SAVE_LOG_KEY = "RegSaveLogFile"
  REG_RESTORE_LOG_KEY = "RegRestoreLogFile"
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

  CLSID_CameraUIControl = LibC::GUID.new(0x16d5a2be_u32, 0xb1c5_u16, 0x47b3_u16, StaticArray[0x8e_u8, 0xae_u8, 0xcc_u8, 0xbc_u8, 0xf4_u8, 0x52_u8, 0xc7_u8, 0xe8_u8])

  CLSID_EditionUpgradeHelper = LibC::GUID.new(0x1776df3_u32, 0xb9af_u16, 0x4e50_u16, StaticArray[0x9b_u8, 0x1c_u8, 0x56_u8, 0xe9_u8, 0x31_u8, 0x16_u8, 0xd7_u8, 0x4_u8])

  CLSID_EditionUpgradeBroker = LibC::GUID.new(0xc4270827_u32, 0x4f39_u16, 0x45df_u16, StaticArray[0x92_u8, 0x88_u8, 0x12_u8, 0xff_u8, 0x6b_u8, 0x85_u8, 0xa9_u8, 0x21_u8])

  CLSID_DefaultBrowserSyncSettings = LibC::GUID.new(0x3ac83423_u32, 0x3112_u16, 0x4aa6_u16, StaticArray[0x9b_u8, 0x5b_u8, 0x1f_u8, 0xeb_u8, 0x23_u8, 0xd0_u8, 0xc5_u8, 0xf9_u8])

  enum TDIENTITY_ENTITY_TYPE : UInt32
    GENERIC_ENTITY = 0_u32
    AT_ENTITY = 640_u32
    CL_NL_ENTITY = 769_u32
    CO_NL_ENTITY = 768_u32
    CL_TL_ENTITY = 1025_u32
    CO_TL_ENTITY = 1024_u32
    ER_ENTITY = 896_u32
    IF_ENTITY = 512_u32
  end
  enum FILE_INFORMATION_CLASS
    FileDirectoryInformation = 1_i32
  end
  enum SYSTEM_INFORMATION_CLASS
    SystemBasicInformation = 0_i32
    SystemPerformanceInformation = 2_i32
    SystemTimeOfDayInformation = 3_i32
    SystemProcessInformation = 5_i32
    SystemProcessorPerformanceInformation = 8_i32
    SystemInterruptInformation = 23_i32
    SystemExceptionInformation = 33_i32
    SystemRegistryQuotaInformation = 37_i32
    SystemLookasideInformation = 45_i32
    SystemCodeIntegrityInformation = 103_i32
    SystemPolicyInformation = 134_i32
  end
  enum OBJECT_INFORMATION_CLASS
    ObjectBasicInformation = 0_i32
    ObjectTypeInformation = 2_i32
  end
  enum KEY_SET_INFORMATION_CLASS
    KeyWriteTimeInformation = 0_i32
    KeyWow64FlagsInformation = 1_i32
    KeyControlFlagsInformation = 2_i32
    KeySetVirtualizationInformation = 3_i32
    KeySetDebugInformation = 4_i32
    KeySetHandleTagsInformation = 5_i32
    MaxKeySetInfoClass = 6_i32
  end
  enum WINSTATIONINFOCLASS
    WinStationInformation = 8_i32
  end
  enum CameraUIControlMode
    Browse = 0_i32
    Linear = 1_i32
  end
  enum CameraUIControlLinearSelectionMode
    Single = 0_i32
    Multiple = 1_i32
  end
  enum CameraUIControlCaptureMode
    PhotoOrVideo = 0_i32
    Photo = 1_i32
    Video = 2_i32
  end
  enum CameraUIControlPhotoFormat
    Jpeg = 0_i32
    Png = 1_i32
    JpegXR = 2_i32
  end
  enum CameraUIControlVideoFormat
    Mp4 = 0_i32
    Wmv = 1_i32
  end
  enum CameraUIControlViewType
    SingleItem = 0_i32
    ItemList = 1_i32
  end
  enum FEATURE_CHANGE_TIME
    FEATURE_CHANGE_TIME_READ = 0_i32
    FEATURE_CHANGE_TIME_MODULE_RELOAD = 1_i32
    FEATURE_CHANGE_TIME_SESSION = 2_i32
    FEATURE_CHANGE_TIME_REBOOT = 3_i32
  end
  enum FEATURE_ENABLED_STATE
    FEATURE_ENABLED_STATE_DEFAULT = 0_i32
    FEATURE_ENABLED_STATE_DISABLED = 1_i32
    FEATURE_ENABLED_STATE_ENABLED = 2_i32
  end
  enum TDI_TL_IO_CONTROL_TYPE
    EndpointIoControlType = 0_i32
    SetSockOptIoControlType = 1_i32
    GetSockOptIoControlType = 2_i32
    SocketIoControlType = 3_i32
  end
  enum WLDP_HOST
    WLDP_HOST_RUNDLL32 = 0_i32
    WLDP_HOST_SVCHOST = 1_i32
    WLDP_HOST_MAX = 2_i32
  end
  enum WLDP_HOST_ID
    WLDP_HOST_ID_UNKNOWN = 0_i32
    WLDP_HOST_ID_GLOBAL = 1_i32
    WLDP_HOST_ID_VBA = 2_i32
    WLDP_HOST_ID_WSH = 3_i32
    WLDP_HOST_ID_POWERSHELL = 4_i32
    WLDP_HOST_ID_IE = 5_i32
    WLDP_HOST_ID_MSI = 6_i32
    WLDP_HOST_ID_ALL = 7_i32
    WLDP_HOST_ID_MAX = 8_i32
  end
  enum DECISION_LOCATION
    DECISION_LOCATION_REFRESH_GLOBAL_DATA = 0_i32
    DECISION_LOCATION_PARAMETER_VALIDATION = 1_i32
    DECISION_LOCATION_AUDIT = 2_i32
    DECISION_LOCATION_FAILED_CONVERT_GUID = 3_i32
    DECISION_LOCATION_ENTERPRISE_DEFINED_CLASS_ID = 4_i32
    DECISION_LOCATION_GLOBAL_BUILT_IN_LIST = 5_i32
    DECISION_LOCATION_PROVIDER_BUILT_IN_LIST = 6_i32
    DECISION_LOCATION_ENFORCE_STATE_LIST = 7_i32
    DECISION_LOCATION_NOT_FOUND = 8_i32
    DECISION_LOCATION_UNKNOWN = 9_i32
  end
  enum WLDP_KEY
    KEY_UNKNOWN = 0_i32
    KEY_OVERRIDE = 1_i32
    KEY_ALL_KEYS = 2_i32
  end
  enum VALUENAME
    VALUENAME_UNKNOWN = 0_i32
    VALUENAME_ENTERPRISE_DEFINED_CLASS_ID = 1_i32
    VALUENAME_BUILT_IN_LIST = 2_i32
  end
  enum WLDP_WINDOWS_LOCKDOWN_MODE
    WLDP_WINDOWS_LOCKDOWN_MODE_UNLOCKED = 0_i32
    WLDP_WINDOWS_LOCKDOWN_MODE_TRIAL = 1_i32
    WLDP_WINDOWS_LOCKDOWN_MODE_LOCKED = 2_i32
    WLDP_WINDOWS_LOCKDOWN_MODE_MAX = 3_i32
  end
  enum WLDP_WINDOWS_LOCKDOWN_RESTRICTION
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NONE = 0_i32
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK = 1_i32
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK_PERMANENT = 2_i32
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_MAX = 3_i32
  end
  enum WLDP_POLICY_SETTING
    WLDP_POLICY_SETTING_AV_PERF_MODE = 1000_i32
  end

  @[Extern]
  struct D3DHAL_CALLBACKS_
    def initialize()
    end
  end

  @[Extern]
  struct D3DHAL_GLOBALDRIVERDATA_
    def initialize()
    end
  end

  @[Extern]
  struct IMAGE_THUNK_DATA64
    property u1 : U1_e__union_

    # Nested Type U1_e__union_
    @[Extern(union: true)]
    struct U1_e__union_
    property forwarder_string : UInt64
    property function : UInt64
    property ordinal : UInt64
    property address_of_data : UInt64
    def initialize(@forwarder_string : UInt64, @function : UInt64, @ordinal : UInt64, @address_of_data : UInt64)
    end
    end

    def initialize(@u1 : U1_e__union_)
    end
  end

  @[Extern]
  struct IMAGE_THUNK_DATA32
    property u1 : U1_e__union_

    # Nested Type U1_e__union_
    @[Extern(union: true)]
    struct U1_e__union_
    property forwarder_string : UInt32
    property function : UInt32
    property ordinal : UInt32
    property address_of_data : UInt32
    def initialize(@forwarder_string : UInt32, @function : UInt32, @ordinal : UInt32, @address_of_data : UInt32)
    end
    end

    def initialize(@u1 : U1_e__union_)
    end
  end

  @[Extern]
  struct IMAGE_DELAYLOAD_DESCRIPTOR
    property attributes : Attributes_e__Union_
    property dll_name_rva : UInt32
    property module_handle_rva : UInt32
    property import_address_table_rva : UInt32
    property import_name_table_rva : UInt32
    property bound_import_address_table_rva : UInt32
    property unload_information_table_rva : UInt32
    property time_date_stamp : UInt32

    # Nested Type Attributes_e__Union_
    @[Extern(union: true)]
    struct Attributes_e__Union_
    property all_attributes : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@all_attributes : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@attributes : Attributes_e__Union_, @dll_name_rva : UInt32, @module_handle_rva : UInt32, @import_address_table_rva : UInt32, @import_name_table_rva : UInt32, @bound_import_address_table_rva : UInt32, @unload_information_table_rva : UInt32, @time_date_stamp : UInt32)
    end
  end

  @[Extern]
  struct CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG
    property size : UInt32
    property trigger_id : Win32cr::Foundation::PWSTR
    def initialize(@size : UInt32, @trigger_id : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct JIT_DEBUG_INFO
    property dwSize : UInt32
    property dwProcessorArchitecture : UInt32
    property dwThreadID : UInt32
    property dwReserved0 : UInt32
    property lpExceptionAddress : UInt64
    property lpExceptionRecord : UInt64
    property lpContextRecord : UInt64
    def initialize(@dwSize : UInt32, @dwProcessorArchitecture : UInt32, @dwThreadID : UInt32, @dwReserved0 : UInt32, @lpExceptionAddress : UInt64, @lpExceptionRecord : UInt64, @lpContextRecord : UInt64)
    end
  end

  @[Extern]
  struct HW_PROFILE_INFOA
    property dwDockInfo : UInt32
    property szHwProfileGuid : Win32cr::Foundation::CHAR[39]
    property szHwProfileName : Win32cr::Foundation::CHAR[80]
    def initialize(@dwDockInfo : UInt32, @szHwProfileGuid : Win32cr::Foundation::CHAR[39], @szHwProfileName : Win32cr::Foundation::CHAR[80])
    end
  end

  @[Extern]
  struct HW_PROFILE_INFOW
    property dwDockInfo : UInt32
    property szHwProfileGuid : UInt16[39]
    property szHwProfileName : UInt16[80]
    def initialize(@dwDockInfo : UInt32, @szHwProfileGuid : UInt16[39], @szHwProfileName : UInt16[80])
    end
  end

  @[Extern]
  struct ACTCTX_SECTION_KEYED_DATA_2600
    property cbSize : UInt32
    property ulDataFormatVersion : UInt32
    property lpData : Void*
    property ulLength : UInt32
    property lpSectionGlobalData : Void*
    property ulSectionGlobalDataLength : UInt32
    property lpSectionBase : Void*
    property ulSectionTotalLength : UInt32
    property hActCtx : Win32cr::Foundation::HANDLE
    property ulAssemblyRosterIndex : UInt32
    def initialize(@cbSize : UInt32, @ulDataFormatVersion : UInt32, @lpData : Void*, @ulLength : UInt32, @lpSectionGlobalData : Void*, @ulSectionGlobalDataLength : UInt32, @lpSectionBase : Void*, @ulSectionTotalLength : UInt32, @hActCtx : Win32cr::Foundation::HANDLE, @ulAssemblyRosterIndex : UInt32)
    end
  end

  @[Extern]
  struct ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
    property lpInformation : Void*
    property lpSectionBase : Void*
    property ulSectionLength : UInt32
    property lpSectionGlobalDataBase : Void*
    property ulSectionGlobalDataLength : UInt32
    def initialize(@lpInformation : Void*, @lpSectionBase : Void*, @ulSectionLength : UInt32, @lpSectionGlobalDataBase : Void*, @ulSectionGlobalDataLength : UInt32)
    end
  end

  @[Extern]
  struct ACTIVATION_CONTEXT_BASIC_INFORMATION
    property hActCtx : Win32cr::Foundation::HANDLE
    property dwFlags : UInt32
    def initialize(@hActCtx : Win32cr::Foundation::HANDLE, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct FILE_CASE_SENSITIVE_INFO
    property flags : UInt32
    def initialize(@flags : UInt32)
    end
  end

  @[Extern]
  struct FILE_DISPOSITION_INFO_EX
    property flags : UInt32
    def initialize(@flags : UInt32)
    end
  end

  @[Extern]
  struct CLIENT_ID
    property unique_process : Win32cr::Foundation::HANDLE
    property unique_thread : Win32cr::Foundation::HANDLE
    def initialize(@unique_process : Win32cr::Foundation::HANDLE, @unique_thread : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct LDR_DATA_TABLE_ENTRY
    property reserved1 : Void*[2]
    property in_memory_order_links : Win32cr::System::Kernel::LIST_ENTRY
    property reserved2 : Void*[2]
    property dll_base : Void*
    property reserved3 : Void*[2]
    property full_dll_name : Win32cr::Foundation::UNICODE_STRING
    property reserved4 : UInt8[8]
    property reserved5 : Void*[3]
    property anonymous : Anonymous_e__Union_
    property time_date_stamp : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property check_sum : UInt32
    property reserved6 : Void*
    def initialize(@check_sum : UInt32, @reserved6 : Void*)
    end
    end

    def initialize(@reserved1 : Void*[2], @in_memory_order_links : Win32cr::System::Kernel::LIST_ENTRY, @reserved2 : Void*[2], @dll_base : Void*, @reserved3 : Void*[2], @full_dll_name : Win32cr::Foundation::UNICODE_STRING, @reserved4 : UInt8[8], @reserved5 : Void*[3], @anonymous : Anonymous_e__Union_, @time_date_stamp : UInt32)
    end
  end

  @[Extern]
  struct OBJECT_ATTRIBUTES
    property length : UInt32
    property root_directory : Win32cr::Foundation::HANDLE
    property object_name : Win32cr::Foundation::UNICODE_STRING*
    property attributes : UInt32
    property security_descriptor : Void*
    property security_quality_of_service : Void*
    def initialize(@length : UInt32, @root_directory : Win32cr::Foundation::HANDLE, @object_name : Win32cr::Foundation::UNICODE_STRING*, @attributes : UInt32, @security_descriptor : Void*, @security_quality_of_service : Void*)
    end
  end

  @[Extern]
  struct IO_STATUS_BLOCK
    property anonymous : Anonymous_e__Union_
    property information : LibC::UIntPtrT

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property status : Win32cr::Foundation::NTSTATUS
    property pointer : Void*
    def initialize(@status : Win32cr::Foundation::NTSTATUS, @pointer : Void*)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @information : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION
    property idle_time : Win32cr::Foundation::LARGE_INTEGER
    property kernel_time : Win32cr::Foundation::LARGE_INTEGER
    property user_time : Win32cr::Foundation::LARGE_INTEGER
    property reserved1 : Win32cr::Foundation::LARGE_INTEGER[2]
    property reserved2 : UInt32
    def initialize(@idle_time : Win32cr::Foundation::LARGE_INTEGER, @kernel_time : Win32cr::Foundation::LARGE_INTEGER, @user_time : Win32cr::Foundation::LARGE_INTEGER, @reserved1 : Win32cr::Foundation::LARGE_INTEGER[2], @reserved2 : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_PROCESS_INFORMATION
    property next_entry_offset : UInt32
    property number_of_threads : UInt32
    property reserved1 : UInt8[48]
    property image_name : Win32cr::Foundation::UNICODE_STRING
    property base_priority : Int32
    property unique_process_id : Win32cr::Foundation::HANDLE
    property reserved2 : Void*
    property handle_count : UInt32
    property session_id : UInt32
    property reserved3 : Void*
    property peak_virtual_size : LibC::UIntPtrT
    property virtual_size : LibC::UIntPtrT
    property reserved4 : UInt32
    property peak_working_set_size : LibC::UIntPtrT
    property working_set_size : LibC::UIntPtrT
    property reserved5 : Void*
    property quota_paged_pool_usage : LibC::UIntPtrT
    property reserved6 : Void*
    property quota_non_paged_pool_usage : LibC::UIntPtrT
    property pagefile_usage : LibC::UIntPtrT
    property peak_pagefile_usage : LibC::UIntPtrT
    property private_page_count : LibC::UIntPtrT
    property reserved7 : Win32cr::Foundation::LARGE_INTEGER[6]
    def initialize(@next_entry_offset : UInt32, @number_of_threads : UInt32, @reserved1 : UInt8[48], @image_name : Win32cr::Foundation::UNICODE_STRING, @base_priority : Int32, @unique_process_id : Win32cr::Foundation::HANDLE, @reserved2 : Void*, @handle_count : UInt32, @session_id : UInt32, @reserved3 : Void*, @peak_virtual_size : LibC::UIntPtrT, @virtual_size : LibC::UIntPtrT, @reserved4 : UInt32, @peak_working_set_size : LibC::UIntPtrT, @working_set_size : LibC::UIntPtrT, @reserved5 : Void*, @quota_paged_pool_usage : LibC::UIntPtrT, @reserved6 : Void*, @quota_non_paged_pool_usage : LibC::UIntPtrT, @pagefile_usage : LibC::UIntPtrT, @peak_pagefile_usage : LibC::UIntPtrT, @private_page_count : LibC::UIntPtrT, @reserved7 : Win32cr::Foundation::LARGE_INTEGER[6])
    end
  end

  @[Extern]
  struct SYSTEM_THREAD_INFORMATION
    property reserved1 : Win32cr::Foundation::LARGE_INTEGER[3]
    property reserved2 : UInt32
    property start_address : Void*
    property client_id : Win32cr::System::WindowsProgramming::CLIENT_ID
    property priority : Int32
    property base_priority : Int32
    property reserved3 : UInt32
    property thread_state : UInt32
    property wait_reason : UInt32
    def initialize(@reserved1 : Win32cr::Foundation::LARGE_INTEGER[3], @reserved2 : UInt32, @start_address : Void*, @client_id : Win32cr::System::WindowsProgramming::CLIENT_ID, @priority : Int32, @base_priority : Int32, @reserved3 : UInt32, @thread_state : UInt32, @wait_reason : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_REGISTRY_QUOTA_INFORMATION
    property registry_quota_allowed : UInt32
    property registry_quota_used : UInt32
    property reserved1 : Void*
    def initialize(@registry_quota_allowed : UInt32, @registry_quota_used : UInt32, @reserved1 : Void*)
    end
  end

  @[Extern]
  struct SYSTEM_BASIC_INFORMATION
    property reserved1 : UInt8[24]
    property reserved2 : Void*[4]
    property number_of_processors : Int8
    def initialize(@reserved1 : UInt8[24], @reserved2 : Void*[4], @number_of_processors : Int8)
    end
  end

  @[Extern]
  struct SYSTEM_TIMEOFDAY_INFORMATION
    property reserved1 : UInt8[48]
    def initialize(@reserved1 : UInt8[48])
    end
  end

  @[Extern]
  struct SYSTEM_PERFORMANCE_INFORMATION
    property reserved1 : UInt8[312]
    def initialize(@reserved1 : UInt8[312])
    end
  end

  @[Extern]
  struct SYSTEM_EXCEPTION_INFORMATION
    property reserved1 : UInt8[16]
    def initialize(@reserved1 : UInt8[16])
    end
  end

  @[Extern]
  struct SYSTEM_LOOKASIDE_INFORMATION
    property reserved1 : UInt8[32]
    def initialize(@reserved1 : UInt8[32])
    end
  end

  @[Extern]
  struct SYSTEM_INTERRUPT_INFORMATION
    property reserved1 : UInt8[24]
    def initialize(@reserved1 : UInt8[24])
    end
  end

  @[Extern]
  struct SYSTEM_POLICY_INFORMATION
    property reserved1 : Void*[2]
    property reserved2 : UInt32[3]
    def initialize(@reserved1 : Void*[2], @reserved2 : UInt32[3])
    end
  end

  @[Extern]
  struct THREAD_NAME_INFORMATION
    property thread_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@thread_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct SYSTEM_CODEINTEGRITY_INFORMATION
    property length : UInt32
    property code_integrity_options : UInt32
    def initialize(@length : UInt32, @code_integrity_options : UInt32)
    end
  end

  @[Extern]
  struct PUBLIC_OBJECT_BASIC_INFORMATION
    property attributes : UInt32
    property granted_access : UInt32
    property handle_count : UInt32
    property pointer_count : UInt32
    property reserved : UInt32[10]
    def initialize(@attributes : UInt32, @granted_access : UInt32, @handle_count : UInt32, @pointer_count : UInt32, @reserved : UInt32[10])
    end
  end

  @[Extern]
  struct PUBLIC_OBJECT_TYPE_INFORMATION
    property type_name : Win32cr::Foundation::UNICODE_STRING
    property reserved : UInt32[22]
    def initialize(@type_name : Win32cr::Foundation::UNICODE_STRING, @reserved : UInt32[22])
    end
  end

  @[Extern]
  struct KEY_VALUE_ENTRY
    property value_name : Win32cr::Foundation::UNICODE_STRING*
    property data_length : UInt32
    property data_offset : UInt32
    property type__ : UInt32
    def initialize(@value_name : Win32cr::Foundation::UNICODE_STRING*, @data_length : UInt32, @data_offset : UInt32, @type__ : UInt32)
    end
  end

  @[Extern]
  struct WINSTATIONINFORMATIONW
    property reserved2 : UInt8[70]
    property logon_id : UInt32
    property reserved3 : UInt8[1140]
    def initialize(@reserved2 : UInt8[70], @logon_id : UInt32, @reserved3 : UInt8[1140])
    end
  end

  @[Extern]
  struct FEATURE_ERROR
    property hr : Win32cr::Foundation::HRESULT
    property lineNumber : UInt16
    property file : Win32cr::Foundation::PSTR
    property process : Win32cr::Foundation::PSTR
    property module__ : Win32cr::Foundation::PSTR
    property callerReturnAddressOffset : UInt32
    property callerModule : Win32cr::Foundation::PSTR
    property message : Win32cr::Foundation::PSTR
    property originLineNumber : UInt16
    property originFile : Win32cr::Foundation::PSTR
    property originModule : Win32cr::Foundation::PSTR
    property originCallerReturnAddressOffset : UInt32
    property originCallerModule : Win32cr::Foundation::PSTR
    property originName : Win32cr::Foundation::PSTR
    def initialize(@hr : Win32cr::Foundation::HRESULT, @lineNumber : UInt16, @file : Win32cr::Foundation::PSTR, @process : Win32cr::Foundation::PSTR, @module__ : Win32cr::Foundation::PSTR, @callerReturnAddressOffset : UInt32, @callerModule : Win32cr::Foundation::PSTR, @message : Win32cr::Foundation::PSTR, @originLineNumber : UInt16, @originFile : Win32cr::Foundation::PSTR, @originModule : Win32cr::Foundation::PSTR, @originCallerReturnAddressOffset : UInt32, @originCallerModule : Win32cr::Foundation::PSTR, @originName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct DCICMD
    property dwCommand : UInt32
    property dwParam1 : UInt32
    property dwParam2 : UInt32
    property dwVersion : UInt32
    property dwReserved : UInt32
    def initialize(@dwCommand : UInt32, @dwParam1 : UInt32, @dwParam2 : UInt32, @dwVersion : UInt32, @dwReserved : UInt32)
    end
  end

  @[Extern]
  struct DCICREATEINPUT
    property cmd : Win32cr::System::WindowsProgramming::DCICMD
    property dwCompression : UInt32
    property dwMask : UInt32[3]
    property dwWidth : UInt32
    property dwHeight : UInt32
    property dwDCICaps : UInt32
    property dwBitCount : UInt32
    property lpSurface : Void*
    def initialize(@cmd : Win32cr::System::WindowsProgramming::DCICMD, @dwCompression : UInt32, @dwMask : UInt32[3], @dwWidth : UInt32, @dwHeight : UInt32, @dwDCICaps : UInt32, @dwBitCount : UInt32, @lpSurface : Void*)
    end
  end

  @[Extern]
  struct DCISURFACEINFO
    property dwSize : UInt32
    property dwDCICaps : UInt32
    property dwCompression : UInt32
    property dwMask : UInt32[3]
    property dwWidth : UInt32
    property dwHeight : UInt32
    property lStride : Int32
    property dwBitCount : UInt32
    property dwOffSurface : LibC::UIntPtrT
    property wSelSurface : UInt16
    property wReserved : UInt16
    property dwReserved1 : UInt32
    property dwReserved2 : UInt32
    property dwReserved3 : UInt32
    property begin_access : LibC::IntPtrT
    property end_access : LibC::IntPtrT
    property destroy_surface : LibC::IntPtrT
    def initialize(@dwSize : UInt32, @dwDCICaps : UInt32, @dwCompression : UInt32, @dwMask : UInt32[3], @dwWidth : UInt32, @dwHeight : UInt32, @lStride : Int32, @dwBitCount : UInt32, @dwOffSurface : LibC::UIntPtrT, @wSelSurface : UInt16, @wReserved : UInt16, @dwReserved1 : UInt32, @dwReserved2 : UInt32, @dwReserved3 : UInt32, @begin_access : LibC::IntPtrT, @end_access : LibC::IntPtrT, @destroy_surface : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct DCIENUMINPUT
    property cmd : Win32cr::System::WindowsProgramming::DCICMD
    property rSrc : Win32cr::Foundation::RECT
    property rDst : Win32cr::Foundation::RECT
    property enum_callback : LibC::IntPtrT
    property lpContext : Void*
    def initialize(@cmd : Win32cr::System::WindowsProgramming::DCICMD, @rSrc : Win32cr::Foundation::RECT, @rDst : Win32cr::Foundation::RECT, @enum_callback : LibC::IntPtrT, @lpContext : Void*)
    end
  end

  @[Extern]
  struct DCIOFFSCREEN
    property dciInfo : Win32cr::System::WindowsProgramming::DCISURFACEINFO
    property draw : LibC::IntPtrT
    property set_clip_list : LibC::IntPtrT
    property set_destination : LibC::IntPtrT
    def initialize(@dciInfo : Win32cr::System::WindowsProgramming::DCISURFACEINFO, @draw : LibC::IntPtrT, @set_clip_list : LibC::IntPtrT, @set_destination : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct DCIOVERLAY
    property dciInfo : Win32cr::System::WindowsProgramming::DCISURFACEINFO
    property dwChromakeyValue : UInt32
    property dwChromakeyMask : UInt32
    def initialize(@dciInfo : Win32cr::System::WindowsProgramming::DCISURFACEINFO, @dwChromakeyValue : UInt32, @dwChromakeyMask : UInt32)
    end
  end

  @[Extern]
  struct STRENTRYA
    property pszName : Win32cr::Foundation::PSTR
    property pszValue : Win32cr::Foundation::PSTR
    def initialize(@pszName : Win32cr::Foundation::PSTR, @pszValue : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct STRENTRYW
    property pszName : Win32cr::Foundation::PWSTR
    property pszValue : Win32cr::Foundation::PWSTR
    def initialize(@pszName : Win32cr::Foundation::PWSTR, @pszValue : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct STRTABLEA
    property cEntries : UInt32
    property pse : Win32cr::System::WindowsProgramming::STRENTRYA*
    def initialize(@cEntries : UInt32, @pse : Win32cr::System::WindowsProgramming::STRENTRYA*)
    end
  end

  @[Extern]
  struct STRTABLEW
    property cEntries : UInt32
    property pse : Win32cr::System::WindowsProgramming::STRENTRYW*
    def initialize(@cEntries : UInt32, @pse : Win32cr::System::WindowsProgramming::STRENTRYW*)
    end
  end

  @[Extern]
  struct CABINFOA
    property pszCab : Win32cr::Foundation::PSTR
    property pszInf : Win32cr::Foundation::PSTR
    property pszSection : Win32cr::Foundation::PSTR
    property szSrcPath : Win32cr::Foundation::CHAR[260]
    property dwFlags : UInt32
    def initialize(@pszCab : Win32cr::Foundation::PSTR, @pszInf : Win32cr::Foundation::PSTR, @pszSection : Win32cr::Foundation::PSTR, @szSrcPath : Win32cr::Foundation::CHAR[260], @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct CABINFOW
    property pszCab : Win32cr::Foundation::PWSTR
    property pszInf : Win32cr::Foundation::PWSTR
    property pszSection : Win32cr::Foundation::PWSTR
    property szSrcPath : UInt16[260]
    property dwFlags : UInt32
    def initialize(@pszCab : Win32cr::Foundation::PWSTR, @pszInf : Win32cr::Foundation::PWSTR, @pszSection : Win32cr::Foundation::PWSTR, @szSrcPath : UInt16[260], @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct PERUSERSECTIONA
    property szGUID : Win32cr::Foundation::CHAR[59]
    property szDispName : Win32cr::Foundation::CHAR[128]
    property szLocale : Win32cr::Foundation::CHAR[10]
    property szStub : Win32cr::Foundation::CHAR[1040]
    property szVersion : Win32cr::Foundation::CHAR[32]
    property szCompID : Win32cr::Foundation::CHAR[128]
    property dwIsInstalled : UInt32
    property bRollback : Win32cr::Foundation::BOOL
    def initialize(@szGUID : Win32cr::Foundation::CHAR[59], @szDispName : Win32cr::Foundation::CHAR[128], @szLocale : Win32cr::Foundation::CHAR[10], @szStub : Win32cr::Foundation::CHAR[1040], @szVersion : Win32cr::Foundation::CHAR[32], @szCompID : Win32cr::Foundation::CHAR[128], @dwIsInstalled : UInt32, @bRollback : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct PERUSERSECTIONW
    property szGUID : UInt16[59]
    property szDispName : UInt16[128]
    property szLocale : UInt16[10]
    property szStub : UInt16[1040]
    property szVersion : UInt16[32]
    property szCompID : UInt16[128]
    property dwIsInstalled : UInt32
    property bRollback : Win32cr::Foundation::BOOL
    def initialize(@szGUID : UInt16[59], @szDispName : UInt16[128], @szLocale : UInt16[10], @szStub : UInt16[1040], @szVersion : UInt16[32], @szCompID : UInt16[128], @dwIsInstalled : UInt32, @bRollback : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct IMESTRUCT
    property fnc : UInt32
    property wParam : Win32cr::Foundation::WPARAM
    property wCount : UInt32
    property dchSource : UInt32
    property dchDest : UInt32
    property lParam1 : Win32cr::Foundation::LPARAM
    property lParam2 : Win32cr::Foundation::LPARAM
    property lParam3 : Win32cr::Foundation::LPARAM
    def initialize(@fnc : UInt32, @wParam : Win32cr::Foundation::WPARAM, @wCount : UInt32, @dchSource : UInt32, @dchDest : UInt32, @lParam1 : Win32cr::Foundation::LPARAM, @lParam2 : Win32cr::Foundation::LPARAM, @lParam3 : Win32cr::Foundation::LPARAM)
    end
  end

  @[Extern]
  struct UNDETERMINESTRUCT
    property dwSize : UInt32
    property uDefIMESize : UInt32
    property uDefIMEPos : UInt32
    property uUndetTextLen : UInt32
    property uUndetTextPos : UInt32
    property uUndetAttrPos : UInt32
    property uCursorPos : UInt32
    property uDeltaStart : UInt32
    property uDetermineTextLen : UInt32
    property uDetermineTextPos : UInt32
    property uDetermineDelimPos : UInt32
    property uYomiTextLen : UInt32
    property uYomiTextPos : UInt32
    property uYomiDelimPos : UInt32
    def initialize(@dwSize : UInt32, @uDefIMESize : UInt32, @uDefIMEPos : UInt32, @uUndetTextLen : UInt32, @uUndetTextPos : UInt32, @uUndetAttrPos : UInt32, @uCursorPos : UInt32, @uDeltaStart : UInt32, @uDetermineTextLen : UInt32, @uDetermineTextPos : UInt32, @uDetermineDelimPos : UInt32, @uYomiTextLen : UInt32, @uYomiTextPos : UInt32, @uYomiDelimPos : UInt32)
    end
  end

  @[Extern]
  struct STRINGEXSTRUCT
    property dwSize : UInt32
    property uDeterminePos : UInt32
    property uDetermineDelimPos : UInt32
    property uYomiPos : UInt32
    property uYomiDelimPos : UInt32
    def initialize(@dwSize : UInt32, @uDeterminePos : UInt32, @uDetermineDelimPos : UInt32, @uYomiPos : UInt32, @uYomiDelimPos : UInt32)
    end
  end

  @[Extern]
  struct DATETIME
    property year : UInt16
    property month : UInt16
    property day : UInt16
    property hour : UInt16
    property min : UInt16
    property sec : UInt16
    def initialize(@year : UInt16, @month : UInt16, @day : UInt16, @hour : UInt16, @min : UInt16, @sec : UInt16)
    end
  end

  @[Extern]
  struct IMEPROA
    property hWnd : Win32cr::Foundation::HWND
    property inst_date : Win32cr::System::WindowsProgramming::DATETIME
    property wVersion : UInt32
    property szDescription : UInt8[50]
    property szName : UInt8[80]
    property szOptions : UInt8[30]
    def initialize(@hWnd : Win32cr::Foundation::HWND, @inst_date : Win32cr::System::WindowsProgramming::DATETIME, @wVersion : UInt32, @szDescription : UInt8[50], @szName : UInt8[80], @szOptions : UInt8[30])
    end
  end

  @[Extern]
  struct IMEPROW
    property hWnd : Win32cr::Foundation::HWND
    property inst_date : Win32cr::System::WindowsProgramming::DATETIME
    property wVersion : UInt32
    property szDescription : UInt16[50]
    property szName : UInt16[80]
    property szOptions : UInt16[30]
    def initialize(@hWnd : Win32cr::Foundation::HWND, @inst_date : Win32cr::System::WindowsProgramming::DATETIME, @wVersion : UInt32, @szDescription : UInt16[50], @szName : UInt16[80], @szOptions : UInt16[30])
    end
  end

  @[Extern]
  struct JAVA_TRUST
    property cbSize : UInt32
    property flag : UInt32
    property fAllActiveXPermissions : Win32cr::Foundation::BOOL
    property fAllPermissions : Win32cr::Foundation::BOOL
    property dwEncodingType : UInt32
    property pbJavaPermissions : UInt8*
    property cbJavaPermissions : UInt32
    property pbSigner : UInt8*
    property cbSigner : UInt32
    property pwszZone : Win32cr::Foundation::PWSTR
    property guidZone : LibC::GUID
    property hVerify : Win32cr::Foundation::HRESULT
    def initialize(@cbSize : UInt32, @flag : UInt32, @fAllActiveXPermissions : Win32cr::Foundation::BOOL, @fAllPermissions : Win32cr::Foundation::BOOL, @dwEncodingType : UInt32, @pbJavaPermissions : UInt8*, @cbJavaPermissions : UInt32, @pbSigner : UInt8*, @cbSigner : UInt32, @pwszZone : Win32cr::Foundation::PWSTR, @guidZone : LibC::GUID, @hVerify : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct TDIEntityID
    property tei_entity : Win32cr::System::WindowsProgramming::TDIENTITY_ENTITY_TYPE
    property tei_instance : UInt32
    def initialize(@tei_entity : Win32cr::System::WindowsProgramming::TDIENTITY_ENTITY_TYPE, @tei_instance : UInt32)
    end
  end

  @[Extern]
  struct TDIObjectID
    property toi_entity : Win32cr::System::WindowsProgramming::TDIEntityID
    property toi_class : UInt32
    property toi_type : UInt32
    property toi_id : UInt32
    def initialize(@toi_entity : Win32cr::System::WindowsProgramming::TDIEntityID, @toi_class : UInt32, @toi_type : UInt32, @toi_id : UInt32)
    end
  end

  @[Extern]
  struct Tcp_request_query_information_ex_xp
    property id : Win32cr::System::WindowsProgramming::TDIObjectID
    property context : LibC::UIntPtrT[2]
    def initialize(@id : Win32cr::System::WindowsProgramming::TDIObjectID, @context : LibC::UIntPtrT[2])
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct Tcp_request_query_information_ex32_xp
    property id : Win32cr::System::WindowsProgramming::TDIObjectID
    property context : UInt32[4]
    def initialize(@id : Win32cr::System::WindowsProgramming::TDIObjectID, @context : UInt32[4])
    end
  end
  {% end %}

  @[Extern]
  struct Tcp_request_query_information_ex_w2k
    property id : Win32cr::System::WindowsProgramming::TDIObjectID
    property context : UInt8[16]
    def initialize(@id : Win32cr::System::WindowsProgramming::TDIObjectID, @context : UInt8[16])
    end
  end

  @[Extern]
  struct Tcp_request_set_information_ex
    property id : Win32cr::System::WindowsProgramming::TDIObjectID
    property buffer_size : UInt32
    property buffer : UInt8*
    def initialize(@id : Win32cr::System::WindowsProgramming::TDIObjectID, @buffer_size : UInt32, @buffer : UInt8*)
    end
  end

  @[Extern]
  struct TDI_TL_IO_CONTROL_ENDPOINT
    property type__ : Win32cr::System::WindowsProgramming::TDI_TL_IO_CONTROL_TYPE
    property level : UInt32
    property anonymous : Anonymous_e__Union_
    property input_buffer : Void*
    property input_buffer_length : UInt32
    property output_buffer : Void*
    property output_buffer_length : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property io_control_code : UInt32
    property option_name : UInt32
    def initialize(@io_control_code : UInt32, @option_name : UInt32)
    end
    end

    def initialize(@type__ : Win32cr::System::WindowsProgramming::TDI_TL_IO_CONTROL_TYPE, @level : UInt32, @anonymous : Anonymous_e__Union_, @input_buffer : Void*, @input_buffer_length : UInt32, @output_buffer : Void*, @output_buffer_length : UInt32)
    end
  end

  @[Extern]
  struct WLDP_HOST_INFORMATION
    property dwRevision : UInt32
    property dwHostId : Win32cr::System::WindowsProgramming::WLDP_HOST_ID
    property szSource : Win32cr::Foundation::PWSTR
    property hSource : Win32cr::Foundation::HANDLE
    def initialize(@dwRevision : UInt32, @dwHostId : Win32cr::System::WindowsProgramming::WLDP_HOST_ID, @szSource : Win32cr::Foundation::PWSTR, @hSource : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct WLDP_DEVICE_SECURITY_INFORMATION
    property unlock_id_size : UInt32
    property unlock_id : UInt8*
    property manufacturer_id_length : UInt32
    property manufacturer_id : Win32cr::Foundation::PWSTR
    def initialize(@unlock_id_size : UInt32, @unlock_id : UInt8*, @manufacturer_id_length : UInt32, @manufacturer_id : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DELAYLOAD_PROC_DESCRIPTOR
    property import_described_by_name : UInt32
    property description : Description_e__Union_

    # Nested Type Description_e__Union_
    @[Extern(union: true)]
    struct Description_e__Union_
    property name : Win32cr::Foundation::PSTR
    property ordinal : UInt32
    def initialize(@name : Win32cr::Foundation::PSTR, @ordinal : UInt32)
    end
    end

    def initialize(@import_described_by_name : UInt32, @description : Description_e__Union_)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DELAYLOAD_INFO
    property size : UInt32
    property delayload_descriptor : Win32cr::System::WindowsProgramming::IMAGE_DELAYLOAD_DESCRIPTOR*
    property thunk_address : Win32cr::System::WindowsProgramming::IMAGE_THUNK_DATA64*
    property target_dll_name : Win32cr::Foundation::PSTR
    property target_api_descriptor : Win32cr::System::WindowsProgramming::DELAYLOAD_PROC_DESCRIPTOR
    property target_module_base : Void*
    property unused : Void*
    property last_error : UInt32
    def initialize(@size : UInt32, @delayload_descriptor : Win32cr::System::WindowsProgramming::IMAGE_DELAYLOAD_DESCRIPTOR*, @thunk_address : Win32cr::System::WindowsProgramming::IMAGE_THUNK_DATA64*, @target_dll_name : Win32cr::Foundation::PSTR, @target_api_descriptor : Win32cr::System::WindowsProgramming::DELAYLOAD_PROC_DESCRIPTOR, @target_module_base : Void*, @unused : Void*, @last_error : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct DELAYLOAD_INFO
    property size : UInt32
    property delayload_descriptor : Win32cr::System::WindowsProgramming::IMAGE_DELAYLOAD_DESCRIPTOR*
    property thunk_address : Win32cr::System::WindowsProgramming::IMAGE_THUNK_DATA32*
    property target_dll_name : Win32cr::Foundation::PSTR
    property target_api_descriptor : Win32cr::System::WindowsProgramming::DELAYLOAD_PROC_DESCRIPTOR
    property target_module_base : Void*
    property unused : Void*
    property last_error : UInt32
    def initialize(@size : UInt32, @delayload_descriptor : Win32cr::System::WindowsProgramming::IMAGE_DELAYLOAD_DESCRIPTOR*, @thunk_address : Win32cr::System::WindowsProgramming::IMAGE_THUNK_DATA32*, @target_dll_name : Win32cr::Foundation::PSTR, @target_api_descriptor : Win32cr::System::WindowsProgramming::DELAYLOAD_PROC_DESCRIPTOR, @target_module_base : Void*, @unused : Void*, @last_error : UInt32)
    end
  end
  {% end %}

  @[Extern]
  record ICameraUIControlEventCallbackVtbl,
    query_interface : Proc(ICameraUIControlEventCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICameraUIControlEventCallback*, UInt32),
    release : Proc(ICameraUIControlEventCallback*, UInt32),
    on_startup_complete : Proc(ICameraUIControlEventCallback*, Void),
    on_suspend_complete : Proc(ICameraUIControlEventCallback*, Void),
    on_item_captured : Proc(ICameraUIControlEventCallback*, Win32cr::Foundation::PWSTR, Void),
    on_item_deleted : Proc(ICameraUIControlEventCallback*, Win32cr::Foundation::PWSTR, Void),
    on_closed : Proc(ICameraUIControlEventCallback*, Void)


  @[Extern]
  record ICameraUIControlEventCallback, lpVtbl : ICameraUIControlEventCallbackVtbl* do
    GUID = LibC::GUID.new(0x1bfa0c2c_u32, 0xfbcd_u16, 0x4776_u16, StaticArray[0xbd_u8, 0xa4_u8, 0x88_u8, 0xbf_u8, 0x97_u8, 0x4e_u8, 0x74_u8, 0xf4_u8])
    def query_interface(this : ICameraUIControlEventCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICameraUIControlEventCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICameraUIControlEventCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_startup_complete(this : ICameraUIControlEventCallback*) : Void
      @lpVtbl.try &.value.on_startup_complete.call(this)
    end
    def on_suspend_complete(this : ICameraUIControlEventCallback*) : Void
      @lpVtbl.try &.value.on_suspend_complete.call(this)
    end
    def on_item_captured(this : ICameraUIControlEventCallback*, pszPath : Win32cr::Foundation::PWSTR) : Void
      @lpVtbl.try &.value.on_item_captured.call(this, pszPath)
    end
    def on_item_deleted(this : ICameraUIControlEventCallback*, pszPath : Win32cr::Foundation::PWSTR) : Void
      @lpVtbl.try &.value.on_item_deleted.call(this, pszPath)
    end
    def on_closed(this : ICameraUIControlEventCallback*) : Void
      @lpVtbl.try &.value.on_closed.call(this)
    end

  end

  @[Extern]
  record ICameraUIControlVtbl,
    query_interface : Proc(ICameraUIControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICameraUIControl*, UInt32),
    release : Proc(ICameraUIControl*, UInt32),
    show : Proc(ICameraUIControl*, Void*, Win32cr::System::WindowsProgramming::CameraUIControlMode, Win32cr::System::WindowsProgramming::CameraUIControlLinearSelectionMode, Win32cr::System::WindowsProgramming::CameraUIControlCaptureMode, Win32cr::System::WindowsProgramming::CameraUIControlPhotoFormat, Win32cr::System::WindowsProgramming::CameraUIControlVideoFormat, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(ICameraUIControl*, Win32cr::Foundation::HRESULT),
    suspend : Proc(ICameraUIControl*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    resume : Proc(ICameraUIControl*, Win32cr::Foundation::HRESULT),
    get_current_view_type : Proc(ICameraUIControl*, Win32cr::System::WindowsProgramming::CameraUIControlViewType*, Win32cr::Foundation::HRESULT),
    get_active_item : Proc(ICameraUIControl*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_selected_items : Proc(ICameraUIControl*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    remove_captured_item : Proc(ICameraUIControl*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICameraUIControl, lpVtbl : ICameraUIControlVtbl* do
    GUID = LibC::GUID.new(0xb8733adf_u32, 0x3d68_u16, 0x4b8f_u16, StaticArray[0xbb_u8, 0x8_u8, 0xe2_u8, 0x8a_u8, 0xb_u8, 0xed_u8, 0x3_u8, 0x76_u8])
    def query_interface(this : ICameraUIControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICameraUIControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICameraUIControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def show(this : ICameraUIControl*, pWindow : Void*, mode : Win32cr::System::WindowsProgramming::CameraUIControlMode, selectionMode : Win32cr::System::WindowsProgramming::CameraUIControlLinearSelectionMode, captureMode : Win32cr::System::WindowsProgramming::CameraUIControlCaptureMode, photoFormat : Win32cr::System::WindowsProgramming::CameraUIControlPhotoFormat, videoFormat : Win32cr::System::WindowsProgramming::CameraUIControlVideoFormat, bHasCloseButton : Win32cr::Foundation::BOOL, pEventCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, pWindow, mode, selectionMode, captureMode, photoFormat, videoFormat, bHasCloseButton, pEventCallback)
    end
    def close(this : ICameraUIControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def suspend(this : ICameraUIControl*, pbDeferralRequired : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this, pbDeferralRequired)
    end
    def resume(this : ICameraUIControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def get_current_view_type(this : ICameraUIControl*, pViewType : Win32cr::System::WindowsProgramming::CameraUIControlViewType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_view_type.call(this, pViewType)
    end
    def get_active_item(this : ICameraUIControl*, pbstrActiveItemPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_item.call(this, pbstrActiveItemPath)
    end
    def get_selected_items(this : ICameraUIControl*, ppSelectedItemPaths : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selected_items.call(this, ppSelectedItemPaths)
    end
    def remove_captured_item(this : ICameraUIControl*, pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_captured_item.call(this, pszPath)
    end

  end

  @[Extern]
  record IEditionUpgradeHelperVtbl,
    query_interface : Proc(IEditionUpgradeHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEditionUpgradeHelper*, UInt32),
    release : Proc(IEditionUpgradeHelper*, UInt32),
    can_upgrade : Proc(IEditionUpgradeHelper*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    update_operating_system : Proc(IEditionUpgradeHelper*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    show_product_key_ui : Proc(IEditionUpgradeHelper*, Win32cr::Foundation::HRESULT),
    get_os_product_content_id : Proc(IEditionUpgradeHelper*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_genuine_local_status : Proc(IEditionUpgradeHelper*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEditionUpgradeHelper, lpVtbl : IEditionUpgradeHelperVtbl* do
    GUID = LibC::GUID.new(0xd3e9e342_u32, 0x5deb_u16, 0x43b6_u16, StaticArray[0x84_u8, 0x9e_u8, 0x69_u8, 0x13_u8, 0xb8_u8, 0x5d_u8, 0x50_u8, 0x3a_u8])
    def query_interface(this : IEditionUpgradeHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEditionUpgradeHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEditionUpgradeHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def can_upgrade(this : IEditionUpgradeHelper*, isAllowed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_upgrade.call(this, isAllowed)
    end
    def update_operating_system(this : IEditionUpgradeHelper*, contentId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_operating_system.call(this, contentId)
    end
    def show_product_key_ui(this : IEditionUpgradeHelper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_product_key_ui.call(this)
    end
    def get_os_product_content_id(this : IEditionUpgradeHelper*, contentId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_os_product_content_id.call(this, contentId)
    end
    def get_genuine_local_status(this : IEditionUpgradeHelper*, isGenuine : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_genuine_local_status.call(this, isGenuine)
    end

  end

  @[Extern]
  record IWindowsLockModeHelperVtbl,
    query_interface : Proc(IWindowsLockModeHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsLockModeHelper*, UInt32),
    release : Proc(IWindowsLockModeHelper*, UInt32),
    get_s_mode : Proc(IWindowsLockModeHelper*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsLockModeHelper, lpVtbl : IWindowsLockModeHelperVtbl* do
    GUID = LibC::GUID.new(0xf342d19e_u32, 0xcc22_u16, 0x4648_u16, StaticArray[0xbb_u8, 0x5d_u8, 0x3_u8, 0xcc_u8, 0xf7_u8, 0x5b_u8, 0x47_u8, 0xc5_u8])
    def query_interface(this : IWindowsLockModeHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsLockModeHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsLockModeHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_s_mode(this : IWindowsLockModeHelper*, isSmode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_s_mode.call(this, isSmode)
    end

  end

  @[Extern]
  record IEditionUpgradeBrokerVtbl,
    query_interface : Proc(IEditionUpgradeBroker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEditionUpgradeBroker*, UInt32),
    release : Proc(IEditionUpgradeBroker*, UInt32),
    initialize_parent_window : Proc(IEditionUpgradeBroker*, UInt32, Win32cr::Foundation::HRESULT),
    update_operating_system : Proc(IEditionUpgradeBroker*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    show_product_key_ui : Proc(IEditionUpgradeBroker*, Win32cr::Foundation::HRESULT),
    can_upgrade : Proc(IEditionUpgradeBroker*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEditionUpgradeBroker, lpVtbl : IEditionUpgradeBrokerVtbl* do
    GUID = LibC::GUID.new(0xff19cbcf_u32, 0x9455_u16, 0x4937_u16, StaticArray[0xb8_u8, 0x72_u8, 0x6b_u8, 0x79_u8, 0x29_u8, 0xa4_u8, 0x60_u8, 0xaf_u8])
    def query_interface(this : IEditionUpgradeBroker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEditionUpgradeBroker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEditionUpgradeBroker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize_parent_window(this : IEditionUpgradeBroker*, parentHandle : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_parent_window.call(this, parentHandle)
    end
    def update_operating_system(this : IEditionUpgradeBroker*, parameter : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_operating_system.call(this, parameter)
    end
    def show_product_key_ui(this : IEditionUpgradeBroker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_product_key_ui.call(this)
    end
    def can_upgrade(this : IEditionUpgradeBroker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_upgrade.call(this)
    end

  end

  @[Extern]
  record IContainerActivationHelperVtbl,
    query_interface : Proc(IContainerActivationHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContainerActivationHelper*, UInt32),
    release : Proc(IContainerActivationHelper*, UInt32),
    can_activate_client_vm : Proc(IContainerActivationHelper*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContainerActivationHelper, lpVtbl : IContainerActivationHelperVtbl* do
    GUID = LibC::GUID.new(0xb524f93f_u32, 0x80d5_u16, 0x4ec7_u16, StaticArray[0xae_u8, 0x9e_u8, 0xd6_u8, 0x6e_u8, 0x93_u8, 0xad_u8, 0xe1_u8, 0xfa_u8])
    def query_interface(this : IContainerActivationHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContainerActivationHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContainerActivationHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def can_activate_client_vm(this : IContainerActivationHelper*, isAllowed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_activate_client_vm.call(this, isAllowed)
    end

  end

  @[Extern]
  record IClipServiceNotificationHelperVtbl,
    query_interface : Proc(IClipServiceNotificationHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IClipServiceNotificationHelper*, UInt32),
    release : Proc(IClipServiceNotificationHelper*, UInt32),
    show_toast : Proc(IClipServiceNotificationHelper*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IClipServiceNotificationHelper, lpVtbl : IClipServiceNotificationHelperVtbl* do
    GUID = LibC::GUID.new(0xc39948f0_u32, 0x6142_u16, 0x44fd_u16, StaticArray[0x98_u8, 0xca_u8, 0xe1_u8, 0x68_u8, 0x1a_u8, 0x8d_u8, 0x68_u8, 0xb5_u8])
    def query_interface(this : IClipServiceNotificationHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IClipServiceNotificationHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IClipServiceNotificationHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def show_toast(this : IClipServiceNotificationHelper*, titleText : Win32cr::Foundation::BSTR, bodyText : Win32cr::Foundation::BSTR, packageName : Win32cr::Foundation::BSTR, appId : Win32cr::Foundation::BSTR, launchCommand : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_toast.call(this, titleText, bodyText, packageName, appId, launchCommand)
    end

  end

  @[Extern]
  record IDefaultBrowserSyncSettingsVtbl,
    query_interface : Proc(IDefaultBrowserSyncSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDefaultBrowserSyncSettings*, UInt32),
    release : Proc(IDefaultBrowserSyncSettings*, UInt32),
    is_enabled : Proc(IDefaultBrowserSyncSettings*, Win32cr::Foundation::BOOL)


  @[Extern]
  record IDefaultBrowserSyncSettings, lpVtbl : IDefaultBrowserSyncSettingsVtbl* do
    GUID = LibC::GUID.new(0x7a27faad_u32, 0x5ae6_u16, 0x4255_u16, StaticArray[0x90_u8, 0x30_u8, 0xc5_u8, 0x30_u8, 0x93_u8, 0x62_u8, 0x92_u8, 0xe3_u8])
    def query_interface(this : IDefaultBrowserSyncSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDefaultBrowserSyncSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDefaultBrowserSyncSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_enabled(this : IDefaultBrowserSyncSettings*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_enabled.call(this)
    end

  end

  @[Extern]
  record IDeleteBrowsingHistoryVtbl,
    query_interface : Proc(IDeleteBrowsingHistory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDeleteBrowsingHistory*, UInt32),
    release : Proc(IDeleteBrowsingHistory*, UInt32),
    delete_browsing_history : Proc(IDeleteBrowsingHistory*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDeleteBrowsingHistory, lpVtbl : IDeleteBrowsingHistoryVtbl* do
    GUID = LibC::GUID.new(0xcf38ed4b_u32, 0x2be7_u16, 0x4461_u16, StaticArray[0x8b_u8, 0x5e_u8, 0x9a_u8, 0x46_u8, 0x6d_u8, 0xc8_u8, 0x2a_u8, 0xe3_u8])
    def query_interface(this : IDeleteBrowsingHistory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDeleteBrowsingHistory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDeleteBrowsingHistory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def delete_browsing_history(this : IDeleteBrowsingHistory*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_browsing_history.call(this, dwFlags)
    end

  end

  def rtlGetReturnAddressHijackTarget : LibC::UIntPtrT
    C.RtlGetReturnAddressHijackTarget
  end

  def rtlRaiseCustomSystemEventTrigger(trigger_config : Win32cr::System::WindowsProgramming::CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*) : UInt32
    C.RtlRaiseCustomSystemEventTrigger(trigger_config)
  end

  def isApiSetImplemented(contract : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.IsApiSetImplemented(contract)
  end

  def queryThreadCycleTime(thread_handle : Win32cr::Foundation::HANDLE, cycle_time : UInt64*) : Win32cr::Foundation::BOOL
    C.QueryThreadCycleTime(thread_handle, cycle_time)
  end

  def queryProcessCycleTime(process_handle : Win32cr::Foundation::HANDLE, cycle_time : UInt64*) : Win32cr::Foundation::BOOL
    C.QueryProcessCycleTime(process_handle, cycle_time)
  end

  def queryIdleProcessorCycleTime(buffer_length : UInt32*, processor_idle_cycle_time : UInt64*) : Win32cr::Foundation::BOOL
    C.QueryIdleProcessorCycleTime(buffer_length, processor_idle_cycle_time)
  end

  def queryIdleProcessorCycleTimeEx(group : UInt16, buffer_length : UInt32*, processor_idle_cycle_time : UInt64*) : Win32cr::Foundation::BOOL
    C.QueryIdleProcessorCycleTimeEx(group, buffer_length, processor_idle_cycle_time)
  end

  def queryInterruptTimePrecise(lpInterruptTimePrecise : UInt64*) : Void
    C.QueryInterruptTimePrecise(lpInterruptTimePrecise)
  end

  def queryUnbiasedInterruptTimePrecise(lpUnbiasedInterruptTimePrecise : UInt64*) : Void
    C.QueryUnbiasedInterruptTimePrecise(lpUnbiasedInterruptTimePrecise)
  end

  def queryInterruptTime(lpInterruptTime : UInt64*) : Void
    C.QueryInterruptTime(lpInterruptTime)
  end

  def queryUnbiasedInterruptTime(unbiased_time : UInt64*) : Win32cr::Foundation::BOOL
    C.QueryUnbiasedInterruptTime(unbiased_time)
  end

  def queryAuxiliaryCounterFrequency(lpAuxiliaryCounterFrequency : UInt64*) : Win32cr::Foundation::HRESULT
    C.QueryAuxiliaryCounterFrequency(lpAuxiliaryCounterFrequency)
  end

  def convertAuxiliaryCounterToPerformanceCounter(ullAuxiliaryCounterValue : UInt64, lpPerformanceCounterValue : UInt64*, lpConversionError : UInt64*) : Win32cr::Foundation::HRESULT
    C.ConvertAuxiliaryCounterToPerformanceCounter(ullAuxiliaryCounterValue, lpPerformanceCounterValue, lpConversionError)
  end

  def convertPerformanceCounterToAuxiliaryCounter(ullPerformanceCounterValue : UInt64, lpAuxiliaryCounterValue : UInt64*, lpConversionError : UInt64*) : Win32cr::Foundation::HRESULT
    C.ConvertPerformanceCounterToAuxiliaryCounter(ullPerformanceCounterValue, lpAuxiliaryCounterValue, lpConversionError)
  end

  def globalCompact(dwMinFree : UInt32) : LibC::UIntPtrT
    C.GlobalCompact(dwMinFree)
  end

  def globalFix(hMem : LibC::IntPtrT) : Void
    C.GlobalFix(hMem)
  end

  def globalUnfix(hMem : LibC::IntPtrT) : Void
    C.GlobalUnfix(hMem)
  end

  def globalWire(hMem : LibC::IntPtrT) : Void*
    C.GlobalWire(hMem)
  end

  def globalUnWire(hMem : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.GlobalUnWire(hMem)
  end

  def localShrink(hMem : LibC::IntPtrT, cbNewSize : UInt32) : LibC::UIntPtrT
    C.LocalShrink(hMem, cbNewSize)
  end

  def localCompact(uMinFree : UInt32) : LibC::UIntPtrT
    C.LocalCompact(uMinFree)
  end

  def setEnvironmentStringsA(new_environment : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.SetEnvironmentStringsA(new_environment)
  end

  def setHandleCount(uNumber : UInt32) : UInt32
    C.SetHandleCount(uNumber)
  end

  def requestDeviceWakeup(hDevice : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.RequestDeviceWakeup(hDevice)
  end

  def cancelDeviceWakeupRequest(hDevice : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.CancelDeviceWakeupRequest(hDevice)
  end

  def setMessageWaitingIndicator(hMsgIndicator : Win32cr::Foundation::HANDLE, ulMsgCount : UInt32) : Win32cr::Foundation::BOOL
    C.SetMessageWaitingIndicator(hMsgIndicator, ulMsgCount)
  end

  def mulDiv(nNumber : Int32, nNumerator : Int32, nDenominator : Int32) : Int32
    C.MulDiv(nNumber, nNumerator, nDenominator)
  end

  def getSystemRegistryQuota(pdwQuotaAllowed : UInt32*, pdwQuotaUsed : UInt32*) : Win32cr::Foundation::BOOL
    C.GetSystemRegistryQuota(pdwQuotaAllowed, pdwQuotaUsed)
  end

  def fileTimeToDosDateTime(lpFileTime : Win32cr::Foundation::FILETIME*, lpFatDate : UInt16*, lpFatTime : UInt16*) : Win32cr::Foundation::BOOL
    C.FileTimeToDosDateTime(lpFileTime, lpFatDate, lpFatTime)
  end

  def dosDateTimeToFileTime(wFatDate : UInt16, wFatTime : UInt16, lpFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL
    C.DosDateTimeToFileTime(wFatDate, wFatTime, lpFileTime)
  end

  def _lopen(lpPathName : Win32cr::Foundation::PSTR, iReadWrite : Int32) : Int32
    C._lopen(lpPathName, iReadWrite)
  end

  def _lcreat(lpPathName : Win32cr::Foundation::PSTR, iAttribute : Int32) : Int32
    C._lcreat(lpPathName, iAttribute)
  end

  def _lread(hFile : Int32, lpBuffer : Void*, uBytes : UInt32) : UInt32
    C._lread(hFile, lpBuffer, uBytes)
  end

  def _lwrite(hFile : Int32, lpBuffer : Win32cr::Foundation::PSTR, uBytes : UInt32) : UInt32
    C._lwrite(hFile, lpBuffer, uBytes)
  end

  def _hread(hFile : Int32, lpBuffer : Void*, lBytes : Int32) : Int32
    C._hread(hFile, lpBuffer, lBytes)
  end

  def _hwrite(hFile : Int32, lpBuffer : Win32cr::Foundation::PSTR, lBytes : Int32) : Int32
    C._hwrite(hFile, lpBuffer, lBytes)
  end

  def _lclose(hFile : Int32) : Int32
    C._lclose(hFile)
  end

  def _llseek(hFile : Int32, lOffset : Int32, iOrigin : Int32) : Int32
    C._llseek(hFile, lOffset, iOrigin)
  end

  def signalObjectAndWait(hObjectToSignal : Win32cr::Foundation::HANDLE, hObjectToWaitOn : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32
    C.SignalObjectAndWait(hObjectToSignal, hObjectToWaitOn, dwMilliseconds, bAlertable)
  end

  def openMutexA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.OpenMutexA(dwDesiredAccess, bInheritHandle, lpName)
  end

  def openSemaphoreA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.OpenSemaphoreA(dwDesiredAccess, bInheritHandle, lpName)
  end

  def createWaitableTimerA(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.CreateWaitableTimerA(lpTimerAttributes, bManualReset, lpTimerName)
  end

  def openWaitableTimerA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.OpenWaitableTimerA(dwDesiredAccess, bInheritHandle, lpTimerName)
  end

  def createWaitableTimerExA(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpTimerName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateWaitableTimerExA(lpTimerAttributes, lpTimerName, dwFlags, dwDesiredAccess)
  end

  def getFirmwareEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pBuffer : Void*, nSize : UInt32) : UInt32
    C.GetFirmwareEnvironmentVariableA(lpName, lpGuid, pBuffer, nSize)
  end

  def getFirmwareEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pBuffer : Void*, nSize : UInt32) : UInt32
    C.GetFirmwareEnvironmentVariableW(lpName, lpGuid, pBuffer, nSize)
  end

  def getFirmwareEnvironmentVariableExA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pBuffer : Void*, nSize : UInt32, pdwAttribubutes : UInt32*) : UInt32
    C.GetFirmwareEnvironmentVariableExA(lpName, lpGuid, pBuffer, nSize, pdwAttribubutes)
  end

  def getFirmwareEnvironmentVariableExW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pBuffer : Void*, nSize : UInt32, pdwAttribubutes : UInt32*) : UInt32
    C.GetFirmwareEnvironmentVariableExW(lpName, lpGuid, pBuffer, nSize, pdwAttribubutes)
  end

  def setFirmwareEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pValue : Void*, nSize : UInt32) : Win32cr::Foundation::BOOL
    C.SetFirmwareEnvironmentVariableA(lpName, lpGuid, pValue, nSize)
  end

  def setFirmwareEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pValue : Void*, nSize : UInt32) : Win32cr::Foundation::BOOL
    C.SetFirmwareEnvironmentVariableW(lpName, lpGuid, pValue, nSize)
  end

  def setFirmwareEnvironmentVariableExA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pValue : Void*, nSize : UInt32, dwAttributes : UInt32) : Win32cr::Foundation::BOOL
    C.SetFirmwareEnvironmentVariableExA(lpName, lpGuid, pValue, nSize, dwAttributes)
  end

  def setFirmwareEnvironmentVariableExW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pValue : Void*, nSize : UInt32, dwAttributes : UInt32) : Win32cr::Foundation::BOOL
    C.SetFirmwareEnvironmentVariableExW(lpName, lpGuid, pValue, nSize, dwAttributes)
  end

  def isNativeVhdBoot(native_vhd_boot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.IsNativeVhdBoot(native_vhd_boot)
  end

  def getProfileIntA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, nDefault : Int32) : UInt32
    C.GetProfileIntA(lpAppName, lpKeyName, nDefault)
  end

  def getProfileIntW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, nDefault : Int32) : UInt32
    C.GetProfileIntW(lpAppName, lpKeyName, nDefault)
  end

  def getProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpDefault : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32) : UInt32
    C.GetProfileStringA(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize)
  end

  def getProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpDefault : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32) : UInt32
    C.GetProfileStringW(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize)
  end

  def writeProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.WriteProfileStringA(lpAppName, lpKeyName, lpString)
  end

  def writeProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WriteProfileStringW(lpAppName, lpKeyName, lpString)
  end

  def getProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32) : UInt32
    C.GetProfileSectionA(lpAppName, lpReturnedString, nSize)
  end

  def getProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32) : UInt32
    C.GetProfileSectionW(lpAppName, lpReturnedString, nSize)
  end

  def writeProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.WriteProfileSectionA(lpAppName, lpString)
  end

  def writeProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WriteProfileSectionW(lpAppName, lpString)
  end

  def getPrivateProfileIntA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, nDefault : Int32, lpFileName : Win32cr::Foundation::PSTR) : UInt32
    C.GetPrivateProfileIntA(lpAppName, lpKeyName, nDefault, lpFileName)
  end

  def getPrivateProfileIntW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, nDefault : Int32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32
    C.GetPrivateProfileIntW(lpAppName, lpKeyName, nDefault, lpFileName)
  end

  def getPrivateProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpDefault : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32, lpFileName : Win32cr::Foundation::PSTR) : UInt32
    C.GetPrivateProfileStringA(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize, lpFileName)
  end

  def getPrivateProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpDefault : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32
    C.GetPrivateProfileStringW(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize, lpFileName)
  end

  def writePrivateProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.WritePrivateProfileStringA(lpAppName, lpKeyName, lpString, lpFileName)
  end

  def writePrivateProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WritePrivateProfileStringW(lpAppName, lpKeyName, lpString, lpFileName)
  end

  def getPrivateProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32, lpFileName : Win32cr::Foundation::PSTR) : UInt32
    C.GetPrivateProfileSectionA(lpAppName, lpReturnedString, nSize, lpFileName)
  end

  def getPrivateProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32
    C.GetPrivateProfileSectionW(lpAppName, lpReturnedString, nSize, lpFileName)
  end

  def writePrivateProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.WritePrivateProfileSectionA(lpAppName, lpString, lpFileName)
  end

  def writePrivateProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WritePrivateProfileSectionW(lpAppName, lpString, lpFileName)
  end

  def getPrivateProfileSectionNamesA(lpszReturnBuffer : UInt8*, nSize : UInt32, lpFileName : Win32cr::Foundation::PSTR) : UInt32
    C.GetPrivateProfileSectionNamesA(lpszReturnBuffer, nSize, lpFileName)
  end

  def getPrivateProfileSectionNamesW(lpszReturnBuffer : UInt16*, nSize : UInt32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32
    C.GetPrivateProfileSectionNamesW(lpszReturnBuffer, nSize, lpFileName)
  end

  def getPrivateProfileStructA(lpszSection : Win32cr::Foundation::PSTR, lpszKey : Win32cr::Foundation::PSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.GetPrivateProfileStructA(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile)
  end

  def getPrivateProfileStructW(lpszSection : Win32cr::Foundation::PWSTR, lpszKey : Win32cr::Foundation::PWSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.GetPrivateProfileStructW(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile)
  end

  def writePrivateProfileStructA(lpszSection : Win32cr::Foundation::PSTR, lpszKey : Win32cr::Foundation::PSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.WritePrivateProfileStructA(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile)
  end

  def writePrivateProfileStructW(lpszSection : Win32cr::Foundation::PWSTR, lpszKey : Win32cr::Foundation::PWSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WritePrivateProfileStructW(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile)
  end

  def isBadHugeReadPtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.IsBadHugeReadPtr(lp, ucb)
  end

  def isBadHugeWritePtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.IsBadHugeWritePtr(lp, ucb)
  end

  def getComputerNameA(lpBuffer : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetComputerNameA(lpBuffer, nSize)
  end

  def getComputerNameW(lpBuffer : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetComputerNameW(lpBuffer, nSize)
  end

  def dnsHostnameToComputerNameA(hostname : Win32cr::Foundation::PSTR, computer_name : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOL
    C.DnsHostnameToComputerNameA(hostname, computer_name, nSize)
  end

  def dnsHostnameToComputerNameW(hostname : Win32cr::Foundation::PWSTR, computer_name : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOL
    C.DnsHostnameToComputerNameW(hostname, computer_name, nSize)
  end

  def getUserNameA(lpBuffer : UInt8*, pcbBuffer : UInt32*) : Win32cr::Foundation::BOOL
    C.GetUserNameA(lpBuffer, pcbBuffer)
  end

  def getUserNameW(lpBuffer : UInt16*, pcbBuffer : UInt32*) : Win32cr::Foundation::BOOL
    C.GetUserNameW(lpBuffer, pcbBuffer)
  end

  def isTokenUntrusted(token_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.IsTokenUntrusted(token_handle)
  end

  def cancelTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.CancelTimerQueueTimer(timer_queue, timer)
  end

  def getCurrentHwProfileA(lpHwProfileInfo : Win32cr::System::WindowsProgramming::HW_PROFILE_INFOA*) : Win32cr::Foundation::BOOL
    C.GetCurrentHwProfileA(lpHwProfileInfo)
  end

  def getCurrentHwProfileW(lpHwProfileInfo : Win32cr::System::WindowsProgramming::HW_PROFILE_INFOW*) : Win32cr::Foundation::BOOL
    C.GetCurrentHwProfileW(lpHwProfileInfo)
  end

  def replacePartitionUnit(target_partition : Win32cr::Foundation::PWSTR, spare_partition : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::Foundation::BOOL
    C.ReplacePartitionUnit(target_partition, spare_partition, flags)
  end

{% if flag?(:i386) || flag?(:x86_64) %}
  def getThreadEnabledXStateFeatures : UInt64
    C.GetThreadEnabledXStateFeatures
  end
{% end %}

{% if flag?(:i386) || flag?(:x86_64) %}
  def enableProcessOptionalXStateFeatures(features : UInt64) : Win32cr::Foundation::BOOL
    C.EnableProcessOptionalXStateFeatures(features)
  end
{% end %}

  def raiseCustomSystemEventTrigger(custom_system_event_trigger_config : Win32cr::System::WindowsProgramming::CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*) : UInt32
    C.RaiseCustomSystemEventTrigger(custom_system_event_trigger_config)
  end

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawLstrcmpW(string1 : UInt16*, string2 : UInt16*) : Int32
    C.uaw_lstrcmpW(string1, string2)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawLstrcmpiW(string1 : UInt16*, string2 : UInt16*) : Int32
    C.uaw_lstrcmpiW(string1, string2)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawLstrlenW(string : UInt16*) : Int32
    C.uaw_lstrlenW(string)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawWcschr(string : UInt16*, character : UInt16) : UInt16*
    C.uaw_wcschr(string, character)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawWcscpy(destination : UInt16*, source : UInt16*) : UInt16*
    C.uaw_wcscpy(destination, source)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawWcsicmp(string1 : UInt16*, string2 : UInt16*) : Int32
    C.uaw_wcsicmp(string1, string2)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawWcslen(string : UInt16*) : LibC::UIntPtrT
    C.uaw_wcslen(string)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def uawWcsrchr(string : UInt16*, character : UInt16) : UInt16*
    C.uaw_wcsrchr(string, character)
  end
{% end %}

  def ntClose(handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::NTSTATUS
    C.NtClose(handle)
  end

  def ntOpenFile(file_handle : Win32cr::Foundation::HANDLE*, desired_access : UInt32, object_attributes : Win32cr::System::WindowsProgramming::OBJECT_ATTRIBUTES*, io_status_block : Win32cr::System::WindowsProgramming::IO_STATUS_BLOCK*, share_access : UInt32, open_options : UInt32) : Win32cr::Foundation::NTSTATUS
    C.NtOpenFile(file_handle, desired_access, object_attributes, io_status_block, share_access, open_options)
  end

  def ntRenameKey(key_handle : Win32cr::Foundation::HANDLE, new_name : Win32cr::Foundation::UNICODE_STRING*) : Win32cr::Foundation::NTSTATUS
    C.NtRenameKey(key_handle, new_name)
  end

  def ntNotifyChangeMultipleKeys(master_key_handle : Win32cr::Foundation::HANDLE, count : UInt32, subordinate_objects : Win32cr::System::WindowsProgramming::OBJECT_ATTRIBUTES*, event : Win32cr::Foundation::HANDLE, apc_routine : Win32cr::System::WindowsProgramming::PIO_APC_ROUTINE, apc_context : Void*, io_status_block : Win32cr::System::WindowsProgramming::IO_STATUS_BLOCK*, completion_filter : UInt32, watch_tree : Win32cr::Foundation::BOOLEAN, buffer : Void*, buffer_size : UInt32, asynchronous : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS
    C.NtNotifyChangeMultipleKeys(master_key_handle, count, subordinate_objects, event, apc_routine, apc_context, io_status_block, completion_filter, watch_tree, buffer, buffer_size, asynchronous)
  end

  def ntQueryMultipleValueKey(key_handle : Win32cr::Foundation::HANDLE, value_entries : Win32cr::System::WindowsProgramming::KEY_VALUE_ENTRY*, entry_count : UInt32, value_buffer : Void*, buffer_length : UInt32*, required_buffer_length : UInt32*) : Win32cr::Foundation::NTSTATUS
    C.NtQueryMultipleValueKey(key_handle, value_entries, entry_count, value_buffer, buffer_length, required_buffer_length)
  end

  def ntSetInformationKey(key_handle : Win32cr::Foundation::HANDLE, key_set_information_class : Win32cr::System::WindowsProgramming::KEY_SET_INFORMATION_CLASS, key_set_information : Void*, key_set_information_length : UInt32) : Win32cr::Foundation::NTSTATUS
    C.NtSetInformationKey(key_handle, key_set_information_class, key_set_information, key_set_information_length)
  end

  def ntDeviceIoControlFile(file_handle : Win32cr::Foundation::HANDLE, event : Win32cr::Foundation::HANDLE, apc_routine : Win32cr::System::WindowsProgramming::PIO_APC_ROUTINE, apc_context : Void*, io_status_block : Win32cr::System::WindowsProgramming::IO_STATUS_BLOCK*, io_control_code : UInt32, input_buffer : Void*, input_buffer_length : UInt32, output_buffer : Void*, output_buffer_length : UInt32) : Win32cr::Foundation::NTSTATUS
    C.NtDeviceIoControlFile(file_handle, event, apc_routine, apc_context, io_status_block, io_control_code, input_buffer, input_buffer_length, output_buffer, output_buffer_length)
  end

  def ntWaitForSingleObject(handle : Win32cr::Foundation::HANDLE, alertable : Win32cr::Foundation::BOOLEAN, timeout : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::NTSTATUS
    C.NtWaitForSingleObject(handle, alertable, timeout)
  end

  def rtlIsNameLegalDOS8Dot3(name : Win32cr::Foundation::UNICODE_STRING*, oem_name : Win32cr::System::Kernel::STRING*, name_contains_spaces : Win32cr::Foundation::BOOLEAN*) : Win32cr::Foundation::BOOLEAN
    C.RtlIsNameLegalDOS8Dot3(name, oem_name, name_contains_spaces)
  end

  def ntQueryObject(handle : Win32cr::Foundation::HANDLE, object_information_class : Win32cr::System::WindowsProgramming::OBJECT_INFORMATION_CLASS, object_information : Void*, object_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS
    C.NtQueryObject(handle, object_information_class, object_information, object_information_length, return_length)
  end

  def ntQuerySystemInformation(system_information_class : Win32cr::System::WindowsProgramming::SYSTEM_INFORMATION_CLASS, system_information : Void*, system_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS
    C.NtQuerySystemInformation(system_information_class, system_information, system_information_length, return_length)
  end

  def ntQuerySystemTime(system_time : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::NTSTATUS
    C.NtQuerySystemTime(system_time)
  end

  def ntQueryTimerResolution(maximum_time : UInt32*, minimum_time : UInt32*, current_time : UInt32*) : Win32cr::Foundation::NTSTATUS
    C.NtQueryTimerResolution(maximum_time, minimum_time, current_time)
  end

  def rtlLocalTimeToSystemTime(local_time : Win32cr::Foundation::LARGE_INTEGER*, system_time : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::NTSTATUS
    C.RtlLocalTimeToSystemTime(local_time, system_time)
  end

  def rtlTimeToSecondsSince1970(time : Win32cr::Foundation::LARGE_INTEGER*, elapsed_seconds : UInt32*) : Win32cr::Foundation::BOOLEAN
    C.RtlTimeToSecondsSince1970(time, elapsed_seconds)
  end

  def rtlFreeAnsiString(ansi_string : Win32cr::System::Kernel::STRING*) : Void
    C.RtlFreeAnsiString(ansi_string)
  end

  def rtlFreeUnicodeString(unicode_string : Win32cr::Foundation::UNICODE_STRING*) : Void
    C.RtlFreeUnicodeString(unicode_string)
  end

  def rtlFreeOemString(oem_string : Win32cr::System::Kernel::STRING*) : Void
    C.RtlFreeOemString(oem_string)
  end

  def rtlInitString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Void
    C.RtlInitString(destination_string, source_string)
  end

  def rtlInitStringEx(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Win32cr::Foundation::NTSTATUS
    C.RtlInitStringEx(destination_string, source_string)
  end

  def rtlInitAnsiString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Void
    C.RtlInitAnsiString(destination_string, source_string)
  end

  def rtlInitAnsiStringEx(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Win32cr::Foundation::NTSTATUS
    C.RtlInitAnsiStringEx(destination_string, source_string)
  end

  def rtlInitUnicodeString(destination_string : Win32cr::Foundation::UNICODE_STRING*, source_string : Win32cr::Foundation::PWSTR) : Void
    C.RtlInitUnicodeString(destination_string, source_string)
  end

  def rtlAnsiStringToUnicodeString(destination_string : Win32cr::Foundation::UNICODE_STRING*, source_string : Win32cr::System::Kernel::STRING*, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS
    C.RtlAnsiStringToUnicodeString(destination_string, source_string, allocate_destination_string)
  end

  def rtlUnicodeStringToAnsiString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Win32cr::Foundation::UNICODE_STRING*, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS
    C.RtlUnicodeStringToAnsiString(destination_string, source_string, allocate_destination_string)
  end

  def rtlUnicodeStringToOemString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Win32cr::Foundation::UNICODE_STRING*, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS
    C.RtlUnicodeStringToOemString(destination_string, source_string, allocate_destination_string)
  end

  def rtlUnicodeToMultiByteSize(bytes_in_multi_byte_string : UInt32*, unicode_string : Win32cr::Foundation::PWSTR, bytes_in_unicode_string : UInt32) : Win32cr::Foundation::NTSTATUS
    C.RtlUnicodeToMultiByteSize(bytes_in_multi_byte_string, unicode_string, bytes_in_unicode_string)
  end

  def rtlCharToInteger(string : Int8*, base : UInt32, value : UInt32*) : Win32cr::Foundation::NTSTATUS
    C.RtlCharToInteger(string, base, value)
  end

  def rtlUniform(seed : UInt32*) : UInt32
    C.RtlUniform(seed)
  end

  def getFeatureEnabledState(featureId : UInt32, changeTime : Win32cr::System::WindowsProgramming::FEATURE_CHANGE_TIME) : Win32cr::System::WindowsProgramming::FEATURE_ENABLED_STATE
    C.GetFeatureEnabledState(featureId, changeTime)
  end

  def recordFeatureUsage(featureId : UInt32, kind : UInt32, addend : UInt32, originName : Win32cr::Foundation::PSTR) : Void
    C.RecordFeatureUsage(featureId, kind, addend, originName)
  end

  def recordFeatureError(featureId : UInt32, error : Win32cr::System::WindowsProgramming::FEATURE_ERROR*) : Void
    C.RecordFeatureError(featureId, error)
  end

  def subscribeFeatureStateChangeNotification(subscription : Win32cr::System::WindowsProgramming::FEATURE_STATE_CHANGE_SUBSCRIPTION*, callback : Win32cr::System::WindowsProgramming::PFEATURE_STATE_CHANGE_CALLBACK, context : Void*) : Void
    C.SubscribeFeatureStateChangeNotification(subscription, callback, context)
  end

  def unsubscribeFeatureStateChangeNotification(subscription : Win32cr::System::WindowsProgramming::FEATURE_STATE_CHANGE_SUBSCRIPTION) : Void
    C.UnsubscribeFeatureStateChangeNotification(subscription)
  end

  def getFeatureVariant(featureId : UInt32, changeTime : Win32cr::System::WindowsProgramming::FEATURE_CHANGE_TIME, payloadId : UInt32*, hasNotification : Win32cr::Foundation::BOOL*) : UInt32
    C.GetFeatureVariant(featureId, changeTime, payloadId, hasNotification)
  end

  def dCIOpenProvider : Win32cr::Graphics::Gdi::HDC
    C.DCIOpenProvider
  end

  def dCICloseProvider(hdc : Win32cr::Graphics::Gdi::HDC) : Void
    C.DCICloseProvider(hdc)
  end

  def dCICreatePrimary(hdc : Win32cr::Graphics::Gdi::HDC, lplpSurface : Win32cr::System::WindowsProgramming::DCISURFACEINFO**) : Int32
    C.DCICreatePrimary(hdc, lplpSurface)
  end

  def dCICreateOffscreen(hdc : Win32cr::Graphics::Gdi::HDC, dwCompression : UInt32, dwRedMask : UInt32, dwGreenMask : UInt32, dwBlueMask : UInt32, dwWidth : UInt32, dwHeight : UInt32, dwDCICaps : UInt32, dwBitCount : UInt32, lplpSurface : Win32cr::System::WindowsProgramming::DCIOFFSCREEN**) : Int32
    C.DCICreateOffscreen(hdc, dwCompression, dwRedMask, dwGreenMask, dwBlueMask, dwWidth, dwHeight, dwDCICaps, dwBitCount, lplpSurface)
  end

  def dCICreateOverlay(hdc : Win32cr::Graphics::Gdi::HDC, lpOffscreenSurf : Void*, lplpSurface : Win32cr::System::WindowsProgramming::DCIOVERLAY**) : Int32
    C.DCICreateOverlay(hdc, lpOffscreenSurf, lplpSurface)
  end

  def dCIEnum(hdc : Win32cr::Graphics::Gdi::HDC, lprDst : Win32cr::Foundation::RECT*, lprSrc : Win32cr::Foundation::RECT*, lpFnCallback : Void*, lpContext : Void*) : Int32
    C.DCIEnum(hdc, lprDst, lprSrc, lpFnCallback, lpContext)
  end

  def dCISetSrcDestClip(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*, srcrc : Win32cr::Foundation::RECT*, destrc : Win32cr::Foundation::RECT*, prd : Win32cr::Graphics::Gdi::RGNDATA*) : Int32
    C.DCISetSrcDestClip(pdci, srcrc, destrc, prd)
  end

  def winWatchOpen(hwnd : Win32cr::Foundation::HWND) : Win32cr::System::WindowsProgramming::HWINWATCH
    C.WinWatchOpen(hwnd)
  end

  def winWatchClose(hWW : Win32cr::System::WindowsProgramming::HWINWATCH) : Void
    C.WinWatchClose(hWW)
  end

  def winWatchGetClipList(hWW : Win32cr::System::WindowsProgramming::HWINWATCH, prc : Win32cr::Foundation::RECT*, size : UInt32, prd : Win32cr::Graphics::Gdi::RGNDATA*) : UInt32
    C.WinWatchGetClipList(hWW, prc, size, prd)
  end

  def winWatchDidStatusChange(hWW : Win32cr::System::WindowsProgramming::HWINWATCH) : Win32cr::Foundation::BOOL
    C.WinWatchDidStatusChange(hWW)
  end

  def getWindowRegionData(hwnd : Win32cr::Foundation::HWND, size : UInt32, prd : Win32cr::Graphics::Gdi::RGNDATA*) : UInt32
    C.GetWindowRegionData(hwnd, size, prd)
  end

  def getDCRegionData(hdc : Win32cr::Graphics::Gdi::HDC, size : UInt32, prd : Win32cr::Graphics::Gdi::RGNDATA*) : UInt32
    C.GetDCRegionData(hdc, size, prd)
  end

  def winWatchNotify(hWW : Win32cr::System::WindowsProgramming::HWINWATCH, notify_callback : Win32cr::System::WindowsProgramming::WINWATCHNOTIFYPROC, notify_param : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    C.WinWatchNotify(hWW, notify_callback, notify_param)
  end

  def dCIEndAccess(pdci : Win32cr::System::WindowsProgramming::DCISURFACEINFO*) : Void
    C.DCIEndAccess(pdci)
  end

  def dCIBeginAccess(pdci : Win32cr::System::WindowsProgramming::DCISURFACEINFO*, x : Int32, y : Int32, dx : Int32, dy : Int32) : Int32
    C.DCIBeginAccess(pdci, x, y, dx, dy)
  end

  def dCIDestroy(pdci : Win32cr::System::WindowsProgramming::DCISURFACEINFO*) : Void
    C.DCIDestroy(pdci)
  end

  def dCIDraw(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*) : Int32
    C.DCIDraw(pdci)
  end

  def dCISetClipList(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*, prd : Win32cr::Graphics::Gdi::RGNDATA*) : Int32
    C.DCISetClipList(pdci, prd)
  end

  def dCISetDestination(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*, dst : Win32cr::Foundation::RECT*, src : Win32cr::Foundation::RECT*) : Int32
    C.DCISetDestination(pdci, dst, src)
  end

  def gdiEntry13 : UInt32
    C.GdiEntry13
  end

  def runSetupCommandA(hWnd : Win32cr::Foundation::HWND, szCmdName : Win32cr::Foundation::PSTR, szInfSection : Win32cr::Foundation::PSTR, szDir : Win32cr::Foundation::PSTR, lpszTitle : Win32cr::Foundation::PSTR, phEXE : Win32cr::Foundation::HANDLE*, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.RunSetupCommandA(hWnd, szCmdName, szInfSection, szDir, lpszTitle, phEXE, dwFlags, pvReserved)
  end

  def runSetupCommandW(hWnd : Win32cr::Foundation::HWND, szCmdName : Win32cr::Foundation::PWSTR, szInfSection : Win32cr::Foundation::PWSTR, szDir : Win32cr::Foundation::PWSTR, lpszTitle : Win32cr::Foundation::PWSTR, phEXE : Win32cr::Foundation::HANDLE*, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.RunSetupCommandW(hWnd, szCmdName, szInfSection, szDir, lpszTitle, phEXE, dwFlags, pvReserved)
  end

  def needRebootInit : UInt32
    C.NeedRebootInit
  end

  def needReboot(dwRebootCheck : UInt32) : Win32cr::Foundation::BOOL
    C.NeedReboot(dwRebootCheck)
  end

  def rebootCheckOnInstallA(hwnd : Win32cr::Foundation::HWND, pszINF : Win32cr::Foundation::PSTR, pszSec : Win32cr::Foundation::PSTR, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
    C.RebootCheckOnInstallA(hwnd, pszINF, pszSec, dwReserved)
  end

  def rebootCheckOnInstallW(hwnd : Win32cr::Foundation::HWND, pszINF : Win32cr::Foundation::PWSTR, pszSec : Win32cr::Foundation::PWSTR, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
    C.RebootCheckOnInstallW(hwnd, pszINF, pszSec, dwReserved)
  end

  def translateInfStringA(pszInfFilename : Win32cr::Foundation::PSTR, pszInstallSection : Win32cr::Foundation::PSTR, pszTranslateSection : Win32cr::Foundation::PSTR, pszTranslateKey : Win32cr::Foundation::PSTR, pszBuffer : UInt8*, cchBuffer : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.TranslateInfStringA(pszInfFilename, pszInstallSection, pszTranslateSection, pszTranslateKey, pszBuffer, cchBuffer, pdwRequiredSize, pvReserved)
  end

  def translateInfStringW(pszInfFilename : Win32cr::Foundation::PWSTR, pszInstallSection : Win32cr::Foundation::PWSTR, pszTranslateSection : Win32cr::Foundation::PWSTR, pszTranslateKey : Win32cr::Foundation::PWSTR, pszBuffer : UInt16*, cchBuffer : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.TranslateInfStringW(pszInfFilename, pszInstallSection, pszTranslateSection, pszTranslateKey, pszBuffer, cchBuffer, pdwRequiredSize, pvReserved)
  end

  def regInstallA(hmod : Win32cr::Foundation::HINSTANCE, pszSection : Win32cr::Foundation::PSTR, pstTable : Win32cr::System::WindowsProgramming::STRTABLEA*) : Win32cr::Foundation::HRESULT
    C.RegInstallA(hmod, pszSection, pstTable)
  end

  def regInstallW(hmod : Win32cr::Foundation::HINSTANCE, pszSection : Win32cr::Foundation::PWSTR, pstTable : Win32cr::System::WindowsProgramming::STRTABLEW*) : Win32cr::Foundation::HRESULT
    C.RegInstallW(hmod, pszSection, pstTable)
  end

  def launchINFSectionExW(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    C.LaunchINFSectionExW(hwnd, hInstance, pszParms, nShow)
  end

  def executeCabA(hwnd : Win32cr::Foundation::HWND, pCab : Win32cr::System::WindowsProgramming::CABINFOA*, pReserved : Void*) : Win32cr::Foundation::HRESULT
    C.ExecuteCabA(hwnd, pCab, pReserved)
  end

  def executeCabW(hwnd : Win32cr::Foundation::HWND, pCab : Win32cr::System::WindowsProgramming::CABINFOW*, pReserved : Void*) : Win32cr::Foundation::HRESULT
    C.ExecuteCabW(hwnd, pCab, pReserved)
  end

  def advInstallFileA(hwnd : Win32cr::Foundation::HWND, lpszSourceDir : Win32cr::Foundation::PSTR, lpszSourceFile : Win32cr::Foundation::PSTR, lpszDestDir : Win32cr::Foundation::PSTR, lpszDestFile : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
    C.AdvInstallFileA(hwnd, lpszSourceDir, lpszSourceFile, lpszDestDir, lpszDestFile, dwFlags, dwReserved)
  end

  def advInstallFileW(hwnd : Win32cr::Foundation::HWND, lpszSourceDir : Win32cr::Foundation::PWSTR, lpszSourceFile : Win32cr::Foundation::PWSTR, lpszDestDir : Win32cr::Foundation::PWSTR, lpszDestFile : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
    C.AdvInstallFileW(hwnd, lpszSourceDir, lpszSourceFile, lpszDestDir, lpszDestFile, dwFlags, dwReserved)
  end

  def regSaveRestoreA(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PSTR, hkBckupKey : Win32cr::System::Registry::HKEY, pcszRootKey : Win32cr::Foundation::PSTR, pcszSubKey : Win32cr::Foundation::PSTR, pcszValueName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.RegSaveRestoreA(hWnd, pszTitleString, hkBckupKey, pcszRootKey, pcszSubKey, pcszValueName, dwFlags)
  end

  def regSaveRestoreW(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PWSTR, hkBckupKey : Win32cr::System::Registry::HKEY, pcszRootKey : Win32cr::Foundation::PWSTR, pcszSubKey : Win32cr::Foundation::PWSTR, pcszValueName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.RegSaveRestoreW(hWnd, pszTitleString, hkBckupKey, pcszRootKey, pcszSubKey, pcszValueName, dwFlags)
  end

  def regSaveRestoreOnINFA(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PSTR, pszINF : Win32cr::Foundation::PSTR, pszSection : Win32cr::Foundation::PSTR, hHKLMBackKey : Win32cr::System::Registry::HKEY, hHKCUBackKey : Win32cr::System::Registry::HKEY, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.RegSaveRestoreOnINFA(hWnd, pszTitle, pszINF, pszSection, hHKLMBackKey, hHKCUBackKey, dwFlags)
  end

  def regSaveRestoreOnINFW(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszINF : Win32cr::Foundation::PWSTR, pszSection : Win32cr::Foundation::PWSTR, hHKLMBackKey : Win32cr::System::Registry::HKEY, hHKCUBackKey : Win32cr::System::Registry::HKEY, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.RegSaveRestoreOnINFW(hWnd, pszTitle, pszINF, pszSection, hHKLMBackKey, hHKCUBackKey, dwFlags)
  end

  def regRestoreAllA(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PSTR, hkBckupKey : Win32cr::System::Registry::HKEY) : Win32cr::Foundation::HRESULT
    C.RegRestoreAllA(hWnd, pszTitleString, hkBckupKey)
  end

  def regRestoreAllW(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PWSTR, hkBckupKey : Win32cr::System::Registry::HKEY) : Win32cr::Foundation::HRESULT
    C.RegRestoreAllW(hWnd, pszTitleString, hkBckupKey)
  end

  def fileSaveRestoreW(hDlg : Win32cr::Foundation::HWND, lpFileList : Win32cr::Foundation::PWSTR, lpDir : Win32cr::Foundation::PWSTR, lpBaseName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.FileSaveRestoreW(hDlg, lpFileList, lpDir, lpBaseName, dwFlags)
  end

  def fileSaveRestoreOnINFA(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PSTR, pszINF : Win32cr::Foundation::PSTR, pszSection : Win32cr::Foundation::PSTR, pszBackupDir : Win32cr::Foundation::PSTR, pszBaseBackupFile : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.FileSaveRestoreOnINFA(hWnd, pszTitle, pszINF, pszSection, pszBackupDir, pszBaseBackupFile, dwFlags)
  end

  def fileSaveRestoreOnINFW(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszINF : Win32cr::Foundation::PWSTR, pszSection : Win32cr::Foundation::PWSTR, pszBackupDir : Win32cr::Foundation::PWSTR, pszBaseBackupFile : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.FileSaveRestoreOnINFW(hWnd, pszTitle, pszINF, pszSection, pszBackupDir, pszBaseBackupFile, dwFlags)
  end

  def addDelBackupEntryA(lpcszFileList : Win32cr::Foundation::PSTR, lpcszBackupDir : Win32cr::Foundation::PSTR, lpcszBaseName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.AddDelBackupEntryA(lpcszFileList, lpcszBackupDir, lpcszBaseName, dwFlags)
  end

  def addDelBackupEntryW(lpcszFileList : Win32cr::Foundation::PWSTR, lpcszBackupDir : Win32cr::Foundation::PWSTR, lpcszBaseName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.AddDelBackupEntryW(lpcszFileList, lpcszBackupDir, lpcszBaseName, dwFlags)
  end

  def fileSaveMarkNotExistA(lpFileList : Win32cr::Foundation::PSTR, lpDir : Win32cr::Foundation::PSTR, lpBaseName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
    C.FileSaveMarkNotExistA(lpFileList, lpDir, lpBaseName)
  end

  def fileSaveMarkNotExistW(lpFileList : Win32cr::Foundation::PWSTR, lpDir : Win32cr::Foundation::PWSTR, lpBaseName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.FileSaveMarkNotExistW(lpFileList, lpDir, lpBaseName)
  end

  def getVersionFromFileA(lpszFilename : Win32cr::Foundation::PSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.GetVersionFromFileA(lpszFilename, pdwMSVer, pdwLSVer, bVersion)
  end

  def getVersionFromFileW(lpszFilename : Win32cr::Foundation::PWSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.GetVersionFromFileW(lpszFilename, pdwMSVer, pdwLSVer, bVersion)
  end

  def getVersionFromFileExA(lpszFilename : Win32cr::Foundation::PSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.GetVersionFromFileExA(lpszFilename, pdwMSVer, pdwLSVer, bVersion)
  end

  def getVersionFromFileExW(lpszFilename : Win32cr::Foundation::PWSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.GetVersionFromFileExW(lpszFilename, pdwMSVer, pdwLSVer, bVersion)
  end

  def isNTAdmin(dwReserved : UInt32, lpdwReserved : UInt32*) : Win32cr::Foundation::BOOL
    C.IsNTAdmin(dwReserved, lpdwReserved)
  end

  def delNodeA(pszFileOrDirName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.DelNodeA(pszFileOrDirName, dwFlags)
  end

  def delNodeW(pszFileOrDirName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.DelNodeW(pszFileOrDirName, dwFlags)
  end

  def delNodeRunDLL32W(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    C.DelNodeRunDLL32W(hwnd, hInstance, pszParms, nShow)
  end

  def openINFEngineA(pszInfFilename : Win32cr::Foundation::PSTR, pszInstallSection : Win32cr::Foundation::PSTR, dwFlags : UInt32, phInf : Void**, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.OpenINFEngineA(pszInfFilename, pszInstallSection, dwFlags, phInf, pvReserved)
  end

  def openINFEngineW(pszInfFilename : Win32cr::Foundation::PWSTR, pszInstallSection : Win32cr::Foundation::PWSTR, dwFlags : UInt32, phInf : Void**, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.OpenINFEngineW(pszInfFilename, pszInstallSection, dwFlags, phInf, pvReserved)
  end

  def translateInfStringExA(hInf : Void*, pszInfFilename : Win32cr::Foundation::PSTR, pszTranslateSection : Win32cr::Foundation::PSTR, pszTranslateKey : Win32cr::Foundation::PSTR, pszBuffer : UInt8*, dwBufferSize : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.TranslateInfStringExA(hInf, pszInfFilename, pszTranslateSection, pszTranslateKey, pszBuffer, dwBufferSize, pdwRequiredSize, pvReserved)
  end

  def translateInfStringExW(hInf : Void*, pszInfFilename : Win32cr::Foundation::PWSTR, pszTranslateSection : Win32cr::Foundation::PWSTR, pszTranslateKey : Win32cr::Foundation::PWSTR, pszBuffer : UInt16*, dwBufferSize : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    C.TranslateInfStringExW(hInf, pszInfFilename, pszTranslateSection, pszTranslateKey, pszBuffer, dwBufferSize, pdwRequiredSize, pvReserved)
  end

  def closeINFEngine(hInf : Void*) : Win32cr::Foundation::HRESULT
    C.CloseINFEngine(hInf)
  end

  def extractFilesA(pszCabName : Win32cr::Foundation::PSTR, pszExpandDir : Win32cr::Foundation::PSTR, dwFlags : UInt32, pszFileList : Win32cr::Foundation::PSTR, lpReserved : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
    C.ExtractFilesA(pszCabName, pszExpandDir, dwFlags, pszFileList, lpReserved, dwReserved)
  end

  def extractFilesW(pszCabName : Win32cr::Foundation::PWSTR, pszExpandDir : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pszFileList : Win32cr::Foundation::PWSTR, lpReserved : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
    C.ExtractFilesW(pszCabName, pszExpandDir, dwFlags, pszFileList, lpReserved, dwReserved)
  end

  def launchINFSectionW(hwndOwner : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParams : Win32cr::Foundation::PWSTR, nShow : Int32) : Int32
    C.LaunchINFSectionW(hwndOwner, hInstance, pszParams, nShow)
  end

  def userInstStubWrapperA(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    C.UserInstStubWrapperA(hwnd, hInstance, pszParms, nShow)
  end

  def userInstStubWrapperW(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    C.UserInstStubWrapperW(hwnd, hInstance, pszParms, nShow)
  end

  def userUnInstStubWrapperA(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    C.UserUnInstStubWrapperA(hwnd, hInstance, pszParms, nShow)
  end

  def userUnInstStubWrapperW(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    C.UserUnInstStubWrapperW(hwnd, hInstance, pszParms, nShow)
  end

  def setPerUserSecValuesA(pPerUser : Win32cr::System::WindowsProgramming::PERUSERSECTIONA*) : Win32cr::Foundation::HRESULT
    C.SetPerUserSecValuesA(pPerUser)
  end

  def setPerUserSecValuesW(pPerUser : Win32cr::System::WindowsProgramming::PERUSERSECTIONW*) : Win32cr::Foundation::HRESULT
    C.SetPerUserSecValuesW(pPerUser)
  end

  def sendIMEMessageExA(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::LRESULT
    C.SendIMEMessageExA(param0, param1)
  end

  def sendIMEMessageExW(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::LRESULT
    C.SendIMEMessageExW(param0, param1)
  end

  def iMPGetIMEA(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROA*) : Win32cr::Foundation::BOOL
    C.IMPGetIMEA(param0, param1)
  end

  def iMPGetIMEW(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROW*) : Win32cr::Foundation::BOOL
    C.IMPGetIMEW(param0, param1)
  end

  def iMPQueryIMEA(param0 : Win32cr::System::WindowsProgramming::IMEPROA*) : Win32cr::Foundation::BOOL
    C.IMPQueryIMEA(param0)
  end

  def iMPQueryIMEW(param0 : Win32cr::System::WindowsProgramming::IMEPROW*) : Win32cr::Foundation::BOOL
    C.IMPQueryIMEW(param0)
  end

  def iMPSetIMEA(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROA*) : Win32cr::Foundation::BOOL
    C.IMPSetIMEA(param0, param1)
  end

  def iMPSetIMEW(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROW*) : Win32cr::Foundation::BOOL
    C.IMPSetIMEW(param0, param1)
  end

  def wINNLSGetIMEHotkey(param0 : Win32cr::Foundation::HWND) : UInt32
    C.WINNLSGetIMEHotkey(param0)
  end

  def wINNLSEnableIME(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.WINNLSEnableIME(param0, param1)
  end

  def wINNLSGetEnableStatus(param0 : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.WINNLSGetEnableStatus(param0)
  end

  def apphelpCheckShellObject(object_clsid : LibC::GUID*, bShimIfNecessary : Win32cr::Foundation::BOOL, pullFlags : UInt64*) : Win32cr::Foundation::BOOL
    C.ApphelpCheckShellObject(object_clsid, bShimIfNecessary, pullFlags)
  end

  def wldpGetLockdownPolicy(hostInformation : Win32cr::System::WindowsProgramming::WLDP_HOST_INFORMATION*, lockdownState : UInt32*, lockdownFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.WldpGetLockdownPolicy(hostInformation, lockdownState, lockdownFlags)
  end

  def wldpIsClassInApprovedList(classID : LibC::GUID*, hostInformation : Win32cr::System::WindowsProgramming::WLDP_HOST_INFORMATION*, isApproved : Win32cr::Foundation::BOOL*, optionalFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.WldpIsClassInApprovedList(classID, hostInformation, isApproved, optionalFlags)
  end

  def wldpSetDynamicCodeTrust(fileHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.WldpSetDynamicCodeTrust(fileHandle)
  end

  def wldpIsDynamicCodePolicyEnabled(isEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.WldpIsDynamicCodePolicyEnabled(isEnabled)
  end

  def wldpQueryDynamicCodeTrust(fileHandle : Win32cr::Foundation::HANDLE, baseImage : Void*, imageSize : UInt32) : Win32cr::Foundation::HRESULT
    C.WldpQueryDynamicCodeTrust(fileHandle, baseImage, imageSize)
  end

  def wldpQueryDeviceSecurityInformation(information : Win32cr::System::WindowsProgramming::WLDP_DEVICE_SECURITY_INFORMATION*, informationLength : UInt32, returnLength : UInt32*) : Win32cr::Foundation::HRESULT
    C.WldpQueryDeviceSecurityInformation(information, informationLength, returnLength)
  end

  @[Link("ntdll")]
  @[Link("kernel32")]
  @[Link("advapi32")]
  @[Link("dciman32")]
  @[Link("advpack")]
  @[Link("user32")]
  @[Link("apphelp")]
  @[Link("wldp")]
  lib C
    # :nodoc:
    fun RtlGetReturnAddressHijackTarget : LibC::UIntPtrT

    # :nodoc:
    fun RtlRaiseCustomSystemEventTrigger(trigger_config : Win32cr::System::WindowsProgramming::CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*) : UInt32

    # :nodoc:
    fun IsApiSetImplemented(contract : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryThreadCycleTime(thread_handle : Win32cr::Foundation::HANDLE, cycle_time : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryProcessCycleTime(process_handle : Win32cr::Foundation::HANDLE, cycle_time : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryIdleProcessorCycleTime(buffer_length : UInt32*, processor_idle_cycle_time : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryIdleProcessorCycleTimeEx(group : UInt16, buffer_length : UInt32*, processor_idle_cycle_time : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryInterruptTimePrecise(lpInterruptTimePrecise : UInt64*) : Void

    # :nodoc:
    fun QueryUnbiasedInterruptTimePrecise(lpUnbiasedInterruptTimePrecise : UInt64*) : Void

    # :nodoc:
    fun QueryInterruptTime(lpInterruptTime : UInt64*) : Void

    # :nodoc:
    fun QueryUnbiasedInterruptTime(unbiased_time : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryAuxiliaryCounterFrequency(lpAuxiliaryCounterFrequency : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ConvertAuxiliaryCounterToPerformanceCounter(ullAuxiliaryCounterValue : UInt64, lpPerformanceCounterValue : UInt64*, lpConversionError : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ConvertPerformanceCounterToAuxiliaryCounter(ullPerformanceCounterValue : UInt64, lpAuxiliaryCounterValue : UInt64*, lpConversionError : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GlobalCompact(dwMinFree : UInt32) : LibC::UIntPtrT

    # :nodoc:
    fun GlobalFix(hMem : LibC::IntPtrT) : Void

    # :nodoc:
    fun GlobalUnfix(hMem : LibC::IntPtrT) : Void

    # :nodoc:
    fun GlobalWire(hMem : LibC::IntPtrT) : Void*

    # :nodoc:
    fun GlobalUnWire(hMem : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LocalShrink(hMem : LibC::IntPtrT, cbNewSize : UInt32) : LibC::UIntPtrT

    # :nodoc:
    fun LocalCompact(uMinFree : UInt32) : LibC::UIntPtrT

    # :nodoc:
    fun SetEnvironmentStringsA(new_environment : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetHandleCount(uNumber : UInt32) : UInt32

    # :nodoc:
    fun RequestDeviceWakeup(hDevice : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CancelDeviceWakeupRequest(hDevice : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetMessageWaitingIndicator(hMsgIndicator : Win32cr::Foundation::HANDLE, ulMsgCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MulDiv(nNumber : Int32, nNumerator : Int32, nDenominator : Int32) : Int32

    # :nodoc:
    fun GetSystemRegistryQuota(pdwQuotaAllowed : UInt32*, pdwQuotaUsed : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FileTimeToDosDateTime(lpFileTime : Win32cr::Foundation::FILETIME*, lpFatDate : UInt16*, lpFatTime : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DosDateTimeToFileTime(wFatDate : UInt16, wFatTime : UInt16, lpFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun _lopen(lpPathName : Win32cr::Foundation::PSTR, iReadWrite : Int32) : Int32

    # :nodoc:
    fun _lcreat(lpPathName : Win32cr::Foundation::PSTR, iAttribute : Int32) : Int32

    # :nodoc:
    fun _lread(hFile : Int32, lpBuffer : Void*, uBytes : UInt32) : UInt32

    # :nodoc:
    fun _lwrite(hFile : Int32, lpBuffer : Win32cr::Foundation::PSTR, uBytes : UInt32) : UInt32

    # :nodoc:
    fun _hread(hFile : Int32, lpBuffer : Void*, lBytes : Int32) : Int32

    # :nodoc:
    fun _hwrite(hFile : Int32, lpBuffer : Win32cr::Foundation::PSTR, lBytes : Int32) : Int32

    # :nodoc:
    fun _lclose(hFile : Int32) : Int32

    # :nodoc:
    fun _llseek(hFile : Int32, lOffset : Int32, iOrigin : Int32) : Int32

    # :nodoc:
    fun SignalObjectAndWait(hObjectToSignal : Win32cr::Foundation::HANDLE, hObjectToWaitOn : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun OpenMutexA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenSemaphoreA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateWaitableTimerA(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenWaitableTimerA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateWaitableTimerExA(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpTimerName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun GetFirmwareEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pBuffer : Void*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetFirmwareEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pBuffer : Void*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetFirmwareEnvironmentVariableExA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pBuffer : Void*, nSize : UInt32, pdwAttribubutes : UInt32*) : UInt32

    # :nodoc:
    fun GetFirmwareEnvironmentVariableExW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pBuffer : Void*, nSize : UInt32, pdwAttribubutes : UInt32*) : UInt32

    # :nodoc:
    fun SetFirmwareEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pValue : Void*, nSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetFirmwareEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pValue : Void*, nSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetFirmwareEnvironmentVariableExA(lpName : Win32cr::Foundation::PSTR, lpGuid : Win32cr::Foundation::PSTR, pValue : Void*, nSize : UInt32, dwAttributes : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetFirmwareEnvironmentVariableExW(lpName : Win32cr::Foundation::PWSTR, lpGuid : Win32cr::Foundation::PWSTR, pValue : Void*, nSize : UInt32, dwAttributes : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsNativeVhdBoot(native_vhd_boot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProfileIntA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, nDefault : Int32) : UInt32

    # :nodoc:
    fun GetProfileIntW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, nDefault : Int32) : UInt32

    # :nodoc:
    fun GetProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpDefault : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpDefault : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32) : UInt32

    # :nodoc:
    fun WriteProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32) : UInt32

    # :nodoc:
    fun WriteProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WriteProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPrivateProfileIntA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, nDefault : Int32, lpFileName : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetPrivateProfileIntW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, nDefault : Int32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetPrivateProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpDefault : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32, lpFileName : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetPrivateProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpDefault : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun WritePrivateProfileStringA(lpAppName : Win32cr::Foundation::PSTR, lpKeyName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WritePrivateProfileStringW(lpAppName : Win32cr::Foundation::PWSTR, lpKeyName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPrivateProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpReturnedString : UInt8*, nSize : UInt32, lpFileName : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetPrivateProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpReturnedString : UInt16*, nSize : UInt32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun WritePrivateProfileSectionA(lpAppName : Win32cr::Foundation::PSTR, lpString : Win32cr::Foundation::PSTR, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WritePrivateProfileSectionW(lpAppName : Win32cr::Foundation::PWSTR, lpString : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPrivateProfileSectionNamesA(lpszReturnBuffer : UInt8*, nSize : UInt32, lpFileName : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun GetPrivateProfileSectionNamesW(lpszReturnBuffer : UInt16*, nSize : UInt32, lpFileName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun GetPrivateProfileStructA(lpszSection : Win32cr::Foundation::PSTR, lpszKey : Win32cr::Foundation::PSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPrivateProfileStructW(lpszSection : Win32cr::Foundation::PWSTR, lpszKey : Win32cr::Foundation::PWSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WritePrivateProfileStructA(lpszSection : Win32cr::Foundation::PSTR, lpszKey : Win32cr::Foundation::PSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WritePrivateProfileStructW(lpszSection : Win32cr::Foundation::PWSTR, lpszKey : Win32cr::Foundation::PWSTR, lpStruct : Void*, uSizeStruct : UInt32, szFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsBadHugeReadPtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsBadHugeWritePtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetComputerNameA(lpBuffer : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetComputerNameW(lpBuffer : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsHostnameToComputerNameA(hostname : Win32cr::Foundation::PSTR, computer_name : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsHostnameToComputerNameW(hostname : Win32cr::Foundation::PWSTR, computer_name : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetUserNameA(lpBuffer : UInt8*, pcbBuffer : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetUserNameW(lpBuffer : UInt16*, pcbBuffer : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsTokenUntrusted(token_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CancelTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCurrentHwProfileA(lpHwProfileInfo : Win32cr::System::WindowsProgramming::HW_PROFILE_INFOA*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCurrentHwProfileW(lpHwProfileInfo : Win32cr::System::WindowsProgramming::HW_PROFILE_INFOW*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReplacePartitionUnit(target_partition : Win32cr::Foundation::PWSTR, spare_partition : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::Foundation::BOOL

    {% if flag?(:i386) || flag?(:x86_64) %}
    # :nodoc:
    fun GetThreadEnabledXStateFeatures : UInt64
    {% end %}

    {% if flag?(:i386) || flag?(:x86_64) %}
    # :nodoc:
    fun EnableProcessOptionalXStateFeatures(features : UInt64) : Win32cr::Foundation::BOOL
    {% end %}

    # :nodoc:
    fun RaiseCustomSystemEventTrigger(custom_system_event_trigger_config : Win32cr::System::WindowsProgramming::CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*) : UInt32

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_lstrcmpW(string1 : UInt16*, string2 : UInt16*) : Int32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_lstrcmpiW(string1 : UInt16*, string2 : UInt16*) : Int32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_lstrlenW(string : UInt16*) : Int32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_wcschr(string : UInt16*, character : UInt16) : UInt16*
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_wcscpy(destination : UInt16*, source : UInt16*) : UInt16*
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_wcsicmp(string1 : UInt16*, string2 : UInt16*) : Int32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_wcslen(string : UInt16*) : LibC::UIntPtrT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun uaw_wcsrchr(string : UInt16*, character : UInt16) : UInt16*
    {% end %}

    # :nodoc:
    fun NtClose(handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtOpenFile(file_handle : Win32cr::Foundation::HANDLE*, desired_access : UInt32, object_attributes : Win32cr::System::WindowsProgramming::OBJECT_ATTRIBUTES*, io_status_block : Win32cr::System::WindowsProgramming::IO_STATUS_BLOCK*, share_access : UInt32, open_options : UInt32) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtRenameKey(key_handle : Win32cr::Foundation::HANDLE, new_name : Win32cr::Foundation::UNICODE_STRING*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtNotifyChangeMultipleKeys(master_key_handle : Win32cr::Foundation::HANDLE, count : UInt32, subordinate_objects : Win32cr::System::WindowsProgramming::OBJECT_ATTRIBUTES*, event : Win32cr::Foundation::HANDLE, apc_routine : Win32cr::System::WindowsProgramming::PIO_APC_ROUTINE, apc_context : Void*, io_status_block : Win32cr::System::WindowsProgramming::IO_STATUS_BLOCK*, completion_filter : UInt32, watch_tree : Win32cr::Foundation::BOOLEAN, buffer : Void*, buffer_size : UInt32, asynchronous : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtQueryMultipleValueKey(key_handle : Win32cr::Foundation::HANDLE, value_entries : Win32cr::System::WindowsProgramming::KEY_VALUE_ENTRY*, entry_count : UInt32, value_buffer : Void*, buffer_length : UInt32*, required_buffer_length : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtSetInformationKey(key_handle : Win32cr::Foundation::HANDLE, key_set_information_class : Win32cr::System::WindowsProgramming::KEY_SET_INFORMATION_CLASS, key_set_information : Void*, key_set_information_length : UInt32) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtDeviceIoControlFile(file_handle : Win32cr::Foundation::HANDLE, event : Win32cr::Foundation::HANDLE, apc_routine : Win32cr::System::WindowsProgramming::PIO_APC_ROUTINE, apc_context : Void*, io_status_block : Win32cr::System::WindowsProgramming::IO_STATUS_BLOCK*, io_control_code : UInt32, input_buffer : Void*, input_buffer_length : UInt32, output_buffer : Void*, output_buffer_length : UInt32) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtWaitForSingleObject(handle : Win32cr::Foundation::HANDLE, alertable : Win32cr::Foundation::BOOLEAN, timeout : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlIsNameLegalDOS8Dot3(name : Win32cr::Foundation::UNICODE_STRING*, oem_name : Win32cr::System::Kernel::STRING*, name_contains_spaces : Win32cr::Foundation::BOOLEAN*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun NtQueryObject(handle : Win32cr::Foundation::HANDLE, object_information_class : Win32cr::System::WindowsProgramming::OBJECT_INFORMATION_CLASS, object_information : Void*, object_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtQuerySystemInformation(system_information_class : Win32cr::System::WindowsProgramming::SYSTEM_INFORMATION_CLASS, system_information : Void*, system_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtQuerySystemTime(system_time : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtQueryTimerResolution(maximum_time : UInt32*, minimum_time : UInt32*, current_time : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlLocalTimeToSystemTime(local_time : Win32cr::Foundation::LARGE_INTEGER*, system_time : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlTimeToSecondsSince1970(time : Win32cr::Foundation::LARGE_INTEGER*, elapsed_seconds : UInt32*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun RtlFreeAnsiString(ansi_string : Win32cr::System::Kernel::STRING*) : Void

    # :nodoc:
    fun RtlFreeUnicodeString(unicode_string : Win32cr::Foundation::UNICODE_STRING*) : Void

    # :nodoc:
    fun RtlFreeOemString(oem_string : Win32cr::System::Kernel::STRING*) : Void

    # :nodoc:
    fun RtlInitString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Void

    # :nodoc:
    fun RtlInitStringEx(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlInitAnsiString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Void

    # :nodoc:
    fun RtlInitAnsiStringEx(destination_string : Win32cr::System::Kernel::STRING*, source_string : Int8*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlInitUnicodeString(destination_string : Win32cr::Foundation::UNICODE_STRING*, source_string : Win32cr::Foundation::PWSTR) : Void

    # :nodoc:
    fun RtlAnsiStringToUnicodeString(destination_string : Win32cr::Foundation::UNICODE_STRING*, source_string : Win32cr::System::Kernel::STRING*, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlUnicodeStringToAnsiString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Win32cr::Foundation::UNICODE_STRING*, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlUnicodeStringToOemString(destination_string : Win32cr::System::Kernel::STRING*, source_string : Win32cr::Foundation::UNICODE_STRING*, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlUnicodeToMultiByteSize(bytes_in_multi_byte_string : UInt32*, unicode_string : Win32cr::Foundation::PWSTR, bytes_in_unicode_string : UInt32) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlCharToInteger(string : Int8*, base : UInt32, value : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun RtlUniform(seed : UInt32*) : UInt32

    # :nodoc:
    fun GetFeatureEnabledState(featureId : UInt32, changeTime : Win32cr::System::WindowsProgramming::FEATURE_CHANGE_TIME) : Win32cr::System::WindowsProgramming::FEATURE_ENABLED_STATE

    # :nodoc:
    fun RecordFeatureUsage(featureId : UInt32, kind : UInt32, addend : UInt32, originName : Win32cr::Foundation::PSTR) : Void

    # :nodoc:
    fun RecordFeatureError(featureId : UInt32, error : Win32cr::System::WindowsProgramming::FEATURE_ERROR*) : Void

    # :nodoc:
    fun SubscribeFeatureStateChangeNotification(subscription : Win32cr::System::WindowsProgramming::FEATURE_STATE_CHANGE_SUBSCRIPTION*, callback : Win32cr::System::WindowsProgramming::PFEATURE_STATE_CHANGE_CALLBACK, context : Void*) : Void

    # :nodoc:
    fun UnsubscribeFeatureStateChangeNotification(subscription : Win32cr::System::WindowsProgramming::FEATURE_STATE_CHANGE_SUBSCRIPTION) : Void

    # :nodoc:
    fun GetFeatureVariant(featureId : UInt32, changeTime : Win32cr::System::WindowsProgramming::FEATURE_CHANGE_TIME, payloadId : UInt32*, hasNotification : Win32cr::Foundation::BOOL*) : UInt32

    # :nodoc:
    fun DCIOpenProvider : Win32cr::Graphics::Gdi::HDC

    # :nodoc:
    fun DCICloseProvider(hdc : Win32cr::Graphics::Gdi::HDC) : Void

    # :nodoc:
    fun DCICreatePrimary(hdc : Win32cr::Graphics::Gdi::HDC, lplpSurface : Win32cr::System::WindowsProgramming::DCISURFACEINFO**) : Int32

    # :nodoc:
    fun DCICreateOffscreen(hdc : Win32cr::Graphics::Gdi::HDC, dwCompression : UInt32, dwRedMask : UInt32, dwGreenMask : UInt32, dwBlueMask : UInt32, dwWidth : UInt32, dwHeight : UInt32, dwDCICaps : UInt32, dwBitCount : UInt32, lplpSurface : Win32cr::System::WindowsProgramming::DCIOFFSCREEN**) : Int32

    # :nodoc:
    fun DCICreateOverlay(hdc : Win32cr::Graphics::Gdi::HDC, lpOffscreenSurf : Void*, lplpSurface : Win32cr::System::WindowsProgramming::DCIOVERLAY**) : Int32

    # :nodoc:
    fun DCIEnum(hdc : Win32cr::Graphics::Gdi::HDC, lprDst : Win32cr::Foundation::RECT*, lprSrc : Win32cr::Foundation::RECT*, lpFnCallback : Void*, lpContext : Void*) : Int32

    # :nodoc:
    fun DCISetSrcDestClip(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*, srcrc : Win32cr::Foundation::RECT*, destrc : Win32cr::Foundation::RECT*, prd : Win32cr::Graphics::Gdi::RGNDATA*) : Int32

    # :nodoc:
    fun WinWatchOpen(hwnd : Win32cr::Foundation::HWND) : Win32cr::System::WindowsProgramming::HWINWATCH

    # :nodoc:
    fun WinWatchClose(hWW : Win32cr::System::WindowsProgramming::HWINWATCH) : Void

    # :nodoc:
    fun WinWatchGetClipList(hWW : Win32cr::System::WindowsProgramming::HWINWATCH, prc : Win32cr::Foundation::RECT*, size : UInt32, prd : Win32cr::Graphics::Gdi::RGNDATA*) : UInt32

    # :nodoc:
    fun WinWatchDidStatusChange(hWW : Win32cr::System::WindowsProgramming::HWINWATCH) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetWindowRegionData(hwnd : Win32cr::Foundation::HWND, size : UInt32, prd : Win32cr::Graphics::Gdi::RGNDATA*) : UInt32

    # :nodoc:
    fun GetDCRegionData(hdc : Win32cr::Graphics::Gdi::HDC, size : UInt32, prd : Win32cr::Graphics::Gdi::RGNDATA*) : UInt32

    # :nodoc:
    fun WinWatchNotify(hWW : Win32cr::System::WindowsProgramming::HWINWATCH, notify_callback : Win32cr::System::WindowsProgramming::WINWATCHNOTIFYPROC, notify_param : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DCIEndAccess(pdci : Win32cr::System::WindowsProgramming::DCISURFACEINFO*) : Void

    # :nodoc:
    fun DCIBeginAccess(pdci : Win32cr::System::WindowsProgramming::DCISURFACEINFO*, x : Int32, y : Int32, dx : Int32, dy : Int32) : Int32

    # :nodoc:
    fun DCIDestroy(pdci : Win32cr::System::WindowsProgramming::DCISURFACEINFO*) : Void

    # :nodoc:
    fun DCIDraw(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*) : Int32

    # :nodoc:
    fun DCISetClipList(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*, prd : Win32cr::Graphics::Gdi::RGNDATA*) : Int32

    # :nodoc:
    fun DCISetDestination(pdci : Win32cr::System::WindowsProgramming::DCIOFFSCREEN*, dst : Win32cr::Foundation::RECT*, src : Win32cr::Foundation::RECT*) : Int32

    # :nodoc:
    fun GdiEntry13 : UInt32

    # :nodoc:
    fun RunSetupCommandA(hWnd : Win32cr::Foundation::HWND, szCmdName : Win32cr::Foundation::PSTR, szInfSection : Win32cr::Foundation::PSTR, szDir : Win32cr::Foundation::PSTR, lpszTitle : Win32cr::Foundation::PSTR, phEXE : Win32cr::Foundation::HANDLE*, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RunSetupCommandW(hWnd : Win32cr::Foundation::HWND, szCmdName : Win32cr::Foundation::PWSTR, szInfSection : Win32cr::Foundation::PWSTR, szDir : Win32cr::Foundation::PWSTR, lpszTitle : Win32cr::Foundation::PWSTR, phEXE : Win32cr::Foundation::HANDLE*, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NeedRebootInit : UInt32

    # :nodoc:
    fun NeedReboot(dwRebootCheck : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RebootCheckOnInstallA(hwnd : Win32cr::Foundation::HWND, pszINF : Win32cr::Foundation::PSTR, pszSec : Win32cr::Foundation::PSTR, dwReserved : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RebootCheckOnInstallW(hwnd : Win32cr::Foundation::HWND, pszINF : Win32cr::Foundation::PWSTR, pszSec : Win32cr::Foundation::PWSTR, dwReserved : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun TranslateInfStringA(pszInfFilename : Win32cr::Foundation::PSTR, pszInstallSection : Win32cr::Foundation::PSTR, pszTranslateSection : Win32cr::Foundation::PSTR, pszTranslateKey : Win32cr::Foundation::PSTR, pszBuffer : UInt8*, cchBuffer : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun TranslateInfStringW(pszInfFilename : Win32cr::Foundation::PWSTR, pszInstallSection : Win32cr::Foundation::PWSTR, pszTranslateSection : Win32cr::Foundation::PWSTR, pszTranslateKey : Win32cr::Foundation::PWSTR, pszBuffer : UInt16*, cchBuffer : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegInstallA(hmod : Win32cr::Foundation::HINSTANCE, pszSection : Win32cr::Foundation::PSTR, pstTable : Win32cr::System::WindowsProgramming::STRTABLEA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegInstallW(hmod : Win32cr::Foundation::HINSTANCE, pszSection : Win32cr::Foundation::PWSTR, pstTable : Win32cr::System::WindowsProgramming::STRTABLEW*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LaunchINFSectionExW(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ExecuteCabA(hwnd : Win32cr::Foundation::HWND, pCab : Win32cr::System::WindowsProgramming::CABINFOA*, pReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ExecuteCabW(hwnd : Win32cr::Foundation::HWND, pCab : Win32cr::System::WindowsProgramming::CABINFOW*, pReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun AdvInstallFileA(hwnd : Win32cr::Foundation::HWND, lpszSourceDir : Win32cr::Foundation::PSTR, lpszSourceFile : Win32cr::Foundation::PSTR, lpszDestDir : Win32cr::Foundation::PSTR, lpszDestFile : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwReserved : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun AdvInstallFileW(hwnd : Win32cr::Foundation::HWND, lpszSourceDir : Win32cr::Foundation::PWSTR, lpszSourceFile : Win32cr::Foundation::PWSTR, lpszDestDir : Win32cr::Foundation::PWSTR, lpszDestFile : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwReserved : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegSaveRestoreA(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PSTR, hkBckupKey : Win32cr::System::Registry::HKEY, pcszRootKey : Win32cr::Foundation::PSTR, pcszSubKey : Win32cr::Foundation::PSTR, pcszValueName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegSaveRestoreW(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PWSTR, hkBckupKey : Win32cr::System::Registry::HKEY, pcszRootKey : Win32cr::Foundation::PWSTR, pcszSubKey : Win32cr::Foundation::PWSTR, pcszValueName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegSaveRestoreOnINFA(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PSTR, pszINF : Win32cr::Foundation::PSTR, pszSection : Win32cr::Foundation::PSTR, hHKLMBackKey : Win32cr::System::Registry::HKEY, hHKCUBackKey : Win32cr::System::Registry::HKEY, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegSaveRestoreOnINFW(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszINF : Win32cr::Foundation::PWSTR, pszSection : Win32cr::Foundation::PWSTR, hHKLMBackKey : Win32cr::System::Registry::HKEY, hHKCUBackKey : Win32cr::System::Registry::HKEY, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegRestoreAllA(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PSTR, hkBckupKey : Win32cr::System::Registry::HKEY) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegRestoreAllW(hWnd : Win32cr::Foundation::HWND, pszTitleString : Win32cr::Foundation::PWSTR, hkBckupKey : Win32cr::System::Registry::HKEY) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FileSaveRestoreW(hDlg : Win32cr::Foundation::HWND, lpFileList : Win32cr::Foundation::PWSTR, lpDir : Win32cr::Foundation::PWSTR, lpBaseName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FileSaveRestoreOnINFA(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PSTR, pszINF : Win32cr::Foundation::PSTR, pszSection : Win32cr::Foundation::PSTR, pszBackupDir : Win32cr::Foundation::PSTR, pszBaseBackupFile : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FileSaveRestoreOnINFW(hWnd : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszINF : Win32cr::Foundation::PWSTR, pszSection : Win32cr::Foundation::PWSTR, pszBackupDir : Win32cr::Foundation::PWSTR, pszBaseBackupFile : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun AddDelBackupEntryA(lpcszFileList : Win32cr::Foundation::PSTR, lpcszBackupDir : Win32cr::Foundation::PSTR, lpcszBaseName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun AddDelBackupEntryW(lpcszFileList : Win32cr::Foundation::PWSTR, lpcszBackupDir : Win32cr::Foundation::PWSTR, lpcszBaseName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FileSaveMarkNotExistA(lpFileList : Win32cr::Foundation::PSTR, lpDir : Win32cr::Foundation::PSTR, lpBaseName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FileSaveMarkNotExistW(lpFileList : Win32cr::Foundation::PWSTR, lpDir : Win32cr::Foundation::PWSTR, lpBaseName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetVersionFromFileA(lpszFilename : Win32cr::Foundation::PSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetVersionFromFileW(lpszFilename : Win32cr::Foundation::PWSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetVersionFromFileExA(lpszFilename : Win32cr::Foundation::PSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetVersionFromFileExW(lpszFilename : Win32cr::Foundation::PWSTR, pdwMSVer : UInt32*, pdwLSVer : UInt32*, bVersion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsNTAdmin(dwReserved : UInt32, lpdwReserved : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DelNodeA(pszFileOrDirName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DelNodeW(pszFileOrDirName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DelNodeRunDLL32W(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OpenINFEngineA(pszInfFilename : Win32cr::Foundation::PSTR, pszInstallSection : Win32cr::Foundation::PSTR, dwFlags : UInt32, phInf : Void**, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OpenINFEngineW(pszInfFilename : Win32cr::Foundation::PWSTR, pszInstallSection : Win32cr::Foundation::PWSTR, dwFlags : UInt32, phInf : Void**, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun TranslateInfStringExA(hInf : Void*, pszInfFilename : Win32cr::Foundation::PSTR, pszTranslateSection : Win32cr::Foundation::PSTR, pszTranslateKey : Win32cr::Foundation::PSTR, pszBuffer : UInt8*, dwBufferSize : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun TranslateInfStringExW(hInf : Void*, pszInfFilename : Win32cr::Foundation::PWSTR, pszTranslateSection : Win32cr::Foundation::PWSTR, pszTranslateKey : Win32cr::Foundation::PWSTR, pszBuffer : UInt16*, dwBufferSize : UInt32, pdwRequiredSize : UInt32*, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CloseINFEngine(hInf : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ExtractFilesA(pszCabName : Win32cr::Foundation::PSTR, pszExpandDir : Win32cr::Foundation::PSTR, dwFlags : UInt32, pszFileList : Win32cr::Foundation::PSTR, lpReserved : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ExtractFilesW(pszCabName : Win32cr::Foundation::PWSTR, pszExpandDir : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pszFileList : Win32cr::Foundation::PWSTR, lpReserved : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LaunchINFSectionW(hwndOwner : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParams : Win32cr::Foundation::PWSTR, nShow : Int32) : Int32

    # :nodoc:
    fun UserInstStubWrapperA(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UserInstStubWrapperW(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UserUnInstStubWrapperA(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UserUnInstStubWrapperW(hwnd : Win32cr::Foundation::HWND, hInstance : Win32cr::Foundation::HINSTANCE, pszParms : Win32cr::Foundation::PWSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SetPerUserSecValuesA(pPerUser : Win32cr::System::WindowsProgramming::PERUSERSECTIONA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SetPerUserSecValuesW(pPerUser : Win32cr::System::WindowsProgramming::PERUSERSECTIONW*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SendIMEMessageExA(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::LRESULT

    # :nodoc:
    fun SendIMEMessageExW(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::LRESULT

    # :nodoc:
    fun IMPGetIMEA(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROA*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IMPGetIMEW(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROW*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IMPQueryIMEA(param0 : Win32cr::System::WindowsProgramming::IMEPROA*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IMPQueryIMEW(param0 : Win32cr::System::WindowsProgramming::IMEPROW*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IMPSetIMEA(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROA*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IMPSetIMEW(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::System::WindowsProgramming::IMEPROW*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WINNLSGetIMEHotkey(param0 : Win32cr::Foundation::HWND) : UInt32

    # :nodoc:
    fun WINNLSEnableIME(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WINNLSGetEnableStatus(param0 : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ApphelpCheckShellObject(object_clsid : LibC::GUID*, bShimIfNecessary : Win32cr::Foundation::BOOL, pullFlags : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WldpGetLockdownPolicy(hostInformation : Win32cr::System::WindowsProgramming::WLDP_HOST_INFORMATION*, lockdownState : UInt32*, lockdownFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WldpIsClassInApprovedList(classID : LibC::GUID*, hostInformation : Win32cr::System::WindowsProgramming::WLDP_HOST_INFORMATION*, isApproved : Win32cr::Foundation::BOOL*, optionalFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WldpSetDynamicCodeTrust(fileHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WldpIsDynamicCodePolicyEnabled(isEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WldpQueryDynamicCodeTrust(fileHandle : Win32cr::Foundation::HANDLE, baseImage : Void*, imageSize : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WldpQueryDeviceSecurityInformation(information : Win32cr::System::WindowsProgramming::WLDP_DEVICE_SECURITY_INFORMATION*, informationLength : UInt32, returnLength : UInt32*) : Win32cr::Foundation::HRESULT

  end
end