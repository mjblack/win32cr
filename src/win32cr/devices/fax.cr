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
  CLSID_FaxServer = LibC::GUID.new(0xcda8acb0_u32, 0x8cf5_u16, 0x4f6c_u16, StaticArray[0x9b_u8, 0xa2_u8, 0x59_u8, 0x31_u8, 0xd4_u8, 0xc_u8, 0x8c_u8, 0xae_u8])
  CLSID_FaxDeviceProviders = LibC::GUID.new(0xeb8fe768_u32, 0x875a_u16, 0x4f5f_u16, StaticArray[0x82_u8, 0xc5_u8, 0x3_u8, 0xf2_u8, 0x3a_u8, 0xac_u8, 0x1b_u8, 0xd7_u8])
  CLSID_FaxDevices = LibC::GUID.new(0x5589e28e_u32, 0x23cb_u16, 0x4919_u16, StaticArray[0x88_u8, 0x8_u8, 0xe6_u8, 0x10_u8, 0x18_u8, 0x46_u8, 0xe8_u8, 0xd_u8])
  CLSID_FaxInboundRouting = LibC::GUID.new(0xe80248ed_u32, 0xad65_u16, 0x4218_u16, StaticArray[0x81_u8, 0x8_u8, 0x99_u8, 0x19_u8, 0x24_u8, 0xd4_u8, 0xe7_u8, 0xed_u8])
  CLSID_FaxFolders = LibC::GUID.new(0xc35211d7_u32, 0x5776_u16, 0x48cb_u16, StaticArray[0xaf_u8, 0x44_u8, 0xc3_u8, 0x1b_u8, 0xe3_u8, 0xb2_u8, 0xcf_u8, 0xe5_u8])
  CLSID_FaxLoggingOptions = LibC::GUID.new(0x1bf9eea6_u32, 0xece0_u16, 0x4785_u16, StaticArray[0xa1_u8, 0x8b_u8, 0xde_u8, 0x56_u8, 0xe9_u8, 0xee_u8, 0xf9_u8, 0x6a_u8])
  CLSID_FaxActivity = LibC::GUID.new(0xcfef5d0e_u32, 0xe84d_u16, 0x462e_u16, StaticArray[0xaa_u8, 0xbb_u8, 0x87_u8, 0xd3_u8, 0x1e_u8, 0xb0_u8, 0x4f_u8, 0xef_u8])
  CLSID_FaxOutboundRouting = LibC::GUID.new(0xc81b385e_u32, 0xb869_u16, 0x4afd_u16, StaticArray[0x86_u8, 0xc0_u8, 0x61_u8, 0x64_u8, 0x98_u8, 0xed_u8, 0x9b_u8, 0xe2_u8])
  CLSID_FaxReceiptOptions = LibC::GUID.new(0x6982487b_u32, 0x227b_u16, 0x4c96_u16, StaticArray[0xa6_u8, 0x1c_u8, 0x24_u8, 0x83_u8, 0x48_u8, 0xb0_u8, 0x5a_u8, 0xb6_u8])
  CLSID_FaxSecurity = LibC::GUID.new(0x10c4ddde_u32, 0xabf0_u16, 0x43df_u16, StaticArray[0x96_u8, 0x4f_u8, 0x7f_u8, 0x3a_u8, 0xc2_u8, 0x1a_u8, 0x4c_u8, 0x7b_u8])
  CLSID_FaxDocument = LibC::GUID.new(0xf3f9f91_u32, 0xc838_u16, 0x415e_u16, StaticArray[0xa4_u8, 0xf3_u8, 0x3e_u8, 0x82_u8, 0x8c_u8, 0xa4_u8, 0x45_u8, 0xe0_u8])
  CLSID_FaxSender = LibC::GUID.new(0x265d84d0_u32, 0x1850_u16, 0x4360_u16, StaticArray[0xb7_u8, 0xc8_u8, 0x75_u8, 0x8b_u8, 0xbb_u8, 0x5f_u8, 0xb_u8, 0x96_u8])
  CLSID_FaxRecipients = LibC::GUID.new(0xea9bdf53_u32, 0x10a9_u16, 0x4d4f_u16, StaticArray[0xa0_u8, 0x67_u8, 0x63_u8, 0xc8_u8, 0xf8_u8, 0x4f_u8, 0x1_u8, 0xb0_u8])
  CLSID_FaxIncomingArchive = LibC::GUID.new(0x8426c56a_u32, 0x35a1_u16, 0x4c6f_u16, StaticArray[0xaf_u8, 0x93_u8, 0xfc_u8, 0x95_u8, 0x24_u8, 0x22_u8, 0xe2_u8, 0xc2_u8])
  CLSID_FaxIncomingQueue = LibC::GUID.new(0x69131717_u32, 0xf3f1_u16, 0x40e3_u16, StaticArray[0x80_u8, 0x9d_u8, 0xa6_u8, 0xcb_u8, 0xf7_u8, 0xbd_u8, 0x85_u8, 0xe5_u8])
  CLSID_FaxOutgoingArchive = LibC::GUID.new(0x43c28403_u32, 0xe04f_u16, 0x474d_u16, StaticArray[0x99_u8, 0xc_u8, 0xb9_u8, 0x46_u8, 0x69_u8, 0x14_u8, 0x8f_u8, 0x59_u8])
  CLSID_FaxOutgoingQueue = LibC::GUID.new(0x7421169e_u32, 0x8c43_u16, 0x4b0d_u16, StaticArray[0xbb_u8, 0x16_u8, 0x64_u8, 0x5c_u8, 0x8f_u8, 0xa4_u8, 0x3_u8, 0x57_u8])
  CLSID_FaxIncomingMessageIterator = LibC::GUID.new(0x6088e1d8_u32, 0x3fc8_u16, 0x45c2_u16, StaticArray[0x87_u8, 0xb1_u8, 0x90_u8, 0x9a_u8, 0x29_u8, 0x60_u8, 0x7e_u8, 0xa9_u8])
  CLSID_FaxIncomingMessage = LibC::GUID.new(0x1932fcf7_u32, 0x9d43_u16, 0x4d5a_u16, StaticArray[0x89_u8, 0xff_u8, 0x3_u8, 0x86_u8, 0x1b_u8, 0x32_u8, 0x17_u8, 0x36_u8])
  CLSID_FaxOutgoingJobs = LibC::GUID.new(0x92bf2a6c_u32, 0x37be_u16, 0x43fa_u16, StaticArray[0xa3_u8, 0x7d_u8, 0xcb_u8, 0xe_u8, 0x5f_u8, 0x75_u8, 0x3b_u8, 0x35_u8])
  CLSID_FaxOutgoingJob = LibC::GUID.new(0x71bb429c_u32, 0xef9_u16, 0x4915_u16, StaticArray[0xbe_u8, 0xc5_u8, 0xa5_u8, 0xd8_u8, 0x97_u8, 0xa3_u8, 0xe9_u8, 0x24_u8])
  CLSID_FaxOutgoingMessageIterator = LibC::GUID.new(0x8a3224d0_u32, 0xd30b_u16, 0x49de_u16, StaticArray[0x98_u8, 0x13_u8, 0xcb_u8, 0x38_u8, 0x57_u8, 0x90_u8, 0xfb_u8, 0xbb_u8])
  CLSID_FaxOutgoingMessage = LibC::GUID.new(0x91b4a378_u32, 0x4ad8_u16, 0x4aef_u16, StaticArray[0xa4_u8, 0xdc_u8, 0x97_u8, 0xd9_u8, 0x6e_u8, 0x93_u8, 0x9a_u8, 0x3a_u8])
  CLSID_FaxIncomingJobs = LibC::GUID.new(0xa1bb8a43_u32, 0x8866_u16, 0x4fb7_u16, StaticArray[0xa1_u8, 0x5d_u8, 0x62_u8, 0x66_u8, 0xc8_u8, 0x75_u8, 0xa5_u8, 0xcc_u8])
  CLSID_FaxIncomingJob = LibC::GUID.new(0xc47311ec_u32, 0xae32_u16, 0x41b8_u16, StaticArray[0xae_u8, 0x4b_u8, 0x3e_u8, 0xae_u8, 0x6_u8, 0x29_u8, 0xd0_u8, 0xc9_u8])
  CLSID_FaxDeviceProvider = LibC::GUID.new(0x17cf1aa3_u32, 0xf5eb_u16, 0x484a_u16, StaticArray[0x9c_u8, 0x9a_u8, 0x44_u8, 0x40_u8, 0xa5_u8, 0xba_u8, 0xab_u8, 0xfc_u8])
  CLSID_FaxDevice = LibC::GUID.new(0x59e3a5b2_u32, 0xd676_u16, 0x484b_u16, StaticArray[0xa6_u8, 0xde_u8, 0x72_u8, 0xb_u8, 0xfa_u8, 0x89_u8, 0xb5_u8, 0xaf_u8])
  CLSID_FaxActivityLogging = LibC::GUID.new(0xf0a0294e_u32, 0x3bbd_u16, 0x48b8_u16, StaticArray[0x8f_u8, 0x13_u8, 0x8c_u8, 0x59_u8, 0x1a_u8, 0x55_u8, 0xbd_u8, 0xbc_u8])
  CLSID_FaxEventLogging = LibC::GUID.new(0xa6850930_u32, 0xa0f6_u16, 0x4a6f_u16, StaticArray[0x95_u8, 0xb7_u8, 0xdb_u8, 0x2e_u8, 0xbf_u8, 0x3d_u8, 0x2_u8, 0xe3_u8])
  CLSID_FaxOutboundRoutingGroups = LibC::GUID.new(0xccbea1a5_u32, 0xe2b4_u16, 0x4b57_u16, StaticArray[0x94_u8, 0x21_u8, 0xb0_u8, 0x4b_u8, 0x62_u8, 0x89_u8, 0x46_u8, 0x4b_u8])
  CLSID_FaxOutboundRoutingGroup = LibC::GUID.new(0x213f3e0_u32, 0x6791_u16, 0x4d77_u16, StaticArray[0xa2_u8, 0x71_u8, 0x4_u8, 0xd2_u8, 0x35_u8, 0x7c_u8, 0x50_u8, 0xd6_u8])
  CLSID_FaxDeviceIds = LibC::GUID.new(0xcdc539ea_u32, 0x7277_u16, 0x460e_u16, StaticArray[0x8d_u8, 0xe0_u8, 0x48_u8, 0xa0_u8, 0xa5_u8, 0x76_u8, 0xd_u8, 0x1f_u8])
  CLSID_FaxOutboundRoutingRules = LibC::GUID.new(0xd385beca_u32, 0xe624_u16, 0x4473_u16, StaticArray[0xbf_u8, 0xaa_u8, 0x9f_u8, 0x40_u8, 0x0_u8, 0x83_u8, 0x1f_u8, 0x54_u8])
  CLSID_FaxOutboundRoutingRule = LibC::GUID.new(0x6549eebf_u32, 0x8d1_u16, 0x475a_u16, StaticArray[0x82_u8, 0x8b_u8, 0x3b_u8, 0xf1_u8, 0x5_u8, 0x95_u8, 0x2f_u8, 0xa0_u8])
  CLSID_FaxInboundRoutingExtensions = LibC::GUID.new(0x189a48ed_u32, 0x623c_u16, 0x4c0d_u16, StaticArray[0x80_u8, 0xf2_u8, 0xd6_u8, 0x6c_u8, 0x7b_u8, 0x9e_u8, 0xfe_u8, 0xc2_u8])
  CLSID_FaxInboundRoutingExtension = LibC::GUID.new(0x1d7dfb51_u32, 0x7207_u16, 0x4436_u16, StaticArray[0xa0_u8, 0xd9_u8, 0x24_u8, 0xe3_u8, 0x2e_u8, 0xe5_u8, 0x69_u8, 0x88_u8])
  CLSID_FaxInboundRoutingMethods = LibC::GUID.new(0x25fcb76a_u32, 0xb750_u16, 0x4b82_u16, StaticArray[0x92_u8, 0x66_u8, 0xfb_u8, 0xbb_u8, 0xae_u8, 0x89_u8, 0x22_u8, 0xba_u8])
  CLSID_FaxInboundRoutingMethod = LibC::GUID.new(0x4b9fd75c_u32, 0x194_u16, 0x4b72_u16, StaticArray[0x9c_u8, 0xe5_u8, 0x2_u8, 0xa8_u8, 0x20_u8, 0x5a_u8, 0xc7_u8, 0xd4_u8])
  CLSID_FaxJobStatus = LibC::GUID.new(0x7bf222f4_u32, 0xbe8d_u16, 0x442f_u16, StaticArray[0x84_u8, 0x1d_u8, 0x61_u8, 0x32_u8, 0x74_u8, 0x24_u8, 0x23_u8, 0xbb_u8])
  CLSID_FaxRecipient = LibC::GUID.new(0x60bf3301_u32, 0x7df8_u16, 0x4bd8_u16, StaticArray[0x91_u8, 0x48_u8, 0x7b_u8, 0x58_u8, 0x1_u8, 0xf9_u8, 0xef_u8, 0xdf_u8])
  CLSID_FaxConfiguration = LibC::GUID.new(0x5857326f_u32, 0xe7b3_u16, 0x41a7_u16, StaticArray[0x9c_u8, 0x19_u8, 0xa9_u8, 0x1b_u8, 0x46_u8, 0x3e_u8, 0x2d_u8, 0x56_u8])
  CLSID_FaxAccountSet = LibC::GUID.new(0xfbc23c4b_u32, 0x79e0_u16, 0x4291_u16, StaticArray[0xbc_u8, 0x56_u8, 0xc1_u8, 0x2e_u8, 0x25_u8, 0x3b_u8, 0xbf_u8, 0x3a_u8])
  CLSID_FaxAccounts = LibC::GUID.new(0xda1f94aa_u32, 0xee2c_u16, 0x47c0_u16, StaticArray[0x8f_u8, 0x4f_u8, 0x2a_u8, 0x21_u8, 0x70_u8, 0x75_u8, 0xb7_u8, 0x6e_u8])
  CLSID_FaxAccount = LibC::GUID.new(0xa7e0647f_u32, 0x4524_u16, 0x4464_u16, StaticArray[0xa5_u8, 0x6d_u8, 0xb9_u8, 0xfe_u8, 0x66_u8, 0x6f_u8, 0x71_u8, 0x5e_u8])
  CLSID_FaxAccountFolders = LibC::GUID.new(0x85398f49_u32, 0xc034_u16, 0x4a3f_u16, StaticArray[0x82_u8, 0x1c_u8, 0xdb_u8, 0x7d_u8, 0x68_u8, 0x5e_u8, 0x81_u8, 0x29_u8])
  CLSID_FaxAccountIncomingQueue = LibC::GUID.new(0x9bcf6094_u32, 0xb4da_u16, 0x45f4_u16, StaticArray[0xb8_u8, 0xd6_u8, 0xdd_u8, 0xeb_u8, 0x21_u8, 0x86_u8, 0x65_u8, 0x2c_u8])
  CLSID_FaxAccountOutgoingQueue = LibC::GUID.new(0xfeeceefb_u32, 0xc149_u16, 0x48ba_u16, StaticArray[0xba_u8, 0xb8_u8, 0xb7_u8, 0x91_u8, 0xe1_u8, 0x1_u8, 0xf6_u8, 0x2f_u8])
  CLSID_FaxAccountIncomingArchive = LibC::GUID.new(0x14b33db5_u32, 0x4c40_u16, 0x4ecf_u16, StaticArray[0x9e_u8, 0xf8_u8, 0xa3_u8, 0x60_u8, 0xcb_u8, 0xe8_u8, 0x9_u8, 0xed_u8])
  CLSID_FaxAccountOutgoingArchive = LibC::GUID.new(0x851e7af5_u32, 0x433a_u16, 0x4739_u16, StaticArray[0xa2_u8, 0xdf_u8, 0xad_u8, 0x24_u8, 0x5c_u8, 0x2c_u8, 0xb9_u8, 0x8e_u8])
  CLSID_FaxSecurity2 = LibC::GUID.new(0x735c1248_u32, 0xec89_u16, 0x4c30_u16, StaticArray[0xa1_u8, 0x27_u8, 0x65_u8, 0x6e_u8, 0x92_u8, 0xe3_u8, 0xc4_u8, 0xea_u8])

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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_status : UInt64
    get_pages : UInt64
    get_size : UInt64
    get_current_page : UInt64
    get_device_id : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    get_extended_status_code : UInt64
    get_extended_status : UInt64
    get_available_operations : UInt64
    get_retries : UInt64
    get_job_type : UInt64
    get_scheduled_time : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_caller_id : UInt64
    get_routing_information : UInt64
  end

  IFaxJobStatus_GUID = "8b86f485-fd7f-4824-886b-40c5caa617cc"
  IID_IFaxJobStatus = LibC::GUID.new(0x8b86f485_u32, 0xfd7f_u16, 0x4824_u16, StaticArray[0x88_u8, 0x6b_u8, 0x40_u8, 0xc5_u8, 0xca_u8, 0xa6_u8, 0x17_u8, 0xcc_u8])
  struct IFaxJobStatus
    lpVtbl : IFaxJobStatusVTbl*
  end

  struct IFaxServerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    connect : UInt64
    get_server_name : UInt64
    get_device_providers : UInt64
    get_devices : UInt64
    get_inbound_routing : UInt64
    get_folders : UInt64
    get_logging_options : UInt64
    get_major_version : UInt64
    get_minor_version : UInt64
    get_major_build : UInt64
    get_minor_build : UInt64
    get_debug : UInt64
    get_activity : UInt64
    get_outbound_routing : UInt64
    get_receipt_options : UInt64
    get_security : UInt64
    disconnect : UInt64
    get_extension_property : UInt64
    set_extension_property : UInt64
    listen_to_server_events : UInt64
    register_device_provider : UInt64
    unregister_device_provider : UInt64
    register_inbound_routing_extension : UInt64
    unregister_inbound_routing_extension : UInt64
    get_registered_events : UInt64
    get_api_version : UInt64
  end

  IFaxServer_GUID = "475b6469-90a5-4878-a577-17a86e8e3462"
  IID_IFaxServer = LibC::GUID.new(0x475b6469_u32, 0x90a5_u16, 0x4878_u16, StaticArray[0xa5_u8, 0x77_u8, 0x17_u8, 0xa8_u8, 0x6e_u8, 0x8e_u8, 0x34_u8, 0x62_u8])
  struct IFaxServer
    lpVtbl : IFaxServerVTbl*
  end

  struct IFaxDeviceProvidersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
  end

  IFaxDeviceProviders_GUID = "9fb76f62-4c7e-43a5-b6fd-502893f7e13e"
  IID_IFaxDeviceProviders = LibC::GUID.new(0x9fb76f62_u32, 0x4c7e_u16, 0x43a5_u16, StaticArray[0xb6_u8, 0xfd_u8, 0x50_u8, 0x28_u8, 0x93_u8, 0xf7_u8, 0xe1_u8, 0x3e_u8])
  struct IFaxDeviceProviders
    lpVtbl : IFaxDeviceProvidersVTbl*
  end

  struct IFaxDevicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    get_item_by_id : UInt64
  end

  IFaxDevices_GUID = "9e46783e-f34f-482e-a360-0416becbbd96"
  IID_IFaxDevices = LibC::GUID.new(0x9e46783e_u32, 0xf34f_u16, 0x482e_u16, StaticArray[0xa3_u8, 0x60_u8, 0x4_u8, 0x16_u8, 0xbe_u8, 0xcb_u8, 0xbd_u8, 0x96_u8])
  struct IFaxDevices
    lpVtbl : IFaxDevicesVTbl*
  end

  struct IFaxInboundRoutingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_extensions : UInt64
    get_methods : UInt64
  end

  IFaxInboundRouting_GUID = "8148c20f-9d52-45b1-bf96-38fc12713527"
  IID_IFaxInboundRouting = LibC::GUID.new(0x8148c20f_u32, 0x9d52_u16, 0x45b1_u16, StaticArray[0xbf_u8, 0x96_u8, 0x38_u8, 0xfc_u8, 0x12_u8, 0x71_u8, 0x35_u8, 0x27_u8])
  struct IFaxInboundRouting
    lpVtbl : IFaxInboundRoutingVTbl*
  end

  struct IFaxFoldersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_outgoing_queue : UInt64
    get_incoming_queue : UInt64
    get_incoming_archive : UInt64
    get_outgoing_archive : UInt64
  end

  IFaxFolders_GUID = "dce3b2a8-a7ab-42bc-9d0a-3149457261a0"
  IID_IFaxFolders = LibC::GUID.new(0xdce3b2a8_u32, 0xa7ab_u16, 0x42bc_u16, StaticArray[0x9d_u8, 0xa_u8, 0x31_u8, 0x49_u8, 0x45_u8, 0x72_u8, 0x61_u8, 0xa0_u8])
  struct IFaxFolders
    lpVtbl : IFaxFoldersVTbl*
  end

  struct IFaxLoggingOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_event_logging : UInt64
    get_activity_logging : UInt64
  end

  IFaxLoggingOptions_GUID = "34e64fb9-6b31-4d32-8b27-d286c0c33606"
  IID_IFaxLoggingOptions = LibC::GUID.new(0x34e64fb9_u32, 0x6b31_u16, 0x4d32_u16, StaticArray[0x8b_u8, 0x27_u8, 0xd2_u8, 0x86_u8, 0xc0_u8, 0xc3_u8, 0x36_u8, 0x6_u8])
  struct IFaxLoggingOptions
    lpVtbl : IFaxLoggingOptionsVTbl*
  end

  struct IFaxActivityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_incoming_messages : UInt64
    get_routing_messages : UInt64
    get_outgoing_messages : UInt64
    get_queued_messages : UInt64
    refresh : UInt64
  end

  IFaxActivity_GUID = "4b106f97-3df5-40f2-bc3c-44cb8115ebdf"
  IID_IFaxActivity = LibC::GUID.new(0x4b106f97_u32, 0x3df5_u16, 0x40f2_u16, StaticArray[0xbc_u8, 0x3c_u8, 0x44_u8, 0xcb_u8, 0x81_u8, 0x15_u8, 0xeb_u8, 0xdf_u8])
  struct IFaxActivity
    lpVtbl : IFaxActivityVTbl*
  end

  struct IFaxOutboundRoutingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_groups : UInt64
    get_rules : UInt64
  end

  IFaxOutboundRouting_GUID = "25dc05a4-9909-41bd-a95b-7e5d1dec1d43"
  IID_IFaxOutboundRouting = LibC::GUID.new(0x25dc05a4_u32, 0x9909_u16, 0x41bd_u16, StaticArray[0xa9_u8, 0x5b_u8, 0x7e_u8, 0x5d_u8, 0x1d_u8, 0xec_u8, 0x1d_u8, 0x43_u8])
  struct IFaxOutboundRouting
    lpVtbl : IFaxOutboundRoutingVTbl*
  end

  struct IFaxReceiptOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_authentication_type : UInt64
    put_authentication_type : UInt64
    get_smtp_server : UInt64
    put_smtp_server : UInt64
    get_smtp_port : UInt64
    put_smtp_port : UInt64
    get_smtp_sender : UInt64
    put_smtp_sender : UInt64
    get_smtp_user : UInt64
    put_smtp_user : UInt64
    get_allowed_receipts : UInt64
    put_allowed_receipts : UInt64
    get_smtp_password : UInt64
    put_smtp_password : UInt64
    refresh : UInt64
    save : UInt64
    get_use_for_inbound_routing : UInt64
    put_use_for_inbound_routing : UInt64
  end

  IFaxReceiptOptions_GUID = "378efaeb-5fcb-4afb-b2ee-e16e80614487"
  IID_IFaxReceiptOptions = LibC::GUID.new(0x378efaeb_u32, 0x5fcb_u16, 0x4afb_u16, StaticArray[0xb2_u8, 0xee_u8, 0xe1_u8, 0x6e_u8, 0x80_u8, 0x61_u8, 0x44_u8, 0x87_u8])
  struct IFaxReceiptOptions
    lpVtbl : IFaxReceiptOptionsVTbl*
  end

  struct IFaxSecurityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_descriptor : UInt64
    put_descriptor : UInt64
    get_granted_rights : UInt64
    refresh : UInt64
    save : UInt64
    get_information_type : UInt64
    put_information_type : UInt64
  end

  IFaxSecurity_GUID = "77b508c1-09c0-47a2-91eb-fce7fdf2690e"
  IID_IFaxSecurity = LibC::GUID.new(0x77b508c1_u32, 0x9c0_u16, 0x47a2_u16, StaticArray[0x91_u8, 0xeb_u8, 0xfc_u8, 0xe7_u8, 0xfd_u8, 0xf2_u8, 0x69_u8, 0xe_u8])
  struct IFaxSecurity
    lpVtbl : IFaxSecurityVTbl*
  end

  struct IFaxDocumentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_body : UInt64
    put_body : UInt64
    get_sender : UInt64
    get_recipients : UInt64
    get_cover_page : UInt64
    put_cover_page : UInt64
    get_subject : UInt64
    put_subject : UInt64
    get_note : UInt64
    put_note : UInt64
    get_schedule_time : UInt64
    put_schedule_time : UInt64
    get_receipt_address : UInt64
    put_receipt_address : UInt64
    get_document_name : UInt64
    put_document_name : UInt64
    get_call_handle : UInt64
    put_call_handle : UInt64
    get_cover_page_type : UInt64
    put_cover_page_type : UInt64
    get_schedule_type : UInt64
    put_schedule_type : UInt64
    get_receipt_type : UInt64
    put_receipt_type : UInt64
    get_group_broadcast_receipts : UInt64
    put_group_broadcast_receipts : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_tapi_connection : UInt64
    putref_tapi_connection : UInt64
    submit : UInt64
    connected_submit : UInt64
    get_attach_fax_to_receipt : UInt64
    put_attach_fax_to_receipt : UInt64
  end

  IFaxDocument_GUID = "b207a246-09e3-4a4e-a7dc-fea31d29458f"
  IID_IFaxDocument = LibC::GUID.new(0xb207a246_u32, 0x9e3_u16, 0x4a4e_u16, StaticArray[0xa7_u8, 0xdc_u8, 0xfe_u8, 0xa3_u8, 0x1d_u8, 0x29_u8, 0x45_u8, 0x8f_u8])
  struct IFaxDocument
    lpVtbl : IFaxDocumentVTbl*
  end

  struct IFaxSenderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_billing_code : UInt64
    put_billing_code : UInt64
    get_city : UInt64
    put_city : UInt64
    get_company : UInt64
    put_company : UInt64
    get_country : UInt64
    put_country : UInt64
    get_department : UInt64
    put_department : UInt64
    get_email : UInt64
    put_email : UInt64
    get_fax_number : UInt64
    put_fax_number : UInt64
    get_home_phone : UInt64
    put_home_phone : UInt64
    get_name : UInt64
    put_name : UInt64
    get_tsid : UInt64
    put_tsid : UInt64
    get_office_phone : UInt64
    put_office_phone : UInt64
    get_office_location : UInt64
    put_office_location : UInt64
    get_state : UInt64
    put_state : UInt64
    get_street_address : UInt64
    put_street_address : UInt64
    get_title : UInt64
    put_title : UInt64
    get_zip_code : UInt64
    put_zip_code : UInt64
    load_default_sender : UInt64
    save_default_sender : UInt64
  end

  IFaxSender_GUID = "0d879d7d-f57a-4cc6-a6f9-3ee5d527b46a"
  IID_IFaxSender = LibC::GUID.new(0xd879d7d_u32, 0xf57a_u16, 0x4cc6_u16, StaticArray[0xa6_u8, 0xf9_u8, 0x3e_u8, 0xe5_u8, 0xd5_u8, 0x27_u8, 0xb4_u8, 0x6a_u8])
  struct IFaxSender
    lpVtbl : IFaxSenderVTbl*
  end

  struct IFaxRecipientVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_fax_number : UInt64
    put_fax_number : UInt64
    get_name : UInt64
    put_name : UInt64
  end

  IFaxRecipient_GUID = "9a3da3a0-538d-42b6-9444-aaa57d0ce2bc"
  IID_IFaxRecipient = LibC::GUID.new(0x9a3da3a0_u32, 0x538d_u16, 0x42b6_u16, StaticArray[0x94_u8, 0x44_u8, 0xaa_u8, 0xa5_u8, 0x7d_u8, 0xc_u8, 0xe2_u8, 0xbc_u8])
  struct IFaxRecipient
    lpVtbl : IFaxRecipientVTbl*
  end

  struct IFaxRecipientsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
  end

  IFaxRecipients_GUID = "b9c9de5a-894e-4492-9fa3-08c627c11d5d"
  IID_IFaxRecipients = LibC::GUID.new(0xb9c9de5a_u32, 0x894e_u16, 0x4492_u16, StaticArray[0x9f_u8, 0xa3_u8, 0x8_u8, 0xc6_u8, 0x27_u8, 0xc1_u8, 0x1d_u8, 0x5d_u8])
  struct IFaxRecipients
    lpVtbl : IFaxRecipientsVTbl*
  end

  struct IFaxIncomingArchiveVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_use_archive : UInt64
    put_use_archive : UInt64
    get_archive_folder : UInt64
    put_archive_folder : UInt64
    get_size_quota_warning : UInt64
    put_size_quota_warning : UInt64
    get_high_quota_water_mark : UInt64
    put_high_quota_water_mark : UInt64
    get_low_quota_water_mark : UInt64
    put_low_quota_water_mark : UInt64
    get_age_limit : UInt64
    put_age_limit : UInt64
    get_size_low : UInt64
    get_size_high : UInt64
    refresh : UInt64
    save : UInt64
    get_messages : UInt64
    get_message : UInt64
  end

  IFaxIncomingArchive_GUID = "76062cc7-f714-4fbd-aa06-ed6e4a4b70f3"
  IID_IFaxIncomingArchive = LibC::GUID.new(0x76062cc7_u32, 0xf714_u16, 0x4fbd_u16, StaticArray[0xaa_u8, 0x6_u8, 0xed_u8, 0x6e_u8, 0x4a_u8, 0x4b_u8, 0x70_u8, 0xf3_u8])
  struct IFaxIncomingArchive
    lpVtbl : IFaxIncomingArchiveVTbl*
  end

  struct IFaxIncomingQueueVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_blocked : UInt64
    put_blocked : UInt64
    refresh : UInt64
    save : UInt64
    get_jobs : UInt64
    get_job : UInt64
  end

  IFaxIncomingQueue_GUID = "902e64ef-8fd8-4b75-9725-6014df161545"
  IID_IFaxIncomingQueue = LibC::GUID.new(0x902e64ef_u32, 0x8fd8_u16, 0x4b75_u16, StaticArray[0x97_u8, 0x25_u8, 0x60_u8, 0x14_u8, 0xdf_u8, 0x16_u8, 0x15_u8, 0x45_u8])
  struct IFaxIncomingQueue
    lpVtbl : IFaxIncomingQueueVTbl*
  end

  struct IFaxOutgoingArchiveVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_use_archive : UInt64
    put_use_archive : UInt64
    get_archive_folder : UInt64
    put_archive_folder : UInt64
    get_size_quota_warning : UInt64
    put_size_quota_warning : UInt64
    get_high_quota_water_mark : UInt64
    put_high_quota_water_mark : UInt64
    get_low_quota_water_mark : UInt64
    put_low_quota_water_mark : UInt64
    get_age_limit : UInt64
    put_age_limit : UInt64
    get_size_low : UInt64
    get_size_high : UInt64
    refresh : UInt64
    save : UInt64
    get_messages : UInt64
    get_message : UInt64
  end

  IFaxOutgoingArchive_GUID = "c9c28f40-8d80-4e53-810f-9a79919b49fd"
  IID_IFaxOutgoingArchive = LibC::GUID.new(0xc9c28f40_u32, 0x8d80_u16, 0x4e53_u16, StaticArray[0x81_u8, 0xf_u8, 0x9a_u8, 0x79_u8, 0x91_u8, 0x9b_u8, 0x49_u8, 0xfd_u8])
  struct IFaxOutgoingArchive
    lpVtbl : IFaxOutgoingArchiveVTbl*
  end

  struct IFaxOutgoingQueueVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_blocked : UInt64
    put_blocked : UInt64
    get_paused : UInt64
    put_paused : UInt64
    get_allow_personal_cover_pages : UInt64
    put_allow_personal_cover_pages : UInt64
    get_use_device_tsid : UInt64
    put_use_device_tsid : UInt64
    get_retries : UInt64
    put_retries : UInt64
    get_retry_delay : UInt64
    put_retry_delay : UInt64
    get_discount_rate_start : UInt64
    put_discount_rate_start : UInt64
    get_discount_rate_end : UInt64
    put_discount_rate_end : UInt64
    get_age_limit : UInt64
    put_age_limit : UInt64
    get_branding : UInt64
    put_branding : UInt64
    refresh : UInt64
    save : UInt64
    get_jobs : UInt64
    get_job : UInt64
  end

  IFaxOutgoingQueue_GUID = "80b1df24-d9ac-4333-b373-487cedc80ce5"
  IID_IFaxOutgoingQueue = LibC::GUID.new(0x80b1df24_u32, 0xd9ac_u16, 0x4333_u16, StaticArray[0xb3_u8, 0x73_u8, 0x48_u8, 0x7c_u8, 0xed_u8, 0xc8_u8, 0xc_u8, 0xe5_u8])
  struct IFaxOutgoingQueue
    lpVtbl : IFaxOutgoingQueueVTbl*
  end

  struct IFaxIncomingMessageIteratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_message : UInt64
    get_prefetch_size : UInt64
    put_prefetch_size : UInt64
    get_at_eof : UInt64
    move_first : UInt64
    move_next : UInt64
  end

  IFaxIncomingMessageIterator_GUID = "fd73ecc4-6f06-4f52-82a8-f7ba06ae3108"
  IID_IFaxIncomingMessageIterator = LibC::GUID.new(0xfd73ecc4_u32, 0x6f06_u16, 0x4f52_u16, StaticArray[0x82_u8, 0xa8_u8, 0xf7_u8, 0xba_u8, 0x6_u8, 0xae_u8, 0x31_u8, 0x8_u8])
  struct IFaxIncomingMessageIterator
    lpVtbl : IFaxIncomingMessageIteratorVTbl*
  end

  struct IFaxIncomingMessageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_pages : UInt64
    get_size : UInt64
    get_device_name : UInt64
    get_retries : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    get_caller_id : UInt64
    get_routing_information : UInt64
    copy_tiff : UInt64
    delete : UInt64
  end

  IFaxIncomingMessage_GUID = "7cab88fa-2ef9-4851-b2f3-1d148fed8447"
  IID_IFaxIncomingMessage = LibC::GUID.new(0x7cab88fa_u32, 0x2ef9_u16, 0x4851_u16, StaticArray[0xb2_u8, 0xf3_u8, 0x1d_u8, 0x14_u8, 0x8f_u8, 0xed_u8, 0x84_u8, 0x47_u8])
  struct IFaxIncomingMessage
    lpVtbl : IFaxIncomingMessageVTbl*
  end

  struct IFaxOutgoingJobsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
  end

  IFaxOutgoingJobs_GUID = "2c56d8e6-8c2f-4573-944c-e505f8f5aeed"
  IID_IFaxOutgoingJobs = LibC::GUID.new(0x2c56d8e6_u32, 0x8c2f_u16, 0x4573_u16, StaticArray[0x94_u8, 0x4c_u8, 0xe5_u8, 0x5_u8, 0xf8_u8, 0xf5_u8, 0xae_u8, 0xed_u8])
  struct IFaxOutgoingJobs
    lpVtbl : IFaxOutgoingJobsVTbl*
  end

  struct IFaxOutgoingJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_subject : UInt64
    get_document_name : UInt64
    get_pages : UInt64
    get_size : UInt64
    get_submission_id : UInt64
    get_id : UInt64
    get_original_scheduled_time : UInt64
    get_submission_time : UInt64
    get_receipt_type : UInt64
    get_priority : UInt64
    get_sender : UInt64
    get_recipient : UInt64
    get_current_page : UInt64
    get_device_id : UInt64
    get_status : UInt64
    get_extended_status_code : UInt64
    get_extended_status : UInt64
    get_available_operations : UInt64
    get_retries : UInt64
    get_scheduled_time : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    get_group_broadcast_receipts : UInt64
    pause : UInt64
    resume : UInt64
    restart : UInt64
    copy_tiff : UInt64
    refresh : UInt64
    cancel : UInt64
  end

  IFaxOutgoingJob_GUID = "6356daad-6614-4583-bf7a-3ad67bbfc71c"
  IID_IFaxOutgoingJob = LibC::GUID.new(0x6356daad_u32, 0x6614_u16, 0x4583_u16, StaticArray[0xbf_u8, 0x7a_u8, 0x3a_u8, 0xd6_u8, 0x7b_u8, 0xbf_u8, 0xc7_u8, 0x1c_u8])
  struct IFaxOutgoingJob
    lpVtbl : IFaxOutgoingJobVTbl*
  end

  struct IFaxOutgoingMessageIteratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_message : UInt64
    get_at_eof : UInt64
    get_prefetch_size : UInt64
    put_prefetch_size : UInt64
    move_first : UInt64
    move_next : UInt64
  end

  IFaxOutgoingMessageIterator_GUID = "f5ec5d4f-b840-432f-9980-112fe42a9b7a"
  IID_IFaxOutgoingMessageIterator = LibC::GUID.new(0xf5ec5d4f_u32, 0xb840_u16, 0x432f_u16, StaticArray[0x99_u8, 0x80_u8, 0x11_u8, 0x2f_u8, 0xe4_u8, 0x2a_u8, 0x9b_u8, 0x7a_u8])
  struct IFaxOutgoingMessageIterator
    lpVtbl : IFaxOutgoingMessageIteratorVTbl*
  end

  struct IFaxOutgoingMessageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_submission_id : UInt64
    get_id : UInt64
    get_subject : UInt64
    get_document_name : UInt64
    get_retries : UInt64
    get_pages : UInt64
    get_size : UInt64
    get_original_scheduled_time : UInt64
    get_submission_time : UInt64
    get_priority : UInt64
    get_sender : UInt64
    get_recipient : UInt64
    get_device_name : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    copy_tiff : UInt64
    delete : UInt64
  end

  IFaxOutgoingMessage_GUID = "f0ea35de-caa5-4a7c-82c7-2b60ba5f2be2"
  IID_IFaxOutgoingMessage = LibC::GUID.new(0xf0ea35de_u32, 0xcaa5_u16, 0x4a7c_u16, StaticArray[0x82_u8, 0xc7_u8, 0x2b_u8, 0x60_u8, 0xba_u8, 0x5f_u8, 0x2b_u8, 0xe2_u8])
  struct IFaxOutgoingMessage
    lpVtbl : IFaxOutgoingMessageVTbl*
  end

  struct IFaxIncomingJobsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
  end

  IFaxIncomingJobs_GUID = "011f04e9-4fd6-4c23-9513-b6b66bb26be9"
  IID_IFaxIncomingJobs = LibC::GUID.new(0x11f04e9_u32, 0x4fd6_u16, 0x4c23_u16, StaticArray[0x95_u8, 0x13_u8, 0xb6_u8, 0xb6_u8, 0x6b_u8, 0xb2_u8, 0x6b_u8, 0xe9_u8])
  struct IFaxIncomingJobs
    lpVtbl : IFaxIncomingJobsVTbl*
  end

  struct IFaxIncomingJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_size : UInt64
    get_id : UInt64
    get_current_page : UInt64
    get_device_id : UInt64
    get_status : UInt64
    get_extended_status_code : UInt64
    get_extended_status : UInt64
    get_available_operations : UInt64
    get_retries : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    get_caller_id : UInt64
    get_routing_information : UInt64
    get_job_type : UInt64
    cancel : UInt64
    refresh : UInt64
    copy_tiff : UInt64
  end

  IFaxIncomingJob_GUID = "207529e6-654a-4916-9f88-4d232ee8a107"
  IID_IFaxIncomingJob = LibC::GUID.new(0x207529e6_u32, 0x654a_u16, 0x4916_u16, StaticArray[0x9f_u8, 0x88_u8, 0x4d_u8, 0x23_u8, 0x2e_u8, 0xe8_u8, 0xa1_u8, 0x7_u8])
  struct IFaxIncomingJob
    lpVtbl : IFaxIncomingJobVTbl*
  end

  struct IFaxDeviceProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_friendly_name : UInt64
    get_image_name : UInt64
    get_unique_name : UInt64
    get_tapi_provider_name : UInt64
    get_major_version : UInt64
    get_minor_version : UInt64
    get_major_build : UInt64
    get_minor_build : UInt64
    get_debug : UInt64
    get_status : UInt64
    get_init_error_code : UInt64
    get_device_ids : UInt64
  end

  IFaxDeviceProvider_GUID = "290eac63-83ec-449c-8417-f148df8c682a"
  IID_IFaxDeviceProvider = LibC::GUID.new(0x290eac63_u32, 0x83ec_u16, 0x449c_u16, StaticArray[0x84_u8, 0x17_u8, 0xf1_u8, 0x48_u8, 0xdf_u8, 0x8c_u8, 0x68_u8, 0x2a_u8])
  struct IFaxDeviceProvider
    lpVtbl : IFaxDeviceProviderVTbl*
  end

  struct IFaxDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_device_name : UInt64
    get_provider_unique_name : UInt64
    get_powered_off : UInt64
    get_receiving_now : UInt64
    get_sending_now : UInt64
    get_used_routing_methods : UInt64
    get_description : UInt64
    put_description : UInt64
    get_send_enabled : UInt64
    put_send_enabled : UInt64
    get_receive_mode : UInt64
    put_receive_mode : UInt64
    get_rings_before_answer : UInt64
    put_rings_before_answer : UInt64
    get_csid : UInt64
    put_csid : UInt64
    get_tsid : UInt64
    put_tsid : UInt64
    refresh : UInt64
    save : UInt64
    get_extension_property : UInt64
    set_extension_property : UInt64
    use_routing_method : UInt64
    get_ringing_now : UInt64
    answer_call : UInt64
  end

  IFaxDevice_GUID = "49306c59-b52e-4867-9df4-ca5841c956d0"
  IID_IFaxDevice = LibC::GUID.new(0x49306c59_u32, 0xb52e_u16, 0x4867_u16, StaticArray[0x9d_u8, 0xf4_u8, 0xca_u8, 0x58_u8, 0x41_u8, 0xc9_u8, 0x56_u8, 0xd0_u8])
  struct IFaxDevice
    lpVtbl : IFaxDeviceVTbl*
  end

  struct IFaxActivityLoggingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_log_incoming : UInt64
    put_log_incoming : UInt64
    get_log_outgoing : UInt64
    put_log_outgoing : UInt64
    get_database_path : UInt64
    put_database_path : UInt64
    refresh : UInt64
    save : UInt64
  end

  IFaxActivityLogging_GUID = "1e29078b-5a69-497b-9592-49b7e7faddb5"
  IID_IFaxActivityLogging = LibC::GUID.new(0x1e29078b_u32, 0x5a69_u16, 0x497b_u16, StaticArray[0x95_u8, 0x92_u8, 0x49_u8, 0xb7_u8, 0xe7_u8, 0xfa_u8, 0xdd_u8, 0xb5_u8])
  struct IFaxActivityLogging
    lpVtbl : IFaxActivityLoggingVTbl*
  end

  struct IFaxEventLoggingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_init_events_level : UInt64
    put_init_events_level : UInt64
    get_inbound_events_level : UInt64
    put_inbound_events_level : UInt64
    get_outbound_events_level : UInt64
    put_outbound_events_level : UInt64
    get_general_events_level : UInt64
    put_general_events_level : UInt64
    refresh : UInt64
    save : UInt64
  end

  IFaxEventLogging_GUID = "0880d965-20e8-42e4-8e17-944f192caad4"
  IID_IFaxEventLogging = LibC::GUID.new(0x880d965_u32, 0x20e8_u16, 0x42e4_u16, StaticArray[0x8e_u8, 0x17_u8, 0x94_u8, 0x4f_u8, 0x19_u8, 0x2c_u8, 0xaa_u8, 0xd4_u8])
  struct IFaxEventLogging
    lpVtbl : IFaxEventLoggingVTbl*
  end

  struct IFaxOutboundRoutingGroupsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
  end

  IFaxOutboundRoutingGroups_GUID = "235cbef7-c2de-4bfd-b8da-75097c82c87f"
  IID_IFaxOutboundRoutingGroups = LibC::GUID.new(0x235cbef7_u32, 0xc2de_u16, 0x4bfd_u16, StaticArray[0xb8_u8, 0xda_u8, 0x75_u8, 0x9_u8, 0x7c_u8, 0x82_u8, 0xc8_u8, 0x7f_u8])
  struct IFaxOutboundRoutingGroups
    lpVtbl : IFaxOutboundRoutingGroupsVTbl*
  end

  struct IFaxOutboundRoutingGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_status : UInt64
    get_device_ids : UInt64
  end

  IFaxOutboundRoutingGroup_GUID = "ca6289a1-7e25-4f87-9a0b-93365734962c"
  IID_IFaxOutboundRoutingGroup = LibC::GUID.new(0xca6289a1_u32, 0x7e25_u16, 0x4f87_u16, StaticArray[0x9a_u8, 0xb_u8, 0x93_u8, 0x36_u8, 0x57_u8, 0x34_u8, 0x96_u8, 0x2c_u8])
  struct IFaxOutboundRoutingGroup
    lpVtbl : IFaxOutboundRoutingGroupVTbl*
  end

  struct IFaxDeviceIdsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
    set_order : UInt64
  end

  IFaxDeviceIds_GUID = "2f0f813f-4ce9-443e-8ca1-738cfaeee149"
  IID_IFaxDeviceIds = LibC::GUID.new(0x2f0f813f_u32, 0x4ce9_u16, 0x443e_u16, StaticArray[0x8c_u8, 0xa1_u8, 0x73_u8, 0x8c_u8, 0xfa_u8, 0xee_u8, 0xe1_u8, 0x49_u8])
  struct IFaxDeviceIds
    lpVtbl : IFaxDeviceIdsVTbl*
  end

  struct IFaxOutboundRoutingRulesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    item_by_country_and_area : UInt64
    remove_by_country_and_area : UInt64
    remove : UInt64
    add : UInt64
  end

  IFaxOutboundRoutingRules_GUID = "dcefa1e7-ae7d-4ed6-8521-369edcca5120"
  IID_IFaxOutboundRoutingRules = LibC::GUID.new(0xdcefa1e7_u32, 0xae7d_u16, 0x4ed6_u16, StaticArray[0x85_u8, 0x21_u8, 0x36_u8, 0x9e_u8, 0xdc_u8, 0xca_u8, 0x51_u8, 0x20_u8])
  struct IFaxOutboundRoutingRules
    lpVtbl : IFaxOutboundRoutingRulesVTbl*
  end

  struct IFaxOutboundRoutingRuleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_country_code : UInt64
    get_area_code : UInt64
    get_status : UInt64
    get_use_device : UInt64
    put_use_device : UInt64
    get_device_id : UInt64
    put_device_id : UInt64
    get_group_name : UInt64
    put_group_name : UInt64
    refresh : UInt64
    save : UInt64
  end

  IFaxOutboundRoutingRule_GUID = "e1f795d5-07c2-469f-b027-acacc23219da"
  IID_IFaxOutboundRoutingRule = LibC::GUID.new(0xe1f795d5_u32, 0x7c2_u16, 0x469f_u16, StaticArray[0xb0_u8, 0x27_u8, 0xac_u8, 0xac_u8, 0xc2_u8, 0x32_u8, 0x19_u8, 0xda_u8])
  struct IFaxOutboundRoutingRule
    lpVtbl : IFaxOutboundRoutingRuleVTbl*
  end

  struct IFaxInboundRoutingExtensionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
  end

  IFaxInboundRoutingExtensions_GUID = "2f6c9673-7b26-42de-8eb0-915dcd2a4f4c"
  IID_IFaxInboundRoutingExtensions = LibC::GUID.new(0x2f6c9673_u32, 0x7b26_u16, 0x42de_u16, StaticArray[0x8e_u8, 0xb0_u8, 0x91_u8, 0x5d_u8, 0xcd_u8, 0x2a_u8, 0x4f_u8, 0x4c_u8])
  struct IFaxInboundRoutingExtensions
    lpVtbl : IFaxInboundRoutingExtensionsVTbl*
  end

  struct IFaxInboundRoutingExtensionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_friendly_name : UInt64
    get_image_name : UInt64
    get_unique_name : UInt64
    get_major_version : UInt64
    get_minor_version : UInt64
    get_major_build : UInt64
    get_minor_build : UInt64
    get_debug : UInt64
    get_status : UInt64
    get_init_error_code : UInt64
    get_methods : UInt64
  end

  IFaxInboundRoutingExtension_GUID = "885b5e08-c26c-4ef9-af83-51580a750be1"
  IID_IFaxInboundRoutingExtension = LibC::GUID.new(0x885b5e08_u32, 0xc26c_u16, 0x4ef9_u16, StaticArray[0xaf_u8, 0x83_u8, 0x51_u8, 0x58_u8, 0xa_u8, 0x75_u8, 0xb_u8, 0xe1_u8])
  struct IFaxInboundRoutingExtension
    lpVtbl : IFaxInboundRoutingExtensionVTbl*
  end

  struct IFaxInboundRoutingMethodsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
  end

  IFaxInboundRoutingMethods_GUID = "783fca10-8908-4473-9d69-f67fbea0c6b9"
  IID_IFaxInboundRoutingMethods = LibC::GUID.new(0x783fca10_u32, 0x8908_u16, 0x4473_u16, StaticArray[0x9d_u8, 0x69_u8, 0xf6_u8, 0x7f_u8, 0xbe_u8, 0xa0_u8, 0xc6_u8, 0xb9_u8])
  struct IFaxInboundRoutingMethods
    lpVtbl : IFaxInboundRoutingMethodsVTbl*
  end

  struct IFaxInboundRoutingMethodVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_guid : UInt64
    get_function_name : UInt64
    get_extension_friendly_name : UInt64
    get_extension_image_name : UInt64
    get_priority : UInt64
    put_priority : UInt64
    refresh : UInt64
    save : UInt64
  end

  IFaxInboundRoutingMethod_GUID = "45700061-ad9d-4776-a8c4-64065492cf4b"
  IID_IFaxInboundRoutingMethod = LibC::GUID.new(0x45700061_u32, 0xad9d_u16, 0x4776_u16, StaticArray[0xa8_u8, 0xc4_u8, 0x64_u8, 0x6_u8, 0x54_u8, 0x92_u8, 0xcf_u8, 0x4b_u8])
  struct IFaxInboundRoutingMethod
    lpVtbl : IFaxInboundRoutingMethodVTbl*
  end

  struct IFaxDocument2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_body : UInt64
    put_body : UInt64
    get_sender : UInt64
    get_recipients : UInt64
    get_cover_page : UInt64
    put_cover_page : UInt64
    get_subject : UInt64
    put_subject : UInt64
    get_note : UInt64
    put_note : UInt64
    get_schedule_time : UInt64
    put_schedule_time : UInt64
    get_receipt_address : UInt64
    put_receipt_address : UInt64
    get_document_name : UInt64
    put_document_name : UInt64
    get_call_handle : UInt64
    put_call_handle : UInt64
    get_cover_page_type : UInt64
    put_cover_page_type : UInt64
    get_schedule_type : UInt64
    put_schedule_type : UInt64
    get_receipt_type : UInt64
    put_receipt_type : UInt64
    get_group_broadcast_receipts : UInt64
    put_group_broadcast_receipts : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_tapi_connection : UInt64
    putref_tapi_connection : UInt64
    submit : UInt64
    connected_submit : UInt64
    get_attach_fax_to_receipt : UInt64
    put_attach_fax_to_receipt : UInt64
    get_submission_id : UInt64
    get_bodies : UInt64
    put_bodies : UInt64
    submit2 : UInt64
    connected_submit2 : UInt64
  end

  IFaxDocument2_GUID = "e1347661-f9ef-4d6d-b4a5-c0a068b65cff"
  IID_IFaxDocument2 = LibC::GUID.new(0xe1347661_u32, 0xf9ef_u16, 0x4d6d_u16, StaticArray[0xb4_u8, 0xa5_u8, 0xc0_u8, 0xa0_u8, 0x68_u8, 0xb6_u8, 0x5c_u8, 0xff_u8])
  struct IFaxDocument2
    lpVtbl : IFaxDocument2VTbl*
  end

  struct IFaxConfigurationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_use_archive : UInt64
    put_use_archive : UInt64
    get_archive_location : UInt64
    put_archive_location : UInt64
    get_size_quota_warning : UInt64
    put_size_quota_warning : UInt64
    get_high_quota_water_mark : UInt64
    put_high_quota_water_mark : UInt64
    get_low_quota_water_mark : UInt64
    put_low_quota_water_mark : UInt64
    get_archive_age_limit : UInt64
    put_archive_age_limit : UInt64
    get_archive_size_low : UInt64
    get_archive_size_high : UInt64
    get_outgoing_queue_blocked : UInt64
    put_outgoing_queue_blocked : UInt64
    get_outgoing_queue_paused : UInt64
    put_outgoing_queue_paused : UInt64
    get_allow_personal_cover_pages : UInt64
    put_allow_personal_cover_pages : UInt64
    get_use_device_tsid : UInt64
    put_use_device_tsid : UInt64
    get_retries : UInt64
    put_retries : UInt64
    get_retry_delay : UInt64
    put_retry_delay : UInt64
    get_discount_rate_start : UInt64
    put_discount_rate_start : UInt64
    get_discount_rate_end : UInt64
    put_discount_rate_end : UInt64
    get_outgoing_queue_age_limit : UInt64
    put_outgoing_queue_age_limit : UInt64
    get_branding : UInt64
    put_branding : UInt64
    get_incoming_queue_blocked : UInt64
    put_incoming_queue_blocked : UInt64
    get_auto_create_account_on_connect : UInt64
    put_auto_create_account_on_connect : UInt64
    get_incoming_faxes_are_public : UInt64
    put_incoming_faxes_are_public : UInt64
    refresh : UInt64
    save : UInt64
  end

  IFaxConfiguration_GUID = "10f4d0f7-0994-4543-ab6e-506949128c40"
  IID_IFaxConfiguration = LibC::GUID.new(0x10f4d0f7_u32, 0x994_u16, 0x4543_u16, StaticArray[0xab_u8, 0x6e_u8, 0x50_u8, 0x69_u8, 0x49_u8, 0x12_u8, 0x8c_u8, 0x40_u8])
  struct IFaxConfiguration
    lpVtbl : IFaxConfigurationVTbl*
  end

  struct IFaxServer2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    connect : UInt64
    get_server_name : UInt64
    get_device_providers : UInt64
    get_devices : UInt64
    get_inbound_routing : UInt64
    get_folders : UInt64
    get_logging_options : UInt64
    get_major_version : UInt64
    get_minor_version : UInt64
    get_major_build : UInt64
    get_minor_build : UInt64
    get_debug : UInt64
    get_activity : UInt64
    get_outbound_routing : UInt64
    get_receipt_options : UInt64
    get_security : UInt64
    disconnect : UInt64
    get_extension_property : UInt64
    set_extension_property : UInt64
    listen_to_server_events : UInt64
    register_device_provider : UInt64
    unregister_device_provider : UInt64
    register_inbound_routing_extension : UInt64
    unregister_inbound_routing_extension : UInt64
    get_registered_events : UInt64
    get_api_version : UInt64
    get_configuration : UInt64
    get_current_account : UInt64
    get_fax_account_set : UInt64
    get_security2 : UInt64
  end

  IFaxServer2_GUID = "571ced0f-5609-4f40-9176-547e3a72ca7c"
  IID_IFaxServer2 = LibC::GUID.new(0x571ced0f_u32, 0x5609_u16, 0x4f40_u16, StaticArray[0x91_u8, 0x76_u8, 0x54_u8, 0x7e_u8, 0x3a_u8, 0x72_u8, 0xca_u8, 0x7c_u8])
  struct IFaxServer2
    lpVtbl : IFaxServer2VTbl*
  end

  struct IFaxAccountSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_accounts : UInt64
    get_account : UInt64
    add_account : UInt64
    remove_account : UInt64
  end

  IFaxAccountSet_GUID = "7428fbae-841e-47b8-86f4-2288946dca1b"
  IID_IFaxAccountSet = LibC::GUID.new(0x7428fbae_u32, 0x841e_u16, 0x47b8_u16, StaticArray[0x86_u8, 0xf4_u8, 0x22_u8, 0x88_u8, 0x94_u8, 0x6d_u8, 0xca_u8, 0x1b_u8])
  struct IFaxAccountSet
    lpVtbl : IFaxAccountSetVTbl*
  end

  struct IFaxAccountsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
  end

  IFaxAccounts_GUID = "93ea8162-8be7-42d1-ae7b-ec74e2d989da"
  IID_IFaxAccounts = LibC::GUID.new(0x93ea8162_u32, 0x8be7_u16, 0x42d1_u16, StaticArray[0xae_u8, 0x7b_u8, 0xec_u8, 0x74_u8, 0xe2_u8, 0xd9_u8, 0x89_u8, 0xda_u8])
  struct IFaxAccounts
    lpVtbl : IFaxAccountsVTbl*
  end

  struct IFaxAccountVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_account_name : UInt64
    get_folders : UInt64
    listen_to_account_events : UInt64
    get_registered_events : UInt64
  end

  IFaxAccount_GUID = "68535b33-5dc4-4086-be26-b76f9b711006"
  IID_IFaxAccount = LibC::GUID.new(0x68535b33_u32, 0x5dc4_u16, 0x4086_u16, StaticArray[0xbe_u8, 0x26_u8, 0xb7_u8, 0x6f_u8, 0x9b_u8, 0x71_u8, 0x10_u8, 0x6_u8])
  struct IFaxAccount
    lpVtbl : IFaxAccountVTbl*
  end

  struct IFaxOutgoingJob2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_subject : UInt64
    get_document_name : UInt64
    get_pages : UInt64
    get_size : UInt64
    get_submission_id : UInt64
    get_id : UInt64
    get_original_scheduled_time : UInt64
    get_submission_time : UInt64
    get_receipt_type : UInt64
    get_priority : UInt64
    get_sender : UInt64
    get_recipient : UInt64
    get_current_page : UInt64
    get_device_id : UInt64
    get_status : UInt64
    get_extended_status_code : UInt64
    get_extended_status : UInt64
    get_available_operations : UInt64
    get_retries : UInt64
    get_scheduled_time : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    get_group_broadcast_receipts : UInt64
    pause : UInt64
    resume : UInt64
    restart : UInt64
    copy_tiff : UInt64
    refresh : UInt64
    cancel : UInt64
    get_has_cover_page : UInt64
    get_receipt_address : UInt64
    get_schedule_type : UInt64
  end

  IFaxOutgoingJob2_GUID = "418a8d96-59a0-4789-b176-edf3dc8fa8f7"
  IID_IFaxOutgoingJob2 = LibC::GUID.new(0x418a8d96_u32, 0x59a0_u16, 0x4789_u16, StaticArray[0xb1_u8, 0x76_u8, 0xed_u8, 0xf3_u8, 0xdc_u8, 0x8f_u8, 0xa8_u8, 0xf7_u8])
  struct IFaxOutgoingJob2
    lpVtbl : IFaxOutgoingJob2VTbl*
  end

  struct IFaxAccountFoldersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_outgoing_queue : UInt64
    get_incoming_queue : UInt64
    get_incoming_archive : UInt64
    get_outgoing_archive : UInt64
  end

  IFaxAccountFolders_GUID = "6463f89d-23d8-46a9-8f86-c47b77ca7926"
  IID_IFaxAccountFolders = LibC::GUID.new(0x6463f89d_u32, 0x23d8_u16, 0x46a9_u16, StaticArray[0x8f_u8, 0x86_u8, 0xc4_u8, 0x7b_u8, 0x77_u8, 0xca_u8, 0x79_u8, 0x26_u8])
  struct IFaxAccountFolders
    lpVtbl : IFaxAccountFoldersVTbl*
  end

  struct IFaxAccountIncomingQueueVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_jobs : UInt64
    get_job : UInt64
  end

  IFaxAccountIncomingQueue_GUID = "dd142d92-0186-4a95-a090-cbc3eadba6b4"
  IID_IFaxAccountIncomingQueue = LibC::GUID.new(0xdd142d92_u32, 0x186_u16, 0x4a95_u16, StaticArray[0xa0_u8, 0x90_u8, 0xcb_u8, 0xc3_u8, 0xea_u8, 0xdb_u8, 0xa6_u8, 0xb4_u8])
  struct IFaxAccountIncomingQueue
    lpVtbl : IFaxAccountIncomingQueueVTbl*
  end

  struct IFaxAccountOutgoingQueueVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_jobs : UInt64
    get_job : UInt64
  end

  IFaxAccountOutgoingQueue_GUID = "0f1424e9-f22d-4553-b7a5-0d24bd0d7e46"
  IID_IFaxAccountOutgoingQueue = LibC::GUID.new(0xf1424e9_u32, 0xf22d_u16, 0x4553_u16, StaticArray[0xb7_u8, 0xa5_u8, 0xd_u8, 0x24_u8, 0xbd_u8, 0xd_u8, 0x7e_u8, 0x46_u8])
  struct IFaxAccountOutgoingQueue
    lpVtbl : IFaxAccountOutgoingQueueVTbl*
  end

  struct IFaxOutgoingMessage2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_submission_id : UInt64
    get_id : UInt64
    get_subject : UInt64
    get_document_name : UInt64
    get_retries : UInt64
    get_pages : UInt64
    get_size : UInt64
    get_original_scheduled_time : UInt64
    get_submission_time : UInt64
    get_priority : UInt64
    get_sender : UInt64
    get_recipient : UInt64
    get_device_name : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    copy_tiff : UInt64
    delete : UInt64
    get_has_cover_page : UInt64
    get_receipt_type : UInt64
    get_receipt_address : UInt64
    get_read : UInt64
    put_read : UInt64
    save : UInt64
    refresh : UInt64
  end

  IFaxOutgoingMessage2_GUID = "b37df687-bc88-4b46-b3be-b458b3ea9e7f"
  IID_IFaxOutgoingMessage2 = LibC::GUID.new(0xb37df687_u32, 0xbc88_u16, 0x4b46_u16, StaticArray[0xb3_u8, 0xbe_u8, 0xb4_u8, 0x58_u8, 0xb3_u8, 0xea_u8, 0x9e_u8, 0x7f_u8])
  struct IFaxOutgoingMessage2
    lpVtbl : IFaxOutgoingMessage2VTbl*
  end

  struct IFaxAccountIncomingArchiveVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_size_low : UInt64
    get_size_high : UInt64
    refresh : UInt64
    get_messages : UInt64
    get_message : UInt64
  end

  IFaxAccountIncomingArchive_GUID = "a8a5b6ef-e0d6-4aee-955c-91625bec9db4"
  IID_IFaxAccountIncomingArchive = LibC::GUID.new(0xa8a5b6ef_u32, 0xe0d6_u16, 0x4aee_u16, StaticArray[0x95_u8, 0x5c_u8, 0x91_u8, 0x62_u8, 0x5b_u8, 0xec_u8, 0x9d_u8, 0xb4_u8])
  struct IFaxAccountIncomingArchive
    lpVtbl : IFaxAccountIncomingArchiveVTbl*
  end

  struct IFaxAccountOutgoingArchiveVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_size_low : UInt64
    get_size_high : UInt64
    refresh : UInt64
    get_messages : UInt64
    get_message : UInt64
  end

  IFaxAccountOutgoingArchive_GUID = "5463076d-ec14-491f-926e-b3ceda5e5662"
  IID_IFaxAccountOutgoingArchive = LibC::GUID.new(0x5463076d_u32, 0xec14_u16, 0x491f_u16, StaticArray[0x92_u8, 0x6e_u8, 0xb3_u8, 0xce_u8, 0xda_u8, 0x5e_u8, 0x56_u8, 0x62_u8])
  struct IFaxAccountOutgoingArchive
    lpVtbl : IFaxAccountOutgoingArchiveVTbl*
  end

  struct IFaxSecurity2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_descriptor : UInt64
    put_descriptor : UInt64
    get_granted_rights : UInt64
    refresh : UInt64
    save : UInt64
    get_information_type : UInt64
    put_information_type : UInt64
  end

  IFaxSecurity2_GUID = "17d851f4-d09b-48fc-99c9-8f24c4db9ab1"
  IID_IFaxSecurity2 = LibC::GUID.new(0x17d851f4_u32, 0xd09b_u16, 0x48fc_u16, StaticArray[0x99_u8, 0xc9_u8, 0x8f_u8, 0x24_u8, 0xc4_u8, 0xdb_u8, 0x9a_u8, 0xb1_u8])
  struct IFaxSecurity2
    lpVtbl : IFaxSecurity2VTbl*
  end

  struct IFaxIncomingMessage2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_pages : UInt64
    get_size : UInt64
    get_device_name : UInt64
    get_retries : UInt64
    get_transmission_start : UInt64
    get_transmission_end : UInt64
    get_csid : UInt64
    get_tsid : UInt64
    get_caller_id : UInt64
    get_routing_information : UInt64
    copy_tiff : UInt64
    delete : UInt64
    get_subject : UInt64
    put_subject : UInt64
    get_sender_name : UInt64
    put_sender_name : UInt64
    get_sender_fax_number : UInt64
    put_sender_fax_number : UInt64
    get_has_cover_page : UInt64
    put_has_cover_page : UInt64
    get_recipients : UInt64
    put_recipients : UInt64
    get_was_re_assigned : UInt64
    get_read : UInt64
    put_read : UInt64
    re_assign : UInt64
    save : UInt64
    refresh : UInt64
  end

  IFaxIncomingMessage2_GUID = "f9208503-e2bc-48f3-9ec0-e6236f9b509a"
  IID_IFaxIncomingMessage2 = LibC::GUID.new(0xf9208503_u32, 0xe2bc_u16, 0x48f3_u16, StaticArray[0x9e_u8, 0xc0_u8, 0xe6_u8, 0x23_u8, 0x6f_u8, 0x9b_u8, 0x50_u8, 0x9a_u8])
  struct IFaxIncomingMessage2
    lpVtbl : IFaxIncomingMessage2VTbl*
  end

  struct IFaxServerNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IFaxServerNotify_GUID = "2e037b27-cf8a-4abd-b1e0-5704943bea6f"
  IID_IFaxServerNotify = LibC::GUID.new(0x2e037b27_u32, 0xcf8a_u16, 0x4abd_u16, StaticArray[0xb1_u8, 0xe0_u8, 0x57_u8, 0x4_u8, 0x94_u8, 0x3b_u8, 0xea_u8, 0x6f_u8])
  struct IFaxServerNotify
    lpVtbl : IFaxServerNotifyVTbl*
  end

  struct IIFaxServerNotify2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    on_incoming_job_added : UInt64
    on_incoming_job_removed : UInt64
    on_incoming_job_changed : UInt64
    on_outgoing_job_added : UInt64
    on_outgoing_job_removed : UInt64
    on_outgoing_job_changed : UInt64
    on_incoming_message_added : UInt64
    on_incoming_message_removed : UInt64
    on_outgoing_message_added : UInt64
    on_outgoing_message_removed : UInt64
    on_receipt_options_change : UInt64
    on_activity_logging_config_change : UInt64
    on_security_config_change : UInt64
    on_event_logging_config_change : UInt64
    on_outgoing_queue_config_change : UInt64
    on_outgoing_archive_config_change : UInt64
    on_incoming_archive_config_change : UInt64
    on_devices_config_change : UInt64
    on_outbound_routing_groups_config_change : UInt64
    on_outbound_routing_rules_config_change : UInt64
    on_server_activity_change : UInt64
    on_queues_status_change : UInt64
    on_new_call : UInt64
    on_server_shut_down : UInt64
    on_device_status_change : UInt64
    on_general_server_config_changed : UInt64
  end

  IIFaxServerNotify2_GUID = "ec9c69b9-5fe7-4805-9467-82fcd96af903"
  IID_IIFaxServerNotify2 = LibC::GUID.new(0xec9c69b9_u32, 0x5fe7_u16, 0x4805_u16, StaticArray[0x94_u8, 0x67_u8, 0x82_u8, 0xfc_u8, 0xd9_u8, 0x6a_u8, 0xf9_u8, 0x3_u8])
  struct IIFaxServerNotify2
    lpVtbl : IIFaxServerNotify2VTbl*
  end

  struct IFaxServerNotify2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IFaxServerNotify2_GUID = "616ca8d6-a77a-4062-abfd-0e471241c7aa"
  IID_IFaxServerNotify2 = LibC::GUID.new(0x616ca8d6_u32, 0xa77a_u16, 0x4062_u16, StaticArray[0xab_u8, 0xfd_u8, 0xe_u8, 0x47_u8, 0x12_u8, 0x41_u8, 0xc7_u8, 0xaa_u8])
  struct IFaxServerNotify2
    lpVtbl : IFaxServerNotify2VTbl*
  end

  struct IIFaxAccountNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    on_incoming_job_added : UInt64
    on_incoming_job_removed : UInt64
    on_incoming_job_changed : UInt64
    on_outgoing_job_added : UInt64
    on_outgoing_job_removed : UInt64
    on_outgoing_job_changed : UInt64
    on_incoming_message_added : UInt64
    on_incoming_message_removed : UInt64
    on_outgoing_message_added : UInt64
    on_outgoing_message_removed : UInt64
    on_server_shut_down : UInt64
  end

  IIFaxAccountNotify_GUID = "b9b3bc81-ac1b-46f3-b39d-0adc30e1b788"
  IID_IIFaxAccountNotify = LibC::GUID.new(0xb9b3bc81_u32, 0xac1b_u16, 0x46f3_u16, StaticArray[0xb3_u8, 0x9d_u8, 0xa_u8, 0xdc_u8, 0x30_u8, 0xe1_u8, 0xb7_u8, 0x88_u8])
  struct IIFaxAccountNotify
    lpVtbl : IIFaxAccountNotifyVTbl*
  end

  struct IFaxAccountNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IFaxAccountNotify_GUID = "0b5e5bd1-b8a9-47a0-a323-ef4a293ba06a"
  IID_IFaxAccountNotify = LibC::GUID.new(0xb5e5bd1_u32, 0xb8a9_u16, 0x47a0_u16, StaticArray[0xa3_u8, 0x23_u8, 0xef_u8, 0x4a_u8, 0x29_u8, 0x3b_u8, 0xa0_u8, 0x6a_u8])
  struct IFaxAccountNotify
    lpVtbl : IFaxAccountNotifyVTbl*
  end

  struct IStillImageWVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_device_list : UInt64
    get_device_info : UInt64
    create_device : UInt64
    get_device_value : UInt64
    set_device_value : UInt64
    get_sti_launch_information : UInt64
    register_launch_application : UInt64
    unregister_launch_application : UInt64
    enable_hw_notifications : UInt64
    get_hw_notification_state : UInt64
    refresh_device_bus : UInt64
    launch_application_for_device : UInt64
    setup_device_parameters : UInt64
    write_to_error_log : UInt64
  end

  IStillImageW_GUID = "641bd880-2dc8-11d0-90ea-00aa0060f86c"
  IID_IStillImageW = LibC::GUID.new(0x641bd880_u32, 0x2dc8_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
  struct IStillImageW
    lpVtbl : IStillImageWVTbl*
  end

  struct IStiDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_capabilities : UInt64
    get_status : UInt64
    device_reset : UInt64
    diagnostic : UInt64
    escape : UInt64
    get_last_error : UInt64
    lock_device : UInt64
    un_lock_device : UInt64
    raw_read_data : UInt64
    raw_write_data : UInt64
    raw_read_command : UInt64
    raw_write_command : UInt64
    subscribe : UInt64
    get_last_notification_data : UInt64
    un_subscribe : UInt64
    get_last_error_info : UInt64
  end

  IStiDevice_GUID = "6cfa5a80-2dc8-11d0-90ea-00aa0060f86c"
  IID_IStiDevice = LibC::GUID.new(0x6cfa5a80_u32, 0x2dc8_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
  struct IStiDevice
    lpVtbl : IStiDeviceVTbl*
  end

  struct IStiDeviceControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    raw_read_data : UInt64
    raw_write_data : UInt64
    raw_read_command : UInt64
    raw_write_command : UInt64
    raw_device_control : UInt64
    get_last_error : UInt64
    get_my_device_port_name : UInt64
    get_my_device_handle : UInt64
    get_my_device_open_mode : UInt64
    write_to_error_log : UInt64
  end

  IStiDeviceControl_GUID = "128a9860-52dc-11d0-9edf-444553540000"
  IID_IStiDeviceControl = LibC::GUID.new(0x128a9860_u32, 0x52dc_u16, 0x11d0_u16, StaticArray[0x9e_u8, 0xdf_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
  struct IStiDeviceControl
    lpVtbl : IStiDeviceControlVTbl*
  end

  struct IStiUSDVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_capabilities : UInt64
    get_status : UInt64
    device_reset : UInt64
    diagnostic : UInt64
    escape : UInt64
    get_last_error : UInt64
    lock_device : UInt64
    un_lock_device : UInt64
    raw_read_data : UInt64
    raw_write_data : UInt64
    raw_read_command : UInt64
    raw_write_command : UInt64
    set_notification_handle : UInt64
    get_notification_data : UInt64
    get_last_error_info : UInt64
  end

  IStiUSD_GUID = "0c9bb460-51ac-11d0-90ea-00aa0060f86c"
  IID_IStiUSD = LibC::GUID.new(0xc9bb460_u32, 0x51ac_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
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
  fun FaxFreeBuffer(buffer : Void*) : Void

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
struct LibWin32::IFaxJobStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status(pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_JOB_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_pages(plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.unsafe_as(Proc(Int32*, HRESULT)).call(plpages)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_current_page(plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.unsafe_as(Proc(Int32*, HRESULT)).call(plcurrentpage)
  end
  def get_device_id(pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(Int32*, HRESULT)).call(pldeviceid)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def get_extended_status_code(pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.unsafe_as(Proc(FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)).call(pextendedstatuscode)
  end
  def get_extended_status(pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextendedstatus)
  end
  def get_available_operations(pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.unsafe_as(Proc(FAX_JOB_OPERATIONS_ENUM*, HRESULT)).call(pavailableoperations)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_job_type(pjobtype : FAX_JOB_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_job_type.unsafe_as(Proc(FAX_JOB_TYPE_ENUM*, HRESULT)).call(pjobtype)
  end
  def get_scheduled_time(pdatescheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_scheduled_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatescheduledtime)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_caller_id(pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcallerid)
  end
  def get_routing_information(pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrroutinginformation)
  end
end
struct LibWin32::IFaxServer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect(bstrservername : UInt8*) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrservername)
  end
  def get_server_name(pbstrservername : UInt8**) : HRESULT
    @lpVtbl.value.get_server_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrservername)
  end
  def get_device_providers(ppfaxdeviceproviders : IFaxDeviceProviders*) : HRESULT
    @lpVtbl.value.get_device_providers.unsafe_as(Proc(IFaxDeviceProviders*, HRESULT)).call(ppfaxdeviceproviders)
  end
  def get_devices(ppfaxdevices : IFaxDevices*) : HRESULT
    @lpVtbl.value.get_devices.unsafe_as(Proc(IFaxDevices*, HRESULT)).call(ppfaxdevices)
  end
  def get_inbound_routing(ppfaxinboundrouting : IFaxInboundRouting*) : HRESULT
    @lpVtbl.value.get_inbound_routing.unsafe_as(Proc(IFaxInboundRouting*, HRESULT)).call(ppfaxinboundrouting)
  end
  def get_folders(pfaxfolders : IFaxFolders*) : HRESULT
    @lpVtbl.value.get_folders.unsafe_as(Proc(IFaxFolders*, HRESULT)).call(pfaxfolders)
  end
  def get_logging_options(ppfaxloggingoptions : IFaxLoggingOptions*) : HRESULT
    @lpVtbl.value.get_logging_options.unsafe_as(Proc(IFaxLoggingOptions*, HRESULT)).call(ppfaxloggingoptions)
  end
  def get_major_version(plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorversion)
  end
  def get_minor_version(plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(plminorversion)
  end
  def get_major_build(plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorbuild)
  end
  def get_minor_build(plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.unsafe_as(Proc(Int32*, HRESULT)).call(plminorbuild)
  end
  def get_debug(pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.unsafe_as(Proc(Int16*, HRESULT)).call(pbdebug)
  end
  def get_activity(ppfaxactivity : IFaxActivity*) : HRESULT
    @lpVtbl.value.get_activity.unsafe_as(Proc(IFaxActivity*, HRESULT)).call(ppfaxactivity)
  end
  def get_outbound_routing(ppfaxoutboundrouting : IFaxOutboundRouting*) : HRESULT
    @lpVtbl.value.get_outbound_routing.unsafe_as(Proc(IFaxOutboundRouting*, HRESULT)).call(ppfaxoutboundrouting)
  end
  def get_receipt_options(ppfaxreceiptoptions : IFaxReceiptOptions*) : HRESULT
    @lpVtbl.value.get_receipt_options.unsafe_as(Proc(IFaxReceiptOptions*, HRESULT)).call(ppfaxreceiptoptions)
  end
  def get_security(ppfaxsecurity : IFaxSecurity*) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(IFaxSecurity*, HRESULT)).call(ppfaxsecurity)
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def get_extension_property(bstrguid : UInt8*, pvproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrguid, pvproperty)
  end
  def set_extension_property(bstrguid : UInt8*, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_extension_property.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(bstrguid, vproperty)
  end
  def listen_to_server_events(eventtypes : FAX_SERVER_EVENTS_TYPE_ENUM) : HRESULT
    @lpVtbl.value.listen_to_server_events.unsafe_as(Proc(FAX_SERVER_EVENTS_TYPE_ENUM, HRESULT)).call(eventtypes)
  end
  def register_device_provider(bstrguid : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, tspname : UInt8*, lfspiversion : Int32) : HRESULT
    @lpVtbl.value.register_device_provider.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, Int32, HRESULT)).call(bstrguid, bstrfriendlyname, bstrimagename, tspname, lfspiversion)
  end
  def unregister_device_provider(bstruniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_device_provider.unsafe_as(Proc(UInt8*, HRESULT)).call(bstruniquename)
  end
  def register_inbound_routing_extension(bstrextensionname : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, vmethods : VARIANT) : HRESULT
    @lpVtbl.value.register_inbound_routing_extension.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)).call(bstrextensionname, bstrfriendlyname, bstrimagename, vmethods)
  end
  def unregister_inbound_routing_extension(bstrextensionuniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_inbound_routing_extension.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrextensionuniquename)
  end
  def get_registered_events(peventtypes : FAX_SERVER_EVENTS_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_registered_events.unsafe_as(Proc(FAX_SERVER_EVENTS_TYPE_ENUM*, HRESULT)).call(peventtypes)
  end
  def get_api_version(papiversion : FAX_SERVER_APIVERSION_ENUM*) : HRESULT
    @lpVtbl.value.get_api_version.unsafe_as(Proc(FAX_SERVER_APIVERSION_ENUM*, HRESULT)).call(papiversion)
  end
end
struct LibWin32::IFaxDeviceProviders
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxdeviceprovider : IFaxDeviceProvider*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxDeviceProvider*, HRESULT)).call(vindex, pfaxdeviceprovider)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
end
struct LibWin32::IFaxDevices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxdevice : IFaxDevice*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxDevice*, HRESULT)).call(vindex, pfaxdevice)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_item_by_id(lid : Int32, ppfaxdevice : IFaxDevice*) : HRESULT
    @lpVtbl.value.get_item_by_id.unsafe_as(Proc(Int32, IFaxDevice*, HRESULT)).call(lid, ppfaxdevice)
  end
end
struct LibWin32::IFaxInboundRouting
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_extensions(pfaxinboundroutingextensions : IFaxInboundRoutingExtensions*) : HRESULT
    @lpVtbl.value.get_extensions.unsafe_as(Proc(IFaxInboundRoutingExtensions*, HRESULT)).call(pfaxinboundroutingextensions)
  end
  def get_methods(pfaxinboundroutingmethods : IFaxInboundRoutingMethods*) : HRESULT
    @lpVtbl.value.get_methods.unsafe_as(Proc(IFaxInboundRoutingMethods*, HRESULT)).call(pfaxinboundroutingmethods)
  end
end
struct LibWin32::IFaxFolders
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_outgoing_queue(pfaxoutgoingqueue : IFaxOutgoingQueue*) : HRESULT
    @lpVtbl.value.get_outgoing_queue.unsafe_as(Proc(IFaxOutgoingQueue*, HRESULT)).call(pfaxoutgoingqueue)
  end
  def get_incoming_queue(pfaxincomingqueue : IFaxIncomingQueue*) : HRESULT
    @lpVtbl.value.get_incoming_queue.unsafe_as(Proc(IFaxIncomingQueue*, HRESULT)).call(pfaxincomingqueue)
  end
  def get_incoming_archive(pfaxincomingarchive : IFaxIncomingArchive*) : HRESULT
    @lpVtbl.value.get_incoming_archive.unsafe_as(Proc(IFaxIncomingArchive*, HRESULT)).call(pfaxincomingarchive)
  end
  def get_outgoing_archive(pfaxoutgoingarchive : IFaxOutgoingArchive*) : HRESULT
    @lpVtbl.value.get_outgoing_archive.unsafe_as(Proc(IFaxOutgoingArchive*, HRESULT)).call(pfaxoutgoingarchive)
  end
end
struct LibWin32::IFaxLoggingOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_logging(pfaxeventlogging : IFaxEventLogging*) : HRESULT
    @lpVtbl.value.get_event_logging.unsafe_as(Proc(IFaxEventLogging*, HRESULT)).call(pfaxeventlogging)
  end
  def get_activity_logging(pfaxactivitylogging : IFaxActivityLogging*) : HRESULT
    @lpVtbl.value.get_activity_logging.unsafe_as(Proc(IFaxActivityLogging*, HRESULT)).call(pfaxactivitylogging)
  end
end
struct LibWin32::IFaxActivity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_incoming_messages(plincomingmessages : Int32*) : HRESULT
    @lpVtbl.value.get_incoming_messages.unsafe_as(Proc(Int32*, HRESULT)).call(plincomingmessages)
  end
  def get_routing_messages(plroutingmessages : Int32*) : HRESULT
    @lpVtbl.value.get_routing_messages.unsafe_as(Proc(Int32*, HRESULT)).call(plroutingmessages)
  end
  def get_outgoing_messages(ploutgoingmessages : Int32*) : HRESULT
    @lpVtbl.value.get_outgoing_messages.unsafe_as(Proc(Int32*, HRESULT)).call(ploutgoingmessages)
  end
  def get_queued_messages(plqueuedmessages : Int32*) : HRESULT
    @lpVtbl.value.get_queued_messages.unsafe_as(Proc(Int32*, HRESULT)).call(plqueuedmessages)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxOutboundRouting
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_groups(pfaxoutboundroutinggroups : IFaxOutboundRoutingGroups*) : HRESULT
    @lpVtbl.value.get_groups.unsafe_as(Proc(IFaxOutboundRoutingGroups*, HRESULT)).call(pfaxoutboundroutinggroups)
  end
  def get_rules(pfaxoutboundroutingrules : IFaxOutboundRoutingRules*) : HRESULT
    @lpVtbl.value.get_rules.unsafe_as(Proc(IFaxOutboundRoutingRules*, HRESULT)).call(pfaxoutboundroutingrules)
  end
end
struct LibWin32::IFaxReceiptOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_authentication_type(ptype : FAX_SMTP_AUTHENTICATION_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_authentication_type.unsafe_as(Proc(FAX_SMTP_AUTHENTICATION_TYPE_ENUM*, HRESULT)).call(ptype)
  end
  def put_authentication_type(type : FAX_SMTP_AUTHENTICATION_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_authentication_type.unsafe_as(Proc(FAX_SMTP_AUTHENTICATION_TYPE_ENUM, HRESULT)).call(type)
  end
  def get_smtp_server(pbstrsmtpserver : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_server.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsmtpserver)
  end
  def put_smtp_server(bstrsmtpserver : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_server.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsmtpserver)
  end
  def get_smtp_port(plsmtpport : Int32*) : HRESULT
    @lpVtbl.value.get_smtp_port.unsafe_as(Proc(Int32*, HRESULT)).call(plsmtpport)
  end
  def put_smtp_port(lsmtpport : Int32) : HRESULT
    @lpVtbl.value.put_smtp_port.unsafe_as(Proc(Int32, HRESULT)).call(lsmtpport)
  end
  def get_smtp_sender(pbstrsmtpsender : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_sender.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsmtpsender)
  end
  def put_smtp_sender(bstrsmtpsender : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_sender.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsmtpsender)
  end
  def get_smtp_user(pbstrsmtpuser : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_user.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsmtpuser)
  end
  def put_smtp_user(bstrsmtpuser : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_user.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsmtpuser)
  end
  def get_allowed_receipts(pallowedreceipts : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_allowed_receipts.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM*, HRESULT)).call(pallowedreceipts)
  end
  def put_allowed_receipts(allowedreceipts : FAX_RECEIPT_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_allowed_receipts.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM, HRESULT)).call(allowedreceipts)
  end
  def get_smtp_password(pbstrsmtppassword : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_password.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsmtppassword)
  end
  def put_smtp_password(bstrsmtppassword : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_password.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsmtppassword)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_use_for_inbound_routing(pbuseforinboundrouting : Int16*) : HRESULT
    @lpVtbl.value.get_use_for_inbound_routing.unsafe_as(Proc(Int16*, HRESULT)).call(pbuseforinboundrouting)
  end
  def put_use_for_inbound_routing(buseforinboundrouting : Int16) : HRESULT
    @lpVtbl.value.put_use_for_inbound_routing.unsafe_as(Proc(Int16, HRESULT)).call(buseforinboundrouting)
  end
end
struct LibWin32::IFaxSecurity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_descriptor(pvdescriptor : VARIANT*) : HRESULT
    @lpVtbl.value.get_descriptor.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvdescriptor)
  end
  def put_descriptor(vdescriptor : VARIANT) : HRESULT
    @lpVtbl.value.put_descriptor.unsafe_as(Proc(VARIANT, HRESULT)).call(vdescriptor)
  end
  def get_granted_rights(pgrantedrights : FAX_ACCESS_RIGHTS_ENUM*) : HRESULT
    @lpVtbl.value.get_granted_rights.unsafe_as(Proc(FAX_ACCESS_RIGHTS_ENUM*, HRESULT)).call(pgrantedrights)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_information_type(plinformationtype : Int32*) : HRESULT
    @lpVtbl.value.get_information_type.unsafe_as(Proc(Int32*, HRESULT)).call(plinformationtype)
  end
  def put_information_type(linformationtype : Int32) : HRESULT
    @lpVtbl.value.put_information_type.unsafe_as(Proc(Int32, HRESULT)).call(linformationtype)
  end
end
struct LibWin32::IFaxDocument
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_body(pbstrbody : UInt8**) : HRESULT
    @lpVtbl.value.get_body.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbody)
  end
  def put_body(bstrbody : UInt8*) : HRESULT
    @lpVtbl.value.put_body.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrbody)
  end
  def get_sender(ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.unsafe_as(Proc(IFaxSender*, HRESULT)).call(ppfaxsender)
  end
  def get_recipients(ppfaxrecipients : IFaxRecipients*) : HRESULT
    @lpVtbl.value.get_recipients.unsafe_as(Proc(IFaxRecipients*, HRESULT)).call(ppfaxrecipients)
  end
  def get_cover_page(pbstrcoverpage : UInt8**) : HRESULT
    @lpVtbl.value.get_cover_page.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcoverpage)
  end
  def put_cover_page(bstrcoverpage : UInt8*) : HRESULT
    @lpVtbl.value.put_cover_page.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcoverpage)
  end
  def get_subject(pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubject)
  end
  def put_subject(bstrsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsubject)
  end
  def get_note(pbstrnote : UInt8**) : HRESULT
    @lpVtbl.value.get_note.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrnote)
  end
  def put_note(bstrnote : UInt8*) : HRESULT
    @lpVtbl.value.put_note.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrnote)
  end
  def get_schedule_time(pdatescheduletime : Float64*) : HRESULT
    @lpVtbl.value.get_schedule_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatescheduletime)
  end
  def put_schedule_time(datescheduletime : Float64) : HRESULT
    @lpVtbl.value.put_schedule_time.unsafe_as(Proc(Float64, HRESULT)).call(datescheduletime)
  end
  def get_receipt_address(pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrreceiptaddress)
  end
  def put_receipt_address(bstrreceiptaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_receipt_address.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrreceiptaddress)
  end
  def get_document_name(pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocumentname)
  end
  def put_document_name(bstrdocumentname : UInt8*) : HRESULT
    @lpVtbl.value.put_document_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdocumentname)
  end
  def get_call_handle(plcallhandle : Int32*) : HRESULT
    @lpVtbl.value.get_call_handle.unsafe_as(Proc(Int32*, HRESULT)).call(plcallhandle)
  end
  def put_call_handle(lcallhandle : Int32) : HRESULT
    @lpVtbl.value.put_call_handle.unsafe_as(Proc(Int32, HRESULT)).call(lcallhandle)
  end
  def get_cover_page_type(pcoverpagetype : FAX_COVERPAGE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_cover_page_type.unsafe_as(Proc(FAX_COVERPAGE_TYPE_ENUM*, HRESULT)).call(pcoverpagetype)
  end
  def put_cover_page_type(coverpagetype : FAX_COVERPAGE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_cover_page_type.unsafe_as(Proc(FAX_COVERPAGE_TYPE_ENUM, HRESULT)).call(coverpagetype)
  end
  def get_schedule_type(pscheduletype : FAX_SCHEDULE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_schedule_type.unsafe_as(Proc(FAX_SCHEDULE_TYPE_ENUM*, HRESULT)).call(pscheduletype)
  end
  def put_schedule_type(scheduletype : FAX_SCHEDULE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_schedule_type.unsafe_as(Proc(FAX_SCHEDULE_TYPE_ENUM, HRESULT)).call(scheduletype)
  end
  def get_receipt_type(preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM*, HRESULT)).call(preceipttype)
  end
  def put_receipt_type(receipttype : FAX_RECEIPT_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_receipt_type.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM, HRESULT)).call(receipttype)
  end
  def get_group_broadcast_receipts(pbusegrouping : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.unsafe_as(Proc(Int16*, HRESULT)).call(pbusegrouping)
  end
  def put_group_broadcast_receipts(busegrouping : Int16) : HRESULT
    @lpVtbl.value.put_group_broadcast_receipts.unsafe_as(Proc(Int16, HRESULT)).call(busegrouping)
  end
  def get_priority(ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM*, HRESULT)).call(ppriority)
  end
  def put_priority(priority : FAX_PRIORITY_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM, HRESULT)).call(priority)
  end
  def get_tapi_connection(pptapiconnection : IDispatch*) : HRESULT
    @lpVtbl.value.get_tapi_connection.unsafe_as(Proc(IDispatch*, HRESULT)).call(pptapiconnection)
  end
  def putref_tapi_connection(ptapiconnection : IDispatch) : HRESULT
    @lpVtbl.value.putref_tapi_connection.unsafe_as(Proc(IDispatch, HRESULT)).call(ptapiconnection)
  end
  def submit(bstrfaxservername : UInt8*, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.submit.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrfaxservername, pvfaxoutgoingjobids)
  end
  def connected_submit(pfaxserver : IFaxServer, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.connected_submit.unsafe_as(Proc(IFaxServer, VARIANT*, HRESULT)).call(pfaxserver, pvfaxoutgoingjobids)
  end
  def get_attach_fax_to_receipt(pbattachfax : Int16*) : HRESULT
    @lpVtbl.value.get_attach_fax_to_receipt.unsafe_as(Proc(Int16*, HRESULT)).call(pbattachfax)
  end
  def put_attach_fax_to_receipt(battachfax : Int16) : HRESULT
    @lpVtbl.value.put_attach_fax_to_receipt.unsafe_as(Proc(Int16, HRESULT)).call(battachfax)
  end
end
struct LibWin32::IFaxSender
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_billing_code(pbstrbillingcode : UInt8**) : HRESULT
    @lpVtbl.value.get_billing_code.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbillingcode)
  end
  def put_billing_code(bstrbillingcode : UInt8*) : HRESULT
    @lpVtbl.value.put_billing_code.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrbillingcode)
  end
  def get_city(pbstrcity : UInt8**) : HRESULT
    @lpVtbl.value.get_city.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcity)
  end
  def put_city(bstrcity : UInt8*) : HRESULT
    @lpVtbl.value.put_city.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcity)
  end
  def get_company(pbstrcompany : UInt8**) : HRESULT
    @lpVtbl.value.get_company.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcompany)
  end
  def put_company(bstrcompany : UInt8*) : HRESULT
    @lpVtbl.value.put_company.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcompany)
  end
  def get_country(pbstrcountry : UInt8**) : HRESULT
    @lpVtbl.value.get_country.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcountry)
  end
  def put_country(bstrcountry : UInt8*) : HRESULT
    @lpVtbl.value.put_country.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcountry)
  end
  def get_department(pbstrdepartment : UInt8**) : HRESULT
    @lpVtbl.value.get_department.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdepartment)
  end
  def put_department(bstrdepartment : UInt8*) : HRESULT
    @lpVtbl.value.put_department.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdepartment)
  end
  def get_email(pbstremail : UInt8**) : HRESULT
    @lpVtbl.value.get_email.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstremail)
  end
  def put_email(bstremail : UInt8*) : HRESULT
    @lpVtbl.value.put_email.unsafe_as(Proc(UInt8*, HRESULT)).call(bstremail)
  end
  def get_fax_number(pbstrfaxnumber : UInt8**) : HRESULT
    @lpVtbl.value.get_fax_number.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfaxnumber)
  end
  def put_fax_number(bstrfaxnumber : UInt8*) : HRESULT
    @lpVtbl.value.put_fax_number.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrfaxnumber)
  end
  def get_home_phone(pbstrhomephone : UInt8**) : HRESULT
    @lpVtbl.value.get_home_phone.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrhomephone)
  end
  def put_home_phone(bstrhomephone : UInt8*) : HRESULT
    @lpVtbl.value.put_home_phone.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrhomephone)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def put_name(bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrname)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def put_tsid(bstrtsid : UInt8*) : HRESULT
    @lpVtbl.value.put_tsid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtsid)
  end
  def get_office_phone(pbstrofficephone : UInt8**) : HRESULT
    @lpVtbl.value.get_office_phone.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrofficephone)
  end
  def put_office_phone(bstrofficephone : UInt8*) : HRESULT
    @lpVtbl.value.put_office_phone.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrofficephone)
  end
  def get_office_location(pbstrofficelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_office_location.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrofficelocation)
  end
  def put_office_location(bstrofficelocation : UInt8*) : HRESULT
    @lpVtbl.value.put_office_location.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrofficelocation)
  end
  def get_state(pbstrstate : UInt8**) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstate)
  end
  def put_state(bstrstate : UInt8*) : HRESULT
    @lpVtbl.value.put_state.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrstate)
  end
  def get_street_address(pbstrstreetaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_street_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstreetaddress)
  end
  def put_street_address(bstrstreetaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_street_address.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrstreetaddress)
  end
  def get_title(pbstrtitle : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtitle)
  end
  def put_title(bstrtitle : UInt8*) : HRESULT
    @lpVtbl.value.put_title.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtitle)
  end
  def get_zip_code(pbstrzipcode : UInt8**) : HRESULT
    @lpVtbl.value.get_zip_code.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrzipcode)
  end
  def put_zip_code(bstrzipcode : UInt8*) : HRESULT
    @lpVtbl.value.put_zip_code.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrzipcode)
  end
  def load_default_sender : HRESULT
    @lpVtbl.value.load_default_sender.unsafe_as(Proc(HRESULT)).call
  end
  def save_default_sender : HRESULT
    @lpVtbl.value.save_default_sender.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxRecipient
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_fax_number(pbstrfaxnumber : UInt8**) : HRESULT
    @lpVtbl.value.get_fax_number.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfaxnumber)
  end
  def put_fax_number(bstrfaxnumber : UInt8*) : HRESULT
    @lpVtbl.value.put_fax_number.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrfaxnumber)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def put_name(bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrname)
  end
