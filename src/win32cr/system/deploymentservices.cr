require "../foundation.cr"
require "../system/registry.cr"
require "../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wdsclientapi.dll")]
@[Link(ldflags: "/DELAYLOAD:wdspxe.dll")]
@[Link(ldflags: "/DELAYLOAD:wdsmc.dll")]
@[Link(ldflags: "/DELAYLOAD:wdstptc.dll")]
@[Link(ldflags: "/DELAYLOAD:wdsbp.dll")]
{% else %}
@[Link("wdsclientapi")]
@[Link("wdspxe")]
@[Link("wdsmc")]
@[Link("wdstptc")]
@[Link("wdsbp")]
{% end %}
lib LibWin32
  WDS_CLI_TRANSFER_ASYNCHRONOUS = 1_u32
  WDS_CLI_NO_SPARSE_FILE = 2_u32
  PXE_DHCP_SERVER_PORT = 67_u32
  PXE_DHCP_CLIENT_PORT = 68_u32
  PXE_SERVER_PORT = 4011_u32
  PXE_DHCPV6_SERVER_PORT = 547_u32
  PXE_DHCPV6_CLIENT_PORT = 546_u32
  PXE_DHCP_FILE_SIZE = 128_u32
  PXE_DHCP_SERVER_SIZE = 64_u32
  PXE_DHCP_HWAADR_SIZE = 16_u32
  PXE_DHCP_MAGIC_COOKIE_SIZE = 4_u32
  PXE_REG_INDEX_TOP = 0_u32
  PXE_REG_INDEX_BOTTOM = 4294967295_u32
  PXE_CALLBACK_RECV_REQUEST = 0_u32
  PXE_CALLBACK_SHUTDOWN = 1_u32
  PXE_CALLBACK_SERVICE_CONTROL = 2_u32
  PXE_CALLBACK_MAX = 3_u32
  PXE_GSI_TRACE_ENABLED = 1_u32
  PXE_GSI_SERVER_DUID = 2_u32
  PXE_MAX_ADDRESS = 16_u32
  PXE_ADDR_BROADCAST = 1_u32
  PXE_ADDR_USE_PORT = 2_u32
  PXE_ADDR_USE_ADDR = 4_u32
  PXE_ADDR_USE_DHCP_RULES = 8_u32
  PXE_DHCPV6_RELAY_HOP_COUNT_LIMIT = 32_u32
  PXE_BA_NBP = 1_u32
  PXE_BA_CUSTOM = 2_u32
  PXE_BA_IGNORE = 3_u32
  PXE_BA_REJECTED = 4_u32
  PXE_TRACE_VERBOSE = 65536_u32
  PXE_TRACE_INFO = 131072_u32
  PXE_TRACE_WARNING = 262144_u32
  PXE_TRACE_ERROR = 524288_u32
  PXE_TRACE_FATAL = 1048576_u32
  PXE_PROV_ATTR_FILTER = 0_u32
  PXE_PROV_ATTR_FILTER_IPV6 = 1_u32
  PXE_PROV_ATTR_IPV6_CAPABLE = 2_u32
  PXE_PROV_FILTER_ALL = 0_u32
  PXE_PROV_FILTER_DHCP_ONLY = 1_u32
  PXE_PROV_FILTER_PXE_ONLY = 2_u32
  MC_SERVER_CURRENT_VERSION = 1_u32
  TRANSPORTPROVIDER_CURRENT_VERSION = 1_u32
  WDS_MC_TRACE_VERBOSE = 65536_u32
  WDS_MC_TRACE_INFO = 131072_u32
  WDS_MC_TRACE_WARNING = 262144_u32
  WDS_MC_TRACE_ERROR = 524288_u32
  WDS_MC_TRACE_FATAL = 1048576_u32
  WDS_TRANSPORTCLIENT_CURRENT_API_VERSION = 1_u32
  WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST = 1_u32
  WDS_TRANSPORTCLIENT_NO_CACHE = 0_u32
  WDS_TRANSPORTCLIENT_STATUS_IN_PROGRESS = 1_u32
  WDS_TRANSPORTCLIENT_STATUS_SUCCESS = 2_u32
  WDS_TRANSPORTCLIENT_STATUS_FAILURE = 3_u32
  WDSTRANSPORT_RESOURCE_UTILIZATION_UNKNOWN = 255_u32
  WDSBP_PK_TYPE_DHCP = 1_u32
  WDSBP_PK_TYPE_WDSNBP = 2_u32
  WDSBP_PK_TYPE_BCD = 4_u32
  WDSBP_PK_TYPE_DHCPV6 = 8_u32
  WDSBP_OPT_TYPE_NONE = 0_u32
  WDSBP_OPT_TYPE_BYTE = 1_u32
  WDSBP_OPT_TYPE_USHORT = 2_u32
  WDSBP_OPT_TYPE_ULONG = 3_u32
  WDSBP_OPT_TYPE_WSTR = 4_u32
  WDSBP_OPT_TYPE_STR = 5_u32
  WDSBP_OPT_TYPE_IP4 = 6_u32
  WDSBP_OPT_TYPE_IP6 = 7_u32
  WDSBP_OPTVAL_ACTION_APPROVAL = 1_u32
  WDSBP_OPTVAL_ACTION_REFERRAL = 3_u32
  WDSBP_OPTVAL_ACTION_ABORT = 5_u32
  WDSBP_OPTVAL_PXE_PROMPT_OPTIN = 1_u32
  WDSBP_OPTVAL_PXE_PROMPT_NOPROMPT = 2_u32
  WDSBP_OPTVAL_PXE_PROMPT_OPTOUT = 3_u32
  WDSBP_OPTVAL_NBP_VER_7 = 1792_u32
  WDSBP_OPTVAL_NBP_VER_8 = 2048_u32
  FACILITY_WDSMCSERVER = 289_u32
  FACILITY_WDSMCCLIENT = 290_u32
  WDSMCSERVER_CATEGORY = 1_i32
  WDSMCCLIENT_CATEGORY = 2_i32
  WDSMCS_E_SESSION_SHUTDOWN_IN_PROGRESS = -1054801664_i32
  WDSMCS_E_REQCALLBACKS_NOT_REG = -1054801663_i32
  WDSMCS_E_INCOMPATIBLE_VERSION = -1054801662_i32
  WDSMCS_E_CONTENT_NOT_FOUND = -1054801661_i32
  WDSMCS_E_CLIENT_NOT_FOUND = -1054801660_i32
  WDSMCS_E_NAMESPACE_NOT_FOUND = -1054801659_i32
  WDSMCS_E_CONTENT_PROVIDER_NOT_FOUND = -1054801658_i32
  WDSMCS_E_NAMESPACE_ALREADY_EXISTS = -1054801657_i32
  WDSMCS_E_NAMESPACE_SHUTDOWN_IN_PROGRESS = -1054801656_i32
  WDSMCS_E_NAMESPACE_ALREADY_STARTED = -1054801655_i32
  WDSMCS_E_NS_START_FAILED_NO_CLIENTS = -1054801654_i32
  WDSMCS_E_START_TIME_IN_PAST = -1054801653_i32
  WDSMCS_E_PACKET_NOT_HASHED = -1054801652_i32
  WDSMCS_E_PACKET_NOT_SIGNED = -1054801651_i32
  WDSMCS_E_PACKET_HAS_SECURITY = -1054801650_i32
  WDSMCS_E_PACKET_NOT_CHECKSUMED = -1054801649_i32
  WDSMCS_E_CLIENT_DOESNOT_SUPPORT_SECURITY_MODE = -1054801648_i32
  EVT_WDSMCS_S_PARAMETERS_READ = 1092682240_i32
  EVT_WDSMCS_E_PARAMETERS_READ_FAILED = -1054801407_i32
  EVT_WDSMCS_E_DUPLICATE_MULTICAST_ADDR = -1054801406_i32
  EVT_WDSMCS_E_NON_WDS_DUPLICATE_MULTICAST_ADDR = -1054801405_i32
  EVT_WDSMCS_E_CP_DLL_LOAD_FAILED = -1054801328_i32
  EVT_WDSMCS_E_CP_INIT_FUNC_MISSING = -1054801327_i32
  EVT_WDSMCS_E_CP_INIT_FUNC_FAILED = -1054801326_i32
  EVT_WDSMCS_E_CP_INCOMPATIBLE_SERVER_VERSION = -1054801325_i32
  EVT_WDSMCS_E_CP_CALLBACKS_NOT_REG = -1054801324_i32
  EVT_WDSMCS_E_CP_SHUTDOWN_FUNC_FAILED = -1054801323_i32
  EVT_WDSMCS_E_CP_MEMORY_LEAK = -1054801322_i32
  EVT_WDSMCS_E_CP_OPEN_INSTANCE_FAILED = -1054801321_i32
  EVT_WDSMCS_E_CP_CLOSE_INSTANCE_FAILED = -1054801320_i32
  EVT_WDSMCS_E_CP_OPEN_CONTENT_FAILED = -1054801319_i32
  EVT_WDSMCS_W_CP_DLL_LOAD_FAILED_NOT_CRITICAL = -2128543142_i32
  EVT_WDSMCS_E_CP_DLL_LOAD_FAILED_CRITICAL = -1054801317_i32
  EVT_WDSMCS_E_NSREG_START_TIME_IN_PAST = -1054801152_i32
  EVT_WDSMCS_E_NSREG_CONTENT_PROVIDER_NOT_REG = -1054801151_i32
  EVT_WDSMCS_E_NSREG_NAMESPACE_EXISTS = -1054801150_i32
  EVT_WDSMCS_E_NSREG_FAILURE = -1054801149_i32
  WDSTPC_E_CALLBACKS_NOT_REG = -1054735616_i32
  WDSTPC_E_ALREADY_COMPLETED = -1054735615_i32
  WDSTPC_E_ALREADY_IN_PROGRESS = -1054735614_i32
  WDSTPC_E_UNKNOWN_ERROR = -1054735613_i32
  WDSTPC_E_NOT_INITIALIZED = -1054735612_i32
  WDSTPC_E_KICKED_POLICY_NOT_MET = -1054735611_i32
  WDSTPC_E_KICKED_FALLBACK = -1054735610_i32
  WDSTPC_E_KICKED_FAIL = -1054735609_i32
  WDSTPC_E_KICKED_UNKNOWN = -1054735608_i32
  WDSTPC_E_MULTISTREAM_NOT_ENABLED = -1054735607_i32
  WDSTPC_E_ALREADY_IN_LOWEST_SESSION = -1054735606_i32
  WDSTPC_E_CLIENT_DEMOTE_NOT_SUPPORTED = -1054735605_i32
  WDSTPC_E_NO_IP4_INTERFACE = -1054735604_i32
  WDSTPTC_E_WIM_APPLY_REQUIRES_REFERENCE_IMAGE = -1054735603_i32
  FACILITY_WDSTPTMGMT = 272_u32
  WDSTPTMGMT_CATEGORY = 1_i32
  WDSTPTMGMT_E_INVALID_PROPERTY = -1055915776_i32
  WDSTPTMGMT_E_INVALID_OPERATION = -1055915775_i32
  WDSTPTMGMT_E_INVALID_CLASS = -1055915774_i32
  WDSTPTMGMT_E_CONTENT_PROVIDER_ALREADY_REGISTERED = -1055915773_i32
  WDSTPTMGMT_E_CONTENT_PROVIDER_NOT_REGISTERED = -1055915772_i32
  WDSTPTMGMT_E_INVALID_CONTENT_PROVIDER_NAME = -1055915771_i32
  WDSTPTMGMT_E_TRANSPORT_SERVER_ROLE_NOT_CONFIGURED = -1055915770_i32
  WDSTPTMGMT_E_NAMESPACE_ALREADY_REGISTERED = -1055915769_i32
  WDSTPTMGMT_E_NAMESPACE_NOT_REGISTERED = -1055915768_i32
  WDSTPTMGMT_E_CANNOT_REINITIALIZE_OBJECT = -1055915767_i32
  WDSTPTMGMT_E_INVALID_NAMESPACE_NAME = -1055915766_i32
  WDSTPTMGMT_E_INVALID_NAMESPACE_DATA = -1055915765_i32
  WDSTPTMGMT_E_NAMESPACE_READ_ONLY = -1055915764_i32
  WDSTPTMGMT_E_INVALID_NAMESPACE_START_TIME = -1055915763_i32
  WDSTPTMGMT_E_INVALID_DIAGNOSTICS_COMPONENTS = -1055915762_i32
  WDSTPTMGMT_E_CANNOT_REFRESH_DIRTY_OBJECT = -1055915761_i32
  WDSTPTMGMT_E_INVALID_SERVICE_IP_ADDRESS_RANGE = -1055915760_i32
  WDSTPTMGMT_E_INVALID_SERVICE_PORT_RANGE = -1055915759_i32
  WDSTPTMGMT_E_INVALID_NAMESPACE_START_PARAMETERS = -1055915758_i32
  WDSTPTMGMT_E_TRANSPORT_SERVER_UNAVAILABLE = -1055915757_i32
  WDSTPTMGMT_E_NAMESPACE_NOT_ON_SERVER = -1055915756_i32
  WDSTPTMGMT_E_NAMESPACE_REMOVED_FROM_SERVER = -1055915755_i32
  WDSTPTMGMT_E_INVALID_IP_ADDRESS = -1055915754_i32
  WDSTPTMGMT_E_INVALID_IPV4_MULTICAST_ADDRESS = -1055915753_i32
  WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS = -1055915752_i32
  WDSTPTMGMT_E_IPV6_NOT_SUPPORTED = -1055915751_i32
  WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS_SOURCE = -1055915750_i32
  WDSTPTMGMT_E_INVALID_MULTISTREAM_STREAM_COUNT = -1055915749_i32
  WDSTPTMGMT_E_INVALID_AUTO_DISCONNECT_THRESHOLD = -1055915748_i32
  WDSTPTMGMT_E_MULTICAST_SESSION_POLICY_NOT_SUPPORTED = -1055915747_i32
  WDSTPTMGMT_E_INVALID_SLOW_CLIENT_HANDLING_TYPE = -1055915746_i32
  WDSTPTMGMT_E_NETWORK_PROFILES_NOT_SUPPORTED = -1055915745_i32
  WDSTPTMGMT_E_UDP_PORT_POLICY_NOT_SUPPORTED = -1055915744_i32
  WDSTPTMGMT_E_TFTP_MAX_BLOCKSIZE_NOT_SUPPORTED = -1055915743_i32
  WDSTPTMGMT_E_TFTP_VAR_WINDOW_NOT_SUPPORTED = -1055915742_i32
  WDSTPTMGMT_E_INVALID_TFTP_MAX_BLOCKSIZE = -1055915741_i32
  WdsCliFlagEnumFilterVersion = 1_i32
  WdsCliFlagEnumFilterFirmware = 2_i32
  WDS_LOG_TYPE_CLIENT_ERROR = 1_i32
  WDS_LOG_TYPE_CLIENT_STARTED = 2_i32
  WDS_LOG_TYPE_CLIENT_FINISHED = 3_i32
  WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED = 4_i32
  WDS_LOG_TYPE_CLIENT_APPLY_STARTED = 5_i32
  WDS_LOG_TYPE_CLIENT_APPLY_FINISHED = 6_i32
  WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE = 7_i32
  WDS_LOG_TYPE_CLIENT_UNATTEND_MODE = 8_i32
  WDS_LOG_TYPE_CLIENT_TRANSFER_START = 9_i32
  WDS_LOG_TYPE_CLIENT_TRANSFER_END = 10_i32
  WDS_LOG_TYPE_CLIENT_TRANSFER_DOWNGRADE = 11_i32
  WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR = 12_i32
  WDS_LOG_TYPE_CLIENT_POST_ACTIONS_START = 13_i32
  WDS_LOG_TYPE_CLIENT_POST_ACTIONS_END = 14_i32
  WDS_LOG_TYPE_CLIENT_APPLY_STARTED_2 = 15_i32
  WDS_LOG_TYPE_CLIENT_APPLY_FINISHED_2 = 16_i32
  WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR_2 = 17_i32
  WDS_LOG_TYPE_CLIENT_DRIVER_PACKAGE_NOT_ACCESSIBLE = 18_i32
  WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_START = 19_i32
  WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_END = 20_i32
  WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_FAILURE = 21_i32
  WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED2 = 22_i32
  WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED3 = 23_i32
  WDS_LOG_TYPE_CLIENT_MAX_CODE = 24_i32
  WDS_LOG_LEVEL_DISABLED = 0_i32
  WDS_LOG_LEVEL_ERROR = 1_i32
  WDS_LOG_LEVEL_WARNING = 2_i32
  WDS_LOG_LEVEL_INFO = 3_i32
  CLSID_WdsTransportCacheable = LibC::GUID.new(0x70590b16_u32, 0xf146_u16, 0x46bd_u16, StaticArray[0xbd_u8, 0x9d_u8, 0x4a_u8, 0xaa_u8, 0x90_u8, 0x8_u8, 0x4b_u8, 0xf5_u8])
  CLSID_WdsTransportCollection = LibC::GUID.new(0xc7f18b09_u32, 0x391e_u16, 0x436e_u16, StaticArray[0xb1_u8, 0xb_u8, 0xc3_u8, 0xef_u8, 0x46_u8, 0xf2_u8, 0xc3_u8, 0x4f_u8])
  CLSID_WdsTransportManager = LibC::GUID.new(0xf21523f6_u32, 0x837c_u16, 0x4a58_u16, StaticArray[0xaf_u8, 0x99_u8, 0x8a_u8, 0x7e_u8, 0x27_u8, 0xf8_u8, 0xff_u8, 0x59_u8])
  CLSID_WdsTransportServer = LibC::GUID.new(0xea19b643_u32, 0x4adf_u16, 0x4413_u16, StaticArray[0x94_u8, 0x2c_u8, 0x14_u8, 0xf3_u8, 0x79_u8, 0x11_u8, 0x87_u8, 0x60_u8])
  CLSID_WdsTransportSetupManager = LibC::GUID.new(0xc7beeaad_u32, 0x9f04_u16, 0x4923_u16, StaticArray[0x9f_u8, 0xc_u8, 0xfb_u8, 0xf5_u8, 0x2b_u8, 0xc7_u8, 0x59_u8, 0xf_u8])
  CLSID_WdsTransportConfigurationManager = LibC::GUID.new(0x8743f674_u32, 0x904c_u16, 0x47ca_u16, StaticArray[0x85_u8, 0x12_u8, 0x35_u8, 0xfe_u8, 0x98_u8, 0xf6_u8, 0xb0_u8, 0xac_u8])
  CLSID_WdsTransportNamespaceManager = LibC::GUID.new(0xf08cdb63_u32, 0x85de_u16, 0x4a28_u16, StaticArray[0xa1_u8, 0xa9_u8, 0x5c_u8, 0xa3_u8, 0xe7_u8, 0xef_u8, 0xda_u8, 0x73_u8])
  CLSID_WdsTransportServicePolicy = LibC::GUID.new(0x65aceadc_u32, 0x2f0b_u16, 0x4f43_u16, StaticArray[0x9f_u8, 0x4d_u8, 0x81_u8, 0x18_u8, 0x65_u8, 0xd8_u8, 0xce_u8, 0xad_u8])
  CLSID_WdsTransportDiagnosticsPolicy = LibC::GUID.new(0xeb3333e1_u32, 0xa7ad_u16, 0x46f5_u16, StaticArray[0x80_u8, 0xd6_u8, 0x6b_u8, 0x74_u8, 0x2_u8, 0x4_u8, 0xe5_u8, 0x9_u8])
  CLSID_WdsTransportMulticastSessionPolicy = LibC::GUID.new(0x3c6bc3f4_u32, 0x6418_u16, 0x472a_u16, StaticArray[0xb6_u8, 0xf1_u8, 0x52_u8, 0xd4_u8, 0x57_u8, 0x19_u8, 0x54_u8, 0x37_u8])
  CLSID_WdsTransportNamespace = LibC::GUID.new(0xd8385768_u32, 0x732_u16, 0x4ec1_u16, StaticArray[0x95_u8, 0xea_u8, 0x16_u8, 0xda_u8, 0x58_u8, 0x19_u8, 0x8_u8, 0xa1_u8])
  CLSID_WdsTransportNamespaceAutoCast = LibC::GUID.new(0xb091f5a8_u32, 0x6a99_u16, 0x478d_u16, StaticArray[0xb2_u8, 0x3b_u8, 0x9_u8, 0xe8_u8, 0xfe_u8, 0xe0_u8, 0x45_u8, 0x74_u8])
  CLSID_WdsTransportNamespaceScheduledCast = LibC::GUID.new(0xbadc1897_u32, 0x7025_u16, 0x44eb_u16, StaticArray[0x91_u8, 0x8_u8, 0xfb_u8, 0x61_u8, 0xc4_u8, 0x5_u8, 0x57_u8, 0x92_u8])
  CLSID_WdsTransportNamespaceScheduledCastManualStart = LibC::GUID.new(0xd3e1a2aa_u32, 0xcaac_u16, 0x460e_u16, StaticArray[0xb9_u8, 0x8a_u8, 0x47_u8, 0xf9_u8, 0xf3_u8, 0x18_u8, 0xa1_u8, 0xfa_u8])
  CLSID_WdsTransportNamespaceScheduledCastAutoStart = LibC::GUID.new(0xa1107052_u32, 0x122c_u16, 0x4b81_u16, StaticArray[0x9b_u8, 0x7c_u8, 0x38_u8, 0x6e_u8, 0x68_u8, 0x55_u8, 0x38_u8, 0x3f_u8])
  CLSID_WdsTransportContent = LibC::GUID.new(0xa891fe7_u32, 0x4a3f_u16, 0x4c65_u16, StaticArray[0xb6_u8, 0xf2_u8, 0x14_u8, 0x67_u8, 0x61_u8, 0x96_u8, 0x79_u8, 0xea_u8])
  CLSID_WdsTransportSession = LibC::GUID.new(0x749ac4e0_u32, 0x67bc_u16, 0x4743_u16, StaticArray[0xbf_u8, 0xe5_u8, 0xca_u8, 0xcb_u8, 0x1f_u8, 0x26_u8, 0xf5_u8, 0x7f_u8])
  CLSID_WdsTransportClient = LibC::GUID.new(0x66d2c5e9_u32, 0xff6_u16, 0x49ec_u16, StaticArray[0x97_u8, 0x33_u8, 0xda_u8, 0xfb_u8, 0x1e_u8, 0x1_u8, 0xdf_u8, 0x1c_u8])
  CLSID_WdsTransportTftpClient = LibC::GUID.new(0x50343925_u32, 0x7c5c_u16, 0x4c8c_u16, StaticArray[0x96_u8, 0xc4_u8, 0xad_u8, 0x9f_u8, 0xa5_u8, 0x0_u8, 0x5f_u8, 0xba_u8])
  CLSID_WdsTransportTftpManager = LibC::GUID.new(0xc8e9dca2_u32, 0x3241_u16, 0x4e4d_u16, StaticArray[0xb8_u8, 0x6_u8, 0xbc_u8, 0x74_u8, 0x1_u8, 0x9d_u8, 0xfe_u8, 0xda_u8])
  CLSID_WdsTransportContentProvider = LibC::GUID.new(0xe0be741f_u32, 0x5a75_u16, 0x4eb9_u16, StaticArray[0x8a_u8, 0x2d_u8, 0x5e_u8, 0x18_u8, 0x9b_u8, 0x45_u8, 0xf3_u8, 0x27_u8])

  alias PFN_WdsCliTraceFunction = Proc(LibC::LPWSTR, Int8*, Void)
  alias PFN_WdsCliCallback = Proc(PFN_WDS_CLI_CALLBACK_MESSAGE_ID, LibC::UINT_PTR, LPARAM, Void*, Void)
  alias PFN_WdsTransportClientSessionStart = Proc(LibC::HANDLE, Void*, ULARGE_INTEGER*, Void)
  alias PFN_WdsTransportClientSessionStartEx = Proc(LibC::HANDLE, Void*, TRANSPORTCLIENT_SESSION_INFO*, Void)
  alias PFN_WdsTransportClientReceiveMetadata = Proc(LibC::HANDLE, Void*, Void*, UInt32, Void)
  alias PFN_WdsTransportClientReceiveContents = Proc(LibC::HANDLE, Void*, Void*, UInt32, ULARGE_INTEGER*, Void)
  alias PFN_WdsTransportClientSessionComplete = Proc(LibC::HANDLE, Void*, UInt32, Void)
  alias PFN_WdsTransportClientSessionNegotiate = Proc(LibC::HANDLE, Void*, TRANSPORTCLIENT_SESSION_INFO*, LibC::HANDLE, Void)


  enum CPU_ARCHITECTURE : UInt32
    CPU_ARCHITECTURE_AMD64 = 9
    CPU_ARCHITECTURE_IA64 = 6
    CPU_ARCHITECTURE_INTEL = 0
  end

  enum PFN_WDS_CLI_CALLBACK_MESSAGE_ID : UInt32
    WDS_CLI_MSG_START = 0
    WDS_CLI_MSG_COMPLETE = 1
    WDS_CLI_MSG_PROGRESS = 2
    WDS_CLI_MSG_TEXT = 3
  end

  enum WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL : UInt32
    WDS_TRANSPORTCLIENT_AUTH = 1
    WDS_TRANSPORTCLIENT_NO_AUTH = 2
  end

  enum WDS_CLI_IMAGE_TYPE : Int32
    WDS_CLI_IMAGE_TYPE_UNKNOWN = 0
    WDS_CLI_IMAGE_TYPE_WIM = 1
    WDS_CLI_IMAGE_TYPE_VHD = 2
    WDS_CLI_IMAGE_TYPE_VHDX = 3
  end

  enum WDS_CLI_FIRMWARE_TYPE : Int32
    WDS_CLI_FIRMWARE_UNKNOWN = 0
    WDS_CLI_FIRMWARE_BIOS = 1
    WDS_CLI_FIRMWARE_EFI = 2
  end

  enum WDS_CLI_IMAGE_PARAM_TYPE : Int32
    WDS_CLI_IMAGE_PARAM_UNKNOWN = 0
    WDS_CLI_IMAGE_PARAM_SPARSE_FILE = 1
    WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES = 2
  end

  enum TRANSPORTPROVIDER_CALLBACK_ID : Int32
    WDS_TRANSPORTPROVIDER_CREATE_INSTANCE = 0
    WDS_TRANSPORTPROVIDER_COMPARE_CONTENT = 1
    WDS_TRANSPORTPROVIDER_OPEN_CONTENT = 2
    WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK = 3
    WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE = 4
    WDS_TRANSPORTPROVIDER_READ_CONTENT = 5
    WDS_TRANSPORTPROVIDER_CLOSE_CONTENT = 6
    WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE = 7
    WDS_TRANSPORTPROVIDER_SHUTDOWN = 8
    WDS_TRANSPORTPROVIDER_DUMP_STATE = 9
    WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS = 10
    WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA = 11
    WDS_TRANSPORTPROVIDER_MAX_CALLBACKS = 12
  end

  enum TRANSPORTCLIENT_CALLBACK_ID : Int32
    WDS_TRANSPORTCLIENT_SESSION_START = 0
    WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS = 1
    WDS_TRANSPORTCLIENT_SESSION_COMPLETE = 2
    WDS_TRANSPORTCLIENT_RECEIVE_METADATA = 3
    WDS_TRANSPORTCLIENT_SESSION_STARTEX = 4
    WDS_TRANSPORTCLIENT_SESSION_NEGOTIATE = 5
    WDS_TRANSPORTCLIENT_MAX_CALLBACKS = 6
  end

  enum WDSTRANSPORT_FEATURE_FLAGS : Int32
    WdsTptFeatureAdminPack = 1
    WdsTptFeatureTransportServer = 2
    WdsTptFeatureDeploymentServer = 4
  end

  enum WDSTRANSPORT_PROTOCOL_FLAGS : Int32
    WdsTptProtocolUnicast = 1
    WdsTptProtocolMulticast = 2
  end

  enum WDSTRANSPORT_NAMESPACE_TYPE : Int32
    WdsTptNamespaceTypeUnknown = 0
    WdsTptNamespaceTypeAutoCast = 1
    WdsTptNamespaceTypeScheduledCastManualStart = 2
    WdsTptNamespaceTypeScheduledCastAutoStart = 3
  end

  enum WDSTRANSPORT_DISCONNECT_TYPE : Int32
    WdsTptDisconnectUnknown = 0
    WdsTptDisconnectFallback = 1
    WdsTptDisconnectAbort = 2
  end

  enum WDSTRANSPORT_SERVICE_NOTIFICATION : Int32
    WdsTptServiceNotifyUnknown = 0
    WdsTptServiceNotifyReadSettings = 1
  end

  enum WDSTRANSPORT_IP_ADDRESS_TYPE : Int32
    WdsTptIpAddressUnknown = 0
    WdsTptIpAddressIpv4 = 1
    WdsTptIpAddressIpv6 = 2
  end

  enum WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE : Int32
    WdsTptIpAddressSourceUnknown = 0
    WdsTptIpAddressSourceDhcp = 1
    WdsTptIpAddressSourceRange = 2
  end

  enum WDSTRANSPORT_NETWORK_PROFILE_TYPE : Int32
    WdsTptNetworkProfileUnknown = 0
    WdsTptNetworkProfileCustom = 1
    WdsTptNetworkProfile10Mbps = 2
    WdsTptNetworkProfile100Mbps = 3
    WdsTptNetworkProfile1Gbps = 4
  end

  enum WDSTRANSPORT_DIAGNOSTICS_COMPONENT_FLAGS : Int32
    WdsTptDiagnosticsComponentPxe = 1
    WdsTptDiagnosticsComponentTftp = 2
    WdsTptDiagnosticsComponentImageServer = 4
    WdsTptDiagnosticsComponentMulticast = 8
  end

  enum WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE : Int32
    WdsTptSlowClientHandlingUnknown = 0
    WdsTptSlowClientHandlingNone = 1
    WdsTptSlowClientHandlingAutoDisconnect = 2
    WdsTptSlowClientHandlingMultistream = 3
  end

  enum WDSTRANSPORT_UDP_PORT_POLICY : Int32
    WdsTptUdpPortPolicyDynamic = 0
    WdsTptUdpPortPolicyFixed = 1
  end

  enum WDSTRANSPORT_TFTP_CAPABILITY : Int32
    WdsTptTftpCapMaximumBlockSize = 1
    WdsTptTftpCapVariableWindow = 2
  end

  union PXE_DHCP_MESSAGE_Anonymous_e__Union
    b_magic_cookie : UInt8[4]*
    u_magic_cookie : UInt32
  end
  union PXE_ADDRESS_Anonymous_e__Union
    b_address : UInt8[16]*
    u_ip_address : UInt32
  end

  struct WDS_CLI_CRED
    pwsz_user_name : LibC::LPWSTR
    pwsz_domain : LibC::LPWSTR
    pwsz_password : LibC::LPWSTR
  end
  struct PXE_DHCP_OPTION
    option_type : UInt8
    option_length : UInt8
    option_value : UInt8[0]*
  end
  struct PXE_DHCP_MESSAGE
    operation : UInt8
    hardware_address_type : UInt8
    hardware_address_length : UInt8
    hop_count : UInt8
    transaction_id : UInt32
    seconds_since_boot : UInt16
    reserved : UInt16
    client_ip_address : UInt32
    your_ip_address : UInt32
    bootstrap_server_address : UInt32
    relay_agent_ip_address : UInt32
    hardware_address : UInt8[16]*
    host_name : UInt8[64]*
    boot_file_name : UInt8[128]*
    anonymous : PXE_DHCP_MESSAGE_Anonymous_e__Union
    option : PXE_DHCP_OPTION
  end
  struct PXE_DHCPV6_OPTION
    option_code : UInt16
    data_length : UInt16
    data : UInt8[0]*
  end
  struct PXE_DHCPV6_MESSAGE_HEADER
    message_type : UInt8
    message : UInt8[0]*
  end
  struct PXE_DHCPV6_MESSAGE
    message_type : UInt8
    transaction_id_byte1 : UInt8
    transaction_id_byte2 : UInt8
    transaction_id_byte3 : UInt8
    options : PXE_DHCPV6_OPTION[0]*
  end
  struct PXE_DHCPV6_RELAY_MESSAGE
    message_type : UInt8
    hop_count : UInt8
    link_address : UInt8[16]*
    peer_address : UInt8[16]*
    options : PXE_DHCPV6_OPTION[0]*
  end
  struct PXE_PROVIDER
    u_size_of_struct : UInt32
    pwsz_name : LibC::LPWSTR
    pwsz_file_path : LibC::LPWSTR
    b_is_critical : LibC::BOOL
    u_index : UInt32
  end
  struct PXE_ADDRESS
    u_flags : UInt32
    anonymous : PXE_ADDRESS_Anonymous_e__Union
    u_addr_len : UInt32
    u_port : UInt16
  end
  struct PXE_DHCPV6_NESTED_RELAY_MESSAGE
    p_relay_message : PXE_DHCPV6_RELAY_MESSAGE*
    cb_relay_message : UInt32
    p_interface_id_option : Void*
    cb_interface_id_option : UInt16
  end
  struct WDS_TRANSPORTPROVIDER_INIT_PARAMS
    ul_length : UInt32
    ul_mc_server_version : UInt32
    h_registry_key : HKEY
    h_provider : LibC::HANDLE
  end
  struct WDS_TRANSPORTPROVIDER_SETTINGS
    ul_length : UInt32
    ul_provider_version : UInt32
  end
  struct TRANSPORTCLIENT_SESSION_INFO
    ul_structure_length : UInt32
    ull_file_size : ULARGE_INTEGER
    ul_block_size : UInt32
  end
  struct WDS_TRANSPORTCLIENT_REQUEST
    ul_length : UInt32
    ul_api_version : UInt32
    ul_auth_level : WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL
    pwsz_server : LibC::LPWSTR
    pwsz_namespace : LibC::LPWSTR
    pwsz_object_name : LibC::LPWSTR
    ul_cache_size : UInt32
    ul_protocol : UInt32
    pv_protocol_data : Void*
    ul_protocol_data_length : UInt32
  end
  struct WDS_TRANSPORTCLIENT_CALLBACKS
    session_start : PFN_WdsTransportClientSessionStart
    session_start_ex : PFN_WdsTransportClientSessionStartEx
    receive_contents : PFN_WdsTransportClientReceiveContents
    receive_metadata : PFN_WdsTransportClientReceiveMetadata
    session_complete : PFN_WdsTransportClientSessionComplete
    session_negotiate : PFN_WdsTransportClientSessionNegotiate
  end


  struct IWdsTransportCacheableVTbl
    query_interface : Proc(IWdsTransportCacheable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportCacheable*, UInt32)
    release : Proc(IWdsTransportCacheable*, UInt32)
    get_type_info_count : Proc(IWdsTransportCacheable*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportCacheable*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportCacheable*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportCacheable*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_dirty : Proc(IWdsTransportCacheable*, Int16*, HRESULT)
    discard : Proc(IWdsTransportCacheable*, HRESULT)
    refresh : Proc(IWdsTransportCacheable*, HRESULT)
    commit : Proc(IWdsTransportCacheable*, HRESULT)
  end

  IWdsTransportCacheable_GUID = "46ad894b-0bab-47dc-84b2-7b553f1d8f80"
  IID_IWdsTransportCacheable = LibC::GUID.new(0x46ad894b_u32, 0xbab_u16, 0x47dc_u16, StaticArray[0x84_u8, 0xb2_u8, 0x7b_u8, 0x55_u8, 0x3f_u8, 0x1d_u8, 0x8f_u8, 0x80_u8])
  struct IWdsTransportCacheable
    lpVtbl : IWdsTransportCacheableVTbl*
  end

  struct IWdsTransportCollectionVTbl
    query_interface : Proc(IWdsTransportCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportCollection*, UInt32)
    release : Proc(IWdsTransportCollection*, UInt32)
    get_type_info_count : Proc(IWdsTransportCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IWdsTransportCollection*, UInt32*, HRESULT)
    get_item : Proc(IWdsTransportCollection*, UInt32, IDispatch*, HRESULT)
    get__new_enum : Proc(IWdsTransportCollection*, IUnknown*, HRESULT)
  end

  IWdsTransportCollection_GUID = "b8ba4b1a-2ff4-43ab-996c-b2b10a91a6eb"
  IID_IWdsTransportCollection = LibC::GUID.new(0xb8ba4b1a_u32, 0x2ff4_u16, 0x43ab_u16, StaticArray[0x99_u8, 0x6c_u8, 0xb2_u8, 0xb1_u8, 0xa_u8, 0x91_u8, 0xa6_u8, 0xeb_u8])
  struct IWdsTransportCollection
    lpVtbl : IWdsTransportCollectionVTbl*
  end

  struct IWdsTransportManagerVTbl
    query_interface : Proc(IWdsTransportManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportManager*, UInt32)
    release : Proc(IWdsTransportManager*, UInt32)
    get_type_info_count : Proc(IWdsTransportManager*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_wds_transport_server : Proc(IWdsTransportManager*, UInt8*, IWdsTransportServer*, HRESULT)
  end

  IWdsTransportManager_GUID = "5b0d35f5-1b13-4afd-b878-6526dc340b5d"
  IID_IWdsTransportManager = LibC::GUID.new(0x5b0d35f5_u32, 0x1b13_u16, 0x4afd_u16, StaticArray[0xb8_u8, 0x78_u8, 0x65_u8, 0x26_u8, 0xdc_u8, 0x34_u8, 0xb_u8, 0x5d_u8])
  struct IWdsTransportManager
    lpVtbl : IWdsTransportManagerVTbl*
  end

  struct IWdsTransportServerVTbl
    query_interface : Proc(IWdsTransportServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportServer*, UInt32)
    release : Proc(IWdsTransportServer*, UInt32)
    get_type_info_count : Proc(IWdsTransportServer*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportServer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportServer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportServer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportServer*, UInt8**, HRESULT)
    get_setup_manager : Proc(IWdsTransportServer*, IWdsTransportSetupManager*, HRESULT)
    get_configuration_manager : Proc(IWdsTransportServer*, IWdsTransportConfigurationManager*, HRESULT)
    get_namespace_manager : Proc(IWdsTransportServer*, IWdsTransportNamespaceManager*, HRESULT)
    disconnect_client : Proc(IWdsTransportServer*, UInt32, WDSTRANSPORT_DISCONNECT_TYPE, HRESULT)
  end

  IWdsTransportServer_GUID = "09ccd093-830d-4344-a30a-73ae8e8fca90"
  IID_IWdsTransportServer = LibC::GUID.new(0x9ccd093_u32, 0x830d_u16, 0x4344_u16, StaticArray[0xa3_u8, 0xa_u8, 0x73_u8, 0xae_u8, 0x8e_u8, 0x8f_u8, 0xca_u8, 0x90_u8])
  struct IWdsTransportServer
    lpVtbl : IWdsTransportServerVTbl*
  end

  struct IWdsTransportServer2VTbl
    query_interface : Proc(IWdsTransportServer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportServer2*, UInt32)
    release : Proc(IWdsTransportServer2*, UInt32)
    get_type_info_count : Proc(IWdsTransportServer2*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportServer2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportServer2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportServer2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportServer2*, UInt8**, HRESULT)
    get_setup_manager : Proc(IWdsTransportServer2*, IWdsTransportSetupManager*, HRESULT)
    get_configuration_manager : Proc(IWdsTransportServer2*, IWdsTransportConfigurationManager*, HRESULT)
    get_namespace_manager : Proc(IWdsTransportServer2*, IWdsTransportNamespaceManager*, HRESULT)
    disconnect_client : Proc(IWdsTransportServer2*, UInt32, WDSTRANSPORT_DISCONNECT_TYPE, HRESULT)
    get_tftp_manager : Proc(IWdsTransportServer2*, IWdsTransportTftpManager*, HRESULT)
  end

  IWdsTransportServer2_GUID = "256e999f-6df4-4538-81b9-857b9ab8fb47"
  IID_IWdsTransportServer2 = LibC::GUID.new(0x256e999f_u32, 0x6df4_u16, 0x4538_u16, StaticArray[0x81_u8, 0xb9_u8, 0x85_u8, 0x7b_u8, 0x9a_u8, 0xb8_u8, 0xfb_u8, 0x47_u8])
  struct IWdsTransportServer2
    lpVtbl : IWdsTransportServer2VTbl*
  end

  struct IWdsTransportSetupManagerVTbl
    query_interface : Proc(IWdsTransportSetupManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportSetupManager*, UInt32)
    release : Proc(IWdsTransportSetupManager*, UInt32)
    get_type_info_count : Proc(IWdsTransportSetupManager*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportSetupManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportSetupManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportSetupManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_version : Proc(IWdsTransportSetupManager*, UInt64*, HRESULT)
    get_installed_features : Proc(IWdsTransportSetupManager*, UInt32*, HRESULT)
    get_protocols : Proc(IWdsTransportSetupManager*, UInt32*, HRESULT)
    register_content_provider : Proc(IWdsTransportSetupManager*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    deregister_content_provider : Proc(IWdsTransportSetupManager*, UInt8*, HRESULT)
  end

  IWdsTransportSetupManager_GUID = "f7238425-efa8-40a4-aef9-c98d969c0b75"
  IID_IWdsTransportSetupManager = LibC::GUID.new(0xf7238425_u32, 0xefa8_u16, 0x40a4_u16, StaticArray[0xae_u8, 0xf9_u8, 0xc9_u8, 0x8d_u8, 0x96_u8, 0x9c_u8, 0xb_u8, 0x75_u8])
  struct IWdsTransportSetupManager
    lpVtbl : IWdsTransportSetupManagerVTbl*
  end

  struct IWdsTransportSetupManager2VTbl
    query_interface : Proc(IWdsTransportSetupManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportSetupManager2*, UInt32)
    release : Proc(IWdsTransportSetupManager2*, UInt32)
    get_type_info_count : Proc(IWdsTransportSetupManager2*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportSetupManager2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportSetupManager2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportSetupManager2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_version : Proc(IWdsTransportSetupManager2*, UInt64*, HRESULT)
    get_installed_features : Proc(IWdsTransportSetupManager2*, UInt32*, HRESULT)
    get_protocols : Proc(IWdsTransportSetupManager2*, UInt32*, HRESULT)
    register_content_provider : Proc(IWdsTransportSetupManager2*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    deregister_content_provider : Proc(IWdsTransportSetupManager2*, UInt8*, HRESULT)
    get_tftp_capabilities : Proc(IWdsTransportSetupManager2*, UInt32*, HRESULT)
    get_content_providers : Proc(IWdsTransportSetupManager2*, IWdsTransportCollection*, HRESULT)
  end

  IWdsTransportSetupManager2_GUID = "02be79da-7e9e-4366-8b6e-2aa9a91be47f"
  IID_IWdsTransportSetupManager2 = LibC::GUID.new(0x2be79da_u32, 0x7e9e_u16, 0x4366_u16, StaticArray[0x8b_u8, 0x6e_u8, 0x2a_u8, 0xa9_u8, 0xa9_u8, 0x1b_u8, 0xe4_u8, 0x7f_u8])
  struct IWdsTransportSetupManager2
    lpVtbl : IWdsTransportSetupManager2VTbl*
  end

  struct IWdsTransportConfigurationManagerVTbl
    query_interface : Proc(IWdsTransportConfigurationManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportConfigurationManager*, UInt32)
    release : Proc(IWdsTransportConfigurationManager*, UInt32)
    get_type_info_count : Proc(IWdsTransportConfigurationManager*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportConfigurationManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportConfigurationManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportConfigurationManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_service_policy : Proc(IWdsTransportConfigurationManager*, IWdsTransportServicePolicy*, HRESULT)
    get_diagnostics_policy : Proc(IWdsTransportConfigurationManager*, IWdsTransportDiagnosticsPolicy*, HRESULT)
    get_wds_transport_services_running : Proc(IWdsTransportConfigurationManager*, Int16, Int16*, HRESULT)
    enable_wds_transport_services : Proc(IWdsTransportConfigurationManager*, HRESULT)
    disable_wds_transport_services : Proc(IWdsTransportConfigurationManager*, HRESULT)
    start_wds_transport_services : Proc(IWdsTransportConfigurationManager*, HRESULT)
    stop_wds_transport_services : Proc(IWdsTransportConfigurationManager*, HRESULT)
    restart_wds_transport_services : Proc(IWdsTransportConfigurationManager*, HRESULT)
    notify_wds_transport_services : Proc(IWdsTransportConfigurationManager*, WDSTRANSPORT_SERVICE_NOTIFICATION, HRESULT)
  end

  IWdsTransportConfigurationManager_GUID = "84cc4779-42dd-4792-891e-1321d6d74b44"
  IID_IWdsTransportConfigurationManager = LibC::GUID.new(0x84cc4779_u32, 0x42dd_u16, 0x4792_u16, StaticArray[0x89_u8, 0x1e_u8, 0x13_u8, 0x21_u8, 0xd6_u8, 0xd7_u8, 0x4b_u8, 0x44_u8])
  struct IWdsTransportConfigurationManager
    lpVtbl : IWdsTransportConfigurationManagerVTbl*
  end

  struct IWdsTransportConfigurationManager2VTbl
    query_interface : Proc(IWdsTransportConfigurationManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportConfigurationManager2*, UInt32)
    release : Proc(IWdsTransportConfigurationManager2*, UInt32)
    get_type_info_count : Proc(IWdsTransportConfigurationManager2*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportConfigurationManager2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportConfigurationManager2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportConfigurationManager2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_service_policy : Proc(IWdsTransportConfigurationManager2*, IWdsTransportServicePolicy*, HRESULT)
    get_diagnostics_policy : Proc(IWdsTransportConfigurationManager2*, IWdsTransportDiagnosticsPolicy*, HRESULT)
    get_wds_transport_services_running : Proc(IWdsTransportConfigurationManager2*, Int16, Int16*, HRESULT)
    enable_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, HRESULT)
    disable_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, HRESULT)
    start_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, HRESULT)
    stop_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, HRESULT)
    restart_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, HRESULT)
    notify_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, WDSTRANSPORT_SERVICE_NOTIFICATION, HRESULT)
    get_multicast_session_policy : Proc(IWdsTransportConfigurationManager2*, IWdsTransportMulticastSessionPolicy*, HRESULT)
  end

  IWdsTransportConfigurationManager2_GUID = "d0d85caf-a153-4f1d-a9dd-96f431c50717"
  IID_IWdsTransportConfigurationManager2 = LibC::GUID.new(0xd0d85caf_u32, 0xa153_u16, 0x4f1d_u16, StaticArray[0xa9_u8, 0xdd_u8, 0x96_u8, 0xf4_u8, 0x31_u8, 0xc5_u8, 0x7_u8, 0x17_u8])
  struct IWdsTransportConfigurationManager2
    lpVtbl : IWdsTransportConfigurationManager2VTbl*
  end

  struct IWdsTransportNamespaceManagerVTbl
    query_interface : Proc(IWdsTransportNamespaceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportNamespaceManager*, UInt32)
    release : Proc(IWdsTransportNamespaceManager*, UInt32)
    get_type_info_count : Proc(IWdsTransportNamespaceManager*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportNamespaceManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportNamespaceManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportNamespaceManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_namespace : Proc(IWdsTransportNamespaceManager*, WDSTRANSPORT_NAMESPACE_TYPE, UInt8*, UInt8*, UInt8*, IWdsTransportNamespace*, HRESULT)
    retrieve_namespace : Proc(IWdsTransportNamespaceManager*, UInt8*, IWdsTransportNamespace*, HRESULT)
    retrieve_namespaces : Proc(IWdsTransportNamespaceManager*, UInt8*, UInt8*, Int16, IWdsTransportCollection*, HRESULT)
  end

  IWdsTransportNamespaceManager_GUID = "3e22d9f6-3777-4d98-83e1-f98696717ba3"
  IID_IWdsTransportNamespaceManager = LibC::GUID.new(0x3e22d9f6_u32, 0x3777_u16, 0x4d98_u16, StaticArray[0x83_u8, 0xe1_u8, 0xf9_u8, 0x86_u8, 0x96_u8, 0x71_u8, 0x7b_u8, 0xa3_u8])
  struct IWdsTransportNamespaceManager
    lpVtbl : IWdsTransportNamespaceManagerVTbl*
  end

  struct IWdsTransportTftpManagerVTbl
    query_interface : Proc(IWdsTransportTftpManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportTftpManager*, UInt32)
    release : Proc(IWdsTransportTftpManager*, UInt32)
    get_type_info_count : Proc(IWdsTransportTftpManager*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportTftpManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportTftpManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportTftpManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    retrieve_tftp_clients : Proc(IWdsTransportTftpManager*, IWdsTransportCollection*, HRESULT)
  end

  IWdsTransportTftpManager_GUID = "1327a7c8-ae8a-4fb3-8150-136227c37e9a"
  IID_IWdsTransportTftpManager = LibC::GUID.new(0x1327a7c8_u32, 0xae8a_u16, 0x4fb3_u16, StaticArray[0x81_u8, 0x50_u8, 0x13_u8, 0x62_u8, 0x27_u8, 0xc3_u8, 0x7e_u8, 0x9a_u8])
  struct IWdsTransportTftpManager
    lpVtbl : IWdsTransportTftpManagerVTbl*
  end

  struct IWdsTransportServicePolicyVTbl
    query_interface : Proc(IWdsTransportServicePolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportServicePolicy*, UInt32)
    release : Proc(IWdsTransportServicePolicy*, UInt32)
    get_type_info_count : Proc(IWdsTransportServicePolicy*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportServicePolicy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportServicePolicy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportServicePolicy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_dirty : Proc(IWdsTransportServicePolicy*, Int16*, HRESULT)
    discard : Proc(IWdsTransportServicePolicy*, HRESULT)
    refresh : Proc(IWdsTransportServicePolicy*, HRESULT)
    commit : Proc(IWdsTransportServicePolicy*, HRESULT)
    get_ip_address_source : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_IP_ADDRESS_TYPE, WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*, HRESULT)
    put_ip_address_source : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_IP_ADDRESS_TYPE, WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE, HRESULT)
    get_start_ip_address : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8**, HRESULT)
    put_start_ip_address : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8*, HRESULT)
    get_end_ip_address : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8**, HRESULT)
    put_end_ip_address : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8*, HRESULT)
    get_start_port : Proc(IWdsTransportServicePolicy*, UInt32*, HRESULT)
    put_start_port : Proc(IWdsTransportServicePolicy*, UInt32, HRESULT)
    get_end_port : Proc(IWdsTransportServicePolicy*, UInt32*, HRESULT)
    put_end_port : Proc(IWdsTransportServicePolicy*, UInt32, HRESULT)
    get_network_profile : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_NETWORK_PROFILE_TYPE*, HRESULT)
    put_network_profile : Proc(IWdsTransportServicePolicy*, WDSTRANSPORT_NETWORK_PROFILE_TYPE, HRESULT)
  end

  IWdsTransportServicePolicy_GUID = "b9468578-9f2b-48cc-b27a-a60799c2750c"
  IID_IWdsTransportServicePolicy = LibC::GUID.new(0xb9468578_u32, 0x9f2b_u16, 0x48cc_u16, StaticArray[0xb2_u8, 0x7a_u8, 0xa6_u8, 0x7_u8, 0x99_u8, 0xc2_u8, 0x75_u8, 0xc_u8])
  struct IWdsTransportServicePolicy
    lpVtbl : IWdsTransportServicePolicyVTbl*
  end

  struct IWdsTransportServicePolicy2VTbl
    query_interface : Proc(IWdsTransportServicePolicy2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportServicePolicy2*, UInt32)
    release : Proc(IWdsTransportServicePolicy2*, UInt32)
    get_type_info_count : Proc(IWdsTransportServicePolicy2*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportServicePolicy2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportServicePolicy2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportServicePolicy2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_dirty : Proc(IWdsTransportServicePolicy2*, Int16*, HRESULT)
    discard : Proc(IWdsTransportServicePolicy2*, HRESULT)
    refresh : Proc(IWdsTransportServicePolicy2*, HRESULT)
    commit : Proc(IWdsTransportServicePolicy2*, HRESULT)
    get_ip_address_source : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_IP_ADDRESS_TYPE, WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*, HRESULT)
    put_ip_address_source : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_IP_ADDRESS_TYPE, WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE, HRESULT)
    get_start_ip_address : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8**, HRESULT)
    put_start_ip_address : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8*, HRESULT)
    get_end_ip_address : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8**, HRESULT)
    put_end_ip_address : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_IP_ADDRESS_TYPE, UInt8*, HRESULT)
    get_start_port : Proc(IWdsTransportServicePolicy2*, UInt32*, HRESULT)
    put_start_port : Proc(IWdsTransportServicePolicy2*, UInt32, HRESULT)
    get_end_port : Proc(IWdsTransportServicePolicy2*, UInt32*, HRESULT)
    put_end_port : Proc(IWdsTransportServicePolicy2*, UInt32, HRESULT)
    get_network_profile : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_NETWORK_PROFILE_TYPE*, HRESULT)
    put_network_profile : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_NETWORK_PROFILE_TYPE, HRESULT)
    get_udp_port_policy : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_UDP_PORT_POLICY*, HRESULT)
    put_udp_port_policy : Proc(IWdsTransportServicePolicy2*, WDSTRANSPORT_UDP_PORT_POLICY, HRESULT)
    get_tftp_maximum_block_size : Proc(IWdsTransportServicePolicy2*, UInt32*, HRESULT)
    put_tftp_maximum_block_size : Proc(IWdsTransportServicePolicy2*, UInt32, HRESULT)
    get_enable_tftp_variable_window_extension : Proc(IWdsTransportServicePolicy2*, Int16*, HRESULT)
    put_enable_tftp_variable_window_extension : Proc(IWdsTransportServicePolicy2*, Int16, HRESULT)
  end

  IWdsTransportServicePolicy2_GUID = "65c19e5c-aa7e-4b91-8944-91e0e5572797"
  IID_IWdsTransportServicePolicy2 = LibC::GUID.new(0x65c19e5c_u32, 0xaa7e_u16, 0x4b91_u16, StaticArray[0x89_u8, 0x44_u8, 0x91_u8, 0xe0_u8, 0xe5_u8, 0x57_u8, 0x27_u8, 0x97_u8])
  struct IWdsTransportServicePolicy2
    lpVtbl : IWdsTransportServicePolicy2VTbl*
  end

  struct IWdsTransportDiagnosticsPolicyVTbl
    query_interface : Proc(IWdsTransportDiagnosticsPolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportDiagnosticsPolicy*, UInt32)
    release : Proc(IWdsTransportDiagnosticsPolicy*, UInt32)
    get_type_info_count : Proc(IWdsTransportDiagnosticsPolicy*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportDiagnosticsPolicy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportDiagnosticsPolicy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportDiagnosticsPolicy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_dirty : Proc(IWdsTransportDiagnosticsPolicy*, Int16*, HRESULT)
    discard : Proc(IWdsTransportDiagnosticsPolicy*, HRESULT)
    refresh : Proc(IWdsTransportDiagnosticsPolicy*, HRESULT)
    commit : Proc(IWdsTransportDiagnosticsPolicy*, HRESULT)
    get_enabled : Proc(IWdsTransportDiagnosticsPolicy*, Int16*, HRESULT)
    put_enabled : Proc(IWdsTransportDiagnosticsPolicy*, Int16, HRESULT)
    get_components : Proc(IWdsTransportDiagnosticsPolicy*, UInt32*, HRESULT)
    put_components : Proc(IWdsTransportDiagnosticsPolicy*, UInt32, HRESULT)
  end

  IWdsTransportDiagnosticsPolicy_GUID = "13b33efc-7856-4f61-9a59-8de67b6b87b6"
  IID_IWdsTransportDiagnosticsPolicy = LibC::GUID.new(0x13b33efc_u32, 0x7856_u16, 0x4f61_u16, StaticArray[0x9a_u8, 0x59_u8, 0x8d_u8, 0xe6_u8, 0x7b_u8, 0x6b_u8, 0x87_u8, 0xb6_u8])
  struct IWdsTransportDiagnosticsPolicy
    lpVtbl : IWdsTransportDiagnosticsPolicyVTbl*
  end

  struct IWdsTransportMulticastSessionPolicyVTbl
    query_interface : Proc(IWdsTransportMulticastSessionPolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportMulticastSessionPolicy*, UInt32)
    release : Proc(IWdsTransportMulticastSessionPolicy*, UInt32)
    get_type_info_count : Proc(IWdsTransportMulticastSessionPolicy*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportMulticastSessionPolicy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportMulticastSessionPolicy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportMulticastSessionPolicy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_dirty : Proc(IWdsTransportMulticastSessionPolicy*, Int16*, HRESULT)
    discard : Proc(IWdsTransportMulticastSessionPolicy*, HRESULT)
    refresh : Proc(IWdsTransportMulticastSessionPolicy*, HRESULT)
    commit : Proc(IWdsTransportMulticastSessionPolicy*, HRESULT)
    get_slow_client_handling : Proc(IWdsTransportMulticastSessionPolicy*, WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE*, HRESULT)
    put_slow_client_handling : Proc(IWdsTransportMulticastSessionPolicy*, WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE, HRESULT)
    get_auto_disconnect_threshold : Proc(IWdsTransportMulticastSessionPolicy*, UInt32*, HRESULT)
    put_auto_disconnect_threshold : Proc(IWdsTransportMulticastSessionPolicy*, UInt32, HRESULT)
    get_multistream_stream_count : Proc(IWdsTransportMulticastSessionPolicy*, UInt32*, HRESULT)
    put_multistream_stream_count : Proc(IWdsTransportMulticastSessionPolicy*, UInt32, HRESULT)
    get_slow_client_fallback : Proc(IWdsTransportMulticastSessionPolicy*, Int16*, HRESULT)
    put_slow_client_fallback : Proc(IWdsTransportMulticastSessionPolicy*, Int16, HRESULT)
  end

  IWdsTransportMulticastSessionPolicy_GUID = "4e5753cf-68ec-4504-a951-4a003266606b"
  IID_IWdsTransportMulticastSessionPolicy = LibC::GUID.new(0x4e5753cf_u32, 0x68ec_u16, 0x4504_u16, StaticArray[0xa9_u8, 0x51_u8, 0x4a_u8, 0x0_u8, 0x32_u8, 0x66_u8, 0x60_u8, 0x6b_u8])
  struct IWdsTransportMulticastSessionPolicy
    lpVtbl : IWdsTransportMulticastSessionPolicyVTbl*
  end

  struct IWdsTransportNamespaceVTbl
    query_interface : Proc(IWdsTransportNamespace*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportNamespace*, UInt32)
    release : Proc(IWdsTransportNamespace*, UInt32)
    get_type_info_count : Proc(IWdsTransportNamespace*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportNamespace*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportNamespace*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportNamespace*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IWdsTransportNamespace*, WDSTRANSPORT_NAMESPACE_TYPE*, HRESULT)
    get_id : Proc(IWdsTransportNamespace*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportNamespace*, UInt8**, HRESULT)
    put_name : Proc(IWdsTransportNamespace*, UInt8*, HRESULT)
    get_friendly_name : Proc(IWdsTransportNamespace*, UInt8**, HRESULT)
    put_friendly_name : Proc(IWdsTransportNamespace*, UInt8*, HRESULT)
    get_description : Proc(IWdsTransportNamespace*, UInt8**, HRESULT)
    put_description : Proc(IWdsTransportNamespace*, UInt8*, HRESULT)
    get_content_provider : Proc(IWdsTransportNamespace*, UInt8**, HRESULT)
    put_content_provider : Proc(IWdsTransportNamespace*, UInt8*, HRESULT)
    get_configuration : Proc(IWdsTransportNamespace*, UInt8**, HRESULT)
    put_configuration : Proc(IWdsTransportNamespace*, UInt8*, HRESULT)
    get_registered : Proc(IWdsTransportNamespace*, Int16*, HRESULT)
    get_tombstoned : Proc(IWdsTransportNamespace*, Int16*, HRESULT)
    get_tombstone_time : Proc(IWdsTransportNamespace*, Float64*, HRESULT)
    get_transmission_started : Proc(IWdsTransportNamespace*, Int16*, HRESULT)
    register : Proc(IWdsTransportNamespace*, HRESULT)
    deregister : Proc(IWdsTransportNamespace*, Int16, HRESULT)
    clone : Proc(IWdsTransportNamespace*, IWdsTransportNamespace*, HRESULT)
    refresh : Proc(IWdsTransportNamespace*, HRESULT)
    retrieve_contents : Proc(IWdsTransportNamespace*, IWdsTransportCollection*, HRESULT)
  end

  IWdsTransportNamespace_GUID = "fa561f57-fbef-4ed3-b056-127cb1b33b84"
  IID_IWdsTransportNamespace = LibC::GUID.new(0xfa561f57_u32, 0xfbef_u16, 0x4ed3_u16, StaticArray[0xb0_u8, 0x56_u8, 0x12_u8, 0x7c_u8, 0xb1_u8, 0xb3_u8, 0x3b_u8, 0x84_u8])
  struct IWdsTransportNamespace
    lpVtbl : IWdsTransportNamespaceVTbl*
  end

  struct IWdsTransportNamespaceAutoCastVTbl
    query_interface : Proc(IWdsTransportNamespaceAutoCast*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportNamespaceAutoCast*, UInt32)
    release : Proc(IWdsTransportNamespaceAutoCast*, UInt32)
    get_type_info_count : Proc(IWdsTransportNamespaceAutoCast*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportNamespaceAutoCast*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportNamespaceAutoCast*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportNamespaceAutoCast*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IWdsTransportNamespaceAutoCast*, WDSTRANSPORT_NAMESPACE_TYPE*, HRESULT)
    get_id : Proc(IWdsTransportNamespaceAutoCast*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportNamespaceAutoCast*, UInt8**, HRESULT)
    put_name : Proc(IWdsTransportNamespaceAutoCast*, UInt8*, HRESULT)
    get_friendly_name : Proc(IWdsTransportNamespaceAutoCast*, UInt8**, HRESULT)
    put_friendly_name : Proc(IWdsTransportNamespaceAutoCast*, UInt8*, HRESULT)
    get_description : Proc(IWdsTransportNamespaceAutoCast*, UInt8**, HRESULT)
    put_description : Proc(IWdsTransportNamespaceAutoCast*, UInt8*, HRESULT)
    get_content_provider : Proc(IWdsTransportNamespaceAutoCast*, UInt8**, HRESULT)
    put_content_provider : Proc(IWdsTransportNamespaceAutoCast*, UInt8*, HRESULT)
    get_configuration : Proc(IWdsTransportNamespaceAutoCast*, UInt8**, HRESULT)
    put_configuration : Proc(IWdsTransportNamespaceAutoCast*, UInt8*, HRESULT)
    get_registered : Proc(IWdsTransportNamespaceAutoCast*, Int16*, HRESULT)
    get_tombstoned : Proc(IWdsTransportNamespaceAutoCast*, Int16*, HRESULT)
    get_tombstone_time : Proc(IWdsTransportNamespaceAutoCast*, Float64*, HRESULT)
    get_transmission_started : Proc(IWdsTransportNamespaceAutoCast*, Int16*, HRESULT)
    register : Proc(IWdsTransportNamespaceAutoCast*, HRESULT)
    deregister : Proc(IWdsTransportNamespaceAutoCast*, Int16, HRESULT)
    clone : Proc(IWdsTransportNamespaceAutoCast*, IWdsTransportNamespace*, HRESULT)
    refresh : Proc(IWdsTransportNamespaceAutoCast*, HRESULT)
    retrieve_contents : Proc(IWdsTransportNamespaceAutoCast*, IWdsTransportCollection*, HRESULT)
  end

  IWdsTransportNamespaceAutoCast_GUID = "ad931a72-c4bd-4c41-8fbc-59c9c748df9e"
  IID_IWdsTransportNamespaceAutoCast = LibC::GUID.new(0xad931a72_u32, 0xc4bd_u16, 0x4c41_u16, StaticArray[0x8f_u8, 0xbc_u8, 0x59_u8, 0xc9_u8, 0xc7_u8, 0x48_u8, 0xdf_u8, 0x9e_u8])
  struct IWdsTransportNamespaceAutoCast
    lpVtbl : IWdsTransportNamespaceAutoCastVTbl*
  end

  struct IWdsTransportNamespaceScheduledCastVTbl
    query_interface : Proc(IWdsTransportNamespaceScheduledCast*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportNamespaceScheduledCast*, UInt32)
    release : Proc(IWdsTransportNamespaceScheduledCast*, UInt32)
    get_type_info_count : Proc(IWdsTransportNamespaceScheduledCast*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportNamespaceScheduledCast*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportNamespaceScheduledCast*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportNamespaceScheduledCast*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IWdsTransportNamespaceScheduledCast*, WDSTRANSPORT_NAMESPACE_TYPE*, HRESULT)
    get_id : Proc(IWdsTransportNamespaceScheduledCast*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportNamespaceScheduledCast*, UInt8**, HRESULT)
    put_name : Proc(IWdsTransportNamespaceScheduledCast*, UInt8*, HRESULT)
    get_friendly_name : Proc(IWdsTransportNamespaceScheduledCast*, UInt8**, HRESULT)
    put_friendly_name : Proc(IWdsTransportNamespaceScheduledCast*, UInt8*, HRESULT)
    get_description : Proc(IWdsTransportNamespaceScheduledCast*, UInt8**, HRESULT)
    put_description : Proc(IWdsTransportNamespaceScheduledCast*, UInt8*, HRESULT)
    get_content_provider : Proc(IWdsTransportNamespaceScheduledCast*, UInt8**, HRESULT)
    put_content_provider : Proc(IWdsTransportNamespaceScheduledCast*, UInt8*, HRESULT)
    get_configuration : Proc(IWdsTransportNamespaceScheduledCast*, UInt8**, HRESULT)
    put_configuration : Proc(IWdsTransportNamespaceScheduledCast*, UInt8*, HRESULT)
    get_registered : Proc(IWdsTransportNamespaceScheduledCast*, Int16*, HRESULT)
    get_tombstoned : Proc(IWdsTransportNamespaceScheduledCast*, Int16*, HRESULT)
    get_tombstone_time : Proc(IWdsTransportNamespaceScheduledCast*, Float64*, HRESULT)
    get_transmission_started : Proc(IWdsTransportNamespaceScheduledCast*, Int16*, HRESULT)
    register : Proc(IWdsTransportNamespaceScheduledCast*, HRESULT)
    deregister : Proc(IWdsTransportNamespaceScheduledCast*, Int16, HRESULT)
    clone : Proc(IWdsTransportNamespaceScheduledCast*, IWdsTransportNamespace*, HRESULT)
    refresh : Proc(IWdsTransportNamespaceScheduledCast*, HRESULT)
    retrieve_contents : Proc(IWdsTransportNamespaceScheduledCast*, IWdsTransportCollection*, HRESULT)
    start_transmission : Proc(IWdsTransportNamespaceScheduledCast*, HRESULT)
  end

  IWdsTransportNamespaceScheduledCast_GUID = "3840cecf-d76c-416e-a4cc-31c741d2874b"
  IID_IWdsTransportNamespaceScheduledCast = LibC::GUID.new(0x3840cecf_u32, 0xd76c_u16, 0x416e_u16, StaticArray[0xa4_u8, 0xcc_u8, 0x31_u8, 0xc7_u8, 0x41_u8, 0xd2_u8, 0x87_u8, 0x4b_u8])
  struct IWdsTransportNamespaceScheduledCast
    lpVtbl : IWdsTransportNamespaceScheduledCastVTbl*
  end

  struct IWdsTransportNamespaceScheduledCastManualStartVTbl
    query_interface : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32)
    release : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32)
    get_type_info_count : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IWdsTransportNamespaceScheduledCastManualStart*, WDSTRANSPORT_NAMESPACE_TYPE*, HRESULT)
    get_id : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8**, HRESULT)
    put_name : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8*, HRESULT)
    get_friendly_name : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8**, HRESULT)
    put_friendly_name : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8*, HRESULT)
    get_description : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8**, HRESULT)
    put_description : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8*, HRESULT)
    get_content_provider : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8**, HRESULT)
    put_content_provider : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8*, HRESULT)
    get_configuration : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8**, HRESULT)
    put_configuration : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt8*, HRESULT)
    get_registered : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16*, HRESULT)
    get_tombstoned : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16*, HRESULT)
    get_tombstone_time : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Float64*, HRESULT)
    get_transmission_started : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16*, HRESULT)
    register : Proc(IWdsTransportNamespaceScheduledCastManualStart*, HRESULT)
    deregister : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16, HRESULT)
    clone : Proc(IWdsTransportNamespaceScheduledCastManualStart*, IWdsTransportNamespace*, HRESULT)
    refresh : Proc(IWdsTransportNamespaceScheduledCastManualStart*, HRESULT)
    retrieve_contents : Proc(IWdsTransportNamespaceScheduledCastManualStart*, IWdsTransportCollection*, HRESULT)
    start_transmission : Proc(IWdsTransportNamespaceScheduledCastManualStart*, HRESULT)
  end

  IWdsTransportNamespaceScheduledCastManualStart_GUID = "013e6e4c-e6a7-4fb5-b7ff-d9f5da805c31"
  IID_IWdsTransportNamespaceScheduledCastManualStart = LibC::GUID.new(0x13e6e4c_u32, 0xe6a7_u16, 0x4fb5_u16, StaticArray[0xb7_u8, 0xff_u8, 0xd9_u8, 0xf5_u8, 0xda_u8, 0x80_u8, 0x5c_u8, 0x31_u8])
  struct IWdsTransportNamespaceScheduledCastManualStart
    lpVtbl : IWdsTransportNamespaceScheduledCastManualStartVTbl*
  end

  struct IWdsTransportNamespaceScheduledCastAutoStartVTbl
    query_interface : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32)
    release : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32)
    get_type_info_count : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, WDSTRANSPORT_NAMESPACE_TYPE*, HRESULT)
    get_id : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8**, HRESULT)
    put_name : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8*, HRESULT)
    get_friendly_name : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8**, HRESULT)
    put_friendly_name : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8*, HRESULT)
    get_description : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8**, HRESULT)
    put_description : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8*, HRESULT)
    get_content_provider : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8**, HRESULT)
    put_content_provider : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8*, HRESULT)
    get_configuration : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8**, HRESULT)
    put_configuration : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt8*, HRESULT)
    get_registered : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16*, HRESULT)
    get_tombstoned : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16*, HRESULT)
    get_tombstone_time : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Float64*, HRESULT)
    get_transmission_started : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16*, HRESULT)
    register : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, HRESULT)
    deregister : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16, HRESULT)
    clone : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, IWdsTransportNamespace*, HRESULT)
    refresh : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, HRESULT)
    retrieve_contents : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, IWdsTransportCollection*, HRESULT)
    start_transmission : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, HRESULT)
    get_minimum_clients : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32*, HRESULT)
    put_minimum_clients : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32, HRESULT)
    get_start_time : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Float64*, HRESULT)
    put_start_time : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Float64, HRESULT)
  end

  IWdsTransportNamespaceScheduledCastAutoStart_GUID = "d606af3d-ea9c-4219-961e-7491d618d9b9"
  IID_IWdsTransportNamespaceScheduledCastAutoStart = LibC::GUID.new(0xd606af3d_u32, 0xea9c_u16, 0x4219_u16, StaticArray[0x96_u8, 0x1e_u8, 0x74_u8, 0x91_u8, 0xd6_u8, 0x18_u8, 0xd9_u8, 0xb9_u8])
  struct IWdsTransportNamespaceScheduledCastAutoStart
    lpVtbl : IWdsTransportNamespaceScheduledCastAutoStartVTbl*
  end

  struct IWdsTransportContentVTbl
    query_interface : Proc(IWdsTransportContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportContent*, UInt32)
    release : Proc(IWdsTransportContent*, UInt32)
    get_type_info_count : Proc(IWdsTransportContent*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportContent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportContent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportContent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_namespace : Proc(IWdsTransportContent*, IWdsTransportNamespace*, HRESULT)
    get_id : Proc(IWdsTransportContent*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportContent*, UInt8**, HRESULT)
    retrieve_sessions : Proc(IWdsTransportContent*, IWdsTransportCollection*, HRESULT)
    terminate : Proc(IWdsTransportContent*, HRESULT)
  end

  IWdsTransportContent_GUID = "d405d711-0296-4ab4-a860-ac7d32e65798"
  IID_IWdsTransportContent = LibC::GUID.new(0xd405d711_u32, 0x296_u16, 0x4ab4_u16, StaticArray[0xa8_u8, 0x60_u8, 0xac_u8, 0x7d_u8, 0x32_u8, 0xe6_u8, 0x57_u8, 0x98_u8])
  struct IWdsTransportContent
    lpVtbl : IWdsTransportContentVTbl*
  end

  struct IWdsTransportSessionVTbl
    query_interface : Proc(IWdsTransportSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportSession*, UInt32)
    release : Proc(IWdsTransportSession*, UInt32)
    get_type_info_count : Proc(IWdsTransportSession*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportSession*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportSession*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportSession*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_content : Proc(IWdsTransportSession*, IWdsTransportContent*, HRESULT)
    get_id : Proc(IWdsTransportSession*, UInt32*, HRESULT)
    get_network_interface_name : Proc(IWdsTransportSession*, UInt8**, HRESULT)
    get_network_interface_address : Proc(IWdsTransportSession*, UInt8**, HRESULT)
    get_transfer_rate : Proc(IWdsTransportSession*, UInt32*, HRESULT)
    get_master_client_id : Proc(IWdsTransportSession*, UInt32*, HRESULT)
    retrieve_clients : Proc(IWdsTransportSession*, IWdsTransportCollection*, HRESULT)
    terminate : Proc(IWdsTransportSession*, HRESULT)
  end

  IWdsTransportSession_GUID = "f4efea88-65b1-4f30-a4b9-2793987796fb"
  IID_IWdsTransportSession = LibC::GUID.new(0xf4efea88_u32, 0x65b1_u16, 0x4f30_u16, StaticArray[0xa4_u8, 0xb9_u8, 0x27_u8, 0x93_u8, 0x98_u8, 0x77_u8, 0x96_u8, 0xfb_u8])
  struct IWdsTransportSession
    lpVtbl : IWdsTransportSessionVTbl*
  end

  struct IWdsTransportClientVTbl
    query_interface : Proc(IWdsTransportClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportClient*, UInt32)
    release : Proc(IWdsTransportClient*, UInt32)
    get_type_info_count : Proc(IWdsTransportClient*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportClient*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportClient*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportClient*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IWdsTransportClient*, IWdsTransportSession*, HRESULT)
    get_id : Proc(IWdsTransportClient*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportClient*, UInt8**, HRESULT)
    get_mac_address : Proc(IWdsTransportClient*, UInt8**, HRESULT)
    get_ip_address : Proc(IWdsTransportClient*, UInt8**, HRESULT)
    get_percent_completion : Proc(IWdsTransportClient*, UInt32*, HRESULT)
    get_join_duration : Proc(IWdsTransportClient*, UInt32*, HRESULT)
    get_cpu_utilization : Proc(IWdsTransportClient*, UInt32*, HRESULT)
    get_memory_utilization : Proc(IWdsTransportClient*, UInt32*, HRESULT)
    get_network_utilization : Proc(IWdsTransportClient*, UInt32*, HRESULT)
    get_user_identity : Proc(IWdsTransportClient*, UInt8**, HRESULT)
    disconnect : Proc(IWdsTransportClient*, WDSTRANSPORT_DISCONNECT_TYPE, HRESULT)
  end

  IWdsTransportClient_GUID = "b5dbc93a-cabe-46ca-837f-3e44e93c6545"
  IID_IWdsTransportClient = LibC::GUID.new(0xb5dbc93a_u32, 0xcabe_u16, 0x46ca_u16, StaticArray[0x83_u8, 0x7f_u8, 0x3e_u8, 0x44_u8, 0xe9_u8, 0x3c_u8, 0x65_u8, 0x45_u8])
  struct IWdsTransportClient
    lpVtbl : IWdsTransportClientVTbl*
  end

  struct IWdsTransportTftpClientVTbl
    query_interface : Proc(IWdsTransportTftpClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportTftpClient*, UInt32)
    release : Proc(IWdsTransportTftpClient*, UInt32)
    get_type_info_count : Proc(IWdsTransportTftpClient*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportTftpClient*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportTftpClient*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportTftpClient*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_file_name : Proc(IWdsTransportTftpClient*, UInt8**, HRESULT)
    get_ip_address : Proc(IWdsTransportTftpClient*, UInt8**, HRESULT)
    get_timeout : Proc(IWdsTransportTftpClient*, UInt32*, HRESULT)
    get_current_file_offset : Proc(IWdsTransportTftpClient*, UInt64*, HRESULT)
    get_file_size : Proc(IWdsTransportTftpClient*, UInt64*, HRESULT)
    get_block_size : Proc(IWdsTransportTftpClient*, UInt32*, HRESULT)
    get_window_size : Proc(IWdsTransportTftpClient*, UInt32*, HRESULT)
  end

  IWdsTransportTftpClient_GUID = "b022d3ae-884d-4d85-b146-53320e76ef62"
  IID_IWdsTransportTftpClient = LibC::GUID.new(0xb022d3ae_u32, 0x884d_u16, 0x4d85_u16, StaticArray[0xb1_u8, 0x46_u8, 0x53_u8, 0x32_u8, 0xe_u8, 0x76_u8, 0xef_u8, 0x62_u8])
  struct IWdsTransportTftpClient
    lpVtbl : IWdsTransportTftpClientVTbl*
  end

  struct IWdsTransportContentProviderVTbl
    query_interface : Proc(IWdsTransportContentProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWdsTransportContentProvider*, UInt32)
    release : Proc(IWdsTransportContentProvider*, UInt32)
    get_type_info_count : Proc(IWdsTransportContentProvider*, UInt32*, HRESULT)
    get_type_info : Proc(IWdsTransportContentProvider*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWdsTransportContentProvider*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWdsTransportContentProvider*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IWdsTransportContentProvider*, UInt8**, HRESULT)
    get_description : Proc(IWdsTransportContentProvider*, UInt8**, HRESULT)
    get_file_path : Proc(IWdsTransportContentProvider*, UInt8**, HRESULT)
    get_initialization_routine : Proc(IWdsTransportContentProvider*, UInt8**, HRESULT)
  end

  IWdsTransportContentProvider_GUID = "b9489f24-f219-4acf-aad7-265c7c08a6ae"
  IID_IWdsTransportContentProvider = LibC::GUID.new(0xb9489f24_u32, 0xf219_u16, 0x4acf_u16, StaticArray[0xaa_u8, 0xd7_u8, 0x26_u8, 0x5c_u8, 0x7c_u8, 0x8_u8, 0xa6_u8, 0xae_u8])
  struct IWdsTransportContentProvider
    lpVtbl : IWdsTransportContentProviderVTbl*
  end


  # Params # handle : LibC::HANDLE [In]
  fun WdsCliClose(handle : LibC::HANDLE) : HRESULT

  # Params # pfn : PFN_WdsCliTraceFunction [In]
  fun WdsCliRegisterTrace(pfn : PFN_WdsCliTraceFunction) : HRESULT

  # Params # ppwszarray : LibC::LPWSTR* [In],ulcount : UInt32 [In]
  fun WdsCliFreeStringArray(ppwszarray : LibC::LPWSTR*, ulcount : UInt32) : HRESULT

  # Params # hsession : LibC::HANDLE [In],phfindhandle : LibC::HANDLE* [In]
  fun WdsCliFindFirstImage(hsession : LibC::HANDLE, phfindhandle : LibC::HANDLE*) : HRESULT

  # Params # handle : LibC::HANDLE [In]
  fun WdsCliFindNextImage(handle : LibC::HANDLE) : HRESULT

  # Params # handle : LibC::HANDLE [In],pdwflags : UInt32* [In]
  fun WdsCliGetEnumerationFlags(handle : LibC::HANDLE, pdwflags : UInt32*) : HRESULT

  # Params # findhandle : LibC::HANDLE [In],phimagehandle : LibC::HANDLE* [In]
  fun WdsCliGetImageHandleFromFindHandle(findhandle : LibC::HANDLE, phimagehandle : LibC::HANDLE*) : HRESULT

  # Params # htransfer : LibC::HANDLE [In],phimagehandle : LibC::HANDLE* [In]
  fun WdsCliGetImageHandleFromTransferHandle(htransfer : LibC::HANDLE, phimagehandle : LibC::HANDLE*) : HRESULT

  # Params # pwszserver : LibC::LPWSTR [In],pcred : WDS_CLI_CRED* [In],phsession : LibC::HANDLE* [In]
  fun WdsCliCreateSession(pwszserver : LibC::LPWSTR, pcred : WDS_CLI_CRED*, phsession : LibC::HANDLE*) : HRESULT

  # Params # hsession : LibC::HANDLE [In],pcred : WDS_CLI_CRED* [In]
  fun WdsCliAuthorizeSession(hsession : LibC::HANDLE, pcred : WDS_CLI_CRED*) : HRESULT

  # Params # hsession : LibC::HANDLE [In],ulclientarchitecture : CPU_ARCHITECTURE [In],pwszclientid : LibC::LPWSTR [In],pwszclientaddress : LibC::LPWSTR [In]
  fun WdsCliInitializeLog(hsession : LibC::HANDLE, ulclientarchitecture : CPU_ARCHITECTURE, pwszclientid : LibC::LPWSTR, pwszclientaddress : LibC::LPWSTR) : HRESULT

  # Params # hsession : LibC::HANDLE [In],ulloglevel : UInt32 [In],ulmessagecode : UInt32 [In]
  fun WdsCliLog(hsession : LibC::HANDLE, ulloglevel : UInt32, ulmessagecode : UInt32) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImageName(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImageDescription(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],pimagetype : WDS_CLI_IMAGE_TYPE* [In]
  fun WdsCliGetImageType(hifh : LibC::HANDLE, pimagetype : WDS_CLI_IMAGE_TYPE*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],pppwszfiles : LibC::LPWSTR** [In],pdwcount : UInt32* [In]
  fun WdsCliGetImageFiles(hifh : LibC::HANDLE, pppwszfiles : LibC::LPWSTR**, pdwcount : UInt32*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImageLanguage(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],pppszvalues : Int8*** [In],pdwnumvalues : UInt32* [In]
  fun WdsCliGetImageLanguages(hifh : LibC::HANDLE, pppszvalues : Int8***, pdwnumvalues : UInt32*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImageVersion(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImagePath(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],pdwvalue : UInt32* [In]
  fun WdsCliGetImageIndex(hifh : LibC::HANDLE, pdwvalue : UInt32*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],pdwvalue : CPU_ARCHITECTURE* [In]
  fun WdsCliGetImageArchitecture(hifh : LibC::HANDLE, pdwvalue : CPU_ARCHITECTURE*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppsystimevalue : SYSTEMTIME** [In]
  fun WdsCliGetImageLastModifiedTime(hifh : LibC::HANDLE, ppsystimevalue : SYSTEMTIME**) : HRESULT

  # Params # hifh : LibC::HANDLE [In],pullvalue : UInt64* [In]
  fun WdsCliGetImageSize(hifh : LibC::HANDLE, pullvalue : UInt64*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImageHalName(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImageGroup(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],ppwszvalue : LibC::LPWSTR* [In]
  fun WdsCliGetImageNamespace(hifh : LibC::HANDLE, ppwszvalue : LibC::LPWSTR*) : HRESULT

  # Params # hifh : LibC::HANDLE [In],paramtype : WDS_CLI_IMAGE_PARAM_TYPE [In],presponse : Void* [In],uresponselen : UInt32 [In]
  fun WdsCliGetImageParameter(hifh : LibC::HANDLE, paramtype : WDS_CLI_IMAGE_PARAM_TYPE, presponse : Void*, uresponselen : UInt32) : HRESULT

  # Params # hifh : LibC::HANDLE [In],pullvalue : UInt64* [In]
  fun WdsCliGetTransferSize(hifh : LibC::HANDLE, pullvalue : UInt64*) : HRESULT

  # Params # ulsizeinbytes : UInt32 [In]
  fun WdsCliSetTransferBufferSize(ulsizeinbytes : UInt32) : Void

  # Params # himage : LibC::HANDLE [In],pwszlocalpath : LibC::LPWSTR [In],dwflags : UInt32 [In],dwreserved : UInt32 [In],pfnwdsclicallback : PFN_WdsCliCallback [In],pvuserdata : Void* [In],phtransfer : LibC::HANDLE* [In]
  fun WdsCliTransferImage(himage : LibC::HANDLE, pwszlocalpath : LibC::LPWSTR, dwflags : UInt32, dwreserved : UInt32, pfnwdsclicallback : PFN_WdsCliCallback, pvuserdata : Void*, phtransfer : LibC::HANDLE*) : HRESULT

  # Params # pwszserver : LibC::LPWSTR [In],pwsznamespace : LibC::LPWSTR [In],pwszremotefilepath : LibC::LPWSTR [In],pwszlocalfilepath : LibC::LPWSTR [In],dwflags : UInt32 [In],dwreserved : UInt32 [In],pfnwdsclicallback : PFN_WdsCliCallback [In],pvuserdata : Void* [In],phtransfer : LibC::HANDLE* [In]
  fun WdsCliTransferFile(pwszserver : LibC::LPWSTR, pwsznamespace : LibC::LPWSTR, pwszremotefilepath : LibC::LPWSTR, pwszlocalfilepath : LibC::LPWSTR, dwflags : UInt32, dwreserved : UInt32, pfnwdsclicallback : PFN_WdsCliCallback, pvuserdata : Void*, phtransfer : LibC::HANDLE*) : HRESULT

  # Params # htransfer : LibC::HANDLE [In]
  fun WdsCliCancelTransfer(htransfer : LibC::HANDLE) : HRESULT

  # Params # htransfer : LibC::HANDLE [In]
  fun WdsCliWaitForTransfer(htransfer : LibC::HANDLE) : HRESULT

  # Params # himage : LibC::HANDLE [In],ppwszservername : LibC::LPWSTR* [In],pppwszdriverpackages : LibC::LPWSTR** [In],pulcount : UInt32* [In]
  fun WdsCliObtainDriverPackages(himage : LibC::HANDLE, ppwszservername : LibC::LPWSTR*, pppwszdriverpackages : LibC::LPWSTR**, pulcount : UInt32*) : HRESULT

  # Params # hsession : LibC::HANDLE [In],pwszmachineinfo : LibC::LPWSTR [In],ppwszservername : LibC::LPWSTR* [In],pppwszdriverpackages : LibC::LPWSTR** [In],pulcount : UInt32* [In]
  fun WdsCliObtainDriverPackagesEx(hsession : LibC::HANDLE, pwszmachineinfo : LibC::LPWSTR, ppwszservername : LibC::LPWSTR*, pppwszdriverpackages : LibC::LPWSTR**, pulcount : UInt32*) : HRESULT

  # Params # pwszwindirpath : LibC::LPWSTR [In],ppwszdriverquery : LibC::LPWSTR* [In]
  fun WdsCliGetDriverQueryXml(pwszwindirpath : LibC::LPWSTR, ppwszdriverquery : LibC::LPWSTR*) : HRESULT

  # Params # pszprovidername : LibC::LPWSTR [In],pszmodulepath : LibC::LPWSTR [In],index : UInt32 [In],biscritical : LibC::BOOL [In],phproviderkey : HKEY* [In]
  fun PxeProviderRegister(pszprovidername : LibC::LPWSTR, pszmodulepath : LibC::LPWSTR, index : UInt32, biscritical : LibC::BOOL, phproviderkey : HKEY*) : UInt32

  # Params # pszprovidername : LibC::LPWSTR [In]
  fun PxeProviderUnRegister(pszprovidername : LibC::LPWSTR) : UInt32

  # Params # pszprovidername : LibC::LPWSTR [In],puindex : UInt32* [In]
  fun PxeProviderQueryIndex(pszprovidername : LibC::LPWSTR, puindex : UInt32*) : UInt32

  # Params # phenum : LibC::HANDLE* [In]
  fun PxeProviderEnumFirst(phenum : LibC::HANDLE*) : UInt32

  # Params # henum : LibC::HANDLE [In],ppprovider : PXE_PROVIDER** [In]
  fun PxeProviderEnumNext(henum : LibC::HANDLE, ppprovider : PXE_PROVIDER**) : UInt32

  # Params # henum : LibC::HANDLE [In]
  fun PxeProviderEnumClose(henum : LibC::HANDLE) : UInt32

  # Params # pprovider : PXE_PROVIDER* [In]
  fun PxeProviderFreeInfo(pprovider : PXE_PROVIDER*) : UInt32

  # Params # hprovider : LibC::HANDLE [In],callbacktype : UInt32 [In],pcallbackfunction : Void* [In],pcontext : Void* [In]
  fun PxeRegisterCallback(hprovider : LibC::HANDLE, callbacktype : UInt32, pcallbackfunction : Void*, pcontext : Void*) : UInt32

  # Params # hclientrequest : LibC::HANDLE [In],ppacket : Void* [In],upacketlen : UInt32 [In],paddress : PXE_ADDRESS* [In]
  fun PxeSendReply(hclientrequest : LibC::HANDLE, ppacket : Void*, upacketlen : UInt32, paddress : PXE_ADDRESS*) : UInt32

  # Params # hclientrequest : LibC::HANDLE [In],action : UInt32 [In]
  fun PxeAsyncRecvDone(hclientrequest : LibC::HANDLE, action : UInt32) : UInt32

  # Params # hprovider : LibC::HANDLE [In],severity : UInt32 [In],pszformat : LibC::LPWSTR [In]
  fun PxeTrace(hprovider : LibC::HANDLE, severity : UInt32, pszformat : LibC::LPWSTR) : UInt32

  # Params # hprovider : LibC::HANDLE [In],severity : UInt32 [In],pszformat : LibC::LPWSTR [In],params : Int8* [In]
  fun PxeTraceV(hprovider : LibC::HANDLE, severity : UInt32, pszformat : LibC::LPWSTR, params : Int8*) : UInt32

  # Params # hprovider : LibC::HANDLE [In],hclientrequest : LibC::HANDLE [In],usize : UInt32 [In]
  fun PxePacketAllocate(hprovider : LibC::HANDLE, hclientrequest : LibC::HANDLE, usize : UInt32) : Void*

  # Params # hprovider : LibC::HANDLE [In],hclientrequest : LibC::HANDLE [In],ppacket : Void* [In]
  fun PxePacketFree(hprovider : LibC::HANDLE, hclientrequest : LibC::HANDLE, ppacket : Void*) : UInt32

  # Params # hprovider : LibC::HANDLE [In],attribute : UInt32 [In],pparameterbuffer : Void* [In],uparamlen : UInt32 [In]
  fun PxeProviderSetAttribute(hprovider : LibC::HANDLE, attribute : UInt32, pparameterbuffer : Void*, uparamlen : UInt32) : UInt32

  # Params # precvpacket : Void* [In],urecvpacketlen : UInt32 [In],preplypacket : Void* [In],umaxreplypacketlen : UInt32 [In],pureplypacketlen : UInt32* [In]
  fun PxeDhcpInitialize(precvpacket : Void*, urecvpacketlen : UInt32, preplypacket : Void*, umaxreplypacketlen : UInt32, pureplypacketlen : UInt32*) : UInt32

  # Params # prequest : Void* [In],cbrequest : UInt32 [In],preply : Void* [In],cbreply : UInt32 [In],pcbreplyused : UInt32* [In]
  fun PxeDhcpv6Initialize(prequest : Void*, cbrequest : UInt32, preply : Void*, cbreply : UInt32, pcbreplyused : UInt32*) : UInt32

  # Params # preplypacket : Void* [In],umaxreplypacketlen : UInt32 [In],pureplypacketlen : UInt32* [In],boption : UInt8 [In],boptionlen : UInt8 [In],pvalue : Void* [In]
  fun PxeDhcpAppendOption(preplypacket : Void*, umaxreplypacketlen : UInt32, pureplypacketlen : UInt32*, boption : UInt8, boptionlen : UInt8, pvalue : Void*) : UInt32

  # Params # preply : Void* [In],cbreply : UInt32 [In],pcbreplyused : UInt32* [In],woptiontype : UInt16 [In],cboption : UInt16 [In],poption : Void* [In]
  fun PxeDhcpv6AppendOption(preply : Void*, cbreply : UInt32, pcbreplyused : UInt32*, woptiontype : UInt16, cboption : UInt16, poption : Void*) : UInt32

  # Params # preplypacket : Void* [In],umaxreplypacketlen : UInt32 [In],pureplypacketlen : UInt32* [In],ubufferlen : UInt16 [In],pbuffer : Void* [In]
  fun PxeDhcpAppendOptionRaw(preplypacket : Void*, umaxreplypacketlen : UInt32, pureplypacketlen : UInt32*, ubufferlen : UInt16, pbuffer : Void*) : UInt32

  # Params # preply : Void* [In],cbreply : UInt32 [In],pcbreplyused : UInt32* [In],cbbuffer : UInt16 [In],pbuffer : Void* [In]
  fun PxeDhcpv6AppendOptionRaw(preply : Void*, cbreply : UInt32, pcbreplyused : UInt32*, cbbuffer : UInt16, pbuffer : Void*) : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],brequestpacket : LibC::BOOL [In],pbpxeoptionpresent : LibC::BOOL* [In]
  fun PxeDhcpIsValid(ppacket : Void*, upacketlen : UInt32, brequestpacket : LibC::BOOL, pbpxeoptionpresent : LibC::BOOL*) : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],brequestpacket : LibC::BOOL [In],pbpxeoptionpresent : LibC::BOOL* [In]
  fun PxeDhcpv6IsValid(ppacket : Void*, upacketlen : UInt32, brequestpacket : LibC::BOOL, pbpxeoptionpresent : LibC::BOOL*) : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],uinstance : UInt32 [In],boption : UInt8 [In],pboptionlen : UInt8* [In],ppoptionvalue : Void** [In]
  fun PxeDhcpGetOptionValue(ppacket : Void*, upacketlen : UInt32, uinstance : UInt32, boption : UInt8, pboptionlen : UInt8*, ppoptionvalue : Void**) : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],uinstance : UInt32 [In],woption : UInt16 [In],pwoptionlen : UInt16* [In],ppoptionvalue : Void** [In]
  fun PxeDhcpv6GetOptionValue(ppacket : Void*, upacketlen : UInt32, uinstance : UInt32, woption : UInt16, pwoptionlen : UInt16*, ppoptionvalue : Void**) : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],boption : UInt8 [In],uinstance : UInt32 [In],pboptionlen : UInt8* [In],ppoptionvalue : Void** [In]
  fun PxeDhcpGetVendorOptionValue(ppacket : Void*, upacketlen : UInt32, boption : UInt8, uinstance : UInt32, pboptionlen : UInt8*, ppoptionvalue : Void**) : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],dwenterprisenumber : UInt32 [In],woption : UInt16 [In],uinstance : UInt32 [In],pwoptionlen : UInt16* [In],ppoptionvalue : Void** [In]
  fun PxeDhcpv6GetVendorOptionValue(ppacket : Void*, upacketlen : UInt32, dwenterprisenumber : UInt32, woption : UInt16, uinstance : UInt32, pwoptionlen : UInt16*, ppoptionvalue : Void**) : UInt32

  # Params # prelayforwpacket : Void* [In],urelayforwpacketlen : UInt32 [In],prelaymessages : PXE_DHCPV6_NESTED_RELAY_MESSAGE* [In],nrelaymessages : UInt32 [In],pnrelaymessages : UInt32* [In],ppinnerpacket : UInt8** [In],pcbinnerpacket : UInt32* [In]
  fun PxeDhcpv6ParseRelayForw(prelayforwpacket : Void*, urelayforwpacketlen : UInt32, prelaymessages : PXE_DHCPV6_NESTED_RELAY_MESSAGE*, nrelaymessages : UInt32, pnrelaymessages : UInt32*, ppinnerpacket : UInt8**, pcbinnerpacket : UInt32*) : UInt32

  # Params # prelaymessages : PXE_DHCPV6_NESTED_RELAY_MESSAGE* [In],nrelaymessages : UInt32 [In],pinnerpacket : UInt8* [In],cbinnerpacket : UInt32 [In],preplybuffer : Void* [In],cbreplybuffer : UInt32 [In],pcbreplybuffer : UInt32* [In]
  fun PxeDhcpv6CreateRelayRepl(prelaymessages : PXE_DHCPV6_NESTED_RELAY_MESSAGE*, nrelaymessages : UInt32, pinnerpacket : UInt8*, cbinnerpacket : UInt32, preplybuffer : Void*, cbreplybuffer : UInt32, pcbreplybuffer : UInt32*) : UInt32

  # Params # uinfotype : UInt32 [In],pbuffer : Void* [In],ubufferlen : UInt32 [In]
  fun PxeGetServerInfo(uinfotype : UInt32, pbuffer : Void*, ubufferlen : UInt32) : UInt32

  # Params # uinfotype : UInt32 [In],pbuffer : Void* [In],ubufferlen : UInt32 [In],pubufferused : UInt32* [In]
  fun PxeGetServerInfoEx(uinfotype : UInt32, pbuffer : Void*, ubufferlen : UInt32, pubufferused : UInt32*) : UInt32

  # Params # hprovider : LibC::HANDLE [In],callbackid : TRANSPORTPROVIDER_CALLBACK_ID [In],pfncallback : Void* [In]
  fun WdsTransportServerRegisterCallback(hprovider : LibC::HANDLE, callbackid : TRANSPORTPROVIDER_CALLBACK_ID, pfncallback : Void*) : HRESULT

  # Params # hprovider : LibC::HANDLE [In],ulbytesread : UInt32 [In],pvuserdata : Void* [In],hreadresult : HRESULT [In]
  fun WdsTransportServerCompleteRead(hprovider : LibC::HANDLE, ulbytesread : UInt32, pvuserdata : Void*, hreadresult : HRESULT) : HRESULT

  # Params # hprovider : LibC::HANDLE [In],severity : UInt32 [In],pwszformat : LibC::LPWSTR [In]
  fun WdsTransportServerTrace(hprovider : LibC::HANDLE, severity : UInt32, pwszformat : LibC::LPWSTR) : HRESULT

  # Params # hprovider : LibC::HANDLE [In],severity : UInt32 [In],pwszformat : LibC::LPWSTR [In],params : Int8* [In]
  fun WdsTransportServerTraceV(hprovider : LibC::HANDLE, severity : UInt32, pwszformat : LibC::LPWSTR, params : Int8*) : HRESULT

  # Params # hprovider : LibC::HANDLE [In],ulbuffersize : UInt32 [In]
  fun WdsTransportServerAllocateBuffer(hprovider : LibC::HANDLE, ulbuffersize : UInt32) : Void*

  # Params # hprovider : LibC::HANDLE [In],pvbuffer : Void* [In]
  fun WdsTransportServerFreeBuffer(hprovider : LibC::HANDLE, pvbuffer : Void*) : HRESULT

  # Params # 
  fun WdsTransportClientInitialize : UInt32

  # Params # psessionrequest : WDS_TRANSPORTCLIENT_REQUEST* [In],pcallerdata : Void* [In],hsessionkey : LibC::HANDLE* [In]
  fun WdsTransportClientInitializeSession(psessionrequest : WDS_TRANSPORTCLIENT_REQUEST*, pcallerdata : Void*, hsessionkey : LibC::HANDLE*) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In],callbackid : TRANSPORTCLIENT_CALLBACK_ID [In],pfncallback : Void* [In]
  fun WdsTransportClientRegisterCallback(hsessionkey : LibC::HANDLE, callbackid : TRANSPORTCLIENT_CALLBACK_ID, pfncallback : Void*) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In]
  fun WdsTransportClientStartSession(hsessionkey : LibC::HANDLE) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In],ulsize : UInt32 [In],pulloffset : ULARGE_INTEGER* [In]
  fun WdsTransportClientCompleteReceive(hsessionkey : LibC::HANDLE, ulsize : UInt32, pulloffset : ULARGE_INTEGER*) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In]
  fun WdsTransportClientCancelSession(hsessionkey : LibC::HANDLE) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In],dwerrorcode : UInt32 [In]
  fun WdsTransportClientCancelSessionEx(hsessionkey : LibC::HANDLE, dwerrorcode : UInt32) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In],utimeout : UInt32 [In]
  fun WdsTransportClientWaitForCompletion(hsessionkey : LibC::HANDLE, utimeout : UInt32) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In],pustatus : UInt32* [In],puerrorcode : UInt32* [In]
  fun WdsTransportClientQueryStatus(hsessionkey : LibC::HANDLE, pustatus : UInt32*, puerrorcode : UInt32*) : UInt32

  # Params # hsessionkey : LibC::HANDLE [In]
  fun WdsTransportClientCloseSession(hsessionkey : LibC::HANDLE) : UInt32

  # Params # pvbuffer : Void* [In]
  fun WdsTransportClientAddRefBuffer(pvbuffer : Void*) : UInt32

  # Params # pvbuffer : Void* [In]
  fun WdsTransportClientReleaseBuffer(pvbuffer : Void*) : UInt32

  # Params # 
  fun WdsTransportClientShutdown : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],pbpackettype : UInt8* [In],phhandle : LibC::HANDLE* [In]
  fun WdsBpParseInitialize(ppacket : Void*, upacketlen : UInt32, pbpackettype : UInt8*, phhandle : LibC::HANDLE*) : UInt32

  # Params # ppacket : Void* [In],upacketlen : UInt32 [In],pbpackettype : UInt8* [In],phhandle : LibC::HANDLE* [In]
  fun WdsBpParseInitializev6(ppacket : Void*, upacketlen : UInt32, pbpackettype : UInt8*, phhandle : LibC::HANDLE*) : UInt32

  # Params # bpackettype : UInt8 [In],phhandle : LibC::HANDLE* [In]
  fun WdsBpInitialize(bpackettype : UInt8, phhandle : LibC::HANDLE*) : UInt32

  # Params # hhandle : LibC::HANDLE [In]
  fun WdsBpCloseHandle(hhandle : LibC::HANDLE) : UInt32

  # Params # hhandle : LibC::HANDLE [In],uoption : UInt32 [In],uvaluelen : UInt32 [In],pvalue : Void* [In],pubytes : UInt32* [In]
  fun WdsBpQueryOption(hhandle : LibC::HANDLE, uoption : UInt32, uvaluelen : UInt32, pvalue : Void*, pubytes : UInt32*) : UInt32

  # Params # hhandle : LibC::HANDLE [In],uoption : UInt32 [In],uvaluelen : UInt32 [In],pvalue : Void* [In]
  fun WdsBpAddOption(hhandle : LibC::HANDLE, uoption : UInt32, uvaluelen : UInt32, pvalue : Void*) : UInt32

  # Params # hhandle : LibC::HANDLE [In],ubufferlen : UInt32 [In],pbuffer : Void* [In],pubytes : UInt32* [In]
  fun WdsBpGetOptionBuffer(hhandle : LibC::HANDLE, ubufferlen : UInt32, pbuffer : Void*, pubytes : UInt32*) : UInt32
