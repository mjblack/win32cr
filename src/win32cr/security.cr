require "./foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:onecore.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("advapi32")]
@[Link("onecore")]
@[Link("user32")]
{% end %}
lib LibWin32
  alias HDIAGNOSTIC_DATA_QUERY_SESSION = LibC::IntPtrT
  alias HDIAGNOSTIC_REPORT = LibC::IntPtrT
  alias HDIAGNOSTIC_EVENT_TAG_DESCRIPTION = LibC::IntPtrT
  alias HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION = LibC::IntPtrT
  alias HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION = LibC::IntPtrT
  alias HDIAGNOSTIC_RECORD = LibC::IntPtrT
  alias NCRYPT_DESCRIPTOR_HANDLE = LibC::IntPtrT
  alias NCRYPT_STREAM_HANDLE = LibC::IntPtrT
  alias SAFER_LEVEL_HANDLE = LibC::IntPtrT
  alias SC_HANDLE = LibC::IntPtrT

  CVT_SECONDS = 1_u32

  alias PLSA_AP_CALL_PACKAGE_UNTRUSTED = Proc(Void**, Void*, Void*, UInt32, Void**, UInt32*, Int32*, NTSTATUS)
  alias SEC_THREAD_START = Proc(Void*, UInt32)


  enum TOKEN_PRIVILEGES_ATTRIBUTES : UInt32
    SE_PRIVILEGE_ENABLED = 2
    SE_PRIVILEGE_ENABLED_BY_DEFAULT = 1
    SE_PRIVILEGE_REMOVED = 4
    SE_PRIVILEGE_USED_FOR_ACCESS = 2147483648
  end

  enum LOGON32_PROVIDER : UInt32
    LOGON32_PROVIDER_DEFAULT = 0
    LOGON32_PROVIDER_WINNT50 = 3
    LOGON32_PROVIDER_WINNT40 = 2
  end

  enum CREATE_RESTRICTED_TOKEN_FLAGS : UInt32
    DISABLE_MAX_PRIVILEGE = 1
    SANDBOX_INERT = 2
    LUA_TOKEN = 4
    WRITE_RESTRICTED = 8
  end

  enum LOGON32_LOGON : UInt32
    LOGON32_LOGON_BATCH = 4
    LOGON32_LOGON_INTERACTIVE = 2
    LOGON32_LOGON_NETWORK = 3
    LOGON32_LOGON_NETWORK_CLEARTEXT = 8
    LOGON32_LOGON_NEW_CREDENTIALS = 9
    LOGON32_LOGON_SERVICE = 5
    LOGON32_LOGON_UNLOCK = 7
  end

  enum ACE_FLAGS : UInt32
    CONTAINER_INHERIT_ACE = 2
    FAILED_ACCESS_ACE_FLAG = 128
    INHERIT_ONLY_ACE = 8
    INHERITED_ACE = 16
    NO_PROPAGATE_INHERIT_ACE = 4
    OBJECT_INHERIT_ACE = 1
    SUCCESSFUL_ACCESS_ACE_FLAG = 64
    SUB_CONTAINERS_AND_OBJECTS_INHERIT = 3
    SUB_CONTAINERS_ONLY_INHERIT = 2
    SUB_OBJECTS_ONLY_INHERIT = 1
    INHERIT_NO_PROPAGATE = 4
    INHERIT_ONLY = 8
    NO_INHERITANCE = 0
    INHERIT_ONLY_ACE_ = 8
  end

  enum OBJECT_SECURITY_INFORMATION : UInt32
    ATTRIBUTE_SECURITY_INFORMATION = 32
    BACKUP_SECURITY_INFORMATION = 65536
    DACL_SECURITY_INFORMATION = 4
    GROUP_SECURITY_INFORMATION = 2
    LABEL_SECURITY_INFORMATION = 16
    OWNER_SECURITY_INFORMATION = 1
    PROTECTED_DACL_SECURITY_INFORMATION = 2147483648
    PROTECTED_SACL_SECURITY_INFORMATION = 1073741824
    SACL_SECURITY_INFORMATION = 8
    SCOPE_SECURITY_INFORMATION = 64
    UNPROTECTED_DACL_SECURITY_INFORMATION = 536870912
    UNPROTECTED_SACL_SECURITY_INFORMATION = 268435456
  end

  enum SECURITY_AUTO_INHERIT_FLAGS : UInt32
    SEF_AVOID_OWNER_CHECK = 16
    SEF_AVOID_OWNER_RESTRICTION = 4096
    SEF_AVOID_PRIVILEGE_CHECK = 8
    SEF_DACL_AUTO_INHERIT = 1
    SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT = 4
    SEF_DEFAULT_GROUP_FROM_PARENT = 64
    SEF_DEFAULT_OWNER_FROM_PARENT = 32
    SEF_MACL_NO_EXECUTE_UP = 1024
    SEF_MACL_NO_READ_UP = 512
    SEF_MACL_NO_WRITE_UP = 256
    SEF_SACL_AUTO_INHERIT = 2
  end

  enum ACE_REVISION : UInt32
    ACL_REVISION = 2
    ACL_REVISION_DS = 4
  end

  enum TOKEN_MANDATORY_POLICY_ID : UInt32
    TOKEN_MANDATORY_POLICY_OFF = 0
    TOKEN_MANDATORY_POLICY_NO_WRITE_UP = 1
    TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN = 2
    TOKEN_MANDATORY_POLICY_VALID_MASK = 3
  end

  enum SYSTEM_AUDIT_OBJECT_ACE_FLAGS : UInt32
    ACE_OBJECT_TYPE_PRESENT = 1
    ACE_INHERITED_OBJECT_TYPE_PRESENT = 2
  end

  enum CLAIM_SECURITY_ATTRIBUTE_FLAGS : UInt32
    CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE = 1
    CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 2
    CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY = 4
    CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT = 8
    CLAIM_SECURITY_ATTRIBUTE_DISABLED = 16
    CLAIM_SECURITY_ATTRIBUTE_MANDATORY = 32
  end

  enum CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE : UInt16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64 = 1
    CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64 = 2
    CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING = 3
    CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING = 16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN = 4
    CLAIM_SECURITY_ATTRIBUTE_TYPE_SID = 5
    CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN = 6
  end

  enum TOKEN_ACCESS_MASK : UInt32
    TOKEN_DELETE = 65536
    TOKEN_READ_CONTROL = 131072
    TOKEN_WRITE_DAC = 262144
    TOKEN_WRITE_OWNER = 524288
    TOKEN_ACCESS_SYSTEM_SECURITY = 16777216
    TOKEN_ASSIGN_PRIMARY = 1
    TOKEN_DUPLICATE = 2
    TOKEN_IMPERSONATE = 4
    TOKEN_QUERY = 8
    TOKEN_QUERY_SOURCE = 16
    TOKEN_ADJUST_PRIVILEGES = 32
    TOKEN_ADJUST_GROUPS = 64
    TOKEN_ADJUST_DEFAULT = 128
    TOKEN_ADJUST_SESSIONID = 256
    TOKEN_ALL_ACCESS = 983295
  end

  enum ENUM_PERIOD : Int32
    ENUM_PERIOD_INVALID = -1
    ENUM_PERIOD_SECONDS = 0
    ENUM_PERIOD_MINUTES = 1
    ENUM_PERIOD_HOURS = 2
    ENUM_PERIOD_DAYS = 3
    ENUM_PERIOD_WEEKS = 4
    ENUM_PERIOD_MONTHS = 5
    ENUM_PERIOD_YEARS = 6
  end

  enum SID_NAME_USE : Int32
    SidTypeUser = 1
    SidTypeGroup = 2
    SidTypeDomain = 3
    SidTypeAlias = 4
    SidTypeWellKnownGroup = 5
    SidTypeDeletedAccount = 6
    SidTypeInvalid = 7
    SidTypeUnknown = 8
    SidTypeComputer = 9
    SidTypeLabel = 10
    SidTypeLogonSession = 11
  end

  enum WELL_KNOWN_SID_TYPE : Int32
    WinNullSid = 0
    WinWorldSid = 1
    WinLocalSid = 2
    WinCreatorOwnerSid = 3
    WinCreatorGroupSid = 4
    WinCreatorOwnerServerSid = 5
    WinCreatorGroupServerSid = 6
    WinNtAuthoritySid = 7
    WinDialupSid = 8
    WinNetworkSid = 9
    WinBatchSid = 10
    WinInteractiveSid = 11
    WinServiceSid = 12
    WinAnonymousSid = 13
    WinProxySid = 14
    WinEnterpriseControllersSid = 15
    WinSelfSid = 16
    WinAuthenticatedUserSid = 17
    WinRestrictedCodeSid = 18
    WinTerminalServerSid = 19
    WinRemoteLogonIdSid = 20
    WinLogonIdsSid = 21
    WinLocalSystemSid = 22
    WinLocalServiceSid = 23
    WinNetworkServiceSid = 24
    WinBuiltinDomainSid = 25
    WinBuiltinAdministratorsSid = 26
    WinBuiltinUsersSid = 27
    WinBuiltinGuestsSid = 28
    WinBuiltinPowerUsersSid = 29
    WinBuiltinAccountOperatorsSid = 30
    WinBuiltinSystemOperatorsSid = 31
    WinBuiltinPrintOperatorsSid = 32
    WinBuiltinBackupOperatorsSid = 33
    WinBuiltinReplicatorSid = 34
    WinBuiltinPreWindows2000CompatibleAccessSid = 35
    WinBuiltinRemoteDesktopUsersSid = 36
    WinBuiltinNetworkConfigurationOperatorsSid = 37
    WinAccountAdministratorSid = 38
    WinAccountGuestSid = 39
    WinAccountKrbtgtSid = 40
    WinAccountDomainAdminsSid = 41
    WinAccountDomainUsersSid = 42
    WinAccountDomainGuestsSid = 43
    WinAccountComputersSid = 44
    WinAccountControllersSid = 45
    WinAccountCertAdminsSid = 46
    WinAccountSchemaAdminsSid = 47
    WinAccountEnterpriseAdminsSid = 48
    WinAccountPolicyAdminsSid = 49
    WinAccountRasAndIasServersSid = 50
    WinNTLMAuthenticationSid = 51
    WinDigestAuthenticationSid = 52
    WinSChannelAuthenticationSid = 53
    WinThisOrganizationSid = 54
    WinOtherOrganizationSid = 55
    WinBuiltinIncomingForestTrustBuildersSid = 56
    WinBuiltinPerfMonitoringUsersSid = 57
    WinBuiltinPerfLoggingUsersSid = 58
    WinBuiltinAuthorizationAccessSid = 59
    WinBuiltinTerminalServerLicenseServersSid = 60
    WinBuiltinDCOMUsersSid = 61
    WinBuiltinIUsersSid = 62
    WinIUserSid = 63
    WinBuiltinCryptoOperatorsSid = 64
    WinUntrustedLabelSid = 65
    WinLowLabelSid = 66
    WinMediumLabelSid = 67
    WinHighLabelSid = 68
    WinSystemLabelSid = 69
    WinWriteRestrictedCodeSid = 70
    WinCreatorOwnerRightsSid = 71
    WinCacheablePrincipalsGroupSid = 72
    WinNonCacheablePrincipalsGroupSid = 73
    WinEnterpriseReadonlyControllersSid = 74
    WinAccountReadonlyControllersSid = 75
    WinBuiltinEventLogReadersGroup = 76
    WinNewEnterpriseReadonlyControllersSid = 77
    WinBuiltinCertSvcDComAccessGroup = 78
    WinMediumPlusLabelSid = 79
    WinLocalLogonSid = 80
    WinConsoleLogonSid = 81
    WinThisOrganizationCertificateSid = 82
    WinApplicationPackageAuthoritySid = 83
    WinBuiltinAnyPackageSid = 84
    WinCapabilityInternetClientSid = 85
    WinCapabilityInternetClientServerSid = 86
    WinCapabilityPrivateNetworkClientServerSid = 87
    WinCapabilityPicturesLibrarySid = 88
    WinCapabilityVideosLibrarySid = 89
    WinCapabilityMusicLibrarySid = 90
    WinCapabilityDocumentsLibrarySid = 91
    WinCapabilitySharedUserCertificatesSid = 92
    WinCapabilityEnterpriseAuthenticationSid = 93
    WinCapabilityRemovableStorageSid = 94
    WinBuiltinRDSRemoteAccessServersSid = 95
    WinBuiltinRDSEndpointServersSid = 96
    WinBuiltinRDSManagementServersSid = 97
    WinUserModeDriversSid = 98
    WinBuiltinHyperVAdminsSid = 99
    WinAccountCloneableControllersSid = 100
    WinBuiltinAccessControlAssistanceOperatorsSid = 101
    WinBuiltinRemoteManagementUsersSid = 102
    WinAuthenticationAuthorityAssertedSid = 103
    WinAuthenticationServiceAssertedSid = 104
    WinLocalAccountSid = 105
    WinLocalAccountAndAdministratorSid = 106
    WinAccountProtectedUsersSid = 107
    WinCapabilityAppointmentsSid = 108
    WinCapabilityContactsSid = 109
    WinAccountDefaultSystemManagedSid = 110
    WinBuiltinDefaultSystemManagedGroupSid = 111
    WinBuiltinStorageReplicaAdminsSid = 112
    WinAccountKeyAdminsSid = 113
    WinAccountEnterpriseKeyAdminsSid = 114
    WinAuthenticationKeyTrustSid = 115
    WinAuthenticationKeyPropertyMFASid = 116
    WinAuthenticationKeyPropertyAttestationSid = 117
    WinAuthenticationFreshKeyAuthSid = 118
    WinBuiltinDeviceOwnersSid = 119
  end

  enum ACL_INFORMATION_CLASS : Int32
    AclRevisionInformation = 1
    AclSizeInformation = 2
  end

  enum AUDIT_EVENT_TYPE : Int32
    AuditEventObjectAccess = 0
    AuditEventDirectoryServiceAccess = 1
  end

  enum SECURITY_IMPERSONATION_LEVEL : Int32
    SecurityAnonymous = 0
    SecurityIdentification = 1
    SecurityImpersonation = 2
    SecurityDelegation = 3
  end

  enum TOKEN_TYPE : Int32
    TokenPrimary = 1
    TokenImpersonation = 2
  end

  enum TOKEN_ELEVATION_TYPE : Int32
    TokenElevationTypeDefault = 1
    TokenElevationTypeFull = 2
    TokenElevationTypeLimited = 3
  end

  enum TOKEN_INFORMATION_CLASS : Int32
    TokenUser = 1
    TokenGroups = 2
    TokenPrivileges = 3
    TokenOwner = 4
    TokenPrimaryGroup = 5
    TokenDefaultDacl = 6
    TokenSource = 7
    TokenType = 8
    TokenImpersonationLevel = 9
    TokenStatistics = 10
    TokenRestrictedSids = 11
    TokenSessionId = 12
    TokenGroupsAndPrivileges = 13
    TokenSessionReference = 14
    TokenSandBoxInert = 15
    TokenAuditPolicy = 16
    TokenOrigin = 17
    TokenElevationType = 18
    TokenLinkedToken = 19
    TokenElevation = 20
    TokenHasRestrictions = 21
    TokenAccessInformation = 22
    TokenVirtualizationAllowed = 23
    TokenVirtualizationEnabled = 24
    TokenIntegrityLevel = 25
    TokenUIAccess = 26
    TokenMandatoryPolicy = 27
    TokenLogonSid = 28
    TokenIsAppContainer = 29
    TokenCapabilities = 30
    TokenAppContainerSid = 31
    TokenAppContainerNumber = 32
    TokenUserClaimAttributes = 33
    TokenDeviceClaimAttributes = 34
    TokenRestrictedUserClaimAttributes = 35
    TokenRestrictedDeviceClaimAttributes = 36
    TokenDeviceGroups = 37
    TokenRestrictedDeviceGroups = 38
    TokenSecurityAttributes = 39
    TokenIsRestricted = 40
    TokenProcessTrustLevel = 41
    TokenPrivateNameSpace = 42
    TokenSingletonAttributes = 43
    TokenBnoIsolation = 44
    TokenChildProcessFlags = 45
    TokenIsLessPrivilegedAppContainer = 46
    TokenIsSandboxed = 47
    MaxTokenInfoClass = 48
  end

  enum MANDATORY_LEVEL : Int32
    MandatoryLevelUntrusted = 0
    MandatoryLevelLow = 1
    MandatoryLevelMedium = 2
    MandatoryLevelHigh = 3
    MandatoryLevelSystem = 4
    MandatoryLevelSecureProcess = 5
    MandatoryLevelCount = 6
  end

  union LLFILETIME_Anonymous_e__Union
    ll : Int64
    ft : FILETIME
  end
  union SE_SID
    sid : SID
    buffer : UInt8[68]*
  end
  union CLAIM_SECURITY_ATTRIBUTE_V1_Values_e__Union
    p_int64 : Int64*
    p_uint64 : UInt64*
    pp_string : LibC::LPWSTR*
    p_fqbn : CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE*
    p_octet_string : CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE*
  end
  union CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1_Values_e__Union
    p_int64 : UInt32[0]*
    p_uint64 : UInt32[0]*
    pp_string : UInt32[0]*
    p_fqbn : UInt32[0]*
    p_octet_string : UInt32[0]*
  end
  union CLAIM_SECURITY_ATTRIBUTES_INFORMATION_Attribute_e__Union
    p_attribute_v1 : CLAIM_SECURITY_ATTRIBUTE_V1*
  end

  struct SECURITY_ATTRIBUTES
    n_length : UInt32
    lp_security_descriptor : Void*
    b_inherit_handle : LibC::BOOL
  end
  struct LLFILETIME
    anonymous : LLFILETIME_Anonymous_e__Union
  end
  struct GENERIC_MAPPING
    generic_read : UInt32
    generic_write : UInt32
    generic_execute : UInt32
    generic_all : UInt32
  end
  struct LUID_AND_ATTRIBUTES
    luid : LUID
    attributes : TOKEN_PRIVILEGES_ATTRIBUTES
  end
  struct SID_IDENTIFIER_AUTHORITY
    value : UInt8[6]*
  end
  struct SID
    revision : UInt8
    sub_authority_count : UInt8
    identifier_authority : SID_IDENTIFIER_AUTHORITY
    sub_authority : UInt32[0]*
  end
  struct SID_AND_ATTRIBUTES
    sid : PSID
    attributes : UInt32
  end
  struct SID_AND_ATTRIBUTES_HASH
    sid_count : UInt32
    sid_attr : SID_AND_ATTRIBUTES*
    hash : LibC::UINT_PTR[32]*
  end
  struct ACL
    acl_revision : UInt8
    sbz1 : UInt8
    acl_size : UInt16
    ace_count : UInt16
    sbz2 : UInt16
  end
  struct ACE_HEADER
    ace_type : UInt8
    ace_flags : UInt8
    ace_size : UInt16
  end
  struct ACCESS_ALLOWED_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct ACCESS_DENIED_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_AUDIT_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_ALARM_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_RESOURCE_ATTRIBUTE_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_SCOPED_POLICY_ID_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_MANDATORY_LABEL_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_PROCESS_TRUST_LABEL_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_ACCESS_FILTER_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct ACCESS_ALLOWED_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct ACCESS_DENIED_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct SYSTEM_AUDIT_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct SYSTEM_ALARM_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : UInt32
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct ACCESS_ALLOWED_CALLBACK_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct ACCESS_DENIED_CALLBACK_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_AUDIT_CALLBACK_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct SYSTEM_ALARM_CALLBACK_ACE
    header : ACE_HEADER
    mask : UInt32
    sid_start : UInt32
  end
  struct ACCESS_ALLOWED_CALLBACK_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct ACCESS_DENIED_CALLBACK_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct SYSTEM_AUDIT_CALLBACK_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct SYSTEM_ALARM_CALLBACK_OBJECT_ACE
    header : ACE_HEADER
    mask : UInt32
    flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    object_type : Guid
    inherited_object_type : Guid
    sid_start : UInt32
  end
  struct ACL_REVISION_INFORMATION
    acl_revision : UInt32
  end
  struct ACL_SIZE_INFORMATION
    ace_count : UInt32
    acl_bytes_in_use : UInt32
    acl_bytes_free : UInt32
  end
  struct SECURITY_DESCRIPTOR
    revision : UInt8
    sbz1 : UInt8
    control : UInt16
    owner : PSID
    group : PSID
    sacl : ACL*
    dacl : ACL*
  end
  struct OBJECT_TYPE_LIST
    level : UInt16
    sbz : UInt16
    object_type : Guid*
  end
  struct PRIVILEGE_SET
    privilege_count : UInt32
    control : UInt32
    privilege : LUID_AND_ATTRIBUTES[0]*
  end
  struct ACCESS_REASONS
    data : UInt32[32]*
  end
  struct SE_SECURITY_DESCRIPTOR
    size : UInt32
    flags : UInt32
    security_descriptor : SECURITY_DESCRIPTOR*
  end
  struct SE_ACCESS_REQUEST
    size : UInt32
    se_security_descriptor : SE_SECURITY_DESCRIPTOR*
    desired_access : UInt32
    previously_granted_access : UInt32
    principal_self_sid : PSID
    generic_mapping : GENERIC_MAPPING*
    object_type_list_count : UInt32
    object_type_list : OBJECT_TYPE_LIST*
  end
  struct SE_ACCESS_REPLY
    size : UInt32
    result_list_count : UInt32
    granted_access : UInt32*
    access_status : UInt32*
    access_reason : ACCESS_REASONS*
    privileges : PRIVILEGE_SET**
  end
  struct TOKEN_USER
    user : SID_AND_ATTRIBUTES
  end
  struct TOKEN_GROUPS
    group_count : UInt32
    groups : SID_AND_ATTRIBUTES[0]*
  end
  struct TOKEN_PRIVILEGES
    privilege_count : UInt32
    privileges : LUID_AND_ATTRIBUTES[0]*
  end
  struct TOKEN_OWNER
    owner : PSID
  end
  struct TOKEN_PRIMARY_GROUP
    primary_group : PSID
  end
  struct TOKEN_DEFAULT_DACL
    default_dacl : ACL*
  end
  struct TOKEN_USER_CLAIMS
    user_claims : Void*
  end
  struct TOKEN_DEVICE_CLAIMS
    device_claims : Void*
  end
  struct TOKEN_GROUPS_AND_PRIVILEGES
    sid_count : UInt32
    sid_length : UInt32
    sids : SID_AND_ATTRIBUTES*
    restricted_sid_count : UInt32
    restricted_sid_length : UInt32
    restricted_sids : SID_AND_ATTRIBUTES*
    privilege_count : UInt32
    privilege_length : UInt32
    privileges : LUID_AND_ATTRIBUTES*
    authentication_id : LUID
  end
  struct TOKEN_LINKED_TOKEN
    linked_token : LibC::HANDLE
  end
  struct TOKEN_ELEVATION
    token_is_elevated : UInt32
  end
  struct TOKEN_MANDATORY_LABEL
    label : SID_AND_ATTRIBUTES
  end
  struct TOKEN_MANDATORY_POLICY
    policy : TOKEN_MANDATORY_POLICY_ID
  end
  struct TOKEN_ACCESS_INFORMATION
    sid_hash : SID_AND_ATTRIBUTES_HASH*
    restricted_sid_hash : SID_AND_ATTRIBUTES_HASH*
    privileges : TOKEN_PRIVILEGES*
    authentication_id : LUID
    token_type : TOKEN_TYPE
    impersonation_level : SECURITY_IMPERSONATION_LEVEL
    mandatory_policy : TOKEN_MANDATORY_POLICY
    flags : UInt32
    app_container_number : UInt32
    package_sid : PSID
    capabilities_hash : SID_AND_ATTRIBUTES_HASH*
    trust_level_sid : PSID
    security_attributes : Void*
  end
  struct TOKEN_AUDIT_POLICY
    per_user_policy : UInt8[30]*
  end
  struct TOKEN_SOURCE
    source_name : CHAR[8]*
    source_identifier : LUID
  end
  struct TOKEN_STATISTICS
    token_id : LUID
    authentication_id : LUID
    expiration_time : LARGE_INTEGER
    token_type : TOKEN_TYPE
    impersonation_level : SECURITY_IMPERSONATION_LEVEL
    dynamic_charged : UInt32
    dynamic_available : UInt32
    group_count : UInt32
    privilege_count : UInt32
    modified_id : LUID
  end
  struct TOKEN_CONTROL
    token_id : LUID
    authentication_id : LUID
    modified_id : LUID
    token_source : TOKEN_SOURCE
  end
  struct TOKEN_ORIGIN
    originating_logon_session : LUID
  end
  struct TOKEN_APPCONTAINER_INFORMATION
    token_app_container : PSID
  end
  struct CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE
    version : UInt64
    name : LibC::LPWSTR
  end
  struct CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
    p_value : Void*
    value_length : UInt32
  end
  struct CLAIM_SECURITY_ATTRIBUTE_V1
    name : LibC::LPWSTR
    value_type : CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE
    reserved : UInt16
    flags : UInt32
    value_count : UInt32
    values : CLAIM_SECURITY_ATTRIBUTE_V1_Values_e__Union
  end
  struct CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1
    name : UInt32
    value_type : CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE
    reserved : UInt16
    flags : CLAIM_SECURITY_ATTRIBUTE_FLAGS
    value_count : UInt32
    values : CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1_Values_e__Union
  end
  struct CLAIM_SECURITY_ATTRIBUTES_INFORMATION
    version : UInt16
    reserved : UInt16
    attribute_count : UInt32
    attribute : CLAIM_SECURITY_ATTRIBUTES_INFORMATION_Attribute_e__Union
  end
  struct SECURITY_QUALITY_OF_SERVICE
    length : UInt32
    impersonation_level : SECURITY_IMPERSONATION_LEVEL
    context_tracking_mode : UInt8
    effective_only : BOOLEAN
  end
  struct SE_IMPERSONATION_STATE
    token : Void*
    copy_on_open : BOOLEAN
    effective_only : BOOLEAN
    level : SECURITY_IMPERSONATION_LEVEL
  end
  struct SECURITY_CAPABILITIES
    app_container_sid : PSID
    capabilities : SID_AND_ATTRIBUTES*
    capability_count : UInt32
    reserved : UInt32
  end
  struct QUOTA_LIMITS
    paged_pool_limit : LibC::UINT_PTR
    non_paged_pool_limit : LibC::UINT_PTR
    minimum_working_set_size : LibC::UINT_PTR
    maximum_working_set_size : LibC::UINT_PTR
    pagefile_limit : LibC::UINT_PTR
    time_limit : LARGE_INTEGER
  end


  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],clienttoken : LibC::HANDLE [In],desiredaccess : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],privilegeset : PRIVILEGE_SET* [In],privilegesetlength : UInt32* [In],grantedaccess : UInt32* [In],accessstatus : Int32* [In]
  fun AccessCheck(psecuritydescriptor : SECURITY_DESCRIPTOR*, clienttoken : LibC::HANDLE, desiredaccess : UInt32, genericmapping : GENERIC_MAPPING*, privilegeset : PRIVILEGE_SET*, privilegesetlength : UInt32*, grantedaccess : UInt32*, accessstatus : Int32*) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],objecttypename : LibC::LPWSTR [In],objectname : LibC::LPWSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],desiredaccess : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccess : UInt32* [In],accessstatus : Int32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckAndAuditAlarmW(subsystemname : LibC::LPWSTR, handleid : Void*, objecttypename : LibC::LPWSTR, objectname : LibC::LPWSTR, securitydescriptor : SECURITY_DESCRIPTOR*, desiredaccess : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccess : UInt32*, accessstatus : Int32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],clienttoken : LibC::HANDLE [In],desiredaccess : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],privilegeset : PRIVILEGE_SET* [In],privilegesetlength : UInt32* [In],grantedaccess : UInt32* [In],accessstatus : Int32* [In]
  fun AccessCheckByType(psecuritydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, clienttoken : LibC::HANDLE, desiredaccess : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, privilegeset : PRIVILEGE_SET*, privilegesetlength : UInt32*, grantedaccess : UInt32*, accessstatus : Int32*) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],clienttoken : LibC::HANDLE [In],desiredaccess : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],privilegeset : PRIVILEGE_SET* [In],privilegesetlength : UInt32* [In],grantedaccesslist : UInt32* [In],accessstatuslist : UInt32* [In]
  fun AccessCheckByTypeResultList(psecuritydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, clienttoken : LibC::HANDLE, desiredaccess : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, privilegeset : PRIVILEGE_SET*, privilegesetlength : UInt32*, grantedaccesslist : UInt32*, accessstatuslist : UInt32*) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],objecttypename : LibC::LPWSTR [In],objectname : LibC::LPWSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],desiredaccess : UInt32 [In],audittype : AUDIT_EVENT_TYPE [In],flags : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccess : UInt32* [In],accessstatus : Int32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckByTypeAndAuditAlarmW(subsystemname : LibC::LPWSTR, handleid : Void*, objecttypename : LibC::LPWSTR, objectname : LibC::LPWSTR, securitydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, desiredaccess : UInt32, audittype : AUDIT_EVENT_TYPE, flags : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccess : UInt32*, accessstatus : Int32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],objecttypename : LibC::LPWSTR [In],objectname : LibC::LPWSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],desiredaccess : UInt32 [In],audittype : AUDIT_EVENT_TYPE [In],flags : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccesslist : UInt32* [In],accessstatuslist : UInt32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckByTypeResultListAndAuditAlarmW(subsystemname : LibC::LPWSTR, handleid : Void*, objecttypename : LibC::LPWSTR, objectname : LibC::LPWSTR, securitydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, desiredaccess : UInt32, audittype : AUDIT_EVENT_TYPE, flags : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccesslist : UInt32*, accessstatuslist : UInt32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],clienttoken : LibC::HANDLE [In],objecttypename : LibC::LPWSTR [In],objectname : LibC::LPWSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],desiredaccess : UInt32 [In],audittype : AUDIT_EVENT_TYPE [In],flags : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccesslist : UInt32* [In],accessstatuslist : UInt32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckByTypeResultListAndAuditAlarmByHandleW(subsystemname : LibC::LPWSTR, handleid : Void*, clienttoken : LibC::HANDLE, objecttypename : LibC::LPWSTR, objectname : LibC::LPWSTR, securitydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, desiredaccess : UInt32, audittype : AUDIT_EVENT_TYPE, flags : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccesslist : UInt32*, accessstatuslist : UInt32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],accessmask : UInt32 [In],psid : PSID [In]
  fun AddAccessAllowedAce(pacl : ACL*, dwacerevision : UInt32, accessmask : UInt32, psid : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],accessmask : UInt32 [In],psid : PSID [In]
  fun AddAccessAllowedAceEx(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, accessmask : UInt32, psid : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],accessmask : UInt32 [In],objecttypeguid : Guid* [In],inheritedobjecttypeguid : Guid* [In],psid : PSID [In]
  fun AddAccessAllowedObjectAce(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, accessmask : UInt32, objecttypeguid : Guid*, inheritedobjecttypeguid : Guid*, psid : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],accessmask : UInt32 [In],psid : PSID [In]
  fun AddAccessDeniedAce(pacl : ACL*, dwacerevision : UInt32, accessmask : UInt32, psid : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],accessmask : UInt32 [In],psid : PSID [In]
  fun AddAccessDeniedAceEx(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, accessmask : UInt32, psid : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],accessmask : UInt32 [In],objecttypeguid : Guid* [In],inheritedobjecttypeguid : Guid* [In],psid : PSID [In]
  fun AddAccessDeniedObjectAce(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, accessmask : UInt32, objecttypeguid : Guid*, inheritedobjecttypeguid : Guid*, psid : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],dwstartingaceindex : UInt32 [In],pacelist : Void* [In],nacelistlength : UInt32 [In]
  fun AddAce(pacl : ACL*, dwacerevision : UInt32, dwstartingaceindex : UInt32, pacelist : Void*, nacelistlength : UInt32) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],dwaccessmask : UInt32 [In],psid : PSID [In],bauditsuccess : LibC::BOOL [In],bauditfailure : LibC::BOOL [In]
  fun AddAuditAccessAce(pacl : ACL*, dwacerevision : UInt32, dwaccessmask : UInt32, psid : PSID, bauditsuccess : LibC::BOOL, bauditfailure : LibC::BOOL) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],dwaccessmask : UInt32 [In],psid : PSID [In],bauditsuccess : LibC::BOOL [In],bauditfailure : LibC::BOOL [In]
  fun AddAuditAccessAceEx(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, dwaccessmask : UInt32, psid : PSID, bauditsuccess : LibC::BOOL, bauditfailure : LibC::BOOL) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],accessmask : UInt32 [In],objecttypeguid : Guid* [In],inheritedobjecttypeguid : Guid* [In],psid : PSID [In],bauditsuccess : LibC::BOOL [In],bauditfailure : LibC::BOOL [In]
  fun AddAuditAccessObjectAce(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, accessmask : UInt32, objecttypeguid : Guid*, inheritedobjecttypeguid : Guid*, psid : PSID, bauditsuccess : LibC::BOOL, bauditfailure : LibC::BOOL) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : ACE_REVISION [In],aceflags : ACE_FLAGS [In],mandatorypolicy : UInt32 [In],plabelsid : PSID [In]
  fun AddMandatoryAce(pacl : ACL*, dwacerevision : ACE_REVISION, aceflags : ACE_FLAGS, mandatorypolicy : UInt32, plabelsid : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],accessmask : UInt32 [In],psid : PSID [In],pattributeinfo : CLAIM_SECURITY_ATTRIBUTES_INFORMATION* [In],preturnlength : UInt32* [In]
  fun AddResourceAttributeAce(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, accessmask : UInt32, psid : PSID, pattributeinfo : CLAIM_SECURITY_ATTRIBUTES_INFORMATION*, preturnlength : UInt32*) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],accessmask : UInt32 [In],psid : PSID [In]
  fun AddScopedPolicyIDAce(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, accessmask : UInt32, psid : PSID) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In],resettodefault : LibC::BOOL [In],newstate : TOKEN_GROUPS* [In],bufferlength : UInt32 [In],previousstate : TOKEN_GROUPS* [In],returnlength : UInt32* [In]
  fun AdjustTokenGroups(tokenhandle : LibC::HANDLE, resettodefault : LibC::BOOL, newstate : TOKEN_GROUPS*, bufferlength : UInt32, previousstate : TOKEN_GROUPS*, returnlength : UInt32*) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In],disableallprivileges : LibC::BOOL [In],newstate : TOKEN_PRIVILEGES* [In],bufferlength : UInt32 [In],previousstate : TOKEN_PRIVILEGES* [In],returnlength : UInt32* [In]
  fun AdjustTokenPrivileges(tokenhandle : LibC::HANDLE, disableallprivileges : LibC::BOOL, newstate : TOKEN_PRIVILEGES*, bufferlength : UInt32, previousstate : TOKEN_PRIVILEGES*, returnlength : UInt32*) : LibC::BOOL

  # Params # pidentifierauthority : SID_IDENTIFIER_AUTHORITY* [In],nsubauthoritycount : UInt8 [In],nsubauthority0 : UInt32 [In],nsubauthority1 : UInt32 [In],nsubauthority2 : UInt32 [In],nsubauthority3 : UInt32 [In],nsubauthority4 : UInt32 [In],nsubauthority5 : UInt32 [In],nsubauthority6 : UInt32 [In],nsubauthority7 : UInt32 [In],psid : PSID* [In]
  fun AllocateAndInitializeSid(pidentifierauthority : SID_IDENTIFIER_AUTHORITY*, nsubauthoritycount : UInt8, nsubauthority0 : UInt32, nsubauthority1 : UInt32, nsubauthority2 : UInt32, nsubauthority3 : UInt32, nsubauthority4 : UInt32, nsubauthority5 : UInt32, nsubauthority6 : UInt32, nsubauthority7 : UInt32, psid : PSID*) : LibC::BOOL

  # Params # luid : LUID* [In]
  fun AllocateLocallyUniqueId(luid : LUID*) : LibC::BOOL

  # Params # grantedaccess : UInt32 [In],desiredaccess : UInt32 [In]
  fun AreAllAccessesGranted(grantedaccess : UInt32, desiredaccess : UInt32) : LibC::BOOL

  # Params # grantedaccess : UInt32 [In],desiredaccess : UInt32 [In]
  fun AreAnyAccessesGranted(grantedaccess : UInt32, desiredaccess : UInt32) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In],sidtocheck : PSID [In],ismember : LibC::BOOL* [In]
  fun CheckTokenMembership(tokenhandle : LibC::HANDLE, sidtocheck : PSID, ismember : LibC::BOOL*) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In],capabilitysidtocheck : PSID [In],hascapability : LibC::BOOL* [In]
  fun CheckTokenCapability(tokenhandle : LibC::HANDLE, capabilitysidtocheck : PSID, hascapability : LibC::BOOL*) : LibC::BOOL

  # Params # acl : ACL* [In],startingaceindex : UInt32 [In],appcontainerace : Void** [In],appcontaineraceindex : UInt32* [In]
  fun GetAppContainerAce(acl : ACL*, startingaceindex : UInt32, appcontainerace : Void**, appcontaineraceindex : UInt32*) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In],sidtocheck : PSID [In],flags : UInt32 [In],ismember : LibC::BOOL* [In]
  fun CheckTokenMembershipEx(tokenhandle : LibC::HANDLE, sidtocheck : PSID, flags : UInt32, ismember : LibC::BOOL*) : LibC::BOOL

  # Params # parentdescriptor : SECURITY_DESCRIPTOR* [In],currentsecuritydescriptor : SECURITY_DESCRIPTOR* [In],newsecuritydescriptor : SECURITY_DESCRIPTOR** [In],objecttype : Guid* [In],isdirectoryobject : BOOLEAN [In],genericmapping : GENERIC_MAPPING* [In]
  fun ConvertToAutoInheritPrivateObjectSecurity(parentdescriptor : SECURITY_DESCRIPTOR*, currentsecuritydescriptor : SECURITY_DESCRIPTOR*, newsecuritydescriptor : SECURITY_DESCRIPTOR**, objecttype : Guid*, isdirectoryobject : BOOLEAN, genericmapping : GENERIC_MAPPING*) : LibC::BOOL

  # Params # ndestinationsidlength : UInt32 [In],pdestinationsid : PSID [In],psourcesid : PSID [In]
  fun CopySid(ndestinationsidlength : UInt32, pdestinationsid : PSID, psourcesid : PSID) : LibC::BOOL

  # Params # parentdescriptor : SECURITY_DESCRIPTOR* [In],creatordescriptor : SECURITY_DESCRIPTOR* [In],newdescriptor : SECURITY_DESCRIPTOR** [In],isdirectoryobject : LibC::BOOL [In],token : LibC::HANDLE [In],genericmapping : GENERIC_MAPPING* [In]
  fun CreatePrivateObjectSecurity(parentdescriptor : SECURITY_DESCRIPTOR*, creatordescriptor : SECURITY_DESCRIPTOR*, newdescriptor : SECURITY_DESCRIPTOR**, isdirectoryobject : LibC::BOOL, token : LibC::HANDLE, genericmapping : GENERIC_MAPPING*) : LibC::BOOL

  # Params # parentdescriptor : SECURITY_DESCRIPTOR* [In],creatordescriptor : SECURITY_DESCRIPTOR* [In],newdescriptor : SECURITY_DESCRIPTOR** [In],objecttype : Guid* [In],iscontainerobject : LibC::BOOL [In],autoinheritflags : SECURITY_AUTO_INHERIT_FLAGS [In],token : LibC::HANDLE [In],genericmapping : GENERIC_MAPPING* [In]
  fun CreatePrivateObjectSecurityEx(parentdescriptor : SECURITY_DESCRIPTOR*, creatordescriptor : SECURITY_DESCRIPTOR*, newdescriptor : SECURITY_DESCRIPTOR**, objecttype : Guid*, iscontainerobject : LibC::BOOL, autoinheritflags : SECURITY_AUTO_INHERIT_FLAGS, token : LibC::HANDLE, genericmapping : GENERIC_MAPPING*) : LibC::BOOL

  # Params # parentdescriptor : SECURITY_DESCRIPTOR* [In],creatordescriptor : SECURITY_DESCRIPTOR* [In],newdescriptor : SECURITY_DESCRIPTOR** [In],objecttypes : Guid** [In],guidcount : UInt32 [In],iscontainerobject : LibC::BOOL [In],autoinheritflags : SECURITY_AUTO_INHERIT_FLAGS [In],token : LibC::HANDLE [In],genericmapping : GENERIC_MAPPING* [In]
  fun CreatePrivateObjectSecurityWithMultipleInheritance(parentdescriptor : SECURITY_DESCRIPTOR*, creatordescriptor : SECURITY_DESCRIPTOR*, newdescriptor : SECURITY_DESCRIPTOR**, objecttypes : Guid**, guidcount : UInt32, iscontainerobject : LibC::BOOL, autoinheritflags : SECURITY_AUTO_INHERIT_FLAGS, token : LibC::HANDLE, genericmapping : GENERIC_MAPPING*) : LibC::BOOL

  # Params # existingtokenhandle : LibC::HANDLE [In],flags : CREATE_RESTRICTED_TOKEN_FLAGS [In],disablesidcount : UInt32 [In],sidstodisable : SID_AND_ATTRIBUTES* [In],deleteprivilegecount : UInt32 [In],privilegestodelete : LUID_AND_ATTRIBUTES* [In],restrictedsidcount : UInt32 [In],sidstorestrict : SID_AND_ATTRIBUTES* [In],newtokenhandle : LibC::HANDLE* [In]
  fun CreateRestrictedToken(existingtokenhandle : LibC::HANDLE, flags : CREATE_RESTRICTED_TOKEN_FLAGS, disablesidcount : UInt32, sidstodisable : SID_AND_ATTRIBUTES*, deleteprivilegecount : UInt32, privilegestodelete : LUID_AND_ATTRIBUTES*, restrictedsidcount : UInt32, sidstorestrict : SID_AND_ATTRIBUTES*, newtokenhandle : LibC::HANDLE*) : LibC::BOOL

  # Params # wellknownsidtype : WELL_KNOWN_SID_TYPE [In],domainsid : PSID [In],psid : PSID [In],cbsid : UInt32* [In]
  fun CreateWellKnownSid(wellknownsidtype : WELL_KNOWN_SID_TYPE, domainsid : PSID, psid : PSID, cbsid : UInt32*) : LibC::BOOL

  # Params # psid1 : PSID [In],psid2 : PSID [In],pfequal : LibC::BOOL* [In]
  fun EqualDomainSid(psid1 : PSID, psid2 : PSID, pfequal : LibC::BOOL*) : LibC::BOOL

  # Params # pacl : ACL* [In],dwaceindex : UInt32 [In]
  fun DeleteAce(pacl : ACL*, dwaceindex : UInt32) : LibC::BOOL

  # Params # objectdescriptor : SECURITY_DESCRIPTOR** [In]
  fun DestroyPrivateObjectSecurity(objectdescriptor : SECURITY_DESCRIPTOR**) : LibC::BOOL

  # Params # existingtokenhandle : LibC::HANDLE [In],impersonationlevel : SECURITY_IMPERSONATION_LEVEL [In],duplicatetokenhandle : LibC::HANDLE* [In]
  fun DuplicateToken(existingtokenhandle : LibC::HANDLE, impersonationlevel : SECURITY_IMPERSONATION_LEVEL, duplicatetokenhandle : LibC::HANDLE*) : LibC::BOOL

  # Params # hexistingtoken : LibC::HANDLE [In],dwdesiredaccess : TOKEN_ACCESS_MASK [In],lptokenattributes : SECURITY_ATTRIBUTES* [In],impersonationlevel : SECURITY_IMPERSONATION_LEVEL [In],tokentype : TOKEN_TYPE [In],phnewtoken : LibC::HANDLE* [In]
  fun DuplicateTokenEx(hexistingtoken : LibC::HANDLE, dwdesiredaccess : TOKEN_ACCESS_MASK, lptokenattributes : SECURITY_ATTRIBUTES*, impersonationlevel : SECURITY_IMPERSONATION_LEVEL, tokentype : TOKEN_TYPE, phnewtoken : LibC::HANDLE*) : LibC::BOOL

  # Params # psid1 : PSID [In],psid2 : PSID [In]
  fun EqualPrefixSid(psid1 : PSID, psid2 : PSID) : LibC::BOOL

  # Params # psid1 : PSID [In],psid2 : PSID [In]
  fun EqualSid(psid1 : PSID, psid2 : PSID) : LibC::BOOL

  # Params # pacl : ACL* [In],pace : Void** [In]
  fun FindFirstFreeAce(pacl : ACL*, pace : Void**) : LibC::BOOL

  # Params # psid : PSID [In]
  fun FreeSid(psid : PSID) : Void*

  # Params # pacl : ACL* [In],dwaceindex : UInt32 [In],pace : Void** [In]
  fun GetAce(pacl : ACL*, dwaceindex : UInt32, pace : Void**) : LibC::BOOL

  # Params # pacl : ACL* [In],paclinformation : Void* [In],naclinformationlength : UInt32 [In],dwaclinformationclass : ACL_INFORMATION_CLASS [In]
  fun GetAclInformation(pacl : ACL*, paclinformation : Void*, naclinformationlength : UInt32, dwaclinformationclass : ACL_INFORMATION_CLASS) : LibC::BOOL

  # Params # lpfilename : LibC::LPWSTR [In],requestedinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun GetFileSecurityW(lpfilename : LibC::LPWSTR, requestedinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # handle : LibC::HANDLE [In],requestedinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun GetKernelObjectSecurity(handle : LibC::HANDLE, requestedinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # psid : PSID [In]
  fun GetLengthSid(psid : PSID) : UInt32

  # Params # objectdescriptor : SECURITY_DESCRIPTOR* [In],securityinformation : UInt32 [In],resultantdescriptor : SECURITY_DESCRIPTOR* [In],descriptorlength : UInt32 [In],returnlength : UInt32* [In]
  fun GetPrivateObjectSecurity(objectdescriptor : SECURITY_DESCRIPTOR*, securityinformation : UInt32, resultantdescriptor : SECURITY_DESCRIPTOR*, descriptorlength : UInt32, returnlength : UInt32*) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],pcontrol : UInt16* [In],lpdwrevision : UInt32* [In]
  fun GetSecurityDescriptorControl(psecuritydescriptor : SECURITY_DESCRIPTOR*, pcontrol : UInt16*, lpdwrevision : UInt32*) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],lpbdaclpresent : Int32* [In],pdacl : ACL** [In],lpbdacldefaulted : Int32* [In]
  fun GetSecurityDescriptorDacl(psecuritydescriptor : SECURITY_DESCRIPTOR*, lpbdaclpresent : Int32*, pdacl : ACL**, lpbdacldefaulted : Int32*) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],pgroup : PSID* [In],lpbgroupdefaulted : Int32* [In]
  fun GetSecurityDescriptorGroup(psecuritydescriptor : SECURITY_DESCRIPTOR*, pgroup : PSID*, lpbgroupdefaulted : Int32*) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun GetSecurityDescriptorLength(psecuritydescriptor : SECURITY_DESCRIPTOR*) : UInt32

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],powner : PSID* [In],lpbownerdefaulted : Int32* [In]
  fun GetSecurityDescriptorOwner(psecuritydescriptor : SECURITY_DESCRIPTOR*, powner : PSID*, lpbownerdefaulted : Int32*) : LibC::BOOL

  # Params # securitydescriptor : SECURITY_DESCRIPTOR* [In],rmcontrol : UInt8* [In]
  fun GetSecurityDescriptorRMControl(securitydescriptor : SECURITY_DESCRIPTOR*, rmcontrol : UInt8*) : UInt32

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],lpbsaclpresent : Int32* [In],psacl : ACL** [In],lpbsacldefaulted : Int32* [In]
  fun GetSecurityDescriptorSacl(psecuritydescriptor : SECURITY_DESCRIPTOR*, lpbsaclpresent : Int32*, psacl : ACL**, lpbsacldefaulted : Int32*) : LibC::BOOL

  # Params # psid : PSID [In]
  fun GetSidIdentifierAuthority(psid : PSID) : SID_IDENTIFIER_AUTHORITY*

  # Params # nsubauthoritycount : UInt8 [In]
  fun GetSidLengthRequired(nsubauthoritycount : UInt8) : UInt32

  # Params # psid : PSID [In],nsubauthority : UInt32 [In]
  fun GetSidSubAuthority(psid : PSID, nsubauthority : UInt32) : UInt32*

  # Params # psid : PSID [In]
  fun GetSidSubAuthorityCount(psid : PSID) : UInt8*

  # Params # tokenhandle : LibC::HANDLE [In],tokeninformationclass : TOKEN_INFORMATION_CLASS [In],tokeninformation : Void* [In],tokeninformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun GetTokenInformation(tokenhandle : LibC::HANDLE, tokeninformationclass : TOKEN_INFORMATION_CLASS, tokeninformation : Void*, tokeninformationlength : UInt32, returnlength : UInt32*) : LibC::BOOL

  # Params # psid : PSID [In],pdomainsid : PSID [In],cbdomainsid : UInt32* [In]
  fun GetWindowsAccountDomainSid(psid : PSID, pdomainsid : PSID, cbdomainsid : UInt32*) : LibC::BOOL

  # Params # threadhandle : LibC::HANDLE [In]
  fun ImpersonateAnonymousToken(threadhandle : LibC::HANDLE) : LibC::BOOL

  # Params # htoken : LibC::HANDLE [In]
  fun ImpersonateLoggedOnUser(htoken : LibC::HANDLE) : LibC::BOOL

  # Params # impersonationlevel : SECURITY_IMPERSONATION_LEVEL [In]
  fun ImpersonateSelf(impersonationlevel : SECURITY_IMPERSONATION_LEVEL) : LibC::BOOL

  # Params # pacl : ACL* [In],nacllength : UInt32 [In],dwaclrevision : UInt32 [In]
  fun InitializeAcl(pacl : ACL*, nacllength : UInt32, dwaclrevision : UInt32) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],dwrevision : UInt32 [In]
  fun InitializeSecurityDescriptor(psecuritydescriptor : SECURITY_DESCRIPTOR*, dwrevision : UInt32) : LibC::BOOL

  # Params # sid : PSID [In],pidentifierauthority : SID_IDENTIFIER_AUTHORITY* [In],nsubauthoritycount : UInt8 [In]
  fun InitializeSid(sid : PSID, pidentifierauthority : SID_IDENTIFIER_AUTHORITY*, nsubauthoritycount : UInt8) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In]
  fun IsTokenRestricted(tokenhandle : LibC::HANDLE) : LibC::BOOL

  # Params # pacl : ACL* [In]
  fun IsValidAcl(pacl : ACL*) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun IsValidSecurityDescriptor(psecuritydescriptor : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # psid : PSID [In]
  fun IsValidSid(psid : PSID) : LibC::BOOL

  # Params # psid : PSID [In],wellknownsidtype : WELL_KNOWN_SID_TYPE [In]
  fun IsWellKnownSid(psid : PSID, wellknownsidtype : WELL_KNOWN_SID_TYPE) : LibC::BOOL

  # Params # pselfrelativesecuritydescriptor : SECURITY_DESCRIPTOR* [In],pabsolutesecuritydescriptor : SECURITY_DESCRIPTOR* [In],lpdwabsolutesecuritydescriptorsize : UInt32* [In],pdacl : ACL* [In],lpdwdaclsize : UInt32* [In],psacl : ACL* [In],lpdwsaclsize : UInt32* [In],powner : PSID [In],lpdwownersize : UInt32* [In],pprimarygroup : PSID [In],lpdwprimarygroupsize : UInt32* [In]
  fun MakeAbsoluteSD(pselfrelativesecuritydescriptor : SECURITY_DESCRIPTOR*, pabsolutesecuritydescriptor : SECURITY_DESCRIPTOR*, lpdwabsolutesecuritydescriptorsize : UInt32*, pdacl : ACL*, lpdwdaclsize : UInt32*, psacl : ACL*, lpdwsaclsize : UInt32*, powner : PSID, lpdwownersize : UInt32*, pprimarygroup : PSID, lpdwprimarygroupsize : UInt32*) : LibC::BOOL

  # Params # pabsolutesecuritydescriptor : SECURITY_DESCRIPTOR* [In],pselfrelativesecuritydescriptor : SECURITY_DESCRIPTOR* [In],lpdwbufferlength : UInt32* [In]
  fun MakeSelfRelativeSD(pabsolutesecuritydescriptor : SECURITY_DESCRIPTOR*, pselfrelativesecuritydescriptor : SECURITY_DESCRIPTOR*, lpdwbufferlength : UInt32*) : LibC::BOOL

  # Params # accessmask : UInt32* [In],genericmapping : GENERIC_MAPPING* [In]
  fun MapGenericMask(accessmask : UInt32*, genericmapping : GENERIC_MAPPING*) : Void

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],generateonclose : LibC::BOOL [In]
  fun ObjectCloseAuditAlarmW(subsystemname : LibC::LPWSTR, handleid : Void*, generateonclose : LibC::BOOL) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],generateonclose : LibC::BOOL [In]
  fun ObjectDeleteAuditAlarmW(subsystemname : LibC::LPWSTR, handleid : Void*, generateonclose : LibC::BOOL) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],objecttypename : LibC::LPWSTR [In],objectname : LibC::LPWSTR [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],clienttoken : LibC::HANDLE [In],desiredaccess : UInt32 [In],grantedaccess : UInt32 [In],privileges : PRIVILEGE_SET* [In],objectcreation : LibC::BOOL [In],accessgranted : LibC::BOOL [In],generateonclose : Int32* [In]
  fun ObjectOpenAuditAlarmW(subsystemname : LibC::LPWSTR, handleid : Void*, objecttypename : LibC::LPWSTR, objectname : LibC::LPWSTR, psecuritydescriptor : SECURITY_DESCRIPTOR*, clienttoken : LibC::HANDLE, desiredaccess : UInt32, grantedaccess : UInt32, privileges : PRIVILEGE_SET*, objectcreation : LibC::BOOL, accessgranted : LibC::BOOL, generateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],handleid : Void* [In],clienttoken : LibC::HANDLE [In],desiredaccess : UInt32 [In],privileges : PRIVILEGE_SET* [In],accessgranted : LibC::BOOL [In]
  fun ObjectPrivilegeAuditAlarmW(subsystemname : LibC::LPWSTR, handleid : Void*, clienttoken : LibC::HANDLE, desiredaccess : UInt32, privileges : PRIVILEGE_SET*, accessgranted : LibC::BOOL) : LibC::BOOL

  # Params # clienttoken : LibC::HANDLE [In],requiredprivileges : PRIVILEGE_SET* [In],pfresult : Int32* [In]
  fun PrivilegeCheck(clienttoken : LibC::HANDLE, requiredprivileges : PRIVILEGE_SET*, pfresult : Int32*) : LibC::BOOL

  # Params # subsystemname : LibC::LPWSTR [In],servicename : LibC::LPWSTR [In],clienttoken : LibC::HANDLE [In],privileges : PRIVILEGE_SET* [In],accessgranted : LibC::BOOL [In]
  fun PrivilegedServiceAuditAlarmW(subsystemname : LibC::LPWSTR, servicename : LibC::LPWSTR, clienttoken : LibC::HANDLE, privileges : PRIVILEGE_SET*, accessgranted : LibC::BOOL) : LibC::BOOL

  # Params # securityinformation : UInt32 [In],desiredaccess : UInt32* [In]
  fun QuerySecurityAccessMask(securityinformation : UInt32, desiredaccess : UInt32*) : Void

  # Params # 
  fun RevertToSelf : LibC::BOOL

  # Params # pacl : ACL* [In],paclinformation : Void* [In],naclinformationlength : UInt32 [In],dwaclinformationclass : ACL_INFORMATION_CLASS [In]
  fun SetAclInformation(pacl : ACL*, paclinformation : Void*, naclinformationlength : UInt32, dwaclinformationclass : ACL_INFORMATION_CLASS) : LibC::BOOL

  # Params # lpfilename : LibC::LPWSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun SetFileSecurityW(lpfilename : LibC::LPWSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # handle : LibC::HANDLE [In],securityinformation : UInt32 [In],securitydescriptor : SECURITY_DESCRIPTOR* [In]
  fun SetKernelObjectSecurity(handle : LibC::HANDLE, securityinformation : UInt32, securitydescriptor : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # securityinformation : UInt32 [In],modificationdescriptor : SECURITY_DESCRIPTOR* [In],objectssecuritydescriptor : SECURITY_DESCRIPTOR** [In],genericmapping : GENERIC_MAPPING* [In],token : LibC::HANDLE [In]
  fun SetPrivateObjectSecurity(securityinformation : UInt32, modificationdescriptor : SECURITY_DESCRIPTOR*, objectssecuritydescriptor : SECURITY_DESCRIPTOR**, genericmapping : GENERIC_MAPPING*, token : LibC::HANDLE) : LibC::BOOL

  # Params # securityinformation : UInt32 [In],modificationdescriptor : SECURITY_DESCRIPTOR* [In],objectssecuritydescriptor : SECURITY_DESCRIPTOR** [In],autoinheritflags : SECURITY_AUTO_INHERIT_FLAGS [In],genericmapping : GENERIC_MAPPING* [In],token : LibC::HANDLE [In]
  fun SetPrivateObjectSecurityEx(securityinformation : UInt32, modificationdescriptor : SECURITY_DESCRIPTOR*, objectssecuritydescriptor : SECURITY_DESCRIPTOR**, autoinheritflags : SECURITY_AUTO_INHERIT_FLAGS, genericmapping : GENERIC_MAPPING*, token : LibC::HANDLE) : LibC::BOOL

  # Params # securityinformation : UInt32 [In],desiredaccess : UInt32* [In]
  fun SetSecurityAccessMask(securityinformation : UInt32, desiredaccess : UInt32*) : Void

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],controlbitsofinterest : UInt16 [In],controlbitstoset : UInt16 [In]
  fun SetSecurityDescriptorControl(psecuritydescriptor : SECURITY_DESCRIPTOR*, controlbitsofinterest : UInt16, controlbitstoset : UInt16) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],bdaclpresent : LibC::BOOL [In],pdacl : ACL* [In],bdacldefaulted : LibC::BOOL [In]
  fun SetSecurityDescriptorDacl(psecuritydescriptor : SECURITY_DESCRIPTOR*, bdaclpresent : LibC::BOOL, pdacl : ACL*, bdacldefaulted : LibC::BOOL) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],pgroup : PSID [In],bgroupdefaulted : LibC::BOOL [In]
  fun SetSecurityDescriptorGroup(psecuritydescriptor : SECURITY_DESCRIPTOR*, pgroup : PSID, bgroupdefaulted : LibC::BOOL) : LibC::BOOL

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],powner : PSID [In],bownerdefaulted : LibC::BOOL [In]
  fun SetSecurityDescriptorOwner(psecuritydescriptor : SECURITY_DESCRIPTOR*, powner : PSID, bownerdefaulted : LibC::BOOL) : LibC::BOOL

  # Params # securitydescriptor : SECURITY_DESCRIPTOR* [In],rmcontrol : UInt8* [In]
  fun SetSecurityDescriptorRMControl(securitydescriptor : SECURITY_DESCRIPTOR*, rmcontrol : UInt8*) : UInt32

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],bsaclpresent : LibC::BOOL [In],psacl : ACL* [In],bsacldefaulted : LibC::BOOL [In]
  fun SetSecurityDescriptorSacl(psecuritydescriptor : SECURITY_DESCRIPTOR*, bsaclpresent : LibC::BOOL, psacl : ACL*, bsacldefaulted : LibC::BOOL) : LibC::BOOL

  # Params # tokenhandle : LibC::HANDLE [In],tokeninformationclass : TOKEN_INFORMATION_CLASS [In],tokeninformation : Void* [In],tokeninformationlength : UInt32 [In]
  fun SetTokenInformation(tokenhandle : LibC::HANDLE, tokeninformationclass : TOKEN_INFORMATION_CLASS, tokeninformation : Void*, tokeninformationlength : UInt32) : LibC::BOOL

  # Params # sourcefiles : LibC::HANDLE* [In],sourcefilecount : UInt32 [In],flags : UInt32 [In],targetfile : LibC::HANDLE [In]
  fun SetCachedSigningLevel(sourcefiles : LibC::HANDLE*, sourcefilecount : UInt32, flags : UInt32, targetfile : LibC::HANDLE) : LibC::BOOL

  # Params # file : LibC::HANDLE [In],flags : UInt32* [In],signinglevel : UInt32* [In],thumbprint : UInt8* [In],thumbprintsize : UInt32* [In],thumbprintalgorithm : UInt32* [In]
  fun GetCachedSigningLevel(file : LibC::HANDLE, flags : UInt32*, signinglevel : UInt32*, thumbprint : UInt8*, thumbprintsize : UInt32*, thumbprintalgorithm : UInt32*) : LibC::BOOL

  # Params # capname : LibC::LPWSTR [In],capabilitygroupsids : PSID** [In],capabilitygroupsidcount : UInt32* [In],capabilitysids : PSID** [In],capabilitysidcount : UInt32* [In]
  fun DeriveCapabilitySidsFromName(capname : LibC::LPWSTR, capabilitygroupsids : PSID**, capabilitygroupsidcount : UInt32*, capabilitysids : PSID**, capabilitysidcount : UInt32*) : LibC::BOOL

  # Params # securitydescriptor : SECURITY_DESCRIPTOR** [In],securitydescriptorlength : UInt32 [In],newsecuritydescriptor : SECURITY_DESCRIPTOR** [In],newsecuritydescriptorlength : UInt32* [In],checkonly : BOOLEAN [In]
  fun RtlNormalizeSecurityDescriptor(securitydescriptor : SECURITY_DESCRIPTOR**, securitydescriptorlength : UInt32, newsecuritydescriptor : SECURITY_DESCRIPTOR**, newsecuritydescriptorlength : UInt32*, checkonly : BOOLEAN) : BOOLEAN

  # Params # hobj : LibC::HANDLE [In],psirequested : OBJECT_SECURITY_INFORMATION* [In],psid : SECURITY_DESCRIPTOR* [In]
  fun SetUserObjectSecurity(hobj : LibC::HANDLE, psirequested : OBJECT_SECURITY_INFORMATION*, psid : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # hobj : LibC::HANDLE [In],psirequested : UInt32* [In],psid : SECURITY_DESCRIPTOR* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun GetUserObjectSecurity(hobj : LibC::HANDLE, psirequested : UInt32*, psid : SECURITY_DESCRIPTOR*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],objecttypename : PSTR [In],objectname : PSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],desiredaccess : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccess : UInt32* [In],accessstatus : Int32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckAndAuditAlarmA(subsystemname : PSTR, handleid : Void*, objecttypename : PSTR, objectname : PSTR, securitydescriptor : SECURITY_DESCRIPTOR*, desiredaccess : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccess : UInt32*, accessstatus : Int32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],objecttypename : PSTR [In],objectname : PSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],desiredaccess : UInt32 [In],audittype : AUDIT_EVENT_TYPE [In],flags : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccess : UInt32* [In],accessstatus : Int32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckByTypeAndAuditAlarmA(subsystemname : PSTR, handleid : Void*, objecttypename : PSTR, objectname : PSTR, securitydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, desiredaccess : UInt32, audittype : AUDIT_EVENT_TYPE, flags : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccess : UInt32*, accessstatus : Int32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],objecttypename : PSTR [In],objectname : PSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],desiredaccess : UInt32 [In],audittype : AUDIT_EVENT_TYPE [In],flags : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccess : UInt32* [In],accessstatuslist : UInt32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckByTypeResultListAndAuditAlarmA(subsystemname : PSTR, handleid : Void*, objecttypename : PSTR, objectname : PSTR, securitydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, desiredaccess : UInt32, audittype : AUDIT_EVENT_TYPE, flags : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccess : UInt32*, accessstatuslist : UInt32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],clienttoken : LibC::HANDLE [In],objecttypename : PSTR [In],objectname : PSTR [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],principalselfsid : PSID [In],desiredaccess : UInt32 [In],audittype : AUDIT_EVENT_TYPE [In],flags : UInt32 [In],objecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],genericmapping : GENERIC_MAPPING* [In],objectcreation : LibC::BOOL [In],grantedaccess : UInt32* [In],accessstatuslist : UInt32* [In],pfgenerateonclose : Int32* [In]
  fun AccessCheckByTypeResultListAndAuditAlarmByHandleA(subsystemname : PSTR, handleid : Void*, clienttoken : LibC::HANDLE, objecttypename : PSTR, objectname : PSTR, securitydescriptor : SECURITY_DESCRIPTOR*, principalselfsid : PSID, desiredaccess : UInt32, audittype : AUDIT_EVENT_TYPE, flags : UInt32, objecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, genericmapping : GENERIC_MAPPING*, objectcreation : LibC::BOOL, grantedaccess : UInt32*, accessstatuslist : UInt32*, pfgenerateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],objecttypename : PSTR [In],objectname : PSTR [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],clienttoken : LibC::HANDLE [In],desiredaccess : UInt32 [In],grantedaccess : UInt32 [In],privileges : PRIVILEGE_SET* [In],objectcreation : LibC::BOOL [In],accessgranted : LibC::BOOL [In],generateonclose : Int32* [In]
  fun ObjectOpenAuditAlarmA(subsystemname : PSTR, handleid : Void*, objecttypename : PSTR, objectname : PSTR, psecuritydescriptor : SECURITY_DESCRIPTOR*, clienttoken : LibC::HANDLE, desiredaccess : UInt32, grantedaccess : UInt32, privileges : PRIVILEGE_SET*, objectcreation : LibC::BOOL, accessgranted : LibC::BOOL, generateonclose : Int32*) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],clienttoken : LibC::HANDLE [In],desiredaccess : UInt32 [In],privileges : PRIVILEGE_SET* [In],accessgranted : LibC::BOOL [In]
  fun ObjectPrivilegeAuditAlarmA(subsystemname : PSTR, handleid : Void*, clienttoken : LibC::HANDLE, desiredaccess : UInt32, privileges : PRIVILEGE_SET*, accessgranted : LibC::BOOL) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],generateonclose : LibC::BOOL [In]
  fun ObjectCloseAuditAlarmA(subsystemname : PSTR, handleid : Void*, generateonclose : LibC::BOOL) : LibC::BOOL

  # Params # subsystemname : PSTR [In],handleid : Void* [In],generateonclose : LibC::BOOL [In]
  fun ObjectDeleteAuditAlarmA(subsystemname : PSTR, handleid : Void*, generateonclose : LibC::BOOL) : LibC::BOOL

  # Params # subsystemname : PSTR [In],servicename : PSTR [In],clienttoken : LibC::HANDLE [In],privileges : PRIVILEGE_SET* [In],accessgranted : LibC::BOOL [In]
  fun PrivilegedServiceAuditAlarmA(subsystemname : PSTR, servicename : PSTR, clienttoken : LibC::HANDLE, privileges : PRIVILEGE_SET*, accessgranted : LibC::BOOL) : LibC::BOOL

  # Params # pacl : ACL* [In],dwacerevision : UInt32 [In],aceflags : ACE_FLAGS [In],acetype : UInt8 [In],accessmask : UInt32 [In],psid : PSID [In],conditionstr : LibC::LPWSTR [In],returnlength : UInt32* [In]
  fun AddConditionalAce(pacl : ACL*, dwacerevision : UInt32, aceflags : ACE_FLAGS, acetype : UInt8, accessmask : UInt32, psid : PSID, conditionstr : LibC::LPWSTR, returnlength : UInt32*) : LibC::BOOL

  # Params # lpfilename : PSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun SetFileSecurityA(lpfilename : PSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # lpfilename : PSTR [In],requestedinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun GetFileSecurityA(lpfilename : PSTR, requestedinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # lpsystemname : PSTR [In],sid : PSID [In],name : UInt8* [In],cchname : UInt32* [In],referenceddomainname : UInt8* [In],cchreferenceddomainname : UInt32* [In],peuse : SID_NAME_USE* [In]
  fun LookupAccountSidA(lpsystemname : PSTR, sid : PSID, name : UInt8*, cchname : UInt32*, referenceddomainname : UInt8*, cchreferenceddomainname : UInt32*, peuse : SID_NAME_USE*) : LibC::BOOL

  # Params # lpsystemname : LibC::LPWSTR [In],sid : PSID [In],name : Char* [In],cchname : UInt32* [In],referenceddomainname : Char* [In],cchreferenceddomainname : UInt32* [In],peuse : SID_NAME_USE* [In]
  fun LookupAccountSidW(lpsystemname : LibC::LPWSTR, sid : PSID, name : Char*, cchname : UInt32*, referenceddomainname : Char*, cchreferenceddomainname : UInt32*, peuse : SID_NAME_USE*) : LibC::BOOL

  # Params # lpsystemname : PSTR [In],lpaccountname : PSTR [In],sid : PSID [In],cbsid : UInt32* [In],referenceddomainname : UInt8* [In],cchreferenceddomainname : UInt32* [In],peuse : SID_NAME_USE* [In]
  fun LookupAccountNameA(lpsystemname : PSTR, lpaccountname : PSTR, sid : PSID, cbsid : UInt32*, referenceddomainname : UInt8*, cchreferenceddomainname : UInt32*, peuse : SID_NAME_USE*) : LibC::BOOL

  # Params # lpsystemname : LibC::LPWSTR [In],lpaccountname : LibC::LPWSTR [In],sid : PSID [In],cbsid : UInt32* [In],referenceddomainname : Char* [In],cchreferenceddomainname : UInt32* [In],peuse : SID_NAME_USE* [In]
  fun LookupAccountNameW(lpsystemname : LibC::LPWSTR, lpaccountname : LibC::LPWSTR, sid : PSID, cbsid : UInt32*, referenceddomainname : Char*, cchreferenceddomainname : UInt32*, peuse : SID_NAME_USE*) : LibC::BOOL

  # Params # lpsystemname : PSTR [In],lpname : PSTR [In],lpluid : LUID* [In]
  fun LookupPrivilegeValueA(lpsystemname : PSTR, lpname : PSTR, lpluid : LUID*) : LibC::BOOL

  # Params # lpsystemname : LibC::LPWSTR [In],lpname : LibC::LPWSTR [In],lpluid : LUID* [In]
  fun LookupPrivilegeValueW(lpsystemname : LibC::LPWSTR, lpname : LibC::LPWSTR, lpluid : LUID*) : LibC::BOOL

  # Params # lpsystemname : PSTR [In],lpluid : LUID* [In],lpname : UInt8* [In],cchname : UInt32* [In]
  fun LookupPrivilegeNameA(lpsystemname : PSTR, lpluid : LUID*, lpname : UInt8*, cchname : UInt32*) : LibC::BOOL

  # Params # lpsystemname : LibC::LPWSTR [In],lpluid : LUID* [In],lpname : Char* [In],cchname : UInt32* [In]
  fun LookupPrivilegeNameW(lpsystemname : LibC::LPWSTR, lpluid : LUID*, lpname : Char*, cchname : UInt32*) : LibC::BOOL

  # Params # lpsystemname : PSTR [In],lpname : PSTR [In],lpdisplayname : UInt8* [In],cchdisplayname : UInt32* [In],lplanguageid : UInt32* [In]
  fun LookupPrivilegeDisplayNameA(lpsystemname : PSTR, lpname : PSTR, lpdisplayname : UInt8*, cchdisplayname : UInt32*, lplanguageid : UInt32*) : LibC::BOOL

  # Params # lpsystemname : LibC::LPWSTR [In],lpname : LibC::LPWSTR [In],lpdisplayname : Char* [In],cchdisplayname : UInt32* [In],lplanguageid : UInt32* [In]
  fun LookupPrivilegeDisplayNameW(lpsystemname : LibC::LPWSTR, lpname : LibC::LPWSTR, lpdisplayname : Char*, cchdisplayname : UInt32*, lplanguageid : UInt32*) : LibC::BOOL

  # Params # lpszusername : PSTR [In],lpszdomain : PSTR [In],lpszpassword : PSTR [In],dwlogontype : LOGON32_LOGON [In],dwlogonprovider : LOGON32_PROVIDER [In],phtoken : LibC::HANDLE* [In]
  fun LogonUserA(lpszusername : PSTR, lpszdomain : PSTR, lpszpassword : PSTR, dwlogontype : LOGON32_LOGON, dwlogonprovider : LOGON32_PROVIDER, phtoken : LibC::HANDLE*) : LibC::BOOL

  # Params # lpszusername : LibC::LPWSTR [In],lpszdomain : LibC::LPWSTR [In],lpszpassword : LibC::LPWSTR [In],dwlogontype : LOGON32_LOGON [In],dwlogonprovider : LOGON32_PROVIDER [In],phtoken : LibC::HANDLE* [In]
  fun LogonUserW(lpszusername : LibC::LPWSTR, lpszdomain : LibC::LPWSTR, lpszpassword : LibC::LPWSTR, dwlogontype : LOGON32_LOGON, dwlogonprovider : LOGON32_PROVIDER, phtoken : LibC::HANDLE*) : LibC::BOOL

  # Params # lpszusername : PSTR [In],lpszdomain : PSTR [In],lpszpassword : PSTR [In],dwlogontype : LOGON32_LOGON [In],dwlogonprovider : LOGON32_PROVIDER [In],phtoken : LibC::HANDLE* [In],pplogonsid : PSID* [In],ppprofilebuffer : Void** [In],pdwprofilelength : UInt32* [In],pquotalimits : QUOTA_LIMITS* [In]
  fun LogonUserExA(lpszusername : PSTR, lpszdomain : PSTR, lpszpassword : PSTR, dwlogontype : LOGON32_LOGON, dwlogonprovider : LOGON32_PROVIDER, phtoken : LibC::HANDLE*, pplogonsid : PSID*, ppprofilebuffer : Void**, pdwprofilelength : UInt32*, pquotalimits : QUOTA_LIMITS*) : LibC::BOOL

  # Params # lpszusername : LibC::LPWSTR [In],lpszdomain : LibC::LPWSTR [In],lpszpassword : LibC::LPWSTR [In],dwlogontype : LOGON32_LOGON [In],dwlogonprovider : LOGON32_PROVIDER [In],phtoken : LibC::HANDLE* [In],pplogonsid : PSID* [In],ppprofilebuffer : Void** [In],pdwprofilelength : UInt32* [In],pquotalimits : QUOTA_LIMITS* [In]
  fun LogonUserExW(lpszusername : LibC::LPWSTR, lpszdomain : LibC::LPWSTR, lpszpassword : LibC::LPWSTR, dwlogontype : LOGON32_LOGON, dwlogonprovider : LOGON32_PROVIDER, phtoken : LibC::HANDLE*, pplogonsid : PSID*, ppprofilebuffer : Void**, pdwprofilelength : UInt32*, pquotalimits : QUOTA_LIMITS*) : LibC::BOOL

  # Params # unicodestring : UNICODE_STRING* [In],sid : PSID [In],allocatedestinationstring : BOOLEAN [In]
  fun RtlConvertSidToUnicodeString(unicodestring : UNICODE_STRING*, sid : PSID, allocatedestinationstring : BOOLEAN) : NTSTATUS
end
