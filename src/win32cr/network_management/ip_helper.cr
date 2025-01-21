require "./ndis.cr"
require "./../foundation.cr"
require "./../networking/win_sock.cr"
require "./../system/windows_programming.cr"
require "./../system/io.cr"

module Win32cr::NetworkManagement::IpHelper
  alias IcmpHandle = LibC::IntPtrT
  alias HIFTIMESTAMPCHANGE = LibC::IntPtrT
  alias PIPINTERFACE_CHANGE_CALLBACK = Proc(Void*, Win32cr::NetworkManagement::IpHelper::MIB_IPINTERFACE_ROW*, Win32cr::NetworkManagement::IpHelper::MIB_NOTIFICATION_TYPE, Void)*

  alias PUNICAST_IPADDRESS_CHANGE_CALLBACK = Proc(Void*, Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_ROW*, Win32cr::NetworkManagement::IpHelper::MIB_NOTIFICATION_TYPE, Void)*

  alias PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK = Proc(Void*, Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_TABLE*, Void)*

  alias PIPFORWARD_CHANGE_CALLBACK = Proc(Void*, Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*, Win32cr::NetworkManagement::IpHelper::MIB_NOTIFICATION_TYPE, Void)*

  alias PTEREDO_PORT_CHANGE_CALLBACK = Proc(Void*, UInt16, Win32cr::NetworkManagement::IpHelper::MIB_NOTIFICATION_TYPE, Void)*

  alias PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK = Proc(Void*, Win32cr::Networking::WinSock::NL_NETWORK_CONNECTIVITY_HINT, Void)*

  alias PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK = Proc(Void*, Void)*

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

  @[Flags]
  enum GET_ADAPTERS_ADDRESSES_FLAGS : UInt32
    GAA_FLAG_SKIP_UNICAST = 1_u32
    GAA_FLAG_SKIP_ANYCAST = 2_u32
    GAA_FLAG_SKIP_MULTICAST = 4_u32
    GAA_FLAG_SKIP_DNS_SERVER = 8_u32
    GAA_FLAG_INCLUDE_PREFIX = 16_u32
    GAA_FLAG_SKIP_FRIENDLY_NAME = 32_u32
    GAA_FLAG_INCLUDE_WINS_INFO = 64_u32
    GAA_FLAG_INCLUDE_GATEWAYS = 128_u32
    GAA_FLAG_INCLUDE_ALL_INTERFACES = 256_u32
    GAA_FLAG_INCLUDE_ALL_COMPARTMENTS = 512_u32
    GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER = 1024_u32
  end
  enum IF_ACCESS_TYPE
    IF_ACCESS_LOOPBACK = 1_i32
    IF_ACCESS_BROADCAST = 2_i32
    IF_ACCESS_POINT_TO_POINT = 3_i32
    IF_ACCESS_POINTTOPOINT = 3_i32
    IF_ACCESS_POINT_TO_MULTI_POINT = 4_i32
    IF_ACCESS_POINTTOMULTIPOINT = 4_i32
  end
  enum INTERNAL_IF_OPER_STATUS
    IF_OPER_STATUS_NON_OPERATIONAL = 0_i32
    IF_OPER_STATUS_UNREACHABLE = 1_i32
    IF_OPER_STATUS_DISCONNECTED = 2_i32
    IF_OPER_STATUS_CONNECTING = 3_i32
    IF_OPER_STATUS_CONNECTED = 4_i32
    IF_OPER_STATUS_OPERATIONAL = 5_i32
  end
  enum MIB_NOTIFICATION_TYPE
    MibParameterNotification = 0_i32
    MibAddInstance = 1_i32
    MibDeleteInstance = 2_i32
    MibInitialNotification = 3_i32
  end
  enum MIB_IF_ENTRY_LEVEL
    MibIfEntryNormal = 0_i32
    MibIfEntryNormalWithoutStatistics = 2_i32
  end
  enum MIB_IF_TABLE_LEVEL
    MibIfTableNormal = 0_i32
    MibIfTableRaw = 1_i32
    MibIfTableNormalWithoutStatistics = 2_i32
  end
  enum DNS_SERVER_PROPERTY_TYPE
    DnsServerInvalidProperty = 0_i32
    DnsServerDohProperty = 1_i32
  end
  enum MIB_IPFORWARD_TYPE
    MIB_IPROUTE_TYPE_OTHER = 1_i32
    MIB_IPROUTE_TYPE_INVALID = 2_i32
    MIB_IPROUTE_TYPE_DIRECT = 3_i32
    MIB_IPROUTE_TYPE_INDIRECT = 4_i32
  end
  enum MIB_IPNET_TYPE
    MIB_IPNET_TYPE_OTHER = 1_i32
    MIB_IPNET_TYPE_INVALID = 2_i32
    MIB_IPNET_TYPE_DYNAMIC = 3_i32
    MIB_IPNET_TYPE_STATIC = 4_i32
  end
  enum MIB_IPSTATS_FORWARDING
    MIB_IP_FORWARDING = 1_i32
    MIB_IP_NOT_FORWARDING = 2_i32
  end
  enum ICMP6_TYPE
    ICMP6_DST_UNREACH = 1_i32
    ICMP6_PACKET_TOO_BIG = 2_i32
    ICMP6_TIME_EXCEEDED = 3_i32
    ICMP6_PARAM_PROB = 4_i32
    ICMP6_ECHO_REQUEST = 128_i32
    ICMP6_ECHO_REPLY = 129_i32
    ICMP6_MEMBERSHIP_QUERY = 130_i32
    ICMP6_MEMBERSHIP_REPORT = 131_i32
    ICMP6_MEMBERSHIP_REDUCTION = 132_i32
    ND_ROUTER_SOLICIT = 133_i32
    ND_ROUTER_ADVERT = 134_i32
    ND_NEIGHBOR_SOLICIT = 135_i32
    ND_NEIGHBOR_ADVERT = 136_i32
    ND_REDIRECT = 137_i32
    ICMP6_V2_MEMBERSHIP_REPORT = 143_i32
  end
  enum ICMP4_TYPE
    ICMP4_ECHO_REPLY = 0_i32
    ICMP4_DST_UNREACH = 3_i32
    ICMP4_SOURCE_QUENCH = 4_i32
    ICMP4_REDIRECT = 5_i32
    ICMP4_ECHO_REQUEST = 8_i32
    ICMP4_ROUTER_ADVERT = 9_i32
    ICMP4_ROUTER_SOLICIT = 10_i32
    ICMP4_TIME_EXCEEDED = 11_i32
    ICMP4_PARAM_PROB = 12_i32
    ICMP4_TIMESTAMP_REQUEST = 13_i32
    ICMP4_TIMESTAMP_REPLY = 14_i32
    ICMP4_MASK_REQUEST = 17_i32
    ICMP4_MASK_REPLY = 18_i32
  end
  enum MIB_TCP_STATE
    MIB_TCP_STATE_CLOSED = 1_i32
    MIB_TCP_STATE_LISTEN = 2_i32
    MIB_TCP_STATE_SYN_SENT = 3_i32
    MIB_TCP_STATE_SYN_RCVD = 4_i32
    MIB_TCP_STATE_ESTAB = 5_i32
    MIB_TCP_STATE_FIN_WAIT1 = 6_i32
    MIB_TCP_STATE_FIN_WAIT2 = 7_i32
    MIB_TCP_STATE_CLOSE_WAIT = 8_i32
    MIB_TCP_STATE_CLOSING = 9_i32
    MIB_TCP_STATE_LAST_ACK = 10_i32
    MIB_TCP_STATE_TIME_WAIT = 11_i32
    MIB_TCP_STATE_DELETE_TCB = 12_i32
    MIB_TCP_STATE_RESERVED = 100_i32
  end
  enum TCP_CONNECTION_OFFLOAD_STATE
    TcpConnectionOffloadStateInHost = 0_i32
    TcpConnectionOffloadStateOffloading = 1_i32
    TcpConnectionOffloadStateOffloaded = 2_i32
    TcpConnectionOffloadStateUploading = 3_i32
    TcpConnectionOffloadStateMax = 4_i32
  end
  enum TCP_RTO_ALGORITHM
    TcpRtoAlgorithmOther = 1_i32
    TcpRtoAlgorithmConstant = 2_i32
    TcpRtoAlgorithmRsre = 3_i32
    TcpRtoAlgorithmVanj = 4_i32
    MIB_TCP_RTO_OTHER = 1_i32
    MIB_TCP_RTO_CONSTANT = 2_i32
    MIB_TCP_RTO_RSRE = 3_i32
    MIB_TCP_RTO_VANJ = 4_i32
  end
  enum TCP_TABLE_CLASS
    TCP_TABLE_BASIC_LISTENER = 0_i32
    TCP_TABLE_BASIC_CONNECTIONS = 1_i32
    TCP_TABLE_BASIC_ALL = 2_i32
    TCP_TABLE_OWNER_PID_LISTENER = 3_i32
    TCP_TABLE_OWNER_PID_CONNECTIONS = 4_i32
    TCP_TABLE_OWNER_PID_ALL = 5_i32
    TCP_TABLE_OWNER_MODULE_LISTENER = 6_i32
    TCP_TABLE_OWNER_MODULE_CONNECTIONS = 7_i32
    TCP_TABLE_OWNER_MODULE_ALL = 8_i32
  end
  enum UDP_TABLE_CLASS
    UDP_TABLE_BASIC = 0_i32
    UDP_TABLE_OWNER_PID = 1_i32
    UDP_TABLE_OWNER_MODULE = 2_i32
  end
  enum TCPIP_OWNER_MODULE_INFO_CLASS
    TCPIP_OWNER_MODULE_INFO_BASIC = 0_i32
  end
  enum TCP_ESTATS_TYPE
    TcpConnectionEstatsSynOpts = 0_i32
    TcpConnectionEstatsData = 1_i32
    TcpConnectionEstatsSndCong = 2_i32
    TcpConnectionEstatsPath = 3_i32
    TcpConnectionEstatsSendBuff = 4_i32
    TcpConnectionEstatsRec = 5_i32
    TcpConnectionEstatsObsRec = 6_i32
    TcpConnectionEstatsBandwidth = 7_i32
    TcpConnectionEstatsFineRtt = 8_i32
    TcpConnectionEstatsMaximum = 9_i32
  end
  enum TCP_BOOLEAN_OPTIONAL
    TcpBoolOptDisabled = 0_i32
    TcpBoolOptEnabled = 1_i32
    TcpBoolOptUnchanged = -1_i32
  end
  enum TCP_SOFT_ERROR
    TcpErrorNone = 0_i32
    TcpErrorBelowDataWindow = 1_i32
    TcpErrorAboveDataWindow = 2_i32
    TcpErrorBelowAckWindow = 3_i32
    TcpErrorAboveAckWindow = 4_i32
    TcpErrorBelowTsWindow = 5_i32
    TcpErrorAboveTsWindow = 6_i32
    TcpErrorDataChecksumError = 7_i32
    TcpErrorDataLengthError = 8_i32
    TcpErrorMaxSoftError = 9_i32
  end
  enum NET_ADDRESS_FORMAT
    NET_ADDRESS_FORMAT_UNSPECIFIED = 0_i32
    NET_ADDRESS_DNS_NAME = 1_i32
    NET_ADDRESS_IPV4 = 2_i32
    NET_ADDRESS_IPV6 = 3_i32
  end
  enum GLOBAL_FILTER
    GF_FRAGMENTS = 2_i32
    GF_STRONGHOST = 8_i32
    GF_FRAGCACHE = 9_i32
  end
  enum PFFORWARD_ACTION
    PF_ACTION_FORWARD = 0_i32
    PF_ACTION_DROP = 1_i32
  end
  enum PFADDRESSTYPE
    PF_IPV4 = 0_i32
    PF_IPV6 = 1_i32
  end
  enum PFFRAMETYPE
    PFFT_FILTER = 1_i32
    PFFT_FRAG = 2_i32
    PFFT_SPOOF = 3_i32
  end

  @[Extern]
  record Ip_option_information,
    ttl : UInt8,
    tos : UInt8,
    flags : UInt8,
    options_size : UInt8,
    options_data : UInt8*

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record Ip_option_information32,
    ttl : UInt8,
    tos : UInt8,
    flags : UInt8,
    options_size : UInt8,
    options_data : UInt8*
  {% end %}

  @[Extern]
  record Icmp_echo_reply,
    address : UInt32,
    status : UInt32,
    round_trip_time : UInt32,
    data_size : UInt16,
    reserved : UInt16,
    data : Void*,
    options : Win32cr::NetworkManagement::IpHelper::Ip_option_information

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record Icmp_echo_reply32,
    address : UInt32,
    status : UInt32,
    round_trip_time : UInt32,
    data_size : UInt16,
    reserved : UInt16,
    data : Void*,
    options : Win32cr::NetworkManagement::IpHelper::Ip_option_information32
  {% end %}

  @[Extern]
  record IPV6_ADDRESS_EX,
    sin6_port : UInt16,
    sin6_flowinfo : UInt32,
    sin6_addr : UInt16[8],
    sin6_scope_id : UInt32

  @[Extern]
  record Icmpv6_echo_reply_lh,
    address : Win32cr::NetworkManagement::IpHelper::IPV6_ADDRESS_EX,
    status : UInt32,
    round_trip_time : UInt32

  @[Extern]
  record Arp_send_reply,
    dest_address : UInt32,
    src_address : UInt32

  @[Extern]
  record Tcp_reserve_port_range,
    upper_range : UInt16,
    lower_range : UInt16

  @[Extern]
  record IP_ADAPTER_INDEX_MAP,
    index : UInt32,
    name : UInt16[128]

  @[Extern]
  record IP_INTERFACE_INFO,
    num_adapters : Int32,
    adapter : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_INDEX_MAP*

  @[Extern]
  record IP_UNIDIRECTIONAL_ADAPTER_ADDRESS,
    num_adapters : UInt32,
    address : UInt32*

  @[Extern]
  record IP_ADAPTER_ORDER_MAP,
    num_adapters : UInt32,
    adapter_order : UInt32*

  @[Extern]
  record IP_MCAST_COUNTER_INFO,
    in_mcast_octets : UInt64,
    out_mcast_octets : UInt64,
    in_mcast_pkts : UInt64,
    out_mcast_pkts : UInt64

  @[Extern]
  record MIB_IF_ROW2,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    interface_index : UInt32,
    interface_guid : LibC::GUID,
    alias__ : UInt16[257],
    description : UInt16[257],
    physical_address_length : UInt32,
    physical_address : UInt8[32],
    permanent_physical_address : UInt8[32],
    mtu : UInt32,
    type__ : UInt32,
    tunnel_type : Win32cr::NetworkManagement::Ndis::TUNNEL_TYPE,
    media_type : Win32cr::NetworkManagement::Ndis::NDIS_MEDIUM,
    physical_medium_type : Win32cr::NetworkManagement::Ndis::NDIS_PHYSICAL_MEDIUM,
    access_type : Win32cr::NetworkManagement::Ndis::NET_IF_ACCESS_TYPE,
    direction_type : Win32cr::NetworkManagement::Ndis::NET_IF_DIRECTION_TYPE,
    interface_and_oper_status_flags : InterfaceAndOperStatusFlags_e__Struct_,
    oper_status : Win32cr::NetworkManagement::Ndis::IF_OPER_STATUS,
    admin_status : Win32cr::NetworkManagement::Ndis::NET_IF_ADMIN_STATUS,
    media_connect_state : Win32cr::NetworkManagement::Ndis::NET_IF_MEDIA_CONNECT_STATE,
    network_guid : LibC::GUID,
    connection_type : Win32cr::NetworkManagement::Ndis::NET_IF_CONNECTION_TYPE,
    transmit_link_speed : UInt64,
    receive_link_speed : UInt64,
    in_octets : UInt64,
    in_ucast_pkts : UInt64,
    in_n_ucast_pkts : UInt64,
    in_discards : UInt64,
    in_errors : UInt64,
    in_unknown_protos : UInt64,
    in_ucast_octets : UInt64,
    in_multicast_octets : UInt64,
    in_broadcast_octets : UInt64,
    out_octets : UInt64,
    out_ucast_pkts : UInt64,
    out_n_ucast_pkts : UInt64,
    out_discards : UInt64,
    out_errors : UInt64,
    out_ucast_octets : UInt64,
    out_multicast_octets : UInt64,
    out_broadcast_octets : UInt64,
    out_q_len : UInt64 do

    # Nested Type InterfaceAndOperStatusFlags_e__Struct_
    @[Extern]
    record InterfaceAndOperStatusFlags_e__Struct_,
      _bitfield : UInt8

  end

  @[Extern]
  record MIB_IF_TABLE2,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IF_ROW2*

  @[Extern]
  record MIB_IPINTERFACE_ROW,
    family : UInt16,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    interface_index : UInt32,
    max_reassembly_size : UInt32,
    interface_identifier : UInt64,
    min_router_advertisement_interval : UInt32,
    max_router_advertisement_interval : UInt32,
    advertising_enabled : Win32cr::Foundation::BOOLEAN,
    forwarding_enabled : Win32cr::Foundation::BOOLEAN,
    weak_host_send : Win32cr::Foundation::BOOLEAN,
    weak_host_receive : Win32cr::Foundation::BOOLEAN,
    use_automatic_metric : Win32cr::Foundation::BOOLEAN,
    use_neighbor_unreachability_detection : Win32cr::Foundation::BOOLEAN,
    managed_address_configuration_supported : Win32cr::Foundation::BOOLEAN,
    other_stateful_configuration_supported : Win32cr::Foundation::BOOLEAN,
    advertise_default_route : Win32cr::Foundation::BOOLEAN,
    router_discovery_behavior : Win32cr::Networking::WinSock::NL_ROUTER_DISCOVERY_BEHAVIOR,
    dad_transmits : UInt32,
    base_reachable_time : UInt32,
    retransmit_time : UInt32,
    path_mtu_discovery_timeout : UInt32,
    link_local_address_behavior : Win32cr::Networking::WinSock::NL_LINK_LOCAL_ADDRESS_BEHAVIOR,
    link_local_address_timeout : UInt32,
    zone_indices : UInt32[16],
    site_prefix_length : UInt32,
    metric : UInt32,
    nl_mtu : UInt32,
    connected : Win32cr::Foundation::BOOLEAN,
    supports_wake_up_patterns : Win32cr::Foundation::BOOLEAN,
    supports_neighbor_discovery : Win32cr::Foundation::BOOLEAN,
    supports_router_discovery : Win32cr::Foundation::BOOLEAN,
    reachable_time : UInt32,
    transmit_offload : Win32cr::Networking::WinSock::NL_INTERFACE_OFFLOAD_ROD,
    receive_offload : Win32cr::Networking::WinSock::NL_INTERFACE_OFFLOAD_ROD,
    disable_default_routes : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record MIB_IPINTERFACE_TABLE,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPINTERFACE_ROW*

  @[Extern]
  record MIB_IFSTACK_ROW,
    higher_layer_interface_index : UInt32,
    lower_layer_interface_index : UInt32

  @[Extern]
  record MIB_INVERTEDIFSTACK_ROW,
    lower_layer_interface_index : UInt32,
    higher_layer_interface_index : UInt32

  @[Extern]
  record MIB_IFSTACK_TABLE,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IFSTACK_ROW*

  @[Extern]
  record MIB_INVERTEDIFSTACK_TABLE,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_INVERTEDIFSTACK_ROW*

  @[Extern]
  record MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES,
    inbound_bandwidth_information : Win32cr::Networking::WinSock::NL_BANDWIDTH_INFORMATION,
    outbound_bandwidth_information : Win32cr::Networking::WinSock::NL_BANDWIDTH_INFORMATION

  @[Extern]
  record MIB_UNICASTIPADDRESS_ROW,
    address : Win32cr::Networking::WinSock::SOCKADDR_INET,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    interface_index : UInt32,
    prefix_origin : Win32cr::Networking::WinSock::NL_PREFIX_ORIGIN,
    suffix_origin : Win32cr::Networking::WinSock::NL_SUFFIX_ORIGIN,
    valid_lifetime : UInt32,
    preferred_lifetime : UInt32,
    on_link_prefix_length : UInt8,
    skip_as_source : Win32cr::Foundation::BOOLEAN,
    dad_state : Win32cr::Networking::WinSock::NL_DAD_STATE,
    scope_id : Win32cr::Networking::WinSock::SCOPE_ID,
    creation_time_stamp : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record MIB_UNICASTIPADDRESS_TABLE,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_ROW*

  @[Extern]
  record MIB_ANYCASTIPADDRESS_ROW,
    address : Win32cr::Networking::WinSock::SOCKADDR_INET,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    interface_index : UInt32,
    scope_id : Win32cr::Networking::WinSock::SCOPE_ID

  @[Extern]
  record MIB_ANYCASTIPADDRESS_TABLE,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_ANYCASTIPADDRESS_ROW*

  @[Extern]
  record MIB_MULTICASTIPADDRESS_ROW,
    address : Win32cr::Networking::WinSock::SOCKADDR_INET,
    interface_index : UInt32,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    scope_id : Win32cr::Networking::WinSock::SCOPE_ID

  @[Extern]
  record MIB_MULTICASTIPADDRESS_TABLE,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_MULTICASTIPADDRESS_ROW*

  @[Extern]
  record IP_ADDRESS_PREFIX,
    prefix : Win32cr::Networking::WinSock::SOCKADDR_INET,
    prefix_length : UInt8

  @[Extern]
  record MIB_IPFORWARD_ROW2,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    interface_index : UInt32,
    destination_prefix : Win32cr::NetworkManagement::IpHelper::IP_ADDRESS_PREFIX,
    next_hop : Win32cr::Networking::WinSock::SOCKADDR_INET,
    site_prefix_length : UInt8,
    valid_lifetime : UInt32,
    preferred_lifetime : UInt32,
    metric : UInt32,
    protocol : Win32cr::Networking::WinSock::NL_ROUTE_PROTOCOL,
    loopback : Win32cr::Foundation::BOOLEAN,
    autoconfigure_address : Win32cr::Foundation::BOOLEAN,
    publish : Win32cr::Foundation::BOOLEAN,
    immortal : Win32cr::Foundation::BOOLEAN,
    age : UInt32,
    origin : Win32cr::Networking::WinSock::NL_ROUTE_ORIGIN

  @[Extern]
  record MIB_IPFORWARD_TABLE2,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*

  @[Extern]
  record MIB_IPPATH_ROW,
    source : Win32cr::Networking::WinSock::SOCKADDR_INET,
    destination : Win32cr::Networking::WinSock::SOCKADDR_INET,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    interface_index : UInt32,
    current_next_hop : Win32cr::Networking::WinSock::SOCKADDR_INET,
    path_mtu : UInt32,
    rtt_mean : UInt32,
    rtt_deviation : UInt32,
    anonymous : Anonymous_e__Union_,
    is_reachable : Win32cr::Foundation::BOOLEAN,
    link_transmit_speed : UInt64,
    link_receive_speed : UInt64 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      last_reachable : UInt32,
      last_unreachable : UInt32

  end

  @[Extern]
  record MIB_IPPATH_TABLE,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPPATH_ROW*

  @[Extern]
  record MIB_IPNET_ROW2,
    address : Win32cr::Networking::WinSock::SOCKADDR_INET,
    interface_index : UInt32,
    interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    physical_address : UInt8[32],
    physical_address_length : UInt32,
    state : Win32cr::Networking::WinSock::NL_NEIGHBOR_STATE,
    anonymous : Anonymous_e__Union_,
    reachability_time : ReachabilityTime_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      flags : UInt8 do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        _bitfield : UInt8

    end


    # Nested Type ReachabilityTime_e__Union_
    @[Extern(union: true)]
    record ReachabilityTime_e__Union_,
      last_reachable : UInt32,
      last_unreachable : UInt32

  end

  @[Extern]
  record MIB_IPNET_TABLE2,
    num_entries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_ROW2*

  @[Extern]
  record DNS_SETTINGS,
    version : UInt32,
    flags : UInt64,
    hostname : Win32cr::Foundation::PWSTR,
    domain : Win32cr::Foundation::PWSTR,
    search_list : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_SETTINGS2,
    version : UInt32,
    flags : UInt64,
    hostname : Win32cr::Foundation::PWSTR,
    domain : Win32cr::Foundation::PWSTR,
    search_list : Win32cr::Foundation::PWSTR,
    setting_flags : UInt64

  @[Extern]
  record DNS_DOH_SERVER_SETTINGS,
    template : Win32cr::Foundation::PWSTR,
    flags : UInt64

  @[Extern(union: true)]
  record DNS_SERVER_PROPERTY_TYPES,
    doh_settings : Win32cr::NetworkManagement::IpHelper::DNS_DOH_SERVER_SETTINGS*

  @[Extern]
  record DNS_SERVER_PROPERTY,
    version : UInt32,
    server_index : UInt32,
    type__ : Win32cr::NetworkManagement::IpHelper::DNS_SERVER_PROPERTY_TYPE,
    property : Win32cr::NetworkManagement::IpHelper::DNS_SERVER_PROPERTY_TYPES

  @[Extern]
  record DNS_INTERFACE_SETTINGS,
    version : UInt32,
    flags : UInt64,
    domain : Win32cr::Foundation::PWSTR,
    name_server : Win32cr::Foundation::PWSTR,
    search_list : Win32cr::Foundation::PWSTR,
    registration_enabled : UInt32,
    register_adapter_name : UInt32,
    enable_llmnr : UInt32,
    query_adapter_name : UInt32,
    profile_name_server : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_INTERFACE_SETTINGS_EX,
    settings_v1 : Win32cr::NetworkManagement::IpHelper::DNS_INTERFACE_SETTINGS,
    disable_unconstrained_queries : UInt32,
    supplemental_search_list : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_INTERFACE_SETTINGS3,
    version : UInt32,
    flags : UInt64,
    domain : Win32cr::Foundation::PWSTR,
    name_server : Win32cr::Foundation::PWSTR,
    search_list : Win32cr::Foundation::PWSTR,
    registration_enabled : UInt32,
    register_adapter_name : UInt32,
    enable_llmnr : UInt32,
    query_adapter_name : UInt32,
    profile_name_server : Win32cr::Foundation::PWSTR,
    disable_unconstrained_queries : UInt32,
    supplemental_search_list : Win32cr::Foundation::PWSTR,
    cServerProperties : UInt32,
    server_properties : Win32cr::NetworkManagement::IpHelper::DNS_SERVER_PROPERTY*,
    cProfileServerProperties : UInt32,
    profile_server_properties : Win32cr::NetworkManagement::IpHelper::DNS_SERVER_PROPERTY*

  @[Extern]
  record MIB_OPAQUE_QUERY,
    dwVarId : UInt32,
    rgdwVarIndex : UInt32*

  @[Extern]
  record MIB_IFNUMBER,
    dwValue : UInt32

  @[Extern]
  record MIB_IFROW,
    wszName : UInt16[256],
    dwIndex : UInt32,
    dwType : UInt32,
    dwMtu : UInt32,
    dwSpeed : UInt32,
    dwPhysAddrLen : UInt32,
    bPhysAddr : UInt8[8],
    dwAdminStatus : UInt32,
    dwOperStatus : Win32cr::NetworkManagement::IpHelper::INTERNAL_IF_OPER_STATUS,
    dwLastChange : UInt32,
    dwInOctets : UInt32,
    dwInUcastPkts : UInt32,
    dwInNUcastPkts : UInt32,
    dwInDiscards : UInt32,
    dwInErrors : UInt32,
    dwInUnknownProtos : UInt32,
    dwOutOctets : UInt32,
    dwOutUcastPkts : UInt32,
    dwOutNUcastPkts : UInt32,
    dwOutDiscards : UInt32,
    dwOutErrors : UInt32,
    dwOutQLen : UInt32,
    dwDescrLen : UInt32,
    bDescr : UInt8[256]

  @[Extern]
  record MIB_IFTABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IFROW*

  @[Extern]
  record MIB_IPADDRROW_XP,
    dwAddr : UInt32,
    dwIndex : UInt32,
    dwMask : UInt32,
    dwBCastAddr : UInt32,
    dwReasmSize : UInt32,
    unused1 : UInt16,
    wType : UInt16

  @[Extern]
  record MIB_IPADDRROW_W2K,
    dwAddr : UInt32,
    dwIndex : UInt32,
    dwMask : UInt32,
    dwBCastAddr : UInt32,
    dwReasmSize : UInt32,
    unused1 : UInt16,
    unused2 : UInt16

  @[Extern]
  record MIB_IPADDRTABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPADDRROW_XP*

  @[Extern]
  record MIB_IPFORWARDNUMBER,
    dwValue : UInt32

  @[Extern]
  record MIB_IPFORWARDROW,
    dwForwardDest : UInt32,
    dwForwardMask : UInt32,
    dwForwardPolicy : UInt32,
    dwForwardNextHop : UInt32,
    dwForwardIfIndex : UInt32,
    anonymous1 : Anonymous1_e__Union_,
    anonymous2 : Anonymous2_e__Union_,
    dwForwardAge : UInt32,
    dwForwardNextHopAS : UInt32,
    dwForwardMetric1 : UInt32,
    dwForwardMetric2 : UInt32,
    dwForwardMetric3 : UInt32,
    dwForwardMetric4 : UInt32,
    dwForwardMetric5 : UInt32 do

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      dwForwardType : UInt32,
      forward_type : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_TYPE


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      dwForwardProto : UInt32,
      forward_proto : Win32cr::Networking::WinSock::NL_ROUTE_PROTOCOL

  end

  @[Extern]
  record MIB_IPFORWARDTABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARDROW*

  @[Extern]
  record MIB_IPNETROW_LH,
    dwIndex : UInt32,
    dwPhysAddrLen : UInt32,
    bPhysAddr : UInt8[8],
    dwAddr : UInt32,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      dwType : UInt32,
      type__ : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_TYPE

  end

  @[Extern]
  record MIB_IPNETROW_W2K,
    dwIndex : UInt32,
    dwPhysAddrLen : UInt32,
    bPhysAddr : UInt8[8],
    dwAddr : UInt32,
    dwType : UInt32

  @[Extern]
  record MIB_IPNETTABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPNETROW_LH*

  @[Extern]
  record MIB_IPSTATS_LH,
    anonymous : Anonymous_e__Union_,
    dwDefaultTTL : UInt32,
    dwInReceives : UInt32,
    dwInHdrErrors : UInt32,
    dwInAddrErrors : UInt32,
    dwForwDatagrams : UInt32,
    dwInUnknownProtos : UInt32,
    dwInDiscards : UInt32,
    dwInDelivers : UInt32,
    dwOutRequests : UInt32,
    dwRoutingDiscards : UInt32,
    dwOutDiscards : UInt32,
    dwOutNoRoutes : UInt32,
    dwReasmTimeout : UInt32,
    dwReasmReqds : UInt32,
    dwReasmOks : UInt32,
    dwReasmFails : UInt32,
    dwFragOks : UInt32,
    dwFragFails : UInt32,
    dwFragCreates : UInt32,
    dwNumIf : UInt32,
    dwNumAddr : UInt32,
    dwNumRoutes : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      dwForwarding : UInt32,
      forwarding : Win32cr::NetworkManagement::IpHelper::MIB_IPSTATS_FORWARDING

  end

  @[Extern]
  record MIB_IPSTATS_W2K,
    dwForwarding : UInt32,
    dwDefaultTTL : UInt32,
    dwInReceives : UInt32,
    dwInHdrErrors : UInt32,
    dwInAddrErrors : UInt32,
    dwForwDatagrams : UInt32,
    dwInUnknownProtos : UInt32,
    dwInDiscards : UInt32,
    dwInDelivers : UInt32,
    dwOutRequests : UInt32,
    dwRoutingDiscards : UInt32,
    dwOutDiscards : UInt32,
    dwOutNoRoutes : UInt32,
    dwReasmTimeout : UInt32,
    dwReasmReqds : UInt32,
    dwReasmOks : UInt32,
    dwReasmFails : UInt32,
    dwFragOks : UInt32,
    dwFragFails : UInt32,
    dwFragCreates : UInt32,
    dwNumIf : UInt32,
    dwNumAddr : UInt32,
    dwNumRoutes : UInt32

  @[Extern]
  record MIBICMPSTATS,
    dwMsgs : UInt32,
    dwErrors : UInt32,
    dwDestUnreachs : UInt32,
    dwTimeExcds : UInt32,
    dwParmProbs : UInt32,
    dwSrcQuenchs : UInt32,
    dwRedirects : UInt32,
    dwEchos : UInt32,
    dwEchoReps : UInt32,
    dwTimestamps : UInt32,
    dwTimestampReps : UInt32,
    dwAddrMasks : UInt32,
    dwAddrMaskReps : UInt32

  @[Extern]
  record MIBICMPINFO,
    icmpInStats : Win32cr::NetworkManagement::IpHelper::MIBICMPSTATS,
    icmpOutStats : Win32cr::NetworkManagement::IpHelper::MIBICMPSTATS

  @[Extern]
  record MIB_ICMP,
    stats : Win32cr::NetworkManagement::IpHelper::MIBICMPINFO

  @[Extern]
  record MIBICMPSTATS_EX_XPSP1,
    dwMsgs : UInt32,
    dwErrors : UInt32,
    rgdwTypeCount : UInt32[256]

  @[Extern]
  record MIB_ICMP_EX_XPSP1,
    icmpInStats : Win32cr::NetworkManagement::IpHelper::MIBICMPSTATS_EX_XPSP1,
    icmpOutStats : Win32cr::NetworkManagement::IpHelper::MIBICMPSTATS_EX_XPSP1

  @[Extern]
  record MIB_IPMCAST_OIF_XP,
    dwOutIfIndex : UInt32,
    dwNextHopAddr : UInt32,
    dwReserved : UInt32,
    dwReserved1 : UInt32

  @[Extern]
  record MIB_IPMCAST_OIF_W2K,
    dwOutIfIndex : UInt32,
    dwNextHopAddr : UInt32,
    pvReserved : Void*,
    dwReserved : UInt32

  @[Extern]
  record MIB_IPMCAST_MFE,
    dwGroup : UInt32,
    dwSource : UInt32,
    dwSrcMask : UInt32,
    dwUpStrmNgbr : UInt32,
    dwInIfIndex : UInt32,
    dwInIfProtocol : UInt32,
    dwRouteProtocol : UInt32,
    dwRouteNetwork : UInt32,
    dwRouteMask : UInt32,
    ulUpTime : UInt32,
    ulExpiryTime : UInt32,
    ulTimeOut : UInt32,
    ulNumOutIf : UInt32,
    fFlags : UInt32,
    dwReserved : UInt32,
    rgmioOutInfo : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_OIF_XP*

  @[Extern]
  record MIB_MFE_TABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_MFE*

  @[Extern]
  record MIB_IPMCAST_OIF_STATS_LH,
    dwOutIfIndex : UInt32,
    dwNextHopAddr : UInt32,
    dwDialContext : UInt32,
    ulTtlTooLow : UInt32,
    ulFragNeeded : UInt32,
    ulOutPackets : UInt32,
    ulOutDiscards : UInt32

  @[Extern]
  record MIB_IPMCAST_OIF_STATS_W2K,
    dwOutIfIndex : UInt32,
    dwNextHopAddr : UInt32,
    pvDialContext : Void*,
    ulTtlTooLow : UInt32,
    ulFragNeeded : UInt32,
    ulOutPackets : UInt32,
    ulOutDiscards : UInt32

  @[Extern]
  record MIB_IPMCAST_MFE_STATS,
    dwGroup : UInt32,
    dwSource : UInt32,
    dwSrcMask : UInt32,
    dwUpStrmNgbr : UInt32,
    dwInIfIndex : UInt32,
    dwInIfProtocol : UInt32,
    dwRouteProtocol : UInt32,
    dwRouteNetwork : UInt32,
    dwRouteMask : UInt32,
    ulUpTime : UInt32,
    ulExpiryTime : UInt32,
    ulNumOutIf : UInt32,
    ulInPkts : UInt32,
    ulInOctets : UInt32,
    ulPktsDifferentIf : UInt32,
    ulQueueOverflow : UInt32,
    rgmiosOutStats : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_OIF_STATS_LH*

  @[Extern]
  record MIB_MFE_STATS_TABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_MFE_STATS*

  @[Extern]
  record MIB_IPMCAST_MFE_STATS_EX_XP,
    dwGroup : UInt32,
    dwSource : UInt32,
    dwSrcMask : UInt32,
    dwUpStrmNgbr : UInt32,
    dwInIfIndex : UInt32,
    dwInIfProtocol : UInt32,
    dwRouteProtocol : UInt32,
    dwRouteNetwork : UInt32,
    dwRouteMask : UInt32,
    ulUpTime : UInt32,
    ulExpiryTime : UInt32,
    ulNumOutIf : UInt32,
    ulInPkts : UInt32,
    ulInOctets : UInt32,
    ulPktsDifferentIf : UInt32,
    ulQueueOverflow : UInt32,
    ulUninitMfe : UInt32,
    ulNegativeMfe : UInt32,
    ulInDiscards : UInt32,
    ulInHdrErrors : UInt32,
    ulTotalOutPackets : UInt32,
    rgmiosOutStats : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_OIF_STATS_LH*

  @[Extern]
  record MIB_MFE_STATS_TABLE_EX_XP,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_MFE_STATS_EX_XP**

  @[Extern]
  record MIB_IPMCAST_GLOBAL,
    dwEnable : UInt32

  @[Extern]
  record MIB_IPMCAST_IF_ENTRY,
    dwIfIndex : UInt32,
    dwTtl : UInt32,
    dwProtocol : UInt32,
    dwRateLimit : UInt32,
    ulInMcastOctets : UInt32,
    ulOutMcastOctets : UInt32

  @[Extern]
  record MIB_IPMCAST_IF_TABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_IF_ENTRY*

  @[Extern]
  record MIB_TCPROW_LH,
    anonymous : Anonymous_e__Union_,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwRemoteAddr : UInt32,
    dwRemotePort : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      dwState : UInt32,
      state : Win32cr::NetworkManagement::IpHelper::MIB_TCP_STATE

  end

  @[Extern]
  record MIB_TCPROW_W2K,
    dwState : UInt32,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwRemoteAddr : UInt32,
    dwRemotePort : UInt32

  @[Extern]
  record MIB_TCPTABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW_LH*

  @[Extern]
  record MIB_TCPROW2,
    dwState : UInt32,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwRemoteAddr : UInt32,
    dwRemotePort : UInt32,
    dwOwningPid : UInt32,
    dwOffloadState : Win32cr::NetworkManagement::IpHelper::TCP_CONNECTION_OFFLOAD_STATE

  @[Extern]
  record MIB_TCPTABLE2,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW2*

  @[Extern]
  record MIB_TCPROW_OWNER_PID,
    dwState : UInt32,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwRemoteAddr : UInt32,
    dwRemotePort : UInt32,
    dwOwningPid : UInt32

  @[Extern]
  record MIB_TCPTABLE_OWNER_PID,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW_OWNER_PID*

  @[Extern]
  record MIB_TCPROW_OWNER_MODULE,
    dwState : UInt32,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwRemoteAddr : UInt32,
    dwRemotePort : UInt32,
    dwOwningPid : UInt32,
    liCreateTimestamp : Win32cr::Foundation::LARGE_INTEGER,
    owning_module_info : UInt64[16]

  @[Extern]
  record MIB_TCPTABLE_OWNER_MODULE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW_OWNER_MODULE*

  @[Extern]
  record MIB_TCP6ROW,
    state : Win32cr::NetworkManagement::IpHelper::MIB_TCP_STATE,
    local_addr : Win32cr::Networking::WinSock::IN6_ADDR,
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32,
    remote_addr : Win32cr::Networking::WinSock::IN6_ADDR,
    dwRemoteScopeId : UInt32,
    dwRemotePort : UInt32

  @[Extern]
  record MIB_TCP6TABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCP6ROW*

  @[Extern]
  record MIB_TCP6ROW2,
    local_addr : Win32cr::Networking::WinSock::IN6_ADDR,
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32,
    remote_addr : Win32cr::Networking::WinSock::IN6_ADDR,
    dwRemoteScopeId : UInt32,
    dwRemotePort : UInt32,
    state : Win32cr::NetworkManagement::IpHelper::MIB_TCP_STATE,
    dwOwningPid : UInt32,
    dwOffloadState : Win32cr::NetworkManagement::IpHelper::TCP_CONNECTION_OFFLOAD_STATE

  @[Extern]
  record MIB_TCP6TABLE2,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCP6ROW2*

  @[Extern]
  record MIB_TCP6ROW_OWNER_PID,
    ucLocalAddr : UInt8[16],
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32,
    ucRemoteAddr : UInt8[16],
    dwRemoteScopeId : UInt32,
    dwRemotePort : UInt32,
    dwState : UInt32,
    dwOwningPid : UInt32

  @[Extern]
  record MIB_TCP6TABLE_OWNER_PID,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCP6ROW_OWNER_PID*

  @[Extern]
  record MIB_TCP6ROW_OWNER_MODULE,
    ucLocalAddr : UInt8[16],
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32,
    ucRemoteAddr : UInt8[16],
    dwRemoteScopeId : UInt32,
    dwRemotePort : UInt32,
    dwState : UInt32,
    dwOwningPid : UInt32,
    liCreateTimestamp : Win32cr::Foundation::LARGE_INTEGER,
    owning_module_info : UInt64[16]

  @[Extern]
  record MIB_TCP6TABLE_OWNER_MODULE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_TCP6ROW_OWNER_MODULE*

  @[Extern]
  record MIB_TCPSTATS_LH,
    anonymous : Anonymous_e__Union_,
    dwRtoMin : UInt32,
    dwRtoMax : UInt32,
    dwMaxConn : UInt32,
    dwActiveOpens : UInt32,
    dwPassiveOpens : UInt32,
    dwAttemptFails : UInt32,
    dwEstabResets : UInt32,
    dwCurrEstab : UInt32,
    dwInSegs : UInt32,
    dwOutSegs : UInt32,
    dwRetransSegs : UInt32,
    dwInErrs : UInt32,
    dwOutRsts : UInt32,
    dwNumConns : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      dwRtoAlgorithm : UInt32,
      rto_algorithm : Win32cr::NetworkManagement::IpHelper::TCP_RTO_ALGORITHM

  end

  @[Extern]
  record MIB_TCPSTATS_W2K,
    dwRtoAlgorithm : UInt32,
    dwRtoMin : UInt32,
    dwRtoMax : UInt32,
    dwMaxConn : UInt32,
    dwActiveOpens : UInt32,
    dwPassiveOpens : UInt32,
    dwAttemptFails : UInt32,
    dwEstabResets : UInt32,
    dwCurrEstab : UInt32,
    dwInSegs : UInt32,
    dwOutSegs : UInt32,
    dwRetransSegs : UInt32,
    dwInErrs : UInt32,
    dwOutRsts : UInt32,
    dwNumConns : UInt32

  @[Extern]
  record MIB_TCPSTATS2,
    rto_algorithm : Win32cr::NetworkManagement::IpHelper::TCP_RTO_ALGORITHM,
    dwRtoMin : UInt32,
    dwRtoMax : UInt32,
    dwMaxConn : UInt32,
    dwActiveOpens : UInt32,
    dwPassiveOpens : UInt32,
    dwAttemptFails : UInt32,
    dwEstabResets : UInt32,
    dwCurrEstab : UInt32,
    dw64InSegs : UInt64,
    dw64OutSegs : UInt64,
    dwRetransSegs : UInt32,
    dwInErrs : UInt32,
    dwOutRsts : UInt32,
    dwNumConns : UInt32

  @[Extern]
  record MIB_UDPROW,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32

  @[Extern]
  record MIB_UDPTABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDPROW*

  @[Extern]
  record MIB_UDPROW_OWNER_PID,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwOwningPid : UInt32

  @[Extern]
  record MIB_UDPTABLE_OWNER_PID,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDPROW_OWNER_PID*

  @[Extern]
  record MIB_UDPROW_OWNER_MODULE,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwOwningPid : UInt32,
    liCreateTimestamp : Win32cr::Foundation::LARGE_INTEGER,
    anonymous : Anonymous_e__Union_,
    owning_module_info : UInt64[16] do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      dwFlags : Int32 do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        _bitfield : Int32

    end

  end

  @[Extern]
  record MIB_UDPTABLE_OWNER_MODULE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDPROW_OWNER_MODULE*

  @[Extern]
  record MIB_UDPROW2,
    dwLocalAddr : UInt32,
    dwLocalPort : UInt32,
    dwOwningPid : UInt32,
    liCreateTimestamp : Win32cr::Foundation::LARGE_INTEGER,
    anonymous : Anonymous_e__Union_,
    owning_module_info : UInt64[16],
    dwRemoteAddr : UInt32,
    dwRemotePort : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      dwFlags : Int32 do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        _bitfield : Int32

    end

  end

  @[Extern]
  record MIB_UDPTABLE2,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDPROW2*

  @[Extern]
  record MIB_UDP6ROW,
    dwLocalAddr : Win32cr::Networking::WinSock::IN6_ADDR,
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32

  @[Extern]
  record MIB_UDP6TABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDP6ROW*

  @[Extern]
  record MIB_UDP6ROW_OWNER_PID,
    ucLocalAddr : UInt8[16],
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32,
    dwOwningPid : UInt32

  @[Extern]
  record MIB_UDP6TABLE_OWNER_PID,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDP6ROW_OWNER_PID*

  @[Extern]
  record MIB_UDP6ROW_OWNER_MODULE,
    ucLocalAddr : UInt8[16],
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32,
    dwOwningPid : UInt32,
    liCreateTimestamp : Win32cr::Foundation::LARGE_INTEGER,
    anonymous : Anonymous_e__Union_,
    owning_module_info : UInt64[16] do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      dwFlags : Int32 do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        _bitfield : Int32

    end

  end

  @[Extern]
  record MIB_UDP6TABLE_OWNER_MODULE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDP6ROW_OWNER_MODULE*

  @[Extern]
  record MIB_UDP6ROW2,
    ucLocalAddr : UInt8[16],
    dwLocalScopeId : UInt32,
    dwLocalPort : UInt32,
    dwOwningPid : UInt32,
    liCreateTimestamp : Win32cr::Foundation::LARGE_INTEGER,
    anonymous : Anonymous_e__Union_,
    owning_module_info : UInt64[16],
    ucRemoteAddr : UInt8[16],
    dwRemoteScopeId : UInt32,
    dwRemotePort : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      dwFlags : Int32 do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        _bitfield : Int32

    end

  end

  @[Extern]
  record MIB_UDP6TABLE2,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_UDP6ROW2*

  @[Extern]
  record MIB_UDPSTATS,
    dwInDatagrams : UInt32,
    dwNoPorts : UInt32,
    dwInErrors : UInt32,
    dwOutDatagrams : UInt32,
    dwNumAddrs : UInt32

  @[Extern]
  record MIB_UDPSTATS2,
    dw64InDatagrams : UInt64,
    dwNoPorts : UInt32,
    dwInErrors : UInt32,
    dw64OutDatagrams : UInt64,
    dwNumAddrs : UInt32

  @[Extern]
  record TCPIP_OWNER_MODULE_BASIC_INFO,
    pModuleName : Win32cr::Foundation::PWSTR,
    pModulePath : Win32cr::Foundation::PWSTR

  @[Extern]
  record MIB_IPMCAST_BOUNDARY,
    dwIfIndex : UInt32,
    dwGroupAddress : UInt32,
    dwGroupMask : UInt32,
    dwStatus : UInt32

  @[Extern]
  record MIB_IPMCAST_BOUNDARY_TABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPMCAST_BOUNDARY*

  @[Extern]
  record MIB_BOUNDARYROW,
    dwGroupAddress : UInt32,
    dwGroupMask : UInt32

  @[Extern]
  record MIB_MCAST_LIMIT_ROW,
    dwTtl : UInt32,
    dwRateLimit : UInt32

  @[Extern]
  record MIB_IPMCAST_SCOPE,
    dwGroupAddress : UInt32,
    dwGroupMask : UInt32,
    snNameBuffer : UInt16[256],
    dwStatus : UInt32

  @[Extern]
  record MIB_IPDESTROW,
    forward_row : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARDROW,
    dwForwardPreference : UInt32,
    dwForwardViewSet : UInt32

  @[Extern]
  record MIB_IPDESTTABLE,
    dwNumEntries : UInt32,
    table : Win32cr::NetworkManagement::IpHelper::MIB_IPDESTROW*

  @[Extern]
  record MIB_BEST_IF,
    dwDestAddr : UInt32,
    dwIfIndex : UInt32

  @[Extern]
  record MIB_PROXYARP,
    dwAddress : UInt32,
    dwMask : UInt32,
    dwIfIndex : UInt32

  @[Extern]
  record MIB_IFSTATUS,
    dwIfIndex : UInt32,
    dwAdminStatus : UInt32,
    dwOperationalStatus : UInt32,
    bMHbeatActive : Win32cr::Foundation::BOOL,
    bMHbeatAlive : Win32cr::Foundation::BOOL

  @[Extern]
  record MIB_ROUTESTATE,
    bRoutesSetToStack : Win32cr::Foundation::BOOL

  @[Extern]
  record MIB_OPAQUE_INFO,
    dwId : UInt32,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      ullAlign : UInt64,
      rgbyData : UInt8*

  end

  @[Extern]
  record IP_ADDRESS_STRING,
    string : Win32cr::Foundation::CHAR[16]

  @[Extern]
  record IP_ADDR_STRING,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING*,
    ip_address : Win32cr::NetworkManagement::IpHelper::IP_ADDRESS_STRING,
    ip_mask : Win32cr::NetworkManagement::IpHelper::IP_ADDRESS_STRING,
    context : UInt32

  @[Extern]
  record IP_ADAPTER_INFO,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_INFO*,
    combo_index : UInt32,
    adapter_name : Win32cr::Foundation::CHAR[260],
    description : Win32cr::Foundation::CHAR[132],
    address_length : UInt32,
    address : UInt8[8],
    index : UInt32,
    type__ : UInt32,
    dhcp_enabled : UInt32,
    current_ip_address : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING*,
    ip_address_list : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING,
    gateway_list : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING,
    dhcp_server : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING,
    have_wins : Win32cr::Foundation::BOOL,
    primary_wins_server : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING,
    secondary_wins_server : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING,
    lease_obtained : Int64,
    lease_expires : Int64

  @[Extern]
  record IP_ADAPTER_UNICAST_ADDRESS_LH,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_UNICAST_ADDRESS_LH*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS,
    prefix_origin : Win32cr::Networking::WinSock::NL_PREFIX_ORIGIN,
    suffix_origin : Win32cr::Networking::WinSock::NL_SUFFIX_ORIGIN,
    dad_state : Win32cr::Networking::WinSock::NL_DAD_STATE,
    valid_lifetime : UInt32,
    preferred_lifetime : UInt32,
    lease_lifetime : UInt32,
    on_link_prefix_length : UInt8 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        flags : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_UNICAST_ADDRESS_XP,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_UNICAST_ADDRESS_XP*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS,
    prefix_origin : Win32cr::Networking::WinSock::NL_PREFIX_ORIGIN,
    suffix_origin : Win32cr::Networking::WinSock::NL_SUFFIX_ORIGIN,
    dad_state : Win32cr::Networking::WinSock::NL_DAD_STATE,
    valid_lifetime : UInt32,
    preferred_lifetime : UInt32,
    lease_lifetime : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        flags : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_ANYCAST_ADDRESS_XP,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_ANYCAST_ADDRESS_XP*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        flags : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_MULTICAST_ADDRESS_XP,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_MULTICAST_ADDRESS_XP*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        flags : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_DNS_SERVER_ADDRESS_XP,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_DNS_SERVER_ADDRESS_XP*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        reserved : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_WINS_SERVER_ADDRESS_LH,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_WINS_SERVER_ADDRESS_LH*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        reserved : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_GATEWAY_ADDRESS_LH,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_GATEWAY_ADDRESS_LH*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        reserved : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_PREFIX_XP,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_PREFIX_XP*,
    address : Win32cr::Networking::WinSock::SOCKET_ADDRESS,
    prefix_length : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        flags : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_DNS_SUFFIX,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_DNS_SUFFIX*,
    string : UInt16[256]

  @[Extern]
  record IP_ADAPTER_ADDRESSES_LH,
    anonymous1 : Anonymous1_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_ADDRESSES_LH*,
    adapter_name : Win32cr::Foundation::PSTR,
    first_unicast_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_UNICAST_ADDRESS_LH*,
    first_anycast_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_ANYCAST_ADDRESS_XP*,
    first_multicast_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_MULTICAST_ADDRESS_XP*,
    first_dns_server_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_DNS_SERVER_ADDRESS_XP*,
    dns_suffix : Win32cr::Foundation::PWSTR,
    description : Win32cr::Foundation::PWSTR,
    friendly_name : Win32cr::Foundation::PWSTR,
    physical_address : UInt8[8],
    physical_address_length : UInt32,
    anonymous2 : Anonymous2_e__Union_,
    mtu : UInt32,
    if_type : UInt32,
    oper_status : Win32cr::NetworkManagement::Ndis::IF_OPER_STATUS,
    ipv6_if_index : UInt32,
    zone_indices : UInt32[16],
    first_prefix : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_PREFIX_XP*,
    transmit_link_speed : UInt64,
    receive_link_speed : UInt64,
    first_wins_server_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_WINS_SERVER_ADDRESS_LH*,
    first_gateway_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_GATEWAY_ADDRESS_LH*,
    ipv4_metric : UInt32,
    ipv6_metric : UInt32,
    luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH,
    dhcpv4_server : Win32cr::Networking::WinSock::SOCKET_ADDRESS,
    compartment_id : UInt32,
    network_guid : LibC::GUID,
    connection_type : Win32cr::NetworkManagement::Ndis::NET_IF_CONNECTION_TYPE,
    tunnel_type : Win32cr::NetworkManagement::Ndis::TUNNEL_TYPE,
    dhcpv6_server : Win32cr::Networking::WinSock::SOCKET_ADDRESS,
    dhcpv6_client_duid : UInt8[130],
    dhcpv6_client_duid_length : UInt32,
    dhcpv6_iaid : UInt32,
    first_dns_suffix : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_DNS_SUFFIX* do

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      flags : UInt32,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        _bitfield : UInt32

    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        if_index : UInt32

    end

  end

  @[Extern]
  record IP_ADAPTER_ADDRESSES_XP,
    anonymous : Anonymous_e__Union_,
    next__ : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_ADDRESSES_XP*,
    adapter_name : Win32cr::Foundation::PSTR,
    first_unicast_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_UNICAST_ADDRESS_XP*,
    first_anycast_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_ANYCAST_ADDRESS_XP*,
    first_multicast_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_MULTICAST_ADDRESS_XP*,
    first_dns_server_address : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_DNS_SERVER_ADDRESS_XP*,
    dns_suffix : Win32cr::Foundation::PWSTR,
    description : Win32cr::Foundation::PWSTR,
    friendly_name : Win32cr::Foundation::PWSTR,
    physical_address : UInt8[8],
    physical_address_length : UInt32,
    flags : UInt32,
    mtu : UInt32,
    if_type : UInt32,
    oper_status : Win32cr::NetworkManagement::Ndis::IF_OPER_STATUS,
    ipv6_if_index : UInt32,
    zone_indices : UInt32[16],
    first_prefix : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_PREFIX_XP* do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      alignment : UInt64,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        length : UInt32,
        if_index : UInt32

    end

  end

  @[Extern]
  record IP_PER_ADAPTER_INFO_W2KSP1,
    autoconfig_enabled : UInt32,
    autoconfig_active : UInt32,
    current_dns_server : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING*,
    dns_server_list : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING

  @[Extern]
  record FIXED_INFO_W2KSP1,
    host_name : Win32cr::Foundation::CHAR[132],
    domain_name : Win32cr::Foundation::CHAR[132],
    current_dns_server : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING*,
    dns_server_list : Win32cr::NetworkManagement::IpHelper::IP_ADDR_STRING,
    node_type : UInt32,
    scope_id : Win32cr::Foundation::CHAR[260],
    enable_routing : UInt32,
    enable_proxy : UInt32,
    enable_dns : UInt32

  @[Extern]
  record Ip_interface_name_info_w2ksp1,
    index : UInt32,
    media_type : UInt32,
    connection_type : UInt8,
    access_type : UInt8,
    device_guid : LibC::GUID,
    interface_guid : LibC::GUID

  @[Extern]
  record TCP_ESTATS_SYN_OPTS_ROS_v0,
    active_open : Win32cr::Foundation::BOOLEAN,
    mss_rcvd : UInt32,
    mss_sent : UInt32

  @[Extern]
  record TCP_ESTATS_DATA_ROD_v0,
    data_bytes_out : UInt64,
    data_segs_out : UInt64,
    data_bytes_in : UInt64,
    data_segs_in : UInt64,
    segs_out : UInt64,
    segs_in : UInt64,
    soft_errors : UInt32,
    soft_error_reason : UInt32,
    snd_una : UInt32,
    snd_nxt : UInt32,
    snd_max : UInt32,
    thru_bytes_acked : UInt64,
    rcv_nxt : UInt32,
    thru_bytes_received : UInt64

  @[Extern]
  record TCP_ESTATS_DATA_RW_v0,
    enable_collection : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_SND_CONG_ROD_v0,
    snd_lim_trans_rwin : UInt32,
    snd_lim_time_rwin : UInt32,
    snd_lim_bytes_rwin : LibC::UIntPtrT,
    snd_lim_trans_cwnd : UInt32,
    snd_lim_time_cwnd : UInt32,
    snd_lim_bytes_cwnd : LibC::UIntPtrT,
    snd_lim_trans_snd : UInt32,
    snd_lim_time_snd : UInt32,
    snd_lim_bytes_snd : LibC::UIntPtrT,
    slow_start : UInt32,
    cong_avoid : UInt32,
    other_reductions : UInt32,
    cur_cwnd : UInt32,
    max_ss_cwnd : UInt32,
    max_ca_cwnd : UInt32,
    cur_ssthresh : UInt32,
    max_ssthresh : UInt32,
    min_ssthresh : UInt32

  @[Extern]
  record TCP_ESTATS_SND_CONG_ROS_v0,
    lim_cwnd : UInt32

  @[Extern]
  record TCP_ESTATS_SND_CONG_RW_v0,
    enable_collection : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_PATH_ROD_v0,
    fast_retran : UInt32,
    timeouts : UInt32,
    subsequent_timeouts : UInt32,
    cur_timeout_count : UInt32,
    abrupt_timeouts : UInt32,
    pkts_retrans : UInt32,
    bytes_retrans : UInt32,
    dup_acks_in : UInt32,
    sacks_rcvd : UInt32,
    sack_blocks_rcvd : UInt32,
    cong_signals : UInt32,
    pre_cong_sum_cwnd : UInt32,
    pre_cong_sum_rtt : UInt32,
    post_cong_sum_rtt : UInt32,
    post_cong_count_rtt : UInt32,
    ecn_signals : UInt32,
    ece_rcvd : UInt32,
    send_stall : UInt32,
    quench_rcvd : UInt32,
    retran_thresh : UInt32,
    snd_dup_ack_episodes : UInt32,
    sum_bytes_reordered : UInt32,
    non_recov_da : UInt32,
    non_recov_da_episodes : UInt32,
    ack_after_fr : UInt32,
    dsack_dups : UInt32,
    sample_rtt : UInt32,
    smoothed_rtt : UInt32,
    rtt_var : UInt32,
    max_rtt : UInt32,
    min_rtt : UInt32,
    sum_rtt : UInt32,
    count_rtt : UInt32,
    cur_rto : UInt32,
    max_rto : UInt32,
    min_rto : UInt32,
    cur_mss : UInt32,
    max_mss : UInt32,
    min_mss : UInt32,
    spurious_rto_detections : UInt32

  @[Extern]
  record TCP_ESTATS_PATH_RW_v0,
    enable_collection : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_SEND_BUFF_ROD_v0,
    cur_retx_queue : LibC::UIntPtrT,
    max_retx_queue : LibC::UIntPtrT,
    cur_app_w_queue : LibC::UIntPtrT,
    max_app_w_queue : LibC::UIntPtrT

  @[Extern]
  record TCP_ESTATS_SEND_BUFF_RW_v0,
    enable_collection : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_REC_ROD_v0,
    cur_rwin_sent : UInt32,
    max_rwin_sent : UInt32,
    min_rwin_sent : UInt32,
    lim_rwin : UInt32,
    dup_ack_episodes : UInt32,
    dup_acks_out : UInt32,
    ce_rcvd : UInt32,
    ecn_sent : UInt32,
    ecn_nonces_rcvd : UInt32,
    cur_reasm_queue : UInt32,
    max_reasm_queue : UInt32,
    cur_app_r_queue : LibC::UIntPtrT,
    max_app_r_queue : LibC::UIntPtrT,
    win_scale_sent : UInt8

  @[Extern]
  record TCP_ESTATS_REC_RW_v0,
    enable_collection : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_OBS_REC_ROD_v0,
    cur_rwin_rcvd : UInt32,
    max_rwin_rcvd : UInt32,
    min_rwin_rcvd : UInt32,
    win_scale_rcvd : UInt8

  @[Extern]
  record TCP_ESTATS_OBS_REC_RW_v0,
    enable_collection : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_BANDWIDTH_RW_v0,
    enable_collection_outbound : Win32cr::NetworkManagement::IpHelper::TCP_BOOLEAN_OPTIONAL,
    enable_collection_inbound : Win32cr::NetworkManagement::IpHelper::TCP_BOOLEAN_OPTIONAL

  @[Extern]
  record TCP_ESTATS_BANDWIDTH_ROD_v0,
    outbound_bandwidth : UInt64,
    inbound_bandwidth : UInt64,
    outbound_instability : UInt64,
    inbound_instability : UInt64,
    outbound_bandwidth_peaked : Win32cr::Foundation::BOOLEAN,
    inbound_bandwidth_peaked : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_FINE_RTT_RW_v0,
    enable_collection : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record TCP_ESTATS_FINE_RTT_ROD_v0,
    rtt_var : UInt32,
    max_rtt : UInt32,
    min_rtt : UInt32,
    sum_rtt : UInt32

  @[Extern]
  record INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES,
    ptp_v2_over_udp_i_pv4_event_message_receive : Win32cr::Foundation::BOOLEAN,
    ptp_v2_over_udp_i_pv4_all_message_receive : Win32cr::Foundation::BOOLEAN,
    ptp_v2_over_udp_i_pv4_event_message_transmit : Win32cr::Foundation::BOOLEAN,
    ptp_v2_over_udp_i_pv4_all_message_transmit : Win32cr::Foundation::BOOLEAN,
    ptp_v2_over_udp_i_pv6_event_message_receive : Win32cr::Foundation::BOOLEAN,
    ptp_v2_over_udp_i_pv6_all_message_receive : Win32cr::Foundation::BOOLEAN,
    ptp_v2_over_udp_i_pv6_event_message_transmit : Win32cr::Foundation::BOOLEAN,
    ptp_v2_over_udp_i_pv6_all_message_transmit : Win32cr::Foundation::BOOLEAN,
    all_receive : Win32cr::Foundation::BOOLEAN,
    all_transmit : Win32cr::Foundation::BOOLEAN,
    tagged_transmit : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES,
    all_receive : Win32cr::Foundation::BOOLEAN,
    all_transmit : Win32cr::Foundation::BOOLEAN,
    tagged_transmit : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record INTERFACE_TIMESTAMP_CAPABILITIES,
    hardware_clock_frequency_hz : UInt64,
    supports_cross_timestamp : Win32cr::Foundation::BOOLEAN,
    hardware_capabilities : Win32cr::NetworkManagement::IpHelper::INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES,
    software_capabilities : Win32cr::NetworkManagement::IpHelper::INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES

  @[Extern]
  record INTERFACE_HARDWARE_CROSSTIMESTAMP,
    system_timestamp1 : UInt64,
    hardware_clock_timestamp : UInt64,
    system_timestamp2 : UInt64

  @[Extern]
  record PF_FILTER_DESCRIPTOR,
    dwFilterFlags : UInt32,
    dwRule : UInt32,
    pfatType : Win32cr::NetworkManagement::IpHelper::PFADDRESSTYPE,
    src_addr : UInt8*,
    src_mask : UInt8*,
    dst_addr : UInt8*,
    dst_mask : UInt8*,
    dwProtocol : UInt32,
    fLateBound : UInt32,
    wSrcPort : UInt16,
    wDstPort : UInt16,
    wSrcPortHighRange : UInt16,
    wDstPortHighRange : UInt16

  @[Extern]
  record PF_FILTER_STATS,
    dwNumPacketsFiltered : UInt32,
    info : Win32cr::NetworkManagement::IpHelper::PF_FILTER_DESCRIPTOR

  @[Extern]
  record PF_INTERFACE_STATS,
    pvDriverContext : Void*,
    dwFlags : UInt32,
    dwInDrops : UInt32,
    dwOutDrops : UInt32,
    eaInAction : Win32cr::NetworkManagement::IpHelper::PFFORWARD_ACTION,
    eaOutAction : Win32cr::NetworkManagement::IpHelper::PFFORWARD_ACTION,
    dwNumInFilters : UInt32,
    dwNumOutFilters : UInt32,
    dwFrag : UInt32,
    dwSpoof : UInt32,
    dwReserved1 : UInt32,
    dwReserved2 : UInt32,
    liSYN : Win32cr::Foundation::LARGE_INTEGER,
    liTotalLogged : Win32cr::Foundation::LARGE_INTEGER,
    dwLostLogEntries : UInt32,
    filter_info : Win32cr::NetworkManagement::IpHelper::PF_FILTER_STATS*

  @[Extern]
  record PF_LATEBIND_INFO,
    src_addr : UInt8*,
    dst_addr : UInt8*,
    mask : UInt8*

  @[Extern]
  record PFLOGFRAME,
    timestamp : Win32cr::Foundation::LARGE_INTEGER,
    pfeTypeOfFrame : Win32cr::NetworkManagement::IpHelper::PFFRAMETYPE,
    dwTotalSizeUsed : UInt32,
    dwFilterRule : UInt32,
    wSizeOfAdditionalData : UInt16,
    wSizeOfIpHeader : UInt16,
    dwInterfaceName : UInt32,
    dwIPIndex : UInt32,
    bPacketData : UInt8*

  @[Link("iphlpapi")]
  lib C
    fun GetIfEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IF_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun GetIfEntry2Ex(level : Win32cr::NetworkManagement::IpHelper::MIB_IF_ENTRY_LEVEL, row : Win32cr::NetworkManagement::IpHelper::MIB_IF_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun GetIfTable2(table : Win32cr::NetworkManagement::IpHelper::MIB_IF_TABLE2**) : Win32cr::Foundation::NTSTATUS

    fun GetIfTable2Ex(level : Win32cr::NetworkManagement::IpHelper::MIB_IF_TABLE_LEVEL, table : Win32cr::NetworkManagement::IpHelper::MIB_IF_TABLE2**) : Win32cr::Foundation::NTSTATUS

    fun GetIfStackTable(table : Win32cr::NetworkManagement::IpHelper::MIB_IFSTACK_TABLE**) : Win32cr::Foundation::NTSTATUS

    fun GetInvertedIfStackTable(table : Win32cr::NetworkManagement::IpHelper::MIB_INVERTEDIFSTACK_TABLE**) : Win32cr::Foundation::NTSTATUS

    fun GetIpInterfaceEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_IPINTERFACE_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetIpInterfaceTable(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_IPINTERFACE_TABLE**) : Win32cr::Foundation::NTSTATUS

    fun InitializeIpInterfaceEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_IPINTERFACE_ROW*) : Void

    fun NotifyIpInterfaceChange(family : UInt16, callback : Win32cr::NetworkManagement::IpHelper::PIPINTERFACE_CHANGE_CALLBACK, caller_context : Void*, initial_notification : Win32cr::Foundation::BOOLEAN, notification_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::NTSTATUS

    fun SetIpInterfaceEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_IPINTERFACE_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetIpNetworkConnectionBandwidthEstimates(interface_index : UInt32, address_family : UInt16, bandwidth_estimates : Win32cr::NetworkManagement::IpHelper::MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES*) : Win32cr::Foundation::NTSTATUS

    fun CreateUnicastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun DeleteUnicastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetUnicastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetUnicastIpAddressTable(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_TABLE**) : Win32cr::Foundation::NTSTATUS

    fun InitializeUnicastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_ROW*) : Void

    fun NotifyUnicastIpAddressChange(family : UInt16, callback : Win32cr::NetworkManagement::IpHelper::PUNICAST_IPADDRESS_CHANGE_CALLBACK, caller_context : Void*, initial_notification : Win32cr::Foundation::BOOLEAN, notification_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::NTSTATUS

    fun NotifyStableUnicastIpAddressTable(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_TABLE**, caller_callback : Win32cr::NetworkManagement::IpHelper::PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK, caller_context : Void*, notification_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::NTSTATUS

    fun SetUnicastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_UNICASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun CreateAnycastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_ANYCASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun DeleteAnycastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_ANYCASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetAnycastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_ANYCASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetAnycastIpAddressTable(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_ANYCASTIPADDRESS_TABLE**) : Win32cr::Foundation::NTSTATUS

    fun GetMulticastIpAddressEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_MULTICASTIPADDRESS_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetMulticastIpAddressTable(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_MULTICASTIPADDRESS_TABLE**) : Win32cr::Foundation::NTSTATUS

    fun CreateIpForwardEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun DeleteIpForwardEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun GetBestRoute2(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, interface_index : UInt32, source_address : Win32cr::Networking::WinSock::SOCKADDR_INET*, destination_address : Win32cr::Networking::WinSock::SOCKADDR_INET*, address_sort_options : UInt32, best_route : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*, best_source_address : Win32cr::Networking::WinSock::SOCKADDR_INET*) : Win32cr::Foundation::NTSTATUS

    fun GetIpForwardEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun GetIpForwardTable2(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_TABLE2**) : Win32cr::Foundation::NTSTATUS

    fun InitializeIpForwardEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*) : Void

    fun NotifyRouteChange2(address_family : UInt16, callback : Win32cr::NetworkManagement::IpHelper::PIPFORWARD_CHANGE_CALLBACK, caller_context : Void*, initial_notification : Win32cr::Foundation::BOOLEAN, notification_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::NTSTATUS

    fun SetIpForwardEntry2(route : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARD_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun FlushIpPathTable(family : UInt16) : Win32cr::Foundation::NTSTATUS

    fun GetIpPathEntry(row : Win32cr::NetworkManagement::IpHelper::MIB_IPPATH_ROW*) : Win32cr::Foundation::NTSTATUS

    fun GetIpPathTable(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_IPPATH_TABLE**) : Win32cr::Foundation::NTSTATUS

    fun CreateIpNetEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun DeleteIpNetEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun FlushIpNetTable2(family : UInt16, interface_index : UInt32) : Win32cr::Foundation::NTSTATUS

    fun GetIpNetEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun GetIpNetTable2(family : UInt16, table : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_TABLE2**) : Win32cr::Foundation::NTSTATUS

    fun ResolveIpNetEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_ROW2*, source_address : Win32cr::Networking::WinSock::SOCKADDR_INET*) : Win32cr::Foundation::NTSTATUS

    fun SetIpNetEntry2(row : Win32cr::NetworkManagement::IpHelper::MIB_IPNET_ROW2*) : Win32cr::Foundation::NTSTATUS

    fun NotifyTeredoPortChange(callback : Win32cr::NetworkManagement::IpHelper::PTEREDO_PORT_CHANGE_CALLBACK, caller_context : Void*, initial_notification : Win32cr::Foundation::BOOLEAN, notification_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::NTSTATUS

    fun GetTeredoPort(port : UInt16*) : Win32cr::Foundation::NTSTATUS

    fun CancelMibChangeNotify2(notification_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::NTSTATUS

    fun FreeMibTable(memory : Void*) : Void

    fun CreateSortedAddressPairs(source_address_list : Win32cr::Networking::WinSock::SOCKADDR_IN6*, source_address_count : UInt32, destination_address_list : Win32cr::Networking::WinSock::SOCKADDR_IN6*, destination_address_count : UInt32, address_sort_options : UInt32, sorted_address_pair_list : Win32cr::Networking::WinSock::SOCKADDR_IN6_PAIR**, sorted_address_pair_count : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun ConvertCompartmentGuidToId(compartment_guid : LibC::GUID*, compartment_id : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun ConvertCompartmentIdToGuid(compartment_id : UInt32, compartment_guid : LibC::GUID*) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceNameToLuidA(interface_name : Win32cr::Foundation::PSTR, interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceNameToLuidW(interface_name : Win32cr::Foundation::PWSTR, interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceLuidToNameA(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, interface_name : UInt8*, length : LibC::UIntPtrT) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceLuidToNameW(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, interface_name : UInt16*, length : LibC::UIntPtrT) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceLuidToIndex(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, interface_index : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceIndexToLuid(interface_index : UInt32, interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceLuidToAlias(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, interface_alias : UInt16*, length : LibC::UIntPtrT) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceAliasToLuid(interface_alias : Win32cr::Foundation::PWSTR, interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceLuidToGuid(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, interface_guid : LibC::GUID*) : Win32cr::Foundation::NTSTATUS

    fun ConvertInterfaceGuidToLuid(interface_guid : LibC::GUID*, interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*) : Win32cr::Foundation::NTSTATUS

    fun if_nametoindex(interface_name : Win32cr::Foundation::PSTR) : UInt32

    fun if_indextoname(interface_index : UInt32, interface_name : UInt8*) : Win32cr::Foundation::PSTR

    fun GetCurrentThreadCompartmentId : UInt32

    fun SetCurrentThreadCompartmentId(compartment_id : UInt32) : Win32cr::Foundation::NTSTATUS

    fun GetCurrentThreadCompartmentScope(compartment_scope : UInt32*, compartment_id : UInt32*) : Void

    fun SetCurrentThreadCompartmentScope(compartment_scope : UInt32) : Win32cr::Foundation::NTSTATUS

    fun GetJobCompartmentId(job_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun SetJobCompartmentId(job_handle : Win32cr::Foundation::HANDLE, compartment_id : UInt32) : Win32cr::Foundation::NTSTATUS

    fun GetSessionCompartmentId(session_id : UInt32) : UInt32

    fun SetSessionCompartmentId(session_id : UInt32, compartment_id : UInt32) : Win32cr::Foundation::NTSTATUS

    fun GetDefaultCompartmentId : UInt32

    fun GetNetworkInformation(network_guid : LibC::GUID*, compartment_id : UInt32*, site_id : UInt32*, network_name : UInt16*, length : UInt32) : Win32cr::Foundation::NTSTATUS

    fun SetNetworkInformation(network_guid : LibC::GUID*, compartment_id : UInt32, network_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::NTSTATUS

    fun ConvertLengthToIpv4Mask(mask_length : UInt32, mask : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun ConvertIpv4MaskToLength(mask : UInt32, mask_length : UInt8*) : Win32cr::Foundation::NTSTATUS

    fun GetDnsSettings(settings : Win32cr::NetworkManagement::IpHelper::DNS_SETTINGS*) : Win32cr::Foundation::NTSTATUS

    fun FreeDnsSettings(settings : Win32cr::NetworkManagement::IpHelper::DNS_SETTINGS*) : Void

    fun SetDnsSettings(settings : Win32cr::NetworkManagement::IpHelper::DNS_SETTINGS*) : Win32cr::Foundation::NTSTATUS

    fun GetInterfaceDnsSettings(interface : LibC::GUID, settings : Win32cr::NetworkManagement::IpHelper::DNS_INTERFACE_SETTINGS*) : Win32cr::Foundation::NTSTATUS

    fun FreeInterfaceDnsSettings(settings : Win32cr::NetworkManagement::IpHelper::DNS_INTERFACE_SETTINGS*) : Void

    fun SetInterfaceDnsSettings(interface : LibC::GUID, settings : Win32cr::NetworkManagement::IpHelper::DNS_INTERFACE_SETTINGS*) : Win32cr::Foundation::NTSTATUS

    fun GetNetworkConnectivityHint(connectivity_hint : Win32cr::Networking::WinSock::NL_NETWORK_CONNECTIVITY_HINT*) : Win32cr::Foundation::NTSTATUS

    fun GetNetworkConnectivityHintForInterface(interface_index : UInt32, connectivity_hint : Win32cr::Networking::WinSock::NL_NETWORK_CONNECTIVITY_HINT*) : Win32cr::Foundation::NTSTATUS

    fun NotifyNetworkConnectivityHintChange(callback : Win32cr::NetworkManagement::IpHelper::PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK, caller_context : Void*, initial_notification : Win32cr::Foundation::BOOLEAN, notification_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::NTSTATUS

    fun IcmpCreateFile : Win32cr::NetworkManagement::IpHelper::IcmpHandle

    fun Icmp6CreateFile : Win32cr::NetworkManagement::IpHelper::IcmpHandle

    fun IcmpCloseHandle(icmp_handle : Win32cr::NetworkManagement::IpHelper::IcmpHandle) : Win32cr::Foundation::BOOL

    fun IcmpSendEcho(icmp_handle : Win32cr::NetworkManagement::IpHelper::IcmpHandle, destination_address : UInt32, request_data : Void*, request_size : UInt16, request_options : Win32cr::NetworkManagement::IpHelper::Ip_option_information*, reply_buffer : Void*, reply_size : UInt32, timeout : UInt32) : UInt32

    fun IcmpSendEcho2(icmp_handle : Win32cr::NetworkManagement::IpHelper::IcmpHandle, event : Win32cr::Foundation::HANDLE, apc_routine : Win32cr::System::WindowsProgramming::PIO_APC_ROUTINE, apc_context : Void*, destination_address : UInt32, request_data : Void*, request_size : UInt16, request_options : Win32cr::NetworkManagement::IpHelper::Ip_option_information*, reply_buffer : Void*, reply_size : UInt32, timeout : UInt32) : UInt32

    fun IcmpSendEcho2Ex(icmp_handle : Win32cr::NetworkManagement::IpHelper::IcmpHandle, event : Win32cr::Foundation::HANDLE, apc_routine : Win32cr::System::WindowsProgramming::PIO_APC_ROUTINE, apc_context : Void*, source_address : UInt32, destination_address : UInt32, request_data : Void*, request_size : UInt16, request_options : Win32cr::NetworkManagement::IpHelper::Ip_option_information*, reply_buffer : Void*, reply_size : UInt32, timeout : UInt32) : UInt32

    fun Icmp6SendEcho2(icmp_handle : Win32cr::NetworkManagement::IpHelper::IcmpHandle, event : Win32cr::Foundation::HANDLE, apc_routine : Win32cr::System::WindowsProgramming::PIO_APC_ROUTINE, apc_context : Void*, source_address : Win32cr::Networking::WinSock::SOCKADDR_IN6*, destination_address : Win32cr::Networking::WinSock::SOCKADDR_IN6*, request_data : Void*, request_size : UInt16, request_options : Win32cr::NetworkManagement::IpHelper::Ip_option_information*, reply_buffer : Void*, reply_size : UInt32, timeout : UInt32) : UInt32

    fun IcmpParseReplies(reply_buffer : Void*, reply_size : UInt32) : UInt32

    fun Icmp6ParseReplies(reply_buffer : Void*, reply_size : UInt32) : UInt32

    fun GetNumberOfInterfaces(pdwNumIf : UInt32*) : UInt32

    fun GetIfEntry(pIfRow : Win32cr::NetworkManagement::IpHelper::MIB_IFROW*) : UInt32

    fun GetIfTable(pIfTable : Win32cr::NetworkManagement::IpHelper::MIB_IFTABLE*, pdwSize : UInt32*, bOrder : Win32cr::Foundation::BOOL) : UInt32

    fun GetIpAddrTable(pIpAddrTable : Win32cr::NetworkManagement::IpHelper::MIB_IPADDRTABLE*, pdwSize : UInt32*, bOrder : Win32cr::Foundation::BOOL) : UInt32

    fun GetIpNetTable(ip_net_table : Win32cr::NetworkManagement::IpHelper::MIB_IPNETTABLE*, size_pointer : UInt32*, order : Win32cr::Foundation::BOOL) : UInt32

    fun GetIpForwardTable(pIpForwardTable : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARDTABLE*, pdwSize : UInt32*, bOrder : Win32cr::Foundation::BOOL) : UInt32

    fun GetTcpTable(tcp_table : Win32cr::NetworkManagement::IpHelper::MIB_TCPTABLE*, size_pointer : UInt32*, order : Win32cr::Foundation::BOOL) : UInt32

    fun GetExtendedTcpTable(pTcpTable : Void*, pdwSize : UInt32*, bOrder : Win32cr::Foundation::BOOL, ulAf : UInt32, table_class : Win32cr::NetworkManagement::IpHelper::TCP_TABLE_CLASS, reserved : UInt32) : UInt32

    fun GetOwnerModuleFromTcpEntry(pTcpEntry : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW_OWNER_MODULE*, class__ : Win32cr::NetworkManagement::IpHelper::TCPIP_OWNER_MODULE_INFO_CLASS, pBuffer : Void*, pdwSize : UInt32*) : UInt32

    fun GetUdpTable(udp_table : Win32cr::NetworkManagement::IpHelper::MIB_UDPTABLE*, size_pointer : UInt32*, order : Win32cr::Foundation::BOOL) : UInt32

    fun GetExtendedUdpTable(pUdpTable : Void*, pdwSize : UInt32*, bOrder : Win32cr::Foundation::BOOL, ulAf : UInt32, table_class : Win32cr::NetworkManagement::IpHelper::UDP_TABLE_CLASS, reserved : UInt32) : UInt32

    fun GetOwnerModuleFromUdpEntry(pUdpEntry : Win32cr::NetworkManagement::IpHelper::MIB_UDPROW_OWNER_MODULE*, class__ : Win32cr::NetworkManagement::IpHelper::TCPIP_OWNER_MODULE_INFO_CLASS, pBuffer : Void*, pdwSize : UInt32*) : UInt32

    fun GetTcpTable2(tcp_table : Win32cr::NetworkManagement::IpHelper::MIB_TCPTABLE2*, size_pointer : UInt32*, order : Win32cr::Foundation::BOOL) : UInt32

    fun GetTcp6Table(tcp_table : Win32cr::NetworkManagement::IpHelper::MIB_TCP6TABLE*, size_pointer : UInt32*, order : Win32cr::Foundation::BOOL) : UInt32

    fun GetTcp6Table2(tcp_table : Win32cr::NetworkManagement::IpHelper::MIB_TCP6TABLE2*, size_pointer : UInt32*, order : Win32cr::Foundation::BOOL) : UInt32

    fun GetPerTcpConnectionEStats(row : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW_LH*, estats_type : Win32cr::NetworkManagement::IpHelper::TCP_ESTATS_TYPE, rw : UInt8*, rw_version : UInt32, rw_size : UInt32, ros : UInt8*, ros_version : UInt32, ros_size : UInt32, rod : UInt8*, rod_version : UInt32, rod_size : UInt32) : UInt32

    fun SetPerTcpConnectionEStats(row : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW_LH*, estats_type : Win32cr::NetworkManagement::IpHelper::TCP_ESTATS_TYPE, rw : UInt8*, rw_version : UInt32, rw_size : UInt32, offset : UInt32) : UInt32

    fun GetPerTcp6ConnectionEStats(row : Win32cr::NetworkManagement::IpHelper::MIB_TCP6ROW*, estats_type : Win32cr::NetworkManagement::IpHelper::TCP_ESTATS_TYPE, rw : UInt8*, rw_version : UInt32, rw_size : UInt32, ros : UInt8*, ros_version : UInt32, ros_size : UInt32, rod : UInt8*, rod_version : UInt32, rod_size : UInt32) : UInt32

    fun SetPerTcp6ConnectionEStats(row : Win32cr::NetworkManagement::IpHelper::MIB_TCP6ROW*, estats_type : Win32cr::NetworkManagement::IpHelper::TCP_ESTATS_TYPE, rw : UInt8*, rw_version : UInt32, rw_size : UInt32, offset : UInt32) : UInt32

    fun GetOwnerModuleFromTcp6Entry(pTcpEntry : Win32cr::NetworkManagement::IpHelper::MIB_TCP6ROW_OWNER_MODULE*, class__ : Win32cr::NetworkManagement::IpHelper::TCPIP_OWNER_MODULE_INFO_CLASS, pBuffer : Void*, pdwSize : UInt32*) : UInt32

    fun GetUdp6Table(udp6_table : Win32cr::NetworkManagement::IpHelper::MIB_UDP6TABLE*, size_pointer : UInt32*, order : Win32cr::Foundation::BOOL) : UInt32

    fun GetOwnerModuleFromUdp6Entry(pUdpEntry : Win32cr::NetworkManagement::IpHelper::MIB_UDP6ROW_OWNER_MODULE*, class__ : Win32cr::NetworkManagement::IpHelper::TCPIP_OWNER_MODULE_INFO_CLASS, pBuffer : Void*, pdwSize : UInt32*) : UInt32

    fun GetOwnerModuleFromPidAndInfo(ulPid : UInt32, pInfo : UInt64*, class__ : Win32cr::NetworkManagement::IpHelper::TCPIP_OWNER_MODULE_INFO_CLASS, pBuffer : Void*, pdwSize : UInt32*) : UInt32

    fun GetIpStatistics(statistics : Win32cr::NetworkManagement::IpHelper::MIB_IPSTATS_LH*) : UInt32

    fun GetIcmpStatistics(statistics : Win32cr::NetworkManagement::IpHelper::MIB_ICMP*) : UInt32

    fun GetTcpStatistics(statistics : Win32cr::NetworkManagement::IpHelper::MIB_TCPSTATS_LH*) : UInt32

    fun GetUdpStatistics(stats : Win32cr::NetworkManagement::IpHelper::MIB_UDPSTATS*) : UInt32

    fun SetIpStatisticsEx(statistics : Win32cr::NetworkManagement::IpHelper::MIB_IPSTATS_LH*, family : UInt32) : UInt32

    fun GetIpStatisticsEx(statistics : Win32cr::NetworkManagement::IpHelper::MIB_IPSTATS_LH*, family : Win32cr::Networking::WinSock::ADDRESS_FAMILY) : UInt32

    fun GetIcmpStatisticsEx(statistics : Win32cr::NetworkManagement::IpHelper::MIB_ICMP_EX_XPSP1*, family : UInt32) : UInt32

    fun GetTcpStatisticsEx(statistics : Win32cr::NetworkManagement::IpHelper::MIB_TCPSTATS_LH*, family : Win32cr::Networking::WinSock::ADDRESS_FAMILY) : UInt32

    fun GetUdpStatisticsEx(statistics : Win32cr::NetworkManagement::IpHelper::MIB_UDPSTATS*, family : Win32cr::Networking::WinSock::ADDRESS_FAMILY) : UInt32

    fun GetTcpStatisticsEx2(statistics : Win32cr::NetworkManagement::IpHelper::MIB_TCPSTATS2*, family : Win32cr::Networking::WinSock::ADDRESS_FAMILY) : UInt32

    fun GetUdpStatisticsEx2(statistics : Win32cr::NetworkManagement::IpHelper::MIB_UDPSTATS2*, family : Win32cr::Networking::WinSock::ADDRESS_FAMILY) : UInt32

    fun SetIfEntry(pIfRow : Win32cr::NetworkManagement::IpHelper::MIB_IFROW*) : UInt32

    fun CreateIpForwardEntry(pRoute : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARDROW*) : UInt32

    fun SetIpForwardEntry(pRoute : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARDROW*) : UInt32

    fun DeleteIpForwardEntry(pRoute : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARDROW*) : UInt32

    fun SetIpStatistics(pIpStats : Win32cr::NetworkManagement::IpHelper::MIB_IPSTATS_LH*) : UInt32

    fun SetIpTTL(nTTL : UInt32) : UInt32

    fun CreateIpNetEntry(pArpEntry : Win32cr::NetworkManagement::IpHelper::MIB_IPNETROW_LH*) : UInt32

    fun SetIpNetEntry(pArpEntry : Win32cr::NetworkManagement::IpHelper::MIB_IPNETROW_LH*) : UInt32

    fun DeleteIpNetEntry(pArpEntry : Win32cr::NetworkManagement::IpHelper::MIB_IPNETROW_LH*) : UInt32

    fun FlushIpNetTable(dwIfIndex : UInt32) : UInt32

    fun CreateProxyArpEntry(dwAddress : UInt32, dwMask : UInt32, dwIfIndex : UInt32) : UInt32

    fun DeleteProxyArpEntry(dwAddress : UInt32, dwMask : UInt32, dwIfIndex : UInt32) : UInt32

    fun SetTcpEntry(pTcpRow : Win32cr::NetworkManagement::IpHelper::MIB_TCPROW_LH*) : UInt32

    fun GetInterfaceInfo(pIfTable : Win32cr::NetworkManagement::IpHelper::IP_INTERFACE_INFO*, dwOutBufLen : UInt32*) : UInt32

    fun GetUniDirectionalAdapterInfo(pIPIfInfo : Win32cr::NetworkManagement::IpHelper::IP_UNIDIRECTIONAL_ADAPTER_ADDRESS*, dwOutBufLen : UInt32*) : UInt32

    fun NhpAllocateAndGetInterfaceInfoFromStack(ppTable : Win32cr::NetworkManagement::IpHelper::Ip_interface_name_info_w2ksp1**, pdwCount : UInt32*, bOrder : Win32cr::Foundation::BOOL, hHeap : Win32cr::Foundation::HANDLE, dwFlags : UInt32) : UInt32

    fun GetBestInterface(dwDestAddr : UInt32, pdwBestIfIndex : UInt32*) : UInt32

    fun GetBestInterfaceEx(pDestAddr : Win32cr::Networking::WinSock::SOCKADDR*, pdwBestIfIndex : UInt32*) : UInt32

    fun GetBestRoute(dwDestAddr : UInt32, dwSourceAddr : UInt32, pBestRoute : Win32cr::NetworkManagement::IpHelper::MIB_IPFORWARDROW*) : UInt32

    fun NotifyAddrChange(handle : Win32cr::Foundation::HANDLE*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun NotifyRouteChange(handle : Win32cr::Foundation::HANDLE*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun CancelIPChangeNotify(notifyOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    fun GetAdapterIndex(adapter_name : Win32cr::Foundation::PWSTR, if_index : UInt32*) : UInt32

    fun AddIPAddress(address : UInt32, ip_mask : UInt32, if_index : UInt32, nte_context : UInt32*, nte_instance : UInt32*) : UInt32

    fun DeleteIPAddress(nte_context : UInt32) : UInt32

    fun GetNetworkParams(pFixedInfo : Win32cr::NetworkManagement::IpHelper::FIXED_INFO_W2KSP1*, pOutBufLen : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun GetAdaptersInfo(adapter_info : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_INFO*, size_pointer : UInt32*) : UInt32

    fun GetAdapterOrderMap : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_ORDER_MAP*

    fun GetAdaptersAddresses(family : Win32cr::Networking::WinSock::ADDRESS_FAMILY, flags : Win32cr::NetworkManagement::IpHelper::GET_ADAPTERS_ADDRESSES_FLAGS, reserved : Void*, adapter_addresses : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_ADDRESSES_LH*, size_pointer : UInt32*) : UInt32

    fun GetPerAdapterInfo(if_index : UInt32, pPerAdapterInfo : Win32cr::NetworkManagement::IpHelper::IP_PER_ADAPTER_INFO_W2KSP1*, pOutBufLen : UInt32*) : UInt32

    fun GetInterfaceActiveTimestampCapabilities(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, timestamp_capabilites : Win32cr::NetworkManagement::IpHelper::INTERFACE_TIMESTAMP_CAPABILITIES*) : UInt32

    fun GetInterfaceSupportedTimestampCapabilities(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, timestamp_capabilites : Win32cr::NetworkManagement::IpHelper::INTERFACE_TIMESTAMP_CAPABILITIES*) : UInt32

    fun CaptureInterfaceHardwareCrossTimestamp(interface_luid : Win32cr::NetworkManagement::Ndis::NET_LUID_LH*, cross_timestamp : Win32cr::NetworkManagement::IpHelper::INTERFACE_HARDWARE_CROSSTIMESTAMP*) : UInt32

    fun RegisterInterfaceTimestampConfigChange(callback : Win32cr::NetworkManagement::IpHelper::PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK, caller_context : Void*, notification_handle : Win32cr::NetworkManagement::IpHelper::HIFTIMESTAMPCHANGE*) : UInt32

    fun UnregisterInterfaceTimestampConfigChange(notification_handle : Win32cr::NetworkManagement::IpHelper::HIFTIMESTAMPCHANGE) : Void

    fun IpReleaseAddress(adapter_info : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_INDEX_MAP*) : UInt32

    fun IpRenewAddress(adapter_info : Win32cr::NetworkManagement::IpHelper::IP_ADAPTER_INDEX_MAP*) : UInt32

    fun SendARP(dest_ip : UInt32, src_ip : UInt32, pMacAddr : Void*, phy_addr_len : UInt32*) : UInt32

    fun GetRTTAndHopCount(dest_ip_address : UInt32, hop_count : UInt32*, max_hops : UInt32, rtt : UInt32*) : Win32cr::Foundation::BOOL

    fun GetFriendlyIfIndex(if_index : UInt32) : UInt32

    fun EnableRouter(pHandle : Win32cr::Foundation::HANDLE*, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun UnenableRouter(pOverlapped : Win32cr::System::IO::OVERLAPPED*, lpdwEnableCount : UInt32*) : UInt32

    fun DisableMediaSense(pHandle : Win32cr::Foundation::HANDLE*, pOverLapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun RestoreMediaSense(pOverlapped : Win32cr::System::IO::OVERLAPPED*, lpdwEnableCount : UInt32*) : UInt32

    fun GetIpErrorString(error_code : UInt32, buffer : Win32cr::Foundation::PWSTR, size : UInt32*) : UInt32

    fun ResolveNeighbor(network_address : Win32cr::Networking::WinSock::SOCKADDR*, physical_address : Void*, physical_address_length : UInt32*) : UInt32

    fun CreatePersistentTcpPortReservation(start_port : UInt16, number_of_ports : UInt16, token : UInt64*) : UInt32

    fun CreatePersistentUdpPortReservation(start_port : UInt16, number_of_ports : UInt16, token : UInt64*) : UInt32

    fun DeletePersistentTcpPortReservation(start_port : UInt16, number_of_ports : UInt16) : UInt32

    fun DeletePersistentUdpPortReservation(start_port : UInt16, number_of_ports : UInt16) : UInt32

    fun LookupPersistentTcpPortReservation(start_port : UInt16, number_of_ports : UInt16, token : UInt64*) : UInt32

    fun LookupPersistentUdpPortReservation(start_port : UInt16, number_of_ports : UInt16, token : UInt64*) : UInt32

    fun PfCreateInterface(dwName : UInt32, inAction : Win32cr::NetworkManagement::IpHelper::PFFORWARD_ACTION, outAction : Win32cr::NetworkManagement::IpHelper::PFFORWARD_ACTION, bUseLog : Win32cr::Foundation::BOOL, bMustBeUnique : Win32cr::Foundation::BOOL, ppInterface : Void**) : UInt32

    fun PfDeleteInterface(pInterface : Void*) : UInt32

    fun PfAddFiltersToInterface(ih : Void*, cInFilters : UInt32, pfiltIn : Win32cr::NetworkManagement::IpHelper::PF_FILTER_DESCRIPTOR*, cOutFilters : UInt32, pfiltOut : Win32cr::NetworkManagement::IpHelper::PF_FILTER_DESCRIPTOR*, pfHandle : Void**) : UInt32

    fun PfRemoveFiltersFromInterface(ih : Void*, cInFilters : UInt32, pfiltIn : Win32cr::NetworkManagement::IpHelper::PF_FILTER_DESCRIPTOR*, cOutFilters : UInt32, pfiltOut : Win32cr::NetworkManagement::IpHelper::PF_FILTER_DESCRIPTOR*) : UInt32

    fun PfRemoveFilterHandles(pInterface : Void*, cFilters : UInt32, pvHandles : Void**) : UInt32

    fun PfUnBindInterface(pInterface : Void*) : UInt32

    fun PfBindInterfaceToIndex(pInterface : Void*, dwIndex : UInt32, pfatLinkType : Win32cr::NetworkManagement::IpHelper::PFADDRESSTYPE, link_ip_address : UInt8*) : UInt32

    fun PfBindInterfaceToIPAddress(pInterface : Void*, pfatType : Win32cr::NetworkManagement::IpHelper::PFADDRESSTYPE, ip_address : UInt8*) : UInt32

    fun PfRebindFilters(pInterface : Void*, pLateBindInfo : Win32cr::NetworkManagement::IpHelper::PF_LATEBIND_INFO*) : UInt32

    fun PfAddGlobalFilterToInterface(pInterface : Void*, gfFilter : Win32cr::NetworkManagement::IpHelper::GLOBAL_FILTER) : UInt32

    fun PfRemoveGlobalFilterFromInterface(pInterface : Void*, gfFilter : Win32cr::NetworkManagement::IpHelper::GLOBAL_FILTER) : UInt32

    fun PfMakeLog(hEvent : Win32cr::Foundation::HANDLE) : UInt32

    fun PfSetLogBuffer(pbBuffer : UInt8*, dwSize : UInt32, dwThreshold : UInt32, dwEntries : UInt32, pdwLoggedEntries : UInt32*, pdwLostEntries : UInt32*, pdwSizeUsed : UInt32*) : UInt32

    fun PfDeleteLog : UInt32

    fun PfGetInterfaceStatistics(pInterface : Void*, ppfStats : Win32cr::NetworkManagement::IpHelper::PF_INTERFACE_STATS*, pdwBufferSize : UInt32*, fResetCounters : Win32cr::Foundation::BOOL) : UInt32

    fun PfTestPacket(pInInterface : Void*, pOutInterface : Void*, cBytes : UInt32, pbPacket : UInt8*, ppAction : Win32cr::NetworkManagement::IpHelper::PFFORWARD_ACTION*) : UInt32

  end
end