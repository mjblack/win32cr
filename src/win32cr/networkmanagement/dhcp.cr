require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:dhcpcsvc6.dll")]
@[Link(ldflags: "/DELAYLOAD:dhcpcsvc.dll")]
@[Link(ldflags: "/DELAYLOAD:dhcpsapi.dll")]
lib LibWin32
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

  alias LPDHCP_CONTROL = Proc(UInt32, Void*, UInt32)
  alias LPDHCP_NEWPKT = Proc(UInt8**, UInt32*, UInt32, Void*, Void**, Int32*, UInt32)
  alias LPDHCP_DROP_SEND = Proc(UInt8**, UInt32*, UInt32, UInt32, Void*, Void*, UInt32)
  alias LPDHCP_PROB = Proc(UInt8*, UInt32, UInt32, UInt32, UInt32, Void*, Void*, UInt32)
  alias LPDHCP_GIVE_ADDRESS = Proc(UInt8*, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Void*, Void*, UInt32)
  alias LPDHCP_HANDLE_OPTIONS = Proc(UInt8*, UInt32, Void*, Void*, DHCP_SERVER_OPTIONS*, UInt32)
  alias LPDHCP_DELETE_CLIENT = Proc(UInt32, UInt8*, UInt32, UInt32, UInt32, UInt32)
  alias LPDHCP_ENTRY_POINT_FUNC = Proc(LibC::LPWSTR, UInt32, DHCP_CALLOUT_TABLE*, UInt32)


  enum StatusCode : Int32
    STATUS_NO_ERROR = 0
    STATUS_UNSPECIFIED_FAILURE = 1
    STATUS_NO_BINDING = 3
    STATUS_NOPREFIX_AVAIL = 6
  end

  enum DHCP_FORCE_FLAG : Int32
    DhcpFullForce = 0
    DhcpNoForce = 1
    DhcpFailoverForce = 2
  end

  enum DHCP_SUBNET_STATE : Int32
    DhcpSubnetEnabled = 0
    DhcpSubnetDisabled = 1
    DhcpSubnetEnabledSwitched = 2
    DhcpSubnetDisabledSwitched = 3
    DhcpSubnetInvalidState = 4
  end

  enum DHCP_SUBNET_ELEMENT_TYPE : Int32
    DhcpIpRanges = 0
    DhcpSecondaryHosts = 1
    DhcpReservedIps = 2
    DhcpExcludedIpRanges = 3
    DhcpIpUsedClusters = 4
    DhcpIpRangesDhcpOnly = 5
    DhcpIpRangesDhcpBootp = 6
    DhcpIpRangesBootpOnly = 7
  end

  enum DHCP_FILTER_LIST_TYPE : Int32
    Deny = 0
    Allow = 1
  end

  enum DHCP_OPTION_DATA_TYPE : Int32
    DhcpByteOption = 0
    DhcpWordOption = 1
    DhcpDWordOption = 2
    DhcpDWordDWordOption = 3
    DhcpIpAddressOption = 4
    DhcpStringDataOption = 5
    DhcpBinaryDataOption = 6
    DhcpEncapsulatedDataOption = 7
    DhcpIpv6AddressOption = 8
  end

  enum DHCP_OPTION_TYPE : Int32
    DhcpUnaryElementTypeOption = 0
    DhcpArrayTypeOption = 1
  end

  enum DHCP_OPTION_SCOPE_TYPE : Int32
    DhcpDefaultOptions = 0
    DhcpGlobalOptions = 1
    DhcpSubnetOptions = 2
    DhcpReservedOptions = 3
    DhcpMScopeOptions = 4
  end

  enum DHCP_OPTION_SCOPE_TYPE6 : Int32
    DhcpDefaultOptions6 = 0
    DhcpScopeOptions6 = 1
    DhcpReservedOptions6 = 2
    DhcpGlobalOptions6 = 3
  end

  enum QuarantineStatus : Int32
    NOQUARANTINE = 0
    RESTRICTEDACCESS = 1
    DROPPACKET = 2
    PROBATION = 3
    EXEMPT = 4
    DEFAULTQUARSETTING = 5
    NOQUARINFO = 6
  end

  enum DHCP_SEARCH_INFO_TYPE : Int32
    DhcpClientIpAddress = 0
    DhcpClientHardwareAddress = 1
    DhcpClientName = 2
  end

  enum DHCP_PROPERTY_TYPE : Int32
    DhcpPropTypeByte = 0
    DhcpPropTypeWord = 1
    DhcpPropTypeDword = 2
    DhcpPropTypeString = 3
    DhcpPropTypeBinary = 4
  end

  enum DHCP_PROPERTY_ID : Int32
    DhcpPropIdPolicyDnsSuffix = 0
    DhcpPropIdClientAddressStateEx = 1
  end

  enum DHCP_SCAN_FLAG : Int32
    DhcpRegistryFix = 0
    DhcpDatabaseFix = 1
  end

  enum DHCP_SUBNET_ELEMENT_TYPE_V6 : Int32
    Dhcpv6IpRanges = 0
    Dhcpv6ReservedIps = 1
    Dhcpv6ExcludedIpRanges = 2
  end

  enum DHCP_SEARCH_INFO_TYPE_V6 : Int32
    Dhcpv6ClientIpAddress = 0
    Dhcpv6ClientDUID = 1
    Dhcpv6ClientName = 2
  end

  enum DHCP_POL_ATTR_TYPE : Int32
    DhcpAttrHWAddr = 0
    DhcpAttrOption = 1
    DhcpAttrSubOption = 2
    DhcpAttrFqdn = 3
    DhcpAttrFqdnSingleLabel = 4
  end

  enum DHCP_POL_COMPARATOR : Int32
    DhcpCompEqual = 0
    DhcpCompNotEqual = 1
    DhcpCompBeginsWith = 2
    DhcpCompNotBeginWith = 3
    DhcpCompEndsWith = 4
    DhcpCompNotEndWith = 5
  end

  enum DHCP_POL_LOGIC_OPER : Int32
    DhcpLogicalOr = 0
    DhcpLogicalAnd = 1
  end

  enum DHCP_POLICY_FIELDS_TO_UPDATE : Int32
    DhcpUpdatePolicyName = 1
    DhcpUpdatePolicyOrder = 2
    DhcpUpdatePolicyExpr = 4
    DhcpUpdatePolicyRanges = 8
    DhcpUpdatePolicyDescr = 16
    DhcpUpdatePolicyStatus = 32
    DhcpUpdatePolicyDnsSuffix = 64
  end

  enum DHCPV6_STATELESS_PARAM_TYPE : Int32
    DhcpStatelessPurgeInterval = 1
    DhcpStatelessStatus = 2
  end

  enum DHCP_FAILOVER_MODE : Int32
    LoadBalance = 0
    HotStandby = 1
  end

  enum DHCP_FAILOVER_SERVER : Int32
    PrimaryServer = 0
    SecondaryServer = 1
  end

  enum FSM_STATE : Int32
    NO_STATE = 0
    INIT = 1
    STARTUP = 2
    NORMAL = 3
    COMMUNICATION_INT = 4
    PARTNER_DOWN = 5
    POTENTIAL_CONFLICT = 6
    CONFLICT_DONE = 7
    RESOLUTION_INT = 8
    RECOVER = 9
    RECOVER_WAIT = 10
    RECOVER_DONE = 11
    PAUSED = 12
    SHUTDOWN = 13
  end

union DHCP_SUBNET_ELEMENT_DATADHCP_SUBNET_ELEMENT_UNION
  ip_range : DHCP_IP_RANGE*
  secondary_host : DHCP_HOST_INFO*
  reserved_ip : DHCP_IP_RESERVATION*
  exclude_ip_range : DHCP_IP_RANGE*
  ip_used_cluster : DHCP_IP_CLUSTER*
end
union DHCP_SUBNET_ELEMENT_UNION
end
union DHCP_OPTION_DATA_ELEMENTDHCP_OPTION_ELEMENT_UNION
  byte_option : UInt8
  word_option : UInt16
  d_word_option : UInt32
  d_word_d_word_option : DWORD_DWORD
  ip_address_option : UInt32
  string_data_option : LibC::LPWSTR
  binary_data_option : DHCP_BINARY_DATA
  encapsulated_data_option : DHCP_BINARY_DATA
  ipv6_address_data_option : LibC::LPWSTR
end
union DHCP_OPTION_ELEMENT_UNION
end
union DHCP_OPTION_SCOPE_INFO_DHCP_OPTION_SCOPE_UNION
  default_scope_info : Void*
  global_scope_info : Void*
  subnet_scope_info : UInt32
  reserved_scope_info : DHCP_RESERVED_SCOPE
  m_scope_info : LibC::LPWSTR
end
union DHCP_OPTION_SCOPE_INFO6DHCP_OPTION_SCOPE_UNION6
  default_scope_info : Void*
  subnet_scope_info : DHCP_IPV6_ADDRESS
  reserved_scope_info : DHCP_RESERVED_SCOPE6
end
union DHCP_OPTION_SCOPE_UNION6
end
union DHCP_SEARCH_INFODHCP_CLIENT_SEARCH_UNION
  client_ip_address : UInt32
  client_hardware_address : DHCP_BINARY_DATA
  client_name : LibC::LPWSTR
end
union DHCP_CLIENT_SEARCH_UNION
end
union DHCP_PROPERTY_DHCP_PROPERTY_VALUE_UNION
  byte_value : UInt8
  word_value : UInt16
  d_word_value : UInt32
  string_value : LibC::LPWSTR
  binary_value : DHCP_BINARY_DATA
end
union DHCP_SUBNET_ELEMENT_DATA_V4DHCP_SUBNET_ELEMENT_UNION_V4
  ip_range : DHCP_IP_RANGE*
  secondary_host : DHCP_HOST_INFO*
  reserved_ip : DHCP_IP_RESERVATION_V4*
  exclude_ip_range : DHCP_IP_RANGE*
  ip_used_cluster : DHCP_IP_CLUSTER*
end
union DHCP_SUBNET_ELEMENT_UNION_V4
end
union DHCP_ATTRIB_Anonymous_e__Union
  dhcp_attrib_bool : LibC::BOOL
  dhcp_attrib_ulong : UInt32
end
union DHCP_SUBNET_ELEMENT_DATA_V5_DHCP_SUBNET_ELEMENT_UNION_V5
  ip_range : DHCP_BOOTP_IP_RANGE*
  secondary_host : DHCP_HOST_INFO*
  reserved_ip : DHCP_IP_RESERVATION_V4*
  exclude_ip_range : DHCP_IP_RANGE*
  ip_used_cluster : DHCP_IP_CLUSTER*
end
union DHCP_SUBNET_ELEMENT_DATA_V6DHCP_SUBNET_ELEMENT_UNION_V6
  ip_range : DHCP_IP_RANGE_V6*
  reserved_ip : DHCP_IP_RESERVATION_V6*
  exclude_ip_range : DHCP_IP_RANGE_V6*
end
union DHCP_SUBNET_ELEMENT_UNION_V6
end
union DHCP_SEARCH_INFO_V6_DHCP_CLIENT_SEARCH_UNION_V6
  client_ip_address : DHCP_IPV6_ADDRESS
  client_duid : DHCP_BINARY_DATA
  client_name : LibC::LPWSTR
