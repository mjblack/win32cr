require "../system/com.cr"
require "../foundation.cr"
require "../media/audio.cr"
require "../media/audio/apo.cr"
require "../system/com/structuredstorage.cr"
require "../system/winrt.cr"
require "../ui/windowsandmessaging.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wtsapi32.dll")]
{% else %}
@[Link("wtsapi32")]
{% end %}
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
  CLSID_TSUserExInterfaces = LibC::GUID.new(0x910dd01_u32, 0xdf8c_u16, 0x11d1_u16, StaticArray[0xae_u8, 0x27_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xa3_u8, 0x58_u8, 0x13_u8])
  CLSID_ADsTSUserEx = LibC::GUID.new(0xe2e9cae6_u32, 0x1e7b_u16, 0x4b8e_u16, StaticArray[0xba_u8, 0xbd_u8, 0xe9_u8, 0xbf_u8, 0x62_u8, 0x92_u8, 0xac_u8, 0x29_u8])
  CLSID_Workspace = LibC::GUID.new(0x4f1dfca6_u32, 0x3aad_u16, 0x48e1_u16, StaticArray[0x84_u8, 0x6_u8, 0x4b_u8, 0xc2_u8, 0x1a_u8, 0x50_u8, 0x1d_u8, 0x7c_u8])

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
    user_name : UInt8*
    client_name : UInt8*
    auth_type : AAAuthSchemes
    resource_name : UInt8*
    port_number : Int32
    protocol_name : UInt8*
    number_of_bytes_received : Int32
    number_of_bytes_transfered : Int32
    reason_for_disconnect : UInt8*
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

  IAudioEndpoint_GUID = "30a99515-1527-4451-af9f-00c5f0234daf"
  IID_IAudioEndpoint = LibC::GUID.new(0x30a99515_u32, 0x1527_u16, 0x4451_u16, StaticArray[0xaf_u8, 0x9f_u8, 0x0_u8, 0xc5_u8, 0xf0_u8, 0x23_u8, 0x4d_u8, 0xaf_u8])
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

  IAudioEndpointRT_GUID = "dfd2005f-a6e5-4d39-a265-939ada9fbb4d"
  IID_IAudioEndpointRT = LibC::GUID.new(0xdfd2005f_u32, 0xa6e5_u16, 0x4d39_u16, StaticArray[0xa2_u8, 0x65_u8, 0x93_u8, 0x9a_u8, 0xda_u8, 0x9f_u8, 0xbb_u8, 0x4d_u8])
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

  IAudioInputEndpointRT_GUID = "8026ab61-92b2-43c1-a1df-5c37ebd08d82"
  IID_IAudioInputEndpointRT = LibC::GUID.new(0x8026ab61_u32, 0x92b2_u16, 0x43c1_u16, StaticArray[0xa1_u8, 0xdf_u8, 0x5c_u8, 0x37_u8, 0xeb_u8, 0xd0_u8, 0x8d_u8, 0x82_u8])
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

  IAudioOutputEndpointRT_GUID = "8fa906e4-c31c-4e31-932e-19a66385e9aa"
  IID_IAudioOutputEndpointRT = LibC::GUID.new(0x8fa906e4_u32, 0xc31c_u16, 0x4e31_u16, StaticArray[0x93_u8, 0x2e_u8, 0x19_u8, 0xa6_u8, 0x63_u8, 0x85_u8, 0xe9_u8, 0xaa_u8])
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

  IAudioDeviceEndpoint_GUID = "d4952f5a-a0b2-4cc4-8b82-9358488dd8ac"
  IID_IAudioDeviceEndpoint = LibC::GUID.new(0xd4952f5a_u32, 0xa0b2_u16, 0x4cc4_u16, StaticArray[0x8b_u8, 0x82_u8, 0x93_u8, 0x58_u8, 0x48_u8, 0x8d_u8, 0xd8_u8, 0xac_u8])
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

  IAudioEndpointControl_GUID = "c684b72a-6df4-4774-bdf9-76b77509b653"
  IID_IAudioEndpointControl = LibC::GUID.new(0xc684b72a_u32, 0x6df4_u16, 0x4774_u16, StaticArray[0xbd_u8, 0xf9_u8, 0x76_u8, 0xb7_u8, 0x75_u8, 0x9_u8, 0xb6_u8, 0x53_u8])
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
    get_terminal_services_profile_path : Proc(IADsTSUserEx*, UInt8**, HRESULT)
    put_terminal_services_profile_path : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    get_terminal_services_home_directory : Proc(IADsTSUserEx*, UInt8**, HRESULT)
    put_terminal_services_home_directory : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    get_terminal_services_home_drive : Proc(IADsTSUserEx*, UInt8**, HRESULT)
    put_terminal_services_home_drive : Proc(IADsTSUserEx*, UInt8*, HRESULT)
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
    get_terminal_services_work_directory : Proc(IADsTSUserEx*, UInt8**, HRESULT)
    put_terminal_services_work_directory : Proc(IADsTSUserEx*, UInt8*, HRESULT)
    get_terminal_services_initial_program : Proc(IADsTSUserEx*, UInt8**, HRESULT)
    put_terminal_services_initial_program : Proc(IADsTSUserEx*, UInt8*, HRESULT)
  end

  IADsTSUserEx_GUID = "c4930e79-2989-4462-8a60-2fcf2f2955ef"
  IID_IADsTSUserEx = LibC::GUID.new(0xc4930e79_u32, 0x2989_u16, 0x4462_u16, StaticArray[0x8a_u8, 0x60_u8, 0x2f_u8, 0xcf_u8, 0x2f_u8, 0x29_u8, 0x55_u8, 0xef_u8])
  struct IADsTSUserEx
    lpVtbl : IADsTSUserExVTbl*
  end

  struct ITSGAuthorizeConnectionSinkVTbl
    query_interface : Proc(ITSGAuthorizeConnectionSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAuthorizeConnectionSink*, UInt32)
    release : Proc(ITSGAuthorizeConnectionSink*, UInt32)
    on_connection_authorized : Proc(ITSGAuthorizeConnectionSink*, HRESULT, Guid, UInt32, UInt8*, UInt32, UInt32, SESSION_TIMEOUT_ACTION_TYPE, AATrustClassID, UInt32*, HRESULT)
  end

  ITSGAuthorizeConnectionSink_GUID = "c27ece33-7781-4318-98ef-1cf2da7b7005"
  IID_ITSGAuthorizeConnectionSink = LibC::GUID.new(0xc27ece33_u32, 0x7781_u16, 0x4318_u16, StaticArray[0x98_u8, 0xef_u8, 0x1c_u8, 0xf2_u8, 0xda_u8, 0x7b_u8, 0x70_u8, 0x5_u8])
  struct ITSGAuthorizeConnectionSink
    lpVtbl : ITSGAuthorizeConnectionSinkVTbl*
  end

  struct ITSGAuthorizeResourceSinkVTbl
    query_interface : Proc(ITSGAuthorizeResourceSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAuthorizeResourceSink*, UInt32)
    release : Proc(ITSGAuthorizeResourceSink*, UInt32)
    on_channel_authorized : Proc(ITSGAuthorizeResourceSink*, HRESULT, Guid, Int32, UInt8**, UInt32, UInt8**, UInt32, HRESULT)
  end

  ITSGAuthorizeResourceSink_GUID = "feddfcd4-fa12-4435-ae55-7ad1a9779af7"
  IID_ITSGAuthorizeResourceSink = LibC::GUID.new(0xfeddfcd4_u32, 0xfa12_u16, 0x4435_u16, StaticArray[0xae_u8, 0x55_u8, 0x7a_u8, 0xd1_u8, 0xa9_u8, 0x77_u8, 0x9a_u8, 0xf7_u8])
  struct ITSGAuthorizeResourceSink
    lpVtbl : ITSGAuthorizeResourceSinkVTbl*
  end

  struct ITSGPolicyEngineVTbl
    query_interface : Proc(ITSGPolicyEngine*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGPolicyEngine*, UInt32)
    release : Proc(ITSGPolicyEngine*, UInt32)
    authorize_connection : Proc(ITSGPolicyEngine*, Guid, UInt8*, AAAuthSchemes, UInt8*, UInt8*, UInt8*, UInt32, UInt8*, UInt32, HANDLE_PTR, ITSGAuthorizeConnectionSink, HRESULT)
    authorize_resource : Proc(ITSGPolicyEngine*, Guid, Int32, UInt8*, UInt8**, UInt32, UInt8**, UInt32, UInt32, UInt8*, UInt8*, UInt32, ITSGAuthorizeResourceSink, HRESULT)
    refresh : Proc(ITSGPolicyEngine*, HRESULT)
    is_quarantine_enabled : Proc(ITSGPolicyEngine*, LibC::BOOL*, HRESULT)
  end

  ITSGPolicyEngine_GUID = "8bc24f08-6223-42f4-a5b4-8e37cd135bbd"
  IID_ITSGPolicyEngine = LibC::GUID.new(0x8bc24f08_u32, 0x6223_u16, 0x42f4_u16, StaticArray[0xa5_u8, 0xb4_u8, 0x8e_u8, 0x37_u8, 0xcd_u8, 0x13_u8, 0x5b_u8, 0xbd_u8])
  struct ITSGPolicyEngine
    lpVtbl : ITSGPolicyEngineVTbl*
  end

  struct ITSGAccountingEngineVTbl
    query_interface : Proc(ITSGAccountingEngine*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAccountingEngine*, UInt32)
    release : Proc(ITSGAccountingEngine*, UInt32)
    do_accounting : Proc(ITSGAccountingEngine*, AAAccountingDataType, AAAccountingData, HRESULT)
  end

  ITSGAccountingEngine_GUID = "4ce2a0c9-e874-4f1a-86f4-06bbb9115338"
  IID_ITSGAccountingEngine = LibC::GUID.new(0x4ce2a0c9_u32, 0xe874_u16, 0x4f1a_u16, StaticArray[0x86_u8, 0xf4_u8, 0x6_u8, 0xbb_u8, 0xb9_u8, 0x11_u8, 0x53_u8, 0x38_u8])
  struct ITSGAccountingEngine
    lpVtbl : ITSGAccountingEngineVTbl*
  end

  struct ITSGAuthenticateUserSinkVTbl
    query_interface : Proc(ITSGAuthenticateUserSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITSGAuthenticateUserSink*, UInt32)
    release : Proc(ITSGAuthenticateUserSink*, UInt32)
    on_user_authenticated : Proc(ITSGAuthenticateUserSink*, UInt8*, UInt8*, LibC::UINT_PTR, HANDLE_PTR, HRESULT)
    on_user_authentication_failed : Proc(ITSGAuthenticateUserSink*, LibC::UINT_PTR, HRESULT, HRESULT, HRESULT)
    reauthenticate_user : Proc(ITSGAuthenticateUserSink*, LibC::UINT_PTR, HRESULT)
    disconnect_user : Proc(ITSGAuthenticateUserSink*, LibC::UINT_PTR, HRESULT)
  end

  ITSGAuthenticateUserSink_GUID = "2c3e2e73-a782-47f9-8dfb-77ee1ed27a03"
  IID_ITSGAuthenticateUserSink = LibC::GUID.new(0x2c3e2e73_u32, 0xa782_u16, 0x47f9_u16, StaticArray[0x8d_u8, 0xfb_u8, 0x77_u8, 0xee_u8, 0x1e_u8, 0xd2_u8, 0x7a_u8, 0x3_u8])
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

  ITSGAuthenticationEngine_GUID = "9ee3e5bf-04ab-4691-998c-d7f622321a56"
  IID_ITSGAuthenticationEngine = LibC::GUID.new(0x9ee3e5bf_u32, 0x4ab_u16, 0x4691_u16, StaticArray[0x99_u8, 0x8c_u8, 0xd7_u8, 0xf6_u8, 0x22_u8, 0x32_u8, 0x1a_u8, 0x56_u8])
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

  IWTSSBPlugin_GUID = "dc44be78-b18d-4399-b210-641bf67a002c"
  IID_IWTSSBPlugin = LibC::GUID.new(0xdc44be78_u32, 0xb18d_u16, 0x4399_u16, StaticArray[0xb2_u8, 0x10_u8, 0x64_u8, 0x1b_u8, 0xf6_u8, 0x7a_u8, 0x0_u8, 0x2c_u8])
  struct IWTSSBPlugin
    lpVtbl : IWTSSBPluginVTbl*
  end

  struct IWorkspaceClientExtVTbl
    query_interface : Proc(IWorkspaceClientExt*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceClientExt*, UInt32)
    release : Proc(IWorkspaceClientExt*, UInt32)
    get_resource_id : Proc(IWorkspaceClientExt*, UInt8**, HRESULT)
    get_resource_display_name : Proc(IWorkspaceClientExt*, UInt8**, HRESULT)
    issue_disconnect : Proc(IWorkspaceClientExt*, HRESULT)
  end

  IWorkspaceClientExt_GUID = "12b952f4-41ca-4f21-a829-a6d07d9a16e5"
  IID_IWorkspaceClientExt = LibC::GUID.new(0x12b952f4_u32, 0x41ca_u16, 0x4f21_u16, StaticArray[0xa8_u8, 0x29_u8, 0xa6_u8, 0xd0_u8, 0x7d_u8, 0x9a_u8, 0x16_u8, 0xe5_u8])
  struct IWorkspaceClientExt
    lpVtbl : IWorkspaceClientExtVTbl*
  end

  struct IWorkspaceVTbl
    query_interface : Proc(IWorkspace*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspace*, UInt32)
    release : Proc(IWorkspace*, UInt32)
    get_workspace_names : Proc(IWorkspace*, SAFEARRAY**, HRESULT)
    start_remote_application : Proc(IWorkspace*, UInt8*, SAFEARRAY*, HRESULT)
    get_process_id : Proc(IWorkspace*, UInt32*, HRESULT)
  end

  IWorkspace_GUID = "b922bbb8-4c55-4fea-8496-beb0b44285e5"
  IID_IWorkspace = LibC::GUID.new(0xb922bbb8_u32, 0x4c55_u16, 0x4fea_u16, StaticArray[0x84_u8, 0x96_u8, 0xbe_u8, 0xb0_u8, 0xb4_u8, 0x42_u8, 0x85_u8, 0xe5_u8])
  struct IWorkspace
    lpVtbl : IWorkspaceVTbl*
  end

  struct IWorkspace2VTbl
    query_interface : Proc(IWorkspace2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspace2*, UInt32)
    release : Proc(IWorkspace2*, UInt32)
    get_workspace_names : Proc(IWorkspace2*, SAFEARRAY**, HRESULT)
    start_remote_application : Proc(IWorkspace2*, UInt8*, SAFEARRAY*, HRESULT)
    get_process_id : Proc(IWorkspace2*, UInt32*, HRESULT)
    start_remote_application_ex : Proc(IWorkspace2*, UInt8*, UInt8*, UInt8*, Int16, UInt8*, SAFEARRAY*, HRESULT)
  end

  IWorkspace2_GUID = "96d8d7cf-783e-4286-834c-ebc0e95f783c"
  IID_IWorkspace2 = LibC::GUID.new(0x96d8d7cf_u32, 0x783e_u16, 0x4286_u16, StaticArray[0x83_u8, 0x4c_u8, 0xeb_u8, 0xc0_u8, 0xe9_u8, 0x5f_u8, 0x78_u8, 0x3c_u8])
  struct IWorkspace2
    lpVtbl : IWorkspace2VTbl*
  end

  struct IWorkspace3VTbl
    query_interface : Proc(IWorkspace3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspace3*, UInt32)
    release : Proc(IWorkspace3*, UInt32)
    get_workspace_names : Proc(IWorkspace3*, SAFEARRAY**, HRESULT)
    start_remote_application : Proc(IWorkspace3*, UInt8*, SAFEARRAY*, HRESULT)
    get_process_id : Proc(IWorkspace3*, UInt32*, HRESULT)
    start_remote_application_ex : Proc(IWorkspace3*, UInt8*, UInt8*, UInt8*, Int16, UInt8*, SAFEARRAY*, HRESULT)
    get_claims_token2 : Proc(IWorkspace3*, UInt8*, UInt8*, UInt32, UInt32, RECT, UInt8**, HRESULT)
    set_claims_token : Proc(IWorkspace3*, UInt8*, UInt64, UInt8*, HRESULT)
  end

  IWorkspace3_GUID = "1becbe4a-d654-423b-afeb-be8d532c13c6"
  IID_IWorkspace3 = LibC::GUID.new(0x1becbe4a_u32, 0xd654_u16, 0x423b_u16, StaticArray[0xaf_u8, 0xeb_u8, 0xbe_u8, 0x8d_u8, 0x53_u8, 0x2c_u8, 0x13_u8, 0xc6_u8])
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

  IWorkspaceRegistration_GUID = "b922bbb8-4c55-4fea-8496-beb0b44285e6"
  IID_IWorkspaceRegistration = LibC::GUID.new(0xb922bbb8_u32, 0x4c55_u16, 0x4fea_u16, StaticArray[0x84_u8, 0x96_u8, 0xbe_u8, 0xb0_u8, 0xb4_u8, 0x42_u8, 0x85_u8, 0xe6_u8])
  struct IWorkspaceRegistration
    lpVtbl : IWorkspaceRegistrationVTbl*
  end

  struct IWorkspaceRegistration2VTbl
    query_interface : Proc(IWorkspaceRegistration2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceRegistration2*, UInt32)
    release : Proc(IWorkspaceRegistration2*, UInt32)
    add_resource : Proc(IWorkspaceRegistration2*, IWorkspaceClientExt, UInt32*, HRESULT)
    remove_resource : Proc(IWorkspaceRegistration2*, UInt32, HRESULT)
    add_resource_ex : Proc(IWorkspaceRegistration2*, IWorkspaceClientExt, UInt8*, UInt32*, Guid, HRESULT)
    remove_resource_ex : Proc(IWorkspaceRegistration2*, UInt32, Guid, HRESULT)
  end

  IWorkspaceRegistration2_GUID = "cf59f654-39bb-44d8-94d0-4635728957e9"
  IID_IWorkspaceRegistration2 = LibC::GUID.new(0xcf59f654_u32, 0x39bb_u16, 0x44d8_u16, StaticArray[0x94_u8, 0xd0_u8, 0x46_u8, 0x35_u8, 0x72_u8, 0x89_u8, 0x57_u8, 0xe9_u8])
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
    disconnect_workspace : Proc(IWorkspaceScriptable*, UInt8*, HRESULT)
    start_workspace : Proc(IWorkspaceScriptable*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, Int32, HRESULT)
    is_workspace_credential_specified : Proc(IWorkspaceScriptable*, UInt8*, Int16, Int16*, HRESULT)
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable*, Int16*, HRESULT)
    clear_workspace_credential : Proc(IWorkspaceScriptable*, UInt8*, HRESULT)
    on_authenticated : Proc(IWorkspaceScriptable*, UInt8*, UInt8*, HRESULT)
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable*, UInt8*, HRESULT)
  end

  IWorkspaceScriptable_GUID = "efea49a2-dda5-429d-8f42-b23b92c4c347"
  IID_IWorkspaceScriptable = LibC::GUID.new(0xefea49a2_u32, 0xdda5_u16, 0x429d_u16, StaticArray[0x8f_u8, 0x42_u8, 0xb2_u8, 0x3b_u8, 0x92_u8, 0xc4_u8, 0xc3_u8, 0x47_u8])
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
    disconnect_workspace : Proc(IWorkspaceScriptable2*, UInt8*, HRESULT)
    start_workspace : Proc(IWorkspaceScriptable2*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, Int32, HRESULT)
    is_workspace_credential_specified : Proc(IWorkspaceScriptable2*, UInt8*, Int16, Int16*, HRESULT)
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable2*, Int16*, HRESULT)
    clear_workspace_credential : Proc(IWorkspaceScriptable2*, UInt8*, HRESULT)
    on_authenticated : Proc(IWorkspaceScriptable2*, UInt8*, UInt8*, HRESULT)
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable2*, UInt8*, HRESULT)
    start_workspace_ex : Proc(IWorkspaceScriptable2*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, Int32, HRESULT)
    resource_dismissed : Proc(IWorkspaceScriptable2*, UInt8*, UInt8*, HRESULT)
  end

  IWorkspaceScriptable2_GUID = "efea49a2-dda5-429d-8f42-b33ba2c4c348"
  IID_IWorkspaceScriptable2 = LibC::GUID.new(0xefea49a2_u32, 0xdda5_u16, 0x429d_u16, StaticArray[0x8f_u8, 0x42_u8, 0xb3_u8, 0x3b_u8, 0xa2_u8, 0xc4_u8, 0xc3_u8, 0x48_u8])
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
    disconnect_workspace : Proc(IWorkspaceScriptable3*, UInt8*, HRESULT)
    start_workspace : Proc(IWorkspaceScriptable3*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, Int32, HRESULT)
    is_workspace_credential_specified : Proc(IWorkspaceScriptable3*, UInt8*, Int16, Int16*, HRESULT)
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable3*, Int16*, HRESULT)
    clear_workspace_credential : Proc(IWorkspaceScriptable3*, UInt8*, HRESULT)
    on_authenticated : Proc(IWorkspaceScriptable3*, UInt8*, UInt8*, HRESULT)
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable3*, UInt8*, HRESULT)
    start_workspace_ex : Proc(IWorkspaceScriptable3*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, Int32, HRESULT)
    resource_dismissed : Proc(IWorkspaceScriptable3*, UInt8*, UInt8*, HRESULT)
    start_workspace_ex2 : Proc(IWorkspaceScriptable3*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, Int32, UInt8*, Guid, HRESULT)
  end

  IWorkspaceScriptable3_GUID = "531e6512-2cbf-4bd2-80a5-d90a71636a9a"
  IID_IWorkspaceScriptable3 = LibC::GUID.new(0x531e6512_u32, 0x2cbf_u16, 0x4bd2_u16, StaticArray[0x80_u8, 0xa5_u8, 0xd9_u8, 0xa_u8, 0x71_u8, 0x63_u8, 0x6a_u8, 0x9a_u8])
  struct IWorkspaceScriptable3
    lpVtbl : IWorkspaceScriptable3VTbl*
  end

  struct IWorkspaceReportMessageVTbl
    query_interface : Proc(IWorkspaceReportMessage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWorkspaceReportMessage*, UInt32)
    release : Proc(IWorkspaceReportMessage*, UInt32)
    register_error_log_message : Proc(IWorkspaceReportMessage*, UInt8*, HRESULT)
    is_error_message_registered : Proc(IWorkspaceReportMessage*, UInt8*, UInt32, UInt8*, UInt32, Int16*, HRESULT)
    register_error_event : Proc(IWorkspaceReportMessage*, UInt8*, UInt32, UInt8*, UInt32, HRESULT)
  end

  IWorkspaceReportMessage_GUID = "a7c06739-500f-4e8c-99a8-2bd6955899eb"
  IID_IWorkspaceReportMessage = LibC::GUID.new(0xa7c06739_u32, 0x500f_u16, 0x4e8c_u16, StaticArray[0x99_u8, 0xa8_u8, 0x2b_u8, 0xd6_u8, 0x95_u8, 0x58_u8, 0x99_u8, 0xeb_u8])
  struct IWorkspaceReportMessage
    lpVtbl : IWorkspaceReportMessageVTbl*
  end

  struct IITSWkspEventsVTbl
    query_interface : Proc(IITSWkspEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IITSWkspEvents*, UInt32)
    release : Proc(IITSWkspEvents*, UInt32)
    get_type_info_count : Proc(IITSWkspEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IITSWkspEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IITSWkspEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IITSWkspEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IITSWkspEvents_GUID = "b922bbb8-4c55-4fea-8496-beb0b44285e9"
  IID_IITSWkspEvents = LibC::GUID.new(0xb922bbb8_u32, 0x4c55_u16, 0x4fea_u16, StaticArray[0x84_u8, 0x96_u8, 0xbe_u8, 0xb0_u8, 0xb4_u8, 0x42_u8, 0x85_u8, 0xe9_u8])
  struct IITSWkspEvents
    lpVtbl : IITSWkspEventsVTbl*
  end

  struct ITsSbPluginVTbl
    query_interface : Proc(ITsSbPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbPlugin*, UInt32)
    release : Proc(ITsSbPlugin*, UInt32)
    initialize : Proc(ITsSbPlugin*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbPlugin*, HRESULT, HRESULT)
  end

  ITsSbPlugin_GUID = "48cd7406-caab-465f-a5d6-baa863b9ea4f"
  IID_ITsSbPlugin = LibC::GUID.new(0x48cd7406_u32, 0xcaab_u16, 0x465f_u16, StaticArray[0xa5_u8, 0xd6_u8, 0xba_u8, 0xa8_u8, 0x63_u8, 0xb9_u8, 0xea_u8, 0x4f_u8])
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

  ITsSbResourcePlugin_GUID = "ea8db42c-98ed-4535-a88b-2a164f35490f"
  IID_ITsSbResourcePlugin = LibC::GUID.new(0xea8db42c_u32, 0x98ed_u16, 0x4535_u16, StaticArray[0xa8_u8, 0x8b_u8, 0x2a_u8, 0x16_u8, 0x4f_u8, 0x35_u8, 0x49_u8, 0xf_u8])
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

  ITsSbServiceNotification_GUID = "86cb68ae-86e0-4f57-8a64-bb7406bc5550"
  IID_ITsSbServiceNotification = LibC::GUID.new(0x86cb68ae_u32, 0x86e0_u16, 0x4f57_u16, StaticArray[0x8a_u8, 0x64_u8, 0xbb_u8, 0x74_u8, 0x6_u8, 0xbc_u8, 0x55_u8, 0x50_u8])
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

  ITsSbLoadBalancing_GUID = "24329274-9eb7-11dc-ae98-f2b456d89593"
  IID_ITsSbLoadBalancing = LibC::GUID.new(0x24329274_u32, 0x9eb7_u16, 0x11dc_u16, StaticArray[0xae_u8, 0x98_u8, 0xf2_u8, 0xb4_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
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

  ITsSbPlacement_GUID = "daadee5f-6d32-480e-9e36-ddab2329f06d"
  IID_ITsSbPlacement = LibC::GUID.new(0xdaadee5f_u32, 0x6d32_u16, 0x480e_u16, StaticArray[0x9e_u8, 0x36_u8, 0xdd_u8, 0xab_u8, 0x23_u8, 0x29_u8, 0xf0_u8, 0x6d_u8])
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

  ITsSbOrchestration_GUID = "64fc1172-9eb7-11dc-8b00-3aba56d89593"
  IID_ITsSbOrchestration = LibC::GUID.new(0x64fc1172_u32, 0x9eb7_u16, 0x11dc_u16, StaticArray[0x8b_u8, 0x0_u8, 0x3a_u8, 0xba_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
  struct ITsSbOrchestration
    lpVtbl : ITsSbOrchestrationVTbl*
  end

  struct ITsSbEnvironmentVTbl
    query_interface : Proc(ITsSbEnvironment*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbEnvironment*, UInt32)
    release : Proc(ITsSbEnvironment*, UInt32)
    get_name : Proc(ITsSbEnvironment*, UInt8**, HRESULT)
    get_server_weight : Proc(ITsSbEnvironment*, UInt32*, HRESULT)
    get_environment_property_set : Proc(ITsSbEnvironment*, ITsSbEnvironmentPropertySet*, HRESULT)
    put_environment_property_set : Proc(ITsSbEnvironment*, ITsSbEnvironmentPropertySet, HRESULT)
  end

  ITsSbEnvironment_GUID = "8c87f7f7-bf51-4a5c-87bf-8e94fb6e2256"
  IID_ITsSbEnvironment = LibC::GUID.new(0x8c87f7f7_u32, 0xbf51_u16, 0x4a5c_u16, StaticArray[0x87_u8, 0xbf_u8, 0x8e_u8, 0x94_u8, 0xfb_u8, 0x6e_u8, 0x22_u8, 0x56_u8])
  struct ITsSbEnvironment
    lpVtbl : ITsSbEnvironmentVTbl*
  end

  struct ITsSbLoadBalanceResultVTbl
    query_interface : Proc(ITsSbLoadBalanceResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbLoadBalanceResult*, UInt32)
    release : Proc(ITsSbLoadBalanceResult*, UInt32)
    get_target_name : Proc(ITsSbLoadBalanceResult*, UInt8**, HRESULT)
  end

  ITsSbLoadBalanceResult_GUID = "24fdb7ac-fea6-11dc-9672-9a8956d89593"
  IID_ITsSbLoadBalanceResult = LibC::GUID.new(0x24fdb7ac_u32, 0xfea6_u16, 0x11dc_u16, StaticArray[0x96_u8, 0x72_u8, 0x9a_u8, 0x89_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
  struct ITsSbLoadBalanceResult
    lpVtbl : ITsSbLoadBalanceResultVTbl*
  end

  struct ITsSbTargetVTbl
    query_interface : Proc(ITsSbTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTarget*, UInt32)
    release : Proc(ITsSbTarget*, UInt32)
    get_target_name : Proc(ITsSbTarget*, UInt8**, HRESULT)
    put_target_name : Proc(ITsSbTarget*, UInt8*, HRESULT)
    get_farm_name : Proc(ITsSbTarget*, UInt8**, HRESULT)
    put_farm_name : Proc(ITsSbTarget*, UInt8*, HRESULT)
    get_target_fqdn : Proc(ITsSbTarget*, UInt8**, HRESULT)
    put_target_fqdn : Proc(ITsSbTarget*, UInt8*, HRESULT)
    get_target_netbios : Proc(ITsSbTarget*, UInt8**, HRESULT)
    put_target_netbios : Proc(ITsSbTarget*, UInt8*, HRESULT)
    get_ip_addresses : Proc(ITsSbTarget*, TSSD_ConnectionPoint*, UInt32*, HRESULT)
    put_ip_addresses : Proc(ITsSbTarget*, TSSD_ConnectionPoint*, UInt32, HRESULT)
    get_target_state : Proc(ITsSbTarget*, TARGET_STATE*, HRESULT)
    put_target_state : Proc(ITsSbTarget*, TARGET_STATE, HRESULT)
    get_target_property_set : Proc(ITsSbTarget*, ITsSbTargetPropertySet*, HRESULT)
    put_target_property_set : Proc(ITsSbTarget*, ITsSbTargetPropertySet, HRESULT)
    get_environment_name : Proc(ITsSbTarget*, UInt8**, HRESULT)
    put_environment_name : Proc(ITsSbTarget*, UInt8*, HRESULT)
    get_num_sessions : Proc(ITsSbTarget*, UInt32*, HRESULT)
    get_num_pending_connections : Proc(ITsSbTarget*, UInt32*, HRESULT)
    get_target_load : Proc(ITsSbTarget*, UInt32*, HRESULT)
  end

  ITsSbTarget_GUID = "16616ecc-272d-411d-b324-126893033856"
  IID_ITsSbTarget = LibC::GUID.new(0x16616ecc_u32, 0x272d_u16, 0x411d_u16, StaticArray[0xb3_u8, 0x24_u8, 0x12_u8, 0x68_u8, 0x93_u8, 0x3_u8, 0x38_u8, 0x56_u8])
  struct ITsSbTarget
    lpVtbl : ITsSbTargetVTbl*
  end

  struct ITsSbSessionVTbl
    query_interface : Proc(ITsSbSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbSession*, UInt32)
    release : Proc(ITsSbSession*, UInt32)
    get_session_id : Proc(ITsSbSession*, UInt32*, HRESULT)
    get_target_name : Proc(ITsSbSession*, UInt8**, HRESULT)
    put_target_name : Proc(ITsSbSession*, UInt8*, HRESULT)
    get_username : Proc(ITsSbSession*, UInt8**, HRESULT)
    get_domain : Proc(ITsSbSession*, UInt8**, HRESULT)
    get_state : Proc(ITsSbSession*, TSSESSION_STATE*, HRESULT)
    put_state : Proc(ITsSbSession*, TSSESSION_STATE, HRESULT)
    get_create_time : Proc(ITsSbSession*, FILETIME*, HRESULT)
    put_create_time : Proc(ITsSbSession*, FILETIME, HRESULT)
    get_disconnect_time : Proc(ITsSbSession*, FILETIME*, HRESULT)
    put_disconnect_time : Proc(ITsSbSession*, FILETIME, HRESULT)
    get_initial_program : Proc(ITsSbSession*, UInt8**, HRESULT)
    put_initial_program : Proc(ITsSbSession*, UInt8*, HRESULT)
    get_client_display : Proc(ITsSbSession*, CLIENT_DISPLAY*, HRESULT)
    put_client_display : Proc(ITsSbSession*, CLIENT_DISPLAY, HRESULT)
    get_protocol_type : Proc(ITsSbSession*, UInt32*, HRESULT)
    put_protocol_type : Proc(ITsSbSession*, UInt32, HRESULT)
  end

  ITsSbSession_GUID = "d453aac7-b1d8-4c5e-ba34-9afb4c8c5510"
  IID_ITsSbSession = LibC::GUID.new(0xd453aac7_u32, 0xb1d8_u16, 0x4c5e_u16, StaticArray[0xba_u8, 0x34_u8, 0x9a_u8, 0xfb_u8, 0x4c_u8, 0x8c_u8, 0x55_u8, 0x10_u8])
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

  ITsSbResourceNotification_GUID = "65d3e85a-c39b-11dc-b92d-3cd255d89593"
  IID_ITsSbResourceNotification = LibC::GUID.new(0x65d3e85a_u32, 0xc39b_u16, 0x11dc_u16, StaticArray[0xb9_u8, 0x2d_u8, 0x3c_u8, 0xd2_u8, 0x55_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
  struct ITsSbResourceNotification
    lpVtbl : ITsSbResourceNotificationVTbl*
  end

  struct ITsSbResourceNotificationExVTbl
    query_interface : Proc(ITsSbResourceNotificationEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbResourceNotificationEx*, UInt32)
    release : Proc(ITsSbResourceNotificationEx*, UInt32)
    notify_session_change_ex : Proc(ITsSbResourceNotificationEx*, UInt8*, UInt8*, UInt8*, UInt32, TSSESSION_STATE, HRESULT)
    notify_target_change_ex : Proc(ITsSbResourceNotificationEx*, UInt8*, UInt32, HRESULT)
    notify_client_connection_state_change_ex : Proc(ITsSbResourceNotificationEx*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, CONNECTION_CHANGE_NOTIFICATION, HRESULT)
  end

  ITsSbResourceNotificationEx_GUID = "a8a47fde-ca91-44d2-b897-3aa28a43b2b7"
  IID_ITsSbResourceNotificationEx = LibC::GUID.new(0xa8a47fde_u32, 0xca91_u16, 0x44d2_u16, StaticArray[0xb8_u8, 0x97_u8, 0x3a_u8, 0xa2_u8, 0x8a_u8, 0x43_u8, 0xb2_u8, 0xb7_u8])
  struct ITsSbResourceNotificationEx
    lpVtbl : ITsSbResourceNotificationExVTbl*
  end

  struct ITsSbTaskInfoVTbl
    query_interface : Proc(ITsSbTaskInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTaskInfo*, UInt32)
    release : Proc(ITsSbTaskInfo*, UInt32)
    get_target_id : Proc(ITsSbTaskInfo*, UInt8**, HRESULT)
    get_start_time : Proc(ITsSbTaskInfo*, FILETIME*, HRESULT)
    get_end_time : Proc(ITsSbTaskInfo*, FILETIME*, HRESULT)
    get_deadline : Proc(ITsSbTaskInfo*, FILETIME*, HRESULT)
    get_identifier : Proc(ITsSbTaskInfo*, UInt8**, HRESULT)
    get_label : Proc(ITsSbTaskInfo*, UInt8**, HRESULT)
    get_context : Proc(ITsSbTaskInfo*, SAFEARRAY**, HRESULT)
    get_plugin : Proc(ITsSbTaskInfo*, UInt8**, HRESULT)
    get_status : Proc(ITsSbTaskInfo*, RDV_TASK_STATUS*, HRESULT)
  end

  ITsSbTaskInfo_GUID = "523d1083-89be-48dd-99ea-04e82ffa7265"
  IID_ITsSbTaskInfo = LibC::GUID.new(0x523d1083_u32, 0x89be_u16, 0x48dd_u16, StaticArray[0x99_u8, 0xea_u8, 0x4_u8, 0xe8_u8, 0x2f_u8, 0xfa_u8, 0x72_u8, 0x65_u8])
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
    set_task_queue : Proc(ITsSbTaskPlugin*, UInt8*, UInt32, ITsSbTaskInfo*, HRESULT)
  end

  ITsSbTaskPlugin_GUID = "fa22ef0f-8705-41be-93bc-44bdbcf1c9c4"
  IID_ITsSbTaskPlugin = LibC::GUID.new(0xfa22ef0f_u32, 0x8705_u16, 0x41be_u16, StaticArray[0x93_u8, 0xbc_u8, 0x44_u8, 0xbd_u8, 0xbc_u8, 0xf1_u8, 0xc9_u8, 0xc4_u8])
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

  ITsSbPropertySet_GUID = "5c025171-bb1e-4baf-a212-6d5e9774b33b"
  IID_ITsSbPropertySet = LibC::GUID.new(0x5c025171_u32, 0xbb1e_u16, 0x4baf_u16, StaticArray[0xa2_u8, 0x12_u8, 0x6d_u8, 0x5e_u8, 0x97_u8, 0x74_u8, 0xb3_u8, 0x3b_u8])
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

  ITsSbPluginPropertySet_GUID = "95006e34-7eff-4b6c-bb40-49a4fda7cea6"
  IID_ITsSbPluginPropertySet = LibC::GUID.new(0x95006e34_u32, 0x7eff_u16, 0x4b6c_u16, StaticArray[0xbb_u8, 0x40_u8, 0x49_u8, 0xa4_u8, 0xfd_u8, 0xa7_u8, 0xce_u8, 0xa6_u8])
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

  ITsSbClientConnectionPropertySet_GUID = "e51995b0-46d6-11dd-aa21-cedc55d89593"
  IID_ITsSbClientConnectionPropertySet = LibC::GUID.new(0xe51995b0_u32, 0x46d6_u16, 0x11dd_u16, StaticArray[0xaa_u8, 0x21_u8, 0xce_u8, 0xdc_u8, 0x55_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
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

  ITsSbTargetPropertySet_GUID = "f7bda5d6-994c-4e11-a079-2763b61830ac"
  IID_ITsSbTargetPropertySet = LibC::GUID.new(0xf7bda5d6_u32, 0x994c_u16, 0x4e11_u16, StaticArray[0xa0_u8, 0x79_u8, 0x27_u8, 0x63_u8, 0xb6_u8, 0x18_u8, 0x30_u8, 0xac_u8])
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

  ITsSbEnvironmentPropertySet_GUID = "d0d1bf7e-7acf-11dd-a243-e51156d89593"
  IID_ITsSbEnvironmentPropertySet = LibC::GUID.new(0xd0d1bf7e_u32, 0x7acf_u16, 0x11dd_u16, StaticArray[0xa2_u8, 0x43_u8, 0xe5_u8, 0x11_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
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

  ITsSbBaseNotifySink_GUID = "808a6537-1282-4989-9e09-f43938b71722"
  IID_ITsSbBaseNotifySink = LibC::GUID.new(0x808a6537_u32, 0x1282_u16, 0x4989_u16, StaticArray[0x9e_u8, 0x9_u8, 0xf4_u8, 0x39_u8, 0x38_u8, 0xb7_u8, 0x17_u8, 0x22_u8])
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

  ITsSbPluginNotifySink_GUID = "44dfe30b-c3be-40f5-bf82-7a95bb795adf"
  IID_ITsSbPluginNotifySink = LibC::GUID.new(0x44dfe30b_u32, 0xc3be_u16, 0x40f5_u16, StaticArray[0xbf_u8, 0x82_u8, 0x7a_u8, 0x95_u8, 0xbb_u8, 0x79_u8, 0x5a_u8, 0xdf_u8])
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

  ITsSbLoadBalancingNotifySink_GUID = "5f8a8297-3244-4e6a-958a-27c822c1e141"
  IID_ITsSbLoadBalancingNotifySink = LibC::GUID.new(0x5f8a8297_u32, 0x3244_u16, 0x4e6a_u16, StaticArray[0x95_u8, 0x8a_u8, 0x27_u8, 0xc8_u8, 0x22_u8, 0xc1_u8, 0xe1_u8, 0x41_u8])
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

  ITsSbPlacementNotifySink_GUID = "68a0c487-2b4f-46c2-94a1-6ce685183634"
  IID_ITsSbPlacementNotifySink = LibC::GUID.new(0x68a0c487_u32, 0x2b4f_u16, 0x46c2_u16, StaticArray[0x94_u8, 0xa1_u8, 0x6c_u8, 0xe6_u8, 0x85_u8, 0x18_u8, 0x36_u8, 0x34_u8])
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

  ITsSbOrchestrationNotifySink_GUID = "36c37d61-926b-442f-bca5-118c6d50dcf2"
  IID_ITsSbOrchestrationNotifySink = LibC::GUID.new(0x36c37d61_u32, 0x926b_u16, 0x442f_u16, StaticArray[0xbc_u8, 0xa5_u8, 0x11_u8, 0x8c_u8, 0x6d_u8, 0x50_u8, 0xdc_u8, 0xf2_u8])
  struct ITsSbOrchestrationNotifySink
    lpVtbl : ITsSbOrchestrationNotifySinkVTbl*
  end

  struct ITsSbTaskPluginNotifySinkVTbl
    query_interface : Proc(ITsSbTaskPluginNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbTaskPluginNotifySink*, UInt32)
    release : Proc(ITsSbTaskPluginNotifySink*, UInt32)
    on_error : Proc(ITsSbTaskPluginNotifySink*, HRESULT, HRESULT)
    on_report_status : Proc(ITsSbTaskPluginNotifySink*, CLIENT_MESSAGE_TYPE, UInt32, HRESULT)
    on_set_task_time : Proc(ITsSbTaskPluginNotifySink*, UInt8*, FILETIME, FILETIME, FILETIME, UInt8*, UInt8*, UInt8*, UInt32, SAFEARRAY*, HRESULT)
    on_delete_task_time : Proc(ITsSbTaskPluginNotifySink*, UInt8*, UInt8*, HRESULT)
    on_update_task_status : Proc(ITsSbTaskPluginNotifySink*, UInt8*, UInt8*, RDV_TASK_STATUS, HRESULT)
    on_report_tasks : Proc(ITsSbTaskPluginNotifySink*, UInt8*, HRESULT)
  end

  ITsSbTaskPluginNotifySink_GUID = "6aaf899e-c2ec-45ee-aa37-45e60895261a"
  IID_ITsSbTaskPluginNotifySink = LibC::GUID.new(0x6aaf899e_u32, 0xc2ec_u16, 0x45ee_u16, StaticArray[0xaa_u8, 0x37_u8, 0x45_u8, 0xe6_u8, 0x8_u8, 0x95_u8, 0x26_u8, 0x1a_u8])
  struct ITsSbTaskPluginNotifySink
    lpVtbl : ITsSbTaskPluginNotifySinkVTbl*
  end

  struct ITsSbClientConnectionVTbl
    query_interface : Proc(ITsSbClientConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbClientConnection*, UInt32)
    release : Proc(ITsSbClientConnection*, UInt32)
    get_user_name : Proc(ITsSbClientConnection*, UInt8**, HRESULT)
    get_domain : Proc(ITsSbClientConnection*, UInt8**, HRESULT)
    get_initial_program : Proc(ITsSbClientConnection*, UInt8**, HRESULT)
    get_load_balance_result : Proc(ITsSbClientConnection*, ITsSbLoadBalanceResult*, HRESULT)
    get_farm_name : Proc(ITsSbClientConnection*, UInt8**, HRESULT)
    put_context : Proc(ITsSbClientConnection*, UInt8*, VARIANT, VARIANT*, HRESULT)
    get_context : Proc(ITsSbClientConnection*, UInt8*, VARIANT*, HRESULT)
    get_environment : Proc(ITsSbClientConnection*, ITsSbEnvironment*, HRESULT)
    get_connection_error : Proc(ITsSbClientConnection*, HRESULT)
    get_sam_user_account : Proc(ITsSbClientConnection*, UInt8**, HRESULT)
    get_client_connection_property_set : Proc(ITsSbClientConnection*, ITsSbClientConnectionPropertySet*, HRESULT)
    get_is_first_assignment : Proc(ITsSbClientConnection*, LibC::BOOL*, HRESULT)
    get_rd_farm_type : Proc(ITsSbClientConnection*, RD_FARM_TYPE*, HRESULT)
    get_user_sid_string : Proc(ITsSbClientConnection*, Int8**, HRESULT)
    get_disconnected_session : Proc(ITsSbClientConnection*, ITsSbSession*, HRESULT)
  end

  ITsSbClientConnection_GUID = "18857499-ad61-4b1b-b7df-cbcd41fb8338"
  IID_ITsSbClientConnection = LibC::GUID.new(0x18857499_u32, 0xad61_u16, 0x4b1b_u16, StaticArray[0xb7_u8, 0xdf_u8, 0xcb_u8, 0xcd_u8, 0x41_u8, 0xfb_u8, 0x83_u8, 0x38_u8])
  struct ITsSbClientConnection
    lpVtbl : ITsSbClientConnectionVTbl*
  end

  struct ITsSbProviderVTbl
    query_interface : Proc(ITsSbProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbProvider*, UInt32)
    release : Proc(ITsSbProvider*, UInt32)
    create_target_object : Proc(ITsSbProvider*, UInt8*, UInt8*, ITsSbTarget*, HRESULT)
    create_load_balance_result_object : Proc(ITsSbProvider*, UInt8*, ITsSbLoadBalanceResult*, HRESULT)
    create_session_object : Proc(ITsSbProvider*, UInt8*, UInt8*, UInt8*, UInt32, ITsSbSession*, HRESULT)
    create_plugin_property_set : Proc(ITsSbProvider*, ITsSbPluginPropertySet*, HRESULT)
    create_target_property_set_object : Proc(ITsSbProvider*, ITsSbTargetPropertySet*, HRESULT)
    create_environment_object : Proc(ITsSbProvider*, UInt8*, UInt32, ITsSbEnvironment*, HRESULT)
    get_resource_plugin_store : Proc(ITsSbProvider*, ITsSbResourcePluginStore*, HRESULT)
    get_filter_plugin_store : Proc(ITsSbProvider*, ITsSbFilterPluginStore*, HRESULT)
    register_for_notification : Proc(ITsSbProvider*, UInt32, UInt8*, ITsSbResourceNotification, HRESULT)
    un_register_for_notification : Proc(ITsSbProvider*, UInt32, UInt8*, HRESULT)
    get_instance_of_global_store : Proc(ITsSbProvider*, ITsSbGlobalStore*, HRESULT)
    create_environment_property_set_object : Proc(ITsSbProvider*, ITsSbEnvironmentPropertySet*, HRESULT)
  end

  ITsSbProvider_GUID = "87a4098f-6d7b-44dd-bc17-8ce44e370d52"
  IID_ITsSbProvider = LibC::GUID.new(0x87a4098f_u32, 0x6d7b_u16, 0x44dd_u16, StaticArray[0xbc_u8, 0x17_u8, 0x8c_u8, 0xe4_u8, 0x4e_u8, 0x37_u8, 0xd_u8, 0x52_u8])
  struct ITsSbProvider
    lpVtbl : ITsSbProviderVTbl*
  end

  struct ITsSbResourcePluginStoreVTbl
    query_interface : Proc(ITsSbResourcePluginStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbResourcePluginStore*, UInt32)
    release : Proc(ITsSbResourcePluginStore*, UInt32)
    query_target : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, ITsSbTarget*, HRESULT)
    query_session_by_session_id : Proc(ITsSbResourcePluginStore*, UInt32, UInt8*, ITsSbSession*, HRESULT)
    add_target_to_store : Proc(ITsSbResourcePluginStore*, ITsSbTarget, HRESULT)
    add_session_to_store : Proc(ITsSbResourcePluginStore*, ITsSbSession, HRESULT)
    add_environment_to_store : Proc(ITsSbResourcePluginStore*, ITsSbEnvironment, HRESULT)
    remove_environment_from_store : Proc(ITsSbResourcePluginStore*, UInt8*, LibC::BOOL, HRESULT)
    enumerate_farms : Proc(ITsSbResourcePluginStore*, UInt32*, SAFEARRAY**, HRESULT)
    query_environment : Proc(ITsSbResourcePluginStore*, UInt8*, ITsSbEnvironment*, HRESULT)
    enumerate_environments : Proc(ITsSbResourcePluginStore*, UInt32*, ITsSbEnvironment**, HRESULT)
    save_target : Proc(ITsSbResourcePluginStore*, ITsSbTarget, LibC::BOOL, HRESULT)
    save_environment : Proc(ITsSbResourcePluginStore*, ITsSbEnvironment, LibC::BOOL, HRESULT)
    save_session : Proc(ITsSbResourcePluginStore*, ITsSbSession, HRESULT)
    set_target_property : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, VARIANT*, HRESULT)
    set_environment_property : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, VARIANT*, HRESULT)
    set_target_state : Proc(ITsSbResourcePluginStore*, UInt8*, TARGET_STATE, TARGET_STATE*, HRESULT)
    set_session_state : Proc(ITsSbResourcePluginStore*, ITsSbSession, HRESULT)
    enumerate_targets : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, TS_SB_SORT_BY, UInt8*, UInt32*, ITsSbTarget**, HRESULT)
    enumerate_sessions : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, TSSESSION_STATE*, UInt32*, ITsSbSession**, HRESULT)
    get_farm_property : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, VARIANT*, HRESULT)
    delete_target : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, HRESULT)
    set_target_property_with_version_check : Proc(ITsSbResourcePluginStore*, ITsSbTarget, UInt8*, VARIANT*, HRESULT)
    set_environment_property_with_version_check : Proc(ITsSbResourcePluginStore*, ITsSbEnvironment, UInt8*, VARIANT*, HRESULT)
    acquire_target_lock : Proc(ITsSbResourcePluginStore*, UInt8*, UInt32, IUnknown*, HRESULT)
    release_target_lock : Proc(ITsSbResourcePluginStore*, IUnknown, HRESULT)
    test_and_set_server_state : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, TARGET_STATE, TARGET_STATE, TARGET_STATE*, HRESULT)
    set_server_waiting_to_start : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, HRESULT)
    get_server_state : Proc(ITsSbResourcePluginStore*, UInt8*, UInt8*, TARGET_STATE*, HRESULT)
    set_server_drain_mode : Proc(ITsSbResourcePluginStore*, UInt8*, UInt32, HRESULT)
  end

  ITsSbResourcePluginStore_GUID = "5c38f65f-bcf1-4036-a6bf-9e3cccae0b63"
  IID_ITsSbResourcePluginStore = LibC::GUID.new(0x5c38f65f_u32, 0xbcf1_u16, 0x4036_u16, StaticArray[0xa6_u8, 0xbf_u8, 0x9e_u8, 0x3c_u8, 0xcc_u8, 0xae_u8, 0xb_u8, 0x63_u8])
  struct ITsSbResourcePluginStore
    lpVtbl : ITsSbResourcePluginStoreVTbl*
  end

  struct ITsSbFilterPluginStoreVTbl
    query_interface : Proc(ITsSbFilterPluginStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbFilterPluginStore*, UInt32)
    release : Proc(ITsSbFilterPluginStore*, UInt32)
    save_properties : Proc(ITsSbFilterPluginStore*, ITsSbPropertySet, HRESULT)
    enumerate_properties : Proc(ITsSbFilterPluginStore*, ITsSbPropertySet*, HRESULT)
    delete_properties : Proc(ITsSbFilterPluginStore*, UInt8*, HRESULT)
  end

  ITsSbFilterPluginStore_GUID = "85b44b0f-ed78-413f-9702-fa6d3b5ee755"
  IID_ITsSbFilterPluginStore = LibC::GUID.new(0x85b44b0f_u32, 0xed78_u16, 0x413f_u16, StaticArray[0x97_u8, 0x2_u8, 0xfa_u8, 0x6d_u8, 0x3b_u8, 0x5e_u8, 0xe7_u8, 0x55_u8])
  struct ITsSbFilterPluginStore
    lpVtbl : ITsSbFilterPluginStoreVTbl*
  end

  struct ITsSbGlobalStoreVTbl
    query_interface : Proc(ITsSbGlobalStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbGlobalStore*, UInt32)
    release : Proc(ITsSbGlobalStore*, UInt32)
    query_target : Proc(ITsSbGlobalStore*, UInt8*, UInt8*, UInt8*, ITsSbTarget*, HRESULT)
    query_session_by_session_id : Proc(ITsSbGlobalStore*, UInt8*, UInt32, UInt8*, ITsSbSession*, HRESULT)
    enumerate_farms : Proc(ITsSbGlobalStore*, UInt8*, UInt32*, SAFEARRAY**, HRESULT)
    enumerate_targets : Proc(ITsSbGlobalStore*, UInt8*, UInt8*, UInt8*, UInt32*, ITsSbTarget**, HRESULT)
    enumerate_environments_by_provider : Proc(ITsSbGlobalStore*, UInt8*, UInt32*, ITsSbEnvironment**, HRESULT)
    enumerate_sessions : Proc(ITsSbGlobalStore*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, TSSESSION_STATE*, UInt32*, ITsSbSession**, HRESULT)
    get_farm_property : Proc(ITsSbGlobalStore*, UInt8*, UInt8*, VARIANT*, HRESULT)
  end

  ITsSbGlobalStore_GUID = "9ab60f7b-bd72-4d9f-8a3a-a0ea5574e635"
  IID_ITsSbGlobalStore = LibC::GUID.new(0x9ab60f7b_u32, 0xbd72_u16, 0x4d9f_u16, StaticArray[0x8a_u8, 0x3a_u8, 0xa0_u8, 0xea_u8, 0x55_u8, 0x74_u8, 0xe6_u8, 0x35_u8])
  struct ITsSbGlobalStore
    lpVtbl : ITsSbGlobalStoreVTbl*
  end

  struct ITsSbProvisioningPluginNotifySinkVTbl
    query_interface : Proc(ITsSbProvisioningPluginNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbProvisioningPluginNotifySink*, UInt32)
    release : Proc(ITsSbProvisioningPluginNotifySink*, UInt32)
    on_job_created : Proc(ITsSbProvisioningPluginNotifySink*, VM_NOTIFY_INFO*, HRESULT)
    on_virtual_machine_status_changed : Proc(ITsSbProvisioningPluginNotifySink*, VM_NOTIFY_ENTRY*, VM_NOTIFY_STATUS, HRESULT, UInt8*, HRESULT)
    on_job_completed : Proc(ITsSbProvisioningPluginNotifySink*, HRESULT, UInt8*, HRESULT)
    on_job_cancelled : Proc(ITsSbProvisioningPluginNotifySink*, HRESULT)
    lock_virtual_machine : Proc(ITsSbProvisioningPluginNotifySink*, VM_NOTIFY_ENTRY*, HRESULT)
    on_virtual_machine_host_status_changed : Proc(ITsSbProvisioningPluginNotifySink*, UInt8*, VM_HOST_NOTIFY_STATUS, HRESULT, UInt8*, HRESULT)
  end

  ITsSbProvisioningPluginNotifySink_GUID = "aca87a8e-818b-4581-a032-49c3dfb9c701"
  IID_ITsSbProvisioningPluginNotifySink = LibC::GUID.new(0xaca87a8e_u32, 0x818b_u16, 0x4581_u16, StaticArray[0xa0_u8, 0x32_u8, 0x49_u8, 0xc3_u8, 0xdf_u8, 0xb9_u8, 0xc7_u8, 0x1_u8])
  struct ITsSbProvisioningPluginNotifySink
    lpVtbl : ITsSbProvisioningPluginNotifySinkVTbl*
  end

  struct ITsSbProvisioningVTbl
    query_interface : Proc(ITsSbProvisioning*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITsSbProvisioning*, UInt32)
    release : Proc(ITsSbProvisioning*, UInt32)
    initialize : Proc(ITsSbProvisioning*, ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet, HRESULT)
    terminate : Proc(ITsSbProvisioning*, HRESULT, HRESULT)
    create_virtual_machines : Proc(ITsSbProvisioning*, UInt8*, UInt8*, ITsSbProvisioningPluginNotifySink, HRESULT)
    patch_virtual_machines : Proc(ITsSbProvisioning*, UInt8*, UInt8*, ITsSbProvisioningPluginNotifySink, VM_PATCH_INFO*, HRESULT)
    delete_virtual_machines : Proc(ITsSbProvisioning*, UInt8*, UInt8*, ITsSbProvisioningPluginNotifySink, HRESULT)
    cancel_job : Proc(ITsSbProvisioning*, UInt8*, HRESULT)
  end

  ITsSbProvisioning_GUID = "2f6f0dbb-9e4f-462b-9c3f-fccc3dcb6232"
  IID_ITsSbProvisioning = LibC::GUID.new(0x2f6f0dbb_u32, 0x9e4f_u16, 0x462b_u16, StaticArray[0x9c_u8, 0x3f_u8, 0xfc_u8, 0xcc_u8, 0x3d_u8, 0xcb_u8, 0x62_u8, 0x32_u8])
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

  ITsSbGenericNotifySink_GUID = "4c4c8c4f-300b-46ad-9164-8468a7e7568c"
  IID_ITsSbGenericNotifySink = LibC::GUID.new(0x4c4c8c4f_u32, 0x300b_u16, 0x46ad_u16, StaticArray[0x91_u8, 0x64_u8, 0x84_u8, 0x68_u8, 0xa7_u8, 0xe7_u8, 0x56_u8, 0x8c_u8])
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
    get_plugin_name : Proc(ItsPubPlugin*, UInt8**, HRESULT)
    get_plugin_version : Proc(ItsPubPlugin*, UInt8**, HRESULT)
    resolve_resource : Proc(ItsPubPlugin*, UInt32*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  ItsPubPlugin_GUID = "70c04b05-f347-412b-822f-36c99c54ca45"
  IID_ItsPubPlugin = LibC::GUID.new(0x70c04b05_u32, 0xf347_u16, 0x412b_u16, StaticArray[0x82_u8, 0x2f_u8, 0x36_u8, 0xc9_u8, 0x9c_u8, 0x54_u8, 0xca_u8, 0x45_u8])
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
    get_plugin_name : Proc(ItsPubPlugin2*, UInt8**, HRESULT)
    get_plugin_version : Proc(ItsPubPlugin2*, UInt8**, HRESULT)
    resolve_resource : Proc(ItsPubPlugin2*, UInt32*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_resource2_list : Proc(ItsPubPlugin2*, LibC::LPWSTR, Int32*, Pluginresource2**, HRESULT)
    get_resource2 : Proc(ItsPubPlugin2*, LibC::LPWSTR, Int32, Pluginresource2*, HRESULT)
    resolve_personal_desktop : Proc(ItsPubPlugin2*, LibC::LPWSTR, LibC::LPWSTR, TSPUB_PLUGIN_PD_RESOLUTION_TYPE, TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE*, LibC::LPWSTR, HRESULT)
    delete_personal_desktop_assignment : Proc(ItsPubPlugin2*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  ItsPubPlugin2_GUID = "fa4ce418-aad7-4ec6-bad1-0a321ba465d5"
  IID_ItsPubPlugin2 = LibC::GUID.new(0xfa4ce418_u32, 0xaad7_u16, 0x4ec6_u16, StaticArray[0xba_u8, 0xd1_u8, 0xa_u8, 0x32_u8, 0x1b_u8, 0xa4_u8, 0x65_u8, 0xd5_u8])
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
    add_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8*, UInt8*, HRESULT)
    delete_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8*, HRESULT)
    get_registered_file_extensions : Proc(IWorkspaceResTypeRegistry*, Int16, SAFEARRAY**, HRESULT)
    get_resource_type_info : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8*, UInt8**, HRESULT)
    modify_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, UInt8*, UInt8*, HRESULT)
  end

  IWorkspaceResTypeRegistry_GUID = "1d428c79-6e2e-4351-a361-c0401a03a0ba"
  IID_IWorkspaceResTypeRegistry = LibC::GUID.new(0x1d428c79_u32, 0x6e2e_u16, 0x4351_u16, StaticArray[0xa3_u8, 0x61_u8, 0xc0_u8, 0x40_u8, 0x1a_u8, 0x3_u8, 0xa0_u8, 0xba_u8])
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

  IWTSPlugin_GUID = "a1230201-1439-4e62-a414-190d0ac3d40e"
  IID_IWTSPlugin = LibC::GUID.new(0xa1230201_u32, 0x1439_u16, 0x4e62_u16, StaticArray[0xa4_u8, 0x14_u8, 0x19_u8, 0xd_u8, 0xa_u8, 0xc3_u8, 0xd4_u8, 0xe_u8])
  struct IWTSPlugin
    lpVtbl : IWTSPluginVTbl*
  end

  struct IWTSListenerVTbl
    query_interface : Proc(IWTSListener*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSListener*, UInt32)
    release : Proc(IWTSListener*, UInt32)
    get_configuration : Proc(IWTSListener*, IPropertyBag*, HRESULT)
  end

  IWTSListener_GUID = "a1230206-9a39-4d58-8674-cdb4dff4e73b"
  IID_IWTSListener = LibC::GUID.new(0xa1230206_u32, 0x9a39_u16, 0x4d58_u16, StaticArray[0x86_u8, 0x74_u8, 0xcd_u8, 0xb4_u8, 0xdf_u8, 0xf4_u8, 0xe7_u8, 0x3b_u8])
  struct IWTSListener
    lpVtbl : IWTSListenerVTbl*
  end

  struct IWTSListenerCallbackVTbl
    query_interface : Proc(IWTSListenerCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSListenerCallback*, UInt32)
    release : Proc(IWTSListenerCallback*, UInt32)
    on_new_channel_connection : Proc(IWTSListenerCallback*, IWTSVirtualChannel, UInt8*, LibC::BOOL*, IWTSVirtualChannelCallback*, HRESULT)
  end

  IWTSListenerCallback_GUID = "a1230203-d6a7-11d8-b9fd-000bdbd1f198"
  IID_IWTSListenerCallback = LibC::GUID.new(0xa1230203_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
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

  IWTSVirtualChannelCallback_GUID = "a1230204-d6a7-11d8-b9fd-000bdbd1f198"
  IID_IWTSVirtualChannelCallback = LibC::GUID.new(0xa1230204_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
  struct IWTSVirtualChannelCallback
    lpVtbl : IWTSVirtualChannelCallbackVTbl*
  end

  struct IWTSVirtualChannelManagerVTbl
    query_interface : Proc(IWTSVirtualChannelManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSVirtualChannelManager*, UInt32)
    release : Proc(IWTSVirtualChannelManager*, UInt32)
    create_listener : Proc(IWTSVirtualChannelManager*, UInt8*, UInt32, IWTSListenerCallback, IWTSListener*, HRESULT)
  end

  IWTSVirtualChannelManager_GUID = "a1230205-d6a7-11d8-b9fd-000bdbd1f198"
  IID_IWTSVirtualChannelManager = LibC::GUID.new(0xa1230205_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
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

  IWTSVirtualChannel_GUID = "a1230207-d6a7-11d8-b9fd-000bdbd1f198"
  IID_IWTSVirtualChannel = LibC::GUID.new(0xa1230207_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
  struct IWTSVirtualChannel
    lpVtbl : IWTSVirtualChannelVTbl*
  end

  struct IWTSPluginServiceProviderVTbl
    query_interface : Proc(IWTSPluginServiceProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSPluginServiceProvider*, UInt32)
    release : Proc(IWTSPluginServiceProvider*, UInt32)
    get_service : Proc(IWTSPluginServiceProvider*, Guid, IUnknown*, HRESULT)
  end

  IWTSPluginServiceProvider_GUID = "d3e07363-087c-476c-86a7-dbb15f46ddb4"
  IID_IWTSPluginServiceProvider = LibC::GUID.new(0xd3e07363_u32, 0x87c_u16, 0x476c_u16, StaticArray[0x86_u8, 0xa7_u8, 0xdb_u8, 0xb1_u8, 0x5f_u8, 0x46_u8, 0xdd_u8, 0xb4_u8])
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

  IWTSBitmapRenderer_GUID = "5b7acc97-f3c9-46f7-8c5b-fa685d3441b1"
  IID_IWTSBitmapRenderer = LibC::GUID.new(0x5b7acc97_u32, 0xf3c9_u16, 0x46f7_u16, StaticArray[0x8c_u8, 0x5b_u8, 0xfa_u8, 0x68_u8, 0x5d_u8, 0x34_u8, 0x41_u8, 0xb1_u8])
  struct IWTSBitmapRenderer
    lpVtbl : IWTSBitmapRendererVTbl*
  end

  struct IWTSBitmapRendererCallbackVTbl
    query_interface : Proc(IWTSBitmapRendererCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSBitmapRendererCallback*, UInt32)
    release : Proc(IWTSBitmapRendererCallback*, UInt32)
    on_target_size_changed : Proc(IWTSBitmapRendererCallback*, RECT, HRESULT)
  end

  IWTSBitmapRendererCallback_GUID = "d782928e-fe4e-4e77-ae90-9cd0b3e3b353"
  IID_IWTSBitmapRendererCallback = LibC::GUID.new(0xd782928e_u32, 0xfe4e_u16, 0x4e77_u16, StaticArray[0xae_u8, 0x90_u8, 0x9c_u8, 0xd0_u8, 0xb3_u8, 0xe3_u8, 0xb3_u8, 0x53_u8])
  struct IWTSBitmapRendererCallback
    lpVtbl : IWTSBitmapRendererCallbackVTbl*
  end

  struct IWTSBitmapRenderServiceVTbl
    query_interface : Proc(IWTSBitmapRenderService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSBitmapRenderService*, UInt32)
    release : Proc(IWTSBitmapRenderService*, UInt32)
    get_mapped_renderer : Proc(IWTSBitmapRenderService*, UInt64, IWTSBitmapRendererCallback, IWTSBitmapRenderer*, HRESULT)
  end

  IWTSBitmapRenderService_GUID = "ea326091-05fe-40c1-b49c-3d2ef4626a0e"
  IID_IWTSBitmapRenderService = LibC::GUID.new(0xea326091_u32, 0x5fe_u16, 0x40c1_u16, StaticArray[0xb4_u8, 0x9c_u8, 0x3d_u8, 0x2e_u8, 0xf4_u8, 0x62_u8, 0x6a_u8, 0xe_u8])
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

  IWRdsGraphicsChannelEvents_GUID = "67f2368c-d674-4fae-66a5-d20628a640d2"
  IID_IWRdsGraphicsChannelEvents = LibC::GUID.new(0x67f2368c_u32, 0xd674_u16, 0x4fae_u16, StaticArray[0x66_u8, 0xa5_u8, 0xd2_u8, 0x6_u8, 0x28_u8, 0xa6_u8, 0x40_u8, 0xd2_u8])
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

  IWRdsGraphicsChannel_GUID = "684b7a0b-edff-43ad-d5a2-4a8d5388f401"
  IID_IWRdsGraphicsChannel = LibC::GUID.new(0x684b7a0b_u32, 0xedff_u16, 0x43ad_u16, StaticArray[0xd5_u8, 0xa2_u8, 0x4a_u8, 0x8d_u8, 0x53_u8, 0x88_u8, 0xf4_u8, 0x1_u8])
  struct IWRdsGraphicsChannel
    lpVtbl : IWRdsGraphicsChannelVTbl*
  end

  struct IWRdsGraphicsChannelManagerVTbl
    query_interface : Proc(IWRdsGraphicsChannelManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsGraphicsChannelManager*, UInt32)
    release : Proc(IWRdsGraphicsChannelManager*, UInt32)
    create_channel : Proc(IWRdsGraphicsChannelManager*, UInt8*, WRdsGraphicsChannelType, IWRdsGraphicsChannel*, HRESULT)
  end

  IWRdsGraphicsChannelManager_GUID = "0fd57159-e83e-476a-a8b9-4a7976e71e18"
  IID_IWRdsGraphicsChannelManager = LibC::GUID.new(0xfd57159_u32, 0xe83e_u16, 0x476a_u16, StaticArray[0xa8_u8, 0xb9_u8, 0x4a_u8, 0x79_u8, 0x76_u8, 0xe7_u8, 0x1e_u8, 0x18_u8])
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

  IWTSProtocolManager_GUID = "f9eaf6cc-ed79-4f01-821d-1f881b9f66cc"
  IID_IWTSProtocolManager = LibC::GUID.new(0xf9eaf6cc_u32, 0xed79_u16, 0x4f01_u16, StaticArray[0x82_u8, 0x1d_u8, 0x1f_u8, 0x88_u8, 0x1b_u8, 0x9f_u8, 0x66_u8, 0xcc_u8])
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

  IWTSProtocolListener_GUID = "23083765-45f0-4394-8f69-32b2bc0ef4ca"
  IID_IWTSProtocolListener = LibC::GUID.new(0x23083765_u32, 0x45f0_u16, 0x4394_u16, StaticArray[0x8f_u8, 0x69_u8, 0x32_u8, 0xb2_u8, 0xbc_u8, 0xe_u8, 0xf4_u8, 0xca_u8])
  struct IWTSProtocolListener
    lpVtbl : IWTSProtocolListenerVTbl*
  end

  struct IWTSProtocolListenerCallbackVTbl
    query_interface : Proc(IWTSProtocolListenerCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWTSProtocolListenerCallback*, UInt32)
    release : Proc(IWTSProtocolListenerCallback*, UInt32)
    on_connected : Proc(IWTSProtocolListenerCallback*, IWTSProtocolConnection, IWTSProtocolConnectionCallback*, HRESULT)
  end

  IWTSProtocolListenerCallback_GUID = "23083765-1a2d-4de2-97de-4a35f260f0b3"
  IID_IWTSProtocolListenerCallback = LibC::GUID.new(0x23083765_u32, 0x1a2d_u16, 0x4de2_u16, StaticArray[0x97_u8, 0xde_u8, 0x4a_u8, 0x35_u8, 0xf2_u8, 0x60_u8, 0xf0_u8, 0xb3_u8])
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

  IWTSProtocolConnection_GUID = "23083765-9095-4648-98bf-ef81c914032d"
  IID_IWTSProtocolConnection = LibC::GUID.new(0x23083765_u32, 0x9095_u16, 0x4648_u16, StaticArray[0x98_u8, 0xbf_u8, 0xef_u8, 0x81_u8, 0xc9_u8, 0x14_u8, 0x3_u8, 0x2d_u8])
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

  IWTSProtocolConnectionCallback_GUID = "23083765-75eb-41fe-b4fb-e086242afa0f"
  IID_IWTSProtocolConnectionCallback = LibC::GUID.new(0x23083765_u32, 0x75eb_u16, 0x41fe_u16, StaticArray[0xb4_u8, 0xfb_u8, 0xe0_u8, 0x86_u8, 0x24_u8, 0x2a_u8, 0xfa_u8, 0xf_u8])
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

  IWTSProtocolShadowConnection_GUID = "ee3b0c14-37fb-456b-bab3-6d6cd51e13bf"
  IID_IWTSProtocolShadowConnection = LibC::GUID.new(0xee3b0c14_u32, 0x37fb_u16, 0x456b_u16, StaticArray[0xba_u8, 0xb3_u8, 0x6d_u8, 0x6c_u8, 0xd5_u8, 0x1e_u8, 0x13_u8, 0xbf_u8])
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

  IWTSProtocolShadowCallback_GUID = "503a2504-aae5-4ab1-93e0-6d1c4bc6f71a"
  IID_IWTSProtocolShadowCallback = LibC::GUID.new(0x503a2504_u32, 0xaae5_u16, 0x4ab1_u16, StaticArray[0x93_u8, 0xe0_u8, 0x6d_u8, 0x1c_u8, 0x4b_u8, 0xc6_u8, 0xf7_u8, 0x1a_u8])
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

  IWTSProtocolLicenseConnection_GUID = "23083765-178c-4079-8e4a-fea6496a4d70"
  IID_IWTSProtocolLicenseConnection = LibC::GUID.new(0x23083765_u32, 0x178c_u16, 0x4079_u16, StaticArray[0x8e_u8, 0x4a_u8, 0xfe_u8, 0xa6_u8, 0x49_u8, 0x6a_u8, 0x4d_u8, 0x70_u8])
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

  IWTSProtocolLogonErrorRedirector_GUID = "fd9b61a7-2916-4627-8dee-4328711ad6cb"
  IID_IWTSProtocolLogonErrorRedirector = LibC::GUID.new(0xfd9b61a7_u32, 0x2916_u16, 0x4627_u16, StaticArray[0x8d_u8, 0xee_u8, 0x43_u8, 0x28_u8, 0x71_u8, 0x1a_u8, 0xd6_u8, 0xcb_u8])
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

  IWRdsProtocolSettings_GUID = "654a5a6a-2550-47eb-b6f7-ebd637475265"
  IID_IWRdsProtocolSettings = LibC::GUID.new(0x654a5a6a_u32, 0x2550_u16, 0x47eb_u16, StaticArray[0xb6_u8, 0xf7_u8, 0xeb_u8, 0xd6_u8, 0x37_u8, 0x47_u8, 0x52_u8, 0x65_u8])
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

  IWRdsProtocolManager_GUID = "dc796967-3abb-40cd-a446-105276b58950"
  IID_IWRdsProtocolManager = LibC::GUID.new(0xdc796967_u32, 0x3abb_u16, 0x40cd_u16, StaticArray[0xa4_u8, 0x46_u8, 0x10_u8, 0x52_u8, 0x76_u8, 0xb5_u8, 0x89_u8, 0x50_u8])
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

  IWRdsProtocolListener_GUID = "fcbc131b-c686-451d-a773-e279e230f540"
  IID_IWRdsProtocolListener = LibC::GUID.new(0xfcbc131b_u32, 0xc686_u16, 0x451d_u16, StaticArray[0xa7_u8, 0x73_u8, 0xe2_u8, 0x79_u8, 0xe2_u8, 0x30_u8, 0xf5_u8, 0x40_u8])
  struct IWRdsProtocolListener
    lpVtbl : IWRdsProtocolListenerVTbl*
  end

  struct IWRdsProtocolListenerCallbackVTbl
    query_interface : Proc(IWRdsProtocolListenerCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsProtocolListenerCallback*, UInt32)
    release : Proc(IWRdsProtocolListenerCallback*, UInt32)
    on_connected : Proc(IWRdsProtocolListenerCallback*, IWRdsProtocolConnection, WRDS_CONNECTION_SETTINGS*, IWRdsProtocolConnectionCallback*, HRESULT)
  end

  IWRdsProtocolListenerCallback_GUID = "3ab27e5b-4449-4dc1-b74a-91621d4fe984"
  IID_IWRdsProtocolListenerCallback = LibC::GUID.new(0x3ab27e5b_u32, 0x4449_u16, 0x4dc1_u16, StaticArray[0xb7_u8, 0x4a_u8, 0x91_u8, 0x62_u8, 0x1d_u8, 0x4f_u8, 0xe9_u8, 0x84_u8])
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

  IWRdsProtocolConnection_GUID = "324ed94f-fdaf-4ff6-81a8-42abe755830b"
  IID_IWRdsProtocolConnection = LibC::GUID.new(0x324ed94f_u32, 0xfdaf_u16, 0x4ff6_u16, StaticArray[0x81_u8, 0xa8_u8, 0x42_u8, 0xab_u8, 0xe7_u8, 0x55_u8, 0x83_u8, 0xb_u8])
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

  IWRdsProtocolConnectionCallback_GUID = "f1d70332-d070-4ef1-a088-78313536c2d6"
  IID_IWRdsProtocolConnectionCallback = LibC::GUID.new(0xf1d70332_u32, 0xd070_u16, 0x4ef1_u16, StaticArray[0xa0_u8, 0x88_u8, 0x78_u8, 0x31_u8, 0x35_u8, 0x36_u8, 0xc2_u8, 0xd6_u8])
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

  IWRdsProtocolShadowConnection_GUID = "9ae85ce6-cade-4548-8feb-99016597f60a"
  IID_IWRdsProtocolShadowConnection = LibC::GUID.new(0x9ae85ce6_u32, 0xcade_u16, 0x4548_u16, StaticArray[0x8f_u8, 0xeb_u8, 0x99_u8, 0x1_u8, 0x65_u8, 0x97_u8, 0xf6_u8, 0xa_u8])
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

  IWRdsProtocolShadowCallback_GUID = "e0667ce0-0372-40d6-adb2-a0f3322674d6"
  IID_IWRdsProtocolShadowCallback = LibC::GUID.new(0xe0667ce0_u32, 0x372_u16, 0x40d6_u16, StaticArray[0xad_u8, 0xb2_u8, 0xa0_u8, 0xf3_u8, 0x32_u8, 0x26_u8, 0x74_u8, 0xd6_u8])
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

  IWRdsProtocolLicenseConnection_GUID = "1d6a145f-d095-4424-957a-407fae822d84"
  IID_IWRdsProtocolLicenseConnection = LibC::GUID.new(0x1d6a145f_u32, 0xd095_u16, 0x4424_u16, StaticArray[0x95_u8, 0x7a_u8, 0x40_u8, 0x7f_u8, 0xae_u8, 0x82_u8, 0x2d_u8, 0x84_u8])
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

  IWRdsProtocolLogonErrorRedirector_GUID = "519fe83b-142a-4120-a3d5-a405d315281a"
  IID_IWRdsProtocolLogonErrorRedirector = LibC::GUID.new(0x519fe83b_u32, 0x142a_u16, 0x4120_u16, StaticArray[0xa3_u8, 0xd5_u8, 0xa4_u8, 0x5_u8, 0xd3_u8, 0x15_u8, 0x28_u8, 0x1a_u8])
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

  IWRdsWddmIddProps_GUID = "1382df4d-a289-43d1-a184-144726f9af90"
  IID_IWRdsWddmIddProps = LibC::GUID.new(0x1382df4d_u32, 0xa289_u16, 0x43d1_u16, StaticArray[0xa1_u8, 0x84_u8, 0x14_u8, 0x47_u8, 0x26_u8, 0xf9_u8, 0xaf_u8, 0x90_u8])
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

  IWRdsProtocolConnectionSettings_GUID = "83fcf5d3-f6f4-ea94-9cd2-32f280e1e510"
  IID_IWRdsProtocolConnectionSettings = LibC::GUID.new(0x83fcf5d3_u32, 0xf6f4_u16, 0xea94_u16, StaticArray[0x9c_u8, 0xd2_u8, 0x32_u8, 0xf2_u8, 0x80_u8, 0xe1_u8, 0xe5_u8, 0x10_u8])
  struct IWRdsProtocolConnectionSettings
    lpVtbl : IWRdsProtocolConnectionSettingsVTbl*
  end

  struct IWRdsEnhancedFastReconnectArbitratorVTbl
    query_interface : Proc(IWRdsEnhancedFastReconnectArbitrator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWRdsEnhancedFastReconnectArbitrator*, UInt32)
    release : Proc(IWRdsEnhancedFastReconnectArbitrator*, UInt32)
    get_session_for_enhanced_fast_reconnect : Proc(IWRdsEnhancedFastReconnectArbitrator*, Int32*, UInt32, Int32*, HRESULT)
  end

  IWRdsEnhancedFastReconnectArbitrator_GUID = "5718ae9b-47f2-499f-b634-d8175bd51131"
  IID_IWRdsEnhancedFastReconnectArbitrator = LibC::GUID.new(0x5718ae9b_u32, 0x47f2_u16, 0x499f_u16, StaticArray[0xb6_u8, 0x34_u8, 0xd8_u8, 0x17_u8, 0x5b_u8, 0xd5_u8, 0x11_u8, 0x31_u8])
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
    apply_settings : Proc(IRemoteDesktopClientSettings*, UInt8*, HRESULT)
    retrieve_settings : Proc(IRemoteDesktopClientSettings*, UInt8**, HRESULT)
    get_rdp_property : Proc(IRemoteDesktopClientSettings*, UInt8*, VARIANT*, HRESULT)
    set_rdp_property : Proc(IRemoteDesktopClientSettings*, UInt8*, VARIANT, HRESULT)
  end

  IRemoteDesktopClientSettings_GUID = "48a0f2a7-2713-431f-bbac-6f4558e7d64d"
  IID_IRemoteDesktopClientSettings = LibC::GUID.new(0x48a0f2a7_u32, 0x2713_u16, 0x431f_u16, StaticArray[0xbb_u8, 0xac_u8, 0x6f_u8, 0x45_u8, 0x58_u8, 0xe7_u8, 0xd6_u8, 0x4d_u8])
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
    get_snapshot : Proc(IRemoteDesktopClientActions*, SnapshotEncodingType, SnapshotFormatType, UInt32, UInt32, UInt8**, HRESULT)
  end

  IRemoteDesktopClientActions_GUID = "7d54bc4e-1028-45d4-8b0a-b9b6bffba176"
  IID_IRemoteDesktopClientActions = LibC::GUID.new(0x7d54bc4e_u32, 0x1028_u16, 0x45d4_u16, StaticArray[0x8b_u8, 0xa_u8, 0xb9_u8, 0xb6_u8, 0xbf_u8, 0xfb_u8, 0xa1_u8, 0x76_u8])
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

  IRemoteDesktopClientTouchPointer_GUID = "260ec22d-8cbc-44b5-9e88-2a37f6c93ae9"
  IID_IRemoteDesktopClientTouchPointer = LibC::GUID.new(0x260ec22d_u32, 0x8cbc_u16, 0x44b5_u16, StaticArray[0x9e_u8, 0x88_u8, 0x2a_u8, 0x37_u8, 0xf6_u8, 0xc9_u8, 0x3a_u8, 0xe9_u8])
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
    delete_saved_credentials : Proc(IRemoteDesktopClient*, UInt8*, HRESULT)
    update_session_display_settings : Proc(IRemoteDesktopClient*, UInt32, UInt32, HRESULT)
    attach_event : Proc(IRemoteDesktopClient*, UInt8*, IDispatch, HRESULT)
    detach_event : Proc(IRemoteDesktopClient*, UInt8*, IDispatch, HRESULT)
  end

  IRemoteDesktopClient_GUID = "57d25668-625a-4905-be4e-304caa13f89c"
  IID_IRemoteDesktopClient = LibC::GUID.new(0x57d25668_u32, 0x625a_u16, 0x4905_u16, StaticArray[0xbe_u8, 0x4e_u8, 0x30_u8, 0x4c_u8, 0xaa_u8, 0x13_u8, 0xf8_u8, 0x9c_u8])
  struct IRemoteDesktopClient
    lpVtbl : IRemoteDesktopClientVTbl*
  end

  struct IRemoteSystemAdditionalInfoProviderVTbl
    query_interface : Proc(IRemoteSystemAdditionalInfoProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRemoteSystemAdditionalInfoProvider*, UInt32)
    release : Proc(IRemoteSystemAdditionalInfoProvider*, UInt32)
    get_additional_info : Proc(IRemoteSystemAdditionalInfoProvider*, HSTRING*, Guid*, Void**, HRESULT)
  end

  IRemoteSystemAdditionalInfoProvider_GUID = "eeaa3d5f-ec63-4d27-af38-e86b1d7292cb"
  IID_IRemoteSystemAdditionalInfoProvider = LibC::GUID.new(0xeeaa3d5f_u32, 0xec63_u16, 0x4d27_u16, StaticArray[0xaf_u8, 0x38_u8, 0xe8_u8, 0x6b_u8, 0x1d_u8, 0x72_u8, 0x92_u8, 0xcb_u8])
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
  fun WTSCloseServer(hserver : LibC::HANDLE) : Void

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
  fun WTSFreeMemory(pmemory : Void*) : Void

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
struct LibWin32::IAudioEndpoint
  def query_interface(this : IAudioEndpoint*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpoint*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpoint*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_frame_format(this : IAudioEndpoint*, ppformat : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_frame_format.call(this, ppformat)
  end
  def get_frames_per_packet(this : IAudioEndpoint*, pframesperpacket : UInt32*) : HRESULT
    @lpVtbl.value.get_frames_per_packet.call(this, pframesperpacket)
  end
  def get_latency(this : IAudioEndpoint*, platency : Int64*) : HRESULT
    @lpVtbl.value.get_latency.call(this, platency)
  end
  def set_stream_flags(this : IAudioEndpoint*, streamflags : UInt32) : HRESULT
    @lpVtbl.value.set_stream_flags.call(this, streamflags)
  end
  def set_event_handle(this : IAudioEndpoint*, eventhandle : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_event_handle.call(this, eventhandle)
  end
end
struct LibWin32::IAudioEndpointRT
  def query_interface(this : IAudioEndpointRT*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointRT*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointRT*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_padding(this : IAudioEndpointRT*, ppadding : Int64*, paecurrentposition : AE_CURRENT_POSITION*) : Void
    @lpVtbl.value.get_current_padding.call(this, ppadding, paecurrentposition)
  end
  def processing_complete(this : IAudioEndpointRT*) : Void
    @lpVtbl.value.processing_complete.call(this)
  end
  def set_pin_inactive(this : IAudioEndpointRT*) : HRESULT
    @lpVtbl.value.set_pin_inactive.call(this)
  end
  def set_pin_active(this : IAudioEndpointRT*) : HRESULT
    @lpVtbl.value.set_pin_active.call(this)
  end
end
struct LibWin32::IAudioInputEndpointRT
  def query_interface(this : IAudioInputEndpointRT*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioInputEndpointRT*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioInputEndpointRT*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_input_data_pointer(this : IAudioInputEndpointRT*, pconnectionproperty : APO_CONNECTION_PROPERTY*, paetimestamp : AE_CURRENT_POSITION*) : Void
    @lpVtbl.value.get_input_data_pointer.call(this, pconnectionproperty, paetimestamp)
  end
  def release_input_data_pointer(this : IAudioInputEndpointRT*, u32framecount : UInt32, pdatapointer : LibC::UINT_PTR) : Void
    @lpVtbl.value.release_input_data_pointer.call(this, u32framecount, pdatapointer)
  end
  def pulse_endpoint(this : IAudioInputEndpointRT*) : Void
    @lpVtbl.value.pulse_endpoint.call(this)
  end
end
struct LibWin32::IAudioOutputEndpointRT
  def query_interface(this : IAudioOutputEndpointRT*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioOutputEndpointRT*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioOutputEndpointRT*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_output_data_pointer(this : IAudioOutputEndpointRT*, u32framecount : UInt32, paetimestamp : AE_CURRENT_POSITION*) : LibC::UINT_PTR
    @lpVtbl.value.get_output_data_pointer.call(this, u32framecount, paetimestamp)
  end
  def release_output_data_pointer(this : IAudioOutputEndpointRT*, pconnectionproperty : APO_CONNECTION_PROPERTY*) : Void
    @lpVtbl.value.release_output_data_pointer.call(this, pconnectionproperty)
  end
  def pulse_endpoint(this : IAudioOutputEndpointRT*) : Void
    @lpVtbl.value.pulse_endpoint.call(this)
  end
end
struct LibWin32::IAudioDeviceEndpoint
  def query_interface(this : IAudioDeviceEndpoint*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioDeviceEndpoint*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioDeviceEndpoint*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_buffer(this : IAudioDeviceEndpoint*, maxperiod : Int64, u32latencycoefficient : UInt32) : HRESULT
    @lpVtbl.value.set_buffer.call(this, maxperiod, u32latencycoefficient)
  end
  def get_rt_caps(this : IAudioDeviceEndpoint*, pbisrtcapable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_rt_caps.call(this, pbisrtcapable)
  end
  def get_event_driven_capable(this : IAudioDeviceEndpoint*, pbiseventcapable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_event_driven_capable.call(this, pbiseventcapable)
  end
  def write_exclusive_mode_parameters_to_shared_memory(this : IAudioDeviceEndpoint*, htargetprocess : LibC::UINT_PTR, hnsperiod : Int64, hnsbufferduration : Int64, u32latencycoefficient : UInt32, pu32sharedmemorysize : UInt32*, phsharedmemory : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.write_exclusive_mode_parameters_to_shared_memory.call(this, htargetprocess, hnsperiod, hnsbufferduration, u32latencycoefficient, pu32sharedmemorysize, phsharedmemory)
  end
end
struct LibWin32::IAudioEndpointControl
  def query_interface(this : IAudioEndpointControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start(this : IAudioEndpointControl*) : HRESULT
    @lpVtbl.value.start.call(this)
  end
  def reset(this : IAudioEndpointControl*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def stop(this : IAudioEndpointControl*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
end
struct LibWin32::IADsTSUserEx
  def query_interface(this : IADsTSUserEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IADsTSUserEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IADsTSUserEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IADsTSUserEx*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IADsTSUserEx*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IADsTSUserEx*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IADsTSUserEx*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_terminal_services_profile_path(this : IADsTSUserEx*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_terminal_services_profile_path.call(this, pval)
  end
  def put_terminal_services_profile_path(this : IADsTSUserEx*, pnewval : UInt8*) : HRESULT
    @lpVtbl.value.put_terminal_services_profile_path.call(this, pnewval)
  end
  def get_terminal_services_home_directory(this : IADsTSUserEx*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_terminal_services_home_directory.call(this, pval)
  end
  def put_terminal_services_home_directory(this : IADsTSUserEx*, pnewval : UInt8*) : HRESULT
    @lpVtbl.value.put_terminal_services_home_directory.call(this, pnewval)
  end
  def get_terminal_services_home_drive(this : IADsTSUserEx*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_terminal_services_home_drive.call(this, pval)
  end
  def put_terminal_services_home_drive(this : IADsTSUserEx*, pnewval : UInt8*) : HRESULT
    @lpVtbl.value.put_terminal_services_home_drive.call(this, pnewval)
  end
  def get_allow_logon(this : IADsTSUserEx*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_allow_logon.call(this, pval)
  end
  def put_allow_logon(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_allow_logon.call(this, newval)
  end
  def get_enable_remote_control(this : IADsTSUserEx*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_enable_remote_control.call(this, pval)
  end
  def put_enable_remote_control(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_enable_remote_control.call(this, newval)
  end
  def get_max_disconnection_time(this : IADsTSUserEx*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_max_disconnection_time.call(this, pval)
  end
  def put_max_disconnection_time(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_max_disconnection_time.call(this, newval)
  end
  def get_max_connection_time(this : IADsTSUserEx*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_max_connection_time.call(this, pval)
  end
  def put_max_connection_time(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_max_connection_time.call(this, newval)
  end
  def get_max_idle_time(this : IADsTSUserEx*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_max_idle_time.call(this, pval)
  end
  def put_max_idle_time(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_max_idle_time.call(this, newval)
  end
  def get_reconnection_action(this : IADsTSUserEx*, pnewval : Int32*) : HRESULT
    @lpVtbl.value.get_reconnection_action.call(this, pnewval)
  end
  def put_reconnection_action(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_reconnection_action.call(this, newval)
  end
  def get_broken_connection_action(this : IADsTSUserEx*, pnewval : Int32*) : HRESULT
    @lpVtbl.value.get_broken_connection_action.call(this, pnewval)
  end
  def put_broken_connection_action(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_broken_connection_action.call(this, newval)
  end
  def get_connect_client_drives_at_logon(this : IADsTSUserEx*, pnewval : Int32*) : HRESULT
    @lpVtbl.value.get_connect_client_drives_at_logon.call(this, pnewval)
  end
  def put_connect_client_drives_at_logon(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_connect_client_drives_at_logon.call(this, newval)
  end
  def get_connect_client_printers_at_logon(this : IADsTSUserEx*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_connect_client_printers_at_logon.call(this, pval)
  end
  def put_connect_client_printers_at_logon(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_connect_client_printers_at_logon.call(this, newval)
  end
  def get_default_to_main_printer(this : IADsTSUserEx*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_default_to_main_printer.call(this, pval)
  end
  def put_default_to_main_printer(this : IADsTSUserEx*, newval : Int32) : HRESULT
    @lpVtbl.value.put_default_to_main_printer.call(this, newval)
  end
  def get_terminal_services_work_directory(this : IADsTSUserEx*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_terminal_services_work_directory.call(this, pval)
  end
  def put_terminal_services_work_directory(this : IADsTSUserEx*, pnewval : UInt8*) : HRESULT
    @lpVtbl.value.put_terminal_services_work_directory.call(this, pnewval)
  end
  def get_terminal_services_initial_program(this : IADsTSUserEx*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_terminal_services_initial_program.call(this, pval)
  end
  def put_terminal_services_initial_program(this : IADsTSUserEx*, pnewval : UInt8*) : HRESULT
    @lpVtbl.value.put_terminal_services_initial_program.call(this, pnewval)
  end
end
struct LibWin32::ITSGAuthorizeConnectionSink
  def query_interface(this : ITSGAuthorizeConnectionSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITSGAuthorizeConnectionSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITSGAuthorizeConnectionSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_connection_authorized(this : ITSGAuthorizeConnectionSink*, hrin : HRESULT, mainsessionid : Guid, cbsohresponse : UInt32, pbsohresponse : UInt8*, idletimeout : UInt32, sessiontimeout : UInt32, sessiontimeoutaction : SESSION_TIMEOUT_ACTION_TYPE, trustclass : AATrustClassID, policyattributes : UInt32*) : HRESULT
    @lpVtbl.value.on_connection_authorized.call(this, hrin, mainsessionid, cbsohresponse, pbsohresponse, idletimeout, sessiontimeout, sessiontimeoutaction, trustclass, policyattributes)
  end
end
struct LibWin32::ITSGAuthorizeResourceSink
  def query_interface(this : ITSGAuthorizeResourceSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITSGAuthorizeResourceSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITSGAuthorizeResourceSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_channel_authorized(this : ITSGAuthorizeResourceSink*, hrin : HRESULT, mainsessionid : Guid, subsessionid : Int32, allowedresourcenames : UInt8**, numallowedresourcenames : UInt32, failedresourcenames : UInt8**, numfailedresourcenames : UInt32) : HRESULT
    @lpVtbl.value.on_channel_authorized.call(this, hrin, mainsessionid, subsessionid, allowedresourcenames, numallowedresourcenames, failedresourcenames, numfailedresourcenames)
  end
end
struct LibWin32::ITSGPolicyEngine
  def query_interface(this : ITSGPolicyEngine*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITSGPolicyEngine*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITSGPolicyEngine*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def authorize_connection(this : ITSGPolicyEngine*, mainsessionid : Guid, username : UInt8*, authtype : AAAuthSchemes, clientmachineip : UInt8*, clientmachinename : UInt8*, sohdata : UInt8*, numsohbytes : UInt32, cookiedata : UInt8*, numcookiebytes : UInt32, usertoken : HANDLE_PTR, psink : ITSGAuthorizeConnectionSink) : HRESULT
    @lpVtbl.value.authorize_connection.call(this, mainsessionid, username, authtype, clientmachineip, clientmachinename, sohdata, numsohbytes, cookiedata, numcookiebytes, usertoken, psink)
  end
  def authorize_resource(this : ITSGPolicyEngine*, mainsessionid : Guid, subsessionid : Int32, username : UInt8*, resourcenames : UInt8**, numresources : UInt32, alternateresourcenames : UInt8**, numalternateresourcename : UInt32, portnumber : UInt32, operation : UInt8*, cookie : UInt8*, numbytesincookie : UInt32, psink : ITSGAuthorizeResourceSink) : HRESULT
    @lpVtbl.value.authorize_resource.call(this, mainsessionid, subsessionid, username, resourcenames, numresources, alternateresourcenames, numalternateresourcename, portnumber, operation, cookie, numbytesincookie, psink)
  end
  def refresh(this : ITSGPolicyEngine*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def is_quarantine_enabled(this : ITSGPolicyEngine*, quarantineenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_quarantine_enabled.call(this, quarantineenabled)
  end
end
struct LibWin32::ITSGAccountingEngine
  def query_interface(this : ITSGAccountingEngine*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITSGAccountingEngine*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITSGAccountingEngine*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def do_accounting(this : ITSGAccountingEngine*, accountingdatatype : AAAccountingDataType, accountingdata : AAAccountingData) : HRESULT
    @lpVtbl.value.do_accounting.call(this, accountingdatatype, accountingdata)
  end
end
struct LibWin32::ITSGAuthenticateUserSink
  def query_interface(this : ITSGAuthenticateUserSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITSGAuthenticateUserSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITSGAuthenticateUserSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_user_authenticated(this : ITSGAuthenticateUserSink*, username : UInt8*, userdomain : UInt8*, context : LibC::UINT_PTR, usertoken : HANDLE_PTR) : HRESULT
    @lpVtbl.value.on_user_authenticated.call(this, username, userdomain, context, usertoken)
  end
  def on_user_authentication_failed(this : ITSGAuthenticateUserSink*, context : LibC::UINT_PTR, genericerrorcode : HRESULT, specificerrorcode : HRESULT) : HRESULT
    @lpVtbl.value.on_user_authentication_failed.call(this, context, genericerrorcode, specificerrorcode)
  end
  def reauthenticate_user(this : ITSGAuthenticateUserSink*, context : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.reauthenticate_user.call(this, context)
  end
  def disconnect_user(this : ITSGAuthenticateUserSink*, context : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.disconnect_user.call(this, context)
  end
end
struct LibWin32::ITSGAuthenticationEngine
  def query_interface(this : ITSGAuthenticationEngine*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITSGAuthenticationEngine*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITSGAuthenticationEngine*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def authenticate_user(this : ITSGAuthenticationEngine*, mainsessionid : Guid, cookiedata : UInt8*, numcookiebytes : UInt32, context : LibC::UINT_PTR, psink : ITSGAuthenticateUserSink) : HRESULT
    @lpVtbl.value.authenticate_user.call(this, mainsessionid, cookiedata, numcookiebytes, context, psink)
  end
  def cancel_authentication(this : ITSGAuthenticationEngine*, mainsessionid : Guid, context : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.cancel_authentication.call(this, mainsessionid, context)
  end
end
struct LibWin32::IWTSSBPlugin
  def query_interface(this : IWTSSBPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSSBPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSSBPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IWTSSBPlugin*, plugincapabilities : UInt32*) : HRESULT
    @lpVtbl.value.initialize.call(this, plugincapabilities)
  end
  def wtssbx_machine_change_notification(this : IWTSSBPlugin*, notificationtype : WTSSBX_NOTIFICATION_TYPE, machineid : Int32, pmachineinfo : WTSSBX_MACHINE_INFO*) : HRESULT
    @lpVtbl.value.wtssbx_machine_change_notification.call(this, notificationtype, machineid, pmachineinfo)
  end
  def wtssbx_session_change_notification(this : IWTSSBPlugin*, notificationtype : WTSSBX_NOTIFICATION_TYPE, machineid : Int32, numofsessions : UInt32, sessioninfo : WTSSBX_SESSION_INFO*) : HRESULT
    @lpVtbl.value.wtssbx_session_change_notification.call(this, notificationtype, machineid, numofsessions, sessioninfo)
  end
  def wtssbx_get_most_suitable_server(this : IWTSSBPlugin*, username : LibC::LPWSTR, domainname : LibC::LPWSTR, applicationtype : LibC::LPWSTR, farmname : LibC::LPWSTR, pmachineid : Int32*) : HRESULT
    @lpVtbl.value.wtssbx_get_most_suitable_server.call(this, username, domainname, applicationtype, farmname, pmachineid)
  end
  def terminated(this : IWTSSBPlugin*) : HRESULT
    @lpVtbl.value.terminated.call(this)
  end
  def wtssbx_get_user_external_session(this : IWTSSBPlugin*, username : LibC::LPWSTR, domainname : LibC::LPWSTR, applicationtype : LibC::LPWSTR, redirectorinternalip : WTSSBX_IP_ADDRESS*, psessionid : UInt32*, pmachineconnectinfo : WTSSBX_MACHINE_CONNECT_INFO*) : HRESULT
    @lpVtbl.value.wtssbx_get_user_external_session.call(this, username, domainname, applicationtype, redirectorinternalip, psessionid, pmachineconnectinfo)
  end
end
struct LibWin32::IWorkspaceClientExt
  def query_interface(this : IWorkspaceClientExt*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceClientExt*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceClientExt*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_resource_id(this : IWorkspaceClientExt*, bstrworkspaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_resource_id.call(this, bstrworkspaceid)
  end
  def get_resource_display_name(this : IWorkspaceClientExt*, bstrworkspacedisplayname : UInt8**) : HRESULT
    @lpVtbl.value.get_resource_display_name.call(this, bstrworkspacedisplayname)
  end
  def issue_disconnect(this : IWorkspaceClientExt*) : HRESULT
    @lpVtbl.value.issue_disconnect.call(this)
  end
end
struct LibWin32::IWorkspace
  def query_interface(this : IWorkspace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_workspace_names(this : IWorkspace*, psawkspnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_workspace_names.call(this, psawkspnames)
  end
  def start_remote_application(this : IWorkspace*, bstrworkspaceid : UInt8*, psaparams : SAFEARRAY*) : HRESULT
    @lpVtbl.value.start_remote_application.call(this, bstrworkspaceid, psaparams)
  end
  def get_process_id(this : IWorkspace*, pulprocessid : UInt32*) : HRESULT
    @lpVtbl.value.get_process_id.call(this, pulprocessid)
  end
end
struct LibWin32::IWorkspace2
  def query_interface(this : IWorkspace2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspace2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspace2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_workspace_names(this : IWorkspace2*, psawkspnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_workspace_names.call(this, psawkspnames)
  end
  def start_remote_application(this : IWorkspace2*, bstrworkspaceid : UInt8*, psaparams : SAFEARRAY*) : HRESULT
    @lpVtbl.value.start_remote_application.call(this, bstrworkspaceid, psaparams)
  end
  def get_process_id(this : IWorkspace2*, pulprocessid : UInt32*) : HRESULT
    @lpVtbl.value.get_process_id.call(this, pulprocessid)
  end
  def start_remote_application_ex(this : IWorkspace2*, bstrworkspaceid : UInt8*, bstrrequestingappid : UInt8*, bstrrequestingappfamilyname : UInt8*, blaunchintoimmersiveclient : Int16, bstrimmersiveclientactivationcontext : UInt8*, psaparams : SAFEARRAY*) : HRESULT
    @lpVtbl.value.start_remote_application_ex.call(this, bstrworkspaceid, bstrrequestingappid, bstrrequestingappfamilyname, blaunchintoimmersiveclient, bstrimmersiveclientactivationcontext, psaparams)
  end
end
struct LibWin32::IWorkspace3
  def query_interface(this : IWorkspace3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspace3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspace3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_workspace_names(this : IWorkspace3*, psawkspnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_workspace_names.call(this, psawkspnames)
  end
  def start_remote_application(this : IWorkspace3*, bstrworkspaceid : UInt8*, psaparams : SAFEARRAY*) : HRESULT
    @lpVtbl.value.start_remote_application.call(this, bstrworkspaceid, psaparams)
  end
  def get_process_id(this : IWorkspace3*, pulprocessid : UInt32*) : HRESULT
    @lpVtbl.value.get_process_id.call(this, pulprocessid)
  end
  def start_remote_application_ex(this : IWorkspace3*, bstrworkspaceid : UInt8*, bstrrequestingappid : UInt8*, bstrrequestingappfamilyname : UInt8*, blaunchintoimmersiveclient : Int16, bstrimmersiveclientactivationcontext : UInt8*, psaparams : SAFEARRAY*) : HRESULT
    @lpVtbl.value.start_remote_application_ex.call(this, bstrworkspaceid, bstrrequestingappid, bstrrequestingappfamilyname, blaunchintoimmersiveclient, bstrimmersiveclientactivationcontext, psaparams)
  end
  def get_claims_token2(this : IWorkspace3*, bstrclaimshint : UInt8*, bstruserhint : UInt8*, claimcookie : UInt32, hwndcreduiparent : UInt32, rectcreduiparent : RECT, pbstraccesstoken : UInt8**) : HRESULT
    @lpVtbl.value.get_claims_token2.call(this, bstrclaimshint, bstruserhint, claimcookie, hwndcreduiparent, rectcreduiparent, pbstraccesstoken)
  end
  def set_claims_token(this : IWorkspace3*, bstraccesstoken : UInt8*, ullaccesstokenexpiration : UInt64, bstrrefreshtoken : UInt8*) : HRESULT
    @lpVtbl.value.set_claims_token.call(this, bstraccesstoken, ullaccesstokenexpiration, bstrrefreshtoken)
  end
end
struct LibWin32::IWorkspaceRegistration
  def query_interface(this : IWorkspaceRegistration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceRegistration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceRegistration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_resource(this : IWorkspaceRegistration*, punk : IWorkspaceClientExt, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.add_resource.call(this, punk, pdwcookie)
  end
  def remove_resource(this : IWorkspaceRegistration*, dwcookieconnection : UInt32) : HRESULT
    @lpVtbl.value.remove_resource.call(this, dwcookieconnection)
  end
end
struct LibWin32::IWorkspaceRegistration2
  def query_interface(this : IWorkspaceRegistration2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceRegistration2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceRegistration2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_resource(this : IWorkspaceRegistration2*, punk : IWorkspaceClientExt, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.add_resource.call(this, punk, pdwcookie)
  end
  def remove_resource(this : IWorkspaceRegistration2*, dwcookieconnection : UInt32) : HRESULT
    @lpVtbl.value.remove_resource.call(this, dwcookieconnection)
  end
  def add_resource_ex(this : IWorkspaceRegistration2*, punk : IWorkspaceClientExt, bstreventloguploadaddress : UInt8*, pdwcookie : UInt32*, correlationid : Guid) : HRESULT
    @lpVtbl.value.add_resource_ex.call(this, punk, bstreventloguploadaddress, pdwcookie, correlationid)
  end
  def remove_resource_ex(this : IWorkspaceRegistration2*, dwcookieconnection : UInt32, correlationid : Guid) : HRESULT
    @lpVtbl.value.remove_resource_ex.call(this, dwcookieconnection, correlationid)
  end
end
struct LibWin32::IWorkspaceScriptable
  def query_interface(this : IWorkspaceScriptable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceScriptable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceScriptable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWorkspaceScriptable*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWorkspaceScriptable*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWorkspaceScriptable*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWorkspaceScriptable*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def disconnect_workspace(this : IWorkspaceScriptable*, bstrworkspaceid : UInt8*) : HRESULT
    @lpVtbl.value.disconnect_workspace.call(this, bstrworkspaceid)
  end
  def start_workspace(this : IWorkspaceScriptable*, bstrworkspaceid : UInt8*, bstrusername : UInt8*, bstrpassword : UInt8*, bstrworkspaceparams : UInt8*, ltimeout : Int32, lflags : Int32) : HRESULT
    @lpVtbl.value.start_workspace.call(this, bstrworkspaceid, bstrusername, bstrpassword, bstrworkspaceparams, ltimeout, lflags)
  end
  def is_workspace_credential_specified(this : IWorkspaceScriptable*, bstrworkspaceid : UInt8*, bcountunauthenticatedcredentials : Int16, pbcredexist : Int16*) : HRESULT
    @lpVtbl.value.is_workspace_credential_specified.call(this, bstrworkspaceid, bcountunauthenticatedcredentials, pbcredexist)
  end
  def is_workspace_sso_enabled(this : IWorkspaceScriptable*, pbssoenabled : Int16*) : HRESULT
    @lpVtbl.value.is_workspace_sso_enabled.call(this, pbssoenabled)
  end
  def clear_workspace_credential(this : IWorkspaceScriptable*, bstrworkspaceid : UInt8*) : HRESULT
    @lpVtbl.value.clear_workspace_credential.call(this, bstrworkspaceid)
  end
  def on_authenticated(this : IWorkspaceScriptable*, bstrworkspaceid : UInt8*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.on_authenticated.call(this, bstrworkspaceid, bstrusername)
  end
  def disconnect_workspace_by_friendly_name(this : IWorkspaceScriptable*, bstrworkspacefriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.disconnect_workspace_by_friendly_name.call(this, bstrworkspacefriendlyname)
  end
end
struct LibWin32::IWorkspaceScriptable2
  def query_interface(this : IWorkspaceScriptable2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceScriptable2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceScriptable2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWorkspaceScriptable2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWorkspaceScriptable2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWorkspaceScriptable2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWorkspaceScriptable2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def disconnect_workspace(this : IWorkspaceScriptable2*, bstrworkspaceid : UInt8*) : HRESULT
    @lpVtbl.value.disconnect_workspace.call(this, bstrworkspaceid)
  end
  def start_workspace(this : IWorkspaceScriptable2*, bstrworkspaceid : UInt8*, bstrusername : UInt8*, bstrpassword : UInt8*, bstrworkspaceparams : UInt8*, ltimeout : Int32, lflags : Int32) : HRESULT
    @lpVtbl.value.start_workspace.call(this, bstrworkspaceid, bstrusername, bstrpassword, bstrworkspaceparams, ltimeout, lflags)
  end
  def is_workspace_credential_specified(this : IWorkspaceScriptable2*, bstrworkspaceid : UInt8*, bcountunauthenticatedcredentials : Int16, pbcredexist : Int16*) : HRESULT
    @lpVtbl.value.is_workspace_credential_specified.call(this, bstrworkspaceid, bcountunauthenticatedcredentials, pbcredexist)
  end
  def is_workspace_sso_enabled(this : IWorkspaceScriptable2*, pbssoenabled : Int16*) : HRESULT
    @lpVtbl.value.is_workspace_sso_enabled.call(this, pbssoenabled)
  end
  def clear_workspace_credential(this : IWorkspaceScriptable2*, bstrworkspaceid : UInt8*) : HRESULT
    @lpVtbl.value.clear_workspace_credential.call(this, bstrworkspaceid)
  end
  def on_authenticated(this : IWorkspaceScriptable2*, bstrworkspaceid : UInt8*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.on_authenticated.call(this, bstrworkspaceid, bstrusername)
  end
  def disconnect_workspace_by_friendly_name(this : IWorkspaceScriptable2*, bstrworkspacefriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.disconnect_workspace_by_friendly_name.call(this, bstrworkspacefriendlyname)
  end
  def start_workspace_ex(this : IWorkspaceScriptable2*, bstrworkspaceid : UInt8*, bstrworkspacefriendlyname : UInt8*, bstrredirectorname : UInt8*, bstrusername : UInt8*, bstrpassword : UInt8*, bstrappcontainer : UInt8*, bstrworkspaceparams : UInt8*, ltimeout : Int32, lflags : Int32) : HRESULT
    @lpVtbl.value.start_workspace_ex.call(this, bstrworkspaceid, bstrworkspacefriendlyname, bstrredirectorname, bstrusername, bstrpassword, bstrappcontainer, bstrworkspaceparams, ltimeout, lflags)
  end
  def resource_dismissed(this : IWorkspaceScriptable2*, bstrworkspaceid : UInt8*, bstrworkspacefriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.resource_dismissed.call(this, bstrworkspaceid, bstrworkspacefriendlyname)
  end
end
struct LibWin32::IWorkspaceScriptable3
  def query_interface(this : IWorkspaceScriptable3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceScriptable3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceScriptable3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWorkspaceScriptable3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWorkspaceScriptable3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWorkspaceScriptable3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWorkspaceScriptable3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def disconnect_workspace(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*) : HRESULT
    @lpVtbl.value.disconnect_workspace.call(this, bstrworkspaceid)
  end
  def start_workspace(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*, bstrusername : UInt8*, bstrpassword : UInt8*, bstrworkspaceparams : UInt8*, ltimeout : Int32, lflags : Int32) : HRESULT
    @lpVtbl.value.start_workspace.call(this, bstrworkspaceid, bstrusername, bstrpassword, bstrworkspaceparams, ltimeout, lflags)
  end
  def is_workspace_credential_specified(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*, bcountunauthenticatedcredentials : Int16, pbcredexist : Int16*) : HRESULT
    @lpVtbl.value.is_workspace_credential_specified.call(this, bstrworkspaceid, bcountunauthenticatedcredentials, pbcredexist)
  end
  def is_workspace_sso_enabled(this : IWorkspaceScriptable3*, pbssoenabled : Int16*) : HRESULT
    @lpVtbl.value.is_workspace_sso_enabled.call(this, pbssoenabled)
  end
  def clear_workspace_credential(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*) : HRESULT
    @lpVtbl.value.clear_workspace_credential.call(this, bstrworkspaceid)
  end
  def on_authenticated(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.on_authenticated.call(this, bstrworkspaceid, bstrusername)
  end
  def disconnect_workspace_by_friendly_name(this : IWorkspaceScriptable3*, bstrworkspacefriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.disconnect_workspace_by_friendly_name.call(this, bstrworkspacefriendlyname)
  end
  def start_workspace_ex(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*, bstrworkspacefriendlyname : UInt8*, bstrredirectorname : UInt8*, bstrusername : UInt8*, bstrpassword : UInt8*, bstrappcontainer : UInt8*, bstrworkspaceparams : UInt8*, ltimeout : Int32, lflags : Int32) : HRESULT
    @lpVtbl.value.start_workspace_ex.call(this, bstrworkspaceid, bstrworkspacefriendlyname, bstrredirectorname, bstrusername, bstrpassword, bstrappcontainer, bstrworkspaceparams, ltimeout, lflags)
  end
  def resource_dismissed(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*, bstrworkspacefriendlyname : UInt8*) : HRESULT
    @lpVtbl.value.resource_dismissed.call(this, bstrworkspaceid, bstrworkspacefriendlyname)
  end
  def start_workspace_ex2(this : IWorkspaceScriptable3*, bstrworkspaceid : UInt8*, bstrworkspacefriendlyname : UInt8*, bstrredirectorname : UInt8*, bstrusername : UInt8*, bstrpassword : UInt8*, bstrappcontainer : UInt8*, bstrworkspaceparams : UInt8*, ltimeout : Int32, lflags : Int32, bstreventloguploadaddress : UInt8*, correlationid : Guid) : HRESULT
    @lpVtbl.value.start_workspace_ex2.call(this, bstrworkspaceid, bstrworkspacefriendlyname, bstrredirectorname, bstrusername, bstrpassword, bstrappcontainer, bstrworkspaceparams, ltimeout, lflags, bstreventloguploadaddress, correlationid)
  end
end
struct LibWin32::IWorkspaceReportMessage
  def query_interface(this : IWorkspaceReportMessage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceReportMessage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceReportMessage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_error_log_message(this : IWorkspaceReportMessage*, bstrmessage : UInt8*) : HRESULT
    @lpVtbl.value.register_error_log_message.call(this, bstrmessage)
  end
  def is_error_message_registered(this : IWorkspaceReportMessage*, bstrwkspid : UInt8*, dwerrortype : UInt32, bstrerrormessagetype : UInt8*, dwerrorcode : UInt32, pferrorexist : Int16*) : HRESULT
    @lpVtbl.value.is_error_message_registered.call(this, bstrwkspid, dwerrortype, bstrerrormessagetype, dwerrorcode, pferrorexist)
  end
  def register_error_event(this : IWorkspaceReportMessage*, bstrwkspid : UInt8*, dwerrortype : UInt32, bstrerrormessagetype : UInt8*, dwerrorcode : UInt32) : HRESULT
    @lpVtbl.value.register_error_event.call(this, bstrwkspid, dwerrortype, bstrerrormessagetype, dwerrorcode)
  end
end
struct LibWin32::IITSWkspEvents
  def query_interface(this : IITSWkspEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IITSWkspEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IITSWkspEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IITSWkspEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IITSWkspEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IITSWkspEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IITSWkspEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ITsSbPlugin
  def query_interface(this : ITsSbPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ITsSbPlugin*, pprovider : ITsSbProvider, pnotifysink : ITsSbPluginNotifySink, ppropertyset : ITsSbPluginPropertySet) : HRESULT
    @lpVtbl.value.initialize.call(this, pprovider, pnotifysink, ppropertyset)
  end
  def terminate(this : ITsSbPlugin*, hr : HRESULT) : HRESULT
    @lpVtbl.value.terminate.call(this, hr)
  end
end
struct LibWin32::ITsSbResourcePlugin
  def query_interface(this : ITsSbResourcePlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbResourcePlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbResourcePlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ITsSbResourcePlugin*, pprovider : ITsSbProvider, pnotifysink : ITsSbPluginNotifySink, ppropertyset : ITsSbPluginPropertySet) : HRESULT
    @lpVtbl.value.initialize.call(this, pprovider, pnotifysink, ppropertyset)
  end
  def terminate(this : ITsSbResourcePlugin*, hr : HRESULT) : HRESULT
    @lpVtbl.value.terminate.call(this, hr)
  end
end
struct LibWin32::ITsSbServiceNotification
  def query_interface(this : ITsSbServiceNotification*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbServiceNotification*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbServiceNotification*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def notify_service_failure(this : ITsSbServiceNotification*) : HRESULT
    @lpVtbl.value.notify_service_failure.call(this)
  end
  def notify_service_success(this : ITsSbServiceNotification*) : HRESULT
    @lpVtbl.value.notify_service_success.call(this)
  end
end
struct LibWin32::ITsSbLoadBalancing
  def query_interface(this : ITsSbLoadBalancing*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbLoadBalancing*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbLoadBalancing*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ITsSbLoadBalancing*, pprovider : ITsSbProvider, pnotifysink : ITsSbPluginNotifySink, ppropertyset : ITsSbPluginPropertySet) : HRESULT
    @lpVtbl.value.initialize.call(this, pprovider, pnotifysink, ppropertyset)
  end
  def terminate(this : ITsSbLoadBalancing*, hr : HRESULT) : HRESULT
    @lpVtbl.value.terminate.call(this, hr)
  end
  def get_most_suitable_target(this : ITsSbLoadBalancing*, pconnection : ITsSbClientConnection, plbsink : ITsSbLoadBalancingNotifySink) : HRESULT
    @lpVtbl.value.get_most_suitable_target.call(this, pconnection, plbsink)
  end
end
struct LibWin32::ITsSbPlacement
  def query_interface(this : ITsSbPlacement*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbPlacement*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbPlacement*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ITsSbPlacement*, pprovider : ITsSbProvider, pnotifysink : ITsSbPluginNotifySink, ppropertyset : ITsSbPluginPropertySet) : HRESULT
    @lpVtbl.value.initialize.call(this, pprovider, pnotifysink, ppropertyset)
  end
  def terminate(this : ITsSbPlacement*, hr : HRESULT) : HRESULT
    @lpVtbl.value.terminate.call(this, hr)
  end
  def query_environment_for_target(this : ITsSbPlacement*, pconnection : ITsSbClientConnection, pplacementsink : ITsSbPlacementNotifySink) : HRESULT
    @lpVtbl.value.query_environment_for_target.call(this, pconnection, pplacementsink)
  end
end
struct LibWin32::ITsSbOrchestration
  def query_interface(this : ITsSbOrchestration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbOrchestration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbOrchestration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ITsSbOrchestration*, pprovider : ITsSbProvider, pnotifysink : ITsSbPluginNotifySink, ppropertyset : ITsSbPluginPropertySet) : HRESULT
    @lpVtbl.value.initialize.call(this, pprovider, pnotifysink, ppropertyset)
  end
  def terminate(this : ITsSbOrchestration*, hr : HRESULT) : HRESULT
    @lpVtbl.value.terminate.call(this, hr)
  end
  def prepare_target_for_connect(this : ITsSbOrchestration*, pconnection : ITsSbClientConnection, porchestrationnotifysink : ITsSbOrchestrationNotifySink) : HRESULT
    @lpVtbl.value.prepare_target_for_connect.call(this, pconnection, porchestrationnotifysink)
  end
end
struct LibWin32::ITsSbEnvironment
  def query_interface(this : ITsSbEnvironment*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbEnvironment*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbEnvironment*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : ITsSbEnvironment*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pval)
  end
  def get_server_weight(this : ITsSbEnvironment*, pval : UInt32*) : HRESULT
    @lpVtbl.value.get_server_weight.call(this, pval)
  end
  def get_environment_property_set(this : ITsSbEnvironment*, pppropertyset : ITsSbEnvironmentPropertySet*) : HRESULT
    @lpVtbl.value.get_environment_property_set.call(this, pppropertyset)
  end
  def put_environment_property_set(this : ITsSbEnvironment*, pval : ITsSbEnvironmentPropertySet) : HRESULT
    @lpVtbl.value.put_environment_property_set.call(this, pval)
  end
end
struct LibWin32::ITsSbLoadBalanceResult
  def query_interface(this : ITsSbLoadBalanceResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbLoadBalanceResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbLoadBalanceResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_target_name(this : ITsSbLoadBalanceResult*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_target_name.call(this, pval)
  end
end
struct LibWin32::ITsSbTarget
  def query_interface(this : ITsSbTarget*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbTarget*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbTarget*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_target_name(this : ITsSbTarget*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_target_name.call(this, pval)
  end
  def put_target_name(this : ITsSbTarget*, val : UInt8*) : HRESULT
    @lpVtbl.value.put_target_name.call(this, val)
  end
  def get_farm_name(this : ITsSbTarget*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_farm_name.call(this, pval)
  end
  def put_farm_name(this : ITsSbTarget*, val : UInt8*) : HRESULT
    @lpVtbl.value.put_farm_name.call(this, val)
  end
  def get_target_fqdn(this : ITsSbTarget*, targetfqdnname : UInt8**) : HRESULT
    @lpVtbl.value.get_target_fqdn.call(this, targetfqdnname)
  end
  def put_target_fqdn(this : ITsSbTarget*, val : UInt8*) : HRESULT
    @lpVtbl.value.put_target_fqdn.call(this, val)
  end
  def get_target_netbios(this : ITsSbTarget*, targetnetbiosname : UInt8**) : HRESULT
    @lpVtbl.value.get_target_netbios.call(this, targetnetbiosname)
  end
  def put_target_netbios(this : ITsSbTarget*, val : UInt8*) : HRESULT
    @lpVtbl.value.put_target_netbios.call(this, val)
  end
  def get_ip_addresses(this : ITsSbTarget*, sockaddr : TSSD_ConnectionPoint*, numaddresses : UInt32*) : HRESULT
    @lpVtbl.value.get_ip_addresses.call(this, sockaddr, numaddresses)
  end
  def put_ip_addresses(this : ITsSbTarget*, sockaddr : TSSD_ConnectionPoint*, numaddresses : UInt32) : HRESULT
    @lpVtbl.value.put_ip_addresses.call(this, sockaddr, numaddresses)
  end
  def get_target_state(this : ITsSbTarget*, pstate : TARGET_STATE*) : HRESULT
    @lpVtbl.value.get_target_state.call(this, pstate)
  end
  def put_target_state(this : ITsSbTarget*, state : TARGET_STATE) : HRESULT
    @lpVtbl.value.put_target_state.call(this, state)
  end
  def get_target_property_set(this : ITsSbTarget*, pppropertyset : ITsSbTargetPropertySet*) : HRESULT
    @lpVtbl.value.get_target_property_set.call(this, pppropertyset)
  end
  def put_target_property_set(this : ITsSbTarget*, pval : ITsSbTargetPropertySet) : HRESULT
    @lpVtbl.value.put_target_property_set.call(this, pval)
  end
  def get_environment_name(this : ITsSbTarget*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_environment_name.call(this, pval)
  end
  def put_environment_name(this : ITsSbTarget*, val : UInt8*) : HRESULT
    @lpVtbl.value.put_environment_name.call(this, val)
  end
  def get_num_sessions(this : ITsSbTarget*, pnumsessions : UInt32*) : HRESULT
    @lpVtbl.value.get_num_sessions.call(this, pnumsessions)
  end
  def get_num_pending_connections(this : ITsSbTarget*, pnumpendingconnections : UInt32*) : HRESULT
    @lpVtbl.value.get_num_pending_connections.call(this, pnumpendingconnections)
  end
  def get_target_load(this : ITsSbTarget*, ptargetload : UInt32*) : HRESULT
    @lpVtbl.value.get_target_load.call(this, ptargetload)
  end
end
struct LibWin32::ITsSbSession
  def query_interface(this : ITsSbSession*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbSession*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbSession*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_session_id(this : ITsSbSession*, pval : UInt32*) : HRESULT
    @lpVtbl.value.get_session_id.call(this, pval)
  end
  def get_target_name(this : ITsSbSession*, targetname : UInt8**) : HRESULT
    @lpVtbl.value.get_target_name.call(this, targetname)
  end
  def put_target_name(this : ITsSbSession*, targetname : UInt8*) : HRESULT
    @lpVtbl.value.put_target_name.call(this, targetname)
  end
  def get_username(this : ITsSbSession*, username : UInt8**) : HRESULT
    @lpVtbl.value.get_username.call(this, username)
  end
  def get_domain(this : ITsSbSession*, domain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, domain)
  end
  def get_state(this : ITsSbSession*, pstate : TSSESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, pstate)
  end
  def put_state(this : ITsSbSession*, state : TSSESSION_STATE) : HRESULT
    @lpVtbl.value.put_state.call(this, state)
  end
  def get_create_time(this : ITsSbSession*, ptime : FILETIME*) : HRESULT
    @lpVtbl.value.get_create_time.call(this, ptime)
  end
  def put_create_time(this : ITsSbSession*, time : FILETIME) : HRESULT
    @lpVtbl.value.put_create_time.call(this, time)
  end
  def get_disconnect_time(this : ITsSbSession*, ptime : FILETIME*) : HRESULT
    @lpVtbl.value.get_disconnect_time.call(this, ptime)
  end
  def put_disconnect_time(this : ITsSbSession*, time : FILETIME) : HRESULT
    @lpVtbl.value.put_disconnect_time.call(this, time)
  end
  def get_initial_program(this : ITsSbSession*, app : UInt8**) : HRESULT
    @lpVtbl.value.get_initial_program.call(this, app)
  end
  def put_initial_program(this : ITsSbSession*, application : UInt8*) : HRESULT
    @lpVtbl.value.put_initial_program.call(this, application)
  end
  def get_client_display(this : ITsSbSession*, pclientdisplay : CLIENT_DISPLAY*) : HRESULT
    @lpVtbl.value.get_client_display.call(this, pclientdisplay)
  end
  def put_client_display(this : ITsSbSession*, pclientdisplay : CLIENT_DISPLAY) : HRESULT
    @lpVtbl.value.put_client_display.call(this, pclientdisplay)
  end
  def get_protocol_type(this : ITsSbSession*, pval : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_type.call(this, pval)
  end
  def put_protocol_type(this : ITsSbSession*, val : UInt32) : HRESULT
    @lpVtbl.value.put_protocol_type.call(this, val)
  end
end
struct LibWin32::ITsSbResourceNotification
  def query_interface(this : ITsSbResourceNotification*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbResourceNotification*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbResourceNotification*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def notify_session_change(this : ITsSbResourceNotification*, changetype : TSSESSION_STATE, psession : ITsSbSession) : HRESULT
    @lpVtbl.value.notify_session_change.call(this, changetype, psession)
  end
  def notify_target_change(this : ITsSbResourceNotification*, targetchangetype : UInt32, ptarget : ITsSbTarget) : HRESULT
    @lpVtbl.value.notify_target_change.call(this, targetchangetype, ptarget)
  end
  def notify_client_connection_state_change(this : ITsSbResourceNotification*, changetype : CONNECTION_CHANGE_NOTIFICATION, pconnection : ITsSbClientConnection) : HRESULT
    @lpVtbl.value.notify_client_connection_state_change.call(this, changetype, pconnection)
  end
end
struct LibWin32::ITsSbResourceNotificationEx
  def query_interface(this : ITsSbResourceNotificationEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbResourceNotificationEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbResourceNotificationEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def notify_session_change_ex(this : ITsSbResourceNotificationEx*, targetname : UInt8*, username : UInt8*, domain : UInt8*, sessionid : UInt32, sessionstate : TSSESSION_STATE) : HRESULT
    @lpVtbl.value.notify_session_change_ex.call(this, targetname, username, domain, sessionid, sessionstate)
  end
  def notify_target_change_ex(this : ITsSbResourceNotificationEx*, targetname : UInt8*, targetchangetype : UInt32) : HRESULT
    @lpVtbl.value.notify_target_change_ex.call(this, targetname, targetchangetype)
  end
  def notify_client_connection_state_change_ex(this : ITsSbResourceNotificationEx*, username : UInt8*, domain : UInt8*, initialprogram : UInt8*, poolname : UInt8*, targetname : UInt8*, connectionchangetype : CONNECTION_CHANGE_NOTIFICATION) : HRESULT
    @lpVtbl.value.notify_client_connection_state_change_ex.call(this, username, domain, initialprogram, poolname, targetname, connectionchangetype)
  end
end
struct LibWin32::ITsSbTaskInfo
  def query_interface(this : ITsSbTaskInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbTaskInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbTaskInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_target_id(this : ITsSbTaskInfo*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_target_id.call(this, pname)
  end
  def get_start_time(this : ITsSbTaskInfo*, pstarttime : FILETIME*) : HRESULT
    @lpVtbl.value.get_start_time.call(this, pstarttime)
  end
  def get_end_time(this : ITsSbTaskInfo*, pendtime : FILETIME*) : HRESULT
    @lpVtbl.value.get_end_time.call(this, pendtime)
  end
  def get_deadline(this : ITsSbTaskInfo*, pdeadline : FILETIME*) : HRESULT
    @lpVtbl.value.get_deadline.call(this, pdeadline)
  end
  def get_identifier(this : ITsSbTaskInfo*, pidentifier : UInt8**) : HRESULT
    @lpVtbl.value.get_identifier.call(this, pidentifier)
  end
  def get_label(this : ITsSbTaskInfo*, plabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, plabel)
  end
  def get_context(this : ITsSbTaskInfo*, pcontext : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_context.call(this, pcontext)
  end
  def get_plugin(this : ITsSbTaskInfo*, pplugin : UInt8**) : HRESULT
    @lpVtbl.value.get_plugin.call(this, pplugin)
  end
  def get_status(this : ITsSbTaskInfo*, pstatus : RDV_TASK_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
end
struct LibWin32::ITsSbTaskPlugin
  def query_interface(this : ITsSbTaskPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbTaskPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbTaskPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ITsSbTaskPlugin*, pprovider : ITsSbProvider, pnotifysink : ITsSbPluginNotifySink, ppropertyset : ITsSbPluginPropertySet) : HRESULT
    @lpVtbl.value.initialize.call(this, pprovider, pnotifysink, ppropertyset)
  end
  def terminate(this : ITsSbTaskPlugin*, hr : HRESULT) : HRESULT
    @lpVtbl.value.terminate.call(this, hr)
  end
  def initialize_task_plugin(this : ITsSbTaskPlugin*, pitssbtaskpluginnotifysink : ITsSbTaskPluginNotifySink) : HRESULT
    @lpVtbl.value.initialize_task_plugin.call(this, pitssbtaskpluginnotifysink)
  end
  def set_task_queue(this : ITsSbTaskPlugin*, pszhostname : UInt8*, sbtaskinfosize : UInt32, pitssbtaskinfo : ITsSbTaskInfo*) : HRESULT
    @lpVtbl.value.set_task_queue.call(this, pszhostname, sbtaskinfosize, pitssbtaskinfo)
  end
end
struct LibWin32::ITsSbPropertySet
  def query_interface(this : ITsSbPropertySet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbPropertySet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbPropertySet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : ITsSbPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*, perrorlog : IErrorLog) : HRESULT
    @lpVtbl.value.read.call(this, pszpropname, pvar, perrorlog)
  end
  def write(this : ITsSbPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.write.call(this, pszpropname, pvar)
  end
end
struct LibWin32::ITsSbPluginPropertySet
  def query_interface(this : ITsSbPluginPropertySet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbPluginPropertySet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbPluginPropertySet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : ITsSbPluginPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*, perrorlog : IErrorLog) : HRESULT
    @lpVtbl.value.read.call(this, pszpropname, pvar, perrorlog)
  end
  def write(this : ITsSbPluginPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.write.call(this, pszpropname, pvar)
  end
end
struct LibWin32::ITsSbClientConnectionPropertySet
  def query_interface(this : ITsSbClientConnectionPropertySet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbClientConnectionPropertySet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbClientConnectionPropertySet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : ITsSbClientConnectionPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*, perrorlog : IErrorLog) : HRESULT
    @lpVtbl.value.read.call(this, pszpropname, pvar, perrorlog)
  end
  def write(this : ITsSbClientConnectionPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.write.call(this, pszpropname, pvar)
  end
end
struct LibWin32::ITsSbTargetPropertySet
  def query_interface(this : ITsSbTargetPropertySet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbTargetPropertySet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbTargetPropertySet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : ITsSbTargetPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*, perrorlog : IErrorLog) : HRESULT
    @lpVtbl.value.read.call(this, pszpropname, pvar, perrorlog)
  end
  def write(this : ITsSbTargetPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.write.call(this, pszpropname, pvar)
  end
end
struct LibWin32::ITsSbEnvironmentPropertySet
  def query_interface(this : ITsSbEnvironmentPropertySet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbEnvironmentPropertySet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbEnvironmentPropertySet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : ITsSbEnvironmentPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*, perrorlog : IErrorLog) : HRESULT
    @lpVtbl.value.read.call(this, pszpropname, pvar, perrorlog)
  end
  def write(this : ITsSbEnvironmentPropertySet*, pszpropname : LibC::LPWSTR, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.write.call(this, pszpropname, pvar)
  end
end
struct LibWin32::ITsSbBaseNotifySink
  def query_interface(this : ITsSbBaseNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbBaseNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbBaseNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_error(this : ITsSbBaseNotifySink*, hrerror : HRESULT) : HRESULT
    @lpVtbl.value.on_error.call(this, hrerror)
  end
  def on_report_status(this : ITsSbBaseNotifySink*, messagetype : CLIENT_MESSAGE_TYPE, messageid : UInt32) : HRESULT
    @lpVtbl.value.on_report_status.call(this, messagetype, messageid)
  end
end
struct LibWin32::ITsSbPluginNotifySink
  def query_interface(this : ITsSbPluginNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbPluginNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbPluginNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_error(this : ITsSbPluginNotifySink*, hrerror : HRESULT) : HRESULT
    @lpVtbl.value.on_error.call(this, hrerror)
  end
  def on_report_status(this : ITsSbPluginNotifySink*, messagetype : CLIENT_MESSAGE_TYPE, messageid : UInt32) : HRESULT
    @lpVtbl.value.on_report_status.call(this, messagetype, messageid)
  end
  def on_initialized(this : ITsSbPluginNotifySink*, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_initialized.call(this, hr)
  end
  def on_terminated(this : ITsSbPluginNotifySink*) : HRESULT
    @lpVtbl.value.on_terminated.call(this)
  end
end
struct LibWin32::ITsSbLoadBalancingNotifySink
  def query_interface(this : ITsSbLoadBalancingNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbLoadBalancingNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbLoadBalancingNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_error(this : ITsSbLoadBalancingNotifySink*, hrerror : HRESULT) : HRESULT
    @lpVtbl.value.on_error.call(this, hrerror)
  end
  def on_report_status(this : ITsSbLoadBalancingNotifySink*, messagetype : CLIENT_MESSAGE_TYPE, messageid : UInt32) : HRESULT
    @lpVtbl.value.on_report_status.call(this, messagetype, messageid)
  end
  def on_get_most_suitable_target(this : ITsSbLoadBalancingNotifySink*, plbresult : ITsSbLoadBalanceResult, fisnewconnection : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_get_most_suitable_target.call(this, plbresult, fisnewconnection)
  end
end
struct LibWin32::ITsSbPlacementNotifySink
  def query_interface(this : ITsSbPlacementNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbPlacementNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbPlacementNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_error(this : ITsSbPlacementNotifySink*, hrerror : HRESULT) : HRESULT
    @lpVtbl.value.on_error.call(this, hrerror)
  end
  def on_report_status(this : ITsSbPlacementNotifySink*, messagetype : CLIENT_MESSAGE_TYPE, messageid : UInt32) : HRESULT
    @lpVtbl.value.on_report_status.call(this, messagetype, messageid)
  end
  def on_query_environment_completed(this : ITsSbPlacementNotifySink*, penvironment : ITsSbEnvironment) : HRESULT
    @lpVtbl.value.on_query_environment_completed.call(this, penvironment)
  end
end
struct LibWin32::ITsSbOrchestrationNotifySink
  def query_interface(this : ITsSbOrchestrationNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbOrchestrationNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbOrchestrationNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_error(this : ITsSbOrchestrationNotifySink*, hrerror : HRESULT) : HRESULT
    @lpVtbl.value.on_error.call(this, hrerror)
  end
  def on_report_status(this : ITsSbOrchestrationNotifySink*, messagetype : CLIENT_MESSAGE_TYPE, messageid : UInt32) : HRESULT
    @lpVtbl.value.on_report_status.call(this, messagetype, messageid)
  end
  def on_ready_to_connect(this : ITsSbOrchestrationNotifySink*, ptarget : ITsSbTarget) : HRESULT
    @lpVtbl.value.on_ready_to_connect.call(this, ptarget)
  end
end
struct LibWin32::ITsSbTaskPluginNotifySink
  def query_interface(this : ITsSbTaskPluginNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbTaskPluginNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbTaskPluginNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_error(this : ITsSbTaskPluginNotifySink*, hrerror : HRESULT) : HRESULT
    @lpVtbl.value.on_error.call(this, hrerror)
  end
  def on_report_status(this : ITsSbTaskPluginNotifySink*, messagetype : CLIENT_MESSAGE_TYPE, messageid : UInt32) : HRESULT
    @lpVtbl.value.on_report_status.call(this, messagetype, messageid)
  end
  def on_set_task_time(this : ITsSbTaskPluginNotifySink*, sztargetname : UInt8*, taskstarttime : FILETIME, taskendtime : FILETIME, taskdeadline : FILETIME, sztasklabel : UInt8*, sztaskidentifier : UInt8*, sztaskplugin : UInt8*, dwtaskstatus : UInt32, sacontext : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_set_task_time.call(this, sztargetname, taskstarttime, taskendtime, taskdeadline, sztasklabel, sztaskidentifier, sztaskplugin, dwtaskstatus, sacontext)
  end
  def on_delete_task_time(this : ITsSbTaskPluginNotifySink*, sztargetname : UInt8*, sztaskidentifier : UInt8*) : HRESULT
    @lpVtbl.value.on_delete_task_time.call(this, sztargetname, sztaskidentifier)
  end
  def on_update_task_status(this : ITsSbTaskPluginNotifySink*, sztargetname : UInt8*, taskidentifier : UInt8*, taskstatus : RDV_TASK_STATUS) : HRESULT
    @lpVtbl.value.on_update_task_status.call(this, sztargetname, taskidentifier, taskstatus)
  end
  def on_report_tasks(this : ITsSbTaskPluginNotifySink*, szhostname : UInt8*) : HRESULT
    @lpVtbl.value.on_report_tasks.call(this, szhostname)
  end
end
struct LibWin32::ITsSbClientConnection
  def query_interface(this : ITsSbClientConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbClientConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbClientConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_user_name(this : ITsSbClientConnection*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.call(this, pval)
  end
  def get_domain(this : ITsSbClientConnection*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pval)
  end
  def get_initial_program(this : ITsSbClientConnection*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_initial_program.call(this, pval)
  end
  def get_load_balance_result(this : ITsSbClientConnection*, ppval : ITsSbLoadBalanceResult*) : HRESULT
    @lpVtbl.value.get_load_balance_result.call(this, ppval)
  end
  def get_farm_name(this : ITsSbClientConnection*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_farm_name.call(this, pval)
  end
  def put_context(this : ITsSbClientConnection*, contextid : UInt8*, context : VARIANT, existingcontext : VARIANT*) : HRESULT
    @lpVtbl.value.put_context.call(this, contextid, context, existingcontext)
  end
  def get_context(this : ITsSbClientConnection*, contextid : UInt8*, context : VARIANT*) : HRESULT
    @lpVtbl.value.get_context.call(this, contextid, context)
  end
  def get_environment(this : ITsSbClientConnection*, ppenvironment : ITsSbEnvironment*) : HRESULT
    @lpVtbl.value.get_environment.call(this, ppenvironment)
  end
  def get_connection_error(this : ITsSbClientConnection*) : HRESULT
    @lpVtbl.value.get_connection_error.call(this)
  end
  def get_sam_user_account(this : ITsSbClientConnection*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_sam_user_account.call(this, pval)
  end
  def get_client_connection_property_set(this : ITsSbClientConnection*, pppropertyset : ITsSbClientConnectionPropertySet*) : HRESULT
    @lpVtbl.value.get_client_connection_property_set.call(this, pppropertyset)
  end
  def get_is_first_assignment(this : ITsSbClientConnection*, ppval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_first_assignment.call(this, ppval)
  end
  def get_rd_farm_type(this : ITsSbClientConnection*, prdfarmtype : RD_FARM_TYPE*) : HRESULT
    @lpVtbl.value.get_rd_farm_type.call(this, prdfarmtype)
  end
  def get_user_sid_string(this : ITsSbClientConnection*, pszusersidstring : Int8**) : HRESULT
    @lpVtbl.value.get_user_sid_string.call(this, pszusersidstring)
  end
  def get_disconnected_session(this : ITsSbClientConnection*, ppsession : ITsSbSession*) : HRESULT
    @lpVtbl.value.get_disconnected_session.call(this, ppsession)
  end
end
struct LibWin32::ITsSbProvider
  def query_interface(this : ITsSbProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_target_object(this : ITsSbProvider*, targetname : UInt8*, environmentname : UInt8*, pptarget : ITsSbTarget*) : HRESULT
    @lpVtbl.value.create_target_object.call(this, targetname, environmentname, pptarget)
  end
  def create_load_balance_result_object(this : ITsSbProvider*, targetname : UInt8*, pplbresult : ITsSbLoadBalanceResult*) : HRESULT
    @lpVtbl.value.create_load_balance_result_object.call(this, targetname, pplbresult)
  end
  def create_session_object(this : ITsSbProvider*, targetname : UInt8*, username : UInt8*, domain : UInt8*, sessionid : UInt32, ppsession : ITsSbSession*) : HRESULT
    @lpVtbl.value.create_session_object.call(this, targetname, username, domain, sessionid, ppsession)
  end
  def create_plugin_property_set(this : ITsSbProvider*, pppropertyset : ITsSbPluginPropertySet*) : HRESULT
    @lpVtbl.value.create_plugin_property_set.call(this, pppropertyset)
  end
  def create_target_property_set_object(this : ITsSbProvider*, pppropertyset : ITsSbTargetPropertySet*) : HRESULT
    @lpVtbl.value.create_target_property_set_object.call(this, pppropertyset)
  end
  def create_environment_object(this : ITsSbProvider*, name : UInt8*, serverweight : UInt32, ppenvironment : ITsSbEnvironment*) : HRESULT
    @lpVtbl.value.create_environment_object.call(this, name, serverweight, ppenvironment)
  end
  def get_resource_plugin_store(this : ITsSbProvider*, ppstore : ITsSbResourcePluginStore*) : HRESULT
    @lpVtbl.value.get_resource_plugin_store.call(this, ppstore)
  end
  def get_filter_plugin_store(this : ITsSbProvider*, ppstore : ITsSbFilterPluginStore*) : HRESULT
    @lpVtbl.value.get_filter_plugin_store.call(this, ppstore)
  end
  def register_for_notification(this : ITsSbProvider*, notificationtype : UInt32, resourcetomonitor : UInt8*, ppluginnotification : ITsSbResourceNotification) : HRESULT
    @lpVtbl.value.register_for_notification.call(this, notificationtype, resourcetomonitor, ppluginnotification)
  end
  def un_register_for_notification(this : ITsSbProvider*, notificationtype : UInt32, resourcetomonitor : UInt8*) : HRESULT
    @lpVtbl.value.un_register_for_notification.call(this, notificationtype, resourcetomonitor)
  end
  def get_instance_of_global_store(this : ITsSbProvider*, ppglobalstore : ITsSbGlobalStore*) : HRESULT
    @lpVtbl.value.get_instance_of_global_store.call(this, ppglobalstore)
  end
  def create_environment_property_set_object(this : ITsSbProvider*, pppropertyset : ITsSbEnvironmentPropertySet*) : HRESULT
    @lpVtbl.value.create_environment_property_set_object.call(this, pppropertyset)
  end
end
struct LibWin32::ITsSbResourcePluginStore
  def query_interface(this : ITsSbResourcePluginStore*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbResourcePluginStore*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbResourcePluginStore*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_target(this : ITsSbResourcePluginStore*, targetname : UInt8*, farmname : UInt8*, pptarget : ITsSbTarget*) : HRESULT
    @lpVtbl.value.query_target.call(this, targetname, farmname, pptarget)
  end
  def query_session_by_session_id(this : ITsSbResourcePluginStore*, dwsessionid : UInt32, targetname : UInt8*, ppsession : ITsSbSession*) : HRESULT
    @lpVtbl.value.query_session_by_session_id.call(this, dwsessionid, targetname, ppsession)
  end
  def add_target_to_store(this : ITsSbResourcePluginStore*, ptarget : ITsSbTarget) : HRESULT
    @lpVtbl.value.add_target_to_store.call(this, ptarget)
  end
  def add_session_to_store(this : ITsSbResourcePluginStore*, psession : ITsSbSession) : HRESULT
    @lpVtbl.value.add_session_to_store.call(this, psession)
  end
  def add_environment_to_store(this : ITsSbResourcePluginStore*, penvironment : ITsSbEnvironment) : HRESULT
    @lpVtbl.value.add_environment_to_store.call(this, penvironment)
  end
  def remove_environment_from_store(this : ITsSbResourcePluginStore*, environmentname : UInt8*, bignoreowner : LibC::BOOL) : HRESULT
    @lpVtbl.value.remove_environment_from_store.call(this, environmentname, bignoreowner)
  end
  def enumerate_farms(this : ITsSbResourcePluginStore*, pdwcount : UInt32*, pval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.enumerate_farms.call(this, pdwcount, pval)
  end
  def query_environment(this : ITsSbResourcePluginStore*, environmentname : UInt8*, ppenvironment : ITsSbEnvironment*) : HRESULT
    @lpVtbl.value.query_environment.call(this, environmentname, ppenvironment)
  end
  def enumerate_environments(this : ITsSbResourcePluginStore*, pdwcount : UInt32*, pval : ITsSbEnvironment**) : HRESULT
    @lpVtbl.value.enumerate_environments.call(this, pdwcount, pval)
  end
  def save_target(this : ITsSbResourcePluginStore*, ptarget : ITsSbTarget, bforcewrite : LibC::BOOL) : HRESULT
    @lpVtbl.value.save_target.call(this, ptarget, bforcewrite)
  end
  def save_environment(this : ITsSbResourcePluginStore*, penvironment : ITsSbEnvironment, bforcewrite : LibC::BOOL) : HRESULT
    @lpVtbl.value.save_environment.call(this, penvironment, bforcewrite)
  end
  def save_session(this : ITsSbResourcePluginStore*, psession : ITsSbSession) : HRESULT
    @lpVtbl.value.save_session.call(this, psession)
  end
  def set_target_property(this : ITsSbResourcePluginStore*, targetname : UInt8*, propertyname : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.set_target_property.call(this, targetname, propertyname, pproperty)
  end
  def set_environment_property(this : ITsSbResourcePluginStore*, environmentname : UInt8*, propertyname : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.set_environment_property.call(this, environmentname, propertyname, pproperty)
  end
  def set_target_state(this : ITsSbResourcePluginStore*, targetname : UInt8*, newstate : TARGET_STATE, poldstate : TARGET_STATE*) : HRESULT
    @lpVtbl.value.set_target_state.call(this, targetname, newstate, poldstate)
  end
  def set_session_state(this : ITsSbResourcePluginStore*, sbsession : ITsSbSession) : HRESULT
    @lpVtbl.value.set_session_state.call(this, sbsession)
  end
  def enumerate_targets(this : ITsSbResourcePluginStore*, farmname : UInt8*, envname : UInt8*, sortbyfieldid : TS_SB_SORT_BY, sortybypropname : UInt8*, pdwcount : UInt32*, pval : ITsSbTarget**) : HRESULT
    @lpVtbl.value.enumerate_targets.call(this, farmname, envname, sortbyfieldid, sortybypropname, pdwcount, pval)
  end
  def enumerate_sessions(this : ITsSbResourcePluginStore*, targetname : UInt8*, username : UInt8*, userdomain : UInt8*, poolname : UInt8*, initialprogram : UInt8*, psessionstate : TSSESSION_STATE*, pdwcount : UInt32*, ppval : ITsSbSession**) : HRESULT
    @lpVtbl.value.enumerate_sessions.call(this, targetname, username, userdomain, poolname, initialprogram, psessionstate, pdwcount, ppval)
  end
  def get_farm_property(this : ITsSbResourcePluginStore*, farmname : UInt8*, propertyname : UInt8*, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_farm_property.call(this, farmname, propertyname, pvarvalue)
  end
  def delete_target(this : ITsSbResourcePluginStore*, targetname : UInt8*, hostname : UInt8*) : HRESULT
    @lpVtbl.value.delete_target.call(this, targetname, hostname)
  end
  def set_target_property_with_version_check(this : ITsSbResourcePluginStore*, ptarget : ITsSbTarget, propertyname : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.set_target_property_with_version_check.call(this, ptarget, propertyname, pproperty)
  end
  def set_environment_property_with_version_check(this : ITsSbResourcePluginStore*, penvironment : ITsSbEnvironment, propertyname : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.set_environment_property_with_version_check.call(this, penvironment, propertyname, pproperty)
  end
  def acquire_target_lock(this : ITsSbResourcePluginStore*, targetname : UInt8*, dwtimeout : UInt32, ppcontext : IUnknown*) : HRESULT
    @lpVtbl.value.acquire_target_lock.call(this, targetname, dwtimeout, ppcontext)
  end
  def release_target_lock(this : ITsSbResourcePluginStore*, pcontext : IUnknown) : HRESULT
    @lpVtbl.value.release_target_lock.call(this, pcontext)
  end
  def test_and_set_server_state(this : ITsSbResourcePluginStore*, poolname : UInt8*, serverfqdn : UInt8*, newstate : TARGET_STATE, teststate : TARGET_STATE, pinitstate : TARGET_STATE*) : HRESULT
    @lpVtbl.value.test_and_set_server_state.call(this, poolname, serverfqdn, newstate, teststate, pinitstate)
  end
  def set_server_waiting_to_start(this : ITsSbResourcePluginStore*, poolname : UInt8*, servername : UInt8*) : HRESULT
    @lpVtbl.value.set_server_waiting_to_start.call(this, poolname, servername)
  end
  def get_server_state(this : ITsSbResourcePluginStore*, poolname : UInt8*, serverfqdn : UInt8*, pstate : TARGET_STATE*) : HRESULT
    @lpVtbl.value.get_server_state.call(this, poolname, serverfqdn, pstate)
  end
  def set_server_drain_mode(this : ITsSbResourcePluginStore*, serverfqdn : UInt8*, drainmode : UInt32) : HRESULT
    @lpVtbl.value.set_server_drain_mode.call(this, serverfqdn, drainmode)
  end
end
struct LibWin32::ITsSbFilterPluginStore
  def query_interface(this : ITsSbFilterPluginStore*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbFilterPluginStore*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbFilterPluginStore*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def save_properties(this : ITsSbFilterPluginStore*, ppropertyset : ITsSbPropertySet) : HRESULT
    @lpVtbl.value.save_properties.call(this, ppropertyset)
  end
  def enumerate_properties(this : ITsSbFilterPluginStore*, pppropertyset : ITsSbPropertySet*) : HRESULT
    @lpVtbl.value.enumerate_properties.call(this, pppropertyset)
  end
  def delete_properties(this : ITsSbFilterPluginStore*, propertyname : UInt8*) : HRESULT
    @lpVtbl.value.delete_properties.call(this, propertyname)
  end
end
struct LibWin32::ITsSbGlobalStore
  def query_interface(this : ITsSbGlobalStore*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbGlobalStore*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbGlobalStore*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_target(this : ITsSbGlobalStore*, providername : UInt8*, targetname : UInt8*, farmname : UInt8*, pptarget : ITsSbTarget*) : HRESULT
    @lpVtbl.value.query_target.call(this, providername, targetname, farmname, pptarget)
  end
  def query_session_by_session_id(this : ITsSbGlobalStore*, providername : UInt8*, dwsessionid : UInt32, targetname : UInt8*, ppsession : ITsSbSession*) : HRESULT
    @lpVtbl.value.query_session_by_session_id.call(this, providername, dwsessionid, targetname, ppsession)
  end
  def enumerate_farms(this : ITsSbGlobalStore*, providername : UInt8*, pdwcount : UInt32*, pval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.enumerate_farms.call(this, providername, pdwcount, pval)
  end
  def enumerate_targets(this : ITsSbGlobalStore*, providername : UInt8*, farmname : UInt8*, envname : UInt8*, pdwcount : UInt32*, pval : ITsSbTarget**) : HRESULT
    @lpVtbl.value.enumerate_targets.call(this, providername, farmname, envname, pdwcount, pval)
  end
  def enumerate_environments_by_provider(this : ITsSbGlobalStore*, providername : UInt8*, pdwcount : UInt32*, ppval : ITsSbEnvironment**) : HRESULT
    @lpVtbl.value.enumerate_environments_by_provider.call(this, providername, pdwcount, ppval)
  end
  def enumerate_sessions(this : ITsSbGlobalStore*, providername : UInt8*, targetname : UInt8*, username : UInt8*, userdomain : UInt8*, poolname : UInt8*, initialprogram : UInt8*, psessionstate : TSSESSION_STATE*, pdwcount : UInt32*, ppval : ITsSbSession**) : HRESULT
    @lpVtbl.value.enumerate_sessions.call(this, providername, targetname, username, userdomain, poolname, initialprogram, psessionstate, pdwcount, ppval)
  end
  def get_farm_property(this : ITsSbGlobalStore*, farmname : UInt8*, propertyname : UInt8*, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_farm_property.call(this, farmname, propertyname, pvarvalue)
  end
end
struct LibWin32::ITsSbProvisioningPluginNotifySink
  def query_interface(this : ITsSbProvisioningPluginNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbProvisioningPluginNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbProvisioningPluginNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_job_created(this : ITsSbProvisioningPluginNotifySink*, pvmnotifyinfo : VM_NOTIFY_INFO*) : HRESULT
    @lpVtbl.value.on_job_created.call(this, pvmnotifyinfo)
  end
  def on_virtual_machine_status_changed(this : ITsSbProvisioningPluginNotifySink*, pvmnotifyentry : VM_NOTIFY_ENTRY*, vmnotifystatus : VM_NOTIFY_STATUS, errorcode : HRESULT, errordescr : UInt8*) : HRESULT
    @lpVtbl.value.on_virtual_machine_status_changed.call(this, pvmnotifyentry, vmnotifystatus, errorcode, errordescr)
  end
  def on_job_completed(this : ITsSbProvisioningPluginNotifySink*, resultcode : HRESULT, resultdescription : UInt8*) : HRESULT
    @lpVtbl.value.on_job_completed.call(this, resultcode, resultdescription)
  end
  def on_job_cancelled(this : ITsSbProvisioningPluginNotifySink*) : HRESULT
    @lpVtbl.value.on_job_cancelled.call(this)
  end
  def lock_virtual_machine(this : ITsSbProvisioningPluginNotifySink*, pvmnotifyentry : VM_NOTIFY_ENTRY*) : HRESULT
    @lpVtbl.value.lock_virtual_machine.call(this, pvmnotifyentry)
  end
  def on_virtual_machine_host_status_changed(this : ITsSbProvisioningPluginNotifySink*, vmhost : UInt8*, vmhostnotifystatus : VM_HOST_NOTIFY_STATUS, errorcode : HRESULT, errordescr : UInt8*) : HRESULT
    @lpVtbl.value.on_virtual_machine_host_status_changed.call(this, vmhost, vmhostnotifystatus, errorcode, errordescr)
  end
end
struct LibWin32::ITsSbProvisioning
  def query_interface(this : ITsSbProvisioning*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbProvisioning*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbProvisioning*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ITsSbProvisioning*, pprovider : ITsSbProvider, pnotifysink : ITsSbPluginNotifySink, ppropertyset : ITsSbPluginPropertySet) : HRESULT
    @lpVtbl.value.initialize.call(this, pprovider, pnotifysink, ppropertyset)
  end
  def terminate(this : ITsSbProvisioning*, hr : HRESULT) : HRESULT
    @lpVtbl.value.terminate.call(this, hr)
  end
  def create_virtual_machines(this : ITsSbProvisioning*, jobxmlstring : UInt8*, jobguid : UInt8*, psink : ITsSbProvisioningPluginNotifySink) : HRESULT
    @lpVtbl.value.create_virtual_machines.call(this, jobxmlstring, jobguid, psink)
  end
  def patch_virtual_machines(this : ITsSbProvisioning*, jobxmlstring : UInt8*, jobguid : UInt8*, psink : ITsSbProvisioningPluginNotifySink, pvmpatchinfo : VM_PATCH_INFO*) : HRESULT
    @lpVtbl.value.patch_virtual_machines.call(this, jobxmlstring, jobguid, psink, pvmpatchinfo)
  end
  def delete_virtual_machines(this : ITsSbProvisioning*, jobxmlstring : UInt8*, jobguid : UInt8*, psink : ITsSbProvisioningPluginNotifySink) : HRESULT
    @lpVtbl.value.delete_virtual_machines.call(this, jobxmlstring, jobguid, psink)
  end
  def cancel_job(this : ITsSbProvisioning*, jobguid : UInt8*) : HRESULT
    @lpVtbl.value.cancel_job.call(this, jobguid)
  end
end
struct LibWin32::ITsSbGenericNotifySink
  def query_interface(this : ITsSbGenericNotifySink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITsSbGenericNotifySink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITsSbGenericNotifySink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_completed(this : ITsSbGenericNotifySink*, status : HRESULT) : HRESULT
    @lpVtbl.value.on_completed.call(this, status)
  end
  def get_wait_timeout(this : ITsSbGenericNotifySink*, pfttimeout : FILETIME*) : HRESULT
    @lpVtbl.value.get_wait_timeout.call(this, pfttimeout)
  end
end
struct LibWin32::ItsPubPlugin
  def query_interface(this : ItsPubPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ItsPubPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ItsPubPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_resource_list(this : ItsPubPlugin*, userid : LibC::LPWSTR, pceapplistsize : Int32*, resourcelist : Pluginresource**) : HRESULT
    @lpVtbl.value.get_resource_list.call(this, userid, pceapplistsize, resourcelist)
  end
  def get_resource(this : ItsPubPlugin*, alias : LibC::LPWSTR, flags : Int32, resource : Pluginresource*) : HRESULT
    @lpVtbl.value.get_resource.call(this, alias, flags, resource)
  end
  def get_cache_last_update_time(this : ItsPubPlugin*, lastupdatetime : UInt64*) : HRESULT
    @lpVtbl.value.get_cache_last_update_time.call(this, lastupdatetime)
  end
  def get_plugin_name(this : ItsPubPlugin*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_plugin_name.call(this, pval)
  end
  def get_plugin_version(this : ItsPubPlugin*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_plugin_version.call(this, pval)
  end
  def resolve_resource(this : ItsPubPlugin*, resourcetype : UInt32*, resourcelocation : LibC::LPWSTR, endpointname : LibC::LPWSTR, userid : LibC::LPWSTR, alias : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.resolve_resource.call(this, resourcetype, resourcelocation, endpointname, userid, alias)
  end
end
struct LibWin32::ItsPubPlugin2
  def query_interface(this : ItsPubPlugin2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ItsPubPlugin2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ItsPubPlugin2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_resource_list(this : ItsPubPlugin2*, userid : LibC::LPWSTR, pceapplistsize : Int32*, resourcelist : Pluginresource**) : HRESULT
    @lpVtbl.value.get_resource_list.call(this, userid, pceapplistsize, resourcelist)
  end
  def get_resource(this : ItsPubPlugin2*, alias : LibC::LPWSTR, flags : Int32, resource : Pluginresource*) : HRESULT
    @lpVtbl.value.get_resource.call(this, alias, flags, resource)
  end
  def get_cache_last_update_time(this : ItsPubPlugin2*, lastupdatetime : UInt64*) : HRESULT
    @lpVtbl.value.get_cache_last_update_time.call(this, lastupdatetime)
  end
  def get_plugin_name(this : ItsPubPlugin2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_plugin_name.call(this, pval)
  end
  def get_plugin_version(this : ItsPubPlugin2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_plugin_version.call(this, pval)
  end
  def resolve_resource(this : ItsPubPlugin2*, resourcetype : UInt32*, resourcelocation : LibC::LPWSTR, endpointname : LibC::LPWSTR, userid : LibC::LPWSTR, alias : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.resolve_resource.call(this, resourcetype, resourcelocation, endpointname, userid, alias)
  end
  def get_resource2_list(this : ItsPubPlugin2*, userid : LibC::LPWSTR, pceapplistsize : Int32*, resourcelist : Pluginresource2**) : HRESULT
    @lpVtbl.value.get_resource2_list.call(this, userid, pceapplistsize, resourcelist)
  end
  def get_resource2(this : ItsPubPlugin2*, alias : LibC::LPWSTR, flags : Int32, resource : Pluginresource2*) : HRESULT
    @lpVtbl.value.get_resource2.call(this, alias, flags, resource)
  end
  def resolve_personal_desktop(this : ItsPubPlugin2*, userid : LibC::LPWSTR, poolid : LibC::LPWSTR, epdresolutiontype : TSPUB_PLUGIN_PD_RESOLUTION_TYPE, ppdassignmenttype : TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE*, endpointname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.resolve_personal_desktop.call(this, userid, poolid, epdresolutiontype, ppdassignmenttype, endpointname)
  end
  def delete_personal_desktop_assignment(this : ItsPubPlugin2*, userid : LibC::LPWSTR, poolid : LibC::LPWSTR, endpointname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_personal_desktop_assignment.call(this, userid, poolid, endpointname)
  end
end
struct LibWin32::IWorkspaceResTypeRegistry
  def query_interface(this : IWorkspaceResTypeRegistry*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWorkspaceResTypeRegistry*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWorkspaceResTypeRegistry*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWorkspaceResTypeRegistry*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWorkspaceResTypeRegistry*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWorkspaceResTypeRegistry*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWorkspaceResTypeRegistry*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def add_resource_type(this : IWorkspaceResTypeRegistry*, fmachinewide : Int16, bstrfileextension : UInt8*, bstrlauncher : UInt8*) : HRESULT
    @lpVtbl.value.add_resource_type.call(this, fmachinewide, bstrfileextension, bstrlauncher)
  end
  def delete_resource_type(this : IWorkspaceResTypeRegistry*, fmachinewide : Int16, bstrfileextension : UInt8*) : HRESULT
    @lpVtbl.value.delete_resource_type.call(this, fmachinewide, bstrfileextension)
  end
  def get_registered_file_extensions(this : IWorkspaceResTypeRegistry*, fmachinewide : Int16, psafileextensions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_registered_file_extensions.call(this, fmachinewide, psafileextensions)
  end
  def get_resource_type_info(this : IWorkspaceResTypeRegistry*, fmachinewide : Int16, bstrfileextension : UInt8*, pbstrlauncher : UInt8**) : HRESULT
    @lpVtbl.value.get_resource_type_info.call(this, fmachinewide, bstrfileextension, pbstrlauncher)
  end
  def modify_resource_type(this : IWorkspaceResTypeRegistry*, fmachinewide : Int16, bstrfileextension : UInt8*, bstrlauncher : UInt8*) : HRESULT
    @lpVtbl.value.modify_resource_type.call(this, fmachinewide, bstrfileextension, bstrlauncher)
  end
end
struct LibWin32::IWTSPlugin
  def query_interface(this : IWTSPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IWTSPlugin*, pchannelmgr : IWTSVirtualChannelManager) : HRESULT
    @lpVtbl.value.initialize.call(this, pchannelmgr)
  end
  def connected(this : IWTSPlugin*) : HRESULT
    @lpVtbl.value.connected.call(this)
  end
  def disconnected(this : IWTSPlugin*, dwdisconnectcode : UInt32) : HRESULT
    @lpVtbl.value.disconnected.call(this, dwdisconnectcode)
  end
  def terminated(this : IWTSPlugin*) : HRESULT
    @lpVtbl.value.terminated.call(this)
  end
end
struct LibWin32::IWTSListener
  def query_interface(this : IWTSListener*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSListener*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSListener*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_configuration(this : IWTSListener*, pppropertybag : IPropertyBag*) : HRESULT
    @lpVtbl.value.get_configuration.call(this, pppropertybag)
  end
end
struct LibWin32::IWTSListenerCallback
  def query_interface(this : IWTSListenerCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSListenerCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSListenerCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_new_channel_connection(this : IWTSListenerCallback*, pchannel : IWTSVirtualChannel, data : UInt8*, pbaccept : LibC::BOOL*, ppcallback : IWTSVirtualChannelCallback*) : HRESULT
    @lpVtbl.value.on_new_channel_connection.call(this, pchannel, data, pbaccept, ppcallback)
  end
end
struct LibWin32::IWTSVirtualChannelCallback
  def query_interface(this : IWTSVirtualChannelCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSVirtualChannelCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSVirtualChannelCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_data_received(this : IWTSVirtualChannelCallback*, cbsize : UInt32, pbuffer : UInt8*) : HRESULT
    @lpVtbl.value.on_data_received.call(this, cbsize, pbuffer)
  end
  def on_close(this : IWTSVirtualChannelCallback*) : HRESULT
    @lpVtbl.value.on_close.call(this)
  end
end
struct LibWin32::IWTSVirtualChannelManager
  def query_interface(this : IWTSVirtualChannelManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSVirtualChannelManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSVirtualChannelManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_listener(this : IWTSVirtualChannelManager*, pszchannelname : UInt8*, uflags : UInt32, plistenercallback : IWTSListenerCallback, pplistener : IWTSListener*) : HRESULT
    @lpVtbl.value.create_listener.call(this, pszchannelname, uflags, plistenercallback, pplistener)
  end
end
struct LibWin32::IWTSVirtualChannel
  def query_interface(this : IWTSVirtualChannel*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSVirtualChannel*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSVirtualChannel*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def write(this : IWTSVirtualChannel*, cbsize : UInt32, pbuffer : UInt8*, preserved : IUnknown) : HRESULT
    @lpVtbl.value.write.call(this, cbsize, pbuffer, preserved)
  end
  def close(this : IWTSVirtualChannel*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
end
struct LibWin32::IWTSPluginServiceProvider
  def query_interface(this : IWTSPluginServiceProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSPluginServiceProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSPluginServiceProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_service(this : IWTSPluginServiceProvider*, serviceid : Guid, ppunkobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_service.call(this, serviceid, ppunkobject)
  end
end
struct LibWin32::IWTSBitmapRenderer
  def query_interface(this : IWTSBitmapRenderer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSBitmapRenderer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSBitmapRenderer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def render(this : IWTSBitmapRenderer*, imageformat : Guid, dwwidth : UInt32, dwheight : UInt32, cbstride : Int32, cbimagebuffer : UInt32, pimagebuffer : UInt8*) : HRESULT
    @lpVtbl.value.render.call(this, imageformat, dwwidth, dwheight, cbstride, cbimagebuffer, pimagebuffer)
  end
  def get_renderer_statistics(this : IWTSBitmapRenderer*, pstatistics : BITMAP_RENDERER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_renderer_statistics.call(this, pstatistics)
  end
  def remove_mapping(this : IWTSBitmapRenderer*) : HRESULT
    @lpVtbl.value.remove_mapping.call(this)
  end
end
struct LibWin32::IWTSBitmapRendererCallback
  def query_interface(this : IWTSBitmapRendererCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSBitmapRendererCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSBitmapRendererCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_target_size_changed(this : IWTSBitmapRendererCallback*, rcnewsize : RECT) : HRESULT
    @lpVtbl.value.on_target_size_changed.call(this, rcnewsize)
  end
end
struct LibWin32::IWTSBitmapRenderService
  def query_interface(this : IWTSBitmapRenderService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSBitmapRenderService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSBitmapRenderService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_mapped_renderer(this : IWTSBitmapRenderService*, mappingid : UInt64, pmappedrenderercallback : IWTSBitmapRendererCallback, ppmappedrenderer : IWTSBitmapRenderer*) : HRESULT
    @lpVtbl.value.get_mapped_renderer.call(this, mappingid, pmappedrenderercallback, ppmappedrenderer)
  end
end
struct LibWin32::IWRdsGraphicsChannelEvents
  def query_interface(this : IWRdsGraphicsChannelEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsGraphicsChannelEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsGraphicsChannelEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_data_received(this : IWRdsGraphicsChannelEvents*, cbsize : UInt32, pbuffer : UInt8*) : HRESULT
    @lpVtbl.value.on_data_received.call(this, cbsize, pbuffer)
  end
  def on_close(this : IWRdsGraphicsChannelEvents*) : HRESULT
    @lpVtbl.value.on_close.call(this)
  end
  def on_channel_opened(this : IWRdsGraphicsChannelEvents*, openresult : HRESULT, popencontext : IUnknown) : HRESULT
    @lpVtbl.value.on_channel_opened.call(this, openresult, popencontext)
  end
  def on_data_sent(this : IWRdsGraphicsChannelEvents*, pwritecontext : IUnknown, bcancelled : LibC::BOOL, pbuffer : UInt8*, cbbuffer : UInt32) : HRESULT
    @lpVtbl.value.on_data_sent.call(this, pwritecontext, bcancelled, pbuffer, cbbuffer)
  end
  def on_metrics_update(this : IWRdsGraphicsChannelEvents*, bandwidth : UInt32, rtt : UInt32, lastsentbyteindex : UInt64) : HRESULT
    @lpVtbl.value.on_metrics_update.call(this, bandwidth, rtt, lastsentbyteindex)
  end
end
struct LibWin32::IWRdsGraphicsChannel
  def query_interface(this : IWRdsGraphicsChannel*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsGraphicsChannel*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsGraphicsChannel*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def write(this : IWRdsGraphicsChannel*, cbsize : UInt32, pbuffer : UInt8*, pcontext : IUnknown) : HRESULT
    @lpVtbl.value.write.call(this, cbsize, pbuffer, pcontext)
  end
  def close(this : IWRdsGraphicsChannel*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def open(this : IWRdsGraphicsChannel*, pchannelevents : IWRdsGraphicsChannelEvents, popencontext : IUnknown) : HRESULT
    @lpVtbl.value.open.call(this, pchannelevents, popencontext)
  end
end
struct LibWin32::IWRdsGraphicsChannelManager
  def query_interface(this : IWRdsGraphicsChannelManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsGraphicsChannelManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsGraphicsChannelManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_channel(this : IWRdsGraphicsChannelManager*, pszchannelname : UInt8*, channeltype : WRdsGraphicsChannelType, ppvirtualchannel : IWRdsGraphicsChannel*) : HRESULT
    @lpVtbl.value.create_channel.call(this, pszchannelname, channeltype, ppvirtualchannel)
  end
end
struct LibWin32::IWTSProtocolManager
  def query_interface(this : IWTSProtocolManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_listener(this : IWTSProtocolManager*, wszlistenername : LibC::LPWSTR, pprotocollistener : IWTSProtocolListener*) : HRESULT
    @lpVtbl.value.create_listener.call(this, wszlistenername, pprotocollistener)
  end
  def notify_service_state_change(this : IWTSProtocolManager*, ptsservicestatechange : WTS_SERVICE_STATE*) : HRESULT
    @lpVtbl.value.notify_service_state_change.call(this, ptsservicestatechange)
  end
  def notify_session_of_service_start(this : IWTSProtocolManager*, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.notify_session_of_service_start.call(this, sessionid)
  end
  def notify_session_of_service_stop(this : IWTSProtocolManager*, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.notify_session_of_service_stop.call(this, sessionid)
  end
  def notify_session_state_change(this : IWTSProtocolManager*, sessionid : WTS_SESSION_ID*, eventid : UInt32) : HRESULT
    @lpVtbl.value.notify_session_state_change.call(this, sessionid, eventid)
  end
end
struct LibWin32::IWTSProtocolListener
  def query_interface(this : IWTSProtocolListener*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolListener*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolListener*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start_listen(this : IWTSProtocolListener*, pcallback : IWTSProtocolListenerCallback) : HRESULT
    @lpVtbl.value.start_listen.call(this, pcallback)
  end
  def stop_listen(this : IWTSProtocolListener*) : HRESULT
    @lpVtbl.value.stop_listen.call(this)
  end
end
struct LibWin32::IWTSProtocolListenerCallback
  def query_interface(this : IWTSProtocolListenerCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolListenerCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolListenerCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_connected(this : IWTSProtocolListenerCallback*, pconnection : IWTSProtocolConnection, pcallback : IWTSProtocolConnectionCallback*) : HRESULT
    @lpVtbl.value.on_connected.call(this, pconnection, pcallback)
  end
end
struct LibWin32::IWTSProtocolConnection
  def query_interface(this : IWTSProtocolConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_logon_error_redirector(this : IWTSProtocolConnection*, pplogonerrorredir : IWTSProtocolLogonErrorRedirector*) : HRESULT
    @lpVtbl.value.get_logon_error_redirector.call(this, pplogonerrorredir)
  end
  def send_policy_data(this : IWTSProtocolConnection*, ppolicydata : WTS_POLICY_DATA*) : HRESULT
    @lpVtbl.value.send_policy_data.call(this, ppolicydata)
  end
  def accept_connection(this : IWTSProtocolConnection*) : HRESULT
    @lpVtbl.value.accept_connection.call(this)
  end
  def get_client_data(this : IWTSProtocolConnection*, pclientdata : WTS_CLIENT_DATA*) : HRESULT
    @lpVtbl.value.get_client_data.call(this, pclientdata)
  end
  def get_user_credentials(this : IWTSProtocolConnection*, pusercreds : WTS_USER_CREDENTIAL*) : HRESULT
    @lpVtbl.value.get_user_credentials.call(this, pusercreds)
  end
  def get_license_connection(this : IWTSProtocolConnection*, pplicenseconnection : IWTSProtocolLicenseConnection*) : HRESULT
    @lpVtbl.value.get_license_connection.call(this, pplicenseconnection)
  end
  def authenticate_client_to_session(this : IWTSProtocolConnection*, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.authenticate_client_to_session.call(this, sessionid)
  end
  def notify_session_id(this : IWTSProtocolConnection*, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.notify_session_id.call(this, sessionid)
  end
  def get_protocol_handles(this : IWTSProtocolConnection*, pkeyboardhandle : HANDLE_PTR*, pmousehandle : HANDLE_PTR*, pbeephandle : HANDLE_PTR*, pvideohandle : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_protocol_handles.call(this, pkeyboardhandle, pmousehandle, pbeephandle, pvideohandle)
  end
  def connect_notify(this : IWTSProtocolConnection*, sessionid : UInt32) : HRESULT
    @lpVtbl.value.connect_notify.call(this, sessionid)
  end
  def is_user_allowed_to_logon(this : IWTSProtocolConnection*, sessionid : UInt32, usertoken : HANDLE_PTR, pdomainname : LibC::LPWSTR, pusername : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.is_user_allowed_to_logon.call(this, sessionid, usertoken, pdomainname, pusername)
  end
  def session_arbitration_enumeration(this : IWTSProtocolConnection*, husertoken : HANDLE_PTR, bsinglesessionperuserenabled : LibC::BOOL, psessionidarray : UInt32*, pdwsessionidentifiercount : UInt32*) : HRESULT
    @lpVtbl.value.session_arbitration_enumeration.call(this, husertoken, bsinglesessionperuserenabled, psessionidarray, pdwsessionidentifiercount)
  end
  def logon_notify(this : IWTSProtocolConnection*, hclienttoken : HANDLE_PTR, wszusername : LibC::LPWSTR, wszdomainname : LibC::LPWSTR, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.logon_notify.call(this, hclienttoken, wszusername, wszdomainname, sessionid)
  end
  def get_user_data(this : IWTSProtocolConnection*, ppolicydata : WTS_POLICY_DATA*, pclientdata : WTS_USER_DATA*) : HRESULT
    @lpVtbl.value.get_user_data.call(this, ppolicydata, pclientdata)
  end
  def disconnect_notify(this : IWTSProtocolConnection*) : HRESULT
    @lpVtbl.value.disconnect_notify.call(this)
  end
  def close(this : IWTSProtocolConnection*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def get_protocol_status(this : IWTSProtocolConnection*, pprotocolstatus : WTS_PROTOCOL_STATUS*) : HRESULT
    @lpVtbl.value.get_protocol_status.call(this, pprotocolstatus)
  end
  def get_last_input_time(this : IWTSProtocolConnection*, plastinputtime : UInt64*) : HRESULT
    @lpVtbl.value.get_last_input_time.call(this, plastinputtime)
  end
  def set_error_info(this : IWTSProtocolConnection*, ulerror : UInt32) : HRESULT
    @lpVtbl.value.set_error_info.call(this, ulerror)
  end
  def send_beep(this : IWTSProtocolConnection*, frequency : UInt32, duration : UInt32) : HRESULT
    @lpVtbl.value.send_beep.call(this, frequency, duration)
  end
  def create_virtual_channel(this : IWTSProtocolConnection*, szendpointname : PSTR, bstatic : LibC::BOOL, requestedpriority : UInt32, phchannel : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.create_virtual_channel.call(this, szendpointname, bstatic, requestedpriority, phchannel)
  end
  def query_property(this : IWTSProtocolConnection*, querytype : Guid, ulnumentriesin : UInt32, ulnumentriesout : UInt32, ppropertyentriesin : WTS_PROPERTY_VALUE*, ppropertyentriesout : WTS_PROPERTY_VALUE*) : HRESULT
    @lpVtbl.value.query_property.call(this, querytype, ulnumentriesin, ulnumentriesout, ppropertyentriesin, ppropertyentriesout)
  end
  def get_shadow_connection(this : IWTSProtocolConnection*, ppshadowconnection : IWTSProtocolShadowConnection*) : HRESULT
    @lpVtbl.value.get_shadow_connection.call(this, ppshadowconnection)
  end
end
struct LibWin32::IWTSProtocolConnectionCallback
  def query_interface(this : IWTSProtocolConnectionCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolConnectionCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolConnectionCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_ready(this : IWTSProtocolConnectionCallback*) : HRESULT
    @lpVtbl.value.on_ready.call(this)
  end
  def broken_connection(this : IWTSProtocolConnectionCallback*, reason : UInt32, source : UInt32) : HRESULT
    @lpVtbl.value.broken_connection.call(this, reason, source)
  end
  def stop_screen_updates(this : IWTSProtocolConnectionCallback*) : HRESULT
    @lpVtbl.value.stop_screen_updates.call(this)
  end
  def redraw_window(this : IWTSProtocolConnectionCallback*, rect : WTS_SMALL_RECT*) : HRESULT
    @lpVtbl.value.redraw_window.call(this, rect)
  end
  def display_io_ctl(this : IWTSProtocolConnectionCallback*, displayioctl : WTS_DISPLAY_IOCTL*) : HRESULT
    @lpVtbl.value.display_io_ctl.call(this, displayioctl)
  end
end
struct LibWin32::IWTSProtocolShadowConnection
  def query_interface(this : IWTSProtocolShadowConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolShadowConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolShadowConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start(this : IWTSProtocolShadowConnection*, ptargetservername : LibC::LPWSTR, targetsessionid : UInt32, hotkeyvk : UInt8, hotkeymodifiers : UInt16, pshadowcallback : IWTSProtocolShadowCallback) : HRESULT
    @lpVtbl.value.start.call(this, ptargetservername, targetsessionid, hotkeyvk, hotkeymodifiers, pshadowcallback)
  end
  def stop(this : IWTSProtocolShadowConnection*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
  def do_target(this : IWTSProtocolShadowConnection*, pparam1 : UInt8*, param1size : UInt32, pparam2 : UInt8*, param2size : UInt32, pparam3 : UInt8*, param3size : UInt32, pparam4 : UInt8*, param4size : UInt32, pclientname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.do_target.call(this, pparam1, param1size, pparam2, param2size, pparam3, param3size, pparam4, param4size, pclientname)
  end
end
struct LibWin32::IWTSProtocolShadowCallback
  def query_interface(this : IWTSProtocolShadowCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolShadowCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolShadowCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def stop_shadow(this : IWTSProtocolShadowCallback*) : HRESULT
    @lpVtbl.value.stop_shadow.call(this)
  end
  def invoke_target_shadow(this : IWTSProtocolShadowCallback*, ptargetservername : LibC::LPWSTR, targetsessionid : UInt32, pparam1 : UInt8*, param1size : UInt32, pparam2 : UInt8*, param2size : UInt32, pparam3 : UInt8*, param3size : UInt32, pparam4 : UInt8*, param4size : UInt32, pclientname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.invoke_target_shadow.call(this, ptargetservername, targetsessionid, pparam1, param1size, pparam2, param2size, pparam3, param3size, pparam4, param4size, pclientname)
  end
end
struct LibWin32::IWTSProtocolLicenseConnection
  def query_interface(this : IWTSProtocolLicenseConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolLicenseConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolLicenseConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def request_licensing_capabilities(this : IWTSProtocolLicenseConnection*, pplicensecapabilities : WTS_LICENSE_CAPABILITIES*, pcblicensecapabilities : UInt32*) : HRESULT
    @lpVtbl.value.request_licensing_capabilities.call(this, pplicensecapabilities, pcblicensecapabilities)
  end
  def send_client_license(this : IWTSProtocolLicenseConnection*, pclientlicense : UInt8*, cbclientlicense : UInt32) : HRESULT
    @lpVtbl.value.send_client_license.call(this, pclientlicense, cbclientlicense)
  end
  def request_client_license(this : IWTSProtocolLicenseConnection*, reserve1 : UInt8*, reserve2 : UInt32, ppclientlicense : UInt8*, pcbclientlicense : UInt32*) : HRESULT
    @lpVtbl.value.request_client_license.call(this, reserve1, reserve2, ppclientlicense, pcbclientlicense)
  end
  def protocol_complete(this : IWTSProtocolLicenseConnection*, ulcomplete : UInt32) : HRESULT
    @lpVtbl.value.protocol_complete.call(this, ulcomplete)
  end
end
struct LibWin32::IWTSProtocolLogonErrorRedirector
  def query_interface(this : IWTSProtocolLogonErrorRedirector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWTSProtocolLogonErrorRedirector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWTSProtocolLogonErrorRedirector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_begin_painting(this : IWTSProtocolLogonErrorRedirector*) : HRESULT
    @lpVtbl.value.on_begin_painting.call(this)
  end
  def redirect_status(this : IWTSProtocolLogonErrorRedirector*, pszmessage : LibC::LPWSTR, presponse : WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : HRESULT
    @lpVtbl.value.redirect_status.call(this, pszmessage, presponse)
  end
  def redirect_message(this : IWTSProtocolLogonErrorRedirector*, pszcaption : LibC::LPWSTR, pszmessage : LibC::LPWSTR, utype : UInt32, presponse : WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : HRESULT
    @lpVtbl.value.redirect_message.call(this, pszcaption, pszmessage, utype, presponse)
  end
  def redirect_logon_error(this : IWTSProtocolLogonErrorRedirector*, ntsstatus : Int32, ntssubstatus : Int32, pszcaption : LibC::LPWSTR, pszmessage : LibC::LPWSTR, utype : UInt32, presponse : WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : HRESULT
    @lpVtbl.value.redirect_logon_error.call(this, ntsstatus, ntssubstatus, pszcaption, pszmessage, utype, presponse)
  end
end
struct LibWin32::IWRdsProtocolSettings
  def query_interface(this : IWRdsProtocolSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_settings(this : IWRdsProtocolSettings*, wrdssettingtype : WRDS_SETTING_TYPE, wrdssettinglevel : WRDS_SETTING_LEVEL, pwrdssettings : WRDS_SETTINGS*) : HRESULT
    @lpVtbl.value.get_settings.call(this, wrdssettingtype, wrdssettinglevel, pwrdssettings)
  end
  def merge_settings(this : IWRdsProtocolSettings*, pwrdssettings : WRDS_SETTINGS*, wrdsconnectionsettinglevel : WRDS_CONNECTION_SETTING_LEVEL, pwrdsconnectionsettings : WRDS_CONNECTION_SETTINGS*) : HRESULT
    @lpVtbl.value.merge_settings.call(this, pwrdssettings, wrdsconnectionsettinglevel, pwrdsconnectionsettings)
  end
end
struct LibWin32::IWRdsProtocolManager
  def query_interface(this : IWRdsProtocolManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IWRdsProtocolManager*, piwrdssettings : IWRdsProtocolSettings, pwrdssettings : WRDS_SETTINGS*) : HRESULT
    @lpVtbl.value.initialize.call(this, piwrdssettings, pwrdssettings)
  end
  def create_listener(this : IWRdsProtocolManager*, wszlistenername : LibC::LPWSTR, pprotocollistener : IWRdsProtocolListener*) : HRESULT
    @lpVtbl.value.create_listener.call(this, wszlistenername, pprotocollistener)
  end
  def notify_service_state_change(this : IWRdsProtocolManager*, ptsservicestatechange : WTS_SERVICE_STATE*) : HRESULT
    @lpVtbl.value.notify_service_state_change.call(this, ptsservicestatechange)
  end
  def notify_session_of_service_start(this : IWRdsProtocolManager*, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.notify_session_of_service_start.call(this, sessionid)
  end
  def notify_session_of_service_stop(this : IWRdsProtocolManager*, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.notify_session_of_service_stop.call(this, sessionid)
  end
  def notify_session_state_change(this : IWRdsProtocolManager*, sessionid : WTS_SESSION_ID*, eventid : UInt32) : HRESULT
    @lpVtbl.value.notify_session_state_change.call(this, sessionid, eventid)
  end
  def notify_settings_change(this : IWRdsProtocolManager*, pwrdssettings : WRDS_SETTINGS*) : HRESULT
    @lpVtbl.value.notify_settings_change.call(this, pwrdssettings)
  end
  def uninitialize(this : IWRdsProtocolManager*) : HRESULT
    @lpVtbl.value.uninitialize.call(this)
  end
end
struct LibWin32::IWRdsProtocolListener
  def query_interface(this : IWRdsProtocolListener*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolListener*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolListener*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_settings(this : IWRdsProtocolListener*, wrdslistenersettinglevel : WRDS_LISTENER_SETTING_LEVEL, pwrdslistenersettings : WRDS_LISTENER_SETTINGS*) : HRESULT
    @lpVtbl.value.get_settings.call(this, wrdslistenersettinglevel, pwrdslistenersettings)
  end
  def start_listen(this : IWRdsProtocolListener*, pcallback : IWRdsProtocolListenerCallback) : HRESULT
    @lpVtbl.value.start_listen.call(this, pcallback)
  end
  def stop_listen(this : IWRdsProtocolListener*) : HRESULT
    @lpVtbl.value.stop_listen.call(this)
  end
end
struct LibWin32::IWRdsProtocolListenerCallback
  def query_interface(this : IWRdsProtocolListenerCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolListenerCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolListenerCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_connected(this : IWRdsProtocolListenerCallback*, pconnection : IWRdsProtocolConnection, pwrdsconnectionsettings : WRDS_CONNECTION_SETTINGS*, pcallback : IWRdsProtocolConnectionCallback*) : HRESULT
    @lpVtbl.value.on_connected.call(this, pconnection, pwrdsconnectionsettings, pcallback)
  end
end
struct LibWin32::IWRdsProtocolConnection
  def query_interface(this : IWRdsProtocolConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_logon_error_redirector(this : IWRdsProtocolConnection*, pplogonerrorredir : IWRdsProtocolLogonErrorRedirector*) : HRESULT
    @lpVtbl.value.get_logon_error_redirector.call(this, pplogonerrorredir)
  end
  def accept_connection(this : IWRdsProtocolConnection*) : HRESULT
    @lpVtbl.value.accept_connection.call(this)
  end
  def get_client_data(this : IWRdsProtocolConnection*, pclientdata : WTS_CLIENT_DATA*) : HRESULT
    @lpVtbl.value.get_client_data.call(this, pclientdata)
  end
  def get_client_monitor_data(this : IWRdsProtocolConnection*, pnummonitors : UInt32*, pprimarymonitor : UInt32*) : HRESULT
    @lpVtbl.value.get_client_monitor_data.call(this, pnummonitors, pprimarymonitor)
  end
  def get_user_credentials(this : IWRdsProtocolConnection*, pusercreds : WTS_USER_CREDENTIAL*) : HRESULT
    @lpVtbl.value.get_user_credentials.call(this, pusercreds)
  end
  def get_license_connection(this : IWRdsProtocolConnection*, pplicenseconnection : IWRdsProtocolLicenseConnection*) : HRESULT
    @lpVtbl.value.get_license_connection.call(this, pplicenseconnection)
  end
  def authenticate_client_to_session(this : IWRdsProtocolConnection*, sessionid : WTS_SESSION_ID*) : HRESULT
    @lpVtbl.value.authenticate_client_to_session.call(this, sessionid)
  end
  def notify_session_id(this : IWRdsProtocolConnection*, sessionid : WTS_SESSION_ID*, sessionhandle : HANDLE_PTR) : HRESULT
    @lpVtbl.value.notify_session_id.call(this, sessionid, sessionhandle)
  end
  def get_input_handles(this : IWRdsProtocolConnection*, pkeyboardhandle : HANDLE_PTR*, pmousehandle : HANDLE_PTR*, pbeephandle : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_input_handles.call(this, pkeyboardhandle, pmousehandle, pbeephandle)
  end
  def get_video_handle(this : IWRdsProtocolConnection*, pvideohandle : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_video_handle.call(this, pvideohandle)
  end
  def connect_notify(this : IWRdsProtocolConnection*, sessionid : UInt32) : HRESULT
    @lpVtbl.value.connect_notify.call(this, sessionid)
  end
  def is_user_allowed_to_logon(this : IWRdsProtocolConnection*, sessionid : UInt32, usertoken : HANDLE_PTR, pdomainname : LibC::LPWSTR, pusername : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.is_user_allowed_to_logon.call(this, sessionid, usertoken, pdomainname, pusername)
  end
  def session_arbitration_enumeration(this : IWRdsProtocolConnection*, husertoken : HANDLE_PTR, bsinglesessionperuserenabled : LibC::BOOL, psessionidarray : UInt32*, pdwsessionidentifiercount : UInt32*) : HRESULT
    @lpVtbl.value.session_arbitration_enumeration.call(this, husertoken, bsinglesessionperuserenabled, psessionidarray, pdwsessionidentifiercount)
  end
  def logon_notify(this : IWRdsProtocolConnection*, hclienttoken : HANDLE_PTR, wszusername : LibC::LPWSTR, wszdomainname : LibC::LPWSTR, sessionid : WTS_SESSION_ID*, pwrdsconnectionsettings : WRDS_CONNECTION_SETTINGS*) : HRESULT
    @lpVtbl.value.logon_notify.call(this, hclienttoken, wszusername, wszdomainname, sessionid, pwrdsconnectionsettings)
  end
  def pre_disconnect(this : IWRdsProtocolConnection*, disconnectreason : UInt32) : HRESULT
    @lpVtbl.value.pre_disconnect.call(this, disconnectreason)
  end
  def disconnect_notify(this : IWRdsProtocolConnection*) : HRESULT
    @lpVtbl.value.disconnect_notify.call(this)
  end
  def close(this : IWRdsProtocolConnection*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def get_protocol_status(this : IWRdsProtocolConnection*, pprotocolstatus : WTS_PROTOCOL_STATUS*) : HRESULT
    @lpVtbl.value.get_protocol_status.call(this, pprotocolstatus)
  end
  def get_last_input_time(this : IWRdsProtocolConnection*, plastinputtime : UInt64*) : HRESULT
    @lpVtbl.value.get_last_input_time.call(this, plastinputtime)
  end
  def set_error_info(this : IWRdsProtocolConnection*, ulerror : UInt32) : HRESULT
    @lpVtbl.value.set_error_info.call(this, ulerror)
  end
  def create_virtual_channel(this : IWRdsProtocolConnection*, szendpointname : PSTR, bstatic : LibC::BOOL, requestedpriority : UInt32, phchannel : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.create_virtual_channel.call(this, szendpointname, bstatic, requestedpriority, phchannel)
  end
  def query_property(this : IWRdsProtocolConnection*, querytype : Guid, ulnumentriesin : UInt32, ulnumentriesout : UInt32, ppropertyentriesin : WTS_PROPERTY_VALUE*, ppropertyentriesout : WTS_PROPERTY_VALUE*) : HRESULT
    @lpVtbl.value.query_property.call(this, querytype, ulnumentriesin, ulnumentriesout, ppropertyentriesin, ppropertyentriesout)
  end
  def get_shadow_connection(this : IWRdsProtocolConnection*, ppshadowconnection : IWRdsProtocolShadowConnection*) : HRESULT
    @lpVtbl.value.get_shadow_connection.call(this, ppshadowconnection)
  end
  def notify_command_process_created(this : IWRdsProtocolConnection*, sessionid : UInt32) : HRESULT
    @lpVtbl.value.notify_command_process_created.call(this, sessionid)
  end
end
struct LibWin32::IWRdsProtocolConnectionCallback
  def query_interface(this : IWRdsProtocolConnectionCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolConnectionCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolConnectionCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_ready(this : IWRdsProtocolConnectionCallback*) : HRESULT
    @lpVtbl.value.on_ready.call(this)
  end
  def broken_connection(this : IWRdsProtocolConnectionCallback*, reason : UInt32, source : UInt32) : HRESULT
    @lpVtbl.value.broken_connection.call(this, reason, source)
  end
  def stop_screen_updates(this : IWRdsProtocolConnectionCallback*) : HRESULT
    @lpVtbl.value.stop_screen_updates.call(this)
  end
  def redraw_window(this : IWRdsProtocolConnectionCallback*, rect : WTS_SMALL_RECT*) : HRESULT
    @lpVtbl.value.redraw_window.call(this, rect)
  end
  def get_connection_id(this : IWRdsProtocolConnectionCallback*, pconnectionid : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_id.call(this, pconnectionid)
  end
end
struct LibWin32::IWRdsProtocolShadowConnection
  def query_interface(this : IWRdsProtocolShadowConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolShadowConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolShadowConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start(this : IWRdsProtocolShadowConnection*, ptargetservername : LibC::LPWSTR, targetsessionid : UInt32, hotkeyvk : UInt8, hotkeymodifiers : UInt16, pshadowcallback : IWRdsProtocolShadowCallback) : HRESULT
    @lpVtbl.value.start.call(this, ptargetservername, targetsessionid, hotkeyvk, hotkeymodifiers, pshadowcallback)
  end
  def stop(this : IWRdsProtocolShadowConnection*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
  def do_target(this : IWRdsProtocolShadowConnection*, pparam1 : UInt8*, param1size : UInt32, pparam2 : UInt8*, param2size : UInt32, pparam3 : UInt8*, param3size : UInt32, pparam4 : UInt8*, param4size : UInt32, pclientname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.do_target.call(this, pparam1, param1size, pparam2, param2size, pparam3, param3size, pparam4, param4size, pclientname)
  end
end
struct LibWin32::IWRdsProtocolShadowCallback
  def query_interface(this : IWRdsProtocolShadowCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolShadowCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolShadowCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def stop_shadow(this : IWRdsProtocolShadowCallback*) : HRESULT
    @lpVtbl.value.stop_shadow.call(this)
  end
  def invoke_target_shadow(this : IWRdsProtocolShadowCallback*, ptargetservername : LibC::LPWSTR, targetsessionid : UInt32, pparam1 : UInt8*, param1size : UInt32, pparam2 : UInt8*, param2size : UInt32, pparam3 : UInt8*, param3size : UInt32, pparam4 : UInt8*, param4size : UInt32, pclientname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.invoke_target_shadow.call(this, ptargetservername, targetsessionid, pparam1, param1size, pparam2, param2size, pparam3, param3size, pparam4, param4size, pclientname)
  end
end
struct LibWin32::IWRdsProtocolLicenseConnection
  def query_interface(this : IWRdsProtocolLicenseConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolLicenseConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolLicenseConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def request_licensing_capabilities(this : IWRdsProtocolLicenseConnection*, pplicensecapabilities : WTS_LICENSE_CAPABILITIES*, pcblicensecapabilities : UInt32*) : HRESULT
    @lpVtbl.value.request_licensing_capabilities.call(this, pplicensecapabilities, pcblicensecapabilities)
  end
  def send_client_license(this : IWRdsProtocolLicenseConnection*, pclientlicense : UInt8*, cbclientlicense : UInt32) : HRESULT
    @lpVtbl.value.send_client_license.call(this, pclientlicense, cbclientlicense)
  end
  def request_client_license(this : IWRdsProtocolLicenseConnection*, reserve1 : UInt8*, reserve2 : UInt32, ppclientlicense : UInt8*, pcbclientlicense : UInt32*) : HRESULT
    @lpVtbl.value.request_client_license.call(this, reserve1, reserve2, ppclientlicense, pcbclientlicense)
  end
  def protocol_complete(this : IWRdsProtocolLicenseConnection*, ulcomplete : UInt32) : HRESULT
    @lpVtbl.value.protocol_complete.call(this, ulcomplete)
  end
end
struct LibWin32::IWRdsProtocolLogonErrorRedirector
  def query_interface(this : IWRdsProtocolLogonErrorRedirector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolLogonErrorRedirector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolLogonErrorRedirector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_begin_painting(this : IWRdsProtocolLogonErrorRedirector*) : HRESULT
    @lpVtbl.value.on_begin_painting.call(this)
  end
  def redirect_status(this : IWRdsProtocolLogonErrorRedirector*, pszmessage : LibC::LPWSTR, presponse : WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : HRESULT
    @lpVtbl.value.redirect_status.call(this, pszmessage, presponse)
  end
  def redirect_message(this : IWRdsProtocolLogonErrorRedirector*, pszcaption : LibC::LPWSTR, pszmessage : LibC::LPWSTR, utype : UInt32, presponse : WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : HRESULT
    @lpVtbl.value.redirect_message.call(this, pszcaption, pszmessage, utype, presponse)
  end
  def redirect_logon_error(this : IWRdsProtocolLogonErrorRedirector*, ntsstatus : Int32, ntssubstatus : Int32, pszcaption : LibC::LPWSTR, pszmessage : LibC::LPWSTR, utype : UInt32, presponse : WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : HRESULT
    @lpVtbl.value.redirect_logon_error.call(this, ntsstatus, ntssubstatus, pszcaption, pszmessage, utype, presponse)
  end
end
struct LibWin32::IWRdsWddmIddProps
  def query_interface(this : IWRdsWddmIddProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsWddmIddProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsWddmIddProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_hardware_id(this : IWRdsWddmIddProps*, pdisplaydriverhardwareid : Char*, count : UInt32) : HRESULT
    @lpVtbl.value.get_hardware_id.call(this, pdisplaydriverhardwareid, count)
  end
  def on_driver_load(this : IWRdsWddmIddProps*, sessionid : UInt32, driverhandle : HANDLE_PTR) : HRESULT
    @lpVtbl.value.on_driver_load.call(this, sessionid, driverhandle)
  end
  def on_driver_unload(this : IWRdsWddmIddProps*, sessionid : UInt32) : HRESULT
    @lpVtbl.value.on_driver_unload.call(this, sessionid)
  end
  def enable_wddm_idd(this : IWRdsWddmIddProps*, enabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_wddm_idd.call(this, enabled)
  end
end
struct LibWin32::IWRdsProtocolConnectionSettings
  def query_interface(this : IWRdsProtocolConnectionSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsProtocolConnectionSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsProtocolConnectionSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_connection_setting(this : IWRdsProtocolConnectionSettings*, propertyid : Guid, ppropertyentriesin : WTS_PROPERTY_VALUE*) : HRESULT
    @lpVtbl.value.set_connection_setting.call(this, propertyid, ppropertyentriesin)
  end
  def get_connection_setting(this : IWRdsProtocolConnectionSettings*, propertyid : Guid, ppropertyentriesout : WTS_PROPERTY_VALUE*) : HRESULT
    @lpVtbl.value.get_connection_setting.call(this, propertyid, ppropertyentriesout)
  end
end
struct LibWin32::IWRdsEnhancedFastReconnectArbitrator
  def query_interface(this : IWRdsEnhancedFastReconnectArbitrator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWRdsEnhancedFastReconnectArbitrator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWRdsEnhancedFastReconnectArbitrator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_session_for_enhanced_fast_reconnect(this : IWRdsEnhancedFastReconnectArbitrator*, psessionidarray : Int32*, dwsessioncount : UInt32, presultsessionid : Int32*) : HRESULT
    @lpVtbl.value.get_session_for_enhanced_fast_reconnect.call(this, psessionidarray, dwsessioncount, presultsessionid)
  end
end
struct LibWin32::IRemoteDesktopClientSettings
  def query_interface(this : IRemoteDesktopClientSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRemoteDesktopClientSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRemoteDesktopClientSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRemoteDesktopClientSettings*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRemoteDesktopClientSettings*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRemoteDesktopClientSettings*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRemoteDesktopClientSettings*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def apply_settings(this : IRemoteDesktopClientSettings*, rdpfilecontents : UInt8*) : HRESULT
    @lpVtbl.value.apply_settings.call(this, rdpfilecontents)
  end
  def retrieve_settings(this : IRemoteDesktopClientSettings*, rdpfilecontents : UInt8**) : HRESULT
    @lpVtbl.value.retrieve_settings.call(this, rdpfilecontents)
  end
  def get_rdp_property(this : IRemoteDesktopClientSettings*, propertyname : UInt8*, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_rdp_property.call(this, propertyname, value)
  end
  def set_rdp_property(this : IRemoteDesktopClientSettings*, propertyname : UInt8*, value : VARIANT) : HRESULT
    @lpVtbl.value.set_rdp_property.call(this, propertyname, value)
  end
end
struct LibWin32::IRemoteDesktopClientActions
  def query_interface(this : IRemoteDesktopClientActions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRemoteDesktopClientActions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRemoteDesktopClientActions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRemoteDesktopClientActions*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRemoteDesktopClientActions*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRemoteDesktopClientActions*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRemoteDesktopClientActions*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def suspend_screen_updates(this : IRemoteDesktopClientActions*) : HRESULT
    @lpVtbl.value.suspend_screen_updates.call(this)
  end
  def resume_screen_updates(this : IRemoteDesktopClientActions*) : HRESULT
    @lpVtbl.value.resume_screen_updates.call(this)
  end
  def execute_remote_action(this : IRemoteDesktopClientActions*, remoteaction : RemoteActionType) : HRESULT
    @lpVtbl.value.execute_remote_action.call(this, remoteaction)
  end
  def get_snapshot(this : IRemoteDesktopClientActions*, snapshotencoding : SnapshotEncodingType, snapshotformat : SnapshotFormatType, snapshotwidth : UInt32, snapshotheight : UInt32, snapshotdata : UInt8**) : HRESULT
    @lpVtbl.value.get_snapshot.call(this, snapshotencoding, snapshotformat, snapshotwidth, snapshotheight, snapshotdata)
  end
end
struct LibWin32::IRemoteDesktopClientTouchPointer
  def query_interface(this : IRemoteDesktopClientTouchPointer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRemoteDesktopClientTouchPointer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRemoteDesktopClientTouchPointer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRemoteDesktopClientTouchPointer*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRemoteDesktopClientTouchPointer*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRemoteDesktopClientTouchPointer*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRemoteDesktopClientTouchPointer*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def put_enabled(this : IRemoteDesktopClientTouchPointer*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_enabled(this : IRemoteDesktopClientTouchPointer*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_events_enabled(this : IRemoteDesktopClientTouchPointer*, eventsenabled : Int16) : HRESULT
    @lpVtbl.value.put_events_enabled.call(this, eventsenabled)
  end
  def get_events_enabled(this : IRemoteDesktopClientTouchPointer*, eventsenabled : Int16*) : HRESULT
    @lpVtbl.value.get_events_enabled.call(this, eventsenabled)
  end
  def put_pointer_speed(this : IRemoteDesktopClientTouchPointer*, pointerspeed : UInt32) : HRESULT
    @lpVtbl.value.put_pointer_speed.call(this, pointerspeed)
  end
  def get_pointer_speed(this : IRemoteDesktopClientTouchPointer*, pointerspeed : UInt32*) : HRESULT
    @lpVtbl.value.get_pointer_speed.call(this, pointerspeed)
  end
end
struct LibWin32::IRemoteDesktopClient
  def query_interface(this : IRemoteDesktopClient*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRemoteDesktopClient*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRemoteDesktopClient*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRemoteDesktopClient*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRemoteDesktopClient*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRemoteDesktopClient*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRemoteDesktopClient*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect(this : IRemoteDesktopClient*) : HRESULT
    @lpVtbl.value.connect.call(this)
  end
  def disconnect(this : IRemoteDesktopClient*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def reconnect(this : IRemoteDesktopClient*, width : UInt32, height : UInt32) : HRESULT
    @lpVtbl.value.reconnect.call(this, width, height)
  end
  def get_settings(this : IRemoteDesktopClient*, settings : IRemoteDesktopClientSettings*) : HRESULT
    @lpVtbl.value.get_settings.call(this, settings)
  end
  def get_actions(this : IRemoteDesktopClient*, actions : IRemoteDesktopClientActions*) : HRESULT
    @lpVtbl.value.get_actions.call(this, actions)
  end
  def get_touch_pointer(this : IRemoteDesktopClient*, touchpointer : IRemoteDesktopClientTouchPointer*) : HRESULT
    @lpVtbl.value.get_touch_pointer.call(this, touchpointer)
  end
  def delete_saved_credentials(this : IRemoteDesktopClient*, servername : UInt8*) : HRESULT
    @lpVtbl.value.delete_saved_credentials.call(this, servername)
  end
  def update_session_display_settings(this : IRemoteDesktopClient*, width : UInt32, height : UInt32) : HRESULT
    @lpVtbl.value.update_session_display_settings.call(this, width, height)
  end
  def attach_event(this : IRemoteDesktopClient*, eventname : UInt8*, callback : IDispatch) : HRESULT
    @lpVtbl.value.attach_event.call(this, eventname, callback)
  end
  def detach_event(this : IRemoteDesktopClient*, eventname : UInt8*, callback : IDispatch) : HRESULT
    @lpVtbl.value.detach_event.call(this, eventname, callback)
  end
end
struct LibWin32::IRemoteSystemAdditionalInfoProvider
  def query_interface(this : IRemoteSystemAdditionalInfoProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRemoteSystemAdditionalInfoProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRemoteSystemAdditionalInfoProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_additional_info(this : IRemoteSystemAdditionalInfoProvider*, deduplicationid : HSTRING*, riid : Guid*, mapview : Void**) : HRESULT
    @lpVtbl.value.get_additional_info.call(this, deduplicationid, riid, mapview)
  end
end
