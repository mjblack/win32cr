require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::NetworkManagement::WindowsConnectNow
  extend self
  WCN_E_PEER_NOT_FOUND = -2147206143_i32
  WCN_E_AUTHENTICATION_FAILED = -2147206142_i32
  WCN_E_CONNECTION_REJECTED = -2147206141_i32
  WCN_E_SESSION_TIMEDOUT = -2147206140_i32
  WCN_E_PROTOCOL_ERROR = -2147206139_i32
  WCN_QUERY_CONSTRAINT_USE_SOFTAP = "WCN.Discovery.SoftAP"
  WCN_VALUE_DT_CATEGORY_COMPUTER = 1_u32
  WCN_VALUE_DT_CATEGORY_INPUT_DEVICE = 2_u32
  WCN_VALUE_DT_CATEGORY_PRINTER = 3_u32
  WCN_VALUE_DT_CATEGORY_CAMERA = 4_u32
  WCN_VALUE_DT_CATEGORY_STORAGE = 5_u32
  WCN_VALUE_DT_CATEGORY_NETWORK_INFRASTRUCTURE = 6_u32
  WCN_VALUE_DT_CATEGORY_DISPLAY = 7_u32
  WCN_VALUE_DT_CATEGORY_MULTIMEDIA_DEVICE = 8_u32
  WCN_VALUE_DT_CATEGORY_GAMING_DEVICE = 9_u32
  WCN_VALUE_DT_CATEGORY_TELEPHONE = 10_u32
  WCN_VALUE_DT_CATEGORY_AUDIO_DEVICE = 11_u32
  WCN_VALUE_DT_CATEGORY_OTHER = 255_u32
  WCN_VALUE_DT_SUBTYPE_WIFI_OUI = 5304836_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__PC = 1_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__SERVER = 2_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__MEDIACENTER = 3_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__ULTRAMOBILEPC = 4_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__NOTEBOOK = 5_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__DESKTOP = 6_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__MID = 7_u32
  WCN_VALUE_DT_SUBTYPE_COMPUTER__NETBOOK = 8_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__KEYBOARD = 1_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__MOUSE = 2_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__JOYSTICK = 3_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__TRACKBALL = 4_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__GAMECONTROLLER = 5_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__REMOTE = 6_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__TOUCHSCREEN = 7_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__BIOMETRICREADER = 8_u32
  WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__BARCODEREADER = 9_u32
  WCN_VALUE_DT_SUBTYPE_PRINTER__PRINTER = 1_u32
  WCN_VALUE_DT_SUBTYPE_PRINTER__SCANNER = 2_u32
  WCN_VALUE_DT_SUBTYPE_PRINTER__FAX = 3_u32
  WCN_VALUE_DT_SUBTYPE_PRINTER__COPIER = 4_u32
  WCN_VALUE_DT_SUBTYPE_PRINTER__ALLINONE = 5_u32
  WCN_VALUE_DT_SUBTYPE_CAMERA__STILL_CAMERA = 1_u32
  WCN_VALUE_DT_SUBTYPE_CAMERA__VIDEO_CAMERA = 2_u32
  WCN_VALUE_DT_SUBTYPE_CAMERA__WEB_CAMERA = 3_u32
  WCN_VALUE_DT_SUBTYPE_CAMERA__SECURITY_CAMERA = 4_u32
  WCN_VALUE_DT_SUBTYPE_STORAGE__NAS = 1_u32
  WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__AP = 1_u32
  WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__ROUTER = 2_u32
  WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__SWITCH = 3_u32
  WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__GATEWAY = 4_u32
  WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__BRIDGE = 5_u32
  WCN_VALUE_DT_SUBTYPE_DISPLAY__TELEVISION = 1_u32
  WCN_VALUE_DT_SUBTYPE_DISPLAY__PICTURE_FRAME = 2_u32
  WCN_VALUE_DT_SUBTYPE_DISPLAY__PROJECTOR = 3_u32
  WCN_VALUE_DT_SUBTYPE_DISPLAY__MONITOR = 4_u32
  WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__DAR = 1_u32
  WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__PVR = 2_u32
  WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__MCX = 3_u32
  WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__SETTOPBOX = 4_u32
  WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__MEDIA_SERVER_ADAPT_EXT = 5_u32
  WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__PVP = 6_u32
  WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__XBOX = 1_u32
  WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__XBOX360 = 2_u32
  WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__PLAYSTATION = 3_u32
  WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__CONSOLE_ADAPT = 4_u32
  WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__PORTABLE = 5_u32
  WCN_VALUE_DT_SUBTYPE_TELEPHONE__WINDOWS_MOBILE = 1_u32
  WCN_VALUE_DT_SUBTYPE_TELEPHONE__PHONE_SINGLEMODE = 2_u32
  WCN_VALUE_DT_SUBTYPE_TELEPHONE__PHONE_DUALMODE = 3_u32
  WCN_VALUE_DT_SUBTYPE_TELEPHONE__SMARTPHONE_SINGLEMODE = 4_u32
  WCN_VALUE_DT_SUBTYPE_TELEPHONE__SMARTPHONE_DUALMODE = 5_u32
  WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__TUNER_RECEIVER = 1_u32
  WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__SPEAKERS = 2_u32
  WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__PMP = 3_u32
  WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__HEADSET = 4_u32
  WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__HEADPHONES = 5_u32
  WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__MICROPHONE = 6_u32
  WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__HOMETHEATER = 7_u32
  WCN_API_MAX_BUFFER_SIZE = 2096_u32
  WCN_MICROSOFT_VENDOR_ID = 311_u32
  WCN_NO_SUBTYPE = 4294967294_u32
  WCN_FLAG_DISCOVERY_VE = 1_u32
  WCN_FLAG_AUTHENTICATED_VE = 2_u32
  WCN_FLAG_ENCRYPTED_VE = 4_u32
  SID_WcnProvider = "c100beca-d33a-4a4b-bf23-bbef4663d017"
  PKEY_WCN_DeviceType_Category = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b8b_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 16_u32)
  PKEY_WCN_DeviceType_SubCategoryOUI = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b8b_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 17_u32)
  PKEY_WCN_DeviceType_SubCategory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b8b_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 18_u32)
  PKEY_WCN_SSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b8b_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 32_u32)

  CLSID_WCNDeviceObject = LibC::GUID.new(0xc100bea7_u32, 0xd33a_u16, 0x4a4b_u16, StaticArray[0xbf_u8, 0x23_u8, 0xbb_u8, 0xef_u8, 0x46_u8, 0x63_u8, 0xd0_u8, 0x17_u8])

  enum WCN_ATTRIBUTE_TYPE
    WCN_TYPE_AP_CHANNEL = 0_i32
    WCN_TYPE_ASSOCIATION_STATE = 1_i32
    WCN_TYPE_AUTHENTICATION_TYPE = 2_i32
    WCN_TYPE_AUTHENTICATION_TYPE_FLAGS = 3_i32
    WCN_TYPE_AUTHENTICATOR = 4_i32
    WCN_TYPE_CONFIG_METHODS = 5_i32
    WCN_TYPE_CONFIGURATION_ERROR = 6_i32
    WCN_TYPE_CONFIRMATION_URL4 = 7_i32
    WCN_TYPE_CONFIRMATION_URL6 = 8_i32
    WCN_TYPE_CONNECTION_TYPE = 9_i32
    WCN_TYPE_CONNECTION_TYPE_FLAGS = 10_i32
    WCN_TYPE_CREDENTIAL = 11_i32
    WCN_TYPE_DEVICE_NAME = 12_i32
    WCN_TYPE_DEVICE_PASSWORD_ID = 13_i32
    WCN_TYPE_E_HASH1 = 14_i32
    WCN_TYPE_E_HASH2 = 15_i32
    WCN_TYPE_E_SNONCE1 = 16_i32
    WCN_TYPE_E_SNONCE2 = 17_i32
    WCN_TYPE_ENCRYPTED_SETTINGS = 18_i32
    WCN_TYPE_ENCRYPTION_TYPE = 19_i32
    WCN_TYPE_ENCRYPTION_TYPE_FLAGS = 20_i32
    WCN_TYPE_ENROLLEE_NONCE = 21_i32
    WCN_TYPE_FEATURE_ID = 22_i32
    WCN_TYPE_IDENTITY = 23_i32
    WCN_TYPE_IDENTITY_PROOF = 24_i32
    WCN_TYPE_KEY_WRAP_AUTHENTICATOR = 25_i32
    WCN_TYPE_KEY_IDENTIFIER = 26_i32
    WCN_TYPE_MAC_ADDRESS = 27_i32
    WCN_TYPE_MANUFACTURER = 28_i32
    WCN_TYPE_MESSAGE_TYPE = 29_i32
    WCN_TYPE_MODEL_NAME = 30_i32
    WCN_TYPE_MODEL_NUMBER = 31_i32
    WCN_TYPE_NETWORK_INDEX = 32_i32
    WCN_TYPE_NETWORK_KEY = 33_i32
    WCN_TYPE_NETWORK_KEY_INDEX = 34_i32
    WCN_TYPE_NEW_DEVICE_NAME = 35_i32
    WCN_TYPE_NEW_PASSWORD = 36_i32
    WCN_TYPE_OOB_DEVICE_PASSWORD = 37_i32
    WCN_TYPE_OS_VERSION = 38_i32
    WCN_TYPE_POWER_LEVEL = 39_i32
    WCN_TYPE_PSK_CURRENT = 40_i32
    WCN_TYPE_PSK_MAX = 41_i32
    WCN_TYPE_PUBLIC_KEY = 42_i32
    WCN_TYPE_RADIO_ENABLED = 43_i32
    WCN_TYPE_REBOOT = 44_i32
    WCN_TYPE_REGISTRAR_CURRENT = 45_i32
    WCN_TYPE_REGISTRAR_ESTABLISHED = 46_i32
    WCN_TYPE_REGISTRAR_LIST = 47_i32
    WCN_TYPE_REGISTRAR_MAX = 48_i32
    WCN_TYPE_REGISTRAR_NONCE = 49_i32
    WCN_TYPE_REQUEST_TYPE = 50_i32
    WCN_TYPE_RESPONSE_TYPE = 51_i32
    WCN_TYPE_RF_BANDS = 52_i32
    WCN_TYPE_R_HASH1 = 53_i32
    WCN_TYPE_R_HASH2 = 54_i32
    WCN_TYPE_R_SNONCE1 = 55_i32
    WCN_TYPE_R_SNONCE2 = 56_i32
    WCN_TYPE_SELECTED_REGISTRAR = 57_i32
    WCN_TYPE_SERIAL_NUMBER = 58_i32
    WCN_TYPE_WI_FI_PROTECTED_SETUP_STATE = 59_i32
    WCN_TYPE_SSID = 60_i32
    WCN_TYPE_TOTAL_NETWORKS = 61_i32
    WCN_TYPE_UUID_E = 62_i32
    WCN_TYPE_UUID_R = 63_i32
    WCN_TYPE_VENDOR_EXTENSION = 64_i32
    WCN_TYPE_VERSION = 65_i32
    WCN_TYPE_X_509_CERTIFICATE_REQUEST = 66_i32
    WCN_TYPE_X_509_CERTIFICATE = 67_i32
    WCN_TYPE_EAP_IDENTITY = 68_i32
    WCN_TYPE_MESSAGE_COUNTER = 69_i32
    WCN_TYPE_PUBLIC_KEY_HASH = 70_i32
    WCN_TYPE_REKEY_KEY = 71_i32
    WCN_TYPE_KEY_LIFETIME = 72_i32
    WCN_TYPE_PERMITTED_CONFIG_METHODS = 73_i32
    WCN_TYPE_SELECTED_REGISTRAR_CONFIG_METHODS = 74_i32
    WCN_TYPE_PRIMARY_DEVICE_TYPE = 75_i32
    WCN_TYPE_SECONDARY_DEVICE_TYPE_LIST = 76_i32
    WCN_TYPE_PORTABLE_DEVICE = 77_i32
    WCN_TYPE_AP_SETUP_LOCKED = 78_i32
    WCN_TYPE_APPLICATION_EXTENSION = 79_i32
    WCN_TYPE_EAP_TYPE = 80_i32
    WCN_TYPE_INITIALIZATION_VECTOR = 81_i32
    WCN_TYPE_KEY_PROVIDED_AUTOMATICALLY = 82_i32
    WCN_TYPE_802_1X_ENABLED = 83_i32
    WCN_TYPE_APPSESSIONKEY = 84_i32
    WCN_TYPE_WEPTRANSMITKEY = 85_i32
    WCN_TYPE_UUID = 86_i32
    WCN_TYPE_PRIMARY_DEVICE_TYPE_CATEGORY = 87_i32
    WCN_TYPE_PRIMARY_DEVICE_TYPE_SUBCATEGORY_OUI = 88_i32
    WCN_TYPE_PRIMARY_DEVICE_TYPE_SUBCATEGORY = 89_i32
    WCN_TYPE_CURRENT_SSID = 90_i32
    WCN_TYPE_BSSID = 91_i32
    WCN_TYPE_DOT11_MAC_ADDRESS = 92_i32
    WCN_TYPE_AUTHORIZED_MACS = 93_i32
    WCN_TYPE_NETWORK_KEY_SHAREABLE = 94_i32
    WCN_TYPE_REQUEST_TO_ENROLL = 95_i32
    WCN_TYPE_REQUESTED_DEVICE_TYPE = 96_i32
    WCN_TYPE_SETTINGS_DELAY_TIME = 97_i32
    WCN_TYPE_VERSION2 = 98_i32
    WCN_TYPE_VENDOR_EXTENSION_WFA = 99_i32
    WCN_NUM_ATTRIBUTE_TYPES = 100_i32
  end
  enum WCN_VALUE_TYPE_VERSION
    WCN_VALUE_VERSION_1_0 = 16_i32
    WCN_VALUE_VERSION_2_0 = 32_i32
  end
  enum WCN_VALUE_TYPE_BOOLEAN
    WCN_VALUE_FALSE = 0_i32
    WCN_VALUE_TRUE = 1_i32
  end
  enum WCN_VALUE_TYPE_ASSOCIATION_STATE
    WCN_VALUE_AS_NOT_ASSOCIATED = 0_i32
    WCN_VALUE_AS_CONNECTION_SUCCESS = 1_i32
    WCN_VALUE_AS_CONFIGURATION_FAILURE = 2_i32
    WCN_VALUE_AS_ASSOCIATION_FAILURE = 3_i32
    WCN_VALUE_AS_IP_FAILURE = 4_i32
  end
  enum WCN_VALUE_TYPE_AUTHENTICATION_TYPE
    WCN_VALUE_AT_OPEN = 1_i32
    WCN_VALUE_AT_WPAPSK = 2_i32
    WCN_VALUE_AT_SHARED = 4_i32
    WCN_VALUE_AT_WPA = 8_i32
    WCN_VALUE_AT_WPA2 = 16_i32
    WCN_VALUE_AT_WPA2PSK = 32_i32
    WCN_VALUE_AT_WPAWPA2PSK_MIXED = 34_i32
  end
  enum WCN_VALUE_TYPE_CONFIG_METHODS
    WCN_VALUE_CM_USBA = 1_i32
    WCN_VALUE_CM_ETHERNET = 2_i32
    WCN_VALUE_CM_LABEL = 4_i32
    WCN_VALUE_CM_DISPLAY = 8_i32
    WCN_VALUE_CM_EXTERNAL_NFC = 16_i32
    WCN_VALUE_CM_INTEGRATED_NFC = 32_i32
    WCN_VALUE_CM_NFC_INTERFACE = 64_i32
    WCN_VALUE_CM_PUSHBUTTON = 128_i32
    WCN_VALUE_CM_KEYPAD = 256_i32
    WCN_VALUE_CM_VIRT_PUSHBUTTON = 640_i32
    WCN_VALUE_CM_PHYS_PUSHBUTTON = 1152_i32
    WCN_VALUE_CM_VIRT_DISPLAY = 8200_i32
    WCN_VALUE_CM_PHYS_DISPLAY = 16392_i32
  end
  enum WCN_VALUE_TYPE_CONFIGURATION_ERROR
    WCN_VALUE_CE_NO_ERROR = 0_i32
    WCN_VALUE_CE_OOB_INTERFACE_READ_ERROR = 1_i32
    WCN_VALUE_CE_DECRYPTION_CRC_FAILURE = 2_i32
    WCN_VALUE_CE_2_4_CHANNEL_NOT_SUPPORTED = 3_i32
    WCN_VALUE_CE_5_0_CHANNEL_NOT_SUPPORTED = 4_i32
    WCN_VALUE_CE_SIGNAL_TOO_WEAK = 5_i32
    WCN_VALUE_CE_NETWORK_AUTHENTICATION_FAILURE = 6_i32
    WCN_VALUE_CE_NETWORK_ASSOCIATION_FAILURE = 7_i32
    WCN_VALUE_CE_NO_DHCP_RESPONSE = 8_i32
    WCN_VALUE_CE_FAILED_DHCP_CONFIG = 9_i32
    WCN_VALUE_CE_IP_ADDRESS_CONFLICT = 10_i32
    WCN_VALUE_CE_COULD_NOT_CONNECT_TO_REGISTRAR = 11_i32
    WCN_VALUE_CE_MULTIPLE_PBC_SESSIONS_DETECTED = 12_i32
    WCN_VALUE_CE_ROGUE_ACTIVITY_SUSPECTED = 13_i32
    WCN_VALUE_CE_DEVICE_BUSY = 14_i32
    WCN_VALUE_CE_SETUP_LOCKED = 15_i32
    WCN_VALUE_CE_MESSAGE_TIMEOUT = 16_i32
    WCN_VALUE_CE_REGISTRATION_SESSION_TIMEOUT = 17_i32
    WCN_VALUE_CE_DEVICE_PASSWORD_AUTH_FAILURE = 18_i32
  end
  enum WCN_VALUE_TYPE_CONNECTION_TYPE
    WCN_VALUE_CT_ESS = 1_i32
    WCN_VALUE_CT_IBSS = 2_i32
  end
  enum WCN_VALUE_TYPE_DEVICE_PASSWORD_ID
    WCN_VALUE_DP_DEFAULT = 0_i32
    WCN_VALUE_DP_USER_SPECIFIED = 1_i32
    WCN_VALUE_DP_MACHINE_SPECIFIED = 2_i32
    WCN_VALUE_DP_REKEY = 3_i32
    WCN_VALUE_DP_PUSHBUTTON = 4_i32
    WCN_VALUE_DP_REGISTRAR_SPECIFIED = 5_i32
    WCN_VALUE_DP_NFC_CONNECTION_HANDOVER = 7_i32
    WCN_VALUE_DP_WFD_SERVICES = 8_i32
    WCN_VALUE_DP_OUTOFBAND_MIN = 16_i32
    WCN_VALUE_DP_OUTOFBAND_MAX = 65535_i32
  end
  enum WCN_VALUE_TYPE_ENCRYPTION_TYPE
    WCN_VALUE_ET_NONE = 1_i32
    WCN_VALUE_ET_WEP = 2_i32
    WCN_VALUE_ET_TKIP = 4_i32
    WCN_VALUE_ET_AES = 8_i32
    WCN_VALUE_ET_TKIP_AES_MIXED = 12_i32
  end
  enum WCN_VALUE_TYPE_MESSAGE_TYPE
    WCN_VALUE_MT_BEACON = 1_i32
    WCN_VALUE_MT_PROBE_REQUEST = 2_i32
    WCN_VALUE_MT_PROBE_RESPONSE = 3_i32
    WCN_VALUE_MT_M1 = 4_i32
    WCN_VALUE_MT_M2 = 5_i32
    WCN_VALUE_MT_M2D = 6_i32
    WCN_VALUE_MT_M3 = 7_i32
    WCN_VALUE_MT_M4 = 8_i32
    WCN_VALUE_MT_M5 = 9_i32
    WCN_VALUE_MT_M6 = 10_i32
    WCN_VALUE_MT_M7 = 11_i32
    WCN_VALUE_MT_M8 = 12_i32
    WCN_VALUE_MT_ACK = 13_i32
    WCN_VALUE_MT_NACK = 14_i32
    WCN_VALUE_MT_DONE = 15_i32
  end
  enum WCN_VALUE_TYPE_REQUEST_TYPE
    WCN_VALUE_ReqT_ENROLLEE_INFO = 0_i32
    WCN_VALUE_ReqT_ENROLLEE_OPEN_1X = 1_i32
    WCN_VALUE_ReqT_REGISTRAR = 2_i32
    WCN_VALUE_ReqT_MANAGER_REGISTRAR = 3_i32
  end
  enum WCN_VALUE_TYPE_RESPONSE_TYPE
    WCN_VALUE_RspT_ENROLLEE_INFO = 0_i32
    WCN_VALUE_RspT_ENROLLEE_OPEN_1X = 1_i32
    WCN_VALUE_RspT_REGISTRAR = 2_i32
    WCN_VALUE_RspT_AP = 3_i32
  end
  enum WCN_VALUE_TYPE_RF_BANDS
    WCN_VALUE_RB_24GHZ = 1_i32
    WCN_VALUE_RB_50GHZ = 2_i32
  end
  enum WCN_VALUE_TYPE_WI_FI_PROTECTED_SETUP_STATE
    WCN_VALUE_SS_RESERVED00 = 0_i32
    WCN_VALUE_SS_NOT_CONFIGURED = 1_i32
    WCN_VALUE_SS_CONFIGURED = 2_i32
  end
  enum WCN_PASSWORD_TYPE
    WCN_PASSWORD_TYPE_PUSH_BUTTON = 0_i32
    WCN_PASSWORD_TYPE_PIN = 1_i32
    WCN_PASSWORD_TYPE_PIN_REGISTRAR_SPECIFIED = 2_i32
    WCN_PASSWORD_TYPE_OOB_SPECIFIED = 3_i32
    WCN_PASSWORD_TYPE_WFDS = 4_i32
  end
  enum WCN_SESSION_STATUS
    WCN_SESSION_STATUS_SUCCESS = 0_i32
    WCN_SESSION_STATUS_FAILURE_GENERIC = 1_i32
    WCN_SESSION_STATUS_FAILURE_TIMEOUT = 2_i32
  end

  @[Extern]
  struct WCN_VALUE_TYPE_PRIMARY_DEVICE_TYPE
    property category : UInt16
    property sub_category_oui : UInt32
    property sub_category : UInt16
    def initialize(@category : UInt16, @sub_category_oui : UInt32, @sub_category : UInt16)
    end
  end

  @[Extern]
  struct WCN_VENDOR_EXTENSION_SPEC
    property vendor_id : UInt32
    property sub_type : UInt32
    property index : UInt32
    property flags : UInt32
    def initialize(@vendor_id : UInt32, @sub_type : UInt32, @index : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  record IWCNDeviceVtbl,
    query_interface : Proc(IWCNDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWCNDevice*, UInt32),
    release : Proc(IWCNDevice*, UInt32),
    set_password : Proc(IWCNDevice*, Win32cr::NetworkManagement::WindowsConnectNow::WCN_PASSWORD_TYPE, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    connect : Proc(IWCNDevice*, Void*, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(IWCNDevice*, Win32cr::NetworkManagement::WindowsConnectNow::WCN_ATTRIBUTE_TYPE, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_integer_attribute : Proc(IWCNDevice*, Win32cr::NetworkManagement::WindowsConnectNow::WCN_ATTRIBUTE_TYPE, UInt32*, Win32cr::Foundation::HRESULT),
    get_string_attribute : Proc(IWCNDevice*, Win32cr::NetworkManagement::WindowsConnectNow::WCN_ATTRIBUTE_TYPE, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_network_profile : Proc(IWCNDevice*, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    set_network_profile : Proc(IWCNDevice*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_vendor_extension : Proc(IWCNDevice*, Win32cr::NetworkManagement::WindowsConnectNow::WCN_VENDOR_EXTENSION_SPEC*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_vendor_extension : Proc(IWCNDevice*, Win32cr::NetworkManagement::WindowsConnectNow::WCN_VENDOR_EXTENSION_SPEC*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IWCNDevice*, Win32cr::Foundation::HRESULT),
    set_nfc_password_params : Proc(IWCNDevice*, Win32cr::NetworkManagement::WindowsConnectNow::WCN_PASSWORD_TYPE, UInt32, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWCNDevice, lpVtbl : IWCNDeviceVtbl* do
    GUID = LibC::GUID.new(0xc100be9c_u32, 0xd33a_u16, 0x4a4b_u16, StaticArray[0xbf_u8, 0x23_u8, 0xbb_u8, 0xef_u8, 0x46_u8, 0x63_u8, 0xd0_u8, 0x17_u8])
    def query_interface(this : IWCNDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWCNDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWCNDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_password(this : IWCNDevice*, type__ : Win32cr::NetworkManagement::WindowsConnectNow::WCN_PASSWORD_TYPE, dwPasswordLength : UInt32, pbPassword : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_password.call(this, type__, dwPasswordLength, pbPassword)
    end
    def connect(this : IWCNDevice*, pNotify : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, pNotify)
    end
    def get_attribute(this : IWCNDevice*, attribute_type : Win32cr::NetworkManagement::WindowsConnectNow::WCN_ATTRIBUTE_TYPE, dwMaxBufferSize : UInt32, pbBuffer : UInt8*, pdwBufferUsed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, attribute_type, dwMaxBufferSize, pbBuffer, pdwBufferUsed)
    end
    def get_integer_attribute(this : IWCNDevice*, attribute_type : Win32cr::NetworkManagement::WindowsConnectNow::WCN_ATTRIBUTE_TYPE, puInteger : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_integer_attribute.call(this, attribute_type, puInteger)
    end
    def get_string_attribute(this : IWCNDevice*, attribute_type : Win32cr::NetworkManagement::WindowsConnectNow::WCN_ATTRIBUTE_TYPE, cchMaxString : UInt32, wszString : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute.call(this, attribute_type, cchMaxString, wszString)
    end
    def get_network_profile(this : IWCNDevice*, cchMaxStringLength : UInt32, wszProfile : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_profile.call(this, cchMaxStringLength, wszProfile)
    end
    def set_network_profile(this : IWCNDevice*, pszProfileXml : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_profile.call(this, pszProfileXml)
    end
    def get_vendor_extension(this : IWCNDevice*, pVendorExtSpec : Win32cr::NetworkManagement::WindowsConnectNow::WCN_VENDOR_EXTENSION_SPEC*, dwMaxBufferSize : UInt32, pbBuffer : UInt8*, pdwBufferUsed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_extension.call(this, pVendorExtSpec, dwMaxBufferSize, pbBuffer, pdwBufferUsed)
    end
    def set_vendor_extension(this : IWCNDevice*, pVendorExtSpec : Win32cr::NetworkManagement::WindowsConnectNow::WCN_VENDOR_EXTENSION_SPEC*, cbBuffer : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_vendor_extension.call(this, pVendorExtSpec, cbBuffer, pbBuffer)
    end
    def unadvise(this : IWCNDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this)
    end
    def set_nfc_password_params(this : IWCNDevice*, type__ : Win32cr::NetworkManagement::WindowsConnectNow::WCN_PASSWORD_TYPE, dwOOBPasswordID : UInt32, dwPasswordLength : UInt32, pbPassword : UInt8*, dwRemotePublicKeyHashLength : UInt32, pbRemotePublicKeyHash : UInt8*, dwDHKeyBlobLength : UInt32, pbDHKeyBlob : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_nfc_password_params.call(this, type__, dwOOBPasswordID, dwPasswordLength, pbPassword, dwRemotePublicKeyHashLength, pbRemotePublicKeyHash, dwDHKeyBlobLength, pbDHKeyBlob)
    end

  end

  @[Extern]
  record IWCNConnectNotifyVtbl,
    query_interface : Proc(IWCNConnectNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWCNConnectNotify*, UInt32),
    release : Proc(IWCNConnectNotify*, UInt32),
    connect_succeeded : Proc(IWCNConnectNotify*, Win32cr::Foundation::HRESULT),
    connect_failed : Proc(IWCNConnectNotify*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWCNConnectNotify, lpVtbl : IWCNConnectNotifyVtbl* do
    GUID = LibC::GUID.new(0xc100be9f_u32, 0xd33a_u16, 0x4a4b_u16, StaticArray[0xbf_u8, 0x23_u8, 0xbb_u8, 0xef_u8, 0x46_u8, 0x63_u8, 0xd0_u8, 0x17_u8])
    def query_interface(this : IWCNConnectNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWCNConnectNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWCNConnectNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect_succeeded(this : IWCNConnectNotify*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_succeeded.call(this)
    end
    def connect_failed(this : IWCNConnectNotify*, hrFailure : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_failed.call(this, hrFailure)
    end

  end

end