end

  struct DHCPV6CAPI_PARAMS
    flags : UInt32
    option_id : UInt32
    is_vendor : LibC::BOOL
    data : UInt8*
    n_bytes_data : UInt32
  end
  struct DHCPV6CAPI_PARAMS_ARRAY
    n_params : UInt32
    params : DHCPV6CAPI_PARAMS*
  end
  struct DHCPV6CAPI_CLASSID
    flags : UInt32
    data : UInt8*
    n_bytes_data : UInt32
  end
  struct DHCPV6Prefix
    prefix : UInt8[16]*
    prefix_length : UInt32
    preferred_life_time : UInt32
    valid_life_time : UInt32
    status : StatusCode
  end
  struct DHCPV6PrefixLeaseInformation
    n_prefixes : UInt32
    prefix_array : DHCPV6Prefix*
    iaid : UInt32
    t1 : Int64
    t2 : Int64
    max_lease_expiration_time : Int64
    last_renewal_time : Int64
    status : StatusCode
    server_id : UInt8*
    server_id_len : UInt32
  end
  struct DHCPAPI_PARAMS
    flags : UInt32
    option_id : UInt32
    is_vendor : LibC::BOOL
    data : UInt8*
    n_bytes_data : UInt32
  end
  struct DHCPCAPI_PARAMS_ARRAY
    n_params : UInt32
    params : DHCPAPI_PARAMS*
  end
  struct DHCPCAPI_CLASSID
    flags : UInt32
    data : UInt8*
    n_bytes_data : UInt32
  end
  struct DHCP_SERVER_OPTIONS
    message_type : UInt8*
    subnet_mask : UInt32*
    requested_address : UInt32*
    request_lease_time : UInt32*
    overlay_fields : UInt8*
    router_address : UInt32*
    server : UInt32*
    parameter_request_list : UInt8*
    parameter_request_list_length : UInt32
    machine_name : PSTR
    machine_name_length : UInt32
    client_hardware_address_type : UInt8
    client_hardware_address_length : UInt8
    client_hardware_address : UInt8*
    class_identifier : PSTR
    class_identifier_length : UInt32
    vendor_class : UInt8*
    vendor_class_length : UInt32
    dns_flags : UInt32
    dns_name_length : UInt32
    dns_name : UInt8*
    ds_domain_name_requested : BOOLEAN
    ds_domain_name : PSTR
    ds_domain_name_len : UInt32
    scope_id : UInt32*
  end
  struct DHCP_CALLOUT_TABLE
    dhcp_control_hook : LPDHCP_CONTROL
    dhcp_new_pkt_hook : LPDHCP_NEWPKT
    dhcp_pkt_drop_hook : LPDHCP_DROP_SEND
    dhcp_pkt_send_hook : LPDHCP_DROP_SEND
    dhcp_address_del_hook : LPDHCP_PROB
    dhcp_address_offer_hook : LPDHCP_GIVE_ADDRESS
    dhcp_handle_options_hook : LPDHCP_HANDLE_OPTIONS
    dhcp_delete_client_hook : LPDHCP_DELETE_CLIENT
    dhcp_extension_hook : Void*
    dhcp_reserved_hook : Void*
  end
  struct DATE_TIME
    dw_low_date_time : UInt32
    dw_high_date_time : UInt32
  end
  struct DHCP_IP_RANGE
    start_address : UInt32
    end_address : UInt32
  end
  struct DHCP_BINARY_DATA
    data_length : UInt32
    data : UInt8*
  end
  struct DHCP_HOST_INFO
    ip_address : UInt32
    net_bios_name : LibC::LPWSTR
    host_name : LibC::LPWSTR
  end
  struct DWORD_DWORD
    d_word1 : UInt32
    d_word2 : UInt32
  end
  struct DHCP_SUBNET_INFO
    subnet_address : UInt32
    subnet_mask : UInt32
    subnet_name : LibC::LPWSTR
    subnet_comment : LibC::LPWSTR
    primary_host : DHCP_HOST_INFO
    subnet_state : DHCP_SUBNET_STATE
  end
  struct DHCP_SUBNET_INFO_VQ
    subnet_address : UInt32
    subnet_mask : UInt32
    subnet_name : LibC::LPWSTR
    subnet_comment : LibC::LPWSTR
    primary_host : DHCP_HOST_INFO
    subnet_state : DHCP_SUBNET_STATE
    quarantine_on : UInt32
    reserved1 : UInt32
    reserved2 : UInt32
    reserved3 : Int64
    reserved4 : Int64
  end
  struct DHCP_IP_ARRAY
    num_elements : UInt32
    elements : UInt32*
  end
  struct DHCP_IP_CLUSTER
    cluster_address : UInt32
    cluster_mask : UInt32
  end
  struct DHCP_IP_RESERVATION
    reserved_ip_address : UInt32
    reserved_for_client : DHCP_BINARY_DATA*
  end
  struct DHCP_SUBNET_ELEMENT_DATA
    element_type : DHCP_SUBNET_ELEMENT_TYPE
    element : DHCP_SUBNET_ELEMENT_DATADHCP_SUBNET_ELEMENT_UNION
  end
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY
    num_elements : UInt32
    elements : DHCP_SUBNET_ELEMENT_DATA*
  end
  struct DHCP_IPV6_ADDRESS
    high_order_bits : UInt64
    low_order_bits : UInt64
  end
  struct DHCP_ADDR_PATTERN
    match_hw_type : LibC::BOOL
    hw_type : UInt8
    is_wildcard : LibC::BOOL
    length : UInt8
    pattern : UInt8[255]*
  end
  struct DHCP_FILTER_ADD_INFO
    addr_patt : DHCP_ADDR_PATTERN
    comment : LibC::LPWSTR
    list_type : DHCP_FILTER_LIST_TYPE
  end
  struct DHCP_FILTER_GLOBAL_INFO
    enforce_allow_list : LibC::BOOL
    enforce_deny_list : LibC::BOOL
  end
  struct DHCP_FILTER_RECORD
    addr_patt : DHCP_ADDR_PATTERN
    comment : LibC::LPWSTR
  end
  struct DHCP_FILTER_ENUM_INFO
    num_elements : UInt32
    p_enum_records : DHCP_FILTER_RECORD*
  end
  struct DHCP_OPTION_DATA_ELEMENT
    option_type : DHCP_OPTION_DATA_TYPE
    element : DHCP_OPTION_DATA_ELEMENTDHCP_OPTION_ELEMENT_UNION
  end
  struct DHCP_OPTION_DATA
    num_elements : UInt32
    elements : DHCP_OPTION_DATA_ELEMENT*
  end
  struct DHCP_OPTION
    option_id : UInt32
    option_name : LibC::LPWSTR
    option_comment : LibC::LPWSTR
    default_value : DHCP_OPTION_DATA
    option_type : DHCP_OPTION_TYPE
  end
  struct DHCP_OPTION_ARRAY
    num_elements : UInt32
    options : DHCP_OPTION*
  end
  struct DHCP_OPTION_VALUE
    option_id : UInt32
    value : DHCP_OPTION_DATA
  end
  struct DHCP_OPTION_VALUE_ARRAY
    num_elements : UInt32
    values : DHCP_OPTION_VALUE*
  end
  struct DHCP_RESERVED_SCOPE
    reserved_ip_address : UInt32
    reserved_ip_subnet_address : UInt32
  end
  struct DHCP_OPTION_SCOPE_INFO
    scope_type : DHCP_OPTION_SCOPE_TYPE
    scope_info : DHCP_OPTION_SCOPE_INFO_DHCP_OPTION_SCOPE_UNION
  end
  struct DHCP_RESERVED_SCOPE6
    reserved_ip_address : DHCP_IPV6_ADDRESS
    reserved_ip_subnet_address : DHCP_IPV6_ADDRESS
  end
  struct DHCP_OPTION_SCOPE_INFO6
    scope_type : DHCP_OPTION_SCOPE_TYPE6
    scope_info : DHCP_OPTION_SCOPE_INFO6DHCP_OPTION_SCOPE_UNION6
  end
  struct DHCP_OPTION_LIST
    num_options : UInt32
    options : DHCP_OPTION_VALUE*
  end
  struct DHCP_CLIENT_INFO
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
  end
  struct DHCP_CLIENT_INFO_ARRAY
    num_elements : UInt32
    clients : DHCP_CLIENT_INFO**
  end
  struct DHCP_CLIENT_INFO_VQ
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
    address_state : UInt8
    status : QuarantineStatus
    probation_ends : DATE_TIME
    quarantine_capable : LibC::BOOL
  end
  struct DHCP_CLIENT_INFO_ARRAY_VQ
    num_elements : UInt32
    clients : DHCP_CLIENT_INFO_VQ**
  end
  struct DHCP_CLIENT_FILTER_STATUS_INFO
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
    address_state : UInt8
    status : QuarantineStatus
    probation_ends : DATE_TIME
    quarantine_capable : LibC::BOOL
    filter_status : UInt32
  end
  struct DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY
    num_elements : UInt32
    clients : DHCP_CLIENT_FILTER_STATUS_INFO**
  end
  struct DHCP_CLIENT_INFO_PB
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
    address_state : UInt8
    status : QuarantineStatus
    probation_ends : DATE_TIME
    quarantine_capable : LibC::BOOL
    filter_status : UInt32
    policy_name : LibC::LPWSTR
  end
  struct DHCP_CLIENT_INFO_PB_ARRAY
    num_elements : UInt32
    clients : DHCP_CLIENT_INFO_PB**
  end
  struct DHCP_SEARCH_INFO
    search_type : DHCP_SEARCH_INFO_TYPE
    search_info : DHCP_SEARCH_INFODHCP_CLIENT_SEARCH_UNION
  end
  struct DHCP_PROPERTY
    id : DHCP_PROPERTY_ID
    type : DHCP_PROPERTY_TYPE
    value : DHCP_PROPERTY_DHCP_PROPERTY_VALUE_UNION
  end
  struct DHCP_PROPERTY_ARRAY
    num_elements : UInt32
    elements : DHCP_PROPERTY*
  end
  struct DHCP_CLIENT_INFO_EX
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
    address_state : UInt8
    status : QuarantineStatus
    probation_ends : DATE_TIME
    quarantine_capable : LibC::BOOL
    filter_status : UInt32
    policy_name : LibC::LPWSTR
    properties : DHCP_PROPERTY_ARRAY*
  end
  struct DHCP_CLIENT_INFO_EX_ARRAY
    num_elements : UInt32
    clients : DHCP_CLIENT_INFO_EX**
  end
  struct SCOPE_MIB_INFO
    subnet : UInt32
    num_addresses_inuse : UInt32
    num_addresses_free : UInt32
    num_pending_offers : UInt32
  end
  struct DHCP_MIB_INFO
    discovers : UInt32
    offers : UInt32
    requests : UInt32
    acks : UInt32
    naks : UInt32
    declines : UInt32
    releases : UInt32
    server_start_time : DATE_TIME
    scopes : UInt32
    scope_info : SCOPE_MIB_INFO*
  end
  struct SCOPE_MIB_INFO_VQ
    subnet : UInt32
    num_addresses_inuse : UInt32
    num_addresses_free : UInt32
    num_pending_offers : UInt32
    qtn_num_leases : UInt32
    qtn_pct_qtn_leases : UInt32
    qtn_probation_leases : UInt32
    qtn_non_qtn_leases : UInt32
    qtn_exempt_leases : UInt32
    qtn_capable_clients : UInt32
  end
  struct DHCP_MIB_INFO_VQ
    discovers : UInt32
    offers : UInt32
    requests : UInt32
    acks : UInt32
    naks : UInt32
    declines : UInt32
    releases : UInt32
    server_start_time : DATE_TIME
    qtn_num_leases : UInt32
    qtn_pct_qtn_leases : UInt32
    qtn_probation_leases : UInt32
    qtn_non_qtn_leases : UInt32
    qtn_exempt_leases : UInt32
    qtn_capable_clients : UInt32
    qtn_ias_errors : UInt32
    scopes : UInt32
    scope_info : SCOPE_MIB_INFO_VQ*
  end
  struct SCOPE_MIB_INFO_V5
    subnet : UInt32
    num_addresses_inuse : UInt32
    num_addresses_free : UInt32
    num_pending_offers : UInt32
  end
  struct DHCP_MIB_INFO_V5
    discovers : UInt32
    offers : UInt32
    requests : UInt32
    acks : UInt32
    naks : UInt32
    declines : UInt32
    releases : UInt32
    server_start_time : DATE_TIME
    qtn_num_leases : UInt32
    qtn_pct_qtn_leases : UInt32
    qtn_probation_leases : UInt32
    qtn_non_qtn_leases : UInt32
    qtn_exempt_leases : UInt32
    qtn_capable_clients : UInt32
    qtn_ias_errors : UInt32
    delayed_offers : UInt32
    scopes_with_delayed_offers : UInt32
    scopes : UInt32
    scope_info : SCOPE_MIB_INFO_V5*
  end
  struct DHCP_SERVER_CONFIG_INFO
    api_protocol_support : UInt32
    database_name : LibC::LPWSTR
    database_path : LibC::LPWSTR
    backup_path : LibC::LPWSTR
    backup_interval : UInt32
    database_logging_flag : UInt32
    restore_flag : UInt32
    database_cleanup_interval : UInt32
    debug_flag : UInt32
  end
  struct DHCP_SCAN_ITEM
    ip_address : UInt32
    scan_flag : DHCP_SCAN_FLAG
  end
  struct DHCP_SCAN_LIST
    num_scan_items : UInt32
    scan_items : DHCP_SCAN_ITEM*
  end
  struct DHCP_CLASS_INFO
    class_name : LibC::LPWSTR
    class_comment : LibC::LPWSTR
    class_data_length : UInt32
    is_vendor : LibC::BOOL
    flags : UInt32
    class_data : UInt8*
  end
  struct DHCP_CLASS_INFO_ARRAY
    num_elements : UInt32
    classes : DHCP_CLASS_INFO*
  end
  struct DHCP_CLASS_INFO_V6
    class_name : LibC::LPWSTR
    class_comment : LibC::LPWSTR
    class_data_length : UInt32
    is_vendor : LibC::BOOL
    enterprise_number : UInt32
    flags : UInt32
    class_data : UInt8*
  end
  struct DHCP_CLASS_INFO_ARRAY_V6
    num_elements : UInt32
    classes : DHCP_CLASS_INFO_V6*
  end
  struct DHCP_SERVER_SPECIFIC_STRINGS
    default_vendor_class_name : LibC::LPWSTR
    default_user_class_name : LibC::LPWSTR
  end
  struct DHCP_IP_RESERVATION_V4
    reserved_ip_address : UInt32
    reserved_for_client : DHCP_BINARY_DATA*
    b_allowed_client_types : UInt8
  end
  struct DHCP_IP_RESERVATION_INFO
    reserved_ip_address : UInt32
    reserved_for_client : DHCP_BINARY_DATA
    reserved_client_name : LibC::LPWSTR
    reserved_client_desc : LibC::LPWSTR
    b_allowed_client_types : UInt8
    f_options_present : UInt8
  end
  struct DHCP_RESERVATION_INFO_ARRAY
    num_elements : UInt32
    elements : DHCP_IP_RESERVATION_INFO**
  end
  struct DHCP_SUBNET_ELEMENT_DATA_V4
    element_type : DHCP_SUBNET_ELEMENT_TYPE
    element : DHCP_SUBNET_ELEMENT_DATA_V4DHCP_SUBNET_ELEMENT_UNION_V4
  end
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4
    num_elements : UInt32
    elements : DHCP_SUBNET_ELEMENT_DATA_V4*
  end
  struct DHCP_CLIENT_INFO_V4
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
  end
  struct DHCP_CLIENT_INFO_ARRAY_V4
    num_elements : UInt32
    clients : DHCP_CLIENT_INFO_V4**
  end
  struct DHCP_SERVER_CONFIG_INFO_V4
    api_protocol_support : UInt32
    database_name : LibC::LPWSTR
    database_path : LibC::LPWSTR
    backup_path : LibC::LPWSTR
    backup_interval : UInt32
    database_logging_flag : UInt32
    restore_flag : UInt32
    database_cleanup_interval : UInt32
    debug_flag : UInt32
    dw_ping_retries : UInt32
    cb_boot_table_string : UInt32
    wsz_boot_table_string : LibC::LPWSTR
    f_audit_log : LibC::BOOL
  end
  struct DHCP_SERVER_CONFIG_INFO_VQ
    api_protocol_support : UInt32
    database_name : LibC::LPWSTR
    database_path : LibC::LPWSTR
    backup_path : LibC::LPWSTR
    backup_interval : UInt32
    database_logging_flag : UInt32
    restore_flag : UInt32
    database_cleanup_interval : UInt32
    debug_flag : UInt32
    dw_ping_retries : UInt32
    cb_boot_table_string : UInt32
    wsz_boot_table_string : LibC::LPWSTR
    f_audit_log : LibC::BOOL
    quarantine_on : LibC::BOOL
    quar_def_fail : UInt32
    quar_runtime_status : LibC::BOOL
  end
  struct DHCP_SERVER_CONFIG_INFO_V6
    unicast_flag : LibC::BOOL
    rapid_commit_flag : LibC::BOOL
    preferred_lifetime : UInt32
    valid_lifetime : UInt32
    t1 : UInt32
    t2 : UInt32
    preferred_lifetime_iata : UInt32
    valid_lifetime_iata : UInt32
    f_audit_log : LibC::BOOL
  end
  struct DHCP_SUPER_SCOPE_TABLE_ENTRY
    subnet_address : UInt32
    super_scope_number : UInt32
    next_in_super_scope : UInt32
    super_scope_name : LibC::LPWSTR
  end
  struct DHCP_SUPER_SCOPE_TABLE
    c_entries : UInt32
    p_entries : DHCP_SUPER_SCOPE_TABLE_ENTRY*
  end
  struct DHCP_CLIENT_INFO_V5
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
    address_state : UInt8
  end
  struct DHCP_CLIENT_INFO_ARRAY_V5
    num_elements : UInt32
    clients : DHCP_CLIENT_INFO_V5**
  end
  struct DHCP_ALL_OPTIONS
    flags : UInt32
    non_vendor_options : DHCP_OPTION_ARRAY*
    num_vendor_options : UInt32
    vendor_options : DHCP_ALL_OPTIONS_Anonymous_e__Struct*
  end
  struct DHCP_ALL_OPTIONS_Anonymous_e__Struct
    option : DHCP_OPTION
    vendor_name : LibC::LPWSTR
    class_name : LibC::LPWSTR
  end
  struct DHCP_ALL_OPTION_VALUES
    flags : UInt32
    num_elements : UInt32
    options : DHCP_ALL_OPTION_VALUES_Anonymous_e__Struct*
  end
  struct DHCP_ALL_OPTION_VALUES_Anonymous_e__Struct
    class_name : LibC::LPWSTR
    vendor_name : LibC::LPWSTR
    is_vendor : LibC::BOOL
    options_array : DHCP_OPTION_VALUE_ARRAY*
  end
  struct DHCP_ALL_OPTION_VALUES_PB
    flags : UInt32
    num_elements : UInt32
    options : DHCP_ALL_OPTION_VALUES_PB_Anonymous_e__Struct*
  end
  struct DHCP_ALL_OPTION_VALUES_PB_Anonymous_e__Struct
    policy_name : LibC::LPWSTR
    vendor_name : LibC::LPWSTR
    is_vendor : LibC::BOOL
    options_array : DHCP_OPTION_VALUE_ARRAY*
  end
  struct DHCPDS_SERVER
    version : UInt32
    server_name : LibC::LPWSTR
    server_address : UInt32
    flags : UInt32
    state : UInt32
    ds_location : LibC::LPWSTR
    ds_loc_type : UInt32
  end
  struct DHCPDS_SERVERS
    flags : UInt32
    num_elements : UInt32
    servers : DHCPDS_SERVER*
  end
  struct DHCP_ATTRIB
    dhcp_attrib_id : UInt32
    dhcp_attrib_type : UInt32
    anonymous : DHCP_ATTRIB_Anonymous_e__Union
  end
  struct DHCP_ATTRIB_ARRAY
    num_elements : UInt32
    dhcp_attribs : DHCP_ATTRIB*
  end
  struct DHCP_BOOTP_IP_RANGE
    start_address : UInt32
    end_address : UInt32
    bootp_allocated : UInt32
    max_bootp_allowed : UInt32
  end
  struct DHCP_SUBNET_ELEMENT_DATA_V5
    element_type : DHCP_SUBNET_ELEMENT_TYPE
    element : DHCP_SUBNET_ELEMENT_DATA_V5_DHCP_SUBNET_ELEMENT_UNION_V5
  end
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5
    num_elements : UInt32
    elements : DHCP_SUBNET_ELEMENT_DATA_V5*
  end
  struct DHCP_PERF_STATS
    dw_num_packets_received : UInt32
    dw_num_packets_duplicate : UInt32
    dw_num_packets_expired : UInt32
    dw_num_milli_seconds_processed : UInt32
    dw_num_packets_in_active_queue : UInt32
    dw_num_packets_in_ping_queue : UInt32
    dw_num_discovers_received : UInt32
    dw_num_offers_sent : UInt32
    dw_num_requests_received : UInt32
    dw_num_informs_received : UInt32
    dw_num_acks_sent : UInt32
    dw_num_nacks_sent : UInt32
    dw_num_declines_received : UInt32
    dw_num_releases_received : UInt32
    dw_num_delayed_offer_in_queue : UInt32
    dw_num_packets_processed : UInt32
    dw_num_packets_in_quar_waiting_queue : UInt32
    dw_num_packets_in_quar_ready_queue : UInt32
    dw_num_packets_in_quar_decision_queue : UInt32
  end
  struct DHCP_BIND_ELEMENT
    flags : UInt32
    f_bound_to_dhcp_server : LibC::BOOL
    adapter_primary_address : UInt32
    adapter_subnet_address : UInt32
    if_description : LibC::LPWSTR
    if_id_size : UInt32
    if_id : UInt8*
  end
  struct DHCP_BIND_ELEMENT_ARRAY
    num_elements : UInt32
    elements : DHCP_BIND_ELEMENT*
  end
  struct DHCPV6_BIND_ELEMENT
    flags : UInt32
    f_bound_to_dhcp_server : LibC::BOOL
    adapter_primary_address : DHCP_IPV6_ADDRESS
    adapter_subnet_address : DHCP_IPV6_ADDRESS
    if_description : LibC::LPWSTR
    ip_v6_if_index : UInt32
    if_id_size : UInt32
    if_id : UInt8*
  end
  struct DHCPV6_BIND_ELEMENT_ARRAY
    num_elements : UInt32
    elements : DHCPV6_BIND_ELEMENT*
  end
  struct DHCP_IP_RANGE_V6
    start_address : DHCP_IPV6_ADDRESS
    end_address : DHCP_IPV6_ADDRESS
  end
  struct DHCP_HOST_INFO_V6
    ip_address : DHCP_IPV6_ADDRESS
    net_bios_name : LibC::LPWSTR
    host_name : LibC::LPWSTR
  end
  struct DHCP_SUBNET_INFO_V6
    subnet_address : DHCP_IPV6_ADDRESS
    prefix : UInt32
    preference : UInt16
    subnet_name : LibC::LPWSTR
    subnet_comment : LibC::LPWSTR
    state : UInt32
    scope_id : UInt32
  end
  struct SCOPE_MIB_INFO_V6
    subnet : DHCP_IPV6_ADDRESS
    num_addresses_inuse : UInt64
    num_addresses_free : UInt64
    num_pending_advertises : UInt64
  end
  struct DHCP_MIB_INFO_V6
    solicits : UInt32
    advertises : UInt32
    requests : UInt32
    renews : UInt32
    rebinds : UInt32
    replies : UInt32
    confirms : UInt32
    declines : UInt32
    releases : UInt32
    informs : UInt32
    server_start_time : DATE_TIME
    scopes : UInt32
    scope_info : SCOPE_MIB_INFO_V6*
  end
  struct DHCP_IP_RESERVATION_V6
    reserved_ip_address : DHCP_IPV6_ADDRESS
    reserved_for_client : DHCP_BINARY_DATA*
    interface_id : UInt32
  end
  struct DHCP_SUBNET_ELEMENT_DATA_V6
    element_type : DHCP_SUBNET_ELEMENT_TYPE_V6
    element : DHCP_SUBNET_ELEMENT_DATA_V6DHCP_SUBNET_ELEMENT_UNION_V6
  end
  struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6
    num_elements : UInt32
    elements : DHCP_SUBNET_ELEMENT_DATA_V6*
  end
  struct DHCP_CLIENT_INFO_V6
    client_ip_address : DHCP_IPV6_ADDRESS
    client_duid : DHCP_BINARY_DATA
    address_type : UInt32
    iaid : UInt32
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_valid_lease_expires : DATE_TIME
    client_pref_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO_V6
  end
  struct DHCPV6_IP_ARRAY
    num_elements : UInt32
    elements : DHCP_IPV6_ADDRESS*
  end
  struct DHCP_CLIENT_INFO_ARRAY_V6
    num_elements : UInt32
    clients : DHCP_CLIENT_INFO_V6**
  end
  struct DHCP_SEARCH_INFO_V6
    search_type : DHCP_SEARCH_INFO_TYPE_V6
    search_info : DHCP_SEARCH_INFO_V6_DHCP_CLIENT_SEARCH_UNION_V6
  end
  struct DHCP_POL_COND
    parent_expr : UInt32
    type : DHCP_POL_ATTR_TYPE
    option_id : UInt32
    sub_option_id : UInt32
    vendor_name : LibC::LPWSTR
    operator : DHCP_POL_COMPARATOR
    value : UInt8*
    value_length : UInt32
  end
  struct DHCP_POL_COND_ARRAY
    num_elements : UInt32
    elements : DHCP_POL_COND*
  end
  struct DHCP_POL_EXPR
    parent_expr : UInt32
    operator : DHCP_POL_LOGIC_OPER
  end
  struct DHCP_POL_EXPR_ARRAY
    num_elements : UInt32
    elements : DHCP_POL_EXPR*
  end
  struct DHCP_IP_RANGE_ARRAY
    num_elements : UInt32
    elements : DHCP_IP_RANGE*
  end
  struct DHCP_POLICY
    policy_name : LibC::LPWSTR
    is_global_policy : LibC::BOOL
    subnet : UInt32
    processing_order : UInt32
    conditions : DHCP_POL_COND_ARRAY*
    expressions : DHCP_POL_EXPR_ARRAY*
    ranges : DHCP_IP_RANGE_ARRAY*
    description : LibC::LPWSTR
    enabled : LibC::BOOL
  end
  struct DHCP_POLICY_ARRAY
    num_elements : UInt32
    elements : DHCP_POLICY*
  end
  struct DHCP_POLICY_EX
    policy_name : LibC::LPWSTR
    is_global_policy : LibC::BOOL
    subnet : UInt32
    processing_order : UInt32
    conditions : DHCP_POL_COND_ARRAY*
    expressions : DHCP_POL_EXPR_ARRAY*
    ranges : DHCP_IP_RANGE_ARRAY*
    description : LibC::LPWSTR
    enabled : LibC::BOOL
    properties : DHCP_PROPERTY_ARRAY*
  end
  struct DHCP_POLICY_EX_ARRAY
    num_elements : UInt32
    elements : DHCP_POLICY_EX*
  end
  struct DHCPV6_STATELESS_PARAMS
    status : LibC::BOOL
    purge_interval : UInt32
  end
  struct DHCPV6_STATELESS_SCOPE_STATS
    subnet_address : DHCP_IPV6_ADDRESS
    num_stateless_clients_added : UInt64
    num_stateless_clients_removed : UInt64
  end
  struct DHCPV6_STATELESS_STATS
    num_scopes : UInt32
    scope_stats : DHCPV6_STATELESS_SCOPE_STATS*
  end
  struct DHCP_FAILOVER_RELATIONSHIP
    primary_server : UInt32
    secondary_server : UInt32
    mode : DHCP_FAILOVER_MODE
    server_type : DHCP_FAILOVER_SERVER
    state : FSM_STATE
    prev_state : FSM_STATE
    mclt : UInt32
    safe_period : UInt32
    relationship_name : LibC::LPWSTR
    primary_server_name : LibC::LPWSTR
    secondary_server_name : LibC::LPWSTR
    p_scopes : DHCP_IP_ARRAY*
    percentage : UInt8
    shared_secret : LibC::LPWSTR
  end
  struct DHCP_FAILOVER_RELATIONSHIP_ARRAY
    num_elements : UInt32
    p_relationships : DHCP_FAILOVER_RELATIONSHIP*
  end
  struct DHCPV4_FAILOVER_CLIENT_INFO
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
    address_state : UInt8
    status : QuarantineStatus
    probation_ends : DATE_TIME
    quarantine_capable : LibC::BOOL
    sent_pot_exp_time : UInt32
    ack_pot_exp_time : UInt32
    recv_pot_exp_time : UInt32
    start_time : UInt32
    clt_last_trans_time : UInt32
    last_bnd_upd_time : UInt32
    bnd_msg_status : UInt32
    policy_name : LibC::LPWSTR
    flags : UInt8
  end
  struct DHCPV4_FAILOVER_CLIENT_INFO_ARRAY
    num_elements : UInt32
    clients : DHCPV4_FAILOVER_CLIENT_INFO**
  end
  struct DHCPV4_FAILOVER_CLIENT_INFO_EX
    client_ip_address : UInt32
    subnet_mask : UInt32
    client_hardware_address : DHCP_BINARY_DATA
    client_name : LibC::LPWSTR
    client_comment : LibC::LPWSTR
    client_lease_expires : DATE_TIME
    owner_host : DHCP_HOST_INFO
    b_client_type : UInt8
    address_state : UInt8
    status : QuarantineStatus
    probation_ends : DATE_TIME
    quarantine_capable : LibC::BOOL
    sent_pot_exp_time : UInt32
    ack_pot_exp_time : UInt32
    recv_pot_exp_time : UInt32
    start_time : UInt32
    clt_last_trans_time : UInt32
    last_bnd_upd_time : UInt32
    bnd_msg_status : UInt32
    policy_name : LibC::LPWSTR
    flags : UInt8
    address_state_ex : UInt32
  end
  struct DHCP_FAILOVER_STATISTICS
    num_addr : UInt32
    addr_free : UInt32
    addr_in_use : UInt32
    partner_addr_free : UInt32
    this_addr_free : UInt32
    partner_addr_in_use : UInt32
    this_addr_in_use : UInt32
  end


  # Params # version : UInt32* [In]
  fun Dhcpv6CApiInitialize(version : UInt32*)

  # Params # 
  fun Dhcpv6CApiCleanup

  # Params # forcenewinform : LibC::BOOL [In],reserved : Void* [In],adaptername : LibC::LPWSTR [In],classid : DHCPV6CAPI_CLASSID* [In],recdparams : DHCPV6CAPI_PARAMS_ARRAY [In],buffer : UInt8* [In],psize : UInt32* [In]
  fun Dhcpv6RequestParams(forcenewinform : LibC::BOOL, reserved : Void*, adaptername : LibC::LPWSTR, classid : DHCPV6CAPI_CLASSID*, recdparams : DHCPV6CAPI_PARAMS_ARRAY, buffer : UInt8*, psize : UInt32*) : UInt32

  # Params # adaptername : LibC::LPWSTR [In],pclassid : DHCPV6CAPI_CLASSID* [In],prefixleaseinfo : DHCPV6PrefixLeaseInformation* [In],pdwtimetowait : UInt32* [In]
  fun Dhcpv6RequestPrefix(adaptername : LibC::LPWSTR, pclassid : DHCPV6CAPI_CLASSID*, prefixleaseinfo : DHCPV6PrefixLeaseInformation*, pdwtimetowait : UInt32*) : UInt32

  # Params # adaptername : LibC::LPWSTR [In],pclassid : DHCPV6CAPI_CLASSID* [In],prefixleaseinfo : DHCPV6PrefixLeaseInformation* [In],pdwtimetowait : UInt32* [In],bvalidateprefix : UInt32 [In]
  fun Dhcpv6RenewPrefix(adaptername : LibC::LPWSTR, pclassid : DHCPV6CAPI_CLASSID*, prefixleaseinfo : DHCPV6PrefixLeaseInformation*, pdwtimetowait : UInt32*, bvalidateprefix : UInt32) : UInt32

  # Params # adaptername : LibC::LPWSTR [In],classid : DHCPV6CAPI_CLASSID* [In],leaseinfo : DHCPV6PrefixLeaseInformation* [In]
  fun Dhcpv6ReleasePrefix(adaptername : LibC::LPWSTR, classid : DHCPV6CAPI_CLASSID*, leaseinfo : DHCPV6PrefixLeaseInformation*) : UInt32

  # Params # version : UInt32* [In]
  fun DhcpCApiInitialize(version : UInt32*) : UInt32

  # Params # 
  fun DhcpCApiCleanup

  # Params # flags : UInt32 [In],reserved : Void* [In],adaptername : LibC::LPWSTR [In],classid : DHCPCAPI_CLASSID* [In],sendparams : DHCPCAPI_PARAMS_ARRAY [In],recdparams : DHCPCAPI_PARAMS_ARRAY [In],buffer : UInt8* [In],psize : UInt32* [In],requestidstr : LibC::LPWSTR [In]
  fun DhcpRequestParams(flags : UInt32, reserved : Void*, adaptername : LibC::LPWSTR, classid : DHCPCAPI_CLASSID*, sendparams : DHCPCAPI_PARAMS_ARRAY, recdparams : DHCPCAPI_PARAMS_ARRAY, buffer : UInt8*, psize : UInt32*, requestidstr : LibC::LPWSTR) : UInt32

  # Params # flags : UInt32 [In],reserved : Void* [In],adaptername : LibC::LPWSTR [In],requestidstr : LibC::LPWSTR [In]
  fun DhcpUndoRequestParams(flags : UInt32, reserved : Void*, adaptername : LibC::LPWSTR, requestidstr : LibC::LPWSTR) : UInt32

  # Params # flags : UInt32 [In],reserved : Void* [In],adaptername : LibC::LPWSTR [In],classid : DHCPCAPI_CLASSID* [In],params : DHCPCAPI_PARAMS_ARRAY [In],handle : Void* [In]
  fun DhcpRegisterParamChange(flags : UInt32, reserved : Void*, adaptername : LibC::LPWSTR, classid : DHCPCAPI_CLASSID*, params : DHCPCAPI_PARAMS_ARRAY, handle : Void*) : UInt32

  # Params # flags : UInt32 [In],reserved : Void* [In],event : Void* [In]
  fun DhcpDeRegisterParamChange(flags : UInt32, reserved : Void*, event : Void*) : UInt32

  # Params # 
  fun DhcpRemoveDNSRegistrations : UInt32

  # Params # sadaptername : LibC::LPWSTR [In],dwsubnetmask : UInt32* [In]
  fun DhcpGetOriginalSubnetMask(sadaptername : LibC::LPWSTR, dwsubnetmask : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],addfilterinfo : DHCP_FILTER_ADD_INFO* [In],forceflag : LibC::BOOL [In]
  fun DhcpAddFilterV4(serveripaddress : LibC::LPWSTR, addfilterinfo : DHCP_FILTER_ADD_INFO*, forceflag : LibC::BOOL) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],deletefilterinfo : DHCP_ADDR_PATTERN* [In]
  fun DhcpDeleteFilterV4(serveripaddress : LibC::LPWSTR, deletefilterinfo : DHCP_ADDR_PATTERN*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],globalfilterinfo : DHCP_FILTER_GLOBAL_INFO* [In]
  fun DhcpSetFilterV4(serveripaddress : LibC::LPWSTR, globalfilterinfo : DHCP_FILTER_GLOBAL_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],globalfilterinfo : DHCP_FILTER_GLOBAL_INFO* [In]
  fun DhcpGetFilterV4(serveripaddress : LibC::LPWSTR, globalfilterinfo : DHCP_FILTER_GLOBAL_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],resumehandle : DHCP_ADDR_PATTERN* [In],preferredmaximum : UInt32 [In],listtype : DHCP_FILTER_LIST_TYPE [In],enumfilterinfo : DHCP_FILTER_ENUM_INFO** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpEnumFilterV4(serveripaddress : LibC::LPWSTR, resumehandle : DHCP_ADDR_PATTERN*, preferredmaximum : UInt32, listtype : DHCP_FILTER_LIST_TYPE, enumfilterinfo : DHCP_FILTER_ENUM_INFO**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],subnetinfo : DHCP_SUBNET_INFO* [In]
  fun DhcpCreateSubnet(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, subnetinfo : DHCP_SUBNET_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],subnetinfo : DHCP_SUBNET_INFO* [In]
  fun DhcpSetSubnetInfo(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, subnetinfo : DHCP_SUBNET_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],subnetinfo : DHCP_SUBNET_INFO** [In]
  fun DhcpGetSubnetInfo(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, subnetinfo : DHCP_SUBNET_INFO**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],enuminfo : DHCP_IP_ARRAY** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpEnumSubnets(serveripaddress : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, enuminfo : DHCP_IP_ARRAY**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],addelementinfo : DHCP_SUBNET_ELEMENT_DATA* [In]
  fun DhcpAddSubnetElement(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, addelementinfo : DHCP_SUBNET_ELEMENT_DATA*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],enumelementtype : DHCP_SUBNET_ELEMENT_TYPE [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpEnumSubnetElements(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, enumelementtype : DHCP_SUBNET_ELEMENT_TYPE, resumehandle : UInt32*, preferredmaximum : UInt32, enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],removeelementinfo : DHCP_SUBNET_ELEMENT_DATA* [In],forceflag : DHCP_FORCE_FLAG [In]
  fun DhcpRemoveSubnetElement(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, removeelementinfo : DHCP_SUBNET_ELEMENT_DATA*, forceflag : DHCP_FORCE_FLAG) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],forceflag : DHCP_FORCE_FLAG [In]
  fun DhcpDeleteSubnet(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, forceflag : DHCP_FORCE_FLAG) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],optionid : UInt32 [In],optioninfo : DHCP_OPTION* [In]
  fun DhcpCreateOption(serveripaddress : LibC::LPWSTR, optionid : UInt32, optioninfo : DHCP_OPTION*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],optionid : UInt32 [In],optioninfo : DHCP_OPTION* [In]
  fun DhcpSetOptionInfo(serveripaddress : LibC::LPWSTR, optionid : UInt32, optioninfo : DHCP_OPTION*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],optionid : UInt32 [In],optioninfo : DHCP_OPTION** [In]
  fun DhcpGetOptionInfo(serveripaddress : LibC::LPWSTR, optionid : UInt32, optioninfo : DHCP_OPTION**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],options : DHCP_OPTION_ARRAY** [In],optionsread : UInt32* [In],optionstotal : UInt32* [In]
  fun DhcpEnumOptions(serveripaddress : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, options : DHCP_OPTION_ARRAY**, optionsread : UInt32*, optionstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],optionid : UInt32 [In]
  fun DhcpRemoveOption(serveripaddress : LibC::LPWSTR, optionid : UInt32) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],optionid : UInt32 [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalue : DHCP_OPTION_DATA* [In]
  fun DhcpSetOptionValue(serveripaddress : LibC::LPWSTR, optionid : UInt32, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalue : DHCP_OPTION_DATA*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalues : DHCP_OPTION_VALUE_ARRAY* [In]
  fun DhcpSetOptionValues(serveripaddress : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalues : DHCP_OPTION_VALUE_ARRAY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],optionid : UInt32 [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalue : DHCP_OPTION_VALUE** [In]
  fun DhcpGetOptionValue(serveripaddress : LibC::LPWSTR, optionid : UInt32, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalue : DHCP_OPTION_VALUE**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],optionvalues : DHCP_OPTION_VALUE_ARRAY** [In],optionsread : UInt32* [In],optionstotal : UInt32* [In]
  fun DhcpEnumOptionValues(serveripaddress : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, resumehandle : UInt32*, preferredmaximum : UInt32, optionvalues : DHCP_OPTION_VALUE_ARRAY**, optionsread : UInt32*, optionstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],optionid : UInt32 [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In]
  fun DhcpRemoveOptionValue(serveripaddress : LibC::LPWSTR, optionid : UInt32, scopeinfo : DHCP_OPTION_SCOPE_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_VQ* [In]
  fun DhcpCreateClientInfoVQ(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_VQ*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_VQ* [In]
  fun DhcpSetClientInfoVQ(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_VQ*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],searchinfo : DHCP_SEARCH_INFO* [In],clientinfo : DHCP_CLIENT_INFO_VQ** [In]
  fun DhcpGetClientInfoVQ(serveripaddress : LibC::LPWSTR, searchinfo : DHCP_SEARCH_INFO*, clientinfo : DHCP_CLIENT_INFO_VQ**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_INFO_ARRAY_VQ** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpEnumSubnetClientsVQ(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_INFO_ARRAY_VQ**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpEnumSubnetClientsFilterStatusInfo(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO* [In]
  fun DhcpCreateClientInfo(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO* [In]
  fun DhcpSetClientInfo(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],searchinfo : DHCP_SEARCH_INFO* [In],clientinfo : DHCP_CLIENT_INFO** [In]
  fun DhcpGetClientInfo(serveripaddress : LibC::LPWSTR, searchinfo : DHCP_SEARCH_INFO*, clientinfo : DHCP_CLIENT_INFO**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_SEARCH_INFO* [In]
  fun DhcpDeleteClientInfo(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_SEARCH_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_INFO_ARRAY** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpEnumSubnetClients(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_INFO_ARRAY**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientipaddress : UInt32 [In],clientsubnetmask : UInt32 [In],clientoptions : DHCP_OPTION_LIST** [In]
  fun DhcpGetClientOptions(serveripaddress : LibC::LPWSTR, clientipaddress : UInt32, clientsubnetmask : UInt32, clientoptions : DHCP_OPTION_LIST**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],mibinfo : DHCP_MIB_INFO** [In]
  fun DhcpGetMibInfo(serveripaddress : LibC::LPWSTR, mibinfo : DHCP_MIB_INFO**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fieldstoset : UInt32 [In],configinfo : DHCP_SERVER_CONFIG_INFO* [In]
  fun DhcpServerSetConfig(serveripaddress : LibC::LPWSTR, fieldstoset : UInt32, configinfo : DHCP_SERVER_CONFIG_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],configinfo : DHCP_SERVER_CONFIG_INFO** [In]
  fun DhcpServerGetConfig(serveripaddress : LibC::LPWSTR, configinfo : DHCP_SERVER_CONFIG_INFO**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],fixflag : UInt32 [In],scanlist : DHCP_SCAN_LIST** [In]
  fun DhcpScanDatabase(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, fixflag : UInt32, scanlist : DHCP_SCAN_LIST**) : UInt32

  # Params # bufferpointer : Void* [In]
  fun DhcpRpcFreeMemory(bufferpointer : Void*)

  # Params # serveripaddress : LibC::LPWSTR [In],majorversion : UInt32* [In],minorversion : UInt32* [In]
  fun DhcpGetVersion(serveripaddress : LibC::LPWSTR, majorversion : UInt32*, minorversion : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],addelementinfo : DHCP_SUBNET_ELEMENT_DATA_V4* [In]
  fun DhcpAddSubnetElementV4(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, addelementinfo : DHCP_SUBNET_ELEMENT_DATA_V4*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],enumelementtype : DHCP_SUBNET_ELEMENT_TYPE [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpEnumSubnetElementsV4(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, enumelementtype : DHCP_SUBNET_ELEMENT_TYPE, resumehandle : UInt32*, preferredmaximum : UInt32, enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],removeelementinfo : DHCP_SUBNET_ELEMENT_DATA_V4* [In],forceflag : DHCP_FORCE_FLAG [In]
  fun DhcpRemoveSubnetElementV4(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, removeelementinfo : DHCP_SUBNET_ELEMENT_DATA_V4*, forceflag : DHCP_FORCE_FLAG) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_V4* [In]
  fun DhcpCreateClientInfoV4(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_V4*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_V4* [In]
  fun DhcpSetClientInfoV4(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_V4*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],searchinfo : DHCP_SEARCH_INFO* [In],clientinfo : DHCP_CLIENT_INFO_V4** [In]
  fun DhcpGetClientInfoV4(serveripaddress : LibC::LPWSTR, searchinfo : DHCP_SEARCH_INFO*, clientinfo : DHCP_CLIENT_INFO_V4**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_INFO_ARRAY_V4** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpEnumSubnetClientsV4(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_INFO_ARRAY_V4**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fieldstoset : UInt32 [In],configinfo : DHCP_SERVER_CONFIG_INFO_V4* [In]
  fun DhcpServerSetConfigV4(serveripaddress : LibC::LPWSTR, fieldstoset : UInt32, configinfo : DHCP_SERVER_CONFIG_INFO_V4*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],configinfo : DHCP_SERVER_CONFIG_INFO_V4** [In]
  fun DhcpServerGetConfigV4(serveripaddress : LibC::LPWSTR, configinfo : DHCP_SERVER_CONFIG_INFO_V4**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],superscopename : LibC::LPWSTR [In],changeexisting : LibC::BOOL [In]
  fun DhcpSetSuperScopeV4(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, superscopename : LibC::LPWSTR, changeexisting : LibC::BOOL) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],superscopename : LibC::LPWSTR [In]
  fun DhcpDeleteSuperScopeV4(serveripaddress : LibC::LPWSTR, superscopename : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],superscopetable : DHCP_SUPER_SCOPE_TABLE** [In]
  fun DhcpGetSuperScopeInfoV4(serveripaddress : LibC::LPWSTR, superscopetable : DHCP_SUPER_SCOPE_TABLE**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_INFO_ARRAY_V5** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpEnumSubnetClientsV5(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_INFO_ARRAY_V5**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],optioninfo : DHCP_OPTION* [In]
  fun DhcpCreateOptionV5(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, optioninfo : DHCP_OPTION*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],optioninfo : DHCP_OPTION* [In]
  fun DhcpSetOptionInfoV5(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, optioninfo : DHCP_OPTION*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],optioninfo : DHCP_OPTION** [In]
  fun DhcpGetOptionInfoV5(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, optioninfo : DHCP_OPTION**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],options : DHCP_OPTION_ARRAY** [In],optionsread : UInt32* [In],optionstotal : UInt32* [In]
  fun DhcpEnumOptionsV5(serveripaddress : LibC::LPWSTR, flags : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, options : DHCP_OPTION_ARRAY**, optionsread : UInt32*, optionstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In]
  fun DhcpRemoveOptionV5(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalue : DHCP_OPTION_DATA* [In]
  fun DhcpSetOptionValueV5(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalue : DHCP_OPTION_DATA*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalues : DHCP_OPTION_VALUE_ARRAY* [In]
  fun DhcpSetOptionValuesV5(serveripaddress : LibC::LPWSTR, flags : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalues : DHCP_OPTION_VALUE_ARRAY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalue : DHCP_OPTION_VALUE** [In]
  fun DhcpGetOptionValueV5(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalue : DHCP_OPTION_VALUE**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO6* [In],optionvalue : DHCP_OPTION_VALUE** [In]
  fun DhcpGetOptionValueV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO6*, optionvalue : DHCP_OPTION_VALUE**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],optionvalues : DHCP_OPTION_VALUE_ARRAY** [In],optionsread : UInt32* [In],optionstotal : UInt32* [In]
  fun DhcpEnumOptionValuesV5(serveripaddress : LibC::LPWSTR, flags : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, resumehandle : UInt32*, preferredmaximum : UInt32, optionvalues : DHCP_OPTION_VALUE_ARRAY**, optionsread : UInt32*, optionstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In]
  fun DhcpRemoveOptionValueV5(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],classinfo : DHCP_CLASS_INFO* [In]
  fun DhcpCreateClass(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, classinfo : DHCP_CLASS_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],classinfo : DHCP_CLASS_INFO* [In]
  fun DhcpModifyClass(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, classinfo : DHCP_CLASS_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],classname : LibC::LPWSTR [In]
  fun DhcpDeleteClass(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, classname : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],partialclassinfo : DHCP_CLASS_INFO* [In],filledclassinfo : DHCP_CLASS_INFO** [In]
  fun DhcpGetClassInfo(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, partialclassinfo : DHCP_CLASS_INFO*, filledclassinfo : DHCP_CLASS_INFO**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],classinfoarray : DHCP_CLASS_INFO_ARRAY** [In],nread : UInt32* [In],ntotal : UInt32* [In]
  fun DhcpEnumClasses(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, classinfoarray : DHCP_CLASS_INFO_ARRAY**, nread : UInt32*, ntotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionstruct : DHCP_ALL_OPTIONS** [In]
  fun DhcpGetAllOptions(serveripaddress : LibC::LPWSTR, flags : UInt32, optionstruct : DHCP_ALL_OPTIONS**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionstruct : DHCP_ALL_OPTIONS** [In]
  fun DhcpGetAllOptionsV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionstruct : DHCP_ALL_OPTIONS**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],values : DHCP_ALL_OPTION_VALUES** [In]
  fun DhcpGetAllOptionValues(serveripaddress : LibC::LPWSTR, flags : UInt32, scopeinfo : DHCP_OPTION_SCOPE_INFO*, values : DHCP_ALL_OPTION_VALUES**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],scopeinfo : DHCP_OPTION_SCOPE_INFO6* [In],values : DHCP_ALL_OPTION_VALUES** [In]
  fun DhcpGetAllOptionValuesV6(serveripaddress : LibC::LPWSTR, flags : UInt32, scopeinfo : DHCP_OPTION_SCOPE_INFO6*, values : DHCP_ALL_OPTION_VALUES**) : UInt32

  # Params # flags : UInt32 [In],idinfo : Void* [In],servers : DHCPDS_SERVERS** [In],callbackfn : Void* [In],callbackdata : Void* [In]
  fun DhcpEnumServers(flags : UInt32, idinfo : Void*, servers : DHCPDS_SERVERS**, callbackfn : Void*, callbackdata : Void*) : UInt32

  # Params # flags : UInt32 [In],idinfo : Void* [In],newserver : DHCPDS_SERVER* [In],callbackfn : Void* [In],callbackdata : Void* [In]
  fun DhcpAddServer(flags : UInt32, idinfo : Void*, newserver : DHCPDS_SERVER*, callbackfn : Void*, callbackdata : Void*) : UInt32

  # Params # flags : UInt32 [In],idinfo : Void* [In],newserver : DHCPDS_SERVER* [In],callbackfn : Void* [In],callbackdata : Void* [In]
  fun DhcpDeleteServer(flags : UInt32, idinfo : Void*, newserver : DHCPDS_SERVER*, callbackfn : Void*, callbackdata : Void*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],bindelementsinfo : DHCP_BIND_ELEMENT_ARRAY** [In]
  fun DhcpGetServerBindingInfo(serveripaddress : LibC::LPWSTR, flags : UInt32, bindelementsinfo : DHCP_BIND_ELEMENT_ARRAY**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],bindelementinfo : DHCP_BIND_ELEMENT_ARRAY* [In]
  fun DhcpSetServerBindingInfo(serveripaddress : LibC::LPWSTR, flags : UInt32, bindelementinfo : DHCP_BIND_ELEMENT_ARRAY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],addelementinfo : DHCP_SUBNET_ELEMENT_DATA_V5* [In]
  fun DhcpAddSubnetElementV5(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, addelementinfo : DHCP_SUBNET_ELEMENT_DATA_V5*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],enumelementtype : DHCP_SUBNET_ELEMENT_TYPE [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpEnumSubnetElementsV5(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, enumelementtype : DHCP_SUBNET_ELEMENT_TYPE, resumehandle : UInt32*, preferredmaximum : UInt32, enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],removeelementinfo : DHCP_SUBNET_ELEMENT_DATA_V5* [In],forceflag : DHCP_FORCE_FLAG [In]
  fun DhcpRemoveSubnetElementV5(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, removeelementinfo : DHCP_SUBNET_ELEMENT_DATA_V5*, forceflag : DHCP_FORCE_FLAG) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],enumelementinfo : DHCP_RESERVATION_INFO_ARRAY** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpV4EnumSubnetReservations(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, enumelementinfo : DHCP_RESERVATION_INFO_ARRAY**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],optioninfo : DHCP_OPTION* [In]
  fun DhcpCreateOptionV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, optioninfo : DHCP_OPTION*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In]
  fun DhcpRemoveOptionV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],options : DHCP_OPTION_ARRAY** [In],optionsread : UInt32* [In],optionstotal : UInt32* [In]
  fun DhcpEnumOptionsV6(serveripaddress : LibC::LPWSTR, flags : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, options : DHCP_OPTION_ARRAY**, optionsread : UInt32*, optionstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO6* [In]
  fun DhcpRemoveOptionValueV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],optioninfo : DHCP_OPTION** [In]
  fun DhcpGetOptionInfoV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, optioninfo : DHCP_OPTION**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],optioninfo : DHCP_OPTION* [In]
  fun DhcpSetOptionInfoV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, optioninfo : DHCP_OPTION*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO6* [In],optionvalue : DHCP_OPTION_DATA* [In]
  fun DhcpSetOptionValueV6(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO6*, optionvalue : DHCP_OPTION_DATA*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],subnetinfo : DHCP_SUBNET_INFO_VQ** [In]
  fun DhcpGetSubnetInfoVQ(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, subnetinfo : DHCP_SUBNET_INFO_VQ**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],subnetinfo : DHCP_SUBNET_INFO_VQ* [In]
  fun DhcpCreateSubnetVQ(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, subnetinfo : DHCP_SUBNET_INFO_VQ*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],subnetinfo : DHCP_SUBNET_INFO_VQ* [In]
  fun DhcpSetSubnetInfoVQ(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, subnetinfo : DHCP_SUBNET_INFO_VQ*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],classname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO6* [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],optionvalues : DHCP_OPTION_VALUE_ARRAY** [In],optionsread : UInt32* [In],optionstotal : UInt32* [In]
  fun DhcpEnumOptionValuesV6(serveripaddress : LibC::LPWSTR, flags : UInt32, classname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO6*, resumehandle : UInt32*, preferredmaximum : UInt32, optionvalues : DHCP_OPTION_VALUE_ARRAY**, optionsread : UInt32*, optionstotal : UInt32*) : UInt32

  # Params # 
  fun DhcpDsInit : UInt32

  # Params # 
  fun DhcpDsCleanup

  # Params # flags : UInt32 [In],reserved : Void* [In]
  fun DhcpSetThreadOptions(flags : UInt32, reserved : Void*) : UInt32

  # Params # pflags : UInt32* [In],reserved : Void* [In]
  fun DhcpGetThreadOptions(pflags : UInt32*, reserved : Void*) : UInt32

  # Params # serveripaddr : LibC::LPWSTR [In],dwreserved : UInt32 [In],dhcpattribid : UInt32 [In],pdhcpattrib : DHCP_ATTRIB** [In]
  fun DhcpServerQueryAttribute(serveripaddr : LibC::LPWSTR, dwreserved : UInt32, dhcpattribid : UInt32, pdhcpattrib : DHCP_ATTRIB**) : UInt32

  # Params # serveripaddr : LibC::LPWSTR [In],dwreserved : UInt32 [In],dwattribcount : UInt32 [In],pdhcpattribs : UInt32* [In],pdhcpattribarr : DHCP_ATTRIB_ARRAY** [In]
  fun DhcpServerQueryAttributes(serveripaddr : LibC::LPWSTR, dwreserved : UInt32, dwattribcount : UInt32, pdhcpattribs : UInt32*, pdhcpattribarr : DHCP_ATTRIB_ARRAY**) : UInt32

  # Params # serveripaddr : LibC::LPWSTR [In],dwreserved : UInt32 [In]
  fun DhcpServerRedoAuthorization(serveripaddr : LibC::LPWSTR, dwreserved : UInt32) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],auditlogdir : LibC::LPWSTR [In],diskcheckinterval : UInt32 [In],maxlogfilessize : UInt32 [In],minspaceondisk : UInt32 [In]
  fun DhcpAuditLogSetParams(serveripaddress : LibC::LPWSTR, flags : UInt32, auditlogdir : LibC::LPWSTR, diskcheckinterval : UInt32, maxlogfilessize : UInt32, minspaceondisk : UInt32) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],auditlogdir : LibC::LPWSTR* [In],diskcheckinterval : UInt32* [In],maxlogfilessize : UInt32* [In],minspaceondisk : UInt32* [In]
  fun DhcpAuditLogGetParams(serveripaddress : LibC::LPWSTR, flags : UInt32, auditlogdir : LibC::LPWSTR*, diskcheckinterval : UInt32*, maxlogfilessize : UInt32*, minspaceondisk : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],unamesize : UInt32 [In],uname : Char* [In],domainsize : UInt32 [In],domain : Char* [In]
  fun DhcpServerQueryDnsRegCredentials(serveripaddress : LibC::LPWSTR, unamesize : UInt32, uname : Char*, domainsize : UInt32, domain : Char*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],uname : LibC::LPWSTR [In],domain : LibC::LPWSTR [In],passwd : LibC::LPWSTR [In]
  fun DhcpServerSetDnsRegCredentials(serveripaddress : LibC::LPWSTR, uname : LibC::LPWSTR, domain : LibC::LPWSTR, passwd : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],uname : LibC::LPWSTR [In],domain : LibC::LPWSTR [In],passwd : LibC::LPWSTR [In]
  fun DhcpServerSetDnsRegCredentialsV5(serveripaddress : LibC::LPWSTR, uname : LibC::LPWSTR, domain : LibC::LPWSTR, passwd : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],path : LibC::LPWSTR [In]
  fun DhcpServerBackupDatabase(serveripaddress : LibC::LPWSTR, path : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],path : LibC::LPWSTR [In]
  fun DhcpServerRestoreDatabase(serveripaddress : LibC::LPWSTR, path : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fieldstoset : UInt32 [In],configinfo : DHCP_SERVER_CONFIG_INFO_VQ* [In]
  fun DhcpServerSetConfigVQ(serveripaddress : LibC::LPWSTR, fieldstoset : UInt32, configinfo : DHCP_SERVER_CONFIG_INFO_VQ*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],configinfo : DHCP_SERVER_CONFIG_INFO_VQ** [In]
  fun DhcpServerGetConfigVQ(serveripaddress : LibC::LPWSTR, configinfo : DHCP_SERVER_CONFIG_INFO_VQ**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],serverspecificstrings : DHCP_SERVER_SPECIFIC_STRINGS** [In]
  fun DhcpGetServerSpecificStrings(serveripaddress : LibC::LPWSTR, serverspecificstrings : DHCP_SERVER_SPECIFIC_STRINGS**) : UInt32

  # Params # configinfo : DHCP_SERVER_CONFIG_INFO_VQ* [In]
  fun DhcpServerAuditlogParamsFree(configinfo : DHCP_SERVER_CONFIG_INFO_VQ*)

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],subnetinfo : DHCP_SUBNET_INFO_V6* [In]
  fun DhcpCreateSubnetV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, subnetinfo : DHCP_SUBNET_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],forceflag : DHCP_FORCE_FLAG [In]
  fun DhcpDeleteSubnetV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, forceflag : DHCP_FORCE_FLAG) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],enuminfo : DHCPV6_IP_ARRAY** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpEnumSubnetsV6(serveripaddress : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, enuminfo : DHCPV6_IP_ARRAY**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],addelementinfo : DHCP_SUBNET_ELEMENT_DATA_V6* [In]
  fun DhcpAddSubnetElementV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, addelementinfo : DHCP_SUBNET_ELEMENT_DATA_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],removeelementinfo : DHCP_SUBNET_ELEMENT_DATA_V6* [In],forceflag : DHCP_FORCE_FLAG [In]
  fun DhcpRemoveSubnetElementV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, removeelementinfo : DHCP_SUBNET_ELEMENT_DATA_V6*, forceflag : DHCP_FORCE_FLAG) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],enumelementtype : DHCP_SUBNET_ELEMENT_TYPE_V6 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpEnumSubnetElementsV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, enumelementtype : DHCP_SUBNET_ELEMENT_TYPE_V6, resumehandle : UInt32*, preferredmaximum : UInt32, enumelementinfo : DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],subnetinfo : DHCP_SUBNET_INFO_V6** [In]
  fun DhcpGetSubnetInfoV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, subnetinfo : DHCP_SUBNET_INFO_V6**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],resumehandle : DHCP_IPV6_ADDRESS* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_INFO_ARRAY_V6** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpEnumSubnetClientsV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, resumehandle : DHCP_IPV6_ADDRESS*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_INFO_ARRAY_V6**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO6* [In],configinfo : DHCP_SERVER_CONFIG_INFO_V6** [In]
  fun DhcpServerGetConfigV6(serveripaddress : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO6*, configinfo : DHCP_SERVER_CONFIG_INFO_V6**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO6* [In],fieldstoset : UInt32 [In],configinfo : DHCP_SERVER_CONFIG_INFO_V6* [In]
  fun DhcpServerSetConfigV6(serveripaddress : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO6*, fieldstoset : UInt32, configinfo : DHCP_SERVER_CONFIG_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : DHCP_IPV6_ADDRESS [In],subnetinfo : DHCP_SUBNET_INFO_V6* [In]
  fun DhcpSetSubnetInfoV6(serveripaddress : LibC::LPWSTR, subnetaddress : DHCP_IPV6_ADDRESS, subnetinfo : DHCP_SUBNET_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],mibinfo : DHCP_MIB_INFO_V6** [In]
  fun DhcpGetMibInfoV6(serveripaddress : LibC::LPWSTR, mibinfo : DHCP_MIB_INFO_V6**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],bindelementsinfo : DHCPV6_BIND_ELEMENT_ARRAY** [In]
  fun DhcpGetServerBindingInfoV6(serveripaddress : LibC::LPWSTR, flags : UInt32, bindelementsinfo : DHCPV6_BIND_ELEMENT_ARRAY**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],bindelementinfo : DHCPV6_BIND_ELEMENT_ARRAY* [In]
  fun DhcpSetServerBindingInfoV6(serveripaddress : LibC::LPWSTR, flags : UInt32, bindelementinfo : DHCPV6_BIND_ELEMENT_ARRAY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_V6* [In]
  fun DhcpSetClientInfoV6(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],searchinfo : DHCP_SEARCH_INFO_V6* [In],clientinfo : DHCP_CLIENT_INFO_V6** [In]
  fun DhcpGetClientInfoV6(serveripaddress : LibC::LPWSTR, searchinfo : DHCP_SEARCH_INFO_V6*, clientinfo : DHCP_CLIENT_INFO_V6**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_SEARCH_INFO_V6* [In]
  fun DhcpDeleteClientInfoV6(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_SEARCH_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],classinfo : DHCP_CLASS_INFO_V6* [In]
  fun DhcpCreateClassV6(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, classinfo : DHCP_CLASS_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],classinfo : DHCP_CLASS_INFO_V6* [In]
  fun DhcpModifyClassV6(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, classinfo : DHCP_CLASS_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],classname : LibC::LPWSTR [In]
  fun DhcpDeleteClassV6(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, classname : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],reservedmustbezero : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],classinfoarray : DHCP_CLASS_INFO_ARRAY_V6** [In],nread : UInt32* [In],ntotal : UInt32* [In]
  fun DhcpEnumClassesV6(serveripaddress : LibC::LPWSTR, reservedmustbezero : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, classinfoarray : DHCP_CLASS_INFO_ARRAY_V6**, nread : UInt32*, ntotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],timedelayinmilliseconds : UInt16 [In]
  fun DhcpSetSubnetDelayOffer(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, timedelayinmilliseconds : UInt16) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],timedelayinmilliseconds : UInt16* [In]
  fun DhcpGetSubnetDelayOffer(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, timedelayinmilliseconds : UInt16*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],mibinfo : DHCP_MIB_INFO_V5** [In]
  fun DhcpGetMibInfoV5(serveripaddress : LibC::LPWSTR, mibinfo : DHCP_MIB_INFO_V5**) : UInt32

  # Params # pserver : LibC::LPWSTR [In]
  fun DhcpAddSecurityGroup(pserver : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],policyname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalue : DHCP_OPTION_VALUE** [In]
  fun DhcpV4GetOptionValue(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, policyname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalue : DHCP_OPTION_VALUE**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],policyname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalue : DHCP_OPTION_DATA* [In]
  fun DhcpV4SetOptionValue(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, policyname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalue : DHCP_OPTION_DATA*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],policyname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],optionvalues : DHCP_OPTION_VALUE_ARRAY* [In]
  fun DhcpV4SetOptionValues(serveripaddress : LibC::LPWSTR, flags : UInt32, policyname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*, optionvalues : DHCP_OPTION_VALUE_ARRAY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],optionid : UInt32 [In],policyname : LibC::LPWSTR [In],vendorname : LibC::LPWSTR [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In]
  fun DhcpV4RemoveOptionValue(serveripaddress : LibC::LPWSTR, flags : UInt32, optionid : UInt32, policyname : LibC::LPWSTR, vendorname : LibC::LPWSTR, scopeinfo : DHCP_OPTION_SCOPE_INFO*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],scopeinfo : DHCP_OPTION_SCOPE_INFO* [In],values : DHCP_ALL_OPTION_VALUES_PB** [In]
  fun DhcpV4GetAllOptionValues(serveripaddress : LibC::LPWSTR, flags : UInt32, scopeinfo : DHCP_OPTION_SCOPE_INFO*, values : DHCP_ALL_OPTION_VALUES_PB**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],prelationship : DHCP_FAILOVER_RELATIONSHIP* [In]
  fun DhcpV4FailoverCreateRelationship(serveripaddress : LibC::LPWSTR, prelationship : DHCP_FAILOVER_RELATIONSHIP*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],flags : UInt32 [In],prelationship : DHCP_FAILOVER_RELATIONSHIP* [In]
  fun DhcpV4FailoverSetRelationship(serveripaddress : LibC::LPWSTR, flags : UInt32, prelationship : DHCP_FAILOVER_RELATIONSHIP*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],prelationshipname : LibC::LPWSTR [In]
  fun DhcpV4FailoverDeleteRelationship(serveripaddress : LibC::LPWSTR, prelationshipname : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],prelationshipname : LibC::LPWSTR [In],prelationship : DHCP_FAILOVER_RELATIONSHIP** [In]
  fun DhcpV4FailoverGetRelationship(serveripaddress : LibC::LPWSTR, prelationshipname : LibC::LPWSTR, prelationship : DHCP_FAILOVER_RELATIONSHIP**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],prelationship : DHCP_FAILOVER_RELATIONSHIP_ARRAY** [In],relationshipread : UInt32* [In],relationshiptotal : UInt32* [In]
  fun DhcpV4FailoverEnumRelationship(serveripaddress : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, prelationship : DHCP_FAILOVER_RELATIONSHIP_ARRAY**, relationshipread : UInt32*, relationshiptotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],prelationship : DHCP_FAILOVER_RELATIONSHIP* [In]
  fun DhcpV4FailoverAddScopeToRelationship(serveripaddress : LibC::LPWSTR, prelationship : DHCP_FAILOVER_RELATIONSHIP*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],prelationship : DHCP_FAILOVER_RELATIONSHIP* [In]
  fun DhcpV4FailoverDeleteScopeFromRelationship(serveripaddress : LibC::LPWSTR, prelationship : DHCP_FAILOVER_RELATIONSHIP*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeid : UInt32 [In],prelationship : DHCP_FAILOVER_RELATIONSHIP** [In]
  fun DhcpV4FailoverGetScopeRelationship(serveripaddress : LibC::LPWSTR, scopeid : UInt32, prelationship : DHCP_FAILOVER_RELATIONSHIP**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeid : UInt32 [In],pstats : DHCP_FAILOVER_STATISTICS** [In]
  fun DhcpV4FailoverGetScopeStatistics(serveripaddress : LibC::LPWSTR, scopeid : UInt32, pstats : DHCP_FAILOVER_STATISTICS**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],searchinfo : DHCP_SEARCH_INFO* [In],clientinfo : DHCPV4_FAILOVER_CLIENT_INFO** [In]
  fun DhcpV4FailoverGetClientInfo(serveripaddress : LibC::LPWSTR, searchinfo : DHCP_SEARCH_INFO*, clientinfo : DHCPV4_FAILOVER_CLIENT_INFO**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],ptime : UInt32* [In],pmaxalloweddeltatime : UInt32* [In]
  fun DhcpV4FailoverGetSystemTime(serveripaddress : LibC::LPWSTR, ptime : UInt32*, pmaxalloweddeltatime : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],pstatus : UInt32* [In]
  fun DhcpV4FailoverGetAddressStatus(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, pstatus : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],pfailrelname : LibC::LPWSTR [In]
  fun DhcpV4FailoverTriggerAddrAllocation(serveripaddress : LibC::LPWSTR, pfailrelname : LibC::LPWSTR) : UInt32

  # Params # policyname : LibC::LPWSTR [In],fglobalpolicy : LibC::BOOL [In],subnet : UInt32 [In],processingorder : UInt32 [In],rootoperator : DHCP_POL_LOGIC_OPER [In],description : LibC::LPWSTR [In],enabled : LibC::BOOL [In],policy : DHCP_POLICY** [In]
  fun DhcpHlprCreateV4Policy(policyname : LibC::LPWSTR, fglobalpolicy : LibC::BOOL, subnet : UInt32, processingorder : UInt32, rootoperator : DHCP_POL_LOGIC_OPER, description : LibC::LPWSTR, enabled : LibC::BOOL, policy : DHCP_POLICY**) : UInt32

  # Params # policyname : LibC::LPWSTR [In],fglobalpolicy : LibC::BOOL [In],subnet : UInt32 [In],processingorder : UInt32 [In],rootoperator : DHCP_POL_LOGIC_OPER [In],description : LibC::LPWSTR [In],enabled : LibC::BOOL [In],policy : DHCP_POLICY_EX** [In]
  fun DhcpHlprCreateV4PolicyEx(policyname : LibC::LPWSTR, fglobalpolicy : LibC::BOOL, subnet : UInt32, processingorder : UInt32, rootoperator : DHCP_POL_LOGIC_OPER, description : LibC::LPWSTR, enabled : LibC::BOOL, policy : DHCP_POLICY_EX**) : UInt32

  # Params # policy : DHCP_POLICY* [In],parentexpr : UInt32 [In],operator : DHCP_POL_LOGIC_OPER [In],exprindex : UInt32* [In]
  fun DhcpHlprAddV4PolicyExpr(policy : DHCP_POLICY*, parentexpr : UInt32, operator : DHCP_POL_LOGIC_OPER, exprindex : UInt32*) : UInt32

  # Params # policy : DHCP_POLICY* [In],parentexpr : UInt32 [In],type : DHCP_POL_ATTR_TYPE [In],optionid : UInt32 [In],suboptionid : UInt32 [In],vendorname : LibC::LPWSTR [In],operator : DHCP_POL_COMPARATOR [In],value : UInt8* [In],valuelength : UInt32 [In],conditionindex : UInt32* [In]
  fun DhcpHlprAddV4PolicyCondition(policy : DHCP_POLICY*, parentexpr : UInt32, type : DHCP_POL_ATTR_TYPE, optionid : UInt32, suboptionid : UInt32, vendorname : LibC::LPWSTR, operator : DHCP_POL_COMPARATOR, value : UInt8*, valuelength : UInt32, conditionindex : UInt32*) : UInt32

  # Params # policy : DHCP_POLICY* [In],range : DHCP_IP_RANGE* [In]
  fun DhcpHlprAddV4PolicyRange(policy : DHCP_POLICY*, range : DHCP_IP_RANGE*) : UInt32

  # Params # policy : DHCP_POLICY* [In]
  fun DhcpHlprResetV4PolicyExpr(policy : DHCP_POLICY*) : UInt32

  # Params # policy : DHCP_POLICY* [In],operator : DHCP_POL_LOGIC_OPER [In]
  fun DhcpHlprModifyV4PolicyExpr(policy : DHCP_POLICY*, operator : DHCP_POL_LOGIC_OPER) : UInt32

  # Params # policy : DHCP_POLICY* [In]
  fun DhcpHlprFreeV4Policy(policy : DHCP_POLICY*)

  # Params # policyarray : DHCP_POLICY_ARRAY* [In]
  fun DhcpHlprFreeV4PolicyArray(policyarray : DHCP_POLICY_ARRAY*)

  # Params # policyex : DHCP_POLICY_EX* [In]
  fun DhcpHlprFreeV4PolicyEx(policyex : DHCP_POLICY_EX*)

  # Params # policyexarray : DHCP_POLICY_EX_ARRAY* [In]
  fun DhcpHlprFreeV4PolicyExArray(policyexarray : DHCP_POLICY_EX_ARRAY*)

  # Params # property : DHCP_PROPERTY* [In]
  fun DhcpHlprFreeV4DhcpProperty(property : DHCP_PROPERTY*)

  # Params # propertyarray : DHCP_PROPERTY_ARRAY* [In]
  fun DhcpHlprFreeV4DhcpPropertyArray(propertyarray : DHCP_PROPERTY_ARRAY*)

  # Params # propertyarray : DHCP_PROPERTY_ARRAY* [In],id : DHCP_PROPERTY_ID [In],type : DHCP_PROPERTY_TYPE [In]
  fun DhcpHlprFindV4DhcpProperty(propertyarray : DHCP_PROPERTY_ARRAY*, id : DHCP_PROPERTY_ID, type : DHCP_PROPERTY_TYPE) : DHCP_PROPERTY*

  # Params # policy : DHCP_POLICY* [In]
  fun DhcpHlprIsV4PolicySingleUC(policy : DHCP_POLICY*) : LibC::BOOL

  # Params # serveripaddress : LibC::LPWSTR [In],fglobalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],enabled : LibC::BOOL* [In]
  fun DhcpV4QueryPolicyEnforcement(serveripaddress : LibC::LPWSTR, fglobalpolicy : LibC::BOOL, subnetaddress : UInt32, enabled : LibC::BOOL*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fglobalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],enable : LibC::BOOL [In]
  fun DhcpV4SetPolicyEnforcement(serveripaddress : LibC::LPWSTR, fglobalpolicy : LibC::BOOL, subnetaddress : UInt32, enable : LibC::BOOL) : UInt32

  # Params # ppolicy : DHCP_POLICY* [In]
  fun DhcpHlprIsV4PolicyWellFormed(ppolicy : DHCP_POLICY*) : LibC::BOOL

  # Params # ppolicy : DHCP_POLICY* [In]
  fun DhcpHlprIsV4PolicyValid(ppolicy : DHCP_POLICY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],ppolicy : DHCP_POLICY* [In]
  fun DhcpV4CreatePolicy(serveripaddress : LibC::LPWSTR, ppolicy : DHCP_POLICY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fglobalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],policyname : LibC::LPWSTR [In],policy : DHCP_POLICY** [In]
  fun DhcpV4GetPolicy(serveripaddress : LibC::LPWSTR, fglobalpolicy : LibC::BOOL, subnetaddress : UInt32, policyname : LibC::LPWSTR, policy : DHCP_POLICY**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fieldsmodified : UInt32 [In],fglobalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],policyname : LibC::LPWSTR [In],policy : DHCP_POLICY* [In]
  fun DhcpV4SetPolicy(serveripaddress : LibC::LPWSTR, fieldsmodified : UInt32, fglobalpolicy : LibC::BOOL, subnetaddress : UInt32, policyname : LibC::LPWSTR, policy : DHCP_POLICY*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fglobalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],policyname : LibC::LPWSTR [In]
  fun DhcpV4DeletePolicy(serveripaddress : LibC::LPWSTR, fglobalpolicy : LibC::BOOL, subnetaddress : UInt32, policyname : LibC::LPWSTR) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],fglobalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],enuminfo : DHCP_POLICY_ARRAY** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpV4EnumPolicies(serveripaddress : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, fglobalpolicy : LibC::BOOL, subnetaddress : UInt32, enuminfo : DHCP_POLICY_ARRAY**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],policyname : LibC::LPWSTR [In],range : DHCP_IP_RANGE* [In]
  fun DhcpV4AddPolicyRange(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, policyname : LibC::LPWSTR, range : DHCP_IP_RANGE*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],policyname : LibC::LPWSTR [In],range : DHCP_IP_RANGE* [In]
  fun DhcpV4RemovePolicyRange(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, policyname : LibC::LPWSTR, range : DHCP_IP_RANGE*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fserverlevel : LibC::BOOL [In],subnetaddress : DHCP_IPV6_ADDRESS [In],fieldmodified : UInt32 [In],params : DHCPV6_STATELESS_PARAMS* [In]
  fun DhcpV6SetStatelessStoreParams(serveripaddress : LibC::LPWSTR, fserverlevel : LibC::BOOL, subnetaddress : DHCP_IPV6_ADDRESS, fieldmodified : UInt32, params : DHCPV6_STATELESS_PARAMS*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fserverlevel : LibC::BOOL [In],subnetaddress : DHCP_IPV6_ADDRESS [In],params : DHCPV6_STATELESS_PARAMS** [In]
  fun DhcpV6GetStatelessStoreParams(serveripaddress : LibC::LPWSTR, fserverlevel : LibC::BOOL, subnetaddress : DHCP_IPV6_ADDRESS, params : DHCPV6_STATELESS_PARAMS**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],statelessstats : DHCPV6_STATELESS_STATS** [In]
  fun DhcpV6GetStatelessStatistics(serveripaddress : LibC::LPWSTR, statelessstats : DHCPV6_STATELESS_STATS**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_PB* [In]
  fun DhcpV4CreateClientInfo(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_PB*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_INFO_PB_ARRAY** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpV4EnumSubnetClients(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_INFO_PB_ARRAY**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],searchinfo : DHCP_SEARCH_INFO* [In],clientinfo : DHCP_CLIENT_INFO_PB** [In]
  fun DhcpV4GetClientInfo(serveripaddress : LibC::LPWSTR, searchinfo : DHCP_SEARCH_INFO*, clientinfo : DHCP_CLIENT_INFO_PB**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_V6* [In]
  fun DhcpV6CreateClientInfo(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_V6*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeid : UInt32 [In],startip : UInt32 [In],endip : UInt32 [In],numfreeaddrreq : UInt32 [In],ipaddrlist : DHCP_IP_ARRAY** [In]
  fun DhcpV4GetFreeIPAddress(serveripaddress : LibC::LPWSTR, scopeid : UInt32, startip : UInt32, endip : UInt32, numfreeaddrreq : UInt32, ipaddrlist : DHCP_IP_ARRAY**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],scopeid : DHCP_IPV6_ADDRESS [In],startip : DHCP_IPV6_ADDRESS [In],endip : DHCP_IPV6_ADDRESS [In],numfreeaddrreq : UInt32 [In],ipaddrlist : DHCPV6_IP_ARRAY** [In]
  fun DhcpV6GetFreeIPAddress(serveripaddress : LibC::LPWSTR, scopeid : DHCP_IPV6_ADDRESS, startip : DHCP_IPV6_ADDRESS, endip : DHCP_IPV6_ADDRESS, numfreeaddrreq : UInt32, ipaddrlist : DHCPV6_IP_ARRAY**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],clientinfo : DHCP_CLIENT_INFO_EX* [In]
  fun DhcpV4CreateClientInfoEx(serveripaddress : LibC::LPWSTR, clientinfo : DHCP_CLIENT_INFO_EX*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],subnetaddress : UInt32 [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],clientinfo : DHCP_CLIENT_INFO_EX_ARRAY** [In],clientsread : UInt32* [In],clientstotal : UInt32* [In]
  fun DhcpV4EnumSubnetClientsEx(serveripaddress : LibC::LPWSTR, subnetaddress : UInt32, resumehandle : UInt32*, preferredmaximum : UInt32, clientinfo : DHCP_CLIENT_INFO_EX_ARRAY**, clientsread : UInt32*, clientstotal : UInt32*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],searchinfo : DHCP_SEARCH_INFO* [In],clientinfo : DHCP_CLIENT_INFO_EX** [In]
  fun DhcpV4GetClientInfoEx(serveripaddress : LibC::LPWSTR, searchinfo : DHCP_SEARCH_INFO*, clientinfo : DHCP_CLIENT_INFO_EX**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],policyex : DHCP_POLICY_EX* [In]
  fun DhcpV4CreatePolicyEx(serveripaddress : LibC::LPWSTR, policyex : DHCP_POLICY_EX*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],globalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],policyname : LibC::LPWSTR [In],policy : DHCP_POLICY_EX** [In]
  fun DhcpV4GetPolicyEx(serveripaddress : LibC::LPWSTR, globalpolicy : LibC::BOOL, subnetaddress : UInt32, policyname : LibC::LPWSTR, policy : DHCP_POLICY_EX**) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],fieldsmodified : UInt32 [In],globalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],policyname : LibC::LPWSTR [In],policy : DHCP_POLICY_EX* [In]
  fun DhcpV4SetPolicyEx(serveripaddress : LibC::LPWSTR, fieldsmodified : UInt32, globalpolicy : LibC::BOOL, subnetaddress : UInt32, policyname : LibC::LPWSTR, policy : DHCP_POLICY_EX*) : UInt32

  # Params # serveripaddress : LibC::LPWSTR [In],resumehandle : UInt32* [In],preferredmaximum : UInt32 [In],globalpolicy : LibC::BOOL [In],subnetaddress : UInt32 [In],enuminfo : DHCP_POLICY_EX_ARRAY** [In],elementsread : UInt32* [In],elementstotal : UInt32* [In]
  fun DhcpV4EnumPoliciesEx(serveripaddress : LibC::LPWSTR, resumehandle : UInt32*, preferredmaximum : UInt32, globalpolicy : LibC::BOOL, subnetaddress : UInt32, enuminfo : DHCP_POLICY_EX_ARRAY**, elementsread : UInt32*, elementstotal : UInt32*) : UInt32
end
