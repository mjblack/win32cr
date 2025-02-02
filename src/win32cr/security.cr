require "./foundation.cr"

module Win32cr::Security
  extend self
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
  alias PSECURITY_DESCRIPTOR = Void*
  alias PLSA_AP_CALL_PACKAGE_UNTRUSTED = Proc(Void**, Void*, Void*, UInt32, Void**, UInt32*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias SEC_THREAD_START = Proc(Void*, UInt32)

  Wszcertenrollsharepath = "CertSrv\\CertEnroll"
  Cwchresultstring = 40_u32
  Szlbrace = "{"
  Szrbrace = "}"
  Wszlbrace = "{"
  Wszrbrace = "}"
  Szlparen = "("
  Szrparen = ")"
  Wszlparen = "("
  Wszrparen = ")"
  CVT_SECONDS = 1_u32
  Cwcfilenamesuffixmax = 20_u32
  Wszfcsaparm_serverdnsname = "%1"
  Wszfcsaparm_servershortname = "%2"
  Wszfcsaparm_sanitizedcaname = "%3"
  Wszfcsaparm_certfilenamesuffix = "%4"
  Wszfcsaparm_domaindn = "%5"
  Wszfcsaparm_configdn = "%6"
  Wszfcsaparm_sanitizedcanamehash = "%7"
  Wszfcsaparm_crlfilenamesuffix = "%8"
  Wszfcsaparm_crldeltafilenamesuffix = "%9"
  Wszfcsaparm_dscrlattribute = "%10"
  Wszfcsaparm_dscacertattribute = "%11"
  Wszfcsaparm_dsusercertattribute = "%12"
  Wszfcsaparm_dskracertattribute = "%13"
  Wszfcsaparm_dscrosscertpairattribute = "%14"

  @[Flags]
  enum TOKEN_PRIVILEGES_ATTRIBUTES : UInt32
    SE_PRIVILEGE_ENABLED = 2_u32
    SE_PRIVILEGE_ENABLED_BY_DEFAULT = 1_u32
    SE_PRIVILEGE_REMOVED = 4_u32
    SE_PRIVILEGE_USED_FOR_ACCESS = 2147483648_u32
  end
  enum LOGON32_PROVIDER : UInt32
    LOGON32_PROVIDER_DEFAULT = 0_u32
    LOGON32_PROVIDER_WINNT50 = 3_u32
    LOGON32_PROVIDER_WINNT40 = 2_u32
  end
  @[Flags]
  enum CREATE_RESTRICTED_TOKEN_FLAGS : UInt32
    DISABLE_MAX_PRIVILEGE = 1_u32
    SANDBOX_INERT = 2_u32
    LUA_TOKEN = 4_u32
    WRITE_RESTRICTED = 8_u32
  end
  enum LOGON32_LOGON : UInt32
    LOGON32_LOGON_BATCH = 4_u32
    LOGON32_LOGON_INTERACTIVE = 2_u32
    LOGON32_LOGON_NETWORK = 3_u32
    LOGON32_LOGON_NETWORK_CLEARTEXT = 8_u32
    LOGON32_LOGON_NEW_CREDENTIALS = 9_u32
    LOGON32_LOGON_SERVICE = 5_u32
    LOGON32_LOGON_UNLOCK = 7_u32
  end
  @[Flags]
  enum ACE_FLAGS : UInt32
    CONTAINER_INHERIT_ACE = 2_u32
    FAILED_ACCESS_ACE_FLAG = 128_u32
    INHERIT_ONLY_ACE = 8_u32
    INHERITED_ACE = 16_u32
    NO_PROPAGATE_INHERIT_ACE = 4_u32
    OBJECT_INHERIT_ACE = 1_u32
    SUCCESSFUL_ACCESS_ACE_FLAG = 64_u32
    SUB_CONTAINERS_AND_OBJECTS_INHERIT = 3_u32
    SUB_CONTAINERS_ONLY_INHERIT = 2_u32
    SUB_OBJECTS_ONLY_INHERIT = 1_u32
    INHERIT_NO_PROPAGATE = 4_u32
    INHERIT_ONLY = 8_u32
    NO_INHERITANCE = 0_u32
  end
  @[Flags]
  enum OBJECT_SECURITY_INFORMATION : UInt32
    ATTRIBUTE_SECURITY_INFORMATION = 32_u32
    BACKUP_SECURITY_INFORMATION = 65536_u32
    DACL_SECURITY_INFORMATION = 4_u32
    GROUP_SECURITY_INFORMATION = 2_u32
    LABEL_SECURITY_INFORMATION = 16_u32
    OWNER_SECURITY_INFORMATION = 1_u32
    PROTECTED_DACL_SECURITY_INFORMATION = 2147483648_u32
    PROTECTED_SACL_SECURITY_INFORMATION = 1073741824_u32
    SACL_SECURITY_INFORMATION = 8_u32
    SCOPE_SECURITY_INFORMATION = 64_u32
    UNPROTECTED_DACL_SECURITY_INFORMATION = 536870912_u32
    UNPROTECTED_SACL_SECURITY_INFORMATION = 268435456_u32
  end
  @[Flags]
  enum SECURITY_AUTO_INHERIT_FLAGS : UInt32
    SEF_AVOID_OWNER_CHECK = 16_u32
    SEF_AVOID_OWNER_RESTRICTION = 4096_u32
    SEF_AVOID_PRIVILEGE_CHECK = 8_u32
    SEF_DACL_AUTO_INHERIT = 1_u32
    SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT = 4_u32
    SEF_DEFAULT_GROUP_FROM_PARENT = 64_u32
    SEF_DEFAULT_OWNER_FROM_PARENT = 32_u32
    SEF_MACL_NO_EXECUTE_UP = 1024_u32
    SEF_MACL_NO_READ_UP = 512_u32
    SEF_MACL_NO_WRITE_UP = 256_u32
    SEF_SACL_AUTO_INHERIT = 2_u32
  end
  enum ACE_REVISION : UInt32
    ACL_REVISION = 2_u32
    ACL_REVISION_DS = 4_u32
  end
  enum TOKEN_MANDATORY_POLICY_ID : UInt32
    TOKEN_MANDATORY_POLICY_OFF = 0_u32
    TOKEN_MANDATORY_POLICY_NO_WRITE_UP = 1_u32
    TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN = 2_u32
    TOKEN_MANDATORY_POLICY_VALID_MASK = 3_u32
  end
  @[Flags]
  enum SYSTEM_AUDIT_OBJECT_ACE_FLAGS : UInt32
    ACE_OBJECT_TYPE_PRESENT = 1_u32
    ACE_INHERITED_OBJECT_TYPE_PRESENT = 2_u32
  end
  @[Flags]
  enum CLAIM_SECURITY_ATTRIBUTE_FLAGS : UInt32
    CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE = 1_u32
    CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 2_u32
    CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY = 4_u32
    CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT = 8_u32
    CLAIM_SECURITY_ATTRIBUTE_DISABLED = 16_u32
    CLAIM_SECURITY_ATTRIBUTE_MANDATORY = 32_u32
  end
  enum CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE : UInt16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64 = 1_u16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64 = 2_u16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING = 3_u16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING = 16_u16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN = 4_u16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_SID = 5_u16
    CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN = 6_u16
  end
  @[Flags]
  enum TOKEN_ACCESS_MASK : UInt32
    TOKEN_DELETE = 65536_u32
    TOKEN_READ_CONTROL = 131072_u32
    TOKEN_WRITE_DAC = 262144_u32
    TOKEN_WRITE_OWNER = 524288_u32
    TOKEN_ACCESS_SYSTEM_SECURITY = 16777216_u32
    TOKEN_ASSIGN_PRIMARY = 1_u32
    TOKEN_DUPLICATE = 2_u32
    TOKEN_IMPERSONATE = 4_u32
    TOKEN_QUERY = 8_u32
    TOKEN_QUERY_SOURCE = 16_u32
    TOKEN_ADJUST_PRIVILEGES = 32_u32
    TOKEN_ADJUST_GROUPS = 64_u32
    TOKEN_ADJUST_DEFAULT = 128_u32
    TOKEN_ADJUST_SESSIONID = 256_u32
    TOKEN_READ = 131080_u32
    TOKEN_WRITE = 131296_u32
    TOKEN_EXECUTE = 131072_u32
    TOKEN_TRUST_CONSTRAINT_MASK = 131096_u32
    TOKEN_ACCESS_PSEUDO_HANDLE_WIN8 = 24_u32
    TOKEN_ACCESS_PSEUDO_HANDLE = 24_u32
    TOKEN_ALL_ACCESS = 983295_u32
  end
  enum ENUM_PERIOD
    ENUM_PERIOD_INVALID = -1_i32
    ENUM_PERIOD_SECONDS = 0_i32
    ENUM_PERIOD_MINUTES = 1_i32
    ENUM_PERIOD_HOURS = 2_i32
    ENUM_PERIOD_DAYS = 3_i32
    ENUM_PERIOD_WEEKS = 4_i32
    ENUM_PERIOD_MONTHS = 5_i32
    ENUM_PERIOD_YEARS = 6_i32
  end
  enum SID_NAME_USE
    SidTypeUser = 1_i32
    SidTypeGroup = 2_i32
    SidTypeDomain = 3_i32
    SidTypeAlias = 4_i32
    SidTypeWellKnownGroup = 5_i32
    SidTypeDeletedAccount = 6_i32
    SidTypeInvalid = 7_i32
    SidTypeUnknown = 8_i32
    SidTypeComputer = 9_i32
    SidTypeLabel = 10_i32
    SidTypeLogonSession = 11_i32
  end
  enum WELL_KNOWN_SID_TYPE
    WinNullSid = 0_i32
    WinWorldSid = 1_i32
    WinLocalSid = 2_i32
    WinCreatorOwnerSid = 3_i32
    WinCreatorGroupSid = 4_i32
    WinCreatorOwnerServerSid = 5_i32
    WinCreatorGroupServerSid = 6_i32
    WinNtAuthoritySid = 7_i32
    WinDialupSid = 8_i32
    WinNetworkSid = 9_i32
    WinBatchSid = 10_i32
    WinInteractiveSid = 11_i32
    WinServiceSid = 12_i32
    WinAnonymousSid = 13_i32
    WinProxySid = 14_i32
    WinEnterpriseControllersSid = 15_i32
    WinSelfSid = 16_i32
    WinAuthenticatedUserSid = 17_i32
    WinRestrictedCodeSid = 18_i32
    WinTerminalServerSid = 19_i32
    WinRemoteLogonIdSid = 20_i32
    WinLogonIdsSid = 21_i32
    WinLocalSystemSid = 22_i32
    WinLocalServiceSid = 23_i32
    WinNetworkServiceSid = 24_i32
    WinBuiltinDomainSid = 25_i32
    WinBuiltinAdministratorsSid = 26_i32
    WinBuiltinUsersSid = 27_i32
    WinBuiltinGuestsSid = 28_i32
    WinBuiltinPowerUsersSid = 29_i32
    WinBuiltinAccountOperatorsSid = 30_i32
    WinBuiltinSystemOperatorsSid = 31_i32
    WinBuiltinPrintOperatorsSid = 32_i32
    WinBuiltinBackupOperatorsSid = 33_i32
    WinBuiltinReplicatorSid = 34_i32
    WinBuiltinPreWindows2000CompatibleAccessSid = 35_i32
    WinBuiltinRemoteDesktopUsersSid = 36_i32
    WinBuiltinNetworkConfigurationOperatorsSid = 37_i32
    WinAccountAdministratorSid = 38_i32
    WinAccountGuestSid = 39_i32
    WinAccountKrbtgtSid = 40_i32
    WinAccountDomainAdminsSid = 41_i32
    WinAccountDomainUsersSid = 42_i32
    WinAccountDomainGuestsSid = 43_i32
    WinAccountComputersSid = 44_i32
    WinAccountControllersSid = 45_i32
    WinAccountCertAdminsSid = 46_i32
    WinAccountSchemaAdminsSid = 47_i32
    WinAccountEnterpriseAdminsSid = 48_i32
    WinAccountPolicyAdminsSid = 49_i32
    WinAccountRasAndIasServersSid = 50_i32
    WinNTLMAuthenticationSid = 51_i32
    WinDigestAuthenticationSid = 52_i32
    WinSChannelAuthenticationSid = 53_i32
    WinThisOrganizationSid = 54_i32
    WinOtherOrganizationSid = 55_i32
    WinBuiltinIncomingForestTrustBuildersSid = 56_i32
    WinBuiltinPerfMonitoringUsersSid = 57_i32
    WinBuiltinPerfLoggingUsersSid = 58_i32
    WinBuiltinAuthorizationAccessSid = 59_i32
    WinBuiltinTerminalServerLicenseServersSid = 60_i32
    WinBuiltinDCOMUsersSid = 61_i32
    WinBuiltinIUsersSid = 62_i32
    WinIUserSid = 63_i32
    WinBuiltinCryptoOperatorsSid = 64_i32
    WinUntrustedLabelSid = 65_i32
    WinLowLabelSid = 66_i32
    WinMediumLabelSid = 67_i32
    WinHighLabelSid = 68_i32
    WinSystemLabelSid = 69_i32
    WinWriteRestrictedCodeSid = 70_i32
    WinCreatorOwnerRightsSid = 71_i32
    WinCacheablePrincipalsGroupSid = 72_i32
    WinNonCacheablePrincipalsGroupSid = 73_i32
    WinEnterpriseReadonlyControllersSid = 74_i32
    WinAccountReadonlyControllersSid = 75_i32
    WinBuiltinEventLogReadersGroup = 76_i32
    WinNewEnterpriseReadonlyControllersSid = 77_i32
    WinBuiltinCertSvcDComAccessGroup = 78_i32
    WinMediumPlusLabelSid = 79_i32
    WinLocalLogonSid = 80_i32
    WinConsoleLogonSid = 81_i32
    WinThisOrganizationCertificateSid = 82_i32
    WinApplicationPackageAuthoritySid = 83_i32
    WinBuiltinAnyPackageSid = 84_i32
    WinCapabilityInternetClientSid = 85_i32
    WinCapabilityInternetClientServerSid = 86_i32
    WinCapabilityPrivateNetworkClientServerSid = 87_i32
    WinCapabilityPicturesLibrarySid = 88_i32
    WinCapabilityVideosLibrarySid = 89_i32
    WinCapabilityMusicLibrarySid = 90_i32
    WinCapabilityDocumentsLibrarySid = 91_i32
    WinCapabilitySharedUserCertificatesSid = 92_i32
    WinCapabilityEnterpriseAuthenticationSid = 93_i32
    WinCapabilityRemovableStorageSid = 94_i32
    WinBuiltinRDSRemoteAccessServersSid = 95_i32
    WinBuiltinRDSEndpointServersSid = 96_i32
    WinBuiltinRDSManagementServersSid = 97_i32
    WinUserModeDriversSid = 98_i32
    WinBuiltinHyperVAdminsSid = 99_i32
    WinAccountCloneableControllersSid = 100_i32
    WinBuiltinAccessControlAssistanceOperatorsSid = 101_i32
    WinBuiltinRemoteManagementUsersSid = 102_i32
    WinAuthenticationAuthorityAssertedSid = 103_i32
    WinAuthenticationServiceAssertedSid = 104_i32
    WinLocalAccountSid = 105_i32
    WinLocalAccountAndAdministratorSid = 106_i32
    WinAccountProtectedUsersSid = 107_i32
    WinCapabilityAppointmentsSid = 108_i32
    WinCapabilityContactsSid = 109_i32
    WinAccountDefaultSystemManagedSid = 110_i32
    WinBuiltinDefaultSystemManagedGroupSid = 111_i32
    WinBuiltinStorageReplicaAdminsSid = 112_i32
    WinAccountKeyAdminsSid = 113_i32
    WinAccountEnterpriseKeyAdminsSid = 114_i32
    WinAuthenticationKeyTrustSid = 115_i32
    WinAuthenticationKeyPropertyMFASid = 116_i32
    WinAuthenticationKeyPropertyAttestationSid = 117_i32
    WinAuthenticationFreshKeyAuthSid = 118_i32
    WinBuiltinDeviceOwnersSid = 119_i32
  end
  enum ACL_INFORMATION_CLASS
    AclRevisionInformation = 1_i32
    AclSizeInformation = 2_i32
  end
  enum AUDIT_EVENT_TYPE
    AuditEventObjectAccess = 0_i32
    AuditEventDirectoryServiceAccess = 1_i32
  end
  enum SECURITY_IMPERSONATION_LEVEL
    SecurityAnonymous = 0_i32
    SecurityIdentification = 1_i32
    SecurityImpersonation = 2_i32
    SecurityDelegation = 3_i32
  end
  enum TOKEN_TYPE
    TokenPrimary = 1_i32
    TokenImpersonation = 2_i32
  end
  enum TOKEN_ELEVATION_TYPE
    TokenElevationTypeDefault = 1_i32
    TokenElevationTypeFull = 2_i32
    TokenElevationTypeLimited = 3_i32
  end
  enum TOKEN_INFORMATION_CLASS
    TokenUser = 1_i32
    TokenGroups = 2_i32
    TokenPrivileges = 3_i32
    TokenOwner = 4_i32
    TokenPrimaryGroup = 5_i32
    TokenDefaultDacl = 6_i32
    TokenSource = 7_i32
    TokenType = 8_i32
    TokenImpersonationLevel = 9_i32
    TokenStatistics = 10_i32
    TokenRestrictedSids = 11_i32
    TokenSessionId = 12_i32
    TokenGroupsAndPrivileges = 13_i32
    TokenSessionReference = 14_i32
    TokenSandBoxInert = 15_i32
    TokenAuditPolicy = 16_i32
    TokenOrigin = 17_i32
    TokenElevationType = 18_i32
    TokenLinkedToken = 19_i32
    TokenElevation = 20_i32
    TokenHasRestrictions = 21_i32
    TokenAccessInformation = 22_i32
    TokenVirtualizationAllowed = 23_i32
    TokenVirtualizationEnabled = 24_i32
    TokenIntegrityLevel = 25_i32
    TokenUIAccess = 26_i32
    TokenMandatoryPolicy = 27_i32
    TokenLogonSid = 28_i32
    TokenIsAppContainer = 29_i32
    TokenCapabilities = 30_i32
    TokenAppContainerSid = 31_i32
    TokenAppContainerNumber = 32_i32
    TokenUserClaimAttributes = 33_i32
    TokenDeviceClaimAttributes = 34_i32
    TokenRestrictedUserClaimAttributes = 35_i32
    TokenRestrictedDeviceClaimAttributes = 36_i32
    TokenDeviceGroups = 37_i32
    TokenRestrictedDeviceGroups = 38_i32
    TokenSecurityAttributes = 39_i32
    TokenIsRestricted = 40_i32
    TokenProcessTrustLevel = 41_i32
    TokenPrivateNameSpace = 42_i32
    TokenSingletonAttributes = 43_i32
    TokenBnoIsolation = 44_i32
    TokenChildProcessFlags = 45_i32
    TokenIsLessPrivilegedAppContainer = 46_i32
    TokenIsSandboxed = 47_i32
    MaxTokenInfoClass = 48_i32
  end
  enum MANDATORY_LEVEL
    MandatoryLevelUntrusted = 0_i32
    MandatoryLevelLow = 1_i32
    MandatoryLevelMedium = 2_i32
    MandatoryLevelHigh = 3_i32
    MandatoryLevelSystem = 4_i32
    MandatoryLevelSecureProcess = 5_i32
    MandatoryLevelCount = 6_i32
  end

  @[Extern]
  struct SECURITY_ATTRIBUTES
    property nLength : UInt32
    property lpSecurityDescriptor : Void*
    property bInheritHandle : Win32cr::Foundation::BOOL
    def initialize(@nLength : UInt32, @lpSecurityDescriptor : Void*, @bInheritHandle : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct LLFILETIME
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property ll : Int64
    property ft : Win32cr::Foundation::FILETIME
    def initialize(@ll : Int64, @ft : Win32cr::Foundation::FILETIME)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct GENERIC_MAPPING
    property generic_read : UInt32
    property generic_write : UInt32
    property generic_execute : UInt32
    property generic_all : UInt32
    def initialize(@generic_read : UInt32, @generic_write : UInt32, @generic_execute : UInt32, @generic_all : UInt32)
    end
  end

  @[Extern]
  struct LUID_AND_ATTRIBUTES
    property luid : Win32cr::Foundation::LUID
    property attributes : Win32cr::Security::TOKEN_PRIVILEGES_ATTRIBUTES
    def initialize(@luid : Win32cr::Foundation::LUID, @attributes : Win32cr::Security::TOKEN_PRIVILEGES_ATTRIBUTES)
    end
  end

  @[Extern]
  struct SID_IDENTIFIER_AUTHORITY
    property value : UInt8[6]
    def initialize(@value : UInt8[6])
    end
  end

  @[Extern]
  struct SID
    property revision : UInt8
    property sub_authority_count : UInt8
    property identifier_authority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY
    property sub_authority : UInt32*
    def initialize(@revision : UInt8, @sub_authority_count : UInt8, @identifier_authority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY, @sub_authority : UInt32*)
    end
  end

  @[Extern(union: true)]
  struct SE_SID
    property sid : Win32cr::Security::SID
    property buffer : UInt8[68]
    def initialize(@sid : Win32cr::Security::SID, @buffer : UInt8[68])
    end
  end

  @[Extern]
  struct SID_AND_ATTRIBUTES
    property sid : Win32cr::Foundation::PSID
    property attributes : UInt32
    def initialize(@sid : Win32cr::Foundation::PSID, @attributes : UInt32)
    end
  end

  @[Extern]
  struct SID_AND_ATTRIBUTES_HASH
    property sid_count : UInt32
    property sid_attr : Win32cr::Security::SID_AND_ATTRIBUTES*
    property hash : LibC::UIntPtrT[32]
    def initialize(@sid_count : UInt32, @sid_attr : Win32cr::Security::SID_AND_ATTRIBUTES*, @hash : LibC::UIntPtrT[32])
    end
  end

  @[Extern]
  struct ACL
    property acl_revision : UInt8
    property sbz1 : UInt8
    property acl_size : UInt16
    property ace_count : UInt16
    property sbz2 : UInt16
    def initialize(@acl_revision : UInt8, @sbz1 : UInt8, @acl_size : UInt16, @ace_count : UInt16, @sbz2 : UInt16)
    end
  end

  @[Extern]
  struct ACE_HEADER
    property ace_type : UInt8
    property ace_flags : UInt8
    property ace_size : UInt16
    def initialize(@ace_type : UInt8, @ace_flags : UInt8, @ace_size : UInt16)
    end
  end

  @[Extern]
  struct ACCESS_ALLOWED_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACCESS_DENIED_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_AUDIT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_ALARM_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_RESOURCE_ATTRIBUTE_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_SCOPED_POLICY_ID_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_MANDATORY_LABEL_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_PROCESS_TRUST_LABEL_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_ACCESS_FILTER_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACCESS_ALLOWED_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACCESS_DENIED_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_AUDIT_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_ALARM_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : UInt32
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : UInt32, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACCESS_ALLOWED_CALLBACK_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACCESS_DENIED_CALLBACK_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_AUDIT_CALLBACK_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_ALARM_CALLBACK_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACCESS_ALLOWED_CALLBACK_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACCESS_DENIED_CALLBACK_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_AUDIT_CALLBACK_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_ALARM_CALLBACK_OBJECT_ACE
    property header : Win32cr::Security::ACE_HEADER
    property mask : UInt32
    property flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS
    property object_type : LibC::GUID
    property inherited_object_type : LibC::GUID
    property sid_start : UInt32
    def initialize(@header : Win32cr::Security::ACE_HEADER, @mask : UInt32, @flags : Win32cr::Security::SYSTEM_AUDIT_OBJECT_ACE_FLAGS, @object_type : LibC::GUID, @inherited_object_type : LibC::GUID, @sid_start : UInt32)
    end
  end

  @[Extern]
  struct ACL_REVISION_INFORMATION
    property acl_revision : UInt32
    def initialize(@acl_revision : UInt32)
    end
  end

  @[Extern]
  struct ACL_SIZE_INFORMATION
    property ace_count : UInt32
    property acl_bytes_in_use : UInt32
    property acl_bytes_free : UInt32
    def initialize(@ace_count : UInt32, @acl_bytes_in_use : UInt32, @acl_bytes_free : UInt32)
    end
  end

  @[Extern]
  struct SECURITY_DESCRIPTOR
    property revision : UInt8
    property sbz1 : UInt8
    property control : UInt16
    property owner : Win32cr::Foundation::PSID
    property group : Win32cr::Foundation::PSID
    property sacl : Win32cr::Security::ACL*
    property dacl : Win32cr::Security::ACL*
    def initialize(@revision : UInt8, @sbz1 : UInt8, @control : UInt16, @owner : Win32cr::Foundation::PSID, @group : Win32cr::Foundation::PSID, @sacl : Win32cr::Security::ACL*, @dacl : Win32cr::Security::ACL*)
    end
  end

  @[Extern]
  struct OBJECT_TYPE_LIST
    property level : UInt16
    property sbz : UInt16
    property object_type : LibC::GUID*
    def initialize(@level : UInt16, @sbz : UInt16, @object_type : LibC::GUID*)
    end
  end

  @[Extern]
  struct PRIVILEGE_SET
    property privilege_count : UInt32
    property control : UInt32
    property privilege : Win32cr::Security::LUID_AND_ATTRIBUTES*
    def initialize(@privilege_count : UInt32, @control : UInt32, @privilege : Win32cr::Security::LUID_AND_ATTRIBUTES*)
    end
  end

  @[Extern]
  struct ACCESS_REASONS
    property data : UInt32[32]
    def initialize(@data : UInt32[32])
    end
  end

  @[Extern]
  struct SE_SECURITY_DESCRIPTOR
    property size : UInt32
    property flags : UInt32
    property security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR
    def initialize(@size : UInt32, @flags : UInt32, @security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR)
    end
  end

  @[Extern]
  struct SE_ACCESS_REQUEST
    property size : UInt32
    property se_security_descriptor : Win32cr::Security::SE_SECURITY_DESCRIPTOR*
    property desired_access : UInt32
    property previously_granted_access : UInt32
    property principal_self_sid : Win32cr::Foundation::PSID
    property generic_mapping : Win32cr::Security::GENERIC_MAPPING*
    property object_type_list_count : UInt32
    property object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*
    def initialize(@size : UInt32, @se_security_descriptor : Win32cr::Security::SE_SECURITY_DESCRIPTOR*, @desired_access : UInt32, @previously_granted_access : UInt32, @principal_self_sid : Win32cr::Foundation::PSID, @generic_mapping : Win32cr::Security::GENERIC_MAPPING*, @object_type_list_count : UInt32, @object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*)
    end
  end

  @[Extern]
  struct SE_ACCESS_REPLY
    property size : UInt32
    property result_list_count : UInt32
    property granted_access : UInt32*
    property access_status : UInt32*
    property access_reason : Win32cr::Security::ACCESS_REASONS*
    property privileges : Win32cr::Security::PRIVILEGE_SET**
    def initialize(@size : UInt32, @result_list_count : UInt32, @granted_access : UInt32*, @access_status : UInt32*, @access_reason : Win32cr::Security::ACCESS_REASONS*, @privileges : Win32cr::Security::PRIVILEGE_SET**)
    end
  end

  @[Extern]
  struct TOKEN_USER
    property user : Win32cr::Security::SID_AND_ATTRIBUTES
    def initialize(@user : Win32cr::Security::SID_AND_ATTRIBUTES)
    end
  end

  @[Extern]
  struct TOKEN_GROUPS
    property group_count : UInt32
    property groups : Win32cr::Security::SID_AND_ATTRIBUTES*
    def initialize(@group_count : UInt32, @groups : Win32cr::Security::SID_AND_ATTRIBUTES*)
    end
  end

  @[Extern]
  struct TOKEN_PRIVILEGES
    property privilege_count : UInt32
    property privileges : Win32cr::Security::LUID_AND_ATTRIBUTES*
    def initialize(@privilege_count : UInt32, @privileges : Win32cr::Security::LUID_AND_ATTRIBUTES*)
    end
  end

  @[Extern]
  struct TOKEN_OWNER
    property owner : Win32cr::Foundation::PSID
    def initialize(@owner : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct TOKEN_PRIMARY_GROUP
    property primary_group : Win32cr::Foundation::PSID
    def initialize(@primary_group : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct TOKEN_DEFAULT_DACL
    property default_dacl : Win32cr::Security::ACL*
    def initialize(@default_dacl : Win32cr::Security::ACL*)
    end
  end

  @[Extern]
  struct TOKEN_USER_CLAIMS
    property user_claims : Void*
    def initialize(@user_claims : Void*)
    end
  end

  @[Extern]
  struct TOKEN_DEVICE_CLAIMS
    property device_claims : Void*
    def initialize(@device_claims : Void*)
    end
  end

  @[Extern]
  struct TOKEN_GROUPS_AND_PRIVILEGES
    property sid_count : UInt32
    property sid_length : UInt32
    property sids : Win32cr::Security::SID_AND_ATTRIBUTES*
    property restricted_sid_count : UInt32
    property restricted_sid_length : UInt32
    property restricted_sids : Win32cr::Security::SID_AND_ATTRIBUTES*
    property privilege_count : UInt32
    property privilege_length : UInt32
    property privileges : Win32cr::Security::LUID_AND_ATTRIBUTES*
    property authentication_id : Win32cr::Foundation::LUID
    def initialize(@sid_count : UInt32, @sid_length : UInt32, @sids : Win32cr::Security::SID_AND_ATTRIBUTES*, @restricted_sid_count : UInt32, @restricted_sid_length : UInt32, @restricted_sids : Win32cr::Security::SID_AND_ATTRIBUTES*, @privilege_count : UInt32, @privilege_length : UInt32, @privileges : Win32cr::Security::LUID_AND_ATTRIBUTES*, @authentication_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct TOKEN_LINKED_TOKEN
    property linked_token : Win32cr::Foundation::HANDLE
    def initialize(@linked_token : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct TOKEN_ELEVATION
    property token_is_elevated : UInt32
    def initialize(@token_is_elevated : UInt32)
    end
  end

  @[Extern]
  struct TOKEN_MANDATORY_LABEL
    property label : Win32cr::Security::SID_AND_ATTRIBUTES
    def initialize(@label : Win32cr::Security::SID_AND_ATTRIBUTES)
    end
  end

  @[Extern]
  struct TOKEN_MANDATORY_POLICY
    property policy : Win32cr::Security::TOKEN_MANDATORY_POLICY_ID
    def initialize(@policy : Win32cr::Security::TOKEN_MANDATORY_POLICY_ID)
    end
  end

  @[Extern]
  struct TOKEN_ACCESS_INFORMATION
    property sid_hash : Win32cr::Security::SID_AND_ATTRIBUTES_HASH*
    property restricted_sid_hash : Win32cr::Security::SID_AND_ATTRIBUTES_HASH*
    property privileges : Win32cr::Security::TOKEN_PRIVILEGES*
    property authentication_id : Win32cr::Foundation::LUID
    property token_type : Win32cr::Security::TOKEN_TYPE
    property impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL
    property mandatory_policy : Win32cr::Security::TOKEN_MANDATORY_POLICY
    property flags : UInt32
    property app_container_number : UInt32
    property package_sid : Win32cr::Foundation::PSID
    property capabilities_hash : Win32cr::Security::SID_AND_ATTRIBUTES_HASH*
    property trust_level_sid : Win32cr::Foundation::PSID
    property security_attributes : Void*
    def initialize(@sid_hash : Win32cr::Security::SID_AND_ATTRIBUTES_HASH*, @restricted_sid_hash : Win32cr::Security::SID_AND_ATTRIBUTES_HASH*, @privileges : Win32cr::Security::TOKEN_PRIVILEGES*, @authentication_id : Win32cr::Foundation::LUID, @token_type : Win32cr::Security::TOKEN_TYPE, @impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, @mandatory_policy : Win32cr::Security::TOKEN_MANDATORY_POLICY, @flags : UInt32, @app_container_number : UInt32, @package_sid : Win32cr::Foundation::PSID, @capabilities_hash : Win32cr::Security::SID_AND_ATTRIBUTES_HASH*, @trust_level_sid : Win32cr::Foundation::PSID, @security_attributes : Void*)
    end
  end

  @[Extern]
  struct TOKEN_AUDIT_POLICY
    property per_user_policy : UInt8[30]
    def initialize(@per_user_policy : UInt8[30])
    end
  end

  @[Extern]
  struct TOKEN_SOURCE
    property source_name : Win32cr::Foundation::CHAR[8]
    property source_identifier : Win32cr::Foundation::LUID
    def initialize(@source_name : Win32cr::Foundation::CHAR[8], @source_identifier : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct TOKEN_STATISTICS
    property token_id : Win32cr::Foundation::LUID
    property authentication_id : Win32cr::Foundation::LUID
    property expiration_time : Win32cr::Foundation::LARGE_INTEGER
    property token_type : Win32cr::Security::TOKEN_TYPE
    property impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL
    property dynamic_charged : UInt32
    property dynamic_available : UInt32
    property group_count : UInt32
    property privilege_count : UInt32
    property modified_id : Win32cr::Foundation::LUID
    def initialize(@token_id : Win32cr::Foundation::LUID, @authentication_id : Win32cr::Foundation::LUID, @expiration_time : Win32cr::Foundation::LARGE_INTEGER, @token_type : Win32cr::Security::TOKEN_TYPE, @impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, @dynamic_charged : UInt32, @dynamic_available : UInt32, @group_count : UInt32, @privilege_count : UInt32, @modified_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct TOKEN_CONTROL
    property token_id : Win32cr::Foundation::LUID
    property authentication_id : Win32cr::Foundation::LUID
    property modified_id : Win32cr::Foundation::LUID
    property token_source : Win32cr::Security::TOKEN_SOURCE
    def initialize(@token_id : Win32cr::Foundation::LUID, @authentication_id : Win32cr::Foundation::LUID, @modified_id : Win32cr::Foundation::LUID, @token_source : Win32cr::Security::TOKEN_SOURCE)
    end
  end

  @[Extern]
  struct TOKEN_ORIGIN
    property originating_logon_session : Win32cr::Foundation::LUID
    def initialize(@originating_logon_session : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct TOKEN_APPCONTAINER_INFORMATION
    property token_app_container : Win32cr::Foundation::PSID
    def initialize(@token_app_container : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE
    property version : UInt64
    property name : Win32cr::Foundation::PWSTR
    def initialize(@version : UInt64, @name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
    property pValue : Void*
    property value_length : UInt32
    def initialize(@pValue : Void*, @value_length : UInt32)
    end
  end

  @[Extern]
  struct CLAIM_SECURITY_ATTRIBUTE_V1
    property name : Win32cr::Foundation::PWSTR
    property value_type : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE
    property reserved : UInt16
    property flags : UInt32
    property value_count : UInt32
    property values : Values_e__Union_

    # Nested Type Values_e__Union_
    @[Extern(union: true)]
    struct Values_e__Union_
    property pInt64 : Int64*
    property pUint64 : UInt64*
    property ppString : Win32cr::Foundation::PWSTR*
    property pFqbn : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE*
    property pOctetString : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE*
    def initialize(@pInt64 : Int64*, @pUint64 : UInt64*, @ppString : Win32cr::Foundation::PWSTR*, @pFqbn : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE*, @pOctetString : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE*)
    end
    end

    def initialize(@name : Win32cr::Foundation::PWSTR, @value_type : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE, @reserved : UInt16, @flags : UInt32, @value_count : UInt32, @values : Values_e__Union_)
    end
  end

  @[Extern]
  struct CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1
    property name : UInt32
    property value_type : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE
    property reserved : UInt16
    property flags : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_FLAGS
    property value_count : UInt32
    property values : Values_e__Union_

    # Nested Type Values_e__Union_
    @[Extern(union: true)]
    struct Values_e__Union_
    property pInt64 : UInt32*
    property pUint64 : UInt32*
    property ppString : UInt32*
    property pFqbn : UInt32*
    property pOctetString : UInt32*
    def initialize(@pInt64 : UInt32*, @pUint64 : UInt32*, @ppString : UInt32*, @pFqbn : UInt32*, @pOctetString : UInt32*)
    end
    end

    def initialize(@name : UInt32, @value_type : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE, @reserved : UInt16, @flags : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_FLAGS, @value_count : UInt32, @values : Values_e__Union_)
    end
  end

  @[Extern]
  struct CLAIM_SECURITY_ATTRIBUTES_INFORMATION
    property version : UInt16
    property reserved : UInt16
    property attribute_count : UInt32
    property attribute : Attribute_e__Union_

    # Nested Type Attribute_e__Union_
    @[Extern(union: true)]
    struct Attribute_e__Union_
    property pAttributeV1 : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_V1*
    def initialize(@pAttributeV1 : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTE_V1*)
    end
    end

    def initialize(@version : UInt16, @reserved : UInt16, @attribute_count : UInt32, @attribute : Attribute_e__Union_)
    end
  end

  @[Extern]
  struct SECURITY_QUALITY_OF_SERVICE
    property length : UInt32
    property impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL
    property context_tracking_mode : UInt8
    property effective_only : Win32cr::Foundation::BOOLEAN
    def initialize(@length : UInt32, @impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, @context_tracking_mode : UInt8, @effective_only : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct SE_IMPERSONATION_STATE
    property token : Void*
    property copy_on_open : Win32cr::Foundation::BOOLEAN
    property effective_only : Win32cr::Foundation::BOOLEAN
    property level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL
    def initialize(@token : Void*, @copy_on_open : Win32cr::Foundation::BOOLEAN, @effective_only : Win32cr::Foundation::BOOLEAN, @level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL)
    end
  end

  @[Extern]
  struct SECURITY_CAPABILITIES
    property app_container_sid : Win32cr::Foundation::PSID
    property capabilities : Win32cr::Security::SID_AND_ATTRIBUTES*
    property capability_count : UInt32
    property reserved : UInt32
    def initialize(@app_container_sid : Win32cr::Foundation::PSID, @capabilities : Win32cr::Security::SID_AND_ATTRIBUTES*, @capability_count : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct QUOTA_LIMITS
    property paged_pool_limit : LibC::UIntPtrT
    property non_paged_pool_limit : LibC::UIntPtrT
    property minimum_working_set_size : LibC::UIntPtrT
    property maximum_working_set_size : LibC::UIntPtrT
    property pagefile_limit : LibC::UIntPtrT
    property time_limit : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@paged_pool_limit : LibC::UIntPtrT, @non_paged_pool_limit : LibC::UIntPtrT, @minimum_working_set_size : LibC::UIntPtrT, @maximum_working_set_size : LibC::UIntPtrT, @pagefile_limit : LibC::UIntPtrT, @time_limit : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  def accessCheck(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access : UInt32*, access_status : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheck(pSecurityDescriptor, client_token, desired_access, generic_mapping, privilege_set, privilege_set_length, granted_access, access_status)
  end

  def accessCheckAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckAndAuditAlarmW(subsystem_name, handle_id, object_type_name, object_name, security_descriptor, desired_access, generic_mapping, object_creation, granted_access, access_status, pfGenerateOnClose)
  end

  def accessCheckByType(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access : UInt32*, access_status : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByType(pSecurityDescriptor, principal_self_sid, client_token, desired_access, object_type_list, object_type_list_length, generic_mapping, privilege_set, privilege_set_length, granted_access, access_status)
  end

  def accessCheckByTypeResultList(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access_list : UInt32*, access_status_list : UInt32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByTypeResultList(pSecurityDescriptor, principal_self_sid, client_token, desired_access, object_type_list, object_type_list_length, generic_mapping, privilege_set, privilege_set_length, granted_access_list, access_status_list)
  end

  def accessCheckByTypeAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByTypeAndAuditAlarmW(subsystem_name, handle_id, object_type_name, object_name, security_descriptor, principal_self_sid, desired_access, audit_type, flags, object_type_list, object_type_list_length, generic_mapping, object_creation, granted_access, access_status, pfGenerateOnClose)
  end

  def accessCheckByTypeResultListAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access_list : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByTypeResultListAndAuditAlarmW(subsystem_name, handle_id, object_type_name, object_name, security_descriptor, principal_self_sid, desired_access, audit_type, flags, object_type_list, object_type_list_length, generic_mapping, object_creation, granted_access_list, access_status_list, pfGenerateOnClose)
  end

  def accessCheckByTypeResultListAndAuditAlarmByHandleW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access_list : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByTypeResultListAndAuditAlarmByHandleW(subsystem_name, handle_id, client_token, object_type_name, object_name, security_descriptor, principal_self_sid, desired_access, audit_type, flags, object_type_list, object_type_list_length, generic_mapping, object_creation, granted_access_list, access_status_list, pfGenerateOnClose)
  end

  def addAccessAllowedAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddAccessAllowedAce(pAcl, dwAceRevision, access_mask, pSid)
  end

  def addAccessAllowedAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddAccessAllowedAceEx(pAcl, dwAceRevision, ace_flags, access_mask, pSid)
  end

  def addAccessAllowedObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddAccessAllowedObjectAce(pAcl, dwAceRevision, ace_flags, access_mask, object_type_guid, inherited_object_type_guid, pSid)
  end

  def addAccessDeniedAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddAccessDeniedAce(pAcl, dwAceRevision, access_mask, pSid)
  end

  def addAccessDeniedAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddAccessDeniedAceEx(pAcl, dwAceRevision, ace_flags, access_mask, pSid)
  end

  def addAccessDeniedObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddAccessDeniedObjectAce(pAcl, dwAceRevision, ace_flags, access_mask, object_type_guid, inherited_object_type_guid, pSid)
  end

  def addAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, dwStartingAceIndex : UInt32, pAceList : Void*, nAceListLength : UInt32) : Win32cr::Foundation::BOOL
    C.AddAce(pAcl, dwAceRevision, dwStartingAceIndex, pAceList, nAceListLength)
  end

  def addAuditAccessAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, dwAccessMask : UInt32, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.AddAuditAccessAce(pAcl, dwAceRevision, dwAccessMask, pSid, bAuditSuccess, bAuditFailure)
  end

  def addAuditAccessAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, dwAccessMask : UInt32, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.AddAuditAccessAceEx(pAcl, dwAceRevision, ace_flags, dwAccessMask, pSid, bAuditSuccess, bAuditFailure)
  end

  def addAuditAccessObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.AddAuditAccessObjectAce(pAcl, dwAceRevision, ace_flags, access_mask, object_type_guid, inherited_object_type_guid, pSid, bAuditSuccess, bAuditFailure)
  end

  def addMandatoryAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : Win32cr::Security::ACE_REVISION, ace_flags : Win32cr::Security::ACE_FLAGS, mandatory_policy : UInt32, pLabelSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddMandatoryAce(pAcl, dwAceRevision, ace_flags, mandatory_policy, pLabelSid)
  end

  def addResourceAttributeAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID, pAttributeInfo : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTES_INFORMATION*, pReturnLength : UInt32*) : Win32cr::Foundation::BOOL
    C.AddResourceAttributeAce(pAcl, dwAceRevision, ace_flags, access_mask, pSid, pAttributeInfo, pReturnLength)
  end

  def addScopedPolicyIDAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddScopedPolicyIDAce(pAcl, dwAceRevision, ace_flags, access_mask, pSid)
  end

  def adjustTokenGroups(token_handle : Win32cr::Foundation::HANDLE, reset_to_default : Win32cr::Foundation::BOOL, new_state : Win32cr::Security::TOKEN_GROUPS*, buffer_length : UInt32, previous_state : Win32cr::Security::TOKEN_GROUPS*, return_length : UInt32*) : Win32cr::Foundation::BOOL
    C.AdjustTokenGroups(token_handle, reset_to_default, new_state, buffer_length, previous_state, return_length)
  end

  def adjustTokenPrivileges(token_handle : Win32cr::Foundation::HANDLE, disable_all_privileges : Win32cr::Foundation::BOOL, new_state : Win32cr::Security::TOKEN_PRIVILEGES*, buffer_length : UInt32, previous_state : Win32cr::Security::TOKEN_PRIVILEGES*, return_length : UInt32*) : Win32cr::Foundation::BOOL
    C.AdjustTokenPrivileges(token_handle, disable_all_privileges, new_state, buffer_length, previous_state, return_length)
  end

  def allocateAndInitializeSid(pIdentifierAuthority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*, nSubAuthorityCount : UInt8, nSubAuthority0 : UInt32, nSubAuthority1 : UInt32, nSubAuthority2 : UInt32, nSubAuthority3 : UInt32, nSubAuthority4 : UInt32, nSubAuthority5 : UInt32, nSubAuthority6 : UInt32, nSubAuthority7 : UInt32, pSid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::BOOL
    C.AllocateAndInitializeSid(pIdentifierAuthority, nSubAuthorityCount, nSubAuthority0, nSubAuthority1, nSubAuthority2, nSubAuthority3, nSubAuthority4, nSubAuthority5, nSubAuthority6, nSubAuthority7, pSid)
  end

  def allocateLocallyUniqueId(luid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL
    C.AllocateLocallyUniqueId(luid)
  end

  def areAllAccessesGranted(granted_access : UInt32, desired_access : UInt32) : Win32cr::Foundation::BOOL
    C.AreAllAccessesGranted(granted_access, desired_access)
  end

  def areAnyAccessesGranted(granted_access : UInt32, desired_access : UInt32) : Win32cr::Foundation::BOOL
    C.AreAnyAccessesGranted(granted_access, desired_access)
  end

  def checkTokenMembership(token_handle : Win32cr::Foundation::HANDLE, sid_to_check : Win32cr::Foundation::PSID, is_member : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.CheckTokenMembership(token_handle, sid_to_check, is_member)
  end

  def checkTokenCapability(token_handle : Win32cr::Foundation::HANDLE, capability_sid_to_check : Win32cr::Foundation::PSID, has_capability : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.CheckTokenCapability(token_handle, capability_sid_to_check, has_capability)
  end

  def getAppContainerAce(acl : Win32cr::Security::ACL*, starting_ace_index : UInt32, app_container_ace : Void**, app_container_ace_index : UInt32*) : Win32cr::Foundation::BOOL
    C.GetAppContainerAce(acl, starting_ace_index, app_container_ace, app_container_ace_index)
  end

  def checkTokenMembershipEx(token_handle : Win32cr::Foundation::HANDLE, sid_to_check : Win32cr::Foundation::PSID, flags : UInt32, is_member : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.CheckTokenMembershipEx(token_handle, sid_to_check, flags, is_member)
  end

  def convertToAutoInheritPrivateObjectSecurity(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, current_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_type : LibC::GUID*, is_directory_object : Win32cr::Foundation::BOOLEAN, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL
    C.ConvertToAutoInheritPrivateObjectSecurity(parent_descriptor, current_security_descriptor, new_security_descriptor, object_type, is_directory_object, generic_mapping)
  end

  def copySid(nDestinationSidLength : UInt32, pDestinationSid : Win32cr::Foundation::PSID, pSourceSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.CopySid(nDestinationSidLength, pDestinationSid, pSourceSid)
  end

  def createPrivateObjectSecurity(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, is_directory_object : Win32cr::Foundation::BOOL, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL
    C.CreatePrivateObjectSecurity(parent_descriptor, creator_descriptor, new_descriptor, is_directory_object, token, generic_mapping)
  end

  def createPrivateObjectSecurityEx(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_type : LibC::GUID*, is_container_object : Win32cr::Foundation::BOOL, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL
    C.CreatePrivateObjectSecurityEx(parent_descriptor, creator_descriptor, new_descriptor, object_type, is_container_object, auto_inherit_flags, token, generic_mapping)
  end

  def createPrivateObjectSecurityWithMultipleInheritance(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_types : LibC::GUID**, guid_count : UInt32, is_container_object : Win32cr::Foundation::BOOL, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL
    C.CreatePrivateObjectSecurityWithMultipleInheritance(parent_descriptor, creator_descriptor, new_descriptor, object_types, guid_count, is_container_object, auto_inherit_flags, token, generic_mapping)
  end

  def createRestrictedToken(existing_token_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Security::CREATE_RESTRICTED_TOKEN_FLAGS, disable_sid_count : UInt32, sids_to_disable : Win32cr::Security::SID_AND_ATTRIBUTES*, delete_privilege_count : UInt32, privileges_to_delete : Win32cr::Security::LUID_AND_ATTRIBUTES*, restricted_sid_count : UInt32, sids_to_restrict : Win32cr::Security::SID_AND_ATTRIBUTES*, new_token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.CreateRestrictedToken(existing_token_handle, flags, disable_sid_count, sids_to_disable, delete_privilege_count, privileges_to_delete, restricted_sid_count, sids_to_restrict, new_token_handle)
  end

  def createWellKnownSid(well_known_sid_type : Win32cr::Security::WELL_KNOWN_SID_TYPE, domain_sid : Win32cr::Foundation::PSID, pSid : Win32cr::Foundation::PSID, cbSid : UInt32*) : Win32cr::Foundation::BOOL
    C.CreateWellKnownSid(well_known_sid_type, domain_sid, pSid, cbSid)
  end

  def equalDomainSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.EqualDomainSid(pSid1, pSid2, pfEqual)
  end

  def deleteAce(pAcl : Win32cr::Security::ACL*, dwAceIndex : UInt32) : Win32cr::Foundation::BOOL
    C.DeleteAce(pAcl, dwAceIndex)
  end

  def destroyPrivateObjectSecurity(object_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::BOOL
    C.DestroyPrivateObjectSecurity(object_descriptor)
  end

  def duplicateToken(existing_token_handle : Win32cr::Foundation::HANDLE, impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, duplicate_token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.DuplicateToken(existing_token_handle, impersonation_level, duplicate_token_handle)
  end

  def duplicateTokenEx(hExistingToken : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::Security::TOKEN_ACCESS_MASK, lpTokenAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, token_type : Win32cr::Security::TOKEN_TYPE, phNewToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.DuplicateTokenEx(hExistingToken, dwDesiredAccess, lpTokenAttributes, impersonation_level, token_type, phNewToken)
  end

  def equalPrefixSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.EqualPrefixSid(pSid1, pSid2)
  end

  def equalSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.EqualSid(pSid1, pSid2)
  end

  def findFirstFreeAce(pAcl : Win32cr::Security::ACL*, pAce : Void**) : Win32cr::Foundation::BOOL
    C.FindFirstFreeAce(pAcl, pAce)
  end

  def freeSid(pSid : Win32cr::Foundation::PSID) : Void*
    C.FreeSid(pSid)
  end

  def getAce(pAcl : Win32cr::Security::ACL*, dwAceIndex : UInt32, pAce : Void**) : Win32cr::Foundation::BOOL
    C.GetAce(pAcl, dwAceIndex, pAce)
  end

  def getAclInformation(pAcl : Win32cr::Security::ACL*, pAclInformation : Void*, nAclInformationLength : UInt32, dwAclInformationClass : Win32cr::Security::ACL_INFORMATION_CLASS) : Win32cr::Foundation::BOOL
    C.GetAclInformation(pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass)
  end

  def getFileSecurityW(lpFileName : Win32cr::Foundation::PWSTR, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL
    C.GetFileSecurityW(lpFileName, requested_information, pSecurityDescriptor, nLength, lpnLengthNeeded)
  end

  def getKernelObjectSecurity(handle : Win32cr::Foundation::HANDLE, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL
    C.GetKernelObjectSecurity(handle, requested_information, pSecurityDescriptor, nLength, lpnLengthNeeded)
  end

  def getLengthSid(pSid : Win32cr::Foundation::PSID) : UInt32
    C.GetLengthSid(pSid)
  end

  def getPrivateObjectSecurity(object_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, security_information : UInt32, resultant_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, descriptor_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL
    C.GetPrivateObjectSecurity(object_descriptor, security_information, resultant_descriptor, descriptor_length, return_length)
  end

  def getSecurityDescriptorControl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pControl : UInt16*, lpdwRevision : UInt32*) : Win32cr::Foundation::BOOL
    C.GetSecurityDescriptorControl(pSecurityDescriptor, pControl, lpdwRevision)
  end

  def getSecurityDescriptorDacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpbDaclPresent : Int32*, pDacl : Win32cr::Security::ACL**, lpbDaclDefaulted : Int32*) : Win32cr::Foundation::BOOL
    C.GetSecurityDescriptorDacl(pSecurityDescriptor, lpbDaclPresent, pDacl, lpbDaclDefaulted)
  end

  def getSecurityDescriptorGroup(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pGroup : Win32cr::Foundation::PSID*, lpbGroupDefaulted : Int32*) : Win32cr::Foundation::BOOL
    C.GetSecurityDescriptorGroup(pSecurityDescriptor, pGroup, lpbGroupDefaulted)
  end

  def getSecurityDescriptorLength(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32
    C.GetSecurityDescriptorLength(pSecurityDescriptor)
  end

  def getSecurityDescriptorOwner(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pOwner : Win32cr::Foundation::PSID*, lpbOwnerDefaulted : Int32*) : Win32cr::Foundation::BOOL
    C.GetSecurityDescriptorOwner(pSecurityDescriptor, pOwner, lpbOwnerDefaulted)
  end

  def getSecurityDescriptorRMControl(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, rm_control : UInt8*) : UInt32
    C.GetSecurityDescriptorRMControl(security_descriptor, rm_control)
  end

  def getSecurityDescriptorSacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpbSaclPresent : Int32*, pSacl : Win32cr::Security::ACL**, lpbSaclDefaulted : Int32*) : Win32cr::Foundation::BOOL
    C.GetSecurityDescriptorSacl(pSecurityDescriptor, lpbSaclPresent, pSacl, lpbSaclDefaulted)
  end

  def getSidIdentifierAuthority(pSid : Win32cr::Foundation::PSID) : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*
    C.GetSidIdentifierAuthority(pSid)
  end

  def getSidLengthRequired(nSubAuthorityCount : UInt8) : UInt32
    C.GetSidLengthRequired(nSubAuthorityCount)
  end

  def getSidSubAuthority(pSid : Win32cr::Foundation::PSID, nSubAuthority : UInt32) : UInt32*
    C.GetSidSubAuthority(pSid, nSubAuthority)
  end

  def getSidSubAuthorityCount(pSid : Win32cr::Foundation::PSID) : UInt8*
    C.GetSidSubAuthorityCount(pSid)
  end

  def getTokenInformation(token_handle : Win32cr::Foundation::HANDLE, token_information_class : Win32cr::Security::TOKEN_INFORMATION_CLASS, token_information : Void*, token_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL
    C.GetTokenInformation(token_handle, token_information_class, token_information, token_information_length, return_length)
  end

  def getWindowsAccountDomainSid(pSid : Win32cr::Foundation::PSID, pDomainSid : Win32cr::Foundation::PSID, cbDomainSid : UInt32*) : Win32cr::Foundation::BOOL
    C.GetWindowsAccountDomainSid(pSid, pDomainSid, cbDomainSid)
  end

  def impersonateAnonymousToken(thread_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.ImpersonateAnonymousToken(thread_handle)
  end

  def impersonateLoggedOnUser(hToken : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.ImpersonateLoggedOnUser(hToken)
  end

  def impersonateSelf(impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL) : Win32cr::Foundation::BOOL
    C.ImpersonateSelf(impersonation_level)
  end

  def initializeAcl(pAcl : Win32cr::Security::ACL*, nAclLength : UInt32, dwAclRevision : UInt32) : Win32cr::Foundation::BOOL
    C.InitializeAcl(pAcl, nAclLength, dwAclRevision)
  end

  def initializeSecurityDescriptor(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, dwRevision : UInt32) : Win32cr::Foundation::BOOL
    C.InitializeSecurityDescriptor(pSecurityDescriptor, dwRevision)
  end

  def initializeSid(sid : Win32cr::Foundation::PSID, pIdentifierAuthority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*, nSubAuthorityCount : UInt8) : Win32cr::Foundation::BOOL
    C.InitializeSid(sid, pIdentifierAuthority, nSubAuthorityCount)
  end

  def isTokenRestricted(token_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.IsTokenRestricted(token_handle)
  end

  def isValidAcl(pAcl : Win32cr::Security::ACL*) : Win32cr::Foundation::BOOL
    C.IsValidAcl(pAcl)
  end

  def isValidSecurityDescriptor(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL
    C.IsValidSecurityDescriptor(pSecurityDescriptor)
  end

  def isValidSid(pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.IsValidSid(pSid)
  end

  def isWellKnownSid(pSid : Win32cr::Foundation::PSID, well_known_sid_type : Win32cr::Security::WELL_KNOWN_SID_TYPE) : Win32cr::Foundation::BOOL
    C.IsWellKnownSid(pSid, well_known_sid_type)
  end

  def makeAbsoluteSD(pSelfRelativeSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pAbsoluteSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpdwAbsoluteSecurityDescriptorSize : UInt32*, pDacl : Win32cr::Security::ACL*, lpdwDaclSize : UInt32*, pSacl : Win32cr::Security::ACL*, lpdwSaclSize : UInt32*, pOwner : Win32cr::Foundation::PSID, lpdwOwnerSize : UInt32*, pPrimaryGroup : Win32cr::Foundation::PSID, lpdwPrimaryGroupSize : UInt32*) : Win32cr::Foundation::BOOL
    C.MakeAbsoluteSD(pSelfRelativeSecurityDescriptor, pAbsoluteSecurityDescriptor, lpdwAbsoluteSecurityDescriptorSize, pDacl, lpdwDaclSize, pSacl, lpdwSaclSize, pOwner, lpdwOwnerSize, pPrimaryGroup, lpdwPrimaryGroupSize)
  end

  def makeSelfRelativeSD(pAbsoluteSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pSelfRelativeSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpdwBufferLength : UInt32*) : Win32cr::Foundation::BOOL
    C.MakeSelfRelativeSD(pAbsoluteSecurityDescriptor, pSelfRelativeSecurityDescriptor, lpdwBufferLength)
  end

  def mapGenericMask(access_mask : UInt32*, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Void
    C.MapGenericMask(access_mask, generic_mapping)
  end

  def objectCloseAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.ObjectCloseAuditAlarmW(subsystem_name, handle_id, generate_on_close)
  end

  def objectDeleteAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.ObjectDeleteAuditAlarmW(subsystem_name, handle_id, generate_on_close)
  end

  def objectOpenAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, granted_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, object_creation : Win32cr::Foundation::BOOL, access_granted : Win32cr::Foundation::BOOL, generate_on_close : Int32*) : Win32cr::Foundation::BOOL
    C.ObjectOpenAuditAlarmW(subsystem_name, handle_id, object_type_name, object_name, pSecurityDescriptor, client_token, desired_access, granted_access, privileges, object_creation, access_granted, generate_on_close)
  end

  def objectPrivilegeAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.ObjectPrivilegeAuditAlarmW(subsystem_name, handle_id, client_token, desired_access, privileges, access_granted)
  end

  def privilegeCheck(client_token : Win32cr::Foundation::HANDLE, required_privileges : Win32cr::Security::PRIVILEGE_SET*, pfResult : Int32*) : Win32cr::Foundation::BOOL
    C.PrivilegeCheck(client_token, required_privileges, pfResult)
  end

  def privilegedServiceAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, service_name : Win32cr::Foundation::PWSTR, client_token : Win32cr::Foundation::HANDLE, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.PrivilegedServiceAuditAlarmW(subsystem_name, service_name, client_token, privileges, access_granted)
  end

  def querySecurityAccessMask(security_information : UInt32, desired_access : UInt32*) : Void
    C.QuerySecurityAccessMask(security_information, desired_access)
  end

  def revertToSelf : Win32cr::Foundation::BOOL
    C.RevertToSelf
  end

  def setAclInformation(pAcl : Win32cr::Security::ACL*, pAclInformation : Void*, nAclInformationLength : UInt32, dwAclInformationClass : Win32cr::Security::ACL_INFORMATION_CLASS) : Win32cr::Foundation::BOOL
    C.SetAclInformation(pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass)
  end

  def setFileSecurityW(lpFileName : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL
    C.SetFileSecurityW(lpFileName, security_information, pSecurityDescriptor)
  end

  def setKernelObjectSecurity(handle : Win32cr::Foundation::HANDLE, security_information : UInt32, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL
    C.SetKernelObjectSecurity(handle, security_information, security_descriptor)
  end

  def setPrivateObjectSecurity(security_information : UInt32, modification_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, objects_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetPrivateObjectSecurity(security_information, modification_descriptor, objects_security_descriptor, generic_mapping, token)
  end

  def setPrivateObjectSecurityEx(security_information : UInt32, modification_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, objects_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetPrivateObjectSecurityEx(security_information, modification_descriptor, objects_security_descriptor, auto_inherit_flags, generic_mapping, token)
  end

  def setSecurityAccessMask(security_information : UInt32, desired_access : UInt32*) : Void
    C.SetSecurityAccessMask(security_information, desired_access)
  end

  def setSecurityDescriptorControl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, control_bits_of_interest : UInt16, control_bits_to_set : UInt16) : Win32cr::Foundation::BOOL
    C.SetSecurityDescriptorControl(pSecurityDescriptor, control_bits_of_interest, control_bits_to_set)
  end

  def setSecurityDescriptorDacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, bDaclPresent : Win32cr::Foundation::BOOL, pDacl : Win32cr::Security::ACL*, bDaclDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetSecurityDescriptorDacl(pSecurityDescriptor, bDaclPresent, pDacl, bDaclDefaulted)
  end

  def setSecurityDescriptorGroup(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pGroup : Win32cr::Foundation::PSID, bGroupDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetSecurityDescriptorGroup(pSecurityDescriptor, pGroup, bGroupDefaulted)
  end

  def setSecurityDescriptorOwner(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pOwner : Win32cr::Foundation::PSID, bOwnerDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetSecurityDescriptorOwner(pSecurityDescriptor, pOwner, bOwnerDefaulted)
  end

  def setSecurityDescriptorRMControl(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, rm_control : UInt8*) : UInt32
    C.SetSecurityDescriptorRMControl(security_descriptor, rm_control)
  end

  def setSecurityDescriptorSacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, bSaclPresent : Win32cr::Foundation::BOOL, pSacl : Win32cr::Security::ACL*, bSaclDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetSecurityDescriptorSacl(pSecurityDescriptor, bSaclPresent, pSacl, bSaclDefaulted)
  end

  def setTokenInformation(token_handle : Win32cr::Foundation::HANDLE, token_information_class : Win32cr::Security::TOKEN_INFORMATION_CLASS, token_information : Void*, token_information_length : UInt32) : Win32cr::Foundation::BOOL
    C.SetTokenInformation(token_handle, token_information_class, token_information, token_information_length)
  end

  def setCachedSigningLevel(source_files : Win32cr::Foundation::HANDLE*, source_file_count : UInt32, flags : UInt32, target_file : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetCachedSigningLevel(source_files, source_file_count, flags, target_file)
  end

  def getCachedSigningLevel(file : Win32cr::Foundation::HANDLE, flags : UInt32*, signing_level : UInt32*, thumbprint : UInt8*, thumbprint_size : UInt32*, thumbprint_algorithm : UInt32*) : Win32cr::Foundation::BOOL
    C.GetCachedSigningLevel(file, flags, signing_level, thumbprint, thumbprint_size, thumbprint_algorithm)
  end

  def deriveCapabilitySidsFromName(cap_name : Win32cr::Foundation::PWSTR, capability_group_sids : Win32cr::Foundation::PSID**, capability_group_sid_count : UInt32*, capability_sids : Win32cr::Foundation::PSID**, capability_sid_count : UInt32*) : Win32cr::Foundation::BOOL
    C.DeriveCapabilitySidsFromName(cap_name, capability_group_sids, capability_group_sid_count, capability_sids, capability_sid_count)
  end

  def rtlNormalizeSecurityDescriptor(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, security_descriptor_length : UInt32, new_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, new_security_descriptor_length : UInt32*, check_only : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOLEAN
    C.RtlNormalizeSecurityDescriptor(security_descriptor, security_descriptor_length, new_security_descriptor, new_security_descriptor_length, check_only)
  end

  def setUserObjectSecurity(hObj : Win32cr::Foundation::HANDLE, pSIRequested : Win32cr::Security::OBJECT_SECURITY_INFORMATION*, pSID : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL
    C.SetUserObjectSecurity(hObj, pSIRequested, pSID)
  end

  def getUserObjectSecurity(hObj : Win32cr::Foundation::HANDLE, pSIRequested : UInt32*, pSID : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL
    C.GetUserObjectSecurity(hObj, pSIRequested, pSID, nLength, lpnLengthNeeded)
  end

  def accessCheckAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckAndAuditAlarmA(subsystem_name, handle_id, object_type_name, object_name, security_descriptor, desired_access, generic_mapping, object_creation, granted_access, access_status, pfGenerateOnClose)
  end

  def accessCheckByTypeAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByTypeAndAuditAlarmA(subsystem_name, handle_id, object_type_name, object_name, security_descriptor, principal_self_sid, desired_access, audit_type, flags, object_type_list, object_type_list_length, generic_mapping, object_creation, granted_access, access_status, pfGenerateOnClose)
  end

  def accessCheckByTypeResultListAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByTypeResultListAndAuditAlarmA(subsystem_name, handle_id, object_type_name, object_name, security_descriptor, principal_self_sid, desired_access, audit_type, flags, object_type_list, object_type_list_length, generic_mapping, object_creation, granted_access, access_status_list, pfGenerateOnClose)
  end

  def accessCheckByTypeResultListAndAuditAlarmByHandleA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL
    C.AccessCheckByTypeResultListAndAuditAlarmByHandleA(subsystem_name, handle_id, client_token, object_type_name, object_name, security_descriptor, principal_self_sid, desired_access, audit_type, flags, object_type_list, object_type_list_length, generic_mapping, object_creation, granted_access, access_status_list, pfGenerateOnClose)
  end

  def objectOpenAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, granted_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, object_creation : Win32cr::Foundation::BOOL, access_granted : Win32cr::Foundation::BOOL, generate_on_close : Int32*) : Win32cr::Foundation::BOOL
    C.ObjectOpenAuditAlarmA(subsystem_name, handle_id, object_type_name, object_name, pSecurityDescriptor, client_token, desired_access, granted_access, privileges, object_creation, access_granted, generate_on_close)
  end

  def objectPrivilegeAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.ObjectPrivilegeAuditAlarmA(subsystem_name, handle_id, client_token, desired_access, privileges, access_granted)
  end

  def objectCloseAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.ObjectCloseAuditAlarmA(subsystem_name, handle_id, generate_on_close)
  end

  def objectDeleteAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.ObjectDeleteAuditAlarmA(subsystem_name, handle_id, generate_on_close)
  end

  def privilegedServiceAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, service_name : Win32cr::Foundation::PSTR, client_token : Win32cr::Foundation::HANDLE, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.PrivilegedServiceAuditAlarmA(subsystem_name, service_name, client_token, privileges, access_granted)
  end

  def addConditionalAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, ace_type : UInt8, access_mask : UInt32, pSid : Win32cr::Foundation::PSID, condition_str : Win32cr::Foundation::PWSTR, return_length : UInt32*) : Win32cr::Foundation::BOOL
    C.AddConditionalAce(pAcl, dwAceRevision, ace_flags, ace_type, access_mask, pSid, condition_str, return_length)
  end

  def setFileSecurityA(lpFileName : Win32cr::Foundation::PSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL
    C.SetFileSecurityA(lpFileName, security_information, pSecurityDescriptor)
  end

  def getFileSecurityA(lpFileName : Win32cr::Foundation::PSTR, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL
    C.GetFileSecurityA(lpFileName, requested_information, pSecurityDescriptor, nLength, lpnLengthNeeded)
  end

  def lookupAccountSidA(lpSystemName : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID, name : UInt8*, cchName : UInt32*, referenced_domain_name : UInt8*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL
    C.LookupAccountSidA(lpSystemName, sid, name, cchName, referenced_domain_name, cchReferencedDomainName, peUse)
  end

  #def lookupAccountSidW(lpSystemName : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID, name : UInt16*, cchName : UInt32*, referenced_domain_name : UInt16*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL
    #C.LookupAccountSidW(lpSystemName, sid, name, cchName, referenced_domain_name, cchReferencedDomainName, peUse)
  #end

  def lookupAccountNameA(lpSystemName : Win32cr::Foundation::PSTR, lpAccountName : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID, cbSid : UInt32*, referenced_domain_name : UInt8*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL
    C.LookupAccountNameA(lpSystemName, lpAccountName, sid, cbSid, referenced_domain_name, cchReferencedDomainName, peUse)
  end

  #def lookupAccountNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpAccountName : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID, cbSid : UInt32*, referenced_domain_name : UInt16*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL
    #C.LookupAccountNameW(lpSystemName, lpAccountName, sid, cbSid, referenced_domain_name, cchReferencedDomainName, peUse)
  #end

  def lookupPrivilegeValueA(lpSystemName : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL
    C.LookupPrivilegeValueA(lpSystemName, lpName, lpLuid)
  end

  def lookupPrivilegeValueW(lpSystemName : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL
    C.LookupPrivilegeValueW(lpSystemName, lpName, lpLuid)
  end

  def lookupPrivilegeNameA(lpSystemName : Win32cr::Foundation::PSTR, lpLuid : Win32cr::Foundation::LUID*, lpName : UInt8*, cchName : UInt32*) : Win32cr::Foundation::BOOL
    C.LookupPrivilegeNameA(lpSystemName, lpLuid, lpName, cchName)
  end

  def lookupPrivilegeNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpLuid : Win32cr::Foundation::LUID*, lpName : UInt16*, cchName : UInt32*) : Win32cr::Foundation::BOOL
    C.LookupPrivilegeNameW(lpSystemName, lpLuid, lpName, cchName)
  end

  def lookupPrivilegeDisplayNameA(lpSystemName : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpDisplayName : UInt8*, cchDisplayName : UInt32*, lpLanguageId : UInt32*) : Win32cr::Foundation::BOOL
    C.LookupPrivilegeDisplayNameA(lpSystemName, lpName, lpDisplayName, cchDisplayName, lpLanguageId)
  end

  def lookupPrivilegeDisplayNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpDisplayName : UInt16*, cchDisplayName : UInt32*, lpLanguageId : UInt32*) : Win32cr::Foundation::BOOL
    C.LookupPrivilegeDisplayNameW(lpSystemName, lpName, lpDisplayName, cchDisplayName, lpLanguageId)
  end

  def logonUserA(lpszUsername : Win32cr::Foundation::PSTR, lpszDomain : Win32cr::Foundation::PSTR, lpszPassword : Win32cr::Foundation::PSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.LogonUserA(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken)
  end

  def logonUserW(lpszUsername : Win32cr::Foundation::PWSTR, lpszDomain : Win32cr::Foundation::PWSTR, lpszPassword : Win32cr::Foundation::PWSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.LogonUserW(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken)
  end

  def logonUserExA(lpszUsername : Win32cr::Foundation::PSTR, lpszDomain : Win32cr::Foundation::PSTR, lpszPassword : Win32cr::Foundation::PSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*, ppLogonSid : Win32cr::Foundation::PSID*, ppProfileBuffer : Void**, pdwProfileLength : UInt32*, pQuotaLimits : Win32cr::Security::QUOTA_LIMITS*) : Win32cr::Foundation::BOOL
    C.LogonUserExA(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken, ppLogonSid, ppProfileBuffer, pdwProfileLength, pQuotaLimits)
  end

  def logonUserExW(lpszUsername : Win32cr::Foundation::PWSTR, lpszDomain : Win32cr::Foundation::PWSTR, lpszPassword : Win32cr::Foundation::PWSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*, ppLogonSid : Win32cr::Foundation::PSID*, ppProfileBuffer : Void**, pdwProfileLength : UInt32*, pQuotaLimits : Win32cr::Security::QUOTA_LIMITS*) : Win32cr::Foundation::BOOL
    C.LogonUserExW(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken, ppLogonSid, ppProfileBuffer, pdwProfileLength, pQuotaLimits)
  end

  def rtlConvertSidToUnicodeString(unicode_string : Win32cr::Foundation::UNICODE_STRING*, sid : Win32cr::Foundation::PSID, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS
    C.RtlConvertSidToUnicodeString(unicode_string, sid, allocate_destination_string)
  end

  @[Link("advapi32")]
  @[Link("kernel32")]
  @[Link("ntdll")]
  @[Link("user32")]
  lib C
    # :nodoc:
    fun AccessCheck(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access : UInt32*, access_status : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByType(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access : UInt32*, access_status : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByTypeResultList(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access_list : UInt32*, access_status_list : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByTypeAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByTypeResultListAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access_list : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByTypeResultListAndAuditAlarmByHandleW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access_list : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAccessAllowedAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAccessAllowedAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAccessAllowedObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAccessDeniedAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAccessDeniedAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAccessDeniedObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, dwStartingAceIndex : UInt32, pAceList : Void*, nAceListLength : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAuditAccessAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, dwAccessMask : UInt32, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAuditAccessAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, dwAccessMask : UInt32, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddAuditAccessObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddMandatoryAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : Win32cr::Security::ACE_REVISION, ace_flags : Win32cr::Security::ACE_FLAGS, mandatory_policy : UInt32, pLabelSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddResourceAttributeAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID, pAttributeInfo : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTES_INFORMATION*, pReturnLength : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddScopedPolicyIDAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AdjustTokenGroups(token_handle : Win32cr::Foundation::HANDLE, reset_to_default : Win32cr::Foundation::BOOL, new_state : Win32cr::Security::TOKEN_GROUPS*, buffer_length : UInt32, previous_state : Win32cr::Security::TOKEN_GROUPS*, return_length : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AdjustTokenPrivileges(token_handle : Win32cr::Foundation::HANDLE, disable_all_privileges : Win32cr::Foundation::BOOL, new_state : Win32cr::Security::TOKEN_PRIVILEGES*, buffer_length : UInt32, previous_state : Win32cr::Security::TOKEN_PRIVILEGES*, return_length : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AllocateAndInitializeSid(pIdentifierAuthority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*, nSubAuthorityCount : UInt8, nSubAuthority0 : UInt32, nSubAuthority1 : UInt32, nSubAuthority2 : UInt32, nSubAuthority3 : UInt32, nSubAuthority4 : UInt32, nSubAuthority5 : UInt32, nSubAuthority6 : UInt32, nSubAuthority7 : UInt32, pSid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AllocateLocallyUniqueId(luid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AreAllAccessesGranted(granted_access : UInt32, desired_access : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AreAnyAccessesGranted(granted_access : UInt32, desired_access : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CheckTokenMembership(token_handle : Win32cr::Foundation::HANDLE, sid_to_check : Win32cr::Foundation::PSID, is_member : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CheckTokenCapability(token_handle : Win32cr::Foundation::HANDLE, capability_sid_to_check : Win32cr::Foundation::PSID, has_capability : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetAppContainerAce(acl : Win32cr::Security::ACL*, starting_ace_index : UInt32, app_container_ace : Void**, app_container_ace_index : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CheckTokenMembershipEx(token_handle : Win32cr::Foundation::HANDLE, sid_to_check : Win32cr::Foundation::PSID, flags : UInt32, is_member : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertToAutoInheritPrivateObjectSecurity(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, current_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_type : LibC::GUID*, is_directory_object : Win32cr::Foundation::BOOLEAN, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CopySid(nDestinationSidLength : UInt32, pDestinationSid : Win32cr::Foundation::PSID, pSourceSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreatePrivateObjectSecurity(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, is_directory_object : Win32cr::Foundation::BOOL, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreatePrivateObjectSecurityEx(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_type : LibC::GUID*, is_container_object : Win32cr::Foundation::BOOL, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreatePrivateObjectSecurityWithMultipleInheritance(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_types : LibC::GUID**, guid_count : UInt32, is_container_object : Win32cr::Foundation::BOOL, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateRestrictedToken(existing_token_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Security::CREATE_RESTRICTED_TOKEN_FLAGS, disable_sid_count : UInt32, sids_to_disable : Win32cr::Security::SID_AND_ATTRIBUTES*, delete_privilege_count : UInt32, privileges_to_delete : Win32cr::Security::LUID_AND_ATTRIBUTES*, restricted_sid_count : UInt32, sids_to_restrict : Win32cr::Security::SID_AND_ATTRIBUTES*, new_token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateWellKnownSid(well_known_sid_type : Win32cr::Security::WELL_KNOWN_SID_TYPE, domain_sid : Win32cr::Foundation::PSID, pSid : Win32cr::Foundation::PSID, cbSid : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EqualDomainSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteAce(pAcl : Win32cr::Security::ACL*, dwAceIndex : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DestroyPrivateObjectSecurity(object_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DuplicateToken(existing_token_handle : Win32cr::Foundation::HANDLE, impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, duplicate_token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DuplicateTokenEx(hExistingToken : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::Security::TOKEN_ACCESS_MASK, lpTokenAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, token_type : Win32cr::Security::TOKEN_TYPE, phNewToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EqualPrefixSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EqualSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FindFirstFreeAce(pAcl : Win32cr::Security::ACL*, pAce : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FreeSid(pSid : Win32cr::Foundation::PSID) : Void*

    # :nodoc:
    fun GetAce(pAcl : Win32cr::Security::ACL*, dwAceIndex : UInt32, pAce : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetAclInformation(pAcl : Win32cr::Security::ACL*, pAclInformation : Void*, nAclInformationLength : UInt32, dwAclInformationClass : Win32cr::Security::ACL_INFORMATION_CLASS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetFileSecurityW(lpFileName : Win32cr::Foundation::PWSTR, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetKernelObjectSecurity(handle : Win32cr::Foundation::HANDLE, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetLengthSid(pSid : Win32cr::Foundation::PSID) : UInt32

    # :nodoc:
    fun GetPrivateObjectSecurity(object_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, security_information : UInt32, resultant_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, descriptor_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSecurityDescriptorControl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pControl : UInt16*, lpdwRevision : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSecurityDescriptorDacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpbDaclPresent : Int32*, pDacl : Win32cr::Security::ACL**, lpbDaclDefaulted : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSecurityDescriptorGroup(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pGroup : Win32cr::Foundation::PSID*, lpbGroupDefaulted : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSecurityDescriptorLength(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32

    # :nodoc:
    fun GetSecurityDescriptorOwner(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pOwner : Win32cr::Foundation::PSID*, lpbOwnerDefaulted : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSecurityDescriptorRMControl(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, rm_control : UInt8*) : UInt32

    # :nodoc:
    fun GetSecurityDescriptorSacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpbSaclPresent : Int32*, pSacl : Win32cr::Security::ACL**, lpbSaclDefaulted : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSidIdentifierAuthority(pSid : Win32cr::Foundation::PSID) : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*

    # :nodoc:
    fun GetSidLengthRequired(nSubAuthorityCount : UInt8) : UInt32

    # :nodoc:
    fun GetSidSubAuthority(pSid : Win32cr::Foundation::PSID, nSubAuthority : UInt32) : UInt32*

    # :nodoc:
    fun GetSidSubAuthorityCount(pSid : Win32cr::Foundation::PSID) : UInt8*

    # :nodoc:
    fun GetTokenInformation(token_handle : Win32cr::Foundation::HANDLE, token_information_class : Win32cr::Security::TOKEN_INFORMATION_CLASS, token_information : Void*, token_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetWindowsAccountDomainSid(pSid : Win32cr::Foundation::PSID, pDomainSid : Win32cr::Foundation::PSID, cbDomainSid : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ImpersonateAnonymousToken(thread_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ImpersonateLoggedOnUser(hToken : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ImpersonateSelf(impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitializeAcl(pAcl : Win32cr::Security::ACL*, nAclLength : UInt32, dwAclRevision : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitializeSecurityDescriptor(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, dwRevision : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitializeSid(sid : Win32cr::Foundation::PSID, pIdentifierAuthority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*, nSubAuthorityCount : UInt8) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsTokenRestricted(token_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsValidAcl(pAcl : Win32cr::Security::ACL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsValidSecurityDescriptor(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsValidSid(pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsWellKnownSid(pSid : Win32cr::Foundation::PSID, well_known_sid_type : Win32cr::Security::WELL_KNOWN_SID_TYPE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MakeAbsoluteSD(pSelfRelativeSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pAbsoluteSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpdwAbsoluteSecurityDescriptorSize : UInt32*, pDacl : Win32cr::Security::ACL*, lpdwDaclSize : UInt32*, pSacl : Win32cr::Security::ACL*, lpdwSaclSize : UInt32*, pOwner : Win32cr::Foundation::PSID, lpdwOwnerSize : UInt32*, pPrimaryGroup : Win32cr::Foundation::PSID, lpdwPrimaryGroupSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MakeSelfRelativeSD(pAbsoluteSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pSelfRelativeSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpdwBufferLength : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MapGenericMask(access_mask : UInt32*, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Void

    # :nodoc:
    fun ObjectCloseAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ObjectDeleteAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ObjectOpenAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, granted_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, object_creation : Win32cr::Foundation::BOOL, access_granted : Win32cr::Foundation::BOOL, generate_on_close : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ObjectPrivilegeAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PrivilegeCheck(client_token : Win32cr::Foundation::HANDLE, required_privileges : Win32cr::Security::PRIVILEGE_SET*, pfResult : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PrivilegedServiceAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, service_name : Win32cr::Foundation::PWSTR, client_token : Win32cr::Foundation::HANDLE, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QuerySecurityAccessMask(security_information : UInt32, desired_access : UInt32*) : Void

    # :nodoc:
    fun RevertToSelf : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetAclInformation(pAcl : Win32cr::Security::ACL*, pAclInformation : Void*, nAclInformationLength : UInt32, dwAclInformationClass : Win32cr::Security::ACL_INFORMATION_CLASS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetFileSecurityW(lpFileName : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetKernelObjectSecurity(handle : Win32cr::Foundation::HANDLE, security_information : UInt32, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetPrivateObjectSecurity(security_information : UInt32, modification_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, objects_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetPrivateObjectSecurityEx(security_information : UInt32, modification_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, objects_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetSecurityAccessMask(security_information : UInt32, desired_access : UInt32*) : Void

    # :nodoc:
    fun SetSecurityDescriptorControl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, control_bits_of_interest : UInt16, control_bits_to_set : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetSecurityDescriptorDacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, bDaclPresent : Win32cr::Foundation::BOOL, pDacl : Win32cr::Security::ACL*, bDaclDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetSecurityDescriptorGroup(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pGroup : Win32cr::Foundation::PSID, bGroupDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetSecurityDescriptorOwner(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pOwner : Win32cr::Foundation::PSID, bOwnerDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetSecurityDescriptorRMControl(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, rm_control : UInt8*) : UInt32

    # :nodoc:
    fun SetSecurityDescriptorSacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, bSaclPresent : Win32cr::Foundation::BOOL, pSacl : Win32cr::Security::ACL*, bSaclDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetTokenInformation(token_handle : Win32cr::Foundation::HANDLE, token_information_class : Win32cr::Security::TOKEN_INFORMATION_CLASS, token_information : Void*, token_information_length : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCachedSigningLevel(source_files : Win32cr::Foundation::HANDLE*, source_file_count : UInt32, flags : UInt32, target_file : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCachedSigningLevel(file : Win32cr::Foundation::HANDLE, flags : UInt32*, signing_level : UInt32*, thumbprint : UInt8*, thumbprint_size : UInt32*, thumbprint_algorithm : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeriveCapabilitySidsFromName(cap_name : Win32cr::Foundation::PWSTR, capability_group_sids : Win32cr::Foundation::PSID**, capability_group_sid_count : UInt32*, capability_sids : Win32cr::Foundation::PSID**, capability_sid_count : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RtlNormalizeSecurityDescriptor(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, security_descriptor_length : UInt32, new_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, new_security_descriptor_length : UInt32*, check_only : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun SetUserObjectSecurity(hObj : Win32cr::Foundation::HANDLE, pSIRequested : Win32cr::Security::OBJECT_SECURITY_INFORMATION*, pSID : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetUserObjectSecurity(hObj : Win32cr::Foundation::HANDLE, pSIRequested : UInt32*, pSID : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByTypeAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByTypeResultListAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AccessCheckByTypeResultListAndAuditAlarmByHandleA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ObjectOpenAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, granted_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, object_creation : Win32cr::Foundation::BOOL, access_granted : Win32cr::Foundation::BOOL, generate_on_close : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ObjectPrivilegeAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ObjectCloseAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ObjectDeleteAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PrivilegedServiceAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, service_name : Win32cr::Foundation::PSTR, client_token : Win32cr::Foundation::HANDLE, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddConditionalAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, ace_type : UInt8, access_mask : UInt32, pSid : Win32cr::Foundation::PSID, condition_str : Win32cr::Foundation::PWSTR, return_length : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetFileSecurityA(lpFileName : Win32cr::Foundation::PSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetFileSecurityA(lpFileName : Win32cr::Foundation::PSTR, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupAccountSidA(lpSystemName : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID, name : UInt8*, cchName : UInt32*, referenced_domain_name : UInt8*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun LookupAccountSidW(lpSystemName : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID, name : UInt16*, cchName : UInt32*, referenced_domain_name : UInt16*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupAccountNameA(lpSystemName : Win32cr::Foundation::PSTR, lpAccountName : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID, cbSid : UInt32*, referenced_domain_name : UInt8*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun LookupAccountNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpAccountName : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID, cbSid : UInt32*, referenced_domain_name : UInt16*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupPrivilegeValueA(lpSystemName : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupPrivilegeValueW(lpSystemName : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupPrivilegeNameA(lpSystemName : Win32cr::Foundation::PSTR, lpLuid : Win32cr::Foundation::LUID*, lpName : UInt8*, cchName : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupPrivilegeNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpLuid : Win32cr::Foundation::LUID*, lpName : UInt16*, cchName : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupPrivilegeDisplayNameA(lpSystemName : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpDisplayName : UInt8*, cchDisplayName : UInt32*, lpLanguageId : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LookupPrivilegeDisplayNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpDisplayName : UInt16*, cchDisplayName : UInt32*, lpLanguageId : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LogonUserA(lpszUsername : Win32cr::Foundation::PSTR, lpszDomain : Win32cr::Foundation::PSTR, lpszPassword : Win32cr::Foundation::PSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LogonUserW(lpszUsername : Win32cr::Foundation::PWSTR, lpszDomain : Win32cr::Foundation::PWSTR, lpszPassword : Win32cr::Foundation::PWSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LogonUserExA(lpszUsername : Win32cr::Foundation::PSTR, lpszDomain : Win32cr::Foundation::PSTR, lpszPassword : Win32cr::Foundation::PSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*, ppLogonSid : Win32cr::Foundation::PSID*, ppProfileBuffer : Void**, pdwProfileLength : UInt32*, pQuotaLimits : Win32cr::Security::QUOTA_LIMITS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LogonUserExW(lpszUsername : Win32cr::Foundation::PWSTR, lpszDomain : Win32cr::Foundation::PWSTR, lpszPassword : Win32cr::Foundation::PWSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*, ppLogonSid : Win32cr::Foundation::PSID*, ppProfileBuffer : Void**, pdwProfileLength : UInt32*, pQuotaLimits : Win32cr::Security::QUOTA_LIMITS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RtlConvertSidToUnicodeString(unicode_string : Win32cr::Foundation::UNICODE_STRING*, sid : Win32cr::Foundation::PSID, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS

  end
end