require "./../foundation.cr"
require "./ndis.cr"
require "./../networking/win_sock.cr"
require "./../system/io.cr"

module Win32cr::NetworkManagement::QoS
  extend self
  alias RHANDLE = Void*
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
  GUID_QOS_REMAINING_BANDWIDTH = LibC::GUID.new(0xc4c51720_u32, 0x40ec_u16, 0x11d1_u16, StaticArray[0x2c_u8, 0x91_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x57_u8, 0x49_u8, 0x15_u8])
  GUID_QOS_BESTEFFORT_BANDWIDTH = LibC::GUID.new(0xed885290_u32, 0x40ec_u16, 0x11d1_u16, StaticArray[0x2c_u8, 0x91_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x57_u8, 0x49_u8, 0x15_u8])
  GUID_QOS_LATENCY = LibC::GUID.new(0xfc408ef0_u32, 0x40ec_u16, 0x11d1_u16, StaticArray[0x2c_u8, 0x91_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x57_u8, 0x49_u8, 0x15_u8])
  GUID_QOS_FLOW_COUNT = LibC::GUID.new(0x1147f880_u32, 0x40ed_u16, 0x11d1_u16, StaticArray[0x2c_u8, 0x91_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x57_u8, 0x49_u8, 0x15_u8])
  GUID_QOS_NON_BESTEFFORT_LIMIT = LibC::GUID.new(0x185c44e0_u32, 0x40ed_u16, 0x11d1_u16, StaticArray[0x2c_u8, 0x91_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x57_u8, 0x49_u8, 0x15_u8])
  GUID_QOS_MAX_OUTSTANDING_SENDS = LibC::GUID.new(0x161ffa86_u32, 0x6120_u16, 0x11d1_u16, StaticArray[0x2c_u8, 0x91_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x57_u8, 0x49_u8, 0x15_u8])
  GUID_QOS_STATISTICS_BUFFER = LibC::GUID.new(0xbb2c0980_u32, 0xe900_u16, 0x11d1_u16, StaticArray[0xb0_u8, 0x7e_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x13_u8, 0x82_u8, 0xbf_u8])
  GUID_QOS_FLOW_MODE = LibC::GUID.new(0x5c82290a_u32, 0x515a_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0x58_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0xbf_u8, 0xcb_u8])
  GUID_QOS_ISSLOW_FLOW = LibC::GUID.new(0xabf273a4_u32, 0xee07_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0x1b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x9e_u8, 0xe6_u8, 0x3b_u8])
  GUID_QOS_TIMER_RESOLUTION = LibC::GUID.new(0xba10cc88_u32, 0xf13e_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0x1b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x9e_u8, 0xe6_u8, 0x3b_u8])
  GUID_QOS_FLOW_IP_CONFORMING = LibC::GUID.new(0x7f99a8b_u32, 0xfcd2_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0x1e_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x9e_u8, 0xe6_u8, 0x3b_u8])
  GUID_QOS_FLOW_IP_NONCONFORMING = LibC::GUID.new(0x87a5987_u32, 0xfcd2_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0x1e_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x9e_u8, 0xe6_u8, 0x3b_u8])
  GUID_QOS_FLOW_8021P_CONFORMING = LibC::GUID.new(0x8c1e013_u32, 0xfcd2_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0x1e_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x9e_u8, 0xe6_u8, 0x3b_u8])
  GUID_QOS_FLOW_8021P_NONCONFORMING = LibC::GUID.new(0x9023f91_u32, 0xfcd2_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0x1e_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x9e_u8, 0xe6_u8, 0x3b_u8])
  GUID_QOS_ENABLE_AVG_STATS = LibC::GUID.new(0xbafb6d11_u32, 0x27c4_u16, 0x4801_u16, StaticArray[0xa4_u8, 0x6f_u8, 0xef_u8, 0x80_u8, 0x80_u8, 0xc1_u8, 0x88_u8, 0xc8_u8])
  GUID_QOS_ENABLE_WINDOW_ADJUSTMENT = LibC::GUID.new(0xaa966725_u32, 0xd3e9_u16, 0x4c55_u16, StaticArray[0xb3_u8, 0x35_u8, 0x2a_u8, 0x0_u8, 0x27_u8, 0x9a_u8, 0x1e_u8, 0x64_u8])
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
  SIPAEV_EFI_VARIABLE_BOOT2 = 2147483660_u32
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
  SIPAEV_AMD_NO_ACTION = 3_u32
  SIPAEV_AMD_BASE_2 = 33280_u32
  SIPAEV_AMD_SPL_TABLE_ROM = 33281_u32
  SIPAEV_AMD_PSP_BL_STAGE_1 = 33282_u32
  SIPAEV_AMD_PSP_KEYDB = 33283_u32
  SIPAEV_AMD_SPL_TABLE_FW = 33284_u32
  SIPAEV_AMD_PSP_BL_STAGE_2 = 33285_u32
  SIPAEV_AMD_PSP_L0_SEC_POL = 33286_u32
  SIPAEV_AMD_PMFW0 = 33287_u32
  SIPAEV_AMD_MP2_CONFIG = 33288_u32
  SIPAEV_AMD_MP2_FW = 33289_u32
  SIPAEV_AMD_ABL_1 = 33290_u32
  SIPAEV_AMD_ABL_2 = 33291_u32
  SIPAEV_AMD_ABL_3 = 33292_u32
  SIPAEV_AMD_ABL_4 = 33293_u32
  SIPAEV_AMD_ABL_5 = 33294_u32
  SIPAEV_AMD_ABL_6 = 33295_u32
  SIPAEV_AMD_ABL_7 = 33296_u32
  SIPAEV_AMD_ABL_8 = 33297_u32
  SIPAEV_AMD_ABL_9 = 33298_u32
  SIPAEV_AMD_ABL_10 = 33299_u32
  SIPAEV_AMD_ABL_11 = 33300_u32
  SIPAEV_AMD_ABL_12 = 33301_u32
  SIPAEV_AMD_ABL_13 = 33302_u32
  SIPAEV_AMD_ABL_14 = 33303_u32
  SIPAEV_AMD_ABL_15 = 33304_u32
  SIPAEV_AMD_ABL_16 = 33305_u32
  SIPAEV_AMD_ABL_17 = 33306_u32
  SIPAEV_AMD_ABL_18 = 33307_u32
  SIPAEV_AMD_ABL_19 = 33308_u32
  SIPAEV_AMD_ABL_20 = 33309_u32
  SIPAEV_AMD_ABL_21 = 33310_u32
  SIPAEV_AMD_ABL_22 = 33311_u32
  SIPAEV_AMD_ABL_23 = 33312_u32
  SIPAEV_AMD_ABL_24 = 33313_u32
  SIPAEV_AMD_ABL_25 = 33314_u32
  SIPAEV_AMD_ABL_26 = 33315_u32
  SIPAEV_AMD_ABL_27 = 33316_u32
  SIPAEV_AMD_ABL_28 = 33317_u32
  SIPAEV_AMD_ABL_29 = 33318_u32
  SIPAEV_AMD_ABL_30 = 33319_u32
  SIPAEV_AMD_ABL_31 = 33320_u32
  SIPAEV_AMD_ABL_32 = 33321_u32
  SIPAEV_AMD_ABL_33 = 33322_u32
  SIPAEV_AMD_ABL_34 = 33323_u32
  SIPAEV_AMD_ABL_35 = 33324_u32
  SIPAEV_AMD_ABL_36 = 33325_u32
  SIPAEV_AMD_ABL_37 = 33326_u32
  SIPAEV_AMD_ABL_38 = 33327_u32
  SIPAEV_AMD_ABL_39 = 33328_u32
  SIPAEV_AMD_ABL_40 = 33329_u32
  SIPAEV_AMD_ABL_41 = 33330_u32
  SIPAEV_AMD_ABL_42 = 33331_u32
  SIPAEV_AMD_ABL_43 = 33332_u32
  SIPAEV_AMD_ABL_44 = 33333_u32
  SIPAEV_AMD_ABL_45 = 33334_u32
  SIPAEV_AMD_ABL_46 = 33335_u32
  SIPAEV_AMD_ABL_47 = 33336_u32
  SIPAEV_AMD_ABL_48 = 33337_u32
  SIPAEV_AMD_MID_SMU = 33338_u32
  SIPAEV_AMD_PM_FW1 = 33339_u32
  SIPAEV_AMD_VBL_1 = 33340_u32
  SIPAEV_AMD_VBL_2 = 33341_u32
  SIPAEV_AMD_VBL_3 = 33342_u32
  SIPAEV_AMD_VBL_4 = 33343_u32
  SIPAEV_AMD_VBL_5 = 33344_u32
  SIPAEV_AMD_VBL_6 = 33345_u32
  SIPAEV_AMD_VBL_7 = 33346_u32
  SIPAEV_AMD_VBL_8 = 33347_u32
  SIPAEV_AMD_VBL_9 = 33348_u32
  SIPAEV_AMD_VBL_10 = 33349_u32
  SIPAEV_AMD_PSP_L1_SEC_POL = 33350_u32
  SIPAEV_AMD_IP_DISCOVERY = 33351_u32
  SIPAEV_AMD_SYS_DRV = 33352_u32
  SIPAEV_AMD_TOS = 33353_u32
  SIPAEV_AMD_PSP_TOS_KEYDB = 33354_u32
  SIPAEV_AMD_ABL_TOC = 33355_u32
  SIPAEV_AMD_PMU1_DATA = 33356_u32
  SIPAEV_AMD_PMU2_DATA = 33357_u32
  SIPAEV_AMD_PMU1 = 33358_u32
  SIPAEV_AMD_PMU2 = 33359_u32
  SIPAEV_AMD_MPIO_FW = 33360_u32
  SIPAEV_AMD_MP5 = 33361_u32
  SIPAEV_AMD_MPCCX = 33362_u32
  SIPAEV_AMD_GMI3 = 33363_u32
  SIPAEV_AMD_TPMLITE = 33364_u32
  SIPAEV_AMD_PSP_SPIROM_CONFIG = 33365_u32
  SIPAEV_AMD_PSP_DF_RIB_TOC = 33366_u32
  SIPAEV_AMD_PSP_DF_RIB0 = 33367_u32
  SIPAEV_AMD_PSP_DF_RIB1 = 33368_u32
  SIPAEV_AMD_PSP_DF_RIB2 = 33369_u32
  SIPAEV_AMD_PSP_DF_RIB3 = 33370_u32
  SIPAEV_AMD_PSP_DF_RIB4 = 33371_u32
  SIPAEV_AMD_PSP_DF_RIB5 = 33372_u32
  SIPAEV_AMD_PSP_DF_RIB6 = 33373_u32
  SIPAEV_AMD_PSP_DF_RIB7 = 33374_u32
  SIPAEV_AMD_PSP_DF_RIB8 = 33375_u32
  SIPAEV_AMD_PSP_DF_RIB9 = 33376_u32
  SIPAEV_AMD_PSP_DF_RIB10 = 33377_u32
  SIPAEV_AMD_PSP_DF_RIB11 = 33378_u32
  SIPAEV_AMD_PSP_DF_RIB12 = 33379_u32
  SIPAEV_AMD_PSP_DF_RIB13 = 33380_u32
  SIPAEV_AMD_PSP_DF_RIB14 = 33381_u32
  SIPAEV_AMD_PSP_DF_RIB15 = 33382_u32
  SIPAEV_AMD_SECURE_DEBUG_UNLOCK = 33383_u32
  SIPAEV_AMD_PSP_BL_END = 33535_u32
  SIPAEV_AMD_FTPM_DRV = 33536_u32
  SIPAEV_AMD_DRTM_DRV = 33537_u32
  SIPAEV_AMD_AGESA_DRV = 33538_u32
  SIPAEV_AMD_PSP_END = 33791_u32
  SIPAEV_ARM_BASE = 36864_u32
  SIPAEV_ARM_PCR_SCHEMA = 36865_u32
  SIPAEV_ARM_DCE = 36866_u32
  SIPAEV_ARM_DCE_PUBKEY = 36867_u32
  SIPAEV_ARM_DLME = 36868_u32
  SIPAEV_ARM_DLME_ENTRY_POINT = 36869_u32
  SIPAEV_ARM_DEBUG_CONFIG = 36870_u32
  SIPAEV_ARM_NONSECURE_CONFIG = 36871_u32
  SIPAEV_ARM_DCE_SECONDARY = 36872_u32
  SIPAEV_ARM_TZFW = 36873_u32
  SIPAEV_ARM_SEPARATOR = 36874_u32
  SIPAEV_ARM_DLME_PUBKEY = 36875_u32
  SIPAEV_ARM_DLME_SVN = 36876_u32
  SIPAEV_ARM_NO_ACTION = 36877_u32
  SIPAEV_ARM_SECURE_INT_DISABLE = 36878_u32
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
  SIPAERROR_HYPERVISORFAILURE = 196613_u32
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
  SIPAEVENT_IDK_GENERATION_STATUS = 131084_u32
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
  SIPAEVENT_SI_POLICY_SIGNER = 327729_u32
  SIPAEVENT_SI_POLICY_UPDATE_SIGNER = 327730_u32
  SIPAEVENT_REFS_VOLUME_CHECKPOINT_RECORD_CHECKSUM = 327731_u32
  SIPAEVENT_REFS_ROLLBACK_PROTECTION_FROZEN_VOLUME_CHECKSUM = 327732_u32
  SIPAEVENT_REFS_ROLLBACK_PROTECTION_USER_PAYLOAD_HASH = 327733_u32
  SIPAEVENT_REFS_ROLLBACK_PROTECTION_VERIFICATION_SUCCEEDED = 327734_u32
  SIPAEVENT_REFS_ROLLBACK_PROTECTION_VOLUME_FIRST_EVER_MOUNT = 327735_u32
  SIPAEVENT_VSM_SEALED_SI_POLICY = 327738_u32
  SIPAEVENT_VSM_DRTM_KEYROLL_DETECTED = 327739_u32
  SIPAEVENT_VSM_SRTM_UNSEAL_POLICY = 327740_u32
  SIPAEVENT_VSM_SRTM_ANTI_ROLLBACK_COUNTER = 327741_u32
  SIPAEVENT_VTL1_DUMP_CONFIG = 327744_u32
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
  SIPAEVENT_MODULE_PLUTON = 458764_u32
  SIPAEVENT_MODULE_ORIGINAL_FILENAME = 458765_u32
  SIPAEVENT_MODULE_VERSION = 458766_u32
  SIPAEVENT_PUBLISHER_OEMNAME = 458767_u32
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
  OSDEVICE_TYPE_CIMFS = 393216_u32
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
  MAX_PLUTON_UPGRADE_FILENAME_LENGTH = 64_u32
  WBCL_MAX_PLUTON_UPGRADE_HASH_LEN = 64_u32
  WBCL_HASH_LEN_SHA1 = 20_u32

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
    property diffserv_rule : UInt8[1]
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @ds_field_count : UInt32, @diffserv_rule : UInt8[1])
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
    property tc_objects : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR[1]
    def initialize(@sending_flowspec : Win32cr::Networking::WinSock::FLOWSPEC, @receiving_flowspec : Win32cr::Networking::WinSock::FLOWSPEC, @tc_objects_length : UInt32, @tc_objects : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR[1])
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

      # Nested Type S_un_ports_e__Struct_
      @[Extern]
      struct S_un_ports_e__Struct_
    property s_srcport : UInt16
    property s_dstport : UInt16
    def initialize(@s_srcport : UInt16, @s_dstport : UInt16)
    end
      end


      # Nested Type S_un_icmp_e__Struct_
      @[Extern]
      struct S_un_icmp_e__Struct_
    property s_type : UInt8
    property s_code : UInt8
    property filler : UInt16
    def initialize(@s_type : UInt8, @s_code : UInt8, @filler : UInt16)
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
    property generic_filter : Win32cr::NetworkManagement::QoS::TC_GEN_FILTER[1]
    def initialize(@length : UInt32, @owner_process_id : UInt32, @flow_name_length : UInt16, @flow_name : UInt16[256], @pFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*, @number_of_filters : UInt32, @generic_filter : Win32cr::NetworkManagement::QoS::TC_GEN_FILTER[1])
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
    property policy_element : Win32cr::NetworkManagement::QoS::RSVP_POLICY[1]
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @num_policy_element : UInt32, @policy_element : Win32cr::NetworkManagement::QoS::RSVP_POLICY[1])
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
    property buffer : UInt8[1]
    def initialize(@parameter_id : UInt32, @length : UInt32, @buffer : UInt8[1])
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
    property param_buffer : Win32cr::NetworkManagement::QoS::PARAM_BUFFER[1]
    def initialize(@guaranteed : Win32cr::NetworkManagement::QoS::AD_GUARANTEED, @param_buffer : Win32cr::NetworkManagement::QoS::PARAM_BUFFER[1])
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
    property services : Win32cr::NetworkManagement::QoS::CONTROL_SERVICE[1]
    def initialize(@object_hdr : Win32cr::NetworkManagement::QoS::QOS_OBJECT_HDR, @general_params : Win32cr::NetworkManagement::QoS::AD_GENERAL_PARAMS, @number_of_services : UInt32, @services : Win32cr::NetworkManagement::QoS::CONTROL_SERVICE[1])
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
  struct SIPAEVENT_REFS_ROLLBACK_PROTECTION_USER_PAYLOAD_HASH_DATA
    property checksum_type : UInt16
    property checksum_buffer : UInt8[1]
    def initialize(@checksum_type : UInt16, @checksum_buffer : UInt8[1])
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
  struct PLUTON_UPGRADE_IMAGEDATA
    property hashAlgID : UInt16
    property digestSize : UInt16
    property digest : UInt8[64]
    property fileName : UInt16[64]
    def initialize(@hashAlgID : UInt16, @digestSize : UInt16, @digest : UInt8[64], @fileName : UInt16[64])
    end
  end

  @[Extern]
  struct TCG_PCClientPCREventStruct
    property pcrIndex : UInt32
    property eventType : UInt32
    property digest : UInt8[20]
    property eventDataSize : UInt32
    property event : UInt8[1]
    def initialize(@pcrIndex : UInt32, @eventType : UInt32, @digest : UInt8[20], @eventDataSize : UInt32, @event : UInt8[1])
    end
  end

  @[Extern]
  struct TCG_PCClientTaggedEventStruct
    property event_id : UInt32
    property event_data_size : UInt32
    property event_data : UInt8[1]
    def initialize(@event_id : UInt32, @event_data_size : UInt32, @event_data : UInt8[1])
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
  struct SIPAEVENT_VSM_IDK_RSA_INFO
    property key_bit_length : UInt32
    property public_exp_length_bytes : UInt32
    property modulus_size_bytes : UInt32
    property public_key_data : UInt8[1]
    def initialize(@key_bit_length : UInt32, @public_exp_length_bytes : UInt32, @modulus_size_bytes : UInt32, @public_key_data : UInt8[1])
    end
  end

  @[Extern]
  struct SIPAEVENT_VSM_IDK_INFO_PAYLOAD
    property key_alg_id : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property rsa_key_info : Win32cr::NetworkManagement::QoS::SIPAEVENT_VSM_IDK_RSA_INFO
    def initialize(@rsa_key_info : Win32cr::NetworkManagement::QoS::SIPAEVENT_VSM_IDK_RSA_INFO)
    end
    end

    def initialize(@key_alg_id : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct SIPAEVENT_SI_POLICY_PAYLOAD
    property policy_version : UInt64
    property policy_name_length : UInt16
    property hash_alg_id : UInt16
    property digest_length : UInt32
    property var_length_data : UInt8[1]
    def initialize(@policy_version : UInt64, @policy_name_length : UInt16, @hash_alg_id : UInt16, @digest_length : UInt32, @var_length_data : UInt8[1])
    end
  end

  @[Extern]
  struct SIPAEVENT_SI_POLICY_CERTIFICATE_PAYLOAD
    property publisher_common_name_length : UInt16
    property issuer_common_name_length : UInt16
    property hash_alg_id : UInt32
    property digest_length : UInt16
    property var_length_data : UInt8[1]
    def initialize(@publisher_common_name_length : UInt16, @issuer_common_name_length : UInt16, @hash_alg_id : UInt32, @digest_length : UInt16, @var_length_data : UInt8[1])
    end
  end

  @[Extern]
  struct SIPAEVENT_SI_POLICY_SIGNER_PAYLOAD
    property root_id : UInt32
    property certificates_length : UInt32
    property certificates_count : UInt16
    property policy_name_length : UInt16
    property ek_us_length : UInt16
    property ek_us_count : UInt16
    property var_length_data : UInt8[1]
    def initialize(@root_id : UInt32, @certificates_length : UInt32, @certificates_count : UInt16, @policy_name_length : UInt16, @ek_us_length : UInt16, @ek_us_count : UInt16, @var_length_data : UInt8[1])
    end
  end

  @[Extern]
  struct SIPAEVENT_REVOCATION_LIST_PAYLOAD
    property creation_time : Int64
    property digest_length : UInt32
    property hash_alg_id : UInt16
    property digest : UInt8[1]
    def initialize(@creation_time : Int64, @digest_length : UInt32, @hash_alg_id : UInt16, @digest : UInt8[1])
    end
  end

  @[Extern]
  struct SIPAEVENT_KSR_SIGNATURE_PAYLOAD
    property sign_alg_id : UInt32
    property signature_length : UInt32
    property signature : UInt8[1]
    def initialize(@sign_alg_id : UInt32, @signature_length : UInt32, @signature : UInt8[1])
    end
  end

  @[Extern]
  struct SIPAEVENT_SBCP_INFO_PAYLOAD_V1
    property payload_version : UInt32
    property var_data_offset : UInt32
    property hash_alg_id : UInt16
    property digest_length : UInt16
    property options : UInt32
    property signers_count : UInt32
    property var_data : UInt8[1]
    def initialize(@payload_version : UInt32, @var_data_offset : UInt32, @hash_alg_id : UInt16, @digest_length : UInt16, @options : UInt32, @signers_count : UInt32, @var_data : UInt8[1])
    end
  end

  def qOSCreateHandle(version : Win32cr::NetworkManagement::QoS::QOS_VERSION*, qos_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSCreateHandle(version, qos_handle)
    {% end %}
  end

  def qOSCloseHandle(qos_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSCloseHandle(qos_handle)
    {% end %}
  end

  def qOSStartTrackingClient(qos_handle : Win32cr::Foundation::HANDLE, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, flags : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSStartTrackingClient(qos_handle, dest_addr, flags)
    {% end %}
  end

  def qOSStopTrackingClient(qos_handle : Win32cr::Foundation::HANDLE, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, flags : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSStopTrackingClient(qos_handle, dest_addr, flags)
    {% end %}
  end

  def qOSEnumerateFlows(qos_handle : Win32cr::Foundation::HANDLE, size : UInt32*, buffer : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSEnumerateFlows(qos_handle, size, buffer)
    {% end %}
  end

  def qOSAddSocketToFlow(qos_handle : Win32cr::Foundation::HANDLE, socket : Win32cr::Networking::WinSock::SOCKET, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, traffic_type : Win32cr::NetworkManagement::QoS::QOS_TRAFFIC_TYPE, flags : UInt32, flow_id : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSAddSocketToFlow(qos_handle, socket, dest_addr, traffic_type, flags, flow_id)
    {% end %}
  end

  def qOSRemoveSocketFromFlow(qos_handle : Win32cr::Foundation::HANDLE, socket : Win32cr::Networking::WinSock::SOCKET, flow_id : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSRemoveSocketFromFlow(qos_handle, socket, flow_id, flags)
    {% end %}
  end

  def qOSSetFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_SET_FLOW, size : UInt32, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSSetFlow(qos_handle, flow_id, operation, size, buffer, flags, overlapped)
    {% end %}
  end

  def qOSQueryFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_QUERY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSQueryFlow(qos_handle, flow_id, operation, size, buffer, flags, overlapped)
    {% end %}
  end

  def qOSNotifyFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_NOTIFY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSNotifyFlow(qos_handle, flow_id, operation, size, buffer, flags, overlapped)
    {% end %}
  end

  def qOSCancel(qos_handle : Win32cr::Foundation::HANDLE, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.QOSCancel(qos_handle, overlapped)
    {% end %}
  end

  def tcRegisterClient(tci_version : UInt32, cl_reg_ctx : Win32cr::Foundation::HANDLE, client_handler_list : Win32cr::NetworkManagement::QoS::TCI_CLIENT_FUNC_LIST*, pClientHandle : Win32cr::Foundation::HANDLE*) : UInt32
    {% if !flag?(:docs) %}
    C.TcRegisterClient(tci_version, cl_reg_ctx, client_handler_list, pClientHandle)
    {% end %}
  end

  def tcEnumerateInterfaces(client_handle : Win32cr::Foundation::HANDLE, pBufferSize : UInt32*, interface_buffer : Win32cr::NetworkManagement::QoS::TC_IFC_DESCRIPTOR*) : UInt32
    {% if !flag?(:docs) %}
    C.TcEnumerateInterfaces(client_handle, pBufferSize, interface_buffer)
    {% end %}
  end

  def tcOpenInterfaceA(pInterfaceName : Win32cr::Foundation::PSTR, client_handle : Win32cr::Foundation::HANDLE, cl_ifc_ctx : Win32cr::Foundation::HANDLE, pIfcHandle : Win32cr::Foundation::HANDLE*) : UInt32
    {% if !flag?(:docs) %}
    C.TcOpenInterfaceA(pInterfaceName, client_handle, cl_ifc_ctx, pIfcHandle)
    {% end %}
  end

  def tcOpenInterfaceW(pInterfaceName : Win32cr::Foundation::PWSTR, client_handle : Win32cr::Foundation::HANDLE, cl_ifc_ctx : Win32cr::Foundation::HANDLE, pIfcHandle : Win32cr::Foundation::HANDLE*) : UInt32
    {% if !flag?(:docs) %}
    C.TcOpenInterfaceW(pInterfaceName, client_handle, cl_ifc_ctx, pIfcHandle)
    {% end %}
  end

  def tcCloseInterface(ifc_handle : Win32cr::Foundation::HANDLE) : UInt32
    {% if !flag?(:docs) %}
    C.TcCloseInterface(ifc_handle)
    {% end %}
  end

  def tcQueryInterface(ifc_handle : Win32cr::Foundation::HANDLE, pGuidParam : LibC::GUID*, notify_change : Win32cr::Foundation::BOOLEAN, pBufferSize : UInt32*, buffer : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.TcQueryInterface(ifc_handle, pGuidParam, notify_change, pBufferSize, buffer)
    {% end %}
  end

  def tcSetInterface(ifc_handle : Win32cr::Foundation::HANDLE, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.TcSetInterface(ifc_handle, pGuidParam, buffer_size, buffer)
    {% end %}
  end

  def tcQueryFlowA(pFlowName : Win32cr::Foundation::PSTR, pGuidParam : LibC::GUID*, pBufferSize : UInt32*, buffer : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.TcQueryFlowA(pFlowName, pGuidParam, pBufferSize, buffer)
    {% end %}
  end

  def tcQueryFlowW(pFlowName : Win32cr::Foundation::PWSTR, pGuidParam : LibC::GUID*, pBufferSize : UInt32*, buffer : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.TcQueryFlowW(pFlowName, pGuidParam, pBufferSize, buffer)
    {% end %}
  end

  def tcSetFlowA(pFlowName : Win32cr::Foundation::PSTR, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.TcSetFlowA(pFlowName, pGuidParam, buffer_size, buffer)
    {% end %}
  end

  def tcSetFlowW(pFlowName : Win32cr::Foundation::PWSTR, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.TcSetFlowW(pFlowName, pGuidParam, buffer_size, buffer)
    {% end %}
  end

  def tcAddFlow(ifc_handle : Win32cr::Foundation::HANDLE, cl_flow_ctx : Win32cr::Foundation::HANDLE, flags : UInt32, pGenericFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*, pFlowHandle : Win32cr::Foundation::HANDLE*) : UInt32
    {% if !flag?(:docs) %}
    C.TcAddFlow(ifc_handle, cl_flow_ctx, flags, pGenericFlow, pFlowHandle)
    {% end %}
  end

  def tcGetFlowNameA(flow_handle : Win32cr::Foundation::HANDLE, str_size : UInt32, pFlowName : Win32cr::Foundation::PSTR) : UInt32
    {% if !flag?(:docs) %}
    C.TcGetFlowNameA(flow_handle, str_size, pFlowName)
    {% end %}
  end

  def tcGetFlowNameW(flow_handle : Win32cr::Foundation::HANDLE, str_size : UInt32, pFlowName : Win32cr::Foundation::PWSTR) : UInt32
    {% if !flag?(:docs) %}
    C.TcGetFlowNameW(flow_handle, str_size, pFlowName)
    {% end %}
  end

  def tcModifyFlow(flow_handle : Win32cr::Foundation::HANDLE, pGenericFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*) : UInt32
    {% if !flag?(:docs) %}
    C.TcModifyFlow(flow_handle, pGenericFlow)
    {% end %}
  end

  def tcAddFilter(flow_handle : Win32cr::Foundation::HANDLE, pGenericFilter : Win32cr::NetworkManagement::QoS::TC_GEN_FILTER*, pFilterHandle : Win32cr::Foundation::HANDLE*) : UInt32
    {% if !flag?(:docs) %}
    C.TcAddFilter(flow_handle, pGenericFilter, pFilterHandle)
    {% end %}
  end

  def tcDeregisterClient(client_handle : Win32cr::Foundation::HANDLE) : UInt32
    {% if !flag?(:docs) %}
    C.TcDeregisterClient(client_handle)
    {% end %}
  end

  def tcDeleteFlow(flow_handle : Win32cr::Foundation::HANDLE) : UInt32
    {% if !flag?(:docs) %}
    C.TcDeleteFlow(flow_handle)
    {% end %}
  end

  def tcDeleteFilter(filter_handle : Win32cr::Foundation::HANDLE) : UInt32
    {% if !flag?(:docs) %}
    C.TcDeleteFilter(filter_handle)
    {% end %}
  end

  def tcEnumerateFlows(ifc_handle : Win32cr::Foundation::HANDLE, pEnumHandle : Win32cr::Foundation::HANDLE*, pFlowCount : UInt32*, pBufSize : UInt32*, buffer : Win32cr::NetworkManagement::QoS::ENUMERATION_BUFFER*) : UInt32
    {% if !flag?(:docs) %}
    C.TcEnumerateFlows(ifc_handle, pEnumHandle, pFlowCount, pBufSize, buffer)
    {% end %}
  end

  @[Link("qwave")]
  @[Link("traffic")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun QOSCreateHandle(version : Win32cr::NetworkManagement::QoS::QOS_VERSION*, qos_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSCloseHandle(qos_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSStartTrackingClient(qos_handle : Win32cr::Foundation::HANDLE, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSStopTrackingClient(qos_handle : Win32cr::Foundation::HANDLE, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSEnumerateFlows(qos_handle : Win32cr::Foundation::HANDLE, size : UInt32*, buffer : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSAddSocketToFlow(qos_handle : Win32cr::Foundation::HANDLE, socket : Win32cr::Networking::WinSock::SOCKET, dest_addr : Win32cr::Networking::WinSock::SOCKADDR*, traffic_type : Win32cr::NetworkManagement::QoS::QOS_TRAFFIC_TYPE, flags : UInt32, flow_id : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSRemoveSocketFromFlow(qos_handle : Win32cr::Foundation::HANDLE, socket : Win32cr::Networking::WinSock::SOCKET, flow_id : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSSetFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_SET_FLOW, size : UInt32, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSQueryFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_QUERY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSNotifyFlow(qos_handle : Win32cr::Foundation::HANDLE, flow_id : UInt32, operation : Win32cr::NetworkManagement::QoS::QOS_NOTIFY_FLOW, size : UInt32*, buffer : Void*, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QOSCancel(qos_handle : Win32cr::Foundation::HANDLE, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TcRegisterClient(tci_version : UInt32, cl_reg_ctx : Win32cr::Foundation::HANDLE, client_handler_list : Win32cr::NetworkManagement::QoS::TCI_CLIENT_FUNC_LIST*, pClientHandle : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun TcEnumerateInterfaces(client_handle : Win32cr::Foundation::HANDLE, pBufferSize : UInt32*, interface_buffer : Win32cr::NetworkManagement::QoS::TC_IFC_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun TcOpenInterfaceA(pInterfaceName : Win32cr::Foundation::PSTR, client_handle : Win32cr::Foundation::HANDLE, cl_ifc_ctx : Win32cr::Foundation::HANDLE, pIfcHandle : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun TcOpenInterfaceW(pInterfaceName : Win32cr::Foundation::PWSTR, client_handle : Win32cr::Foundation::HANDLE, cl_ifc_ctx : Win32cr::Foundation::HANDLE, pIfcHandle : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun TcCloseInterface(ifc_handle : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun TcQueryInterface(ifc_handle : Win32cr::Foundation::HANDLE, pGuidParam : LibC::GUID*, notify_change : Win32cr::Foundation::BOOLEAN, pBufferSize : UInt32*, buffer : Void*) : UInt32

    # :nodoc:
    fun TcSetInterface(ifc_handle : Win32cr::Foundation::HANDLE, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32

    # :nodoc:
    fun TcQueryFlowA(pFlowName : Win32cr::Foundation::PSTR, pGuidParam : LibC::GUID*, pBufferSize : UInt32*, buffer : Void*) : UInt32

    # :nodoc:
    fun TcQueryFlowW(pFlowName : Win32cr::Foundation::PWSTR, pGuidParam : LibC::GUID*, pBufferSize : UInt32*, buffer : Void*) : UInt32

    # :nodoc:
    fun TcSetFlowA(pFlowName : Win32cr::Foundation::PSTR, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32

    # :nodoc:
    fun TcSetFlowW(pFlowName : Win32cr::Foundation::PWSTR, pGuidParam : LibC::GUID*, buffer_size : UInt32, buffer : Void*) : UInt32

    # :nodoc:
    fun TcAddFlow(ifc_handle : Win32cr::Foundation::HANDLE, cl_flow_ctx : Win32cr::Foundation::HANDLE, flags : UInt32, pGenericFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*, pFlowHandle : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun TcGetFlowNameA(flow_handle : Win32cr::Foundation::HANDLE, str_size : UInt32, pFlowName : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun TcGetFlowNameW(flow_handle : Win32cr::Foundation::HANDLE, str_size : UInt32, pFlowName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun TcModifyFlow(flow_handle : Win32cr::Foundation::HANDLE, pGenericFlow : Win32cr::NetworkManagement::QoS::TC_GEN_FLOW*) : UInt32

    # :nodoc:
    fun TcAddFilter(flow_handle : Win32cr::Foundation::HANDLE, pGenericFilter : Win32cr::NetworkManagement::QoS::TC_GEN_FILTER*, pFilterHandle : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun TcDeregisterClient(client_handle : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun TcDeleteFlow(flow_handle : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun TcDeleteFilter(filter_handle : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun TcEnumerateFlows(ifc_handle : Win32cr::Foundation::HANDLE, pEnumHandle : Win32cr::Foundation::HANDLE*, pFlowCount : UInt32*, pBufSize : UInt32*, buffer : Win32cr::NetworkManagement::QoS::ENUMERATION_BUFFER*) : UInt32

  end
  {% end %}
end