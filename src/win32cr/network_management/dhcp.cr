require "./../foundation.cr"

module Win32cr::NetworkManagement::Dhcp
  extend self
  alias LPDHCP_CONTROL = Proc(UInt32, Void*, UInt32)

  alias LPDHCP_NEWPKT = Proc(UInt8**, UInt32*, UInt32, Void*, Void**, Int32*, UInt32)

  alias LPDHCP_DROP_SEND = Proc(UInt8**, UInt32*, UInt32, UInt32, Void*, Void*, UInt32)

  alias LPDHCP_PROB = Proc(UInt8*, UInt32, UInt32, UInt32, UInt32, Void*, Void*, UInt32)

  alias LPDHCP_GIVE_ADDRESS = Proc(UInt8*, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Void*, Void*, UInt32)

  alias LPDHCP_HANDLE_OPTIONS = Proc(UInt8*, UInt32, Void*, Void*, Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_OPTIONS*, UInt32)

  alias LPDHCP_DELETE_CLIENT = Proc(UInt32, UInt8*, UInt32, UInt32, UInt32, UInt32)

  alias LPDHCP_ENTRY_POINT_FUNC = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::NetworkManagement::Dhcp::DHCP_CALLOUT_TABLE*, UInt32)

  OPTION_PAD = 0_u32
  OPTION_SUBNET_MASK = 1_u32
  OPTION_TIME_OFFSET = 2_u32
  OPTION_ROUTER_ADDRESS = 3_u32
  OPTION_TIME_SERVERS = 4_u32
  OPTION_IEN116_NAME_SERVERS = 5_u32
  OPTION_DOMAIN_NAME_SERVERS = 6_u32
  OPTION_LOG_SERVERS = 7_u32
  OPTION_COOKIE_SERVERS = 8_u32
  OPTION_LPR_SERVERS = 9_u32
  OPTION_IMPRESS_SERVERS = 10_u32
  OPTION_RLP_SERVERS = 11_u32
  OPTION_HOST_NAME = 12_u32
  OPTION_BOOT_FILE_SIZE = 13_u32
  OPTION_MERIT_DUMP_FILE = 14_u32
  OPTION_DOMAIN_NAME = 15_u32
  OPTION_SWAP_SERVER = 16_u32
  OPTION_ROOT_DISK = 17_u32
  OPTION_EXTENSIONS_PATH = 18_u32
  OPTION_BE_A_ROUTER = 19_u32
  OPTION_NON_LOCAL_SOURCE_ROUTING = 20_u32
  OPTION_POLICY_FILTER_FOR_NLSR = 21_u32
  OPTION_MAX_REASSEMBLY_SIZE = 22_u32
  OPTION_DEFAULT_TTL = 23_u32
  OPTION_PMTU_AGING_TIMEOUT = 24_u32
  OPTION_PMTU_PLATEAU_TABLE = 25_u32
  OPTION_MTU = 26_u32
  OPTION_ALL_SUBNETS_MTU = 27_u32
  OPTION_BROADCAST_ADDRESS = 28_u32
  OPTION_PERFORM_MASK_DISCOVERY = 29_u32
  OPTION_BE_A_MASK_SUPPLIER = 30_u32
  OPTION_PERFORM_ROUTER_DISCOVERY = 31_u32
  OPTION_ROUTER_SOLICITATION_ADDR = 32_u32
  OPTION_STATIC_ROUTES = 33_u32
  OPTION_TRAILERS = 34_u32
  OPTION_ARP_CACHE_TIMEOUT = 35_u32
  OPTION_ETHERNET_ENCAPSULATION = 36_u32
  OPTION_TTL = 37_u32
  OPTION_KEEP_ALIVE_INTERVAL = 38_u32
  OPTION_KEEP_ALIVE_DATA_SIZE = 39_u32
  OPTION_NETWORK_INFO_SERVICE_DOM = 40_u32
  OPTION_NETWORK_INFO_SERVERS = 41_u32
  OPTION_NETWORK_TIME_SERVERS = 42_u32
  OPTION_VENDOR_SPEC_INFO = 43_u32
  OPTION_NETBIOS_NAME_SERVER = 44_u32
  OPTION_NETBIOS_DATAGRAM_SERVER = 45_u32
  OPTION_NETBIOS_NODE_TYPE = 46_u32
  OPTION_NETBIOS_SCOPE_OPTION = 47_u32
  OPTION_XWINDOW_FONT_SERVER = 48_u32
  OPTION_XWINDOW_DISPLAY_MANAGER = 49_u32
  OPTION_REQUESTED_ADDRESS = 50_u32
  OPTION_LEASE_TIME = 51_u32
  OPTION_OK_TO_OVERLAY = 52_u32
  OPTION_MESSAGE_TYPE = 53_u32
  OPTION_SERVER_IDENTIFIER = 54_u32
  OPTION_PARAMETER_REQUEST_LIST = 55_u32
  OPTION_MESSAGE = 56_u32
  OPTION_MESSAGE_LENGTH = 57_u32
  OPTION_RENEWAL_TIME = 58_u32
  OPTION_REBIND_TIME = 59_u32
  OPTION_CLIENT_CLASS_INFO = 60_u32
  OPTION_CLIENT_ID = 61_u32
  OPTION_TFTP_SERVER_NAME = 66_u32
  OPTION_BOOTFILE_NAME = 67_u32
  OPTION_MSFT_IE_PROXY = 252_u32
  OPTION_END = 255_u32
  DHCPCAPI_REQUEST_PERSISTENT = 1_u32
  DHCPCAPI_REQUEST_SYNCHRONOUS = 2_u32
  DHCPCAPI_REQUEST_ASYNCHRONOUS = 4_u32
  DHCPCAPI_REQUEST_CANCEL = 8_u32
  DHCPCAPI_REQUEST_MASK = 15_u32
  DHCPCAPI_REGISTER_HANDLE_EVENT = 1_u32
  DHCPCAPI_DEREGISTER_HANDLE_EVENT = 1_u32
  ERROR_DHCP_REGISTRY_INIT_FAILED = 20000_u32
  ERROR_DHCP_DATABASE_INIT_FAILED = 20001_u32
  ERROR_DHCP_RPC_INIT_FAILED = 20002_u32
  ERROR_DHCP_NETWORK_INIT_FAILED = 20003_u32
  ERROR_DHCP_SUBNET_EXITS = 20004_u32
  ERROR_DHCP_SUBNET_NOT_PRESENT = 20005_u32
  ERROR_DHCP_PRIMARY_NOT_FOUND = 20006_u32
  ERROR_DHCP_ELEMENT_CANT_REMOVE = 20007_u32
  ERROR_DHCP_OPTION_EXITS = 20009_u32
  ERROR_DHCP_OPTION_NOT_PRESENT = 20010_u32
  ERROR_DHCP_ADDRESS_NOT_AVAILABLE = 20011_u32
  ERROR_DHCP_RANGE_FULL = 20012_u32
  ERROR_DHCP_JET_ERROR = 20013_u32
  ERROR_DHCP_CLIENT_EXISTS = 20014_u32
  ERROR_DHCP_INVALID_DHCP_MESSAGE = 20015_u32
  ERROR_DHCP_INVALID_DHCP_CLIENT = 20016_u32
  ERROR_DHCP_SERVICE_PAUSED = 20017_u32
  ERROR_DHCP_NOT_RESERVED_CLIENT = 20018_u32
  ERROR_DHCP_RESERVED_CLIENT = 20019_u32
  ERROR_DHCP_RANGE_TOO_SMALL = 20020_u32
  ERROR_DHCP_IPRANGE_EXITS = 20021_u32
  ERROR_DHCP_RESERVEDIP_EXITS = 20022_u32
  ERROR_DHCP_INVALID_RANGE = 20023_u32
  ERROR_DHCP_RANGE_EXTENDED = 20024_u32
  ERROR_EXTEND_TOO_SMALL = 20025_u32
  WARNING_EXTENDED_LESS = 20026_i32
  ERROR_DHCP_JET_CONV_REQUIRED = 20027_u32
  ERROR_SERVER_INVALID_BOOT_FILE_TABLE = 20028_u32
  ERROR_SERVER_UNKNOWN_BOOT_FILE_NAME = 20029_u32
  ERROR_DHCP_SUPER_SCOPE_NAME_TOO_LONG = 20030_u32
  ERROR_DHCP_IP_ADDRESS_IN_USE = 20032_u32
  ERROR_DHCP_LOG_FILE_PATH_TOO_LONG = 20033_u32
  ERROR_DHCP_UNSUPPORTED_CLIENT = 20034_u32
  ERROR_DHCP_JET97_CONV_REQUIRED = 20036_u32
  ERROR_DHCP_ROGUE_INIT_FAILED = 20037_u32
  ERROR_DHCP_ROGUE_SAMSHUTDOWN = 20038_u32
  ERROR_DHCP_ROGUE_NOT_AUTHORIZED = 20039_u32
  ERROR_DHCP_ROGUE_DS_UNREACHABLE = 20040_u32
  ERROR_DHCP_ROGUE_DS_CONFLICT = 20041_u32
  ERROR_DHCP_ROGUE_NOT_OUR_ENTERPRISE = 20042_u32
  ERROR_DHCP_ROGUE_STANDALONE_IN_DS = 20043_u32
  ERROR_DHCP_CLASS_NOT_FOUND = 20044_u32
  ERROR_DHCP_CLASS_ALREADY_EXISTS = 20045_u32
  ERROR_DHCP_SCOPE_NAME_TOO_LONG = 20046_u32
  ERROR_DHCP_DEFAULT_SCOPE_EXITS = 20047_u32
  ERROR_DHCP_CANT_CHANGE_ATTRIBUTE = 20048_u32
  ERROR_DHCP_IPRANGE_CONV_ILLEGAL = 20049_u32
  ERROR_DHCP_NETWORK_CHANGED = 20050_u32
  ERROR_DHCP_CANNOT_MODIFY_BINDINGS = 20051_u32
  ERROR_DHCP_SUBNET_EXISTS = 20052_u32
  ERROR_DHCP_MSCOPE_EXISTS = 20053_u32
  ERROR_MSCOPE_RANGE_TOO_SMALL = 20054_u32
  ERROR_DHCP_EXEMPTION_EXISTS = 20055_u32
  ERROR_DHCP_EXEMPTION_NOT_PRESENT = 20056_u32
  ERROR_DHCP_INVALID_PARAMETER_OPTION32 = 20057_u32
  ERROR_DDS_NO_DS_AVAILABLE = 20070_u32
  ERROR_DDS_NO_DHCP_ROOT = 20071_u32
  ERROR_DDS_UNEXPECTED_ERROR = 20072_u32
  ERROR_DDS_TOO_MANY_ERRORS = 20073_u32
  ERROR_DDS_DHCP_SERVER_NOT_FOUND = 20074_u32
  ERROR_DDS_OPTION_ALREADY_EXISTS = 20075_u32
  ERROR_DDS_OPTION_DOES_NOT_EXIST = 20076_u32
  ERROR_DDS_CLASS_EXISTS = 20077_u32
  ERROR_DDS_CLASS_DOES_NOT_EXIST = 20078_u32
  ERROR_DDS_SERVER_ALREADY_EXISTS = 20079_u32
  ERROR_DDS_SERVER_DOES_NOT_EXIST = 20080_u32
  ERROR_DDS_SERVER_ADDRESS_MISMATCH = 20081_u32
  ERROR_DDS_SUBNET_EXISTS = 20082_u32
  ERROR_DDS_SUBNET_HAS_DIFF_SSCOPE = 20083_u32
  ERROR_DDS_SUBNET_NOT_PRESENT = 20084_u32
  ERROR_DDS_RESERVATION_NOT_PRESENT = 20085_u32
  ERROR_DDS_RESERVATION_CONFLICT = 20086_u32
  ERROR_DDS_POSSIBLE_RANGE_CONFLICT = 20087_u32
  ERROR_DDS_RANGE_DOES_NOT_EXIST = 20088_u32
  ERROR_DHCP_DELETE_BUILTIN_CLASS = 20089_u32
  ERROR_DHCP_INVALID_SUBNET_PREFIX = 20091_u32
  ERROR_DHCP_INVALID_DELAY = 20092_u32
  ERROR_DHCP_LINKLAYER_ADDRESS_EXISTS = 20093_u32
  ERROR_DHCP_LINKLAYER_ADDRESS_RESERVATION_EXISTS = 20094_u32
  ERROR_DHCP_LINKLAYER_ADDRESS_DOES_NOT_EXIST = 20095_u32
  ERROR_DHCP_HARDWARE_ADDRESS_TYPE_ALREADY_EXEMPT = 20101_u32
  ERROR_DHCP_UNDEFINED_HARDWARE_ADDRESS_TYPE = 20102_u32
  ERROR_DHCP_OPTION_TYPE_MISMATCH = 20103_u32
  ERROR_DHCP_POLICY_BAD_PARENT_EXPR = 20104_u32
  ERROR_DHCP_POLICY_EXISTS = 20105_u32
  ERROR_DHCP_POLICY_RANGE_EXISTS = 20106_u32
  ERROR_DHCP_POLICY_RANGE_BAD = 20107_u32
  ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY = 20108_u32
  ERROR_DHCP_INVALID_POLICY_EXPRESSION = 20109_u32
  ERROR_DHCP_INVALID_PROCESSING_ORDER = 20110_u32
  ERROR_DHCP_POLICY_NOT_FOUND = 20111_u32
  ERROR_SCOPE_RANGE_POLICY_RANGE_CONFLICT = 20112_u32
  ERROR_DHCP_FO_SCOPE_ALREADY_IN_RELATIONSHIP = 20113_u32
  ERROR_DHCP_FO_RELATIONSHIP_EXISTS = 20114_u32
  ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST = 20115_u32
  ERROR_DHCP_FO_SCOPE_NOT_IN_RELATIONSHIP = 20116_u32
  ERROR_DHCP_FO_RELATION_IS_SECONDARY = 20117_u32
  ERROR_DHCP_FO_NOT_SUPPORTED = 20118_u32
  ERROR_DHCP_FO_TIME_OUT_OF_SYNC = 20119_u32
  ERROR_DHCP_FO_STATE_NOT_NORMAL = 20120_u32
  ERROR_DHCP_NO_ADMIN_PERMISSION = 20121_u32
  ERROR_DHCP_SERVER_NOT_REACHABLE = 20122_u32
  ERROR_DHCP_SERVER_NOT_RUNNING = 20123_u32
  ERROR_DHCP_SERVER_NAME_NOT_RESOLVED = 20124_u32
  ERROR_DHCP_FO_RELATIONSHIP_NAME_TOO_LONG = 20125_u32
  ERROR_DHCP_REACHED_END_OF_SELECTION = 20126_u32
  ERROR_DHCP_FO_ADDSCOPE_LEASES_NOT_SYNCED = 20127_u32
  ERROR_DHCP_FO_MAX_RELATIONSHIPS = 20128_u32
  ERROR_DHCP_FO_IPRANGE_TYPE_CONV_ILLEGAL = 20129_u32
  ERROR_DHCP_FO_MAX_ADD_SCOPES = 20130_u32
  ERROR_DHCP_FO_BOOT_NOT_SUPPORTED = 20131_u32
  ERROR_DHCP_FO_RANGE_PART_OF_REL = 20132_u32
  ERROR_DHCP_FO_SCOPE_SYNC_IN_PROGRESS = 20133_u32
  ERROR_DHCP_FO_FEATURE_NOT_SUPPORTED = 20134_u32
  ERROR_DHCP_POLICY_FQDN_RANGE_UNSUPPORTED = 20135_u32
  ERROR_DHCP_POLICY_FQDN_OPTION_UNSUPPORTED = 20136_u32
  ERROR_DHCP_POLICY_EDIT_FQDN_UNSUPPORTED = 20137_u32
  ERROR_DHCP_NAP_NOT_SUPPORTED = 20138_u32
  ERROR_LAST_DHCP_SERVER_ERROR = 20139_u32
  DHCP_SUBNET_INFO_VQ_FLAG_QUARANTINE = 1_u32
  MAX_PATTERN_LENGTH = 255_u32
  MAC_ADDRESS_LENGTH = 6_u32
  HWTYPE_ETHERNET_10MB = 1_u32
  FILTER_STATUS_NONE = 1_u32
  FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST = 2_u32
  FILTER_STATUS_FULL_MATCH_IN_DENY_LIST = 4_u32
  FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST = 8_u32
  FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST = 16_u32
  Set_APIProtocolSupport = 1_u32
  Set_DatabaseName = 2_u32
  Set_DatabasePath = 4_u32
  Set_BackupPath = 8_u32
  Set_BackupInterval = 16_u32
  Set_DatabaseLoggingFlag = 32_u32
  Set_RestoreFlag = 64_u32
  Set_DatabaseCleanupInterval = 128_u32
  Set_DebugFlag = 256_u32
  Set_PingRetries = 512_u32
  Set_BootFileTable = 1024_u32
  Set_AuditLogState = 2048_u32
  Set_QuarantineON = 4096_u32
  Set_QuarantineDefFail = 8192_u32
  CLIENT_TYPE_UNSPECIFIED = 0_u32
  CLIENT_TYPE_DHCP = 1_u32
  CLIENT_TYPE_BOOTP = 2_u32
  CLIENT_TYPE_RESERVATION_FLAG = 4_u32
  CLIENT_TYPE_NONE = 100_u32
  Set_UnicastFlag = 1_u32
  Set_RapidCommitFlag = 2_u32
  Set_PreferredLifetime = 4_u32
  Set_ValidLifetime = 8_u32
  Set_T1 = 16_u32
  Set_T2 = 32_u32
  Set_PreferredLifetimeIATA = 64_u32
  Set_ValidLifetimeIATA = 128_u32
  V5_ADDRESS_STATE_OFFERED = 0_u32
  V5_ADDRESS_STATE_ACTIVE = 1_u32
  V5_ADDRESS_STATE_DECLINED = 2_u32
  V5_ADDRESS_STATE_DOOM = 3_u32
  V5_ADDRESS_BIT_DELETED = 128_u32
  V5_ADDRESS_BIT_UNREGISTERED = 64_u32
  V5_ADDRESS_BIT_BOTH_REC = 32_u32
  V5_ADDRESS_EX_BIT_DISABLE_PTR_RR = 1_u32
  DNS_FLAG_ENABLED = 1_u32
  DNS_FLAG_UPDATE_DOWNLEVEL = 2_u32
  DNS_FLAG_CLEANUP_EXPIRED = 4_u32
  DNS_FLAG_UPDATE_BOTH_ALWAYS = 16_u32
  DNS_FLAG_UPDATE_DHCID = 32_u32
  DNS_FLAG_DISABLE_PTR_UPDATE = 64_u32
  DNS_FLAG_HAS_DNS_SUFFIX = 128_u32
  DHCP_OPT_ENUM_IGNORE_VENDOR = 1_u32
  DHCP_OPT_ENUM_USE_CLASSNAME = 2_u32
  DHCP_FLAGS_DONT_ACCESS_DS = 1_u32
  DHCP_FLAGS_DONT_DO_RPC = 2_u32
  DHCP_FLAGS_OPTION_IS_VENDOR = 3_u32
  DHCP_ATTRIB_BOOL_IS_ROGUE = 1_u32
  DHCP_ATTRIB_BOOL_IS_DYNBOOTP = 2_u32
  DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC = 3_u32
  DHCP_ATTRIB_BOOL_IS_BINDING_AWARE = 4_u32
  DHCP_ATTRIB_BOOL_IS_ADMIN = 5_u32
  DHCP_ATTRIB_ULONG_RESTORE_STATUS = 6_u32
  DHCP_ATTRIB_TYPE_BOOL = 1_u32
  DHCP_ATTRIB_TYPE_ULONG = 2_u32
  DHCP_ENDPOINT_FLAG_CANT_MODIFY = 1_u32
  QUARANTIN_OPTION_BASE = 43220_u32
  QUARANTINE_SCOPE_QUARPROFILE_OPTION = 43221_u32
  QUARANTINE_CONFIG_OPTION = 43222_u32
  ADDRESS_TYPE_IANA = 0_u32
  ADDRESS_TYPE_IATA = 1_u32
  DHCP_MIN_DELAY = 0_u32
  DHCP_MAX_DELAY = 1000_u32
  DHCP_FAILOVER_DELETE_SCOPES = 1_u32
  DHCP_FAILOVER_MAX_NUM_ADD_SCOPES = 400_u32
  DHCP_FAILOVER_MAX_NUM_REL = 31_u32
  MCLT = 1_u32
  SAFEPERIOD = 2_u32
  CHANGESTATE = 4_u32
  PERCENTAGE = 8_u32
  MODE = 16_u32
  PREVSTATE = 32_u32
  SHAREDSECRET = 64_u32
  DHCP_CALLOUT_LIST_KEY = "System\\CurrentControlSet\\Services\\DHCPServer\\Parameters"
  DHCP_CALLOUT_LIST_VALUE = "CalloutDlls"
  DHCP_CALLOUT_ENTRY_POINT = "DhcpServerCalloutEntry"
  DHCP_CONTROL_START = 1_u32
  DHCP_CONTROL_STOP = 2_u32
  DHCP_CONTROL_PAUSE = 3_u32
  DHCP_CONTROL_CONTINUE = 4_u32
  DHCP_DROP_DUPLICATE = 1_u32
  DHCP_DROP_NOMEM = 2_u32
  DHCP_DROP_INTERNAL_ERROR = 3_u32
  DHCP_DROP_TIMEOUT = 4_u32
  DHCP_DROP_UNAUTH = 5_u32
  DHCP_DROP_PAUSED = 6_u32
  DHCP_DROP_NO_SUBNETS = 7_u32
  DHCP_DROP_INVALID = 8_u32
  DHCP_DROP_WRONG_SERVER = 9_u32
  DHCP_DROP_NOADDRESS = 10_u32
  DHCP_DROP_PROCESSED = 11_u32
  DHCP_DROP_GEN_FAILURE = 256_u32
  DHCP_SEND_PACKET = 268435456_u32
  DHCP_PROB_CONFLICT = 536870913_u32
  DHCP_PROB_DECLINE = 536870914_u32
  DHCP_PROB_RELEASE = 536870915_u32
  DHCP_PROB_NACKED = 536870916_u32
  DHCP_GIVE_ADDRESS_NEW = 805306369_u32
  DHCP_GIVE_ADDRESS_OLD = 805306370_u32
  DHCP_CLIENT_BOOTP = 805306371_u32
  DHCP_CLIENT_DHCP = 805306372_u32
  DHCPV6_OPTION_CLIENTID = 1_u32
  DHCPV6_OPTION_SERVERID = 2_u32
  DHCPV6_OPTION_IA_NA = 3_u32
  DHCPV6_OPTION_IA_TA = 4_u32
  DHCPV6_OPTION_ORO = 6_u32
  DHCPV6_OPTION_PREFERENCE = 7_u32
  DHCPV6_OPTION_UNICAST = 12_u32
  DHCPV6_OPTION_RAPID_COMMIT = 14_u32
  DHCPV6_OPTION_USER_CLASS = 15_u32
  DHCPV6_OPTION_VENDOR_CLASS = 16_u32
  DHCPV6_OPTION_VENDOR_OPTS = 17_u32
  DHCPV6_OPTION_RECONF_MSG = 19_u32
  DHCPV6_OPTION_SIP_SERVERS_NAMES = 21_u32
  DHCPV6_OPTION_SIP_SERVERS_ADDRS = 22_u32
  DHCPV6_OPTION_DNS_SERVERS = 23_u32
  DHCPV6_OPTION_DOMAIN_LIST = 24_u32
  DHCPV6_OPTION_IA_PD = 25_u32
  DHCPV6_OPTION_NIS_SERVERS = 27_u32
  DHCPV6_OPTION_NISP_SERVERS = 28_u32
  DHCPV6_OPTION_NIS_DOMAIN_NAME = 29_u32
  DHCPV6_OPTION_NISP_DOMAIN_NAME = 30_u32

  enum StatusCode
    STATUS_NO_ERROR = 0_i32
    STATUS_UNSPECIFIED_FAILURE = 1_i32
    STATUS_NO_BINDING = 3_i32
    STATUS_NOPREFIX_AVAIL = 6_i32
  end
  enum DHCP_FORCE_FLAG
    DhcpFullForce = 0_i32
    DhcpNoForce = 1_i32
    DhcpFailoverForce = 2_i32
  end
  enum DHCP_SUBNET_STATE
    DhcpSubnetEnabled = 0_i32
    DhcpSubnetDisabled = 1_i32
    DhcpSubnetEnabledSwitched = 2_i32
    DhcpSubnetDisabledSwitched = 3_i32
    DhcpSubnetInvalidState = 4_i32
  end
  enum DHCP_SUBNET_ELEMENT_TYPE
    DhcpIpRanges = 0_i32
    DhcpSecondaryHosts = 1_i32
    DhcpReservedIps = 2_i32
    DhcpExcludedIpRanges = 3_i32
    DhcpIpUsedClusters = 4_i32
    DhcpIpRangesDhcpOnly = 5_i32
    DhcpIpRangesDhcpBootp = 6_i32
    DhcpIpRangesBootpOnly = 7_i32
  end
  enum DHCP_FILTER_LIST_TYPE
    Deny = 0_i32
    Allow = 1_i32
  end
  enum DHCP_OPTION_DATA_TYPE
    DhcpByteOption = 0_i32
    DhcpWordOption = 1_i32
    DhcpDWordOption = 2_i32
    DhcpDWordDWordOption = 3_i32
    DhcpIpAddressOption = 4_i32
    DhcpStringDataOption = 5_i32
    DhcpBinaryDataOption = 6_i32
    DhcpEncapsulatedDataOption = 7_i32
    DhcpIpv6AddressOption = 8_i32
  end
  enum DHCP_OPTION_TYPE
    DhcpUnaryElementTypeOption = 0_i32
    DhcpArrayTypeOption = 1_i32
  end
  enum DHCP_OPTION_SCOPE_TYPE
    DhcpDefaultOptions = 0_i32
    DhcpGlobalOptions = 1_i32
    DhcpSubnetOptions = 2_i32
    DhcpReservedOptions = 3_i32
    DhcpMScopeOptions = 4_i32
  end
  enum DHCP_OPTION_SCOPE_TYPE6
    DhcpDefaultOptions6 = 0_i32
    DhcpScopeOptions6 = 1_i32
    DhcpReservedOptions6 = 2_i32
    DhcpGlobalOptions6 = 3_i32
  end
  enum QuarantineStatus
    NOQUARANTINE = 0_i32
    RESTRICTEDACCESS = 1_i32
    DROPPACKET = 2_i32
    PROBATION = 3_i32
    EXEMPT = 4_i32
    DEFAULTQUARSETTING = 5_i32
    NOQUARINFO = 6_i32
  end
  enum DHCP_SEARCH_INFO_TYPE
    DhcpClientIpAddress = 0_i32
    DhcpClientHardwareAddress = 1_i32
    DhcpClientName = 2_i32
  end
  enum DHCP_PROPERTY_TYPE
    DhcpPropTypeByte = 0_i32
    DhcpPropTypeWord = 1_i32
    DhcpPropTypeDword = 2_i32
    DhcpPropTypeString = 3_i32
    DhcpPropTypeBinary = 4_i32
  end
  enum DHCP_PROPERTY_ID
    DhcpPropIdPolicyDnsSuffix = 0_i32
    DhcpPropIdClientAddressStateEx = 1_i32
  end
  enum DHCP_SCAN_FLAG
    DhcpRegistryFix = 0_i32
    DhcpDatabaseFix = 1_i32
  end
  enum DHCP_SUBNET_ELEMENT_TYPE_V6
    Dhcpv6IpRanges = 0_i32
    Dhcpv6ReservedIps = 1_i32
    Dhcpv6ExcludedIpRanges = 2_i32
  end
  enum DHCP_SEARCH_INFO_TYPE_V6
    Dhcpv6ClientIpAddress = 0_i32
    Dhcpv6ClientDUID = 1_i32
    Dhcpv6ClientName = 2_i32
  end
  enum DHCP_POL_ATTR_TYPE
    DhcpAttrHWAddr = 0_i32
    DhcpAttrOption = 1_i32
    DhcpAttrSubOption = 2_i32
    DhcpAttrFqdn = 3_i32
    DhcpAttrFqdnSingleLabel = 4_i32
  end
  enum DHCP_POL_COMPARATOR
    DhcpCompEqual = 0_i32
    DhcpCompNotEqual = 1_i32
    DhcpCompBeginsWith = 2_i32
    DhcpCompNotBeginWith = 3_i32
    DhcpCompEndsWith = 4_i32
    DhcpCompNotEndWith = 5_i32
  end
  enum DHCP_POL_LOGIC_OPER
    DhcpLogicalOr = 0_i32
    DhcpLogicalAnd = 1_i32
  end
  enum DHCP_POLICY_FIELDS_TO_UPDATE
    DhcpUpdatePolicyName = 1_i32
    DhcpUpdatePolicyOrder = 2_i32
    DhcpUpdatePolicyExpr = 4_i32
    DhcpUpdatePolicyRanges = 8_i32
    DhcpUpdatePolicyDescr = 16_i32
    DhcpUpdatePolicyStatus = 32_i32
    DhcpUpdatePolicyDnsSuffix = 64_i32
  end
  enum DHCPV6_STATELESS_PARAM_TYPE
    DhcpStatelessPurgeInterval = 1_i32
    DhcpStatelessStatus = 2_i32
  end
  enum DHCP_FAILOVER_MODE
    LoadBalance = 0_i32
    HotStandby = 1_i32
  end
  enum DHCP_FAILOVER_SERVER
    PrimaryServer = 0_i32
    SecondaryServer = 1_i32
  end
  enum FSM_STATE
    NO_STATE = 0_i32
    INIT = 1_i32
    STARTUP = 2_i32
    NORMAL = 3_i32
    COMMUNICATION_INT = 4_i32
    PARTNER_DOWN = 5_i32
    POTENTIAL_CONFLICT = 6_i32
    CONFLICT_DONE = 7_i32
    RESOLUTION_INT = 8_i32
    RECOVER = 9_i32
    RECOVER_WAIT = 10_i32
    RECOVER_DONE = 11_i32
    PAUSED = 12_i32
    SHUTDOWN = 13_i32
  end

  @[Extern]
  struct DHCPV6CAPI_PARAMS
    property flags : UInt32
    property option_id : UInt32
    property is_vendor : Win32cr::Foundation::BOOL
    property data : UInt8*
    property nBytesData : UInt32
    def initialize(@flags : UInt32, @option_id : UInt32, @is_vendor : Win32cr::Foundation::BOOL, @data : UInt8*, @nBytesData : UInt32)
    end
  end

  @[Extern]
  struct DHCPV6CAPI_PARAMS_ARRAY
    property nParams : UInt32
    property params : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_PARAMS*
    def initialize(@nParams : UInt32, @params : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_PARAMS*)
    end
  end

  @[Extern]
  struct DHCPV6CAPI_CLASSID
    property flags : UInt32
    property data : UInt8*
    property nBytesData : UInt32
    def initialize(@flags : UInt32, @data : UInt8*, @nBytesData : UInt32)
    end
  end

  @[Extern]
  struct DHCPV6Prefix
    property prefix : UInt8[16]
    property prefixLength : UInt32
    property preferredLifeTime : UInt32
    property validLifeTime : UInt32
    property status : Win32cr::NetworkManagement::Dhcp::StatusCode
    def initialize(@prefix : UInt8[16], @prefixLength : UInt32, @preferredLifeTime : UInt32, @validLifeTime : UInt32, @status : Win32cr::NetworkManagement::Dhcp::StatusCode)
    end
  end

  @[Extern]
  struct DHCPV6PrefixLeaseInformation
    property nPrefixes : UInt32
    property prefixArray : Win32cr::NetworkManagement::Dhcp::DHCPV6Prefix*
    property iaid : UInt32
    property t1 : Int64
    property t2 : Int64
    property max_lease_expiration_time : Int64
    property last_renewal_time : Int64
    property status : Win32cr::NetworkManagement::Dhcp::StatusCode
    property server_id : UInt8*
    property server_id_len : UInt32
    def initialize(@nPrefixes : UInt32, @prefixArray : Win32cr::NetworkManagement::Dhcp::DHCPV6Prefix*, @iaid : UInt32, @t1 : Int64, @t2 : Int64, @max_lease_expiration_time : Int64, @last_renewal_time : Int64, @status : Win32cr::NetworkManagement::Dhcp::StatusCode, @server_id : UInt8*, @server_id_len : UInt32)
    end
  end

  @[Extern]
  struct DHCPAPI_PARAMS
    property flags : UInt32
    property option_id : UInt32
    property is_vendor : Win32cr::Foundation::BOOL
    property data : UInt8*
    property nBytesData : UInt32
    def initialize(@flags : UInt32, @option_id : UInt32, @is_vendor : Win32cr::Foundation::BOOL, @data : UInt8*, @nBytesData : UInt32)
    end
  end

  @[Extern]
  struct DHCPCAPI_PARAMS_ARRAY
    property nParams : UInt32
    property params : Win32cr::NetworkManagement::Dhcp::DHCPAPI_PARAMS*
    def initialize(@nParams : UInt32, @params : Win32cr::NetworkManagement::Dhcp::DHCPAPI_PARAMS*)
    end
  end

  @[Extern]
  struct DHCPCAPI_CLASSID
    property flags : UInt32
    property data : UInt8*
    property nBytesData : UInt32
    def initialize(@flags : UInt32, @data : UInt8*, @nBytesData : UInt32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DHCP_SERVER_OPTIONS
    property message_type : UInt8*
    property subnet_mask : UInt32*
    property requested_address : UInt32*
    property request_lease_time : UInt32*
    property overlay_fields : UInt8*
    property router_address : UInt32*
    property server : UInt32*
    property parameter_request_list : UInt8*
    property parameter_request_list_length : UInt32
    property machine_name : Win32cr::Foundation::PSTR
    property machine_name_length : UInt32
    property client_hardware_address_type : UInt8
    property client_hardware_address_length : UInt8
    property client_hardware_address : UInt8*
    property class_identifier : Win32cr::Foundation::PSTR
    property class_identifier_length : UInt32
    property vendor_class : UInt8*
    property vendor_class_length : UInt32
    property dns_flags : UInt32
    property dns_name_length : UInt32
    property dns_name : UInt8*
    property ds_domain_name_requested : Win32cr::Foundation::BOOLEAN
    property ds_domain_name : Win32cr::Foundation::PSTR
    property ds_domain_name_len : UInt32
    property scope_id : UInt32*
    def initialize(@message_type : UInt8*, @subnet_mask : UInt32*, @requested_address : UInt32*, @request_lease_time : UInt32*, @overlay_fields : UInt8*, @router_address : UInt32*, @server : UInt32*, @parameter_request_list : UInt8*, @parameter_request_list_length : UInt32, @machine_name : Win32cr::Foundation::PSTR, @machine_name_length : UInt32, @client_hardware_address_type : UInt8, @client_hardware_address_length : UInt8, @client_hardware_address : UInt8*, @class_identifier : Win32cr::Foundation::PSTR, @class_identifier_length : UInt32, @vendor_class : UInt8*, @vendor_class_length : UInt32, @dns_flags : UInt32, @dns_name_length : UInt32, @dns_name : UInt8*, @ds_domain_name_requested : Win32cr::Foundation::BOOLEAN, @ds_domain_name : Win32cr::Foundation::PSTR, @ds_domain_name_len : UInt32, @scope_id : UInt32*)
    end
  end
  {% end %}

  @[Extern]
  struct DHCP_CALLOUT_TABLE
    property dhcp_control_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_CONTROL
    property dhcp_new_pkt_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_NEWPKT
    property dhcp_pkt_drop_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DROP_SEND
    property dhcp_pkt_send_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DROP_SEND
    property dhcp_address_del_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_PROB
    property dhcp_address_offer_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_GIVE_ADDRESS
    property dhcp_handle_options_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_HANDLE_OPTIONS
    property dhcp_delete_client_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DELETE_CLIENT
    property dhcp_extension_hook : Void*
    property dhcp_reserved_hook : Void*
    def initialize(@dhcp_control_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_CONTROL, @dhcp_new_pkt_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_NEWPKT, @dhcp_pkt_drop_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DROP_SEND, @dhcp_pkt_send_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DROP_SEND, @dhcp_address_del_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_PROB, @dhcp_address_offer_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_GIVE_ADDRESS, @dhcp_handle_options_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_HANDLE_OPTIONS, @dhcp_delete_client_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DELETE_CLIENT, @dhcp_extension_hook : Void*, @dhcp_reserved_hook : Void*)
    end
  end

  @[Extern]
  struct DATE_TIME
    property dwLowDateTime : UInt32
    property dwHighDateTime : UInt32
    def initialize(@dwLowDateTime : UInt32, @dwHighDateTime : UInt32)
    end
  end

  @[Extern]
  struct DHCP_IP_RANGE
    property start_address : UInt32
    property end_address : UInt32
    def initialize(@start_address : UInt32, @end_address : UInt32)
    end
  end

  @[Extern]
  struct DHCP_BINARY_DATA
    property data_length : UInt32
    property data : UInt8*
    def initialize(@data_length : UInt32, @data : UInt8*)
    end
  end

  @[Extern]
  struct DHCP_HOST_INFO
    property ip_address : UInt32
    property net_bios_name : Win32cr::Foundation::PWSTR
    property host_name : Win32cr::Foundation::PWSTR
    def initialize(@ip_address : UInt32, @net_bios_name : Win32cr::Foundation::PWSTR, @host_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DWORD_DWORD
    property d_word1 : UInt32
    property d_word2 : UInt32
    def initialize(@d_word1 : UInt32, @d_word2 : UInt32)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_INFO
    property subnet_address : UInt32
    property subnet_mask : UInt32
    property subnet_name : Win32cr::Foundation::PWSTR
    property subnet_comment : Win32cr::Foundation::PWSTR
    property primary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property subnet_state : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_STATE
    def initialize(@subnet_address : UInt32, @subnet_mask : UInt32, @subnet_name : Win32cr::Foundation::PWSTR, @subnet_comment : Win32cr::Foundation::PWSTR, @primary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @subnet_state : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_STATE)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_INFO_VQ
    property subnet_address : UInt32
    property subnet_mask : UInt32
    property subnet_name : Win32cr::Foundation::PWSTR
    property subnet_comment : Win32cr::Foundation::PWSTR
    property primary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property subnet_state : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_STATE
    property quarantine_on : UInt32
    property reserved1 : UInt32
    property reserved2 : UInt32
    property reserved3 : Int64
    property reserved4 : Int64
    def initialize(@subnet_address : UInt32, @subnet_mask : UInt32, @subnet_name : Win32cr::Foundation::PWSTR, @subnet_comment : Win32cr::Foundation::PWSTR, @primary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @subnet_state : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_STATE, @quarantine_on : UInt32, @reserved1 : UInt32, @reserved2 : UInt32, @reserved3 : Int64, @reserved4 : Int64)
    end
  end

  @[Extern]
  struct DHCP_IP_ARRAY
    property num_elements : UInt32
    property elements : UInt32*
    def initialize(@num_elements : UInt32, @elements : UInt32*)
    end
  end

  @[Extern]
  struct DHCP_IP_CLUSTER
    property cluster_address : UInt32
    property cluster_mask : UInt32
    def initialize(@cluster_address : UInt32, @cluster_mask : UInt32)
    end
  end

  @[Extern]
  struct DHCP_IP_RESERVATION
    property reserved_ip_address : UInt32
    property reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*
    def initialize(@reserved_ip_address : UInt32, @reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_DATA
    property element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE
    property element : DHCP_SUBNET_ELEMENT_UNION

    # Nested Type DHCP_SUBNET_ELEMENT_UNION
    @[Extern(union: true)]
    struct DHCP_SUBNET_ELEMENT_UNION
    property ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*
    property secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*
    property reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION*
    property exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*
    property ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*
    def initialize(@ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*, @secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*, @reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION*, @exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*, @ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*)
    end
    end

    def initialize(@element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, @element : DHCP_SUBNET_ELEMENT_UNION)
    end
  end

  @[Extern(union: true)]
  struct DHCP_SUBNET_ELEMENT_UNION
    def initialize()
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*)
    end
  end

  @[Extern]
  struct DHCP_IPV6_ADDRESS
    property high_order_bits : UInt64
    property low_order_bits : UInt64
    def initialize(@high_order_bits : UInt64, @low_order_bits : UInt64)
    end
  end

  @[Extern]
  struct DHCP_ADDR_PATTERN
    property match_hw_type : Win32cr::Foundation::BOOL
    property hw_type : UInt8
    property is_wildcard : Win32cr::Foundation::BOOL
    property length : UInt8
    property pattern : UInt8[255]
    def initialize(@match_hw_type : Win32cr::Foundation::BOOL, @hw_type : UInt8, @is_wildcard : Win32cr::Foundation::BOOL, @length : UInt8, @pattern : UInt8[255])
    end
  end

  @[Extern]
  struct DHCP_FILTER_ADD_INFO
    property addr_patt : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN
    property comment : Win32cr::Foundation::PWSTR
    property list_type : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_LIST_TYPE
    def initialize(@addr_patt : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN, @comment : Win32cr::Foundation::PWSTR, @list_type : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_LIST_TYPE)
    end
  end

  @[Extern]
  struct DHCP_FILTER_GLOBAL_INFO
    property enforce_allow_list : Win32cr::Foundation::BOOL
    property enforce_deny_list : Win32cr::Foundation::BOOL
    def initialize(@enforce_allow_list : Win32cr::Foundation::BOOL, @enforce_deny_list : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DHCP_FILTER_RECORD
    property addr_patt : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN
    property comment : Win32cr::Foundation::PWSTR
    def initialize(@addr_patt : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN, @comment : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DHCP_FILTER_ENUM_INFO
    property num_elements : UInt32
    property pEnumRecords : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_RECORD*
    def initialize(@num_elements : UInt32, @pEnumRecords : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_RECORD*)
    end
  end

  @[Extern]
  struct DHCP_OPTION_DATA_ELEMENT
    property option_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA_TYPE
    property element : DHCP_OPTION_ELEMENT_UNION

    # Nested Type DHCP_OPTION_ELEMENT_UNION
    @[Extern(union: true)]
    struct DHCP_OPTION_ELEMENT_UNION
    property byte_option : UInt8
    property word_option : UInt16
    property d_word_option : UInt32
    property d_word_d_word_option : Win32cr::NetworkManagement::Dhcp::DWORD_DWORD
    property ip_address_option : UInt32
    property string_data_option : Win32cr::Foundation::PWSTR
    property binary_data_option : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property encapsulated_data_option : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property ipv6_address_data_option : Win32cr::Foundation::PWSTR
    def initialize(@byte_option : UInt8, @word_option : UInt16, @d_word_option : UInt32, @d_word_d_word_option : Win32cr::NetworkManagement::Dhcp::DWORD_DWORD, @ip_address_option : UInt32, @string_data_option : Win32cr::Foundation::PWSTR, @binary_data_option : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @encapsulated_data_option : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @ipv6_address_data_option : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@option_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA_TYPE, @element : DHCP_OPTION_ELEMENT_UNION)
    end
  end

  @[Extern(union: true)]
  struct DHCP_OPTION_ELEMENT_UNION
    def initialize()
    end
  end

  @[Extern]
  struct DHCP_OPTION_DATA
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA_ELEMENT*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA_ELEMENT*)
    end
  end

  @[Extern]
  struct DHCP_OPTION
    property option_id : UInt32
    property option_name : Win32cr::Foundation::PWSTR
    property option_comment : Win32cr::Foundation::PWSTR
    property default_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA
    property option_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_TYPE
    def initialize(@option_id : UInt32, @option_name : Win32cr::Foundation::PWSTR, @option_comment : Win32cr::Foundation::PWSTR, @default_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA, @option_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_TYPE)
    end
  end

  @[Extern]
  struct DHCP_OPTION_ARRAY
    property num_elements : UInt32
    property options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*
    def initialize(@num_elements : UInt32, @options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*)
    end
  end

  @[Extern]
  struct DHCP_OPTION_VALUE
    property option_id : UInt32
    property value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA
    def initialize(@option_id : UInt32, @value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA)
    end
  end

  @[Extern]
  struct DHCP_OPTION_VALUE_ARRAY
    property num_elements : UInt32
    property values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE*
    def initialize(@num_elements : UInt32, @values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE*)
    end
  end

  @[Extern]
  struct DHCP_RESERVED_SCOPE
    property reserved_ip_address : UInt32
    property reserved_ip_subnet_address : UInt32
    def initialize(@reserved_ip_address : UInt32, @reserved_ip_subnet_address : UInt32)
    end
  end

  @[Extern]
  struct DHCP_OPTION_SCOPE_INFO
    property scope_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_TYPE
    property scope_info : DHCP_OPTION_SCOPE_UNION_

    # Nested Type DHCP_OPTION_SCOPE_UNION_
    @[Extern(union: true)]
    struct DHCP_OPTION_SCOPE_UNION_
    property default_scope_info : Void*
    property global_scope_info : Void*
    property subnet_scope_info : UInt32
    property reserved_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVED_SCOPE
    property m_scope_info : Win32cr::Foundation::PWSTR
    def initialize(@default_scope_info : Void*, @global_scope_info : Void*, @subnet_scope_info : UInt32, @reserved_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVED_SCOPE, @m_scope_info : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@scope_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_TYPE, @scope_info : DHCP_OPTION_SCOPE_UNION_)
    end
  end

  @[Extern]
  struct DHCP_RESERVED_SCOPE6
    property reserved_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property reserved_ip_subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    def initialize(@reserved_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @reserved_ip_subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS)
    end
  end

  @[Extern]
  struct DHCP_OPTION_SCOPE_INFO6
    property scope_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_TYPE6
    property scope_info : DHCP_OPTION_SCOPE_UNION6

    # Nested Type DHCP_OPTION_SCOPE_UNION6
    @[Extern(union: true)]
    struct DHCP_OPTION_SCOPE_UNION6
    property default_scope_info : Void*
    property subnet_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property reserved_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVED_SCOPE6
    def initialize(@default_scope_info : Void*, @subnet_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @reserved_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVED_SCOPE6)
    end
    end

    def initialize(@scope_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_TYPE6, @scope_info : DHCP_OPTION_SCOPE_UNION6)
    end
  end

  @[Extern(union: true)]
  struct DHCP_OPTION_SCOPE_UNION6
    def initialize()
    end
  end

  @[Extern]
  struct DHCP_OPTION_LIST
    property num_options : UInt32
    property options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE*
    def initialize(@num_options : UInt32, @options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE*)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_ARRAY
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO**)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_VQ
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    property address_state : UInt8
    property status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus
    property probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property quarantine_capable : Win32cr::Foundation::BOOL
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8, @address_state : UInt8, @status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus, @probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @quarantine_capable : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_ARRAY_VQ
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ**)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_FILTER_STATUS_INFO
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    property address_state : UInt8
    property status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus
    property probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property quarantine_capable : Win32cr::Foundation::BOOL
    property filter_status : UInt32
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8, @address_state : UInt8, @status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus, @probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @quarantine_capable : Win32cr::Foundation::BOOL, @filter_status : UInt32)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_FILTER_STATUS_INFO**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_FILTER_STATUS_INFO**)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_PB
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    property address_state : UInt8
    property status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus
    property probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property quarantine_capable : Win32cr::Foundation::BOOL
    property filter_status : UInt32
    property policy_name : Win32cr::Foundation::PWSTR
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8, @address_state : UInt8, @status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus, @probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @quarantine_capable : Win32cr::Foundation::BOOL, @filter_status : UInt32, @policy_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_PB_ARRAY
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB**)
    end
  end

  @[Extern]
  struct DHCP_SEARCH_INFO
    property search_type : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_TYPE
    property search_info : DHCP_CLIENT_SEARCH_UNION

    # Nested Type DHCP_CLIENT_SEARCH_UNION
    @[Extern(union: true)]
    struct DHCP_CLIENT_SEARCH_UNION
    property client_ip_address : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    def initialize(@client_ip_address : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@search_type : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_TYPE, @search_info : DHCP_CLIENT_SEARCH_UNION)
    end
  end

  @[Extern(union: true)]
  struct DHCP_CLIENT_SEARCH_UNION
    def initialize()
    end
  end

  @[Extern]
  struct DHCP_PROPERTY
    property id : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ID
    property type__ : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_TYPE
    property value : DHCP_PROPERTY_VALUE_UNION_

    # Nested Type DHCP_PROPERTY_VALUE_UNION_
    @[Extern(union: true)]
    struct DHCP_PROPERTY_VALUE_UNION_
    property byte_value : UInt8
    property word_value : UInt16
    property d_word_value : UInt32
    property string_value : Win32cr::Foundation::PWSTR
    property binary_value : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    def initialize(@byte_value : UInt8, @word_value : UInt16, @d_word_value : UInt32, @string_value : Win32cr::Foundation::PWSTR, @binary_value : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA)
    end
    end

    def initialize(@id : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ID, @type__ : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_TYPE, @value : DHCP_PROPERTY_VALUE_UNION_)
    end
  end

  @[Extern]
  struct DHCP_PROPERTY_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_EX
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    property address_state : UInt8
    property status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus
    property probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property quarantine_capable : Win32cr::Foundation::BOOL
    property filter_status : UInt32
    property policy_name : Win32cr::Foundation::PWSTR
    property properties : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8, @address_state : UInt8, @status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus, @probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @quarantine_capable : Win32cr::Foundation::BOOL, @filter_status : UInt32, @policy_name : Win32cr::Foundation::PWSTR, @properties : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_EX_ARRAY
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX**)
    end
  end

  @[Extern]
  struct SCOPE_MIB_INFO
    property subnet : UInt32
    property num_addresses_inuse : UInt32
    property num_addresses_free : UInt32
    property num_pending_offers : UInt32
    def initialize(@subnet : UInt32, @num_addresses_inuse : UInt32, @num_addresses_free : UInt32, @num_pending_offers : UInt32)
    end
  end

  @[Extern]
  struct DHCP_MIB_INFO
    property discovers : UInt32
    property offers : UInt32
    property requests : UInt32
    property acks : UInt32
    property naks : UInt32
    property declines : UInt32
    property releases : UInt32
    property server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property scopes : UInt32
    property scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO*
    def initialize(@discovers : UInt32, @offers : UInt32, @requests : UInt32, @acks : UInt32, @naks : UInt32, @declines : UInt32, @releases : UInt32, @server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @scopes : UInt32, @scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO*)
    end
  end

  @[Extern]
  struct SCOPE_MIB_INFO_VQ
    property subnet : UInt32
    property num_addresses_inuse : UInt32
    property num_addresses_free : UInt32
    property num_pending_offers : UInt32
    property qtn_num_leases : UInt32
    property qtn_pct_qtn_leases : UInt32
    property qtn_probation_leases : UInt32
    property qtn_non_qtn_leases : UInt32
    property qtn_exempt_leases : UInt32
    property qtn_capable_clients : UInt32
    def initialize(@subnet : UInt32, @num_addresses_inuse : UInt32, @num_addresses_free : UInt32, @num_pending_offers : UInt32, @qtn_num_leases : UInt32, @qtn_pct_qtn_leases : UInt32, @qtn_probation_leases : UInt32, @qtn_non_qtn_leases : UInt32, @qtn_exempt_leases : UInt32, @qtn_capable_clients : UInt32)
    end
  end

  @[Extern]
  struct DHCP_MIB_INFO_VQ
    property discovers : UInt32
    property offers : UInt32
    property requests : UInt32
    property acks : UInt32
    property naks : UInt32
    property declines : UInt32
    property releases : UInt32
    property server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property qtn_num_leases : UInt32
    property qtn_pct_qtn_leases : UInt32
    property qtn_probation_leases : UInt32
    property qtn_non_qtn_leases : UInt32
    property qtn_exempt_leases : UInt32
    property qtn_capable_clients : UInt32
    property qtn_ias_errors : UInt32
    property scopes : UInt32
    property scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_VQ*
    def initialize(@discovers : UInt32, @offers : UInt32, @requests : UInt32, @acks : UInt32, @naks : UInt32, @declines : UInt32, @releases : UInt32, @server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @qtn_num_leases : UInt32, @qtn_pct_qtn_leases : UInt32, @qtn_probation_leases : UInt32, @qtn_non_qtn_leases : UInt32, @qtn_exempt_leases : UInt32, @qtn_capable_clients : UInt32, @qtn_ias_errors : UInt32, @scopes : UInt32, @scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_VQ*)
    end
  end

  @[Extern]
  struct SCOPE_MIB_INFO_V5
    property subnet : UInt32
    property num_addresses_inuse : UInt32
    property num_addresses_free : UInt32
    property num_pending_offers : UInt32
    def initialize(@subnet : UInt32, @num_addresses_inuse : UInt32, @num_addresses_free : UInt32, @num_pending_offers : UInt32)
    end
  end

  @[Extern]
  struct DHCP_MIB_INFO_V5
    property discovers : UInt32
    property offers : UInt32
    property requests : UInt32
    property acks : UInt32
    property naks : UInt32
    property declines : UInt32
    property releases : UInt32
    property server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property qtn_num_leases : UInt32
    property qtn_pct_qtn_leases : UInt32
    property qtn_probation_leases : UInt32
    property qtn_non_qtn_leases : UInt32
    property qtn_exempt_leases : UInt32
    property qtn_capable_clients : UInt32
    property qtn_ias_errors : UInt32
    property delayed_offers : UInt32
    property scopes_with_delayed_offers : UInt32
    property scopes : UInt32
    property scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_V5*
    def initialize(@discovers : UInt32, @offers : UInt32, @requests : UInt32, @acks : UInt32, @naks : UInt32, @declines : UInt32, @releases : UInt32, @server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @qtn_num_leases : UInt32, @qtn_pct_qtn_leases : UInt32, @qtn_probation_leases : UInt32, @qtn_non_qtn_leases : UInt32, @qtn_exempt_leases : UInt32, @qtn_capable_clients : UInt32, @qtn_ias_errors : UInt32, @delayed_offers : UInt32, @scopes_with_delayed_offers : UInt32, @scopes : UInt32, @scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_V5*)
    end
  end

  @[Extern]
  struct DHCP_SERVER_CONFIG_INFO
    property api_protocol_support : UInt32
    property database_name : Win32cr::Foundation::PWSTR
    property database_path : Win32cr::Foundation::PWSTR
    property backup_path : Win32cr::Foundation::PWSTR
    property backup_interval : UInt32
    property database_logging_flag : UInt32
    property restore_flag : UInt32
    property database_cleanup_interval : UInt32
    property debug_flag : UInt32
    def initialize(@api_protocol_support : UInt32, @database_name : Win32cr::Foundation::PWSTR, @database_path : Win32cr::Foundation::PWSTR, @backup_path : Win32cr::Foundation::PWSTR, @backup_interval : UInt32, @database_logging_flag : UInt32, @restore_flag : UInt32, @database_cleanup_interval : UInt32, @debug_flag : UInt32)
    end
  end

  @[Extern]
  struct DHCP_SCAN_ITEM
    property ip_address : UInt32
    property scan_flag : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_FLAG
    def initialize(@ip_address : UInt32, @scan_flag : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_FLAG)
    end
  end

  @[Extern]
  struct DHCP_SCAN_LIST
    property num_scan_items : UInt32
    property scan_items : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_ITEM*
    def initialize(@num_scan_items : UInt32, @scan_items : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_ITEM*)
    end
  end

  @[Extern]
  struct DHCP_CLASS_INFO
    property class_name : Win32cr::Foundation::PWSTR
    property class_comment : Win32cr::Foundation::PWSTR
    property class_data_length : UInt32
    property is_vendor : Win32cr::Foundation::BOOL
    property flags : UInt32
    property class_data : UInt8*
    def initialize(@class_name : Win32cr::Foundation::PWSTR, @class_comment : Win32cr::Foundation::PWSTR, @class_data_length : UInt32, @is_vendor : Win32cr::Foundation::BOOL, @flags : UInt32, @class_data : UInt8*)
    end
  end

  @[Extern]
  struct DHCP_CLASS_INFO_ARRAY
    property num_elements : UInt32
    property classes : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*
    def initialize(@num_elements : UInt32, @classes : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*)
    end
  end

  @[Extern]
  struct DHCP_CLASS_INFO_V6
    property class_name : Win32cr::Foundation::PWSTR
    property class_comment : Win32cr::Foundation::PWSTR
    property class_data_length : UInt32
    property is_vendor : Win32cr::Foundation::BOOL
    property enterprise_number : UInt32
    property flags : UInt32
    property class_data : UInt8*
    def initialize(@class_name : Win32cr::Foundation::PWSTR, @class_comment : Win32cr::Foundation::PWSTR, @class_data_length : UInt32, @is_vendor : Win32cr::Foundation::BOOL, @enterprise_number : UInt32, @flags : UInt32, @class_data : UInt8*)
    end
  end

  @[Extern]
  struct DHCP_CLASS_INFO_ARRAY_V6
    property num_elements : UInt32
    property classes : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*
    def initialize(@num_elements : UInt32, @classes : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*)
    end
  end

  @[Extern]
  struct DHCP_SERVER_SPECIFIC_STRINGS
    property default_vendor_class_name : Win32cr::Foundation::PWSTR
    property default_user_class_name : Win32cr::Foundation::PWSTR
    def initialize(@default_vendor_class_name : Win32cr::Foundation::PWSTR, @default_user_class_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DHCP_IP_RESERVATION_V4
    property reserved_ip_address : UInt32
    property reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*
    property bAllowedClientTypes : UInt8
    def initialize(@reserved_ip_address : UInt32, @reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*, @bAllowedClientTypes : UInt8)
    end
  end

  @[Extern]
  struct DHCP_IP_RESERVATION_INFO
    property reserved_ip_address : UInt32
    property reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property reserved_client_name : Win32cr::Foundation::PWSTR
    property reserved_client_desc : Win32cr::Foundation::PWSTR
    property bAllowedClientTypes : UInt8
    property fOptionsPresent : UInt8
    def initialize(@reserved_ip_address : UInt32, @reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @reserved_client_name : Win32cr::Foundation::PWSTR, @reserved_client_desc : Win32cr::Foundation::PWSTR, @bAllowedClientTypes : UInt8, @fOptionsPresent : UInt8)
    end
  end

  @[Extern]
  struct DHCP_RESERVATION_INFO_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_INFO**
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_INFO**)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_DATA_V4
    property element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE
    property element : DHCP_SUBNET_ELEMENT_UNION_V4

    # Nested Type DHCP_SUBNET_ELEMENT_UNION_V4
    @[Extern(union: true)]
    struct DHCP_SUBNET_ELEMENT_UNION_V4
    property ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*
    property secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*
    property reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V4*
    property exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*
    property ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*
    def initialize(@ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*, @secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*, @reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V4*, @exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*, @ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*)
    end
    end

    def initialize(@element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, @element : DHCP_SUBNET_ELEMENT_UNION_V4)
    end
  end

  @[Extern(union: true)]
  struct DHCP_SUBNET_ELEMENT_UNION_V4
    def initialize()
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_V4
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_ARRAY_V4
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4**)
    end
  end

  @[Extern]
  struct DHCP_SERVER_CONFIG_INFO_V4
    property api_protocol_support : UInt32
    property database_name : Win32cr::Foundation::PWSTR
    property database_path : Win32cr::Foundation::PWSTR
    property backup_path : Win32cr::Foundation::PWSTR
    property backup_interval : UInt32
    property database_logging_flag : UInt32
    property restore_flag : UInt32
    property database_cleanup_interval : UInt32
    property debug_flag : UInt32
    property dwPingRetries : UInt32
    property cbBootTableString : UInt32
    property wszBootTableString : Win32cr::Foundation::PWSTR
    property fAuditLog : Win32cr::Foundation::BOOL
    def initialize(@api_protocol_support : UInt32, @database_name : Win32cr::Foundation::PWSTR, @database_path : Win32cr::Foundation::PWSTR, @backup_path : Win32cr::Foundation::PWSTR, @backup_interval : UInt32, @database_logging_flag : UInt32, @restore_flag : UInt32, @database_cleanup_interval : UInt32, @debug_flag : UInt32, @dwPingRetries : UInt32, @cbBootTableString : UInt32, @wszBootTableString : Win32cr::Foundation::PWSTR, @fAuditLog : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DHCP_SERVER_CONFIG_INFO_VQ
    property api_protocol_support : UInt32
    property database_name : Win32cr::Foundation::PWSTR
    property database_path : Win32cr::Foundation::PWSTR
    property backup_path : Win32cr::Foundation::PWSTR
    property backup_interval : UInt32
    property database_logging_flag : UInt32
    property restore_flag : UInt32
    property database_cleanup_interval : UInt32
    property debug_flag : UInt32
    property dwPingRetries : UInt32
    property cbBootTableString : UInt32
    property wszBootTableString : Win32cr::Foundation::PWSTR
    property fAuditLog : Win32cr::Foundation::BOOL
    property quarantine_on : Win32cr::Foundation::BOOL
    property quar_def_fail : UInt32
    property quar_runtime_status : Win32cr::Foundation::BOOL
    def initialize(@api_protocol_support : UInt32, @database_name : Win32cr::Foundation::PWSTR, @database_path : Win32cr::Foundation::PWSTR, @backup_path : Win32cr::Foundation::PWSTR, @backup_interval : UInt32, @database_logging_flag : UInt32, @restore_flag : UInt32, @database_cleanup_interval : UInt32, @debug_flag : UInt32, @dwPingRetries : UInt32, @cbBootTableString : UInt32, @wszBootTableString : Win32cr::Foundation::PWSTR, @fAuditLog : Win32cr::Foundation::BOOL, @quarantine_on : Win32cr::Foundation::BOOL, @quar_def_fail : UInt32, @quar_runtime_status : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DHCP_SERVER_CONFIG_INFO_V6
    property unicast_flag : Win32cr::Foundation::BOOL
    property rapid_commit_flag : Win32cr::Foundation::BOOL
    property preferred_lifetime : UInt32
    property valid_lifetime : UInt32
    property t1 : UInt32
    property t2 : UInt32
    property preferred_lifetime_iata : UInt32
    property valid_lifetime_iata : UInt32
    property fAuditLog : Win32cr::Foundation::BOOL
    def initialize(@unicast_flag : Win32cr::Foundation::BOOL, @rapid_commit_flag : Win32cr::Foundation::BOOL, @preferred_lifetime : UInt32, @valid_lifetime : UInt32, @t1 : UInt32, @t2 : UInt32, @preferred_lifetime_iata : UInt32, @valid_lifetime_iata : UInt32, @fAuditLog : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DHCP_SUPER_SCOPE_TABLE_ENTRY
    property subnet_address : UInt32
    property super_scope_number : UInt32
    property next_in_super_scope : UInt32
    property super_scope_name : Win32cr::Foundation::PWSTR
    def initialize(@subnet_address : UInt32, @super_scope_number : UInt32, @next_in_super_scope : UInt32, @super_scope_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DHCP_SUPER_SCOPE_TABLE
    property cEntries : UInt32
    property pEntries : Win32cr::NetworkManagement::Dhcp::DHCP_SUPER_SCOPE_TABLE_ENTRY*
    def initialize(@cEntries : UInt32, @pEntries : Win32cr::NetworkManagement::Dhcp::DHCP_SUPER_SCOPE_TABLE_ENTRY*)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_V5
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    property address_state : UInt8
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8, @address_state : UInt8)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_ARRAY_V5
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V5**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V5**)
    end
  end

  @[Extern]
  struct DHCP_ALL_OPTIONS
    property flags : UInt32
    property non_vendor_options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY*
    property num_vendor_options : UInt32
    property vendor_options : Anonymous_e__Struct_*

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property option : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION
    property vendor_name : Win32cr::Foundation::PWSTR
    property class_name : Win32cr::Foundation::PWSTR
    def initialize(@option : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION, @vendor_name : Win32cr::Foundation::PWSTR, @class_name : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@flags : UInt32, @non_vendor_options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY*, @num_vendor_options : UInt32, @vendor_options : Anonymous_e__Struct_*)
    end
  end

  @[Extern]
  struct DHCP_ALL_OPTION_VALUES
    property flags : UInt32
    property num_elements : UInt32
    property options : Anonymous_e__Struct_*

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property class_name : Win32cr::Foundation::PWSTR
    property vendor_name : Win32cr::Foundation::PWSTR
    property is_vendor : Win32cr::Foundation::BOOL
    property options_array : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*
    def initialize(@class_name : Win32cr::Foundation::PWSTR, @vendor_name : Win32cr::Foundation::PWSTR, @is_vendor : Win32cr::Foundation::BOOL, @options_array : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*)
    end
    end

    def initialize(@flags : UInt32, @num_elements : UInt32, @options : Anonymous_e__Struct_*)
    end
  end

  @[Extern]
  struct DHCP_ALL_OPTION_VALUES_PB
    property flags : UInt32
    property num_elements : UInt32
    property options : Anonymous_e__Struct_*

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property policy_name : Win32cr::Foundation::PWSTR
    property vendor_name : Win32cr::Foundation::PWSTR
    property is_vendor : Win32cr::Foundation::BOOL
    property options_array : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*
    def initialize(@policy_name : Win32cr::Foundation::PWSTR, @vendor_name : Win32cr::Foundation::PWSTR, @is_vendor : Win32cr::Foundation::BOOL, @options_array : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*)
    end
    end

    def initialize(@flags : UInt32, @num_elements : UInt32, @options : Anonymous_e__Struct_*)
    end
  end

  @[Extern]
  struct DHCPDS_SERVER
    property version : UInt32
    property server_name : Win32cr::Foundation::PWSTR
    property server_address : UInt32
    property flags : UInt32
    property state : UInt32
    property ds_location : Win32cr::Foundation::PWSTR
    property ds_loc_type : UInt32
    def initialize(@version : UInt32, @server_name : Win32cr::Foundation::PWSTR, @server_address : UInt32, @flags : UInt32, @state : UInt32, @ds_location : Win32cr::Foundation::PWSTR, @ds_loc_type : UInt32)
    end
  end

  @[Extern]
  struct DHCPDS_SERVERS
    property flags : UInt32
    property num_elements : UInt32
    property servers : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*
    def initialize(@flags : UInt32, @num_elements : UInt32, @servers : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*)
    end
  end

  @[Extern]
  struct DHCP_ATTRIB
    property dhcp_attrib_id : UInt32
    property dhcp_attrib_type : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property dhcp_attrib_bool : Win32cr::Foundation::BOOL
    property dhcp_attrib_ulong : UInt32
    def initialize(@dhcp_attrib_bool : Win32cr::Foundation::BOOL, @dhcp_attrib_ulong : UInt32)
    end
    end

    def initialize(@dhcp_attrib_id : UInt32, @dhcp_attrib_type : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DHCP_ATTRIB_ARRAY
    property num_elements : UInt32
    property dhcp_attribs : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB*
    def initialize(@num_elements : UInt32, @dhcp_attribs : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB*)
    end
  end

  @[Extern]
  struct DHCP_BOOTP_IP_RANGE
    property start_address : UInt32
    property end_address : UInt32
    property bootp_allocated : UInt32
    property max_bootp_allowed : UInt32
    def initialize(@start_address : UInt32, @end_address : UInt32, @bootp_allocated : UInt32, @max_bootp_allowed : UInt32)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_DATA_V5
    property element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE
    property element : DHCP_SUBNET_ELEMENT_UNION_V5_

    # Nested Type DHCP_SUBNET_ELEMENT_UNION_V5_
    @[Extern(union: true)]
    struct DHCP_SUBNET_ELEMENT_UNION_V5_
    property ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_BOOTP_IP_RANGE*
    property secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*
    property reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V4*
    property exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*
    property ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*
    def initialize(@ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_BOOTP_IP_RANGE*, @secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*, @reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V4*, @exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*, @ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*)
    end
    end

    def initialize(@element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, @element : DHCP_SUBNET_ELEMENT_UNION_V5_)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*)
    end
  end

  @[Extern]
  struct DHCP_PERF_STATS
    property dwNumPacketsReceived : UInt32
    property dwNumPacketsDuplicate : UInt32
    property dwNumPacketsExpired : UInt32
    property dwNumMilliSecondsProcessed : UInt32
    property dwNumPacketsInActiveQueue : UInt32
    property dwNumPacketsInPingQueue : UInt32
    property dwNumDiscoversReceived : UInt32
    property dwNumOffersSent : UInt32
    property dwNumRequestsReceived : UInt32
    property dwNumInformsReceived : UInt32
    property dwNumAcksSent : UInt32
    property dwNumNacksSent : UInt32
    property dwNumDeclinesReceived : UInt32
    property dwNumReleasesReceived : UInt32
    property dwNumDelayedOfferInQueue : UInt32
    property dwNumPacketsProcessed : UInt32
    property dwNumPacketsInQuarWaitingQueue : UInt32
    property dwNumPacketsInQuarReadyQueue : UInt32
    property dwNumPacketsInQuarDecisionQueue : UInt32
    def initialize(@dwNumPacketsReceived : UInt32, @dwNumPacketsDuplicate : UInt32, @dwNumPacketsExpired : UInt32, @dwNumMilliSecondsProcessed : UInt32, @dwNumPacketsInActiveQueue : UInt32, @dwNumPacketsInPingQueue : UInt32, @dwNumDiscoversReceived : UInt32, @dwNumOffersSent : UInt32, @dwNumRequestsReceived : UInt32, @dwNumInformsReceived : UInt32, @dwNumAcksSent : UInt32, @dwNumNacksSent : UInt32, @dwNumDeclinesReceived : UInt32, @dwNumReleasesReceived : UInt32, @dwNumDelayedOfferInQueue : UInt32, @dwNumPacketsProcessed : UInt32, @dwNumPacketsInQuarWaitingQueue : UInt32, @dwNumPacketsInQuarReadyQueue : UInt32, @dwNumPacketsInQuarDecisionQueue : UInt32)
    end
  end

  @[Extern]
  struct DHCP_BIND_ELEMENT
    property flags : UInt32
    property fBoundToDHCPServer : Win32cr::Foundation::BOOL
    property adapter_primary_address : UInt32
    property adapter_subnet_address : UInt32
    property if_description : Win32cr::Foundation::PWSTR
    property if_id_size : UInt32
    property if_id : UInt8*
    def initialize(@flags : UInt32, @fBoundToDHCPServer : Win32cr::Foundation::BOOL, @adapter_primary_address : UInt32, @adapter_subnet_address : UInt32, @if_description : Win32cr::Foundation::PWSTR, @if_id_size : UInt32, @if_id : UInt8*)
    end
  end

  @[Extern]
  struct DHCP_BIND_ELEMENT_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT*)
    end
  end

  @[Extern]
  struct DHCPV6_BIND_ELEMENT
    property flags : UInt32
    property fBoundToDHCPServer : Win32cr::Foundation::BOOL
    property adapter_primary_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property adapter_subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property if_description : Win32cr::Foundation::PWSTR
    property ip_v6_if_index : UInt32
    property if_id_size : UInt32
    property if_id : UInt8*
    def initialize(@flags : UInt32, @fBoundToDHCPServer : Win32cr::Foundation::BOOL, @adapter_primary_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @adapter_subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @if_description : Win32cr::Foundation::PWSTR, @ip_v6_if_index : UInt32, @if_id_size : UInt32, @if_id : UInt8*)
    end
  end

  @[Extern]
  struct DHCPV6_BIND_ELEMENT_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT*)
    end
  end

  @[Extern]
  struct DHCP_IP_RANGE_V6
    property start_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property end_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    def initialize(@start_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @end_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS)
    end
  end

  @[Extern]
  struct DHCP_HOST_INFO_V6
    property ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property net_bios_name : Win32cr::Foundation::PWSTR
    property host_name : Win32cr::Foundation::PWSTR
    def initialize(@ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @net_bios_name : Win32cr::Foundation::PWSTR, @host_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_INFO_V6
    property subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property prefix : UInt32
    property preference : UInt16
    property subnet_name : Win32cr::Foundation::PWSTR
    property subnet_comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property scope_id : UInt32
    def initialize(@subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @prefix : UInt32, @preference : UInt16, @subnet_name : Win32cr::Foundation::PWSTR, @subnet_comment : Win32cr::Foundation::PWSTR, @state : UInt32, @scope_id : UInt32)
    end
  end

  @[Extern]
  struct SCOPE_MIB_INFO_V6
    property subnet : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property num_addresses_inuse : UInt64
    property num_addresses_free : UInt64
    property num_pending_advertises : UInt64
    def initialize(@subnet : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @num_addresses_inuse : UInt64, @num_addresses_free : UInt64, @num_pending_advertises : UInt64)
    end
  end

  @[Extern]
  struct DHCP_MIB_INFO_V6
    property solicits : UInt32
    property advertises : UInt32
    property requests : UInt32
    property renews : UInt32
    property rebinds : UInt32
    property replies : UInt32
    property confirms : UInt32
    property declines : UInt32
    property releases : UInt32
    property informs : UInt32
    property server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property scopes : UInt32
    property scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_V6*
    def initialize(@solicits : UInt32, @advertises : UInt32, @requests : UInt32, @renews : UInt32, @rebinds : UInt32, @replies : UInt32, @confirms : UInt32, @declines : UInt32, @releases : UInt32, @informs : UInt32, @server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @scopes : UInt32, @scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_V6*)
    end
  end

  @[Extern]
  struct DHCP_IP_RESERVATION_V6
    property reserved_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*
    property interface_id : UInt32
    def initialize(@reserved_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*, @interface_id : UInt32)
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_DATA_V6
    property element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE_V6
    property element : DHCP_SUBNET_ELEMENT_UNION_V6

    # Nested Type DHCP_SUBNET_ELEMENT_UNION_V6
    @[Extern(union: true)]
    struct DHCP_SUBNET_ELEMENT_UNION_V6
    property ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_V6*
    property reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V6*
    property exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_V6*
    def initialize(@ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_V6*, @reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V6*, @exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_V6*)
    end
    end

    def initialize(@element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE_V6, @element : DHCP_SUBNET_ELEMENT_UNION_V6)
    end
  end

  @[Extern(union: true)]
  struct DHCP_SUBNET_ELEMENT_UNION_V6
    def initialize()
    end
  end

  @[Extern]
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_V6
    property client_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property client_duid : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property address_type : UInt32
    property iaid : UInt32
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_valid_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property client_pref_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO_V6
    def initialize(@client_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @client_duid : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @address_type : UInt32, @iaid : UInt32, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_valid_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @client_pref_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO_V6)
    end
  end

  @[Extern]
  struct DHCPV6_IP_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS*)
    end
  end

  @[Extern]
  struct DHCP_CLIENT_INFO_ARRAY_V6
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6**)
    end
  end

  @[Extern]
  struct DHCP_SEARCH_INFO_V6
    property search_type : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_TYPE_V6
    property search_info : DHCP_CLIENT_SEARCH_UNION_V6_

    # Nested Type DHCP_CLIENT_SEARCH_UNION_V6_
    @[Extern(union: true)]
    struct DHCP_CLIENT_SEARCH_UNION_V6_
    property client_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property client_duid : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    def initialize(@client_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @client_duid : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@search_type : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_TYPE_V6, @search_info : DHCP_CLIENT_SEARCH_UNION_V6_)
    end
  end

  @[Extern]
  struct DHCP_POL_COND
    property parent_expr : UInt32
    property type__ : Win32cr::NetworkManagement::Dhcp::DHCP_POL_ATTR_TYPE
    property option_id : UInt32
    property sub_option_id : UInt32
    property vendor_name : Win32cr::Foundation::PWSTR
    property operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COMPARATOR
    property value : UInt8*
    property value_length : UInt32
    def initialize(@parent_expr : UInt32, @type__ : Win32cr::NetworkManagement::Dhcp::DHCP_POL_ATTR_TYPE, @option_id : UInt32, @sub_option_id : UInt32, @vendor_name : Win32cr::Foundation::PWSTR, @operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COMPARATOR, @value : UInt8*, @value_length : UInt32)
    end
  end

  @[Extern]
  struct DHCP_POL_COND_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND*)
    end
  end

  @[Extern]
  struct DHCP_POL_EXPR
    property parent_expr : UInt32
    property operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER
    def initialize(@parent_expr : UInt32, @operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER)
    end
  end

  @[Extern]
  struct DHCP_POL_EXPR_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR*)
    end
  end

  @[Extern]
  struct DHCP_IP_RANGE_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*)
    end
  end

  @[Extern]
  struct DHCP_POLICY
    property policy_name : Win32cr::Foundation::PWSTR
    property is_global_policy : Win32cr::Foundation::BOOL
    property subnet : UInt32
    property processing_order : UInt32
    property conditions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND_ARRAY*
    property expressions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR_ARRAY*
    property ranges : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_ARRAY*
    property description : Win32cr::Foundation::PWSTR
    property enabled : Win32cr::Foundation::BOOL
    def initialize(@policy_name : Win32cr::Foundation::PWSTR, @is_global_policy : Win32cr::Foundation::BOOL, @subnet : UInt32, @processing_order : UInt32, @conditions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND_ARRAY*, @expressions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR_ARRAY*, @ranges : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_ARRAY*, @description : Win32cr::Foundation::PWSTR, @enabled : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DHCP_POLICY_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*)
    end
  end

  @[Extern]
  struct DHCP_POLICY_EX
    property policy_name : Win32cr::Foundation::PWSTR
    property is_global_policy : Win32cr::Foundation::BOOL
    property subnet : UInt32
    property processing_order : UInt32
    property conditions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND_ARRAY*
    property expressions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR_ARRAY*
    property ranges : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_ARRAY*
    property description : Win32cr::Foundation::PWSTR
    property enabled : Win32cr::Foundation::BOOL
    property properties : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*
    def initialize(@policy_name : Win32cr::Foundation::PWSTR, @is_global_policy : Win32cr::Foundation::BOOL, @subnet : UInt32, @processing_order : UInt32, @conditions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND_ARRAY*, @expressions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR_ARRAY*, @ranges : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_ARRAY*, @description : Win32cr::Foundation::PWSTR, @enabled : Win32cr::Foundation::BOOL, @properties : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*)
    end
  end

  @[Extern]
  struct DHCP_POLICY_EX_ARRAY
    property num_elements : UInt32
    property elements : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*
    def initialize(@num_elements : UInt32, @elements : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*)
    end
  end

  @[Extern]
  struct DHCPV6_STATELESS_PARAMS
    property status : Win32cr::Foundation::BOOL
    property purge_interval : UInt32
    def initialize(@status : Win32cr::Foundation::BOOL, @purge_interval : UInt32)
    end
  end

  @[Extern]
  struct DHCPV6_STATELESS_SCOPE_STATS
    property subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS
    property num_stateless_clients_added : UInt64
    property num_stateless_clients_removed : UInt64
    def initialize(@subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, @num_stateless_clients_added : UInt64, @num_stateless_clients_removed : UInt64)
    end
  end

  @[Extern]
  struct DHCPV6_STATELESS_STATS
    property num_scopes : UInt32
    property scope_stats : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_SCOPE_STATS*
    def initialize(@num_scopes : UInt32, @scope_stats : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_SCOPE_STATS*)
    end
  end

  @[Extern]
  struct DHCP_FAILOVER_RELATIONSHIP
    property primary_server : UInt32
    property secondary_server : UInt32
    property mode : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_MODE
    property server_type : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_SERVER
    property state : Win32cr::NetworkManagement::Dhcp::FSM_STATE
    property prev_state : Win32cr::NetworkManagement::Dhcp::FSM_STATE
    property mclt : UInt32
    property safe_period : UInt32
    property relationship_name : Win32cr::Foundation::PWSTR
    property primary_server_name : Win32cr::Foundation::PWSTR
    property secondary_server_name : Win32cr::Foundation::PWSTR
    property pScopes : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY*
    property percentage : UInt8
    property shared_secret : Win32cr::Foundation::PWSTR
    def initialize(@primary_server : UInt32, @secondary_server : UInt32, @mode : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_MODE, @server_type : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_SERVER, @state : Win32cr::NetworkManagement::Dhcp::FSM_STATE, @prev_state : Win32cr::NetworkManagement::Dhcp::FSM_STATE, @mclt : UInt32, @safe_period : UInt32, @relationship_name : Win32cr::Foundation::PWSTR, @primary_server_name : Win32cr::Foundation::PWSTR, @secondary_server_name : Win32cr::Foundation::PWSTR, @pScopes : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY*, @percentage : UInt8, @shared_secret : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DHCP_FAILOVER_RELATIONSHIP_ARRAY
    property num_elements : UInt32
    property pRelationships : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*
    def initialize(@num_elements : UInt32, @pRelationships : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*)
    end
  end

  @[Extern]
  struct DHCPV4_FAILOVER_CLIENT_INFO
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    property address_state : UInt8
    property status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus
    property probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property quarantine_capable : Win32cr::Foundation::BOOL
    property sent_pot_exp_time : UInt32
    property ack_pot_exp_time : UInt32
    property recv_pot_exp_time : UInt32
    property start_time : UInt32
    property clt_last_trans_time : UInt32
    property last_bnd_upd_time : UInt32
    property bnd_msg_status : UInt32
    property policy_name : Win32cr::Foundation::PWSTR
    property flags : UInt8
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8, @address_state : UInt8, @status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus, @probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @quarantine_capable : Win32cr::Foundation::BOOL, @sent_pot_exp_time : UInt32, @ack_pot_exp_time : UInt32, @recv_pot_exp_time : UInt32, @start_time : UInt32, @clt_last_trans_time : UInt32, @last_bnd_upd_time : UInt32, @bnd_msg_status : UInt32, @policy_name : Win32cr::Foundation::PWSTR, @flags : UInt8)
    end
  end

  @[Extern]
  struct DHCPV4_FAILOVER_CLIENT_INFO_ARRAY
    property num_elements : UInt32
    property clients : Win32cr::NetworkManagement::Dhcp::DHCPV4_FAILOVER_CLIENT_INFO**
    def initialize(@num_elements : UInt32, @clients : Win32cr::NetworkManagement::Dhcp::DHCPV4_FAILOVER_CLIENT_INFO**)
    end
  end

  @[Extern]
  struct DHCPV4_FAILOVER_CLIENT_INFO_EX
    property client_ip_address : UInt32
    property subnet_mask : UInt32
    property client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA
    property client_name : Win32cr::Foundation::PWSTR
    property client_comment : Win32cr::Foundation::PWSTR
    property client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO
    property bClientType : UInt8
    property address_state : UInt8
    property status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus
    property probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME
    property quarantine_capable : Win32cr::Foundation::BOOL
    property sent_pot_exp_time : UInt32
    property ack_pot_exp_time : UInt32
    property recv_pot_exp_time : UInt32
    property start_time : UInt32
    property clt_last_trans_time : UInt32
    property last_bnd_upd_time : UInt32
    property bnd_msg_status : UInt32
    property policy_name : Win32cr::Foundation::PWSTR
    property flags : UInt8
    property address_state_ex : UInt32
    def initialize(@client_ip_address : UInt32, @subnet_mask : UInt32, @client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA, @client_name : Win32cr::Foundation::PWSTR, @client_comment : Win32cr::Foundation::PWSTR, @client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO, @bClientType : UInt8, @address_state : UInt8, @status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus, @probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME, @quarantine_capable : Win32cr::Foundation::BOOL, @sent_pot_exp_time : UInt32, @ack_pot_exp_time : UInt32, @recv_pot_exp_time : UInt32, @start_time : UInt32, @clt_last_trans_time : UInt32, @last_bnd_upd_time : UInt32, @bnd_msg_status : UInt32, @policy_name : Win32cr::Foundation::PWSTR, @flags : UInt8, @address_state_ex : UInt32)
    end
  end

  @[Extern]
  struct DHCP_FAILOVER_STATISTICS
    property num_addr : UInt32
    property addr_free : UInt32
    property addr_in_use : UInt32
    property partner_addr_free : UInt32
    property this_addr_free : UInt32
    property partner_addr_in_use : UInt32
    property this_addr_in_use : UInt32
    def initialize(@num_addr : UInt32, @addr_free : UInt32, @addr_in_use : UInt32, @partner_addr_free : UInt32, @this_addr_free : UInt32, @partner_addr_in_use : UInt32, @this_addr_in_use : UInt32)
    end
  end

  {% if flag?(:i386) %}
  @[Extern]
  struct DHCP_SERVER_OPTIONS
    property message_type : UInt8*
    property subnet_mask : UInt32*
    property requested_address : UInt32*
    property request_lease_time : UInt32*
    property overlay_fields : UInt8*
    property router_address : UInt32*
    property server : UInt32*
    property parameter_request_list : UInt8*
    property parameter_request_list_length : UInt32
    property machine_name : Win32cr::Foundation::PSTR
    property machine_name_length : UInt32
    property client_hardware_address_type : UInt8
    property client_hardware_address_length : UInt8
    property client_hardware_address : UInt8*
    property class_identifier : Win32cr::Foundation::PSTR
    property class_identifier_length : UInt32
    property vendor_class : UInt8*
    property vendor_class_length : UInt32
    property dns_flags : UInt32
    property dns_name_length : UInt32
    property dns_name : UInt8*
    property ds_domain_name_requested : Win32cr::Foundation::BOOLEAN
    property ds_domain_name : Win32cr::Foundation::PSTR
    property ds_domain_name_len : UInt32
    property scope_id : UInt32*
    def initialize(@message_type : UInt8*, @subnet_mask : UInt32*, @requested_address : UInt32*, @request_lease_time : UInt32*, @overlay_fields : UInt8*, @router_address : UInt32*, @server : UInt32*, @parameter_request_list : UInt8*, @parameter_request_list_length : UInt32, @machine_name : Win32cr::Foundation::PSTR, @machine_name_length : UInt32, @client_hardware_address_type : UInt8, @client_hardware_address_length : UInt8, @client_hardware_address : UInt8*, @class_identifier : Win32cr::Foundation::PSTR, @class_identifier_length : UInt32, @vendor_class : UInt8*, @vendor_class_length : UInt32, @dns_flags : UInt32, @dns_name_length : UInt32, @dns_name : UInt8*, @ds_domain_name_requested : Win32cr::Foundation::BOOLEAN, @ds_domain_name : Win32cr::Foundation::PSTR, @ds_domain_name_len : UInt32, @scope_id : UInt32*)
    end
  end
  {% end %}

  def dhcpv6CApiInitialize(version : UInt32*) : Void
    C.Dhcpv6CApiInitialize(version)
  end

  def dhcpv6CApiCleanup : Void
    C.Dhcpv6CApiCleanup
  end

  def dhcpv6RequestParams(forceNewInform : Win32cr::Foundation::BOOL, reserved : Void*, adapterName : Win32cr::Foundation::PWSTR, classId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, recdParams : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_PARAMS_ARRAY, buffer : UInt8*, pSize : UInt32*) : UInt32
    C.Dhcpv6RequestParams(forceNewInform, reserved, adapterName, classId, recdParams, buffer, pSize)
  end

  def dhcpv6RequestPrefix(adapterName : Win32cr::Foundation::PWSTR, pclassId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, prefixleaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*, pdwTimeToWait : UInt32*) : UInt32
    C.Dhcpv6RequestPrefix(adapterName, pclassId, prefixleaseInfo, pdwTimeToWait)
  end

  def dhcpv6RenewPrefix(adapterName : Win32cr::Foundation::PWSTR, pclassId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, prefixleaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*, pdwTimeToWait : UInt32*, bValidatePrefix : UInt32) : UInt32
    C.Dhcpv6RenewPrefix(adapterName, pclassId, prefixleaseInfo, pdwTimeToWait, bValidatePrefix)
  end

  def dhcpv6ReleasePrefix(adapterName : Win32cr::Foundation::PWSTR, classId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, leaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*) : UInt32
    C.Dhcpv6ReleasePrefix(adapterName, classId, leaseInfo)
  end

  def dhcpCApiInitialize(version : UInt32*) : UInt32
    C.DhcpCApiInitialize(version)
  end

  def dhcpCApiCleanup : Void
    C.DhcpCApiCleanup
  end

  def dhcpRequestParams(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, class_id : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_CLASSID*, send_params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, recd_params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, buffer : UInt8*, pSize : UInt32*, request_id_str : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpRequestParams(flags, reserved, adapter_name, class_id, send_params, recd_params, buffer, pSize, request_id_str)
  end

  def dhcpUndoRequestParams(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, request_id_str : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpUndoRequestParams(flags, reserved, adapter_name, request_id_str)
  end

  def dhcpRegisterParamChange(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, class_id : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_CLASSID*, params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, handle : Void*) : UInt32
    C.DhcpRegisterParamChange(flags, reserved, adapter_name, class_id, params, handle)
  end

  def dhcpDeRegisterParamChange(flags : UInt32, reserved : Void*, event : Void*) : UInt32
    C.DhcpDeRegisterParamChange(flags, reserved, event)
  end

  def dhcpRemoveDNSRegistrations : UInt32
    C.DhcpRemoveDNSRegistrations
  end

  def dhcpGetOriginalSubnetMask(sAdapterName : Win32cr::Foundation::PWSTR, dwSubnetMask : UInt32*) : UInt32
    C.DhcpGetOriginalSubnetMask(sAdapterName, dwSubnetMask)
  end

  def dhcpAddFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, add_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_ADD_INFO*, force_flag : Win32cr::Foundation::BOOL) : UInt32
    C.DhcpAddFilterV4(server_ip_address, add_filter_info, force_flag)
  end

  def dhcpDeleteFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, delete_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN*) : UInt32
    C.DhcpDeleteFilterV4(server_ip_address, delete_filter_info)
  end

  def dhcpSetFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, global_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_GLOBAL_INFO*) : UInt32
    C.DhcpSetFilterV4(server_ip_address, global_filter_info)
  end

  def dhcpGetFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, global_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_GLOBAL_INFO*) : UInt32
    C.DhcpGetFilterV4(server_ip_address, global_filter_info)
  end

  def dhcpEnumFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN*, preferred_maximum : UInt32, list_type : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_LIST_TYPE, enum_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_ENUM_INFO**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpEnumFilterV4(server_ip_address, resume_handle, preferred_maximum, list_type, enum_filter_info, elements_read, elements_total)
  end

  def dhcpCreateSubnet(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO*) : UInt32
    C.DhcpCreateSubnet(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpSetSubnetInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO*) : UInt32
    C.DhcpSetSubnetInfo(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpGetSubnetInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO**) : UInt32
    C.DhcpGetSubnetInfo(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpEnumSubnets(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpEnumSubnets(server_ip_address, resume_handle, preferred_maximum, enum_info, elements_read, elements_total)
  end

  def dhcpAddSubnetElement(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*) : UInt32
    C.DhcpAddSubnetElement(server_ip_address, subnet_address, add_element_info)
  end

  def dhcpEnumSubnetElements(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpEnumSubnetElements(server_ip_address, subnet_address, enum_element_type, resume_handle, preferred_maximum, enum_element_info, elements_read, elements_total)
  end

  def dhcpRemoveSubnetElement(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32
    C.DhcpRemoveSubnetElement(server_ip_address, subnet_address, remove_element_info, force_flag)
  end

  def dhcpDeleteSubnet(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32
    C.DhcpDeleteSubnet(server_ip_address, subnet_address, force_flag)
  end

  def dhcpCreateOption(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32
    C.DhcpCreateOption(server_ip_address, option_id, option_info)
  end

  def dhcpSetOptionInfo(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32
    C.DhcpSetOptionInfo(server_ip_address, option_id, option_info)
  end

  def dhcpGetOptionInfo(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32
    C.DhcpGetOptionInfo(server_ip_address, option_id, option_info)
  end

  def dhcpEnumOptions(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32
    C.DhcpEnumOptions(server_ip_address, resume_handle, preferred_maximum, options, options_read, options_total)
  end

  def dhcpRemoveOption(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32) : UInt32
    C.DhcpRemoveOption(server_ip_address, option_id)
  end

  def dhcpSetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32
    C.DhcpSetOptionValue(server_ip_address, option_id, scope_info, option_value)
  end

  def dhcpSetOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32
    C.DhcpSetOptionValues(server_ip_address, scope_info, option_values)
  end

  def dhcpGetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32
    C.DhcpGetOptionValue(server_ip_address, option_id, scope_info, option_value)
  end

  def dhcpEnumOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32
    C.DhcpEnumOptionValues(server_ip_address, scope_info, resume_handle, preferred_maximum, option_values, options_read, options_total)
  end

  def dhcpRemoveOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32
    C.DhcpRemoveOptionValue(server_ip_address, option_id, scope_info)
  end

  def dhcpCreateClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ*) : UInt32
    C.DhcpCreateClientInfoVQ(server_ip_address, client_info)
  end

  def dhcpSetClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ*) : UInt32
    C.DhcpSetClientInfoVQ(server_ip_address, client_info)
  end

  def dhcpGetClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ**) : UInt32
    C.DhcpGetClientInfoVQ(server_ip_address, search_info, client_info)
  end

  def dhcpEnumSubnetClientsVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_VQ**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpEnumSubnetClientsVQ(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpEnumSubnetClientsFilterStatusInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpEnumSubnetClientsFilterStatusInfo(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpCreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO*) : UInt32
    C.DhcpCreateClientInfo(server_ip_address, client_info)
  end

  def dhcpSetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO*) : UInt32
    C.DhcpSetClientInfo(server_ip_address, client_info)
  end

  def dhcpGetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO**) : UInt32
    C.DhcpGetClientInfo(server_ip_address, search_info, client_info)
  end

  def dhcpDeleteClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*) : UInt32
    C.DhcpDeleteClientInfo(server_ip_address, client_info)
  end

  def dhcpEnumSubnetClients(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpEnumSubnetClients(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpGetClientOptions(server_ip_address : Win32cr::Foundation::PWSTR, client_ip_address : UInt32, client_subnet_mask : UInt32, client_options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_LIST**) : UInt32
    C.DhcpGetClientOptions(server_ip_address, client_ip_address, client_subnet_mask, client_options)
  end

  def dhcpGetMibInfo(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO**) : UInt32
    C.DhcpGetMibInfo(server_ip_address, mib_info)
  end

  def dhcpServerSetConfig(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO*) : UInt32
    C.DhcpServerSetConfig(server_ip_address, fields_to_set, config_info)
  end

  def dhcpServerGetConfig(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO**) : UInt32
    C.DhcpServerGetConfig(server_ip_address, config_info)
  end

  def dhcpScanDatabase(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, fix_flag : UInt32, scan_list : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_LIST**) : UInt32
    C.DhcpScanDatabase(server_ip_address, subnet_address, fix_flag, scan_list)
  end

  def dhcpRpcFreeMemory(buffer_pointer : Void*) : Void
    C.DhcpRpcFreeMemory(buffer_pointer)
  end

  def dhcpGetVersion(server_ip_address : Win32cr::Foundation::PWSTR, major_version : UInt32*, minor_version : UInt32*) : UInt32
    C.DhcpGetVersion(server_ip_address, major_version, minor_version)
  end

  def dhcpAddSubnetElementV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*) : UInt32
    C.DhcpAddSubnetElementV4(server_ip_address, subnet_address, add_element_info)
  end

  def dhcpEnumSubnetElementsV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpEnumSubnetElementsV4(server_ip_address, subnet_address, enum_element_type, resume_handle, preferred_maximum, enum_element_info, elements_read, elements_total)
  end

  def dhcpRemoveSubnetElementV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32
    C.DhcpRemoveSubnetElementV4(server_ip_address, subnet_address, remove_element_info, force_flag)
  end

  def dhcpCreateClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4*) : UInt32
    C.DhcpCreateClientInfoV4(server_ip_address, client_info)
  end

  def dhcpSetClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4*) : UInt32
    C.DhcpSetClientInfoV4(server_ip_address, client_info)
  end

  def dhcpGetClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4**) : UInt32
    C.DhcpGetClientInfoV4(server_ip_address, search_info, client_info)
  end

  def dhcpEnumSubnetClientsV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V4**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpEnumSubnetClientsV4(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpServerSetConfigV4(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V4*) : UInt32
    C.DhcpServerSetConfigV4(server_ip_address, fields_to_set, config_info)
  end

  def dhcpServerGetConfigV4(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V4**) : UInt32
    C.DhcpServerGetConfigV4(server_ip_address, config_info)
  end

  def dhcpSetSuperScopeV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, super_scope_name : Win32cr::Foundation::PWSTR, change_existing : Win32cr::Foundation::BOOL) : UInt32
    C.DhcpSetSuperScopeV4(server_ip_address, subnet_address, super_scope_name, change_existing)
  end

  def dhcpDeleteSuperScopeV4(server_ip_address : Win32cr::Foundation::PWSTR, super_scope_name : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpDeleteSuperScopeV4(server_ip_address, super_scope_name)
  end

  def dhcpGetSuperScopeInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, super_scope_table : Win32cr::NetworkManagement::Dhcp::DHCP_SUPER_SCOPE_TABLE**) : UInt32
    C.DhcpGetSuperScopeInfoV4(server_ip_address, super_scope_table)
  end

  def dhcpEnumSubnetClientsV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V5**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpEnumSubnetClientsV5(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpCreateOptionV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32
    C.DhcpCreateOptionV5(server_ip_address, flags, option_id, class_name, vendor_name, option_info)
  end

  def dhcpSetOptionInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32
    C.DhcpSetOptionInfoV5(server_ip_address, flags, option_id, class_name, vendor_name, option_info)
  end

  def dhcpGetOptionInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32
    C.DhcpGetOptionInfoV5(server_ip_address, flags, option_id, class_name, vendor_name, option_info)
  end

  def dhcpEnumOptionsV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32
    C.DhcpEnumOptionsV5(server_ip_address, flags, class_name, vendor_name, resume_handle, preferred_maximum, options, options_read, options_total)
  end

  def dhcpRemoveOptionV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpRemoveOptionV5(server_ip_address, flags, option_id, class_name, vendor_name)
  end

  def dhcpSetOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32
    C.DhcpSetOptionValueV5(server_ip_address, flags, option_id, class_name, vendor_name, scope_info, option_value)
  end

  def dhcpSetOptionValuesV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32
    C.DhcpSetOptionValuesV5(server_ip_address, flags, class_name, vendor_name, scope_info, option_values)
  end

  def dhcpGetOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32
    C.DhcpGetOptionValueV5(server_ip_address, flags, option_id, class_name, vendor_name, scope_info, option_value)
  end

  def dhcpGetOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32
    C.DhcpGetOptionValueV6(server_ip_address, flags, option_id, class_name, vendor_name, scope_info, option_value)
  end

  def dhcpEnumOptionValuesV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32
    C.DhcpEnumOptionValuesV5(server_ip_address, flags, class_name, vendor_name, scope_info, resume_handle, preferred_maximum, option_values, options_read, options_total)
  end

  def dhcpRemoveOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32
    C.DhcpRemoveOptionValueV5(server_ip_address, flags, option_id, class_name, vendor_name, scope_info)
  end

  def dhcpCreateClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*) : UInt32
    C.DhcpCreateClass(server_ip_address, reserved_must_be_zero, class_info)
  end

  def dhcpModifyClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*) : UInt32
    C.DhcpModifyClass(server_ip_address, reserved_must_be_zero, class_info)
  end

  def dhcpDeleteClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_name : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpDeleteClass(server_ip_address, reserved_must_be_zero, class_name)
  end

  def dhcpGetClassInfo(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, partial_class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*, filled_class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO**) : UInt32
    C.DhcpGetClassInfo(server_ip_address, reserved_must_be_zero, partial_class_info, filled_class_info)
  end

  def dhcpEnumClasses(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, class_info_array : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_ARRAY**, nRead : UInt32*, nTotal : UInt32*) : UInt32
    C.DhcpEnumClasses(server_ip_address, reserved_must_be_zero, resume_handle, preferred_maximum, class_info_array, nRead, nTotal)
  end

  def dhcpGetAllOptions(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_struct : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTIONS**) : UInt32
    C.DhcpGetAllOptions(server_ip_address, flags, option_struct)
  end

  def dhcpGetAllOptionsV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_struct : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTIONS**) : UInt32
    C.DhcpGetAllOptionsV6(server_ip_address, flags, option_struct)
  end

  def dhcpGetAllOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES**) : UInt32
    C.DhcpGetAllOptionValues(server_ip_address, flags, scope_info, values)
  end

  def dhcpGetAllOptionValuesV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES**) : UInt32
    C.DhcpGetAllOptionValuesV6(server_ip_address, flags, scope_info, values)
  end

  def dhcpEnumServers(flags : UInt32, id_info : Void*, servers : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVERS**, callback_fn : Void*, callback_data : Void*) : UInt32
    C.DhcpEnumServers(flags, id_info, servers, callback_fn, callback_data)
  end

  def dhcpAddServer(flags : UInt32, id_info : Void*, new_server : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*, callback_fn : Void*, callback_data : Void*) : UInt32
    C.DhcpAddServer(flags, id_info, new_server, callback_fn, callback_data)
  end

  def dhcpDeleteServer(flags : UInt32, id_info : Void*, new_server : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*, callback_fn : Void*, callback_data : Void*) : UInt32
    C.DhcpDeleteServer(flags, id_info, new_server, callback_fn, callback_data)
  end

  def dhcpGetServerBindingInfo(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_elements_info : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT_ARRAY**) : UInt32
    C.DhcpGetServerBindingInfo(server_ip_address, flags, bind_elements_info)
  end

  def dhcpSetServerBindingInfo(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT_ARRAY*) : UInt32
    C.DhcpSetServerBindingInfo(server_ip_address, flags, bind_element_info)
  end

  def dhcpAddSubnetElementV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*) : UInt32
    C.DhcpAddSubnetElementV5(server_ip_address, subnet_address, add_element_info)
  end

  def dhcpEnumSubnetElementsV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpEnumSubnetElementsV5(server_ip_address, subnet_address, enum_element_type, resume_handle, preferred_maximum, enum_element_info, elements_read, elements_total)
  end

  def dhcpRemoveSubnetElementV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32
    C.DhcpRemoveSubnetElementV5(server_ip_address, subnet_address, remove_element_info, force_flag)
  end

  def dhcpV4EnumSubnetReservations(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVATION_INFO_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpV4EnumSubnetReservations(server_ip_address, subnet_address, resume_handle, preferred_maximum, enum_element_info, elements_read, elements_total)
  end

  def dhcpCreateOptionV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32
    C.DhcpCreateOptionV6(server_ip_address, flags, option_id, class_name, vendor_name, option_info)
  end

  def dhcpRemoveOptionV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpRemoveOptionV6(server_ip_address, flags, option_id, class_name, vendor_name)
  end

  def dhcpEnumOptionsV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32
    C.DhcpEnumOptionsV6(server_ip_address, flags, class_name, vendor_name, resume_handle, preferred_maximum, options, options_read, options_total)
  end

  def dhcpRemoveOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*) : UInt32
    C.DhcpRemoveOptionValueV6(server_ip_address, flags, option_id, class_name, vendor_name, scope_info)
  end

  def dhcpGetOptionInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32
    C.DhcpGetOptionInfoV6(server_ip_address, flags, option_id, class_name, vendor_name, option_info)
  end

  def dhcpSetOptionInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32
    C.DhcpSetOptionInfoV6(server_ip_address, flags, option_id, class_name, vendor_name, option_info)
  end

  def dhcpSetOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32
    C.DhcpSetOptionValueV6(server_ip_address, flags, option_id, class_name, vendor_name, scope_info, option_value)
  end

  def dhcpGetSubnetInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ**) : UInt32
    C.DhcpGetSubnetInfoVQ(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpCreateSubnetVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ*) : UInt32
    C.DhcpCreateSubnetVQ(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpSetSubnetInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ*) : UInt32
    C.DhcpSetSubnetInfoVQ(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpEnumOptionValuesV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32
    C.DhcpEnumOptionValuesV6(server_ip_address, flags, class_name, vendor_name, scope_info, resume_handle, preferred_maximum, option_values, options_read, options_total)
  end

  def dhcpDsInit : UInt32
    C.DhcpDsInit
  end

  def dhcpDsCleanup : Void
    C.DhcpDsCleanup
  end

  def dhcpSetThreadOptions(flags : UInt32, reserved : Void*) : UInt32
    C.DhcpSetThreadOptions(flags, reserved)
  end

  def dhcpGetThreadOptions(pFlags : UInt32*, reserved : Void*) : UInt32
    C.DhcpGetThreadOptions(pFlags, reserved)
  end

  def dhcpServerQueryAttribute(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32, dhcp_attrib_id : UInt32, pDhcpAttrib : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB**) : UInt32
    C.DhcpServerQueryAttribute(server_ip_addr, dwReserved, dhcp_attrib_id, pDhcpAttrib)
  end

  def dhcpServerQueryAttributes(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32, dwAttribCount : UInt32, pDhcpAttribs : UInt32*, pDhcpAttribArr : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB_ARRAY**) : UInt32
    C.DhcpServerQueryAttributes(server_ip_addr, dwReserved, dwAttribCount, pDhcpAttribs, pDhcpAttribArr)
  end

  def dhcpServerRedoAuthorization(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32) : UInt32
    C.DhcpServerRedoAuthorization(server_ip_addr, dwReserved)
  end

  def dhcpAuditLogSetParams(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, audit_log_dir : Win32cr::Foundation::PWSTR, disk_check_interval : UInt32, max_log_files_size : UInt32, min_space_on_disk : UInt32) : UInt32
    C.DhcpAuditLogSetParams(server_ip_address, flags, audit_log_dir, disk_check_interval, max_log_files_size, min_space_on_disk)
  end

  def dhcpAuditLogGetParams(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, audit_log_dir : Win32cr::Foundation::PWSTR*, disk_check_interval : UInt32*, max_log_files_size : UInt32*, min_space_on_disk : UInt32*) : UInt32
    C.DhcpAuditLogGetParams(server_ip_address, flags, audit_log_dir, disk_check_interval, max_log_files_size, min_space_on_disk)
  end

  def dhcpServerQueryDnsRegCredentials(server_ip_address : Win32cr::Foundation::PWSTR, uname_size : UInt32, uname : UInt16*, domain_size : UInt32, domain : UInt16*) : UInt32
    C.DhcpServerQueryDnsRegCredentials(server_ip_address, uname_size, uname, domain_size, domain)
  end

  def dhcpServerSetDnsRegCredentials(server_ip_address : Win32cr::Foundation::PWSTR, uname : Win32cr::Foundation::PWSTR, domain : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpServerSetDnsRegCredentials(server_ip_address, uname, domain, passwd)
  end

  def dhcpServerSetDnsRegCredentialsV5(server_ip_address : Win32cr::Foundation::PWSTR, uname : Win32cr::Foundation::PWSTR, domain : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpServerSetDnsRegCredentialsV5(server_ip_address, uname, domain, passwd)
  end

  def dhcpServerBackupDatabase(server_ip_address : Win32cr::Foundation::PWSTR, path : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpServerBackupDatabase(server_ip_address, path)
  end

  def dhcpServerRestoreDatabase(server_ip_address : Win32cr::Foundation::PWSTR, path : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpServerRestoreDatabase(server_ip_address, path)
  end

  def dhcpServerSetConfigVQ(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ*) : UInt32
    C.DhcpServerSetConfigVQ(server_ip_address, fields_to_set, config_info)
  end

  def dhcpServerGetConfigVQ(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ**) : UInt32
    C.DhcpServerGetConfigVQ(server_ip_address, config_info)
  end

  def dhcpGetServerSpecificStrings(server_ip_address : Win32cr::Foundation::PWSTR, server_specific_strings : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_SPECIFIC_STRINGS**) : UInt32
    C.DhcpGetServerSpecificStrings(server_ip_address, server_specific_strings)
  end

  def dhcpServerAuditlogParamsFree(config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ*) : Void
    C.DhcpServerAuditlogParamsFree(config_info)
  end

  def dhcpCreateSubnetV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6*) : UInt32
    C.DhcpCreateSubnetV6(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpDeleteSubnetV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32
    C.DhcpDeleteSubnetV6(server_ip_address, subnet_address, force_flag)
  end

  def dhcpEnumSubnetsV6(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_IP_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpEnumSubnetsV6(server_ip_address, resume_handle, preferred_maximum, enum_info, elements_read, elements_total)
  end

  def dhcpAddSubnetElementV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*) : UInt32
    C.DhcpAddSubnetElementV6(server_ip_address, subnet_address, add_element_info)
  end

  def dhcpRemoveSubnetElementV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32
    C.DhcpRemoveSubnetElementV6(server_ip_address, subnet_address, remove_element_info, force_flag)
  end

  def dhcpEnumSubnetElementsV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE_V6, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpEnumSubnetElementsV6(server_ip_address, subnet_address, enum_element_type, resume_handle, preferred_maximum, enum_element_info, elements_read, elements_total)
  end

  def dhcpGetSubnetInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6**) : UInt32
    C.DhcpGetSubnetInfoV6(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpEnumSubnetClientsV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, resume_handle : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V6**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpEnumSubnetClientsV6(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpServerGetConfigV6(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V6**) : UInt32
    C.DhcpServerGetConfigV6(server_ip_address, scope_info, config_info)
  end

  def dhcpServerSetConfigV6(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V6*) : UInt32
    C.DhcpServerSetConfigV6(server_ip_address, scope_info, fields_to_set, config_info)
  end

  def dhcpSetSubnetInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6*) : UInt32
    C.DhcpSetSubnetInfoV6(server_ip_address, subnet_address, subnet_info)
  end

  def dhcpGetMibInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO_V6**) : UInt32
    C.DhcpGetMibInfoV6(server_ip_address, mib_info)
  end

  def dhcpGetServerBindingInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_elements_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT_ARRAY**) : UInt32
    C.DhcpGetServerBindingInfoV6(server_ip_address, flags, bind_elements_info)
  end

  def dhcpSetServerBindingInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_element_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT_ARRAY*) : UInt32
    C.DhcpSetServerBindingInfoV6(server_ip_address, flags, bind_element_info)
  end

  def dhcpSetClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6*) : UInt32
    C.DhcpSetClientInfoV6(server_ip_address, client_info)
  end

  def dhcpGetClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_V6*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6**) : UInt32
    C.DhcpGetClientInfoV6(server_ip_address, search_info, client_info)
  end

  def dhcpDeleteClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_V6*) : UInt32
    C.DhcpDeleteClientInfoV6(server_ip_address, client_info)
  end

  def dhcpCreateClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*) : UInt32
    C.DhcpCreateClassV6(server_ip_address, reserved_must_be_zero, class_info)
  end

  def dhcpModifyClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*) : UInt32
    C.DhcpModifyClassV6(server_ip_address, reserved_must_be_zero, class_info)
  end

  def dhcpDeleteClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_name : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpDeleteClassV6(server_ip_address, reserved_must_be_zero, class_name)
  end

  def dhcpEnumClassesV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, class_info_array : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_ARRAY_V6**, nRead : UInt32*, nTotal : UInt32*) : UInt32
    C.DhcpEnumClassesV6(server_ip_address, reserved_must_be_zero, resume_handle, preferred_maximum, class_info_array, nRead, nTotal)
  end

  def dhcpSetSubnetDelayOffer(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, time_delay_in_milliseconds : UInt16) : UInt32
    C.DhcpSetSubnetDelayOffer(server_ip_address, subnet_address, time_delay_in_milliseconds)
  end

  def dhcpGetSubnetDelayOffer(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, time_delay_in_milliseconds : UInt16*) : UInt32
    C.DhcpGetSubnetDelayOffer(server_ip_address, subnet_address, time_delay_in_milliseconds)
  end

  def dhcpGetMibInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO_V5**) : UInt32
    C.DhcpGetMibInfoV5(server_ip_address, mib_info)
  end

  def dhcpAddSecurityGroup(pServer : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpAddSecurityGroup(pServer)
  end

  def dhcpV4GetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32
    C.DhcpV4GetOptionValue(server_ip_address, flags, option_id, policy_name, vendor_name, scope_info, option_value)
  end

  def dhcpV4SetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32
    C.DhcpV4SetOptionValue(server_ip_address, flags, option_id, policy_name, vendor_name, scope_info, option_value)
  end

  def dhcpV4SetOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32
    C.DhcpV4SetOptionValues(server_ip_address, flags, policy_name, vendor_name, scope_info, option_values)
  end

  def dhcpV4RemoveOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32
    C.DhcpV4RemoveOptionValue(server_ip_address, flags, option_id, policy_name, vendor_name, scope_info)
  end

  def dhcpV4GetAllOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES_PB**) : UInt32
    C.DhcpV4GetAllOptionValues(server_ip_address, flags, scope_info, values)
  end

  def dhcpV4FailoverCreateRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32
    C.DhcpV4FailoverCreateRelationship(server_ip_address, pRelationship)
  end

  def dhcpV4FailoverSetRelationship(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32
    C.DhcpV4FailoverSetRelationship(server_ip_address, flags, pRelationship)
  end

  def dhcpV4FailoverDeleteRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationshipName : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpV4FailoverDeleteRelationship(server_ip_address, pRelationshipName)
  end

  def dhcpV4FailoverGetRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationshipName : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP**) : UInt32
    C.DhcpV4FailoverGetRelationship(server_ip_address, pRelationshipName, pRelationship)
  end

  def dhcpV4FailoverEnumRelationship(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP_ARRAY**, relationship_read : UInt32*, relationship_total : UInt32*) : UInt32
    C.DhcpV4FailoverEnumRelationship(server_ip_address, resume_handle, preferred_maximum, pRelationship, relationship_read, relationship_total)
  end

  def dhcpV4FailoverAddScopeToRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32
    C.DhcpV4FailoverAddScopeToRelationship(server_ip_address, pRelationship)
  end

  def dhcpV4FailoverDeleteScopeFromRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32
    C.DhcpV4FailoverDeleteScopeFromRelationship(server_ip_address, pRelationship)
  end

  def dhcpV4FailoverGetScopeRelationship(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP**) : UInt32
    C.DhcpV4FailoverGetScopeRelationship(server_ip_address, scope_id, pRelationship)
  end

  def dhcpV4FailoverGetScopeStatistics(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, pStats : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_STATISTICS**) : UInt32
    C.DhcpV4FailoverGetScopeStatistics(server_ip_address, scope_id, pStats)
  end

  def dhcpV4FailoverGetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCPV4_FAILOVER_CLIENT_INFO**) : UInt32
    C.DhcpV4FailoverGetClientInfo(server_ip_address, search_info, client_info)
  end

  def dhcpV4FailoverGetSystemTime(server_ip_address : Win32cr::Foundation::PWSTR, pTime : UInt32*, pMaxAllowedDeltaTime : UInt32*) : UInt32
    C.DhcpV4FailoverGetSystemTime(server_ip_address, pTime, pMaxAllowedDeltaTime)
  end

  def dhcpV4FailoverGetAddressStatus(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, pStatus : UInt32*) : UInt32
    C.DhcpV4FailoverGetAddressStatus(server_ip_address, subnet_address, pStatus)
  end

  def dhcpV4FailoverTriggerAddrAllocation(server_ip_address : Win32cr::Foundation::PWSTR, pFailRelName : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpV4FailoverTriggerAddrAllocation(server_ip_address, pFailRelName)
  end

  def dhcpHlprCreateV4Policy(policy_name : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet : UInt32, processing_order : UInt32, root_operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, description : Win32cr::Foundation::PWSTR, enabled : Win32cr::Foundation::BOOL, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY**) : UInt32
    C.DhcpHlprCreateV4Policy(policy_name, fGlobalPolicy, subnet, processing_order, root_operator, description, enabled, policy)
  end

  def dhcpHlprCreateV4PolicyEx(policy_name : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet : UInt32, processing_order : UInt32, root_operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, description : Win32cr::Foundation::PWSTR, enabled : Win32cr::Foundation::BOOL, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX**) : UInt32
    C.DhcpHlprCreateV4PolicyEx(policy_name, fGlobalPolicy, subnet, processing_order, root_operator, description, enabled, policy)
  end

  def dhcpHlprAddV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, parent_expr : UInt32, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, expr_index : UInt32*) : UInt32
    C.DhcpHlprAddV4PolicyExpr(policy, parent_expr, operator, expr_index)
  end

  def dhcpHlprAddV4PolicyCondition(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, parent_expr : UInt32, type__ : Win32cr::NetworkManagement::Dhcp::DHCP_POL_ATTR_TYPE, option_id : UInt32, sub_option_id : UInt32, vendor_name : Win32cr::Foundation::PWSTR, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COMPARATOR, value : UInt8*, value_length : UInt32, condition_index : UInt32*) : UInt32
    C.DhcpHlprAddV4PolicyCondition(policy, parent_expr, type__, option_id, sub_option_id, vendor_name, operator, value, value_length, condition_index)
  end

  def dhcpHlprAddV4PolicyRange(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32
    C.DhcpHlprAddV4PolicyRange(policy, range)
  end

  def dhcpHlprResetV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32
    C.DhcpHlprResetV4PolicyExpr(policy)
  end

  def dhcpHlprModifyV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER) : UInt32
    C.DhcpHlprModifyV4PolicyExpr(policy, operator)
  end

  def dhcpHlprFreeV4Policy(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Void
    C.DhcpHlprFreeV4Policy(policy)
  end

  def dhcpHlprFreeV4PolicyArray(policy_array : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_ARRAY*) : Void
    C.DhcpHlprFreeV4PolicyArray(policy_array)
  end

  def dhcpHlprFreeV4PolicyEx(policy_ex : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : Void
    C.DhcpHlprFreeV4PolicyEx(policy_ex)
  end

  def dhcpHlprFreeV4PolicyExArray(policy_ex_array : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX_ARRAY*) : Void
    C.DhcpHlprFreeV4PolicyExArray(policy_ex_array)
  end

  def dhcpHlprFreeV4DhcpProperty(property : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*) : Void
    C.DhcpHlprFreeV4DhcpProperty(property)
  end

  def dhcpHlprFreeV4DhcpPropertyArray(property_array : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*) : Void
    C.DhcpHlprFreeV4DhcpPropertyArray(property_array)
  end

  def dhcpHlprFindV4DhcpProperty(property_array : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*, id : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ID, type__ : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_TYPE) : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*
    C.DhcpHlprFindV4DhcpProperty(property_array, id, type__)
  end

  def dhcpHlprIsV4PolicySingleUC(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Win32cr::Foundation::BOOL
    C.DhcpHlprIsV4PolicySingleUC(policy)
  end

  def dhcpV4QueryPolicyEnforcement(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enabled : Win32cr::Foundation::BOOL*) : UInt32
    C.DhcpV4QueryPolicyEnforcement(server_ip_address, fGlobalPolicy, subnet_address, enabled)
  end

  def dhcpV4SetPolicyEnforcement(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enable : Win32cr::Foundation::BOOL) : UInt32
    C.DhcpV4SetPolicyEnforcement(server_ip_address, fGlobalPolicy, subnet_address, enable)
  end

  def dhcpHlprIsV4PolicyWellFormed(pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Win32cr::Foundation::BOOL
    C.DhcpHlprIsV4PolicyWellFormed(pPolicy)
  end

  def dhcpHlprIsV4PolicyValid(pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32
    C.DhcpHlprIsV4PolicyValid(pPolicy)
  end

  def dhcpV4CreatePolicy(server_ip_address : Win32cr::Foundation::PWSTR, pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32
    C.DhcpV4CreatePolicy(server_ip_address, pPolicy)
  end

  def dhcpV4GetPolicy(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY**) : UInt32
    C.DhcpV4GetPolicy(server_ip_address, fGlobalPolicy, subnet_address, policy_name, policy)
  end

  def dhcpV4SetPolicy(server_ip_address : Win32cr::Foundation::PWSTR, fields_modified : UInt32, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32
    C.DhcpV4SetPolicy(server_ip_address, fields_modified, fGlobalPolicy, subnet_address, policy_name, policy)
  end

  def dhcpV4DeletePolicy(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR) : UInt32
    C.DhcpV4DeletePolicy(server_ip_address, fGlobalPolicy, subnet_address, policy_name)
  end

  def dhcpV4EnumPolicies(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpV4EnumPolicies(server_ip_address, resume_handle, preferred_maximum, fGlobalPolicy, subnet_address, enum_info, elements_read, elements_total)
  end

  def dhcpV4AddPolicyRange(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32
    C.DhcpV4AddPolicyRange(server_ip_address, subnet_address, policy_name, range)
  end

  def dhcpV4RemovePolicyRange(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32
    C.DhcpV4RemovePolicyRange(server_ip_address, subnet_address, policy_name, range)
  end

  def dhcpV6SetStatelessStoreParams(server_ip_address : Win32cr::Foundation::PWSTR, fServerLevel : Win32cr::Foundation::BOOL, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, field_modified : UInt32, params : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_PARAMS*) : UInt32
    C.DhcpV6SetStatelessStoreParams(server_ip_address, fServerLevel, subnet_address, field_modified, params)
  end

  def dhcpV6GetStatelessStoreParams(server_ip_address : Win32cr::Foundation::PWSTR, fServerLevel : Win32cr::Foundation::BOOL, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, params : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_PARAMS**) : UInt32
    C.DhcpV6GetStatelessStoreParams(server_ip_address, fServerLevel, subnet_address, params)
  end

  def dhcpV6GetStatelessStatistics(server_ip_address : Win32cr::Foundation::PWSTR, stateless_stats : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_STATS**) : UInt32
    C.DhcpV6GetStatelessStatistics(server_ip_address, stateless_stats)
  end

  def dhcpV4CreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB*) : UInt32
    C.DhcpV4CreateClientInfo(server_ip_address, client_info)
  end

  def dhcpV4EnumSubnetClients(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpV4EnumSubnetClients(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpV4GetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB**) : UInt32
    C.DhcpV4GetClientInfo(server_ip_address, search_info, client_info)
  end

  def dhcpV6CreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6*) : UInt32
    C.DhcpV6CreateClientInfo(server_ip_address, client_info)
  end

  def dhcpV4GetFreeIPAddress(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, start_ip : UInt32, end_ip : UInt32, num_free_addr_req : UInt32, ip_addr_list : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY**) : UInt32
    C.DhcpV4GetFreeIPAddress(server_ip_address, scope_id, start_ip, end_ip, num_free_addr_req, ip_addr_list)
  end

  def dhcpV6GetFreeIPAddress(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, start_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, end_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, num_free_addr_req : UInt32, ip_addr_list : Win32cr::NetworkManagement::Dhcp::DHCPV6_IP_ARRAY**) : UInt32
    C.DhcpV6GetFreeIPAddress(server_ip_address, scope_id, start_ip, end_ip, num_free_addr_req, ip_addr_list)
  end

  def dhcpV4CreateClientInfoEx(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX*) : UInt32
    C.DhcpV4CreateClientInfoEx(server_ip_address, client_info)
  end

  def dhcpV4EnumSubnetClientsEx(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32
    C.DhcpV4EnumSubnetClientsEx(server_ip_address, subnet_address, resume_handle, preferred_maximum, client_info, clients_read, clients_total)
  end

  def dhcpV4GetClientInfoEx(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX**) : UInt32
    C.DhcpV4GetClientInfoEx(server_ip_address, search_info, client_info)
  end

  def dhcpV4CreatePolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, policy_ex : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : UInt32
    C.DhcpV4CreatePolicyEx(server_ip_address, policy_ex)
  end

  def dhcpV4GetPolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX**) : UInt32
    C.DhcpV4GetPolicyEx(server_ip_address, global_policy, subnet_address, policy_name, policy)
  end

  def dhcpV4SetPolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, fields_modified : UInt32, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : UInt32
    C.DhcpV4SetPolicyEx(server_ip_address, fields_modified, global_policy, subnet_address, policy_name, policy)
  end

  def dhcpV4EnumPoliciesEx(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32
    C.DhcpV4EnumPoliciesEx(server_ip_address, resume_handle, preferred_maximum, global_policy, subnet_address, enum_info, elements_read, elements_total)
  end

  @[Link("dhcpcsvc6")]
  @[Link("dhcpcsvc")]
  @[Link("dhcpsapi")]
  lib C
    # :nodoc:
    fun Dhcpv6CApiInitialize(version : UInt32*) : Void

    # :nodoc:
    fun Dhcpv6CApiCleanup : Void

    # :nodoc:
    fun Dhcpv6RequestParams(forceNewInform : Win32cr::Foundation::BOOL, reserved : Void*, adapterName : Win32cr::Foundation::PWSTR, classId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, recdParams : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_PARAMS_ARRAY, buffer : UInt8*, pSize : UInt32*) : UInt32

    # :nodoc:
    fun Dhcpv6RequestPrefix(adapterName : Win32cr::Foundation::PWSTR, pclassId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, prefixleaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*, pdwTimeToWait : UInt32*) : UInt32

    # :nodoc:
    fun Dhcpv6RenewPrefix(adapterName : Win32cr::Foundation::PWSTR, pclassId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, prefixleaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*, pdwTimeToWait : UInt32*, bValidatePrefix : UInt32) : UInt32

    # :nodoc:
    fun Dhcpv6ReleasePrefix(adapterName : Win32cr::Foundation::PWSTR, classId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, leaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*) : UInt32

    # :nodoc:
    fun DhcpCApiInitialize(version : UInt32*) : UInt32

    # :nodoc:
    fun DhcpCApiCleanup : Void

    # :nodoc:
    fun DhcpRequestParams(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, class_id : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_CLASSID*, send_params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, recd_params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, buffer : UInt8*, pSize : UInt32*, request_id_str : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpUndoRequestParams(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, request_id_str : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpRegisterParamChange(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, class_id : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_CLASSID*, params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, handle : Void*) : UInt32

    # :nodoc:
    fun DhcpDeRegisterParamChange(flags : UInt32, reserved : Void*, event : Void*) : UInt32

    # :nodoc:
    fun DhcpRemoveDNSRegistrations : UInt32

    # :nodoc:
    fun DhcpGetOriginalSubnetMask(sAdapterName : Win32cr::Foundation::PWSTR, dwSubnetMask : UInt32*) : UInt32

    # :nodoc:
    fun DhcpAddFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, add_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_ADD_INFO*, force_flag : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun DhcpDeleteFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, delete_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN*) : UInt32

    # :nodoc:
    fun DhcpSetFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, global_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_GLOBAL_INFO*) : UInt32

    # :nodoc:
    fun DhcpGetFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, global_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_GLOBAL_INFO*) : UInt32

    # :nodoc:
    fun DhcpEnumFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN*, preferred_maximum : UInt32, list_type : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_LIST_TYPE, enum_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_ENUM_INFO**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpCreateSubnet(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO*) : UInt32

    # :nodoc:
    fun DhcpSetSubnetInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO*) : UInt32

    # :nodoc:
    fun DhcpGetSubnetInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO**) : UInt32

    # :nodoc:
    fun DhcpEnumSubnets(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpAddSubnetElement(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetElements(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveSubnetElement(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    # :nodoc:
    fun DhcpDeleteSubnet(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    # :nodoc:
    fun DhcpCreateOption(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    # :nodoc:
    fun DhcpSetOptionInfo(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    # :nodoc:
    fun DhcpGetOptionInfo(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32

    # :nodoc:
    fun DhcpEnumOptions(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveOption(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32) : UInt32

    # :nodoc:
    fun DhcpSetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    # :nodoc:
    fun DhcpSetOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32

    # :nodoc:
    fun DhcpGetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    # :nodoc:
    fun DhcpEnumOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32

    # :nodoc:
    fun DhcpCreateClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ*) : UInt32

    # :nodoc:
    fun DhcpSetClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ*) : UInt32

    # :nodoc:
    fun DhcpGetClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ**) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetClientsVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_VQ**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetClientsFilterStatusInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpCreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO*) : UInt32

    # :nodoc:
    fun DhcpSetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO*) : UInt32

    # :nodoc:
    fun DhcpGetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO**) : UInt32

    # :nodoc:
    fun DhcpDeleteClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetClients(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpGetClientOptions(server_ip_address : Win32cr::Foundation::PWSTR, client_ip_address : UInt32, client_subnet_mask : UInt32, client_options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_LIST**) : UInt32

    # :nodoc:
    fun DhcpGetMibInfo(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO**) : UInt32

    # :nodoc:
    fun DhcpServerSetConfig(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO*) : UInt32

    # :nodoc:
    fun DhcpServerGetConfig(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO**) : UInt32

    # :nodoc:
    fun DhcpScanDatabase(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, fix_flag : UInt32, scan_list : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_LIST**) : UInt32

    # :nodoc:
    fun DhcpRpcFreeMemory(buffer_pointer : Void*) : Void

    # :nodoc:
    fun DhcpGetVersion(server_ip_address : Win32cr::Foundation::PWSTR, major_version : UInt32*, minor_version : UInt32*) : UInt32

    # :nodoc:
    fun DhcpAddSubnetElementV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetElementsV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveSubnetElementV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    # :nodoc:
    fun DhcpCreateClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4*) : UInt32

    # :nodoc:
    fun DhcpSetClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4*) : UInt32

    # :nodoc:
    fun DhcpGetClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4**) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetClientsV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V4**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpServerSetConfigV4(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V4*) : UInt32

    # :nodoc:
    fun DhcpServerGetConfigV4(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V4**) : UInt32

    # :nodoc:
    fun DhcpSetSuperScopeV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, super_scope_name : Win32cr::Foundation::PWSTR, change_existing : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun DhcpDeleteSuperScopeV4(server_ip_address : Win32cr::Foundation::PWSTR, super_scope_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpGetSuperScopeInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, super_scope_table : Win32cr::NetworkManagement::Dhcp::DHCP_SUPER_SCOPE_TABLE**) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetClientsV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V5**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpCreateOptionV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    # :nodoc:
    fun DhcpSetOptionInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    # :nodoc:
    fun DhcpGetOptionInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32

    # :nodoc:
    fun DhcpEnumOptionsV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveOptionV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpSetOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    # :nodoc:
    fun DhcpSetOptionValuesV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32

    # :nodoc:
    fun DhcpGetOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    # :nodoc:
    fun DhcpGetOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    # :nodoc:
    fun DhcpEnumOptionValuesV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32

    # :nodoc:
    fun DhcpCreateClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*) : UInt32

    # :nodoc:
    fun DhcpModifyClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*) : UInt32

    # :nodoc:
    fun DhcpDeleteClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpGetClassInfo(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, partial_class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*, filled_class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO**) : UInt32

    # :nodoc:
    fun DhcpEnumClasses(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, class_info_array : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_ARRAY**, nRead : UInt32*, nTotal : UInt32*) : UInt32

    # :nodoc:
    fun DhcpGetAllOptions(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_struct : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTIONS**) : UInt32

    # :nodoc:
    fun DhcpGetAllOptionsV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_struct : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTIONS**) : UInt32

    # :nodoc:
    fun DhcpGetAllOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES**) : UInt32

    # :nodoc:
    fun DhcpGetAllOptionValuesV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES**) : UInt32

    # :nodoc:
    fun DhcpEnumServers(flags : UInt32, id_info : Void*, servers : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVERS**, callback_fn : Void*, callback_data : Void*) : UInt32

    # :nodoc:
    fun DhcpAddServer(flags : UInt32, id_info : Void*, new_server : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*, callback_fn : Void*, callback_data : Void*) : UInt32

    # :nodoc:
    fun DhcpDeleteServer(flags : UInt32, id_info : Void*, new_server : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*, callback_fn : Void*, callback_data : Void*) : UInt32

    # :nodoc:
    fun DhcpGetServerBindingInfo(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_elements_info : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT_ARRAY**) : UInt32

    # :nodoc:
    fun DhcpSetServerBindingInfo(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT_ARRAY*) : UInt32

    # :nodoc:
    fun DhcpAddSubnetElementV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetElementsV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveSubnetElementV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    # :nodoc:
    fun DhcpV4EnumSubnetReservations(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVATION_INFO_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpCreateOptionV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    # :nodoc:
    fun DhcpRemoveOptionV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpEnumOptionsV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpRemoveOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*) : UInt32

    # :nodoc:
    fun DhcpGetOptionInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32

    # :nodoc:
    fun DhcpSetOptionInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    # :nodoc:
    fun DhcpSetOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    # :nodoc:
    fun DhcpGetSubnetInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ**) : UInt32

    # :nodoc:
    fun DhcpCreateSubnetVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ*) : UInt32

    # :nodoc:
    fun DhcpSetSubnetInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ*) : UInt32

    # :nodoc:
    fun DhcpEnumOptionValuesV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpDsInit : UInt32

    # :nodoc:
    fun DhcpDsCleanup : Void

    # :nodoc:
    fun DhcpSetThreadOptions(flags : UInt32, reserved : Void*) : UInt32

    # :nodoc:
    fun DhcpGetThreadOptions(pFlags : UInt32*, reserved : Void*) : UInt32

    # :nodoc:
    fun DhcpServerQueryAttribute(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32, dhcp_attrib_id : UInt32, pDhcpAttrib : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB**) : UInt32

    # :nodoc:
    fun DhcpServerQueryAttributes(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32, dwAttribCount : UInt32, pDhcpAttribs : UInt32*, pDhcpAttribArr : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB_ARRAY**) : UInt32

    # :nodoc:
    fun DhcpServerRedoAuthorization(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32) : UInt32

    # :nodoc:
    fun DhcpAuditLogSetParams(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, audit_log_dir : Win32cr::Foundation::PWSTR, disk_check_interval : UInt32, max_log_files_size : UInt32, min_space_on_disk : UInt32) : UInt32

    # :nodoc:
    fun DhcpAuditLogGetParams(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, audit_log_dir : Win32cr::Foundation::PWSTR*, disk_check_interval : UInt32*, max_log_files_size : UInt32*, min_space_on_disk : UInt32*) : UInt32

    # :nodoc:
    fun DhcpServerQueryDnsRegCredentials(server_ip_address : Win32cr::Foundation::PWSTR, uname_size : UInt32, uname : UInt16*, domain_size : UInt32, domain : UInt16*) : UInt32

    # :nodoc:
    fun DhcpServerSetDnsRegCredentials(server_ip_address : Win32cr::Foundation::PWSTR, uname : Win32cr::Foundation::PWSTR, domain : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpServerSetDnsRegCredentialsV5(server_ip_address : Win32cr::Foundation::PWSTR, uname : Win32cr::Foundation::PWSTR, domain : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpServerBackupDatabase(server_ip_address : Win32cr::Foundation::PWSTR, path : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpServerRestoreDatabase(server_ip_address : Win32cr::Foundation::PWSTR, path : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpServerSetConfigVQ(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ*) : UInt32

    # :nodoc:
    fun DhcpServerGetConfigVQ(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ**) : UInt32

    # :nodoc:
    fun DhcpGetServerSpecificStrings(server_ip_address : Win32cr::Foundation::PWSTR, server_specific_strings : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_SPECIFIC_STRINGS**) : UInt32

    # :nodoc:
    fun DhcpServerAuditlogParamsFree(config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ*) : Void

    # :nodoc:
    fun DhcpCreateSubnetV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpDeleteSubnetV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetsV6(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_IP_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpAddSubnetElementV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*) : UInt32

    # :nodoc:
    fun DhcpRemoveSubnetElementV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetElementsV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE_V6, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpGetSubnetInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6**) : UInt32

    # :nodoc:
    fun DhcpEnumSubnetClientsV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, resume_handle : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V6**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpServerGetConfigV6(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V6**) : UInt32

    # :nodoc:
    fun DhcpServerSetConfigV6(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpSetSubnetInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpGetMibInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO_V6**) : UInt32

    # :nodoc:
    fun DhcpGetServerBindingInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_elements_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT_ARRAY**) : UInt32

    # :nodoc:
    fun DhcpSetServerBindingInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_element_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT_ARRAY*) : UInt32

    # :nodoc:
    fun DhcpSetClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpGetClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_V6*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6**) : UInt32

    # :nodoc:
    fun DhcpDeleteClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpCreateClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpModifyClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpDeleteClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpEnumClassesV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, class_info_array : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_ARRAY_V6**, nRead : UInt32*, nTotal : UInt32*) : UInt32

    # :nodoc:
    fun DhcpSetSubnetDelayOffer(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, time_delay_in_milliseconds : UInt16) : UInt32

    # :nodoc:
    fun DhcpGetSubnetDelayOffer(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, time_delay_in_milliseconds : UInt16*) : UInt32

    # :nodoc:
    fun DhcpGetMibInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO_V5**) : UInt32

    # :nodoc:
    fun DhcpAddSecurityGroup(pServer : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpV4GetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    # :nodoc:
    fun DhcpV4SetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    # :nodoc:
    fun DhcpV4SetOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32

    # :nodoc:
    fun DhcpV4RemoveOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32

    # :nodoc:
    fun DhcpV4GetAllOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES_PB**) : UInt32

    # :nodoc:
    fun DhcpV4FailoverCreateRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    # :nodoc:
    fun DhcpV4FailoverSetRelationship(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    # :nodoc:
    fun DhcpV4FailoverDeleteRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationshipName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpV4FailoverGetRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationshipName : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP**) : UInt32

    # :nodoc:
    fun DhcpV4FailoverEnumRelationship(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP_ARRAY**, relationship_read : UInt32*, relationship_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpV4FailoverAddScopeToRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    # :nodoc:
    fun DhcpV4FailoverDeleteScopeFromRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    # :nodoc:
    fun DhcpV4FailoverGetScopeRelationship(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP**) : UInt32

    # :nodoc:
    fun DhcpV4FailoverGetScopeStatistics(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, pStats : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_STATISTICS**) : UInt32

    # :nodoc:
    fun DhcpV4FailoverGetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCPV4_FAILOVER_CLIENT_INFO**) : UInt32

    # :nodoc:
    fun DhcpV4FailoverGetSystemTime(server_ip_address : Win32cr::Foundation::PWSTR, pTime : UInt32*, pMaxAllowedDeltaTime : UInt32*) : UInt32

    # :nodoc:
    fun DhcpV4FailoverGetAddressStatus(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, pStatus : UInt32*) : UInt32

    # :nodoc:
    fun DhcpV4FailoverTriggerAddrAllocation(server_ip_address : Win32cr::Foundation::PWSTR, pFailRelName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpHlprCreateV4Policy(policy_name : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet : UInt32, processing_order : UInt32, root_operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, description : Win32cr::Foundation::PWSTR, enabled : Win32cr::Foundation::BOOL, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY**) : UInt32

    # :nodoc:
    fun DhcpHlprCreateV4PolicyEx(policy_name : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet : UInt32, processing_order : UInt32, root_operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, description : Win32cr::Foundation::PWSTR, enabled : Win32cr::Foundation::BOOL, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX**) : UInt32

    # :nodoc:
    fun DhcpHlprAddV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, parent_expr : UInt32, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, expr_index : UInt32*) : UInt32

    # :nodoc:
    fun DhcpHlprAddV4PolicyCondition(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, parent_expr : UInt32, type__ : Win32cr::NetworkManagement::Dhcp::DHCP_POL_ATTR_TYPE, option_id : UInt32, sub_option_id : UInt32, vendor_name : Win32cr::Foundation::PWSTR, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COMPARATOR, value : UInt8*, value_length : UInt32, condition_index : UInt32*) : UInt32

    # :nodoc:
    fun DhcpHlprAddV4PolicyRange(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32

    # :nodoc:
    fun DhcpHlprResetV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    # :nodoc:
    fun DhcpHlprModifyV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER) : UInt32

    # :nodoc:
    fun DhcpHlprFreeV4Policy(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Void

    # :nodoc:
    fun DhcpHlprFreeV4PolicyArray(policy_array : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_ARRAY*) : Void

    # :nodoc:
    fun DhcpHlprFreeV4PolicyEx(policy_ex : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : Void

    # :nodoc:
    fun DhcpHlprFreeV4PolicyExArray(policy_ex_array : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX_ARRAY*) : Void

    # :nodoc:
    fun DhcpHlprFreeV4DhcpProperty(property : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*) : Void

    # :nodoc:
    fun DhcpHlprFreeV4DhcpPropertyArray(property_array : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*) : Void

    # :nodoc:
    fun DhcpHlprFindV4DhcpProperty(property_array : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*, id : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ID, type__ : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_TYPE) : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*

    # :nodoc:
    fun DhcpHlprIsV4PolicySingleUC(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DhcpV4QueryPolicyEnforcement(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enabled : Win32cr::Foundation::BOOL*) : UInt32

    # :nodoc:
    fun DhcpV4SetPolicyEnforcement(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enable : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun DhcpHlprIsV4PolicyWellFormed(pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DhcpHlprIsV4PolicyValid(pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    # :nodoc:
    fun DhcpV4CreatePolicy(server_ip_address : Win32cr::Foundation::PWSTR, pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    # :nodoc:
    fun DhcpV4GetPolicy(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY**) : UInt32

    # :nodoc:
    fun DhcpV4SetPolicy(server_ip_address : Win32cr::Foundation::PWSTR, fields_modified : UInt32, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    # :nodoc:
    fun DhcpV4DeletePolicy(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DhcpV4EnumPolicies(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpV4AddPolicyRange(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32

    # :nodoc:
    fun DhcpV4RemovePolicyRange(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32

    # :nodoc:
    fun DhcpV6SetStatelessStoreParams(server_ip_address : Win32cr::Foundation::PWSTR, fServerLevel : Win32cr::Foundation::BOOL, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, field_modified : UInt32, params : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_PARAMS*) : UInt32

    # :nodoc:
    fun DhcpV6GetStatelessStoreParams(server_ip_address : Win32cr::Foundation::PWSTR, fServerLevel : Win32cr::Foundation::BOOL, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, params : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_PARAMS**) : UInt32

    # :nodoc:
    fun DhcpV6GetStatelessStatistics(server_ip_address : Win32cr::Foundation::PWSTR, stateless_stats : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_STATS**) : UInt32

    # :nodoc:
    fun DhcpV4CreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB*) : UInt32

    # :nodoc:
    fun DhcpV4EnumSubnetClients(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpV4GetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB**) : UInt32

    # :nodoc:
    fun DhcpV6CreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6*) : UInt32

    # :nodoc:
    fun DhcpV4GetFreeIPAddress(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, start_ip : UInt32, end_ip : UInt32, num_free_addr_req : UInt32, ip_addr_list : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY**) : UInt32

    # :nodoc:
    fun DhcpV6GetFreeIPAddress(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, start_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, end_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, num_free_addr_req : UInt32, ip_addr_list : Win32cr::NetworkManagement::Dhcp::DHCPV6_IP_ARRAY**) : UInt32

    # :nodoc:
    fun DhcpV4CreateClientInfoEx(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX*) : UInt32

    # :nodoc:
    fun DhcpV4EnumSubnetClientsEx(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    # :nodoc:
    fun DhcpV4GetClientInfoEx(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX**) : UInt32

    # :nodoc:
    fun DhcpV4CreatePolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, policy_ex : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : UInt32

    # :nodoc:
    fun DhcpV4GetPolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX**) : UInt32

    # :nodoc:
    fun DhcpV4SetPolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, fields_modified : UInt32, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : UInt32

    # :nodoc:
    fun DhcpV4EnumPoliciesEx(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

  end
end