end
struct LibWin32::IWdsTransportCacheable
  def query_interface(this : IWdsTransportCacheable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportCacheable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportCacheable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportCacheable*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportCacheable*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportCacheable*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportCacheable*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_dirty(this : IWdsTransportCacheable*, pbdirty : Int16*) : HRESULT
    @lpVtbl.value.get_dirty.call(this, pbdirty)
  end
  def discard(this : IWdsTransportCacheable*) : HRESULT
    @lpVtbl.value.discard.call(this)
  end
  def refresh(this : IWdsTransportCacheable*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def commit(this : IWdsTransportCacheable*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
end
struct LibWin32::IWdsTransportCollection
  def query_interface(this : IWdsTransportCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IWdsTransportCollection*, pulcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pulcount)
  end
  def get_item(this : IWdsTransportCollection*, ulindex : UInt32, ppval : IDispatch*) : HRESULT
    @lpVtbl.value.get_item.call(this, ulindex, ppval)
  end
  def get__new_enum(this : IWdsTransportCollection*, ppval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppval)
  end
end
struct LibWin32::IWdsTransportManager
  def query_interface(this : IWdsTransportManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_wds_transport_server(this : IWdsTransportManager*, bszservername : UInt8*, ppwdstransportserver : IWdsTransportServer*) : HRESULT
    @lpVtbl.value.get_wds_transport_server.call(this, bszservername, ppwdstransportserver)
  end
end
struct LibWin32::IWdsTransportServer
  def query_interface(this : IWdsTransportServer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportServer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportServer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportServer*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportServer*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportServer*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportServer*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IWdsTransportServer*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def get_setup_manager(this : IWdsTransportServer*, ppwdstransportsetupmanager : IWdsTransportSetupManager*) : HRESULT
    @lpVtbl.value.get_setup_manager.call(this, ppwdstransportsetupmanager)
  end
  def get_configuration_manager(this : IWdsTransportServer*, ppwdstransportconfigurationmanager : IWdsTransportConfigurationManager*) : HRESULT
    @lpVtbl.value.get_configuration_manager.call(this, ppwdstransportconfigurationmanager)
  end
  def get_namespace_manager(this : IWdsTransportServer*, ppwdstransportnamespacemanager : IWdsTransportNamespaceManager*) : HRESULT
    @lpVtbl.value.get_namespace_manager.call(this, ppwdstransportnamespacemanager)
  end
  def disconnect_client(this : IWdsTransportServer*, ulclientid : UInt32, disconnectiontype : WDSTRANSPORT_DISCONNECT_TYPE) : HRESULT
    @lpVtbl.value.disconnect_client.call(this, ulclientid, disconnectiontype)
  end
end
struct LibWin32::IWdsTransportServer2
  def query_interface(this : IWdsTransportServer2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportServer2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportServer2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportServer2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportServer2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportServer2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportServer2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IWdsTransportServer2*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def get_setup_manager(this : IWdsTransportServer2*, ppwdstransportsetupmanager : IWdsTransportSetupManager*) : HRESULT
    @lpVtbl.value.get_setup_manager.call(this, ppwdstransportsetupmanager)
  end
  def get_configuration_manager(this : IWdsTransportServer2*, ppwdstransportconfigurationmanager : IWdsTransportConfigurationManager*) : HRESULT
    @lpVtbl.value.get_configuration_manager.call(this, ppwdstransportconfigurationmanager)
  end
  def get_namespace_manager(this : IWdsTransportServer2*, ppwdstransportnamespacemanager : IWdsTransportNamespaceManager*) : HRESULT
    @lpVtbl.value.get_namespace_manager.call(this, ppwdstransportnamespacemanager)
  end
  def disconnect_client(this : IWdsTransportServer2*, ulclientid : UInt32, disconnectiontype : WDSTRANSPORT_DISCONNECT_TYPE) : HRESULT
    @lpVtbl.value.disconnect_client.call(this, ulclientid, disconnectiontype)
  end
  def get_tftp_manager(this : IWdsTransportServer2*, ppwdstransporttftpmanager : IWdsTransportTftpManager*) : HRESULT
    @lpVtbl.value.get_tftp_manager.call(this, ppwdstransporttftpmanager)
  end
end
struct LibWin32::IWdsTransportSetupManager
  def query_interface(this : IWdsTransportSetupManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportSetupManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportSetupManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportSetupManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportSetupManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportSetupManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportSetupManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_version(this : IWdsTransportSetupManager*, pullversion : UInt64*) : HRESULT
    @lpVtbl.value.get_version.call(this, pullversion)
  end
  def get_installed_features(this : IWdsTransportSetupManager*, pulinstalledfeatures : UInt32*) : HRESULT
    @lpVtbl.value.get_installed_features.call(this, pulinstalledfeatures)
  end
  def get_protocols(this : IWdsTransportSetupManager*, pulprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_protocols.call(this, pulprotocols)
  end
  def register_content_provider(this : IWdsTransportSetupManager*, bszname : UInt8*, bszdescription : UInt8*, bszfilepath : UInt8*, bszinitializationroutine : UInt8*) : HRESULT
    @lpVtbl.value.register_content_provider.call(this, bszname, bszdescription, bszfilepath, bszinitializationroutine)
  end
  def deregister_content_provider(this : IWdsTransportSetupManager*, bszname : UInt8*) : HRESULT
    @lpVtbl.value.deregister_content_provider.call(this, bszname)
  end
end
struct LibWin32::IWdsTransportSetupManager2
  def query_interface(this : IWdsTransportSetupManager2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportSetupManager2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportSetupManager2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportSetupManager2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportSetupManager2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportSetupManager2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportSetupManager2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_version(this : IWdsTransportSetupManager2*, pullversion : UInt64*) : HRESULT
    @lpVtbl.value.get_version.call(this, pullversion)
  end
  def get_installed_features(this : IWdsTransportSetupManager2*, pulinstalledfeatures : UInt32*) : HRESULT
    @lpVtbl.value.get_installed_features.call(this, pulinstalledfeatures)
  end
  def get_protocols(this : IWdsTransportSetupManager2*, pulprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_protocols.call(this, pulprotocols)
  end
  def register_content_provider(this : IWdsTransportSetupManager2*, bszname : UInt8*, bszdescription : UInt8*, bszfilepath : UInt8*, bszinitializationroutine : UInt8*) : HRESULT
    @lpVtbl.value.register_content_provider.call(this, bszname, bszdescription, bszfilepath, bszinitializationroutine)
  end
  def deregister_content_provider(this : IWdsTransportSetupManager2*, bszname : UInt8*) : HRESULT
    @lpVtbl.value.deregister_content_provider.call(this, bszname)
  end
  def get_tftp_capabilities(this : IWdsTransportSetupManager2*, pultftpcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.get_tftp_capabilities.call(this, pultftpcapabilities)
  end
  def get_content_providers(this : IWdsTransportSetupManager2*, ppprovidercollection : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.get_content_providers.call(this, ppprovidercollection)
  end
end
struct LibWin32::IWdsTransportConfigurationManager
  def query_interface(this : IWdsTransportConfigurationManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportConfigurationManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportConfigurationManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportConfigurationManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportConfigurationManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportConfigurationManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportConfigurationManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_service_policy(this : IWdsTransportConfigurationManager*, ppwdstransportservicepolicy : IWdsTransportServicePolicy*) : HRESULT
    @lpVtbl.value.get_service_policy.call(this, ppwdstransportservicepolicy)
  end
  def get_diagnostics_policy(this : IWdsTransportConfigurationManager*, ppwdstransportdiagnosticspolicy : IWdsTransportDiagnosticsPolicy*) : HRESULT
    @lpVtbl.value.get_diagnostics_policy.call(this, ppwdstransportdiagnosticspolicy)
  end
  def get_wds_transport_services_running(this : IWdsTransportConfigurationManager*, brealtimestatus : Int16, pbservicesrunning : Int16*) : HRESULT
    @lpVtbl.value.get_wds_transport_services_running.call(this, brealtimestatus, pbservicesrunning)
  end
  def enable_wds_transport_services(this : IWdsTransportConfigurationManager*) : HRESULT
    @lpVtbl.value.enable_wds_transport_services.call(this)
  end
  def disable_wds_transport_services(this : IWdsTransportConfigurationManager*) : HRESULT
    @lpVtbl.value.disable_wds_transport_services.call(this)
  end
  def start_wds_transport_services(this : IWdsTransportConfigurationManager*) : HRESULT
    @lpVtbl.value.start_wds_transport_services.call(this)
  end
  def stop_wds_transport_services(this : IWdsTransportConfigurationManager*) : HRESULT
    @lpVtbl.value.stop_wds_transport_services.call(this)
  end
  def restart_wds_transport_services(this : IWdsTransportConfigurationManager*) : HRESULT
    @lpVtbl.value.restart_wds_transport_services.call(this)
  end
  def notify_wds_transport_services(this : IWdsTransportConfigurationManager*, servicenotification : WDSTRANSPORT_SERVICE_NOTIFICATION) : HRESULT
    @lpVtbl.value.notify_wds_transport_services.call(this, servicenotification)
  end
end
struct LibWin32::IWdsTransportConfigurationManager2
  def query_interface(this : IWdsTransportConfigurationManager2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportConfigurationManager2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportConfigurationManager2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportConfigurationManager2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportConfigurationManager2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportConfigurationManager2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportConfigurationManager2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_service_policy(this : IWdsTransportConfigurationManager2*, ppwdstransportservicepolicy : IWdsTransportServicePolicy*) : HRESULT
    @lpVtbl.value.get_service_policy.call(this, ppwdstransportservicepolicy)
  end
  def get_diagnostics_policy(this : IWdsTransportConfigurationManager2*, ppwdstransportdiagnosticspolicy : IWdsTransportDiagnosticsPolicy*) : HRESULT
    @lpVtbl.value.get_diagnostics_policy.call(this, ppwdstransportdiagnosticspolicy)
  end
  def get_wds_transport_services_running(this : IWdsTransportConfigurationManager2*, brealtimestatus : Int16, pbservicesrunning : Int16*) : HRESULT
    @lpVtbl.value.get_wds_transport_services_running.call(this, brealtimestatus, pbservicesrunning)
  end
  def enable_wds_transport_services(this : IWdsTransportConfigurationManager2*) : HRESULT
    @lpVtbl.value.enable_wds_transport_services.call(this)
  end
  def disable_wds_transport_services(this : IWdsTransportConfigurationManager2*) : HRESULT
    @lpVtbl.value.disable_wds_transport_services.call(this)
  end
  def start_wds_transport_services(this : IWdsTransportConfigurationManager2*) : HRESULT
    @lpVtbl.value.start_wds_transport_services.call(this)
  end
  def stop_wds_transport_services(this : IWdsTransportConfigurationManager2*) : HRESULT
    @lpVtbl.value.stop_wds_transport_services.call(this)
  end
  def restart_wds_transport_services(this : IWdsTransportConfigurationManager2*) : HRESULT
    @lpVtbl.value.restart_wds_transport_services.call(this)
  end
  def notify_wds_transport_services(this : IWdsTransportConfigurationManager2*, servicenotification : WDSTRANSPORT_SERVICE_NOTIFICATION) : HRESULT
    @lpVtbl.value.notify_wds_transport_services.call(this, servicenotification)
  end
  def get_multicast_session_policy(this : IWdsTransportConfigurationManager2*, ppwdstransportmulticastsessionpolicy : IWdsTransportMulticastSessionPolicy*) : HRESULT
    @lpVtbl.value.get_multicast_session_policy.call(this, ppwdstransportmulticastsessionpolicy)
  end
end
struct LibWin32::IWdsTransportNamespaceManager
  def query_interface(this : IWdsTransportNamespaceManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportNamespaceManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportNamespaceManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportNamespaceManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportNamespaceManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportNamespaceManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportNamespaceManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_namespace(this : IWdsTransportNamespaceManager*, namespacetype : WDSTRANSPORT_NAMESPACE_TYPE, bsznamespacename : UInt8*, bszcontentprovider : UInt8*, bszconfiguration : UInt8*, ppwdstransportnamespace : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.create_namespace.call(this, namespacetype, bsznamespacename, bszcontentprovider, bszconfiguration, ppwdstransportnamespace)
  end
  def retrieve_namespace(this : IWdsTransportNamespaceManager*, bsznamespacename : UInt8*, ppwdstransportnamespace : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.retrieve_namespace.call(this, bsznamespacename, ppwdstransportnamespace)
  end
  def retrieve_namespaces(this : IWdsTransportNamespaceManager*, bszcontentprovider : UInt8*, bsznamespacename : UInt8*, bincludetombstones : Int16, ppwdstransportnamespaces : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_namespaces.call(this, bszcontentprovider, bsznamespacename, bincludetombstones, ppwdstransportnamespaces)
  end
end
struct LibWin32::IWdsTransportTftpManager
  def query_interface(this : IWdsTransportTftpManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportTftpManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportTftpManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportTftpManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportTftpManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportTftpManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportTftpManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def retrieve_tftp_clients(this : IWdsTransportTftpManager*, ppwdstransporttftpclients : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_tftp_clients.call(this, ppwdstransporttftpclients)
  end
end
struct LibWin32::IWdsTransportServicePolicy
  def query_interface(this : IWdsTransportServicePolicy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportServicePolicy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportServicePolicy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportServicePolicy*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportServicePolicy*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportServicePolicy*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportServicePolicy*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_dirty(this : IWdsTransportServicePolicy*, pbdirty : Int16*) : HRESULT
    @lpVtbl.value.get_dirty.call(this, pbdirty)
  end
  def discard(this : IWdsTransportServicePolicy*) : HRESULT
    @lpVtbl.value.discard.call(this)
  end
  def refresh(this : IWdsTransportServicePolicy*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def commit(this : IWdsTransportServicePolicy*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_ip_address_source(this : IWdsTransportServicePolicy*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, psourcetype : WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*) : HRESULT
    @lpVtbl.value.get_ip_address_source.call(this, addresstype, psourcetype)
  end
  def put_ip_address_source(this : IWdsTransportServicePolicy*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, sourcetype : WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE) : HRESULT
    @lpVtbl.value.put_ip_address_source.call(this, addresstype, sourcetype)
  end
  def get_start_ip_address(this : IWdsTransportServicePolicy*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, pbszstartipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_start_ip_address.call(this, addresstype, pbszstartipaddress)
  end
  def put_start_ip_address(this : IWdsTransportServicePolicy*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, bszstartipaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_start_ip_address.call(this, addresstype, bszstartipaddress)
  end
  def get_end_ip_address(this : IWdsTransportServicePolicy*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, pbszendipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_end_ip_address.call(this, addresstype, pbszendipaddress)
  end
  def put_end_ip_address(this : IWdsTransportServicePolicy*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, bszendipaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_end_ip_address.call(this, addresstype, bszendipaddress)
  end
  def get_start_port(this : IWdsTransportServicePolicy*, pulstartport : UInt32*) : HRESULT
    @lpVtbl.value.get_start_port.call(this, pulstartport)
  end
  def put_start_port(this : IWdsTransportServicePolicy*, ulstartport : UInt32) : HRESULT
    @lpVtbl.value.put_start_port.call(this, ulstartport)
  end
  def get_end_port(this : IWdsTransportServicePolicy*, pulendport : UInt32*) : HRESULT
    @lpVtbl.value.get_end_port.call(this, pulendport)
  end
  def put_end_port(this : IWdsTransportServicePolicy*, ulendport : UInt32) : HRESULT
    @lpVtbl.value.put_end_port.call(this, ulendport)
  end
  def get_network_profile(this : IWdsTransportServicePolicy*, pprofiletype : WDSTRANSPORT_NETWORK_PROFILE_TYPE*) : HRESULT
    @lpVtbl.value.get_network_profile.call(this, pprofiletype)
  end
  def put_network_profile(this : IWdsTransportServicePolicy*, profiletype : WDSTRANSPORT_NETWORK_PROFILE_TYPE) : HRESULT
    @lpVtbl.value.put_network_profile.call(this, profiletype)
  end
end
struct LibWin32::IWdsTransportServicePolicy2
  def query_interface(this : IWdsTransportServicePolicy2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportServicePolicy2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportServicePolicy2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportServicePolicy2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportServicePolicy2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportServicePolicy2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportServicePolicy2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_dirty(this : IWdsTransportServicePolicy2*, pbdirty : Int16*) : HRESULT
    @lpVtbl.value.get_dirty.call(this, pbdirty)
  end
  def discard(this : IWdsTransportServicePolicy2*) : HRESULT
    @lpVtbl.value.discard.call(this)
  end
  def refresh(this : IWdsTransportServicePolicy2*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def commit(this : IWdsTransportServicePolicy2*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_ip_address_source(this : IWdsTransportServicePolicy2*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, psourcetype : WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*) : HRESULT
    @lpVtbl.value.get_ip_address_source.call(this, addresstype, psourcetype)
  end
  def put_ip_address_source(this : IWdsTransportServicePolicy2*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, sourcetype : WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE) : HRESULT
    @lpVtbl.value.put_ip_address_source.call(this, addresstype, sourcetype)
  end
  def get_start_ip_address(this : IWdsTransportServicePolicy2*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, pbszstartipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_start_ip_address.call(this, addresstype, pbszstartipaddress)
  end
  def put_start_ip_address(this : IWdsTransportServicePolicy2*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, bszstartipaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_start_ip_address.call(this, addresstype, bszstartipaddress)
  end
  def get_end_ip_address(this : IWdsTransportServicePolicy2*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, pbszendipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_end_ip_address.call(this, addresstype, pbszendipaddress)
  end
  def put_end_ip_address(this : IWdsTransportServicePolicy2*, addresstype : WDSTRANSPORT_IP_ADDRESS_TYPE, bszendipaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_end_ip_address.call(this, addresstype, bszendipaddress)
  end
  def get_start_port(this : IWdsTransportServicePolicy2*, pulstartport : UInt32*) : HRESULT
    @lpVtbl.value.get_start_port.call(this, pulstartport)
  end
  def put_start_port(this : IWdsTransportServicePolicy2*, ulstartport : UInt32) : HRESULT
    @lpVtbl.value.put_start_port.call(this, ulstartport)
  end
  def get_end_port(this : IWdsTransportServicePolicy2*, pulendport : UInt32*) : HRESULT
    @lpVtbl.value.get_end_port.call(this, pulendport)
  end
  def put_end_port(this : IWdsTransportServicePolicy2*, ulendport : UInt32) : HRESULT
    @lpVtbl.value.put_end_port.call(this, ulendport)
  end
  def get_network_profile(this : IWdsTransportServicePolicy2*, pprofiletype : WDSTRANSPORT_NETWORK_PROFILE_TYPE*) : HRESULT
    @lpVtbl.value.get_network_profile.call(this, pprofiletype)
  end
  def put_network_profile(this : IWdsTransportServicePolicy2*, profiletype : WDSTRANSPORT_NETWORK_PROFILE_TYPE) : HRESULT
    @lpVtbl.value.put_network_profile.call(this, profiletype)
  end
  def get_udp_port_policy(this : IWdsTransportServicePolicy2*, pudpportpolicy : WDSTRANSPORT_UDP_PORT_POLICY*) : HRESULT
    @lpVtbl.value.get_udp_port_policy.call(this, pudpportpolicy)
  end
  def put_udp_port_policy(this : IWdsTransportServicePolicy2*, udpportpolicy : WDSTRANSPORT_UDP_PORT_POLICY) : HRESULT
    @lpVtbl.value.put_udp_port_policy.call(this, udpportpolicy)
  end
  def get_tftp_maximum_block_size(this : IWdsTransportServicePolicy2*, pultftpmaximumblocksize : UInt32*) : HRESULT
    @lpVtbl.value.get_tftp_maximum_block_size.call(this, pultftpmaximumblocksize)
  end
  def put_tftp_maximum_block_size(this : IWdsTransportServicePolicy2*, ultftpmaximumblocksize : UInt32) : HRESULT
    @lpVtbl.value.put_tftp_maximum_block_size.call(this, ultftpmaximumblocksize)
  end
  def get_enable_tftp_variable_window_extension(this : IWdsTransportServicePolicy2*, pbenabletftpvariablewindowextension : Int16*) : HRESULT
    @lpVtbl.value.get_enable_tftp_variable_window_extension.call(this, pbenabletftpvariablewindowextension)
  end
  def put_enable_tftp_variable_window_extension(this : IWdsTransportServicePolicy2*, benabletftpvariablewindowextension : Int16) : HRESULT
    @lpVtbl.value.put_enable_tftp_variable_window_extension.call(this, benabletftpvariablewindowextension)
  end
end
struct LibWin32::IWdsTransportDiagnosticsPolicy
  def query_interface(this : IWdsTransportDiagnosticsPolicy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportDiagnosticsPolicy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportDiagnosticsPolicy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportDiagnosticsPolicy*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportDiagnosticsPolicy*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportDiagnosticsPolicy*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportDiagnosticsPolicy*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_dirty(this : IWdsTransportDiagnosticsPolicy*, pbdirty : Int16*) : HRESULT
    @lpVtbl.value.get_dirty.call(this, pbdirty)
  end
  def discard(this : IWdsTransportDiagnosticsPolicy*) : HRESULT
    @lpVtbl.value.discard.call(this)
  end
  def refresh(this : IWdsTransportDiagnosticsPolicy*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def commit(this : IWdsTransportDiagnosticsPolicy*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_enabled(this : IWdsTransportDiagnosticsPolicy*, pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pbenabled)
  end
  def put_enabled(this : IWdsTransportDiagnosticsPolicy*, benabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, benabled)
  end
  def get_components(this : IWdsTransportDiagnosticsPolicy*, pulcomponents : UInt32*) : HRESULT
    @lpVtbl.value.get_components.call(this, pulcomponents)
  end
  def put_components(this : IWdsTransportDiagnosticsPolicy*, ulcomponents : UInt32) : HRESULT
    @lpVtbl.value.put_components.call(this, ulcomponents)
  end
end
struct LibWin32::IWdsTransportMulticastSessionPolicy
  def query_interface(this : IWdsTransportMulticastSessionPolicy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportMulticastSessionPolicy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportMulticastSessionPolicy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportMulticastSessionPolicy*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportMulticastSessionPolicy*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportMulticastSessionPolicy*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportMulticastSessionPolicy*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_dirty(this : IWdsTransportMulticastSessionPolicy*, pbdirty : Int16*) : HRESULT
    @lpVtbl.value.get_dirty.call(this, pbdirty)
  end
  def discard(this : IWdsTransportMulticastSessionPolicy*) : HRESULT
    @lpVtbl.value.discard.call(this)
  end
  def refresh(this : IWdsTransportMulticastSessionPolicy*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def commit(this : IWdsTransportMulticastSessionPolicy*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_slow_client_handling(this : IWdsTransportMulticastSessionPolicy*, pslowclienthandling : WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE*) : HRESULT
    @lpVtbl.value.get_slow_client_handling.call(this, pslowclienthandling)
  end
  def put_slow_client_handling(this : IWdsTransportMulticastSessionPolicy*, slowclienthandling : WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE) : HRESULT
    @lpVtbl.value.put_slow_client_handling.call(this, slowclienthandling)
  end
  def get_auto_disconnect_threshold(this : IWdsTransportMulticastSessionPolicy*, pulthreshold : UInt32*) : HRESULT
    @lpVtbl.value.get_auto_disconnect_threshold.call(this, pulthreshold)
  end
  def put_auto_disconnect_threshold(this : IWdsTransportMulticastSessionPolicy*, ulthreshold : UInt32) : HRESULT
    @lpVtbl.value.put_auto_disconnect_threshold.call(this, ulthreshold)
  end
  def get_multistream_stream_count(this : IWdsTransportMulticastSessionPolicy*, pulstreamcount : UInt32*) : HRESULT
    @lpVtbl.value.get_multistream_stream_count.call(this, pulstreamcount)
  end
  def put_multistream_stream_count(this : IWdsTransportMulticastSessionPolicy*, ulstreamcount : UInt32) : HRESULT
    @lpVtbl.value.put_multistream_stream_count.call(this, ulstreamcount)
  end
  def get_slow_client_fallback(this : IWdsTransportMulticastSessionPolicy*, pbclientfallback : Int16*) : HRESULT
    @lpVtbl.value.get_slow_client_fallback.call(this, pbclientfallback)
  end
  def put_slow_client_fallback(this : IWdsTransportMulticastSessionPolicy*, bclientfallback : Int16) : HRESULT
    @lpVtbl.value.put_slow_client_fallback.call(this, bclientfallback)
  end
end
struct LibWin32::IWdsTransportNamespace
  def query_interface(this : IWdsTransportNamespace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportNamespace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportNamespace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportNamespace*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportNamespace*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportNamespace*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportNamespace*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IWdsTransportNamespace*, ptype : WDSTRANSPORT_NAMESPACE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IWdsTransportNamespace*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_name(this : IWdsTransportNamespace*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def put_name(this : IWdsTransportNamespace*, bszname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bszname)
  end
  def get_friendly_name(this : IWdsTransportNamespace*, pbszfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbszfriendlyname)
  end
  def put_friendly_name(this : IWdsTransportNamespace*, bszfriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.put_friendly_name.call(this, bszfriendlyname)
  end
  def get_description(this : IWdsTransportNamespace*, pbszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbszdescription)
  end
  def put_description(this : IWdsTransportNamespace*, bszdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bszdescription)
  end
  def get_content_provider(this : IWdsTransportNamespace*, pbszcontentprovider : UInt8**) : HRESULT
    @lpVtbl.value.get_content_provider.call(this, pbszcontentprovider)
  end
  def put_content_provider(this : IWdsTransportNamespace*, bszcontentprovider : UInt8*) : HRESULT
    @lpVtbl.value.put_content_provider.call(this, bszcontentprovider)
  end
  def get_configuration(this : IWdsTransportNamespace*, pbszconfiguration : UInt8**) : HRESULT
    @lpVtbl.value.get_configuration.call(this, pbszconfiguration)
  end
  def put_configuration(this : IWdsTransportNamespace*, bszconfiguration : UInt8*) : HRESULT
    @lpVtbl.value.put_configuration.call(this, bszconfiguration)
  end
  def get_registered(this : IWdsTransportNamespace*, pbregistered : Int16*) : HRESULT
    @lpVtbl.value.get_registered.call(this, pbregistered)
  end
  def get_tombstoned(this : IWdsTransportNamespace*, pbtombstoned : Int16*) : HRESULT
    @lpVtbl.value.get_tombstoned.call(this, pbtombstoned)
  end
  def get_tombstone_time(this : IWdsTransportNamespace*, ptombstonetime : Float64*) : HRESULT
    @lpVtbl.value.get_tombstone_time.call(this, ptombstonetime)
  end
  def get_transmission_started(this : IWdsTransportNamespace*, pbtransmissionstarted : Int16*) : HRESULT
    @lpVtbl.value.get_transmission_started.call(this, pbtransmissionstarted)
  end
  def register(this : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.register.call(this)
  end
  def deregister(this : IWdsTransportNamespace*, bterminatesessions : Int16) : HRESULT
    @lpVtbl.value.deregister.call(this, bterminatesessions)
  end
  def clone(this : IWdsTransportNamespace*, ppwdstransportnamespaceclone : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.clone.call(this, ppwdstransportnamespaceclone)
  end
  def refresh(this : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def retrieve_contents(this : IWdsTransportNamespace*, ppwdstransportcontents : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_contents.call(this, ppwdstransportcontents)
  end
end
struct LibWin32::IWdsTransportNamespaceAutoCast
  def query_interface(this : IWdsTransportNamespaceAutoCast*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportNamespaceAutoCast*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportNamespaceAutoCast*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportNamespaceAutoCast*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportNamespaceAutoCast*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportNamespaceAutoCast*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportNamespaceAutoCast*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IWdsTransportNamespaceAutoCast*, ptype : WDSTRANSPORT_NAMESPACE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IWdsTransportNamespaceAutoCast*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_name(this : IWdsTransportNamespaceAutoCast*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def put_name(this : IWdsTransportNamespaceAutoCast*, bszname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bszname)
  end
  def get_friendly_name(this : IWdsTransportNamespaceAutoCast*, pbszfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbszfriendlyname)
  end
  def put_friendly_name(this : IWdsTransportNamespaceAutoCast*, bszfriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.put_friendly_name.call(this, bszfriendlyname)
  end
  def get_description(this : IWdsTransportNamespaceAutoCast*, pbszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbszdescription)
  end
  def put_description(this : IWdsTransportNamespaceAutoCast*, bszdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bszdescription)
  end
  def get_content_provider(this : IWdsTransportNamespaceAutoCast*, pbszcontentprovider : UInt8**) : HRESULT
    @lpVtbl.value.get_content_provider.call(this, pbszcontentprovider)
  end
  def put_content_provider(this : IWdsTransportNamespaceAutoCast*, bszcontentprovider : UInt8*) : HRESULT
    @lpVtbl.value.put_content_provider.call(this, bszcontentprovider)
  end
  def get_configuration(this : IWdsTransportNamespaceAutoCast*, pbszconfiguration : UInt8**) : HRESULT
    @lpVtbl.value.get_configuration.call(this, pbszconfiguration)
  end
  def put_configuration(this : IWdsTransportNamespaceAutoCast*, bszconfiguration : UInt8*) : HRESULT
    @lpVtbl.value.put_configuration.call(this, bszconfiguration)
  end
  def get_registered(this : IWdsTransportNamespaceAutoCast*, pbregistered : Int16*) : HRESULT
    @lpVtbl.value.get_registered.call(this, pbregistered)
  end
  def get_tombstoned(this : IWdsTransportNamespaceAutoCast*, pbtombstoned : Int16*) : HRESULT
    @lpVtbl.value.get_tombstoned.call(this, pbtombstoned)
  end
  def get_tombstone_time(this : IWdsTransportNamespaceAutoCast*, ptombstonetime : Float64*) : HRESULT
    @lpVtbl.value.get_tombstone_time.call(this, ptombstonetime)
  end
  def get_transmission_started(this : IWdsTransportNamespaceAutoCast*, pbtransmissionstarted : Int16*) : HRESULT
    @lpVtbl.value.get_transmission_started.call(this, pbtransmissionstarted)
  end
  def register(this : IWdsTransportNamespaceAutoCast*) : HRESULT
    @lpVtbl.value.register.call(this)
  end
  def deregister(this : IWdsTransportNamespaceAutoCast*, bterminatesessions : Int16) : HRESULT
    @lpVtbl.value.deregister.call(this, bterminatesessions)
  end
  def clone(this : IWdsTransportNamespaceAutoCast*, ppwdstransportnamespaceclone : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.clone.call(this, ppwdstransportnamespaceclone)
  end
  def refresh(this : IWdsTransportNamespaceAutoCast*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def retrieve_contents(this : IWdsTransportNamespaceAutoCast*, ppwdstransportcontents : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_contents.call(this, ppwdstransportcontents)
  end
end
struct LibWin32::IWdsTransportNamespaceScheduledCast
  def query_interface(this : IWdsTransportNamespaceScheduledCast*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportNamespaceScheduledCast*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportNamespaceScheduledCast*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportNamespaceScheduledCast*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportNamespaceScheduledCast*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportNamespaceScheduledCast*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportNamespaceScheduledCast*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IWdsTransportNamespaceScheduledCast*, ptype : WDSTRANSPORT_NAMESPACE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IWdsTransportNamespaceScheduledCast*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_name(this : IWdsTransportNamespaceScheduledCast*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def put_name(this : IWdsTransportNamespaceScheduledCast*, bszname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bszname)
  end
  def get_friendly_name(this : IWdsTransportNamespaceScheduledCast*, pbszfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbszfriendlyname)
  end
  def put_friendly_name(this : IWdsTransportNamespaceScheduledCast*, bszfriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.put_friendly_name.call(this, bszfriendlyname)
  end
  def get_description(this : IWdsTransportNamespaceScheduledCast*, pbszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbszdescription)
  end
  def put_description(this : IWdsTransportNamespaceScheduledCast*, bszdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bszdescription)
  end
  def get_content_provider(this : IWdsTransportNamespaceScheduledCast*, pbszcontentprovider : UInt8**) : HRESULT
    @lpVtbl.value.get_content_provider.call(this, pbszcontentprovider)
  end
  def put_content_provider(this : IWdsTransportNamespaceScheduledCast*, bszcontentprovider : UInt8*) : HRESULT
    @lpVtbl.value.put_content_provider.call(this, bszcontentprovider)
  end
  def get_configuration(this : IWdsTransportNamespaceScheduledCast*, pbszconfiguration : UInt8**) : HRESULT
    @lpVtbl.value.get_configuration.call(this, pbszconfiguration)
  end
  def put_configuration(this : IWdsTransportNamespaceScheduledCast*, bszconfiguration : UInt8*) : HRESULT
    @lpVtbl.value.put_configuration.call(this, bszconfiguration)
  end
  def get_registered(this : IWdsTransportNamespaceScheduledCast*, pbregistered : Int16*) : HRESULT
    @lpVtbl.value.get_registered.call(this, pbregistered)
  end
  def get_tombstoned(this : IWdsTransportNamespaceScheduledCast*, pbtombstoned : Int16*) : HRESULT
    @lpVtbl.value.get_tombstoned.call(this, pbtombstoned)
  end
  def get_tombstone_time(this : IWdsTransportNamespaceScheduledCast*, ptombstonetime : Float64*) : HRESULT
    @lpVtbl.value.get_tombstone_time.call(this, ptombstonetime)
  end
  def get_transmission_started(this : IWdsTransportNamespaceScheduledCast*, pbtransmissionstarted : Int16*) : HRESULT
    @lpVtbl.value.get_transmission_started.call(this, pbtransmissionstarted)
  end
  def register(this : IWdsTransportNamespaceScheduledCast*) : HRESULT
    @lpVtbl.value.register.call(this)
  end
  def deregister(this : IWdsTransportNamespaceScheduledCast*, bterminatesessions : Int16) : HRESULT
    @lpVtbl.value.deregister.call(this, bterminatesessions)
  end
  def clone(this : IWdsTransportNamespaceScheduledCast*, ppwdstransportnamespaceclone : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.clone.call(this, ppwdstransportnamespaceclone)
  end
  def refresh(this : IWdsTransportNamespaceScheduledCast*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def retrieve_contents(this : IWdsTransportNamespaceScheduledCast*, ppwdstransportcontents : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_contents.call(this, ppwdstransportcontents)
  end
  def start_transmission(this : IWdsTransportNamespaceScheduledCast*) : HRESULT
    @lpVtbl.value.start_transmission.call(this)
  end
end
struct LibWin32::IWdsTransportNamespaceScheduledCastManualStart
  def query_interface(this : IWdsTransportNamespaceScheduledCastManualStart*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportNamespaceScheduledCastManualStart*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportNamespaceScheduledCastManualStart*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportNamespaceScheduledCastManualStart*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportNamespaceScheduledCastManualStart*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportNamespaceScheduledCastManualStart*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportNamespaceScheduledCastManualStart*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IWdsTransportNamespaceScheduledCastManualStart*, ptype : WDSTRANSPORT_NAMESPACE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IWdsTransportNamespaceScheduledCastManualStart*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_name(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def put_name(this : IWdsTransportNamespaceScheduledCastManualStart*, bszname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bszname)
  end
  def get_friendly_name(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbszfriendlyname)
  end
  def put_friendly_name(this : IWdsTransportNamespaceScheduledCastManualStart*, bszfriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.put_friendly_name.call(this, bszfriendlyname)
  end
  def get_description(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbszdescription)
  end
  def put_description(this : IWdsTransportNamespaceScheduledCastManualStart*, bszdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bszdescription)
  end
  def get_content_provider(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszcontentprovider : UInt8**) : HRESULT
    @lpVtbl.value.get_content_provider.call(this, pbszcontentprovider)
  end
  def put_content_provider(this : IWdsTransportNamespaceScheduledCastManualStart*, bszcontentprovider : UInt8*) : HRESULT
    @lpVtbl.value.put_content_provider.call(this, bszcontentprovider)
  end
  def get_configuration(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszconfiguration : UInt8**) : HRESULT
    @lpVtbl.value.get_configuration.call(this, pbszconfiguration)
  end
  def put_configuration(this : IWdsTransportNamespaceScheduledCastManualStart*, bszconfiguration : UInt8*) : HRESULT
    @lpVtbl.value.put_configuration.call(this, bszconfiguration)
  end
  def get_registered(this : IWdsTransportNamespaceScheduledCastManualStart*, pbregistered : Int16*) : HRESULT
    @lpVtbl.value.get_registered.call(this, pbregistered)
  end
  def get_tombstoned(this : IWdsTransportNamespaceScheduledCastManualStart*, pbtombstoned : Int16*) : HRESULT
    @lpVtbl.value.get_tombstoned.call(this, pbtombstoned)
  end
  def get_tombstone_time(this : IWdsTransportNamespaceScheduledCastManualStart*, ptombstonetime : Float64*) : HRESULT
    @lpVtbl.value.get_tombstone_time.call(this, ptombstonetime)
  end
  def get_transmission_started(this : IWdsTransportNamespaceScheduledCastManualStart*, pbtransmissionstarted : Int16*) : HRESULT
    @lpVtbl.value.get_transmission_started.call(this, pbtransmissionstarted)
  end
  def register(this : IWdsTransportNamespaceScheduledCastManualStart*) : HRESULT
    @lpVtbl.value.register.call(this)
  end
  def deregister(this : IWdsTransportNamespaceScheduledCastManualStart*, bterminatesessions : Int16) : HRESULT
    @lpVtbl.value.deregister.call(this, bterminatesessions)
  end
  def clone(this : IWdsTransportNamespaceScheduledCastManualStart*, ppwdstransportnamespaceclone : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.clone.call(this, ppwdstransportnamespaceclone)
  end
  def refresh(this : IWdsTransportNamespaceScheduledCastManualStart*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def retrieve_contents(this : IWdsTransportNamespaceScheduledCastManualStart*, ppwdstransportcontents : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_contents.call(this, ppwdstransportcontents)
  end
  def start_transmission(this : IWdsTransportNamespaceScheduledCastManualStart*) : HRESULT
    @lpVtbl.value.start_transmission.call(this)
  end
end
struct LibWin32::IWdsTransportNamespaceScheduledCastAutoStart
  def query_interface(this : IWdsTransportNamespaceScheduledCastAutoStart*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportNamespaceScheduledCastAutoStart*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportNamespaceScheduledCastAutoStart*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportNamespaceScheduledCastAutoStart*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportNamespaceScheduledCastAutoStart*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportNamespaceScheduledCastAutoStart*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportNamespaceScheduledCastAutoStart*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IWdsTransportNamespaceScheduledCastAutoStart*, ptype : WDSTRANSPORT_NAMESPACE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IWdsTransportNamespaceScheduledCastAutoStart*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_name(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def put_name(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bszname)
  end
  def get_friendly_name(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbszfriendlyname)
  end
  def put_friendly_name(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszfriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.put_friendly_name.call(this, bszfriendlyname)
  end
  def get_description(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbszdescription)
  end
  def put_description(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bszdescription)
  end
  def get_content_provider(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszcontentprovider : UInt8**) : HRESULT
    @lpVtbl.value.get_content_provider.call(this, pbszcontentprovider)
  end
  def put_content_provider(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszcontentprovider : UInt8*) : HRESULT
    @lpVtbl.value.put_content_provider.call(this, bszcontentprovider)
  end
  def get_configuration(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszconfiguration : UInt8**) : HRESULT
    @lpVtbl.value.get_configuration.call(this, pbszconfiguration)
  end
  def put_configuration(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszconfiguration : UInt8*) : HRESULT
    @lpVtbl.value.put_configuration.call(this, bszconfiguration)
  end
  def get_registered(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbregistered : Int16*) : HRESULT
    @lpVtbl.value.get_registered.call(this, pbregistered)
  end
  def get_tombstoned(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbtombstoned : Int16*) : HRESULT
    @lpVtbl.value.get_tombstoned.call(this, pbtombstoned)
  end
  def get_tombstone_time(this : IWdsTransportNamespaceScheduledCastAutoStart*, ptombstonetime : Float64*) : HRESULT
    @lpVtbl.value.get_tombstone_time.call(this, ptombstonetime)
  end
  def get_transmission_started(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbtransmissionstarted : Int16*) : HRESULT
    @lpVtbl.value.get_transmission_started.call(this, pbtransmissionstarted)
  end
  def register(this : IWdsTransportNamespaceScheduledCastAutoStart*) : HRESULT
    @lpVtbl.value.register.call(this)
  end
  def deregister(this : IWdsTransportNamespaceScheduledCastAutoStart*, bterminatesessions : Int16) : HRESULT
    @lpVtbl.value.deregister.call(this, bterminatesessions)
  end
  def clone(this : IWdsTransportNamespaceScheduledCastAutoStart*, ppwdstransportnamespaceclone : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.clone.call(this, ppwdstransportnamespaceclone)
  end
  def refresh(this : IWdsTransportNamespaceScheduledCastAutoStart*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def retrieve_contents(this : IWdsTransportNamespaceScheduledCastAutoStart*, ppwdstransportcontents : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_contents.call(this, ppwdstransportcontents)
  end
  def start_transmission(this : IWdsTransportNamespaceScheduledCastAutoStart*) : HRESULT
    @lpVtbl.value.start_transmission.call(this)
  end
  def get_minimum_clients(this : IWdsTransportNamespaceScheduledCastAutoStart*, pulminimumclients : UInt32*) : HRESULT
    @lpVtbl.value.get_minimum_clients.call(this, pulminimumclients)
  end
  def put_minimum_clients(this : IWdsTransportNamespaceScheduledCastAutoStart*, ulminimumclients : UInt32) : HRESULT
    @lpVtbl.value.put_minimum_clients.call(this, ulminimumclients)
  end
  def get_start_time(this : IWdsTransportNamespaceScheduledCastAutoStart*, pstarttime : Float64*) : HRESULT
    @lpVtbl.value.get_start_time.call(this, pstarttime)
  end
  def put_start_time(this : IWdsTransportNamespaceScheduledCastAutoStart*, starttime : Float64) : HRESULT
    @lpVtbl.value.put_start_time.call(this, starttime)
  end
end
struct LibWin32::IWdsTransportContent
  def query_interface(this : IWdsTransportContent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportContent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportContent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportContent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportContent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportContent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportContent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_namespace(this : IWdsTransportContent*, ppwdstransportnamespace : IWdsTransportNamespace*) : HRESULT
    @lpVtbl.value.get_namespace.call(this, ppwdstransportnamespace)
  end
  def get_id(this : IWdsTransportContent*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_name(this : IWdsTransportContent*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def retrieve_sessions(this : IWdsTransportContent*, ppwdstransportsessions : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_sessions.call(this, ppwdstransportsessions)
  end
  def terminate(this : IWdsTransportContent*) : HRESULT
    @lpVtbl.value.terminate.call(this)
  end
end
struct LibWin32::IWdsTransportSession
  def query_interface(this : IWdsTransportSession*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportSession*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportSession*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportSession*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportSession*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportSession*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportSession*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_content(this : IWdsTransportSession*, ppwdstransportcontent : IWdsTransportContent*) : HRESULT
    @lpVtbl.value.get_content.call(this, ppwdstransportcontent)
  end
  def get_id(this : IWdsTransportSession*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_network_interface_name(this : IWdsTransportSession*, pbsznetworkinterfacename : UInt8**) : HRESULT
    @lpVtbl.value.get_network_interface_name.call(this, pbsznetworkinterfacename)
  end
  def get_network_interface_address(this : IWdsTransportSession*, pbsznetworkinterfaceaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_network_interface_address.call(this, pbsznetworkinterfaceaddress)
  end
  def get_transfer_rate(this : IWdsTransportSession*, pultransferrate : UInt32*) : HRESULT
    @lpVtbl.value.get_transfer_rate.call(this, pultransferrate)
  end
  def get_master_client_id(this : IWdsTransportSession*, pulmasterclientid : UInt32*) : HRESULT
    @lpVtbl.value.get_master_client_id.call(this, pulmasterclientid)
  end
  def retrieve_clients(this : IWdsTransportSession*, ppwdstransportclients : IWdsTransportCollection*) : HRESULT
    @lpVtbl.value.retrieve_clients.call(this, ppwdstransportclients)
  end
  def terminate(this : IWdsTransportSession*) : HRESULT
    @lpVtbl.value.terminate.call(this)
  end
end
struct LibWin32::IWdsTransportClient
  def query_interface(this : IWdsTransportClient*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportClient*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportClient*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportClient*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportClient*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportClient*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportClient*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IWdsTransportClient*, ppwdstransportsession : IWdsTransportSession*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppwdstransportsession)
  end
  def get_id(this : IWdsTransportClient*, pulid : UInt32*) : HRESULT
    @lpVtbl.value.get_id.call(this, pulid)
  end
  def get_name(this : IWdsTransportClient*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def get_mac_address(this : IWdsTransportClient*, pbszmacaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_mac_address.call(this, pbszmacaddress)
  end
  def get_ip_address(this : IWdsTransportClient*, pbszipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_ip_address.call(this, pbszipaddress)
  end
  def get_percent_completion(this : IWdsTransportClient*, pulpercentcompletion : UInt32*) : HRESULT
    @lpVtbl.value.get_percent_completion.call(this, pulpercentcompletion)
  end
  def get_join_duration(this : IWdsTransportClient*, puljoinduration : UInt32*) : HRESULT
    @lpVtbl.value.get_join_duration.call(this, puljoinduration)
  end
  def get_cpu_utilization(this : IWdsTransportClient*, pulcpuutilization : UInt32*) : HRESULT
    @lpVtbl.value.get_cpu_utilization.call(this, pulcpuutilization)
  end
  def get_memory_utilization(this : IWdsTransportClient*, pulmemoryutilization : UInt32*) : HRESULT
    @lpVtbl.value.get_memory_utilization.call(this, pulmemoryutilization)
  end
  def get_network_utilization(this : IWdsTransportClient*, pulnetworkutilization : UInt32*) : HRESULT
    @lpVtbl.value.get_network_utilization.call(this, pulnetworkutilization)
  end
  def get_user_identity(this : IWdsTransportClient*, pbszuseridentity : UInt8**) : HRESULT
    @lpVtbl.value.get_user_identity.call(this, pbszuseridentity)
  end
  def disconnect(this : IWdsTransportClient*, disconnectiontype : WDSTRANSPORT_DISCONNECT_TYPE) : HRESULT
    @lpVtbl.value.disconnect.call(this, disconnectiontype)
  end
end
struct LibWin32::IWdsTransportTftpClient
  def query_interface(this : IWdsTransportTftpClient*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportTftpClient*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportTftpClient*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportTftpClient*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportTftpClient*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportTftpClient*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportTftpClient*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_file_name(this : IWdsTransportTftpClient*, pbszfilename : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name.call(this, pbszfilename)
  end
  def get_ip_address(this : IWdsTransportTftpClient*, pbszipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_ip_address.call(this, pbszipaddress)
  end
  def get_timeout(this : IWdsTransportTftpClient*, pultimeout : UInt32*) : HRESULT
    @lpVtbl.value.get_timeout.call(this, pultimeout)
  end
  def get_current_file_offset(this : IWdsTransportTftpClient*, pul64currentoffset : UInt64*) : HRESULT
    @lpVtbl.value.get_current_file_offset.call(this, pul64currentoffset)
  end
  def get_file_size(this : IWdsTransportTftpClient*, pul64filesize : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, pul64filesize)
  end
  def get_block_size(this : IWdsTransportTftpClient*, pulblocksize : UInt32*) : HRESULT
    @lpVtbl.value.get_block_size.call(this, pulblocksize)
  end
  def get_window_size(this : IWdsTransportTftpClient*, pulwindowsize : UInt32*) : HRESULT
    @lpVtbl.value.get_window_size.call(this, pulwindowsize)
  end
end
struct LibWin32::IWdsTransportContentProvider
  def query_interface(this : IWdsTransportContentProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWdsTransportContentProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWdsTransportContentProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWdsTransportContentProvider*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWdsTransportContentProvider*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWdsTransportContentProvider*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWdsTransportContentProvider*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IWdsTransportContentProvider*, pbszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbszname)
  end
  def get_description(this : IWdsTransportContentProvider*, pbszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbszdescription)
  end
  def get_file_path(this : IWdsTransportContentProvider*, pbszfilepath : UInt8**) : HRESULT
    @lpVtbl.value.get_file_path.call(this, pbszfilepath)
  end
  def get_initialization_routine(this : IWdsTransportContentProvider*, pbszinitializationroutine : UInt8**) : HRESULT
    @lpVtbl.value.get_initialization_routine.call(this, pbszinitializationroutine)
  end
end
