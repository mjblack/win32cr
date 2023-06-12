require "../security.cr"
require "../foundation.cr"
require "../system/com.cr"
require "../system/threading.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:authz.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
{% else %}
@[Link("authz")]
@[Link("advapi32")]
{% end %}
lib LibWin32
  alias AUTHZ_ACCESS_CHECK_RESULTS_HANDLE = LibC::IntPtrT
  alias AUTHZ_CLIENT_CONTEXT_HANDLE = LibC::IntPtrT
  alias AUTHZ_RESOURCE_MANAGER_HANDLE = LibC::IntPtrT
  alias AUTHZ_AUDIT_EVENT_HANDLE = LibC::IntPtrT
  alias AUTHZ_AUDIT_EVENT_TYPE_HANDLE = LibC::IntPtrT
  alias AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE = LibC::IntPtrT

  SDDL_REVISION_1 = 1_u32
  SDDL_REVISION = 1_u32
  SDDL_ALIAS_SIZE = 2_u32
  INHERITED_ACCESS_ENTRY = 16_u32
  INHERITED_PARENT = 268435456_u32
  INHERITED_GRANDPARENT = 536870912_u32
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
  AUTHZ_SS_MAXSIZE = 128_u32
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
  AzAuthorizationStore = LibC::GUID.new(0xb2bcff59_u32, 0xa757_u16, 0x4b0b_u16, StaticArray[0xa1_u8, 0xbc_u8, 0xea_u8, 0x69_u8, 0x98_u8, 0x1d_u8, 0xa6_u8, 0x9e_u8])
  AzBizRuleContext = LibC::GUID.new(0x5c2dc96f_u32, 0x8d51_u16, 0x434b_u16, StaticArray[0xb3_u8, 0x3c_u8, 0x37_u8, 0x9b_u8, 0xcc_u8, 0xae_u8, 0x77_u8, 0xc3_u8])
  AzPrincipalLocator = LibC::GUID.new(0x483afb5d_u32, 0x70df_u16, 0x4e16_u16, StaticArray[0xab_u8, 0xdc_u8, 0xa1_u8, 0xde_u8, 0x4d_u8, 0x1_u8, 0x5a_u8, 0x3e_u8])

  alias PFN_AUTHZ_DYNAMIC_ACCESS_CHECK = Proc(AUTHZ_CLIENT_CONTEXT_HANDLE, ACE_HEADER*, Void*, LibC::BOOL*, LibC::BOOL)
  alias PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS = Proc(AUTHZ_CLIENT_CONTEXT_HANDLE, Void*, SID_AND_ATTRIBUTES**, UInt32*, SID_AND_ATTRIBUTES**, UInt32*, LibC::BOOL)
  alias PFN_AUTHZ_FREE_DYNAMIC_GROUPS = Proc(SID_AND_ATTRIBUTES*, Void)
  alias PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY = Proc(AUTHZ_CLIENT_CONTEXT_HANDLE, PSID, Void*, LibC::BOOL*, Void**, LibC::BOOL)
  alias PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY = Proc(Void*, Void)
  alias FN_PROGRESS = Proc(LibC::LPWSTR, UInt32, PROG_INVOKE_SETTING*, Void*, LibC::BOOL, Void)


  enum AUTHZ_RESOURCE_MANAGER_FLAGS : UInt32
    AUTHZ_RM_FLAG_NO_AUDIT = 1
    AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION = 2
    AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES = 4
  end

  enum AUTHZ_ACCESS_CHECK_FLAGS : UInt32
    AUTHZ_ACCESS_CHECK_NO_DEEP_COPY_SD = 1
  end

  enum AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS : UInt32
    AUTHZ_NO_SUCCESS_AUDIT = 1
    AUTHZ_NO_FAILURE_AUDIT = 2
    AUTHZ_NO_ALLOC_STRINGS = 4
  end

  enum TREE_SEC_INFO : UInt32
    TREE_SEC_INFO_SET = 1
    TREE_SEC_INFO_RESET = 2
    TREE_SEC_INFO_RESET_KEEP_EXPLICIT = 3
  end

  enum AUTHZ_GENERATE_RESULTS : UInt32
    AUTHZ_GENERATE_SUCCESS_AUDIT = 1
    AUTHZ_GENERATE_FAILURE_AUDIT = 2
  end

  enum ACTRL_ACCESS_ENTRY_ACCESS_FLAGS : UInt32
    ACTRL_ACCESS_ALLOWED = 1
    ACTRL_ACCESS_DENIED = 2
    ACTRL_AUDIT_SUCCESS = 4
    ACTRL_AUDIT_FAILURE = 8
  end

  enum AUTHZ_SECURITY_ATTRIBUTE_FLAGS : UInt32
    AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE = 1
    AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 2
  end

  enum SE_OBJECT_TYPE : Int32
    SE_UNKNOWN_OBJECT_TYPE = 0
    SE_FILE_OBJECT = 1
    SE_SERVICE = 2
    SE_PRINTER = 3
    SE_REGISTRY_KEY = 4
    SE_LMSHARE = 5
    SE_KERNEL_OBJECT = 6
    SE_WINDOW_OBJECT = 7
    SE_DS_OBJECT = 8
    SE_DS_OBJECT_ALL = 9
    SE_PROVIDER_DEFINED_OBJECT = 10
    SE_WMIGUID_OBJECT = 11
    SE_REGISTRY_WOW64_32KEY = 12
    SE_REGISTRY_WOW64_64KEY = 13
  end

  enum TRUSTEE_TYPE : Int32
    TRUSTEE_IS_UNKNOWN = 0
    TRUSTEE_IS_USER = 1
    TRUSTEE_IS_GROUP = 2
    TRUSTEE_IS_DOMAIN = 3
    TRUSTEE_IS_ALIAS = 4
    TRUSTEE_IS_WELL_KNOWN_GROUP = 5
    TRUSTEE_IS_DELETED = 6
    TRUSTEE_IS_INVALID = 7
    TRUSTEE_IS_COMPUTER = 8
  end

  enum TRUSTEE_FORM : Int32
    TRUSTEE_IS_SID = 0
    TRUSTEE_IS_NAME = 1
    TRUSTEE_BAD_FORM = 2
    TRUSTEE_IS_OBJECTS_AND_SID = 3
    TRUSTEE_IS_OBJECTS_AND_NAME = 4
  end

  enum MULTIPLE_TRUSTEE_OPERATION : Int32
    NO_MULTIPLE_TRUSTEE = 0
    TRUSTEE_IS_IMPERSONATE = 1
  end

  enum ACCESS_MODE : Int32
    NOT_USED_ACCESS = 0
    GRANT_ACCESS = 1
    SET_ACCESS = 2
    DENY_ACCESS = 3
    REVOKE_ACCESS = 4
    SET_AUDIT_SUCCESS = 5
    SET_AUDIT_FAILURE = 6
  end

  enum PROG_INVOKE_SETTING : Int32
    ProgressInvokeNever = 1
    ProgressInvokeEveryObject = 2
    ProgressInvokeOnError = 3
    ProgressCancelOperation = 4
    ProgressRetryOperation = 5
    ProgressInvokePrePostError = 6
  end

  enum AUDIT_PARAM_TYPE : Int32
    APT_None = 1
    APT_String = 2
    APT_Ulong = 3
    APT_Pointer = 4
    APT_Sid = 5
    APT_LogonId = 6
    APT_ObjectTypeList = 7
    APT_Luid = 8
    APT_Guid = 9
    APT_Time = 10
    APT_Int64 = 11
    APT_IpAddress = 12
    APT_LogonIdWithSid = 13
  end

  enum AUTHZ_SECURITY_ATTRIBUTE_OPERATION : Int32
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_NONE = 0
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL = 1
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_ADD = 2
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_DELETE = 3
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE = 4
  end

  enum AUTHZ_SID_OPERATION : Int32
    AUTHZ_SID_OPERATION_NONE = 0
    AUTHZ_SID_OPERATION_REPLACE_ALL = 1
    AUTHZ_SID_OPERATION_ADD = 2
    AUTHZ_SID_OPERATION_DELETE = 3
    AUTHZ_SID_OPERATION_REPLACE = 4
  end

  enum AUTHZ_CONTEXT_INFORMATION_CLASS : Int32
    AuthzContextInfoUserSid = 1
    AuthzContextInfoGroupsSids = 2
    AuthzContextInfoRestrictedSids = 3
    AuthzContextInfoPrivileges = 4
    AuthzContextInfoExpirationTime = 5
    AuthzContextInfoServerContext = 6
    AuthzContextInfoIdentifier = 7
    AuthzContextInfoSource = 8
    AuthzContextInfoAll = 9
    AuthzContextInfoAuthenticationId = 10
    AuthzContextInfoSecurityAttributes = 11
    AuthzContextInfoDeviceSids = 12
    AuthzContextInfoUserClaims = 13
    AuthzContextInfoDeviceClaims = 14
    AuthzContextInfoAppContainerSid = 15
    AuthzContextInfoCapabilitySids = 16
  end

  enum AUTHZ_AUDIT_EVENT_INFORMATION_CLASS : Int32
    AuthzAuditEventInfoFlags = 1
    AuthzAuditEventInfoOperationType = 2
    AuthzAuditEventInfoObjectType = 3
    AuthzAuditEventInfoObjectName = 4
    AuthzAuditEventInfoAdditionalInfo = 5
  end

  enum AZ_PROP_CONSTANTS : Int32
    AZ_PROP_NAME = 1
    AZ_PROP_DESCRIPTION = 2
    AZ_PROP_WRITABLE = 3
    AZ_PROP_APPLICATION_DATA = 4
    AZ_PROP_CHILD_CREATE = 5
    AZ_MAX_APPLICATION_NAME_LENGTH = 512
    AZ_MAX_OPERATION_NAME_LENGTH = 64
    AZ_MAX_TASK_NAME_LENGTH = 64
    AZ_MAX_SCOPE_NAME_LENGTH = 65536
    AZ_MAX_GROUP_NAME_LENGTH = 64
    AZ_MAX_ROLE_NAME_LENGTH = 64
    AZ_MAX_NAME_LENGTH = 65536
    AZ_MAX_DESCRIPTION_LENGTH = 1024
    AZ_MAX_APPLICATION_DATA_LENGTH = 4096
    AZ_SUBMIT_FLAG_ABORT = 1
    AZ_SUBMIT_FLAG_FLUSH = 2
    AZ_MAX_POLICY_URL_LENGTH = 65536
    AZ_AZSTORE_FLAG_CREATE = 1
    AZ_AZSTORE_FLAG_MANAGE_STORE_ONLY = 2
    AZ_AZSTORE_FLAG_BATCH_UPDATE = 4
    AZ_AZSTORE_FLAG_AUDIT_IS_CRITICAL = 8
    AZ_AZSTORE_FORCE_APPLICATION_CLOSE = 16
    AZ_AZSTORE_NT6_FUNCTION_LEVEL = 32
    AZ_AZSTORE_FLAG_MANAGE_ONLY_PASSIVE_SUBMIT = 32768
    AZ_PROP_AZSTORE_DOMAIN_TIMEOUT = 100
    AZ_AZSTORE_DEFAULT_DOMAIN_TIMEOUT = 15000
    AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT = 101
    AZ_AZSTORE_MIN_DOMAIN_TIMEOUT = 500
    AZ_AZSTORE_MIN_SCRIPT_ENGINE_TIMEOUT = 5000
    AZ_AZSTORE_DEFAULT_SCRIPT_ENGINE_TIMEOUT = 45000
    AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES = 102
    AZ_AZSTORE_DEFAULT_MAX_SCRIPT_ENGINES = 120
    AZ_PROP_AZSTORE_MAJOR_VERSION = 103
    AZ_PROP_AZSTORE_MINOR_VERSION = 104
    AZ_PROP_AZSTORE_TARGET_MACHINE = 105
    AZ_PROP_AZTORE_IS_ADAM_INSTANCE = 106
    AZ_PROP_OPERATION_ID = 200
    AZ_PROP_TASK_OPERATIONS = 300
    AZ_PROP_TASK_BIZRULE = 301
    AZ_PROP_TASK_BIZRULE_LANGUAGE = 302
    AZ_PROP_TASK_TASKS = 303
    AZ_PROP_TASK_BIZRULE_IMPORTED_PATH = 304
    AZ_PROP_TASK_IS_ROLE_DEFINITION = 305
    AZ_MAX_TASK_BIZRULE_LENGTH = 65536
    AZ_MAX_TASK_BIZRULE_LANGUAGE_LENGTH = 64
    AZ_MAX_TASK_BIZRULE_IMPORTED_PATH_LENGTH = 512
    AZ_MAX_BIZRULE_STRING = 65536
    AZ_PROP_GROUP_TYPE = 400
    AZ_GROUPTYPE_LDAP_QUERY = 1
    AZ_GROUPTYPE_BASIC = 2
    AZ_GROUPTYPE_BIZRULE = 3
    AZ_PROP_GROUP_APP_MEMBERS = 401
    AZ_PROP_GROUP_APP_NON_MEMBERS = 402
    AZ_PROP_GROUP_LDAP_QUERY = 403
    AZ_MAX_GROUP_LDAP_QUERY_LENGTH = 4096
    AZ_PROP_GROUP_MEMBERS = 404
    AZ_PROP_GROUP_NON_MEMBERS = 405
    AZ_PROP_GROUP_MEMBERS_NAME = 406
    AZ_PROP_GROUP_NON_MEMBERS_NAME = 407
    AZ_PROP_GROUP_BIZRULE = 408
    AZ_PROP_GROUP_BIZRULE_LANGUAGE = 409
    AZ_PROP_GROUP_BIZRULE_IMPORTED_PATH = 410
    AZ_MAX_GROUP_BIZRULE_LENGTH = 65536
    AZ_MAX_GROUP_BIZRULE_LANGUAGE_LENGTH = 64
    AZ_MAX_GROUP_BIZRULE_IMPORTED_PATH_LENGTH = 512
    AZ_PROP_ROLE_APP_MEMBERS = 500
    AZ_PROP_ROLE_MEMBERS = 501
    AZ_PROP_ROLE_OPERATIONS = 502
    AZ_PROP_ROLE_TASKS = 504
    AZ_PROP_ROLE_MEMBERS_NAME = 505
    AZ_PROP_SCOPE_BIZRULES_WRITABLE = 600
    AZ_PROP_SCOPE_CAN_BE_DELEGATED = 601
    AZ_PROP_CLIENT_CONTEXT_USER_DN = 700
    AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT = 701
    AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY = 702
    AZ_PROP_CLIENT_CONTEXT_USER_GUID = 703
    AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL = 704
    AZ_PROP_CLIENT_CONTEXT_USER_UPN = 705
    AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT = 707
    AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK = 708
    AZ_PROP_CLIENT_CONTEXT_LDAP_QUERY_DN = 709
    AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID = 800
    AZ_PROP_APPLICATION_VERSION = 801
    AZ_MAX_APPLICATION_VERSION_LENGTH = 512
    AZ_PROP_APPLICATION_NAME = 802
    AZ_PROP_APPLICATION_BIZRULE_ENABLED = 803
    AZ_PROP_APPLY_STORE_SACL = 900
    AZ_PROP_GENERATE_AUDITS = 901
    AZ_PROP_POLICY_ADMINS = 902
    AZ_PROP_POLICY_READERS = 903
    AZ_PROP_DELEGATED_POLICY_USERS = 904
    AZ_PROP_POLICY_ADMINS_NAME = 905
    AZ_PROP_POLICY_READERS_NAME = 906
    AZ_PROP_DELEGATED_POLICY_USERS_NAME = 907
    AZ_CLIENT_CONTEXT_SKIP_GROUP = 1
    AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY = 1
    AZ_CLIENT_CONTEXT_GET_GROUP_RECURSIVE = 2
    AZ_CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY = 2
  end

  union ACTRL_OVERLAPPED_Anonymous_e__Union
    provider : Void*
    reserved1 : UInt32
  end
  union AUDIT_PARAM_Anonymous1_e__Union
    data0 : LibC::UINT_PTR
    string : LibC::LPWSTR
    u : LibC::UINT_PTR
    psid : SID*
    pguid : Guid*
    logon_id_low_part : UInt32
    p_object_types : AUDIT_OBJECT_TYPES*
    p_ip_address : AUDIT_IP_ADDRESS*
  end
  union AUDIT_PARAM_Anonymous2_e__Union
    data1 : LibC::UINT_PTR
    logon_id_high_part : Int32
  end
  union AUTHZ_AUDIT_EVENT_TYPE_UNION
    legacy : AUTHZ_AUDIT_EVENT_TYPE_LEGACY
  end
  union AUTHZ_SECURITY_ATTRIBUTE_V1_Values_e__Union
    p_int64 : Int64*
    p_uint64 : UInt64*
    pp_string : LibC::LPWSTR*
    p_fqbn : AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE*
    p_octet_string : AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE*
  end
  union AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_Attribute_e__Union
    p_attribute_v1 : AUTHZ_SECURITY_ATTRIBUTE_V1*
  end
  union AUTHZ_SOURCE_SCHEMA_REGISTRATION_Anonymous_e__Union
    p_reserved : Void*
    p_provider_guid : Guid*
  end

  struct OBJECTS_AND_SID
    objects_present : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type_guid : Guid
    inherited_object_type_guid : Guid
    p_sid : SID*
  end
  struct OBJECTS_AND_NAME_A
    objects_present : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : SE_OBJECT_TYPE
    object_type_name : PSTR
    inherited_object_type_name : PSTR
    ptstr_name : PSTR
  end
  struct OBJECTS_AND_NAME_W
    objects_present : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : SE_OBJECT_TYPE
    object_type_name : LibC::LPWSTR
    inherited_object_type_name : LibC::LPWSTR
    ptstr_name : LibC::LPWSTR
  end
  struct TRUSTEE_A
    p_multiple_trustee : TRUSTEE_A*
    multiple_trustee_operation : MULTIPLE_TRUSTEE_OPERATION
    trustee_form : TRUSTEE_FORM
    trustee_type : TRUSTEE_TYPE
    ptstr_name : PSTR
  end
  struct TRUSTEE_W
    p_multiple_trustee : TRUSTEE_W*
    multiple_trustee_operation : MULTIPLE_TRUSTEE_OPERATION
    trustee_form : TRUSTEE_FORM
    trustee_type : TRUSTEE_TYPE
    ptstr_name : LibC::LPWSTR
  end
  struct EXPLICIT_ACCESS_A
    grf_access_permissions : UInt32
    grf_access_mode : ACCESS_MODE
    grf_inheritance : ACE_FLAGS
    trustee : TRUSTEE_A
  end
  struct EXPLICIT_ACCESS_W
    grf_access_permissions : UInt32
    grf_access_mode : ACCESS_MODE
    grf_inheritance : ACE_FLAGS
    trustee : TRUSTEE_W
  end
  struct ACTRL_ACCESS_ENTRYA
    trustee : TRUSTEE_A
    f_access_flags : ACTRL_ACCESS_ENTRY_ACCESS_FLAGS
    access : UInt32
    prov_specific_access : UInt32
    inheritance : ACE_FLAGS
    lp_inherit_property : PSTR
  end
  struct ACTRL_ACCESS_ENTRYW
    trustee : TRUSTEE_W
    f_access_flags : ACTRL_ACCESS_ENTRY_ACCESS_FLAGS
    access : UInt32
    prov_specific_access : UInt32
    inheritance : ACE_FLAGS
    lp_inherit_property : LibC::LPWSTR
  end
  struct ACTRL_ACCESS_ENTRY_LISTA
    c_entries : UInt32
    p_access_list : ACTRL_ACCESS_ENTRYA*
  end
  struct ACTRL_ACCESS_ENTRY_LISTW
    c_entries : UInt32
    p_access_list : ACTRL_ACCESS_ENTRYW*
  end
  struct ACTRL_PROPERTY_ENTRYA
    lp_property : PSTR
    p_access_entry_list : ACTRL_ACCESS_ENTRY_LISTA*
    f_list_flags : UInt32
  end
  struct ACTRL_PROPERTY_ENTRYW
    lp_property : LibC::LPWSTR
    p_access_entry_list : ACTRL_ACCESS_ENTRY_LISTW*
    f_list_flags : UInt32
  end
  struct ACTRL_ACCESSA
    c_entries : UInt32
    p_property_access_list : ACTRL_PROPERTY_ENTRYA*
  end
  struct ACTRL_ACCESSW
    c_entries : UInt32
    p_property_access_list : ACTRL_PROPERTY_ENTRYW*
  end
  struct TRUSTEE_ACCESSA
    lp_property : PSTR
    access : UInt32
    f_access_flags : UInt32
    f_returned_access : UInt32
  end
  struct TRUSTEE_ACCESSW
    lp_property : LibC::LPWSTR
    access : UInt32
    f_access_flags : UInt32
    f_returned_access : UInt32
  end
  struct ACTRL_OVERLAPPED
    anonymous : ACTRL_OVERLAPPED_Anonymous_e__Union
    reserved2 : UInt32
    h_event : LibC::HANDLE
  end
  struct ACTRL_ACCESS_INFOA
    f_access_permission : UInt32
    lp_access_permission_name : PSTR
  end
  struct ACTRL_ACCESS_INFOW
    f_access_permission : UInt32
    lp_access_permission_name : LibC::LPWSTR
  end
  struct ACTRL_CONTROL_INFOA
    lp_control_id : PSTR
    lp_control_name : PSTR
  end
  struct ACTRL_CONTROL_INFOW
    lp_control_id : LibC::LPWSTR
    lp_control_name : LibC::LPWSTR
  end
  struct FN_OBJECT_MGR_FUNCTIONS
    placeholder : UInt32
  end
  struct INHERITED_FROMA
    generation_gap : Int32
    ancestor_name : PSTR
  end
  struct INHERITED_FROMW
    generation_gap : Int32
    ancestor_name : LibC::LPWSTR
  end
  struct AUDIT_OBJECT_TYPE
    object_type : Guid
    flags : UInt16
    level : UInt16
    access_mask : UInt32
  end
  struct AUDIT_OBJECT_TYPES
    count : UInt16
    flags : UInt16
    p_object_types : AUDIT_OBJECT_TYPE*
  end
  struct AUDIT_IP_ADDRESS
    p_ip_address : UInt8[128]*
  end
  struct AUDIT_PARAM
    type : AUDIT_PARAM_TYPE
    length : UInt32
    flags : UInt32
    anonymous1 : AUDIT_PARAM_Anonymous1_e__Union
    anonymous2 : AUDIT_PARAM_Anonymous2_e__Union
  end
  struct AUDIT_PARAMS
    length : UInt32
    flags : UInt32
    count : UInt16
    parameters : AUDIT_PARAM*
  end
  struct AUTHZ_AUDIT_EVENT_TYPE_LEGACY
    category_id : UInt16
    audit_id : UInt16
    parameter_count : UInt16
  end
  struct AUTHZ_AUDIT_EVENT_TYPE_OLD
    version : UInt32
    dw_flags : UInt32
    ref_count : Int32
    h_audit : LibC::UINT_PTR
    link_id : LUID
    u : AUTHZ_AUDIT_EVENT_TYPE_UNION
  end
  struct AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__
    unused : Int32
  end
  struct AUTHZ_ACCESS_REQUEST
    desired_access : UInt32
    principal_self_sid : PSID
    object_type_list : OBJECT_TYPE_LIST*
    object_type_list_length : UInt32
    optional_arguments : Void*
  end
  struct AUTHZ_ACCESS_REPLY
    result_list_length : UInt32
    granted_access_mask : UInt32*
    sacl_evaluation_results : AUTHZ_GENERATE_RESULTS*
    error : UInt32*
  end
  struct AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE
    version : UInt64
    p_name : LibC::LPWSTR
  end
  struct AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
    p_value : Void*
    value_length : UInt32
  end
  struct AUTHZ_SECURITY_ATTRIBUTE_V1
    p_name : LibC::LPWSTR
    value_type : UInt16
    reserved : UInt16
    flags : AUTHZ_SECURITY_ATTRIBUTE_FLAGS
    value_count : UInt32
    values : AUTHZ_SECURITY_ATTRIBUTE_V1_Values_e__Union
  end
  struct AUTHZ_SECURITY_ATTRIBUTES_INFORMATION
    version : UInt16
    reserved : UInt16
    attribute_count : UInt32
    attribute : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_Attribute_e__Union
  end
  struct AUTHZ_RPC_INIT_INFO_CLIENT
    version : UInt16
    object_uuid : LibC::LPWSTR
    prot_seq : LibC::LPWSTR
    network_addr : LibC::LPWSTR
    endpoint : LibC::LPWSTR
    options : LibC::LPWSTR
    server_spn : LibC::LPWSTR
  end
  struct AUTHZ_INIT_INFO
    version : UInt16
    sz_resource_manager_name : LibC::LPWSTR
    pfn_dynamic_access_check : PFN_AUTHZ_DYNAMIC_ACCESS_CHECK
    pfn_compute_dynamic_groups : PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS
    pfn_free_dynamic_groups : PFN_AUTHZ_FREE_DYNAMIC_GROUPS
    pfn_get_central_access_policy : PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY
    pfn_free_central_access_policy : PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY
  end
  struct AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET
    sz_object_type_name : LibC::LPWSTR
    dw_offset : UInt32
  end
  struct AUTHZ_SOURCE_SCHEMA_REGISTRATION
    dw_flags : UInt32
    sz_event_source_name : LibC::LPWSTR
    sz_event_message_file : LibC::LPWSTR
    sz_event_source_xml_schema_file : LibC::LPWSTR
    sz_event_access_strings_file : LibC::LPWSTR
    sz_executable_image_path : LibC::LPWSTR
    anonymous : AUTHZ_SOURCE_SCHEMA_REGISTRATION_Anonymous_e__Union
    dw_object_type_name_count : UInt32
    object_type_names : AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET[0]*
  end


  struct IAzAuthorizationStoreVTbl
    query_interface : Proc(IAzAuthorizationStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzAuthorizationStore*, UInt32)
    release : Proc(IAzAuthorizationStore*, UInt32)
    get_type_info_count : Proc(IAzAuthorizationStore*, UInt32*, HRESULT)
    get_type_info : Proc(IAzAuthorizationStore*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzAuthorizationStore*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzAuthorizationStore*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_description : Proc(IAzAuthorizationStore*, UInt8**, HRESULT)
    put_description : Proc(IAzAuthorizationStore*, UInt8*, HRESULT)
    get_application_data : Proc(IAzAuthorizationStore*, UInt8**, HRESULT)
    put_application_data : Proc(IAzAuthorizationStore*, UInt8*, HRESULT)
    get_domain_timeout : Proc(IAzAuthorizationStore*, Int32*, HRESULT)
    put_domain_timeout : Proc(IAzAuthorizationStore*, Int32, HRESULT)
    get_script_engine_timeout : Proc(IAzAuthorizationStore*, Int32*, HRESULT)
    put_script_engine_timeout : Proc(IAzAuthorizationStore*, Int32, HRESULT)
    get_max_script_engines : Proc(IAzAuthorizationStore*, Int32*, HRESULT)
    put_max_script_engines : Proc(IAzAuthorizationStore*, Int32, HRESULT)
    get_generate_audits : Proc(IAzAuthorizationStore*, LibC::BOOL*, HRESULT)
    put_generate_audits : Proc(IAzAuthorizationStore*, LibC::BOOL, HRESULT)
    get_writable : Proc(IAzAuthorizationStore*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzAuthorizationStore*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzAuthorizationStore*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzAuthorizationStore*, AZ_PROP_CONSTANTS, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzAuthorizationStore*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzAuthorizationStore*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzAuthorizationStore*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    initialize : Proc(IAzAuthorizationStore*, AZ_PROP_CONSTANTS, UInt8*, VARIANT, HRESULT)
    update_cache : Proc(IAzAuthorizationStore*, VARIANT, HRESULT)
    delete : Proc(IAzAuthorizationStore*, VARIANT, HRESULT)
    get_applications : Proc(IAzAuthorizationStore*, IAzApplications*, HRESULT)
    open_application : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, IAzApplication*, HRESULT)
    create_application : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, IAzApplication*, HRESULT)
    delete_application : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzAuthorizationStore*, IAzApplicationGroups*, HRESULT)
    create_application_group : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    open_application_group : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    submit : Proc(IAzAuthorizationStore*, Int32, VARIANT, HRESULT)
    get_delegated_policy_users : Proc(IAzAuthorizationStore*, VARIANT*, HRESULT)
    add_delegated_policy_user : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    get_target_machine : Proc(IAzAuthorizationStore*, UInt8**, HRESULT)
    get_apply_store_sacl : Proc(IAzAuthorizationStore*, LibC::BOOL*, HRESULT)
    put_apply_store_sacl : Proc(IAzAuthorizationStore*, LibC::BOOL, HRESULT)
    get_policy_administrators_name : Proc(IAzAuthorizationStore*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzAuthorizationStore*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    get_delegated_policy_users_name : Proc(IAzAuthorizationStore*, VARIANT*, HRESULT)
    add_delegated_policy_user_name : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user_name : Proc(IAzAuthorizationStore*, UInt8*, VARIANT, HRESULT)
    close_application : Proc(IAzAuthorizationStore*, UInt8*, Int32, HRESULT)
  end

  IAzAuthorizationStore_GUID = LibC::GUID.new("edbd9ca9-9b82-4f6a-9e8b-98301e450f14")
  CLSID_IAzAuthorizationStore = "edbd9ca9-9b82-4f6a-9e8b-98301e450f14"
  struct IAzAuthorizationStore
    lpVtbl : IAzAuthorizationStoreVTbl*
  end

  struct IAzAuthorizationStore2VTbl
    query_interface : Proc(IAzAuthorizationStore2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzAuthorizationStore2*, UInt32)
    release : Proc(IAzAuthorizationStore2*, UInt32)
    get_type_info_count : Proc(IAzAuthorizationStore2*, UInt32*, HRESULT)
    get_type_info : Proc(IAzAuthorizationStore2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzAuthorizationStore2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzAuthorizationStore2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_description : Proc(IAzAuthorizationStore2*, UInt8**, HRESULT)
    put_description : Proc(IAzAuthorizationStore2*, UInt8*, HRESULT)
    get_application_data : Proc(IAzAuthorizationStore2*, UInt8**, HRESULT)
    put_application_data : Proc(IAzAuthorizationStore2*, UInt8*, HRESULT)
    get_domain_timeout : Proc(IAzAuthorizationStore2*, Int32*, HRESULT)
    put_domain_timeout : Proc(IAzAuthorizationStore2*, Int32, HRESULT)
    get_script_engine_timeout : Proc(IAzAuthorizationStore2*, Int32*, HRESULT)
    put_script_engine_timeout : Proc(IAzAuthorizationStore2*, Int32, HRESULT)
    get_max_script_engines : Proc(IAzAuthorizationStore2*, Int32*, HRESULT)
    put_max_script_engines : Proc(IAzAuthorizationStore2*, Int32, HRESULT)
    get_generate_audits : Proc(IAzAuthorizationStore2*, LibC::BOOL*, HRESULT)
    put_generate_audits : Proc(IAzAuthorizationStore2*, LibC::BOOL, HRESULT)
    get_writable : Proc(IAzAuthorizationStore2*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzAuthorizationStore2*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzAuthorizationStore2*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzAuthorizationStore2*, AZ_PROP_CONSTANTS, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzAuthorizationStore2*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzAuthorizationStore2*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzAuthorizationStore2*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    initialize : Proc(IAzAuthorizationStore2*, AZ_PROP_CONSTANTS, UInt8*, VARIANT, HRESULT)
    update_cache : Proc(IAzAuthorizationStore2*, VARIANT, HRESULT)
    delete : Proc(IAzAuthorizationStore2*, VARIANT, HRESULT)
    get_applications : Proc(IAzAuthorizationStore2*, IAzApplications*, HRESULT)
    open_application : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, IAzApplication*, HRESULT)
    create_application : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, IAzApplication*, HRESULT)
    delete_application : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzAuthorizationStore2*, IAzApplicationGroups*, HRESULT)
    create_application_group : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    open_application_group : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    submit : Proc(IAzAuthorizationStore2*, Int32, VARIANT, HRESULT)
    get_delegated_policy_users : Proc(IAzAuthorizationStore2*, VARIANT*, HRESULT)
    add_delegated_policy_user : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    get_target_machine : Proc(IAzAuthorizationStore2*, UInt8**, HRESULT)
    get_apply_store_sacl : Proc(IAzAuthorizationStore2*, LibC::BOOL*, HRESULT)
    put_apply_store_sacl : Proc(IAzAuthorizationStore2*, LibC::BOOL, HRESULT)
    get_policy_administrators_name : Proc(IAzAuthorizationStore2*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzAuthorizationStore2*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    get_delegated_policy_users_name : Proc(IAzAuthorizationStore2*, VARIANT*, HRESULT)
    add_delegated_policy_user_name : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user_name : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, HRESULT)
    close_application : Proc(IAzAuthorizationStore2*, UInt8*, Int32, HRESULT)
    open_application2 : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, IAzApplication2*, HRESULT)
    create_application2 : Proc(IAzAuthorizationStore2*, UInt8*, VARIANT, IAzApplication2*, HRESULT)
  end

  IAzAuthorizationStore2_GUID = LibC::GUID.new("b11e5584-d577-4273-b6c5-0973e0f8e80d")
  CLSID_IAzAuthorizationStore2 = "b11e5584-d577-4273-b6c5-0973e0f8e80d"
  struct IAzAuthorizationStore2
    lpVtbl : IAzAuthorizationStore2VTbl*
  end

  struct IAzAuthorizationStore3VTbl
    query_interface : Proc(IAzAuthorizationStore3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzAuthorizationStore3*, UInt32)
    release : Proc(IAzAuthorizationStore3*, UInt32)
    get_type_info_count : Proc(IAzAuthorizationStore3*, UInt32*, HRESULT)
    get_type_info : Proc(IAzAuthorizationStore3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzAuthorizationStore3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzAuthorizationStore3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_description : Proc(IAzAuthorizationStore3*, UInt8**, HRESULT)
    put_description : Proc(IAzAuthorizationStore3*, UInt8*, HRESULT)
    get_application_data : Proc(IAzAuthorizationStore3*, UInt8**, HRESULT)
    put_application_data : Proc(IAzAuthorizationStore3*, UInt8*, HRESULT)
    get_domain_timeout : Proc(IAzAuthorizationStore3*, Int32*, HRESULT)
    put_domain_timeout : Proc(IAzAuthorizationStore3*, Int32, HRESULT)
    get_script_engine_timeout : Proc(IAzAuthorizationStore3*, Int32*, HRESULT)
    put_script_engine_timeout : Proc(IAzAuthorizationStore3*, Int32, HRESULT)
    get_max_script_engines : Proc(IAzAuthorizationStore3*, Int32*, HRESULT)
    put_max_script_engines : Proc(IAzAuthorizationStore3*, Int32, HRESULT)
    get_generate_audits : Proc(IAzAuthorizationStore3*, LibC::BOOL*, HRESULT)
    put_generate_audits : Proc(IAzAuthorizationStore3*, LibC::BOOL, HRESULT)
    get_writable : Proc(IAzAuthorizationStore3*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzAuthorizationStore3*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzAuthorizationStore3*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzAuthorizationStore3*, AZ_PROP_CONSTANTS, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzAuthorizationStore3*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzAuthorizationStore3*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzAuthorizationStore3*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    initialize : Proc(IAzAuthorizationStore3*, AZ_PROP_CONSTANTS, UInt8*, VARIANT, HRESULT)
    update_cache : Proc(IAzAuthorizationStore3*, VARIANT, HRESULT)
    delete : Proc(IAzAuthorizationStore3*, VARIANT, HRESULT)
    get_applications : Proc(IAzAuthorizationStore3*, IAzApplications*, HRESULT)
    open_application : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, IAzApplication*, HRESULT)
    create_application : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, IAzApplication*, HRESULT)
    delete_application : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzAuthorizationStore3*, IAzApplicationGroups*, HRESULT)
    create_application_group : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    open_application_group : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    submit : Proc(IAzAuthorizationStore3*, Int32, VARIANT, HRESULT)
    get_delegated_policy_users : Proc(IAzAuthorizationStore3*, VARIANT*, HRESULT)
    add_delegated_policy_user : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    get_target_machine : Proc(IAzAuthorizationStore3*, UInt8**, HRESULT)
    get_apply_store_sacl : Proc(IAzAuthorizationStore3*, LibC::BOOL*, HRESULT)
    put_apply_store_sacl : Proc(IAzAuthorizationStore3*, LibC::BOOL, HRESULT)
    get_policy_administrators_name : Proc(IAzAuthorizationStore3*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzAuthorizationStore3*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    get_delegated_policy_users_name : Proc(IAzAuthorizationStore3*, VARIANT*, HRESULT)
    add_delegated_policy_user_name : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user_name : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, HRESULT)
    close_application : Proc(IAzAuthorizationStore3*, UInt8*, Int32, HRESULT)
    open_application2 : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, IAzApplication2*, HRESULT)
    create_application2 : Proc(IAzAuthorizationStore3*, UInt8*, VARIANT, IAzApplication2*, HRESULT)
    is_update_needed : Proc(IAzAuthorizationStore3*, Int16*, HRESULT)
    bizrule_group_supported : Proc(IAzAuthorizationStore3*, Int16*, HRESULT)
    upgrade_stores_functional_level : Proc(IAzAuthorizationStore3*, Int32, HRESULT)
    is_functional_level_upgrade_supported : Proc(IAzAuthorizationStore3*, Int32, Int16*, HRESULT)
    get_schema_version : Proc(IAzAuthorizationStore3*, Int32*, Int32*, HRESULT)
  end

  IAzAuthorizationStore3_GUID = LibC::GUID.new("abc08425-0c86-4fa0-9be3-7189956c926e")
  CLSID_IAzAuthorizationStore3 = "abc08425-0c86-4fa0-9be3-7189956c926e"
  struct IAzAuthorizationStore3
    lpVtbl : IAzAuthorizationStore3VTbl*
  end

  struct IAzApplicationVTbl
    query_interface : Proc(IAzApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzApplication*, UInt32)
    release : Proc(IAzApplication*, UInt32)
    get_type_info_count : Proc(IAzApplication*, UInt32*, HRESULT)
    get_type_info : Proc(IAzApplication*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzApplication*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzApplication*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzApplication*, UInt8**, HRESULT)
    put_name : Proc(IAzApplication*, UInt8*, HRESULT)
    get_description : Proc(IAzApplication*, UInt8**, HRESULT)
    put_description : Proc(IAzApplication*, UInt8*, HRESULT)
    get_application_data : Proc(IAzApplication*, UInt8**, HRESULT)
    put_application_data : Proc(IAzApplication*, UInt8*, HRESULT)
    get_authz_interface_clsid : Proc(IAzApplication*, UInt8**, HRESULT)
    put_authz_interface_clsid : Proc(IAzApplication*, UInt8*, HRESULT)
    get_version : Proc(IAzApplication*, UInt8**, HRESULT)
    put_version : Proc(IAzApplication*, UInt8*, HRESULT)
    get_generate_audits : Proc(IAzApplication*, LibC::BOOL*, HRESULT)
    put_generate_audits : Proc(IAzApplication*, LibC::BOOL, HRESULT)
    get_apply_store_sacl : Proc(IAzApplication*, LibC::BOOL*, HRESULT)
    put_apply_store_sacl : Proc(IAzApplication*, LibC::BOOL, HRESULT)
    get_writable : Proc(IAzApplication*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzApplication*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzApplication*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzApplication*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzApplication*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    get_scopes : Proc(IAzApplication*, IAzScopes*, HRESULT)
    open_scope : Proc(IAzApplication*, UInt8*, VARIANT, IAzScope*, HRESULT)
    create_scope : Proc(IAzApplication*, UInt8*, VARIANT, IAzScope*, HRESULT)
    delete_scope : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    get_operations : Proc(IAzApplication*, IAzOperations*, HRESULT)
    open_operation : Proc(IAzApplication*, UInt8*, VARIANT, IAzOperation*, HRESULT)
    create_operation : Proc(IAzApplication*, UInt8*, VARIANT, IAzOperation*, HRESULT)
    delete_operation : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    get_tasks : Proc(IAzApplication*, IAzTasks*, HRESULT)
    open_task : Proc(IAzApplication*, UInt8*, VARIANT, IAzTask*, HRESULT)
    create_task : Proc(IAzApplication*, UInt8*, VARIANT, IAzTask*, HRESULT)
    delete_task : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzApplication*, IAzApplicationGroups*, HRESULT)
    open_application_group : Proc(IAzApplication*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    create_application_group : Proc(IAzApplication*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    get_roles : Proc(IAzApplication*, IAzRoles*, HRESULT)
    open_role : Proc(IAzApplication*, UInt8*, VARIANT, IAzRole*, HRESULT)
    create_role : Proc(IAzApplication*, UInt8*, VARIANT, IAzRole*, HRESULT)
    delete_role : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_token : Proc(IAzApplication*, UInt64, VARIANT, IAzClientContext*, HRESULT)
    add_property_item : Proc(IAzApplication*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzApplication*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzApplication*, Int32, VARIANT, HRESULT)
    initialize_client_context_from_name : Proc(IAzApplication*, UInt8*, UInt8*, VARIANT, IAzClientContext*, HRESULT)
    get_delegated_policy_users : Proc(IAzApplication*, VARIANT*, HRESULT)
    add_delegated_policy_user : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_string_sid : Proc(IAzApplication*, UInt8*, Int32, VARIANT, IAzClientContext*, HRESULT)
    get_policy_administrators_name : Proc(IAzApplication*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzApplication*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    get_delegated_policy_users_name : Proc(IAzApplication*, VARIANT*, HRESULT)
    add_delegated_policy_user_name : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user_name : Proc(IAzApplication*, UInt8*, VARIANT, HRESULT)
  end

  IAzApplication_GUID = LibC::GUID.new("987bc7c7-b813-4d27-bede-6ba5ae867e95")
  CLSID_IAzApplication = "987bc7c7-b813-4d27-bede-6ba5ae867e95"
  struct IAzApplication
    lpVtbl : IAzApplicationVTbl*
  end

  struct IAzApplication2VTbl
    query_interface : Proc(IAzApplication2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzApplication2*, UInt32)
    release : Proc(IAzApplication2*, UInt32)
    get_type_info_count : Proc(IAzApplication2*, UInt32*, HRESULT)
    get_type_info : Proc(IAzApplication2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzApplication2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzApplication2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzApplication2*, UInt8**, HRESULT)
    put_name : Proc(IAzApplication2*, UInt8*, HRESULT)
    get_description : Proc(IAzApplication2*, UInt8**, HRESULT)
    put_description : Proc(IAzApplication2*, UInt8*, HRESULT)
    get_application_data : Proc(IAzApplication2*, UInt8**, HRESULT)
    put_application_data : Proc(IAzApplication2*, UInt8*, HRESULT)
    get_authz_interface_clsid : Proc(IAzApplication2*, UInt8**, HRESULT)
    put_authz_interface_clsid : Proc(IAzApplication2*, UInt8*, HRESULT)
    get_version : Proc(IAzApplication2*, UInt8**, HRESULT)
    put_version : Proc(IAzApplication2*, UInt8*, HRESULT)
    get_generate_audits : Proc(IAzApplication2*, LibC::BOOL*, HRESULT)
    put_generate_audits : Proc(IAzApplication2*, LibC::BOOL, HRESULT)
    get_apply_store_sacl : Proc(IAzApplication2*, LibC::BOOL*, HRESULT)
    put_apply_store_sacl : Proc(IAzApplication2*, LibC::BOOL, HRESULT)
    get_writable : Proc(IAzApplication2*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzApplication2*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzApplication2*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzApplication2*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzApplication2*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    get_scopes : Proc(IAzApplication2*, IAzScopes*, HRESULT)
    open_scope : Proc(IAzApplication2*, UInt8*, VARIANT, IAzScope*, HRESULT)
    create_scope : Proc(IAzApplication2*, UInt8*, VARIANT, IAzScope*, HRESULT)
    delete_scope : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    get_operations : Proc(IAzApplication2*, IAzOperations*, HRESULT)
    open_operation : Proc(IAzApplication2*, UInt8*, VARIANT, IAzOperation*, HRESULT)
    create_operation : Proc(IAzApplication2*, UInt8*, VARIANT, IAzOperation*, HRESULT)
    delete_operation : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    get_tasks : Proc(IAzApplication2*, IAzTasks*, HRESULT)
    open_task : Proc(IAzApplication2*, UInt8*, VARIANT, IAzTask*, HRESULT)
    create_task : Proc(IAzApplication2*, UInt8*, VARIANT, IAzTask*, HRESULT)
    delete_task : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzApplication2*, IAzApplicationGroups*, HRESULT)
    open_application_group : Proc(IAzApplication2*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    create_application_group : Proc(IAzApplication2*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    get_roles : Proc(IAzApplication2*, IAzRoles*, HRESULT)
    open_role : Proc(IAzApplication2*, UInt8*, VARIANT, IAzRole*, HRESULT)
    create_role : Proc(IAzApplication2*, UInt8*, VARIANT, IAzRole*, HRESULT)
    delete_role : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_token : Proc(IAzApplication2*, UInt64, VARIANT, IAzClientContext*, HRESULT)
    add_property_item : Proc(IAzApplication2*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzApplication2*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzApplication2*, Int32, VARIANT, HRESULT)
    initialize_client_context_from_name : Proc(IAzApplication2*, UInt8*, UInt8*, VARIANT, IAzClientContext*, HRESULT)
    get_delegated_policy_users : Proc(IAzApplication2*, VARIANT*, HRESULT)
    add_delegated_policy_user : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_string_sid : Proc(IAzApplication2*, UInt8*, Int32, VARIANT, IAzClientContext*, HRESULT)
    get_policy_administrators_name : Proc(IAzApplication2*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzApplication2*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    get_delegated_policy_users_name : Proc(IAzApplication2*, VARIANT*, HRESULT)
    add_delegated_policy_user_name : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user_name : Proc(IAzApplication2*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_token2 : Proc(IAzApplication2*, UInt32, UInt32, VARIANT, IAzClientContext2*, HRESULT)
    initialize_client_context2 : Proc(IAzApplication2*, UInt8*, VARIANT, IAzClientContext2*, HRESULT)
  end

  IAzApplication2_GUID = LibC::GUID.new("086a68af-a249-437c-b18d-d4d86d6a9660")
  CLSID_IAzApplication2 = "086a68af-a249-437c-b18d-d4d86d6a9660"
  struct IAzApplication2
    lpVtbl : IAzApplication2VTbl*
  end

  struct IAzApplicationsVTbl
    query_interface : Proc(IAzApplications*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzApplications*, UInt32)
    release : Proc(IAzApplications*, UInt32)
    get_type_info_count : Proc(IAzApplications*, UInt32*, HRESULT)
    get_type_info : Proc(IAzApplications*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzApplications*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzApplications*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzApplications*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzApplications*, Int32*, HRESULT)
    get__new_enum : Proc(IAzApplications*, IUnknown*, HRESULT)
  end

  IAzApplications_GUID = LibC::GUID.new("929b11a9-95c5-4a84-a29a-20ad42c2f16c")
  CLSID_IAzApplications = "929b11a9-95c5-4a84-a29a-20ad42c2f16c"
  struct IAzApplications
    lpVtbl : IAzApplicationsVTbl*
  end

  struct IAzOperationVTbl
    query_interface : Proc(IAzOperation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzOperation*, UInt32)
    release : Proc(IAzOperation*, UInt32)
    get_type_info_count : Proc(IAzOperation*, UInt32*, HRESULT)
    get_type_info : Proc(IAzOperation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzOperation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzOperation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzOperation*, UInt8**, HRESULT)
    put_name : Proc(IAzOperation*, UInt8*, HRESULT)
    get_description : Proc(IAzOperation*, UInt8**, HRESULT)
    put_description : Proc(IAzOperation*, UInt8*, HRESULT)
    get_application_data : Proc(IAzOperation*, UInt8**, HRESULT)
    put_application_data : Proc(IAzOperation*, UInt8*, HRESULT)
    get_operation_id : Proc(IAzOperation*, Int32*, HRESULT)
    put_operation_id : Proc(IAzOperation*, Int32, HRESULT)
    get_writable : Proc(IAzOperation*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzOperation*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzOperation*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzOperation*, Int32, VARIANT, HRESULT)
  end

  IAzOperation_GUID = LibC::GUID.new("5e56b24f-ea01-4d61-be44-c49b5e4eaf74")
  CLSID_IAzOperation = "5e56b24f-ea01-4d61-be44-c49b5e4eaf74"
  struct IAzOperation
    lpVtbl : IAzOperationVTbl*
  end

  struct IAzOperationsVTbl
    query_interface : Proc(IAzOperations*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzOperations*, UInt32)
    release : Proc(IAzOperations*, UInt32)
    get_type_info_count : Proc(IAzOperations*, UInt32*, HRESULT)
    get_type_info : Proc(IAzOperations*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzOperations*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzOperations*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzOperations*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzOperations*, Int32*, HRESULT)
    get__new_enum : Proc(IAzOperations*, IUnknown*, HRESULT)
  end

  IAzOperations_GUID = LibC::GUID.new("90ef9c07-9706-49d9-af80-0438a5f3ec35")
  CLSID_IAzOperations = "90ef9c07-9706-49d9-af80-0438a5f3ec35"
  struct IAzOperations
    lpVtbl : IAzOperationsVTbl*
  end

  struct IAzTaskVTbl
    query_interface : Proc(IAzTask*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzTask*, UInt32)
    release : Proc(IAzTask*, UInt32)
    get_type_info_count : Proc(IAzTask*, UInt32*, HRESULT)
    get_type_info : Proc(IAzTask*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzTask*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzTask*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzTask*, UInt8**, HRESULT)
    put_name : Proc(IAzTask*, UInt8*, HRESULT)
    get_description : Proc(IAzTask*, UInt8**, HRESULT)
    put_description : Proc(IAzTask*, UInt8*, HRESULT)
    get_application_data : Proc(IAzTask*, UInt8**, HRESULT)
    put_application_data : Proc(IAzTask*, UInt8*, HRESULT)
    get_biz_rule : Proc(IAzTask*, UInt8**, HRESULT)
    put_biz_rule : Proc(IAzTask*, UInt8*, HRESULT)
    get_biz_rule_language : Proc(IAzTask*, UInt8**, HRESULT)
    put_biz_rule_language : Proc(IAzTask*, UInt8*, HRESULT)
    get_biz_rule_imported_path : Proc(IAzTask*, UInt8**, HRESULT)
    put_biz_rule_imported_path : Proc(IAzTask*, UInt8*, HRESULT)
    get_is_role_definition : Proc(IAzTask*, LibC::BOOL*, HRESULT)
    put_is_role_definition : Proc(IAzTask*, LibC::BOOL, HRESULT)
    get_operations : Proc(IAzTask*, VARIANT*, HRESULT)
    get_tasks : Proc(IAzTask*, VARIANT*, HRESULT)
    add_operation : Proc(IAzTask*, UInt8*, VARIANT, HRESULT)
    delete_operation : Proc(IAzTask*, UInt8*, VARIANT, HRESULT)
    add_task : Proc(IAzTask*, UInt8*, VARIANT, HRESULT)
    delete_task : Proc(IAzTask*, UInt8*, VARIANT, HRESULT)
    get_writable : Proc(IAzTask*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzTask*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzTask*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzTask*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzTask*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzTask*, Int32, VARIANT, HRESULT)
  end

  IAzTask_GUID = LibC::GUID.new("cb94e592-2e0e-4a6c-a336-b89a6dc1e388")
  CLSID_IAzTask = "cb94e592-2e0e-4a6c-a336-b89a6dc1e388"
  struct IAzTask
    lpVtbl : IAzTaskVTbl*
  end

  struct IAzTasksVTbl
    query_interface : Proc(IAzTasks*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzTasks*, UInt32)
    release : Proc(IAzTasks*, UInt32)
    get_type_info_count : Proc(IAzTasks*, UInt32*, HRESULT)
    get_type_info : Proc(IAzTasks*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzTasks*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzTasks*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzTasks*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzTasks*, Int32*, HRESULT)
    get__new_enum : Proc(IAzTasks*, IUnknown*, HRESULT)
  end

  IAzTasks_GUID = LibC::GUID.new("b338ccab-4c85-4388-8c0a-c58592bad398")
  CLSID_IAzTasks = "b338ccab-4c85-4388-8c0a-c58592bad398"
  struct IAzTasks
    lpVtbl : IAzTasksVTbl*
  end

  struct IAzScopeVTbl
    query_interface : Proc(IAzScope*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzScope*, UInt32)
    release : Proc(IAzScope*, UInt32)
    get_type_info_count : Proc(IAzScope*, UInt32*, HRESULT)
    get_type_info : Proc(IAzScope*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzScope*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzScope*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzScope*, UInt8**, HRESULT)
    put_name : Proc(IAzScope*, UInt8*, HRESULT)
    get_description : Proc(IAzScope*, UInt8**, HRESULT)
    put_description : Proc(IAzScope*, UInt8*, HRESULT)
    get_application_data : Proc(IAzScope*, UInt8**, HRESULT)
    put_application_data : Proc(IAzScope*, UInt8*, HRESULT)
    get_writable : Proc(IAzScope*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzScope*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzScope*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzScope*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzScope*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzScope*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzScope*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzScope*, IAzApplicationGroups*, HRESULT)
    open_application_group : Proc(IAzScope*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    create_application_group : Proc(IAzScope*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    get_roles : Proc(IAzScope*, IAzRoles*, HRESULT)
    open_role : Proc(IAzScope*, UInt8*, VARIANT, IAzRole*, HRESULT)
    create_role : Proc(IAzScope*, UInt8*, VARIANT, IAzRole*, HRESULT)
    delete_role : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    get_tasks : Proc(IAzScope*, IAzTasks*, HRESULT)
    open_task : Proc(IAzScope*, UInt8*, VARIANT, IAzTask*, HRESULT)
    create_task : Proc(IAzScope*, UInt8*, VARIANT, IAzTask*, HRESULT)
    delete_task : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    submit : Proc(IAzScope*, Int32, VARIANT, HRESULT)
    get_can_be_delegated : Proc(IAzScope*, LibC::BOOL*, HRESULT)
    get_bizrules_writable : Proc(IAzScope*, LibC::BOOL*, HRESULT)
    get_policy_administrators_name : Proc(IAzScope*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzScope*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzScope*, UInt8*, VARIANT, HRESULT)
  end

  IAzScope_GUID = LibC::GUID.new("00e52487-e08d-4514-b62e-877d5645f5ab")
  CLSID_IAzScope = "00e52487-e08d-4514-b62e-877d5645f5ab"
  struct IAzScope
    lpVtbl : IAzScopeVTbl*
  end

  struct IAzScopesVTbl
    query_interface : Proc(IAzScopes*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzScopes*, UInt32)
    release : Proc(IAzScopes*, UInt32)
    get_type_info_count : Proc(IAzScopes*, UInt32*, HRESULT)
    get_type_info : Proc(IAzScopes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzScopes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzScopes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzScopes*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzScopes*, Int32*, HRESULT)
    get__new_enum : Proc(IAzScopes*, IUnknown*, HRESULT)
  end

  IAzScopes_GUID = LibC::GUID.new("78e14853-9f5e-406d-9b91-6bdba6973510")
  CLSID_IAzScopes = "78e14853-9f5e-406d-9b91-6bdba6973510"
  struct IAzScopes
    lpVtbl : IAzScopesVTbl*
  end

  struct IAzApplicationGroupVTbl
    query_interface : Proc(IAzApplicationGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzApplicationGroup*, UInt32)
    release : Proc(IAzApplicationGroup*, UInt32)
    get_type_info_count : Proc(IAzApplicationGroup*, UInt32*, HRESULT)
    get_type_info : Proc(IAzApplicationGroup*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzApplicationGroup*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzApplicationGroup*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzApplicationGroup*, UInt8**, HRESULT)
    put_name : Proc(IAzApplicationGroup*, UInt8*, HRESULT)
    get_type : Proc(IAzApplicationGroup*, Int32*, HRESULT)
    put_type : Proc(IAzApplicationGroup*, Int32, HRESULT)
    get_ldap_query : Proc(IAzApplicationGroup*, UInt8**, HRESULT)
    put_ldap_query : Proc(IAzApplicationGroup*, UInt8*, HRESULT)
    get_app_members : Proc(IAzApplicationGroup*, VARIANT*, HRESULT)
    get_app_non_members : Proc(IAzApplicationGroup*, VARIANT*, HRESULT)
    get_members : Proc(IAzApplicationGroup*, VARIANT*, HRESULT)
    get_non_members : Proc(IAzApplicationGroup*, VARIANT*, HRESULT)
    get_description : Proc(IAzApplicationGroup*, UInt8**, HRESULT)
    put_description : Proc(IAzApplicationGroup*, UInt8*, HRESULT)
    add_app_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    delete_app_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    add_app_non_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    delete_app_non_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    add_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    delete_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    add_non_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    delete_non_member : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    get_writable : Proc(IAzApplicationGroup*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzApplicationGroup*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzApplicationGroup*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzApplicationGroup*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzApplicationGroup*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzApplicationGroup*, Int32, VARIANT, HRESULT)
    add_member_name : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    delete_member_name : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    add_non_member_name : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    delete_non_member_name : Proc(IAzApplicationGroup*, UInt8*, VARIANT, HRESULT)
    get_members_name : Proc(IAzApplicationGroup*, VARIANT*, HRESULT)
    get_non_members_name : Proc(IAzApplicationGroup*, VARIANT*, HRESULT)
  end

  IAzApplicationGroup_GUID = LibC::GUID.new("f1b744cd-58a6-4e06-9fbf-36f6d779e21e")
  CLSID_IAzApplicationGroup = "f1b744cd-58a6-4e06-9fbf-36f6d779e21e"
  struct IAzApplicationGroup
    lpVtbl : IAzApplicationGroupVTbl*
  end

  struct IAzApplicationGroupsVTbl
    query_interface : Proc(IAzApplicationGroups*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzApplicationGroups*, UInt32)
    release : Proc(IAzApplicationGroups*, UInt32)
    get_type_info_count : Proc(IAzApplicationGroups*, UInt32*, HRESULT)
    get_type_info : Proc(IAzApplicationGroups*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzApplicationGroups*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzApplicationGroups*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzApplicationGroups*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzApplicationGroups*, Int32*, HRESULT)
    get__new_enum : Proc(IAzApplicationGroups*, IUnknown*, HRESULT)
  end

  IAzApplicationGroups_GUID = LibC::GUID.new("4ce66ad5-9f3c-469d-a911-b99887a7e685")
  CLSID_IAzApplicationGroups = "4ce66ad5-9f3c-469d-a911-b99887a7e685"
  struct IAzApplicationGroups
    lpVtbl : IAzApplicationGroupsVTbl*
  end

  struct IAzRoleVTbl
    query_interface : Proc(IAzRole*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzRole*, UInt32)
    release : Proc(IAzRole*, UInt32)
    get_type_info_count : Proc(IAzRole*, UInt32*, HRESULT)
    get_type_info : Proc(IAzRole*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzRole*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzRole*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzRole*, UInt8**, HRESULT)
    put_name : Proc(IAzRole*, UInt8*, HRESULT)
    get_description : Proc(IAzRole*, UInt8**, HRESULT)
    put_description : Proc(IAzRole*, UInt8*, HRESULT)
    get_application_data : Proc(IAzRole*, UInt8**, HRESULT)
    put_application_data : Proc(IAzRole*, UInt8*, HRESULT)
    add_app_member : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    delete_app_member : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    add_task : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    delete_task : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    add_operation : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    delete_operation : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    add_member : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    delete_member : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    get_writable : Proc(IAzRole*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzRole*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzRole*, Int32, VARIANT, VARIANT, HRESULT)
    get_app_members : Proc(IAzRole*, VARIANT*, HRESULT)
    get_members : Proc(IAzRole*, VARIANT*, HRESULT)
    get_operations : Proc(IAzRole*, VARIANT*, HRESULT)
    get_tasks : Proc(IAzRole*, VARIANT*, HRESULT)
    add_property_item : Proc(IAzRole*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzRole*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzRole*, Int32, VARIANT, HRESULT)
    add_member_name : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    delete_member_name : Proc(IAzRole*, UInt8*, VARIANT, HRESULT)
    get_members_name : Proc(IAzRole*, VARIANT*, HRESULT)
  end

  IAzRole_GUID = LibC::GUID.new("859e0d8d-62d7-41d8-a034-c0cd5d43fdfa")
  CLSID_IAzRole = "859e0d8d-62d7-41d8-a034-c0cd5d43fdfa"
  struct IAzRole
    lpVtbl : IAzRoleVTbl*
  end

  struct IAzRolesVTbl
    query_interface : Proc(IAzRoles*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzRoles*, UInt32)
    release : Proc(IAzRoles*, UInt32)
    get_type_info_count : Proc(IAzRoles*, UInt32*, HRESULT)
    get_type_info : Proc(IAzRoles*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzRoles*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzRoles*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzRoles*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzRoles*, Int32*, HRESULT)
    get__new_enum : Proc(IAzRoles*, IUnknown*, HRESULT)
  end

  IAzRoles_GUID = LibC::GUID.new("95e0f119-13b4-4dae-b65f-2f7d60d822e4")
  CLSID_IAzRoles = "95e0f119-13b4-4dae-b65f-2f7d60d822e4"
  struct IAzRoles
    lpVtbl : IAzRolesVTbl*
  end

  struct IAzClientContextVTbl
    query_interface : Proc(IAzClientContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzClientContext*, UInt32)
    release : Proc(IAzClientContext*, UInt32)
    get_type_info_count : Proc(IAzClientContext*, UInt32*, HRESULT)
    get_type_info : Proc(IAzClientContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzClientContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzClientContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    access_check : Proc(IAzClientContext*, UInt8*, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT*, HRESULT)
    get_business_rule_string : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_user_dn : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_user_sam_compat : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_user_display : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_user_guid : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_user_canonical : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_user_upn : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_user_dns_sam_compat : Proc(IAzClientContext*, UInt8**, HRESULT)
    get_property : Proc(IAzClientContext*, Int32, VARIANT, VARIANT*, HRESULT)
    get_roles : Proc(IAzClientContext*, UInt8*, VARIANT*, HRESULT)
    get_role_for_access_check : Proc(IAzClientContext*, UInt8**, HRESULT)
    put_role_for_access_check : Proc(IAzClientContext*, UInt8*, HRESULT)
  end

  IAzClientContext_GUID = LibC::GUID.new("eff1f00b-488a-466d-afd9-a401c5f9eef5")
  CLSID_IAzClientContext = "eff1f00b-488a-466d-afd9-a401c5f9eef5"
  struct IAzClientContext
    lpVtbl : IAzClientContextVTbl*
  end

  struct IAzClientContext2VTbl
    query_interface : Proc(IAzClientContext2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzClientContext2*, UInt32)
    release : Proc(IAzClientContext2*, UInt32)
    get_type_info_count : Proc(IAzClientContext2*, UInt32*, HRESULT)
    get_type_info : Proc(IAzClientContext2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzClientContext2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzClientContext2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    access_check : Proc(IAzClientContext2*, UInt8*, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT*, HRESULT)
    get_business_rule_string : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_user_dn : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_user_sam_compat : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_user_display : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_user_guid : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_user_canonical : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_user_upn : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_user_dns_sam_compat : Proc(IAzClientContext2*, UInt8**, HRESULT)
    get_property : Proc(IAzClientContext2*, Int32, VARIANT, VARIANT*, HRESULT)
    get_roles : Proc(IAzClientContext2*, UInt8*, VARIANT*, HRESULT)
    get_role_for_access_check : Proc(IAzClientContext2*, UInt8**, HRESULT)
    put_role_for_access_check : Proc(IAzClientContext2*, UInt8*, HRESULT)
    get_assigned_scopes_page : Proc(IAzClientContext2*, Int32, Int32, VARIANT*, VARIANT*, HRESULT)
    add_roles : Proc(IAzClientContext2*, VARIANT, UInt8*, HRESULT)
    add_application_groups : Proc(IAzClientContext2*, VARIANT, HRESULT)
    add_string_sids : Proc(IAzClientContext2*, VARIANT, HRESULT)
    put_ldap_query_dn : Proc(IAzClientContext2*, UInt8*, HRESULT)
    get_ldap_query_dn : Proc(IAzClientContext2*, UInt8**, HRESULT)
  end

  IAzClientContext2_GUID = LibC::GUID.new("2b0c92b8-208a-488a-8f81-e4edb22111cd")
  CLSID_IAzClientContext2 = "2b0c92b8-208a-488a-8f81-e4edb22111cd"
  struct IAzClientContext2
    lpVtbl : IAzClientContext2VTbl*
  end

  struct IAzBizRuleContextVTbl
    query_interface : Proc(IAzBizRuleContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzBizRuleContext*, UInt32)
    release : Proc(IAzBizRuleContext*, UInt32)
    get_type_info_count : Proc(IAzBizRuleContext*, UInt32*, HRESULT)
    get_type_info : Proc(IAzBizRuleContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzBizRuleContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzBizRuleContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    put_business_rule_result : Proc(IAzBizRuleContext*, LibC::BOOL, HRESULT)
    put_business_rule_string : Proc(IAzBizRuleContext*, UInt8*, HRESULT)
    get_business_rule_string : Proc(IAzBizRuleContext*, UInt8**, HRESULT)
    get_parameter : Proc(IAzBizRuleContext*, UInt8*, VARIANT*, HRESULT)
  end

  IAzBizRuleContext_GUID = LibC::GUID.new("e192f17d-d59f-455e-a152-940316cd77b2")
  CLSID_IAzBizRuleContext = "e192f17d-d59f-455e-a152-940316cd77b2"
  struct IAzBizRuleContext
    lpVtbl : IAzBizRuleContextVTbl*
  end

  struct IAzBizRuleParametersVTbl
    query_interface : Proc(IAzBizRuleParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzBizRuleParameters*, UInt32)
    release : Proc(IAzBizRuleParameters*, UInt32)
    get_type_info_count : Proc(IAzBizRuleParameters*, UInt32*, HRESULT)
    get_type_info : Proc(IAzBizRuleParameters*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzBizRuleParameters*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzBizRuleParameters*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    add_parameter : Proc(IAzBizRuleParameters*, UInt8*, VARIANT, HRESULT)
    add_parameters : Proc(IAzBizRuleParameters*, VARIANT, VARIANT, HRESULT)
    get_parameter_value : Proc(IAzBizRuleParameters*, UInt8*, VARIANT*, HRESULT)
    remove : Proc(IAzBizRuleParameters*, UInt8*, HRESULT)
    remove_all : Proc(IAzBizRuleParameters*, HRESULT)
    get_count : Proc(IAzBizRuleParameters*, UInt32*, HRESULT)
  end

  IAzBizRuleParameters_GUID = LibC::GUID.new("fc17685f-e25d-4dcd-bae1-276ec9533cb5")
  CLSID_IAzBizRuleParameters = "fc17685f-e25d-4dcd-bae1-276ec9533cb5"
  struct IAzBizRuleParameters
    lpVtbl : IAzBizRuleParametersVTbl*
  end

  struct IAzBizRuleInterfacesVTbl
    query_interface : Proc(IAzBizRuleInterfaces*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzBizRuleInterfaces*, UInt32)
    release : Proc(IAzBizRuleInterfaces*, UInt32)
    get_type_info_count : Proc(IAzBizRuleInterfaces*, UInt32*, HRESULT)
    get_type_info : Proc(IAzBizRuleInterfaces*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzBizRuleInterfaces*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzBizRuleInterfaces*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    add_interface : Proc(IAzBizRuleInterfaces*, UInt8*, Int32, VARIANT, HRESULT)
    add_interfaces : Proc(IAzBizRuleInterfaces*, VARIANT, VARIANT, VARIANT, HRESULT)
    get_interface_value : Proc(IAzBizRuleInterfaces*, UInt8*, Int32*, VARIANT*, HRESULT)
    remove : Proc(IAzBizRuleInterfaces*, UInt8*, HRESULT)
    remove_all : Proc(IAzBizRuleInterfaces*, HRESULT)
    get_count : Proc(IAzBizRuleInterfaces*, UInt32*, HRESULT)
  end

  IAzBizRuleInterfaces_GUID = LibC::GUID.new("e94128c7-e9da-44cc-b0bd-53036f3aab3d")
  CLSID_IAzBizRuleInterfaces = "e94128c7-e9da-44cc-b0bd-53036f3aab3d"
  struct IAzBizRuleInterfaces
    lpVtbl : IAzBizRuleInterfacesVTbl*
  end

  struct IAzClientContext3VTbl
    query_interface : Proc(IAzClientContext3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzClientContext3*, UInt32)
    release : Proc(IAzClientContext3*, UInt32)
    get_type_info_count : Proc(IAzClientContext3*, UInt32*, HRESULT)
    get_type_info : Proc(IAzClientContext3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzClientContext3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzClientContext3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    access_check : Proc(IAzClientContext3*, UInt8*, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT*, HRESULT)
    get_business_rule_string : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_user_dn : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_user_sam_compat : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_user_display : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_user_guid : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_user_canonical : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_user_upn : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_user_dns_sam_compat : Proc(IAzClientContext3*, UInt8**, HRESULT)
    get_property : Proc(IAzClientContext3*, Int32, VARIANT, VARIANT*, HRESULT)
    get_roles : Proc(IAzClientContext3*, UInt8*, VARIANT*, HRESULT)
    get_role_for_access_check : Proc(IAzClientContext3*, UInt8**, HRESULT)
    put_role_for_access_check : Proc(IAzClientContext3*, UInt8*, HRESULT)
    get_assigned_scopes_page : Proc(IAzClientContext3*, Int32, Int32, VARIANT*, VARIANT*, HRESULT)
    add_roles : Proc(IAzClientContext3*, VARIANT, UInt8*, HRESULT)
    add_application_groups : Proc(IAzClientContext3*, VARIANT, HRESULT)
    add_string_sids : Proc(IAzClientContext3*, VARIANT, HRESULT)
    put_ldap_query_dn : Proc(IAzClientContext3*, UInt8*, HRESULT)
    get_ldap_query_dn : Proc(IAzClientContext3*, UInt8**, HRESULT)
    access_check2 : Proc(IAzClientContext3*, UInt8*, UInt8*, Int32, UInt32*, HRESULT)
    is_in_role_assignment : Proc(IAzClientContext3*, UInt8*, UInt8*, Int16*, HRESULT)
    get_operations : Proc(IAzClientContext3*, UInt8*, IAzOperations*, HRESULT)
    get_tasks : Proc(IAzClientContext3*, UInt8*, IAzTasks*, HRESULT)
    get_biz_rule_parameters : Proc(IAzClientContext3*, IAzBizRuleParameters*, HRESULT)
    get_biz_rule_interfaces : Proc(IAzClientContext3*, IAzBizRuleInterfaces*, HRESULT)
    get_groups : Proc(IAzClientContext3*, UInt8*, AZ_PROP_CONSTANTS, VARIANT*, HRESULT)
    get_sids : Proc(IAzClientContext3*, VARIANT*, HRESULT)
  end

  IAzClientContext3_GUID = LibC::GUID.new("11894fde-1deb-4b4b-8907-6d1cda1f5d4f")
  CLSID_IAzClientContext3 = "11894fde-1deb-4b4b-8907-6d1cda1f5d4f"
  struct IAzClientContext3
    lpVtbl : IAzClientContext3VTbl*
  end

  struct IAzScope2VTbl
    query_interface : Proc(IAzScope2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzScope2*, UInt32)
    release : Proc(IAzScope2*, UInt32)
    get_type_info_count : Proc(IAzScope2*, UInt32*, HRESULT)
    get_type_info : Proc(IAzScope2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzScope2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzScope2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzScope2*, UInt8**, HRESULT)
    put_name : Proc(IAzScope2*, UInt8*, HRESULT)
    get_description : Proc(IAzScope2*, UInt8**, HRESULT)
    put_description : Proc(IAzScope2*, UInt8*, HRESULT)
    get_application_data : Proc(IAzScope2*, UInt8**, HRESULT)
    put_application_data : Proc(IAzScope2*, UInt8*, HRESULT)
    get_writable : Proc(IAzScope2*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzScope2*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzScope2*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzScope2*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzScope2*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzScope2*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzScope2*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzScope2*, IAzApplicationGroups*, HRESULT)
    open_application_group : Proc(IAzScope2*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    create_application_group : Proc(IAzScope2*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    get_roles : Proc(IAzScope2*, IAzRoles*, HRESULT)
    open_role : Proc(IAzScope2*, UInt8*, VARIANT, IAzRole*, HRESULT)
    create_role : Proc(IAzScope2*, UInt8*, VARIANT, IAzRole*, HRESULT)
    delete_role : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    get_tasks : Proc(IAzScope2*, IAzTasks*, HRESULT)
    open_task : Proc(IAzScope2*, UInt8*, VARIANT, IAzTask*, HRESULT)
    create_task : Proc(IAzScope2*, UInt8*, VARIANT, IAzTask*, HRESULT)
    delete_task : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    submit : Proc(IAzScope2*, Int32, VARIANT, HRESULT)
    get_can_be_delegated : Proc(IAzScope2*, LibC::BOOL*, HRESULT)
    get_bizrules_writable : Proc(IAzScope2*, LibC::BOOL*, HRESULT)
    get_policy_administrators_name : Proc(IAzScope2*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzScope2*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzScope2*, UInt8*, VARIANT, HRESULT)
    get_role_definitions : Proc(IAzScope2*, IAzRoleDefinitions*, HRESULT)
    create_role_definition : Proc(IAzScope2*, UInt8*, IAzRoleDefinition*, HRESULT)
    open_role_definition : Proc(IAzScope2*, UInt8*, IAzRoleDefinition*, HRESULT)
    delete_role_definition : Proc(IAzScope2*, UInt8*, HRESULT)
    get_role_assignments : Proc(IAzScope2*, IAzRoleAssignments*, HRESULT)
    create_role_assignment : Proc(IAzScope2*, UInt8*, IAzRoleAssignment*, HRESULT)
    open_role_assignment : Proc(IAzScope2*, UInt8*, IAzRoleAssignment*, HRESULT)
    delete_role_assignment : Proc(IAzScope2*, UInt8*, HRESULT)
  end

  IAzScope2_GUID = LibC::GUID.new("ee9fe8c9-c9f3-40e2-aa12-d1d8599727fd")
  CLSID_IAzScope2 = "ee9fe8c9-c9f3-40e2-aa12-d1d8599727fd"
  struct IAzScope2
    lpVtbl : IAzScope2VTbl*
  end

  struct IAzApplication3VTbl
    query_interface : Proc(IAzApplication3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzApplication3*, UInt32)
    release : Proc(IAzApplication3*, UInt32)
    get_type_info_count : Proc(IAzApplication3*, UInt32*, HRESULT)
    get_type_info : Proc(IAzApplication3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzApplication3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzApplication3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzApplication3*, UInt8**, HRESULT)
    put_name : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_description : Proc(IAzApplication3*, UInt8**, HRESULT)
    put_description : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_application_data : Proc(IAzApplication3*, UInt8**, HRESULT)
    put_application_data : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_authz_interface_clsid : Proc(IAzApplication3*, UInt8**, HRESULT)
    put_authz_interface_clsid : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_version : Proc(IAzApplication3*, UInt8**, HRESULT)
    put_version : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_generate_audits : Proc(IAzApplication3*, LibC::BOOL*, HRESULT)
    put_generate_audits : Proc(IAzApplication3*, LibC::BOOL, HRESULT)
    get_apply_store_sacl : Proc(IAzApplication3*, LibC::BOOL*, HRESULT)
    put_apply_store_sacl : Proc(IAzApplication3*, LibC::BOOL, HRESULT)
    get_writable : Proc(IAzApplication3*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzApplication3*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzApplication3*, Int32, VARIANT, VARIANT, HRESULT)
    get_policy_administrators : Proc(IAzApplication3*, VARIANT*, HRESULT)
    get_policy_readers : Proc(IAzApplication3*, VARIANT*, HRESULT)
    add_policy_administrator : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    add_policy_reader : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    get_scopes : Proc(IAzApplication3*, IAzScopes*, HRESULT)
    open_scope : Proc(IAzApplication3*, UInt8*, VARIANT, IAzScope*, HRESULT)
    create_scope : Proc(IAzApplication3*, UInt8*, VARIANT, IAzScope*, HRESULT)
    delete_scope : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    get_operations : Proc(IAzApplication3*, IAzOperations*, HRESULT)
    open_operation : Proc(IAzApplication3*, UInt8*, VARIANT, IAzOperation*, HRESULT)
    create_operation : Proc(IAzApplication3*, UInt8*, VARIANT, IAzOperation*, HRESULT)
    delete_operation : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    get_tasks : Proc(IAzApplication3*, IAzTasks*, HRESULT)
    open_task : Proc(IAzApplication3*, UInt8*, VARIANT, IAzTask*, HRESULT)
    create_task : Proc(IAzApplication3*, UInt8*, VARIANT, IAzTask*, HRESULT)
    delete_task : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    get_application_groups : Proc(IAzApplication3*, IAzApplicationGroups*, HRESULT)
    open_application_group : Proc(IAzApplication3*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    create_application_group : Proc(IAzApplication3*, UInt8*, VARIANT, IAzApplicationGroup*, HRESULT)
    delete_application_group : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    get_roles : Proc(IAzApplication3*, IAzRoles*, HRESULT)
    open_role : Proc(IAzApplication3*, UInt8*, VARIANT, IAzRole*, HRESULT)
    create_role : Proc(IAzApplication3*, UInt8*, VARIANT, IAzRole*, HRESULT)
    delete_role : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_token : Proc(IAzApplication3*, UInt64, VARIANT, IAzClientContext*, HRESULT)
    add_property_item : Proc(IAzApplication3*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzApplication3*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzApplication3*, Int32, VARIANT, HRESULT)
    initialize_client_context_from_name : Proc(IAzApplication3*, UInt8*, UInt8*, VARIANT, IAzClientContext*, HRESULT)
    get_delegated_policy_users : Proc(IAzApplication3*, VARIANT*, HRESULT)
    add_delegated_policy_user : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_string_sid : Proc(IAzApplication3*, UInt8*, Int32, VARIANT, IAzClientContext*, HRESULT)
    get_policy_administrators_name : Proc(IAzApplication3*, VARIANT*, HRESULT)
    get_policy_readers_name : Proc(IAzApplication3*, VARIANT*, HRESULT)
    add_policy_administrator_name : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    delete_policy_administrator_name : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    add_policy_reader_name : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    delete_policy_reader_name : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    get_delegated_policy_users_name : Proc(IAzApplication3*, VARIANT*, HRESULT)
    add_delegated_policy_user_name : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    delete_delegated_policy_user_name : Proc(IAzApplication3*, UInt8*, VARIANT, HRESULT)
    initialize_client_context_from_token2 : Proc(IAzApplication3*, UInt32, UInt32, VARIANT, IAzClientContext2*, HRESULT)
    initialize_client_context2 : Proc(IAzApplication3*, UInt8*, VARIANT, IAzClientContext2*, HRESULT)
    scope_exists : Proc(IAzApplication3*, UInt8*, Int16*, HRESULT)
    open_scope2 : Proc(IAzApplication3*, UInt8*, IAzScope2*, HRESULT)
    create_scope2 : Proc(IAzApplication3*, UInt8*, IAzScope2*, HRESULT)
    delete_scope2 : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_role_definitions : Proc(IAzApplication3*, IAzRoleDefinitions*, HRESULT)
    create_role_definition : Proc(IAzApplication3*, UInt8*, IAzRoleDefinition*, HRESULT)
    open_role_definition : Proc(IAzApplication3*, UInt8*, IAzRoleDefinition*, HRESULT)
    delete_role_definition : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_role_assignments : Proc(IAzApplication3*, IAzRoleAssignments*, HRESULT)
    create_role_assignment : Proc(IAzApplication3*, UInt8*, IAzRoleAssignment*, HRESULT)
    open_role_assignment : Proc(IAzApplication3*, UInt8*, IAzRoleAssignment*, HRESULT)
    delete_role_assignment : Proc(IAzApplication3*, UInt8*, HRESULT)
    get_biz_rules_enabled : Proc(IAzApplication3*, Int16*, HRESULT)
    put_biz_rules_enabled : Proc(IAzApplication3*, Int16, HRESULT)
  end

  IAzApplication3_GUID = LibC::GUID.new("181c845e-7196-4a7d-ac2e-020c0bb7a303")
  CLSID_IAzApplication3 = "181c845e-7196-4a7d-ac2e-020c0bb7a303"
  struct IAzApplication3
    lpVtbl : IAzApplication3VTbl*
  end

  struct IAzOperation2VTbl
    query_interface : Proc(IAzOperation2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzOperation2*, UInt32)
    release : Proc(IAzOperation2*, UInt32)
    get_type_info_count : Proc(IAzOperation2*, UInt32*, HRESULT)
    get_type_info : Proc(IAzOperation2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzOperation2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzOperation2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzOperation2*, UInt8**, HRESULT)
    put_name : Proc(IAzOperation2*, UInt8*, HRESULT)
    get_description : Proc(IAzOperation2*, UInt8**, HRESULT)
    put_description : Proc(IAzOperation2*, UInt8*, HRESULT)
    get_application_data : Proc(IAzOperation2*, UInt8**, HRESULT)
    put_application_data : Proc(IAzOperation2*, UInt8*, HRESULT)
    get_operation_id : Proc(IAzOperation2*, Int32*, HRESULT)
    put_operation_id : Proc(IAzOperation2*, Int32, HRESULT)
    get_writable : Proc(IAzOperation2*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzOperation2*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzOperation2*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzOperation2*, Int32, VARIANT, HRESULT)
    role_assignments : Proc(IAzOperation2*, UInt8*, Int16, IAzRoleAssignments*, HRESULT)
  end

  IAzOperation2_GUID = LibC::GUID.new("1f5ea01f-44a2-4184-9c48-a75b4dcc8ccc")
  CLSID_IAzOperation2 = "1f5ea01f-44a2-4184-9c48-a75b4dcc8ccc"
  struct IAzOperation2
    lpVtbl : IAzOperation2VTbl*
  end

  struct IAzRoleDefinitionsVTbl
    query_interface : Proc(IAzRoleDefinitions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzRoleDefinitions*, UInt32)
    release : Proc(IAzRoleDefinitions*, UInt32)
    get_type_info_count : Proc(IAzRoleDefinitions*, UInt32*, HRESULT)
    get_type_info : Proc(IAzRoleDefinitions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzRoleDefinitions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzRoleDefinitions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzRoleDefinitions*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzRoleDefinitions*, Int32*, HRESULT)
    get__new_enum : Proc(IAzRoleDefinitions*, IUnknown*, HRESULT)
  end

  IAzRoleDefinitions_GUID = LibC::GUID.new("881f25a5-d755-4550-957a-d503a3b34001")
  CLSID_IAzRoleDefinitions = "881f25a5-d755-4550-957a-d503a3b34001"
  struct IAzRoleDefinitions
    lpVtbl : IAzRoleDefinitionsVTbl*
  end

  struct IAzRoleDefinitionVTbl
    query_interface : Proc(IAzRoleDefinition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzRoleDefinition*, UInt32)
    release : Proc(IAzRoleDefinition*, UInt32)
    get_type_info_count : Proc(IAzRoleDefinition*, UInt32*, HRESULT)
    get_type_info : Proc(IAzRoleDefinition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzRoleDefinition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzRoleDefinition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzRoleDefinition*, UInt8**, HRESULT)
    put_name : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    get_description : Proc(IAzRoleDefinition*, UInt8**, HRESULT)
    put_description : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    get_application_data : Proc(IAzRoleDefinition*, UInt8**, HRESULT)
    put_application_data : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    get_biz_rule : Proc(IAzRoleDefinition*, UInt8**, HRESULT)
    put_biz_rule : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    get_biz_rule_language : Proc(IAzRoleDefinition*, UInt8**, HRESULT)
    put_biz_rule_language : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    get_biz_rule_imported_path : Proc(IAzRoleDefinition*, UInt8**, HRESULT)
    put_biz_rule_imported_path : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    get_is_role_definition : Proc(IAzRoleDefinition*, LibC::BOOL*, HRESULT)
    put_is_role_definition : Proc(IAzRoleDefinition*, LibC::BOOL, HRESULT)
    get_operations : Proc(IAzRoleDefinition*, VARIANT*, HRESULT)
    get_tasks : Proc(IAzRoleDefinition*, VARIANT*, HRESULT)
    add_operation : Proc(IAzRoleDefinition*, UInt8*, VARIANT, HRESULT)
    delete_operation : Proc(IAzRoleDefinition*, UInt8*, VARIANT, HRESULT)
    add_task : Proc(IAzRoleDefinition*, UInt8*, VARIANT, HRESULT)
    delete_task : Proc(IAzRoleDefinition*, UInt8*, VARIANT, HRESULT)
    get_writable : Proc(IAzRoleDefinition*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzRoleDefinition*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzRoleDefinition*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzRoleDefinition*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzRoleDefinition*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzRoleDefinition*, Int32, VARIANT, HRESULT)
    role_assignments : Proc(IAzRoleDefinition*, UInt8*, Int16, IAzRoleAssignments*, HRESULT)
    add_role_definition : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    delete_role_definition : Proc(IAzRoleDefinition*, UInt8*, HRESULT)
    get_role_definitions : Proc(IAzRoleDefinition*, IAzRoleDefinitions*, HRESULT)
  end

  IAzRoleDefinition_GUID = LibC::GUID.new("d97fcea1-2599-44f1-9fc3-58e9fbe09466")
  CLSID_IAzRoleDefinition = "d97fcea1-2599-44f1-9fc3-58e9fbe09466"
  struct IAzRoleDefinition
    lpVtbl : IAzRoleDefinitionVTbl*
  end

  struct IAzRoleAssignmentVTbl
    query_interface : Proc(IAzRoleAssignment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzRoleAssignment*, UInt32)
    release : Proc(IAzRoleAssignment*, UInt32)
    get_type_info_count : Proc(IAzRoleAssignment*, UInt32*, HRESULT)
    get_type_info : Proc(IAzRoleAssignment*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzRoleAssignment*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzRoleAssignment*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzRoleAssignment*, UInt8**, HRESULT)
    put_name : Proc(IAzRoleAssignment*, UInt8*, HRESULT)
    get_description : Proc(IAzRoleAssignment*, UInt8**, HRESULT)
    put_description : Proc(IAzRoleAssignment*, UInt8*, HRESULT)
    get_application_data : Proc(IAzRoleAssignment*, UInt8**, HRESULT)
    put_application_data : Proc(IAzRoleAssignment*, UInt8*, HRESULT)
    add_app_member : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    delete_app_member : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    add_task : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    delete_task : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    add_operation : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    delete_operation : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    add_member : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    delete_member : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    get_writable : Proc(IAzRoleAssignment*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzRoleAssignment*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzRoleAssignment*, Int32, VARIANT, VARIANT, HRESULT)
    get_app_members : Proc(IAzRoleAssignment*, VARIANT*, HRESULT)
    get_members : Proc(IAzRoleAssignment*, VARIANT*, HRESULT)
    get_operations : Proc(IAzRoleAssignment*, VARIANT*, HRESULT)
    get_tasks : Proc(IAzRoleAssignment*, VARIANT*, HRESULT)
    add_property_item : Proc(IAzRoleAssignment*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzRoleAssignment*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzRoleAssignment*, Int32, VARIANT, HRESULT)
    add_member_name : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    delete_member_name : Proc(IAzRoleAssignment*, UInt8*, VARIANT, HRESULT)
    get_members_name : Proc(IAzRoleAssignment*, VARIANT*, HRESULT)
    add_role_definition : Proc(IAzRoleAssignment*, UInt8*, HRESULT)
    delete_role_definition : Proc(IAzRoleAssignment*, UInt8*, HRESULT)
    get_role_definitions : Proc(IAzRoleAssignment*, IAzRoleDefinitions*, HRESULT)
    get_scope : Proc(IAzRoleAssignment*, IAzScope*, HRESULT)
  end

  IAzRoleAssignment_GUID = LibC::GUID.new("55647d31-0d5a-4fa3-b4ac-2b5f9ad5ab76")
  CLSID_IAzRoleAssignment = "55647d31-0d5a-4fa3-b4ac-2b5f9ad5ab76"
  struct IAzRoleAssignment
    lpVtbl : IAzRoleAssignmentVTbl*
  end

  struct IAzRoleAssignmentsVTbl
    query_interface : Proc(IAzRoleAssignments*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzRoleAssignments*, UInt32)
    release : Proc(IAzRoleAssignments*, UInt32)
    get_type_info_count : Proc(IAzRoleAssignments*, UInt32*, HRESULT)
    get_type_info : Proc(IAzRoleAssignments*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzRoleAssignments*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzRoleAssignments*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IAzRoleAssignments*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IAzRoleAssignments*, Int32*, HRESULT)
    get__new_enum : Proc(IAzRoleAssignments*, IUnknown*, HRESULT)
  end

  IAzRoleAssignments_GUID = LibC::GUID.new("9c80b900-fceb-4d73-a0f4-c83b0bbf2481")
  CLSID_IAzRoleAssignments = "9c80b900-fceb-4d73-a0f4-c83b0bbf2481"
  struct IAzRoleAssignments
    lpVtbl : IAzRoleAssignmentsVTbl*
  end

  struct IAzPrincipalLocatorVTbl
    query_interface : Proc(IAzPrincipalLocator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzPrincipalLocator*, UInt32)
    release : Proc(IAzPrincipalLocator*, UInt32)
    get_type_info_count : Proc(IAzPrincipalLocator*, UInt32*, HRESULT)
    get_type_info : Proc(IAzPrincipalLocator*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzPrincipalLocator*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzPrincipalLocator*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name_resolver : Proc(IAzPrincipalLocator*, IAzNameResolver*, HRESULT)
    get_object_picker : Proc(IAzPrincipalLocator*, IAzObjectPicker*, HRESULT)
  end

  IAzPrincipalLocator_GUID = LibC::GUID.new("e5c3507d-ad6a-4992-9c7f-74ab480b44cc")
  CLSID_IAzPrincipalLocator = "e5c3507d-ad6a-4992-9c7f-74ab480b44cc"
  struct IAzPrincipalLocator
    lpVtbl : IAzPrincipalLocatorVTbl*
  end

  struct IAzNameResolverVTbl
    query_interface : Proc(IAzNameResolver*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzNameResolver*, UInt32)
    release : Proc(IAzNameResolver*, UInt32)
    get_type_info_count : Proc(IAzNameResolver*, UInt32*, HRESULT)
    get_type_info : Proc(IAzNameResolver*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzNameResolver*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzNameResolver*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    name_from_sid : Proc(IAzNameResolver*, UInt8*, Int32*, UInt8**, HRESULT)
    names_from_sids : Proc(IAzNameResolver*, VARIANT, VARIANT*, VARIANT*, HRESULT)
  end

  IAzNameResolver_GUID = LibC::GUID.new("504d0f15-73e2-43df-a870-a64f40714f53")
  CLSID_IAzNameResolver = "504d0f15-73e2-43df-a870-a64f40714f53"
  struct IAzNameResolver
    lpVtbl : IAzNameResolverVTbl*
  end

  struct IAzObjectPickerVTbl
    query_interface : Proc(IAzObjectPicker*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzObjectPicker*, UInt32)
    release : Proc(IAzObjectPicker*, UInt32)
    get_type_info_count : Proc(IAzObjectPicker*, UInt32*, HRESULT)
    get_type_info : Proc(IAzObjectPicker*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzObjectPicker*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzObjectPicker*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_principals : Proc(IAzObjectPicker*, LibC::HANDLE, UInt8*, VARIANT*, VARIANT*, VARIANT*, HRESULT)
    get_name : Proc(IAzObjectPicker*, UInt8**, HRESULT)
  end

  IAzObjectPicker_GUID = LibC::GUID.new("63130a48-699a-42d8-bf01-c62ac3fb79f9")
  CLSID_IAzObjectPicker = "63130a48-699a-42d8-bf01-c62ac3fb79f9"
  struct IAzObjectPicker
    lpVtbl : IAzObjectPickerVTbl*
  end

  struct IAzApplicationGroup2VTbl
    query_interface : Proc(IAzApplicationGroup2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzApplicationGroup2*, UInt32)
    release : Proc(IAzApplicationGroup2*, UInt32)
    get_type_info_count : Proc(IAzApplicationGroup2*, UInt32*, HRESULT)
    get_type_info : Proc(IAzApplicationGroup2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzApplicationGroup2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzApplicationGroup2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzApplicationGroup2*, UInt8**, HRESULT)
    put_name : Proc(IAzApplicationGroup2*, UInt8*, HRESULT)
    get_type : Proc(IAzApplicationGroup2*, Int32*, HRESULT)
    put_type : Proc(IAzApplicationGroup2*, Int32, HRESULT)
    get_ldap_query : Proc(IAzApplicationGroup2*, UInt8**, HRESULT)
    put_ldap_query : Proc(IAzApplicationGroup2*, UInt8*, HRESULT)
    get_app_members : Proc(IAzApplicationGroup2*, VARIANT*, HRESULT)
    get_app_non_members : Proc(IAzApplicationGroup2*, VARIANT*, HRESULT)
    get_members : Proc(IAzApplicationGroup2*, VARIANT*, HRESULT)
    get_non_members : Proc(IAzApplicationGroup2*, VARIANT*, HRESULT)
    get_description : Proc(IAzApplicationGroup2*, UInt8**, HRESULT)
    put_description : Proc(IAzApplicationGroup2*, UInt8*, HRESULT)
    add_app_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    delete_app_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    add_app_non_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    delete_app_non_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    add_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    delete_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    add_non_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    delete_non_member : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    get_writable : Proc(IAzApplicationGroup2*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzApplicationGroup2*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzApplicationGroup2*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzApplicationGroup2*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzApplicationGroup2*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzApplicationGroup2*, Int32, VARIANT, HRESULT)
    add_member_name : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    delete_member_name : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    add_non_member_name : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    delete_non_member_name : Proc(IAzApplicationGroup2*, UInt8*, VARIANT, HRESULT)
    get_members_name : Proc(IAzApplicationGroup2*, VARIANT*, HRESULT)
    get_non_members_name : Proc(IAzApplicationGroup2*, VARIANT*, HRESULT)
    get_biz_rule : Proc(IAzApplicationGroup2*, UInt8**, HRESULT)
    put_biz_rule : Proc(IAzApplicationGroup2*, UInt8*, HRESULT)
    get_biz_rule_language : Proc(IAzApplicationGroup2*, UInt8**, HRESULT)
    put_biz_rule_language : Proc(IAzApplicationGroup2*, UInt8*, HRESULT)
    get_biz_rule_imported_path : Proc(IAzApplicationGroup2*, UInt8**, HRESULT)
    put_biz_rule_imported_path : Proc(IAzApplicationGroup2*, UInt8*, HRESULT)
    role_assignments : Proc(IAzApplicationGroup2*, UInt8*, Int16, IAzRoleAssignments*, HRESULT)
  end

  IAzApplicationGroup2_GUID = LibC::GUID.new("3f0613fc-b71a-464e-a11d-5b881a56cefa")
  CLSID_IAzApplicationGroup2 = "3f0613fc-b71a-464e-a11d-5b881a56cefa"
  struct IAzApplicationGroup2
    lpVtbl : IAzApplicationGroup2VTbl*
  end

  struct IAzTask2VTbl
    query_interface : Proc(IAzTask2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAzTask2*, UInt32)
    release : Proc(IAzTask2*, UInt32)
    get_type_info_count : Proc(IAzTask2*, UInt32*, HRESULT)
    get_type_info : Proc(IAzTask2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAzTask2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAzTask2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IAzTask2*, UInt8**, HRESULT)
    put_name : Proc(IAzTask2*, UInt8*, HRESULT)
    get_description : Proc(IAzTask2*, UInt8**, HRESULT)
    put_description : Proc(IAzTask2*, UInt8*, HRESULT)
    get_application_data : Proc(IAzTask2*, UInt8**, HRESULT)
    put_application_data : Proc(IAzTask2*, UInt8*, HRESULT)
    get_biz_rule : Proc(IAzTask2*, UInt8**, HRESULT)
    put_biz_rule : Proc(IAzTask2*, UInt8*, HRESULT)
    get_biz_rule_language : Proc(IAzTask2*, UInt8**, HRESULT)
    put_biz_rule_language : Proc(IAzTask2*, UInt8*, HRESULT)
    get_biz_rule_imported_path : Proc(IAzTask2*, UInt8**, HRESULT)
    put_biz_rule_imported_path : Proc(IAzTask2*, UInt8*, HRESULT)
    get_is_role_definition : Proc(IAzTask2*, LibC::BOOL*, HRESULT)
    put_is_role_definition : Proc(IAzTask2*, LibC::BOOL, HRESULT)
    get_operations : Proc(IAzTask2*, VARIANT*, HRESULT)
    get_tasks : Proc(IAzTask2*, VARIANT*, HRESULT)
    add_operation : Proc(IAzTask2*, UInt8*, VARIANT, HRESULT)
    delete_operation : Proc(IAzTask2*, UInt8*, VARIANT, HRESULT)
    add_task : Proc(IAzTask2*, UInt8*, VARIANT, HRESULT)
    delete_task : Proc(IAzTask2*, UInt8*, VARIANT, HRESULT)
    get_writable : Proc(IAzTask2*, LibC::BOOL*, HRESULT)
    get_property : Proc(IAzTask2*, Int32, VARIANT, VARIANT*, HRESULT)
    set_property : Proc(IAzTask2*, Int32, VARIANT, VARIANT, HRESULT)
    add_property_item : Proc(IAzTask2*, Int32, VARIANT, VARIANT, HRESULT)
    delete_property_item : Proc(IAzTask2*, Int32, VARIANT, VARIANT, HRESULT)
    submit : Proc(IAzTask2*, Int32, VARIANT, HRESULT)
    role_assignments : Proc(IAzTask2*, UInt8*, Int16, IAzRoleAssignments*, HRESULT)
  end

  IAzTask2_GUID = LibC::GUID.new("03a9a5ee-48c8-4832-9025-aad503c46526")
  CLSID_IAzTask2 = "03a9a5ee-48c8-4832-9025-aad503c46526"
  struct IAzTask2
    lpVtbl : IAzTask2VTbl*
  end


  # Params # flags : AUTHZ_ACCESS_CHECK_FLAGS [In],hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],prequest : AUTHZ_ACCESS_REQUEST* [In],hauditevent : AUTHZ_AUDIT_EVENT_HANDLE [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],optionalsecuritydescriptorarray : SECURITY_DESCRIPTOR** [In],optionalsecuritydescriptorcount : UInt32 [In],preply : AUTHZ_ACCESS_REPLY* [In],phaccesscheckresults : LibC::IntPtrT* [In]
  fun AuthzAccessCheck(flags : AUTHZ_ACCESS_CHECK_FLAGS, hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, prequest : AUTHZ_ACCESS_REQUEST*, hauditevent : AUTHZ_AUDIT_EVENT_HANDLE, psecuritydescriptor : SECURITY_DESCRIPTOR*, optionalsecuritydescriptorarray : SECURITY_DESCRIPTOR**, optionalsecuritydescriptorcount : UInt32, preply : AUTHZ_ACCESS_REPLY*, phaccesscheckresults : LibC::IntPtrT*) : LibC::BOOL

  # Params # flags : UInt32 [In],haccesscheckresults : AUTHZ_ACCESS_CHECK_RESULTS_HANDLE [In],prequest : AUTHZ_ACCESS_REQUEST* [In],hauditevent : AUTHZ_AUDIT_EVENT_HANDLE [In],preply : AUTHZ_ACCESS_REPLY* [In]
  fun AuthzCachedAccessCheck(flags : UInt32, haccesscheckresults : AUTHZ_ACCESS_CHECK_RESULTS_HANDLE, prequest : AUTHZ_ACCESS_REQUEST*, hauditevent : AUTHZ_AUDIT_EVENT_HANDLE, preply : AUTHZ_ACCESS_REPLY*) : LibC::BOOL

  # Params # flags : UInt32 [In],hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],prequest : AUTHZ_ACCESS_REQUEST* [In],hauditevent : AUTHZ_AUDIT_EVENT_HANDLE [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],optionalsecuritydescriptorarray : SECURITY_DESCRIPTOR** [In],optionalsecuritydescriptorcount : UInt32 [In],preply : AUTHZ_ACCESS_REPLY* [In]
  fun AuthzOpenObjectAudit(flags : UInt32, hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, prequest : AUTHZ_ACCESS_REQUEST*, hauditevent : AUTHZ_AUDIT_EVENT_HANDLE, psecuritydescriptor : SECURITY_DESCRIPTOR*, optionalsecuritydescriptorarray : SECURITY_DESCRIPTOR**, optionalsecuritydescriptorcount : UInt32, preply : AUTHZ_ACCESS_REPLY*) : LibC::BOOL

  # Params # haccesscheckresults : AUTHZ_ACCESS_CHECK_RESULTS_HANDLE [In]
  fun AuthzFreeHandle(haccesscheckresults : AUTHZ_ACCESS_CHECK_RESULTS_HANDLE) : LibC::BOOL

  # Params # flags : UInt32 [In],pfndynamicaccesscheck : PFN_AUTHZ_DYNAMIC_ACCESS_CHECK [In],pfncomputedynamicgroups : PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS [In],pfnfreedynamicgroups : PFN_AUTHZ_FREE_DYNAMIC_GROUPS [In],szresourcemanagername : LibC::LPWSTR [In],phauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE* [In]
  fun AuthzInitializeResourceManager(flags : UInt32, pfndynamicaccesscheck : PFN_AUTHZ_DYNAMIC_ACCESS_CHECK, pfncomputedynamicgroups : PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS, pfnfreedynamicgroups : PFN_AUTHZ_FREE_DYNAMIC_GROUPS, szresourcemanagername : LibC::LPWSTR, phauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE*) : LibC::BOOL

  # Params # flags : AUTHZ_RESOURCE_MANAGER_FLAGS [In],pauthzinitinfo : AUTHZ_INIT_INFO* [In],phauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE* [In]
  fun AuthzInitializeResourceManagerEx(flags : AUTHZ_RESOURCE_MANAGER_FLAGS, pauthzinitinfo : AUTHZ_INIT_INFO*, phauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE*) : LibC::BOOL

  # Params # prpcinitinfo : AUTHZ_RPC_INIT_INFO_CLIENT* [In],phauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE* [In]
  fun AuthzInitializeRemoteResourceManager(prpcinitinfo : AUTHZ_RPC_INIT_INFO_CLIENT*, phauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE*) : LibC::BOOL

  # Params # hauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE [In]
  fun AuthzFreeResourceManager(hauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE) : LibC::BOOL

  # Params # flags : UInt32 [In],tokenhandle : LibC::HANDLE [In],hauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE [In],pexpirationtime : LARGE_INTEGER* [In],identifier : LUID [In],dynamicgroupargs : Void* [In],phauthzclientcontext : LibC::IntPtrT* [In]
  fun AuthzInitializeContextFromToken(flags : UInt32, tokenhandle : LibC::HANDLE, hauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE, pexpirationtime : LARGE_INTEGER*, identifier : LUID, dynamicgroupargs : Void*, phauthzclientcontext : LibC::IntPtrT*) : LibC::BOOL

  # Params # flags : UInt32 [In],usersid : PSID [In],hauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE [In],pexpirationtime : LARGE_INTEGER* [In],identifier : LUID [In],dynamicgroupargs : Void* [In],phauthzclientcontext : LibC::IntPtrT* [In]
  fun AuthzInitializeContextFromSid(flags : UInt32, usersid : PSID, hauthzresourcemanager : AUTHZ_RESOURCE_MANAGER_HANDLE, pexpirationtime : LARGE_INTEGER*, identifier : LUID, dynamicgroupargs : Void*, phauthzclientcontext : LibC::IntPtrT*) : LibC::BOOL

  # Params # flags : UInt32 [In],hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],pexpirationtime : LARGE_INTEGER* [In],identifier : LUID [In],dynamicgroupargs : Void* [In],phnewauthzclientcontext : LibC::IntPtrT* [In]
  fun AuthzInitializeContextFromAuthzContext(flags : UInt32, hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, pexpirationtime : LARGE_INTEGER*, identifier : LUID, dynamicgroupargs : Void*, phnewauthzclientcontext : LibC::IntPtrT*) : LibC::BOOL

  # Params # usercontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],devicecontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],phcompoundcontext : LibC::IntPtrT* [In]
  fun AuthzInitializeCompoundContext(usercontext : AUTHZ_CLIENT_CONTEXT_HANDLE, devicecontext : AUTHZ_CLIENT_CONTEXT_HANDLE, phcompoundcontext : LibC::IntPtrT*) : LibC::BOOL

  # Params # hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],sids : SID_AND_ATTRIBUTES* [In],sidcount : UInt32 [In],restrictedsids : SID_AND_ATTRIBUTES* [In],restrictedsidcount : UInt32 [In],phnewauthzclientcontext : LibC::IntPtrT* [In]
  fun AuthzAddSidsToContext(hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, sids : SID_AND_ATTRIBUTES*, sidcount : UInt32, restrictedsids : SID_AND_ATTRIBUTES*, restrictedsidcount : UInt32, phnewauthzclientcontext : LibC::IntPtrT*) : LibC::BOOL

  # Params # hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],poperations : AUTHZ_SECURITY_ATTRIBUTE_OPERATION* [In],pattributes : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION* [In]
  fun AuthzModifySecurityAttributes(hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, poperations : AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pattributes : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*) : LibC::BOOL

  # Params # hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],claimclass : AUTHZ_CONTEXT_INFORMATION_CLASS [In],pclaimoperations : AUTHZ_SECURITY_ATTRIBUTE_OPERATION* [In],pclaims : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION* [In]
  fun AuthzModifyClaims(hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, claimclass : AUTHZ_CONTEXT_INFORMATION_CLASS, pclaimoperations : AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pclaims : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*) : LibC::BOOL

  # Params # hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],sidclass : AUTHZ_CONTEXT_INFORMATION_CLASS [In],psidoperations : AUTHZ_SID_OPERATION* [In],psids : TOKEN_GROUPS* [In]
  fun AuthzModifySids(hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, sidclass : AUTHZ_CONTEXT_INFORMATION_CLASS, psidoperations : AUTHZ_SID_OPERATION*, psids : TOKEN_GROUPS*) : LibC::BOOL

  # Params # hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],pappcontainersid : PSID [In],capabilitycount : UInt32 [In],pcapabilitysids : SID_AND_ATTRIBUTES* [In]
  fun AuthzSetAppContainerInformation(hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, pappcontainersid : PSID, capabilitycount : UInt32, pcapabilitysids : SID_AND_ATTRIBUTES*) : LibC::BOOL

  # Params # hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],infoclass : AUTHZ_CONTEXT_INFORMATION_CLASS [In],buffersize : UInt32 [In],psizerequired : UInt32* [In],buffer : Void* [In]
  fun AuthzGetInformationFromContext(hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, infoclass : AUTHZ_CONTEXT_INFORMATION_CLASS, buffersize : UInt32, psizerequired : UInt32*, buffer : Void*) : LibC::BOOL

  # Params # hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In]
  fun AuthzFreeContext(hauthzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE) : LibC::BOOL

  # Params # flags : AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS [In],hauditeventtype : AUTHZ_AUDIT_EVENT_TYPE_HANDLE [In],szoperationtype : LibC::LPWSTR [In],szobjecttype : LibC::LPWSTR [In],szobjectname : LibC::LPWSTR [In],szadditionalinfo : LibC::LPWSTR [In],phauditevent : LibC::IntPtrT* [In],dwadditionalparametercount : UInt32 [In]
  fun AuthzInitializeObjectAccessAuditEvent(flags : AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS, hauditeventtype : AUTHZ_AUDIT_EVENT_TYPE_HANDLE, szoperationtype : LibC::LPWSTR, szobjecttype : LibC::LPWSTR, szobjectname : LibC::LPWSTR, szadditionalinfo : LibC::LPWSTR, phauditevent : LibC::IntPtrT*, dwadditionalparametercount : UInt32) : LibC::BOOL

  # Params # flags : UInt32 [In],hauditeventtype : AUTHZ_AUDIT_EVENT_TYPE_HANDLE [In],szoperationtype : LibC::LPWSTR [In],szobjecttype : LibC::LPWSTR [In],szobjectname : LibC::LPWSTR [In],szadditionalinfo : LibC::LPWSTR [In],szadditionalinfo2 : LibC::LPWSTR [In],phauditevent : LibC::IntPtrT* [In],dwadditionalparametercount : UInt32 [In]
  fun AuthzInitializeObjectAccessAuditEvent2(flags : UInt32, hauditeventtype : AUTHZ_AUDIT_EVENT_TYPE_HANDLE, szoperationtype : LibC::LPWSTR, szobjecttype : LibC::LPWSTR, szobjectname : LibC::LPWSTR, szadditionalinfo : LibC::LPWSTR, szadditionalinfo2 : LibC::LPWSTR, phauditevent : LibC::IntPtrT*, dwadditionalparametercount : UInt32) : LibC::BOOL

  # Params # hauditevent : AUTHZ_AUDIT_EVENT_HANDLE [In]
  fun AuthzFreeAuditEvent(hauditevent : AUTHZ_AUDIT_EVENT_HANDLE) : LibC::BOOL

  # Params # authzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE [In],prequest : AUTHZ_ACCESS_REQUEST* [In],sacl : ACL* [In],grantedaccess : UInt32 [In],accessgranted : LibC::BOOL [In],pbgenerateaudit : LibC::BOOL* [In]
  fun AuthzEvaluateSacl(authzclientcontext : AUTHZ_CLIENT_CONTEXT_HANDLE, prequest : AUTHZ_ACCESS_REQUEST*, sacl : ACL*, grantedaccess : UInt32, accessgranted : LibC::BOOL, pbgenerateaudit : LibC::BOOL*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],pregistration : AUTHZ_SOURCE_SCHEMA_REGISTRATION* [In]
  fun AuthzInstallSecurityEventSource(dwflags : UInt32, pregistration : AUTHZ_SOURCE_SCHEMA_REGISTRATION*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],szeventsourcename : LibC::LPWSTR [In]
  fun AuthzUninstallSecurityEventSource(dwflags : UInt32, szeventsourcename : LibC::LPWSTR) : LibC::BOOL

  # Params # dwflags : UInt32 [In],buffer : AUTHZ_SOURCE_SCHEMA_REGISTRATION* [In],pdwcount : UInt32* [In],pdwlength : UInt32* [In]
  fun AuthzEnumerateSecurityEventSources(dwflags : UInt32, buffer : AUTHZ_SOURCE_SCHEMA_REGISTRATION*, pdwcount : UInt32*, pdwlength : UInt32*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],szeventsourcename : LibC::LPWSTR [In],pheventprovider : LibC::IntPtrT* [In]
  fun AuthzRegisterSecurityEventSource(dwflags : UInt32, szeventsourcename : LibC::LPWSTR, pheventprovider : LibC::IntPtrT*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],pheventprovider : LibC::IntPtrT* [In]
  fun AuthzUnregisterSecurityEventSource(dwflags : UInt32, pheventprovider : LibC::IntPtrT*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],heventprovider : AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE [In],dwauditid : UInt32 [In],pusersid : PSID [In],dwcount : UInt32 [In]
  fun AuthzReportSecurityEvent(dwflags : UInt32, heventprovider : AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, dwauditid : UInt32, pusersid : PSID, dwcount : UInt32) : LibC::BOOL

  # Params # dwflags : UInt32 [In],heventprovider : AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE [In],dwauditid : UInt32 [In],pusersid : PSID [In],pparams : AUDIT_PARAMS* [In]
  fun AuthzReportSecurityEventFromParams(dwflags : UInt32, heventprovider : AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, dwauditid : UInt32, pusersid : PSID, pparams : AUDIT_PARAMS*) : LibC::BOOL

  # Params # phcapchangesubscription : AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__** [In],pfncapchangecallback : LPTHREAD_START_ROUTINE [In],pcallbackcontext : Void* [In]
  fun AuthzRegisterCapChangeNotification(phcapchangesubscription : AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__**, pfncapchangecallback : LPTHREAD_START_ROUTINE, pcallbackcontext : Void*) : LibC::BOOL

  # Params # hcapchangesubscription : AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__* [In]
  fun AuthzUnregisterCapChangeNotification(hcapchangesubscription : AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__*) : LibC::BOOL

  # Params # 
  fun AuthzFreeCentralAccessPolicyCache : LibC::BOOL

  # Params # ccountofexplicitentries : UInt32 [In],plistofexplicitentries : EXPLICIT_ACCESS_A* [In],oldacl : ACL* [In],newacl : ACL** [In]
  fun SetEntriesInAclA(ccountofexplicitentries : UInt32, plistofexplicitentries : EXPLICIT_ACCESS_A*, oldacl : ACL*, newacl : ACL**) : UInt32

  # Params # ccountofexplicitentries : UInt32 [In],plistofexplicitentries : EXPLICIT_ACCESS_W* [In],oldacl : ACL* [In],newacl : ACL** [In]
  fun SetEntriesInAclW(ccountofexplicitentries : UInt32, plistofexplicitentries : EXPLICIT_ACCESS_W*, oldacl : ACL*, newacl : ACL**) : UInt32

  # Params # pacl : ACL* [In],pccountofexplicitentries : UInt32* [In],plistofexplicitentries : EXPLICIT_ACCESS_A** [In]
  fun GetExplicitEntriesFromAclA(pacl : ACL*, pccountofexplicitentries : UInt32*, plistofexplicitentries : EXPLICIT_ACCESS_A**) : UInt32

  # Params # pacl : ACL* [In],pccountofexplicitentries : UInt32* [In],plistofexplicitentries : EXPLICIT_ACCESS_W** [In]
  fun GetExplicitEntriesFromAclW(pacl : ACL*, pccountofexplicitentries : UInt32*, plistofexplicitentries : EXPLICIT_ACCESS_W**) : UInt32

  # Params # pacl : ACL* [In],ptrustee : TRUSTEE_A* [In],paccessrights : UInt32* [In]
  fun GetEffectiveRightsFromAclA(pacl : ACL*, ptrustee : TRUSTEE_A*, paccessrights : UInt32*) : UInt32

  # Params # pacl : ACL* [In],ptrustee : TRUSTEE_W* [In],paccessrights : UInt32* [In]
  fun GetEffectiveRightsFromAclW(pacl : ACL*, ptrustee : TRUSTEE_W*, paccessrights : UInt32*) : UInt32

  # Params # pacl : ACL* [In],ptrustee : TRUSTEE_A* [In],psuccessfulauditedrights : UInt32* [In],pfailedauditrights : UInt32* [In]
  fun GetAuditedPermissionsFromAclA(pacl : ACL*, ptrustee : TRUSTEE_A*, psuccessfulauditedrights : UInt32*, pfailedauditrights : UInt32*) : UInt32

  # Params # pacl : ACL* [In],ptrustee : TRUSTEE_W* [In],psuccessfulauditedrights : UInt32* [In],pfailedauditrights : UInt32* [In]
  fun GetAuditedPermissionsFromAclW(pacl : ACL*, ptrustee : TRUSTEE_W*, psuccessfulauditedrights : UInt32*, pfailedauditrights : UInt32*) : UInt32

  # Params # pobjectname : PSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : OBJECT_SECURITY_INFORMATION [In],ppsidowner : PSID* [In],ppsidgroup : PSID* [In],ppdacl : ACL** [In],ppsacl : ACL** [In],ppsecuritydescriptor : SECURITY_DESCRIPTOR** [In]
  fun GetNamedSecurityInfoA(pobjectname : PSTR, objecttype : SE_OBJECT_TYPE, securityinfo : OBJECT_SECURITY_INFORMATION, ppsidowner : PSID*, ppsidgroup : PSID*, ppdacl : ACL**, ppsacl : ACL**, ppsecuritydescriptor : SECURITY_DESCRIPTOR**) : UInt32

  # Params # pobjectname : LibC::LPWSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : OBJECT_SECURITY_INFORMATION [In],ppsidowner : PSID* [In],ppsidgroup : PSID* [In],ppdacl : ACL** [In],ppsacl : ACL** [In],ppsecuritydescriptor : SECURITY_DESCRIPTOR** [In]
  fun GetNamedSecurityInfoW(pobjectname : LibC::LPWSTR, objecttype : SE_OBJECT_TYPE, securityinfo : OBJECT_SECURITY_INFORMATION, ppsidowner : PSID*, ppsidgroup : PSID*, ppdacl : ACL**, ppsacl : ACL**, ppsecuritydescriptor : SECURITY_DESCRIPTOR**) : UInt32

  # Params # handle : LibC::HANDLE [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],ppsidowner : PSID* [In],ppsidgroup : PSID* [In],ppdacl : ACL** [In],ppsacl : ACL** [In],ppsecuritydescriptor : SECURITY_DESCRIPTOR** [In]
  fun GetSecurityInfo(handle : LibC::HANDLE, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, ppsidowner : PSID*, ppsidgroup : PSID*, ppdacl : ACL**, ppsacl : ACL**, ppsecuritydescriptor : SECURITY_DESCRIPTOR**) : UInt32

  # Params # pobjectname : PSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : OBJECT_SECURITY_INFORMATION [In],psidowner : PSID [In],psidgroup : PSID [In],pdacl : ACL* [In],psacl : ACL* [In]
  fun SetNamedSecurityInfoA(pobjectname : PSTR, objecttype : SE_OBJECT_TYPE, securityinfo : OBJECT_SECURITY_INFORMATION, psidowner : PSID, psidgroup : PSID, pdacl : ACL*, psacl : ACL*) : UInt32

  # Params # pobjectname : LibC::LPWSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : OBJECT_SECURITY_INFORMATION [In],psidowner : PSID [In],psidgroup : PSID [In],pdacl : ACL* [In],psacl : ACL* [In]
  fun SetNamedSecurityInfoW(pobjectname : LibC::LPWSTR, objecttype : SE_OBJECT_TYPE, securityinfo : OBJECT_SECURITY_INFORMATION, psidowner : PSID, psidgroup : PSID, pdacl : ACL*, psacl : ACL*) : UInt32

  # Params # handle : LibC::HANDLE [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],psidowner : PSID [In],psidgroup : PSID [In],pdacl : ACL* [In],psacl : ACL* [In]
  fun SetSecurityInfo(handle : LibC::HANDLE, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, psidowner : PSID, psidgroup : PSID, pdacl : ACL*, psacl : ACL*) : UInt32

  # Params # pobjectname : PSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],container : LibC::BOOL [In],pobjectclassguids : Guid** [In],guidcount : UInt32 [In],pacl : ACL* [In],pfnarray : FN_OBJECT_MGR_FUNCTIONS* [In],pgenericmapping : GENERIC_MAPPING* [In],pinheritarray : INHERITED_FROMA* [In]
  fun GetInheritanceSourceA(pobjectname : PSTR, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, container : LibC::BOOL, pobjectclassguids : Guid**, guidcount : UInt32, pacl : ACL*, pfnarray : FN_OBJECT_MGR_FUNCTIONS*, pgenericmapping : GENERIC_MAPPING*, pinheritarray : INHERITED_FROMA*) : UInt32

  # Params # pobjectname : LibC::LPWSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],container : LibC::BOOL [In],pobjectclassguids : Guid** [In],guidcount : UInt32 [In],pacl : ACL* [In],pfnarray : FN_OBJECT_MGR_FUNCTIONS* [In],pgenericmapping : GENERIC_MAPPING* [In],pinheritarray : INHERITED_FROMW* [In]
  fun GetInheritanceSourceW(pobjectname : LibC::LPWSTR, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, container : LibC::BOOL, pobjectclassguids : Guid**, guidcount : UInt32, pacl : ACL*, pfnarray : FN_OBJECT_MGR_FUNCTIONS*, pgenericmapping : GENERIC_MAPPING*, pinheritarray : INHERITED_FROMW*) : UInt32

  # Params # pinheritarray : INHERITED_FROMW* [In],acecnt : UInt16 [In],pfnarray : FN_OBJECT_MGR_FUNCTIONS* [In]
  fun FreeInheritedFromArray(pinheritarray : INHERITED_FROMW*, acecnt : UInt16, pfnarray : FN_OBJECT_MGR_FUNCTIONS*) : UInt32

  # Params # pobjectname : PSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],powner : PSID [In],pgroup : PSID [In],pdacl : ACL* [In],psacl : ACL* [In],keepexplicit : LibC::BOOL [In],fnprogress : FN_PROGRESS [In],progressinvokesetting : PROG_INVOKE_SETTING [In],args : Void* [In]
  fun TreeResetNamedSecurityInfoA(pobjectname : PSTR, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, powner : PSID, pgroup : PSID, pdacl : ACL*, psacl : ACL*, keepexplicit : LibC::BOOL, fnprogress : FN_PROGRESS, progressinvokesetting : PROG_INVOKE_SETTING, args : Void*) : UInt32

  # Params # pobjectname : LibC::LPWSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],powner : PSID [In],pgroup : PSID [In],pdacl : ACL* [In],psacl : ACL* [In],keepexplicit : LibC::BOOL [In],fnprogress : FN_PROGRESS [In],progressinvokesetting : PROG_INVOKE_SETTING [In],args : Void* [In]
  fun TreeResetNamedSecurityInfoW(pobjectname : LibC::LPWSTR, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, powner : PSID, pgroup : PSID, pdacl : ACL*, psacl : ACL*, keepexplicit : LibC::BOOL, fnprogress : FN_PROGRESS, progressinvokesetting : PROG_INVOKE_SETTING, args : Void*) : UInt32

  # Params # pobjectname : PSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],powner : PSID [In],pgroup : PSID [In],pdacl : ACL* [In],psacl : ACL* [In],dwaction : TREE_SEC_INFO [In],fnprogress : FN_PROGRESS [In],progressinvokesetting : PROG_INVOKE_SETTING [In],args : Void* [In]
  fun TreeSetNamedSecurityInfoA(pobjectname : PSTR, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, powner : PSID, pgroup : PSID, pdacl : ACL*, psacl : ACL*, dwaction : TREE_SEC_INFO, fnprogress : FN_PROGRESS, progressinvokesetting : PROG_INVOKE_SETTING, args : Void*) : UInt32

  # Params # pobjectname : LibC::LPWSTR [In],objecttype : SE_OBJECT_TYPE [In],securityinfo : UInt32 [In],powner : PSID [In],pgroup : PSID [In],pdacl : ACL* [In],psacl : ACL* [In],dwaction : TREE_SEC_INFO [In],fnprogress : FN_PROGRESS [In],progressinvokesetting : PROG_INVOKE_SETTING [In],args : Void* [In]
  fun TreeSetNamedSecurityInfoW(pobjectname : LibC::LPWSTR, objecttype : SE_OBJECT_TYPE, securityinfo : UInt32, powner : PSID, pgroup : PSID, pdacl : ACL*, psacl : ACL*, dwaction : TREE_SEC_INFO, fnprogress : FN_PROGRESS, progressinvokesetting : PROG_INVOKE_SETTING, args : Void*) : UInt32

  # Params # powner : TRUSTEE_A* [In],pgroup : TRUSTEE_A* [In],ccountofaccessentries : UInt32 [In],plistofaccessentries : EXPLICIT_ACCESS_A* [In],ccountofauditentries : UInt32 [In],plistofauditentries : EXPLICIT_ACCESS_A* [In],poldsd : SECURITY_DESCRIPTOR* [In],psizenewsd : UInt32* [In],pnewsd : SECURITY_DESCRIPTOR** [In]
  fun BuildSecurityDescriptorA(powner : TRUSTEE_A*, pgroup : TRUSTEE_A*, ccountofaccessentries : UInt32, plistofaccessentries : EXPLICIT_ACCESS_A*, ccountofauditentries : UInt32, plistofauditentries : EXPLICIT_ACCESS_A*, poldsd : SECURITY_DESCRIPTOR*, psizenewsd : UInt32*, pnewsd : SECURITY_DESCRIPTOR**) : UInt32

  # Params # powner : TRUSTEE_W* [In],pgroup : TRUSTEE_W* [In],ccountofaccessentries : UInt32 [In],plistofaccessentries : EXPLICIT_ACCESS_W* [In],ccountofauditentries : UInt32 [In],plistofauditentries : EXPLICIT_ACCESS_W* [In],poldsd : SECURITY_DESCRIPTOR* [In],psizenewsd : UInt32* [In],pnewsd : SECURITY_DESCRIPTOR** [In]
  fun BuildSecurityDescriptorW(powner : TRUSTEE_W*, pgroup : TRUSTEE_W*, ccountofaccessentries : UInt32, plistofaccessentries : EXPLICIT_ACCESS_W*, ccountofauditentries : UInt32, plistofauditentries : EXPLICIT_ACCESS_W*, poldsd : SECURITY_DESCRIPTOR*, psizenewsd : UInt32*, pnewsd : SECURITY_DESCRIPTOR**) : UInt32

  # Params # ppowner : TRUSTEE_A** [In],ppgroup : TRUSTEE_A** [In],pccountofaccessentries : UInt32* [In],pplistofaccessentries : EXPLICIT_ACCESS_A** [In],pccountofauditentries : UInt32* [In],pplistofauditentries : EXPLICIT_ACCESS_A** [In],psd : SECURITY_DESCRIPTOR* [In]
  fun LookupSecurityDescriptorPartsA(ppowner : TRUSTEE_A**, ppgroup : TRUSTEE_A**, pccountofaccessentries : UInt32*, pplistofaccessentries : EXPLICIT_ACCESS_A**, pccountofauditentries : UInt32*, pplistofauditentries : EXPLICIT_ACCESS_A**, psd : SECURITY_DESCRIPTOR*) : UInt32

  # Params # ppowner : TRUSTEE_W** [In],ppgroup : TRUSTEE_W** [In],pccountofaccessentries : UInt32* [In],pplistofaccessentries : EXPLICIT_ACCESS_W** [In],pccountofauditentries : UInt32* [In],pplistofauditentries : EXPLICIT_ACCESS_W** [In],psd : SECURITY_DESCRIPTOR* [In]
  fun LookupSecurityDescriptorPartsW(ppowner : TRUSTEE_W**, ppgroup : TRUSTEE_W**, pccountofaccessentries : UInt32*, pplistofaccessentries : EXPLICIT_ACCESS_W**, pccountofauditentries : UInt32*, pplistofauditentries : EXPLICIT_ACCESS_W**, psd : SECURITY_DESCRIPTOR*) : UInt32

  # Params # pexplicitaccess : EXPLICIT_ACCESS_A* [In],ptrusteename : PSTR [In],accesspermissions : UInt32 [In],accessmode : ACCESS_MODE [In],inheritance : ACE_FLAGS [In]
  fun BuildExplicitAccessWithNameA(pexplicitaccess : EXPLICIT_ACCESS_A*, ptrusteename : PSTR, accesspermissions : UInt32, accessmode : ACCESS_MODE, inheritance : ACE_FLAGS)

  # Params # pexplicitaccess : EXPLICIT_ACCESS_W* [In],ptrusteename : LibC::LPWSTR [In],accesspermissions : UInt32 [In],accessmode : ACCESS_MODE [In],inheritance : ACE_FLAGS [In]
  fun BuildExplicitAccessWithNameW(pexplicitaccess : EXPLICIT_ACCESS_W*, ptrusteename : LibC::LPWSTR, accesspermissions : UInt32, accessmode : ACCESS_MODE, inheritance : ACE_FLAGS)

  # Params # pexplicitaccess : EXPLICIT_ACCESS_A* [In],ptrusteename : PSTR [In],ptrustee : TRUSTEE_A* [In],accesspermissions : UInt32 [In],accessmode : ACCESS_MODE [In],inheritance : UInt32 [In]
  fun BuildImpersonateExplicitAccessWithNameA(pexplicitaccess : EXPLICIT_ACCESS_A*, ptrusteename : PSTR, ptrustee : TRUSTEE_A*, accesspermissions : UInt32, accessmode : ACCESS_MODE, inheritance : UInt32)

  # Params # pexplicitaccess : EXPLICIT_ACCESS_W* [In],ptrusteename : LibC::LPWSTR [In],ptrustee : TRUSTEE_W* [In],accesspermissions : UInt32 [In],accessmode : ACCESS_MODE [In],inheritance : UInt32 [In]
  fun BuildImpersonateExplicitAccessWithNameW(pexplicitaccess : EXPLICIT_ACCESS_W*, ptrusteename : LibC::LPWSTR, ptrustee : TRUSTEE_W*, accesspermissions : UInt32, accessmode : ACCESS_MODE, inheritance : UInt32)

  # Params # ptrustee : TRUSTEE_A* [In],pname : PSTR [In]
  fun BuildTrusteeWithNameA(ptrustee : TRUSTEE_A*, pname : PSTR)

  # Params # ptrustee : TRUSTEE_W* [In],pname : LibC::LPWSTR [In]
  fun BuildTrusteeWithNameW(ptrustee : TRUSTEE_W*, pname : LibC::LPWSTR)

  # Params # ptrustee : TRUSTEE_A* [In],pimpersonatetrustee : TRUSTEE_A* [In]
  fun BuildImpersonateTrusteeA(ptrustee : TRUSTEE_A*, pimpersonatetrustee : TRUSTEE_A*)

  # Params # ptrustee : TRUSTEE_W* [In],pimpersonatetrustee : TRUSTEE_W* [In]
  fun BuildImpersonateTrusteeW(ptrustee : TRUSTEE_W*, pimpersonatetrustee : TRUSTEE_W*)

  # Params # ptrustee : TRUSTEE_A* [In],psid : PSID [In]
  fun BuildTrusteeWithSidA(ptrustee : TRUSTEE_A*, psid : PSID)

  # Params # ptrustee : TRUSTEE_W* [In],psid : PSID [In]
  fun BuildTrusteeWithSidW(ptrustee : TRUSTEE_W*, psid : PSID)

  # Params # ptrustee : TRUSTEE_A* [In],pobjsid : OBJECTS_AND_SID* [In],pobjectguid : Guid* [In],pinheritedobjectguid : Guid* [In],psid : PSID [In]
  fun BuildTrusteeWithObjectsAndSidA(ptrustee : TRUSTEE_A*, pobjsid : OBJECTS_AND_SID*, pobjectguid : Guid*, pinheritedobjectguid : Guid*, psid : PSID)

  # Params # ptrustee : TRUSTEE_W* [In],pobjsid : OBJECTS_AND_SID* [In],pobjectguid : Guid* [In],pinheritedobjectguid : Guid* [In],psid : PSID [In]
  fun BuildTrusteeWithObjectsAndSidW(ptrustee : TRUSTEE_W*, pobjsid : OBJECTS_AND_SID*, pobjectguid : Guid*, pinheritedobjectguid : Guid*, psid : PSID)

  # Params # ptrustee : TRUSTEE_A* [In],pobjname : OBJECTS_AND_NAME_A* [In],objecttype : SE_OBJECT_TYPE [In],objecttypename : PSTR [In],inheritedobjecttypename : PSTR [In],name : PSTR [In]
  fun BuildTrusteeWithObjectsAndNameA(ptrustee : TRUSTEE_A*, pobjname : OBJECTS_AND_NAME_A*, objecttype : SE_OBJECT_TYPE, objecttypename : PSTR, inheritedobjecttypename : PSTR, name : PSTR)

  # Params # ptrustee : TRUSTEE_W* [In],pobjname : OBJECTS_AND_NAME_W* [In],objecttype : SE_OBJECT_TYPE [In],objecttypename : LibC::LPWSTR [In],inheritedobjecttypename : LibC::LPWSTR [In],name : LibC::LPWSTR [In]
  fun BuildTrusteeWithObjectsAndNameW(ptrustee : TRUSTEE_W*, pobjname : OBJECTS_AND_NAME_W*, objecttype : SE_OBJECT_TYPE, objecttypename : LibC::LPWSTR, inheritedobjecttypename : LibC::LPWSTR, name : LibC::LPWSTR)

  # Params # ptrustee : TRUSTEE_A* [In]
  fun GetTrusteeNameA(ptrustee : TRUSTEE_A*) : PSTR

  # Params # ptrustee : TRUSTEE_W* [In]
  fun GetTrusteeNameW(ptrustee : TRUSTEE_W*) : LibC::LPWSTR

  # Params # ptrustee : TRUSTEE_A* [In]
  fun GetTrusteeTypeA(ptrustee : TRUSTEE_A*) : TRUSTEE_TYPE

  # Params # ptrustee : TRUSTEE_W* [In]
  fun GetTrusteeTypeW(ptrustee : TRUSTEE_W*) : TRUSTEE_TYPE

  # Params # ptrustee : TRUSTEE_A* [In]
  fun GetTrusteeFormA(ptrustee : TRUSTEE_A*) : TRUSTEE_FORM

  # Params # ptrustee : TRUSTEE_W* [In]
  fun GetTrusteeFormW(ptrustee : TRUSTEE_W*) : TRUSTEE_FORM

  # Params # ptrustee : TRUSTEE_A* [In]
  fun GetMultipleTrusteeOperationA(ptrustee : TRUSTEE_A*) : MULTIPLE_TRUSTEE_OPERATION

  # Params # ptrustee : TRUSTEE_W* [In]
  fun GetMultipleTrusteeOperationW(ptrustee : TRUSTEE_W*) : MULTIPLE_TRUSTEE_OPERATION

  # Params # ptrustee : TRUSTEE_A* [In]
  fun GetMultipleTrusteeA(ptrustee : TRUSTEE_A*) : TRUSTEE_A*

  # Params # ptrustee : TRUSTEE_W* [In]
  fun GetMultipleTrusteeW(ptrustee : TRUSTEE_W*) : TRUSTEE_W*

  # Params # sid : PSID [In],stringsid : PSTR* [In]
  fun ConvertSidToStringSidA(sid : PSID, stringsid : PSTR*) : LibC::BOOL

  # Params # sid : PSID [In],stringsid : LibC::LPWSTR* [In]
  fun ConvertSidToStringSidW(sid : PSID, stringsid : LibC::LPWSTR*) : LibC::BOOL

  # Params # stringsid : PSTR [In],sid : PSID* [In]
  fun ConvertStringSidToSidA(stringsid : PSTR, sid : PSID*) : LibC::BOOL

  # Params # stringsid : LibC::LPWSTR [In],sid : PSID* [In]
  fun ConvertStringSidToSidW(stringsid : LibC::LPWSTR, sid : PSID*) : LibC::BOOL

  # Params # stringsecuritydescriptor : PSTR [In],stringsdrevision : UInt32 [In],securitydescriptor : SECURITY_DESCRIPTOR** [In],securitydescriptorsize : UInt32* [In]
  fun ConvertStringSecurityDescriptorToSecurityDescriptorA(stringsecuritydescriptor : PSTR, stringsdrevision : UInt32, securitydescriptor : SECURITY_DESCRIPTOR**, securitydescriptorsize : UInt32*) : LibC::BOOL

  # Params # stringsecuritydescriptor : LibC::LPWSTR [In],stringsdrevision : UInt32 [In],securitydescriptor : SECURITY_DESCRIPTOR** [In],securitydescriptorsize : UInt32* [In]
  fun ConvertStringSecurityDescriptorToSecurityDescriptorW(stringsecuritydescriptor : LibC::LPWSTR, stringsdrevision : UInt32, securitydescriptor : SECURITY_DESCRIPTOR**, securitydescriptorsize : UInt32*) : LibC::BOOL

  # Params # securitydescriptor : SECURITY_DESCRIPTOR* [In],requestedstringsdrevision : UInt32 [In],securityinformation : UInt32 [In],stringsecuritydescriptor : PSTR* [In],stringsecuritydescriptorlen : UInt32* [In]
  fun ConvertSecurityDescriptorToStringSecurityDescriptorA(securitydescriptor : SECURITY_DESCRIPTOR*, requestedstringsdrevision : UInt32, securityinformation : UInt32, stringsecuritydescriptor : PSTR*, stringsecuritydescriptorlen : UInt32*) : LibC::BOOL

  # Params # securitydescriptor : SECURITY_DESCRIPTOR* [In],requestedstringsdrevision : UInt32 [In],securityinformation : UInt32 [In],stringsecuritydescriptor : LibC::LPWSTR* [In],stringsecuritydescriptorlen : UInt32* [In]
  fun ConvertSecurityDescriptorToStringSecurityDescriptorW(securitydescriptor : SECURITY_DESCRIPTOR*, requestedstringsdrevision : UInt32, securityinformation : UInt32, stringsecuritydescriptor : LibC::LPWSTR*, stringsecuritydescriptorlen : UInt32*) : LibC::BOOL
end
