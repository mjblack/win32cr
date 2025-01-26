require "./../networking/win_sock.cr"
require "./../foundation.cr"
require "./ndis.cr"
require "./../system/io.cr"

module Win32cr::NetworkManagement::QoS
  alias LPM_HANDLE = LibC::IntPtrT
  alias RHANDLE = LibC::IntPtrT
  alias PALLOCMEM = Proc(UInt32, Void*)

  alias PFREEMEM = Proc(Void*, Void)

  alias CBADMITRESULT = Proc(Win32cr::NetworkManagement::QoS::LPM_HANDLE, Win32cr::NetworkManagement::QoS::RHANDLE, UInt32, Int32, Int32, Win32cr::NetworkManagement::QoS::Policy_decision*, UInt32*)

  alias CBGETRSVPOBJECTS = Proc(Win32cr::NetworkManagement::QoS::LPM_HANDLE, Win32cr::NetworkManagement::QoS::RHANDLE, Int32, Int32, Win32cr::NetworkManagement::QoS::RsvpObjHdr**, UInt32*)

  alias TCI_NOTIFY_HANDLER = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, UInt32, Win32cr::Foundation::HANDLE, UInt32, Void*, Void)

  alias TCI_ADD_FLOW_COMPLETE_HANDLER = Proc(Win32cr::Foundation::HANDLE, UInt32, Void)

  alias TCI_MOD_FLOW_COMPLETE_HANDLER = Proc(Win32cr::Foundation::HANDLE, UInt32, Void)

  alias TCI_DEL_FLOW_COMPLETE_HANDLER = Proc(Win32cr::Foundation::HANDLE, UInt32, Void)

  QOS_MAX_OBJECT_STRING_LENGTH = 256_u32
  QOS_TRAFFIC_GENERAL_ID_BASE = 4000_u32
  SERVICETYPE_NOTRAFFIC = 0_u32
  SERVICETYPE_BESTEFFORT = 1_u32
  SERVICETYPE_CONTROLLEDLOAD = 2_u32
  SERVICETYPE_GUARANTEED = 3_u32
  SERVICETYPE_NETWORK_UNAVAILABLE = 4_u32
  SERVICETYPE_GENERAL_INFORMATION = 5_u32
  SERVICETYPE_NOCHANGE = 6_u32
  SERVICETYPE_NONCONFORMING = 9_u32
  SERVICETYPE_NETWORK_CONTROL = 10_u32
  SERVICETYPE_QUALITATIVE = 13_u32
  SERVICE_BESTEFFORT = 2147549184_u32
  SERVICE_CONTROLLEDLOAD = 2147614720_u32
  SERVICE_GUARANTEED = 2147745792_u32
  SERVICE_QUALITATIVE = 2149580800_u32
  SERVICE_NO_TRAFFIC_CONTROL = 2164260864_u32
  SERVICE_NO_QOS_SIGNALING = 1073741824_u32
  QOS_NOT_SPECIFIED = 4294967295_u32
  POSITIVE_INFINITY_RATE = 4294967294_u32
  QOS_GENERAL_ID_BASE = 2000_u32
  TC_NONCONF_BORROW = 0_u32
  TC_NONCONF_SHAPE = 1_u32
  TC_NONCONF_DISCARD = 2_u32
  TC_NONCONF_BORROW_PLUS = 3_u32
  Class_null = 0_u32
  Class_session = 1_u32
  Class_session_group = 2_u32
  Class_rsvp_hop = 3_u32
  Class_integrity = 4_u32
  Class_time_values = 5_u32
  Class_error_spec = 6_u32
  Class_scope = 7_u32
  Class_style = 8_u32
  Class_flowspec = 9_u32
  Class_is_flowspec = 9_u32
  Class_filter_spec = 10_u32
  Class_sender_template = 11_u32
  Class_sender_tspec = 12_u32
  Class_adspec = 13_u32
  Class_policy_data = 14_u32
  Class_confirm = 15_u32
  Class_max = 15_u32
  Ctype_session_ipv4 = 1_u32
  Ctype_session_ipv4gpi = 3_u32
  SESSFLG_E_Police = 1_u32
  Ctype_rsvp_hop_ipv4 = 1_u32
  Opt_Share_mask = 24_u32
  Opt_Distinct = 8_u32
  Opt_Shared = 16_u32
  Opt_SndSel_mask = 7_u32
  Opt_Wildcard = 1_u32
  Opt_Explicit = 2_u32
  Ctype_style = 1_u32
  Ctype_filter_spec_ipv4 = 1_u32
  Ctype_filter_spec_ipv4gpi = 4_u32
  Ctype_sender_template_ipv4 = 1_u32
  Ctype_sender_template_ipv4gpi = 4_u32
  Ctype_scope_list_ipv4 = 1_u32
  Ctype_error_spec_ipv4 = 1_u32
  ERROR_SPECF_InPlace = 1_u32
  ERROR_SPECF_NotGuilty = 2_u32
  ERR_FORWARD_OK = 32768_u32
  ERR_Usage_globl = 0_u32
  ERR_Usage_local = 16_u32
  ERR_Usage_serv = 17_u32
  ERR_global_mask = 4095_u32
  Ctype_policy_data = 1_u32
  GENERAL_INFO = 1_u32
  GUARANTEED_SERV = 2_u32
  PREDICTIVE_SERV = 3_u32
  CONTROLLED_DELAY_SERV = 4_u32
  CONTROLLED_LOAD_SERV = 5_u32
  QUALITATIVE_SERV = 6_u32
  INTSERV_VERS_MASK = 240_u32
  INTSERV_VERSION0 = 0_u32
  ISSH_BREAK_BIT = 128_u32
  ISPH_FLG_INV = 128_u32
  Ctype_sender_tspec = 2_u32
  Ctype_flowspec_intserv0 = 2_u32
  Ctype_adspec_intserv = 2_u32
  RSVP_PATH = 1_u32
  RSVP_RESV = 2_u32
  RSVP_PATH_ERR = 3_u32
  RSVP_RESV_ERR = 4_u32
  RSVP_PATH_TEAR = 5_u32
  RSVP_RESV_TEAR = 6_u32
  RSVP_Err_NONE = 0_u32
  RSVP_Erv_Nonev = 0_u32
  RSVP_Err_ADMISSION = 1_u32
  RSVP_Erv_Other = 0_u32
  RSVP_Erv_DelayBnd = 1_u32
  RSVP_Erv_Bandwidth = 2_u32
  RSVP_Erv_MTU = 3_u32
  RSVP_Erv_Flow_Rate = 32769_u32
  RSVP_Erv_Bucket_szie = 32770_u32
  RSVP_Erv_Peak_Rate = 32771_u32
  RSVP_Erv_Min_Policied_size = 32772_u32
  RSVP_Err_POLICY = 2_u32
  POLICY_ERRV_NO_MORE_INFO = 1_u32
  POLICY_ERRV_UNSUPPORTED_CREDENTIAL_TYPE = 2_u32
  POLICY_ERRV_INSUFFICIENT_PRIVILEGES = 3_u32
  POLICY_ERRV_EXPIRED_CREDENTIALS = 4_u32
  POLICY_ERRV_IDENTITY_CHANGED = 5_u32
  POLICY_ERRV_UNKNOWN = 0_u32
  POLICY_ERRV_GLOBAL_DEF_FLOW_COUNT = 1_u32
  POLICY_ERRV_GLOBAL_GRP_FLOW_COUNT = 2_u32
  POLICY_ERRV_GLOBAL_USER_FLOW_COUNT = 3_u32
  POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_COUNT = 4_u32
  POLICY_ERRV_SUBNET_DEF_FLOW_COUNT = 5_u32
  POLICY_ERRV_SUBNET_GRP_FLOW_COUNT = 6_u32
  POLICY_ERRV_SUBNET_USER_FLOW_COUNT = 7_u32
  POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_COUNT = 8_u32
  POLICY_ERRV_GLOBAL_DEF_FLOW_DURATION = 9_u32
  POLICY_ERRV_GLOBAL_GRP_FLOW_DURATION = 10_u32
  POLICY_ERRV_GLOBAL_USER_FLOW_DURATION = 11_u32
  POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_DURATION = 12_u32
  POLICY_ERRV_SUBNET_DEF_FLOW_DURATION = 13_u32
  POLICY_ERRV_SUBNET_GRP_FLOW_DURATION = 14_u32
  POLICY_ERRV_SUBNET_USER_FLOW_DURATION = 15_u32
  POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_DURATION = 16_u32
  POLICY_ERRV_GLOBAL_DEF_FLOW_RATE = 17_u32
  POLICY_ERRV_GLOBAL_GRP_FLOW_RATE = 18_u32
  POLICY_ERRV_GLOBAL_USER_FLOW_RATE = 19_u32
  POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_RATE = 20_u32
  POLICY_ERRV_SUBNET_DEF_FLOW_RATE = 21_u32
  POLICY_ERRV_SUBNET_GRP_FLOW_RATE = 22_u32
  POLICY_ERRV_SUBNET_USER_FLOW_RATE = 23_u32
  POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_RATE = 24_u32
  POLICY_ERRV_GLOBAL_DEF_PEAK_RATE = 25_u32
  POLICY_ERRV_GLOBAL_GRP_PEAK_RATE = 26_u32
  POLICY_ERRV_GLOBAL_USER_PEAK_RATE = 27_u32
  POLICY_ERRV_GLOBAL_UNAUTH_USER_PEAK_RATE = 28_u32
  POLICY_ERRV_SUBNET_DEF_PEAK_RATE = 29_u32
  POLICY_ERRV_SUBNET_GRP_PEAK_RATE = 30_u32
  POLICY_ERRV_SUBNET_USER_PEAK_RATE = 31_u32
  POLICY_ERRV_SUBNET_UNAUTH_USER_PEAK_RATE = 32_u32
  POLICY_ERRV_GLOBAL_DEF_SUM_FLOW_RATE = 33_u32
  POLICY_ERRV_GLOBAL_GRP_SUM_FLOW_RATE = 34_u32
  POLICY_ERRV_GLOBAL_USER_SUM_FLOW_RATE = 35_u32
  POLICY_ERRV_GLOBAL_UNAUTH_USER_SUM_FLOW_RATE = 36_u32
  POLICY_ERRV_SUBNET_DEF_SUM_FLOW_RATE = 37_u32
  POLICY_ERRV_SUBNET_GRP_SUM_FLOW_RATE = 38_u32
  POLICY_ERRV_SUBNET_USER_SUM_FLOW_RATE = 39_u32
  POLICY_ERRV_SUBNET_UNAUTH_USER_SUM_FLOW_RATE = 40_u32
  POLICY_ERRV_GLOBAL_DEF_SUM_PEAK_RATE = 41_u32
  POLICY_ERRV_GLOBAL_GRP_SUM_PEAK_RATE = 42_u32
  POLICY_ERRV_GLOBAL_USER_SUM_PEAK_RATE = 43_u32
  POLICY_ERRV_GLOBAL_UNAUTH_USER_SUM_PEAK_RATE = 44_u32
  POLICY_ERRV_SUBNET_DEF_SUM_PEAK_RATE = 45_u32
  POLICY_ERRV_SUBNET_GRP_SUM_PEAK_RATE = 46_u32
  POLICY_ERRV_SUBNET_USER_SUM_PEAK_RATE = 47_u32
  POLICY_ERRV_SUBNET_UNAUTH_USER_SUM_PEAK_RATE = 48_u32
  POLICY_ERRV_UNKNOWN_USER = 49_u32
  POLICY_ERRV_NO_PRIVILEGES = 50_u32
  POLICY_ERRV_EXPIRED_USER_TOKEN = 51_u32
  POLICY_ERRV_NO_RESOURCES = 52_u32
  POLICY_ERRV_PRE_EMPTED = 53_u32
  POLICY_ERRV_USER_CHANGED = 54_u32
  POLICY_ERRV_NO_ACCEPTS = 55_u32
  POLICY_ERRV_NO_MEMORY = 56_u32
  POLICY_ERRV_CRAZY_FLOWSPEC = 57_u32
  RSVP_Err_NO_PATH = 3_u32
  RSVP_Err_NO_SENDER = 4_u32
  RSVP_Err_BAD_STYLE = 5_u32
  RSVP_Err_UNKNOWN_STYLE = 6_u32
  RSVP_Err_BAD_DSTPORT = 7_u32
  RSVP_Err_BAD_SNDPORT = 8_u32
  RSVP_Err_AMBIG_FILTER = 9_u32
  RSVP_Err_PREEMPTED = 12_u32
  RSVP_Err_UNKN_OBJ_CLASS = 13_u32
  RSVP_Err_UNKNOWN_CTYPE = 14_u32
  RSVP_Err_API_ERROR = 20_u32
  RSVP_Err_TC_ERROR = 21_u32
  RSVP_Erv_Conflict_Serv = 1_u32
  RSVP_Erv_No_Serv = 2_u32
  RSVP_Erv_Crazy_Flowspec = 3_u32
  RSVP_Erv_Crazy_Tspec = 4_u32
  RSVP_Err_TC_SYS_ERROR = 22_u32
  RSVP_Err_RSVP_SYS_ERROR = 23_u32
  RSVP_Erv_MEMORY = 1_u32
  RSVP_Erv_API = 2_u32
  LPM_PE_USER_IDENTITY = 2_u32
  LPM_PE_APP_IDENTITY = 3_u32
  ERROR_NO_MORE_INFO = 1_u32
  UNSUPPORTED_CREDENTIAL_TYPE = 2_u32
  INSUFFICIENT_PRIVILEGES = 3_u32
  EXPIRED_CREDENTIAL = 4_u32
  IDENTITY_CHANGED = 5_u32
  LPM_OK = 0_u32
  INV_LPM_HANDLE = 1_u32
  LPM_TIME_OUT = 2_u32
  INV_REQ_HANDLE = 3_u32
  DUP_RESULTS = 4_u32
  INV_RESULTS = 5_u32
  LPM_PE_ALL_TYPES = 0_u32
  LPM_API_VERSION_1 = 1_u32
  PCM_VERSION_1 = 1_u32
  LPV_RESERVED = 0_u32
  LPV_MIN_PRIORITY = 1_u32
  LPV_MAX_PRIORITY = 65280_u32
  LPV_DROP_MSG = 65533_u32
  LPV_DONT_CARE = 65534_u32
  LPV_REJECT = 65535_u32
  FORCE_IMMEDIATE_REFRESH = 1_u32
  LPM_RESULT_READY = 0_u32
  LPM_RESULT_DEFER = 1_u32
  RCVD_PATH_TEAR = 1_u32
  RCVD_RESV_TEAR = 2_u32
  ADM_CTRL_FAILED = 3_u32
  STATE_TIMEOUT = 4_u32
  FLOW_DURATION = 5_u32
  RESOURCES_ALLOCATED = 1_u32
  RESOURCES_MODIFIED = 2_u32
  CURRENT_TCI_VERSION = 2_u32
  TC_NOTIFY_IFC_UP = 1_u32
  TC_NOTIFY_IFC_CLOSE = 2_u32
  TC_NOTIFY_IFC_CHANGE = 3_u32
  TC_NOTIFY_PARAM_CHANGED = 4_u32
  TC_NOTIFY_FLOW_CLOSE = 5_u32
  MAX_STRING_LENGTH = 256_u32
  QOS_OUTGOING_DEFAULT_MINIMUM_BANDWIDTH = 4294967295_u32
  QOS_QUERYFLOW_FRESH = 1_u32
  QOS_NON_ADAPTIVE_FLOW = 2_u32
  RSVP_OBJECT_ID_BASE = 1000_u32
  RSVP_DEFAULT_STYLE = 0_u32
  RSVP_WILDCARD_STYLE = 1_u32
  RSVP_FIXED_FILTER_STYLE = 2_u32
  RSVP_SHARED_EXPLICIT_STYLE = 3_u32
  AD_FLAG_BREAK_BIT = 1_u32
  Mioc_in = 2147483648_u32
  Mioc_out = 1073741824_u32
  Mioc_vendor = 67108864_u32
  Mcompany = 402653184_u32
  Ioctl_code = 1_u32
  QOSSPBASE = 50000_u32
  ALLOWED_TO_SEND_DATA = 50001_u32
  ABLE_TO_RECV_RSVP = 50002_u32
  LINE_RATE = 50003_u32
  LOCAL_TRAFFIC_CONTROL = 50004_u32
  LOCAL_QOSABILITY = 50005_u32
  END_TO_END_QOSABILITY = 50006_u32
  INFO_NOT_AVAILABLE = 4294967295_u32
  ANY_DEST_ADDR = 4294967295_u32
  MODERATELY_DELAY_SENSITIVE = 4294967293_u32
  HIGHLY_DELAY_SENSITIVE = 4294967294_u32
  QOSSP_ERR_BASE = 56000_u32
  GQOS_NO_ERRORCODE = 0_u32
  GQOS_NO_ERRORVALUE = 0_u32
  GQOS_ERRORCODE_UNKNOWN = 4294967295_u32
  GQOS_ERRORVALUE_UNKNOWN = 4294967295_u32
  GQOS_NET_ADMISSION = 56100_u32
  GQOS_NET_POLICY = 56200_u32
  GQOS_RSVP = 56300_u32
  GQOS_API = 56400_u32
  GQOS_KERNEL_TC_SYS = 56500_u32
  GQOS_RSVP_SYS = 56600_u32
  GQOS_KERNEL_TC = 56700_u32
  PE_TYPE_APPID = 3_u32
  PE_ATTRIB_TYPE_POLICY_LOCATOR = 1_u32
  POLICY_LOCATOR_SUB_TYPE_ASCII_DN = 1_u32
  POLICY_LOCATOR_SUB_TYPE_UNICODE_DN = 2_u32
  POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC = 3_u32
  POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC = 4_u32
  PE_ATTRIB_TYPE_CREDENTIAL = 2_u32
  CREDENTIAL_SUB_TYPE_ASCII_ID = 1_u32
  CREDENTIAL_SUB_TYPE_UNICODE_ID = 2_u32
  CREDENTIAL_SUB_TYPE_KERBEROS_TKT = 3_u32
  CREDENTIAL_SUB_TYPE_X509_V3_CERT = 4_u32
  CREDENTIAL_SUB_TYPE_PGP_CERT = 5_u32
  TCBASE = 7500_u32
  ERROR_INCOMPATIBLE_TCI_VERSION = 7501_u32
  ERROR_INVALID_SERVICE_TYPE = 7502_u32
  ERROR_INVALID_TOKEN_RATE = 7503_u32
  ERROR_INVALID_PEAK_RATE = 7504_u32
  ERROR_INVALID_SD_MODE = 7505_u32
  ERROR_INVALID_QOS_PRIORITY = 7506_u32
  ERROR_INVALID_TRAFFIC_CLASS = 7507_u32
  ERROR_INVALID_ADDRESS_TYPE = 7508_u32
  ERROR_DUPLICATE_FILTER = 7509_u32
  ERROR_FILTER_CONFLICT = 7510_u32
  ERROR_ADDRESS_TYPE_NOT_SUPPORTED = 7511_u32
  ERROR_TC_SUPPORTED_OBJECTS_EXIST = 7512_u32
  ERROR_INCOMPATABLE_QOS = 7513_u32
  ERROR_TC_NOT_SUPPORTED = 7514_u32
  ERROR_TC_OBJECT_LENGTH_INVALID = 7515_u32
  ERROR_INVALID_FLOW_MODE = 7516_u32
  ERROR_INVALID_DIFFSERV_FLOW = 7517_u32
  ERROR_DS_MAPPING_EXISTS = 7518_u32
  ERROR_INVALID_SHAPE_RATE = 7519_u32
  ERROR_INVALID_DS_CLASS = 7520_u32
  ERROR_TOO_MANY_CLIENTS = 7521_u32
  GUID_QOS_REMAINING_BANDWIDTH = "c4c51720-40ec-11d1-2c91-00aa00574915"
  GUID_QOS_BESTEFFORT_BANDWIDTH = "ed885290-40ec-11d1-2c91-00aa00574915"
  GUID_QOS_LATENCY = "fc408ef0-40ec-11d1-2c91-00aa00574915"
  GUID_QOS_FLOW_COUNT = "1147f880-40ed-11d1-2c91-00aa00574915"
  GUID_QOS_NON_BESTEFFORT_LIMIT = "185c44e0-40ed-11d1-2c91-00aa00574915"
  GUID_QOS_MAX_OUTSTANDING_SENDS = "161ffa86-6120-11d1-2c91-00aa00574915"
  GUID_QOS_STATISTICS_BUFFER = "bb2c0980-e900-11d1-b07e-0080c71382bf"
  GUID_QOS_FLOW_MODE = "5c82290a-515a-11d2-8e58-00c04fc9bfcb"
  GUID_QOS_ISSLOW_FLOW = "abf273a4-ee07-11d2-be1b-00a0c99ee63b"
  GUID_QOS_TIMER_RESOLUTION = "ba10cc88-f13e-11d2-be1b-00a0c99ee63b"
  GUID_QOS_FLOW_IP_CONFORMING = "07f99a8b-fcd2-11d2-be1e-00a0c99ee63b"
  GUID_QOS_FLOW_IP_NONCONFORMING = "087a5987-fcd2-11d2-be1e-00a0c99ee63b"
  GUID_QOS_FLOW_8021P_CONFORMING = "08c1e013-fcd2-11d2-be1e-00a0c99ee63b"
  GUID_QOS_FLOW_8021P_NONCONFORMING = "09023f91-fcd2-11d2-be1e-00a0c99ee63b"
  GUID_QOS_ENABLE_AVG_STATS = "bafb6d11-27c4-4801-a46f-ef8080c188c8"
  GUID_QOS_ENABLE_WINDOW_ADJUSTMENT = "aa966725-d3e9-4c55-b335-2a00279a1e64"
  FSCTL_TCP_BASE = 18_u32
  DD_TCP_DEVICE_NAME = "\\Device\\Tcp"
  IF_MIB_STATS_ID = 1_u32
  IP_MIB_STATS_ID = 1_u32
  IP_MIB_ADDRTABLE_ENTRY_ID = 258_u32
  IP_INTFC_INFO_ID = 259_u32
  MAX_PHYSADDR_SIZE = 8_u32
  SIPAEV_PREBOOT_CERT = 0_u32
  SIPAEV_POST_CODE = 1_u32
  SIPAEV_UNUSED = 2_u32
  SIPAEV_NO_ACTION = 3_u32
  SIPAEV_SEPARATOR = 4_u32
  SIPAEV_ACTION = 5_u32
  SIPAEV_EVENT_TAG = 6_u32
  SIPAEV_S_CRTM_CONTENTS = 7_u32
  SIPAEV_S_CRTM_VERSION = 8_u32
  SIPAEV_CPU_MICROCODE = 9_u32
  SIPAEV_PLATFORM_CONFIG_FLAGS = 10_u32
  SIPAEV_TABLE_OF_DEVICES = 11_u32
  SIPAEV_COMPACT_HASH = 12_u32
  SIPAEV_IPL = 13_u32
  SIPAEV_IPL_PARTITION_DATA = 14_u32
  SIPAEV_NONHOST_CODE = 15_u32
  SIPAEV_NONHOST_CONFIG = 16_u32
  SIPAEV_NONHOST_INFO = 17_u32
  SIPAEV_OMIT_BOOT_DEVICE_EVENTS = 18_u32
  SIPAEV_EFI_EVENT_BASE = 2147483648_u32
  SIPAEV_EFI_VARIABLE_DRIVER_CONFIG = 2147483649_u32
  SIPAEV_EFI_VARIABLE_BOOT = 2147483650_u32
  SIPAEV_EFI_BOOT_SERVICES_APPLICATION = 2147483651_u32
  SIPAEV_EFI_BOOT_SERVICES_DRIVER = 2147483652_u32
  SIPAEV_EFI_RUNTIME_SERVICES_DRIVER = 2147483653_u32
  SIPAEV_EFI_GPT_EVENT = 2147483654_u32
  SIPAEV_EFI_ACTION = 2147483655_u32
  SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB = 2147483656_u32
  SIPAEV_EFI_HANDOFF_TABLES = 2147483657_u32
  SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB2 = 2147483658_u32
  SIPAEV_EFI_HANDOFF_TABLES2 = 2147483659_u32
  SIPAEV_EFI_HCRTM_EVENT = 2147483664_u32
  SIPAEV_EFI_VARIABLE_AUTHORITY = 2147483872_u32
  SIPAEV_EFI_SPDM_FIRMWARE_BLOB = 2147483873_u32
  SIPAEV_EFI_SPDM_FIRMWARE_CONFIG = 2147483874_u32
  SIPAEV_TXT_EVENT_BASE = 1024_u32
  SIPAEV_TXT_PCR_MAPPING = 1025_u32
  SIPAEV_TXT_HASH_START = 1026_u32
  SIPAEV_TXT_COMBINED_HASH = 1027_u32
  SIPAEV_TXT_MLE_HASH = 1028_u32
  SIPAEV_TXT_BIOSAC_REG_DATA = 1034_u32
  SIPAEV_TXT_CPU_SCRTM_STAT = 1035_u32
  SIPAEV_TXT_LCP_CONTROL_HASH = 1036_u32
  SIPAEV_TXT_ELEMENTS_HASH = 1037_u32
  SIPAEV_TXT_STM_HASH = 1038_u32
  SIPAEV_TXT_OSSINITDATA_CAP_HASH = 1039_u32
  SIPAEV_TXT_SINIT_PUBKEY_HASH = 1040_u32
  SIPAEV_TXT_LCP_HASH = 1041_u32
  SIPAEV_TXT_LCP_DETAILS_HASH = 1042_u32
  SIPAEV_TXT_LCP_AUTHORITIES_HASH = 1043_u32
  SIPAEV_TXT_NV_INFO_HASH = 1044_u32
  SIPAEV_TXT_COLD_BOOT_BIOS_HASH = 1045_u32
  SIPAEV_TXT_KM_HASH = 1046_u32
  SIPAEV_TXT_BPM_HASH = 1047_u32
  SIPAEV_TXT_KM_INFO_HASH = 1048_u32
  SIPAEV_TXT_BPM_INFO_HASH = 1049_u32
  SIPAEV_TXT_BOOT_POL_HASH = 1050_u32
  SIPAEV_TXT_RANDOM_VALUE = 1278_u32
  SIPAEV_TXT_CAP_VALUE = 1279_u32
  SIPAEV_AMD_SL_EVENT_BASE = 32768_u32
  SIPAEV_AMD_SL_LOAD = 32769_u32
  SIPAEV_AMD_SL_PSP_FW_SPLT = 32770_u32
  SIPAEV_AMD_SL_TSME_RB_FUSE = 32771_u32
  SIPAEV_AMD_SL_PUB_KEY = 32772_u32
  SIPAEV_AMD_SL_SVN = 32773_u32
  SIPAEV_AMD_SL_LOAD_1 = 32774_u32
  SIPAEV_AMD_SL_SEPARATOR = 32775_u32
  SIPAEVENTTYPE_NONMEASURED = 2147483648_u32
  SIPAEVENTTYPE_AGGREGATION = 1073741824_u32
  SIPAEVENTTYPE_CONTAINER = 65536_u32
  SIPAEVENTTYPE_INFORMATION = 131072_u32
  SIPAEVENTTYPE_ERROR = 196608_u32
  SIPAEVENTTYPE_PREOSPARAMETER = 262144_u32
  SIPAEVENTTYPE_OSPARAMETER = 327680_u32
  SIPAEVENTTYPE_AUTHORITY = 393216_u32
  SIPAEVENTTYPE_LOADEDMODULE = 458752_u32
  SIPAEVENTTYPE_TRUSTPOINT = 524288_u32
  SIPAEVENTTYPE_ELAM = 589824_u32
  SIPAEVENTTYPE_VBS = 655360_u32
  SIPAEVENTTYPE_KSR = 720896_u32
  SIPAEVENTTYPE_DRTM = 786432_u32
  SIPAERROR_FIRMWAREFAILURE = 196609_u32
  SIPAERROR_INTERNALFAILURE = 196611_u32
  SIPAEVENT_INFORMATION = 131073_u32
  SIPAEVENT_BOOTCOUNTER = 131074_u32
  SIPAEVENT_TRANSFER_CONTROL = 131075_u32
  SIPAEVENT_APPLICATION_RETURN = 131076_u32
  SIPAEVENT_BITLOCKER_UNLOCK = 131077_u32
  SIPAEVENT_EVENTCOUNTER = 131078_u32
  SIPAEVENT_COUNTERID = 131079_u32
  SIPAEVENT_MORBIT_NOT_CANCELABLE = 131080_u32
  SIPAEVENT_APPLICATION_SVN = 131081_u32
  SIPAEVENT_SVN_CHAIN_STATUS = 131082_u32
  SIPAEVENT_MORBIT_API_STATUS = 131083_u32
  SIPAEVENT_BOOTDEBUGGING = 262145_u32
  SIPAEVENT_BOOT_REVOCATION_LIST = 262146_u32
  SIPAEVENT_OSKERNELDEBUG = 327681_u32
  SIPAEVENT_CODEINTEGRITY = 327682_u32
  SIPAEVENT_TESTSIGNING = 327683_u32
  SIPAEVENT_DATAEXECUTIONPREVENTION = 327684_u32
  SIPAEVENT_SAFEMODE = 327685_u32
  SIPAEVENT_WINPE = 327686_u32
  SIPAEVENT_PHYSICALADDRESSEXTENSION = 327687_u32
  SIPAEVENT_OSDEVICE = 327688_u32
  SIPAEVENT_SYSTEMROOT = 327689_u32
  SIPAEVENT_HYPERVISOR_LAUNCH_TYPE = 327690_u32
  SIPAEVENT_HYPERVISOR_PATH = 327691_u32
  SIPAEVENT_HYPERVISOR_IOMMU_POLICY = 327692_u32
  SIPAEVENT_HYPERVISOR_DEBUG = 327693_u32
  SIPAEVENT_DRIVER_LOAD_POLICY = 327694_u32
  SIPAEVENT_SI_POLICY = 327695_u32
  SIPAEVENT_HYPERVISOR_MMIO_NX_POLICY = 327696_u32
  SIPAEVENT_HYPERVISOR_MSR_FILTER_POLICY = 327697_u32
  SIPAEVENT_VSM_LAUNCH_TYPE = 327698_u32
  SIPAEVENT_OS_REVOCATION_LIST = 327699_u32
  SIPAEVENT_SMT_STATUS = 327700_u32
  SIPAEVENT_VSM_IDK_INFO = 327712_u32
  SIPAEVENT_FLIGHTSIGNING = 327713_u32
  SIPAEVENT_PAGEFILE_ENCRYPTION_ENABLED = 327714_u32
  SIPAEVENT_VSM_IDKS_INFO = 327715_u32
  SIPAEVENT_HIBERNATION_DISABLED = 327716_u32
  SIPAEVENT_DUMPS_DISABLED = 327717_u32
  SIPAEVENT_DUMP_ENCRYPTION_ENABLED = 327718_u32
  SIPAEVENT_DUMP_ENCRYPTION_KEY_DIGEST = 327719_u32
  SIPAEVENT_LSAISO_CONFIG = 327720_u32
  SIPAEVENT_SBCP_INFO = 327721_u32
  SIPAEVENT_HYPERVISOR_BOOT_DMA_PROTECTION = 327728_u32
  SIPAEVENT_NOAUTHORITY = 393217_u32
  SIPAEVENT_AUTHORITYPUBKEY = 393218_u32
  SIPAEVENT_FILEPATH = 458753_u32
  SIPAEVENT_IMAGESIZE = 458754_u32
  SIPAEVENT_HASHALGORITHMID = 458755_u32
  SIPAEVENT_AUTHENTICODEHASH = 458756_u32
  SIPAEVENT_AUTHORITYISSUER = 458757_u32
  SIPAEVENT_AUTHORITYSERIAL = 458758_u32
  SIPAEVENT_IMAGEBASE = 458759_u32
  SIPAEVENT_AUTHORITYPUBLISHER = 458760_u32
  SIPAEVENT_AUTHORITYSHA1THUMBPRINT = 458761_u32
  SIPAEVENT_IMAGEVALIDATED = 458762_u32
  SIPAEVENT_MODULE_SVN = 458763_u32
  SIPAEVENT_ELAM_KEYNAME = 589825_u32
  SIPAEVENT_ELAM_CONFIGURATION = 589826_u32
  SIPAEVENT_ELAM_POLICY = 589827_u32
  SIPAEVENT_ELAM_MEASURED = 589828_u32
  SIPAEVENT_VBS_VSM_REQUIRED = 655361_u32
  SIPAEVENT_VBS_SECUREBOOT_REQUIRED = 655362_u32
  SIPAEVENT_VBS_IOMMU_REQUIRED = 655363_u32
  SIPAEVENT_VBS_MMIO_NX_REQUIRED = 655364_u32
  SIPAEVENT_VBS_MSR_FILTERING_REQUIRED = 655365_u32
  SIPAEVENT_VBS_MANDATORY_ENFORCEMENT = 655366_u32
  SIPAEVENT_VBS_HVCI_POLICY = 655367_u32
  SIPAEVENT_VBS_MICROSOFT_BOOT_CHAIN_REQUIRED = 655368_u32
  SIPAEVENT_VBS_DUMP_USES_AMEROOT = 655369_u32
  SIPAEVENT_VBS_VSM_NOSECRETS_ENFORCED = 655370_u32
  SIPAEVENT_KSR_SIGNATURE = 720897_u32
  SIPAEVENT_DRTM_STATE_AUTH = 786433_u32
  SIPAEVENT_DRTM_SMM_LEVEL = 786434_u32
  SIPAEVENT_DRTM_AMD_SMM_HASH = 786435_u32
  SIPAEVENT_DRTM_AMD_SMM_SIGNER_KEY = 786436_u32
  FVEB_UNLOCK_FLAG_NONE = 0_u32
  FVEB_UNLOCK_FLAG_CACHED = 1_u32
  FVEB_UNLOCK_FLAG_MEDIA = 2_u32
  FVEB_UNLOCK_FLAG_TPM = 4_u32
  FVEB_UNLOCK_FLAG_PIN = 16_u32
  FVEB_UNLOCK_FLAG_EXTERNAL = 32_u32
  FVEB_UNLOCK_FLAG_RECOVERY = 64_u32
  FVEB_UNLOCK_FLAG_PASSPHRASE = 128_u32
  FVEB_UNLOCK_FLAG_NBP = 256_u32
  FVEB_UNLOCK_FLAG_AUK_OSFVEINFO = 512_u32
  OSDEVICE_TYPE_UNKNOWN = 0_u32
  OSDEVICE_TYPE_BLOCKIO_HARDDISK = 65537_u32
  OSDEVICE_TYPE_BLOCKIO_REMOVABLEDISK = 65538_u32
  OSDEVICE_TYPE_BLOCKIO_CDROM = 65539_u32
  OSDEVICE_TYPE_BLOCKIO_PARTITION = 65540_u32
  OSDEVICE_TYPE_BLOCKIO_FILE = 65541_u32
  OSDEVICE_TYPE_BLOCKIO_RAMDISK = 65542_u32
  OSDEVICE_TYPE_BLOCKIO_VIRTUALHARDDISK = 65543_u32
  OSDEVICE_TYPE_SERIAL = 131072_u32
  OSDEVICE_TYPE_UDP = 196608_u32
  OSDEVICE_TYPE_VMBUS = 262144_u32
  OSDEVICE_TYPE_COMPOSITE = 327680_u32
  SIPAHDRSIGNATURE = 1279476311_u32
  SIPALOGVERSION = 1_u32
  SIPAKSRHDRSIGNATURE = 1297240907_u32
  WBCL_DIGEST_ALG_ID_SHA_1 = 4_u32
  WBCL_DIGEST_ALG_ID_SHA_2_256 = 11_u32
  WBCL_DIGEST_ALG_ID_SHA_2_384 = 12_u32
  WBCL_DIGEST_ALG_ID_SHA_2_512 = 13_u32
  WBCL_DIGEST_ALG_ID_SM3_256 = 18_u32
  WBCL_DIGEST_ALG_ID_SHA3_256 = 39_u32
  WBCL_DIGEST_ALG_ID_SHA3_384 = 40_u32
  WBCL_DIGEST_ALG_ID_SHA3_512 = 41_u32
  WBCL_DIGEST_ALG_BITMAP_SHA_1 = 1_u32
  WBCL_DIGEST_ALG_BITMAP_SHA_2_256 = 2_u32
  WBCL_DIGEST_ALG_BITMAP_SHA_2_384 = 4_u32
  WBCL_DIGEST_ALG_BITMAP_SHA_2_512 = 8_u32
  WBCL_DIGEST_ALG_BITMAP_SM3_256 = 16_u32
  WBCL_DIGEST_ALG_BITMAP_SHA3_256 = 32_u32
  WBCL_DIGEST_ALG_BITMAP_SHA3_384 = 64_u32
  WBCL_DIGEST_ALG_BITMAP_SHA3_512 = 128_u32
  WBCL_HASH_LEN_SHA1 = 20_u32
  IS_GUAR_RSPEC = 130_i32
  GUAR_ADSPARM_C = 131_i32
  GUAR_ADSPARM_D = 132_i32
  GUAR_ADSPARM_Ctot = 133_i32
  GUAR_ADSPARM_Dtot = 134_i32
  GUAR_ADSPARM_Csum = 135_i32
  GUAR_ADSPARM_Dsum = 136_i32

  enum Int_serv_wkp
    IS_WKP_HOP_CNT = 4_i32
    IS_WKP_PATH_BW = 6_i32
    IS_WKP_MIN_LATENCY = 8_i32
    IS_WKP_COMPOSED_MTU = 10_i32
    IS_WKP_TB_TSPEC = 127_i32
    IS_WKP_Q_TSPEC = 128_i32
  end
  enum QOS_TRAFFIC_TYPE
    QOSTrafficTypeBestEffort = 0_i32
    QOSTrafficTypeBackground = 1_i32
    QOSTrafficTypeExcellentEffort = 2_i32
    QOSTrafficTypeAudioVideo = 3_i32
    QOSTrafficTypeVoice = 4_i32
    QOSTrafficTypeControl = 5_i32
  end
  enum QOS_SET_FLOW
    QOSSetTrafficType = 0_i32
    QOSSetOutgoingRate = 1_i32
    QOSSetOutgoingDSCPValue = 2_i32
  end
  enum QOS_FLOWRATE_REASON
    QOSFlowRateNotApplicable = 0_i32
    QOSFlowRateContentChange = 1_i32
    QOSFlowRateCongestion = 2_i32
    QOSFlowRateHigherContentEncoding = 3_i32
    QOSFlowRateUserCaused = 4_i32
  end
  enum QOS_SHAPING
    QOSShapeOnly = 0_i32
    QOSShapeAndMark = 1_i32
    QOSUseNonConformantMarkings = 2_i32
  end
  enum QOS_QUERY_FLOW
    QOSQueryFlowFundamentals = 0_i32
    QOSQueryPacketPriority = 1_i32
    QOSQueryOutgoingRate = 2_i32
  end
  enum QOS_NOTIFY_FLOW
    QOSNotifyCongested = 0_i32
    QOSNotifyUncongested = 1_i32
    QOSNotifyAvailable = 2_i32
  end
  enum FilterType
    FILTERSPECV4 = 1_i32
    FILTERSPECV6 = 2_i32
    FILTERSPECV6_FLOW = 3_i32
    FILTERSPECV4_GPI = 4_i32
    FILTERSPECV6_GPI = 5_i32
    FILTERSPEC_END = 6_i32
  end

  @[Extern]
  struct QOS_OBJECT_HDR
    property object_type : UInt32
    property object_length : UInt32
    def initialize(@object_type : UInt32, @object_length : UInt32)
    end
  end

  @[Extern]
  struct QOS_SD_MODE
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property shape_discard_mode : UInt32
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @shape_discard_mode : UInt32)
    end
  end

  @[Extern]
  struct QOS_SHAPING_RATE
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property shaping_rate : UInt32
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @shaping_rate : UInt32)
    end
  end

  @[Extern]
  struct RsvpObjHdr
    property obj_length : UInt16
    property obj_class : UInt8
    property obj_ctype : UInt8
    def initialize(@obj_length : UInt16, @obj_class : UInt8, @obj_ctype : UInt8)
    end
  end

  @[Extern]
  struct Session_IPv4
    property sess_destaddr : Win32cr::Networking::WinSock::IN_ADDR
    property sess_protid : UInt8
    property sess_flags : UInt8
    property sess_destport : UInt16
    def initialize(@sess_destaddr : Win32cr::Networking::WinSock::IN_ADDR, @sess_protid : UInt8, @sess_flags : UInt8, @sess_destport : UInt16)
    end
  end

  @[Extern]
  struct RSVP_SESSION
    property sess_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property sess_u : Sess_u_e__union_

    # Nested Type Sess_u_e__union_
    @[Extern(union: true)]
    struct Sess_u_e__union_
    property sess_ipv4 : Win32cr::NetworkManagement::QoS::Session_IPv4
    def initialize(@sess_ipv4 : Win32cr::NetworkManagement::QoS::Session_IPv4)
    end
    end

    def initialize(@sess_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @sess_u : Sess_u_e__union_)
    end
  end

  @[Extern]
  struct Rsvp_Hop_IPv4
    property hop_ipaddr : Win32cr::Networking::WinSock::IN_ADDR
    property hop_LIH : UInt32
    def initialize(@hop_ipaddr : Win32cr::Networking::WinSock::IN_ADDR, @hop_LIH : UInt32)
    end
  end

  @[Extern]
  struct RSVP_HOP
    property hop_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property hop_u : Hop_u_e__union_

    # Nested Type Hop_u_e__union_
    @[Extern(union: true)]
    struct Hop_u_e__union_
    property hop_ipv4 : Win32cr::NetworkManagement::QoS::Rsvp_Hop_IPv4
    def initialize(@hop_ipv4 : Win32cr::NetworkManagement::QoS::Rsvp_Hop_IPv4)
    end
    end

    def initialize(@hop_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @hop_u : Hop_u_e__union_)
    end
  end

  @[Extern]
  struct RESV_STYLE
    property style_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property style_word : UInt32
    def initialize(@style_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @style_word : UInt32)
    end
  end

  @[Extern]
  struct Filter_Spec_IPv4
    property filt_ipaddr : Win32cr::Networking::WinSock::IN_ADDR
    property filt_unused : UInt16
    property filt_port : UInt16
    def initialize(@filt_ipaddr : Win32cr::Networking::WinSock::IN_ADDR, @filt_unused : UInt16, @filt_port : UInt16)
    end
  end

  @[Extern]
  struct Filter_Spec_IPv4GPI
    property filt_ipaddr : Win32cr::Networking::WinSock::IN_ADDR
    property filt_gpi : UInt32
    def initialize(@filt_ipaddr : Win32cr::Networking::WinSock::IN_ADDR, @filt_gpi : UInt32)
    end
  end

  @[Extern]
  struct FILTER_SPEC
    property filt_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property filt_u : Filt_u_e__union_

    # Nested Type Filt_u_e__union_
    @[Extern(union: true)]
    struct Filt_u_e__union_
    property filt_ipv4 : Win32cr::NetworkManagement::QoS::Filter_Spec_IPv4
    property filt_ipv4gpi : Win32cr::NetworkManagement::QoS::Filter_Spec_IPv4GPI
    def initialize(@filt_ipv4 : Win32cr::NetworkManagement::QoS::Filter_Spec_IPv4, @filt_ipv4gpi : Win32cr::NetworkManagement::QoS::Filter_Spec_IPv4GPI)
    end
    end

    def initialize(@filt_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @filt_u : Filt_u_e__union_)
    end
  end

  @[Extern]
  struct Scope_list_ipv4
    property scopl_ipaddr : Win32cr::Networking::WinSock::IN_ADDR*
    def initialize(@scopl_ipaddr : Win32cr::Networking::WinSock::IN_ADDR*)
    end
  end

  @[Extern]
  struct RSVP_SCOPE
    property scopl_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property scope_u : Scope_u_e__union_

    # Nested Type Scope_u_e__union_
    @[Extern(union: true)]
    struct Scope_u_e__union_
    property scopl_ipv4 : Win32cr::NetworkManagement::QoS::Scope_list_ipv4
    def initialize(@scopl_ipv4 : Win32cr::NetworkManagement::QoS::Scope_list_ipv4)
    end
    end

    def initialize(@scopl_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @scope_u : Scope_u_e__union_)
    end
  end

  @[Extern]
  struct Error_Spec_IPv4
    property errs_errnode : Win32cr::Networking::WinSock::IN_ADDR
    property errs_flags : UInt8
    property errs_code : UInt8
    property errs_value : UInt16
    def initialize(@errs_errnode : Win32cr::Networking::WinSock::IN_ADDR, @errs_flags : UInt8, @errs_code : UInt8, @errs_value : UInt16)
    end
  end

  @[Extern]
  struct ERROR_SPEC
    property errs_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property errs_u : Errs_u_e__union_

    # Nested Type Errs_u_e__union_
    @[Extern(union: true)]
    struct Errs_u_e__union_
    property errs_ipv4 : Win32cr::NetworkManagement::QoS::Error_Spec_IPv4
    def initialize(@errs_ipv4 : Win32cr::NetworkManagement::QoS::Error_Spec_IPv4)
    end
    end

    def initialize(@errs_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @errs_u : Errs_u_e__union_)
    end
  end

  @[Extern]
  struct POLICY_DATA
    property policy_obj_hdr : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property usPeOffset : UInt16
    property usReserved : UInt16
    def initialize(@policy_obj_hdr : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @usPeOffset : UInt16, @usReserved : UInt16)
    end
  end

  @[Extern]
  struct POLICY_ELEMENT
    property usPeLength : UInt16
    property usPeType : UInt16
    property ucPeData : UInt8[4]
    def initialize(@usPeLength : UInt16, @usPeType : UInt16, @ucPeData : UInt8[4])
    end
  end

  @[Extern]
  struct IntServMainHdr
    property ismh_version : UInt8
    property ismh_unused : UInt8
    property ismh_len32b : UInt16
    def initialize(@ismh_version : UInt8, @ismh_unused : UInt8, @ismh_len32b : UInt16)
    end
  end

  @[Extern]
  struct IntServServiceHdr
    property issh_service : UInt8
    property issh_flags : UInt8
    property issh_len32b : UInt16
    def initialize(@issh_service : UInt8, @issh_flags : UInt8, @issh_len32b : UInt16)
    end
  end

  @[Extern]
  struct IntServParmHdr
    property isph_parm_num : UInt8
    property isph_flags : UInt8
    property isph_len32b : UInt16
    def initialize(@isph_parm_num : UInt8, @isph_flags : UInt8, @isph_len32b : UInt16)
    end
  end

  @[Extern]
  struct GenTspecParms
    property tb_tspec_r : Float32
    property tb_tspec_b : Float32
    property tb_tspec_p : Float32
    property tb_tspec_m : UInt32
    property tb_tspec_m_ : UInt32
    def initialize(@tb_tspec_r : Float32, @tb_tspec_b : Float32, @tb_tspec_p : Float32, @tb_tspec_m : UInt32, @tb_tspec_m_ : UInt32)
    end
  end

  @[Extern]
  struct GenTspec
    property gen_Tspec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr
    property gen_Tspec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gen_Tspec_parms : Win32cr::NetworkManagement::QoS::GenTspecParms
    def initialize(@gen_Tspec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr, @gen_Tspec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gen_Tspec_parms : Win32cr::NetworkManagement::QoS::GenTspecParms)
    end
  end

  @[Extern]
  struct QualTspecParms
    property tb_tspec_m : UInt32
    def initialize(@tb_tspec_m : UInt32)
    end
  end

  @[Extern]
  struct QualTspec
    property qual_Tspec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr
    property qual_Tspec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property qual_Tspec_parms : Win32cr::NetworkManagement::QoS::QualTspecParms
    def initialize(@qual_Tspec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr, @qual_Tspec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @qual_Tspec_parms : Win32cr::NetworkManagement::QoS::QualTspecParms)
    end
  end

  @[Extern]
  struct QualAppFlowSpec
    property q_spec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr
    property q_spec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property q_spec_parms : Win32cr::NetworkManagement::QoS::QualTspecParms
    def initialize(@q_spec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr, @q_spec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @q_spec_parms : Win32cr::NetworkManagement::QoS::QualTspecParms)
    end
  end

  @[Extern]
  struct IntServTspecBody
    property st_mh : Win32cr::NetworkManagement::QoS::IntServMainHdr
    property tspec_u : Tspec_u_e__union_

    # Nested Type Tspec_u_e__union_
    @[Extern(union: true)]
    struct Tspec_u_e__union_
    property gen_stspec : Win32cr::NetworkManagement::QoS::GenTspec
    property qual_stspec : Win32cr::NetworkManagement::QoS::QualTspec
    def initialize(@gen_stspec : Win32cr::NetworkManagement::QoS::GenTspec, @qual_stspec : Win32cr::NetworkManagement::QoS::QualTspec)
    end
    end

    def initialize(@st_mh : Win32cr::NetworkManagement::QoS::IntServMainHdr, @tspec_u : Tspec_u_e__union_)
    end
  end

  @[Extern]
  struct SENDER_TSPEC
    property stspec_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property stspec_body : Win32cr::NetworkManagement::QoS::IntServTspecBody
    def initialize(@stspec_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @stspec_body : Win32cr::NetworkManagement::QoS::IntServTspecBody)
    end
  end

  @[Extern]
  struct CtrlLoadFlowspec
    property cl_spec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr
    property cl_spec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property cl_spec_parms : Win32cr::NetworkManagement::QoS::GenTspecParms
    def initialize(@cl_spec_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr, @cl_spec_parm_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @cl_spec_parms : Win32cr::NetworkManagement::QoS::GenTspecParms)
    end
  end

  @[Extern]
  struct GuarRspec
    property guar_r : Float32
    property guar_s : UInt32
    def initialize(@guar_r : Float32, @guar_s : UInt32)
    end
  end

  @[Extern]
  struct GuarFlowSpec
    property guar_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr
    property guar_tspec_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property guar_tspec_parms : Win32cr::NetworkManagement::QoS::GenTspecParms
    property guar_rspec_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property guar_rspec : Win32cr::NetworkManagement::QoS::GuarRspec
    def initialize(@guar_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr, @guar_tspec_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @guar_tspec_parms : Win32cr::NetworkManagement::QoS::GenTspecParms, @guar_rspec_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @guar_rspec : Win32cr::NetworkManagement::QoS::GuarRspec)
    end
  end

  @[Extern]
  struct IntServFlowSpec
    property spec_mh : Win32cr::NetworkManagement::QoS::IntServMainHdr
    property spec_u : Spec_u_e__union_

    # Nested Type Spec_u_e__union_
    @[Extern(union: true)]
    struct Spec_u_e__union_
    property cl_spec : Win32cr::NetworkManagement::QoS::CtrlLoadFlowspec
    property g_spec : Win32cr::NetworkManagement::QoS::GuarFlowSpec
    property q_spec : Win32cr::NetworkManagement::QoS::QualAppFlowSpec
    def initialize(@cl_spec : Win32cr::NetworkManagement::QoS::CtrlLoadFlowspec, @g_spec : Win32cr::NetworkManagement::QoS::GuarFlowSpec, @q_spec : Win32cr::NetworkManagement::QoS::QualAppFlowSpec)
    end
    end

    def initialize(@spec_mh : Win32cr::NetworkManagement::QoS::IntServMainHdr, @spec_u : Spec_u_e__union_)
    end
  end

  @[Extern]
  struct IS_FLOWSPEC
    property flow_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property flow_body : Win32cr::NetworkManagement::QoS::IntServFlowSpec
    def initialize(@flow_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @flow_body : Win32cr::NetworkManagement::QoS::IntServFlowSpec)
    end
  end

  @[Extern]
  struct Flow_desc
    property u1 : U1_e__union_
    property u2 : U2_e__union_

    # Nested Type U1_e__union_
    @[Extern(union: true)]
    struct U1_e__union_
    property stspec : Win32cr::NetworkManagement::QoS::SENDER_TSPEC*
    property isflow : Win32cr::NetworkManagement::QoS::IS_FLOWSPEC*
    def initialize(@stspec : Win32cr::NetworkManagement::QoS::SENDER_TSPEC*, @isflow : Win32cr::NetworkManagement::QoS::IS_FLOWSPEC*)
    end
    end


    # Nested Type U2_e__union_
    @[Extern(union: true)]
    struct U2_e__union_
    property stemp : Win32cr::NetworkManagement::QoS::FILTER_SPEC*
    property fspec : Win32cr::NetworkManagement::QoS::FILTER_SPEC*
    def initialize(@stemp : Win32cr::NetworkManagement::QoS::FILTER_SPEC*, @fspec : Win32cr::NetworkManagement::QoS::FILTER_SPEC*)
    end
    end

    def initialize(@u1 : U1_e__union_, @u2 : U2_e__union_)
    end
  end

  @[Extern]
  struct Gads_parms_t
    property gads_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr
    property gads_ctot_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gads_ctot : UInt32
    property gads_dtot_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gads_dtot : UInt32
    property gads_csum_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gads_csum : UInt32
    property gads_dsum_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gads_dsum : UInt32
    def initialize(@gads_serv_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr, @gads_ctot_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gads_ctot : UInt32, @gads_dtot_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gads_dtot : UInt32, @gads_csum_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gads_csum : UInt32, @gads_dsum_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gads_dsum : UInt32)
    end
  end

  @[Extern]
  struct GenAdspecParams
    property gen_parm_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr
    property gen_parm_hopcnt_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gen_parm_hopcnt : UInt32
    property gen_parm_pathbw_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gen_parm_path_bw : Float32
    property gen_parm_minlat_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gen_parm_min_latency : UInt32
    property gen_parm_compmtu_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr
    property gen_parm_composed_MTU : UInt32
    def initialize(@gen_parm_hdr : Win32cr::NetworkManagement::QoS::IntServServiceHdr, @gen_parm_hopcnt_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gen_parm_hopcnt : UInt32, @gen_parm_pathbw_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gen_parm_path_bw : Float32, @gen_parm_minlat_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gen_parm_min_latency : UInt32, @gen_parm_compmtu_hdr : Win32cr::NetworkManagement::QoS::IntServParmHdr, @gen_parm_composed_MTU : UInt32)
    end
  end

  @[Extern]
  struct IS_ADSPEC_BODY
    property adspec_mh : Win32cr::NetworkManagement::QoS::IntServMainHdr
    property adspec_genparms : Win32cr::NetworkManagement::QoS::GenAdspecParams
    def initialize(@adspec_mh : Win32cr::NetworkManagement::QoS::IntServMainHdr, @adspec_genparms : Win32cr::NetworkManagement::QoS::GenAdspecParams)
    end
  end

  @[Extern]
  struct ADSPEC
    property adspec_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr
    property adspec_body : Win32cr::NetworkManagement::QoS::IS_ADSPEC_BODY
    def initialize(@adspec_header : Win32cr::NetworkManagement::QoS::RsvpObjHdr, @adspec_body : Win32cr::NetworkManagement::QoS::IS_ADSPEC_BODY)
    end
  end

  @[Extern]
  struct ID_ERROR_OBJECT
    property usIdErrLength : UInt16
    property ucAType : UInt8
    property ucSubType : UInt8
    property usReserved : UInt16
    property usIdErrorValue : UInt16
    property ucIdErrData : UInt8[4]
    def initialize(@usIdErrLength : UInt16, @ucAType : UInt8, @ucSubType : UInt8, @usReserved : UInt16, @usIdErrorValue : UInt16, @ucIdErrData : UInt8[4])
    end
  end

  @[Extern]
  struct RSVP_MSG_OBJS
    property rsvp_msg_type : Int32
    property pRsvpSession : Win32cr::NetworkManagement::QoS::RSVP_SESSION*
    property pRsvpFromHop : Win32cr::NetworkManagement::QoS::RSVP_HOP*
    property pRsvpToHop : Win32cr::NetworkManagement::QoS::RSVP_HOP*
    property pResvStyle : Win32cr::NetworkManagement::QoS::RESV_STYLE*
    property pRsvpScope : Win32cr::NetworkManagement::QoS::RSVP_SCOPE*
    property flow_desc_count : Int32
    property pFlowDescs : Win32cr::NetworkManagement::QoS::Flow_desc*
    property pd_object_count : Int32
    property ppPdObjects : Win32cr::NetworkManagement::QoS::POLICY_DATA**
    property pErrorSpec : Win32cr::NetworkManagement::QoS::ERROR_SPEC*
    property pAdspec : Win32cr::NetworkManagement::QoS::ADSPEC*
    def initialize(@rsvp_msg_type : Int32, @pRsvpSession : Win32cr::NetworkManagement::QoS::RSVP_SESSION*, @pRsvpFromHop : Win32cr::NetworkManagement::QoS::RSVP_HOP*, @pRsvpToHop : Win32cr::NetworkManagement::QoS::RSVP_HOP*, @pResvStyle : Win32cr::NetworkManagement::QoS::RESV_STYLE*, @pRsvpScope : Win32cr::NetworkManagement::QoS::RSVP_SCOPE*, @flow_desc_count : Int32, @pFlowDescs : Win32cr::NetworkManagement::QoS::Flow_desc*, @pd_object_count : Int32, @ppPdObjects : Win32cr::NetworkManagement::QoS::POLICY_DATA**, @pErrorSpec : Win32cr::NetworkManagement::QoS::ERROR_SPEC*, @pAdspec : Win32cr::NetworkManagement::QoS::ADSPEC*)
    end
  end

  @[Extern]
  struct Policy_decision
    property lpvResult : UInt32
    property wPolicyErrCode : UInt16
    property wPolicyErrValue : UInt16
    def initialize(@lpvResult : UInt32, @wPolicyErrCode : UInt16, @wPolicyErrValue : UInt16)
    end
  end

  @[Extern]
  struct LPM_INIT_INFO
    property pcm_version_number : UInt32
    property result_time_limit : UInt32
    property configured_lpm_count : Int32
    property alloc_memory : Win32cr::NetworkManagement::QoS::PALLOCMEM
    property free_memory : Win32cr::NetworkManagement::QoS::PFREEMEM
    property pcm_admit_result_callback : Win32cr::NetworkManagement::QoS::CBADMITRESULT
    property get_rsvp_objects_callback : Win32cr::NetworkManagement::QoS::CBGETRSVPOBJECTS
    def initialize(@pcm_version_number : UInt32, @result_time_limit : UInt32, @configured_lpm_count : Int32, @alloc_memory : Win32cr::NetworkManagement::QoS::PALLOCMEM, @free_memory : Win32cr::NetworkManagement::QoS::PFREEMEM, @pcm_admit_result_callback : Win32cr::NetworkManagement::QoS::CBADMITRESULT, @get_rsvp_objects_callback : Win32cr::NetworkManagement::QoS::CBGETRSVPOBJECTS)
    end
  end

  @[Extern]
  struct Lpmiptable
    property ulIfIndex : UInt32
    property media_type : UInt32
    property if_ip_addr : Win32cr::Networking::WinSock::IN_ADDR
    property if_net_mask : Win32cr::Networking::WinSock::IN_ADDR
    def initialize(@ulIfIndex : UInt32, @media_type : UInt32, @if_ip_addr : Win32cr::Networking::WinSock::IN_ADDR, @if_net_mask : Win32cr::Networking::WinSock::IN_ADDR)
    end
  end

  @[Extern]
  struct QOS_PACKET_PRIORITY
    property conformant_dscp_value : UInt32
    property non_conformant_dscp_value : UInt32
    property conformant_l2_value : UInt32
    property non_conformant_l2_value : UInt32
    def initialize(@conformant_dscp_value : UInt32, @non_conformant_dscp_value : UInt32, @conformant_l2_value : UInt32, @non_conformant_l2_value : UInt32)
    end
  end

  @[Extern]
  struct QOS_FLOW_FUNDAMENTALS
    property bottleneck_bandwidth_set : Win32cr::Foundation::BOOL
    property bottleneck_bandwidth : UInt64
    property available_bandwidth_set : Win32cr::Foundation::BOOL
    property available_bandwidth : UInt64
    property rtt_set : Win32cr::Foundation::BOOL
    property rtt : UInt32
    def initialize(@bottleneck_bandwidth_set : Win32cr::Foundation::BOOL, @bottleneck_bandwidth : UInt64, @available_bandwidth_set : Win32cr::Foundation::BOOL, @available_bandwidth : UInt64, @rtt_set : Win32cr::Foundation::BOOL, @rtt : UInt32)
    end
  end

  @[Extern]
  struct QOS_FLOWRATE_OUTGOING
    property bandwidth : UInt64
    property shaping_behavior : Win32cr::NetworkManagement::QoS::QOS_SHAPING
    property reason : Win32cr::NetworkManagement::QoS::QOS_FLOWRATE_REASON
    def initialize(@bandwidth : UInt64, @shaping_behavior : Win32cr::NetworkManagement::QoS::QOS_SHAPING, @reason : Win32cr::NetworkManagement::QoS::QOS_FLOWRATE_REASON)
    end
  end

  @[Extern]
  struct QOS_VERSION
    property major_version : UInt16
    property minor_version : UInt16
    def initialize(@major_version : UInt16, @minor_version : UInt16)
    end
  end

  @[Extern]
  struct QOS_FRIENDLY_NAME
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property friendly_name : UInt16[256]
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @friendly_name : UInt16[256])
    end
  end

  @[Extern]
  struct QOS_TRAFFIC_CLASS
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property traffic_class : UInt32
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @traffic_class : UInt32)
    end
  end

  @[Extern]
  struct QOS_DS_CLASS
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property ds_field : UInt32
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @ds_field : UInt32)
    end
  end

  @[Extern]
  struct QOS_DIFFSERV
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property ds_field_count : UInt32
    property diffserv_rule : UInt8*
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @ds_field_count : UInt32, @diffserv_rule : UInt8*)
    end
  end

  @[Extern]
  struct QOS_DIFFSERV_RULE
    property inbound_ds_field : UInt8
    property conforming_outbound_ds_field : UInt8
    property non_conforming_outbound_ds_field : UInt8
    property conforming_user_priority : UInt8
    property non_conforming_user_priority : UInt8
    def initialize(@inbound_ds_field : UInt8, @conforming_outbound_ds_field : UInt8, @non_conforming_outbound_ds_field : UInt8, @conforming_user_priority : UInt8, @non_conforming_user_priority : UInt8)
    end
  end

  @[Extern]
  struct QOS_TCP_TRAFFIC
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR)
    end
  end

  @[Extern]
  struct TCI_CLIENT_FUNC_LIST
    property cl_notify_handler : Win32cr::NetworkManagement::QoS::TCI_NOTIFY_HANDLER
    property cl_add_flow_complete_handler : Win32cr::NetworkManagement::QoS::TCI_ADD_FLOW_COMPLETE_HANDLER
    property cl_modify_flow_complete_handler : Win32cr::NetworkManagement::QoS::TCI_MOD_FLOW_COMPLETE_HANDLER
    property cl_delete_flow_complete_handler : Win32cr::NetworkManagement::QoS::TCI_DEL_FLOW_COMPLETE_HANDLER
    def initialize(@cl_notify_handler : Win32cr::NetworkManagement::QoS::TCI_NOTIFY_HANDLER, @cl_add_flow_complete_handler : Win32cr::NetworkManagement::QoS::TCI_ADD_FLOW_COMPLETE_HANDLER, @cl_modify_flow_complete_handler : Win32cr::NetworkManagement::QoS::TCI_MOD_FLOW_COMPLETE_HANDLER, @cl_delete_flow_complete_handler : Win32cr::NetworkManagement::QoS::TCI_DEL_FLOW_COMPLETE_HANDLER)
    end
  end

  @[Extern]
  struct ADDRESS_LIST_DESCRIPTOR
    property media_type : UInt32
    property address_list : Win32cr::NetworkManagement::Ndis::NETWORK_ADDRESS_LIST
    def initialize(@media_type : UInt32, @address_list : Win32cr::NetworkManagement::Ndis::NETWORK_ADDRESS_LIST)
    end
  end

  @[Extern]
  struct TC_IFC_DESCRIPTOR
    property length : UInt32
    property pInterfaceName : Win32cr::Foundation::PWSTR
    property pInterfaceID : Win32cr::Foundation::PWSTR
    property address_list_desc : Win32cr::NetworkManagement::QoS::ADDRESS_LIST_DESCRIPTOR
    def initialize(@length : UInt32, @pInterfaceName : Win32cr::Foundation::PWSTR, @pInterfaceID : Win32cr::Foundation::PWSTR, @address_list_desc : Win32cr::NetworkManagement::QoS::ADDRESS_LIST_DESCRIPTOR)
    end
  end

  @[Extern]
  struct TC_SUPPORTED_INFO_BUFFER
    property instance_id_length : UInt16
    property instance_id : UInt16[256]
    property interface_luid : UInt64
    property addr_list_desc : Win32cr::NetworkManagement::QoS::ADDRESS_LIST_DESCRIPTOR
    def initialize(@instance_id_length : UInt16, @instance_id : UInt16[256], @interface_luid : UInt64, @addr_list_desc : Win32cr::NetworkManagement::QoS::ADDRESS_LIST_DESCRIPTOR)
    end
  end

  @[Extern]
  struct TC_GEN_FILTER
    property address_type : UInt16
    property pattern_size : UInt32
    property pattern : Void*
    property mask : Void*
    def initialize(@address_type : UInt16, @pattern_size : UInt32, @pattern : Void*, @mask : Void*)
    end
  end

  @[Extern]
  struct TC_GEN_FLOW
    property sending_flowspec : Win32cr::Networking::WinSock::FLOWSPEC
    property receiving_flowspec : Win32cr::Networking::WinSock::FLOWSPEC
    property tc_objects_length : UInt32
    property tc_objects : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR*
    def initialize(@sending_flowspec : Win32cr::Networking::WinSock::FLOWSPEC, @receiving_flowspec : Win32cr::Networking::WinSock::FLOWSPEC, @tc_objects_length : UInt32, @tc_objects : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR*)
    end
  end

  @[Extern]
  struct IP_PATTERN
    property reserved1 : UInt32
    property reserved2 : UInt32
    property src_addr : UInt32
    property dst_addr : UInt32
    property s_un : S_un_e__Union_
    property protocol_id : UInt8
    property reserved3 : UInt8[3]

    # Nested Type S_un_e__Union_
    @[Extern(union: true)]
    struct S_un_e__Union_
    property s_un_ports : S_un_ports_e__Struct_
    property s_un_icmp : S_un_icmp_e__Struct_
    property s_spi : UInt32

      # Nested Type S_un_icmp_e__Struct_
      @[Extern]
      struct S_un_icmp_e__Struct_
    property s_type : UInt8
    property s_code : UInt8
    property filler : UInt16
    def initialize(@s_type : UInt8, @s_code : UInt8, @filler : UInt16)
    end
      end


      # Nested Type S_un_ports_e__Struct_
      @[Extern]
      struct S_un_ports_e__Struct_
    property s_srcport : UInt16
    property s_dstport : UInt16
    def initialize(@s_srcport : UInt16, @s_dstport : UInt16)
    end
      end

    def initialize(@s_un_ports : S_un_ports_e__Struct_, @s_un_icmp : S_un_icmp_e__Struct_, @s_spi : UInt32)
    end
    end

    def initialize(@reserved1 : UInt32, @reserved2 : UInt32, @src_addr : UInt32, @dst_addr : UInt32, @s_un : S_un_e__Union_, @protocol_id : UInt8, @reserved3 : UInt8[3])
    end
  end

  @[Extern]
  struct IPX_PATTERN
    property src : Src_e__Struct_
    property dest : Src_e__Struct_

    # Nested Type Src_e__Struct_
    @[Extern]
    struct Src_e__Struct_
    property network_address : UInt32
    property node_address : UInt8[6]
    property socket : UInt16
    def initialize(@network_address : UInt32, @node_address : UInt8[6], @socket : UInt16)
    end
    end

    def initialize(@src : Src_e__Struct_, @dest : Src_e__Struct_)
    end
  end

  @[Extern]
  struct ENUMERATION_BUFFER
    property length : UInt32
    property owner_process_id : UInt32
    property flow_name_length : UInt16
    property flow_name : UInt16[256]
    property pFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*
    property number_of_filters : UInt32
    property generic_filter : Win32cr::NetworkManagement::QoS::TC_GEN_FILTER*
    def initialize(@length : UInt32, @owner_process_id : UInt32, @flow_name_length : UInt16, @flow_name : UInt16[256], @pFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*, @number_of_filters : UInt32, @generic_filter : Win32cr::NetworkManagement::QoS::TC_GEN_FILTER*)
    end
  end

  @[Extern(union: true)]
  struct IN_ADDR_IPV4
    property addr : UInt32
    property addr_bytes : UInt8[4]
    def initialize(@addr : UInt32, @addr_bytes : UInt8[4])
    end
  end

  @[Extern]
  struct IN_ADDR_IPV6
    property addr : UInt8[16]
    def initialize(@addr : UInt8[16])
    end
  end

  @[Extern]
  struct RSVP_FILTERSPEC_V4
    property address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV4
    property unused : UInt16
    property port : UInt16
    def initialize(@address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV4, @unused : UInt16, @port : UInt16)
    end
  end

  @[Extern]
  struct RSVP_FILTERSPEC_V6
    property address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV6
    property un_used : UInt16
    property port : UInt16
    def initialize(@address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV6, @un_used : UInt16, @port : UInt16)
    end
  end

  @[Extern]
  struct RSVP_FILTERSPEC_V6_FLOW
    property address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV6
    property un_used : UInt8
    property flow_label : UInt8[3]
    def initialize(@address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV6, @un_used : UInt8, @flow_label : UInt8[3])
    end
  end

  @[Extern]
  struct RSVP_FILTERSPEC_V4_GPI
    property address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV4
    property general_port_id : UInt32
    def initialize(@address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV4, @general_port_id : UInt32)
    end
  end

  @[Extern]
  struct RSVP_FILTERSPEC_V6_GPI
    property address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV6
    property general_port_id : UInt32
    def initialize(@address : Win32cr::NetworkManagement::QoS::IN_ADDR_IPV6, @general_port_id : UInt32)
    end
  end

  @[Extern]
  struct RSVP_FILTERSPEC
    property type__ : Win32cr::NetworkManagement::QoS::FilterType
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property filter_spec_v4 : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V4
    property filter_spec_v6 : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V6
    property filter_spec_v6_flow : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V6_FLOW
    property filter_spec_v4_gpi : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V4_GPI
    property filter_spec_v6_gpi : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V6_GPI
    def initialize(@filter_spec_v4 : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V4, @filter_spec_v6 : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V6, @filter_spec_v6_flow : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V6_FLOW, @filter_spec_v4_gpi : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V4_GPI, @filter_spec_v6_gpi : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC_V6_GPI)
    end
    end

    def initialize(@type__ : Win32cr::NetworkManagement::QoS::FilterType, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct FLOWDESCRIPTOR
    property flow_spec : Win32cr::Networking::WinSock::FLOWSPEC
    property num_filters : UInt32
    property filter_list : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC*
    def initialize(@flow_spec : Win32cr::Networking::WinSock::FLOWSPEC, @num_filters : UInt32, @filter_list : Win32cr::NetworkManagement::QoS::RSVP_FILTERSPEC*)
    end
  end

  @[Extern]
  struct RSVP_POLICY
    property len : UInt16
    property type__ : UInt16
    property info : UInt8[4]
    def initialize(@len : UInt16, @type__ : UInt16, @info : UInt8[4])
    end
  end

  @[Extern]
  struct RSVP_POLICY_INFO
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property num_policy_element : UInt32
    property policy_element : Win32cr::NetworkManagement::QoS::RSVP_POLICY*
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @num_policy_element : UInt32, @policy_element : Win32cr::NetworkManagement::QoS::RSVP_POLICY*)
    end
  end

  @[Extern]
  struct RSVP_RESERVE_INFO
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property style : UInt32
    property confirm_request : UInt32
    property policy_element_list : Win32cr::NetworkManagement::QoS::RSVP_POLICY_INFO*
    property num_flow_desc : UInt32
    property flow_desc_list : Win32cr::NetworkManagement::QoS::FLOWDESCRIPTOR*
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @style : UInt32, @confirm_request : UInt32, @policy_element_list : Win32cr::NetworkManagement::QoS::RSVP_POLICY_INFO*, @num_flow_desc : UInt32, @flow_desc_list : Win32cr::NetworkManagement::QoS::FLOWDESCRIPTOR*)
    end
  end

  @[Extern]
  struct RSVP_STATUS_INFO
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property status_code : UInt32
    property extended_status1 : UInt32
    property extended_status2 : UInt32
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @status_code : UInt32, @extended_status1 : UInt32, @extended_status2 : UInt32)
    end
  end

  @[Extern]
  struct QOS_DESTADDR
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property socket_address : Win32cr::Networking::WinSock::SOCKADDR*
    property socket_address_length : UInt32
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @socket_address : Win32cr::Networking::WinSock::SOCKADDR*, @socket_address_length : UInt32)
    end
  end

  @[Extern]
  struct AD_GENERAL_PARAMS
    property int_serv_aware_hop_count : UInt32
    property path_bandwidth_estimate : UInt32
    property minimum_latency : UInt32
    property path_mtu : UInt32
    property flags : UInt32
    def initialize(@int_serv_aware_hop_count : UInt32, @path_bandwidth_estimate : UInt32, @minimum_latency : UInt32, @path_mtu : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  struct AD_GUARANTEED
    property c_total : UInt32
    property d_total : UInt32
    property c_sum : UInt32
    property d_sum : UInt32
    def initialize(@c_total : UInt32, @d_total : UInt32, @c_sum : UInt32, @d_sum : UInt32)
    end
  end

  @[Extern]
  struct PARAM_BUFFER
    property parameter_id : UInt32
    property length : UInt32
    property buffer : UInt8*
    def initialize(@parameter_id : UInt32, @length : UInt32, @buffer : UInt8*)
    end
  end

  @[Extern]
  struct CONTROL_SERVICE
    property length : UInt32
    property service : UInt32
    property overrides : Win32cr::NetworkManagement::QoS::AD_GENERAL_PARAMS
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property guaranteed : Win32cr::NetworkManagement::QoS::AD_GUARANTEED
    property param_buffer : Win32cr::NetworkManagement::QoS::PARAM_BUFFER*
    def initialize(@guaranteed : Win32cr::NetworkManagement::QoS::AD_GUARANTEED, @param_buffer : Win32cr::NetworkManagement::QoS::PARAM_BUFFER*)
    end
    end

    def initialize(@length : UInt32, @service : UInt32, @overrides : Win32cr::NetworkManagement::QoS::AD_GENERAL_PARAMS, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct RSVP_ADSPEC
    property object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR
    property general_params : Win32cr::NetworkManagement::QoS::AD_GENERAL_PARAMS
    property number_of_services : UInt32
    property services : Win32cr::NetworkManagement::QoS::CONTROL_SERVICE*
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @general_params : Win32cr::NetworkManagement::QoS::AD_GENERAL_PARAMS, @number_of_services : UInt32, @services : Win32cr::NetworkManagement::QoS::CONTROL_SERVICE*)
    end
  end

  @[Extern]
  struct IDPE_ATTR
    property pe_attrib_length : UInt16
    property pe_attrib_type : UInt8
    property pe_attrib_sub_type : UInt8
    property pe_attrib_value : UInt8[4]
    def initialize(@pe_attrib_length : UInt16, @pe_attrib_type : UInt8, @pe_attrib_sub_type : UInt8, @pe_attrib_value : UInt8[4])
    end
  end

  @[Extern]
  struct WBCL_Iterator
    property firstElementPtr : Void*
    property logSize : UInt32
    property currentElementPtr : Void*
    property currentElementSize : UInt32
    property digestSize : UInt16
    property logFormat : UInt16
    property numberOfDigests : UInt32
    property digestSizes : Void*
    property supportedAlgorithms : UInt32
    property hashAlgorithm : UInt16
    def initialize(@firstElementPtr : Void*, @logSize : UInt32, @currentElementPtr : Void*, @currentElementSize : UInt32, @digestSize : UInt16, @logFormat : UInt16, @numberOfDigests : UInt32, @digestSizes : Void*, @supportedAlgorithms : UInt32, @hashAlgorithm : UInt16)
    end
  end

  @[Extern]
  struct TCG_PCClientPCREventStruct
    property pcrIndex : UInt32
    property eventType : UInt32
    property digest : UInt8[20]
    property eventDataSize : UInt32
    property event : UInt8*
    def initialize(@pcrIndex : UInt32, @eventType : UInt32, @digest : UInt8[20], @eventDataSize : UInt32, @event : UInt8*)
    end
  end

  @[Extern]
  struct TCG_PCClientTaggedEventStruct
    property event_id : UInt32
    property event_data_size : UInt32
    property event_data : UInt8*
    def initialize(@event_id : UInt32, @event_data_size : UInt32, @event_data : UInt8*)
    end
  end

  @[Extern]
  struct WBCL_LogHdr
    property signature : UInt32
    property version : UInt32
    property entries : UInt32
    property length : UInt32
    def initialize(@signature : UInt32, @version : UInt32, @entries : UInt32, @length : UInt32)
    end
  end

  @[Extern]
  struct SIPAEVENT_VSM_IDK_RSA_INFO_
    property key_bit_length : UInt32
    property public_exp_length_bytes : UInt32
    property modulus_size_bytes : UInt32
    property public_key_data : UInt8*
    def initialize(@key_bit_length : UInt32, @public_exp_length_bytes : UInt32, @modulus_size_bytes : UInt32, @public_key_data : UInt8*)
    end
  end

  @[Extern]
  struct SIPAEVENT_VSM_IDK_INFO_PAYLOAD_
    property key_alg_id : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property rsa_key_info : Win32cr::NetworkManagement::QoS::SIPAEVENT_VSM_IDK_RSA_INFO_
    def initialize(@rsa_key_info : Win32cr::NetworkManagement::QoS::SIPAEVENT_VSM_IDK_RSA_INFO_)
    end
    end

    def initialize(@key_alg_id : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct SIPAEVENT_SI_POLICY_PAYLOAD_
    property policy_version : UInt64
    property policy_name_length : UInt16
    property hash_alg_id : UInt16
    property digest_length : UInt32
    property var_length_data : UInt8*
    def initialize(@policy_version : UInt64, @policy_name_length : UInt16, @hash_alg_id : UInt16, @digest_length : UInt32, @var_length_data : UInt8*)
    end
  end

  @[Extern]
  struct SIPAEVENT_REVOCATION_LIST_PAYLOAD_
    property creation_time : Int64
    property digest_length : UInt32
    property hash_alg_id : UInt16
    property digest : UInt8*
    def initialize(@creation_time : Int64, @digest_length : UInt32, @hash_alg_id : UInt16, @digest : UInt8*)
    end
  end

  @[Extern]
  struct SIPAEVENT_KSR_SIGNATURE_PAYLOAD_
    property sign_alg_id : UInt32
    property signature_length : UInt32
    property signature : UInt8*
    def initialize(@sign_alg_id : UInt32, @signature_length : UInt32, @signature : UInt8*)
    end
  end

  @[Extern]
  struct SIPAEVENT_SBCP_INFO_PAYLOAD_V1_
    property payload_version : UInt32
    property var_data_offset : UInt32
    property hash_alg_id : UInt16
    property digest_length : UInt16
    property options : UInt32
    property signers_count : UInt32
    property var_data : UInt8*
    def initialize(@payload_version : UInt32, @var_data_offset : UInt32, @hash_alg_id : UInt16, @digest_length : UInt16, @options : UInt32, @signers_count : UInt32, @var_data : UInt8*)
    end
  end

  @[Link("qwave")]
  @[Link("traffic")]
  lib C
    fun QOSCreateHandle(version : Win32cr::NetworkManagement::QoS::QOS_VERSION*, qos_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun QOSCloseHandle(qos_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun QOSStartTrackingClient(qos_handle : Win32cr::Foundation::HANDLE, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, flags : UInt32) : Win32cr::Foundation::BOOL

    fun QOSStopTrackingClient(qos_handle : Win32cr::Foundation::HANDLE, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, flags : UInt32) : Win32cr::Foundation::BOOL

    fun QOSEnumerateFlows(qos_handle : Win32cr::Foundation::HANDLE, size : UInt32*, buffer : Void*) : Win32cr::Foundation::BOOL

    fun QOSAddSocketToFlow(qos_handle : Win32cr::Foundation::HANDLE, socket : Win32cr::Networking::WinSock::SOCKET, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, traffic_type : Win32cr::NetworkManagement::QoS::QOS_TRAFFIC_TYPE, flags : UInt32, flow_id : UInt32*) : Win32cr::Foundation::BOOL

    fun QOSRemoveSocketFromFlow(qos_handle : Win32cr::Foundation::HANDLE, socket : Win32cr::Networking::WinSock::SOCKET, flow_id : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun QOSSetFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_SET_FLOW, size : UInt32, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    fun QOSQueryFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_QUERY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    fun QOSNotifyFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_NOTIFY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    fun QOSCancel(qos_handle : Win32cr::Foundation::HANDLE, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    fun TcRegisterClient(tci_version : UInt32, cl_reg_ctx : Win32cr::Foundation::HANDLE, client_handler_list : Win32cr::NetworkManagement::QoS::TCI_CLIENT_FUNC_LIST*, pClientHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun TcEnumerateInterfaces(client_handle : Win32cr::Foundation::HANDLE, pBufferSize : UInt32*, interface_buffer : Win32cr::NetworkManagement::QoS::TC_IFC_DESCRIPTOR*) : UInt32

    fun TcOpenInterfaceA(pInterfaceName : Win32cr::Foundation::PSTR, client_handle : Win32cr::Foundation::HANDLE, cl_ifc_ctx : Win32cr::Foundation::HANDLE, pIfcHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun TcOpenInterfaceW(pInterfaceName : Win32cr::Foundation::PWSTR, client_handle : Win32cr::Foundation::HANDLE, cl_ifc_ctx : Win32cr::Foundation::HANDLE, pIfcHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun TcCloseInterface(ifc_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun TcQueryInterface(ifc_handle : Win32cr::Foundation::HANDLE, pGuidParam : LibC::GUID*, notify_change : Win32cr::Foundation::BOOLEAN, pBufferSize : UInt32*, buffer : Void*) : UInt32

    fun TcSetInterface(ifc_handle : Win32cr::Foundation::HANDLE, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32

    fun TcQueryFlowA(pFlowName : Win32cr::Foundation::PSTR, pGuidParam : LibC::GUID*, pBufferSize : UInt32*, buffer : Void*) : UInt32

    fun TcQueryFlowW(pFlowName : Win32cr::Foundation::PWSTR, pGuidParam : LibC::GUID*, pBufferSize : UInt32*, buffer : Void*) : UInt32

    fun TcSetFlowA(pFlowName : Win32cr::Foundation::PSTR, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32

    fun TcSetFlowW(pFlowName : Win32cr::Foundation::PWSTR, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32

    fun TcAddFlow(ifc_handle : Win32cr::Foundation::HANDLE, cl_flow_ctx : Win32cr::Foundation::HANDLE, flags : UInt32, pGenericFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*, pFlowHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun TcGetFlowNameA(flow_handle : Win32cr::Foundation::HANDLE, str_size : UInt32, pFlowName : UInt8*) : UInt32

    fun TcGetFlowNameW(flow_handle : Win32cr::Foundation::HANDLE, str_size : UInt32, pFlowName : UInt16*) : UInt32

    fun TcModifyFlow(flow_handle : Win32cr::Foundation::HANDLE, pGenericFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*) : UInt32

    fun TcAddFilter(flow_handle : Win32cr::Foundation::HANDLE, pGenericFilter : Win32cr::NetworkManagement::QoS::TC_GEN_FILTER*, pFilterHandle : Win32cr::Foundation::HANDLE*) : UInt32

    fun TcDeregisterClient(client_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun TcDeleteFlow(flow_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun TcDeleteFilter(filter_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun TcEnumerateFlows(ifc_handle : Win32cr::Foundation::HANDLE, pEnumHandle : Win32cr::Foundation::HANDLE*, pFlowCount : UInt32*, pBufSize : UInt32*, buffer : Win32cr::NetworkManagement::QoS::ENUMERATION_BUFFER*) : UInt32

  end
end