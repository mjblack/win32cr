require "../foundation.cr"
require "../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-core-state-helpers-l1-1-0.dll")]
lib LibWin32
  alias HKEY = LibC::IntPtrT

  HKEY_CLASSES_ROOT = -2147483648_i32
  HKEY_CURRENT_USER = -2147483647_i32
  HKEY_LOCAL_MACHINE = -2147483646_i32
  HKEY_USERS = -2147483645_i32
  HKEY_PERFORMANCE_DATA = -2147483644_i32
  HKEY_PERFORMANCE_TEXT = -2147483568_i32
  HKEY_PERFORMANCE_NLSTEXT = -2147483552_i32
  HKEY_CURRENT_CONFIG = -2147483643_i32
  HKEY_DYN_DATA = -2147483642_i32
  HKEY_CURRENT_USER_LOCAL_SETTINGS = -2147483641_i32
  RRF_SUBKEY_WOW6464KEY = 65536_u32
  RRF_SUBKEY_WOW6432KEY = 131072_u32
  RRF_WOW64_MASK = 196608_u32
  RRF_NOEXPAND = 268435456_u32
  RRF_ZEROONFAILURE = 536870912_u32
  REG_PROCESS_APPKEY = 1_u32
  REG_USE_CURRENT_SECURITY_CONTEXT = 2_u32
  PROVIDER_KEEPS_VALUE_LENGTH = 1_u32
  REG_MUI_STRING_TRUNCATE = 1_u32
  REG_SECURE_CONNECTION = 1_u32
  REGSTR_MAX_VALUE_LENGTH = 256_u32
  IT_COMPACT = 0_u32
  IT_TYPICAL = 1_u32
  IT_PORTABLE = 2_u32
  IT_CUSTOM = 3_u32
  DRIVERSIGN_NONE = 0_u32
  DRIVERSIGN_WARNING = 1_u32
  DRIVERSIGN_BLOCKING = 2_u32
  DOSOPTGF_DEFCLEAN = 1_i32
  DOSOPTF_DEFAULT = 1_i32
  DOSOPTF_SUPPORTED = 2_i32
  DOSOPTF_ALWAYSUSE = 4_i32
  DOSOPTF_USESPMODE = 8_i32
  DOSOPTF_PROVIDESUMB = 16_i32
  DOSOPTF_NEEDSETUP = 32_i32
  DOSOPTF_INDOSSTART = 64_i32
  DOSOPTF_MULTIPLE = 128_i32
  SUF_FIRSTTIME = 1_i32
  SUF_EXPRESS = 2_i32
  SUF_BATCHINF = 4_i32
  SUF_CLEAN = 8_i32
  SUF_INSETUP = 16_i32
  SUF_NETSETUP = 32_i32
  SUF_NETHDBOOT = 64_i32
  SUF_NETRPLBOOT = 128_i32
  SUF_SBSCOPYOK = 256_i32
  VPDF_DISABLEPWRMGMT = 1_u32
  VPDF_FORCEAPM10MODE = 2_u32
  VPDF_SKIPINTELSLCHECK = 4_u32
  VPDF_DISABLEPWRSTATUSPOLL = 8_u32
  VPDF_DISABLERINGRESUME = 16_u32
  VPDF_SHOWMULTIBATT = 32_u32
  BIF_SHOWSIMILARDRIVERS = 1_u32
  BIF_RAWDEVICENEEDSDRIVER = 2_u32
  PCMCIA_OPT_HAVE_SOCKET = 1_i32
  PCMCIA_OPT_AUTOMEM = 4_i32
  PCMCIA_OPT_NO_SOUND = 8_i32
  PCMCIA_OPT_NO_AUDIO = 16_i32
  PCMCIA_OPT_NO_APMREMOVE = 32_i32
  PCMCIA_DEF_MEMBEGIN = 786432_u32
  PCMCIA_DEF_MEMEND = 16777215_u32
  PCMCIA_DEF_MEMLEN = 4096_u32
  PCMCIA_DEF_MIN_REGION = 65536_u32
  PCI_OPTIONS_USE_BIOS = 1_i32
  PCI_OPTIONS_USE_IRQ_STEERING = 2_i32
  AGP_FLAG_NO_1X_RATE = 1_i32
  AGP_FLAG_NO_2X_RATE = 2_i32
  AGP_FLAG_NO_4X_RATE = 4_i32
  AGP_FLAG_NO_8X_RATE = 8_i32
  AGP_FLAG_REVERSE_INITIALIZATION = 128_i32
  AGP_FLAG_NO_SBA_ENABLE = 256_i32
  AGP_FLAG_NO_FW_ENABLE = 512_i32
  AGP_FLAG_SPECIAL_TARGET = 1048575_i32
  AGP_FLAG_SPECIAL_RESERVE = 1015808_i32
  REGSTR_VAL_MAX_HCID_LEN = 1024_u32
  REGDF_NOTDETIO = 1_u32
  REGDF_NOTDETMEM = 2_u32
  REGDF_NOTDETIRQ = 4_u32
  REGDF_NOTDETDMA = 8_u32
  REGDF_NEEDFULLCONFIG = 16_u32
  REGDF_GENFORCEDCONFIG = 32_u32
  REGDF_NODETCONFIG = 32768_u32
  REGDF_CONFLICTIO = 65536_u32
  REGDF_CONFLICTMEM = 131072_u32
  REGDF_CONFLICTIRQ = 262144_u32
  REGDF_CONFLICTDMA = 524288_u32
  REGDF_MAPIRQ2TO9 = 1048576_u32
  REGDF_NOTVERIFIED = 2147483648_u32
  APMMENUSUSPEND_DISABLED = 0_u32
  APMMENUSUSPEND_ENABLED = 1_u32
  APMMENUSUSPEND_UNDOCKED = 2_u32
  APMMENUSUSPEND_NOCHANGE = 128_u32
  APMTIMEOUT_DISABLED = 0_u32
  CONFIGFLAG_DISABLED = 1_u32
  CONFIGFLAG_REMOVED = 2_u32
  CONFIGFLAG_MANUAL_INSTALL = 4_u32
  CONFIGFLAG_IGNORE_BOOT_LC = 8_u32
  CONFIGFLAG_NET_BOOT = 16_u32
  CONFIGFLAG_REINSTALL = 32_u32
  CONFIGFLAG_FAILEDINSTALL = 64_u32
  CONFIGFLAG_CANTSTOPACHILD = 128_u32
  CONFIGFLAG_OKREMOVEROM = 256_u32
  CONFIGFLAG_NOREMOVEEXIT = 512_u32
  CONFIGFLAG_FINISH_INSTALL = 1024_u32
  CONFIGFLAG_NEEDS_FORCED_CONFIG = 2048_u32
  CONFIGFLAG_NETBOOT_CARD = 4096_u32
  CONFIGFLAG_PARTIAL_LOG_CONF = 8192_u32
  CONFIGFLAG_SUPPRESS_SURPRISE = 16384_u32
  CONFIGFLAG_VERIFY_HARDWARE = 32768_u32
  CONFIGFLAG_FINISHINSTALL_UI = 65536_u32
  CONFIGFLAG_FINISHINSTALL_ACTION = 131072_u32
  CONFIGFLAG_BOOT_DEVICE = 262144_u32
  CONFIGFLAG_NEEDS_CLASS_CONFIG = 524288_u32
  CSCONFIGFLAG_BITS = 7_u32
  CSCONFIGFLAG_DISABLED = 1_u32
  CSCONFIGFLAG_DO_NOT_CREATE = 2_u32
  CSCONFIGFLAG_DO_NOT_START = 4_u32
  DMSTATEFLAG_APPLYTOALL = 1_u32
  NUM_RESOURCE_MAP = 256_u32
  MF_FLAGS_EVEN_IF_NO_RESOURCE = 1_u32
  MF_FLAGS_NO_CREATE_IF_NO_RESOURCE = 2_u32
  MF_FLAGS_FILL_IN_UNKNOWN_RESOURCE = 4_u32
  MF_FLAGS_CREATE_BUT_NO_SHOW_DISABLED = 8_u32
  EISAFLAG_NO_IO_MERGE = 1_u32
  EISAFLAG_SLOT_IO_FIRST = 2_u32
  EISA_NO_MAX_FUNCTION = 255_u32
  NUM_EISA_RANGES = 4_u32
  PCIC_DEFAULT_IRQMASK = 20152_u32
  PCIC_DEFAULT_NUMSOCKETS = 0_u32
  DTRESULTOK = 0_u32
  DTRESULTFIX = 1_u32
  DTRESULTPROB = 2_u32
  DTRESULTPART = 3_u32
  PIR_OPTION_ENABLED = 1_u32
  PIR_OPTION_REGISTRY = 2_u32
  PIR_OPTION_MSSPEC = 4_u32
  PIR_OPTION_REALMODE = 8_u32
  PIR_OPTION_DEFAULT = 15_u32
  PIR_STATUS_ERROR = 0_u32
  PIR_STATUS_ENABLED = 1_u32
  PIR_STATUS_DISABLED = 2_u32
  PIR_STATUS_MAX = 3_u32
  PIR_STATUS_TABLE_REGISTRY = 0_u32
  PIR_STATUS_TABLE_MSSPEC = 1_u32
  PIR_STATUS_TABLE_REALMODE = 2_u32
  PIR_STATUS_TABLE_NONE = 3_u32
  PIR_STATUS_TABLE_ERROR = 4_u32
  PIR_STATUS_TABLE_BAD = 5_u32
  PIR_STATUS_TABLE_SUCCESS = 6_u32
  PIR_STATUS_TABLE_MAX = 7_u32
  PIR_STATUS_MINIPORT_NORMAL = 0_u32
  PIR_STATUS_MINIPORT_COMPATIBLE = 1_u32
  PIR_STATUS_MINIPORT_OVERRIDE = 2_u32
  PIR_STATUS_MINIPORT_NONE = 3_u32
  PIR_STATUS_MINIPORT_ERROR = 4_u32
  PIR_STATUS_MINIPORT_NOKEY = 5_u32
  PIR_STATUS_MINIPORT_SUCCESS = 6_u32
  PIR_STATUS_MINIPORT_INVALID = 7_u32
  PIR_STATUS_MINIPORT_MAX = 8_u32
  LASTGOOD_OPERATION = 255_u32
  LASTGOOD_OPERATION_NOPOSTPROC = 0_u32
  LASTGOOD_OPERATION_DELETE = 1_u32

  alias PQUERYHANDLER = Proc(Void*, Val_context*, UInt32, Void*, UInt32*, UInt32, UInt32)


  enum REG_VALUE_TYPE : UInt32
    REG_NONE = 0
    REG_SZ = 1
    REG_EXPAND_SZ = 2
    REG_BINARY = 3
    REG_DWORD = 4
    REG_DWORD_LITTLE_ENDIAN = 4
    REG_DWORD_BIG_ENDIAN = 5
    REG_LINK = 6
    REG_MULTI_SZ = 7
    REG_RESOURCE_LIST = 8
    REG_FULL_RESOURCE_DESCRIPTOR = 9
    REG_RESOURCE_REQUIREMENTS_LIST = 10
    REG_QWORD = 11
    REG_QWORD_LITTLE_ENDIAN = 11
  end

  enum REG_SAM_FLAGS : UInt32
    KEY_QUERY_VALUE = 1
    KEY_SET_VALUE = 2
    KEY_CREATE_SUB_KEY = 4
    KEY_ENUMERATE_SUB_KEYS = 8
    KEY_NOTIFY = 16
    KEY_CREATE_LINK = 32
    KEY_WOW64_32KEY = 512
    KEY_WOW64_64KEY = 256
    KEY_WOW64_RES = 768
    KEY_READ = 131097
    KEY_WRITE = 131078
    KEY_EXECUTE = 131097
    KEY_ALL_ACCESS = 983103
  end

  enum REG_OPEN_CREATE_OPTIONS : UInt32
    REG_OPTION_RESERVED = 0
    REG_OPTION_NON_VOLATILE = 0
    REG_OPTION_VOLATILE = 1
    REG_OPTION_CREATE_LINK = 2
    REG_OPTION_BACKUP_RESTORE = 4
    REG_OPTION_OPEN_LINK = 8
    REG_OPTION_DONT_VIRTUALIZE = 16
  end

  enum REG_CREATE_KEY_DISPOSITION : UInt32
    REG_CREATED_NEW_KEY = 1
    REG_OPENED_EXISTING_KEY = 2
  end

  enum REG_SAVE_FORMAT : UInt32
    REG_STANDARD_FORMAT = 1
    REG_LATEST_FORMAT = 2
    REG_NO_COMPRESSION = 4
  end

  enum REG_RESTORE_KEY_FLAGS : Int32
    REG_FORCE_RESTORE = 8
    REG_WHOLE_HIVE_VOLATILE = 1
  end

  enum REG_NOTIFY_FILTER : UInt32
    REG_NOTIFY_CHANGE_NAME = 1
    REG_NOTIFY_CHANGE_ATTRIBUTES = 2
    REG_NOTIFY_CHANGE_LAST_SET = 4
    REG_NOTIFY_CHANGE_SECURITY = 8
    REG_NOTIFY_THREAD_AGNOSTIC = 268435456
  end

  enum RRF_RT : UInt32
    RRF_RT_ANY = 65535
    RRF_RT_DWORD = 24
    RRF_RT_QWORD = 72
    RRF_RT_REG_BINARY = 8
    RRF_RT_REG_DWORD = 16
    RRF_RT_REG_EXPAND_SZ = 4
    RRF_RT_REG_MULTI_SZ = 32
    RRF_RT_REG_NONE = 1
    RRF_RT_REG_QWORD = 64
    RRF_RT_REG_SZ = 2
  end

  struct Val_context
    valuelen : Int32
    value_context : Void*
    val_buff_ptr : Void*
  end
  struct Pvaluea
    pv_valuename : PSTR
    pv_valuelen : Int32
    pv_value_context : Void*
    pv_type : UInt32
  end
  struct Pvaluew
    pv_valuename : LibC::LPWSTR
    pv_valuelen : Int32
    pv_value_context : Void*
    pv_type : UInt32
  end
  struct Provider_info
    pi_r0_1val : PQUERYHANDLER
    pi_r0_allvals : PQUERYHANDLER
    pi_r3_1val : PQUERYHANDLER
    pi_r3_allvals : PQUERYHANDLER
    pi_flags : UInt32
    pi_key_context : Void*
  end
  struct VALENTA
    ve_valuename : PSTR
    ve_valuelen : UInt32
    ve_valueptr : LibC::UINT_PTR
    ve_type : REG_VALUE_TYPE
  end
  struct VALENTW
    ve_valuename : LibC::LPWSTR
    ve_valuelen : UInt32
    ve_valueptr : LibC::UINT_PTR
    ve_type : REG_VALUE_TYPE
  end
  struct DSKTLSYSTEMTIME
    w_year : UInt16
    w_month : UInt16
    w_day_of_week : UInt16
    w_day : UInt16
    w_hour : UInt16
    w_minute : UInt16
    w_second : UInt16
    w_milliseconds : UInt16
    w_result : UInt16
  end


  # Params # hkey : HKEY [In]
  # Commented out because function is part of Lib C
  #fun RegCloseKey(hkey : HKEY) : LSTATUS

  # Params # hkey : HKEY [In],hnewhkey : HKEY [In]
  fun RegOverridePredefKey(hkey : HKEY, hnewhkey : HKEY) : LSTATUS

  # Params # htoken : LibC::HANDLE [In],dwoptions : UInt32 [In],samdesired : UInt32 [In],phkresult : HKEY* [In]
  fun RegOpenUserClassesRoot(htoken : LibC::HANDLE, dwoptions : UInt32, samdesired : UInt32, phkresult : HKEY*) : LSTATUS

  # Params # samdesired : UInt32 [In],phkresult : HKEY* [In]
  fun RegOpenCurrentUser(samdesired : UInt32, phkresult : HKEY*) : LSTATUS

  # Params # 
  fun RegDisablePredefinedCache : LSTATUS

  # Params # 
  fun RegDisablePredefinedCacheEx : LSTATUS

  # Params # lpmachinename : PSTR [In],hkey : HKEY [In],phkresult : HKEY* [In]
  fun RegConnectRegistryA(lpmachinename : PSTR, hkey : HKEY, phkresult : HKEY*) : LSTATUS

  # Params # lpmachinename : LibC::LPWSTR [In],hkey : HKEY [In],phkresult : HKEY* [In]
  fun RegConnectRegistryW(lpmachinename : LibC::LPWSTR, hkey : HKEY, phkresult : HKEY*) : LSTATUS

  # Params # lpmachinename : PSTR [In],hkey : HKEY [In],flags : UInt32 [In],phkresult : HKEY* [In]
  fun RegConnectRegistryExA(lpmachinename : PSTR, hkey : HKEY, flags : UInt32, phkresult : HKEY*) : LSTATUS

  # Params # lpmachinename : LibC::LPWSTR [In],hkey : HKEY [In],flags : UInt32 [In],phkresult : HKEY* [In]
  fun RegConnectRegistryExW(lpmachinename : LibC::LPWSTR, hkey : HKEY, flags : UInt32, phkresult : HKEY*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],phkresult : HKEY* [In]
  fun RegCreateKeyA(hkey : HKEY, lpsubkey : PSTR, phkresult : HKEY*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],phkresult : HKEY* [In]
  fun RegCreateKeyW(hkey : HKEY, lpsubkey : LibC::LPWSTR, phkresult : HKEY*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],reserved : UInt32 [In],lpclass : PSTR [In],dwoptions : REG_OPEN_CREATE_OPTIONS [In],samdesired : REG_SAM_FLAGS [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],phkresult : HKEY* [In],lpdwdisposition : REG_CREATE_KEY_DISPOSITION* [In]
  fun RegCreateKeyExA(hkey : HKEY, lpsubkey : PSTR, reserved : UInt32, lpclass : PSTR, dwoptions : REG_OPEN_CREATE_OPTIONS, samdesired : REG_SAM_FLAGS, lpsecurityattributes : SECURITY_ATTRIBUTES*, phkresult : HKEY*, lpdwdisposition : REG_CREATE_KEY_DISPOSITION*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],reserved : UInt32 [In],lpclass : LibC::LPWSTR [In],dwoptions : REG_OPEN_CREATE_OPTIONS [In],samdesired : REG_SAM_FLAGS [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],phkresult : HKEY* [In],lpdwdisposition : REG_CREATE_KEY_DISPOSITION* [In]
  fun RegCreateKeyExW(hkey : HKEY, lpsubkey : LibC::LPWSTR, reserved : UInt32, lpclass : LibC::LPWSTR, dwoptions : REG_OPEN_CREATE_OPTIONS, samdesired : REG_SAM_FLAGS, lpsecurityattributes : SECURITY_ATTRIBUTES*, phkresult : HKEY*, lpdwdisposition : REG_CREATE_KEY_DISPOSITION*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],reserved : UInt32 [In],lpclass : PSTR [In],dwoptions : REG_OPEN_CREATE_OPTIONS [In],samdesired : REG_SAM_FLAGS [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],phkresult : HKEY* [In],lpdwdisposition : REG_CREATE_KEY_DISPOSITION* [In],htransaction : LibC::HANDLE [In],pextendedparemeter : Void* [In]
  fun RegCreateKeyTransactedA(hkey : HKEY, lpsubkey : PSTR, reserved : UInt32, lpclass : PSTR, dwoptions : REG_OPEN_CREATE_OPTIONS, samdesired : REG_SAM_FLAGS, lpsecurityattributes : SECURITY_ATTRIBUTES*, phkresult : HKEY*, lpdwdisposition : REG_CREATE_KEY_DISPOSITION*, htransaction : LibC::HANDLE, pextendedparemeter : Void*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],reserved : UInt32 [In],lpclass : LibC::LPWSTR [In],dwoptions : REG_OPEN_CREATE_OPTIONS [In],samdesired : REG_SAM_FLAGS [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],phkresult : HKEY* [In],lpdwdisposition : REG_CREATE_KEY_DISPOSITION* [In],htransaction : LibC::HANDLE [In],pextendedparemeter : Void* [In]
  fun RegCreateKeyTransactedW(hkey : HKEY, lpsubkey : LibC::LPWSTR, reserved : UInt32, lpclass : LibC::LPWSTR, dwoptions : REG_OPEN_CREATE_OPTIONS, samdesired : REG_SAM_FLAGS, lpsecurityattributes : SECURITY_ATTRIBUTES*, phkresult : HKEY*, lpdwdisposition : REG_CREATE_KEY_DISPOSITION*, htransaction : LibC::HANDLE, pextendedparemeter : Void*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In]
  fun RegDeleteKeyA(hkey : HKEY, lpsubkey : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In]
  fun RegDeleteKeyW(hkey : HKEY, lpsubkey : LibC::LPWSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],samdesired : UInt32 [In],reserved : UInt32 [In]
  fun RegDeleteKeyExA(hkey : HKEY, lpsubkey : PSTR, samdesired : UInt32, reserved : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],samdesired : UInt32 [In],reserved : UInt32 [In]
  fun RegDeleteKeyExW(hkey : HKEY, lpsubkey : LibC::LPWSTR, samdesired : UInt32, reserved : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],samdesired : UInt32 [In],reserved : UInt32 [In],htransaction : LibC::HANDLE [In],pextendedparameter : Void* [In]
  fun RegDeleteKeyTransactedA(hkey : HKEY, lpsubkey : PSTR, samdesired : UInt32, reserved : UInt32, htransaction : LibC::HANDLE, pextendedparameter : Void*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],samdesired : UInt32 [In],reserved : UInt32 [In],htransaction : LibC::HANDLE [In],pextendedparameter : Void* [In]
  fun RegDeleteKeyTransactedW(hkey : HKEY, lpsubkey : LibC::LPWSTR, samdesired : UInt32, reserved : UInt32, htransaction : LibC::HANDLE, pextendedparameter : Void*) : LSTATUS

  # Params # hbase : HKEY [In]
  fun RegDisableReflectionKey(hbase : HKEY) : Int32

  # Params # hbase : HKEY [In]
  fun RegEnableReflectionKey(hbase : HKEY) : Int32

  # Params # hbase : HKEY [In],bisreflectiondisabled : LibC::BOOL* [In]
  fun RegQueryReflectionKey(hbase : HKEY, bisreflectiondisabled : LibC::BOOL*) : Int32

  # Params # hkey : HKEY [In],lpvaluename : PSTR [In]
  fun RegDeleteValueA(hkey : HKEY, lpvaluename : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpvaluename : LibC::LPWSTR [In]
  fun RegDeleteValueW(hkey : HKEY, lpvaluename : LibC::LPWSTR) : LSTATUS

  # Params # hkey : HKEY [In],dwindex : UInt32 [In],lpname : UInt8* [In],cchname : UInt32 [In]
  fun RegEnumKeyA(hkey : HKEY, dwindex : UInt32, lpname : UInt8*, cchname : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],dwindex : UInt32 [In],lpname : Char* [In],cchname : UInt32 [In]
  fun RegEnumKeyW(hkey : HKEY, dwindex : UInt32, lpname : Char*, cchname : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],dwindex : UInt32 [In],lpname : UInt8* [In],lpcchname : UInt32* [In],lpreserved : UInt32* [In],lpclass : UInt8* [In],lpcchclass : UInt32* [In],lpftlastwritetime : FILETIME* [In]
  fun RegEnumKeyExA(hkey : HKEY, dwindex : UInt32, lpname : UInt8*, lpcchname : UInt32*, lpreserved : UInt32*, lpclass : UInt8*, lpcchclass : UInt32*, lpftlastwritetime : FILETIME*) : LSTATUS

  # Params # hkey : HKEY [In],dwindex : UInt32 [In],lpname : Char* [In],lpcchname : UInt32* [In],lpreserved : UInt32* [In],lpclass : Char* [In],lpcchclass : UInt32* [In],lpftlastwritetime : FILETIME* [In]
  # Commented out because function is part of Lib C
  #fun RegEnumKeyExW(hkey : HKEY, dwindex : UInt32, lpname : Char*, lpcchname : UInt32*, lpreserved : UInt32*, lpclass : Char*, lpcchclass : UInt32*, lpftlastwritetime : FILETIME*) : LSTATUS

  # Params # hkey : HKEY [In],dwindex : UInt32 [In],lpvaluename : UInt8* [In],lpcchvaluename : UInt32* [In],lpreserved : UInt32* [In],lptype : UInt32* [In],lpdata : UInt8* [In],lpcbdata : UInt32* [In]
  fun RegEnumValueA(hkey : HKEY, dwindex : UInt32, lpvaluename : UInt8*, lpcchvaluename : UInt32*, lpreserved : UInt32*, lptype : UInt32*, lpdata : UInt8*, lpcbdata : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In],dwindex : UInt32 [In],lpvaluename : Char* [In],lpcchvaluename : UInt32* [In],lpreserved : UInt32* [In],lptype : UInt32* [In],lpdata : UInt8* [In],lpcbdata : UInt32* [In]
  fun RegEnumValueW(hkey : HKEY, dwindex : UInt32, lpvaluename : Char*, lpcchvaluename : UInt32*, lpreserved : UInt32*, lptype : UInt32*, lpdata : UInt8*, lpcbdata : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In]
  fun RegFlushKey(hkey : HKEY) : LSTATUS

  # Params # hkey : HKEY [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],lpcbsecuritydescriptor : UInt32* [In]
  fun RegGetKeySecurity(hkey : HKEY, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*, lpcbsecuritydescriptor : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],lpfile : PSTR [In]
  fun RegLoadKeyA(hkey : HKEY, lpsubkey : PSTR, lpfile : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],lpfile : LibC::LPWSTR [In]
  fun RegLoadKeyW(hkey : HKEY, lpsubkey : LibC::LPWSTR, lpfile : LibC::LPWSTR) : LSTATUS

  # Params # hkey : HKEY [In],bwatchsubtree : LibC::BOOL [In],dwnotifyfilter : REG_NOTIFY_FILTER [In],hevent : LibC::HANDLE [In],fasynchronous : LibC::BOOL [In]
  fun RegNotifyChangeKeyValue(hkey : HKEY, bwatchsubtree : LibC::BOOL, dwnotifyfilter : REG_NOTIFY_FILTER, hevent : LibC::HANDLE, fasynchronous : LibC::BOOL) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],phkresult : HKEY* [In]
  fun RegOpenKeyA(hkey : HKEY, lpsubkey : PSTR, phkresult : HKEY*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],phkresult : HKEY* [In]
  fun RegOpenKeyW(hkey : HKEY, lpsubkey : LibC::LPWSTR, phkresult : HKEY*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],uloptions : UInt32 [In],samdesired : REG_SAM_FLAGS [In],phkresult : HKEY* [In]
  fun RegOpenKeyExA(hkey : HKEY, lpsubkey : PSTR, uloptions : UInt32, samdesired : REG_SAM_FLAGS, phkresult : HKEY*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],uloptions : UInt32 [In],samdesired : REG_SAM_FLAGS [In],phkresult : HKEY* [In]
  # Commented out because function is part of Lib C
  #fun RegOpenKeyExW(hkey : HKEY, lpsubkey : LibC::LPWSTR, uloptions : UInt32, samdesired : REG_SAM_FLAGS, phkresult : HKEY*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],uloptions : UInt32 [In],samdesired : REG_SAM_FLAGS [In],phkresult : HKEY* [In],htransaction : LibC::HANDLE [In],pextendedparemeter : Void* [In]
  fun RegOpenKeyTransactedA(hkey : HKEY, lpsubkey : PSTR, uloptions : UInt32, samdesired : REG_SAM_FLAGS, phkresult : HKEY*, htransaction : LibC::HANDLE, pextendedparemeter : Void*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],uloptions : UInt32 [In],samdesired : REG_SAM_FLAGS [In],phkresult : HKEY* [In],htransaction : LibC::HANDLE [In],pextendedparemeter : Void* [In]
  fun RegOpenKeyTransactedW(hkey : HKEY, lpsubkey : LibC::LPWSTR, uloptions : UInt32, samdesired : REG_SAM_FLAGS, phkresult : HKEY*, htransaction : LibC::HANDLE, pextendedparemeter : Void*) : LSTATUS

  # Params # hkey : HKEY [In],lpclass : UInt8* [In],lpcchclass : UInt32* [In],lpreserved : UInt32* [In],lpcsubkeys : UInt32* [In],lpcbmaxsubkeylen : UInt32* [In],lpcbmaxclasslen : UInt32* [In],lpcvalues : UInt32* [In],lpcbmaxvaluenamelen : UInt32* [In],lpcbmaxvaluelen : UInt32* [In],lpcbsecuritydescriptor : UInt32* [In],lpftlastwritetime : FILETIME* [In]
  fun RegQueryInfoKeyA(hkey : HKEY, lpclass : UInt8*, lpcchclass : UInt32*, lpreserved : UInt32*, lpcsubkeys : UInt32*, lpcbmaxsubkeylen : UInt32*, lpcbmaxclasslen : UInt32*, lpcvalues : UInt32*, lpcbmaxvaluenamelen : UInt32*, lpcbmaxvaluelen : UInt32*, lpcbsecuritydescriptor : UInt32*, lpftlastwritetime : FILETIME*) : LSTATUS

  # Params # hkey : HKEY [In],lpclass : Char* [In],lpcchclass : UInt32* [In],lpreserved : UInt32* [In],lpcsubkeys : UInt32* [In],lpcbmaxsubkeylen : UInt32* [In],lpcbmaxclasslen : UInt32* [In],lpcvalues : UInt32* [In],lpcbmaxvaluenamelen : UInt32* [In],lpcbmaxvaluelen : UInt32* [In],lpcbsecuritydescriptor : UInt32* [In],lpftlastwritetime : FILETIME* [In]
  # Commented out because function is part of Lib C
  #fun RegQueryInfoKeyW(hkey : HKEY, lpclass : Char*, lpcchclass : UInt32*, lpreserved : UInt32*, lpcsubkeys : UInt32*, lpcbmaxsubkeylen : UInt32*, lpcbmaxclasslen : UInt32*, lpcvalues : UInt32*, lpcbmaxvaluenamelen : UInt32*, lpcbmaxvaluelen : UInt32*, lpcbsecuritydescriptor : UInt32*, lpftlastwritetime : FILETIME*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],lpdata : PSTR [In],lpcbdata : Int32* [In]
  fun RegQueryValueA(hkey : HKEY, lpsubkey : PSTR, lpdata : PSTR, lpcbdata : Int32*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],lpdata : LibC::LPWSTR [In],lpcbdata : Int32* [In]
  fun RegQueryValueW(hkey : HKEY, lpsubkey : LibC::LPWSTR, lpdata : LibC::LPWSTR, lpcbdata : Int32*) : LSTATUS

  # Params # hkey : HKEY [In],val_list : VALENTA* [In],num_vals : UInt32 [In],lpvaluebuf : PSTR [In],ldwtotsize : UInt32* [In]
  fun RegQueryMultipleValuesA(hkey : HKEY, val_list : VALENTA*, num_vals : UInt32, lpvaluebuf : PSTR, ldwtotsize : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In],val_list : VALENTW* [In],num_vals : UInt32 [In],lpvaluebuf : LibC::LPWSTR [In],ldwtotsize : UInt32* [In]
  fun RegQueryMultipleValuesW(hkey : HKEY, val_list : VALENTW*, num_vals : UInt32, lpvaluebuf : LibC::LPWSTR, ldwtotsize : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In],lpvaluename : PSTR [In],lpreserved : UInt32* [In],lptype : REG_VALUE_TYPE* [In],lpdata : UInt8* [In],lpcbdata : UInt32* [In]
  fun RegQueryValueExA(hkey : HKEY, lpvaluename : PSTR, lpreserved : UInt32*, lptype : REG_VALUE_TYPE*, lpdata : UInt8*, lpcbdata : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In],lpvaluename : LibC::LPWSTR [In],lpreserved : UInt32* [In],lptype : REG_VALUE_TYPE* [In],lpdata : UInt8* [In],lpcbdata : UInt32* [In]
  # Commented out because function is part of Lib C
  #fun RegQueryValueExW(hkey : HKEY, lpvaluename : LibC::LPWSTR, lpreserved : UInt32*, lptype : REG_VALUE_TYPE*, lpdata : UInt8*, lpcbdata : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],lpnewfile : PSTR [In],lpoldfile : PSTR [In]
  fun RegReplaceKeyA(hkey : HKEY, lpsubkey : PSTR, lpnewfile : PSTR, lpoldfile : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],lpnewfile : LibC::LPWSTR [In],lpoldfile : LibC::LPWSTR [In]
  fun RegReplaceKeyW(hkey : HKEY, lpsubkey : LibC::LPWSTR, lpnewfile : LibC::LPWSTR, lpoldfile : LibC::LPWSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpfile : PSTR [In],dwflags : REG_RESTORE_KEY_FLAGS [In]
  fun RegRestoreKeyA(hkey : HKEY, lpfile : PSTR, dwflags : REG_RESTORE_KEY_FLAGS) : LSTATUS

  # Params # hkey : HKEY [In],lpfile : LibC::LPWSTR [In],dwflags : REG_RESTORE_KEY_FLAGS [In]
  fun RegRestoreKeyW(hkey : HKEY, lpfile : LibC::LPWSTR, dwflags : REG_RESTORE_KEY_FLAGS) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkeyname : LibC::LPWSTR [In],lpnewkeyname : LibC::LPWSTR [In]
  fun RegRenameKey(hkey : HKEY, lpsubkeyname : LibC::LPWSTR, lpnewkeyname : LibC::LPWSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpfile : PSTR [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In]
  fun RegSaveKeyA(hkey : HKEY, lpfile : PSTR, lpsecurityattributes : SECURITY_ATTRIBUTES*) : LSTATUS

  # Params # hkey : HKEY [In],lpfile : LibC::LPWSTR [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In]
  fun RegSaveKeyW(hkey : HKEY, lpfile : LibC::LPWSTR, lpsecurityattributes : SECURITY_ATTRIBUTES*) : LSTATUS

  # Params # hkey : HKEY [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun RegSetKeySecurity(hkey : HKEY, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],dwtype : REG_VALUE_TYPE [In],lpdata : PSTR [In],cbdata : UInt32 [In]
  fun RegSetValueA(hkey : HKEY, lpsubkey : PSTR, dwtype : REG_VALUE_TYPE, lpdata : PSTR, cbdata : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],dwtype : REG_VALUE_TYPE [In],lpdata : LibC::LPWSTR [In],cbdata : UInt32 [In]
  fun RegSetValueW(hkey : HKEY, lpsubkey : LibC::LPWSTR, dwtype : REG_VALUE_TYPE, lpdata : LibC::LPWSTR, cbdata : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpvaluename : PSTR [In],reserved : UInt32 [In],dwtype : REG_VALUE_TYPE [In],lpdata : UInt8* [In],cbdata : UInt32 [In]
  fun RegSetValueExA(hkey : HKEY, lpvaluename : PSTR, reserved : UInt32, dwtype : REG_VALUE_TYPE, lpdata : UInt8*, cbdata : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpvaluename : LibC::LPWSTR [In],reserved : UInt32 [In],dwtype : REG_VALUE_TYPE [In],lpdata : UInt8* [In],cbdata : UInt32 [In]
  fun RegSetValueExW(hkey : HKEY, lpvaluename : LibC::LPWSTR, reserved : UInt32, dwtype : REG_VALUE_TYPE, lpdata : UInt8*, cbdata : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In]
  fun RegUnLoadKeyA(hkey : HKEY, lpsubkey : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In]
  fun RegUnLoadKeyW(hkey : HKEY, lpsubkey : LibC::LPWSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],lpvaluename : PSTR [In]
  fun RegDeleteKeyValueA(hkey : HKEY, lpsubkey : PSTR, lpvaluename : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],lpvaluename : LibC::LPWSTR [In]
  fun RegDeleteKeyValueW(hkey : HKEY, lpsubkey : LibC::LPWSTR, lpvaluename : LibC::LPWSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],lpvaluename : PSTR [In],dwtype : UInt32 [In],lpdata : Void* [In],cbdata : UInt32 [In]
  fun RegSetKeyValueA(hkey : HKEY, lpsubkey : PSTR, lpvaluename : PSTR, dwtype : UInt32, lpdata : Void*, cbdata : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],lpvaluename : LibC::LPWSTR [In],dwtype : UInt32 [In],lpdata : Void* [In],cbdata : UInt32 [In]
  fun RegSetKeyValueW(hkey : HKEY, lpsubkey : LibC::LPWSTR, lpvaluename : LibC::LPWSTR, dwtype : UInt32, lpdata : Void*, cbdata : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In]
  fun RegDeleteTreeA(hkey : HKEY, lpsubkey : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In]
  fun RegDeleteTreeW(hkey : HKEY, lpsubkey : LibC::LPWSTR) : LSTATUS

  # Params # hkeysrc : HKEY [In],lpsubkey : PSTR [In],hkeydest : HKEY [In]
  fun RegCopyTreeA(hkeysrc : HKEY, lpsubkey : PSTR, hkeydest : HKEY) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : PSTR [In],lpvalue : PSTR [In],dwflags : RRF_RT [In],pdwtype : UInt32* [In],pvdata : Void* [In],pcbdata : UInt32* [In]
  fun RegGetValueA(hkey : HKEY, lpsubkey : PSTR, lpvalue : PSTR, dwflags : RRF_RT, pdwtype : UInt32*, pvdata : Void*, pcbdata : UInt32*) : LSTATUS

  # Params # hkey : HKEY [In],lpsubkey : LibC::LPWSTR [In],lpvalue : LibC::LPWSTR [In],dwflags : RRF_RT [In],pdwtype : UInt32* [In],pvdata : Void* [In],pcbdata : UInt32* [In]
  fun RegGetValueW(hkey : HKEY, lpsubkey : LibC::LPWSTR, lpvalue : LibC::LPWSTR, dwflags : RRF_RT, pdwtype : UInt32*, pvdata : Void*, pcbdata : UInt32*) : LSTATUS

  # Params # hkeysrc : HKEY [In],lpsubkey : LibC::LPWSTR [In],hkeydest : HKEY [In]
  fun RegCopyTreeW(hkeysrc : HKEY, lpsubkey : LibC::LPWSTR, hkeydest : HKEY) : LSTATUS

  # Params # hkey : HKEY [In],pszvalue : PSTR [In],pszoutbuf : PSTR [In],cboutbuf : UInt32 [In],pcbdata : UInt32* [In],flags : UInt32 [In],pszdirectory : PSTR [In]
  fun RegLoadMUIStringA(hkey : HKEY, pszvalue : PSTR, pszoutbuf : PSTR, cboutbuf : UInt32, pcbdata : UInt32*, flags : UInt32, pszdirectory : PSTR) : LSTATUS

  # Params # hkey : HKEY [In],pszvalue : LibC::LPWSTR [In],pszoutbuf : LibC::LPWSTR [In],cboutbuf : UInt32 [In],pcbdata : UInt32* [In],flags : UInt32 [In],pszdirectory : LibC::LPWSTR [In]
  fun RegLoadMUIStringW(hkey : HKEY, pszvalue : LibC::LPWSTR, pszoutbuf : LibC::LPWSTR, cboutbuf : UInt32, pcbdata : UInt32*, flags : UInt32, pszdirectory : LibC::LPWSTR) : LSTATUS

  # Params # lpfile : PSTR [In],phkresult : HKEY* [In],samdesired : UInt32 [In],dwoptions : UInt32 [In],reserved : UInt32 [In]
  fun RegLoadAppKeyA(lpfile : PSTR, phkresult : HKEY*, samdesired : UInt32, dwoptions : UInt32, reserved : UInt32) : LSTATUS

  # Params # lpfile : LibC::LPWSTR [In],phkresult : HKEY* [In],samdesired : UInt32 [In],dwoptions : UInt32 [In],reserved : UInt32 [In]
  fun RegLoadAppKeyW(lpfile : LibC::LPWSTR, phkresult : HKEY*, samdesired : UInt32, dwoptions : UInt32, reserved : UInt32) : LSTATUS

  # Params # hkey : HKEY [In],lpfile : PSTR [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],flags : REG_SAVE_FORMAT [In]
  fun RegSaveKeyExA(hkey : HKEY, lpfile : PSTR, lpsecurityattributes : SECURITY_ATTRIBUTES*, flags : REG_SAVE_FORMAT) : LSTATUS

  # Params # hkey : HKEY [In],lpfile : LibC::LPWSTR [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],flags : REG_SAVE_FORMAT [In]
  fun RegSaveKeyExW(hkey : HKEY, lpfile : LibC::LPWSTR, lpsecurityattributes : SECURITY_ATTRIBUTES*, flags : REG_SAVE_FORMAT) : LSTATUS

  # Params # hkeyprimary : HKEY [In],pwszprimarysubkey : LibC::LPWSTR [In],hkeyfallback : HKEY [In],pwszfallbacksubkey : LibC::LPWSTR [In],pwszvalue : LibC::LPWSTR [In],dwflags : UInt32 [In],pdwtype : UInt32* [In],pvdata : Void* [In],cbdatain : UInt32 [In],pcbdataout : UInt32* [In]
  fun GetRegistryValueWithFallbackW(hkeyprimary : HKEY, pwszprimarysubkey : LibC::LPWSTR, hkeyfallback : HKEY, pwszfallbacksubkey : LibC::LPWSTR, pwszvalue : LibC::LPWSTR, dwflags : UInt32, pdwtype : UInt32*, pvdata : Void*, cbdatain : UInt32, pcbdataout : UInt32*) : LSTATUS
end
