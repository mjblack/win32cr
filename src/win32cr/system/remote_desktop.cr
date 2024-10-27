require "./com.cr"
require "./../foundation.cr"
require "./../media/audio.cr"
require "./../media/audio/apo.cr"
require "./com/structured_storage.cr"
require "./win_rt.cr"
require "./../ui/windows_and_messaging.cr"
require "./../security.cr"

module Win32cr::System::RemoteDesktop
  alias HwtsVirtualChannelHandle = LibC::IntPtrT
  alias PCHANNEL_INIT_EVENT_FN = Proc(Void*, UInt32, Void*, UInt32, Void)*

  alias PCHANNEL_OPEN_EVENT_FN = Proc(UInt32, UInt32, Void*, UInt32, UInt32, UInt32, Void)*

  alias PVIRTUALCHANNELINIT = Proc(Void**, Win32cr::System::RemoteDesktop::CHANNEL_DEF*, Int32, UInt32, Win32cr::System::RemoteDesktop::PCHANNEL_INIT_EVENT_FN, UInt32)*

  alias PVIRTUALCHANNELOPEN = Proc(Void*, UInt32*, Win32cr::Foundation::PSTR, Win32cr::System::RemoteDesktop::PCHANNEL_OPEN_EVENT_FN, UInt32)*

  alias PVIRTUALCHANNELCLOSE = Proc(UInt32, UInt32)*

  alias PVIRTUALCHANNELWRITE = Proc(UInt32, Void*, UInt32, Void*, UInt32)*

  alias PVIRTUALCHANNELENTRY = Proc(Win32cr::System::RemoteDesktop::CHANNEL_ENTRY_POINTS*, Win32cr::Foundation::BOOL)*

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
  WTS_PROPERTY_DEFAULT_CONFIG = "DefaultConfig"
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

  enum AE_POSITION_FLAGS
    POSITION_INVALID = 0_i32
    POSITION_DISCONTINUOUS = 1_i32
    POSITION_CONTINUOUS = 2_i32
    POSITION_QPC_ERROR = 4_i32
  end
  enum AAAuthSchemes
    AA_AUTH_MIN = 0_i32
    AA_AUTH_BASIC = 1_i32
    AA_AUTH_NTLM = 2_i32
    AA_AUTH_SC = 3_i32
    AA_AUTH_LOGGEDONCREDENTIALS = 4_i32
    AA_AUTH_NEGOTIATE = 5_i32
    AA_AUTH_ANY = 6_i32
    AA_AUTH_COOKIE = 7_i32
    AA_AUTH_DIGEST = 8_i32
    AA_AUTH_ORGID = 9_i32
    AA_AUTH_CONID = 10_i32
    AA_AUTH_SSPI_NTLM = 11_i32
    AA_AUTH_MAX = 12_i32
  end
  enum AAAccountingDataType
    AA_MAIN_SESSION_CREATION = 0_i32
    AA_SUB_SESSION_CREATION = 1_i32
    AA_SUB_SESSION_CLOSED = 2_i32
    AA_MAIN_SESSION_CLOSED = 3_i32
  end
  enum SESSION_TIMEOUT_ACTION_TYPE
    SESSION_TIMEOUT_ACTION_DISCONNECT = 0_i32
    SESSION_TIMEOUT_ACTION_SILENT_REAUTH = 1_i32
  end
  enum PolicyAttributeType
    EnableAllRedirections = 0_i32
    DisableAllRedirections = 1_i32
    DriveRedirectionDisabled = 2_i32
    PrinterRedirectionDisabled = 3_i32
    PortRedirectionDisabled = 4_i32
    ClipboardRedirectionDisabled = 5_i32
    PnpRedirectionDisabled = 6_i32
    AllowOnlySDRServers = 7_i32
  end
  enum AATrustClassID
    AA_UNTRUSTED = 0_i32
    AA_TRUSTEDUSER_UNTRUSTEDCLIENT = 1_i32
    AA_TRUSTEDUSER_TRUSTEDCLIENT = 2_i32
  end
  enum WTS_CONNECTSTATE_CLASS
    WTSActive = 0_i32
    WTSConnected = 1_i32
    WTSConnectQuery = 2_i32
    WTSShadow = 3_i32
    WTSDisconnected = 4_i32
    WTSIdle = 5_i32
    WTSListen = 6_i32
    WTSReset = 7_i32
    WTSDown = 8_i32
    WTSInit = 9_i32
  end
  enum WTS_INFO_CLASS
    WTSInitialProgram = 0_i32
    WTSApplicationName = 1_i32
    WTSWorkingDirectory = 2_i32
    WTSOEMId = 3_i32
    WTSSessionId = 4_i32
    WTSUserName = 5_i32
    WTSWinStationName = 6_i32
    WTSDomainName = 7_i32
    WTSConnectState = 8_i32
    WTSClientBuildNumber = 9_i32
    WTSClientName = 10_i32
    WTSClientDirectory = 11_i32
    WTSClientProductId = 12_i32
    WTSClientHardwareId = 13_i32
    WTSClientAddress = 14_i32
    WTSClientDisplay = 15_i32
    WTSClientProtocolType = 16_i32
    WTSIdleTime = 17_i32
    WTSLogonTime = 18_i32
    WTSIncomingBytes = 19_i32
    WTSOutgoingBytes = 20_i32
    WTSIncomingFrames = 21_i32
    WTSOutgoingFrames = 22_i32
    WTSClientInfo = 23_i32
    WTSSessionInfo = 24_i32
    WTSSessionInfoEx = 25_i32
    WTSConfigInfo = 26_i32
    WTSValidationInfo = 27_i32
    WTSSessionAddressV4 = 28_i32
    WTSIsRemoteSession = 29_i32
  end
  enum WTS_CONFIG_CLASS
    WTSUserConfigInitialProgram = 0_i32
    WTSUserConfigWorkingDirectory = 1_i32
    WTSUserConfigfInheritInitialProgram = 2_i32
    WTSUserConfigfAllowLogonTerminalServer = 3_i32
    WTSUserConfigTimeoutSettingsConnections = 4_i32
    WTSUserConfigTimeoutSettingsDisconnections = 5_i32
    WTSUserConfigTimeoutSettingsIdle = 6_i32
    WTSUserConfigfDeviceClientDrives = 7_i32
    WTSUserConfigfDeviceClientPrinters = 8_i32
    WTSUserConfigfDeviceClientDefaultPrinter = 9_i32
    WTSUserConfigBrokenTimeoutSettings = 10_i32
    WTSUserConfigReconnectSettings = 11_i32
    WTSUserConfigModemCallbackSettings = 12_i32
    WTSUserConfigModemCallbackPhoneNumber = 13_i32
    WTSUserConfigShadowingSettings = 14_i32
    WTSUserConfigTerminalServerProfilePath = 15_i32
    WTSUserConfigTerminalServerHomeDir = 16_i32
    WTSUserConfigTerminalServerHomeDirDrive = 17_i32
    WTSUserConfigfTerminalServerRemoteHomeDir = 18_i32
    WTSUserConfigUser = 19_i32
  end
  enum WTS_CONFIG_SOURCE
    WTSUserConfigSourceSAM = 0_i32
  end
  enum WTS_VIRTUAL_CLASS
    WTSVirtualClientData = 0_i32
    WTSVirtualFileHandle = 1_i32
  end
  enum WTS_TYPE_CLASS
    WTSTypeProcessInfoLevel0 = 0_i32
    WTSTypeProcessInfoLevel1 = 1_i32
    WTSTypeSessionInfoLevel1 = 2_i32
  end
  enum WTSSBX_MACHINE_DRAIN
    WTSSBX_MACHINE_DRAIN_UNSPEC = 0_i32
    WTSSBX_MACHINE_DRAIN_OFF = 1_i32
    WTSSBX_MACHINE_DRAIN_ON = 2_i32
  end
  enum WTSSBX_MACHINE_SESSION_MODE
    WTSSBX_MACHINE_SESSION_MODE_UNSPEC = 0_i32
    WTSSBX_MACHINE_SESSION_MODE_SINGLE = 1_i32
    WTSSBX_MACHINE_SESSION_MODE_MULTIPLE = 2_i32
  end
  enum WTSSBX_ADDRESS_FAMILY
    WTSSBX_ADDRESS_FAMILY_AF_UNSPEC = 0_i32
    WTSSBX_ADDRESS_FAMILY_AF_INET = 1_i32
    WTSSBX_ADDRESS_FAMILY_AF_INET6 = 2_i32
    WTSSBX_ADDRESS_FAMILY_AF_IPX = 3_i32
    WTSSBX_ADDRESS_FAMILY_AF_NETBIOS = 4_i32
  end
  enum WTSSBX_MACHINE_STATE
    WTSSBX_MACHINE_STATE_UNSPEC = 0_i32
    WTSSBX_MACHINE_STATE_READY = 1_i32
    WTSSBX_MACHINE_STATE_SYNCHRONIZING = 2_i32
  end
  enum WTSSBX_SESSION_STATE
    WTSSBX_SESSION_STATE_UNSPEC = 0_i32
    WTSSBX_SESSION_STATE_ACTIVE = 1_i32
    WTSSBX_SESSION_STATE_DISCONNECTED = 2_i32
  end
  enum WTSSBX_NOTIFICATION_TYPE
    WTSSBX_NOTIFICATION_REMOVED = 1_i32
    WTSSBX_NOTIFICATION_CHANGED = 2_i32
    WTSSBX_NOTIFICATION_ADDED = 4_i32
    WTSSBX_NOTIFICATION_RESYNC = 8_i32
  end
  enum TSSD_AddrV46Type
    TSSD_ADDR_UNDEFINED = 0_i32
    TSSD_ADDR_IPv4 = 4_i32
    TSSD_ADDR_IPv6 = 6_i32
  end
  enum TSSB_NOTIFICATION_TYPE
    TSSB_NOTIFY_INVALID = 0_i32
    TSSB_NOTIFY_TARGET_CHANGE = 1_i32
    TSSB_NOTIFY_SESSION_CHANGE = 2_i32
    TSSB_NOTIFY_CONNECTION_REQUEST_CHANGE = 4_i32
  end
  enum TARGET_STATE
    TARGET_UNKNOWN = 1_i32
    TARGET_INITIALIZING = 2_i32
    TARGET_RUNNING = 3_i32
    TARGET_DOWN = 4_i32
    TARGET_HIBERNATED = 5_i32
    TARGET_CHECKED_OUT = 6_i32
    TARGET_STOPPED = 7_i32
    TARGET_INVALID = 8_i32
    TARGET_STARTING = 9_i32
    TARGET_STOPPING = 10_i32
    TARGET_MAXSTATE = 11_i32
  end
  enum TARGET_CHANGE_TYPE
    TARGET_CHANGE_UNSPEC = 1_i32
    TARGET_EXTERNALIP_CHANGED = 2_i32
    TARGET_INTERNALIP_CHANGED = 4_i32
    TARGET_JOINED = 8_i32
    TARGET_REMOVED = 16_i32
    TARGET_STATE_CHANGED = 32_i32
    TARGET_IDLE = 64_i32
    TARGET_PENDING = 128_i32
    TARGET_INUSE = 256_i32
    TARGET_PATCH_STATE_CHANGED = 512_i32
    TARGET_FARM_MEMBERSHIP_CHANGED = 1024_i32
  end
  enum TARGET_TYPE
    UNKNOWN = 0_i32
    FARM = 1_i32
    NONFARM = 2_i32
  end
  enum TARGET_PATCH_STATE
    TARGET_PATCH_UNKNOWN = 0_i32
    TARGET_PATCH_NOT_STARTED = 1_i32
    TARGET_PATCH_IN_PROGRESS = 2_i32
    TARGET_PATCH_COMPLETED = 3_i32
    TARGET_PATCH_FAILED = 4_i32
  end
  enum CLIENT_MESSAGE_TYPE
    CLIENT_MESSAGE_CONNECTION_INVALID = 0_i32
    CLIENT_MESSAGE_CONNECTION_STATUS = 1_i32
    CLIENT_MESSAGE_CONNECTION_ERROR = 2_i32
  end
  enum CONNECTION_CHANGE_NOTIFICATION
    CONNECTION_REQUEST_INVALID = 0_i32
    CONNECTION_REQUEST_PENDING = 1_i32
    CONNECTION_REQUEST_FAILED = 2_i32
    CONNECTION_REQUEST_TIMEDOUT = 3_i32
    CONNECTION_REQUEST_SUCCEEDED = 4_i32
    CONNECTION_REQUEST_CANCELLED = 5_i32
    CONNECTION_REQUEST_LB_COMPLETED = 6_i32
    CONNECTION_REQUEST_QUERY_PL_COMPLETED = 7_i32
    CONNECTION_REQUEST_ORCH_COMPLETED = 8_i32
  end
  enum RD_FARM_TYPE
    RD_FARM_RDSH = 0_i32
    RD_FARM_TEMP_VM = 1_i32
    RD_FARM_MANUAL_PERSONAL_VM = 2_i32
    RD_FARM_AUTO_PERSONAL_VM = 3_i32
    RD_FARM_MANUAL_PERSONAL_RDSH = 4_i32
    RD_FARM_AUTO_PERSONAL_RDSH = 5_i32
    RD_FARM_TYPE_UNKNOWN = -1_i32
  end
  enum PLUGIN_TYPE
    UNKNOWN_PLUGIN = 0_i32
    POLICY_PLUGIN = 1_i32
    RESOURCE_PLUGIN = 2_i32
    LOAD_BALANCING_PLUGIN = 4_i32
    PLACEMENT_PLUGIN = 8_i32
    ORCHESTRATION_PLUGIN = 16_i32
    PROVISIONING_PLUGIN = 32_i32
    TASK_PLUGIN = 64_i32
  end
  enum TSSESSION_STATE
    STATE_INVALID = -1_i32
    STATE_ACTIVE = 0_i32
    STATE_CONNECTED = 1_i32
    STATE_CONNECTQUERY = 2_i32
    STATE_SHADOW = 3_i32
    STATE_DISCONNECTED = 4_i32
    STATE_IDLE = 5_i32
    STATE_LISTEN = 6_i32
    STATE_RESET = 7_i32
    STATE_DOWN = 8_i32
    STATE_INIT = 9_i32
    STATE_MAX = 10_i32
  end
  enum TARGET_OWNER
    OWNER_UNKNOWN = 0_i32
    OWNER_MS_TS_PLUGIN = 1_i32
    OWNER_MS_VM_PLUGIN = 2_i32
  end
  enum VM_NOTIFY_STATUS
    VM_NOTIFY_STATUS_PENDING = 0_i32
    VM_NOTIFY_STATUS_IN_PROGRESS = 1_i32
    VM_NOTIFY_STATUS_COMPLETE = 2_i32
    VM_NOTIFY_STATUS_FAILED = 3_i32
    VM_NOTIFY_STATUS_CANCELED = 4_i32
  end
  enum VM_HOST_NOTIFY_STATUS
    VM_HOST_STATUS_INIT_PENDING = 0_i32
    VM_HOST_STATUS_INIT_IN_PROGRESS = 1_i32
    VM_HOST_STATUS_INIT_COMPLETE = 2_i32
    VM_HOST_STATUS_INIT_FAILED = 3_i32
  end
  enum RDV_TASK_STATUS
    RDV_TASK_STATUS_UNKNOWN = 0_i32
    RDV_TASK_STATUS_SEARCHING = 1_i32
    RDV_TASK_STATUS_DOWNLOADING = 2_i32
    RDV_TASK_STATUS_APPLYING = 3_i32
    RDV_TASK_STATUS_REBOOTING = 4_i32
    RDV_TASK_STATUS_REBOOTED = 5_i32
    RDV_TASK_STATUS_SUCCESS = 6_i32
    RDV_TASK_STATUS_FAILED = 7_i32
    RDV_TASK_STATUS_TIMEOUT = 8_i32
  end
  enum TS_SB_SORT_BY
    TS_SB_SORT_BY_NONE = 0_i32
    TS_SB_SORT_BY_NAME = 1_i32
    TS_SB_SORT_BY_PROP = 2_i32
  end
  enum TSPUB_PLUGIN_PD_RESOLUTION_TYPE
    TSPUB_PLUGIN_PD_QUERY_OR_CREATE = 0_i32
    TSPUB_PLUGIN_PD_QUERY_EXISTING = 1_i32
  end
  enum TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE
    TSPUB_PLUGIN_PD_ASSIGNMENT_NEW = 0_i32
    TSPUB_PLUGIN_PD_ASSIGNMENT_EXISTING = 1_i32
  end
  enum WRdsGraphicsChannelType
    WRdsGraphicsChannelType_GuaranteedDelivery = 0_i32
    WRdsGraphicsChannelType_BestEffortDelivery = 1_i32
  end
  enum WTS_RCM_SERVICE_STATE
    WTS_SERVICE_NONE = 0_i32
    WTS_SERVICE_START = 1_i32
    WTS_SERVICE_STOP = 2_i32
  end
  enum WTS_RCM_DRAIN_STATE
    WTS_DRAIN_STATE_NONE = 0_i32
    WTS_DRAIN_IN_DRAIN = 1_i32
    WTS_DRAIN_NOT_IN_DRAIN = 2_i32
  end
  enum WTS_LOGON_ERROR_REDIRECTOR_RESPONSE
    WTS_LOGON_ERR_INVALID = 0_i32
    WTS_LOGON_ERR_NOT_HANDLED = 1_i32
    WTS_LOGON_ERR_HANDLED_SHOW = 2_i32
    WTS_LOGON_ERR_HANDLED_DONT_SHOW = 3_i32
    WTS_LOGON_ERR_HANDLED_DONT_SHOW_START_OVER = 4_i32
  end
  enum WTS_CERT_TYPE
    WTS_CERT_TYPE_INVALID = 0_i32
    WTS_CERT_TYPE_PROPRIETORY = 1_i32
    WTS_CERT_TYPE_X509 = 2_i32
  end
  enum WRDS_CONNECTION_SETTING_LEVEL
    WRDS_CONNECTION_SETTING_LEVEL_INVALID = 0_i32
    WRDS_CONNECTION_SETTING_LEVEL_1 = 1_i32
  end
  enum WRDS_LISTENER_SETTING_LEVEL
    WRDS_LISTENER_SETTING_LEVEL_INVALID = 0_i32
    WRDS_LISTENER_SETTING_LEVEL_1 = 1_i32
  end
  enum WRDS_SETTING_TYPE
    WRDS_SETTING_TYPE_INVALID = 0_i32
    WRDS_SETTING_TYPE_MACHINE = 1_i32
    WRDS_SETTING_TYPE_USER = 2_i32
    WRDS_SETTING_TYPE_SAM = 3_i32
  end
  enum WRDS_SETTING_STATUS
    WRDS_SETTING_STATUS_NOTAPPLICABLE = -1_i32
    WRDS_SETTING_STATUS_DISABLED = 0_i32
    WRDS_SETTING_STATUS_ENABLED = 1_i32
    WRDS_SETTING_STATUS_NOTCONFIGURED = 2_i32
  end
  enum WRDS_SETTING_LEVEL
    WRDS_SETTING_LEVEL_INVALID = 0_i32
    WRDS_SETTING_LEVEL_1 = 1_i32
  end
  enum PasswordEncodingType
    PasswordEncodingUTF8 = 0_i32
    PasswordEncodingUTF16LE = 1_i32
    PasswordEncodingUTF16BE = 2_i32
  end
  enum RemoteActionType
    RemoteActionCharms = 0_i32
    RemoteActionAppbar = 1_i32
    RemoteActionSnap = 2_i32
    RemoteActionStartScreen = 3_i32
    RemoteActionAppSwitch = 4_i32
  end
  enum SnapshotEncodingType
    SnapshotEncodingDataUri = 0_i32
  end
  enum SnapshotFormatType
    SnapshotFormatPng = 0_i32
    SnapshotFormatJpeg = 1_i32
    SnapshotFormatBmp = 2_i32
  end
  enum KeyCombinationType
    KeyCombinationHome = 0_i32
    KeyCombinationLeft = 1_i32
    KeyCombinationUp = 2_i32
    KeyCombinationRight = 3_i32
    KeyCombinationDown = 4_i32
    KeyCombinationScroll = 5_i32
  end

  @[Extern]
  record AE_CURRENT_POSITION,
    u64DevicePosition : UInt64,
    u64StreamPosition : UInt64,
    u64PaddingFrames : UInt64,
    hnsQPCPosition : Int64,
    f32FramesPerSecond : Float32,
    flag : Win32cr::System::RemoteDesktop::AE_POSITION_FLAGS

  @[Extern]
  record AAAccountingData,
    userName : Win32cr::Foundation::BSTR,
    clientName : Win32cr::Foundation::BSTR,
    authType : Win32cr::System::RemoteDesktop::AAAuthSchemes,
    resourceName : Win32cr::Foundation::BSTR,
    portNumber : Int32,
    protocolName : Win32cr::Foundation::BSTR,
    numberOfBytesReceived : Int32,
    numberOfBytesTransfered : Int32,
    reasonForDisconnect : Win32cr::Foundation::BSTR,
    mainSessionId : LibC::GUID,
    subSessionId : Int32

  @[Extern]
  record WTS_SERVER_INFOW,
    pServerName : Win32cr::Foundation::PWSTR

  @[Extern]
  record WTS_SERVER_INFOA,
    pServerName : Win32cr::Foundation::PSTR

  @[Extern]
  record WTS_SESSION_INFOW,
    session_id : UInt32,
    pWinStationName : Win32cr::Foundation::PWSTR,
    state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS

  @[Extern]
  record WTS_SESSION_INFOA,
    session_id : UInt32,
    pWinStationName : Win32cr::Foundation::PSTR,
    state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS

  @[Extern]
  record WTS_SESSION_INFO_1W,
    exec_env_id : UInt32,
    state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS,
    session_id : UInt32,
    pSessionName : Win32cr::Foundation::PWSTR,
    pHostName : Win32cr::Foundation::PWSTR,
    pUserName : Win32cr::Foundation::PWSTR,
    pDomainName : Win32cr::Foundation::PWSTR,
    pFarmName : Win32cr::Foundation::PWSTR

  @[Extern]
  record WTS_SESSION_INFO_1A,
    exec_env_id : UInt32,
    state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS,
    session_id : UInt32,
    pSessionName : Win32cr::Foundation::PSTR,
    pHostName : Win32cr::Foundation::PSTR,
    pUserName : Win32cr::Foundation::PSTR,
    pDomainName : Win32cr::Foundation::PSTR,
    pFarmName : Win32cr::Foundation::PSTR

  @[Extern]
  record WTS_PROCESS_INFOW,
    session_id : UInt32,
    process_id : UInt32,
    pProcessName : Win32cr::Foundation::PWSTR,
    pUserSid : Win32cr::Foundation::PSID

  @[Extern]
  record WTS_PROCESS_INFOA,
    session_id : UInt32,
    process_id : UInt32,
    pProcessName : Win32cr::Foundation::PSTR,
    pUserSid : Win32cr::Foundation::PSID

  @[Extern]
  record WTSCONFIGINFOW,
    version : UInt32,
    fConnectClientDrivesAtLogon : UInt32,
    fConnectPrinterAtLogon : UInt32,
    fDisablePrinterRedirection : UInt32,
    fDisableDefaultMainClientPrinter : UInt32,
    shadow_settings : UInt32,
    logon_user_name : UInt16[21],
    logon_domain : UInt16[18],
    work_directory : UInt16[261],
    initial_program : UInt16[261],
    application_name : UInt16[261]

  @[Extern]
  record WTSCONFIGINFOA,
    version : UInt32,
    fConnectClientDrivesAtLogon : UInt32,
    fConnectPrinterAtLogon : UInt32,
    fDisablePrinterRedirection : UInt32,
    fDisableDefaultMainClientPrinter : UInt32,
    shadow_settings : UInt32,
    logon_user_name : Win32cr::Foundation::CHAR[21],
    logon_domain : Win32cr::Foundation::CHAR[18],
    work_directory : Win32cr::Foundation::CHAR[261],
    initial_program : Win32cr::Foundation::CHAR[261],
    application_name : Win32cr::Foundation::CHAR[261]

  @[Extern]
  record WTSINFOW,
    state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS,
    session_id : UInt32,
    incoming_bytes : UInt32,
    outgoing_bytes : UInt32,
    incoming_frames : UInt32,
    outgoing_frames : UInt32,
    incoming_compressed_bytes : UInt32,
    outgoing_compressed_bytes : UInt32,
    win_station_name : UInt16[32],
    domain : UInt16[17],
    user_name : UInt16[21],
    connect_time : Win32cr::Foundation::LARGE_INTEGER,
    disconnect_time : Win32cr::Foundation::LARGE_INTEGER,
    last_input_time : Win32cr::Foundation::LARGE_INTEGER,
    logon_time : Win32cr::Foundation::LARGE_INTEGER,
    current_time : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record WTSINFOA,
    state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS,
    session_id : UInt32,
    incoming_bytes : UInt32,
    outgoing_bytes : UInt32,
    incoming_frames : UInt32,
    outgoing_frames : UInt32,
    incoming_compressed_bytes : UInt32,
    outgoing_compressed_by : UInt32,
    win_station_name : Win32cr::Foundation::CHAR[32],
    domain : Win32cr::Foundation::CHAR[17],
    user_name : Win32cr::Foundation::CHAR[21],
    connect_time : Win32cr::Foundation::LARGE_INTEGER,
    disconnect_time : Win32cr::Foundation::LARGE_INTEGER,
    last_input_time : Win32cr::Foundation::LARGE_INTEGER,
    logon_time : Win32cr::Foundation::LARGE_INTEGER,
    current_time : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record WTSINFOEX_LEVEL1_W,
    session_id : UInt32,
    session_state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS,
    session_flags : Int32,
    win_station_name : UInt16[33],
    user_name : UInt16[21],
    domain_name : UInt16[18],
    logon_time : Win32cr::Foundation::LARGE_INTEGER,
    connect_time : Win32cr::Foundation::LARGE_INTEGER,
    disconnect_time : Win32cr::Foundation::LARGE_INTEGER,
    last_input_time : Win32cr::Foundation::LARGE_INTEGER,
    current_time : Win32cr::Foundation::LARGE_INTEGER,
    incoming_bytes : UInt32,
    outgoing_bytes : UInt32,
    incoming_frames : UInt32,
    outgoing_frames : UInt32,
    incoming_compressed_bytes : UInt32,
    outgoing_compressed_bytes : UInt32

  @[Extern]
  record WTSINFOEX_LEVEL1_A,
    session_id : UInt32,
    session_state : Win32cr::System::RemoteDesktop::WTS_CONNECTSTATE_CLASS,
    session_flags : Int32,
    win_station_name : Win32cr::Foundation::CHAR[33],
    user_name : Win32cr::Foundation::CHAR[21],
    domain_name : Win32cr::Foundation::CHAR[18],
    logon_time : Win32cr::Foundation::LARGE_INTEGER,
    connect_time : Win32cr::Foundation::LARGE_INTEGER,
    disconnect_time : Win32cr::Foundation::LARGE_INTEGER,
    last_input_time : Win32cr::Foundation::LARGE_INTEGER,
    current_time : Win32cr::Foundation::LARGE_INTEGER,
    incoming_bytes : UInt32,
    outgoing_bytes : UInt32,
    incoming_frames : UInt32,
    outgoing_frames : UInt32,
    incoming_compressed_bytes : UInt32,
    outgoing_compressed_bytes : UInt32

  @[Extern(union: true)]
  record WTSINFOEX_LEVEL_W,
    wts_info_ex_level1 : Win32cr::System::RemoteDesktop::WTSINFOEX_LEVEL1_W

  @[Extern(union: true)]
  record WTSINFOEX_LEVEL_A,
    wts_info_ex_level1 : Win32cr::System::RemoteDesktop::WTSINFOEX_LEVEL1_A

  @[Extern]
  record WTSINFOEXW,
    level : UInt32,
    data : Win32cr::System::RemoteDesktop::WTSINFOEX_LEVEL_W

  @[Extern]
  record WTSINFOEXA,
    level : UInt32,
    data : Win32cr::System::RemoteDesktop::WTSINFOEX_LEVEL_A

  @[Extern]
  record WTSCLIENTW,
    client_name : UInt16[21],
    domain : UInt16[18],
    user_name : UInt16[21],
    work_directory : UInt16[261],
    initial_program : UInt16[261],
    encryption_level : UInt8,
    client_address_family : UInt32,
    client_address : UInt16[31],
    h_res : UInt16,
    v_res : UInt16,
    color_depth : UInt16,
    client_directory : UInt16[261],
    client_build_number : UInt32,
    client_hardware_id : UInt32,
    client_product_id : UInt16,
    out_buf_count_host : UInt16,
    out_buf_count_client : UInt16,
    out_buf_length : UInt16,
    device_id : UInt16[261]

  @[Extern]
  record WTSCLIENTA,
    client_name : Win32cr::Foundation::CHAR[21],
    domain : Win32cr::Foundation::CHAR[18],
    user_name : Win32cr::Foundation::CHAR[21],
    work_directory : Win32cr::Foundation::CHAR[261],
    initial_program : Win32cr::Foundation::CHAR[261],
    encryption_level : UInt8,
    client_address_family : UInt32,
    client_address : UInt16[31],
    h_res : UInt16,
    v_res : UInt16,
    color_depth : UInt16,
    client_directory : Win32cr::Foundation::CHAR[261],
    client_build_number : UInt32,
    client_hardware_id : UInt32,
    client_product_id : UInt16,
    out_buf_count_host : UInt16,
    out_buf_count_client : UInt16,
    out_buf_length : UInt16,
    device_id : Win32cr::Foundation::CHAR[261]

  @[Extern]
  record WTS_PRODUCT_INFOA,
    company_name : Win32cr::Foundation::CHAR[256],
    product_id : Win32cr::Foundation::CHAR[4]

  @[Extern]
  record WTS_PRODUCT_INFOW,
    company_name : UInt16[256],
    product_id : UInt16[4]

  @[Extern]
  record WTS_VALIDATION_INFORMATIONA,
    product_info : Win32cr::System::RemoteDesktop::WTS_PRODUCT_INFOA,
    license : UInt8[16384],
    license_length : UInt32,
    hardware_id : UInt8[20],
    hardware_id_length : UInt32

  @[Extern]
  record WTS_VALIDATION_INFORMATIONW,
    product_info : Win32cr::System::RemoteDesktop::WTS_PRODUCT_INFOW,
    license : UInt8[16384],
    license_length : UInt32,
    hardware_id : UInt8[20],
    hardware_id_length : UInt32

  @[Extern]
  record WTS_CLIENT_ADDRESS,
    address_family : UInt32,
    address : UInt8[20]

  @[Extern]
  record WTS_CLIENT_DISPLAY,
    horizontal_resolution : UInt32,
    vertical_resolution : UInt32,
    color_depth : UInt32

  @[Extern]
  record WTSUSERCONFIGA,
    source : UInt32,
    inherit_initial_program : UInt32,
    allow_logon_terminal_server : UInt32,
    timeout_settings_connections : UInt32,
    timeout_settings_disconnections : UInt32,
    timeout_settings_idle : UInt32,
    device_client_drives : UInt32,
    device_client_printers : UInt32,
    client_default_printer : UInt32,
    broken_timeout_settings : UInt32,
    reconnect_settings : UInt32,
    shadowing_settings : UInt32,
    terminal_server_remote_home_dir : UInt32,
    initial_program : Win32cr::Foundation::CHAR[261],
    work_directory : Win32cr::Foundation::CHAR[261],
    terminal_server_profile_path : Win32cr::Foundation::CHAR[261],
    terminal_server_home_dir : Win32cr::Foundation::CHAR[261],
    terminal_server_home_dir_drive : Win32cr::Foundation::CHAR[4]

  @[Extern]
  record WTSUSERCONFIGW,
    source : UInt32,
    inherit_initial_program : UInt32,
    allow_logon_terminal_server : UInt32,
    timeout_settings_connections : UInt32,
    timeout_settings_disconnections : UInt32,
    timeout_settings_idle : UInt32,
    device_client_drives : UInt32,
    device_client_printers : UInt32,
    client_default_printer : UInt32,
    broken_timeout_settings : UInt32,
    reconnect_settings : UInt32,
    shadowing_settings : UInt32,
    terminal_server_remote_home_dir : UInt32,
    initial_program : UInt16[261],
    work_directory : UInt16[261],
    terminal_server_profile_path : UInt16[261],
    terminal_server_home_dir : UInt16[261],
    terminal_server_home_dir_drive : UInt16[4]

  @[Extern]
  record WTS_SESSION_ADDRESS,
    address_family : UInt32,
    address : UInt8[20]

  @[Extern]
  record WTS_PROCESS_INFO_EXW,
    session_id : UInt32,
    process_id : UInt32,
    pProcessName : Win32cr::Foundation::PWSTR,
    pUserSid : Win32cr::Foundation::PSID,
    number_of_threads : UInt32,
    handle_count : UInt32,
    pagefile_usage : UInt32,
    peak_pagefile_usage : UInt32,
    working_set_size : UInt32,
    peak_working_set_size : UInt32,
    user_time : Win32cr::Foundation::LARGE_INTEGER,
    kernel_time : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record WTS_PROCESS_INFO_EXA,
    session_id : UInt32,
    process_id : UInt32,
    pProcessName : Win32cr::Foundation::PSTR,
    pUserSid : Win32cr::Foundation::PSID,
    number_of_threads : UInt32,
    handle_count : UInt32,
    pagefile_usage : UInt32,
    peak_pagefile_usage : UInt32,
    working_set_size : UInt32,
    peak_working_set_size : UInt32,
    user_time : Win32cr::Foundation::LARGE_INTEGER,
    kernel_time : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record WTSLISTENERCONFIGW,
    version : UInt32,
    fEnableListener : UInt32,
    max_connection_count : UInt32,
    fPromptForPassword : UInt32,
    fInheritColorDepth : UInt32,
    color_depth : UInt32,
    fInheritBrokenTimeoutSettings : UInt32,
    broken_timeout_settings : UInt32,
    fDisablePrinterRedirection : UInt32,
    fDisableDriveRedirection : UInt32,
    fDisableComPortRedirection : UInt32,
    fDisableLPTPortRedirection : UInt32,
    fDisableClipboardRedirection : UInt32,
    fDisableAudioRedirection : UInt32,
    fDisablePNPRedirection : UInt32,
    fDisableDefaultMainClientPrinter : UInt32,
    lan_adapter : UInt32,
    port_number : UInt32,
    fInheritShadowSettings : UInt32,
    shadow_settings : UInt32,
    timeout_settings_connection : UInt32,
    timeout_settings_disconnection : UInt32,
    timeout_settings_idle : UInt32,
    security_layer : UInt32,
    min_encryption_level : UInt32,
    user_authentication : UInt32,
    comment : UInt16[61],
    logon_user_name : UInt16[21],
    logon_domain : UInt16[18],
    work_directory : UInt16[261],
    initial_program : UInt16[261]

  @[Extern]
  record WTSLISTENERCONFIGA,
    version : UInt32,
    fEnableListener : UInt32,
    max_connection_count : UInt32,
    fPromptForPassword : UInt32,
    fInheritColorDepth : UInt32,
    color_depth : UInt32,
    fInheritBrokenTimeoutSettings : UInt32,
    broken_timeout_settings : UInt32,
    fDisablePrinterRedirection : UInt32,
    fDisableDriveRedirection : UInt32,
    fDisableComPortRedirection : UInt32,
    fDisableLPTPortRedirection : UInt32,
    fDisableClipboardRedirection : UInt32,
    fDisableAudioRedirection : UInt32,
    fDisablePNPRedirection : UInt32,
    fDisableDefaultMainClientPrinter : UInt32,
    lan_adapter : UInt32,
    port_number : UInt32,
    fInheritShadowSettings : UInt32,
    shadow_settings : UInt32,
    timeout_settings_connection : UInt32,
    timeout_settings_disconnection : UInt32,
    timeout_settings_idle : UInt32,
    security_layer : UInt32,
    min_encryption_level : UInt32,
    user_authentication : UInt32,
    comment : Win32cr::Foundation::CHAR[61],
    logon_user_name : Win32cr::Foundation::CHAR[21],
    logon_domain : Win32cr::Foundation::CHAR[18],
    work_directory : Win32cr::Foundation::CHAR[261],
    initial_program : Win32cr::Foundation::CHAR[261]

  @[Extern]
  record WTSSBX_IP_ADDRESS,
    address_family : Win32cr::System::RemoteDesktop::WTSSBX_ADDRESS_FAMILY,
    address : UInt8[16],
    port_number : UInt16,
    dwScope : UInt32

  @[Extern]
  record WTSSBX_MACHINE_CONNECT_INFO,
    wczMachineFQDN : UInt16[257],
    wczMachineNetBiosName : UInt16[17],
    dwNumOfIPAddr : UInt32,
    i_paddr : Win32cr::System::RemoteDesktop::WTSSBX_IP_ADDRESS[12]

  @[Extern]
  record WTSSBX_MACHINE_INFO,
    client_connect_info : Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_CONNECT_INFO,
    wczFarmName : UInt16[257],
    internal_ip_address : Win32cr::System::RemoteDesktop::WTSSBX_IP_ADDRESS,
    dwMaxSessionsLimit : UInt32,
    server_weight : UInt32,
    single_session_mode : Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_SESSION_MODE,
    in_drain : Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_DRAIN,
    machine_state : Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_STATE

  @[Extern]
  record WTSSBX_SESSION_INFO,
    wszUserName : UInt16[105],
    wszDomainName : UInt16[257],
    application_type : UInt16[257],
    dwSessionId : UInt32,
    create_time : Win32cr::Foundation::FILETIME,
    disconnect_time : Win32cr::Foundation::FILETIME,
    session_state : Win32cr::System::RemoteDesktop::WTSSBX_SESSION_STATE

  @[Extern]
  record CHANNEL_DEF,
    name : Win32cr::Foundation::CHAR[8],
    options : UInt32

  @[Extern]
  record CHANNEL_PDU_HEADER,
    length : UInt32,
    flags : UInt32

  @[Extern]
  record CHANNEL_ENTRY_POINTS,
    cbSize : UInt32,
    protocolVersion : UInt32,
    pVirtualChannelInit : Win32cr::System::RemoteDesktop::PVIRTUALCHANNELINIT,
    pVirtualChannelOpen : Win32cr::System::RemoteDesktop::PVIRTUALCHANNELOPEN,
    pVirtualChannelClose : Win32cr::System::RemoteDesktop::PVIRTUALCHANNELCLOSE,
    pVirtualChannelWrite : Win32cr::System::RemoteDesktop::PVIRTUALCHANNELWRITE

  @[Extern]
  record CLIENT_DISPLAY,
    horizontal_resolution : UInt32,
    vertical_resolution : UInt32,
    color_depth : UInt32

  @[Extern]
  record TSSD_ConnectionPoint,
    server_address_b : UInt8[16],
    address_type : Win32cr::System::RemoteDesktop::TSSD_AddrV46Type,
    port_number : UInt16,
    address_scope : UInt32

  @[Extern]
  record VM_NOTIFY_ENTRY,
    vm_name : UInt16[128],
    vm_host : UInt16[128]

  @[Extern]
  record VM_PATCH_INFO,
    dwNumEntries : UInt32,
    pVmNames : Win32cr::Foundation::PWSTR*

  @[Extern]
  record VM_NOTIFY_INFO,
    dwNumEntries : UInt32,
    ppVmEntries : Win32cr::System::RemoteDesktop::VM_NOTIFY_ENTRY**

  @[Extern]
  record Pluginresource,
    alias__ : UInt16[256],
    name : UInt16[256],
    resourceFileContents : Win32cr::Foundation::PWSTR,
    fileExtension : UInt16[256],
    resourcePluginType : UInt16[256],
    isDiscoverable : UInt8,
    resourceType : Int32,
    pceIconSize : UInt32,
    iconContents : UInt8*,
    pcePluginBlobSize : UInt32,
    blobContents : UInt8*

  @[Extern]
  record Pluginresource2fileassociation,
    extName : UInt16[256],
    primaryHandler : UInt8,
    pceIconSize : UInt32,
    iconContents : UInt8*

  @[Extern]
  record Pluginresource2,
    resourceV1 : Win32cr::System::RemoteDesktop::Pluginresource,
    pceFileAssocListSize : UInt32,
    fileAssocList : Win32cr::System::RemoteDesktop::Pluginresource2fileassociation*,
    securityDescriptor : Win32cr::Foundation::PWSTR,
    pceFolderListSize : UInt32,
    folderList : UInt16**

  @[Extern]
  record BITMAP_RENDERER_STATISTICS,
    dwFramesDelivered : UInt32,
    dwFramesDropped : UInt32

  @[Extern]
  record RFX_GFX_RECT,
    left : Int32,
    top : Int32,
    right : Int32,
    bottom : Int32

  @[Extern]
  record RFX_GFX_MSG_HEADER,
    uMSGType : UInt16,
    cbSize : UInt16

  @[Extern]
  record RFX_GFX_MONITOR_INFO,
    left : Int32,
    top : Int32,
    right : Int32,
    bottom : Int32,
    physicalWidth : UInt32,
    physicalHeight : UInt32,
    orientation : UInt32,
    primary : Win32cr::Foundation::BOOL

  @[Extern]
  record RFX_GFX_MSG_CLIENT_DESKTOP_INFO_REQUEST,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER

  @[Extern]
  record RFX_GFX_MSG_CLIENT_DESKTOP_INFO_RESPONSE,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER,
    reserved : UInt32,
    monitorCount : UInt32,
    monitor_data : Win32cr::System::RemoteDesktop::RFX_GFX_MONITOR_INFO[16],
    clientUniqueId : UInt16[32]

  @[Extern]
  record RFX_GFX_MSG_DESKTOP_CONFIG_CHANGE_NOTIFY,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER,
    ulWidth : UInt32,
    ulHeight : UInt32,
    ulBpp : UInt32,
    reserved : UInt32

  @[Extern]
  record RFX_GFX_MSG_DESKTOP_CONFIG_CHANGE_CONFIRM,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER

  @[Extern]
  record RFX_GFX_MSG_DESKTOP_INPUT_RESET,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER,
    ulWidth : UInt32,
    ulHeight : UInt32

  @[Extern]
  record RFX_GFX_MSG_DISCONNECT_NOTIFY,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER,
    disconnect_reason : UInt32

  @[Extern]
  record RFX_GFX_MSG_DESKTOP_RESEND_REQUEST,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER,
    redraw_rect : Win32cr::System::RemoteDesktop::RFX_GFX_RECT

  @[Extern]
  record RFX_GFX_MSG_RDP_DATA,
    channelHdr : Win32cr::System::RemoteDesktop::RFX_GFX_MSG_HEADER,
    rdpData : UInt8*

  @[Extern]
  record WTS_SOCKADDR,
    sin_family : UInt16,
    u : U_e__union do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      ipv4 : Ipv4_e__struct,
      ipv6 : Ipv6_e__struct do

      # Nested Type Ipv6_e__struct
      @[Extern]
      record Ipv6_e__struct,
        sin6_port : UInt16,
        sin6_flowinfo : UInt32,
        sin6_addr : UInt16[8],
        sin6_scope_id : UInt32


      # Nested Type Ipv4_e__struct
      @[Extern]
      record Ipv4_e__struct,
        sin_port : UInt16,
        in_addr : UInt32,
        sin_zero : UInt8[8]

    end

  end

  @[Extern]
  record WTS_SMALL_RECT,
    left : Int16,
    top : Int16,
    right : Int16,
    bottom : Int16

  @[Extern]
  record WTS_SERVICE_STATE,
    rcm_service_state : Win32cr::System::RemoteDesktop::WTS_RCM_SERVICE_STATE,
    rcm_drain_state : Win32cr::System::RemoteDesktop::WTS_RCM_DRAIN_STATE

  @[Extern]
  record WTS_SESSION_ID,
    session_unique_guid : LibC::GUID,
    session_id : UInt32

  @[Extern]
  record WTS_USER_CREDENTIAL,
    user_name : UInt16[256],
    password : UInt16[256],
    domain : UInt16[256]

  @[Extern]
  record WTS_SYSTEMTIME,
    wYear : UInt16,
    wMonth : UInt16,
    wDayOfWeek : UInt16,
    wDay : UInt16,
    wHour : UInt16,
    wMinute : UInt16,
    wSecond : UInt16,
    wMilliseconds : UInt16

  @[Extern]
  record WTS_TIME_ZONE_INFORMATION,
    bias : Int32,
    standard_name : UInt16[32],
    standard_date : Win32cr::System::RemoteDesktop::WTS_SYSTEMTIME,
    standard_bias : Int32,
    daylight_name : UInt16[32],
    daylight_date : Win32cr::System::RemoteDesktop::WTS_SYSTEMTIME,
    daylight_bias : Int32

  @[Extern]
  record WRDS_DYNAMIC_TIME_ZONE_INFORMATION,
    bias : Int32,
    standard_name : UInt16[32],
    standard_date : Win32cr::System::RemoteDesktop::WTS_SYSTEMTIME,
    standard_bias : Int32,
    daylight_name : UInt16[32],
    daylight_date : Win32cr::System::RemoteDesktop::WTS_SYSTEMTIME,
    daylight_bias : Int32,
    time_zone_key_name : UInt16[128],
    dynamic_daylight_time_disabled : UInt16

  @[Extern]
  record WTS_CLIENT_DATA,
    fDisableCtrlAltDel : Win32cr::Foundation::BOOLEAN,
    fDoubleClickDetect : Win32cr::Foundation::BOOLEAN,
    fEnableWindowsKey : Win32cr::Foundation::BOOLEAN,
    fHideTitleBar : Win32cr::Foundation::BOOLEAN,
    fInheritAutoLogon : Win32cr::Foundation::BOOL,
    fPromptForPassword : Win32cr::Foundation::BOOLEAN,
    fUsingSavedCreds : Win32cr::Foundation::BOOLEAN,
    domain : UInt16[256],
    user_name : UInt16[256],
    password : UInt16[256],
    fPasswordIsScPin : Win32cr::Foundation::BOOLEAN,
    fInheritInitialProgram : Win32cr::Foundation::BOOL,
    work_directory : UInt16[257],
    initial_program : UInt16[257],
    fMaximizeShell : Win32cr::Foundation::BOOLEAN,
    encryption_level : UInt8,
    performance_flags : UInt32,
    protocol_name : UInt16[9],
    protocol_type : UInt16,
    fInheritColorDepth : Win32cr::Foundation::BOOL,
    h_res : UInt16,
    v_res : UInt16,
    color_depth : UInt16,
    display_driver_name : UInt16[9],
    display_device_name : UInt16[20],
    fMouse : Win32cr::Foundation::BOOLEAN,
    keyboard_layout : UInt32,
    keyboard_type : UInt32,
    keyboard_sub_type : UInt32,
    keyboard_function_key : UInt32,
    imeFileName : UInt16[33],
    active_input_locale : UInt32,
    fNoAudioPlayback : Win32cr::Foundation::BOOLEAN,
    fRemoteConsoleAudio : Win32cr::Foundation::BOOLEAN,
    audio_driver_name : UInt16[9],
    client_time_zone : Win32cr::System::RemoteDesktop::WTS_TIME_ZONE_INFORMATION,
    client_name : UInt16[21],
    serial_number : UInt32,
    client_address_family : UInt32,
    client_address : UInt16[31],
    client_sock_address : Win32cr::System::RemoteDesktop::WTS_SOCKADDR,
    client_directory : UInt16[257],
    client_build_number : UInt32,
    client_product_id : UInt16,
    out_buf_count_host : UInt16,
    out_buf_count_client : UInt16,
    out_buf_length : UInt16,
    client_session_id : UInt32,
    client_dig_product_id : UInt16[33],
    fDisableCpm : Win32cr::Foundation::BOOLEAN,
    fDisableCdm : Win32cr::Foundation::BOOLEAN,
    fDisableCcm : Win32cr::Foundation::BOOLEAN,
    fDisableLPT : Win32cr::Foundation::BOOLEAN,
    fDisableClip : Win32cr::Foundation::BOOLEAN,
    fDisablePNP : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record WTS_USER_DATA,
    work_directory : UInt16[257],
    initial_program : UInt16[257],
    user_time_zone : Win32cr::System::RemoteDesktop::WTS_TIME_ZONE_INFORMATION

  @[Extern]
  record WTS_POLICY_DATA,
    fDisableEncryption : Win32cr::Foundation::BOOLEAN,
    fDisableAutoReconnect : Win32cr::Foundation::BOOLEAN,
    color_depth : UInt32,
    min_encryption_level : UInt8,
    fDisableCpm : Win32cr::Foundation::BOOLEAN,
    fDisableCdm : Win32cr::Foundation::BOOLEAN,
    fDisableCcm : Win32cr::Foundation::BOOLEAN,
    fDisableLPT : Win32cr::Foundation::BOOLEAN,
    fDisableClip : Win32cr::Foundation::BOOLEAN,
    fDisablePNPRedir : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record WTS_PROTOCOL_CACHE,
    cache_reads : UInt32,
    cache_hits : UInt32

  @[Extern(union: true)]
  record WTS_CACHE_STATS_UN,
    protocol_cache : Win32cr::System::RemoteDesktop::WTS_PROTOCOL_CACHE[4],
    t_share_cache_stats : UInt32,
    reserved : UInt32[20]

  @[Extern]
  record WTS_CACHE_STATS,
    specific : UInt32,
    data : Win32cr::System::RemoteDesktop::WTS_CACHE_STATS_UN,
    protocol_type : UInt16,
    length : UInt16

  @[Extern]
  record WTS_PROTOCOL_COUNTERS,
    wd_bytes : UInt32,
    wd_frames : UInt32,
    wait_for_out_buf : UInt32,
    frames : UInt32,
    bytes : UInt32,
    compressed_bytes : UInt32,
    compress_flushes : UInt32,
    errors : UInt32,
    timeouts : UInt32,
    async_framing_error : UInt32,
    async_overrun_error : UInt32,
    async_overflow_error : UInt32,
    async_parity_error : UInt32,
    td_errors : UInt32,
    protocol_type : UInt16,
    length : UInt16,
    specific : UInt16,
    reserved : UInt32[100]

  @[Extern]
  record WTS_PROTOCOL_STATUS,
    output : Win32cr::System::RemoteDesktop::WTS_PROTOCOL_COUNTERS,
    input : Win32cr::System::RemoteDesktop::WTS_PROTOCOL_COUNTERS,
    cache : Win32cr::System::RemoteDesktop::WTS_CACHE_STATS,
    async_signal : UInt32,
    async_signal_mask : UInt32,
    counters : Win32cr::Foundation::LARGE_INTEGER[100]

  @[Extern]
  record WTS_DISPLAY_IOCTL,
    pDisplayIOCtlData : UInt8[256],
    cbDisplayIOCtlData : UInt32

  @[Extern]
  record WTS_PROPERTY_VALUE,
    type__ : UInt16,
    u : U_e__union do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      ulVal : UInt32,
      strVal : Strval_e__struct,
      bVal : Bval_e__struct,
      guidVal : LibC::GUID do

      # Nested Type Bval_e__struct
      @[Extern]
      record Bval_e__struct,
        size : UInt32,
        pbVal : Win32cr::Foundation::PSTR


      # Nested Type Strval_e__struct
      @[Extern]
      record Strval_e__struct,
        size : UInt32,
        pstrVal : Win32cr::Foundation::PWSTR

    end

  end

  @[Extern]
  record WTS_LICENSE_CAPABILITIES,
    key_exchange_alg : UInt32,
    protocol_ver : UInt32,
    fAuthenticateServer : Win32cr::Foundation::BOOL,
    cert_type : Win32cr::System::RemoteDesktop::WTS_CERT_TYPE,
    cbClientName : UInt32,
    rgbClientName : UInt8[42]

  @[Extern]
  record WRDS_LISTENER_SETTINGS_1,
    max_protocol_listener_connection_count : UInt32,
    security_descriptor_size : UInt32,
    pSecurityDescriptor : UInt8*

  @[Extern(union: true)]
  record WRDS_LISTENER_SETTING,
    w_rds_listener_settings1 : Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTINGS_1

  @[Extern]
  record WRDS_LISTENER_SETTINGS,
    w_rds_listener_setting_level : Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTING_LEVEL,
    w_rds_listener_setting : Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTING

  @[Extern]
  record WRDS_CONNECTION_SETTINGS_1,
    fInheritInitialProgram : Win32cr::Foundation::BOOLEAN,
    fInheritColorDepth : Win32cr::Foundation::BOOLEAN,
    fHideTitleBar : Win32cr::Foundation::BOOLEAN,
    fInheritAutoLogon : Win32cr::Foundation::BOOLEAN,
    fMaximizeShell : Win32cr::Foundation::BOOLEAN,
    fDisablePNP : Win32cr::Foundation::BOOLEAN,
    fPasswordIsScPin : Win32cr::Foundation::BOOLEAN,
    fPromptForPassword : Win32cr::Foundation::BOOLEAN,
    fDisableCpm : Win32cr::Foundation::BOOLEAN,
    fDisableCdm : Win32cr::Foundation::BOOLEAN,
    fDisableCcm : Win32cr::Foundation::BOOLEAN,
    fDisableLPT : Win32cr::Foundation::BOOLEAN,
    fDisableClip : Win32cr::Foundation::BOOLEAN,
    fResetBroken : Win32cr::Foundation::BOOLEAN,
    fDisableEncryption : Win32cr::Foundation::BOOLEAN,
    fDisableAutoReconnect : Win32cr::Foundation::BOOLEAN,
    fDisableCtrlAltDel : Win32cr::Foundation::BOOLEAN,
    fDoubleClickDetect : Win32cr::Foundation::BOOLEAN,
    fEnableWindowsKey : Win32cr::Foundation::BOOLEAN,
    fUsingSavedCreds : Win32cr::Foundation::BOOLEAN,
    fMouse : Win32cr::Foundation::BOOLEAN,
    fNoAudioPlayback : Win32cr::Foundation::BOOLEAN,
    fRemoteConsoleAudio : Win32cr::Foundation::BOOLEAN,
    encryption_level : UInt8,
    color_depth : UInt16,
    protocol_type : UInt16,
    h_res : UInt16,
    v_res : UInt16,
    client_product_id : UInt16,
    out_buf_count_host : UInt16,
    out_buf_count_client : UInt16,
    out_buf_length : UInt16,
    keyboard_layout : UInt32,
    max_connection_time : UInt32,
    max_disconnection_time : UInt32,
    max_idle_time : UInt32,
    performance_flags : UInt32,
    keyboard_type : UInt32,
    keyboard_sub_type : UInt32,
    keyboard_function_key : UInt32,
    active_input_locale : UInt32,
    serial_number : UInt32,
    client_address_family : UInt32,
    client_build_number : UInt32,
    client_session_id : UInt32,
    work_directory : UInt16[257],
    initial_program : UInt16[257],
    user_name : UInt16[256],
    domain : UInt16[256],
    password : UInt16[256],
    protocol_name : UInt16[9],
    display_driver_name : UInt16[9],
    display_device_name : UInt16[20],
    imeFileName : UInt16[33],
    audio_driver_name : UInt16[9],
    client_name : UInt16[21],
    client_address : UInt16[31],
    client_directory : UInt16[257],
    client_dig_product_id : UInt16[33],
    client_sock_address : Win32cr::System::RemoteDesktop::WTS_SOCKADDR,
    client_time_zone : Win32cr::System::RemoteDesktop::WTS_TIME_ZONE_INFORMATION,
    w_rds_listener_settings : Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTINGS,
    event_log_activity_id : LibC::GUID,
    context_size : UInt32,
    context_data : UInt8*

  @[Extern]
  record WRDS_SETTINGS_1,
    w_rds_disable_clip_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_clip_value : UInt32,
    w_rds_disable_lpt_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_lpt_value : UInt32,
    w_rds_disable_ccm_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_ccm_value : UInt32,
    w_rds_disable_cdm_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_cdm_value : UInt32,
    w_rds_disable_cpm_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_cpm_value : UInt32,
    w_rds_disable_pnp_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_pnp_value : UInt32,
    w_rds_encryption_level_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_encryption_value : UInt32,
    w_rds_color_depth_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_color_depth_value : UInt32,
    w_rds_disable_auto_reconnecet_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_auto_reconnecet_value : UInt32,
    w_rds_disable_encryption_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_disable_encryption_value : UInt32,
    w_rds_reset_broken_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_reset_broken_value : UInt32,
    w_rds_max_idle_time_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_max_idle_time_value : UInt32,
    w_rds_max_disconnect_time_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_max_disconnect_time_value : UInt32,
    w_rds_max_connect_time_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_max_connect_time_value : UInt32,
    w_rds_keep_alive_status : Win32cr::System::RemoteDesktop::WRDS_SETTING_STATUS,
    w_rds_keep_alive_start_value : Win32cr::Foundation::BOOLEAN,
    w_rds_keep_alive_interval_value : UInt32

  @[Extern(union: true)]
  record WRDS_CONNECTION_SETTING,
    w_rds_connection_settings1 : Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTINGS_1

  @[Extern]
  record WRDS_CONNECTION_SETTINGS,
    w_rds_connection_setting_level : Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTING_LEVEL,
    w_rds_connection_setting : Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTING

  @[Extern(union: true)]
  record WRDS_SETTING,
    w_rds_settings1 : Win32cr::System::RemoteDesktop::WRDS_SETTINGS_1

  @[Extern]
  record WRDS_SETTINGS,
    w_rds_setting_type : Win32cr::System::RemoteDesktop::WRDS_SETTING_TYPE,
    w_rds_setting_level : Win32cr::System::RemoteDesktop::WRDS_SETTING_LEVEL,
    w_rds_setting : Win32cr::System::RemoteDesktop::WRDS_SETTING

  @[Extern]
  record WTSSESSION_NOTIFICATION,
    cbSize : UInt32,
    dwSessionId : UInt32

  @[Extern]
  record IAudioEndpointVtbl,
    query_interface : Proc(IAudioEndpoint*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpoint*, UInt32),
    release : Proc(IAudioEndpoint*, UInt32),
    get_frame_format : Proc(IAudioEndpoint*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    get_frames_per_packet : Proc(IAudioEndpoint*, UInt32*, Win32cr::Foundation::HRESULT),
    get_latency : Proc(IAudioEndpoint*, Int64*, Win32cr::Foundation::HRESULT),
    set_stream_flags : Proc(IAudioEndpoint*, UInt32, Win32cr::Foundation::HRESULT),
    set_event_handle : Proc(IAudioEndpoint*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("30a99515-1527-4451-af9f-00c5f0234daf")]
  record IAudioEndpoint, lpVtbl : IAudioEndpointVtbl* do
    GUID = LibC::GUID.new(0x30a99515_u32, 0x1527_u16, 0x4451_u16, StaticArray[0xaf_u8, 0x9f_u8, 0x0_u8, 0xc5_u8, 0xf0_u8, 0x23_u8, 0x4d_u8, 0xaf_u8])
    def query_interface(this : IAudioEndpoint*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpoint*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpoint*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_frame_format(this : IAudioEndpoint*, ppFormat : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_format.call(this, ppFormat)
    end
    def get_frames_per_packet(this : IAudioEndpoint*, pFramesPerPacket : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frames_per_packet.call(this, pFramesPerPacket)
    end
    def get_latency(this : IAudioEndpoint*, pLatency : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latency.call(this, pLatency)
    end
    def set_stream_flags(this : IAudioEndpoint*, streamFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_flags.call(this, streamFlags)
    end
    def set_event_handle(this : IAudioEndpoint*, eventHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_handle.call(this, eventHandle)
    end

  end

  @[Extern]
  record IAudioEndpointRTVtbl,
    query_interface : Proc(IAudioEndpointRT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointRT*, UInt32),
    release : Proc(IAudioEndpointRT*, UInt32),
    get_current_padding : Proc(IAudioEndpointRT*, Int64*, Win32cr::System::RemoteDesktop::AE_CURRENT_POSITION*, Void),
    processing_complete : Proc(IAudioEndpointRT*, Void),
    set_pin_inactive : Proc(IAudioEndpointRT*, Win32cr::Foundation::HRESULT),
    set_pin_active : Proc(IAudioEndpointRT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dfd2005f-a6e5-4d39-a265-939ada9fbb4d")]
  record IAudioEndpointRT, lpVtbl : IAudioEndpointRTVtbl* do
    GUID = LibC::GUID.new(0xdfd2005f_u32, 0xa6e5_u16, 0x4d39_u16, StaticArray[0xa2_u8, 0x65_u8, 0x93_u8, 0x9a_u8, 0xda_u8, 0x9f_u8, 0xbb_u8, 0x4d_u8])
    def query_interface(this : IAudioEndpointRT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointRT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointRT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_padding(this : IAudioEndpointRT*, pPadding : Int64*, pAeCurrentPosition : Win32cr::System::RemoteDesktop::AE_CURRENT_POSITION*) : Void
      @lpVtbl.try &.value.get_current_padding.call(this, pPadding, pAeCurrentPosition)
    end
    def processing_complete(this : IAudioEndpointRT*) : Void
      @lpVtbl.try &.value.processing_complete.call(this)
    end
    def set_pin_inactive(this : IAudioEndpointRT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pin_inactive.call(this)
    end
    def set_pin_active(this : IAudioEndpointRT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pin_active.call(this)
    end

  end

  @[Extern]
  record IAudioInputEndpointRTVtbl,
    query_interface : Proc(IAudioInputEndpointRT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioInputEndpointRT*, UInt32),
    release : Proc(IAudioInputEndpointRT*, UInt32),
    get_input_data_pointer : Proc(IAudioInputEndpointRT*, Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*, Win32cr::System::RemoteDesktop::AE_CURRENT_POSITION*, Void),
    release_input_data_pointer : Proc(IAudioInputEndpointRT*, UInt32, LibC::UIntPtrT, Void),
    pulse_endpoint : Proc(IAudioInputEndpointRT*, Void)


  @[Extern]
  #@[Com("8026ab61-92b2-43c1-a1df-5c37ebd08d82")]
  record IAudioInputEndpointRT, lpVtbl : IAudioInputEndpointRTVtbl* do
    GUID = LibC::GUID.new(0x8026ab61_u32, 0x92b2_u16, 0x43c1_u16, StaticArray[0xa1_u8, 0xdf_u8, 0x5c_u8, 0x37_u8, 0xeb_u8, 0xd0_u8, 0x8d_u8, 0x82_u8])
    def query_interface(this : IAudioInputEndpointRT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioInputEndpointRT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioInputEndpointRT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_data_pointer(this : IAudioInputEndpointRT*, pConnectionProperty : Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*, pAeTimeStamp : Win32cr::System::RemoteDesktop::AE_CURRENT_POSITION*) : Void
      @lpVtbl.try &.value.get_input_data_pointer.call(this, pConnectionProperty, pAeTimeStamp)
    end
    def release_input_data_pointer(this : IAudioInputEndpointRT*, u32FrameCount : UInt32, pDataPointer : LibC::UIntPtrT) : Void
      @lpVtbl.try &.value.release_input_data_pointer.call(this, u32FrameCount, pDataPointer)
    end
    def pulse_endpoint(this : IAudioInputEndpointRT*) : Void
      @lpVtbl.try &.value.pulse_endpoint.call(this)
    end

  end

  @[Extern]
  record IAudioOutputEndpointRTVtbl,
    query_interface : Proc(IAudioOutputEndpointRT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioOutputEndpointRT*, UInt32),
    release : Proc(IAudioOutputEndpointRT*, UInt32),
    get_output_data_pointer : Proc(IAudioOutputEndpointRT*, UInt32, Win32cr::System::RemoteDesktop::AE_CURRENT_POSITION*, LibC::UIntPtrT),
    release_output_data_pointer : Proc(IAudioOutputEndpointRT*, Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*, Void),
    pulse_endpoint : Proc(IAudioOutputEndpointRT*, Void)


  @[Extern]
  #@[Com("8fa906e4-c31c-4e31-932e-19a66385e9aa")]
  record IAudioOutputEndpointRT, lpVtbl : IAudioOutputEndpointRTVtbl* do
    GUID = LibC::GUID.new(0x8fa906e4_u32, 0xc31c_u16, 0x4e31_u16, StaticArray[0x93_u8, 0x2e_u8, 0x19_u8, 0xa6_u8, 0x63_u8, 0x85_u8, 0xe9_u8, 0xaa_u8])
    def query_interface(this : IAudioOutputEndpointRT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioOutputEndpointRT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioOutputEndpointRT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_output_data_pointer(this : IAudioOutputEndpointRT*, u32FrameCount : UInt32, pAeTimeStamp : Win32cr::System::RemoteDesktop::AE_CURRENT_POSITION*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_output_data_pointer.call(this, u32FrameCount, pAeTimeStamp)
    end
    def release_output_data_pointer(this : IAudioOutputEndpointRT*, pConnectionProperty : Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*) : Void
      @lpVtbl.try &.value.release_output_data_pointer.call(this, pConnectionProperty)
    end
    def pulse_endpoint(this : IAudioOutputEndpointRT*) : Void
      @lpVtbl.try &.value.pulse_endpoint.call(this)
    end

  end

  @[Extern]
  record IAudioDeviceEndpointVtbl,
    query_interface : Proc(IAudioDeviceEndpoint*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioDeviceEndpoint*, UInt32),
    release : Proc(IAudioDeviceEndpoint*, UInt32),
    set_buffer : Proc(IAudioDeviceEndpoint*, Int64, UInt32, Win32cr::Foundation::HRESULT),
    get_rt_caps : Proc(IAudioDeviceEndpoint*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_event_driven_capable : Proc(IAudioDeviceEndpoint*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    write_exclusive_mode_parameters_to_shared_memory : Proc(IAudioDeviceEndpoint*, LibC::UIntPtrT, Int64, Int64, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d4952f5a-a0b2-4cc4-8b82-9358488dd8ac")]
  record IAudioDeviceEndpoint, lpVtbl : IAudioDeviceEndpointVtbl* do
    GUID = LibC::GUID.new(0xd4952f5a_u32, 0xa0b2_u16, 0x4cc4_u16, StaticArray[0x8b_u8, 0x82_u8, 0x93_u8, 0x58_u8, 0x48_u8, 0x8d_u8, 0xd8_u8, 0xac_u8])
    def query_interface(this : IAudioDeviceEndpoint*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioDeviceEndpoint*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioDeviceEndpoint*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_buffer(this : IAudioDeviceEndpoint*, max_period : Int64, u32LatencyCoefficient : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer.call(this, max_period, u32LatencyCoefficient)
    end
    def get_rt_caps(this : IAudioDeviceEndpoint*, pbIsRTCapable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rt_caps.call(this, pbIsRTCapable)
    end
    def get_event_driven_capable(this : IAudioDeviceEndpoint*, pbisEventCapable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_driven_capable.call(this, pbisEventCapable)
    end
    def write_exclusive_mode_parameters_to_shared_memory(this : IAudioDeviceEndpoint*, hTargetProcess : LibC::UIntPtrT, hnsPeriod : Int64, hnsBufferDuration : Int64, u32LatencyCoefficient : UInt32, pu32SharedMemorySize : UInt32*, phSharedMemory : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_exclusive_mode_parameters_to_shared_memory.call(this, hTargetProcess, hnsPeriod, hnsBufferDuration, u32LatencyCoefficient, pu32SharedMemorySize, phSharedMemory)
    end

  end

  @[Extern]
  record IAudioEndpointControlVtbl,
    query_interface : Proc(IAudioEndpointControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointControl*, UInt32),
    release : Proc(IAudioEndpointControl*, UInt32),
    start : Proc(IAudioEndpointControl*, Win32cr::Foundation::HRESULT),
    reset : Proc(IAudioEndpointControl*, Win32cr::Foundation::HRESULT),
    stop : Proc(IAudioEndpointControl*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c684b72a-6df4-4774-bdf9-76b77509b653")]
  record IAudioEndpointControl, lpVtbl : IAudioEndpointControlVtbl* do
    GUID = LibC::GUID.new(0xc684b72a_u32, 0x6df4_u16, 0x4774_u16, StaticArray[0xbd_u8, 0xf9_u8, 0x76_u8, 0xb7_u8, 0x75_u8, 0x9_u8, 0xb6_u8, 0x53_u8])
    def query_interface(this : IAudioEndpointControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IAudioEndpointControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this)
    end
    def reset(this : IAudioEndpointControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def stop(this : IAudioEndpointControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end

  end

  @[Extern]
  record IADsTSUserExVtbl,
    query_interface : Proc(IADsTSUserEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IADsTSUserEx*, UInt32),
    release : Proc(IADsTSUserEx*, UInt32),
    get_type_info_count : Proc(IADsTSUserEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IADsTSUserEx*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IADsTSUserEx*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IADsTSUserEx*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_TerminalServicesProfilePath : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TerminalServicesProfilePath : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TerminalServicesHomeDirectory : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TerminalServicesHomeDirectory : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TerminalServicesHomeDrive : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TerminalServicesHomeDrive : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AllowLogon : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_AllowLogon : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_EnableRemoteControl : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_EnableRemoteControl : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxDisconnectionTime : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxDisconnectionTime : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxConnectionTime : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxConnectionTime : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxIdleTime : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxIdleTime : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_ReconnectionAction : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_ReconnectionAction : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_BrokenConnectionAction : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_BrokenConnectionAction : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_ConnectClientDrivesAtLogon : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_ConnectClientDrivesAtLogon : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_ConnectClientPrintersAtLogon : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_ConnectClientPrintersAtLogon : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_DefaultToMainPrinter : Proc(IADsTSUserEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_DefaultToMainPrinter : Proc(IADsTSUserEx*, Int32, Win32cr::Foundation::HRESULT),
    get_TerminalServicesWorkDirectory : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TerminalServicesWorkDirectory : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TerminalServicesInitialProgram : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TerminalServicesInitialProgram : Proc(IADsTSUserEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c4930e79-2989-4462-8a60-2fcf2f2955ef")]
  record IADsTSUserEx, lpVtbl : IADsTSUserExVtbl* do
    GUID = LibC::GUID.new(0xc4930e79_u32, 0x2989_u16, 0x4462_u16, StaticArray[0x8a_u8, 0x60_u8, 0x2f_u8, 0xcf_u8, 0x2f_u8, 0x29_u8, 0x55_u8, 0xef_u8])
    def query_interface(this : IADsTSUserEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IADsTSUserEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IADsTSUserEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IADsTSUserEx*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IADsTSUserEx*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IADsTSUserEx*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IADsTSUserEx*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_TerminalServicesProfilePath(this : IADsTSUserEx*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TerminalServicesProfilePath.call(this, pVal)
    end
    def put_TerminalServicesProfilePath(this : IADsTSUserEx*, pNewVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TerminalServicesProfilePath.call(this, pNewVal)
    end
    def get_TerminalServicesHomeDirectory(this : IADsTSUserEx*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TerminalServicesHomeDirectory.call(this, pVal)
    end
    def put_TerminalServicesHomeDirectory(this : IADsTSUserEx*, pNewVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TerminalServicesHomeDirectory.call(this, pNewVal)
    end
    def get_TerminalServicesHomeDrive(this : IADsTSUserEx*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TerminalServicesHomeDrive.call(this, pVal)
    end
    def put_TerminalServicesHomeDrive(this : IADsTSUserEx*, pNewVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TerminalServicesHomeDrive.call(this, pNewVal)
    end
    def get_AllowLogon(this : IADsTSUserEx*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowLogon.call(this, pVal)
    end
    def put_AllowLogon(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowLogon.call(this, new_val)
    end
    def get_EnableRemoteControl(this : IADsTSUserEx*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnableRemoteControl.call(this, pVal)
    end
    def put_EnableRemoteControl(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnableRemoteControl.call(this, new_val)
    end
    def get_MaxDisconnectionTime(this : IADsTSUserEx*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDisconnectionTime.call(this, pVal)
    end
    def put_MaxDisconnectionTime(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxDisconnectionTime.call(this, new_val)
    end
    def get_MaxConnectionTime(this : IADsTSUserEx*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxConnectionTime.call(this, pVal)
    end
    def put_MaxConnectionTime(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxConnectionTime.call(this, new_val)
    end
    def get_MaxIdleTime(this : IADsTSUserEx*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxIdleTime.call(this, pVal)
    end
    def put_MaxIdleTime(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxIdleTime.call(this, new_val)
    end
    def get_ReconnectionAction(this : IADsTSUserEx*, pNewVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReconnectionAction.call(this, pNewVal)
    end
    def put_ReconnectionAction(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReconnectionAction.call(this, new_val)
    end
    def get_BrokenConnectionAction(this : IADsTSUserEx*, pNewVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BrokenConnectionAction.call(this, pNewVal)
    end
    def put_BrokenConnectionAction(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BrokenConnectionAction.call(this, new_val)
    end
    def get_ConnectClientDrivesAtLogon(this : IADsTSUserEx*, pNewVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectClientDrivesAtLogon.call(this, pNewVal)
    end
    def put_ConnectClientDrivesAtLogon(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectClientDrivesAtLogon.call(this, new_val)
    end
    def get_ConnectClientPrintersAtLogon(this : IADsTSUserEx*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectClientPrintersAtLogon.call(this, pVal)
    end
    def put_ConnectClientPrintersAtLogon(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectClientPrintersAtLogon.call(this, new_val)
    end
    def get_DefaultToMainPrinter(this : IADsTSUserEx*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultToMainPrinter.call(this, pVal)
    end
    def put_DefaultToMainPrinter(this : IADsTSUserEx*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DefaultToMainPrinter.call(this, new_val)
    end
    def get_TerminalServicesWorkDirectory(this : IADsTSUserEx*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TerminalServicesWorkDirectory.call(this, pVal)
    end
    def put_TerminalServicesWorkDirectory(this : IADsTSUserEx*, pNewVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TerminalServicesWorkDirectory.call(this, pNewVal)
    end
    def get_TerminalServicesInitialProgram(this : IADsTSUserEx*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TerminalServicesInitialProgram.call(this, pVal)
    end
    def put_TerminalServicesInitialProgram(this : IADsTSUserEx*, pNewVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TerminalServicesInitialProgram.call(this, pNewVal)
    end

  end

  @[Extern]
  record ITSGAuthorizeConnectionSinkVtbl,
    query_interface : Proc(ITSGAuthorizeConnectionSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITSGAuthorizeConnectionSink*, UInt32),
    release : Proc(ITSGAuthorizeConnectionSink*, UInt32),
    on_connection_authorized : Proc(ITSGAuthorizeConnectionSink*, Win32cr::Foundation::HRESULT, LibC::GUID, UInt32, UInt8*, UInt32, UInt32, Win32cr::System::RemoteDesktop::SESSION_TIMEOUT_ACTION_TYPE, Win32cr::System::RemoteDesktop::AATrustClassID, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c27ece33-7781-4318-98ef-1cf2da7b7005")]
  record ITSGAuthorizeConnectionSink, lpVtbl : ITSGAuthorizeConnectionSinkVtbl* do
    GUID = LibC::GUID.new(0xc27ece33_u32, 0x7781_u16, 0x4318_u16, StaticArray[0x98_u8, 0xef_u8, 0x1c_u8, 0xf2_u8, 0xda_u8, 0x7b_u8, 0x70_u8, 0x5_u8])
    def query_interface(this : ITSGAuthorizeConnectionSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITSGAuthorizeConnectionSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITSGAuthorizeConnectionSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_connection_authorized(this : ITSGAuthorizeConnectionSink*, hrIn : Win32cr::Foundation::HRESULT, mainSessionId : LibC::GUID, cbSoHResponse : UInt32, pbSoHResponse : UInt8*, idleTimeout : UInt32, sessionTimeout : UInt32, sessionTimeoutAction : Win32cr::System::RemoteDesktop::SESSION_TIMEOUT_ACTION_TYPE, trustClass : Win32cr::System::RemoteDesktop::AATrustClassID, policyAttributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connection_authorized.call(this, hrIn, mainSessionId, cbSoHResponse, pbSoHResponse, idleTimeout, sessionTimeout, sessionTimeoutAction, trustClass, policyAttributes)
    end

  end

  @[Extern]
  record ITSGAuthorizeResourceSinkVtbl,
    query_interface : Proc(ITSGAuthorizeResourceSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITSGAuthorizeResourceSink*, UInt32),
    release : Proc(ITSGAuthorizeResourceSink*, UInt32),
    on_channel_authorized : Proc(ITSGAuthorizeResourceSink*, Win32cr::Foundation::HRESULT, LibC::GUID, Int32, Win32cr::Foundation::BSTR*, UInt32, Win32cr::Foundation::BSTR*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("feddfcd4-fa12-4435-ae55-7ad1a9779af7")]
  record ITSGAuthorizeResourceSink, lpVtbl : ITSGAuthorizeResourceSinkVtbl* do
    GUID = LibC::GUID.new(0xfeddfcd4_u32, 0xfa12_u16, 0x4435_u16, StaticArray[0xae_u8, 0x55_u8, 0x7a_u8, 0xd1_u8, 0xa9_u8, 0x77_u8, 0x9a_u8, 0xf7_u8])
    def query_interface(this : ITSGAuthorizeResourceSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITSGAuthorizeResourceSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITSGAuthorizeResourceSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_channel_authorized(this : ITSGAuthorizeResourceSink*, hrIn : Win32cr::Foundation::HRESULT, mainSessionId : LibC::GUID, subSessionId : Int32, allowedResourceNames : Win32cr::Foundation::BSTR*, numAllowedResourceNames : UInt32, failedResourceNames : Win32cr::Foundation::BSTR*, numFailedResourceNames : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_channel_authorized.call(this, hrIn, mainSessionId, subSessionId, allowedResourceNames, numAllowedResourceNames, failedResourceNames, numFailedResourceNames)
    end

  end

  @[Extern]
  record ITSGPolicyEngineVtbl,
    query_interface : Proc(ITSGPolicyEngine*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITSGPolicyEngine*, UInt32),
    release : Proc(ITSGPolicyEngine*, UInt32),
    authorize_connection : Proc(ITSGPolicyEngine*, LibC::GUID, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::AAAuthSchemes, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::HANDLE_PTR, Void*, Win32cr::Foundation::HRESULT),
    authorize_resource : Proc(ITSGPolicyEngine*, LibC::GUID, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, UInt32, Win32cr::Foundation::BSTR*, UInt32, UInt32, Win32cr::Foundation::BSTR, UInt8*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    refresh : Proc(ITSGPolicyEngine*, Win32cr::Foundation::HRESULT),
    is_quarantine_enabled : Proc(ITSGPolicyEngine*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8bc24f08-6223-42f4-a5b4-8e37cd135bbd")]
  record ITSGPolicyEngine, lpVtbl : ITSGPolicyEngineVtbl* do
    GUID = LibC::GUID.new(0x8bc24f08_u32, 0x6223_u16, 0x42f4_u16, StaticArray[0xa5_u8, 0xb4_u8, 0x8e_u8, 0x37_u8, 0xcd_u8, 0x13_u8, 0x5b_u8, 0xbd_u8])
    def query_interface(this : ITSGPolicyEngine*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITSGPolicyEngine*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITSGPolicyEngine*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def authorize_connection(this : ITSGPolicyEngine*, mainSessionId : LibC::GUID, username : Win32cr::Foundation::BSTR, authType : Win32cr::System::RemoteDesktop::AAAuthSchemes, clientMachineIP : Win32cr::Foundation::BSTR, clientMachineName : Win32cr::Foundation::BSTR, sohData : UInt8*, numSOHBytes : UInt32, cookieData : UInt8*, numCookieBytes : UInt32, userToken : Win32cr::Foundation::HANDLE_PTR, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authorize_connection.call(this, mainSessionId, username, authType, clientMachineIP, clientMachineName, sohData, numSOHBytes, cookieData, numCookieBytes, userToken, pSink)
    end
    def authorize_resource(this : ITSGPolicyEngine*, mainSessionId : LibC::GUID, subSessionId : Int32, username : Win32cr::Foundation::BSTR, resourceNames : Win32cr::Foundation::BSTR*, numResources : UInt32, alternateResourceNames : Win32cr::Foundation::BSTR*, numAlternateResourceName : UInt32, portNumber : UInt32, operation : Win32cr::Foundation::BSTR, cookie : UInt8*, numBytesInCookie : UInt32, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authorize_resource.call(this, mainSessionId, subSessionId, username, resourceNames, numResources, alternateResourceNames, numAlternateResourceName, portNumber, operation, cookie, numBytesInCookie, pSink)
    end
    def refresh(this : ITSGPolicyEngine*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def is_quarantine_enabled(this : ITSGPolicyEngine*, quarantineEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_quarantine_enabled.call(this, quarantineEnabled)
    end

  end

  @[Extern]
  record ITSGAccountingEngineVtbl,
    query_interface : Proc(ITSGAccountingEngine*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITSGAccountingEngine*, UInt32),
    release : Proc(ITSGAccountingEngine*, UInt32),
    do_accounting : Proc(ITSGAccountingEngine*, Win32cr::System::RemoteDesktop::AAAccountingDataType, Win32cr::System::RemoteDesktop::AAAccountingData, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4ce2a0c9-e874-4f1a-86f4-06bbb9115338")]
  record ITSGAccountingEngine, lpVtbl : ITSGAccountingEngineVtbl* do
    GUID = LibC::GUID.new(0x4ce2a0c9_u32, 0xe874_u16, 0x4f1a_u16, StaticArray[0x86_u8, 0xf4_u8, 0x6_u8, 0xbb_u8, 0xb9_u8, 0x11_u8, 0x53_u8, 0x38_u8])
    def query_interface(this : ITSGAccountingEngine*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITSGAccountingEngine*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITSGAccountingEngine*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def do_accounting(this : ITSGAccountingEngine*, accountingDataType : Win32cr::System::RemoteDesktop::AAAccountingDataType, accountingData : Win32cr::System::RemoteDesktop::AAAccountingData) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_accounting.call(this, accountingDataType, accountingData)
    end

  end

  @[Extern]
  record ITSGAuthenticateUserSinkVtbl,
    query_interface : Proc(ITSGAuthenticateUserSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITSGAuthenticateUserSink*, UInt32),
    release : Proc(ITSGAuthenticateUserSink*, UInt32),
    on_user_authenticated : Proc(ITSGAuthenticateUserSink*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, LibC::UIntPtrT, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::HRESULT),
    on_user_authentication_failed : Proc(ITSGAuthenticateUserSink*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    reauthenticate_user : Proc(ITSGAuthenticateUserSink*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    disconnect_user : Proc(ITSGAuthenticateUserSink*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2c3e2e73-a782-47f9-8dfb-77ee1ed27a03")]
  record ITSGAuthenticateUserSink, lpVtbl : ITSGAuthenticateUserSinkVtbl* do
    GUID = LibC::GUID.new(0x2c3e2e73_u32, 0xa782_u16, 0x47f9_u16, StaticArray[0x8d_u8, 0xfb_u8, 0x77_u8, 0xee_u8, 0x1e_u8, 0xd2_u8, 0x7a_u8, 0x3_u8])
    def query_interface(this : ITSGAuthenticateUserSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITSGAuthenticateUserSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITSGAuthenticateUserSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_user_authenticated(this : ITSGAuthenticateUserSink*, userName : Win32cr::Foundation::BSTR, userDomain : Win32cr::Foundation::BSTR, context : LibC::UIntPtrT, userToken : Win32cr::Foundation::HANDLE_PTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_user_authenticated.call(this, userName, userDomain, context, userToken)
    end
    def on_user_authentication_failed(this : ITSGAuthenticateUserSink*, context : LibC::UIntPtrT, genericErrorCode : Win32cr::Foundation::HRESULT, specificErrorCode : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_user_authentication_failed.call(this, context, genericErrorCode, specificErrorCode)
    end
    def reauthenticate_user(this : ITSGAuthenticateUserSink*, context : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reauthenticate_user.call(this, context)
    end
    def disconnect_user(this : ITSGAuthenticateUserSink*, context : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_user.call(this, context)
    end

  end

  @[Extern]
  record ITSGAuthenticationEngineVtbl,
    query_interface : Proc(ITSGAuthenticationEngine*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITSGAuthenticationEngine*, UInt32),
    release : Proc(ITSGAuthenticationEngine*, UInt32),
    authenticate_user : Proc(ITSGAuthenticationEngine*, LibC::GUID, UInt8*, UInt32, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    cancel_authentication : Proc(ITSGAuthenticationEngine*, LibC::GUID, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9ee3e5bf-04ab-4691-998c-d7f622321a56")]
  record ITSGAuthenticationEngine, lpVtbl : ITSGAuthenticationEngineVtbl* do
    GUID = LibC::GUID.new(0x9ee3e5bf_u32, 0x4ab_u16, 0x4691_u16, StaticArray[0x99_u8, 0x8c_u8, 0xd7_u8, 0xf6_u8, 0x22_u8, 0x32_u8, 0x1a_u8, 0x56_u8])
    def query_interface(this : ITSGAuthenticationEngine*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITSGAuthenticationEngine*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITSGAuthenticationEngine*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def authenticate_user(this : ITSGAuthenticationEngine*, mainSessionId : LibC::GUID, cookieData : UInt8*, numCookieBytes : UInt32, context : LibC::UIntPtrT, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authenticate_user.call(this, mainSessionId, cookieData, numCookieBytes, context, pSink)
    end
    def cancel_authentication(this : ITSGAuthenticationEngine*, mainSessionId : LibC::GUID, context : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_authentication.call(this, mainSessionId, context)
    end

  end

  @[Extern]
  record IWTSSBPluginVtbl,
    query_interface : Proc(IWTSSBPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSSBPlugin*, UInt32),
    release : Proc(IWTSSBPlugin*, UInt32),
    initialize__ : Proc(IWTSSBPlugin*, UInt32*, Win32cr::Foundation::HRESULT),
    wtssbx_machine_change_notification : Proc(IWTSSBPlugin*, Win32cr::System::RemoteDesktop::WTSSBX_NOTIFICATION_TYPE, Int32, Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_INFO*, Win32cr::Foundation::HRESULT),
    wtssbx_session_change_notification : Proc(IWTSSBPlugin*, Win32cr::System::RemoteDesktop::WTSSBX_NOTIFICATION_TYPE, Int32, UInt32, Win32cr::System::RemoteDesktop::WTSSBX_SESSION_INFO*, Win32cr::Foundation::HRESULT),
    wtssbx_get_most_suitable_server : Proc(IWTSSBPlugin*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Int32*, Win32cr::Foundation::HRESULT),
    terminated : Proc(IWTSSBPlugin*, Win32cr::Foundation::HRESULT),
    wtssbx_get_user_external_session : Proc(IWTSSBPlugin*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::RemoteDesktop::WTSSBX_IP_ADDRESS*, UInt32*, Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_CONNECT_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dc44be78-b18d-4399-b210-641bf67a002c")]
  record IWTSSBPlugin, lpVtbl : IWTSSBPluginVtbl* do
    GUID = LibC::GUID.new(0xdc44be78_u32, 0xb18d_u16, 0x4399_u16, StaticArray[0xb2_u8, 0x10_u8, 0x64_u8, 0x1b_u8, 0xf6_u8, 0x7a_u8, 0x0_u8, 0x2c_u8])
    def query_interface(this : IWTSSBPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSSBPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSSBPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWTSSBPlugin*, plugin_capabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, plugin_capabilities)
    end
    def wtssbx_machine_change_notification(this : IWTSSBPlugin*, notification_type : Win32cr::System::RemoteDesktop::WTSSBX_NOTIFICATION_TYPE, machine_id : Int32, pMachineInfo : Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wtssbx_machine_change_notification.call(this, notification_type, machine_id, pMachineInfo)
    end
    def wtssbx_session_change_notification(this : IWTSSBPlugin*, notification_type : Win32cr::System::RemoteDesktop::WTSSBX_NOTIFICATION_TYPE, machine_id : Int32, num_of_sessions : UInt32, session_info : Win32cr::System::RemoteDesktop::WTSSBX_SESSION_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wtssbx_session_change_notification.call(this, notification_type, machine_id, num_of_sessions, session_info)
    end
    def wtssbx_get_most_suitable_server(this : IWTSSBPlugin*, user_name : Win32cr::Foundation::PWSTR, domain_name : Win32cr::Foundation::PWSTR, application_type : Win32cr::Foundation::PWSTR, farm_name : Win32cr::Foundation::PWSTR, pMachineId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wtssbx_get_most_suitable_server.call(this, user_name, domain_name, application_type, farm_name, pMachineId)
    end
    def terminated(this : IWTSSBPlugin*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminated.call(this)
    end
    def wtssbx_get_user_external_session(this : IWTSSBPlugin*, user_name : Win32cr::Foundation::PWSTR, domain_name : Win32cr::Foundation::PWSTR, application_type : Win32cr::Foundation::PWSTR, redirector_internal_ip : Win32cr::System::RemoteDesktop::WTSSBX_IP_ADDRESS*, pSessionId : UInt32*, pMachineConnectInfo : Win32cr::System::RemoteDesktop::WTSSBX_MACHINE_CONNECT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wtssbx_get_user_external_session.call(this, user_name, domain_name, application_type, redirector_internal_ip, pSessionId, pMachineConnectInfo)
    end

  end

  @[Extern]
  record IWorkspaceClientExtVtbl,
    query_interface : Proc(IWorkspaceClientExt*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceClientExt*, UInt32),
    release : Proc(IWorkspaceClientExt*, UInt32),
    get_resource_id : Proc(IWorkspaceClientExt*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_resource_display_name : Proc(IWorkspaceClientExt*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    issue_disconnect : Proc(IWorkspaceClientExt*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("12b952f4-41ca-4f21-a829-a6d07d9a16e5")]
  record IWorkspaceClientExt, lpVtbl : IWorkspaceClientExtVtbl* do
    GUID = LibC::GUID.new(0x12b952f4_u32, 0x41ca_u16, 0x4f21_u16, StaticArray[0xa8_u8, 0x29_u8, 0xa6_u8, 0xd0_u8, 0x7d_u8, 0x9a_u8, 0x16_u8, 0xe5_u8])
    def query_interface(this : IWorkspaceClientExt*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceClientExt*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceClientExt*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_resource_id(this : IWorkspaceClientExt*, bstrWorkspaceId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_id.call(this, bstrWorkspaceId)
    end
    def get_resource_display_name(this : IWorkspaceClientExt*, bstrWorkspaceDisplayName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_display_name.call(this, bstrWorkspaceDisplayName)
    end
    def issue_disconnect(this : IWorkspaceClientExt*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.issue_disconnect.call(this)
    end

  end

  @[Extern]
  record IWorkspaceVtbl,
    query_interface : Proc(IWorkspace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspace*, UInt32),
    release : Proc(IWorkspace*, UInt32),
    get_workspace_names : Proc(IWorkspace*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    start_remote_application : Proc(IWorkspace*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_process_id : Proc(IWorkspace*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b922bbb8-4c55-4fea-8496-beb0b44285e5")]
  record IWorkspace, lpVtbl : IWorkspaceVtbl* do
    GUID = LibC::GUID.new(0xb922bbb8_u32, 0x4c55_u16, 0x4fea_u16, StaticArray[0x84_u8, 0x96_u8, 0xbe_u8, 0xb0_u8, 0xb4_u8, 0x42_u8, 0x85_u8, 0xe5_u8])
    def query_interface(this : IWorkspace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_workspace_names(this : IWorkspace*, psaWkspNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_workspace_names.call(this, psaWkspNames)
    end
    def start_remote_application(this : IWorkspace*, bstrWorkspaceId : Win32cr::Foundation::BSTR, psaParams : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_remote_application.call(this, bstrWorkspaceId, psaParams)
    end
    def get_process_id(this : IWorkspace*, pulProcessId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_process_id.call(this, pulProcessId)
    end

  end

  @[Extern]
  record IWorkspace2Vtbl,
    query_interface : Proc(IWorkspace2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspace2*, UInt32),
    release : Proc(IWorkspace2*, UInt32),
    get_workspace_names : Proc(IWorkspace2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    start_remote_application : Proc(IWorkspace2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_process_id : Proc(IWorkspace2*, UInt32*, Win32cr::Foundation::HRESULT),
    start_remote_application_ex : Proc(IWorkspace2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("96d8d7cf-783e-4286-834c-ebc0e95f783c")]
  record IWorkspace2, lpVtbl : IWorkspace2Vtbl* do
    GUID = LibC::GUID.new(0x96d8d7cf_u32, 0x783e_u16, 0x4286_u16, StaticArray[0x83_u8, 0x4c_u8, 0xeb_u8, 0xc0_u8, 0xe9_u8, 0x5f_u8, 0x78_u8, 0x3c_u8])
    def query_interface(this : IWorkspace2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspace2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspace2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_workspace_names(this : IWorkspace2*, psaWkspNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_workspace_names.call(this, psaWkspNames)
    end
    def start_remote_application(this : IWorkspace2*, bstrWorkspaceId : Win32cr::Foundation::BSTR, psaParams : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_remote_application.call(this, bstrWorkspaceId, psaParams)
    end
    def get_process_id(this : IWorkspace2*, pulProcessId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_process_id.call(this, pulProcessId)
    end
    def start_remote_application_ex(this : IWorkspace2*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrRequestingAppId : Win32cr::Foundation::BSTR, bstrRequestingAppFamilyName : Win32cr::Foundation::BSTR, bLaunchIntoImmersiveClient : Int16, bstrImmersiveClientActivationContext : Win32cr::Foundation::BSTR, psaParams : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_remote_application_ex.call(this, bstrWorkspaceId, bstrRequestingAppId, bstrRequestingAppFamilyName, bLaunchIntoImmersiveClient, bstrImmersiveClientActivationContext, psaParams)
    end

  end

  @[Extern]
  record IWorkspace3Vtbl,
    query_interface : Proc(IWorkspace3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspace3*, UInt32),
    release : Proc(IWorkspace3*, UInt32),
    get_workspace_names : Proc(IWorkspace3*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    start_remote_application : Proc(IWorkspace3*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_process_id : Proc(IWorkspace3*, UInt32*, Win32cr::Foundation::HRESULT),
    start_remote_application_ex : Proc(IWorkspace3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_claims_token2 : Proc(IWorkspace3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, UInt32, Win32cr::Foundation::RECT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_claims_token : Proc(IWorkspace3*, Win32cr::Foundation::BSTR, UInt64, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1becbe4a-d654-423b-afeb-be8d532c13c6")]
  record IWorkspace3, lpVtbl : IWorkspace3Vtbl* do
    GUID = LibC::GUID.new(0x1becbe4a_u32, 0xd654_u16, 0x423b_u16, StaticArray[0xaf_u8, 0xeb_u8, 0xbe_u8, 0x8d_u8, 0x53_u8, 0x2c_u8, 0x13_u8, 0xc6_u8])
    def query_interface(this : IWorkspace3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspace3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspace3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_workspace_names(this : IWorkspace3*, psaWkspNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_workspace_names.call(this, psaWkspNames)
    end
    def start_remote_application(this : IWorkspace3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, psaParams : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_remote_application.call(this, bstrWorkspaceId, psaParams)
    end
    def get_process_id(this : IWorkspace3*, pulProcessId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_process_id.call(this, pulProcessId)
    end
    def start_remote_application_ex(this : IWorkspace3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrRequestingAppId : Win32cr::Foundation::BSTR, bstrRequestingAppFamilyName : Win32cr::Foundation::BSTR, bLaunchIntoImmersiveClient : Int16, bstrImmersiveClientActivationContext : Win32cr::Foundation::BSTR, psaParams : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_remote_application_ex.call(this, bstrWorkspaceId, bstrRequestingAppId, bstrRequestingAppFamilyName, bLaunchIntoImmersiveClient, bstrImmersiveClientActivationContext, psaParams)
    end
    def get_claims_token2(this : IWorkspace3*, bstrClaimsHint : Win32cr::Foundation::BSTR, bstrUserHint : Win32cr::Foundation::BSTR, claimCookie : UInt32, hwndCredUiParent : UInt32, rectCredUiParent : Win32cr::Foundation::RECT, pbstrAccessToken : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_claims_token2.call(this, bstrClaimsHint, bstrUserHint, claimCookie, hwndCredUiParent, rectCredUiParent, pbstrAccessToken)
    end
    def set_claims_token(this : IWorkspace3*, bstrAccessToken : Win32cr::Foundation::BSTR, ullAccessTokenExpiration : UInt64, bstrRefreshToken : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_claims_token.call(this, bstrAccessToken, ullAccessTokenExpiration, bstrRefreshToken)
    end

  end

  @[Extern]
  record IWorkspaceRegistrationVtbl,
    query_interface : Proc(IWorkspaceRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceRegistration*, UInt32),
    release : Proc(IWorkspaceRegistration*, UInt32),
    add_resource : Proc(IWorkspaceRegistration*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_resource : Proc(IWorkspaceRegistration*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b922bbb8-4c55-4fea-8496-beb0b44285e6")]
  record IWorkspaceRegistration, lpVtbl : IWorkspaceRegistrationVtbl* do
    GUID = LibC::GUID.new(0xb922bbb8_u32, 0x4c55_u16, 0x4fea_u16, StaticArray[0x84_u8, 0x96_u8, 0xbe_u8, 0xb0_u8, 0xb4_u8, 0x42_u8, 0x85_u8, 0xe6_u8])
    def query_interface(this : IWorkspaceRegistration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceRegistration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceRegistration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_resource(this : IWorkspaceRegistration*, pUnk : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource.call(this, pUnk, pdwCookie)
    end
    def remove_resource(this : IWorkspaceRegistration*, dwCookieConnection : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_resource.call(this, dwCookieConnection)
    end

  end

  @[Extern]
  record IWorkspaceRegistration2Vtbl,
    query_interface : Proc(IWorkspaceRegistration2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceRegistration2*, UInt32),
    release : Proc(IWorkspaceRegistration2*, UInt32),
    add_resource : Proc(IWorkspaceRegistration2*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_resource : Proc(IWorkspaceRegistration2*, UInt32, Win32cr::Foundation::HRESULT),
    add_resource_ex : Proc(IWorkspaceRegistration2*, Void*, Win32cr::Foundation::BSTR, UInt32*, LibC::GUID, Win32cr::Foundation::HRESULT),
    remove_resource_ex : Proc(IWorkspaceRegistration2*, UInt32, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cf59f654-39bb-44d8-94d0-4635728957e9")]
  record IWorkspaceRegistration2, lpVtbl : IWorkspaceRegistration2Vtbl* do
    GUID = LibC::GUID.new(0xcf59f654_u32, 0x39bb_u16, 0x44d8_u16, StaticArray[0x94_u8, 0xd0_u8, 0x46_u8, 0x35_u8, 0x72_u8, 0x89_u8, 0x57_u8, 0xe9_u8])
    def query_interface(this : IWorkspaceRegistration2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceRegistration2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceRegistration2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_resource(this : IWorkspaceRegistration2*, pUnk : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource.call(this, pUnk, pdwCookie)
    end
    def remove_resource(this : IWorkspaceRegistration2*, dwCookieConnection : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_resource.call(this, dwCookieConnection)
    end
    def add_resource_ex(this : IWorkspaceRegistration2*, pUnk : Void*, bstrEventLogUploadAddress : Win32cr::Foundation::BSTR, pdwCookie : UInt32*, correlationId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource_ex.call(this, pUnk, bstrEventLogUploadAddress, pdwCookie, correlationId)
    end
    def remove_resource_ex(this : IWorkspaceRegistration2*, dwCookieConnection : UInt32, correlationId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_resource_ex.call(this, dwCookieConnection, correlationId)
    end

  end

  @[Extern]
  record IWorkspaceScriptableVtbl,
    query_interface : Proc(IWorkspaceScriptable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceScriptable*, UInt32),
    release : Proc(IWorkspaceScriptable*, UInt32),
    get_type_info_count : Proc(IWorkspaceScriptable*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWorkspaceScriptable*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWorkspaceScriptable*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWorkspaceScriptable*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    disconnect_workspace : Proc(IWorkspaceScriptable*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_workspace : Proc(IWorkspaceScriptable*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::HRESULT),
    is_workspace_credential_specified : Proc(IWorkspaceScriptable*, Win32cr::Foundation::BSTR, Int16, Int16*, Win32cr::Foundation::HRESULT),
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable*, Int16*, Win32cr::Foundation::HRESULT),
    clear_workspace_credential : Proc(IWorkspaceScriptable*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_authenticated : Proc(IWorkspaceScriptable*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("efea49a2-dda5-429d-8f42-b23b92c4c347")]
  record IWorkspaceScriptable, lpVtbl : IWorkspaceScriptableVtbl* do
    GUID = LibC::GUID.new(0xefea49a2_u32, 0xdda5_u16, 0x429d_u16, StaticArray[0x8f_u8, 0x42_u8, 0xb2_u8, 0x3b_u8, 0x92_u8, 0xc4_u8, 0xc3_u8, 0x47_u8])
    def query_interface(this : IWorkspaceScriptable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceScriptable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceScriptable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWorkspaceScriptable*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWorkspaceScriptable*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWorkspaceScriptable*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWorkspaceScriptable*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def disconnect_workspace(this : IWorkspaceScriptable*, bstrWorkspaceId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_workspace.call(this, bstrWorkspaceId)
    end
    def start_workspace(this : IWorkspaceScriptable*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrWorkspaceParams : Win32cr::Foundation::BSTR, lTimeout : Int32, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_workspace.call(this, bstrWorkspaceId, bstrUserName, bstrPassword, bstrWorkspaceParams, lTimeout, lFlags)
    end
    def is_workspace_credential_specified(this : IWorkspaceScriptable*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bCountUnauthenticatedCredentials : Int16, pbCredExist : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_workspace_credential_specified.call(this, bstrWorkspaceId, bCountUnauthenticatedCredentials, pbCredExist)
    end
    def is_workspace_sso_enabled(this : IWorkspaceScriptable*, pbSSOEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_workspace_sso_enabled.call(this, pbSSOEnabled)
    end
    def clear_workspace_credential(this : IWorkspaceScriptable*, bstrWorkspaceId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_workspace_credential.call(this, bstrWorkspaceId)
    end
    def on_authenticated(this : IWorkspaceScriptable*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_authenticated.call(this, bstrWorkspaceId, bstrUserName)
    end
    def disconnect_workspace_by_friendly_name(this : IWorkspaceScriptable*, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_workspace_by_friendly_name.call(this, bstrWorkspaceFriendlyName)
    end

  end

  @[Extern]
  record IWorkspaceScriptable2Vtbl,
    query_interface : Proc(IWorkspaceScriptable2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceScriptable2*, UInt32),
    release : Proc(IWorkspaceScriptable2*, UInt32),
    get_type_info_count : Proc(IWorkspaceScriptable2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWorkspaceScriptable2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWorkspaceScriptable2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWorkspaceScriptable2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    disconnect_workspace : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_workspace : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::HRESULT),
    is_workspace_credential_specified : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Int16, Int16*, Win32cr::Foundation::HRESULT),
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable2*, Int16*, Win32cr::Foundation::HRESULT),
    clear_workspace_credential : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_authenticated : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_workspace_ex : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::HRESULT),
    resource_dismissed : Proc(IWorkspaceScriptable2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("efea49a2-dda5-429d-8f42-b33ba2c4c348")]
  record IWorkspaceScriptable2, lpVtbl : IWorkspaceScriptable2Vtbl* do
    GUID = LibC::GUID.new(0xefea49a2_u32, 0xdda5_u16, 0x429d_u16, StaticArray[0x8f_u8, 0x42_u8, 0xb3_u8, 0x3b_u8, 0xa2_u8, 0xc4_u8, 0xc3_u8, 0x48_u8])
    def query_interface(this : IWorkspaceScriptable2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceScriptable2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceScriptable2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWorkspaceScriptable2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWorkspaceScriptable2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWorkspaceScriptable2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWorkspaceScriptable2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def disconnect_workspace(this : IWorkspaceScriptable2*, bstrWorkspaceId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_workspace.call(this, bstrWorkspaceId)
    end
    def start_workspace(this : IWorkspaceScriptable2*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrWorkspaceParams : Win32cr::Foundation::BSTR, lTimeout : Int32, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_workspace.call(this, bstrWorkspaceId, bstrUserName, bstrPassword, bstrWorkspaceParams, lTimeout, lFlags)
    end
    def is_workspace_credential_specified(this : IWorkspaceScriptable2*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bCountUnauthenticatedCredentials : Int16, pbCredExist : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_workspace_credential_specified.call(this, bstrWorkspaceId, bCountUnauthenticatedCredentials, pbCredExist)
    end
    def is_workspace_sso_enabled(this : IWorkspaceScriptable2*, pbSSOEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_workspace_sso_enabled.call(this, pbSSOEnabled)
    end
    def clear_workspace_credential(this : IWorkspaceScriptable2*, bstrWorkspaceId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_workspace_credential.call(this, bstrWorkspaceId)
    end
    def on_authenticated(this : IWorkspaceScriptable2*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_authenticated.call(this, bstrWorkspaceId, bstrUserName)
    end
    def disconnect_workspace_by_friendly_name(this : IWorkspaceScriptable2*, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_workspace_by_friendly_name.call(this, bstrWorkspaceFriendlyName)
    end
    def start_workspace_ex(this : IWorkspaceScriptable2*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR, bstrRedirectorName : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrAppContainer : Win32cr::Foundation::BSTR, bstrWorkspaceParams : Win32cr::Foundation::BSTR, lTimeout : Int32, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_workspace_ex.call(this, bstrWorkspaceId, bstrWorkspaceFriendlyName, bstrRedirectorName, bstrUserName, bstrPassword, bstrAppContainer, bstrWorkspaceParams, lTimeout, lFlags)
    end
    def resource_dismissed(this : IWorkspaceScriptable2*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resource_dismissed.call(this, bstrWorkspaceId, bstrWorkspaceFriendlyName)
    end

  end

  @[Extern]
  record IWorkspaceScriptable3Vtbl,
    query_interface : Proc(IWorkspaceScriptable3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceScriptable3*, UInt32),
    release : Proc(IWorkspaceScriptable3*, UInt32),
    get_type_info_count : Proc(IWorkspaceScriptable3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWorkspaceScriptable3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWorkspaceScriptable3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWorkspaceScriptable3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    disconnect_workspace : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_workspace : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::HRESULT),
    is_workspace_credential_specified : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Int16, Int16*, Win32cr::Foundation::HRESULT),
    is_workspace_sso_enabled : Proc(IWorkspaceScriptable3*, Int16*, Win32cr::Foundation::HRESULT),
    clear_workspace_credential : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_authenticated : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    disconnect_workspace_by_friendly_name : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_workspace_ex : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::HRESULT),
    resource_dismissed : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_workspace_ex2 : Proc(IWorkspaceScriptable3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::BSTR, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("531e6512-2cbf-4bd2-80a5-d90a71636a9a")]
  record IWorkspaceScriptable3, lpVtbl : IWorkspaceScriptable3Vtbl* do
    GUID = LibC::GUID.new(0x531e6512_u32, 0x2cbf_u16, 0x4bd2_u16, StaticArray[0x80_u8, 0xa5_u8, 0xd9_u8, 0xa_u8, 0x71_u8, 0x63_u8, 0x6a_u8, 0x9a_u8])
    def query_interface(this : IWorkspaceScriptable3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceScriptable3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceScriptable3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWorkspaceScriptable3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWorkspaceScriptable3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWorkspaceScriptable3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWorkspaceScriptable3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def disconnect_workspace(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_workspace.call(this, bstrWorkspaceId)
    end
    def start_workspace(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrWorkspaceParams : Win32cr::Foundation::BSTR, lTimeout : Int32, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_workspace.call(this, bstrWorkspaceId, bstrUserName, bstrPassword, bstrWorkspaceParams, lTimeout, lFlags)
    end
    def is_workspace_credential_specified(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bCountUnauthenticatedCredentials : Int16, pbCredExist : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_workspace_credential_specified.call(this, bstrWorkspaceId, bCountUnauthenticatedCredentials, pbCredExist)
    end
    def is_workspace_sso_enabled(this : IWorkspaceScriptable3*, pbSSOEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_workspace_sso_enabled.call(this, pbSSOEnabled)
    end
    def clear_workspace_credential(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_workspace_credential.call(this, bstrWorkspaceId)
    end
    def on_authenticated(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_authenticated.call(this, bstrWorkspaceId, bstrUserName)
    end
    def disconnect_workspace_by_friendly_name(this : IWorkspaceScriptable3*, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_workspace_by_friendly_name.call(this, bstrWorkspaceFriendlyName)
    end
    def start_workspace_ex(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR, bstrRedirectorName : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrAppContainer : Win32cr::Foundation::BSTR, bstrWorkspaceParams : Win32cr::Foundation::BSTR, lTimeout : Int32, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_workspace_ex.call(this, bstrWorkspaceId, bstrWorkspaceFriendlyName, bstrRedirectorName, bstrUserName, bstrPassword, bstrAppContainer, bstrWorkspaceParams, lTimeout, lFlags)
    end
    def resource_dismissed(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resource_dismissed.call(this, bstrWorkspaceId, bstrWorkspaceFriendlyName)
    end
    def start_workspace_ex2(this : IWorkspaceScriptable3*, bstrWorkspaceId : Win32cr::Foundation::BSTR, bstrWorkspaceFriendlyName : Win32cr::Foundation::BSTR, bstrRedirectorName : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrAppContainer : Win32cr::Foundation::BSTR, bstrWorkspaceParams : Win32cr::Foundation::BSTR, lTimeout : Int32, lFlags : Int32, bstrEventLogUploadAddress : Win32cr::Foundation::BSTR, correlationId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_workspace_ex2.call(this, bstrWorkspaceId, bstrWorkspaceFriendlyName, bstrRedirectorName, bstrUserName, bstrPassword, bstrAppContainer, bstrWorkspaceParams, lTimeout, lFlags, bstrEventLogUploadAddress, correlationId)
    end

  end

  @[Extern]
  record IWorkspaceReportMessageVtbl,
    query_interface : Proc(IWorkspaceReportMessage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceReportMessage*, UInt32),
    release : Proc(IWorkspaceReportMessage*, UInt32),
    register_error_log_message : Proc(IWorkspaceReportMessage*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    is_error_message_registered : Proc(IWorkspaceReportMessage*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::BSTR, UInt32, Int16*, Win32cr::Foundation::HRESULT),
    register_error_event : Proc(IWorkspaceReportMessage*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a7c06739-500f-4e8c-99a8-2bd6955899eb")]
  record IWorkspaceReportMessage, lpVtbl : IWorkspaceReportMessageVtbl* do
    GUID = LibC::GUID.new(0xa7c06739_u32, 0x500f_u16, 0x4e8c_u16, StaticArray[0x99_u8, 0xa8_u8, 0x2b_u8, 0xd6_u8, 0x95_u8, 0x58_u8, 0x99_u8, 0xeb_u8])
    def query_interface(this : IWorkspaceReportMessage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceReportMessage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceReportMessage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_error_log_message(this : IWorkspaceReportMessage*, bstrMessage : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_error_log_message.call(this, bstrMessage)
    end
    def is_error_message_registered(this : IWorkspaceReportMessage*, bstrWkspId : Win32cr::Foundation::BSTR, dwErrorType : UInt32, bstrErrorMessageType : Win32cr::Foundation::BSTR, dwErrorCode : UInt32, pfErrorExist : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_error_message_registered.call(this, bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode, pfErrorExist)
    end
    def register_error_event(this : IWorkspaceReportMessage*, bstrWkspId : Win32cr::Foundation::BSTR, dwErrorType : UInt32, bstrErrorMessageType : Win32cr::Foundation::BSTR, dwErrorCode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_error_event.call(this, bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode)
    end

  end

  @[Extern]
  record ITSWkspEventsVtbl,
    query_interface : Proc(ITSWkspEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITSWkspEvents*, UInt32),
    release : Proc(ITSWkspEvents*, UInt32),
    get_type_info_count : Proc(ITSWkspEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITSWkspEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITSWkspEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITSWkspEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b922bbb8-4c55-4fea-8496-beb0b44285e9")]
  record ITSWkspEvents, lpVtbl : ITSWkspEventsVtbl* do
    GUID = LibC::GUID.new(0xb922bbb8_u32, 0x4c55_u16, 0x4fea_u16, StaticArray[0x84_u8, 0x96_u8, 0xbe_u8, 0xb0_u8, 0xb4_u8, 0x42_u8, 0x85_u8, 0xe9_u8])
    def query_interface(this : ITSWkspEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITSWkspEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITSWkspEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITSWkspEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITSWkspEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITSWkspEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITSWkspEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ITsSbPluginVtbl,
    query_interface : Proc(ITsSbPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbPlugin*, UInt32),
    release : Proc(ITsSbPlugin*, UInt32),
    initialize__ : Proc(ITsSbPlugin*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITsSbPlugin*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("48cd7406-caab-465f-a5d6-baa863b9ea4f")]
  record ITsSbPlugin, lpVtbl : ITsSbPluginVtbl* do
    GUID = LibC::GUID.new(0x48cd7406_u32, 0xcaab_u16, 0x465f_u16, StaticArray[0xa5_u8, 0xd6_u8, 0xba_u8, 0xa8_u8, 0x63_u8, 0xb9_u8, 0xea_u8, 0x4f_u8])
    def query_interface(this : ITsSbPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITsSbPlugin*, pProvider : Void*, pNotifySink : Void*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProvider, pNotifySink, pPropertySet)
    end
    def terminate(this : ITsSbPlugin*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr)
    end

  end

  @[Extern]
  record ITsSbResourcePluginVtbl,
    query_interface : Proc(ITsSbResourcePlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbResourcePlugin*, UInt32),
    release : Proc(ITsSbResourcePlugin*, UInt32),
    initialize__ : Proc(ITsSbResourcePlugin*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITsSbResourcePlugin*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea8db42c-98ed-4535-a88b-2a164f35490f")]
  record ITsSbResourcePlugin, lpVtbl : ITsSbResourcePluginVtbl* do
    GUID = LibC::GUID.new(0xea8db42c_u32, 0x98ed_u16, 0x4535_u16, StaticArray[0xa8_u8, 0x8b_u8, 0x2a_u8, 0x16_u8, 0x4f_u8, 0x35_u8, 0x49_u8, 0xf_u8])
    def query_interface(this : ITsSbResourcePlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbResourcePlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbResourcePlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITsSbResourcePlugin*, pProvider : Void*, pNotifySink : Void*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProvider, pNotifySink, pPropertySet)
    end
    def terminate(this : ITsSbResourcePlugin*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr)
    end

  end

  @[Extern]
  record ITsSbServiceNotificationVtbl,
    query_interface : Proc(ITsSbServiceNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbServiceNotification*, UInt32),
    release : Proc(ITsSbServiceNotification*, UInt32),
    notify_service_failure : Proc(ITsSbServiceNotification*, Win32cr::Foundation::HRESULT),
    notify_service_success : Proc(ITsSbServiceNotification*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("86cb68ae-86e0-4f57-8a64-bb7406bc5550")]
  record ITsSbServiceNotification, lpVtbl : ITsSbServiceNotificationVtbl* do
    GUID = LibC::GUID.new(0x86cb68ae_u32, 0x86e0_u16, 0x4f57_u16, StaticArray[0x8a_u8, 0x64_u8, 0xbb_u8, 0x74_u8, 0x6_u8, 0xbc_u8, 0x55_u8, 0x50_u8])
    def query_interface(this : ITsSbServiceNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbServiceNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbServiceNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify_service_failure(this : ITsSbServiceNotification*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_service_failure.call(this)
    end
    def notify_service_success(this : ITsSbServiceNotification*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_service_success.call(this)
    end

  end

  @[Extern]
  record ITsSbLoadBalancingVtbl,
    query_interface : Proc(ITsSbLoadBalancing*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbLoadBalancing*, UInt32),
    release : Proc(ITsSbLoadBalancing*, UInt32),
    initialize__ : Proc(ITsSbLoadBalancing*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITsSbLoadBalancing*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    get_most_suitable_target : Proc(ITsSbLoadBalancing*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("24329274-9eb7-11dc-ae98-f2b456d89593")]
  record ITsSbLoadBalancing, lpVtbl : ITsSbLoadBalancingVtbl* do
    GUID = LibC::GUID.new(0x24329274_u32, 0x9eb7_u16, 0x11dc_u16, StaticArray[0xae_u8, 0x98_u8, 0xf2_u8, 0xb4_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
    def query_interface(this : ITsSbLoadBalancing*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbLoadBalancing*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbLoadBalancing*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITsSbLoadBalancing*, pProvider : Void*, pNotifySink : Void*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProvider, pNotifySink, pPropertySet)
    end
    def terminate(this : ITsSbLoadBalancing*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr)
    end
    def get_most_suitable_target(this : ITsSbLoadBalancing*, pConnection : Void*, pLBSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_most_suitable_target.call(this, pConnection, pLBSink)
    end

  end

  @[Extern]
  record ITsSbPlacementVtbl,
    query_interface : Proc(ITsSbPlacement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbPlacement*, UInt32),
    release : Proc(ITsSbPlacement*, UInt32),
    initialize__ : Proc(ITsSbPlacement*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITsSbPlacement*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    query_environment_for_target : Proc(ITsSbPlacement*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("daadee5f-6d32-480e-9e36-ddab2329f06d")]
  record ITsSbPlacement, lpVtbl : ITsSbPlacementVtbl* do
    GUID = LibC::GUID.new(0xdaadee5f_u32, 0x6d32_u16, 0x480e_u16, StaticArray[0x9e_u8, 0x36_u8, 0xdd_u8, 0xab_u8, 0x23_u8, 0x29_u8, 0xf0_u8, 0x6d_u8])
    def query_interface(this : ITsSbPlacement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbPlacement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbPlacement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITsSbPlacement*, pProvider : Void*, pNotifySink : Void*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProvider, pNotifySink, pPropertySet)
    end
    def terminate(this : ITsSbPlacement*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr)
    end
    def query_environment_for_target(this : ITsSbPlacement*, pConnection : Void*, pPlacementSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_environment_for_target.call(this, pConnection, pPlacementSink)
    end

  end

  @[Extern]
  record ITsSbOrchestrationVtbl,
    query_interface : Proc(ITsSbOrchestration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbOrchestration*, UInt32),
    release : Proc(ITsSbOrchestration*, UInt32),
    initialize__ : Proc(ITsSbOrchestration*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITsSbOrchestration*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    prepare_target_for_connect : Proc(ITsSbOrchestration*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("64fc1172-9eb7-11dc-8b00-3aba56d89593")]
  record ITsSbOrchestration, lpVtbl : ITsSbOrchestrationVtbl* do
    GUID = LibC::GUID.new(0x64fc1172_u32, 0x9eb7_u16, 0x11dc_u16, StaticArray[0x8b_u8, 0x0_u8, 0x3a_u8, 0xba_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
    def query_interface(this : ITsSbOrchestration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbOrchestration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbOrchestration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITsSbOrchestration*, pProvider : Void*, pNotifySink : Void*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProvider, pNotifySink, pPropertySet)
    end
    def terminate(this : ITsSbOrchestration*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr)
    end
    def prepare_target_for_connect(this : ITsSbOrchestration*, pConnection : Void*, pOrchestrationNotifySink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_target_for_connect.call(this, pConnection, pOrchestrationNotifySink)
    end

  end

  @[Extern]
  record ITsSbEnvironmentVtbl,
    query_interface : Proc(ITsSbEnvironment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbEnvironment*, UInt32),
    release : Proc(ITsSbEnvironment*, UInt32),
    get_Name : Proc(ITsSbEnvironment*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ServerWeight : Proc(ITsSbEnvironment*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EnvironmentPropertySet : Proc(ITsSbEnvironment*, Void**, Win32cr::Foundation::HRESULT),
    put_EnvironmentPropertySet : Proc(ITsSbEnvironment*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8c87f7f7-bf51-4a5c-87bf-8e94fb6e2256")]
  record ITsSbEnvironment, lpVtbl : ITsSbEnvironmentVtbl* do
    GUID = LibC::GUID.new(0x8c87f7f7_u32, 0xbf51_u16, 0x4a5c_u16, StaticArray[0x87_u8, 0xbf_u8, 0x8e_u8, 0x94_u8, 0xfb_u8, 0x6e_u8, 0x22_u8, 0x56_u8])
    def query_interface(this : ITsSbEnvironment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbEnvironment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbEnvironment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Name(this : ITsSbEnvironment*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pVal)
    end
    def get_ServerWeight(this : ITsSbEnvironment*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerWeight.call(this, pVal)
    end
    def get_EnvironmentPropertySet(this : ITsSbEnvironment*, ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnvironmentPropertySet.call(this, ppPropertySet)
    end
    def put_EnvironmentPropertySet(this : ITsSbEnvironment*, pVal : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnvironmentPropertySet.call(this, pVal)
    end

  end

  @[Extern]
  record ITsSbLoadBalanceResultVtbl,
    query_interface : Proc(ITsSbLoadBalanceResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbLoadBalanceResult*, UInt32),
    release : Proc(ITsSbLoadBalanceResult*, UInt32),
    get_TargetName : Proc(ITsSbLoadBalanceResult*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("24fdb7ac-fea6-11dc-9672-9a8956d89593")]
  record ITsSbLoadBalanceResult, lpVtbl : ITsSbLoadBalanceResultVtbl* do
    GUID = LibC::GUID.new(0x24fdb7ac_u32, 0xfea6_u16, 0x11dc_u16, StaticArray[0x96_u8, 0x72_u8, 0x9a_u8, 0x89_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
    def query_interface(this : ITsSbLoadBalanceResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbLoadBalanceResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbLoadBalanceResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_TargetName(this : ITsSbLoadBalanceResult*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetName.call(this, pVal)
    end

  end

  @[Extern]
  record ITsSbTargetVtbl,
    query_interface : Proc(ITsSbTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbTarget*, UInt32),
    release : Proc(ITsSbTarget*, UInt32),
    get_TargetName : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TargetName : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FarmName : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FarmName : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TargetFQDN : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TargetFQDN : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TargetNetbios : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TargetNetbios : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IpAddresses : Proc(ITsSbTarget*, Win32cr::System::RemoteDesktop::TSSD_ConnectionPoint*, UInt32*, Win32cr::Foundation::HRESULT),
    put_IpAddresses : Proc(ITsSbTarget*, Win32cr::System::RemoteDesktop::TSSD_ConnectionPoint*, UInt32, Win32cr::Foundation::HRESULT),
    get_TargetState : Proc(ITsSbTarget*, Win32cr::System::RemoteDesktop::TARGET_STATE*, Win32cr::Foundation::HRESULT),
    put_TargetState : Proc(ITsSbTarget*, Win32cr::System::RemoteDesktop::TARGET_STATE, Win32cr::Foundation::HRESULT),
    get_TargetPropertySet : Proc(ITsSbTarget*, Void**, Win32cr::Foundation::HRESULT),
    put_TargetPropertySet : Proc(ITsSbTarget*, Void*, Win32cr::Foundation::HRESULT),
    get_EnvironmentName : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EnvironmentName : Proc(ITsSbTarget*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_NumSessions : Proc(ITsSbTarget*, UInt32*, Win32cr::Foundation::HRESULT),
    get_NumPendingConnections : Proc(ITsSbTarget*, UInt32*, Win32cr::Foundation::HRESULT),
    get_TargetLoad : Proc(ITsSbTarget*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("16616ecc-272d-411d-b324-126893033856")]
  record ITsSbTarget, lpVtbl : ITsSbTargetVtbl* do
    GUID = LibC::GUID.new(0x16616ecc_u32, 0x272d_u16, 0x411d_u16, StaticArray[0xb3_u8, 0x24_u8, 0x12_u8, 0x68_u8, 0x93_u8, 0x3_u8, 0x38_u8, 0x56_u8])
    def query_interface(this : ITsSbTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_TargetName(this : ITsSbTarget*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetName.call(this, pVal)
    end
    def put_TargetName(this : ITsSbTarget*, val : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TargetName.call(this, val)
    end
    def get_FarmName(this : ITsSbTarget*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FarmName.call(this, pVal)
    end
    def put_FarmName(this : ITsSbTarget*, val : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FarmName.call(this, val)
    end
    def get_TargetFQDN(this : ITsSbTarget*, target_fqdn_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetFQDN.call(this, target_fqdn_name)
    end
    def put_TargetFQDN(this : ITsSbTarget*, val : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TargetFQDN.call(this, val)
    end
    def get_TargetNetbios(this : ITsSbTarget*, target_netbios_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetNetbios.call(this, target_netbios_name)
    end
    def put_TargetNetbios(this : ITsSbTarget*, val : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TargetNetbios.call(this, val)
    end
    def get_IpAddresses(this : ITsSbTarget*, sockaddr : Win32cr::System::RemoteDesktop::TSSD_ConnectionPoint*, numAddresses : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpAddresses.call(this, sockaddr, numAddresses)
    end
    def put_IpAddresses(this : ITsSbTarget*, sockaddr : Win32cr::System::RemoteDesktop::TSSD_ConnectionPoint*, numAddresses : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IpAddresses.call(this, sockaddr, numAddresses)
    end
    def get_TargetState(this : ITsSbTarget*, pState : Win32cr::System::RemoteDesktop::TARGET_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetState.call(this, pState)
    end
    def put_TargetState(this : ITsSbTarget*, state : Win32cr::System::RemoteDesktop::TARGET_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TargetState.call(this, state)
    end
    def get_TargetPropertySet(this : ITsSbTarget*, ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetPropertySet.call(this, ppPropertySet)
    end
    def put_TargetPropertySet(this : ITsSbTarget*, pVal : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TargetPropertySet.call(this, pVal)
    end
    def get_EnvironmentName(this : ITsSbTarget*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnvironmentName.call(this, pVal)
    end
    def put_EnvironmentName(this : ITsSbTarget*, val : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnvironmentName.call(this, val)
    end
    def get_NumSessions(this : ITsSbTarget*, pNumSessions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumSessions.call(this, pNumSessions)
    end
    def get_NumPendingConnections(this : ITsSbTarget*, pNumPendingConnections : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumPendingConnections.call(this, pNumPendingConnections)
    end
    def get_TargetLoad(this : ITsSbTarget*, pTargetLoad : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetLoad.call(this, pTargetLoad)
    end

  end

  @[Extern]
  record ITsSbSessionVtbl,
    query_interface : Proc(ITsSbSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbSession*, UInt32),
    release : Proc(ITsSbSession*, UInt32),
    get_SessionId : Proc(ITsSbSession*, UInt32*, Win32cr::Foundation::HRESULT),
    get_TargetName : Proc(ITsSbSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TargetName : Proc(ITsSbSession*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Username : Proc(ITsSbSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Domain : Proc(ITsSbSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_State : Proc(ITsSbSession*, Win32cr::System::RemoteDesktop::TSSESSION_STATE*, Win32cr::Foundation::HRESULT),
    put_State : Proc(ITsSbSession*, Win32cr::System::RemoteDesktop::TSSESSION_STATE, Win32cr::Foundation::HRESULT),
    get_CreateTime : Proc(ITsSbSession*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    put_CreateTime : Proc(ITsSbSession*, Win32cr::Foundation::FILETIME, Win32cr::Foundation::HRESULT),
    get_DisconnectTime : Proc(ITsSbSession*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    put_DisconnectTime : Proc(ITsSbSession*, Win32cr::Foundation::FILETIME, Win32cr::Foundation::HRESULT),
    get_InitialProgram : Proc(ITsSbSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_InitialProgram : Proc(ITsSbSession*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ClientDisplay : Proc(ITsSbSession*, Win32cr::System::RemoteDesktop::CLIENT_DISPLAY*, Win32cr::Foundation::HRESULT),
    put_ClientDisplay : Proc(ITsSbSession*, Win32cr::System::RemoteDesktop::CLIENT_DISPLAY, Win32cr::Foundation::HRESULT),
    get_ProtocolType : Proc(ITsSbSession*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ProtocolType : Proc(ITsSbSession*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d453aac7-b1d8-4c5e-ba34-9afb4c8c5510")]
  record ITsSbSession, lpVtbl : ITsSbSessionVtbl* do
    GUID = LibC::GUID.new(0xd453aac7_u32, 0xb1d8_u16, 0x4c5e_u16, StaticArray[0xba_u8, 0x34_u8, 0x9a_u8, 0xfb_u8, 0x4c_u8, 0x8c_u8, 0x55_u8, 0x10_u8])
    def query_interface(this : ITsSbSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_SessionId(this : ITsSbSession*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionId.call(this, pVal)
    end
    def get_TargetName(this : ITsSbSession*, targetName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetName.call(this, targetName)
    end
    def put_TargetName(this : ITsSbSession*, targetName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TargetName.call(this, targetName)
    end
    def get_Username(this : ITsSbSession*, userName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Username.call(this, userName)
    end
    def get_Domain(this : ITsSbSession*, domain : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Domain.call(this, domain)
    end
    def get_State(this : ITsSbSession*, pState : Win32cr::System::RemoteDesktop::TSSESSION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pState)
    end
    def put_State(this : ITsSbSession*, state : Win32cr::System::RemoteDesktop::TSSESSION_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_State.call(this, state)
    end
    def get_CreateTime(this : ITsSbSession*, pTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreateTime.call(this, pTime)
    end
    def put_CreateTime(this : ITsSbSession*, time : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CreateTime.call(this, time)
    end
    def get_DisconnectTime(this : ITsSbSession*, pTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisconnectTime.call(this, pTime)
    end
    def put_DisconnectTime(this : ITsSbSession*, time : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisconnectTime.call(this, time)
    end
    def get_InitialProgram(this : ITsSbSession*, app : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialProgram.call(this, app)
    end
    def put_InitialProgram(this : ITsSbSession*, application : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialProgram.call(this, application)
    end
    def get_ClientDisplay(this : ITsSbSession*, pClientDisplay : Win32cr::System::RemoteDesktop::CLIENT_DISPLAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientDisplay.call(this, pClientDisplay)
    end
    def put_ClientDisplay(this : ITsSbSession*, pClientDisplay : Win32cr::System::RemoteDesktop::CLIENT_DISPLAY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientDisplay.call(this, pClientDisplay)
    end
    def get_ProtocolType(this : ITsSbSession*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProtocolType.call(this, pVal)
    end
    def put_ProtocolType(this : ITsSbSession*, val : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ProtocolType.call(this, val)
    end

  end

  @[Extern]
  record ITsSbResourceNotificationVtbl,
    query_interface : Proc(ITsSbResourceNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbResourceNotification*, UInt32),
    release : Proc(ITsSbResourceNotification*, UInt32),
    notify_session_change : Proc(ITsSbResourceNotification*, Win32cr::System::RemoteDesktop::TSSESSION_STATE, Void*, Win32cr::Foundation::HRESULT),
    notify_target_change : Proc(ITsSbResourceNotification*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    notify_client_connection_state_change : Proc(ITsSbResourceNotification*, Win32cr::System::RemoteDesktop::CONNECTION_CHANGE_NOTIFICATION, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("65d3e85a-c39b-11dc-b92d-3cd255d89593")]
  record ITsSbResourceNotification, lpVtbl : ITsSbResourceNotificationVtbl* do
    GUID = LibC::GUID.new(0x65d3e85a_u32, 0xc39b_u16, 0x11dc_u16, StaticArray[0xb9_u8, 0x2d_u8, 0x3c_u8, 0xd2_u8, 0x55_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
    def query_interface(this : ITsSbResourceNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbResourceNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbResourceNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify_session_change(this : ITsSbResourceNotification*, changeType : Win32cr::System::RemoteDesktop::TSSESSION_STATE, pSession : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_change.call(this, changeType, pSession)
    end
    def notify_target_change(this : ITsSbResourceNotification*, target_change_type : UInt32, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_target_change.call(this, target_change_type, pTarget)
    end
    def notify_client_connection_state_change(this : ITsSbResourceNotification*, change_type : Win32cr::System::RemoteDesktop::CONNECTION_CHANGE_NOTIFICATION, pConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_client_connection_state_change.call(this, change_type, pConnection)
    end

  end

  @[Extern]
  record ITsSbResourceNotificationExVtbl,
    query_interface : Proc(ITsSbResourceNotificationEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbResourceNotificationEx*, UInt32),
    release : Proc(ITsSbResourceNotificationEx*, UInt32),
    notify_session_change_ex : Proc(ITsSbResourceNotificationEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, Win32cr::System::RemoteDesktop::TSSESSION_STATE, Win32cr::Foundation::HRESULT),
    notify_target_change_ex : Proc(ITsSbResourceNotificationEx*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT),
    notify_client_connection_state_change_ex : Proc(ITsSbResourceNotificationEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::CONNECTION_CHANGE_NOTIFICATION, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a8a47fde-ca91-44d2-b897-3aa28a43b2b7")]
  record ITsSbResourceNotificationEx, lpVtbl : ITsSbResourceNotificationExVtbl* do
    GUID = LibC::GUID.new(0xa8a47fde_u32, 0xca91_u16, 0x44d2_u16, StaticArray[0xb8_u8, 0x97_u8, 0x3a_u8, 0xa2_u8, 0x8a_u8, 0x43_u8, 0xb2_u8, 0xb7_u8])
    def query_interface(this : ITsSbResourceNotificationEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbResourceNotificationEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbResourceNotificationEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify_session_change_ex(this : ITsSbResourceNotificationEx*, targetName : Win32cr::Foundation::BSTR, userName : Win32cr::Foundation::BSTR, domain : Win32cr::Foundation::BSTR, sessionId : UInt32, sessionState : Win32cr::System::RemoteDesktop::TSSESSION_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_change_ex.call(this, targetName, userName, domain, sessionId, sessionState)
    end
    def notify_target_change_ex(this : ITsSbResourceNotificationEx*, targetName : Win32cr::Foundation::BSTR, targetChangeType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_target_change_ex.call(this, targetName, targetChangeType)
    end
    def notify_client_connection_state_change_ex(this : ITsSbResourceNotificationEx*, userName : Win32cr::Foundation::BSTR, domain : Win32cr::Foundation::BSTR, initialProgram : Win32cr::Foundation::BSTR, poolName : Win32cr::Foundation::BSTR, targetName : Win32cr::Foundation::BSTR, connectionChangeType : Win32cr::System::RemoteDesktop::CONNECTION_CHANGE_NOTIFICATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_client_connection_state_change_ex.call(this, userName, domain, initialProgram, poolName, targetName, connectionChangeType)
    end

  end

  @[Extern]
  record ITsSbTaskInfoVtbl,
    query_interface : Proc(ITsSbTaskInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbTaskInfo*, UInt32),
    release : Proc(ITsSbTaskInfo*, UInt32),
    get_TargetId : Proc(ITsSbTaskInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_StartTime : Proc(ITsSbTaskInfo*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_EndTime : Proc(ITsSbTaskInfo*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(ITsSbTaskInfo*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_Identifier : Proc(ITsSbTaskInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Label : Proc(ITsSbTaskInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Context : Proc(ITsSbTaskInfo*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_Plugin : Proc(ITsSbTaskInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ITsSbTaskInfo*, Win32cr::System::RemoteDesktop::RDV_TASK_STATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("523d1083-89be-48dd-99ea-04e82ffa7265")]
  record ITsSbTaskInfo, lpVtbl : ITsSbTaskInfoVtbl* do
    GUID = LibC::GUID.new(0x523d1083_u32, 0x89be_u16, 0x48dd_u16, StaticArray[0x99_u8, 0xea_u8, 0x4_u8, 0xe8_u8, 0x2f_u8, 0xfa_u8, 0x72_u8, 0x65_u8])
    def query_interface(this : ITsSbTaskInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbTaskInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbTaskInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_TargetId(this : ITsSbTaskInfo*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetId.call(this, pName)
    end
    def get_StartTime(this : ITsSbTaskInfo*, pStartTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartTime.call(this, pStartTime)
    end
    def get_EndTime(this : ITsSbTaskInfo*, pEndTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndTime.call(this, pEndTime)
    end
    def get_Deadline(this : ITsSbTaskInfo*, pDeadline : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, pDeadline)
    end
    def get_Identifier(this : ITsSbTaskInfo*, pIdentifier : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identifier.call(this, pIdentifier)
    end
    def get_Label(this : ITsSbTaskInfo*, pLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pLabel)
    end
    def get_Context(this : ITsSbTaskInfo*, pContext : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Context.call(this, pContext)
    end
    def get_Plugin(this : ITsSbTaskInfo*, pPlugin : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Plugin.call(this, pPlugin)
    end
    def get_Status(this : ITsSbTaskInfo*, pStatus : Win32cr::System::RemoteDesktop::RDV_TASK_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end

  end

  @[Extern]
  record ITsSbTaskPluginVtbl,
    query_interface : Proc(ITsSbTaskPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbTaskPlugin*, UInt32),
    release : Proc(ITsSbTaskPlugin*, UInt32),
    initialize__ : Proc(ITsSbTaskPlugin*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITsSbTaskPlugin*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    initialize_task_plugin : Proc(ITsSbTaskPlugin*, Void*, Win32cr::Foundation::HRESULT),
    set_task_queue : Proc(ITsSbTaskPlugin*, Win32cr::Foundation::BSTR, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fa22ef0f-8705-41be-93bc-44bdbcf1c9c4")]
  record ITsSbTaskPlugin, lpVtbl : ITsSbTaskPluginVtbl* do
    GUID = LibC::GUID.new(0xfa22ef0f_u32, 0x8705_u16, 0x41be_u16, StaticArray[0x93_u8, 0xbc_u8, 0x44_u8, 0xbd_u8, 0xbc_u8, 0xf1_u8, 0xc9_u8, 0xc4_u8])
    def query_interface(this : ITsSbTaskPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbTaskPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbTaskPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITsSbTaskPlugin*, pProvider : Void*, pNotifySink : Void*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProvider, pNotifySink, pPropertySet)
    end
    def terminate(this : ITsSbTaskPlugin*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr)
    end
    def initialize_task_plugin(this : ITsSbTaskPlugin*, pITsSbTaskPluginNotifySink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_task_plugin.call(this, pITsSbTaskPluginNotifySink)
    end
    def set_task_queue(this : ITsSbTaskPlugin*, pszHostName : Win32cr::Foundation::BSTR, sb_task_info_size : UInt32, pITsSbTaskInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_task_queue.call(this, pszHostName, sb_task_info_size, pITsSbTaskInfo)
    end

  end

  @[Extern]
  record ITsSbPropertySetVtbl,
    query_interface : Proc(ITsSbPropertySet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbPropertySet*, UInt32),
    release : Proc(ITsSbPropertySet*, UInt32),
    read : Proc(ITsSbPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(ITsSbPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5c025171-bb1e-4baf-a212-6d5e9774b33b")]
  record ITsSbPropertySet, lpVtbl : ITsSbPropertySetVtbl* do
    GUID = LibC::GUID.new(0x5c025171_u32, 0xbb1e_u16, 0x4baf_u16, StaticArray[0xa2_u8, 0x12_u8, 0x6d_u8, 0x5e_u8, 0x97_u8, 0x74_u8, 0xb3_u8, 0x3b_u8])
    def query_interface(this : ITsSbPropertySet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbPropertySet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbPropertySet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ITsSbPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*, pErrorLog : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pszPropName, pVar, pErrorLog)
    end
    def write(this : ITsSbPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pszPropName, pVar)
    end

  end

  @[Extern]
  record ITsSbPluginPropertySetVtbl,
    query_interface : Proc(ITsSbPluginPropertySet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbPluginPropertySet*, UInt32),
    release : Proc(ITsSbPluginPropertySet*, UInt32),
    read : Proc(ITsSbPluginPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(ITsSbPluginPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("95006e34-7eff-4b6c-bb40-49a4fda7cea6")]
  record ITsSbPluginPropertySet, lpVtbl : ITsSbPluginPropertySetVtbl* do
    GUID = LibC::GUID.new(0x95006e34_u32, 0x7eff_u16, 0x4b6c_u16, StaticArray[0xbb_u8, 0x40_u8, 0x49_u8, 0xa4_u8, 0xfd_u8, 0xa7_u8, 0xce_u8, 0xa6_u8])
    def query_interface(this : ITsSbPluginPropertySet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbPluginPropertySet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbPluginPropertySet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ITsSbPluginPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*, pErrorLog : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pszPropName, pVar, pErrorLog)
    end
    def write(this : ITsSbPluginPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pszPropName, pVar)
    end

  end

  @[Extern]
  record ITsSbClientConnectionPropertySetVtbl,
    query_interface : Proc(ITsSbClientConnectionPropertySet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbClientConnectionPropertySet*, UInt32),
    release : Proc(ITsSbClientConnectionPropertySet*, UInt32),
    read : Proc(ITsSbClientConnectionPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(ITsSbClientConnectionPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e51995b0-46d6-11dd-aa21-cedc55d89593")]
  record ITsSbClientConnectionPropertySet, lpVtbl : ITsSbClientConnectionPropertySetVtbl* do
    GUID = LibC::GUID.new(0xe51995b0_u32, 0x46d6_u16, 0x11dd_u16, StaticArray[0xaa_u8, 0x21_u8, 0xce_u8, 0xdc_u8, 0x55_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
    def query_interface(this : ITsSbClientConnectionPropertySet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbClientConnectionPropertySet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbClientConnectionPropertySet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ITsSbClientConnectionPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*, pErrorLog : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pszPropName, pVar, pErrorLog)
    end
    def write(this : ITsSbClientConnectionPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pszPropName, pVar)
    end

  end

  @[Extern]
  record ITsSbTargetPropertySetVtbl,
    query_interface : Proc(ITsSbTargetPropertySet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbTargetPropertySet*, UInt32),
    release : Proc(ITsSbTargetPropertySet*, UInt32),
    read : Proc(ITsSbTargetPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(ITsSbTargetPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f7bda5d6-994c-4e11-a079-2763b61830ac")]
  record ITsSbTargetPropertySet, lpVtbl : ITsSbTargetPropertySetVtbl* do
    GUID = LibC::GUID.new(0xf7bda5d6_u32, 0x994c_u16, 0x4e11_u16, StaticArray[0xa0_u8, 0x79_u8, 0x27_u8, 0x63_u8, 0xb6_u8, 0x18_u8, 0x30_u8, 0xac_u8])
    def query_interface(this : ITsSbTargetPropertySet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbTargetPropertySet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbTargetPropertySet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ITsSbTargetPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*, pErrorLog : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pszPropName, pVar, pErrorLog)
    end
    def write(this : ITsSbTargetPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pszPropName, pVar)
    end

  end

  @[Extern]
  record ITsSbEnvironmentPropertySetVtbl,
    query_interface : Proc(ITsSbEnvironmentPropertySet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbEnvironmentPropertySet*, UInt32),
    release : Proc(ITsSbEnvironmentPropertySet*, UInt32),
    read : Proc(ITsSbEnvironmentPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(ITsSbEnvironmentPropertySet*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d0d1bf7e-7acf-11dd-a243-e51156d89593")]
  record ITsSbEnvironmentPropertySet, lpVtbl : ITsSbEnvironmentPropertySetVtbl* do
    GUID = LibC::GUID.new(0xd0d1bf7e_u32, 0x7acf_u16, 0x11dd_u16, StaticArray[0xa2_u8, 0x43_u8, 0xe5_u8, 0x11_u8, 0x56_u8, 0xd8_u8, 0x95_u8, 0x93_u8])
    def query_interface(this : ITsSbEnvironmentPropertySet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbEnvironmentPropertySet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbEnvironmentPropertySet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ITsSbEnvironmentPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*, pErrorLog : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pszPropName, pVar, pErrorLog)
    end
    def write(this : ITsSbEnvironmentPropertySet*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pszPropName, pVar)
    end

  end

  @[Extern]
  record ITsSbBaseNotifySinkVtbl,
    query_interface : Proc(ITsSbBaseNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbBaseNotifySink*, UInt32),
    release : Proc(ITsSbBaseNotifySink*, UInt32),
    on_error : Proc(ITsSbBaseNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_report_status : Proc(ITsSbBaseNotifySink*, Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("808a6537-1282-4989-9e09-f43938b71722")]
  record ITsSbBaseNotifySink, lpVtbl : ITsSbBaseNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x808a6537_u32, 0x1282_u16, 0x4989_u16, StaticArray[0x9e_u8, 0x9_u8, 0xf4_u8, 0x39_u8, 0x38_u8, 0xb7_u8, 0x17_u8, 0x22_u8])
    def query_interface(this : ITsSbBaseNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbBaseNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbBaseNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : ITsSbBaseNotifySink*, hrError : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hrError)
    end
    def on_report_status(this : ITsSbBaseNotifySink*, messageType : Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, messageID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_report_status.call(this, messageType, messageID)
    end

  end

  @[Extern]
  record ITsSbPluginNotifySinkVtbl,
    query_interface : Proc(ITsSbPluginNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbPluginNotifySink*, UInt32),
    release : Proc(ITsSbPluginNotifySink*, UInt32),
    on_error : Proc(ITsSbPluginNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_report_status : Proc(ITsSbPluginNotifySink*, Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, UInt32, Win32cr::Foundation::HRESULT),
    on_initialized : Proc(ITsSbPluginNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_terminated : Proc(ITsSbPluginNotifySink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("44dfe30b-c3be-40f5-bf82-7a95bb795adf")]
  record ITsSbPluginNotifySink, lpVtbl : ITsSbPluginNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x44dfe30b_u32, 0xc3be_u16, 0x40f5_u16, StaticArray[0xbf_u8, 0x82_u8, 0x7a_u8, 0x95_u8, 0xbb_u8, 0x79_u8, 0x5a_u8, 0xdf_u8])
    def query_interface(this : ITsSbPluginNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbPluginNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbPluginNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : ITsSbPluginNotifySink*, hrError : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hrError)
    end
    def on_report_status(this : ITsSbPluginNotifySink*, messageType : Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, messageID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_report_status.call(this, messageType, messageID)
    end
    def on_initialized(this : ITsSbPluginNotifySink*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_initialized.call(this, hr)
    end
    def on_terminated(this : ITsSbPluginNotifySink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_terminated.call(this)
    end

  end

  @[Extern]
  record ITsSbLoadBalancingNotifySinkVtbl,
    query_interface : Proc(ITsSbLoadBalancingNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbLoadBalancingNotifySink*, UInt32),
    release : Proc(ITsSbLoadBalancingNotifySink*, UInt32),
    on_error : Proc(ITsSbLoadBalancingNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_report_status : Proc(ITsSbLoadBalancingNotifySink*, Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, UInt32, Win32cr::Foundation::HRESULT),
    on_get_most_suitable_target : Proc(ITsSbLoadBalancingNotifySink*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5f8a8297-3244-4e6a-958a-27c822c1e141")]
  record ITsSbLoadBalancingNotifySink, lpVtbl : ITsSbLoadBalancingNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x5f8a8297_u32, 0x3244_u16, 0x4e6a_u16, StaticArray[0x95_u8, 0x8a_u8, 0x27_u8, 0xc8_u8, 0x22_u8, 0xc1_u8, 0xe1_u8, 0x41_u8])
    def query_interface(this : ITsSbLoadBalancingNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbLoadBalancingNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbLoadBalancingNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : ITsSbLoadBalancingNotifySink*, hrError : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hrError)
    end
    def on_report_status(this : ITsSbLoadBalancingNotifySink*, messageType : Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, messageID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_report_status.call(this, messageType, messageID)
    end
    def on_get_most_suitable_target(this : ITsSbLoadBalancingNotifySink*, pLBResult : Void*, fIsNewConnection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_get_most_suitable_target.call(this, pLBResult, fIsNewConnection)
    end

  end

  @[Extern]
  record ITsSbPlacementNotifySinkVtbl,
    query_interface : Proc(ITsSbPlacementNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbPlacementNotifySink*, UInt32),
    release : Proc(ITsSbPlacementNotifySink*, UInt32),
    on_error : Proc(ITsSbPlacementNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_report_status : Proc(ITsSbPlacementNotifySink*, Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, UInt32, Win32cr::Foundation::HRESULT),
    on_query_environment_completed : Proc(ITsSbPlacementNotifySink*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("68a0c487-2b4f-46c2-94a1-6ce685183634")]
  record ITsSbPlacementNotifySink, lpVtbl : ITsSbPlacementNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x68a0c487_u32, 0x2b4f_u16, 0x46c2_u16, StaticArray[0x94_u8, 0xa1_u8, 0x6c_u8, 0xe6_u8, 0x85_u8, 0x18_u8, 0x36_u8, 0x34_u8])
    def query_interface(this : ITsSbPlacementNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbPlacementNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbPlacementNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : ITsSbPlacementNotifySink*, hrError : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hrError)
    end
    def on_report_status(this : ITsSbPlacementNotifySink*, messageType : Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, messageID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_report_status.call(this, messageType, messageID)
    end
    def on_query_environment_completed(this : ITsSbPlacementNotifySink*, pEnvironment : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_query_environment_completed.call(this, pEnvironment)
    end

  end

  @[Extern]
  record ITsSbOrchestrationNotifySinkVtbl,
    query_interface : Proc(ITsSbOrchestrationNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbOrchestrationNotifySink*, UInt32),
    release : Proc(ITsSbOrchestrationNotifySink*, UInt32),
    on_error : Proc(ITsSbOrchestrationNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_report_status : Proc(ITsSbOrchestrationNotifySink*, Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, UInt32, Win32cr::Foundation::HRESULT),
    on_ready_to_connect : Proc(ITsSbOrchestrationNotifySink*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("36c37d61-926b-442f-bca5-118c6d50dcf2")]
  record ITsSbOrchestrationNotifySink, lpVtbl : ITsSbOrchestrationNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x36c37d61_u32, 0x926b_u16, 0x442f_u16, StaticArray[0xbc_u8, 0xa5_u8, 0x11_u8, 0x8c_u8, 0x6d_u8, 0x50_u8, 0xdc_u8, 0xf2_u8])
    def query_interface(this : ITsSbOrchestrationNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbOrchestrationNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbOrchestrationNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : ITsSbOrchestrationNotifySink*, hrError : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hrError)
    end
    def on_report_status(this : ITsSbOrchestrationNotifySink*, messageType : Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, messageID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_report_status.call(this, messageType, messageID)
    end
    def on_ready_to_connect(this : ITsSbOrchestrationNotifySink*, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ready_to_connect.call(this, pTarget)
    end

  end

  @[Extern]
  record ITsSbTaskPluginNotifySinkVtbl,
    query_interface : Proc(ITsSbTaskPluginNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbTaskPluginNotifySink*, UInt32),
    release : Proc(ITsSbTaskPluginNotifySink*, UInt32),
    on_error : Proc(ITsSbTaskPluginNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_report_status : Proc(ITsSbTaskPluginNotifySink*, Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, UInt32, Win32cr::Foundation::HRESULT),
    on_set_task_time : Proc(ITsSbTaskPluginNotifySink*, Win32cr::Foundation::BSTR, Win32cr::Foundation::FILETIME, Win32cr::Foundation::FILETIME, Win32cr::Foundation::FILETIME, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    on_delete_task_time : Proc(ITsSbTaskPluginNotifySink*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_update_task_status : Proc(ITsSbTaskPluginNotifySink*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::RDV_TASK_STATUS, Win32cr::Foundation::HRESULT),
    on_report_tasks : Proc(ITsSbTaskPluginNotifySink*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6aaf899e-c2ec-45ee-aa37-45e60895261a")]
  record ITsSbTaskPluginNotifySink, lpVtbl : ITsSbTaskPluginNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x6aaf899e_u32, 0xc2ec_u16, 0x45ee_u16, StaticArray[0xaa_u8, 0x37_u8, 0x45_u8, 0xe6_u8, 0x8_u8, 0x95_u8, 0x26_u8, 0x1a_u8])
    def query_interface(this : ITsSbTaskPluginNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbTaskPluginNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbTaskPluginNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : ITsSbTaskPluginNotifySink*, hrError : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hrError)
    end
    def on_report_status(this : ITsSbTaskPluginNotifySink*, messageType : Win32cr::System::RemoteDesktop::CLIENT_MESSAGE_TYPE, messageID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_report_status.call(this, messageType, messageID)
    end
    def on_set_task_time(this : ITsSbTaskPluginNotifySink*, szTargetName : Win32cr::Foundation::BSTR, task_start_time : Win32cr::Foundation::FILETIME, task_end_time : Win32cr::Foundation::FILETIME, task_deadline : Win32cr::Foundation::FILETIME, szTaskLabel : Win32cr::Foundation::BSTR, szTaskIdentifier : Win32cr::Foundation::BSTR, szTaskPlugin : Win32cr::Foundation::BSTR, dwTaskStatus : UInt32, saContext : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_task_time.call(this, szTargetName, task_start_time, task_end_time, task_deadline, szTaskLabel, szTaskIdentifier, szTaskPlugin, dwTaskStatus, saContext)
    end
    def on_delete_task_time(this : ITsSbTaskPluginNotifySink*, szTargetName : Win32cr::Foundation::BSTR, szTaskIdentifier : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_delete_task_time.call(this, szTargetName, szTaskIdentifier)
    end
    def on_update_task_status(this : ITsSbTaskPluginNotifySink*, szTargetName : Win32cr::Foundation::BSTR, task_identifier : Win32cr::Foundation::BSTR, task_status : Win32cr::System::RemoteDesktop::RDV_TASK_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_update_task_status.call(this, szTargetName, task_identifier, task_status)
    end
    def on_report_tasks(this : ITsSbTaskPluginNotifySink*, szHostName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_report_tasks.call(this, szHostName)
    end

  end

  @[Extern]
  record ITsSbClientConnectionVtbl,
    query_interface : Proc(ITsSbClientConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbClientConnection*, UInt32),
    release : Proc(ITsSbClientConnection*, UInt32),
    get_UserName : Proc(ITsSbClientConnection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Domain : Proc(ITsSbClientConnection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_InitialProgram : Proc(ITsSbClientConnection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LoadBalanceResult : Proc(ITsSbClientConnection*, Void**, Win32cr::Foundation::HRESULT),
    get_FarmName : Proc(ITsSbClientConnection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_context : Proc(ITsSbClientConnection*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_context : Proc(ITsSbClientConnection*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Environment : Proc(ITsSbClientConnection*, Void**, Win32cr::Foundation::HRESULT),
    get_ConnectionError : Proc(ITsSbClientConnection*, Win32cr::Foundation::HRESULT),
    get_SamUserAccount : Proc(ITsSbClientConnection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientConnectionPropertySet : Proc(ITsSbClientConnection*, Void**, Win32cr::Foundation::HRESULT),
    get_IsFirstAssignment : Proc(ITsSbClientConnection*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_RdFarmType : Proc(ITsSbClientConnection*, Win32cr::System::RemoteDesktop::RD_FARM_TYPE*, Win32cr::Foundation::HRESULT),
    get_UserSidString : Proc(ITsSbClientConnection*, Int8**, Win32cr::Foundation::HRESULT),
    get_disconnected_session : Proc(ITsSbClientConnection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("18857499-ad61-4b1b-b7df-cbcd41fb8338")]
  record ITsSbClientConnection, lpVtbl : ITsSbClientConnectionVtbl* do
    GUID = LibC::GUID.new(0x18857499_u32, 0xad61_u16, 0x4b1b_u16, StaticArray[0xb7_u8, 0xdf_u8, 0xcb_u8, 0xcd_u8, 0x41_u8, 0xfb_u8, 0x83_u8, 0x38_u8])
    def query_interface(this : ITsSbClientConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbClientConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbClientConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_UserName(this : ITsSbClientConnection*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserName.call(this, pVal)
    end
    def get_Domain(this : ITsSbClientConnection*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Domain.call(this, pVal)
    end
    def get_InitialProgram(this : ITsSbClientConnection*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialProgram.call(this, pVal)
    end
    def get_LoadBalanceResult(this : ITsSbClientConnection*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LoadBalanceResult.call(this, ppVal)
    end
    def get_FarmName(this : ITsSbClientConnection*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FarmName.call(this, pVal)
    end
    def put_context(this : ITsSbClientConnection*, contextId : Win32cr::Foundation::BSTR, context : Win32cr::System::Com::VARIANT, existingContext : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_context.call(this, contextId, context, existingContext)
    end
    def get_context(this : ITsSbClientConnection*, contextId : Win32cr::Foundation::BSTR, context : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, contextId, context)
    end
    def get_Environment(this : ITsSbClientConnection*, ppEnvironment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Environment.call(this, ppEnvironment)
    end
    def get_ConnectionError(this : ITsSbClientConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionError.call(this)
    end
    def get_SamUserAccount(this : ITsSbClientConnection*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SamUserAccount.call(this, pVal)
    end
    def get_ClientConnectionPropertySet(this : ITsSbClientConnection*, ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientConnectionPropertySet.call(this, ppPropertySet)
    end
    def get_IsFirstAssignment(this : ITsSbClientConnection*, ppVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsFirstAssignment.call(this, ppVal)
    end
    def get_RdFarmType(this : ITsSbClientConnection*, pRdFarmType : Win32cr::System::RemoteDesktop::RD_FARM_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RdFarmType.call(this, pRdFarmType)
    end
    def get_UserSidString(this : ITsSbClientConnection*, pszUserSidString : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSidString.call(this, pszUserSidString)
    end
    def get_disconnected_session(this : ITsSbClientConnection*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_disconnected_session.call(this, ppSession)
    end

  end

  @[Extern]
  record ITsSbProviderVtbl,
    query_interface : Proc(ITsSbProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbProvider*, UInt32),
    release : Proc(ITsSbProvider*, UInt32),
    create_target_object : Proc(ITsSbProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_load_balance_result_object : Proc(ITsSbProvider*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_session_object : Proc(ITsSbProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_plugin_property_set : Proc(ITsSbProvider*, Void**, Win32cr::Foundation::HRESULT),
    create_target_property_set_object : Proc(ITsSbProvider*, Void**, Win32cr::Foundation::HRESULT),
    create_environment_object : Proc(ITsSbProvider*, Win32cr::Foundation::BSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_resource_plugin_store : Proc(ITsSbProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_filter_plugin_store : Proc(ITsSbProvider*, Void**, Win32cr::Foundation::HRESULT),
    register_for_notification : Proc(ITsSbProvider*, UInt32, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    un_register_for_notification : Proc(ITsSbProvider*, UInt32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_instance_of_global_store : Proc(ITsSbProvider*, Void**, Win32cr::Foundation::HRESULT),
    create_environment_property_set_object : Proc(ITsSbProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("87a4098f-6d7b-44dd-bc17-8ce44e370d52")]
  record ITsSbProvider, lpVtbl : ITsSbProviderVtbl* do
    GUID = LibC::GUID.new(0x87a4098f_u32, 0x6d7b_u16, 0x44dd_u16, StaticArray[0xbc_u8, 0x17_u8, 0x8c_u8, 0xe4_u8, 0x4e_u8, 0x37_u8, 0xd_u8, 0x52_u8])
    def query_interface(this : ITsSbProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_target_object(this : ITsSbProvider*, target_name : Win32cr::Foundation::BSTR, environment_name : Win32cr::Foundation::BSTR, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_target_object.call(this, target_name, environment_name, ppTarget)
    end
    def create_load_balance_result_object(this : ITsSbProvider*, target_name : Win32cr::Foundation::BSTR, ppLBResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_load_balance_result_object.call(this, target_name, ppLBResult)
    end
    def create_session_object(this : ITsSbProvider*, target_name : Win32cr::Foundation::BSTR, user_name : Win32cr::Foundation::BSTR, domain : Win32cr::Foundation::BSTR, session_id : UInt32, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_session_object.call(this, target_name, user_name, domain, session_id, ppSession)
    end
    def create_plugin_property_set(this : ITsSbProvider*, ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_plugin_property_set.call(this, ppPropertySet)
    end
    def create_target_property_set_object(this : ITsSbProvider*, ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_target_property_set_object.call(this, ppPropertySet)
    end
    def create_environment_object(this : ITsSbProvider*, name : Win32cr::Foundation::BSTR, server_weight : UInt32, ppEnvironment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_environment_object.call(this, name, server_weight, ppEnvironment)
    end
    def get_resource_plugin_store(this : ITsSbProvider*, ppStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_plugin_store.call(this, ppStore)
    end
    def get_filter_plugin_store(this : ITsSbProvider*, ppStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_plugin_store.call(this, ppStore)
    end
    def register_for_notification(this : ITsSbProvider*, notificationType : UInt32, resource_to_monitor : Win32cr::Foundation::BSTR, pPluginNotification : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_for_notification.call(this, notificationType, resource_to_monitor, pPluginNotification)
    end
    def un_register_for_notification(this : ITsSbProvider*, notificationType : UInt32, resource_to_monitor : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_register_for_notification.call(this, notificationType, resource_to_monitor)
    end
    def get_instance_of_global_store(this : ITsSbProvider*, ppGlobalStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance_of_global_store.call(this, ppGlobalStore)
    end
    def create_environment_property_set_object(this : ITsSbProvider*, ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_environment_property_set_object.call(this, ppPropertySet)
    end

  end

  @[Extern]
  record ITsSbResourcePluginStoreVtbl,
    query_interface : Proc(ITsSbResourcePluginStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbResourcePluginStore*, UInt32),
    release : Proc(ITsSbResourcePluginStore*, UInt32),
    query_target : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    query_session_by_session_id : Proc(ITsSbResourcePluginStore*, UInt32, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_target_to_store : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::HRESULT),
    add_session_to_store : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::HRESULT),
    add_environment_to_store : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::HRESULT),
    remove_environment_from_store : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    enumerate_farms : Proc(ITsSbResourcePluginStore*, UInt32*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    query_environment : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enumerate_environments : Proc(ITsSbResourcePluginStore*, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    save_target : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    save_environment : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    save_session : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::HRESULT),
    set_target_property : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_environment_property : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_target_state : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::TARGET_STATE, Win32cr::System::RemoteDesktop::TARGET_STATE*, Win32cr::Foundation::HRESULT),
    set_session_state : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_targets : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::TS_SB_SORT_BY, Win32cr::Foundation::BSTR, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    enumerate_sessions : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::TSSESSION_STATE*, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    get_farm_property : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    delete_target : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_target_property_with_version_check : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_environment_property_with_version_check : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    acquire_target_lock : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    release_target_lock : Proc(ITsSbResourcePluginStore*, Void*, Win32cr::Foundation::HRESULT),
    test_and_set_server_state : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::TARGET_STATE, Win32cr::System::RemoteDesktop::TARGET_STATE, Win32cr::System::RemoteDesktop::TARGET_STATE*, Win32cr::Foundation::HRESULT),
    set_server_waiting_to_start : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_server_state : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::TARGET_STATE*, Win32cr::Foundation::HRESULT),
    set_server_drain_mode : Proc(ITsSbResourcePluginStore*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5c38f65f-bcf1-4036-a6bf-9e3cccae0b63")]
  record ITsSbResourcePluginStore, lpVtbl : ITsSbResourcePluginStoreVtbl* do
    GUID = LibC::GUID.new(0x5c38f65f_u32, 0xbcf1_u16, 0x4036_u16, StaticArray[0xa6_u8, 0xbf_u8, 0x9e_u8, 0x3c_u8, 0xcc_u8, 0xae_u8, 0xb_u8, 0x63_u8])
    def query_interface(this : ITsSbResourcePluginStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbResourcePluginStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbResourcePluginStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_target(this : ITsSbResourcePluginStore*, target_name : Win32cr::Foundation::BSTR, farm_name : Win32cr::Foundation::BSTR, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_target.call(this, target_name, farm_name, ppTarget)
    end
    def query_session_by_session_id(this : ITsSbResourcePluginStore*, dwSessionId : UInt32, target_name : Win32cr::Foundation::BSTR, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_session_by_session_id.call(this, dwSessionId, target_name, ppSession)
    end
    def add_target_to_store(this : ITsSbResourcePluginStore*, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_target_to_store.call(this, pTarget)
    end
    def add_session_to_store(this : ITsSbResourcePluginStore*, pSession : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_session_to_store.call(this, pSession)
    end
    def add_environment_to_store(this : ITsSbResourcePluginStore*, pEnvironment : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_environment_to_store.call(this, pEnvironment)
    end
    def remove_environment_from_store(this : ITsSbResourcePluginStore*, environment_name : Win32cr::Foundation::BSTR, bIgnoreOwner : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_environment_from_store.call(this, environment_name, bIgnoreOwner)
    end
    def enumerate_farms(this : ITsSbResourcePluginStore*, pdwCount : UInt32*, pVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_farms.call(this, pdwCount, pVal)
    end
    def query_environment(this : ITsSbResourcePluginStore*, environment_name : Win32cr::Foundation::BSTR, ppEnvironment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_environment.call(this, environment_name, ppEnvironment)
    end
    def enumerate_environments(this : ITsSbResourcePluginStore*, pdwCount : UInt32*, pVal : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_environments.call(this, pdwCount, pVal)
    end
    def save_target(this : ITsSbResourcePluginStore*, pTarget : Void*, bForceWrite : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_target.call(this, pTarget, bForceWrite)
    end
    def save_environment(this : ITsSbResourcePluginStore*, pEnvironment : Void*, bForceWrite : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_environment.call(this, pEnvironment, bForceWrite)
    end
    def save_session(this : ITsSbResourcePluginStore*, pSession : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_session.call(this, pSession)
    end
    def set_target_property(this : ITsSbResourcePluginStore*, target_name : Win32cr::Foundation::BSTR, property_name : Win32cr::Foundation::BSTR, pProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_property.call(this, target_name, property_name, pProperty)
    end
    def set_environment_property(this : ITsSbResourcePluginStore*, environment_name : Win32cr::Foundation::BSTR, property_name : Win32cr::Foundation::BSTR, pProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_environment_property.call(this, environment_name, property_name, pProperty)
    end
    def set_target_state(this : ITsSbResourcePluginStore*, targetName : Win32cr::Foundation::BSTR, newState : Win32cr::System::RemoteDesktop::TARGET_STATE, pOldState : Win32cr::System::RemoteDesktop::TARGET_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_state.call(this, targetName, newState, pOldState)
    end
    def set_session_state(this : ITsSbResourcePluginStore*, sbSession : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_session_state.call(this, sbSession)
    end
    def enumerate_targets(this : ITsSbResourcePluginStore*, farm_name : Win32cr::Foundation::BSTR, env_name : Win32cr::Foundation::BSTR, sortByFieldId : Win32cr::System::RemoteDesktop::TS_SB_SORT_BY, sortyByPropName : Win32cr::Foundation::BSTR, pdwCount : UInt32*, pVal : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_targets.call(this, farm_name, env_name, sortByFieldId, sortyByPropName, pdwCount, pVal)
    end
    def enumerate_sessions(this : ITsSbResourcePluginStore*, targetName : Win32cr::Foundation::BSTR, userName : Win32cr::Foundation::BSTR, userDomain : Win32cr::Foundation::BSTR, poolName : Win32cr::Foundation::BSTR, initialProgram : Win32cr::Foundation::BSTR, pSessionState : Win32cr::System::RemoteDesktop::TSSESSION_STATE*, pdwCount : UInt32*, ppVal : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_sessions.call(this, targetName, userName, userDomain, poolName, initialProgram, pSessionState, pdwCount, ppVal)
    end
    def get_farm_property(this : ITsSbResourcePluginStore*, farmName : Win32cr::Foundation::BSTR, propertyName : Win32cr::Foundation::BSTR, pVarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_farm_property.call(this, farmName, propertyName, pVarValue)
    end
    def delete_target(this : ITsSbResourcePluginStore*, targetName : Win32cr::Foundation::BSTR, hostName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_target.call(this, targetName, hostName)
    end
    def set_target_property_with_version_check(this : ITsSbResourcePluginStore*, pTarget : Void*, property_name : Win32cr::Foundation::BSTR, pProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_property_with_version_check.call(this, pTarget, property_name, pProperty)
    end
    def set_environment_property_with_version_check(this : ITsSbResourcePluginStore*, pEnvironment : Void*, property_name : Win32cr::Foundation::BSTR, pProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_environment_property_with_version_check.call(this, pEnvironment, property_name, pProperty)
    end
    def acquire_target_lock(this : ITsSbResourcePluginStore*, targetName : Win32cr::Foundation::BSTR, dwTimeout : UInt32, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_target_lock.call(this, targetName, dwTimeout, ppContext)
    end
    def release_target_lock(this : ITsSbResourcePluginStore*, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_target_lock.call(this, pContext)
    end
    def test_and_set_server_state(this : ITsSbResourcePluginStore*, pool_name : Win32cr::Foundation::BSTR, server_fqdn : Win32cr::Foundation::BSTR, new_state : Win32cr::System::RemoteDesktop::TARGET_STATE, test_state : Win32cr::System::RemoteDesktop::TARGET_STATE, pInitState : Win32cr::System::RemoteDesktop::TARGET_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.test_and_set_server_state.call(this, pool_name, server_fqdn, new_state, test_state, pInitState)
    end
    def set_server_waiting_to_start(this : ITsSbResourcePluginStore*, pool_name : Win32cr::Foundation::BSTR, serverName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_server_waiting_to_start.call(this, pool_name, serverName)
    end
    def get_server_state(this : ITsSbResourcePluginStore*, pool_name : Win32cr::Foundation::BSTR, server_fqdn : Win32cr::Foundation::BSTR, pState : Win32cr::System::RemoteDesktop::TARGET_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_server_state.call(this, pool_name, server_fqdn, pState)
    end
    def set_server_drain_mode(this : ITsSbResourcePluginStore*, server_fqdn : Win32cr::Foundation::BSTR, drain_mode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_server_drain_mode.call(this, server_fqdn, drain_mode)
    end

  end

  @[Extern]
  record ITsSbFilterPluginStoreVtbl,
    query_interface : Proc(ITsSbFilterPluginStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbFilterPluginStore*, UInt32),
    release : Proc(ITsSbFilterPluginStore*, UInt32),
    save_properties : Proc(ITsSbFilterPluginStore*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_properties : Proc(ITsSbFilterPluginStore*, Void**, Win32cr::Foundation::HRESULT),
    delete_properties : Proc(ITsSbFilterPluginStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("85b44b0f-ed78-413f-9702-fa6d3b5ee755")]
  record ITsSbFilterPluginStore, lpVtbl : ITsSbFilterPluginStoreVtbl* do
    GUID = LibC::GUID.new(0x85b44b0f_u32, 0xed78_u16, 0x413f_u16, StaticArray[0x97_u8, 0x2_u8, 0xfa_u8, 0x6d_u8, 0x3b_u8, 0x5e_u8, 0xe7_u8, 0x55_u8])
    def query_interface(this : ITsSbFilterPluginStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbFilterPluginStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbFilterPluginStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def save_properties(this : ITsSbFilterPluginStore*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_properties.call(this, pPropertySet)
    end
    def enumerate_properties(this : ITsSbFilterPluginStore*, ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_properties.call(this, ppPropertySet)
    end
    def delete_properties(this : ITsSbFilterPluginStore*, propertyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_properties.call(this, propertyName)
    end

  end

  @[Extern]
  record ITsSbGlobalStoreVtbl,
    query_interface : Proc(ITsSbGlobalStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbGlobalStore*, UInt32),
    release : Proc(ITsSbGlobalStore*, UInt32),
    query_target : Proc(ITsSbGlobalStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    query_session_by_session_id : Proc(ITsSbGlobalStore*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enumerate_farms : Proc(ITsSbGlobalStore*, Win32cr::Foundation::BSTR, UInt32*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    enumerate_targets : Proc(ITsSbGlobalStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    enumerate_environments_by_provider : Proc(ITsSbGlobalStore*, Win32cr::Foundation::BSTR, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    enumerate_sessions : Proc(ITsSbGlobalStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::TSSESSION_STATE*, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    get_farm_property : Proc(ITsSbGlobalStore*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9ab60f7b-bd72-4d9f-8a3a-a0ea5574e635")]
  record ITsSbGlobalStore, lpVtbl : ITsSbGlobalStoreVtbl* do
    GUID = LibC::GUID.new(0x9ab60f7b_u32, 0xbd72_u16, 0x4d9f_u16, StaticArray[0x8a_u8, 0x3a_u8, 0xa0_u8, 0xea_u8, 0x55_u8, 0x74_u8, 0xe6_u8, 0x35_u8])
    def query_interface(this : ITsSbGlobalStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbGlobalStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbGlobalStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_target(this : ITsSbGlobalStore*, provider_name : Win32cr::Foundation::BSTR, target_name : Win32cr::Foundation::BSTR, farm_name : Win32cr::Foundation::BSTR, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_target.call(this, provider_name, target_name, farm_name, ppTarget)
    end
    def query_session_by_session_id(this : ITsSbGlobalStore*, provider_name : Win32cr::Foundation::BSTR, dwSessionId : UInt32, target_name : Win32cr::Foundation::BSTR, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_session_by_session_id.call(this, provider_name, dwSessionId, target_name, ppSession)
    end
    def enumerate_farms(this : ITsSbGlobalStore*, provider_name : Win32cr::Foundation::BSTR, pdwCount : UInt32*, pVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_farms.call(this, provider_name, pdwCount, pVal)
    end
    def enumerate_targets(this : ITsSbGlobalStore*, provider_name : Win32cr::Foundation::BSTR, farm_name : Win32cr::Foundation::BSTR, env_name : Win32cr::Foundation::BSTR, pdwCount : UInt32*, pVal : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_targets.call(this, provider_name, farm_name, env_name, pdwCount, pVal)
    end
    def enumerate_environments_by_provider(this : ITsSbGlobalStore*, provider_name : Win32cr::Foundation::BSTR, pdwCount : UInt32*, ppVal : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_environments_by_provider.call(this, provider_name, pdwCount, ppVal)
    end
    def enumerate_sessions(this : ITsSbGlobalStore*, provider_name : Win32cr::Foundation::BSTR, targetName : Win32cr::Foundation::BSTR, userName : Win32cr::Foundation::BSTR, userDomain : Win32cr::Foundation::BSTR, poolName : Win32cr::Foundation::BSTR, initialProgram : Win32cr::Foundation::BSTR, pSessionState : Win32cr::System::RemoteDesktop::TSSESSION_STATE*, pdwCount : UInt32*, ppVal : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_sessions.call(this, provider_name, targetName, userName, userDomain, poolName, initialProgram, pSessionState, pdwCount, ppVal)
    end
    def get_farm_property(this : ITsSbGlobalStore*, farmName : Win32cr::Foundation::BSTR, propertyName : Win32cr::Foundation::BSTR, pVarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_farm_property.call(this, farmName, propertyName, pVarValue)
    end

  end

  @[Extern]
  record ITsSbProvisioningPluginNotifySinkVtbl,
    query_interface : Proc(ITsSbProvisioningPluginNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbProvisioningPluginNotifySink*, UInt32),
    release : Proc(ITsSbProvisioningPluginNotifySink*, UInt32),
    on_job_created : Proc(ITsSbProvisioningPluginNotifySink*, Win32cr::System::RemoteDesktop::VM_NOTIFY_INFO*, Win32cr::Foundation::HRESULT),
    on_virtual_machine_status_changed : Proc(ITsSbProvisioningPluginNotifySink*, Win32cr::System::RemoteDesktop::VM_NOTIFY_ENTRY*, Win32cr::System::RemoteDesktop::VM_NOTIFY_STATUS, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_job_completed : Proc(ITsSbProvisioningPluginNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_job_cancelled : Proc(ITsSbProvisioningPluginNotifySink*, Win32cr::Foundation::HRESULT),
    lock_virtual_machine : Proc(ITsSbProvisioningPluginNotifySink*, Win32cr::System::RemoteDesktop::VM_NOTIFY_ENTRY*, Win32cr::Foundation::HRESULT),
    on_virtual_machine_host_status_changed : Proc(ITsSbProvisioningPluginNotifySink*, Win32cr::Foundation::BSTR, Win32cr::System::RemoteDesktop::VM_HOST_NOTIFY_STATUS, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aca87a8e-818b-4581-a032-49c3dfb9c701")]
  record ITsSbProvisioningPluginNotifySink, lpVtbl : ITsSbProvisioningPluginNotifySinkVtbl* do
    GUID = LibC::GUID.new(0xaca87a8e_u32, 0x818b_u16, 0x4581_u16, StaticArray[0xa0_u8, 0x32_u8, 0x49_u8, 0xc3_u8, 0xdf_u8, 0xb9_u8, 0xc7_u8, 0x1_u8])
    def query_interface(this : ITsSbProvisioningPluginNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbProvisioningPluginNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbProvisioningPluginNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_job_created(this : ITsSbProvisioningPluginNotifySink*, pVmNotifyInfo : Win32cr::System::RemoteDesktop::VM_NOTIFY_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_job_created.call(this, pVmNotifyInfo)
    end
    def on_virtual_machine_status_changed(this : ITsSbProvisioningPluginNotifySink*, pVmNotifyEntry : Win32cr::System::RemoteDesktop::VM_NOTIFY_ENTRY*, vm_notify_status : Win32cr::System::RemoteDesktop::VM_NOTIFY_STATUS, error_code : Win32cr::Foundation::HRESULT, error_descr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_virtual_machine_status_changed.call(this, pVmNotifyEntry, vm_notify_status, error_code, error_descr)
    end
    def on_job_completed(this : ITsSbProvisioningPluginNotifySink*, result_code : Win32cr::Foundation::HRESULT, result_description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_job_completed.call(this, result_code, result_description)
    end
    def on_job_cancelled(this : ITsSbProvisioningPluginNotifySink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_job_cancelled.call(this)
    end
    def lock_virtual_machine(this : ITsSbProvisioningPluginNotifySink*, pVmNotifyEntry : Win32cr::System::RemoteDesktop::VM_NOTIFY_ENTRY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_virtual_machine.call(this, pVmNotifyEntry)
    end
    def on_virtual_machine_host_status_changed(this : ITsSbProvisioningPluginNotifySink*, vm_host : Win32cr::Foundation::BSTR, vm_host_notify_status : Win32cr::System::RemoteDesktop::VM_HOST_NOTIFY_STATUS, error_code : Win32cr::Foundation::HRESULT, error_descr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_virtual_machine_host_status_changed.call(this, vm_host, vm_host_notify_status, error_code, error_descr)
    end

  end

  @[Extern]
  record ITsSbProvisioningVtbl,
    query_interface : Proc(ITsSbProvisioning*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbProvisioning*, UInt32),
    release : Proc(ITsSbProvisioning*, UInt32),
    initialize__ : Proc(ITsSbProvisioning*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITsSbProvisioning*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    create_virtual_machines : Proc(ITsSbProvisioning*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    patch_virtual_machines : Proc(ITsSbProvisioning*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void*, Win32cr::System::RemoteDesktop::VM_PATCH_INFO*, Win32cr::Foundation::HRESULT),
    delete_virtual_machines : Proc(ITsSbProvisioning*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    cancel_job : Proc(ITsSbProvisioning*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2f6f0dbb-9e4f-462b-9c3f-fccc3dcb6232")]
  record ITsSbProvisioning, lpVtbl : ITsSbProvisioningVtbl* do
    GUID = LibC::GUID.new(0x2f6f0dbb_u32, 0x9e4f_u16, 0x462b_u16, StaticArray[0x9c_u8, 0x3f_u8, 0xfc_u8, 0xcc_u8, 0x3d_u8, 0xcb_u8, 0x62_u8, 0x32_u8])
    def query_interface(this : ITsSbProvisioning*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbProvisioning*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbProvisioning*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITsSbProvisioning*, pProvider : Void*, pNotifySink : Void*, pPropertySet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProvider, pNotifySink, pPropertySet)
    end
    def terminate(this : ITsSbProvisioning*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr)
    end
    def create_virtual_machines(this : ITsSbProvisioning*, job_xml_string : Win32cr::Foundation::BSTR, job_guid : Win32cr::Foundation::BSTR, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_machines.call(this, job_xml_string, job_guid, pSink)
    end
    def patch_virtual_machines(this : ITsSbProvisioning*, job_xml_string : Win32cr::Foundation::BSTR, job_guid : Win32cr::Foundation::BSTR, pSink : Void*, pVMPatchInfo : Win32cr::System::RemoteDesktop::VM_PATCH_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.patch_virtual_machines.call(this, job_xml_string, job_guid, pSink, pVMPatchInfo)
    end
    def delete_virtual_machines(this : ITsSbProvisioning*, job_xml_string : Win32cr::Foundation::BSTR, job_guid : Win32cr::Foundation::BSTR, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_virtual_machines.call(this, job_xml_string, job_guid, pSink)
    end
    def cancel_job(this : ITsSbProvisioning*, job_guid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_job.call(this, job_guid)
    end

  end

  @[Extern]
  record ITsSbGenericNotifySinkVtbl,
    query_interface : Proc(ITsSbGenericNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITsSbGenericNotifySink*, UInt32),
    release : Proc(ITsSbGenericNotifySink*, UInt32),
    on_completed : Proc(ITsSbGenericNotifySink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    get_wait_timeout : Proc(ITsSbGenericNotifySink*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4c4c8c4f-300b-46ad-9164-8468a7e7568c")]
  record ITsSbGenericNotifySink, lpVtbl : ITsSbGenericNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x4c4c8c4f_u32, 0x300b_u16, 0x46ad_u16, StaticArray[0x91_u8, 0x64_u8, 0x84_u8, 0x68_u8, 0xa7_u8, 0xe7_u8, 0x56_u8, 0x8c_u8])
    def query_interface(this : ITsSbGenericNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITsSbGenericNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITsSbGenericNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_completed(this : ITsSbGenericNotifySink*, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_completed.call(this, status)
    end
    def get_wait_timeout(this : ITsSbGenericNotifySink*, pftTimeout : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wait_timeout.call(this, pftTimeout)
    end

  end

  @[Extern]
  record ItsPubPluginVtbl,
    query_interface : Proc(ItsPubPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ItsPubPlugin*, UInt32),
    release : Proc(ItsPubPlugin*, UInt32),
    get_resource_list : Proc(ItsPubPlugin*, Win32cr::Foundation::PWSTR, Int32*, Win32cr::System::RemoteDesktop::Pluginresource**, Win32cr::Foundation::HRESULT),
    get_resource : Proc(ItsPubPlugin*, Win32cr::Foundation::PWSTR, Int32, Win32cr::System::RemoteDesktop::Pluginresource*, Win32cr::Foundation::HRESULT),
    get_cache_last_update_time : Proc(ItsPubPlugin*, UInt64*, Win32cr::Foundation::HRESULT),
    get_pluginName : Proc(ItsPubPlugin*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pluginVersion : Proc(ItsPubPlugin*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    resolve_resource : Proc(ItsPubPlugin*, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("70c04b05-f347-412b-822f-36c99c54ca45")]
  record ItsPubPlugin, lpVtbl : ItsPubPluginVtbl* do
    GUID = LibC::GUID.new(0x70c04b05_u32, 0xf347_u16, 0x412b_u16, StaticArray[0x82_u8, 0x2f_u8, 0x36_u8, 0xc9_u8, 0x9c_u8, 0x54_u8, 0xca_u8, 0x45_u8])
    def query_interface(this : ItsPubPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ItsPubPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ItsPubPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_resource_list(this : ItsPubPlugin*, userID : Win32cr::Foundation::PWSTR, pceAppListSize : Int32*, resourceList : Win32cr::System::RemoteDesktop::Pluginresource**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_list.call(this, userID, pceAppListSize, resourceList)
    end
    def get_resource(this : ItsPubPlugin*, alias__ : Win32cr::Foundation::PWSTR, flags : Int32, resource : Win32cr::System::RemoteDesktop::Pluginresource*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource.call(this, alias__, flags, resource)
    end
    def get_cache_last_update_time(this : ItsPubPlugin*, lastUpdateTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cache_last_update_time.call(this, lastUpdateTime)
    end
    def get_pluginName(this : ItsPubPlugin*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pluginName.call(this, pVal)
    end
    def get_pluginVersion(this : ItsPubPlugin*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pluginVersion.call(this, pVal)
    end
    def resolve_resource(this : ItsPubPlugin*, resourceType : UInt32*, resourceLocation : Win32cr::Foundation::PWSTR, endPointName : Win32cr::Foundation::PWSTR, userID : Win32cr::Foundation::PWSTR, alias__ : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_resource.call(this, resourceType, resourceLocation, endPointName, userID, alias__)
    end

  end

  @[Extern]
  record ItsPubPlugin2Vtbl,
    query_interface : Proc(ItsPubPlugin2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ItsPubPlugin2*, UInt32),
    release : Proc(ItsPubPlugin2*, UInt32),
    get_resource_list : Proc(ItsPubPlugin2*, Win32cr::Foundation::PWSTR, Int32*, Win32cr::System::RemoteDesktop::Pluginresource**, Win32cr::Foundation::HRESULT),
    get_resource : Proc(ItsPubPlugin2*, Win32cr::Foundation::PWSTR, Int32, Win32cr::System::RemoteDesktop::Pluginresource*, Win32cr::Foundation::HRESULT),
    get_cache_last_update_time : Proc(ItsPubPlugin2*, UInt64*, Win32cr::Foundation::HRESULT),
    get_pluginName : Proc(ItsPubPlugin2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pluginVersion : Proc(ItsPubPlugin2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    resolve_resource : Proc(ItsPubPlugin2*, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_resource2_list : Proc(ItsPubPlugin2*, Win32cr::Foundation::PWSTR, Int32*, Win32cr::System::RemoteDesktop::Pluginresource2**, Win32cr::Foundation::HRESULT),
    get_resource2 : Proc(ItsPubPlugin2*, Win32cr::Foundation::PWSTR, Int32, Win32cr::System::RemoteDesktop::Pluginresource2*, Win32cr::Foundation::HRESULT),
    resolve_personal_desktop : Proc(ItsPubPlugin2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::RemoteDesktop::TSPUB_PLUGIN_PD_RESOLUTION_TYPE, Win32cr::System::RemoteDesktop::TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete_personal_desktop_assignment : Proc(ItsPubPlugin2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fa4ce418-aad7-4ec6-bad1-0a321ba465d5")]
  record ItsPubPlugin2, lpVtbl : ItsPubPlugin2Vtbl* do
    GUID = LibC::GUID.new(0xfa4ce418_u32, 0xaad7_u16, 0x4ec6_u16, StaticArray[0xba_u8, 0xd1_u8, 0xa_u8, 0x32_u8, 0x1b_u8, 0xa4_u8, 0x65_u8, 0xd5_u8])
    def query_interface(this : ItsPubPlugin2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ItsPubPlugin2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ItsPubPlugin2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_resource_list(this : ItsPubPlugin2*, userID : Win32cr::Foundation::PWSTR, pceAppListSize : Int32*, resourceList : Win32cr::System::RemoteDesktop::Pluginresource**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_list.call(this, userID, pceAppListSize, resourceList)
    end
    def get_resource(this : ItsPubPlugin2*, alias__ : Win32cr::Foundation::PWSTR, flags : Int32, resource : Win32cr::System::RemoteDesktop::Pluginresource*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource.call(this, alias__, flags, resource)
    end
    def get_cache_last_update_time(this : ItsPubPlugin2*, lastUpdateTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cache_last_update_time.call(this, lastUpdateTime)
    end
    def get_pluginName(this : ItsPubPlugin2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pluginName.call(this, pVal)
    end
    def get_pluginVersion(this : ItsPubPlugin2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pluginVersion.call(this, pVal)
    end
    def resolve_resource(this : ItsPubPlugin2*, resourceType : UInt32*, resourceLocation : Win32cr::Foundation::PWSTR, endPointName : Win32cr::Foundation::PWSTR, userID : Win32cr::Foundation::PWSTR, alias__ : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_resource.call(this, resourceType, resourceLocation, endPointName, userID, alias__)
    end
    def get_resource2_list(this : ItsPubPlugin2*, userID : Win32cr::Foundation::PWSTR, pceAppListSize : Int32*, resourceList : Win32cr::System::RemoteDesktop::Pluginresource2**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource2_list.call(this, userID, pceAppListSize, resourceList)
    end
    def get_resource2(this : ItsPubPlugin2*, alias__ : Win32cr::Foundation::PWSTR, flags : Int32, resource : Win32cr::System::RemoteDesktop::Pluginresource2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource2.call(this, alias__, flags, resource)
    end
    def resolve_personal_desktop(this : ItsPubPlugin2*, userId : Win32cr::Foundation::PWSTR, poolId : Win32cr::Foundation::PWSTR, ePdResolutionType : Win32cr::System::RemoteDesktop::TSPUB_PLUGIN_PD_RESOLUTION_TYPE, pPdAssignmentType : Win32cr::System::RemoteDesktop::TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE*, endPointName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_personal_desktop.call(this, userId, poolId, ePdResolutionType, pPdAssignmentType, endPointName)
    end
    def delete_personal_desktop_assignment(this : ItsPubPlugin2*, userId : Win32cr::Foundation::PWSTR, poolId : Win32cr::Foundation::PWSTR, endpointName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_personal_desktop_assignment.call(this, userId, poolId, endpointName)
    end

  end

  @[Extern]
  record IWorkspaceResTypeRegistryVtbl,
    query_interface : Proc(IWorkspaceResTypeRegistry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWorkspaceResTypeRegistry*, UInt32),
    release : Proc(IWorkspaceResTypeRegistry*, UInt32),
    get_type_info_count : Proc(IWorkspaceResTypeRegistry*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWorkspaceResTypeRegistry*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWorkspaceResTypeRegistry*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWorkspaceResTypeRegistry*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    add_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_registered_file_extensions : Proc(IWorkspaceResTypeRegistry*, Int16, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_resource_type_info : Proc(IWorkspaceResTypeRegistry*, Int16, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    modify_resource_type : Proc(IWorkspaceResTypeRegistry*, Int16, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1d428c79-6e2e-4351-a361-c0401a03a0ba")]
  record IWorkspaceResTypeRegistry, lpVtbl : IWorkspaceResTypeRegistryVtbl* do
    GUID = LibC::GUID.new(0x1d428c79_u32, 0x6e2e_u16, 0x4351_u16, StaticArray[0xa3_u8, 0x61_u8, 0xc0_u8, 0x40_u8, 0x1a_u8, 0x3_u8, 0xa0_u8, 0xba_u8])
    def query_interface(this : IWorkspaceResTypeRegistry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWorkspaceResTypeRegistry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWorkspaceResTypeRegistry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWorkspaceResTypeRegistry*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWorkspaceResTypeRegistry*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWorkspaceResTypeRegistry*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWorkspaceResTypeRegistry*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def add_resource_type(this : IWorkspaceResTypeRegistry*, fMachineWide : Int16, bstrFileExtension : Win32cr::Foundation::BSTR, bstrLauncher : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource_type.call(this, fMachineWide, bstrFileExtension, bstrLauncher)
    end
    def delete_resource_type(this : IWorkspaceResTypeRegistry*, fMachineWide : Int16, bstrFileExtension : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_resource_type.call(this, fMachineWide, bstrFileExtension)
    end
    def get_registered_file_extensions(this : IWorkspaceResTypeRegistry*, fMachineWide : Int16, psaFileExtensions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registered_file_extensions.call(this, fMachineWide, psaFileExtensions)
    end
    def get_resource_type_info(this : IWorkspaceResTypeRegistry*, fMachineWide : Int16, bstrFileExtension : Win32cr::Foundation::BSTR, pbstrLauncher : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_type_info.call(this, fMachineWide, bstrFileExtension, pbstrLauncher)
    end
    def modify_resource_type(this : IWorkspaceResTypeRegistry*, fMachineWide : Int16, bstrFileExtension : Win32cr::Foundation::BSTR, bstrLauncher : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_resource_type.call(this, fMachineWide, bstrFileExtension, bstrLauncher)
    end

  end

  @[Extern]
  record IWTSPluginVtbl,
    query_interface : Proc(IWTSPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSPlugin*, UInt32),
    release : Proc(IWTSPlugin*, UInt32),
    initialize__ : Proc(IWTSPlugin*, Void*, Win32cr::Foundation::HRESULT),
    connected : Proc(IWTSPlugin*, Win32cr::Foundation::HRESULT),
    disconnected : Proc(IWTSPlugin*, UInt32, Win32cr::Foundation::HRESULT),
    terminated : Proc(IWTSPlugin*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1230201-1439-4e62-a414-190d0ac3d40e")]
  record IWTSPlugin, lpVtbl : IWTSPluginVtbl* do
    GUID = LibC::GUID.new(0xa1230201_u32, 0x1439_u16, 0x4e62_u16, StaticArray[0xa4_u8, 0x14_u8, 0x19_u8, 0xd_u8, 0xa_u8, 0xc3_u8, 0xd4_u8, 0xe_u8])
    def query_interface(this : IWTSPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWTSPlugin*, pChannelMgr : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pChannelMgr)
    end
    def connected(this : IWTSPlugin*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connected.call(this)
    end
    def disconnected(this : IWTSPlugin*, dwDisconnectCode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnected.call(this, dwDisconnectCode)
    end
    def terminated(this : IWTSPlugin*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminated.call(this)
    end

  end

  @[Extern]
  record IWTSListenerVtbl,
    query_interface : Proc(IWTSListener*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSListener*, UInt32),
    release : Proc(IWTSListener*, UInt32),
    get_configuration : Proc(IWTSListener*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1230206-9a39-4d58-8674-cdb4dff4e73b")]
  record IWTSListener, lpVtbl : IWTSListenerVtbl* do
    GUID = LibC::GUID.new(0xa1230206_u32, 0x9a39_u16, 0x4d58_u16, StaticArray[0x86_u8, 0x74_u8, 0xcd_u8, 0xb4_u8, 0xdf_u8, 0xf4_u8, 0xe7_u8, 0x3b_u8])
    def query_interface(this : IWTSListener*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSListener*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSListener*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_configuration(this : IWTSListener*, ppPropertyBag : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_configuration.call(this, ppPropertyBag)
    end

  end

  @[Extern]
  record IWTSListenerCallbackVtbl,
    query_interface : Proc(IWTSListenerCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSListenerCallback*, UInt32),
    release : Proc(IWTSListenerCallback*, UInt32),
    on_new_channel_connection : Proc(IWTSListenerCallback*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1230203-d6a7-11d8-b9fd-000bdbd1f198")]
  record IWTSListenerCallback, lpVtbl : IWTSListenerCallbackVtbl* do
    GUID = LibC::GUID.new(0xa1230203_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
    def query_interface(this : IWTSListenerCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSListenerCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSListenerCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_new_channel_connection(this : IWTSListenerCallback*, pChannel : Void*, data : Win32cr::Foundation::BSTR, pbAccept : Win32cr::Foundation::BOOL*, ppCallback : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_new_channel_connection.call(this, pChannel, data, pbAccept, ppCallback)
    end

  end

  @[Extern]
  record IWTSVirtualChannelCallbackVtbl,
    query_interface : Proc(IWTSVirtualChannelCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSVirtualChannelCallback*, UInt32),
    release : Proc(IWTSVirtualChannelCallback*, UInt32),
    on_data_received : Proc(IWTSVirtualChannelCallback*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    on_close : Proc(IWTSVirtualChannelCallback*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1230204-d6a7-11d8-b9fd-000bdbd1f198")]
  record IWTSVirtualChannelCallback, lpVtbl : IWTSVirtualChannelCallbackVtbl* do
    GUID = LibC::GUID.new(0xa1230204_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
    def query_interface(this : IWTSVirtualChannelCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSVirtualChannelCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSVirtualChannelCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_data_received(this : IWTSVirtualChannelCallback*, cbSize : UInt32, pBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_received.call(this, cbSize, pBuffer)
    end
    def on_close(this : IWTSVirtualChannelCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_close.call(this)
    end

  end

  @[Extern]
  record IWTSVirtualChannelManagerVtbl,
    query_interface : Proc(IWTSVirtualChannelManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSVirtualChannelManager*, UInt32),
    release : Proc(IWTSVirtualChannelManager*, UInt32),
    create_listener : Proc(IWTSVirtualChannelManager*, UInt8*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1230205-d6a7-11d8-b9fd-000bdbd1f198")]
  record IWTSVirtualChannelManager, lpVtbl : IWTSVirtualChannelManagerVtbl* do
    GUID = LibC::GUID.new(0xa1230205_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
    def query_interface(this : IWTSVirtualChannelManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSVirtualChannelManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSVirtualChannelManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_listener(this : IWTSVirtualChannelManager*, pszChannelName : UInt8*, uFlags : UInt32, pListenerCallback : Void*, ppListener : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_listener.call(this, pszChannelName, uFlags, pListenerCallback, ppListener)
    end

  end

  @[Extern]
  record IWTSVirtualChannelVtbl,
    query_interface : Proc(IWTSVirtualChannel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSVirtualChannel*, UInt32),
    release : Proc(IWTSVirtualChannel*, UInt32),
    write : Proc(IWTSVirtualChannel*, UInt32, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IWTSVirtualChannel*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1230207-d6a7-11d8-b9fd-000bdbd1f198")]
  record IWTSVirtualChannel, lpVtbl : IWTSVirtualChannelVtbl* do
    GUID = LibC::GUID.new(0xa1230207_u32, 0xd6a7_u16, 0x11d8_u16, StaticArray[0xb9_u8, 0xfd_u8, 0x0_u8, 0xb_u8, 0xdb_u8, 0xd1_u8, 0xf1_u8, 0x98_u8])
    def query_interface(this : IWTSVirtualChannel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSVirtualChannel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSVirtualChannel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def write(this : IWTSVirtualChannel*, cbSize : UInt32, pBuffer : UInt8*, pReserved : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, cbSize, pBuffer, pReserved)
    end
    def close(this : IWTSVirtualChannel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IWTSPluginServiceProviderVtbl,
    query_interface : Proc(IWTSPluginServiceProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSPluginServiceProvider*, UInt32),
    release : Proc(IWTSPluginServiceProvider*, UInt32),
    get_service : Proc(IWTSPluginServiceProvider*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d3e07363-087c-476c-86a7-dbb15f46ddb4")]
  record IWTSPluginServiceProvider, lpVtbl : IWTSPluginServiceProviderVtbl* do
    GUID = LibC::GUID.new(0xd3e07363_u32, 0x87c_u16, 0x476c_u16, StaticArray[0x86_u8, 0xa7_u8, 0xdb_u8, 0xb1_u8, 0x5f_u8, 0x46_u8, 0xdd_u8, 0xb4_u8])
    def query_interface(this : IWTSPluginServiceProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSPluginServiceProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSPluginServiceProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_service(this : IWTSPluginServiceProvider*, service_id : LibC::GUID, ppunkObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service.call(this, service_id, ppunkObject)
    end

  end

  @[Extern]
  record IWTSBitmapRendererVtbl,
    query_interface : Proc(IWTSBitmapRenderer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSBitmapRenderer*, UInt32),
    release : Proc(IWTSBitmapRenderer*, UInt32),
    render : Proc(IWTSBitmapRenderer*, LibC::GUID, UInt32, UInt32, Int32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_renderer_statistics : Proc(IWTSBitmapRenderer*, Win32cr::System::RemoteDesktop::BITMAP_RENDERER_STATISTICS*, Win32cr::Foundation::HRESULT),
    remove_mapping : Proc(IWTSBitmapRenderer*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5b7acc97-f3c9-46f7-8c5b-fa685d3441b1")]
  record IWTSBitmapRenderer, lpVtbl : IWTSBitmapRendererVtbl* do
    GUID = LibC::GUID.new(0x5b7acc97_u32, 0xf3c9_u16, 0x46f7_u16, StaticArray[0x8c_u8, 0x5b_u8, 0xfa_u8, 0x68_u8, 0x5d_u8, 0x34_u8, 0x41_u8, 0xb1_u8])
    def query_interface(this : IWTSBitmapRenderer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSBitmapRenderer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSBitmapRenderer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def render(this : IWTSBitmapRenderer*, imageFormat : LibC::GUID, dwWidth : UInt32, dwHeight : UInt32, cbStride : Int32, cbImageBuffer : UInt32, pImageBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render.call(this, imageFormat, dwWidth, dwHeight, cbStride, cbImageBuffer, pImageBuffer)
    end
    def get_renderer_statistics(this : IWTSBitmapRenderer*, pStatistics : Win32cr::System::RemoteDesktop::BITMAP_RENDERER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_renderer_statistics.call(this, pStatistics)
    end
    def remove_mapping(this : IWTSBitmapRenderer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_mapping.call(this)
    end

  end

  @[Extern]
  record IWTSBitmapRendererCallbackVtbl,
    query_interface : Proc(IWTSBitmapRendererCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSBitmapRendererCallback*, UInt32),
    release : Proc(IWTSBitmapRendererCallback*, UInt32),
    on_target_size_changed : Proc(IWTSBitmapRendererCallback*, Win32cr::Foundation::RECT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d782928e-fe4e-4e77-ae90-9cd0b3e3b353")]
  record IWTSBitmapRendererCallback, lpVtbl : IWTSBitmapRendererCallbackVtbl* do
    GUID = LibC::GUID.new(0xd782928e_u32, 0xfe4e_u16, 0x4e77_u16, StaticArray[0xae_u8, 0x90_u8, 0x9c_u8, 0xd0_u8, 0xb3_u8, 0xe3_u8, 0xb3_u8, 0x53_u8])
    def query_interface(this : IWTSBitmapRendererCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSBitmapRendererCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSBitmapRendererCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_target_size_changed(this : IWTSBitmapRendererCallback*, rcNewSize : Win32cr::Foundation::RECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_target_size_changed.call(this, rcNewSize)
    end

  end

  @[Extern]
  record IWTSBitmapRenderServiceVtbl,
    query_interface : Proc(IWTSBitmapRenderService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSBitmapRenderService*, UInt32),
    release : Proc(IWTSBitmapRenderService*, UInt32),
    get_mapped_renderer : Proc(IWTSBitmapRenderService*, UInt64, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea326091-05fe-40c1-b49c-3d2ef4626a0e")]
  record IWTSBitmapRenderService, lpVtbl : IWTSBitmapRenderServiceVtbl* do
    GUID = LibC::GUID.new(0xea326091_u32, 0x5fe_u16, 0x40c1_u16, StaticArray[0xb4_u8, 0x9c_u8, 0x3d_u8, 0x2e_u8, 0xf4_u8, 0x62_u8, 0x6a_u8, 0xe_u8])
    def query_interface(this : IWTSBitmapRenderService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSBitmapRenderService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSBitmapRenderService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_mapped_renderer(this : IWTSBitmapRenderService*, mappingId : UInt64, pMappedRendererCallback : Void*, ppMappedRenderer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mapped_renderer.call(this, mappingId, pMappedRendererCallback, ppMappedRenderer)
    end

  end

  @[Extern]
  record IWRdsGraphicsChannelEventsVtbl,
    query_interface : Proc(IWRdsGraphicsChannelEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsGraphicsChannelEvents*, UInt32),
    release : Proc(IWRdsGraphicsChannelEvents*, UInt32),
    on_data_received : Proc(IWRdsGraphicsChannelEvents*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    on_close : Proc(IWRdsGraphicsChannelEvents*, Win32cr::Foundation::HRESULT),
    on_channel_opened : Proc(IWRdsGraphicsChannelEvents*, Win32cr::Foundation::HRESULT, Void*, Win32cr::Foundation::HRESULT),
    on_data_sent : Proc(IWRdsGraphicsChannelEvents*, Void*, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    on_metrics_update : Proc(IWRdsGraphicsChannelEvents*, UInt32, UInt32, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("67f2368c-d674-4fae-66a5-d20628a640d2")]
  record IWRdsGraphicsChannelEvents, lpVtbl : IWRdsGraphicsChannelEventsVtbl* do
    GUID = LibC::GUID.new(0x67f2368c_u32, 0xd674_u16, 0x4fae_u16, StaticArray[0x66_u8, 0xa5_u8, 0xd2_u8, 0x6_u8, 0x28_u8, 0xa6_u8, 0x40_u8, 0xd2_u8])
    def query_interface(this : IWRdsGraphicsChannelEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsGraphicsChannelEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsGraphicsChannelEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_data_received(this : IWRdsGraphicsChannelEvents*, cbSize : UInt32, pBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_received.call(this, cbSize, pBuffer)
    end
    def on_close(this : IWRdsGraphicsChannelEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_close.call(this)
    end
    def on_channel_opened(this : IWRdsGraphicsChannelEvents*, open_result : Win32cr::Foundation::HRESULT, pOpenContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_channel_opened.call(this, open_result, pOpenContext)
    end
    def on_data_sent(this : IWRdsGraphicsChannelEvents*, pWriteContext : Void*, bCancelled : Win32cr::Foundation::BOOL, pBuffer : UInt8*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_sent.call(this, pWriteContext, bCancelled, pBuffer, cbBuffer)
    end
    def on_metrics_update(this : IWRdsGraphicsChannelEvents*, bandwidth : UInt32, rtt : UInt32, lastSentByteIndex : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_metrics_update.call(this, bandwidth, rtt, lastSentByteIndex)
    end

  end

  @[Extern]
  record IWRdsGraphicsChannelVtbl,
    query_interface : Proc(IWRdsGraphicsChannel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsGraphicsChannel*, UInt32),
    release : Proc(IWRdsGraphicsChannel*, UInt32),
    write : Proc(IWRdsGraphicsChannel*, UInt32, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IWRdsGraphicsChannel*, Win32cr::Foundation::HRESULT),
    open : Proc(IWRdsGraphicsChannel*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("684b7a0b-edff-43ad-d5a2-4a8d5388f401")]
  record IWRdsGraphicsChannel, lpVtbl : IWRdsGraphicsChannelVtbl* do
    GUID = LibC::GUID.new(0x684b7a0b_u32, 0xedff_u16, 0x43ad_u16, StaticArray[0xd5_u8, 0xa2_u8, 0x4a_u8, 0x8d_u8, 0x53_u8, 0x88_u8, 0xf4_u8, 0x1_u8])
    def query_interface(this : IWRdsGraphicsChannel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsGraphicsChannel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsGraphicsChannel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def write(this : IWRdsGraphicsChannel*, cbSize : UInt32, pBuffer : UInt8*, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, cbSize, pBuffer, pContext)
    end
    def close(this : IWRdsGraphicsChannel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def open(this : IWRdsGraphicsChannel*, pChannelEvents : Void*, pOpenContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pChannelEvents, pOpenContext)
    end

  end

  @[Extern]
  record IWRdsGraphicsChannelManagerVtbl,
    query_interface : Proc(IWRdsGraphicsChannelManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsGraphicsChannelManager*, UInt32),
    release : Proc(IWRdsGraphicsChannelManager*, UInt32),
    create_channel : Proc(IWRdsGraphicsChannelManager*, UInt8*, Win32cr::System::RemoteDesktop::WRdsGraphicsChannelType, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0fd57159-e83e-476a-a8b9-4a7976e71e18")]
  record IWRdsGraphicsChannelManager, lpVtbl : IWRdsGraphicsChannelManagerVtbl* do
    GUID = LibC::GUID.new(0xfd57159_u32, 0xe83e_u16, 0x476a_u16, StaticArray[0xa8_u8, 0xb9_u8, 0x4a_u8, 0x79_u8, 0x76_u8, 0xe7_u8, 0x1e_u8, 0x18_u8])
    def query_interface(this : IWRdsGraphicsChannelManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsGraphicsChannelManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsGraphicsChannelManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_channel(this : IWRdsGraphicsChannelManager*, pszChannelName : UInt8*, channelType : Win32cr::System::RemoteDesktop::WRdsGraphicsChannelType, ppVirtualChannel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_channel.call(this, pszChannelName, channelType, ppVirtualChannel)
    end

  end

  @[Extern]
  record IWTSProtocolManagerVtbl,
    query_interface : Proc(IWTSProtocolManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolManager*, UInt32),
    release : Proc(IWTSProtocolManager*, UInt32),
    create_listener : Proc(IWTSProtocolManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    notify_service_state_change : Proc(IWTSProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SERVICE_STATE*, Win32cr::Foundation::HRESULT),
    notify_session_of_service_start : Proc(IWTSProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    notify_session_of_service_stop : Proc(IWTSProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    notify_session_state_change : Proc(IWTSProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f9eaf6cc-ed79-4f01-821d-1f881b9f66cc")]
  record IWTSProtocolManager, lpVtbl : IWTSProtocolManagerVtbl* do
    GUID = LibC::GUID.new(0xf9eaf6cc_u32, 0xed79_u16, 0x4f01_u16, StaticArray[0x82_u8, 0x1d_u8, 0x1f_u8, 0x88_u8, 0x1b_u8, 0x9f_u8, 0x66_u8, 0xcc_u8])
    def query_interface(this : IWTSProtocolManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_listener(this : IWTSProtocolManager*, wszListenerName : Win32cr::Foundation::PWSTR, pProtocolListener : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_listener.call(this, wszListenerName, pProtocolListener)
    end
    def notify_service_state_change(this : IWTSProtocolManager*, pTSServiceStateChange : Win32cr::System::RemoteDesktop::WTS_SERVICE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_service_state_change.call(this, pTSServiceStateChange)
    end
    def notify_session_of_service_start(this : IWTSProtocolManager*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_of_service_start.call(this, session_id)
    end
    def notify_session_of_service_stop(this : IWTSProtocolManager*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_of_service_stop.call(this, session_id)
    end
    def notify_session_state_change(this : IWTSProtocolManager*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, event_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_state_change.call(this, session_id, event_id)
    end

  end

  @[Extern]
  record IWTSProtocolListenerVtbl,
    query_interface : Proc(IWTSProtocolListener*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolListener*, UInt32),
    release : Proc(IWTSProtocolListener*, UInt32),
    start_listen : Proc(IWTSProtocolListener*, Void*, Win32cr::Foundation::HRESULT),
    stop_listen : Proc(IWTSProtocolListener*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("23083765-45f0-4394-8f69-32b2bc0ef4ca")]
  record IWTSProtocolListener, lpVtbl : IWTSProtocolListenerVtbl* do
    GUID = LibC::GUID.new(0x23083765_u32, 0x45f0_u16, 0x4394_u16, StaticArray[0x8f_u8, 0x69_u8, 0x32_u8, 0xb2_u8, 0xbc_u8, 0xe_u8, 0xf4_u8, 0xca_u8])
    def query_interface(this : IWTSProtocolListener*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolListener*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolListener*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_listen(this : IWTSProtocolListener*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_listen.call(this, pCallback)
    end
    def stop_listen(this : IWTSProtocolListener*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_listen.call(this)
    end

  end

  @[Extern]
  record IWTSProtocolListenerCallbackVtbl,
    query_interface : Proc(IWTSProtocolListenerCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolListenerCallback*, UInt32),
    release : Proc(IWTSProtocolListenerCallback*, UInt32),
    on_connected : Proc(IWTSProtocolListenerCallback*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("23083765-1a2d-4de2-97de-4a35f260f0b3")]
  record IWTSProtocolListenerCallback, lpVtbl : IWTSProtocolListenerCallbackVtbl* do
    GUID = LibC::GUID.new(0x23083765_u32, 0x1a2d_u16, 0x4de2_u16, StaticArray[0x97_u8, 0xde_u8, 0x4a_u8, 0x35_u8, 0xf2_u8, 0x60_u8, 0xf0_u8, 0xb3_u8])
    def query_interface(this : IWTSProtocolListenerCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolListenerCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolListenerCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_connected(this : IWTSProtocolListenerCallback*, pConnection : Void*, pCallback : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connected.call(this, pConnection, pCallback)
    end

  end

  @[Extern]
  record IWTSProtocolConnectionVtbl,
    query_interface : Proc(IWTSProtocolConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolConnection*, UInt32),
    release : Proc(IWTSProtocolConnection*, UInt32),
    get_logon_error_redirector : Proc(IWTSProtocolConnection*, Void**, Win32cr::Foundation::HRESULT),
    send_policy_data : Proc(IWTSProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_POLICY_DATA*, Win32cr::Foundation::HRESULT),
    accept_connection : Proc(IWTSProtocolConnection*, Win32cr::Foundation::HRESULT),
    get_client_data : Proc(IWTSProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_CLIENT_DATA*, Win32cr::Foundation::HRESULT),
    get_user_credentials : Proc(IWTSProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_USER_CREDENTIAL*, Win32cr::Foundation::HRESULT),
    get_license_connection : Proc(IWTSProtocolConnection*, Void**, Win32cr::Foundation::HRESULT),
    authenticate_client_to_session : Proc(IWTSProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    notify_session_id : Proc(IWTSProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    get_protocol_handles : Proc(IWTSProtocolConnection*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HRESULT),
    connect_notify : Proc(IWTSProtocolConnection*, UInt32, Win32cr::Foundation::HRESULT),
    is_user_allowed_to_logon : Proc(IWTSProtocolConnection*, UInt32, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    session_arbitration_enumeration : Proc(IWTSProtocolConnection*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::BOOL, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    logon_notify : Proc(IWTSProtocolConnection*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    get_user_data : Proc(IWTSProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_POLICY_DATA*, Win32cr::System::RemoteDesktop::WTS_USER_DATA*, Win32cr::Foundation::HRESULT),
    disconnect_notify : Proc(IWTSProtocolConnection*, Win32cr::Foundation::HRESULT),
    close : Proc(IWTSProtocolConnection*, Win32cr::Foundation::HRESULT),
    get_protocol_status : Proc(IWTSProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_PROTOCOL_STATUS*, Win32cr::Foundation::HRESULT),
    get_last_input_time : Proc(IWTSProtocolConnection*, UInt64*, Win32cr::Foundation::HRESULT),
    set_error_info : Proc(IWTSProtocolConnection*, UInt32, Win32cr::Foundation::HRESULT),
    send_beep : Proc(IWTSProtocolConnection*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    create_virtual_channel : Proc(IWTSProtocolConnection*, Win32cr::Foundation::PSTR, Win32cr::Foundation::BOOL, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    query_property : Proc(IWTSProtocolConnection*, LibC::GUID, UInt32, UInt32, Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, Win32cr::Foundation::HRESULT),
    get_shadow_connection : Proc(IWTSProtocolConnection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("23083765-9095-4648-98bf-ef81c914032d")]
  record IWTSProtocolConnection, lpVtbl : IWTSProtocolConnectionVtbl* do
    GUID = LibC::GUID.new(0x23083765_u32, 0x9095_u16, 0x4648_u16, StaticArray[0x98_u8, 0xbf_u8, 0xef_u8, 0x81_u8, 0xc9_u8, 0x14_u8, 0x3_u8, 0x2d_u8])
    def query_interface(this : IWTSProtocolConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_logon_error_redirector(this : IWTSProtocolConnection*, ppLogonErrorRedir : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logon_error_redirector.call(this, ppLogonErrorRedir)
    end
    def send_policy_data(this : IWTSProtocolConnection*, pPolicyData : Win32cr::System::RemoteDesktop::WTS_POLICY_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_policy_data.call(this, pPolicyData)
    end
    def accept_connection(this : IWTSProtocolConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_connection.call(this)
    end
    def get_client_data(this : IWTSProtocolConnection*, pClientData : Win32cr::System::RemoteDesktop::WTS_CLIENT_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_data.call(this, pClientData)
    end
    def get_user_credentials(this : IWTSProtocolConnection*, pUserCreds : Win32cr::System::RemoteDesktop::WTS_USER_CREDENTIAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_credentials.call(this, pUserCreds)
    end
    def get_license_connection(this : IWTSProtocolConnection*, ppLicenseConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_license_connection.call(this, ppLicenseConnection)
    end
    def authenticate_client_to_session(this : IWTSProtocolConnection*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authenticate_client_to_session.call(this, session_id)
    end
    def notify_session_id(this : IWTSProtocolConnection*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_id.call(this, session_id)
    end
    def get_protocol_handles(this : IWTSProtocolConnection*, pKeyboardHandle : Win32cr::Foundation::HANDLE_PTR*, pMouseHandle : Win32cr::Foundation::HANDLE_PTR*, pBeepHandle : Win32cr::Foundation::HANDLE_PTR*, pVideoHandle : Win32cr::Foundation::HANDLE_PTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_handles.call(this, pKeyboardHandle, pMouseHandle, pBeepHandle, pVideoHandle)
    end
    def connect_notify(this : IWTSProtocolConnection*, session_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_notify.call(this, session_id)
    end
    def is_user_allowed_to_logon(this : IWTSProtocolConnection*, session_id : UInt32, user_token : Win32cr::Foundation::HANDLE_PTR, pDomainName : Win32cr::Foundation::PWSTR, pUserName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_user_allowed_to_logon.call(this, session_id, user_token, pDomainName, pUserName)
    end
    def session_arbitration_enumeration(this : IWTSProtocolConnection*, hUserToken : Win32cr::Foundation::HANDLE_PTR, bSingleSessionPerUserEnabled : Win32cr::Foundation::BOOL, pSessionIdArray : UInt32*, pdwSessionIdentifierCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.session_arbitration_enumeration.call(this, hUserToken, bSingleSessionPerUserEnabled, pSessionIdArray, pdwSessionIdentifierCount)
    end
    def logon_notify(this : IWTSProtocolConnection*, hClientToken : Win32cr::Foundation::HANDLE_PTR, wszUserName : Win32cr::Foundation::PWSTR, wszDomainName : Win32cr::Foundation::PWSTR, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.logon_notify.call(this, hClientToken, wszUserName, wszDomainName, session_id)
    end
    def get_user_data(this : IWTSProtocolConnection*, pPolicyData : Win32cr::System::RemoteDesktop::WTS_POLICY_DATA*, pClientData : Win32cr::System::RemoteDesktop::WTS_USER_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_data.call(this, pPolicyData, pClientData)
    end
    def disconnect_notify(this : IWTSProtocolConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_notify.call(this)
    end
    def close(this : IWTSProtocolConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_protocol_status(this : IWTSProtocolConnection*, pProtocolStatus : Win32cr::System::RemoteDesktop::WTS_PROTOCOL_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_status.call(this, pProtocolStatus)
    end
    def get_last_input_time(this : IWTSProtocolConnection*, pLastInputTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_input_time.call(this, pLastInputTime)
    end
    def set_error_info(this : IWTSProtocolConnection*, ulError : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_error_info.call(this, ulError)
    end
    def send_beep(this : IWTSProtocolConnection*, frequency : UInt32, duration : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_beep.call(this, frequency, duration)
    end
    def create_virtual_channel(this : IWTSProtocolConnection*, szEndpointName : Win32cr::Foundation::PSTR, bStatic : Win32cr::Foundation::BOOL, requested_priority : UInt32, phChannel : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_channel.call(this, szEndpointName, bStatic, requested_priority, phChannel)
    end
    def query_property(this : IWTSProtocolConnection*, query_type : LibC::GUID, ulNumEntriesIn : UInt32, ulNumEntriesOut : UInt32, pPropertyEntriesIn : Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, pPropertyEntriesOut : Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_property.call(this, query_type, ulNumEntriesIn, ulNumEntriesOut, pPropertyEntriesIn, pPropertyEntriesOut)
    end
    def get_shadow_connection(this : IWTSProtocolConnection*, ppShadowConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shadow_connection.call(this, ppShadowConnection)
    end

  end

  @[Extern]
  record IWTSProtocolConnectionCallbackVtbl,
    query_interface : Proc(IWTSProtocolConnectionCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolConnectionCallback*, UInt32),
    release : Proc(IWTSProtocolConnectionCallback*, UInt32),
    on_ready : Proc(IWTSProtocolConnectionCallback*, Win32cr::Foundation::HRESULT),
    broken_connection : Proc(IWTSProtocolConnectionCallback*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stop_screen_updates : Proc(IWTSProtocolConnectionCallback*, Win32cr::Foundation::HRESULT),
    redraw_window : Proc(IWTSProtocolConnectionCallback*, Win32cr::System::RemoteDesktop::WTS_SMALL_RECT*, Win32cr::Foundation::HRESULT),
    display_io_ctl : Proc(IWTSProtocolConnectionCallback*, Win32cr::System::RemoteDesktop::WTS_DISPLAY_IOCTL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("23083765-75eb-41fe-b4fb-e086242afa0f")]
  record IWTSProtocolConnectionCallback, lpVtbl : IWTSProtocolConnectionCallbackVtbl* do
    GUID = LibC::GUID.new(0x23083765_u32, 0x75eb_u16, 0x41fe_u16, StaticArray[0xb4_u8, 0xfb_u8, 0xe0_u8, 0x86_u8, 0x24_u8, 0x2a_u8, 0xfa_u8, 0xf_u8])
    def query_interface(this : IWTSProtocolConnectionCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolConnectionCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolConnectionCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_ready(this : IWTSProtocolConnectionCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ready.call(this)
    end
    def broken_connection(this : IWTSProtocolConnectionCallback*, reason : UInt32, source : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.broken_connection.call(this, reason, source)
    end
    def stop_screen_updates(this : IWTSProtocolConnectionCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_screen_updates.call(this)
    end
    def redraw_window(this : IWTSProtocolConnectionCallback*, rect : Win32cr::System::RemoteDesktop::WTS_SMALL_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redraw_window.call(this, rect)
    end
    def display_io_ctl(this : IWTSProtocolConnectionCallback*, display_io_ctl : Win32cr::System::RemoteDesktop::WTS_DISPLAY_IOCTL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_io_ctl.call(this, display_io_ctl)
    end

  end

  @[Extern]
  record IWTSProtocolShadowConnectionVtbl,
    query_interface : Proc(IWTSProtocolShadowConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolShadowConnection*, UInt32),
    release : Proc(IWTSProtocolShadowConnection*, UInt32),
    start : Proc(IWTSProtocolShadowConnection*, Win32cr::Foundation::PWSTR, UInt32, UInt8, UInt16, Void*, Win32cr::Foundation::HRESULT),
    stop : Proc(IWTSProtocolShadowConnection*, Win32cr::Foundation::HRESULT),
    do_target : Proc(IWTSProtocolShadowConnection*, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ee3b0c14-37fb-456b-bab3-6d6cd51e13bf")]
  record IWTSProtocolShadowConnection, lpVtbl : IWTSProtocolShadowConnectionVtbl* do
    GUID = LibC::GUID.new(0xee3b0c14_u32, 0x37fb_u16, 0x456b_u16, StaticArray[0xba_u8, 0xb3_u8, 0x6d_u8, 0x6c_u8, 0xd5_u8, 0x1e_u8, 0x13_u8, 0xbf_u8])
    def query_interface(this : IWTSProtocolShadowConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolShadowConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolShadowConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IWTSProtocolShadowConnection*, pTargetServerName : Win32cr::Foundation::PWSTR, target_session_id : UInt32, hot_key_vk : UInt8, hotkey_modifiers : UInt16, pShadowCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, pTargetServerName, target_session_id, hot_key_vk, hotkey_modifiers, pShadowCallback)
    end
    def stop(this : IWTSProtocolShadowConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def do_target(this : IWTSProtocolShadowConnection*, pParam1 : UInt8*, param1_size : UInt32, pParam2 : UInt8*, param2_size : UInt32, pParam3 : UInt8*, param3_size : UInt32, pParam4 : UInt8*, param4_size : UInt32, pClientName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_target.call(this, pParam1, param1_size, pParam2, param2_size, pParam3, param3_size, pParam4, param4_size, pClientName)
    end

  end

  @[Extern]
  record IWTSProtocolShadowCallbackVtbl,
    query_interface : Proc(IWTSProtocolShadowCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolShadowCallback*, UInt32),
    release : Proc(IWTSProtocolShadowCallback*, UInt32),
    stop_shadow : Proc(IWTSProtocolShadowCallback*, Win32cr::Foundation::HRESULT),
    invoke_target_shadow : Proc(IWTSProtocolShadowCallback*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("503a2504-aae5-4ab1-93e0-6d1c4bc6f71a")]
  record IWTSProtocolShadowCallback, lpVtbl : IWTSProtocolShadowCallbackVtbl* do
    GUID = LibC::GUID.new(0x503a2504_u32, 0xaae5_u16, 0x4ab1_u16, StaticArray[0x93_u8, 0xe0_u8, 0x6d_u8, 0x1c_u8, 0x4b_u8, 0xc6_u8, 0xf7_u8, 0x1a_u8])
    def query_interface(this : IWTSProtocolShadowCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolShadowCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolShadowCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def stop_shadow(this : IWTSProtocolShadowCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_shadow.call(this)
    end
    def invoke_target_shadow(this : IWTSProtocolShadowCallback*, pTargetServerName : Win32cr::Foundation::PWSTR, target_session_id : UInt32, pParam1 : UInt8*, param1_size : UInt32, pParam2 : UInt8*, param2_size : UInt32, pParam3 : UInt8*, param3_size : UInt32, pParam4 : UInt8*, param4_size : UInt32, pClientName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_target_shadow.call(this, pTargetServerName, target_session_id, pParam1, param1_size, pParam2, param2_size, pParam3, param3_size, pParam4, param4_size, pClientName)
    end

  end

  @[Extern]
  record IWTSProtocolLicenseConnectionVtbl,
    query_interface : Proc(IWTSProtocolLicenseConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolLicenseConnection*, UInt32),
    release : Proc(IWTSProtocolLicenseConnection*, UInt32),
    request_licensing_capabilities : Proc(IWTSProtocolLicenseConnection*, Win32cr::System::RemoteDesktop::WTS_LICENSE_CAPABILITIES*, UInt32*, Win32cr::Foundation::HRESULT),
    send_client_license : Proc(IWTSProtocolLicenseConnection*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    request_client_license : Proc(IWTSProtocolLicenseConnection*, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    protocol_complete : Proc(IWTSProtocolLicenseConnection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("23083765-178c-4079-8e4a-fea6496a4d70")]
  record IWTSProtocolLicenseConnection, lpVtbl : IWTSProtocolLicenseConnectionVtbl* do
    GUID = LibC::GUID.new(0x23083765_u32, 0x178c_u16, 0x4079_u16, StaticArray[0x8e_u8, 0x4a_u8, 0xfe_u8, 0xa6_u8, 0x49_u8, 0x6a_u8, 0x4d_u8, 0x70_u8])
    def query_interface(this : IWTSProtocolLicenseConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolLicenseConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolLicenseConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request_licensing_capabilities(this : IWTSProtocolLicenseConnection*, ppLicenseCapabilities : Win32cr::System::RemoteDesktop::WTS_LICENSE_CAPABILITIES*, pcbLicenseCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_licensing_capabilities.call(this, ppLicenseCapabilities, pcbLicenseCapabilities)
    end
    def send_client_license(this : IWTSProtocolLicenseConnection*, pClientLicense : UInt8*, cbClientLicense : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_client_license.call(this, pClientLicense, cbClientLicense)
    end
    def request_client_license(this : IWTSProtocolLicenseConnection*, reserve1 : UInt8*, reserve2 : UInt32, ppClientLicense : UInt8*, pcbClientLicense : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_client_license.call(this, reserve1, reserve2, ppClientLicense, pcbClientLicense)
    end
    def protocol_complete(this : IWTSProtocolLicenseConnection*, ulComplete : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.protocol_complete.call(this, ulComplete)
    end

  end

  @[Extern]
  record IWTSProtocolLogonErrorRedirectorVtbl,
    query_interface : Proc(IWTSProtocolLogonErrorRedirector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWTSProtocolLogonErrorRedirector*, UInt32),
    release : Proc(IWTSProtocolLogonErrorRedirector*, UInt32),
    on_begin_painting : Proc(IWTSProtocolLogonErrorRedirector*, Win32cr::Foundation::HRESULT),
    redirect_status : Proc(IWTSProtocolLogonErrorRedirector*, Win32cr::Foundation::PWSTR, Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, Win32cr::Foundation::HRESULT),
    redirect_message : Proc(IWTSProtocolLogonErrorRedirector*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, Win32cr::Foundation::HRESULT),
    redirect_logon_error : Proc(IWTSProtocolLogonErrorRedirector*, Int32, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fd9b61a7-2916-4627-8dee-4328711ad6cb")]
  record IWTSProtocolLogonErrorRedirector, lpVtbl : IWTSProtocolLogonErrorRedirectorVtbl* do
    GUID = LibC::GUID.new(0xfd9b61a7_u32, 0x2916_u16, 0x4627_u16, StaticArray[0x8d_u8, 0xee_u8, 0x43_u8, 0x28_u8, 0x71_u8, 0x1a_u8, 0xd6_u8, 0xcb_u8])
    def query_interface(this : IWTSProtocolLogonErrorRedirector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWTSProtocolLogonErrorRedirector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWTSProtocolLogonErrorRedirector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_begin_painting(this : IWTSProtocolLogonErrorRedirector*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_begin_painting.call(this)
    end
    def redirect_status(this : IWTSProtocolLogonErrorRedirector*, pszMessage : Win32cr::Foundation::PWSTR, pResponse : Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect_status.call(this, pszMessage, pResponse)
    end
    def redirect_message(this : IWTSProtocolLogonErrorRedirector*, pszCaption : Win32cr::Foundation::PWSTR, pszMessage : Win32cr::Foundation::PWSTR, uType : UInt32, pResponse : Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect_message.call(this, pszCaption, pszMessage, uType, pResponse)
    end
    def redirect_logon_error(this : IWTSProtocolLogonErrorRedirector*, ntsStatus : Int32, ntsSubstatus : Int32, pszCaption : Win32cr::Foundation::PWSTR, pszMessage : Win32cr::Foundation::PWSTR, uType : UInt32, pResponse : Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect_logon_error.call(this, ntsStatus, ntsSubstatus, pszCaption, pszMessage, uType, pResponse)
    end

  end

  @[Extern]
  record IWRdsProtocolSettingsVtbl,
    query_interface : Proc(IWRdsProtocolSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolSettings*, UInt32),
    release : Proc(IWRdsProtocolSettings*, UInt32),
    get_settings : Proc(IWRdsProtocolSettings*, Win32cr::System::RemoteDesktop::WRDS_SETTING_TYPE, Win32cr::System::RemoteDesktop::WRDS_SETTING_LEVEL, Win32cr::System::RemoteDesktop::WRDS_SETTINGS*, Win32cr::Foundation::HRESULT),
    merge_settings : Proc(IWRdsProtocolSettings*, Win32cr::System::RemoteDesktop::WRDS_SETTINGS*, Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTING_LEVEL, Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTINGS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("654a5a6a-2550-47eb-b6f7-ebd637475265")]
  record IWRdsProtocolSettings, lpVtbl : IWRdsProtocolSettingsVtbl* do
    GUID = LibC::GUID.new(0x654a5a6a_u32, 0x2550_u16, 0x47eb_u16, StaticArray[0xb6_u8, 0xf7_u8, 0xeb_u8, 0xd6_u8, 0x37_u8, 0x47_u8, 0x52_u8, 0x65_u8])
    def query_interface(this : IWRdsProtocolSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_settings(this : IWRdsProtocolSettings*, w_rds_setting_type : Win32cr::System::RemoteDesktop::WRDS_SETTING_TYPE, w_rds_setting_level : Win32cr::System::RemoteDesktop::WRDS_SETTING_LEVEL, pWRdsSettings : Win32cr::System::RemoteDesktop::WRDS_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_settings.call(this, w_rds_setting_type, w_rds_setting_level, pWRdsSettings)
    end
    def merge_settings(this : IWRdsProtocolSettings*, pWRdsSettings : Win32cr::System::RemoteDesktop::WRDS_SETTINGS*, w_rds_connection_setting_level : Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTING_LEVEL, pWRdsConnectionSettings : Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.merge_settings.call(this, pWRdsSettings, w_rds_connection_setting_level, pWRdsConnectionSettings)
    end

  end

  @[Extern]
  record IWRdsProtocolManagerVtbl,
    query_interface : Proc(IWRdsProtocolManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolManager*, UInt32),
    release : Proc(IWRdsProtocolManager*, UInt32),
    initialize__ : Proc(IWRdsProtocolManager*, Void*, Win32cr::System::RemoteDesktop::WRDS_SETTINGS*, Win32cr::Foundation::HRESULT),
    create_listener : Proc(IWRdsProtocolManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    notify_service_state_change : Proc(IWRdsProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SERVICE_STATE*, Win32cr::Foundation::HRESULT),
    notify_session_of_service_start : Proc(IWRdsProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    notify_session_of_service_stop : Proc(IWRdsProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    notify_session_state_change : Proc(IWRdsProtocolManager*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, UInt32, Win32cr::Foundation::HRESULT),
    notify_settings_change : Proc(IWRdsProtocolManager*, Win32cr::System::RemoteDesktop::WRDS_SETTINGS*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IWRdsProtocolManager*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dc796967-3abb-40cd-a446-105276b58950")]
  record IWRdsProtocolManager, lpVtbl : IWRdsProtocolManagerVtbl* do
    GUID = LibC::GUID.new(0xdc796967_u32, 0x3abb_u16, 0x40cd_u16, StaticArray[0xa4_u8, 0x46_u8, 0x10_u8, 0x52_u8, 0x76_u8, 0xb5_u8, 0x89_u8, 0x50_u8])
    def query_interface(this : IWRdsProtocolManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWRdsProtocolManager*, pIWRdsSettings : Void*, pWRdsSettings : Win32cr::System::RemoteDesktop::WRDS_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pIWRdsSettings, pWRdsSettings)
    end
    def create_listener(this : IWRdsProtocolManager*, wszListenerName : Win32cr::Foundation::PWSTR, pProtocolListener : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_listener.call(this, wszListenerName, pProtocolListener)
    end
    def notify_service_state_change(this : IWRdsProtocolManager*, pTSServiceStateChange : Win32cr::System::RemoteDesktop::WTS_SERVICE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_service_state_change.call(this, pTSServiceStateChange)
    end
    def notify_session_of_service_start(this : IWRdsProtocolManager*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_of_service_start.call(this, session_id)
    end
    def notify_session_of_service_stop(this : IWRdsProtocolManager*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_of_service_stop.call(this, session_id)
    end
    def notify_session_state_change(this : IWRdsProtocolManager*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, event_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_state_change.call(this, session_id, event_id)
    end
    def notify_settings_change(this : IWRdsProtocolManager*, pWRdsSettings : Win32cr::System::RemoteDesktop::WRDS_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_settings_change.call(this, pWRdsSettings)
    end
    def uninitialize(this : IWRdsProtocolManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninitialize.call(this)
    end

  end

  @[Extern]
  record IWRdsProtocolListenerVtbl,
    query_interface : Proc(IWRdsProtocolListener*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolListener*, UInt32),
    release : Proc(IWRdsProtocolListener*, UInt32),
    get_settings : Proc(IWRdsProtocolListener*, Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTING_LEVEL, Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTINGS*, Win32cr::Foundation::HRESULT),
    start_listen : Proc(IWRdsProtocolListener*, Void*, Win32cr::Foundation::HRESULT),
    stop_listen : Proc(IWRdsProtocolListener*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fcbc131b-c686-451d-a773-e279e230f540")]
  record IWRdsProtocolListener, lpVtbl : IWRdsProtocolListenerVtbl* do
    GUID = LibC::GUID.new(0xfcbc131b_u32, 0xc686_u16, 0x451d_u16, StaticArray[0xa7_u8, 0x73_u8, 0xe2_u8, 0x79_u8, 0xe2_u8, 0x30_u8, 0xf5_u8, 0x40_u8])
    def query_interface(this : IWRdsProtocolListener*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolListener*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolListener*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_settings(this : IWRdsProtocolListener*, w_rds_listener_setting_level : Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTING_LEVEL, pWRdsListenerSettings : Win32cr::System::RemoteDesktop::WRDS_LISTENER_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_settings.call(this, w_rds_listener_setting_level, pWRdsListenerSettings)
    end
    def start_listen(this : IWRdsProtocolListener*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_listen.call(this, pCallback)
    end
    def stop_listen(this : IWRdsProtocolListener*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_listen.call(this)
    end

  end

  @[Extern]
  record IWRdsProtocolListenerCallbackVtbl,
    query_interface : Proc(IWRdsProtocolListenerCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolListenerCallback*, UInt32),
    release : Proc(IWRdsProtocolListenerCallback*, UInt32),
    on_connected : Proc(IWRdsProtocolListenerCallback*, Void*, Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTINGS*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3ab27e5b-4449-4dc1-b74a-91621d4fe984")]
  record IWRdsProtocolListenerCallback, lpVtbl : IWRdsProtocolListenerCallbackVtbl* do
    GUID = LibC::GUID.new(0x3ab27e5b_u32, 0x4449_u16, 0x4dc1_u16, StaticArray[0xb7_u8, 0x4a_u8, 0x91_u8, 0x62_u8, 0x1d_u8, 0x4f_u8, 0xe9_u8, 0x84_u8])
    def query_interface(this : IWRdsProtocolListenerCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolListenerCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolListenerCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_connected(this : IWRdsProtocolListenerCallback*, pConnection : Void*, pWRdsConnectionSettings : Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTINGS*, pCallback : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connected.call(this, pConnection, pWRdsConnectionSettings, pCallback)
    end

  end

  @[Extern]
  record IWRdsProtocolConnectionVtbl,
    query_interface : Proc(IWRdsProtocolConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolConnection*, UInt32),
    release : Proc(IWRdsProtocolConnection*, UInt32),
    get_logon_error_redirector : Proc(IWRdsProtocolConnection*, Void**, Win32cr::Foundation::HRESULT),
    accept_connection : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::HRESULT),
    get_client_data : Proc(IWRdsProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_CLIENT_DATA*, Win32cr::Foundation::HRESULT),
    get_client_monitor_data : Proc(IWRdsProtocolConnection*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_user_credentials : Proc(IWRdsProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_USER_CREDENTIAL*, Win32cr::Foundation::HRESULT),
    get_license_connection : Proc(IWRdsProtocolConnection*, Void**, Win32cr::Foundation::HRESULT),
    authenticate_client_to_session : Proc(IWRdsProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HRESULT),
    notify_session_id : Proc(IWRdsProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::HRESULT),
    get_input_handles : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HRESULT),
    get_video_handle : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HRESULT),
    connect_notify : Proc(IWRdsProtocolConnection*, UInt32, Win32cr::Foundation::HRESULT),
    is_user_allowed_to_logon : Proc(IWRdsProtocolConnection*, UInt32, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    session_arbitration_enumeration : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::BOOL, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    logon_notify : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTINGS*, Win32cr::Foundation::HRESULT),
    pre_disconnect : Proc(IWRdsProtocolConnection*, UInt32, Win32cr::Foundation::HRESULT),
    disconnect_notify : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::HRESULT),
    close : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::HRESULT),
    get_protocol_status : Proc(IWRdsProtocolConnection*, Win32cr::System::RemoteDesktop::WTS_PROTOCOL_STATUS*, Win32cr::Foundation::HRESULT),
    get_last_input_time : Proc(IWRdsProtocolConnection*, UInt64*, Win32cr::Foundation::HRESULT),
    set_error_info : Proc(IWRdsProtocolConnection*, UInt32, Win32cr::Foundation::HRESULT),
    create_virtual_channel : Proc(IWRdsProtocolConnection*, Win32cr::Foundation::PSTR, Win32cr::Foundation::BOOL, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    query_property : Proc(IWRdsProtocolConnection*, LibC::GUID, UInt32, UInt32, Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, Win32cr::Foundation::HRESULT),
    get_shadow_connection : Proc(IWRdsProtocolConnection*, Void**, Win32cr::Foundation::HRESULT),
    notify_command_process_created : Proc(IWRdsProtocolConnection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("324ed94f-fdaf-4ff6-81a8-42abe755830b")]
  record IWRdsProtocolConnection, lpVtbl : IWRdsProtocolConnectionVtbl* do
    GUID = LibC::GUID.new(0x324ed94f_u32, 0xfdaf_u16, 0x4ff6_u16, StaticArray[0x81_u8, 0xa8_u8, 0x42_u8, 0xab_u8, 0xe7_u8, 0x55_u8, 0x83_u8, 0xb_u8])
    def query_interface(this : IWRdsProtocolConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_logon_error_redirector(this : IWRdsProtocolConnection*, ppLogonErrorRedir : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logon_error_redirector.call(this, ppLogonErrorRedir)
    end
    def accept_connection(this : IWRdsProtocolConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_connection.call(this)
    end
    def get_client_data(this : IWRdsProtocolConnection*, pClientData : Win32cr::System::RemoteDesktop::WTS_CLIENT_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_data.call(this, pClientData)
    end
    def get_client_monitor_data(this : IWRdsProtocolConnection*, pNumMonitors : UInt32*, pPrimaryMonitor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_monitor_data.call(this, pNumMonitors, pPrimaryMonitor)
    end
    def get_user_credentials(this : IWRdsProtocolConnection*, pUserCreds : Win32cr::System::RemoteDesktop::WTS_USER_CREDENTIAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_credentials.call(this, pUserCreds)
    end
    def get_license_connection(this : IWRdsProtocolConnection*, ppLicenseConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_license_connection.call(this, ppLicenseConnection)
    end
    def authenticate_client_to_session(this : IWRdsProtocolConnection*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authenticate_client_to_session.call(this, session_id)
    end
    def notify_session_id(this : IWRdsProtocolConnection*, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, session_handle : Win32cr::Foundation::HANDLE_PTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_session_id.call(this, session_id, session_handle)
    end
    def get_input_handles(this : IWRdsProtocolConnection*, pKeyboardHandle : Win32cr::Foundation::HANDLE_PTR*, pMouseHandle : Win32cr::Foundation::HANDLE_PTR*, pBeepHandle : Win32cr::Foundation::HANDLE_PTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_handles.call(this, pKeyboardHandle, pMouseHandle, pBeepHandle)
    end
    def get_video_handle(this : IWRdsProtocolConnection*, pVideoHandle : Win32cr::Foundation::HANDLE_PTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_video_handle.call(this, pVideoHandle)
    end
    def connect_notify(this : IWRdsProtocolConnection*, session_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_notify.call(this, session_id)
    end
    def is_user_allowed_to_logon(this : IWRdsProtocolConnection*, session_id : UInt32, user_token : Win32cr::Foundation::HANDLE_PTR, pDomainName : Win32cr::Foundation::PWSTR, pUserName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_user_allowed_to_logon.call(this, session_id, user_token, pDomainName, pUserName)
    end
    def session_arbitration_enumeration(this : IWRdsProtocolConnection*, hUserToken : Win32cr::Foundation::HANDLE_PTR, bSingleSessionPerUserEnabled : Win32cr::Foundation::BOOL, pSessionIdArray : UInt32*, pdwSessionIdentifierCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.session_arbitration_enumeration.call(this, hUserToken, bSingleSessionPerUserEnabled, pSessionIdArray, pdwSessionIdentifierCount)
    end
    def logon_notify(this : IWRdsProtocolConnection*, hClientToken : Win32cr::Foundation::HANDLE_PTR, wszUserName : Win32cr::Foundation::PWSTR, wszDomainName : Win32cr::Foundation::PWSTR, session_id : Win32cr::System::RemoteDesktop::WTS_SESSION_ID*, pWRdsConnectionSettings : Win32cr::System::RemoteDesktop::WRDS_CONNECTION_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.logon_notify.call(this, hClientToken, wszUserName, wszDomainName, session_id, pWRdsConnectionSettings)
    end
    def pre_disconnect(this : IWRdsProtocolConnection*, disconnect_reason : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_disconnect.call(this, disconnect_reason)
    end
    def disconnect_notify(this : IWRdsProtocolConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_notify.call(this)
    end
    def close(this : IWRdsProtocolConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_protocol_status(this : IWRdsProtocolConnection*, pProtocolStatus : Win32cr::System::RemoteDesktop::WTS_PROTOCOL_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_status.call(this, pProtocolStatus)
    end
    def get_last_input_time(this : IWRdsProtocolConnection*, pLastInputTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_input_time.call(this, pLastInputTime)
    end
    def set_error_info(this : IWRdsProtocolConnection*, ulError : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_error_info.call(this, ulError)
    end
    def create_virtual_channel(this : IWRdsProtocolConnection*, szEndpointName : Win32cr::Foundation::PSTR, bStatic : Win32cr::Foundation::BOOL, requested_priority : UInt32, phChannel : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_channel.call(this, szEndpointName, bStatic, requested_priority, phChannel)
    end
    def query_property(this : IWRdsProtocolConnection*, query_type : LibC::GUID, ulNumEntriesIn : UInt32, ulNumEntriesOut : UInt32, pPropertyEntriesIn : Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, pPropertyEntriesOut : Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_property.call(this, query_type, ulNumEntriesIn, ulNumEntriesOut, pPropertyEntriesIn, pPropertyEntriesOut)
    end
    def get_shadow_connection(this : IWRdsProtocolConnection*, ppShadowConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shadow_connection.call(this, ppShadowConnection)
    end
    def notify_command_process_created(this : IWRdsProtocolConnection*, session_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_command_process_created.call(this, session_id)
    end

  end

  @[Extern]
  record IWRdsProtocolConnectionCallbackVtbl,
    query_interface : Proc(IWRdsProtocolConnectionCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolConnectionCallback*, UInt32),
    release : Proc(IWRdsProtocolConnectionCallback*, UInt32),
    on_ready : Proc(IWRdsProtocolConnectionCallback*, Win32cr::Foundation::HRESULT),
    broken_connection : Proc(IWRdsProtocolConnectionCallback*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stop_screen_updates : Proc(IWRdsProtocolConnectionCallback*, Win32cr::Foundation::HRESULT),
    redraw_window : Proc(IWRdsProtocolConnectionCallback*, Win32cr::System::RemoteDesktop::WTS_SMALL_RECT*, Win32cr::Foundation::HRESULT),
    get_connection_id : Proc(IWRdsProtocolConnectionCallback*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f1d70332-d070-4ef1-a088-78313536c2d6")]
  record IWRdsProtocolConnectionCallback, lpVtbl : IWRdsProtocolConnectionCallbackVtbl* do
    GUID = LibC::GUID.new(0xf1d70332_u32, 0xd070_u16, 0x4ef1_u16, StaticArray[0xa0_u8, 0x88_u8, 0x78_u8, 0x31_u8, 0x35_u8, 0x36_u8, 0xc2_u8, 0xd6_u8])
    def query_interface(this : IWRdsProtocolConnectionCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolConnectionCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolConnectionCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_ready(this : IWRdsProtocolConnectionCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ready.call(this)
    end
    def broken_connection(this : IWRdsProtocolConnectionCallback*, reason : UInt32, source : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.broken_connection.call(this, reason, source)
    end
    def stop_screen_updates(this : IWRdsProtocolConnectionCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_screen_updates.call(this)
    end
    def redraw_window(this : IWRdsProtocolConnectionCallback*, rect : Win32cr::System::RemoteDesktop::WTS_SMALL_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redraw_window.call(this, rect)
    end
    def get_connection_id(this : IWRdsProtocolConnectionCallback*, pConnectionId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_id.call(this, pConnectionId)
    end

  end

  @[Extern]
  record IWRdsProtocolShadowConnectionVtbl,
    query_interface : Proc(IWRdsProtocolShadowConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolShadowConnection*, UInt32),
    release : Proc(IWRdsProtocolShadowConnection*, UInt32),
    start : Proc(IWRdsProtocolShadowConnection*, Win32cr::Foundation::PWSTR, UInt32, UInt8, UInt16, Void*, Win32cr::Foundation::HRESULT),
    stop : Proc(IWRdsProtocolShadowConnection*, Win32cr::Foundation::HRESULT),
    do_target : Proc(IWRdsProtocolShadowConnection*, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9ae85ce6-cade-4548-8feb-99016597f60a")]
  record IWRdsProtocolShadowConnection, lpVtbl : IWRdsProtocolShadowConnectionVtbl* do
    GUID = LibC::GUID.new(0x9ae85ce6_u32, 0xcade_u16, 0x4548_u16, StaticArray[0x8f_u8, 0xeb_u8, 0x99_u8, 0x1_u8, 0x65_u8, 0x97_u8, 0xf6_u8, 0xa_u8])
    def query_interface(this : IWRdsProtocolShadowConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolShadowConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolShadowConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IWRdsProtocolShadowConnection*, pTargetServerName : Win32cr::Foundation::PWSTR, target_session_id : UInt32, hot_key_vk : UInt8, hotkey_modifiers : UInt16, pShadowCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, pTargetServerName, target_session_id, hot_key_vk, hotkey_modifiers, pShadowCallback)
    end
    def stop(this : IWRdsProtocolShadowConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def do_target(this : IWRdsProtocolShadowConnection*, pParam1 : UInt8*, param1_size : UInt32, pParam2 : UInt8*, param2_size : UInt32, pParam3 : UInt8*, param3_size : UInt32, pParam4 : UInt8*, param4_size : UInt32, pClientName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_target.call(this, pParam1, param1_size, pParam2, param2_size, pParam3, param3_size, pParam4, param4_size, pClientName)
    end

  end

  @[Extern]
  record IWRdsProtocolShadowCallbackVtbl,
    query_interface : Proc(IWRdsProtocolShadowCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolShadowCallback*, UInt32),
    release : Proc(IWRdsProtocolShadowCallback*, UInt32),
    stop_shadow : Proc(IWRdsProtocolShadowCallback*, Win32cr::Foundation::HRESULT),
    invoke_target_shadow : Proc(IWRdsProtocolShadowCallback*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e0667ce0-0372-40d6-adb2-a0f3322674d6")]
  record IWRdsProtocolShadowCallback, lpVtbl : IWRdsProtocolShadowCallbackVtbl* do
    GUID = LibC::GUID.new(0xe0667ce0_u32, 0x372_u16, 0x40d6_u16, StaticArray[0xad_u8, 0xb2_u8, 0xa0_u8, 0xf3_u8, 0x32_u8, 0x26_u8, 0x74_u8, 0xd6_u8])
    def query_interface(this : IWRdsProtocolShadowCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolShadowCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolShadowCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def stop_shadow(this : IWRdsProtocolShadowCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_shadow.call(this)
    end
    def invoke_target_shadow(this : IWRdsProtocolShadowCallback*, pTargetServerName : Win32cr::Foundation::PWSTR, target_session_id : UInt32, pParam1 : UInt8*, param1_size : UInt32, pParam2 : UInt8*, param2_size : UInt32, pParam3 : UInt8*, param3_size : UInt32, pParam4 : UInt8*, param4_size : UInt32, pClientName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_target_shadow.call(this, pTargetServerName, target_session_id, pParam1, param1_size, pParam2, param2_size, pParam3, param3_size, pParam4, param4_size, pClientName)
    end

  end

  @[Extern]
  record IWRdsProtocolLicenseConnectionVtbl,
    query_interface : Proc(IWRdsProtocolLicenseConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolLicenseConnection*, UInt32),
    release : Proc(IWRdsProtocolLicenseConnection*, UInt32),
    request_licensing_capabilities : Proc(IWRdsProtocolLicenseConnection*, Win32cr::System::RemoteDesktop::WTS_LICENSE_CAPABILITIES*, UInt32*, Win32cr::Foundation::HRESULT),
    send_client_license : Proc(IWRdsProtocolLicenseConnection*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    request_client_license : Proc(IWRdsProtocolLicenseConnection*, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    protocol_complete : Proc(IWRdsProtocolLicenseConnection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1d6a145f-d095-4424-957a-407fae822d84")]
  record IWRdsProtocolLicenseConnection, lpVtbl : IWRdsProtocolLicenseConnectionVtbl* do
    GUID = LibC::GUID.new(0x1d6a145f_u32, 0xd095_u16, 0x4424_u16, StaticArray[0x95_u8, 0x7a_u8, 0x40_u8, 0x7f_u8, 0xae_u8, 0x82_u8, 0x2d_u8, 0x84_u8])
    def query_interface(this : IWRdsProtocolLicenseConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolLicenseConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolLicenseConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request_licensing_capabilities(this : IWRdsProtocolLicenseConnection*, ppLicenseCapabilities : Win32cr::System::RemoteDesktop::WTS_LICENSE_CAPABILITIES*, pcbLicenseCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_licensing_capabilities.call(this, ppLicenseCapabilities, pcbLicenseCapabilities)
    end
    def send_client_license(this : IWRdsProtocolLicenseConnection*, pClientLicense : UInt8*, cbClientLicense : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_client_license.call(this, pClientLicense, cbClientLicense)
    end
    def request_client_license(this : IWRdsProtocolLicenseConnection*, reserve1 : UInt8*, reserve2 : UInt32, ppClientLicense : UInt8*, pcbClientLicense : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_client_license.call(this, reserve1, reserve2, ppClientLicense, pcbClientLicense)
    end
    def protocol_complete(this : IWRdsProtocolLicenseConnection*, ulComplete : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.protocol_complete.call(this, ulComplete)
    end

  end

  @[Extern]
  record IWRdsProtocolLogonErrorRedirectorVtbl,
    query_interface : Proc(IWRdsProtocolLogonErrorRedirector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolLogonErrorRedirector*, UInt32),
    release : Proc(IWRdsProtocolLogonErrorRedirector*, UInt32),
    on_begin_painting : Proc(IWRdsProtocolLogonErrorRedirector*, Win32cr::Foundation::HRESULT),
    redirect_status : Proc(IWRdsProtocolLogonErrorRedirector*, Win32cr::Foundation::PWSTR, Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, Win32cr::Foundation::HRESULT),
    redirect_message : Proc(IWRdsProtocolLogonErrorRedirector*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, Win32cr::Foundation::HRESULT),
    redirect_logon_error : Proc(IWRdsProtocolLogonErrorRedirector*, Int32, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("519fe83b-142a-4120-a3d5-a405d315281a")]
  record IWRdsProtocolLogonErrorRedirector, lpVtbl : IWRdsProtocolLogonErrorRedirectorVtbl* do
    GUID = LibC::GUID.new(0x519fe83b_u32, 0x142a_u16, 0x4120_u16, StaticArray[0xa3_u8, 0xd5_u8, 0xa4_u8, 0x5_u8, 0xd3_u8, 0x15_u8, 0x28_u8, 0x1a_u8])
    def query_interface(this : IWRdsProtocolLogonErrorRedirector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolLogonErrorRedirector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolLogonErrorRedirector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_begin_painting(this : IWRdsProtocolLogonErrorRedirector*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_begin_painting.call(this)
    end
    def redirect_status(this : IWRdsProtocolLogonErrorRedirector*, pszMessage : Win32cr::Foundation::PWSTR, pResponse : Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect_status.call(this, pszMessage, pResponse)
    end
    def redirect_message(this : IWRdsProtocolLogonErrorRedirector*, pszCaption : Win32cr::Foundation::PWSTR, pszMessage : Win32cr::Foundation::PWSTR, uType : UInt32, pResponse : Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect_message.call(this, pszCaption, pszMessage, uType, pResponse)
    end
    def redirect_logon_error(this : IWRdsProtocolLogonErrorRedirector*, ntsStatus : Int32, ntsSubstatus : Int32, pszCaption : Win32cr::Foundation::PWSTR, pszMessage : Win32cr::Foundation::PWSTR, uType : UInt32, pResponse : Win32cr::System::RemoteDesktop::WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect_logon_error.call(this, ntsStatus, ntsSubstatus, pszCaption, pszMessage, uType, pResponse)
    end

  end

  @[Extern]
  record IWRdsWddmIddPropsVtbl,
    query_interface : Proc(IWRdsWddmIddProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsWddmIddProps*, UInt32),
    release : Proc(IWRdsWddmIddProps*, UInt32),
    get_hardware_id : Proc(IWRdsWddmIddProps*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    on_driver_load : Proc(IWRdsWddmIddProps*, UInt32, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::HRESULT),
    on_driver_unload : Proc(IWRdsWddmIddProps*, UInt32, Win32cr::Foundation::HRESULT),
    enable_wddm_idd : Proc(IWRdsWddmIddProps*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1382df4d-a289-43d1-a184-144726f9af90")]
  record IWRdsWddmIddProps, lpVtbl : IWRdsWddmIddPropsVtbl* do
    GUID = LibC::GUID.new(0x1382df4d_u32, 0xa289_u16, 0x43d1_u16, StaticArray[0xa1_u8, 0x84_u8, 0x14_u8, 0x47_u8, 0x26_u8, 0xf9_u8, 0xaf_u8, 0x90_u8])
    def query_interface(this : IWRdsWddmIddProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsWddmIddProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsWddmIddProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_hardware_id(this : IWRdsWddmIddProps*, pDisplayDriverHardwareId : UInt16*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hardware_id.call(this, pDisplayDriverHardwareId, count)
    end
    def on_driver_load(this : IWRdsWddmIddProps*, session_id : UInt32, driver_handle : Win32cr::Foundation::HANDLE_PTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_driver_load.call(this, session_id, driver_handle)
    end
    def on_driver_unload(this : IWRdsWddmIddProps*, session_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_driver_unload.call(this, session_id)
    end
    def enable_wddm_idd(this : IWRdsWddmIddProps*, enabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_wddm_idd.call(this, enabled)
    end

  end

  @[Extern]
  record IWRdsProtocolConnectionSettingsVtbl,
    query_interface : Proc(IWRdsProtocolConnectionSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsProtocolConnectionSettings*, UInt32),
    release : Proc(IWRdsProtocolConnectionSettings*, UInt32),
    set_connection_setting : Proc(IWRdsProtocolConnectionSettings*, LibC::GUID, Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, Win32cr::Foundation::HRESULT),
    get_connection_setting : Proc(IWRdsProtocolConnectionSettings*, LibC::GUID, Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("83fcf5d3-f6f4-ea94-9cd2-32f280e1e510")]
  record IWRdsProtocolConnectionSettings, lpVtbl : IWRdsProtocolConnectionSettingsVtbl* do
    GUID = LibC::GUID.new(0x83fcf5d3_u32, 0xf6f4_u16, 0xea94_u16, StaticArray[0x9c_u8, 0xd2_u8, 0x32_u8, 0xf2_u8, 0x80_u8, 0xe1_u8, 0xe5_u8, 0x10_u8])
    def query_interface(this : IWRdsProtocolConnectionSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsProtocolConnectionSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsProtocolConnectionSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_connection_setting(this : IWRdsProtocolConnectionSettings*, property_id : LibC::GUID, pPropertyEntriesIn : Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection_setting.call(this, property_id, pPropertyEntriesIn)
    end
    def get_connection_setting(this : IWRdsProtocolConnectionSettings*, property_id : LibC::GUID, pPropertyEntriesOut : Win32cr::System::RemoteDesktop::WTS_PROPERTY_VALUE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_setting.call(this, property_id, pPropertyEntriesOut)
    end

  end

  @[Extern]
  record IWRdsEnhancedFastReconnectArbitratorVtbl,
    query_interface : Proc(IWRdsEnhancedFastReconnectArbitrator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWRdsEnhancedFastReconnectArbitrator*, UInt32),
    release : Proc(IWRdsEnhancedFastReconnectArbitrator*, UInt32),
    get_session_for_enhanced_fast_reconnect : Proc(IWRdsEnhancedFastReconnectArbitrator*, Int32*, UInt32, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5718ae9b-47f2-499f-b634-d8175bd51131")]
  record IWRdsEnhancedFastReconnectArbitrator, lpVtbl : IWRdsEnhancedFastReconnectArbitratorVtbl* do
    GUID = LibC::GUID.new(0x5718ae9b_u32, 0x47f2_u16, 0x499f_u16, StaticArray[0xb6_u8, 0x34_u8, 0xd8_u8, 0x17_u8, 0x5b_u8, 0xd5_u8, 0x11_u8, 0x31_u8])
    def query_interface(this : IWRdsEnhancedFastReconnectArbitrator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWRdsEnhancedFastReconnectArbitrator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWRdsEnhancedFastReconnectArbitrator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_session_for_enhanced_fast_reconnect(this : IWRdsEnhancedFastReconnectArbitrator*, pSessionIdArray : Int32*, dwSessionCount : UInt32, pResultSessionId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_session_for_enhanced_fast_reconnect.call(this, pSessionIdArray, dwSessionCount, pResultSessionId)
    end

  end

  @[Extern]
  record IRemoteDesktopClientSettingsVtbl,
    query_interface : Proc(IRemoteDesktopClientSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDesktopClientSettings*, UInt32),
    release : Proc(IRemoteDesktopClientSettings*, UInt32),
    get_type_info_count : Proc(IRemoteDesktopClientSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRemoteDesktopClientSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRemoteDesktopClientSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRemoteDesktopClientSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    apply_settings : Proc(IRemoteDesktopClientSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    retrieve_settings : Proc(IRemoteDesktopClientSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_rdp_property : Proc(IRemoteDesktopClientSettings*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_rdp_property : Proc(IRemoteDesktopClientSettings*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("48a0f2a7-2713-431f-bbac-6f4558e7d64d")]
  record IRemoteDesktopClientSettings, lpVtbl : IRemoteDesktopClientSettingsVtbl* do
    GUID = LibC::GUID.new(0x48a0f2a7_u32, 0x2713_u16, 0x431f_u16, StaticArray[0xbb_u8, 0xac_u8, 0x6f_u8, 0x45_u8, 0x58_u8, 0xe7_u8, 0xd6_u8, 0x4d_u8])
    def query_interface(this : IRemoteDesktopClientSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDesktopClientSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDesktopClientSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRemoteDesktopClientSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRemoteDesktopClientSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRemoteDesktopClientSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRemoteDesktopClientSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def apply_settings(this : IRemoteDesktopClientSettings*, rdpFileContents : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_settings.call(this, rdpFileContents)
    end
    def retrieve_settings(this : IRemoteDesktopClientSettings*, rdpFileContents : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_settings.call(this, rdpFileContents)
    end
    def get_rdp_property(this : IRemoteDesktopClientSettings*, propertyName : Win32cr::Foundation::BSTR, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rdp_property.call(this, propertyName, value)
    end
    def set_rdp_property(this : IRemoteDesktopClientSettings*, propertyName : Win32cr::Foundation::BSTR, value : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rdp_property.call(this, propertyName, value)
    end

  end

  @[Extern]
  record IRemoteDesktopClientActionsVtbl,
    query_interface : Proc(IRemoteDesktopClientActions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDesktopClientActions*, UInt32),
    release : Proc(IRemoteDesktopClientActions*, UInt32),
    get_type_info_count : Proc(IRemoteDesktopClientActions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRemoteDesktopClientActions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRemoteDesktopClientActions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRemoteDesktopClientActions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend_screen_updates : Proc(IRemoteDesktopClientActions*, Win32cr::Foundation::HRESULT),
    resume_screen_updates : Proc(IRemoteDesktopClientActions*, Win32cr::Foundation::HRESULT),
    execute_remote_action : Proc(IRemoteDesktopClientActions*, Win32cr::System::RemoteDesktop::RemoteActionType, Win32cr::Foundation::HRESULT),
    get_snapshot : Proc(IRemoteDesktopClientActions*, Win32cr::System::RemoteDesktop::SnapshotEncodingType, Win32cr::System::RemoteDesktop::SnapshotFormatType, UInt32, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7d54bc4e-1028-45d4-8b0a-b9b6bffba176")]
  record IRemoteDesktopClientActions, lpVtbl : IRemoteDesktopClientActionsVtbl* do
    GUID = LibC::GUID.new(0x7d54bc4e_u32, 0x1028_u16, 0x45d4_u16, StaticArray[0x8b_u8, 0xa_u8, 0xb9_u8, 0xb6_u8, 0xbf_u8, 0xfb_u8, 0xa1_u8, 0x76_u8])
    def query_interface(this : IRemoteDesktopClientActions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDesktopClientActions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDesktopClientActions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRemoteDesktopClientActions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRemoteDesktopClientActions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRemoteDesktopClientActions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRemoteDesktopClientActions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def suspend_screen_updates(this : IRemoteDesktopClientActions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_screen_updates.call(this)
    end
    def resume_screen_updates(this : IRemoteDesktopClientActions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_screen_updates.call(this)
    end
    def execute_remote_action(this : IRemoteDesktopClientActions*, remoteAction : Win32cr::System::RemoteDesktop::RemoteActionType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_remote_action.call(this, remoteAction)
    end
    def get_snapshot(this : IRemoteDesktopClientActions*, snapshotEncoding : Win32cr::System::RemoteDesktop::SnapshotEncodingType, snapshotFormat : Win32cr::System::RemoteDesktop::SnapshotFormatType, snapshotWidth : UInt32, snapshotHeight : UInt32, snapshotData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snapshot.call(this, snapshotEncoding, snapshotFormat, snapshotWidth, snapshotHeight, snapshotData)
    end

  end

  @[Extern]
  record IRemoteDesktopClientTouchPointerVtbl,
    query_interface : Proc(IRemoteDesktopClientTouchPointer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDesktopClientTouchPointer*, UInt32),
    release : Proc(IRemoteDesktopClientTouchPointer*, UInt32),
    get_type_info_count : Proc(IRemoteDesktopClientTouchPointer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRemoteDesktopClientTouchPointer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRemoteDesktopClientTouchPointer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRemoteDesktopClientTouchPointer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IRemoteDesktopClientTouchPointer*, Int16, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IRemoteDesktopClientTouchPointer*, Int16*, Win32cr::Foundation::HRESULT),
    put_EventsEnabled : Proc(IRemoteDesktopClientTouchPointer*, Int16, Win32cr::Foundation::HRESULT),
    get_EventsEnabled : Proc(IRemoteDesktopClientTouchPointer*, Int16*, Win32cr::Foundation::HRESULT),
    put_PointerSpeed : Proc(IRemoteDesktopClientTouchPointer*, UInt32, Win32cr::Foundation::HRESULT),
    get_PointerSpeed : Proc(IRemoteDesktopClientTouchPointer*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("260ec22d-8cbc-44b5-9e88-2a37f6c93ae9")]
  record IRemoteDesktopClientTouchPointer, lpVtbl : IRemoteDesktopClientTouchPointerVtbl* do
    GUID = LibC::GUID.new(0x260ec22d_u32, 0x8cbc_u16, 0x44b5_u16, StaticArray[0x9e_u8, 0x88_u8, 0x2a_u8, 0x37_u8, 0xf6_u8, 0xc9_u8, 0x3a_u8, 0xe9_u8])
    def query_interface(this : IRemoteDesktopClientTouchPointer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDesktopClientTouchPointer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDesktopClientTouchPointer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRemoteDesktopClientTouchPointer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRemoteDesktopClientTouchPointer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRemoteDesktopClientTouchPointer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRemoteDesktopClientTouchPointer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def put_Enabled(this : IRemoteDesktopClientTouchPointer*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Enabled(this : IRemoteDesktopClientTouchPointer*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_EventsEnabled(this : IRemoteDesktopClientTouchPointer*, eventsEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventsEnabled.call(this, eventsEnabled)
    end
    def get_EventsEnabled(this : IRemoteDesktopClientTouchPointer*, eventsEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventsEnabled.call(this, eventsEnabled)
    end
    def put_PointerSpeed(this : IRemoteDesktopClientTouchPointer*, pointerSpeed : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PointerSpeed.call(this, pointerSpeed)
    end
    def get_PointerSpeed(this : IRemoteDesktopClientTouchPointer*, pointerSpeed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PointerSpeed.call(this, pointerSpeed)
    end

  end

  @[Extern]
  record IRemoteDesktopClientVtbl,
    query_interface : Proc(IRemoteDesktopClient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDesktopClient*, UInt32),
    release : Proc(IRemoteDesktopClient*, UInt32),
    get_type_info_count : Proc(IRemoteDesktopClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRemoteDesktopClient*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRemoteDesktopClient*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRemoteDesktopClient*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    connect : Proc(IRemoteDesktopClient*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IRemoteDesktopClient*, Win32cr::Foundation::HRESULT),
    reconnect : Proc(IRemoteDesktopClient*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_Settings : Proc(IRemoteDesktopClient*, Void**, Win32cr::Foundation::HRESULT),
    get_Actions : Proc(IRemoteDesktopClient*, Void**, Win32cr::Foundation::HRESULT),
    get_TouchPointer : Proc(IRemoteDesktopClient*, Void**, Win32cr::Foundation::HRESULT),
    delete_saved_credentials : Proc(IRemoteDesktopClient*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    update_session_display_settings : Proc(IRemoteDesktopClient*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    attachEvent : Proc(IRemoteDesktopClient*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    detachEvent : Proc(IRemoteDesktopClient*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("57d25668-625a-4905-be4e-304caa13f89c")]
  record IRemoteDesktopClient, lpVtbl : IRemoteDesktopClientVtbl* do
    GUID = LibC::GUID.new(0x57d25668_u32, 0x625a_u16, 0x4905_u16, StaticArray[0xbe_u8, 0x4e_u8, 0x30_u8, 0x4c_u8, 0xaa_u8, 0x13_u8, 0xf8_u8, 0x9c_u8])
    def query_interface(this : IRemoteDesktopClient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDesktopClient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDesktopClient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRemoteDesktopClient*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRemoteDesktopClient*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRemoteDesktopClient*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRemoteDesktopClient*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def connect(this : IRemoteDesktopClient*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this)
    end
    def disconnect(this : IRemoteDesktopClient*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def reconnect(this : IRemoteDesktopClient*, width : UInt32, height : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconnect.call(this, width, height)
    end
    def get_Settings(this : IRemoteDesktopClient*, settings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Settings.call(this, settings)
    end
    def get_Actions(this : IRemoteDesktopClient*, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Actions.call(this, actions)
    end
    def get_TouchPointer(this : IRemoteDesktopClient*, touchPointer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TouchPointer.call(this, touchPointer)
    end
    def delete_saved_credentials(this : IRemoteDesktopClient*, serverName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_saved_credentials.call(this, serverName)
    end
    def update_session_display_settings(this : IRemoteDesktopClient*, width : UInt32, height : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_session_display_settings.call(this, width, height)
    end
    def attachEvent(this : IRemoteDesktopClient*, eventName : Win32cr::Foundation::BSTR, callback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attachEvent.call(this, eventName, callback)
    end
    def detachEvent(this : IRemoteDesktopClient*, eventName : Win32cr::Foundation::BSTR, callback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detachEvent.call(this, eventName, callback)
    end

  end

  @[Extern]
  record IRemoteSystemAdditionalInfoProviderVtbl,
    query_interface : Proc(IRemoteSystemAdditionalInfoProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteSystemAdditionalInfoProvider*, UInt32),
    release : Proc(IRemoteSystemAdditionalInfoProvider*, UInt32),
    get_additional_info : Proc(IRemoteSystemAdditionalInfoProvider*, Win32cr::System::WinRT::HSTRING*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eeaa3d5f-ec63-4d27-af38-e86b1d7292cb")]
  record IRemoteSystemAdditionalInfoProvider, lpVtbl : IRemoteSystemAdditionalInfoProviderVtbl* do
    GUID = LibC::GUID.new(0xeeaa3d5f_u32, 0xec63_u16, 0x4d27_u16, StaticArray[0xaf_u8, 0x38_u8, 0xe8_u8, 0x6b_u8, 0x1d_u8, 0x72_u8, 0x92_u8, 0xcb_u8])
    def query_interface(this : IRemoteSystemAdditionalInfoProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteSystemAdditionalInfoProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteSystemAdditionalInfoProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_additional_info(this : IRemoteSystemAdditionalInfoProvider*, deduplicationId : Win32cr::System::WinRT::HSTRING*, riid : LibC::GUID*, mapView : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_additional_info.call(this, deduplicationId, riid, mapView)
    end

  end

  @[Link("wtsapi32")]
  @[Link("kernel32")]
  lib C
    fun WTSStopRemoteControlSession(logon_id : UInt32) : Win32cr::Foundation::BOOL

    fun WTSStartRemoteControlSessionW(pTargetServerName : Win32cr::Foundation::PWSTR, target_logon_id : UInt32, hotkey_vk : UInt8, hotkey_modifiers : UInt16) : Win32cr::Foundation::BOOL

    fun WTSStartRemoteControlSessionA(pTargetServerName : Win32cr::Foundation::PSTR, target_logon_id : UInt32, hotkey_vk : UInt8, hotkey_modifiers : UInt16) : Win32cr::Foundation::BOOL

    fun WTSConnectSessionA(logon_id : UInt32, target_logon_id : UInt32, pPassword : Win32cr::Foundation::PSTR, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WTSConnectSessionW(logon_id : UInt32, target_logon_id : UInt32, pPassword : Win32cr::Foundation::PWSTR, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WTSEnumerateServersW(pDomainName : Win32cr::Foundation::PWSTR, reserved : UInt32, version : UInt32, ppServerInfo : Win32cr::System::RemoteDesktop::WTS_SERVER_INFOW**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateServersA(pDomainName : Win32cr::Foundation::PSTR, reserved : UInt32, version : UInt32, ppServerInfo : Win32cr::System::RemoteDesktop::WTS_SERVER_INFOA**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSOpenServerW(pServerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun WTSOpenServerA(pServerName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    fun WTSOpenServerExW(pServerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun WTSOpenServerExA(pServerName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    fun WTSCloseServer(hServer : Win32cr::Foundation::HANDLE) : Void

    fun WTSEnumerateSessionsW(hServer : Win32cr::Foundation::HANDLE, reserved : UInt32, version : UInt32, ppSessionInfo : Win32cr::System::RemoteDesktop::WTS_SESSION_INFOW**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateSessionsA(hServer : Win32cr::Foundation::HANDLE, reserved : UInt32, version : UInt32, ppSessionInfo : Win32cr::System::RemoteDesktop::WTS_SESSION_INFOA**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateSessionsExW(hServer : Win32cr::Foundation::HANDLE, pLevel : UInt32*, filter : UInt32, ppSessionInfo : Win32cr::System::RemoteDesktop::WTS_SESSION_INFO_1W**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateSessionsExA(hServer : Win32cr::Foundation::HANDLE, pLevel : UInt32*, filter : UInt32, ppSessionInfo : Win32cr::System::RemoteDesktop::WTS_SESSION_INFO_1A**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateProcessesW(hServer : Win32cr::Foundation::HANDLE, reserved : UInt32, version : UInt32, ppProcessInfo : Win32cr::System::RemoteDesktop::WTS_PROCESS_INFOW**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateProcessesA(hServer : Win32cr::Foundation::HANDLE, reserved : UInt32, version : UInt32, ppProcessInfo : Win32cr::System::RemoteDesktop::WTS_PROCESS_INFOA**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSTerminateProcess(hServer : Win32cr::Foundation::HANDLE, process_id : UInt32, exit_code : UInt32) : Win32cr::Foundation::BOOL

    fun WTSQuerySessionInformationW(hServer : Win32cr::Foundation::HANDLE, session_id : UInt32, wts_info_class : Win32cr::System::RemoteDesktop::WTS_INFO_CLASS, ppBuffer : Win32cr::Foundation::PWSTR*, pBytesReturned : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSQuerySessionInformationA(hServer : Win32cr::Foundation::HANDLE, session_id : UInt32, wts_info_class : Win32cr::System::RemoteDesktop::WTS_INFO_CLASS, ppBuffer : Win32cr::Foundation::PSTR*, pBytesReturned : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSQueryUserConfigW(pServerName : Win32cr::Foundation::PWSTR, pUserName : Win32cr::Foundation::PWSTR, wts_config_class : Win32cr::System::RemoteDesktop::WTS_CONFIG_CLASS, ppBuffer : Win32cr::Foundation::PWSTR*, pBytesReturned : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSQueryUserConfigA(pServerName : Win32cr::Foundation::PSTR, pUserName : Win32cr::Foundation::PSTR, wts_config_class : Win32cr::System::RemoteDesktop::WTS_CONFIG_CLASS, ppBuffer : Win32cr::Foundation::PSTR*, pBytesReturned : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSSetUserConfigW(pServerName : Win32cr::Foundation::PWSTR, pUserName : Win32cr::Foundation::PWSTR, wts_config_class : Win32cr::System::RemoteDesktop::WTS_CONFIG_CLASS, pBuffer : Win32cr::Foundation::PWSTR, data_length : UInt32) : Win32cr::Foundation::BOOL

    fun WTSSetUserConfigA(pServerName : Win32cr::Foundation::PSTR, pUserName : Win32cr::Foundation::PSTR, wts_config_class : Win32cr::System::RemoteDesktop::WTS_CONFIG_CLASS, pBuffer : Win32cr::Foundation::PSTR, data_length : UInt32) : Win32cr::Foundation::BOOL

    fun WTSSendMessageW(hServer : Win32cr::Foundation::HANDLE, session_id : UInt32, pTitle : Win32cr::Foundation::PWSTR, title_length : UInt32, pMessage : Win32cr::Foundation::PWSTR, message_length : UInt32, style : Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE, timeout : UInt32, pResponse : Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_RESULT*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WTSSendMessageA(hServer : Win32cr::Foundation::HANDLE, session_id : UInt32, pTitle : Win32cr::Foundation::PSTR, title_length : UInt32, pMessage : Win32cr::Foundation::PSTR, message_length : UInt32, style : Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE, timeout : UInt32, pResponse : Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_RESULT*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WTSDisconnectSession(hServer : Win32cr::Foundation::HANDLE, session_id : UInt32, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WTSLogoffSession(hServer : Win32cr::Foundation::HANDLE, session_id : UInt32, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WTSShutdownSystem(hServer : Win32cr::Foundation::HANDLE, shutdown_flag : UInt32) : Win32cr::Foundation::BOOL

    fun WTSWaitSystemEvent(hServer : Win32cr::Foundation::HANDLE, event_mask : UInt32, pEventFlags : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSVirtualChannelOpen(hServer : Win32cr::Foundation::HANDLE, session_id : UInt32, pVirtualName : Win32cr::Foundation::PSTR) : Win32cr::System::RemoteDesktop::HwtsVirtualChannelHandle

    fun WTSVirtualChannelOpenEx(session_id : UInt32, pVirtualName : Win32cr::Foundation::PSTR, flags : UInt32) : Win32cr::System::RemoteDesktop::HwtsVirtualChannelHandle

    fun WTSVirtualChannelClose(hChannelHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun WTSVirtualChannelRead(hChannelHandle : Win32cr::Foundation::HANDLE, time_out : UInt32, buffer : Win32cr::Foundation::PSTR, buffer_size : UInt32, pBytesRead : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSVirtualChannelWrite(hChannelHandle : Win32cr::Foundation::HANDLE, buffer : Win32cr::Foundation::PSTR, length : UInt32, pBytesWritten : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSVirtualChannelPurgeInput(hChannelHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun WTSVirtualChannelPurgeOutput(hChannelHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun WTSVirtualChannelQuery(hChannelHandle : Win32cr::Foundation::HANDLE, param1 : Win32cr::System::RemoteDesktop::WTS_VIRTUAL_CLASS, ppBuffer : Void**, pBytesReturned : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSFreeMemory(pMemory : Void*) : Void

    fun WTSRegisterSessionNotification(hWnd : Win32cr::Foundation::HWND, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun WTSUnRegisterSessionNotification(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun WTSRegisterSessionNotificationEx(hServer : Win32cr::Foundation::HANDLE, hWnd : Win32cr::Foundation::HWND, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun WTSUnRegisterSessionNotificationEx(hServer : Win32cr::Foundation::HANDLE, hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun WTSQueryUserToken(session_id : UInt32, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun WTSFreeMemoryExW(wts_type_class : Win32cr::System::RemoteDesktop::WTS_TYPE_CLASS, pMemory : Void*, number_of_entries : UInt32) : Win32cr::Foundation::BOOL

    fun WTSFreeMemoryExA(wts_type_class : Win32cr::System::RemoteDesktop::WTS_TYPE_CLASS, pMemory : Void*, number_of_entries : UInt32) : Win32cr::Foundation::BOOL

    fun WTSEnumerateProcessesExW(hServer : Win32cr::Foundation::HANDLE, pLevel : UInt32*, session_id : UInt32, ppProcessInfo : Win32cr::Foundation::PWSTR*, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateProcessesExA(hServer : Win32cr::Foundation::HANDLE, pLevel : UInt32*, session_id : UInt32, ppProcessInfo : Win32cr::Foundation::PSTR*, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateListenersW(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListeners : UInt16**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnumerateListenersA(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListeners : Int8**, pCount : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSQueryListenerConfigW(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PWSTR, pBuffer : Win32cr::System::RemoteDesktop::WTSLISTENERCONFIGW*) : Win32cr::Foundation::BOOL

    fun WTSQueryListenerConfigA(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PSTR, pBuffer : Win32cr::System::RemoteDesktop::WTSLISTENERCONFIGA*) : Win32cr::Foundation::BOOL

    fun WTSCreateListenerW(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PWSTR, pBuffer : Win32cr::System::RemoteDesktop::WTSLISTENERCONFIGW*, flag : UInt32) : Win32cr::Foundation::BOOL

    fun WTSCreateListenerA(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PSTR, pBuffer : Win32cr::System::RemoteDesktop::WTSLISTENERCONFIGA*, flag : UInt32) : Win32cr::Foundation::BOOL

    fun WTSSetListenerSecurityW(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun WTSSetListenerSecurityA(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun WTSGetListenerSecurityW(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSGetListenerSecurityA(hServer : Win32cr::Foundation::HANDLE, pReserved : Void*, reserved : UInt32, pListenerName : Win32cr::Foundation::PSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, nLength : UInt32, lpnLengthNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSEnableChildSessions(bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WTSIsChildSessionsEnabled(pbEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun WTSGetChildSessionId(pSessionId : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSSetRenderHint(pRenderHintID : UInt64*, hwndOwner : Win32cr::Foundation::HWND, renderHintType : UInt32, cbHintDataLength : UInt32, pHintData : UInt8*) : Win32cr::Foundation::HRESULT

    fun ProcessIdToSessionId(dwProcessId : UInt32, pSessionId : UInt32*) : Win32cr::Foundation::BOOL

    fun WTSGetActiveConsoleSessionId : UInt32

  end
end