require "../foundation.cr"
require "../networkmanagement/ndis.cr"
require "../networking/winsock.cr"
require "../system/windowsprogramming.cr"
require "../system/io.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:iphlpapi.dll")]
{% else %}
@[Link("iphlpapi")]
{% end %}
lib LibWin32
  alias IcmpHandle = LibC::IntPtrT
  alias HIFTIMESTAMPCHANGE = LibC::IntPtrT

  NET_IF_OPER_STATUS_DOWN_NOT_AUTHENTICATED = 1_u32
  NET_IF_OPER_STATUS_DOWN_NOT_MEDIA_CONNECTED = 2_u32
  NET_IF_OPER_STATUS_DORMANT_PAUSED = 4_u32
  NET_IF_OPER_STATUS_DORMANT_LOW_POWER = 8_u32
  NET_IF_OID_IF_ALIAS = 1_u32
  NET_IF_OID_COMPARTMENT_ID = 2_u32
  NET_IF_OID_NETWORK_GUID = 3_u32
  NET_IF_OID_IF_ENTRY = 4_u32
  NET_SITEID_UNSPECIFIED = 0_u32
  NET_SITEID_MAXUSER = 134217727_u32
  NET_SITEID_MAXSYSTEM = 268435455_u32
  NET_IFLUID_UNSPECIFIED = 0_u32
  NIIF_HARDWARE_INTERFACE = 1_u32
  NIIF_FILTER_INTERFACE = 2_u32
  NIIF_NDIS_RESERVED1 = 4_u32
  NIIF_NDIS_RESERVED2 = 8_u32
  NIIF_NDIS_RESERVED3 = 16_u32
  NIIF_NDIS_WDM_INTERFACE = 32_u32
  NIIF_NDIS_ENDPOINT_INTERFACE = 64_u32
  NIIF_NDIS_ISCSI_INTERFACE = 128_u32
  NIIF_NDIS_RESERVED4 = 256_u32
  IF_MAX_STRING_SIZE = 256_u32
  IF_MAX_PHYS_ADDRESS_LENGTH = 32_u32
  ANY_SIZE = 1_u32
  MAXLEN_PHYSADDR = 8_u32
  MAXLEN_IFDESCR = 256_u32
  MAX_INTERFACE_NAME_LEN = 256_u32
  MIN_IF_TYPE = 1_u32
  IF_TYPE_OTHER = 1_u32
  IF_TYPE_REGULAR_1822 = 2_u32
  IF_TYPE_HDH_1822 = 3_u32
  IF_TYPE_DDN_X25 = 4_u32
  IF_TYPE_RFC877_X25 = 5_u32
  IF_TYPE_ETHERNET_CSMACD = 6_u32
  IF_TYPE_IS088023_CSMACD = 7_u32
  IF_TYPE_ISO88024_TOKENBUS = 8_u32
  IF_TYPE_ISO88025_TOKENRING = 9_u32
  IF_TYPE_ISO88026_MAN = 10_u32
  IF_TYPE_STARLAN = 11_u32
  IF_TYPE_PROTEON_10MBIT = 12_u32
  IF_TYPE_PROTEON_80MBIT = 13_u32
  IF_TYPE_HYPERCHANNEL = 14_u32
  IF_TYPE_FDDI = 15_u32
  IF_TYPE_LAP_B = 16_u32
  IF_TYPE_SDLC = 17_u32
  IF_TYPE_DS1 = 18_u32
  IF_TYPE_E1 = 19_u32
  IF_TYPE_BASIC_ISDN = 20_u32
  IF_TYPE_PRIMARY_ISDN = 21_u32
  IF_TYPE_PROP_POINT2POINT_SERIAL = 22_u32
  IF_TYPE_PPP = 23_u32
  IF_TYPE_SOFTWARE_LOOPBACK = 24_u32
  IF_TYPE_EON = 25_u32
  IF_TYPE_ETHERNET_3MBIT = 26_u32
  IF_TYPE_NSIP = 27_u32
  IF_TYPE_SLIP = 28_u32
  IF_TYPE_ULTRA = 29_u32
  IF_TYPE_DS3 = 30_u32
  IF_TYPE_SIP = 31_u32
  IF_TYPE_FRAMERELAY = 32_u32
  IF_TYPE_RS232 = 33_u32
  IF_TYPE_PARA = 34_u32
  IF_TYPE_ARCNET = 35_u32
  IF_TYPE_ARCNET_PLUS = 36_u32
  IF_TYPE_ATM = 37_u32
  IF_TYPE_MIO_X25 = 38_u32
  IF_TYPE_SONET = 39_u32
  IF_TYPE_X25_PLE = 40_u32
  IF_TYPE_ISO88022_LLC = 41_u32
  IF_TYPE_LOCALTALK = 42_u32
  IF_TYPE_SMDS_DXI = 43_u32
  IF_TYPE_FRAMERELAY_SERVICE = 44_u32
  IF_TYPE_V35 = 45_u32
  IF_TYPE_HSSI = 46_u32
  IF_TYPE_HIPPI = 47_u32
  IF_TYPE_MODEM = 48_u32
  IF_TYPE_AAL5 = 49_u32
  IF_TYPE_SONET_PATH = 50_u32
  IF_TYPE_SONET_VT = 51_u32
  IF_TYPE_SMDS_ICIP = 52_u32
  IF_TYPE_PROP_VIRTUAL = 53_u32
  IF_TYPE_PROP_MULTIPLEXOR = 54_u32
  IF_TYPE_IEEE80212 = 55_u32
  IF_TYPE_FIBRECHANNEL = 56_u32
  IF_TYPE_HIPPIINTERFACE = 57_u32
  IF_TYPE_FRAMERELAY_INTERCONNECT = 58_u32
  IF_TYPE_AFLANE_8023 = 59_u32
  IF_TYPE_AFLANE_8025 = 60_u32
  IF_TYPE_CCTEMUL = 61_u32
  IF_TYPE_FASTETHER = 62_u32
  IF_TYPE_ISDN = 63_u32
  IF_TYPE_V11 = 64_u32
  IF_TYPE_V36 = 65_u32
  IF_TYPE_G703_64K = 66_u32
  IF_TYPE_G703_2MB = 67_u32
  IF_TYPE_QLLC = 68_u32
  IF_TYPE_FASTETHER_FX = 69_u32
  IF_TYPE_CHANNEL = 70_u32
  IF_TYPE_IEEE80211 = 71_u32
  IF_TYPE_IBM370PARCHAN = 72_u32
  IF_TYPE_ESCON = 73_u32
  IF_TYPE_DLSW = 74_u32
  IF_TYPE_ISDN_S = 75_u32
  IF_TYPE_ISDN_U = 76_u32
  IF_TYPE_LAP_D = 77_u32
  IF_TYPE_IPSWITCH = 78_u32
  IF_TYPE_RSRB = 79_u32
  IF_TYPE_ATM_LOGICAL = 80_u32
  IF_TYPE_DS0 = 81_u32
  IF_TYPE_DS0_BUNDLE = 82_u32
  IF_TYPE_BSC = 83_u32
  IF_TYPE_ASYNC = 84_u32
  IF_TYPE_CNR = 85_u32
  IF_TYPE_ISO88025R_DTR = 86_u32
  IF_TYPE_EPLRS = 87_u32
  IF_TYPE_ARAP = 88_u32
  IF_TYPE_PROP_CNLS = 89_u32
  IF_TYPE_HOSTPAD = 90_u32
  IF_TYPE_TERMPAD = 91_u32
  IF_TYPE_FRAMERELAY_MPI = 92_u32
  IF_TYPE_X213 = 93_u32
  IF_TYPE_ADSL = 94_u32
  IF_TYPE_RADSL = 95_u32
  IF_TYPE_SDSL = 96_u32
  IF_TYPE_VDSL = 97_u32
  IF_TYPE_ISO88025_CRFPRINT = 98_u32
  IF_TYPE_MYRINET = 99_u32
  IF_TYPE_VOICE_EM = 100_u32
  IF_TYPE_VOICE_FXO = 101_u32
  IF_TYPE_VOICE_FXS = 102_u32
  IF_TYPE_VOICE_ENCAP = 103_u32
  IF_TYPE_VOICE_OVERIP = 104_u32
  IF_TYPE_ATM_DXI = 105_u32
  IF_TYPE_ATM_FUNI = 106_u32
  IF_TYPE_ATM_IMA = 107_u32
  IF_TYPE_PPPMULTILINKBUNDLE = 108_u32
  IF_TYPE_IPOVER_CDLC = 109_u32
  IF_TYPE_IPOVER_CLAW = 110_u32
  IF_TYPE_STACKTOSTACK = 111_u32
  IF_TYPE_VIRTUALIPADDRESS = 112_u32
  IF_TYPE_MPC = 113_u32
  IF_TYPE_IPOVER_ATM = 114_u32
  IF_TYPE_ISO88025_FIBER = 115_u32
  IF_TYPE_TDLC = 116_u32
  IF_TYPE_GIGABITETHERNET = 117_u32
  IF_TYPE_HDLC = 118_u32
  IF_TYPE_LAP_F = 119_u32
  IF_TYPE_V37 = 120_u32
  IF_TYPE_X25_MLP = 121_u32
  IF_TYPE_X25_HUNTGROUP = 122_u32
  IF_TYPE_TRANSPHDLC = 123_u32
  IF_TYPE_INTERLEAVE = 124_u32
  IF_TYPE_FAST = 125_u32
  IF_TYPE_IP = 126_u32
  IF_TYPE_DOCSCABLE_MACLAYER = 127_u32
  IF_TYPE_DOCSCABLE_DOWNSTREAM = 128_u32
  IF_TYPE_DOCSCABLE_UPSTREAM = 129_u32
  IF_TYPE_A12MPPSWITCH = 130_u32
  IF_TYPE_TUNNEL = 131_u32
  IF_TYPE_COFFEE = 132_u32
  IF_TYPE_CES = 133_u32
  IF_TYPE_ATM_SUBINTERFACE = 134_u32
  IF_TYPE_L2_VLAN = 135_u32
  IF_TYPE_L3_IPVLAN = 136_u32
  IF_TYPE_L3_IPXVLAN = 137_u32
  IF_TYPE_DIGITALPOWERLINE = 138_u32
  IF_TYPE_MEDIAMAILOVERIP = 139_u32
  IF_TYPE_DTM = 140_u32
  IF_TYPE_DCN = 141_u32
  IF_TYPE_IPFORWARD = 142_u32
  IF_TYPE_MSDSL = 143_u32
  IF_TYPE_IEEE1394 = 144_u32
  IF_TYPE_IF_GSN = 145_u32
  IF_TYPE_DVBRCC_MACLAYER = 146_u32
  IF_TYPE_DVBRCC_DOWNSTREAM = 147_u32
  IF_TYPE_DVBRCC_UPSTREAM = 148_u32
  IF_TYPE_ATM_VIRTUAL = 149_u32
  IF_TYPE_MPLS_TUNNEL = 150_u32
  IF_TYPE_SRP = 151_u32
  IF_TYPE_VOICEOVERATM = 152_u32
  IF_TYPE_VOICEOVERFRAMERELAY = 153_u32
  IF_TYPE_IDSL = 154_u32
  IF_TYPE_COMPOSITELINK = 155_u32
  IF_TYPE_SS7_SIGLINK = 156_u32
  IF_TYPE_PROP_WIRELESS_P2P = 157_u32
  IF_TYPE_FR_FORWARD = 158_u32
  IF_TYPE_RFC1483 = 159_u32
  IF_TYPE_USB = 160_u32
  IF_TYPE_IEEE8023AD_LAG = 161_u32
  IF_TYPE_BGP_POLICY_ACCOUNTING = 162_u32
  IF_TYPE_FRF16_MFR_BUNDLE = 163_u32
  IF_TYPE_H323_GATEKEEPER = 164_u32
  IF_TYPE_H323_PROXY = 165_u32
  IF_TYPE_MPLS = 166_u32
  IF_TYPE_MF_SIGLINK = 167_u32
  IF_TYPE_HDSL2 = 168_u32
  IF_TYPE_SHDSL = 169_u32
  IF_TYPE_DS1_FDL = 170_u32
  IF_TYPE_POS = 171_u32
  IF_TYPE_DVB_ASI_IN = 172_u32
  IF_TYPE_DVB_ASI_OUT = 173_u32
  IF_TYPE_PLC = 174_u32
  IF_TYPE_NFAS = 175_u32
  IF_TYPE_TR008 = 176_u32
  IF_TYPE_GR303_RDT = 177_u32
  IF_TYPE_GR303_IDT = 178_u32
  IF_TYPE_ISUP = 179_u32
  IF_TYPE_PROP_DOCS_WIRELESS_MACLAYER = 180_u32
  IF_TYPE_PROP_DOCS_WIRELESS_DOWNSTREAM = 181_u32
  IF_TYPE_PROP_DOCS_WIRELESS_UPSTREAM = 182_u32
  IF_TYPE_HIPERLAN2 = 183_u32
  IF_TYPE_PROP_BWA_P2MP = 184_u32
  IF_TYPE_SONET_OVERHEAD_CHANNEL = 185_u32
  IF_TYPE_DIGITAL_WRAPPER_OVERHEAD_CHANNEL = 186_u32
  IF_TYPE_AAL2 = 187_u32
  IF_TYPE_RADIO_MAC = 188_u32
  IF_TYPE_ATM_RADIO = 189_u32
  IF_TYPE_IMT = 190_u32
  IF_TYPE_MVL = 191_u32
  IF_TYPE_REACH_DSL = 192_u32
  IF_TYPE_FR_DLCI_ENDPT = 193_u32
  IF_TYPE_ATM_VCI_ENDPT = 194_u32
  IF_TYPE_OPTICAL_CHANNEL = 195_u32
  IF_TYPE_OPTICAL_TRANSPORT = 196_u32
  IF_TYPE_IEEE80216_WMAN = 237_u32
  IF_TYPE_WWANPP = 243_u32
  IF_TYPE_WWANPP2 = 244_u32
  IF_TYPE_IEEE802154 = 259_u32
  IF_TYPE_XBOX_WIRELESS = 281_u32
  MAX_IF_TYPE = 281_u32
  IF_CHECK_NONE = 0_u32
  IF_CHECK_MCAST = 1_u32
  IF_CHECK_SEND = 2_u32
  IF_CONNECTION_DEDICATED = 1_u32
  IF_CONNECTION_PASSIVE = 2_u32
  IF_CONNECTION_DEMAND = 3_u32
  IF_ADMIN_STATUS_UP = 1_u32
  IF_ADMIN_STATUS_DOWN = 2_u32
  IF_ADMIN_STATUS_TESTING = 3_u32
  MIB_IF_TYPE_OTHER = 1_u32
  MIB_IF_TYPE_ETHERNET = 6_u32
  MIB_IF_TYPE_TOKENRING = 9_u32
  MIB_IF_TYPE_FDDI = 15_u32
  MIB_IF_TYPE_PPP = 23_u32
  MIB_IF_TYPE_LOOPBACK = 24_u32
  MIB_IF_TYPE_SLIP = 28_u32
  MIB_IF_ADMIN_STATUS_UP = 1_u32
  MIB_IF_ADMIN_STATUS_DOWN = 2_u32
  MIB_IF_ADMIN_STATUS_TESTING = 3_u32
  MIB_IPADDR_PRIMARY = 1_u32
  MIB_IPADDR_DYNAMIC = 4_u32
  MIB_IPADDR_DISCONNECTED = 8_u32
  MIB_IPADDR_DELETED = 64_u32
  MIB_IPADDR_TRANSIENT = 128_u32
  MIB_IPADDR_DNS_ELIGIBLE = 256_u32
  MIB_IPROUTE_METRIC_UNUSED = 4294967295_u32
  MIB_USE_CURRENT_TTL = 4294967295_u32
  MIB_USE_CURRENT_FORWARDING = 4294967295_u32
  ICMP6_INFOMSG_MASK = 128_u32
  IPRTRMGR_PID = 10000_u32
  IF_NUMBER = 0_u32
  IF_TABLE = 1_u32
  IF_ROW = 2_u32
  IP_STATS = 3_u32
  IP_ADDRTABLE = 4_u32
  IP_ADDRROW = 5_u32
  IP_FORWARDNUMBER = 6_u32
  IP_FORWARDTABLE = 7_u32
  IP_FORWARDROW = 8_u32
  IP_NETTABLE = 9_u32
  IP_NETROW = 10_u32
  ICMP_STATS = 11_u32
  TCP_STATS = 12_u32
  TCP_TABLE = 13_u32
  TCP_ROW = 14_u32
  UDP_STATS = 15_u32
  UDP_TABLE = 16_u32
  UDP_ROW = 17_u32
  MCAST_MFE = 18_u32
  MCAST_MFE_STATS = 19_u32
  BEST_IF = 20_u32
  BEST_ROUTE = 21_u32
  PROXY_ARP = 22_u32
  MCAST_IF_ENTRY = 23_u32
  MCAST_GLOBAL = 24_u32
  IF_STATUS = 25_u32
  MCAST_BOUNDARY = 26_u32
  MCAST_SCOPE = 27_u32
  DEST_MATCHING = 28_u32
  DEST_LONGER = 29_u32
  DEST_SHORTER = 30_u32
  ROUTE_MATCHING = 31_u32
  ROUTE_LONGER = 32_u32
  ROUTE_SHORTER = 33_u32
  ROUTE_STATE = 34_u32
  MCAST_MFE_STATS_EX = 35_u32
  IP6_STATS = 36_u32
  UDP6_STATS = 37_u32
  TCP6_STATS = 38_u32
  NUMBER_OF_EXPORTED_VARIABLES = 39_u32
  MAX_SCOPE_NAME_LEN = 255_u32
  MAX_MIB_OFFSET = 8_u32
  MIB_INVALID_TEREDO_PORT_NUMBER = 0_u32
  DNS_SETTINGS_VERSION1 = 1_u32
  DNS_SETTINGS_VERSION2 = 2_u32
  DNS_INTERFACE_SETTINGS_VERSION1 = 1_u32
  DNS_INTERFACE_SETTINGS_VERSION2 = 2_u32
  DNS_INTERFACE_SETTINGS_VERSION3 = 3_u32
  DNS_SETTING_IPV6 = 1_u32
  DNS_SETTING_NAMESERVER = 2_u32
  DNS_SETTING_SEARCHLIST = 4_u32
  DNS_SETTING_REGISTRATION_ENABLED = 8_u32
  DNS_SETTING_REGISTER_ADAPTER_NAME = 16_u32
  DNS_SETTING_DOMAIN = 32_u32
  DNS_SETTING_HOSTNAME = 64_u32
  DNS_SETTINGS_ENABLE_LLMNR = 128_u32
  DNS_SETTINGS_QUERY_ADAPTER_NAME = 256_u32
  DNS_SETTING_PROFILE_NAMESERVER = 512_u32
  DNS_SETTING_DISABLE_UNCONSTRAINED_QUERIES = 1024_u32
  DNS_SETTING_SUPPLEMENTAL_SEARCH_LIST = 2048_u32
  DNS_SETTING_DOH = 4096_u32
  DNS_SETTING_DOH_PROFILE = 8192_u32
  DNS_ENABLE_DOH = 1_u32
  DNS_DOH_POLICY_NOT_CONFIGURED = 4_u32
  DNS_DOH_POLICY_DISABLE = 8_u32
  DNS_DOH_POLICY_AUTO = 16_u32
  DNS_DOH_POLICY_REQUIRED = 32_u32
  DNS_SERVER_PROPERTY_VERSION1 = 1_u32
  DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO = 1_u32
  DNS_DOH_SERVER_SETTINGS_ENABLE = 2_u32
  DNS_DOH_SERVER_SETTINGS_FALLBACK_TO_UDP = 4_u32
  DNS_DOH_AUTO_UPGRADE_SERVER = 8_u32
  TCPIP_OWNING_MODULE_SIZE = 16_u32
  FD_FLAGS_NOSYN = 1_u32
  FD_FLAGS_ALLFLAGS = 1_u32
  LB_SRC_ADDR_USE_SRCADDR_FLAG = 1_u32
  LB_SRC_ADDR_USE_DSTADDR_FLAG = 2_u32
  LB_DST_ADDR_USE_SRCADDR_FLAG = 4_u32
  LB_DST_ADDR_USE_DSTADDR_FLAG = 8_u32
  LB_SRC_MASK_LATE_FLAG = 16_u32
  LB_DST_MASK_LATE_FLAG = 32_u32
  ERROR_BASE = 23000_u32
  PFERROR_NO_PF_INTERFACE = 23000_u32
  PFERROR_NO_FILTERS_GIVEN = 23001_u32
  PFERROR_BUFFER_TOO_SMALL = 23002_u32
  ERROR_IPV6_NOT_IMPLEMENTED = 23003_u32
  IP_EXPORT_INCLUDED = 1_u32
  MAX_ADAPTER_NAME = 128_u32
  IP_STATUS_BASE = 11000_u32
  IP_SUCCESS = 0_u32
  IP_BUF_TOO_SMALL = 11001_u32
  IP_DEST_NET_UNREACHABLE = 11002_u32
  IP_DEST_HOST_UNREACHABLE = 11003_u32
  IP_DEST_PROT_UNREACHABLE = 11004_u32
  IP_DEST_PORT_UNREACHABLE = 11005_u32
  IP_NO_RESOURCES = 11006_u32
  IP_BAD_OPTION = 11007_u32
  IP_HW_ERROR = 11008_u32
  IP_PACKET_TOO_BIG = 11009_u32
  IP_REQ_TIMED_OUT = 11010_u32
  IP_BAD_REQ = 11011_u32
  IP_BAD_ROUTE = 11012_u32
  IP_TTL_EXPIRED_TRANSIT = 11013_u32
  IP_TTL_EXPIRED_REASSEM = 11014_u32
  IP_PARAM_PROBLEM = 11015_u32
  IP_SOURCE_QUENCH = 11016_u32
  IP_OPTION_TOO_BIG = 11017_u32
  IP_BAD_DESTINATION = 11018_u32
  IP_DEST_NO_ROUTE = 11002_u32
  IP_DEST_ADDR_UNREACHABLE = 11003_u32
  IP_DEST_PROHIBITED = 11004_u32
  IP_HOP_LIMIT_EXCEEDED = 11013_u32
  IP_REASSEMBLY_TIME_EXCEEDED = 11014_u32
  IP_PARAMETER_PROBLEM = 11015_u32
  IP_DEST_UNREACHABLE = 11040_u32
  IP_TIME_EXCEEDED = 11041_u32
  IP_BAD_HEADER = 11042_u32
  IP_UNRECOGNIZED_NEXT_HEADER = 11043_u32
  IP_ICMP_ERROR = 11044_u32
  IP_DEST_SCOPE_MISMATCH = 11045_u32
  IP_ADDR_DELETED = 11019_u32
  IP_SPEC_MTU_CHANGE = 11020_u32
  IP_MTU_CHANGE = 11021_u32
  IP_UNLOAD = 11022_u32
  IP_ADDR_ADDED = 11023_u32
  IP_MEDIA_CONNECT = 11024_u32
  IP_MEDIA_DISCONNECT = 11025_u32
  IP_BIND_ADAPTER = 11026_u32
  IP_UNBIND_ADAPTER = 11027_u32
  IP_DEVICE_DOES_NOT_EXIST = 11028_u32
  IP_DUPLICATE_ADDRESS = 11029_u32
  IP_INTERFACE_METRIC_CHANGE = 11030_u32
  IP_RECONFIG_SECFLTR = 11031_u32
  IP_NEGOTIATING_IPSEC = 11032_u32
  IP_INTERFACE_WOL_CAPABILITY_CHANGE = 11033_u32
  IP_DUPLICATE_IPADD = 11034_u32
  IP_GENERAL_FAILURE = 11050_u32
  MAX_IP_STATUS = 11050_u32
  IP_PENDING = 11255_u32
  IP_FLAG_REVERSE = 1_u32
  IP_FLAG_DF = 2_u32
  MAX_OPT_SIZE = 40_u32
  IOCTL_IP_RTCHANGE_NOTIFY_REQUEST = 101_u32
  IOCTL_IP_ADDCHANGE_NOTIFY_REQUEST = 102_u32
  IOCTL_ARP_SEND_REQUEST = 103_u32
  IOCTL_IP_INTERFACE_INFO = 104_u32
  IOCTL_IP_GET_BEST_INTERFACE = 105_u32
  IOCTL_IP_UNIDIRECTIONAL_ADAPTER_ADDRESS = 106_u32
  NET_STRING_IPV4_ADDRESS = 1_u32
  NET_STRING_IPV4_SERVICE = 2_u32
  NET_STRING_IPV4_NETWORK = 4_u32
  NET_STRING_IPV6_ADDRESS = 8_u32
  NET_STRING_IPV6_ADDRESS_NO_SCOPE = 16_u32
  NET_STRING_IPV6_SERVICE = 32_u32
  NET_STRING_IPV6_SERVICE_NO_SCOPE = 64_u32
  NET_STRING_IPV6_NETWORK = 128_u32
  NET_STRING_NAMED_ADDRESS = 256_u32
  NET_STRING_NAMED_SERVICE = 512_u32
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128_u32
  MAX_ADAPTER_NAME_LENGTH = 256_u32
  MAX_ADAPTER_ADDRESS_LENGTH = 8_u32
  DEFAULT_MINIMUM_ENTITIES = 32_u32
  MAX_HOSTNAME_LEN = 128_u32
  MAX_DOMAIN_NAME_LEN = 128_u32
  MAX_SCOPE_ID_LEN = 256_u32
  MAX_DHCPV6_DUID_LENGTH = 130_u32
  MAX_DNS_SUFFIX_STRING_LENGTH = 256_u32
  BROADCAST_NODETYPE = 1_u32
  PEER_TO_PEER_NODETYPE = 2_u32
  MIXED_NODETYPE = 4_u32
  HYBRID_NODETYPE = 8_u32
  IP_ADAPTER_ADDRESS_DNS_ELIGIBLE = 1_u32
  IP_ADAPTER_ADDRESS_TRANSIENT = 2_u32
  IP_ADAPTER_DDNS_ENABLED = 1_u32
  IP_ADAPTER_REGISTER_ADAPTER_SUFFIX = 2_u32
  IP_ADAPTER_DHCP_ENABLED = 4_u32
  IP_ADAPTER_RECEIVE_ONLY = 8_u32
  IP_ADAPTER_NO_MULTICAST = 16_u32
  IP_ADAPTER_IPV6_OTHER_STATEFUL_CONFIG = 32_u32
  IP_ADAPTER_NETBIOS_OVER_TCPIP_ENABLED = 64_u32
  IP_ADAPTER_IPV4_ENABLED = 128_u32
  IP_ADAPTER_IPV6_ENABLED = 256_u32
  IP_ADAPTER_IPV6_MANAGE_ADDRESS_CONFIG = 512_u32
  GAA_FLAG_SKIP_DNS_INFO = 2048_u32
  IP_ROUTER_MANAGER_VERSION = 1_u32
  IP_GENERAL_INFO_BASE = 4294901760_u32
  IP_IN_FILTER_INFO = 4294901761_u32
  IP_OUT_FILTER_INFO = 4294901762_u32
  IP_GLOBAL_INFO = 4294901763_u32
  IP_INTERFACE_STATUS_INFO = 4294901764_u32
  IP_ROUTE_INFO = 4294901765_u32
  IP_PROT_PRIORITY_INFO = 4294901766_u32
  IP_ROUTER_DISC_INFO = 4294901767_u32
  IP_DEMAND_DIAL_FILTER_INFO = 4294901769_u32
  IP_MCAST_HEARBEAT_INFO = 4294901770_u32
  IP_MCAST_BOUNDARY_INFO = 4294901771_u32
  IP_IPINIP_CFG_INFO = 4294901772_u32
  IP_IFFILTER_INFO = 4294901773_u32
  IP_MCAST_LIMIT_INFO = 4294901774_u32
  IPV6_GLOBAL_INFO = 4294901775_u32
  IPV6_ROUTE_INFO = 4294901776_u32
  IP_IN_FILTER_INFO_V6 = 4294901777_u32
  IP_OUT_FILTER_INFO_V6 = 4294901778_u32
  IP_DEMAND_DIAL_FILTER_INFO_V6 = 4294901779_u32
  IP_IFFILTER_INFO_V6 = 4294901780_u32
  IP_FILTER_ENABLE_INFO = 4294901781_u32
  IP_FILTER_ENABLE_INFO_V6 = 4294901782_u32
  IP_PROT_PRIORITY_INFO_EX = 4294901783_u32

  alias PIPINTERFACE_CHANGE_CALLBACK = Proc(Void*, MIB_IPINTERFACE_ROW*, MIB_NOTIFICATION_TYPE, Void)
  alias PUNICAST_IPADDRESS_CHANGE_CALLBACK = Proc(Void*, MIB_UNICASTIPADDRESS_ROW*, MIB_NOTIFICATION_TYPE, Void)
  alias PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK = Proc(Void*, MIB_UNICASTIPADDRESS_TABLE*, Void)
  alias PIPFORWARD_CHANGE_CALLBACK = Proc(Void*, MIB_IPFORWARD_ROW2*, MIB_NOTIFICATION_TYPE, Void)
  alias PTEREDO_PORT_CHANGE_CALLBACK = Proc(Void*, UInt16, MIB_NOTIFICATION_TYPE, Void)
  alias PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK = Proc(Void*, NL_NETWORK_CONNECTIVITY_HINT, Void)
  alias PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK = Proc(Void*, Void)


  enum ADDRESS_FAMILY : UInt32
    AF_INET = 2
    AF_INET6 = 23
    AF_UNSPEC = 0
  end

  enum GET_ADAPTERS_ADDRESSES_FLAGS : UInt32
    GAA_FLAG_SKIP_UNICAST = 1
    GAA_FLAG_SKIP_ANYCAST = 2
    GAA_FLAG_SKIP_MULTICAST = 4
    GAA_FLAG_SKIP_DNS_SERVER = 8
    GAA_FLAG_INCLUDE_PREFIX = 16
    GAA_FLAG_SKIP_FRIENDLY_NAME = 32
    GAA_FLAG_INCLUDE_WINS_INFO = 64
    GAA_FLAG_INCLUDE_GATEWAYS = 128
    GAA_FLAG_INCLUDE_ALL_INTERFACES = 256
    GAA_FLAG_INCLUDE_ALL_COMPARTMENTS = 512
    GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER = 1024
  end

  enum IF_ACCESS_TYPE : Int32
    IF_ACCESS_LOOPBACK = 1
    IF_ACCESS_BROADCAST = 2
    IF_ACCESS_POINT_TO_POINT = 3
    IF_ACCESS_POINTTOPOINT = 3
    IF_ACCESS_POINT_TO_MULTI_POINT = 4
    IF_ACCESS_POINTTOMULTIPOINT = 4
  end

  enum INTERNAL_IF_OPER_STATUS : Int32
    IF_OPER_STATUS_NON_OPERATIONAL = 0
    IF_OPER_STATUS_UNREACHABLE = 1
    IF_OPER_STATUS_DISCONNECTED = 2
    IF_OPER_STATUS_CONNECTING = 3
    IF_OPER_STATUS_CONNECTED = 4
    IF_OPER_STATUS_OPERATIONAL = 5
  end

  enum NET_IF_OPER_STATUS : Int32
    NET_IF_OPER_STATUS_UP = 1
    NET_IF_OPER_STATUS_DOWN = 2
    NET_IF_OPER_STATUS_TESTING = 3
    NET_IF_OPER_STATUS_UNKNOWN = 4
    NET_IF_OPER_STATUS_DORMANT = 5
    NET_IF_OPER_STATUS_NOT_PRESENT = 6
    NET_IF_OPER_STATUS_LOWER_LAYER_DOWN = 7
  end

  enum NET_IF_ADMIN_STATUS : Int32
    NET_IF_ADMIN_STATUS_UP = 1
    NET_IF_ADMIN_STATUS_DOWN = 2
    NET_IF_ADMIN_STATUS_TESTING = 3
  end

  enum NET_IF_RCV_ADDRESS_TYPE : Int32
    NET_IF_RCV_ADDRESS_TYPE_OTHER = 1
    NET_IF_RCV_ADDRESS_TYPE_VOLATILE = 2
    NET_IF_RCV_ADDRESS_TYPE_NON_VOLATILE = 3
  end

  enum NET_IF_CONNECTION_TYPE : Int32
    NET_IF_CONNECTION_DEDICATED = 1
    NET_IF_CONNECTION_PASSIVE = 2
    NET_IF_CONNECTION_DEMAND = 3
    NET_IF_CONNECTION_MAXIMUM = 4
  end

  enum TUNNEL_TYPE : Int32
    TUNNEL_TYPE_NONE = 0
    TUNNEL_TYPE_OTHER = 1
    TUNNEL_TYPE_DIRECT = 2
    TUNNEL_TYPE_6TO4 = 11
    TUNNEL_TYPE_ISATAP = 13
    TUNNEL_TYPE_TEREDO = 14
    TUNNEL_TYPE_IPHTTPS = 15
  end

  enum NET_IF_ACCESS_TYPE : Int32
    NET_IF_ACCESS_LOOPBACK = 1
    NET_IF_ACCESS_BROADCAST = 2
    NET_IF_ACCESS_POINT_TO_POINT = 3
    NET_IF_ACCESS_POINT_TO_MULTI_POINT = 4
    NET_IF_ACCESS_MAXIMUM = 5
  end

  enum NET_IF_DIRECTION_TYPE : Int32
    NET_IF_DIRECTION_SENDRECEIVE = 0
    NET_IF_DIRECTION_SENDONLY = 1
    NET_IF_DIRECTION_RECEIVEONLY = 2
    NET_IF_DIRECTION_MAXIMUM = 3
  end

  enum NET_IF_MEDIA_CONNECT_STATE : Int32
    MediaConnectStateUnknown = 0
    MediaConnectStateConnected = 1
    MediaConnectStateDisconnected = 2
  end

  enum NET_IF_MEDIA_DUPLEX_STATE : Int32
    MediaDuplexStateUnknown = 0
    MediaDuplexStateHalf = 1
    MediaDuplexStateFull = 2
  end

  enum IF_ADMINISTRATIVE_STATE : Int32
    IF_ADMINISTRATIVE_DISABLED = 0
    IF_ADMINISTRATIVE_ENABLED = 1
    IF_ADMINISTRATIVE_DEMANDDIAL = 2
  end

  enum IF_OPER_STATUS : Int32
    IfOperStatusUp = 1
    IfOperStatusDown = 2
    IfOperStatusTesting = 3
    IfOperStatusUnknown = 4
    IfOperStatusDormant = 5
    IfOperStatusNotPresent = 6
    IfOperStatusLowerLayerDown = 7
  end

  enum MIB_NOTIFICATION_TYPE : Int32
    MibParameterNotification = 0
    MibAddInstance = 1
    MibDeleteInstance = 2
    MibInitialNotification = 3
  end

  enum MIB_IF_ENTRY_LEVEL : Int32
    MibIfEntryNormal = 0
    MibIfEntryNormalWithoutStatistics = 2
  end

  enum MIB_IF_TABLE_LEVEL : Int32
    MibIfTableNormal = 0
    MibIfTableRaw = 1
    MibIfTableNormalWithoutStatistics = 2
  end

  enum DNS_SERVER_PROPERTY_TYPE : Int32
    DnsServerInvalidProperty = 0
    DnsServerDohProperty = 1
  end

  enum MIB_IPFORWARD_TYPE : Int32
    MIB_IPROUTE_TYPE_OTHER = 1
    MIB_IPROUTE_TYPE_INVALID = 2
    MIB_IPROUTE_TYPE_DIRECT = 3
    MIB_IPROUTE_TYPE_INDIRECT = 4
  end

  enum MIB_IPNET_TYPE : Int32
    MIB_IPNET_TYPE_OTHER = 1
    MIB_IPNET_TYPE_INVALID = 2
    MIB_IPNET_TYPE_DYNAMIC = 3
    MIB_IPNET_TYPE_STATIC = 4
  end

  enum MIB_IPSTATS_FORWARDING : Int32
    MIB_IP_FORWARDING = 1
    MIB_IP_NOT_FORWARDING = 2
  end

  enum ICMP6_TYPE : Int32
    ICMP6_DST_UNREACH = 1
    ICMP6_PACKET_TOO_BIG = 2
    ICMP6_TIME_EXCEEDED = 3
    ICMP6_PARAM_PROB = 4
    ICMP6_ECHO_REQUEST = 128
    ICMP6_ECHO_REPLY = 129
    ICMP6_MEMBERSHIP_QUERY = 130
    ICMP6_MEMBERSHIP_REPORT = 131
    ICMP6_MEMBERSHIP_REDUCTION = 132
    ND_ROUTER_SOLICIT = 133
    ND_ROUTER_ADVERT = 134
    ND_NEIGHBOR_SOLICIT = 135
    ND_NEIGHBOR_ADVERT = 136
    ND_REDIRECT = 137
    ICMP6_V2_MEMBERSHIP_REPORT = 143
  end

  enum ICMP4_TYPE : Int32
    ICMP4_ECHO_REPLY = 0
    ICMP4_DST_UNREACH = 3
    ICMP4_SOURCE_QUENCH = 4
    ICMP4_REDIRECT = 5
    ICMP4_ECHO_REQUEST = 8
    ICMP4_ROUTER_ADVERT = 9
    ICMP4_ROUTER_SOLICIT = 10
    ICMP4_TIME_EXCEEDED = 11
    ICMP4_PARAM_PROB = 12
    ICMP4_TIMESTAMP_REQUEST = 13
    ICMP4_TIMESTAMP_REPLY = 14
    ICMP4_MASK_REQUEST = 17
    ICMP4_MASK_REPLY = 18
  end

  enum MIB_TCP_STATE : Int32
    MIB_TCP_STATE_CLOSED = 1
    MIB_TCP_STATE_LISTEN = 2
    MIB_TCP_STATE_SYN_SENT = 3
    MIB_TCP_STATE_SYN_RCVD = 4
    MIB_TCP_STATE_ESTAB = 5
    MIB_TCP_STATE_FIN_WAIT1 = 6
    MIB_TCP_STATE_FIN_WAIT2 = 7
    MIB_TCP_STATE_CLOSE_WAIT = 8
    MIB_TCP_STATE_CLOSING = 9
    MIB_TCP_STATE_LAST_ACK = 10
    MIB_TCP_STATE_TIME_WAIT = 11
    MIB_TCP_STATE_DELETE_TCB = 12
    MIB_TCP_STATE_RESERVED = 100
  end

  enum TCP_CONNECTION_OFFLOAD_STATE : Int32
    TcpConnectionOffloadStateInHost = 0
    TcpConnectionOffloadStateOffloading = 1
    TcpConnectionOffloadStateOffloaded = 2
    TcpConnectionOffloadStateUploading = 3
    TcpConnectionOffloadStateMax = 4
  end

  enum TCP_RTO_ALGORITHM : Int32
    TcpRtoAlgorithmOther = 1
    TcpRtoAlgorithmConstant = 2
    TcpRtoAlgorithmRsre = 3
    TcpRtoAlgorithmVanj = 4
    MIB_TCP_RTO_OTHER = 1
    MIB_TCP_RTO_CONSTANT = 2
    MIB_TCP_RTO_RSRE = 3
    MIB_TCP_RTO_VANJ = 4
  end

  enum TCP_TABLE_CLASS : Int32
    TCP_TABLE_BASIC_LISTENER = 0
    TCP_TABLE_BASIC_CONNECTIONS = 1
    TCP_TABLE_BASIC_ALL = 2
    TCP_TABLE_OWNER_PID_LISTENER = 3
    TCP_TABLE_OWNER_PID_CONNECTIONS = 4
    TCP_TABLE_OWNER_PID_ALL = 5
    TCP_TABLE_OWNER_MODULE_LISTENER = 6
    TCP_TABLE_OWNER_MODULE_CONNECTIONS = 7
    TCP_TABLE_OWNER_MODULE_ALL = 8
  end

  enum UDP_TABLE_CLASS : Int32
    UDP_TABLE_BASIC = 0
    UDP_TABLE_OWNER_PID = 1
    UDP_TABLE_OWNER_MODULE = 2
  end

  enum TCPIP_OWNER_MODULE_INFO_CLASS : Int32
    TCPIP_OWNER_MODULE_INFO_BASIC = 0
  end

  enum TCP_ESTATS_TYPE : Int32
    TcpConnectionEstatsSynOpts = 0
    TcpConnectionEstatsData = 1
    TcpConnectionEstatsSndCong = 2
    TcpConnectionEstatsPath = 3
    TcpConnectionEstatsSendBuff = 4
    TcpConnectionEstatsRec = 5
    TcpConnectionEstatsObsRec = 6
    TcpConnectionEstatsBandwidth = 7
    TcpConnectionEstatsFineRtt = 8
    TcpConnectionEstatsMaximum = 9
  end

  enum TCP_BOOLEAN_OPTIONAL : Int32
    TcpBoolOptDisabled = 0
    TcpBoolOptEnabled = 1
    TcpBoolOptUnchanged = -1
  end

  enum TCP_SOFT_ERROR : Int32
    TcpErrorNone = 0
    TcpErrorBelowDataWindow = 1
    TcpErrorAboveDataWindow = 2
    TcpErrorBelowAckWindow = 3
    TcpErrorAboveAckWindow = 4
    TcpErrorBelowTsWindow = 5
    TcpErrorAboveTsWindow = 6
    TcpErrorDataChecksumError = 7
    TcpErrorDataLengthError = 8
    TcpErrorMaxSoftError = 9
  end

  enum NET_ADDRESS_FORMAT : Int32
    NET_ADDRESS_FORMAT_UNSPECIFIED = 0
    NET_ADDRESS_DNS_NAME = 1
    NET_ADDRESS_IPV4 = 2
    NET_ADDRESS_IPV6 = 3
  end

  enum GLOBAL_FILTER : Int32
    GF_FRAGMENTS = 2
    GF_STRONGHOST = 8
    GF_FRAGCACHE = 9
  end

  enum PFFORWARD_ACTION : Int32
    PF_ACTION_FORWARD = 0
    PF_ACTION_DROP = 1
  end

  enum PFADDRESSTYPE : Int32
    PF_IPV4 = 0
    PF_IPV6 = 1
  end

  enum PFFRAMETYPE : Int32
    PFFT_FILTER = 1
    PFFT_FRAG = 2
    PFFT_SPOOF = 3
  end

  union NET_LUID_LH
    value : UInt64
    info : NET_LUID_LH_Info_e__Struct
  end
  union MIB_IPPATH_ROW_Anonymous_e__Union
    last_reachable : UInt32
    last_unreachable : UInt32
  end
  union MIB_IPNET_ROW2_Anonymous_e__Union
    anonymous : MIB_IPNET_ROW2_Anonymous_e__Union_Anonymous_e__Struct
    flags : UInt8
  end
  union MIB_IPNET_ROW2_ReachabilityTime_e__Union
    last_reachable : UInt32
    last_unreachable : UInt32
  end
  union DNS_SERVER_PROPERTY_TYPES
    doh_settings : DNS_DOH_SERVER_SETTINGS*
  end
  union MIB_IPFORWARDROW_Anonymous1_e__Union
    dw_forward_type : UInt32
    forward_type : MIB_IPFORWARD_TYPE
  end
  union MIB_IPFORWARDROW_Anonymous2_e__Union
    dw_forward_proto : UInt32
    forward_proto : NL_ROUTE_PROTOCOL
  end
  union MIB_IPNETROW_LH_Anonymous_e__Union
    dw_type : UInt32
    type : MIB_IPNET_TYPE
  end
  union MIB_IPSTATS_LH_Anonymous_e__Union
    dw_forwarding : UInt32
    forwarding : MIB_IPSTATS_FORWARDING
  end
  union MIB_TCPROW_LH_Anonymous_e__Union
    dw_state : UInt32
    state : MIB_TCP_STATE
  end
  union MIB_TCPSTATS_LH_Anonymous_e__Union
    dw_rto_algorithm : UInt32
    rto_algorithm : TCP_RTO_ALGORITHM
  end
  union MIB_UDPROW_OWNER_MODULE_Anonymous_e__Union
    anonymous : MIB_UDPROW_OWNER_MODULE_Anonymous_e__Union_Anonymous_e__Struct
    dw_flags : Int32
  end
  union MIB_UDPROW2_Anonymous_e__Union
    anonymous : MIB_UDPROW2_Anonymous_e__Union_Anonymous_e__Struct
    dw_flags : Int32
  end
  union MIB_UDP6ROW_OWNER_MODULE_Anonymous_e__Union
    anonymous : MIB_UDP6ROW_OWNER_MODULE_Anonymous_e__Union_Anonymous_e__Struct
    dw_flags : Int32
  end
  union MIB_UDP6ROW2_Anonymous_e__Union
    anonymous : MIB_UDP6ROW2_Anonymous_e__Union_Anonymous_e__Struct
    dw_flags : Int32
  end
  union MIB_OPAQUE_INFO_Anonymous_e__Union
    ull_align : UInt64
    rgby_data : UInt8[0]*
  end
  union IP_ADAPTER_UNICAST_ADDRESS_LH_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_UNICAST_ADDRESS_LH_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_UNICAST_ADDRESS_XP_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_UNICAST_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_ANYCAST_ADDRESS_XP_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_ANYCAST_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_MULTICAST_ADDRESS_XP_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_MULTICAST_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_DNS_SERVER_ADDRESS_XP_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_DNS_SERVER_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_WINS_SERVER_ADDRESS_LH_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_WINS_SERVER_ADDRESS_LH_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_GATEWAY_ADDRESS_LH_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_GATEWAY_ADDRESS_LH_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_PREFIX_XP_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_PREFIX_XP_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_ADDRESSES_LH_Anonymous2_e__Union
    flags : UInt32
    anonymous : IP_ADAPTER_ADDRESSES_LH_Anonymous2_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_ADDRESSES_LH_Anonymous1_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_ADDRESSES_LH_Anonymous1_e__Union_Anonymous_e__Struct
  end
  union IP_ADAPTER_ADDRESSES_XP_Anonymous_e__Union
    alignment : UInt64
    anonymous : IP_ADAPTER_ADDRESSES_XP_Anonymous_e__Union_Anonymous_e__Struct
  end

  struct Ip_option_information
    ttl : UInt8
    tos : UInt8
    flags : UInt8
    options_size : UInt8
    options_data : UInt8*
  end
  struct Ip_option_information32
    ttl : UInt8
    tos : UInt8
    flags : UInt8
    options_size : UInt8
    options_data : UInt8*
  end
  struct Icmp_echo_reply
    address : UInt32
    status : UInt32
    round_trip_time : UInt32
    data_size : UInt16
    reserved : UInt16
    data : Void*
    options : Ip_option_information
  end
  struct Icmp_echo_reply32
    address : UInt32
    status : UInt32
    round_trip_time : UInt32
    data_size : UInt16
    reserved : UInt16
    data : Void*
    options : Ip_option_information32
  end
  struct IPV6_ADDRESS_EX
    sin6_port : UInt16
    sin6_flowinfo : UInt32
    sin6_addr : UInt16[8]*
    sin6_scope_id : UInt32
  end
  struct Icmpv6_echo_reply_lh
    address : IPV6_ADDRESS_EX
    status : UInt32
    round_trip_time : UInt32
  end
  struct Arp_send_reply
    dest_address : UInt32
    src_address : UInt32
  end
  struct Tcp_reserve_port_range
    upper_range : UInt16
    lower_range : UInt16
  end
  struct IP_ADAPTER_INDEX_MAP
    index : UInt32
    name : Char[128]*
  end
  struct IP_INTERFACE_INFO
    num_adapters : Int32
    adapter : IP_ADAPTER_INDEX_MAP[0]*
  end
  struct IP_UNIDIRECTIONAL_ADAPTER_ADDRESS
    num_adapters : UInt32
    address : UInt32[0]*
  end
  struct IP_ADAPTER_ORDER_MAP
    num_adapters : UInt32
    adapter_order : UInt32[0]*
  end
  struct IP_MCAST_COUNTER_INFO
    in_mcast_octets : UInt64
    out_mcast_octets : UInt64
    in_mcast_pkts : UInt64
    out_mcast_pkts : UInt64
  end
  struct NET_IF_RCV_ADDRESS_LH
    if_rcv_address_type : NET_IF_RCV_ADDRESS_TYPE
    if_rcv_address_length : UInt16
    if_rcv_address_offset : UInt16
  end
  struct NET_IF_ALIAS_LH
    if_alias_length : UInt16
    if_alias_offset : UInt16
  end
  struct NET_LUID_LH_Info_e__Struct
    _bitfield : UInt64
  end
  struct NET_PHYSICAL_LOCATION_LH
    bus_number : UInt32
    slot_number : UInt32
    function_number : UInt32
  end
  struct IF_COUNTED_STRING_LH
    length : UInt16
    string : Char[257]*
  end
  struct IF_PHYSICAL_ADDRESS_LH
    length : UInt16
    address : UInt8[32]*
  end
  struct NDIS_INTERFACE_INFORMATION
    if_oper_status : NET_IF_OPER_STATUS
    if_oper_status_flags : UInt32
    media_connect_state : NET_IF_MEDIA_CONNECT_STATE
    media_duplex_state : NET_IF_MEDIA_DUPLEX_STATE
    if_mtu : UInt32
    if_promiscuous_mode : BOOLEAN
    if_device_wake_up_enable : BOOLEAN
    xmit_link_speed : UInt64
    rcv_link_speed : UInt64
    if_last_change : UInt64
    if_counter_discontinuity_time : UInt64
    if_in_unknown_protos : UInt64
    if_in_discards : UInt64
    if_in_errors : UInt64
    if_hc_in_octets : UInt64
    if_hc_in_ucast_pkts : UInt64
    if_hc_in_multicast_pkts : UInt64
    if_hc_in_broadcast_pkts : UInt64
    if_hc_out_octets : UInt64
    if_hc_out_ucast_pkts : UInt64
    if_hc_out_multicast_pkts : UInt64
    if_hc_out_broadcast_pkts : UInt64
    if_out_errors : UInt64
    if_out_discards : UInt64
    if_hc_in_ucast_octets : UInt64
    if_hc_in_multicast_octets : UInt64
    if_hc_in_broadcast_octets : UInt64
    if_hc_out_ucast_octets : UInt64
    if_hc_out_multicast_octets : UInt64
    if_hc_out_broadcast_octets : UInt64
    compartment_id : UInt32
    supported_statistics : UInt32
  end
  struct MIB_IF_ROW2
    interface_luid : NET_LUID_LH
    interface_index : UInt32
    interface_guid : Guid
    alias : Char[257]*
    description : Char[257]*
    physical_address_length : UInt32
    physical_address : UInt8[32]*
    permanent_physical_address : UInt8[32]*
    mtu : UInt32
    type : UInt32
    tunnel_type : TUNNEL_TYPE
    media_type : NDIS_MEDIUM
    physical_medium_type : NDIS_PHYSICAL_MEDIUM
    access_type : NET_IF_ACCESS_TYPE
    direction_type : NET_IF_DIRECTION_TYPE
    interface_and_oper_status_flags : MIB_IF_ROW2_InterfaceAndOperStatusFlags_e__Struct
    oper_status : IF_OPER_STATUS
    admin_status : NET_IF_ADMIN_STATUS
    media_connect_state : NET_IF_MEDIA_CONNECT_STATE
    network_guid : Guid
    connection_type : NET_IF_CONNECTION_TYPE
    transmit_link_speed : UInt64
    receive_link_speed : UInt64
    in_octets : UInt64
    in_ucast_pkts : UInt64
    in_n_ucast_pkts : UInt64
    in_discards : UInt64
    in_errors : UInt64
    in_unknown_protos : UInt64
    in_ucast_octets : UInt64
    in_multicast_octets : UInt64
    in_broadcast_octets : UInt64
    out_octets : UInt64
    out_ucast_pkts : UInt64
    out_n_ucast_pkts : UInt64
    out_discards : UInt64
    out_errors : UInt64
    out_ucast_octets : UInt64
    out_multicast_octets : UInt64
    out_broadcast_octets : UInt64
    out_q_len : UInt64
  end
  struct MIB_IF_ROW2_InterfaceAndOperStatusFlags_e__Struct
    _bitfield : UInt8
  end
  struct MIB_IF_TABLE2
    num_entries : UInt32
    table : MIB_IF_ROW2[0]*
  end
  struct MIB_IPINTERFACE_ROW
    family : UInt16
    interface_luid : NET_LUID_LH
    interface_index : UInt32
    max_reassembly_size : UInt32
    interface_identifier : UInt64
    min_router_advertisement_interval : UInt32
    max_router_advertisement_interval : UInt32
    advertising_enabled : BOOLEAN
    forwarding_enabled : BOOLEAN
    weak_host_send : BOOLEAN
    weak_host_receive : BOOLEAN
    use_automatic_metric : BOOLEAN
    use_neighbor_unreachability_detection : BOOLEAN
    managed_address_configuration_supported : BOOLEAN
    other_stateful_configuration_supported : BOOLEAN
    advertise_default_route : BOOLEAN
    router_discovery_behavior : NL_ROUTER_DISCOVERY_BEHAVIOR
    dad_transmits : UInt32
    base_reachable_time : UInt32
    retransmit_time : UInt32
    path_mtu_discovery_timeout : UInt32
    link_local_address_behavior : NL_LINK_LOCAL_ADDRESS_BEHAVIOR
    link_local_address_timeout : UInt32
    zone_indices : UInt32[16]*
    site_prefix_length : UInt32
    metric : UInt32
    nl_mtu : UInt32
    connected : BOOLEAN
    supports_wake_up_patterns : BOOLEAN
    supports_neighbor_discovery : BOOLEAN
    supports_router_discovery : BOOLEAN
    reachable_time : UInt32
    transmit_offload : NL_INTERFACE_OFFLOAD_ROD
    receive_offload : NL_INTERFACE_OFFLOAD_ROD
    disable_default_routes : BOOLEAN
  end
  struct MIB_IPINTERFACE_TABLE
    num_entries : UInt32
    table : MIB_IPINTERFACE_ROW[0]*
  end
  struct MIB_IFSTACK_ROW
    higher_layer_interface_index : UInt32
    lower_layer_interface_index : UInt32
  end
  struct MIB_INVERTEDIFSTACK_ROW
    lower_layer_interface_index : UInt32
    higher_layer_interface_index : UInt32
  end
  struct MIB_IFSTACK_TABLE
    num_entries : UInt32
    table : MIB_IFSTACK_ROW[0]*
  end
  struct MIB_INVERTEDIFSTACK_TABLE
    num_entries : UInt32
    table : MIB_INVERTEDIFSTACK_ROW[0]*
  end
  struct MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES
    inbound_bandwidth_information : NL_BANDWIDTH_INFORMATION
    outbound_bandwidth_information : NL_BANDWIDTH_INFORMATION
  end
  struct MIB_UNICASTIPADDRESS_ROW
    address : SOCKADDR_INET
    interface_luid : NET_LUID_LH
    interface_index : UInt32
    prefix_origin : NL_PREFIX_ORIGIN
    suffix_origin : NL_SUFFIX_ORIGIN
    valid_lifetime : UInt32
    preferred_lifetime : UInt32
    on_link_prefix_length : UInt8
    skip_as_source : BOOLEAN
    dad_state : NL_DAD_STATE
    scope_id : SCOPE_ID
    creation_time_stamp : LARGE_INTEGER
  end
  struct MIB_UNICASTIPADDRESS_TABLE
    num_entries : UInt32
    table : MIB_UNICASTIPADDRESS_ROW[0]*
  end
  struct MIB_ANYCASTIPADDRESS_ROW
    address : SOCKADDR_INET
    interface_luid : NET_LUID_LH
    interface_index : UInt32
    scope_id : SCOPE_ID
  end
  struct MIB_ANYCASTIPADDRESS_TABLE
    num_entries : UInt32
    table : MIB_ANYCASTIPADDRESS_ROW[0]*
  end
  struct MIB_MULTICASTIPADDRESS_ROW
    address : SOCKADDR_INET
    interface_index : UInt32
    interface_luid : NET_LUID_LH
    scope_id : SCOPE_ID
  end
  struct MIB_MULTICASTIPADDRESS_TABLE
    num_entries : UInt32
    table : MIB_MULTICASTIPADDRESS_ROW[0]*
  end
  struct IP_ADDRESS_PREFIX
    prefix : SOCKADDR_INET
    prefix_length : UInt8
  end
  struct MIB_IPFORWARD_ROW2
    interface_luid : NET_LUID_LH
    interface_index : UInt32
    destination_prefix : IP_ADDRESS_PREFIX
    next_hop : SOCKADDR_INET
    site_prefix_length : UInt8
    valid_lifetime : UInt32
    preferred_lifetime : UInt32
    metric : UInt32
    protocol : NL_ROUTE_PROTOCOL
    loopback : BOOLEAN
    autoconfigure_address : BOOLEAN
    publish : BOOLEAN
    immortal : BOOLEAN
    age : UInt32
    origin : NL_ROUTE_ORIGIN
  end
  struct MIB_IPFORWARD_TABLE2
    num_entries : UInt32
    table : MIB_IPFORWARD_ROW2[0]*
  end
  struct MIB_IPPATH_ROW
    source : SOCKADDR_INET
    destination : SOCKADDR_INET
    interface_luid : NET_LUID_LH
    interface_index : UInt32
    current_next_hop : SOCKADDR_INET
    path_mtu : UInt32
    rtt_mean : UInt32
    rtt_deviation : UInt32
    anonymous : MIB_IPPATH_ROW_Anonymous_e__Union
    is_reachable : BOOLEAN
    link_transmit_speed : UInt64
    link_receive_speed : UInt64
  end
  struct MIB_IPPATH_TABLE
    num_entries : UInt32
    table : MIB_IPPATH_ROW[0]*
  end
  struct MIB_IPNET_ROW2
    address : SOCKADDR_INET
    interface_index : UInt32
    interface_luid : NET_LUID_LH
    physical_address : UInt8[32]*
    physical_address_length : UInt32
    state : NL_NEIGHBOR_STATE
    anonymous : MIB_IPNET_ROW2_Anonymous_e__Union
    reachability_time : MIB_IPNET_ROW2_ReachabilityTime_e__Union
  end
  struct MIB_IPNET_ROW2_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt8
  end
  struct MIB_IPNET_TABLE2
    num_entries : UInt32
    table : MIB_IPNET_ROW2[0]*
  end
  struct DNS_SETTINGS
    version : UInt32
    flags : UInt64
    hostname : LibC::LPWSTR
    domain : LibC::LPWSTR
    search_list : LibC::LPWSTR
  end
  struct DNS_SETTINGS2
    version : UInt32
    flags : UInt64
    hostname : LibC::LPWSTR
    domain : LibC::LPWSTR
    search_list : LibC::LPWSTR
    setting_flags : UInt64
  end
  struct DNS_DOH_SERVER_SETTINGS
    template : LibC::LPWSTR
    flags : UInt64
  end
  struct DNS_SERVER_PROPERTY
    version : UInt32
    server_index : UInt32
    type : DNS_SERVER_PROPERTY_TYPE
    property : DNS_SERVER_PROPERTY_TYPES
  end
  struct DNS_INTERFACE_SETTINGS
    version : UInt32
    flags : UInt64
    domain : LibC::LPWSTR
    name_server : LibC::LPWSTR
    search_list : LibC::LPWSTR
    registration_enabled : UInt32
    register_adapter_name : UInt32
    enable_llmnr : UInt32
    query_adapter_name : UInt32
    profile_name_server : LibC::LPWSTR
  end
  struct DNS_INTERFACE_SETTINGS_EX
    settings_v1 : DNS_INTERFACE_SETTINGS
    disable_unconstrained_queries : UInt32
    supplemental_search_list : LibC::LPWSTR
  end
  struct DNS_INTERFACE_SETTINGS3
    version : UInt32
    flags : UInt64
    domain : LibC::LPWSTR
    name_server : LibC::LPWSTR
    search_list : LibC::LPWSTR
    registration_enabled : UInt32
    register_adapter_name : UInt32
    enable_llmnr : UInt32
    query_adapter_name : UInt32
    profile_name_server : LibC::LPWSTR
    disable_unconstrained_queries : UInt32
    supplemental_search_list : LibC::LPWSTR
    c_server_properties : UInt32
    server_properties : DNS_SERVER_PROPERTY*
    c_profile_server_properties : UInt32
    profile_server_properties : DNS_SERVER_PROPERTY*
  end
  struct MIB_OPAQUE_QUERY
    dw_var_id : UInt32
    rgdw_var_index : UInt32[0]*
  end
  struct MIB_IFNUMBER
    dw_value : UInt32
  end
  struct MIB_IFROW
    wsz_name : Char[256]*
    dw_index : UInt32
    dw_type : UInt32
    dw_mtu : UInt32
    dw_speed : UInt32
    dw_phys_addr_len : UInt32
    b_phys_addr : UInt8[8]*
    dw_admin_status : UInt32
    dw_oper_status : INTERNAL_IF_OPER_STATUS
    dw_last_change : UInt32
    dw_in_octets : UInt32
    dw_in_ucast_pkts : UInt32
    dw_in_n_ucast_pkts : UInt32
    dw_in_discards : UInt32
    dw_in_errors : UInt32
    dw_in_unknown_protos : UInt32
    dw_out_octets : UInt32
    dw_out_ucast_pkts : UInt32
    dw_out_n_ucast_pkts : UInt32
    dw_out_discards : UInt32
    dw_out_errors : UInt32
    dw_out_q_len : UInt32
    dw_descr_len : UInt32
    b_descr : UInt8[256]*
  end
  struct MIB_IFTABLE
    dw_num_entries : UInt32
    table : MIB_IFROW[0]*
  end
  struct MIB_IPADDRROW_XP
    dw_addr : UInt32
    dw_index : UInt32
    dw_mask : UInt32
    dw_b_cast_addr : UInt32
    dw_reasm_size : UInt32
    unused1 : UInt16
    w_type : UInt16
  end
  struct MIB_IPADDRROW_W2K
    dw_addr : UInt32
    dw_index : UInt32
    dw_mask : UInt32
    dw_b_cast_addr : UInt32
    dw_reasm_size : UInt32
    unused1 : UInt16
    unused2 : UInt16
  end
  struct MIB_IPADDRTABLE
    dw_num_entries : UInt32
    table : MIB_IPADDRROW_XP[0]*
  end
  struct MIB_IPFORWARDNUMBER
    dw_value : UInt32
  end
  struct MIB_IPFORWARDROW
    dw_forward_dest : UInt32
    dw_forward_mask : UInt32
    dw_forward_policy : UInt32
    dw_forward_next_hop : UInt32
    dw_forward_if_index : UInt32
    anonymous1 : MIB_IPFORWARDROW_Anonymous1_e__Union
    anonymous2 : MIB_IPFORWARDROW_Anonymous2_e__Union
    dw_forward_age : UInt32
    dw_forward_next_hop_as : UInt32
    dw_forward_metric1 : UInt32
    dw_forward_metric2 : UInt32
    dw_forward_metric3 : UInt32
    dw_forward_metric4 : UInt32
    dw_forward_metric5 : UInt32
  end
  struct MIB_IPFORWARDTABLE
    dw_num_entries : UInt32
    table : MIB_IPFORWARDROW[0]*
  end
  struct MIB_IPNETROW_LH
    dw_index : UInt32
    dw_phys_addr_len : UInt32
    b_phys_addr : UInt8[8]*
    dw_addr : UInt32
    anonymous : MIB_IPNETROW_LH_Anonymous_e__Union
  end
  struct MIB_IPNETROW_W2K
    dw_index : UInt32
    dw_phys_addr_len : UInt32
    b_phys_addr : UInt8[8]*
    dw_addr : UInt32
    dw_type : UInt32
  end
  struct MIB_IPNETTABLE
    dw_num_entries : UInt32
    table : MIB_IPNETROW_LH[0]*
  end
  struct MIB_IPSTATS_LH
    anonymous : MIB_IPSTATS_LH_Anonymous_e__Union
    dw_default_ttl : UInt32
    dw_in_receives : UInt32
    dw_in_hdr_errors : UInt32
    dw_in_addr_errors : UInt32
    dw_forw_datagrams : UInt32
    dw_in_unknown_protos : UInt32
    dw_in_discards : UInt32
    dw_in_delivers : UInt32
    dw_out_requests : UInt32
    dw_routing_discards : UInt32
    dw_out_discards : UInt32
    dw_out_no_routes : UInt32
    dw_reasm_timeout : UInt32
    dw_reasm_reqds : UInt32
    dw_reasm_oks : UInt32
    dw_reasm_fails : UInt32
    dw_frag_oks : UInt32
    dw_frag_fails : UInt32
    dw_frag_creates : UInt32
    dw_num_if : UInt32
    dw_num_addr : UInt32
    dw_num_routes : UInt32
  end
  struct MIB_IPSTATS_W2K
    dw_forwarding : UInt32
    dw_default_ttl : UInt32
    dw_in_receives : UInt32
    dw_in_hdr_errors : UInt32
    dw_in_addr_errors : UInt32
    dw_forw_datagrams : UInt32
    dw_in_unknown_protos : UInt32
    dw_in_discards : UInt32
    dw_in_delivers : UInt32
    dw_out_requests : UInt32
    dw_routing_discards : UInt32
    dw_out_discards : UInt32
    dw_out_no_routes : UInt32
    dw_reasm_timeout : UInt32
    dw_reasm_reqds : UInt32
    dw_reasm_oks : UInt32
    dw_reasm_fails : UInt32
    dw_frag_oks : UInt32
    dw_frag_fails : UInt32
    dw_frag_creates : UInt32
    dw_num_if : UInt32
    dw_num_addr : UInt32
    dw_num_routes : UInt32
  end
  struct MIBICMPSTATS
    dw_msgs : UInt32
    dw_errors : UInt32
    dw_dest_unreachs : UInt32
    dw_time_excds : UInt32
    dw_parm_probs : UInt32
    dw_src_quenchs : UInt32
    dw_redirects : UInt32
    dw_echos : UInt32
    dw_echo_reps : UInt32
    dw_timestamps : UInt32
    dw_timestamp_reps : UInt32
    dw_addr_masks : UInt32
    dw_addr_mask_reps : UInt32
  end
  struct MIBICMPINFO
    icmp_in_stats : MIBICMPSTATS
    icmp_out_stats : MIBICMPSTATS
  end
  struct MIB_ICMP
    stats : MIBICMPINFO
  end
  struct MIBICMPSTATS_EX_XPSP1
    dw_msgs : UInt32
    dw_errors : UInt32
    rgdw_type_count : UInt32[256]*
  end
  struct MIB_ICMP_EX_XPSP1
    icmp_in_stats : MIBICMPSTATS_EX_XPSP1
    icmp_out_stats : MIBICMPSTATS_EX_XPSP1
  end
  struct MIB_IPMCAST_OIF_XP
    dw_out_if_index : UInt32
    dw_next_hop_addr : UInt32
    dw_reserved : UInt32
    dw_reserved1 : UInt32
  end
  struct MIB_IPMCAST_OIF_W2K
    dw_out_if_index : UInt32
    dw_next_hop_addr : UInt32
    pv_reserved : Void*
    dw_reserved : UInt32
  end
  struct MIB_IPMCAST_MFE
    dw_group : UInt32
    dw_source : UInt32
    dw_src_mask : UInt32
    dw_up_strm_ngbr : UInt32
    dw_in_if_index : UInt32
    dw_in_if_protocol : UInt32
    dw_route_protocol : UInt32
    dw_route_network : UInt32
    dw_route_mask : UInt32
    ul_up_time : UInt32
    ul_expiry_time : UInt32
    ul_time_out : UInt32
    ul_num_out_if : UInt32
    f_flags : UInt32
    dw_reserved : UInt32
    rgmio_out_info : MIB_IPMCAST_OIF_XP[0]*
  end
  struct MIB_MFE_TABLE
    dw_num_entries : UInt32
    table : MIB_IPMCAST_MFE[0]*
  end
  struct MIB_IPMCAST_OIF_STATS_LH
    dw_out_if_index : UInt32
    dw_next_hop_addr : UInt32
    dw_dial_context : UInt32
    ul_ttl_too_low : UInt32
    ul_frag_needed : UInt32
    ul_out_packets : UInt32
    ul_out_discards : UInt32
  end
  struct MIB_IPMCAST_OIF_STATS_W2K
    dw_out_if_index : UInt32
    dw_next_hop_addr : UInt32
    pv_dial_context : Void*
    ul_ttl_too_low : UInt32
    ul_frag_needed : UInt32
    ul_out_packets : UInt32
    ul_out_discards : UInt32
  end
  struct MIB_IPMCAST_MFE_STATS
    dw_group : UInt32
    dw_source : UInt32
    dw_src_mask : UInt32
    dw_up_strm_ngbr : UInt32
    dw_in_if_index : UInt32
    dw_in_if_protocol : UInt32
    dw_route_protocol : UInt32
    dw_route_network : UInt32
    dw_route_mask : UInt32
    ul_up_time : UInt32
    ul_expiry_time : UInt32
    ul_num_out_if : UInt32
    ul_in_pkts : UInt32
    ul_in_octets : UInt32
    ul_pkts_different_if : UInt32
    ul_queue_overflow : UInt32
    rgmios_out_stats : MIB_IPMCAST_OIF_STATS_LH[0]*
  end
  struct MIB_MFE_STATS_TABLE
    dw_num_entries : UInt32
    table : MIB_IPMCAST_MFE_STATS[0]*
  end
  struct MIB_IPMCAST_MFE_STATS_EX_XP
    dw_group : UInt32
    dw_source : UInt32
    dw_src_mask : UInt32
    dw_up_strm_ngbr : UInt32
    dw_in_if_index : UInt32
    dw_in_if_protocol : UInt32
    dw_route_protocol : UInt32
    dw_route_network : UInt32
    dw_route_mask : UInt32
    ul_up_time : UInt32
    ul_expiry_time : UInt32
    ul_num_out_if : UInt32
    ul_in_pkts : UInt32
    ul_in_octets : UInt32
    ul_pkts_different_if : UInt32
    ul_queue_overflow : UInt32
    ul_uninit_mfe : UInt32
    ul_negative_mfe : UInt32
    ul_in_discards : UInt32
    ul_in_hdr_errors : UInt32
    ul_total_out_packets : UInt32
    rgmios_out_stats : MIB_IPMCAST_OIF_STATS_LH[0]*
  end
  struct MIB_MFE_STATS_TABLE_EX_XP
    dw_num_entries : UInt32
    table : MIB_IPMCAST_MFE_STATS_EX_XP[0]**
  end
  struct MIB_IPMCAST_GLOBAL
    dw_enable : UInt32
  end
  struct MIB_IPMCAST_IF_ENTRY
    dw_if_index : UInt32
    dw_ttl : UInt32
    dw_protocol : UInt32
    dw_rate_limit : UInt32
    ul_in_mcast_octets : UInt32
    ul_out_mcast_octets : UInt32
  end
  struct MIB_IPMCAST_IF_TABLE
    dw_num_entries : UInt32
    table : MIB_IPMCAST_IF_ENTRY[0]*
  end
  struct MIB_TCPROW_LH
    anonymous : MIB_TCPROW_LH_Anonymous_e__Union
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_remote_addr : UInt32
    dw_remote_port : UInt32
  end
  struct MIB_TCPROW_W2K
    dw_state : UInt32
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_remote_addr : UInt32
    dw_remote_port : UInt32
  end
  struct MIB_TCPTABLE
    dw_num_entries : UInt32
    table : MIB_TCPROW_LH[0]*
  end
  struct MIB_TCPROW2
    dw_state : UInt32
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_remote_addr : UInt32
    dw_remote_port : UInt32
    dw_owning_pid : UInt32
    dw_offload_state : TCP_CONNECTION_OFFLOAD_STATE
  end
  struct MIB_TCPTABLE2
    dw_num_entries : UInt32
    table : MIB_TCPROW2[0]*
  end
  struct MIB_TCPROW_OWNER_PID
    dw_state : UInt32
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_remote_addr : UInt32
    dw_remote_port : UInt32
    dw_owning_pid : UInt32
  end
  struct MIB_TCPTABLE_OWNER_PID
    dw_num_entries : UInt32
    table : MIB_TCPROW_OWNER_PID[0]*
  end
  struct MIB_TCPROW_OWNER_MODULE
    dw_state : UInt32
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_remote_addr : UInt32
    dw_remote_port : UInt32
    dw_owning_pid : UInt32
    li_create_timestamp : LARGE_INTEGER
    owning_module_info : UInt64[16]*
  end
  struct MIB_TCPTABLE_OWNER_MODULE
    dw_num_entries : UInt32
    table : MIB_TCPROW_OWNER_MODULE[0]*
  end
  struct MIB_TCP6ROW
    state : MIB_TCP_STATE
    local_addr : IN6_ADDR
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
    remote_addr : IN6_ADDR
    dw_remote_scope_id : UInt32
    dw_remote_port : UInt32
  end
  struct MIB_TCP6TABLE
    dw_num_entries : UInt32
    table : MIB_TCP6ROW[0]*
  end
  struct MIB_TCP6ROW2
    local_addr : IN6_ADDR
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
    remote_addr : IN6_ADDR
    dw_remote_scope_id : UInt32
    dw_remote_port : UInt32
    state : MIB_TCP_STATE
    dw_owning_pid : UInt32
    dw_offload_state : TCP_CONNECTION_OFFLOAD_STATE
  end
  struct MIB_TCP6TABLE2
    dw_num_entries : UInt32
    table : MIB_TCP6ROW2[0]*
  end
  struct MIB_TCP6ROW_OWNER_PID
    uc_local_addr : UInt8[16]*
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
    uc_remote_addr : UInt8[16]*
    dw_remote_scope_id : UInt32
    dw_remote_port : UInt32
    dw_state : UInt32
    dw_owning_pid : UInt32
  end
  struct MIB_TCP6TABLE_OWNER_PID
    dw_num_entries : UInt32
    table : MIB_TCP6ROW_OWNER_PID[0]*
  end
  struct MIB_TCP6ROW_OWNER_MODULE
    uc_local_addr : UInt8[16]*
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
    uc_remote_addr : UInt8[16]*
    dw_remote_scope_id : UInt32
    dw_remote_port : UInt32
    dw_state : UInt32
    dw_owning_pid : UInt32
    li_create_timestamp : LARGE_INTEGER
    owning_module_info : UInt64[16]*
  end
  struct MIB_TCP6TABLE_OWNER_MODULE
    dw_num_entries : UInt32
    table : MIB_TCP6ROW_OWNER_MODULE[0]*
  end
  struct MIB_TCPSTATS_LH
    anonymous : MIB_TCPSTATS_LH_Anonymous_e__Union
    dw_rto_min : UInt32
    dw_rto_max : UInt32
    dw_max_conn : UInt32
    dw_active_opens : UInt32
    dw_passive_opens : UInt32
    dw_attempt_fails : UInt32
    dw_estab_resets : UInt32
    dw_curr_estab : UInt32
    dw_in_segs : UInt32
    dw_out_segs : UInt32
    dw_retrans_segs : UInt32
    dw_in_errs : UInt32
    dw_out_rsts : UInt32
    dw_num_conns : UInt32
  end
  struct MIB_TCPSTATS_W2K
    dw_rto_algorithm : UInt32
    dw_rto_min : UInt32
    dw_rto_max : UInt32
    dw_max_conn : UInt32
    dw_active_opens : UInt32
    dw_passive_opens : UInt32
    dw_attempt_fails : UInt32
    dw_estab_resets : UInt32
    dw_curr_estab : UInt32
    dw_in_segs : UInt32
    dw_out_segs : UInt32
    dw_retrans_segs : UInt32
    dw_in_errs : UInt32
    dw_out_rsts : UInt32
    dw_num_conns : UInt32
  end
  struct MIB_TCPSTATS2
    rto_algorithm : TCP_RTO_ALGORITHM
    dw_rto_min : UInt32
    dw_rto_max : UInt32
    dw_max_conn : UInt32
    dw_active_opens : UInt32
    dw_passive_opens : UInt32
    dw_attempt_fails : UInt32
    dw_estab_resets : UInt32
    dw_curr_estab : UInt32
    dw64_in_segs : UInt64
    dw64_out_segs : UInt64
    dw_retrans_segs : UInt32
    dw_in_errs : UInt32
    dw_out_rsts : UInt32
    dw_num_conns : UInt32
  end
  struct MIB_UDPROW
    dw_local_addr : UInt32
    dw_local_port : UInt32
  end
  struct MIB_UDPTABLE
    dw_num_entries : UInt32
    table : MIB_UDPROW[0]*
  end
  struct MIB_UDPROW_OWNER_PID
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_owning_pid : UInt32
  end
  struct MIB_UDPTABLE_OWNER_PID
    dw_num_entries : UInt32
    table : MIB_UDPROW_OWNER_PID[0]*
  end
  struct MIB_UDPROW_OWNER_MODULE
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_owning_pid : UInt32
    li_create_timestamp : LARGE_INTEGER
    anonymous : MIB_UDPROW_OWNER_MODULE_Anonymous_e__Union
    owning_module_info : UInt64[16]*
  end
  struct MIB_UDPROW_OWNER_MODULE_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : Int32
  end
  struct MIB_UDPTABLE_OWNER_MODULE
    dw_num_entries : UInt32
    table : MIB_UDPROW_OWNER_MODULE[0]*
  end
  struct MIB_UDPROW2
    dw_local_addr : UInt32
    dw_local_port : UInt32
    dw_owning_pid : UInt32
    li_create_timestamp : LARGE_INTEGER
    anonymous : MIB_UDPROW2_Anonymous_e__Union
    owning_module_info : UInt64[16]*
    dw_remote_addr : UInt32
    dw_remote_port : UInt32
  end
  struct MIB_UDPROW2_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : Int32
  end
  struct MIB_UDPTABLE2
    dw_num_entries : UInt32
    table : MIB_UDPROW2[0]*
  end
  struct MIB_UDP6ROW
    dw_local_addr : IN6_ADDR
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
  end
  struct MIB_UDP6TABLE
    dw_num_entries : UInt32
    table : MIB_UDP6ROW[0]*
  end
  struct MIB_UDP6ROW_OWNER_PID
    uc_local_addr : UInt8[16]*
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
    dw_owning_pid : UInt32
  end
  struct MIB_UDP6TABLE_OWNER_PID
    dw_num_entries : UInt32
    table : MIB_UDP6ROW_OWNER_PID[0]*
  end
  struct MIB_UDP6ROW_OWNER_MODULE
    uc_local_addr : UInt8[16]*
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
    dw_owning_pid : UInt32
    li_create_timestamp : LARGE_INTEGER
    anonymous : MIB_UDP6ROW_OWNER_MODULE_Anonymous_e__Union
    owning_module_info : UInt64[16]*
  end
  struct MIB_UDP6ROW_OWNER_MODULE_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : Int32
  end
  struct MIB_UDP6TABLE_OWNER_MODULE
    dw_num_entries : UInt32
    table : MIB_UDP6ROW_OWNER_MODULE[0]*
  end
  struct MIB_UDP6ROW2
    uc_local_addr : UInt8[16]*
    dw_local_scope_id : UInt32
    dw_local_port : UInt32
    dw_owning_pid : UInt32
    li_create_timestamp : LARGE_INTEGER
    anonymous : MIB_UDP6ROW2_Anonymous_e__Union
    owning_module_info : UInt64[16]*
    uc_remote_addr : UInt8[16]*
    dw_remote_scope_id : UInt32
    dw_remote_port : UInt32
  end
  struct MIB_UDP6ROW2_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : Int32
  end
  struct MIB_UDP6TABLE2
    dw_num_entries : UInt32
    table : MIB_UDP6ROW2[0]*
  end
  struct MIB_UDPSTATS
    dw_in_datagrams : UInt32
    dw_no_ports : UInt32
    dw_in_errors : UInt32
    dw_out_datagrams : UInt32
    dw_num_addrs : UInt32
  end
  struct MIB_UDPSTATS2
    dw64_in_datagrams : UInt64
    dw_no_ports : UInt32
    dw_in_errors : UInt32
    dw64_out_datagrams : UInt64
    dw_num_addrs : UInt32
  end
  struct TCPIP_OWNER_MODULE_BASIC_INFO
    p_module_name : LibC::LPWSTR
    p_module_path : LibC::LPWSTR
  end
  struct MIB_IPMCAST_BOUNDARY
    dw_if_index : UInt32
    dw_group_address : UInt32
    dw_group_mask : UInt32
    dw_status : UInt32
  end
  struct MIB_IPMCAST_BOUNDARY_TABLE
    dw_num_entries : UInt32
    table : MIB_IPMCAST_BOUNDARY[0]*
  end
  struct MIB_BOUNDARYROW
    dw_group_address : UInt32
    dw_group_mask : UInt32
  end
  struct MIB_MCAST_LIMIT_ROW
    dw_ttl : UInt32
    dw_rate_limit : UInt32
  end
  struct MIB_IPMCAST_SCOPE
    dw_group_address : UInt32
    dw_group_mask : UInt32
    sn_name_buffer : UInt16[256]*
    dw_status : UInt32
  end
  struct MIB_IPDESTROW
    forward_row : MIB_IPFORWARDROW
    dw_forward_preference : UInt32
    dw_forward_view_set : UInt32
  end
  struct MIB_IPDESTTABLE
    dw_num_entries : UInt32
    table : MIB_IPDESTROW[0]*
  end
  struct MIB_BEST_IF
    dw_dest_addr : UInt32
    dw_if_index : UInt32
  end
  struct MIB_PROXYARP
    dw_address : UInt32
    dw_mask : UInt32
    dw_if_index : UInt32
  end
  struct MIB_IFSTATUS
    dw_if_index : UInt32
    dw_admin_status : UInt32
    dw_operational_status : UInt32
    b_m_hbeat_active : LibC::BOOL
    b_m_hbeat_alive : LibC::BOOL
  end
  struct MIB_ROUTESTATE
    b_routes_set_to_stack : LibC::BOOL
  end
  struct MIB_OPAQUE_INFO
    dw_id : UInt32
    anonymous : MIB_OPAQUE_INFO_Anonymous_e__Union
  end
  struct IP_ADDRESS_STRING
    string : CHAR[16]*
  end
  struct IP_ADDR_STRING
    next : IP_ADDR_STRING*
    ip_address : IP_ADDRESS_STRING
    ip_mask : IP_ADDRESS_STRING
    context : UInt32
  end
  struct IP_ADAPTER_INFO
    next : IP_ADAPTER_INFO*
    combo_index : UInt32
    adapter_name : CHAR[260]*
    description : CHAR[132]*
    address_length : UInt32
    address : UInt8[8]*
    index : UInt32
    type : UInt32
    dhcp_enabled : UInt32
    current_ip_address : IP_ADDR_STRING*
    ip_address_list : IP_ADDR_STRING
    gateway_list : IP_ADDR_STRING
    dhcp_server : IP_ADDR_STRING
    have_wins : LibC::BOOL
    primary_wins_server : IP_ADDR_STRING
    secondary_wins_server : IP_ADDR_STRING
    lease_obtained : Int64
    lease_expires : Int64
  end
  struct IP_ADAPTER_UNICAST_ADDRESS_LH
    anonymous : IP_ADAPTER_UNICAST_ADDRESS_LH_Anonymous_e__Union
    next : IP_ADAPTER_UNICAST_ADDRESS_LH*
    address : SOCKET_ADDRESS
    prefix_origin : NL_PREFIX_ORIGIN
    suffix_origin : NL_SUFFIX_ORIGIN
    dad_state : NL_DAD_STATE
    valid_lifetime : UInt32
    preferred_lifetime : UInt32
    lease_lifetime : UInt32
    on_link_prefix_length : UInt8
  end
  struct IP_ADAPTER_UNICAST_ADDRESS_LH_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    flags : UInt32
  end
  struct IP_ADAPTER_UNICAST_ADDRESS_XP
    anonymous : IP_ADAPTER_UNICAST_ADDRESS_XP_Anonymous_e__Union
    next : IP_ADAPTER_UNICAST_ADDRESS_XP*
    address : SOCKET_ADDRESS
    prefix_origin : NL_PREFIX_ORIGIN
    suffix_origin : NL_SUFFIX_ORIGIN
    dad_state : NL_DAD_STATE
    valid_lifetime : UInt32
    preferred_lifetime : UInt32
    lease_lifetime : UInt32
  end
  struct IP_ADAPTER_UNICAST_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    flags : UInt32
  end
  struct IP_ADAPTER_ANYCAST_ADDRESS_XP
    anonymous : IP_ADAPTER_ANYCAST_ADDRESS_XP_Anonymous_e__Union
    next : IP_ADAPTER_ANYCAST_ADDRESS_XP*
    address : SOCKET_ADDRESS
  end
  struct IP_ADAPTER_ANYCAST_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    flags : UInt32
  end
  struct IP_ADAPTER_MULTICAST_ADDRESS_XP
    anonymous : IP_ADAPTER_MULTICAST_ADDRESS_XP_Anonymous_e__Union
    next : IP_ADAPTER_MULTICAST_ADDRESS_XP*
    address : SOCKET_ADDRESS
  end
  struct IP_ADAPTER_MULTICAST_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    flags : UInt32
  end
  struct IP_ADAPTER_DNS_SERVER_ADDRESS_XP
    anonymous : IP_ADAPTER_DNS_SERVER_ADDRESS_XP_Anonymous_e__Union
    next : IP_ADAPTER_DNS_SERVER_ADDRESS_XP*
    address : SOCKET_ADDRESS
  end
  struct IP_ADAPTER_DNS_SERVER_ADDRESS_XP_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    reserved : UInt32
  end
  struct IP_ADAPTER_WINS_SERVER_ADDRESS_LH
    anonymous : IP_ADAPTER_WINS_SERVER_ADDRESS_LH_Anonymous_e__Union
    next : IP_ADAPTER_WINS_SERVER_ADDRESS_LH*
    address : SOCKET_ADDRESS
  end
  struct IP_ADAPTER_WINS_SERVER_ADDRESS_LH_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    reserved : UInt32
  end
  struct IP_ADAPTER_GATEWAY_ADDRESS_LH
    anonymous : IP_ADAPTER_GATEWAY_ADDRESS_LH_Anonymous_e__Union
    next : IP_ADAPTER_GATEWAY_ADDRESS_LH*
    address : SOCKET_ADDRESS
  end
  struct IP_ADAPTER_GATEWAY_ADDRESS_LH_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    reserved : UInt32
  end
  struct IP_ADAPTER_PREFIX_XP
    anonymous : IP_ADAPTER_PREFIX_XP_Anonymous_e__Union
    next : IP_ADAPTER_PREFIX_XP*
    address : SOCKET_ADDRESS
    prefix_length : UInt32
  end
  struct IP_ADAPTER_PREFIX_XP_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    flags : UInt32
  end
  struct IP_ADAPTER_DNS_SUFFIX
    next : IP_ADAPTER_DNS_SUFFIX*
    string : Char[256]*
  end
  struct IP_ADAPTER_ADDRESSES_LH
    anonymous1 : IP_ADAPTER_ADDRESSES_LH_Anonymous1_e__Union
    next : IP_ADAPTER_ADDRESSES_LH*
    adapter_name : PSTR
    first_unicast_address : IP_ADAPTER_UNICAST_ADDRESS_LH*
    first_anycast_address : IP_ADAPTER_ANYCAST_ADDRESS_XP*
    first_multicast_address : IP_ADAPTER_MULTICAST_ADDRESS_XP*
    first_dns_server_address : IP_ADAPTER_DNS_SERVER_ADDRESS_XP*
    dns_suffix : LibC::LPWSTR
    description : LibC::LPWSTR
    friendly_name : LibC::LPWSTR
    physical_address : UInt8[8]*
    physical_address_length : UInt32
    anonymous2 : IP_ADAPTER_ADDRESSES_LH_Anonymous2_e__Union
    mtu : UInt32
    if_type : UInt32
    oper_status : IF_OPER_STATUS
    ipv6_if_index : UInt32
    zone_indices : UInt32[16]*
    first_prefix : IP_ADAPTER_PREFIX_XP*
    transmit_link_speed : UInt64
    receive_link_speed : UInt64
    first_wins_server_address : IP_ADAPTER_WINS_SERVER_ADDRESS_LH*
    first_gateway_address : IP_ADAPTER_GATEWAY_ADDRESS_LH*
    ipv4_metric : UInt32
    ipv6_metric : UInt32
    luid : NET_LUID_LH
    dhcpv4_server : SOCKET_ADDRESS
    compartment_id : UInt32
    network_guid : Guid
    connection_type : NET_IF_CONNECTION_TYPE
    tunnel_type : TUNNEL_TYPE
    dhcpv6_server : SOCKET_ADDRESS
    dhcpv6_client_duid : UInt8[130]*
    dhcpv6_client_duid_length : UInt32
    dhcpv6_iaid : UInt32
    first_dns_suffix : IP_ADAPTER_DNS_SUFFIX*
  end
  struct IP_ADAPTER_ADDRESSES_LH_Anonymous2_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct IP_ADAPTER_ADDRESSES_LH_Anonymous1_e__Union_Anonymous_e__Struct
    length : UInt32
    if_index : UInt32
  end
  struct IP_ADAPTER_ADDRESSES_XP
    anonymous : IP_ADAPTER_ADDRESSES_XP_Anonymous_e__Union
    next : IP_ADAPTER_ADDRESSES_XP*
    adapter_name : PSTR
    first_unicast_address : IP_ADAPTER_UNICAST_ADDRESS_XP*
    first_anycast_address : IP_ADAPTER_ANYCAST_ADDRESS_XP*
    first_multicast_address : IP_ADAPTER_MULTICAST_ADDRESS_XP*
    first_dns_server_address : IP_ADAPTER_DNS_SERVER_ADDRESS_XP*
    dns_suffix : LibC::LPWSTR
    description : LibC::LPWSTR
    friendly_name : LibC::LPWSTR
    physical_address : UInt8[8]*
    physical_address_length : UInt32
    flags : UInt32
    mtu : UInt32
    if_type : UInt32
    oper_status : IF_OPER_STATUS
    ipv6_if_index : UInt32
    zone_indices : UInt32[16]*
    first_prefix : IP_ADAPTER_PREFIX_XP*
  end
  struct IP_ADAPTER_ADDRESSES_XP_Anonymous_e__Union_Anonymous_e__Struct
    length : UInt32
    if_index : UInt32
  end
  struct IP_PER_ADAPTER_INFO_W2KSP1
    autoconfig_enabled : UInt32
    autoconfig_active : UInt32
    current_dns_server : IP_ADDR_STRING*
    dns_server_list : IP_ADDR_STRING
  end
  struct FIXED_INFO_W2KSP1
    host_name : CHAR[132]*
    domain_name : CHAR[132]*
    current_dns_server : IP_ADDR_STRING*
    dns_server_list : IP_ADDR_STRING
    node_type : UInt32
    scope_id : CHAR[260]*
    enable_routing : UInt32
    enable_proxy : UInt32
    enable_dns : UInt32
  end
  struct Ip_interface_name_info_w2ksp1
    index : UInt32
    media_type : UInt32
    connection_type : UInt8
    access_type : UInt8
    device_guid : Guid
    interface_guid : Guid
  end
  struct TCP_ESTATS_SYN_OPTS_ROS_v0
    active_open : BOOLEAN
    mss_rcvd : UInt32
    mss_sent : UInt32
  end
  struct TCP_ESTATS_DATA_ROD_v0
    data_bytes_out : UInt64
    data_segs_out : UInt64
    data_bytes_in : UInt64
    data_segs_in : UInt64
    segs_out : UInt64
    segs_in : UInt64
    soft_errors : UInt32
    soft_error_reason : UInt32
    snd_una : UInt32
    snd_nxt : UInt32
    snd_max : UInt32
    thru_bytes_acked : UInt64
    rcv_nxt : UInt32
    thru_bytes_received : UInt64
  end
  struct TCP_ESTATS_DATA_RW_v0
    enable_collection : BOOLEAN
  end
  struct TCP_ESTATS_SND_CONG_ROD_v0
    snd_lim_trans_rwin : UInt32
    snd_lim_time_rwin : UInt32
    snd_lim_bytes_rwin : LibC::UINT_PTR
    snd_lim_trans_cwnd : UInt32
    snd_lim_time_cwnd : UInt32
    snd_lim_bytes_cwnd : LibC::UINT_PTR
    snd_lim_trans_snd : UInt32
    snd_lim_time_snd : UInt32
    snd_lim_bytes_snd : LibC::UINT_PTR
    slow_start : UInt32
    cong_avoid : UInt32
    other_reductions : UInt32
    cur_cwnd : UInt32
    max_ss_cwnd : UInt32
    max_ca_cwnd : UInt32
    cur_ssthresh : UInt32
    max_ssthresh : UInt32
    min_ssthresh : UInt32
  end
  struct TCP_ESTATS_SND_CONG_ROS_v0
    lim_cwnd : UInt32
  end
  struct TCP_ESTATS_SND_CONG_RW_v0
    enable_collection : BOOLEAN
  end
  struct TCP_ESTATS_PATH_ROD_v0
    fast_retran : UInt32
    timeouts : UInt32
    subsequent_timeouts : UInt32
    cur_timeout_count : UInt32
    abrupt_timeouts : UInt32
    pkts_retrans : UInt32
    bytes_retrans : UInt32
    dup_acks_in : UInt32
    sacks_rcvd : UInt32
    sack_blocks_rcvd : UInt32
    cong_signals : UInt32
    pre_cong_sum_cwnd : UInt32
    pre_cong_sum_rtt : UInt32
    post_cong_sum_rtt : UInt32
    post_cong_count_rtt : UInt32
    ecn_signals : UInt32
    ece_rcvd : UInt32
    send_stall : UInt32
    quench_rcvd : UInt32
    retran_thresh : UInt32
    snd_dup_ack_episodes : UInt32
    sum_bytes_reordered : UInt32
    non_recov_da : UInt32
    non_recov_da_episodes : UInt32
    ack_after_fr : UInt32
    dsack_dups : UInt32
    sample_rtt : UInt32
    smoothed_rtt : UInt32
    rtt_var : UInt32
    max_rtt : UInt32
    min_rtt : UInt32
    sum_rtt : UInt32
    count_rtt : UInt32
    cur_rto : UInt32
    max_rto : UInt32
    min_rto : UInt32
    cur_mss : UInt32
    max_mss : UInt32
    min_mss : UInt32
    spurious_rto_detections : UInt32
  end
  struct TCP_ESTATS_PATH_RW_v0
    enable_collection : BOOLEAN
  end
  struct TCP_ESTATS_SEND_BUFF_ROD_v0
    cur_retx_queue : LibC::UINT_PTR
    max_retx_queue : LibC::UINT_PTR
    cur_app_w_queue : LibC::UINT_PTR
    max_app_w_queue : LibC::UINT_PTR
  end
  struct TCP_ESTATS_SEND_BUFF_RW_v0
    enable_collection : BOOLEAN
  end
  struct TCP_ESTATS_REC_ROD_v0
    cur_rwin_sent : UInt32
    max_rwin_sent : UInt32
    min_rwin_sent : UInt32
    lim_rwin : UInt32
    dup_ack_episodes : UInt32
    dup_acks_out : UInt32
    ce_rcvd : UInt32
    ecn_sent : UInt32
    ecn_nonces_rcvd : UInt32
    cur_reasm_queue : UInt32
    max_reasm_queue : UInt32
    cur_app_r_queue : LibC::UINT_PTR
    max_app_r_queue : LibC::UINT_PTR
    win_scale_sent : UInt8
  end
  struct TCP_ESTATS_REC_RW_v0
    enable_collection : BOOLEAN
  end
  struct TCP_ESTATS_OBS_REC_ROD_v0
    cur_rwin_rcvd : UInt32
    max_rwin_rcvd : UInt32
    min_rwin_rcvd : UInt32
    win_scale_rcvd : UInt8
  end
  struct TCP_ESTATS_OBS_REC_RW_v0
    enable_collection : BOOLEAN
  end
  struct TCP_ESTATS_BANDWIDTH_RW_v0
    enable_collection_outbound : TCP_BOOLEAN_OPTIONAL
    enable_collection_inbound : TCP_BOOLEAN_OPTIONAL
  end
  struct TCP_ESTATS_BANDWIDTH_ROD_v0
    outbound_bandwidth : UInt64
    inbound_bandwidth : UInt64
    outbound_instability : UInt64
    inbound_instability : UInt64
    outbound_bandwidth_peaked : BOOLEAN
    inbound_bandwidth_peaked : BOOLEAN
  end
  struct TCP_ESTATS_FINE_RTT_RW_v0
    enable_collection : BOOLEAN
  end
  struct TCP_ESTATS_FINE_RTT_ROD_v0
    rtt_var : UInt32
    max_rtt : UInt32
    min_rtt : UInt32
    sum_rtt : UInt32
  end
  struct INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES
    ptp_v2_over_udp_i_pv4_event_message_receive : BOOLEAN
    ptp_v2_over_udp_i_pv4_all_message_receive : BOOLEAN
    ptp_v2_over_udp_i_pv4_event_message_transmit : BOOLEAN
    ptp_v2_over_udp_i_pv4_all_message_transmit : BOOLEAN
    ptp_v2_over_udp_i_pv6_event_message_receive : BOOLEAN
    ptp_v2_over_udp_i_pv6_all_message_receive : BOOLEAN
    ptp_v2_over_udp_i_pv6_event_message_transmit : BOOLEAN
    ptp_v2_over_udp_i_pv6_all_message_transmit : BOOLEAN
    all_receive : BOOLEAN
    all_transmit : BOOLEAN
    tagged_transmit : BOOLEAN
  end
  struct INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES
    all_receive : BOOLEAN
    all_transmit : BOOLEAN
    tagged_transmit : BOOLEAN
  end
  struct INTERFACE_TIMESTAMP_CAPABILITIES
    hardware_clock_frequency_hz : UInt64
    supports_cross_timestamp : BOOLEAN
    hardware_capabilities : INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES
    software_capabilities : INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES
  end
  struct INTERFACE_HARDWARE_CROSSTIMESTAMP
    system_timestamp1 : UInt64
    hardware_clock_timestamp : UInt64
    system_timestamp2 : UInt64
  end
  struct PF_FILTER_DESCRIPTOR
    dw_filter_flags : UInt32
    dw_rule : UInt32
    pfat_type : PFADDRESSTYPE
    src_addr : UInt8*
    src_mask : UInt8*
    dst_addr : UInt8*
    dst_mask : UInt8*
    dw_protocol : UInt32
    f_late_bound : UInt32
    w_src_port : UInt16
    w_dst_port : UInt16
    w_src_port_high_range : UInt16
    w_dst_port_high_range : UInt16
  end
  struct PF_FILTER_STATS
    dw_num_packets_filtered : UInt32
    info : PF_FILTER_DESCRIPTOR
  end
  struct PF_INTERFACE_STATS
    pv_driver_context : Void*
    dw_flags : UInt32
    dw_in_drops : UInt32
    dw_out_drops : UInt32
    ea_in_action : PFFORWARD_ACTION
    ea_out_action : PFFORWARD_ACTION
    dw_num_in_filters : UInt32
    dw_num_out_filters : UInt32
    dw_frag : UInt32
    dw_spoof : UInt32
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
    li_syn : LARGE_INTEGER
    li_total_logged : LARGE_INTEGER
    dw_lost_log_entries : UInt32
    filter_info : PF_FILTER_STATS[0]*
  end
  struct PF_LATEBIND_INFO
    src_addr : UInt8*
    dst_addr : UInt8*
    mask : UInt8*
  end
  struct PFLOGFRAME
    timestamp : LARGE_INTEGER
    pfe_type_of_frame : PFFRAMETYPE
    dw_total_size_used : UInt32
    dw_filter_rule : UInt32
    w_size_of_additional_data : UInt16
    w_size_of_ip_header : UInt16
    dw_interface_name : UInt32
    dw_ip_index : UInt32
    b_packet_data : UInt8[0]*
  end


  # Params # row : MIB_IF_ROW2* [In]
  fun GetIfEntry2(row : MIB_IF_ROW2*) : NTSTATUS

  # Params # level : MIB_IF_ENTRY_LEVEL [In],row : MIB_IF_ROW2* [In]
  fun GetIfEntry2Ex(level : MIB_IF_ENTRY_LEVEL, row : MIB_IF_ROW2*) : NTSTATUS

  # Params # table : MIB_IF_TABLE2** [In]
  fun GetIfTable2(table : MIB_IF_TABLE2**) : NTSTATUS

  # Params # level : MIB_IF_TABLE_LEVEL [In],table : MIB_IF_TABLE2** [In]
  fun GetIfTable2Ex(level : MIB_IF_TABLE_LEVEL, table : MIB_IF_TABLE2**) : NTSTATUS

  # Params # table : MIB_IFSTACK_TABLE** [In]
  fun GetIfStackTable(table : MIB_IFSTACK_TABLE**) : NTSTATUS

  # Params # table : MIB_INVERTEDIFSTACK_TABLE** [In]
  fun GetInvertedIfStackTable(table : MIB_INVERTEDIFSTACK_TABLE**) : NTSTATUS

  # Params # row : MIB_IPINTERFACE_ROW* [In]
  fun GetIpInterfaceEntry(row : MIB_IPINTERFACE_ROW*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_IPINTERFACE_TABLE** [In]
  fun GetIpInterfaceTable(family : UInt16, table : MIB_IPINTERFACE_TABLE**) : NTSTATUS

  # Params # row : MIB_IPINTERFACE_ROW* [In]
  fun InitializeIpInterfaceEntry(row : MIB_IPINTERFACE_ROW*)

  # Params # family : UInt16 [In],callback : PIPINTERFACE_CHANGE_CALLBACK [In],callercontext : Void* [In],initialnotification : BOOLEAN [In],notificationhandle : LibC::HANDLE* [In]
  fun NotifyIpInterfaceChange(family : UInt16, callback : PIPINTERFACE_CHANGE_CALLBACK, callercontext : Void*, initialnotification : BOOLEAN, notificationhandle : LibC::HANDLE*) : NTSTATUS

  # Params # row : MIB_IPINTERFACE_ROW* [In]
  fun SetIpInterfaceEntry(row : MIB_IPINTERFACE_ROW*) : NTSTATUS

  # Params # interfaceindex : UInt32 [In],addressfamily : UInt16 [In],bandwidthestimates : MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES* [In]
  fun GetIpNetworkConnectionBandwidthEstimates(interfaceindex : UInt32, addressfamily : UInt16, bandwidthestimates : MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES*) : NTSTATUS

  # Params # row : MIB_UNICASTIPADDRESS_ROW* [In]
  fun CreateUnicastIpAddressEntry(row : MIB_UNICASTIPADDRESS_ROW*) : NTSTATUS

  # Params # row : MIB_UNICASTIPADDRESS_ROW* [In]
  fun DeleteUnicastIpAddressEntry(row : MIB_UNICASTIPADDRESS_ROW*) : NTSTATUS

  # Params # row : MIB_UNICASTIPADDRESS_ROW* [In]
  fun GetUnicastIpAddressEntry(row : MIB_UNICASTIPADDRESS_ROW*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_UNICASTIPADDRESS_TABLE** [In]
  fun GetUnicastIpAddressTable(family : UInt16, table : MIB_UNICASTIPADDRESS_TABLE**) : NTSTATUS

  # Params # row : MIB_UNICASTIPADDRESS_ROW* [In]
  fun InitializeUnicastIpAddressEntry(row : MIB_UNICASTIPADDRESS_ROW*)

  # Params # family : UInt16 [In],callback : PUNICAST_IPADDRESS_CHANGE_CALLBACK [In],callercontext : Void* [In],initialnotification : BOOLEAN [In],notificationhandle : LibC::HANDLE* [In]
  fun NotifyUnicastIpAddressChange(family : UInt16, callback : PUNICAST_IPADDRESS_CHANGE_CALLBACK, callercontext : Void*, initialnotification : BOOLEAN, notificationhandle : LibC::HANDLE*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_UNICASTIPADDRESS_TABLE** [In],callercallback : PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK [In],callercontext : Void* [In],notificationhandle : LibC::HANDLE* [In]
  fun NotifyStableUnicastIpAddressTable(family : UInt16, table : MIB_UNICASTIPADDRESS_TABLE**, callercallback : PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK, callercontext : Void*, notificationhandle : LibC::HANDLE*) : NTSTATUS

  # Params # row : MIB_UNICASTIPADDRESS_ROW* [In]
  fun SetUnicastIpAddressEntry(row : MIB_UNICASTIPADDRESS_ROW*) : NTSTATUS

  # Params # row : MIB_ANYCASTIPADDRESS_ROW* [In]
  fun CreateAnycastIpAddressEntry(row : MIB_ANYCASTIPADDRESS_ROW*) : NTSTATUS

  # Params # row : MIB_ANYCASTIPADDRESS_ROW* [In]
  fun DeleteAnycastIpAddressEntry(row : MIB_ANYCASTIPADDRESS_ROW*) : NTSTATUS

  # Params # row : MIB_ANYCASTIPADDRESS_ROW* [In]
  fun GetAnycastIpAddressEntry(row : MIB_ANYCASTIPADDRESS_ROW*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_ANYCASTIPADDRESS_TABLE** [In]
  fun GetAnycastIpAddressTable(family : UInt16, table : MIB_ANYCASTIPADDRESS_TABLE**) : NTSTATUS

  # Params # row : MIB_MULTICASTIPADDRESS_ROW* [In]
  fun GetMulticastIpAddressEntry(row : MIB_MULTICASTIPADDRESS_ROW*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_MULTICASTIPADDRESS_TABLE** [In]
  fun GetMulticastIpAddressTable(family : UInt16, table : MIB_MULTICASTIPADDRESS_TABLE**) : NTSTATUS

  # Params # row : MIB_IPFORWARD_ROW2* [In]
  fun CreateIpForwardEntry2(row : MIB_IPFORWARD_ROW2*) : NTSTATUS

  # Params # row : MIB_IPFORWARD_ROW2* [In]
  fun DeleteIpForwardEntry2(row : MIB_IPFORWARD_ROW2*) : NTSTATUS

  # Params # interfaceluid : NET_LUID_LH* [In],interfaceindex : UInt32 [In],sourceaddress : SOCKADDR_INET* [In],destinationaddress : SOCKADDR_INET* [In],addresssortoptions : UInt32 [In],bestroute : MIB_IPFORWARD_ROW2* [In],bestsourceaddress : SOCKADDR_INET* [In]
  fun GetBestRoute2(interfaceluid : NET_LUID_LH*, interfaceindex : UInt32, sourceaddress : SOCKADDR_INET*, destinationaddress : SOCKADDR_INET*, addresssortoptions : UInt32, bestroute : MIB_IPFORWARD_ROW2*, bestsourceaddress : SOCKADDR_INET*) : NTSTATUS

  # Params # row : MIB_IPFORWARD_ROW2* [In]
  fun GetIpForwardEntry2(row : MIB_IPFORWARD_ROW2*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_IPFORWARD_TABLE2** [In]
  fun GetIpForwardTable2(family : UInt16, table : MIB_IPFORWARD_TABLE2**) : NTSTATUS

  # Params # row : MIB_IPFORWARD_ROW2* [In]
  fun InitializeIpForwardEntry(row : MIB_IPFORWARD_ROW2*)

  # Params # addressfamily : UInt16 [In],callback : PIPFORWARD_CHANGE_CALLBACK [In],callercontext : Void* [In],initialnotification : BOOLEAN [In],notificationhandle : LibC::HANDLE* [In]
  fun NotifyRouteChange2(addressfamily : UInt16, callback : PIPFORWARD_CHANGE_CALLBACK, callercontext : Void*, initialnotification : BOOLEAN, notificationhandle : LibC::HANDLE*) : NTSTATUS

  # Params # route : MIB_IPFORWARD_ROW2* [In]
  fun SetIpForwardEntry2(route : MIB_IPFORWARD_ROW2*) : NTSTATUS

  # Params # family : UInt16 [In]
  fun FlushIpPathTable(family : UInt16) : NTSTATUS

  # Params # row : MIB_IPPATH_ROW* [In]
  fun GetIpPathEntry(row : MIB_IPPATH_ROW*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_IPPATH_TABLE** [In]
  fun GetIpPathTable(family : UInt16, table : MIB_IPPATH_TABLE**) : NTSTATUS

  # Params # row : MIB_IPNET_ROW2* [In]
  fun CreateIpNetEntry2(row : MIB_IPNET_ROW2*) : NTSTATUS

  # Params # row : MIB_IPNET_ROW2* [In]
  fun DeleteIpNetEntry2(row : MIB_IPNET_ROW2*) : NTSTATUS

  # Params # family : UInt16 [In],interfaceindex : UInt32 [In]
  fun FlushIpNetTable2(family : UInt16, interfaceindex : UInt32) : NTSTATUS

  # Params # row : MIB_IPNET_ROW2* [In]
  fun GetIpNetEntry2(row : MIB_IPNET_ROW2*) : NTSTATUS

  # Params # family : UInt16 [In],table : MIB_IPNET_TABLE2** [In]
  fun GetIpNetTable2(family : UInt16, table : MIB_IPNET_TABLE2**) : NTSTATUS

  # Params # row : MIB_IPNET_ROW2* [In],sourceaddress : SOCKADDR_INET* [In]
  fun ResolveIpNetEntry2(row : MIB_IPNET_ROW2*, sourceaddress : SOCKADDR_INET*) : NTSTATUS

  # Params # row : MIB_IPNET_ROW2* [In]
  fun SetIpNetEntry2(row : MIB_IPNET_ROW2*) : NTSTATUS

  # Params # callback : PTEREDO_PORT_CHANGE_CALLBACK [In],callercontext : Void* [In],initialnotification : BOOLEAN [In],notificationhandle : LibC::HANDLE* [In]
  fun NotifyTeredoPortChange(callback : PTEREDO_PORT_CHANGE_CALLBACK, callercontext : Void*, initialnotification : BOOLEAN, notificationhandle : LibC::HANDLE*) : NTSTATUS

  # Params # port : UInt16* [In]
  fun GetTeredoPort(port : UInt16*) : NTSTATUS

  # Params # notificationhandle : LibC::HANDLE [In]
  fun CancelMibChangeNotify2(notificationhandle : LibC::HANDLE) : NTSTATUS

  # Params # memory : Void* [In]
  fun FreeMibTable(memory : Void*)

  # Params # sourceaddresslist : SOCKADDR_IN6* [In],sourceaddresscount : UInt32 [In],destinationaddresslist : SOCKADDR_IN6* [In],destinationaddresscount : UInt32 [In],addresssortoptions : UInt32 [In],sortedaddresspairlist : SOCKADDR_IN6_PAIR** [In],sortedaddresspaircount : UInt32* [In]
  fun CreateSortedAddressPairs(sourceaddresslist : SOCKADDR_IN6*, sourceaddresscount : UInt32, destinationaddresslist : SOCKADDR_IN6*, destinationaddresscount : UInt32, addresssortoptions : UInt32, sortedaddresspairlist : SOCKADDR_IN6_PAIR**, sortedaddresspaircount : UInt32*) : NTSTATUS

  # Params # compartmentguid : Guid* [In],compartmentid : UInt32* [In]
  fun ConvertCompartmentGuidToId(compartmentguid : Guid*, compartmentid : UInt32*) : NTSTATUS

  # Params # compartmentid : UInt32 [In],compartmentguid : Guid* [In]
  fun ConvertCompartmentIdToGuid(compartmentid : UInt32, compartmentguid : Guid*) : NTSTATUS

  # Params # interfacename : PSTR [In],interfaceluid : NET_LUID_LH* [In]
  fun ConvertInterfaceNameToLuidA(interfacename : PSTR, interfaceluid : NET_LUID_LH*) : NTSTATUS

  # Params # interfacename : LibC::LPWSTR [In],interfaceluid : NET_LUID_LH* [In]
  fun ConvertInterfaceNameToLuidW(interfacename : LibC::LPWSTR, interfaceluid : NET_LUID_LH*) : NTSTATUS

  # Params # interfaceluid : NET_LUID_LH* [In],interfacename : UInt8* [In],length : LibC::UINT_PTR [In]
  fun ConvertInterfaceLuidToNameA(interfaceluid : NET_LUID_LH*, interfacename : UInt8*, length : LibC::UINT_PTR) : NTSTATUS

  # Params # interfaceluid : NET_LUID_LH* [In],interfacename : Char* [In],length : LibC::UINT_PTR [In]
  fun ConvertInterfaceLuidToNameW(interfaceluid : NET_LUID_LH*, interfacename : Char*, length : LibC::UINT_PTR) : NTSTATUS

  # Params # interfaceluid : NET_LUID_LH* [In],interfaceindex : UInt32* [In]
  fun ConvertInterfaceLuidToIndex(interfaceluid : NET_LUID_LH*, interfaceindex : UInt32*) : NTSTATUS

  # Params # interfaceindex : UInt32 [In],interfaceluid : NET_LUID_LH* [In]
  fun ConvertInterfaceIndexToLuid(interfaceindex : UInt32, interfaceluid : NET_LUID_LH*) : NTSTATUS

  # Params # interfaceluid : NET_LUID_LH* [In],interfacealias : Char* [In],length : LibC::UINT_PTR [In]
  fun ConvertInterfaceLuidToAlias(interfaceluid : NET_LUID_LH*, interfacealias : Char*, length : LibC::UINT_PTR) : NTSTATUS

  # Params # interfacealias : LibC::LPWSTR [In],interfaceluid : NET_LUID_LH* [In]
  fun ConvertInterfaceAliasToLuid(interfacealias : LibC::LPWSTR, interfaceluid : NET_LUID_LH*) : NTSTATUS

  # Params # interfaceluid : NET_LUID_LH* [In],interfaceguid : Guid* [In]
  fun ConvertInterfaceLuidToGuid(interfaceluid : NET_LUID_LH*, interfaceguid : Guid*) : NTSTATUS

  # Params # interfaceguid : Guid* [In],interfaceluid : NET_LUID_LH* [In]
  fun ConvertInterfaceGuidToLuid(interfaceguid : Guid*, interfaceluid : NET_LUID_LH*) : NTSTATUS

  # Params # interfacename : PSTR [In]
  fun if_nametoindex(interfacename : PSTR) : UInt32

  # Params # interfaceindex : UInt32 [In],interfacename : UInt8* [In]
  fun if_indextoname(interfaceindex : UInt32, interfacename : UInt8*) : PSTR

  # Params # 
  fun GetCurrentThreadCompartmentId : UInt32

  # Params # compartmentid : UInt32 [In]
  fun SetCurrentThreadCompartmentId(compartmentid : UInt32) : NTSTATUS

  # Params # compartmentscope : UInt32* [In],compartmentid : UInt32* [In]
  fun GetCurrentThreadCompartmentScope(compartmentscope : UInt32*, compartmentid : UInt32*)

  # Params # compartmentscope : UInt32 [In]
  fun SetCurrentThreadCompartmentScope(compartmentscope : UInt32) : NTSTATUS

  # Params # jobhandle : LibC::HANDLE [In]
  fun GetJobCompartmentId(jobhandle : LibC::HANDLE) : UInt32

  # Params # jobhandle : LibC::HANDLE [In],compartmentid : UInt32 [In]
  fun SetJobCompartmentId(jobhandle : LibC::HANDLE, compartmentid : UInt32) : NTSTATUS

  # Params # sessionid : UInt32 [In]
  fun GetSessionCompartmentId(sessionid : UInt32) : UInt32

  # Params # sessionid : UInt32 [In],compartmentid : UInt32 [In]
  fun SetSessionCompartmentId(sessionid : UInt32, compartmentid : UInt32) : NTSTATUS

  # Params # 
  fun GetDefaultCompartmentId : UInt32

  # Params # networkguid : Guid* [In],compartmentid : UInt32* [In],siteid : UInt32* [In],networkname : Char* [In],length : UInt32 [In]
  fun GetNetworkInformation(networkguid : Guid*, compartmentid : UInt32*, siteid : UInt32*, networkname : Char*, length : UInt32) : NTSTATUS

  # Params # networkguid : Guid* [In],compartmentid : UInt32 [In],networkname : LibC::LPWSTR [In]
  fun SetNetworkInformation(networkguid : Guid*, compartmentid : UInt32, networkname : LibC::LPWSTR) : NTSTATUS

  # Params # masklength : UInt32 [In],mask : UInt32* [In]
  fun ConvertLengthToIpv4Mask(masklength : UInt32, mask : UInt32*) : NTSTATUS

  # Params # mask : UInt32 [In],masklength : UInt8* [In]
  fun ConvertIpv4MaskToLength(mask : UInt32, masklength : UInt8*) : NTSTATUS

  # Params # settings : DNS_SETTINGS* [In]
  fun GetDnsSettings(settings : DNS_SETTINGS*) : NTSTATUS

  # Params # settings : DNS_SETTINGS* [In]
  fun FreeDnsSettings(settings : DNS_SETTINGS*)

  # Params # settings : DNS_SETTINGS* [In]
  fun SetDnsSettings(settings : DNS_SETTINGS*) : NTSTATUS

  # Params # interface : Guid [In],settings : DNS_INTERFACE_SETTINGS* [In]
  fun GetInterfaceDnsSettings(interface : Guid, settings : DNS_INTERFACE_SETTINGS*) : NTSTATUS

  # Params # settings : DNS_INTERFACE_SETTINGS* [In]
  fun FreeInterfaceDnsSettings(settings : DNS_INTERFACE_SETTINGS*)

  # Params # interface : Guid [In],settings : DNS_INTERFACE_SETTINGS* [In]
  fun SetInterfaceDnsSettings(interface : Guid, settings : DNS_INTERFACE_SETTINGS*) : NTSTATUS

  # Params # connectivityhint : NL_NETWORK_CONNECTIVITY_HINT* [In]
  fun GetNetworkConnectivityHint(connectivityhint : NL_NETWORK_CONNECTIVITY_HINT*) : NTSTATUS

  # Params # interfaceindex : UInt32 [In],connectivityhint : NL_NETWORK_CONNECTIVITY_HINT* [In]
  fun GetNetworkConnectivityHintForInterface(interfaceindex : UInt32, connectivityhint : NL_NETWORK_CONNECTIVITY_HINT*) : NTSTATUS

  # Params # callback : PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK [In],callercontext : Void* [In],initialnotification : BOOLEAN [In],notificationhandle : LibC::HANDLE* [In]
  fun NotifyNetworkConnectivityHintChange(callback : PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK, callercontext : Void*, initialnotification : BOOLEAN, notificationhandle : LibC::HANDLE*) : NTSTATUS

  # Params # 
  fun IcmpCreateFile : IcmpHandle

  # Params # 
  fun Icmp6CreateFile : IcmpHandle

  # Params # icmphandle : IcmpHandle [In]
  fun IcmpCloseHandle(icmphandle : IcmpHandle) : LibC::BOOL

  # Params # icmphandle : IcmpHandle [In],destinationaddress : UInt32 [In],requestdata : Void* [In],requestsize : UInt16 [In],requestoptions : Ip_option_information* [In],replybuffer : Void* [In],replysize : UInt32 [In],timeout : UInt32 [In]
  fun IcmpSendEcho(icmphandle : IcmpHandle, destinationaddress : UInt32, requestdata : Void*, requestsize : UInt16, requestoptions : Ip_option_information*, replybuffer : Void*, replysize : UInt32, timeout : UInt32) : UInt32

  # Params # icmphandle : IcmpHandle [In],event : LibC::HANDLE [In],apcroutine : PIO_APC_ROUTINE [In],apccontext : Void* [In],destinationaddress : UInt32 [In],requestdata : Void* [In],requestsize : UInt16 [In],requestoptions : Ip_option_information* [In],replybuffer : Void* [In],replysize : UInt32 [In],timeout : UInt32 [In]
  fun IcmpSendEcho2(icmphandle : IcmpHandle, event : LibC::HANDLE, apcroutine : PIO_APC_ROUTINE, apccontext : Void*, destinationaddress : UInt32, requestdata : Void*, requestsize : UInt16, requestoptions : Ip_option_information*, replybuffer : Void*, replysize : UInt32, timeout : UInt32) : UInt32

  # Params # icmphandle : IcmpHandle [In],event : LibC::HANDLE [In],apcroutine : PIO_APC_ROUTINE [In],apccontext : Void* [In],sourceaddress : UInt32 [In],destinationaddress : UInt32 [In],requestdata : Void* [In],requestsize : UInt16 [In],requestoptions : Ip_option_information* [In],replybuffer : Void* [In],replysize : UInt32 [In],timeout : UInt32 [In]
  fun IcmpSendEcho2Ex(icmphandle : IcmpHandle, event : LibC::HANDLE, apcroutine : PIO_APC_ROUTINE, apccontext : Void*, sourceaddress : UInt32, destinationaddress : UInt32, requestdata : Void*, requestsize : UInt16, requestoptions : Ip_option_information*, replybuffer : Void*, replysize : UInt32, timeout : UInt32) : UInt32

  # Params # icmphandle : IcmpHandle [In],event : LibC::HANDLE [In],apcroutine : PIO_APC_ROUTINE [In],apccontext : Void* [In],sourceaddress : SOCKADDR_IN6* [In],destinationaddress : SOCKADDR_IN6* [In],requestdata : Void* [In],requestsize : UInt16 [In],requestoptions : Ip_option_information* [In],replybuffer : Void* [In],replysize : UInt32 [In],timeout : UInt32 [In]
  fun Icmp6SendEcho2(icmphandle : IcmpHandle, event : LibC::HANDLE, apcroutine : PIO_APC_ROUTINE, apccontext : Void*, sourceaddress : SOCKADDR_IN6*, destinationaddress : SOCKADDR_IN6*, requestdata : Void*, requestsize : UInt16, requestoptions : Ip_option_information*, replybuffer : Void*, replysize : UInt32, timeout : UInt32) : UInt32

  # Params # replybuffer : Void* [In],replysize : UInt32 [In]
  fun IcmpParseReplies(replybuffer : Void*, replysize : UInt32) : UInt32

  # Params # replybuffer : Void* [In],replysize : UInt32 [In]
  fun Icmp6ParseReplies(replybuffer : Void*, replysize : UInt32) : UInt32

  # Params # pdwnumif : UInt32* [In]
  fun GetNumberOfInterfaces(pdwnumif : UInt32*) : UInt32

  # Params # pifrow : MIB_IFROW* [In]
  fun GetIfEntry(pifrow : MIB_IFROW*) : UInt32

  # Params # piftable : MIB_IFTABLE* [In],pdwsize : UInt32* [In],border : LibC::BOOL [In]
  fun GetIfTable(piftable : MIB_IFTABLE*, pdwsize : UInt32*, border : LibC::BOOL) : UInt32

  # Params # pipaddrtable : MIB_IPADDRTABLE* [In],pdwsize : UInt32* [In],border : LibC::BOOL [In]
  fun GetIpAddrTable(pipaddrtable : MIB_IPADDRTABLE*, pdwsize : UInt32*, border : LibC::BOOL) : UInt32

  # Params # ipnettable : MIB_IPNETTABLE* [In],sizepointer : UInt32* [In],order : LibC::BOOL [In]
  fun GetIpNetTable(ipnettable : MIB_IPNETTABLE*, sizepointer : UInt32*, order : LibC::BOOL) : UInt32

  # Params # pipforwardtable : MIB_IPFORWARDTABLE* [In],pdwsize : UInt32* [In],border : LibC::BOOL [In]
  fun GetIpForwardTable(pipforwardtable : MIB_IPFORWARDTABLE*, pdwsize : UInt32*, border : LibC::BOOL) : UInt32

  # Params # tcptable : MIB_TCPTABLE* [In],sizepointer : UInt32* [In],order : LibC::BOOL [In]
  fun GetTcpTable(tcptable : MIB_TCPTABLE*, sizepointer : UInt32*, order : LibC::BOOL) : UInt32

  # Params # ptcptable : Void* [In],pdwsize : UInt32* [In],border : LibC::BOOL [In],ulaf : UInt32 [In],tableclass : TCP_TABLE_CLASS [In],reserved : UInt32 [In]
  fun GetExtendedTcpTable(ptcptable : Void*, pdwsize : UInt32*, border : LibC::BOOL, ulaf : UInt32, tableclass : TCP_TABLE_CLASS, reserved : UInt32) : UInt32

  # Params # ptcpentry : MIB_TCPROW_OWNER_MODULE* [In],class : TCPIP_OWNER_MODULE_INFO_CLASS [In],pbuffer : Void* [In],pdwsize : UInt32* [In]
  fun GetOwnerModuleFromTcpEntry(ptcpentry : MIB_TCPROW_OWNER_MODULE*, class : TCPIP_OWNER_MODULE_INFO_CLASS, pbuffer : Void*, pdwsize : UInt32*) : UInt32

  # Params # udptable : MIB_UDPTABLE* [In],sizepointer : UInt32* [In],order : LibC::BOOL [In]
  fun GetUdpTable(udptable : MIB_UDPTABLE*, sizepointer : UInt32*, order : LibC::BOOL) : UInt32

  # Params # pudptable : Void* [In],pdwsize : UInt32* [In],border : LibC::BOOL [In],ulaf : UInt32 [In],tableclass : UDP_TABLE_CLASS [In],reserved : UInt32 [In]
  fun GetExtendedUdpTable(pudptable : Void*, pdwsize : UInt32*, border : LibC::BOOL, ulaf : UInt32, tableclass : UDP_TABLE_CLASS, reserved : UInt32) : UInt32

  # Params # pudpentry : MIB_UDPROW_OWNER_MODULE* [In],class : TCPIP_OWNER_MODULE_INFO_CLASS [In],pbuffer : Void* [In],pdwsize : UInt32* [In]
  fun GetOwnerModuleFromUdpEntry(pudpentry : MIB_UDPROW_OWNER_MODULE*, class : TCPIP_OWNER_MODULE_INFO_CLASS, pbuffer : Void*, pdwsize : UInt32*) : UInt32

  # Params # tcptable : MIB_TCPTABLE2* [In],sizepointer : UInt32* [In],order : LibC::BOOL [In]
  fun GetTcpTable2(tcptable : MIB_TCPTABLE2*, sizepointer : UInt32*, order : LibC::BOOL) : UInt32

  # Params # tcptable : MIB_TCP6TABLE* [In],sizepointer : UInt32* [In],order : LibC::BOOL [In]
  fun GetTcp6Table(tcptable : MIB_TCP6TABLE*, sizepointer : UInt32*, order : LibC::BOOL) : UInt32

  # Params # tcptable : MIB_TCP6TABLE2* [In],sizepointer : UInt32* [In],order : LibC::BOOL [In]
  fun GetTcp6Table2(tcptable : MIB_TCP6TABLE2*, sizepointer : UInt32*, order : LibC::BOOL) : UInt32

  # Params # row : MIB_TCPROW_LH* [In],estatstype : TCP_ESTATS_TYPE [In],rw : UInt8* [In],rwversion : UInt32 [In],rwsize : UInt32 [In],ros : UInt8* [In],rosversion : UInt32 [In],rossize : UInt32 [In],rod : UInt8* [In],rodversion : UInt32 [In],rodsize : UInt32 [In]
  fun GetPerTcpConnectionEStats(row : MIB_TCPROW_LH*, estatstype : TCP_ESTATS_TYPE, rw : UInt8*, rwversion : UInt32, rwsize : UInt32, ros : UInt8*, rosversion : UInt32, rossize : UInt32, rod : UInt8*, rodversion : UInt32, rodsize : UInt32) : UInt32

  # Params # row : MIB_TCPROW_LH* [In],estatstype : TCP_ESTATS_TYPE [In],rw : UInt8* [In],rwversion : UInt32 [In],rwsize : UInt32 [In],offset : UInt32 [In]
  fun SetPerTcpConnectionEStats(row : MIB_TCPROW_LH*, estatstype : TCP_ESTATS_TYPE, rw : UInt8*, rwversion : UInt32, rwsize : UInt32, offset : UInt32) : UInt32

  # Params # row : MIB_TCP6ROW* [In],estatstype : TCP_ESTATS_TYPE [In],rw : UInt8* [In],rwversion : UInt32 [In],rwsize : UInt32 [In],ros : UInt8* [In],rosversion : UInt32 [In],rossize : UInt32 [In],rod : UInt8* [In],rodversion : UInt32 [In],rodsize : UInt32 [In]
  fun GetPerTcp6ConnectionEStats(row : MIB_TCP6ROW*, estatstype : TCP_ESTATS_TYPE, rw : UInt8*, rwversion : UInt32, rwsize : UInt32, ros : UInt8*, rosversion : UInt32, rossize : UInt32, rod : UInt8*, rodversion : UInt32, rodsize : UInt32) : UInt32

  # Params # row : MIB_TCP6ROW* [In],estatstype : TCP_ESTATS_TYPE [In],rw : UInt8* [In],rwversion : UInt32 [In],rwsize : UInt32 [In],offset : UInt32 [In]
  fun SetPerTcp6ConnectionEStats(row : MIB_TCP6ROW*, estatstype : TCP_ESTATS_TYPE, rw : UInt8*, rwversion : UInt32, rwsize : UInt32, offset : UInt32) : UInt32

  # Params # ptcpentry : MIB_TCP6ROW_OWNER_MODULE* [In],class : TCPIP_OWNER_MODULE_INFO_CLASS [In],pbuffer : Void* [In],pdwsize : UInt32* [In]
  fun GetOwnerModuleFromTcp6Entry(ptcpentry : MIB_TCP6ROW_OWNER_MODULE*, class : TCPIP_OWNER_MODULE_INFO_CLASS, pbuffer : Void*, pdwsize : UInt32*) : UInt32

  # Params # udp6table : MIB_UDP6TABLE* [In],sizepointer : UInt32* [In],order : LibC::BOOL [In]
  fun GetUdp6Table(udp6table : MIB_UDP6TABLE*, sizepointer : UInt32*, order : LibC::BOOL) : UInt32

  # Params # pudpentry : MIB_UDP6ROW_OWNER_MODULE* [In],class : TCPIP_OWNER_MODULE_INFO_CLASS [In],pbuffer : Void* [In],pdwsize : UInt32* [In]
  fun GetOwnerModuleFromUdp6Entry(pudpentry : MIB_UDP6ROW_OWNER_MODULE*, class : TCPIP_OWNER_MODULE_INFO_CLASS, pbuffer : Void*, pdwsize : UInt32*) : UInt32

  # Params # ulpid : UInt32 [In],pinfo : UInt64* [In],class : TCPIP_OWNER_MODULE_INFO_CLASS [In],pbuffer : Void* [In],pdwsize : UInt32* [In]
  fun GetOwnerModuleFromPidAndInfo(ulpid : UInt32, pinfo : UInt64*, class : TCPIP_OWNER_MODULE_INFO_CLASS, pbuffer : Void*, pdwsize : UInt32*) : UInt32

  # Params # statistics : MIB_IPSTATS_LH* [In]
  fun GetIpStatistics(statistics : MIB_IPSTATS_LH*) : UInt32

  # Params # statistics : MIB_ICMP* [In]
  fun GetIcmpStatistics(statistics : MIB_ICMP*) : UInt32

  # Params # statistics : MIB_TCPSTATS_LH* [In]
  fun GetTcpStatistics(statistics : MIB_TCPSTATS_LH*) : UInt32

  # Params # stats : MIB_UDPSTATS* [In]
  fun GetUdpStatistics(stats : MIB_UDPSTATS*) : UInt32

  # Params # statistics : MIB_IPSTATS_LH* [In],family : UInt32 [In]
  fun SetIpStatisticsEx(statistics : MIB_IPSTATS_LH*, family : UInt32) : UInt32

  # Params # statistics : MIB_IPSTATS_LH* [In],family : ADDRESS_FAMILY [In]
  fun GetIpStatisticsEx(statistics : MIB_IPSTATS_LH*, family : ADDRESS_FAMILY) : UInt32

  # Params # statistics : MIB_ICMP_EX_XPSP1* [In],family : UInt32 [In]
  fun GetIcmpStatisticsEx(statistics : MIB_ICMP_EX_XPSP1*, family : UInt32) : UInt32

  # Params # statistics : MIB_TCPSTATS_LH* [In],family : ADDRESS_FAMILY [In]
  fun GetTcpStatisticsEx(statistics : MIB_TCPSTATS_LH*, family : ADDRESS_FAMILY) : UInt32

  # Params # statistics : MIB_UDPSTATS* [In],family : ADDRESS_FAMILY [In]
  fun GetUdpStatisticsEx(statistics : MIB_UDPSTATS*, family : ADDRESS_FAMILY) : UInt32

  # Params # statistics : MIB_TCPSTATS2* [In],family : ADDRESS_FAMILY [In]
  fun GetTcpStatisticsEx2(statistics : MIB_TCPSTATS2*, family : ADDRESS_FAMILY) : UInt32

  # Params # statistics : MIB_UDPSTATS2* [In],family : ADDRESS_FAMILY [In]
  fun GetUdpStatisticsEx2(statistics : MIB_UDPSTATS2*, family : ADDRESS_FAMILY) : UInt32

  # Params # pifrow : MIB_IFROW* [In]
  fun SetIfEntry(pifrow : MIB_IFROW*) : UInt32

  # Params # proute : MIB_IPFORWARDROW* [In]
  fun CreateIpForwardEntry(proute : MIB_IPFORWARDROW*) : UInt32

  # Params # proute : MIB_IPFORWARDROW* [In]
  fun SetIpForwardEntry(proute : MIB_IPFORWARDROW*) : UInt32

  # Params # proute : MIB_IPFORWARDROW* [In]
  fun DeleteIpForwardEntry(proute : MIB_IPFORWARDROW*) : UInt32

  # Params # pipstats : MIB_IPSTATS_LH* [In]
  fun SetIpStatistics(pipstats : MIB_IPSTATS_LH*) : UInt32

  # Params # nttl : UInt32 [In]
  fun SetIpTTL(nttl : UInt32) : UInt32

  # Params # parpentry : MIB_IPNETROW_LH* [In]
  fun CreateIpNetEntry(parpentry : MIB_IPNETROW_LH*) : UInt32

  # Params # parpentry : MIB_IPNETROW_LH* [In]
  fun SetIpNetEntry(parpentry : MIB_IPNETROW_LH*) : UInt32

  # Params # parpentry : MIB_IPNETROW_LH* [In]
  fun DeleteIpNetEntry(parpentry : MIB_IPNETROW_LH*) : UInt32

  # Params # dwifindex : UInt32 [In]
  fun FlushIpNetTable(dwifindex : UInt32) : UInt32

  # Params # dwaddress : UInt32 [In],dwmask : UInt32 [In],dwifindex : UInt32 [In]
  fun CreateProxyArpEntry(dwaddress : UInt32, dwmask : UInt32, dwifindex : UInt32) : UInt32

  # Params # dwaddress : UInt32 [In],dwmask : UInt32 [In],dwifindex : UInt32 [In]
  fun DeleteProxyArpEntry(dwaddress : UInt32, dwmask : UInt32, dwifindex : UInt32) : UInt32

  # Params # ptcprow : MIB_TCPROW_LH* [In]
  fun SetTcpEntry(ptcprow : MIB_TCPROW_LH*) : UInt32

  # Params # piftable : IP_INTERFACE_INFO* [In],dwoutbuflen : UInt32* [In]
  fun GetInterfaceInfo(piftable : IP_INTERFACE_INFO*, dwoutbuflen : UInt32*) : UInt32

  # Params # pipifinfo : IP_UNIDIRECTIONAL_ADAPTER_ADDRESS* [In],dwoutbuflen : UInt32* [In]
  fun GetUniDirectionalAdapterInfo(pipifinfo : IP_UNIDIRECTIONAL_ADAPTER_ADDRESS*, dwoutbuflen : UInt32*) : UInt32

  # Params # pptable : Ip_interface_name_info_w2ksp1** [In],pdwcount : UInt32* [In],border : LibC::BOOL [In],hheap : LibC::HANDLE [In],dwflags : UInt32 [In]
  fun NhpAllocateAndGetInterfaceInfoFromStack(pptable : Ip_interface_name_info_w2ksp1**, pdwcount : UInt32*, border : LibC::BOOL, hheap : LibC::HANDLE, dwflags : UInt32) : UInt32

  # Params # dwdestaddr : UInt32 [In],pdwbestifindex : UInt32* [In]
  fun GetBestInterface(dwdestaddr : UInt32, pdwbestifindex : UInt32*) : UInt32

  # Params # pdestaddr : SOCKADDR* [In],pdwbestifindex : UInt32* [In]
  fun GetBestInterfaceEx(pdestaddr : SOCKADDR*, pdwbestifindex : UInt32*) : UInt32

  # Params # dwdestaddr : UInt32 [In],dwsourceaddr : UInt32 [In],pbestroute : MIB_IPFORWARDROW* [In]
  fun GetBestRoute(dwdestaddr : UInt32, dwsourceaddr : UInt32, pbestroute : MIB_IPFORWARDROW*) : UInt32

  # Params # handle : LibC::HANDLE* [In],overlapped : OVERLAPPED* [In]
  fun NotifyAddrChange(handle : LibC::HANDLE*, overlapped : OVERLAPPED*) : UInt32

  # Params # handle : LibC::HANDLE* [In],overlapped : OVERLAPPED* [In]
  fun NotifyRouteChange(handle : LibC::HANDLE*, overlapped : OVERLAPPED*) : UInt32

  # Params # notifyoverlapped : OVERLAPPED* [In]
  fun CancelIPChangeNotify(notifyoverlapped : OVERLAPPED*) : LibC::BOOL

  # Params # adaptername : LibC::LPWSTR [In],ifindex : UInt32* [In]
  fun GetAdapterIndex(adaptername : LibC::LPWSTR, ifindex : UInt32*) : UInt32

  # Params # address : UInt32 [In],ipmask : UInt32 [In],ifindex : UInt32 [In],ntecontext : UInt32* [In],nteinstance : UInt32* [In]
  fun AddIPAddress(address : UInt32, ipmask : UInt32, ifindex : UInt32, ntecontext : UInt32*, nteinstance : UInt32*) : UInt32

  # Params # ntecontext : UInt32 [In]
  fun DeleteIPAddress(ntecontext : UInt32) : UInt32

  # Params # pfixedinfo : FIXED_INFO_W2KSP1* [In],poutbuflen : UInt32* [In]
  fun GetNetworkParams(pfixedinfo : FIXED_INFO_W2KSP1*, poutbuflen : UInt32*) : WIN32_ERROR

  # Params # adapterinfo : IP_ADAPTER_INFO* [In],sizepointer : UInt32* [In]
  fun GetAdaptersInfo(adapterinfo : IP_ADAPTER_INFO*, sizepointer : UInt32*) : UInt32

  # Params # 
  fun GetAdapterOrderMap : IP_ADAPTER_ORDER_MAP*

  # Params # family : ADDRESS_FAMILY [In],flags : GET_ADAPTERS_ADDRESSES_FLAGS [In],reserved : Void* [In],adapteraddresses : IP_ADAPTER_ADDRESSES_LH* [In],sizepointer : UInt32* [In]
  fun GetAdaptersAddresses(family : ADDRESS_FAMILY, flags : GET_ADAPTERS_ADDRESSES_FLAGS, reserved : Void*, adapteraddresses : IP_ADAPTER_ADDRESSES_LH*, sizepointer : UInt32*) : UInt32

  # Params # ifindex : UInt32 [In],pperadapterinfo : IP_PER_ADAPTER_INFO_W2KSP1* [In],poutbuflen : UInt32* [In]
  fun GetPerAdapterInfo(ifindex : UInt32, pperadapterinfo : IP_PER_ADAPTER_INFO_W2KSP1*, poutbuflen : UInt32*) : UInt32

  # Params # interfaceluid : NET_LUID_LH* [In],timestampcapabilites : INTERFACE_TIMESTAMP_CAPABILITIES* [In]
  fun GetInterfaceActiveTimestampCapabilities(interfaceluid : NET_LUID_LH*, timestampcapabilites : INTERFACE_TIMESTAMP_CAPABILITIES*) : UInt32

  # Params # interfaceluid : NET_LUID_LH* [In],timestampcapabilites : INTERFACE_TIMESTAMP_CAPABILITIES* [In]
  fun GetInterfaceSupportedTimestampCapabilities(interfaceluid : NET_LUID_LH*, timestampcapabilites : INTERFACE_TIMESTAMP_CAPABILITIES*) : UInt32

  # Params # interfaceluid : NET_LUID_LH* [In],crosstimestamp : INTERFACE_HARDWARE_CROSSTIMESTAMP* [In]
  fun CaptureInterfaceHardwareCrossTimestamp(interfaceluid : NET_LUID_LH*, crosstimestamp : INTERFACE_HARDWARE_CROSSTIMESTAMP*) : UInt32

  # Params # callback : PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK [In],callercontext : Void* [In],notificationhandle : HIFTIMESTAMPCHANGE* [In]
  fun RegisterInterfaceTimestampConfigChange(callback : PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK, callercontext : Void*, notificationhandle : HIFTIMESTAMPCHANGE*) : UInt32

  # Params # notificationhandle : HIFTIMESTAMPCHANGE [In]
  fun UnregisterInterfaceTimestampConfigChange(notificationhandle : HIFTIMESTAMPCHANGE)

  # Params # adapterinfo : IP_ADAPTER_INDEX_MAP* [In]
  fun IpReleaseAddress(adapterinfo : IP_ADAPTER_INDEX_MAP*) : UInt32

  # Params # adapterinfo : IP_ADAPTER_INDEX_MAP* [In]
  fun IpRenewAddress(adapterinfo : IP_ADAPTER_INDEX_MAP*) : UInt32

  # Params # destip : UInt32 [In],srcip : UInt32 [In],pmacaddr : Void* [In],phyaddrlen : UInt32* [In]
  fun SendARP(destip : UInt32, srcip : UInt32, pmacaddr : Void*, phyaddrlen : UInt32*) : UInt32

  # Params # destipaddress : UInt32 [In],hopcount : UInt32* [In],maxhops : UInt32 [In],rtt : UInt32* [In]
  fun GetRTTAndHopCount(destipaddress : UInt32, hopcount : UInt32*, maxhops : UInt32, rtt : UInt32*) : LibC::BOOL

  # Params # ifindex : UInt32 [In]
  fun GetFriendlyIfIndex(ifindex : UInt32) : UInt32

  # Params # phandle : LibC::HANDLE* [In],poverlapped : OVERLAPPED* [In]
  fun EnableRouter(phandle : LibC::HANDLE*, poverlapped : OVERLAPPED*) : UInt32

  # Params # poverlapped : OVERLAPPED* [In],lpdwenablecount : UInt32* [In]
  fun UnenableRouter(poverlapped : OVERLAPPED*, lpdwenablecount : UInt32*) : UInt32

  # Params # phandle : LibC::HANDLE* [In],poverlapped : OVERLAPPED* [In]
  fun DisableMediaSense(phandle : LibC::HANDLE*, poverlapped : OVERLAPPED*) : UInt32

  # Params # poverlapped : OVERLAPPED* [In],lpdwenablecount : UInt32* [In]
  fun RestoreMediaSense(poverlapped : OVERLAPPED*, lpdwenablecount : UInt32*) : UInt32

  # Params # errorcode : UInt32 [In],buffer : LibC::LPWSTR [In],size : UInt32* [In]
  fun GetIpErrorString(errorcode : UInt32, buffer : LibC::LPWSTR, size : UInt32*) : UInt32

  # Params # networkaddress : SOCKADDR* [In],physicaladdress : Void* [In],physicaladdresslength : UInt32* [In]
  fun ResolveNeighbor(networkaddress : SOCKADDR*, physicaladdress : Void*, physicaladdresslength : UInt32*) : UInt32

  # Params # startport : UInt16 [In],numberofports : UInt16 [In],token : UInt64* [In]
  fun CreatePersistentTcpPortReservation(startport : UInt16, numberofports : UInt16, token : UInt64*) : UInt32

  # Params # startport : UInt16 [In],numberofports : UInt16 [In],token : UInt64* [In]
  fun CreatePersistentUdpPortReservation(startport : UInt16, numberofports : UInt16, token : UInt64*) : UInt32

  # Params # startport : UInt16 [In],numberofports : UInt16 [In]
  fun DeletePersistentTcpPortReservation(startport : UInt16, numberofports : UInt16) : UInt32

  # Params # startport : UInt16 [In],numberofports : UInt16 [In]
  fun DeletePersistentUdpPortReservation(startport : UInt16, numberofports : UInt16) : UInt32

  # Params # startport : UInt16 [In],numberofports : UInt16 [In],token : UInt64* [In]
  fun LookupPersistentTcpPortReservation(startport : UInt16, numberofports : UInt16, token : UInt64*) : UInt32

  # Params # startport : UInt16 [In],numberofports : UInt16 [In],token : UInt64* [In]
  fun LookupPersistentUdpPortReservation(startport : UInt16, numberofports : UInt16, token : UInt64*) : UInt32

  # Params # dwname : UInt32 [In],inaction : PFFORWARD_ACTION [In],outaction : PFFORWARD_ACTION [In],buselog : LibC::BOOL [In],bmustbeunique : LibC::BOOL [In],ppinterface : Void** [In]
  fun PfCreateInterface(dwname : UInt32, inaction : PFFORWARD_ACTION, outaction : PFFORWARD_ACTION, buselog : LibC::BOOL, bmustbeunique : LibC::BOOL, ppinterface : Void**) : UInt32

  # Params # pinterface : Void* [In]
  fun PfDeleteInterface(pinterface : Void*) : UInt32

  # Params # ih : Void* [In],cinfilters : UInt32 [In],pfiltin : PF_FILTER_DESCRIPTOR* [In],coutfilters : UInt32 [In],pfiltout : PF_FILTER_DESCRIPTOR* [In],pfhandle : Void** [In]
  fun PfAddFiltersToInterface(ih : Void*, cinfilters : UInt32, pfiltin : PF_FILTER_DESCRIPTOR*, coutfilters : UInt32, pfiltout : PF_FILTER_DESCRIPTOR*, pfhandle : Void**) : UInt32

  # Params # ih : Void* [In],cinfilters : UInt32 [In],pfiltin : PF_FILTER_DESCRIPTOR* [In],coutfilters : UInt32 [In],pfiltout : PF_FILTER_DESCRIPTOR* [In]
  fun PfRemoveFiltersFromInterface(ih : Void*, cinfilters : UInt32, pfiltin : PF_FILTER_DESCRIPTOR*, coutfilters : UInt32, pfiltout : PF_FILTER_DESCRIPTOR*) : UInt32

  # Params # pinterface : Void* [In],cfilters : UInt32 [In],pvhandles : Void** [In]
  fun PfRemoveFilterHandles(pinterface : Void*, cfilters : UInt32, pvhandles : Void**) : UInt32

  # Params # pinterface : Void* [In]
  fun PfUnBindInterface(pinterface : Void*) : UInt32

  # Params # pinterface : Void* [In],dwindex : UInt32 [In],pfatlinktype : PFADDRESSTYPE [In],linkipaddress : UInt8* [In]
  fun PfBindInterfaceToIndex(pinterface : Void*, dwindex : UInt32, pfatlinktype : PFADDRESSTYPE, linkipaddress : UInt8*) : UInt32

  # Params # pinterface : Void* [In],pfattype : PFADDRESSTYPE [In],ipaddress : UInt8* [In]
  fun PfBindInterfaceToIPAddress(pinterface : Void*, pfattype : PFADDRESSTYPE, ipaddress : UInt8*) : UInt32

  # Params # pinterface : Void* [In],platebindinfo : PF_LATEBIND_INFO* [In]
  fun PfRebindFilters(pinterface : Void*, platebindinfo : PF_LATEBIND_INFO*) : UInt32

  # Params # pinterface : Void* [In],gffilter : GLOBAL_FILTER [In]
  fun PfAddGlobalFilterToInterface(pinterface : Void*, gffilter : GLOBAL_FILTER) : UInt32

  # Params # pinterface : Void* [In],gffilter : GLOBAL_FILTER [In]
  fun PfRemoveGlobalFilterFromInterface(pinterface : Void*, gffilter : GLOBAL_FILTER) : UInt32

  # Params # hevent : LibC::HANDLE [In]
  fun PfMakeLog(hevent : LibC::HANDLE) : UInt32

  # Params # pbbuffer : UInt8* [In],dwsize : UInt32 [In],dwthreshold : UInt32 [In],dwentries : UInt32 [In],pdwloggedentries : UInt32* [In],pdwlostentries : UInt32* [In],pdwsizeused : UInt32* [In]
  fun PfSetLogBuffer(pbbuffer : UInt8*, dwsize : UInt32, dwthreshold : UInt32, dwentries : UInt32, pdwloggedentries : UInt32*, pdwlostentries : UInt32*, pdwsizeused : UInt32*) : UInt32

  # Params # 
  fun PfDeleteLog : UInt32

  # Params # pinterface : Void* [In],ppfstats : PF_INTERFACE_STATS* [In],pdwbuffersize : UInt32* [In],fresetcounters : LibC::BOOL [In]
  fun PfGetInterfaceStatistics(pinterface : Void*, ppfstats : PF_INTERFACE_STATS*, pdwbuffersize : UInt32*, fresetcounters : LibC::BOOL) : UInt32

  # Params # pininterface : Void* [In],poutinterface : Void* [In],cbytes : UInt32 [In],pbpacket : UInt8* [In],ppaction : PFFORWARD_ACTION* [In]
  fun PfTestPacket(pininterface : Void*, poutinterface : Void*, cbytes : UInt32, pbpacket : UInt8*, ppaction : PFFORWARD_ACTION*) : UInt32
end
