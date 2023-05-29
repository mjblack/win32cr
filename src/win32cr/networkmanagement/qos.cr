require "../networking/winsock.cr"
require "../foundation.cr"
require "../networkmanagement/ndis.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:qwave.dll")]
@[Link(ldflags: "/DELAYLOAD:traffic.dll")]
lib LibWin32
  alias LPM_HANDLE = LibC::IntPtrT
  alias RHANDLE = LibC::IntPtrT

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
  SESSFLG_E_Police = 1_u32
  Opt_Share_mask = 24_u32
  Opt_Distinct = 8_u32
  Opt_Shared = 16_u32
  Opt_SndSel_mask = 7_u32
  Opt_Wildcard = 1_u32
  Opt_Explicit = 2_u32
  ERROR_SPECF_InPlace = 1_u32
  ERROR_SPECF_NotGuilty = 2_u32
  ERR_FORWARD_OK = 32768_u32
  ERR_Usage_globl = 0_u32
  ERR_Usage_local = 16_u32
  ERR_Usage_serv = 17_u32
  ERR_global_mask = 4095_u32
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

  alias PALLOCMEM = Proc(UInt32, Void*)
  alias PFREEMEM = Proc(Void*, Void)
  alias CBADMITRESULT = Proc(LPM_HANDLE, RHANDLE, UInt32, Int32, Int32, Policy_decision*, UInt32*)
  alias CBGETRSVPOBJECTS = Proc(LPM_HANDLE, RHANDLE, Int32, Int32, RsvpObjHdr**, UInt32*)
  alias TCI_NOTIFY_HANDLER = Proc(LibC::HANDLE, LibC::HANDLE, UInt32, LibC::HANDLE, UInt32, Void*, Void)
  alias TCI_ADD_FLOW_COMPLETE_HANDLER = Proc(LibC::HANDLE, UInt32, Void)
  alias TCI_MOD_FLOW_COMPLETE_HANDLER = Proc(LibC::HANDLE, UInt32, Void)
  alias TCI_DEL_FLOW_COMPLETE_HANDLER = Proc(LibC::HANDLE, UInt32, Void)


  enum Int_serv_wkp : Int32
    IS_WKP_HOP_CNT = 4
    IS_WKP_PATH_BW = 6
    IS_WKP_MIN_LATENCY = 8
    IS_WKP_COMPOSED_MTU = 10
    IS_WKP_TB_TSPEC = 127
    IS_WKP_Q_TSPEC = 128
  end

  enum QOS_TRAFFIC_TYPE : Int32
    QOSTrafficTypeBestEffort = 0
    QOSTrafficTypeBackground = 1
    QOSTrafficTypeExcellentEffort = 2
    QOSTrafficTypeAudioVideo = 3
    QOSTrafficTypeVoice = 4
    QOSTrafficTypeControl = 5
  end

  enum QOS_SET_FLOW : Int32
    QOSSetTrafficType = 0
    QOSSetOutgoingRate = 1
    QOSSetOutgoingDSCPValue = 2
  end

  enum QOS_FLOWRATE_REASON : Int32
    QOSFlowRateNotApplicable = 0
    QOSFlowRateContentChange = 1
    QOSFlowRateCongestion = 2
    QOSFlowRateHigherContentEncoding = 3
    QOSFlowRateUserCaused = 4
  end

  enum QOS_SHAPING : Int32
    QOSShapeOnly = 0
    QOSShapeAndMark = 1
    QOSUseNonConformantMarkings = 2
  end

  enum QOS_QUERY_FLOW : Int32
    QOSQueryFlowFundamentals = 0
    QOSQueryPacketPriority = 1
    QOSQueryOutgoingRate = 2
  end

  enum QOS_NOTIFY_FLOW : Int32
    QOSNotifyCongested = 0
    QOSNotifyUncongested = 1
    QOSNotifyAvailable = 2
  end

  enum FilterType : Int32
    FILTERSPECV4 = 1
    FILTERSPECV6 = 2
    FILTERSPECV6_FLOW = 3
    FILTERSPECV4_GPI = 4
    FILTERSPECV6_GPI = 5
    FILTERSPEC_END = 6
  end

  union RSVP_SESSION_sess_u_e__Union
    sess_ipv4 : Session_IPv4
  end
  union RSVP_HOP_hop_u_e__Union
    hop_ipv4 : Rsvp_Hop_IPv4
  end
  union FILTER_SPEC_filt_u_e__Union
    filt_ipv4 : Filter_Spec_IPv4
    filt_ipv4gpi : Filter_Spec_IPv4GPI
  end
  union RSVP_SCOPE_scope_u_e__Union
    scopl_ipv4 : Scope_list_ipv4
  end
  union ERROR_SPEC_errs_u_e__Union
    errs_ipv4 : Error_Spec_IPv4
  end
  union IntServTspecBody_tspec_u_e__Union
    gen_stspec : GenTspec
    qual_stspec : QualTspec
  end
  union IntServFlowSpec_spec_u_e__Union
    cl_spec : CtrlLoadFlowspec
    g_spec : GuarFlowSpec
    q_spec : QualAppFlowSpec
  end
  union Flow_desc_u1_e__Union
    stspec : SENDER_TSPEC*
    isflow : IS_FLOWSPEC*
  end
  union Flow_desc_u2_e__Union
    stemp : FILTER_SPEC*
    fspec : FILTER_SPEC*
  end
  union IP_PATTERN_S_un_e__Union
    s_un_ports : IP_PATTERN_S_un_e__Union_S_un_ports_e__Struct
    s_un_icmp : IP_PATTERN_S_un_e__Union_S_un_icmp_e__Struct
    s_spi : UInt32
  end
  union IN_ADDR_IPV4
    addr : UInt32
    addr_bytes : UInt8[4]*
  end
  union RSVP_FILTERSPEC_Anonymous_e__Union
    filter_spec_v4 : RSVP_FILTERSPEC_V4
    filter_spec_v6 : RSVP_FILTERSPEC_V6
    filter_spec_v6_flow : RSVP_FILTERSPEC_V6_FLOW
    filter_spec_v4_gpi : RSVP_FILTERSPEC_V4_GPI
    filter_spec_v6_gpi : RSVP_FILTERSPEC_V6_GPI
  end
  union CONTROL_SERVICE_Anonymous_e__Union
    guaranteed : AD_GUARANTEED
    param_buffer : PARAM_BUFFER[0]*
  end
  union Tag_sipaevent_vsm_idk_info_payload_Anonymous_e__Union
    rsa_key_info : Tag_sipaevent_vsm_idk_rsa_info
  end

  struct FLOWSPEC
    token_rate : UInt32
    token_bucket_size : UInt32
    peak_bandwidth : UInt32
    latency : UInt32
    delay_variation : UInt32
    service_type : UInt32
    max_sdu_size : UInt32
    minimum_policed_size : UInt32
  end
  struct QOS_OBJECT_HDR
    object_type : UInt32
    object_length : UInt32
  end
  struct QOS_SD_MODE
    object_hdr : QOS_OBJECT_HDR
    shape_discard_mode : UInt32
  end
  struct QOS_SHAPING_RATE
    object_hdr : QOS_OBJECT_HDR
    shaping_rate : UInt32
  end
  struct RsvpObjHdr
    obj_length : UInt16
    obj_class : UInt8
    obj_ctype : UInt8
  end
  struct Session_IPv4
    sess_destaddr : IN_ADDR
    sess_protid : UInt8
    sess_flags : UInt8
    sess_destport : UInt16
  end
  struct RSVP_SESSION
    sess_header : RsvpObjHdr
    sess_u : RSVP_SESSION_sess_u_e__Union
  end
  struct Rsvp_Hop_IPv4
    hop_ipaddr : IN_ADDR
    hop_lih : UInt32
  end
  struct RSVP_HOP
    hop_header : RsvpObjHdr
    hop_u : RSVP_HOP_hop_u_e__Union
  end
  struct RESV_STYLE
    style_header : RsvpObjHdr
    style_word : UInt32
  end
  struct Filter_Spec_IPv4
    filt_ipaddr : IN_ADDR
    filt_unused : UInt16
    filt_port : UInt16
  end
  struct Filter_Spec_IPv4GPI
    filt_ipaddr : IN_ADDR
    filt_gpi : UInt32
  end
  struct FILTER_SPEC
    filt_header : RsvpObjHdr
    filt_u : FILTER_SPEC_filt_u_e__Union
  end
  struct Scope_list_ipv4
    scopl_ipaddr : IN_ADDR[0]*
  end
  struct RSVP_SCOPE
    scopl_header : RsvpObjHdr
    scope_u : RSVP_SCOPE_scope_u_e__Union
  end
  struct Error_Spec_IPv4
    errs_errnode : IN_ADDR
    errs_flags : UInt8
    errs_code : UInt8
    errs_value : UInt16
  end
  struct ERROR_SPEC
    errs_header : RsvpObjHdr
    errs_u : ERROR_SPEC_errs_u_e__Union
  end
  struct POLICY_DATA
    policy_obj_hdr : RsvpObjHdr
    us_pe_offset : UInt16
    us_reserved : UInt16
  end
  struct POLICY_ELEMENT
    us_pe_length : UInt16
    us_pe_type : UInt16
    uc_pe_data : UInt8[4]*
  end
  struct IntServMainHdr
    ismh_version : UInt8
    ismh_unused : UInt8
    ismh_len32b : UInt16
  end
  struct IntServServiceHdr
    issh_service : UInt8
    issh_flags : UInt8
    issh_len32b : UInt16
  end
  struct IntServParmHdr
    isph_parm_num : UInt8
    isph_flags : UInt8
    isph_len32b : UInt16
  end
  struct GenTspecParms
    tb_tspec_r : Float32
    tb_tspec_b : Float32
    tb_tspec_p : Float32
    tb_tspec_m : UInt32
    tb_tspec_m : UInt32
  end
  struct GenTspec
    gen_tspec_serv_hdr : IntServServiceHdr
    gen_tspec_parm_hdr : IntServParmHdr
    gen_tspec_parms : GenTspecParms
  end
  struct QualTspecParms
    tb_tspec_m : UInt32
  end
  struct QualTspec
    qual_tspec_serv_hdr : IntServServiceHdr
    qual_tspec_parm_hdr : IntServParmHdr
    qual_tspec_parms : QualTspecParms
  end
  struct QualAppFlowSpec
    q_spec_serv_hdr : IntServServiceHdr
    q_spec_parm_hdr : IntServParmHdr
    q_spec_parms : QualTspecParms
  end
  struct IntServTspecBody
    st_mh : IntServMainHdr
    tspec_u : IntServTspecBody_tspec_u_e__Union
  end
  struct SENDER_TSPEC
    stspec_header : RsvpObjHdr
    stspec_body : IntServTspecBody
  end
  struct CtrlLoadFlowspec
    cl_spec_serv_hdr : IntServServiceHdr
    cl_spec_parm_hdr : IntServParmHdr
    cl_spec_parms : GenTspecParms
  end
  struct GuarRspec
    guar_r : Float32
    guar_s : UInt32
  end
  struct GuarFlowSpec
    guar_serv_hdr : IntServServiceHdr
    guar_tspec_hdr : IntServParmHdr
    guar_tspec_parms : GenTspecParms
    guar_rspec_hdr : IntServParmHdr
    guar_rspec : GuarRspec
  end
  struct IntServFlowSpec
    spec_mh : IntServMainHdr
    spec_u : IntServFlowSpec_spec_u_e__Union
  end
  struct IS_FLOWSPEC
    flow_header : RsvpObjHdr
    flow_body : IntServFlowSpec
  end
  struct Flow_desc
    u1 : Flow_desc_u1_e__Union
    u2 : Flow_desc_u2_e__Union
  end
  struct Gads_parms_t
    gads_serv_hdr : IntServServiceHdr
    gads_ctot_hdr : IntServParmHdr
    gads_ctot : UInt32
    gads_dtot_hdr : IntServParmHdr
    gads_dtot : UInt32
    gads_csum_hdr : IntServParmHdr
    gads_csum : UInt32
    gads_dsum_hdr : IntServParmHdr
    gads_dsum : UInt32
  end
  struct GenAdspecParams
    gen_parm_hdr : IntServServiceHdr
    gen_parm_hopcnt_hdr : IntServParmHdr
    gen_parm_hopcnt : UInt32
    gen_parm_pathbw_hdr : IntServParmHdr
    gen_parm_path_bw : Float32
    gen_parm_minlat_hdr : IntServParmHdr
    gen_parm_min_latency : UInt32
    gen_parm_compmtu_hdr : IntServParmHdr
    gen_parm_composed_mtu : UInt32
  end
  struct IS_ADSPEC_BODY
    adspec_mh : IntServMainHdr
    adspec_genparms : GenAdspecParams
  end
  struct ADSPEC
    adspec_header : RsvpObjHdr
    adspec_body : IS_ADSPEC_BODY
  end
  struct ID_ERROR_OBJECT
    us_id_err_length : UInt16
    uc_a_type : UInt8
    uc_sub_type : UInt8
    us_reserved : UInt16
    us_id_error_value : UInt16
    uc_id_err_data : UInt8[4]*
  end
  struct RSVP_MSG_OBJS
    rsvp_msg_type : Int32
    p_rsvp_session : RSVP_SESSION*
    p_rsvp_from_hop : RSVP_HOP*
    p_rsvp_to_hop : RSVP_HOP*
    p_resv_style : RESV_STYLE*
    p_rsvp_scope : RSVP_SCOPE*
    flow_desc_count : Int32
    p_flow_descs : Flow_desc*
    pd_object_count : Int32
    pp_pd_objects : POLICY_DATA**
    p_error_spec : ERROR_SPEC*
    p_adspec : ADSPEC*
  end
  struct Policy_decision
    lpv_result : UInt32
    w_policy_err_code : UInt16
    w_policy_err_value : UInt16
  end
  struct LPM_INIT_INFO
    pcm_version_number : UInt32
    result_time_limit : UInt32
    configured_lpm_count : Int32
    alloc_memory : PALLOCMEM
    free_memory : PFREEMEM
    pcm_admit_result_callback : CBADMITRESULT
    get_rsvp_objects_callback : CBGETRSVPOBJECTS
  end
  struct Lpmiptable
    ul_if_index : UInt32
    media_type : UInt32
    if_ip_addr : IN_ADDR
    if_net_mask : IN_ADDR
  end
  struct QOS_PACKET_PRIORITY
    conformant_dscp_value : UInt32
    non_conformant_dscp_value : UInt32
    conformant_l2_value : UInt32
    non_conformant_l2_value : UInt32
  end
  struct QOS_FLOW_FUNDAMENTALS
    bottleneck_bandwidth_set : LibC::BOOL
    bottleneck_bandwidth : UInt64
    available_bandwidth_set : LibC::BOOL
    available_bandwidth : UInt64
    rtt_set : LibC::BOOL
    rtt : UInt32
  end
  struct QOS_FLOWRATE_OUTGOING
    bandwidth : UInt64
    shaping_behavior : QOS_SHAPING
    reason : QOS_FLOWRATE_REASON
  end
  struct QOS_VERSION
    major_version : UInt16
    minor_version : UInt16
  end
  struct QOS_FRIENDLY_NAME
    object_hdr : QOS_OBJECT_HDR
    friendly_name : Char[256]*
  end
  struct QOS_TRAFFIC_CLASS
    object_hdr : QOS_OBJECT_HDR
    traffic_class : UInt32
  end
  struct QOS_DS_CLASS
    object_hdr : QOS_OBJECT_HDR
    ds_field : UInt32
  end
  struct QOS_DIFFSERV
    object_hdr : QOS_OBJECT_HDR
    ds_field_count : UInt32
    diffserv_rule : UInt8[0]*
  end
  struct QOS_DIFFSERV_RULE
    inbound_ds_field : UInt8
    conforming_outbound_ds_field : UInt8
    non_conforming_outbound_ds_field : UInt8
    conforming_user_priority : UInt8
    non_conforming_user_priority : UInt8
  end
  struct QOS_TCP_TRAFFIC
    object_hdr : QOS_OBJECT_HDR
  end
  struct TCI_CLIENT_FUNC_LIST
    cl_notify_handler : TCI_NOTIFY_HANDLER
    cl_add_flow_complete_handler : TCI_ADD_FLOW_COMPLETE_HANDLER
    cl_modify_flow_complete_handler : TCI_MOD_FLOW_COMPLETE_HANDLER
    cl_delete_flow_complete_handler : TCI_DEL_FLOW_COMPLETE_HANDLER
  end
  struct ADDRESS_LIST_DESCRIPTOR
    media_type : UInt32
    address_list : NETWORK_ADDRESS_LIST
  end
  struct TC_IFC_DESCRIPTOR
    length : UInt32
    p_interface_name : LibC::LPWSTR
    p_interface_id : LibC::LPWSTR
    address_list_desc : ADDRESS_LIST_DESCRIPTOR
  end
  struct TC_SUPPORTED_INFO_BUFFER
    instance_id_length : UInt16
    instance_id : Char[256]*
    interface_luid : UInt64
    addr_list_desc : ADDRESS_LIST_DESCRIPTOR
  end
  struct TC_GEN_FILTER
    address_type : UInt16
    pattern_size : UInt32
    pattern : Void*
    mask : Void*
  end
  struct TC_GEN_FLOW
    sending_flowspec : FLOWSPEC
    receiving_flowspec : FLOWSPEC
    tc_objects_length : UInt32
    tc_objects : QOS_OBJECT_HDR[0]*
  end
  struct IP_PATTERN
    reserved1 : UInt32
    reserved2 : UInt32
    src_addr : UInt32
    dst_addr : UInt32
    s_un : IP_PATTERN_S_un_e__Union
    protocol_id : UInt8
    reserved3 : UInt8[3]*
  end
  struct IP_PATTERN_S_un_e__Union_S_un_icmp_e__Struct
    s_type : UInt8
    s_code : UInt8
    filler : UInt16
  end
  struct IP_PATTERN_S_un_e__Union_S_un_ports_e__Struct
    s_srcport : UInt16
    s_dstport : UInt16
  end
  struct IPX_PATTERN
    src : IPX_PATTERN_Src_e__Struct
    dest : IPX_PATTERN_Src_e__Struct
  end
  struct IPX_PATTERN_Src_e__Struct
    network_address : UInt32
    node_address : UInt8[6]*
    socket : UInt16
  end
  struct ENUMERATION_BUFFER
    length : UInt32
    owner_process_id : UInt32
    flow_name_length : UInt16
    flow_name : Char[256]*
    p_flow : TC_GEN_FLOW*
    number_of_filters : UInt32
    generic_filter : TC_GEN_FILTER[0]*
  end
  struct IN_ADDR_IPV6
    addr : UInt8[16]*
  end
  struct RSVP_FILTERSPEC_V4
    address : IN_ADDR_IPV4
    unused : UInt16
    port : UInt16
  end
  struct RSVP_FILTERSPEC_V6
    address : IN_ADDR_IPV6
    un_used : UInt16
    port : UInt16
  end
  struct RSVP_FILTERSPEC_V6_FLOW
    address : IN_ADDR_IPV6
    un_used : UInt8
    flow_label : UInt8[3]*
  end
  struct RSVP_FILTERSPEC_V4_GPI
    address : IN_ADDR_IPV4
    general_port_id : UInt32
  end
  struct RSVP_FILTERSPEC_V6_GPI
    address : IN_ADDR_IPV6
    general_port_id : UInt32
  end
  struct RSVP_FILTERSPEC
    type : FilterType
    anonymous : RSVP_FILTERSPEC_Anonymous_e__Union
  end
  struct FLOWDESCRIPTOR
    flow_spec : FLOWSPEC
    num_filters : UInt32
    filter_list : RSVP_FILTERSPEC*
  end
  struct RSVP_POLICY
    len : UInt16
    type : UInt16
    info : UInt8[4]*
  end
  struct RSVP_POLICY_INFO
    object_hdr : QOS_OBJECT_HDR
    num_policy_element : UInt32
    policy_element : RSVP_POLICY[0]*
  end
  struct RSVP_RESERVE_INFO
    object_hdr : QOS_OBJECT_HDR
    style : UInt32
    confirm_request : UInt32
    policy_element_list : RSVP_POLICY_INFO*
    num_flow_desc : UInt32
    flow_desc_list : FLOWDESCRIPTOR*
  end
  struct RSVP_STATUS_INFO
    object_hdr : QOS_OBJECT_HDR
    status_code : UInt32
    extended_status1 : UInt32
    extended_status2 : UInt32
  end
  struct QOS_DESTADDR
    object_hdr : QOS_OBJECT_HDR
    socket_address : SOCKADDR*
    socket_address_length : UInt32
  end
  struct AD_GENERAL_PARAMS
    int_serv_aware_hop_count : UInt32
    path_bandwidth_estimate : UInt32
    minimum_latency : UInt32
    path_mtu : UInt32
    flags : UInt32
  end
  struct AD_GUARANTEED
    c_total : UInt32
    d_total : UInt32
    c_sum : UInt32
    d_sum : UInt32
  end
  struct PARAM_BUFFER
    parameter_id : UInt32
    length : UInt32
    buffer : UInt8[0]*
  end
  struct CONTROL_SERVICE
    length : UInt32
    service : UInt32
    overrides : AD_GENERAL_PARAMS
    anonymous : CONTROL_SERVICE_Anonymous_e__Union
  end
  struct RSVP_ADSPEC
    object_hdr : QOS_OBJECT_HDR
    general_params : AD_GENERAL_PARAMS
    number_of_services : UInt32
    services : CONTROL_SERVICE[0]*
  end
  struct IDPE_ATTR
    pe_attrib_length : UInt16
    pe_attrib_type : UInt8
    pe_attrib_sub_type : UInt8
    pe_attrib_value : UInt8[4]*
  end
  struct WBCL_Iterator
    first_element_ptr : Void*
    log_size : UInt32
    current_element_ptr : Void*
    current_element_size : UInt32
    digest_size : UInt16
    log_format : UInt16
    number_of_digests : UInt32
    digest_sizes : Void*
    supported_algorithms : UInt32
    hash_algorithm : UInt16
  end
  struct TCG_PCClientPCREventStruct
    pcr_index : UInt32
    event_type : UInt32
    digest : UInt8[20]*
    event_data_size : UInt32
    event : UInt8[0]*
  end
  struct TCG_PCClientTaggedEventStruct
    event_id : UInt32
    event_data_size : UInt32
    event_data : UInt8[0]*
  end
  struct WBCL_LogHdr
    signature : UInt32
    version : UInt32
    entries : UInt32
    length : UInt32
  end
  struct Tag_sipaevent_vsm_idk_rsa_info
    key_bit_length : UInt32
    public_exp_length_bytes : UInt32
    modulus_size_bytes : UInt32
    public_key_data : UInt8[0]*
  end
  struct Tag_sipaevent_vsm_idk_info_payload
    key_alg_id : UInt32
    anonymous : Tag_sipaevent_vsm_idk_info_payload_Anonymous_e__Union
  end
  struct Tag_sipaevent_si_policy_payload
    policy_version : UInt64
    policy_name_length : UInt16
    hash_alg_id : UInt16
    digest_length : UInt32
    var_length_data : UInt8[0]*
  end
  struct Tag_sipaevent_revocation_list_payload
    creation_time : Int64
    digest_length : UInt32
    hash_alg_id : UInt16
    digest : UInt8[0]*
  end
  struct Tag_sipaevent_ksr_signature_payload
    sign_alg_id : UInt32
    signature_length : UInt32
    signature : UInt8[0]*
  end
  struct Tag_sipaevent_sbcp_info_payload_v1
    payload_version : UInt32
    var_data_offset : UInt32
    hash_alg_id : UInt16
    digest_length : UInt16
    options : UInt32
    signers_count : UInt32
    var_data : UInt8[0]*
  end
  struct QOS
    sending_flowspec : FLOWSPEC
    receiving_flowspec : FLOWSPEC
    provider_specific : WSABUF
  end


  # Params # version : QOS_VERSION* [In],qoshandle : LibC::HANDLE* [In]
  fun QOSCreateHandle(version : QOS_VERSION*, qoshandle : LibC::HANDLE*) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In]
  fun QOSCloseHandle(qoshandle : LibC::HANDLE) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],destaddr : SOCKADDR* [In],flags : UInt32 [In]
  fun QOSStartTrackingClient(qoshandle : LibC::HANDLE, destaddr : SOCKADDR*, flags : UInt32) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],destaddr : SOCKADDR* [In],flags : UInt32 [In]
  fun QOSStopTrackingClient(qoshandle : LibC::HANDLE, destaddr : SOCKADDR*, flags : UInt32) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],size : UInt32* [In],buffer : Void* [In]
  fun QOSEnumerateFlows(qoshandle : LibC::HANDLE, size : UInt32*, buffer : Void*) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],socket : SOCKET [In],destaddr : SOCKADDR* [In],traffictype : QOS_TRAFFIC_TYPE [In],flags : UInt32 [In],flowid : UInt32* [In]
  fun QOSAddSocketToFlow(qoshandle : LibC::HANDLE, socket : SOCKET, destaddr : SOCKADDR*, traffictype : QOS_TRAFFIC_TYPE, flags : UInt32, flowid : UInt32*) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],socket : SOCKET [In],flowid : UInt32 [In],flags : UInt32 [In]
  fun QOSRemoveSocketFromFlow(qoshandle : LibC::HANDLE, socket : SOCKET, flowid : UInt32, flags : UInt32) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],flowid : UInt32 [In],operation : QOS_SET_FLOW [In],size : UInt32 [In],buffer : Void* [In],flags : UInt32 [In],overlapped : OVERLAPPED* [In]
  fun QOSSetFlow(qoshandle : LibC::HANDLE, flowid : UInt32, operation : QOS_SET_FLOW, size : UInt32, buffer : Void*, flags : UInt32, overlapped : OVERLAPPED*) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],flowid : UInt32 [In],operation : QOS_QUERY_FLOW [In],size : UInt32* [In],buffer : Void* [In],flags : UInt32 [In],overlapped : OVERLAPPED* [In]
  fun QOSQueryFlow(qoshandle : LibC::HANDLE, flowid : UInt32, operation : QOS_QUERY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : OVERLAPPED*) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],flowid : UInt32 [In],operation : QOS_NOTIFY_FLOW [In],size : UInt32* [In],buffer : Void* [In],flags : UInt32 [In],overlapped : OVERLAPPED* [In]
  fun QOSNotifyFlow(qoshandle : LibC::HANDLE, flowid : UInt32, operation : QOS_NOTIFY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : OVERLAPPED*) : LibC::BOOL

  # Params # qoshandle : LibC::HANDLE [In],overlapped : OVERLAPPED* [In]
  fun QOSCancel(qoshandle : LibC::HANDLE, overlapped : OVERLAPPED*) : LibC::BOOL

  # Params # tciversion : UInt32 [In],clregctx : LibC::HANDLE [In],clienthandlerlist : TCI_CLIENT_FUNC_LIST* [In],pclienthandle : LibC::HANDLE* [In]
  fun TcRegisterClient(tciversion : UInt32, clregctx : LibC::HANDLE, clienthandlerlist : TCI_CLIENT_FUNC_LIST*, pclienthandle : LibC::HANDLE*) : UInt32

  # Params # clienthandle : LibC::HANDLE [In],pbuffersize : UInt32* [In],interfacebuffer : TC_IFC_DESCRIPTOR* [In]
  fun TcEnumerateInterfaces(clienthandle : LibC::HANDLE, pbuffersize : UInt32*, interfacebuffer : TC_IFC_DESCRIPTOR*) : UInt32

  # Params # pinterfacename : PSTR [In],clienthandle : LibC::HANDLE [In],clifcctx : LibC::HANDLE [In],pifchandle : LibC::HANDLE* [In]
  fun TcOpenInterfaceA(pinterfacename : PSTR, clienthandle : LibC::HANDLE, clifcctx : LibC::HANDLE, pifchandle : LibC::HANDLE*) : UInt32

  # Params # pinterfacename : LibC::LPWSTR [In],clienthandle : LibC::HANDLE [In],clifcctx : LibC::HANDLE [In],pifchandle : LibC::HANDLE* [In]
  fun TcOpenInterfaceW(pinterfacename : LibC::LPWSTR, clienthandle : LibC::HANDLE, clifcctx : LibC::HANDLE, pifchandle : LibC::HANDLE*) : UInt32

  # Params # ifchandle : LibC::HANDLE [In]
  fun TcCloseInterface(ifchandle : LibC::HANDLE) : UInt32

  # Params # ifchandle : LibC::HANDLE [In],pguidparam : Guid* [In],notifychange : BOOLEAN [In],pbuffersize : UInt32* [In],buffer : Void* [In]
  fun TcQueryInterface(ifchandle : LibC::HANDLE, pguidparam : Guid*, notifychange : BOOLEAN, pbuffersize : UInt32*, buffer : Void*) : UInt32

  # Params # ifchandle : LibC::HANDLE [In],pguidparam : Guid* [In],buffersize : UInt32 [In],buffer : Void* [In]
  fun TcSetInterface(ifchandle : LibC::HANDLE, pguidparam : Guid*, buffersize : UInt32, buffer : Void*) : UInt32

  # Params # pflowname : PSTR [In],pguidparam : Guid* [In],pbuffersize : UInt32* [In],buffer : Void* [In]
  fun TcQueryFlowA(pflowname : PSTR, pguidparam : Guid*, pbuffersize : UInt32*, buffer : Void*) : UInt32

  # Params # pflowname : LibC::LPWSTR [In],pguidparam : Guid* [In],pbuffersize : UInt32* [In],buffer : Void* [In]
  fun TcQueryFlowW(pflowname : LibC::LPWSTR, pguidparam : Guid*, pbuffersize : UInt32*, buffer : Void*) : UInt32

  # Params # pflowname : PSTR [In],pguidparam : Guid* [In],buffersize : UInt32 [In],buffer : Void* [In]
  fun TcSetFlowA(pflowname : PSTR, pguidparam : Guid*, buffersize : UInt32, buffer : Void*) : UInt32

  # Params # pflowname : LibC::LPWSTR [In],pguidparam : Guid* [In],buffersize : UInt32 [In],buffer : Void* [In]
  fun TcSetFlowW(pflowname : LibC::LPWSTR, pguidparam : Guid*, buffersize : UInt32, buffer : Void*) : UInt32

  # Params # ifchandle : LibC::HANDLE [In],clflowctx : LibC::HANDLE [In],flags : UInt32 [In],pgenericflow : TC_GEN_FLOW* [In],pflowhandle : LibC::HANDLE* [In]
  fun TcAddFlow(ifchandle : LibC::HANDLE, clflowctx : LibC::HANDLE, flags : UInt32, pgenericflow : TC_GEN_FLOW*, pflowhandle : LibC::HANDLE*) : UInt32

  # Params # flowhandle : LibC::HANDLE [In],strsize : UInt32 [In],pflowname : UInt8* [In]
  fun TcGetFlowNameA(flowhandle : LibC::HANDLE, strsize : UInt32, pflowname : UInt8*) : UInt32

  # Params # flowhandle : LibC::HANDLE [In],strsize : UInt32 [In],pflowname : Char* [In]
  fun TcGetFlowNameW(flowhandle : LibC::HANDLE, strsize : UInt32, pflowname : Char*) : UInt32

  # Params # flowhandle : LibC::HANDLE [In],pgenericflow : TC_GEN_FLOW* [In]
  fun TcModifyFlow(flowhandle : LibC::HANDLE, pgenericflow : TC_GEN_FLOW*) : UInt32

  # Params # flowhandle : LibC::HANDLE [In],pgenericfilter : TC_GEN_FILTER* [In],pfilterhandle : LibC::HANDLE* [In]
  fun TcAddFilter(flowhandle : LibC::HANDLE, pgenericfilter : TC_GEN_FILTER*, pfilterhandle : LibC::HANDLE*) : UInt32

  # Params # clienthandle : LibC::HANDLE [In]
  fun TcDeregisterClient(clienthandle : LibC::HANDLE) : UInt32

  # Params # flowhandle : LibC::HANDLE [In]
  fun TcDeleteFlow(flowhandle : LibC::HANDLE) : UInt32

  # Params # filterhandle : LibC::HANDLE [In]
  fun TcDeleteFilter(filterhandle : LibC::HANDLE) : UInt32

  # Params # ifchandle : LibC::HANDLE [In],penumhandle : LibC::HANDLE* [In],pflowcount : UInt32* [In],pbufsize : UInt32* [In],buffer : ENUMERATION_BUFFER* [In]
  fun TcEnumerateFlows(ifchandle : LibC::HANDLE, penumhandle : LibC::HANDLE*, pflowcount : UInt32*, pbufsize : UInt32*, buffer : ENUMERATION_BUFFER*) : UInt32
end
