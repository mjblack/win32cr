require "../foundation.cr"
require "../graphics/gdi.cr"
require "../ui/controls.cr"
require "../system/com.cr"
require "../system/io.cr"
require "../system/registry.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:winfax.dll")]
@[Link(ldflags: "/DELAYLOAD:fxsutility.dll")]
@[Link(ldflags: "/DELAYLOAD:sti.dll")]
{% else %}
@[Link("winfax")]
@[Link("fxsutility")]
@[Link("sti")]
{% end %}
lib LibWin32
  FS_INITIALIZING = 536870912_u32
  FS_DIALING = 536870913_u32
  FS_TRANSMITTING = 536870914_u32
  FS_RECEIVING = 536870916_u32
  FS_COMPLETED = 536870920_u32
  FS_HANDLED = 536870928_u32
  FS_LINE_UNAVAILABLE = 536870944_u32
  FS_BUSY = 536870976_u32
  FS_NO_ANSWER = 536871040_u32
  FS_BAD_ADDRESS = 536871168_u32
  FS_NO_DIAL_TONE = 536871424_u32
  FS_DISCONNECTED = 536871936_u32
  FS_FATAL_ERROR = 536872960_u32
  FS_NOT_FAX_CALL = 536875008_u32
  FS_CALL_DELAYED = 536879104_u32
  FS_CALL_BLACKLISTED = 536887296_u32
  FS_USER_ABORT = 538968064_u32
  FS_ANSWERED = 545259520_u32
  FAXDEVRECEIVE_SIZE = 4096_u32
  FAXDEVREPORTSTATUS_SIZE = 4096_u32
  FAX_ERR_START = 7001_i32
  FAX_ERR_SRV_OUTOFMEMORY = 7001_i32
  FAX_ERR_GROUP_NOT_FOUND = 7002_i32
  FAX_ERR_BAD_GROUP_CONFIGURATION = 7003_i32
  FAX_ERR_GROUP_IN_USE = 7004_i32
  FAX_ERR_RULE_NOT_FOUND = 7005_i32
  FAX_ERR_NOT_NTFS = 7006_i32
  FAX_ERR_DIRECTORY_IN_USE = 7007_i32
  FAX_ERR_FILE_ACCESS_DENIED = 7008_i32
  FAX_ERR_MESSAGE_NOT_FOUND = 7009_i32
  FAX_ERR_DEVICE_NUM_LIMIT_EXCEEDED = 7010_i32
  FAX_ERR_NOT_SUPPORTED_ON_THIS_SKU = 7011_i32
  FAX_ERR_VERSION_MISMATCH = 7012_i32
  FAX_ERR_RECIPIENTS_LIMIT = 7013_i32
  FAX_ERR_END = 7013_i32
  FAX_E_SRV_OUTOFMEMORY = -2147214503_i32
  FAX_E_GROUP_NOT_FOUND = -2147214502_i32
  FAX_E_BAD_GROUP_CONFIGURATION = -2147214501_i32
  FAX_E_GROUP_IN_USE = -2147214500_i32
  FAX_E_RULE_NOT_FOUND = -2147214499_i32
  FAX_E_NOT_NTFS = -2147214498_i32
  FAX_E_DIRECTORY_IN_USE = -2147214497_i32
  FAX_E_FILE_ACCESS_DENIED = -2147214496_i32
  FAX_E_MESSAGE_NOT_FOUND = -2147214495_i32
  FAX_E_DEVICE_NUM_LIMIT_EXCEEDED = -2147214494_i32
  FAX_E_NOT_SUPPORTED_ON_THIS_SKU = -2147214493_i32
  FAX_E_VERSION_MISMATCH = -2147214492_i32
  FAX_E_RECIPIENTS_LIMIT = -2147214491_i32
  JT_UNKNOWN = 0_u32
  JT_SEND = 1_u32
  JT_RECEIVE = 2_u32
  JT_ROUTING = 3_u32
  JT_FAIL_RECEIVE = 4_u32
  JS_PENDING = 0_u32
  JS_INPROGRESS = 1_u32
  JS_DELETING = 2_u32
  JS_FAILED = 4_u32
  JS_PAUSED = 8_u32
  JS_NOLINE = 16_u32
  JS_RETRYING = 32_u32
  JS_RETRIES_EXCEEDED = 64_u32
  FPS_DIALING = 536870913_u32
  FPS_SENDING = 536870914_u32
  FPS_RECEIVING = 536870916_u32
  FPS_COMPLETED = 536870920_u32
  FPS_HANDLED = 536870928_u32
  FPS_UNAVAILABLE = 536870944_u32
  FPS_BUSY = 536870976_u32
  FPS_NO_ANSWER = 536871040_u32
  FPS_BAD_ADDRESS = 536871168_u32
  FPS_NO_DIAL_TONE = 536871424_u32
  FPS_DISCONNECTED = 536871936_u32
  FPS_FATAL_ERROR = 536872960_u32
  FPS_NOT_FAX_CALL = 536875008_u32
  FPS_CALL_DELAYED = 536879104_u32
  FPS_CALL_BLACKLISTED = 536887296_u32
  FPS_INITIALIZING = 536903680_u32
  FPS_OFFLINE = 536936448_u32
  FPS_RINGING = 537001984_u32
  FPS_AVAILABLE = 537919488_u32
  FPS_ABORTING = 538968064_u32
  FPS_ROUTING = 541065216_u32
  FPS_ANSWERED = 545259520_u32
  FPF_RECEIVE = 1_u32
  FPF_SEND = 2_u32
  FPF_VIRTUAL = 4_u32
  FEI_DIALING = 1_u32
  FEI_SENDING = 2_u32
  FEI_RECEIVING = 3_u32
  FEI_COMPLETED = 4_u32
  FEI_BUSY = 5_u32
  FEI_NO_ANSWER = 6_u32
  FEI_BAD_ADDRESS = 7_u32
  FEI_NO_DIAL_TONE = 8_u32
  FEI_DISCONNECTED = 9_u32
  FEI_FATAL_ERROR = 10_u32
  FEI_NOT_FAX_CALL = 11_u32
  FEI_CALL_DELAYED = 12_u32
  FEI_CALL_BLACKLISTED = 13_u32
  FEI_RINGING = 14_u32
  FEI_ABORTING = 15_u32
  FEI_ROUTING = 16_u32
  FEI_MODEM_POWERED_ON = 17_u32
  FEI_MODEM_POWERED_OFF = 18_u32
  FEI_IDLE = 19_u32
  FEI_FAXSVC_ENDED = 20_u32
  FEI_ANSWERED = 21_u32
  FEI_JOB_QUEUED = 22_u32
  FEI_DELETED = 23_u32
  FEI_INITIALIZING = 24_u32
  FEI_LINE_UNAVAILABLE = 25_u32
  FEI_HANDLED = 26_u32
  FEI_FAXSVC_STARTED = 27_u32
  FEI_NEVENTS = 27_u32
  FAX_JOB_SUBMIT = 1_u32
  FAX_JOB_QUERY = 2_u32
  FAX_CONFIG_QUERY = 4_u32
  FAX_CONFIG_SET = 8_u32
  FAX_PORT_QUERY = 16_u32
  FAX_PORT_SET = 32_u32
  FAX_JOB_MANAGE = 64_u32
  STI_UNICODE = 1_u32
  CLSID_Sti = "b323f8e0-2e68-11d0-90ea-00aa0060f86c"
  GUID_DeviceArrivedLaunch = "740d9ee6-70f1-11d1-ad10-00a02438ad48"
  GUID_ScanImage = "a6c5a715-8c6e-11d2-977a-0000f87a926f"
  GUID_ScanPrintImage = "b441f425-8c6e-11d2-977a-0000f87a926f"
  GUID_ScanFaxImage = "c00eb793-8c6e-11d2-977a-0000f87a926f"
  GUID_STIUserDefined1 = "c00eb795-8c6e-11d2-977a-0000f87a926f"
  GUID_STIUserDefined2 = "c77ae9c5-8c6e-11d2-977a-0000f87a926f"
  GUID_STIUserDefined3 = "c77ae9c6-8c6e-11d2-977a-0000f87a926f"
  STI_VERSION_FLAG_MASK = 4278190080_u32
  STI_VERSION_FLAG_UNICODE = 16777216_u32
  STI_VERSION_REAL = 2_u32
  STI_VERSION_MIN_ALLOWED = 2_u32
  STI_VERSION = 2_u32
  STI_MAX_INTERNAL_NAME_LENGTH = 128_u32
  STI_GENCAP_NOTIFICATIONS = 1_u32
  STI_GENCAP_POLLING_NEEDED = 2_u32
  STI_GENCAP_GENERATE_ARRIVALEVENT = 4_u32
  STI_GENCAP_AUTO_PORTSELECT = 8_u32
  STI_GENCAP_WIA = 16_u32
  STI_GENCAP_SUBSET = 32_u32
  WIA_INCOMPAT_XP = 1_u32
  STI_HW_CONFIG_UNKNOWN = 1_u32
  STI_HW_CONFIG_SCSI = 2_u32
  STI_HW_CONFIG_USB = 4_u32
  STI_HW_CONFIG_SERIAL = 8_u32
  STI_HW_CONFIG_PARALLEL = 16_u32
  STI_DEVSTATUS_ONLINE_STATE = 1_u32
  STI_DEVSTATUS_EVENTS_STATE = 2_u32
  STI_ONLINESTATE_OPERATIONAL = 1_u32
  STI_ONLINESTATE_PENDING = 2_u32
  STI_ONLINESTATE_ERROR = 4_u32
  STI_ONLINESTATE_PAUSED = 8_u32
  STI_ONLINESTATE_PAPER_JAM = 16_u32
  STI_ONLINESTATE_PAPER_PROBLEM = 32_u32
  STI_ONLINESTATE_OFFLINE = 64_u32
  STI_ONLINESTATE_IO_ACTIVE = 128_u32
  STI_ONLINESTATE_BUSY = 256_u32
  STI_ONLINESTATE_TRANSFERRING = 512_u32
  STI_ONLINESTATE_INITIALIZING = 1024_u32
  STI_ONLINESTATE_WARMING_UP = 2048_u32
  STI_ONLINESTATE_USER_INTERVENTION = 4096_u32
  STI_ONLINESTATE_POWER_SAVE = 8192_u32
  STI_EVENTHANDLING_ENABLED = 1_u32
  STI_EVENTHANDLING_POLLING = 2_u32
  STI_EVENTHANDLING_PENDING = 4_u32
  STI_DIAGCODE_HWPRESENCE = 1_u32
  STI_TRACE_INFORMATION = 1_u32
  STI_TRACE_WARNING = 2_u32
  STI_TRACE_ERROR = 4_u32
  STI_SUBSCRIBE_FLAG_WINDOW = 1_u32
  STI_SUBSCRIBE_FLAG_EVENT = 2_u32
  MAX_NOTIFICATION_DATA = 64_u32
  STI_DEVICE_CREATE_STATUS = 1_u32
  STI_DEVICE_CREATE_DATA = 2_u32
  STI_DEVICE_CREATE_BOTH = 3_u32
  STI_DEVICE_CREATE_MASK = 65535_u32
  STIEDFL_ALLDEVICES = 0_u32
  STIEDFL_ATTACHEDONLY = 1_u32
  STI_RAW_RESERVED = 4096_u32
  STI_OK = 0_i32
  STI_ERROR_NO_ERROR = 0_i32
  STI_NOTCONNECTED = 1_i32
  STI_CHANGENOEFFECT = 1_i32
  STIERR_OLD_VERSION = -2147023746_i32
  STIERR_BETA_VERSION = -2147023743_i32
  STIERR_BADDRIVER = -2147024777_i32
  STIERR_DEVICENOTREG = -2147221164_i32
  STIERR_OBJECTNOTFOUND = -2147024894_i32
  STIERR_INVALID_PARAM = -2147024809_i32
  STIERR_NOINTERFACE = -2147467262_i32
  STIERR_GENERIC = -2147467259_i32
  STIERR_OUTOFMEMORY = -2147024882_i32
  STIERR_UNSUPPORTED = -2147467263_i32
  STIERR_NOT_INITIALIZED = -2147024875_i32
  STIERR_ALREADY_INITIALIZED = -2147023649_i32
  STIERR_DEVICE_LOCKED = -2147024863_i32
  STIERR_READONLY = -2147024891_i32
  STIERR_NOTINITIALIZED = -2147024891_i32
  STIERR_NEEDS_LOCK = -2147024738_i32
  STIERR_SHARING_VIOLATION = -2147024864_i32
  STIERR_HANDLEEXISTS = -2147024713_i32
  STIERR_INVALID_DEVICE_NAME = -2147024773_i32
  STIERR_INVALID_HW_TYPE = -2147024883_i32
  STIERR_NOEVENTS = -2147024637_i32
  STIERR_DEVICE_NOTREADY = -2147024875_i32
  IS_DIGITAL_CAMERA_VAL = 1_u32
  SUPPORTS_MSCPLUS_VAL = 1_u32
  DEVPKEY_WIA_DeviceType = PROPERTYKEY.new(LibC::GUID.new(0x6bdd1fc6_u32, 0x810f_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0xc7_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0xe2_u8, 0x9_u8, 0x2f_u8]), 2_u32)
  DEVPKEY_WIA_USDClassId = PROPERTYKEY.new(LibC::GUID.new(0x6bdd1fc6_u32, 0x810f_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0xc7_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0xe2_u8, 0x9_u8, 0x2f_u8]), 3_u32)
  STI_USD_GENCAP_NATIVE_PUSHSUPPORT = 1_u32
  STI_DEVICE_CREATE_FOR_MONITOR = 16777216_u32
  Ldefault_prefetch_size = 100_i32
  Wcharreassign_recipients_delimiter = 59_u16
  FaxServer = LibC::GUID.new(0xcda8acb0_u32, 0x8cf5_u16, 0x4f6c_u16, StaticArray[0x9b_u8, 0xa2_u8, 0x59_u8, 0x31_u8, 0xd4_u8, 0xc_u8, 0x8c_u8, 0xae_u8])
  FaxDeviceProviders = LibC::GUID.new(0xeb8fe768_u32, 0x875a_u16, 0x4f5f_u16, StaticArray[0x82_u8, 0xc5_u8, 0x3_u8, 0xf2_u8, 0x3a_u8, 0xac_u8, 0x1b_u8, 0xd7_u8])
  FaxDevices = LibC::GUID.new(0x5589e28e_u32, 0x23cb_u16, 0x4919_u16, StaticArray[0x88_u8, 0x8_u8, 0xe6_u8, 0x10_u8, 0x18_u8, 0x46_u8, 0xe8_u8, 0xd_u8])
  FaxInboundRouting = LibC::GUID.new(0xe80248ed_u32, 0xad65_u16, 0x4218_u16, StaticArray[0x81_u8, 0x8_u8, 0x99_u8, 0x19_u8, 0x24_u8, 0xd4_u8, 0xe7_u8, 0xed_u8])
  FaxFolders = LibC::GUID.new(0xc35211d7_u32, 0x5776_u16, 0x48cb_u16, StaticArray[0xaf_u8, 0x44_u8, 0xc3_u8, 0x1b_u8, 0xe3_u8, 0xb2_u8, 0xcf_u8, 0xe5_u8])
  FaxLoggingOptions = LibC::GUID.new(0x1bf9eea6_u32, 0xece0_u16, 0x4785_u16, StaticArray[0xa1_u8, 0x8b_u8, 0xde_u8, 0x56_u8, 0xe9_u8, 0xee_u8, 0xf9_u8, 0x6a_u8])
  FaxActivity = LibC::GUID.new(0xcfef5d0e_u32, 0xe84d_u16, 0x462e_u16, StaticArray[0xaa_u8, 0xbb_u8, 0x87_u8, 0xd3_u8, 0x1e_u8, 0xb0_u8, 0x4f_u8, 0xef_u8])
  FaxOutboundRouting = LibC::GUID.new(0xc81b385e_u32, 0xb869_u16, 0x4afd_u16, StaticArray[0x86_u8, 0xc0_u8, 0x61_u8, 0x64_u8, 0x98_u8, 0xed_u8, 0x9b_u8, 0xe2_u8])
  FaxReceiptOptions = LibC::GUID.new(0x6982487b_u32, 0x227b_u16, 0x4c96_u16, StaticArray[0xa6_u8, 0x1c_u8, 0x24_u8, 0x83_u8, 0x48_u8, 0xb0_u8, 0x5a_u8, 0xb6_u8])
  FaxSecurity = LibC::GUID.new(0x10c4ddde_u32, 0xabf0_u16, 0x43df_u16, StaticArray[0x96_u8, 0x4f_u8, 0x7f_u8, 0x3a_u8, 0xc2_u8, 0x1a_u8, 0x4c_u8, 0x7b_u8])
  FaxDocument = LibC::GUID.new(0xf3f9f91_u32, 0xc838_u16, 0x415e_u16, StaticArray[0xa4_u8, 0xf3_u8, 0x3e_u8, 0x82_u8, 0x8c_u8, 0xa4_u8, 0x45_u8, 0xe0_u8])
  FaxSender = LibC::GUID.new(0x265d84d0_u32, 0x1850_u16, 0x4360_u16, StaticArray[0xb7_u8, 0xc8_u8, 0x75_u8, 0x8b_u8, 0xbb_u8, 0x5f_u8, 0xb_u8, 0x96_u8])
  FaxRecipients = LibC::GUID.new(0xea9bdf53_u32, 0x10a9_u16, 0x4d4f_u16, StaticArray[0xa0_u8, 0x67_u8, 0x63_u8, 0xc8_u8, 0xf8_u8, 0x4f_u8, 0x1_u8, 0xb0_u8])
  FaxIncomingArchive = LibC::GUID.new(0x8426c56a_u32, 0x35a1_u16, 0x4c6f_u16, StaticArray[0xaf_u8, 0x93_u8, 0xfc_u8, 0x95_u8, 0x24_u8, 0x22_u8, 0xe2_u8, 0xc2_u8])
  FaxIncomingQueue = LibC::GUID.new(0x69131717_u32, 0xf3f1_u16, 0x40e3_u16, StaticArray[0x80_u8, 0x9d_u8, 0xa6_u8, 0xcb_u8, 0xf7_u8, 0xbd_u8, 0x85_u8, 0xe5_u8])
  FaxOutgoingArchive = LibC::GUID.new(0x43c28403_u32, 0xe04f_u16, 0x474d_u16, StaticArray[0x99_u8, 0xc_u8, 0xb9_u8, 0x46_u8, 0x69_u8, 0x14_u8, 0x8f_u8, 0x59_u8])
  FaxOutgoingQueue = LibC::GUID.new(0x7421169e_u32, 0x8c43_u16, 0x4b0d_u16, StaticArray[0xbb_u8, 0x16_u8, 0x64_u8, 0x5c_u8, 0x8f_u8, 0xa4_u8, 0x3_u8, 0x57_u8])
  FaxIncomingMessageIterator = LibC::GUID.new(0x6088e1d8_u32, 0x3fc8_u16, 0x45c2_u16, StaticArray[0x87_u8, 0xb1_u8, 0x90_u8, 0x9a_u8, 0x29_u8, 0x60_u8, 0x7e_u8, 0xa9_u8])
  FaxIncomingMessage = LibC::GUID.new(0x1932fcf7_u32, 0x9d43_u16, 0x4d5a_u16, StaticArray[0x89_u8, 0xff_u8, 0x3_u8, 0x86_u8, 0x1b_u8, 0x32_u8, 0x17_u8, 0x36_u8])
  FaxOutgoingJobs = LibC::GUID.new(0x92bf2a6c_u32, 0x37be_u16, 0x43fa_u16, StaticArray[0xa3_u8, 0x7d_u8, 0xcb_u8, 0xe_u8, 0x5f_u8, 0x75_u8, 0x3b_u8, 0x35_u8])
  FaxOutgoingJob = LibC::GUID.new(0x71bb429c_u32, 0xef9_u16, 0x4915_u16, StaticArray[0xbe_u8, 0xc5_u8, 0xa5_u8, 0xd8_u8, 0x97_u8, 0xa3_u8, 0xe9_u8, 0x24_u8])
  FaxOutgoingMessageIterator = LibC::GUID.new(0x8a3224d0_u32, 0xd30b_u16, 0x49de_u16, StaticArray[0x98_u8, 0x13_u8, 0xcb_u8, 0x38_u8, 0x57_u8, 0x90_u8, 0xfb_u8, 0xbb_u8])
  FaxOutgoingMessage = LibC::GUID.new(0x91b4a378_u32, 0x4ad8_u16, 0x4aef_u16, StaticArray[0xa4_u8, 0xdc_u8, 0x97_u8, 0xd9_u8, 0x6e_u8, 0x93_u8, 0x9a_u8, 0x3a_u8])
  FaxIncomingJobs = LibC::GUID.new(0xa1bb8a43_u32, 0x8866_u16, 0x4fb7_u16, StaticArray[0xa1_u8, 0x5d_u8, 0x62_u8, 0x66_u8, 0xc8_u8, 0x75_u8, 0xa5_u8, 0xcc_u8])
  FaxIncomingJob = LibC::GUID.new(0xc47311ec_u32, 0xae32_u16, 0x41b8_u16, StaticArray[0xae_u8, 0x4b_u8, 0x3e_u8, 0xae_u8, 0x6_u8, 0x29_u8, 0xd0_u8, 0xc9_u8])
  FaxDeviceProvider = LibC::GUID.new(0x17cf1aa3_u32, 0xf5eb_u16, 0x484a_u16, StaticArray[0x9c_u8, 0x9a_u8, 0x44_u8, 0x40_u8, 0xa5_u8, 0xba_u8, 0xab_u8, 0xfc_u8])
  FaxDevice = LibC::GUID.new(0x59e3a5b2_u32, 0xd676_u16, 0x484b_u16, StaticArray[0xa6_u8, 0xde_u8, 0x72_u8, 0xb_u8, 0xfa_u8, 0x89_u8, 0xb5_u8, 0xaf_u8])
  FaxActivityLogging = LibC::GUID.new(0xf0a0294e_u32, 0x3bbd_u16, 0x48b8_u16, StaticArray[0x8f_u8, 0x13_u8, 0x8c_u8, 0x59_u8, 0x1a_u8, 0x55_u8, 0xbd_u8, 0xbc_u8])
  FaxEventLogging = LibC::GUID.new(0xa6850930_u32, 0xa0f6_u16, 0x4a6f_u16, StaticArray[0x95_u8, 0xb7_u8, 0xdb_u8, 0x2e_u8, 0xbf_u8, 0x3d_u8, 0x2_u8, 0xe3_u8])
  FaxOutboundRoutingGroups = LibC::GUID.new(0xccbea1a5_u32, 0xe2b4_u16, 0x4b57_u16, StaticArray[0x94_u8, 0x21_u8, 0xb0_u8, 0x4b_u8, 0x62_u8, 0x89_u8, 0x46_u8, 0x4b_u8])
  FaxOutboundRoutingGroup = LibC::GUID.new(0x213f3e0_u32, 0x6791_u16, 0x4d77_u16, StaticArray[0xa2_u8, 0x71_u8, 0x4_u8, 0xd2_u8, 0x35_u8, 0x7c_u8, 0x50_u8, 0xd6_u8])
  FaxDeviceIds = LibC::GUID.new(0xcdc539ea_u32, 0x7277_u16, 0x460e_u16, StaticArray[0x8d_u8, 0xe0_u8, 0x48_u8, 0xa0_u8, 0xa5_u8, 0x76_u8, 0xd_u8, 0x1f_u8])
  FaxOutboundRoutingRules = LibC::GUID.new(0xd385beca_u32, 0xe624_u16, 0x4473_u16, StaticArray[0xbf_u8, 0xaa_u8, 0x9f_u8, 0x40_u8, 0x0_u8, 0x83_u8, 0x1f_u8, 0x54_u8])
  FaxOutboundRoutingRule = LibC::GUID.new(0x6549eebf_u32, 0x8d1_u16, 0x475a_u16, StaticArray[0x82_u8, 0x8b_u8, 0x3b_u8, 0xf1_u8, 0x5_u8, 0x95_u8, 0x2f_u8, 0xa0_u8])
  FaxInboundRoutingExtensions = LibC::GUID.new(0x189a48ed_u32, 0x623c_u16, 0x4c0d_u16, StaticArray[0x80_u8, 0xf2_u8, 0xd6_u8, 0x6c_u8, 0x7b_u8, 0x9e_u8, 0xfe_u8, 0xc2_u8])
  FaxInboundRoutingExtension = LibC::GUID.new(0x1d7dfb51_u32, 0x7207_u16, 0x4436_u16, StaticArray[0xa0_u8, 0xd9_u8, 0x24_u8, 0xe3_u8, 0x2e_u8, 0xe5_u8, 0x69_u8, 0x88_u8])
  FaxInboundRoutingMethods = LibC::GUID.new(0x25fcb76a_u32, 0xb750_u16, 0x4b82_u16, StaticArray[0x92_u8, 0x66_u8, 0xfb_u8, 0xbb_u8, 0xae_u8, 0x89_u8, 0x22_u8, 0xba_u8])
  FaxInboundRoutingMethod = LibC::GUID.new(0x4b9fd75c_u32, 0x194_u16, 0x4b72_u16, StaticArray[0x9c_u8, 0xe5_u8, 0x2_u8, 0xa8_u8, 0x20_u8, 0x5a_u8, 0xc7_u8, 0xd4_u8])
  FaxJobStatus = LibC::GUID.new(0x7bf222f4_u32, 0xbe8d_u16, 0x442f_u16, StaticArray[0x84_u8, 0x1d_u8, 0x61_u8, 0x32_u8, 0x74_u8, 0x24_u8, 0x23_u8, 0xbb_u8])
  FaxRecipient = LibC::GUID.new(0x60bf3301_u32, 0x7df8_u16, 0x4bd8_u16, StaticArray[0x91_u8, 0x48_u8, 0x7b_u8, 0x58_u8, 0x1_u8, 0xf9_u8, 0xef_u8, 0xdf_u8])
  FaxConfiguration = LibC::GUID.new(0x5857326f_u32, 0xe7b3_u16, 0x41a7_u16, StaticArray[0x9c_u8, 0x19_u8, 0xa9_u8, 0x1b_u8, 0x46_u8, 0x3e_u8, 0x2d_u8, 0x56_u8])
  FaxAccountSet = LibC::GUID.new(0xfbc23c4b_u32, 0x79e0_u16, 0x4291_u16, StaticArray[0xbc_u8, 0x56_u8, 0xc1_u8, 0x2e_u8, 0x25_u8, 0x3b_u8, 0xbf_u8, 0x3a_u8])
  FaxAccounts = LibC::GUID.new(0xda1f94aa_u32, 0xee2c_u16, 0x47c0_u16, StaticArray[0x8f_u8, 0x4f_u8, 0x2a_u8, 0x21_u8, 0x70_u8, 0x75_u8, 0xb7_u8, 0x6e_u8])
  FaxAccount = LibC::GUID.new(0xa7e0647f_u32, 0x4524_u16, 0x4464_u16, StaticArray[0xa5_u8, 0x6d_u8, 0xb9_u8, 0xfe_u8, 0x66_u8, 0x6f_u8, 0x71_u8, 0x5e_u8])
  FaxAccountFolders = LibC::GUID.new(0x85398f49_u32, 0xc034_u16, 0x4a3f_u16, StaticArray[0x82_u8, 0x1c_u8, 0xdb_u8, 0x7d_u8, 0x68_u8, 0x5e_u8, 0x81_u8, 0x29_u8])
  FaxAccountIncomingQueue = LibC::GUID.new(0x9bcf6094_u32, 0xb4da_u16, 0x45f4_u16, StaticArray[0xb8_u8, 0xd6_u8, 0xdd_u8, 0xeb_u8, 0x21_u8, 0x86_u8, 0x65_u8, 0x2c_u8])
  FaxAccountOutgoingQueue = LibC::GUID.new(0xfeeceefb_u32, 0xc149_u16, 0x48ba_u16, StaticArray[0xba_u8, 0xb8_u8, 0xb7_u8, 0x91_u8, 0xe1_u8, 0x1_u8, 0xf6_u8, 0x2f_u8])
  FaxAccountIncomingArchive = LibC::GUID.new(0x14b33db5_u32, 0x4c40_u16, 0x4ecf_u16, StaticArray[0x9e_u8, 0xf8_u8, 0xa3_u8, 0x60_u8, 0xcb_u8, 0xe8_u8, 0x9_u8, 0xed_u8])
  FaxAccountOutgoingArchive = LibC::GUID.new(0x851e7af5_u32, 0x433a_u16, 0x4739_u16, StaticArray[0xa2_u8, 0xdf_u8, 0xad_u8, 0x24_u8, 0x5c_u8, 0x2c_u8, 0xb9_u8, 0x8e_u8])
  FaxSecurity2 = LibC::GUID.new(0x735c1248_u32, 0xec89_u16, 0x4c30_u16, StaticArray[0xa1_u8, 0x27_u8, 0x65_u8, 0x6e_u8, 0x92_u8, 0xe3_u8, 0xc4_u8, 0xea_u8])

  type IStiDeviceW = Void

  alias PFAXCONNECTFAXSERVERA = Proc(PSTR, LibC::HANDLE*, LibC::BOOL)
  alias PFAXCONNECTFAXSERVERW = Proc(LibC::LPWSTR, LibC::HANDLE*, LibC::BOOL)
  alias PFAXCLOSE = Proc(LibC::HANDLE, LibC::BOOL)
  alias PFAXOPENPORT = Proc(LibC::HANDLE, UInt32, UInt32, LibC::HANDLE*, LibC::BOOL)
  alias PFAXCOMPLETEJOBPARAMSA = Proc(FAX_JOB_PARAMA**, FAX_COVERPAGE_INFOA**, LibC::BOOL)
  alias PFAXCOMPLETEJOBPARAMSW = Proc(FAX_JOB_PARAMW**, FAX_COVERPAGE_INFOW**, LibC::BOOL)
  alias PFAXSENDDOCUMENTA = Proc(LibC::HANDLE, PSTR, FAX_JOB_PARAMA*, FAX_COVERPAGE_INFOA*, UInt32*, LibC::BOOL)
  alias PFAXSENDDOCUMENTW = Proc(LibC::HANDLE, LibC::LPWSTR, FAX_JOB_PARAMW*, FAX_COVERPAGE_INFOW*, UInt32*, LibC::BOOL)
  alias PFAX_RECIPIENT_CALLBACKA = Proc(LibC::HANDLE, UInt32, Void*, FAX_JOB_PARAMA*, FAX_COVERPAGE_INFOA*, LibC::BOOL)
  alias PFAX_RECIPIENT_CALLBACKW = Proc(LibC::HANDLE, UInt32, Void*, FAX_JOB_PARAMW*, FAX_COVERPAGE_INFOW*, LibC::BOOL)
  alias PFAXSENDDOCUMENTFORBROADCASTA = Proc(LibC::HANDLE, PSTR, UInt32*, PFAX_RECIPIENT_CALLBACKA, Void*, LibC::BOOL)
  alias PFAXSENDDOCUMENTFORBROADCASTW = Proc(LibC::HANDLE, LibC::LPWSTR, UInt32*, PFAX_RECIPIENT_CALLBACKW, Void*, LibC::BOOL)
  alias PFAXENUMJOBSA = Proc(LibC::HANDLE, FAX_JOB_ENTRYA**, UInt32*, LibC::BOOL)
  alias PFAXENUMJOBSW = Proc(LibC::HANDLE, FAX_JOB_ENTRYW**, UInt32*, LibC::BOOL)
  alias PFAXGETJOBA = Proc(LibC::HANDLE, UInt32, FAX_JOB_ENTRYA**, LibC::BOOL)
  alias PFAXGETJOBW = Proc(LibC::HANDLE, UInt32, FAX_JOB_ENTRYW**, LibC::BOOL)
  alias PFAXSETJOBA = Proc(LibC::HANDLE, UInt32, UInt32, FAX_JOB_ENTRYA*, LibC::BOOL)
  alias PFAXSETJOBW = Proc(LibC::HANDLE, UInt32, UInt32, FAX_JOB_ENTRYW*, LibC::BOOL)
  alias PFAXGETPAGEDATA = Proc(LibC::HANDLE, UInt32, UInt8**, UInt32*, UInt32*, UInt32*, LibC::BOOL)
  alias PFAXGETDEVICESTATUSA = Proc(LibC::HANDLE, FAX_DEVICE_STATUSA**, LibC::BOOL)
  alias PFAXGETDEVICESTATUSW = Proc(LibC::HANDLE, FAX_DEVICE_STATUSW**, LibC::BOOL)
  alias PFAXABORT = Proc(LibC::HANDLE, UInt32, LibC::BOOL)
  alias PFAXGETCONFIGURATIONA = Proc(LibC::HANDLE, FAX_CONFIGURATIONA**, LibC::BOOL)
  alias PFAXGETCONFIGURATIONW = Proc(LibC::HANDLE, FAX_CONFIGURATIONW**, LibC::BOOL)
  alias PFAXSETCONFIGURATIONA = Proc(LibC::HANDLE, FAX_CONFIGURATIONA*, LibC::BOOL)
  alias PFAXSETCONFIGURATIONW = Proc(LibC::HANDLE, FAX_CONFIGURATIONW*, LibC::BOOL)
  alias PFAXGETLOGGINGCATEGORIESA = Proc(LibC::HANDLE, FAX_LOG_CATEGORYA**, UInt32*, LibC::BOOL)
  alias PFAXGETLOGGINGCATEGORIESW = Proc(LibC::HANDLE, FAX_LOG_CATEGORYW**, UInt32*, LibC::BOOL)
  alias PFAXSETLOGGINGCATEGORIESA = Proc(LibC::HANDLE, FAX_LOG_CATEGORYA*, UInt32, LibC::BOOL)
  alias PFAXSETLOGGINGCATEGORIESW = Proc(LibC::HANDLE, FAX_LOG_CATEGORYW*, UInt32, LibC::BOOL)
  alias PFAXENUMPORTSA = Proc(LibC::HANDLE, FAX_PORT_INFOA**, UInt32*, LibC::BOOL)
  alias PFAXENUMPORTSW = Proc(LibC::HANDLE, FAX_PORT_INFOW**, UInt32*, LibC::BOOL)
  alias PFAXGETPORTA = Proc(LibC::HANDLE, FAX_PORT_INFOA**, LibC::BOOL)
  alias PFAXGETPORTW = Proc(LibC::HANDLE, FAX_PORT_INFOW**, LibC::BOOL)
  alias PFAXSETPORTA = Proc(LibC::HANDLE, FAX_PORT_INFOA*, LibC::BOOL)
  alias PFAXSETPORTW = Proc(LibC::HANDLE, FAX_PORT_INFOW*, LibC::BOOL)
  alias PFAXENUMROUTINGMETHODSA = Proc(LibC::HANDLE, FAX_ROUTING_METHODA**, UInt32*, LibC::BOOL)
  alias PFAXENUMROUTINGMETHODSW = Proc(LibC::HANDLE, FAX_ROUTING_METHODW**, UInt32*, LibC::BOOL)
  alias PFAXENABLEROUTINGMETHODA = Proc(LibC::HANDLE, PSTR, LibC::BOOL, LibC::BOOL)
  alias PFAXENABLEROUTINGMETHODW = Proc(LibC::HANDLE, LibC::LPWSTR, LibC::BOOL, LibC::BOOL)
  alias PFAXENUMGLOBALROUTINGINFOA = Proc(LibC::HANDLE, FAX_GLOBAL_ROUTING_INFOA**, UInt32*, LibC::BOOL)
  alias PFAXENUMGLOBALROUTINGINFOW = Proc(LibC::HANDLE, FAX_GLOBAL_ROUTING_INFOW**, UInt32*, LibC::BOOL)
  alias PFAXSETGLOBALROUTINGINFOA = Proc(LibC::HANDLE, FAX_GLOBAL_ROUTING_INFOA*, LibC::BOOL)
  alias PFAXSETGLOBALROUTINGINFOW = Proc(LibC::HANDLE, FAX_GLOBAL_ROUTING_INFOW*, LibC::BOOL)
  alias PFAXGETROUTINGINFOA = Proc(LibC::HANDLE, PSTR, UInt8**, UInt32*, LibC::BOOL)
  alias PFAXGETROUTINGINFOW = Proc(LibC::HANDLE, LibC::LPWSTR, UInt8**, UInt32*, LibC::BOOL)
  alias PFAXSETROUTINGINFOA = Proc(LibC::HANDLE, PSTR, UInt8*, UInt32, LibC::BOOL)
  alias PFAXSETROUTINGINFOW = Proc(LibC::HANDLE, LibC::LPWSTR, UInt8*, UInt32, LibC::BOOL)
  alias PFAXINITIALIZEEVENTQUEUE = Proc(LibC::HANDLE, LibC::HANDLE, LibC::UINT_PTR, LibC::HANDLE, UInt32, LibC::BOOL)
  alias PFAXFREEBUFFER = Proc(Void*, Void)
  alias PFAXSTARTPRINTJOBA = Proc(PSTR, FAX_PRINT_INFOA*, UInt32*, FAX_CONTEXT_INFOA*, LibC::BOOL)
  alias PFAXSTARTPRINTJOBW = Proc(LibC::LPWSTR, FAX_PRINT_INFOW*, UInt32*, FAX_CONTEXT_INFOW*, LibC::BOOL)
  alias PFAXPRINTCOVERPAGEA = Proc(FAX_CONTEXT_INFOA*, FAX_COVERPAGE_INFOA*, LibC::BOOL)
  alias PFAXPRINTCOVERPAGEW = Proc(FAX_CONTEXT_INFOW*, FAX_COVERPAGE_INFOW*, LibC::BOOL)
  alias PFAXREGISTERSERVICEPROVIDERW = Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL)
  alias PFAXUNREGISTERSERVICEPROVIDERW = Proc(LibC::LPWSTR, LibC::BOOL)
  alias PFAX_ROUTING_INSTALLATION_CALLBACKW = Proc(LibC::HANDLE, Void*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL)
  alias PFAXREGISTERROUTINGEXTENSIONW = Proc(LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, PFAX_ROUTING_INSTALLATION_CALLBACKW, Void*, LibC::BOOL)
  alias PFAXACCESSCHECK = Proc(LibC::HANDLE, UInt32, LibC::BOOL)
  alias PFAX_SERVICE_CALLBACK = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, LibC::BOOL)
  alias PFAX_LINECALLBACK = Proc(LibC::HANDLE, UInt32, UInt32, LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, Void)
  alias PFAX_SEND_CALLBACK = Proc(LibC::HANDLE, UInt32, UInt32, UInt32, LibC::BOOL)
  alias PFAXDEVINITIALIZE = Proc(UInt32, LibC::HANDLE, PFAX_LINECALLBACK*, PFAX_SERVICE_CALLBACK, LibC::BOOL)
  alias PFAXDEVVIRTUALDEVICECREATION = Proc(UInt32*, Char*, UInt32*, LibC::HANDLE, LibC::UINT_PTR, LibC::BOOL)
  alias PFAXDEVSTARTJOB = Proc(UInt32, UInt32, LibC::HANDLE*, LibC::HANDLE, LibC::UINT_PTR, LibC::BOOL)
  alias PFAXDEVENDJOB = Proc(LibC::HANDLE, LibC::BOOL)
  alias PFAXDEVSEND = Proc(LibC::HANDLE, FAX_SEND*, PFAX_SEND_CALLBACK, LibC::BOOL)
  alias PFAXDEVRECEIVE = Proc(LibC::HANDLE, UInt32, FAX_RECEIVE*, LibC::BOOL)
  alias PFAXDEVREPORTSTATUS = Proc(LibC::HANDLE, FAX_DEV_STATUS*, UInt32, UInt32*, LibC::BOOL)
  alias PFAXDEVABORTOPERATION = Proc(LibC::HANDLE, LibC::BOOL)
  alias PFAXDEVCONFIGURE = Proc(HPROPSHEETPAGE*, LibC::BOOL)
  alias PFAXDEVSHUTDOWN = Proc(HRESULT)
  alias PFAXROUTEADDFILE = Proc(UInt32, LibC::LPWSTR, Guid*, Int32)
  alias PFAXROUTEDELETEFILE = Proc(UInt32, LibC::LPWSTR, Int32)
  alias PFAXROUTEGETFILE = Proc(UInt32, UInt32, LibC::LPWSTR, UInt32*, LibC::BOOL)
  alias PFAXROUTEENUMFILE = Proc(UInt32, Guid*, Guid*, LibC::LPWSTR, Void*, LibC::BOOL)
  alias PFAXROUTEENUMFILES = Proc(UInt32, Guid*, PFAXROUTEENUMFILE, Void*, LibC::BOOL)
  alias PFAXROUTEMODIFYROUTINGDATA = Proc(UInt32, LibC::LPWSTR, UInt8*, UInt32, LibC::BOOL)
  alias PFAXROUTEINITIALIZE = Proc(LibC::HANDLE, FAX_ROUTE_CALLBACKROUTINES*, LibC::BOOL)
  alias PFAXROUTEMETHOD = Proc(FAX_ROUTE*, Void**, UInt32*, LibC::BOOL)
  alias PFAXROUTEDEVICEENABLE = Proc(LibC::LPWSTR, UInt32, Int32, LibC::BOOL)
  alias PFAXROUTEDEVICECHANGENOTIFICATION = Proc(UInt32, LibC::BOOL, LibC::BOOL)
  alias PFAXROUTEGETROUTINGINFO = Proc(LibC::LPWSTR, UInt32, UInt8*, UInt32*, LibC::BOOL)
  alias PFAXROUTESETROUTINGINFO = Proc(LibC::LPWSTR, UInt32, UInt8*, UInt32, LibC::BOOL)
  alias PFAX_EXT_GET_DATA = Proc(UInt32, FAX_ENUM_DEVICE_ID_SOURCE, LibC::LPWSTR, UInt8**, UInt32*, UInt32)
  alias PFAX_EXT_SET_DATA = Proc(HINSTANCE, UInt32, FAX_ENUM_DEVICE_ID_SOURCE, LibC::LPWSTR, UInt8*, UInt32, UInt32)
  alias PFAX_EXT_CONFIG_CHANGE = Proc(UInt32, LibC::LPWSTR, UInt8*, UInt32, HRESULT)
  alias PFAX_EXT_REGISTER_FOR_EVENTS = Proc(HINSTANCE, UInt32, FAX_ENUM_DEVICE_ID_SOURCE, LibC::LPWSTR, PFAX_EXT_CONFIG_CHANGE, LibC::HANDLE)
  alias PFAX_EXT_UNREGISTER_FOR_EVENTS = Proc(LibC::HANDLE, UInt32)
  alias PFAX_EXT_FREE_BUFFER = Proc(Void*, Void)
  alias PFAX_EXT_INITIALIZE_CONFIG = Proc(PFAX_EXT_GET_DATA, PFAX_EXT_SET_DATA, PFAX_EXT_REGISTER_FOR_EVENTS, PFAX_EXT_UNREGISTER_FOR_EVENTS, PFAX_EXT_FREE_BUFFER, HRESULT)


  enum FAX_ENUM_LOG_LEVELS : Int32
    FAXLOG_LEVEL_NONE = 0
    FAXLOG_LEVEL_MIN = 1
    FAXLOG_LEVEL_MED = 2
    FAXLOG_LEVEL_MAX = 3
  end

  enum FAX_ENUM_LOG_CATEGORIES : Int32
    FAXLOG_CATEGORY_INIT = 1
    FAXLOG_CATEGORY_OUTBOUND = 2
    FAXLOG_CATEGORY_INBOUND = 3
    FAXLOG_CATEGORY_UNKNOWN = 4
  end

  enum FAX_ENUM_JOB_COMMANDS : Int32
    JC_UNKNOWN = 0
    JC_DELETE = 1
    JC_PAUSE = 2
    JC_RESUME = 3
  end

  enum FAX_ENUM_JOB_SEND_ATTRIBUTES : Int32
    JSA_NOW = 0
    JSA_SPECIFIC_TIME = 1
    JSA_DISCOUNT_PERIOD = 2
  end

  enum FAX_ENUM_DELIVERY_REPORT_TYPES : Int32
    DRT_NONE = 0
    DRT_EMAIL = 1
    DRT_INBOX = 2
  end

  enum FAX_ENUM_PORT_OPEN_TYPE : Int32
    PORT_OPEN_QUERY = 1
    PORT_OPEN_MODIFY = 2
  end

  enum FAX_JOB_STATUS_ENUM : Int32
    Fjspending = 1
    Fjsinprogress = 2
    Fjsfailed = 8
    Fjspaused = 16
    Fjsnoline = 32
    Fjsretrying = 64
    Fjsretries_exceeded = 128
    Fjscompleted = 256
    Fjscanceled = 512
    Fjscanceling = 1024
    Fjsrouting = 2048
  end

  enum FAX_JOB_EXTENDED_STATUS_ENUM : Int32
    Fjesnone = 0
    Fjesdisconnected = 1
    Fjesinitializing = 2
    Fjesdialing = 3
    Fjestransmitting = 4
    Fjesanswered = 5
    Fjesreceiving = 6
    Fjesline_unavailable = 7
    Fjesbusy = 8
    Fjesno_answer = 9
    Fjesbad_address = 10
    Fjesno_dial_tone = 11
    Fjesfatal_error = 12
    Fjescall_delayed = 13
    Fjescall_blacklisted = 14
    Fjesnot_fax_call = 15
    Fjespartially_received = 16
    Fjeshandled = 17
    Fjescall_completed = 18
    Fjescall_aborted = 19
    Fjesproprietary = 16777216
  end

  enum FAX_JOB_OPERATIONS_ENUM : Int32
    Fjoview = 1
    Fjopause = 2
    Fjoresume = 4
    Fjorestart = 8
    Fjodelete = 16
    Fjorecipient_info = 32
    Fjosender_info = 64
  end

  enum FAX_JOB_TYPE_ENUM : Int32
    Fjtsend = 0
    Fjtreceive = 1
    Fjtrouting = 2
  end

  enum FAX_SERVER_EVENTS_TYPE_ENUM : Int32
    Fsetnone = 0
    Fsetin_queue = 1
    Fsetout_queue = 2
    Fsetconfig = 4
    Fsetactivity = 8
    Fsetqueue_state = 16
    Fsetin_archive = 32
    Fsetout_archive = 64
    Fsetfxssvc_ended = 128
    Fsetdevice_status = 256
    Fsetincoming_call = 512
  end

  enum FAX_SERVER_APIVERSION_ENUM : Int32
    Fsapi_version_0 = 0
    Fsapi_version_1 = 65536
    Fsapi_version_2 = 131072
    Fsapi_version_3 = 196608
  end

  enum FAX_SMTP_AUTHENTICATION_TYPE_ENUM : Int32
    Fsatanonymous = 0
    Fsatbasic = 1
    Fsatntlm = 2
  end

  enum FAX_RECEIPT_TYPE_ENUM : Int32
    Frtnone = 0
    Frtmail = 1
    Frtmsgbox = 4
  end

  enum FAX_ACCESS_RIGHTS_ENUM : Int32
    Farsubmit_low = 1
    Farsubmit_normal = 2
    Farsubmit_high = 4
    Farquery_jobs = 8
    Farmanage_jobs = 16
    Farquery_config = 32
    Farmanage_config = 64
    Farquery_in_archive = 128
    Farmanage_in_archive = 256
    Farquery_out_archive = 512
    Farmanage_out_archive = 1024
  end

  enum FAX_PRIORITY_TYPE_ENUM : Int32
    Fptlow = 0
    Fptnormal = 1
    Fpthigh = 2
  end

  enum FAX_COVERPAGE_TYPE_ENUM : Int32
    Fcptnone = 0
    Fcptlocal = 1
    Fcptserver = 2
  end

  enum FAX_SCHEDULE_TYPE_ENUM : Int32
    Fstnow = 0
    Fstspecific_time = 1
    Fstdiscount_period = 2
  end

  enum FAX_PROVIDER_STATUS_ENUM : Int32
    Fpssuccess = 0
    Fpsserver_error = 1
    Fpsbad_guid = 2
    Fpsbad_version = 3
    Fpscant_load = 4
    Fpscant_link = 5
    Fpscant_init = 6
  end

  enum FAX_DEVICE_RECEIVE_MODE_ENUM : Int32
    Fdrmno_answer = 0
    Fdrmauto_answer = 1
    Fdrmmanual_answer = 2
  end

  enum FAX_LOG_LEVEL_ENUM : Int32
    Fllnone = 0
    Fllmin = 1
    Fllmed = 2
    Fllmax = 3
  end

  enum FAX_GROUP_STATUS_ENUM : Int32
    Fgsall_dev_valid = 0
    Fgsempty = 1
    Fgsall_dev_not_valid = 2
    Fgssome_dev_not_valid = 3
  end

  enum FAX_RULE_STATUS_ENUM : Int32
    Frsvalid = 0
    Frsempty_group = 1
    Frsall_group_dev_not_valid = 2
    Frssome_group_dev_not_valid = 3
    Frsbad_device = 4
  end

  enum FAX_ACCOUNT_EVENTS_TYPE_ENUM : Int32
    Faetnone = 0
    Faetin_queue = 1
    Faetout_queue = 2
    Faetin_archive = 4
    Faetout_archive = 8
    Faetfxssvc_ended = 16
  end

  enum FAX_ACCESS_RIGHTS_ENUM_2 : Int32
    Far2submit_low = 1
    Far2submit_normal = 2
    Far2submit_high = 4
    Far2query_out_jobs = 8
    Far2manage_out_jobs = 16
    Far2query_config = 32
    Far2manage_config = 64
    Far2query_archives = 128
    Far2manage_archives = 256
    Far2manage_receive_folder = 512
  end

  enum FAX_ROUTING_RULE_CODE_ENUM : Int32
    Frrcany_code = 0
  end

  enum FAXROUTE_ENABLE : Int32
    QUERY_STATUS = -1
    STATUS_DISABLE = 0
    STATUS_ENABLE = 1
  end

  enum FAX_ENUM_DEVICE_ID_SOURCE : Int32
    DEV_ID_SRC_FAX = 0
    DEV_ID_SRC_TAPI = 1
  end

  enum SendToMode : Int32
    SEND_TO_FAX_RECIPIENT_ATTACHMENT = 0
  end

  enum STI_DEVICE_MJ_TYPE : Int32
    StiDeviceTypeDefault = 0
    StiDeviceTypeScanner = 1
    StiDeviceTypeDigitalCamera = 2
    StiDeviceTypeStreamingVideo = 3
  end

  struct FAX_LOG_CATEGORYA
    name : PSTR
    category : UInt32
    level : UInt32
  end
  struct FAX_LOG_CATEGORYW
    name : LibC::LPWSTR
    category : UInt32
    level : UInt32
  end
  struct FAX_TIME
    hour : UInt16
    minute : UInt16
  end
  struct FAX_CONFIGURATIONA
    size_of_struct : UInt32
    retries : UInt32
    retry_delay : UInt32
    dirty_days : UInt32
    branding : LibC::BOOL
    use_device_tsid : LibC::BOOL
    server_cp : LibC::BOOL
    pause_server_queue : LibC::BOOL
    start_cheap_time : FAX_TIME
    stop_cheap_time : FAX_TIME
    archive_outgoing_faxes : LibC::BOOL
    archive_directory : PSTR
    reserved : PSTR
  end
  struct FAX_CONFIGURATIONW
    size_of_struct : UInt32
    retries : UInt32
    retry_delay : UInt32
    dirty_days : UInt32
    branding : LibC::BOOL
    use_device_tsid : LibC::BOOL
    server_cp : LibC::BOOL
    pause_server_queue : LibC::BOOL
    start_cheap_time : FAX_TIME
    stop_cheap_time : FAX_TIME
    archive_outgoing_faxes : LibC::BOOL
    archive_directory : LibC::LPWSTR
    reserved : LibC::LPWSTR
  end
  struct FAX_DEVICE_STATUSA
    size_of_struct : UInt32
    caller_id : PSTR
    csid : PSTR
    current_page : UInt32
    device_id : UInt32
    device_name : PSTR
    document_name : PSTR
    job_type : UInt32
    phone_number : PSTR
    routing_string : PSTR
    sender_name : PSTR
    recipient_name : PSTR
    size : UInt32
    start_time : FILETIME
    status : UInt32
    status_string : PSTR
    submitted_time : FILETIME
    total_pages : UInt32
    tsid : PSTR
    user_name : PSTR
  end
  struct FAX_DEVICE_STATUSW
    size_of_struct : UInt32
    caller_id : LibC::LPWSTR
    csid : LibC::LPWSTR
    current_page : UInt32
    device_id : UInt32
    device_name : LibC::LPWSTR
    document_name : LibC::LPWSTR
    job_type : UInt32
    phone_number : LibC::LPWSTR
    routing_string : LibC::LPWSTR
    sender_name : LibC::LPWSTR
    recipient_name : LibC::LPWSTR
    size : UInt32
    start_time : FILETIME
    status : UInt32
    status_string : LibC::LPWSTR
    submitted_time : FILETIME
    total_pages : UInt32
    tsid : LibC::LPWSTR
    user_name : LibC::LPWSTR
  end
  struct FAX_JOB_ENTRYA
    size_of_struct : UInt32
    job_id : UInt32
    user_name : PSTR
    job_type : UInt32
    queue_status : UInt32
    status : UInt32
    size : UInt32
    page_count : UInt32
    recipient_number : PSTR
    recipient_name : PSTR
    tsid : PSTR
    sender_name : PSTR
    sender_company : PSTR
    sender_dept : PSTR
    billing_code : PSTR
    schedule_action : UInt32
    schedule_time : SYSTEMTIME
    delivery_report_type : UInt32
    delivery_report_address : PSTR
    document_name : PSTR
  end
  struct FAX_JOB_ENTRYW
    size_of_struct : UInt32
    job_id : UInt32
    user_name : LibC::LPWSTR
    job_type : UInt32
    queue_status : UInt32
    status : UInt32
    size : UInt32
    page_count : UInt32
    recipient_number : LibC::LPWSTR
    recipient_name : LibC::LPWSTR
    tsid : LibC::LPWSTR
    sender_name : LibC::LPWSTR
    sender_company : LibC::LPWSTR
    sender_dept : LibC::LPWSTR
    billing_code : LibC::LPWSTR
    schedule_action : UInt32
    schedule_time : SYSTEMTIME
    delivery_report_type : UInt32
    delivery_report_address : LibC::LPWSTR
    document_name : LibC::LPWSTR
  end
  struct FAX_PORT_INFOA
    size_of_struct : UInt32
    device_id : UInt32
    state : UInt32
    flags : UInt32
    rings : UInt32
    priority : UInt32
    device_name : PSTR
    tsid : PSTR
    csid : PSTR
  end
  struct FAX_PORT_INFOW
    size_of_struct : UInt32
    device_id : UInt32
    state : UInt32
    flags : UInt32
    rings : UInt32
    priority : UInt32
    device_name : LibC::LPWSTR
    tsid : LibC::LPWSTR
    csid : LibC::LPWSTR
  end
  struct FAX_ROUTING_METHODA
    size_of_struct : UInt32
    device_id : UInt32
    enabled : LibC::BOOL
    device_name : PSTR
    guid : PSTR
    friendly_name : PSTR
    function_name : PSTR
    extension_image_name : PSTR
    extension_friendly_name : PSTR
  end
  struct FAX_ROUTING_METHODW
    size_of_struct : UInt32
    device_id : UInt32
    enabled : LibC::BOOL
    device_name : LibC::LPWSTR
    guid : LibC::LPWSTR
    friendly_name : LibC::LPWSTR
    function_name : LibC::LPWSTR
    extension_image_name : LibC::LPWSTR
    extension_friendly_name : LibC::LPWSTR
  end
  struct FAX_GLOBAL_ROUTING_INFOA
    size_of_struct : UInt32
    priority : UInt32
    guid : PSTR
    friendly_name : PSTR
    function_name : PSTR
    extension_image_name : PSTR
    extension_friendly_name : PSTR
  end
  struct FAX_GLOBAL_ROUTING_INFOW
    size_of_struct : UInt32
    priority : UInt32
    guid : LibC::LPWSTR
    friendly_name : LibC::LPWSTR
    function_name : LibC::LPWSTR
    extension_image_name : LibC::LPWSTR
    extension_friendly_name : LibC::LPWSTR
  end
  struct FAX_COVERPAGE_INFOA
    size_of_struct : UInt32
    cover_page_name : PSTR
    use_server_cover_page : LibC::BOOL
    rec_name : PSTR
    rec_fax_number : PSTR
    rec_company : PSTR
    rec_street_address : PSTR
    rec_city : PSTR
    rec_state : PSTR
    rec_zip : PSTR
    rec_country : PSTR
    rec_title : PSTR
    rec_department : PSTR
    rec_office_location : PSTR
    rec_home_phone : PSTR
    rec_office_phone : PSTR
    sdr_name : PSTR
    sdr_fax_number : PSTR
    sdr_company : PSTR
    sdr_address : PSTR
    sdr_title : PSTR
    sdr_department : PSTR
    sdr_office_location : PSTR
    sdr_home_phone : PSTR
    sdr_office_phone : PSTR
    note : PSTR
    subject : PSTR
    time_sent : SYSTEMTIME
    page_count : UInt32
  end
  struct FAX_COVERPAGE_INFOW
    size_of_struct : UInt32
    cover_page_name : LibC::LPWSTR
    use_server_cover_page : LibC::BOOL
    rec_name : LibC::LPWSTR
    rec_fax_number : LibC::LPWSTR
    rec_company : LibC::LPWSTR
    rec_street_address : LibC::LPWSTR
    rec_city : LibC::LPWSTR
    rec_state : LibC::LPWSTR
    rec_zip : LibC::LPWSTR
    rec_country : LibC::LPWSTR
    rec_title : LibC::LPWSTR
    rec_department : LibC::LPWSTR
    rec_office_location : LibC::LPWSTR
    rec_home_phone : LibC::LPWSTR
    rec_office_phone : LibC::LPWSTR
    sdr_name : LibC::LPWSTR
    sdr_fax_number : LibC::LPWSTR
    sdr_company : LibC::LPWSTR
    sdr_address : LibC::LPWSTR
    sdr_title : LibC::LPWSTR
    sdr_department : LibC::LPWSTR
    sdr_office_location : LibC::LPWSTR
    sdr_home_phone : LibC::LPWSTR
    sdr_office_phone : LibC::LPWSTR
    note : LibC::LPWSTR
    subject : LibC::LPWSTR
    time_sent : SYSTEMTIME
    page_count : UInt32
  end
  struct FAX_JOB_PARAMA
    size_of_struct : UInt32
    recipient_number : PSTR
    recipient_name : PSTR
    tsid : PSTR
    sender_name : PSTR
    sender_company : PSTR
    sender_dept : PSTR
    billing_code : PSTR
    schedule_action : UInt32
    schedule_time : SYSTEMTIME
    delivery_report_type : UInt32
    delivery_report_address : PSTR
    document_name : PSTR
    call_handle : UInt32
    reserved : LibC::UINT_PTR[3]*
  end
  struct FAX_JOB_PARAMW
    size_of_struct : UInt32
    recipient_number : LibC::LPWSTR
    recipient_name : LibC::LPWSTR
    tsid : LibC::LPWSTR
    sender_name : LibC::LPWSTR
    sender_company : LibC::LPWSTR
    sender_dept : LibC::LPWSTR
    billing_code : LibC::LPWSTR
    schedule_action : UInt32
    schedule_time : SYSTEMTIME
    delivery_report_type : UInt32
    delivery_report_address : LibC::LPWSTR
    document_name : LibC::LPWSTR
    call_handle : UInt32
    reserved : LibC::UINT_PTR[3]*
  end
  struct FAX_EVENTA
    size_of_struct : UInt32
    time_stamp : FILETIME
    device_id : UInt32
    event_id : UInt32
    job_id : UInt32
  end
  struct FAX_EVENTW
    size_of_struct : UInt32
    time_stamp : FILETIME
    device_id : UInt32
    event_id : UInt32
    job_id : UInt32
  end
  struct FAX_PRINT_INFOA
    size_of_struct : UInt32
    doc_name : PSTR
    recipient_name : PSTR
    recipient_number : PSTR
    sender_name : PSTR
    sender_company : PSTR
    sender_dept : PSTR
    sender_billing_code : PSTR
    reserved : PSTR
    dr_email_address : PSTR
    output_file_name : PSTR
  end
  struct FAX_PRINT_INFOW
    size_of_struct : UInt32
    doc_name : LibC::LPWSTR
    recipient_name : LibC::LPWSTR
    recipient_number : LibC::LPWSTR
    sender_name : LibC::LPWSTR
    sender_company : LibC::LPWSTR
    sender_dept : LibC::LPWSTR
    sender_billing_code : LibC::LPWSTR
    reserved : LibC::LPWSTR
    dr_email_address : LibC::LPWSTR
    output_file_name : LibC::LPWSTR
  end
  struct FAX_CONTEXT_INFOA
    size_of_struct : UInt32
    h_dc : HDC
    server_name : CHAR[16]*
  end
  struct FAX_CONTEXT_INFOW
    size_of_struct : UInt32
    h_dc : HDC
    server_name : Char[16]*
  end
  struct FAX_SEND
    size_of_struct : UInt32
    file_name : LibC::LPWSTR
    caller_name : LibC::LPWSTR
    caller_number : LibC::LPWSTR
    receiver_name : LibC::LPWSTR
    receiver_number : LibC::LPWSTR
    branding : LibC::BOOL
    call_handle : UInt32
    reserved : UInt32[3]*
  end
  struct FAX_RECEIVE
    size_of_struct : UInt32
    file_name : LibC::LPWSTR
    receiver_name : LibC::LPWSTR
    receiver_number : LibC::LPWSTR
    reserved : UInt32[4]*
  end
  struct FAX_DEV_STATUS
    size_of_struct : UInt32
    status_id : UInt32
    string_id : UInt32
    page_count : UInt32
    csi : LibC::LPWSTR
    caller_id : LibC::LPWSTR
    routing_info : LibC::LPWSTR
    error_code : UInt32
    reserved : UInt32[3]*
  end
  struct FAX_ROUTE_CALLBACKROUTINES
    size_of_struct : UInt32
    fax_route_add_file : PFAXROUTEADDFILE
    fax_route_delete_file : PFAXROUTEDELETEFILE
    fax_route_get_file : PFAXROUTEGETFILE
    fax_route_enum_files : PFAXROUTEENUMFILES
    fax_route_modify_routing_data : PFAXROUTEMODIFYROUTINGDATA
  end
  struct FAX_ROUTE
    size_of_struct : UInt32
    job_id : UInt32
    elapsed_time : UInt64
    receive_time : UInt64
    page_count : UInt32
    csid : LibC::LPWSTR
    tsid : LibC::LPWSTR
    caller_id : LibC::LPWSTR
    routing_info : LibC::LPWSTR
    receiver_name : LibC::LPWSTR
    receiver_number : LibC::LPWSTR
    device_name : LibC::LPWSTR
    device_id : UInt32
    routing_info_data : UInt8*
    routing_info_data_size : UInt32
  end
  struct STI_DEV_CAPS
    dw_generic : UInt32
  end
  struct STI_DEVICE_INFORMATIONW
    dw_size : UInt32
    device_type : UInt32
    sz_device_internal_name : Char[128]*
    device_capabilities_a : STI_DEV_CAPS
    dw_hardware_configuration : UInt32
    psz_vendor_description : LibC::LPWSTR
    psz_device_description : LibC::LPWSTR
    psz_port_name : LibC::LPWSTR
    psz_prop_provider : LibC::LPWSTR
    psz_local_name : LibC::LPWSTR
  end
  struct STI_WIA_DEVICE_INFORMATIONW
    dw_size : UInt32
    device_type : UInt32
    sz_device_internal_name : Char[128]*
    device_capabilities_a : STI_DEV_CAPS
    dw_hardware_configuration : UInt32
    psz_vendor_description : LibC::LPWSTR
    psz_device_description : LibC::LPWSTR
    psz_port_name : LibC::LPWSTR
    psz_prop_provider : LibC::LPWSTR
    psz_local_name : LibC::LPWSTR
    psz_ui_dll : LibC::LPWSTR
    psz_server : LibC::LPWSTR
  end
  struct STI_DEVICE_STATUS
    dw_size : UInt32
    status_mask : UInt32
    dw_online_state : UInt32
    dw_hardware_status_code : UInt32
    dw_event_handling_state : UInt32
    dw_polling_interval : UInt32
  end
  struct ERROR_INFOW
    dw_size : UInt32
    dw_generic_error : UInt32
    dw_vendor_error : UInt32
    sz_extended_error_text : Char[255]*
  end
  struct STI_DIAG
    dw_size : UInt32
    dw_basic_diag_code : UInt32
    dw_vendor_diag_code : UInt32
    dw_status_mask : UInt32
    s_error_info : ERROR_INFOW
  end
  struct STISUBSCRIBE
    dw_size : UInt32
    dw_flags : UInt32
    dw_filter : UInt32
    h_wnd_notify : HANDLE
    h_event : LibC::HANDLE
    ui_notification_message : UInt32
  end
  struct STINOTIFY
    dw_size : UInt32
    guid_notification_code : Guid
    ab_notification_data : UInt8[64]*
  end
  struct STI_USD_CAPS
    dw_version : UInt32
    dw_generic_caps : UInt32
  end


  struct IFaxJobStatusVTbl
    query_interface : Proc(IFaxJobStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxJobStatus*, UInt32)
    release : Proc(IFaxJobStatus*, UInt32)
    get_type_info_count : Proc(IFaxJobStatus*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxJobStatus*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxJobStatus*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxJobStatus*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_status : Proc(IFaxJobStatus*, FAX_JOB_STATUS_ENUM*, HRESULT)
    get_pages : Proc(IFaxJobStatus*, Int32*, HRESULT)
    get_size : Proc(IFaxJobStatus*, Int32*, HRESULT)
    get_current_page : Proc(IFaxJobStatus*, Int32*, HRESULT)
    get_device_id : Proc(IFaxJobStatus*, Int32*, HRESULT)
    get_csid : Proc(IFaxJobStatus*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxJobStatus*, UInt8**, HRESULT)
    get_extended_status_code : Proc(IFaxJobStatus*, FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)
    get_extended_status : Proc(IFaxJobStatus*, UInt8**, HRESULT)
    get_available_operations : Proc(IFaxJobStatus*, FAX_JOB_OPERATIONS_ENUM*, HRESULT)
    get_retries : Proc(IFaxJobStatus*, Int32*, HRESULT)
    get_job_type : Proc(IFaxJobStatus*, FAX_JOB_TYPE_ENUM*, HRESULT)
    get_scheduled_time : Proc(IFaxJobStatus*, Float64*, HRESULT)
    get_transmission_start : Proc(IFaxJobStatus*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxJobStatus*, Float64*, HRESULT)
    get_caller_id : Proc(IFaxJobStatus*, UInt8**, HRESULT)
    get_routing_information : Proc(IFaxJobStatus*, UInt8**, HRESULT)
  end

  struct IFaxJobStatus
    lpVtbl : IFaxJobStatusVTbl*
  end

  struct IFaxServerVTbl
    query_interface : Proc(IFaxServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxServer*, UInt32)
    release : Proc(IFaxServer*, UInt32)
    get_type_info_count : Proc(IFaxServer*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxServer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxServer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxServer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    connect : Proc(IFaxServer*, UInt8*, HRESULT)
    get_server_name : Proc(IFaxServer*, UInt8**, HRESULT)
    get_device_providers : Proc(IFaxServer*, IFaxDeviceProviders*, HRESULT)
    get_devices : Proc(IFaxServer*, IFaxDevices*, HRESULT)
    get_inbound_routing : Proc(IFaxServer*, IFaxInboundRouting*, HRESULT)
    get_folders : Proc(IFaxServer*, IFaxFolders*, HRESULT)
    get_logging_options : Proc(IFaxServer*, IFaxLoggingOptions*, HRESULT)
    get_major_version : Proc(IFaxServer*, Int32*, HRESULT)
    get_minor_version : Proc(IFaxServer*, Int32*, HRESULT)
    get_major_build : Proc(IFaxServer*, Int32*, HRESULT)
    get_minor_build : Proc(IFaxServer*, Int32*, HRESULT)
    get_debug : Proc(IFaxServer*, Int16*, HRESULT)
    get_activity : Proc(IFaxServer*, IFaxActivity*, HRESULT)
    get_outbound_routing : Proc(IFaxServer*, IFaxOutboundRouting*, HRESULT)
    get_receipt_options : Proc(IFaxServer*, IFaxReceiptOptions*, HRESULT)
    get_security : Proc(IFaxServer*, IFaxSecurity*, HRESULT)
    disconnect : Proc(IFaxServer*, HRESULT)
    get_extension_property : Proc(IFaxServer*, UInt8*, VARIANT*, HRESULT)
    set_extension_property : Proc(IFaxServer*, UInt8*, VARIANT, HRESULT)
    listen_to_server_events : Proc(IFaxServer*, FAX_SERVER_EVENTS_TYPE_ENUM, HRESULT)
    register_device_provider : Proc(IFaxServer*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, HRESULT)
    unregister_device_provider : Proc(IFaxServer*, UInt8*, HRESULT)
    register_inbound_routing_extension : Proc(IFaxServer*, UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)
    unregister_inbound_routing_extension : Proc(IFaxServer*, UInt8*, HRESULT)
    get_registered_events : Proc(IFaxServer*, FAX_SERVER_EVENTS_TYPE_ENUM*, HRESULT)
    get_api_version : Proc(IFaxServer*, FAX_SERVER_APIVERSION_ENUM*, HRESULT)
  end

  struct IFaxServer
    lpVtbl : IFaxServerVTbl*
  end

  struct IFaxDeviceProvidersVTbl
    query_interface : Proc(IFaxDeviceProviders*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxDeviceProviders*, UInt32)
    release : Proc(IFaxDeviceProviders*, UInt32)
    get_type_info_count : Proc(IFaxDeviceProviders*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxDeviceProviders*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxDeviceProviders*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxDeviceProviders*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxDeviceProviders*, IUnknown*, HRESULT)
    get_item : Proc(IFaxDeviceProviders*, VARIANT, IFaxDeviceProvider*, HRESULT)
    get_count : Proc(IFaxDeviceProviders*, Int32*, HRESULT)
  end

  struct IFaxDeviceProviders
    lpVtbl : IFaxDeviceProvidersVTbl*
  end

  struct IFaxDevicesVTbl
    query_interface : Proc(IFaxDevices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxDevices*, UInt32)
    release : Proc(IFaxDevices*, UInt32)
    get_type_info_count : Proc(IFaxDevices*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxDevices*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxDevices*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxDevices*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxDevices*, IUnknown*, HRESULT)
    get_item : Proc(IFaxDevices*, VARIANT, IFaxDevice*, HRESULT)
    get_count : Proc(IFaxDevices*, Int32*, HRESULT)
    get_item_by_id : Proc(IFaxDevices*, Int32, IFaxDevice*, HRESULT)
  end

  struct IFaxDevices
    lpVtbl : IFaxDevicesVTbl*
  end

  struct IFaxInboundRoutingVTbl
    query_interface : Proc(IFaxInboundRouting*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxInboundRouting*, UInt32)
    release : Proc(IFaxInboundRouting*, UInt32)
    get_type_info_count : Proc(IFaxInboundRouting*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxInboundRouting*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxInboundRouting*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxInboundRouting*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_extensions : Proc(IFaxInboundRouting*, IFaxInboundRoutingExtensions*, HRESULT)
    get_methods : Proc(IFaxInboundRouting*, IFaxInboundRoutingMethods*, HRESULT)
  end

  struct IFaxInboundRouting
    lpVtbl : IFaxInboundRoutingVTbl*
  end

  struct IFaxFoldersVTbl
    query_interface : Proc(IFaxFolders*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxFolders*, UInt32)
    release : Proc(IFaxFolders*, UInt32)
    get_type_info_count : Proc(IFaxFolders*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxFolders*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxFolders*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxFolders*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_outgoing_queue : Proc(IFaxFolders*, IFaxOutgoingQueue*, HRESULT)
    get_incoming_queue : Proc(IFaxFolders*, IFaxIncomingQueue*, HRESULT)
    get_incoming_archive : Proc(IFaxFolders*, IFaxIncomingArchive*, HRESULT)
    get_outgoing_archive : Proc(IFaxFolders*, IFaxOutgoingArchive*, HRESULT)
  end

  struct IFaxFolders
    lpVtbl : IFaxFoldersVTbl*
  end

  struct IFaxLoggingOptionsVTbl
    query_interface : Proc(IFaxLoggingOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxLoggingOptions*, UInt32)
    release : Proc(IFaxLoggingOptions*, UInt32)
    get_type_info_count : Proc(IFaxLoggingOptions*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxLoggingOptions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxLoggingOptions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxLoggingOptions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_event_logging : Proc(IFaxLoggingOptions*, IFaxEventLogging*, HRESULT)
    get_activity_logging : Proc(IFaxLoggingOptions*, IFaxActivityLogging*, HRESULT)
  end

  struct IFaxLoggingOptions
    lpVtbl : IFaxLoggingOptionsVTbl*
  end

  struct IFaxActivityVTbl
    query_interface : Proc(IFaxActivity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxActivity*, UInt32)
    release : Proc(IFaxActivity*, UInt32)
    get_type_info_count : Proc(IFaxActivity*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxActivity*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxActivity*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxActivity*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_incoming_messages : Proc(IFaxActivity*, Int32*, HRESULT)
    get_routing_messages : Proc(IFaxActivity*, Int32*, HRESULT)
    get_outgoing_messages : Proc(IFaxActivity*, Int32*, HRESULT)
    get_queued_messages : Proc(IFaxActivity*, Int32*, HRESULT)
    refresh : Proc(IFaxActivity*, HRESULT)
  end

  struct IFaxActivity
    lpVtbl : IFaxActivityVTbl*
  end

  struct IFaxOutboundRoutingVTbl
    query_interface : Proc(IFaxOutboundRouting*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutboundRouting*, UInt32)
    release : Proc(IFaxOutboundRouting*, UInt32)
    get_type_info_count : Proc(IFaxOutboundRouting*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutboundRouting*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutboundRouting*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutboundRouting*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_groups : Proc(IFaxOutboundRouting*, IFaxOutboundRoutingGroups*, HRESULT)
    get_rules : Proc(IFaxOutboundRouting*, IFaxOutboundRoutingRules*, HRESULT)
  end

  struct IFaxOutboundRouting
    lpVtbl : IFaxOutboundRoutingVTbl*
  end

  struct IFaxReceiptOptionsVTbl
    query_interface : Proc(IFaxReceiptOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxReceiptOptions*, UInt32)
    release : Proc(IFaxReceiptOptions*, UInt32)
    get_type_info_count : Proc(IFaxReceiptOptions*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxReceiptOptions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxReceiptOptions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxReceiptOptions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_authentication_type : Proc(IFaxReceiptOptions*, FAX_SMTP_AUTHENTICATION_TYPE_ENUM*, HRESULT)
    put_authentication_type : Proc(IFaxReceiptOptions*, FAX_SMTP_AUTHENTICATION_TYPE_ENUM, HRESULT)
    get_smtp_server : Proc(IFaxReceiptOptions*, UInt8**, HRESULT)
    put_smtp_server : Proc(IFaxReceiptOptions*, UInt8*, HRESULT)
    get_smtp_port : Proc(IFaxReceiptOptions*, Int32*, HRESULT)
    put_smtp_port : Proc(IFaxReceiptOptions*, Int32, HRESULT)
    get_smtp_sender : Proc(IFaxReceiptOptions*, UInt8**, HRESULT)
    put_smtp_sender : Proc(IFaxReceiptOptions*, UInt8*, HRESULT)
    get_smtp_user : Proc(IFaxReceiptOptions*, UInt8**, HRESULT)
    put_smtp_user : Proc(IFaxReceiptOptions*, UInt8*, HRESULT)
    get_allowed_receipts : Proc(IFaxReceiptOptions*, FAX_RECEIPT_TYPE_ENUM*, HRESULT)
    put_allowed_receipts : Proc(IFaxReceiptOptions*, FAX_RECEIPT_TYPE_ENUM, HRESULT)
    get_smtp_password : Proc(IFaxReceiptOptions*, UInt8**, HRESULT)
    put_smtp_password : Proc(IFaxReceiptOptions*, UInt8*, HRESULT)
    refresh : Proc(IFaxReceiptOptions*, HRESULT)
    save : Proc(IFaxReceiptOptions*, HRESULT)
    get_use_for_inbound_routing : Proc(IFaxReceiptOptions*, Int16*, HRESULT)
    put_use_for_inbound_routing : Proc(IFaxReceiptOptions*, Int16, HRESULT)
  end

  struct IFaxReceiptOptions
    lpVtbl : IFaxReceiptOptionsVTbl*
  end

  struct IFaxSecurityVTbl
    query_interface : Proc(IFaxSecurity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxSecurity*, UInt32)
    release : Proc(IFaxSecurity*, UInt32)
    get_type_info_count : Proc(IFaxSecurity*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxSecurity*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxSecurity*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxSecurity*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_descriptor : Proc(IFaxSecurity*, VARIANT*, HRESULT)
    put_descriptor : Proc(IFaxSecurity*, VARIANT, HRESULT)
    get_granted_rights : Proc(IFaxSecurity*, FAX_ACCESS_RIGHTS_ENUM*, HRESULT)
    refresh : Proc(IFaxSecurity*, HRESULT)
    save : Proc(IFaxSecurity*, HRESULT)
    get_information_type : Proc(IFaxSecurity*, Int32*, HRESULT)
    put_information_type : Proc(IFaxSecurity*, Int32, HRESULT)
  end

  struct IFaxSecurity
    lpVtbl : IFaxSecurityVTbl*
  end

  struct IFaxDocumentVTbl
    query_interface : Proc(IFaxDocument*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxDocument*, UInt32)
    release : Proc(IFaxDocument*, UInt32)
    get_type_info_count : Proc(IFaxDocument*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxDocument*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxDocument*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxDocument*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_body : Proc(IFaxDocument*, UInt8**, HRESULT)
    put_body : Proc(IFaxDocument*, UInt8*, HRESULT)
    get_sender : Proc(IFaxDocument*, IFaxSender*, HRESULT)
    get_recipients : Proc(IFaxDocument*, IFaxRecipients*, HRESULT)
    get_cover_page : Proc(IFaxDocument*, UInt8**, HRESULT)
    put_cover_page : Proc(IFaxDocument*, UInt8*, HRESULT)
    get_subject : Proc(IFaxDocument*, UInt8**, HRESULT)
    put_subject : Proc(IFaxDocument*, UInt8*, HRESULT)
    get_note : Proc(IFaxDocument*, UInt8**, HRESULT)
    put_note : Proc(IFaxDocument*, UInt8*, HRESULT)
    get_schedule_time : Proc(IFaxDocument*, Float64*, HRESULT)
    put_schedule_time : Proc(IFaxDocument*, Float64, HRESULT)
    get_receipt_address : Proc(IFaxDocument*, UInt8**, HRESULT)
    put_receipt_address : Proc(IFaxDocument*, UInt8*, HRESULT)
    get_document_name : Proc(IFaxDocument*, UInt8**, HRESULT)
    put_document_name : Proc(IFaxDocument*, UInt8*, HRESULT)
    get_call_handle : Proc(IFaxDocument*, Int32*, HRESULT)
    put_call_handle : Proc(IFaxDocument*, Int32, HRESULT)
    get_cover_page_type : Proc(IFaxDocument*, FAX_COVERPAGE_TYPE_ENUM*, HRESULT)
    put_cover_page_type : Proc(IFaxDocument*, FAX_COVERPAGE_TYPE_ENUM, HRESULT)
    get_schedule_type : Proc(IFaxDocument*, FAX_SCHEDULE_TYPE_ENUM*, HRESULT)
    put_schedule_type : Proc(IFaxDocument*, FAX_SCHEDULE_TYPE_ENUM, HRESULT)
    get_receipt_type : Proc(IFaxDocument*, FAX_RECEIPT_TYPE_ENUM*, HRESULT)
    put_receipt_type : Proc(IFaxDocument*, FAX_RECEIPT_TYPE_ENUM, HRESULT)
    get_group_broadcast_receipts : Proc(IFaxDocument*, Int16*, HRESULT)
    put_group_broadcast_receipts : Proc(IFaxDocument*, Int16, HRESULT)
    get_priority : Proc(IFaxDocument*, FAX_PRIORITY_TYPE_ENUM*, HRESULT)
    put_priority : Proc(IFaxDocument*, FAX_PRIORITY_TYPE_ENUM, HRESULT)
    get_tapi_connection : Proc(IFaxDocument*, IDispatch*, HRESULT)
    putref_tapi_connection : Proc(IFaxDocument*, IDispatch, HRESULT)
    submit : Proc(IFaxDocument*, UInt8*, VARIANT*, HRESULT)
    connected_submit : Proc(IFaxDocument*, IFaxServer, VARIANT*, HRESULT)
    get_attach_fax_to_receipt : Proc(IFaxDocument*, Int16*, HRESULT)
    put_attach_fax_to_receipt : Proc(IFaxDocument*, Int16, HRESULT)
  end

  struct IFaxDocument
    lpVtbl : IFaxDocumentVTbl*
  end

  struct IFaxSenderVTbl
    query_interface : Proc(IFaxSender*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxSender*, UInt32)
    release : Proc(IFaxSender*, UInt32)
    get_type_info_count : Proc(IFaxSender*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxSender*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxSender*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxSender*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_billing_code : Proc(IFaxSender*, UInt8**, HRESULT)
    put_billing_code : Proc(IFaxSender*, UInt8*, HRESULT)
    get_city : Proc(IFaxSender*, UInt8**, HRESULT)
    put_city : Proc(IFaxSender*, UInt8*, HRESULT)
    get_company : Proc(IFaxSender*, UInt8**, HRESULT)
    put_company : Proc(IFaxSender*, UInt8*, HRESULT)
    get_country : Proc(IFaxSender*, UInt8**, HRESULT)
    put_country : Proc(IFaxSender*, UInt8*, HRESULT)
    get_department : Proc(IFaxSender*, UInt8**, HRESULT)
    put_department : Proc(IFaxSender*, UInt8*, HRESULT)
    get_email : Proc(IFaxSender*, UInt8**, HRESULT)
    put_email : Proc(IFaxSender*, UInt8*, HRESULT)
    get_fax_number : Proc(IFaxSender*, UInt8**, HRESULT)
    put_fax_number : Proc(IFaxSender*, UInt8*, HRESULT)
    get_home_phone : Proc(IFaxSender*, UInt8**, HRESULT)
    put_home_phone : Proc(IFaxSender*, UInt8*, HRESULT)
    get_name : Proc(IFaxSender*, UInt8**, HRESULT)
    put_name : Proc(IFaxSender*, UInt8*, HRESULT)
    get_tsid : Proc(IFaxSender*, UInt8**, HRESULT)
    put_tsid : Proc(IFaxSender*, UInt8*, HRESULT)
    get_office_phone : Proc(IFaxSender*, UInt8**, HRESULT)
    put_office_phone : Proc(IFaxSender*, UInt8*, HRESULT)
    get_office_location : Proc(IFaxSender*, UInt8**, HRESULT)
    put_office_location : Proc(IFaxSender*, UInt8*, HRESULT)
    get_state : Proc(IFaxSender*, UInt8**, HRESULT)
    put_state : Proc(IFaxSender*, UInt8*, HRESULT)
    get_street_address : Proc(IFaxSender*, UInt8**, HRESULT)
    put_street_address : Proc(IFaxSender*, UInt8*, HRESULT)
    get_title : Proc(IFaxSender*, UInt8**, HRESULT)
    put_title : Proc(IFaxSender*, UInt8*, HRESULT)
    get_zip_code : Proc(IFaxSender*, UInt8**, HRESULT)
    put_zip_code : Proc(IFaxSender*, UInt8*, HRESULT)
    load_default_sender : Proc(IFaxSender*, HRESULT)
    save_default_sender : Proc(IFaxSender*, HRESULT)
  end

  struct IFaxSender
    lpVtbl : IFaxSenderVTbl*
  end

  struct IFaxRecipientVTbl
    query_interface : Proc(IFaxRecipient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxRecipient*, UInt32)
    release : Proc(IFaxRecipient*, UInt32)
    get_type_info_count : Proc(IFaxRecipient*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxRecipient*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxRecipient*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxRecipient*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_fax_number : Proc(IFaxRecipient*, UInt8**, HRESULT)
    put_fax_number : Proc(IFaxRecipient*, UInt8*, HRESULT)
    get_name : Proc(IFaxRecipient*, UInt8**, HRESULT)
    put_name : Proc(IFaxRecipient*, UInt8*, HRESULT)
  end

  struct IFaxRecipient
    lpVtbl : IFaxRecipientVTbl*
  end

  struct IFaxRecipientsVTbl
    query_interface : Proc(IFaxRecipients*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxRecipients*, UInt32)
    release : Proc(IFaxRecipients*, UInt32)
    get_type_info_count : Proc(IFaxRecipients*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxRecipients*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxRecipients*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxRecipients*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxRecipients*, IUnknown*, HRESULT)
    get_item : Proc(IFaxRecipients*, Int32, IFaxRecipient*, HRESULT)
    get_count : Proc(IFaxRecipients*, Int32*, HRESULT)
    add : Proc(IFaxRecipients*, UInt8*, UInt8*, IFaxRecipient*, HRESULT)
    remove : Proc(IFaxRecipients*, Int32, HRESULT)
  end

  struct IFaxRecipients
    lpVtbl : IFaxRecipientsVTbl*
  end

  struct IFaxIncomingArchiveVTbl
    query_interface : Proc(IFaxIncomingArchive*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxIncomingArchive*, UInt32)
    release : Proc(IFaxIncomingArchive*, UInt32)
    get_type_info_count : Proc(IFaxIncomingArchive*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxIncomingArchive*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxIncomingArchive*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxIncomingArchive*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_use_archive : Proc(IFaxIncomingArchive*, Int16*, HRESULT)
    put_use_archive : Proc(IFaxIncomingArchive*, Int16, HRESULT)
    get_archive_folder : Proc(IFaxIncomingArchive*, UInt8**, HRESULT)
    put_archive_folder : Proc(IFaxIncomingArchive*, UInt8*, HRESULT)
    get_size_quota_warning : Proc(IFaxIncomingArchive*, Int16*, HRESULT)
    put_size_quota_warning : Proc(IFaxIncomingArchive*, Int16, HRESULT)
    get_high_quota_water_mark : Proc(IFaxIncomingArchive*, Int32*, HRESULT)
    put_high_quota_water_mark : Proc(IFaxIncomingArchive*, Int32, HRESULT)
    get_low_quota_water_mark : Proc(IFaxIncomingArchive*, Int32*, HRESULT)
    put_low_quota_water_mark : Proc(IFaxIncomingArchive*, Int32, HRESULT)
    get_age_limit : Proc(IFaxIncomingArchive*, Int32*, HRESULT)
    put_age_limit : Proc(IFaxIncomingArchive*, Int32, HRESULT)
    get_size_low : Proc(IFaxIncomingArchive*, Int32*, HRESULT)
    get_size_high : Proc(IFaxIncomingArchive*, Int32*, HRESULT)
    refresh : Proc(IFaxIncomingArchive*, HRESULT)
    save : Proc(IFaxIncomingArchive*, HRESULT)
    get_messages : Proc(IFaxIncomingArchive*, Int32, IFaxIncomingMessageIterator*, HRESULT)
    get_message : Proc(IFaxIncomingArchive*, UInt8*, IFaxIncomingMessage*, HRESULT)
  end

  struct IFaxIncomingArchive
    lpVtbl : IFaxIncomingArchiveVTbl*
  end

  struct IFaxIncomingQueueVTbl
    query_interface : Proc(IFaxIncomingQueue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxIncomingQueue*, UInt32)
    release : Proc(IFaxIncomingQueue*, UInt32)
    get_type_info_count : Proc(IFaxIncomingQueue*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxIncomingQueue*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxIncomingQueue*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxIncomingQueue*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_blocked : Proc(IFaxIncomingQueue*, Int16*, HRESULT)
    put_blocked : Proc(IFaxIncomingQueue*, Int16, HRESULT)
    refresh : Proc(IFaxIncomingQueue*, HRESULT)
    save : Proc(IFaxIncomingQueue*, HRESULT)
    get_jobs : Proc(IFaxIncomingQueue*, IFaxIncomingJobs*, HRESULT)
    get_job : Proc(IFaxIncomingQueue*, UInt8*, IFaxIncomingJob*, HRESULT)
  end

  struct IFaxIncomingQueue
    lpVtbl : IFaxIncomingQueueVTbl*
  end

  struct IFaxOutgoingArchiveVTbl
    query_interface : Proc(IFaxOutgoingArchive*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingArchive*, UInt32)
    release : Proc(IFaxOutgoingArchive*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingArchive*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingArchive*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingArchive*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingArchive*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_use_archive : Proc(IFaxOutgoingArchive*, Int16*, HRESULT)
    put_use_archive : Proc(IFaxOutgoingArchive*, Int16, HRESULT)
    get_archive_folder : Proc(IFaxOutgoingArchive*, UInt8**, HRESULT)
    put_archive_folder : Proc(IFaxOutgoingArchive*, UInt8*, HRESULT)
    get_size_quota_warning : Proc(IFaxOutgoingArchive*, Int16*, HRESULT)
    put_size_quota_warning : Proc(IFaxOutgoingArchive*, Int16, HRESULT)
    get_high_quota_water_mark : Proc(IFaxOutgoingArchive*, Int32*, HRESULT)
    put_high_quota_water_mark : Proc(IFaxOutgoingArchive*, Int32, HRESULT)
    get_low_quota_water_mark : Proc(IFaxOutgoingArchive*, Int32*, HRESULT)
    put_low_quota_water_mark : Proc(IFaxOutgoingArchive*, Int32, HRESULT)
    get_age_limit : Proc(IFaxOutgoingArchive*, Int32*, HRESULT)
    put_age_limit : Proc(IFaxOutgoingArchive*, Int32, HRESULT)
    get_size_low : Proc(IFaxOutgoingArchive*, Int32*, HRESULT)
    get_size_high : Proc(IFaxOutgoingArchive*, Int32*, HRESULT)
    refresh : Proc(IFaxOutgoingArchive*, HRESULT)
    save : Proc(IFaxOutgoingArchive*, HRESULT)
    get_messages : Proc(IFaxOutgoingArchive*, Int32, IFaxOutgoingMessageIterator*, HRESULT)
    get_message : Proc(IFaxOutgoingArchive*, UInt8*, IFaxOutgoingMessage*, HRESULT)
  end

  struct IFaxOutgoingArchive
    lpVtbl : IFaxOutgoingArchiveVTbl*
  end

  struct IFaxOutgoingQueueVTbl
    query_interface : Proc(IFaxOutgoingQueue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingQueue*, UInt32)
    release : Proc(IFaxOutgoingQueue*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingQueue*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingQueue*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingQueue*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingQueue*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_blocked : Proc(IFaxOutgoingQueue*, Int16*, HRESULT)
    put_blocked : Proc(IFaxOutgoingQueue*, Int16, HRESULT)
    get_paused : Proc(IFaxOutgoingQueue*, Int16*, HRESULT)
    put_paused : Proc(IFaxOutgoingQueue*, Int16, HRESULT)
    get_allow_personal_cover_pages : Proc(IFaxOutgoingQueue*, Int16*, HRESULT)
    put_allow_personal_cover_pages : Proc(IFaxOutgoingQueue*, Int16, HRESULT)
    get_use_device_tsid : Proc(IFaxOutgoingQueue*, Int16*, HRESULT)
    put_use_device_tsid : Proc(IFaxOutgoingQueue*, Int16, HRESULT)
    get_retries : Proc(IFaxOutgoingQueue*, Int32*, HRESULT)
    put_retries : Proc(IFaxOutgoingQueue*, Int32, HRESULT)
    get_retry_delay : Proc(IFaxOutgoingQueue*, Int32*, HRESULT)
    put_retry_delay : Proc(IFaxOutgoingQueue*, Int32, HRESULT)
    get_discount_rate_start : Proc(IFaxOutgoingQueue*, Float64*, HRESULT)
    put_discount_rate_start : Proc(IFaxOutgoingQueue*, Float64, HRESULT)
    get_discount_rate_end : Proc(IFaxOutgoingQueue*, Float64*, HRESULT)
    put_discount_rate_end : Proc(IFaxOutgoingQueue*, Float64, HRESULT)
    get_age_limit : Proc(IFaxOutgoingQueue*, Int32*, HRESULT)
    put_age_limit : Proc(IFaxOutgoingQueue*, Int32, HRESULT)
    get_branding : Proc(IFaxOutgoingQueue*, Int16*, HRESULT)
    put_branding : Proc(IFaxOutgoingQueue*, Int16, HRESULT)
    refresh : Proc(IFaxOutgoingQueue*, HRESULT)
    save : Proc(IFaxOutgoingQueue*, HRESULT)
    get_jobs : Proc(IFaxOutgoingQueue*, IFaxOutgoingJobs*, HRESULT)
    get_job : Proc(IFaxOutgoingQueue*, UInt8*, IFaxOutgoingJob*, HRESULT)
  end

  struct IFaxOutgoingQueue
    lpVtbl : IFaxOutgoingQueueVTbl*
  end

  struct IFaxIncomingMessageIteratorVTbl
    query_interface : Proc(IFaxIncomingMessageIterator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxIncomingMessageIterator*, UInt32)
    release : Proc(IFaxIncomingMessageIterator*, UInt32)
    get_type_info_count : Proc(IFaxIncomingMessageIterator*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxIncomingMessageIterator*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxIncomingMessageIterator*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxIncomingMessageIterator*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_message : Proc(IFaxIncomingMessageIterator*, IFaxIncomingMessage*, HRESULT)
    get_prefetch_size : Proc(IFaxIncomingMessageIterator*, Int32*, HRESULT)
    put_prefetch_size : Proc(IFaxIncomingMessageIterator*, Int32, HRESULT)
    get_at_eof : Proc(IFaxIncomingMessageIterator*, Int16*, HRESULT)
    move_first : Proc(IFaxIncomingMessageIterator*, HRESULT)
    move_next : Proc(IFaxIncomingMessageIterator*, HRESULT)
  end

  struct IFaxIncomingMessageIterator
    lpVtbl : IFaxIncomingMessageIteratorVTbl*
  end

  struct IFaxIncomingMessageVTbl
    query_interface : Proc(IFaxIncomingMessage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxIncomingMessage*, UInt32)
    release : Proc(IFaxIncomingMessage*, UInt32)
    get_type_info_count : Proc(IFaxIncomingMessage*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxIncomingMessage*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxIncomingMessage*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxIncomingMessage*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFaxIncomingMessage*, UInt8**, HRESULT)
    get_pages : Proc(IFaxIncomingMessage*, Int32*, HRESULT)
    get_size : Proc(IFaxIncomingMessage*, Int32*, HRESULT)
    get_device_name : Proc(IFaxIncomingMessage*, UInt8**, HRESULT)
    get_retries : Proc(IFaxIncomingMessage*, Int32*, HRESULT)
    get_transmission_start : Proc(IFaxIncomingMessage*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxIncomingMessage*, Float64*, HRESULT)
    get_csid : Proc(IFaxIncomingMessage*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxIncomingMessage*, UInt8**, HRESULT)
    get_caller_id : Proc(IFaxIncomingMessage*, UInt8**, HRESULT)
    get_routing_information : Proc(IFaxIncomingMessage*, UInt8**, HRESULT)
    copy_tiff : Proc(IFaxIncomingMessage*, UInt8*, HRESULT)
    delete : Proc(IFaxIncomingMessage*, HRESULT)
  end

  struct IFaxIncomingMessage
    lpVtbl : IFaxIncomingMessageVTbl*
  end

  struct IFaxOutgoingJobsVTbl
    query_interface : Proc(IFaxOutgoingJobs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingJobs*, UInt32)
    release : Proc(IFaxOutgoingJobs*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingJobs*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingJobs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingJobs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingJobs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxOutgoingJobs*, IUnknown*, HRESULT)
    get_item : Proc(IFaxOutgoingJobs*, VARIANT, IFaxOutgoingJob*, HRESULT)
    get_count : Proc(IFaxOutgoingJobs*, Int32*, HRESULT)
  end

  struct IFaxOutgoingJobs
    lpVtbl : IFaxOutgoingJobsVTbl*
  end

  struct IFaxOutgoingJobVTbl
    query_interface : Proc(IFaxOutgoingJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingJob*, UInt32)
    release : Proc(IFaxOutgoingJob*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingJob*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingJob*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingJob*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingJob*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_subject : Proc(IFaxOutgoingJob*, UInt8**, HRESULT)
    get_document_name : Proc(IFaxOutgoingJob*, UInt8**, HRESULT)
    get_pages : Proc(IFaxOutgoingJob*, Int32*, HRESULT)
    get_size : Proc(IFaxOutgoingJob*, Int32*, HRESULT)
    get_submission_id : Proc(IFaxOutgoingJob*, UInt8**, HRESULT)
    get_id : Proc(IFaxOutgoingJob*, UInt8**, HRESULT)
    get_original_scheduled_time : Proc(IFaxOutgoingJob*, Float64*, HRESULT)
    get_submission_time : Proc(IFaxOutgoingJob*, Float64*, HRESULT)
    get_receipt_type : Proc(IFaxOutgoingJob*, FAX_RECEIPT_TYPE_ENUM*, HRESULT)
    get_priority : Proc(IFaxOutgoingJob*, FAX_PRIORITY_TYPE_ENUM*, HRESULT)
    get_sender : Proc(IFaxOutgoingJob*, IFaxSender*, HRESULT)
    get_recipient : Proc(IFaxOutgoingJob*, IFaxRecipient*, HRESULT)
    get_current_page : Proc(IFaxOutgoingJob*, Int32*, HRESULT)
    get_device_id : Proc(IFaxOutgoingJob*, Int32*, HRESULT)
    get_status : Proc(IFaxOutgoingJob*, FAX_JOB_STATUS_ENUM*, HRESULT)
    get_extended_status_code : Proc(IFaxOutgoingJob*, FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)
    get_extended_status : Proc(IFaxOutgoingJob*, UInt8**, HRESULT)
    get_available_operations : Proc(IFaxOutgoingJob*, FAX_JOB_OPERATIONS_ENUM*, HRESULT)
    get_retries : Proc(IFaxOutgoingJob*, Int32*, HRESULT)
    get_scheduled_time : Proc(IFaxOutgoingJob*, Float64*, HRESULT)
    get_transmission_start : Proc(IFaxOutgoingJob*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxOutgoingJob*, Float64*, HRESULT)
    get_csid : Proc(IFaxOutgoingJob*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxOutgoingJob*, UInt8**, HRESULT)
    get_group_broadcast_receipts : Proc(IFaxOutgoingJob*, Int16*, HRESULT)
    pause : Proc(IFaxOutgoingJob*, HRESULT)
    resume : Proc(IFaxOutgoingJob*, HRESULT)
    restart : Proc(IFaxOutgoingJob*, HRESULT)
    copy_tiff : Proc(IFaxOutgoingJob*, UInt8*, HRESULT)
    refresh : Proc(IFaxOutgoingJob*, HRESULT)
    cancel : Proc(IFaxOutgoingJob*, HRESULT)
  end

  struct IFaxOutgoingJob
    lpVtbl : IFaxOutgoingJobVTbl*
  end

  struct IFaxOutgoingMessageIteratorVTbl
    query_interface : Proc(IFaxOutgoingMessageIterator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingMessageIterator*, UInt32)
    release : Proc(IFaxOutgoingMessageIterator*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingMessageIterator*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingMessageIterator*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingMessageIterator*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingMessageIterator*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_message : Proc(IFaxOutgoingMessageIterator*, IFaxOutgoingMessage*, HRESULT)
    get_at_eof : Proc(IFaxOutgoingMessageIterator*, Int16*, HRESULT)
    get_prefetch_size : Proc(IFaxOutgoingMessageIterator*, Int32*, HRESULT)
    put_prefetch_size : Proc(IFaxOutgoingMessageIterator*, Int32, HRESULT)
    move_first : Proc(IFaxOutgoingMessageIterator*, HRESULT)
    move_next : Proc(IFaxOutgoingMessageIterator*, HRESULT)
  end

  struct IFaxOutgoingMessageIterator
    lpVtbl : IFaxOutgoingMessageIteratorVTbl*
  end

  struct IFaxOutgoingMessageVTbl
    query_interface : Proc(IFaxOutgoingMessage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingMessage*, UInt32)
    release : Proc(IFaxOutgoingMessage*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingMessage*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingMessage*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingMessage*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingMessage*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_submission_id : Proc(IFaxOutgoingMessage*, UInt8**, HRESULT)
    get_id : Proc(IFaxOutgoingMessage*, UInt8**, HRESULT)
    get_subject : Proc(IFaxOutgoingMessage*, UInt8**, HRESULT)
    get_document_name : Proc(IFaxOutgoingMessage*, UInt8**, HRESULT)
    get_retries : Proc(IFaxOutgoingMessage*, Int32*, HRESULT)
    get_pages : Proc(IFaxOutgoingMessage*, Int32*, HRESULT)
    get_size : Proc(IFaxOutgoingMessage*, Int32*, HRESULT)
    get_original_scheduled_time : Proc(IFaxOutgoingMessage*, Float64*, HRESULT)
    get_submission_time : Proc(IFaxOutgoingMessage*, Float64*, HRESULT)
    get_priority : Proc(IFaxOutgoingMessage*, FAX_PRIORITY_TYPE_ENUM*, HRESULT)
    get_sender : Proc(IFaxOutgoingMessage*, IFaxSender*, HRESULT)
    get_recipient : Proc(IFaxOutgoingMessage*, IFaxRecipient*, HRESULT)
    get_device_name : Proc(IFaxOutgoingMessage*, UInt8**, HRESULT)
    get_transmission_start : Proc(IFaxOutgoingMessage*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxOutgoingMessage*, Float64*, HRESULT)
    get_csid : Proc(IFaxOutgoingMessage*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxOutgoingMessage*, UInt8**, HRESULT)
    copy_tiff : Proc(IFaxOutgoingMessage*, UInt8*, HRESULT)
    delete : Proc(IFaxOutgoingMessage*, HRESULT)
  end

  struct IFaxOutgoingMessage
    lpVtbl : IFaxOutgoingMessageVTbl*
  end

  struct IFaxIncomingJobsVTbl
    query_interface : Proc(IFaxIncomingJobs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxIncomingJobs*, UInt32)
    release : Proc(IFaxIncomingJobs*, UInt32)
    get_type_info_count : Proc(IFaxIncomingJobs*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxIncomingJobs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxIncomingJobs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxIncomingJobs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxIncomingJobs*, IUnknown*, HRESULT)
    get_item : Proc(IFaxIncomingJobs*, VARIANT, IFaxIncomingJob*, HRESULT)
    get_count : Proc(IFaxIncomingJobs*, Int32*, HRESULT)
  end

  struct IFaxIncomingJobs
    lpVtbl : IFaxIncomingJobsVTbl*
  end

  struct IFaxIncomingJobVTbl
    query_interface : Proc(IFaxIncomingJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxIncomingJob*, UInt32)
    release : Proc(IFaxIncomingJob*, UInt32)
    get_type_info_count : Proc(IFaxIncomingJob*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxIncomingJob*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxIncomingJob*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxIncomingJob*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_size : Proc(IFaxIncomingJob*, Int32*, HRESULT)
    get_id : Proc(IFaxIncomingJob*, UInt8**, HRESULT)
    get_current_page : Proc(IFaxIncomingJob*, Int32*, HRESULT)
    get_device_id : Proc(IFaxIncomingJob*, Int32*, HRESULT)
    get_status : Proc(IFaxIncomingJob*, FAX_JOB_STATUS_ENUM*, HRESULT)
    get_extended_status_code : Proc(IFaxIncomingJob*, FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)
    get_extended_status : Proc(IFaxIncomingJob*, UInt8**, HRESULT)
    get_available_operations : Proc(IFaxIncomingJob*, FAX_JOB_OPERATIONS_ENUM*, HRESULT)
    get_retries : Proc(IFaxIncomingJob*, Int32*, HRESULT)
    get_transmission_start : Proc(IFaxIncomingJob*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxIncomingJob*, Float64*, HRESULT)
    get_csid : Proc(IFaxIncomingJob*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxIncomingJob*, UInt8**, HRESULT)
    get_caller_id : Proc(IFaxIncomingJob*, UInt8**, HRESULT)
    get_routing_information : Proc(IFaxIncomingJob*, UInt8**, HRESULT)
    get_job_type : Proc(IFaxIncomingJob*, FAX_JOB_TYPE_ENUM*, HRESULT)
    cancel : Proc(IFaxIncomingJob*, HRESULT)
    refresh : Proc(IFaxIncomingJob*, HRESULT)
    copy_tiff : Proc(IFaxIncomingJob*, UInt8*, HRESULT)
  end

  struct IFaxIncomingJob
    lpVtbl : IFaxIncomingJobVTbl*
  end

  struct IFaxDeviceProviderVTbl
    query_interface : Proc(IFaxDeviceProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxDeviceProvider*, UInt32)
    release : Proc(IFaxDeviceProvider*, UInt32)
    get_type_info_count : Proc(IFaxDeviceProvider*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxDeviceProvider*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxDeviceProvider*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxDeviceProvider*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_friendly_name : Proc(IFaxDeviceProvider*, UInt8**, HRESULT)
    get_image_name : Proc(IFaxDeviceProvider*, UInt8**, HRESULT)
    get_unique_name : Proc(IFaxDeviceProvider*, UInt8**, HRESULT)
    get_tapi_provider_name : Proc(IFaxDeviceProvider*, UInt8**, HRESULT)
    get_major_version : Proc(IFaxDeviceProvider*, Int32*, HRESULT)
    get_minor_version : Proc(IFaxDeviceProvider*, Int32*, HRESULT)
    get_major_build : Proc(IFaxDeviceProvider*, Int32*, HRESULT)
    get_minor_build : Proc(IFaxDeviceProvider*, Int32*, HRESULT)
    get_debug : Proc(IFaxDeviceProvider*, Int16*, HRESULT)
    get_status : Proc(IFaxDeviceProvider*, FAX_PROVIDER_STATUS_ENUM*, HRESULT)
    get_init_error_code : Proc(IFaxDeviceProvider*, Int32*, HRESULT)
    get_device_ids : Proc(IFaxDeviceProvider*, VARIANT*, HRESULT)
  end

  struct IFaxDeviceProvider
    lpVtbl : IFaxDeviceProviderVTbl*
  end

  struct IFaxDeviceVTbl
    query_interface : Proc(IFaxDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxDevice*, UInt32)
    release : Proc(IFaxDevice*, UInt32)
    get_type_info_count : Proc(IFaxDevice*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxDevice*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxDevice*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxDevice*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFaxDevice*, Int32*, HRESULT)
    get_device_name : Proc(IFaxDevice*, UInt8**, HRESULT)
    get_provider_unique_name : Proc(IFaxDevice*, UInt8**, HRESULT)
    get_powered_off : Proc(IFaxDevice*, Int16*, HRESULT)
    get_receiving_now : Proc(IFaxDevice*, Int16*, HRESULT)
    get_sending_now : Proc(IFaxDevice*, Int16*, HRESULT)
    get_used_routing_methods : Proc(IFaxDevice*, VARIANT*, HRESULT)
    get_description : Proc(IFaxDevice*, UInt8**, HRESULT)
    put_description : Proc(IFaxDevice*, UInt8*, HRESULT)
    get_send_enabled : Proc(IFaxDevice*, Int16*, HRESULT)
    put_send_enabled : Proc(IFaxDevice*, Int16, HRESULT)
    get_receive_mode : Proc(IFaxDevice*, FAX_DEVICE_RECEIVE_MODE_ENUM*, HRESULT)
    put_receive_mode : Proc(IFaxDevice*, FAX_DEVICE_RECEIVE_MODE_ENUM, HRESULT)
    get_rings_before_answer : Proc(IFaxDevice*, Int32*, HRESULT)
    put_rings_before_answer : Proc(IFaxDevice*, Int32, HRESULT)
    get_csid : Proc(IFaxDevice*, UInt8**, HRESULT)
    put_csid : Proc(IFaxDevice*, UInt8*, HRESULT)
    get_tsid : Proc(IFaxDevice*, UInt8**, HRESULT)
    put_tsid : Proc(IFaxDevice*, UInt8*, HRESULT)
    refresh : Proc(IFaxDevice*, HRESULT)
    save : Proc(IFaxDevice*, HRESULT)
    get_extension_property : Proc(IFaxDevice*, UInt8*, VARIANT*, HRESULT)
    set_extension_property : Proc(IFaxDevice*, UInt8*, VARIANT, HRESULT)
    use_routing_method : Proc(IFaxDevice*, UInt8*, Int16, HRESULT)
    get_ringing_now : Proc(IFaxDevice*, Int16*, HRESULT)
    answer_call : Proc(IFaxDevice*, HRESULT)
  end

  struct IFaxDevice
    lpVtbl : IFaxDeviceVTbl*
  end

  struct IFaxActivityLoggingVTbl
    query_interface : Proc(IFaxActivityLogging*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxActivityLogging*, UInt32)
    release : Proc(IFaxActivityLogging*, UInt32)
    get_type_info_count : Proc(IFaxActivityLogging*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxActivityLogging*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxActivityLogging*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxActivityLogging*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_log_incoming : Proc(IFaxActivityLogging*, Int16*, HRESULT)
    put_log_incoming : Proc(IFaxActivityLogging*, Int16, HRESULT)
    get_log_outgoing : Proc(IFaxActivityLogging*, Int16*, HRESULT)
    put_log_outgoing : Proc(IFaxActivityLogging*, Int16, HRESULT)
    get_database_path : Proc(IFaxActivityLogging*, UInt8**, HRESULT)
    put_database_path : Proc(IFaxActivityLogging*, UInt8*, HRESULT)
    refresh : Proc(IFaxActivityLogging*, HRESULT)
    save : Proc(IFaxActivityLogging*, HRESULT)
  end

  struct IFaxActivityLogging
    lpVtbl : IFaxActivityLoggingVTbl*
  end

  struct IFaxEventLoggingVTbl
    query_interface : Proc(IFaxEventLogging*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxEventLogging*, UInt32)
    release : Proc(IFaxEventLogging*, UInt32)
    get_type_info_count : Proc(IFaxEventLogging*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxEventLogging*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxEventLogging*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxEventLogging*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_init_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM*, HRESULT)
    put_init_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM, HRESULT)
    get_inbound_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM*, HRESULT)
    put_inbound_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM, HRESULT)
    get_outbound_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM*, HRESULT)
    put_outbound_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM, HRESULT)
    get_general_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM*, HRESULT)
    put_general_events_level : Proc(IFaxEventLogging*, FAX_LOG_LEVEL_ENUM, HRESULT)
    refresh : Proc(IFaxEventLogging*, HRESULT)
    save : Proc(IFaxEventLogging*, HRESULT)
  end

  struct IFaxEventLogging
    lpVtbl : IFaxEventLoggingVTbl*
  end

  struct IFaxOutboundRoutingGroupsVTbl
    query_interface : Proc(IFaxOutboundRoutingGroups*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutboundRoutingGroups*, UInt32)
    release : Proc(IFaxOutboundRoutingGroups*, UInt32)
    get_type_info_count : Proc(IFaxOutboundRoutingGroups*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutboundRoutingGroups*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutboundRoutingGroups*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutboundRoutingGroups*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxOutboundRoutingGroups*, IUnknown*, HRESULT)
    get_item : Proc(IFaxOutboundRoutingGroups*, VARIANT, IFaxOutboundRoutingGroup*, HRESULT)
    get_count : Proc(IFaxOutboundRoutingGroups*, Int32*, HRESULT)
    add : Proc(IFaxOutboundRoutingGroups*, UInt8*, IFaxOutboundRoutingGroup*, HRESULT)
    remove : Proc(IFaxOutboundRoutingGroups*, VARIANT, HRESULT)
  end

  struct IFaxOutboundRoutingGroups
    lpVtbl : IFaxOutboundRoutingGroupsVTbl*
  end

  struct IFaxOutboundRoutingGroupVTbl
    query_interface : Proc(IFaxOutboundRoutingGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutboundRoutingGroup*, UInt32)
    release : Proc(IFaxOutboundRoutingGroup*, UInt32)
    get_type_info_count : Proc(IFaxOutboundRoutingGroup*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutboundRoutingGroup*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutboundRoutingGroup*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutboundRoutingGroup*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IFaxOutboundRoutingGroup*, UInt8**, HRESULT)
    get_status : Proc(IFaxOutboundRoutingGroup*, FAX_GROUP_STATUS_ENUM*, HRESULT)
    get_device_ids : Proc(IFaxOutboundRoutingGroup*, IFaxDeviceIds*, HRESULT)
  end

  struct IFaxOutboundRoutingGroup
    lpVtbl : IFaxOutboundRoutingGroupVTbl*
  end

  struct IFaxDeviceIdsVTbl
    query_interface : Proc(IFaxDeviceIds*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxDeviceIds*, UInt32)
    release : Proc(IFaxDeviceIds*, UInt32)
    get_type_info_count : Proc(IFaxDeviceIds*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxDeviceIds*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxDeviceIds*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxDeviceIds*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxDeviceIds*, IUnknown*, HRESULT)
    get_item : Proc(IFaxDeviceIds*, Int32, Int32*, HRESULT)
    get_count : Proc(IFaxDeviceIds*, Int32*, HRESULT)
    add : Proc(IFaxDeviceIds*, Int32, HRESULT)
    remove : Proc(IFaxDeviceIds*, Int32, HRESULT)
    set_order : Proc(IFaxDeviceIds*, Int32, Int32, HRESULT)
  end

  struct IFaxDeviceIds
    lpVtbl : IFaxDeviceIdsVTbl*
  end

  struct IFaxOutboundRoutingRulesVTbl
    query_interface : Proc(IFaxOutboundRoutingRules*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutboundRoutingRules*, UInt32)
    release : Proc(IFaxOutboundRoutingRules*, UInt32)
    get_type_info_count : Proc(IFaxOutboundRoutingRules*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutboundRoutingRules*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutboundRoutingRules*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutboundRoutingRules*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxOutboundRoutingRules*, IUnknown*, HRESULT)
    get_item : Proc(IFaxOutboundRoutingRules*, Int32, IFaxOutboundRoutingRule*, HRESULT)
    get_count : Proc(IFaxOutboundRoutingRules*, Int32*, HRESULT)
    item_by_country_and_area : Proc(IFaxOutboundRoutingRules*, Int32, Int32, IFaxOutboundRoutingRule*, HRESULT)
    remove_by_country_and_area : Proc(IFaxOutboundRoutingRules*, Int32, Int32, HRESULT)
    remove : Proc(IFaxOutboundRoutingRules*, Int32, HRESULT)
    add : Proc(IFaxOutboundRoutingRules*, Int32, Int32, Int16, UInt8*, Int32, IFaxOutboundRoutingRule*, HRESULT)
  end

  struct IFaxOutboundRoutingRules
    lpVtbl : IFaxOutboundRoutingRulesVTbl*
  end

  struct IFaxOutboundRoutingRuleVTbl
    query_interface : Proc(IFaxOutboundRoutingRule*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutboundRoutingRule*, UInt32)
    release : Proc(IFaxOutboundRoutingRule*, UInt32)
    get_type_info_count : Proc(IFaxOutboundRoutingRule*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutboundRoutingRule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutboundRoutingRule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutboundRoutingRule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_country_code : Proc(IFaxOutboundRoutingRule*, Int32*, HRESULT)
    get_area_code : Proc(IFaxOutboundRoutingRule*, Int32*, HRESULT)
    get_status : Proc(IFaxOutboundRoutingRule*, FAX_RULE_STATUS_ENUM*, HRESULT)
    get_use_device : Proc(IFaxOutboundRoutingRule*, Int16*, HRESULT)
    put_use_device : Proc(IFaxOutboundRoutingRule*, Int16, HRESULT)
    get_device_id : Proc(IFaxOutboundRoutingRule*, Int32*, HRESULT)
    put_device_id : Proc(IFaxOutboundRoutingRule*, Int32, HRESULT)
    get_group_name : Proc(IFaxOutboundRoutingRule*, UInt8**, HRESULT)
    put_group_name : Proc(IFaxOutboundRoutingRule*, UInt8*, HRESULT)
    refresh : Proc(IFaxOutboundRoutingRule*, HRESULT)
    save : Proc(IFaxOutboundRoutingRule*, HRESULT)
  end

  struct IFaxOutboundRoutingRule
    lpVtbl : IFaxOutboundRoutingRuleVTbl*
  end

  struct IFaxInboundRoutingExtensionsVTbl
    query_interface : Proc(IFaxInboundRoutingExtensions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxInboundRoutingExtensions*, UInt32)
    release : Proc(IFaxInboundRoutingExtensions*, UInt32)
    get_type_info_count : Proc(IFaxInboundRoutingExtensions*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxInboundRoutingExtensions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxInboundRoutingExtensions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxInboundRoutingExtensions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxInboundRoutingExtensions*, IUnknown*, HRESULT)
    get_item : Proc(IFaxInboundRoutingExtensions*, VARIANT, IFaxInboundRoutingExtension*, HRESULT)
    get_count : Proc(IFaxInboundRoutingExtensions*, Int32*, HRESULT)
  end

  struct IFaxInboundRoutingExtensions
    lpVtbl : IFaxInboundRoutingExtensionsVTbl*
  end

  struct IFaxInboundRoutingExtensionVTbl
    query_interface : Proc(IFaxInboundRoutingExtension*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxInboundRoutingExtension*, UInt32)
    release : Proc(IFaxInboundRoutingExtension*, UInt32)
    get_type_info_count : Proc(IFaxInboundRoutingExtension*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxInboundRoutingExtension*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxInboundRoutingExtension*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxInboundRoutingExtension*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_friendly_name : Proc(IFaxInboundRoutingExtension*, UInt8**, HRESULT)
    get_image_name : Proc(IFaxInboundRoutingExtension*, UInt8**, HRESULT)
    get_unique_name : Proc(IFaxInboundRoutingExtension*, UInt8**, HRESULT)
    get_major_version : Proc(IFaxInboundRoutingExtension*, Int32*, HRESULT)
    get_minor_version : Proc(IFaxInboundRoutingExtension*, Int32*, HRESULT)
    get_major_build : Proc(IFaxInboundRoutingExtension*, Int32*, HRESULT)
    get_minor_build : Proc(IFaxInboundRoutingExtension*, Int32*, HRESULT)
    get_debug : Proc(IFaxInboundRoutingExtension*, Int16*, HRESULT)
    get_status : Proc(IFaxInboundRoutingExtension*, FAX_PROVIDER_STATUS_ENUM*, HRESULT)
    get_init_error_code : Proc(IFaxInboundRoutingExtension*, Int32*, HRESULT)
    get_methods : Proc(IFaxInboundRoutingExtension*, VARIANT*, HRESULT)
  end

  struct IFaxInboundRoutingExtension
    lpVtbl : IFaxInboundRoutingExtensionVTbl*
  end

  struct IFaxInboundRoutingMethodsVTbl
    query_interface : Proc(IFaxInboundRoutingMethods*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxInboundRoutingMethods*, UInt32)
    release : Proc(IFaxInboundRoutingMethods*, UInt32)
    get_type_info_count : Proc(IFaxInboundRoutingMethods*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxInboundRoutingMethods*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxInboundRoutingMethods*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxInboundRoutingMethods*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxInboundRoutingMethods*, IUnknown*, HRESULT)
    get_item : Proc(IFaxInboundRoutingMethods*, VARIANT, IFaxInboundRoutingMethod*, HRESULT)
    get_count : Proc(IFaxInboundRoutingMethods*, Int32*, HRESULT)
  end

  struct IFaxInboundRoutingMethods
    lpVtbl : IFaxInboundRoutingMethodsVTbl*
  end

  struct IFaxInboundRoutingMethodVTbl
    query_interface : Proc(IFaxInboundRoutingMethod*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxInboundRoutingMethod*, UInt32)
    release : Proc(IFaxInboundRoutingMethod*, UInt32)
    get_type_info_count : Proc(IFaxInboundRoutingMethod*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxInboundRoutingMethod*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxInboundRoutingMethod*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxInboundRoutingMethod*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IFaxInboundRoutingMethod*, UInt8**, HRESULT)
    get_guid : Proc(IFaxInboundRoutingMethod*, UInt8**, HRESULT)
    get_function_name : Proc(IFaxInboundRoutingMethod*, UInt8**, HRESULT)
    get_extension_friendly_name : Proc(IFaxInboundRoutingMethod*, UInt8**, HRESULT)
    get_extension_image_name : Proc(IFaxInboundRoutingMethod*, UInt8**, HRESULT)
    get_priority : Proc(IFaxInboundRoutingMethod*, Int32*, HRESULT)
    put_priority : Proc(IFaxInboundRoutingMethod*, Int32, HRESULT)
    refresh : Proc(IFaxInboundRoutingMethod*, HRESULT)
    save : Proc(IFaxInboundRoutingMethod*, HRESULT)
  end

  struct IFaxInboundRoutingMethod
    lpVtbl : IFaxInboundRoutingMethodVTbl*
  end

  struct IFaxDocument2VTbl
    query_interface : Proc(IFaxDocument2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxDocument2*, UInt32)
    release : Proc(IFaxDocument2*, UInt32)
    get_type_info_count : Proc(IFaxDocument2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxDocument2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxDocument2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxDocument2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_body : Proc(IFaxDocument2*, UInt8**, HRESULT)
    put_body : Proc(IFaxDocument2*, UInt8*, HRESULT)
    get_sender : Proc(IFaxDocument2*, IFaxSender*, HRESULT)
    get_recipients : Proc(IFaxDocument2*, IFaxRecipients*, HRESULT)
    get_cover_page : Proc(IFaxDocument2*, UInt8**, HRESULT)
    put_cover_page : Proc(IFaxDocument2*, UInt8*, HRESULT)
    get_subject : Proc(IFaxDocument2*, UInt8**, HRESULT)
    put_subject : Proc(IFaxDocument2*, UInt8*, HRESULT)
    get_note : Proc(IFaxDocument2*, UInt8**, HRESULT)
    put_note : Proc(IFaxDocument2*, UInt8*, HRESULT)
    get_schedule_time : Proc(IFaxDocument2*, Float64*, HRESULT)
    put_schedule_time : Proc(IFaxDocument2*, Float64, HRESULT)
    get_receipt_address : Proc(IFaxDocument2*, UInt8**, HRESULT)
    put_receipt_address : Proc(IFaxDocument2*, UInt8*, HRESULT)
    get_document_name : Proc(IFaxDocument2*, UInt8**, HRESULT)
    put_document_name : Proc(IFaxDocument2*, UInt8*, HRESULT)
    get_call_handle : Proc(IFaxDocument2*, Int32*, HRESULT)
    put_call_handle : Proc(IFaxDocument2*, Int32, HRESULT)
    get_cover_page_type : Proc(IFaxDocument2*, FAX_COVERPAGE_TYPE_ENUM*, HRESULT)
    put_cover_page_type : Proc(IFaxDocument2*, FAX_COVERPAGE_TYPE_ENUM, HRESULT)
    get_schedule_type : Proc(IFaxDocument2*, FAX_SCHEDULE_TYPE_ENUM*, HRESULT)
    put_schedule_type : Proc(IFaxDocument2*, FAX_SCHEDULE_TYPE_ENUM, HRESULT)
    get_receipt_type : Proc(IFaxDocument2*, FAX_RECEIPT_TYPE_ENUM*, HRESULT)
    put_receipt_type : Proc(IFaxDocument2*, FAX_RECEIPT_TYPE_ENUM, HRESULT)
    get_group_broadcast_receipts : Proc(IFaxDocument2*, Int16*, HRESULT)
    put_group_broadcast_receipts : Proc(IFaxDocument2*, Int16, HRESULT)
    get_priority : Proc(IFaxDocument2*, FAX_PRIORITY_TYPE_ENUM*, HRESULT)
    put_priority : Proc(IFaxDocument2*, FAX_PRIORITY_TYPE_ENUM, HRESULT)
    get_tapi_connection : Proc(IFaxDocument2*, IDispatch*, HRESULT)
    putref_tapi_connection : Proc(IFaxDocument2*, IDispatch, HRESULT)
    submit : Proc(IFaxDocument2*, UInt8*, VARIANT*, HRESULT)
    connected_submit : Proc(IFaxDocument2*, IFaxServer, VARIANT*, HRESULT)
    get_attach_fax_to_receipt : Proc(IFaxDocument2*, Int16*, HRESULT)
    put_attach_fax_to_receipt : Proc(IFaxDocument2*, Int16, HRESULT)
    get_submission_id : Proc(IFaxDocument2*, UInt8**, HRESULT)
    get_bodies : Proc(IFaxDocument2*, VARIANT*, HRESULT)
    put_bodies : Proc(IFaxDocument2*, VARIANT, HRESULT)
    submit2 : Proc(IFaxDocument2*, UInt8*, VARIANT*, Int32*, HRESULT)
    connected_submit2 : Proc(IFaxDocument2*, IFaxServer, VARIANT*, Int32*, HRESULT)
  end

  struct IFaxDocument2
    lpVtbl : IFaxDocument2VTbl*
  end

  struct IFaxConfigurationVTbl
    query_interface : Proc(IFaxConfiguration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxConfiguration*, UInt32)
    release : Proc(IFaxConfiguration*, UInt32)
    get_type_info_count : Proc(IFaxConfiguration*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxConfiguration*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxConfiguration*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxConfiguration*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_use_archive : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_use_archive : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_archive_location : Proc(IFaxConfiguration*, UInt8**, HRESULT)
    put_archive_location : Proc(IFaxConfiguration*, UInt8*, HRESULT)
    get_size_quota_warning : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_size_quota_warning : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_high_quota_water_mark : Proc(IFaxConfiguration*, Int32*, HRESULT)
    put_high_quota_water_mark : Proc(IFaxConfiguration*, Int32, HRESULT)
    get_low_quota_water_mark : Proc(IFaxConfiguration*, Int32*, HRESULT)
    put_low_quota_water_mark : Proc(IFaxConfiguration*, Int32, HRESULT)
    get_archive_age_limit : Proc(IFaxConfiguration*, Int32*, HRESULT)
    put_archive_age_limit : Proc(IFaxConfiguration*, Int32, HRESULT)
    get_archive_size_low : Proc(IFaxConfiguration*, Int32*, HRESULT)
    get_archive_size_high : Proc(IFaxConfiguration*, Int32*, HRESULT)
    get_outgoing_queue_blocked : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_outgoing_queue_blocked : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_outgoing_queue_paused : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_outgoing_queue_paused : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_allow_personal_cover_pages : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_allow_personal_cover_pages : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_use_device_tsid : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_use_device_tsid : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_retries : Proc(IFaxConfiguration*, Int32*, HRESULT)
    put_retries : Proc(IFaxConfiguration*, Int32, HRESULT)
    get_retry_delay : Proc(IFaxConfiguration*, Int32*, HRESULT)
    put_retry_delay : Proc(IFaxConfiguration*, Int32, HRESULT)
    get_discount_rate_start : Proc(IFaxConfiguration*, Float64*, HRESULT)
    put_discount_rate_start : Proc(IFaxConfiguration*, Float64, HRESULT)
    get_discount_rate_end : Proc(IFaxConfiguration*, Float64*, HRESULT)
    put_discount_rate_end : Proc(IFaxConfiguration*, Float64, HRESULT)
    get_outgoing_queue_age_limit : Proc(IFaxConfiguration*, Int32*, HRESULT)
    put_outgoing_queue_age_limit : Proc(IFaxConfiguration*, Int32, HRESULT)
    get_branding : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_branding : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_incoming_queue_blocked : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_incoming_queue_blocked : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_auto_create_account_on_connect : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_auto_create_account_on_connect : Proc(IFaxConfiguration*, Int16, HRESULT)
    get_incoming_faxes_are_public : Proc(IFaxConfiguration*, Int16*, HRESULT)
    put_incoming_faxes_are_public : Proc(IFaxConfiguration*, Int16, HRESULT)
    refresh : Proc(IFaxConfiguration*, HRESULT)
    save : Proc(IFaxConfiguration*, HRESULT)
  end

  struct IFaxConfiguration
    lpVtbl : IFaxConfigurationVTbl*
  end

  struct IFaxServer2VTbl
    query_interface : Proc(IFaxServer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxServer2*, UInt32)
    release : Proc(IFaxServer2*, UInt32)
    get_type_info_count : Proc(IFaxServer2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxServer2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxServer2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxServer2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    connect : Proc(IFaxServer2*, UInt8*, HRESULT)
    get_server_name : Proc(IFaxServer2*, UInt8**, HRESULT)
    get_device_providers : Proc(IFaxServer2*, IFaxDeviceProviders*, HRESULT)
    get_devices : Proc(IFaxServer2*, IFaxDevices*, HRESULT)
    get_inbound_routing : Proc(IFaxServer2*, IFaxInboundRouting*, HRESULT)
    get_folders : Proc(IFaxServer2*, IFaxFolders*, HRESULT)
    get_logging_options : Proc(IFaxServer2*, IFaxLoggingOptions*, HRESULT)
    get_major_version : Proc(IFaxServer2*, Int32*, HRESULT)
    get_minor_version : Proc(IFaxServer2*, Int32*, HRESULT)
    get_major_build : Proc(IFaxServer2*, Int32*, HRESULT)
    get_minor_build : Proc(IFaxServer2*, Int32*, HRESULT)
    get_debug : Proc(IFaxServer2*, Int16*, HRESULT)
    get_activity : Proc(IFaxServer2*, IFaxActivity*, HRESULT)
    get_outbound_routing : Proc(IFaxServer2*, IFaxOutboundRouting*, HRESULT)
    get_receipt_options : Proc(IFaxServer2*, IFaxReceiptOptions*, HRESULT)
    get_security : Proc(IFaxServer2*, IFaxSecurity*, HRESULT)
    disconnect : Proc(IFaxServer2*, HRESULT)
    get_extension_property : Proc(IFaxServer2*, UInt8*, VARIANT*, HRESULT)
    set_extension_property : Proc(IFaxServer2*, UInt8*, VARIANT, HRESULT)
    listen_to_server_events : Proc(IFaxServer2*, FAX_SERVER_EVENTS_TYPE_ENUM, HRESULT)
    register_device_provider : Proc(IFaxServer2*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, HRESULT)
    unregister_device_provider : Proc(IFaxServer2*, UInt8*, HRESULT)
    register_inbound_routing_extension : Proc(IFaxServer2*, UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)
    unregister_inbound_routing_extension : Proc(IFaxServer2*, UInt8*, HRESULT)
    get_registered_events : Proc(IFaxServer2*, FAX_SERVER_EVENTS_TYPE_ENUM*, HRESULT)
    get_api_version : Proc(IFaxServer2*, FAX_SERVER_APIVERSION_ENUM*, HRESULT)
    get_configuration : Proc(IFaxServer2*, IFaxConfiguration*, HRESULT)
    get_current_account : Proc(IFaxServer2*, IFaxAccount*, HRESULT)
    get_fax_account_set : Proc(IFaxServer2*, IFaxAccountSet*, HRESULT)
    get_security2 : Proc(IFaxServer2*, IFaxSecurity2*, HRESULT)
  end

  struct IFaxServer2
    lpVtbl : IFaxServer2VTbl*
  end

  struct IFaxAccountSetVTbl
    query_interface : Proc(IFaxAccountSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountSet*, UInt32)
    release : Proc(IFaxAccountSet*, UInt32)
    get_type_info_count : Proc(IFaxAccountSet*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountSet*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountSet*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountSet*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_accounts : Proc(IFaxAccountSet*, IFaxAccounts*, HRESULT)
    get_account : Proc(IFaxAccountSet*, UInt8*, IFaxAccount*, HRESULT)
    add_account : Proc(IFaxAccountSet*, UInt8*, IFaxAccount*, HRESULT)
    remove_account : Proc(IFaxAccountSet*, UInt8*, HRESULT)
  end

  struct IFaxAccountSet
    lpVtbl : IFaxAccountSetVTbl*
  end

  struct IFaxAccountsVTbl
    query_interface : Proc(IFaxAccounts*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccounts*, UInt32)
    release : Proc(IFaxAccounts*, UInt32)
    get_type_info_count : Proc(IFaxAccounts*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccounts*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccounts*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccounts*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFaxAccounts*, IUnknown*, HRESULT)
    get_item : Proc(IFaxAccounts*, VARIANT, IFaxAccount*, HRESULT)
    get_count : Proc(IFaxAccounts*, Int32*, HRESULT)
  end

  struct IFaxAccounts
    lpVtbl : IFaxAccountsVTbl*
  end

  struct IFaxAccountVTbl
    query_interface : Proc(IFaxAccount*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccount*, UInt32)
    release : Proc(IFaxAccount*, UInt32)
    get_type_info_count : Proc(IFaxAccount*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccount*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccount*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccount*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_account_name : Proc(IFaxAccount*, UInt8**, HRESULT)
    get_folders : Proc(IFaxAccount*, IFaxAccountFolders*, HRESULT)
    listen_to_account_events : Proc(IFaxAccount*, FAX_ACCOUNT_EVENTS_TYPE_ENUM, HRESULT)
    get_registered_events : Proc(IFaxAccount*, FAX_ACCOUNT_EVENTS_TYPE_ENUM*, HRESULT)
  end

  struct IFaxAccount
    lpVtbl : IFaxAccountVTbl*
  end

  struct IFaxOutgoingJob2VTbl
    query_interface : Proc(IFaxOutgoingJob2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingJob2*, UInt32)
    release : Proc(IFaxOutgoingJob2*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingJob2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingJob2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingJob2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingJob2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_subject : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_document_name : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_pages : Proc(IFaxOutgoingJob2*, Int32*, HRESULT)
    get_size : Proc(IFaxOutgoingJob2*, Int32*, HRESULT)
    get_submission_id : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_id : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_original_scheduled_time : Proc(IFaxOutgoingJob2*, Float64*, HRESULT)
    get_submission_time : Proc(IFaxOutgoingJob2*, Float64*, HRESULT)
    get_receipt_type : Proc(IFaxOutgoingJob2*, FAX_RECEIPT_TYPE_ENUM*, HRESULT)
    get_priority : Proc(IFaxOutgoingJob2*, FAX_PRIORITY_TYPE_ENUM*, HRESULT)
    get_sender : Proc(IFaxOutgoingJob2*, IFaxSender*, HRESULT)
    get_recipient : Proc(IFaxOutgoingJob2*, IFaxRecipient*, HRESULT)
    get_current_page : Proc(IFaxOutgoingJob2*, Int32*, HRESULT)
    get_device_id : Proc(IFaxOutgoingJob2*, Int32*, HRESULT)
    get_status : Proc(IFaxOutgoingJob2*, FAX_JOB_STATUS_ENUM*, HRESULT)
    get_extended_status_code : Proc(IFaxOutgoingJob2*, FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)
    get_extended_status : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_available_operations : Proc(IFaxOutgoingJob2*, FAX_JOB_OPERATIONS_ENUM*, HRESULT)
    get_retries : Proc(IFaxOutgoingJob2*, Int32*, HRESULT)
    get_scheduled_time : Proc(IFaxOutgoingJob2*, Float64*, HRESULT)
    get_transmission_start : Proc(IFaxOutgoingJob2*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxOutgoingJob2*, Float64*, HRESULT)
    get_csid : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_group_broadcast_receipts : Proc(IFaxOutgoingJob2*, Int16*, HRESULT)
    pause : Proc(IFaxOutgoingJob2*, HRESULT)
    resume : Proc(IFaxOutgoingJob2*, HRESULT)
    restart : Proc(IFaxOutgoingJob2*, HRESULT)
    copy_tiff : Proc(IFaxOutgoingJob2*, UInt8*, HRESULT)
    refresh : Proc(IFaxOutgoingJob2*, HRESULT)
    cancel : Proc(IFaxOutgoingJob2*, HRESULT)
    get_has_cover_page : Proc(IFaxOutgoingJob2*, Int16*, HRESULT)
    get_receipt_address : Proc(IFaxOutgoingJob2*, UInt8**, HRESULT)
    get_schedule_type : Proc(IFaxOutgoingJob2*, FAX_SCHEDULE_TYPE_ENUM*, HRESULT)
  end

  struct IFaxOutgoingJob2
    lpVtbl : IFaxOutgoingJob2VTbl*
  end

  struct IFaxAccountFoldersVTbl
    query_interface : Proc(IFaxAccountFolders*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountFolders*, UInt32)
    release : Proc(IFaxAccountFolders*, UInt32)
    get_type_info_count : Proc(IFaxAccountFolders*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountFolders*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountFolders*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountFolders*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_outgoing_queue : Proc(IFaxAccountFolders*, IFaxAccountOutgoingQueue*, HRESULT)
    get_incoming_queue : Proc(IFaxAccountFolders*, IFaxAccountIncomingQueue*, HRESULT)
    get_incoming_archive : Proc(IFaxAccountFolders*, IFaxAccountIncomingArchive*, HRESULT)
    get_outgoing_archive : Proc(IFaxAccountFolders*, IFaxAccountOutgoingArchive*, HRESULT)
  end

  struct IFaxAccountFolders
    lpVtbl : IFaxAccountFoldersVTbl*
  end

  struct IFaxAccountIncomingQueueVTbl
    query_interface : Proc(IFaxAccountIncomingQueue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountIncomingQueue*, UInt32)
    release : Proc(IFaxAccountIncomingQueue*, UInt32)
    get_type_info_count : Proc(IFaxAccountIncomingQueue*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountIncomingQueue*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountIncomingQueue*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountIncomingQueue*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_jobs : Proc(IFaxAccountIncomingQueue*, IFaxIncomingJobs*, HRESULT)
    get_job : Proc(IFaxAccountIncomingQueue*, UInt8*, IFaxIncomingJob*, HRESULT)
  end

  struct IFaxAccountIncomingQueue
    lpVtbl : IFaxAccountIncomingQueueVTbl*
  end

  struct IFaxAccountOutgoingQueueVTbl
    query_interface : Proc(IFaxAccountOutgoingQueue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountOutgoingQueue*, UInt32)
    release : Proc(IFaxAccountOutgoingQueue*, UInt32)
    get_type_info_count : Proc(IFaxAccountOutgoingQueue*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountOutgoingQueue*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountOutgoingQueue*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountOutgoingQueue*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_jobs : Proc(IFaxAccountOutgoingQueue*, IFaxOutgoingJobs*, HRESULT)
    get_job : Proc(IFaxAccountOutgoingQueue*, UInt8*, IFaxOutgoingJob*, HRESULT)
  end

  struct IFaxAccountOutgoingQueue
    lpVtbl : IFaxAccountOutgoingQueueVTbl*
  end

  struct IFaxOutgoingMessage2VTbl
    query_interface : Proc(IFaxOutgoingMessage2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxOutgoingMessage2*, UInt32)
    release : Proc(IFaxOutgoingMessage2*, UInt32)
    get_type_info_count : Proc(IFaxOutgoingMessage2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxOutgoingMessage2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxOutgoingMessage2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxOutgoingMessage2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_submission_id : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    get_id : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    get_subject : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    get_document_name : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    get_retries : Proc(IFaxOutgoingMessage2*, Int32*, HRESULT)
    get_pages : Proc(IFaxOutgoingMessage2*, Int32*, HRESULT)
    get_size : Proc(IFaxOutgoingMessage2*, Int32*, HRESULT)
    get_original_scheduled_time : Proc(IFaxOutgoingMessage2*, Float64*, HRESULT)
    get_submission_time : Proc(IFaxOutgoingMessage2*, Float64*, HRESULT)
    get_priority : Proc(IFaxOutgoingMessage2*, FAX_PRIORITY_TYPE_ENUM*, HRESULT)
    get_sender : Proc(IFaxOutgoingMessage2*, IFaxSender*, HRESULT)
    get_recipient : Proc(IFaxOutgoingMessage2*, IFaxRecipient*, HRESULT)
    get_device_name : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    get_transmission_start : Proc(IFaxOutgoingMessage2*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxOutgoingMessage2*, Float64*, HRESULT)
    get_csid : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    copy_tiff : Proc(IFaxOutgoingMessage2*, UInt8*, HRESULT)
    delete : Proc(IFaxOutgoingMessage2*, HRESULT)
    get_has_cover_page : Proc(IFaxOutgoingMessage2*, Int16*, HRESULT)
    get_receipt_type : Proc(IFaxOutgoingMessage2*, FAX_RECEIPT_TYPE_ENUM*, HRESULT)
    get_receipt_address : Proc(IFaxOutgoingMessage2*, UInt8**, HRESULT)
    get_read : Proc(IFaxOutgoingMessage2*, Int16*, HRESULT)
    put_read : Proc(IFaxOutgoingMessage2*, Int16, HRESULT)
    save : Proc(IFaxOutgoingMessage2*, HRESULT)
    refresh : Proc(IFaxOutgoingMessage2*, HRESULT)
  end

  struct IFaxOutgoingMessage2
    lpVtbl : IFaxOutgoingMessage2VTbl*
  end

  struct IFaxAccountIncomingArchiveVTbl
    query_interface : Proc(IFaxAccountIncomingArchive*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountIncomingArchive*, UInt32)
    release : Proc(IFaxAccountIncomingArchive*, UInt32)
    get_type_info_count : Proc(IFaxAccountIncomingArchive*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountIncomingArchive*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountIncomingArchive*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountIncomingArchive*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_size_low : Proc(IFaxAccountIncomingArchive*, Int32*, HRESULT)
    get_size_high : Proc(IFaxAccountIncomingArchive*, Int32*, HRESULT)
    refresh : Proc(IFaxAccountIncomingArchive*, HRESULT)
    get_messages : Proc(IFaxAccountIncomingArchive*, Int32, IFaxIncomingMessageIterator*, HRESULT)
    get_message : Proc(IFaxAccountIncomingArchive*, UInt8*, IFaxIncomingMessage*, HRESULT)
  end

  struct IFaxAccountIncomingArchive
    lpVtbl : IFaxAccountIncomingArchiveVTbl*
  end

  struct IFaxAccountOutgoingArchiveVTbl
    query_interface : Proc(IFaxAccountOutgoingArchive*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountOutgoingArchive*, UInt32)
    release : Proc(IFaxAccountOutgoingArchive*, UInt32)
    get_type_info_count : Proc(IFaxAccountOutgoingArchive*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountOutgoingArchive*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountOutgoingArchive*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountOutgoingArchive*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_size_low : Proc(IFaxAccountOutgoingArchive*, Int32*, HRESULT)
    get_size_high : Proc(IFaxAccountOutgoingArchive*, Int32*, HRESULT)
    refresh : Proc(IFaxAccountOutgoingArchive*, HRESULT)
    get_messages : Proc(IFaxAccountOutgoingArchive*, Int32, IFaxOutgoingMessageIterator*, HRESULT)
    get_message : Proc(IFaxAccountOutgoingArchive*, UInt8*, IFaxOutgoingMessage*, HRESULT)
  end

  struct IFaxAccountOutgoingArchive
    lpVtbl : IFaxAccountOutgoingArchiveVTbl*
  end

  struct IFaxSecurity2VTbl
    query_interface : Proc(IFaxSecurity2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxSecurity2*, UInt32)
    release : Proc(IFaxSecurity2*, UInt32)
    get_type_info_count : Proc(IFaxSecurity2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxSecurity2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxSecurity2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxSecurity2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_descriptor : Proc(IFaxSecurity2*, VARIANT*, HRESULT)
    put_descriptor : Proc(IFaxSecurity2*, VARIANT, HRESULT)
    get_granted_rights : Proc(IFaxSecurity2*, FAX_ACCESS_RIGHTS_ENUM_2*, HRESULT)
    refresh : Proc(IFaxSecurity2*, HRESULT)
    save : Proc(IFaxSecurity2*, HRESULT)
    get_information_type : Proc(IFaxSecurity2*, Int32*, HRESULT)
    put_information_type : Proc(IFaxSecurity2*, Int32, HRESULT)
  end

  struct IFaxSecurity2
    lpVtbl : IFaxSecurity2VTbl*
  end

  struct IFaxIncomingMessage2VTbl
    query_interface : Proc(IFaxIncomingMessage2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxIncomingMessage2*, UInt32)
    release : Proc(IFaxIncomingMessage2*, UInt32)
    get_type_info_count : Proc(IFaxIncomingMessage2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxIncomingMessage2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxIncomingMessage2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxIncomingMessage2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    get_pages : Proc(IFaxIncomingMessage2*, Int32*, HRESULT)
    get_size : Proc(IFaxIncomingMessage2*, Int32*, HRESULT)
    get_device_name : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    get_retries : Proc(IFaxIncomingMessage2*, Int32*, HRESULT)
    get_transmission_start : Proc(IFaxIncomingMessage2*, Float64*, HRESULT)
    get_transmission_end : Proc(IFaxIncomingMessage2*, Float64*, HRESULT)
    get_csid : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    get_tsid : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    get_caller_id : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    get_routing_information : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    copy_tiff : Proc(IFaxIncomingMessage2*, UInt8*, HRESULT)
    delete : Proc(IFaxIncomingMessage2*, HRESULT)
    get_subject : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    put_subject : Proc(IFaxIncomingMessage2*, UInt8*, HRESULT)
    get_sender_name : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    put_sender_name : Proc(IFaxIncomingMessage2*, UInt8*, HRESULT)
    get_sender_fax_number : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    put_sender_fax_number : Proc(IFaxIncomingMessage2*, UInt8*, HRESULT)
    get_has_cover_page : Proc(IFaxIncomingMessage2*, Int16*, HRESULT)
    put_has_cover_page : Proc(IFaxIncomingMessage2*, Int16, HRESULT)
    get_recipients : Proc(IFaxIncomingMessage2*, UInt8**, HRESULT)
    put_recipients : Proc(IFaxIncomingMessage2*, UInt8*, HRESULT)
    get_was_re_assigned : Proc(IFaxIncomingMessage2*, Int16*, HRESULT)
    get_read : Proc(IFaxIncomingMessage2*, Int16*, HRESULT)
    put_read : Proc(IFaxIncomingMessage2*, Int16, HRESULT)
    re_assign : Proc(IFaxIncomingMessage2*, HRESULT)
    save : Proc(IFaxIncomingMessage2*, HRESULT)
    refresh : Proc(IFaxIncomingMessage2*, HRESULT)
  end

  struct IFaxIncomingMessage2
    lpVtbl : IFaxIncomingMessage2VTbl*
  end

  struct IFaxServerNotifyVTbl
    query_interface : Proc(IFaxServerNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxServerNotify*, UInt32)
    release : Proc(IFaxServerNotify*, UInt32)
    get_type_info_count : Proc(IFaxServerNotify*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxServerNotify*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxServerNotify*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxServerNotify*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IFaxServerNotify
    lpVtbl : IFaxServerNotifyVTbl*
  end

  struct IFaxServerNotify2VTbl
    query_interface : Proc(IFaxServerNotify2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxServerNotify2*, UInt32)
    release : Proc(IFaxServerNotify2*, UInt32)
    get_type_info_count : Proc(IFaxServerNotify2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxServerNotify2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxServerNotify2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxServerNotify2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_incoming_job_added : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_incoming_job_removed : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_incoming_job_changed : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, IFaxJobStatus, HRESULT)
    on_outgoing_job_added : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_job_removed : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_job_changed : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, IFaxJobStatus, HRESULT)
    on_incoming_message_added : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_incoming_message_removed : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_message_added : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_message_removed : Proc(IFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_receipt_options_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_activity_logging_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_security_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_event_logging_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outgoing_queue_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outgoing_archive_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_incoming_archive_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_devices_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outbound_routing_groups_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outbound_routing_rules_config_change : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_server_activity_change : Proc(IFaxServerNotify2*, IFaxServer2, Int32, Int32, Int32, Int32, HRESULT)
    on_queues_status_change : Proc(IFaxServerNotify2*, IFaxServer2, Int16, Int16, Int16, HRESULT)
    on_new_call : Proc(IFaxServerNotify2*, IFaxServer2, Int32, Int32, UInt8*, HRESULT)
    on_server_shut_down : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
    on_device_status_change : Proc(IFaxServerNotify2*, IFaxServer2, Int32, Int16, Int16, Int16, Int16, HRESULT)
    on_general_server_config_changed : Proc(IFaxServerNotify2*, IFaxServer2, HRESULT)
  end

  struct IFaxServerNotify2
    lpVtbl : IFaxServerNotify2VTbl*
  end

  struct IFaxServerNotify2VTbl
    query_interface : Proc(IFaxServerNotify2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxServerNotify2*, UInt32)
    release : Proc(IFaxServerNotify2*, UInt32)
    get_type_info_count : Proc(IFaxServerNotify2*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxServerNotify2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxServerNotify2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxServerNotify2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IFaxServerNotify2
    lpVtbl : IFaxServerNotify2VTbl*
  end

  struct IFaxAccountNotifyVTbl
    query_interface : Proc(IFaxAccountNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountNotify*, UInt32)
    release : Proc(IFaxAccountNotify*, UInt32)
    get_type_info_count : Proc(IFaxAccountNotify*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountNotify*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountNotify*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountNotify*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_incoming_job_added : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_incoming_job_removed : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_incoming_job_changed : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, IFaxJobStatus, HRESULT)
    on_outgoing_job_added : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_outgoing_job_removed : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_outgoing_job_changed : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, IFaxJobStatus, HRESULT)
    on_incoming_message_added : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, Int16, HRESULT)
    on_incoming_message_removed : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, Int16, HRESULT)
    on_outgoing_message_added : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_outgoing_message_removed : Proc(IFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_server_shut_down : Proc(IFaxAccountNotify*, IFaxServer2, HRESULT)
  end

  struct IFaxAccountNotify
    lpVtbl : IFaxAccountNotifyVTbl*
  end

  struct IFaxAccountNotifyVTbl
    query_interface : Proc(IFaxAccountNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFaxAccountNotify*, UInt32)
    release : Proc(IFaxAccountNotify*, UInt32)
    get_type_info_count : Proc(IFaxAccountNotify*, UInt32*, HRESULT)
    get_type_info : Proc(IFaxAccountNotify*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFaxAccountNotify*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFaxAccountNotify*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IFaxAccountNotify
    lpVtbl : IFaxAccountNotifyVTbl*
  end

  struct IStillImageWVTbl
    query_interface : Proc(IStillImageW*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStillImageW*, UInt32)
    release : Proc(IStillImageW*, UInt32)
    initialize : Proc(IStillImageW*, HINSTANCE, UInt32, HRESULT)
    get_device_list : Proc(IStillImageW*, UInt32, UInt32, UInt32*, Void**, HRESULT)
    get_device_info : Proc(IStillImageW*, LibC::LPWSTR, Void**, HRESULT)
    create_device : Proc(IStillImageW*, LibC::LPWSTR, UInt32, IStiDevice*, IUnknown, HRESULT)
    get_device_value : Proc(IStillImageW*, LibC::LPWSTR, LibC::LPWSTR, UInt32*, UInt8*, UInt32*, HRESULT)
    set_device_value : Proc(IStillImageW*, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt8*, UInt32, HRESULT)
    get_sti_launch_information : Proc(IStillImageW*, Char*, UInt32*, Char*, HRESULT)
    register_launch_application : Proc(IStillImageW*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    unregister_launch_application : Proc(IStillImageW*, LibC::LPWSTR, HRESULT)
    enable_hw_notifications : Proc(IStillImageW*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_hw_notification_state : Proc(IStillImageW*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    refresh_device_bus : Proc(IStillImageW*, LibC::LPWSTR, HRESULT)
    launch_application_for_device : Proc(IStillImageW*, LibC::LPWSTR, LibC::LPWSTR, STINOTIFY*, HRESULT)
    setup_device_parameters : Proc(IStillImageW*, STI_DEVICE_INFORMATIONW*, HRESULT)
    write_to_error_log : Proc(IStillImageW*, UInt32, LibC::LPWSTR, HRESULT)
  end

  struct IStillImageW
    lpVtbl : IStillImageWVTbl*
  end

  struct IStiDeviceVTbl
    query_interface : Proc(IStiDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStiDevice*, UInt32)
    release : Proc(IStiDevice*, UInt32)
    initialize : Proc(IStiDevice*, HINSTANCE, LibC::LPWSTR, UInt32, UInt32, HRESULT)
    get_capabilities : Proc(IStiDevice*, STI_DEV_CAPS*, HRESULT)
    get_status : Proc(IStiDevice*, STI_DEVICE_STATUS*, HRESULT)
    device_reset : Proc(IStiDevice*, HRESULT)
    diagnostic : Proc(IStiDevice*, STI_DIAG*, HRESULT)
    escape : Proc(IStiDevice*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)
    get_last_error : Proc(IStiDevice*, UInt32*, HRESULT)
    lock_device : Proc(IStiDevice*, UInt32, HRESULT)
    un_lock_device : Proc(IStiDevice*, HRESULT)
    raw_read_data : Proc(IStiDevice*, Void*, UInt32*, OVERLAPPED*, HRESULT)
    raw_write_data : Proc(IStiDevice*, Void*, UInt32, OVERLAPPED*, HRESULT)
    raw_read_command : Proc(IStiDevice*, Void*, UInt32*, OVERLAPPED*, HRESULT)
    raw_write_command : Proc(IStiDevice*, Void*, UInt32, OVERLAPPED*, HRESULT)
    subscribe : Proc(IStiDevice*, STISUBSCRIBE*, HRESULT)
    get_last_notification_data : Proc(IStiDevice*, STINOTIFY*, HRESULT)
    un_subscribe : Proc(IStiDevice*, HRESULT)
    get_last_error_info : Proc(IStiDevice*, ERROR_INFOW*, HRESULT)
  end

  struct IStiDevice
    lpVtbl : IStiDeviceVTbl*
  end

  struct IStiDeviceControlVTbl
    query_interface : Proc(IStiDeviceControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStiDeviceControl*, UInt32)
    release : Proc(IStiDeviceControl*, UInt32)
    initialize : Proc(IStiDeviceControl*, UInt32, UInt32, LibC::LPWSTR, UInt32, HRESULT)
    raw_read_data : Proc(IStiDeviceControl*, Void*, UInt32*, OVERLAPPED*, HRESULT)
    raw_write_data : Proc(IStiDeviceControl*, Void*, UInt32, OVERLAPPED*, HRESULT)
    raw_read_command : Proc(IStiDeviceControl*, Void*, UInt32*, OVERLAPPED*, HRESULT)
    raw_write_command : Proc(IStiDeviceControl*, Void*, UInt32, OVERLAPPED*, HRESULT)
    raw_device_control : Proc(IStiDeviceControl*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)
    get_last_error : Proc(IStiDeviceControl*, UInt32*, HRESULT)
    get_my_device_port_name : Proc(IStiDeviceControl*, Char*, UInt32, HRESULT)
    get_my_device_handle : Proc(IStiDeviceControl*, LibC::HANDLE*, HRESULT)
    get_my_device_open_mode : Proc(IStiDeviceControl*, UInt32*, HRESULT)
    write_to_error_log : Proc(IStiDeviceControl*, UInt32, LibC::LPWSTR, UInt32, HRESULT)
  end

  struct IStiDeviceControl
    lpVtbl : IStiDeviceControlVTbl*
  end

  struct IStiUSDVTbl
    query_interface : Proc(IStiUSD*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStiUSD*, UInt32)
    release : Proc(IStiUSD*, UInt32)
    initialize : Proc(IStiUSD*, IStiDeviceControl, UInt32, HKEY, HRESULT)
    get_capabilities : Proc(IStiUSD*, STI_USD_CAPS*, HRESULT)
    get_status : Proc(IStiUSD*, STI_DEVICE_STATUS*, HRESULT)
    device_reset : Proc(IStiUSD*, HRESULT)
    diagnostic : Proc(IStiUSD*, STI_DIAG*, HRESULT)
    escape : Proc(IStiUSD*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)
    get_last_error : Proc(IStiUSD*, UInt32*, HRESULT)
    lock_device : Proc(IStiUSD*, HRESULT)
    un_lock_device : Proc(IStiUSD*, HRESULT)
    raw_read_data : Proc(IStiUSD*, Void*, UInt32*, OVERLAPPED*, HRESULT)
    raw_write_data : Proc(IStiUSD*, Void*, UInt32, OVERLAPPED*, HRESULT)
    raw_read_command : Proc(IStiUSD*, Void*, UInt32*, OVERLAPPED*, HRESULT)
    raw_write_command : Proc(IStiUSD*, Void*, UInt32, OVERLAPPED*, HRESULT)
    set_notification_handle : Proc(IStiUSD*, LibC::HANDLE, HRESULT)
    get_notification_data : Proc(IStiUSD*, STINOTIFY*, HRESULT)
    get_last_error_info : Proc(IStiUSD*, ERROR_INFOW*, HRESULT)
  end

  struct IStiUSD
    lpVtbl : IStiUSDVTbl*
  end


  # Params # machinename : PSTR [In],faxhandle : LibC::HANDLE* [In]
  fun FaxConnectFaxServerA(machinename : PSTR, faxhandle : LibC::HANDLE*) : LibC::BOOL

  # Params # machinename : LibC::LPWSTR [In],faxhandle : LibC::HANDLE* [In]
  fun FaxConnectFaxServerW(machinename : LibC::LPWSTR, faxhandle : LibC::HANDLE*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In]
  fun FaxClose(faxhandle : LibC::HANDLE) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],deviceid : UInt32 [In],flags : UInt32 [In],faxporthandle : LibC::HANDLE* [In]
  fun FaxOpenPort(faxhandle : LibC::HANDLE, deviceid : UInt32, flags : UInt32, faxporthandle : LibC::HANDLE*) : LibC::BOOL

  # Params # jobparams : FAX_JOB_PARAMA** [In],coverpageinfo : FAX_COVERPAGE_INFOA** [In]
  fun FaxCompleteJobParamsA(jobparams : FAX_JOB_PARAMA**, coverpageinfo : FAX_COVERPAGE_INFOA**) : LibC::BOOL

  # Params # jobparams : FAX_JOB_PARAMW** [In],coverpageinfo : FAX_COVERPAGE_INFOW** [In]
  fun FaxCompleteJobParamsW(jobparams : FAX_JOB_PARAMW**, coverpageinfo : FAX_COVERPAGE_INFOW**) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],filename : PSTR [In],jobparams : FAX_JOB_PARAMA* [In],coverpageinfo : FAX_COVERPAGE_INFOA* [In],faxjobid : UInt32* [In]
  fun FaxSendDocumentA(faxhandle : LibC::HANDLE, filename : PSTR, jobparams : FAX_JOB_PARAMA*, coverpageinfo : FAX_COVERPAGE_INFOA*, faxjobid : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],filename : LibC::LPWSTR [In],jobparams : FAX_JOB_PARAMW* [In],coverpageinfo : FAX_COVERPAGE_INFOW* [In],faxjobid : UInt32* [In]
  fun FaxSendDocumentW(faxhandle : LibC::HANDLE, filename : LibC::LPWSTR, jobparams : FAX_JOB_PARAMW*, coverpageinfo : FAX_COVERPAGE_INFOW*, faxjobid : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],filename : PSTR [In],faxjobid : UInt32* [In],faxrecipientcallback : PFAX_RECIPIENT_CALLBACKA [In],context : Void* [In]
  fun FaxSendDocumentForBroadcastA(faxhandle : LibC::HANDLE, filename : PSTR, faxjobid : UInt32*, faxrecipientcallback : PFAX_RECIPIENT_CALLBACKA, context : Void*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],filename : LibC::LPWSTR [In],faxjobid : UInt32* [In],faxrecipientcallback : PFAX_RECIPIENT_CALLBACKW [In],context : Void* [In]
  fun FaxSendDocumentForBroadcastW(faxhandle : LibC::HANDLE, filename : LibC::LPWSTR, faxjobid : UInt32*, faxrecipientcallback : PFAX_RECIPIENT_CALLBACKW, context : Void*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobentry : FAX_JOB_ENTRYA** [In],jobsreturned : UInt32* [In]
  fun FaxEnumJobsA(faxhandle : LibC::HANDLE, jobentry : FAX_JOB_ENTRYA**, jobsreturned : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobentry : FAX_JOB_ENTRYW** [In],jobsreturned : UInt32* [In]
  fun FaxEnumJobsW(faxhandle : LibC::HANDLE, jobentry : FAX_JOB_ENTRYW**, jobsreturned : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobid : UInt32 [In],jobentry : FAX_JOB_ENTRYA** [In]
  fun FaxGetJobA(faxhandle : LibC::HANDLE, jobid : UInt32, jobentry : FAX_JOB_ENTRYA**) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobid : UInt32 [In],jobentry : FAX_JOB_ENTRYW** [In]
  fun FaxGetJobW(faxhandle : LibC::HANDLE, jobid : UInt32, jobentry : FAX_JOB_ENTRYW**) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobid : UInt32 [In],command : UInt32 [In],jobentry : FAX_JOB_ENTRYA* [In]
  fun FaxSetJobA(faxhandle : LibC::HANDLE, jobid : UInt32, command : UInt32, jobentry : FAX_JOB_ENTRYA*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobid : UInt32 [In],command : UInt32 [In],jobentry : FAX_JOB_ENTRYW* [In]
  fun FaxSetJobW(faxhandle : LibC::HANDLE, jobid : UInt32, command : UInt32, jobentry : FAX_JOB_ENTRYW*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobid : UInt32 [In],buffer : UInt8** [In],buffersize : UInt32* [In],imagewidth : UInt32* [In],imageheight : UInt32* [In]
  fun FaxGetPageData(faxhandle : LibC::HANDLE, jobid : UInt32, buffer : UInt8**, buffersize : UInt32*, imagewidth : UInt32*, imageheight : UInt32*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],devicestatus : FAX_DEVICE_STATUSA** [In]
  fun FaxGetDeviceStatusA(faxporthandle : LibC::HANDLE, devicestatus : FAX_DEVICE_STATUSA**) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],devicestatus : FAX_DEVICE_STATUSW** [In]
  fun FaxGetDeviceStatusW(faxporthandle : LibC::HANDLE, devicestatus : FAX_DEVICE_STATUSW**) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],jobid : UInt32 [In]
  fun FaxAbort(faxhandle : LibC::HANDLE, jobid : UInt32) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],faxconfig : FAX_CONFIGURATIONA** [In]
  fun FaxGetConfigurationA(faxhandle : LibC::HANDLE, faxconfig : FAX_CONFIGURATIONA**) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],faxconfig : FAX_CONFIGURATIONW** [In]
  fun FaxGetConfigurationW(faxhandle : LibC::HANDLE, faxconfig : FAX_CONFIGURATIONW**) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],faxconfig : FAX_CONFIGURATIONA* [In]
  fun FaxSetConfigurationA(faxhandle : LibC::HANDLE, faxconfig : FAX_CONFIGURATIONA*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],faxconfig : FAX_CONFIGURATIONW* [In]
  fun FaxSetConfigurationW(faxhandle : LibC::HANDLE, faxconfig : FAX_CONFIGURATIONW*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],categories : FAX_LOG_CATEGORYA** [In],numbercategories : UInt32* [In]
  fun FaxGetLoggingCategoriesA(faxhandle : LibC::HANDLE, categories : FAX_LOG_CATEGORYA**, numbercategories : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],categories : FAX_LOG_CATEGORYW** [In],numbercategories : UInt32* [In]
  fun FaxGetLoggingCategoriesW(faxhandle : LibC::HANDLE, categories : FAX_LOG_CATEGORYW**, numbercategories : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],categories : FAX_LOG_CATEGORYA* [In],numbercategories : UInt32 [In]
  fun FaxSetLoggingCategoriesA(faxhandle : LibC::HANDLE, categories : FAX_LOG_CATEGORYA*, numbercategories : UInt32) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],categories : FAX_LOG_CATEGORYW* [In],numbercategories : UInt32 [In]
  fun FaxSetLoggingCategoriesW(faxhandle : LibC::HANDLE, categories : FAX_LOG_CATEGORYW*, numbercategories : UInt32) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],portinfo : FAX_PORT_INFOA** [In],portsreturned : UInt32* [In]
  fun FaxEnumPortsA(faxhandle : LibC::HANDLE, portinfo : FAX_PORT_INFOA**, portsreturned : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],portinfo : FAX_PORT_INFOW** [In],portsreturned : UInt32* [In]
  fun FaxEnumPortsW(faxhandle : LibC::HANDLE, portinfo : FAX_PORT_INFOW**, portsreturned : UInt32*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],portinfo : FAX_PORT_INFOA** [In]
  fun FaxGetPortA(faxporthandle : LibC::HANDLE, portinfo : FAX_PORT_INFOA**) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],portinfo : FAX_PORT_INFOW** [In]
  fun FaxGetPortW(faxporthandle : LibC::HANDLE, portinfo : FAX_PORT_INFOW**) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],portinfo : FAX_PORT_INFOA* [In]
  fun FaxSetPortA(faxporthandle : LibC::HANDLE, portinfo : FAX_PORT_INFOA*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],portinfo : FAX_PORT_INFOW* [In]
  fun FaxSetPortW(faxporthandle : LibC::HANDLE, portinfo : FAX_PORT_INFOW*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingmethod : FAX_ROUTING_METHODA** [In],methodsreturned : UInt32* [In]
  fun FaxEnumRoutingMethodsA(faxporthandle : LibC::HANDLE, routingmethod : FAX_ROUTING_METHODA**, methodsreturned : UInt32*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingmethod : FAX_ROUTING_METHODW** [In],methodsreturned : UInt32* [In]
  fun FaxEnumRoutingMethodsW(faxporthandle : LibC::HANDLE, routingmethod : FAX_ROUTING_METHODW**, methodsreturned : UInt32*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingguid : PSTR [In],enabled : LibC::BOOL [In]
  fun FaxEnableRoutingMethodA(faxporthandle : LibC::HANDLE, routingguid : PSTR, enabled : LibC::BOOL) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingguid : LibC::LPWSTR [In],enabled : LibC::BOOL [In]
  fun FaxEnableRoutingMethodW(faxporthandle : LibC::HANDLE, routingguid : LibC::LPWSTR, enabled : LibC::BOOL) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],routinginfo : FAX_GLOBAL_ROUTING_INFOA** [In],methodsreturned : UInt32* [In]
  fun FaxEnumGlobalRoutingInfoA(faxhandle : LibC::HANDLE, routinginfo : FAX_GLOBAL_ROUTING_INFOA**, methodsreturned : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],routinginfo : FAX_GLOBAL_ROUTING_INFOW** [In],methodsreturned : UInt32* [In]
  fun FaxEnumGlobalRoutingInfoW(faxhandle : LibC::HANDLE, routinginfo : FAX_GLOBAL_ROUTING_INFOW**, methodsreturned : UInt32*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],routinginfo : FAX_GLOBAL_ROUTING_INFOA* [In]
  fun FaxSetGlobalRoutingInfoA(faxhandle : LibC::HANDLE, routinginfo : FAX_GLOBAL_ROUTING_INFOA*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],routinginfo : FAX_GLOBAL_ROUTING_INFOW* [In]
  fun FaxSetGlobalRoutingInfoW(faxhandle : LibC::HANDLE, routinginfo : FAX_GLOBAL_ROUTING_INFOW*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingguid : PSTR [In],routinginfobuffer : UInt8** [In],routinginfobuffersize : UInt32* [In]
  fun FaxGetRoutingInfoA(faxporthandle : LibC::HANDLE, routingguid : PSTR, routinginfobuffer : UInt8**, routinginfobuffersize : UInt32*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingguid : LibC::LPWSTR [In],routinginfobuffer : UInt8** [In],routinginfobuffersize : UInt32* [In]
  fun FaxGetRoutingInfoW(faxporthandle : LibC::HANDLE, routingguid : LibC::LPWSTR, routinginfobuffer : UInt8**, routinginfobuffersize : UInt32*) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingguid : PSTR [In],routinginfobuffer : UInt8* [In],routinginfobuffersize : UInt32 [In]
  fun FaxSetRoutingInfoA(faxporthandle : LibC::HANDLE, routingguid : PSTR, routinginfobuffer : UInt8*, routinginfobuffersize : UInt32) : LibC::BOOL

  # Params # faxporthandle : LibC::HANDLE [In],routingguid : LibC::LPWSTR [In],routinginfobuffer : UInt8* [In],routinginfobuffersize : UInt32 [In]
  fun FaxSetRoutingInfoW(faxporthandle : LibC::HANDLE, routingguid : LibC::LPWSTR, routinginfobuffer : UInt8*, routinginfobuffersize : UInt32) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],completionport : LibC::HANDLE [In],completionkey : LibC::UINT_PTR [In],hwnd : LibC::HANDLE [In],messagestart : UInt32 [In]
  fun FaxInitializeEventQueue(faxhandle : LibC::HANDLE, completionport : LibC::HANDLE, completionkey : LibC::UINT_PTR, hwnd : LibC::HANDLE, messagestart : UInt32) : LibC::BOOL

  # Params # buffer : Void* [In]
  fun FaxFreeBuffer(buffer : Void*)

  # Params # printername : PSTR [In],printinfo : FAX_PRINT_INFOA* [In],faxjobid : UInt32* [In],faxcontextinfo : FAX_CONTEXT_INFOA* [In]
  fun FaxStartPrintJobA(printername : PSTR, printinfo : FAX_PRINT_INFOA*, faxjobid : UInt32*, faxcontextinfo : FAX_CONTEXT_INFOA*) : LibC::BOOL

  # Params # printername : LibC::LPWSTR [In],printinfo : FAX_PRINT_INFOW* [In],faxjobid : UInt32* [In],faxcontextinfo : FAX_CONTEXT_INFOW* [In]
  fun FaxStartPrintJobW(printername : LibC::LPWSTR, printinfo : FAX_PRINT_INFOW*, faxjobid : UInt32*, faxcontextinfo : FAX_CONTEXT_INFOW*) : LibC::BOOL

  # Params # faxcontextinfo : FAX_CONTEXT_INFOA* [In],coverpageinfo : FAX_COVERPAGE_INFOA* [In]
  fun FaxPrintCoverPageA(faxcontextinfo : FAX_CONTEXT_INFOA*, coverpageinfo : FAX_COVERPAGE_INFOA*) : LibC::BOOL

  # Params # faxcontextinfo : FAX_CONTEXT_INFOW* [In],coverpageinfo : FAX_COVERPAGE_INFOW* [In]
  fun FaxPrintCoverPageW(faxcontextinfo : FAX_CONTEXT_INFOW*, coverpageinfo : FAX_COVERPAGE_INFOW*) : LibC::BOOL

  # Params # deviceprovider : LibC::LPWSTR [In],friendlyname : LibC::LPWSTR [In],imagename : LibC::LPWSTR [In],tspname : LibC::LPWSTR [In]
  fun FaxRegisterServiceProviderW(deviceprovider : LibC::LPWSTR, friendlyname : LibC::LPWSTR, imagename : LibC::LPWSTR, tspname : LibC::LPWSTR) : LibC::BOOL

  # Params # deviceprovider : LibC::LPWSTR [In]
  fun FaxUnregisterServiceProviderW(deviceprovider : LibC::LPWSTR) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],extensionname : LibC::LPWSTR [In],friendlyname : LibC::LPWSTR [In],imagename : LibC::LPWSTR [In],callback : PFAX_ROUTING_INSTALLATION_CALLBACKW [In],context : Void* [In]
  fun FaxRegisterRoutingExtensionW(faxhandle : LibC::HANDLE, extensionname : LibC::LPWSTR, friendlyname : LibC::LPWSTR, imagename : LibC::LPWSTR, callback : PFAX_ROUTING_INSTALLATION_CALLBACKW, context : Void*) : LibC::BOOL

  # Params # faxhandle : LibC::HANDLE [In],accessmask : UInt32 [In]
  fun FaxAccessCheck(faxhandle : LibC::HANDLE, accessmask : UInt32) : LibC::BOOL

  # Params # 
  fun CanSendToFaxRecipient : LibC::BOOL

  # Params # sndmode : SendToMode [In],lpfilename : LibC::LPWSTR [In]
  fun SendToFaxRecipient(sndmode : SendToMode, lpfilename : LibC::LPWSTR) : UInt32

  # Params # hinst : HINSTANCE [In],dwver : UInt32 [In],ppsti : IStillImageW* [In],punkouter : IUnknown [In]
  fun StiCreateInstanceW(hinst : HINSTANCE, dwver : UInt32, ppsti : IStillImageW*, punkouter : IUnknown) : HRESULT
end
