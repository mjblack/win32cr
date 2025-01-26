require "./foundation.cr"

module Win32cr::Security
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

  @[Link("advapi32")]
  @[Link("kernel32")]
  @[Link("ntdll")]
  @[Link("user32")]
  lib C
    fun AccessCheck(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access : UInt32*, access_status : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByType(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access : UInt32*, access_status : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByTypeResultList(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, privilege_set : Win32cr::Security::PRIVILEGE_SET*, privilege_set_length : UInt32*, granted_access_list : UInt32*, access_status_list : UInt32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByTypeAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByTypeResultListAndAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access_list : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByTypeResultListAndAuditAlarmByHandleW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access_list : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun AddAccessAllowedAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AddAccessAllowedAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AddAccessAllowedObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AddAccessDeniedAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AddAccessDeniedAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AddAccessDeniedObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AddAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, dwStartingAceIndex : UInt32, pAceList : Void*, nAceListLength : UInt32) : Win32cr::Foundation::BOOL

    fun AddAuditAccessAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, dwAccessMask : UInt32, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun AddAuditAccessAceEx(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, dwAccessMask : UInt32, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun AddAuditAccessObjectAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, object_type_guid : LibC::GUID*, inherited_object_type_guid : LibC::GUID*, pSid : Win32cr::Foundation::PSID, bAuditSuccess : Win32cr::Foundation::BOOL, bAuditFailure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun AddMandatoryAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : Win32cr::Security::ACE_REVISION, ace_flags : Win32cr::Security::ACE_FLAGS, mandatory_policy : UInt32, pLabelSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AddResourceAttributeAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID, pAttributeInfo : Win32cr::Security::CLAIM_SECURITY_ATTRIBUTES_INFORMATION*, pReturnLength : UInt32*) : Win32cr::Foundation::BOOL

    fun AddScopedPolicyIDAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, access_mask : UInt32, pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun AdjustTokenGroups(token_handle : Win32cr::Foundation::HANDLE, reset_to_default : Win32cr::Foundation::BOOL, new_state : Win32cr::Security::TOKEN_GROUPS*, buffer_length : UInt32, previous_state : Win32cr::Security::TOKEN_GROUPS*, return_length : UInt32*) : Win32cr::Foundation::BOOL

    fun AdjustTokenPrivileges(token_handle : Win32cr::Foundation::HANDLE, disable_all_privileges : Win32cr::Foundation::BOOL, new_state : Win32cr::Security::TOKEN_PRIVILEGES*, buffer_length : UInt32, previous_state : Win32cr::Security::TOKEN_PRIVILEGES*, return_length : UInt32*) : Win32cr::Foundation::BOOL

    fun AllocateAndInitializeSid(pIdentifierAuthority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*, nSubAuthorityCount : UInt8, nSubAuthority0 : UInt32, nSubAuthority1 : UInt32, nSubAuthority2 : UInt32, nSubAuthority3 : UInt32, nSubAuthority4 : UInt32, nSubAuthority5 : UInt32, nSubAuthority6 : UInt32, nSubAuthority7 : UInt32, pSid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::BOOL

    fun AllocateLocallyUniqueId(luid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL

    fun AreAllAccessesGranted(granted_access : UInt32, desired_access : UInt32) : Win32cr::Foundation::BOOL

    fun AreAnyAccessesGranted(granted_access : UInt32, desired_access : UInt32) : Win32cr::Foundation::BOOL

    fun CheckTokenMembership(token_handle : Win32cr::Foundation::HANDLE, sid_to_check : Win32cr::Foundation::PSID, is_member : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun CheckTokenCapability(token_handle : Win32cr::Foundation::HANDLE, capability_sid_to_check : Win32cr::Foundation::PSID, has_capability : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetAppContainerAce(acl : Win32cr::Security::ACL*, starting_ace_index : UInt32, app_container_ace : Void**, app_container_ace_index : UInt32*) : Win32cr::Foundation::BOOL

    fun CheckTokenMembershipEx(token_handle : Win32cr::Foundation::HANDLE, sid_to_check : Win32cr::Foundation::PSID, flags : UInt32, is_member : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun ConvertToAutoInheritPrivateObjectSecurity(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, current_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_type : LibC::GUID*, is_directory_object : Win32cr::Foundation::BOOLEAN, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    fun CopySid(nDestinationSidLength : UInt32, pDestinationSid : Win32cr::Foundation::PSID, pSourceSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun CreatePrivateObjectSecurity(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, is_directory_object : Win32cr::Foundation::BOOL, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    fun CreatePrivateObjectSecurityEx(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_type : LibC::GUID*, is_container_object : Win32cr::Foundation::BOOL, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    fun CreatePrivateObjectSecurityWithMultipleInheritance(parent_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, creator_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, new_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, object_types : LibC::GUID**, guid_count : UInt32, is_container_object : Win32cr::Foundation::BOOL, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, token : Win32cr::Foundation::HANDLE, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Win32cr::Foundation::BOOL

    fun CreateRestrictedToken(existing_token_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Security::CREATE_RESTRICTED_TOKEN_FLAGS, disable_sid_count : UInt32, sids_to_disable : Win32cr::Security::SID_AND_ATTRIBUTES*, delete_privilege_count : UInt32, privileges_to_delete : Win32cr::Security::LUID_AND_ATTRIBUTES*, restricted_sid_count : UInt32, sids_to_restrict : Win32cr::Security::SID_AND_ATTRIBUTES*, new_token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun CreateWellKnownSid(well_known_sid_type : Win32cr::Security::WELL_KNOWN_SID_TYPE, domain_sid : Win32cr::Foundation::PSID, pSid : Win32cr::Foundation::PSID, cbSid : UInt32*) : Win32cr::Foundation::BOOL

    fun EqualDomainSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun DeleteAce(pAcl : Win32cr::Security::ACL*, dwAceIndex : UInt32) : Win32cr::Foundation::BOOL

    fun DestroyPrivateObjectSecurity(object_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::BOOL

    fun DuplicateToken(existing_token_handle : Win32cr::Foundation::HANDLE, impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, duplicate_token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun DuplicateTokenEx(hExistingToken : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::Security::TOKEN_ACCESS_MASK, lpTokenAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, token_type : Win32cr::Security::TOKEN_TYPE, phNewToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun EqualPrefixSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun EqualSid(pSid1 : Win32cr::Foundation::PSID, pSid2 : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun FindFirstFreeAce(pAcl : Win32cr::Security::ACL*, pAce : Void**) : Win32cr::Foundation::BOOL

    fun FreeSid(pSid : Win32cr::Foundation::PSID) : Void*

    fun GetAce(pAcl : Win32cr::Security::ACL*, dwAceIndex : UInt32, pAce : Void**) : Win32cr::Foundation::BOOL

    fun GetAclInformation(pAcl : Win32cr::Security::ACL*, pAclInformation : Void*, nAclInformationLength : UInt32, dwAclInformationClass : Win32cr::Security::ACL_INFORMATION_CLASS) : Win32cr::Foundation::BOOL

    fun GetFileSecurityW(lpFileName : Win32cr::Foundation::PWSTR, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun GetKernelObjectSecurity(handle : Win32cr::Foundation::HANDLE, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun GetLengthSid(pSid : Win32cr::Foundation::PSID) : UInt32

    fun GetPrivateObjectSecurity(object_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, security_information : UInt32, resultant_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, descriptor_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL

    fun GetSecurityDescriptorControl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pControl : UInt16*, lpdwRevision : UInt32*) : Win32cr::Foundation::BOOL

    fun GetSecurityDescriptorDacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpbDaclPresent : Int32*, pDacl : Win32cr::Security::ACL**, lpbDaclDefaulted : Int32*) : Win32cr::Foundation::BOOL

    fun GetSecurityDescriptorGroup(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pGroup : Win32cr::Foundation::PSID*, lpbGroupDefaulted : Int32*) : Win32cr::Foundation::BOOL

    fun GetSecurityDescriptorLength(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32

    fun GetSecurityDescriptorOwner(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pOwner : Win32cr::Foundation::PSID*, lpbOwnerDefaulted : Int32*) : Win32cr::Foundation::BOOL

    fun GetSecurityDescriptorRMControl(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, rm_control : UInt8*) : UInt32

    fun GetSecurityDescriptorSacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpbSaclPresent : Int32*, pSacl : Win32cr::Security::ACL**, lpbSaclDefaulted : Int32*) : Win32cr::Foundation::BOOL

    fun GetSidIdentifierAuthority(pSid : Win32cr::Foundation::PSID) : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*

    fun GetSidLengthRequired(nSubAuthorityCount : UInt8) : UInt32

    fun GetSidSubAuthority(pSid : Win32cr::Foundation::PSID, nSubAuthority : UInt32) : UInt32*

    fun GetSidSubAuthorityCount(pSid : Win32cr::Foundation::PSID) : UInt8*

    fun GetTokenInformation(token_handle : Win32cr::Foundation::HANDLE, token_information_class : Win32cr::Security::TOKEN_INFORMATION_CLASS, token_information : Void*, token_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL

    fun GetWindowsAccountDomainSid(pSid : Win32cr::Foundation::PSID, pDomainSid : Win32cr::Foundation::PSID, cbDomainSid : UInt32*) : Win32cr::Foundation::BOOL

    fun ImpersonateAnonymousToken(thread_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun ImpersonateLoggedOnUser(hToken : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun ImpersonateSelf(impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL) : Win32cr::Foundation::BOOL

    fun InitializeAcl(pAcl : Win32cr::Security::ACL*, nAclLength : UInt32, dwAclRevision : UInt32) : Win32cr::Foundation::BOOL

    fun InitializeSecurityDescriptor(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, dwRevision : UInt32) : Win32cr::Foundation::BOOL

    fun InitializeSid(sid : Win32cr::Foundation::PSID, pIdentifierAuthority : Win32cr::Security::SID_IDENTIFIER_AUTHORITY*, nSubAuthorityCount : UInt8) : Win32cr::Foundation::BOOL

    fun IsTokenRestricted(token_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun IsValidAcl(pAcl : Win32cr::Security::ACL*) : Win32cr::Foundation::BOOL

    fun IsValidSecurityDescriptor(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun IsValidSid(pSid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun IsWellKnownSid(pSid : Win32cr::Foundation::PSID, well_known_sid_type : Win32cr::Security::WELL_KNOWN_SID_TYPE) : Win32cr::Foundation::BOOL

    fun MakeAbsoluteSD(pSelfRelativeSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pAbsoluteSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpdwAbsoluteSecurityDescriptorSize : UInt32*, pDacl : Win32cr::Security::ACL*, lpdwDaclSize : UInt32*, pSacl : Win32cr::Security::ACL*, lpdwSaclSize : UInt32*, pOwner : Win32cr::Foundation::PSID, lpdwOwnerSize : UInt32*, pPrimaryGroup : Win32cr::Foundation::PSID, lpdwPrimaryGroupSize : UInt32*) : Win32cr::Foundation::BOOL

    fun MakeSelfRelativeSD(pAbsoluteSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pSelfRelativeSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpdwBufferLength : UInt32*) : Win32cr::Foundation::BOOL

    fun MapGenericMask(access_mask : UInt32*, generic_mapping : Win32cr::Security::GENERIC_MAPPING*) : Void

    fun ObjectCloseAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun ObjectDeleteAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun ObjectOpenAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PWSTR, object_name : Win32cr::Foundation::PWSTR, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, granted_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, object_creation : Win32cr::Foundation::BOOL, access_granted : Win32cr::Foundation::BOOL, generate_on_close : Int32*) : Win32cr::Foundation::BOOL

    fun ObjectPrivilegeAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun PrivilegeCheck(client_token : Win32cr::Foundation::HANDLE, required_privileges : Win32cr::Security::PRIVILEGE_SET*, pfResult : Int32*) : Win32cr::Foundation::BOOL

    fun PrivilegedServiceAuditAlarmW(subsystem_name : Win32cr::Foundation::PWSTR, service_name : Win32cr::Foundation::PWSTR, client_token : Win32cr::Foundation::HANDLE, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun QuerySecurityAccessMask(security_information : UInt32, desired_access : UInt32*) : Void

    fun RevertToSelf : Win32cr::Foundation::BOOL

    fun SetAclInformation(pAcl : Win32cr::Security::ACL*, pAclInformation : Void*, nAclInformationLength : UInt32, dwAclInformationClass : Win32cr::Security::ACL_INFORMATION_CLASS) : Win32cr::Foundation::BOOL

    fun SetFileSecurityW(lpFileName : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun SetKernelObjectSecurity(handle : Win32cr::Foundation::HANDLE, security_information : UInt32, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun SetPrivateObjectSecurity(security_information : UInt32, modification_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, objects_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun SetPrivateObjectSecurityEx(security_information : UInt32, modification_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, objects_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, auto_inherit_flags : Win32cr::Security::SECURITY_AUTO_INHERIT_FLAGS, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun SetSecurityAccessMask(security_information : UInt32, desired_access : UInt32*) : Void

    fun SetSecurityDescriptorControl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, control_bits_of_interest : UInt16, control_bits_to_set : UInt16) : Win32cr::Foundation::BOOL

    fun SetSecurityDescriptorDacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, bDaclPresent : Win32cr::Foundation::BOOL, pDacl : Win32cr::Security::ACL*, bDaclDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun SetSecurityDescriptorGroup(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pGroup : Win32cr::Foundation::PSID, bGroupDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun SetSecurityDescriptorOwner(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pOwner : Win32cr::Foundation::PSID, bOwnerDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun SetSecurityDescriptorRMControl(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, rm_control : UInt8*) : UInt32

    fun SetSecurityDescriptorSacl(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, bSaclPresent : Win32cr::Foundation::BOOL, pSacl : Win32cr::Security::ACL*, bSaclDefaulted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun SetTokenInformation(token_handle : Win32cr::Foundation::HANDLE, token_information_class : Win32cr::Security::TOKEN_INFORMATION_CLASS, token_information : Void*, token_information_length : UInt32) : Win32cr::Foundation::BOOL

    fun SetCachedSigningLevel(source_files : Win32cr::Foundation::HANDLE*, source_file_count : UInt32, flags : UInt32, target_file : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun GetCachedSigningLevel(file : Win32cr::Foundation::HANDLE, flags : UInt32*, signing_level : UInt32*, thumbprint : UInt8*, thumbprint_size : UInt32*, thumbprint_algorithm : UInt32*) : Win32cr::Foundation::BOOL

    fun DeriveCapabilitySidsFromName(cap_name : Win32cr::Foundation::PWSTR, capability_group_sids : Win32cr::Foundation::PSID**, capability_group_sid_count : UInt32*, capability_sids : Win32cr::Foundation::PSID**, capability_sid_count : UInt32*) : Win32cr::Foundation::BOOL

    fun RtlNormalizeSecurityDescriptor(security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, security_descriptor_length : UInt32, new_security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, new_security_descriptor_length : UInt32*, check_only : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOLEAN

    fun SetUserObjectSecurity(hObj : Win32cr::Foundation::HANDLE, pSIRequested : Win32cr::Security::OBJECT_SECURITY_INFORMATION*, pSID : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun GetUserObjectSecurity(hObj : Win32cr::Foundation::HANDLE, pSIRequested : UInt32*, pSID : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun AccessCheckAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, desired_access : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByTypeAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status : Int32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByTypeResultListAndAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun AccessCheckByTypeResultListAndAuditAlarmByHandleA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, principal_self_sid : Win32cr::Foundation::PSID, desired_access : UInt32, audit_type : Win32cr::Security::AUDIT_EVENT_TYPE, flags : UInt32, object_type_list : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, generic_mapping : Win32cr::Security::GENERIC_MAPPING*, object_creation : Win32cr::Foundation::BOOL, granted_access : UInt32*, access_status_list : UInt32*, pfGenerateOnClose : Int32*) : Win32cr::Foundation::BOOL

    fun ObjectOpenAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, object_type_name : Win32cr::Foundation::PSTR, object_name : Win32cr::Foundation::PSTR, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, granted_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, object_creation : Win32cr::Foundation::BOOL, access_granted : Win32cr::Foundation::BOOL, generate_on_close : Int32*) : Win32cr::Foundation::BOOL

    fun ObjectPrivilegeAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, client_token : Win32cr::Foundation::HANDLE, desired_access : UInt32, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun ObjectCloseAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun ObjectDeleteAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, handle_id : Void*, generate_on_close : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun PrivilegedServiceAuditAlarmA(subsystem_name : Win32cr::Foundation::PSTR, service_name : Win32cr::Foundation::PSTR, client_token : Win32cr::Foundation::HANDLE, privileges : Win32cr::Security::PRIVILEGE_SET*, access_granted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun AddConditionalAce(pAcl : Win32cr::Security::ACL*, dwAceRevision : UInt32, ace_flags : Win32cr::Security::ACE_FLAGS, ace_type : UInt8, access_mask : UInt32, pSid : Win32cr::Foundation::PSID, condition_str : Win32cr::Foundation::PWSTR, return_length : UInt32*) : Win32cr::Foundation::BOOL

    fun SetFileSecurityA(lpFileName : Win32cr::Foundation::PSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun GetFileSecurityA(lpFileName : Win32cr::Foundation::PSTR, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun LookupAccountSidA(lpSystemName : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID, name : UInt8*, cchName : UInt32*, referenced_domain_name : UInt8*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun LookupAccountSidW(lpSystemName : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID, name : UInt16*, cchName : UInt32*, referenced_domain_name : UInt16*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    fun LookupAccountNameA(lpSystemName : Win32cr::Foundation::PSTR, lpAccountName : Win32cr::Foundation::PSTR, sid : Win32cr::Foundation::PSID, cbSid : UInt32*, referenced_domain_name : UInt8*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun LookupAccountNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpAccountName : Win32cr::Foundation::PWSTR, sid : Win32cr::Foundation::PSID, cbSid : UInt32*, referenced_domain_name : UInt16*, cchReferencedDomainName : UInt32*, peUse : Win32cr::Security::SID_NAME_USE*) : Win32cr::Foundation::BOOL

    fun LookupPrivilegeValueA(lpSystemName : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL

    fun LookupPrivilegeValueW(lpSystemName : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::BOOL

    fun LookupPrivilegeNameA(lpSystemName : Win32cr::Foundation::PSTR, lpLuid : Win32cr::Foundation::LUID*, lpName : UInt8*, cchName : UInt32*) : Win32cr::Foundation::BOOL

    fun LookupPrivilegeNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpLuid : Win32cr::Foundation::LUID*, lpName : UInt16*, cchName : UInt32*) : Win32cr::Foundation::BOOL

    fun LookupPrivilegeDisplayNameA(lpSystemName : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpDisplayName : UInt8*, cchDisplayName : UInt32*, lpLanguageId : UInt32*) : Win32cr::Foundation::BOOL

    fun LookupPrivilegeDisplayNameW(lpSystemName : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpDisplayName : UInt16*, cchDisplayName : UInt32*, lpLanguageId : UInt32*) : Win32cr::Foundation::BOOL

    fun LogonUserA(lpszUsername : Win32cr::Foundation::PSTR, lpszDomain : Win32cr::Foundation::PSTR, lpszPassword : Win32cr::Foundation::PSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun LogonUserW(lpszUsername : Win32cr::Foundation::PWSTR, lpszDomain : Win32cr::Foundation::PWSTR, lpszPassword : Win32cr::Foundation::PWSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun LogonUserExA(lpszUsername : Win32cr::Foundation::PSTR, lpszDomain : Win32cr::Foundation::PSTR, lpszPassword : Win32cr::Foundation::PSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*, ppLogonSid : Win32cr::Foundation::PSID*, ppProfileBuffer : Void**, pdwProfileLength : UInt32*, pQuotaLimits : Win32cr::Security::QUOTA_LIMITS*) : Win32cr::Foundation::BOOL

    fun LogonUserExW(lpszUsername : Win32cr::Foundation::PWSTR, lpszDomain : Win32cr::Foundation::PWSTR, lpszPassword : Win32cr::Foundation::PWSTR, dwLogonType : Win32cr::Security::LOGON32_LOGON, dwLogonProvider : Win32cr::Security::LOGON32_PROVIDER, phToken : Win32cr::Foundation::HANDLE*, ppLogonSid : Win32cr::Foundation::PSID*, ppProfileBuffer : Void**, pdwProfileLength : UInt32*, pQuotaLimits : Win32cr::Security::QUOTA_LIMITS*) : Win32cr::Foundation::BOOL

    fun RtlConvertSidToUnicodeString(unicode_string : Win32cr::Foundation::UNICODE_STRING*, sid : Win32cr::Foundation::PSID, allocate_destination_string : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::NTSTATUS

  end
end