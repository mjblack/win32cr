require "./../security.cr"
require "./../foundation.cr"
require "./../system/com.cr"
require "./../system/threading.cr"

module Win32cr::Security::Authorization
  extend self
  alias AUTHZ_ACCESS_CHECK_RESULTS_HANDLE = LibC::IntPtrT
  alias AUTHZ_CLIENT_CONTEXT_HANDLE = LibC::IntPtrT
  alias AUTHZ_RESOURCE_MANAGER_HANDLE = LibC::IntPtrT
  alias AUTHZ_AUDIT_EVENT_HANDLE = LibC::IntPtrT
  alias AUTHZ_AUDIT_EVENT_TYPE_HANDLE = LibC::IntPtrT
  alias AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE = LibC::IntPtrT
  alias PFN_AUTHZ_DYNAMIC_ACCESS_CHECK = Proc(Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, Win32cr::Security::ACE_HEADER*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL)

  alias PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS = Proc(Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, Void*, Win32cr::Security::SID_AND_ATTRIBUTES**, UInt32*, Win32cr::Security::SID_AND_ATTRIBUTES**, UInt32*, Win32cr::Foundation::BOOL)

  alias PFN_AUTHZ_FREE_DYNAMIC_GROUPS = Proc(Win32cr::Security::SID_AND_ATTRIBUTES*, Void)

  alias PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY = Proc(Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, Win32cr::Foundation::PSID, Void*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::BOOL)

  alias PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY = Proc(Void*, Void)

  alias FN_PROGRESS = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::Security::Authorization::PROG_INVOKE_SETTING*, Void*, Win32cr::Foundation::BOOL, Void)

  SDDL_REVISION_1 = 1_u32
  SDDL_REVISION = 1_u32
  SDDL_OWNER = "O"
  SDDL_GROUP = "G"
  SDDL_DACL = "D"
  SDDL_SACL = "S"
  SDDL_PROTECTED = "P"
  SDDL_AUTO_INHERIT_REQ = "AR"
  SDDL_AUTO_INHERITED = "AI"
  SDDL_NULL_ACL = "NO_ACCESS_CONTROL"
  SDDL_ACCESS_ALLOWED = "A"
  SDDL_ACCESS_DENIED = "D"
  SDDL_OBJECT_ACCESS_ALLOWED = "OA"
  SDDL_OBJECT_ACCESS_DENIED = "OD"
  SDDL_AUDIT = "AU"
  SDDL_ALARM = "AL"
  SDDL_OBJECT_AUDIT = "OU"
  SDDL_OBJECT_ALARM = "OL"
  SDDL_MANDATORY_LABEL = "ML"
  SDDL_PROCESS_TRUST_LABEL = "TL"
  SDDL_CALLBACK_ACCESS_ALLOWED = "XA"
  SDDL_CALLBACK_ACCESS_DENIED = "XD"
  SDDL_RESOURCE_ATTRIBUTE = "RA"
  SDDL_SCOPED_POLICY_ID = "SP"
  SDDL_CALLBACK_AUDIT = "XU"
  SDDL_CALLBACK_OBJECT_ACCESS_ALLOWED = "ZA"
  SDDL_ACCESS_FILTER = "FL"
  SDDL_INT = "TI"
  SDDL_UINT = "TU"
  SDDL_WSTRING = "TS"
  SDDL_SID = "TD"
  SDDL_BLOB = "TX"
  SDDL_BOOLEAN = "TB"
  SDDL_CONTAINER_INHERIT = "CI"
  SDDL_OBJECT_INHERIT = "OI"
  SDDL_NO_PROPAGATE = "NP"
  SDDL_INHERIT_ONLY = "IO"
  SDDL_INHERITED = "ID"
  SDDL_CRITICAL = "CR"
  SDDL_TRUST_PROTECTED_FILTER = "TP"
  SDDL_AUDIT_SUCCESS = "SA"
  SDDL_AUDIT_FAILURE = "FA"
  SDDL_READ_PROPERTY = "RP"
  SDDL_WRITE_PROPERTY = "WP"
  SDDL_CREATE_CHILD = "CC"
  SDDL_DELETE_CHILD = "DC"
  SDDL_LIST_CHILDREN = "LC"
  SDDL_SELF_WRITE = "SW"
  SDDL_LIST_OBJECT = "LO"
  SDDL_DELETE_TREE = "DT"
  SDDL_CONTROL_ACCESS = "CR"
  SDDL_READ_CONTROL = "RC"
  SDDL_WRITE_DAC = "WD"
  SDDL_WRITE_OWNER = "WO"
  SDDL_STANDARD_DELETE = "SD"
  SDDL_GENERIC_ALL = "GA"
  SDDL_GENERIC_READ = "GR"
  SDDL_GENERIC_WRITE = "GW"
  SDDL_GENERIC_EXECUTE = "GX"
  SDDL_FILE_ALL = "FA"
  SDDL_FILE_READ = "FR"
  SDDL_FILE_WRITE = "FW"
  SDDL_FILE_EXECUTE = "FX"
  SDDL_KEY_ALL = "KA"
  SDDL_KEY_READ = "KR"
  SDDL_KEY_WRITE = "KW"
  SDDL_KEY_EXECUTE = "KX"
  SDDL_NO_WRITE_UP = "NW"
  SDDL_NO_READ_UP = "NR"
  SDDL_NO_EXECUTE_UP = "NX"
  SDDL_ALIAS_SIZE = 2_u32
  SDDL_DOMAIN_ADMINISTRATORS = "DA"
  SDDL_DOMAIN_GUESTS = "DG"
  SDDL_DOMAIN_USERS = "DU"
  SDDL_ENTERPRISE_DOMAIN_CONTROLLERS = "ED"
  SDDL_DOMAIN_DOMAIN_CONTROLLERS = "DD"
  SDDL_DOMAIN_COMPUTERS = "DC"
  SDDL_BUILTIN_ADMINISTRATORS = "BA"
  SDDL_BUILTIN_GUESTS = "BG"
  SDDL_BUILTIN_USERS = "BU"
  SDDL_LOCAL_ADMIN = "LA"
  SDDL_LOCAL_GUEST = "LG"
  SDDL_ACCOUNT_OPERATORS = "AO"
  SDDL_BACKUP_OPERATORS = "BO"
  SDDL_PRINTER_OPERATORS = "PO"
  SDDL_SERVER_OPERATORS = "SO"
  SDDL_AUTHENTICATED_USERS = "AU"
  SDDL_PERSONAL_SELF = "PS"
  SDDL_CREATOR_OWNER = "CO"
  SDDL_CREATOR_GROUP = "CG"
  SDDL_LOCAL_SYSTEM = "SY"
  SDDL_POWER_USERS = "PU"
  SDDL_EVERYONE = "WD"
  SDDL_REPLICATOR = "RE"
  SDDL_INTERACTIVE = "IU"
  SDDL_NETWORK = "NU"
  SDDL_SERVICE = "SU"
  SDDL_RESTRICTED_CODE = "RC"
  SDDL_WRITE_RESTRICTED_CODE = "WR"
  SDDL_ANONYMOUS = "AN"
  SDDL_SCHEMA_ADMINISTRATORS = "SA"
  SDDL_CERT_SERV_ADMINISTRATORS = "CA"
  SDDL_RAS_SERVERS = "RS"
  SDDL_ENTERPRISE_ADMINS = "EA"
  SDDL_GROUP_POLICY_ADMINS = "PA"
  SDDL_ALIAS_PREW2KCOMPACC = "RU"
  SDDL_LOCAL_SERVICE = "LS"
  SDDL_NETWORK_SERVICE = "NS"
  SDDL_REMOTE_DESKTOP = "RD"
  SDDL_NETWORK_CONFIGURATION_OPS = "NO"
  SDDL_PERFMON_USERS = "MU"
  SDDL_PERFLOG_USERS = "LU"
  SDDL_IIS_USERS = "IS"
  SDDL_CRYPTO_OPERATORS = "CY"
  SDDL_OWNER_RIGHTS = "OW"
  SDDL_EVENT_LOG_READERS = "ER"
  SDDL_ENTERPRISE_RO_DCs = "RO"
  SDDL_CERTSVC_DCOM_ACCESS = "CD"
  SDDL_ALL_APP_PACKAGES = "AC"
  SDDL_RDS_REMOTE_ACCESS_SERVERS = "RA"
  SDDL_RDS_ENDPOINT_SERVERS = "ES"
  SDDL_RDS_MANAGEMENT_SERVERS = "MS"
  SDDL_USER_MODE_DRIVERS = "UD"
  SDDL_HYPER_V_ADMINS = "HA"
  SDDL_CLONEABLE_CONTROLLERS = "CN"
  SDDL_ACCESS_CONTROL_ASSISTANCE_OPS = "AA"
  SDDL_REMOTE_MANAGEMENT_USERS = "RM"
  SDDL_AUTHORITY_ASSERTED = "AS"
  SDDL_SERVICE_ASSERTED = "SS"
  SDDL_PROTECTED_USERS = "AP"
  SDDL_KEY_ADMINS = "KA"
  SDDL_ENTERPRISE_KEY_ADMINS = "EK"
  SDDL_ML_LOW = "LW"
  SDDL_ML_MEDIUM = "ME"
  SDDL_ML_MEDIUM_PLUS = "MP"
  SDDL_ML_HIGH = "HI"
  SDDL_ML_SYSTEM = "SI"
  SDDL_SEPERATOR = ";"
  SDDL_DELIMINATOR = ":"
  SDDL_ACE_BEGIN = "("
  SDDL_ACE_END = ")"
  SDDL_ACE_COND_BEGIN = "("
  SDDL_ACE_COND_END = ")"
  SDDL_SPACE = " "
  SDDL_ACE_COND_BLOB_PREFIX = "#"
  SDDL_ACE_COND_SID_PREFIX = "SID"
  SDDL_ACE_COND_ATTRIBUTE_PREFIX = "@"
  SDDL_ACE_COND_USER_ATTRIBUTE_PREFIX = "@USER."
  SDDL_ACE_COND_RESOURCE_ATTRIBUTE_PREFIX = "@RESOURCE."
  SDDL_ACE_COND_DEVICE_ATTRIBUTE_PREFIX = "@DEVICE."
  SDDL_ACE_COND_TOKEN_ATTRIBUTE_PREFIX = "@TOKEN."
  INHERITED_ACCESS_ENTRY = 16_u32
  INHERITED_PARENT = 268435456_u32
  INHERITED_GRANDPARENT = 536870912_u32
  ACCCTRL_DEFAULT_PROVIDERA = "Windows NT Access Provider"
  ACCCTRL_DEFAULT_PROVIDERW = "Windows NT Access Provider"
  ACCCTRL_DEFAULT_PROVIDER = "Windows NT Access Provider"
  TRUSTEE_ACCESS_ALLOWED = 1_i32
  TRUSTEE_ACCESS_READ = 2_i32
  TRUSTEE_ACCESS_WRITE = 4_i32
  TRUSTEE_ACCESS_EXPLICIT = 1_i32
  TRUSTEE_ACCESS_ALL = -1_i32
  ACTRL_RESERVED = 0_u32
  ACTRL_PERM_1 = 1_u32
  ACTRL_PERM_2 = 2_u32
  ACTRL_PERM_3 = 4_u32
  ACTRL_PERM_4 = 8_u32
  ACTRL_PERM_5 = 16_u32
  ACTRL_PERM_6 = 32_u32
  ACTRL_PERM_7 = 64_u32
  ACTRL_PERM_8 = 128_u32
  ACTRL_PERM_9 = 256_u32
  ACTRL_PERM_10 = 512_u32
  ACTRL_PERM_11 = 1024_u32
  ACTRL_PERM_12 = 2048_u32
  ACTRL_PERM_13 = 4096_u32
  ACTRL_PERM_14 = 8192_u32
  ACTRL_PERM_15 = 16384_u32
  ACTRL_PERM_16 = 32768_u32
  ACTRL_PERM_17 = 65536_u32
  ACTRL_PERM_18 = 131072_u32
  ACTRL_PERM_19 = 262144_u32
  ACTRL_PERM_20 = 524288_u32
  ACTRL_ACCESS_PROTECTED = 1_u32
  ACTRL_SYSTEM_ACCESS = 67108864_u32
  ACTRL_DELETE = 134217728_u32
  ACTRL_READ_CONTROL = 268435456_u32
  ACTRL_CHANGE_ACCESS = 536870912_u32
  ACTRL_CHANGE_OWNER = 1073741824_u32
  ACTRL_SYNCHRONIZE = 2147483648_u32
  ACTRL_STD_RIGHTS_ALL = 4160749568_u32
  ACTRL_FILE_READ = 1_u32
  ACTRL_FILE_WRITE = 2_u32
  ACTRL_FILE_APPEND = 4_u32
  ACTRL_FILE_READ_PROP = 8_u32
  ACTRL_FILE_WRITE_PROP = 16_u32
  ACTRL_FILE_EXECUTE = 32_u32
  ACTRL_FILE_READ_ATTRIB = 128_u32
  ACTRL_FILE_WRITE_ATTRIB = 256_u32
  ACTRL_FILE_CREATE_PIPE = 512_u32
  ACTRL_DIR_LIST = 1_u32
  ACTRL_DIR_CREATE_OBJECT = 2_u32
  ACTRL_DIR_CREATE_CHILD = 4_u32
  ACTRL_DIR_DELETE_CHILD = 64_u32
  ACTRL_DIR_TRAVERSE = 32_u32
  ACTRL_KERNEL_TERMINATE = 1_u32
  ACTRL_KERNEL_THREAD = 2_u32
  ACTRL_KERNEL_VM = 4_u32
  ACTRL_KERNEL_VM_READ = 8_u32
  ACTRL_KERNEL_VM_WRITE = 16_u32
  ACTRL_KERNEL_DUP_HANDLE = 32_u32
  ACTRL_KERNEL_PROCESS = 64_u32
  ACTRL_KERNEL_SET_INFO = 128_u32
  ACTRL_KERNEL_GET_INFO = 256_u32
  ACTRL_KERNEL_CONTROL = 512_u32
  ACTRL_KERNEL_ALERT = 1024_u32
  ACTRL_KERNEL_GET_CONTEXT = 2048_u32
  ACTRL_KERNEL_SET_CONTEXT = 4096_u32
  ACTRL_KERNEL_TOKEN = 8192_u32
  ACTRL_KERNEL_IMPERSONATE = 16384_u32
  ACTRL_KERNEL_DIMPERSONATE = 32768_u32
  ACTRL_PRINT_SADMIN = 1_u32
  ACTRL_PRINT_SLIST = 2_u32
  ACTRL_PRINT_PADMIN = 4_u32
  ACTRL_PRINT_PUSE = 8_u32
  ACTRL_PRINT_JADMIN = 16_u32
  ACTRL_SVC_GET_INFO = 1_u32
  ACTRL_SVC_SET_INFO = 2_u32
  ACTRL_SVC_STATUS = 4_u32
  ACTRL_SVC_LIST = 8_u32
  ACTRL_SVC_START = 16_u32
  ACTRL_SVC_STOP = 32_u32
  ACTRL_SVC_PAUSE = 64_u32
  ACTRL_SVC_INTERROGATE = 128_u32
  ACTRL_SVC_UCONTROL = 256_u32
  ACTRL_REG_QUERY = 1_u32
  ACTRL_REG_SET = 2_u32
  ACTRL_REG_CREATE_CHILD = 4_u32
  ACTRL_REG_LIST = 8_u32
  ACTRL_REG_NOTIFY = 16_u32
  ACTRL_REG_LINK = 32_u32
  ACTRL_WIN_CLIPBRD = 1_u32
  ACTRL_WIN_GLOBAL_ATOMS = 2_u32
  ACTRL_WIN_CREATE = 4_u32
  ACTRL_WIN_LIST_DESK = 8_u32
  ACTRL_WIN_LIST = 16_u32
  ACTRL_WIN_READ_ATTRIBS = 32_u32
  ACTRL_WIN_WRITE_ATTRIBS = 64_u32
  ACTRL_WIN_SCREEN = 128_u32
  ACTRL_WIN_EXIT = 256_u32
  ACTRL_ACCESS_NO_OPTIONS = 0_u32
  ACTRL_ACCESS_SUPPORTS_OBJECT_ENTRIES = 1_u32
  AUDIT_TYPE_LEGACY = 1_u32
  AUDIT_TYPE_WMI = 2_u32
  AP_ParamTypeBits = 8_u32
  AP_ParamTypeMask = 255_i32
  AUTHZ_SS_MAXSIZE_ = 128_u32
  APF_AuditFailure = 0_u32
  APF_AuditSuccess = 1_u32
  APF_ValidFlags = 1_u32
  AUTHZP_WPD_EVENT = 16_u32
  AUTHZ_ALLOW_MULTIPLE_SOURCE_INSTANCES = 1_u32
  AUTHZ_MIGRATED_LEGACY_PUBLISHER = 2_u32
  AUTHZ_AUDIT_INSTANCE_INFORMATION = 2_u32
  AUTHZ_SKIP_TOKEN_GROUPS = 2_u32
  AUTHZ_REQUIRE_S4U_LOGON = 4_u32
  AUTHZ_COMPUTE_PRIVILEGES = 8_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_INVALID = 0_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64 = 1_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64 = 2_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING = 3_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN = 4_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID = 5_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN = 6_u32
  AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING = 16_u32
  AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1 = 1_u32
  AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION = 1_u32
  AUTHZ_RPC_INIT_INFO_CLIENT_VERSION_V1 = 1_u32
  AUTHZ_INIT_INFO_VERSION_V1 = 1_u32
  AUTHZ_WPD_CATEGORY_FLAG = 16_u32
  AUTHZ_FLAG_ALLOW_MULTIPLE_SOURCE_INSTANCES = 1_u32
  OLESCRIPT_E_SYNTAX = -2147352319_i32

  CLSID_AzAuthorizationStore = LibC::GUID.new(0xb2bcff59_u32, 0xa757_u16, 0x4b0b_u16, StaticArray[0xa1_u8, 0xbc_u8, 0xea_u8, 0x69_u8, 0x98_u8, 0x1d_u8, 0xa6_u8, 0x9e_u8])

  CLSID_AzBizRuleContext = LibC::GUID.new(0x5c2dc96f_u32, 0x8d51_u16, 0x434b_u16, StaticArray[0xb3_u8, 0x3c_u8, 0x37_u8, 0x9b_u8, 0xcc_u8, 0xae_u8, 0x77_u8, 0xc3_u8])

  CLSID_AzPrincipalLocator = LibC::GUID.new(0x483afb5d_u32, 0x70df_u16, 0x4e16_u16, StaticArray[0xab_u8, 0xdc_u8, 0xa1_u8, 0xde_u8, 0x4d_u8, 0x1_u8, 0x5a_u8, 0x3e_u8])

  @[Flags]
  enum AUTHZ_RESOURCE_MANAGER_FLAGS : UInt32
    AUTHZ_RM_FLAG_NO_AUDIT = 1_u32
    AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION = 2_u32
    AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES = 4_u32
  end
  enum AUTHZ_ACCESS_CHECK_FLAGS : UInt32
    AUTHZ_ACCESS_CHECK_NO_DEEP_COPY_SD = 1_u32
  end
  enum AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS : UInt32
    AUTHZ_NO_SUCCESS_AUDIT = 1_u32
    AUTHZ_NO_FAILURE_AUDIT = 2_u32
    AUTHZ_NO_ALLOC_STRINGS = 4_u32
  end
  enum TREE_SEC_INFO : UInt32
    TREE_SEC_INFO_SET = 1_u32
    TREE_SEC_INFO_RESET = 2_u32
    TREE_SEC_INFO_RESET_KEEP_EXPLICIT = 3_u32
  end
  enum AUTHZ_GENERATE_RESULTS : UInt32
    AUTHZ_GENERATE_SUCCESS_AUDIT = 1_u32
    AUTHZ_GENERATE_FAILURE_AUDIT = 2_u32
  end
  enum ACTRL_ACCESS_ENTRY_ACCESS_FLAGS : UInt32
    ACTRL_ACCESS_ALLOWED = 1_u32
    ACTRL_ACCESS_DENIED = 2_u32
    ACTRL_AUDIT_SUCCESS = 4_u32
    ACTRL_AUDIT_FAILURE = 8_u32
  end
  @[Flags]
  enum AUTHZ_SECURITY_ATTRIBUTE_FLAGS : UInt32
    AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE = 1_u32
    AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 2_u32
  end
  enum SE_OBJECT_TYPE
    SE_UNKNOWN_OBJECT_TYPE = 0_i32
    SE_FILE_OBJECT = 1_i32
    SE_SERVICE = 2_i32
    SE_PRINTER = 3_i32
    SE_REGISTRY_KEY = 4_i32
    SE_LMSHARE = 5_i32
    SE_KERNEL_OBJECT = 6_i32
    SE_WINDOW_OBJECT = 7_i32
    SE_DS_OBJECT = 8_i32
    SE_DS_OBJECT_ALL = 9_i32
    SE_PROVIDER_DEFINED_OBJECT = 10_i32
    SE_WMIGUID_OBJECT = 11_i32
    SE_REGISTRY_WOW64_32KEY = 12_i32
    SE_REGISTRY_WOW64_64KEY = 13_i32
  end
  enum TRUSTEE_TYPE
    TRUSTEE_IS_UNKNOWN = 0_i32
    TRUSTEE_IS_USER = 1_i32
    TRUSTEE_IS_GROUP = 2_i32
    TRUSTEE_IS_DOMAIN = 3_i32
    TRUSTEE_IS_ALIAS = 4_i32
    TRUSTEE_IS_WELL_KNOWN_GROUP = 5_i32
    TRUSTEE_IS_DELETED = 6_i32
    TRUSTEE_IS_INVALID = 7_i32
    TRUSTEE_IS_COMPUTER = 8_i32
  end
  enum TRUSTEE_FORM
    TRUSTEE_IS_SID = 0_i32
    TRUSTEE_IS_NAME = 1_i32
    TRUSTEE_BAD_FORM = 2_i32
    TRUSTEE_IS_OBJECTS_AND_SID = 3_i32
    TRUSTEE_IS_OBJECTS_AND_NAME = 4_i32
  end
  enum MULTIPLE_TRUSTEE_OPERATION
    NO_MULTIPLE_TRUSTEE = 0_i32
    TRUSTEE_IS_IMPERSONATE = 1_i32
  end
  enum ACCESS_MODE
    NOT_USED_ACCESS = 0_i32
    GRANT_ACCESS = 1_i32
    SET_ACCESS = 2_i32
    DENY_ACCESS = 3_i32
    REVOKE_ACCESS = 4_i32
    SET_AUDIT_SUCCESS = 5_i32
    SET_AUDIT_FAILURE = 6_i32
  end
  enum PROG_INVOKE_SETTING
    ProgressInvokeNever = 1_i32
    ProgressInvokeEveryObject = 2_i32
    ProgressInvokeOnError = 3_i32
    ProgressCancelOperation = 4_i32
    ProgressRetryOperation = 5_i32
    ProgressInvokePrePostError = 6_i32
  end
  enum AUDIT_PARAM_TYPE
    APT_None = 1_i32
    APT_String = 2_i32
    APT_Ulong = 3_i32
    APT_Pointer = 4_i32
    APT_Sid = 5_i32
    APT_LogonId = 6_i32
    APT_ObjectTypeList = 7_i32
    APT_Luid = 8_i32
    APT_Guid = 9_i32
    APT_Time = 10_i32
    APT_Int64 = 11_i32
    APT_IpAddress = 12_i32
    APT_LogonIdWithSid = 13_i32
  end
  enum AUTHZ_SECURITY_ATTRIBUTE_OPERATION
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_NONE = 0_i32
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL = 1_i32
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_ADD = 2_i32
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_DELETE = 3_i32
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE = 4_i32
  end
  enum AUTHZ_SID_OPERATION
    AUTHZ_SID_OPERATION_NONE = 0_i32
    AUTHZ_SID_OPERATION_REPLACE_ALL = 1_i32
    AUTHZ_SID_OPERATION_ADD = 2_i32
    AUTHZ_SID_OPERATION_DELETE = 3_i32
    AUTHZ_SID_OPERATION_REPLACE = 4_i32
  end
  enum AUTHZ_CONTEXT_INFORMATION_CLASS
    AuthzContextInfoUserSid = 1_i32
    AuthzContextInfoGroupsSids = 2_i32
    AuthzContextInfoRestrictedSids = 3_i32
    AuthzContextInfoPrivileges = 4_i32
    AuthzContextInfoExpirationTime = 5_i32
    AuthzContextInfoServerContext = 6_i32
    AuthzContextInfoIdentifier = 7_i32
    AuthzContextInfoSource = 8_i32
    AuthzContextInfoAll = 9_i32
    AuthzContextInfoAuthenticationId = 10_i32
    AuthzContextInfoSecurityAttributes = 11_i32
    AuthzContextInfoDeviceSids = 12_i32
    AuthzContextInfoUserClaims = 13_i32
    AuthzContextInfoDeviceClaims = 14_i32
    AuthzContextInfoAppContainerSid = 15_i32
    AuthzContextInfoCapabilitySids = 16_i32
  end
  enum AUTHZ_AUDIT_EVENT_INFORMATION_CLASS
    AuthzAuditEventInfoFlags = 1_i32
    AuthzAuditEventInfoOperationType = 2_i32
    AuthzAuditEventInfoObjectType = 3_i32
    AuthzAuditEventInfoObjectName = 4_i32
    AuthzAuditEventInfoAdditionalInfo = 5_i32
  end
  enum AZ_PROP_CONSTANTS
    AZ_PROP_NAME = 1_i32
    AZ_PROP_DESCRIPTION = 2_i32
    AZ_PROP_WRITABLE = 3_i32
    AZ_PROP_APPLICATION_DATA = 4_i32
    AZ_PROP_CHILD_CREATE = 5_i32
    AZ_MAX_APPLICATION_NAME_LENGTH = 512_i32
    AZ_MAX_OPERATION_NAME_LENGTH = 64_i32
    AZ_MAX_TASK_NAME_LENGTH = 64_i32
    AZ_MAX_SCOPE_NAME_LENGTH = 65536_i32
    AZ_MAX_GROUP_NAME_LENGTH = 64_i32
    AZ_MAX_ROLE_NAME_LENGTH = 64_i32
    AZ_MAX_NAME_LENGTH = 65536_i32
    AZ_MAX_DESCRIPTION_LENGTH = 1024_i32
    AZ_MAX_APPLICATION_DATA_LENGTH = 4096_i32
    AZ_SUBMIT_FLAG_ABORT = 1_i32
    AZ_SUBMIT_FLAG_FLUSH = 2_i32
    AZ_MAX_POLICY_URL_LENGTH = 65536_i32
    AZ_AZSTORE_FLAG_CREATE = 1_i32
    AZ_AZSTORE_FLAG_MANAGE_STORE_ONLY = 2_i32
    AZ_AZSTORE_FLAG_BATCH_UPDATE = 4_i32
    AZ_AZSTORE_FLAG_AUDIT_IS_CRITICAL = 8_i32
    AZ_AZSTORE_FORCE_APPLICATION_CLOSE = 16_i32
    AZ_AZSTORE_NT6_FUNCTION_LEVEL = 32_i32
    AZ_AZSTORE_FLAG_MANAGE_ONLY_PASSIVE_SUBMIT = 32768_i32
    AZ_PROP_AZSTORE_DOMAIN_TIMEOUT = 100_i32
    AZ_AZSTORE_DEFAULT_DOMAIN_TIMEOUT = 15000_i32
    AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT = 101_i32
    AZ_AZSTORE_MIN_DOMAIN_TIMEOUT = 500_i32
    AZ_AZSTORE_MIN_SCRIPT_ENGINE_TIMEOUT = 5000_i32
    AZ_AZSTORE_DEFAULT_SCRIPT_ENGINE_TIMEOUT = 45000_i32
    AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES = 102_i32
    AZ_AZSTORE_DEFAULT_MAX_SCRIPT_ENGINES = 120_i32
    AZ_PROP_AZSTORE_MAJOR_VERSION = 103_i32
    AZ_PROP_AZSTORE_MINOR_VERSION = 104_i32
    AZ_PROP_AZSTORE_TARGET_MACHINE = 105_i32
    AZ_PROP_AZTORE_IS_ADAM_INSTANCE = 106_i32
    AZ_PROP_OPERATION_ID = 200_i32
    AZ_PROP_TASK_OPERATIONS = 300_i32
    AZ_PROP_TASK_BIZRULE = 301_i32
    AZ_PROP_TASK_BIZRULE_LANGUAGE = 302_i32
    AZ_PROP_TASK_TASKS = 303_i32
    AZ_PROP_TASK_BIZRULE_IMPORTED_PATH = 304_i32
    AZ_PROP_TASK_IS_ROLE_DEFINITION = 305_i32
    AZ_MAX_TASK_BIZRULE_LENGTH = 65536_i32
    AZ_MAX_TASK_BIZRULE_LANGUAGE_LENGTH = 64_i32
    AZ_MAX_TASK_BIZRULE_IMPORTED_PATH_LENGTH = 512_i32
    AZ_MAX_BIZRULE_STRING = 65536_i32
    AZ_PROP_GROUP_TYPE = 400_i32
    AZ_GROUPTYPE_LDAP_QUERY = 1_i32
    AZ_GROUPTYPE_BASIC = 2_i32
    AZ_GROUPTYPE_BIZRULE = 3_i32
    AZ_PROP_GROUP_APP_MEMBERS = 401_i32
    AZ_PROP_GROUP_APP_NON_MEMBERS = 402_i32
    AZ_PROP_GROUP_LDAP_QUERY = 403_i32
    AZ_MAX_GROUP_LDAP_QUERY_LENGTH = 4096_i32
    AZ_PROP_GROUP_MEMBERS = 404_i32
    AZ_PROP_GROUP_NON_MEMBERS = 405_i32
    AZ_PROP_GROUP_MEMBERS_NAME = 406_i32
    AZ_PROP_GROUP_NON_MEMBERS_NAME = 407_i32
    AZ_PROP_GROUP_BIZRULE = 408_i32
    AZ_PROP_GROUP_BIZRULE_LANGUAGE = 409_i32
    AZ_PROP_GROUP_BIZRULE_IMPORTED_PATH = 410_i32
    AZ_MAX_GROUP_BIZRULE_LENGTH = 65536_i32
    AZ_MAX_GROUP_BIZRULE_LANGUAGE_LENGTH = 64_i32
    AZ_MAX_GROUP_BIZRULE_IMPORTED_PATH_LENGTH = 512_i32
    AZ_PROP_ROLE_APP_MEMBERS = 500_i32
    AZ_PROP_ROLE_MEMBERS = 501_i32
    AZ_PROP_ROLE_OPERATIONS = 502_i32
    AZ_PROP_ROLE_TASKS = 504_i32
    AZ_PROP_ROLE_MEMBERS_NAME = 505_i32
    AZ_PROP_SCOPE_BIZRULES_WRITABLE = 600_i32
    AZ_PROP_SCOPE_CAN_BE_DELEGATED = 601_i32
    AZ_PROP_CLIENT_CONTEXT_USER_DN = 700_i32
    AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT = 701_i32
    AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY = 702_i32
    AZ_PROP_CLIENT_CONTEXT_USER_GUID = 703_i32
    AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL = 704_i32
    AZ_PROP_CLIENT_CONTEXT_USER_UPN = 705_i32
    AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT = 707_i32
    AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK = 708_i32
    AZ_PROP_CLIENT_CONTEXT_LDAP_QUERY_DN = 709_i32
    AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID = 800_i32
    AZ_PROP_APPLICATION_VERSION = 801_i32
    AZ_MAX_APPLICATION_VERSION_LENGTH = 512_i32
    AZ_PROP_APPLICATION_NAME = 802_i32
    AZ_PROP_APPLICATION_BIZRULE_ENABLED = 803_i32
    AZ_PROP_APPLY_STORE_SACL = 900_i32
    AZ_PROP_GENERATE_AUDITS = 901_i32
    AZ_PROP_POLICY_ADMINS = 902_i32
    AZ_PROP_POLICY_READERS = 903_i32
    AZ_PROP_DELEGATED_POLICY_USERS = 904_i32
    AZ_PROP_POLICY_ADMINS_NAME = 905_i32
    AZ_PROP_POLICY_READERS_NAME = 906_i32
    AZ_PROP_DELEGATED_POLICY_USERS_NAME = 907_i32
    AZ_CLIENT_CONTEXT_SKIP_GROUP = 1_i32
    AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY = 1_i32
    AZ_CLIENT_CONTEXT_GET_GROUP_RECURSIVE = 2_i32
    AZ_CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY = 2_i32
  end

  @[Extern]
  struct OBJECTS_AND_SID
    property objects_present : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type_guid : LibC::GUID
    property inherited_object_type_guid : LibC::GUID
    property pSid : Win32cr::Security::SID*
    def initialize(@objects_present : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type_guid : LibC::GUID, @inherited_object_type_guid : LibC::GUID, @pSid : Win32cr::Security::SID*)
    end
  end

  @[Extern]
  struct OBJECTS_AND_NAME_A
    property objects_present : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE
    property object_type_name : Win32cr::Foundation::PSTR
    property inherited_object_type_name : Win32cr::Foundation::PSTR
    property ptstrName : Win32cr::Foundation::PSTR
    def initialize(@objects_present : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, @object_type_name : Win32cr::Foundation::PSTR, @inherited_object_type_name : Win32cr::Foundation::PSTR, @ptstrName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct OBJECTS_AND_NAME_W
    property objects_present : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE
    property object_type_name : Win32cr::Foundation::PWSTR
    property inherited_object_type_name : Win32cr::Foundation::PWSTR
    property ptstrName : Win32cr::Foundation::PWSTR
    def initialize(@objects_present : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, @object_type_name : Win32cr::Foundation::PWSTR, @inherited_object_type_name : Win32cr::Foundation::PWSTR, @ptstrName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct TRUSTEE_A
    property pMultipleTrustee : Win32cr::Security::Authorization::TRUSTEE_A*
    property multiple_trustee_operation : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION
    property trustee_form : Win32cr::Security::Authorization::TRUSTEE_FORM
    property trustee_type : Win32cr::Security::Authorization::TRUSTEE_TYPE
    property ptstrName : Win32cr::Foundation::PSTR
    def initialize(@pMultipleTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, @multiple_trustee_operation : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION, @trustee_form : Win32cr::Security::Authorization::TRUSTEE_FORM, @trustee_type : Win32cr::Security::Authorization::TRUSTEE_TYPE, @ptstrName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct TRUSTEE_W
    property pMultipleTrustee : Win32cr::Security::Authorization::TRUSTEE_W*
    property multiple_trustee_operation : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION
    property trustee_form : Win32cr::Security::Authorization::TRUSTEE_FORM
    property trustee_type : Win32cr::Security::Authorization::TRUSTEE_TYPE
    property ptstrName : Win32cr::Foundation::PWSTR
    def initialize(@pMultipleTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, @multiple_trustee_operation : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION, @trustee_form : Win32cr::Security::Authorization::TRUSTEE_FORM, @trustee_type : Win32cr::Security::Authorization::TRUSTEE_TYPE, @ptstrName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct EXPLICIT_ACCESS_A
    property grfAccessPermissions : UInt32
    property grfAccessMode : Win32cr::Security::Authorization::ACCESS_MODE
    property grfInheritance : Win32cr::Security::ACE_FLAGS
    property trustee : Win32cr::Security::Authorization::TRUSTEE_A
    def initialize(@grfAccessPermissions : UInt32, @grfAccessMode : Win32cr::Security::Authorization::ACCESS_MODE, @grfInheritance : Win32cr::Security::ACE_FLAGS, @trustee : Win32cr::Security::Authorization::TRUSTEE_A)
    end
  end

  @[Extern]
  struct EXPLICIT_ACCESS_W
    property grfAccessPermissions : UInt32
    property grfAccessMode : Win32cr::Security::Authorization::ACCESS_MODE
    property grfInheritance : Win32cr::Security::ACE_FLAGS
    property trustee : Win32cr::Security::Authorization::TRUSTEE_W
    def initialize(@grfAccessPermissions : UInt32, @grfAccessMode : Win32cr::Security::Authorization::ACCESS_MODE, @grfInheritance : Win32cr::Security::ACE_FLAGS, @trustee : Win32cr::Security::Authorization::TRUSTEE_W)
    end
  end

  @[Extern]
  struct ACTRL_ACCESS_ENTRYA
    property trustee : Win32cr::Security::Authorization::TRUSTEE_A
    property fAccessFlags : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_ACCESS_FLAGS
    property access : UInt32
    property prov_specific_access : UInt32
    property inheritance : Win32cr::Security::ACE_FLAGS
    property lpInheritProperty : Win32cr::Foundation::PSTR
    def initialize(@trustee : Win32cr::Security::Authorization::TRUSTEE_A, @fAccessFlags : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_ACCESS_FLAGS, @access : UInt32, @prov_specific_access : UInt32, @inheritance : Win32cr::Security::ACE_FLAGS, @lpInheritProperty : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct ACTRL_ACCESS_ENTRYW
    property trustee : Win32cr::Security::Authorization::TRUSTEE_W
    property fAccessFlags : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_ACCESS_FLAGS
    property access : UInt32
    property prov_specific_access : UInt32
    property inheritance : Win32cr::Security::ACE_FLAGS
    property lpInheritProperty : Win32cr::Foundation::PWSTR
    def initialize(@trustee : Win32cr::Security::Authorization::TRUSTEE_W, @fAccessFlags : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_ACCESS_FLAGS, @access : UInt32, @prov_specific_access : UInt32, @inheritance : Win32cr::Security::ACE_FLAGS, @lpInheritProperty : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct ACTRL_ACCESS_ENTRY_LISTA
    property cEntries : UInt32
    property pAccessList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRYA*
    def initialize(@cEntries : UInt32, @pAccessList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRYA*)
    end
  end

  @[Extern]
  struct ACTRL_ACCESS_ENTRY_LISTW
    property cEntries : UInt32
    property pAccessList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRYW*
    def initialize(@cEntries : UInt32, @pAccessList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRYW*)
    end
  end

  @[Extern]
  struct ACTRL_PROPERTY_ENTRYA
    property lpProperty : Win32cr::Foundation::PSTR
    property pAccessEntryList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_LISTA*
    property fListFlags : UInt32
    def initialize(@lpProperty : Win32cr::Foundation::PSTR, @pAccessEntryList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_LISTA*, @fListFlags : UInt32)
    end
  end

  @[Extern]
  struct ACTRL_PROPERTY_ENTRYW
    property lpProperty : Win32cr::Foundation::PWSTR
    property pAccessEntryList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_LISTW*
    property fListFlags : UInt32
    def initialize(@lpProperty : Win32cr::Foundation::PWSTR, @pAccessEntryList : Win32cr::Security::Authorization::ACTRL_ACCESS_ENTRY_LISTW*, @fListFlags : UInt32)
    end
  end

  @[Extern]
  struct ACTRL_ACCESSA
    property cEntries : UInt32
    property pPropertyAccessList : Win32cr::Security::Authorization::ACTRL_PROPERTY_ENTRYA*
    def initialize(@cEntries : UInt32, @pPropertyAccessList : Win32cr::Security::Authorization::ACTRL_PROPERTY_ENTRYA*)
    end
  end

  @[Extern]
  struct ACTRL_ACCESSW
    property cEntries : UInt32
    property pPropertyAccessList : Win32cr::Security::Authorization::ACTRL_PROPERTY_ENTRYW*
    def initialize(@cEntries : UInt32, @pPropertyAccessList : Win32cr::Security::Authorization::ACTRL_PROPERTY_ENTRYW*)
    end
  end

  @[Extern]
  struct TRUSTEE_ACCESSA
    property lpProperty : Win32cr::Foundation::PSTR
    property access : UInt32
    property fAccessFlags : UInt32
    property fReturnedAccess : UInt32
    def initialize(@lpProperty : Win32cr::Foundation::PSTR, @access : UInt32, @fAccessFlags : UInt32, @fReturnedAccess : UInt32)
    end
  end

  @[Extern]
  struct TRUSTEE_ACCESSW
    property lpProperty : Win32cr::Foundation::PWSTR
    property access : UInt32
    property fAccessFlags : UInt32
    property fReturnedAccess : UInt32
    def initialize(@lpProperty : Win32cr::Foundation::PWSTR, @access : UInt32, @fAccessFlags : UInt32, @fReturnedAccess : UInt32)
    end
  end

  @[Extern]
  struct ACTRL_OVERLAPPED
    property anonymous : Anonymous_e__Union_
    property reserved2 : UInt32
    property hEvent : Win32cr::Foundation::HANDLE

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property provider : Void*
    property reserved1 : UInt32
    def initialize(@provider : Void*, @reserved1 : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @reserved2 : UInt32, @hEvent : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct ACTRL_ACCESS_INFOA
    property fAccessPermission : UInt32
    property lpAccessPermissionName : Win32cr::Foundation::PSTR
    def initialize(@fAccessPermission : UInt32, @lpAccessPermissionName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct ACTRL_ACCESS_INFOW
    property fAccessPermission : UInt32
    property lpAccessPermissionName : Win32cr::Foundation::PWSTR
    def initialize(@fAccessPermission : UInt32, @lpAccessPermissionName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct ACTRL_CONTROL_INFOA
    property lpControlId : Win32cr::Foundation::PSTR
    property lpControlName : Win32cr::Foundation::PSTR
    def initialize(@lpControlId : Win32cr::Foundation::PSTR, @lpControlName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct ACTRL_CONTROL_INFOW
    property lpControlId : Win32cr::Foundation::PWSTR
    property lpControlName : Win32cr::Foundation::PWSTR
    def initialize(@lpControlId : Win32cr::Foundation::PWSTR, @lpControlName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct FN_OBJECT_MGR_FUNCTIONS
    property placeholder : UInt32
    def initialize(@placeholder : UInt32)
    end
  end

  @[Extern]
  struct INHERITED_FROMA
    property generation_gap : Int32
    property ancestor_name : Win32cr::Foundation::PSTR
    def initialize(@generation_gap : Int32, @ancestor_name : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct INHERITED_FROMW
    property generation_gap : Int32
    property ancestor_name : Win32cr::Foundation::PWSTR
    def initialize(@generation_gap : Int32, @ancestor_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct AUDIT_OBJECT_TYPE
    property object_type : LibC::GUID
    property flags : UInt16
    property level : UInt16
    property access_mask : UInt32
    def initialize(@object_type : LibC::GUID, @flags : UInt16, @level : UInt16, @access_mask : UInt32)
    end
  end

  @[Extern]
  struct AUDIT_OBJECT_TYPES
    property count : UInt16
    property flags : UInt16
    property pObjectTypes : Win32cr::Security::Authorization::AUDIT_OBJECT_TYPE*
    def initialize(@count : UInt16, @flags : UInt16, @pObjectTypes : Win32cr::Security::Authorization::AUDIT_OBJECT_TYPE*)
    end
  end

  @[Extern]
  struct AUDIT_IP_ADDRESS
    property pIpAddress : UInt8[128]
    def initialize(@pIpAddress : UInt8[128])
    end
  end

  @[Extern]
  struct AUDIT_PARAM
    property type__ : Win32cr::Security::Authorization::AUDIT_PARAM_TYPE
    property length : UInt32
    property flags : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property data0 : LibC::UIntPtrT
    property string : Win32cr::Foundation::PWSTR
    property u : LibC::UIntPtrT
    property psid : Win32cr::Security::SID*
    property pguid : LibC::GUID*
    property logon_id_low_part : UInt32
    property pObjectTypes : Win32cr::Security::Authorization::AUDIT_OBJECT_TYPES*
    property pIpAddress : Win32cr::Security::Authorization::AUDIT_IP_ADDRESS*
    def initialize(@data0 : LibC::UIntPtrT, @string : Win32cr::Foundation::PWSTR, @u : LibC::UIntPtrT, @psid : Win32cr::Security::SID*, @pguid : LibC::GUID*, @logon_id_low_part : UInt32, @pObjectTypes : Win32cr::Security::Authorization::AUDIT_OBJECT_TYPES*, @pIpAddress : Win32cr::Security::Authorization::AUDIT_IP_ADDRESS*)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property data1 : LibC::UIntPtrT
    property logon_id_high_part : Int32
    def initialize(@data1 : LibC::UIntPtrT, @logon_id_high_part : Int32)
    end
    end

    def initialize(@type__ : Win32cr::Security::Authorization::AUDIT_PARAM_TYPE, @length : UInt32, @flags : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_)
    end
  end

  @[Extern]
  struct AUDIT_PARAMS
    property length : UInt32
    property flags : UInt32
    property count : UInt16
    property parameters : Win32cr::Security::Authorization::AUDIT_PARAM*
    def initialize(@length : UInt32, @flags : UInt32, @count : UInt16, @parameters : Win32cr::Security::Authorization::AUDIT_PARAM*)
    end
  end

  @[Extern]
  struct AUTHZ_AUDIT_EVENT_TYPE_LEGACY
    property category_id : UInt16
    property audit_id : UInt16
    property parameter_count : UInt16
    def initialize(@category_id : UInt16, @audit_id : UInt16, @parameter_count : UInt16)
    end
  end

  @[Extern(union: true)]
  struct AUTHZ_AUDIT_EVENT_TYPE_UNION
    property legacy : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_LEGACY
    def initialize(@legacy : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_LEGACY)
    end
  end

  @[Extern]
  struct AUTHZ_AUDIT_EVENT_TYPE_OLD
    property version : UInt32
    property dwFlags : UInt32
    property ref_count : Int32
    property hAudit : LibC::UIntPtrT
    property link_id : Win32cr::Foundation::LUID
    property u : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_UNION
    def initialize(@version : UInt32, @dwFlags : UInt32, @ref_count : Int32, @hAudit : LibC::UIntPtrT, @link_id : Win32cr::Foundation::LUID, @u : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_UNION)
    end
  end

  @[Extern]
  struct AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__
    property unused : Int32
    def initialize(@unused : Int32)
    end
  end

  @[Extern]
  struct AUTHZ_ACCESS_REQUEST
    property desired_access : UInt32
    property principal_self_sid : Win32cr::Foundation::PSID
    property object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*
    property object_type_list_length : UInt32
    property optional_arguments : Void*
    def initialize(@desired_access : UInt32, @principal_self_sid : Win32cr::Foundation::PSID, @object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, @object_type_list_length : UInt32, @optional_arguments : Void*)
    end
  end

  @[Extern]
  struct AUTHZ_ACCESS_REPLY
    property result_list_length : UInt32
    property granted_access_mask : UInt32*
    property sacl_evaluation_results : Win32cr::Security::Authorization::AUTHZ_GENERATE_RESULTS*
    property error : UInt32*
    def initialize(@result_list_length : UInt32, @granted_access_mask : UInt32*, @sacl_evaluation_results : Win32cr::Security::Authorization::AUTHZ_GENERATE_RESULTS*, @error : UInt32*)
    end
  end

  @[Extern]
  struct AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE
    property version : UInt64
    property pName : Win32cr::Foundation::PWSTR
    def initialize(@version : UInt64, @pName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
    property pValue : Void*
    property value_length : UInt32
    def initialize(@pValue : Void*, @value_length : UInt32)
    end
  end

  @[Extern]
  struct AUTHZ_SECURITY_ATTRIBUTE_V1
    property pName : Win32cr::Foundation::PWSTR
    property value_type : UInt16
    property reserved : UInt16
    property flags : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_FLAGS
    property value_count : UInt32
    property values : Values_e__Union_

    # Nested Type Values_e__Union_
    @[Extern(union: true)]
    struct Values_e__Union_
    property pInt64 : Int64*
    property pUint64 : UInt64*
    property ppString : Win32cr::Foundation::PWSTR*
    property pFqbn : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE*
    property pOctetString : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE*
    def initialize(@pInt64 : Int64*, @pUint64 : UInt64*, @ppString : Win32cr::Foundation::PWSTR*, @pFqbn : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE*, @pOctetString : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE*)
    end
    end

    def initialize(@pName : Win32cr::Foundation::PWSTR, @value_type : UInt16, @reserved : UInt16, @flags : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_FLAGS, @value_count : UInt32, @values : Values_e__Union_)
    end
  end

  @[Extern]
  struct AUTHZ_SECURITY_ATTRIBUTES_INFORMATION
    property version : UInt16
    property reserved : UInt16
    property attribute_count : UInt32
    property attribute : Attribute_e__Union_

    # Nested Type Attribute_e__Union_
    @[Extern(union: true)]
    struct Attribute_e__Union_
    property pAttributeV1 : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_V1*
    def initialize(@pAttributeV1 : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_V1*)
    end
    end

    def initialize(@version : UInt16, @reserved : UInt16, @attribute_count : UInt32, @attribute : Attribute_e__Union_)
    end
  end

  @[Extern]
  struct AUTHZ_RPC_INIT_INFO_CLIENT
    property version : UInt16
    property object_uuid : Win32cr::Foundation::PWSTR
    property prot_seq : Win32cr::Foundation::PWSTR
    property network_addr : Win32cr::Foundation::PWSTR
    property endpoint : Win32cr::Foundation::PWSTR
    property options : Win32cr::Foundation::PWSTR
    property server_spn : Win32cr::Foundation::PWSTR
    def initialize(@version : UInt16, @object_uuid : Win32cr::Foundation::PWSTR, @prot_seq : Win32cr::Foundation::PWSTR, @network_addr : Win32cr::Foundation::PWSTR, @endpoint : Win32cr::Foundation::PWSTR, @options : Win32cr::Foundation::PWSTR, @server_spn : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct AUTHZ_INIT_INFO
    property version : UInt16
    property szResourceManagerName : Win32cr::Foundation::PWSTR
    property pfnDynamicAccessCheck : Win32cr::Security::Authorization::PFN_AUTHZ_DYNAMIC_ACCESS_CHECK
    property pfnComputeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS
    property pfnFreeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_FREE_DYNAMIC_GROUPS
    property pfnGetCentralAccessPolicy : Win32cr::Security::Authorization::PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY
    property pfnFreeCentralAccessPolicy : Win32cr::Security::Authorization::PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY
    def initialize(@version : UInt16, @szResourceManagerName : Win32cr::Foundation::PWSTR, @pfnDynamicAccessCheck : Win32cr::Security::Authorization::PFN_AUTHZ_DYNAMIC_ACCESS_CHECK, @pfnComputeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS, @pfnFreeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_FREE_DYNAMIC_GROUPS, @pfnGetCentralAccessPolicy : Win32cr::Security::Authorization::PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY, @pfnFreeCentralAccessPolicy : Win32cr::Security::Authorization::PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY)
    end
  end

  @[Extern]
  struct AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET
    property szObjectTypeName : Win32cr::Foundation::PWSTR
    property dwOffset : UInt32
    def initialize(@szObjectTypeName : Win32cr::Foundation::PWSTR, @dwOffset : UInt32)
    end
  end

  @[Extern]
  struct AUTHZ_SOURCE_SCHEMA_REGISTRATION
    property dwFlags : UInt32
    property szEventSourceName : Win32cr::Foundation::PWSTR
    property szEventMessageFile : Win32cr::Foundation::PWSTR
    property szEventSourceXmlSchemaFile : Win32cr::Foundation::PWSTR
    property szEventAccessStringsFile : Win32cr::Foundation::PWSTR
    property szExecutableImagePath : Win32cr::Foundation::PWSTR
    property anonymous : Anonymous_e__Union_
    property dwObjectTypeNameCount : UInt32
    property object_type_names : Win32cr::Security::Authorization::AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pReserved : Void*
    property pProviderGuid : LibC::GUID*
    def initialize(@pReserved : Void*, @pProviderGuid : LibC::GUID*)
    end
    end

    def initialize(@dwFlags : UInt32, @szEventSourceName : Win32cr::Foundation::PWSTR, @szEventMessageFile : Win32cr::Foundation::PWSTR, @szEventSourceXmlSchemaFile : Win32cr::Foundation::PWSTR, @szEventAccessStringsFile : Win32cr::Foundation::PWSTR, @szExecutableImagePath : Win32cr::Foundation::PWSTR, @anonymous : Anonymous_e__Union_, @dwObjectTypeNameCount : UInt32, @object_type_names : Win32cr::Security::Authorization::AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET*)
    end
  end

  @[Extern]
  record IAzAuthorizationStoreVtbl,
    query_interface : Proc(IAzAuthorizationStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzAuthorizationStore*, UInt32),
    release : Proc(IAzAuthorizationStore*, UInt32),
    get_type_info_count : Proc(IAzAuthorizationStore*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzAuthorizationStore*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzAuthorizationStore*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzAuthorizationStore*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DomainTimeout : Proc(IAzAuthorizationStore*, Int32*, Win32cr::Foundation::HRESULT),
    put_DomainTimeout : Proc(IAzAuthorizationStore*, Int32, Win32cr::Foundation::HRESULT),
    get_ScriptEngineTimeout : Proc(IAzAuthorizationStore*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScriptEngineTimeout : Proc(IAzAuthorizationStore*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxScriptEngines : Proc(IAzAuthorizationStore*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxScriptEngines : Proc(IAzAuthorizationStore*, Int32, Win32cr::Foundation::HRESULT),
    get_GenerateAudits : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_GenerateAudits : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzAuthorizationStore*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzAuthorizationStore*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzAuthorizationStore*, Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzAuthorizationStore*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IAzAuthorizationStore*, Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    update_cache : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Applications : Proc(IAzAuthorizationStore*, Void**, Win32cr::Foundation::HRESULT),
    open_application : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzAuthorizationStore*, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzAuthorizationStore*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsers : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_TargetMachine : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ApplyStoreSacl : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ApplyStoreSacl : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsersName : Proc(IAzAuthorizationStore*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user_name : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user_name : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    close_application : Proc(IAzAuthorizationStore*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzAuthorizationStore, lpVtbl : IAzAuthorizationStoreVtbl* do
    GUID = LibC::GUID.new(0xedbd9ca9_u32, 0x9b82_u16, 0x4f6a_u16, StaticArray[0x9e_u8, 0x8b_u8, 0x98_u8, 0x30_u8, 0x1e_u8, 0x45_u8, 0xf_u8, 0x14_u8])
    def query_interface(this : IAzAuthorizationStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzAuthorizationStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzAuthorizationStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzAuthorizationStore*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzAuthorizationStore*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzAuthorizationStore*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzAuthorizationStore*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Description(this : IAzAuthorizationStore*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzAuthorizationStore*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzAuthorizationStore*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzAuthorizationStore*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_DomainTimeout(this : IAzAuthorizationStore*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainTimeout.call(this, plProp)
    end
    def put_DomainTimeout(this : IAzAuthorizationStore*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DomainTimeout.call(this, lProp)
    end
    def get_ScriptEngineTimeout(this : IAzAuthorizationStore*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScriptEngineTimeout.call(this, plProp)
    end
    def put_ScriptEngineTimeout(this : IAzAuthorizationStore*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScriptEngineTimeout.call(this, lProp)
    end
    def get_MaxScriptEngines(this : IAzAuthorizationStore*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxScriptEngines.call(this, plProp)
    end
    def put_MaxScriptEngines(this : IAzAuthorizationStore*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxScriptEngines.call(this, lProp)
    end
    def get_GenerateAudits(this : IAzAuthorizationStore*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GenerateAudits.call(this, pbProp)
    end
    def put_GenerateAudits(this : IAzAuthorizationStore*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GenerateAudits.call(this, bProp)
    end
    def get_Writable(this : IAzAuthorizationStore*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzAuthorizationStore*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzAuthorizationStore*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzAuthorizationStore*, lPropId : Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzAuthorizationStore*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzAuthorizationStore*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzAuthorizationStore*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzAuthorizationStore*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzAuthorizationStore*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzAuthorizationStore*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzAuthorizationStore*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def initialize__(this : IAzAuthorizationStore*, lFlags : Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, bstrPolicyURL : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lFlags, bstrPolicyURL, varReserved)
    end
    def update_cache(this : IAzAuthorizationStore*, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_cache.call(this, varReserved)
    end
    def delete(this : IAzAuthorizationStore*, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, varReserved)
    end
    def get_Applications(this : IAzAuthorizationStore*, ppAppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Applications.call(this, ppAppCollection)
    end
    def open_application(this : IAzAuthorizationStore*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def create_application(this : IAzAuthorizationStore*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def delete_application(this : IAzAuthorizationStore*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application.call(this, bstrApplicationName, varReserved)
    end
    def get_ApplicationGroups(this : IAzAuthorizationStore*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def create_application_group(this : IAzAuthorizationStore*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def open_application_group(this : IAzAuthorizationStore*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzAuthorizationStore*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def submit(this : IAzAuthorizationStore*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def get_DelegatedPolicyUsers(this : IAzAuthorizationStore*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsers.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user(this : IAzAuthorizationStore*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user(this : IAzAuthorizationStore*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def get_TargetMachine(this : IAzAuthorizationStore*, pbstrTargetMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetMachine.call(this, pbstrTargetMachine)
    end
    def get_ApplyStoreSacl(this : IAzAuthorizationStore*, pbApplyStoreSacl : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplyStoreSacl.call(this, pbApplyStoreSacl)
    end
    def put_ApplyStoreSacl(this : IAzAuthorizationStore*, bApplyStoreSacl : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplyStoreSacl.call(this, bApplyStoreSacl)
    end
    def get_PolicyAdministratorsName(this : IAzAuthorizationStore*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzAuthorizationStore*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzAuthorizationStore*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzAuthorizationStore*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzAuthorizationStore*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzAuthorizationStore*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def get_DelegatedPolicyUsersName(this : IAzAuthorizationStore*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsersName.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user_name(this : IAzAuthorizationStore*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user_name(this : IAzAuthorizationStore*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def close_application(this : IAzAuthorizationStore*, bstrApplicationName : Win32cr::Foundation::BSTR, lFlag : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_application.call(this, bstrApplicationName, lFlag)
    end

  end

  @[Extern]
  record IAzAuthorizationStore2Vtbl,
    query_interface : Proc(IAzAuthorizationStore2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzAuthorizationStore2*, UInt32),
    release : Proc(IAzAuthorizationStore2*, UInt32),
    get_type_info_count : Proc(IAzAuthorizationStore2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzAuthorizationStore2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzAuthorizationStore2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzAuthorizationStore2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DomainTimeout : Proc(IAzAuthorizationStore2*, Int32*, Win32cr::Foundation::HRESULT),
    put_DomainTimeout : Proc(IAzAuthorizationStore2*, Int32, Win32cr::Foundation::HRESULT),
    get_ScriptEngineTimeout : Proc(IAzAuthorizationStore2*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScriptEngineTimeout : Proc(IAzAuthorizationStore2*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxScriptEngines : Proc(IAzAuthorizationStore2*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxScriptEngines : Proc(IAzAuthorizationStore2*, Int32, Win32cr::Foundation::HRESULT),
    get_GenerateAudits : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_GenerateAudits : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzAuthorizationStore2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzAuthorizationStore2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzAuthorizationStore2*, Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzAuthorizationStore2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IAzAuthorizationStore2*, Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    update_cache : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Applications : Proc(IAzAuthorizationStore2*, Void**, Win32cr::Foundation::HRESULT),
    open_application : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzAuthorizationStore2*, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzAuthorizationStore2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsers : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_TargetMachine : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ApplyStoreSacl : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ApplyStoreSacl : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsersName : Proc(IAzAuthorizationStore2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user_name : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user_name : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    close_application : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    open_application2 : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application2 : Proc(IAzAuthorizationStore2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzAuthorizationStore2, lpVtbl : IAzAuthorizationStore2Vtbl* do
    GUID = LibC::GUID.new(0xb11e5584_u32, 0xd577_u16, 0x4273_u16, StaticArray[0xb6_u8, 0xc5_u8, 0x9_u8, 0x73_u8, 0xe0_u8, 0xf8_u8, 0xe8_u8, 0xd_u8])
    def query_interface(this : IAzAuthorizationStore2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzAuthorizationStore2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzAuthorizationStore2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzAuthorizationStore2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzAuthorizationStore2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzAuthorizationStore2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzAuthorizationStore2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Description(this : IAzAuthorizationStore2*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzAuthorizationStore2*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzAuthorizationStore2*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzAuthorizationStore2*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_DomainTimeout(this : IAzAuthorizationStore2*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainTimeout.call(this, plProp)
    end
    def put_DomainTimeout(this : IAzAuthorizationStore2*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DomainTimeout.call(this, lProp)
    end
    def get_ScriptEngineTimeout(this : IAzAuthorizationStore2*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScriptEngineTimeout.call(this, plProp)
    end
    def put_ScriptEngineTimeout(this : IAzAuthorizationStore2*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScriptEngineTimeout.call(this, lProp)
    end
    def get_MaxScriptEngines(this : IAzAuthorizationStore2*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxScriptEngines.call(this, plProp)
    end
    def put_MaxScriptEngines(this : IAzAuthorizationStore2*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxScriptEngines.call(this, lProp)
    end
    def get_GenerateAudits(this : IAzAuthorizationStore2*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GenerateAudits.call(this, pbProp)
    end
    def put_GenerateAudits(this : IAzAuthorizationStore2*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GenerateAudits.call(this, bProp)
    end
    def get_Writable(this : IAzAuthorizationStore2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzAuthorizationStore2*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzAuthorizationStore2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzAuthorizationStore2*, lPropId : Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzAuthorizationStore2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzAuthorizationStore2*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzAuthorizationStore2*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzAuthorizationStore2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzAuthorizationStore2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzAuthorizationStore2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzAuthorizationStore2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def initialize__(this : IAzAuthorizationStore2*, lFlags : Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, bstrPolicyURL : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lFlags, bstrPolicyURL, varReserved)
    end
    def update_cache(this : IAzAuthorizationStore2*, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_cache.call(this, varReserved)
    end
    def delete(this : IAzAuthorizationStore2*, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, varReserved)
    end
    def get_Applications(this : IAzAuthorizationStore2*, ppAppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Applications.call(this, ppAppCollection)
    end
    def open_application(this : IAzAuthorizationStore2*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def create_application(this : IAzAuthorizationStore2*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def delete_application(this : IAzAuthorizationStore2*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application.call(this, bstrApplicationName, varReserved)
    end
    def get_ApplicationGroups(this : IAzAuthorizationStore2*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def create_application_group(this : IAzAuthorizationStore2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def open_application_group(this : IAzAuthorizationStore2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzAuthorizationStore2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def submit(this : IAzAuthorizationStore2*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def get_DelegatedPolicyUsers(this : IAzAuthorizationStore2*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsers.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user(this : IAzAuthorizationStore2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user(this : IAzAuthorizationStore2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def get_TargetMachine(this : IAzAuthorizationStore2*, pbstrTargetMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetMachine.call(this, pbstrTargetMachine)
    end
    def get_ApplyStoreSacl(this : IAzAuthorizationStore2*, pbApplyStoreSacl : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplyStoreSacl.call(this, pbApplyStoreSacl)
    end
    def put_ApplyStoreSacl(this : IAzAuthorizationStore2*, bApplyStoreSacl : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplyStoreSacl.call(this, bApplyStoreSacl)
    end
    def get_PolicyAdministratorsName(this : IAzAuthorizationStore2*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzAuthorizationStore2*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzAuthorizationStore2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzAuthorizationStore2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzAuthorizationStore2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzAuthorizationStore2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def get_DelegatedPolicyUsersName(this : IAzAuthorizationStore2*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsersName.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user_name(this : IAzAuthorizationStore2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user_name(this : IAzAuthorizationStore2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def close_application(this : IAzAuthorizationStore2*, bstrApplicationName : Win32cr::Foundation::BSTR, lFlag : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_application.call(this, bstrApplicationName, lFlag)
    end
    def open_application2(this : IAzAuthorizationStore2*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application2.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def create_application2(this : IAzAuthorizationStore2*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application2.call(this, bstrApplicationName, varReserved, ppApplication)
    end

  end

  @[Extern]
  record IAzAuthorizationStore3Vtbl,
    query_interface : Proc(IAzAuthorizationStore3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzAuthorizationStore3*, UInt32),
    release : Proc(IAzAuthorizationStore3*, UInt32),
    get_type_info_count : Proc(IAzAuthorizationStore3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzAuthorizationStore3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzAuthorizationStore3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzAuthorizationStore3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DomainTimeout : Proc(IAzAuthorizationStore3*, Int32*, Win32cr::Foundation::HRESULT),
    put_DomainTimeout : Proc(IAzAuthorizationStore3*, Int32, Win32cr::Foundation::HRESULT),
    get_ScriptEngineTimeout : Proc(IAzAuthorizationStore3*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScriptEngineTimeout : Proc(IAzAuthorizationStore3*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxScriptEngines : Proc(IAzAuthorizationStore3*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxScriptEngines : Proc(IAzAuthorizationStore3*, Int32, Win32cr::Foundation::HRESULT),
    get_GenerateAudits : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_GenerateAudits : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzAuthorizationStore3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzAuthorizationStore3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzAuthorizationStore3*, Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzAuthorizationStore3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IAzAuthorizationStore3*, Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    update_cache : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Applications : Proc(IAzAuthorizationStore3*, Void**, Win32cr::Foundation::HRESULT),
    open_application : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzAuthorizationStore3*, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzAuthorizationStore3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsers : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_TargetMachine : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ApplyStoreSacl : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ApplyStoreSacl : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsersName : Proc(IAzAuthorizationStore3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user_name : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user_name : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    close_application : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    open_application2 : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application2 : Proc(IAzAuthorizationStore3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    is_update_needed : Proc(IAzAuthorizationStore3*, Int16*, Win32cr::Foundation::HRESULT),
    bizrule_group_supported : Proc(IAzAuthorizationStore3*, Int16*, Win32cr::Foundation::HRESULT),
    upgrade_stores_functional_level : Proc(IAzAuthorizationStore3*, Int32, Win32cr::Foundation::HRESULT),
    is_functional_level_upgrade_supported : Proc(IAzAuthorizationStore3*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    get_schema_version : Proc(IAzAuthorizationStore3*, Int32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzAuthorizationStore3, lpVtbl : IAzAuthorizationStore3Vtbl* do
    GUID = LibC::GUID.new(0xabc08425_u32, 0xc86_u16, 0x4fa0_u16, StaticArray[0x9b_u8, 0xe3_u8, 0x71_u8, 0x89_u8, 0x95_u8, 0x6c_u8, 0x92_u8, 0x6e_u8])
    def query_interface(this : IAzAuthorizationStore3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzAuthorizationStore3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzAuthorizationStore3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzAuthorizationStore3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzAuthorizationStore3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzAuthorizationStore3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzAuthorizationStore3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Description(this : IAzAuthorizationStore3*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzAuthorizationStore3*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzAuthorizationStore3*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzAuthorizationStore3*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_DomainTimeout(this : IAzAuthorizationStore3*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainTimeout.call(this, plProp)
    end
    def put_DomainTimeout(this : IAzAuthorizationStore3*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DomainTimeout.call(this, lProp)
    end
    def get_ScriptEngineTimeout(this : IAzAuthorizationStore3*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScriptEngineTimeout.call(this, plProp)
    end
    def put_ScriptEngineTimeout(this : IAzAuthorizationStore3*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScriptEngineTimeout.call(this, lProp)
    end
    def get_MaxScriptEngines(this : IAzAuthorizationStore3*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxScriptEngines.call(this, plProp)
    end
    def put_MaxScriptEngines(this : IAzAuthorizationStore3*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxScriptEngines.call(this, lProp)
    end
    def get_GenerateAudits(this : IAzAuthorizationStore3*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GenerateAudits.call(this, pbProp)
    end
    def put_GenerateAudits(this : IAzAuthorizationStore3*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GenerateAudits.call(this, bProp)
    end
    def get_Writable(this : IAzAuthorizationStore3*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzAuthorizationStore3*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzAuthorizationStore3*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzAuthorizationStore3*, lPropId : Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzAuthorizationStore3*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzAuthorizationStore3*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzAuthorizationStore3*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzAuthorizationStore3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzAuthorizationStore3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzAuthorizationStore3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzAuthorizationStore3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def initialize__(this : IAzAuthorizationStore3*, lFlags : Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, bstrPolicyURL : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lFlags, bstrPolicyURL, varReserved)
    end
    def update_cache(this : IAzAuthorizationStore3*, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_cache.call(this, varReserved)
    end
    def delete(this : IAzAuthorizationStore3*, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, varReserved)
    end
    def get_Applications(this : IAzAuthorizationStore3*, ppAppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Applications.call(this, ppAppCollection)
    end
    def open_application(this : IAzAuthorizationStore3*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def create_application(this : IAzAuthorizationStore3*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def delete_application(this : IAzAuthorizationStore3*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application.call(this, bstrApplicationName, varReserved)
    end
    def get_ApplicationGroups(this : IAzAuthorizationStore3*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def create_application_group(this : IAzAuthorizationStore3*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def open_application_group(this : IAzAuthorizationStore3*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzAuthorizationStore3*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def submit(this : IAzAuthorizationStore3*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def get_DelegatedPolicyUsers(this : IAzAuthorizationStore3*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsers.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user(this : IAzAuthorizationStore3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user(this : IAzAuthorizationStore3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def get_TargetMachine(this : IAzAuthorizationStore3*, pbstrTargetMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetMachine.call(this, pbstrTargetMachine)
    end
    def get_ApplyStoreSacl(this : IAzAuthorizationStore3*, pbApplyStoreSacl : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplyStoreSacl.call(this, pbApplyStoreSacl)
    end
    def put_ApplyStoreSacl(this : IAzAuthorizationStore3*, bApplyStoreSacl : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplyStoreSacl.call(this, bApplyStoreSacl)
    end
    def get_PolicyAdministratorsName(this : IAzAuthorizationStore3*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzAuthorizationStore3*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzAuthorizationStore3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzAuthorizationStore3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzAuthorizationStore3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzAuthorizationStore3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def get_DelegatedPolicyUsersName(this : IAzAuthorizationStore3*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsersName.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user_name(this : IAzAuthorizationStore3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user_name(this : IAzAuthorizationStore3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def close_application(this : IAzAuthorizationStore3*, bstrApplicationName : Win32cr::Foundation::BSTR, lFlag : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_application.call(this, bstrApplicationName, lFlag)
    end
    def open_application2(this : IAzAuthorizationStore3*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application2.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def create_application2(this : IAzAuthorizationStore3*, bstrApplicationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application2.call(this, bstrApplicationName, varReserved, ppApplication)
    end
    def is_update_needed(this : IAzAuthorizationStore3*, pbIsUpdateNeeded : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_update_needed.call(this, pbIsUpdateNeeded)
    end
    def bizrule_group_supported(this : IAzAuthorizationStore3*, pbSupported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bizrule_group_supported.call(this, pbSupported)
    end
    def upgrade_stores_functional_level(this : IAzAuthorizationStore3*, lFunctionalLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.upgrade_stores_functional_level.call(this, lFunctionalLevel)
    end
    def is_functional_level_upgrade_supported(this : IAzAuthorizationStore3*, lFunctionalLevel : Int32, pbSupported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_functional_level_upgrade_supported.call(this, lFunctionalLevel, pbSupported)
    end
    def get_schema_version(this : IAzAuthorizationStore3*, plMajorVersion : Int32*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_schema_version.call(this, plMajorVersion, plMinorVersion)
    end

  end

  @[Extern]
  record IAzApplicationVtbl,
    query_interface : Proc(IAzApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzApplication*, UInt32),
    release : Proc(IAzApplication*, UInt32),
    get_type_info_count : Proc(IAzApplication*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzApplication*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzApplication*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzApplication*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AuthzInterfaceClsid : Proc(IAzApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_AuthzInterfaceClsid : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IAzApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Version : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_GenerateAudits : Proc(IAzApplication*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_GenerateAudits : Proc(IAzApplication*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ApplyStoreSacl : Proc(IAzApplication*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ApplyStoreSacl : Proc(IAzApplication*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzApplication*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzApplication*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzApplication*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzApplication*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzApplication*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Scopes : Proc(IAzApplication*, Void**, Win32cr::Foundation::HRESULT),
    open_scope : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_scope : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_scope : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzApplication*, Void**, Win32cr::Foundation::HRESULT),
    open_operation : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_operation : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzApplication*, Void**, Win32cr::Foundation::HRESULT),
    open_task : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_task : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzApplication*, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Roles : Proc(IAzApplication*, Void**, Win32cr::Foundation::HRESULT),
    open_role : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_role : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_role : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_token : Proc(IAzApplication*, UInt64, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzApplication*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzApplication*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzApplication*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsers : Proc(IAzApplication*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_string_sid : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzApplication*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzApplication*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsersName : Proc(IAzApplication*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user_name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user_name : Proc(IAzApplication*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzApplication, lpVtbl : IAzApplicationVtbl* do
    GUID = LibC::GUID.new(0x987bc7c7_u32, 0xb813_u16, 0x4d27_u16, StaticArray[0xbe_u8, 0xde_u8, 0x6b_u8, 0xa5_u8, 0xae_u8, 0x86_u8, 0x7e_u8, 0x95_u8])
    def query_interface(this : IAzApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzApplication*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzApplication*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzApplication*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzApplication*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzApplication*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzApplication*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzApplication*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzApplication*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzApplication*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzApplication*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_AuthzInterfaceClsid(this : IAzApplication*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthzInterfaceClsid.call(this, pbstrProp)
    end
    def put_AuthzInterfaceClsid(this : IAzApplication*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthzInterfaceClsid.call(this, bstrProp)
    end
    def get_Version(this : IAzApplication*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, pbstrProp)
    end
    def put_Version(this : IAzApplication*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Version.call(this, bstrProp)
    end
    def get_GenerateAudits(this : IAzApplication*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GenerateAudits.call(this, pbProp)
    end
    def put_GenerateAudits(this : IAzApplication*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GenerateAudits.call(this, bProp)
    end
    def get_ApplyStoreSacl(this : IAzApplication*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplyStoreSacl.call(this, pbProp)
    end
    def put_ApplyStoreSacl(this : IAzApplication*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplyStoreSacl.call(this, bProp)
    end
    def get_Writable(this : IAzApplication*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzApplication*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzApplication*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzApplication*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzApplication*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzApplication*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzApplication*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzApplication*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzApplication*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def get_Scopes(this : IAzApplication*, ppScopeCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scopes.call(this, ppScopeCollection)
    end
    def open_scope(this : IAzApplication*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppScope : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope.call(this, bstrScopeName, varReserved, ppScope)
    end
    def create_scope(this : IAzApplication*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppScope : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scope.call(this, bstrScopeName, varReserved, ppScope)
    end
    def delete_scope(this : IAzApplication*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_scope.call(this, bstrScopeName, varReserved)
    end
    def get_Operations(this : IAzApplication*, ppOperationCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, ppOperationCollection)
    end
    def open_operation(this : IAzApplication*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_operation.call(this, bstrOperationName, varReserved, ppOperation)
    end
    def create_operation(this : IAzApplication*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_operation.call(this, bstrOperationName, varReserved, ppOperation)
    end
    def delete_operation(this : IAzApplication*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrOperationName, varReserved)
    end
    def get_Tasks(this : IAzApplication*, ppTaskCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, ppTaskCollection)
    end
    def open_task(this : IAzApplication*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def create_task(this : IAzApplication*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def delete_task(this : IAzApplication*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTaskName, varReserved)
    end
    def get_ApplicationGroups(this : IAzApplication*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def open_application_group(this : IAzApplication*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def create_application_group(this : IAzApplication*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzApplication*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def get_Roles(this : IAzApplication*, ppRoleCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Roles.call(this, ppRoleCollection)
    end
    def open_role(this : IAzApplication*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def create_role(this : IAzApplication*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def delete_role(this : IAzApplication*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role.call(this, bstrRoleName, varReserved)
    end
    def initialize_client_context_from_token(this : IAzApplication*, ullTokenHandle : UInt64, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_token.call(this, ullTokenHandle, varReserved, ppClientContext)
    end
    def add_property_item(this : IAzApplication*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzApplication*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzApplication*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def initialize_client_context_from_name(this : IAzApplication*, client_name : Win32cr::Foundation::BSTR, domain_name : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_name.call(this, client_name, domain_name, varReserved, ppClientContext)
    end
    def get_DelegatedPolicyUsers(this : IAzApplication*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsers.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user(this : IAzApplication*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user(this : IAzApplication*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def initialize_client_context_from_string_sid(this : IAzApplication*, sid_string : Win32cr::Foundation::BSTR, lOptions : Int32, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_string_sid.call(this, sid_string, lOptions, varReserved, ppClientContext)
    end
    def get_PolicyAdministratorsName(this : IAzApplication*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzApplication*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzApplication*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzApplication*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzApplication*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzApplication*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def get_DelegatedPolicyUsersName(this : IAzApplication*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsersName.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user_name(this : IAzApplication*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user_name(this : IAzApplication*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end

  end

  @[Extern]
  record IAzApplication2Vtbl,
    query_interface : Proc(IAzApplication2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzApplication2*, UInt32),
    release : Proc(IAzApplication2*, UInt32),
    get_type_info_count : Proc(IAzApplication2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzApplication2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzApplication2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzApplication2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzApplication2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzApplication2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AuthzInterfaceClsid : Proc(IAzApplication2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_AuthzInterfaceClsid : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IAzApplication2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Version : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_GenerateAudits : Proc(IAzApplication2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_GenerateAudits : Proc(IAzApplication2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ApplyStoreSacl : Proc(IAzApplication2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ApplyStoreSacl : Proc(IAzApplication2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzApplication2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzApplication2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzApplication2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzApplication2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzApplication2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Scopes : Proc(IAzApplication2*, Void**, Win32cr::Foundation::HRESULT),
    open_scope : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_scope : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_scope : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzApplication2*, Void**, Win32cr::Foundation::HRESULT),
    open_operation : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_operation : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzApplication2*, Void**, Win32cr::Foundation::HRESULT),
    open_task : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_task : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzApplication2*, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Roles : Proc(IAzApplication2*, Void**, Win32cr::Foundation::HRESULT),
    open_role : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_role : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_role : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_token : Proc(IAzApplication2*, UInt64, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzApplication2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzApplication2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzApplication2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsers : Proc(IAzApplication2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_string_sid : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzApplication2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzApplication2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsersName : Proc(IAzApplication2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user_name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user_name : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_token2 : Proc(IAzApplication2*, UInt32, UInt32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    initialize_client_context2 : Proc(IAzApplication2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzApplication2, lpVtbl : IAzApplication2Vtbl* do
    GUID = LibC::GUID.new(0x86a68af_u32, 0xa249_u16, 0x437c_u16, StaticArray[0xb1_u8, 0x8d_u8, 0xd4_u8, 0xd8_u8, 0x6d_u8, 0x6a_u8, 0x96_u8, 0x60_u8])
    def query_interface(this : IAzApplication2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzApplication2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzApplication2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzApplication2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzApplication2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzApplication2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzApplication2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzApplication2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzApplication2*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzApplication2*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzApplication2*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzApplication2*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzApplication2*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_AuthzInterfaceClsid(this : IAzApplication2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthzInterfaceClsid.call(this, pbstrProp)
    end
    def put_AuthzInterfaceClsid(this : IAzApplication2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthzInterfaceClsid.call(this, bstrProp)
    end
    def get_Version(this : IAzApplication2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, pbstrProp)
    end
    def put_Version(this : IAzApplication2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Version.call(this, bstrProp)
    end
    def get_GenerateAudits(this : IAzApplication2*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GenerateAudits.call(this, pbProp)
    end
    def put_GenerateAudits(this : IAzApplication2*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GenerateAudits.call(this, bProp)
    end
    def get_ApplyStoreSacl(this : IAzApplication2*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplyStoreSacl.call(this, pbProp)
    end
    def put_ApplyStoreSacl(this : IAzApplication2*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplyStoreSacl.call(this, bProp)
    end
    def get_Writable(this : IAzApplication2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzApplication2*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzApplication2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzApplication2*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzApplication2*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzApplication2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzApplication2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzApplication2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzApplication2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def get_Scopes(this : IAzApplication2*, ppScopeCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scopes.call(this, ppScopeCollection)
    end
    def open_scope(this : IAzApplication2*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppScope : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope.call(this, bstrScopeName, varReserved, ppScope)
    end
    def create_scope(this : IAzApplication2*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppScope : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scope.call(this, bstrScopeName, varReserved, ppScope)
    end
    def delete_scope(this : IAzApplication2*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_scope.call(this, bstrScopeName, varReserved)
    end
    def get_Operations(this : IAzApplication2*, ppOperationCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, ppOperationCollection)
    end
    def open_operation(this : IAzApplication2*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_operation.call(this, bstrOperationName, varReserved, ppOperation)
    end
    def create_operation(this : IAzApplication2*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_operation.call(this, bstrOperationName, varReserved, ppOperation)
    end
    def delete_operation(this : IAzApplication2*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrOperationName, varReserved)
    end
    def get_Tasks(this : IAzApplication2*, ppTaskCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, ppTaskCollection)
    end
    def open_task(this : IAzApplication2*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def create_task(this : IAzApplication2*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def delete_task(this : IAzApplication2*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTaskName, varReserved)
    end
    def get_ApplicationGroups(this : IAzApplication2*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def open_application_group(this : IAzApplication2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def create_application_group(this : IAzApplication2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzApplication2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def get_Roles(this : IAzApplication2*, ppRoleCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Roles.call(this, ppRoleCollection)
    end
    def open_role(this : IAzApplication2*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def create_role(this : IAzApplication2*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def delete_role(this : IAzApplication2*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role.call(this, bstrRoleName, varReserved)
    end
    def initialize_client_context_from_token(this : IAzApplication2*, ullTokenHandle : UInt64, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_token.call(this, ullTokenHandle, varReserved, ppClientContext)
    end
    def add_property_item(this : IAzApplication2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzApplication2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzApplication2*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def initialize_client_context_from_name(this : IAzApplication2*, client_name : Win32cr::Foundation::BSTR, domain_name : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_name.call(this, client_name, domain_name, varReserved, ppClientContext)
    end
    def get_DelegatedPolicyUsers(this : IAzApplication2*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsers.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user(this : IAzApplication2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user(this : IAzApplication2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def initialize_client_context_from_string_sid(this : IAzApplication2*, sid_string : Win32cr::Foundation::BSTR, lOptions : Int32, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_string_sid.call(this, sid_string, lOptions, varReserved, ppClientContext)
    end
    def get_PolicyAdministratorsName(this : IAzApplication2*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzApplication2*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzApplication2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzApplication2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzApplication2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzApplication2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def get_DelegatedPolicyUsersName(this : IAzApplication2*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsersName.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user_name(this : IAzApplication2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user_name(this : IAzApplication2*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def initialize_client_context_from_token2(this : IAzApplication2*, ulTokenHandleLowPart : UInt32, ulTokenHandleHighPart : UInt32, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_token2.call(this, ulTokenHandleLowPart, ulTokenHandleHighPart, varReserved, ppClientContext)
    end
    def initialize_client_context2(this : IAzApplication2*, identifying_string : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context2.call(this, identifying_string, varReserved, ppClientContext)
    end

  end

  @[Extern]
  record IAzApplicationsVtbl,
    query_interface : Proc(IAzApplications*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzApplications*, UInt32),
    release : Proc(IAzApplications*, UInt32),
    get_type_info_count : Proc(IAzApplications*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzApplications*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzApplications*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzApplications*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzApplications*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzApplications*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzApplications*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzApplications, lpVtbl : IAzApplicationsVtbl* do
    GUID = LibC::GUID.new(0x929b11a9_u32, 0x95c5_u16, 0x4a84_u16, StaticArray[0xa2_u8, 0x9a_u8, 0x20_u8, 0xad_u8, 0x42_u8, 0xc2_u8, 0xf1_u8, 0x6c_u8])
    def query_interface(this : IAzApplications*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzApplications*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzApplications*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzApplications*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzApplications*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzApplications*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzApplications*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzApplications*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzApplications*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzApplications*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzOperationVtbl,
    query_interface : Proc(IAzOperation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzOperation*, UInt32),
    release : Proc(IAzOperation*, UInt32),
    get_type_info_count : Proc(IAzOperation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzOperation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzOperation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzOperation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzOperation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzOperation*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzOperation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzOperation*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzOperation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzOperation*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OperationID : Proc(IAzOperation*, Int32*, Win32cr::Foundation::HRESULT),
    put_OperationID : Proc(IAzOperation*, Int32, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzOperation*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzOperation*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzOperation*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzOperation*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzOperation, lpVtbl : IAzOperationVtbl* do
    GUID = LibC::GUID.new(0x5e56b24f_u32, 0xea01_u16, 0x4d61_u16, StaticArray[0xbe_u8, 0x44_u8, 0xc4_u8, 0x9b_u8, 0x5e_u8, 0x4e_u8, 0xaf_u8, 0x74_u8])
    def query_interface(this : IAzOperation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzOperation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzOperation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzOperation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzOperation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzOperation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzOperation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzOperation*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzOperation*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzOperation*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzOperation*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzOperation*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzOperation*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_OperationID(this : IAzOperation*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OperationID.call(this, plProp)
    end
    def put_OperationID(this : IAzOperation*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OperationID.call(this, lProp)
    end
    def get_Writable(this : IAzOperation*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzOperation*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzOperation*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzOperation*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end

  end

  @[Extern]
  record IAzOperationsVtbl,
    query_interface : Proc(IAzOperations*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzOperations*, UInt32),
    release : Proc(IAzOperations*, UInt32),
    get_type_info_count : Proc(IAzOperations*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzOperations*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzOperations*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzOperations*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzOperations*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzOperations*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzOperations*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzOperations, lpVtbl : IAzOperationsVtbl* do
    GUID = LibC::GUID.new(0x90ef9c07_u32, 0x9706_u16, 0x49d9_u16, StaticArray[0xaf_u8, 0x80_u8, 0x4_u8, 0x38_u8, 0xa5_u8, 0xf3_u8, 0xec_u8, 0x35_u8])
    def query_interface(this : IAzOperations*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzOperations*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzOperations*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzOperations*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzOperations*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzOperations*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzOperations*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzOperations*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzOperations*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzOperations*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzTaskVtbl,
    query_interface : Proc(IAzTask*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzTask*, UInt32),
    release : Proc(IAzTask*, UInt32),
    get_type_info_count : Proc(IAzTask*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzTask*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzTask*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzTask*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRule : Proc(IAzTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRule : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleLanguage : Proc(IAzTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleLanguage : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleImportedPath : Proc(IAzTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleImportedPath : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsRoleDefinition : Proc(IAzTask*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_IsRoleDefinition : Proc(IAzTask*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzTask*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzTask*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_operation : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_task : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzTask*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzTask*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzTask*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzTask*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzTask*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzTask*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzTask*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzTask, lpVtbl : IAzTaskVtbl* do
    GUID = LibC::GUID.new(0xcb94e592_u32, 0x2e0e_u16, 0x4a6c_u16, StaticArray[0xa3_u8, 0x36_u8, 0xb8_u8, 0x9a_u8, 0x6d_u8, 0xc1_u8, 0xe3_u8, 0x88_u8])
    def query_interface(this : IAzTask*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzTask*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzTask*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzTask*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzTask*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzTask*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzTask*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzTask*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzTask*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzTask*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzTask*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzTask*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzTask*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_BizRule(this : IAzTask*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRule.call(this, pbstrProp)
    end
    def put_BizRule(this : IAzTask*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRule.call(this, bstrProp)
    end
    def get_BizRuleLanguage(this : IAzTask*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleLanguage.call(this, pbstrProp)
    end
    def put_BizRuleLanguage(this : IAzTask*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleLanguage.call(this, bstrProp)
    end
    def get_BizRuleImportedPath(this : IAzTask*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleImportedPath.call(this, pbstrProp)
    end
    def put_BizRuleImportedPath(this : IAzTask*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleImportedPath.call(this, bstrProp)
    end
    def get_IsRoleDefinition(this : IAzTask*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsRoleDefinition.call(this, pfProp)
    end
    def put_IsRoleDefinition(this : IAzTask*, fProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsRoleDefinition.call(this, fProp)
    end
    def get_Operations(this : IAzTask*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, pvarProp)
    end
    def get_Tasks(this : IAzTask*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, pvarProp)
    end
    def add_operation(this : IAzTask*, bstrOp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_operation.call(this, bstrOp, varReserved)
    end
    def delete_operation(this : IAzTask*, bstrOp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrOp, varReserved)
    end
    def add_task(this : IAzTask*, bstrTask : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_task.call(this, bstrTask, varReserved)
    end
    def delete_task(this : IAzTask*, bstrTask : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTask, varReserved)
    end
    def get_Writable(this : IAzTask*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzTask*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzTask*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzTask*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzTask*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzTask*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end

  end

  @[Extern]
  record IAzTasksVtbl,
    query_interface : Proc(IAzTasks*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzTasks*, UInt32),
    release : Proc(IAzTasks*, UInt32),
    get_type_info_count : Proc(IAzTasks*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzTasks*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzTasks*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzTasks*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzTasks*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzTasks*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzTasks*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzTasks, lpVtbl : IAzTasksVtbl* do
    GUID = LibC::GUID.new(0xb338ccab_u32, 0x4c85_u16, 0x4388_u16, StaticArray[0x8c_u8, 0xa_u8, 0xc5_u8, 0x85_u8, 0x92_u8, 0xba_u8, 0xd3_u8, 0x98_u8])
    def query_interface(this : IAzTasks*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzTasks*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzTasks*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzTasks*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzTasks*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzTasks*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzTasks*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzTasks*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzTasks*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzTasks*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzScopeVtbl,
    query_interface : Proc(IAzScope*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzScope*, UInt32),
    release : Proc(IAzScope*, UInt32),
    get_type_info_count : Proc(IAzScope*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzScope*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzScope*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzScope*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzScope*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzScope*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzScope*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzScope*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzScope*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzScope*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzScope*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzScope*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzScope*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzScope*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzScope*, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Roles : Proc(IAzScope*, Void**, Win32cr::Foundation::HRESULT),
    open_role : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_role : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_role : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzScope*, Void**, Win32cr::Foundation::HRESULT),
    open_task : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_task : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzScope*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_CanBeDelegated : Proc(IAzScope*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_BizrulesWritable : Proc(IAzScope*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzScope*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzScope*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzScope*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzScope, lpVtbl : IAzScopeVtbl* do
    GUID = LibC::GUID.new(0xe52487_u32, 0xe08d_u16, 0x4514_u16, StaticArray[0xb6_u8, 0x2e_u8, 0x87_u8, 0x7d_u8, 0x56_u8, 0x45_u8, 0xf5_u8, 0xab_u8])
    def query_interface(this : IAzScope*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzScope*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzScope*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzScope*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzScope*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzScope*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzScope*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzScope*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzScope*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzScope*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzScope*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzScope*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzScope*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_Writable(this : IAzScope*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzScope*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzScope*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzScope*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzScope*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzScope*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzScope*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzScope*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzScope*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzScope*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzScope*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def get_ApplicationGroups(this : IAzScope*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def open_application_group(this : IAzScope*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def create_application_group(this : IAzScope*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzScope*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def get_Roles(this : IAzScope*, ppRoleCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Roles.call(this, ppRoleCollection)
    end
    def open_role(this : IAzScope*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def create_role(this : IAzScope*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def delete_role(this : IAzScope*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role.call(this, bstrRoleName, varReserved)
    end
    def get_Tasks(this : IAzScope*, ppTaskCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, ppTaskCollection)
    end
    def open_task(this : IAzScope*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def create_task(this : IAzScope*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def delete_task(this : IAzScope*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTaskName, varReserved)
    end
    def submit(this : IAzScope*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def get_CanBeDelegated(this : IAzScope*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanBeDelegated.call(this, pfProp)
    end
    def get_BizrulesWritable(this : IAzScope*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizrulesWritable.call(this, pfProp)
    end
    def get_PolicyAdministratorsName(this : IAzScope*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzScope*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzScope*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzScope*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzScope*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzScope*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end

  end

  @[Extern]
  record IAzScopesVtbl,
    query_interface : Proc(IAzScopes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzScopes*, UInt32),
    release : Proc(IAzScopes*, UInt32),
    get_type_info_count : Proc(IAzScopes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzScopes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzScopes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzScopes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzScopes*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzScopes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzScopes*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzScopes, lpVtbl : IAzScopesVtbl* do
    GUID = LibC::GUID.new(0x78e14853_u32, 0x9f5e_u16, 0x406d_u16, StaticArray[0x9b_u8, 0x91_u8, 0x6b_u8, 0xdb_u8, 0xa6_u8, 0x97_u8, 0x35_u8, 0x10_u8])
    def query_interface(this : IAzScopes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzScopes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzScopes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzScopes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzScopes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzScopes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzScopes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzScopes*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzScopes*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzScopes*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzApplicationGroupVtbl,
    query_interface : Proc(IAzApplicationGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzApplicationGroup*, UInt32),
    release : Proc(IAzApplicationGroup*, UInt32),
    get_type_info_count : Proc(IAzApplicationGroup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzApplicationGroup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzApplicationGroup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzApplicationGroup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IAzApplicationGroup*, Int32*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(IAzApplicationGroup*, Int32, Win32cr::Foundation::HRESULT),
    get_LdapQuery : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LdapQuery : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AppMembers : Proc(IAzApplicationGroup*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_AppNonMembers : Proc(IAzApplicationGroup*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Members : Proc(IAzApplicationGroup*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_NonMembers : Proc(IAzApplicationGroup*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_app_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_app_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_app_non_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_app_non_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_non_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_non_member : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzApplicationGroup*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzApplicationGroup*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzApplicationGroup*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzApplicationGroup*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzApplicationGroup*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzApplicationGroup*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member_name : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member_name : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_non_member_name : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_non_member_name : Proc(IAzApplicationGroup*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MembersName : Proc(IAzApplicationGroup*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_NonMembersName : Proc(IAzApplicationGroup*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzApplicationGroup, lpVtbl : IAzApplicationGroupVtbl* do
    GUID = LibC::GUID.new(0xf1b744cd_u32, 0x58a6_u16, 0x4e06_u16, StaticArray[0x9f_u8, 0xbf_u8, 0x36_u8, 0xf6_u8, 0xd7_u8, 0x79_u8, 0xe2_u8, 0x1e_u8])
    def query_interface(this : IAzApplicationGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzApplicationGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzApplicationGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzApplicationGroup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzApplicationGroup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzApplicationGroup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzApplicationGroup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzApplicationGroup*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzApplicationGroup*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Type(this : IAzApplicationGroup*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, plProp)
    end
    def put_Type(this : IAzApplicationGroup*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, lProp)
    end
    def get_LdapQuery(this : IAzApplicationGroup*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LdapQuery.call(this, pbstrProp)
    end
    def put_LdapQuery(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LdapQuery.call(this, bstrProp)
    end
    def get_AppMembers(this : IAzApplicationGroup*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppMembers.call(this, pvarProp)
    end
    def get_AppNonMembers(this : IAzApplicationGroup*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppNonMembers.call(this, pvarProp)
    end
    def get_Members(this : IAzApplicationGroup*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Members.call(this, pvarProp)
    end
    def get_NonMembers(this : IAzApplicationGroup*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonMembers.call(this, pvarProp)
    end
    def get_Description(this : IAzApplicationGroup*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzApplicationGroup*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def add_app_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_app_member.call(this, bstrProp, varReserved)
    end
    def delete_app_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_app_member.call(this, bstrProp, varReserved)
    end
    def add_app_non_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_app_non_member.call(this, bstrProp, varReserved)
    end
    def delete_app_non_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_app_non_member.call(this, bstrProp, varReserved)
    end
    def add_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member.call(this, bstrProp, varReserved)
    end
    def delete_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member.call(this, bstrProp, varReserved)
    end
    def add_non_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_non_member.call(this, bstrProp, varReserved)
    end
    def delete_non_member(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_non_member.call(this, bstrProp, varReserved)
    end
    def get_Writable(this : IAzApplicationGroup*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzApplicationGroup*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzApplicationGroup*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzApplicationGroup*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzApplicationGroup*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzApplicationGroup*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def add_member_name(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member_name.call(this, bstrProp, varReserved)
    end
    def delete_member_name(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member_name.call(this, bstrProp, varReserved)
    end
    def add_non_member_name(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_non_member_name.call(this, bstrProp, varReserved)
    end
    def delete_non_member_name(this : IAzApplicationGroup*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_non_member_name.call(this, bstrProp, varReserved)
    end
    def get_MembersName(this : IAzApplicationGroup*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MembersName.call(this, pvarProp)
    end
    def get_NonMembersName(this : IAzApplicationGroup*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonMembersName.call(this, pvarProp)
    end

  end

  @[Extern]
  record IAzApplicationGroupsVtbl,
    query_interface : Proc(IAzApplicationGroups*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzApplicationGroups*, UInt32),
    release : Proc(IAzApplicationGroups*, UInt32),
    get_type_info_count : Proc(IAzApplicationGroups*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzApplicationGroups*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzApplicationGroups*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzApplicationGroups*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzApplicationGroups*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzApplicationGroups*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzApplicationGroups*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzApplicationGroups, lpVtbl : IAzApplicationGroupsVtbl* do
    GUID = LibC::GUID.new(0x4ce66ad5_u32, 0x9f3c_u16, 0x469d_u16, StaticArray[0xa9_u8, 0x11_u8, 0xb9_u8, 0x98_u8, 0x87_u8, 0xa7_u8, 0xe6_u8, 0x85_u8])
    def query_interface(this : IAzApplicationGroups*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzApplicationGroups*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzApplicationGroups*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzApplicationGroups*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzApplicationGroups*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzApplicationGroups*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzApplicationGroups*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzApplicationGroups*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzApplicationGroups*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzApplicationGroups*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzRoleVtbl,
    query_interface : Proc(IAzRole*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzRole*, UInt32),
    release : Proc(IAzRole*, UInt32),
    get_type_info_count : Proc(IAzRole*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzRole*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzRole*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzRole*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzRole*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzRole*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzRole*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_app_member : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_app_member : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_task : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_operation : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzRole*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzRole*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzRole*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AppMembers : Proc(IAzRole*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Members : Proc(IAzRole*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzRole*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzRole*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzRole*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzRole*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzRole*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member_name : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member_name : Proc(IAzRole*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MembersName : Proc(IAzRole*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzRole, lpVtbl : IAzRoleVtbl* do
    GUID = LibC::GUID.new(0x859e0d8d_u32, 0x62d7_u16, 0x41d8_u16, StaticArray[0xa0_u8, 0x34_u8, 0xc0_u8, 0xcd_u8, 0x5d_u8, 0x43_u8, 0xfd_u8, 0xfa_u8])
    def query_interface(this : IAzRole*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzRole*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzRole*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzRole*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzRole*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzRole*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzRole*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzRole*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzRole*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzRole*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzRole*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzRole*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzRole*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def add_app_member(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_app_member.call(this, bstrProp, varReserved)
    end
    def delete_app_member(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_app_member.call(this, bstrProp, varReserved)
    end
    def add_task(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_task.call(this, bstrProp, varReserved)
    end
    def delete_task(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrProp, varReserved)
    end
    def add_operation(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_operation.call(this, bstrProp, varReserved)
    end
    def delete_operation(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrProp, varReserved)
    end
    def add_member(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member.call(this, bstrProp, varReserved)
    end
    def delete_member(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member.call(this, bstrProp, varReserved)
    end
    def get_Writable(this : IAzRole*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzRole*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzRole*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def get_AppMembers(this : IAzRole*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppMembers.call(this, pvarProp)
    end
    def get_Members(this : IAzRole*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Members.call(this, pvarProp)
    end
    def get_Operations(this : IAzRole*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, pvarProp)
    end
    def get_Tasks(this : IAzRole*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, pvarProp)
    end
    def add_property_item(this : IAzRole*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzRole*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzRole*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def add_member_name(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member_name.call(this, bstrProp, varReserved)
    end
    def delete_member_name(this : IAzRole*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member_name.call(this, bstrProp, varReserved)
    end
    def get_MembersName(this : IAzRole*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MembersName.call(this, pvarProp)
    end

  end

  @[Extern]
  record IAzRolesVtbl,
    query_interface : Proc(IAzRoles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzRoles*, UInt32),
    release : Proc(IAzRoles*, UInt32),
    get_type_info_count : Proc(IAzRoles*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzRoles*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzRoles*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzRoles*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzRoles*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzRoles*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzRoles*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzRoles, lpVtbl : IAzRolesVtbl* do
    GUID = LibC::GUID.new(0x95e0f119_u32, 0x13b4_u16, 0x4dae_u16, StaticArray[0xb6_u8, 0x5f_u8, 0x2f_u8, 0x7d_u8, 0x60_u8, 0xd8_u8, 0x22_u8, 0xe4_u8])
    def query_interface(this : IAzRoles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzRoles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzRoles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzRoles*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzRoles*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzRoles*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzRoles*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzRoles*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzRoles*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzRoles*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzClientContextVtbl,
    query_interface : Proc(IAzClientContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzClientContext*, UInt32),
    release : Proc(IAzClientContext*, UInt32),
    get_type_info_count : Proc(IAzClientContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzClientContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzClientContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzClientContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    access_check : Proc(IAzClientContext*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_business_rule_string : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDn : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserSamCompat : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDisplay : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserGuid : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserCanonical : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserUpn : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDnsSamCompat : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzClientContext*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_roles : Proc(IAzClientContext*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_RoleForAccessCheck : Proc(IAzClientContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RoleForAccessCheck : Proc(IAzClientContext*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzClientContext, lpVtbl : IAzClientContextVtbl* do
    GUID = LibC::GUID.new(0xeff1f00b_u32, 0x488a_u16, 0x466d_u16, StaticArray[0xaf_u8, 0xd9_u8, 0xa4_u8, 0x1_u8, 0xc5_u8, 0xf9_u8, 0xee_u8, 0xf5_u8])
    def query_interface(this : IAzClientContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzClientContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzClientContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzClientContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzClientContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzClientContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzClientContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def access_check(this : IAzClientContext*, bstrObjectName : Win32cr::Foundation::BSTR, varScopeNames : Win32cr::System::Com::VARIANT, varOperations : Win32cr::System::Com::VARIANT, varParameterNames : Win32cr::System::Com::VARIANT, varParameterValues : Win32cr::System::Com::VARIANT, varInterfaceNames : Win32cr::System::Com::VARIANT, varInterfaceFlags : Win32cr::System::Com::VARIANT, varInterfaces : Win32cr::System::Com::VARIANT, pvarResults : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.access_check.call(this, bstrObjectName, varScopeNames, varOperations, varParameterNames, varParameterValues, varInterfaceNames, varInterfaceFlags, varInterfaces, pvarResults)
    end
    def get_business_rule_string(this : IAzClientContext*, pbstrBusinessRuleString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_business_rule_string.call(this, pbstrBusinessRuleString)
    end
    def get_UserDn(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDn.call(this, pbstrProp)
    end
    def get_UserSamCompat(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSamCompat.call(this, pbstrProp)
    end
    def get_UserDisplay(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDisplay.call(this, pbstrProp)
    end
    def get_UserGuid(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserGuid.call(this, pbstrProp)
    end
    def get_UserCanonical(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserCanonical.call(this, pbstrProp)
    end
    def get_UserUpn(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserUpn.call(this, pbstrProp)
    end
    def get_UserDnsSamCompat(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDnsSamCompat.call(this, pbstrProp)
    end
    def get_property(this : IAzClientContext*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def get_roles(this : IAzClientContext*, bstrScopeName : Win32cr::Foundation::BSTR, pvarRoleNames : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_roles.call(this, bstrScopeName, pvarRoleNames)
    end
    def get_RoleForAccessCheck(this : IAzClientContext*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleForAccessCheck.call(this, pbstrProp)
    end
    def put_RoleForAccessCheck(this : IAzClientContext*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RoleForAccessCheck.call(this, bstrProp)
    end

  end

  @[Extern]
  record IAzClientContext2Vtbl,
    query_interface : Proc(IAzClientContext2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzClientContext2*, UInt32),
    release : Proc(IAzClientContext2*, UInt32),
    get_type_info_count : Proc(IAzClientContext2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzClientContext2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzClientContext2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzClientContext2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    access_check : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_business_rule_string : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDn : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserSamCompat : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDisplay : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserGuid : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserCanonical : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserUpn : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDnsSamCompat : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzClientContext2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_roles : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_RoleForAccessCheck : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RoleForAccessCheck : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_assigned_scopes_page : Proc(IAzClientContext2*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_roles : Proc(IAzClientContext2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_application_groups : Proc(IAzClientContext2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_string_sids : Proc(IAzClientContext2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    put_LDAPQueryDN : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LDAPQueryDN : Proc(IAzClientContext2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzClientContext2, lpVtbl : IAzClientContext2Vtbl* do
    GUID = LibC::GUID.new(0x2b0c92b8_u32, 0x208a_u16, 0x488a_u16, StaticArray[0x8f_u8, 0x81_u8, 0xe4_u8, 0xed_u8, 0xb2_u8, 0x21_u8, 0x11_u8, 0xcd_u8])
    def query_interface(this : IAzClientContext2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzClientContext2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzClientContext2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzClientContext2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzClientContext2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzClientContext2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzClientContext2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def access_check(this : IAzClientContext2*, bstrObjectName : Win32cr::Foundation::BSTR, varScopeNames : Win32cr::System::Com::VARIANT, varOperations : Win32cr::System::Com::VARIANT, varParameterNames : Win32cr::System::Com::VARIANT, varParameterValues : Win32cr::System::Com::VARIANT, varInterfaceNames : Win32cr::System::Com::VARIANT, varInterfaceFlags : Win32cr::System::Com::VARIANT, varInterfaces : Win32cr::System::Com::VARIANT, pvarResults : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.access_check.call(this, bstrObjectName, varScopeNames, varOperations, varParameterNames, varParameterValues, varInterfaceNames, varInterfaceFlags, varInterfaces, pvarResults)
    end
    def get_business_rule_string(this : IAzClientContext2*, pbstrBusinessRuleString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_business_rule_string.call(this, pbstrBusinessRuleString)
    end
    def get_UserDn(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDn.call(this, pbstrProp)
    end
    def get_UserSamCompat(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSamCompat.call(this, pbstrProp)
    end
    def get_UserDisplay(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDisplay.call(this, pbstrProp)
    end
    def get_UserGuid(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserGuid.call(this, pbstrProp)
    end
    def get_UserCanonical(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserCanonical.call(this, pbstrProp)
    end
    def get_UserUpn(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserUpn.call(this, pbstrProp)
    end
    def get_UserDnsSamCompat(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDnsSamCompat.call(this, pbstrProp)
    end
    def get_property(this : IAzClientContext2*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def get_roles(this : IAzClientContext2*, bstrScopeName : Win32cr::Foundation::BSTR, pvarRoleNames : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_roles.call(this, bstrScopeName, pvarRoleNames)
    end
    def get_RoleForAccessCheck(this : IAzClientContext2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleForAccessCheck.call(this, pbstrProp)
    end
    def put_RoleForAccessCheck(this : IAzClientContext2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RoleForAccessCheck.call(this, bstrProp)
    end
    def get_assigned_scopes_page(this : IAzClientContext2*, lOptions : Int32, page_size : Int32, pvarCursor : Win32cr::System::Com::VARIANT*, pvarScopeNames : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assigned_scopes_page.call(this, lOptions, page_size, pvarCursor, pvarScopeNames)
    end
    def add_roles(this : IAzClientContext2*, varRoles : Win32cr::System::Com::VARIANT, bstrScopeName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_roles.call(this, varRoles, bstrScopeName)
    end
    def add_application_groups(this : IAzClientContext2*, varApplicationGroups : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_application_groups.call(this, varApplicationGroups)
    end
    def add_string_sids(this : IAzClientContext2*, varStringSids : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_string_sids.call(this, varStringSids)
    end
    def put_LDAPQueryDN(this : IAzClientContext2*, bstrLDAPQueryDN : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LDAPQueryDN.call(this, bstrLDAPQueryDN)
    end
    def get_LDAPQueryDN(this : IAzClientContext2*, pbstrLDAPQueryDN : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LDAPQueryDN.call(this, pbstrLDAPQueryDN)
    end

  end

  @[Extern]
  record IAzBizRuleContextVtbl,
    query_interface : Proc(IAzBizRuleContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzBizRuleContext*, UInt32),
    release : Proc(IAzBizRuleContext*, UInt32),
    get_type_info_count : Proc(IAzBizRuleContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzBizRuleContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzBizRuleContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzBizRuleContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BusinessRuleResult : Proc(IAzBizRuleContext*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    put_BusinessRuleString : Proc(IAzBizRuleContext*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BusinessRuleString : Proc(IAzBizRuleContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_parameter : Proc(IAzBizRuleContext*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzBizRuleContext, lpVtbl : IAzBizRuleContextVtbl* do
    GUID = LibC::GUID.new(0xe192f17d_u32, 0xd59f_u16, 0x455e_u16, StaticArray[0xa1_u8, 0x52_u8, 0x94_u8, 0x3_u8, 0x16_u8, 0xcd_u8, 0x77_u8, 0xb2_u8])
    def query_interface(this : IAzBizRuleContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzBizRuleContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzBizRuleContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzBizRuleContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzBizRuleContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzBizRuleContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzBizRuleContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def put_BusinessRuleResult(this : IAzBizRuleContext*, bResult : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BusinessRuleResult.call(this, bResult)
    end
    def put_BusinessRuleString(this : IAzBizRuleContext*, bstrBusinessRuleString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BusinessRuleString.call(this, bstrBusinessRuleString)
    end
    def get_BusinessRuleString(this : IAzBizRuleContext*, pbstrBusinessRuleString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BusinessRuleString.call(this, pbstrBusinessRuleString)
    end
    def get_parameter(this : IAzBizRuleContext*, bstrParameterName : Win32cr::Foundation::BSTR, pvarParameterValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parameter.call(this, bstrParameterName, pvarParameterValue)
    end

  end

  @[Extern]
  record IAzBizRuleParametersVtbl,
    query_interface : Proc(IAzBizRuleParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzBizRuleParameters*, UInt32),
    release : Proc(IAzBizRuleParameters*, UInt32),
    get_type_info_count : Proc(IAzBizRuleParameters*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzBizRuleParameters*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzBizRuleParameters*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzBizRuleParameters*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    add_parameter : Proc(IAzBizRuleParameters*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_parameters : Proc(IAzBizRuleParameters*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_parameter_value : Proc(IAzBizRuleParameters*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    remove : Proc(IAzBizRuleParameters*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_all : Proc(IAzBizRuleParameters*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzBizRuleParameters*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzBizRuleParameters, lpVtbl : IAzBizRuleParametersVtbl* do
    GUID = LibC::GUID.new(0xfc17685f_u32, 0xe25d_u16, 0x4dcd_u16, StaticArray[0xba_u8, 0xe1_u8, 0x27_u8, 0x6e_u8, 0xc9_u8, 0x53_u8, 0x3c_u8, 0xb5_u8])
    def query_interface(this : IAzBizRuleParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzBizRuleParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzBizRuleParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzBizRuleParameters*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzBizRuleParameters*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzBizRuleParameters*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzBizRuleParameters*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def add_parameter(this : IAzBizRuleParameters*, bstrParameterName : Win32cr::Foundation::BSTR, varParameterValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_parameter.call(this, bstrParameterName, varParameterValue)
    end
    def add_parameters(this : IAzBizRuleParameters*, varParameterNames : Win32cr::System::Com::VARIANT, varParameterValues : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_parameters.call(this, varParameterNames, varParameterValues)
    end
    def get_parameter_value(this : IAzBizRuleParameters*, bstrParameterName : Win32cr::Foundation::BSTR, pvarParameterValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parameter_value.call(this, bstrParameterName, pvarParameterValue)
    end
    def remove(this : IAzBizRuleParameters*, varParameterName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, varParameterName)
    end
    def remove_all(this : IAzBizRuleParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all.call(this)
    end
    def get_Count(this : IAzBizRuleParameters*, plCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IAzBizRuleInterfacesVtbl,
    query_interface : Proc(IAzBizRuleInterfaces*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzBizRuleInterfaces*, UInt32),
    release : Proc(IAzBizRuleInterfaces*, UInt32),
    get_type_info_count : Proc(IAzBizRuleInterfaces*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzBizRuleInterfaces*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzBizRuleInterfaces*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzBizRuleInterfaces*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    add_interface : Proc(IAzBizRuleInterfaces*, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_interfaces : Proc(IAzBizRuleInterfaces*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_interface_value : Proc(IAzBizRuleInterfaces*, Win32cr::Foundation::BSTR, Int32*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    remove : Proc(IAzBizRuleInterfaces*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_all : Proc(IAzBizRuleInterfaces*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzBizRuleInterfaces*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzBizRuleInterfaces, lpVtbl : IAzBizRuleInterfacesVtbl* do
    GUID = LibC::GUID.new(0xe94128c7_u32, 0xe9da_u16, 0x44cc_u16, StaticArray[0xb0_u8, 0xbd_u8, 0x53_u8, 0x3_u8, 0x6f_u8, 0x3a_u8, 0xab_u8, 0x3d_u8])
    def query_interface(this : IAzBizRuleInterfaces*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzBizRuleInterfaces*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzBizRuleInterfaces*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzBizRuleInterfaces*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzBizRuleInterfaces*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzBizRuleInterfaces*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzBizRuleInterfaces*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def add_interface(this : IAzBizRuleInterfaces*, bstrInterfaceName : Win32cr::Foundation::BSTR, lInterfaceFlag : Int32, varInterface : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_interface.call(this, bstrInterfaceName, lInterfaceFlag, varInterface)
    end
    def add_interfaces(this : IAzBizRuleInterfaces*, varInterfaceNames : Win32cr::System::Com::VARIANT, varInterfaceFlags : Win32cr::System::Com::VARIANT, varInterfaces : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_interfaces.call(this, varInterfaceNames, varInterfaceFlags, varInterfaces)
    end
    def get_interface_value(this : IAzBizRuleInterfaces*, bstrInterfaceName : Win32cr::Foundation::BSTR, lInterfaceFlag : Int32*, varInterface : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface_value.call(this, bstrInterfaceName, lInterfaceFlag, varInterface)
    end
    def remove(this : IAzBizRuleInterfaces*, bstrInterfaceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, bstrInterfaceName)
    end
    def remove_all(this : IAzBizRuleInterfaces*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all.call(this)
    end
    def get_Count(this : IAzBizRuleInterfaces*, plCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IAzClientContext3Vtbl,
    query_interface : Proc(IAzClientContext3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzClientContext3*, UInt32),
    release : Proc(IAzClientContext3*, UInt32),
    get_type_info_count : Proc(IAzClientContext3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzClientContext3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzClientContext3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzClientContext3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    access_check : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_business_rule_string : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDn : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserSamCompat : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDisplay : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserGuid : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserCanonical : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserUpn : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserDnsSamCompat : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzClientContext3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_roles : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_RoleForAccessCheck : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RoleForAccessCheck : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_assigned_scopes_page : Proc(IAzClientContext3*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_roles : Proc(IAzClientContext3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_application_groups : Proc(IAzClientContext3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_string_sids : Proc(IAzClientContext3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    put_LDAPQueryDN : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LDAPQueryDN : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    access_check2 : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    is_in_role_assignment : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    get_operations : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_tasks : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_BizRuleParameters : Proc(IAzClientContext3*, Void**, Win32cr::Foundation::HRESULT),
    get_BizRuleInterfaces : Proc(IAzClientContext3*, Void**, Win32cr::Foundation::HRESULT),
    get_groups : Proc(IAzClientContext3*, Win32cr::Foundation::BSTR, Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Sids : Proc(IAzClientContext3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzClientContext3, lpVtbl : IAzClientContext3Vtbl* do
    GUID = LibC::GUID.new(0x11894fde_u32, 0x1deb_u16, 0x4b4b_u16, StaticArray[0x89_u8, 0x7_u8, 0x6d_u8, 0x1c_u8, 0xda_u8, 0x1f_u8, 0x5d_u8, 0x4f_u8])
    def query_interface(this : IAzClientContext3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzClientContext3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzClientContext3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzClientContext3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzClientContext3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzClientContext3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzClientContext3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def access_check(this : IAzClientContext3*, bstrObjectName : Win32cr::Foundation::BSTR, varScopeNames : Win32cr::System::Com::VARIANT, varOperations : Win32cr::System::Com::VARIANT, varParameterNames : Win32cr::System::Com::VARIANT, varParameterValues : Win32cr::System::Com::VARIANT, varInterfaceNames : Win32cr::System::Com::VARIANT, varInterfaceFlags : Win32cr::System::Com::VARIANT, varInterfaces : Win32cr::System::Com::VARIANT, pvarResults : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.access_check.call(this, bstrObjectName, varScopeNames, varOperations, varParameterNames, varParameterValues, varInterfaceNames, varInterfaceFlags, varInterfaces, pvarResults)
    end
    def get_business_rule_string(this : IAzClientContext3*, pbstrBusinessRuleString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_business_rule_string.call(this, pbstrBusinessRuleString)
    end
    def get_UserDn(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDn.call(this, pbstrProp)
    end
    def get_UserSamCompat(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSamCompat.call(this, pbstrProp)
    end
    def get_UserDisplay(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDisplay.call(this, pbstrProp)
    end
    def get_UserGuid(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserGuid.call(this, pbstrProp)
    end
    def get_UserCanonical(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserCanonical.call(this, pbstrProp)
    end
    def get_UserUpn(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserUpn.call(this, pbstrProp)
    end
    def get_UserDnsSamCompat(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDnsSamCompat.call(this, pbstrProp)
    end
    def get_property(this : IAzClientContext3*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def get_roles(this : IAzClientContext3*, bstrScopeName : Win32cr::Foundation::BSTR, pvarRoleNames : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_roles.call(this, bstrScopeName, pvarRoleNames)
    end
    def get_RoleForAccessCheck(this : IAzClientContext3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleForAccessCheck.call(this, pbstrProp)
    end
    def put_RoleForAccessCheck(this : IAzClientContext3*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RoleForAccessCheck.call(this, bstrProp)
    end
    def get_assigned_scopes_page(this : IAzClientContext3*, lOptions : Int32, page_size : Int32, pvarCursor : Win32cr::System::Com::VARIANT*, pvarScopeNames : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assigned_scopes_page.call(this, lOptions, page_size, pvarCursor, pvarScopeNames)
    end
    def add_roles(this : IAzClientContext3*, varRoles : Win32cr::System::Com::VARIANT, bstrScopeName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_roles.call(this, varRoles, bstrScopeName)
    end
    def add_application_groups(this : IAzClientContext3*, varApplicationGroups : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_application_groups.call(this, varApplicationGroups)
    end
    def add_string_sids(this : IAzClientContext3*, varStringSids : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_string_sids.call(this, varStringSids)
    end
    def put_LDAPQueryDN(this : IAzClientContext3*, bstrLDAPQueryDN : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LDAPQueryDN.call(this, bstrLDAPQueryDN)
    end
    def get_LDAPQueryDN(this : IAzClientContext3*, pbstrLDAPQueryDN : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LDAPQueryDN.call(this, pbstrLDAPQueryDN)
    end
    def access_check2(this : IAzClientContext3*, bstrObjectName : Win32cr::Foundation::BSTR, bstrScopeName : Win32cr::Foundation::BSTR, lOperation : Int32, plResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.access_check2.call(this, bstrObjectName, bstrScopeName, lOperation, plResult)
    end
    def is_in_role_assignment(this : IAzClientContext3*, bstrScopeName : Win32cr::Foundation::BSTR, bstrRoleName : Win32cr::Foundation::BSTR, pbIsInRole : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_in_role_assignment.call(this, bstrScopeName, bstrRoleName, pbIsInRole)
    end
    def get_operations(this : IAzClientContext3*, bstrScopeName : Win32cr::Foundation::BSTR, ppOperationCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_operations.call(this, bstrScopeName, ppOperationCollection)
    end
    def get_tasks(this : IAzClientContext3*, bstrScopeName : Win32cr::Foundation::BSTR, ppTaskCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tasks.call(this, bstrScopeName, ppTaskCollection)
    end
    def get_BizRuleParameters(this : IAzClientContext3*, ppBizRuleParam : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleParameters.call(this, ppBizRuleParam)
    end
    def get_BizRuleInterfaces(this : IAzClientContext3*, ppBizRuleInterfaces : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleInterfaces.call(this, ppBizRuleInterfaces)
    end
    def get_groups(this : IAzClientContext3*, bstrScopeName : Win32cr::Foundation::BSTR, ulOptions : Win32cr::Security::Authorization::AZ_PROP_CONSTANTS, pGroupArray : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_groups.call(this, bstrScopeName, ulOptions, pGroupArray)
    end
    def get_Sids(this : IAzClientContext3*, pStringSidArray : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sids.call(this, pStringSidArray)
    end

  end

  @[Extern]
  record IAzScope2Vtbl,
    query_interface : Proc(IAzScope2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzScope2*, UInt32),
    release : Proc(IAzScope2*, UInt32),
    get_type_info_count : Proc(IAzScope2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzScope2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzScope2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzScope2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzScope2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzScope2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzScope2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzScope2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzScope2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzScope2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzScope2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzScope2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzScope2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzScope2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzScope2*, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Roles : Proc(IAzScope2*, Void**, Win32cr::Foundation::HRESULT),
    open_role : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_role : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_role : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzScope2*, Void**, Win32cr::Foundation::HRESULT),
    open_task : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_task : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzScope2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_CanBeDelegated : Proc(IAzScope2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_BizrulesWritable : Proc(IAzScope2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzScope2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzScope2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_RoleDefinitions : Proc(IAzScope2*, Void**, Win32cr::Foundation::HRESULT),
    create_role_definition : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    open_role_definition : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_role_definition : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RoleAssignments : Proc(IAzScope2*, Void**, Win32cr::Foundation::HRESULT),
    create_role_assignment : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    open_role_assignment : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_role_assignment : Proc(IAzScope2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzScope2, lpVtbl : IAzScope2Vtbl* do
    GUID = LibC::GUID.new(0xee9fe8c9_u32, 0xc9f3_u16, 0x40e2_u16, StaticArray[0xaa_u8, 0x12_u8, 0xd1_u8, 0xd8_u8, 0x59_u8, 0x97_u8, 0x27_u8, 0xfd_u8])
    def query_interface(this : IAzScope2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzScope2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzScope2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzScope2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzScope2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzScope2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzScope2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzScope2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzScope2*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzScope2*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzScope2*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzScope2*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzScope2*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_Writable(this : IAzScope2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzScope2*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzScope2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzScope2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzScope2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzScope2*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzScope2*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzScope2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzScope2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzScope2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzScope2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def get_ApplicationGroups(this : IAzScope2*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def open_application_group(this : IAzScope2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def create_application_group(this : IAzScope2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzScope2*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def get_Roles(this : IAzScope2*, ppRoleCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Roles.call(this, ppRoleCollection)
    end
    def open_role(this : IAzScope2*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def create_role(this : IAzScope2*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def delete_role(this : IAzScope2*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role.call(this, bstrRoleName, varReserved)
    end
    def get_Tasks(this : IAzScope2*, ppTaskCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, ppTaskCollection)
    end
    def open_task(this : IAzScope2*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def create_task(this : IAzScope2*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def delete_task(this : IAzScope2*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTaskName, varReserved)
    end
    def submit(this : IAzScope2*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def get_CanBeDelegated(this : IAzScope2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanBeDelegated.call(this, pfProp)
    end
    def get_BizrulesWritable(this : IAzScope2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizrulesWritable.call(this, pfProp)
    end
    def get_PolicyAdministratorsName(this : IAzScope2*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzScope2*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzScope2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzScope2*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzScope2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzScope2*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def get_RoleDefinitions(this : IAzScope2*, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleDefinitions.call(this, ppRoleDefinitions)
    end
    def create_role_definition(this : IAzScope2*, bstrRoleDefinitionName : Win32cr::Foundation::BSTR, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role_definition.call(this, bstrRoleDefinitionName, ppRoleDefinitions)
    end
    def open_role_definition(this : IAzScope2*, bstrRoleDefinitionName : Win32cr::Foundation::BSTR, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role_definition.call(this, bstrRoleDefinitionName, ppRoleDefinitions)
    end
    def delete_role_definition(this : IAzScope2*, bstrRoleDefinitionName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role_definition.call(this, bstrRoleDefinitionName)
    end
    def get_RoleAssignments(this : IAzScope2*, ppRoleAssignments : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleAssignments.call(this, ppRoleAssignments)
    end
    def create_role_assignment(this : IAzScope2*, bstrRoleAssignmentName : Win32cr::Foundation::BSTR, ppRoleAssignment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role_assignment.call(this, bstrRoleAssignmentName, ppRoleAssignment)
    end
    def open_role_assignment(this : IAzScope2*, bstrRoleAssignmentName : Win32cr::Foundation::BSTR, ppRoleAssignment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role_assignment.call(this, bstrRoleAssignmentName, ppRoleAssignment)
    end
    def delete_role_assignment(this : IAzScope2*, bstrRoleAssignmentName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role_assignment.call(this, bstrRoleAssignmentName)
    end

  end

  @[Extern]
  record IAzApplication3Vtbl,
    query_interface : Proc(IAzApplication3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzApplication3*, UInt32),
    release : Proc(IAzApplication3*, UInt32),
    get_type_info_count : Proc(IAzApplication3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzApplication3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzApplication3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzApplication3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzApplication3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzApplication3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AuthzInterfaceClsid : Proc(IAzApplication3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_AuthzInterfaceClsid : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IAzApplication3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Version : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_GenerateAudits : Proc(IAzApplication3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_GenerateAudits : Proc(IAzApplication3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ApplyStoreSacl : Proc(IAzApplication3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ApplyStoreSacl : Proc(IAzApplication3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzApplication3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzApplication3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzApplication3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PolicyAdministrators : Proc(IAzApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReaders : Proc(IAzApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Scopes : Proc(IAzApplication3*, Void**, Win32cr::Foundation::HRESULT),
    open_scope : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_scope : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_scope : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzApplication3*, Void**, Win32cr::Foundation::HRESULT),
    open_operation : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_operation : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzApplication3*, Void**, Win32cr::Foundation::HRESULT),
    open_task : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_task : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ApplicationGroups : Proc(IAzApplication3*, Void**, Win32cr::Foundation::HRESULT),
    open_application_group : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_application_group : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_application_group : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Roles : Proc(IAzApplication3*, Void**, Win32cr::Foundation::HRESULT),
    open_role : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_role : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_role : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_token : Proc(IAzApplication3*, UInt64, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzApplication3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzApplication3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzApplication3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsers : Proc(IAzApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_string_sid : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_PolicyAdministratorsName : Proc(IAzApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PolicyReadersName : Proc(IAzApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_policy_administrator_name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_administrator_name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_policy_reader_name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_policy_reader_name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DelegatedPolicyUsersName : Proc(IAzApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_delegated_policy_user_name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_delegated_policy_user_name : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    initialize_client_context_from_token2 : Proc(IAzApplication3*, UInt32, UInt32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    initialize_client_context2 : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    scope_exists : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    open_scope2 : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_scope2 : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_scope2 : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RoleDefinitions : Proc(IAzApplication3*, Void**, Win32cr::Foundation::HRESULT),
    create_role_definition : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    open_role_definition : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_role_definition : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RoleAssignments : Proc(IAzApplication3*, Void**, Win32cr::Foundation::HRESULT),
    create_role_assignment : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    open_role_assignment : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_role_assignment : Proc(IAzApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRulesEnabled : Proc(IAzApplication3*, Int16*, Win32cr::Foundation::HRESULT),
    put_BizRulesEnabled : Proc(IAzApplication3*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzApplication3, lpVtbl : IAzApplication3Vtbl* do
    GUID = LibC::GUID.new(0x181c845e_u32, 0x7196_u16, 0x4a7d_u16, StaticArray[0xac_u8, 0x2e_u8, 0x2_u8, 0xc_u8, 0xb_u8, 0xb7_u8, 0xa3_u8, 0x3_u8])
    def query_interface(this : IAzApplication3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzApplication3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzApplication3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzApplication3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzApplication3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzApplication3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzApplication3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzApplication3*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzApplication3*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzApplication3*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzApplication3*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzApplication3*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzApplication3*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_AuthzInterfaceClsid(this : IAzApplication3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthzInterfaceClsid.call(this, pbstrProp)
    end
    def put_AuthzInterfaceClsid(this : IAzApplication3*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthzInterfaceClsid.call(this, bstrProp)
    end
    def get_Version(this : IAzApplication3*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, pbstrProp)
    end
    def put_Version(this : IAzApplication3*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Version.call(this, bstrProp)
    end
    def get_GenerateAudits(this : IAzApplication3*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GenerateAudits.call(this, pbProp)
    end
    def put_GenerateAudits(this : IAzApplication3*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GenerateAudits.call(this, bProp)
    end
    def get_ApplyStoreSacl(this : IAzApplication3*, pbProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplyStoreSacl.call(this, pbProp)
    end
    def put_ApplyStoreSacl(this : IAzApplication3*, bProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplyStoreSacl.call(this, bProp)
    end
    def get_Writable(this : IAzApplication3*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzApplication3*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzApplication3*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def get_PolicyAdministrators(this : IAzApplication3*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministrators.call(this, pvarAdmins)
    end
    def get_PolicyReaders(this : IAzApplication3*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReaders.call(this, pvarReaders)
    end
    def add_policy_administrator(this : IAzApplication3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator(this : IAzApplication3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader(this : IAzApplication3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader(this : IAzApplication3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader.call(this, bstrReader, varReserved)
    end
    def get_Scopes(this : IAzApplication3*, ppScopeCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scopes.call(this, ppScopeCollection)
    end
    def open_scope(this : IAzApplication3*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppScope : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope.call(this, bstrScopeName, varReserved, ppScope)
    end
    def create_scope(this : IAzApplication3*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppScope : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scope.call(this, bstrScopeName, varReserved, ppScope)
    end
    def delete_scope(this : IAzApplication3*, bstrScopeName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_scope.call(this, bstrScopeName, varReserved)
    end
    def get_Operations(this : IAzApplication3*, ppOperationCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, ppOperationCollection)
    end
    def open_operation(this : IAzApplication3*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_operation.call(this, bstrOperationName, varReserved, ppOperation)
    end
    def create_operation(this : IAzApplication3*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_operation.call(this, bstrOperationName, varReserved, ppOperation)
    end
    def delete_operation(this : IAzApplication3*, bstrOperationName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrOperationName, varReserved)
    end
    def get_Tasks(this : IAzApplication3*, ppTaskCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, ppTaskCollection)
    end
    def open_task(this : IAzApplication3*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def create_task(this : IAzApplication3*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_task.call(this, bstrTaskName, varReserved, ppTask)
    end
    def delete_task(this : IAzApplication3*, bstrTaskName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTaskName, varReserved)
    end
    def get_ApplicationGroups(this : IAzApplication3*, ppGroupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationGroups.call(this, ppGroupCollection)
    end
    def open_application_group(this : IAzApplication3*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def create_application_group(this : IAzApplication3*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_group.call(this, bstrGroupName, varReserved, ppGroup)
    end
    def delete_application_group(this : IAzApplication3*, bstrGroupName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_application_group.call(this, bstrGroupName, varReserved)
    end
    def get_Roles(this : IAzApplication3*, ppRoleCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Roles.call(this, ppRoleCollection)
    end
    def open_role(this : IAzApplication3*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def create_role(this : IAzApplication3*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppRole : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role.call(this, bstrRoleName, varReserved, ppRole)
    end
    def delete_role(this : IAzApplication3*, bstrRoleName : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role.call(this, bstrRoleName, varReserved)
    end
    def initialize_client_context_from_token(this : IAzApplication3*, ullTokenHandle : UInt64, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_token.call(this, ullTokenHandle, varReserved, ppClientContext)
    end
    def add_property_item(this : IAzApplication3*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzApplication3*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzApplication3*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def initialize_client_context_from_name(this : IAzApplication3*, client_name : Win32cr::Foundation::BSTR, domain_name : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_name.call(this, client_name, domain_name, varReserved, ppClientContext)
    end
    def get_DelegatedPolicyUsers(this : IAzApplication3*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsers.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user(this : IAzApplication3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user(this : IAzApplication3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def initialize_client_context_from_string_sid(this : IAzApplication3*, sid_string : Win32cr::Foundation::BSTR, lOptions : Int32, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_string_sid.call(this, sid_string, lOptions, varReserved, ppClientContext)
    end
    def get_PolicyAdministratorsName(this : IAzApplication3*, pvarAdmins : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyAdministratorsName.call(this, pvarAdmins)
    end
    def get_PolicyReadersName(this : IAzApplication3*, pvarReaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolicyReadersName.call(this, pvarReaders)
    end
    def add_policy_administrator_name(this : IAzApplication3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def delete_policy_administrator_name(this : IAzApplication3*, bstrAdmin : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_administrator_name.call(this, bstrAdmin, varReserved)
    end
    def add_policy_reader_name(this : IAzApplication3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def delete_policy_reader_name(this : IAzApplication3*, bstrReader : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_policy_reader_name.call(this, bstrReader, varReserved)
    end
    def get_DelegatedPolicyUsersName(this : IAzApplication3*, pvarDelegatedPolicyUsers : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DelegatedPolicyUsersName.call(this, pvarDelegatedPolicyUsers)
    end
    def add_delegated_policy_user_name(this : IAzApplication3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def delete_delegated_policy_user_name(this : IAzApplication3*, bstrDelegatedPolicyUser : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_delegated_policy_user_name.call(this, bstrDelegatedPolicyUser, varReserved)
    end
    def initialize_client_context_from_token2(this : IAzApplication3*, ulTokenHandleLowPart : UInt32, ulTokenHandleHighPart : UInt32, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context_from_token2.call(this, ulTokenHandleLowPart, ulTokenHandleHighPart, varReserved, ppClientContext)
    end
    def initialize_client_context2(this : IAzApplication3*, identifying_string : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT, ppClientContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_client_context2.call(this, identifying_string, varReserved, ppClientContext)
    end
    def scope_exists(this : IAzApplication3*, bstrScopeName : Win32cr::Foundation::BSTR, pbExist : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scope_exists.call(this, bstrScopeName, pbExist)
    end
    def open_scope2(this : IAzApplication3*, bstrScopeName : Win32cr::Foundation::BSTR, ppScope2 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope2.call(this, bstrScopeName, ppScope2)
    end
    def create_scope2(this : IAzApplication3*, bstrScopeName : Win32cr::Foundation::BSTR, ppScope2 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scope2.call(this, bstrScopeName, ppScope2)
    end
    def delete_scope2(this : IAzApplication3*, bstrScopeName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_scope2.call(this, bstrScopeName)
    end
    def get_RoleDefinitions(this : IAzApplication3*, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleDefinitions.call(this, ppRoleDefinitions)
    end
    def create_role_definition(this : IAzApplication3*, bstrRoleDefinitionName : Win32cr::Foundation::BSTR, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role_definition.call(this, bstrRoleDefinitionName, ppRoleDefinitions)
    end
    def open_role_definition(this : IAzApplication3*, bstrRoleDefinitionName : Win32cr::Foundation::BSTR, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role_definition.call(this, bstrRoleDefinitionName, ppRoleDefinitions)
    end
    def delete_role_definition(this : IAzApplication3*, bstrRoleDefinitionName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role_definition.call(this, bstrRoleDefinitionName)
    end
    def get_RoleAssignments(this : IAzApplication3*, ppRoleAssignments : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleAssignments.call(this, ppRoleAssignments)
    end
    def create_role_assignment(this : IAzApplication3*, bstrRoleAssignmentName : Win32cr::Foundation::BSTR, ppRoleAssignment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_role_assignment.call(this, bstrRoleAssignmentName, ppRoleAssignment)
    end
    def open_role_assignment(this : IAzApplication3*, bstrRoleAssignmentName : Win32cr::Foundation::BSTR, ppRoleAssignment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_role_assignment.call(this, bstrRoleAssignmentName, ppRoleAssignment)
    end
    def delete_role_assignment(this : IAzApplication3*, bstrRoleAssignmentName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role_assignment.call(this, bstrRoleAssignmentName)
    end
    def get_BizRulesEnabled(this : IAzApplication3*, pbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRulesEnabled.call(this, pbEnabled)
    end
    def put_BizRulesEnabled(this : IAzApplication3*, bEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRulesEnabled.call(this, bEnabled)
    end

  end

  @[Extern]
  record IAzOperation2Vtbl,
    query_interface : Proc(IAzOperation2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzOperation2*, UInt32),
    release : Proc(IAzOperation2*, UInt32),
    get_type_info_count : Proc(IAzOperation2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzOperation2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzOperation2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzOperation2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzOperation2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzOperation2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzOperation2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzOperation2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzOperation2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzOperation2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OperationID : Proc(IAzOperation2*, Int32*, Win32cr::Foundation::HRESULT),
    put_OperationID : Proc(IAzOperation2*, Int32, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzOperation2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzOperation2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzOperation2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzOperation2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    role_assignments : Proc(IAzOperation2*, Win32cr::Foundation::BSTR, Int16, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzOperation2, lpVtbl : IAzOperation2Vtbl* do
    GUID = LibC::GUID.new(0x1f5ea01f_u32, 0x44a2_u16, 0x4184_u16, StaticArray[0x9c_u8, 0x48_u8, 0xa7_u8, 0x5b_u8, 0x4d_u8, 0xcc_u8, 0x8c_u8, 0xcc_u8])
    def query_interface(this : IAzOperation2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzOperation2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzOperation2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzOperation2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzOperation2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzOperation2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzOperation2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzOperation2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzOperation2*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzOperation2*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzOperation2*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzOperation2*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzOperation2*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_OperationID(this : IAzOperation2*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OperationID.call(this, plProp)
    end
    def put_OperationID(this : IAzOperation2*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OperationID.call(this, lProp)
    end
    def get_Writable(this : IAzOperation2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzOperation2*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzOperation2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzOperation2*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def role_assignments(this : IAzOperation2*, bstrScopeName : Win32cr::Foundation::BSTR, bRecursive : Int16, ppRoleAssignments : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.role_assignments.call(this, bstrScopeName, bRecursive, ppRoleAssignments)
    end

  end

  @[Extern]
  record IAzRoleDefinitionsVtbl,
    query_interface : Proc(IAzRoleDefinitions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzRoleDefinitions*, UInt32),
    release : Proc(IAzRoleDefinitions*, UInt32),
    get_type_info_count : Proc(IAzRoleDefinitions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzRoleDefinitions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzRoleDefinitions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzRoleDefinitions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzRoleDefinitions*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzRoleDefinitions*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzRoleDefinitions*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzRoleDefinitions, lpVtbl : IAzRoleDefinitionsVtbl* do
    GUID = LibC::GUID.new(0x881f25a5_u32, 0xd755_u16, 0x4550_u16, StaticArray[0x95_u8, 0x7a_u8, 0xd5_u8, 0x3_u8, 0xa3_u8, 0xb3_u8, 0x40_u8, 0x1_u8])
    def query_interface(this : IAzRoleDefinitions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzRoleDefinitions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzRoleDefinitions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzRoleDefinitions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzRoleDefinitions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzRoleDefinitions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzRoleDefinitions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzRoleDefinitions*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzRoleDefinitions*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzRoleDefinitions*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzRoleDefinitionVtbl,
    query_interface : Proc(IAzRoleDefinition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzRoleDefinition*, UInt32),
    release : Proc(IAzRoleDefinition*, UInt32),
    get_type_info_count : Proc(IAzRoleDefinition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzRoleDefinition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzRoleDefinition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzRoleDefinition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRule : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRule : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleLanguage : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleLanguage : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleImportedPath : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleImportedPath : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsRoleDefinition : Proc(IAzRoleDefinition*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_IsRoleDefinition : Proc(IAzRoleDefinition*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzRoleDefinition*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzRoleDefinition*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_operation : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_task : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzRoleDefinition*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzRoleDefinition*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzRoleDefinition*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzRoleDefinition*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzRoleDefinition*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzRoleDefinition*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    role_assignments : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Int16, Void**, Win32cr::Foundation::HRESULT),
    add_role_definition : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete_role_definition : Proc(IAzRoleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RoleDefinitions : Proc(IAzRoleDefinition*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzRoleDefinition, lpVtbl : IAzRoleDefinitionVtbl* do
    GUID = LibC::GUID.new(0xd97fcea1_u32, 0x2599_u16, 0x44f1_u16, StaticArray[0x9f_u8, 0xc3_u8, 0x58_u8, 0xe9_u8, 0xfb_u8, 0xe0_u8, 0x94_u8, 0x66_u8])
    def query_interface(this : IAzRoleDefinition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzRoleDefinition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzRoleDefinition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzRoleDefinition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzRoleDefinition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzRoleDefinition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzRoleDefinition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzRoleDefinition*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzRoleDefinition*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzRoleDefinition*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzRoleDefinition*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzRoleDefinition*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzRoleDefinition*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_BizRule(this : IAzRoleDefinition*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRule.call(this, pbstrProp)
    end
    def put_BizRule(this : IAzRoleDefinition*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRule.call(this, bstrProp)
    end
    def get_BizRuleLanguage(this : IAzRoleDefinition*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleLanguage.call(this, pbstrProp)
    end
    def put_BizRuleLanguage(this : IAzRoleDefinition*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleLanguage.call(this, bstrProp)
    end
    def get_BizRuleImportedPath(this : IAzRoleDefinition*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleImportedPath.call(this, pbstrProp)
    end
    def put_BizRuleImportedPath(this : IAzRoleDefinition*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleImportedPath.call(this, bstrProp)
    end
    def get_IsRoleDefinition(this : IAzRoleDefinition*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsRoleDefinition.call(this, pfProp)
    end
    def put_IsRoleDefinition(this : IAzRoleDefinition*, fProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsRoleDefinition.call(this, fProp)
    end
    def get_Operations(this : IAzRoleDefinition*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, pvarProp)
    end
    def get_Tasks(this : IAzRoleDefinition*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, pvarProp)
    end
    def add_operation(this : IAzRoleDefinition*, bstrOp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_operation.call(this, bstrOp, varReserved)
    end
    def delete_operation(this : IAzRoleDefinition*, bstrOp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrOp, varReserved)
    end
    def add_task(this : IAzRoleDefinition*, bstrTask : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_task.call(this, bstrTask, varReserved)
    end
    def delete_task(this : IAzRoleDefinition*, bstrTask : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTask, varReserved)
    end
    def get_Writable(this : IAzRoleDefinition*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzRoleDefinition*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzRoleDefinition*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzRoleDefinition*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzRoleDefinition*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzRoleDefinition*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def role_assignments(this : IAzRoleDefinition*, bstrScopeName : Win32cr::Foundation::BSTR, bRecursive : Int16, ppRoleAssignments : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.role_assignments.call(this, bstrScopeName, bRecursive, ppRoleAssignments)
    end
    def add_role_definition(this : IAzRoleDefinition*, bstrRoleDefinition : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_role_definition.call(this, bstrRoleDefinition)
    end
    def delete_role_definition(this : IAzRoleDefinition*, bstrRoleDefinition : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role_definition.call(this, bstrRoleDefinition)
    end
    def get_RoleDefinitions(this : IAzRoleDefinition*, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleDefinitions.call(this, ppRoleDefinitions)
    end

  end

  @[Extern]
  record IAzRoleAssignmentVtbl,
    query_interface : Proc(IAzRoleAssignment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzRoleAssignment*, UInt32),
    release : Proc(IAzRoleAssignment*, UInt32),
    get_type_info_count : Proc(IAzRoleAssignment*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzRoleAssignment*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzRoleAssignment*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzRoleAssignment*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_app_member : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_app_member : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_task : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_operation : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzRoleAssignment*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzRoleAssignment*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzRoleAssignment*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AppMembers : Proc(IAzRoleAssignment*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Members : Proc(IAzRoleAssignment*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzRoleAssignment*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzRoleAssignment*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzRoleAssignment*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzRoleAssignment*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzRoleAssignment*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member_name : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member_name : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MembersName : Proc(IAzRoleAssignment*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_role_definition : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete_role_definition : Proc(IAzRoleAssignment*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RoleDefinitions : Proc(IAzRoleAssignment*, Void**, Win32cr::Foundation::HRESULT),
    get_Scope : Proc(IAzRoleAssignment*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzRoleAssignment, lpVtbl : IAzRoleAssignmentVtbl* do
    GUID = LibC::GUID.new(0x55647d31_u32, 0xd5a_u16, 0x4fa3_u16, StaticArray[0xb4_u8, 0xac_u8, 0x2b_u8, 0x5f_u8, 0x9a_u8, 0xd5_u8, 0xab_u8, 0x76_u8])
    def query_interface(this : IAzRoleAssignment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzRoleAssignment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzRoleAssignment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzRoleAssignment*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzRoleAssignment*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzRoleAssignment*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzRoleAssignment*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzRoleAssignment*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzRoleAssignment*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzRoleAssignment*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzRoleAssignment*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzRoleAssignment*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzRoleAssignment*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def add_app_member(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_app_member.call(this, bstrProp, varReserved)
    end
    def delete_app_member(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_app_member.call(this, bstrProp, varReserved)
    end
    def add_task(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_task.call(this, bstrProp, varReserved)
    end
    def delete_task(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrProp, varReserved)
    end
    def add_operation(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_operation.call(this, bstrProp, varReserved)
    end
    def delete_operation(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrProp, varReserved)
    end
    def add_member(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member.call(this, bstrProp, varReserved)
    end
    def delete_member(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member.call(this, bstrProp, varReserved)
    end
    def get_Writable(this : IAzRoleAssignment*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzRoleAssignment*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzRoleAssignment*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def get_AppMembers(this : IAzRoleAssignment*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppMembers.call(this, pvarProp)
    end
    def get_Members(this : IAzRoleAssignment*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Members.call(this, pvarProp)
    end
    def get_Operations(this : IAzRoleAssignment*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, pvarProp)
    end
    def get_Tasks(this : IAzRoleAssignment*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, pvarProp)
    end
    def add_property_item(this : IAzRoleAssignment*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzRoleAssignment*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzRoleAssignment*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def add_member_name(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member_name.call(this, bstrProp, varReserved)
    end
    def delete_member_name(this : IAzRoleAssignment*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member_name.call(this, bstrProp, varReserved)
    end
    def get_MembersName(this : IAzRoleAssignment*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MembersName.call(this, pvarProp)
    end
    def add_role_definition(this : IAzRoleAssignment*, bstrRoleDefinition : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_role_definition.call(this, bstrRoleDefinition)
    end
    def delete_role_definition(this : IAzRoleAssignment*, bstrRoleDefinition : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_role_definition.call(this, bstrRoleDefinition)
    end
    def get_RoleDefinitions(this : IAzRoleAssignment*, ppRoleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoleDefinitions.call(this, ppRoleDefinitions)
    end
    def get_Scope(this : IAzRoleAssignment*, ppScope : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scope.call(this, ppScope)
    end

  end

  @[Extern]
  record IAzRoleAssignmentsVtbl,
    query_interface : Proc(IAzRoleAssignments*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzRoleAssignments*, UInt32),
    release : Proc(IAzRoleAssignments*, UInt32),
    get_type_info_count : Proc(IAzRoleAssignments*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzRoleAssignments*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzRoleAssignments*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzRoleAssignments*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IAzRoleAssignments*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IAzRoleAssignments*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IAzRoleAssignments*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzRoleAssignments, lpVtbl : IAzRoleAssignmentsVtbl* do
    GUID = LibC::GUID.new(0x9c80b900_u32, 0xfceb_u16, 0x4d73_u16, StaticArray[0xa0_u8, 0xf4_u8, 0xc8_u8, 0x3b_u8, 0xb_u8, 0xbf_u8, 0x24_u8, 0x81_u8])
    def query_interface(this : IAzRoleAssignments*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzRoleAssignments*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzRoleAssignments*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzRoleAssignments*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzRoleAssignments*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzRoleAssignments*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzRoleAssignments*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IAzRoleAssignments*, index : Int32, pvarObtPtr : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pvarObtPtr)
    end
    def get_Count(this : IAzRoleAssignments*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IAzRoleAssignments*, ppEnumPtr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumPtr)
    end

  end

  @[Extern]
  record IAzPrincipalLocatorVtbl,
    query_interface : Proc(IAzPrincipalLocator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzPrincipalLocator*, UInt32),
    release : Proc(IAzPrincipalLocator*, UInt32),
    get_type_info_count : Proc(IAzPrincipalLocator*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzPrincipalLocator*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzPrincipalLocator*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzPrincipalLocator*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_NameResolver : Proc(IAzPrincipalLocator*, Void**, Win32cr::Foundation::HRESULT),
    get_ObjectPicker : Proc(IAzPrincipalLocator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzPrincipalLocator, lpVtbl : IAzPrincipalLocatorVtbl* do
    GUID = LibC::GUID.new(0xe5c3507d_u32, 0xad6a_u16, 0x4992_u16, StaticArray[0x9c_u8, 0x7f_u8, 0x74_u8, 0xab_u8, 0x48_u8, 0xb_u8, 0x44_u8, 0xcc_u8])
    def query_interface(this : IAzPrincipalLocator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzPrincipalLocator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzPrincipalLocator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzPrincipalLocator*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzPrincipalLocator*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzPrincipalLocator*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzPrincipalLocator*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_NameResolver(this : IAzPrincipalLocator*, ppNameResolver : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NameResolver.call(this, ppNameResolver)
    end
    def get_ObjectPicker(this : IAzPrincipalLocator*, ppObjectPicker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ObjectPicker.call(this, ppObjectPicker)
    end

  end

  @[Extern]
  record IAzNameResolverVtbl,
    query_interface : Proc(IAzNameResolver*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzNameResolver*, UInt32),
    release : Proc(IAzNameResolver*, UInt32),
    get_type_info_count : Proc(IAzNameResolver*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzNameResolver*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzNameResolver*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzNameResolver*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    name_from_sid : Proc(IAzNameResolver*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    names_from_sids : Proc(IAzNameResolver*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzNameResolver, lpVtbl : IAzNameResolverVtbl* do
    GUID = LibC::GUID.new(0x504d0f15_u32, 0x73e2_u16, 0x43df_u16, StaticArray[0xa8_u8, 0x70_u8, 0xa6_u8, 0x4f_u8, 0x40_u8, 0x71_u8, 0x4f_u8, 0x53_u8])
    def query_interface(this : IAzNameResolver*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzNameResolver*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzNameResolver*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzNameResolver*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzNameResolver*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzNameResolver*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzNameResolver*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def name_from_sid(this : IAzNameResolver*, bstrSid : Win32cr::Foundation::BSTR, pSidType : Int32*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.name_from_sid.call(this, bstrSid, pSidType, pbstrName)
    end
    def names_from_sids(this : IAzNameResolver*, vSids : Win32cr::System::Com::VARIANT, pvSidTypes : Win32cr::System::Com::VARIANT*, pvNames : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.names_from_sids.call(this, vSids, pvSidTypes, pvNames)
    end

  end

  @[Extern]
  record IAzObjectPickerVtbl,
    query_interface : Proc(IAzObjectPicker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzObjectPicker*, UInt32),
    release : Proc(IAzObjectPicker*, UInt32),
    get_type_info_count : Proc(IAzObjectPicker*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzObjectPicker*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzObjectPicker*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzObjectPicker*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_principals : Proc(IAzObjectPicker*, Win32cr::Foundation::HWND, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzObjectPicker*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzObjectPicker, lpVtbl : IAzObjectPickerVtbl* do
    GUID = LibC::GUID.new(0x63130a48_u32, 0x699a_u16, 0x42d8_u16, StaticArray[0xbf_u8, 0x1_u8, 0xc6_u8, 0x2a_u8, 0xc3_u8, 0xfb_u8, 0x79_u8, 0xf9_u8])
    def query_interface(this : IAzObjectPicker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzObjectPicker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzObjectPicker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzObjectPicker*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzObjectPicker*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzObjectPicker*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzObjectPicker*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_principals(this : IAzObjectPicker*, hParentWnd : Win32cr::Foundation::HWND, bstrTitle : Win32cr::Foundation::BSTR, pvSidTypes : Win32cr::System::Com::VARIANT*, pvNames : Win32cr::System::Com::VARIANT*, pvSids : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_principals.call(this, hParentWnd, bstrTitle, pvSidTypes, pvNames, pvSids)
    end
    def get_Name(this : IAzObjectPicker*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end

  end

  @[Extern]
  record IAzApplicationGroup2Vtbl,
    query_interface : Proc(IAzApplicationGroup2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzApplicationGroup2*, UInt32),
    release : Proc(IAzApplicationGroup2*, UInt32),
    get_type_info_count : Proc(IAzApplicationGroup2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzApplicationGroup2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzApplicationGroup2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzApplicationGroup2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IAzApplicationGroup2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(IAzApplicationGroup2*, Int32, Win32cr::Foundation::HRESULT),
    get_LdapQuery : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LdapQuery : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AppMembers : Proc(IAzApplicationGroup2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_AppNonMembers : Proc(IAzApplicationGroup2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Members : Proc(IAzApplicationGroup2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_NonMembers : Proc(IAzApplicationGroup2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_app_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_app_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_app_non_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_app_non_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_non_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_non_member : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzApplicationGroup2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzApplicationGroup2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzApplicationGroup2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzApplicationGroup2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzApplicationGroup2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_member_name : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_member_name : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_non_member_name : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_non_member_name : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MembersName : Proc(IAzApplicationGroup2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_NonMembersName : Proc(IAzApplicationGroup2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_BizRule : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRule : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleLanguage : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleLanguage : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleImportedPath : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleImportedPath : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    role_assignments : Proc(IAzApplicationGroup2*, Win32cr::Foundation::BSTR, Int16, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzApplicationGroup2, lpVtbl : IAzApplicationGroup2Vtbl* do
    GUID = LibC::GUID.new(0x3f0613fc_u32, 0xb71a_u16, 0x464e_u16, StaticArray[0xa1_u8, 0x1d_u8, 0x5b_u8, 0x88_u8, 0x1a_u8, 0x56_u8, 0xce_u8, 0xfa_u8])
    def query_interface(this : IAzApplicationGroup2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzApplicationGroup2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzApplicationGroup2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzApplicationGroup2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzApplicationGroup2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzApplicationGroup2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzApplicationGroup2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzApplicationGroup2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzApplicationGroup2*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Type(this : IAzApplicationGroup2*, plProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, plProp)
    end
    def put_Type(this : IAzApplicationGroup2*, lProp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, lProp)
    end
    def get_LdapQuery(this : IAzApplicationGroup2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LdapQuery.call(this, pbstrProp)
    end
    def put_LdapQuery(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LdapQuery.call(this, bstrProp)
    end
    def get_AppMembers(this : IAzApplicationGroup2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppMembers.call(this, pvarProp)
    end
    def get_AppNonMembers(this : IAzApplicationGroup2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppNonMembers.call(this, pvarProp)
    end
    def get_Members(this : IAzApplicationGroup2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Members.call(this, pvarProp)
    end
    def get_NonMembers(this : IAzApplicationGroup2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonMembers.call(this, pvarProp)
    end
    def get_Description(this : IAzApplicationGroup2*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzApplicationGroup2*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def add_app_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_app_member.call(this, bstrProp, varReserved)
    end
    def delete_app_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_app_member.call(this, bstrProp, varReserved)
    end
    def add_app_non_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_app_non_member.call(this, bstrProp, varReserved)
    end
    def delete_app_non_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_app_non_member.call(this, bstrProp, varReserved)
    end
    def add_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member.call(this, bstrProp, varReserved)
    end
    def delete_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member.call(this, bstrProp, varReserved)
    end
    def add_non_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_non_member.call(this, bstrProp, varReserved)
    end
    def delete_non_member(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_non_member.call(this, bstrProp, varReserved)
    end
    def get_Writable(this : IAzApplicationGroup2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzApplicationGroup2*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzApplicationGroup2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzApplicationGroup2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzApplicationGroup2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzApplicationGroup2*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def add_member_name(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_member_name.call(this, bstrProp, varReserved)
    end
    def delete_member_name(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_member_name.call(this, bstrProp, varReserved)
    end
    def add_non_member_name(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_non_member_name.call(this, bstrProp, varReserved)
    end
    def delete_non_member_name(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_non_member_name.call(this, bstrProp, varReserved)
    end
    def get_MembersName(this : IAzApplicationGroup2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MembersName.call(this, pvarProp)
    end
    def get_NonMembersName(this : IAzApplicationGroup2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonMembersName.call(this, pvarProp)
    end
    def get_BizRule(this : IAzApplicationGroup2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRule.call(this, pbstrProp)
    end
    def put_BizRule(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRule.call(this, bstrProp)
    end
    def get_BizRuleLanguage(this : IAzApplicationGroup2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleLanguage.call(this, pbstrProp)
    end
    def put_BizRuleLanguage(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleLanguage.call(this, bstrProp)
    end
    def get_BizRuleImportedPath(this : IAzApplicationGroup2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleImportedPath.call(this, pbstrProp)
    end
    def put_BizRuleImportedPath(this : IAzApplicationGroup2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleImportedPath.call(this, bstrProp)
    end
    def role_assignments(this : IAzApplicationGroup2*, bstrScopeName : Win32cr::Foundation::BSTR, bRecursive : Int16, ppRoleAssignments : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.role_assignments.call(this, bstrScopeName, bRecursive, ppRoleAssignments)
    end

  end

  @[Extern]
  record IAzTask2Vtbl,
    query_interface : Proc(IAzTask2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAzTask2*, UInt32),
    release : Proc(IAzTask2*, UInt32),
    get_type_info_count : Proc(IAzTask2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAzTask2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAzTask2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAzTask2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAzTask2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IAzTask2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationData : Proc(IAzTask2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationData : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRule : Proc(IAzTask2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRule : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleLanguage : Proc(IAzTask2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleLanguage : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BizRuleImportedPath : Proc(IAzTask2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BizRuleImportedPath : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsRoleDefinition : Proc(IAzTask2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_IsRoleDefinition : Proc(IAzTask2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Operations : Proc(IAzTask2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Tasks : Proc(IAzTask2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add_operation : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_operation : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_task : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_task : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Writable : Proc(IAzTask2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IAzTask2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IAzTask2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_property_item : Proc(IAzTask2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_property_item : Proc(IAzTask2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit : Proc(IAzTask2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    role_assignments : Proc(IAzTask2*, Win32cr::Foundation::BSTR, Int16, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAzTask2, lpVtbl : IAzTask2Vtbl* do
    GUID = LibC::GUID.new(0x3a9a5ee_u32, 0x48c8_u16, 0x4832_u16, StaticArray[0x90_u8, 0x25_u8, 0xaa_u8, 0xd5_u8, 0x3_u8, 0xc4_u8, 0x65_u8, 0x26_u8])
    def query_interface(this : IAzTask2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAzTask2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAzTask2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAzTask2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAzTask2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAzTask2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAzTask2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IAzTask2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IAzTask2*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Description(this : IAzTask2*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IAzTask2*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_ApplicationData(this : IAzTask2*, pbstrApplicationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationData.call(this, pbstrApplicationData)
    end
    def put_ApplicationData(this : IAzTask2*, bstrApplicationData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationData.call(this, bstrApplicationData)
    end
    def get_BizRule(this : IAzTask2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRule.call(this, pbstrProp)
    end
    def put_BizRule(this : IAzTask2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRule.call(this, bstrProp)
    end
    def get_BizRuleLanguage(this : IAzTask2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleLanguage.call(this, pbstrProp)
    end
    def put_BizRuleLanguage(this : IAzTask2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleLanguage.call(this, bstrProp)
    end
    def get_BizRuleImportedPath(this : IAzTask2*, pbstrProp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BizRuleImportedPath.call(this, pbstrProp)
    end
    def put_BizRuleImportedPath(this : IAzTask2*, bstrProp : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BizRuleImportedPath.call(this, bstrProp)
    end
    def get_IsRoleDefinition(this : IAzTask2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsRoleDefinition.call(this, pfProp)
    end
    def put_IsRoleDefinition(this : IAzTask2*, fProp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsRoleDefinition.call(this, fProp)
    end
    def get_Operations(this : IAzTask2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operations.call(this, pvarProp)
    end
    def get_Tasks(this : IAzTask2*, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tasks.call(this, pvarProp)
    end
    def add_operation(this : IAzTask2*, bstrOp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_operation.call(this, bstrOp, varReserved)
    end
    def delete_operation(this : IAzTask2*, bstrOp : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_operation.call(this, bstrOp, varReserved)
    end
    def add_task(this : IAzTask2*, bstrTask : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_task.call(this, bstrTask, varReserved)
    end
    def delete_task(this : IAzTask2*, bstrTask : Win32cr::Foundation::BSTR, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, bstrTask, varReserved)
    end
    def get_Writable(this : IAzTask2*, pfProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Writable.call(this, pfProp)
    end
    def get_property(this : IAzTask2*, lPropId : Int32, varReserved : Win32cr::System::Com::VARIANT, pvarProp : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, lPropId, varReserved, pvarProp)
    end
    def set_property(this : IAzTask2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, lPropId, varProp, varReserved)
    end
    def add_property_item(this : IAzTask2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_item.call(this, lPropId, varProp, varReserved)
    end
    def delete_property_item(this : IAzTask2*, lPropId : Int32, varProp : Win32cr::System::Com::VARIANT, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_item.call(this, lPropId, varProp, varReserved)
    end
    def submit(this : IAzTask2*, lFlags : Int32, varReserved : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, lFlags, varReserved)
    end
    def role_assignments(this : IAzTask2*, bstrScopeName : Win32cr::Foundation::BSTR, bRecursive : Int16, ppRoleAssignments : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.role_assignments.call(this, bstrScopeName, bRecursive, ppRoleAssignments)
    end

  end

  def authzAccessCheck(flags : Win32cr::Security::Authorization::AUTHZ_ACCESS_CHECK_FLAGS, hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, optional_security_descriptor_array : Win32cr::Security::PSECURITY_DESCRIPTOR*, optional_security_descriptor_count : UInt32, pReply : Win32cr::Security::Authorization::AUTHZ_ACCESS_REPLY*, phAccessCheckResults : LibC::IntPtrT*) : Win32cr::Foundation::BOOL
    C.AuthzAccessCheck(flags, hAuthzClientContext, pRequest, hAuditEvent, pSecurityDescriptor, optional_security_descriptor_array, optional_security_descriptor_count, pReply, phAccessCheckResults)
  end

  def authzCachedAccessCheck(flags : UInt32, hAccessCheckResults : Win32cr::Security::Authorization::AUTHZ_ACCESS_CHECK_RESULTS_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE, pReply : Win32cr::Security::Authorization::AUTHZ_ACCESS_REPLY*) : Win32cr::Foundation::BOOL
    C.AuthzCachedAccessCheck(flags, hAccessCheckResults, pRequest, hAuditEvent, pReply)
  end

  def authzOpenObjectAudit(flags : UInt32, hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, optional_security_descriptor_array : Win32cr::Security::PSECURITY_DESCRIPTOR*, optional_security_descriptor_count : UInt32, pReply : Win32cr::Security::Authorization::AUTHZ_ACCESS_REPLY*) : Win32cr::Foundation::BOOL
    C.AuthzOpenObjectAudit(flags, hAuthzClientContext, pRequest, hAuditEvent, pSecurityDescriptor, optional_security_descriptor_array, optional_security_descriptor_count, pReply)
  end

  def authzFreeHandle(hAccessCheckResults : Win32cr::Security::Authorization::AUTHZ_ACCESS_CHECK_RESULTS_HANDLE) : Win32cr::Foundation::BOOL
    C.AuthzFreeHandle(hAccessCheckResults)
  end

  def authzInitializeResourceManager(flags : UInt32, pfnDynamicAccessCheck : Win32cr::Security::Authorization::PFN_AUTHZ_DYNAMIC_ACCESS_CHECK, pfnComputeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS, pfnFreeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_FREE_DYNAMIC_GROUPS, szResourceManagerName : Win32cr::Foundation::PWSTR, phAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzInitializeResourceManager(flags, pfnDynamicAccessCheck, pfnComputeDynamicGroups, pfnFreeDynamicGroups, szResourceManagerName, phAuthzResourceManager)
  end

  def authzInitializeResourceManagerEx(flags : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_FLAGS, pAuthzInitInfo : Win32cr::Security::Authorization::AUTHZ_INIT_INFO*, phAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzInitializeResourceManagerEx(flags, pAuthzInitInfo, phAuthzResourceManager)
  end

  def authzInitializeRemoteResourceManager(pRpcInitInfo : Win32cr::Security::Authorization::AUTHZ_RPC_INIT_INFO_CLIENT*, phAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzInitializeRemoteResourceManager(pRpcInitInfo, phAuthzResourceManager)
  end

  def authzFreeResourceManager(hAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE) : Win32cr::Foundation::BOOL
    C.AuthzFreeResourceManager(hAuthzResourceManager)
  end

  def authzInitializeContextFromToken(flags : UInt32, token_handle : Win32cr::Foundation::HANDLE, hAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, identifier : Win32cr::Foundation::LUID, dynamic_group_args : Void*, phAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzInitializeContextFromToken(flags, token_handle, hAuthzResourceManager, pExpirationTime, identifier, dynamic_group_args, phAuthzClientContext)
  end

  def authzInitializeContextFromSid(flags : UInt32, user_sid : Win32cr::Foundation::PSID, hAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, identifier : Win32cr::Foundation::LUID, dynamic_group_args : Void*, phAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzInitializeContextFromSid(flags, user_sid, hAuthzResourceManager, pExpirationTime, identifier, dynamic_group_args, phAuthzClientContext)
  end

  def authzInitializeContextFromAuthzContext(flags : UInt32, hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, identifier : Win32cr::Foundation::LUID, dynamic_group_args : Void*, phNewAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzInitializeContextFromAuthzContext(flags, hAuthzClientContext, pExpirationTime, identifier, dynamic_group_args, phNewAuthzClientContext)
  end

  def authzInitializeCompoundContext(user_context : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, device_context : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, phCompoundContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzInitializeCompoundContext(user_context, device_context, phCompoundContext)
  end

  def authzAddSidsToContext(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, sids : Win32cr::Security::SID_AND_ATTRIBUTES*, sid_count : UInt32, restricted_sids : Win32cr::Security::SID_AND_ATTRIBUTES*, restricted_sid_count : UInt32, phNewAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL
    C.AuthzAddSidsToContext(hAuthzClientContext, sids, sid_count, restricted_sids, restricted_sid_count, phNewAuthzClientContext)
  end

  def authzModifySecurityAttributes(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pOperations : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pAttributes : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*) : Win32cr::Foundation::BOOL
    C.AuthzModifySecurityAttributes(hAuthzClientContext, pOperations, pAttributes)
  end

  def authzModifyClaims(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, claim_class : Win32cr::Security::Authorization::AUTHZ_CONTEXT_INFORMATION_CLASS, pClaimOperations : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pClaims : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*) : Win32cr::Foundation::BOOL
    C.AuthzModifyClaims(hAuthzClientContext, claim_class, pClaimOperations, pClaims)
  end

  def authzModifySids(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, sid_class : Win32cr::Security::Authorization::AUTHZ_CONTEXT_INFORMATION_CLASS, pSidOperations : Win32cr::Security::Authorization::AUTHZ_SID_OPERATION*, pSids : Win32cr::Security::TOKEN_GROUPS*) : Win32cr::Foundation::BOOL
    C.AuthzModifySids(hAuthzClientContext, sid_class, pSidOperations, pSids)
  end

  def authzSetAppContainerInformation(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pAppContainerSid : Win32cr::Foundation::PSID, capability_count : UInt32, pCapabilitySids : Win32cr::Security::SID_AND_ATTRIBUTES*) : Win32cr::Foundation::BOOL
    C.AuthzSetAppContainerInformation(hAuthzClientContext, pAppContainerSid, capability_count, pCapabilitySids)
  end

  def authzGetInformationFromContext(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, info_class : Win32cr::Security::Authorization::AUTHZ_CONTEXT_INFORMATION_CLASS, buffer_size : UInt32, pSizeRequired : UInt32*, buffer : Void*) : Win32cr::Foundation::BOOL
    C.AuthzGetInformationFromContext(hAuthzClientContext, info_class, buffer_size, pSizeRequired, buffer)
  end

  def authzFreeContext(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE) : Win32cr::Foundation::BOOL
    C.AuthzFreeContext(hAuthzClientContext)
  end

  def authzInitializeObjectAccessAuditEvent(flags : Win32cr::Security::Authorization::AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS, hAuditEventType : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_HANDLE, szOperationType : Win32cr::Foundation::PWSTR, szObjectType : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szAdditionalInfo : Win32cr::Foundation::PWSTR, phAuditEvent : LibC::IntPtrT*, dwAdditionalParameterCount : UInt32) : Win32cr::Foundation::BOOL
    C.AuthzInitializeObjectAccessAuditEvent(flags, hAuditEventType, szOperationType, szObjectType, szObjectName, szAdditionalInfo, phAuditEvent, dwAdditionalParameterCount)
  end

  def authzInitializeObjectAccessAuditEvent2(flags : UInt32, hAuditEventType : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_HANDLE, szOperationType : Win32cr::Foundation::PWSTR, szObjectType : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szAdditionalInfo : Win32cr::Foundation::PWSTR, szAdditionalInfo2 : Win32cr::Foundation::PWSTR, phAuditEvent : LibC::IntPtrT*, dwAdditionalParameterCount : UInt32) : Win32cr::Foundation::BOOL
    C.AuthzInitializeObjectAccessAuditEvent2(flags, hAuditEventType, szOperationType, szObjectType, szObjectName, szAdditionalInfo, szAdditionalInfo2, phAuditEvent, dwAdditionalParameterCount)
  end

  def authzFreeAuditEvent(hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE) : Win32cr::Foundation::BOOL
    C.AuthzFreeAuditEvent(hAuditEvent)
  end

  def authzEvaluateSacl(authz_client_context : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, sacl : Win32cr::Security::ACL*, granted_access : UInt32, access_granted : Win32cr::Foundation::BOOL, pbGenerateAudit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.AuthzEvaluateSacl(authz_client_context, pRequest, sacl, granted_access, access_granted, pbGenerateAudit)
  end

  def authzInstallSecurityEventSource(dwFlags : UInt32, pRegistration : Win32cr::Security::Authorization::AUTHZ_SOURCE_SCHEMA_REGISTRATION*) : Win32cr::Foundation::BOOL
    C.AuthzInstallSecurityEventSource(dwFlags, pRegistration)
  end

  def authzUninstallSecurityEventSource(dwFlags : UInt32, szEventSourceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.AuthzUninstallSecurityEventSource(dwFlags, szEventSourceName)
  end

  def authzEnumerateSecurityEventSources(dwFlags : UInt32, buffer : Win32cr::Security::Authorization::AUTHZ_SOURCE_SCHEMA_REGISTRATION*, pdwCount : UInt32*, pdwLength : UInt32*) : Win32cr::Foundation::BOOL
    C.AuthzEnumerateSecurityEventSources(dwFlags, buffer, pdwCount, pdwLength)
  end

  def authzRegisterSecurityEventSource(dwFlags : UInt32, szEventSourceName : Win32cr::Foundation::PWSTR, phEventProvider : LibC::IntPtrT*) : Win32cr::Foundation::BOOL
    C.AuthzRegisterSecurityEventSource(dwFlags, szEventSourceName, phEventProvider)
  end

  def authzUnregisterSecurityEventSource(dwFlags : UInt32, phEventProvider : LibC::IntPtrT*) : Win32cr::Foundation::BOOL
    C.AuthzUnregisterSecurityEventSource(dwFlags, phEventProvider)
  end

  def authzReportSecurityEvent(dwFlags : UInt32, hEventProvider : Win32cr::Security::Authorization::AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, dwAuditId : UInt32, pUserSid : Win32cr::Foundation::PSID, dwCount : UInt32) : Win32cr::Foundation::BOOL
    C.AuthzReportSecurityEvent(dwFlags, hEventProvider, dwAuditId, pUserSid, dwCount)
  end

  def authzReportSecurityEventFromParams(dwFlags : UInt32, hEventProvider : Win32cr::Security::Authorization::AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, dwAuditId : UInt32, pUserSid : Win32cr::Foundation::PSID, pParams : Win32cr::Security::Authorization::AUDIT_PARAMS*) : Win32cr::Foundation::BOOL
    C.AuthzReportSecurityEventFromParams(dwFlags, hEventProvider, dwAuditId, pUserSid, pParams)
  end

  def authzRegisterCapChangeNotification(phCapChangeSubscription : Win32cr::Security::Authorization::AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__**, pfnCapChangeCallback : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, pCallbackContext : Void*) : Win32cr::Foundation::BOOL
    C.AuthzRegisterCapChangeNotification(phCapChangeSubscription, pfnCapChangeCallback, pCallbackContext)
  end

  def authzUnregisterCapChangeNotification(hCapChangeSubscription : Win32cr::Security::Authorization::AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__*) : Win32cr::Foundation::BOOL
    C.AuthzUnregisterCapChangeNotification(hCapChangeSubscription)
  end

  def authzFreeCentralAccessPolicyCache : Win32cr::Foundation::BOOL
    C.AuthzFreeCentralAccessPolicyCache
  end

  def setEntriesInAclA(cCountOfExplicitEntries : UInt32, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, old_acl : Win32cr::Security::ACL*, new_acl : Win32cr::Security::ACL**) : UInt32
    C.SetEntriesInAclA(cCountOfExplicitEntries, pListOfExplicitEntries, old_acl, new_acl)
  end

  def setEntriesInAclW(cCountOfExplicitEntries : UInt32, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, old_acl : Win32cr::Security::ACL*, new_acl : Win32cr::Security::ACL**) : UInt32
    C.SetEntriesInAclW(cCountOfExplicitEntries, pListOfExplicitEntries, old_acl, new_acl)
  end

  def getExplicitEntriesFromAclA(pacl : Win32cr::Security::ACL*, pcCountOfExplicitEntries : UInt32*, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A**) : UInt32
    C.GetExplicitEntriesFromAclA(pacl, pcCountOfExplicitEntries, pListOfExplicitEntries)
  end

  def getExplicitEntriesFromAclW(pacl : Win32cr::Security::ACL*, pcCountOfExplicitEntries : UInt32*, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W**) : UInt32
    C.GetExplicitEntriesFromAclW(pacl, pcCountOfExplicitEntries, pListOfExplicitEntries)
  end

  def getEffectiveRightsFromAclA(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pAccessRights : UInt32*) : UInt32
    C.GetEffectiveRightsFromAclA(pacl, pTrustee, pAccessRights)
  end

  def getEffectiveRightsFromAclW(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pAccessRights : UInt32*) : UInt32
    C.GetEffectiveRightsFromAclW(pacl, pTrustee, pAccessRights)
  end

  def getAuditedPermissionsFromAclA(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pSuccessfulAuditedRights : UInt32*, pFailedAuditRights : UInt32*) : UInt32
    C.GetAuditedPermissionsFromAclA(pacl, pTrustee, pSuccessfulAuditedRights, pFailedAuditRights)
  end

  def getAuditedPermissionsFromAclW(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pSuccessfulAuditedRights : UInt32*, pFailedAuditRights : UInt32*) : UInt32
    C.GetAuditedPermissionsFromAclW(pacl, pTrustee, pSuccessfulAuditedRights, pFailedAuditRights)
  end

  def getNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, ppsidOwner : Win32cr::Foundation::PSID*, ppsidGroup : Win32cr::Foundation::PSID*, ppDacl : Win32cr::Security::ACL**, ppSacl : Win32cr::Security::ACL**, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR
    C.GetNamedSecurityInfoA(pObjectName, object_type, security_info, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor)
  end

  def getNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, ppsidOwner : Win32cr::Foundation::PSID*, ppsidGroup : Win32cr::Foundation::PSID*, ppDacl : Win32cr::Security::ACL**, ppSacl : Win32cr::Security::ACL**, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR
    C.GetNamedSecurityInfoW(pObjectName, object_type, security_info, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor)
  end

  def getSecurityInfo(handle : Win32cr::Foundation::HANDLE, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, ppsidOwner : Win32cr::Foundation::PSID*, ppsidGroup : Win32cr::Foundation::PSID*, ppDacl : Win32cr::Security::ACL**, ppSacl : Win32cr::Security::ACL**, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR
    C.GetSecurityInfo(handle, object_type, security_info, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor)
  end

  def setNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, psidOwner : Win32cr::Foundation::PSID, psidGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*) : UInt32
    C.SetNamedSecurityInfoA(pObjectName, object_type, security_info, psidOwner, psidGroup, pDacl, pSacl)
  end

  def setNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, psidOwner : Win32cr::Foundation::PSID, psidGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*) : UInt32
    C.SetNamedSecurityInfoW(pObjectName, object_type, security_info, psidOwner, psidGroup, pDacl, pSacl)
  end

  def setSecurityInfo(handle : Win32cr::Foundation::HANDLE, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, psidOwner : Win32cr::Foundation::PSID, psidGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*) : UInt32
    C.SetSecurityInfo(handle, object_type, security_info, psidOwner, psidGroup, pDacl, pSacl)
  end

  def getInheritanceSourceA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, container : Win32cr::Foundation::BOOL, pObjectClassGuids : LibC::GUID**, guid_count : UInt32, pAcl : Win32cr::Security::ACL*, pfnArray : Win32cr::Security::Authorization::FN_OBJECT_MGR_FUNCTIONS*, pGenericMapping : Win32cr::Security::GENERIC_MAPPING*, pInheritArray : Win32cr::Security::Authorization::INHERITED_FROMA*) : UInt32
    C.GetInheritanceSourceA(pObjectName, object_type, security_info, container, pObjectClassGuids, guid_count, pAcl, pfnArray, pGenericMapping, pInheritArray)
  end

  def getInheritanceSourceW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, container : Win32cr::Foundation::BOOL, pObjectClassGuids : LibC::GUID**, guid_count : UInt32, pAcl : Win32cr::Security::ACL*, pfnArray : Win32cr::Security::Authorization::FN_OBJECT_MGR_FUNCTIONS*, pGenericMapping : Win32cr::Security::GENERIC_MAPPING*, pInheritArray : Win32cr::Security::Authorization::INHERITED_FROMW*) : UInt32
    C.GetInheritanceSourceW(pObjectName, object_type, security_info, container, pObjectClassGuids, guid_count, pAcl, pfnArray, pGenericMapping, pInheritArray)
  end

  def freeInheritedFromArray(pInheritArray : Win32cr::Security::Authorization::INHERITED_FROMW*, ace_cnt : UInt16, pfnArray : Win32cr::Security::Authorization::FN_OBJECT_MGR_FUNCTIONS*) : UInt32
    C.FreeInheritedFromArray(pInheritArray, ace_cnt, pfnArray)
  end

  def treeResetNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, keep_explicit : Win32cr::Foundation::BOOL, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32
    C.TreeResetNamedSecurityInfoA(pObjectName, object_type, security_info, pOwner, pGroup, pDacl, pSacl, keep_explicit, fnProgress, progress_invoke_setting, args)
  end

  def treeResetNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, keep_explicit : Win32cr::Foundation::BOOL, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32
    C.TreeResetNamedSecurityInfoW(pObjectName, object_type, security_info, pOwner, pGroup, pDacl, pSacl, keep_explicit, fnProgress, progress_invoke_setting, args)
  end

  def treeSetNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, dwAction : Win32cr::Security::Authorization::TREE_SEC_INFO, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32
    C.TreeSetNamedSecurityInfoA(pObjectName, object_type, security_info, pOwner, pGroup, pDacl, pSacl, dwAction, fnProgress, progress_invoke_setting, args)
  end

  def treeSetNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, dwAction : Win32cr::Security::Authorization::TREE_SEC_INFO, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32
    C.TreeSetNamedSecurityInfoW(pObjectName, object_type, security_info, pOwner, pGroup, pDacl, pSacl, dwAction, fnProgress, progress_invoke_setting, args)
  end

  def buildSecurityDescriptorA(pOwner : Win32cr::Security::Authorization::TRUSTEE_A*, pGroup : Win32cr::Security::Authorization::TRUSTEE_A*, cCountOfAccessEntries : UInt32, pListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, cCountOfAuditEntries : UInt32, pListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, pOldSD : Win32cr::Security::PSECURITY_DESCRIPTOR, pSizeNewSD : UInt32*, pNewSD : Win32cr::Security::PSECURITY_DESCRIPTOR*) : UInt32
    C.BuildSecurityDescriptorA(pOwner, pGroup, cCountOfAccessEntries, pListOfAccessEntries, cCountOfAuditEntries, pListOfAuditEntries, pOldSD, pSizeNewSD, pNewSD)
  end

  def buildSecurityDescriptorW(pOwner : Win32cr::Security::Authorization::TRUSTEE_W*, pGroup : Win32cr::Security::Authorization::TRUSTEE_W*, cCountOfAccessEntries : UInt32, pListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, cCountOfAuditEntries : UInt32, pListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, pOldSD : Win32cr::Security::PSECURITY_DESCRIPTOR, pSizeNewSD : UInt32*, pNewSD : Win32cr::Security::PSECURITY_DESCRIPTOR*) : UInt32
    C.BuildSecurityDescriptorW(pOwner, pGroup, cCountOfAccessEntries, pListOfAccessEntries, cCountOfAuditEntries, pListOfAuditEntries, pOldSD, pSizeNewSD, pNewSD)
  end

  def lookupSecurityDescriptorPartsA(ppOwner : Win32cr::Security::Authorization::TRUSTEE_A**, ppGroup : Win32cr::Security::Authorization::TRUSTEE_A**, pcCountOfAccessEntries : UInt32*, ppListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A**, pcCountOfAuditEntries : UInt32*, ppListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A**, pSD : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32
    C.LookupSecurityDescriptorPartsA(ppOwner, ppGroup, pcCountOfAccessEntries, ppListOfAccessEntries, pcCountOfAuditEntries, ppListOfAuditEntries, pSD)
  end

  def lookupSecurityDescriptorPartsW(ppOwner : Win32cr::Security::Authorization::TRUSTEE_W**, ppGroup : Win32cr::Security::Authorization::TRUSTEE_W**, pcCountOfAccessEntries : UInt32*, ppListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W**, pcCountOfAuditEntries : UInt32*, ppListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W**, pSD : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32
    C.LookupSecurityDescriptorPartsW(ppOwner, ppGroup, pcCountOfAccessEntries, ppListOfAccessEntries, pcCountOfAuditEntries, ppListOfAuditEntries, pSD)
  end

  def buildExplicitAccessWithNameA(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, pTrusteeName : Win32cr::Foundation::PSTR, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : Win32cr::Security::ACE_FLAGS) : Void
    C.BuildExplicitAccessWithNameA(pExplicitAccess, pTrusteeName, access_permissions, access_mode, inheritance)
  end

  def buildExplicitAccessWithNameW(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, pTrusteeName : Win32cr::Foundation::PWSTR, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : Win32cr::Security::ACE_FLAGS) : Void
    C.BuildExplicitAccessWithNameW(pExplicitAccess, pTrusteeName, access_permissions, access_mode, inheritance)
  end

  def buildImpersonateExplicitAccessWithNameA(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, pTrusteeName : Win32cr::Foundation::PSTR, pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : UInt32) : Void
    C.BuildImpersonateExplicitAccessWithNameA(pExplicitAccess, pTrusteeName, pTrustee, access_permissions, access_mode, inheritance)
  end

  def buildImpersonateExplicitAccessWithNameW(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, pTrusteeName : Win32cr::Foundation::PWSTR, pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : UInt32) : Void
    C.BuildImpersonateExplicitAccessWithNameW(pExplicitAccess, pTrusteeName, pTrustee, access_permissions, access_mode, inheritance)
  end

  def buildTrusteeWithNameA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pName : Win32cr::Foundation::PSTR) : Void
    C.BuildTrusteeWithNameA(pTrustee, pName)
  end

  def buildTrusteeWithNameW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pName : Win32cr::Foundation::PWSTR) : Void
    C.BuildTrusteeWithNameW(pTrustee, pName)
  end

  def buildImpersonateTrusteeA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pImpersonateTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Void
    C.BuildImpersonateTrusteeA(pTrustee, pImpersonateTrustee)
  end

  def buildImpersonateTrusteeW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pImpersonateTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Void
    C.BuildImpersonateTrusteeW(pTrustee, pImpersonateTrustee)
  end

  def buildTrusteeWithSidA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pSid : Win32cr::Foundation::PSID) : Void
    C.BuildTrusteeWithSidA(pTrustee, pSid)
  end

  def buildTrusteeWithSidW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pSid : Win32cr::Foundation::PSID) : Void
    C.BuildTrusteeWithSidW(pTrustee, pSid)
  end

  def buildTrusteeWithObjectsAndSidA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pObjSid : Win32cr::Security::Authorization::OBJECTS_AND_SID*, pObjectGuid : LibC::GUID*, pInheritedObjectGuid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Void
    C.BuildTrusteeWithObjectsAndSidA(pTrustee, pObjSid, pObjectGuid, pInheritedObjectGuid, pSid)
  end

  def buildTrusteeWithObjectsAndSidW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pObjSid : Win32cr::Security::Authorization::OBJECTS_AND_SID*, pObjectGuid : LibC::GUID*, pInheritedObjectGuid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Void
    C.BuildTrusteeWithObjectsAndSidW(pTrustee, pObjSid, pObjectGuid, pInheritedObjectGuid, pSid)
  end

  def buildTrusteeWithObjectsAndNameA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pObjName : Win32cr::Security::Authorization::OBJECTS_AND_NAME_A*, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, object_type_name : Win32cr::Foundation::PSTR, inherited_object_type_name : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR) : Void
    C.BuildTrusteeWithObjectsAndNameA(pTrustee, pObjName, object_type, object_type_name, inherited_object_type_name, name)
  end

  def buildTrusteeWithObjectsAndNameW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pObjName : Win32cr::Security::Authorization::OBJECTS_AND_NAME_W*, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, object_type_name : Win32cr::Foundation::PWSTR, inherited_object_type_name : Win32cr::Foundation::PWSTR, name : Win32cr::Foundation::PWSTR) : Void
    C.BuildTrusteeWithObjectsAndNameW(pTrustee, pObjName, object_type, object_type_name, inherited_object_type_name, name)
  end

  def getTrusteeNameA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Foundation::PSTR
    C.GetTrusteeNameA(pTrustee)
  end

  def getTrusteeNameW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Foundation::PWSTR
    C.GetTrusteeNameW(pTrustee)
  end

  def getTrusteeTypeA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::TRUSTEE_TYPE
    C.GetTrusteeTypeA(pTrustee)
  end

  def getTrusteeTypeW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::TRUSTEE_TYPE
    C.GetTrusteeTypeW(pTrustee)
  end

  def getTrusteeFormA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::TRUSTEE_FORM
    C.GetTrusteeFormA(pTrustee)
  end

  def getTrusteeFormW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::TRUSTEE_FORM
    C.GetTrusteeFormW(pTrustee)
  end

  def getMultipleTrusteeOperationA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION
    C.GetMultipleTrusteeOperationA(pTrustee)
  end

  def getMultipleTrusteeOperationW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION
    C.GetMultipleTrusteeOperationW(pTrustee)
  end

  def getMultipleTrusteeA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::TRUSTEE_A*
    C.GetMultipleTrusteeA(pTrustee)
  end

  def getMultipleTrusteeW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::TRUSTEE_W*
    C.GetMultipleTrusteeW(pTrustee)
  end

  def convertSidToStringSidA(sid : Win32cr::Foundation::PSID, string_sid : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOL
    C.ConvertSidToStringSidA(sid, string_sid)
  end

  #def convertSidToStringSidW(sid : Win32cr::Foundation::PSID, string_sid : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::BOOL
    #C.ConvertSidToStringSidW(sid, string_sid)
  #end

  def convertStringSidToSidA(string_sid : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::BOOL
    C.ConvertStringSidToSidA(string_sid, sid)
  end

  #def convertStringSidToSidW(string_sid : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::BOOL
    #C.ConvertStringSidToSidW(string_sid, sid)
  #end

  def convertStringSecurityDescriptorToSecurityDescriptorA(string_security_descriptor : Win32cr::Foundation::PSTR, string_sd_revision : UInt32, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, security_descriptor_size : UInt32*) : Win32cr::Foundation::BOOL
    C.ConvertStringSecurityDescriptorToSecurityDescriptorA(string_security_descriptor, string_sd_revision, security_descriptor, security_descriptor_size)
  end

  def convertStringSecurityDescriptorToSecurityDescriptorW(string_security_descriptor : Win32cr::Foundation::PWSTR, string_sd_revision : UInt32, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, security_descriptor_size : UInt32*) : Win32cr::Foundation::BOOL
    C.ConvertStringSecurityDescriptorToSecurityDescriptorW(string_security_descriptor, string_sd_revision, security_descriptor, security_descriptor_size)
  end

  def convertSecurityDescriptorToStringSecurityDescriptorA(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, requested_string_sd_revision : UInt32, security_information : UInt32, string_security_descriptor : Win32cr::Foundation::PSTR*, string_security_descriptor_len : UInt32*) : Win32cr::Foundation::BOOL
    C.ConvertSecurityDescriptorToStringSecurityDescriptorA(security_descriptor, requested_string_sd_revision, security_information, string_security_descriptor, string_security_descriptor_len)
  end

  def convertSecurityDescriptorToStringSecurityDescriptorW(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, requested_string_sd_revision : UInt32, security_information : UInt32, string_security_descriptor : Win32cr::Foundation::PWSTR*, string_security_descriptor_len : UInt32*) : Win32cr::Foundation::BOOL
    C.ConvertSecurityDescriptorToStringSecurityDescriptorW(security_descriptor, requested_string_sd_revision, security_information, string_security_descriptor, string_security_descriptor_len)
  end

  @[Link("authz")]
  @[Link("advapi32")]
  lib C
    # :nodoc:
    fun AuthzAccessCheck(flags : Win32cr::Security::Authorization::AUTHZ_ACCESS_CHECK_FLAGS, hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, optional_security_descriptor_array : Win32cr::Security::PSECURITY_DESCRIPTOR*, optional_security_descriptor_count : UInt32, pReply : Win32cr::Security::Authorization::AUTHZ_ACCESS_REPLY*, phAccessCheckResults : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzCachedAccessCheck(flags : UInt32, hAccessCheckResults : Win32cr::Security::Authorization::AUTHZ_ACCESS_CHECK_RESULTS_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE, pReply : Win32cr::Security::Authorization::AUTHZ_ACCESS_REPLY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzOpenObjectAudit(flags : UInt32, hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, optional_security_descriptor_array : Win32cr::Security::PSECURITY_DESCRIPTOR*, optional_security_descriptor_count : UInt32, pReply : Win32cr::Security::Authorization::AUTHZ_ACCESS_REPLY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzFreeHandle(hAccessCheckResults : Win32cr::Security::Authorization::AUTHZ_ACCESS_CHECK_RESULTS_HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeResourceManager(flags : UInt32, pfnDynamicAccessCheck : Win32cr::Security::Authorization::PFN_AUTHZ_DYNAMIC_ACCESS_CHECK, pfnComputeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS, pfnFreeDynamicGroups : Win32cr::Security::Authorization::PFN_AUTHZ_FREE_DYNAMIC_GROUPS, szResourceManagerName : Win32cr::Foundation::PWSTR, phAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeResourceManagerEx(flags : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_FLAGS, pAuthzInitInfo : Win32cr::Security::Authorization::AUTHZ_INIT_INFO*, phAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeRemoteResourceManager(pRpcInitInfo : Win32cr::Security::Authorization::AUTHZ_RPC_INIT_INFO_CLIENT*, phAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzFreeResourceManager(hAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeContextFromToken(flags : UInt32, token_handle : Win32cr::Foundation::HANDLE, hAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, identifier : Win32cr::Foundation::LUID, dynamic_group_args : Void*, phAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeContextFromSid(flags : UInt32, user_sid : Win32cr::Foundation::PSID, hAuthzResourceManager : Win32cr::Security::Authorization::AUTHZ_RESOURCE_MANAGER_HANDLE, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, identifier : Win32cr::Foundation::LUID, dynamic_group_args : Void*, phAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeContextFromAuthzContext(flags : UInt32, hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, identifier : Win32cr::Foundation::LUID, dynamic_group_args : Void*, phNewAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeCompoundContext(user_context : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, device_context : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, phCompoundContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzAddSidsToContext(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, sids : Win32cr::Security::SID_AND_ATTRIBUTES*, sid_count : UInt32, restricted_sids : Win32cr::Security::SID_AND_ATTRIBUTES*, restricted_sid_count : UInt32, phNewAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzModifySecurityAttributes(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pOperations : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pAttributes : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzModifyClaims(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, claim_class : Win32cr::Security::Authorization::AUTHZ_CONTEXT_INFORMATION_CLASS, pClaimOperations : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pClaims : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzModifySids(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, sid_class : Win32cr::Security::Authorization::AUTHZ_CONTEXT_INFORMATION_CLASS, pSidOperations : Win32cr::Security::Authorization::AUTHZ_SID_OPERATION*, pSids : Win32cr::Security::TOKEN_GROUPS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzSetAppContainerInformation(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pAppContainerSid : Win32cr::Foundation::PSID, capability_count : UInt32, pCapabilitySids : Win32cr::Security::SID_AND_ATTRIBUTES*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzGetInformationFromContext(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, info_class : Win32cr::Security::Authorization::AUTHZ_CONTEXT_INFORMATION_CLASS, buffer_size : UInt32, pSizeRequired : UInt32*, buffer : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzFreeContext(hAuthzClientContext : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeObjectAccessAuditEvent(flags : Win32cr::Security::Authorization::AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS, hAuditEventType : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_HANDLE, szOperationType : Win32cr::Foundation::PWSTR, szObjectType : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szAdditionalInfo : Win32cr::Foundation::PWSTR, phAuditEvent : LibC::IntPtrT*, dwAdditionalParameterCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInitializeObjectAccessAuditEvent2(flags : UInt32, hAuditEventType : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_TYPE_HANDLE, szOperationType : Win32cr::Foundation::PWSTR, szObjectType : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szAdditionalInfo : Win32cr::Foundation::PWSTR, szAdditionalInfo2 : Win32cr::Foundation::PWSTR, phAuditEvent : LibC::IntPtrT*, dwAdditionalParameterCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzFreeAuditEvent(hAuditEvent : Win32cr::Security::Authorization::AUTHZ_AUDIT_EVENT_HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzEvaluateSacl(authz_client_context : Win32cr::Security::Authorization::AUTHZ_CLIENT_CONTEXT_HANDLE, pRequest : Win32cr::Security::Authorization::AUTHZ_ACCESS_REQUEST*, sacl : Win32cr::Security::ACL*, granted_access : UInt32, access_granted : Win32cr::Foundation::BOOL, pbGenerateAudit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzInstallSecurityEventSource(dwFlags : UInt32, pRegistration : Win32cr::Security::Authorization::AUTHZ_SOURCE_SCHEMA_REGISTRATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzUninstallSecurityEventSource(dwFlags : UInt32, szEventSourceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzEnumerateSecurityEventSources(dwFlags : UInt32, buffer : Win32cr::Security::Authorization::AUTHZ_SOURCE_SCHEMA_REGISTRATION*, pdwCount : UInt32*, pdwLength : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzRegisterSecurityEventSource(dwFlags : UInt32, szEventSourceName : Win32cr::Foundation::PWSTR, phEventProvider : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzUnregisterSecurityEventSource(dwFlags : UInt32, phEventProvider : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzReportSecurityEvent(dwFlags : UInt32, hEventProvider : Win32cr::Security::Authorization::AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, dwAuditId : UInt32, pUserSid : Win32cr::Foundation::PSID, dwCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzReportSecurityEventFromParams(dwFlags : UInt32, hEventProvider : Win32cr::Security::Authorization::AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, dwAuditId : UInt32, pUserSid : Win32cr::Foundation::PSID, pParams : Win32cr::Security::Authorization::AUDIT_PARAMS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzRegisterCapChangeNotification(phCapChangeSubscription : Win32cr::Security::Authorization::AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__**, pfnCapChangeCallback : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, pCallbackContext : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzUnregisterCapChangeNotification(hCapChangeSubscription : Win32cr::Security::Authorization::AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AuthzFreeCentralAccessPolicyCache : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetEntriesInAclA(cCountOfExplicitEntries : UInt32, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, old_acl : Win32cr::Security::ACL*, new_acl : Win32cr::Security::ACL**) : UInt32

    # :nodoc:
    fun SetEntriesInAclW(cCountOfExplicitEntries : UInt32, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, old_acl : Win32cr::Security::ACL*, new_acl : Win32cr::Security::ACL**) : UInt32

    # :nodoc:
    fun GetExplicitEntriesFromAclA(pacl : Win32cr::Security::ACL*, pcCountOfExplicitEntries : UInt32*, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A**) : UInt32

    # :nodoc:
    fun GetExplicitEntriesFromAclW(pacl : Win32cr::Security::ACL*, pcCountOfExplicitEntries : UInt32*, pListOfExplicitEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W**) : UInt32

    # :nodoc:
    fun GetEffectiveRightsFromAclA(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pAccessRights : UInt32*) : UInt32

    # :nodoc:
    fun GetEffectiveRightsFromAclW(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pAccessRights : UInt32*) : UInt32

    # :nodoc:
    fun GetAuditedPermissionsFromAclA(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pSuccessfulAuditedRights : UInt32*, pFailedAuditRights : UInt32*) : UInt32

    # :nodoc:
    fun GetAuditedPermissionsFromAclW(pacl : Win32cr::Security::ACL*, pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pSuccessfulAuditedRights : UInt32*, pFailedAuditRights : UInt32*) : UInt32

    # :nodoc:
    fun GetNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, ppsidOwner : Win32cr::Foundation::PSID*, ppsidGroup : Win32cr::Foundation::PSID*, ppDacl : Win32cr::Security::ACL**, ppSacl : Win32cr::Security::ACL**, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun GetNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, ppsidOwner : Win32cr::Foundation::PSID*, ppsidGroup : Win32cr::Foundation::PSID*, ppDacl : Win32cr::Security::ACL**, ppSacl : Win32cr::Security::ACL**, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun GetSecurityInfo(handle : Win32cr::Foundation::HANDLE, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, ppsidOwner : Win32cr::Foundation::PSID*, ppsidGroup : Win32cr::Foundation::PSID*, ppDacl : Win32cr::Security::ACL**, ppSacl : Win32cr::Security::ACL**, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun SetNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, psidOwner : Win32cr::Foundation::PSID, psidGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*) : UInt32

    # :nodoc:
    fun SetNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : Win32cr::Security::OBJECT_SECURITY_INFORMATION, psidOwner : Win32cr::Foundation::PSID, psidGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*) : UInt32

    # :nodoc:
    fun SetSecurityInfo(handle : Win32cr::Foundation::HANDLE, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, psidOwner : Win32cr::Foundation::PSID, psidGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*) : UInt32

    # :nodoc:
    fun GetInheritanceSourceA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, container : Win32cr::Foundation::BOOL, pObjectClassGuids : LibC::GUID**, guid_count : UInt32, pAcl : Win32cr::Security::ACL*, pfnArray : Win32cr::Security::Authorization::FN_OBJECT_MGR_FUNCTIONS*, pGenericMapping : Win32cr::Security::GENERIC_MAPPING*, pInheritArray : Win32cr::Security::Authorization::INHERITED_FROMA*) : UInt32

    # :nodoc:
    fun GetInheritanceSourceW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, container : Win32cr::Foundation::BOOL, pObjectClassGuids : LibC::GUID**, guid_count : UInt32, pAcl : Win32cr::Security::ACL*, pfnArray : Win32cr::Security::Authorization::FN_OBJECT_MGR_FUNCTIONS*, pGenericMapping : Win32cr::Security::GENERIC_MAPPING*, pInheritArray : Win32cr::Security::Authorization::INHERITED_FROMW*) : UInt32

    # :nodoc:
    fun FreeInheritedFromArray(pInheritArray : Win32cr::Security::Authorization::INHERITED_FROMW*, ace_cnt : UInt16, pfnArray : Win32cr::Security::Authorization::FN_OBJECT_MGR_FUNCTIONS*) : UInt32

    # :nodoc:
    fun TreeResetNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, keep_explicit : Win32cr::Foundation::BOOL, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32

    # :nodoc:
    fun TreeResetNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, keep_explicit : Win32cr::Foundation::BOOL, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32

    # :nodoc:
    fun TreeSetNamedSecurityInfoA(pObjectName : Win32cr::Foundation::PSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, dwAction : Win32cr::Security::Authorization::TREE_SEC_INFO, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32

    # :nodoc:
    fun TreeSetNamedSecurityInfoW(pObjectName : Win32cr::Foundation::PWSTR, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, security_info : UInt32, pOwner : Win32cr::Foundation::PSID, pGroup : Win32cr::Foundation::PSID, pDacl : Win32cr::Security::ACL*, pSacl : Win32cr::Security::ACL*, dwAction : Win32cr::Security::Authorization::TREE_SEC_INFO, fnProgress : Win32cr::Security::Authorization::FN_PROGRESS, progress_invoke_setting : Win32cr::Security::Authorization::PROG_INVOKE_SETTING, args : Void*) : UInt32

    # :nodoc:
    fun BuildSecurityDescriptorA(pOwner : Win32cr::Security::Authorization::TRUSTEE_A*, pGroup : Win32cr::Security::Authorization::TRUSTEE_A*, cCountOfAccessEntries : UInt32, pListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, cCountOfAuditEntries : UInt32, pListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, pOldSD : Win32cr::Security::PSECURITY_DESCRIPTOR, pSizeNewSD : UInt32*, pNewSD : Win32cr::Security::PSECURITY_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun BuildSecurityDescriptorW(pOwner : Win32cr::Security::Authorization::TRUSTEE_W*, pGroup : Win32cr::Security::Authorization::TRUSTEE_W*, cCountOfAccessEntries : UInt32, pListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, cCountOfAuditEntries : UInt32, pListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, pOldSD : Win32cr::Security::PSECURITY_DESCRIPTOR, pSizeNewSD : UInt32*, pNewSD : Win32cr::Security::PSECURITY_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun LookupSecurityDescriptorPartsA(ppOwner : Win32cr::Security::Authorization::TRUSTEE_A**, ppGroup : Win32cr::Security::Authorization::TRUSTEE_A**, pcCountOfAccessEntries : UInt32*, ppListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A**, pcCountOfAuditEntries : UInt32*, ppListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A**, pSD : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32

    # :nodoc:
    fun LookupSecurityDescriptorPartsW(ppOwner : Win32cr::Security::Authorization::TRUSTEE_W**, ppGroup : Win32cr::Security::Authorization::TRUSTEE_W**, pcCountOfAccessEntries : UInt32*, ppListOfAccessEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W**, pcCountOfAuditEntries : UInt32*, ppListOfAuditEntries : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W**, pSD : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32

    # :nodoc:
    fun BuildExplicitAccessWithNameA(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, pTrusteeName : Win32cr::Foundation::PSTR, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : Win32cr::Security::ACE_FLAGS) : Void

    # :nodoc:
    fun BuildExplicitAccessWithNameW(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, pTrusteeName : Win32cr::Foundation::PWSTR, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : Win32cr::Security::ACE_FLAGS) : Void

    # :nodoc:
    fun BuildImpersonateExplicitAccessWithNameA(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_A*, pTrusteeName : Win32cr::Foundation::PSTR, pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : UInt32) : Void

    # :nodoc:
    fun BuildImpersonateExplicitAccessWithNameW(pExplicitAccess : Win32cr::Security::Authorization::EXPLICIT_ACCESS_W*, pTrusteeName : Win32cr::Foundation::PWSTR, pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, access_permissions : UInt32, access_mode : Win32cr::Security::Authorization::ACCESS_MODE, inheritance : UInt32) : Void

    # :nodoc:
    fun BuildTrusteeWithNameA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pName : Win32cr::Foundation::PSTR) : Void

    # :nodoc:
    fun BuildTrusteeWithNameW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pName : Win32cr::Foundation::PWSTR) : Void

    # :nodoc:
    fun BuildImpersonateTrusteeA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pImpersonateTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Void

    # :nodoc:
    fun BuildImpersonateTrusteeW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pImpersonateTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Void

    # :nodoc:
    fun BuildTrusteeWithSidA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pSid : Win32cr::Foundation::PSID) : Void

    # :nodoc:
    fun BuildTrusteeWithSidW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pSid : Win32cr::Foundation::PSID) : Void

    # :nodoc:
    fun BuildTrusteeWithObjectsAndSidA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pObjSid : Win32cr::Security::Authorization::OBJECTS_AND_SID*, pObjectGuid : LibC::GUID*, pInheritedObjectGuid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Void

    # :nodoc:
    fun BuildTrusteeWithObjectsAndSidW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pObjSid : Win32cr::Security::Authorization::OBJECTS_AND_SID*, pObjectGuid : LibC::GUID*, pInheritedObjectGuid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Void

    # :nodoc:
    fun BuildTrusteeWithObjectsAndNameA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*, pObjName : Win32cr::Security::Authorization::OBJECTS_AND_NAME_A*, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, object_type_name : Win32cr::Foundation::PSTR, inherited_object_type_name : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR) : Void

    # :nodoc:
    fun BuildTrusteeWithObjectsAndNameW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*, pObjName : Win32cr::Security::Authorization::OBJECTS_AND_NAME_W*, object_type : Win32cr::Security::Authorization::SE_OBJECT_TYPE, object_type_name : Win32cr::Foundation::PWSTR, inherited_object_type_name : Win32cr::Foundation::PWSTR, name : Win32cr::Foundation::PWSTR) : Void

    # :nodoc:
    fun GetTrusteeNameA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Foundation::PSTR

    # :nodoc:
    fun GetTrusteeNameW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Foundation::PWSTR

    # :nodoc:
    fun GetTrusteeTypeA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::TRUSTEE_TYPE

    # :nodoc:
    fun GetTrusteeTypeW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::TRUSTEE_TYPE

    # :nodoc:
    fun GetTrusteeFormA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::TRUSTEE_FORM

    # :nodoc:
    fun GetTrusteeFormW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::TRUSTEE_FORM

    # :nodoc:
    fun GetMultipleTrusteeOperationA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION

    # :nodoc:
    fun GetMultipleTrusteeOperationW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::MULTIPLE_TRUSTEE_OPERATION

    # :nodoc:
    fun GetMultipleTrusteeA(pTrustee : Win32cr::Security::Authorization::TRUSTEE_A*) : Win32cr::Security::Authorization::TRUSTEE_A*

    # :nodoc:
    fun GetMultipleTrusteeW(pTrustee : Win32cr::Security::Authorization::TRUSTEE_W*) : Win32cr::Security::Authorization::TRUSTEE_W*

    # :nodoc:
    fun ConvertSidToStringSidA(sid : Win32cr::Foundation::PSID, string_sid : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun ConvertSidToStringSidW(sid : Win32cr::Foundation::PSID, string_sid : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertStringSidToSidA(string_sid : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun ConvertStringSidToSidW(string_sid : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertStringSecurityDescriptorToSecurityDescriptorA(string_security_descriptor : Win32cr::Foundation::PSTR, string_sd_revision : UInt32, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, security_descriptor_size : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertStringSecurityDescriptorToSecurityDescriptorW(string_security_descriptor : Win32cr::Foundation::PWSTR, string_sd_revision : UInt32, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, security_descriptor_size : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertSecurityDescriptorToStringSecurityDescriptorA(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, requested_string_sd_revision : UInt32, security_information : UInt32, string_security_descriptor : Win32cr::Foundation::PSTR*, string_security_descriptor_len : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertSecurityDescriptorToStringSecurityDescriptorW(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, requested_string_sd_revision : UInt32, security_information : UInt32, string_security_descriptor : Win32cr::Foundation::PWSTR*, string_security_descriptor_len : UInt32*) : Win32cr::Foundation::BOOL

  end
end