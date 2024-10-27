require "./../foundation.cr"

module Win32cr::NetworkManagement::Dhcp
  alias LPDHCP_CONTROL = Proc(UInt32, Void*, UInt32)*

  alias LPDHCP_NEWPKT = Proc(UInt8**, UInt32*, UInt32, Void*, Void**, Int32*, UInt32)*

  alias LPDHCP_DROP_SEND = Proc(UInt8**, UInt32*, UInt32, UInt32, Void*, Void*, UInt32)*

  alias LPDHCP_PROB = Proc(UInt8*, UInt32, UInt32, UInt32, UInt32, Void*, Void*, UInt32)*

  alias LPDHCP_GIVE_ADDRESS = Proc(UInt8*, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Void*, Void*, UInt32)*

  alias LPDHCP_HANDLE_OPTIONS = Proc(UInt8*, UInt32, Void*, Void*, Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_OPTIONS*, UInt32)*

  alias LPDHCP_DELETE_CLIENT = Proc(UInt32, UInt8*, UInt32, UInt32, UInt32, UInt32)*

  alias LPDHCP_ENTRY_POINT_FUNC = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::NetworkManagement::Dhcp::DHCP_CALLOUT_TABLE*, UInt32)*

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
  record DHCPV6CAPI_PARAMS,
    flags : UInt32,
    option_id : UInt32,
    is_vendor : Win32cr::Foundation::BOOL,
    data : UInt8*,
    nBytesData : UInt32

  @[Extern]
  record DHCPV6CAPI_PARAMS_ARRAY,
    nParams : UInt32,
    params : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_PARAMS*

  @[Extern]
  record DHCPV6CAPI_CLASSID,
    flags : UInt32,
    data : UInt8*,
    nBytesData : UInt32

  @[Extern]
  record DHCPV6Prefix,
    prefix : UInt8[16],
    prefixLength : UInt32,
    preferredLifeTime : UInt32,
    validLifeTime : UInt32,
    status : Win32cr::NetworkManagement::Dhcp::StatusCode

  @[Extern]
  record DHCPV6PrefixLeaseInformation,
    nPrefixes : UInt32,
    prefixArray : Win32cr::NetworkManagement::Dhcp::DHCPV6Prefix*,
    iaid : UInt32,
    t1 : Int64,
    t2 : Int64,
    max_lease_expiration_time : Int64,
    last_renewal_time : Int64,
    status : Win32cr::NetworkManagement::Dhcp::StatusCode,
    server_id : UInt8*,
    server_id_len : UInt32

  @[Extern]
  record DHCPAPI_PARAMS,
    flags : UInt32,
    option_id : UInt32,
    is_vendor : Win32cr::Foundation::BOOL,
    data : UInt8*,
    nBytesData : UInt32

  @[Extern]
  record DHCPCAPI_PARAMS_ARRAY,
    nParams : UInt32,
    params : Win32cr::NetworkManagement::Dhcp::DHCPAPI_PARAMS*

  @[Extern]
  record DHCPCAPI_CLASSID,
    flags : UInt32,
    data : UInt8*,
    nBytesData : UInt32

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record DHCP_SERVER_OPTIONS,
    message_type : UInt8*,
    subnet_mask : UInt32*,
    requested_address : UInt32*,
    request_lease_time : UInt32*,
    overlay_fields : UInt8*,
    router_address : UInt32*,
    server : UInt32*,
    parameter_request_list : UInt8*,
    parameter_request_list_length : UInt32,
    machine_name : Win32cr::Foundation::PSTR,
    machine_name_length : UInt32,
    client_hardware_address_type : UInt8,
    client_hardware_address_length : UInt8,
    client_hardware_address : UInt8*,
    class_identifier : Win32cr::Foundation::PSTR,
    class_identifier_length : UInt32,
    vendor_class : UInt8*,
    vendor_class_length : UInt32,
    dns_flags : UInt32,
    dns_name_length : UInt32,
    dns_name : UInt8*,
    ds_domain_name_requested : Win32cr::Foundation::BOOLEAN,
    ds_domain_name : Win32cr::Foundation::PSTR,
    ds_domain_name_len : UInt32,
    scope_id : UInt32*
  {% end %}

  @[Extern]
  record DHCP_CALLOUT_TABLE,
    dhcp_control_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_CONTROL,
    dhcp_new_pkt_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_NEWPKT,
    dhcp_pkt_drop_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DROP_SEND,
    dhcp_pkt_send_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DROP_SEND,
    dhcp_address_del_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_PROB,
    dhcp_address_offer_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_GIVE_ADDRESS,
    dhcp_handle_options_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_HANDLE_OPTIONS,
    dhcp_delete_client_hook : Win32cr::NetworkManagement::Dhcp::LPDHCP_DELETE_CLIENT,
    dhcp_extension_hook : Void*,
    dhcp_reserved_hook : Void*

  @[Extern]
  record DATE_TIME,
    dwLowDateTime : UInt32,
    dwHighDateTime : UInt32

  @[Extern]
  record DHCP_IP_RANGE,
    start_address : UInt32,
    end_address : UInt32

  @[Extern]
  record DHCP_BINARY_DATA,
    data_length : UInt32,
    data : UInt8*

  @[Extern]
  record DHCP_HOST_INFO,
    ip_address : UInt32,
    net_bios_name : Win32cr::Foundation::PWSTR,
    host_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DWORD_DWORD,
    d_word1 : UInt32,
    d_word2 : UInt32

  @[Extern]
  record DHCP_SUBNET_INFO,
    subnet_address : UInt32,
    subnet_mask : UInt32,
    subnet_name : Win32cr::Foundation::PWSTR,
    subnet_comment : Win32cr::Foundation::PWSTR,
    primary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    subnet_state : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_STATE

  @[Extern]
  record DHCP_SUBNET_INFO_VQ,
    subnet_address : UInt32,
    subnet_mask : UInt32,
    subnet_name : Win32cr::Foundation::PWSTR,
    subnet_comment : Win32cr::Foundation::PWSTR,
    primary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    subnet_state : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_STATE,
    quarantine_on : UInt32,
    reserved1 : UInt32,
    reserved2 : UInt32,
    reserved3 : Int64,
    reserved4 : Int64

  @[Extern]
  record DHCP_IP_ARRAY,
    num_elements : UInt32,
    elements : UInt32*

  @[Extern]
  record DHCP_IP_CLUSTER,
    cluster_address : UInt32,
    cluster_mask : UInt32

  @[Extern]
  record DHCP_IP_RESERVATION,
    reserved_ip_address : UInt32,
    reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*

  @[Extern]
  record DHCP_SUBNET_ELEMENT_DATA,
    element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE,
    element : DHCP_SUBNET_ELEMENT_UNION do

    # Nested Type DHCP_SUBNET_ELEMENT_UNION
    @[Extern(union: true)]
    record DHCP_SUBNET_ELEMENT_UNION,
      ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*,
      secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*,
      reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION*,
      exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*,
      ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*

  end

  @[Extern(union: true)]
  record DHCP_SUBNET_ELEMENT_UNION
  @[Extern]
  record DHCP_SUBNET_ELEMENT_INFO_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*

  @[Extern]
  record DHCP_IPV6_ADDRESS,
    high_order_bits : UInt64,
    low_order_bits : UInt64

  @[Extern]
  record DHCP_ADDR_PATTERN,
    match_hw_type : Win32cr::Foundation::BOOL,
    hw_type : UInt8,
    is_wildcard : Win32cr::Foundation::BOOL,
    length : UInt8,
    pattern : UInt8[255]

  @[Extern]
  record DHCP_FILTER_ADD_INFO,
    addr_patt : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN,
    comment : Win32cr::Foundation::PWSTR,
    list_type : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_LIST_TYPE

  @[Extern]
  record DHCP_FILTER_GLOBAL_INFO,
    enforce_allow_list : Win32cr::Foundation::BOOL,
    enforce_deny_list : Win32cr::Foundation::BOOL

  @[Extern]
  record DHCP_FILTER_RECORD,
    addr_patt : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN,
    comment : Win32cr::Foundation::PWSTR

  @[Extern]
  record DHCP_FILTER_ENUM_INFO,
    num_elements : UInt32,
    pEnumRecords : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_RECORD*

  @[Extern]
  record DHCP_OPTION_DATA_ELEMENT,
    option_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA_TYPE,
    element : DHCP_OPTION_ELEMENT_UNION do

    # Nested Type DHCP_OPTION_ELEMENT_UNION
    @[Extern(union: true)]
    record DHCP_OPTION_ELEMENT_UNION,
      byte_option : UInt8,
      word_option : UInt16,
      d_word_option : UInt32,
      d_word_d_word_option : Win32cr::NetworkManagement::Dhcp::DWORD_DWORD,
      ip_address_option : UInt32,
      string_data_option : Win32cr::Foundation::PWSTR,
      binary_data_option : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
      encapsulated_data_option : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
      ipv6_address_data_option : Win32cr::Foundation::PWSTR

  end

  @[Extern(union: true)]
  record DHCP_OPTION_ELEMENT_UNION
  @[Extern]
  record DHCP_OPTION_DATA,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA_ELEMENT*

  @[Extern]
  record DHCP_OPTION,
    option_id : UInt32,
    option_name : Win32cr::Foundation::PWSTR,
    option_comment : Win32cr::Foundation::PWSTR,
    default_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA,
    option_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_TYPE

  @[Extern]
  record DHCP_OPTION_ARRAY,
    num_elements : UInt32,
    options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*

  @[Extern]
  record DHCP_OPTION_VALUE,
    option_id : UInt32,
    value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA

  @[Extern]
  record DHCP_OPTION_VALUE_ARRAY,
    num_elements : UInt32,
    values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE*

  @[Extern]
  record DHCP_RESERVED_SCOPE,
    reserved_ip_address : UInt32,
    reserved_ip_subnet_address : UInt32

  @[Extern]
  record DHCP_OPTION_SCOPE_INFO,
    scope_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_TYPE,
    scope_info : DHCP_OPTION_SCOPE_UNION do

    # Nested Type DHCP_OPTION_SCOPE_UNION
    @[Extern(union: true)]
    record DHCP_OPTION_SCOPE_UNION,
      default_scope_info : Void*,
      global_scope_info : Void*,
      subnet_scope_info : UInt32,
      reserved_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVED_SCOPE,
      m_scope_info : Win32cr::Foundation::PWSTR

  end

  @[Extern]
  record DHCP_RESERVED_SCOPE6,
    reserved_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    reserved_ip_subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS

  @[Extern]
  record DHCP_OPTION_SCOPE_INFO6,
    scope_type : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_TYPE6,
    scope_info : DHCP_OPTION_SCOPE_UNION6 do

    # Nested Type DHCP_OPTION_SCOPE_UNION6
    @[Extern(union: true)]
    record DHCP_OPTION_SCOPE_UNION6,
      default_scope_info : Void*,
      subnet_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
      reserved_scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVED_SCOPE6

  end

  @[Extern(union: true)]
  record DHCP_OPTION_SCOPE_UNION6
  @[Extern]
  record DHCP_OPTION_LIST,
    num_options : UInt32,
    options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE*

  @[Extern]
  record DHCP_CLIENT_INFO,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO

  @[Extern]
  record DHCP_CLIENT_INFO_ARRAY,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO**

  @[Extern]
  record DHCP_CLIENT_INFO_VQ,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8,
    address_state : UInt8,
    status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus,
    probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    quarantine_capable : Win32cr::Foundation::BOOL

  @[Extern]
  record DHCP_CLIENT_INFO_ARRAY_VQ,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ**

  @[Extern]
  record DHCP_CLIENT_FILTER_STATUS_INFO,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8,
    address_state : UInt8,
    status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus,
    probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    quarantine_capable : Win32cr::Foundation::BOOL,
    filter_status : UInt32

  @[Extern]
  record DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_FILTER_STATUS_INFO**

  @[Extern]
  record DHCP_CLIENT_INFO_PB,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8,
    address_state : UInt8,
    status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus,
    probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    quarantine_capable : Win32cr::Foundation::BOOL,
    filter_status : UInt32,
    policy_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DHCP_CLIENT_INFO_PB_ARRAY,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB**

  @[Extern]
  record DHCP_SEARCH_INFO,
    search_type : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_TYPE,
    search_info : DHCP_CLIENT_SEARCH_UNION do

    # Nested Type DHCP_CLIENT_SEARCH_UNION
    @[Extern(union: true)]
    record DHCP_CLIENT_SEARCH_UNION,
      client_ip_address : UInt32,
      client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
      client_name : Win32cr::Foundation::PWSTR

  end

  @[Extern(union: true)]
  record DHCP_CLIENT_SEARCH_UNION
  @[Extern]
  record DHCP_PROPERTY,
    id : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ID,
    type__ : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_TYPE,
    value : DHCP_PROPERTY_VALUE_UNION do

    # Nested Type DHCP_PROPERTY_VALUE_UNION
    @[Extern(union: true)]
    record DHCP_PROPERTY_VALUE_UNION,
      byte_value : UInt8,
      word_value : UInt16,
      d_word_value : UInt32,
      string_value : Win32cr::Foundation::PWSTR,
      binary_value : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA

  end

  @[Extern]
  record DHCP_PROPERTY_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*

  @[Extern]
  record DHCP_CLIENT_INFO_EX,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8,
    address_state : UInt8,
    status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus,
    probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    quarantine_capable : Win32cr::Foundation::BOOL,
    filter_status : UInt32,
    policy_name : Win32cr::Foundation::PWSTR,
    properties : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*

  @[Extern]
  record DHCP_CLIENT_INFO_EX_ARRAY,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX**

  @[Extern]
  record SCOPE_MIB_INFO,
    subnet : UInt32,
    num_addresses_inuse : UInt32,
    num_addresses_free : UInt32,
    num_pending_offers : UInt32

  @[Extern]
  record DHCP_MIB_INFO,
    discovers : UInt32,
    offers : UInt32,
    requests : UInt32,
    acks : UInt32,
    naks : UInt32,
    declines : UInt32,
    releases : UInt32,
    server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    scopes : UInt32,
    scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO*

  @[Extern]
  record SCOPE_MIB_INFO_VQ,
    subnet : UInt32,
    num_addresses_inuse : UInt32,
    num_addresses_free : UInt32,
    num_pending_offers : UInt32,
    qtn_num_leases : UInt32,
    qtn_pct_qtn_leases : UInt32,
    qtn_probation_leases : UInt32,
    qtn_non_qtn_leases : UInt32,
    qtn_exempt_leases : UInt32,
    qtn_capable_clients : UInt32

  @[Extern]
  record DHCP_MIB_INFO_VQ,
    discovers : UInt32,
    offers : UInt32,
    requests : UInt32,
    acks : UInt32,
    naks : UInt32,
    declines : UInt32,
    releases : UInt32,
    server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    qtn_num_leases : UInt32,
    qtn_pct_qtn_leases : UInt32,
    qtn_probation_leases : UInt32,
    qtn_non_qtn_leases : UInt32,
    qtn_exempt_leases : UInt32,
    qtn_capable_clients : UInt32,
    qtn_ias_errors : UInt32,
    scopes : UInt32,
    scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_VQ*

  @[Extern]
  record SCOPE_MIB_INFO_V5,
    subnet : UInt32,
    num_addresses_inuse : UInt32,
    num_addresses_free : UInt32,
    num_pending_offers : UInt32

  @[Extern]
  record DHCP_MIB_INFO_V5,
    discovers : UInt32,
    offers : UInt32,
    requests : UInt32,
    acks : UInt32,
    naks : UInt32,
    declines : UInt32,
    releases : UInt32,
    server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    qtn_num_leases : UInt32,
    qtn_pct_qtn_leases : UInt32,
    qtn_probation_leases : UInt32,
    qtn_non_qtn_leases : UInt32,
    qtn_exempt_leases : UInt32,
    qtn_capable_clients : UInt32,
    qtn_ias_errors : UInt32,
    delayed_offers : UInt32,
    scopes_with_delayed_offers : UInt32,
    scopes : UInt32,
    scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_V5*

  @[Extern]
  record DHCP_SERVER_CONFIG_INFO,
    api_protocol_support : UInt32,
    database_name : Win32cr::Foundation::PWSTR,
    database_path : Win32cr::Foundation::PWSTR,
    backup_path : Win32cr::Foundation::PWSTR,
    backup_interval : UInt32,
    database_logging_flag : UInt32,
    restore_flag : UInt32,
    database_cleanup_interval : UInt32,
    debug_flag : UInt32

  @[Extern]
  record DHCP_SCAN_ITEM,
    ip_address : UInt32,
    scan_flag : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_FLAG

  @[Extern]
  record DHCP_SCAN_LIST,
    num_scan_items : UInt32,
    scan_items : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_ITEM*

  @[Extern]
  record DHCP_CLASS_INFO,
    class_name : Win32cr::Foundation::PWSTR,
    class_comment : Win32cr::Foundation::PWSTR,
    class_data_length : UInt32,
    is_vendor : Win32cr::Foundation::BOOL,
    flags : UInt32,
    class_data : UInt8*

  @[Extern]
  record DHCP_CLASS_INFO_ARRAY,
    num_elements : UInt32,
    classes : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*

  @[Extern]
  record DHCP_CLASS_INFO_V6,
    class_name : Win32cr::Foundation::PWSTR,
    class_comment : Win32cr::Foundation::PWSTR,
    class_data_length : UInt32,
    is_vendor : Win32cr::Foundation::BOOL,
    enterprise_number : UInt32,
    flags : UInt32,
    class_data : UInt8*

  @[Extern]
  record DHCP_CLASS_INFO_ARRAY_V6,
    num_elements : UInt32,
    classes : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*

  @[Extern]
  record DHCP_SERVER_SPECIFIC_STRINGS,
    default_vendor_class_name : Win32cr::Foundation::PWSTR,
    default_user_class_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DHCP_IP_RESERVATION_V4,
    reserved_ip_address : UInt32,
    reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*,
    bAllowedClientTypes : UInt8

  @[Extern]
  record DHCP_IP_RESERVATION_INFO,
    reserved_ip_address : UInt32,
    reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    reserved_client_name : Win32cr::Foundation::PWSTR,
    reserved_client_desc : Win32cr::Foundation::PWSTR,
    bAllowedClientTypes : UInt8,
    fOptionsPresent : UInt8

  @[Extern]
  record DHCP_RESERVATION_INFO_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_INFO**

  @[Extern]
  record DHCP_SUBNET_ELEMENT_DATA_V4,
    element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE,
    element : DHCP_SUBNET_ELEMENT_UNION_V4 do

    # Nested Type DHCP_SUBNET_ELEMENT_UNION_V4
    @[Extern(union: true)]
    record DHCP_SUBNET_ELEMENT_UNION_V4,
      ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*,
      secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*,
      reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V4*,
      exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*,
      ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*

  end

  @[Extern(union: true)]
  record DHCP_SUBNET_ELEMENT_UNION_V4
  @[Extern]
  record DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*

  @[Extern]
  record DHCP_CLIENT_INFO_V4,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8

  @[Extern]
  record DHCP_CLIENT_INFO_ARRAY_V4,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4**

  @[Extern]
  record DHCP_SERVER_CONFIG_INFO_V4,
    api_protocol_support : UInt32,
    database_name : Win32cr::Foundation::PWSTR,
    database_path : Win32cr::Foundation::PWSTR,
    backup_path : Win32cr::Foundation::PWSTR,
    backup_interval : UInt32,
    database_logging_flag : UInt32,
    restore_flag : UInt32,
    database_cleanup_interval : UInt32,
    debug_flag : UInt32,
    dwPingRetries : UInt32,
    cbBootTableString : UInt32,
    wszBootTableString : Win32cr::Foundation::PWSTR,
    fAuditLog : Win32cr::Foundation::BOOL

  @[Extern]
  record DHCP_SERVER_CONFIG_INFO_VQ,
    api_protocol_support : UInt32,
    database_name : Win32cr::Foundation::PWSTR,
    database_path : Win32cr::Foundation::PWSTR,
    backup_path : Win32cr::Foundation::PWSTR,
    backup_interval : UInt32,
    database_logging_flag : UInt32,
    restore_flag : UInt32,
    database_cleanup_interval : UInt32,
    debug_flag : UInt32,
    dwPingRetries : UInt32,
    cbBootTableString : UInt32,
    wszBootTableString : Win32cr::Foundation::PWSTR,
    fAuditLog : Win32cr::Foundation::BOOL,
    quarantine_on : Win32cr::Foundation::BOOL,
    quar_def_fail : UInt32,
    quar_runtime_status : Win32cr::Foundation::BOOL

  @[Extern]
  record DHCP_SERVER_CONFIG_INFO_V6,
    unicast_flag : Win32cr::Foundation::BOOL,
    rapid_commit_flag : Win32cr::Foundation::BOOL,
    preferred_lifetime : UInt32,
    valid_lifetime : UInt32,
    t1 : UInt32,
    t2 : UInt32,
    preferred_lifetime_iata : UInt32,
    valid_lifetime_iata : UInt32,
    fAuditLog : Win32cr::Foundation::BOOL

  @[Extern]
  record DHCP_SUPER_SCOPE_TABLE_ENTRY,
    subnet_address : UInt32,
    super_scope_number : UInt32,
    next_in_super_scope : UInt32,
    super_scope_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DHCP_SUPER_SCOPE_TABLE,
    cEntries : UInt32,
    pEntries : Win32cr::NetworkManagement::Dhcp::DHCP_SUPER_SCOPE_TABLE_ENTRY*

  @[Extern]
  record DHCP_CLIENT_INFO_V5,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8,
    address_state : UInt8

  @[Extern]
  record DHCP_CLIENT_INFO_ARRAY_V5,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V5**

  @[Extern]
  record DHCP_ALL_OPTIONS,
    flags : UInt32,
    non_vendor_options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY*,
    num_vendor_options : UInt32,
    vendor_options : Anonymous_e__Struct* do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      option : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION,
      vendor_name : Win32cr::Foundation::PWSTR,
      class_name : Win32cr::Foundation::PWSTR

  end

  @[Extern]
  record DHCP_ALL_OPTION_VALUES,
    flags : UInt32,
    num_elements : UInt32,
    options : Anonymous_e__Struct* do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      class_name : Win32cr::Foundation::PWSTR,
      vendor_name : Win32cr::Foundation::PWSTR,
      is_vendor : Win32cr::Foundation::BOOL,
      options_array : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*

  end

  @[Extern]
  record DHCP_ALL_OPTION_VALUES_PB,
    flags : UInt32,
    num_elements : UInt32,
    options : Anonymous_e__Struct* do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      policy_name : Win32cr::Foundation::PWSTR,
      vendor_name : Win32cr::Foundation::PWSTR,
      is_vendor : Win32cr::Foundation::BOOL,
      options_array : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*

  end

  @[Extern]
  record DHCPDS_SERVER,
    version : UInt32,
    server_name : Win32cr::Foundation::PWSTR,
    server_address : UInt32,
    flags : UInt32,
    state : UInt32,
    ds_location : Win32cr::Foundation::PWSTR,
    ds_loc_type : UInt32

  @[Extern]
  record DHCPDS_SERVERS,
    flags : UInt32,
    num_elements : UInt32,
    servers : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*

  @[Extern]
  record DHCP_ATTRIB,
    dhcp_attrib_id : UInt32,
    dhcp_attrib_type : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      dhcp_attrib_bool : Win32cr::Foundation::BOOL,
      dhcp_attrib_ulong : UInt32

  end

  @[Extern]
  record DHCP_ATTRIB_ARRAY,
    num_elements : UInt32,
    dhcp_attribs : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB*

  @[Extern]
  record DHCP_BOOTP_IP_RANGE,
    start_address : UInt32,
    end_address : UInt32,
    bootp_allocated : UInt32,
    max_bootp_allowed : UInt32

  @[Extern]
  record DHCP_SUBNET_ELEMENT_DATA_V5,
    element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE,
    element : DHCP_SUBNET_ELEMENT_UNION_V5 do

    # Nested Type DHCP_SUBNET_ELEMENT_UNION_V5
    @[Extern(union: true)]
    record DHCP_SUBNET_ELEMENT_UNION_V5,
      ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_BOOTP_IP_RANGE*,
      secondary_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO*,
      reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V4*,
      exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*,
      ip_used_cluster : Win32cr::NetworkManagement::Dhcp::DHCP_IP_CLUSTER*

  end

  @[Extern]
  record DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*

  @[Extern]
  record DHCP_PERF_STATS,
    dwNumPacketsReceived : UInt32,
    dwNumPacketsDuplicate : UInt32,
    dwNumPacketsExpired : UInt32,
    dwNumMilliSecondsProcessed : UInt32,
    dwNumPacketsInActiveQueue : UInt32,
    dwNumPacketsInPingQueue : UInt32,
    dwNumDiscoversReceived : UInt32,
    dwNumOffersSent : UInt32,
    dwNumRequestsReceived : UInt32,
    dwNumInformsReceived : UInt32,
    dwNumAcksSent : UInt32,
    dwNumNacksSent : UInt32,
    dwNumDeclinesReceived : UInt32,
    dwNumReleasesReceived : UInt32,
    dwNumDelayedOfferInQueue : UInt32,
    dwNumPacketsProcessed : UInt32,
    dwNumPacketsInQuarWaitingQueue : UInt32,
    dwNumPacketsInQuarReadyQueue : UInt32,
    dwNumPacketsInQuarDecisionQueue : UInt32

  @[Extern]
  record DHCP_BIND_ELEMENT,
    flags : UInt32,
    fBoundToDHCPServer : Win32cr::Foundation::BOOL,
    adapter_primary_address : UInt32,
    adapter_subnet_address : UInt32,
    if_description : Win32cr::Foundation::PWSTR,
    if_id_size : UInt32,
    if_id : UInt8*

  @[Extern]
  record DHCP_BIND_ELEMENT_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT*

  @[Extern]
  record DHCPV6_BIND_ELEMENT,
    flags : UInt32,
    fBoundToDHCPServer : Win32cr::Foundation::BOOL,
    adapter_primary_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    adapter_subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    if_description : Win32cr::Foundation::PWSTR,
    ip_v6_if_index : UInt32,
    if_id_size : UInt32,
    if_id : UInt8*

  @[Extern]
  record DHCPV6_BIND_ELEMENT_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT*

  @[Extern]
  record DHCP_IP_RANGE_V6,
    start_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    end_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS

  @[Extern]
  record DHCP_HOST_INFO_V6,
    ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    net_bios_name : Win32cr::Foundation::PWSTR,
    host_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DHCP_SUBNET_INFO_V6,
    subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    prefix : UInt32,
    preference : UInt16,
    subnet_name : Win32cr::Foundation::PWSTR,
    subnet_comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    scope_id : UInt32

  @[Extern]
  record SCOPE_MIB_INFO_V6,
    subnet : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    num_addresses_inuse : UInt64,
    num_addresses_free : UInt64,
    num_pending_advertises : UInt64

  @[Extern]
  record DHCP_MIB_INFO_V6,
    solicits : UInt32,
    advertises : UInt32,
    requests : UInt32,
    renews : UInt32,
    rebinds : UInt32,
    replies : UInt32,
    confirms : UInt32,
    declines : UInt32,
    releases : UInt32,
    informs : UInt32,
    server_start_time : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    scopes : UInt32,
    scope_info : Win32cr::NetworkManagement::Dhcp::SCOPE_MIB_INFO_V6*

  @[Extern]
  record DHCP_IP_RESERVATION_V6,
    reserved_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    reserved_for_client : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA*,
    interface_id : UInt32

  @[Extern]
  record DHCP_SUBNET_ELEMENT_DATA_V6,
    element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE_V6,
    element : DHCP_SUBNET_ELEMENT_UNION_V6 do

    # Nested Type DHCP_SUBNET_ELEMENT_UNION_V6
    @[Extern(union: true)]
    record DHCP_SUBNET_ELEMENT_UNION_V6,
      ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_V6*,
      reserved_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RESERVATION_V6*,
      exclude_ip_range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_V6*

  end

  @[Extern(union: true)]
  record DHCP_SUBNET_ELEMENT_UNION_V6
  @[Extern]
  record DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*

  @[Extern]
  record DHCP_CLIENT_INFO_V6,
    client_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    client_duid : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    address_type : UInt32,
    iaid : UInt32,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_valid_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    client_pref_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO_V6

  @[Extern]
  record DHCPV6_IP_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS*

  @[Extern]
  record DHCP_CLIENT_INFO_ARRAY_V6,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6**

  @[Extern]
  record DHCP_SEARCH_INFO_V6,
    search_type : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_TYPE_V6,
    search_info : DHCP_CLIENT_SEARCH_UNION_V6 do

    # Nested Type DHCP_CLIENT_SEARCH_UNION_V6
    @[Extern(union: true)]
    record DHCP_CLIENT_SEARCH_UNION_V6,
      client_ip_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
      client_duid : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
      client_name : Win32cr::Foundation::PWSTR

  end

  @[Extern]
  record DHCP_POL_COND,
    parent_expr : UInt32,
    type__ : Win32cr::NetworkManagement::Dhcp::DHCP_POL_ATTR_TYPE,
    option_id : UInt32,
    sub_option_id : UInt32,
    vendor_name : Win32cr::Foundation::PWSTR,
    operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COMPARATOR,
    value : UInt8*,
    value_length : UInt32

  @[Extern]
  record DHCP_POL_COND_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND*

  @[Extern]
  record DHCP_POL_EXPR,
    parent_expr : UInt32,
    operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER

  @[Extern]
  record DHCP_POL_EXPR_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR*

  @[Extern]
  record DHCP_IP_RANGE_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*

  @[Extern]
  record DHCP_POLICY,
    policy_name : Win32cr::Foundation::PWSTR,
    is_global_policy : Win32cr::Foundation::BOOL,
    subnet : UInt32,
    processing_order : UInt32,
    conditions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND_ARRAY*,
    expressions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR_ARRAY*,
    ranges : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_ARRAY*,
    description : Win32cr::Foundation::PWSTR,
    enabled : Win32cr::Foundation::BOOL

  @[Extern]
  record DHCP_POLICY_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*

  @[Extern]
  record DHCP_POLICY_EX,
    policy_name : Win32cr::Foundation::PWSTR,
    is_global_policy : Win32cr::Foundation::BOOL,
    subnet : UInt32,
    processing_order : UInt32,
    conditions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COND_ARRAY*,
    expressions : Win32cr::NetworkManagement::Dhcp::DHCP_POL_EXPR_ARRAY*,
    ranges : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE_ARRAY*,
    description : Win32cr::Foundation::PWSTR,
    enabled : Win32cr::Foundation::BOOL,
    properties : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*

  @[Extern]
  record DHCP_POLICY_EX_ARRAY,
    num_elements : UInt32,
    elements : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*

  @[Extern]
  record DHCPV6_STATELESS_PARAMS,
    status : Win32cr::Foundation::BOOL,
    purge_interval : UInt32

  @[Extern]
  record DHCPV6_STATELESS_SCOPE_STATS,
    subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS,
    num_stateless_clients_added : UInt64,
    num_stateless_clients_removed : UInt64

  @[Extern]
  record DHCPV6_STATELESS_STATS,
    num_scopes : UInt32,
    scope_stats : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_SCOPE_STATS*

  @[Extern]
  record DHCP_FAILOVER_RELATIONSHIP,
    primary_server : UInt32,
    secondary_server : UInt32,
    mode : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_MODE,
    server_type : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_SERVER,
    state : Win32cr::NetworkManagement::Dhcp::FSM_STATE,
    prev_state : Win32cr::NetworkManagement::Dhcp::FSM_STATE,
    mclt : UInt32,
    safe_period : UInt32,
    relationship_name : Win32cr::Foundation::PWSTR,
    primary_server_name : Win32cr::Foundation::PWSTR,
    secondary_server_name : Win32cr::Foundation::PWSTR,
    pScopes : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY*,
    percentage : UInt8,
    shared_secret : Win32cr::Foundation::PWSTR

  @[Extern]
  record DHCP_FAILOVER_RELATIONSHIP_ARRAY,
    num_elements : UInt32,
    pRelationships : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*

  @[Extern]
  record DHCPV4_FAILOVER_CLIENT_INFO,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8,
    address_state : UInt8,
    status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus,
    probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    quarantine_capable : Win32cr::Foundation::BOOL,
    sent_pot_exp_time : UInt32,
    ack_pot_exp_time : UInt32,
    recv_pot_exp_time : UInt32,
    start_time : UInt32,
    clt_last_trans_time : UInt32,
    last_bnd_upd_time : UInt32,
    bnd_msg_status : UInt32,
    policy_name : Win32cr::Foundation::PWSTR,
    flags : UInt8

  @[Extern]
  record DHCPV4_FAILOVER_CLIENT_INFO_ARRAY,
    num_elements : UInt32,
    clients : Win32cr::NetworkManagement::Dhcp::DHCPV4_FAILOVER_CLIENT_INFO**

  @[Extern]
  record DHCPV4_FAILOVER_CLIENT_INFO_EX,
    client_ip_address : UInt32,
    subnet_mask : UInt32,
    client_hardware_address : Win32cr::NetworkManagement::Dhcp::DHCP_BINARY_DATA,
    client_name : Win32cr::Foundation::PWSTR,
    client_comment : Win32cr::Foundation::PWSTR,
    client_lease_expires : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    owner_host : Win32cr::NetworkManagement::Dhcp::DHCP_HOST_INFO,
    bClientType : UInt8,
    address_state : UInt8,
    status : Win32cr::NetworkManagement::Dhcp::QuarantineStatus,
    probation_ends : Win32cr::NetworkManagement::Dhcp::DATE_TIME,
    quarantine_capable : Win32cr::Foundation::BOOL,
    sent_pot_exp_time : UInt32,
    ack_pot_exp_time : UInt32,
    recv_pot_exp_time : UInt32,
    start_time : UInt32,
    clt_last_trans_time : UInt32,
    last_bnd_upd_time : UInt32,
    bnd_msg_status : UInt32,
    policy_name : Win32cr::Foundation::PWSTR,
    flags : UInt8,
    address_state_ex : UInt32

  @[Extern]
  record DHCP_FAILOVER_STATISTICS,
    num_addr : UInt32,
    addr_free : UInt32,
    addr_in_use : UInt32,
    partner_addr_free : UInt32,
    this_addr_free : UInt32,
    partner_addr_in_use : UInt32,
    this_addr_in_use : UInt32

  {% if flag?(:i386) %}
  @[Extern]
  record DHCP_SERVER_OPTIONS,
    message_type : UInt8*,
    subnet_mask : UInt32*,
    requested_address : UInt32*,
    request_lease_time : UInt32*,
    overlay_fields : UInt8*,
    router_address : UInt32*,
    server : UInt32*,
    parameter_request_list : UInt8*,
    parameter_request_list_length : UInt32,
    machine_name : Win32cr::Foundation::PSTR,
    machine_name_length : UInt32,
    client_hardware_address_type : UInt8,
    client_hardware_address_length : UInt8,
    client_hardware_address : UInt8*,
    class_identifier : Win32cr::Foundation::PSTR,
    class_identifier_length : UInt32,
    vendor_class : UInt8*,
    vendor_class_length : UInt32,
    dns_flags : UInt32,
    dns_name_length : UInt32,
    dns_name : UInt8*,
    ds_domain_name_requested : Win32cr::Foundation::BOOLEAN,
    ds_domain_name : Win32cr::Foundation::PSTR,
    ds_domain_name_len : UInt32,
    scope_id : UInt32*
  {% end %}

  @[Link("dhcpcsvc6")]
  @[Link("dhcpcsvc")]
  @[Link("dhcpsapi")]
  lib C
    fun Dhcpv6CApiInitialize(version : UInt32*) : Void

    fun Dhcpv6CApiCleanup : Void

    fun Dhcpv6RequestParams(forceNewInform : Win32cr::Foundation::BOOL, reserved : Void*, adapterName : Win32cr::Foundation::PWSTR, classId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, recdParams : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_PARAMS_ARRAY, buffer : UInt8*, pSize : UInt32*) : UInt32

    fun Dhcpv6RequestPrefix(adapterName : Win32cr::Foundation::PWSTR, pclassId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, prefixleaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*, pdwTimeToWait : UInt32*) : UInt32

    fun Dhcpv6RenewPrefix(adapterName : Win32cr::Foundation::PWSTR, pclassId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, prefixleaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*, pdwTimeToWait : UInt32*, bValidatePrefix : UInt32) : UInt32

    fun Dhcpv6ReleasePrefix(adapterName : Win32cr::Foundation::PWSTR, classId : Win32cr::NetworkManagement::Dhcp::DHCPV6CAPI_CLASSID*, leaseInfo : Win32cr::NetworkManagement::Dhcp::DHCPV6PrefixLeaseInformation*) : UInt32

    fun DhcpCApiInitialize(version : UInt32*) : UInt32

    fun DhcpCApiCleanup : Void

    fun DhcpRequestParams(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, class_id : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_CLASSID*, send_params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, recd_params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, buffer : UInt8*, pSize : UInt32*, request_id_str : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpUndoRequestParams(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, request_id_str : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpRegisterParamChange(flags : UInt32, reserved : Void*, adapter_name : Win32cr::Foundation::PWSTR, class_id : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_CLASSID*, params : Win32cr::NetworkManagement::Dhcp::DHCPCAPI_PARAMS_ARRAY, handle : Void*) : UInt32

    fun DhcpDeRegisterParamChange(flags : UInt32, reserved : Void*, event : Void*) : UInt32

    fun DhcpRemoveDNSRegistrations : UInt32

    fun DhcpGetOriginalSubnetMask(sAdapterName : Win32cr::Foundation::PWSTR, dwSubnetMask : UInt32*) : UInt32

    fun DhcpAddFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, add_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_ADD_INFO*, force_flag : Win32cr::Foundation::BOOL) : UInt32

    fun DhcpDeleteFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, delete_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN*) : UInt32

    fun DhcpSetFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, global_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_GLOBAL_INFO*) : UInt32

    fun DhcpGetFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, global_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_GLOBAL_INFO*) : UInt32

    fun DhcpEnumFilterV4(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : Win32cr::NetworkManagement::Dhcp::DHCP_ADDR_PATTERN*, preferred_maximum : UInt32, list_type : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_LIST_TYPE, enum_filter_info : Win32cr::NetworkManagement::Dhcp::DHCP_FILTER_ENUM_INFO**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpCreateSubnet(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO*) : UInt32

    fun DhcpSetSubnetInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO*) : UInt32

    fun DhcpGetSubnetInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO**) : UInt32

    fun DhcpEnumSubnets(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpAddSubnetElement(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*) : UInt32

    fun DhcpEnumSubnetElements(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpRemoveSubnetElement(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    fun DhcpDeleteSubnet(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    fun DhcpCreateOption(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    fun DhcpSetOptionInfo(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    fun DhcpGetOptionInfo(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32

    fun DhcpEnumOptions(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    fun DhcpRemoveOption(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32) : UInt32

    fun DhcpSetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    fun DhcpSetOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32

    fun DhcpGetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    fun DhcpEnumOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    fun DhcpRemoveOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, option_id : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32

    fun DhcpCreateClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ*) : UInt32

    fun DhcpSetClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ*) : UInt32

    fun DhcpGetClientInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_VQ**) : UInt32

    fun DhcpEnumSubnetClientsVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_VQ**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpEnumSubnetClientsFilterStatusInfo(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpCreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO*) : UInt32

    fun DhcpSetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO*) : UInt32

    fun DhcpGetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO**) : UInt32

    fun DhcpDeleteClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*) : UInt32

    fun DhcpEnumSubnetClients(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpGetClientOptions(server_ip_address : Win32cr::Foundation::PWSTR, client_ip_address : UInt32, client_subnet_mask : UInt32, client_options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_LIST**) : UInt32

    fun DhcpGetMibInfo(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO**) : UInt32

    fun DhcpServerSetConfig(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO*) : UInt32

    fun DhcpServerGetConfig(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO**) : UInt32

    fun DhcpScanDatabase(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, fix_flag : UInt32, scan_list : Win32cr::NetworkManagement::Dhcp::DHCP_SCAN_LIST**) : UInt32

    fun DhcpRpcFreeMemory(buffer_pointer : Void*) : Void

    fun DhcpGetVersion(server_ip_address : Win32cr::Foundation::PWSTR, major_version : UInt32*, minor_version : UInt32*) : UInt32

    fun DhcpAddSubnetElementV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*) : UInt32

    fun DhcpEnumSubnetElementsV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpRemoveSubnetElementV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V4*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    fun DhcpCreateClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4*) : UInt32

    fun DhcpSetClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4*) : UInt32

    fun DhcpGetClientInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V4**) : UInt32

    fun DhcpEnumSubnetClientsV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V4**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpServerSetConfigV4(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V4*) : UInt32

    fun DhcpServerGetConfigV4(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V4**) : UInt32

    fun DhcpSetSuperScopeV4(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, super_scope_name : Win32cr::Foundation::PWSTR, change_existing : Win32cr::Foundation::BOOL) : UInt32

    fun DhcpDeleteSuperScopeV4(server_ip_address : Win32cr::Foundation::PWSTR, super_scope_name : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpGetSuperScopeInfoV4(server_ip_address : Win32cr::Foundation::PWSTR, super_scope_table : Win32cr::NetworkManagement::Dhcp::DHCP_SUPER_SCOPE_TABLE**) : UInt32

    fun DhcpEnumSubnetClientsV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V5**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpCreateOptionV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    fun DhcpSetOptionInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    fun DhcpGetOptionInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32

    fun DhcpEnumOptionsV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    fun DhcpRemoveOptionV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpSetOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    fun DhcpSetOptionValuesV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32

    fun DhcpGetOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    fun DhcpGetOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    fun DhcpEnumOptionValuesV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    fun DhcpRemoveOptionValueV5(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32

    fun DhcpCreateClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*) : UInt32

    fun DhcpModifyClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*) : UInt32

    fun DhcpDeleteClass(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_name : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpGetClassInfo(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, partial_class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO*, filled_class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO**) : UInt32

    fun DhcpEnumClasses(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, class_info_array : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_ARRAY**, nRead : UInt32*, nTotal : UInt32*) : UInt32

    fun DhcpGetAllOptions(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_struct : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTIONS**) : UInt32

    fun DhcpGetAllOptionsV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_struct : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTIONS**) : UInt32

    fun DhcpGetAllOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES**) : UInt32

    fun DhcpGetAllOptionValuesV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES**) : UInt32

    fun DhcpEnumServers(flags : UInt32, id_info : Void*, servers : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVERS**, callback_fn : Void*, callback_data : Void*) : UInt32

    fun DhcpAddServer(flags : UInt32, id_info : Void*, new_server : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*, callback_fn : Void*, callback_data : Void*) : UInt32

    fun DhcpDeleteServer(flags : UInt32, id_info : Void*, new_server : Win32cr::NetworkManagement::Dhcp::DHCPDS_SERVER*, callback_fn : Void*, callback_data : Void*) : UInt32

    fun DhcpGetServerBindingInfo(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_elements_info : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT_ARRAY**) : UInt32

    fun DhcpSetServerBindingInfo(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_BIND_ELEMENT_ARRAY*) : UInt32

    fun DhcpAddSubnetElementV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*) : UInt32

    fun DhcpEnumSubnetElementsV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpRemoveSubnetElementV5(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V5*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    fun DhcpV4EnumSubnetReservations(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_RESERVATION_INFO_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpCreateOptionV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    fun DhcpRemoveOptionV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpEnumOptionsV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, options : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    fun DhcpRemoveOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*) : UInt32

    fun DhcpGetOptionInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION**) : UInt32

    fun DhcpSetOptionInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, option_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION*) : UInt32

    fun DhcpSetOptionValueV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    fun DhcpGetSubnetInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ**) : UInt32

    fun DhcpCreateSubnetVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ*) : UInt32

    fun DhcpSetSubnetInfoVQ(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_VQ*) : UInt32

    fun DhcpEnumOptionValuesV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, class_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, resume_handle : UInt32*, preferred_maximum : UInt32, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY**, options_read : UInt32*, options_total : UInt32*) : UInt32

    fun DhcpDsInit : UInt32

    fun DhcpDsCleanup : Void

    fun DhcpSetThreadOptions(flags : UInt32, reserved : Void*) : UInt32

    fun DhcpGetThreadOptions(pFlags : UInt32*, reserved : Void*) : UInt32

    fun DhcpServerQueryAttribute(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32, dhcp_attrib_id : UInt32, pDhcpAttrib : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB**) : UInt32

    fun DhcpServerQueryAttributes(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32, dwAttribCount : UInt32, pDhcpAttribs : UInt32*, pDhcpAttribArr : Win32cr::NetworkManagement::Dhcp::DHCP_ATTRIB_ARRAY**) : UInt32

    fun DhcpServerRedoAuthorization(server_ip_addr : Win32cr::Foundation::PWSTR, dwReserved : UInt32) : UInt32

    fun DhcpAuditLogSetParams(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, audit_log_dir : Win32cr::Foundation::PWSTR, disk_check_interval : UInt32, max_log_files_size : UInt32, min_space_on_disk : UInt32) : UInt32

    fun DhcpAuditLogGetParams(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, audit_log_dir : Win32cr::Foundation::PWSTR*, disk_check_interval : UInt32*, max_log_files_size : UInt32*, min_space_on_disk : UInt32*) : UInt32

    fun DhcpServerQueryDnsRegCredentials(server_ip_address : Win32cr::Foundation::PWSTR, uname_size : UInt32, uname : UInt16*, domain_size : UInt32, domain : UInt16*) : UInt32

    fun DhcpServerSetDnsRegCredentials(server_ip_address : Win32cr::Foundation::PWSTR, uname : Win32cr::Foundation::PWSTR, domain : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpServerSetDnsRegCredentialsV5(server_ip_address : Win32cr::Foundation::PWSTR, uname : Win32cr::Foundation::PWSTR, domain : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpServerBackupDatabase(server_ip_address : Win32cr::Foundation::PWSTR, path : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpServerRestoreDatabase(server_ip_address : Win32cr::Foundation::PWSTR, path : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpServerSetConfigVQ(server_ip_address : Win32cr::Foundation::PWSTR, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ*) : UInt32

    fun DhcpServerGetConfigVQ(server_ip_address : Win32cr::Foundation::PWSTR, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ**) : UInt32

    fun DhcpGetServerSpecificStrings(server_ip_address : Win32cr::Foundation::PWSTR, server_specific_strings : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_SPECIFIC_STRINGS**) : UInt32

    fun DhcpServerAuditlogParamsFree(config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_VQ*) : Void

    fun DhcpCreateSubnetV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6*) : UInt32

    fun DhcpDeleteSubnetV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    fun DhcpEnumSubnetsV6(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_IP_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpAddSubnetElementV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, add_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*) : UInt32

    fun DhcpRemoveSubnetElementV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, remove_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_DATA_V6*, force_flag : Win32cr::NetworkManagement::Dhcp::DHCP_FORCE_FLAG) : UInt32

    fun DhcpEnumSubnetElementsV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, enum_element_type : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_TYPE_V6, resume_handle : UInt32*, preferred_maximum : UInt32, enum_element_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpGetSubnetInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6**) : UInt32

    fun DhcpEnumSubnetClientsV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, resume_handle : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_ARRAY_V6**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpServerGetConfigV6(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V6**) : UInt32

    fun DhcpServerSetConfigV6(server_ip_address : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO6*, fields_to_set : UInt32, config_info : Win32cr::NetworkManagement::Dhcp::DHCP_SERVER_CONFIG_INFO_V6*) : UInt32

    fun DhcpSetSubnetInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, subnet_info : Win32cr::NetworkManagement::Dhcp::DHCP_SUBNET_INFO_V6*) : UInt32

    fun DhcpGetMibInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO_V6**) : UInt32

    fun DhcpGetServerBindingInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_elements_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT_ARRAY**) : UInt32

    fun DhcpSetServerBindingInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, bind_element_info : Win32cr::NetworkManagement::Dhcp::DHCPV6_BIND_ELEMENT_ARRAY*) : UInt32

    fun DhcpSetClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6*) : UInt32

    fun DhcpGetClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_V6*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6**) : UInt32

    fun DhcpDeleteClientInfoV6(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO_V6*) : UInt32

    fun DhcpCreateClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*) : UInt32

    fun DhcpModifyClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_V6*) : UInt32

    fun DhcpDeleteClassV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, class_name : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpEnumClassesV6(server_ip_address : Win32cr::Foundation::PWSTR, reserved_must_be_zero : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, class_info_array : Win32cr::NetworkManagement::Dhcp::DHCP_CLASS_INFO_ARRAY_V6**, nRead : UInt32*, nTotal : UInt32*) : UInt32

    fun DhcpSetSubnetDelayOffer(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, time_delay_in_milliseconds : UInt16) : UInt32

    fun DhcpGetSubnetDelayOffer(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, time_delay_in_milliseconds : UInt16*) : UInt32

    fun DhcpGetMibInfoV5(server_ip_address : Win32cr::Foundation::PWSTR, mib_info : Win32cr::NetworkManagement::Dhcp::DHCP_MIB_INFO_V5**) : UInt32

    fun DhcpAddSecurityGroup(pServer : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpV4GetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE**) : UInt32

    fun DhcpV4SetOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_value : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_DATA*) : UInt32

    fun DhcpV4SetOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, option_values : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_VALUE_ARRAY*) : UInt32

    fun DhcpV4RemoveOptionValue(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, option_id : UInt32, policy_name : Win32cr::Foundation::PWSTR, vendor_name : Win32cr::Foundation::PWSTR, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*) : UInt32

    fun DhcpV4GetAllOptionValues(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, scope_info : Win32cr::NetworkManagement::Dhcp::DHCP_OPTION_SCOPE_INFO*, values : Win32cr::NetworkManagement::Dhcp::DHCP_ALL_OPTION_VALUES_PB**) : UInt32

    fun DhcpV4FailoverCreateRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    fun DhcpV4FailoverSetRelationship(server_ip_address : Win32cr::Foundation::PWSTR, flags : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    fun DhcpV4FailoverDeleteRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationshipName : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpV4FailoverGetRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationshipName : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP**) : UInt32

    fun DhcpV4FailoverEnumRelationship(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP_ARRAY**, relationship_read : UInt32*, relationship_total : UInt32*) : UInt32

    fun DhcpV4FailoverAddScopeToRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    fun DhcpV4FailoverDeleteScopeFromRelationship(server_ip_address : Win32cr::Foundation::PWSTR, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP*) : UInt32

    fun DhcpV4FailoverGetScopeRelationship(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, pRelationship : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_RELATIONSHIP**) : UInt32

    fun DhcpV4FailoverGetScopeStatistics(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, pStats : Win32cr::NetworkManagement::Dhcp::DHCP_FAILOVER_STATISTICS**) : UInt32

    fun DhcpV4FailoverGetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCPV4_FAILOVER_CLIENT_INFO**) : UInt32

    fun DhcpV4FailoverGetSystemTime(server_ip_address : Win32cr::Foundation::PWSTR, pTime : UInt32*, pMaxAllowedDeltaTime : UInt32*) : UInt32

    fun DhcpV4FailoverGetAddressStatus(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, pStatus : UInt32*) : UInt32

    fun DhcpV4FailoverTriggerAddrAllocation(server_ip_address : Win32cr::Foundation::PWSTR, pFailRelName : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpHlprCreateV4Policy(policy_name : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet : UInt32, processing_order : UInt32, root_operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, description : Win32cr::Foundation::PWSTR, enabled : Win32cr::Foundation::BOOL, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY**) : UInt32

    fun DhcpHlprCreateV4PolicyEx(policy_name : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet : UInt32, processing_order : UInt32, root_operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, description : Win32cr::Foundation::PWSTR, enabled : Win32cr::Foundation::BOOL, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX**) : UInt32

    fun DhcpHlprAddV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, parent_expr : UInt32, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER, expr_index : UInt32*) : UInt32

    fun DhcpHlprAddV4PolicyCondition(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, parent_expr : UInt32, type__ : Win32cr::NetworkManagement::Dhcp::DHCP_POL_ATTR_TYPE, option_id : UInt32, sub_option_id : UInt32, vendor_name : Win32cr::Foundation::PWSTR, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_COMPARATOR, value : UInt8*, value_length : UInt32, condition_index : UInt32*) : UInt32

    fun DhcpHlprAddV4PolicyRange(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32

    fun DhcpHlprResetV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    fun DhcpHlprModifyV4PolicyExpr(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*, operator : Win32cr::NetworkManagement::Dhcp::DHCP_POL_LOGIC_OPER) : UInt32

    fun DhcpHlprFreeV4Policy(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Void

    fun DhcpHlprFreeV4PolicyArray(policy_array : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_ARRAY*) : Void

    fun DhcpHlprFreeV4PolicyEx(policy_ex : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : Void

    fun DhcpHlprFreeV4PolicyExArray(policy_ex_array : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX_ARRAY*) : Void

    fun DhcpHlprFreeV4DhcpProperty(property : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*) : Void

    fun DhcpHlprFreeV4DhcpPropertyArray(property_array : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*) : Void

    fun DhcpHlprFindV4DhcpProperty(property_array : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ARRAY*, id : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_ID, type__ : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY_TYPE) : Win32cr::NetworkManagement::Dhcp::DHCP_PROPERTY*

    fun DhcpHlprIsV4PolicySingleUC(policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Win32cr::Foundation::BOOL

    fun DhcpV4QueryPolicyEnforcement(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enabled : Win32cr::Foundation::BOOL*) : UInt32

    fun DhcpV4SetPolicyEnforcement(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enable : Win32cr::Foundation::BOOL) : UInt32

    fun DhcpHlprIsV4PolicyWellFormed(pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : Win32cr::Foundation::BOOL

    fun DhcpHlprIsV4PolicyValid(pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    fun DhcpV4CreatePolicy(server_ip_address : Win32cr::Foundation::PWSTR, pPolicy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    fun DhcpV4GetPolicy(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY**) : UInt32

    fun DhcpV4SetPolicy(server_ip_address : Win32cr::Foundation::PWSTR, fields_modified : UInt32, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY*) : UInt32

    fun DhcpV4DeletePolicy(server_ip_address : Win32cr::Foundation::PWSTR, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR) : UInt32

    fun DhcpV4EnumPolicies(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, fGlobalPolicy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

    fun DhcpV4AddPolicyRange(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32

    fun DhcpV4RemovePolicyRange(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, range : Win32cr::NetworkManagement::Dhcp::DHCP_IP_RANGE*) : UInt32

    fun DhcpV6SetStatelessStoreParams(server_ip_address : Win32cr::Foundation::PWSTR, fServerLevel : Win32cr::Foundation::BOOL, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, field_modified : UInt32, params : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_PARAMS*) : UInt32

    fun DhcpV6GetStatelessStoreParams(server_ip_address : Win32cr::Foundation::PWSTR, fServerLevel : Win32cr::Foundation::BOOL, subnet_address : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, params : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_PARAMS**) : UInt32

    fun DhcpV6GetStatelessStatistics(server_ip_address : Win32cr::Foundation::PWSTR, stateless_stats : Win32cr::NetworkManagement::Dhcp::DHCPV6_STATELESS_STATS**) : UInt32

    fun DhcpV4CreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB*) : UInt32

    fun DhcpV4EnumSubnetClients(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpV4GetClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_PB**) : UInt32

    fun DhcpV6CreateClientInfo(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_V6*) : UInt32

    fun DhcpV4GetFreeIPAddress(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : UInt32, start_ip : UInt32, end_ip : UInt32, num_free_addr_req : UInt32, ip_addr_list : Win32cr::NetworkManagement::Dhcp::DHCP_IP_ARRAY**) : UInt32

    fun DhcpV6GetFreeIPAddress(server_ip_address : Win32cr::Foundation::PWSTR, scope_id : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, start_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, end_ip : Win32cr::NetworkManagement::Dhcp::DHCP_IPV6_ADDRESS, num_free_addr_req : UInt32, ip_addr_list : Win32cr::NetworkManagement::Dhcp::DHCPV6_IP_ARRAY**) : UInt32

    fun DhcpV4CreateClientInfoEx(server_ip_address : Win32cr::Foundation::PWSTR, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX*) : UInt32

    fun DhcpV4EnumSubnetClientsEx(server_ip_address : Win32cr::Foundation::PWSTR, subnet_address : UInt32, resume_handle : UInt32*, preferred_maximum : UInt32, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX_ARRAY**, clients_read : UInt32*, clients_total : UInt32*) : UInt32

    fun DhcpV4GetClientInfoEx(server_ip_address : Win32cr::Foundation::PWSTR, search_info : Win32cr::NetworkManagement::Dhcp::DHCP_SEARCH_INFO*, client_info : Win32cr::NetworkManagement::Dhcp::DHCP_CLIENT_INFO_EX**) : UInt32

    fun DhcpV4CreatePolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, policy_ex : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : UInt32

    fun DhcpV4GetPolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX**) : UInt32

    fun DhcpV4SetPolicyEx(server_ip_address : Win32cr::Foundation::PWSTR, fields_modified : UInt32, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, policy_name : Win32cr::Foundation::PWSTR, policy : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX*) : UInt32

    fun DhcpV4EnumPoliciesEx(server_ip_address : Win32cr::Foundation::PWSTR, resume_handle : UInt32*, preferred_maximum : UInt32, global_policy : Win32cr::Foundation::BOOL, subnet_address : UInt32, enum_info : Win32cr::NetworkManagement::Dhcp::DHCP_POLICY_EX_ARRAY**, elements_read : UInt32*, elements_total : UInt32*) : UInt32

  end
end