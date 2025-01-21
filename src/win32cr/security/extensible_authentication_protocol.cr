require "./cryptography.cr"
require "./../foundation.cr"
require "./../system/com.cr"
require "./../data/xml/ms_xml.cr"

module Win32cr::Security::ExtensibleAuthenticationProtocol
  alias NotificationHandler = Proc(LibC::GUID, Void*, Void)*

  FACILITY_EAP_MESSAGE = 2114_u32
  EAP_GROUP_MASK = 65280_i32
  EAP_E_EAPHOST_FIRST = -2143158272_i32
  EAP_E_EAPHOST_LAST = -2143158017_i32
  EAP_I_EAPHOST_FIRST = -2143158272_i32
  EAP_I_EAPHOST_LAST = -2143158017_i32
  EAP_E_CERT_STORE_INACCESSIBLE = 2151809040_u32
  EAP_E_EAPHOST_METHOD_NOT_INSTALLED = 2151809041_u32
  EAP_E_EAPHOST_THIRDPARTY_METHOD_HOST_RESET = 2151809042_u32
  EAP_E_EAPHOST_EAPQEC_INACCESSIBLE = 2151809043_u32
  EAP_E_EAPHOST_IDENTITY_UNKNOWN = 2151809044_u32
  EAP_E_AUTHENTICATION_FAILED = 2151809045_u32
  EAP_I_EAPHOST_EAP_NEGOTIATION_FAILED = 1078067222_u32
  EAP_E_EAPHOST_METHOD_INVALID_PACKET = 2151809047_u32
  EAP_E_EAPHOST_REMOTE_INVALID_PACKET = 2151809048_u32
  EAP_E_EAPHOST_XML_MALFORMED = 2151809049_u32
  EAP_E_METHOD_CONFIG_DOES_NOT_SUPPORT_SSO = 2151809050_u32
  EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED = 2151809056_u32
  EAP_E_USER_FIRST = -2143158016_i32
  EAP_E_USER_LAST = -2143157761_i32
  EAP_I_USER_FIRST = 1078067456_i32
  EAP_I_USER_LAST = 1078067711_i32
  EAP_E_USER_CERT_NOT_FOUND = 2151809280_u32
  EAP_E_USER_CERT_INVALID = 2151809281_u32
  EAP_E_USER_CERT_EXPIRED = 2151809282_u32
  EAP_E_USER_CERT_REVOKED = 2151809283_u32
  EAP_E_USER_CERT_OTHER_ERROR = 2151809284_u32
  EAP_E_USER_CERT_REJECTED = 2151809285_u32
  EAP_I_USER_ACCOUNT_OTHER_ERROR = 1078067472_u32
  EAP_E_USER_CREDENTIALS_REJECTED = 2151809297_u32
  EAP_E_USER_NAME_PASSWORD_REJECTED = 2151809298_u32
  EAP_E_NO_SMART_CARD_READER = 2151809299_u32
  EAP_E_SERVER_FIRST = -2143157760_i32
  EAP_E_SERVER_LAST = -2143157505_i32
  EAP_E_SERVER_CERT_NOT_FOUND = 2151809536_u32
  EAP_E_SERVER_CERT_INVALID = 2151809537_u32
  EAP_E_SERVER_CERT_EXPIRED = 2151809538_u32
  EAP_E_SERVER_CERT_REVOKED = 2151809539_u32
  EAP_E_SERVER_CERT_OTHER_ERROR = 2151809540_u32
  EAP_E_USER_ROOT_CERT_FIRST = -2143157504_i32
  EAP_E_USER_ROOT_CERT_LAST = -2143157249_i32
  EAP_E_USER_ROOT_CERT_NOT_FOUND = 2151809792_u32
  EAP_E_USER_ROOT_CERT_INVALID = 2151809793_u32
  EAP_E_USER_ROOT_CERT_EXPIRED = 2151809794_u32
  EAP_E_SERVER_ROOT_CERT_FIRST = -2143157248_i32
  EAP_E_SERVER_ROOT_CERT_LAST = -2143156993_i32
  EAP_E_SERVER_ROOT_CERT_NOT_FOUND = 2151810048_u32
  EAP_E_SERVER_ROOT_CERT_INVALID = 2151810049_u32
  EAP_E_SERVER_ROOT_CERT_NAME_REQUIRED = 2151810054_u32
  EAP_E_SIM_NOT_VALID = 2151810304_u32
  EAP_METHOD_INVALID_PACKET = 2151809047_u32
  EAP_INVALID_PACKET = 2151809048_u32
  EAP_PEER_FLAG_GUEST_ACCESS = 64_u32
  Eappropciphersuitenegotiation = 1_u32
  Eappropmutualauth = 2_u32
  Eappropintegrity = 4_u32
  Eappropreplayprotection = 8_u32
  Eappropconfidentiality = 16_u32
  Eappropkeyderivation = 32_u32
  Eappropkeystrength64 = 64_u32
  Eappropkeystrength128 = 128_u32
  Eappropkeystrength256 = 256_u32
  Eappropkeystrength512 = 512_u32
  Eappropkeystrength1024 = 1024_u32
  Eappropdictionaryattackresistance = 2048_u32
  Eappropfastreconnect = 4096_u32
  Eappropcryptobinding = 8192_u32
  Eappropsessionindependence = 16384_u32
  Eappropfragmentation = 32768_u32
  Eappropchannelbinding = 65536_u32
  Eappropnap = 131072_u32
  Eappropstandalone = 262144_u32
  Eappropmppeencryption = 524288_u32
  Eapproptunnelmethod = 1048576_u32
  Eappropsupportsconfig = 2097152_u32
  Eappropcertifiedmethod = 4194304_u32
  Eapprophiddenmethod = 8388608_u32
  Eappropmachineauth = 16777216_u32
  Eappropuserauth = 33554432_u32
  Eappropidentityprivacy = 67108864_u32
  Eappropmethodchaining = 134217728_u32
  Eappropsharedstateequivalence = 268435456_u32
  Eappropreserved = 2147483648_u32
  EAP_VALUENAME_PROPERTIES = "Properties"
  EAP_FLAG_Reserved1 = 1_u32
  EAP_FLAG_NON_INTERACTIVE = 2_u32
  EAP_FLAG_LOGON = 4_u32
  EAP_FLAG_PREVIEW = 8_u32
  EAP_FLAG_Reserved2 = 16_u32
  EAP_FLAG_MACHINE_AUTH = 32_u32
  EAP_FLAG_GUEST_ACCESS = 64_u32
  EAP_FLAG_Reserved3 = 128_u32
  EAP_FLAG_Reserved4 = 256_u32
  EAP_FLAG_RESUME_FROM_HIBERNATE = 512_u32
  EAP_FLAG_Reserved5 = 1024_u32
  EAP_FLAG_Reserved6 = 2048_u32
  EAP_FLAG_FULL_AUTH = 4096_u32
  EAP_FLAG_PREFER_ALT_CREDENTIALS = 8192_u32
  EAP_FLAG_Reserved7 = 16384_u32
  EAP_PEER_FLAG_HEALTH_STATE_CHANGE = 32768_u32
  EAP_FLAG_SUPRESS_UI = 65536_u32
  EAP_FLAG_PRE_LOGON = 131072_u32
  EAP_FLAG_USER_AUTH = 262144_u32
  EAP_FLAG_CONFG_READONLY = 524288_u32
  EAP_FLAG_Reserved8 = 1048576_u32
  EAP_FLAG_Reserved9 = 4194304_u32
  EAP_FLAG_VPN = 8388608_u32
  EAP_FLAG_ONLY_EAP_TLS = 16777216_u32
  EAP_FLAG_SERVER_VALIDATION_REQUIRED = 33554432_u32
  EAP_CONFIG_INPUT_FIELD_PROPS_DEFAULT = 0_u32
  EAP_CONFIG_INPUT_FIELD_PROPS_NON_DISPLAYABLE = 1_u32
  EAP_CONFIG_INPUT_FIELD_PROPS_NON_PERSIST = 2_u32
  EAP_UI_INPUT_FIELD_PROPS_DEFAULT = 0_u32
  EAP_UI_INPUT_FIELD_PROPS_NON_DISPLAYABLE = 1_u32
  EAP_UI_INPUT_FIELD_PROPS_NON_PERSIST = 2_u32
  EAP_UI_INPUT_FIELD_PROPS_READ_ONLY = 4_u32
  EAP_CREDENTIAL_VERSION = 1_u32
  EAP_INTERACTIVE_UI_DATA_VERSION = 1_u32
  EAPHOST_PEER_API_VERSION = 1_u32
  EAPHOST_METHOD_API_VERSION = 1_u32
  MAX_EAP_CONFIG_INPUT_FIELD_LENGTH = 256_u32
  MAX_EAP_CONFIG_INPUT_FIELD_VALUE_LENGTH = 1024_u32
  CERTIFICATE_HASH_LENGTH = 20_u32
  NCRYPT_PIN_CACHE_PIN_BYTE_LENGTH = 90_u32
  EAP_REGISTRY_LOCATION = "System\\CurrentControlSet\\Services\\EapHost\\Methods"
  EAP_PEER_VALUENAME_DLL_PATH = "PeerDllPath"
  EAP_PEER_VALUENAME_FRIENDLY_NAME = "PeerFriendlyName"
  EAP_PEER_VALUENAME_CONFIGUI = "PeerConfigUIPath"
  EAP_PEER_VALUENAME_REQUIRE_CONFIGUI = "PeerRequireConfigUI"
  EAP_PEER_VALUENAME_IDENTITY = "PeerIdentityPath"
  EAP_PEER_VALUENAME_INTERACTIVEUI = "PeerInteractiveUIPath"
  EAP_PEER_VALUENAME_INVOKE_NAMEDLG = "PeerInvokeUsernameDialog"
  EAP_PEER_VALUENAME_INVOKE_PWDDLG = "PeerInvokePasswordDialog"
  EAP_PEER_VALUENAME_PROPERTIES = "Properties"
  EAP_AUTHENTICATOR_VALUENAME_DLL_PATH = "AuthenticatorDllPath"
  EAP_AUTHENTICATOR_VALUENAME_FRIENDLY_NAME = "AuthenticatorFriendlyName"
  EAP_AUTHENTICATOR_VALUENAME_PROPERTIES = "Properties"
  EAP_AUTHENTICATOR_VALUENAME_CONFIGUI = "AuthenticatorConfigUIPath"
  EAP_METHOD_AUTHENTICATOR_CONFIG_IS_IDENTITY_PRIVACY = 1_u32
  RAS_EAP_REGISTRY_LOCATION = "System\\CurrentControlSet\\Services\\Rasman\\PPP\\EAP"
  RAS_EAP_VALUENAME_PATH = "Path"
  RAS_EAP_VALUENAME_CONFIGUI = "ConfigUIPath"
  RAS_EAP_VALUENAME_INTERACTIVEUI = "InteractiveUIPath"
  RAS_EAP_VALUENAME_IDENTITY = "IdentityPath"
  RAS_EAP_VALUENAME_FRIENDLY_NAME = "FriendlyName"
  RAS_EAP_VALUENAME_DEFAULT_DATA = "ConfigData"
  RAS_EAP_VALUENAME_REQUIRE_CONFIGUI = "RequireConfigUI"
  RAS_EAP_VALUENAME_ENCRYPTION = "MPPEEncryptionSupported"
  RAS_EAP_VALUENAME_INVOKE_NAMEDLG = "InvokeUsernameDialog"
  RAS_EAP_VALUENAME_INVOKE_PWDDLG = "InvokePasswordDialog"
  RAS_EAP_VALUENAME_CONFIG_CLSID = "ConfigCLSID"
  RAS_EAP_VALUENAME_STANDALONE_SUPPORTED = "StandaloneSupported"
  RAS_EAP_VALUENAME_ROLES_SUPPORTED = "RolesSupported"
  RAS_EAP_VALUENAME_PER_POLICY_CONFIG = "PerPolicyConfig"
  RAS_EAP_VALUENAME_ISTUNNEL_METHOD = "IsTunnelMethod"
  RAS_EAP_VALUENAME_FILTER_INNERMETHODS = "FilterInnerMethods"
  RAS_EAP_ROLE_AUTHENTICATOR = 1_u32
  RAS_EAP_ROLE_AUTHENTICATEE = 2_u32
  RAS_EAP_ROLE_EXCLUDE_IN_EAP = 4_u32
  RAS_EAP_ROLE_EXCLUDE_IN_PEAP = 8_u32
  RAS_EAP_ROLE_EXCLUDE_IN_VPN = 16_u32
  Raatarapchallenge = 33_u32
  Raatarapoldpassword = 19_u32
  Raatarapnewpassword = 20_u32
  Raatarappasswordchangereason = 21_u32
  EAPCODE_Request = 1_u32
  EAPCODE_Response = 2_u32
  EAPCODE_Success = 3_u32
  EAPCODE_Failure = 4_u32
  MAXEAPCODE = 4_u32
  RAS_EAP_FLAG_ROUTER = 1_u32
  RAS_EAP_FLAG_NON_INTERACTIVE = 2_u32
  RAS_EAP_FLAG_LOGON = 4_u32
  RAS_EAP_FLAG_PREVIEW = 8_u32
  RAS_EAP_FLAG_FIRST_LINK = 16_u32
  RAS_EAP_FLAG_MACHINE_AUTH = 32_u32
  RAS_EAP_FLAG_GUEST_ACCESS = 64_u32
  RAS_EAP_FLAG_8021X_AUTH = 128_u32
  RAS_EAP_FLAG_HOSTED_IN_PEAP = 256_u32
  RAS_EAP_FLAG_RESUME_FROM_HIBERNATE = 512_u32
  RAS_EAP_FLAG_PEAP_UPFRONT = 1024_u32
  RAS_EAP_FLAG_ALTERNATIVE_USER_DB = 2048_u32
  RAS_EAP_FLAG_PEAP_FORCE_FULL_AUTH = 4096_u32
  RAS_EAP_FLAG_PRE_LOGON = 131072_u32
  RAS_EAP_FLAG_CONFG_READONLY = 524288_u32
  RAS_EAP_FLAG_RESERVED = 1048576_u32
  RAS_EAP_FLAG_SAVE_CREDMAN = 2097152_u32
  RAS_EAP_FLAG_SERVER_VALIDATION_REQUIRED = 33554432_u32
  GUID_EapHost_Default = "00000000-0000-0000-0000-000000000000"
  GUID_EapHost_Cause_MethodDLLNotFound = "9612fc67-6150-4209-a85e-a8d800000001"
  GUID_EapHost_Repair_ContactSysadmin = "9612fc67-6150-4209-a85e-a8d800000002"
  GUID_EapHost_Cause_CertStoreInaccessible = "9612fc67-6150-4209-a85e-a8d800000004"
  GUID_EapHost_Cause_Generic_AuthFailure = "9612fc67-6150-4209-a85e-a8d800000104"
  GUID_EapHost_Cause_IdentityUnknown = "9612fc67-6150-4209-a85e-a8d800000204"
  GUID_EapHost_Cause_SimNotValid = "9612fc67-6150-4209-a85e-a8d800000304"
  GUID_EapHost_Cause_Server_CertExpired = "9612fc67-6150-4209-a85e-a8d800000005"
  GUID_EapHost_Cause_Server_CertInvalid = "9612fc67-6150-4209-a85e-a8d800000006"
  GUID_EapHost_Cause_Server_CertNotFound = "9612fc67-6150-4209-a85e-a8d800000007"
  GUID_EapHost_Cause_Server_CertRevoked = "9612fc67-6150-4209-a85e-a8d800000008"
  GUID_EapHost_Cause_Server_CertOtherError = "9612fc67-6150-4209-a85e-a8d800000108"
  GUID_EapHost_Cause_User_CertExpired = "9612fc67-6150-4209-a85e-a8d800000009"
  GUID_EapHost_Cause_User_CertInvalid = "9612fc67-6150-4209-a85e-a8d80000000a"
  GUID_EapHost_Cause_User_CertNotFound = "9612fc67-6150-4209-a85e-a8d80000000b"
  GUID_EapHost_Cause_User_CertOtherError = "9612fc67-6150-4209-a85e-a8d80000000c"
  GUID_EapHost_Cause_User_CertRejected = "9612fc67-6150-4209-a85e-a8d80000000d"
  GUID_EapHost_Cause_User_CertRevoked = "9612fc67-6150-4209-a85e-a8d80000000e"
  GUID_EapHost_Cause_User_Account_OtherProblem = "9612fc67-6150-4209-a85e-a8d80000010e"
  GUID_EapHost_Cause_User_CredsRejected = "9612fc67-6150-4209-a85e-a8d80000020e"
  GUID_EapHost_Cause_User_Root_CertExpired = "9612fc67-6150-4209-a85e-a8d80000000f"
  GUID_EapHost_Cause_User_Root_CertInvalid = "9612fc67-6150-4209-a85e-a8d800000010"
  GUID_EapHost_Cause_User_Root_CertNotFound = "9612fc67-6150-4209-a85e-a8d800000011"
  GUID_EapHost_Cause_Server_Root_CertNameRequired = "9612fc67-6150-4209-a85e-a8d800000012"
  GUID_EapHost_Cause_Server_Root_CertNotFound = "9612fc67-6150-4209-a85e-a8d800000112"
  GUID_EapHost_Cause_ThirdPartyMethod_Host_Reset = "9612fc67-6150-4209-a85e-a8d800000212"
  GUID_EapHost_Cause_EapQecInaccessible = "9612fc67-6150-4209-a85e-a8d800000312"
  GUID_EapHost_Repair_Server_ClientSelectServerCert = "9612fc67-6150-4209-a85e-a8d800000018"
  GUID_EapHost_Repair_User_AuthFailure = "9612fc67-6150-4209-a85e-a8d800000019"
  GUID_EapHost_Repair_User_GetNewCert = "9612fc67-6150-4209-a85e-a8d80000001a"
  GUID_EapHost_Repair_User_SelectValidCert = "9612fc67-6150-4209-a85e-a8d80000001b"
  GUID_EapHost_Repair_Retry_Authentication = "9612fc67-6150-4209-a85e-a8d80000011b"
  GUID_EapHost_Cause_EapNegotiationFailed = "9612fc67-6150-4209-a85e-a8d80000001c"
  GUID_EapHost_Cause_XmlMalformed = "9612fc67-6150-4209-a85e-a8d80000001d"
  GUID_EapHost_Cause_MethodDoesNotSupportOperation = "9612fc67-6150-4209-a85e-a8d80000001e"
  GUID_EapHost_Repair_ContactAdmin_AuthFailure = "9612fc67-6150-4209-a85e-a8d80000001f"
  GUID_EapHost_Repair_ContactAdmin_IdentityUnknown = "9612fc67-6150-4209-a85e-a8d800000020"
  GUID_EapHost_Repair_ContactAdmin_NegotiationFailed = "9612fc67-6150-4209-a85e-a8d800000021"
  GUID_EapHost_Repair_ContactAdmin_MethodNotFound = "9612fc67-6150-4209-a85e-a8d800000022"
  GUID_EapHost_Repair_RestartNap = "9612fc67-6150-4209-a85e-a8d800000023"
  GUID_EapHost_Repair_ContactAdmin_CertStoreInaccessible = "9612fc67-6150-4209-a85e-a8d800000024"
  GUID_EapHost_Repair_ContactAdmin_InvalidUserAccount = "9612fc67-6150-4209-a85e-a8d800000025"
  GUID_EapHost_Repair_ContactAdmin_RootCertInvalid = "9612fc67-6150-4209-a85e-a8d800000026"
  GUID_EapHost_Repair_ContactAdmin_RootCertNotFound = "9612fc67-6150-4209-a85e-a8d800000027"
  GUID_EapHost_Repair_ContactAdmin_RootExpired = "9612fc67-6150-4209-a85e-a8d800000028"
  GUID_EapHost_Repair_ContactAdmin_CertNameAbsent = "9612fc67-6150-4209-a85e-a8d800000029"
  GUID_EapHost_Repair_ContactAdmin_NoSmartCardReader = "9612fc67-6150-4209-a85e-a8d80000002a"
  GUID_EapHost_Cause_No_SmartCardReader_Found = "9612fc67-6150-4209-a85e-a8d80000002b"
  GUID_EapHost_Repair_ContactAdmin_InvalidUserCert = "9612fc67-6150-4209-a85e-a8d80000002c"
  GUID_EapHost_Repair_Method_Not_Support_Sso = "9612fc67-6150-4209-a85e-a8d80000002d"
  GUID_EapHost_Repair_No_ValidSim_Found = "9612fc67-6150-4209-a85e-a8d80000002e"
  GUID_EapHost_Help_ObtainingCerts = "f535eea3-1bdd-46ca-a2fc-a6655939b7e8"
  GUID_EapHost_Help_Troubleshooting = "33307acf-0698-41ba-b014-ea0a2eb8d0a8"
  GUID_EapHost_Cause_Method_Config_Does_Not_Support_Sso = "da18bd32-004f-41fa-ae08-0bc85e5845ac"

  enum RAS_AUTH_ATTRIBUTE_TYPE
    Raatminimum = 0_i32
    Raatusername = 1_i32
    Raatuserpassword = 2_i32
    Raatmd5chappassword = 3_i32
    Raatnasipaddress = 4_i32
    Raatnasport = 5_i32
    Raatservicetype = 6_i32
    Raatframedprotocol = 7_i32
    Raatframedipaddress = 8_i32
    Raatframedipnetmask = 9_i32
    Raatframedrouting = 10_i32
    Raatfilterid = 11_i32
    Raatframedmtu = 12_i32
    Raatframedcompression = 13_i32
    Raatloginiphost = 14_i32
    Raatloginservice = 15_i32
    Raatlogintcpport = 16_i32
    Raatunassigned17 = 17_i32
    Raatreplymessage = 18_i32
    Raatcallbacknumber = 19_i32
    Raatcallbackid = 20_i32
    Raatunassigned21 = 21_i32
    Raatframedroute = 22_i32
    Raatframedipxnetwork = 23_i32
    Raatstate = 24_i32
    Raatclass = 25_i32
    Raatvendorspecific = 26_i32
    Raatsessiontimeout = 27_i32
    Raatidletimeout = 28_i32
    Raatterminationaction = 29_i32
    Raatcalledstationid = 30_i32
    Raatcallingstationid = 31_i32
    Raatnasidentifier = 32_i32
    Raatproxystate = 33_i32
    Raatloginlatservice = 34_i32
    Raatloginlatnode = 35_i32
    Raatloginlatgroup = 36_i32
    Raatframedappletalklink = 37_i32
    Raatframedappletalknetwork = 38_i32
    Raatframedappletalkzone = 39_i32
    Raatacctstatustype = 40_i32
    Raatacctdelaytime = 41_i32
    Raatacctinputoctets = 42_i32
    Raatacctoutputoctets = 43_i32
    Raatacctsessionid = 44_i32
    Raatacctauthentic = 45_i32
    Raatacctsessiontime = 46_i32
    Raatacctinputpackets = 47_i32
    Raatacctoutputpackets = 48_i32
    Raatacctterminatecause = 49_i32
    Raatacctmultisessionid = 50_i32
    Raatacctlinkcount = 51_i32
    Raataccteventtimestamp = 55_i32
    Raatmd5chapchallenge = 60_i32
    Raatnasporttype = 61_i32
    Raatportlimit = 62_i32
    Raatloginlatport = 63_i32
    Raattunneltype = 64_i32
    Raattunnelmediumtype = 65_i32
    Raattunnelclientendpoint = 66_i32
    Raattunnelserverendpoint = 67_i32
    Raatarappassword = 70_i32
    Raatarapfeatures = 71_i32
    Raatarapzoneaccess = 72_i32
    Raatarapsecurity = 73_i32
    Raatarapsecuritydata = 74_i32
    Raatpasswordretry = 75_i32
    Raatprompt = 76_i32
    Raatconnectinfo = 77_i32
    Raatconfigurationtoken = 78_i32
    Raateapmessage = 79_i32
    Raatsignature = 80_i32
    Raatarapchallengeresponse = 84_i32
    Raatacctinteriminterval = 85_i32
    Raatnasipv6address = 95_i32
    Raatframedinterfaceid = 96_i32
    Raatframedipv6prefix = 97_i32
    Raatloginipv6host = 98_i32
    Raatframedipv6route = 99_i32
    Raatframedipv6pool = 100_i32
    Raatarapguestlogon = 8096_i32
    Raatcertificateoid = 8097_i32
    Raateapconfiguration = 8098_i32
    Raatpeapembeddedeaptypeid = 8099_i32
    Raatinnereaptypeid = 8099_i32
    Raatpeapfastroamedsession = 8100_i32
    Raatfastroamedsession = 8100_i32
    Raateaptlv = 8102_i32
    Raatcredentialschanged = 8103_i32
    Raatcertificatethumbprint = 8250_i32
    Raatpeerid = 9000_i32
    Raatserverid = 9001_i32
    Raatmethodid = 9002_i32
    Raatemsk = 9003_i32
    Raatsessionid = 9004_i32
    Raatreserved = -1_i32
  end
  enum PPP_EAP_ACTION
    EAPACTION_NoAction = 0_i32
    EAPACTION_Authenticate = 1_i32
    EAPACTION_Done = 2_i32
    EAPACTION_SendAndDone = 3_i32
    EAPACTION_Send = 4_i32
    EAPACTION_SendWithTimeout = 5_i32
    EAPACTION_SendWithTimeoutInteractive = 6_i32
    EAPACTION_IndicateTLV = 7_i32
    EAPACTION_IndicateIdentity = 8_i32
  end
  enum EAP_ATTRIBUTE_TYPE
    Eatminimum = 0_i32
    Eatusername = 1_i32
    Eatuserpassword = 2_i32
    Eatmd5chappassword = 3_i32
    Eatnasipaddress = 4_i32
    Eatnasport = 5_i32
    Eatservicetype = 6_i32
    Eatframedprotocol = 7_i32
    Eatframedipaddress = 8_i32
    Eatframedipnetmask = 9_i32
    Eatframedrouting = 10_i32
    Eatfilterid = 11_i32
    Eatframedmtu = 12_i32
    Eatframedcompression = 13_i32
    Eatloginiphost = 14_i32
    Eatloginservice = 15_i32
    Eatlogintcpport = 16_i32
    Eatunassigned17 = 17_i32
    Eatreplymessage = 18_i32
    Eatcallbacknumber = 19_i32
    Eatcallbackid = 20_i32
    Eatunassigned21 = 21_i32
    Eatframedroute = 22_i32
    Eatframedipxnetwork = 23_i32
    Eatstate = 24_i32
    Eatclass = 25_i32
    Eatvendorspecific = 26_i32
    Eatsessiontimeout = 27_i32
    Eatidletimeout = 28_i32
    Eatterminationaction = 29_i32
    Eatcalledstationid = 30_i32
    Eatcallingstationid = 31_i32
    Eatnasidentifier = 32_i32
    Eatproxystate = 33_i32
    Eatloginlatservice = 34_i32
    Eatloginlatnode = 35_i32
    Eatloginlatgroup = 36_i32
    Eatframedappletalklink = 37_i32
    Eatframedappletalknetwork = 38_i32
    Eatframedappletalkzone = 39_i32
    Eatacctstatustype = 40_i32
    Eatacctdelaytime = 41_i32
    Eatacctinputoctets = 42_i32
    Eatacctoutputoctets = 43_i32
    Eatacctsessionid = 44_i32
    Eatacctauthentic = 45_i32
    Eatacctsessiontime = 46_i32
    Eatacctinputpackets = 47_i32
    Eatacctoutputpackets = 48_i32
    Eatacctterminatecause = 49_i32
    Eatacctmultisessionid = 50_i32
    Eatacctlinkcount = 51_i32
    Eataccteventtimestamp = 55_i32
    Eatmd5chapchallenge = 60_i32
    Eatnasporttype = 61_i32
    Eatportlimit = 62_i32
    Eatloginlatport = 63_i32
    Eattunneltype = 64_i32
    Eattunnelmediumtype = 65_i32
    Eattunnelclientendpoint = 66_i32
    Eattunnelserverendpoint = 67_i32
    Eatarappassword = 70_i32
    Eatarapfeatures = 71_i32
    Eatarapzoneaccess = 72_i32
    Eatarapsecurity = 73_i32
    Eatarapsecuritydata = 74_i32
    Eatpasswordretry = 75_i32
    Eatprompt = 76_i32
    Eatconnectinfo = 77_i32
    Eatconfigurationtoken = 78_i32
    Eateapmessage = 79_i32
    Eatsignature = 80_i32
    Eatarapchallengeresponse = 84_i32
    Eatacctinteriminterval = 85_i32
    Eatnasipv6address = 95_i32
    Eatframedinterfaceid = 96_i32
    Eatframedipv6prefix = 97_i32
    Eatloginipv6host = 98_i32
    Eatframedipv6route = 99_i32
    Eatframedipv6pool = 100_i32
    Eatarapguestlogon = 8096_i32
    Eatcertificateoid = 8097_i32
    Eateapconfiguration = 8098_i32
    Eatpeapembeddedeaptypeid = 8099_i32
    Eatpeapfastroamedsession = 8100_i32
    Eatfastroamedsession = 8100_i32
    Eateaptlv = 8102_i32
    Eatcredentialschanged = 8103_i32
    Eatinnereapmethodtype = 8104_i32
    Eatcleartextpassword = 8107_i32
    Eatquarantinesoh = 8150_i32
    Eatcertificatethumbprint = 8250_i32
    Eatpeerid = 9000_i32
    Eatserverid = 9001_i32
    Eatmethodid = 9002_i32
    Eatemsk = 9003_i32
    Eatsessionid = 9004_i32
    Eatreserved = -1_i32
  end
  enum EAP_CONFIG_INPUT_FIELD_TYPE
    EapConfigInputUsername = 0_i32
    EapConfigInputPassword = 1_i32
    EapConfigInputNetworkUsername = 2_i32
    EapConfigInputNetworkPassword = 3_i32
    EapConfigInputPin = 4_i32
    EapConfigInputPSK = 5_i32
    EapConfigInputEdit = 6_i32
    EapConfigSmartCardUsername = 7_i32
    EapConfigSmartCardError = 8_i32
  end
  enum EAP_INTERACTIVE_UI_DATA_TYPE
    EapCredReq = 0_i32
    EapCredResp = 1_i32
    EapCredExpiryReq = 2_i32
    EapCredExpiryResp = 3_i32
    EapCredLogonReq = 4_i32
    EapCredLogonResp = 5_i32
  end
  enum EAP_METHOD_PROPERTY_TYPE
    Emptpropciphersuitenegotiation = 0_i32
    Emptpropmutualauth = 1_i32
    Emptpropintegrity = 2_i32
    Emptpropreplayprotection = 3_i32
    Emptpropconfidentiality = 4_i32
    Emptpropkeyderivation = 5_i32
    Emptpropkeystrength64 = 6_i32
    Emptpropkeystrength128 = 7_i32
    Emptpropkeystrength256 = 8_i32
    Emptpropkeystrength512 = 9_i32
    Emptpropkeystrength1024 = 10_i32
    Emptpropdictionaryattackresistance = 11_i32
    Emptpropfastreconnect = 12_i32
    Emptpropcryptobinding = 13_i32
    Emptpropsessionindependence = 14_i32
    Emptpropfragmentation = 15_i32
    Emptpropchannelbinding = 16_i32
    Emptpropnap = 17_i32
    Emptpropstandalone = 18_i32
    Emptpropmppeencryption = 19_i32
    Emptproptunnelmethod = 20_i32
    Emptpropsupportsconfig = 21_i32
    Emptpropcertifiedmethod = 22_i32
    Emptprophiddenmethod = 23_i32
    Emptpropmachineauth = 24_i32
    Emptpropuserauth = 25_i32
    Emptpropidentityprivacy = 26_i32
    Emptpropmethodchaining = 27_i32
    Emptpropsharedstateequivalence = 28_i32
    Emptlegacymethodpropertyflag = 31_i32
    Emptpropvendorspecific = 255_i32
  end
  enum EAP_METHOD_PROPERTY_VALUE_TYPE
    Empvtbool = 0_i32
    Empvtdword = 1_i32
    Empvtstring = 2_i32
  end
  enum EapCredentialType
    EAP_EMPTY_CREDENTIAL = 0_i32
    EAP_USERNAME_PASSWORD_CREDENTIAL = 1_i32
    EAP_WINLOGON_CREDENTIAL = 2_i32
    EAP_CERTIFICATE_CREDENTIAL = 3_i32
    EAP_SIM_CREDENTIAL = 4_i32
  end
  enum EapHostPeerMethodResultReason
    EapHostPeerMethodResultAltSuccessReceived = 1_i32
    EapHostPeerMethodResultTimeout = 2_i32
    EapHostPeerMethodResultFromMethod = 3_i32
  end
  enum EapHostPeerResponseAction
    EapHostPeerResponseDiscard = 0_i32
    EapHostPeerResponseSend = 1_i32
    EapHostPeerResponseResult = 2_i32
    EapHostPeerResponseInvokeUi = 3_i32
    EapHostPeerResponseRespond = 4_i32
    EapHostPeerResponseStartAuthentication = 5_i32
    EapHostPeerResponseNone = 6_i32
  end
  enum EapHostPeerAuthParams
    EapHostPeerAuthStatus = 1_i32
    EapHostPeerIdentity = 2_i32
    EapHostPeerIdentityExtendedInfo = 3_i32
    EapHostNapInfo = 4_i32
  end
  enum EAPHOST_AUTH_STATUS
    EapHostInvalidSession = 0_i32
    EapHostAuthNotStarted = 1_i32
    EapHostAuthIdentityExchange = 2_i32
    EapHostAuthNegotiatingType = 3_i32
    EapHostAuthInProgress = 4_i32
    EapHostAuthSucceeded = 5_i32
    EapHostAuthFailed = 6_i32
  end
  enum ISOLATION_STATE
    ISOLATION_STATE_UNKNOWN = 0_i32
    ISOLATION_STATE_NOT_RESTRICTED = 1_i32
    ISOLATION_STATE_IN_PROBATION = 2_i32
    ISOLATION_STATE_RESTRICTED_ACCESS = 3_i32
  end
  enum EapCode
    EapCodeMinimum = 1_i32
    EapCodeRequest = 1_i32
    EapCodeResponse = 2_i32
    EapCodeSuccess = 3_i32
    EapCodeFailure = 4_i32
    EapCodeMaximum = 4_i32
  end
  enum EAP_METHOD_AUTHENTICATOR_RESPONSE_ACTION
    EAP_METHOD_AUTHENTICATOR_RESPONSE_DISCARD = 0_i32
    EAP_METHOD_AUTHENTICATOR_RESPONSE_SEND = 1_i32
    EAP_METHOD_AUTHENTICATOR_RESPONSE_RESULT = 2_i32
    EAP_METHOD_AUTHENTICATOR_RESPONSE_RESPOND = 3_i32
    EAP_METHOD_AUTHENTICATOR_RESPONSE_AUTHENTICATE = 4_i32
    EAP_METHOD_AUTHENTICATOR_RESPONSE_HANDLE_IDENTITY = 5_i32
  end
  enum EapPeerMethodResponseAction
    EapPeerMethodResponseActionDiscard = 0_i32
    EapPeerMethodResponseActionSend = 1_i32
    EapPeerMethodResponseActionResult = 2_i32
    EapPeerMethodResponseActionInvokeUI = 3_i32
    EapPeerMethodResponseActionRespond = 4_i32
    EapPeerMethodResponseActionNone = 5_i32
  end
  enum EapPeerMethodResultReason
    EapPeerMethodResultUnknown = 1_i32
    EapPeerMethodResultSuccess = 2_i32
    EapPeerMethodResultFailure = 3_i32
  end
  enum EAP_AUTHENTICATOR_SEND_TIMEOUT
    EAP_AUTHENTICATOR_SEND_TIMEOUT_NONE = 0_i32
    EAP_AUTHENTICATOR_SEND_TIMEOUT_BASIC = 1_i32
    EAP_AUTHENTICATOR_SEND_TIMEOUT_INTERACTIVE = 2_i32
  end

  @[Extern]
  record NgcTicketContext,
    wszTicket : UInt16[45],
    hKey : Win32cr::Security::Cryptography::NCRYPT_KEY_HANDLE,
    hImpersonateToken : Win32cr::Foundation::HANDLE

  @[Extern]
  record RAS_AUTH_ATTRIBUTE,
    raaType : Win32cr::Security::ExtensibleAuthenticationProtocol::RAS_AUTH_ATTRIBUTE_TYPE,
    dwLength : UInt32,
    value : Void*

  @[Extern]
  record PPP_EAP_PACKET,
    code : UInt8,
    id : UInt8,
    length : UInt8[2],
    data : UInt8*

  @[Extern]
  record PPP_EAP_INPUT,
    dwSizeInBytes : UInt32,
    fFlags : UInt32,
    fAuthenticator : Win32cr::Foundation::BOOL,
    pwszIdentity : Win32cr::Foundation::PWSTR,
    pwszPassword : Win32cr::Foundation::PWSTR,
    bInitialId : UInt8,
    pUserAttributes : Win32cr::Security::ExtensibleAuthenticationProtocol::RAS_AUTH_ATTRIBUTE*,
    fAuthenticationComplete : Win32cr::Foundation::BOOL,
    dwAuthResultCode : UInt32,
    hTokenImpersonateUser : Win32cr::Foundation::HANDLE,
    fSuccessPacketReceived : Win32cr::Foundation::BOOL,
    fDataReceivedFromInteractiveUI : Win32cr::Foundation::BOOL,
    pDataFromInteractiveUI : UInt8*,
    dwSizeOfDataFromInteractiveUI : UInt32,
    pConnectionData : UInt8*,
    dwSizeOfConnectionData : UInt32,
    pUserData : UInt8*,
    dwSizeOfUserData : UInt32,
    hReserved : Win32cr::Foundation::HANDLE,
    guidConnectionId : LibC::GUID,
    isVpn : Win32cr::Foundation::BOOL

  @[Extern]
  record PPP_EAP_OUTPUT,
    dwSizeInBytes : UInt32,
    action : Win32cr::Security::ExtensibleAuthenticationProtocol::PPP_EAP_ACTION,
    dwAuthResultCode : UInt32,
    pUserAttributes : Win32cr::Security::ExtensibleAuthenticationProtocol::RAS_AUTH_ATTRIBUTE*,
    fInvokeInteractiveUI : Win32cr::Foundation::BOOL,
    pUIContextData : UInt8*,
    dwSizeOfUIContextData : UInt32,
    fSaveConnectionData : Win32cr::Foundation::BOOL,
    pConnectionData : UInt8*,
    dwSizeOfConnectionData : UInt32,
    fSaveUserData : Win32cr::Foundation::BOOL,
    pUserData : UInt8*,
    dwSizeOfUserData : UInt32,
    pNgcKerbTicket : Win32cr::Security::ExtensibleAuthenticationProtocol::NgcTicketContext*,
    fSaveToCredMan : Win32cr::Foundation::BOOL

  @[Extern]
  record PPP_EAP_INFO,
    dwSizeInBytes : UInt32,
    dwEapTypeId : UInt32,
    ras_eap_initialize : LibC::IntPtrT,
    ras_eap_begin : LibC::IntPtrT,
    ras_eap_end : LibC::IntPtrT,
    ras_eap_make_message : LibC::IntPtrT

  @[Extern]
  record LEGACY_IDENTITY_UI_PARAMS,
    eapType : UInt32,
    dwFlags : UInt32,
    dwSizeofConnectionData : UInt32,
    pConnectionData : UInt8*,
    dwSizeofUserData : UInt32,
    pUserData : UInt8*,
    dwSizeofUserDataOut : UInt32,
    pUserDataOut : UInt8*,
    pwszIdentity : Win32cr::Foundation::PWSTR,
    dwError : UInt32

  @[Extern]
  record LEGACY_INTERACTIVE_UI_PARAMS,
    eapType : UInt32,
    dwSizeofContextData : UInt32,
    pContextData : UInt8*,
    dwSizeofInteractiveUIData : UInt32,
    pInteractiveUIData : UInt8*,
    dwError : UInt32

  @[Extern]
  record EAP_TYPE,
    type__ : UInt8,
    dwVendorId : UInt32,
    dwVendorType : UInt32

  @[Extern]
  record EAP_METHOD_TYPE,
    eapType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_TYPE,
    dwAuthorId : UInt32

  @[Extern]
  record EAP_METHOD_INFO,
    eaptype : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE,
    pwszAuthorName : Win32cr::Foundation::PWSTR,
    pwszFriendlyName : Win32cr::Foundation::PWSTR,
    eapProperties : UInt32,
    pInnerMethodInfo : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_INFO*

  @[Extern]
  record EAP_METHOD_INFO_EX,
    eaptype : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE,
    pwszAuthorName : Win32cr::Foundation::PWSTR,
    pwszFriendlyName : Win32cr::Foundation::PWSTR,
    eapProperties : UInt32,
    pInnerMethodInfoArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_INFO_ARRAY_EX*

  @[Extern]
  record EAP_METHOD_INFO_ARRAY,
    dwNumberOfMethods : UInt32,
    pEapMethods : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_INFO*

  @[Extern]
  record EAP_METHOD_INFO_ARRAY_EX,
    dwNumberOfMethods : UInt32,
    pEapMethods : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_INFO_EX*

  @[Extern]
  record EAP_ERROR,
    dwWinError : UInt32,
    type__ : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE,
    dwReasonCode : UInt32,
    rootCauseGuid : LibC::GUID,
    repairGuid : LibC::GUID,
    helpLinkGuid : LibC::GUID,
    pRootCauseString : Win32cr::Foundation::PWSTR,
    pRepairString : Win32cr::Foundation::PWSTR

  @[Extern]
  record EAP_ATTRIBUTE,
    eaType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTE_TYPE,
    dwLength : UInt32,
    pValue : UInt8*

  @[Extern]
  record EAP_ATTRIBUTES,
    dwNumberOfAttributes : UInt32,
    pAttribs : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTE*

  @[Extern]
  record EAP_CONFIG_INPUT_FIELD_DATA,
    dwSize : UInt32,
    type__ : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_TYPE,
    dwFlagProps : UInt32,
    pwszLabel : Win32cr::Foundation::PWSTR,
    pwszData : Win32cr::Foundation::PWSTR,
    dwMinDataLength : UInt32,
    dwMaxDataLength : UInt32

  @[Extern]
  record EAP_CONFIG_INPUT_FIELD_ARRAY,
    dwVersion : UInt32,
    dwNumberOfFields : UInt32,
    pFields : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_DATA*

  @[Extern]
  record EAP_CRED_EXPIRY_REQ,
    curCreds : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_ARRAY,
    newCreds : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_ARRAY

  @[Extern(union: true)]
  record EAP_UI_DATA_FORMAT,
    credData : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_ARRAY*,
    credExpiryData : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CRED_EXPIRY_REQ*,
    credLogonData : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_ARRAY*

  @[Extern]
  record EAP_INTERACTIVE_UI_DATA,
    dwVersion : UInt32,
    dwSize : UInt32,
    dwDataType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_INTERACTIVE_UI_DATA_TYPE,
    cbUiData : UInt32,
    pbUiData : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_UI_DATA_FORMAT

  @[Extern]
  record EAP_METHOD_PROPERTY_VALUE_BOOL,
    length : UInt32,
    value : Win32cr::Foundation::BOOL

  @[Extern]
  record EAP_METHOD_PROPERTY_VALUE_DWORD,
    length : UInt32,
    value : UInt32

  @[Extern]
  record EAP_METHOD_PROPERTY_VALUE_STRING,
    length : UInt32,
    value : UInt8*

  @[Extern(union: true)]
  record EAP_METHOD_PROPERTY_VALUE,
    empvBool : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY_VALUE_BOOL,
    empvDword : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY_VALUE_DWORD,
    empvString : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY_VALUE_STRING

  @[Extern]
  record EAP_METHOD_PROPERTY,
    eapMethodPropertyType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY_TYPE,
    eapMethodPropertyValueType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY_VALUE_TYPE,
    eapMethodPropertyValue : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY_VALUE

  @[Extern]
  record EAP_METHOD_PROPERTY_ARRAY,
    dwNumberOfProperties : UInt32,
    pMethodProperty : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY*

  @[Extern]
  record EAPHOST_IDENTITY_UI_PARAMS,
    eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE,
    dwFlags : UInt32,
    dwSizeofConnectionData : UInt32,
    pConnectionData : UInt8*,
    dwSizeofUserData : UInt32,
    pUserData : UInt8*,
    dwSizeofUserDataOut : UInt32,
    pUserDataOut : UInt8*,
    pwszIdentity : Win32cr::Foundation::PWSTR,
    dwError : UInt32,
    pEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR*

  @[Extern]
  record EAPHOST_INTERACTIVE_UI_PARAMS,
    dwSizeofContextData : UInt32,
    pContextData : UInt8*,
    dwSizeofInteractiveUIData : UInt32,
    pInteractiveUIData : UInt8*,
    dwError : UInt32,
    pEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR*

  @[Extern]
  record EapUsernamePasswordCredential,
    username : Win32cr::Foundation::PWSTR,
    password : Win32cr::Foundation::PWSTR

  @[Extern]
  record EapCertificateCredential,
    certHash : UInt8[20],
    password : Win32cr::Foundation::PWSTR

  @[Extern]
  record EapSimCredential,
    iccID : Win32cr::Foundation::PWSTR

  @[Extern(union: true)]
  record EapCredentialTypeData,
    username_password : Win32cr::Security::ExtensibleAuthenticationProtocol::EapUsernamePasswordCredential,
    certificate : Win32cr::Security::ExtensibleAuthenticationProtocol::EapCertificateCredential,
    sim : Win32cr::Security::ExtensibleAuthenticationProtocol::EapSimCredential

  @[Extern]
  record EapCredential,
    credType : Win32cr::Security::ExtensibleAuthenticationProtocol::EapCredentialType,
    credData : Win32cr::Security::ExtensibleAuthenticationProtocol::EapCredentialTypeData

  @[Extern]
  record EAPHOST_AUTH_INFO,
    status : Win32cr::Security::ExtensibleAuthenticationProtocol::EAPHOST_AUTH_STATUS,
    dwErrorCode : UInt32,
    dwReasonCode : UInt32

  @[Extern]
  record EapHostPeerMethodResult,
    fIsSuccess : Win32cr::Foundation::BOOL,
    dwFailureReasonCode : UInt32,
    fSaveConnectionData : Win32cr::Foundation::BOOL,
    dwSizeofConnectionData : UInt32,
    pConnectionData : UInt8*,
    fSaveUserData : Win32cr::Foundation::BOOL,
    dwSizeofUserData : UInt32,
    pUserData : UInt8*,
    pAttribArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTES*,
    isolationState : Win32cr::Security::ExtensibleAuthenticationProtocol::ISOLATION_STATE,
    pEapMethodInfo : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_INFO*,
    pEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR*

  @[Extern]
  record EapPacket,
    code : UInt8,
    id : UInt8,
    length : UInt8[2],
    data : UInt8*

  @[Extern]
  record EAP_METHOD_AUTHENTICATOR_RESULT,
    fIsSuccess : Win32cr::Foundation::BOOL,
    dwFailureReason : UInt32,
    pAuthAttribs : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTES*

  @[Extern]
  record EapPeerMethodOutput,
    action : Win32cr::Security::ExtensibleAuthenticationProtocol::EapPeerMethodResponseAction,
    fAllowNotifications : Win32cr::Foundation::BOOL

  @[Extern]
  record EapPeerMethodResult,
    fIsSuccess : Win32cr::Foundation::BOOL,
    dwFailureReasonCode : UInt32,
    fSaveConnectionData : Win32cr::Foundation::BOOL,
    dwSizeofConnectionData : UInt32,
    pConnectionData : UInt8*,
    fSaveUserData : Win32cr::Foundation::BOOL,
    dwSizeofUserData : UInt32,
    pUserData : UInt8*,
    pAttribArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTES*,
    pEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR*,
    pNgcKerbTicket : Win32cr::Security::ExtensibleAuthenticationProtocol::NgcTicketContext*,
    fSaveToCredMan : Win32cr::Foundation::BOOL

  @[Extern]
  record EAP_PEER_METHOD_ROUTINES,
    dwVersion : UInt32,
    pEapType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_TYPE*,
    eap_peer_initialize : LibC::IntPtrT,
    eap_peer_get_identity : LibC::IntPtrT,
    eap_peer_begin_session : LibC::IntPtrT,
    eap_peer_set_credentials : LibC::IntPtrT,
    eap_peer_process_request_packet : LibC::IntPtrT,
    eap_peer_get_response_packet : LibC::IntPtrT,
    eap_peer_get_result : LibC::IntPtrT,
    eap_peer_get_ui_context : LibC::IntPtrT,
    eap_peer_set_ui_context : LibC::IntPtrT,
    eap_peer_get_response_attributes : LibC::IntPtrT,
    eap_peer_set_response_attributes : LibC::IntPtrT,
    eap_peer_end_session : LibC::IntPtrT,
    eap_peer_shutdown : LibC::IntPtrT

  @[Extern]
  record EAP_AUTHENTICATOR_METHOD_ROUTINES,
    dwSizeInBytes : UInt32,
    pEapType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE*,
    eap_method_authenticator_initialize : LibC::IntPtrT,
    eap_method_authenticator_begin_session : LibC::IntPtrT,
    eap_method_authenticator_update_inner_method_params : LibC::IntPtrT,
    eap_method_authenticator_receive_packet : LibC::IntPtrT,
    eap_method_authenticator_send_packet : LibC::IntPtrT,
    eap_method_authenticator_get_attributes : LibC::IntPtrT,
    eap_method_authenticator_set_attributes : LibC::IntPtrT,
    eap_method_authenticator_get_result : LibC::IntPtrT,
    eap_method_authenticator_end_session : LibC::IntPtrT,
    eap_method_authenticator_shutdown : LibC::IntPtrT

  @[Extern]
  record IRouterProtocolConfigVtbl,
    query_interface : Proc(IRouterProtocolConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRouterProtocolConfig*, UInt32),
    release : Proc(IRouterProtocolConfig*, UInt32),
    add_protocol : Proc(IRouterProtocolConfig*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HWND, UInt32, Void*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    remove_protocol : Proc(IRouterProtocolConfig*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HWND, UInt32, Void*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("66a2db16-d706-11d0-a37b-00c04fc9da04")]
  record IRouterProtocolConfig, lpVtbl : IRouterProtocolConfigVtbl* do
    GUID = LibC::GUID.new(0x66a2db16_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
    def query_interface(this : IRouterProtocolConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRouterProtocolConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRouterProtocolConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_protocol(this : IRouterProtocolConfig*, pszMachineName : Win32cr::Foundation::PWSTR, dwTransportId : UInt32, dwProtocolId : UInt32, hWnd : Win32cr::Foundation::HWND, dwFlags : UInt32, pRouter : Void*, uReserved1 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_protocol.call(this, pszMachineName, dwTransportId, dwProtocolId, hWnd, dwFlags, pRouter, uReserved1)
    end
    def remove_protocol(this : IRouterProtocolConfig*, pszMachineName : Win32cr::Foundation::PWSTR, dwTransportId : UInt32, dwProtocolId : UInt32, hWnd : Win32cr::Foundation::HWND, dwFlags : UInt32, pRouter : Void*, uReserved1 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_protocol.call(this, pszMachineName, dwTransportId, dwProtocolId, hWnd, dwFlags, pRouter, uReserved1)
    end

  end

  @[Extern]
  record IAuthenticationProviderConfigVtbl,
    query_interface : Proc(IAuthenticationProviderConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAuthenticationProviderConfig*, UInt32),
    release : Proc(IAuthenticationProviderConfig*, UInt32),
    initialize__ : Proc(IAuthenticationProviderConfig*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IAuthenticationProviderConfig*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    configure : Proc(IAuthenticationProviderConfig*, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    activate : Proc(IAuthenticationProviderConfig*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IAuthenticationProviderConfig*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("66a2db17-d706-11d0-a37b-00c04fc9da04")]
  record IAuthenticationProviderConfig, lpVtbl : IAuthenticationProviderConfigVtbl* do
    GUID = LibC::GUID.new(0x66a2db17_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
    def query_interface(this : IAuthenticationProviderConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAuthenticationProviderConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAuthenticationProviderConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IAuthenticationProviderConfig*, pszMachineName : Win32cr::Foundation::PWSTR, puConnectionParam : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszMachineName, puConnectionParam)
    end
    def uninitialize(this : IAuthenticationProviderConfig*, uConnectionParam : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninitialize.call(this, uConnectionParam)
    end
    def configure(this : IAuthenticationProviderConfig*, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, dwFlags : UInt32, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure.call(this, uConnectionParam, hWnd, dwFlags, uReserved1, uReserved2)
    end
    def activate(this : IAuthenticationProviderConfig*, uConnectionParam : LibC::UIntPtrT, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, uConnectionParam, uReserved1, uReserved2)
    end
    def deactivate(this : IAuthenticationProviderConfig*, uConnectionParam : LibC::UIntPtrT, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this, uConnectionParam, uReserved1, uReserved2)
    end

  end

  @[Extern]
  record IAccountingProviderConfigVtbl,
    query_interface : Proc(IAccountingProviderConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccountingProviderConfig*, UInt32),
    release : Proc(IAccountingProviderConfig*, UInt32),
    initialize__ : Proc(IAccountingProviderConfig*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IAccountingProviderConfig*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    configure : Proc(IAccountingProviderConfig*, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    activate : Proc(IAccountingProviderConfig*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IAccountingProviderConfig*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("66a2db18-d706-11d0-a37b-00c04fc9da04")]
  record IAccountingProviderConfig, lpVtbl : IAccountingProviderConfigVtbl* do
    GUID = LibC::GUID.new(0x66a2db18_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
    def query_interface(this : IAccountingProviderConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccountingProviderConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccountingProviderConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IAccountingProviderConfig*, pszMachineName : Win32cr::Foundation::PWSTR, puConnectionParam : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszMachineName, puConnectionParam)
    end
    def uninitialize(this : IAccountingProviderConfig*, uConnectionParam : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninitialize.call(this, uConnectionParam)
    end
    def configure(this : IAccountingProviderConfig*, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, dwFlags : UInt32, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure.call(this, uConnectionParam, hWnd, dwFlags, uReserved1, uReserved2)
    end
    def activate(this : IAccountingProviderConfig*, uConnectionParam : LibC::UIntPtrT, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, uConnectionParam, uReserved1, uReserved2)
    end
    def deactivate(this : IAccountingProviderConfig*, uConnectionParam : LibC::UIntPtrT, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this, uConnectionParam, uReserved1, uReserved2)
    end

  end

  @[Extern]
  record IEAPProviderConfigVtbl,
    query_interface : Proc(IEAPProviderConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEAPProviderConfig*, UInt32),
    release : Proc(IEAPProviderConfig*, UInt32),
    initialize__ : Proc(IEAPProviderConfig*, Win32cr::Foundation::PWSTR, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IEAPProviderConfig*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    server_invoke_config_ui : Proc(IEAPProviderConfig*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    router_invoke_config_ui : Proc(IEAPProviderConfig*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    router_invoke_credentials_ui : Proc(IEAPProviderConfig*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("66a2db19-d706-11d0-a37b-00c04fc9da04")]
  record IEAPProviderConfig, lpVtbl : IEAPProviderConfigVtbl* do
    GUID = LibC::GUID.new(0x66a2db19_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
    def query_interface(this : IEAPProviderConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEAPProviderConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEAPProviderConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IEAPProviderConfig*, pszMachineName : Win32cr::Foundation::PWSTR, dwEapTypeId : UInt32, puConnectionParam : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszMachineName, dwEapTypeId, puConnectionParam)
    end
    def uninitialize(this : IEAPProviderConfig*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninitialize.call(this, dwEapTypeId, uConnectionParam)
    end
    def server_invoke_config_ui(this : IEAPProviderConfig*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.server_invoke_config_ui.call(this, dwEapTypeId, uConnectionParam, hWnd, uReserved1, uReserved2)
    end
    def router_invoke_config_ui(this : IEAPProviderConfig*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, pConnectionDataIn : UInt8*, dwSizeOfConnectionDataIn : UInt32, ppConnectionDataOut : UInt8**, pdwSizeOfConnectionDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.router_invoke_config_ui.call(this, dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, ppConnectionDataOut, pdwSizeOfConnectionDataOut)
    end
    def router_invoke_credentials_ui(this : IEAPProviderConfig*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, pConnectionDataIn : UInt8*, dwSizeOfConnectionDataIn : UInt32, pUserDataIn : UInt8*, dwSizeOfUserDataIn : UInt32, ppUserDataOut : UInt8**, pdwSizeOfUserDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.router_invoke_credentials_ui.call(this, dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, pUserDataIn, dwSizeOfUserDataIn, ppUserDataOut, pdwSizeOfUserDataOut)
    end

  end

  @[Extern]
  record IEAPProviderConfig2Vtbl,
    query_interface : Proc(IEAPProviderConfig2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEAPProviderConfig2*, UInt32),
    release : Proc(IEAPProviderConfig2*, UInt32),
    initialize__ : Proc(IEAPProviderConfig2*, Win32cr::Foundation::PWSTR, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IEAPProviderConfig2*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    server_invoke_config_ui : Proc(IEAPProviderConfig2*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    router_invoke_config_ui : Proc(IEAPProviderConfig2*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    router_invoke_credentials_ui : Proc(IEAPProviderConfig2*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    server_invoke_config_ui2 : Proc(IEAPProviderConfig2*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_global_config : Proc(IEAPProviderConfig2*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d565917a-85c4-4466-856e-671c3742ea9a")]
  record IEAPProviderConfig2, lpVtbl : IEAPProviderConfig2Vtbl* do
    GUID = LibC::GUID.new(0xd565917a_u32, 0x85c4_u16, 0x4466_u16, StaticArray[0x85_u8, 0x6e_u8, 0x67_u8, 0x1c_u8, 0x37_u8, 0x42_u8, 0xea_u8, 0x9a_u8])
    def query_interface(this : IEAPProviderConfig2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEAPProviderConfig2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEAPProviderConfig2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IEAPProviderConfig2*, pszMachineName : Win32cr::Foundation::PWSTR, dwEapTypeId : UInt32, puConnectionParam : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszMachineName, dwEapTypeId, puConnectionParam)
    end
    def uninitialize(this : IEAPProviderConfig2*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninitialize.call(this, dwEapTypeId, uConnectionParam)
    end
    def server_invoke_config_ui(this : IEAPProviderConfig2*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.server_invoke_config_ui.call(this, dwEapTypeId, uConnectionParam, hWnd, uReserved1, uReserved2)
    end
    def router_invoke_config_ui(this : IEAPProviderConfig2*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, pConnectionDataIn : UInt8*, dwSizeOfConnectionDataIn : UInt32, ppConnectionDataOut : UInt8**, pdwSizeOfConnectionDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.router_invoke_config_ui.call(this, dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, ppConnectionDataOut, pdwSizeOfConnectionDataOut)
    end
    def router_invoke_credentials_ui(this : IEAPProviderConfig2*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, pConnectionDataIn : UInt8*, dwSizeOfConnectionDataIn : UInt32, pUserDataIn : UInt8*, dwSizeOfUserDataIn : UInt32, ppUserDataOut : UInt8**, pdwSizeOfUserDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.router_invoke_credentials_ui.call(this, dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, pUserDataIn, dwSizeOfUserDataIn, ppUserDataOut, pdwSizeOfUserDataOut)
    end
    def server_invoke_config_ui2(this : IEAPProviderConfig2*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, pConfigDataIn : UInt8*, dwSizeOfConfigDataIn : UInt32, ppConfigDataOut : UInt8**, pdwSizeOfConfigDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.server_invoke_config_ui2.call(this, dwEapTypeId, uConnectionParam, hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut)
    end
    def get_global_config(this : IEAPProviderConfig2*, dwEapTypeId : UInt32, ppConfigDataOut : UInt8**, pdwSizeOfConfigDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_global_config.call(this, dwEapTypeId, ppConfigDataOut, pdwSizeOfConfigDataOut)
    end

  end

  @[Extern]
  record IEAPProviderConfig3Vtbl,
    query_interface : Proc(IEAPProviderConfig3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEAPProviderConfig3*, UInt32),
    release : Proc(IEAPProviderConfig3*, UInt32),
    initialize__ : Proc(IEAPProviderConfig3*, Win32cr::Foundation::PWSTR, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IEAPProviderConfig3*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    server_invoke_config_ui : Proc(IEAPProviderConfig3*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    router_invoke_config_ui : Proc(IEAPProviderConfig3*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    router_invoke_credentials_ui : Proc(IEAPProviderConfig3*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    server_invoke_config_ui2 : Proc(IEAPProviderConfig3*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_global_config : Proc(IEAPProviderConfig3*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    server_invoke_certificate_config_ui : Proc(IEAPProviderConfig3*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt8*, UInt32, UInt8**, UInt32*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b78ecd12-68bb-4f86-9bf0-8438dd3be982")]
  record IEAPProviderConfig3, lpVtbl : IEAPProviderConfig3Vtbl* do
    GUID = LibC::GUID.new(0xb78ecd12_u32, 0x68bb_u16, 0x4f86_u16, StaticArray[0x9b_u8, 0xf0_u8, 0x84_u8, 0x38_u8, 0xdd_u8, 0x3b_u8, 0xe9_u8, 0x82_u8])
    def query_interface(this : IEAPProviderConfig3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEAPProviderConfig3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEAPProviderConfig3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IEAPProviderConfig3*, pszMachineName : Win32cr::Foundation::PWSTR, dwEapTypeId : UInt32, puConnectionParam : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszMachineName, dwEapTypeId, puConnectionParam)
    end
    def uninitialize(this : IEAPProviderConfig3*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninitialize.call(this, dwEapTypeId, uConnectionParam)
    end
    def server_invoke_config_ui(this : IEAPProviderConfig3*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, uReserved1 : LibC::UIntPtrT, uReserved2 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.server_invoke_config_ui.call(this, dwEapTypeId, uConnectionParam, hWnd, uReserved1, uReserved2)
    end
    def router_invoke_config_ui(this : IEAPProviderConfig3*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, pConnectionDataIn : UInt8*, dwSizeOfConnectionDataIn : UInt32, ppConnectionDataOut : UInt8**, pdwSizeOfConnectionDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.router_invoke_config_ui.call(this, dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, ppConnectionDataOut, pdwSizeOfConnectionDataOut)
    end
    def router_invoke_credentials_ui(this : IEAPProviderConfig3*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, pConnectionDataIn : UInt8*, dwSizeOfConnectionDataIn : UInt32, pUserDataIn : UInt8*, dwSizeOfUserDataIn : UInt32, ppUserDataOut : UInt8**, pdwSizeOfUserDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.router_invoke_credentials_ui.call(this, dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, pUserDataIn, dwSizeOfUserDataIn, ppUserDataOut, pdwSizeOfUserDataOut)
    end
    def server_invoke_config_ui2(this : IEAPProviderConfig3*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, pConfigDataIn : UInt8*, dwSizeOfConfigDataIn : UInt32, ppConfigDataOut : UInt8**, pdwSizeOfConfigDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.server_invoke_config_ui2.call(this, dwEapTypeId, uConnectionParam, hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut)
    end
    def get_global_config(this : IEAPProviderConfig3*, dwEapTypeId : UInt32, ppConfigDataOut : UInt8**, pdwSizeOfConfigDataOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_global_config.call(this, dwEapTypeId, ppConfigDataOut, pdwSizeOfConfigDataOut)
    end
    def server_invoke_certificate_config_ui(this : IEAPProviderConfig3*, dwEapTypeId : UInt32, uConnectionParam : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, pConfigDataIn : UInt8*, dwSizeOfConfigDataIn : UInt32, ppConfigDataOut : UInt8**, pdwSizeOfConfigDataOut : UInt32*, uReserved : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.server_invoke_certificate_config_ui.call(this, dwEapTypeId, uConnectionParam, hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut, uReserved)
    end

  end

  @[Link("eappcfg")]
  @[Link("eappprxy")]
  lib C
    fun EapHostPeerGetMethods(pEapMethodInfoArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_INFO_ARRAY*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerGetMethodProperties(dwVersion : UInt32, dwFlags : UInt32, eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, hUserImpersonationToken : Win32cr::Foundation::HANDLE, dwEapConnDataSize : UInt32, pbEapConnData : UInt8*, dwUserDataSize : UInt32, pbUserData : UInt8*, pMethodPropertyArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_PROPERTY_ARRAY*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerInvokeConfigUI(hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, dwSizeOfConfigIn : UInt32, pConfigIn : UInt8*, pdwSizeOfConfigOut : UInt32*, ppConfigOut : UInt8**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerQueryCredentialInputFields(hUserImpersonationToken : Win32cr::Foundation::HANDLE, eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, dwFlags : UInt32, dwEapConnDataSize : UInt32, pbEapConnData : UInt8*, pEapConfigInputFieldArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_ARRAY*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerQueryUserBlobFromCredentialInputFields(hUserImpersonationToken : Win32cr::Foundation::HANDLE, eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, dwFlags : UInt32, dwEapConnDataSize : UInt32, pbEapConnData : UInt8*, pEapConfigInputFieldArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_CONFIG_INPUT_FIELD_ARRAY*, pdwUserBlobSize : UInt32*, ppbUserBlob : UInt8**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerInvokeIdentityUI(dwVersion : UInt32, eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, dwFlags : UInt32, hwndParent : Win32cr::Foundation::HWND, dwSizeofConnectionData : UInt32, pConnectionData : UInt8*, dwSizeofUserData : UInt32, pUserData : UInt8*, pdwSizeOfUserDataOut : UInt32*, ppUserDataOut : UInt8**, ppwszIdentity : Win32cr::Foundation::PWSTR*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**, ppvReserved : Void**) : UInt32

    fun EapHostPeerInvokeInteractiveUI(hwndParent : Win32cr::Foundation::HWND, dwSizeofUIContextData : UInt32, pUIContextData : UInt8*, pdwSizeOfDataFromInteractiveUI : UInt32*, ppDataFromInteractiveUI : UInt8**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerQueryInteractiveUIInputFields(dwVersion : UInt32, dwFlags : UInt32, dwSizeofUIContextData : UInt32, pUIContextData : UInt8*, pEapInteractiveUIData : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_INTERACTIVE_UI_DATA*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**, ppvReserved : Void**) : UInt32

    fun EapHostPeerQueryUIBlobFromInteractiveUIInputFields(dwVersion : UInt32, dwFlags : UInt32, dwSizeofUIContextData : UInt32, pUIContextData : UInt8*, pEapInteractiveUIData : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_INTERACTIVE_UI_DATA*, pdwSizeOfDataFromInteractiveUI : UInt32*, ppDataFromInteractiveUI : UInt8**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**, ppvReserved : Void**) : UInt32

    fun EapHostPeerConfigXml2Blob(dwFlags : UInt32, pConfigDoc : Void*, pdwSizeOfConfigOut : UInt32*, ppConfigOut : UInt8**, pEapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerCredentialsXml2Blob(dwFlags : UInt32, pCredentialsDoc : Void*, dwSizeOfConfigIn : UInt32, pConfigIn : UInt8*, pdwSizeOfCredentialsOut : UInt32*, ppCredentialsOut : UInt8**, pEapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerConfigBlob2Xml(dwFlags : UInt32, eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, dwSizeOfConfigIn : UInt32, pConfigIn : UInt8*, ppConfigDoc : Void**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerFreeMemory(pData : UInt8*) : Void

    fun EapHostPeerFreeErrorMemory(pEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR*) : Void

    fun EapHostPeerInitialize : UInt32

    fun EapHostPeerUninitialize : Void

    fun EapHostPeerBeginSession(dwFlags : UInt32, eapType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, pAttributeArray : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTES*, hTokenImpersonateUser : Win32cr::Foundation::HANDLE, dwSizeofConnectionData : UInt32, pConnectionData : UInt8*, dwSizeofUserData : UInt32, pUserData : UInt8*, dwMaxSendPacketSize : UInt32, pConnectionId : LibC::GUID*, func : Win32cr::Security::ExtensibleAuthenticationProtocol::NotificationHandler, pContextData : Void*, pSessionId : UInt32*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerProcessReceivedPacket(sessionHandle : UInt32, cbReceivePacket : UInt32, pReceivePacket : UInt8*, pEapOutput : Win32cr::Security::ExtensibleAuthenticationProtocol::EapHostPeerResponseAction*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerGetSendPacket(sessionHandle : UInt32, pcbSendPacket : UInt32*, ppSendPacket : UInt8**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerGetResult(sessionHandle : UInt32, reason : Win32cr::Security::ExtensibleAuthenticationProtocol::EapHostPeerMethodResultReason, ppResult : Win32cr::Security::ExtensibleAuthenticationProtocol::EapHostPeerMethodResult*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerGetUIContext(sessionHandle : UInt32, pdwSizeOfUIContextData : UInt32*, ppUIContextData : UInt8**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerSetUIContext(sessionHandle : UInt32, dwSizeOfUIContextData : UInt32, pUIContextData : UInt8*, pEapOutput : Win32cr::Security::ExtensibleAuthenticationProtocol::EapHostPeerResponseAction*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerGetResponseAttributes(sessionHandle : UInt32, pAttribs : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTES*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerSetResponseAttributes(sessionHandle : UInt32, pAttribs : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ATTRIBUTES*, pEapOutput : Win32cr::Security::ExtensibleAuthenticationProtocol::EapHostPeerResponseAction*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerGetAuthStatus(sessionHandle : UInt32, authParam : Win32cr::Security::ExtensibleAuthenticationProtocol::EapHostPeerAuthParams, pcbAuthData : UInt32*, ppAuthData : UInt8**, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerEndSession(sessionHandle : UInt32, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerGetDataToUnplumbCredentials(pConnectionIdThatLastSavedCreds : LibC::GUID*, phCredentialImpersonationToken : LibC::IntPtrT*, sessionHandle : UInt32, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**, fSaveToCredMan : Win32cr::Foundation::BOOL*) : UInt32

    fun EapHostPeerClearConnection(pConnectionId : LibC::GUID*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**) : UInt32

    fun EapHostPeerFreeEapError(pEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR*) : Void

    fun EapHostPeerGetIdentity(dwVersion : UInt32, dwFlags : UInt32, eapMethodType : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_METHOD_TYPE, dwSizeofConnectionData : UInt32, pConnectionData : UInt8*, dwSizeofUserData : UInt32, pUserData : UInt8*, hTokenImpersonateUser : Win32cr::Foundation::HANDLE, pfInvokeUI : Win32cr::Foundation::BOOL*, pdwSizeOfUserDataOut : UInt32*, ppUserDataOut : UInt8**, ppwszIdentity : Win32cr::Foundation::PWSTR*, ppEapError : Win32cr::Security::ExtensibleAuthenticationProtocol::EAP_ERROR**, ppvReserved : UInt8**) : UInt32

    fun EapHostPeerGetEncryptedPassword(dwSizeofPassword : UInt32, szPassword : Win32cr::Foundation::PWSTR, ppszEncPassword : Win32cr::Foundation::PWSTR*) : UInt32

    fun EapHostPeerFreeRuntimeMemory(pData : UInt8*) : Void

  end
end