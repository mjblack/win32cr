require "../system/com.cr"
require "../foundation.cr"
require "../media/audio.cr"
require "../media/audio/apo.cr"
require "../system/com/structuredstorage.cr"
require "../system/winrt.cr"
require "../ui/windowsandmessaging.cr"
require "../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wtsapi32.dll")]
lib LibWin32
  alias HwtsVirtualChannelHandle = LibC::IntPtrT

  WTS_DOMAIN_LENGTH = 255_u32
  WTS_USERNAME_LENGTH = 255_u32
  WTS_PASSWORD_LENGTH = 255_u32
  WTS_DIRECTORY_LENGTH = 256_u32
  WTS_INITIALPROGRAM_LENGTH = 256_u32
  WTS_PROTOCOL_NAME_LENGTH = 8_u32
  WTS_DRIVER_NAME_LENGTH = 8_u32
  WTS_DEVICE_NAME_LENGTH = 19_u32
  WTS_IMEFILENAME_LENGTH = 32_u32
  WTS_CLIENTNAME_LENGTH = 20_u32
  WTS_CLIENTADDRESS_LENGTH = 30_u32
  WTS_CLIENT_PRODUCT_ID_LENGTH = 32_u32
  WTS_MAX_PROTOCOL_CACHE = 4_u32
  WTS_MAX_CACHE_RESERVED = 20_u32
  WTS_MAX_RESERVED = 100_u32
  WTS_MAX_COUNTERS = 100_u32
  WTS_MAX_DISPLAY_IOCTL_DATA = 256_u32
  WTS_PERF_DISABLE_NOTHING = 0_u32
  WTS_PERF_DISABLE_WALLPAPER = 1_u32
  WTS_PERF_DISABLE_FULLWINDOWDRAG = 2_u32
  WTS_PERF_DISABLE_MENUANIMATIONS = 4_u32
  WTS_PERF_DISABLE_THEMING = 8_u32
  WTS_PERF_ENABLE_ENHANCED_GRAPHICS = 16_u32
  WTS_PERF_DISABLE_CURSOR_SHADOW = 32_u32
  WTS_PERF_DISABLE_CURSORSETTINGS = 64_u32
  WTS_PERF_ENABLE_FONT_SMOOTHING = 128_u32
  WTS_PERF_ENABLE_DESKTOP_COMPOSITION = 256_u32
  WTS_VALUE_TYPE_ULONG = 1_u32
  WTS_VALUE_TYPE_STRING = 2_u32
  WTS_VALUE_TYPE_BINARY = 3_u32
  WTS_VALUE_TYPE_GUID = 4_u32
  WTS_KEY_EXCHANGE_ALG_RSA = 1_u32
  WTS_KEY_EXCHANGE_ALG_DH = 2_u32
  WTS_LICENSE_PROTOCOL_VERSION = 65536_u32
  WTS_LICENSE_PREAMBLE_VERSION = 3_u32
  WRDS_DOMAIN_LENGTH = 255_u32
  WRDS_USERNAME_LENGTH = 255_u32
  WRDS_PASSWORD_LENGTH = 255_u32
  WRDS_DIRECTORY_LENGTH = 256_u32
  WRDS_INITIALPROGRAM_LENGTH = 256_u32
  WRDS_PROTOCOL_NAME_LENGTH = 8_u32
  WRDS_DRIVER_NAME_LENGTH = 8_u32
  WRDS_DEVICE_NAME_LENGTH = 19_u32
  WRDS_IMEFILENAME_LENGTH = 32_u32
  WRDS_CLIENTNAME_LENGTH = 20_u32
  WRDS_CLIENTADDRESS_LENGTH = 30_u32
  WRDS_CLIENT_PRODUCT_ID_LENGTH = 32_u32
  WRDS_MAX_PROTOCOL_CACHE = 4_u32
  WRDS_MAX_CACHE_RESERVED = 20_u32
  WRDS_MAX_RESERVED = 100_u32
  WRDS_MAX_COUNTERS = 100_u32
  WRDS_MAX_DISPLAY_IOCTL_DATA = 256_u32
  WRDS_PERF_DISABLE_NOTHING = 0_u32
  WRDS_PERF_DISABLE_WALLPAPER = 1_u32
  WRDS_PERF_DISABLE_FULLWINDOWDRAG = 2_u32
  WRDS_PERF_DISABLE_MENUANIMATIONS = 4_u32
  WRDS_PERF_DISABLE_THEMING = 8_u32
  WRDS_PERF_ENABLE_ENHANCED_GRAPHICS = 16_u32
  WRDS_PERF_DISABLE_CURSOR_SHADOW = 32_u32
  WRDS_PERF_DISABLE_CURSORSETTINGS = 64_u32
  WRDS_PERF_ENABLE_FONT_SMOOTHING = 128_u32
  WRDS_PERF_ENABLE_DESKTOP_COMPOSITION = 256_u32
  WRDS_VALUE_TYPE_ULONG = 1_u32
  WRDS_VALUE_TYPE_STRING = 2_u32
  WRDS_VALUE_TYPE_BINARY = 3_u32
  WRDS_VALUE_TYPE_GUID = 4_u32
  WRDS_KEY_EXCHANGE_ALG_RSA = 1_u32
  WRDS_KEY_EXCHANGE_ALG_DH = 2_u32
  WRDS_LICENSE_PROTOCOL_VERSION = 65536_u32
  WRDS_LICENSE_PREAMBLE_VERSION = 3_u32
  SINGLE_SESSION = 1_u32
  FORCE_REJOIN = 2_u32
  FORCE_REJOIN_IN_CLUSTERMODE = 3_u32
  RESERVED_FOR_LEGACY = 4_u32
  KEEP_EXISTING_SESSIONS = 8_u32
  CHANNEL_EVENT_INITIALIZED = 0_u32
  CHANNEL_EVENT_CONNECTED = 1_u32
  CHANNEL_EVENT_V1_CONNECTED = 2_u32
  CHANNEL_EVENT_DISCONNECTED = 3_u32
  CHANNEL_EVENT_TERMINATED = 4_u32
  CHANNEL_EVENT_DATA_RECEIVED = 10_u32
  CHANNEL_EVENT_WRITE_COMPLETE = 11_u32
  CHANNEL_EVENT_WRITE_CANCELLED = 12_u32
  CHANNEL_RC_OK = 0_u32
  CHANNEL_RC_ALREADY_INITIALIZED = 1_u32
  CHANNEL_RC_NOT_INITIALIZED = 2_u32
  CHANNEL_RC_ALREADY_CONNECTED = 3_u32
  CHANNEL_RC_NOT_CONNECTED = 4_u32
  CHANNEL_RC_TOO_MANY_CHANNELS = 5_u32
  CHANNEL_RC_BAD_CHANNEL = 6_u32
  CHANNEL_RC_BAD_CHANNEL_HANDLE = 7_u32
  CHANNEL_RC_NO_BUFFER = 8_u32
  CHANNEL_RC_BAD_INIT_HANDLE = 9_u32
  CHANNEL_RC_NOT_OPEN = 10_u32
  CHANNEL_RC_BAD_PROC = 11_u32
  CHANNEL_RC_NO_MEMORY = 12_u32
  CHANNEL_RC_UNKNOWN_CHANNEL_NAME = 13_u32
  CHANNEL_RC_ALREADY_OPEN = 14_u32
  CHANNEL_RC_NOT_IN_VIRTUALCHANNELENTRY = 15_u32
  CHANNEL_RC_NULL_DATA = 16_u32
  CHANNEL_RC_ZERO_LENGTH = 17_u32
  CHANNEL_RC_INVALID_INSTANCE = 18_u32
  CHANNEL_RC_UNSUPPORTED_VERSION = 19_u32
  CHANNEL_RC_INITIALIZATION_ERROR = 20_u32
  VIRTUAL_CHANNEL_VERSION_WIN2000 = 1_u32
  CHANNEL_CHUNK_LENGTH = 1600_u32
  CHANNEL_BUFFER_SIZE = 65535_u32
  CHANNEL_FLAG_FIRST = 1_u32
  CHANNEL_FLAG_LAST = 2_u32
  CHANNEL_FLAG_MIDDLE = 0_u32
  CHANNEL_FLAG_FAIL = 256_u32
  CHANNEL_OPTION_INITIALIZED = 2147483648_u32
  CHANNEL_OPTION_ENCRYPT_RDP = 1073741824_u32
  CHANNEL_OPTION_ENCRYPT_SC = 536870912_u32
  CHANNEL_OPTION_ENCRYPT_CS = 268435456_u32
  CHANNEL_OPTION_PRI_HIGH = 134217728_u32
  CHANNEL_OPTION_PRI_MED = 67108864_u32
  CHANNEL_OPTION_PRI_LOW = 33554432_u32
  CHANNEL_OPTION_COMPRESS_RDP = 8388608_u32
  CHANNEL_OPTION_COMPRESS = 4194304_u32
  CHANNEL_OPTION_SHOW_PROTOCOL = 2097152_u32
  CHANNEL_OPTION_REMOTE_CONTROL_PERSISTENT = 1048576_u32
  CHANNEL_MAX_COUNT = 30_u32
  CHANNEL_NAME_LEN = 7_u32
  MAX_POLICY_ATTRIBUTES = 20_u32
  WTS_CURRENT_SESSION = 4294967295_u32
  USERNAME_LENGTH = 20_u32
  CLIENTNAME_LENGTH = 20_u32
  CLIENTADDRESS_LENGTH = 30_u32
  WTS_WSD_LOGOFF = 1_u32
  WTS_WSD_SHUTDOWN = 2_u32
  WTS_WSD_REBOOT = 4_u32
  WTS_WSD_POWEROFF = 8_u32
  WTS_WSD_FASTREBOOT = 16_u32
  MAX_ELAPSED_TIME_LENGTH = 15_u32
  MAX_DATE_TIME_LENGTH = 56_u32
  WINSTATIONNAME_LENGTH = 32_u32
  DOMAIN_LENGTH = 17_u32
  WTS_DRIVE_LENGTH = 3_u32
  WTS_LISTENER_NAME_LENGTH = 32_u32
  WTS_COMMENT_LENGTH = 60_u32
  WTS_LISTENER_CREATE = 1_u32
  WTS_LISTENER_UPDATE = 16_u32
  WTS_SECURITY_QUERY_INFORMATION = 1_u32
  WTS_SECURITY_SET_INFORMATION = 2_u32
  WTS_SECURITY_RESET = 4_u32
  WTS_SECURITY_VIRTUAL_CHANNELS = 8_u32
  WTS_SECURITY_REMOTE_CONTROL = 16_u32
  WTS_SECURITY_LOGON = 32_u32
  WTS_SECURITY_LOGOFF = 64_u32
  WTS_SECURITY_MESSAGE = 128_u32
  WTS_SECURITY_CONNECT = 256_u32
  WTS_SECURITY_DISCONNECT = 512_u32
  WTS_SECURITY_GUEST_ACCESS = 32_u32
  WTS_PROTOCOL_TYPE_CONSOLE = 0_u32
  WTS_PROTOCOL_TYPE_ICA = 1_u32
  WTS_PROTOCOL_TYPE_RDP = 2_u32
  WTS_SESSIONSTATE_UNKNOWN = 4294967295_u32
  WTS_SESSIONSTATE_LOCK = 0_u32
  WTS_SESSIONSTATE_UNLOCK = 1_u32
  PRODUCTINFO_COMPANYNAME_LENGTH = 256_u32
  PRODUCTINFO_PRODUCTID_LENGTH = 4_u32
  VALIDATIONINFORMATION_LICENSE_LENGTH = 16384_u32
  VALIDATIONINFORMATION_HARDWAREID_LENGTH = 20_u32
  WTS_EVENT_NONE = 0_u32
  WTS_EVENT_CREATE = 1_u32
  WTS_EVENT_DELETE = 2_u32
  WTS_EVENT_RENAME = 4_u32
  WTS_EVENT_CONNECT = 8_u32
  WTS_EVENT_DISCONNECT = 16_u32
  WTS_EVENT_LOGON = 32_u32
  WTS_EVENT_LOGOFF = 64_u32
  WTS_EVENT_STATECHANGE = 128_u32
  WTS_EVENT_LICENSE = 256_u32
  WTS_EVENT_ALL = 2147483647_u32
  WTS_EVENT_FLUSH = 2147483648_u32
  REMOTECONTROL_KBDSHIFT_HOTKEY = 1_u32
  REMOTECONTROL_KBDCTRL_HOTKEY = 2_u32
  REMOTECONTROL_KBDALT_HOTKEY = 4_u32
  WTS_CHANNEL_OPTION_DYNAMIC = 1_u32
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_LOW = 0_u32
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_MED = 2_u32
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_HIGH = 4_u32
  WTS_CHANNEL_OPTION_DYNAMIC_PRI_REAL = 6_u32
  WTS_CHANNEL_OPTION_DYNAMIC_NO_COMPRESS = 8_u32
  NOTIFY_FOR_ALL_SESSIONS = 1_u32
  NOTIFY_FOR_THIS_SESSION = 0_u32
  WTS_PROCESS_INFO_LEVEL_0 = 0_u32
  WTS_PROCESS_INFO_LEVEL_1 = 1_u32
  PLUGIN_CAPABILITY_EXTERNAL_REDIRECTION = 1_u32
  MaxFQDN_Len = 256_u32
  MaxNetBiosName_Len = 16_u32
  MaxNumOfExposed_IPs = 12_u32
  MaxUserName_Len = 104_u32
  MaxDomainName_Len = 256_u32
  MaxFarm_Len = 256_u32
  MaxAppName_Len = 256_u32
  WKS_FLAG_CLEAR_CREDS_ON_LAST_RESOURCE = 1_u32
  WKS_FLAG_PASSWORD_ENCRYPTED = 2_u32
  WKS_FLAG_CREDS_AUTHENTICATED = 4_u32
  SB_SYNCH_CONFLICT_MAX_WRITE_ATTEMPTS = 100_u32
  ACQUIRE_TARGET_LOCK_TIMEOUT = 300000_u32
  RENDER_HINT_CLEAR = 0_u32
  RENDER_HINT_VIDEO = 1_u32
  RENDER_HINT_MAPPEDWINDOW = 2_u32
  TS_VC_LISTENER_STATIC_CHANNEL = 1_u32
  WRdsGraphicsChannels_LossyChannelMaxMessageSize = 988_u32
  RFX_RDP_MSG_PREFIX = 0_u32
  RFX_GFX_MSG_PREFIX = 48_u32
  RFX_GFX_MSG_PREFIX_MASK = 48_u32
  RFX_GFX_MAX_SUPPORTED_MONITORS = 16_u32
  RFX_CLIENT_ID_LENGTH = 32_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_CONNECT = 701_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_DISCONNECT = 702_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_RECONNECT = 703_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_DELETE_SAVED_CREDENTIALS = 704_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_UPDATE_SESSION_DISPLAYSETTINGS = 705_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_ATTACH_EVENT = 706_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_DETACH_EVENT = 707_u32
  DISPID_PROP_REMOTEDESKTOPCLIENT_SETTINGS = 710_u32
  DISPID_PROP_REMOTEDESKTOPCLIENT_ACTIONS = 711_u32
  DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCH_POINTER = 712_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_SET_RDPPROPERTY = 720_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_RDPPROPERTY = 721_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_APPLY_SETTINGS = 722_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_RETRIEVE_SETTINGS = 723_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_SUSPEND_SCREEN_UPDATES = 730_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_RESUME_SCREEN_UPDATES = 731_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_EXECUTE_REMOTE_ACTION = 732_u32
  DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_SNAPSHOT = 733_u32
  DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_ENABLED = 740_u32
  DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_EVENTSENABLED = 741_u32
  DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_POINTERSPEED = 742_u32
  DISPID_AX_CONNECTING = 750_u32
  DISPID_AX_CONNECTED = 751_u32
  DISPID_AX_LOGINCOMPLETED = 752_u32
  DISPID_AX_DISCONNECTED = 753_u32
  DISPID_AX_STATUSCHANGED = 754_u32
  DISPID_AX_AUTORECONNECTING = 755_u32
  DISPID_AX_AUTORECONNECTED = 756_u32
  DISPID_AX_DIALOGDISPLAYING = 757_u32
  DISPID_AX_DIALOGDISMISSED = 758_u32
  DISPID_AX_NETWORKSTATUSCHANGED = 759_u32
  DISPID_AX_ADMINMESSAGERECEIVED = 760_u32
  DISPID_AX_KEYCOMBINATIONPRESSED = 761_u32
  DISPID_AX_REMOTEDESKTOPSIZECHANGED = 762_u32
  DISPID_AX_TOUCHPOINTERCURSORMOVED = 800_u32
  RDCLIENT_BITMAP_RENDER_SERVICE = "e4cc08cb-942e-4b19-8504-bd5a89a747f5"
  WTS_QUERY_ALLOWED_INITIAL_APP = "c77d1b30-5be1-4c6b-a0e1-bd6d2e5c9fcc"
  WTS_QUERY_LOGON_SCREEN_SIZE = "8b8e0fe7-0804-4a0e-b279-8660b1df0049"
  WTS_QUERY_AUDIOENUM_DLL = "9bf4fa97-c883-4c2a-80ab-5a39c9af00db"
  WTS_QUERY_MF_FORMAT_SUPPORT = "41869ad0-6332-4dc8-95d5-db749e2f1d94"
  WRDS_SERVICE_ID_GRAPHICS_GUID = "d2993f4d-02cf-4280-8c48-1624b44f8706"
  PROPERTY_DYNAMIC_TIME_ZONE_INFORMATION = "0cdfd28e-d0b9-4c1f-a5eb-6d1f6c6535b9"
  PROPERTY_TYPE_GET_FAST_RECONNECT = "6212d757-0043-4862-99c3-9f3059ac2a3b"
  PROPERTY_TYPE_GET_FAST_RECONNECT_USER_SID = "197c427a-0135-4b6d-9c5e-e6579a0ab625"
  PROPERTY_TYPE_ENABLE_UNIVERSAL_APPS_FOR_CUSTOM_SHELL = "ed2c3fda-338d-4d3f-81a3-e767310d908e"
  CONNECTION_PROPERTY_IDLE_TIME_WARNING = "693f7ff5-0c4e-4d17-b8e0-1f70325e5d58"
  CONNECTION_PROPERTY_CURSOR_BLINK_DISABLED = "4b150580-fea4-4d3c-9de4-7433a66618f7"
  TSUserExInterfaces = LibC::GUID.new(0x910dd01_u32, 0xdf8c_u16, 0x11d1_u16, StaticArray[0xae_u8, 0x27_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xa3_u8, 0x58_u8, 0x13_u8])
  ADsTSUserEx = LibC::GUID.new(0xe2e9cae6_u32, 0x1e7b_u16, 0x4b8e_u16, StaticArray[0xba_u8, 0xbd_u8, 0xe9_u8, 0xbf_u8, 0x62_u8, 0x92_u8, 0xac_u8, 0x29_u8])
  Workspace = LibC::GUID.new(0x4f1dfca6_u32, 0x3aad_u16, 0x48e1_u16, StaticArray[0x84_u8, 0x6_u8, 0x4b_u8, 0xc2_u8, 0x1a_u8, 0x50_u8, 0x1d_u8, 0x7c_u8])

  alias PCHANNEL_INIT_EVENT_FN = Proc(Void*, UInt32, Void*, UInt32, Void)
  alias PCHANNEL_OPEN_EVENT_FN = Proc(UInt32, UInt32, Void*, UInt32, UInt32, UInt32, Void)
  alias PVIRTUALCHANNELINIT = Proc(Void**, CHANNEL_DEF*, Int32, UInt32, PCHANNEL_INIT_EVENT_FN, UInt32)
  alias PVIRTUALCHANNELOPEN = Proc(Void*, UInt32*, PSTR, PCHANNEL_OPEN_EVENT_FN, UInt32)
  alias PVIRTUALCHANNELCLOSE = Proc(UInt32, UInt32)
  alias PVIRTUALCHANNELWRITE = Proc(UInt32, Void*, UInt32, Void*, UInt32)
  alias PVIRTUALCHANNELENTRY = Proc(CHANNEL_ENTRY_POINTS*, LibC::BOOL)


  enum AE_POSITION_FLAGS : Int32
    POSITION_INVALID = 0
    POSITION_DISCONTINUOUS = 1
    POSITION_CONTINUOUS = 2
    POSITION_QPC_ERROR = 4
  end

  enum AAAuthSchemes : Int32
    AA_AUTH_MIN = 0
    AA_AUTH_BASIC = 1
    AA_AUTH_NTLM = 2
    AA_AUTH_SC = 3
    AA_AUTH_LOGGEDONCREDENTIALS = 4
    AA_AUTH_NEGOTIATE = 5
    AA_AUTH_ANY = 6
    AA_AUTH_COOKIE = 7
    AA_AUTH_DIGEST = 8
    AA_AUTH_ORGID = 9
    AA_AUTH_CONID = 10
    AA_AUTH_SSPI_NTLM = 11
    AA_AUTH_MAX = 12
  end

  enum AAAccountingDataType : Int32
    AA_MAIN_SESSION_CREATION = 0
    AA_SUB_SESSION_CREATION = 1
    AA_SUB_SESSION_CLOSED = 2
    AA_MAIN_SESSION_CLOSED = 3
  end

  enum SESSION_TIMEOUT_ACTION_TYPE : Int32
    SESSION_TIMEOUT_ACTION_DISCONNECT = 0
    SESSION_TIMEOUT_ACTION_SILENT_REAUTH = 1
  end

  enum PolicyAttributeType : Int32
    EnableAllRedirections = 0
    DisableAllRedirections = 1
    DriveRedirectionDisabled = 2
    PrinterRedirectionDisabled = 3
    PortRedirectionDisabled = 4
    ClipboardRedirectionDisabled = 5
    PnpRedirectionDisabled = 6
    AllowOnlySDRServers = 7
  end

  enum AATrustClassID : Int32
    AA_UNTRUSTED = 0
    AA_TRUSTEDUSER_UNTRUSTEDCLIENT = 1
    AA_TRUSTEDUSER_TRUSTEDCLIENT = 2
  end

  enum WTS_CONNECTSTATE_CLASS : Int32
    WTSActive = 0
    WTSConnected = 1
    WTSConnectQuery = 2
    WTSShadow = 3
    WTSDisconnected = 4
    WTSIdle = 5
    WTSListen = 6
    WTSReset = 7
    WTSDown = 8
    WTSInit = 9
  end

  enum WTS_INFO_CLASS : Int32
    WTSInitialProgram = 0
    WTSApplicationName = 1
    WTSWorkingDirectory = 2
    WTSOEMId = 3
    WTSSessionId = 4
    WTSUserName = 5
    WTSWinStationName = 6
    WTSDomainName = 7
    WTSConnectState = 8
    WTSClientBuildNumber = 9
    WTSClientName = 10
    WTSClientDirectory = 11
    WTSClientProductId = 12
    WTSClientHardwareId = 13
    WTSClientAddress = 14
    WTSClientDisplay = 15
    WTSClientProtocolType = 16
    WTSIdleTime = 17
    WTSLogonTime = 18
    WTSIncomingBytes = 19
    WTSOutgoingBytes = 20
    WTSIncomingFrames = 21
    WTSOutgoingFrames = 22
    WTSClientInfo = 23
    WTSSessionInfo = 24
    WTSSessionInfoEx = 25
    WTSConfigInfo = 26
    WTSValidationInfo = 27
    WTSSessionAddressV4 = 28
    WTSIsRemoteSession = 29
  end

  enum WTS_CONFIG_CLASS : Int32
    WTSUserConfigInitialProgram = 0
    WTSUserConfigWorkingDirectory = 1
    WTSUserConfigfInheritInitialProgram = 2
    WTSUserConfigfAllowLogonTerminalServer = 3
    WTSUserConfigTimeoutSettingsConnections = 4
    WTSUserConfigTimeoutSettingsDisconnections = 5
    WTSUserConfigTimeoutSettingsIdle = 6
    WTSUserConfigfDeviceClientDrives = 7
    WTSUserConfigfDeviceClientPrinters = 8
    WTSUserConfigfDeviceClientDefaultPrinter = 9
    WTSUserConfigBrokenTimeoutSettings = 10
    WTSUserConfigReconnectSettings = 11
    WTSUserConfigModemCallbackSettings = 12
    WTSUserConfigModemCallbackPhoneNumber = 13
    WTSUserConfigShadowingSettings = 14
    WTSUserConfigTerminalServerProfilePath = 15
    WTSUserConfigTerminalServerHomeDir = 16
    WTSUserConfigTerminalServerHomeDirDrive = 17
    WTSUserConfigfTerminalServerRemoteHomeDir = 18
    WTSUserConfigUser = 19
  end

  enum WTS_CONFIG_SOURCE : Int32
    WTSUserConfigSourceSAM = 0
  end

  enum WTS_VIRTUAL_CLASS : Int32
    WTSVirtualClientData = 0
    WTSVirtualFileHandle = 1
  end

  enum WTS_TYPE_CLASS : Int32
    WTSTypeProcessInfoLevel0 = 0
    WTSTypeProcessInfoLevel1 = 1
    WTSTypeSessionInfoLevel1 = 2
  end

  enum WTSSBX_MACHINE_DRAIN : Int32
    WTSSBX_MACHINE_DRAIN_UNSPEC = 0
    WTSSBX_MACHINE_DRAIN_OFF = 1
    WTSSBX_MACHINE_DRAIN_ON = 2
  end

  enum WTSSBX_MACHINE_SESSION_MODE : Int32
    WTSSBX_MACHINE_SESSION_MODE_UNSPEC = 0
    WTSSBX_MACHINE_SESSION_MODE_SINGLE = 1
    WTSSBX_MACHINE_SESSION_MODE_MULTIPLE = 2
  end

  enum WTSSBX_ADDRESS_FAMILY : Int32
    WTSSBX_ADDRESS_FAMILY_AF_UNSPEC = 0
    WTSSBX_ADDRESS_FAMILY_AF_INET = 1
    WTSSBX_ADDRESS_FAMILY_AF_INET6 = 2
    WTSSBX_ADDRESS_FAMILY_AF_IPX = 3
    WTSSBX_ADDRESS_FAMILY_AF_NETBIOS = 4
  end

  enum WTSSBX_MACHINE_STATE : Int32
    WTSSBX_MACHINE_STATE_UNSPEC = 0
    WTSSBX_MACHINE_STATE_READY = 1
    WTSSBX_MACHINE_STATE_SYNCHRONIZING = 2
  end

  enum WTSSBX_SESSION_STATE : Int32
    WTSSBX_SESSION_STATE_UNSPEC = 0
    WTSSBX_SESSION_STATE_ACTIVE = 1
    WTSSBX_SESSION_STATE_DISCONNECTED = 2
  end

  enum WTSSBX_NOTIFICATION_TYPE : Int32
    WTSSBX_NOTIFICATION_REMOVED = 1
    WTSSBX_NOTIFICATION_CHANGED = 2
    WTSSBX_NOTIFICATION_ADDED = 4
    WTSSBX_NOTIFICATION_RESYNC = 8
  end

  enum TSSD_AddrV46Type : Int32
    TSSD_ADDR_UNDEFINED = 0
    TSSD_ADDR_IPv4 = 4
    TSSD_ADDR_IPv6 = 6
  end

  enum TSSB_NOTIFICATION_TYPE : Int32
    TSSB_NOTIFY_INVALID = 0
    TSSB_NOTIFY_TARGET_CHANGE = 1
    TSSB_NOTIFY_SESSION_CHANGE = 2
    TSSB_NOTIFY_CONNECTION_REQUEST_CHANGE = 4
  end

  enum TARGET_STATE : Int32
    TARGET_UNKNOWN = 1
    TARGET_INITIALIZING = 2
    TARGET_RUNNING = 3
    TARGET_DOWN = 4
    TARGET_HIBERNATED = 5
    TARGET_CHECKED_OUT = 6
    TARGET_STOPPED = 7
    TARGET_INVALID = 8
    TARGET_STARTING = 9
    TARGET_STOPPING = 10
    TARGET_MAXSTATE = 11
  end

  enum TARGET_CHANGE_TYPE : Int32
    TARGET_CHANGE_UNSPEC = 1
    TARGET_EXTERNALIP_CHANGED = 2
    TARGET_INTERNALIP_CHANGED = 4
    TARGET_JOINED = 8
    TARGET_REMOVED = 16
    TARGET_STATE_CHANGED = 32
    TARGET_IDLE = 64
    TARGET_PENDING = 128
    TARGET_INUSE = 256
    TARGET_PATCH_STATE_CHANGED = 512
    TARGET_FARM_MEMBERSHIP_CHANGED = 1024
  end

  enum TARGET_TYPE : Int32
    UNKNOWN = 0
    FARM = 1
    NONFARM = 2
  end

  enum TARGET_PATCH_STATE : Int32
    TARGET_PATCH_UNKNOWN = 0
    TARGET_PATCH_NOT_STARTED = 1
    TARGET_PATCH_IN_PROGRESS = 2
    TARGET_PATCH_COMPLETED = 3
    TARGET_PATCH_FAILED = 4
  end

  enum CLIENT_MESSAGE_TYPE : Int32
    CLIENT_MESSAGE_CONNECTION_INVALID = 0
    CLIENT_MESSAGE_CONNECTION_STATUS = 1
    CLIENT_MESSAGE_CONNECTION_ERROR = 2
  end

  enum CONNECTION_CHANGE_NOTIFICATION : Int32
    CONNECTION_REQUEST_INVALID = 0
    CONNECTION_REQUEST_PENDING = 1
    CONNECTION_REQUEST_FAILED = 2
    CONNECTION_REQUEST_TIMEDOUT = 3
    CONNECTION_REQUEST_SUCCEEDED = 4
    CONNECTION_REQUEST_CANCELLED = 5
    CONNECTION_REQUEST_LB_COMPLETED = 6
    CONNECTION_REQUEST_QUERY_PL_COMPLETED = 7
    CONNECTION_REQUEST_ORCH_COMPLETED = 8
  end

  enum RD_FARM_TYPE : Int32
    RD_FARM_RDSH = 0
    RD_FARM_TEMP_VM = 1
    RD_FARM_MANUAL_PERSONAL_VM = 2
    RD_FARM_AUTO_PERSONAL_VM = 3
    RD_FARM_MANUAL_PERSONAL_RDSH = 4
    RD_FARM_AUTO_PERSONAL_RDSH = 5
    RD_FARM_TYPE_UNKNOWN = -1
  end

  enum PLUGIN_TYPE : Int32
    UNKNOWN_PLUGIN = 0
    POLICY_PLUGIN = 1
    RESOURCE_PLUGIN = 2
    LOAD_BALANCING_PLUGIN = 4
    PLACEMENT_PLUGIN = 8
    ORCHESTRATION_PLUGIN = 16
    PROVISIONING_PLUGIN = 32
    TASK_PLUGIN = 64
  end

  enum TSSESSION_STATE : Int32
    STATE_INVALID = -1
    STATE_ACTIVE = 0
    STATE_CONNECTED = 1
    STATE_CONNECTQUERY = 2
    STATE_SHADOW = 3
    STATE_DISCONNECTED = 4
    STATE_IDLE = 5
    STATE_LISTEN = 6
    STATE_RESET = 7
    STATE_DOWN = 8
    STATE_INIT = 9
    STATE_MAX = 10
  end

  enum TARGET_OWNER : Int32
    OWNER_UNKNOWN = 0
    OWNER_MS_TS_PLUGIN = 1
    OWNER_MS_VM_PLUGIN = 2
  end

  enum VM_NOTIFY_STATUS : Int32
    VM_NOTIFY_STATUS_PENDING = 0
    VM_NOTIFY_STATUS_IN_PROGRESS = 1
    VM_NOTIFY_STATUS_COMPLETE = 2
    VM_NOTIFY_STATUS_FAILED = 3
    VM_NOTIFY_STATUS_CANCELED = 4
  end

  enum VM_HOST_NOTIFY_STATUS : Int32
    VM_HOST_STATUS_INIT_PENDING = 0
    VM_HOST_STATUS_INIT_IN_PROGRESS = 1
    VM_HOST_STATUS_INIT_COMPLETE = 2
    VM_HOST_STATUS_INIT_FAILED = 3
  end

  enum RDV_TASK_STATUS : Int32
    RDV_TASK_STATUS_UNKNOWN = 0
    RDV_TASK_STATUS_SEARCHING = 1
    RDV_TASK_STATUS_DOWNLOADING = 2
    RDV_TASK_STATUS_APPLYING = 3
    RDV_TASK_STATUS_REBOOTING = 4
    RDV_TASK_STATUS_REBOOTED = 5
    RDV_TASK_STATUS_SUCCESS = 6
    RDV_TASK_STATUS_FAILED = 7
    RDV_TASK_STATUS_TIMEOUT = 8
  end

  enum TS_SB_SORT_BY : Int32
    TS_SB_SORT_BY_NONE = 0
    TS_SB_SORT_BY_NAME = 1
    TS_SB_SORT_BY_PROP = 2
  end

  enum TSPUB_PLUGIN_PD_RESOLUTION_TYPE : Int32
    TSPUB_PLUGIN_PD_QUERY_OR_CREATE = 0
    TSPUB_PLUGIN_PD_QUERY_EXISTING = 1
  end

  enum TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE : Int32
    TSPUB_PLUGIN_PD_ASSIGNMENT_NEW = 0
    TSPUB_PLUGIN_PD_ASSIGNMENT_EXISTING = 1
  end

  enum WRdsGraphicsChannelType : Int32
    WRdsGraphicsChannelType_GuaranteedDelivery = 0
    WRdsGraphicsChannelType_BestEffortDelivery = 1
  end

  enum WTS_RCM_SERVICE_STATE : Int32
    WTS_SERVICE_NONE = 0
    WTS_SERVICE_START = 1
    WTS_SERVICE_STOP = 2
  end

  enum WTS_RCM_DRAIN_STATE : Int32
    WTS_DRAIN_STATE_NONE = 0
    WTS_DRAIN_IN_DRAIN = 1
    WTS_DRAIN_NOT_IN_DRAIN = 2
  end

  enum WTS_LOGON_ERROR_REDIRECTOR_RESPONSE : Int32
    WTS_LOGON_ERR_INVALID = 0
    WTS_LOGON_ERR_NOT_HANDLED = 1
    WTS_LOGON_ERR_HANDLED_SHOW = 2
    WTS_LOGON_ERR_HANDLED_DONT_SHOW = 3
    WTS_LOGON_ERR_HANDLED_DONT_SHOW_START_OVER = 4
  end

  enum WTS_CERT_TYPE : Int32
    WTS_CERT_TYPE_INVALID = 0
    WTS_CERT_TYPE_PROPRIETORY = 1
    WTS_CERT_TYPE_X509 = 2
  end

  enum WRDS_CONNECTION_SETTING_LEVEL : Int32
    WRDS_CONNECTION_SETTING_LEVEL_INVALID = 0
    WRDS_CONNECTION_SETTING_LEVEL_1 = 1
  end

  enum WRDS_LISTENER_SETTING_LEVEL : Int32
    WRDS_LISTENER_SETTING_LEVEL_INVALID = 0
    WRDS_LISTENER_SETTING_LEVEL_1 = 1
  end

  enum WRDS_SETTING_TYPE : Int32
    WRDS_SETTING_TYPE_INVALID = 0
    WRDS_SETTING_TYPE_MACHINE = 1
    WRDS_SETTING_TYPE_USER = 2
    WRDS_SETTING_TYPE_SAM = 3
  end

  enum WRDS_SETTING_STATUS : Int32
    WRDS_SETTING_STATUS_NOTAPPLICABLE = -1
    WRDS_SETTING_STATUS_DISABLED = 0
    WRDS_SETTING_STATUS_ENABLED = 1
    WRDS_SETTING_STATUS_NOTCONFIGURED = 2
  end

  enum WRDS_SETTING_LEVEL : Int32
    WRDS_SETTING_LEVEL_INVALID = 0
    WRDS_SETTING_LEVEL_1 = 1
  end

  enum PasswordEncodingType : Int32
    PasswordEncodingUTF8 = 0
    PasswordEncodingUTF16LE = 1
    PasswordEncodingUTF16BE = 2
  end

  enum RemoteActionType : Int32
    RemoteActionCharms = 0
    RemoteActionAppbar = 1
    RemoteActionSnap = 2
    RemoteActionStartScreen = 3
    RemoteActionAppSwitch = 4
  end

  enum SnapshotEncodingType : Int32
    SnapshotEncodingDataUri = 0
  end

  enum SnapshotFormatType : Int32
    SnapshotFormatPng = 0
    SnapshotFormatJpeg = 1
    SnapshotFormatBmp = 2
  end

  enum KeyCombinationType : Int32
    KeyCombinationHome = 0
    KeyCombinationLeft = 1
    KeyCombinationUp = 2
    KeyCombinationRight = 3
    KeyCombinationDown = 4
    KeyCombinationScroll = 5
  end

  union WTSINFOEX_LEVEL_W
    wts_info_ex_level1 : WTSINFOEX_LEVEL1_W
  end
  union WTSINFOEX_LEVEL_A
    wts_info_ex_level1 : WTSINFOEX_LEVEL1_A
  end
  union WTS_SOCKADDR_u_e__Union
    ipv4 : WTS_SOCKADDR_u_e__Union_ipv4_e__Struct
    ipv6 : WTS_SOCKADDR_u_e__Union_ipv6_e__Struct
  end
  union WTS_CACHE_STATS_UN
    protocol_cache : WTS_PROTOCOL_CACHE[4]*
    t_share_cache_stats : UInt32
    reserved : UInt32[20]*
  end
  union WTS_PROPERTY_VALUE_u_e__Union
    ul_val : UInt32
    str_val : WTS_PROPERTY_VALUE_u_e__Union_strVal_e__Struct
    b_val : WTS_PROPERTY_VALUE_u_e__Union_bVal_e__Struct
    guid_val : Guid
  end
  union WRDS_LISTENER_SETTING
    w_rds_listener_settings1 : WRDS_LISTENER_SETTINGS_1
  end
  union WRDS_CONNECTION_SETTING
    w_rds_connection_settings1 : WRDS_CONNECTION_SETTINGS_1
  end
  union WRDS_SETTING
    w_rds_settings1 : WRDS_SETTINGS_1
  end

  struct AE_CURRENT_POSITION
    u64_device_position : UInt64
    u64_stream_position : UInt64
    u64_padding_frames : UInt64
    hns_qpc_position : Int64
    f32_frames_per_second : Float32
    flag : AE_POSITION_FLAGS
  end
  struct AAAccountingData
    user_name : UInt8
    client_name : UInt8
    auth_type : AAAuthSchemes
    resource_name : UInt8
    port_number : Int32
    protocol_name : UInt8
    number_of_bytes_received : Int32
    number_of_bytes_transfered : Int32
    reason_for_disconnect : UInt8
    main_session_id : Guid
    sub_session_id : Int32
  end
  struct WTS_SERVER_INFOW
    p_server_name : LibC::LPWSTR
  end
  struct WTS_SERVER_INFOA
    p_server_name : PSTR
  end
  struct WTS_SESSION_INFOW
    session_id : UInt32
    p_win_station_name : LibC::LPWSTR
    state : WTS_CONNECTSTATE_CLASS
  end
  struct WTS_SESSION_INFOA
    session_id : UInt32
    p_win_station_name : PSTR
    state : WTS_CONNECTSTATE_CLASS
  end
  struct WTS_SESSION_INFO_1W
    exec_env_id : UInt32
    state : WTS_CONNECTSTATE_CLASS
    session_id : UInt32
    p_session_name : LibC::LPWSTR
    p_host_name : LibC::LPWSTR
    p_user_name : LibC::LPWSTR
    p_domain_name : LibC::LPWSTR
    p_farm_name : LibC::LPWSTR
  end
  struct WTS_SESSION_INFO_1A
    exec_env_id : UInt32
    state : WTS_CONNECTSTATE_CLASS
    session_id : UInt32
    p_session_name : PSTR
    p_host_name : PSTR
    p_user_name : PSTR
    p_domain_name : PSTR
    p_farm_name : PSTR
  end
  struct WTS_PROCESS_INFOW
    session_id : UInt32
    process_id : UInt32
    p_process_name : LibC::LPWSTR
    p_user_sid : PSID
  end
  struct WTS_PROCESS_INFOA
    session_id : UInt32
    process_id : UInt32
    p_process_name : PSTR
    p_user_sid : PSID
  end
  struct WTSCONFIGINFOW
    version : UInt32
    f_connect_client_drives_at_logon : UInt32
    f_connect_printer_at_logon : UInt32
    f_disable_printer_redirection : UInt32
    f_disable_default_main_client_printer : UInt32
    shadow_settings : UInt32
    logon_user_name : Char[21]*
    logon_domain : Char[18]*
    work_directory : Char[261]*
    initial_program : Char[261]*
    application_name : Char[261]*
  end
  struct WTSCONFIGINFOA
    version : UInt32
    f_connect_client_drives_at_logon : UInt32
    f_connect_printer_at_logon : UInt32
    f_disable_printer_redirection : UInt32
    f_disable_default_main_client_printer : UInt32
    shadow_settings : UInt32
    logon_user_name : CHAR[21]*
    logon_domain : CHAR[18]*
    work_directory : CHAR[261]*
    initial_program : CHAR[261]*
    application_name : CHAR[261]*
  end
  struct WTSINFOW
    state : WTS_CONNECTSTATE_CLASS
    session_id : UInt32
    incoming_bytes : UInt32
    outgoing_bytes : UInt32
    incoming_frames : UInt32
    outgoing_frames : UInt32
    incoming_compressed_bytes : UInt32
    outgoing_compressed_bytes : UInt32
    win_station_name : Char[32]*
    domain : Char[17]*
    user_name : Char[21]*
    connect_time : LARGE_INTEGER
    disconnect_time : LARGE_INTEGER
    last_input_time : LARGE_INTEGER
    logon_time : LARGE_INTEGER
    current_time : LARGE_INTEGER
  end
  struct WTSINFOA
    state : WTS_CONNECTSTATE_CLASS
    session_id : UInt32
    incoming_bytes : UInt32
    outgoing_bytes : UInt32
    incoming_frames : UInt32
    outgoing_frames : UInt32
    incoming_compressed_bytes : UInt32
    outgoing_compressed_by : UInt32
    win_station_name : CHAR[32]*
    domain : CHAR[17]*
    user_name : CHAR[21]*
    connect_time : LARGE_INTEGER
    disconnect_time : LARGE_INTEGER
    last_input_time : LARGE_INTEGER
    logon_time : LARGE_INTEGER
    current_time : LARGE_INTEGER
  end
  struct WTSINFOEX_LEVEL1_W
    session_id : UInt32
    session_state : WTS_CONNECTSTATE_CLASS
    session_flags : Int32
    win_station_name : Char[33]*
    user_name : Char[21]*
    domain_name : Char[18]*
    logon_time : LARGE_INTEGER
    connect_time : LARGE_INTEGER
    disconnect_time : LARGE_INTEGER
    last_input_time : LARGE_INTEGER
    current_time : LARGE_INTEGER
    incoming_bytes : UInt32
    outgoing_bytes : UInt32
    incoming_frames : UInt32
    outgoing_frames : UInt32
    incoming_compressed_bytes : UInt32
    outgoing_compressed_bytes : UInt32
  end
  struct WTSINFOEX_LEVEL1_A
    session_id : UInt32
    session_state : WTS_CONNECTSTATE_CLASS
    session_flags : Int32
    win_station_name : CHAR[33]*
    user_name : CHAR[21]*
    domain_name : CHAR[18]*
    logon_time : LARGE_INTEGER
    connect_time : LARGE_INTEGER
    disconnect_time : LARGE_INTEGER
    last_input_time : LARGE_INTEGER
    current_time : LARGE_INTEGER
    incoming_bytes : UInt32
    outgoing_bytes : UInt32
    incoming_frames : UInt32
    outgoing_frames : UInt32
    incoming_compressed_bytes : UInt32
    outgoing_compressed_bytes : UInt32
  end
  struct WTSINFOEXW
    level : UInt32
    data : WTSINFOEX_LEVEL_W
  end
  struct WTSINFOEXA
    level : UInt32
    data : WTSINFOEX_LEVEL_A
  end
  struct WTSCLIENTW
    client_name : Char[21]*
    domain : Char[18]*
    user_name : Char[21]*
    work_directory : Char[261]*
    initial_program : Char[261]*
    encryption_level : UInt8
    client_address_family : UInt32
    client_address : UInt16[31]*
    h_res : UInt16
    v_res : UInt16
    color_depth : UInt16
    client_directory : Char[261]*
    client_build_number : UInt32
    client_hardware_id : UInt32
    client_product_id : UInt16
    out_buf_count_host : UInt16
    out_buf_count_client : UInt16
    out_buf_length : UInt16
    device_id : Char[261]*
  end
  struct WTSCLIENTA
    client_name : CHAR[21]*
    domain : CHAR[18]*
    user_name : CHAR[21]*
    work_directory : CHAR[261]*
    initial_program : CHAR[261]*
    encryption_level : UInt8
    client_address_family : UInt32
    client_address : UInt16[31]*
    h_res : UInt16
    v_res : UInt16
    color_depth : UInt16
    client_directory : CHAR[261]*
    client_build_number : UInt32
    client_hardware_id : UInt32
    client_product_id : UInt16
    out_buf_count_host : UInt16
    out_buf_count_client : UInt16
    out_buf_length : UInt16
    device_id : CHAR[261]*
  end
  struct WTS_PRODUCT_INFOA
    company_name : CHAR[256]*
    product_id : CHAR[4]*
  end
  struct WTS_PRODUCT_INFOW
    company_name : Char[256]*
    product_id : Char[4]*
  end
  struct WTS_VALIDATION_INFORMATIONA
    product_info : WTS_PRODUCT_INFOA
    license : UInt8[16384]*
    license_length : UInt32
    hardware_id : UInt8[20]*
    hardware_id_length : UInt32
  end
  struct WTS_VALIDATION_INFORMATIONW
    product_info : WTS_PRODUCT_INFOW
    license : UInt8[16384]*
    license_length : UInt32
    hardware_id : UInt8[20]*
    hardware_id_length : UInt32
  end
  struct WTS_CLIENT_ADDRESS
    address_family : UInt32
    address : UInt8[20]*
  end
  struct WTS_CLIENT_DISPLAY
    horizontal_resolution : UInt32
    vertical_resolution : UInt32
    color_depth : UInt32
  end
  struct WTSUSERCONFIGA
    source : UInt32
    inherit_initial_program : UInt32
    allow_logon_terminal_server : UInt32
    timeout_settings_connections : UInt32
    timeout_settings_disconnections : UInt32
    timeout_settings_idle : UInt32
    device_client_drives : UInt32
    device_client_printers : UInt32
    client_default_printer : UInt32
    broken_timeout_settings : UInt32
    reconnect_settings : UInt32
    shadowing_settings : UInt32
    terminal_server_remote_home_dir : UInt32
    initial_program : CHAR[261]*
    work_directory : CHAR[261]*
    terminal_server_profile_path : CHAR[261]*
    terminal_server_home_dir : CHAR[261]*
    terminal_server_home_dir_drive : CHAR[4]*
  end
  struct WTSUSERCONFIGW
    source : UInt32
    inherit_initial_program : UInt32
    allow_logon_terminal_server : UInt32
    timeout_settings_connections : UInt32
    timeout_settings_disconnections : UInt32
    timeout_settings_idle : UInt32
    device_client_drives : UInt32
    device_client_printers : UInt32
    client_default_printer : UInt32
    broken_timeout_settings : UInt32
    reconnect_settings : UInt32
    shadowing_settings : UInt32
    terminal_server_remote_home_dir : UInt32
    initial_program : Char[261]*
    work_directory : Char[261]*
    terminal_server_profile_path : Char[261]*
    terminal_server_home_dir : Char[261]*
    terminal_server_home_dir_drive : Char[4]*
  end
  struct WTS_SESSION_ADDRESS
    address_family : UInt32
    address : UInt8[20]*
  end
  struct WTS_PROCESS_INFO_EXW
    session_id : UInt32
    process_id : UInt32
    p_process_name : LibC::LPWSTR
    p_user_sid : PSID
    number_of_threads : UInt32
    handle_count : UInt32
    pagefile_usage : UInt32
    peak_pagefile_usage : UInt32
    working_set_size : UInt32
    peak_working_set_size : UInt32
    user_time : LARGE_INTEGER
    kernel_time : LARGE_INTEGER
  end
  struct WTS_PROCESS_INFO_EXA
    session_id : UInt32
    process_id : UInt32
    p_process_name : PSTR
    p_user_sid : PSID
    number_of_threads : UInt32
    handle_count : UInt32
    pagefile_usage : UInt32
    peak_pagefile_usage : UInt32
    working_set_size : UInt32
    peak_working_set_size : UInt32
    user_time : LARGE_INTEGER
    kernel_time : LARGE_INTEGER
  end
  struct WTSLISTENERCONFIGW
    version : UInt32
    f_enable_listener : UInt32
    max_connection_count : UInt32
    f_prompt_for_password : UInt32
    f_inherit_color_depth : UInt32
    color_depth : UInt32
    f_inherit_broken_timeout_settings : UInt32
    broken_timeout_settings : UInt32
    f_disable_printer_redirection : UInt32
    f_disable_drive_redirection : UInt32
    f_disable_com_port_redirection : UInt32
    f_disable_lpt_port_redirection : UInt32
    f_disable_clipboard_redirection : UInt32
    f_disable_audio_redirection : UInt32
    f_disable_pnp_redirection : UInt32
    f_disable_default_main_client_printer : UInt32
    lan_adapter : UInt32
    port_number : UInt32
    f_inherit_shadow_settings : UInt32
    shadow_settings : UInt32
    timeout_settings_connection : UInt32
    timeout_settings_disconnection : UInt32
    timeout_settings_idle : UInt32
    security_layer : UInt32
    min_encryption_level : UInt32
    user_authentication : UInt32
    comment : Char[61]*
    logon_user_name : Char[21]*
    logon_domain : Char[18]*
    work_directory : Char[261]*
    initial_program : Char[261]*
  end
  struct WTSLISTENERCONFIGA
    version : UInt32
    f_enable_listener : UInt32
    max_connection_count : UInt32
    f_prompt_for_password : UInt32
    f_inherit_color_depth : UInt32
    color_depth : UInt32
    f_inherit_broken_timeout_settings : UInt32
    broken_timeout_settings : UInt32
    f_disable_printer_redirection : UInt32
    f_disable_drive_redirection : UInt32
    f_disable_com_port_redirection : UInt32
    f_disable_lpt_port_redirection : UInt32
    f_disable_clipboard_redirection : UInt32
    f_disable_audio_redirection : UInt32
    f_disable_pnp_redirection : UInt32
    f_disable_default_main_client_printer : UInt32
    lan_adapter : UInt32
    port_number : UInt32
    f_inherit_shadow_settings : UInt32
    shadow_settings : UInt32
    timeout_settings_connection : UInt32
    timeout_settings_disconnection : UInt32
    timeout_settings_idle : UInt32
    security_layer : UInt32
    min_encryption_level : UInt32
    user_authentication : UInt32
    comment : CHAR[61]*
    logon_user_name : CHAR[21]*
    logon_domain : CHAR[18]*
    work_directory : CHAR[261]*
    initial_program : CHAR[261]*
  end
  struct WTSSBX_IP_ADDRESS
    address_family : WTSSBX_ADDRESS_FAMILY
    address : UInt8[16]*
    port_number : UInt16
    dw_scope : UInt32
  end
  struct WTSSBX_MACHINE_CONNECT_INFO
    wcz_machine_fqdn : Char[257]*
    wcz_machine_net_bios_name : Char[17]*
    dw_num_of_ip_addr : UInt32
    i_paddr : WTSSBX_IP_ADDRESS[12]*
  end
  struct WTSSBX_MACHINE_INFO
    client_connect_info : WTSSBX_MACHINE_CONNECT_INFO
    wcz_farm_name : Char[257]*
    internal_ip_address : WTSSBX_IP_ADDRESS
    dw_max_sessions_limit : UInt32
    server_weight : UInt32
    single_session_mode : WTSSBX_MACHINE_SESSION_MODE
    in_drain : WTSSBX_MACHINE_DRAIN
    machine_state : WTSSBX_MACHINE_STATE
  end
  struct WTSSBX_SESSION_INFO
    wsz_user_name : Char[105]*
    wsz_domain_name : Char[257]*
    application_type : Char[257]*
    dw_session_id : UInt32
    create_time : FILETIME
    disconnect_time : FILETIME
    session_state : WTSSBX_SESSION_STATE
  end
  struct CHANNEL_DEF
    name : CHAR[8]*
    options : UInt32
  end
  struct CHANNEL_PDU_HEADER
    length : UInt32
    flags : UInt32
  end
  struct CHANNEL_ENTRY_POINTS
    cb_size : UInt32
    protocol_version : UInt32
    p_virtual_channel_init : PVIRTUALCHANNELINIT
    p_virtual_channel_open : PVIRTUALCHANNELOPEN
    p_virtual_channel_close : PVIRTUALCHANNELCLOSE
    p_virtual_channel_write : PVIRTUALCHANNELWRITE
  end
  struct CLIENT_DISPLAY
    horizontal_resolution : UInt32
    vertical_resolution : UInt32
    color_depth : UInt32
  end
  struct TSSD_ConnectionPoint
    server_address_b : UInt8[16]*
    address_type : TSSD_AddrV46Type
    port_number : UInt16
    address_scope : UInt32
  end
  struct VM_NOTIFY_ENTRY
    vm_name : Char[128]*
    vm_host : Char[128]*
  end
  struct VM_PATCH_INFO
    dw_num_entries : UInt32
    p_vm_names : LibC::LPWSTR*
  end
  struct VM_NOTIFY_INFO
    dw_num_entries : UInt32
    pp_vm_entries : VM_NOTIFY_ENTRY**
  end
  struct Pluginresource
    alias : Char[256]*
    name : Char[256]*
    resource_file_contents : LibC::LPWSTR
    file_extension : Char[256]*
    resource_plugin_type : Char[256]*
    is_discoverable : UInt8
    resource_type : Int32
    pce_icon_size : UInt32
    icon_contents : UInt8*
    pce_plugin_blob_size : UInt32
    blob_contents : UInt8*
  end
  struct Pluginresource2fileassociation
    ext_name : Char[256]*
    primary_handler : UInt8
    pce_icon_size : UInt32
    icon_contents : UInt8*
  end
  struct Pluginresource2
    resource_v1 : Pluginresource
    pce_file_assoc_list_size : UInt32
    file_assoc_list : Pluginresource2fileassociation*
    security_descriptor : LibC::LPWSTR
    pce_folder_list_size : UInt32
    folder_list : UInt16**
  end
  struct BITMAP_RENDERER_STATISTICS
    dw_frames_delivered : UInt32
    dw_frames_dropped : UInt32
  end
  struct RFX_GFX_RECT
    left : Int32
    top : Int32
    right : Int32
    bottom : Int32
  end
  struct RFX_GFX_MSG_HEADER
    u_msg_type : UInt16
    cb_size : UInt16
  end
  struct RFX_GFX_MONITOR_INFO
    left : Int32
    top : Int32
    right : Int32
    bottom : Int32
    physical_width : UInt32
    physical_height : UInt32
    orientation : UInt32
    primary : LibC::BOOL
  end
  struct RFX_GFX_MSG_CLIENT_DESKTOP_INFO_REQUEST
    channel_hdr : RFX_GFX_MSG_HEADER
  end
  struct RFX_GFX_MSG_CLIENT_DESKTOP_INFO_RESPONSE
    channel_hdr : RFX_GFX_MSG_HEADER
    reserved : UInt32
    monitor_count : UInt32
    monitor_data : RFX_GFX_MONITOR_INFO[16]*
    client_unique_id : Char[32]*
  end
  struct RFX_GFX_MSG_DESKTOP_CONFIG_CHANGE_NOTIFY
    channel_hdr : RFX_GFX_MSG_HEADER
    ul_width : UInt32
    ul_height : UInt32
    ul_bpp : UInt32
    reserved : UInt32
  end
  struct RFX_GFX_MSG_DESKTOP_CONFIG_CHANGE_CONFIRM
    channel_hdr : RFX_GFX_MSG_HEADER
  end
  struct RFX_GFX_MSG_DESKTOP_INPUT_RESET
    channel_hdr : RFX_GFX_MSG_HEADER
    ul_width : UInt32
    ul_height : UInt32
  end
  struct RFX_GFX_MSG_DISCONNECT_NOTIFY
    channel_hdr : RFX_GFX_MSG_HEADER
    disconnect_reason : UInt32
  end
  struct RFX_GFX_MSG_DESKTOP_RESEND_REQUEST
    channel_hdr : RFX_GFX_MSG_HEADER
    redraw_rect : RFX_GFX_RECT
  end
  struct RFX_GFX_MSG_RDP_DATA
    channel_hdr : RFX_GFX_MSG_HEADER
    rdp_data : UInt8[0]*
  end
  struct WTS_SOCKADDR
    sin_family : UInt16
    u : WTS_SOCKADDR_u_e__Union
  end
  struct WTS_SOCKADDR_u_e__Union_ipv6_e__Struct
    sin6_port : UInt16
    sin6_flowinfo : UInt32
    sin6_addr : UInt16[8]*
    sin6_scope_id : UInt32
  end
  struct WTS_SOCKADDR_u_e__Union_ipv4_e__Struct
    sin_port : UInt16
    in_addr : UInt32
    sin_zero : UInt8[8]*
  end
  struct WTS_SMALL_RECT
    left : Int16
    top : Int16
    right : Int16
    bottom : Int16
  end
  struct WTS_SERVICE_STATE
    rcm_service_state : WTS_RCM_SERVICE_STATE
    rcm_drain_state : WTS_RCM_DRAIN_STATE
  end
  struct WTS_SESSION_ID
    session_unique_guid : Guid
    session_id : UInt32
  end
  struct WTS_USER_CREDENTIAL
    user_name : Char[256]*
    password : Char[256]*
    domain : Char[256]*
  end
  struct WTS_SYSTEMTIME
    w_year : UInt16
    w_month : UInt16
    w_day_of_week : UInt16
    w_day : UInt16
    w_hour : UInt16
    w_minute : UInt16
    w_second : UInt16
    w_milliseconds : UInt16
  end
  struct WTS_TIME_ZONE_INFORMATION
    bias : Int32
    standard_name : Char[32]*
    standard_date : WTS_SYSTEMTIME
    standard_bias : Int32
    daylight_name : Char[32]*
    daylight_date : WTS_SYSTEMTIME
    daylight_bias : Int32
  end
  struct WRDS_DYNAMIC_TIME_ZONE_INFORMATION
    bias : Int32
    standard_name : Char[32]*
    standard_date : WTS_SYSTEMTIME
    standard_bias : Int32
    daylight_name : Char[32]*
    daylight_date : WTS_SYSTEMTIME
    daylight_bias : Int32
    time_zone_key_name : Char[128]*
    dynamic_daylight_time_disabled : UInt16
  end
  struct WTS_CLIENT_DATA
    f_disable_ctrl_alt_del : BOOLEAN
    f_double_click_detect : BOOLEAN
    f_enable_windows_key : BOOLEAN
    f_hide_title_bar : BOOLEAN
    f_inherit_auto_logon : LibC::BOOL
    f_prompt_for_password : BOOLEAN
    f_using_saved_creds : BOOLEAN
    domain : Char[256]*
    user_name : Char[256]*
    password : Char[256]*
    f_password_is_sc_pin : BOOLEAN
    f_inherit_initial_program : LibC::BOOL
    work_directory : Char[257]*
    initial_program : Char[257]*
    f_maximize_shell : BOOLEAN
    encryption_level : UInt8
    performance_flags : UInt32
    protocol_name : Char[9]*
    protocol_type : UInt16
    f_inherit_color_depth : LibC::BOOL
    h_res : UInt16
    v_res : UInt16
    color_depth : UInt16
    display_driver_name : Char[9]*
    display_device_name : Char[20]*
    f_mouse : BOOLEAN
    keyboard_layout : UInt32
    keyboard_type : UInt32
    keyboard_sub_type : UInt32
    keyboard_function_key : UInt32
    ime_file_name : Char[33]*
    active_input_locale : UInt32
    f_no_audio_playback : BOOLEAN
    f_remote_console_audio : BOOLEAN
    audio_driver_name : Char[9]*
    client_time_zone : WTS_TIME_ZONE_INFORMATION
    client_name : Char[21]*
    serial_number : UInt32
    client_address_family : UInt32
    client_address : Char[31]*
    client_sock_address : WTS_SOCKADDR
    client_directory : Char[257]*
    client_build_number : UInt32
    client_product_id : UInt16
    out_buf_count_host : UInt16
    out_buf_count_client : UInt16
    out_buf_length : UInt16
    client_session_id : UInt32
    client_dig_product_id : Char[33]*
    f_disable_cpm : BOOLEAN
    f_disable_cdm : BOOLEAN
    f_disable_ccm : BOOLEAN
    f_disable_lpt : BOOLEAN
    f_disable_clip : BOOLEAN
    f_disable_pnp : BOOLEAN
  end
  struct WTS_USER_DATA
    work_directory : Char[257]*
    initial_program : Char[257]*
    user_time_zone : WTS_TIME_ZONE_INFORMATION
  end
  struct WTS_POLICY_DATA
    f_disable_encryption : BOOLEAN
    f_disable_auto_reconnect : BOOLEAN
    color_depth : UInt32
    min_encryption_level : UInt8
    f_disable_cpm : BOOLEAN
    f_disable_cdm : BOOLEAN
    f_disable_ccm : BOOLEAN
    f_disable_lpt : BOOLEAN
    f_disable_clip : BOOLEAN
    f_disable_pnp_redir : BOOLEAN
  end
  struct WTS_PROTOCOL_CACHE
    cache_reads : UInt32
    cache_hits : UInt32
  end
  struct WTS_CACHE_STATS
    specific : UInt32
    data : WTS_CACHE_STATS_UN
    protocol_type : UInt16
    length : UInt16
  end
  struct WTS_PROTOCOL_COUNTERS
    wd_bytes : UInt32
    wd_frames : UInt32
    wait_for_out_buf : UInt32
    frames : UInt32
    bytes : UInt32
    compressed_bytes : UInt32
    compress_flushes : UInt32
    errors : UInt32
    timeouts : UInt32
    async_framing_error : UInt32
    async_overrun_error : UInt32
    async_overflow_error : UInt32
    async_parity_error : UInt32
    td_errors : UInt32
    protocol_type : UInt16
    length : UInt16
    specific : UInt16
    reserved : UInt32[100]*
  end
  struct WTS_PROTOCOL_STATUS
    output : WTS_PROTOCOL_COUNTERS
    input : WTS_PROTOCOL_COUNTERS
    cache : WTS_CACHE_STATS
    async_signal : UInt32
    async_signal_mask : UInt32
    counters : LARGE_INTEGER[100]*
  end
  struct WTS_DISPLAY_IOCTL
    p_display_io_ctl_data : UInt8[256]*
    cb_display_io_ctl_data : UInt32
  end
  struct WTS_PROPERTY_VALUE
    type : UInt16
    u : WTS_PROPERTY_VALUE_u_e__Union
  end
  struct WTS_PROPERTY_VALUE_u_e__Union_bVal_e__Struct
    size : UInt32
    pb_val : PSTR
  end
  struct WTS_PROPERTY_VALUE_u_e__Union_strVal_e__Struct
    size : UInt32
    pstr_val : LibC::LPWSTR
  end
  struct WTS_LICENSE_CAPABILITIES
    key_exchange_alg : UInt32
    protocol_ver : UInt32
    f_authenticate_server : LibC::BOOL
    cert_type : WTS_CERT_TYPE
    cb_client_name : UInt32
    rgb_client_name : UInt8[42]*
  end
  struct WRDS_LISTENER_SETTINGS_1
    max_protocol_listener_connection_count : UInt32
    security_descriptor_size : UInt32
    p_security_descriptor : UInt8*
  end
  struct WRDS_LISTENER_SETTINGS
    w_rds_listener_setting_level : WRDS_LISTENER_SETTING_LEVEL
    w_rds_listener_setting : WRDS_LISTENER_SETTING
  end
  struct WRDS_CONNECTION_SETTINGS_1
    f_inherit_initial_program : BOOLEAN
    f_inherit_color_depth : BOOLEAN
    f_hide_title_bar : BOOLEAN
    f_inherit_auto_logon : BOOLEAN
    f_maximize_shell : BOOLEAN
    f_disable_pnp : BOOLEAN
    f_password_is_sc_pin : BOOLEAN
    f_prompt_for_password : BOOLEAN
    f_disable_cpm : BOOLEAN
    f_disable_cdm : BOOLEAN
    f_disable_ccm : BOOLEAN
    f_disable_lpt : BOOLEAN
    f_disable_clip : BOOLEAN
    f_reset_broken : BOOLEAN
    f_disable_encryption : BOOLEAN
    f_disable_auto_reconnect : BOOLEAN
    f_disable_ctrl_alt_del : BOOLEAN
    f_double_click_detect : BOOLEAN
    f_enable_windows_key : BOOLEAN
    f_using_saved_creds : BOOLEAN
    f_mouse : BOOLEAN
    f_no_audio_playback : BOOLEAN
    f_remote_console_audio : BOOLEAN
    encryption_level : UInt8
    color_depth : UInt16
    protocol_type : UInt16
    h_res : UInt16
    v_res : UInt16
    client_product_id : UInt16
    out_buf_count_host : UInt16
    out_buf_count_client : UInt16
    out_buf_length : UInt16
    keyboard_layout : UInt32
    max_connection_time : UInt32
    max_disconnection_time : UInt32
    max_idle_time : UInt32
    performance_flags : UInt32
    keyboard_type : UInt32
    keyboard_sub_type : UInt32
    keyboard_function_key : UInt32
    active_input_locale : UInt32
    serial_number : UInt32
    client_address_family : UInt32
    client_build_number : UInt32
    client_session_id : UInt32
    work_directory : Char[257]*
    initial_program : Char[257]*
    user_name : Char[256]*
    domain : Char[256]*
    password : Char[256]*
    protocol_name : Char[9]*
    display_driver_name : Char[9]*
    display_device_name : Char[20]*
    ime_file_name : Char[33]*
    audio_driver_name : Char[9]*
    client_name : Char[21]*
    client_address : Char[31]*
    client_directory : Char[257]*
    client_dig_product_id : Char[33]*
    client_sock_address : WTS_SOCKADDR
    client_time_zone : WTS_TIME_ZONE_INFORMATION
    w_rds_listener_settings : WRDS_LISTENER_SETTINGS
    event_log_activity_id : Guid
    context_size : UInt32
    context_data : UInt8*
  end
  struct WRDS_SETTINGS_1
    w_rds_disable_clip_status : WRDS_SETTING_STATUS
    w_rds_disable_clip_value : UInt32
    w_rds_disable_lpt_status : WRDS_SETTING_STATUS
    w_rds_disable_lpt_value : UInt32
    w_rds_disable_ccm_status : WRDS_SETTING_STATUS
    w_rds_disable_ccm_value : UInt32
    w_rds_disable_cdm_status : WRDS_SETTING_STATUS
    w_rds_disable_cdm_value : UInt32
    w_rds_disable_cpm_status : WRDS_SETTING_STATUS
    w_rds_disable_cpm_value : UInt32
    w_rds_disable_pnp_status : WRDS_SETTING_STATUS
    w_rds_disable_pnp_value : UInt32
    w_rds_encryption_level_status : WRDS_SETTING_STATUS
    w_rds_encryption_value : UInt32
    w_rds_color_depth_status : WRDS_SETTING_STATUS
    w_rds_color_depth_value : UInt32
    w_rds_disable_auto_reconnecet_status : WRDS_SETTING_STATUS
    w_rds_disable_auto_reconnecet_value : UInt32
    w_rds_disable_encryption_status : WRDS_SETTING_STATUS
    w_rds_disable_encryption_value : UInt32
    w_rds_reset_broken_status : WRDS_SETTING_STATUS
    w_rds_reset_broken_value : UInt32
    w_rds_max_idle_time_status : WRDS_SETTING_STATUS
    w_rds_max_idle_time_value : UInt32
    w_rds_max_disconnect_time_status : WRDS_SETTING_STATUS
    w_rds_max_disconnect_time_value : UInt32
    w_rds_max_connect_time_status : WRDS_SETTING_STATUS
    w_rds_max_connect_time_value : UInt32
    w_rds_keep_alive_status : WRDS_SETTING_STATUS
    w_rds_keep_alive_start_value : BOOLEAN
    w_rds_keep_alive_interval_value : UInt32
  end
  struct WRDS_CONNECTION_SETTINGS
    w_rds_connection_setting_level : WRDS_CONNECTION_SETTING_LEVEL
    w_rds_connection_setting : WRDS_CONNECTION_SETTING
  end
  struct WRDS_SETTINGS
    w_rds_setting_type : WRDS_SETTING_TYPE
    w_rds_setting_level : WRDS_SETTING_LEVEL
    w_rds_setting : WRDS_SETTING
  end
  struct WTSSESSION_NOTIFICATION
    cb_size : UInt32
    dw_session_id : UInt32
  end


  struct IAudioEndpointVTbl
    query_interface : Proc(IAudioEndpoint*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpoint*, UInt32)
    release : Proc(IAudioEndpoint*, UInt32)
    get_frame_format : Proc(IAudioEndpoint*, WAVEFORMATEX**, HRESULT)
    get_frames_per_packet : Proc(IAudioEndpoint*, UInt32*, HRESULT)
    get_latency : Proc(IAudioEndpoint*, Int64*, HRESULT)
    set_stream_flags : Proc(IAudioEndpoint*, UInt32, HRESULT)
    set_event_handle : Proc(IAudioEndpoint*, LibC::HANDLE, HRESULT)
  end

  struct IAudioEndpoint
    lpVtbl : IAudioEndpointVTbl*
  end

  struct IAudioEndpointRTVTbl
    query_interface : Proc(IAudioEndpointRT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointRT*, UInt32)
    release : Proc(IAudioEndpointRT*, UInt32)
    get_current_padding : Proc(IAudioEndpointRT*, Int64*, AE_CURRENT_POSITION*, Void)
    processing_complete : Proc(IAudioEndpointRT*, Void)
    set_pin_inactive : Proc(IAudioEndpointRT*, HRESULT)
    set_pin_active : Proc(IAudioEndpointRT*, HRESULT)
  end

  struct IAudioEndpointRT
    lpVtbl : IAudioEndpointRTVTbl*
  end

  struct IAudioInputEndpointRTVTbl
    query_interface : Proc(IAudioInputEndpointRT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioInputEndpointRT*, UInt32)
    release : Proc(IAudioInputEndpointRT*, UInt32)
    get_input_data_pointer : Proc(IAudioInputEndpointRT*, APO_CONNECTION_PROPERTY*, AE_CURRENT_POSITION*, Void)
    release_input_data_pointer : Proc(IAudioInputEndpointRT*, UInt32, LibC::UINT_PTR, Void)
    pulse_endpoint : Proc(IAudioInputEndpointRT*, Void)
  end

  struct IAudioInputEndpointRT
    lpVtbl : IAudioInputEndpointRTVTbl*
  end

  struct IAudioOutputEndpointRTVTbl
    query_interface : Proc(IAudioOutputEndpointRT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioOutputEndpointRT*, UInt32)
    release : Proc(IAudioOutputEndpointRT*, UInt32)
    get_output_data_pointer : Proc(IAudioOutputEndpointRT*, UInt32, AE_CURRENT_POSITION*, LibC::UINT_PTR)
    release_output_data_pointer : Proc(IAudioOutputEndpointRT*, APO_CONNECTION_PROPERTY*, Void)
    pulse_endpoint : Proc(IAudioOutputEndpointRT*, Void)
  end

  struct IAudioOutputEndpointRT
    lpVtbl : IAudioOutputEndpointRTVTbl*
  end

  struct IAudioDeviceEndpointVTbl
    query_interface : Proc(IAudioDeviceEndpoint*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioDeviceEndpoint*, UInt32)
    release : Proc(IAudioDeviceEndpoint*, UInt32)
    set_buffer : Proc(IAudioDeviceEndpoint*, Int64, UInt32, HRESULT)
    get_rt_caps : Proc(IAudioDeviceEndpoint*, LibC::BOOL*, HRESULT)
    get_event_driven_capable : Proc(IAudioDeviceEndpoint*, LibC::BOOL*, HRESULT)
    write_exclusive_mode_parameters_to_shared_memory : Proc(IAudioDeviceEndpoint*, LibC::UINT_PTR, Int64, Int64, UInt32, UInt32*, LibC::UINT_PTR*, HRESULT)
  end

  struct IAudioDeviceEndpoint
    lpVtbl : IAudioDeviceEndpointVTbl*
  end

  struct IAudioEndpointControlVTbl
    query_interface : Proc(IAudioEndpointControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointControl*, UInt32)
    release : Proc(IAudioEndpointControl*, UInt32)
    start : Proc(IAudioEndpointControl*, HRESULT)
    reset : Proc(IAudioEndpointControl*, HRESULT)
    stop : Proc(IAudioEndpointControl*, HRESULT)
  end

  struct IAudioEndpointControl
    lpVtbl : IAudioEndpointControlVTbl*
  end

  struct IADsTSUserExVTbl
    query_interface : Proc(IADsTSUserEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IADsTSUserEx*, UInt32)
    release : Proc(IADsTSUserEx*, UInt32)
    get_type_info_count : Proc(IADsTSUserEx*, UInt32*, HRESULT)
    get_type_info : Proc(IADsTSUserEx*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IADsTSUserEx*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IADsTSUserEx*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_terminal_services_profile_path : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    put_terminal_services_profile_path : Proc(IADsTSUserEx*, UInt8, HRESULT)
    get_terminal_services_home_directory : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    put_terminal_services_home_directory : Proc(IADsTSUserEx*, UInt8, HRESULT)
    get_terminal_services_home_drive : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    put_terminal_services_home_drive : Proc(IADsTSUserEx*, UInt8, HRESULT)
    get_allow_logon : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_allow_logon : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_enable_remote_control : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_enable_remote_control : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_max_disconnection_time : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_max_disconnection_time : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_max_connection_time : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_max_connection_time : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_max_idle_time : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_max_idle_time : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_reconnection_action : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_reconnection_action : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_broken_connection_action : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_broken_connection_action : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_connect_client_drives_at_logon : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_connect_client_drives_at_logon : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_connect_client_printers_at_logon : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_connect_client_printers_at_logon : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_default_to_main_printer : Proc(IADsTSUserEx*, Int32*, HRESULT)
    put_default_to_main_printer : Proc(IADsTSUserEx*, Int32, HRESULT)
    get_terminal_services_work_directory : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    put_terminal_services_work_directory : Proc(IADsTSUserEx*, UInt8, HRESULT)
    get_terminal_services_initial_program : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    put_terminal_services_initial_program : Proc(IADsTSUserEx*, UInt8, HRESULT)
  end

  struct IADsTSUserEx
    lpVtbl : IADsTSUserExVTbl*
  end

  struct ITSGAuthorizeConnectionSinkVTbl
    query_interface : Proc(ITSGAuthorizeConnectionSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAuthorizeConnectionSink*, UInt32)
    release : Proc(ITSGAuthorizeConnectionSink*, UInt32)
    on_connection_authorized : Proc(ITSGAuthorizeConnectionSink*, HRESULT, Guid, UInt32, UInt8*, UInt32, UInt32, SESSION_TIMEOUT_ACTION_TYPE, AATrustClassID, UInt32*, HRESULT)
  end

  struct ITSGAuthorizeConnectionSink
    lpVtbl : ITSGAuthorizeConnectionSinkVTbl*
  end

  struct ITSGAuthorizeResourceSinkVTbl
    query_interface : Proc(ITSGAuthorizeResourceSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAuthorizeResourceSink*, UInt32)
    release : Proc(ITSGAuthorizeResourceSink*, UInt32)
    on_channel_authorized : Proc(ITSGAuthorizeResourceSink*, HRESULT, Guid, Int32, UInt8*, UInt32, UInt8*, UInt32, HRESULT)
  end

  struct ITSGAuthorizeResourceSink
    lpVtbl : ITSGAuthorizeResourceSinkVTbl*
  end

  struct ITSGPolicyEngineVTbl
    query_interface : Proc(ITSGPolicyEngine*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGPolicyEngine*, UInt32)
    release : Proc(ITSGPolicyEngine*, UInt32)
    authorize_connection : Proc(ITSGPolicyEngine*, Guid, UInt8, AAAuthSchemes, UInt8, UInt8, UInt8*, UInt32, UInt8*, UInt32, HANDLE_PTR, ITSGAuthorizeConnectionSink, HRESULT)
    authorize_resource : Proc(ITSGPolicyEngine*, Guid, Int32, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt32, UInt8, UInt8*, UInt32, ITSGAuthorizeResourceSink, HRESULT)
    refresh : Proc(ITSGPolicyEngine*, HRESULT)
    is_quarantine_enabled : Proc(ITSGPolicyEngine*, LibC::BOOL*, HRESULT)
  end

  struct ITSGPolicyEngine
    lpVtbl : ITSGPolicyEngineVTbl*
  end

  struct ITSGAccountingEngineVTbl
    query_interface : Proc(ITSGAccountingEngine*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAccountingEngine*, UInt32)
    release : Proc(ITSGAccountingEngine*, UInt32)
    do_accounting : Proc(ITSGAccountingEngine*, AAAccountingDataType, AAAccountingData, HRESULT)
  end

  struct ITSGAccountingEngine
    lpVtbl : ITSGAccountingEngineVTbl*
  end

  struct ITSGAuthenticateUserSinkVTbl
    query_interface : Proc(ITSGAuthenticateUserSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAuthenticateUserSink*, UInt32)
    release : Proc(ITSGAuthenticateUserSink*, UInt32)
    on_user_authenticated : Proc(ITSGAuthenticateUserSink*, UInt8, UInt8, LibC::UINT_PTR, HANDLE_PTR, HRESULT)
    on_user_authentication_failed : Proc(ITSGAuthenticateUserSink*, LibC::UINT_PTR, HRESULT, HRESULT, HRESULT)
    reauthenticate_user : Proc(ITSGAuthenticateUserSink*, LibC::UINT_PTR, HRESULT)
    disconnect_user : Proc(ITSGAuthenticateUserSink*, LibC::UINT_PTR, HRESULT)
  end

  struct ITSGAuthenticateUserSink
    lpVtbl : ITSGAuthenticateUserSinkVTbl*
  end

  struct ITSGAuthenticationEngineVTbl
    query_interface : Proc(ITSGAuthenticationEngine*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAuthenticationEngine*, UInt32)
    release : Proc(ITSGAuthenticationEngine*, UInt32)
    authenticate_user : Proc(ITSGAuthenticationEngine*, Guid, UInt8*, UInt32, LibC::UINT_PTR, ITSGAuthenticateUserSink, HRESULT)
    cancel_authentication : Proc(ITSGAuthenticationEngine*, Guid, LibC::UINT_PTR, HRESULT)
  end

  struct ITSGAuthenticationEngine
    lpVtbl : ITSGAuthenticationEngineVTbl*
  end

  struct IWTSSBPluginVTbl
    query_interface : Proc(IWTSSBPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSSBPlugin*, UInt32)
    release : Proc(IWTSSBPlugin*, UInt32)
    initialize : Proc(IWTSSBPlugin*, UInt32*, HRESULT)
    wtssbx_machine_change_notification : Proc(IWTSSBPlugin*, WTSSBX_NOTIFICATION_TYPE, Int32, WTSSBX_MACHINE_INFO*, HRESULT)
    wtssbx_session_change_notification : Proc(IWTSSBPlugin*, WTSSBX_NOTIFICATION_TYPE, Int32, UInt32, WTSSBX_SESSION_INFO*, HRESULT)
    wtssbx_get_most_suitable_server : Proc(IWTSSBPlugin*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, Int32*, HRESULT)
    terminated : Proc(IWTSSBPlugin*, HRESULT)
    wtssbx_get_user_external_session : Proc(IWTSSBPlugin*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, WTSSBX_IP_ADDRESS*, UInt32*, WTSSBX_MACHINE_CONNECT_INFO*, HRESULT)
  end

  struct IWTSSBPlugin
    lpVtbl : IWTSSBPluginVTbl*
  end

  struct IWorkspaceClientExtVTbl
    query_interface : Proc(IWorkspaceClientExt*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceClientExt*, UInt32)
    release : Proc(IWorkspaceClientExt*, UInt32)
    get_resource_id : Proc(IWorkspaceClientExt*, UInt8*, HRESULT)
    get_resource_display_name : Proc(IWorkspaceClientExt*, UInt8*, HRESULT)
    issue_disconnect : Proc(IWorkspaceClientExt*, HRESULT)
  end

  struct IWorkspaceClientExt
    lpVtbl : IWorkspaceClientExtVTbl*
  end

  struct IWorkspaceVTbl
    query_interface : Proc(IWorkspace*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspace*, UInt32)
    release : Proc(IWorkspace*, UInt32)
    get_workspace_names : Proc(IWorkspace*, SAFEARRAY**, HRESULT)
    start_remote_application : Proc(IWorkspace*, UInt8, SAFEARRAY*, HRESULT)
    get_process_id : Proc(IWorkspace*, UInt32*, HRESULT)
  end

  struct IWorkspace
    lpVtbl : IWorkspaceVTbl*
  end

  struct IWorkspace2VTbl
    query_interface : Proc(IWorkspace2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspace2*, UInt32)
    release : Proc(IWorkspace2*, UInt32)
    get_workspace_names : Proc(IWorkspace2*, SAFEARRAY**, HRESULT)
    start_remote_application : Proc(IWorkspace2*, UInt8, SAFEARRAY*, HRESULT)
    get_process_id : Proc(IWorkspace2*, UInt32*, HRESULT)
    start_remote_application_ex : Proc(IWorkspace2*, UInt8, UInt8, UInt8, Int16, UInt8, SAFEARRAY*, HRESULT)
  end

  struct IWorkspace2
    lpVtbl : IWorkspace2VTbl*
  end

  struct IWorkspace3VTbl
    query_interface : Proc(IWorkspace3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspace3*, UInt32)
    release : Proc(IWorkspace3*, UInt32)
    get_workspace_names : Proc(IWorkspace3*, SAFEARRAY**, HRESULT)
    start_remote_application : Proc(IWorkspace3*, UInt8, SAFEARRAY*, HRESULT)
    get_process_id : Proc(IWorkspace3*, UInt32*, HRESULT)
    start_remote_application_ex : Proc(IWorkspace3*, UInt8, UInt8, UInt8, Int16, UInt8, SAFEARRAY*, HRESULT)
    get_claims_token2 : Proc(IWorkspace3*, UInt8, UInt8, UInt32, UInt32, RECT, UInt8*, HRESULT)
    set_claims_token : Proc(IWorkspace3*, UInt8, UInt64, UInt8, HRESULT)
  end

  struct IWorkspace3
    lpVtbl : IWorkspace3VTbl*
  end

  struct IWorkspaceRegistrationVTbl
    query_interface : Proc(IWorkspaceRegistration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceRegistration*, UInt32)
    release : Proc(IWorkspaceRegistration*, UInt32)
    add_resource : Proc(IWorkspaceRegistration*, IWorkspaceClientExt, UInt32*, HRESULT)
    remove_resource : Proc(IWorkspaceRegistration*, UInt32, HRESULT)
  end

  struct IWorkspaceRegistration
    lpVtbl : IWorkspaceRegistrationVTbl*
  end

  struct IWorkspaceRegistration2VTbl
    query_interface : Proc(IWorkspaceRegistration2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceRegistration2*, UInt32)
    release : Proc(IWorkspaceRegistration2*, UInt32)
    add_resource : Proc(IWorkspaceRegistration2*, IWorkspaceClientExt, UInt32*, HRESULT)
    remove_resource : Proc(IWorkspaceRegistration2*, UInt32, HRESULT)
    add_resource_ex : Proc(IWorkspaceRegistration2*, IWorkspaceClientExt, UInt8, UInt32*, Guid, HRESULT)
    remove_resource_ex : Proc(IWorkspaceRegistration2*, UInt32, Guid, HRESULT)
  end

  struct IWorkspaceRegistration2
    lpVtbl : IWorkspaceRegistration2VTbl*
  end

  struct IWorkspaceScriptableVTbl
    query_interface : Proc(IWorkspaceScriptable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceScriptable*, UInt32)
    release : Proc(IWorkspaceScriptable*, UInt32)
    get_type_info_count : Proc(IWorkspaceScriptable*, UInt32*, HRESULT)
    get_type_info : Proc(IWorkspaceScriptable*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWorkspaceScriptable*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWorkspaceScriptable*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    disconnect_workspace : Proc(IWorkspaceScriptable*, UInt8, HRESULT)
    start_workspace : Proc(IWorkspaceScriptable*, UInt8, UInt8, UInt8, UInt8, Int32, Int32, HRESULT)
    is_workspace_credential_specified : Proc(IWorkspaceScriptable*, UInt8, Int16, Int16*, HRESULT)
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable*, Int16*, HRESULT)
    clear_workspace_credential : Proc(IWorkspaceScriptable*, UInt8, HRESULT)
    on_authenticated : Proc(IWorkspaceScriptable*, UInt8, UInt8, HRESULT)
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable*, UInt8, HRESULT)
  end

  struct IWorkspaceScriptable
    lpVtbl : IWorkspaceScriptableVTbl*
  end

  struct IWorkspaceScriptable2VTbl
    query_interface : Proc(IWorkspaceScriptable2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceScriptable2*, UInt32)
    release : Proc(IWorkspaceScriptable2*, UInt32)
    get_type_info_count : Proc(IWorkspaceScriptable2*, UInt32*, HRESULT)
    get_type_info : Proc(IWorkspaceScriptable2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWorkspaceScriptable2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWorkspaceScriptable2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    disconnect_workspace : Proc(IWorkspaceScriptable2*, UInt8, HRESULT)
    start_workspace : Proc(IWorkspaceScriptable2*, UInt8, UInt8, UInt8, UInt8, Int32, Int32, HRESULT)
    is_workspace_credential_specified : Proc(IWorkspaceScriptable2*, UInt8, Int16, Int16*, HRESULT)
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable2*, Int16*, HRESULT)
    clear_workspace_credential : Proc(IWorkspaceScriptable2*, UInt8, HRESULT)
    on_authenticated : Proc(IWorkspaceScriptable2*, UInt8, UInt8, HRESULT)
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable2*, UInt8, HRESULT)
    start_workspace_ex : Proc(IWorkspaceScriptable2*, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, Int32, Int32, HRESULT)
    resource_dismissed : Proc(IWorkspaceScriptable2*, UInt8, UInt8, HRESULT)
  end

  struct IWorkspaceScriptable2
    lpVtbl : IWorkspaceScriptable2VTbl*
  end

  struct IWorkspaceScriptable3VTbl
    query_interface : Proc(IWorkspaceScriptable3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceScriptable3*, UInt32)
    release : Proc(IWorkspaceScriptable3*, UInt32)
    get_type_info_count : Proc(IWorkspaceScriptable3*, UInt32*, HRESULT)
    get_type_info : Proc(IWorkspaceScriptable3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWorkspaceScriptable3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWorkspaceScriptable3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    disconnect_workspace : Proc(IWorkspaceScriptable3*, UInt8, HRESULT)
    start_workspace : Proc(IWorkspaceScriptable3*, UInt8, UInt8, UInt8, UInt8, Int32, Int32, HRESULT)
    is_workspace_credential_specified : Proc(IWorkspaceScriptable3*, UInt8, Int16, Int16*, HRESULT)
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable3*, Int16*, HRESULT)
    clear_workspace_credential : Proc(IWorkspaceScriptable3*, UInt8, HRESULT)
    on_authenticated : Proc(IWorkspaceScriptable3*, UInt8, UInt8, HRESULT)
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable3*, UInt8, HRESULT)
    start_workspace_ex : Proc(IWorkspaceScriptable3*, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, Int32, Int32, HRESULT)
    resource_dismissed : Proc(IWorkspaceScriptable3*, UInt8, UInt8, HRESULT)
    start_workspace_ex2 : Proc(IWorkspaceScriptable3*, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, Int32, Int32, UInt8, Guid, HRESULT)
  end

  struct IWorkspaceScriptable3
    lpVtbl : IWorkspaceScriptable3VTbl*
  end

  struct IWorkspaceReportMessageVTbl
    query_interface : Proc(IWorkspaceReportMessage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceReportMessage*, UInt32)
    release : Proc(IWorkspaceReportMessage*, UInt32)
    register_error_log_message : Proc(IWorkspaceReportMessage*, UInt8, HRESULT)
    is_error_message_registered : Proc(IWorkspaceReportMessage*, UInt8, UInt32, UInt8, UInt32, Int16*, HRESULT)
    register_error_event : Proc(IWorkspaceReportMessage*, UInt8, UInt32, UInt8, UInt32, HRESULT)
  end

  struct IWorkspaceReportMessage
    lpVtbl : IWorkspaceReportMessageVTbl*
  end

  struct ITSWkspEventsVTbl
    query_interface : Proc(ITSWkspEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSWkspEvents*, UInt32)
    release : Proc(ITSWkspEvents*, UInt32)
    get_type_info_count : Proc(ITSWkspEvents*, UInt32*, HRESULT)
    get_type_info : Proc(ITSWkspEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITSWkspEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITSWkspEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct ITSWkspEvents
    lpVtbl : ITSWkspEventsVTbl*
  end

  struct ITsSbPluginVTbl
    query_interface : Proc(ITsSbPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbPlugin*, UInt32)
    release : Proc(ITsSbPlugin*, UInt32)
    initialize : Proc(ITsSbPlugin*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbPlugin*, HRESULT, HRESULT)
  end

  struct ITsSbPlugin
    lpVtbl : ITsSbPluginVTbl*
  end

  struct ITsSbResourcePluginVTbl
    query_interface : Proc(ITsSbResourcePlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbResourcePlugin*, UInt32)
    release : Proc(ITsSbResourcePlugin*, UInt32)
    initialize : Proc(ITsSbResourcePlugin*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbResourcePlugin*, HRESULT, HRESULT)
  end

  struct ITsSbResourcePlugin
    lpVtbl : ITsSbResourcePluginVTbl*
  end

  struct ITsSbServiceNotificationVTbl
    query_interface : Proc(ITsSbServiceNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbServiceNotification*, UInt32)
    release : Proc(ITsSbServiceNotification*, UInt32)
    notify_service_failure : Proc(ITsSbServiceNotification*, HRESULT)
    notify_service_success : Proc(ITsSbServiceNotification*, HRESULT)
  end

  struct ITsSbServiceNotification
    lpVtbl : ITsSbServiceNotificationVTbl*
  end

  struct ITsSbLoadBalancingVTbl
    query_interface : Proc(ITsSbLoadBalancing*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbLoadBalancing*, UInt32)
    release : Proc(ITsSbLoadBalancing*, UInt32)
    initialize : Proc(ITsSbLoadBalancing*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbLoadBalancing*, HRESULT, HRESULT)
    get_most_suitable_target : Proc(ITsSbLoadBalancing*, ITsSbClientConnection, ITsSbLoadBalancingNotifySink, HRESULT)
  end

  struct ITsSbLoadBalancing
    lpVtbl : ITsSbLoadBalancingVTbl*
  end

  struct ITsSbPlacementVTbl
    query_interface : Proc(ITsSbPlacement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbPlacement*, UInt32)
    release : Proc(ITsSbPlacement*, UInt32)
    initialize : Proc(ITsSbPlacement*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbPlacement*, HRESULT, HRESULT)
    query_environment_for_target : Proc(ITsSbPlacement*, ITsSbClientConnection, ITsSbPlacementNotifySink, HRESULT)
  end

  struct ITsSbPlacement
    lpVtbl : ITsSbPlacementVTbl*
  end

  struct ITsSbOrchestrationVTbl
    query_interface : Proc(ITsSbOrchestration*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbOrchestration*, UInt32)
    release : Proc(ITsSbOrchestration*, UInt32)
    initialize : Proc(ITsSbOrchestration*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbOrchestration*, HRESULT, HRESULT)
    prepare_target_for_connect : Proc(ITsSbOrchestration*, ITsSbClientConnection, ITsSbOrchestrationNotifySink, HRESULT)
  end

  struct ITsSbOrchestration
    lpVtbl : ITsSbOrchestrationVTbl*
  end

  struct ITsSbEnvironmentVTbl
    query_interface : Proc(ITsSbEnvironment*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbEnvironment*, UInt32)
    release : Proc(ITsSbEnvironment*, UInt32)
    get_name : Proc(ITsSbEnvironment*, UInt8*, HRESULT)
    get_server_weight : Proc(ITsSbEnvironment*, UInt32*, HRESULT)
    get_environment_property_set : Proc(ITsSbEnvironment*, ITsSbEnvironmentPropertySet*, HRESULT)
    put_environment_property_set : Proc(ITsSbEnvironment*, ITsSbEnvironmentPropertySet, HRESULT)
  end

  struct ITsSbEnvironment
    lpVtbl : ITsSbEnvironmentVTbl*
  end

  struct ITsSbLoadBalanceResultVTbl
    query_interface : Proc(ITsSbLoadBalanceResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbLoadBalanceResult*, UInt32)
    release : Proc(ITsSbLoadBalanceResult*, UInt32)
    get_target_name : Proc(ITsSbLoadBalanceResult*, UInt8*, HRESULT)
  end

  struct ITsSbLoadBalanceResult
    lpVtbl : ITsSbLoadBalanceResultVTbl*
  end

  struct ITsSbTargetVTbl
    query_interface : Proc(ITsSbTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTarget*, UInt32)
    release : Proc(ITsSbTarget*, UInt32)
    get_target_name : Proc(ITsSbTarget*, UInt8*, HRESULT)
    put_target_name : Proc(ITsSbTarget*, UInt8, HRESULT)
    get_farm_name : Proc(ITsSbTarget*, UInt8*, HRESULT)
    put_farm_name : Proc(ITsSbTarget*, UInt8, HRESULT)
    get_target_fqdn : Proc(ITsSbTarget*, UInt8*, HRESULT)
    put_target_fqdn : Proc(ITsSbTarget*, UInt8, HRESULT)
    get_target_netbios : Proc(ITsSbTarget*, UInt8*, HRESULT)
    put_target_netbios : Proc(ITsSbTarget*, UInt8, HRESULT)
    get_ip_addresses : Proc(ITsSbTarget*, TSSD_ConnectionPoint*, UInt32*, HRESULT)
    put_ip_addresses : Proc(ITsSbTarget*, TSSD_ConnectionPoint*, UInt32, HRESULT)
    get_target_state : Proc(ITsSbTarget*, TARGET_STATE*, HRESULT)
    put_target_state : Proc(ITsSbTarget*, TARGET_STATE, HRESULT)
    get_target_property_set : Proc(ITsSbTarget*, ITsSbTargetPropertySet*, HRESULT)
    put_target_property_set : Proc(ITsSbTarget*, ITsSbTargetPropertySet, HRESULT)
    get_environment_name : Proc(ITsSbTarget*, UInt8*, HRESULT)
    put_environment_name : Proc(ITsSbTarget*, UInt8, HRESULT)
    get_num_sessions : Proc(ITsSbTarget*, UInt32*, HRESULT)
    get_num_pending_connections : Proc(ITsSbTarget*, UInt32*, HRESULT)
    get_target_load : Proc(ITsSbTarget*, UInt32*, HRESULT)
  end

  struct ITsSbTarget
    lpVtbl : ITsSbTargetVTbl*
  end

  struct ITsSbSessionVTbl
    query_interface : Proc(ITsSbSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbSession*, UInt32)
    release : Proc(ITsSbSession*, UInt32)
    get_session_id : Proc(ITsSbSession*, UInt32*, HRESULT)
    get_target_name : Proc(ITsSbSession*, UInt8*, HRESULT)
    put_target_name : Proc(ITsSbSession*, UInt8, HRESULT)
    get_username : Proc(ITsSbSession*, UInt8*, HRESULT)
    get_domain : Proc(ITsSbSession*, UInt8*, HRESULT)
    get_state : Proc(ITsSbSession*, TSSESSION_STATE*, HRESULT)
    put_state : Proc(ITsSbSession*, TSSESSION_STATE, HRESULT)
    get_create_time : Proc(ITsSbSession*, FILETIME*, HRESULT)
    put_create_time : Proc(ITsSbSession*, FILETIME, HRESULT)
    get_disconnect_time : Proc(ITsSbSession*, FILETIME*, HRESULT)
    put_disconnect_time : Proc(ITsSbSession*, FILETIME, HRESULT)
    get_initial_program : Proc(ITsSbSession*, UInt8*, HRESULT)
    put_initial_program : Proc(ITsSbSession*, UInt8, HRESULT)
    get_client_display : Proc(ITsSbSession*, CLIENT_DISPLAY*, HRESULT)
    put_client_display : Proc(ITsSbSession*, CLIENT_DISPLAY, HRESULT)
    get_protocol_type : Proc(ITsSbSession*, UInt32*, HRESULT)
    put_protocol_type : Proc(ITsSbSession*, UInt32, HRESULT)
  end

  struct ITsSbSession
    lpVtbl : ITsSbSessionVTbl*
  end

  struct ITsSbResourceNotificationVTbl
    query_interface : Proc(ITsSbResourceNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbResourceNotification*, UInt32)
    release : Proc(ITsSbResourceNotification*, UInt32)
    notify_session_change : Proc(ITsSbResourceNotification*, TSSESSION_STATE, ITsSbSession, HRESULT)
    notify_target_change : Proc(ITsSbResourceNotification*, UInt32, ITsSbTarget, HRESULT)
    notify_client_connection_state_change : Proc(ITsSbResourceNotification*, CONNECTION_CHANGE_NOTIFICATION, ITsSbClientConnection, HRESULT)
  end

  struct ITsSbResourceNotification
    lpVtbl : ITsSbResourceNotificationVTbl*
  end

  struct ITsSbResourceNotificationExVTbl
    query_interface : Proc(ITsSbResourceNotificationEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbResourceNotificationEx*, UInt32)
    release : Proc(ITsSbResourceNotificationEx*, UInt32)
    notify_session_change_ex : Proc(ITsSbResourceNotificationEx*, UInt8, UInt8, UInt8, UInt32, TSSESSION_STATE, HRESULT)
    notify_target_change_ex : Proc(ITsSbResourceNotificationEx*, UInt8, UInt32, HRESULT)
    notify_client_connection_state_change_ex : Proc(ITsSbResourceNotificationEx*, UInt8, UInt8, UInt8, UInt8, UInt8, CONNECTION_CHANGE_NOTIFICATION, HRESULT)
  end

  struct ITsSbResourceNotificationEx
    lpVtbl : ITsSbResourceNotificationExVTbl*
  end

  struct ITsSbTaskInfoVTbl
    query_interface : Proc(ITsSbTaskInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTaskInfo*, UInt32)
    release : Proc(ITsSbTaskInfo*, UInt32)
    get_target_id : Proc(ITsSbTaskInfo*, UInt8*, HRESULT)
    get_start_time : Proc(ITsSbTaskInfo*, FILETIME*, HRESULT)
    get_end_time : Proc(ITsSbTaskInfo*, FILETIME*, HRESULT)
    get_deadline : Proc(ITsSbTaskInfo*, FILETIME*, HRESULT)
    get_identifier : Proc(ITsSbTaskInfo*, UInt8*, HRESULT)
    get_label : Proc(ITsSbTaskInfo*, UInt8*, HRESULT)
    get_context : Proc(ITsSbTaskInfo*, SAFEARRAY**, HRESULT)
    get_plugin : Proc(ITsSbTaskInfo*, UInt8*, HRESULT)
    get_status : Proc(ITsSbTaskInfo*, RDV_TASK_STATUS*, HRESULT)
  end

  struct ITsSbTaskInfo
    lpVtbl : ITsSbTaskInfoVTbl*
  end

  struct ITsSbTaskPluginVTbl
    query_interface : Proc(ITsSbTaskPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTaskPlugin*, UInt32)
    release : Proc(ITsSbTaskPlugin*, UInt32)
    initialize : Proc(ITsSbTaskPlugin*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbTaskPlugin*, HRESULT, HRESULT)
    initialize_task_plugin : Proc(ITsSbTaskPlugin*, ITsSbTaskPluginNotifySink, HRESULT)
    set_task_queue : Proc(ITsSbTaskPlugin*, UInt8, UInt32, ITsSbTaskInfo*, HRESULT)
  end

  struct ITsSbTaskPlugin
    lpVtbl : ITsSbTaskPluginVTbl*
  end

  struct ITsSbPropertySetVTbl
    query_interface : Proc(ITsSbPropertySet*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbPropertySet*, UInt32)
    release : Proc(ITsSbPropertySet*, UInt32)
    read : Proc(ITsSbPropertySet*, LibC::LPWSTR, VARIANT*, IErrorLog, HRESULT)
    write : Proc(ITsSbPropertySet*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  struct ITsSbPropertySet
    lpVtbl : ITsSbPropertySetVTbl*
  end

  struct ITsSbPluginPropertySetVTbl
    query_interface : Proc(ITsSbPluginPropertySet*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbPluginPropertySet*, UInt32)
    release : Proc(ITsSbPluginPropertySet*, UInt32)
    read : Proc(ITsSbPluginPropertySet*, LibC::LPWSTR, VARIANT*, IErrorLog, HRESULT)
    write : Proc(ITsSbPluginPropertySet*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  struct ITsSbPluginPropertySet
    lpVtbl : ITsSbPluginPropertySetVTbl*
  end

  struct ITsSbClientConnectionPropertySetVTbl
    query_interface : Proc(ITsSbClientConnectionPropertySet*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbClientConnectionPropertySet*, UInt32)
    release : Proc(ITsSbClientConnectionPropertySet*, UInt32)
    read : Proc(ITsSbClientConnectionPropertySet*, LibC::LPWSTR, VARIANT*, IErrorLog, HRESULT)
    write : Proc(ITsSbClientConnectionPropertySet*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  struct ITsSbClientConnectionPropertySet
    lpVtbl : ITsSbClientConnectionPropertySetVTbl*
  end

  struct ITsSbTargetPropertySetVTbl
    query_interface : Proc(ITsSbTargetPropertySet*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTargetPropertySet*, UInt32)
    release : Proc(ITsSbTargetPropertySet*, UInt32)
    read : Proc(ITsSbTargetPropertySet*, LibC::LPWSTR, VARIANT*, IErrorLog, HRESULT)
    write : Proc(ITsSbTargetPropertySet*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  struct ITsSbTargetPropertySet
    lpVtbl : ITsSbTargetPropertySetVTbl*
  end

  struct ITsSbEnvironmentPropertySetVTbl
    query_interface : Proc(ITsSbEnvironmentPropertySet*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbEnvironmentPropertySet*, UInt32)
    release : Proc(ITsSbEnvironmentPropertySet*, UInt32)
    read : Proc(ITsSbEnvironmentPropertySet*, LibC::LPWSTR, VARIANT*, IErrorLog, HRESULT)
    write : Proc(ITsSbEnvironmentPropertySet*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  struct ITsSbEnvironmentPropertySet
    lpVtbl : ITsSbEnvironmentPropertySetVTbl*
  end

  struct ITsSbBaseNotifySinkVTbl
    query_interface : Proc(ITsSbBaseNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbBaseNotifySink*, UInt32)
    release : Proc(ITsSbBaseNotifySink*, UInt32)
    on_error : Proc(ITsSbBaseNotifySink*, HRESULT, HRESULT)
    on_report_status : Proc(ITsSbBaseNotifySink*, CLIENT_MESSAGE_TYPE, UInt32, HRESULT)
  end

  struct ITsSbBaseNotifySink
    lpVtbl : ITsSbBaseNotifySinkVTbl*
  end

  struct ITsSbPluginNotifySinkVTbl
    query_interface : Proc(ITsSbPluginNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbPluginNotifySink*, UInt32)
    release : Proc(ITsSbPluginNotifySink*, UInt32)
    on_error : Proc(ITsSbPluginNotifySink*, HRESULT, HRESULT)
    on_report_status : Proc(ITsSbPluginNotifySink*, CLIENT_MESSAGE_TYPE, UInt32, HRESULT)
    on_initialized : Proc(ITsSbPluginNotifySink*, HRESULT, HRESULT)
    on_terminated : Proc(ITsSbPluginNotifySink*, HRESULT)
  end

  struct ITsSbPluginNotifySink
    lpVtbl : ITsSbPluginNotifySinkVTbl*
  end

  struct ITsSbLoadBalancingNotifySinkVTbl
    query_interface : Proc(ITsSbLoadBalancingNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbLoadBalancingNotifySink*, UInt32)
    release : Proc(ITsSbLoadBalancingNotifySink*, UInt32)
    on_error : Proc(ITsSbLoadBalancingNotifySink*, HRESULT, HRESULT)
    on_report_status : Proc(ITsSbLoadBalancingNotifySink*, CLIENT_MESSAGE_TYPE, UInt32, HRESULT)
    on_get_most_suitable_target : Proc(ITsSbLoadBalancingNotifySink*, ITsSbLoadBalanceResult, LibC::BOOL, HRESULT)
  end

  struct ITsSbLoadBalancingNotifySink
    lpVtbl : ITsSbLoadBalancingNotifySinkVTbl*
  end

  struct ITsSbPlacementNotifySinkVTbl
    query_interface : Proc(ITsSbPlacementNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbPlacementNotifySink*, UInt32)
    release : Proc(ITsSbPlacementNotifySink*, UInt32)
    on_error : Proc(ITsSbPlacementNotifySink*, HRESULT, HRESULT)
    on_report_status : Proc(ITsSbPlacementNotifySink*, CLIENT_MESSAGE_TYPE, UInt32, HRESULT)
    on_query_environment_completed : Proc(ITsSbPlacementNotifySink*, ITsSbEnvironment, HRESULT)
  end

  struct ITsSbPlacementNotifySink
    lpVtbl : ITsSbPlacementNotifySinkVTbl*
  end

  struct ITsSbOrchestrationNotifySinkVTbl
    query_interface : Proc(ITsSbOrchestrationNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbOrchestrationNotifySink*, UInt32)
    release : Proc(ITsSbOrchestrationNotifySink*, UInt32)
    on_error : Proc(ITsSbOrchestrationNotifySink*, HRESULT, HRESULT)
    on_report_status : Proc(ITsSbOrchestrationNotifySink*, CLIENT_MESSAGE_TYPE, UInt32, HRESULT)
    on_ready_to_connect : Proc(ITsSbOrchestrationNotifySink*, ITsSbTarget, HRESULT)
  end

  struct ITsSbOrchestrationNotifySink
    lpVtbl : ITsSbOrchestrationNotifySinkVTbl*
  end

  struct ITsSbTaskPluginNotifySinkVTbl
    query_interface : Proc(ITsSbTaskPluginNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTaskPluginNotifySink*, UInt32)
    release : Proc(ITsSbTaskPluginNotifySink*, UInt32)
    on_error : Proc(ITsSbTaskPluginNotifySink*, HRESULT, HRESULT)
    on_report_status : Proc(ITsSbTaskPluginNotifySink*, CLIENT_MESSAGE_TYPE, UInt32, HRESULT)
    on_set_task_time : Proc(ITsSbTaskPluginNotifySink*, UInt8, FILETIME, FILETIME, FILETIME, UInt8, UInt8, UInt8, UInt32, SAFEARRAY*, HRESULT)
    on_delete_task_time : Proc(ITsSbTaskPluginNotifySink*, UInt8, UInt8, HRESULT)
    on_update_task_status : Proc(ITsSbTaskPluginNotifySink*, UInt8, UInt8, RDV_TASK_STATUS, HRESULT)
    on_report_tasks : Proc(ITsSbTaskPluginNotifySink*, UInt8, HRESULT)
  end

  struct ITsSbTaskPluginNotifySink
    lpVtbl : ITsSbTaskPluginNotifySinkVTbl*
  end

  struct ITsSbClientConnectionVTbl
    query_interface : Proc(ITsSbClientConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbClientConnection*, UInt32)
    release : Proc(ITsSbClientConnection*, UInt32)
    get_user_name : Proc(ITsSbClientConnection*, UInt8*, HRESULT)
    get_domain : Proc(ITsSbClientConnection*, UInt8*, HRESULT)
    get_initial_program : Proc(ITsSbClientConnection*, UInt8*, HRESULT)
    get_load_balance_result : Proc(ITsSbClientConnection*, ITsSbLoadBalanceResult*, HRESULT)
    get_farm_name : Proc(ITsSbClientConnection*, UInt8*, HRESULT)
    put_context : Proc(ITsSbClientConnection*, UInt8, VARIANT, VARIANT*, HRESULT)
    get_context : Proc(ITsSbClientConnection*, UInt8, VARIANT*, HRESULT)
    get_environment : Proc(ITsSbClientConnection*, ITsSbEnvironment*, HRESULT)
    get_connection_error : Proc(ITsSbClientConnection*, HRESULT)
    get_sam_user_account : Proc(ITsSbClientConnection*, UInt8*, HRESULT)
    get_client_connection_property_set : Proc(ITsSbClientConnection*, ITsSbClientConnectionPropertySet*, HRESULT)
    get_is_first_assignment : Proc(ITsSbClientConnection*, LibC::BOOL*, HRESULT)
    get_rd_farm_type : Proc(ITsSbClientConnection*, RD_FARM_TYPE*, HRESULT)
    get_user_sid_string : Proc(ITsSbClientConnection*, Int8**, HRESULT)
    get_disconnected_session : Proc(ITsSbClientConnection*, ITsSbSession*, HRESULT)
  end

  struct ITsSbClientConnection
    lpVtbl : ITsSbClientConnectionVTbl*
  end

  struct ITsSbProviderVTbl
    query_interface : Proc(ITsSbProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbProvider*, UInt32)
    release : Proc(ITsSbProvider*, UInt32)
    create_target_object : Proc(ITsSbProvider*, UInt8, UInt8, ITsSbTarget*, HRESULT)
    create_load_balance_result_object : Proc(ITsSbProvider*, UInt8, ITsSbLoadBalanceResult*, HRESULT)
    create_session_object : Proc(ITsSbProvider*, UInt8, UInt8, UInt8, UInt32, ITsSbSession*, HRESULT)
    create_plugin_property_set : Proc(ITsSbProvider*, ITsSbPluginPropertySet*, HRESULT)
    create_target_property_set_object : Proc(ITsSbProvider*, ITsSbTargetPropertySet*, HRESULT)
    create_environment_object : Proc(ITsSbProvider*, UInt8, UInt32, ITsSbEnvironment*, HRESULT)
    get_resource_plugin_store : Proc(ITsSbProvider*, ITsSbResourcePluginStore*, HRESULT)
    get_filter_plugin_store : Proc(ITsSbProvider*, ITsSbFilterPluginStore*, HRESULT)
    register_for_notification : Proc(ITsSbProvider*, UInt32, UInt8, ITsSbResourceNotification, HRESULT)
    un_register_for_notification : Proc(ITsSbProvider*, UInt32, UInt8, HRESULT)
    get_instance_of_global_store : Proc(ITsSbProvider*, ITsSbGlobalStore*, HRESULT)
    create_environment_property_set_object : Proc(ITsSbProvider*, ITsSbEnvironmentPropertySet*, HRESULT)
  end

  struct ITsSbProvider
    lpVtbl : ITsSbProviderVTbl*
  end

  struct ITsSbResourcePluginStoreVTbl
    query_interface : Proc(ITsSbResourcePluginStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbResourcePluginStore*, UInt32)
    release : Proc(ITsSbResourcePluginStore*, UInt32)
    query_target : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, ITsSbTarget*, HRESULT)
    query_session_by_session_id : Proc(ITsSbResourcePluginStore*, UInt32, UInt8, ITsSbSession*, HRESULT)
    add_target_to_store : Proc(ITsSbResourcePluginStore*, ITsSbTarget, HRESULT)
    add_session_to_store : Proc(ITsSbResourcePluginStore*, ITsSbSession, HRESULT)
    add_environment_to_store : Proc(ITsSbResourcePluginStore*, ITsSbEnvironment, HRESULT)
    remove_environment_from_store : Proc(ITsSbResourcePluginStore*, UInt8, LibC::BOOL, HRESULT)
    enumerate_farms : Proc(ITsSbResourcePluginStore*, UInt32*, SAFEARRAY**, HRESULT)
    query_environment : Proc(ITsSbResourcePluginStore*, UInt8, ITsSbEnvironment*, HRESULT)
    enumerate_environments : Proc(ITsSbResourcePluginStore*, UInt32*, ITsSbEnvironment**, HRESULT)
    save_target : Proc(ITsSbResourcePluginStore*, ITsSbTarget, LibC::BOOL, HRESULT)
    save_environment : Proc(ITsSbResourcePluginStore*, ITsSbEnvironment, LibC::BOOL, HRESULT)
    save_session : Proc(ITsSbResourcePluginStore*, ITsSbSession, HRESULT)
    set_target_property : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, VARIANT*, HRESULT)
    set_environment_property : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, VARIANT*, HRESULT)
    set_target_state : Proc(ITsSbResourcePluginStore*, UInt8, TARGET_STATE, TARGET_STATE*, HRESULT)
    set_session_state : Proc(ITsSbResourcePluginStore*, ITsSbSession, HRESULT)
    enumerate_targets : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, TS_SB_SORT_BY, UInt8, UInt32*, ITsSbTarget**, HRESULT)
    enumerate_sessions : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, UInt8, UInt8, UInt8, TSSESSION_STATE*, UInt32*, ITsSbSession**, HRESULT)
    get_farm_property : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, VARIANT*, HRESULT)
    delete_target : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, HRESULT)
    set_target_property_with_version_check : Proc(ITsSbResourcePluginStore*, ITsSbTarget, UInt8, VARIANT*, HRESULT)
    set_environment_property_with_version_check : Proc(ITsSbResourcePluginStore*, ITsSbEnvironment, UInt8, VARIANT*, HRESULT)
    acquire_target_lock : Proc(ITsSbResourcePluginStore*, UInt8, UInt32, IUnknown*, HRESULT)
    release_target_lock : Proc(ITsSbResourcePluginStore*, IUnknown, HRESULT)
    test_and_set_server_state : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, TARGET_STATE, TARGET_STATE, TARGET_STATE*, HRESULT)
    set_server_waiting_to_start : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, HRESULT)
    get_server_state : Proc(ITsSbResourcePluginStore*, UInt8, UInt8, TARGET_STATE*, HRESULT)
    set_server_drain_mode : Proc(ITsSbResourcePluginStore*, UInt8, UInt32, HRESULT)
  end

  struct ITsSbResourcePluginStore
    lpVtbl : ITsSbResourcePluginStoreVTbl*
  end

  struct ITsSbFilterPluginStoreVTbl
    query_interface : Proc(ITsSbFilterPluginStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbFilterPluginStore*, UInt32)
    release : Proc(ITsSbFilterPluginStore*, UInt32)
    save_properties : Proc(ITsSbFilterPluginStore*, ITsSbPropertySet, HRESULT)
    enumerate_properties : Proc(ITsSbFilterPluginStore*, ITsSbPropertySet*, HRESULT)
    delete_properties : Proc(ITsSbFilterPluginStore*, UInt8, HRESULT)
  end

  struct ITsSbFilterPluginStore
    lpVtbl : ITsSbFilterPluginStoreVTbl*
  end

  struct ITsSbGlobalStoreVTbl
    query_interface : Proc(ITsSbGlobalStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbGlobalStore*, UInt32)
    release : Proc(ITsSbGlobalStore*, UInt32)
    query_target : Proc(ITsSbGlobalStore*, UInt8, UInt8, UInt8, ITsSbTarget*, HRESULT)
    query_session_by_session_id : Proc(ITsSbGlobalStore*, UInt8, UInt32, UInt8, ITsSbSession*, HRESULT)
    enumerate_farms : Proc(ITsSbGlobalStore*, UInt8, UInt32*, SAFEARRAY**, HRESULT)
    enumerate_targets : Proc(ITsSbGlobalStore*, UInt8, UInt8, UInt8, UInt32*, ITsSbTarget**, HRESULT)
    enumerate_environments_by_provider : Proc(ITsSbGlobalStore*, UInt8, UInt32*, ITsSbEnvironment**, HRESULT)
    enumerate_sessions : Proc(ITsSbGlobalStore*, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, TSSESSION_STATE*, UInt32*, ITsSbSession**, HRESULT)
    get_farm_property : Proc(ITsSbGlobalStore*, UInt8, UInt8, VARIANT*, HRESULT)
  end

  struct ITsSbGlobalStore
    lpVtbl : ITsSbGlobalStoreVTbl*
  end

  struct ITsSbProvisioningPluginNotifySinkVTbl
    query_interface : Proc(ITsSbProvisioningPluginNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbProvisioningPluginNotifySink*, UInt32)
    release : Proc(ITsSbProvisioningPluginNotifySink*, UInt32)
    on_job_created : Proc(ITsSbProvisioningPluginNotifySink*, VM_NOTIFY_INFO*, HRESULT)
    on_virtual_machine_status_changed : Proc(ITsSbProvisioningPluginNotifySink*, VM_NOTIFY_ENTRY*, VM_NOTIFY_STATUS, HRESULT, UInt8, HRESULT)
    on_job_completed : Proc(ITsSbProvisioningPluginNotifySink*, HRESULT, UInt8, HRESULT)
    on_job_cancelled : Proc(ITsSbProvisioningPluginNotifySink*, HRESULT)
    lock_virtual_machine : Proc(ITsSbProvisioningPluginNotifySink*, VM_NOTIFY_ENTRY*, HRESULT)
    on_virtual_machine_host_status_changed : Proc(ITsSbProvisioningPluginNotifySink*, UInt8, VM_HOST_NOTIFY_STATUS, HRESULT, UInt8, HRESULT)
  end

  struct ITsSbProvisioningPluginNotifySink
    lpVtbl : ITsSbProvisioningPluginNotifySinkVTbl*
  end

  struct ITsSbProvisioningVTbl
    query_interface : Proc(ITsSbProvisioning*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbProvisioning*, UInt32)
    release : Proc(ITsSbProvisioning*, UInt32)
    initialize : Proc(ITsSbProvisioning*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbProvisioning*, HRESULT, HRESULT)
    create_virtual_machines : Proc(ITsSbProvisioning*, UInt8, UInt8, ITsSbProvisioningPluginNotifySink, HRESULT)
    patch_virtual_machines : Proc(ITsSbProvisioning*, UInt8, UInt8, ITsSbProvisioningPluginNotifySink, VM_PATCH_INFO*, HRESULT)
    delete_virtual_machines : Proc(ITsSbProvisioning*, UInt8, UInt8, ITsSbProvisioningPluginNotifySink, HRESULT)
    cancel_job : Proc(ITsSbProvisioning*, UInt8, HRESULT)
  end

  struct ITsSbProvisioning
    lpVtbl : ITsSbProvisioningVTbl*
  end

  struct ITsSbGenericNotifySinkVTbl
    query_interface : Proc(ITsSbGenericNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbGenericNotifySink*, UInt32)
    release : Proc(ITsSbGenericNotifySink*, UInt32)
    on_completed : Proc(ITsSbGenericNotifySink*, HRESULT, HRESULT)
    get_wait_timeout : Proc(ITsSbGenericNotifySink*, FILETIME*, HRESULT)
  end

  struct ITsSbGenericNotifySink
    lpVtbl : ITsSbGenericNotifySinkVTbl*
  end

  struct ItsPubPluginVTbl
    query_interface : Proc(ItsPubPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(ItsPubPlugin*, UInt32)
    release : Proc(ItsPubPlugin*, UInt32)
    get_resource_list : Proc(ItsPubPlugin*, LibC::LPWSTR, Int32*, Pluginresource**, HRESULT)
    get_resource : Proc(ItsPubPlugin*, LibC::LPWSTR, Int32, Pluginresource*, HRESULT)
    get_cache_last_update_time : Proc(ItsPubPlugin*, UInt64*, HRESULT)
    get_plugin_name : Proc(ItsPubPlugin*, UInt8*, HRESULT)
    get_plugin_version : Proc(ItsPubPlugin*, UInt8*, HRESULT)
    resolve_resource : Proc(ItsPubPlugin*, UInt32*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  struct ItsPubPlugin
    lpVtbl : ItsPubPluginVTbl*
  end

  struct ItsPubPlugin2VTbl
    query_interface : Proc(ItsPubPlugin2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ItsPubPlugin2*, UInt32)
    release : Proc(ItsPubPlugin2*, UInt32)
    get_resource_list : Proc(ItsPubPlugin2*, LibC::LPWSTR, Int32*, Pluginresource**, HRESULT)
    get_resource : Proc(ItsPubPlugin2*, LibC::LPWSTR, Int32, Pluginresource*, HRESULT)
    get_cache_last_update_time : Proc(ItsPubPlugin2*, UInt64*, HRESULT)
    get_plugin_name : Proc(ItsPubPlugin2*, UInt8*, HRESULT)
    get_plugin_version : Proc(ItsPubPlugin2*, UInt8*, HRESULT)
    resolve_resource : Proc(ItsPubPlugin2*, UInt32*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_resource2_list : Proc(ItsPubPlugin2*, LibC::LPWSTR, Int32*, Pluginresource2**, HRESULT)
    get_resource2 : Proc(ItsPubPlugin2*, LibC::LPWSTR, Int32, Pluginresource2*, HRESULT)
    resolve_personal_desktop : Proc(ItsPubPlugin2*, LibC::LPWSTR, LibC::LPWSTR, TSPUB_PLUGIN_PD_RESOLUTION_TYPE, TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE*, LibC::LPWSTR, HRESULT)
    delete_personal_desktop_assignment : Proc(ItsPubPlugin2*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  struct ItsPubPlugin2
    lpVtbl : ItsPubPlugin2VTbl*
  end

  struct IWorkspaceResTypeRegistryVTbl
    query_interface : Proc(IWorkspaceResTypeRegistry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceResTypeRegistry*, UInt32)
    release : Proc(IWorkspaceResTypeRegistry*, UInt32)
    get_type_info_count : Proc(IWorkspaceResTypeRegistry*, UInt32*, HRESULT)
    get_type_info : Proc(IWorkspaceResTypeRegistry*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWorkspaceResTypeRegistry*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWorkspaceResTypeRegistry*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    add_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8, UInt8, HRESULT)
    delete_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8, HRESULT)
    get_registered_file_extensions : Proc(IWorkspaceResTypeRegistry*, Int16, SAFEARRAY**, HRESULT)
    get_resource_type_info : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8, UInt8*, HRESULT)
    modify_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8, UInt8, HRESULT)
  end

  struct IWorkspaceResTypeRegistry
    lpVtbl : IWorkspaceResTypeRegistryVTbl*
  end

  struct IWTSPluginVTbl
    query_interface : Proc(IWTSPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSPlugin*, UInt32)
    release : Proc(IWTSPlugin*, UInt32)
    initialize : Proc(IWTSPlugin*, IWTSVirtualChannelManager, HRESULT)
    connected : Proc(IWTSPlugin*, HRESULT)
    disconnected : Proc(IWTSPlugin*, UInt32, HRESULT)
    terminated : Proc(IWTSPlugin*, HRESULT)
  end

  struct IWTSPlugin
    lpVtbl : IWTSPluginVTbl*
  end

  struct IWTSListenerVTbl
    query_interface : Proc(IWTSListener*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSListener*, UInt32)
    release : Proc(IWTSListener*, UInt32)
    get_configuration : Proc(IWTSListener*, IPropertyBag*, HRESULT)
  end

  struct IWTSListener
    lpVtbl : IWTSListenerVTbl*
  end

  struct IWTSListenerCallbackVTbl
    query_interface : Proc(IWTSListenerCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSListenerCallback*, UInt32)
    release : Proc(IWTSListenerCallback*, UInt32)
    on_new_channel_connection : Proc(IWTSListenerCallback*, IWTSVirtualChannel, UInt8, LibC::BOOL*, IWTSVirtualChannelCallback*, HRESULT)
  end

  struct IWTSListenerCallback
    lpVtbl : IWTSListenerCallbackVTbl*
  end

  struct IWTSVirtualChannelCallbackVTbl
    query_interface : Proc(IWTSVirtualChannelCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSVirtualChannelCallback*, UInt32)
    release : Proc(IWTSVirtualChannelCallback*, UInt32)
    on_data_received : Proc(IWTSVirtualChannelCallback*, UInt32, UInt8*, HRESULT)
    on_close : Proc(IWTSVirtualChannelCallback*, HRESULT)
  end

  struct IWTSVirtualChannelCallback
    lpVtbl : IWTSVirtualChannelCallbackVTbl*
  end

  struct IWTSVirtualChannelManagerVTbl
    query_interface : Proc(IWTSVirtualChannelManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSVirtualChannelManager*, UInt32)
    release : Proc(IWTSVirtualChannelManager*, UInt32)
    create_listener : Proc(IWTSVirtualChannelManager*, UInt8*, UInt32, IWTSListenerCallback, IWTSListener*, HRESULT)
  end

  struct IWTSVirtualChannelManager
    lpVtbl : IWTSVirtualChannelManagerVTbl*
  end

  struct IWTSVirtualChannelVTbl
    query_interface : Proc(IWTSVirtualChannel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSVirtualChannel*, UInt32)
    release : Proc(IWTSVirtualChannel*, UInt32)
    write : Proc(IWTSVirtualChannel*, UInt32, UInt8*, IUnknown, HRESULT)
    close : Proc(IWTSVirtualChannel*, HRESULT)
  end

  struct IWTSVirtualChannel
    lpVtbl : IWTSVirtualChannelVTbl*
  end

  struct IWTSPluginServiceProviderVTbl
    query_interface : Proc(IWTSPluginServiceProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSPluginServiceProvider*, UInt32)
    release : Proc(IWTSPluginServiceProvider*, UInt32)
    get_service : Proc(IWTSPluginServiceProvider*, Guid, IUnknown*, HRESULT)
  end

  struct IWTSPluginServiceProvider
    lpVtbl : IWTSPluginServiceProviderVTbl*
  end

  struct IWTSBitmapRendererVTbl
    query_interface : Proc(IWTSBitmapRenderer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSBitmapRenderer*, UInt32)
    release : Proc(IWTSBitmapRenderer*, UInt32)
    render : Proc(IWTSBitmapRenderer*, Guid, UInt32, UInt32, Int32, UInt32, UInt8*, HRESULT)
    get_renderer_statistics : Proc(IWTSBitmapRenderer*, BITMAP_RENDERER_STATISTICS*, HRESULT)
    remove_mapping : Proc(IWTSBitmapRenderer*, HRESULT)
  end

  struct IWTSBitmapRenderer
    lpVtbl : IWTSBitmapRendererVTbl*
  end

  struct IWTSBitmapRendererCallbackVTbl
    query_interface : Proc(IWTSBitmapRendererCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSBitmapRendererCallback*, UInt32)
    release : Proc(IWTSBitmapRendererCallback*, UInt32)
    on_target_size_changed : Proc(IWTSBitmapRendererCallback*, RECT, HRESULT)
  end

  struct IWTSBitmapRendererCallback
    lpVtbl : IWTSBitmapRendererCallbackVTbl*
  end

  struct IWTSBitmapRenderServiceVTbl
    query_interface : Proc(IWTSBitmapRenderService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSBitmapRenderService*, UInt32)
    release : Proc(IWTSBitmapRenderService*, UInt32)
    get_mapped_renderer : Proc(IWTSBitmapRenderService*, UInt64, IWTSBitmapRendererCallback, IWTSBitmapRenderer*, HRESULT)
  end

  struct IWTSBitmapRenderService
    lpVtbl : IWTSBitmapRenderServiceVTbl*
  end

  struct IWRdsGraphicsChannelEventsVTbl
    query_interface : Proc(IWRdsGraphicsChannelEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsGraphicsChannelEvents*, UInt32)
    release : Proc(IWRdsGraphicsChannelEvents*, UInt32)
    on_data_received : Proc(IWRdsGraphicsChannelEvents*, UInt32, UInt8*, HRESULT)
    on_close : Proc(IWRdsGraphicsChannelEvents*, HRESULT)
    on_channel_opened : Proc(IWRdsGraphicsChannelEvents*, HRESULT, IUnknown, HRESULT)
    on_data_sent : Proc(IWRdsGraphicsChannelEvents*, IUnknown, LibC::BOOL, UInt8*, UInt32, HRESULT)
    on_metrics_update : Proc(IWRdsGraphicsChannelEvents*, UInt32, UInt32, UInt64, HRESULT)
  end

  struct IWRdsGraphicsChannelEvents
    lpVtbl : IWRdsGraphicsChannelEventsVTbl*
  end

  struct IWRdsGraphicsChannelVTbl
    query_interface : Proc(IWRdsGraphicsChannel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsGraphicsChannel*, UInt32)
    release : Proc(IWRdsGraphicsChannel*, UInt32)
    write : Proc(IWRdsGraphicsChannel*, UInt32, UInt8*, IUnknown, HRESULT)
    close : Proc(IWRdsGraphicsChannel*, HRESULT)
    open : Proc(IWRdsGraphicsChannel*, IWRdsGraphicsChannelEvents, IUnknown, HRESULT)
  end

  struct IWRdsGraphicsChannel
    lpVtbl : IWRdsGraphicsChannelVTbl*
  end

  struct IWRdsGraphicsChannelManagerVTbl
    query_interface : Proc(IWRdsGraphicsChannelManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsGraphicsChannelManager*, UInt32)
    release : Proc(IWRdsGraphicsChannelManager*, UInt32)
    create_channel : Proc(IWRdsGraphicsChannelManager*, UInt8*, WRdsGraphicsChannelType, IWRdsGraphicsChannel*, HRESULT)
  end

  struct IWRdsGraphicsChannelManager
    lpVtbl : IWRdsGraphicsChannelManagerVTbl*
  end

  struct IWTSProtocolManagerVTbl
    query_interface : Proc(IWTSProtocolManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolManager*, UInt32)
    release : Proc(IWTSProtocolManager*, UInt32)
    create_listener : Proc(IWTSProtocolManager*, LibC::LPWSTR, IWTSProtocolListener*, HRESULT)
    notify_service_state_change : Proc(IWTSProtocolManager*, WTS_SERVICE_STATE*, HRESULT)
    notify_session_of_service_start : Proc(IWTSProtocolManager*, WTS_SESSION_ID*, HRESULT)
    notify_session_of_service_stop : Proc(IWTSProtocolManager*, WTS_SESSION_ID*, HRESULT)
    notify_session_state_change : Proc(IWTSProtocolManager*, WTS_SESSION_ID*, UInt32, HRESULT)
  end

  struct IWTSProtocolManager
    lpVtbl : IWTSProtocolManagerVTbl*
  end

  struct IWTSProtocolListenerVTbl
    query_interface : Proc(IWTSProtocolListener*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolListener*, UInt32)
    release : Proc(IWTSProtocolListener*, UInt32)
    start_listen : Proc(IWTSProtocolListener*, IWTSProtocolListenerCallback, HRESULT)
    stop_listen : Proc(IWTSProtocolListener*, HRESULT)
  end

  struct IWTSProtocolListener
    lpVtbl : IWTSProtocolListenerVTbl*
  end

  struct IWTSProtocolListenerCallbackVTbl
    query_interface : Proc(IWTSProtocolListenerCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolListenerCallback*, UInt32)
    release : Proc(IWTSProtocolListenerCallback*, UInt32)
    on_connected : Proc(IWTSProtocolListenerCallback*, IWTSProtocolConnection, IWTSProtocolConnectionCallback*, HRESULT)
  end

  struct IWTSProtocolListenerCallback
    lpVtbl : IWTSProtocolListenerCallbackVTbl*
  end

  struct IWTSProtocolConnectionVTbl
    query_interface : Proc(IWTSProtocolConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolConnection*, UInt32)
    release : Proc(IWTSProtocolConnection*, UInt32)
    get_logon_error_redirector : Proc(IWTSProtocolConnection*, IWTSProtocolLogonErrorRedirector*, HRESULT)
    send_policy_data : Proc(IWTSProtocolConnection*, WTS_POLICY_DATA*, HRESULT)
    accept_connection : Proc(IWTSProtocolConnection*, HRESULT)
    get_client_data : Proc(IWTSProtocolConnection*, WTS_CLIENT_DATA*, HRESULT)
    get_user_credentials : Proc(IWTSProtocolConnection*, WTS_USER_CREDENTIAL*, HRESULT)
    get_license_connection : Proc(IWTSProtocolConnection*, IWTSProtocolLicenseConnection*, HRESULT)
    authenticate_client_to_session : Proc(IWTSProtocolConnection*, WTS_SESSION_ID*, HRESULT)
    notify_session_id : Proc(IWTSProtocolConnection*, WTS_SESSION_ID*, HRESULT)
    get_protocol_handles : Proc(IWTSProtocolConnection*, HANDLE_PTR*, HANDLE_PTR*, HANDLE_PTR*, HANDLE_PTR*, HRESULT)
    connect_notify : Proc(IWTSProtocolConnection*, UInt32, HRESULT)
    is_user_allowed_to_logon : Proc(IWTSProtocolConnection*, UInt32, HANDLE_PTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    session_arbitration_enumeration : Proc(IWTSProtocolConnection*, HANDLE_PTR, LibC::BOOL, UInt32*, UInt32*, HRESULT)
    logon_notify : Proc(IWTSProtocolConnection*, HANDLE_PTR, LibC::LPWSTR, LibC::LPWSTR, WTS_SESSION_ID*, HRESULT)
    get_user_data : Proc(IWTSProtocolConnection*, WTS_POLICY_DATA*, WTS_USER_DATA*, HRESULT)
    disconnect_notify : Proc(IWTSProtocolConnection*, HRESULT)
    close : Proc(IWTSProtocolConnection*, HRESULT)
    get_protocol_status : Proc(IWTSProtocolConnection*, WTS_PROTOCOL_STATUS*, HRESULT)
    get_last_input_time : Proc(IWTSProtocolConnection*, UInt64*, HRESULT)
    set_error_info : Proc(IWTSProtocolConnection*, UInt32, HRESULT)
    send_beep : Proc(IWTSProtocolConnection*, UInt32, UInt32, HRESULT)
    create_virtual_channel : Proc(IWTSProtocolConnection*, PSTR, LibC::BOOL, UInt32, LibC::UINT_PTR*, HRESULT)
    query_property : Proc(IWTSProtocolConnection*, Guid, UInt32, UInt32, WTS_PROPERTY_VALUE*, WTS_PROPERTY_VALUE*, HRESULT)
    get_shadow_connection : Proc(IWTSProtocolConnection*, IWTSProtocolShadowConnection*, HRESULT)
  end

  struct IWTSProtocolConnection
    lpVtbl : IWTSProtocolConnectionVTbl*
  end

  struct IWTSProtocolConnectionCallbackVTbl
    query_interface : Proc(IWTSProtocolConnectionCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolConnectionCallback*, UInt32)
    release : Proc(IWTSProtocolConnectionCallback*, UInt32)
    on_ready : Proc(IWTSProtocolConnectionCallback*, HRESULT)
    broken_connection : Proc(IWTSProtocolConnectionCallback*, UInt32, UInt32, HRESULT)
    stop_screen_updates : Proc(IWTSProtocolConnectionCallback*, HRESULT)
    redraw_window : Proc(IWTSProtocolConnectionCallback*, WTS_SMALL_RECT*, HRESULT)
    display_io_ctl : Proc(IWTSProtocolConnectionCallback*, WTS_DISPLAY_IOCTL*, HRESULT)
  end

  struct IWTSProtocolConnectionCallback
    lpVtbl : IWTSProtocolConnectionCallbackVTbl*
  end

  struct IWTSProtocolShadowConnectionVTbl
    query_interface : Proc(IWTSProtocolShadowConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolShadowConnection*, UInt32)
    release : Proc(IWTSProtocolShadowConnection*, UInt32)
    start : Proc(IWTSProtocolShadowConnection*, LibC::LPWSTR, UInt32, UInt8, UInt16, IWTSProtocolShadowCallback, HRESULT)
    stop : Proc(IWTSProtocolShadowConnection*, HRESULT)
    do_target : Proc(IWTSProtocolShadowConnection*, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR, HRESULT)
  end

  struct IWTSProtocolShadowConnection
    lpVtbl : IWTSProtocolShadowConnectionVTbl*
  end

  struct IWTSProtocolShadowCallbackVTbl
    query_interface : Proc(IWTSProtocolShadowCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolShadowCallback*, UInt32)
    release : Proc(IWTSProtocolShadowCallback*, UInt32)
    stop_shadow : Proc(IWTSProtocolShadowCallback*, HRESULT)
    invoke_target_shadow : Proc(IWTSProtocolShadowCallback*, LibC::LPWSTR, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR, HRESULT)
  end

  struct IWTSProtocolShadowCallback
    lpVtbl : IWTSProtocolShadowCallbackVTbl*
  end

  struct IWTSProtocolLicenseConnectionVTbl
    query_interface : Proc(IWTSProtocolLicenseConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolLicenseConnection*, UInt32)
    release : Proc(IWTSProtocolLicenseConnection*, UInt32)
    request_licensing_capabilities : Proc(IWTSProtocolLicenseConnection*, WTS_LICENSE_CAPABILITIES*, UInt32*, HRESULT)
    send_client_license : Proc(IWTSProtocolLicenseConnection*, UInt8*, UInt32, HRESULT)
    request_client_license : Proc(IWTSProtocolLicenseConnection*, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)
    protocol_complete : Proc(IWTSProtocolLicenseConnection*, UInt32, HRESULT)
  end

  struct IWTSProtocolLicenseConnection
    lpVtbl : IWTSProtocolLicenseConnectionVTbl*
  end

  struct IWTSProtocolLogonErrorRedirectorVTbl
    query_interface : Proc(IWTSProtocolLogonErrorRedirector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolLogonErrorRedirector*, UInt32)
    release : Proc(IWTSProtocolLogonErrorRedirector*, UInt32)
    on_begin_painting : Proc(IWTSProtocolLogonErrorRedirector*, HRESULT)
    redirect_status : Proc(IWTSProtocolLogonErrorRedirector*, LibC::LPWSTR, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, HRESULT)
    redirect_message : Proc(IWTSProtocolLogonErrorRedirector*, LibC::LPWSTR, LibC::LPWSTR, UInt32, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, HRESULT)
    redirect_logon_error : Proc(IWTSProtocolLogonErrorRedirector*, Int32, Int32, LibC::LPWSTR, LibC::LPWSTR, UInt32, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, HRESULT)
  end

  struct IWTSProtocolLogonErrorRedirector
    lpVtbl : IWTSProtocolLogonErrorRedirectorVTbl*
  end

  struct IWRdsProtocolSettingsVTbl
    query_interface : Proc(IWRdsProtocolSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolSettings*, UInt32)
    release : Proc(IWRdsProtocolSettings*, UInt32)
    get_settings : Proc(IWRdsProtocolSettings*, WRDS_SETTING_TYPE, WRDS_SETTING_LEVEL, WRDS_SETTINGS*, HRESULT)
    merge_settings : Proc(IWRdsProtocolSettings*, WRDS_SETTINGS*, WRDS_CONNECTION_SETTING_LEVEL, WRDS_CONNECTION_SETTINGS*, HRESULT)
  end

  struct IWRdsProtocolSettings
    lpVtbl : IWRdsProtocolSettingsVTbl*
  end

  struct IWRdsProtocolManagerVTbl
    query_interface : Proc(IWRdsProtocolManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolManager*, UInt32)
    release : Proc(IWRdsProtocolManager*, UInt32)
    initialize : Proc(IWRdsProtocolManager*, IWRdsProtocolSettings, WRDS_SETTINGS*, HRESULT)
    create_listener : Proc(IWRdsProtocolManager*, LibC::LPWSTR, IWRdsProtocolListener*, HRESULT)
    notify_service_state_change : Proc(IWRdsProtocolManager*, WTS_SERVICE_STATE*, HRESULT)
    notify_session_of_service_start : Proc(IWRdsProtocolManager*, WTS_SESSION_ID*, HRESULT)
    notify_session_of_service_stop : Proc(IWRdsProtocolManager*, WTS_SESSION_ID*, HRESULT)
    notify_session_state_change : Proc(IWRdsProtocolManager*, WTS_SESSION_ID*, UInt32, HRESULT)
    notify_settings_change : Proc(IWRdsProtocolManager*, WRDS_SETTINGS*, HRESULT)
    uninitialize : Proc(IWRdsProtocolManager*, HRESULT)
  end

  struct IWRdsProtocolManager
    lpVtbl : IWRdsProtocolManagerVTbl*
  end

  struct IWRdsProtocolListenerVTbl
    query_interface : Proc(IWRdsProtocolListener*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolListener*, UInt32)
    release : Proc(IWRdsProtocolListener*, UInt32)
    get_settings : Proc(IWRdsProtocolListener*, WRDS_LISTENER_SETTING_LEVEL, WRDS_LISTENER_SETTINGS*, HRESULT)
    start_listen : Proc(IWRdsProtocolListener*, IWRdsProtocolListenerCallback, HRESULT)
    stop_listen : Proc(IWRdsProtocolListener*, HRESULT)
  end

  struct IWRdsProtocolListener
    lpVtbl : IWRdsProtocolListenerVTbl*
  end

  struct IWRdsProtocolListenerCallbackVTbl
    query_interface : Proc(IWRdsProtocolListenerCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolListenerCallback*, UInt32)
    release : Proc(IWRdsProtocolListenerCallback*, UInt32)
    on_connected : Proc(IWRdsProtocolListenerCallback*, IWRdsProtocolConnection, WRDS_CONNECTION_SETTINGS*, IWRdsProtocolConnectionCallback*, HRESULT)
  end

  struct IWRdsProtocolListenerCallback
    lpVtbl : IWRdsProtocolListenerCallbackVTbl*
  end

  struct IWRdsProtocolConnectionVTbl
    query_interface : Proc(IWRdsProtocolConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolConnection*, UInt32)
    release : Proc(IWRdsProtocolConnection*, UInt32)
    get_logon_error_redirector : Proc(IWRdsProtocolConnection*, IWRdsProtocolLogonErrorRedirector*, HRESULT)
    accept_connection : Proc(IWRdsProtocolConnection*, HRESULT)
    get_client_data : Proc(IWRdsProtocolConnection*, WTS_CLIENT_DATA*, HRESULT)
    get_client_monitor_data : Proc(IWRdsProtocolConnection*, UInt32*, UInt32*, HRESULT)
    get_user_credentials : Proc(IWRdsProtocolConnection*, WTS_USER_CREDENTIAL*, HRESULT)
    get_license_connection : Proc(IWRdsProtocolConnection*, IWRdsProtocolLicenseConnection*, HRESULT)
    authenticate_client_to_session : Proc(IWRdsProtocolConnection*, WTS_SESSION_ID*, HRESULT)
    notify_session_id : Proc(IWRdsProtocolConnection*, WTS_SESSION_ID*, HANDLE_PTR, HRESULT)
    get_input_handles : Proc(IWRdsProtocolConnection*, HANDLE_PTR*, HANDLE_PTR*, HANDLE_PTR*, HRESULT)
    get_video_handle : Proc(IWRdsProtocolConnection*, HANDLE_PTR*, HRESULT)
    connect_notify : Proc(IWRdsProtocolConnection*, UInt32, HRESULT)
    is_user_allowed_to_logon : Proc(IWRdsProtocolConnection*, UInt32, HANDLE_PTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    session_arbitration_enumeration : Proc(IWRdsProtocolConnection*, HANDLE_PTR, LibC::BOOL, UInt32*, UInt32*, HRESULT)
    logon_notify : Proc(IWRdsProtocolConnection*, HANDLE_PTR, LibC::LPWSTR, LibC::LPWSTR, WTS_SESSION_ID*, WRDS_CONNECTION_SETTINGS*, HRESULT)
    pre_disconnect : Proc(IWRdsProtocolConnection*, UInt32, HRESULT)
    disconnect_notify : Proc(IWRdsProtocolConnection*, HRESULT)
    close : Proc(IWRdsProtocolConnection*, HRESULT)
    get_protocol_status : Proc(IWRdsProtocolConnection*, WTS_PROTOCOL_STATUS*, HRESULT)
    get_last_input_time : Proc(IWRdsProtocolConnection*, UInt64*, HRESULT)
    set_error_info : Proc(IWRdsProtocolConnection*, UInt32, HRESULT)
    create_virtual_channel : Proc(IWRdsProtocolConnection*, PSTR, LibC::BOOL, UInt32, LibC::UINT_PTR*, HRESULT)
    query_property : Proc(IWRdsProtocolConnection*, Guid, UInt32, UInt32, WTS_PROPERTY_VALUE*, WTS_PROPERTY_VALUE*, HRESULT)
    get_shadow_connection : Proc(IWRdsProtocolConnection*, IWRdsProtocolShadowConnection*, HRESULT)
    notify_command_process_created : Proc(IWRdsProtocolConnection*, UInt32, HRESULT)
  end

  struct IWRdsProtocolConnection
    lpVtbl : IWRdsProtocolConnectionVTbl*
  end

  struct IWRdsProtocolConnectionCallbackVTbl
    query_interface : Proc(IWRdsProtocolConnectionCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolConnectionCallback*, UInt32)
    release : Proc(IWRdsProtocolConnectionCallback*, UInt32)
    on_ready : Proc(IWRdsProtocolConnectionCallback*, HRESULT)
    broken_connection : Proc(IWRdsProtocolConnectionCallback*, UInt32, UInt32, HRESULT)
    stop_screen_updates : Proc(IWRdsProtocolConnectionCallback*, HRESULT)
    redraw_window : Proc(IWRdsProtocolConnectionCallback*, WTS_SMALL_RECT*, HRESULT)
    get_connection_id : Proc(IWRdsProtocolConnectionCallback*, UInt32*, HRESULT)
  end

  struct IWRdsProtocolConnectionCallback
    lpVtbl : IWRdsProtocolConnectionCallbackVTbl*
  end

  struct IWRdsProtocolShadowConnectionVTbl
    query_interface : Proc(IWRdsProtocolShadowConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolShadowConnection*, UInt32)
    release : Proc(IWRdsProtocolShadowConnection*, UInt32)
    start : Proc(IWRdsProtocolShadowConnection*, LibC::LPWSTR, UInt32, UInt8, UInt16, IWRdsProtocolShadowCallback, HRESULT)
    stop : Proc(IWRdsProtocolShadowConnection*, HRESULT)
    do_target : Proc(IWRdsProtocolShadowConnection*, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR, HRESULT)
  end

  struct IWRdsProtocolShadowConnection
    lpVtbl : IWRdsProtocolShadowConnectionVTbl*
  end

  struct IWRdsProtocolShadowCallbackVTbl
    query_interface : Proc(IWRdsProtocolShadowCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolShadowCallback*, UInt32)
    release : Proc(IWRdsProtocolShadowCallback*, UInt32)
    stop_shadow : Proc(IWRdsProtocolShadowCallback*, HRESULT)
    invoke_target_shadow : Proc(IWRdsProtocolShadowCallback*, LibC::LPWSTR, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR, HRESULT)
  end

  struct IWRdsProtocolShadowCallback
    lpVtbl : IWRdsProtocolShadowCallbackVTbl*
  end

  struct IWRdsProtocolLicenseConnectionVTbl
    query_interface : Proc(IWRdsProtocolLicenseConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolLicenseConnection*, UInt32)
    release : Proc(IWRdsProtocolLicenseConnection*, UInt32)
    request_licensing_capabilities : Proc(IWRdsProtocolLicenseConnection*, WTS_LICENSE_CAPABILITIES*, UInt32*, HRESULT)
    send_client_license : Proc(IWRdsProtocolLicenseConnection*, UInt8*, UInt32, HRESULT)
    request_client_license : Proc(IWRdsProtocolLicenseConnection*, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)
    protocol_complete : Proc(IWRdsProtocolLicenseConnection*, UInt32, HRESULT)
  end

  struct IWRdsProtocolLicenseConnection
    lpVtbl : IWRdsProtocolLicenseConnectionVTbl*
  end

  struct IWRdsProtocolLogonErrorRedirectorVTbl
    query_interface : Proc(IWRdsProtocolLogonErrorRedirector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolLogonErrorRedirector*, UInt32)
    release : Proc(IWRdsProtocolLogonErrorRedirector*, UInt32)
    on_begin_painting : Proc(IWRdsProtocolLogonErrorRedirector*, HRESULT)
    redirect_status : Proc(IWRdsProtocolLogonErrorRedirector*, LibC::LPWSTR, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, HRESULT)
    redirect_message : Proc(IWRdsProtocolLogonErrorRedirector*, LibC::LPWSTR, LibC::LPWSTR, UInt32, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, HRESULT)
    redirect_logon_error : Proc(IWRdsProtocolLogonErrorRedirector*, Int32, Int32, LibC::LPWSTR, LibC::LPWSTR, UInt32, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, HRESULT)
  end

  struct IWRdsProtocolLogonErrorRedirector
    lpVtbl : IWRdsProtocolLogonErrorRedirectorVTbl*
  end

  struct IWRdsWddmIddPropsVTbl
    query_interface : Proc(IWRdsWddmIddProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsWddmIddProps*, UInt32)
    release : Proc(IWRdsWddmIddProps*, UInt32)
    get_hardware_id : Proc(IWRdsWddmIddProps*, Char*, UInt32, HRESULT)
    on_driver_load : Proc(IWRdsWddmIddProps*, UInt32, HANDLE_PTR, HRESULT)
    on_driver_unload : Proc(IWRdsWddmIddProps*, UInt32, HRESULT)
    enable_wddm_idd : Proc(IWRdsWddmIddProps*, LibC::BOOL, HRESULT)
  end

  struct IWRdsWddmIddProps
    lpVtbl : IWRdsWddmIddPropsVTbl*
  end

  struct IWRdsProtocolConnectionSettingsVTbl
    query_interface : Proc(IWRdsProtocolConnectionSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolConnectionSettings*, UInt32)
    release : Proc(IWRdsProtocolConnectionSettings*, UInt32)
    set_connection_setting : Proc(IWRdsProtocolConnectionSettings*, Guid, WTS_PROPERTY_VALUE*, HRESULT)
    get_connection_setting : Proc(IWRdsProtocolConnectionSettings*, Guid, WTS_PROPERTY_VALUE*, HRESULT)
  end

  struct IWRdsProtocolConnectionSettings
    lpVtbl : IWRdsProtocolConnectionSettingsVTbl*
  end

  struct IWRdsEnhancedFastReconnectArbitratorVTbl
    query_interface : Proc(IWRdsEnhancedFastReconnectArbitrator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsEnhancedFastReconnectArbitrator*, UInt32)
    release : Proc(IWRdsEnhancedFastReconnectArbitrator*, UInt32)
    get_session_for_enhanced_fast_reconnect : Proc(IWRdsEnhancedFastReconnectArbitrator*, Int32*, UInt32, Int32*, HRESULT)
  end

  struct IWRdsEnhancedFastReconnectArbitrator
    lpVtbl : IWRdsEnhancedFastReconnectArbitratorVTbl*
  end

  struct IRemoteDesktopClientSettingsVTbl
    query_interface : Proc(IRemoteDesktopClientSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRemoteDesktopClientSettings*, UInt32)
    release : Proc(IRemoteDesktopClientSettings*, UInt32)
    get_type_info_count : Proc(IRemoteDesktopClientSettings*, UInt32*, HRESULT)
    get_type_info : Proc(IRemoteDesktopClientSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRemoteDesktopClientSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRemoteDesktopClientSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    apply_settings : Proc(IRemoteDesktopClientSettings*, UInt8, HRESULT)
    retrieve_settings : Proc(IRemoteDesktopClientSettings*, UInt8*, HRESULT)
    get_rdp_property : Proc(IRemoteDesktopClientSettings*, UInt8, VARIANT*, HRESULT)
    set_rdp_property : Proc(IRemoteDesktopClientSettings*, UInt8, VARIANT, HRESULT)
  end

  struct IRemoteDesktopClientSettings
    lpVtbl : IRemoteDesktopClientSettingsVTbl*
  end

  struct IRemoteDesktopClientActionsVTbl
    query_interface : Proc(IRemoteDesktopClientActions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRemoteDesktopClientActions*, UInt32)
    release : Proc(IRemoteDesktopClientActions*, UInt32)
    get_type_info_count : Proc(IRemoteDesktopClientActions*, UInt32*, HRESULT)
    get_type_info : Proc(IRemoteDesktopClientActions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRemoteDesktopClientActions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRemoteDesktopClientActions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    suspend_screen_updates : Proc(IRemoteDesktopClientActions*, HRESULT)
    resume_screen_updates : Proc(IRemoteDesktopClientActions*, HRESULT)
    execute_remote_action : Proc(IRemoteDesktopClientActions*, RemoteActionType, HRESULT)
    get_snapshot : Proc(IRemoteDesktopClientActions*, SnapshotEncodingType, SnapshotFormatType, UInt32, UInt32, UInt8*, HRESULT)
  end

  struct IRemoteDesktopClientActions
    lpVtbl : IRemoteDesktopClientActionsVTbl*
  end

  struct IRemoteDesktopClientTouchPointerVTbl
    query_interface : Proc(IRemoteDesktopClientTouchPointer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRemoteDesktopClientTouchPointer*, UInt32)
    release : Proc(IRemoteDesktopClientTouchPointer*, UInt32)
    get_type_info_count : Proc(IRemoteDesktopClientTouchPointer*, UInt32*, HRESULT)
    get_type_info : Proc(IRemoteDesktopClientTouchPointer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRemoteDesktopClientTouchPointer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRemoteDesktopClientTouchPointer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    put_enabled : Proc(IRemoteDesktopClientTouchPointer*, Int16, HRESULT)
    get_enabled : Proc(IRemoteDesktopClientTouchPointer*, Int16*, HRESULT)
    put_events_enabled : Proc(IRemoteDesktopClientTouchPointer*, Int16, HRESULT)
    get_events_enabled : Proc(IRemoteDesktopClientTouchPointer*, Int16*, HRESULT)
    put_pointer_speed : Proc(IRemoteDesktopClientTouchPointer*, UInt32, HRESULT)
    get_pointer_speed : Proc(IRemoteDesktopClientTouchPointer*, UInt32*, HRESULT)
  end

  struct IRemoteDesktopClientTouchPointer
    lpVtbl : IRemoteDesktopClientTouchPointerVTbl*
  end

  struct IRemoteDesktopClientVTbl
    query_interface : Proc(IRemoteDesktopClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRemoteDesktopClient*, UInt32)
    release : Proc(IRemoteDesktopClient*, UInt32)
    get_type_info_count : Proc(IRemoteDesktopClient*, UInt32*, HRESULT)
    get_type_info : Proc(IRemoteDesktopClient*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRemoteDesktopClient*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRemoteDesktopClient*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    connect : Proc(IRemoteDesktopClient*, HRESULT)
    disconnect : Proc(IRemoteDesktopClient*, HRESULT)
    reconnect : Proc(IRemoteDesktopClient*, UInt32, UInt32, HRESULT)
    get_settings : Proc(IRemoteDesktopClient*, IRemoteDesktopClientSettings*, HRESULT)
    get_actions : Proc(IRemoteDesktopClient*, IRemoteDesktopClientActions*, HRESULT)
    get_touch_pointer : Proc(IRemoteDesktopClient*, IRemoteDesktopClientTouchPointer*, HRESULT)
    delete_saved_credentials : Proc(IRemoteDesktopClient*, UInt8, HRESULT)
    update_session_display_settings : Proc(IRemoteDesktopClient*, UInt32, UInt32, HRESULT)
    attach_event : Proc(IRemoteDesktopClient*, UInt8, IDispatch, HRESULT)
    detach_event : Proc(IRemoteDesktopClient*, UInt8, IDispatch, HRESULT)
  end

  struct IRemoteDesktopClient
    lpVtbl : IRemoteDesktopClientVTbl*
  end

  struct IRemoteSystemAdditionalInfoProviderVTbl
    query_interface : Proc(IRemoteSystemAdditionalInfoProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRemoteSystemAdditionalInfoProvider*, UInt32)
    release : Proc(IRemoteSystemAdditionalInfoProvider*, UInt32)
    get_additional_info : Proc(IRemoteSystemAdditionalInfoProvider*, HSTRING*, Guid*, Void**, HRESULT)
  end

  struct IRemoteSystemAdditionalInfoProvider
    lpVtbl : IRemoteSystemAdditionalInfoProviderVTbl*
  end


  # Params # logonid : UInt32 [In]
  fun WTSStopRemoteControlSession(logonid : UInt32) : LibC::BOOL

  # Params # ptargetservername : LibC::LPWSTR [In],targetlogonid : UInt32 [In],hotkeyvk : UInt8 [In],hotkeymodifiers : UInt16 [In]
  fun WTSStartRemoteControlSessionW(ptargetservername : LibC::LPWSTR, targetlogonid : UInt32, hotkeyvk : UInt8, hotkeymodifiers : UInt16) : LibC::BOOL

  # Params # ptargetservername : PSTR [In],targetlogonid : UInt32 [In],hotkeyvk : UInt8 [In],hotkeymodifiers : UInt16 [In]
  fun WTSStartRemoteControlSessionA(ptargetservername : PSTR, targetlogonid : UInt32, hotkeyvk : UInt8, hotkeymodifiers : UInt16) : LibC::BOOL

  # Params # logonid : UInt32 [In],targetlogonid : UInt32 [In],ppassword : PSTR [In],bwait : LibC::BOOL [In]
  fun WTSConnectSessionA(logonid : UInt32, targetlogonid : UInt32, ppassword : PSTR, bwait : LibC::BOOL) : LibC::BOOL

  # Params # logonid : UInt32 [In],targetlogonid : UInt32 [In],ppassword : LibC::LPWSTR [In],bwait : LibC::BOOL [In]
  fun WTSConnectSessionW(logonid : UInt32, targetlogonid : UInt32, ppassword : LibC::LPWSTR, bwait : LibC::BOOL) : LibC::BOOL

  # Params # pdomainname : LibC::LPWSTR [In],reserved : UInt32 [In],version : UInt32 [In],ppserverinfo : WTS_SERVER_INFOW** [In],pcount : UInt32* [In]
  fun WTSEnumerateServersW(pdomainname : LibC::LPWSTR, reserved : UInt32, version : UInt32, ppserverinfo : WTS_SERVER_INFOW**, pcount : UInt32*) : LibC::BOOL

  # Params # pdomainname : PSTR [In],reserved : UInt32 [In],version : UInt32 [In],ppserverinfo : WTS_SERVER_INFOA** [In],pcount : UInt32* [In]
  fun WTSEnumerateServersA(pdomainname : PSTR, reserved : UInt32, version : UInt32, ppserverinfo : WTS_SERVER_INFOA**, pcount : UInt32*) : LibC::BOOL

  # Params # pservername : LibC::LPWSTR [In]
  fun WTSOpenServerW(pservername : LibC::LPWSTR) : LibC::HANDLE

  # Params # pservername : PSTR [In]
  fun WTSOpenServerA(pservername : PSTR) : LibC::HANDLE

  # Params # pservername : LibC::LPWSTR [In]
  fun WTSOpenServerExW(pservername : LibC::LPWSTR) : LibC::HANDLE

  # Params # pservername : PSTR [In]
  fun WTSOpenServerExA(pservername : PSTR) : LibC::HANDLE

  # Params # hserver : LibC::HANDLE [In]
  fun WTSCloseServer(hserver : LibC::HANDLE)

  # Params # hserver : LibC::HANDLE [In],reserved : UInt32 [In],version : UInt32 [In],ppsessioninfo : WTS_SESSION_INFOW** [In],pcount : UInt32* [In]
  fun WTSEnumerateSessionsW(hserver : LibC::HANDLE, reserved : UInt32, version : UInt32, ppsessioninfo : WTS_SESSION_INFOW**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],reserved : UInt32 [In],version : UInt32 [In],ppsessioninfo : WTS_SESSION_INFOA** [In],pcount : UInt32* [In]
  fun WTSEnumerateSessionsA(hserver : LibC::HANDLE, reserved : UInt32, version : UInt32, ppsessioninfo : WTS_SESSION_INFOA**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],plevel : UInt32* [In],filter : UInt32 [In],ppsessioninfo : WTS_SESSION_INFO_1W** [In],pcount : UInt32* [In]
  fun WTSEnumerateSessionsExW(hserver : LibC::HANDLE, plevel : UInt32*, filter : UInt32, ppsessioninfo : WTS_SESSION_INFO_1W**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],plevel : UInt32* [In],filter : UInt32 [In],ppsessioninfo : WTS_SESSION_INFO_1A** [In],pcount : UInt32* [In]
  fun WTSEnumerateSessionsExA(hserver : LibC::HANDLE, plevel : UInt32*, filter : UInt32, ppsessioninfo : WTS_SESSION_INFO_1A**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],reserved : UInt32 [In],version : UInt32 [In],ppprocessinfo : WTS_PROCESS_INFOW** [In],pcount : UInt32* [In]
  fun WTSEnumerateProcessesW(hserver : LibC::HANDLE, reserved : UInt32, version : UInt32, ppprocessinfo : WTS_PROCESS_INFOW**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],reserved : UInt32 [In],version : UInt32 [In],ppprocessinfo : WTS_PROCESS_INFOA** [In],pcount : UInt32* [In]
  fun WTSEnumerateProcessesA(hserver : LibC::HANDLE, reserved : UInt32, version : UInt32, ppprocessinfo : WTS_PROCESS_INFOA**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],processid : UInt32 [In],exitcode : UInt32 [In]
  fun WTSTerminateProcess(hserver : LibC::HANDLE, processid : UInt32, exitcode : UInt32) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],sessionid : UInt32 [In],wtsinfoclass : WTS_INFO_CLASS [In],ppbuffer : LibC::LPWSTR* [In],pbytesreturned : UInt32* [In]
  fun WTSQuerySessionInformationW(hserver : LibC::HANDLE, sessionid : UInt32, wtsinfoclass : WTS_INFO_CLASS, ppbuffer : LibC::LPWSTR*, pbytesreturned : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],sessionid : UInt32 [In],wtsinfoclass : WTS_INFO_CLASS [In],ppbuffer : PSTR* [In],pbytesreturned : UInt32* [In]
  fun WTSQuerySessionInformationA(hserver : LibC::HANDLE, sessionid : UInt32, wtsinfoclass : WTS_INFO_CLASS, ppbuffer : PSTR*, pbytesreturned : UInt32*) : LibC::BOOL

  # Params # pservername : LibC::LPWSTR [In],pusername : LibC::LPWSTR [In],wtsconfigclass : WTS_CONFIG_CLASS [In],ppbuffer : LibC::LPWSTR* [In],pbytesreturned : UInt32* [In]
  fun WTSQueryUserConfigW(pservername : LibC::LPWSTR, pusername : LibC::LPWSTR, wtsconfigclass : WTS_CONFIG_CLASS, ppbuffer : LibC::LPWSTR*, pbytesreturned : UInt32*) : LibC::BOOL

  # Params # pservername : PSTR [In],pusername : PSTR [In],wtsconfigclass : WTS_CONFIG_CLASS [In],ppbuffer : PSTR* [In],pbytesreturned : UInt32* [In]
  fun WTSQueryUserConfigA(pservername : PSTR, pusername : PSTR, wtsconfigclass : WTS_CONFIG_CLASS, ppbuffer : PSTR*, pbytesreturned : UInt32*) : LibC::BOOL

  # Params # pservername : LibC::LPWSTR [In],pusername : LibC::LPWSTR [In],wtsconfigclass : WTS_CONFIG_CLASS [In],pbuffer : LibC::LPWSTR [In],datalength : UInt32 [In]
  fun WTSSetUserConfigW(pservername : LibC::LPWSTR, pusername : LibC::LPWSTR, wtsconfigclass : WTS_CONFIG_CLASS, pbuffer : LibC::LPWSTR, datalength : UInt32) : LibC::BOOL

  # Params # pservername : PSTR [In],pusername : PSTR [In],wtsconfigclass : WTS_CONFIG_CLASS [In],pbuffer : PSTR [In],datalength : UInt32 [In]
  fun WTSSetUserConfigA(pservername : PSTR, pusername : PSTR, wtsconfigclass : WTS_CONFIG_CLASS, pbuffer : PSTR, datalength : UInt32) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],sessionid : UInt32 [In],ptitle : LibC::LPWSTR [In],titlelength : UInt32 [In],pmessage : LibC::LPWSTR [In],messagelength : UInt32 [In],style : MESSAGEBOX_STYLE [In],timeout : UInt32 [In],presponse : MESSAGEBOX_RESULT* [In],bwait : LibC::BOOL [In]
  fun WTSSendMessageW(hserver : LibC::HANDLE, sessionid : UInt32, ptitle : LibC::LPWSTR, titlelength : UInt32, pmessage : LibC::LPWSTR, messagelength : UInt32, style : MESSAGEBOX_STYLE, timeout : UInt32, presponse : MESSAGEBOX_RESULT*, bwait : LibC::BOOL) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],sessionid : UInt32 [In],ptitle : PSTR [In],titlelength : UInt32 [In],pmessage : PSTR [In],messagelength : UInt32 [In],style : MESSAGEBOX_STYLE [In],timeout : UInt32 [In],presponse : MESSAGEBOX_RESULT* [In],bwait : LibC::BOOL [In]
  fun WTSSendMessageA(hserver : LibC::HANDLE, sessionid : UInt32, ptitle : PSTR, titlelength : UInt32, pmessage : PSTR, messagelength : UInt32, style : MESSAGEBOX_STYLE, timeout : UInt32, presponse : MESSAGEBOX_RESULT*, bwait : LibC::BOOL) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],sessionid : UInt32 [In],bwait : LibC::BOOL [In]
  fun WTSDisconnectSession(hserver : LibC::HANDLE, sessionid : UInt32, bwait : LibC::BOOL) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],sessionid : UInt32 [In],bwait : LibC::BOOL [In]
  fun WTSLogoffSession(hserver : LibC::HANDLE, sessionid : UInt32, bwait : LibC::BOOL) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],shutdownflag : UInt32 [In]
  fun WTSShutdownSystem(hserver : LibC::HANDLE, shutdownflag : UInt32) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],eventmask : UInt32 [In],peventflags : UInt32* [In]
  fun WTSWaitSystemEvent(hserver : LibC::HANDLE, eventmask : UInt32, peventflags : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],sessionid : UInt32 [In],pvirtualname : PSTR [In]
  fun WTSVirtualChannelOpen(hserver : LibC::HANDLE, sessionid : UInt32, pvirtualname : PSTR) : HwtsVirtualChannelHandle

  # Params # sessionid : UInt32 [In],pvirtualname : PSTR [In],flags : UInt32 [In]
  fun WTSVirtualChannelOpenEx(sessionid : UInt32, pvirtualname : PSTR, flags : UInt32) : HwtsVirtualChannelHandle

  # Params # hchannelhandle : LibC::HANDLE [In]
  fun WTSVirtualChannelClose(hchannelhandle : LibC::HANDLE) : LibC::BOOL

  # Params # hchannelhandle : LibC::HANDLE [In],timeout : UInt32 [In],buffer : PSTR [In],buffersize : UInt32 [In],pbytesread : UInt32* [In]
  fun WTSVirtualChannelRead(hchannelhandle : LibC::HANDLE, timeout : UInt32, buffer : PSTR, buffersize : UInt32, pbytesread : UInt32*) : LibC::BOOL

  # Params # hchannelhandle : LibC::HANDLE [In],buffer : PSTR [In],length : UInt32 [In],pbyteswritten : UInt32* [In]
  fun WTSVirtualChannelWrite(hchannelhandle : LibC::HANDLE, buffer : PSTR, length : UInt32, pbyteswritten : UInt32*) : LibC::BOOL

  # Params # hchannelhandle : LibC::HANDLE [In]
  fun WTSVirtualChannelPurgeInput(hchannelhandle : LibC::HANDLE) : LibC::BOOL

  # Params # hchannelhandle : LibC::HANDLE [In]
  fun WTSVirtualChannelPurgeOutput(hchannelhandle : LibC::HANDLE) : LibC::BOOL

  # Params # hchannelhandle : LibC::HANDLE [In],param1 : WTS_VIRTUAL_CLASS [In],ppbuffer : Void** [In],pbytesreturned : UInt32* [In]
  fun WTSVirtualChannelQuery(hchannelhandle : LibC::HANDLE, param1 : WTS_VIRTUAL_CLASS, ppbuffer : Void**, pbytesreturned : UInt32*) : LibC::BOOL

  # Params # pmemory : Void* [In]
  fun WTSFreeMemory(pmemory : Void*)

  # Params # hwnd : LibC::HANDLE [In],dwflags : UInt32 [In]
  fun WTSRegisterSessionNotification(hwnd : LibC::HANDLE, dwflags : UInt32) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun WTSUnRegisterSessionNotification(hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],hwnd : LibC::HANDLE [In],dwflags : UInt32 [In]
  fun WTSRegisterSessionNotificationEx(hserver : LibC::HANDLE, hwnd : LibC::HANDLE, dwflags : UInt32) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],hwnd : LibC::HANDLE [In]
  fun WTSUnRegisterSessionNotificationEx(hserver : LibC::HANDLE, hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # sessionid : UInt32 [In],phtoken : LibC::HANDLE* [In]
  fun WTSQueryUserToken(sessionid : UInt32, phtoken : LibC::HANDLE*) : LibC::BOOL

  # Params # wtstypeclass : WTS_TYPE_CLASS [In],pmemory : Void* [In],numberofentries : UInt32 [In]
  fun WTSFreeMemoryExW(wtstypeclass : WTS_TYPE_CLASS, pmemory : Void*, numberofentries : UInt32) : LibC::BOOL

  # Params # wtstypeclass : WTS_TYPE_CLASS [In],pmemory : Void* [In],numberofentries : UInt32 [In]
  fun WTSFreeMemoryExA(wtstypeclass : WTS_TYPE_CLASS, pmemory : Void*, numberofentries : UInt32) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],plevel : UInt32* [In],sessionid : UInt32 [In],ppprocessinfo : LibC::LPWSTR* [In],pcount : UInt32* [In]
  fun WTSEnumerateProcessesExW(hserver : LibC::HANDLE, plevel : UInt32*, sessionid : UInt32, ppprocessinfo : LibC::LPWSTR*, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],plevel : UInt32* [In],sessionid : UInt32 [In],ppprocessinfo : PSTR* [In],pcount : UInt32* [In]
  fun WTSEnumerateProcessesExA(hserver : LibC::HANDLE, plevel : UInt32*, sessionid : UInt32, ppprocessinfo : PSTR*, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plisteners : UInt16** [In],pcount : UInt32* [In]
  fun WTSEnumerateListenersW(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plisteners : UInt16**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plisteners : Int8** [In],pcount : UInt32* [In]
  fun WTSEnumerateListenersA(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plisteners : Int8**, pcount : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : LibC::LPWSTR [In],pbuffer : WTSLISTENERCONFIGW* [In]
  fun WTSQueryListenerConfigW(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : LibC::LPWSTR, pbuffer : WTSLISTENERCONFIGW*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : PSTR [In],pbuffer : WTSLISTENERCONFIGA* [In]
  fun WTSQueryListenerConfigA(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : PSTR, pbuffer : WTSLISTENERCONFIGA*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : LibC::LPWSTR [In],pbuffer : WTSLISTENERCONFIGW* [In],flag : UInt32 [In]
  fun WTSCreateListenerW(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : LibC::LPWSTR, pbuffer : WTSLISTENERCONFIGW*, flag : UInt32) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : PSTR [In],pbuffer : WTSLISTENERCONFIGA* [In],flag : UInt32 [In]
  fun WTSCreateListenerA(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : PSTR, pbuffer : WTSLISTENERCONFIGA*, flag : UInt32) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : LibC::LPWSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun WTSSetListenerSecurityW(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : LibC::LPWSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : PSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun WTSSetListenerSecurityA(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : PSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : LibC::LPWSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun WTSGetListenerSecurityW(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : LibC::LPWSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # hserver : LibC::HANDLE [In],preserved : Void* [In],reserved : UInt32 [In],plistenername : PSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],nlength : UInt32 [In],lpnlengthneeded : UInt32* [In]
  fun WTSGetListenerSecurityA(hserver : LibC::HANDLE, preserved : Void*, reserved : UInt32, plistenername : PSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*, nlength : UInt32, lpnlengthneeded : UInt32*) : LibC::BOOL

  # Params # benable : LibC::BOOL [In]
  fun WTSEnableChildSessions(benable : LibC::BOOL) : LibC::BOOL

  # Params # pbenabled : LibC::BOOL* [In]
  fun WTSIsChildSessionsEnabled(pbenabled : LibC::BOOL*) : LibC::BOOL

  # Params # psessionid : UInt32* [In]
  fun WTSGetChildSessionId(psessionid : UInt32*) : LibC::BOOL

  # Params # prenderhintid : UInt64* [In],hwndowner : LibC::HANDLE [In],renderhinttype : UInt32 [In],cbhintdatalength : UInt32 [In],phintdata : UInt8* [In]
  fun WTSSetRenderHint(prenderhintid : UInt64*, hwndowner : LibC::HANDLE, renderhinttype : UInt32, cbhintdatalength : UInt32, phintdata : UInt8*) : HRESULT

  # Params # dwprocessid : UInt32 [In],psessionid : UInt32* [In]
  fun ProcessIdToSessionId(dwprocessid : UInt32, psessionid : UInt32*) : LibC::BOOL

  # Params # 
  fun WTSGetActiveConsoleSessionId : UInt32
end
