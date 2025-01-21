require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::NetworkManagement::NetworkPolicyServer
  alias PRADIUS_EXTENSION_INIT = Proc(UInt32)*

  alias PRADIUS_EXTENSION_TERM = Proc(Void)*

  alias PRADIUS_EXTENSION_PROCESS = Proc(Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_ATTRIBUTE*, Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_ACTION*, UInt32)*

  alias PRADIUS_EXTENSION_PROCESS_EX = Proc(Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_ATTRIBUTE*, Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_ATTRIBUTE**, Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_ACTION*, UInt32)*

  alias PRADIUS_EXTENSION_FREE_ATTRIBUTES = Proc(Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_ATTRIBUTE*, Void)*

  alias PRADIUS_EXTENSION_PROCESS_2 = Proc(Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_EXTENSION_CONTROL_BLOCK*, UInt32)*

  RADIUS_EXTENSION_INIT = "RadiusExtensionInit"
  RADIUS_EXTENSION_TERM = "RadiusExtensionTerm"
  RADIUS_EXTENSION_PROCESS = "RadiusExtensionProcess"
  RADIUS_EXTENSION_PROCESS_EX = "RadiusExtensionProcessEx"
  RADIUS_EXTENSION_FREE_ATTRIBUTES = "RadiusExtensionFreeAttributes"
  AUTHSRV_PARAMETERS_KEY_W = "System\\CurrentControlSet\\Services\\AuthSrv\\Parameters"
  AUTHSRV_EXTENSIONS_VALUE_W = "ExtensionDLLs"
  AUTHSRV_AUTHORIZATION_VALUE_W = "AuthorizationDLLs"
  AUTHSRV_ENFORCE_NP_FOR_PAP_CHALLENGE_RESPONSE_VALUE_W = "EnforceNetworkPolicyForPAPBasedChallengeResponse"
  RADIUS_EXTENSION_VERSION = 1_u32
  RADIUS_EXTENSION_PROCESS2 = "RadiusExtensionProcess2"

  CLSID_SdoMachine = LibC::GUID.new(0xe9218ae7_u32, 0x9e91_u16, 0x11d1_u16, StaticArray[0xbf_u8, 0x60_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x84_u8, 0x6b_u8, 0xc0_u8])

  enum ATTRIBUTEID : UInt32
    ATTRIBUTE_UNDEFINED = 0_u32
    ATTRIBUTE_MIN_VALUE = 1_u32
    RADIUS_ATTRIBUTE_USER_NAME = 1_u32
    RADIUS_ATTRIBUTE_USER_PASSWORD = 2_u32
    RADIUS_ATTRIBUTE_CHAP_PASSWORD = 3_u32
    RADIUS_ATTRIBUTE_NAS_IP_ADDRESS = 4_u32
    RADIUS_ATTRIBUTE_NAS_PORT = 5_u32
    RADIUS_ATTRIBUTE_SERVICE_TYPE = 6_u32
    RADIUS_ATTRIBUTE_FRAMED_PROTOCOL = 7_u32
    RADIUS_ATTRIBUTE_FRAMED_IP_ADDRESS = 8_u32
    RADIUS_ATTRIBUTE_FRAMED_IP_NETMASK = 9_u32
    RADIUS_ATTRIBUTE_FRAMED_ROUTING = 10_u32
    RADIUS_ATTRIBUTE_FILTER_ID = 11_u32
    RADIUS_ATTRIBUTE_FRAMED_MTU = 12_u32
    RADIUS_ATTRIBUTE_FRAMED_COMPRESSION = 13_u32
    RADIUS_ATTRIBUTE_LOGIN_IP_HOST = 14_u32
    RADIUS_ATTRIBUTE_LOGIN_SERVICE = 15_u32
    RADIUS_ATTRIBUTE_LOGIN_TCP_PORT = 16_u32
    RADIUS_ATTRIBUTE_UNASSIGNED1 = 17_u32
    RADIUS_ATTRIBUTE_REPLY_MESSAGE = 18_u32
    RADIUS_ATTRIBUTE_CALLBACK_NUMBER = 19_u32
    RADIUS_ATTRIBUTE_CALLBACK_ID = 20_u32
    RADIUS_ATTRIBUTE_UNASSIGNED2 = 21_u32
    RADIUS_ATTRIBUTE_FRAMED_ROUTE = 22_u32
    RADIUS_ATTRIBUTE_FRAMED_IPX_NETWORK = 23_u32
    RADIUS_ATTRIBUTE_STATE = 24_u32
    RADIUS_ATTRIBUTE_CLASS = 25_u32
    RADIUS_ATTRIBUTE_VENDOR_SPECIFIC = 26_u32
    RADIUS_ATTRIBUTE_SESSION_TIMEOUT = 27_u32
    RADIUS_ATTRIBUTE_IDLE_TIMEOUT = 28_u32
    RADIUS_ATTRIBUTE_TERMINATION_ACTION = 29_u32
    RADIUS_ATTRIBUTE_CALLED_STATION_ID = 30_u32
    RADIUS_ATTRIBUTE_CALLING_STATION_ID = 31_u32
    RADIUS_ATTRIBUTE_NAS_IDENTIFIER = 32_u32
    RADIUS_ATTRIBUTE_PROXY_STATE = 33_u32
    RADIUS_ATTRIBUTE_LOGIN_LAT_SERVICE = 34_u32
    RADIUS_ATTRIBUTE_LOGIN_LAT_NODE = 35_u32
    RADIUS_ATTRIBUTE_LOGIN_LAT_GROUP = 36_u32
    RADIUS_ATTRIBUTE_FRAMED_APPLETALK_LINK = 37_u32
    RADIUS_ATTRIBUTE_FRAMED_APPLETALK_NET = 38_u32
    RADIUS_ATTRIBUTE_FRAMED_APPLETALK_ZONE = 39_u32
    RADIUS_ATTRIBUTE_ACCT_STATUS_TYPE = 40_u32
    RADIUS_ATTRIBUTE_ACCT_DELAY_TIME = 41_u32
    RADIUS_ATTRIBUTE_ACCT_INPUT_OCTETS = 42_u32
    RADIUS_ATTRIBUTE_ACCT_OUTPUT_OCTETS = 43_u32
    RADIUS_ATTRIBUTE_ACCT_SESSION_ID = 44_u32
    RADIUS_ATTRIBUTE_ACCT_AUTHENTIC = 45_u32
    RADIUS_ATTRIBUTE_ACCT_SESSION_TIME = 46_u32
    RADIUS_ATTRIBUTE_ACCT_INPUT_PACKETS = 47_u32
    RADIUS_ATTRIBUTE_ACCT_OUTPUT_PACKETS = 48_u32
    RADIUS_ATTRIBUTE_ACCT_TERMINATE_CAUSE = 49_u32
    RADIUS_ATTRIBUTE_ACCT_MULTI_SSN_ID = 50_u32
    RADIUS_ATTRIBUTE_ACCT_LINK_COUNT = 51_u32
    RADIUS_ATTRIBUTE_CHAP_CHALLENGE = 60_u32
    RADIUS_ATTRIBUTE_NAS_PORT_TYPE = 61_u32
    RADIUS_ATTRIBUTE_PORT_LIMIT = 62_u32
    RADIUS_ATTRIBUTE_LOGIN_LAT_PORT = 63_u32
    RADIUS_ATTRIBUTE_TUNNEL_TYPE = 64_u32
    RADIUS_ATTRIBUTE_TUNNEL_MEDIUM_TYPE = 65_u32
    RADIUS_ATTRIBUTE_TUNNEL_CLIENT_ENDPT = 66_u32
    RADIUS_ATTRIBUTE_TUNNEL_SERVER_ENDPT = 67_u32
    RADIUS_ATTRIBUTE_ACCT_TUNNEL_CONN = 68_u32
    RADIUS_ATTRIBUTE_TUNNEL_PASSWORD = 69_u32
    RADIUS_ATTRIBUTE_ARAP_PASSWORD = 70_u32
    RADIUS_ATTRIBUTE_ARAP_FEATURES = 71_u32
    RADIUS_ATTRIBUTE_ARAP_ZONE_ACCESS = 72_u32
    RADIUS_ATTRIBUTE_ARAP_SECURITY = 73_u32
    RADIUS_ATTRIBUTE_ARAP_SECURITY_DATA = 74_u32
    RADIUS_ATTRIBUTE_PASSWORD_RETRY = 75_u32
    RADIUS_ATTRIBUTE_PROMPT = 76_u32
    RADIUS_ATTRIBUTE_CONNECT_INFO = 77_u32
    RADIUS_ATTRIBUTE_CONFIGURATION_TOKEN = 78_u32
    RADIUS_ATTRIBUTE_EAP_MESSAGE = 79_u32
    RADIUS_ATTRIBUTE_SIGNATURE = 80_u32
    RADIUS_ATTRIBUTE_TUNNEL_PVT_GROUP_ID = 81_u32
    RADIUS_ATTRIBUTE_TUNNEL_ASSIGNMENT_ID = 82_u32
    RADIUS_ATTRIBUTE_TUNNEL_PREFERENCE = 83_u32
    RADIUS_ATTRIBUTE_ARAP_CHALLENGE_RESPONSE = 84_u32
    RADIUS_ATTRIBUTE_ACCT_INTERIM_INTERVAL = 85_u32
    RADIUS_ATTRIBUTE_NAS_IPv6_ADDRESS = 95_u32
    RADIUS_ATTRIBUTE_FRAMED_INTERFACE_ID = 96_u32
    RADIUS_ATTRIBUTE_FRAMED_IPv6_PREFIX = 97_u32
    RADIUS_ATTRIBUTE_LOGIN_IPv6_HOST = 98_u32
    RADIUS_ATTRIBUTE_FRAMED_IPv6_ROUTE = 99_u32
    RADIUS_ATTRIBUTE_FRAMED_IPv6_POOL = 100_u32
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IP_ADDRESS = 4096_u32
    IAS_ATTRIBUTE_SAVED_RADIUS_CALLBACK_NUMBER = 4097_u32
    IAS_ATTRIBUTE_NP_CALLING_STATION_ID = 4098_u32
    IAS_ATTRIBUTE_SAVED_NP_CALLING_STATION_ID = 4099_u32
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_ROUTE = 4100_u32
    IAS_ATTRIBUTE_IGNORE_USER_DIALIN_PROPERTIES = 4101_u32
    IAS_ATTRIBUTE_NP_TIME_OF_DAY = 4102_u32
    IAS_ATTRIBUTE_NP_CALLED_STATION_ID = 4103_u32
    IAS_ATTRIBUTE_NP_ALLOWED_PORT_TYPES = 4104_u32
    IAS_ATTRIBUTE_NP_AUTHENTICATION_TYPE = 4105_u32
    IAS_ATTRIBUTE_NP_ALLOWED_EAP_TYPE = 4106_u32
    IAS_ATTRIBUTE_SHARED_SECRET = 4107_u32
    IAS_ATTRIBUTE_CLIENT_IP_ADDRESS = 4108_u32
    IAS_ATTRIBUTE_CLIENT_PACKET_HEADER = 4109_u32
    IAS_ATTRIBUTE_TOKEN_GROUPS = 4110_u32
    IAS_ATTRIBUTE_ALLOW_DIALIN = 4111_u32
    IAS_ATTRIBUTE_REQUEST_ID = 4112_u32
    IAS_ATTRIBUTE_MANIPULATION_TARGET = 4113_u32
    IAS_ATTRIBUTE_MANIPULATION_RULE = 4114_u32
    IAS_ATTRIBUTE_ORIGINAL_USER_NAME = 4115_u32
    IAS_ATTRIBUTE_CLIENT_VENDOR_TYPE = 4116_u32
    IAS_ATTRIBUTE_CLIENT_UDP_PORT = 4117_u32
    MS_ATTRIBUTE_CHAP_CHALLENGE = 4118_u32
    MS_ATTRIBUTE_CHAP_RESPONSE = 4119_u32
    MS_ATTRIBUTE_CHAP_DOMAIN = 4120_u32
    MS_ATTRIBUTE_CHAP_ERROR = 4121_u32
    MS_ATTRIBUTE_CHAP_CPW1 = 4122_u32
    MS_ATTRIBUTE_CHAP_CPW2 = 4123_u32
    MS_ATTRIBUTE_CHAP_LM_ENC_PW = 4124_u32
    MS_ATTRIBUTE_CHAP_NT_ENC_PW = 4125_u32
    MS_ATTRIBUTE_CHAP_MPPE_KEYS = 4126_u32
    IAS_ATTRIBUTE_AUTHENTICATION_TYPE = 4127_u32
    IAS_ATTRIBUTE_CLIENT_NAME = 4128_u32
    IAS_ATTRIBUTE_NT4_ACCOUNT_NAME = 4129_u32
    IAS_ATTRIBUTE_FULLY_QUALIFIED_USER_NAME = 4130_u32
    IAS_ATTRIBUTE_NTGROUPS = 4131_u32
    IAS_ATTRIBUTE_EAP_FRIENDLY_NAME = 4132_u32
    IAS_ATTRIBUTE_AUTH_PROVIDER_TYPE = 4133_u32
    MS_ATTRIBUTE_ACCT_AUTH_TYPE = 4134_u32
    MS_ATTRIBUTE_ACCT_EAP_TYPE = 4135_u32
    IAS_ATTRIBUTE_PACKET_TYPE = 4136_u32
    IAS_ATTRIBUTE_AUTH_PROVIDER_NAME = 4137_u32
    IAS_ATTRIBUTE_ACCT_PROVIDER_TYPE = 4138_u32
    IAS_ATTRIBUTE_ACCT_PROVIDER_NAME = 4139_u32
    MS_ATTRIBUTE_MPPE_SEND_KEY = 4140_u32
    MS_ATTRIBUTE_MPPE_RECV_KEY = 4141_u32
    IAS_ATTRIBUTE_REASON_CODE = 4142_u32
    MS_ATTRIBUTE_FILTER = 4143_u32
    MS_ATTRIBUTE_CHAP2_RESPONSE = 4144_u32
    MS_ATTRIBUTE_CHAP2_SUCCESS = 4145_u32
    MS_ATTRIBUTE_CHAP2_CPW = 4146_u32
    MS_ATTRIBUTE_RAS_VENDOR = 4147_u32
    MS_ATTRIBUTE_RAS_VERSION = 4148_u32
    IAS_ATTRIBUTE_NP_NAME = 4149_u32
    MS_ATTRIBUTE_PRIMARY_DNS_SERVER = 4150_u32
    MS_ATTRIBUTE_SECONDARY_DNS_SERVER = 4151_u32
    MS_ATTRIBUTE_PRIMARY_NBNS_SERVER = 4152_u32
    MS_ATTRIBUTE_SECONDARY_NBNS_SERVER = 4153_u32
    IAS_ATTRIBUTE_PROXY_POLICY_NAME = 4154_u32
    IAS_ATTRIBUTE_PROVIDER_TYPE = 4155_u32
    IAS_ATTRIBUTE_PROVIDER_NAME = 4156_u32
    IAS_ATTRIBUTE_REMOTE_SERVER_ADDRESS = 4157_u32
    IAS_ATTRIBUTE_GENERATE_CLASS_ATTRIBUTE = 4158_u32
    MS_ATTRIBUTE_RAS_CLIENT_NAME = 4159_u32
    MS_ATTRIBUTE_RAS_CLIENT_VERSION = 4160_u32
    IAS_ATTRIBUTE_ALLOWED_CERTIFICATE_EKU = 4161_u32
    IAS_ATTRIBUTE_EXTENSION_STATE = 4162_u32
    IAS_ATTRIBUTE_GENERATE_SESSION_TIMEOUT = 4163_u32
    IAS_ATTRIBUTE_SESSION_TIMEOUT = 4164_u32
    MS_ATTRIBUTE_QUARANTINE_IPFILTER = 4165_u32
    MS_ATTRIBUTE_QUARANTINE_SESSION_TIMEOUT = 4166_u32
    MS_ATTRIBUTE_USER_SECURITY_IDENTITY = 4167_u32
    IAS_ATTRIBUTE_REMOTE_RADIUS_TO_WINDOWS_USER_MAPPING = 4168_u32
    IAS_ATTRIBUTE_PASSPORT_USER_MAPPING_UPN_SUFFIX = 4169_u32
    IAS_ATTRIBUTE_TUNNEL_TAG = 4170_u32
    IAS_ATTRIBUTE_NP_PEAPUPFRONT_ENABLED = 4171_u32
    IAS_ATTRIBUTE_CERTIFICATE_EKU = 8097_u32
    IAS_ATTRIBUTE_EAP_CONFIG = 8098_u32
    IAS_ATTRIBUTE_PEAP_EMBEDDED_EAP_TYPEID = 8099_u32
    IAS_ATTRIBUTE_PEAP_FAST_ROAMED_SESSION = 8100_u32
    IAS_ATTRIBUTE_EAP_TYPEID = 8101_u32
    MS_ATTRIBUTE_EAP_TLV = 8102_u32
    IAS_ATTRIBUTE_REJECT_REASON_CODE = 8103_u32
    IAS_ATTRIBUTE_PROXY_EAP_CONFIG = 8104_u32
    IAS_ATTRIBUTE_EAP_SESSION = 8105_u32
    IAS_ATTRIBUTE_IS_REPLAY = 8106_u32
    IAS_ATTRIBUTE_CLEAR_TEXT_PASSWORD = 8107_u32
    MS_ATTRIBUTE_IDENTITY_TYPE = 8108_u32
    MS_ATTRIBUTE_SERVICE_CLASS = 8109_u32
    MS_ATTRIBUTE_QUARANTINE_USER_CLASS = 8110_u32
    MS_ATTRIBUTE_QUARANTINE_STATE = 8111_u32
    IAS_ATTRIBUTE_OVERRIDE_RAP_AUTH = 8112_u32
    IAS_ATTRIBUTE_PEAP_CHANNEL_UP = 8113_u32
    IAS_ATTRIBUTE_NAME_MAPPED = 8114_u32
    IAS_ATTRIBUTE_POLICY_ENFORCED = 8115_u32
    IAS_ATTRIBUTE_MACHINE_NTGROUPS = 8116_u32
    IAS_ATTRIBUTE_USER_NTGROUPS = 8117_u32
    IAS_ATTRIBUTE_MACHINE_TOKEN_GROUPS = 8118_u32
    IAS_ATTRIBUTE_USER_TOKEN_GROUPS = 8119_u32
    MS_ATTRIBUTE_QUARANTINE_GRACE_TIME = 8120_u32
    IAS_ATTRIBUTE_QUARANTINE_URL = 8121_u32
    IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS = 8122_u32
    MS_ATTRIBUTE_NOT_QUARANTINE_CAPABLE = 8123_u32
    IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_RESULT = 8124_u32
    IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_VALIDATORS = 8125_u32
    IAS_ATTRIBUTE_MACHINE_NAME = 8126_u32
    IAS_ATTRIBUTE_NT4_MACHINE_NAME = 8127_u32
    IAS_ATTRIBUTE_QUARANTINE_SESSION_HANDLE = 8128_u32
    IAS_ATTRIBUTE_FULLY_QUALIFIED_MACHINE_NAME = 8129_u32
    IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS_CONFIGURATION = 8130_u32
    IAS_ATTRIBUTE_CLIENT_QUARANTINE_COMPATIBLE = 8131_u32
    MS_ATTRIBUTE_NETWORK_ACCESS_SERVER_TYPE = 8132_u32
    IAS_ATTRIBUTE_QUARANTINE_SESSION_ID = 8133_u32
    MS_ATTRIBUTE_AFW_QUARANTINE_ZONE = 8134_u32
    MS_ATTRIBUTE_AFW_PROTECTION_LEVEL = 8135_u32
    IAS_ATTRIBUTE_QUARANTINE_UPDATE_NON_COMPLIANT = 8136_u32
    IAS_ATTRIBUTE_REQUEST_START_TIME = 8137_u32
    MS_ATTRIBUTE_MACHINE_NAME = 8138_u32
    IAS_ATTRIBUTE_CLIENT_IPv6_ADDRESS = 8139_u32
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_INTERFACE_ID = 8140_u32
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_PREFIX = 8141_u32
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_ROUTE = 8142_u32
    MS_ATTRIBUTE_QUARANTINE_GRACE_TIME_CONFIGURATION = 8143_u32
    MS_ATTRIBUTE_IPv6_FILTER = 8144_u32
    MS_ATTRIBUTE_IPV4_REMEDIATION_SERVERS = 8145_u32
    MS_ATTRIBUTE_IPV6_REMEDIATION_SERVERS = 8146_u32
    IAS_ATTRIBUTE_PROXY_RETRY_COUNT = 8147_u32
    IAS_ATTRIBUTE_MACHINE_INVENTORY = 8148_u32
    IAS_ATTRIBUTE_ABSOLUTE_TIME = 8149_u32
    MS_ATTRIBUTE_QUARANTINE_SOH = 8150_u32
    IAS_ATTRIBUTE_EAP_TYPES_CONFIGURED_IN_PROXYPOLICY = 8151_u32
    MS_ATTRIBUTE_HCAP_LOCATION_GROUP_NAME = 8152_u32
    MS_ATTRIBUTE_EXTENDED_QUARANTINE_STATE = 8153_u32
    IAS_ATTRIBUTE_SOH_CARRIER_EAPTLV = 8154_u32
    MS_ATTRIBUTE_HCAP_USER_GROUPS = 8155_u32
    IAS_ATTRIBUTE_SAVED_MACHINE_HEALTHCHECK_ONLY = 8156_u32
    IAS_ATTRIBUTE_POLICY_EVALUATED_SHV = 8157_u32
    MS_ATTRIBUTE_RAS_CORRELATION_ID = 8158_u32
    MS_ATTRIBUTE_HCAP_USER_NAME = 8159_u32
    IAS_ATTRIBUTE_NT4_HCAP_ACCOUNT_NAME = 8160_u32
    IAS_ATTRIBUTE_USER_TOKEN_SID = 8161_u32
    IAS_ATTRIBUTE_MACHINE_TOKEN_SID = 8162_u32
    IAS_ATTRIBUTE_MACHINE_VALIDATED = 8163_u32
    MS_ATTRIBUTE_USER_IPv4_ADDRESS = 8164_u32
    MS_ATTRIBUTE_USER_IPv6_ADDRESS = 8165_u32
    MS_ATTRIBUTE_TSG_DEVICE_REDIRECTION = 8166_u32
    IAS_ATTRIBUTE_ACCEPT_REASON_CODE = 8167_u32
    IAS_ATTRIBUTE_LOGGING_RESULT = 8168_u32
    IAS_ATTRIBUTE_SERVER_IP_ADDRESS = 8169_u32
    IAS_ATTRIBUTE_SERVER_IPv6_ADDRESS = 8170_u32
    IAS_ATTRIBUTE_RADIUS_USERNAME_ENCODING_ASCII = 8171_u32
    MS_ATTRIBUTE_RAS_ROUTING_DOMAIN_ID = 8172_u32
    IAS_ATTRIBUTE_CERTIFICATE_THUMBPRINT = 8250_u32
    RAS_ATTRIBUTE_ENCRYPTION_TYPE = 4294967206_u32
    RAS_ATTRIBUTE_ENCRYPTION_POLICY = 4294967207_u32
    RAS_ATTRIBUTE_BAP_REQUIRED = 4294967208_u32
    RAS_ATTRIBUTE_BAP_LINE_DOWN_TIME = 4294967209_u32
    RAS_ATTRIBUTE_BAP_LINE_DOWN_LIMIT = 4294967210_u32
  end
  enum NEW_LOG_FILE_FREQUENCY
    IAS_LOGGING_UNLIMITED_SIZE = 0_i32
    IAS_LOGGING_DAILY = 1_i32
    IAS_LOGGING_WEEKLY = 2_i32
    IAS_LOGGING_MONTHLY = 3_i32
    IAS_LOGGING_WHEN_FILE_SIZE_REACHES = 4_i32
  end
  enum AUTHENTICATION_TYPE
    IAS_AUTH_INVALID = 0_i32
    IAS_AUTH_PAP = 1_i32
    IAS_AUTH_MD5CHAP = 2_i32
    IAS_AUTH_MSCHAP = 3_i32
    IAS_AUTH_MSCHAP2 = 4_i32
    IAS_AUTH_EAP = 5_i32
    IAS_AUTH_ARAP = 6_i32
    IAS_AUTH_NONE = 7_i32
    IAS_AUTH_CUSTOM = 8_i32
    IAS_AUTH_MSCHAP_CPW = 9_i32
    IAS_AUTH_MSCHAP2_CPW = 10_i32
    IAS_AUTH_PEAP = 11_i32
  end
  enum IDENTITY_TYPE
    IAS_IDENTITY_NO_DEFAULT = 1_i32
  end
  enum ATTRIBUTESYNTAX
    IAS_SYNTAX_BOOLEAN = 1_i32
    IAS_SYNTAX_INTEGER = 2_i32
    IAS_SYNTAX_ENUMERATOR = 3_i32
    IAS_SYNTAX_INETADDR = 4_i32
    IAS_SYNTAX_STRING = 5_i32
    IAS_SYNTAX_OCTETSTRING = 6_i32
    IAS_SYNTAX_UTCTIME = 7_i32
    IAS_SYNTAX_PROVIDERSPECIFIC = 8_i32
    IAS_SYNTAX_UNSIGNEDINTEGER = 9_i32
    IAS_SYNTAX_INETADDR6 = 10_i32
  end
  enum ATTRIBUTERESTRICTIONS
    MULTIVALUED = 1_i32
    ALLOWEDINPROFILE = 2_i32
    ALLOWEDINCONDITION = 4_i32
    ALLOWEDINPROXYPROFILE = 8_i32
    ALLOWEDINPROXYCONDITION = 16_i32
    ALLOWEDINVPNDIALUP = 32_i32
    ALLOWEDIN8021X = 64_i32
  end
  enum ATTRIBUTEFILTER
    ATTRIBUTE_FILTER_NONE = 0_i32
    ATTRIBUTE_FILTER_VPN_DIALUP = 1_i32
    ATTRIBUTE_FILTER_IEEE_802_1x = 2_i32
  end
  enum ATTRIBUTEINFO
    NAME = 1_i32
    SYNTAX = 2_i32
    RESTRICTIONS = 3_i32
    DESCRIPTION = 4_i32
    VENDORID = 5_i32
    LDAPNAME = 6_i32
    VENDORTYPE = 7_i32
  end
  enum IASCOMMONPROPERTIES
    PROPERTY_SDO_RESERVED = 0_i32
    PROPERTY_SDO_CLASS = 1_i32
    PROPERTY_SDO_NAME = 2_i32
    PROPERTY_SDO_DESCRIPTION = 3_i32
    PROPERTY_SDO_ID = 4_i32
    PROPERTY_SDO_DATASTORE_NAME = 5_i32
    PROPERTY_SDO_TEMPLATE_GUID = 6_i32
    PROPERTY_SDO_OPAQUE = 7_i32
    PROPERTY_SDO_START = 1024_i32
  end
  enum USERPROPERTIES
    PROPERTY_USER_CALLING_STATION_ID = 1024_i32
    PROPERTY_USER_SAVED_CALLING_STATION_ID = 1025_i32
    PROPERTY_USER_RADIUS_CALLBACK_NUMBER = 1026_i32
    PROPERTY_USER_RADIUS_FRAMED_ROUTE = 1027_i32
    PROPERTY_USER_RADIUS_FRAMED_IP_ADDRESS = 1028_i32
    PROPERTY_USER_SAVED_RADIUS_CALLBACK_NUMBER = 1029_i32
    PROPERTY_USER_SAVED_RADIUS_FRAMED_ROUTE = 1030_i32
    PROPERTY_USER_SAVED_RADIUS_FRAMED_IP_ADDRESS = 1031_i32
    PROPERTY_USER_ALLOW_DIALIN = 1032_i32
    PROPERTY_USER_SERVICE_TYPE = 1033_i32
    PROPERTY_USER_RADIUS_FRAMED_IPV6_ROUTE = 1034_i32
    PROPERTY_USER_SAVED_RADIUS_FRAMED_IPV6_ROUTE = 1035_i32
    PROPERTY_USER_RADIUS_FRAMED_INTERFACE_ID = 1036_i32
    PROPERTY_USER_SAVED_RADIUS_FRAMED_INTERFACE_ID = 1037_i32
    PROPERTY_USER_RADIUS_FRAMED_IPV6_PREFIX = 1038_i32
    PROPERTY_USER_SAVED_RADIUS_FRAMED_IPV6_PREFIX = 1039_i32
  end
  enum DICTIONARYPROPERTIES
    PROPERTY_DICTIONARY_ATTRIBUTES_COLLECTION = 1024_i32
    PROPERTY_DICTIONARY_LOCATION = 1025_i32
  end
  enum ATTRIBUTEPROPERTIES
    PROPERTY_ATTRIBUTE_ID = 1024_i32
    PROPERTY_ATTRIBUTE_VENDOR_ID = 1025_i32
    PROPERTY_ATTRIBUTE_VENDOR_TYPE_ID = 1026_i32
    PROPERTY_ATTRIBUTE_IS_ENUMERABLE = 1027_i32
    PROPERTY_ATTRIBUTE_ENUM_NAMES = 1028_i32
    PROPERTY_ATTRIBUTE_ENUM_VALUES = 1029_i32
    PROPERTY_ATTRIBUTE_SYNTAX = 1030_i32
    PROPERTY_ATTRIBUTE_ALLOW_MULTIPLE = 1031_i32
    PROPERTY_ATTRIBUTE_ALLOW_LOG_ORDINAL = 1032_i32
    PROPERTY_ATTRIBUTE_ALLOW_IN_PROFILE = 1033_i32
    PROPERTY_ATTRIBUTE_ALLOW_IN_CONDITION = 1034_i32
    PROPERTY_ATTRIBUTE_DISPLAY_NAME = 1035_i32
    PROPERTY_ATTRIBUTE_VALUE = 1036_i32
    PROPERTY_ATTRIBUTE_ALLOW_IN_PROXY_PROFILE = 1037_i32
    PROPERTY_ATTRIBUTE_ALLOW_IN_PROXY_CONDITION = 1038_i32
    PROPERTY_ATTRIBUTE_ALLOW_IN_VPNDIALUP = 1039_i32
    PROPERTY_ATTRIBUTE_ALLOW_IN_8021X = 1040_i32
    PROPERTY_ATTRIBUTE_ENUM_FILTERS = 1041_i32
  end
  enum IASPROPERTIES
    PROPERTY_IAS_RADIUSSERVERGROUPS_COLLECTION = 1024_i32
    PROPERTY_IAS_POLICIES_COLLECTION = 1025_i32
    PROPERTY_IAS_PROFILES_COLLECTION = 1026_i32
    PROPERTY_IAS_PROTOCOLS_COLLECTION = 1027_i32
    PROPERTY_IAS_AUDITORS_COLLECTION = 1028_i32
    PROPERTY_IAS_REQUESTHANDLERS_COLLECTION = 1029_i32
    PROPERTY_IAS_PROXYPOLICIES_COLLECTION = 1030_i32
    PROPERTY_IAS_PROXYPROFILES_COLLECTION = 1031_i32
    PROPERTY_IAS_REMEDIATIONSERVERGROUPS_COLLECTION = 1032_i32
    PROPERTY_IAS_SHVTEMPLATES_COLLECTION = 1033_i32
  end
  enum TEMPLATESPROPERTIES
    PROPERTY_TEMPLATES_POLICIES_TEMPLATES = 1024_i32
    PROPERTY_TEMPLATES_PROFILES_TEMPLATES = 1025_i32
    PROPERTY_TEMPLATES_PROFILES_COLLECTION = 1026_i32
    PROPERTY_TEMPLATES_PROXYPOLICIES_TEMPLATES = 1027_i32
    PROPERTY_TEMPLATES_PROXYPROFILES_TEMPLATES = 1028_i32
    PROPERTY_TEMPLATES_PROXYPROFILES_COLLECTION = 1029_i32
    PROPERTY_TEMPLATES_REMEDIATIONSERVERGROUPS_TEMPLATES = 1030_i32
    PROPERTY_TEMPLATES_SHVTEMPLATES_TEMPLATES = 1031_i32
    PROPERTY_TEMPLATES_CLIENTS_TEMPLATES = 1032_i32
    PROPERTY_TEMPLATES_RADIUSSERVERS_TEMPLATES = 1033_i32
    PROPERTY_TEMPLATES_SHAREDSECRETS_TEMPLATES = 1034_i32
    PROPERTY_TEMPLATES_IPFILTERS_TEMPLATES = 1035_i32
  end
  enum CLIENTPROPERTIES
    PROPERTY_CLIENT_REQUIRE_SIGNATURE = 1024_i32
    PROPERTY_CLIENT_UNUSED = 1025_i32
    PROPERTY_CLIENT_SHARED_SECRET = 1026_i32
    PROPERTY_CLIENT_NAS_MANUFACTURER = 1027_i32
    PROPERTY_CLIENT_ADDRESS = 1028_i32
    PROPERTY_CLIENT_QUARANTINE_COMPATIBLE = 1029_i32
    PROPERTY_CLIENT_ENABLED = 1030_i32
    PROPERTY_CLIENT_SECRET_TEMPLATE_GUID = 1031_i32
  end
  enum VENDORPROPERTIES
    PROPERTY_NAS_VENDOR_ID = 1024_i32
  end
  enum PROFILEPROPERTIES
    PROPERTY_PROFILE_ATTRIBUTES_COLLECTION = 1024_i32
    PROPERTY_PROFILE_IPFILTER_TEMPLATE_GUID = 1025_i32
  end
  enum POLICYPROPERTIES
    PROPERTY_POLICY_CONSTRAINT = 1024_i32
    PROPERTY_POLICY_MERIT = 1025_i32
    PROPERTY_POLICY_UNUSED0 = 1026_i32
    PROPERTY_POLICY_UNUSED1 = 1027_i32
    PROPERTY_POLICY_PROFILE_NAME = 1028_i32
    PROPERTY_POLICY_ACTION = 1029_i32
    PROPERTY_POLICY_CONDITIONS_COLLECTION = 1030_i32
    PROPERTY_POLICY_ENABLED = 1031_i32
    PROPERTY_POLICY_SOURCETAG = 1032_i32
  end
  enum CONDITIONPROPERTIES
    PROPERTY_CONDITION_TEXT = 1024_i32
  end
  enum RADIUSSERVERGROUPPROPERTIES
    PROPERTY_RADIUSSERVERGROUP_SERVERS_COLLECTION = 1024_i32
  end
  enum RADIUSSERVERPROPERTIES
    PROPERTY_RADIUSSERVER_AUTH_PORT = 1024_i32
    PROPERTY_RADIUSSERVER_AUTH_SECRET = 1025_i32
    PROPERTY_RADIUSSERVER_ACCT_PORT = 1026_i32
    PROPERTY_RADIUSSERVER_ACCT_SECRET = 1027_i32
    PROPERTY_RADIUSSERVER_ADDRESS = 1028_i32
    PROPERTY_RADIUSSERVER_FORWARD_ACCT_ONOFF = 1029_i32
    PROPERTY_RADIUSSERVER_PRIORITY = 1030_i32
    PROPERTY_RADIUSSERVER_WEIGHT = 1031_i32
    PROPERTY_RADIUSSERVER_TIMEOUT = 1032_i32
    PROPERTY_RADIUSSERVER_MAX_LOST = 1033_i32
    PROPERTY_RADIUSSERVER_BLACKOUT = 1034_i32
    PROPERTY_RADIUSSERVER_SEND_SIGNATURE = 1035_i32
    PROPERTY_RADIUSSERVER_AUTH_SECRET_TEMPLATE_GUID = 1036_i32
    PROPERTY_RADIUSSERVER_ACCT_SECRET_TEMPLATE_GUID = 1037_i32
  end
  enum REMEDIATIONSERVERGROUPPROPERTIES
    PROPERTY_REMEDIATIONSERVERGROUP_SERVERS_COLLECTION = 1024_i32
  end
  enum REMEDIATIONSERVERPROPERTIES
    PROPERTY_REMEDIATIONSERVER_ADDRESS = 1024_i32
    PROPERTY_REMEDIATIONSERVER_FRIENDLY_NAME = 1025_i32
  end
  enum SHVTEMPLATEPROPERTIES
    PROPERTY_SHV_COMBINATION_TYPE = 1024_i32
    PROPERTY_SHV_LIST = 1025_i32
    PROPERTY_SHVCONFIG_LIST = 1026_i32
  end
  enum IPFILTERPROPERTIES
    PROPERTY_IPFILTER_ATTRIBUTES_COLLECTION = 1024_i32
  end
  enum SHAREDSECRETPROPERTIES
    PROPERTY_SHAREDSECRET_STRING = 1024_i32
  end
  enum IASCOMPONENTPROPERTIES
    PROPERTY_COMPONENT_ID = 1024_i32
    PROPERTY_COMPONENT_PROG_ID = 1025_i32
    PROPERTY_COMPONENT_START = 1026_i32
  end
  enum PROTOCOLPROPERTIES
    PROPERTY_PROTOCOL_REQUEST_HANDLER = 1026_i32
    PROPERTY_PROTOCOL_START = 1027_i32
  end
  enum RADIUSPROPERTIES
    PROPERTY_RADIUS_ACCOUNTING_PORT = 1027_i32
    PROPERTY_RADIUS_AUTHENTICATION_PORT = 1028_i32
    PROPERTY_RADIUS_CLIENTS_COLLECTION = 1029_i32
    PROPERTY_RADIUS_VENDORS_COLLECTION = 1030_i32
  end
  enum NTEVENTLOGPROPERTIES
    PROPERTY_EVENTLOG_LOG_APPLICATION_EVENTS = 1026_i32
    PROPERTY_EVENTLOG_LOG_MALFORMED = 1027_i32
    PROPERTY_EVENTLOG_LOG_DEBUG = 1028_i32
  end
  enum NAMESPROPERTIES
    PROPERTY_NAMES_REALMS = 1026_i32
  end
  enum NTSAMPROPERTIES
    PROPERTY_NTSAM_ALLOW_LM_AUTHENTICATION = 1026_i32
  end
  enum ACCOUNTINGPROPERTIES
    PROPERTY_ACCOUNTING_LOG_ACCOUNTING = 1026_i32
    PROPERTY_ACCOUNTING_LOG_ACCOUNTING_INTERIM = 1027_i32
    PROPERTY_ACCOUNTING_LOG_AUTHENTICATION = 1028_i32
    PROPERTY_ACCOUNTING_LOG_OPEN_NEW_FREQUENCY = 1029_i32
    PROPERTY_ACCOUNTING_LOG_OPEN_NEW_SIZE = 1030_i32
    PROPERTY_ACCOUNTING_LOG_FILE_DIRECTORY = 1031_i32
    PROPERTY_ACCOUNTING_LOG_IAS1_FORMAT = 1032_i32
    PROPERTY_ACCOUNTING_LOG_ENABLE_LOGGING = 1033_i32
    PROPERTY_ACCOUNTING_LOG_DELETE_IF_FULL = 1034_i32
    PROPERTY_ACCOUNTING_SQL_MAX_SESSIONS = 1035_i32
    PROPERTY_ACCOUNTING_LOG_AUTHENTICATION_INTERIM = 1036_i32
    PROPERTY_ACCOUNTING_LOG_FILE_IS_BACKUP = 1037_i32
    PROPERTY_ACCOUNTING_DISCARD_REQUEST_ON_FAILURE = 1038_i32
  end
  enum NAPPROPERTIES
    PROPERTY_NAP_POLICIES_COLLECTION = 1026_i32
    PROPERTY_SHV_TEMPLATES_COLLECTION = 1027_i32
  end
  enum RADIUSPROXYPROPERTIES
    PROPERTY_RADIUSPROXY_SERVERGROUPS = 1026_i32
  end
  enum REMEDIATIONSERVERSPROPERTIES
    PROPERTY_REMEDIATIONSERVERS_SERVERGROUPS = 1026_i32
  end
  enum SHV_COMBINATION_TYPE
    SHV_COMBINATION_TYPE_ALL_PASS = 0_i32
    SHV_COMBINATION_TYPE_ALL_FAIL = 1_i32
    SHV_COMBINATION_TYPE_ONE_OR_MORE_PASS = 2_i32
    SHV_COMBINATION_TYPE_ONE_OR_MORE_FAIL = 3_i32
    SHV_COMBINATION_TYPE_ONE_OR_MORE_INFECTED = 4_i32
    SHV_COMBINATION_TYPE_ONE_OR_MORE_TRANSITIONAL = 5_i32
    SHV_COMBINATION_TYPE_ONE_OR_MORE_UNKNOWN = 6_i32
    SHV_COMBINATION_TYPE_MAX = 7_i32
  end
  enum SERVICE_TYPE
    SERVICE_TYPE_IAS = 0_i32
    SERVICE_TYPE_RAS = 1_i32
    SERVICE_TYPE_RAMGMTSVC = 2_i32
    SERVICE_TYPE_MAX = 3_i32
  end
  enum IASOSTYPE
    SYSTEM_TYPE_NT4_WORKSTATION = 0_i32
    SYSTEM_TYPE_NT5_WORKSTATION = 1_i32
    SYSTEM_TYPE_NT6_WORKSTATION = 2_i32
    SYSTEM_TYPE_NT6_1_WORKSTATION = 3_i32
    SYSTEM_TYPE_NT6_2_WORKSTATION = 4_i32
    SYSTEM_TYPE_NT6_3_WORKSTATION = 5_i32
    SYSTEM_TYPE_NT10_0_WORKSTATION = 6_i32
    SYSTEM_TYPE_NT4_SERVER = 7_i32
    SYSTEM_TYPE_NT5_SERVER = 8_i32
    SYSTEM_TYPE_NT6_SERVER = 9_i32
    SYSTEM_TYPE_NT6_1_SERVER = 10_i32
    SYSTEM_TYPE_NT6_2_SERVER = 11_i32
    SYSTEM_TYPE_NT6_3_SERVER = 12_i32
    SYSTEM_TYPE_NT10_0_SERVER = 13_i32
  end
  enum IASDOMAINTYPE
    DOMAIN_TYPE_NONE = 0_i32
    DOMAIN_TYPE_NT4 = 1_i32
    DOMAIN_TYPE_NT5 = 2_i32
    DOMAIN_TYPE_MIXED = 3_i32
  end
  enum IASDATASTORE
    DATA_STORE_LOCAL = 0_i32
    DATA_STORE_DIRECTORY = 1_i32
  end
  enum RADIUS_ATTRIBUTE_TYPE
    Ratminimum = 0_i32
    Ratusername = 1_i32
    Ratuserpassword = 2_i32
    Ratchappassword = 3_i32
    Ratnasipaddress = 4_i32
    Ratnasport = 5_i32
    Ratservicetype = 6_i32
    Ratframedprotocol = 7_i32
    Ratframedipaddress = 8_i32
    Ratframedipnetmask = 9_i32
    Ratframedrouting = 10_i32
    Ratfilterid = 11_i32
    Ratframedmtu = 12_i32
    Ratframedcompression = 13_i32
    Ratloginiphost = 14_i32
    Ratloginservice = 15_i32
    Ratloginport = 16_i32
    Ratreplymessage = 18_i32
    Ratcallbacknumber = 19_i32
    Ratcallbackid = 20_i32
    Ratframedroute = 22_i32
    Ratframedipxnetwork = 23_i32
    Ratstate = 24_i32
    Ratclass = 25_i32
    Ratvendorspecific = 26_i32
    Ratsessiontimeout = 27_i32
    Ratidletimeout = 28_i32
    Ratterminationaction = 29_i32
    Ratcalledstationid = 30_i32
    Ratcallingstationid = 31_i32
    Ratnasidentifier = 32_i32
    Ratproxystate = 33_i32
    Ratloginlatservice = 34_i32
    Ratloginlatnode = 35_i32
    Ratloginlatgroup = 36_i32
    Ratframedappletalklink = 37_i32
    Ratframedappletalknetwork = 38_i32
    Ratframedappletalkzone = 39_i32
    Ratacctstatustype = 40_i32
    Ratacctdelaytime = 41_i32
    Ratacctinputoctets = 42_i32
    Ratacctoutputoctets = 43_i32
    Ratacctsessionid = 44_i32
    Ratacctauthentic = 45_i32
    Ratacctsessiontime = 46_i32
    Ratacctinputpackets = 47_i32
    Ratacctoutputpackets = 48_i32
    Ratacctterminationcause = 49_i32
    Ratchapchallenge = 60_i32
    Ratnasporttype = 61_i32
    Ratportlimit = 62_i32
    Rattunneltype = 64_i32
    Ratmediumtype = 65_i32
    Rattunnelpassword = 69_i32
    Rattunnelprivategroupid = 81_i32
    Ratnasipv6address = 95_i32
    Ratframedinterfaceid = 96_i32
    Ratframedipv6prefix = 97_i32
    Ratloginipv6host = 98_i32
    Ratframedipv6route = 99_i32
    Ratframedipv6pool = 100_i32
    Ratcode = 262_i32
    Ratidentifier = 263_i32
    Ratauthenticator = 264_i32
    Ratsrcipaddress = 265_i32
    Ratsrcport = 266_i32
    Ratprovider = 267_i32
    Ratstrippedusername = 268_i32
    Ratfqusername = 269_i32
    Ratpolicyname = 270_i32
    Ratuniqueid = 271_i32
    Ratextensionstate = 272_i32
    Rateaptlv = 273_i32
    Ratrejectreasoncode = 274_i32
    Ratcrppolicyname = 275_i32
    Ratprovidername = 276_i32
    Ratcleartextpassword = 277_i32
    Ratsrcipv6address = 278_i32
    Ratcertificatethumbprint = 279_i32
  end
  enum RADIUS_CODE
    Rcunknown = 0_i32
    Rcaccessrequest = 1_i32
    Rcaccessaccept = 2_i32
    Rcaccessreject = 3_i32
    Rcaccountingrequest = 4_i32
    Rcaccountingresponse = 5_i32
    Rcaccesschallenge = 11_i32
    Rcdiscard = 256_i32
  end
  enum RADIUS_AUTHENTICATION_PROVIDER
    Rapunknown = 0_i32
    Rapusersfile = 1_i32
    Rapproxy = 2_i32
    Rapwindowsnt = 3_i32
    Rapmcis = 4_i32
    Rapodbc = 5_i32
    Rapnone = 6_i32
  end
  enum RADIUS_REJECT_REASON_CODE
    Rrrcundefined = 0_i32
    Rrrcaccountunknown = 1_i32
    Rrrcaccountdisabled = 2_i32
    Rrrcaccountexpired = 3_i32
    Rrrcauthenticationfailure = 4_i32
  end
  enum RADIUS_DATA_TYPE
    Rdtunknown = 0_i32
    Rdtstring = 1_i32
    Rdtaddress = 2_i32
    Rdtinteger = 3_i32
    Rdttime = 4_i32
    Rdtipv6address = 5_i32
  end
  enum RADIUS_ACTION
    Racontinue = 0_i32
    Rareject = 1_i32
    Raaccept = 2_i32
  end
  enum RADIUS_EXTENSION_POINT
    Repauthentication = 0_i32
    Repauthorization = 1_i32
  end

  @[Extern]
  record RADIUS_ATTRIBUTE,
    dwAttrType : UInt32,
    fDataType : Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_DATA_TYPE,
    cbDataLength : UInt32,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      dwValue : UInt32,
      lpValue : UInt8*

  end

  @[Extern]
  record RADIUS_VSA_FORMAT,
    vendor_id : UInt8[4],
    vendor_type : UInt8,
    vendor_length : UInt8,
    attribute_specific : UInt8*

  @[Extern]
  record RADIUS_ATTRIBUTE_ARRAY,
    cbSize : UInt32,
    add : LibC::IntPtrT,
    attribute_at : LibC::IntPtrT,
    get_size : LibC::IntPtrT,
    insert_at : LibC::IntPtrT,
    remove_at : LibC::IntPtrT,
    set_at : LibC::IntPtrT

  @[Extern]
  record RADIUS_EXTENSION_CONTROL_BLOCK,
    cbSize : UInt32,
    dwVersion : UInt32,
    repPoint : Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_EXTENSION_POINT,
    rcRequestType : Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_CODE,
    rcResponseType : Win32cr::NetworkManagement::NetworkPolicyServer::RADIUS_CODE,
    get_request : LibC::IntPtrT,
    get_response : LibC::IntPtrT,
    set_response_type : LibC::IntPtrT

  @[Extern]
  record ISdoMachineVtbl,
    query_interface : Proc(ISdoMachine*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISdoMachine*, UInt32),
    release : Proc(ISdoMachine*, UInt32),
    get_type_info_count : Proc(ISdoMachine*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISdoMachine*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISdoMachine*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISdoMachine*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    attach : Proc(ISdoMachine*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_dictionary_sdo : Proc(ISdoMachine*, Void**, Win32cr::Foundation::HRESULT),
    get_service_sdo : Proc(ISdoMachine*, Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_user_sdo : Proc(ISdoMachine*, Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_os_type : Proc(ISdoMachine*, Win32cr::NetworkManagement::NetworkPolicyServer::IASOSTYPE*, Win32cr::Foundation::HRESULT),
    get_domain_type : Proc(ISdoMachine*, Win32cr::NetworkManagement::NetworkPolicyServer::IASDOMAINTYPE*, Win32cr::Foundation::HRESULT),
    is_directory_available : Proc(ISdoMachine*, Int16*, Win32cr::Foundation::HRESULT),
    get_attached_computer : Proc(ISdoMachine*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_sdo_schema : Proc(ISdoMachine*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("479f6e75-49a2-11d2-8eca-00c04fc2f519")]
  record ISdoMachine, lpVtbl : ISdoMachineVtbl* do
    GUID = LibC::GUID.new(0x479f6e75_u32, 0x49a2_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0xca_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf5_u8, 0x19_u8])
    def query_interface(this : ISdoMachine*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISdoMachine*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISdoMachine*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISdoMachine*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISdoMachine*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISdoMachine*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISdoMachine*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def attach(this : ISdoMachine*, bstrComputerName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach.call(this, bstrComputerName)
    end
    def get_dictionary_sdo(this : ISdoMachine*, ppDictionarySDO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_sdo.call(this, ppDictionarySDO)
    end
    def get_service_sdo(this : ISdoMachine*, eDataStore : Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, bstrServiceName : Win32cr::Foundation::BSTR, ppServiceSDO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_sdo.call(this, eDataStore, bstrServiceName, ppServiceSDO)
    end
    def get_user_sdo(this : ISdoMachine*, eDataStore : Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, bstrUserName : Win32cr::Foundation::BSTR, ppUserSDO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_sdo.call(this, eDataStore, bstrUserName, ppUserSDO)
    end
    def get_os_type(this : ISdoMachine*, eOSType : Win32cr::NetworkManagement::NetworkPolicyServer::IASOSTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_os_type.call(this, eOSType)
    end
    def get_domain_type(this : ISdoMachine*, eDomainType : Win32cr::NetworkManagement::NetworkPolicyServer::IASDOMAINTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain_type.call(this, eDomainType)
    end
    def is_directory_available(this : ISdoMachine*, boolDirectoryAvailable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_directory_available.call(this, boolDirectoryAvailable)
    end
    def get_attached_computer(this : ISdoMachine*, bstrComputerName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attached_computer.call(this, bstrComputerName)
    end
    def get_sdo_schema(this : ISdoMachine*, ppSDOSchema : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sdo_schema.call(this, ppSDOSchema)
    end

  end

  @[Extern]
  record ISdoMachine2Vtbl,
    query_interface : Proc(ISdoMachine2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISdoMachine2*, UInt32),
    release : Proc(ISdoMachine2*, UInt32),
    get_type_info_count : Proc(ISdoMachine2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISdoMachine2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISdoMachine2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISdoMachine2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    attach : Proc(ISdoMachine2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_dictionary_sdo : Proc(ISdoMachine2*, Void**, Win32cr::Foundation::HRESULT),
    get_service_sdo : Proc(ISdoMachine2*, Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_user_sdo : Proc(ISdoMachine2*, Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_os_type : Proc(ISdoMachine2*, Win32cr::NetworkManagement::NetworkPolicyServer::IASOSTYPE*, Win32cr::Foundation::HRESULT),
    get_domain_type : Proc(ISdoMachine2*, Win32cr::NetworkManagement::NetworkPolicyServer::IASDOMAINTYPE*, Win32cr::Foundation::HRESULT),
    is_directory_available : Proc(ISdoMachine2*, Int16*, Win32cr::Foundation::HRESULT),
    get_attached_computer : Proc(ISdoMachine2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_sdo_schema : Proc(ISdoMachine2*, Void**, Win32cr::Foundation::HRESULT),
    get_templates_sdo : Proc(ISdoMachine2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enable_templates : Proc(ISdoMachine2*, Win32cr::Foundation::HRESULT),
    sync_config_against_templates : Proc(ISdoMachine2*, Win32cr::Foundation::BSTR, Void**, Void**, Int16, Win32cr::Foundation::HRESULT),
    import_remote_templates : Proc(ISdoMachine2*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    reload : Proc(ISdoMachine2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("518e5ffe-d8ce-4f7e-a5db-b40a35419d3b")]
  record ISdoMachine2, lpVtbl : ISdoMachine2Vtbl* do
    GUID = LibC::GUID.new(0x518e5ffe_u32, 0xd8ce_u16, 0x4f7e_u16, StaticArray[0xa5_u8, 0xdb_u8, 0xb4_u8, 0xa_u8, 0x35_u8, 0x41_u8, 0x9d_u8, 0x3b_u8])
    def query_interface(this : ISdoMachine2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISdoMachine2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISdoMachine2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISdoMachine2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISdoMachine2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISdoMachine2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISdoMachine2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def attach(this : ISdoMachine2*, bstrComputerName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach.call(this, bstrComputerName)
    end
    def get_dictionary_sdo(this : ISdoMachine2*, ppDictionarySDO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_sdo.call(this, ppDictionarySDO)
    end
    def get_service_sdo(this : ISdoMachine2*, eDataStore : Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, bstrServiceName : Win32cr::Foundation::BSTR, ppServiceSDO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_sdo.call(this, eDataStore, bstrServiceName, ppServiceSDO)
    end
    def get_user_sdo(this : ISdoMachine2*, eDataStore : Win32cr::NetworkManagement::NetworkPolicyServer::IASDATASTORE, bstrUserName : Win32cr::Foundation::BSTR, ppUserSDO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_sdo.call(this, eDataStore, bstrUserName, ppUserSDO)
    end
    def get_os_type(this : ISdoMachine2*, eOSType : Win32cr::NetworkManagement::NetworkPolicyServer::IASOSTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_os_type.call(this, eOSType)
    end
    def get_domain_type(this : ISdoMachine2*, eDomainType : Win32cr::NetworkManagement::NetworkPolicyServer::IASDOMAINTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain_type.call(this, eDomainType)
    end
    def is_directory_available(this : ISdoMachine2*, boolDirectoryAvailable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_directory_available.call(this, boolDirectoryAvailable)
    end
    def get_attached_computer(this : ISdoMachine2*, bstrComputerName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attached_computer.call(this, bstrComputerName)
    end
    def get_sdo_schema(this : ISdoMachine2*, ppSDOSchema : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sdo_schema.call(this, ppSDOSchema)
    end
    def get_templates_sdo(this : ISdoMachine2*, bstrServiceName : Win32cr::Foundation::BSTR, ppTemplatesSDO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_templates_sdo.call(this, bstrServiceName, ppTemplatesSDO)
    end
    def enable_templates(this : ISdoMachine2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_templates.call(this)
    end
    def sync_config_against_templates(this : ISdoMachine2*, bstrServiceName : Win32cr::Foundation::BSTR, ppConfigRoot : Void**, ppTemplatesRoot : Void**, bForcedSync : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_config_against_templates.call(this, bstrServiceName, ppConfigRoot, ppTemplatesRoot, bForcedSync)
    end
    def import_remote_templates(this : ISdoMachine2*, pLocalTemplatesRoot : Void*, bstrRemoteMachineName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_remote_templates.call(this, pLocalTemplatesRoot, bstrRemoteMachineName)
    end
    def reload(this : ISdoMachine2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reload.call(this)
    end

  end

  @[Extern]
  record ISdoServiceControlVtbl,
    query_interface : Proc(ISdoServiceControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISdoServiceControl*, UInt32),
    release : Proc(ISdoServiceControl*, UInt32),
    get_type_info_count : Proc(ISdoServiceControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISdoServiceControl*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISdoServiceControl*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISdoServiceControl*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    start_service : Proc(ISdoServiceControl*, Win32cr::Foundation::HRESULT),
    stop_service : Proc(ISdoServiceControl*, Win32cr::Foundation::HRESULT),
    get_service_status : Proc(ISdoServiceControl*, Int32*, Win32cr::Foundation::HRESULT),
    reset_service : Proc(ISdoServiceControl*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("479f6e74-49a2-11d2-8eca-00c04fc2f519")]
  record ISdoServiceControl, lpVtbl : ISdoServiceControlVtbl* do
    GUID = LibC::GUID.new(0x479f6e74_u32, 0x49a2_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0xca_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf5_u8, 0x19_u8])
    def query_interface(this : ISdoServiceControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISdoServiceControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISdoServiceControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISdoServiceControl*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISdoServiceControl*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISdoServiceControl*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISdoServiceControl*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def start_service(this : ISdoServiceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_service.call(this)
    end
    def stop_service(this : ISdoServiceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_service.call(this)
    end
    def get_service_status(this : ISdoServiceControl*, status : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_status.call(this, status)
    end
    def reset_service(this : ISdoServiceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_service.call(this)
    end

  end

  @[Extern]
  record ISdoVtbl,
    query_interface : Proc(ISdo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISdo*, UInt32),
    release : Proc(ISdo*, UInt32),
    get_type_info_count : Proc(ISdo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISdo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISdo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISdo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_info : Proc(ISdo*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_property : Proc(ISdo*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_property : Proc(ISdo*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    reset_property : Proc(ISdo*, Int32, Win32cr::Foundation::HRESULT),
    apply : Proc(ISdo*, Win32cr::Foundation::HRESULT),
    restore : Proc(ISdo*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISdo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("56bc53de-96db-11d1-bf3f-000000000000")]
  record ISdo, lpVtbl : ISdoVtbl* do
    GUID = LibC::GUID.new(0x56bc53de_u32, 0x96db_u16, 0x11d1_u16, StaticArray[0xbf_u8, 0x3f_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ISdo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISdo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISdo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISdo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISdo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISdo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISdo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_property_info(this : ISdo*, id : Int32, ppPropertyInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_info.call(this, id, ppPropertyInfo)
    end
    def get_property(this : ISdo*, id : Int32, pValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, id, pValue)
    end
    def put_property(this : ISdo*, id : Int32, pValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_property.call(this, id, pValue)
    end
    def reset_property(this : ISdo*, id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_property.call(this, id)
    end
    def apply(this : ISdo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply.call(this)
    end
    def restore(this : ISdo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore.call(this)
    end
    def get__NewEnum(this : ISdo*, ppEnumVARIANT : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumVARIANT)
    end

  end

  @[Extern]
  record ISdoCollectionVtbl,
    query_interface : Proc(ISdoCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISdoCollection*, UInt32),
    release : Proc(ISdoCollection*, UInt32),
    get_type_info_count : Proc(ISdoCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISdoCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISdoCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISdoCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISdoCollection*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(ISdoCollection*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(ISdoCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove_all : Proc(ISdoCollection*, Win32cr::Foundation::HRESULT),
    reload : Proc(ISdoCollection*, Win32cr::Foundation::HRESULT),
    is_name_unique : Proc(ISdoCollection*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    item : Proc(ISdoCollection*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISdoCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("56bc53e2-96db-11d1-bf3f-000000000000")]
  record ISdoCollection, lpVtbl : ISdoCollectionVtbl* do
    GUID = LibC::GUID.new(0x56bc53e2_u32, 0x96db_u16, 0x11d1_u16, StaticArray[0xbf_u8, 0x3f_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ISdoCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISdoCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISdoCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISdoCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISdoCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISdoCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISdoCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISdoCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def add(this : ISdoCollection*, bstrName : Win32cr::Foundation::BSTR, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, bstrName, ppItem)
    end
    def remove(this : ISdoCollection*, pItem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, pItem)
    end
    def remove_all(this : ISdoCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all.call(this)
    end
    def reload(this : ISdoCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reload.call(this)
    end
    def is_name_unique(this : ISdoCollection*, bstrName : Win32cr::Foundation::BSTR, pBool : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_name_unique.call(this, bstrName, pBool)
    end
    def item(this : ISdoCollection*, name : Win32cr::System::Com::VARIANT*, pItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, name, pItem)
    end
    def get__NewEnum(this : ISdoCollection*, ppEnumVARIANT : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumVARIANT)
    end

  end

  @[Extern]
  record ITemplateSdoVtbl,
    query_interface : Proc(ITemplateSdo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITemplateSdo*, UInt32),
    release : Proc(ITemplateSdo*, UInt32),
    get_type_info_count : Proc(ITemplateSdo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITemplateSdo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITemplateSdo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITemplateSdo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_info : Proc(ITemplateSdo*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITemplateSdo*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_property : Proc(ITemplateSdo*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    reset_property : Proc(ITemplateSdo*, Int32, Win32cr::Foundation::HRESULT),
    apply : Proc(ITemplateSdo*, Win32cr::Foundation::HRESULT),
    restore : Proc(ITemplateSdo*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ITemplateSdo*, Void**, Win32cr::Foundation::HRESULT),
    add_to_collection : Proc(ITemplateSdo*, Win32cr::Foundation::BSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_to_sdo : Proc(ITemplateSdo*, Win32cr::Foundation::BSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_to_sdo_as_property : Proc(ITemplateSdo*, Void*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8aa85302-d2e2-4e20-8b1f-a571e437d6c9")]
  record ITemplateSdo, lpVtbl : ITemplateSdoVtbl* do
    GUID = LibC::GUID.new(0x8aa85302_u32, 0xd2e2_u16, 0x4e20_u16, StaticArray[0x8b_u8, 0x1f_u8, 0xa5_u8, 0x71_u8, 0xe4_u8, 0x37_u8, 0xd6_u8, 0xc9_u8])
    def query_interface(this : ITemplateSdo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITemplateSdo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITemplateSdo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITemplateSdo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITemplateSdo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITemplateSdo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITemplateSdo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_property_info(this : ITemplateSdo*, id : Int32, ppPropertyInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_info.call(this, id, ppPropertyInfo)
    end
    def get_property(this : ITemplateSdo*, id : Int32, pValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, id, pValue)
    end
    def put_property(this : ITemplateSdo*, id : Int32, pValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_property.call(this, id, pValue)
    end
    def reset_property(this : ITemplateSdo*, id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_property.call(this, id)
    end
    def apply(this : ITemplateSdo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply.call(this)
    end
    def restore(this : ITemplateSdo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore.call(this)
    end
    def get__NewEnum(this : ITemplateSdo*, ppEnumVARIANT : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumVARIANT)
    end
    def add_to_collection(this : ITemplateSdo*, bstrName : Win32cr::Foundation::BSTR, pCollection : Void*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_collection.call(this, bstrName, pCollection, ppItem)
    end
    def add_to_sdo(this : ITemplateSdo*, bstrName : Win32cr::Foundation::BSTR, pSdoTarget : Void*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_sdo.call(this, bstrName, pSdoTarget, ppItem)
    end
    def add_to_sdo_as_property(this : ITemplateSdo*, pSdoTarget : Void*, id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_sdo_as_property.call(this, pSdoTarget, id)
    end

  end

  @[Extern]
  record ISdoDictionaryOldVtbl,
    query_interface : Proc(ISdoDictionaryOld*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISdoDictionaryOld*, UInt32),
    release : Proc(ISdoDictionaryOld*, UInt32),
    get_type_info_count : Proc(ISdoDictionaryOld*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISdoDictionaryOld*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISdoDictionaryOld*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISdoDictionaryOld*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_attributes : Proc(ISdoDictionaryOld*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_attribute_info : Proc(ISdoDictionaryOld*, Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    enum_attribute_values : Proc(ISdoDictionaryOld*, Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    create_attribute : Proc(ISdoDictionaryOld*, Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID, Void**, Win32cr::Foundation::HRESULT),
    get_attribute_id : Proc(ISdoDictionaryOld*, Win32cr::Foundation::BSTR, Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d432e5f4-53d8-11d2-9a3a-00c04fb998ac")]
  record ISdoDictionaryOld, lpVtbl : ISdoDictionaryOldVtbl* do
    GUID = LibC::GUID.new(0xd432e5f4_u32, 0x53d8_u16, 0x11d2_u16, StaticArray[0x9a_u8, 0x3a_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0xac_u8])
    def query_interface(this : ISdoDictionaryOld*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISdoDictionaryOld*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISdoDictionaryOld*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISdoDictionaryOld*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISdoDictionaryOld*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISdoDictionaryOld*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISdoDictionaryOld*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def enum_attributes(this : ISdoDictionaryOld*, id : Win32cr::System::Com::VARIANT*, pValues : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_attributes.call(this, id, pValues)
    end
    def get_attribute_info(this : ISdoDictionaryOld*, id : Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID, pInfoIDs : Win32cr::System::Com::VARIANT*, pInfoValues : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_info.call(this, id, pInfoIDs, pInfoValues)
    end
    def enum_attribute_values(this : ISdoDictionaryOld*, id : Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID, pValueIds : Win32cr::System::Com::VARIANT*, pValuesDesc : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_attribute_values.call(this, id, pValueIds, pValuesDesc)
    end
    def create_attribute(this : ISdoDictionaryOld*, id : Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID, ppAttributeObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_attribute.call(this, id, ppAttributeObject)
    end
    def get_attribute_id(this : ISdoDictionaryOld*, bstrAttributeName : Win32cr::Foundation::BSTR, pId : Win32cr::NetworkManagement::NetworkPolicyServer::ATTRIBUTEID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_id.call(this, bstrAttributeName, pId)
    end

  end

end