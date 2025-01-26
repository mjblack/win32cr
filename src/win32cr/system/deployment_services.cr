require "./../foundation.cr"
require "./registry.cr"
require "./com.cr"

module Win32cr::System::DeploymentServices
  alias PFN_WdsCliTraceFunction = Proc(Win32cr::Foundation::PWSTR, Int8*, Void)

  alias PFN_WdsCliCallback = Proc(Win32cr::System::DeploymentServices::PFN_WDS_CLI_CALLBACK_MESSAGE_ID, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Void*, Void)

  alias PFN_WdsTransportClientSessionStart = Proc(Win32cr::Foundation::HANDLE, Void*, Win32cr::Foundation::ULARGE_INTEGER*, Void)

  alias PFN_WdsTransportClientSessionStartEx = Proc(Win32cr::Foundation::HANDLE, Void*, Win32cr::System::DeploymentServices::TRANSPORTCLIENT_SESSION_INFO*, Void)

  alias PFN_WdsTransportClientReceiveMetadata = Proc(Win32cr::Foundation::HANDLE, Void*, Void*, UInt32, Void)

  alias PFN_WdsTransportClientReceiveContents = Proc(Win32cr::Foundation::HANDLE, Void*, Void*, UInt32, Win32cr::Foundation::ULARGE_INTEGER*, Void)

  alias PFN_WdsTransportClientSessionComplete = Proc(Win32cr::Foundation::HANDLE, Void*, UInt32, Void)

  alias PFN_WdsTransportClientSessionNegotiate = Proc(Win32cr::Foundation::HANDLE, Void*, Win32cr::System::DeploymentServices::TRANSPORTCLIENT_SESSION_INFO*, Win32cr::Foundation::HANDLE, Void)

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

  enum CPU_ARCHITECTURE : UInt32
    CPU_ARCHITECTURE_AMD64 = 9_u32
    CPU_ARCHITECTURE_IA64 = 6_u32
    CPU_ARCHITECTURE_INTEL = 0_u32
  end
  enum PFN_WDS_CLI_CALLBACK_MESSAGE_ID : UInt32
    WDS_CLI_MSG_START = 0_u32
    WDS_CLI_MSG_COMPLETE = 1_u32
    WDS_CLI_MSG_PROGRESS = 2_u32
    WDS_CLI_MSG_TEXT = 3_u32
  end
  enum WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL : UInt32
    WDS_TRANSPORTCLIENT_AUTH = 1_u32
    WDS_TRANSPORTCLIENT_NO_AUTH = 2_u32
  end
  enum WDS_CLI_IMAGE_TYPE
    WDS_CLI_IMAGE_TYPE_UNKNOWN = 0_i32
    WDS_CLI_IMAGE_TYPE_WIM = 1_i32
    WDS_CLI_IMAGE_TYPE_VHD = 2_i32
    WDS_CLI_IMAGE_TYPE_VHDX = 3_i32
  end
  enum WDS_CLI_FIRMWARE_TYPE
    WDS_CLI_FIRMWARE_UNKNOWN = 0_i32
    WDS_CLI_FIRMWARE_BIOS = 1_i32
    WDS_CLI_FIRMWARE_EFI = 2_i32
  end
  enum WDS_CLI_IMAGE_PARAM_TYPE
    WDS_CLI_IMAGE_PARAM_UNKNOWN = 0_i32
    WDS_CLI_IMAGE_PARAM_SPARSE_FILE = 1_i32
    WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES = 2_i32
  end
  enum TRANSPORTPROVIDER_CALLBACK_ID
    WDS_TRANSPORTPROVIDER_CREATE_INSTANCE = 0_i32
    WDS_TRANSPORTPROVIDER_COMPARE_CONTENT = 1_i32
    WDS_TRANSPORTPROVIDER_OPEN_CONTENT = 2_i32
    WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK = 3_i32
    WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE = 4_i32
    WDS_TRANSPORTPROVIDER_READ_CONTENT = 5_i32
    WDS_TRANSPORTPROVIDER_CLOSE_CONTENT = 6_i32
    WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE = 7_i32
    WDS_TRANSPORTPROVIDER_SHUTDOWN = 8_i32
    WDS_TRANSPORTPROVIDER_DUMP_STATE = 9_i32
    WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS = 10_i32
    WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA = 11_i32
    WDS_TRANSPORTPROVIDER_MAX_CALLBACKS = 12_i32
  end
  enum TRANSPORTCLIENT_CALLBACK_ID
    WDS_TRANSPORTCLIENT_SESSION_START = 0_i32
    WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS = 1_i32
    WDS_TRANSPORTCLIENT_SESSION_COMPLETE = 2_i32
    WDS_TRANSPORTCLIENT_RECEIVE_METADATA = 3_i32
    WDS_TRANSPORTCLIENT_SESSION_STARTEX = 4_i32
    WDS_TRANSPORTCLIENT_SESSION_NEGOTIATE = 5_i32
    WDS_TRANSPORTCLIENT_MAX_CALLBACKS = 6_i32
  end
  enum WDSTRANSPORT_FEATURE_FLAGS
    WdsTptFeatureAdminPack = 1_i32
    WdsTptFeatureTransportServer = 2_i32
    WdsTptFeatureDeploymentServer = 4_i32
  end
  enum WDSTRANSPORT_PROTOCOL_FLAGS
    WdsTptProtocolUnicast = 1_i32
    WdsTptProtocolMulticast = 2_i32
  end
  enum WDSTRANSPORT_NAMESPACE_TYPE
    WdsTptNamespaceTypeUnknown = 0_i32
    WdsTptNamespaceTypeAutoCast = 1_i32
    WdsTptNamespaceTypeScheduledCastManualStart = 2_i32
    WdsTptNamespaceTypeScheduledCastAutoStart = 3_i32
  end
  enum WDSTRANSPORT_DISCONNECT_TYPE
    WdsTptDisconnectUnknown = 0_i32
    WdsTptDisconnectFallback = 1_i32
    WdsTptDisconnectAbort = 2_i32
  end
  enum WDSTRANSPORT_SERVICE_NOTIFICATION
    WdsTptServiceNotifyUnknown = 0_i32
    WdsTptServiceNotifyReadSettings = 1_i32
  end
  enum WDSTRANSPORT_IP_ADDRESS_TYPE
    WdsTptIpAddressUnknown = 0_i32
    WdsTptIpAddressIpv4 = 1_i32
    WdsTptIpAddressIpv6 = 2_i32
  end
  enum WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE
    WdsTptIpAddressSourceUnknown = 0_i32
    WdsTptIpAddressSourceDhcp = 1_i32
    WdsTptIpAddressSourceRange = 2_i32
  end
  enum WDSTRANSPORT_NETWORK_PROFILE_TYPE
    WdsTptNetworkProfileUnknown = 0_i32
    WdsTptNetworkProfileCustom = 1_i32
    WdsTptNetworkProfile10Mbps = 2_i32
    WdsTptNetworkProfile100Mbps = 3_i32
    WdsTptNetworkProfile1Gbps = 4_i32
  end
  enum WDSTRANSPORT_DIAGNOSTICS_COMPONENT_FLAGS
    WdsTptDiagnosticsComponentPxe = 1_i32
    WdsTptDiagnosticsComponentTftp = 2_i32
    WdsTptDiagnosticsComponentImageServer = 4_i32
    WdsTptDiagnosticsComponentMulticast = 8_i32
  end
  enum WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE
    WdsTptSlowClientHandlingUnknown = 0_i32
    WdsTptSlowClientHandlingNone = 1_i32
    WdsTptSlowClientHandlingAutoDisconnect = 2_i32
    WdsTptSlowClientHandlingMultistream = 3_i32
  end
  enum WDSTRANSPORT_UDP_PORT_POLICY
    WdsTptUdpPortPolicyDynamic = 0_i32
    WdsTptUdpPortPolicyFixed = 1_i32
  end
  enum WDSTRANSPORT_TFTP_CAPABILITY
    WdsTptTftpCapMaximumBlockSize = 1_i32
    WdsTptTftpCapVariableWindow = 2_i32
  end

  @[Extern]
  struct WDS_CLI_CRED
    property pwszUserName : Win32cr::Foundation::PWSTR
    property pwszDomain : Win32cr::Foundation::PWSTR
    property pwszPassword : Win32cr::Foundation::PWSTR
    def initialize(@pwszUserName : Win32cr::Foundation::PWSTR, @pwszDomain : Win32cr::Foundation::PWSTR, @pwszPassword : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PXE_DHCP_OPTION
    property option_type : UInt8
    property option_length : UInt8
    property option_value : UInt8*
    def initialize(@option_type : UInt8, @option_length : UInt8, @option_value : UInt8*)
    end
  end

  @[Extern]
  struct PXE_DHCP_MESSAGE
    property operation : UInt8
    property hardware_address_type : UInt8
    property hardware_address_length : UInt8
    property hop_count : UInt8
    property transaction_id : UInt32
    property seconds_since_boot : UInt16
    property reserved : UInt16
    property client_ip_address : UInt32
    property your_ip_address : UInt32
    property bootstrap_server_address : UInt32
    property relay_agent_ip_address : UInt32
    property hardware_address : UInt8[16]
    property host_name : UInt8[64]
    property boot_file_name : UInt8[128]
    property anonymous : Anonymous_e__Union_
    property option : Win32cr::System::DeploymentServices::PXE_DHCP_OPTION

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property bMagicCookie : UInt8[4]
    property uMagicCookie : UInt32
    def initialize(@bMagicCookie : UInt8[4], @uMagicCookie : UInt32)
    end
    end

    def initialize(@operation : UInt8, @hardware_address_type : UInt8, @hardware_address_length : UInt8, @hop_count : UInt8, @transaction_id : UInt32, @seconds_since_boot : UInt16, @reserved : UInt16, @client_ip_address : UInt32, @your_ip_address : UInt32, @bootstrap_server_address : UInt32, @relay_agent_ip_address : UInt32, @hardware_address : UInt8[16], @host_name : UInt8[64], @boot_file_name : UInt8[128], @anonymous : Anonymous_e__Union_, @option : Win32cr::System::DeploymentServices::PXE_DHCP_OPTION)
    end
  end

  @[Extern]
  struct PXE_DHCPV6_OPTION
    property option_code : UInt16
    property data_length : UInt16
    property data : UInt8*
    def initialize(@option_code : UInt16, @data_length : UInt16, @data : UInt8*)
    end
  end

  @[Extern]
  struct PXE_DHCPV6_MESSAGE_HEADER
    property message_type : UInt8
    property message : UInt8*
    def initialize(@message_type : UInt8, @message : UInt8*)
    end
  end

  @[Extern]
  struct PXE_DHCPV6_MESSAGE
    property message_type : UInt8
    property transaction_id_byte1 : UInt8
    property transaction_id_byte2 : UInt8
    property transaction_id_byte3 : UInt8
    property options : Win32cr::System::DeploymentServices::PXE_DHCPV6_OPTION*
    def initialize(@message_type : UInt8, @transaction_id_byte1 : UInt8, @transaction_id_byte2 : UInt8, @transaction_id_byte3 : UInt8, @options : Win32cr::System::DeploymentServices::PXE_DHCPV6_OPTION*)
    end
  end

  @[Extern]
  struct PXE_DHCPV6_RELAY_MESSAGE
    property message_type : UInt8
    property hop_count : UInt8
    property link_address : UInt8[16]
    property peer_address : UInt8[16]
    property options : Win32cr::System::DeploymentServices::PXE_DHCPV6_OPTION*
    def initialize(@message_type : UInt8, @hop_count : UInt8, @link_address : UInt8[16], @peer_address : UInt8[16], @options : Win32cr::System::DeploymentServices::PXE_DHCPV6_OPTION*)
    end
  end

  @[Extern]
  struct PXE_PROVIDER
    property uSizeOfStruct : UInt32
    property pwszName : Win32cr::Foundation::PWSTR
    property pwszFilePath : Win32cr::Foundation::PWSTR
    property bIsCritical : Win32cr::Foundation::BOOL
    property uIndex : UInt32
    def initialize(@uSizeOfStruct : UInt32, @pwszName : Win32cr::Foundation::PWSTR, @pwszFilePath : Win32cr::Foundation::PWSTR, @bIsCritical : Win32cr::Foundation::BOOL, @uIndex : UInt32)
    end
  end

  @[Extern]
  struct PXE_ADDRESS
    property uFlags : UInt32
    property anonymous : Anonymous_e__Union_
    property uAddrLen : UInt32
    property uPort : UInt16

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property bAddress : UInt8[16]
    property uIpAddress : UInt32
    def initialize(@bAddress : UInt8[16], @uIpAddress : UInt32)
    end
    end

    def initialize(@uFlags : UInt32, @anonymous : Anonymous_e__Union_, @uAddrLen : UInt32, @uPort : UInt16)
    end
  end

  @[Extern]
  struct PXE_DHCPV6_NESTED_RELAY_MESSAGE
    property pRelayMessage : Win32cr::System::DeploymentServices::PXE_DHCPV6_RELAY_MESSAGE*
    property cbRelayMessage : UInt32
    property pInterfaceIdOption : Void*
    property cbInterfaceIdOption : UInt16
    def initialize(@pRelayMessage : Win32cr::System::DeploymentServices::PXE_DHCPV6_RELAY_MESSAGE*, @cbRelayMessage : UInt32, @pInterfaceIdOption : Void*, @cbInterfaceIdOption : UInt16)
    end
  end

  @[Extern]
  struct WDS_TRANSPORTPROVIDER_INIT_PARAMS
    property ulLength : UInt32
    property ulMcServerVersion : UInt32
    property hRegistryKey : Win32cr::System::Registry::HKEY
    property hProvider : Win32cr::Foundation::HANDLE
    def initialize(@ulLength : UInt32, @ulMcServerVersion : UInt32, @hRegistryKey : Win32cr::System::Registry::HKEY, @hProvider : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct WDS_TRANSPORTPROVIDER_SETTINGS
    property ulLength : UInt32
    property ulProviderVersion : UInt32
    def initialize(@ulLength : UInt32, @ulProviderVersion : UInt32)
    end
  end

  @[Extern]
  struct TRANSPORTCLIENT_SESSION_INFO
    property ulStructureLength : UInt32
    property ullFileSize : Win32cr::Foundation::ULARGE_INTEGER
    property ulBlockSize : UInt32
    def initialize(@ulStructureLength : UInt32, @ullFileSize : Win32cr::Foundation::ULARGE_INTEGER, @ulBlockSize : UInt32)
    end
  end

  @[Extern]
  struct WDS_TRANSPORTCLIENT_REQUEST
    property ulLength : UInt32
    property ulApiVersion : UInt32
    property ulAuthLevel : Win32cr::System::DeploymentServices::WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL
    property pwszServer : Win32cr::Foundation::PWSTR
    property pwszNamespace : Win32cr::Foundation::PWSTR
    property pwszObjectName : Win32cr::Foundation::PWSTR
    property ulCacheSize : UInt32
    property ulProtocol : UInt32
    property pvProtocolData : Void*
    property ulProtocolDataLength : UInt32
    def initialize(@ulLength : UInt32, @ulApiVersion : UInt32, @ulAuthLevel : Win32cr::System::DeploymentServices::WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL, @pwszServer : Win32cr::Foundation::PWSTR, @pwszNamespace : Win32cr::Foundation::PWSTR, @pwszObjectName : Win32cr::Foundation::PWSTR, @ulCacheSize : UInt32, @ulProtocol : UInt32, @pvProtocolData : Void*, @ulProtocolDataLength : UInt32)
    end
  end

  @[Extern]
  struct WDS_TRANSPORTCLIENT_CALLBACKS
    property session_start : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionStart
    property session_start_ex : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionStartEx
    property receive_contents : Win32cr::System::DeploymentServices::PFN_WdsTransportClientReceiveContents
    property receive_metadata : Win32cr::System::DeploymentServices::PFN_WdsTransportClientReceiveMetadata
    property session_complete : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionComplete
    property session_negotiate : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionNegotiate
    def initialize(@session_start : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionStart, @session_start_ex : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionStartEx, @receive_contents : Win32cr::System::DeploymentServices::PFN_WdsTransportClientReceiveContents, @receive_metadata : Win32cr::System::DeploymentServices::PFN_WdsTransportClientReceiveMetadata, @session_complete : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionComplete, @session_negotiate : Win32cr::System::DeploymentServices::PFN_WdsTransportClientSessionNegotiate)
    end
  end

  @[Extern]
  record IWdsTransportCacheableVtbl,
    query_interface : Proc(IWdsTransportCacheable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportCacheable*, UInt32),
    release : Proc(IWdsTransportCacheable*, UInt32),
    get_type_info_count : Proc(IWdsTransportCacheable*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportCacheable*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportCacheable*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportCacheable*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Dirty : Proc(IWdsTransportCacheable*, Int16*, Win32cr::Foundation::HRESULT),
    discard : Proc(IWdsTransportCacheable*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportCacheable*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWdsTransportCacheable*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportCacheable, lpVtbl : IWdsTransportCacheableVtbl* do
    GUID = LibC::GUID.new(0x46ad894b_u32, 0xbab_u16, 0x47dc_u16, StaticArray[0x84_u8, 0xb2_u8, 0x7b_u8, 0x55_u8, 0x3f_u8, 0x1d_u8, 0x8f_u8, 0x80_u8])
    def query_interface(this : IWdsTransportCacheable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportCacheable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportCacheable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportCacheable*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportCacheable*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportCacheable*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportCacheable*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Dirty(this : IWdsTransportCacheable*, pbDirty : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dirty.call(this, pbDirty)
    end
    def discard(this : IWdsTransportCacheable*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this)
    end
    def refresh(this : IWdsTransportCacheable*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def commit(this : IWdsTransportCacheable*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end

  end

  @[Extern]
  record IWdsTransportCollectionVtbl,
    query_interface : Proc(IWdsTransportCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportCollection*, UInt32),
    release : Proc(IWdsTransportCollection*, UInt32),
    get_type_info_count : Proc(IWdsTransportCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IWdsTransportCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IWdsTransportCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IWdsTransportCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportCollection, lpVtbl : IWdsTransportCollectionVtbl* do
    GUID = LibC::GUID.new(0xb8ba4b1a_u32, 0x2ff4_u16, 0x43ab_u16, StaticArray[0x99_u8, 0x6c_u8, 0xb2_u8, 0xb1_u8, 0xa_u8, 0x91_u8, 0xa6_u8, 0xeb_u8])
    def query_interface(this : IWdsTransportCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IWdsTransportCollection*, pulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pulCount)
    end
    def get_Item(this : IWdsTransportCollection*, ulIndex : UInt32, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, ulIndex, ppVal)
    end
    def get__NewEnum(this : IWdsTransportCollection*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppVal)
    end

  end

  @[Extern]
  record IWdsTransportManagerVtbl,
    query_interface : Proc(IWdsTransportManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportManager*, UInt32),
    release : Proc(IWdsTransportManager*, UInt32),
    get_type_info_count : Proc(IWdsTransportManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_wds_transport_server : Proc(IWdsTransportManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportManager, lpVtbl : IWdsTransportManagerVtbl* do
    GUID = LibC::GUID.new(0x5b0d35f5_u32, 0x1b13_u16, 0x4afd_u16, StaticArray[0xb8_u8, 0x78_u8, 0x65_u8, 0x26_u8, 0xdc_u8, 0x34_u8, 0xb_u8, 0x5d_u8])
    def query_interface(this : IWdsTransportManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_wds_transport_server(this : IWdsTransportManager*, bszServerName : Win32cr::Foundation::BSTR, ppWdsTransportServer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wds_transport_server.call(this, bszServerName, ppWdsTransportServer)
    end

  end

  @[Extern]
  record IWdsTransportServerVtbl,
    query_interface : Proc(IWdsTransportServer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportServer*, UInt32),
    release : Proc(IWdsTransportServer*, UInt32),
    get_type_info_count : Proc(IWdsTransportServer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportServer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportServer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportServer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportServer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SetupManager : Proc(IWdsTransportServer*, Void**, Win32cr::Foundation::HRESULT),
    get_ConfigurationManager : Proc(IWdsTransportServer*, Void**, Win32cr::Foundation::HRESULT),
    get_NamespaceManager : Proc(IWdsTransportServer*, Void**, Win32cr::Foundation::HRESULT),
    disconnect_client : Proc(IWdsTransportServer*, UInt32, Win32cr::System::DeploymentServices::WDSTRANSPORT_DISCONNECT_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportServer, lpVtbl : IWdsTransportServerVtbl* do
    GUID = LibC::GUID.new(0x9ccd093_u32, 0x830d_u16, 0x4344_u16, StaticArray[0xa3_u8, 0xa_u8, 0x73_u8, 0xae_u8, 0x8e_u8, 0x8f_u8, 0xca_u8, 0x90_u8])
    def query_interface(this : IWdsTransportServer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportServer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportServer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportServer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportServer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportServer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportServer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IWdsTransportServer*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def get_SetupManager(this : IWdsTransportServer*, ppWdsTransportSetupManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SetupManager.call(this, ppWdsTransportSetupManager)
    end
    def get_ConfigurationManager(this : IWdsTransportServer*, ppWdsTransportConfigurationManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConfigurationManager.call(this, ppWdsTransportConfigurationManager)
    end
    def get_NamespaceManager(this : IWdsTransportServer*, ppWdsTransportNamespaceManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NamespaceManager.call(this, ppWdsTransportNamespaceManager)
    end
    def disconnect_client(this : IWdsTransportServer*, ulClientId : UInt32, disconnection_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_DISCONNECT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_client.call(this, ulClientId, disconnection_type)
    end

  end

  @[Extern]
  record IWdsTransportServer2Vtbl,
    query_interface : Proc(IWdsTransportServer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportServer2*, UInt32),
    release : Proc(IWdsTransportServer2*, UInt32),
    get_type_info_count : Proc(IWdsTransportServer2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportServer2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportServer2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportServer2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportServer2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SetupManager : Proc(IWdsTransportServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_ConfigurationManager : Proc(IWdsTransportServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_NamespaceManager : Proc(IWdsTransportServer2*, Void**, Win32cr::Foundation::HRESULT),
    disconnect_client : Proc(IWdsTransportServer2*, UInt32, Win32cr::System::DeploymentServices::WDSTRANSPORT_DISCONNECT_TYPE, Win32cr::Foundation::HRESULT),
    get_TftpManager : Proc(IWdsTransportServer2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportServer2, lpVtbl : IWdsTransportServer2Vtbl* do
    GUID = LibC::GUID.new(0x256e999f_u32, 0x6df4_u16, 0x4538_u16, StaticArray[0x81_u8, 0xb9_u8, 0x85_u8, 0x7b_u8, 0x9a_u8, 0xb8_u8, 0xfb_u8, 0x47_u8])
    def query_interface(this : IWdsTransportServer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportServer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportServer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportServer2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportServer2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportServer2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportServer2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IWdsTransportServer2*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def get_SetupManager(this : IWdsTransportServer2*, ppWdsTransportSetupManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SetupManager.call(this, ppWdsTransportSetupManager)
    end
    def get_ConfigurationManager(this : IWdsTransportServer2*, ppWdsTransportConfigurationManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConfigurationManager.call(this, ppWdsTransportConfigurationManager)
    end
    def get_NamespaceManager(this : IWdsTransportServer2*, ppWdsTransportNamespaceManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NamespaceManager.call(this, ppWdsTransportNamespaceManager)
    end
    def disconnect_client(this : IWdsTransportServer2*, ulClientId : UInt32, disconnection_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_DISCONNECT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_client.call(this, ulClientId, disconnection_type)
    end
    def get_TftpManager(this : IWdsTransportServer2*, ppWdsTransportTftpManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TftpManager.call(this, ppWdsTransportTftpManager)
    end

  end

  @[Extern]
  record IWdsTransportSetupManagerVtbl,
    query_interface : Proc(IWdsTransportSetupManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportSetupManager*, UInt32),
    release : Proc(IWdsTransportSetupManager*, UInt32),
    get_type_info_count : Proc(IWdsTransportSetupManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportSetupManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportSetupManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportSetupManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IWdsTransportSetupManager*, UInt64*, Win32cr::Foundation::HRESULT),
    get_InstalledFeatures : Proc(IWdsTransportSetupManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Protocols : Proc(IWdsTransportSetupManager*, UInt32*, Win32cr::Foundation::HRESULT),
    register_content_provider : Proc(IWdsTransportSetupManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    deregister_content_provider : Proc(IWdsTransportSetupManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportSetupManager, lpVtbl : IWdsTransportSetupManagerVtbl* do
    GUID = LibC::GUID.new(0xf7238425_u32, 0xefa8_u16, 0x40a4_u16, StaticArray[0xae_u8, 0xf9_u8, 0xc9_u8, 0x8d_u8, 0x96_u8, 0x9c_u8, 0xb_u8, 0x75_u8])
    def query_interface(this : IWdsTransportSetupManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportSetupManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportSetupManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportSetupManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportSetupManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportSetupManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportSetupManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Version(this : IWdsTransportSetupManager*, pullVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, pullVersion)
    end
    def get_InstalledFeatures(this : IWdsTransportSetupManager*, pulInstalledFeatures : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstalledFeatures.call(this, pulInstalledFeatures)
    end
    def get_Protocols(this : IWdsTransportSetupManager*, pulProtocols : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocols.call(this, pulProtocols)
    end
    def register_content_provider(this : IWdsTransportSetupManager*, bszName : Win32cr::Foundation::BSTR, bszDescription : Win32cr::Foundation::BSTR, bszFilePath : Win32cr::Foundation::BSTR, bszInitializationRoutine : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_content_provider.call(this, bszName, bszDescription, bszFilePath, bszInitializationRoutine)
    end
    def deregister_content_provider(this : IWdsTransportSetupManager*, bszName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deregister_content_provider.call(this, bszName)
    end

  end

  @[Extern]
  record IWdsTransportSetupManager2Vtbl,
    query_interface : Proc(IWdsTransportSetupManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportSetupManager2*, UInt32),
    release : Proc(IWdsTransportSetupManager2*, UInt32),
    get_type_info_count : Proc(IWdsTransportSetupManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportSetupManager2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportSetupManager2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportSetupManager2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IWdsTransportSetupManager2*, UInt64*, Win32cr::Foundation::HRESULT),
    get_InstalledFeatures : Proc(IWdsTransportSetupManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Protocols : Proc(IWdsTransportSetupManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    register_content_provider : Proc(IWdsTransportSetupManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    deregister_content_provider : Proc(IWdsTransportSetupManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TftpCapabilities : Proc(IWdsTransportSetupManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ContentProviders : Proc(IWdsTransportSetupManager2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportSetupManager2, lpVtbl : IWdsTransportSetupManager2Vtbl* do
    GUID = LibC::GUID.new(0x2be79da_u32, 0x7e9e_u16, 0x4366_u16, StaticArray[0x8b_u8, 0x6e_u8, 0x2a_u8, 0xa9_u8, 0xa9_u8, 0x1b_u8, 0xe4_u8, 0x7f_u8])
    def query_interface(this : IWdsTransportSetupManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportSetupManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportSetupManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportSetupManager2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportSetupManager2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportSetupManager2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportSetupManager2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Version(this : IWdsTransportSetupManager2*, pullVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, pullVersion)
    end
    def get_InstalledFeatures(this : IWdsTransportSetupManager2*, pulInstalledFeatures : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstalledFeatures.call(this, pulInstalledFeatures)
    end
    def get_Protocols(this : IWdsTransportSetupManager2*, pulProtocols : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocols.call(this, pulProtocols)
    end
    def register_content_provider(this : IWdsTransportSetupManager2*, bszName : Win32cr::Foundation::BSTR, bszDescription : Win32cr::Foundation::BSTR, bszFilePath : Win32cr::Foundation::BSTR, bszInitializationRoutine : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_content_provider.call(this, bszName, bszDescription, bszFilePath, bszInitializationRoutine)
    end
    def deregister_content_provider(this : IWdsTransportSetupManager2*, bszName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deregister_content_provider.call(this, bszName)
    end
    def get_TftpCapabilities(this : IWdsTransportSetupManager2*, pulTftpCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TftpCapabilities.call(this, pulTftpCapabilities)
    end
    def get_ContentProviders(this : IWdsTransportSetupManager2*, ppProviderCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentProviders.call(this, ppProviderCollection)
    end

  end

  @[Extern]
  record IWdsTransportConfigurationManagerVtbl,
    query_interface : Proc(IWdsTransportConfigurationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportConfigurationManager*, UInt32),
    release : Proc(IWdsTransportConfigurationManager*, UInt32),
    get_type_info_count : Proc(IWdsTransportConfigurationManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportConfigurationManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportConfigurationManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportConfigurationManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ServicePolicy : Proc(IWdsTransportConfigurationManager*, Void**, Win32cr::Foundation::HRESULT),
    get_DiagnosticsPolicy : Proc(IWdsTransportConfigurationManager*, Void**, Win32cr::Foundation::HRESULT),
    get_WdsTransportServicesRunning : Proc(IWdsTransportConfigurationManager*, Int16, Int16*, Win32cr::Foundation::HRESULT),
    enable_wds_transport_services : Proc(IWdsTransportConfigurationManager*, Win32cr::Foundation::HRESULT),
    disable_wds_transport_services : Proc(IWdsTransportConfigurationManager*, Win32cr::Foundation::HRESULT),
    start_wds_transport_services : Proc(IWdsTransportConfigurationManager*, Win32cr::Foundation::HRESULT),
    stop_wds_transport_services : Proc(IWdsTransportConfigurationManager*, Win32cr::Foundation::HRESULT),
    restart_wds_transport_services : Proc(IWdsTransportConfigurationManager*, Win32cr::Foundation::HRESULT),
    notify_wds_transport_services : Proc(IWdsTransportConfigurationManager*, Win32cr::System::DeploymentServices::WDSTRANSPORT_SERVICE_NOTIFICATION, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportConfigurationManager, lpVtbl : IWdsTransportConfigurationManagerVtbl* do
    GUID = LibC::GUID.new(0x84cc4779_u32, 0x42dd_u16, 0x4792_u16, StaticArray[0x89_u8, 0x1e_u8, 0x13_u8, 0x21_u8, 0xd6_u8, 0xd7_u8, 0x4b_u8, 0x44_u8])
    def query_interface(this : IWdsTransportConfigurationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportConfigurationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportConfigurationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportConfigurationManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportConfigurationManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportConfigurationManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportConfigurationManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ServicePolicy(this : IWdsTransportConfigurationManager*, ppWdsTransportServicePolicy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServicePolicy.call(this, ppWdsTransportServicePolicy)
    end
    def get_DiagnosticsPolicy(this : IWdsTransportConfigurationManager*, ppWdsTransportDiagnosticsPolicy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DiagnosticsPolicy.call(this, ppWdsTransportDiagnosticsPolicy)
    end
    def get_WdsTransportServicesRunning(this : IWdsTransportConfigurationManager*, bRealtimeStatus : Int16, pbServicesRunning : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WdsTransportServicesRunning.call(this, bRealtimeStatus, pbServicesRunning)
    end
    def enable_wds_transport_services(this : IWdsTransportConfigurationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_wds_transport_services.call(this)
    end
    def disable_wds_transport_services(this : IWdsTransportConfigurationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_wds_transport_services.call(this)
    end
    def start_wds_transport_services(this : IWdsTransportConfigurationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_wds_transport_services.call(this)
    end
    def stop_wds_transport_services(this : IWdsTransportConfigurationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_wds_transport_services.call(this)
    end
    def restart_wds_transport_services(this : IWdsTransportConfigurationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restart_wds_transport_services.call(this)
    end
    def notify_wds_transport_services(this : IWdsTransportConfigurationManager*, service_notification : Win32cr::System::DeploymentServices::WDSTRANSPORT_SERVICE_NOTIFICATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_wds_transport_services.call(this, service_notification)
    end

  end

  @[Extern]
  record IWdsTransportConfigurationManager2Vtbl,
    query_interface : Proc(IWdsTransportConfigurationManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportConfigurationManager2*, UInt32),
    release : Proc(IWdsTransportConfigurationManager2*, UInt32),
    get_type_info_count : Proc(IWdsTransportConfigurationManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportConfigurationManager2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportConfigurationManager2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportConfigurationManager2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ServicePolicy : Proc(IWdsTransportConfigurationManager2*, Void**, Win32cr::Foundation::HRESULT),
    get_DiagnosticsPolicy : Proc(IWdsTransportConfigurationManager2*, Void**, Win32cr::Foundation::HRESULT),
    get_WdsTransportServicesRunning : Proc(IWdsTransportConfigurationManager2*, Int16, Int16*, Win32cr::Foundation::HRESULT),
    enable_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, Win32cr::Foundation::HRESULT),
    disable_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, Win32cr::Foundation::HRESULT),
    start_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, Win32cr::Foundation::HRESULT),
    stop_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, Win32cr::Foundation::HRESULT),
    restart_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, Win32cr::Foundation::HRESULT),
    notify_wds_transport_services : Proc(IWdsTransportConfigurationManager2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_SERVICE_NOTIFICATION, Win32cr::Foundation::HRESULT),
    get_MulticastSessionPolicy : Proc(IWdsTransportConfigurationManager2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportConfigurationManager2, lpVtbl : IWdsTransportConfigurationManager2Vtbl* do
    GUID = LibC::GUID.new(0xd0d85caf_u32, 0xa153_u16, 0x4f1d_u16, StaticArray[0xa9_u8, 0xdd_u8, 0x96_u8, 0xf4_u8, 0x31_u8, 0xc5_u8, 0x7_u8, 0x17_u8])
    def query_interface(this : IWdsTransportConfigurationManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportConfigurationManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportConfigurationManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportConfigurationManager2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportConfigurationManager2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportConfigurationManager2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportConfigurationManager2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ServicePolicy(this : IWdsTransportConfigurationManager2*, ppWdsTransportServicePolicy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServicePolicy.call(this, ppWdsTransportServicePolicy)
    end
    def get_DiagnosticsPolicy(this : IWdsTransportConfigurationManager2*, ppWdsTransportDiagnosticsPolicy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DiagnosticsPolicy.call(this, ppWdsTransportDiagnosticsPolicy)
    end
    def get_WdsTransportServicesRunning(this : IWdsTransportConfigurationManager2*, bRealtimeStatus : Int16, pbServicesRunning : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WdsTransportServicesRunning.call(this, bRealtimeStatus, pbServicesRunning)
    end
    def enable_wds_transport_services(this : IWdsTransportConfigurationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_wds_transport_services.call(this)
    end
    def disable_wds_transport_services(this : IWdsTransportConfigurationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_wds_transport_services.call(this)
    end
    def start_wds_transport_services(this : IWdsTransportConfigurationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_wds_transport_services.call(this)
    end
    def stop_wds_transport_services(this : IWdsTransportConfigurationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_wds_transport_services.call(this)
    end
    def restart_wds_transport_services(this : IWdsTransportConfigurationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restart_wds_transport_services.call(this)
    end
    def notify_wds_transport_services(this : IWdsTransportConfigurationManager2*, service_notification : Win32cr::System::DeploymentServices::WDSTRANSPORT_SERVICE_NOTIFICATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_wds_transport_services.call(this, service_notification)
    end
    def get_MulticastSessionPolicy(this : IWdsTransportConfigurationManager2*, ppWdsTransportMulticastSessionPolicy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MulticastSessionPolicy.call(this, ppWdsTransportMulticastSessionPolicy)
    end

  end

  @[Extern]
  record IWdsTransportNamespaceManagerVtbl,
    query_interface : Proc(IWdsTransportNamespaceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportNamespaceManager*, UInt32),
    release : Proc(IWdsTransportNamespaceManager*, UInt32),
    get_type_info_count : Proc(IWdsTransportNamespaceManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportNamespaceManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportNamespaceManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportNamespaceManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_namespace : Proc(IWdsTransportNamespaceManager*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    retrieve_namespace : Proc(IWdsTransportNamespaceManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    retrieve_namespaces : Proc(IWdsTransportNamespaceManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportNamespaceManager, lpVtbl : IWdsTransportNamespaceManagerVtbl* do
    GUID = LibC::GUID.new(0x3e22d9f6_u32, 0x3777_u16, 0x4d98_u16, StaticArray[0x83_u8, 0xe1_u8, 0xf9_u8, 0x86_u8, 0x96_u8, 0x71_u8, 0x7b_u8, 0xa3_u8])
    def query_interface(this : IWdsTransportNamespaceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportNamespaceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportNamespaceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportNamespaceManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportNamespaceManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportNamespaceManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportNamespaceManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_namespace(this : IWdsTransportNamespaceManager*, namespace_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE, bszNamespaceName : Win32cr::Foundation::BSTR, bszContentProvider : Win32cr::Foundation::BSTR, bszConfiguration : Win32cr::Foundation::BSTR, ppWdsTransportNamespace : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_namespace.call(this, namespace_type, bszNamespaceName, bszContentProvider, bszConfiguration, ppWdsTransportNamespace)
    end
    def retrieve_namespace(this : IWdsTransportNamespaceManager*, bszNamespaceName : Win32cr::Foundation::BSTR, ppWdsTransportNamespace : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_namespace.call(this, bszNamespaceName, ppWdsTransportNamespace)
    end
    def retrieve_namespaces(this : IWdsTransportNamespaceManager*, bszContentProvider : Win32cr::Foundation::BSTR, bszNamespaceName : Win32cr::Foundation::BSTR, bIncludeTombstones : Int16, ppWdsTransportNamespaces : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_namespaces.call(this, bszContentProvider, bszNamespaceName, bIncludeTombstones, ppWdsTransportNamespaces)
    end

  end

  @[Extern]
  record IWdsTransportTftpManagerVtbl,
    query_interface : Proc(IWdsTransportTftpManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportTftpManager*, UInt32),
    release : Proc(IWdsTransportTftpManager*, UInt32),
    get_type_info_count : Proc(IWdsTransportTftpManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportTftpManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportTftpManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportTftpManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    retrieve_tftp_clients : Proc(IWdsTransportTftpManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportTftpManager, lpVtbl : IWdsTransportTftpManagerVtbl* do
    GUID = LibC::GUID.new(0x1327a7c8_u32, 0xae8a_u16, 0x4fb3_u16, StaticArray[0x81_u8, 0x50_u8, 0x13_u8, 0x62_u8, 0x27_u8, 0xc3_u8, 0x7e_u8, 0x9a_u8])
    def query_interface(this : IWdsTransportTftpManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportTftpManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportTftpManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportTftpManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportTftpManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportTftpManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportTftpManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def retrieve_tftp_clients(this : IWdsTransportTftpManager*, ppWdsTransportTftpClients : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_tftp_clients.call(this, ppWdsTransportTftpClients)
    end

  end

  @[Extern]
  record IWdsTransportServicePolicyVtbl,
    query_interface : Proc(IWdsTransportServicePolicy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportServicePolicy*, UInt32),
    release : Proc(IWdsTransportServicePolicy*, UInt32),
    get_type_info_count : Proc(IWdsTransportServicePolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportServicePolicy*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportServicePolicy*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportServicePolicy*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Dirty : Proc(IWdsTransportServicePolicy*, Int16*, Win32cr::Foundation::HRESULT),
    discard : Proc(IWdsTransportServicePolicy*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportServicePolicy*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWdsTransportServicePolicy*, Win32cr::Foundation::HRESULT),
    get_IpAddressSource : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*, Win32cr::Foundation::HRESULT),
    put_IpAddressSource : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE, Win32cr::Foundation::HRESULT),
    get_StartIpAddress : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartIpAddress : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndIpAddress : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndIpAddress : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartPort : Proc(IWdsTransportServicePolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    put_StartPort : Proc(IWdsTransportServicePolicy*, UInt32, Win32cr::Foundation::HRESULT),
    get_EndPort : Proc(IWdsTransportServicePolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    put_EndPort : Proc(IWdsTransportServicePolicy*, UInt32, Win32cr::Foundation::HRESULT),
    get_NetworkProfile : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE*, Win32cr::Foundation::HRESULT),
    put_NetworkProfile : Proc(IWdsTransportServicePolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportServicePolicy, lpVtbl : IWdsTransportServicePolicyVtbl* do
    GUID = LibC::GUID.new(0xb9468578_u32, 0x9f2b_u16, 0x48cc_u16, StaticArray[0xb2_u8, 0x7a_u8, 0xa6_u8, 0x7_u8, 0x99_u8, 0xc2_u8, 0x75_u8, 0xc_u8])
    def query_interface(this : IWdsTransportServicePolicy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportServicePolicy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportServicePolicy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportServicePolicy*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportServicePolicy*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportServicePolicy*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportServicePolicy*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Dirty(this : IWdsTransportServicePolicy*, pbDirty : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dirty.call(this, pbDirty)
    end
    def discard(this : IWdsTransportServicePolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this)
    end
    def refresh(this : IWdsTransportServicePolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def commit(this : IWdsTransportServicePolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_IpAddressSource(this : IWdsTransportServicePolicy*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, pSourceType : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpAddressSource.call(this, address_type, pSourceType)
    end
    def put_IpAddressSource(this : IWdsTransportServicePolicy*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, source_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IpAddressSource.call(this, address_type, source_type)
    end
    def get_StartIpAddress(this : IWdsTransportServicePolicy*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, pbszStartIpAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartIpAddress.call(this, address_type, pbszStartIpAddress)
    end
    def put_StartIpAddress(this : IWdsTransportServicePolicy*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, bszStartIpAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartIpAddress.call(this, address_type, bszStartIpAddress)
    end
    def get_EndIpAddress(this : IWdsTransportServicePolicy*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, pbszEndIpAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndIpAddress.call(this, address_type, pbszEndIpAddress)
    end
    def put_EndIpAddress(this : IWdsTransportServicePolicy*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, bszEndIpAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndIpAddress.call(this, address_type, bszEndIpAddress)
    end
    def get_StartPort(this : IWdsTransportServicePolicy*, pulStartPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartPort.call(this, pulStartPort)
    end
    def put_StartPort(this : IWdsTransportServicePolicy*, ulStartPort : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartPort.call(this, ulStartPort)
    end
    def get_EndPort(this : IWdsTransportServicePolicy*, pulEndPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndPort.call(this, pulEndPort)
    end
    def put_EndPort(this : IWdsTransportServicePolicy*, ulEndPort : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndPort.call(this, ulEndPort)
    end
    def get_NetworkProfile(this : IWdsTransportServicePolicy*, pProfileType : Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkProfile.call(this, pProfileType)
    end
    def put_NetworkProfile(this : IWdsTransportServicePolicy*, profile_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NetworkProfile.call(this, profile_type)
    end

  end

  @[Extern]
  record IWdsTransportServicePolicy2Vtbl,
    query_interface : Proc(IWdsTransportServicePolicy2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportServicePolicy2*, UInt32),
    release : Proc(IWdsTransportServicePolicy2*, UInt32),
    get_type_info_count : Proc(IWdsTransportServicePolicy2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportServicePolicy2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportServicePolicy2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportServicePolicy2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Dirty : Proc(IWdsTransportServicePolicy2*, Int16*, Win32cr::Foundation::HRESULT),
    discard : Proc(IWdsTransportServicePolicy2*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportServicePolicy2*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWdsTransportServicePolicy2*, Win32cr::Foundation::HRESULT),
    get_IpAddressSource : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*, Win32cr::Foundation::HRESULT),
    put_IpAddressSource : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE, Win32cr::Foundation::HRESULT),
    get_StartIpAddress : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartIpAddress : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndIpAddress : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndIpAddress : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartPort : Proc(IWdsTransportServicePolicy2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_StartPort : Proc(IWdsTransportServicePolicy2*, UInt32, Win32cr::Foundation::HRESULT),
    get_EndPort : Proc(IWdsTransportServicePolicy2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_EndPort : Proc(IWdsTransportServicePolicy2*, UInt32, Win32cr::Foundation::HRESULT),
    get_NetworkProfile : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE*, Win32cr::Foundation::HRESULT),
    put_NetworkProfile : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE, Win32cr::Foundation::HRESULT),
    get_UdpPortPolicy : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_UDP_PORT_POLICY*, Win32cr::Foundation::HRESULT),
    put_UdpPortPolicy : Proc(IWdsTransportServicePolicy2*, Win32cr::System::DeploymentServices::WDSTRANSPORT_UDP_PORT_POLICY, Win32cr::Foundation::HRESULT),
    get_TftpMaximumBlockSize : Proc(IWdsTransportServicePolicy2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TftpMaximumBlockSize : Proc(IWdsTransportServicePolicy2*, UInt32, Win32cr::Foundation::HRESULT),
    get_EnableTftpVariableWindowExtension : Proc(IWdsTransportServicePolicy2*, Int16*, Win32cr::Foundation::HRESULT),
    put_EnableTftpVariableWindowExtension : Proc(IWdsTransportServicePolicy2*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportServicePolicy2, lpVtbl : IWdsTransportServicePolicy2Vtbl* do
    GUID = LibC::GUID.new(0x65c19e5c_u32, 0xaa7e_u16, 0x4b91_u16, StaticArray[0x89_u8, 0x44_u8, 0x91_u8, 0xe0_u8, 0xe5_u8, 0x57_u8, 0x27_u8, 0x97_u8])
    def query_interface(this : IWdsTransportServicePolicy2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportServicePolicy2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportServicePolicy2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportServicePolicy2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportServicePolicy2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportServicePolicy2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportServicePolicy2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Dirty(this : IWdsTransportServicePolicy2*, pbDirty : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dirty.call(this, pbDirty)
    end
    def discard(this : IWdsTransportServicePolicy2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this)
    end
    def refresh(this : IWdsTransportServicePolicy2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def commit(this : IWdsTransportServicePolicy2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_IpAddressSource(this : IWdsTransportServicePolicy2*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, pSourceType : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpAddressSource.call(this, address_type, pSourceType)
    end
    def put_IpAddressSource(this : IWdsTransportServicePolicy2*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, source_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IpAddressSource.call(this, address_type, source_type)
    end
    def get_StartIpAddress(this : IWdsTransportServicePolicy2*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, pbszStartIpAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartIpAddress.call(this, address_type, pbszStartIpAddress)
    end
    def put_StartIpAddress(this : IWdsTransportServicePolicy2*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, bszStartIpAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartIpAddress.call(this, address_type, bszStartIpAddress)
    end
    def get_EndIpAddress(this : IWdsTransportServicePolicy2*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, pbszEndIpAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndIpAddress.call(this, address_type, pbszEndIpAddress)
    end
    def put_EndIpAddress(this : IWdsTransportServicePolicy2*, address_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_IP_ADDRESS_TYPE, bszEndIpAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndIpAddress.call(this, address_type, bszEndIpAddress)
    end
    def get_StartPort(this : IWdsTransportServicePolicy2*, pulStartPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartPort.call(this, pulStartPort)
    end
    def put_StartPort(this : IWdsTransportServicePolicy2*, ulStartPort : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartPort.call(this, ulStartPort)
    end
    def get_EndPort(this : IWdsTransportServicePolicy2*, pulEndPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndPort.call(this, pulEndPort)
    end
    def put_EndPort(this : IWdsTransportServicePolicy2*, ulEndPort : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndPort.call(this, ulEndPort)
    end
    def get_NetworkProfile(this : IWdsTransportServicePolicy2*, pProfileType : Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkProfile.call(this, pProfileType)
    end
    def put_NetworkProfile(this : IWdsTransportServicePolicy2*, profile_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_NETWORK_PROFILE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NetworkProfile.call(this, profile_type)
    end
    def get_UdpPortPolicy(this : IWdsTransportServicePolicy2*, pUdpPortPolicy : Win32cr::System::DeploymentServices::WDSTRANSPORT_UDP_PORT_POLICY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UdpPortPolicy.call(this, pUdpPortPolicy)
    end
    def put_UdpPortPolicy(this : IWdsTransportServicePolicy2*, udp_port_policy : Win32cr::System::DeploymentServices::WDSTRANSPORT_UDP_PORT_POLICY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UdpPortPolicy.call(this, udp_port_policy)
    end
    def get_TftpMaximumBlockSize(this : IWdsTransportServicePolicy2*, pulTftpMaximumBlockSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TftpMaximumBlockSize.call(this, pulTftpMaximumBlockSize)
    end
    def put_TftpMaximumBlockSize(this : IWdsTransportServicePolicy2*, ulTftpMaximumBlockSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TftpMaximumBlockSize.call(this, ulTftpMaximumBlockSize)
    end
    def get_EnableTftpVariableWindowExtension(this : IWdsTransportServicePolicy2*, pbEnableTftpVariableWindowExtension : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnableTftpVariableWindowExtension.call(this, pbEnableTftpVariableWindowExtension)
    end
    def put_EnableTftpVariableWindowExtension(this : IWdsTransportServicePolicy2*, bEnableTftpVariableWindowExtension : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnableTftpVariableWindowExtension.call(this, bEnableTftpVariableWindowExtension)
    end

  end

  @[Extern]
  record IWdsTransportDiagnosticsPolicyVtbl,
    query_interface : Proc(IWdsTransportDiagnosticsPolicy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportDiagnosticsPolicy*, UInt32),
    release : Proc(IWdsTransportDiagnosticsPolicy*, UInt32),
    get_type_info_count : Proc(IWdsTransportDiagnosticsPolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportDiagnosticsPolicy*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportDiagnosticsPolicy*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportDiagnosticsPolicy*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Dirty : Proc(IWdsTransportDiagnosticsPolicy*, Int16*, Win32cr::Foundation::HRESULT),
    discard : Proc(IWdsTransportDiagnosticsPolicy*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportDiagnosticsPolicy*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWdsTransportDiagnosticsPolicy*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IWdsTransportDiagnosticsPolicy*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IWdsTransportDiagnosticsPolicy*, Int16, Win32cr::Foundation::HRESULT),
    get_Components : Proc(IWdsTransportDiagnosticsPolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Components : Proc(IWdsTransportDiagnosticsPolicy*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportDiagnosticsPolicy, lpVtbl : IWdsTransportDiagnosticsPolicyVtbl* do
    GUID = LibC::GUID.new(0x13b33efc_u32, 0x7856_u16, 0x4f61_u16, StaticArray[0x9a_u8, 0x59_u8, 0x8d_u8, 0xe6_u8, 0x7b_u8, 0x6b_u8, 0x87_u8, 0xb6_u8])
    def query_interface(this : IWdsTransportDiagnosticsPolicy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportDiagnosticsPolicy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportDiagnosticsPolicy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportDiagnosticsPolicy*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportDiagnosticsPolicy*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportDiagnosticsPolicy*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportDiagnosticsPolicy*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Dirty(this : IWdsTransportDiagnosticsPolicy*, pbDirty : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dirty.call(this, pbDirty)
    end
    def discard(this : IWdsTransportDiagnosticsPolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this)
    end
    def refresh(this : IWdsTransportDiagnosticsPolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def commit(this : IWdsTransportDiagnosticsPolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Enabled(this : IWdsTransportDiagnosticsPolicy*, pbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pbEnabled)
    end
    def put_Enabled(this : IWdsTransportDiagnosticsPolicy*, bEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, bEnabled)
    end
    def get_Components(this : IWdsTransportDiagnosticsPolicy*, pulComponents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Components.call(this, pulComponents)
    end
    def put_Components(this : IWdsTransportDiagnosticsPolicy*, ulComponents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Components.call(this, ulComponents)
    end

  end

  @[Extern]
  record IWdsTransportMulticastSessionPolicyVtbl,
    query_interface : Proc(IWdsTransportMulticastSessionPolicy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportMulticastSessionPolicy*, UInt32),
    release : Proc(IWdsTransportMulticastSessionPolicy*, UInt32),
    get_type_info_count : Proc(IWdsTransportMulticastSessionPolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportMulticastSessionPolicy*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportMulticastSessionPolicy*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportMulticastSessionPolicy*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Dirty : Proc(IWdsTransportMulticastSessionPolicy*, Int16*, Win32cr::Foundation::HRESULT),
    discard : Proc(IWdsTransportMulticastSessionPolicy*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportMulticastSessionPolicy*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWdsTransportMulticastSessionPolicy*, Win32cr::Foundation::HRESULT),
    get_SlowClientHandling : Proc(IWdsTransportMulticastSessionPolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE*, Win32cr::Foundation::HRESULT),
    put_SlowClientHandling : Proc(IWdsTransportMulticastSessionPolicy*, Win32cr::System::DeploymentServices::WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE, Win32cr::Foundation::HRESULT),
    get_AutoDisconnectThreshold : Proc(IWdsTransportMulticastSessionPolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    put_AutoDisconnectThreshold : Proc(IWdsTransportMulticastSessionPolicy*, UInt32, Win32cr::Foundation::HRESULT),
    get_MultistreamStreamCount : Proc(IWdsTransportMulticastSessionPolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MultistreamStreamCount : Proc(IWdsTransportMulticastSessionPolicy*, UInt32, Win32cr::Foundation::HRESULT),
    get_SlowClientFallback : Proc(IWdsTransportMulticastSessionPolicy*, Int16*, Win32cr::Foundation::HRESULT),
    put_SlowClientFallback : Proc(IWdsTransportMulticastSessionPolicy*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportMulticastSessionPolicy, lpVtbl : IWdsTransportMulticastSessionPolicyVtbl* do
    GUID = LibC::GUID.new(0x4e5753cf_u32, 0x68ec_u16, 0x4504_u16, StaticArray[0xa9_u8, 0x51_u8, 0x4a_u8, 0x0_u8, 0x32_u8, 0x66_u8, 0x60_u8, 0x6b_u8])
    def query_interface(this : IWdsTransportMulticastSessionPolicy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportMulticastSessionPolicy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportMulticastSessionPolicy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportMulticastSessionPolicy*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportMulticastSessionPolicy*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportMulticastSessionPolicy*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportMulticastSessionPolicy*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Dirty(this : IWdsTransportMulticastSessionPolicy*, pbDirty : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dirty.call(this, pbDirty)
    end
    def discard(this : IWdsTransportMulticastSessionPolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this)
    end
    def refresh(this : IWdsTransportMulticastSessionPolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def commit(this : IWdsTransportMulticastSessionPolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_SlowClientHandling(this : IWdsTransportMulticastSessionPolicy*, pSlowClientHandling : Win32cr::System::DeploymentServices::WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SlowClientHandling.call(this, pSlowClientHandling)
    end
    def put_SlowClientHandling(this : IWdsTransportMulticastSessionPolicy*, slow_client_handling : Win32cr::System::DeploymentServices::WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SlowClientHandling.call(this, slow_client_handling)
    end
    def get_AutoDisconnectThreshold(this : IWdsTransportMulticastSessionPolicy*, pulThreshold : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoDisconnectThreshold.call(this, pulThreshold)
    end
    def put_AutoDisconnectThreshold(this : IWdsTransportMulticastSessionPolicy*, ulThreshold : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoDisconnectThreshold.call(this, ulThreshold)
    end
    def get_MultistreamStreamCount(this : IWdsTransportMulticastSessionPolicy*, pulStreamCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MultistreamStreamCount.call(this, pulStreamCount)
    end
    def put_MultistreamStreamCount(this : IWdsTransportMulticastSessionPolicy*, ulStreamCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MultistreamStreamCount.call(this, ulStreamCount)
    end
    def get_SlowClientFallback(this : IWdsTransportMulticastSessionPolicy*, pbClientFallback : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SlowClientFallback.call(this, pbClientFallback)
    end
    def put_SlowClientFallback(this : IWdsTransportMulticastSessionPolicy*, bClientFallback : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SlowClientFallback.call(this, bClientFallback)
    end

  end

  @[Extern]
  record IWdsTransportNamespaceVtbl,
    query_interface : Proc(IWdsTransportNamespace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportNamespace*, UInt32),
    release : Proc(IWdsTransportNamespace*, UInt32),
    get_type_info_count : Proc(IWdsTransportNamespace*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportNamespace*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportNamespace*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportNamespace*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWdsTransportNamespace*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportNamespace*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FriendlyName : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ContentProvider : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ContentProvider : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Configuration : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Configuration : Proc(IWdsTransportNamespace*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Registered : Proc(IWdsTransportNamespace*, Int16*, Win32cr::Foundation::HRESULT),
    get_Tombstoned : Proc(IWdsTransportNamespace*, Int16*, Win32cr::Foundation::HRESULT),
    get_TombstoneTime : Proc(IWdsTransportNamespace*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStarted : Proc(IWdsTransportNamespace*, Int16*, Win32cr::Foundation::HRESULT),
    register : Proc(IWdsTransportNamespace*, Win32cr::Foundation::HRESULT),
    deregister : Proc(IWdsTransportNamespace*, Int16, Win32cr::Foundation::HRESULT),
    clone : Proc(IWdsTransportNamespace*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportNamespace*, Win32cr::Foundation::HRESULT),
    retrieve_contents : Proc(IWdsTransportNamespace*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportNamespace, lpVtbl : IWdsTransportNamespaceVtbl* do
    GUID = LibC::GUID.new(0xfa561f57_u32, 0xfbef_u16, 0x4ed3_u16, StaticArray[0xb0_u8, 0x56_u8, 0x12_u8, 0x7c_u8, 0xb1_u8, 0xb3_u8, 0x3b_u8, 0x84_u8])
    def query_interface(this : IWdsTransportNamespace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportNamespace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportNamespace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportNamespace*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportNamespace*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportNamespace*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportNamespace*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IWdsTransportNamespace*, pType : Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IWdsTransportNamespace*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_Name(this : IWdsTransportNamespace*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def put_Name(this : IWdsTransportNamespace*, bszName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bszName)
    end
    def get_FriendlyName(this : IWdsTransportNamespace*, pbszFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbszFriendlyName)
    end
    def put_FriendlyName(this : IWdsTransportNamespace*, bszFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FriendlyName.call(this, bszFriendlyName)
    end
    def get_Description(this : IWdsTransportNamespace*, pbszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbszDescription)
    end
    def put_Description(this : IWdsTransportNamespace*, bszDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bszDescription)
    end
    def get_ContentProvider(this : IWdsTransportNamespace*, pbszContentProvider : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentProvider.call(this, pbszContentProvider)
    end
    def put_ContentProvider(this : IWdsTransportNamespace*, bszContentProvider : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ContentProvider.call(this, bszContentProvider)
    end
    def get_Configuration(this : IWdsTransportNamespace*, pbszConfiguration : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Configuration.call(this, pbszConfiguration)
    end
    def put_Configuration(this : IWdsTransportNamespace*, bszConfiguration : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Configuration.call(this, bszConfiguration)
    end
    def get_Registered(this : IWdsTransportNamespace*, pbRegistered : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Registered.call(this, pbRegistered)
    end
    def get_Tombstoned(this : IWdsTransportNamespace*, pbTombstoned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tombstoned.call(this, pbTombstoned)
    end
    def get_TombstoneTime(this : IWdsTransportNamespace*, pTombstoneTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TombstoneTime.call(this, pTombstoneTime)
    end
    def get_TransmissionStarted(this : IWdsTransportNamespace*, pbTransmissionStarted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStarted.call(this, pbTransmissionStarted)
    end
    def register(this : IWdsTransportNamespace*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this)
    end
    def deregister(this : IWdsTransportNamespace*, bTerminateSessions : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deregister.call(this, bTerminateSessions)
    end
    def clone(this : IWdsTransportNamespace*, ppWdsTransportNamespaceClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppWdsTransportNamespaceClone)
    end
    def refresh(this : IWdsTransportNamespace*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def retrieve_contents(this : IWdsTransportNamespace*, ppWdsTransportContents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_contents.call(this, ppWdsTransportContents)
    end

  end

  @[Extern]
  record IWdsTransportNamespaceAutoCastVtbl,
    query_interface : Proc(IWdsTransportNamespaceAutoCast*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportNamespaceAutoCast*, UInt32),
    release : Proc(IWdsTransportNamespaceAutoCast*, UInt32),
    get_type_info_count : Proc(IWdsTransportNamespaceAutoCast*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportNamespaceAutoCast*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportNamespaceAutoCast*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportNamespaceAutoCast*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportNamespaceAutoCast*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FriendlyName : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ContentProvider : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ContentProvider : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Configuration : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Configuration : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Registered : Proc(IWdsTransportNamespaceAutoCast*, Int16*, Win32cr::Foundation::HRESULT),
    get_Tombstoned : Proc(IWdsTransportNamespaceAutoCast*, Int16*, Win32cr::Foundation::HRESULT),
    get_TombstoneTime : Proc(IWdsTransportNamespaceAutoCast*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStarted : Proc(IWdsTransportNamespaceAutoCast*, Int16*, Win32cr::Foundation::HRESULT),
    register : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::HRESULT),
    deregister : Proc(IWdsTransportNamespaceAutoCast*, Int16, Win32cr::Foundation::HRESULT),
    clone : Proc(IWdsTransportNamespaceAutoCast*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportNamespaceAutoCast*, Win32cr::Foundation::HRESULT),
    retrieve_contents : Proc(IWdsTransportNamespaceAutoCast*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportNamespaceAutoCast, lpVtbl : IWdsTransportNamespaceAutoCastVtbl* do
    GUID = LibC::GUID.new(0xad931a72_u32, 0xc4bd_u16, 0x4c41_u16, StaticArray[0x8f_u8, 0xbc_u8, 0x59_u8, 0xc9_u8, 0xc7_u8, 0x48_u8, 0xdf_u8, 0x9e_u8])
    def query_interface(this : IWdsTransportNamespaceAutoCast*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportNamespaceAutoCast*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportNamespaceAutoCast*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportNamespaceAutoCast*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportNamespaceAutoCast*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportNamespaceAutoCast*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportNamespaceAutoCast*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IWdsTransportNamespaceAutoCast*, pType : Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IWdsTransportNamespaceAutoCast*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_Name(this : IWdsTransportNamespaceAutoCast*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def put_Name(this : IWdsTransportNamespaceAutoCast*, bszName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bszName)
    end
    def get_FriendlyName(this : IWdsTransportNamespaceAutoCast*, pbszFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbszFriendlyName)
    end
    def put_FriendlyName(this : IWdsTransportNamespaceAutoCast*, bszFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FriendlyName.call(this, bszFriendlyName)
    end
    def get_Description(this : IWdsTransportNamespaceAutoCast*, pbszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbszDescription)
    end
    def put_Description(this : IWdsTransportNamespaceAutoCast*, bszDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bszDescription)
    end
    def get_ContentProvider(this : IWdsTransportNamespaceAutoCast*, pbszContentProvider : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentProvider.call(this, pbszContentProvider)
    end
    def put_ContentProvider(this : IWdsTransportNamespaceAutoCast*, bszContentProvider : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ContentProvider.call(this, bszContentProvider)
    end
    def get_Configuration(this : IWdsTransportNamespaceAutoCast*, pbszConfiguration : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Configuration.call(this, pbszConfiguration)
    end
    def put_Configuration(this : IWdsTransportNamespaceAutoCast*, bszConfiguration : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Configuration.call(this, bszConfiguration)
    end
    def get_Registered(this : IWdsTransportNamespaceAutoCast*, pbRegistered : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Registered.call(this, pbRegistered)
    end
    def get_Tombstoned(this : IWdsTransportNamespaceAutoCast*, pbTombstoned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tombstoned.call(this, pbTombstoned)
    end
    def get_TombstoneTime(this : IWdsTransportNamespaceAutoCast*, pTombstoneTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TombstoneTime.call(this, pTombstoneTime)
    end
    def get_TransmissionStarted(this : IWdsTransportNamespaceAutoCast*, pbTransmissionStarted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStarted.call(this, pbTransmissionStarted)
    end
    def register(this : IWdsTransportNamespaceAutoCast*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this)
    end
    def deregister(this : IWdsTransportNamespaceAutoCast*, bTerminateSessions : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deregister.call(this, bTerminateSessions)
    end
    def clone(this : IWdsTransportNamespaceAutoCast*, ppWdsTransportNamespaceClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppWdsTransportNamespaceClone)
    end
    def refresh(this : IWdsTransportNamespaceAutoCast*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def retrieve_contents(this : IWdsTransportNamespaceAutoCast*, ppWdsTransportContents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_contents.call(this, ppWdsTransportContents)
    end

  end

  @[Extern]
  record IWdsTransportNamespaceScheduledCastVtbl,
    query_interface : Proc(IWdsTransportNamespaceScheduledCast*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportNamespaceScheduledCast*, UInt32),
    release : Proc(IWdsTransportNamespaceScheduledCast*, UInt32),
    get_type_info_count : Proc(IWdsTransportNamespaceScheduledCast*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportNamespaceScheduledCast*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportNamespaceScheduledCast*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportNamespaceScheduledCast*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportNamespaceScheduledCast*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FriendlyName : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ContentProvider : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ContentProvider : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Configuration : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Configuration : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Registered : Proc(IWdsTransportNamespaceScheduledCast*, Int16*, Win32cr::Foundation::HRESULT),
    get_Tombstoned : Proc(IWdsTransportNamespaceScheduledCast*, Int16*, Win32cr::Foundation::HRESULT),
    get_TombstoneTime : Proc(IWdsTransportNamespaceScheduledCast*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStarted : Proc(IWdsTransportNamespaceScheduledCast*, Int16*, Win32cr::Foundation::HRESULT),
    register : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::HRESULT),
    deregister : Proc(IWdsTransportNamespaceScheduledCast*, Int16, Win32cr::Foundation::HRESULT),
    clone : Proc(IWdsTransportNamespaceScheduledCast*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::HRESULT),
    retrieve_contents : Proc(IWdsTransportNamespaceScheduledCast*, Void**, Win32cr::Foundation::HRESULT),
    start_transmission : Proc(IWdsTransportNamespaceScheduledCast*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportNamespaceScheduledCast, lpVtbl : IWdsTransportNamespaceScheduledCastVtbl* do
    GUID = LibC::GUID.new(0x3840cecf_u32, 0xd76c_u16, 0x416e_u16, StaticArray[0xa4_u8, 0xcc_u8, 0x31_u8, 0xc7_u8, 0x41_u8, 0xd2_u8, 0x87_u8, 0x4b_u8])
    def query_interface(this : IWdsTransportNamespaceScheduledCast*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportNamespaceScheduledCast*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportNamespaceScheduledCast*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportNamespaceScheduledCast*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportNamespaceScheduledCast*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportNamespaceScheduledCast*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportNamespaceScheduledCast*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IWdsTransportNamespaceScheduledCast*, pType : Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IWdsTransportNamespaceScheduledCast*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_Name(this : IWdsTransportNamespaceScheduledCast*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def put_Name(this : IWdsTransportNamespaceScheduledCast*, bszName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bszName)
    end
    def get_FriendlyName(this : IWdsTransportNamespaceScheduledCast*, pbszFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbszFriendlyName)
    end
    def put_FriendlyName(this : IWdsTransportNamespaceScheduledCast*, bszFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FriendlyName.call(this, bszFriendlyName)
    end
    def get_Description(this : IWdsTransportNamespaceScheduledCast*, pbszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbszDescription)
    end
    def put_Description(this : IWdsTransportNamespaceScheduledCast*, bszDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bszDescription)
    end
    def get_ContentProvider(this : IWdsTransportNamespaceScheduledCast*, pbszContentProvider : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentProvider.call(this, pbszContentProvider)
    end
    def put_ContentProvider(this : IWdsTransportNamespaceScheduledCast*, bszContentProvider : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ContentProvider.call(this, bszContentProvider)
    end
    def get_Configuration(this : IWdsTransportNamespaceScheduledCast*, pbszConfiguration : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Configuration.call(this, pbszConfiguration)
    end
    def put_Configuration(this : IWdsTransportNamespaceScheduledCast*, bszConfiguration : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Configuration.call(this, bszConfiguration)
    end
    def get_Registered(this : IWdsTransportNamespaceScheduledCast*, pbRegistered : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Registered.call(this, pbRegistered)
    end
    def get_Tombstoned(this : IWdsTransportNamespaceScheduledCast*, pbTombstoned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tombstoned.call(this, pbTombstoned)
    end
    def get_TombstoneTime(this : IWdsTransportNamespaceScheduledCast*, pTombstoneTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TombstoneTime.call(this, pTombstoneTime)
    end
    def get_TransmissionStarted(this : IWdsTransportNamespaceScheduledCast*, pbTransmissionStarted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStarted.call(this, pbTransmissionStarted)
    end
    def register(this : IWdsTransportNamespaceScheduledCast*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this)
    end
    def deregister(this : IWdsTransportNamespaceScheduledCast*, bTerminateSessions : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deregister.call(this, bTerminateSessions)
    end
    def clone(this : IWdsTransportNamespaceScheduledCast*, ppWdsTransportNamespaceClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppWdsTransportNamespaceClone)
    end
    def refresh(this : IWdsTransportNamespaceScheduledCast*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def retrieve_contents(this : IWdsTransportNamespaceScheduledCast*, ppWdsTransportContents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_contents.call(this, ppWdsTransportContents)
    end
    def start_transmission(this : IWdsTransportNamespaceScheduledCast*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_transmission.call(this)
    end

  end

  @[Extern]
  record IWdsTransportNamespaceScheduledCastManualStartVtbl,
    query_interface : Proc(IWdsTransportNamespaceScheduledCastManualStart*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32),
    release : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32),
    get_type_info_count : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportNamespaceScheduledCastManualStart*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportNamespaceScheduledCastManualStart*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FriendlyName : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ContentProvider : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ContentProvider : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Configuration : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Configuration : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Registered : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16*, Win32cr::Foundation::HRESULT),
    get_Tombstoned : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16*, Win32cr::Foundation::HRESULT),
    get_TombstoneTime : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStarted : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16*, Win32cr::Foundation::HRESULT),
    register : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::HRESULT),
    deregister : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Int16, Win32cr::Foundation::HRESULT),
    clone : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::HRESULT),
    retrieve_contents : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Void**, Win32cr::Foundation::HRESULT),
    start_transmission : Proc(IWdsTransportNamespaceScheduledCastManualStart*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportNamespaceScheduledCastManualStart, lpVtbl : IWdsTransportNamespaceScheduledCastManualStartVtbl* do
    GUID = LibC::GUID.new(0x13e6e4c_u32, 0xe6a7_u16, 0x4fb5_u16, StaticArray[0xb7_u8, 0xff_u8, 0xd9_u8, 0xf5_u8, 0xda_u8, 0x80_u8, 0x5c_u8, 0x31_u8])
    def query_interface(this : IWdsTransportNamespaceScheduledCastManualStart*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportNamespaceScheduledCastManualStart*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportNamespaceScheduledCastManualStart*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportNamespaceScheduledCastManualStart*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportNamespaceScheduledCastManualStart*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportNamespaceScheduledCastManualStart*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportNamespaceScheduledCastManualStart*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IWdsTransportNamespaceScheduledCastManualStart*, pType : Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IWdsTransportNamespaceScheduledCastManualStart*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_Name(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def put_Name(this : IWdsTransportNamespaceScheduledCastManualStart*, bszName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bszName)
    end
    def get_FriendlyName(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbszFriendlyName)
    end
    def put_FriendlyName(this : IWdsTransportNamespaceScheduledCastManualStart*, bszFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FriendlyName.call(this, bszFriendlyName)
    end
    def get_Description(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbszDescription)
    end
    def put_Description(this : IWdsTransportNamespaceScheduledCastManualStart*, bszDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bszDescription)
    end
    def get_ContentProvider(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszContentProvider : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentProvider.call(this, pbszContentProvider)
    end
    def put_ContentProvider(this : IWdsTransportNamespaceScheduledCastManualStart*, bszContentProvider : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ContentProvider.call(this, bszContentProvider)
    end
    def get_Configuration(this : IWdsTransportNamespaceScheduledCastManualStart*, pbszConfiguration : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Configuration.call(this, pbszConfiguration)
    end
    def put_Configuration(this : IWdsTransportNamespaceScheduledCastManualStart*, bszConfiguration : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Configuration.call(this, bszConfiguration)
    end
    def get_Registered(this : IWdsTransportNamespaceScheduledCastManualStart*, pbRegistered : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Registered.call(this, pbRegistered)
    end
    def get_Tombstoned(this : IWdsTransportNamespaceScheduledCastManualStart*, pbTombstoned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tombstoned.call(this, pbTombstoned)
    end
    def get_TombstoneTime(this : IWdsTransportNamespaceScheduledCastManualStart*, pTombstoneTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TombstoneTime.call(this, pTombstoneTime)
    end
    def get_TransmissionStarted(this : IWdsTransportNamespaceScheduledCastManualStart*, pbTransmissionStarted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStarted.call(this, pbTransmissionStarted)
    end
    def register(this : IWdsTransportNamespaceScheduledCastManualStart*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this)
    end
    def deregister(this : IWdsTransportNamespaceScheduledCastManualStart*, bTerminateSessions : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deregister.call(this, bTerminateSessions)
    end
    def clone(this : IWdsTransportNamespaceScheduledCastManualStart*, ppWdsTransportNamespaceClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppWdsTransportNamespaceClone)
    end
    def refresh(this : IWdsTransportNamespaceScheduledCastManualStart*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def retrieve_contents(this : IWdsTransportNamespaceScheduledCastManualStart*, ppWdsTransportContents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_contents.call(this, ppWdsTransportContents)
    end
    def start_transmission(this : IWdsTransportNamespaceScheduledCastManualStart*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_transmission.call(this)
    end

  end

  @[Extern]
  record IWdsTransportNamespaceScheduledCastAutoStartVtbl,
    query_interface : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32),
    release : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32),
    get_type_info_count : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FriendlyName : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ContentProvider : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ContentProvider : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Configuration : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Configuration : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Registered : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16*, Win32cr::Foundation::HRESULT),
    get_Tombstoned : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16*, Win32cr::Foundation::HRESULT),
    get_TombstoneTime : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStarted : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16*, Win32cr::Foundation::HRESULT),
    register : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::HRESULT),
    deregister : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Int16, Win32cr::Foundation::HRESULT),
    clone : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::HRESULT),
    retrieve_contents : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Void**, Win32cr::Foundation::HRESULT),
    start_transmission : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Win32cr::Foundation::HRESULT),
    get_MinimumClients : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MinimumClients : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, UInt32, Win32cr::Foundation::HRESULT),
    get_StartTime : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Float64*, Win32cr::Foundation::HRESULT),
    put_StartTime : Proc(IWdsTransportNamespaceScheduledCastAutoStart*, Float64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportNamespaceScheduledCastAutoStart, lpVtbl : IWdsTransportNamespaceScheduledCastAutoStartVtbl* do
    GUID = LibC::GUID.new(0xd606af3d_u32, 0xea9c_u16, 0x4219_u16, StaticArray[0x96_u8, 0x1e_u8, 0x74_u8, 0x91_u8, 0xd6_u8, 0x18_u8, 0xd9_u8, 0xb9_u8])
    def query_interface(this : IWdsTransportNamespaceScheduledCastAutoStart*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportNamespaceScheduledCastAutoStart*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportNamespaceScheduledCastAutoStart*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportNamespaceScheduledCastAutoStart*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportNamespaceScheduledCastAutoStart*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportNamespaceScheduledCastAutoStart*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportNamespaceScheduledCastAutoStart*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IWdsTransportNamespaceScheduledCastAutoStart*, pType : Win32cr::System::DeploymentServices::WDSTRANSPORT_NAMESPACE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IWdsTransportNamespaceScheduledCastAutoStart*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_Name(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def put_Name(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bszName)
    end
    def get_FriendlyName(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbszFriendlyName)
    end
    def put_FriendlyName(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FriendlyName.call(this, bszFriendlyName)
    end
    def get_Description(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbszDescription)
    end
    def put_Description(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bszDescription)
    end
    def get_ContentProvider(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszContentProvider : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentProvider.call(this, pbszContentProvider)
    end
    def put_ContentProvider(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszContentProvider : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ContentProvider.call(this, bszContentProvider)
    end
    def get_Configuration(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbszConfiguration : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Configuration.call(this, pbszConfiguration)
    end
    def put_Configuration(this : IWdsTransportNamespaceScheduledCastAutoStart*, bszConfiguration : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Configuration.call(this, bszConfiguration)
    end
    def get_Registered(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbRegistered : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Registered.call(this, pbRegistered)
    end
    def get_Tombstoned(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbTombstoned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tombstoned.call(this, pbTombstoned)
    end
    def get_TombstoneTime(this : IWdsTransportNamespaceScheduledCastAutoStart*, pTombstoneTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TombstoneTime.call(this, pTombstoneTime)
    end
    def get_TransmissionStarted(this : IWdsTransportNamespaceScheduledCastAutoStart*, pbTransmissionStarted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStarted.call(this, pbTransmissionStarted)
    end
    def register(this : IWdsTransportNamespaceScheduledCastAutoStart*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this)
    end
    def deregister(this : IWdsTransportNamespaceScheduledCastAutoStart*, bTerminateSessions : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deregister.call(this, bTerminateSessions)
    end
    def clone(this : IWdsTransportNamespaceScheduledCastAutoStart*, ppWdsTransportNamespaceClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppWdsTransportNamespaceClone)
    end
    def refresh(this : IWdsTransportNamespaceScheduledCastAutoStart*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def retrieve_contents(this : IWdsTransportNamespaceScheduledCastAutoStart*, ppWdsTransportContents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_contents.call(this, ppWdsTransportContents)
    end
    def start_transmission(this : IWdsTransportNamespaceScheduledCastAutoStart*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_transmission.call(this)
    end
    def get_MinimumClients(this : IWdsTransportNamespaceScheduledCastAutoStart*, pulMinimumClients : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinimumClients.call(this, pulMinimumClients)
    end
    def put_MinimumClients(this : IWdsTransportNamespaceScheduledCastAutoStart*, ulMinimumClients : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinimumClients.call(this, ulMinimumClients)
    end
    def get_StartTime(this : IWdsTransportNamespaceScheduledCastAutoStart*, pStartTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartTime.call(this, pStartTime)
    end
    def put_StartTime(this : IWdsTransportNamespaceScheduledCastAutoStart*, start_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartTime.call(this, start_time)
    end

  end

  @[Extern]
  record IWdsTransportContentVtbl,
    query_interface : Proc(IWdsTransportContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportContent*, UInt32),
    release : Proc(IWdsTransportContent*, UInt32),
    get_type_info_count : Proc(IWdsTransportContent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportContent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportContent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportContent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Namespace : Proc(IWdsTransportContent*, Void**, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportContent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportContent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    retrieve_sessions : Proc(IWdsTransportContent*, Void**, Win32cr::Foundation::HRESULT),
    terminate : Proc(IWdsTransportContent*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportContent, lpVtbl : IWdsTransportContentVtbl* do
    GUID = LibC::GUID.new(0xd405d711_u32, 0x296_u16, 0x4ab4_u16, StaticArray[0xa8_u8, 0x60_u8, 0xac_u8, 0x7d_u8, 0x32_u8, 0xe6_u8, 0x57_u8, 0x98_u8])
    def query_interface(this : IWdsTransportContent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportContent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportContent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportContent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportContent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportContent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportContent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Namespace(this : IWdsTransportContent*, ppWdsTransportNamespace : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Namespace.call(this, ppWdsTransportNamespace)
    end
    def get_Id(this : IWdsTransportContent*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_Name(this : IWdsTransportContent*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def retrieve_sessions(this : IWdsTransportContent*, ppWdsTransportSessions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_sessions.call(this, ppWdsTransportSessions)
    end
    def terminate(this : IWdsTransportContent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this)
    end

  end

  @[Extern]
  record IWdsTransportSessionVtbl,
    query_interface : Proc(IWdsTransportSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportSession*, UInt32),
    release : Proc(IWdsTransportSession*, UInt32),
    get_type_info_count : Proc(IWdsTransportSession*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportSession*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportSession*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportSession*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Content : Proc(IWdsTransportSession*, Void**, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportSession*, UInt32*, Win32cr::Foundation::HRESULT),
    get_NetworkInterfaceName : Proc(IWdsTransportSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_NetworkInterfaceAddress : Proc(IWdsTransportSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TransferRate : Proc(IWdsTransportSession*, UInt32*, Win32cr::Foundation::HRESULT),
    get_MasterClientId : Proc(IWdsTransportSession*, UInt32*, Win32cr::Foundation::HRESULT),
    retrieve_clients : Proc(IWdsTransportSession*, Void**, Win32cr::Foundation::HRESULT),
    terminate : Proc(IWdsTransportSession*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportSession, lpVtbl : IWdsTransportSessionVtbl* do
    GUID = LibC::GUID.new(0xf4efea88_u32, 0x65b1_u16, 0x4f30_u16, StaticArray[0xa4_u8, 0xb9_u8, 0x27_u8, 0x93_u8, 0x98_u8, 0x77_u8, 0x96_u8, 0xfb_u8])
    def query_interface(this : IWdsTransportSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportSession*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportSession*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportSession*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportSession*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Content(this : IWdsTransportSession*, ppWdsTransportContent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Content.call(this, ppWdsTransportContent)
    end
    def get_Id(this : IWdsTransportSession*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_NetworkInterfaceName(this : IWdsTransportSession*, pbszNetworkInterfaceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkInterfaceName.call(this, pbszNetworkInterfaceName)
    end
    def get_NetworkInterfaceAddress(this : IWdsTransportSession*, pbszNetworkInterfaceAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkInterfaceAddress.call(this, pbszNetworkInterfaceAddress)
    end
    def get_TransferRate(this : IWdsTransportSession*, pulTransferRate : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransferRate.call(this, pulTransferRate)
    end
    def get_MasterClientId(this : IWdsTransportSession*, pulMasterClientId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MasterClientId.call(this, pulMasterClientId)
    end
    def retrieve_clients(this : IWdsTransportSession*, ppWdsTransportClients : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_clients.call(this, ppWdsTransportClients)
    end
    def terminate(this : IWdsTransportSession*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this)
    end

  end

  @[Extern]
  record IWdsTransportClientVtbl,
    query_interface : Proc(IWdsTransportClient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportClient*, UInt32),
    release : Proc(IWdsTransportClient*, UInt32),
    get_type_info_count : Proc(IWdsTransportClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportClient*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportClient*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportClient*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IWdsTransportClient*, Void**, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWdsTransportClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MacAddress : Proc(IWdsTransportClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IpAddress : Proc(IWdsTransportClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PercentCompletion : Proc(IWdsTransportClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_JoinDuration : Proc(IWdsTransportClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CpuUtilization : Proc(IWdsTransportClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_MemoryUtilization : Proc(IWdsTransportClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_NetworkUtilization : Proc(IWdsTransportClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_UserIdentity : Proc(IWdsTransportClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IWdsTransportClient*, Win32cr::System::DeploymentServices::WDSTRANSPORT_DISCONNECT_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportClient, lpVtbl : IWdsTransportClientVtbl* do
    GUID = LibC::GUID.new(0xb5dbc93a_u32, 0xcabe_u16, 0x46ca_u16, StaticArray[0x83_u8, 0x7f_u8, 0x3e_u8, 0x44_u8, 0xe9_u8, 0x3c_u8, 0x65_u8, 0x45_u8])
    def query_interface(this : IWdsTransportClient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportClient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportClient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportClient*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportClient*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportClient*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportClient*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IWdsTransportClient*, ppWdsTransportSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppWdsTransportSession)
    end
    def get_Id(this : IWdsTransportClient*, pulId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pulId)
    end
    def get_Name(this : IWdsTransportClient*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def get_MacAddress(this : IWdsTransportClient*, pbszMacAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MacAddress.call(this, pbszMacAddress)
    end
    def get_IpAddress(this : IWdsTransportClient*, pbszIpAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpAddress.call(this, pbszIpAddress)
    end
    def get_PercentCompletion(this : IWdsTransportClient*, pulPercentCompletion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PercentCompletion.call(this, pulPercentCompletion)
    end
    def get_JoinDuration(this : IWdsTransportClient*, pulJoinDuration : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JoinDuration.call(this, pulJoinDuration)
    end
    def get_CpuUtilization(this : IWdsTransportClient*, pulCpuUtilization : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CpuUtilization.call(this, pulCpuUtilization)
    end
    def get_MemoryUtilization(this : IWdsTransportClient*, pulMemoryUtilization : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MemoryUtilization.call(this, pulMemoryUtilization)
    end
    def get_NetworkUtilization(this : IWdsTransportClient*, pulNetworkUtilization : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkUtilization.call(this, pulNetworkUtilization)
    end
    def get_UserIdentity(this : IWdsTransportClient*, pbszUserIdentity : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserIdentity.call(this, pbszUserIdentity)
    end
    def disconnect(this : IWdsTransportClient*, disconnection_type : Win32cr::System::DeploymentServices::WDSTRANSPORT_DISCONNECT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this, disconnection_type)
    end

  end

  @[Extern]
  record IWdsTransportTftpClientVtbl,
    query_interface : Proc(IWdsTransportTftpClient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportTftpClient*, UInt32),
    release : Proc(IWdsTransportTftpClient*, UInt32),
    get_type_info_count : Proc(IWdsTransportTftpClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportTftpClient*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportTftpClient*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportTftpClient*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FileName : Proc(IWdsTransportTftpClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IpAddress : Proc(IWdsTransportTftpClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Timeout : Proc(IWdsTransportTftpClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentFileOffset : Proc(IWdsTransportTftpClient*, UInt64*, Win32cr::Foundation::HRESULT),
    get_FileSize : Proc(IWdsTransportTftpClient*, UInt64*, Win32cr::Foundation::HRESULT),
    get_BlockSize : Proc(IWdsTransportTftpClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_WindowSize : Proc(IWdsTransportTftpClient*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportTftpClient, lpVtbl : IWdsTransportTftpClientVtbl* do
    GUID = LibC::GUID.new(0xb022d3ae_u32, 0x884d_u16, 0x4d85_u16, StaticArray[0xb1_u8, 0x46_u8, 0x53_u8, 0x32_u8, 0xe_u8, 0x76_u8, 0xef_u8, 0x62_u8])
    def query_interface(this : IWdsTransportTftpClient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportTftpClient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportTftpClient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportTftpClient*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportTftpClient*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportTftpClient*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportTftpClient*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_FileName(this : IWdsTransportTftpClient*, pbszFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileName.call(this, pbszFileName)
    end
    def get_IpAddress(this : IWdsTransportTftpClient*, pbszIpAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpAddress.call(this, pbszIpAddress)
    end
    def get_Timeout(this : IWdsTransportTftpClient*, pulTimeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Timeout.call(this, pulTimeout)
    end
    def get_CurrentFileOffset(this : IWdsTransportTftpClient*, pul64CurrentOffset : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFileOffset.call(this, pul64CurrentOffset)
    end
    def get_FileSize(this : IWdsTransportTftpClient*, pul64FileSize : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileSize.call(this, pul64FileSize)
    end
    def get_BlockSize(this : IWdsTransportTftpClient*, pulBlockSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BlockSize.call(this, pulBlockSize)
    end
    def get_WindowSize(this : IWdsTransportTftpClient*, pulWindowSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowSize.call(this, pulWindowSize)
    end

  end

  @[Extern]
  record IWdsTransportContentProviderVtbl,
    query_interface : Proc(IWdsTransportContentProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWdsTransportContentProvider*, UInt32),
    release : Proc(IWdsTransportContentProvider*, UInt32),
    get_type_info_count : Proc(IWdsTransportContentProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWdsTransportContentProvider*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWdsTransportContentProvider*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWdsTransportContentProvider*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWdsTransportContentProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWdsTransportContentProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FilePath : Proc(IWdsTransportContentProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_InitializationRoutine : Proc(IWdsTransportContentProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWdsTransportContentProvider, lpVtbl : IWdsTransportContentProviderVtbl* do
    GUID = LibC::GUID.new(0xb9489f24_u32, 0xf219_u16, 0x4acf_u16, StaticArray[0xaa_u8, 0xd7_u8, 0x26_u8, 0x5c_u8, 0x7c_u8, 0x8_u8, 0xa6_u8, 0xae_u8])
    def query_interface(this : IWdsTransportContentProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWdsTransportContentProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWdsTransportContentProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWdsTransportContentProvider*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWdsTransportContentProvider*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWdsTransportContentProvider*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWdsTransportContentProvider*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IWdsTransportContentProvider*, pbszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbszName)
    end
    def get_Description(this : IWdsTransportContentProvider*, pbszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbszDescription)
    end
    def get_FilePath(this : IWdsTransportContentProvider*, pbszFilePath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FilePath.call(this, pbszFilePath)
    end
    def get_InitializationRoutine(this : IWdsTransportContentProvider*, pbszInitializationRoutine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitializationRoutine.call(this, pbszInitializationRoutine)
    end

  end

  @[Link("wdsclientapi")]
  @[Link("wdspxe")]
  @[Link("wdsmc")]
  @[Link("wdstptc")]
  @[Link("wdsbp")]
  lib C
    fun WdsCliClose(handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun WdsCliRegisterTrace(pfn : Win32cr::System::DeploymentServices::PFN_WdsCliTraceFunction) : Win32cr::Foundation::HRESULT

    fun WdsCliFreeStringArray(ppwszArray : Win32cr::Foundation::PWSTR*, ulCount : UInt32) : Win32cr::Foundation::HRESULT

    fun WdsCliFindFirstImage(hSession : Win32cr::Foundation::HANDLE, phFindHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WdsCliFindNextImage(handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun WdsCliGetEnumerationFlags(handle : Win32cr::Foundation::HANDLE, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageHandleFromFindHandle(find_handle : Win32cr::Foundation::HANDLE, phImageHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageHandleFromTransferHandle(hTransfer : Win32cr::Foundation::HANDLE, phImageHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WdsCliCreateSession(pwszServer : Win32cr::Foundation::PWSTR, pCred : Win32cr::System::DeploymentServices::WDS_CLI_CRED*, phSession : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WdsCliAuthorizeSession(hSession : Win32cr::Foundation::HANDLE, pCred : Win32cr::System::DeploymentServices::WDS_CLI_CRED*) : Win32cr::Foundation::HRESULT

    fun WdsCliInitializeLog(hSession : Win32cr::Foundation::HANDLE, ulClientArchitecture : Win32cr::System::DeploymentServices::CPU_ARCHITECTURE, pwszClientId : Win32cr::Foundation::PWSTR, pwszClientAddress : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun WdsCliLog(hSession : Win32cr::Foundation::HANDLE, ulLogLevel : UInt32, ulMessageCode : UInt32) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageName(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageDescription(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageType(hIfh : Win32cr::Foundation::HANDLE, pImageType : Win32cr::System::DeploymentServices::WDS_CLI_IMAGE_TYPE*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageFiles(hIfh : Win32cr::Foundation::HANDLE, pppwszFiles : Win32cr::Foundation::PWSTR**, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageLanguage(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageLanguages(hIfh : Win32cr::Foundation::HANDLE, pppszValues : Int8***, pdwNumValues : UInt32*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageVersion(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImagePath(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageIndex(hIfh : Win32cr::Foundation::HANDLE, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageArchitecture(hIfh : Win32cr::Foundation::HANDLE, pdwValue : Win32cr::System::DeploymentServices::CPU_ARCHITECTURE*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageLastModifiedTime(hIfh : Win32cr::Foundation::HANDLE, ppSysTimeValue : Win32cr::Foundation::SYSTEMTIME**) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageSize(hIfh : Win32cr::Foundation::HANDLE, pullValue : UInt64*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageHalName(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageGroup(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageNamespace(hIfh : Win32cr::Foundation::HANDLE, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetImageParameter(hIfh : Win32cr::Foundation::HANDLE, param_type : Win32cr::System::DeploymentServices::WDS_CLI_IMAGE_PARAM_TYPE, pResponse : Void*, uResponseLen : UInt32) : Win32cr::Foundation::HRESULT

    fun WdsCliGetTransferSize(hIfh : Win32cr::Foundation::HANDLE, pullValue : UInt64*) : Win32cr::Foundation::HRESULT

    fun WdsCliSetTransferBufferSize(ulSizeInBytes : UInt32) : Void

    fun WdsCliTransferImage(hImage : Win32cr::Foundation::HANDLE, pwszLocalPath : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwReserved : UInt32, pfnWdsCliCallback : Win32cr::System::DeploymentServices::PFN_WdsCliCallback, pvUserData : Void*, phTransfer : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WdsCliTransferFile(pwszServer : Win32cr::Foundation::PWSTR, pwszNamespace : Win32cr::Foundation::PWSTR, pwszRemoteFilePath : Win32cr::Foundation::PWSTR, pwszLocalFilePath : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwReserved : UInt32, pfnWdsCliCallback : Win32cr::System::DeploymentServices::PFN_WdsCliCallback, pvUserData : Void*, phTransfer : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WdsCliCancelTransfer(hTransfer : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun WdsCliWaitForTransfer(hTransfer : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun WdsCliObtainDriverPackages(hImage : Win32cr::Foundation::HANDLE, ppwszServerName : Win32cr::Foundation::PWSTR*, pppwszDriverPackages : Win32cr::Foundation::PWSTR**, pulCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun WdsCliObtainDriverPackagesEx(hSession : Win32cr::Foundation::HANDLE, pwszMachineInfo : Win32cr::Foundation::PWSTR, ppwszServerName : Win32cr::Foundation::PWSTR*, pppwszDriverPackages : Win32cr::Foundation::PWSTR**, pulCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun WdsCliGetDriverQueryXml(pwszWinDirPath : Win32cr::Foundation::PWSTR, ppwszDriverQuery : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PxeProviderRegister(pszProviderName : Win32cr::Foundation::PWSTR, pszModulePath : Win32cr::Foundation::PWSTR, index : UInt32, bIsCritical : Win32cr::Foundation::BOOL, phProviderKey : Win32cr::System::Registry::HKEY*) : UInt32

    fun PxeProviderUnRegister(pszProviderName : Win32cr::Foundation::PWSTR) : UInt32

    fun PxeProviderQueryIndex(pszProviderName : Win32cr::Foundation::PWSTR, puIndex : UInt32*) : UInt32

    fun PxeProviderEnumFirst(phEnum : Win32cr::Foundation::HANDLE*) : UInt32

    fun PxeProviderEnumNext(hEnum : Win32cr::Foundation::HANDLE, ppProvider : Win32cr::System::DeploymentServices::PXE_PROVIDER**) : UInt32

    fun PxeProviderEnumClose(hEnum : Win32cr::Foundation::HANDLE) : UInt32

    fun PxeProviderFreeInfo(pProvider : Win32cr::System::DeploymentServices::PXE_PROVIDER*) : UInt32

    fun PxeRegisterCallback(hProvider : Win32cr::Foundation::HANDLE, callback_type : UInt32, pCallbackFunction : Void*, pContext : Void*) : UInt32

    fun PxeSendReply(hClientRequest : Win32cr::Foundation::HANDLE, pPacket : Void*, uPacketLen : UInt32, pAddress : Win32cr::System::DeploymentServices::PXE_ADDRESS*) : UInt32

    fun PxeAsyncRecvDone(hClientRequest : Win32cr::Foundation::HANDLE, action : UInt32) : UInt32

    fun PxeTrace(hProvider : Win32cr::Foundation::HANDLE, severity : UInt32, pszFormat : Win32cr::Foundation::PWSTR) : UInt32

    fun PxeTraceV(hProvider : Win32cr::Foundation::HANDLE, severity : UInt32, pszFormat : Win32cr::Foundation::PWSTR, params : Int8*) : UInt32

    fun PxePacketAllocate(hProvider : Win32cr::Foundation::HANDLE, hClientRequest : Win32cr::Foundation::HANDLE, uSize : UInt32) : Void*

    fun PxePacketFree(hProvider : Win32cr::Foundation::HANDLE, hClientRequest : Win32cr::Foundation::HANDLE, pPacket : Void*) : UInt32

    fun PxeProviderSetAttribute(hProvider : Win32cr::Foundation::HANDLE, attribute : UInt32, pParameterBuffer : Void*, uParamLen : UInt32) : UInt32

    fun PxeDhcpInitialize(pRecvPacket : Void*, uRecvPacketLen : UInt32, pReplyPacket : Void*, uMaxReplyPacketLen : UInt32, puReplyPacketLen : UInt32*) : UInt32

    fun PxeDhcpv6Initialize(pRequest : Void*, cbRequest : UInt32, pReply : Void*, cbReply : UInt32, pcbReplyUsed : UInt32*) : UInt32

    fun PxeDhcpAppendOption(pReplyPacket : Void*, uMaxReplyPacketLen : UInt32, puReplyPacketLen : UInt32*, bOption : UInt8, bOptionLen : UInt8, pValue : Void*) : UInt32

    fun PxeDhcpv6AppendOption(pReply : Void*, cbReply : UInt32, pcbReplyUsed : UInt32*, wOptionType : UInt16, cbOption : UInt16, pOption : Void*) : UInt32

    fun PxeDhcpAppendOptionRaw(pReplyPacket : Void*, uMaxReplyPacketLen : UInt32, puReplyPacketLen : UInt32*, uBufferLen : UInt16, pBuffer : Void*) : UInt32

    fun PxeDhcpv6AppendOptionRaw(pReply : Void*, cbReply : UInt32, pcbReplyUsed : UInt32*, cbBuffer : UInt16, pBuffer : Void*) : UInt32

    fun PxeDhcpIsValid(pPacket : Void*, uPacketLen : UInt32, bRequestPacket : Win32cr::Foundation::BOOL, pbPxeOptionPresent : Win32cr::Foundation::BOOL*) : UInt32

    fun PxeDhcpv6IsValid(pPacket : Void*, uPacketLen : UInt32, bRequestPacket : Win32cr::Foundation::BOOL, pbPxeOptionPresent : Win32cr::Foundation::BOOL*) : UInt32

    fun PxeDhcpGetOptionValue(pPacket : Void*, uPacketLen : UInt32, uInstance : UInt32, bOption : UInt8, pbOptionLen : UInt8*, ppOptionValue : Void**) : UInt32

    fun PxeDhcpv6GetOptionValue(pPacket : Void*, uPacketLen : UInt32, uInstance : UInt32, wOption : UInt16, pwOptionLen : UInt16*, ppOptionValue : Void**) : UInt32

    fun PxeDhcpGetVendorOptionValue(pPacket : Void*, uPacketLen : UInt32, bOption : UInt8, uInstance : UInt32, pbOptionLen : UInt8*, ppOptionValue : Void**) : UInt32

    fun PxeDhcpv6GetVendorOptionValue(pPacket : Void*, uPacketLen : UInt32, dwEnterpriseNumber : UInt32, wOption : UInt16, uInstance : UInt32, pwOptionLen : UInt16*, ppOptionValue : Void**) : UInt32

    fun PxeDhcpv6ParseRelayForw(pRelayForwPacket : Void*, uRelayForwPacketLen : UInt32, pRelayMessages : Win32cr::System::DeploymentServices::PXE_DHCPV6_NESTED_RELAY_MESSAGE*, nRelayMessages : UInt32, pnRelayMessages : UInt32*, ppInnerPacket : UInt8**, pcbInnerPacket : UInt32*) : UInt32

    fun PxeDhcpv6CreateRelayRepl(pRelayMessages : Win32cr::System::DeploymentServices::PXE_DHCPV6_NESTED_RELAY_MESSAGE*, nRelayMessages : UInt32, pInnerPacket : UInt8*, cbInnerPacket : UInt32, pReplyBuffer : Void*, cbReplyBuffer : UInt32, pcbReplyBuffer : UInt32*) : UInt32

    fun PxeGetServerInfo(uInfoType : UInt32, pBuffer : Void*, uBufferLen : UInt32) : UInt32

    fun PxeGetServerInfoEx(uInfoType : UInt32, pBuffer : Void*, uBufferLen : UInt32, puBufferUsed : UInt32*) : UInt32

    fun WdsTransportServerRegisterCallback(hProvider : Win32cr::Foundation::HANDLE, callback_id : Win32cr::System::DeploymentServices::TRANSPORTPROVIDER_CALLBACK_ID, pfnCallback : Void*) : Win32cr::Foundation::HRESULT

    fun WdsTransportServerCompleteRead(hProvider : Win32cr::Foundation::HANDLE, ulBytesRead : UInt32, pvUserData : Void*, hReadResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT

    fun WdsTransportServerTrace(hProvider : Win32cr::Foundation::HANDLE, severity : UInt32, pwszFormat : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun WdsTransportServerTraceV(hProvider : Win32cr::Foundation::HANDLE, severity : UInt32, pwszFormat : Win32cr::Foundation::PWSTR, params : Int8*) : Win32cr::Foundation::HRESULT

    fun WdsTransportServerAllocateBuffer(hProvider : Win32cr::Foundation::HANDLE, ulBufferSize : UInt32) : Void*

    fun WdsTransportServerFreeBuffer(hProvider : Win32cr::Foundation::HANDLE, pvBuffer : Void*) : Win32cr::Foundation::HRESULT

    fun WdsTransportClientInitialize : UInt32

    fun WdsTransportClientInitializeSession(pSessionRequest : Win32cr::System::DeploymentServices::WDS_TRANSPORTCLIENT_REQUEST*, pCallerData : Void*, hSessionKey : Win32cr::Foundation::HANDLE*) : UInt32

    fun WdsTransportClientRegisterCallback(hSessionKey : Win32cr::Foundation::HANDLE, callback_id : Win32cr::System::DeploymentServices::TRANSPORTCLIENT_CALLBACK_ID, pfnCallback : Void*) : UInt32

    fun WdsTransportClientStartSession(hSessionKey : Win32cr::Foundation::HANDLE) : UInt32

    fun WdsTransportClientCompleteReceive(hSessionKey : Win32cr::Foundation::HANDLE, ulSize : UInt32, pullOffset : Win32cr::Foundation::ULARGE_INTEGER*) : UInt32

    fun WdsTransportClientCancelSession(hSessionKey : Win32cr::Foundation::HANDLE) : UInt32

    fun WdsTransportClientCancelSessionEx(hSessionKey : Win32cr::Foundation::HANDLE, dwErrorCode : UInt32) : UInt32

    fun WdsTransportClientWaitForCompletion(hSessionKey : Win32cr::Foundation::HANDLE, uTimeout : UInt32) : UInt32

    fun WdsTransportClientQueryStatus(hSessionKey : Win32cr::Foundation::HANDLE, puStatus : UInt32*, puErrorCode : UInt32*) : UInt32

    fun WdsTransportClientCloseSession(hSessionKey : Win32cr::Foundation::HANDLE) : UInt32

    fun WdsTransportClientAddRefBuffer(pvBuffer : Void*) : UInt32

    fun WdsTransportClientReleaseBuffer(pvBuffer : Void*) : UInt32

    fun WdsTransportClientShutdown : UInt32

    fun WdsBpParseInitialize(pPacket : Void*, uPacketLen : UInt32, pbPacketType : UInt8*, phHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun WdsBpParseInitializev6(pPacket : Void*, uPacketLen : UInt32, pbPacketType : UInt8*, phHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun WdsBpInitialize(bPacketType : UInt8, phHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun WdsBpCloseHandle(hHandle : Win32cr::Foundation::HANDLE) : UInt32

    fun WdsBpQueryOption(hHandle : Win32cr::Foundation::HANDLE, uOption : UInt32, uValueLen : UInt32, pValue : Void*, puBytes : UInt32*) : UInt32

    fun WdsBpAddOption(hHandle : Win32cr::Foundation::HANDLE, uOption : UInt32, uValueLen : UInt32, pValue : Void*) : UInt32

    fun WdsBpGetOptionBuffer(hHandle : Win32cr::Foundation::HANDLE, uBufferLen : UInt32, pBuffer : Void*, puBytes : UInt32*) : UInt32

  end
end