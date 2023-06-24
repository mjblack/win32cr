require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  RADIUS_EXTENSION_VERSION = 1_u32
  CLSID_SdoMachine = LibC::GUID.new(0xe9218ae7_u32, 0x9e91_u16, 0x11d1_u16, StaticArray[0xbf_u8, 0x60_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x84_u8, 0x6b_u8, 0xc0_u8])

  alias PRADIUS_EXTENSION_INIT = Proc(UInt32)
  alias PRADIUS_EXTENSION_TERM = Proc(Void)
  alias PRADIUS_EXTENSION_PROCESS = Proc(RADIUS_ATTRIBUTE*, RADIUS_ACTION*, UInt32)
  alias PRADIUS_EXTENSION_PROCESS_EX = Proc(RADIUS_ATTRIBUTE*, RADIUS_ATTRIBUTE**, RADIUS_ACTION*, UInt32)
  alias PRADIUS_EXTENSION_FREE_ATTRIBUTES = Proc(RADIUS_ATTRIBUTE*, Void)
  alias PRADIUS_EXTENSION_PROCESS_2 = Proc(RADIUS_EXTENSION_CONTROL_BLOCK*, UInt32)


  enum ATTRIBUTEID : UInt32
    ATTRIBUTE_UNDEFINED = 0
    ATTRIBUTE_MIN_VALUE = 1
    RADIUS_ATTRIBUTE_USER_NAME = 1
    RADIUS_ATTRIBUTE_USER_PASSWORD = 2
    RADIUS_ATTRIBUTE_CHAP_PASSWORD = 3
    RADIUS_ATTRIBUTE_NAS_IP_ADDRESS = 4
    RADIUS_ATTRIBUTE_NAS_PORT = 5
    RADIUS_ATTRIBUTE_SERVICE_TYPE = 6
    RADIUS_ATTRIBUTE_FRAMED_PROTOCOL = 7
    RADIUS_ATTRIBUTE_FRAMED_IP_ADDRESS = 8
    RADIUS_ATTRIBUTE_FRAMED_IP_NETMASK = 9
    RADIUS_ATTRIBUTE_FRAMED_ROUTING = 10
    RADIUS_ATTRIBUTE_FILTER_ID = 11
    RADIUS_ATTRIBUTE_FRAMED_MTU = 12
    RADIUS_ATTRIBUTE_FRAMED_COMPRESSION = 13
    RADIUS_ATTRIBUTE_LOGIN_IP_HOST = 14
    RADIUS_ATTRIBUTE_LOGIN_SERVICE = 15
    RADIUS_ATTRIBUTE_LOGIN_TCP_PORT = 16
    RADIUS_ATTRIBUTE_UNASSIGNED1 = 17
    RADIUS_ATTRIBUTE_REPLY_MESSAGE = 18
    RADIUS_ATTRIBUTE_CALLBACK_NUMBER = 19
    RADIUS_ATTRIBUTE_CALLBACK_ID = 20
    RADIUS_ATTRIBUTE_UNASSIGNED2 = 21
    RADIUS_ATTRIBUTE_FRAMED_ROUTE = 22
    RADIUS_ATTRIBUTE_FRAMED_IPX_NETWORK = 23
    RADIUS_ATTRIBUTE_STATE = 24
    RADIUS_ATTRIBUTE_CLASS = 25
    RADIUS_ATTRIBUTE_VENDOR_SPECIFIC = 26
    RADIUS_ATTRIBUTE_SESSION_TIMEOUT = 27
    RADIUS_ATTRIBUTE_IDLE_TIMEOUT = 28
    RADIUS_ATTRIBUTE_TERMINATION_ACTION = 29
    RADIUS_ATTRIBUTE_CALLED_STATION_ID = 30
    RADIUS_ATTRIBUTE_CALLING_STATION_ID = 31
    RADIUS_ATTRIBUTE_NAS_IDENTIFIER = 32
    RADIUS_ATTRIBUTE_PROXY_STATE = 33
    RADIUS_ATTRIBUTE_LOGIN_LAT_SERVICE = 34
    RADIUS_ATTRIBUTE_LOGIN_LAT_NODE = 35
    RADIUS_ATTRIBUTE_LOGIN_LAT_GROUP = 36
    RADIUS_ATTRIBUTE_FRAMED_APPLETALK_LINK = 37
    RADIUS_ATTRIBUTE_FRAMED_APPLETALK_NET = 38
    RADIUS_ATTRIBUTE_FRAMED_APPLETALK_ZONE = 39
    RADIUS_ATTRIBUTE_ACCT_STATUS_TYPE = 40
    RADIUS_ATTRIBUTE_ACCT_DELAY_TIME = 41
    RADIUS_ATTRIBUTE_ACCT_INPUT_OCTETS = 42
    RADIUS_ATTRIBUTE_ACCT_OUTPUT_OCTETS = 43
    RADIUS_ATTRIBUTE_ACCT_SESSION_ID = 44
    RADIUS_ATTRIBUTE_ACCT_AUTHENTIC = 45
    RADIUS_ATTRIBUTE_ACCT_SESSION_TIME = 46
    RADIUS_ATTRIBUTE_ACCT_INPUT_PACKETS = 47
    RADIUS_ATTRIBUTE_ACCT_OUTPUT_PACKETS = 48
    RADIUS_ATTRIBUTE_ACCT_TERMINATE_CAUSE = 49
    RADIUS_ATTRIBUTE_ACCT_MULTI_SSN_ID = 50
    RADIUS_ATTRIBUTE_ACCT_LINK_COUNT = 51
    RADIUS_ATTRIBUTE_CHAP_CHALLENGE = 60
    RADIUS_ATTRIBUTE_NAS_PORT_TYPE = 61
    RADIUS_ATTRIBUTE_PORT_LIMIT = 62
    RADIUS_ATTRIBUTE_LOGIN_LAT_PORT = 63
    RADIUS_ATTRIBUTE_TUNNEL_TYPE = 64
    RADIUS_ATTRIBUTE_TUNNEL_MEDIUM_TYPE = 65
    RADIUS_ATTRIBUTE_TUNNEL_CLIENT_ENDPT = 66
    RADIUS_ATTRIBUTE_TUNNEL_SERVER_ENDPT = 67
    RADIUS_ATTRIBUTE_ACCT_TUNNEL_CONN = 68
    RADIUS_ATTRIBUTE_TUNNEL_PASSWORD = 69
    RADIUS_ATTRIBUTE_ARAP_PASSWORD = 70
    RADIUS_ATTRIBUTE_ARAP_FEATURES = 71
    RADIUS_ATTRIBUTE_ARAP_ZONE_ACCESS = 72
    RADIUS_ATTRIBUTE_ARAP_SECURITY = 73
    RADIUS_ATTRIBUTE_ARAP_SECURITY_DATA = 74
    RADIUS_ATTRIBUTE_PASSWORD_RETRY = 75
    RADIUS_ATTRIBUTE_PROMPT = 76
    RADIUS_ATTRIBUTE_CONNECT_INFO = 77
    RADIUS_ATTRIBUTE_CONFIGURATION_TOKEN = 78
    RADIUS_ATTRIBUTE_EAP_MESSAGE = 79
    RADIUS_ATTRIBUTE_SIGNATURE = 80
    RADIUS_ATTRIBUTE_TUNNEL_PVT_GROUP_ID = 81
    RADIUS_ATTRIBUTE_TUNNEL_ASSIGNMENT_ID = 82
    RADIUS_ATTRIBUTE_TUNNEL_PREFERENCE = 83
    RADIUS_ATTRIBUTE_ARAP_CHALLENGE_RESPONSE = 84
    RADIUS_ATTRIBUTE_ACCT_INTERIM_INTERVAL = 85
    RADIUS_ATTRIBUTE_NAS_IPv6_ADDRESS = 95
    RADIUS_ATTRIBUTE_FRAMED_INTERFACE_ID = 96
    RADIUS_ATTRIBUTE_FRAMED_IPv6_PREFIX = 97
    RADIUS_ATTRIBUTE_LOGIN_IPv6_HOST = 98
    RADIUS_ATTRIBUTE_FRAMED_IPv6_ROUTE = 99
    RADIUS_ATTRIBUTE_FRAMED_IPv6_POOL = 100
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IP_ADDRESS = 4096
    IAS_ATTRIBUTE_SAVED_RADIUS_CALLBACK_NUMBER = 4097
    IAS_ATTRIBUTE_NP_CALLING_STATION_ID = 4098
    IAS_ATTRIBUTE_SAVED_NP_CALLING_STATION_ID = 4099
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_ROUTE = 4100
    IAS_ATTRIBUTE_IGNORE_USER_DIALIN_PROPERTIES = 4101
    IAS_ATTRIBUTE_NP_TIME_OF_DAY = 4102
    IAS_ATTRIBUTE_NP_CALLED_STATION_ID = 4103
    IAS_ATTRIBUTE_NP_ALLOWED_PORT_TYPES = 4104
    IAS_ATTRIBUTE_NP_AUTHENTICATION_TYPE = 4105
    IAS_ATTRIBUTE_NP_ALLOWED_EAP_TYPE = 4106
    IAS_ATTRIBUTE_SHARED_SECRET = 4107
    IAS_ATTRIBUTE_CLIENT_IP_ADDRESS = 4108
    IAS_ATTRIBUTE_CLIENT_PACKET_HEADER = 4109
    IAS_ATTRIBUTE_TOKEN_GROUPS = 4110
    IAS_ATTRIBUTE_ALLOW_DIALIN = 4111
    IAS_ATTRIBUTE_REQUEST_ID = 4112
    IAS_ATTRIBUTE_MANIPULATION_TARGET = 4113
    IAS_ATTRIBUTE_MANIPULATION_RULE = 4114
    IAS_ATTRIBUTE_ORIGINAL_USER_NAME = 4115
    IAS_ATTRIBUTE_CLIENT_VENDOR_TYPE = 4116
    IAS_ATTRIBUTE_CLIENT_UDP_PORT = 4117
    MS_ATTRIBUTE_CHAP_CHALLENGE = 4118
    MS_ATTRIBUTE_CHAP_RESPONSE = 4119
    MS_ATTRIBUTE_CHAP_DOMAIN = 4120
    MS_ATTRIBUTE_CHAP_ERROR = 4121
    MS_ATTRIBUTE_CHAP_CPW1 = 4122
    MS_ATTRIBUTE_CHAP_CPW2 = 4123
    MS_ATTRIBUTE_CHAP_LM_ENC_PW = 4124
    MS_ATTRIBUTE_CHAP_NT_ENC_PW = 4125
    MS_ATTRIBUTE_CHAP_MPPE_KEYS = 4126
    IAS_ATTRIBUTE_AUTHENTICATION_TYPE = 4127
    IAS_ATTRIBUTE_CLIENT_NAME = 4128
    IAS_ATTRIBUTE_NT4_ACCOUNT_NAME = 4129
    IAS_ATTRIBUTE_FULLY_QUALIFIED_USER_NAME = 4130
    IAS_ATTRIBUTE_NTGROUPS = 4131
    IAS_ATTRIBUTE_EAP_FRIENDLY_NAME = 4132
    IAS_ATTRIBUTE_AUTH_PROVIDER_TYPE = 4133
    MS_ATTRIBUTE_ACCT_AUTH_TYPE = 4134
    MS_ATTRIBUTE_ACCT_EAP_TYPE = 4135
    IAS_ATTRIBUTE_PACKET_TYPE = 4136
    IAS_ATTRIBUTE_AUTH_PROVIDER_NAME = 4137
    IAS_ATTRIBUTE_ACCT_PROVIDER_TYPE = 4138
    IAS_ATTRIBUTE_ACCT_PROVIDER_NAME = 4139
    MS_ATTRIBUTE_MPPE_SEND_KEY = 4140
    MS_ATTRIBUTE_MPPE_RECV_KEY = 4141
    IAS_ATTRIBUTE_REASON_CODE = 4142
    MS_ATTRIBUTE_FILTER = 4143
    MS_ATTRIBUTE_CHAP2_RESPONSE = 4144
    MS_ATTRIBUTE_CHAP2_SUCCESS = 4145
    MS_ATTRIBUTE_CHAP2_CPW = 4146
    MS_ATTRIBUTE_RAS_VENDOR = 4147
    MS_ATTRIBUTE_RAS_VERSION = 4148
    IAS_ATTRIBUTE_NP_NAME = 4149
    MS_ATTRIBUTE_PRIMARY_DNS_SERVER = 4150
    MS_ATTRIBUTE_SECONDARY_DNS_SERVER = 4151
    MS_ATTRIBUTE_PRIMARY_NBNS_SERVER = 4152
    MS_ATTRIBUTE_SECONDARY_NBNS_SERVER = 4153
    IAS_ATTRIBUTE_PROXY_POLICY_NAME = 4154
    IAS_ATTRIBUTE_PROVIDER_TYPE = 4155
    IAS_ATTRIBUTE_PROVIDER_NAME = 4156
    IAS_ATTRIBUTE_REMOTE_SERVER_ADDRESS = 4157
    IAS_ATTRIBUTE_GENERATE_CLASS_ATTRIBUTE = 4158
    MS_ATTRIBUTE_RAS_CLIENT_NAME = 4159
    MS_ATTRIBUTE_RAS_CLIENT_VERSION = 4160
    IAS_ATTRIBUTE_ALLOWED_CERTIFICATE_EKU = 4161
    IAS_ATTRIBUTE_EXTENSION_STATE = 4162
    IAS_ATTRIBUTE_GENERATE_SESSION_TIMEOUT = 4163
    IAS_ATTRIBUTE_SESSION_TIMEOUT = 4164
    MS_ATTRIBUTE_QUARANTINE_IPFILTER = 4165
    MS_ATTRIBUTE_QUARANTINE_SESSION_TIMEOUT = 4166
    MS_ATTRIBUTE_USER_SECURITY_IDENTITY = 4167
    IAS_ATTRIBUTE_REMOTE_RADIUS_TO_WINDOWS_USER_MAPPING = 4168
    IAS_ATTRIBUTE_PASSPORT_USER_MAPPING_UPN_SUFFIX = 4169
    IAS_ATTRIBUTE_TUNNEL_TAG = 4170
    IAS_ATTRIBUTE_NP_PEAPUPFRONT_ENABLED = 4171
    IAS_ATTRIBUTE_CERTIFICATE_EKU = 8097
    IAS_ATTRIBUTE_EAP_CONFIG = 8098
    IAS_ATTRIBUTE_PEAP_EMBEDDED_EAP_TYPEID = 8099
    IAS_ATTRIBUTE_PEAP_FAST_ROAMED_SESSION = 8100
    IAS_ATTRIBUTE_EAP_TYPEID = 8101
    MS_ATTRIBUTE_EAP_TLV = 8102
    IAS_ATTRIBUTE_REJECT_REASON_CODE = 8103
    IAS_ATTRIBUTE_PROXY_EAP_CONFIG = 8104
    IAS_ATTRIBUTE_EAP_SESSION = 8105
    IAS_ATTRIBUTE_IS_REPLAY = 8106
    IAS_ATTRIBUTE_CLEAR_TEXT_PASSWORD = 8107
    MS_ATTRIBUTE_IDENTITY_TYPE = 8108
    MS_ATTRIBUTE_SERVICE_CLASS = 8109
    MS_ATTRIBUTE_QUARANTINE_USER_CLASS = 8110
    MS_ATTRIBUTE_QUARANTINE_STATE = 8111
    IAS_ATTRIBUTE_OVERRIDE_RAP_AUTH = 8112
    IAS_ATTRIBUTE_PEAP_CHANNEL_UP = 8113
    IAS_ATTRIBUTE_NAME_MAPPED = 8114
    IAS_ATTRIBUTE_POLICY_ENFORCED = 8115
    IAS_ATTRIBUTE_MACHINE_NTGROUPS = 8116
    IAS_ATTRIBUTE_USER_NTGROUPS = 8117
    IAS_ATTRIBUTE_MACHINE_TOKEN_GROUPS = 8118
    IAS_ATTRIBUTE_USER_TOKEN_GROUPS = 8119
    MS_ATTRIBUTE_QUARANTINE_GRACE_TIME = 8120
    IAS_ATTRIBUTE_QUARANTINE_URL = 8121
    IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS = 8122
    MS_ATTRIBUTE_NOT_QUARANTINE_CAPABLE = 8123
    IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_RESULT = 8124
    IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_VALIDATORS = 8125
    IAS_ATTRIBUTE_MACHINE_NAME = 8126
    IAS_ATTRIBUTE_NT4_MACHINE_NAME = 8127
    IAS_ATTRIBUTE_QUARANTINE_SESSION_HANDLE = 8128
    IAS_ATTRIBUTE_FULLY_QUALIFIED_MACHINE_NAME = 8129
    IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS_CONFIGURATION = 8130
    IAS_ATTRIBUTE_CLIENT_QUARANTINE_COMPATIBLE = 8131
    MS_ATTRIBUTE_NETWORK_ACCESS_SERVER_TYPE = 8132
    IAS_ATTRIBUTE_QUARANTINE_SESSION_ID = 8133
    MS_ATTRIBUTE_AFW_QUARANTINE_ZONE = 8134
    MS_ATTRIBUTE_AFW_PROTECTION_LEVEL = 8135
    IAS_ATTRIBUTE_QUARANTINE_UPDATE_NON_COMPLIANT = 8136
    IAS_ATTRIBUTE_REQUEST_START_TIME = 8137
    MS_ATTRIBUTE_MACHINE_NAME = 8138
    IAS_ATTRIBUTE_CLIENT_IPv6_ADDRESS = 8139
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_INTERFACE_ID = 8140
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_PREFIX = 8141
    IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_ROUTE = 8142
    MS_ATTRIBUTE_QUARANTINE_GRACE_TIME_CONFIGURATION = 8143
    MS_ATTRIBUTE_IPv6_FILTER = 8144
    MS_ATTRIBUTE_IPV4_REMEDIATION_SERVERS = 8145
    MS_ATTRIBUTE_IPV6_REMEDIATION_SERVERS = 8146
    IAS_ATTRIBUTE_PROXY_RETRY_COUNT = 8147
    IAS_ATTRIBUTE_MACHINE_INVENTORY = 8148
    IAS_ATTRIBUTE_ABSOLUTE_TIME = 8149
    MS_ATTRIBUTE_QUARANTINE_SOH = 8150
    IAS_ATTRIBUTE_EAP_TYPES_CONFIGURED_IN_PROXYPOLICY = 8151
    MS_ATTRIBUTE_HCAP_LOCATION_GROUP_NAME = 8152
    MS_ATTRIBUTE_EXTENDED_QUARANTINE_STATE = 8153
    IAS_ATTRIBUTE_SOH_CARRIER_EAPTLV = 8154
    MS_ATTRIBUTE_HCAP_USER_GROUPS = 8155
    IAS_ATTRIBUTE_SAVED_MACHINE_HEALTHCHECK_ONLY = 8156
    IAS_ATTRIBUTE_POLICY_EVALUATED_SHV = 8157
    MS_ATTRIBUTE_RAS_CORRELATION_ID = 8158
    MS_ATTRIBUTE_HCAP_USER_NAME = 8159
    IAS_ATTRIBUTE_NT4_HCAP_ACCOUNT_NAME = 8160
    IAS_ATTRIBUTE_USER_TOKEN_SID = 8161
    IAS_ATTRIBUTE_MACHINE_TOKEN_SID = 8162
    IAS_ATTRIBUTE_MACHINE_VALIDATED = 8163
    MS_ATTRIBUTE_USER_IPv4_ADDRESS = 8164
    MS_ATTRIBUTE_USER_IPv6_ADDRESS = 8165
    MS_ATTRIBUTE_TSG_DEVICE_REDIRECTION = 8166
    IAS_ATTRIBUTE_ACCEPT_REASON_CODE = 8167
    IAS_ATTRIBUTE_LOGGING_RESULT = 8168
    IAS_ATTRIBUTE_SERVER_IP_ADDRESS = 8169
    IAS_ATTRIBUTE_SERVER_IPv6_ADDRESS = 8170
    IAS_ATTRIBUTE_RADIUS_USERNAME_ENCODING_ASCII = 8171
    MS_ATTRIBUTE_RAS_ROUTING_DOMAIN_ID = 8172
    IAS_ATTRIBUTE_CERTIFICATE_THUMBPRINT = 8250
    RAS_ATTRIBUTE_ENCRYPTION_TYPE = 4294967206
    RAS_ATTRIBUTE_ENCRYPTION_POLICY = 4294967207
    RAS_ATTRIBUTE_BAP_REQUIRED = 4294967208
    RAS_ATTRIBUTE_BAP_LINE_DOWN_TIME = 4294967209
    RAS_ATTRIBUTE_BAP_LINE_DOWN_LIMIT = 4294967210
  end

  enum NEW_LOG_FILE_FREQUENCY : Int32
    IAS_LOGGING_UNLIMITED_SIZE = 0
    IAS_LOGGING_DAILY = 1
    IAS_LOGGING_WEEKLY = 2
    IAS_LOGGING_MONTHLY = 3
    IAS_LOGGING_WHEN_FILE_SIZE_REACHES = 4
  end

  enum AUTHENTICATION_TYPE : Int32
    IAS_AUTH_INVALID = 0
    IAS_AUTH_PAP = 1
    IAS_AUTH_MD5CHAP = 2
    IAS_AUTH_MSCHAP = 3
    IAS_AUTH_MSCHAP2 = 4
    IAS_AUTH_EAP = 5
    IAS_AUTH_ARAP = 6
    IAS_AUTH_NONE = 7
    IAS_AUTH_CUSTOM = 8
    IAS_AUTH_MSCHAP_CPW = 9
    IAS_AUTH_MSCHAP2_CPW = 10
    IAS_AUTH_PEAP = 11
  end

  enum IDENTITY_TYPE : Int32
    IAS_IDENTITY_NO_DEFAULT = 1
  end

  enum ATTRIBUTESYNTAX : Int32
    IAS_SYNTAX_BOOLEAN = 1
    IAS_SYNTAX_INTEGER = 2
    IAS_SYNTAX_ENUMERATOR = 3
    IAS_SYNTAX_INETADDR = 4
    IAS_SYNTAX_STRING = 5
    IAS_SYNTAX_OCTETSTRING = 6
    IAS_SYNTAX_UTCTIME = 7
    IAS_SYNTAX_PROVIDERSPECIFIC = 8
    IAS_SYNTAX_UNSIGNEDINTEGER = 9
    IAS_SYNTAX_INETADDR6 = 10
  end

  enum ATTRIBUTERESTRICTIONS : Int32
    MULTIVALUED = 1
    ALLOWEDINPROFILE = 2
    ALLOWEDINCONDITION = 4
    ALLOWEDINPROXYPROFILE = 8
    ALLOWEDINPROXYCONDITION = 16
    ALLOWEDINVPNDIALUP = 32
    ALLOWEDIN8021X = 64
  end

  enum ATTRIBUTEFILTER : Int32
    ATTRIBUTE_FILTER_NONE = 0
    ATTRIBUTE_FILTER_VPN_DIALUP = 1
    ATTRIBUTE_FILTER_IEEE_802_1x = 2
  end

  enum ATTRIBUTEINFO : Int32
    NAME = 1
    SYNTAX = 2
    RESTRICTIONS = 3
    DESCRIPTION = 4
    VENDORID = 5
    LDAPNAME = 6
    VENDORTYPE = 7
  end

  enum IASCOMMONPROPERTIES : Int32
    PROPERTY_SDO_RESERVED = 0
    PROPERTY_SDO_CLASS = 1
    PROPERTY_SDO_NAME = 2
    PROPERTY_SDO_DESCRIPTION = 3
    PROPERTY_SDO_ID = 4
    PROPERTY_SDO_DATASTORE_NAME = 5
    PROPERTY_SDO_TEMPLATE_GUID = 6
    PROPERTY_SDO_OPAQUE = 7
    PROPERTY_SDO_START = 1024
  end

  enum USERPROPERTIES : Int32
    PROPERTY_USER_CALLING_STATION_ID = 1024
    PROPERTY_USER_SAVED_CALLING_STATION_ID = 1025
    PROPERTY_USER_RADIUS_CALLBACK_NUMBER = 1026
    PROPERTY_USER_RADIUS_FRAMED_ROUTE = 1027
    PROPERTY_USER_RADIUS_FRAMED_IP_ADDRESS = 1028
    PROPERTY_USER_SAVED_RADIUS_CALLBACK_NUMBER = 1029
    PROPERTY_USER_SAVED_RADIUS_FRAMED_ROUTE = 1030
    PROPERTY_USER_SAVED_RADIUS_FRAMED_IP_ADDRESS = 1031
    PROPERTY_USER_ALLOW_DIALIN = 1032
    PROPERTY_USER_SERVICE_TYPE = 1033
    PROPERTY_USER_RADIUS_FRAMED_IPV6_ROUTE = 1034
    PROPERTY_USER_SAVED_RADIUS_FRAMED_IPV6_ROUTE = 1035
    PROPERTY_USER_RADIUS_FRAMED_INTERFACE_ID = 1036
    PROPERTY_USER_SAVED_RADIUS_FRAMED_INTERFACE_ID = 1037
    PROPERTY_USER_RADIUS_FRAMED_IPV6_PREFIX = 1038
    PROPERTY_USER_SAVED_RADIUS_FRAMED_IPV6_PREFIX = 1039
  end

  enum DICTIONARYPROPERTIES : Int32
    PROPERTY_DICTIONARY_ATTRIBUTES_COLLECTION = 1024
    PROPERTY_DICTIONARY_LOCATION = 1025
  end

  enum ATTRIBUTEPROPERTIES : Int32
    PROPERTY_ATTRIBUTE_ID = 1024
    PROPERTY_ATTRIBUTE_VENDOR_ID = 1025
    PROPERTY_ATTRIBUTE_VENDOR_TYPE_ID = 1026
    PROPERTY_ATTRIBUTE_IS_ENUMERABLE = 1027
    PROPERTY_ATTRIBUTE_ENUM_NAMES = 1028
    PROPERTY_ATTRIBUTE_ENUM_VALUES = 1029
    PROPERTY_ATTRIBUTE_SYNTAX = 1030
    PROPERTY_ATTRIBUTE_ALLOW_MULTIPLE = 1031
    PROPERTY_ATTRIBUTE_ALLOW_LOG_ORDINAL = 1032
    PROPERTY_ATTRIBUTE_ALLOW_IN_PROFILE = 1033
    PROPERTY_ATTRIBUTE_ALLOW_IN_CONDITION = 1034
    PROPERTY_ATTRIBUTE_DISPLAY_NAME = 1035
    PROPERTY_ATTRIBUTE_VALUE = 1036
    PROPERTY_ATTRIBUTE_ALLOW_IN_PROXY_PROFILE = 1037
    PROPERTY_ATTRIBUTE_ALLOW_IN_PROXY_CONDITION = 1038
    PROPERTY_ATTRIBUTE_ALLOW_IN_VPNDIALUP = 1039
    PROPERTY_ATTRIBUTE_ALLOW_IN_8021X = 1040
    PROPERTY_ATTRIBUTE_ENUM_FILTERS = 1041
  end

  enum IASPROPERTIES : Int32
    PROPERTY_IAS_RADIUSSERVERGROUPS_COLLECTION = 1024
    PROPERTY_IAS_POLICIES_COLLECTION = 1025
    PROPERTY_IAS_PROFILES_COLLECTION = 1026
    PROPERTY_IAS_PROTOCOLS_COLLECTION = 1027
    PROPERTY_IAS_AUDITORS_COLLECTION = 1028
    PROPERTY_IAS_REQUESTHANDLERS_COLLECTION = 1029
    PROPERTY_IAS_PROXYPOLICIES_COLLECTION = 1030
    PROPERTY_IAS_PROXYPROFILES_COLLECTION = 1031
    PROPERTY_IAS_REMEDIATIONSERVERGROUPS_COLLECTION = 1032
    PROPERTY_IAS_SHVTEMPLATES_COLLECTION = 1033
  end

  enum TEMPLATESPROPERTIES : Int32
    PROPERTY_TEMPLATES_POLICIES_TEMPLATES = 1024
    PROPERTY_TEMPLATES_PROFILES_TEMPLATES = 1025
    PROPERTY_TEMPLATES_PROFILES_COLLECTION = 1026
    PROPERTY_TEMPLATES_PROXYPOLICIES_TEMPLATES = 1027
    PROPERTY_TEMPLATES_PROXYPROFILES_TEMPLATES = 1028
    PROPERTY_TEMPLATES_PROXYPROFILES_COLLECTION = 1029
    PROPERTY_TEMPLATES_REMEDIATIONSERVERGROUPS_TEMPLATES = 1030
    PROPERTY_TEMPLATES_SHVTEMPLATES_TEMPLATES = 1031
    PROPERTY_TEMPLATES_CLIENTS_TEMPLATES = 1032
    PROPERTY_TEMPLATES_RADIUSSERVERS_TEMPLATES = 1033
    PROPERTY_TEMPLATES_SHAREDSECRETS_TEMPLATES = 1034
    PROPERTY_TEMPLATES_IPFILTERS_TEMPLATES = 1035
  end

  enum CLIENTPROPERTIES : Int32
    PROPERTY_CLIENT_REQUIRE_SIGNATURE = 1024
    PROPERTY_CLIENT_UNUSED = 1025
    PROPERTY_CLIENT_SHARED_SECRET = 1026
    PROPERTY_CLIENT_NAS_MANUFACTURER = 1027
    PROPERTY_CLIENT_ADDRESS = 1028
    PROPERTY_CLIENT_QUARANTINE_COMPATIBLE = 1029
    PROPERTY_CLIENT_ENABLED = 1030
    PROPERTY_CLIENT_SECRET_TEMPLATE_GUID = 1031
  end

  enum VENDORPROPERTIES : Int32
    PROPERTY_NAS_VENDOR_ID = 1024
  end

  enum PROFILEPROPERTIES : Int32
    PROPERTY_PROFILE_ATTRIBUTES_COLLECTION = 1024
    PROPERTY_PROFILE_IPFILTER_TEMPLATE_GUID = 1025
  end

  enum POLICYPROPERTIES : Int32
    PROPERTY_POLICY_CONSTRAINT = 1024
    PROPERTY_POLICY_MERIT = 1025
    PROPERTY_POLICY_UNUSED0 = 1026
    PROPERTY_POLICY_UNUSED1 = 1027
    PROPERTY_POLICY_PROFILE_NAME = 1028
    PROPERTY_POLICY_ACTION = 1029
    PROPERTY_POLICY_CONDITIONS_COLLECTION = 1030
    PROPERTY_POLICY_ENABLED = 1031
    PROPERTY_POLICY_SOURCETAG = 1032
  end

  enum CONDITIONPROPERTIES : Int32
    PROPERTY_CONDITION_TEXT = 1024
  end

  enum RADIUSSERVERGROUPPROPERTIES : Int32
    PROPERTY_RADIUSSERVERGROUP_SERVERS_COLLECTION = 1024
  end

  enum RADIUSSERVERPROPERTIES : Int32
    PROPERTY_RADIUSSERVER_AUTH_PORT = 1024
    PROPERTY_RADIUSSERVER_AUTH_SECRET = 1025
    PROPERTY_RADIUSSERVER_ACCT_PORT = 1026
    PROPERTY_RADIUSSERVER_ACCT_SECRET = 1027
    PROPERTY_RADIUSSERVER_ADDRESS = 1028
    PROPERTY_RADIUSSERVER_FORWARD_ACCT_ONOFF = 1029
    PROPERTY_RADIUSSERVER_PRIORITY = 1030
    PROPERTY_RADIUSSERVER_WEIGHT = 1031
    PROPERTY_RADIUSSERVER_TIMEOUT = 1032
    PROPERTY_RADIUSSERVER_MAX_LOST = 1033
    PROPERTY_RADIUSSERVER_BLACKOUT = 1034
    PROPERTY_RADIUSSERVER_SEND_SIGNATURE = 1035
    PROPERTY_RADIUSSERVER_AUTH_SECRET_TEMPLATE_GUID = 1036
    PROPERTY_RADIUSSERVER_ACCT_SECRET_TEMPLATE_GUID = 1037
  end

  enum REMEDIATIONSERVERGROUPPROPERTIES : Int32
    PROPERTY_REMEDIATIONSERVERGROUP_SERVERS_COLLECTION = 1024
  end

  enum REMEDIATIONSERVERPROPERTIES : Int32
    PROPERTY_REMEDIATIONSERVER_ADDRESS = 1024
    PROPERTY_REMEDIATIONSERVER_FRIENDLY_NAME = 1025
  end

  enum SHVTEMPLATEPROPERTIES : Int32
    PROPERTY_SHV_COMBINATION_TYPE = 1024
    PROPERTY_SHV_LIST = 1025
    PROPERTY_SHVCONFIG_LIST = 1026
  end

  enum IPFILTERPROPERTIES : Int32
    PROPERTY_IPFILTER_ATTRIBUTES_COLLECTION = 1024
  end

  enum SHAREDSECRETPROPERTIES : Int32
    PROPERTY_SHAREDSECRET_STRING = 1024
  end

  enum IASCOMPONENTPROPERTIES : Int32
    PROPERTY_COMPONENT_ID = 1024
    PROPERTY_COMPONENT_PROG_ID = 1025
    PROPERTY_COMPONENT_START = 1026
  end

  enum PROTOCOLPROPERTIES : Int32
    PROPERTY_PROTOCOL_REQUEST_HANDLER = 1026
    PROPERTY_PROTOCOL_START = 1027
  end

  enum RADIUSPROPERTIES : Int32
    PROPERTY_RADIUS_ACCOUNTING_PORT = 1027
    PROPERTY_RADIUS_AUTHENTICATION_PORT = 1028
    PROPERTY_RADIUS_CLIENTS_COLLECTION = 1029
    PROPERTY_RADIUS_VENDORS_COLLECTION = 1030
  end

  enum NTEVENTLOGPROPERTIES : Int32
    PROPERTY_EVENTLOG_LOG_APPLICATION_EVENTS = 1026
    PROPERTY_EVENTLOG_LOG_MALFORMED = 1027
    PROPERTY_EVENTLOG_LOG_DEBUG = 1028
  end

  enum NAMESPROPERTIES : Int32
    PROPERTY_NAMES_REALMS = 1026
  end

  enum NTSAMPROPERTIES : Int32
    PROPERTY_NTSAM_ALLOW_LM_AUTHENTICATION = 1026
  end

  enum ACCOUNTINGPROPERTIES : Int32
    PROPERTY_ACCOUNTING_LOG_ACCOUNTING = 1026
    PROPERTY_ACCOUNTING_LOG_ACCOUNTING_INTERIM = 1027
    PROPERTY_ACCOUNTING_LOG_AUTHENTICATION = 1028
    PROPERTY_ACCOUNTING_LOG_OPEN_NEW_FREQUENCY = 1029
    PROPERTY_ACCOUNTING_LOG_OPEN_NEW_SIZE = 1030
    PROPERTY_ACCOUNTING_LOG_FILE_DIRECTORY = 1031
    PROPERTY_ACCOUNTING_LOG_IAS1_FORMAT = 1032
    PROPERTY_ACCOUNTING_LOG_ENABLE_LOGGING = 1033
    PROPERTY_ACCOUNTING_LOG_DELETE_IF_FULL = 1034
    PROPERTY_ACCOUNTING_SQL_MAX_SESSIONS = 1035
    PROPERTY_ACCOUNTING_LOG_AUTHENTICATION_INTERIM = 1036
    PROPERTY_ACCOUNTING_LOG_FILE_IS_BACKUP = 1037
    PROPERTY_ACCOUNTING_DISCARD_REQUEST_ON_FAILURE = 1038
  end

  enum NAPPROPERTIES : Int32
    PROPERTY_NAP_POLICIES_COLLECTION = 1026
    PROPERTY_SHV_TEMPLATES_COLLECTION = 1027
  end

  enum RADIUSPROXYPROPERTIES : Int32
    PROPERTY_RADIUSPROXY_SERVERGROUPS = 1026
  end

  enum REMEDIATIONSERVERSPROPERTIES : Int32
    PROPERTY_REMEDIATIONSERVERS_SERVERGROUPS = 1026
  end

  enum SHV_COMBINATION_TYPE : Int32
    SHV_COMBINATION_TYPE_ALL_PASS = 0
    SHV_COMBINATION_TYPE_ALL_FAIL = 1
    SHV_COMBINATION_TYPE_ONE_OR_MORE_PASS = 2
    SHV_COMBINATION_TYPE_ONE_OR_MORE_FAIL = 3
    SHV_COMBINATION_TYPE_ONE_OR_MORE_INFECTED = 4
    SHV_COMBINATION_TYPE_ONE_OR_MORE_TRANSITIONAL = 5
    SHV_COMBINATION_TYPE_ONE_OR_MORE_UNKNOWN = 6
    SHV_COMBINATION_TYPE_MAX = 7
  end

  enum SERVICE_TYPE : Int32
    SERVICE_TYPE_IAS = 0
    SERVICE_TYPE_RAS = 1
    SERVICE_TYPE_RAMGMTSVC = 2
    SERVICE_TYPE_MAX = 3
  end

  enum IASOSTYPE : Int32
    SYSTEM_TYPE_NT4_WORKSTATION = 0
    SYSTEM_TYPE_NT5_WORKSTATION = 1
    SYSTEM_TYPE_NT6_WORKSTATION = 2
    SYSTEM_TYPE_NT6_1_WORKSTATION = 3
    SYSTEM_TYPE_NT6_2_WORKSTATION = 4
    SYSTEM_TYPE_NT6_3_WORKSTATION = 5
    SYSTEM_TYPE_NT10_0_WORKSTATION = 6
    SYSTEM_TYPE_NT4_SERVER = 7
    SYSTEM_TYPE_NT5_SERVER = 8
    SYSTEM_TYPE_NT6_SERVER = 9
    SYSTEM_TYPE_NT6_1_SERVER = 10
    SYSTEM_TYPE_NT6_2_SERVER = 11
    SYSTEM_TYPE_NT6_3_SERVER = 12
    SYSTEM_TYPE_NT10_0_SERVER = 13
  end

  enum IASDOMAINTYPE : Int32
    DOMAIN_TYPE_NONE = 0
    DOMAIN_TYPE_NT4 = 1
    DOMAIN_TYPE_NT5 = 2
    DOMAIN_TYPE_MIXED = 3
  end

  enum IASDATASTORE : Int32
    DATA_STORE_LOCAL = 0
    DATA_STORE_DIRECTORY = 1
  end

  enum RADIUS_ATTRIBUTE_TYPE : Int32
    Ratminimum = 0
    Ratusername = 1
    Ratuserpassword = 2
    Ratchappassword = 3
    Ratnasipaddress = 4
    Ratnasport = 5
    Ratservicetype = 6
    Ratframedprotocol = 7
    Ratframedipaddress = 8
    Ratframedipnetmask = 9
    Ratframedrouting = 10
    Ratfilterid = 11
    Ratframedmtu = 12
    Ratframedcompression = 13
    Ratloginiphost = 14
    Ratloginservice = 15
    Ratloginport = 16
    Ratreplymessage = 18
    Ratcallbacknumber = 19
    Ratcallbackid = 20
    Ratframedroute = 22
    Ratframedipxnetwork = 23
    Ratstate = 24
    Ratclass = 25
    Ratvendorspecific = 26
    Ratsessiontimeout = 27
    Ratidletimeout = 28
    Ratterminationaction = 29
    Ratcalledstationid = 30
    Ratcallingstationid = 31
    Ratnasidentifier = 32
    Ratproxystate = 33
    Ratloginlatservice = 34
    Ratloginlatnode = 35
    Ratloginlatgroup = 36
    Ratframedappletalklink = 37
    Ratframedappletalknetwork = 38
    Ratframedappletalkzone = 39
    Ratacctstatustype = 40
    Ratacctdelaytime = 41
    Ratacctinputoctets = 42
    Ratacctoutputoctets = 43
    Ratacctsessionid = 44
    Ratacctauthentic = 45
    Ratacctsessiontime = 46
    Ratacctinputpackets = 47
    Ratacctoutputpackets = 48
    Ratacctterminationcause = 49
    Ratchapchallenge = 60
    Ratnasporttype = 61
    Ratportlimit = 62
    Rattunneltype = 64
    Ratmediumtype = 65
    Rattunnelpassword = 69
    Rattunnelprivategroupid = 81
    Ratnasipv6address = 95
    Ratframedinterfaceid = 96
    Ratframedipv6prefix = 97
    Ratloginipv6host = 98
    Ratframedipv6route = 99
    Ratframedipv6pool = 100
    Ratcode = 262
    Ratidentifier = 263
    Ratauthenticator = 264
    Ratsrcipaddress = 265
    Ratsrcport = 266
    Ratprovider = 267
    Ratstrippedusername = 268
    Ratfqusername = 269
    Ratpolicyname = 270
    Ratuniqueid = 271
    Ratextensionstate = 272
    Rateaptlv = 273
    Ratrejectreasoncode = 274
    Ratcrppolicyname = 275
    Ratprovidername = 276
    Ratcleartextpassword = 277
    Ratsrcipv6address = 278
    Ratcertificatethumbprint = 279
  end

  enum RADIUS_CODE : Int32
    Rcunknown = 0
    Rcaccessrequest = 1
    Rcaccessaccept = 2
    Rcaccessreject = 3
    Rcaccountingrequest = 4
    Rcaccountingresponse = 5
    Rcaccesschallenge = 11
    Rcdiscard = 256
  end

  enum RADIUS_AUTHENTICATION_PROVIDER : Int32
    Rapunknown = 0
    Rapusersfile = 1
    Rapproxy = 2
    Rapwindowsnt = 3
    Rapmcis = 4
    Rapodbc = 5
    Rapnone = 6
  end

  enum RADIUS_REJECT_REASON_CODE : Int32
    Rrrcundefined = 0
    Rrrcaccountunknown = 1
    Rrrcaccountdisabled = 2
    Rrrcaccountexpired = 3
    Rrrcauthenticationfailure = 4
  end

  enum RADIUS_DATA_TYPE : Int32
    Rdtunknown = 0
    Rdtstring = 1
    Rdtaddress = 2
    Rdtinteger = 3
    Rdttime = 4
    Rdtipv6address = 5
  end

  enum RADIUS_ACTION : Int32
    Racontinue = 0
    Rareject = 1
    Raaccept = 2
  end

  enum RADIUS_EXTENSION_POINT : Int32
    Repauthentication = 0
    Repauthorization = 1
  end

  union RADIUS_ATTRIBUTE_Anonymous_e__Union
    dw_value : UInt32
    lp_value : UInt8*
  end

  struct RADIUS_ATTRIBUTE
    dw_attr_type : UInt32
    f_data_type : RADIUS_DATA_TYPE
    cb_data_length : UInt32
    anonymous : RADIUS_ATTRIBUTE_Anonymous_e__Union
  end
  struct RADIUS_VSA_FORMAT
    vendor_id : UInt8[4]*
    vendor_type : UInt8
    vendor_length : UInt8
    attribute_specific : UInt8[0]*
  end
  struct RADIUS_ATTRIBUTE_ARRAY
    cb_size : UInt32
    add : LibC::IntPtrT
    attribute_at : RADIUS_ATTRIBUTE**********
    get_size : LibC::IntPtrT
    insert_at : LibC::IntPtrT
    remove_at : LibC::IntPtrT
    set_at : LibC::IntPtrT
  end
  struct RADIUS_EXTENSION_CONTROL_BLOCK
    cb_size : UInt32
    dw_version : UInt32
    rep_point : RADIUS_EXTENSION_POINT
    rc_request_type : RADIUS_CODE
    rc_response_type : RADIUS_CODE
    get_request : LibC::IntPtrT
    get_response : LibC::IntPtrT
    set_response_type : LibC::IntPtrT
  end


  struct ISdoMachineVTbl
    query_interface : Proc(ISdoMachine*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISdoMachine*, UInt32)
    release : Proc(ISdoMachine*, UInt32)
    get_type_info_count : Proc(ISdoMachine*, UInt32*, HRESULT)
    get_type_info : Proc(ISdoMachine*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISdoMachine*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISdoMachine*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    attach : Proc(ISdoMachine*, UInt8*, HRESULT)
    get_dictionary_sdo : Proc(ISdoMachine*, IUnknown*, HRESULT)
    get_service_sdo : Proc(ISdoMachine*, IASDATASTORE, UInt8*, IUnknown*, HRESULT)
    get_user_sdo : Proc(ISdoMachine*, IASDATASTORE, UInt8*, IUnknown*, HRESULT)
    get_os_type : Proc(ISdoMachine*, IASOSTYPE*, HRESULT)
    get_domain_type : Proc(ISdoMachine*, IASDOMAINTYPE*, HRESULT)
    is_directory_available : Proc(ISdoMachine*, Int16*, HRESULT)
    get_attached_computer : Proc(ISdoMachine*, UInt8**, HRESULT)
    get_sdo_schema : Proc(ISdoMachine*, IUnknown*, HRESULT)
  end

  ISdoMachine_GUID = "479f6e75-49a2-11d2-8eca-00c04fc2f519"
  IID_ISdoMachine = LibC::GUID.new(0x479f6e75_u32, 0x49a2_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0xca_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf5_u8, 0x19_u8])
  struct ISdoMachine
    lpVtbl : ISdoMachineVTbl*
  end

  struct ISdoMachine2VTbl
    query_interface : Proc(ISdoMachine2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISdoMachine2*, UInt32)
    release : Proc(ISdoMachine2*, UInt32)
    get_type_info_count : Proc(ISdoMachine2*, UInt32*, HRESULT)
    get_type_info : Proc(ISdoMachine2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISdoMachine2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISdoMachine2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    attach : Proc(ISdoMachine2*, UInt8*, HRESULT)
    get_dictionary_sdo : Proc(ISdoMachine2*, IUnknown*, HRESULT)
    get_service_sdo : Proc(ISdoMachine2*, IASDATASTORE, UInt8*, IUnknown*, HRESULT)
    get_user_sdo : Proc(ISdoMachine2*, IASDATASTORE, UInt8*, IUnknown*, HRESULT)
    get_os_type : Proc(ISdoMachine2*, IASOSTYPE*, HRESULT)
    get_domain_type : Proc(ISdoMachine2*, IASDOMAINTYPE*, HRESULT)
    is_directory_available : Proc(ISdoMachine2*, Int16*, HRESULT)
    get_attached_computer : Proc(ISdoMachine2*, UInt8**, HRESULT)
    get_sdo_schema : Proc(ISdoMachine2*, IUnknown*, HRESULT)
    get_templates_sdo : Proc(ISdoMachine2*, UInt8*, IUnknown*, HRESULT)
    enable_templates : Proc(ISdoMachine2*, HRESULT)
    sync_config_against_templates : Proc(ISdoMachine2*, UInt8*, IUnknown*, IUnknown*, Int16, HRESULT)
    import_remote_templates : Proc(ISdoMachine2*, IUnknown, UInt8*, HRESULT)
    reload : Proc(ISdoMachine2*, HRESULT)
  end

  ISdoMachine2_GUID = "518e5ffe-d8ce-4f7e-a5db-b40a35419d3b"
  IID_ISdoMachine2 = LibC::GUID.new(0x518e5ffe_u32, 0xd8ce_u16, 0x4f7e_u16, StaticArray[0xa5_u8, 0xdb_u8, 0xb4_u8, 0xa_u8, 0x35_u8, 0x41_u8, 0x9d_u8, 0x3b_u8])
  struct ISdoMachine2
    lpVtbl : ISdoMachine2VTbl*
  end

  struct ISdoServiceControlVTbl
    query_interface : Proc(ISdoServiceControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISdoServiceControl*, UInt32)
    release : Proc(ISdoServiceControl*, UInt32)
    get_type_info_count : Proc(ISdoServiceControl*, UInt32*, HRESULT)
    get_type_info : Proc(ISdoServiceControl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISdoServiceControl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISdoServiceControl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    start_service : Proc(ISdoServiceControl*, HRESULT)
    stop_service : Proc(ISdoServiceControl*, HRESULT)
    get_service_status : Proc(ISdoServiceControl*, Int32*, HRESULT)
    reset_service : Proc(ISdoServiceControl*, HRESULT)
  end

  ISdoServiceControl_GUID = "479f6e74-49a2-11d2-8eca-00c04fc2f519"
  IID_ISdoServiceControl = LibC::GUID.new(0x479f6e74_u32, 0x49a2_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0xca_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf5_u8, 0x19_u8])
  struct ISdoServiceControl
    lpVtbl : ISdoServiceControlVTbl*
  end

  struct ISdoVTbl
    query_interface : Proc(ISdo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISdo*, UInt32)
    release : Proc(ISdo*, UInt32)
    get_type_info_count : Proc(ISdo*, UInt32*, HRESULT)
    get_type_info : Proc(ISdo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISdo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISdo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_property_info : Proc(ISdo*, Int32, IUnknown*, HRESULT)
    get_property : Proc(ISdo*, Int32, VARIANT*, HRESULT)
    put_property : Proc(ISdo*, Int32, VARIANT*, HRESULT)
    reset_property : Proc(ISdo*, Int32, HRESULT)
    apply : Proc(ISdo*, HRESULT)
    restore : Proc(ISdo*, HRESULT)
    get__new_enum : Proc(ISdo*, IUnknown*, HRESULT)
  end

  ISdo_GUID = "56bc53de-96db-11d1-bf3f-000000000000"
  IID_ISdo = LibC::GUID.new(0x56bc53de_u32, 0x96db_u16, 0x11d1_u16, StaticArray[0xbf_u8, 0x3f_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
  struct ISdo
    lpVtbl : ISdoVTbl*
  end

  struct ISdoCollectionVTbl
    query_interface : Proc(ISdoCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISdoCollection*, UInt32)
    release : Proc(ISdoCollection*, UInt32)
    get_type_info_count : Proc(ISdoCollection*, UInt32*, HRESULT)
    get_type_info : Proc(ISdoCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISdoCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISdoCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISdoCollection*, Int32*, HRESULT)
    add : Proc(ISdoCollection*, UInt8*, IDispatch*, HRESULT)
    remove : Proc(ISdoCollection*, IDispatch, HRESULT)
    remove_all : Proc(ISdoCollection*, HRESULT)
    reload : Proc(ISdoCollection*, HRESULT)
    is_name_unique : Proc(ISdoCollection*, UInt8*, Int16*, HRESULT)
    item : Proc(ISdoCollection*, VARIANT*, IDispatch*, HRESULT)
    get__new_enum : Proc(ISdoCollection*, IUnknown*, HRESULT)
  end

  ISdoCollection_GUID = "56bc53e2-96db-11d1-bf3f-000000000000"
  IID_ISdoCollection = LibC::GUID.new(0x56bc53e2_u32, 0x96db_u16, 0x11d1_u16, StaticArray[0xbf_u8, 0x3f_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
  struct ISdoCollection
    lpVtbl : ISdoCollectionVTbl*
  end

  struct ITemplateSdoVTbl
    query_interface : Proc(ITemplateSdo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITemplateSdo*, UInt32)
    release : Proc(ITemplateSdo*, UInt32)
    get_type_info_count : Proc(ITemplateSdo*, UInt32*, HRESULT)
    get_type_info : Proc(ITemplateSdo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITemplateSdo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITemplateSdo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_property_info : Proc(ITemplateSdo*, Int32, IUnknown*, HRESULT)
    get_property : Proc(ITemplateSdo*, Int32, VARIANT*, HRESULT)
    put_property : Proc(ITemplateSdo*, Int32, VARIANT*, HRESULT)
    reset_property : Proc(ITemplateSdo*, Int32, HRESULT)
    apply : Proc(ITemplateSdo*, HRESULT)
    restore : Proc(ITemplateSdo*, HRESULT)
    get__new_enum : Proc(ITemplateSdo*, IUnknown*, HRESULT)
    add_to_collection : Proc(ITemplateSdo*, UInt8*, IDispatch, IDispatch*, HRESULT)
    add_to_sdo : Proc(ITemplateSdo*, UInt8*, IDispatch, IDispatch*, HRESULT)
    add_to_sdo_as_property : Proc(ITemplateSdo*, IDispatch, Int32, HRESULT)
  end

  ITemplateSdo_GUID = "8aa85302-d2e2-4e20-8b1f-a571e437d6c9"
  IID_ITemplateSdo = LibC::GUID.new(0x8aa85302_u32, 0xd2e2_u16, 0x4e20_u16, StaticArray[0x8b_u8, 0x1f_u8, 0xa5_u8, 0x71_u8, 0xe4_u8, 0x37_u8, 0xd6_u8, 0xc9_u8])
  struct ITemplateSdo
    lpVtbl : ITemplateSdoVTbl*
  end

  struct ISdoDictionaryOldVTbl
    query_interface : Proc(ISdoDictionaryOld*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISdoDictionaryOld*, UInt32)
    release : Proc(ISdoDictionaryOld*, UInt32)
    get_type_info_count : Proc(ISdoDictionaryOld*, UInt32*, HRESULT)
    get_type_info : Proc(ISdoDictionaryOld*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISdoDictionaryOld*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISdoDictionaryOld*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    enum_attributes : Proc(ISdoDictionaryOld*, VARIANT*, VARIANT*, HRESULT)
    get_attribute_info : Proc(ISdoDictionaryOld*, ATTRIBUTEID, VARIANT*, VARIANT*, HRESULT)
    enum_attribute_values : Proc(ISdoDictionaryOld*, ATTRIBUTEID, VARIANT*, VARIANT*, HRESULT)
    create_attribute : Proc(ISdoDictionaryOld*, ATTRIBUTEID, IDispatch*, HRESULT)
    get_attribute_id : Proc(ISdoDictionaryOld*, UInt8*, ATTRIBUTEID*, HRESULT)
  end

  ISdoDictionaryOld_GUID = "d432e5f4-53d8-11d2-9a3a-00c04fb998ac"
  IID_ISdoDictionaryOld = LibC::GUID.new(0xd432e5f4_u32, 0x53d8_u16, 0x11d2_u16, StaticArray[0x9a_u8, 0x3a_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0xac_u8])
  struct ISdoDictionaryOld
    lpVtbl : ISdoDictionaryOldVTbl*
  end

end
struct LibWin32::ISdoMachine
  def query_interface(this : ISdoMachine*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISdoMachine*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISdoMachine*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISdoMachine*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISdoMachine*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISdoMachine*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISdoMachine*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def attach(this : ISdoMachine*, bstrcomputername : UInt8*) : HRESULT
    @lpVtbl.value.attach.call(this, bstrcomputername)
  end
  def get_dictionary_sdo(this : ISdoMachine*, ppdictionarysdo : IUnknown*) : HRESULT
    @lpVtbl.value.get_dictionary_sdo.call(this, ppdictionarysdo)
  end
  def get_service_sdo(this : ISdoMachine*, edatastore : IASDATASTORE, bstrservicename : UInt8*, ppservicesdo : IUnknown*) : HRESULT
    @lpVtbl.value.get_service_sdo.call(this, edatastore, bstrservicename, ppservicesdo)
  end
  def get_user_sdo(this : ISdoMachine*, edatastore : IASDATASTORE, bstrusername : UInt8*, ppusersdo : IUnknown*) : HRESULT
    @lpVtbl.value.get_user_sdo.call(this, edatastore, bstrusername, ppusersdo)
  end
  def get_os_type(this : ISdoMachine*, eostype : IASOSTYPE*) : HRESULT
    @lpVtbl.value.get_os_type.call(this, eostype)
  end
  def get_domain_type(this : ISdoMachine*, edomaintype : IASDOMAINTYPE*) : HRESULT
    @lpVtbl.value.get_domain_type.call(this, edomaintype)
  end
  def is_directory_available(this : ISdoMachine*, booldirectoryavailable : Int16*) : HRESULT
    @lpVtbl.value.is_directory_available.call(this, booldirectoryavailable)
  end
  def get_attached_computer(this : ISdoMachine*, bstrcomputername : UInt8**) : HRESULT
    @lpVtbl.value.get_attached_computer.call(this, bstrcomputername)
  end
  def get_sdo_schema(this : ISdoMachine*, ppsdoschema : IUnknown*) : HRESULT
    @lpVtbl.value.get_sdo_schema.call(this, ppsdoschema)
  end
end
struct LibWin32::ISdoMachine2
  def query_interface(this : ISdoMachine2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISdoMachine2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISdoMachine2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISdoMachine2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISdoMachine2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISdoMachine2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISdoMachine2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def attach(this : ISdoMachine2*, bstrcomputername : UInt8*) : HRESULT
    @lpVtbl.value.attach.call(this, bstrcomputername)
  end
  def get_dictionary_sdo(this : ISdoMachine2*, ppdictionarysdo : IUnknown*) : HRESULT
    @lpVtbl.value.get_dictionary_sdo.call(this, ppdictionarysdo)
  end
  def get_service_sdo(this : ISdoMachine2*, edatastore : IASDATASTORE, bstrservicename : UInt8*, ppservicesdo : IUnknown*) : HRESULT
    @lpVtbl.value.get_service_sdo.call(this, edatastore, bstrservicename, ppservicesdo)
  end
  def get_user_sdo(this : ISdoMachine2*, edatastore : IASDATASTORE, bstrusername : UInt8*, ppusersdo : IUnknown*) : HRESULT
    @lpVtbl.value.get_user_sdo.call(this, edatastore, bstrusername, ppusersdo)
  end
  def get_os_type(this : ISdoMachine2*, eostype : IASOSTYPE*) : HRESULT
    @lpVtbl.value.get_os_type.call(this, eostype)
  end
  def get_domain_type(this : ISdoMachine2*, edomaintype : IASDOMAINTYPE*) : HRESULT
    @lpVtbl.value.get_domain_type.call(this, edomaintype)
  end
  def is_directory_available(this : ISdoMachine2*, booldirectoryavailable : Int16*) : HRESULT
    @lpVtbl.value.is_directory_available.call(this, booldirectoryavailable)
  end
  def get_attached_computer(this : ISdoMachine2*, bstrcomputername : UInt8**) : HRESULT
    @lpVtbl.value.get_attached_computer.call(this, bstrcomputername)
  end
  def get_sdo_schema(this : ISdoMachine2*, ppsdoschema : IUnknown*) : HRESULT
    @lpVtbl.value.get_sdo_schema.call(this, ppsdoschema)
  end
  def get_templates_sdo(this : ISdoMachine2*, bstrservicename : UInt8*, pptemplatessdo : IUnknown*) : HRESULT
    @lpVtbl.value.get_templates_sdo.call(this, bstrservicename, pptemplatessdo)
  end
  def enable_templates(this : ISdoMachine2*) : HRESULT
    @lpVtbl.value.enable_templates.call(this)
  end
  def sync_config_against_templates(this : ISdoMachine2*, bstrservicename : UInt8*, ppconfigroot : IUnknown*, pptemplatesroot : IUnknown*, bforcedsync : Int16) : HRESULT
    @lpVtbl.value.sync_config_against_templates.call(this, bstrservicename, ppconfigroot, pptemplatesroot, bforcedsync)
  end
  def import_remote_templates(this : ISdoMachine2*, plocaltemplatesroot : IUnknown, bstrremotemachinename : UInt8*) : HRESULT
    @lpVtbl.value.import_remote_templates.call(this, plocaltemplatesroot, bstrremotemachinename)
  end
  def reload(this : ISdoMachine2*) : HRESULT
    @lpVtbl.value.reload.call(this)
  end
end
struct LibWin32::ISdoServiceControl
  def query_interface(this : ISdoServiceControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISdoServiceControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISdoServiceControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISdoServiceControl*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISdoServiceControl*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISdoServiceControl*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISdoServiceControl*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def start_service(this : ISdoServiceControl*) : HRESULT
    @lpVtbl.value.start_service.call(this)
  end
  def stop_service(this : ISdoServiceControl*) : HRESULT
    @lpVtbl.value.stop_service.call(this)
  end
  def get_service_status(this : ISdoServiceControl*, status : Int32*) : HRESULT
    @lpVtbl.value.get_service_status.call(this, status)
  end
  def reset_service(this : ISdoServiceControl*) : HRESULT
    @lpVtbl.value.reset_service.call(this)
  end
end
struct LibWin32::ISdo
  def query_interface(this : ISdo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISdo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISdo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISdo*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISdo*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISdo*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISdo*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_property_info(this : ISdo*, id : Int32, pppropertyinfo : IUnknown*) : HRESULT
    @lpVtbl.value.get_property_info.call(this, id, pppropertyinfo)
  end
  def get_property(this : ISdo*, id : Int32, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property.call(this, id, pvalue)
  end
  def put_property(this : ISdo*, id : Int32, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_property.call(this, id, pvalue)
  end
  def reset_property(this : ISdo*, id : Int32) : HRESULT
    @lpVtbl.value.reset_property.call(this, id)
  end
  def apply(this : ISdo*) : HRESULT
    @lpVtbl.value.apply.call(this)
  end
  def restore(this : ISdo*) : HRESULT
    @lpVtbl.value.restore.call(this)
  end
  def get__new_enum(this : ISdo*, ppenumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenumvariant)
  end
end
struct LibWin32::ISdoCollection
  def query_interface(this : ISdoCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISdoCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISdoCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISdoCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISdoCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISdoCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISdoCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : ISdoCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def add(this : ISdoCollection*, bstrname : UInt8*, ppitem : IDispatch*) : HRESULT
    @lpVtbl.value.add.call(this, bstrname, ppitem)
  end
  def remove(this : ISdoCollection*, pitem : IDispatch) : HRESULT
    @lpVtbl.value.remove.call(this, pitem)
  end
  def remove_all(this : ISdoCollection*) : HRESULT
    @lpVtbl.value.remove_all.call(this)
  end
  def reload(this : ISdoCollection*) : HRESULT
    @lpVtbl.value.reload.call(this)
  end
  def is_name_unique(this : ISdoCollection*, bstrname : UInt8*, pbool : Int16*) : HRESULT
    @lpVtbl.value.is_name_unique.call(this, bstrname, pbool)
  end
  def item(this : ISdoCollection*, name : VARIANT*, pitem : IDispatch*) : HRESULT
    @lpVtbl.value.item.call(this, name, pitem)
  end
  def get__new_enum(this : ISdoCollection*, ppenumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenumvariant)
  end
end
struct LibWin32::ITemplateSdo
  def query_interface(this : ITemplateSdo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITemplateSdo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITemplateSdo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITemplateSdo*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITemplateSdo*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITemplateSdo*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITemplateSdo*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_property_info(this : ITemplateSdo*, id : Int32, pppropertyinfo : IUnknown*) : HRESULT
    @lpVtbl.value.get_property_info.call(this, id, pppropertyinfo)
  end
  def get_property(this : ITemplateSdo*, id : Int32, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property.call(this, id, pvalue)
  end
  def put_property(this : ITemplateSdo*, id : Int32, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_property.call(this, id, pvalue)
  end
  def reset_property(this : ITemplateSdo*, id : Int32) : HRESULT
    @lpVtbl.value.reset_property.call(this, id)
  end
  def apply(this : ITemplateSdo*) : HRESULT
    @lpVtbl.value.apply.call(this)
  end
  def restore(this : ITemplateSdo*) : HRESULT
    @lpVtbl.value.restore.call(this)
  end
  def get__new_enum(this : ITemplateSdo*, ppenumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenumvariant)
  end
  def add_to_collection(this : ITemplateSdo*, bstrname : UInt8*, pcollection : IDispatch, ppitem : IDispatch*) : HRESULT
    @lpVtbl.value.add_to_collection.call(this, bstrname, pcollection, ppitem)
  end
  def add_to_sdo(this : ITemplateSdo*, bstrname : UInt8*, psdotarget : IDispatch, ppitem : IDispatch*) : HRESULT
    @lpVtbl.value.add_to_sdo.call(this, bstrname, psdotarget, ppitem)
  end
  def add_to_sdo_as_property(this : ITemplateSdo*, psdotarget : IDispatch, id : Int32) : HRESULT
    @lpVtbl.value.add_to_sdo_as_property.call(this, psdotarget, id)
  end
end
struct LibWin32::ISdoDictionaryOld
  def query_interface(this : ISdoDictionaryOld*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISdoDictionaryOld*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISdoDictionaryOld*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISdoDictionaryOld*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISdoDictionaryOld*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISdoDictionaryOld*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISdoDictionaryOld*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def enum_attributes(this : ISdoDictionaryOld*, id : VARIANT*, pvalues : VARIANT*) : HRESULT
    @lpVtbl.value.enum_attributes.call(this, id, pvalues)
  end
  def get_attribute_info(this : ISdoDictionaryOld*, id : ATTRIBUTEID, pinfoids : VARIANT*, pinfovalues : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_info.call(this, id, pinfoids, pinfovalues)
  end
  def enum_attribute_values(this : ISdoDictionaryOld*, id : ATTRIBUTEID, pvalueids : VARIANT*, pvaluesdesc : VARIANT*) : HRESULT
    @lpVtbl.value.enum_attribute_values.call(this, id, pvalueids, pvaluesdesc)
  end
  def create_attribute(this : ISdoDictionaryOld*, id : ATTRIBUTEID, ppattributeobject : IDispatch*) : HRESULT
    @lpVtbl.value.create_attribute.call(this, id, ppattributeobject)
  end
  def get_attribute_id(this : ISdoDictionaryOld*, bstrattributename : UInt8*, pid : ATTRIBUTEID*) : HRESULT
    @lpVtbl.value.get_attribute_id.call(this, bstrattributename, pid)
  end
end
