require "../foundation.cr"
require "../system/com.cr"
require "../data/xml/msxml.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:eappcfg.dll")]
@[Link(ldflags: "/DELAYLOAD:eappprxy.dll")]
{% else %}
@[Link("eappcfg")]
@[Link("eappprxy")]
{% end %}
lib LibWin32
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
  EAP_METHOD_AUTHENTICATOR_CONFIG_IS_IDENTITY_PRIVACY = 1_u32
  RAS_EAP_ROLE_AUTHENTICATOR = 1_u32
  RAS_EAP_ROLE_AUTHENTICATEE = 2_u32
  RAS_EAP_ROLE_EXCLUDE_IN_EAP = 4_u32
  RAS_EAP_ROLE_EXCLUDE_IN_PEAP = 8_u32
  RAS_EAP_ROLE_EXCLUDE_IN_VPN = 16_u32
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

  alias NotificationHandler = Proc(Guid, Void*, Void)


  enum RAS_AUTH_ATTRIBUTE_TYPE : Int32
    Raatminimum = 0
    Raatusername = 1
    Raatuserpassword = 2
    Raatmd5chappassword = 3
    Raatnasipaddress = 4
    Raatnasport = 5
    Raatservicetype = 6
    Raatframedprotocol = 7
    Raatframedipaddress = 8
    Raatframedipnetmask = 9
    Raatframedrouting = 10
    Raatfilterid = 11
    Raatframedmtu = 12
    Raatframedcompression = 13
    Raatloginiphost = 14
    Raatloginservice = 15
    Raatlogintcpport = 16
    Raatunassigned17 = 17
    Raatreplymessage = 18
    Raatcallbacknumber = 19
    Raatcallbackid = 20
    Raatunassigned21 = 21
    Raatframedroute = 22
    Raatframedipxnetwork = 23
    Raatstate = 24
    Raatclass = 25
    Raatvendorspecific = 26
    Raatsessiontimeout = 27
    Raatidletimeout = 28
    Raatterminationaction = 29
    Raatcalledstationid = 30
    Raatcallingstationid = 31
    Raatnasidentifier = 32
    Raatproxystate = 33
    Raatloginlatservice = 34
    Raatloginlatnode = 35
    Raatloginlatgroup = 36
    Raatframedappletalklink = 37
    Raatframedappletalknetwork = 38
    Raatframedappletalkzone = 39
    Raatacctstatustype = 40
    Raatacctdelaytime = 41
    Raatacctinputoctets = 42
    Raatacctoutputoctets = 43
    Raatacctsessionid = 44
    Raatacctauthentic = 45
    Raatacctsessiontime = 46
    Raatacctinputpackets = 47
    Raatacctoutputpackets = 48
    Raatacctterminatecause = 49
    Raatacctmultisessionid = 50
    Raatacctlinkcount = 51
    Raataccteventtimestamp = 55
    Raatmd5chapchallenge = 60
    Raatnasporttype = 61
    Raatportlimit = 62
    Raatloginlatport = 63
    Raattunneltype = 64
    Raattunnelmediumtype = 65
    Raattunnelclientendpoint = 66
    Raattunnelserverendpoint = 67
    Raatarappassword = 70
    Raatarapfeatures = 71
    Raatarapzoneaccess = 72
    Raatarapsecurity = 73
    Raatarapsecuritydata = 74
    Raatpasswordretry = 75
    Raatprompt = 76
    Raatconnectinfo = 77
    Raatconfigurationtoken = 78
    Raateapmessage = 79
    Raatsignature = 80
    Raatarapchallengeresponse = 84
    Raatacctinteriminterval = 85
    Raatnasipv6address = 95
    Raatframedinterfaceid = 96
    Raatframedipv6prefix = 97
    Raatloginipv6host = 98
    Raatframedipv6route = 99
    Raatframedipv6pool = 100
    Raatarapguestlogon = 8096
    Raatcertificateoid = 8097
    Raateapconfiguration = 8098
    Raatpeapembeddedeaptypeid = 8099
    Raatinnereaptypeid = 8099
    Raatpeapfastroamedsession = 8100
    Raatfastroamedsession = 8100
    Raateaptlv = 8102
    Raatcredentialschanged = 8103
    Raatcertificatethumbprint = 8250
    Raatpeerid = 9000
    Raatserverid = 9001
    Raatmethodid = 9002
    Raatemsk = 9003
    Raatsessionid = 9004
    Raatreserved = -1
  end

  enum PPP_EAP_ACTION : Int32
    EAPACTION_NoAction = 0
    EAPACTION_Authenticate = 1
    EAPACTION_Done = 2
    EAPACTION_SendAndDone = 3
    EAPACTION_Send = 4
    EAPACTION_SendWithTimeout = 5
    EAPACTION_SendWithTimeoutInteractive = 6
    EAPACTION_IndicateTLV = 7
    EAPACTION_IndicateIdentity = 8
  end

  enum EAP_ATTRIBUTE_TYPE : Int32
    Eatminimum = 0
    Eatusername = 1
    Eatuserpassword = 2
    Eatmd5chappassword = 3
    Eatnasipaddress = 4
    Eatnasport = 5
    Eatservicetype = 6
    Eatframedprotocol = 7
    Eatframedipaddress = 8
    Eatframedipnetmask = 9
    Eatframedrouting = 10
    Eatfilterid = 11
    Eatframedmtu = 12
    Eatframedcompression = 13
    Eatloginiphost = 14
    Eatloginservice = 15
    Eatlogintcpport = 16
    Eatunassigned17 = 17
    Eatreplymessage = 18
    Eatcallbacknumber = 19
    Eatcallbackid = 20
    Eatunassigned21 = 21
    Eatframedroute = 22
    Eatframedipxnetwork = 23
    Eatstate = 24
    Eatclass = 25
    Eatvendorspecific = 26
    Eatsessiontimeout = 27
    Eatidletimeout = 28
    Eatterminationaction = 29
    Eatcalledstationid = 30
    Eatcallingstationid = 31
    Eatnasidentifier = 32
    Eatproxystate = 33
    Eatloginlatservice = 34
    Eatloginlatnode = 35
    Eatloginlatgroup = 36
    Eatframedappletalklink = 37
    Eatframedappletalknetwork = 38
    Eatframedappletalkzone = 39
    Eatacctstatustype = 40
    Eatacctdelaytime = 41
    Eatacctinputoctets = 42
    Eatacctoutputoctets = 43
    Eatacctsessionid = 44
    Eatacctauthentic = 45
    Eatacctsessiontime = 46
    Eatacctinputpackets = 47
    Eatacctoutputpackets = 48
    Eatacctterminatecause = 49
    Eatacctmultisessionid = 50
    Eatacctlinkcount = 51
    Eataccteventtimestamp = 55
    Eatmd5chapchallenge = 60
    Eatnasporttype = 61
    Eatportlimit = 62
    Eatloginlatport = 63
    Eattunneltype = 64
    Eattunnelmediumtype = 65
    Eattunnelclientendpoint = 66
    Eattunnelserverendpoint = 67
    Eatarappassword = 70
    Eatarapfeatures = 71
    Eatarapzoneaccess = 72
    Eatarapsecurity = 73
    Eatarapsecuritydata = 74
    Eatpasswordretry = 75
    Eatprompt = 76
    Eatconnectinfo = 77
    Eatconfigurationtoken = 78
    Eateapmessage = 79
    Eatsignature = 80
    Eatarapchallengeresponse = 84
    Eatacctinteriminterval = 85
    Eatnasipv6address = 95
    Eatframedinterfaceid = 96
    Eatframedipv6prefix = 97
    Eatloginipv6host = 98
    Eatframedipv6route = 99
    Eatframedipv6pool = 100
    Eatarapguestlogon = 8096
    Eatcertificateoid = 8097
    Eateapconfiguration = 8098
    Eatpeapembeddedeaptypeid = 8099
    Eatpeapfastroamedsession = 8100
    Eatfastroamedsession = 8100
    Eateaptlv = 8102
    Eatcredentialschanged = 8103
    Eatinnereapmethodtype = 8104
    Eatcleartextpassword = 8107
    Eatquarantinesoh = 8150
    Eatcertificatethumbprint = 8250
    Eatpeerid = 9000
    Eatserverid = 9001
    Eatmethodid = 9002
    Eatemsk = 9003
    Eatsessionid = 9004
    Eatreserved = -1
  end

  enum EAP_CONFIG_INPUT_FIELD_TYPE : Int32
    EapConfigInputUsername = 0
    EapConfigInputPassword = 1
    EapConfigInputNetworkUsername = 2
    EapConfigInputNetworkPassword = 3
    EapConfigInputPin = 4
    EapConfigInputPSK = 5
    EapConfigInputEdit = 6
    EapConfigSmartCardUsername = 7
    EapConfigSmartCardError = 8
  end

  enum EAP_INTERACTIVE_UI_DATA_TYPE : Int32
    EapCredReq = 0
    EapCredResp = 1
    EapCredExpiryReq = 2
    EapCredExpiryResp = 3
    EapCredLogonReq = 4
    EapCredLogonResp = 5
  end

  enum EAP_METHOD_PROPERTY_TYPE : Int32
    Emptpropciphersuitenegotiation = 0
    Emptpropmutualauth = 1
    Emptpropintegrity = 2
    Emptpropreplayprotection = 3
    Emptpropconfidentiality = 4
    Emptpropkeyderivation = 5
    Emptpropkeystrength64 = 6
    Emptpropkeystrength128 = 7
    Emptpropkeystrength256 = 8
    Emptpropkeystrength512 = 9
    Emptpropkeystrength1024 = 10
    Emptpropdictionaryattackresistance = 11
    Emptpropfastreconnect = 12
    Emptpropcryptobinding = 13
    Emptpropsessionindependence = 14
    Emptpropfragmentation = 15
    Emptpropchannelbinding = 16
    Emptpropnap = 17
    Emptpropstandalone = 18
    Emptpropmppeencryption = 19
    Emptproptunnelmethod = 20
    Emptpropsupportsconfig = 21
    Emptpropcertifiedmethod = 22
    Emptprophiddenmethod = 23
    Emptpropmachineauth = 24
    Emptpropuserauth = 25
    Emptpropidentityprivacy = 26
    Emptpropmethodchaining = 27
    Emptpropsharedstateequivalence = 28
    Emptlegacymethodpropertyflag = 31
    Emptpropvendorspecific = 255
  end

  enum EAP_METHOD_PROPERTY_VALUE_TYPE : Int32
    Empvtbool = 0
    Empvtdword = 1
    Empvtstring = 2
  end

  enum EapCredentialType : Int32
    EAP_EMPTY_CREDENTIAL = 0
    EAP_USERNAME_PASSWORD_CREDENTIAL = 1
    EAP_WINLOGON_CREDENTIAL = 2
    EAP_CERTIFICATE_CREDENTIAL = 3
    EAP_SIM_CREDENTIAL = 4
  end

  enum EapHostPeerMethodResultReason : Int32
    EapHostPeerMethodResultAltSuccessReceived = 1
    EapHostPeerMethodResultTimeout = 2
    EapHostPeerMethodResultFromMethod = 3
  end

  enum EapHostPeerResponseAction : Int32
    EapHostPeerResponseDiscard = 0
    EapHostPeerResponseSend = 1
    EapHostPeerResponseResult = 2
    EapHostPeerResponseInvokeUi = 3
    EapHostPeerResponseRespond = 4
    EapHostPeerResponseStartAuthentication = 5
    EapHostPeerResponseNone = 6
  end

  enum EapHostPeerAuthParams : Int32
    EapHostPeerAuthStatus = 1
    EapHostPeerIdentity = 2
    EapHostPeerIdentityExtendedInfo = 3
    EapHostNapInfo = 4
  end

  enum EAPHOST_AUTH_STATUS : Int32
    EapHostInvalidSession = 0
    EapHostAuthNotStarted = 1
    EapHostAuthIdentityExchange = 2
    EapHostAuthNegotiatingType = 3
    EapHostAuthInProgress = 4
    EapHostAuthSucceeded = 5
    EapHostAuthFailed = 6
  end

  enum ISOLATION_STATE : Int32
    ISOLATION_STATE_UNKNOWN = 0
    ISOLATION_STATE_NOT_RESTRICTED = 1
    ISOLATION_STATE_IN_PROBATION = 2
    ISOLATION_STATE_RESTRICTED_ACCESS = 3
  end

  enum EapCode : Int32
    EapCodeMinimum = 1
    EapCodeRequest = 1
    EapCodeResponse = 2
    EapCodeSuccess = 3
    EapCodeFailure = 4
    EapCodeMaximum = 4
  end

  enum EAP_METHOD_AUTHENTICATOR_RESPONSE_ACTION : Int32
    EAP_METHOD_AUTHENTICATOR_RESPONSE_DISCARD = 0
    EAP_METHOD_AUTHENTICATOR_RESPONSE_SEND = 1
    EAP_METHOD_AUTHENTICATOR_RESPONSE_RESULT = 2
    EAP_METHOD_AUTHENTICATOR_RESPONSE_RESPOND = 3
    EAP_METHOD_AUTHENTICATOR_RESPONSE_AUTHENTICATE = 4
    EAP_METHOD_AUTHENTICATOR_RESPONSE_HANDLE_IDENTITY = 5
  end

  enum EapPeerMethodResponseAction : Int32
    EapPeerMethodResponseActionDiscard = 0
    EapPeerMethodResponseActionSend = 1
    EapPeerMethodResponseActionResult = 2
    EapPeerMethodResponseActionInvokeUI = 3
    EapPeerMethodResponseActionRespond = 4
    EapPeerMethodResponseActionNone = 5
  end

  enum EapPeerMethodResultReason : Int32
    EapPeerMethodResultUnknown = 1
    EapPeerMethodResultSuccess = 2
    EapPeerMethodResultFailure = 3
  end

  enum EAP_AUTHENTICATOR_SEND_TIMEOUT : Int32
    EAP_AUTHENTICATOR_SEND_TIMEOUT_NONE = 0
    EAP_AUTHENTICATOR_SEND_TIMEOUT_BASIC = 1
    EAP_AUTHENTICATOR_SEND_TIMEOUT_INTERACTIVE = 2
  end

  union EAP_UI_DATA_FORMAT
    cred_data : EAP_CONFIG_INPUT_FIELD_ARRAY*
    cred_expiry_data : EAP_CRED_EXPIRY_REQ*
    cred_logon_data : EAP_CONFIG_INPUT_FIELD_ARRAY*
  end
  union EAP_METHOD_PROPERTY_VALUE
    empv_bool : EAP_METHOD_PROPERTY_VALUE_BOOL
    empv_dword : EAP_METHOD_PROPERTY_VALUE_DWORD
    empv_string : EAP_METHOD_PROPERTY_VALUE_STRING
  end
  union EapCredentialTypeData
    username_password : EapUsernamePasswordCredential
    certificate : EapCertificateCredential
    sim : EapSimCredential
  end

  struct NgcTicketContext
    wsz_ticket : Char[45]*
    h_key : LibC::UINT_PTR
    h_impersonate_token : LibC::HANDLE
  end
  struct RAS_AUTH_ATTRIBUTE
    raa_type : RAS_AUTH_ATTRIBUTE_TYPE
    dw_length : UInt32
    value : Void*
  end
  struct PPP_EAP_PACKET
    code : UInt8
    id : UInt8
    length : UInt8[2]*
    data : UInt8[0]*
  end
  struct PPP_EAP_INPUT
    dw_size_in_bytes : UInt32
    f_flags : UInt32
    f_authenticator : LibC::BOOL
    pwsz_identity : LibC::LPWSTR
    pwsz_password : LibC::LPWSTR
    b_initial_id : UInt8
    p_user_attributes : RAS_AUTH_ATTRIBUTE*
    f_authentication_complete : LibC::BOOL
    dw_auth_result_code : UInt32
    h_token_impersonate_user : LibC::HANDLE
    f_success_packet_received : LibC::BOOL
    f_data_received_from_interactive_ui : LibC::BOOL
    p_data_from_interactive_ui : UInt8*
    dw_size_of_data_from_interactive_ui : UInt32
    p_connection_data : UInt8*
    dw_size_of_connection_data : UInt32
    p_user_data : UInt8*
    dw_size_of_user_data : UInt32
    h_reserved : LibC::HANDLE
    guid_connection_id : Guid
    is_vpn : LibC::BOOL
  end
  struct PPP_EAP_OUTPUT
    dw_size_in_bytes : UInt32
    action : PPP_EAP_ACTION
    dw_auth_result_code : UInt32
    p_user_attributes : RAS_AUTH_ATTRIBUTE*
    f_invoke_interactive_ui : LibC::BOOL
    p_ui_context_data : UInt8*
    dw_size_of_ui_context_data : UInt32
    f_save_connection_data : LibC::BOOL
    p_connection_data : UInt8*
    dw_size_of_connection_data : UInt32
    f_save_user_data : LibC::BOOL
    p_user_data : UInt8*
    dw_size_of_user_data : UInt32
    p_ngc_kerb_ticket : NgcTicketContext*
    f_save_to_cred_man : LibC::BOOL
  end
  struct PPP_EAP_INFO
    dw_size_in_bytes : UInt32
    dw_eap_type_id : UInt32
    ras_eap_initialize : LibC::IntPtrT
    ras_eap_begin : LibC::IntPtrT
    ras_eap_end : LibC::IntPtrT
    ras_eap_make_message : LibC::IntPtrT
  end
  struct LEGACY_IDENTITY_UI_PARAMS
    eap_type : UInt32
    dw_flags : UInt32
    dw_sizeof_connection_data : UInt32
    p_connection_data : UInt8*
    dw_sizeof_user_data : UInt32
    p_user_data : UInt8*
    dw_sizeof_user_data_out : UInt32
    p_user_data_out : UInt8*
    pwsz_identity : LibC::LPWSTR
    dw_error : UInt32
  end
  struct LEGACY_INTERACTIVE_UI_PARAMS
    eap_type : UInt32
    dw_sizeof_context_data : UInt32
    p_context_data : UInt8*
    dw_sizeof_interactive_ui_data : UInt32
    p_interactive_ui_data : UInt8*
    dw_error : UInt32
  end
  struct EAP_TYPE
    type : UInt8
    dw_vendor_id : UInt32
    dw_vendor_type : UInt32
  end
  struct EAP_METHOD_TYPE
    eap_type : EAP_TYPE
    dw_author_id : UInt32
  end
  struct EAP_METHOD_INFO
    eaptype : EAP_METHOD_TYPE
    pwsz_author_name : LibC::LPWSTR
    pwsz_friendly_name : LibC::LPWSTR
    eap_properties : UInt32
    p_inner_method_info : EAP_METHOD_INFO*
  end
  struct EAP_METHOD_INFO_EX
    eaptype : EAP_METHOD_TYPE
    pwsz_author_name : LibC::LPWSTR
    pwsz_friendly_name : LibC::LPWSTR
    eap_properties : UInt32
    p_inner_method_info_array : EAP_METHOD_INFO_ARRAY_EX*
  end
  struct EAP_METHOD_INFO_ARRAY
    dw_number_of_methods : UInt32
    p_eap_methods : EAP_METHOD_INFO*
  end
  struct EAP_METHOD_INFO_ARRAY_EX
    dw_number_of_methods : UInt32
    p_eap_methods : EAP_METHOD_INFO_EX*
  end
  struct EAP_ERROR
    dw_win_error : UInt32
    type : EAP_METHOD_TYPE
    dw_reason_code : UInt32
    root_cause_guid : Guid
    repair_guid : Guid
    help_link_guid : Guid
    p_root_cause_string : LibC::LPWSTR
    p_repair_string : LibC::LPWSTR
  end
  struct EAP_ATTRIBUTE
    ea_type : EAP_ATTRIBUTE_TYPE
    dw_length : UInt32
    p_value : UInt8*
  end
  struct EAP_ATTRIBUTES
    dw_number_of_attributes : UInt32
    p_attribs : EAP_ATTRIBUTE*
  end
  struct EAP_CONFIG_INPUT_FIELD_DATA
    dw_size : UInt32
    type : EAP_CONFIG_INPUT_FIELD_TYPE
    dw_flag_props : UInt32
    pwsz_label : LibC::LPWSTR
    pwsz_data : LibC::LPWSTR
    dw_min_data_length : UInt32
    dw_max_data_length : UInt32
  end
  struct EAP_CONFIG_INPUT_FIELD_ARRAY
    dw_version : UInt32
    dw_number_of_fields : UInt32
    p_fields : EAP_CONFIG_INPUT_FIELD_DATA*
  end
  struct EAP_CRED_EXPIRY_REQ
    cur_creds : EAP_CONFIG_INPUT_FIELD_ARRAY
    new_creds : EAP_CONFIG_INPUT_FIELD_ARRAY
  end
  struct EAP_INTERACTIVE_UI_DATA
    dw_version : UInt32
    dw_size : UInt32
    dw_data_type : EAP_INTERACTIVE_UI_DATA_TYPE
    cb_ui_data : UInt32
    pb_ui_data : EAP_UI_DATA_FORMAT
  end
  struct EAP_METHOD_PROPERTY_VALUE_BOOL
    length : UInt32
    value : LibC::BOOL
  end
  struct EAP_METHOD_PROPERTY_VALUE_DWORD
    length : UInt32
    value : UInt32
  end
  struct EAP_METHOD_PROPERTY_VALUE_STRING
    length : UInt32
    value : UInt8*
  end
  struct EAP_METHOD_PROPERTY
    eap_method_property_type : EAP_METHOD_PROPERTY_TYPE
    eap_method_property_value_type : EAP_METHOD_PROPERTY_VALUE_TYPE
    eap_method_property_value : EAP_METHOD_PROPERTY_VALUE
  end
  struct EAP_METHOD_PROPERTY_ARRAY
    dw_number_of_properties : UInt32
    p_method_property : EAP_METHOD_PROPERTY*
  end
  struct EAPHOST_IDENTITY_UI_PARAMS
    eap_method_type : EAP_METHOD_TYPE
    dw_flags : UInt32
    dw_sizeof_connection_data : UInt32
    p_connection_data : UInt8*
    dw_sizeof_user_data : UInt32
    p_user_data : UInt8*
    dw_sizeof_user_data_out : UInt32
    p_user_data_out : UInt8*
    pwsz_identity : LibC::LPWSTR
    dw_error : UInt32
    p_eap_error : EAP_ERROR*
  end
  struct EAPHOST_INTERACTIVE_UI_PARAMS
    dw_sizeof_context_data : UInt32
    p_context_data : UInt8*
    dw_sizeof_interactive_ui_data : UInt32
    p_interactive_ui_data : UInt8*
    dw_error : UInt32
    p_eap_error : EAP_ERROR*
  end
  struct EapUsernamePasswordCredential
    username : LibC::LPWSTR
    password : LibC::LPWSTR
  end
  struct EapCertificateCredential
    cert_hash : UInt8[20]*
    password : LibC::LPWSTR
  end
  struct EapSimCredential
    icc_id : LibC::LPWSTR
  end
  struct EapCredential
    cred_type : EapCredentialType
    cred_data : EapCredentialTypeData
  end
  struct EAPHOST_AUTH_INFO
    status : EAPHOST_AUTH_STATUS
    dw_error_code : UInt32
    dw_reason_code : UInt32
  end
  struct EapHostPeerMethodResult
    f_is_success : LibC::BOOL
    dw_failure_reason_code : UInt32
    f_save_connection_data : LibC::BOOL
    dw_sizeof_connection_data : UInt32
    p_connection_data : UInt8*
    f_save_user_data : LibC::BOOL
    dw_sizeof_user_data : UInt32
    p_user_data : UInt8*
    p_attrib_array : EAP_ATTRIBUTES*
    isolation_state : ISOLATION_STATE
    p_eap_method_info : EAP_METHOD_INFO*
    p_eap_error : EAP_ERROR*
  end
  struct EapPacket
    code : UInt8
    id : UInt8
    length : UInt8[2]*
    data : UInt8[0]*
  end
  struct EAP_METHOD_AUTHENTICATOR_RESULT
    f_is_success : LibC::BOOL
    dw_failure_reason : UInt32
    p_auth_attribs : EAP_ATTRIBUTES*
  end
  struct EapPeerMethodOutput
    action : EapPeerMethodResponseAction
    f_allow_notifications : LibC::BOOL
  end
  struct EapPeerMethodResult
    f_is_success : LibC::BOOL
    dw_failure_reason_code : UInt32
    f_save_connection_data : LibC::BOOL
    dw_sizeof_connection_data : UInt32
    p_connection_data : UInt8*
    f_save_user_data : LibC::BOOL
    dw_sizeof_user_data : UInt32
    p_user_data : UInt8*
    p_attrib_array : EAP_ATTRIBUTES*
    p_eap_error : EAP_ERROR*
    p_ngc_kerb_ticket : NgcTicketContext*
    f_save_to_cred_man : LibC::BOOL
  end
  struct EAP_PEER_METHOD_ROUTINES
    dw_version : UInt32
    p_eap_type : EAP_TYPE*
    eap_peer_initialize : LibC::IntPtrT
    eap_peer_get_identity : LibC::IntPtrT
    eap_peer_begin_session : LibC::IntPtrT
    eap_peer_set_credentials : LibC::IntPtrT
    eap_peer_process_request_packet : LibC::IntPtrT
    eap_peer_get_response_packet : LibC::IntPtrT
    eap_peer_get_result : LibC::IntPtrT
    eap_peer_get_ui_context : LibC::IntPtrT
    eap_peer_set_ui_context : LibC::IntPtrT
    eap_peer_get_response_attributes : LibC::IntPtrT
    eap_peer_set_response_attributes : LibC::IntPtrT
    eap_peer_end_session : LibC::IntPtrT
    eap_peer_shutdown : LibC::IntPtrT
  end
  struct EAP_AUTHENTICATOR_METHOD_ROUTINES
    dw_size_in_bytes : UInt32
    p_eap_type : EAP_METHOD_TYPE*
    eap_method_authenticator_initialize : LibC::IntPtrT
    eap_method_authenticator_begin_session : LibC::IntPtrT
    eap_method_authenticator_update_inner_method_params : LibC::IntPtrT
    eap_method_authenticator_receive_packet : LibC::IntPtrT
    eap_method_authenticator_send_packet : LibC::IntPtrT
    eap_method_authenticator_get_attributes : LibC::IntPtrT
    eap_method_authenticator_set_attributes : LibC::IntPtrT
    eap_method_authenticator_get_result : LibC::IntPtrT
    eap_method_authenticator_end_session : LibC::IntPtrT
    eap_method_authenticator_shutdown : LibC::IntPtrT
  end


  struct IRouterProtocolConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_protocol : UInt64
    remove_protocol : UInt64
  end

  IRouterProtocolConfig_GUID = "66a2db16-d706-11d0-a37b-00c04fc9da04"
  IID_IRouterProtocolConfig = LibC::GUID.new(0x66a2db16_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
  struct IRouterProtocolConfig
    lpVtbl : IRouterProtocolConfigVTbl*
  end

  struct IAuthenticationProviderConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    uninitialize : UInt64
    configure : UInt64
    activate : UInt64
    deactivate : UInt64
  end

  IAuthenticationProviderConfig_GUID = "66a2db17-d706-11d0-a37b-00c04fc9da04"
  IID_IAuthenticationProviderConfig = LibC::GUID.new(0x66a2db17_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
  struct IAuthenticationProviderConfig
    lpVtbl : IAuthenticationProviderConfigVTbl*
  end

  struct IAccountingProviderConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    uninitialize : UInt64
    configure : UInt64
    activate : UInt64
    deactivate : UInt64
  end

  IAccountingProviderConfig_GUID = "66a2db18-d706-11d0-a37b-00c04fc9da04"
  IID_IAccountingProviderConfig = LibC::GUID.new(0x66a2db18_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
  struct IAccountingProviderConfig
    lpVtbl : IAccountingProviderConfigVTbl*
  end

  struct IEAPProviderConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    uninitialize : UInt64
    server_invoke_config_ui : UInt64
    router_invoke_config_ui : UInt64
    router_invoke_credentials_ui : UInt64
  end

  IEAPProviderConfig_GUID = "66a2db19-d706-11d0-a37b-00c04fc9da04"
  IID_IEAPProviderConfig = LibC::GUID.new(0x66a2db19_u32, 0xd706_u16, 0x11d0_u16, StaticArray[0xa3_u8, 0x7b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xda_u8, 0x4_u8])
  struct IEAPProviderConfig
    lpVtbl : IEAPProviderConfigVTbl*
  end

  struct IEAPProviderConfig2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    uninitialize : UInt64
    server_invoke_config_ui : UInt64
    router_invoke_config_ui : UInt64
    router_invoke_credentials_ui : UInt64
    server_invoke_config_ui2 : UInt64
    get_global_config : UInt64
  end

  IEAPProviderConfig2_GUID = "d565917a-85c4-4466-856e-671c3742ea9a"
  IID_IEAPProviderConfig2 = LibC::GUID.new(0xd565917a_u32, 0x85c4_u16, 0x4466_u16, StaticArray[0x85_u8, 0x6e_u8, 0x67_u8, 0x1c_u8, 0x37_u8, 0x42_u8, 0xea_u8, 0x9a_u8])
  struct IEAPProviderConfig2
    lpVtbl : IEAPProviderConfig2VTbl*
  end

  struct IEAPProviderConfig3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    uninitialize : UInt64
    server_invoke_config_ui : UInt64
    router_invoke_config_ui : UInt64
    router_invoke_credentials_ui : UInt64
    server_invoke_config_ui2 : UInt64
    get_global_config : UInt64
    server_invoke_certificate_config_ui : UInt64
  end

  IEAPProviderConfig3_GUID = "b78ecd12-68bb-4f86-9bf0-8438dd3be982"
  IID_IEAPProviderConfig3 = LibC::GUID.new(0xb78ecd12_u32, 0x68bb_u16, 0x4f86_u16, StaticArray[0x9b_u8, 0xf0_u8, 0x84_u8, 0x38_u8, 0xdd_u8, 0x3b_u8, 0xe9_u8, 0x82_u8])
  struct IEAPProviderConfig3
    lpVtbl : IEAPProviderConfig3VTbl*
  end


  # Params # peapmethodinfoarray : EAP_METHOD_INFO_ARRAY* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerGetMethods(peapmethodinfoarray : EAP_METHOD_INFO_ARRAY*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # dwversion : UInt32 [In],dwflags : UInt32 [In],eapmethodtype : EAP_METHOD_TYPE [In],huserimpersonationtoken : LibC::HANDLE [In],dweapconndatasize : UInt32 [In],pbeapconndata : UInt8* [In],dwuserdatasize : UInt32 [In],pbuserdata : UInt8* [In],pmethodpropertyarray : EAP_METHOD_PROPERTY_ARRAY* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerGetMethodProperties(dwversion : UInt32, dwflags : UInt32, eapmethodtype : EAP_METHOD_TYPE, huserimpersonationtoken : LibC::HANDLE, dweapconndatasize : UInt32, pbeapconndata : UInt8*, dwuserdatasize : UInt32, pbuserdata : UInt8*, pmethodpropertyarray : EAP_METHOD_PROPERTY_ARRAY*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # hwndparent : LibC::HANDLE [In],dwflags : UInt32 [In],eapmethodtype : EAP_METHOD_TYPE [In],dwsizeofconfigin : UInt32 [In],pconfigin : UInt8* [In],pdwsizeofconfigout : UInt32* [In],ppconfigout : UInt8** [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerInvokeConfigUI(hwndparent : LibC::HANDLE, dwflags : UInt32, eapmethodtype : EAP_METHOD_TYPE, dwsizeofconfigin : UInt32, pconfigin : UInt8*, pdwsizeofconfigout : UInt32*, ppconfigout : UInt8**, ppeaperror : EAP_ERROR**) : UInt32

  # Params # huserimpersonationtoken : LibC::HANDLE [In],eapmethodtype : EAP_METHOD_TYPE [In],dwflags : UInt32 [In],dweapconndatasize : UInt32 [In],pbeapconndata : UInt8* [In],peapconfiginputfieldarray : EAP_CONFIG_INPUT_FIELD_ARRAY* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerQueryCredentialInputFields(huserimpersonationtoken : LibC::HANDLE, eapmethodtype : EAP_METHOD_TYPE, dwflags : UInt32, dweapconndatasize : UInt32, pbeapconndata : UInt8*, peapconfiginputfieldarray : EAP_CONFIG_INPUT_FIELD_ARRAY*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # huserimpersonationtoken : LibC::HANDLE [In],eapmethodtype : EAP_METHOD_TYPE [In],dwflags : UInt32 [In],dweapconndatasize : UInt32 [In],pbeapconndata : UInt8* [In],peapconfiginputfieldarray : EAP_CONFIG_INPUT_FIELD_ARRAY* [In],pdwuserblobsize : UInt32* [In],ppbuserblob : UInt8** [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerQueryUserBlobFromCredentialInputFields(huserimpersonationtoken : LibC::HANDLE, eapmethodtype : EAP_METHOD_TYPE, dwflags : UInt32, dweapconndatasize : UInt32, pbeapconndata : UInt8*, peapconfiginputfieldarray : EAP_CONFIG_INPUT_FIELD_ARRAY*, pdwuserblobsize : UInt32*, ppbuserblob : UInt8**, ppeaperror : EAP_ERROR**) : UInt32

  # Params # dwversion : UInt32 [In],eapmethodtype : EAP_METHOD_TYPE [In],dwflags : UInt32 [In],hwndparent : LibC::HANDLE [In],dwsizeofconnectiondata : UInt32 [In],pconnectiondata : UInt8* [In],dwsizeofuserdata : UInt32 [In],puserdata : UInt8* [In],pdwsizeofuserdataout : UInt32* [In],ppuserdataout : UInt8** [In],ppwszidentity : LibC::LPWSTR* [In],ppeaperror : EAP_ERROR** [In],ppvreserved : Void** [In]
  fun EapHostPeerInvokeIdentityUI(dwversion : UInt32, eapmethodtype : EAP_METHOD_TYPE, dwflags : UInt32, hwndparent : LibC::HANDLE, dwsizeofconnectiondata : UInt32, pconnectiondata : UInt8*, dwsizeofuserdata : UInt32, puserdata : UInt8*, pdwsizeofuserdataout : UInt32*, ppuserdataout : UInt8**, ppwszidentity : LibC::LPWSTR*, ppeaperror : EAP_ERROR**, ppvreserved : Void**) : UInt32

  # Params # hwndparent : LibC::HANDLE [In],dwsizeofuicontextdata : UInt32 [In],puicontextdata : UInt8* [In],pdwsizeofdatafrominteractiveui : UInt32* [In],ppdatafrominteractiveui : UInt8** [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerInvokeInteractiveUI(hwndparent : LibC::HANDLE, dwsizeofuicontextdata : UInt32, puicontextdata : UInt8*, pdwsizeofdatafrominteractiveui : UInt32*, ppdatafrominteractiveui : UInt8**, ppeaperror : EAP_ERROR**) : UInt32

  # Params # dwversion : UInt32 [In],dwflags : UInt32 [In],dwsizeofuicontextdata : UInt32 [In],puicontextdata : UInt8* [In],peapinteractiveuidata : EAP_INTERACTIVE_UI_DATA* [In],ppeaperror : EAP_ERROR** [In],ppvreserved : Void** [In]
  fun EapHostPeerQueryInteractiveUIInputFields(dwversion : UInt32, dwflags : UInt32, dwsizeofuicontextdata : UInt32, puicontextdata : UInt8*, peapinteractiveuidata : EAP_INTERACTIVE_UI_DATA*, ppeaperror : EAP_ERROR**, ppvreserved : Void**) : UInt32

  # Params # dwversion : UInt32 [In],dwflags : UInt32 [In],dwsizeofuicontextdata : UInt32 [In],puicontextdata : UInt8* [In],peapinteractiveuidata : EAP_INTERACTIVE_UI_DATA* [In],pdwsizeofdatafrominteractiveui : UInt32* [In],ppdatafrominteractiveui : UInt8** [In],ppeaperror : EAP_ERROR** [In],ppvreserved : Void** [In]
  fun EapHostPeerQueryUIBlobFromInteractiveUIInputFields(dwversion : UInt32, dwflags : UInt32, dwsizeofuicontextdata : UInt32, puicontextdata : UInt8*, peapinteractiveuidata : EAP_INTERACTIVE_UI_DATA*, pdwsizeofdatafrominteractiveui : UInt32*, ppdatafrominteractiveui : UInt8**, ppeaperror : EAP_ERROR**, ppvreserved : Void**) : UInt32

  # Params # dwflags : UInt32 [In],pconfigdoc : IXMLDOMNode [In],pdwsizeofconfigout : UInt32* [In],ppconfigout : UInt8** [In],peapmethodtype : EAP_METHOD_TYPE* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerConfigXml2Blob(dwflags : UInt32, pconfigdoc : IXMLDOMNode, pdwsizeofconfigout : UInt32*, ppconfigout : UInt8**, peapmethodtype : EAP_METHOD_TYPE*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # dwflags : UInt32 [In],pcredentialsdoc : IXMLDOMNode [In],dwsizeofconfigin : UInt32 [In],pconfigin : UInt8* [In],pdwsizeofcredentialsout : UInt32* [In],ppcredentialsout : UInt8** [In],peapmethodtype : EAP_METHOD_TYPE* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerCredentialsXml2Blob(dwflags : UInt32, pcredentialsdoc : IXMLDOMNode, dwsizeofconfigin : UInt32, pconfigin : UInt8*, pdwsizeofcredentialsout : UInt32*, ppcredentialsout : UInt8**, peapmethodtype : EAP_METHOD_TYPE*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # dwflags : UInt32 [In],eapmethodtype : EAP_METHOD_TYPE [In],dwsizeofconfigin : UInt32 [In],pconfigin : UInt8* [In],ppconfigdoc : IXMLDOMDocument2* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerConfigBlob2Xml(dwflags : UInt32, eapmethodtype : EAP_METHOD_TYPE, dwsizeofconfigin : UInt32, pconfigin : UInt8*, ppconfigdoc : IXMLDOMDocument2*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # pdata : UInt8* [In]
  fun EapHostPeerFreeMemory(pdata : UInt8*) : Void

  # Params # peaperror : EAP_ERROR* [In]
  fun EapHostPeerFreeErrorMemory(peaperror : EAP_ERROR*) : Void

  # Params # 
  fun EapHostPeerInitialize : UInt32

  # Params # 
  fun EapHostPeerUninitialize : Void

  # Params # dwflags : UInt32 [In],eaptype : EAP_METHOD_TYPE [In],pattributearray : EAP_ATTRIBUTES* [In],htokenimpersonateuser : LibC::HANDLE [In],dwsizeofconnectiondata : UInt32 [In],pconnectiondata : UInt8* [In],dwsizeofuserdata : UInt32 [In],puserdata : UInt8* [In],dwmaxsendpacketsize : UInt32 [In],pconnectionid : Guid* [In],func : NotificationHandler [In],pcontextdata : Void* [In],psessionid : UInt32* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerBeginSession(dwflags : UInt32, eaptype : EAP_METHOD_TYPE, pattributearray : EAP_ATTRIBUTES*, htokenimpersonateuser : LibC::HANDLE, dwsizeofconnectiondata : UInt32, pconnectiondata : UInt8*, dwsizeofuserdata : UInt32, puserdata : UInt8*, dwmaxsendpacketsize : UInt32, pconnectionid : Guid*, func : NotificationHandler, pcontextdata : Void*, psessionid : UInt32*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],cbreceivepacket : UInt32 [In],preceivepacket : UInt8* [In],peapoutput : EapHostPeerResponseAction* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerProcessReceivedPacket(sessionhandle : UInt32, cbreceivepacket : UInt32, preceivepacket : UInt8*, peapoutput : EapHostPeerResponseAction*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],pcbsendpacket : UInt32* [In],ppsendpacket : UInt8** [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerGetSendPacket(sessionhandle : UInt32, pcbsendpacket : UInt32*, ppsendpacket : UInt8**, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],reason : EapHostPeerMethodResultReason [In],ppresult : EapHostPeerMethodResult* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerGetResult(sessionhandle : UInt32, reason : EapHostPeerMethodResultReason, ppresult : EapHostPeerMethodResult*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],pdwsizeofuicontextdata : UInt32* [In],ppuicontextdata : UInt8** [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerGetUIContext(sessionhandle : UInt32, pdwsizeofuicontextdata : UInt32*, ppuicontextdata : UInt8**, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],dwsizeofuicontextdata : UInt32 [In],puicontextdata : UInt8* [In],peapoutput : EapHostPeerResponseAction* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerSetUIContext(sessionhandle : UInt32, dwsizeofuicontextdata : UInt32, puicontextdata : UInt8*, peapoutput : EapHostPeerResponseAction*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],pattribs : EAP_ATTRIBUTES* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerGetResponseAttributes(sessionhandle : UInt32, pattribs : EAP_ATTRIBUTES*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],pattribs : EAP_ATTRIBUTES* [In],peapoutput : EapHostPeerResponseAction* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerSetResponseAttributes(sessionhandle : UInt32, pattribs : EAP_ATTRIBUTES*, peapoutput : EapHostPeerResponseAction*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],authparam : EapHostPeerAuthParams [In],pcbauthdata : UInt32* [In],ppauthdata : UInt8** [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerGetAuthStatus(sessionhandle : UInt32, authparam : EapHostPeerAuthParams, pcbauthdata : UInt32*, ppauthdata : UInt8**, ppeaperror : EAP_ERROR**) : UInt32

  # Params # sessionhandle : UInt32 [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerEndSession(sessionhandle : UInt32, ppeaperror : EAP_ERROR**) : UInt32

  # Params # pconnectionidthatlastsavedcreds : Guid* [In],phcredentialimpersonationtoken : LibC::IntPtrT* [In],sessionhandle : UInt32 [In],ppeaperror : EAP_ERROR** [In],fsavetocredman : LibC::BOOL* [In]
  fun EapHostPeerGetDataToUnplumbCredentials(pconnectionidthatlastsavedcreds : Guid*, phcredentialimpersonationtoken : LibC::IntPtrT*, sessionhandle : UInt32, ppeaperror : EAP_ERROR**, fsavetocredman : LibC::BOOL*) : UInt32

  # Params # pconnectionid : Guid* [In],ppeaperror : EAP_ERROR** [In]
  fun EapHostPeerClearConnection(pconnectionid : Guid*, ppeaperror : EAP_ERROR**) : UInt32

  # Params # peaperror : EAP_ERROR* [In]
  fun EapHostPeerFreeEapError(peaperror : EAP_ERROR*) : Void

  # Params # dwversion : UInt32 [In],dwflags : UInt32 [In],eapmethodtype : EAP_METHOD_TYPE [In],dwsizeofconnectiondata : UInt32 [In],pconnectiondata : UInt8* [In],dwsizeofuserdata : UInt32 [In],puserdata : UInt8* [In],htokenimpersonateuser : LibC::HANDLE [In],pfinvokeui : LibC::BOOL* [In],pdwsizeofuserdataout : UInt32* [In],ppuserdataout : UInt8** [In],ppwszidentity : LibC::LPWSTR* [In],ppeaperror : EAP_ERROR** [In],ppvreserved : UInt8** [In]
  fun EapHostPeerGetIdentity(dwversion : UInt32, dwflags : UInt32, eapmethodtype : EAP_METHOD_TYPE, dwsizeofconnectiondata : UInt32, pconnectiondata : UInt8*, dwsizeofuserdata : UInt32, puserdata : UInt8*, htokenimpersonateuser : LibC::HANDLE, pfinvokeui : LibC::BOOL*, pdwsizeofuserdataout : UInt32*, ppuserdataout : UInt8**, ppwszidentity : LibC::LPWSTR*, ppeaperror : EAP_ERROR**, ppvreserved : UInt8**) : UInt32

  # Params # dwsizeofpassword : UInt32 [In],szpassword : LibC::LPWSTR [In],ppszencpassword : LibC::LPWSTR* [In]
  fun EapHostPeerGetEncryptedPassword(dwsizeofpassword : UInt32, szpassword : LibC::LPWSTR, ppszencpassword : LibC::LPWSTR*) : UInt32

  # Params # pdata : UInt8* [In]
  fun EapHostPeerFreeRuntimeMemory(pdata : UInt8*) : Void
end
struct LibWin32::IRouterProtocolConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_protocol(pszmachinename : LibC::LPWSTR, dwtransportid : UInt32, dwprotocolid : UInt32, hwnd : LibC::HANDLE, dwflags : UInt32, prouter : IUnknown, ureserved1 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.add_protocol.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, LibC::HANDLE, UInt32, IUnknown, LibC::UINT_PTR, HRESULT)).call(pszmachinename, dwtransportid, dwprotocolid, hwnd, dwflags, prouter, ureserved1)
  end
  def remove_protocol(pszmachinename : LibC::LPWSTR, dwtransportid : UInt32, dwprotocolid : UInt32, hwnd : LibC::HANDLE, dwflags : UInt32, prouter : IUnknown, ureserved1 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.remove_protocol.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, LibC::HANDLE, UInt32, IUnknown, LibC::UINT_PTR, HRESULT)).call(pszmachinename, dwtransportid, dwprotocolid, hwnd, dwflags, prouter, ureserved1)
  end
end
struct LibWin32::IAuthenticationProviderConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszmachinename : LibC::LPWSTR, puconnectionparam : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, LibC::UINT_PTR*, HRESULT)).call(pszmachinename, puconnectionparam)
  end
  def uninitialize(uconnectionparam : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.uninitialize.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(uconnectionparam)
  end
  def configure(uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, dwflags : UInt32, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.configure.unsafe_as(Proc(LibC::UINT_PTR, LibC::HANDLE, UInt32, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(uconnectionparam, hwnd, dwflags, ureserved1, ureserved2)
  end
  def activate(uconnectionparam : LibC::UINT_PTR, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(uconnectionparam, ureserved1, ureserved2)
  end
  def deactivate(uconnectionparam : LibC::UINT_PTR, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(uconnectionparam, ureserved1, ureserved2)
  end
end
struct LibWin32::IAccountingProviderConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszmachinename : LibC::LPWSTR, puconnectionparam : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, LibC::UINT_PTR*, HRESULT)).call(pszmachinename, puconnectionparam)
  end
  def uninitialize(uconnectionparam : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.uninitialize.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(uconnectionparam)
  end
  def configure(uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, dwflags : UInt32, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.configure.unsafe_as(Proc(LibC::UINT_PTR, LibC::HANDLE, UInt32, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(uconnectionparam, hwnd, dwflags, ureserved1, ureserved2)
  end
  def activate(uconnectionparam : LibC::UINT_PTR, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(uconnectionparam, ureserved1, ureserved2)
  end
  def deactivate(uconnectionparam : LibC::UINT_PTR, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(uconnectionparam, ureserved1, ureserved2)
  end
end
struct LibWin32::IEAPProviderConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszmachinename : LibC::LPWSTR, dweaptypeid : UInt32, puconnectionparam : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::UINT_PTR*, HRESULT)).call(pszmachinename, dweaptypeid, puconnectionparam)
  end
  def uninitialize(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.uninitialize.unsafe_as(Proc(UInt32, LibC::UINT_PTR, HRESULT)).call(dweaptypeid, uconnectionparam)
  end
  def server_invoke_config_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.server_invoke_config_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(dweaptypeid, uconnectionparam, hwnd, ureserved1, ureserved2)
  end
  def router_invoke_config_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwndparent : LibC::HANDLE, dwflags : UInt32, pconnectiondatain : UInt8*, dwsizeofconnectiondatain : UInt32, ppconnectiondataout : UInt8**, pdwsizeofconnectiondataout : UInt32*) : HRESULT
    @lpVtbl.value.router_invoke_config_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwndparent, dwflags, pconnectiondatain, dwsizeofconnectiondatain, ppconnectiondataout, pdwsizeofconnectiondataout)
  end
  def router_invoke_credentials_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwndparent : LibC::HANDLE, dwflags : UInt32, pconnectiondatain : UInt8*, dwsizeofconnectiondatain : UInt32, puserdatain : UInt8*, dwsizeofuserdatain : UInt32, ppuserdataout : UInt8**, pdwsizeofuserdataout : UInt32*) : HRESULT
    @lpVtbl.value.router_invoke_credentials_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwndparent, dwflags, pconnectiondatain, dwsizeofconnectiondatain, puserdatain, dwsizeofuserdatain, ppuserdataout, pdwsizeofuserdataout)
  end
end
struct LibWin32::IEAPProviderConfig2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszmachinename : LibC::LPWSTR, dweaptypeid : UInt32, puconnectionparam : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::UINT_PTR*, HRESULT)).call(pszmachinename, dweaptypeid, puconnectionparam)
  end
  def uninitialize(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.uninitialize.unsafe_as(Proc(UInt32, LibC::UINT_PTR, HRESULT)).call(dweaptypeid, uconnectionparam)
  end
  def server_invoke_config_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.server_invoke_config_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(dweaptypeid, uconnectionparam, hwnd, ureserved1, ureserved2)
  end
  def router_invoke_config_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwndparent : LibC::HANDLE, dwflags : UInt32, pconnectiondatain : UInt8*, dwsizeofconnectiondatain : UInt32, ppconnectiondataout : UInt8**, pdwsizeofconnectiondataout : UInt32*) : HRESULT
    @lpVtbl.value.router_invoke_config_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwndparent, dwflags, pconnectiondatain, dwsizeofconnectiondatain, ppconnectiondataout, pdwsizeofconnectiondataout)
  end
  def router_invoke_credentials_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwndparent : LibC::HANDLE, dwflags : UInt32, pconnectiondatain : UInt8*, dwsizeofconnectiondatain : UInt32, puserdatain : UInt8*, dwsizeofuserdatain : UInt32, ppuserdataout : UInt8**, pdwsizeofuserdataout : UInt32*) : HRESULT
    @lpVtbl.value.router_invoke_credentials_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwndparent, dwflags, pconnectiondatain, dwsizeofconnectiondatain, puserdatain, dwsizeofuserdatain, ppuserdataout, pdwsizeofuserdataout)
  end
  def server_invoke_config_ui2(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, pconfigdatain : UInt8*, dwsizeofconfigdatain : UInt32, ppconfigdataout : UInt8**, pdwsizeofconfigdataout : UInt32*) : HRESULT
    @lpVtbl.value.server_invoke_config_ui2.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwnd, pconfigdatain, dwsizeofconfigdatain, ppconfigdataout, pdwsizeofconfigdataout)
  end
  def get_global_config(dweaptypeid : UInt32, ppconfigdataout : UInt8**, pdwsizeofconfigdataout : UInt32*) : HRESULT
    @lpVtbl.value.get_global_config.unsafe_as(Proc(UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, ppconfigdataout, pdwsizeofconfigdataout)
  end
end
struct LibWin32::IEAPProviderConfig3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszmachinename : LibC::LPWSTR, dweaptypeid : UInt32, puconnectionparam : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::UINT_PTR*, HRESULT)).call(pszmachinename, dweaptypeid, puconnectionparam)
  end
  def uninitialize(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.uninitialize.unsafe_as(Proc(UInt32, LibC::UINT_PTR, HRESULT)).call(dweaptypeid, uconnectionparam)
  end
  def server_invoke_config_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, ureserved1 : LibC::UINT_PTR, ureserved2 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.server_invoke_config_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(dweaptypeid, uconnectionparam, hwnd, ureserved1, ureserved2)
  end
  def router_invoke_config_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwndparent : LibC::HANDLE, dwflags : UInt32, pconnectiondatain : UInt8*, dwsizeofconnectiondatain : UInt32, ppconnectiondataout : UInt8**, pdwsizeofconnectiondataout : UInt32*) : HRESULT
    @lpVtbl.value.router_invoke_config_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwndparent, dwflags, pconnectiondatain, dwsizeofconnectiondatain, ppconnectiondataout, pdwsizeofconnectiondataout)
  end
  def router_invoke_credentials_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwndparent : LibC::HANDLE, dwflags : UInt32, pconnectiondatain : UInt8*, dwsizeofconnectiondatain : UInt32, puserdatain : UInt8*, dwsizeofuserdatain : UInt32, ppuserdataout : UInt8**, pdwsizeofuserdataout : UInt32*) : HRESULT
    @lpVtbl.value.router_invoke_credentials_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwndparent, dwflags, pconnectiondatain, dwsizeofconnectiondatain, puserdatain, dwsizeofuserdatain, ppuserdataout, pdwsizeofuserdataout)
  end
  def server_invoke_config_ui2(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, pconfigdatain : UInt8*, dwsizeofconfigdatain : UInt32, ppconfigdataout : UInt8**, pdwsizeofconfigdataout : UInt32*) : HRESULT
    @lpVtbl.value.server_invoke_config_ui2.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, uconnectionparam, hwnd, pconfigdatain, dwsizeofconfigdatain, ppconfigdataout, pdwsizeofconfigdataout)
  end
  def get_global_config(dweaptypeid : UInt32, ppconfigdataout : UInt8**, pdwsizeofconfigdataout : UInt32*) : HRESULT
    @lpVtbl.value.get_global_config.unsafe_as(Proc(UInt32, UInt8**, UInt32*, HRESULT)).call(dweaptypeid, ppconfigdataout, pdwsizeofconfigdataout)
  end
  def server_invoke_certificate_config_ui(dweaptypeid : UInt32, uconnectionparam : LibC::UINT_PTR, hwnd : LibC::HANDLE, pconfigdatain : UInt8*, dwsizeofconfigdatain : UInt32, ppconfigdataout : UInt8**, pdwsizeofconfigdataout : UInt32*, ureserved : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.server_invoke_certificate_config_ui.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LibC::HANDLE, UInt8*, UInt32, UInt8**, UInt32*, LibC::UINT_PTR, HRESULT)).call(dweaptypeid, uconnectionparam, hwnd, pconfigdatain, dwsizeofconfigdatain, ppconfigdataout, pdwsizeofconfigdataout, ureserved)
  end
end
