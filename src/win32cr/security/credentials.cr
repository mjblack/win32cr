require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::Security::Credentials
  alias LPOCNCONNPROCA = Proc(LibC::UIntPtrT, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Void*, LibC::UIntPtrT)*

  alias LPOCNCONNPROCW = Proc(LibC::UIntPtrT, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, LibC::UIntPtrT)*

  alias LPOCNCHKPROC = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Void*, Win32cr::Foundation::BOOL)*

  alias LPOCNDSCPROC = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Void*, Void)*

  FILE_DEVICE_SMARTCARD = 49_u32
  GUID_DEVINTERFACE_SMARTCARD_READER = "50dd5230-ba8a-11d1-bf5d-0000f805f530"
  SCARD_ATR_LENGTH = 33_u32
  SCARD_PROTOCOL_UNDEFINED = 0_u32
  SCARD_PROTOCOL_T0 = 1_u32
  SCARD_PROTOCOL_T1 = 2_u32
  SCARD_PROTOCOL_RAW = 65536_u32
  SCARD_PROTOCOL_DEFAULT = 2147483648_u32
  SCARD_PROTOCOL_OPTIMAL = 0_u32
  SCARD_POWER_DOWN = 0_u32
  SCARD_COLD_RESET = 1_u32
  SCARD_WARM_RESET = 2_u32
  MAXIMUM_ATTR_STRING_LENGTH = 32_u32
  MAXIMUM_SMARTCARD_READERS = 10_u32
  SCARD_CLASS_VENDOR_INFO = 1_u32
  SCARD_CLASS_COMMUNICATIONS = 2_u32
  SCARD_CLASS_PROTOCOL = 3_u32
  SCARD_CLASS_POWER_MGMT = 4_u32
  SCARD_CLASS_SECURITY = 5_u32
  SCARD_CLASS_MECHANICAL = 6_u32
  SCARD_CLASS_VENDOR_DEFINED = 7_u32
  SCARD_CLASS_IFD_PROTOCOL = 8_u32
  SCARD_CLASS_ICC_STATE = 9_u32
  SCARD_CLASS_PERF = 32766_u32
  SCARD_CLASS_SYSTEM = 32767_u32
  SCARD_T0_HEADER_LENGTH = 7_u32
  SCARD_T0_CMD_LENGTH = 5_u32
  SCARD_T1_PROLOGUE_LENGTH = 3_u32
  SCARD_T1_EPILOGUE_LENGTH = 2_u32
  SCARD_T1_EPILOGUE_LENGTH_LRC = 1_u32
  SCARD_T1_MAX_IFS = 254_u32
  SCARD_UNKNOWN = 0_u32
  SCARD_ABSENT = 1_u32
  SCARD_PRESENT = 2_u32
  SCARD_SWALLOWED = 3_u32
  SCARD_POWERED = 4_u32
  SCARD_NEGOTIABLE = 5_u32
  SCARD_SPECIFIC = 6_u32
  SCARD_READER_SWALLOWS = 1_u32
  SCARD_READER_EJECTS = 2_u32
  SCARD_READER_CONFISCATES = 4_u32
  SCARD_READER_CONTACTLESS = 8_u32
  SCARD_READER_TYPE_SERIAL = 1_u32
  SCARD_READER_TYPE_PARALELL = 2_u32
  SCARD_READER_TYPE_KEYBOARD = 4_u32
  SCARD_READER_TYPE_SCSI = 8_u32
  SCARD_READER_TYPE_IDE = 16_u32
  SCARD_READER_TYPE_USB = 32_u32
  SCARD_READER_TYPE_PCMCIA = 64_u32
  SCARD_READER_TYPE_TPM = 128_u32
  SCARD_READER_TYPE_NFC = 256_u32
  SCARD_READER_TYPE_UICC = 512_u32
  SCARD_READER_TYPE_NGC = 1024_u32
  SCARD_READER_TYPE_EMBEDDEDSE = 2048_u32
  SCARD_READER_TYPE_VENDOR = 240_u32
  STATUS_LOGON_FAILURE = -1073741715_i32
  STATUS_WRONG_PASSWORD = -1073741718_i32
  STATUS_PASSWORD_EXPIRED = -1073741711_i32
  STATUS_PASSWORD_MUST_CHANGE = -1073741276_i32
  STATUS_DOWNGRADE_DETECTED = -1073740920_i32
  STATUS_AUTHENTICATION_FIREWALL_FAILED = -1073740781_i32
  STATUS_ACCOUNT_DISABLED = -1073741710_i32
  STATUS_ACCOUNT_RESTRICTION = -1073741714_i32
  STATUS_ACCOUNT_LOCKED_OUT = -1073741260_i32
  STATUS_ACCOUNT_EXPIRED = -1073741421_i32
  STATUS_LOGON_TYPE_NOT_GRANTED = -1073741477_i32
  STATUS_NO_SUCH_LOGON_SESSION = -1073741729_i32
  STATUS_NO_SUCH_USER = -1073741724_i32
  CRED_MAX_STRING_LENGTH = 256_u32
  CRED_MAX_GENERIC_TARGET_NAME_LENGTH = 32767_u32
  CRED_MAX_TARGETNAME_NAMESPACE_LENGTH = 256_u32
  CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH = 256_u32
  CRED_MAX_VALUE_SIZE = 256_u32
  CRED_MAX_ATTRIBUTES = 64_u32
  CRED_SESSION_WILDCARD_NAME_W = "*Session"
  CRED_SESSION_WILDCARD_NAME_A = "*Session"
  CRED_TARGETNAME_DOMAIN_NAMESPACE_W = "Domain"
  CRED_TARGETNAME_DOMAIN_NAMESPACE_A = "Domain"
  CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_W = "LegacyGeneric"
  CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_A = "LegacyGeneric"
  CRED_TARGETNAME_ATTRIBUTE_TARGET_W = "target"
  CRED_TARGETNAME_ATTRIBUTE_TARGET_A = "target"
  CRED_TARGETNAME_ATTRIBUTE_NAME_W = "name"
  CRED_TARGETNAME_ATTRIBUTE_NAME_A = "name"
  CRED_TARGETNAME_ATTRIBUTE_BATCH_W = "batch"
  CRED_TARGETNAME_ATTRIBUTE_BATCH_A = "batch"
  CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W = "interactive"
  CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_A = "interactive"
  CRED_TARGETNAME_ATTRIBUTE_SERVICE_W = "service"
  CRED_TARGETNAME_ATTRIBUTE_SERVICE_A = "service"
  CRED_TARGETNAME_ATTRIBUTE_NETWORK_W = "network"
  CRED_TARGETNAME_ATTRIBUTE_NETWORK_A = "network"
  CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W = "networkcleartext"
  CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_A = "networkcleartext"
  CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W = "remoteinteractive"
  CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_A = "remoteinteractive"
  CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W = "cachedinteractive"
  CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_A = "cachedinteractive"
  CRED_SESSION_WILDCARD_NAME = "*Session"
  CRED_TARGETNAME_DOMAIN_NAMESPACE = "Domain"
  CRED_TARGETNAME_ATTRIBUTE_NAME = "name"
  CRED_TARGETNAME_ATTRIBUTE_TARGET = "target"
  CRED_TARGETNAME_ATTRIBUTE_BATCH = "batch"
  CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE = "interactive"
  CRED_TARGETNAME_ATTRIBUTE_SERVICE = "service"
  CRED_TARGETNAME_ATTRIBUTE_NETWORK = "network"
  CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT = "networkcleartext"
  CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE = "remoteinteractive"
  CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE = "cachedinteractive"
  CRED_LOGON_TYPES_MASK = 61440_u32
  CRED_TI_SERVER_FORMAT_UNKNOWN = 1_u32
  CRED_TI_DOMAIN_FORMAT_UNKNOWN = 2_u32
  CRED_TI_ONLY_PASSWORD_REQUIRED = 4_u32
  CRED_TI_USERNAME_TARGET = 8_u32
  CRED_TI_CREATE_EXPLICIT_CRED = 16_u32
  CRED_TI_WORKGROUP_MEMBER = 32_u32
  CRED_TI_DNSTREE_IS_DFS_SERVER = 64_u32
  CRED_TI_VALID_FLAGS = 61567_u32
  CERT_HASH_LENGTH = 20_u32
  CREDUI_MAX_MESSAGE_LENGTH = 1024_u32
  CREDUI_MAX_CAPTION_LENGTH = 128_u32
  CREDUI_MAX_GENERIC_TARGET_LENGTH = 32767_u32
  CREDUIWIN_IGNORE_CLOUDAUTHORITY_NAME = 262144_u32
  CREDUIWIN_DOWNLEVEL_HELLO_AS_SMART_CARD = 2147483648_u32
  CRED_PRESERVE_CREDENTIAL_BLOB = 1_u32
  CRED_CACHE_TARGET_INFORMATION = 1_u32
  CRED_ALLOW_NAME_RESOLUTION = 1_u32
  CRED_PROTECT_AS_SELF = 1_u32
  CRED_PROTECT_TO_SYSTEM = 2_u32
  CRED_UNPROTECT_AS_SELF = 1_u32
  CRED_UNPROTECT_ALLOW_TO_SYSTEM = 2_u32
  SCARD_SCOPE_TERMINAL = 1_u32
  SCARD_ALL_READERS = "SCard$AllReaders\u000000"
  SCARD_DEFAULT_READERS = "SCard$DefaultReaders\u000000"
  SCARD_LOCAL_READERS = "SCard$LocalReaders\u000000"
  SCARD_SYSTEM_READERS = "SCard$SystemReaders\u000000"
  SCARD_PROVIDER_PRIMARY = 1_u32
  SCARD_PROVIDER_CSP = 2_u32
  SCARD_PROVIDER_KSP = 3_u32
  SCARD_STATE_UNPOWERED = 1024_u32
  SCARD_SHARE_EXCLUSIVE = 1_u32
  SCARD_SHARE_SHARED = 2_u32
  SCARD_SHARE_DIRECT = 3_u32
  SCARD_LEAVE_CARD = 0_u32
  SCARD_RESET_CARD = 1_u32
  SCARD_UNPOWER_CARD = 2_u32
  SCARD_EJECT_CARD = 3_u32
  SC_DLG_MINIMAL_UI = 1_u32
  SC_DLG_NO_UI = 2_u32
  SC_DLG_FORCE_UI = 4_u32
  SCERR_NOCARDNAME = 16384_u32
  SCERR_NOGUIDS = 32768_u32
  SCARD_AUDIT_CHV_FAILURE = 0_u32
  SCARD_AUDIT_CHV_SUCCESS = 1_u32
  CREDSSP_NAME = "CREDSSP"
  TS_SSP_NAME_A = "TSSSP"
  TS_SSP_NAME = "TSSSP"
  Szoid_ts_kp_ts_server_auth = "1.3.6.1.4.1.311.54.1.2"
  CREDSSP_SERVER_AUTH_NEGOTIATE = 1_u32
  CREDSSP_SERVER_AUTH_CERTIFICATE = 2_u32
  CREDSSP_SERVER_AUTH_LOOPBACK = 4_u32
  SECPKG_ALT_ATTR = 2147483648_u32
  SECPKG_ATTR_C_FULL_IDENT_TOKEN = 2147483781_u32
  CREDSSP_CRED_EX_VERSION = 0_u32
  CREDSSP_FLAG_REDIRECT = 1_u32

  @[Flags]
  enum CRED_FLAGS : UInt32
    CRED_FLAGS_PASSWORD_FOR_CERT = 1_u32
    CRED_FLAGS_PROMPT_NOW = 2_u32
    CRED_FLAGS_USERNAME_TARGET = 4_u32
    CRED_FLAGS_OWF_CRED_BLOB = 8_u32
    CRED_FLAGS_REQUIRE_CONFIRMATION = 16_u32
    CRED_FLAGS_WILDCARD_MATCH = 32_u32
    CRED_FLAGS_VSM_PROTECTED = 64_u32
    CRED_FLAGS_NGC_CERT = 128_u32
    CRED_FLAGS_VALID_FLAGS = 61695_u32
    CRED_FLAGS_VALID_INPUT_FLAGS = 61599_u32
  end
  enum CRED_TYPE : UInt32
    CRED_TYPE_GENERIC = 1_u32
    CRED_TYPE_DOMAIN_PASSWORD = 2_u32
    CRED_TYPE_DOMAIN_CERTIFICATE = 3_u32
    CRED_TYPE_DOMAIN_VISIBLE_PASSWORD = 4_u32
    CRED_TYPE_GENERIC_CERTIFICATE = 5_u32
    CRED_TYPE_DOMAIN_EXTENDED = 6_u32
    CRED_TYPE_MAXIMUM = 7_u32
    CRED_TYPE_MAXIMUM_EX = 1007_u32
  end
  enum CRED_PERSIST : UInt32
    CRED_PERSIST_NONE = 0_u32
    CRED_PERSIST_SESSION = 1_u32
    CRED_PERSIST_LOCAL_MACHINE = 2_u32
    CRED_PERSIST_ENTERPRISE = 3_u32
  end
  @[Flags]
  enum CREDUI_FLAGS : UInt32
    CREDUI_FLAGS_ALWAYS_SHOW_UI = 128_u32
    CREDUI_FLAGS_COMPLETE_USERNAME = 2048_u32
    CREDUI_FLAGS_DO_NOT_PERSIST = 2_u32
    CREDUI_FLAGS_EXCLUDE_CERTIFICATES = 8_u32
    CREDUI_FLAGS_EXPECT_CONFIRMATION = 131072_u32
    CREDUI_FLAGS_GENERIC_CREDENTIALS = 262144_u32
    CREDUI_FLAGS_INCORRECT_PASSWORD = 1_u32
    CREDUI_FLAGS_KEEP_USERNAME = 1048576_u32
    CREDUI_FLAGS_PASSWORD_ONLY_OK = 512_u32
    CREDUI_FLAGS_PERSIST = 4096_u32
    CREDUI_FLAGS_REQUEST_ADMINISTRATOR = 4_u32
    CREDUI_FLAGS_REQUIRE_CERTIFICATE = 16_u32
    CREDUI_FLAGS_REQUIRE_SMARTCARD = 256_u32
    CREDUI_FLAGS_SERVER_CREDENTIAL = 16384_u32
    CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX = 64_u32
    CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS = 524288_u32
    CREDUI_FLAGS_VALIDATE_USERNAME = 1024_u32
  end
  enum SCARD_SCOPE : UInt32
    SCARD_SCOPE_USER = 0_u32
    SCARD_SCOPE_SYSTEM = 2_u32
  end
  @[Flags]
  enum CRED_ENUMERATE_FLAGS : UInt32
    CRED_ENUMERATE_ALL_CREDENTIALS = 1_u32
  end
  @[Flags]
  enum CREDUIWIN_FLAGS : UInt32
    CREDUIWIN_GENERIC = 1_u32
    CREDUIWIN_CHECKBOX = 2_u32
    CREDUIWIN_AUTHPACKAGE_ONLY = 16_u32
    CREDUIWIN_IN_CRED_ONLY = 32_u32
    CREDUIWIN_ENUMERATE_ADMINS = 256_u32
    CREDUIWIN_ENUMERATE_CURRENT_USER = 512_u32
    CREDUIWIN_SECURE_PROMPT = 4096_u32
    CREDUIWIN_PREPROMPTING = 8192_u32
    CREDUIWIN_PACK_32_WOW = 268435456_u32
  end
  enum SCARD_STATE : UInt32
    SCARD_STATE_UNAWARE = 0_u32
    SCARD_STATE_IGNORE = 1_u32
    SCARD_STATE_UNAVAILABLE = 8_u32
    SCARD_STATE_EMPTY = 16_u32
    SCARD_STATE_PRESENT = 32_u32
    SCARD_STATE_ATRMATCH = 64_u32
    SCARD_STATE_EXCLUSIVE = 128_u32
    SCARD_STATE_INUSE = 256_u32
    SCARD_STATE_MUTE = 512_u32
    SCARD_STATE_CHANGED = 2_u32
    SCARD_STATE_UNKNOWN = 4_u32
  end
  @[Flags]
  enum CRED_PACK_FLAGS : UInt32
    CRED_PACK_PROTECTED_CREDENTIALS = 1_u32
    CRED_PACK_WOW_BUFFER = 2_u32
    CRED_PACK_GENERIC_CREDENTIALS = 4_u32
    CRED_PACK_ID_PROVIDER_CREDENTIALS = 8_u32
  end
  @[Flags]
  enum KeyCredentialManagerOperationErrorStates : UInt32
    KeyCredentialManagerOperationErrorStateNone = 0_u32
    KeyCredentialManagerOperationErrorStateDeviceJoinFailure = 1_u32
    KeyCredentialManagerOperationErrorStateTokenFailure = 2_u32
    KeyCredentialManagerOperationErrorStateCertificateFailure = 4_u32
    KeyCredentialManagerOperationErrorStateRemoteSessionFailure = 8_u32
    KeyCredentialManagerOperationErrorStatePolicyFailure = 16_u32
    KeyCredentialManagerOperationErrorStateHardwareFailure = 32_u32
    KeyCredentialManagerOperationErrorStatePinExistsFailure = 64_u32
  end
  enum KeyCredentialManagerOperationType
    KeyCredentialManagerProvisioning = 0_i32
    KeyCredentialManagerPinChange = 1_i32
    KeyCredentialManagerPinReset = 2_i32
  end
  enum CRED_MARSHAL_TYPE
    CertCredential = 1_i32
    UsernameTargetCredential = 2_i32
    BinaryBlobCredential = 3_i32
    UsernameForPackedCredentials = 4_i32
    BinaryBlobForSystem = 5_i32
  end
  enum CRED_PROTECTION_TYPE
    CredUnprotected = 0_i32
    CredUserProtection = 1_i32
    CredTrustedProtection = 2_i32
    CredForSystemProtection = 3_i32
  end
  enum READER_SEL_REQUEST_MATCH_TYPE
    RSR_MATCH_TYPE_READER_AND_CONTAINER = 1_i32
    RSR_MATCH_TYPE_SERIAL_NUMBER = 2_i32
    RSR_MATCH_TYPE_ALL_CARDS = 3_i32
  end
  enum CREDSPP_SUBMIT_TYPE
    CredsspPasswordCreds = 2_i32
    CredsspSchannelCreds = 4_i32
    CredsspCertificateCreds = 13_i32
    CredsspSubmitBufferBoth = 50_i32
    CredsspSubmitBufferBothOld = 51_i32
    CredsspCredEx = 100_i32
  end

  @[Extern]
  record KeyCredentialManagerInfo,
    containerId : LibC::GUID

  @[Extern]
  record SecHandle,
    dwLower : LibC::UIntPtrT,
    dwUpper : LibC::UIntPtrT

  @[Extern]
  record CREDENTIAL_ATTRIBUTEA,
    keyword : Win32cr::Foundation::PSTR,
    flags : UInt32,
    value_size : UInt32,
    value : UInt8*

  @[Extern]
  record CREDENTIAL_ATTRIBUTEW,
    keyword : Win32cr::Foundation::PWSTR,
    flags : UInt32,
    value_size : UInt32,
    value : UInt8*

  @[Extern]
  record CREDENTIALA,
    flags : Win32cr::Security::Credentials::CRED_FLAGS,
    type__ : Win32cr::Security::Credentials::CRED_TYPE,
    target_name : Win32cr::Foundation::PSTR,
    comment : Win32cr::Foundation::PSTR,
    last_written : Win32cr::Foundation::FILETIME,
    credential_blob_size : UInt32,
    credential_blob : UInt8*,
    persist : Win32cr::Security::Credentials::CRED_PERSIST,
    attribute_count : UInt32,
    attributes : Win32cr::Security::Credentials::CREDENTIAL_ATTRIBUTEA*,
    target_alias : Win32cr::Foundation::PSTR,
    user_name : Win32cr::Foundation::PSTR

  @[Extern]
  record CREDENTIALW,
    flags : Win32cr::Security::Credentials::CRED_FLAGS,
    type__ : Win32cr::Security::Credentials::CRED_TYPE,
    target_name : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    last_written : Win32cr::Foundation::FILETIME,
    credential_blob_size : UInt32,
    credential_blob : UInt8*,
    persist : Win32cr::Security::Credentials::CRED_PERSIST,
    attribute_count : UInt32,
    attributes : Win32cr::Security::Credentials::CREDENTIAL_ATTRIBUTEW*,
    target_alias : Win32cr::Foundation::PWSTR,
    user_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record CREDENTIAL_TARGET_INFORMATIONA,
    target_name : Win32cr::Foundation::PSTR,
    netbios_server_name : Win32cr::Foundation::PSTR,
    dns_server_name : Win32cr::Foundation::PSTR,
    netbios_domain_name : Win32cr::Foundation::PSTR,
    dns_domain_name : Win32cr::Foundation::PSTR,
    dns_tree_name : Win32cr::Foundation::PSTR,
    package_name : Win32cr::Foundation::PSTR,
    flags : UInt32,
    cred_type_count : UInt32,
    cred_types : UInt32*

  @[Extern]
  record CREDENTIAL_TARGET_INFORMATIONW,
    target_name : Win32cr::Foundation::PWSTR,
    netbios_server_name : Win32cr::Foundation::PWSTR,
    dns_server_name : Win32cr::Foundation::PWSTR,
    netbios_domain_name : Win32cr::Foundation::PWSTR,
    dns_domain_name : Win32cr::Foundation::PWSTR,
    dns_tree_name : Win32cr::Foundation::PWSTR,
    package_name : Win32cr::Foundation::PWSTR,
    flags : UInt32,
    cred_type_count : UInt32,
    cred_types : UInt32*

  @[Extern]
  record CERT_CREDENTIAL_INFO,
    cbSize : UInt32,
    rgbHashOfCert : UInt8[20]

  @[Extern]
  record USERNAME_TARGET_CREDENTIAL_INFO,
    user_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record BINARY_BLOB_CREDENTIAL_INFO,
    cbBlob : UInt32,
    pbBlob : UInt8*

  @[Extern]
  record CREDUI_INFOA,
    cbSize : UInt32,
    hwndParent : Win32cr::Foundation::HWND,
    pszMessageText : Win32cr::Foundation::PSTR,
    pszCaptionText : Win32cr::Foundation::PSTR,
    hbmBanner : Win32cr::Graphics::Gdi::HBITMAP

  @[Extern]
  record CREDUI_INFOW,
    cbSize : UInt32,
    hwndParent : Win32cr::Foundation::HWND,
    pszMessageText : Win32cr::Foundation::PWSTR,
    pszCaptionText : Win32cr::Foundation::PWSTR,
    hbmBanner : Win32cr::Graphics::Gdi::HBITMAP

  @[Extern]
  record SCARD_IO_REQUEST,
    dwProtocol : UInt32,
    cbPciLength : UInt32

  @[Extern]
  record SCARD_T0_COMMAND,
    bCla : UInt8,
    bIns : UInt8,
    bP1 : UInt8,
    bP2 : UInt8,
    bP3 : UInt8

  @[Extern]
  record SCARD_T0_REQUEST,
    ioRequest : Win32cr::Security::Credentials::SCARD_IO_REQUEST,
    bSw1 : UInt8,
    bSw2 : UInt8,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      cmd_bytes : Win32cr::Security::Credentials::SCARD_T0_COMMAND,
      rgbHeader : UInt8[5]

  end

  @[Extern]
  record SCARD_T1_REQUEST,
    ioRequest : Win32cr::Security::Credentials::SCARD_IO_REQUEST

  @[Extern]
  record SCARD_READERSTATEA,
    szReader : Win32cr::Foundation::PSTR,
    pvUserData : Void*,
    dwCurrentState : Win32cr::Security::Credentials::SCARD_STATE,
    dwEventState : Win32cr::Security::Credentials::SCARD_STATE,
    cbAtr : UInt32,
    rgbAtr : UInt8[36]

  @[Extern]
  record SCARD_READERSTATEW,
    szReader : Win32cr::Foundation::PWSTR,
    pvUserData : Void*,
    dwCurrentState : Win32cr::Security::Credentials::SCARD_STATE,
    dwEventState : Win32cr::Security::Credentials::SCARD_STATE,
    cbAtr : UInt32,
    rgbAtr : UInt8[36]

  @[Extern]
  record SCARD_ATRMASK,
    cbAtr : UInt32,
    rgbAtr : UInt8[36],
    rgbMask : UInt8[36]

  @[Extern]
  record OPENCARD_SEARCH_CRITERIAA,
    dwStructSize : UInt32,
    lpstrGroupNames : Win32cr::Foundation::PSTR,
    nMaxGroupNames : UInt32,
    rgguidInterfaces : LibC::GUID*,
    cguidInterfaces : UInt32,
    lpstrCardNames : Win32cr::Foundation::PSTR,
    nMaxCardNames : UInt32,
    lpfnCheck : Win32cr::Security::Credentials::LPOCNCHKPROC,
    lpfnConnect : Win32cr::Security::Credentials::LPOCNCONNPROCA,
    lpfnDisconnect : Win32cr::Security::Credentials::LPOCNDSCPROC,
    pvUserData : Void*,
    dwShareMode : UInt32,
    dwPreferredProtocols : UInt32

  @[Extern]
  record OPENCARD_SEARCH_CRITERIAW,
    dwStructSize : UInt32,
    lpstrGroupNames : Win32cr::Foundation::PWSTR,
    nMaxGroupNames : UInt32,
    rgguidInterfaces : LibC::GUID*,
    cguidInterfaces : UInt32,
    lpstrCardNames : Win32cr::Foundation::PWSTR,
    nMaxCardNames : UInt32,
    lpfnCheck : Win32cr::Security::Credentials::LPOCNCHKPROC,
    lpfnConnect : Win32cr::Security::Credentials::LPOCNCONNPROCW,
    lpfnDisconnect : Win32cr::Security::Credentials::LPOCNDSCPROC,
    pvUserData : Void*,
    dwShareMode : UInt32,
    dwPreferredProtocols : UInt32

  @[Extern]
  record OPENCARDNAME_EXA,
    dwStructSize : UInt32,
    hSCardContext : LibC::UIntPtrT,
    hwndOwner : Win32cr::Foundation::HWND,
    dwFlags : UInt32,
    lpstrTitle : Win32cr::Foundation::PSTR,
    lpstrSearchDesc : Win32cr::Foundation::PSTR,
    hIcon : Win32cr::UI::WindowsAndMessaging::HICON,
    pOpenCardSearchCriteria : Win32cr::Security::Credentials::OPENCARD_SEARCH_CRITERIAA*,
    lpfnConnect : Win32cr::Security::Credentials::LPOCNCONNPROCA,
    pvUserData : Void*,
    dwShareMode : UInt32,
    dwPreferredProtocols : UInt32,
    lpstrRdr : Win32cr::Foundation::PSTR,
    nMaxRdr : UInt32,
    lpstrCard : Win32cr::Foundation::PSTR,
    nMaxCard : UInt32,
    dwActiveProtocol : UInt32,
    hCardHandle : LibC::UIntPtrT

  @[Extern]
  record OPENCARDNAME_EXW,
    dwStructSize : UInt32,
    hSCardContext : LibC::UIntPtrT,
    hwndOwner : Win32cr::Foundation::HWND,
    dwFlags : UInt32,
    lpstrTitle : Win32cr::Foundation::PWSTR,
    lpstrSearchDesc : Win32cr::Foundation::PWSTR,
    hIcon : Win32cr::UI::WindowsAndMessaging::HICON,
    pOpenCardSearchCriteria : Win32cr::Security::Credentials::OPENCARD_SEARCH_CRITERIAW*,
    lpfnConnect : Win32cr::Security::Credentials::LPOCNCONNPROCW,
    pvUserData : Void*,
    dwShareMode : UInt32,
    dwPreferredProtocols : UInt32,
    lpstrRdr : Win32cr::Foundation::PWSTR,
    nMaxRdr : UInt32,
    lpstrCard : Win32cr::Foundation::PWSTR,
    nMaxCard : UInt32,
    dwActiveProtocol : UInt32,
    hCardHandle : LibC::UIntPtrT

  @[Extern]
  record READER_SEL_REQUEST,
    dwShareMode : UInt32,
    dwPreferredProtocols : UInt32,
    match_type : Win32cr::Security::Credentials::READER_SEL_REQUEST_MATCH_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      reader_and_container_parameter : ReaderAndContainerParameter_e__Struct,
      serial_number_parameter : SerialNumberParameter_e__Struct do

      # Nested Type ReaderAndContainerParameter_e__Struct
      @[Extern]
      record ReaderAndContainerParameter_e__Struct,
        cbReaderNameOffset : UInt32,
        cchReaderNameLength : UInt32,
        cbContainerNameOffset : UInt32,
        cchContainerNameLength : UInt32,
        dwDesiredCardModuleVersion : UInt32,
        dwCspFlags : UInt32


      # Nested Type SerialNumberParameter_e__Struct
      @[Extern]
      record SerialNumberParameter_e__Struct,
        cbSerialNumberOffset : UInt32,
        cbSerialNumberLength : UInt32,
        dwDesiredCardModuleVersion : UInt32

    end

  end

  @[Extern]
  record READER_SEL_RESPONSE,
    cbReaderNameOffset : UInt32,
    cchReaderNameLength : UInt32,
    cbCardNameOffset : UInt32,
    cchCardNameLength : UInt32

  @[Extern]
  record OPENCARDNAMEA,
    dwStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hSCardContext : LibC::UIntPtrT,
    lpstrGroupNames : Win32cr::Foundation::PSTR,
    nMaxGroupNames : UInt32,
    lpstrCardNames : Win32cr::Foundation::PSTR,
    nMaxCardNames : UInt32,
    rgguidInterfaces : LibC::GUID*,
    cguidInterfaces : UInt32,
    lpstrRdr : Win32cr::Foundation::PSTR,
    nMaxRdr : UInt32,
    lpstrCard : Win32cr::Foundation::PSTR,
    nMaxCard : UInt32,
    lpstrTitle : Win32cr::Foundation::PSTR,
    dwFlags : UInt32,
    pvUserData : Void*,
    dwShareMode : UInt32,
    dwPreferredProtocols : UInt32,
    dwActiveProtocol : UInt32,
    lpfnConnect : Win32cr::Security::Credentials::LPOCNCONNPROCA,
    lpfnCheck : Win32cr::Security::Credentials::LPOCNCHKPROC,
    lpfnDisconnect : Win32cr::Security::Credentials::LPOCNDSCPROC,
    hCardHandle : LibC::UIntPtrT

  @[Extern]
  record OPENCARDNAMEW,
    dwStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hSCardContext : LibC::UIntPtrT,
    lpstrGroupNames : Win32cr::Foundation::PWSTR,
    nMaxGroupNames : UInt32,
    lpstrCardNames : Win32cr::Foundation::PWSTR,
    nMaxCardNames : UInt32,
    rgguidInterfaces : LibC::GUID*,
    cguidInterfaces : UInt32,
    lpstrRdr : Win32cr::Foundation::PWSTR,
    nMaxRdr : UInt32,
    lpstrCard : Win32cr::Foundation::PWSTR,
    nMaxCard : UInt32,
    lpstrTitle : Win32cr::Foundation::PWSTR,
    dwFlags : UInt32,
    pvUserData : Void*,
    dwShareMode : UInt32,
    dwPreferredProtocols : UInt32,
    dwActiveProtocol : UInt32,
    lpfnConnect : Win32cr::Security::Credentials::LPOCNCONNPROCW,
    lpfnCheck : Win32cr::Security::Credentials::LPOCNCHKPROC,
    lpfnDisconnect : Win32cr::Security::Credentials::LPOCNDSCPROC,
    hCardHandle : LibC::UIntPtrT

  @[Extern]
  record SecPkgContext_ClientCreds,
    auth_buffer_len : UInt32,
    auth_buffer : UInt8*

  @[Extern]
  record CREDSSP_CRED,
    type__ : Win32cr::Security::Credentials::CREDSPP_SUBMIT_TYPE,
    pSchannelCred : Void*,
    pSpnegoCred : Void*

  @[Extern]
  record CREDSSP_CRED_EX,
    type__ : Win32cr::Security::Credentials::CREDSPP_SUBMIT_TYPE,
    version : UInt32,
    flags : UInt32,
    reserved : UInt32,
    cred : Win32cr::Security::Credentials::CREDSSP_CRED

  @[Link("keycredmgr")]
  @[Link("advapi32")]
  @[Link("credui")]
  @[Link("winscard")]
  @[Link("scarddlg")]
  lib C
    fun KeyCredentialManagerGetOperationErrorStates(keyCredentialManagerOperationType : Win32cr::Security::Credentials::KeyCredentialManagerOperationType, isReady : Win32cr::Foundation::BOOL*, keyCredentialManagerOperationErrorStates : Win32cr::Security::Credentials::KeyCredentialManagerOperationErrorStates*) : Win32cr::Foundation::HRESULT

    fun KeyCredentialManagerShowUIOperation(hWndOwner : Win32cr::Foundation::HWND, keyCredentialManagerOperationType : Win32cr::Security::Credentials::KeyCredentialManagerOperationType) : Win32cr::Foundation::HRESULT

    fun KeyCredentialManagerGetInformation(keyCredentialManagerInfo : Win32cr::Security::Credentials::KeyCredentialManagerInfo**) : Win32cr::Foundation::HRESULT

    fun KeyCredentialManagerFreeInformation(keyCredentialManagerInfo : Win32cr::Security::Credentials::KeyCredentialManagerInfo*) : Void

    fun CredWriteW(credential : Win32cr::Security::Credentials::CREDENTIALW*, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredWriteA(credential : Win32cr::Security::Credentials::CREDENTIALA*, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredReadW(target_name : Win32cr::Foundation::PWSTR, type__ : UInt32, flags : UInt32, credential : Win32cr::Security::Credentials::CREDENTIALW**) : Win32cr::Foundation::BOOL

    fun CredReadA(target_name : Win32cr::Foundation::PSTR, type__ : UInt32, flags : UInt32, credential : Win32cr::Security::Credentials::CREDENTIALA**) : Win32cr::Foundation::BOOL

    fun CredEnumerateW(filter : Win32cr::Foundation::PWSTR, flags : Win32cr::Security::Credentials::CRED_ENUMERATE_FLAGS, count : UInt32*, credential : Win32cr::Security::Credentials::CREDENTIALW***) : Win32cr::Foundation::BOOL

    fun CredEnumerateA(filter : Win32cr::Foundation::PSTR, flags : Win32cr::Security::Credentials::CRED_ENUMERATE_FLAGS, count : UInt32*, credential : Win32cr::Security::Credentials::CREDENTIALA***) : Win32cr::Foundation::BOOL

    fun CredWriteDomainCredentialsW(target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONW*, credential : Win32cr::Security::Credentials::CREDENTIALW*, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredWriteDomainCredentialsA(target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONA*, credential : Win32cr::Security::Credentials::CREDENTIALA*, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredReadDomainCredentialsW(target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONW*, flags : UInt32, count : UInt32*, credential : Win32cr::Security::Credentials::CREDENTIALW***) : Win32cr::Foundation::BOOL

    fun CredReadDomainCredentialsA(target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONA*, flags : UInt32, count : UInt32*, credential : Win32cr::Security::Credentials::CREDENTIALA***) : Win32cr::Foundation::BOOL

    fun CredDeleteW(target_name : Win32cr::Foundation::PWSTR, type__ : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredDeleteA(target_name : Win32cr::Foundation::PSTR, type__ : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredRenameW(old_target_name : Win32cr::Foundation::PWSTR, new_target_name : Win32cr::Foundation::PWSTR, type__ : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredRenameA(old_target_name : Win32cr::Foundation::PSTR, new_target_name : Win32cr::Foundation::PSTR, type__ : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun CredGetTargetInfoW(target_name : Win32cr::Foundation::PWSTR, flags : UInt32, target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONW**) : Win32cr::Foundation::BOOL

    fun CredGetTargetInfoA(target_name : Win32cr::Foundation::PSTR, flags : UInt32, target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONA**) : Win32cr::Foundation::BOOL

    fun CredMarshalCredentialW(cred_type : Win32cr::Security::Credentials::CRED_MARSHAL_TYPE, credential : Void*, marshaled_credential : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::BOOL

    fun CredMarshalCredentialA(cred_type : Win32cr::Security::Credentials::CRED_MARSHAL_TYPE, credential : Void*, marshaled_credential : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOL

    fun CredUnmarshalCredentialW(marshaled_credential : Win32cr::Foundation::PWSTR, cred_type : Win32cr::Security::Credentials::CRED_MARSHAL_TYPE*, credential : Void**) : Win32cr::Foundation::BOOL

    fun CredUnmarshalCredentialA(marshaled_credential : Win32cr::Foundation::PSTR, cred_type : Win32cr::Security::Credentials::CRED_MARSHAL_TYPE*, credential : Void**) : Win32cr::Foundation::BOOL

    fun CredIsMarshaledCredentialW(marshaled_credential : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun CredIsMarshaledCredentialA(marshaled_credential : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun CredUnPackAuthenticationBufferW(dwFlags : Win32cr::Security::Credentials::CRED_PACK_FLAGS, pAuthBuffer : Void*, cbAuthBuffer : UInt32, pszUserName : UInt16*, pcchMaxUserName : UInt32*, pszDomainName : UInt16*, pcchMaxDomainName : UInt32*, pszPassword : UInt16*, pcchMaxPassword : UInt32*) : Win32cr::Foundation::BOOL

    fun CredUnPackAuthenticationBufferA(dwFlags : Win32cr::Security::Credentials::CRED_PACK_FLAGS, pAuthBuffer : Void*, cbAuthBuffer : UInt32, pszUserName : UInt8*, pcchlMaxUserName : UInt32*, pszDomainName : UInt8*, pcchMaxDomainName : UInt32*, pszPassword : UInt8*, pcchMaxPassword : UInt32*) : Win32cr::Foundation::BOOL

    fun CredPackAuthenticationBufferW(dwFlags : Win32cr::Security::Credentials::CRED_PACK_FLAGS, pszUserName : Win32cr::Foundation::PWSTR, pszPassword : Win32cr::Foundation::PWSTR, pPackedCredentials : UInt8*, pcbPackedCredentials : UInt32*) : Win32cr::Foundation::BOOL

    fun CredPackAuthenticationBufferA(dwFlags : Win32cr::Security::Credentials::CRED_PACK_FLAGS, pszUserName : Win32cr::Foundation::PSTR, pszPassword : Win32cr::Foundation::PSTR, pPackedCredentials : UInt8*, pcbPackedCredentials : UInt32*) : Win32cr::Foundation::BOOL

    fun CredProtectW(fAsSelf : Win32cr::Foundation::BOOL, pszCredentials : UInt16*, cchCredentials : UInt32, pszProtectedCredentials : UInt16*, pcchMaxChars : UInt32*, protection_type : Win32cr::Security::Credentials::CRED_PROTECTION_TYPE*) : Win32cr::Foundation::BOOL

    fun CredProtectA(fAsSelf : Win32cr::Foundation::BOOL, pszCredentials : UInt8*, cchCredentials : UInt32, pszProtectedCredentials : UInt8*, pcchMaxChars : UInt32*, protection_type : Win32cr::Security::Credentials::CRED_PROTECTION_TYPE*) : Win32cr::Foundation::BOOL

    fun CredUnprotectW(fAsSelf : Win32cr::Foundation::BOOL, pszProtectedCredentials : UInt16*, cchProtectedCredentials : UInt32, pszCredentials : UInt16*, pcchMaxChars : UInt32*) : Win32cr::Foundation::BOOL

    fun CredUnprotectA(fAsSelf : Win32cr::Foundation::BOOL, pszProtectedCredentials : UInt8*, cchProtectedCredentials : UInt32, pszCredentials : UInt8*, pcchMaxChars : UInt32*) : Win32cr::Foundation::BOOL

    fun CredIsProtectedW(pszProtectedCredentials : Win32cr::Foundation::PWSTR, pProtectionType : Win32cr::Security::Credentials::CRED_PROTECTION_TYPE*) : Win32cr::Foundation::BOOL

    fun CredIsProtectedA(pszProtectedCredentials : Win32cr::Foundation::PSTR, pProtectionType : Win32cr::Security::Credentials::CRED_PROTECTION_TYPE*) : Win32cr::Foundation::BOOL

    fun CredFindBestCredentialW(target_name : Win32cr::Foundation::PWSTR, type__ : UInt32, flags : UInt32, credential : Win32cr::Security::Credentials::CREDENTIALW**) : Win32cr::Foundation::BOOL

    fun CredFindBestCredentialA(target_name : Win32cr::Foundation::PSTR, type__ : UInt32, flags : UInt32, credential : Win32cr::Security::Credentials::CREDENTIALA**) : Win32cr::Foundation::BOOL

    fun CredGetSessionTypes(maximum_persist_count : UInt32, maximum_persist : UInt32*) : Win32cr::Foundation::BOOL

    fun CredFree(buffer : Void*) : Void

    fun CredUIPromptForCredentialsW(pUiInfo : Win32cr::Security::Credentials::CREDUI_INFOW*, pszTargetName : Win32cr::Foundation::PWSTR, pContext : Win32cr::Security::Credentials::SecHandle*, dwAuthError : UInt32, pszUserName : UInt16*, ulUserNameBufferSize : UInt32, pszPassword : UInt16*, ulPasswordBufferSize : UInt32, save : Win32cr::Foundation::BOOL*, dwFlags : Win32cr::Security::Credentials::CREDUI_FLAGS) : UInt32

    fun CredUIPromptForCredentialsA(pUiInfo : Win32cr::Security::Credentials::CREDUI_INFOA*, pszTargetName : Win32cr::Foundation::PSTR, pContext : Win32cr::Security::Credentials::SecHandle*, dwAuthError : UInt32, pszUserName : UInt8*, ulUserNameBufferSize : UInt32, pszPassword : UInt8*, ulPasswordBufferSize : UInt32, save : Win32cr::Foundation::BOOL*, dwFlags : Win32cr::Security::Credentials::CREDUI_FLAGS) : UInt32

    fun CredUIPromptForWindowsCredentialsW(pUiInfo : Win32cr::Security::Credentials::CREDUI_INFOW*, dwAuthError : UInt32, pulAuthPackage : UInt32*, pvInAuthBuffer : Void*, ulInAuthBufferSize : UInt32, ppvOutAuthBuffer : Void**, pulOutAuthBufferSize : UInt32*, pfSave : Win32cr::Foundation::BOOL*, dwFlags : Win32cr::Security::Credentials::CREDUIWIN_FLAGS) : UInt32

    fun CredUIPromptForWindowsCredentialsA(pUiInfo : Win32cr::Security::Credentials::CREDUI_INFOA*, dwAuthError : UInt32, pulAuthPackage : UInt32*, pvInAuthBuffer : Void*, ulInAuthBufferSize : UInt32, ppvOutAuthBuffer : Void**, pulOutAuthBufferSize : UInt32*, pfSave : Win32cr::Foundation::BOOL*, dwFlags : Win32cr::Security::Credentials::CREDUIWIN_FLAGS) : UInt32

    fun CredUIParseUserNameW(user_name : Win32cr::Foundation::PWSTR, user : UInt16*, userBufferSize : UInt32, domain : UInt16*, domainBufferSize : UInt32) : UInt32

    fun CredUIParseUserNameA(userName : Win32cr::Foundation::PSTR, user : UInt8*, userBufferSize : UInt32, domain : UInt8*, domainBufferSize : UInt32) : UInt32

    fun CredUICmdLinePromptForCredentialsW(pszTargetName : Win32cr::Foundation::PWSTR, pContext : Win32cr::Security::Credentials::SecHandle*, dwAuthError : UInt32, user_name : UInt16*, ulUserBufferSize : UInt32, pszPassword : UInt16*, ulPasswordBufferSize : UInt32, pfSave : Win32cr::Foundation::BOOL*, dwFlags : Win32cr::Security::Credentials::CREDUI_FLAGS) : UInt32

    fun CredUICmdLinePromptForCredentialsA(pszTargetName : Win32cr::Foundation::PSTR, pContext : Win32cr::Security::Credentials::SecHandle*, dwAuthError : UInt32, user_name : UInt8*, ulUserBufferSize : UInt32, pszPassword : UInt8*, ulPasswordBufferSize : UInt32, pfSave : Win32cr::Foundation::BOOL*, dwFlags : Win32cr::Security::Credentials::CREDUI_FLAGS) : UInt32

    fun CredUIConfirmCredentialsW(pszTargetName : Win32cr::Foundation::PWSTR, bConfirm : Win32cr::Foundation::BOOL) : UInt32

    fun CredUIConfirmCredentialsA(pszTargetName : Win32cr::Foundation::PSTR, bConfirm : Win32cr::Foundation::BOOL) : UInt32

    fun CredUIStoreSSOCredW(pszRealm : Win32cr::Foundation::PWSTR, pszUsername : Win32cr::Foundation::PWSTR, pszPassword : Win32cr::Foundation::PWSTR, bPersist : Win32cr::Foundation::BOOL) : UInt32

    fun CredUIReadSSOCredW(pszRealm : Win32cr::Foundation::PWSTR, ppszUsername : Win32cr::Foundation::PWSTR*) : UInt32

    fun SCardEstablishContext(dwScope : Win32cr::Security::Credentials::SCARD_SCOPE, pvReserved1 : Void*, pvReserved2 : Void*, phContext : LibC::UIntPtrT*) : Int32

    fun SCardReleaseContext(hContext : LibC::UIntPtrT) : Int32

    fun SCardIsValidContext(hContext : LibC::UIntPtrT) : Int32

    fun SCardListReaderGroupsA(hContext : LibC::UIntPtrT, mszGroups : UInt8*, pcchGroups : UInt32*) : Int32

    fun SCardListReaderGroupsW(hContext : LibC::UIntPtrT, mszGroups : UInt16*, pcchGroups : UInt32*) : Int32

    fun SCardListReadersA(hContext : LibC::UIntPtrT, mszGroups : Win32cr::Foundation::PSTR, mszReaders : Win32cr::Foundation::PSTR, pcchReaders : UInt32*) : Int32

    fun SCardListReadersW(hContext : LibC::UIntPtrT, mszGroups : Win32cr::Foundation::PWSTR, mszReaders : Win32cr::Foundation::PWSTR, pcchReaders : UInt32*) : Int32

    fun SCardListCardsA(hContext : LibC::UIntPtrT, pbAtr : UInt8*, rgquidInterfaces : LibC::GUID*, cguidInterfaceCount : UInt32, mszCards : Win32cr::Foundation::PSTR, pcchCards : UInt32*) : Int32

    fun SCardListCardsW(hContext : LibC::UIntPtrT, pbAtr : UInt8*, rgquidInterfaces : LibC::GUID*, cguidInterfaceCount : UInt32, mszCards : Win32cr::Foundation::PWSTR, pcchCards : UInt32*) : Int32

    fun SCardListInterfacesA(hContext : LibC::UIntPtrT, szCard : Win32cr::Foundation::PSTR, pguidInterfaces : LibC::GUID*, pcguidInterfaces : UInt32*) : Int32

    fun SCardListInterfacesW(hContext : LibC::UIntPtrT, szCard : Win32cr::Foundation::PWSTR, pguidInterfaces : LibC::GUID*, pcguidInterfaces : UInt32*) : Int32

    fun SCardGetProviderIdA(hContext : LibC::UIntPtrT, szCard : Win32cr::Foundation::PSTR, pguidProviderId : LibC::GUID*) : Int32

    fun SCardGetProviderIdW(hContext : LibC::UIntPtrT, szCard : Win32cr::Foundation::PWSTR, pguidProviderId : LibC::GUID*) : Int32

    fun SCardGetCardTypeProviderNameA(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PSTR, dwProviderId : UInt32, szProvider : UInt8*, pcchProvider : UInt32*) : Int32

    fun SCardGetCardTypeProviderNameW(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PWSTR, dwProviderId : UInt32, szProvider : UInt16*, pcchProvider : UInt32*) : Int32

    fun SCardIntroduceReaderGroupA(hContext : LibC::UIntPtrT, szGroupName : Win32cr::Foundation::PSTR) : Int32

    fun SCardIntroduceReaderGroupW(hContext : LibC::UIntPtrT, szGroupName : Win32cr::Foundation::PWSTR) : Int32

    fun SCardForgetReaderGroupA(hContext : LibC::UIntPtrT, szGroupName : Win32cr::Foundation::PSTR) : Int32

    fun SCardForgetReaderGroupW(hContext : LibC::UIntPtrT, szGroupName : Win32cr::Foundation::PWSTR) : Int32

    fun SCardIntroduceReaderA(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PSTR, szDeviceName : Win32cr::Foundation::PSTR) : Int32

    fun SCardIntroduceReaderW(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PWSTR, szDeviceName : Win32cr::Foundation::PWSTR) : Int32

    fun SCardForgetReaderA(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PSTR) : Int32

    fun SCardForgetReaderW(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PWSTR) : Int32

    fun SCardAddReaderToGroupA(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PSTR, szGroupName : Win32cr::Foundation::PSTR) : Int32

    fun SCardAddReaderToGroupW(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PWSTR, szGroupName : Win32cr::Foundation::PWSTR) : Int32

    fun SCardRemoveReaderFromGroupA(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PSTR, szGroupName : Win32cr::Foundation::PSTR) : Int32

    fun SCardRemoveReaderFromGroupW(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PWSTR, szGroupName : Win32cr::Foundation::PWSTR) : Int32

    fun SCardIntroduceCardTypeA(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PSTR, pguidPrimaryProvider : LibC::GUID*, rgguidInterfaces : LibC::GUID*, dwInterfaceCount : UInt32, pbAtr : UInt8*, pbAtrMask : UInt8*, cbAtrLen : UInt32) : Int32

    fun SCardIntroduceCardTypeW(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PWSTR, pguidPrimaryProvider : LibC::GUID*, rgguidInterfaces : LibC::GUID*, dwInterfaceCount : UInt32, pbAtr : UInt8*, pbAtrMask : UInt8*, cbAtrLen : UInt32) : Int32

    fun SCardSetCardTypeProviderNameA(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PSTR, dwProviderId : UInt32, szProvider : Win32cr::Foundation::PSTR) : Int32

    fun SCardSetCardTypeProviderNameW(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PWSTR, dwProviderId : UInt32, szProvider : Win32cr::Foundation::PWSTR) : Int32

    fun SCardForgetCardTypeA(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PSTR) : Int32

    fun SCardForgetCardTypeW(hContext : LibC::UIntPtrT, szCardName : Win32cr::Foundation::PWSTR) : Int32

    fun SCardFreeMemory(hContext : LibC::UIntPtrT, pvMem : Void*) : Int32

    fun SCardAccessStartedEvent : Win32cr::Foundation::HANDLE

    fun SCardReleaseStartedEvent : Void

    fun SCardLocateCardsA(hContext : LibC::UIntPtrT, mszCards : Win32cr::Foundation::PSTR, rgReaderStates : Win32cr::Security::Credentials::SCARD_READERSTATEA*, cReaders : UInt32) : Int32

    fun SCardLocateCardsW(hContext : LibC::UIntPtrT, mszCards : Win32cr::Foundation::PWSTR, rgReaderStates : Win32cr::Security::Credentials::SCARD_READERSTATEW*, cReaders : UInt32) : Int32

    fun SCardLocateCardsByATRA(hContext : LibC::UIntPtrT, rgAtrMasks : Win32cr::Security::Credentials::SCARD_ATRMASK*, cAtrs : UInt32, rgReaderStates : Win32cr::Security::Credentials::SCARD_READERSTATEA*, cReaders : UInt32) : Int32

    fun SCardLocateCardsByATRW(hContext : LibC::UIntPtrT, rgAtrMasks : Win32cr::Security::Credentials::SCARD_ATRMASK*, cAtrs : UInt32, rgReaderStates : Win32cr::Security::Credentials::SCARD_READERSTATEW*, cReaders : UInt32) : Int32

    fun SCardGetStatusChangeA(hContext : LibC::UIntPtrT, dwTimeout : UInt32, rgReaderStates : Win32cr::Security::Credentials::SCARD_READERSTATEA*, cReaders : UInt32) : Int32

    fun SCardGetStatusChangeW(hContext : LibC::UIntPtrT, dwTimeout : UInt32, rgReaderStates : Win32cr::Security::Credentials::SCARD_READERSTATEW*, cReaders : UInt32) : Int32

    fun SCardCancel(hContext : LibC::UIntPtrT) : Int32

    fun SCardConnectA(hContext : LibC::UIntPtrT, szReader : Win32cr::Foundation::PSTR, dwShareMode : UInt32, dwPreferredProtocols : UInt32, phCard : LibC::UIntPtrT*, pdwActiveProtocol : UInt32*) : Int32

    fun SCardConnectW(hContext : LibC::UIntPtrT, szReader : Win32cr::Foundation::PWSTR, dwShareMode : UInt32, dwPreferredProtocols : UInt32, phCard : LibC::UIntPtrT*, pdwActiveProtocol : UInt32*) : Int32

    fun SCardReconnect(hCard : LibC::UIntPtrT, dwShareMode : UInt32, dwPreferredProtocols : UInt32, dwInitialization : UInt32, pdwActiveProtocol : UInt32*) : Int32

    fun SCardDisconnect(hCard : LibC::UIntPtrT, dwDisposition : UInt32) : Int32

    fun SCardBeginTransaction(hCard : LibC::UIntPtrT) : Int32

    fun SCardEndTransaction(hCard : LibC::UIntPtrT, dwDisposition : UInt32) : Int32

    fun SCardState(hCard : LibC::UIntPtrT, pdwState : UInt32*, pdwProtocol : UInt32*, pbAtr : UInt8*, pcbAtrLen : UInt32*) : Int32

    fun SCardStatusA(hCard : LibC::UIntPtrT, mszReaderNames : Win32cr::Foundation::PSTR, pcchReaderLen : UInt32*, pdwState : UInt32*, pdwProtocol : UInt32*, pbAtr : UInt8*, pcbAtrLen : UInt32*) : Int32

    fun SCardStatusW(hCard : LibC::UIntPtrT, mszReaderNames : Win32cr::Foundation::PWSTR, pcchReaderLen : UInt32*, pdwState : UInt32*, pdwProtocol : UInt32*, pbAtr : UInt8*, pcbAtrLen : UInt32*) : Int32

    fun SCardTransmit(hCard : LibC::UIntPtrT, pioSendPci : Win32cr::Security::Credentials::SCARD_IO_REQUEST*, pbSendBuffer : UInt8*, cbSendLength : UInt32, pioRecvPci : Win32cr::Security::Credentials::SCARD_IO_REQUEST*, pbRecvBuffer : UInt8*, pcbRecvLength : UInt32*) : Int32

    fun SCardGetTransmitCount(hCard : LibC::UIntPtrT, pcTransmitCount : UInt32*) : Int32

    fun SCardControl(hCard : LibC::UIntPtrT, dwControlCode : UInt32, lpInBuffer : Void*, cbInBufferSize : UInt32, lpOutBuffer : Void*, cbOutBufferSize : UInt32, lpBytesReturned : UInt32*) : Int32

    fun SCardGetAttrib(hCard : LibC::UIntPtrT, dwAttrId : UInt32, pbAttr : UInt8*, pcbAttrLen : UInt32*) : Int32

    fun SCardSetAttrib(hCard : LibC::UIntPtrT, dwAttrId : UInt32, pbAttr : UInt8*, cbAttrLen : UInt32) : Int32

    fun SCardUIDlgSelectCardA(param0 : Win32cr::Security::Credentials::OPENCARDNAME_EXA*) : Int32

    fun SCardUIDlgSelectCardW(param0 : Win32cr::Security::Credentials::OPENCARDNAME_EXW*) : Int32

    fun GetOpenCardNameA(param0 : Win32cr::Security::Credentials::OPENCARDNAMEA*) : Int32

    fun GetOpenCardNameW(param0 : Win32cr::Security::Credentials::OPENCARDNAMEW*) : Int32

    fun SCardDlgExtendedError : Int32

    fun SCardReadCacheA(hContext : LibC::UIntPtrT, card_identifier : LibC::GUID*, freshness_counter : UInt32, lookup_name : Win32cr::Foundation::PSTR, data : UInt8*, data_len : UInt32*) : Int32

    fun SCardReadCacheW(hContext : LibC::UIntPtrT, card_identifier : LibC::GUID*, freshness_counter : UInt32, lookup_name : Win32cr::Foundation::PWSTR, data : UInt8*, data_len : UInt32*) : Int32

    fun SCardWriteCacheA(hContext : LibC::UIntPtrT, card_identifier : LibC::GUID*, freshness_counter : UInt32, lookup_name : Win32cr::Foundation::PSTR, data : UInt8*, data_len : UInt32) : Int32

    fun SCardWriteCacheW(hContext : LibC::UIntPtrT, card_identifier : LibC::GUID*, freshness_counter : UInt32, lookup_name : Win32cr::Foundation::PWSTR, data : UInt8*, data_len : UInt32) : Int32

    fun SCardGetReaderIconA(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PSTR, pbIcon : UInt8*, pcbIcon : UInt32*) : Int32

    fun SCardGetReaderIconW(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PWSTR, pbIcon : UInt8*, pcbIcon : UInt32*) : Int32

    fun SCardGetDeviceTypeIdA(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PSTR, pdwDeviceTypeId : UInt32*) : Int32

    fun SCardGetDeviceTypeIdW(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PWSTR, pdwDeviceTypeId : UInt32*) : Int32

    fun SCardGetReaderDeviceInstanceIdA(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PSTR, szDeviceInstanceId : Win32cr::Foundation::PSTR, pcchDeviceInstanceId : UInt32*) : Int32

    fun SCardGetReaderDeviceInstanceIdW(hContext : LibC::UIntPtrT, szReaderName : Win32cr::Foundation::PWSTR, szDeviceInstanceId : Win32cr::Foundation::PWSTR, pcchDeviceInstanceId : UInt32*) : Int32

    fun SCardListReadersWithDeviceInstanceIdA(hContext : LibC::UIntPtrT, szDeviceInstanceId : Win32cr::Foundation::PSTR, mszReaders : Win32cr::Foundation::PSTR, pcchReaders : UInt32*) : Int32

    fun SCardListReadersWithDeviceInstanceIdW(hContext : LibC::UIntPtrT, szDeviceInstanceId : Win32cr::Foundation::PWSTR, mszReaders : Win32cr::Foundation::PWSTR, pcchReaders : UInt32*) : Int32

    fun SCardAudit(hContext : LibC::UIntPtrT, dwEvent : UInt32) : Int32

  end
end