end
struct LibWin32::IFaxRecipients
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(lindex : Int32, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IFaxRecipient*, HRESULT)).call(lindex, ppfaxrecipient)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def add(bstrfaxnumber : UInt8*, bstrrecipientname : UInt8*, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, UInt8*, IFaxRecipient*, HRESULT)).call(bstrfaxnumber, bstrrecipientname, ppfaxrecipient)
  end
  def remove(lindex : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, HRESULT)).call(lindex)
  end
end
struct LibWin32::IFaxIncomingArchive
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_use_archive(pbusearchive : Int16*) : HRESULT
    @lpVtbl.value.get_use_archive.unsafe_as(Proc(Int16*, HRESULT)).call(pbusearchive)
  end
  def put_use_archive(busearchive : Int16) : HRESULT
    @lpVtbl.value.put_use_archive.unsafe_as(Proc(Int16, HRESULT)).call(busearchive)
  end
  def get_archive_folder(pbstrarchivefolder : UInt8**) : HRESULT
    @lpVtbl.value.get_archive_folder.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrarchivefolder)
  end
  def put_archive_folder(bstrarchivefolder : UInt8*) : HRESULT
    @lpVtbl.value.put_archive_folder.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrarchivefolder)
  end
  def get_size_quota_warning(pbsizequotawarning : Int16*) : HRESULT
    @lpVtbl.value.get_size_quota_warning.unsafe_as(Proc(Int16*, HRESULT)).call(pbsizequotawarning)
  end
  def put_size_quota_warning(bsizequotawarning : Int16) : HRESULT
    @lpVtbl.value.put_size_quota_warning.unsafe_as(Proc(Int16, HRESULT)).call(bsizequotawarning)
  end
  def get_high_quota_water_mark(plhighquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_high_quota_water_mark.unsafe_as(Proc(Int32*, HRESULT)).call(plhighquotawatermark)
  end
  def put_high_quota_water_mark(lhighquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_high_quota_water_mark.unsafe_as(Proc(Int32, HRESULT)).call(lhighquotawatermark)
  end
  def get_low_quota_water_mark(pllowquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_low_quota_water_mark.unsafe_as(Proc(Int32*, HRESULT)).call(pllowquotawatermark)
  end
  def put_low_quota_water_mark(llowquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_low_quota_water_mark.unsafe_as(Proc(Int32, HRESULT)).call(llowquotawatermark)
  end
  def get_age_limit(plagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_age_limit.unsafe_as(Proc(Int32*, HRESULT)).call(plagelimit)
  end
  def put_age_limit(lagelimit : Int32) : HRESULT
    @lpVtbl.value.put_age_limit.unsafe_as(Proc(Int32, HRESULT)).call(lagelimit)
  end
  def get_size_low(plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.unsafe_as(Proc(Int32*, HRESULT)).call(plsizelow)
  end
  def get_size_high(plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.unsafe_as(Proc(Int32*, HRESULT)).call(plsizehigh)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_messages(lprefetchsize : Int32, pfaxincomingmessageiterator : IFaxIncomingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.unsafe_as(Proc(Int32, IFaxIncomingMessageIterator*, HRESULT)).call(lprefetchsize, pfaxincomingmessageiterator)
  end
  def get_message(bstrmessageid : UInt8*, pfaxincomingmessage : IFaxIncomingMessage*) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8*, IFaxIncomingMessage*, HRESULT)).call(bstrmessageid, pfaxincomingmessage)
  end
end
struct LibWin32::IFaxIncomingQueue
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_blocked(pbblocked : Int16*) : HRESULT
    @lpVtbl.value.get_blocked.unsafe_as(Proc(Int16*, HRESULT)).call(pbblocked)
  end
  def put_blocked(bblocked : Int16) : HRESULT
    @lpVtbl.value.put_blocked.unsafe_as(Proc(Int16, HRESULT)).call(bblocked)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_jobs(pfaxincomingjobs : IFaxIncomingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.unsafe_as(Proc(IFaxIncomingJobs*, HRESULT)).call(pfaxincomingjobs)
  end
  def get_job(bstrjobid : UInt8*, pfaxincomingjob : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.get_job.unsafe_as(Proc(UInt8*, IFaxIncomingJob*, HRESULT)).call(bstrjobid, pfaxincomingjob)
  end
end
struct LibWin32::IFaxOutgoingArchive
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_use_archive(pbusearchive : Int16*) : HRESULT
    @lpVtbl.value.get_use_archive.unsafe_as(Proc(Int16*, HRESULT)).call(pbusearchive)
  end
  def put_use_archive(busearchive : Int16) : HRESULT
    @lpVtbl.value.put_use_archive.unsafe_as(Proc(Int16, HRESULT)).call(busearchive)
  end
  def get_archive_folder(pbstrarchivefolder : UInt8**) : HRESULT
    @lpVtbl.value.get_archive_folder.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrarchivefolder)
  end
  def put_archive_folder(bstrarchivefolder : UInt8*) : HRESULT
    @lpVtbl.value.put_archive_folder.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrarchivefolder)
  end
  def get_size_quota_warning(pbsizequotawarning : Int16*) : HRESULT
    @lpVtbl.value.get_size_quota_warning.unsafe_as(Proc(Int16*, HRESULT)).call(pbsizequotawarning)
  end
  def put_size_quota_warning(bsizequotawarning : Int16) : HRESULT
    @lpVtbl.value.put_size_quota_warning.unsafe_as(Proc(Int16, HRESULT)).call(bsizequotawarning)
  end
  def get_high_quota_water_mark(plhighquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_high_quota_water_mark.unsafe_as(Proc(Int32*, HRESULT)).call(plhighquotawatermark)
  end
  def put_high_quota_water_mark(lhighquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_high_quota_water_mark.unsafe_as(Proc(Int32, HRESULT)).call(lhighquotawatermark)
  end
  def get_low_quota_water_mark(pllowquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_low_quota_water_mark.unsafe_as(Proc(Int32*, HRESULT)).call(pllowquotawatermark)
  end
  def put_low_quota_water_mark(llowquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_low_quota_water_mark.unsafe_as(Proc(Int32, HRESULT)).call(llowquotawatermark)
  end
  def get_age_limit(plagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_age_limit.unsafe_as(Proc(Int32*, HRESULT)).call(plagelimit)
  end
  def put_age_limit(lagelimit : Int32) : HRESULT
    @lpVtbl.value.put_age_limit.unsafe_as(Proc(Int32, HRESULT)).call(lagelimit)
  end
  def get_size_low(plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.unsafe_as(Proc(Int32*, HRESULT)).call(plsizelow)
  end
  def get_size_high(plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.unsafe_as(Proc(Int32*, HRESULT)).call(plsizehigh)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_messages(lprefetchsize : Int32, pfaxoutgoingmessageiterator : IFaxOutgoingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.unsafe_as(Proc(Int32, IFaxOutgoingMessageIterator*, HRESULT)).call(lprefetchsize, pfaxoutgoingmessageiterator)
  end
  def get_message(bstrmessageid : UInt8*, pfaxoutgoingmessage : IFaxOutgoingMessage*) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8*, IFaxOutgoingMessage*, HRESULT)).call(bstrmessageid, pfaxoutgoingmessage)
  end
end
struct LibWin32::IFaxOutgoingQueue
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_blocked(pbblocked : Int16*) : HRESULT
    @lpVtbl.value.get_blocked.unsafe_as(Proc(Int16*, HRESULT)).call(pbblocked)
  end
  def put_blocked(bblocked : Int16) : HRESULT
    @lpVtbl.value.put_blocked.unsafe_as(Proc(Int16, HRESULT)).call(bblocked)
  end
  def get_paused(pbpaused : Int16*) : HRESULT
    @lpVtbl.value.get_paused.unsafe_as(Proc(Int16*, HRESULT)).call(pbpaused)
  end
  def put_paused(bpaused : Int16) : HRESULT
    @lpVtbl.value.put_paused.unsafe_as(Proc(Int16, HRESULT)).call(bpaused)
  end
  def get_allow_personal_cover_pages(pballowpersonalcoverpages : Int16*) : HRESULT
    @lpVtbl.value.get_allow_personal_cover_pages.unsafe_as(Proc(Int16*, HRESULT)).call(pballowpersonalcoverpages)
  end
  def put_allow_personal_cover_pages(ballowpersonalcoverpages : Int16) : HRESULT
    @lpVtbl.value.put_allow_personal_cover_pages.unsafe_as(Proc(Int16, HRESULT)).call(ballowpersonalcoverpages)
  end
  def get_use_device_tsid(pbusedevicetsid : Int16*) : HRESULT
    @lpVtbl.value.get_use_device_tsid.unsafe_as(Proc(Int16*, HRESULT)).call(pbusedevicetsid)
  end
  def put_use_device_tsid(busedevicetsid : Int16) : HRESULT
    @lpVtbl.value.put_use_device_tsid.unsafe_as(Proc(Int16, HRESULT)).call(busedevicetsid)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def put_retries(lretries : Int32) : HRESULT
    @lpVtbl.value.put_retries.unsafe_as(Proc(Int32, HRESULT)).call(lretries)
  end
  def get_retry_delay(plretrydelay : Int32*) : HRESULT
    @lpVtbl.value.get_retry_delay.unsafe_as(Proc(Int32*, HRESULT)).call(plretrydelay)
  end
  def put_retry_delay(lretrydelay : Int32) : HRESULT
    @lpVtbl.value.put_retry_delay.unsafe_as(Proc(Int32, HRESULT)).call(lretrydelay)
  end
  def get_discount_rate_start(pdatediscountratestart : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatediscountratestart)
  end
  def put_discount_rate_start(datediscountratestart : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_start.unsafe_as(Proc(Float64, HRESULT)).call(datediscountratestart)
  end
  def get_discount_rate_end(pdatediscountrateend : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatediscountrateend)
  end
  def put_discount_rate_end(datediscountrateend : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_end.unsafe_as(Proc(Float64, HRESULT)).call(datediscountrateend)
  end
  def get_age_limit(plagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_age_limit.unsafe_as(Proc(Int32*, HRESULT)).call(plagelimit)
  end
  def put_age_limit(lagelimit : Int32) : HRESULT
    @lpVtbl.value.put_age_limit.unsafe_as(Proc(Int32, HRESULT)).call(lagelimit)
  end
  def get_branding(pbbranding : Int16*) : HRESULT
    @lpVtbl.value.get_branding.unsafe_as(Proc(Int16*, HRESULT)).call(pbbranding)
  end
  def put_branding(bbranding : Int16) : HRESULT
    @lpVtbl.value.put_branding.unsafe_as(Proc(Int16, HRESULT)).call(bbranding)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_jobs(pfaxoutgoingjobs : IFaxOutgoingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.unsafe_as(Proc(IFaxOutgoingJobs*, HRESULT)).call(pfaxoutgoingjobs)
  end
  def get_job(bstrjobid : UInt8*, pfaxoutgoingjob : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.get_job.unsafe_as(Proc(UInt8*, IFaxOutgoingJob*, HRESULT)).call(bstrjobid, pfaxoutgoingjob)
  end
end
struct LibWin32::IFaxIncomingMessageIterator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_message(pfaxincomingmessage : IFaxIncomingMessage*) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(IFaxIncomingMessage*, HRESULT)).call(pfaxincomingmessage)
  end
  def get_prefetch_size(plprefetchsize : Int32*) : HRESULT
    @lpVtbl.value.get_prefetch_size.unsafe_as(Proc(Int32*, HRESULT)).call(plprefetchsize)
  end
  def put_prefetch_size(lprefetchsize : Int32) : HRESULT
    @lpVtbl.value.put_prefetch_size.unsafe_as(Proc(Int32, HRESULT)).call(lprefetchsize)
  end
  def get_at_eof(pbeof : Int16*) : HRESULT
    @lpVtbl.value.get_at_eof.unsafe_as(Proc(Int16*, HRESULT)).call(pbeof)
  end
  def move_first : HRESULT
    @lpVtbl.value.move_first.unsafe_as(Proc(HRESULT)).call
  end
  def move_next : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxIncomingMessage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_pages(plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.unsafe_as(Proc(Int32*, HRESULT)).call(plpages)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_device_name(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def get_caller_id(pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcallerid)
  end
  def get_routing_information(pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrroutinginformation)
  end
  def copy_tiff(bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtiffpath)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxOutgoingJobs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxoutgoingjob : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxOutgoingJob*, HRESULT)).call(vindex, pfaxoutgoingjob)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
end
struct LibWin32::IFaxOutgoingJob
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_subject(pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubject)
  end
  def get_document_name(pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocumentname)
  end
  def get_pages(plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.unsafe_as(Proc(Int32*, HRESULT)).call(plpages)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_submission_id(pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubmissionid)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_original_scheduled_time(pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdateoriginalscheduledtime)
  end
  def get_submission_time(pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatesubmissiontime)
  end
  def get_receipt_type(preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM*, HRESULT)).call(preceipttype)
  end
  def get_priority(ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM*, HRESULT)).call(ppriority)
  end
  def get_sender(ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.unsafe_as(Proc(IFaxSender*, HRESULT)).call(ppfaxsender)
  end
  def get_recipient(ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.unsafe_as(Proc(IFaxRecipient*, HRESULT)).call(ppfaxrecipient)
  end
  def get_current_page(plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.unsafe_as(Proc(Int32*, HRESULT)).call(plcurrentpage)
  end
  def get_device_id(pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(Int32*, HRESULT)).call(pldeviceid)
  end
  def get_status(pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_JOB_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_extended_status_code(pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.unsafe_as(Proc(FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)).call(pextendedstatuscode)
  end
  def get_extended_status(pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextendedstatus)
  end
  def get_available_operations(pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.unsafe_as(Proc(FAX_JOB_OPERATIONS_ENUM*, HRESULT)).call(pavailableoperations)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_scheduled_time(pdatescheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_scheduled_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatescheduledtime)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def get_group_broadcast_receipts(pbgroupbroadcastreceipts : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.unsafe_as(Proc(Int16*, HRESULT)).call(pbgroupbroadcastreceipts)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def restart : HRESULT
    @lpVtbl.value.restart.unsafe_as(Proc(HRESULT)).call
  end
  def copy_tiff(bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtiffpath)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxOutgoingMessageIterator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_message(pfaxoutgoingmessage : IFaxOutgoingMessage*) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(IFaxOutgoingMessage*, HRESULT)).call(pfaxoutgoingmessage)
  end
  def get_at_eof(pbeof : Int16*) : HRESULT
    @lpVtbl.value.get_at_eof.unsafe_as(Proc(Int16*, HRESULT)).call(pbeof)
  end
  def get_prefetch_size(plprefetchsize : Int32*) : HRESULT
    @lpVtbl.value.get_prefetch_size.unsafe_as(Proc(Int32*, HRESULT)).call(plprefetchsize)
  end
  def put_prefetch_size(lprefetchsize : Int32) : HRESULT
    @lpVtbl.value.put_prefetch_size.unsafe_as(Proc(Int32, HRESULT)).call(lprefetchsize)
  end
  def move_first : HRESULT
    @lpVtbl.value.move_first.unsafe_as(Proc(HRESULT)).call
  end
  def move_next : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxOutgoingMessage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_submission_id(pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubmissionid)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_subject(pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubject)
  end
  def get_document_name(pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocumentname)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_pages(plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.unsafe_as(Proc(Int32*, HRESULT)).call(plpages)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_original_scheduled_time(pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdateoriginalscheduledtime)
  end
  def get_submission_time(pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatesubmissiontime)
  end
  def get_priority(ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM*, HRESULT)).call(ppriority)
  end
  def get_sender(ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.unsafe_as(Proc(IFaxSender*, HRESULT)).call(ppfaxsender)
  end
  def get_recipient(ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.unsafe_as(Proc(IFaxRecipient*, HRESULT)).call(ppfaxrecipient)
  end
  def get_device_name(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def copy_tiff(bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtiffpath)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxIncomingJobs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxincomingjob : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxIncomingJob*, HRESULT)).call(vindex, pfaxincomingjob)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
end
struct LibWin32::IFaxIncomingJob
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_current_page(plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.unsafe_as(Proc(Int32*, HRESULT)).call(plcurrentpage)
  end
  def get_device_id(pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(Int32*, HRESULT)).call(pldeviceid)
  end
  def get_status(pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_JOB_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_extended_status_code(pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.unsafe_as(Proc(FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)).call(pextendedstatuscode)
  end
  def get_extended_status(pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextendedstatus)
  end
  def get_available_operations(pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.unsafe_as(Proc(FAX_JOB_OPERATIONS_ENUM*, HRESULT)).call(pavailableoperations)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def get_caller_id(pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcallerid)
  end
  def get_routing_information(pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrroutinginformation)
  end
  def get_job_type(pjobtype : FAX_JOB_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_job_type.unsafe_as(Proc(FAX_JOB_TYPE_ENUM*, HRESULT)).call(pjobtype)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def copy_tiff(bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtiffpath)
  end
end
struct LibWin32::IFaxDeviceProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_friendly_name(pbstrfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfriendlyname)
  end
  def get_image_name(pbstrimagename : UInt8**) : HRESULT
    @lpVtbl.value.get_image_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrimagename)
  end
  def get_unique_name(pbstruniquename : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruniquename)
  end
  def get_tapi_provider_name(pbstrtapiprovidername : UInt8**) : HRESULT
    @lpVtbl.value.get_tapi_provider_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtapiprovidername)
  end
  def get_major_version(plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorversion)
  end
  def get_minor_version(plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(plminorversion)
  end
  def get_major_build(plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorbuild)
  end
  def get_minor_build(plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.unsafe_as(Proc(Int32*, HRESULT)).call(plminorbuild)
  end
  def get_debug(pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.unsafe_as(Proc(Int16*, HRESULT)).call(pbdebug)
  end
  def get_status(pstatus : FAX_PROVIDER_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_PROVIDER_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_init_error_code(pliniterrorcode : Int32*) : HRESULT
    @lpVtbl.value.get_init_error_code.unsafe_as(Proc(Int32*, HRESULT)).call(pliniterrorcode)
  end
  def get_device_ids(pvdeviceids : VARIANT*) : HRESULT
    @lpVtbl.value.get_device_ids.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvdeviceids)
  end
end
struct LibWin32::IFaxDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(plid : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(plid)
  end
  def get_device_name(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_provider_unique_name(pbstrprovideruniquename : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_unique_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrprovideruniquename)
  end
  def get_powered_off(pbpoweredoff : Int16*) : HRESULT
    @lpVtbl.value.get_powered_off.unsafe_as(Proc(Int16*, HRESULT)).call(pbpoweredoff)
  end
  def get_receiving_now(pbreceivingnow : Int16*) : HRESULT
    @lpVtbl.value.get_receiving_now.unsafe_as(Proc(Int16*, HRESULT)).call(pbreceivingnow)
  end
  def get_sending_now(pbsendingnow : Int16*) : HRESULT
    @lpVtbl.value.get_sending_now.unsafe_as(Proc(Int16*, HRESULT)).call(pbsendingnow)
  end
  def get_used_routing_methods(pvusedroutingmethods : VARIANT*) : HRESULT
    @lpVtbl.value.get_used_routing_methods.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvusedroutingmethods)
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def put_description(bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdescription)
  end
  def get_send_enabled(pbsendenabled : Int16*) : HRESULT
    @lpVtbl.value.get_send_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pbsendenabled)
  end
  def put_send_enabled(bsendenabled : Int16) : HRESULT
    @lpVtbl.value.put_send_enabled.unsafe_as(Proc(Int16, HRESULT)).call(bsendenabled)
  end
  def get_receive_mode(preceivemode : FAX_DEVICE_RECEIVE_MODE_ENUM*) : HRESULT
    @lpVtbl.value.get_receive_mode.unsafe_as(Proc(FAX_DEVICE_RECEIVE_MODE_ENUM*, HRESULT)).call(preceivemode)
  end
  def put_receive_mode(receivemode : FAX_DEVICE_RECEIVE_MODE_ENUM) : HRESULT
    @lpVtbl.value.put_receive_mode.unsafe_as(Proc(FAX_DEVICE_RECEIVE_MODE_ENUM, HRESULT)).call(receivemode)
  end
  def get_rings_before_answer(plringsbeforeanswer : Int32*) : HRESULT
    @lpVtbl.value.get_rings_before_answer.unsafe_as(Proc(Int32*, HRESULT)).call(plringsbeforeanswer)
  end
  def put_rings_before_answer(lringsbeforeanswer : Int32) : HRESULT
    @lpVtbl.value.put_rings_before_answer.unsafe_as(Proc(Int32, HRESULT)).call(lringsbeforeanswer)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def put_csid(bstrcsid : UInt8*) : HRESULT
    @lpVtbl.value.put_csid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def put_tsid(bstrtsid : UInt8*) : HRESULT
    @lpVtbl.value.put_tsid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtsid)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_extension_property(bstrguid : UInt8*, pvproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrguid, pvproperty)
  end
  def set_extension_property(bstrguid : UInt8*, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_extension_property.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(bstrguid, vproperty)
  end
  def use_routing_method(bstrmethodguid : UInt8*, buse : Int16) : HRESULT
    @lpVtbl.value.use_routing_method.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(bstrmethodguid, buse)
  end
  def get_ringing_now(pbringingnow : Int16*) : HRESULT
    @lpVtbl.value.get_ringing_now.unsafe_as(Proc(Int16*, HRESULT)).call(pbringingnow)
  end
  def answer_call : HRESULT
    @lpVtbl.value.answer_call.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxActivityLogging
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_log_incoming(pblogincoming : Int16*) : HRESULT
    @lpVtbl.value.get_log_incoming.unsafe_as(Proc(Int16*, HRESULT)).call(pblogincoming)
  end
  def put_log_incoming(blogincoming : Int16) : HRESULT
    @lpVtbl.value.put_log_incoming.unsafe_as(Proc(Int16, HRESULT)).call(blogincoming)
  end
  def get_log_outgoing(pblogoutgoing : Int16*) : HRESULT
    @lpVtbl.value.get_log_outgoing.unsafe_as(Proc(Int16*, HRESULT)).call(pblogoutgoing)
  end
  def put_log_outgoing(blogoutgoing : Int16) : HRESULT
    @lpVtbl.value.put_log_outgoing.unsafe_as(Proc(Int16, HRESULT)).call(blogoutgoing)
  end
  def get_database_path(pbstrdatabasepath : UInt8**) : HRESULT
    @lpVtbl.value.get_database_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdatabasepath)
  end
  def put_database_path(bstrdatabasepath : UInt8*) : HRESULT
    @lpVtbl.value.put_database_path.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdatabasepath)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxEventLogging
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_init_events_level(piniteventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_init_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM*, HRESULT)).call(piniteventlevel)
  end
  def put_init_events_level(initeventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_init_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM, HRESULT)).call(initeventlevel)
  end
  def get_inbound_events_level(pinboundeventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_inbound_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM*, HRESULT)).call(pinboundeventlevel)
  end
  def put_inbound_events_level(inboundeventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_inbound_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM, HRESULT)).call(inboundeventlevel)
  end
  def get_outbound_events_level(poutboundeventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_outbound_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM*, HRESULT)).call(poutboundeventlevel)
  end
  def put_outbound_events_level(outboundeventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_outbound_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM, HRESULT)).call(outboundeventlevel)
  end
  def get_general_events_level(pgeneraleventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_general_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM*, HRESULT)).call(pgeneraleventlevel)
  end
  def put_general_events_level(generaleventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_general_events_level.unsafe_as(Proc(FAX_LOG_LEVEL_ENUM, HRESULT)).call(generaleventlevel)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxOutboundRoutingGroups
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxoutboundroutinggroup : IFaxOutboundRoutingGroup*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxOutboundRoutingGroup*, HRESULT)).call(vindex, pfaxoutboundroutinggroup)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def add(bstrname : UInt8*, pfaxoutboundroutinggroup : IFaxOutboundRoutingGroup*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, IFaxOutboundRoutingGroup*, HRESULT)).call(bstrname, pfaxoutboundroutinggroup)
  end
  def remove(vindex : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(vindex)
  end
end
struct LibWin32::IFaxOutboundRoutingGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_status(pstatus : FAX_GROUP_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_GROUP_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_device_ids(pfaxdeviceids : IFaxDeviceIds*) : HRESULT
    @lpVtbl.value.get_device_ids.unsafe_as(Proc(IFaxDeviceIds*, HRESULT)).call(pfaxdeviceids)
  end
end
struct LibWin32::IFaxDeviceIds
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(lindex : Int32, pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(lindex, pldeviceid)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def add(ldeviceid : Int32) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(Int32, HRESULT)).call(ldeviceid)
  end
  def remove(lindex : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, HRESULT)).call(lindex)
  end
  def set_order(ldeviceid : Int32, lneworder : Int32) : HRESULT
    @lpVtbl.value.set_order.unsafe_as(Proc(Int32, Int32, HRESULT)).call(ldeviceid, lneworder)
  end
end
struct LibWin32::IFaxOutboundRoutingRules
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(lindex : Int32, pfaxoutboundroutingrule : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IFaxOutboundRoutingRule*, HRESULT)).call(lindex, pfaxoutboundroutingrule)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def item_by_country_and_area(lcountrycode : Int32, lareacode : Int32, pfaxoutboundroutingrule : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.item_by_country_and_area.unsafe_as(Proc(Int32, Int32, IFaxOutboundRoutingRule*, HRESULT)).call(lcountrycode, lareacode, pfaxoutboundroutingrule)
  end
  def remove_by_country_and_area(lcountrycode : Int32, lareacode : Int32) : HRESULT
    @lpVtbl.value.remove_by_country_and_area.unsafe_as(Proc(Int32, Int32, HRESULT)).call(lcountrycode, lareacode)
  end
  def remove(lindex : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, HRESULT)).call(lindex)
  end
  def add(lcountrycode : Int32, lareacode : Int32, busedevice : Int16, bstrgroupname : UInt8*, ldeviceid : Int32, pfaxoutboundroutingrule : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(Int32, Int32, Int16, UInt8*, Int32, IFaxOutboundRoutingRule*, HRESULT)).call(lcountrycode, lareacode, busedevice, bstrgroupname, ldeviceid, pfaxoutboundroutingrule)
  end
end
struct LibWin32::IFaxOutboundRoutingRule
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_country_code(plcountrycode : Int32*) : HRESULT
    @lpVtbl.value.get_country_code.unsafe_as(Proc(Int32*, HRESULT)).call(plcountrycode)
  end
  def get_area_code(plareacode : Int32*) : HRESULT
    @lpVtbl.value.get_area_code.unsafe_as(Proc(Int32*, HRESULT)).call(plareacode)
  end
  def get_status(pstatus : FAX_RULE_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_RULE_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_use_device(pbusedevice : Int16*) : HRESULT
    @lpVtbl.value.get_use_device.unsafe_as(Proc(Int16*, HRESULT)).call(pbusedevice)
  end
  def put_use_device(busedevice : Int16) : HRESULT
    @lpVtbl.value.put_use_device.unsafe_as(Proc(Int16, HRESULT)).call(busedevice)
  end
  def get_device_id(pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(Int32*, HRESULT)).call(pldeviceid)
  end
  def put_device_id(deviceid : Int32) : HRESULT
    @lpVtbl.value.put_device_id.unsafe_as(Proc(Int32, HRESULT)).call(deviceid)
  end
  def get_group_name(pbstrgroupname : UInt8**) : HRESULT
    @lpVtbl.value.get_group_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrgroupname)
  end
  def put_group_name(bstrgroupname : UInt8*) : HRESULT
    @lpVtbl.value.put_group_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrgroupname)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxInboundRoutingExtensions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxinboundroutingextension : IFaxInboundRoutingExtension*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxInboundRoutingExtension*, HRESULT)).call(vindex, pfaxinboundroutingextension)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
end
struct LibWin32::IFaxInboundRoutingExtension
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_friendly_name(pbstrfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfriendlyname)
  end
  def get_image_name(pbstrimagename : UInt8**) : HRESULT
    @lpVtbl.value.get_image_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrimagename)
  end
  def get_unique_name(pbstruniquename : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruniquename)
  end
  def get_major_version(plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorversion)
  end
  def get_minor_version(plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(plminorversion)
  end
  def get_major_build(plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorbuild)
  end
  def get_minor_build(plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.unsafe_as(Proc(Int32*, HRESULT)).call(plminorbuild)
  end
  def get_debug(pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.unsafe_as(Proc(Int16*, HRESULT)).call(pbdebug)
  end
  def get_status(pstatus : FAX_PROVIDER_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_PROVIDER_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_init_error_code(pliniterrorcode : Int32*) : HRESULT
    @lpVtbl.value.get_init_error_code.unsafe_as(Proc(Int32*, HRESULT)).call(pliniterrorcode)
  end
  def get_methods(pvmethods : VARIANT*) : HRESULT
    @lpVtbl.value.get_methods.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvmethods)
  end
end
struct LibWin32::IFaxInboundRoutingMethods
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxinboundroutingmethod : IFaxInboundRoutingMethod*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxInboundRoutingMethod*, HRESULT)).call(vindex, pfaxinboundroutingmethod)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
end
struct LibWin32::IFaxInboundRoutingMethod
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_guid(pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguid)
  end
  def get_function_name(pbstrfunctionname : UInt8**) : HRESULT
    @lpVtbl.value.get_function_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfunctionname)
  end
  def get_extension_friendly_name(pbstrextensionfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_extension_friendly_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextensionfriendlyname)
  end
  def get_extension_image_name(pbstrextensionimagename : UInt8**) : HRESULT
    @lpVtbl.value.get_extension_image_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextensionimagename)
  end
  def get_priority(plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plpriority)
  end
  def put_priority(lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(Int32, HRESULT)).call(lpriority)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxDocument2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_body(pbstrbody : UInt8**) : HRESULT
    @lpVtbl.value.get_body.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbody)
  end
  def put_body(bstrbody : UInt8*) : HRESULT
    @lpVtbl.value.put_body.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrbody)
  end
  def get_sender(ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.unsafe_as(Proc(IFaxSender*, HRESULT)).call(ppfaxsender)
  end
  def get_recipients(ppfaxrecipients : IFaxRecipients*) : HRESULT
    @lpVtbl.value.get_recipients.unsafe_as(Proc(IFaxRecipients*, HRESULT)).call(ppfaxrecipients)
  end
  def get_cover_page(pbstrcoverpage : UInt8**) : HRESULT
    @lpVtbl.value.get_cover_page.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcoverpage)
  end
  def put_cover_page(bstrcoverpage : UInt8*) : HRESULT
    @lpVtbl.value.put_cover_page.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcoverpage)
  end
  def get_subject(pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubject)
  end
  def put_subject(bstrsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsubject)
  end
  def get_note(pbstrnote : UInt8**) : HRESULT
    @lpVtbl.value.get_note.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrnote)
  end
  def put_note(bstrnote : UInt8*) : HRESULT
    @lpVtbl.value.put_note.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrnote)
  end
  def get_schedule_time(pdatescheduletime : Float64*) : HRESULT
    @lpVtbl.value.get_schedule_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatescheduletime)
  end
  def put_schedule_time(datescheduletime : Float64) : HRESULT
    @lpVtbl.value.put_schedule_time.unsafe_as(Proc(Float64, HRESULT)).call(datescheduletime)
  end
  def get_receipt_address(pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrreceiptaddress)
  end
  def put_receipt_address(bstrreceiptaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_receipt_address.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrreceiptaddress)
  end
  def get_document_name(pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocumentname)
  end
  def put_document_name(bstrdocumentname : UInt8*) : HRESULT
    @lpVtbl.value.put_document_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdocumentname)
  end
  def get_call_handle(plcallhandle : Int32*) : HRESULT
    @lpVtbl.value.get_call_handle.unsafe_as(Proc(Int32*, HRESULT)).call(plcallhandle)
  end
  def put_call_handle(lcallhandle : Int32) : HRESULT
    @lpVtbl.value.put_call_handle.unsafe_as(Proc(Int32, HRESULT)).call(lcallhandle)
  end
  def get_cover_page_type(pcoverpagetype : FAX_COVERPAGE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_cover_page_type.unsafe_as(Proc(FAX_COVERPAGE_TYPE_ENUM*, HRESULT)).call(pcoverpagetype)
  end
  def put_cover_page_type(coverpagetype : FAX_COVERPAGE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_cover_page_type.unsafe_as(Proc(FAX_COVERPAGE_TYPE_ENUM, HRESULT)).call(coverpagetype)
  end
  def get_schedule_type(pscheduletype : FAX_SCHEDULE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_schedule_type.unsafe_as(Proc(FAX_SCHEDULE_TYPE_ENUM*, HRESULT)).call(pscheduletype)
  end
  def put_schedule_type(scheduletype : FAX_SCHEDULE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_schedule_type.unsafe_as(Proc(FAX_SCHEDULE_TYPE_ENUM, HRESULT)).call(scheduletype)
  end
  def get_receipt_type(preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM*, HRESULT)).call(preceipttype)
  end
  def put_receipt_type(receipttype : FAX_RECEIPT_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_receipt_type.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM, HRESULT)).call(receipttype)
  end
  def get_group_broadcast_receipts(pbusegrouping : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.unsafe_as(Proc(Int16*, HRESULT)).call(pbusegrouping)
  end
  def put_group_broadcast_receipts(busegrouping : Int16) : HRESULT
    @lpVtbl.value.put_group_broadcast_receipts.unsafe_as(Proc(Int16, HRESULT)).call(busegrouping)
  end
  def get_priority(ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM*, HRESULT)).call(ppriority)
  end
  def put_priority(priority : FAX_PRIORITY_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM, HRESULT)).call(priority)
  end
  def get_tapi_connection(pptapiconnection : IDispatch*) : HRESULT
    @lpVtbl.value.get_tapi_connection.unsafe_as(Proc(IDispatch*, HRESULT)).call(pptapiconnection)
  end
  def putref_tapi_connection(ptapiconnection : IDispatch) : HRESULT
    @lpVtbl.value.putref_tapi_connection.unsafe_as(Proc(IDispatch, HRESULT)).call(ptapiconnection)
  end
  def submit(bstrfaxservername : UInt8*, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.submit.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrfaxservername, pvfaxoutgoingjobids)
  end
  def connected_submit(pfaxserver : IFaxServer, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.connected_submit.unsafe_as(Proc(IFaxServer, VARIANT*, HRESULT)).call(pfaxserver, pvfaxoutgoingjobids)
  end
  def get_attach_fax_to_receipt(pbattachfax : Int16*) : HRESULT
    @lpVtbl.value.get_attach_fax_to_receipt.unsafe_as(Proc(Int16*, HRESULT)).call(pbattachfax)
  end
  def put_attach_fax_to_receipt(battachfax : Int16) : HRESULT
    @lpVtbl.value.put_attach_fax_to_receipt.unsafe_as(Proc(Int16, HRESULT)).call(battachfax)
  end
  def get_submission_id(pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubmissionid)
  end
  def get_bodies(pvbodies : VARIANT*) : HRESULT
    @lpVtbl.value.get_bodies.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvbodies)
  end
  def put_bodies(vbodies : VARIANT) : HRESULT
    @lpVtbl.value.put_bodies.unsafe_as(Proc(VARIANT, HRESULT)).call(vbodies)
  end
  def submit2(bstrfaxservername : UInt8*, pvfaxoutgoingjobids : VARIANT*, plerrorbodyfile : Int32*) : HRESULT
    @lpVtbl.value.submit2.unsafe_as(Proc(UInt8*, VARIANT*, Int32*, HRESULT)).call(bstrfaxservername, pvfaxoutgoingjobids, plerrorbodyfile)
  end
  def connected_submit2(pfaxserver : IFaxServer, pvfaxoutgoingjobids : VARIANT*, plerrorbodyfile : Int32*) : HRESULT
    @lpVtbl.value.connected_submit2.unsafe_as(Proc(IFaxServer, VARIANT*, Int32*, HRESULT)).call(pfaxserver, pvfaxoutgoingjobids, plerrorbodyfile)
  end
end
struct LibWin32::IFaxConfiguration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_use_archive(pbusearchive : Int16*) : HRESULT
    @lpVtbl.value.get_use_archive.unsafe_as(Proc(Int16*, HRESULT)).call(pbusearchive)
  end
  def put_use_archive(busearchive : Int16) : HRESULT
    @lpVtbl.value.put_use_archive.unsafe_as(Proc(Int16, HRESULT)).call(busearchive)
  end
  def get_archive_location(pbstrarchivelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_archive_location.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrarchivelocation)
  end
  def put_archive_location(bstrarchivelocation : UInt8*) : HRESULT
    @lpVtbl.value.put_archive_location.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrarchivelocation)
  end
  def get_size_quota_warning(pbsizequotawarning : Int16*) : HRESULT
    @lpVtbl.value.get_size_quota_warning.unsafe_as(Proc(Int16*, HRESULT)).call(pbsizequotawarning)
  end
  def put_size_quota_warning(bsizequotawarning : Int16) : HRESULT
    @lpVtbl.value.put_size_quota_warning.unsafe_as(Proc(Int16, HRESULT)).call(bsizequotawarning)
  end
  def get_high_quota_water_mark(plhighquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_high_quota_water_mark.unsafe_as(Proc(Int32*, HRESULT)).call(plhighquotawatermark)
  end
  def put_high_quota_water_mark(lhighquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_high_quota_water_mark.unsafe_as(Proc(Int32, HRESULT)).call(lhighquotawatermark)
  end
  def get_low_quota_water_mark(pllowquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_low_quota_water_mark.unsafe_as(Proc(Int32*, HRESULT)).call(pllowquotawatermark)
  end
  def put_low_quota_water_mark(llowquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_low_quota_water_mark.unsafe_as(Proc(Int32, HRESULT)).call(llowquotawatermark)
  end
  def get_archive_age_limit(plarchiveagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_archive_age_limit.unsafe_as(Proc(Int32*, HRESULT)).call(plarchiveagelimit)
  end
  def put_archive_age_limit(larchiveagelimit : Int32) : HRESULT
    @lpVtbl.value.put_archive_age_limit.unsafe_as(Proc(Int32, HRESULT)).call(larchiveagelimit)
  end
  def get_archive_size_low(plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_archive_size_low.unsafe_as(Proc(Int32*, HRESULT)).call(plsizelow)
  end
  def get_archive_size_high(plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_archive_size_high.unsafe_as(Proc(Int32*, HRESULT)).call(plsizehigh)
  end
  def get_outgoing_queue_blocked(pboutgoingblocked : Int16*) : HRESULT
    @lpVtbl.value.get_outgoing_queue_blocked.unsafe_as(Proc(Int16*, HRESULT)).call(pboutgoingblocked)
  end
  def put_outgoing_queue_blocked(boutgoingblocked : Int16) : HRESULT
    @lpVtbl.value.put_outgoing_queue_blocked.unsafe_as(Proc(Int16, HRESULT)).call(boutgoingblocked)
  end
  def get_outgoing_queue_paused(pboutgoingpaused : Int16*) : HRESULT
    @lpVtbl.value.get_outgoing_queue_paused.unsafe_as(Proc(Int16*, HRESULT)).call(pboutgoingpaused)
  end
  def put_outgoing_queue_paused(boutgoingpaused : Int16) : HRESULT
    @lpVtbl.value.put_outgoing_queue_paused.unsafe_as(Proc(Int16, HRESULT)).call(boutgoingpaused)
  end
  def get_allow_personal_cover_pages(pballowpersonalcoverpages : Int16*) : HRESULT
    @lpVtbl.value.get_allow_personal_cover_pages.unsafe_as(Proc(Int16*, HRESULT)).call(pballowpersonalcoverpages)
  end
  def put_allow_personal_cover_pages(ballowpersonalcoverpages : Int16) : HRESULT
    @lpVtbl.value.put_allow_personal_cover_pages.unsafe_as(Proc(Int16, HRESULT)).call(ballowpersonalcoverpages)
  end
  def get_use_device_tsid(pbusedevicetsid : Int16*) : HRESULT
    @lpVtbl.value.get_use_device_tsid.unsafe_as(Proc(Int16*, HRESULT)).call(pbusedevicetsid)
  end
  def put_use_device_tsid(busedevicetsid : Int16) : HRESULT
    @lpVtbl.value.put_use_device_tsid.unsafe_as(Proc(Int16, HRESULT)).call(busedevicetsid)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def put_retries(lretries : Int32) : HRESULT
    @lpVtbl.value.put_retries.unsafe_as(Proc(Int32, HRESULT)).call(lretries)
  end
  def get_retry_delay(plretrydelay : Int32*) : HRESULT
    @lpVtbl.value.get_retry_delay.unsafe_as(Proc(Int32*, HRESULT)).call(plretrydelay)
  end
  def put_retry_delay(lretrydelay : Int32) : HRESULT
    @lpVtbl.value.put_retry_delay.unsafe_as(Proc(Int32, HRESULT)).call(lretrydelay)
  end
  def get_discount_rate_start(pdatediscountratestart : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatediscountratestart)
  end
  def put_discount_rate_start(datediscountratestart : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_start.unsafe_as(Proc(Float64, HRESULT)).call(datediscountratestart)
  end
  def get_discount_rate_end(pdatediscountrateend : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatediscountrateend)
  end
  def put_discount_rate_end(datediscountrateend : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_end.unsafe_as(Proc(Float64, HRESULT)).call(datediscountrateend)
  end
  def get_outgoing_queue_age_limit(ploutgoingqueueagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_outgoing_queue_age_limit.unsafe_as(Proc(Int32*, HRESULT)).call(ploutgoingqueueagelimit)
  end
  def put_outgoing_queue_age_limit(loutgoingqueueagelimit : Int32) : HRESULT
    @lpVtbl.value.put_outgoing_queue_age_limit.unsafe_as(Proc(Int32, HRESULT)).call(loutgoingqueueagelimit)
  end
  def get_branding(pbbranding : Int16*) : HRESULT
    @lpVtbl.value.get_branding.unsafe_as(Proc(Int16*, HRESULT)).call(pbbranding)
  end
  def put_branding(bbranding : Int16) : HRESULT
    @lpVtbl.value.put_branding.unsafe_as(Proc(Int16, HRESULT)).call(bbranding)
  end
  def get_incoming_queue_blocked(pbincomingblocked : Int16*) : HRESULT
    @lpVtbl.value.get_incoming_queue_blocked.unsafe_as(Proc(Int16*, HRESULT)).call(pbincomingblocked)
  end
  def put_incoming_queue_blocked(bincomingblocked : Int16) : HRESULT
    @lpVtbl.value.put_incoming_queue_blocked.unsafe_as(Proc(Int16, HRESULT)).call(bincomingblocked)
  end
  def get_auto_create_account_on_connect(pbautocreateaccountonconnect : Int16*) : HRESULT
    @lpVtbl.value.get_auto_create_account_on_connect.unsafe_as(Proc(Int16*, HRESULT)).call(pbautocreateaccountonconnect)
  end
  def put_auto_create_account_on_connect(bautocreateaccountonconnect : Int16) : HRESULT
    @lpVtbl.value.put_auto_create_account_on_connect.unsafe_as(Proc(Int16, HRESULT)).call(bautocreateaccountonconnect)
  end
  def get_incoming_faxes_are_public(pbincomingfaxesarepublic : Int16*) : HRESULT
    @lpVtbl.value.get_incoming_faxes_are_public.unsafe_as(Proc(Int16*, HRESULT)).call(pbincomingfaxesarepublic)
  end
  def put_incoming_faxes_are_public(bincomingfaxesarepublic : Int16) : HRESULT
    @lpVtbl.value.put_incoming_faxes_are_public.unsafe_as(Proc(Int16, HRESULT)).call(bincomingfaxesarepublic)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxServer2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect(bstrservername : UInt8*) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrservername)
  end
  def get_server_name(pbstrservername : UInt8**) : HRESULT
    @lpVtbl.value.get_server_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrservername)
  end
  def get_device_providers(ppfaxdeviceproviders : IFaxDeviceProviders*) : HRESULT
    @lpVtbl.value.get_device_providers.unsafe_as(Proc(IFaxDeviceProviders*, HRESULT)).call(ppfaxdeviceproviders)
  end
  def get_devices(ppfaxdevices : IFaxDevices*) : HRESULT
    @lpVtbl.value.get_devices.unsafe_as(Proc(IFaxDevices*, HRESULT)).call(ppfaxdevices)
  end
  def get_inbound_routing(ppfaxinboundrouting : IFaxInboundRouting*) : HRESULT
    @lpVtbl.value.get_inbound_routing.unsafe_as(Proc(IFaxInboundRouting*, HRESULT)).call(ppfaxinboundrouting)
  end
  def get_folders(pfaxfolders : IFaxFolders*) : HRESULT
    @lpVtbl.value.get_folders.unsafe_as(Proc(IFaxFolders*, HRESULT)).call(pfaxfolders)
  end
  def get_logging_options(ppfaxloggingoptions : IFaxLoggingOptions*) : HRESULT
    @lpVtbl.value.get_logging_options.unsafe_as(Proc(IFaxLoggingOptions*, HRESULT)).call(ppfaxloggingoptions)
  end
  def get_major_version(plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorversion)
  end
  def get_minor_version(plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(plminorversion)
  end
  def get_major_build(plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorbuild)
  end
  def get_minor_build(plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.unsafe_as(Proc(Int32*, HRESULT)).call(plminorbuild)
  end
  def get_debug(pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.unsafe_as(Proc(Int16*, HRESULT)).call(pbdebug)
  end
  def get_activity(ppfaxactivity : IFaxActivity*) : HRESULT
    @lpVtbl.value.get_activity.unsafe_as(Proc(IFaxActivity*, HRESULT)).call(ppfaxactivity)
  end
  def get_outbound_routing(ppfaxoutboundrouting : IFaxOutboundRouting*) : HRESULT
    @lpVtbl.value.get_outbound_routing.unsafe_as(Proc(IFaxOutboundRouting*, HRESULT)).call(ppfaxoutboundrouting)
  end
  def get_receipt_options(ppfaxreceiptoptions : IFaxReceiptOptions*) : HRESULT
    @lpVtbl.value.get_receipt_options.unsafe_as(Proc(IFaxReceiptOptions*, HRESULT)).call(ppfaxreceiptoptions)
  end
  def get_security(ppfaxsecurity : IFaxSecurity*) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(IFaxSecurity*, HRESULT)).call(ppfaxsecurity)
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def get_extension_property(bstrguid : UInt8*, pvproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrguid, pvproperty)
  end
  def set_extension_property(bstrguid : UInt8*, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_extension_property.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(bstrguid, vproperty)
  end
  def listen_to_server_events(eventtypes : FAX_SERVER_EVENTS_TYPE_ENUM) : HRESULT
    @lpVtbl.value.listen_to_server_events.unsafe_as(Proc(FAX_SERVER_EVENTS_TYPE_ENUM, HRESULT)).call(eventtypes)
  end
  def register_device_provider(bstrguid : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, tspname : UInt8*, lfspiversion : Int32) : HRESULT
    @lpVtbl.value.register_device_provider.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, Int32, HRESULT)).call(bstrguid, bstrfriendlyname, bstrimagename, tspname, lfspiversion)
  end
  def unregister_device_provider(bstruniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_device_provider.unsafe_as(Proc(UInt8*, HRESULT)).call(bstruniquename)
  end
  def register_inbound_routing_extension(bstrextensionname : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, vmethods : VARIANT) : HRESULT
    @lpVtbl.value.register_inbound_routing_extension.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)).call(bstrextensionname, bstrfriendlyname, bstrimagename, vmethods)
  end
  def unregister_inbound_routing_extension(bstrextensionuniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_inbound_routing_extension.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrextensionuniquename)
  end
  def get_registered_events(peventtypes : FAX_SERVER_EVENTS_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_registered_events.unsafe_as(Proc(FAX_SERVER_EVENTS_TYPE_ENUM*, HRESULT)).call(peventtypes)
  end
  def get_api_version(papiversion : FAX_SERVER_APIVERSION_ENUM*) : HRESULT
    @lpVtbl.value.get_api_version.unsafe_as(Proc(FAX_SERVER_APIVERSION_ENUM*, HRESULT)).call(papiversion)
  end
  def get_configuration(ppfaxconfiguration : IFaxConfiguration*) : HRESULT
    @lpVtbl.value.get_configuration.unsafe_as(Proc(IFaxConfiguration*, HRESULT)).call(ppfaxconfiguration)
  end
  def get_current_account(ppcurrentaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.get_current_account.unsafe_as(Proc(IFaxAccount*, HRESULT)).call(ppcurrentaccount)
  end
  def get_fax_account_set(ppfaxaccountset : IFaxAccountSet*) : HRESULT
    @lpVtbl.value.get_fax_account_set.unsafe_as(Proc(IFaxAccountSet*, HRESULT)).call(ppfaxaccountset)
  end
  def get_security2(ppfaxsecurity2 : IFaxSecurity2*) : HRESULT
    @lpVtbl.value.get_security2.unsafe_as(Proc(IFaxSecurity2*, HRESULT)).call(ppfaxsecurity2)
  end
end
struct LibWin32::IFaxAccountSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_accounts(ppfaxaccounts : IFaxAccounts*) : HRESULT
    @lpVtbl.value.get_accounts.unsafe_as(Proc(IFaxAccounts*, HRESULT)).call(ppfaxaccounts)
  end
  def get_account(bstraccountname : UInt8*, pfaxaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.get_account.unsafe_as(Proc(UInt8*, IFaxAccount*, HRESULT)).call(bstraccountname, pfaxaccount)
  end
  def add_account(bstraccountname : UInt8*, pfaxaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.add_account.unsafe_as(Proc(UInt8*, IFaxAccount*, HRESULT)).call(bstraccountname, pfaxaccount)
  end
  def remove_account(bstraccountname : UInt8*) : HRESULT
    @lpVtbl.value.remove_account.unsafe_as(Proc(UInt8*, HRESULT)).call(bstraccountname)
  end
end
struct LibWin32::IFaxAccounts
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(vindex : VARIANT, pfaxaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFaxAccount*, HRESULT)).call(vindex, pfaxaccount)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
end
struct LibWin32::IFaxAccount
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_account_name(pbstraccountname : UInt8**) : HRESULT
    @lpVtbl.value.get_account_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstraccountname)
  end
  def get_folders(ppfolders : IFaxAccountFolders*) : HRESULT
    @lpVtbl.value.get_folders.unsafe_as(Proc(IFaxAccountFolders*, HRESULT)).call(ppfolders)
  end
  def listen_to_account_events(eventtypes : FAX_ACCOUNT_EVENTS_TYPE_ENUM) : HRESULT
    @lpVtbl.value.listen_to_account_events.unsafe_as(Proc(FAX_ACCOUNT_EVENTS_TYPE_ENUM, HRESULT)).call(eventtypes)
  end
  def get_registered_events(pregisteredevents : FAX_ACCOUNT_EVENTS_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_registered_events.unsafe_as(Proc(FAX_ACCOUNT_EVENTS_TYPE_ENUM*, HRESULT)).call(pregisteredevents)
  end
end
struct LibWin32::IFaxOutgoingJob2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_subject(pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubject)
  end
  def get_document_name(pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocumentname)
  end
  def get_pages(plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.unsafe_as(Proc(Int32*, HRESULT)).call(plpages)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_submission_id(pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubmissionid)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_original_scheduled_time(pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdateoriginalscheduledtime)
  end
  def get_submission_time(pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatesubmissiontime)
  end
  def get_receipt_type(preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM*, HRESULT)).call(preceipttype)
  end
  def get_priority(ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM*, HRESULT)).call(ppriority)
  end
  def get_sender(ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.unsafe_as(Proc(IFaxSender*, HRESULT)).call(ppfaxsender)
  end
  def get_recipient(ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.unsafe_as(Proc(IFaxRecipient*, HRESULT)).call(ppfaxrecipient)
  end
  def get_current_page(plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.unsafe_as(Proc(Int32*, HRESULT)).call(plcurrentpage)
  end
  def get_device_id(pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(Int32*, HRESULT)).call(pldeviceid)
  end
  def get_status(pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(FAX_JOB_STATUS_ENUM*, HRESULT)).call(pstatus)
  end
  def get_extended_status_code(pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.unsafe_as(Proc(FAX_JOB_EXTENDED_STATUS_ENUM*, HRESULT)).call(pextendedstatuscode)
  end
  def get_extended_status(pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextendedstatus)
  end
  def get_available_operations(pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.unsafe_as(Proc(FAX_JOB_OPERATIONS_ENUM*, HRESULT)).call(pavailableoperations)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_scheduled_time(pdatescheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_scheduled_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatescheduledtime)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def get_group_broadcast_receipts(pbgroupbroadcastreceipts : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.unsafe_as(Proc(Int16*, HRESULT)).call(pbgroupbroadcastreceipts)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def restart : HRESULT
    @lpVtbl.value.restart.unsafe_as(Proc(HRESULT)).call
  end
  def copy_tiff(bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtiffpath)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def get_has_cover_page(pbhascoverpage : Int16*) : HRESULT
    @lpVtbl.value.get_has_cover_page.unsafe_as(Proc(Int16*, HRESULT)).call(pbhascoverpage)
  end
  def get_receipt_address(pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrreceiptaddress)
  end
  def get_schedule_type(pscheduletype : FAX_SCHEDULE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_schedule_type.unsafe_as(Proc(FAX_SCHEDULE_TYPE_ENUM*, HRESULT)).call(pscheduletype)
  end
end
struct LibWin32::IFaxAccountFolders
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_outgoing_queue(pfaxoutgoingqueue : IFaxAccountOutgoingQueue*) : HRESULT
    @lpVtbl.value.get_outgoing_queue.unsafe_as(Proc(IFaxAccountOutgoingQueue*, HRESULT)).call(pfaxoutgoingqueue)
  end
  def get_incoming_queue(pfaxincomingqueue : IFaxAccountIncomingQueue*) : HRESULT
    @lpVtbl.value.get_incoming_queue.unsafe_as(Proc(IFaxAccountIncomingQueue*, HRESULT)).call(pfaxincomingqueue)
  end
  def get_incoming_archive(pfaxincomingarchive : IFaxAccountIncomingArchive*) : HRESULT
    @lpVtbl.value.get_incoming_archive.unsafe_as(Proc(IFaxAccountIncomingArchive*, HRESULT)).call(pfaxincomingarchive)
  end
  def get_outgoing_archive(pfaxoutgoingarchive : IFaxAccountOutgoingArchive*) : HRESULT
    @lpVtbl.value.get_outgoing_archive.unsafe_as(Proc(IFaxAccountOutgoingArchive*, HRESULT)).call(pfaxoutgoingarchive)
  end
end
struct LibWin32::IFaxAccountIncomingQueue
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_jobs(pfaxincomingjobs : IFaxIncomingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.unsafe_as(Proc(IFaxIncomingJobs*, HRESULT)).call(pfaxincomingjobs)
  end
  def get_job(bstrjobid : UInt8*, pfaxincomingjob : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.get_job.unsafe_as(Proc(UInt8*, IFaxIncomingJob*, HRESULT)).call(bstrjobid, pfaxincomingjob)
  end
end
struct LibWin32::IFaxAccountOutgoingQueue
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_jobs(pfaxoutgoingjobs : IFaxOutgoingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.unsafe_as(Proc(IFaxOutgoingJobs*, HRESULT)).call(pfaxoutgoingjobs)
  end
  def get_job(bstrjobid : UInt8*, pfaxoutgoingjob : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.get_job.unsafe_as(Proc(UInt8*, IFaxOutgoingJob*, HRESULT)).call(bstrjobid, pfaxoutgoingjob)
  end
end
struct LibWin32::IFaxOutgoingMessage2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_submission_id(pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubmissionid)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_subject(pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubject)
  end
  def get_document_name(pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocumentname)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_pages(plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.unsafe_as(Proc(Int32*, HRESULT)).call(plpages)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_original_scheduled_time(pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdateoriginalscheduledtime)
  end
  def get_submission_time(pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdatesubmissiontime)
  end
  def get_priority(ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(FAX_PRIORITY_TYPE_ENUM*, HRESULT)).call(ppriority)
  end
  def get_sender(ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.unsafe_as(Proc(IFaxSender*, HRESULT)).call(ppfaxsender)
  end
  def get_recipient(ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.unsafe_as(Proc(IFaxRecipient*, HRESULT)).call(ppfaxrecipient)
  end
  def get_device_name(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def copy_tiff(bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtiffpath)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_has_cover_page(pbhascoverpage : Int16*) : HRESULT
    @lpVtbl.value.get_has_cover_page.unsafe_as(Proc(Int16*, HRESULT)).call(pbhascoverpage)
  end
  def get_receipt_type(preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.unsafe_as(Proc(FAX_RECEIPT_TYPE_ENUM*, HRESULT)).call(preceipttype)
  end
  def get_receipt_address(pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrreceiptaddress)
  end
  def get_read(pbread : Int16*) : HRESULT
    @lpVtbl.value.get_read.unsafe_as(Proc(Int16*, HRESULT)).call(pbread)
  end
  def put_read(bread : Int16) : HRESULT
    @lpVtbl.value.put_read.unsafe_as(Proc(Int16, HRESULT)).call(bread)
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxAccountIncomingArchive
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_size_low(plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.unsafe_as(Proc(Int32*, HRESULT)).call(plsizelow)
  end
  def get_size_high(plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.unsafe_as(Proc(Int32*, HRESULT)).call(plsizehigh)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def get_messages(lprefetchsize : Int32, pfaxincomingmessageiterator : IFaxIncomingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.unsafe_as(Proc(Int32, IFaxIncomingMessageIterator*, HRESULT)).call(lprefetchsize, pfaxincomingmessageiterator)
  end
  def get_message(bstrmessageid : UInt8*, pfaxincomingmessage : IFaxIncomingMessage*) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8*, IFaxIncomingMessage*, HRESULT)).call(bstrmessageid, pfaxincomingmessage)
  end
end
struct LibWin32::IFaxAccountOutgoingArchive
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_size_low(plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.unsafe_as(Proc(Int32*, HRESULT)).call(plsizelow)
  end
  def get_size_high(plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.unsafe_as(Proc(Int32*, HRESULT)).call(plsizehigh)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def get_messages(lprefetchsize : Int32, pfaxoutgoingmessageiterator : IFaxOutgoingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.unsafe_as(Proc(Int32, IFaxOutgoingMessageIterator*, HRESULT)).call(lprefetchsize, pfaxoutgoingmessageiterator)
  end
  def get_message(bstrmessageid : UInt8*, pfaxoutgoingmessage : IFaxOutgoingMessage*) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8*, IFaxOutgoingMessage*, HRESULT)).call(bstrmessageid, pfaxoutgoingmessage)
  end
end
struct LibWin32::IFaxSecurity2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_descriptor(pvdescriptor : VARIANT*) : HRESULT
    @lpVtbl.value.get_descriptor.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvdescriptor)
  end
  def put_descriptor(vdescriptor : VARIANT) : HRESULT
    @lpVtbl.value.put_descriptor.unsafe_as(Proc(VARIANT, HRESULT)).call(vdescriptor)
  end
  def get_granted_rights(pgrantedrights : FAX_ACCESS_RIGHTS_ENUM_2*) : HRESULT
    @lpVtbl.value.get_granted_rights.unsafe_as(Proc(FAX_ACCESS_RIGHTS_ENUM_2*, HRESULT)).call(pgrantedrights)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_information_type(plinformationtype : Int32*) : HRESULT
    @lpVtbl.value.get_information_type.unsafe_as(Proc(Int32*, HRESULT)).call(plinformationtype)
  end
  def put_information_type(linformationtype : Int32) : HRESULT
    @lpVtbl.value.put_information_type.unsafe_as(Proc(Int32, HRESULT)).call(linformationtype)
  end
end
struct LibWin32::IFaxIncomingMessage2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_pages(plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.unsafe_as(Proc(Int32*, HRESULT)).call(plpages)
  end
  def get_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_device_name(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_retries(plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.unsafe_as(Proc(Int32*, HRESULT)).call(plretries)
  end
  def get_transmission_start(pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionstart)
  end
  def get_transmission_end(pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.unsafe_as(Proc(Float64*, HRESULT)).call(pdatetransmissionend)
  end
  def get_csid(pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcsid)
  end
  def get_tsid(pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtsid)
  end
  def get_caller_id(pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcallerid)
  end
  def get_routing_information(pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrroutinginformation)
  end
  def copy_tiff(bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtiffpath)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_subject(pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubject)
  end
  def put_subject(bstrsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsubject)
  end
  def get_sender_name(pbstrsendername : UInt8**) : HRESULT
    @lpVtbl.value.get_sender_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsendername)
  end
  def put_sender_name(bstrsendername : UInt8*) : HRESULT
    @lpVtbl.value.put_sender_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsendername)
  end
  def get_sender_fax_number(pbstrsenderfaxnumber : UInt8**) : HRESULT
    @lpVtbl.value.get_sender_fax_number.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsenderfaxnumber)
  end
  def put_sender_fax_number(bstrsenderfaxnumber : UInt8*) : HRESULT
    @lpVtbl.value.put_sender_fax_number.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsenderfaxnumber)
  end
  def get_has_cover_page(pbhascoverpage : Int16*) : HRESULT
    @lpVtbl.value.get_has_cover_page.unsafe_as(Proc(Int16*, HRESULT)).call(pbhascoverpage)
  end
  def put_has_cover_page(bhascoverpage : Int16) : HRESULT
    @lpVtbl.value.put_has_cover_page.unsafe_as(Proc(Int16, HRESULT)).call(bhascoverpage)
  end
  def get_recipients(pbstrrecipients : UInt8**) : HRESULT
    @lpVtbl.value.get_recipients.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrecipients)
  end
  def put_recipients(bstrrecipients : UInt8*) : HRESULT
    @lpVtbl.value.put_recipients.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrrecipients)
  end
  def get_was_re_assigned(pbwasreassigned : Int16*) : HRESULT
    @lpVtbl.value.get_was_re_assigned.unsafe_as(Proc(Int16*, HRESULT)).call(pbwasreassigned)
  end
  def get_read(pbread : Int16*) : HRESULT
    @lpVtbl.value.get_read.unsafe_as(Proc(Int16*, HRESULT)).call(pbread)
  end
  def put_read(bread : Int16) : HRESULT
    @lpVtbl.value.put_read.unsafe_as(Proc(Int16, HRESULT)).call(bread)
  end
  def re_assign : HRESULT
    @lpVtbl.value.re_assign.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFaxServerNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IIFaxServerNotify2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_incoming_job_added(pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_added.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrjobid)
  end
  def on_incoming_job_removed(pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_removed.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrjobid)
  end
  def on_incoming_job_changed(pfaxserver : IFaxServer2, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_incoming_job_changed.unsafe_as(Proc(IFaxServer2, UInt8*, IFaxJobStatus, HRESULT)).call(pfaxserver, bstrjobid, pjobstatus)
  end
  def on_outgoing_job_added(pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_added.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrjobid)
  end
  def on_outgoing_job_removed(pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_removed.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrjobid)
  end
  def on_outgoing_job_changed(pfaxserver : IFaxServer2, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_outgoing_job_changed.unsafe_as(Proc(IFaxServer2, UInt8*, IFaxJobStatus, HRESULT)).call(pfaxserver, bstrjobid, pjobstatus)
  end
  def on_incoming_message_added(pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_message_added.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrmessageid)
  end
  def on_incoming_message_removed(pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_message_removed.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrmessageid)
  end
  def on_outgoing_message_added(pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_added.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrmessageid)
  end
  def on_outgoing_message_removed(pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_removed.unsafe_as(Proc(IFaxServer2, UInt8*, HRESULT)).call(pfaxserver, bstrmessageid)
  end
  def on_receipt_options_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_receipt_options_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_activity_logging_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_activity_logging_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_security_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_security_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_event_logging_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_event_logging_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_outgoing_queue_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outgoing_queue_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_outgoing_archive_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outgoing_archive_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_incoming_archive_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_incoming_archive_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_devices_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_devices_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_outbound_routing_groups_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outbound_routing_groups_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_outbound_routing_rules_config_change(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outbound_routing_rules_config_change.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_server_activity_change(pfaxserver : IFaxServer2, lincomingmessages : Int32, lroutingmessages : Int32, loutgoingmessages : Int32, lqueuedmessages : Int32) : HRESULT
    @lpVtbl.value.on_server_activity_change.unsafe_as(Proc(IFaxServer2, Int32, Int32, Int32, Int32, HRESULT)).call(pfaxserver, lincomingmessages, lroutingmessages, loutgoingmessages, lqueuedmessages)
  end
  def on_queues_status_change(pfaxserver : IFaxServer2, boutgoingqueueblocked : Int16, boutgoingqueuepaused : Int16, bincomingqueueblocked : Int16) : HRESULT
    @lpVtbl.value.on_queues_status_change.unsafe_as(Proc(IFaxServer2, Int16, Int16, Int16, HRESULT)).call(pfaxserver, boutgoingqueueblocked, boutgoingqueuepaused, bincomingqueueblocked)
  end
  def on_new_call(pfaxserver : IFaxServer2, lcallid : Int32, ldeviceid : Int32, bstrcallerid : UInt8*) : HRESULT
    @lpVtbl.value.on_new_call.unsafe_as(Proc(IFaxServer2, Int32, Int32, UInt8*, HRESULT)).call(pfaxserver, lcallid, ldeviceid, bstrcallerid)
  end
  def on_server_shut_down(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_server_shut_down.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
  def on_device_status_change(pfaxserver : IFaxServer2, ldeviceid : Int32, bpoweredoff : Int16, bsending : Int16, breceiving : Int16, bringing : Int16) : HRESULT
    @lpVtbl.value.on_device_status_change.unsafe_as(Proc(IFaxServer2, Int32, Int16, Int16, Int16, Int16, HRESULT)).call(pfaxserver, ldeviceid, bpoweredoff, bsending, breceiving, bringing)
  end
  def on_general_server_config_changed(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_general_server_config_changed.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
end
struct LibWin32::IFaxServerNotify2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IIFaxAccountNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_incoming_job_added(pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_added.unsafe_as(Proc(IFaxAccount, UInt8*, HRESULT)).call(pfaxaccount, bstrjobid)
  end
  def on_incoming_job_removed(pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_removed.unsafe_as(Proc(IFaxAccount, UInt8*, HRESULT)).call(pfaxaccount, bstrjobid)
  end
  def on_incoming_job_changed(pfaxaccount : IFaxAccount, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_incoming_job_changed.unsafe_as(Proc(IFaxAccount, UInt8*, IFaxJobStatus, HRESULT)).call(pfaxaccount, bstrjobid, pjobstatus)
  end
  def on_outgoing_job_added(pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_added.unsafe_as(Proc(IFaxAccount, UInt8*, HRESULT)).call(pfaxaccount, bstrjobid)
  end
  def on_outgoing_job_removed(pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_removed.unsafe_as(Proc(IFaxAccount, UInt8*, HRESULT)).call(pfaxaccount, bstrjobid)
  end
  def on_outgoing_job_changed(pfaxaccount : IFaxAccount, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_outgoing_job_changed.unsafe_as(Proc(IFaxAccount, UInt8*, IFaxJobStatus, HRESULT)).call(pfaxaccount, bstrjobid, pjobstatus)
  end
  def on_incoming_message_added(pfaxaccount : IFaxAccount, bstrmessageid : UInt8*, faddedtoreceivefolder : Int16) : HRESULT
    @lpVtbl.value.on_incoming_message_added.unsafe_as(Proc(IFaxAccount, UInt8*, Int16, HRESULT)).call(pfaxaccount, bstrmessageid, faddedtoreceivefolder)
  end
  def on_incoming_message_removed(pfaxaccount : IFaxAccount, bstrmessageid : UInt8*, fremovedfromreceivefolder : Int16) : HRESULT
    @lpVtbl.value.on_incoming_message_removed.unsafe_as(Proc(IFaxAccount, UInt8*, Int16, HRESULT)).call(pfaxaccount, bstrmessageid, fremovedfromreceivefolder)
  end
  def on_outgoing_message_added(pfaxaccount : IFaxAccount, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_added.unsafe_as(Proc(IFaxAccount, UInt8*, HRESULT)).call(pfaxaccount, bstrmessageid)
  end
  def on_outgoing_message_removed(pfaxaccount : IFaxAccount, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_removed.unsafe_as(Proc(IFaxAccount, UInt8*, HRESULT)).call(pfaxaccount, bstrmessageid)
  end
  def on_server_shut_down(pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_server_shut_down.unsafe_as(Proc(IFaxServer2, HRESULT)).call(pfaxserver)
  end
end
struct LibWin32::IFaxAccountNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IStillImageW
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(hinst : HINSTANCE, dwversion : UInt32) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HINSTANCE, UInt32, HRESULT)).call(hinst, dwversion)
  end
  def get_device_list(dwtype : UInt32, dwflags : UInt32, pdwitemsreturned : UInt32*, ppbuffer : Void**) : HRESULT
    @lpVtbl.value.get_device_list.unsafe_as(Proc(UInt32, UInt32, UInt32*, Void**, HRESULT)).call(dwtype, dwflags, pdwitemsreturned, ppbuffer)
  end
  def get_device_info(pwszdevicename : LibC::LPWSTR, ppbuffer : Void**) : HRESULT
    @lpVtbl.value.get_device_info.unsafe_as(Proc(LibC::LPWSTR, Void**, HRESULT)).call(pwszdevicename, ppbuffer)
  end
  def create_device(pwszdevicename : LibC::LPWSTR, dwmode : UInt32, pdevice : IStiDevice*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_device.unsafe_as(Proc(LibC::LPWSTR, UInt32, IStiDevice*, IUnknown, HRESULT)).call(pwszdevicename, dwmode, pdevice, punkouter)
  end
  def get_device_value(pwszdevicename : LibC::LPWSTR, pvaluename : LibC::LPWSTR, ptype : UInt32*, pdata : UInt8*, cbdata : UInt32*) : HRESULT
    @lpVtbl.value.get_device_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32*, UInt8*, UInt32*, HRESULT)).call(pwszdevicename, pvaluename, ptype, pdata, cbdata)
  end
  def set_device_value(pwszdevicename : LibC::LPWSTR, pvaluename : LibC::LPWSTR, type : UInt32, pdata : UInt8*, cbdata : UInt32) : HRESULT
    @lpVtbl.value.set_device_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt8*, UInt32, HRESULT)).call(pwszdevicename, pvaluename, type, pdata, cbdata)
  end
  def get_sti_launch_information(pwszdevicename : Char*, pdweventcode : UInt32*, pwszeventname : Char*) : HRESULT
    @lpVtbl.value.get_sti_launch_information.unsafe_as(Proc(Char*, UInt32*, Char*, HRESULT)).call(pwszdevicename, pdweventcode, pwszeventname)
  end
  def register_launch_application(pwszappname : LibC::LPWSTR, pwszcommandline : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.register_launch_application.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszappname, pwszcommandline)
  end
  def unregister_launch_application(pwszappname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.unregister_launch_application.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszappname)
  end
  def enable_hw_notifications(pwszdevicename : LibC::LPWSTR, bnewstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_hw_notifications.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pwszdevicename, bnewstate)
  end
  def get_hw_notification_state(pwszdevicename : LibC::LPWSTR, pbcurrentstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_hw_notification_state.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(pwszdevicename, pbcurrentstate)
  end
  def refresh_device_bus(pwszdevicename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.refresh_device_bus.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszdevicename)
  end
  def launch_application_for_device(pwszdevicename : LibC::LPWSTR, pwszappname : LibC::LPWSTR, pstinotify : STINOTIFY*) : HRESULT
    @lpVtbl.value.launch_application_for_device.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, STINOTIFY*, HRESULT)).call(pwszdevicename, pwszappname, pstinotify)
  end
  def setup_device_parameters(param0 : STI_DEVICE_INFORMATIONW*) : HRESULT
    @lpVtbl.value.setup_device_parameters.unsafe_as(Proc(STI_DEVICE_INFORMATIONW*, HRESULT)).call(param0)
  end
  def write_to_error_log(dwmessagetype : UInt32, pszmessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_to_error_log.unsafe_as(Proc(UInt32, LibC::LPWSTR, HRESULT)).call(dwmessagetype, pszmessage)
  end
end
struct LibWin32::IStiDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(hinst : HINSTANCE, pwszdevicename : LibC::LPWSTR, dwversion : UInt32, dwmode : UInt32) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HINSTANCE, LibC::LPWSTR, UInt32, UInt32, HRESULT)).call(hinst, pwszdevicename, dwversion, dwmode)
  end
  def get_capabilities(pdevcaps : STI_DEV_CAPS*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(STI_DEV_CAPS*, HRESULT)).call(pdevcaps)
  end
  def get_status(pdevstatus : STI_DEVICE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(STI_DEVICE_STATUS*, HRESULT)).call(pdevstatus)
  end
  def device_reset : HRESULT
    @lpVtbl.value.device_reset.unsafe_as(Proc(HRESULT)).call
  end
  def diagnostic(pbuffer : STI_DIAG*) : HRESULT
    @lpVtbl.value.diagnostic.unsafe_as(Proc(STI_DIAG*, HRESULT)).call(pbuffer)
  end
  def escape(escapefunction : UInt32, lpindata : Void*, cbindatasize : UInt32, poutdata : Void*, dwoutdatasize : UInt32, pdwactualdata : UInt32*) : HRESULT
    @lpVtbl.value.escape.unsafe_as(Proc(UInt32, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)).call(escapefunction, lpindata, cbindatasize, poutdata, dwoutdatasize, pdwactualdata)
  end
  def get_last_error(pdwlastdeviceerror : UInt32*) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlastdeviceerror)
  end
  def lock_device(dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.lock_device.unsafe_as(Proc(UInt32, HRESULT)).call(dwtimeout)
  end
  def un_lock_device : HRESULT
    @lpVtbl.value.un_lock_device.unsafe_as(Proc(HRESULT)).call
  end
  def raw_read_data(lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_data.unsafe_as(Proc(Void*, UInt32*, OVERLAPPED*, HRESULT)).call(lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_data(lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_data.unsafe_as(Proc(Void*, UInt32, OVERLAPPED*, HRESULT)).call(lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_read_command(lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_command.unsafe_as(Proc(Void*, UInt32*, OVERLAPPED*, HRESULT)).call(lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_command(lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_command.unsafe_as(Proc(Void*, UInt32, OVERLAPPED*, HRESULT)).call(lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def subscribe(lpsubsribe : STISUBSCRIBE*) : HRESULT
    @lpVtbl.value.subscribe.unsafe_as(Proc(STISUBSCRIBE*, HRESULT)).call(lpsubsribe)
  end
  def get_last_notification_data(lpnotify : STINOTIFY*) : HRESULT
    @lpVtbl.value.get_last_notification_data.unsafe_as(Proc(STINOTIFY*, HRESULT)).call(lpnotify)
  end
  def un_subscribe : HRESULT
    @lpVtbl.value.un_subscribe.unsafe_as(Proc(HRESULT)).call
  end
  def get_last_error_info(plasterrorinfo : ERROR_INFOW*) : HRESULT
    @lpVtbl.value.get_last_error_info.unsafe_as(Proc(ERROR_INFOW*, HRESULT)).call(plasterrorinfo)
  end
end
struct LibWin32::IStiDeviceControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(dwdevicetype : UInt32, dwmode : UInt32, pwszportname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt32, UInt32, LibC::LPWSTR, UInt32, HRESULT)).call(dwdevicetype, dwmode, pwszportname, dwflags)
  end
  def raw_read_data(lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_data.unsafe_as(Proc(Void*, UInt32*, OVERLAPPED*, HRESULT)).call(lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_data(lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_data.unsafe_as(Proc(Void*, UInt32, OVERLAPPED*, HRESULT)).call(lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_read_command(lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_command.unsafe_as(Proc(Void*, UInt32*, OVERLAPPED*, HRESULT)).call(lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_command(lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_command.unsafe_as(Proc(Void*, UInt32, OVERLAPPED*, HRESULT)).call(lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_device_control(escapefunction : UInt32, lpindata : Void*, cbindatasize : UInt32, poutdata : Void*, dwoutdatasize : UInt32, pdwactualdata : UInt32*) : HRESULT
    @lpVtbl.value.raw_device_control.unsafe_as(Proc(UInt32, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)).call(escapefunction, lpindata, cbindatasize, poutdata, dwoutdatasize, pdwactualdata)
  end
  def get_last_error(lpdwlasterror : UInt32*) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(UInt32*, HRESULT)).call(lpdwlasterror)
  end
  def get_my_device_port_name(lpszdevicepath : Char*, cwdevicepathsize : UInt32) : HRESULT
    @lpVtbl.value.get_my_device_port_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(lpszdevicepath, cwdevicepathsize)
  end
  def get_my_device_handle(lph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_my_device_handle.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(lph)
  end
  def get_my_device_open_mode(pdwopenmode : UInt32*) : HRESULT
    @lpVtbl.value.get_my_device_open_mode.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwopenmode)
  end
  def write_to_error_log(dwmessagetype : UInt32, pszmessage : LibC::LPWSTR, dwerrorcode : UInt32) : HRESULT
    @lpVtbl.value.write_to_error_log.unsafe_as(Proc(UInt32, LibC::LPWSTR, UInt32, HRESULT)).call(dwmessagetype, pszmessage, dwerrorcode)
  end
end
struct LibWin32::IStiUSD
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pheldcb : IStiDeviceControl, dwstiversion : UInt32, hparameterskey : HKEY) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IStiDeviceControl, UInt32, HKEY, HRESULT)).call(pheldcb, dwstiversion, hparameterskey)
  end
  def get_capabilities(pdevcaps : STI_USD_CAPS*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(STI_USD_CAPS*, HRESULT)).call(pdevcaps)
  end
  def get_status(pdevstatus : STI_DEVICE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(STI_DEVICE_STATUS*, HRESULT)).call(pdevstatus)
  end
  def device_reset : HRESULT
    @lpVtbl.value.device_reset.unsafe_as(Proc(HRESULT)).call
  end
  def diagnostic(pbuffer : STI_DIAG*) : HRESULT
    @lpVtbl.value.diagnostic.unsafe_as(Proc(STI_DIAG*, HRESULT)).call(pbuffer)
  end
  def escape(escapefunction : UInt32, lpindata : Void*, cbindatasize : UInt32, poutdata : Void*, cboutdatasize : UInt32, pdwactualdata : UInt32*) : HRESULT
    @lpVtbl.value.escape.unsafe_as(Proc(UInt32, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)).call(escapefunction, lpindata, cbindatasize, poutdata, cboutdatasize, pdwactualdata)
  end
  def get_last_error(pdwlastdeviceerror : UInt32*) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlastdeviceerror)
  end
  def lock_device : HRESULT
    @lpVtbl.value.lock_device.unsafe_as(Proc(HRESULT)).call
  end
  def un_lock_device : HRESULT
    @lpVtbl.value.un_lock_device.unsafe_as(Proc(HRESULT)).call
  end
  def raw_read_data(lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_data.unsafe_as(Proc(Void*, UInt32*, OVERLAPPED*, HRESULT)).call(lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_data(lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_data.unsafe_as(Proc(Void*, UInt32, OVERLAPPED*, HRESULT)).call(lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_read_command(lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_command.unsafe_as(Proc(Void*, UInt32*, OVERLAPPED*, HRESULT)).call(lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_command(lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_command.unsafe_as(Proc(Void*, UInt32, OVERLAPPED*, HRESULT)).call(lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def set_notification_handle(hevent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_notification_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hevent)
  end
  def get_notification_data(lpnotify : STINOTIFY*) : HRESULT
    @lpVtbl.value.get_notification_data.unsafe_as(Proc(STINOTIFY*, HRESULT)).call(lpnotify)
  end
  def get_last_error_info(plasterrorinfo : ERROR_INFOW*) : HRESULT
    @lpVtbl.value.get_last_error_info.unsafe_as(Proc(ERROR_INFOW*, HRESULT)).call(plasterrorinfo)
  end
end
