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

  IFaxJobStatus_GUID = "8b86f485-fd7f-4824-886b-40c5caa617cc"
  IID_IFaxJobStatus = LibC::GUID.new(0x8b86f485_u32, 0xfd7f_u16, 0x4824_u16, StaticArray[0x88_u8, 0x6b_u8, 0x40_u8, 0xc5_u8, 0xca_u8, 0xa6_u8, 0x17_u8, 0xcc_u8])
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

  IFaxServer_GUID = "475b6469-90a5-4878-a577-17a86e8e3462"
  IID_IFaxServer = LibC::GUID.new(0x475b6469_u32, 0x90a5_u16, 0x4878_u16, StaticArray[0xa5_u8, 0x77_u8, 0x17_u8, 0xa8_u8, 0x6e_u8, 0x8e_u8, 0x34_u8, 0x62_u8])
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

  IFaxDeviceProviders_GUID = "9fb76f62-4c7e-43a5-b6fd-502893f7e13e"
  IID_IFaxDeviceProviders = LibC::GUID.new(0x9fb76f62_u32, 0x4c7e_u16, 0x43a5_u16, StaticArray[0xb6_u8, 0xfd_u8, 0x50_u8, 0x28_u8, 0x93_u8, 0xf7_u8, 0xe1_u8, 0x3e_u8])
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

  IFaxDevices_GUID = "9e46783e-f34f-482e-a360-0416becbbd96"
  IID_IFaxDevices = LibC::GUID.new(0x9e46783e_u32, 0xf34f_u16, 0x482e_u16, StaticArray[0xa3_u8, 0x60_u8, 0x4_u8, 0x16_u8, 0xbe_u8, 0xcb_u8, 0xbd_u8, 0x96_u8])
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

  IFaxInboundRouting_GUID = "8148c20f-9d52-45b1-bf96-38fc12713527"
  IID_IFaxInboundRouting = LibC::GUID.new(0x8148c20f_u32, 0x9d52_u16, 0x45b1_u16, StaticArray[0xbf_u8, 0x96_u8, 0x38_u8, 0xfc_u8, 0x12_u8, 0x71_u8, 0x35_u8, 0x27_u8])
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

  IFaxFolders_GUID = "dce3b2a8-a7ab-42bc-9d0a-3149457261a0"
  IID_IFaxFolders = LibC::GUID.new(0xdce3b2a8_u32, 0xa7ab_u16, 0x42bc_u16, StaticArray[0x9d_u8, 0xa_u8, 0x31_u8, 0x49_u8, 0x45_u8, 0x72_u8, 0x61_u8, 0xa0_u8])
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

  IFaxLoggingOptions_GUID = "34e64fb9-6b31-4d32-8b27-d286c0c33606"
  IID_IFaxLoggingOptions = LibC::GUID.new(0x34e64fb9_u32, 0x6b31_u16, 0x4d32_u16, StaticArray[0x8b_u8, 0x27_u8, 0xd2_u8, 0x86_u8, 0xc0_u8, 0xc3_u8, 0x36_u8, 0x6_u8])
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

  IFaxActivity_GUID = "4b106f97-3df5-40f2-bc3c-44cb8115ebdf"
  IID_IFaxActivity = LibC::GUID.new(0x4b106f97_u32, 0x3df5_u16, 0x40f2_u16, StaticArray[0xbc_u8, 0x3c_u8, 0x44_u8, 0xcb_u8, 0x81_u8, 0x15_u8, 0xeb_u8, 0xdf_u8])
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

  IFaxOutboundRouting_GUID = "25dc05a4-9909-41bd-a95b-7e5d1dec1d43"
  IID_IFaxOutboundRouting = LibC::GUID.new(0x25dc05a4_u32, 0x9909_u16, 0x41bd_u16, StaticArray[0xa9_u8, 0x5b_u8, 0x7e_u8, 0x5d_u8, 0x1d_u8, 0xec_u8, 0x1d_u8, 0x43_u8])
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

  IFaxReceiptOptions_GUID = "378efaeb-5fcb-4afb-b2ee-e16e80614487"
  IID_IFaxReceiptOptions = LibC::GUID.new(0x378efaeb_u32, 0x5fcb_u16, 0x4afb_u16, StaticArray[0xb2_u8, 0xee_u8, 0xe1_u8, 0x6e_u8, 0x80_u8, 0x61_u8, 0x44_u8, 0x87_u8])
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

  IFaxSecurity_GUID = "77b508c1-09c0-47a2-91eb-fce7fdf2690e"
  IID_IFaxSecurity = LibC::GUID.new(0x77b508c1_u32, 0x9c0_u16, 0x47a2_u16, StaticArray[0x91_u8, 0xeb_u8, 0xfc_u8, 0xe7_u8, 0xfd_u8, 0xf2_u8, 0x69_u8, 0xe_u8])
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

  IFaxDocument_GUID = "b207a246-09e3-4a4e-a7dc-fea31d29458f"
  IID_IFaxDocument = LibC::GUID.new(0xb207a246_u32, 0x9e3_u16, 0x4a4e_u16, StaticArray[0xa7_u8, 0xdc_u8, 0xfe_u8, 0xa3_u8, 0x1d_u8, 0x29_u8, 0x45_u8, 0x8f_u8])
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

  IFaxSender_GUID = "0d879d7d-f57a-4cc6-a6f9-3ee5d527b46a"
  IID_IFaxSender = LibC::GUID.new(0xd879d7d_u32, 0xf57a_u16, 0x4cc6_u16, StaticArray[0xa6_u8, 0xf9_u8, 0x3e_u8, 0xe5_u8, 0xd5_u8, 0x27_u8, 0xb4_u8, 0x6a_u8])
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

  IFaxRecipient_GUID = "9a3da3a0-538d-42b6-9444-aaa57d0ce2bc"
  IID_IFaxRecipient = LibC::GUID.new(0x9a3da3a0_u32, 0x538d_u16, 0x42b6_u16, StaticArray[0x94_u8, 0x44_u8, 0xaa_u8, 0xa5_u8, 0x7d_u8, 0xc_u8, 0xe2_u8, 0xbc_u8])
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

  IFaxRecipients_GUID = "b9c9de5a-894e-4492-9fa3-08c627c11d5d"
  IID_IFaxRecipients = LibC::GUID.new(0xb9c9de5a_u32, 0x894e_u16, 0x4492_u16, StaticArray[0x9f_u8, 0xa3_u8, 0x8_u8, 0xc6_u8, 0x27_u8, 0xc1_u8, 0x1d_u8, 0x5d_u8])
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

  IFaxIncomingArchive_GUID = "76062cc7-f714-4fbd-aa06-ed6e4a4b70f3"
  IID_IFaxIncomingArchive = LibC::GUID.new(0x76062cc7_u32, 0xf714_u16, 0x4fbd_u16, StaticArray[0xaa_u8, 0x6_u8, 0xed_u8, 0x6e_u8, 0x4a_u8, 0x4b_u8, 0x70_u8, 0xf3_u8])
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

  IFaxIncomingQueue_GUID = "902e64ef-8fd8-4b75-9725-6014df161545"
  IID_IFaxIncomingQueue = LibC::GUID.new(0x902e64ef_u32, 0x8fd8_u16, 0x4b75_u16, StaticArray[0x97_u8, 0x25_u8, 0x60_u8, 0x14_u8, 0xdf_u8, 0x16_u8, 0x15_u8, 0x45_u8])
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

  IFaxOutgoingArchive_GUID = "c9c28f40-8d80-4e53-810f-9a79919b49fd"
  IID_IFaxOutgoingArchive = LibC::GUID.new(0xc9c28f40_u32, 0x8d80_u16, 0x4e53_u16, StaticArray[0x81_u8, 0xf_u8, 0x9a_u8, 0x79_u8, 0x91_u8, 0x9b_u8, 0x49_u8, 0xfd_u8])
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

  IFaxOutgoingQueue_GUID = "80b1df24-d9ac-4333-b373-487cedc80ce5"
  IID_IFaxOutgoingQueue = LibC::GUID.new(0x80b1df24_u32, 0xd9ac_u16, 0x4333_u16, StaticArray[0xb3_u8, 0x73_u8, 0x48_u8, 0x7c_u8, 0xed_u8, 0xc8_u8, 0xc_u8, 0xe5_u8])
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

  IFaxIncomingMessageIterator_GUID = "fd73ecc4-6f06-4f52-82a8-f7ba06ae3108"
  IID_IFaxIncomingMessageIterator = LibC::GUID.new(0xfd73ecc4_u32, 0x6f06_u16, 0x4f52_u16, StaticArray[0x82_u8, 0xa8_u8, 0xf7_u8, 0xba_u8, 0x6_u8, 0xae_u8, 0x31_u8, 0x8_u8])
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

  IFaxIncomingMessage_GUID = "7cab88fa-2ef9-4851-b2f3-1d148fed8447"
  IID_IFaxIncomingMessage = LibC::GUID.new(0x7cab88fa_u32, 0x2ef9_u16, 0x4851_u16, StaticArray[0xb2_u8, 0xf3_u8, 0x1d_u8, 0x14_u8, 0x8f_u8, 0xed_u8, 0x84_u8, 0x47_u8])
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

  IFaxOutgoingJobs_GUID = "2c56d8e6-8c2f-4573-944c-e505f8f5aeed"
  IID_IFaxOutgoingJobs = LibC::GUID.new(0x2c56d8e6_u32, 0x8c2f_u16, 0x4573_u16, StaticArray[0x94_u8, 0x4c_u8, 0xe5_u8, 0x5_u8, 0xf8_u8, 0xf5_u8, 0xae_u8, 0xed_u8])
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

  IFaxOutgoingJob_GUID = "6356daad-6614-4583-bf7a-3ad67bbfc71c"
  IID_IFaxOutgoingJob = LibC::GUID.new(0x6356daad_u32, 0x6614_u16, 0x4583_u16, StaticArray[0xbf_u8, 0x7a_u8, 0x3a_u8, 0xd6_u8, 0x7b_u8, 0xbf_u8, 0xc7_u8, 0x1c_u8])
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

  IFaxOutgoingMessageIterator_GUID = "f5ec5d4f-b840-432f-9980-112fe42a9b7a"
  IID_IFaxOutgoingMessageIterator = LibC::GUID.new(0xf5ec5d4f_u32, 0xb840_u16, 0x432f_u16, StaticArray[0x99_u8, 0x80_u8, 0x11_u8, 0x2f_u8, 0xe4_u8, 0x2a_u8, 0x9b_u8, 0x7a_u8])
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

  IFaxOutgoingMessage_GUID = "f0ea35de-caa5-4a7c-82c7-2b60ba5f2be2"
  IID_IFaxOutgoingMessage = LibC::GUID.new(0xf0ea35de_u32, 0xcaa5_u16, 0x4a7c_u16, StaticArray[0x82_u8, 0xc7_u8, 0x2b_u8, 0x60_u8, 0xba_u8, 0x5f_u8, 0x2b_u8, 0xe2_u8])
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

  IFaxIncomingJobs_GUID = "011f04e9-4fd6-4c23-9513-b6b66bb26be9"
  IID_IFaxIncomingJobs = LibC::GUID.new(0x11f04e9_u32, 0x4fd6_u16, 0x4c23_u16, StaticArray[0x95_u8, 0x13_u8, 0xb6_u8, 0xb6_u8, 0x6b_u8, 0xb2_u8, 0x6b_u8, 0xe9_u8])
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

  IFaxIncomingJob_GUID = "207529e6-654a-4916-9f88-4d232ee8a107"
  IID_IFaxIncomingJob = LibC::GUID.new(0x207529e6_u32, 0x654a_u16, 0x4916_u16, StaticArray[0x9f_u8, 0x88_u8, 0x4d_u8, 0x23_u8, 0x2e_u8, 0xe8_u8, 0xa1_u8, 0x7_u8])
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

  IFaxDeviceProvider_GUID = "290eac63-83ec-449c-8417-f148df8c682a"
  IID_IFaxDeviceProvider = LibC::GUID.new(0x290eac63_u32, 0x83ec_u16, 0x449c_u16, StaticArray[0x84_u8, 0x17_u8, 0xf1_u8, 0x48_u8, 0xdf_u8, 0x8c_u8, 0x68_u8, 0x2a_u8])
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

  IFaxDevice_GUID = "49306c59-b52e-4867-9df4-ca5841c956d0"
  IID_IFaxDevice = LibC::GUID.new(0x49306c59_u32, 0xb52e_u16, 0x4867_u16, StaticArray[0x9d_u8, 0xf4_u8, 0xca_u8, 0x58_u8, 0x41_u8, 0xc9_u8, 0x56_u8, 0xd0_u8])
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

  IFaxActivityLogging_GUID = "1e29078b-5a69-497b-9592-49b7e7faddb5"
  IID_IFaxActivityLogging = LibC::GUID.new(0x1e29078b_u32, 0x5a69_u16, 0x497b_u16, StaticArray[0x95_u8, 0x92_u8, 0x49_u8, 0xb7_u8, 0xe7_u8, 0xfa_u8, 0xdd_u8, 0xb5_u8])
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

  IFaxEventLogging_GUID = "0880d965-20e8-42e4-8e17-944f192caad4"
  IID_IFaxEventLogging = LibC::GUID.new(0x880d965_u32, 0x20e8_u16, 0x42e4_u16, StaticArray[0x8e_u8, 0x17_u8, 0x94_u8, 0x4f_u8, 0x19_u8, 0x2c_u8, 0xaa_u8, 0xd4_u8])
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

  IFaxOutboundRoutingGroups_GUID = "235cbef7-c2de-4bfd-b8da-75097c82c87f"
  IID_IFaxOutboundRoutingGroups = LibC::GUID.new(0x235cbef7_u32, 0xc2de_u16, 0x4bfd_u16, StaticArray[0xb8_u8, 0xda_u8, 0x75_u8, 0x9_u8, 0x7c_u8, 0x82_u8, 0xc8_u8, 0x7f_u8])
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

  IFaxOutboundRoutingGroup_GUID = "ca6289a1-7e25-4f87-9a0b-93365734962c"
  IID_IFaxOutboundRoutingGroup = LibC::GUID.new(0xca6289a1_u32, 0x7e25_u16, 0x4f87_u16, StaticArray[0x9a_u8, 0xb_u8, 0x93_u8, 0x36_u8, 0x57_u8, 0x34_u8, 0x96_u8, 0x2c_u8])
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

  IFaxDeviceIds_GUID = "2f0f813f-4ce9-443e-8ca1-738cfaeee149"
  IID_IFaxDeviceIds = LibC::GUID.new(0x2f0f813f_u32, 0x4ce9_u16, 0x443e_u16, StaticArray[0x8c_u8, 0xa1_u8, 0x73_u8, 0x8c_u8, 0xfa_u8, 0xee_u8, 0xe1_u8, 0x49_u8])
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

  IFaxOutboundRoutingRules_GUID = "dcefa1e7-ae7d-4ed6-8521-369edcca5120"
  IID_IFaxOutboundRoutingRules = LibC::GUID.new(0xdcefa1e7_u32, 0xae7d_u16, 0x4ed6_u16, StaticArray[0x85_u8, 0x21_u8, 0x36_u8, 0x9e_u8, 0xdc_u8, 0xca_u8, 0x51_u8, 0x20_u8])
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

  IFaxOutboundRoutingRule_GUID = "e1f795d5-07c2-469f-b027-acacc23219da"
  IID_IFaxOutboundRoutingRule = LibC::GUID.new(0xe1f795d5_u32, 0x7c2_u16, 0x469f_u16, StaticArray[0xb0_u8, 0x27_u8, 0xac_u8, 0xac_u8, 0xc2_u8, 0x32_u8, 0x19_u8, 0xda_u8])
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

  IFaxInboundRoutingExtensions_GUID = "2f6c9673-7b26-42de-8eb0-915dcd2a4f4c"
  IID_IFaxInboundRoutingExtensions = LibC::GUID.new(0x2f6c9673_u32, 0x7b26_u16, 0x42de_u16, StaticArray[0x8e_u8, 0xb0_u8, 0x91_u8, 0x5d_u8, 0xcd_u8, 0x2a_u8, 0x4f_u8, 0x4c_u8])
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

  IFaxInboundRoutingExtension_GUID = "885b5e08-c26c-4ef9-af83-51580a750be1"
  IID_IFaxInboundRoutingExtension = LibC::GUID.new(0x885b5e08_u32, 0xc26c_u16, 0x4ef9_u16, StaticArray[0xaf_u8, 0x83_u8, 0x51_u8, 0x58_u8, 0xa_u8, 0x75_u8, 0xb_u8, 0xe1_u8])
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

  IFaxInboundRoutingMethods_GUID = "783fca10-8908-4473-9d69-f67fbea0c6b9"
  IID_IFaxInboundRoutingMethods = LibC::GUID.new(0x783fca10_u32, 0x8908_u16, 0x4473_u16, StaticArray[0x9d_u8, 0x69_u8, 0xf6_u8, 0x7f_u8, 0xbe_u8, 0xa0_u8, 0xc6_u8, 0xb9_u8])
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

  IFaxInboundRoutingMethod_GUID = "45700061-ad9d-4776-a8c4-64065492cf4b"
  IID_IFaxInboundRoutingMethod = LibC::GUID.new(0x45700061_u32, 0xad9d_u16, 0x4776_u16, StaticArray[0xa8_u8, 0xc4_u8, 0x64_u8, 0x6_u8, 0x54_u8, 0x92_u8, 0xcf_u8, 0x4b_u8])
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

  IFaxDocument2_GUID = "e1347661-f9ef-4d6d-b4a5-c0a068b65cff"
  IID_IFaxDocument2 = LibC::GUID.new(0xe1347661_u32, 0xf9ef_u16, 0x4d6d_u16, StaticArray[0xb4_u8, 0xa5_u8, 0xc0_u8, 0xa0_u8, 0x68_u8, 0xb6_u8, 0x5c_u8, 0xff_u8])
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

  IFaxConfiguration_GUID = "10f4d0f7-0994-4543-ab6e-506949128c40"
  IID_IFaxConfiguration = LibC::GUID.new(0x10f4d0f7_u32, 0x994_u16, 0x4543_u16, StaticArray[0xab_u8, 0x6e_u8, 0x50_u8, 0x69_u8, 0x49_u8, 0x12_u8, 0x8c_u8, 0x40_u8])
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

  IFaxServer2_GUID = "571ced0f-5609-4f40-9176-547e3a72ca7c"
  IID_IFaxServer2 = LibC::GUID.new(0x571ced0f_u32, 0x5609_u16, 0x4f40_u16, StaticArray[0x91_u8, 0x76_u8, 0x54_u8, 0x7e_u8, 0x3a_u8, 0x72_u8, 0xca_u8, 0x7c_u8])
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

  IFaxAccountSet_GUID = "7428fbae-841e-47b8-86f4-2288946dca1b"
  IID_IFaxAccountSet = LibC::GUID.new(0x7428fbae_u32, 0x841e_u16, 0x47b8_u16, StaticArray[0x86_u8, 0xf4_u8, 0x22_u8, 0x88_u8, 0x94_u8, 0x6d_u8, 0xca_u8, 0x1b_u8])
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

  IFaxAccounts_GUID = "93ea8162-8be7-42d1-ae7b-ec74e2d989da"
  IID_IFaxAccounts = LibC::GUID.new(0x93ea8162_u32, 0x8be7_u16, 0x42d1_u16, StaticArray[0xae_u8, 0x7b_u8, 0xec_u8, 0x74_u8, 0xe2_u8, 0xd9_u8, 0x89_u8, 0xda_u8])
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

  IFaxAccount_GUID = "68535b33-5dc4-4086-be26-b76f9b711006"
  IID_IFaxAccount = LibC::GUID.new(0x68535b33_u32, 0x5dc4_u16, 0x4086_u16, StaticArray[0xbe_u8, 0x26_u8, 0xb7_u8, 0x6f_u8, 0x9b_u8, 0x71_u8, 0x10_u8, 0x6_u8])
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

  IFaxOutgoingJob2_GUID = "418a8d96-59a0-4789-b176-edf3dc8fa8f7"
  IID_IFaxOutgoingJob2 = LibC::GUID.new(0x418a8d96_u32, 0x59a0_u16, 0x4789_u16, StaticArray[0xb1_u8, 0x76_u8, 0xed_u8, 0xf3_u8, 0xdc_u8, 0x8f_u8, 0xa8_u8, 0xf7_u8])
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

  IFaxAccountFolders_GUID = "6463f89d-23d8-46a9-8f86-c47b77ca7926"
  IID_IFaxAccountFolders = LibC::GUID.new(0x6463f89d_u32, 0x23d8_u16, 0x46a9_u16, StaticArray[0x8f_u8, 0x86_u8, 0xc4_u8, 0x7b_u8, 0x77_u8, 0xca_u8, 0x79_u8, 0x26_u8])
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

  IFaxAccountIncomingQueue_GUID = "dd142d92-0186-4a95-a090-cbc3eadba6b4"
  IID_IFaxAccountIncomingQueue = LibC::GUID.new(0xdd142d92_u32, 0x186_u16, 0x4a95_u16, StaticArray[0xa0_u8, 0x90_u8, 0xcb_u8, 0xc3_u8, 0xea_u8, 0xdb_u8, 0xa6_u8, 0xb4_u8])
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

  IFaxAccountOutgoingQueue_GUID = "0f1424e9-f22d-4553-b7a5-0d24bd0d7e46"
  IID_IFaxAccountOutgoingQueue = LibC::GUID.new(0xf1424e9_u32, 0xf22d_u16, 0x4553_u16, StaticArray[0xb7_u8, 0xa5_u8, 0xd_u8, 0x24_u8, 0xbd_u8, 0xd_u8, 0x7e_u8, 0x46_u8])
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

  IFaxOutgoingMessage2_GUID = "b37df687-bc88-4b46-b3be-b458b3ea9e7f"
  IID_IFaxOutgoingMessage2 = LibC::GUID.new(0xb37df687_u32, 0xbc88_u16, 0x4b46_u16, StaticArray[0xb3_u8, 0xbe_u8, 0xb4_u8, 0x58_u8, 0xb3_u8, 0xea_u8, 0x9e_u8, 0x7f_u8])
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

  IFaxAccountIncomingArchive_GUID = "a8a5b6ef-e0d6-4aee-955c-91625bec9db4"
  IID_IFaxAccountIncomingArchive = LibC::GUID.new(0xa8a5b6ef_u32, 0xe0d6_u16, 0x4aee_u16, StaticArray[0x95_u8, 0x5c_u8, 0x91_u8, 0x62_u8, 0x5b_u8, 0xec_u8, 0x9d_u8, 0xb4_u8])
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

  IFaxAccountOutgoingArchive_GUID = "5463076d-ec14-491f-926e-b3ceda5e5662"
  IID_IFaxAccountOutgoingArchive = LibC::GUID.new(0x5463076d_u32, 0xec14_u16, 0x491f_u16, StaticArray[0x92_u8, 0x6e_u8, 0xb3_u8, 0xce_u8, 0xda_u8, 0x5e_u8, 0x56_u8, 0x62_u8])
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

  IFaxSecurity2_GUID = "17d851f4-d09b-48fc-99c9-8f24c4db9ab1"
  IID_IFaxSecurity2 = LibC::GUID.new(0x17d851f4_u32, 0xd09b_u16, 0x48fc_u16, StaticArray[0x99_u8, 0xc9_u8, 0x8f_u8, 0x24_u8, 0xc4_u8, 0xdb_u8, 0x9a_u8, 0xb1_u8])
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

  IFaxIncomingMessage2_GUID = "f9208503-e2bc-48f3-9ec0-e6236f9b509a"
  IID_IFaxIncomingMessage2 = LibC::GUID.new(0xf9208503_u32, 0xe2bc_u16, 0x48f3_u16, StaticArray[0x9e_u8, 0xc0_u8, 0xe6_u8, 0x23_u8, 0x6f_u8, 0x9b_u8, 0x50_u8, 0x9a_u8])
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

  IFaxServerNotify_GUID = "2e037b27-cf8a-4abd-b1e0-5704943bea6f"
  IID_IFaxServerNotify = LibC::GUID.new(0x2e037b27_u32, 0xcf8a_u16, 0x4abd_u16, StaticArray[0xb1_u8, 0xe0_u8, 0x57_u8, 0x4_u8, 0x94_u8, 0x3b_u8, 0xea_u8, 0x6f_u8])
  struct IFaxServerNotify
    lpVtbl : IFaxServerNotifyVTbl*
  end

  struct IIFaxServerNotify2VTbl
    query_interface : Proc(IIFaxServerNotify2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIFaxServerNotify2*, UInt32)
    release : Proc(IIFaxServerNotify2*, UInt32)
    get_type_info_count : Proc(IIFaxServerNotify2*, UInt32*, HRESULT)
    get_type_info : Proc(IIFaxServerNotify2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIFaxServerNotify2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIFaxServerNotify2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_incoming_job_added : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_incoming_job_removed : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_incoming_job_changed : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, IFaxJobStatus, HRESULT)
    on_outgoing_job_added : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_job_removed : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_job_changed : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, IFaxJobStatus, HRESULT)
    on_incoming_message_added : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_incoming_message_removed : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_message_added : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_outgoing_message_removed : Proc(IIFaxServerNotify2*, IFaxServer2, UInt8*, HRESULT)
    on_receipt_options_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_activity_logging_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_security_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_event_logging_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outgoing_queue_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outgoing_archive_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_incoming_archive_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_devices_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outbound_routing_groups_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_outbound_routing_rules_config_change : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_server_activity_change : Proc(IIFaxServerNotify2*, IFaxServer2, Int32, Int32, Int32, Int32, HRESULT)
    on_queues_status_change : Proc(IIFaxServerNotify2*, IFaxServer2, Int16, Int16, Int16, HRESULT)
    on_new_call : Proc(IIFaxServerNotify2*, IFaxServer2, Int32, Int32, UInt8*, HRESULT)
    on_server_shut_down : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
    on_device_status_change : Proc(IIFaxServerNotify2*, IFaxServer2, Int32, Int16, Int16, Int16, Int16, HRESULT)
    on_general_server_config_changed : Proc(IIFaxServerNotify2*, IFaxServer2, HRESULT)
  end

  IIFaxServerNotify2_GUID = "ec9c69b9-5fe7-4805-9467-82fcd96af903"
  IID_IIFaxServerNotify2 = LibC::GUID.new(0xec9c69b9_u32, 0x5fe7_u16, 0x4805_u16, StaticArray[0x94_u8, 0x67_u8, 0x82_u8, 0xfc_u8, 0xd9_u8, 0x6a_u8, 0xf9_u8, 0x3_u8])
  struct IIFaxServerNotify2
    lpVtbl : IIFaxServerNotify2VTbl*
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

  IFaxServerNotify2_GUID = "616ca8d6-a77a-4062-abfd-0e471241c7aa"
  IID_IFaxServerNotify2 = LibC::GUID.new(0x616ca8d6_u32, 0xa77a_u16, 0x4062_u16, StaticArray[0xab_u8, 0xfd_u8, 0xe_u8, 0x47_u8, 0x12_u8, 0x41_u8, 0xc7_u8, 0xaa_u8])
  struct IFaxServerNotify2
    lpVtbl : IFaxServerNotify2VTbl*
  end

  struct IIFaxAccountNotifyVTbl
    query_interface : Proc(IIFaxAccountNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIFaxAccountNotify*, UInt32)
    release : Proc(IIFaxAccountNotify*, UInt32)
    get_type_info_count : Proc(IIFaxAccountNotify*, UInt32*, HRESULT)
    get_type_info : Proc(IIFaxAccountNotify*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIFaxAccountNotify*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIFaxAccountNotify*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_incoming_job_added : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_incoming_job_removed : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_incoming_job_changed : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, IFaxJobStatus, HRESULT)
    on_outgoing_job_added : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_outgoing_job_removed : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_outgoing_job_changed : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, IFaxJobStatus, HRESULT)
    on_incoming_message_added : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, Int16, HRESULT)
    on_incoming_message_removed : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, Int16, HRESULT)
    on_outgoing_message_added : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_outgoing_message_removed : Proc(IIFaxAccountNotify*, IFaxAccount, UInt8*, HRESULT)
    on_server_shut_down : Proc(IIFaxAccountNotify*, IFaxServer2, HRESULT)
  end

  IIFaxAccountNotify_GUID = "b9b3bc81-ac1b-46f3-b39d-0adc30e1b788"
  IID_IIFaxAccountNotify = LibC::GUID.new(0xb9b3bc81_u32, 0xac1b_u16, 0x46f3_u16, StaticArray[0xb3_u8, 0x9d_u8, 0xa_u8, 0xdc_u8, 0x30_u8, 0xe1_u8, 0xb7_u8, 0x88_u8])
  struct IIFaxAccountNotify
    lpVtbl : IIFaxAccountNotifyVTbl*
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

  IFaxAccountNotify_GUID = "0b5e5bd1-b8a9-47a0-a323-ef4a293ba06a"
  IID_IFaxAccountNotify = LibC::GUID.new(0xb5e5bd1_u32, 0xb8a9_u16, 0x47a0_u16, StaticArray[0xa3_u8, 0x23_u8, 0xef_u8, 0x4a_u8, 0x29_u8, 0x3b_u8, 0xa0_u8, 0x6a_u8])
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

  IStillImageW_GUID = "641bd880-2dc8-11d0-90ea-00aa0060f86c"
  IID_IStillImageW = LibC::GUID.new(0x641bd880_u32, 0x2dc8_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
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

  IStiDevice_GUID = "6cfa5a80-2dc8-11d0-90ea-00aa0060f86c"
  IID_IStiDevice = LibC::GUID.new(0x6cfa5a80_u32, 0x2dc8_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
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

  IStiDeviceControl_GUID = "128a9860-52dc-11d0-9edf-444553540000"
  IID_IStiDeviceControl = LibC::GUID.new(0x128a9860_u32, 0x52dc_u16, 0x11d0_u16, StaticArray[0x9e_u8, 0xdf_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
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
  def query_interface(this : IFaxJobStatus*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxJobStatus*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxJobStatus*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxJobStatus*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxJobStatus*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxJobStatus*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxJobStatus*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status(this : IFaxJobStatus*, pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_pages(this : IFaxJobStatus*, plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.call(this, plpages)
  end
  def get_size(this : IFaxJobStatus*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_current_page(this : IFaxJobStatus*, plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.call(this, plcurrentpage)
  end
  def get_device_id(this : IFaxJobStatus*, pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.call(this, pldeviceid)
  end
  def get_csid(this : IFaxJobStatus*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxJobStatus*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def get_extended_status_code(this : IFaxJobStatus*, pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.call(this, pextendedstatuscode)
  end
  def get_extended_status(this : IFaxJobStatus*, pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.call(this, pbstrextendedstatus)
  end
  def get_available_operations(this : IFaxJobStatus*, pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.call(this, pavailableoperations)
  end
  def get_retries(this : IFaxJobStatus*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_job_type(this : IFaxJobStatus*, pjobtype : FAX_JOB_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_job_type.call(this, pjobtype)
  end
  def get_scheduled_time(this : IFaxJobStatus*, pdatescheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_scheduled_time.call(this, pdatescheduledtime)
  end
  def get_transmission_start(this : IFaxJobStatus*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxJobStatus*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_caller_id(this : IFaxJobStatus*, pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.call(this, pbstrcallerid)
  end
  def get_routing_information(this : IFaxJobStatus*, pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.call(this, pbstrroutinginformation)
  end
end
struct LibWin32::IFaxServer
  def query_interface(this : IFaxServer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxServer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxServer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxServer*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxServer*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxServer*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxServer*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect(this : IFaxServer*, bstrservername : UInt8*) : HRESULT
    @lpVtbl.value.connect.call(this, bstrservername)
  end
  def get_server_name(this : IFaxServer*, pbstrservername : UInt8**) : HRESULT
    @lpVtbl.value.get_server_name.call(this, pbstrservername)
  end
  def get_device_providers(this : IFaxServer*, ppfaxdeviceproviders : IFaxDeviceProviders*) : HRESULT
    @lpVtbl.value.get_device_providers.call(this, ppfaxdeviceproviders)
  end
  def get_devices(this : IFaxServer*, ppfaxdevices : IFaxDevices*) : HRESULT
    @lpVtbl.value.get_devices.call(this, ppfaxdevices)
  end
  def get_inbound_routing(this : IFaxServer*, ppfaxinboundrouting : IFaxInboundRouting*) : HRESULT
    @lpVtbl.value.get_inbound_routing.call(this, ppfaxinboundrouting)
  end
  def get_folders(this : IFaxServer*, pfaxfolders : IFaxFolders*) : HRESULT
    @lpVtbl.value.get_folders.call(this, pfaxfolders)
  end
  def get_logging_options(this : IFaxServer*, ppfaxloggingoptions : IFaxLoggingOptions*) : HRESULT
    @lpVtbl.value.get_logging_options.call(this, ppfaxloggingoptions)
  end
  def get_major_version(this : IFaxServer*, plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.call(this, plmajorversion)
  end
  def get_minor_version(this : IFaxServer*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.call(this, plminorversion)
  end
  def get_major_build(this : IFaxServer*, plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.call(this, plmajorbuild)
  end
  def get_minor_build(this : IFaxServer*, plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.call(this, plminorbuild)
  end
  def get_debug(this : IFaxServer*, pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.call(this, pbdebug)
  end
  def get_activity(this : IFaxServer*, ppfaxactivity : IFaxActivity*) : HRESULT
    @lpVtbl.value.get_activity.call(this, ppfaxactivity)
  end
  def get_outbound_routing(this : IFaxServer*, ppfaxoutboundrouting : IFaxOutboundRouting*) : HRESULT
    @lpVtbl.value.get_outbound_routing.call(this, ppfaxoutboundrouting)
  end
  def get_receipt_options(this : IFaxServer*, ppfaxreceiptoptions : IFaxReceiptOptions*) : HRESULT
    @lpVtbl.value.get_receipt_options.call(this, ppfaxreceiptoptions)
  end
  def get_security(this : IFaxServer*, ppfaxsecurity : IFaxSecurity*) : HRESULT
    @lpVtbl.value.get_security.call(this, ppfaxsecurity)
  end
  def disconnect(this : IFaxServer*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def get_extension_property(this : IFaxServer*, bstrguid : UInt8*, pvproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension_property.call(this, bstrguid, pvproperty)
  end
  def set_extension_property(this : IFaxServer*, bstrguid : UInt8*, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_extension_property.call(this, bstrguid, vproperty)
  end
  def listen_to_server_events(this : IFaxServer*, eventtypes : FAX_SERVER_EVENTS_TYPE_ENUM) : HRESULT
    @lpVtbl.value.listen_to_server_events.call(this, eventtypes)
  end
  def register_device_provider(this : IFaxServer*, bstrguid : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, tspname : UInt8*, lfspiversion : Int32) : HRESULT
    @lpVtbl.value.register_device_provider.call(this, bstrguid, bstrfriendlyname, bstrimagename, tspname, lfspiversion)
  end
  def unregister_device_provider(this : IFaxServer*, bstruniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_device_provider.call(this, bstruniquename)
  end
  def register_inbound_routing_extension(this : IFaxServer*, bstrextensionname : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, vmethods : VARIANT) : HRESULT
    @lpVtbl.value.register_inbound_routing_extension.call(this, bstrextensionname, bstrfriendlyname, bstrimagename, vmethods)
  end
  def unregister_inbound_routing_extension(this : IFaxServer*, bstrextensionuniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_inbound_routing_extension.call(this, bstrextensionuniquename)
  end
  def get_registered_events(this : IFaxServer*, peventtypes : FAX_SERVER_EVENTS_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_registered_events.call(this, peventtypes)
  end
  def get_api_version(this : IFaxServer*, papiversion : FAX_SERVER_APIVERSION_ENUM*) : HRESULT
    @lpVtbl.value.get_api_version.call(this, papiversion)
  end
end
struct LibWin32::IFaxDeviceProviders
  def query_interface(this : IFaxDeviceProviders*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxDeviceProviders*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxDeviceProviders*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxDeviceProviders*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxDeviceProviders*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxDeviceProviders*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxDeviceProviders*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxDeviceProviders*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxDeviceProviders*, vindex : VARIANT, pfaxdeviceprovider : IFaxDeviceProvider*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxdeviceprovider)
  end
  def get_count(this : IFaxDeviceProviders*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
end
struct LibWin32::IFaxDevices
  def query_interface(this : IFaxDevices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxDevices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxDevices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxDevices*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxDevices*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxDevices*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxDevices*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxDevices*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxDevices*, vindex : VARIANT, pfaxdevice : IFaxDevice*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxdevice)
  end
  def get_count(this : IFaxDevices*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def get_item_by_id(this : IFaxDevices*, lid : Int32, ppfaxdevice : IFaxDevice*) : HRESULT
    @lpVtbl.value.get_item_by_id.call(this, lid, ppfaxdevice)
  end
end
struct LibWin32::IFaxInboundRouting
  def query_interface(this : IFaxInboundRouting*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxInboundRouting*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxInboundRouting*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxInboundRouting*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxInboundRouting*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxInboundRouting*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxInboundRouting*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_extensions(this : IFaxInboundRouting*, pfaxinboundroutingextensions : IFaxInboundRoutingExtensions*) : HRESULT
    @lpVtbl.value.get_extensions.call(this, pfaxinboundroutingextensions)
  end
  def get_methods(this : IFaxInboundRouting*, pfaxinboundroutingmethods : IFaxInboundRoutingMethods*) : HRESULT
    @lpVtbl.value.get_methods.call(this, pfaxinboundroutingmethods)
  end
end
struct LibWin32::IFaxFolders
  def query_interface(this : IFaxFolders*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxFolders*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxFolders*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxFolders*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxFolders*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxFolders*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxFolders*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_outgoing_queue(this : IFaxFolders*, pfaxoutgoingqueue : IFaxOutgoingQueue*) : HRESULT
    @lpVtbl.value.get_outgoing_queue.call(this, pfaxoutgoingqueue)
  end
  def get_incoming_queue(this : IFaxFolders*, pfaxincomingqueue : IFaxIncomingQueue*) : HRESULT
    @lpVtbl.value.get_incoming_queue.call(this, pfaxincomingqueue)
  end
  def get_incoming_archive(this : IFaxFolders*, pfaxincomingarchive : IFaxIncomingArchive*) : HRESULT
    @lpVtbl.value.get_incoming_archive.call(this, pfaxincomingarchive)
  end
  def get_outgoing_archive(this : IFaxFolders*, pfaxoutgoingarchive : IFaxOutgoingArchive*) : HRESULT
    @lpVtbl.value.get_outgoing_archive.call(this, pfaxoutgoingarchive)
  end
end
struct LibWin32::IFaxLoggingOptions
  def query_interface(this : IFaxLoggingOptions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxLoggingOptions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxLoggingOptions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxLoggingOptions*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxLoggingOptions*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxLoggingOptions*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxLoggingOptions*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_logging(this : IFaxLoggingOptions*, pfaxeventlogging : IFaxEventLogging*) : HRESULT
    @lpVtbl.value.get_event_logging.call(this, pfaxeventlogging)
  end
  def get_activity_logging(this : IFaxLoggingOptions*, pfaxactivitylogging : IFaxActivityLogging*) : HRESULT
    @lpVtbl.value.get_activity_logging.call(this, pfaxactivitylogging)
  end
end
struct LibWin32::IFaxActivity
  def query_interface(this : IFaxActivity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxActivity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxActivity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxActivity*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxActivity*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxActivity*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxActivity*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_incoming_messages(this : IFaxActivity*, plincomingmessages : Int32*) : HRESULT
    @lpVtbl.value.get_incoming_messages.call(this, plincomingmessages)
  end
  def get_routing_messages(this : IFaxActivity*, plroutingmessages : Int32*) : HRESULT
    @lpVtbl.value.get_routing_messages.call(this, plroutingmessages)
  end
  def get_outgoing_messages(this : IFaxActivity*, ploutgoingmessages : Int32*) : HRESULT
    @lpVtbl.value.get_outgoing_messages.call(this, ploutgoingmessages)
  end
  def get_queued_messages(this : IFaxActivity*, plqueuedmessages : Int32*) : HRESULT
    @lpVtbl.value.get_queued_messages.call(this, plqueuedmessages)
  end
  def refresh(this : IFaxActivity*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
end
struct LibWin32::IFaxOutboundRouting
  def query_interface(this : IFaxOutboundRouting*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutboundRouting*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutboundRouting*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutboundRouting*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutboundRouting*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutboundRouting*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutboundRouting*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_groups(this : IFaxOutboundRouting*, pfaxoutboundroutinggroups : IFaxOutboundRoutingGroups*) : HRESULT
    @lpVtbl.value.get_groups.call(this, pfaxoutboundroutinggroups)
  end
  def get_rules(this : IFaxOutboundRouting*, pfaxoutboundroutingrules : IFaxOutboundRoutingRules*) : HRESULT
    @lpVtbl.value.get_rules.call(this, pfaxoutboundroutingrules)
  end
end
struct LibWin32::IFaxReceiptOptions
  def query_interface(this : IFaxReceiptOptions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxReceiptOptions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxReceiptOptions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxReceiptOptions*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxReceiptOptions*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxReceiptOptions*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxReceiptOptions*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_authentication_type(this : IFaxReceiptOptions*, ptype : FAX_SMTP_AUTHENTICATION_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_authentication_type.call(this, ptype)
  end
  def put_authentication_type(this : IFaxReceiptOptions*, type : FAX_SMTP_AUTHENTICATION_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_authentication_type.call(this, type)
  end
  def get_smtp_server(this : IFaxReceiptOptions*, pbstrsmtpserver : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_server.call(this, pbstrsmtpserver)
  end
  def put_smtp_server(this : IFaxReceiptOptions*, bstrsmtpserver : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_server.call(this, bstrsmtpserver)
  end
  def get_smtp_port(this : IFaxReceiptOptions*, plsmtpport : Int32*) : HRESULT
    @lpVtbl.value.get_smtp_port.call(this, plsmtpport)
  end
  def put_smtp_port(this : IFaxReceiptOptions*, lsmtpport : Int32) : HRESULT
    @lpVtbl.value.put_smtp_port.call(this, lsmtpport)
  end
  def get_smtp_sender(this : IFaxReceiptOptions*, pbstrsmtpsender : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_sender.call(this, pbstrsmtpsender)
  end
  def put_smtp_sender(this : IFaxReceiptOptions*, bstrsmtpsender : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_sender.call(this, bstrsmtpsender)
  end
  def get_smtp_user(this : IFaxReceiptOptions*, pbstrsmtpuser : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_user.call(this, pbstrsmtpuser)
  end
  def put_smtp_user(this : IFaxReceiptOptions*, bstrsmtpuser : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_user.call(this, bstrsmtpuser)
  end
  def get_allowed_receipts(this : IFaxReceiptOptions*, pallowedreceipts : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_allowed_receipts.call(this, pallowedreceipts)
  end
  def put_allowed_receipts(this : IFaxReceiptOptions*, allowedreceipts : FAX_RECEIPT_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_allowed_receipts.call(this, allowedreceipts)
  end
  def get_smtp_password(this : IFaxReceiptOptions*, pbstrsmtppassword : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_password.call(this, pbstrsmtppassword)
  end
  def put_smtp_password(this : IFaxReceiptOptions*, bstrsmtppassword : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_password.call(this, bstrsmtppassword)
  end
  def refresh(this : IFaxReceiptOptions*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxReceiptOptions*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_use_for_inbound_routing(this : IFaxReceiptOptions*, pbuseforinboundrouting : Int16*) : HRESULT
    @lpVtbl.value.get_use_for_inbound_routing.call(this, pbuseforinboundrouting)
  end
  def put_use_for_inbound_routing(this : IFaxReceiptOptions*, buseforinboundrouting : Int16) : HRESULT
    @lpVtbl.value.put_use_for_inbound_routing.call(this, buseforinboundrouting)
  end
end
struct LibWin32::IFaxSecurity
  def query_interface(this : IFaxSecurity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxSecurity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxSecurity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxSecurity*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxSecurity*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxSecurity*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxSecurity*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_descriptor(this : IFaxSecurity*, pvdescriptor : VARIANT*) : HRESULT
    @lpVtbl.value.get_descriptor.call(this, pvdescriptor)
  end
  def put_descriptor(this : IFaxSecurity*, vdescriptor : VARIANT) : HRESULT
    @lpVtbl.value.put_descriptor.call(this, vdescriptor)
  end
  def get_granted_rights(this : IFaxSecurity*, pgrantedrights : FAX_ACCESS_RIGHTS_ENUM*) : HRESULT
    @lpVtbl.value.get_granted_rights.call(this, pgrantedrights)
  end
  def refresh(this : IFaxSecurity*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxSecurity*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_information_type(this : IFaxSecurity*, plinformationtype : Int32*) : HRESULT
    @lpVtbl.value.get_information_type.call(this, plinformationtype)
  end
  def put_information_type(this : IFaxSecurity*, linformationtype : Int32) : HRESULT
    @lpVtbl.value.put_information_type.call(this, linformationtype)
  end
end
struct LibWin32::IFaxDocument
  def query_interface(this : IFaxDocument*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxDocument*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxDocument*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxDocument*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxDocument*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxDocument*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxDocument*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_body(this : IFaxDocument*, pbstrbody : UInt8**) : HRESULT
    @lpVtbl.value.get_body.call(this, pbstrbody)
  end
  def put_body(this : IFaxDocument*, bstrbody : UInt8*) : HRESULT
    @lpVtbl.value.put_body.call(this, bstrbody)
  end
  def get_sender(this : IFaxDocument*, ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.call(this, ppfaxsender)
  end
  def get_recipients(this : IFaxDocument*, ppfaxrecipients : IFaxRecipients*) : HRESULT
    @lpVtbl.value.get_recipients.call(this, ppfaxrecipients)
  end
  def get_cover_page(this : IFaxDocument*, pbstrcoverpage : UInt8**) : HRESULT
    @lpVtbl.value.get_cover_page.call(this, pbstrcoverpage)
  end
  def put_cover_page(this : IFaxDocument*, bstrcoverpage : UInt8*) : HRESULT
    @lpVtbl.value.put_cover_page.call(this, bstrcoverpage)
  end
  def get_subject(this : IFaxDocument*, pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, pbstrsubject)
  end
  def put_subject(this : IFaxDocument*, bstrsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.call(this, bstrsubject)
  end
  def get_note(this : IFaxDocument*, pbstrnote : UInt8**) : HRESULT
    @lpVtbl.value.get_note.call(this, pbstrnote)
  end
  def put_note(this : IFaxDocument*, bstrnote : UInt8*) : HRESULT
    @lpVtbl.value.put_note.call(this, bstrnote)
  end
  def get_schedule_time(this : IFaxDocument*, pdatescheduletime : Float64*) : HRESULT
    @lpVtbl.value.get_schedule_time.call(this, pdatescheduletime)
  end
  def put_schedule_time(this : IFaxDocument*, datescheduletime : Float64) : HRESULT
    @lpVtbl.value.put_schedule_time.call(this, datescheduletime)
  end
  def get_receipt_address(this : IFaxDocument*, pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.call(this, pbstrreceiptaddress)
  end
  def put_receipt_address(this : IFaxDocument*, bstrreceiptaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_receipt_address.call(this, bstrreceiptaddress)
  end
  def get_document_name(this : IFaxDocument*, pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.call(this, pbstrdocumentname)
  end
  def put_document_name(this : IFaxDocument*, bstrdocumentname : UInt8*) : HRESULT
    @lpVtbl.value.put_document_name.call(this, bstrdocumentname)
  end
  def get_call_handle(this : IFaxDocument*, plcallhandle : Int32*) : HRESULT
    @lpVtbl.value.get_call_handle.call(this, plcallhandle)
  end
  def put_call_handle(this : IFaxDocument*, lcallhandle : Int32) : HRESULT
    @lpVtbl.value.put_call_handle.call(this, lcallhandle)
  end
  def get_cover_page_type(this : IFaxDocument*, pcoverpagetype : FAX_COVERPAGE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_cover_page_type.call(this, pcoverpagetype)
  end
  def put_cover_page_type(this : IFaxDocument*, coverpagetype : FAX_COVERPAGE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_cover_page_type.call(this, coverpagetype)
  end
  def get_schedule_type(this : IFaxDocument*, pscheduletype : FAX_SCHEDULE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_schedule_type.call(this, pscheduletype)
  end
  def put_schedule_type(this : IFaxDocument*, scheduletype : FAX_SCHEDULE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_schedule_type.call(this, scheduletype)
  end
  def get_receipt_type(this : IFaxDocument*, preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.call(this, preceipttype)
  end
  def put_receipt_type(this : IFaxDocument*, receipttype : FAX_RECEIPT_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_receipt_type.call(this, receipttype)
  end
  def get_group_broadcast_receipts(this : IFaxDocument*, pbusegrouping : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.call(this, pbusegrouping)
  end
  def put_group_broadcast_receipts(this : IFaxDocument*, busegrouping : Int16) : HRESULT
    @lpVtbl.value.put_group_broadcast_receipts.call(this, busegrouping)
  end
  def get_priority(this : IFaxDocument*, ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def put_priority(this : IFaxDocument*, priority : FAX_PRIORITY_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_priority.call(this, priority)
  end
  def get_tapi_connection(this : IFaxDocument*, pptapiconnection : IDispatch*) : HRESULT
    @lpVtbl.value.get_tapi_connection.call(this, pptapiconnection)
  end
  def putref_tapi_connection(this : IFaxDocument*, ptapiconnection : IDispatch) : HRESULT
    @lpVtbl.value.putref_tapi_connection.call(this, ptapiconnection)
  end
  def submit(this : IFaxDocument*, bstrfaxservername : UInt8*, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.submit.call(this, bstrfaxservername, pvfaxoutgoingjobids)
  end
  def connected_submit(this : IFaxDocument*, pfaxserver : IFaxServer, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.connected_submit.call(this, pfaxserver, pvfaxoutgoingjobids)
  end
  def get_attach_fax_to_receipt(this : IFaxDocument*, pbattachfax : Int16*) : HRESULT
    @lpVtbl.value.get_attach_fax_to_receipt.call(this, pbattachfax)
  end
  def put_attach_fax_to_receipt(this : IFaxDocument*, battachfax : Int16) : HRESULT
    @lpVtbl.value.put_attach_fax_to_receipt.call(this, battachfax)
  end
end
struct LibWin32::IFaxSender
  def query_interface(this : IFaxSender*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxSender*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxSender*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxSender*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxSender*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxSender*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxSender*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_billing_code(this : IFaxSender*, pbstrbillingcode : UInt8**) : HRESULT
    @lpVtbl.value.get_billing_code.call(this, pbstrbillingcode)
  end
  def put_billing_code(this : IFaxSender*, bstrbillingcode : UInt8*) : HRESULT
    @lpVtbl.value.put_billing_code.call(this, bstrbillingcode)
  end
  def get_city(this : IFaxSender*, pbstrcity : UInt8**) : HRESULT
    @lpVtbl.value.get_city.call(this, pbstrcity)
  end
  def put_city(this : IFaxSender*, bstrcity : UInt8*) : HRESULT
    @lpVtbl.value.put_city.call(this, bstrcity)
  end
  def get_company(this : IFaxSender*, pbstrcompany : UInt8**) : HRESULT
    @lpVtbl.value.get_company.call(this, pbstrcompany)
  end
  def put_company(this : IFaxSender*, bstrcompany : UInt8*) : HRESULT
    @lpVtbl.value.put_company.call(this, bstrcompany)
  end
  def get_country(this : IFaxSender*, pbstrcountry : UInt8**) : HRESULT
    @lpVtbl.value.get_country.call(this, pbstrcountry)
  end
  def put_country(this : IFaxSender*, bstrcountry : UInt8*) : HRESULT
    @lpVtbl.value.put_country.call(this, bstrcountry)
  end
  def get_department(this : IFaxSender*, pbstrdepartment : UInt8**) : HRESULT
    @lpVtbl.value.get_department.call(this, pbstrdepartment)
  end
  def put_department(this : IFaxSender*, bstrdepartment : UInt8*) : HRESULT
    @lpVtbl.value.put_department.call(this, bstrdepartment)
  end
  def get_email(this : IFaxSender*, pbstremail : UInt8**) : HRESULT
    @lpVtbl.value.get_email.call(this, pbstremail)
  end
  def put_email(this : IFaxSender*, bstremail : UInt8*) : HRESULT
    @lpVtbl.value.put_email.call(this, bstremail)
  end
  def get_fax_number(this : IFaxSender*, pbstrfaxnumber : UInt8**) : HRESULT
    @lpVtbl.value.get_fax_number.call(this, pbstrfaxnumber)
  end
  def put_fax_number(this : IFaxSender*, bstrfaxnumber : UInt8*) : HRESULT
    @lpVtbl.value.put_fax_number.call(this, bstrfaxnumber)
  end
  def get_home_phone(this : IFaxSender*, pbstrhomephone : UInt8**) : HRESULT
    @lpVtbl.value.get_home_phone.call(this, pbstrhomephone)
  end
  def put_home_phone(this : IFaxSender*, bstrhomephone : UInt8*) : HRESULT
    @lpVtbl.value.put_home_phone.call(this, bstrhomephone)
  end
  def get_name(this : IFaxSender*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def put_name(this : IFaxSender*, bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrname)
  end
  def get_tsid(this : IFaxSender*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def put_tsid(this : IFaxSender*, bstrtsid : UInt8*) : HRESULT
    @lpVtbl.value.put_tsid.call(this, bstrtsid)
  end
  def get_office_phone(this : IFaxSender*, pbstrofficephone : UInt8**) : HRESULT
    @lpVtbl.value.get_office_phone.call(this, pbstrofficephone)
  end
  def put_office_phone(this : IFaxSender*, bstrofficephone : UInt8*) : HRESULT
    @lpVtbl.value.put_office_phone.call(this, bstrofficephone)
  end
  def get_office_location(this : IFaxSender*, pbstrofficelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_office_location.call(this, pbstrofficelocation)
  end
  def put_office_location(this : IFaxSender*, bstrofficelocation : UInt8*) : HRESULT
    @lpVtbl.value.put_office_location.call(this, bstrofficelocation)
  end
  def get_state(this : IFaxSender*, pbstrstate : UInt8**) : HRESULT
    @lpVtbl.value.get_state.call(this, pbstrstate)
  end
  def put_state(this : IFaxSender*, bstrstate : UInt8*) : HRESULT
    @lpVtbl.value.put_state.call(this, bstrstate)
  end
  def get_street_address(this : IFaxSender*, pbstrstreetaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_street_address.call(this, pbstrstreetaddress)
  end
  def put_street_address(this : IFaxSender*, bstrstreetaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_street_address.call(this, bstrstreetaddress)
  end
  def get_title(this : IFaxSender*, pbstrtitle : UInt8**) : HRESULT
    @lpVtbl.value.get_title.call(this, pbstrtitle)
  end
  def put_title(this : IFaxSender*, bstrtitle : UInt8*) : HRESULT
    @lpVtbl.value.put_title.call(this, bstrtitle)
  end
  def get_zip_code(this : IFaxSender*, pbstrzipcode : UInt8**) : HRESULT
    @lpVtbl.value.get_zip_code.call(this, pbstrzipcode)
  end
  def put_zip_code(this : IFaxSender*, bstrzipcode : UInt8*) : HRESULT
    @lpVtbl.value.put_zip_code.call(this, bstrzipcode)
  end
  def load_default_sender(this : IFaxSender*) : HRESULT
    @lpVtbl.value.load_default_sender.call(this)
  end
  def save_default_sender(this : IFaxSender*) : HRESULT
    @lpVtbl.value.save_default_sender.call(this)
  end
end
struct LibWin32::IFaxRecipient
  def query_interface(this : IFaxRecipient*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxRecipient*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxRecipient*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxRecipient*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxRecipient*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxRecipient*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxRecipient*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_fax_number(this : IFaxRecipient*, pbstrfaxnumber : UInt8**) : HRESULT
    @lpVtbl.value.get_fax_number.call(this, pbstrfaxnumber)
  end
  def put_fax_number(this : IFaxRecipient*, bstrfaxnumber : UInt8*) : HRESULT
    @lpVtbl.value.put_fax_number.call(this, bstrfaxnumber)
  end
  def get_name(this : IFaxRecipient*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def put_name(this : IFaxRecipient*, bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrname)
  end
end
struct LibWin32::IFaxRecipients
  def query_interface(this : IFaxRecipients*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxRecipients*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxRecipients*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxRecipients*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxRecipients*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxRecipients*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxRecipients*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxRecipients*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxRecipients*, lindex : Int32, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, ppfaxrecipient)
  end
  def get_count(this : IFaxRecipients*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def add(this : IFaxRecipients*, bstrfaxnumber : UInt8*, bstrrecipientname : UInt8*, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.add.call(this, bstrfaxnumber, bstrrecipientname, ppfaxrecipient)
  end
  def remove(this : IFaxRecipients*, lindex : Int32) : HRESULT
    @lpVtbl.value.remove.call(this, lindex)
  end
end
struct LibWin32::IFaxIncomingArchive
  def query_interface(this : IFaxIncomingArchive*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxIncomingArchive*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxIncomingArchive*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxIncomingArchive*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxIncomingArchive*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxIncomingArchive*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxIncomingArchive*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_use_archive(this : IFaxIncomingArchive*, pbusearchive : Int16*) : HRESULT
    @lpVtbl.value.get_use_archive.call(this, pbusearchive)
  end
  def put_use_archive(this : IFaxIncomingArchive*, busearchive : Int16) : HRESULT
    @lpVtbl.value.put_use_archive.call(this, busearchive)
  end
  def get_archive_folder(this : IFaxIncomingArchive*, pbstrarchivefolder : UInt8**) : HRESULT
    @lpVtbl.value.get_archive_folder.call(this, pbstrarchivefolder)
  end
  def put_archive_folder(this : IFaxIncomingArchive*, bstrarchivefolder : UInt8*) : HRESULT
    @lpVtbl.value.put_archive_folder.call(this, bstrarchivefolder)
  end
  def get_size_quota_warning(this : IFaxIncomingArchive*, pbsizequotawarning : Int16*) : HRESULT
    @lpVtbl.value.get_size_quota_warning.call(this, pbsizequotawarning)
  end
  def put_size_quota_warning(this : IFaxIncomingArchive*, bsizequotawarning : Int16) : HRESULT
    @lpVtbl.value.put_size_quota_warning.call(this, bsizequotawarning)
  end
  def get_high_quota_water_mark(this : IFaxIncomingArchive*, plhighquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_high_quota_water_mark.call(this, plhighquotawatermark)
  end
  def put_high_quota_water_mark(this : IFaxIncomingArchive*, lhighquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_high_quota_water_mark.call(this, lhighquotawatermark)
  end
  def get_low_quota_water_mark(this : IFaxIncomingArchive*, pllowquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_low_quota_water_mark.call(this, pllowquotawatermark)
  end
  def put_low_quota_water_mark(this : IFaxIncomingArchive*, llowquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_low_quota_water_mark.call(this, llowquotawatermark)
  end
  def get_age_limit(this : IFaxIncomingArchive*, plagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_age_limit.call(this, plagelimit)
  end
  def put_age_limit(this : IFaxIncomingArchive*, lagelimit : Int32) : HRESULT
    @lpVtbl.value.put_age_limit.call(this, lagelimit)
  end
  def get_size_low(this : IFaxIncomingArchive*, plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.call(this, plsizelow)
  end
  def get_size_high(this : IFaxIncomingArchive*, plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.call(this, plsizehigh)
  end
  def refresh(this : IFaxIncomingArchive*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxIncomingArchive*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_messages(this : IFaxIncomingArchive*, lprefetchsize : Int32, pfaxincomingmessageiterator : IFaxIncomingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.call(this, lprefetchsize, pfaxincomingmessageiterator)
  end
  def get_message(this : IFaxIncomingArchive*, bstrmessageid : UInt8*, pfaxincomingmessage : IFaxIncomingMessage*) : HRESULT
    @lpVtbl.value.get_message.call(this, bstrmessageid, pfaxincomingmessage)
  end
end
struct LibWin32::IFaxIncomingQueue
  def query_interface(this : IFaxIncomingQueue*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxIncomingQueue*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxIncomingQueue*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxIncomingQueue*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxIncomingQueue*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxIncomingQueue*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxIncomingQueue*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_blocked(this : IFaxIncomingQueue*, pbblocked : Int16*) : HRESULT
    @lpVtbl.value.get_blocked.call(this, pbblocked)
  end
  def put_blocked(this : IFaxIncomingQueue*, bblocked : Int16) : HRESULT
    @lpVtbl.value.put_blocked.call(this, bblocked)
  end
  def refresh(this : IFaxIncomingQueue*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxIncomingQueue*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_jobs(this : IFaxIncomingQueue*, pfaxincomingjobs : IFaxIncomingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.call(this, pfaxincomingjobs)
  end
  def get_job(this : IFaxIncomingQueue*, bstrjobid : UInt8*, pfaxincomingjob : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.get_job.call(this, bstrjobid, pfaxincomingjob)
  end
end
struct LibWin32::IFaxOutgoingArchive
  def query_interface(this : IFaxOutgoingArchive*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingArchive*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingArchive*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingArchive*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingArchive*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingArchive*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingArchive*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_use_archive(this : IFaxOutgoingArchive*, pbusearchive : Int16*) : HRESULT
    @lpVtbl.value.get_use_archive.call(this, pbusearchive)
  end
  def put_use_archive(this : IFaxOutgoingArchive*, busearchive : Int16) : HRESULT
    @lpVtbl.value.put_use_archive.call(this, busearchive)
  end
  def get_archive_folder(this : IFaxOutgoingArchive*, pbstrarchivefolder : UInt8**) : HRESULT
    @lpVtbl.value.get_archive_folder.call(this, pbstrarchivefolder)
  end
  def put_archive_folder(this : IFaxOutgoingArchive*, bstrarchivefolder : UInt8*) : HRESULT
    @lpVtbl.value.put_archive_folder.call(this, bstrarchivefolder)
  end
  def get_size_quota_warning(this : IFaxOutgoingArchive*, pbsizequotawarning : Int16*) : HRESULT
    @lpVtbl.value.get_size_quota_warning.call(this, pbsizequotawarning)
  end
  def put_size_quota_warning(this : IFaxOutgoingArchive*, bsizequotawarning : Int16) : HRESULT
    @lpVtbl.value.put_size_quota_warning.call(this, bsizequotawarning)
  end
  def get_high_quota_water_mark(this : IFaxOutgoingArchive*, plhighquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_high_quota_water_mark.call(this, plhighquotawatermark)
  end
  def put_high_quota_water_mark(this : IFaxOutgoingArchive*, lhighquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_high_quota_water_mark.call(this, lhighquotawatermark)
  end
  def get_low_quota_water_mark(this : IFaxOutgoingArchive*, pllowquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_low_quota_water_mark.call(this, pllowquotawatermark)
  end
  def put_low_quota_water_mark(this : IFaxOutgoingArchive*, llowquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_low_quota_water_mark.call(this, llowquotawatermark)
  end
  def get_age_limit(this : IFaxOutgoingArchive*, plagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_age_limit.call(this, plagelimit)
  end
  def put_age_limit(this : IFaxOutgoingArchive*, lagelimit : Int32) : HRESULT
    @lpVtbl.value.put_age_limit.call(this, lagelimit)
  end
  def get_size_low(this : IFaxOutgoingArchive*, plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.call(this, plsizelow)
  end
  def get_size_high(this : IFaxOutgoingArchive*, plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.call(this, plsizehigh)
  end
  def refresh(this : IFaxOutgoingArchive*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxOutgoingArchive*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_messages(this : IFaxOutgoingArchive*, lprefetchsize : Int32, pfaxoutgoingmessageiterator : IFaxOutgoingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.call(this, lprefetchsize, pfaxoutgoingmessageiterator)
  end
  def get_message(this : IFaxOutgoingArchive*, bstrmessageid : UInt8*, pfaxoutgoingmessage : IFaxOutgoingMessage*) : HRESULT
    @lpVtbl.value.get_message.call(this, bstrmessageid, pfaxoutgoingmessage)
  end
end
struct LibWin32::IFaxOutgoingQueue
  def query_interface(this : IFaxOutgoingQueue*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingQueue*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingQueue*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingQueue*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingQueue*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingQueue*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingQueue*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_blocked(this : IFaxOutgoingQueue*, pbblocked : Int16*) : HRESULT
    @lpVtbl.value.get_blocked.call(this, pbblocked)
  end
  def put_blocked(this : IFaxOutgoingQueue*, bblocked : Int16) : HRESULT
    @lpVtbl.value.put_blocked.call(this, bblocked)
  end
  def get_paused(this : IFaxOutgoingQueue*, pbpaused : Int16*) : HRESULT
    @lpVtbl.value.get_paused.call(this, pbpaused)
  end
  def put_paused(this : IFaxOutgoingQueue*, bpaused : Int16) : HRESULT
    @lpVtbl.value.put_paused.call(this, bpaused)
  end
  def get_allow_personal_cover_pages(this : IFaxOutgoingQueue*, pballowpersonalcoverpages : Int16*) : HRESULT
    @lpVtbl.value.get_allow_personal_cover_pages.call(this, pballowpersonalcoverpages)
  end
  def put_allow_personal_cover_pages(this : IFaxOutgoingQueue*, ballowpersonalcoverpages : Int16) : HRESULT
    @lpVtbl.value.put_allow_personal_cover_pages.call(this, ballowpersonalcoverpages)
  end
  def get_use_device_tsid(this : IFaxOutgoingQueue*, pbusedevicetsid : Int16*) : HRESULT
    @lpVtbl.value.get_use_device_tsid.call(this, pbusedevicetsid)
  end
  def put_use_device_tsid(this : IFaxOutgoingQueue*, busedevicetsid : Int16) : HRESULT
    @lpVtbl.value.put_use_device_tsid.call(this, busedevicetsid)
  end
  def get_retries(this : IFaxOutgoingQueue*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def put_retries(this : IFaxOutgoingQueue*, lretries : Int32) : HRESULT
    @lpVtbl.value.put_retries.call(this, lretries)
  end
  def get_retry_delay(this : IFaxOutgoingQueue*, plretrydelay : Int32*) : HRESULT
    @lpVtbl.value.get_retry_delay.call(this, plretrydelay)
  end
  def put_retry_delay(this : IFaxOutgoingQueue*, lretrydelay : Int32) : HRESULT
    @lpVtbl.value.put_retry_delay.call(this, lretrydelay)
  end
  def get_discount_rate_start(this : IFaxOutgoingQueue*, pdatediscountratestart : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_start.call(this, pdatediscountratestart)
  end
  def put_discount_rate_start(this : IFaxOutgoingQueue*, datediscountratestart : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_start.call(this, datediscountratestart)
  end
  def get_discount_rate_end(this : IFaxOutgoingQueue*, pdatediscountrateend : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_end.call(this, pdatediscountrateend)
  end
  def put_discount_rate_end(this : IFaxOutgoingQueue*, datediscountrateend : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_end.call(this, datediscountrateend)
  end
  def get_age_limit(this : IFaxOutgoingQueue*, plagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_age_limit.call(this, plagelimit)
  end
  def put_age_limit(this : IFaxOutgoingQueue*, lagelimit : Int32) : HRESULT
    @lpVtbl.value.put_age_limit.call(this, lagelimit)
  end
  def get_branding(this : IFaxOutgoingQueue*, pbbranding : Int16*) : HRESULT
    @lpVtbl.value.get_branding.call(this, pbbranding)
  end
  def put_branding(this : IFaxOutgoingQueue*, bbranding : Int16) : HRESULT
    @lpVtbl.value.put_branding.call(this, bbranding)
  end
  def refresh(this : IFaxOutgoingQueue*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxOutgoingQueue*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_jobs(this : IFaxOutgoingQueue*, pfaxoutgoingjobs : IFaxOutgoingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.call(this, pfaxoutgoingjobs)
  end
  def get_job(this : IFaxOutgoingQueue*, bstrjobid : UInt8*, pfaxoutgoingjob : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.get_job.call(this, bstrjobid, pfaxoutgoingjob)
  end
end
struct LibWin32::IFaxIncomingMessageIterator
  def query_interface(this : IFaxIncomingMessageIterator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxIncomingMessageIterator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxIncomingMessageIterator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxIncomingMessageIterator*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxIncomingMessageIterator*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxIncomingMessageIterator*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxIncomingMessageIterator*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_message(this : IFaxIncomingMessageIterator*, pfaxincomingmessage : IFaxIncomingMessage*) : HRESULT
    @lpVtbl.value.get_message.call(this, pfaxincomingmessage)
  end
  def get_prefetch_size(this : IFaxIncomingMessageIterator*, plprefetchsize : Int32*) : HRESULT
    @lpVtbl.value.get_prefetch_size.call(this, plprefetchsize)
  end
  def put_prefetch_size(this : IFaxIncomingMessageIterator*, lprefetchsize : Int32) : HRESULT
    @lpVtbl.value.put_prefetch_size.call(this, lprefetchsize)
  end
  def get_at_eof(this : IFaxIncomingMessageIterator*, pbeof : Int16*) : HRESULT
    @lpVtbl.value.get_at_eof.call(this, pbeof)
  end
  def move_first(this : IFaxIncomingMessageIterator*) : HRESULT
    @lpVtbl.value.move_first.call(this)
  end
  def move_next(this : IFaxIncomingMessageIterator*) : HRESULT
    @lpVtbl.value.move_next.call(this)
  end
end
struct LibWin32::IFaxIncomingMessage
  def query_interface(this : IFaxIncomingMessage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxIncomingMessage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxIncomingMessage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxIncomingMessage*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxIncomingMessage*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxIncomingMessage*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxIncomingMessage*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFaxIncomingMessage*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_pages(this : IFaxIncomingMessage*, plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.call(this, plpages)
  end
  def get_size(this : IFaxIncomingMessage*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_device_name(this : IFaxIncomingMessage*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.call(this, pbstrdevicename)
  end
  def get_retries(this : IFaxIncomingMessage*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_transmission_start(this : IFaxIncomingMessage*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxIncomingMessage*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_csid(this : IFaxIncomingMessage*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxIncomingMessage*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def get_caller_id(this : IFaxIncomingMessage*, pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.call(this, pbstrcallerid)
  end
  def get_routing_information(this : IFaxIncomingMessage*, pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.call(this, pbstrroutinginformation)
  end
  def copy_tiff(this : IFaxIncomingMessage*, bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.call(this, bstrtiffpath)
  end
  def delete(this : IFaxIncomingMessage*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IFaxOutgoingJobs
  def query_interface(this : IFaxOutgoingJobs*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingJobs*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingJobs*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingJobs*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingJobs*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingJobs*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingJobs*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxOutgoingJobs*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxOutgoingJobs*, vindex : VARIANT, pfaxoutgoingjob : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxoutgoingjob)
  end
  def get_count(this : IFaxOutgoingJobs*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
end
struct LibWin32::IFaxOutgoingJob
  def query_interface(this : IFaxOutgoingJob*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingJob*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingJob*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingJob*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingJob*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingJob*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingJob*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_subject(this : IFaxOutgoingJob*, pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, pbstrsubject)
  end
  def get_document_name(this : IFaxOutgoingJob*, pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.call(this, pbstrdocumentname)
  end
  def get_pages(this : IFaxOutgoingJob*, plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.call(this, plpages)
  end
  def get_size(this : IFaxOutgoingJob*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_submission_id(this : IFaxOutgoingJob*, pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.call(this, pbstrsubmissionid)
  end
  def get_id(this : IFaxOutgoingJob*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_original_scheduled_time(this : IFaxOutgoingJob*, pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.call(this, pdateoriginalscheduledtime)
  end
  def get_submission_time(this : IFaxOutgoingJob*, pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.call(this, pdatesubmissiontime)
  end
  def get_receipt_type(this : IFaxOutgoingJob*, preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.call(this, preceipttype)
  end
  def get_priority(this : IFaxOutgoingJob*, ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def get_sender(this : IFaxOutgoingJob*, ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.call(this, ppfaxsender)
  end
  def get_recipient(this : IFaxOutgoingJob*, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.call(this, ppfaxrecipient)
  end
  def get_current_page(this : IFaxOutgoingJob*, plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.call(this, plcurrentpage)
  end
  def get_device_id(this : IFaxOutgoingJob*, pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.call(this, pldeviceid)
  end
  def get_status(this : IFaxOutgoingJob*, pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_extended_status_code(this : IFaxOutgoingJob*, pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.call(this, pextendedstatuscode)
  end
  def get_extended_status(this : IFaxOutgoingJob*, pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.call(this, pbstrextendedstatus)
  end
  def get_available_operations(this : IFaxOutgoingJob*, pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.call(this, pavailableoperations)
  end
  def get_retries(this : IFaxOutgoingJob*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_scheduled_time(this : IFaxOutgoingJob*, pdatescheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_scheduled_time.call(this, pdatescheduledtime)
  end
  def get_transmission_start(this : IFaxOutgoingJob*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxOutgoingJob*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_csid(this : IFaxOutgoingJob*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxOutgoingJob*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def get_group_broadcast_receipts(this : IFaxOutgoingJob*, pbgroupbroadcastreceipts : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.call(this, pbgroupbroadcastreceipts)
  end
  def pause(this : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.pause.call(this)
  end
  def resume(this : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
  def restart(this : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.restart.call(this)
  end
  def copy_tiff(this : IFaxOutgoingJob*, bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.call(this, bstrtiffpath)
  end
  def refresh(this : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def cancel(this : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
end
struct LibWin32::IFaxOutgoingMessageIterator
  def query_interface(this : IFaxOutgoingMessageIterator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingMessageIterator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingMessageIterator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingMessageIterator*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingMessageIterator*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingMessageIterator*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingMessageIterator*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_message(this : IFaxOutgoingMessageIterator*, pfaxoutgoingmessage : IFaxOutgoingMessage*) : HRESULT
    @lpVtbl.value.get_message.call(this, pfaxoutgoingmessage)
  end
  def get_at_eof(this : IFaxOutgoingMessageIterator*, pbeof : Int16*) : HRESULT
    @lpVtbl.value.get_at_eof.call(this, pbeof)
  end
  def get_prefetch_size(this : IFaxOutgoingMessageIterator*, plprefetchsize : Int32*) : HRESULT
    @lpVtbl.value.get_prefetch_size.call(this, plprefetchsize)
  end
  def put_prefetch_size(this : IFaxOutgoingMessageIterator*, lprefetchsize : Int32) : HRESULT
    @lpVtbl.value.put_prefetch_size.call(this, lprefetchsize)
  end
  def move_first(this : IFaxOutgoingMessageIterator*) : HRESULT
    @lpVtbl.value.move_first.call(this)
  end
  def move_next(this : IFaxOutgoingMessageIterator*) : HRESULT
    @lpVtbl.value.move_next.call(this)
  end
end
struct LibWin32::IFaxOutgoingMessage
  def query_interface(this : IFaxOutgoingMessage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingMessage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingMessage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingMessage*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingMessage*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingMessage*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingMessage*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_submission_id(this : IFaxOutgoingMessage*, pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.call(this, pbstrsubmissionid)
  end
  def get_id(this : IFaxOutgoingMessage*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_subject(this : IFaxOutgoingMessage*, pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, pbstrsubject)
  end
  def get_document_name(this : IFaxOutgoingMessage*, pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.call(this, pbstrdocumentname)
  end
  def get_retries(this : IFaxOutgoingMessage*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_pages(this : IFaxOutgoingMessage*, plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.call(this, plpages)
  end
  def get_size(this : IFaxOutgoingMessage*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_original_scheduled_time(this : IFaxOutgoingMessage*, pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.call(this, pdateoriginalscheduledtime)
  end
  def get_submission_time(this : IFaxOutgoingMessage*, pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.call(this, pdatesubmissiontime)
  end
  def get_priority(this : IFaxOutgoingMessage*, ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def get_sender(this : IFaxOutgoingMessage*, ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.call(this, ppfaxsender)
  end
  def get_recipient(this : IFaxOutgoingMessage*, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.call(this, ppfaxrecipient)
  end
  def get_device_name(this : IFaxOutgoingMessage*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.call(this, pbstrdevicename)
  end
  def get_transmission_start(this : IFaxOutgoingMessage*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxOutgoingMessage*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_csid(this : IFaxOutgoingMessage*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxOutgoingMessage*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def copy_tiff(this : IFaxOutgoingMessage*, bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.call(this, bstrtiffpath)
  end
  def delete(this : IFaxOutgoingMessage*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IFaxIncomingJobs
  def query_interface(this : IFaxIncomingJobs*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxIncomingJobs*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxIncomingJobs*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxIncomingJobs*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxIncomingJobs*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxIncomingJobs*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxIncomingJobs*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxIncomingJobs*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxIncomingJobs*, vindex : VARIANT, pfaxincomingjob : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxincomingjob)
  end
  def get_count(this : IFaxIncomingJobs*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
end
struct LibWin32::IFaxIncomingJob
  def query_interface(this : IFaxIncomingJob*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxIncomingJob*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxIncomingJob*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxIncomingJob*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxIncomingJob*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxIncomingJob*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxIncomingJob*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_size(this : IFaxIncomingJob*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_id(this : IFaxIncomingJob*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_current_page(this : IFaxIncomingJob*, plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.call(this, plcurrentpage)
  end
  def get_device_id(this : IFaxIncomingJob*, pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.call(this, pldeviceid)
  end
  def get_status(this : IFaxIncomingJob*, pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_extended_status_code(this : IFaxIncomingJob*, pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.call(this, pextendedstatuscode)
  end
  def get_extended_status(this : IFaxIncomingJob*, pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.call(this, pbstrextendedstatus)
  end
  def get_available_operations(this : IFaxIncomingJob*, pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.call(this, pavailableoperations)
  end
  def get_retries(this : IFaxIncomingJob*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_transmission_start(this : IFaxIncomingJob*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxIncomingJob*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_csid(this : IFaxIncomingJob*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxIncomingJob*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def get_caller_id(this : IFaxIncomingJob*, pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.call(this, pbstrcallerid)
  end
  def get_routing_information(this : IFaxIncomingJob*, pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.call(this, pbstrroutinginformation)
  end
  def get_job_type(this : IFaxIncomingJob*, pjobtype : FAX_JOB_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_job_type.call(this, pjobtype)
  end
  def cancel(this : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def refresh(this : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def copy_tiff(this : IFaxIncomingJob*, bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.call(this, bstrtiffpath)
  end
end
struct LibWin32::IFaxDeviceProvider
  def query_interface(this : IFaxDeviceProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxDeviceProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxDeviceProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxDeviceProvider*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxDeviceProvider*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxDeviceProvider*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxDeviceProvider*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_friendly_name(this : IFaxDeviceProvider*, pbstrfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbstrfriendlyname)
  end
  def get_image_name(this : IFaxDeviceProvider*, pbstrimagename : UInt8**) : HRESULT
    @lpVtbl.value.get_image_name.call(this, pbstrimagename)
  end
  def get_unique_name(this : IFaxDeviceProvider*, pbstruniquename : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_name.call(this, pbstruniquename)
  end
  def get_tapi_provider_name(this : IFaxDeviceProvider*, pbstrtapiprovidername : UInt8**) : HRESULT
    @lpVtbl.value.get_tapi_provider_name.call(this, pbstrtapiprovidername)
  end
  def get_major_version(this : IFaxDeviceProvider*, plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.call(this, plmajorversion)
  end
  def get_minor_version(this : IFaxDeviceProvider*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.call(this, plminorversion)
  end
  def get_major_build(this : IFaxDeviceProvider*, plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.call(this, plmajorbuild)
  end
  def get_minor_build(this : IFaxDeviceProvider*, plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.call(this, plminorbuild)
  end
  def get_debug(this : IFaxDeviceProvider*, pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.call(this, pbdebug)
  end
  def get_status(this : IFaxDeviceProvider*, pstatus : FAX_PROVIDER_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_init_error_code(this : IFaxDeviceProvider*, pliniterrorcode : Int32*) : HRESULT
    @lpVtbl.value.get_init_error_code.call(this, pliniterrorcode)
  end
  def get_device_ids(this : IFaxDeviceProvider*, pvdeviceids : VARIANT*) : HRESULT
    @lpVtbl.value.get_device_ids.call(this, pvdeviceids)
  end
end
struct LibWin32::IFaxDevice
  def query_interface(this : IFaxDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxDevice*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxDevice*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxDevice*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxDevice*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFaxDevice*, plid : Int32*) : HRESULT
    @lpVtbl.value.get_id.call(this, plid)
  end
  def get_device_name(this : IFaxDevice*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.call(this, pbstrdevicename)
  end
  def get_provider_unique_name(this : IFaxDevice*, pbstrprovideruniquename : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_unique_name.call(this, pbstrprovideruniquename)
  end
  def get_powered_off(this : IFaxDevice*, pbpoweredoff : Int16*) : HRESULT
    @lpVtbl.value.get_powered_off.call(this, pbpoweredoff)
  end
  def get_receiving_now(this : IFaxDevice*, pbreceivingnow : Int16*) : HRESULT
    @lpVtbl.value.get_receiving_now.call(this, pbreceivingnow)
  end
  def get_sending_now(this : IFaxDevice*, pbsendingnow : Int16*) : HRESULT
    @lpVtbl.value.get_sending_now.call(this, pbsendingnow)
  end
  def get_used_routing_methods(this : IFaxDevice*, pvusedroutingmethods : VARIANT*) : HRESULT
    @lpVtbl.value.get_used_routing_methods.call(this, pvusedroutingmethods)
  end
  def get_description(this : IFaxDevice*, pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbstrdescription)
  end
  def put_description(this : IFaxDevice*, bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bstrdescription)
  end
  def get_send_enabled(this : IFaxDevice*, pbsendenabled : Int16*) : HRESULT
    @lpVtbl.value.get_send_enabled.call(this, pbsendenabled)
  end
  def put_send_enabled(this : IFaxDevice*, bsendenabled : Int16) : HRESULT
    @lpVtbl.value.put_send_enabled.call(this, bsendenabled)
  end
  def get_receive_mode(this : IFaxDevice*, preceivemode : FAX_DEVICE_RECEIVE_MODE_ENUM*) : HRESULT
    @lpVtbl.value.get_receive_mode.call(this, preceivemode)
  end
  def put_receive_mode(this : IFaxDevice*, receivemode : FAX_DEVICE_RECEIVE_MODE_ENUM) : HRESULT
    @lpVtbl.value.put_receive_mode.call(this, receivemode)
  end
  def get_rings_before_answer(this : IFaxDevice*, plringsbeforeanswer : Int32*) : HRESULT
    @lpVtbl.value.get_rings_before_answer.call(this, plringsbeforeanswer)
  end
  def put_rings_before_answer(this : IFaxDevice*, lringsbeforeanswer : Int32) : HRESULT
    @lpVtbl.value.put_rings_before_answer.call(this, lringsbeforeanswer)
  end
  def get_csid(this : IFaxDevice*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def put_csid(this : IFaxDevice*, bstrcsid : UInt8*) : HRESULT
    @lpVtbl.value.put_csid.call(this, bstrcsid)
  end
  def get_tsid(this : IFaxDevice*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def put_tsid(this : IFaxDevice*, bstrtsid : UInt8*) : HRESULT
    @lpVtbl.value.put_tsid.call(this, bstrtsid)
  end
  def refresh(this : IFaxDevice*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxDevice*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_extension_property(this : IFaxDevice*, bstrguid : UInt8*, pvproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension_property.call(this, bstrguid, pvproperty)
  end
  def set_extension_property(this : IFaxDevice*, bstrguid : UInt8*, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_extension_property.call(this, bstrguid, vproperty)
  end
  def use_routing_method(this : IFaxDevice*, bstrmethodguid : UInt8*, buse : Int16) : HRESULT
    @lpVtbl.value.use_routing_method.call(this, bstrmethodguid, buse)
  end
  def get_ringing_now(this : IFaxDevice*, pbringingnow : Int16*) : HRESULT
    @lpVtbl.value.get_ringing_now.call(this, pbringingnow)
  end
  def answer_call(this : IFaxDevice*) : HRESULT
    @lpVtbl.value.answer_call.call(this)
  end
end
struct LibWin32::IFaxActivityLogging
  def query_interface(this : IFaxActivityLogging*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxActivityLogging*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxActivityLogging*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxActivityLogging*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxActivityLogging*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxActivityLogging*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxActivityLogging*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_log_incoming(this : IFaxActivityLogging*, pblogincoming : Int16*) : HRESULT
    @lpVtbl.value.get_log_incoming.call(this, pblogincoming)
  end
  def put_log_incoming(this : IFaxActivityLogging*, blogincoming : Int16) : HRESULT
    @lpVtbl.value.put_log_incoming.call(this, blogincoming)
  end
  def get_log_outgoing(this : IFaxActivityLogging*, pblogoutgoing : Int16*) : HRESULT
    @lpVtbl.value.get_log_outgoing.call(this, pblogoutgoing)
  end
  def put_log_outgoing(this : IFaxActivityLogging*, blogoutgoing : Int16) : HRESULT
    @lpVtbl.value.put_log_outgoing.call(this, blogoutgoing)
  end
  def get_database_path(this : IFaxActivityLogging*, pbstrdatabasepath : UInt8**) : HRESULT
    @lpVtbl.value.get_database_path.call(this, pbstrdatabasepath)
  end
  def put_database_path(this : IFaxActivityLogging*, bstrdatabasepath : UInt8*) : HRESULT
    @lpVtbl.value.put_database_path.call(this, bstrdatabasepath)
  end
  def refresh(this : IFaxActivityLogging*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxActivityLogging*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
end
struct LibWin32::IFaxEventLogging
  def query_interface(this : IFaxEventLogging*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxEventLogging*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxEventLogging*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxEventLogging*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxEventLogging*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxEventLogging*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxEventLogging*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_init_events_level(this : IFaxEventLogging*, piniteventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_init_events_level.call(this, piniteventlevel)
  end
  def put_init_events_level(this : IFaxEventLogging*, initeventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_init_events_level.call(this, initeventlevel)
  end
  def get_inbound_events_level(this : IFaxEventLogging*, pinboundeventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_inbound_events_level.call(this, pinboundeventlevel)
  end
  def put_inbound_events_level(this : IFaxEventLogging*, inboundeventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_inbound_events_level.call(this, inboundeventlevel)
  end
  def get_outbound_events_level(this : IFaxEventLogging*, poutboundeventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_outbound_events_level.call(this, poutboundeventlevel)
  end
  def put_outbound_events_level(this : IFaxEventLogging*, outboundeventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_outbound_events_level.call(this, outboundeventlevel)
  end
  def get_general_events_level(this : IFaxEventLogging*, pgeneraleventlevel : FAX_LOG_LEVEL_ENUM*) : HRESULT
    @lpVtbl.value.get_general_events_level.call(this, pgeneraleventlevel)
  end
  def put_general_events_level(this : IFaxEventLogging*, generaleventlevel : FAX_LOG_LEVEL_ENUM) : HRESULT
    @lpVtbl.value.put_general_events_level.call(this, generaleventlevel)
  end
  def refresh(this : IFaxEventLogging*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxEventLogging*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
end
struct LibWin32::IFaxOutboundRoutingGroups
  def query_interface(this : IFaxOutboundRoutingGroups*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutboundRoutingGroups*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutboundRoutingGroups*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutboundRoutingGroups*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutboundRoutingGroups*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutboundRoutingGroups*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutboundRoutingGroups*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxOutboundRoutingGroups*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxOutboundRoutingGroups*, vindex : VARIANT, pfaxoutboundroutinggroup : IFaxOutboundRoutingGroup*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxoutboundroutinggroup)
  end
  def get_count(this : IFaxOutboundRoutingGroups*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def add(this : IFaxOutboundRoutingGroups*, bstrname : UInt8*, pfaxoutboundroutinggroup : IFaxOutboundRoutingGroup*) : HRESULT
    @lpVtbl.value.add.call(this, bstrname, pfaxoutboundroutinggroup)
  end
  def remove(this : IFaxOutboundRoutingGroups*, vindex : VARIANT) : HRESULT
    @lpVtbl.value.remove.call(this, vindex)
  end
end
struct LibWin32::IFaxOutboundRoutingGroup
  def query_interface(this : IFaxOutboundRoutingGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutboundRoutingGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutboundRoutingGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutboundRoutingGroup*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutboundRoutingGroup*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutboundRoutingGroup*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutboundRoutingGroup*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IFaxOutboundRoutingGroup*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def get_status(this : IFaxOutboundRoutingGroup*, pstatus : FAX_GROUP_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_device_ids(this : IFaxOutboundRoutingGroup*, pfaxdeviceids : IFaxDeviceIds*) : HRESULT
    @lpVtbl.value.get_device_ids.call(this, pfaxdeviceids)
  end
end
struct LibWin32::IFaxDeviceIds
  def query_interface(this : IFaxDeviceIds*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxDeviceIds*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxDeviceIds*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxDeviceIds*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxDeviceIds*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxDeviceIds*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxDeviceIds*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxDeviceIds*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxDeviceIds*, lindex : Int32, pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pldeviceid)
  end
  def get_count(this : IFaxDeviceIds*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def add(this : IFaxDeviceIds*, ldeviceid : Int32) : HRESULT
    @lpVtbl.value.add.call(this, ldeviceid)
  end
  def remove(this : IFaxDeviceIds*, lindex : Int32) : HRESULT
    @lpVtbl.value.remove.call(this, lindex)
  end
  def set_order(this : IFaxDeviceIds*, ldeviceid : Int32, lneworder : Int32) : HRESULT
    @lpVtbl.value.set_order.call(this, ldeviceid, lneworder)
  end
end
struct LibWin32::IFaxOutboundRoutingRules
  def query_interface(this : IFaxOutboundRoutingRules*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutboundRoutingRules*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutboundRoutingRules*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutboundRoutingRules*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutboundRoutingRules*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutboundRoutingRules*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutboundRoutingRules*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxOutboundRoutingRules*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxOutboundRoutingRules*, lindex : Int32, pfaxoutboundroutingrule : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pfaxoutboundroutingrule)
  end
  def get_count(this : IFaxOutboundRoutingRules*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def item_by_country_and_area(this : IFaxOutboundRoutingRules*, lcountrycode : Int32, lareacode : Int32, pfaxoutboundroutingrule : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.item_by_country_and_area.call(this, lcountrycode, lareacode, pfaxoutboundroutingrule)
  end
  def remove_by_country_and_area(this : IFaxOutboundRoutingRules*, lcountrycode : Int32, lareacode : Int32) : HRESULT
    @lpVtbl.value.remove_by_country_and_area.call(this, lcountrycode, lareacode)
  end
  def remove(this : IFaxOutboundRoutingRules*, lindex : Int32) : HRESULT
    @lpVtbl.value.remove.call(this, lindex)
  end
  def add(this : IFaxOutboundRoutingRules*, lcountrycode : Int32, lareacode : Int32, busedevice : Int16, bstrgroupname : UInt8*, ldeviceid : Int32, pfaxoutboundroutingrule : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.add.call(this, lcountrycode, lareacode, busedevice, bstrgroupname, ldeviceid, pfaxoutboundroutingrule)
  end
end
struct LibWin32::IFaxOutboundRoutingRule
  def query_interface(this : IFaxOutboundRoutingRule*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutboundRoutingRule*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutboundRoutingRule*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutboundRoutingRule*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutboundRoutingRule*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutboundRoutingRule*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutboundRoutingRule*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_country_code(this : IFaxOutboundRoutingRule*, plcountrycode : Int32*) : HRESULT
    @lpVtbl.value.get_country_code.call(this, plcountrycode)
  end
  def get_area_code(this : IFaxOutboundRoutingRule*, plareacode : Int32*) : HRESULT
    @lpVtbl.value.get_area_code.call(this, plareacode)
  end
  def get_status(this : IFaxOutboundRoutingRule*, pstatus : FAX_RULE_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_use_device(this : IFaxOutboundRoutingRule*, pbusedevice : Int16*) : HRESULT
    @lpVtbl.value.get_use_device.call(this, pbusedevice)
  end
  def put_use_device(this : IFaxOutboundRoutingRule*, busedevice : Int16) : HRESULT
    @lpVtbl.value.put_use_device.call(this, busedevice)
  end
  def get_device_id(this : IFaxOutboundRoutingRule*, pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.call(this, pldeviceid)
  end
  def put_device_id(this : IFaxOutboundRoutingRule*, deviceid : Int32) : HRESULT
    @lpVtbl.value.put_device_id.call(this, deviceid)
  end
  def get_group_name(this : IFaxOutboundRoutingRule*, pbstrgroupname : UInt8**) : HRESULT
    @lpVtbl.value.get_group_name.call(this, pbstrgroupname)
  end
  def put_group_name(this : IFaxOutboundRoutingRule*, bstrgroupname : UInt8*) : HRESULT
    @lpVtbl.value.put_group_name.call(this, bstrgroupname)
  end
  def refresh(this : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxOutboundRoutingRule*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
end
struct LibWin32::IFaxInboundRoutingExtensions
  def query_interface(this : IFaxInboundRoutingExtensions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxInboundRoutingExtensions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxInboundRoutingExtensions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxInboundRoutingExtensions*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxInboundRoutingExtensions*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxInboundRoutingExtensions*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxInboundRoutingExtensions*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxInboundRoutingExtensions*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxInboundRoutingExtensions*, vindex : VARIANT, pfaxinboundroutingextension : IFaxInboundRoutingExtension*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxinboundroutingextension)
  end
  def get_count(this : IFaxInboundRoutingExtensions*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
end
struct LibWin32::IFaxInboundRoutingExtension
  def query_interface(this : IFaxInboundRoutingExtension*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxInboundRoutingExtension*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxInboundRoutingExtension*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxInboundRoutingExtension*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxInboundRoutingExtension*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxInboundRoutingExtension*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxInboundRoutingExtension*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_friendly_name(this : IFaxInboundRoutingExtension*, pbstrfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbstrfriendlyname)
  end
  def get_image_name(this : IFaxInboundRoutingExtension*, pbstrimagename : UInt8**) : HRESULT
    @lpVtbl.value.get_image_name.call(this, pbstrimagename)
  end
  def get_unique_name(this : IFaxInboundRoutingExtension*, pbstruniquename : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_name.call(this, pbstruniquename)
  end
  def get_major_version(this : IFaxInboundRoutingExtension*, plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.call(this, plmajorversion)
  end
  def get_minor_version(this : IFaxInboundRoutingExtension*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.call(this, plminorversion)
  end
  def get_major_build(this : IFaxInboundRoutingExtension*, plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.call(this, plmajorbuild)
  end
  def get_minor_build(this : IFaxInboundRoutingExtension*, plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.call(this, plminorbuild)
  end
  def get_debug(this : IFaxInboundRoutingExtension*, pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.call(this, pbdebug)
  end
  def get_status(this : IFaxInboundRoutingExtension*, pstatus : FAX_PROVIDER_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_init_error_code(this : IFaxInboundRoutingExtension*, pliniterrorcode : Int32*) : HRESULT
    @lpVtbl.value.get_init_error_code.call(this, pliniterrorcode)
  end
  def get_methods(this : IFaxInboundRoutingExtension*, pvmethods : VARIANT*) : HRESULT
    @lpVtbl.value.get_methods.call(this, pvmethods)
  end
end
struct LibWin32::IFaxInboundRoutingMethods
  def query_interface(this : IFaxInboundRoutingMethods*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxInboundRoutingMethods*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxInboundRoutingMethods*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxInboundRoutingMethods*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxInboundRoutingMethods*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxInboundRoutingMethods*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxInboundRoutingMethods*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxInboundRoutingMethods*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxInboundRoutingMethods*, vindex : VARIANT, pfaxinboundroutingmethod : IFaxInboundRoutingMethod*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxinboundroutingmethod)
  end
  def get_count(this : IFaxInboundRoutingMethods*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
end
struct LibWin32::IFaxInboundRoutingMethod
  def query_interface(this : IFaxInboundRoutingMethod*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxInboundRoutingMethod*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxInboundRoutingMethod*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxInboundRoutingMethod*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxInboundRoutingMethod*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxInboundRoutingMethod*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxInboundRoutingMethod*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IFaxInboundRoutingMethod*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def get_guid(this : IFaxInboundRoutingMethod*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.get_guid.call(this, pbstrguid)
  end
  def get_function_name(this : IFaxInboundRoutingMethod*, pbstrfunctionname : UInt8**) : HRESULT
    @lpVtbl.value.get_function_name.call(this, pbstrfunctionname)
  end
  def get_extension_friendly_name(this : IFaxInboundRoutingMethod*, pbstrextensionfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_extension_friendly_name.call(this, pbstrextensionfriendlyname)
  end
  def get_extension_image_name(this : IFaxInboundRoutingMethod*, pbstrextensionimagename : UInt8**) : HRESULT
    @lpVtbl.value.get_extension_image_name.call(this, pbstrextensionimagename)
  end
  def get_priority(this : IFaxInboundRoutingMethod*, plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, plpriority)
  end
  def put_priority(this : IFaxInboundRoutingMethod*, lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.call(this, lpriority)
  end
  def refresh(this : IFaxInboundRoutingMethod*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxInboundRoutingMethod*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
end
struct LibWin32::IFaxDocument2
  def query_interface(this : IFaxDocument2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxDocument2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxDocument2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxDocument2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxDocument2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxDocument2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxDocument2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_body(this : IFaxDocument2*, pbstrbody : UInt8**) : HRESULT
    @lpVtbl.value.get_body.call(this, pbstrbody)
  end
  def put_body(this : IFaxDocument2*, bstrbody : UInt8*) : HRESULT
    @lpVtbl.value.put_body.call(this, bstrbody)
  end
  def get_sender(this : IFaxDocument2*, ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.call(this, ppfaxsender)
  end
  def get_recipients(this : IFaxDocument2*, ppfaxrecipients : IFaxRecipients*) : HRESULT
    @lpVtbl.value.get_recipients.call(this, ppfaxrecipients)
  end
  def get_cover_page(this : IFaxDocument2*, pbstrcoverpage : UInt8**) : HRESULT
    @lpVtbl.value.get_cover_page.call(this, pbstrcoverpage)
  end
  def put_cover_page(this : IFaxDocument2*, bstrcoverpage : UInt8*) : HRESULT
    @lpVtbl.value.put_cover_page.call(this, bstrcoverpage)
  end
  def get_subject(this : IFaxDocument2*, pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, pbstrsubject)
  end
  def put_subject(this : IFaxDocument2*, bstrsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.call(this, bstrsubject)
  end
  def get_note(this : IFaxDocument2*, pbstrnote : UInt8**) : HRESULT
    @lpVtbl.value.get_note.call(this, pbstrnote)
  end
  def put_note(this : IFaxDocument2*, bstrnote : UInt8*) : HRESULT
    @lpVtbl.value.put_note.call(this, bstrnote)
  end
  def get_schedule_time(this : IFaxDocument2*, pdatescheduletime : Float64*) : HRESULT
    @lpVtbl.value.get_schedule_time.call(this, pdatescheduletime)
  end
  def put_schedule_time(this : IFaxDocument2*, datescheduletime : Float64) : HRESULT
    @lpVtbl.value.put_schedule_time.call(this, datescheduletime)
  end
  def get_receipt_address(this : IFaxDocument2*, pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.call(this, pbstrreceiptaddress)
  end
  def put_receipt_address(this : IFaxDocument2*, bstrreceiptaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_receipt_address.call(this, bstrreceiptaddress)
  end
  def get_document_name(this : IFaxDocument2*, pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.call(this, pbstrdocumentname)
  end
  def put_document_name(this : IFaxDocument2*, bstrdocumentname : UInt8*) : HRESULT
    @lpVtbl.value.put_document_name.call(this, bstrdocumentname)
  end
  def get_call_handle(this : IFaxDocument2*, plcallhandle : Int32*) : HRESULT
    @lpVtbl.value.get_call_handle.call(this, plcallhandle)
  end
  def put_call_handle(this : IFaxDocument2*, lcallhandle : Int32) : HRESULT
    @lpVtbl.value.put_call_handle.call(this, lcallhandle)
  end
  def get_cover_page_type(this : IFaxDocument2*, pcoverpagetype : FAX_COVERPAGE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_cover_page_type.call(this, pcoverpagetype)
  end
  def put_cover_page_type(this : IFaxDocument2*, coverpagetype : FAX_COVERPAGE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_cover_page_type.call(this, coverpagetype)
  end
  def get_schedule_type(this : IFaxDocument2*, pscheduletype : FAX_SCHEDULE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_schedule_type.call(this, pscheduletype)
  end
  def put_schedule_type(this : IFaxDocument2*, scheduletype : FAX_SCHEDULE_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_schedule_type.call(this, scheduletype)
  end
  def get_receipt_type(this : IFaxDocument2*, preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.call(this, preceipttype)
  end
  def put_receipt_type(this : IFaxDocument2*, receipttype : FAX_RECEIPT_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_receipt_type.call(this, receipttype)
  end
  def get_group_broadcast_receipts(this : IFaxDocument2*, pbusegrouping : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.call(this, pbusegrouping)
  end
  def put_group_broadcast_receipts(this : IFaxDocument2*, busegrouping : Int16) : HRESULT
    @lpVtbl.value.put_group_broadcast_receipts.call(this, busegrouping)
  end
  def get_priority(this : IFaxDocument2*, ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def put_priority(this : IFaxDocument2*, priority : FAX_PRIORITY_TYPE_ENUM) : HRESULT
    @lpVtbl.value.put_priority.call(this, priority)
  end
  def get_tapi_connection(this : IFaxDocument2*, pptapiconnection : IDispatch*) : HRESULT
    @lpVtbl.value.get_tapi_connection.call(this, pptapiconnection)
  end
  def putref_tapi_connection(this : IFaxDocument2*, ptapiconnection : IDispatch) : HRESULT
    @lpVtbl.value.putref_tapi_connection.call(this, ptapiconnection)
  end
  def submit(this : IFaxDocument2*, bstrfaxservername : UInt8*, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.submit.call(this, bstrfaxservername, pvfaxoutgoingjobids)
  end
  def connected_submit(this : IFaxDocument2*, pfaxserver : IFaxServer, pvfaxoutgoingjobids : VARIANT*) : HRESULT
    @lpVtbl.value.connected_submit.call(this, pfaxserver, pvfaxoutgoingjobids)
  end
  def get_attach_fax_to_receipt(this : IFaxDocument2*, pbattachfax : Int16*) : HRESULT
    @lpVtbl.value.get_attach_fax_to_receipt.call(this, pbattachfax)
  end
  def put_attach_fax_to_receipt(this : IFaxDocument2*, battachfax : Int16) : HRESULT
    @lpVtbl.value.put_attach_fax_to_receipt.call(this, battachfax)
  end
  def get_submission_id(this : IFaxDocument2*, pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.call(this, pbstrsubmissionid)
  end
  def get_bodies(this : IFaxDocument2*, pvbodies : VARIANT*) : HRESULT
    @lpVtbl.value.get_bodies.call(this, pvbodies)
  end
  def put_bodies(this : IFaxDocument2*, vbodies : VARIANT) : HRESULT
    @lpVtbl.value.put_bodies.call(this, vbodies)
  end
  def submit2(this : IFaxDocument2*, bstrfaxservername : UInt8*, pvfaxoutgoingjobids : VARIANT*, plerrorbodyfile : Int32*) : HRESULT
    @lpVtbl.value.submit2.call(this, bstrfaxservername, pvfaxoutgoingjobids, plerrorbodyfile)
  end
  def connected_submit2(this : IFaxDocument2*, pfaxserver : IFaxServer, pvfaxoutgoingjobids : VARIANT*, plerrorbodyfile : Int32*) : HRESULT
    @lpVtbl.value.connected_submit2.call(this, pfaxserver, pvfaxoutgoingjobids, plerrorbodyfile)
  end
end
struct LibWin32::IFaxConfiguration
  def query_interface(this : IFaxConfiguration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxConfiguration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxConfiguration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxConfiguration*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxConfiguration*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxConfiguration*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxConfiguration*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_use_archive(this : IFaxConfiguration*, pbusearchive : Int16*) : HRESULT
    @lpVtbl.value.get_use_archive.call(this, pbusearchive)
  end
  def put_use_archive(this : IFaxConfiguration*, busearchive : Int16) : HRESULT
    @lpVtbl.value.put_use_archive.call(this, busearchive)
  end
  def get_archive_location(this : IFaxConfiguration*, pbstrarchivelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_archive_location.call(this, pbstrarchivelocation)
  end
  def put_archive_location(this : IFaxConfiguration*, bstrarchivelocation : UInt8*) : HRESULT
    @lpVtbl.value.put_archive_location.call(this, bstrarchivelocation)
  end
  def get_size_quota_warning(this : IFaxConfiguration*, pbsizequotawarning : Int16*) : HRESULT
    @lpVtbl.value.get_size_quota_warning.call(this, pbsizequotawarning)
  end
  def put_size_quota_warning(this : IFaxConfiguration*, bsizequotawarning : Int16) : HRESULT
    @lpVtbl.value.put_size_quota_warning.call(this, bsizequotawarning)
  end
  def get_high_quota_water_mark(this : IFaxConfiguration*, plhighquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_high_quota_water_mark.call(this, plhighquotawatermark)
  end
  def put_high_quota_water_mark(this : IFaxConfiguration*, lhighquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_high_quota_water_mark.call(this, lhighquotawatermark)
  end
  def get_low_quota_water_mark(this : IFaxConfiguration*, pllowquotawatermark : Int32*) : HRESULT
    @lpVtbl.value.get_low_quota_water_mark.call(this, pllowquotawatermark)
  end
  def put_low_quota_water_mark(this : IFaxConfiguration*, llowquotawatermark : Int32) : HRESULT
    @lpVtbl.value.put_low_quota_water_mark.call(this, llowquotawatermark)
  end
  def get_archive_age_limit(this : IFaxConfiguration*, plarchiveagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_archive_age_limit.call(this, plarchiveagelimit)
  end
  def put_archive_age_limit(this : IFaxConfiguration*, larchiveagelimit : Int32) : HRESULT
    @lpVtbl.value.put_archive_age_limit.call(this, larchiveagelimit)
  end
  def get_archive_size_low(this : IFaxConfiguration*, plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_archive_size_low.call(this, plsizelow)
  end
  def get_archive_size_high(this : IFaxConfiguration*, plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_archive_size_high.call(this, plsizehigh)
  end
  def get_outgoing_queue_blocked(this : IFaxConfiguration*, pboutgoingblocked : Int16*) : HRESULT
    @lpVtbl.value.get_outgoing_queue_blocked.call(this, pboutgoingblocked)
  end
  def put_outgoing_queue_blocked(this : IFaxConfiguration*, boutgoingblocked : Int16) : HRESULT
    @lpVtbl.value.put_outgoing_queue_blocked.call(this, boutgoingblocked)
  end
  def get_outgoing_queue_paused(this : IFaxConfiguration*, pboutgoingpaused : Int16*) : HRESULT
    @lpVtbl.value.get_outgoing_queue_paused.call(this, pboutgoingpaused)
  end
  def put_outgoing_queue_paused(this : IFaxConfiguration*, boutgoingpaused : Int16) : HRESULT
    @lpVtbl.value.put_outgoing_queue_paused.call(this, boutgoingpaused)
  end
  def get_allow_personal_cover_pages(this : IFaxConfiguration*, pballowpersonalcoverpages : Int16*) : HRESULT
    @lpVtbl.value.get_allow_personal_cover_pages.call(this, pballowpersonalcoverpages)
  end
  def put_allow_personal_cover_pages(this : IFaxConfiguration*, ballowpersonalcoverpages : Int16) : HRESULT
    @lpVtbl.value.put_allow_personal_cover_pages.call(this, ballowpersonalcoverpages)
  end
  def get_use_device_tsid(this : IFaxConfiguration*, pbusedevicetsid : Int16*) : HRESULT
    @lpVtbl.value.get_use_device_tsid.call(this, pbusedevicetsid)
  end
  def put_use_device_tsid(this : IFaxConfiguration*, busedevicetsid : Int16) : HRESULT
    @lpVtbl.value.put_use_device_tsid.call(this, busedevicetsid)
  end
  def get_retries(this : IFaxConfiguration*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def put_retries(this : IFaxConfiguration*, lretries : Int32) : HRESULT
    @lpVtbl.value.put_retries.call(this, lretries)
  end
  def get_retry_delay(this : IFaxConfiguration*, plretrydelay : Int32*) : HRESULT
    @lpVtbl.value.get_retry_delay.call(this, plretrydelay)
  end
  def put_retry_delay(this : IFaxConfiguration*, lretrydelay : Int32) : HRESULT
    @lpVtbl.value.put_retry_delay.call(this, lretrydelay)
  end
  def get_discount_rate_start(this : IFaxConfiguration*, pdatediscountratestart : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_start.call(this, pdatediscountratestart)
  end
  def put_discount_rate_start(this : IFaxConfiguration*, datediscountratestart : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_start.call(this, datediscountratestart)
  end
  def get_discount_rate_end(this : IFaxConfiguration*, pdatediscountrateend : Float64*) : HRESULT
    @lpVtbl.value.get_discount_rate_end.call(this, pdatediscountrateend)
  end
  def put_discount_rate_end(this : IFaxConfiguration*, datediscountrateend : Float64) : HRESULT
    @lpVtbl.value.put_discount_rate_end.call(this, datediscountrateend)
  end
  def get_outgoing_queue_age_limit(this : IFaxConfiguration*, ploutgoingqueueagelimit : Int32*) : HRESULT
    @lpVtbl.value.get_outgoing_queue_age_limit.call(this, ploutgoingqueueagelimit)
  end
  def put_outgoing_queue_age_limit(this : IFaxConfiguration*, loutgoingqueueagelimit : Int32) : HRESULT
    @lpVtbl.value.put_outgoing_queue_age_limit.call(this, loutgoingqueueagelimit)
  end
  def get_branding(this : IFaxConfiguration*, pbbranding : Int16*) : HRESULT
    @lpVtbl.value.get_branding.call(this, pbbranding)
  end
  def put_branding(this : IFaxConfiguration*, bbranding : Int16) : HRESULT
    @lpVtbl.value.put_branding.call(this, bbranding)
  end
  def get_incoming_queue_blocked(this : IFaxConfiguration*, pbincomingblocked : Int16*) : HRESULT
    @lpVtbl.value.get_incoming_queue_blocked.call(this, pbincomingblocked)
  end
  def put_incoming_queue_blocked(this : IFaxConfiguration*, bincomingblocked : Int16) : HRESULT
    @lpVtbl.value.put_incoming_queue_blocked.call(this, bincomingblocked)
  end
  def get_auto_create_account_on_connect(this : IFaxConfiguration*, pbautocreateaccountonconnect : Int16*) : HRESULT
    @lpVtbl.value.get_auto_create_account_on_connect.call(this, pbautocreateaccountonconnect)
  end
  def put_auto_create_account_on_connect(this : IFaxConfiguration*, bautocreateaccountonconnect : Int16) : HRESULT
    @lpVtbl.value.put_auto_create_account_on_connect.call(this, bautocreateaccountonconnect)
  end
  def get_incoming_faxes_are_public(this : IFaxConfiguration*, pbincomingfaxesarepublic : Int16*) : HRESULT
    @lpVtbl.value.get_incoming_faxes_are_public.call(this, pbincomingfaxesarepublic)
  end
  def put_incoming_faxes_are_public(this : IFaxConfiguration*, bincomingfaxesarepublic : Int16) : HRESULT
    @lpVtbl.value.put_incoming_faxes_are_public.call(this, bincomingfaxesarepublic)
  end
  def refresh(this : IFaxConfiguration*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxConfiguration*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
end
struct LibWin32::IFaxServer2
  def query_interface(this : IFaxServer2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxServer2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxServer2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxServer2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxServer2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxServer2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxServer2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect(this : IFaxServer2*, bstrservername : UInt8*) : HRESULT
    @lpVtbl.value.connect.call(this, bstrservername)
  end
  def get_server_name(this : IFaxServer2*, pbstrservername : UInt8**) : HRESULT
    @lpVtbl.value.get_server_name.call(this, pbstrservername)
  end
  def get_device_providers(this : IFaxServer2*, ppfaxdeviceproviders : IFaxDeviceProviders*) : HRESULT
    @lpVtbl.value.get_device_providers.call(this, ppfaxdeviceproviders)
  end
  def get_devices(this : IFaxServer2*, ppfaxdevices : IFaxDevices*) : HRESULT
    @lpVtbl.value.get_devices.call(this, ppfaxdevices)
  end
  def get_inbound_routing(this : IFaxServer2*, ppfaxinboundrouting : IFaxInboundRouting*) : HRESULT
    @lpVtbl.value.get_inbound_routing.call(this, ppfaxinboundrouting)
  end
  def get_folders(this : IFaxServer2*, pfaxfolders : IFaxFolders*) : HRESULT
    @lpVtbl.value.get_folders.call(this, pfaxfolders)
  end
  def get_logging_options(this : IFaxServer2*, ppfaxloggingoptions : IFaxLoggingOptions*) : HRESULT
    @lpVtbl.value.get_logging_options.call(this, ppfaxloggingoptions)
  end
  def get_major_version(this : IFaxServer2*, plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.call(this, plmajorversion)
  end
  def get_minor_version(this : IFaxServer2*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.call(this, plminorversion)
  end
  def get_major_build(this : IFaxServer2*, plmajorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_major_build.call(this, plmajorbuild)
  end
  def get_minor_build(this : IFaxServer2*, plminorbuild : Int32*) : HRESULT
    @lpVtbl.value.get_minor_build.call(this, plminorbuild)
  end
  def get_debug(this : IFaxServer2*, pbdebug : Int16*) : HRESULT
    @lpVtbl.value.get_debug.call(this, pbdebug)
  end
  def get_activity(this : IFaxServer2*, ppfaxactivity : IFaxActivity*) : HRESULT
    @lpVtbl.value.get_activity.call(this, ppfaxactivity)
  end
  def get_outbound_routing(this : IFaxServer2*, ppfaxoutboundrouting : IFaxOutboundRouting*) : HRESULT
    @lpVtbl.value.get_outbound_routing.call(this, ppfaxoutboundrouting)
  end
  def get_receipt_options(this : IFaxServer2*, ppfaxreceiptoptions : IFaxReceiptOptions*) : HRESULT
    @lpVtbl.value.get_receipt_options.call(this, ppfaxreceiptoptions)
  end
  def get_security(this : IFaxServer2*, ppfaxsecurity : IFaxSecurity*) : HRESULT
    @lpVtbl.value.get_security.call(this, ppfaxsecurity)
  end
  def disconnect(this : IFaxServer2*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def get_extension_property(this : IFaxServer2*, bstrguid : UInt8*, pvproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension_property.call(this, bstrguid, pvproperty)
  end
  def set_extension_property(this : IFaxServer2*, bstrguid : UInt8*, vproperty : VARIANT) : HRESULT
    @lpVtbl.value.set_extension_property.call(this, bstrguid, vproperty)
  end
  def listen_to_server_events(this : IFaxServer2*, eventtypes : FAX_SERVER_EVENTS_TYPE_ENUM) : HRESULT
    @lpVtbl.value.listen_to_server_events.call(this, eventtypes)
  end
  def register_device_provider(this : IFaxServer2*, bstrguid : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, tspname : UInt8*, lfspiversion : Int32) : HRESULT
    @lpVtbl.value.register_device_provider.call(this, bstrguid, bstrfriendlyname, bstrimagename, tspname, lfspiversion)
  end
  def unregister_device_provider(this : IFaxServer2*, bstruniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_device_provider.call(this, bstruniquename)
  end
  def register_inbound_routing_extension(this : IFaxServer2*, bstrextensionname : UInt8*, bstrfriendlyname : UInt8*, bstrimagename : UInt8*, vmethods : VARIANT) : HRESULT
    @lpVtbl.value.register_inbound_routing_extension.call(this, bstrextensionname, bstrfriendlyname, bstrimagename, vmethods)
  end
  def unregister_inbound_routing_extension(this : IFaxServer2*, bstrextensionuniquename : UInt8*) : HRESULT
    @lpVtbl.value.unregister_inbound_routing_extension.call(this, bstrextensionuniquename)
  end
  def get_registered_events(this : IFaxServer2*, peventtypes : FAX_SERVER_EVENTS_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_registered_events.call(this, peventtypes)
  end
  def get_api_version(this : IFaxServer2*, papiversion : FAX_SERVER_APIVERSION_ENUM*) : HRESULT
    @lpVtbl.value.get_api_version.call(this, papiversion)
  end
  def get_configuration(this : IFaxServer2*, ppfaxconfiguration : IFaxConfiguration*) : HRESULT
    @lpVtbl.value.get_configuration.call(this, ppfaxconfiguration)
  end
  def get_current_account(this : IFaxServer2*, ppcurrentaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.get_current_account.call(this, ppcurrentaccount)
  end
  def get_fax_account_set(this : IFaxServer2*, ppfaxaccountset : IFaxAccountSet*) : HRESULT
    @lpVtbl.value.get_fax_account_set.call(this, ppfaxaccountset)
  end
  def get_security2(this : IFaxServer2*, ppfaxsecurity2 : IFaxSecurity2*) : HRESULT
    @lpVtbl.value.get_security2.call(this, ppfaxsecurity2)
  end
end
struct LibWin32::IFaxAccountSet
  def query_interface(this : IFaxAccountSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccountSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccountSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccountSet*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccountSet*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccountSet*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccountSet*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_accounts(this : IFaxAccountSet*, ppfaxaccounts : IFaxAccounts*) : HRESULT
    @lpVtbl.value.get_accounts.call(this, ppfaxaccounts)
  end
  def get_account(this : IFaxAccountSet*, bstraccountname : UInt8*, pfaxaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.get_account.call(this, bstraccountname, pfaxaccount)
  end
  def add_account(this : IFaxAccountSet*, bstraccountname : UInt8*, pfaxaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.add_account.call(this, bstraccountname, pfaxaccount)
  end
  def remove_account(this : IFaxAccountSet*, bstraccountname : UInt8*) : HRESULT
    @lpVtbl.value.remove_account.call(this, bstraccountname)
  end
end
struct LibWin32::IFaxAccounts
  def query_interface(this : IFaxAccounts*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccounts*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccounts*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccounts*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccounts*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccounts*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccounts*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFaxAccounts*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IFaxAccounts*, vindex : VARIANT, pfaxaccount : IFaxAccount*) : HRESULT
    @lpVtbl.value.get_item.call(this, vindex, pfaxaccount)
  end
  def get_count(this : IFaxAccounts*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
end
struct LibWin32::IFaxAccount
  def query_interface(this : IFaxAccount*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccount*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccount*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccount*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccount*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccount*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccount*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_account_name(this : IFaxAccount*, pbstraccountname : UInt8**) : HRESULT
    @lpVtbl.value.get_account_name.call(this, pbstraccountname)
  end
  def get_folders(this : IFaxAccount*, ppfolders : IFaxAccountFolders*) : HRESULT
    @lpVtbl.value.get_folders.call(this, ppfolders)
  end
  def listen_to_account_events(this : IFaxAccount*, eventtypes : FAX_ACCOUNT_EVENTS_TYPE_ENUM) : HRESULT
    @lpVtbl.value.listen_to_account_events.call(this, eventtypes)
  end
  def get_registered_events(this : IFaxAccount*, pregisteredevents : FAX_ACCOUNT_EVENTS_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_registered_events.call(this, pregisteredevents)
  end
end
struct LibWin32::IFaxOutgoingJob2
  def query_interface(this : IFaxOutgoingJob2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingJob2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingJob2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingJob2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingJob2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingJob2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingJob2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_subject(this : IFaxOutgoingJob2*, pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, pbstrsubject)
  end
  def get_document_name(this : IFaxOutgoingJob2*, pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.call(this, pbstrdocumentname)
  end
  def get_pages(this : IFaxOutgoingJob2*, plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.call(this, plpages)
  end
  def get_size(this : IFaxOutgoingJob2*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_submission_id(this : IFaxOutgoingJob2*, pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.call(this, pbstrsubmissionid)
  end
  def get_id(this : IFaxOutgoingJob2*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_original_scheduled_time(this : IFaxOutgoingJob2*, pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.call(this, pdateoriginalscheduledtime)
  end
  def get_submission_time(this : IFaxOutgoingJob2*, pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.call(this, pdatesubmissiontime)
  end
  def get_receipt_type(this : IFaxOutgoingJob2*, preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.call(this, preceipttype)
  end
  def get_priority(this : IFaxOutgoingJob2*, ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def get_sender(this : IFaxOutgoingJob2*, ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.call(this, ppfaxsender)
  end
  def get_recipient(this : IFaxOutgoingJob2*, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.call(this, ppfaxrecipient)
  end
  def get_current_page(this : IFaxOutgoingJob2*, plcurrentpage : Int32*) : HRESULT
    @lpVtbl.value.get_current_page.call(this, plcurrentpage)
  end
  def get_device_id(this : IFaxOutgoingJob2*, pldeviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.call(this, pldeviceid)
  end
  def get_status(this : IFaxOutgoingJob2*, pstatus : FAX_JOB_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_extended_status_code(this : IFaxOutgoingJob2*, pextendedstatuscode : FAX_JOB_EXTENDED_STATUS_ENUM*) : HRESULT
    @lpVtbl.value.get_extended_status_code.call(this, pextendedstatuscode)
  end
  def get_extended_status(this : IFaxOutgoingJob2*, pbstrextendedstatus : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_status.call(this, pbstrextendedstatus)
  end
  def get_available_operations(this : IFaxOutgoingJob2*, pavailableoperations : FAX_JOB_OPERATIONS_ENUM*) : HRESULT
    @lpVtbl.value.get_available_operations.call(this, pavailableoperations)
  end
  def get_retries(this : IFaxOutgoingJob2*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_scheduled_time(this : IFaxOutgoingJob2*, pdatescheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_scheduled_time.call(this, pdatescheduledtime)
  end
  def get_transmission_start(this : IFaxOutgoingJob2*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxOutgoingJob2*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_csid(this : IFaxOutgoingJob2*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxOutgoingJob2*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def get_group_broadcast_receipts(this : IFaxOutgoingJob2*, pbgroupbroadcastreceipts : Int16*) : HRESULT
    @lpVtbl.value.get_group_broadcast_receipts.call(this, pbgroupbroadcastreceipts)
  end
  def pause(this : IFaxOutgoingJob2*) : HRESULT
    @lpVtbl.value.pause.call(this)
  end
  def resume(this : IFaxOutgoingJob2*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
  def restart(this : IFaxOutgoingJob2*) : HRESULT
    @lpVtbl.value.restart.call(this)
  end
  def copy_tiff(this : IFaxOutgoingJob2*, bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.call(this, bstrtiffpath)
  end
  def refresh(this : IFaxOutgoingJob2*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def cancel(this : IFaxOutgoingJob2*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def get_has_cover_page(this : IFaxOutgoingJob2*, pbhascoverpage : Int16*) : HRESULT
    @lpVtbl.value.get_has_cover_page.call(this, pbhascoverpage)
  end
  def get_receipt_address(this : IFaxOutgoingJob2*, pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.call(this, pbstrreceiptaddress)
  end
  def get_schedule_type(this : IFaxOutgoingJob2*, pscheduletype : FAX_SCHEDULE_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_schedule_type.call(this, pscheduletype)
  end
end
struct LibWin32::IFaxAccountFolders
  def query_interface(this : IFaxAccountFolders*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccountFolders*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccountFolders*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccountFolders*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccountFolders*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccountFolders*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccountFolders*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_outgoing_queue(this : IFaxAccountFolders*, pfaxoutgoingqueue : IFaxAccountOutgoingQueue*) : HRESULT
    @lpVtbl.value.get_outgoing_queue.call(this, pfaxoutgoingqueue)
  end
  def get_incoming_queue(this : IFaxAccountFolders*, pfaxincomingqueue : IFaxAccountIncomingQueue*) : HRESULT
    @lpVtbl.value.get_incoming_queue.call(this, pfaxincomingqueue)
  end
  def get_incoming_archive(this : IFaxAccountFolders*, pfaxincomingarchive : IFaxAccountIncomingArchive*) : HRESULT
    @lpVtbl.value.get_incoming_archive.call(this, pfaxincomingarchive)
  end
  def get_outgoing_archive(this : IFaxAccountFolders*, pfaxoutgoingarchive : IFaxAccountOutgoingArchive*) : HRESULT
    @lpVtbl.value.get_outgoing_archive.call(this, pfaxoutgoingarchive)
  end
end
struct LibWin32::IFaxAccountIncomingQueue
  def query_interface(this : IFaxAccountIncomingQueue*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccountIncomingQueue*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccountIncomingQueue*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccountIncomingQueue*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccountIncomingQueue*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccountIncomingQueue*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccountIncomingQueue*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_jobs(this : IFaxAccountIncomingQueue*, pfaxincomingjobs : IFaxIncomingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.call(this, pfaxincomingjobs)
  end
  def get_job(this : IFaxAccountIncomingQueue*, bstrjobid : UInt8*, pfaxincomingjob : IFaxIncomingJob*) : HRESULT
    @lpVtbl.value.get_job.call(this, bstrjobid, pfaxincomingjob)
  end
end
struct LibWin32::IFaxAccountOutgoingQueue
  def query_interface(this : IFaxAccountOutgoingQueue*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccountOutgoingQueue*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccountOutgoingQueue*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccountOutgoingQueue*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccountOutgoingQueue*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccountOutgoingQueue*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccountOutgoingQueue*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_jobs(this : IFaxAccountOutgoingQueue*, pfaxoutgoingjobs : IFaxOutgoingJobs*) : HRESULT
    @lpVtbl.value.get_jobs.call(this, pfaxoutgoingjobs)
  end
  def get_job(this : IFaxAccountOutgoingQueue*, bstrjobid : UInt8*, pfaxoutgoingjob : IFaxOutgoingJob*) : HRESULT
    @lpVtbl.value.get_job.call(this, bstrjobid, pfaxoutgoingjob)
  end
end
struct LibWin32::IFaxOutgoingMessage2
  def query_interface(this : IFaxOutgoingMessage2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxOutgoingMessage2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxOutgoingMessage2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxOutgoingMessage2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxOutgoingMessage2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxOutgoingMessage2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxOutgoingMessage2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_submission_id(this : IFaxOutgoingMessage2*, pbstrsubmissionid : UInt8**) : HRESULT
    @lpVtbl.value.get_submission_id.call(this, pbstrsubmissionid)
  end
  def get_id(this : IFaxOutgoingMessage2*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_subject(this : IFaxOutgoingMessage2*, pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, pbstrsubject)
  end
  def get_document_name(this : IFaxOutgoingMessage2*, pbstrdocumentname : UInt8**) : HRESULT
    @lpVtbl.value.get_document_name.call(this, pbstrdocumentname)
  end
  def get_retries(this : IFaxOutgoingMessage2*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_pages(this : IFaxOutgoingMessage2*, plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.call(this, plpages)
  end
  def get_size(this : IFaxOutgoingMessage2*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_original_scheduled_time(this : IFaxOutgoingMessage2*, pdateoriginalscheduledtime : Float64*) : HRESULT
    @lpVtbl.value.get_original_scheduled_time.call(this, pdateoriginalscheduledtime)
  end
  def get_submission_time(this : IFaxOutgoingMessage2*, pdatesubmissiontime : Float64*) : HRESULT
    @lpVtbl.value.get_submission_time.call(this, pdatesubmissiontime)
  end
  def get_priority(this : IFaxOutgoingMessage2*, ppriority : FAX_PRIORITY_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def get_sender(this : IFaxOutgoingMessage2*, ppfaxsender : IFaxSender*) : HRESULT
    @lpVtbl.value.get_sender.call(this, ppfaxsender)
  end
  def get_recipient(this : IFaxOutgoingMessage2*, ppfaxrecipient : IFaxRecipient*) : HRESULT
    @lpVtbl.value.get_recipient.call(this, ppfaxrecipient)
  end
  def get_device_name(this : IFaxOutgoingMessage2*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.call(this, pbstrdevicename)
  end
  def get_transmission_start(this : IFaxOutgoingMessage2*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxOutgoingMessage2*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_csid(this : IFaxOutgoingMessage2*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxOutgoingMessage2*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def copy_tiff(this : IFaxOutgoingMessage2*, bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.call(this, bstrtiffpath)
  end
  def delete(this : IFaxOutgoingMessage2*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_has_cover_page(this : IFaxOutgoingMessage2*, pbhascoverpage : Int16*) : HRESULT
    @lpVtbl.value.get_has_cover_page.call(this, pbhascoverpage)
  end
  def get_receipt_type(this : IFaxOutgoingMessage2*, preceipttype : FAX_RECEIPT_TYPE_ENUM*) : HRESULT
    @lpVtbl.value.get_receipt_type.call(this, preceipttype)
  end
  def get_receipt_address(this : IFaxOutgoingMessage2*, pbstrreceiptaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_receipt_address.call(this, pbstrreceiptaddress)
  end
  def get_read(this : IFaxOutgoingMessage2*, pbread : Int16*) : HRESULT
    @lpVtbl.value.get_read.call(this, pbread)
  end
  def put_read(this : IFaxOutgoingMessage2*, bread : Int16) : HRESULT
    @lpVtbl.value.put_read.call(this, bread)
  end
  def save(this : IFaxOutgoingMessage2*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def refresh(this : IFaxOutgoingMessage2*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
end
struct LibWin32::IFaxAccountIncomingArchive
  def query_interface(this : IFaxAccountIncomingArchive*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccountIncomingArchive*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccountIncomingArchive*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccountIncomingArchive*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccountIncomingArchive*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccountIncomingArchive*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccountIncomingArchive*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_size_low(this : IFaxAccountIncomingArchive*, plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.call(this, plsizelow)
  end
  def get_size_high(this : IFaxAccountIncomingArchive*, plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.call(this, plsizehigh)
  end
  def refresh(this : IFaxAccountIncomingArchive*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def get_messages(this : IFaxAccountIncomingArchive*, lprefetchsize : Int32, pfaxincomingmessageiterator : IFaxIncomingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.call(this, lprefetchsize, pfaxincomingmessageiterator)
  end
  def get_message(this : IFaxAccountIncomingArchive*, bstrmessageid : UInt8*, pfaxincomingmessage : IFaxIncomingMessage*) : HRESULT
    @lpVtbl.value.get_message.call(this, bstrmessageid, pfaxincomingmessage)
  end
end
struct LibWin32::IFaxAccountOutgoingArchive
  def query_interface(this : IFaxAccountOutgoingArchive*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccountOutgoingArchive*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccountOutgoingArchive*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccountOutgoingArchive*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccountOutgoingArchive*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccountOutgoingArchive*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccountOutgoingArchive*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_size_low(this : IFaxAccountOutgoingArchive*, plsizelow : Int32*) : HRESULT
    @lpVtbl.value.get_size_low.call(this, plsizelow)
  end
  def get_size_high(this : IFaxAccountOutgoingArchive*, plsizehigh : Int32*) : HRESULT
    @lpVtbl.value.get_size_high.call(this, plsizehigh)
  end
  def refresh(this : IFaxAccountOutgoingArchive*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def get_messages(this : IFaxAccountOutgoingArchive*, lprefetchsize : Int32, pfaxoutgoingmessageiterator : IFaxOutgoingMessageIterator*) : HRESULT
    @lpVtbl.value.get_messages.call(this, lprefetchsize, pfaxoutgoingmessageiterator)
  end
  def get_message(this : IFaxAccountOutgoingArchive*, bstrmessageid : UInt8*, pfaxoutgoingmessage : IFaxOutgoingMessage*) : HRESULT
    @lpVtbl.value.get_message.call(this, bstrmessageid, pfaxoutgoingmessage)
  end
end
struct LibWin32::IFaxSecurity2
  def query_interface(this : IFaxSecurity2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxSecurity2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxSecurity2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxSecurity2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxSecurity2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxSecurity2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxSecurity2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_descriptor(this : IFaxSecurity2*, pvdescriptor : VARIANT*) : HRESULT
    @lpVtbl.value.get_descriptor.call(this, pvdescriptor)
  end
  def put_descriptor(this : IFaxSecurity2*, vdescriptor : VARIANT) : HRESULT
    @lpVtbl.value.put_descriptor.call(this, vdescriptor)
  end
  def get_granted_rights(this : IFaxSecurity2*, pgrantedrights : FAX_ACCESS_RIGHTS_ENUM_2*) : HRESULT
    @lpVtbl.value.get_granted_rights.call(this, pgrantedrights)
  end
  def refresh(this : IFaxSecurity2*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def save(this : IFaxSecurity2*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_information_type(this : IFaxSecurity2*, plinformationtype : Int32*) : HRESULT
    @lpVtbl.value.get_information_type.call(this, plinformationtype)
  end
  def put_information_type(this : IFaxSecurity2*, linformationtype : Int32) : HRESULT
    @lpVtbl.value.put_information_type.call(this, linformationtype)
  end
end
struct LibWin32::IFaxIncomingMessage2
  def query_interface(this : IFaxIncomingMessage2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxIncomingMessage2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxIncomingMessage2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxIncomingMessage2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxIncomingMessage2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxIncomingMessage2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxIncomingMessage2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFaxIncomingMessage2*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_pages(this : IFaxIncomingMessage2*, plpages : Int32*) : HRESULT
    @lpVtbl.value.get_pages.call(this, plpages)
  end
  def get_size(this : IFaxIncomingMessage2*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_size.call(this, plsize)
  end
  def get_device_name(this : IFaxIncomingMessage2*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.call(this, pbstrdevicename)
  end
  def get_retries(this : IFaxIncomingMessage2*, plretries : Int32*) : HRESULT
    @lpVtbl.value.get_retries.call(this, plretries)
  end
  def get_transmission_start(this : IFaxIncomingMessage2*, pdatetransmissionstart : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_start.call(this, pdatetransmissionstart)
  end
  def get_transmission_end(this : IFaxIncomingMessage2*, pdatetransmissionend : Float64*) : HRESULT
    @lpVtbl.value.get_transmission_end.call(this, pdatetransmissionend)
  end
  def get_csid(this : IFaxIncomingMessage2*, pbstrcsid : UInt8**) : HRESULT
    @lpVtbl.value.get_csid.call(this, pbstrcsid)
  end
  def get_tsid(this : IFaxIncomingMessage2*, pbstrtsid : UInt8**) : HRESULT
    @lpVtbl.value.get_tsid.call(this, pbstrtsid)
  end
  def get_caller_id(this : IFaxIncomingMessage2*, pbstrcallerid : UInt8**) : HRESULT
    @lpVtbl.value.get_caller_id.call(this, pbstrcallerid)
  end
  def get_routing_information(this : IFaxIncomingMessage2*, pbstrroutinginformation : UInt8**) : HRESULT
    @lpVtbl.value.get_routing_information.call(this, pbstrroutinginformation)
  end
  def copy_tiff(this : IFaxIncomingMessage2*, bstrtiffpath : UInt8*) : HRESULT
    @lpVtbl.value.copy_tiff.call(this, bstrtiffpath)
  end
  def delete(this : IFaxIncomingMessage2*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_subject(this : IFaxIncomingMessage2*, pbstrsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, pbstrsubject)
  end
  def put_subject(this : IFaxIncomingMessage2*, bstrsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.call(this, bstrsubject)
  end
  def get_sender_name(this : IFaxIncomingMessage2*, pbstrsendername : UInt8**) : HRESULT
    @lpVtbl.value.get_sender_name.call(this, pbstrsendername)
  end
  def put_sender_name(this : IFaxIncomingMessage2*, bstrsendername : UInt8*) : HRESULT
    @lpVtbl.value.put_sender_name.call(this, bstrsendername)
  end
  def get_sender_fax_number(this : IFaxIncomingMessage2*, pbstrsenderfaxnumber : UInt8**) : HRESULT
    @lpVtbl.value.get_sender_fax_number.call(this, pbstrsenderfaxnumber)
  end
  def put_sender_fax_number(this : IFaxIncomingMessage2*, bstrsenderfaxnumber : UInt8*) : HRESULT
    @lpVtbl.value.put_sender_fax_number.call(this, bstrsenderfaxnumber)
  end
  def get_has_cover_page(this : IFaxIncomingMessage2*, pbhascoverpage : Int16*) : HRESULT
    @lpVtbl.value.get_has_cover_page.call(this, pbhascoverpage)
  end
  def put_has_cover_page(this : IFaxIncomingMessage2*, bhascoverpage : Int16) : HRESULT
    @lpVtbl.value.put_has_cover_page.call(this, bhascoverpage)
  end
  def get_recipients(this : IFaxIncomingMessage2*, pbstrrecipients : UInt8**) : HRESULT
    @lpVtbl.value.get_recipients.call(this, pbstrrecipients)
  end
  def put_recipients(this : IFaxIncomingMessage2*, bstrrecipients : UInt8*) : HRESULT
    @lpVtbl.value.put_recipients.call(this, bstrrecipients)
  end
  def get_was_re_assigned(this : IFaxIncomingMessage2*, pbwasreassigned : Int16*) : HRESULT
    @lpVtbl.value.get_was_re_assigned.call(this, pbwasreassigned)
  end
  def get_read(this : IFaxIncomingMessage2*, pbread : Int16*) : HRESULT
    @lpVtbl.value.get_read.call(this, pbread)
  end
  def put_read(this : IFaxIncomingMessage2*, bread : Int16) : HRESULT
    @lpVtbl.value.put_read.call(this, bread)
  end
  def re_assign(this : IFaxIncomingMessage2*) : HRESULT
    @lpVtbl.value.re_assign.call(this)
  end
  def save(this : IFaxIncomingMessage2*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def refresh(this : IFaxIncomingMessage2*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
end
struct LibWin32::IFaxServerNotify
  def query_interface(this : IFaxServerNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxServerNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxServerNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxServerNotify*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxServerNotify*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxServerNotify*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxServerNotify*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IIFaxServerNotify2
  def query_interface(this : IIFaxServerNotify2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIFaxServerNotify2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIFaxServerNotify2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIFaxServerNotify2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIFaxServerNotify2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIFaxServerNotify2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIFaxServerNotify2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_incoming_job_added(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_added.call(this, pfaxserver, bstrjobid)
  end
  def on_incoming_job_removed(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_removed.call(this, pfaxserver, bstrjobid)
  end
  def on_incoming_job_changed(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_incoming_job_changed.call(this, pfaxserver, bstrjobid, pjobstatus)
  end
  def on_outgoing_job_added(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_added.call(this, pfaxserver, bstrjobid)
  end
  def on_outgoing_job_removed(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_removed.call(this, pfaxserver, bstrjobid)
  end
  def on_outgoing_job_changed(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_outgoing_job_changed.call(this, pfaxserver, bstrjobid, pjobstatus)
  end
  def on_incoming_message_added(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_message_added.call(this, pfaxserver, bstrmessageid)
  end
  def on_incoming_message_removed(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_message_removed.call(this, pfaxserver, bstrmessageid)
  end
  def on_outgoing_message_added(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_added.call(this, pfaxserver, bstrmessageid)
  end
  def on_outgoing_message_removed(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_removed.call(this, pfaxserver, bstrmessageid)
  end
  def on_receipt_options_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_receipt_options_change.call(this, pfaxserver)
  end
  def on_activity_logging_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_activity_logging_config_change.call(this, pfaxserver)
  end
  def on_security_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_security_config_change.call(this, pfaxserver)
  end
  def on_event_logging_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_event_logging_config_change.call(this, pfaxserver)
  end
  def on_outgoing_queue_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outgoing_queue_config_change.call(this, pfaxserver)
  end
  def on_outgoing_archive_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outgoing_archive_config_change.call(this, pfaxserver)
  end
  def on_incoming_archive_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_incoming_archive_config_change.call(this, pfaxserver)
  end
  def on_devices_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_devices_config_change.call(this, pfaxserver)
  end
  def on_outbound_routing_groups_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outbound_routing_groups_config_change.call(this, pfaxserver)
  end
  def on_outbound_routing_rules_config_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_outbound_routing_rules_config_change.call(this, pfaxserver)
  end
  def on_server_activity_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, lincomingmessages : Int32, lroutingmessages : Int32, loutgoingmessages : Int32, lqueuedmessages : Int32) : HRESULT
    @lpVtbl.value.on_server_activity_change.call(this, pfaxserver, lincomingmessages, lroutingmessages, loutgoingmessages, lqueuedmessages)
  end
  def on_queues_status_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, boutgoingqueueblocked : Int16, boutgoingqueuepaused : Int16, bincomingqueueblocked : Int16) : HRESULT
    @lpVtbl.value.on_queues_status_change.call(this, pfaxserver, boutgoingqueueblocked, boutgoingqueuepaused, bincomingqueueblocked)
  end
  def on_new_call(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, lcallid : Int32, ldeviceid : Int32, bstrcallerid : UInt8*) : HRESULT
    @lpVtbl.value.on_new_call.call(this, pfaxserver, lcallid, ldeviceid, bstrcallerid)
  end
  def on_server_shut_down(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_server_shut_down.call(this, pfaxserver)
  end
  def on_device_status_change(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2, ldeviceid : Int32, bpoweredoff : Int16, bsending : Int16, breceiving : Int16, bringing : Int16) : HRESULT
    @lpVtbl.value.on_device_status_change.call(this, pfaxserver, ldeviceid, bpoweredoff, bsending, breceiving, bringing)
  end
  def on_general_server_config_changed(this : IIFaxServerNotify2*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_general_server_config_changed.call(this, pfaxserver)
  end
end
struct LibWin32::IFaxServerNotify2
  def query_interface(this : IFaxServerNotify2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxServerNotify2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxServerNotify2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxServerNotify2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxServerNotify2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxServerNotify2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxServerNotify2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IIFaxAccountNotify
  def query_interface(this : IIFaxAccountNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIFaxAccountNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIFaxAccountNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIFaxAccountNotify*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIFaxAccountNotify*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIFaxAccountNotify*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIFaxAccountNotify*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_incoming_job_added(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_added.call(this, pfaxaccount, bstrjobid)
  end
  def on_incoming_job_removed(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_incoming_job_removed.call(this, pfaxaccount, bstrjobid)
  end
  def on_incoming_job_changed(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_incoming_job_changed.call(this, pfaxaccount, bstrjobid, pjobstatus)
  end
  def on_outgoing_job_added(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_added.call(this, pfaxaccount, bstrjobid)
  end
  def on_outgoing_job_removed(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrjobid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_job_removed.call(this, pfaxaccount, bstrjobid)
  end
  def on_outgoing_job_changed(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrjobid : UInt8*, pjobstatus : IFaxJobStatus) : HRESULT
    @lpVtbl.value.on_outgoing_job_changed.call(this, pfaxaccount, bstrjobid, pjobstatus)
  end
  def on_incoming_message_added(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrmessageid : UInt8*, faddedtoreceivefolder : Int16) : HRESULT
    @lpVtbl.value.on_incoming_message_added.call(this, pfaxaccount, bstrmessageid, faddedtoreceivefolder)
  end
  def on_incoming_message_removed(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrmessageid : UInt8*, fremovedfromreceivefolder : Int16) : HRESULT
    @lpVtbl.value.on_incoming_message_removed.call(this, pfaxaccount, bstrmessageid, fremovedfromreceivefolder)
  end
  def on_outgoing_message_added(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_added.call(this, pfaxaccount, bstrmessageid)
  end
  def on_outgoing_message_removed(this : IIFaxAccountNotify*, pfaxaccount : IFaxAccount, bstrmessageid : UInt8*) : HRESULT
    @lpVtbl.value.on_outgoing_message_removed.call(this, pfaxaccount, bstrmessageid)
  end
  def on_server_shut_down(this : IIFaxAccountNotify*, pfaxserver : IFaxServer2) : HRESULT
    @lpVtbl.value.on_server_shut_down.call(this, pfaxserver)
  end
end
struct LibWin32::IFaxAccountNotify
  def query_interface(this : IFaxAccountNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFaxAccountNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFaxAccountNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFaxAccountNotify*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFaxAccountNotify*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFaxAccountNotify*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFaxAccountNotify*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IStillImageW
  def query_interface(this : IStillImageW*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStillImageW*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStillImageW*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IStillImageW*, hinst : HINSTANCE, dwversion : UInt32) : HRESULT
    @lpVtbl.value.initialize.call(this, hinst, dwversion)
  end
  def get_device_list(this : IStillImageW*, dwtype : UInt32, dwflags : UInt32, pdwitemsreturned : UInt32*, ppbuffer : Void**) : HRESULT
    @lpVtbl.value.get_device_list.call(this, dwtype, dwflags, pdwitemsreturned, ppbuffer)
  end
  def get_device_info(this : IStillImageW*, pwszdevicename : LibC::LPWSTR, ppbuffer : Void**) : HRESULT
    @lpVtbl.value.get_device_info.call(this, pwszdevicename, ppbuffer)
  end
  def create_device(this : IStillImageW*, pwszdevicename : LibC::LPWSTR, dwmode : UInt32, pdevice : IStiDevice*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_device.call(this, pwszdevicename, dwmode, pdevice, punkouter)
  end
  def get_device_value(this : IStillImageW*, pwszdevicename : LibC::LPWSTR, pvaluename : LibC::LPWSTR, ptype : UInt32*, pdata : UInt8*, cbdata : UInt32*) : HRESULT
    @lpVtbl.value.get_device_value.call(this, pwszdevicename, pvaluename, ptype, pdata, cbdata)
  end
  def set_device_value(this : IStillImageW*, pwszdevicename : LibC::LPWSTR, pvaluename : LibC::LPWSTR, type : UInt32, pdata : UInt8*, cbdata : UInt32) : HRESULT
    @lpVtbl.value.set_device_value.call(this, pwszdevicename, pvaluename, type, pdata, cbdata)
  end
  def get_sti_launch_information(this : IStillImageW*, pwszdevicename : Char*, pdweventcode : UInt32*, pwszeventname : Char*) : HRESULT
    @lpVtbl.value.get_sti_launch_information.call(this, pwszdevicename, pdweventcode, pwszeventname)
  end
  def register_launch_application(this : IStillImageW*, pwszappname : LibC::LPWSTR, pwszcommandline : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.register_launch_application.call(this, pwszappname, pwszcommandline)
  end
  def unregister_launch_application(this : IStillImageW*, pwszappname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.unregister_launch_application.call(this, pwszappname)
  end
  def enable_hw_notifications(this : IStillImageW*, pwszdevicename : LibC::LPWSTR, bnewstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_hw_notifications.call(this, pwszdevicename, bnewstate)
  end
  def get_hw_notification_state(this : IStillImageW*, pwszdevicename : LibC::LPWSTR, pbcurrentstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_hw_notification_state.call(this, pwszdevicename, pbcurrentstate)
  end
  def refresh_device_bus(this : IStillImageW*, pwszdevicename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.refresh_device_bus.call(this, pwszdevicename)
  end
  def launch_application_for_device(this : IStillImageW*, pwszdevicename : LibC::LPWSTR, pwszappname : LibC::LPWSTR, pstinotify : STINOTIFY*) : HRESULT
    @lpVtbl.value.launch_application_for_device.call(this, pwszdevicename, pwszappname, pstinotify)
  end
  def setup_device_parameters(this : IStillImageW*, param0 : STI_DEVICE_INFORMATIONW*) : HRESULT
    @lpVtbl.value.setup_device_parameters.call(this, param0)
  end
  def write_to_error_log(this : IStillImageW*, dwmessagetype : UInt32, pszmessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_to_error_log.call(this, dwmessagetype, pszmessage)
  end
end
struct LibWin32::IStiDevice
  def query_interface(this : IStiDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStiDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStiDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IStiDevice*, hinst : HINSTANCE, pwszdevicename : LibC::LPWSTR, dwversion : UInt32, dwmode : UInt32) : HRESULT
    @lpVtbl.value.initialize.call(this, hinst, pwszdevicename, dwversion, dwmode)
  end
  def get_capabilities(this : IStiDevice*, pdevcaps : STI_DEV_CAPS*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, pdevcaps)
  end
  def get_status(this : IStiDevice*, pdevstatus : STI_DEVICE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdevstatus)
  end
  def device_reset(this : IStiDevice*) : HRESULT
    @lpVtbl.value.device_reset.call(this)
  end
  def diagnostic(this : IStiDevice*, pbuffer : STI_DIAG*) : HRESULT
    @lpVtbl.value.diagnostic.call(this, pbuffer)
  end
  def escape(this : IStiDevice*, escapefunction : UInt32, lpindata : Void*, cbindatasize : UInt32, poutdata : Void*, dwoutdatasize : UInt32, pdwactualdata : UInt32*) : HRESULT
    @lpVtbl.value.escape.call(this, escapefunction, lpindata, cbindatasize, poutdata, dwoutdatasize, pdwactualdata)
  end
  def get_last_error(this : IStiDevice*, pdwlastdeviceerror : UInt32*) : HRESULT
    @lpVtbl.value.get_last_error.call(this, pdwlastdeviceerror)
  end
  def lock_device(this : IStiDevice*, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.lock_device.call(this, dwtimeout)
  end
  def un_lock_device(this : IStiDevice*) : HRESULT
    @lpVtbl.value.un_lock_device.call(this)
  end
  def raw_read_data(this : IStiDevice*, lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_data.call(this, lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_data(this : IStiDevice*, lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_data.call(this, lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_read_command(this : IStiDevice*, lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_command.call(this, lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_command(this : IStiDevice*, lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_command.call(this, lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def subscribe(this : IStiDevice*, lpsubsribe : STISUBSCRIBE*) : HRESULT
    @lpVtbl.value.subscribe.call(this, lpsubsribe)
  end
  def get_last_notification_data(this : IStiDevice*, lpnotify : STINOTIFY*) : HRESULT
    @lpVtbl.value.get_last_notification_data.call(this, lpnotify)
  end
  def un_subscribe(this : IStiDevice*) : HRESULT
    @lpVtbl.value.un_subscribe.call(this)
  end
  def get_last_error_info(this : IStiDevice*, plasterrorinfo : ERROR_INFOW*) : HRESULT
    @lpVtbl.value.get_last_error_info.call(this, plasterrorinfo)
  end
end
struct LibWin32::IStiDeviceControl
  def query_interface(this : IStiDeviceControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStiDeviceControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStiDeviceControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IStiDeviceControl*, dwdevicetype : UInt32, dwmode : UInt32, pwszportname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.initialize.call(this, dwdevicetype, dwmode, pwszportname, dwflags)
  end
  def raw_read_data(this : IStiDeviceControl*, lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_data.call(this, lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_data(this : IStiDeviceControl*, lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_data.call(this, lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_read_command(this : IStiDeviceControl*, lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_command.call(this, lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_command(this : IStiDeviceControl*, lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_command.call(this, lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_device_control(this : IStiDeviceControl*, escapefunction : UInt32, lpindata : Void*, cbindatasize : UInt32, poutdata : Void*, dwoutdatasize : UInt32, pdwactualdata : UInt32*) : HRESULT
    @lpVtbl.value.raw_device_control.call(this, escapefunction, lpindata, cbindatasize, poutdata, dwoutdatasize, pdwactualdata)
  end
  def get_last_error(this : IStiDeviceControl*, lpdwlasterror : UInt32*) : HRESULT
    @lpVtbl.value.get_last_error.call(this, lpdwlasterror)
  end
  def get_my_device_port_name(this : IStiDeviceControl*, lpszdevicepath : Char*, cwdevicepathsize : UInt32) : HRESULT
    @lpVtbl.value.get_my_device_port_name.call(this, lpszdevicepath, cwdevicepathsize)
  end
  def get_my_device_handle(this : IStiDeviceControl*, lph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_my_device_handle.call(this, lph)
  end
  def get_my_device_open_mode(this : IStiDeviceControl*, pdwopenmode : UInt32*) : HRESULT
    @lpVtbl.value.get_my_device_open_mode.call(this, pdwopenmode)
  end
  def write_to_error_log(this : IStiDeviceControl*, dwmessagetype : UInt32, pszmessage : LibC::LPWSTR, dwerrorcode : UInt32) : HRESULT
    @lpVtbl.value.write_to_error_log.call(this, dwmessagetype, pszmessage, dwerrorcode)
  end
end
struct LibWin32::IStiUSD
  def query_interface(this : IStiUSD*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStiUSD*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStiUSD*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IStiUSD*, pheldcb : IStiDeviceControl, dwstiversion : UInt32, hparameterskey : HKEY) : HRESULT
    @lpVtbl.value.initialize.call(this, pheldcb, dwstiversion, hparameterskey)
  end
  def get_capabilities(this : IStiUSD*, pdevcaps : STI_USD_CAPS*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, pdevcaps)
  end
  def get_status(this : IStiUSD*, pdevstatus : STI_DEVICE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdevstatus)
  end
  def device_reset(this : IStiUSD*) : HRESULT
    @lpVtbl.value.device_reset.call(this)
  end
  def diagnostic(this : IStiUSD*, pbuffer : STI_DIAG*) : HRESULT
    @lpVtbl.value.diagnostic.call(this, pbuffer)
  end
  def escape(this : IStiUSD*, escapefunction : UInt32, lpindata : Void*, cbindatasize : UInt32, poutdata : Void*, cboutdatasize : UInt32, pdwactualdata : UInt32*) : HRESULT
    @lpVtbl.value.escape.call(this, escapefunction, lpindata, cbindatasize, poutdata, cboutdatasize, pdwactualdata)
  end
  def get_last_error(this : IStiUSD*, pdwlastdeviceerror : UInt32*) : HRESULT
    @lpVtbl.value.get_last_error.call(this, pdwlastdeviceerror)
  end
  def lock_device(this : IStiUSD*) : HRESULT
    @lpVtbl.value.lock_device.call(this)
  end
  def un_lock_device(this : IStiUSD*) : HRESULT
    @lpVtbl.value.un_lock_device.call(this)
  end
  def raw_read_data(this : IStiUSD*, lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_data.call(this, lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_data(this : IStiUSD*, lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_data.call(this, lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def raw_read_command(this : IStiUSD*, lpbuffer : Void*, lpdwnumberofbytes : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_read_command.call(this, lpbuffer, lpdwnumberofbytes, lpoverlapped)
  end
  def raw_write_command(this : IStiUSD*, lpbuffer : Void*, nnumberofbytes : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.raw_write_command.call(this, lpbuffer, nnumberofbytes, lpoverlapped)
  end
  def set_notification_handle(this : IStiUSD*, hevent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_notification_handle.call(this, hevent)
  end
  def get_notification_data(this : IStiUSD*, lpnotify : STINOTIFY*) : HRESULT
    @lpVtbl.value.get_notification_data.call(this, lpnotify)
  end
  def get_last_error_info(this : IStiUSD*, plasterrorinfo : ERROR_INFOW*) : HRESULT
    @lpVtbl.value.get_last_error_info.call(this, plasterrorinfo)
  end
end
