require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  CLSID_MbnConnectionProfileManager = LibC::GUID.new(0xbdfee05a_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])
  CLSID_MbnInterfaceManager = LibC::GUID.new(0xbdfee05b_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])
  CLSID_MbnConnectionManager = LibC::GUID.new(0xbdfee05c_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])
  CLSID_MbnDeviceServicesManager = LibC::GUID.new(0x2269daa3_u32, 0x2a9f_u16, 0x4165_u16, StaticArray[0xa5_u8, 0x1_u8, 0xce_u8, 0x0_u8, 0xa6_u8, 0xf7_u8, 0xa7_u8, 0x5b_u8])


  enum MBN_SIGNAL_CONSTANTS : Int32
    MBN_RSSI_DEFAULT = -1
    MBN_RSSI_DISABLE = 0
    MBN_RSSI_UNKNOWN = 99
    MBN_ERROR_RATE_UNKNOWN = 99
  end

  enum MBN_CELLULAR_CLASS : Int32
    MBN_CELLULAR_CLASS_NONE = 0
    MBN_CELLULAR_CLASS_GSM = 1
    MBN_CELLULAR_CLASS_CDMA = 2
  end

  enum MBN_VOICE_CLASS : Int32
    MBN_VOICE_CLASS_NONE = 0
    MBN_VOICE_CLASS_NO_VOICE = 1
    MBN_VOICE_CLASS_SEPARATE_VOICE_DATA = 2
    MBN_VOICE_CLASS_SIMULTANEOUS_VOICE_DATA = 3
  end

  enum MBN_PROVIDER_STATE : Int32
    MBN_PROVIDER_STATE_NONE = 0
    MBN_PROVIDER_STATE_HOME = 1
    MBN_PROVIDER_STATE_FORBIDDEN = 2
    MBN_PROVIDER_STATE_PREFERRED = 4
    MBN_PROVIDER_STATE_VISIBLE = 8
    MBN_PROVIDER_STATE_REGISTERED = 16
    MBN_PROVIDER_STATE_PREFERRED_MULTICARRIER = 32
  end

  enum MBN_PROVIDER_CONSTANTS : Int32
    MBN_PROVIDERNAME_LEN = 20
    MBN_PROVIDERID_LEN = 6
  end

  enum MBN_INTERFACE_CAPS_CONSTANTS : Int32
    MBN_DEVICEID_LEN = 18
    MBN_MANUFACTURER_LEN = 32
    MBN_MODEL_LEN = 32
    MBN_FIRMWARE_LEN = 32
  end

  enum MBN_DATA_CLASS : Int32
    MBN_DATA_CLASS_NONE = 0
    MBN_DATA_CLASS_GPRS = 1
    MBN_DATA_CLASS_EDGE = 2
    MBN_DATA_CLASS_UMTS = 4
    MBN_DATA_CLASS_HSDPA = 8
    MBN_DATA_CLASS_HSUPA = 16
    MBN_DATA_CLASS_LTE = 32
    MBN_DATA_CLASS_5G_NSA = 64
    MBN_DATA_CLASS_5G_SA = 128
    MBN_DATA_CLASS_1XRTT = 65536
    MBN_DATA_CLASS_1XEVDO = 131072
    MBN_DATA_CLASS_1XEVDO_REVA = 262144
    MBN_DATA_CLASS_1XEVDV = 524288
    MBN_DATA_CLASS_3XRTT = 1048576
    MBN_DATA_CLASS_1XEVDO_REVB = 2097152
    MBN_DATA_CLASS_UMB = 4194304
    MBN_DATA_CLASS_CUSTOM = -2147483648
  end

  enum MBN_CTRL_CAPS : Int32
    MBN_CTRL_CAPS_NONE = 0
    MBN_CTRL_CAPS_REG_MANUAL = 1
    MBN_CTRL_CAPS_HW_RADIO_SWITCH = 2
    MBN_CTRL_CAPS_CDMA_MOBILE_IP = 4
    MBN_CTRL_CAPS_CDMA_SIMPLE_IP = 8
    MBN_CTRL_CAPS_PROTECT_UNIQUEID = 16
    MBN_CTRL_CAPS_MODEL_MULTI_CARRIER = 32
    MBN_CTRL_CAPS_USSD = 64
    MBN_CTRL_CAPS_MULTI_MODE = 128
  end

  enum MBN_SMS_CAPS : Int32
    MBN_SMS_CAPS_NONE = 0
    MBN_SMS_CAPS_PDU_RECEIVE = 1
    MBN_SMS_CAPS_PDU_SEND = 2
    MBN_SMS_CAPS_TEXT_RECEIVE = 4
    MBN_SMS_CAPS_TEXT_SEND = 8
  end

  enum MBN_BAND_CLASS : Int32
    MBN_BAND_CLASS_NONE = 0
    MBN_BAND_CLASS_0 = 1
    MBN_BAND_CLASS_I = 2
    MBN_BAND_CLASS_II = 4
    MBN_BAND_CLASS_III = 8
    MBN_BAND_CLASS_IV = 16
    MBN_BAND_CLASS_V = 32
    MBN_BAND_CLASS_VI = 64
    MBN_BAND_CLASS_VII = 128
    MBN_BAND_CLASS_VIII = 256
    MBN_BAND_CLASS_IX = 512
    MBN_BAND_CLASS_X = 1024
    MBN_BAND_CLASS_XI = 2048
    MBN_BAND_CLASS_XII = 4096
    MBN_BAND_CLASS_XIII = 8192
    MBN_BAND_CLASS_XIV = 16384
    MBN_BAND_CLASS_XV = 32768
    MBN_BAND_CLASS_XVI = 65536
    MBN_BAND_CLASS_XVII = 131072
    MBN_BAND_CLASS_CUSTOM = -2147483648
  end

  enum MBN_READY_STATE : Int32
    MBN_READY_STATE_OFF = 0
    MBN_READY_STATE_INITIALIZED = 1
    MBN_READY_STATE_SIM_NOT_INSERTED = 2
    MBN_READY_STATE_BAD_SIM = 3
    MBN_READY_STATE_FAILURE = 4
    MBN_READY_STATE_NOT_ACTIVATED = 5
    MBN_READY_STATE_DEVICE_LOCKED = 6
    MBN_READY_STATE_DEVICE_BLOCKED = 7
    MBN_READY_STATE_NO_ESIM_PROFILE = 8
  end

  enum MBN_ACTIVATION_STATE : Int32
    MBN_ACTIVATION_STATE_NONE = 0
    MBN_ACTIVATION_STATE_ACTIVATED = 1
    MBN_ACTIVATION_STATE_ACTIVATING = 2
    MBN_ACTIVATION_STATE_DEACTIVATED = 3
    MBN_ACTIVATION_STATE_DEACTIVATING = 4
  end

  enum MBN_CONNECTION_MODE : Int32
    MBN_CONNECTION_MODE_PROFILE = 0
    MBN_CONNECTION_MODE_TMP_PROFILE = 1
  end

  enum MBN_VOICE_CALL_STATE : Int32
    MBN_VOICE_CALL_STATE_NONE = 0
    MBN_VOICE_CALL_STATE_IN_PROGRESS = 1
    MBN_VOICE_CALL_STATE_HANGUP = 2
  end

  enum MBN_REGISTRATION_CONSTANTS : Int32
    MBN_ROAMTEXT_LEN = 64
    MBN_CDMA_DEFAULT_PROVIDER_ID = 0
  end

  enum MBN_REGISTER_STATE : Int32
    MBN_REGISTER_STATE_NONE = 0
    MBN_REGISTER_STATE_DEREGISTERED = 1
    MBN_REGISTER_STATE_SEARCHING = 2
    MBN_REGISTER_STATE_HOME = 3
    MBN_REGISTER_STATE_ROAMING = 4
    MBN_REGISTER_STATE_PARTNER = 5
    MBN_REGISTER_STATE_DENIED = 6
  end

  enum MBN_REGISTER_MODE : Int32
    MBN_REGISTER_MODE_NONE = 0
    MBN_REGISTER_MODE_AUTOMATIC = 1
    MBN_REGISTER_MODE_MANUAL = 2
  end

  enum MBN_PIN_CONSTANTS : Int32
    MBN_ATTEMPTS_REMAINING_UNKNOWN = -1
    MBN_PIN_LENGTH_UNKNOWN = -1
  end

  enum MBN_PIN_STATE : Int32
    MBN_PIN_STATE_NONE = 0
    MBN_PIN_STATE_ENTER = 1
    MBN_PIN_STATE_UNBLOCK = 2
  end

  enum MBN_PIN_TYPE : Int32
    MBN_PIN_TYPE_NONE = 0
    MBN_PIN_TYPE_CUSTOM = 1
    MBN_PIN_TYPE_PIN1 = 2
    MBN_PIN_TYPE_PIN2 = 3
    MBN_PIN_TYPE_DEVICE_SIM_PIN = 4
    MBN_PIN_TYPE_DEVICE_FIRST_SIM_PIN = 5
    MBN_PIN_TYPE_NETWORK_PIN = 6
    MBN_PIN_TYPE_NETWORK_SUBSET_PIN = 7
    MBN_PIN_TYPE_SVC_PROVIDER_PIN = 8
    MBN_PIN_TYPE_CORPORATE_PIN = 9
    MBN_PIN_TYPE_SUBSIDY_LOCK = 10
  end

  enum MBN_PIN_MODE : Int32
    MBN_PIN_MODE_ENABLED = 1
    MBN_PIN_MODE_DISABLED = 2
  end

  enum MBN_PIN_FORMAT : Int32
    MBN_PIN_FORMAT_NONE = 0
    MBN_PIN_FORMAT_NUMERIC = 1
    MBN_PIN_FORMAT_ALPHANUMERIC = 2
  end

  enum MBN_CONTEXT_CONSTANTS : Int32
    MBN_ACCESSSTRING_LEN = 100
    MBN_USERNAME_LEN = 255
    MBN_PASSWORD_LEN = 255
    MBN_CONTEXT_ID_APPEND = -1
  end

  enum MBN_AUTH_PROTOCOL : Int32
    MBN_AUTH_PROTOCOL_NONE = 0
    MBN_AUTH_PROTOCOL_PAP = 1
    MBN_AUTH_PROTOCOL_CHAP = 2
    MBN_AUTH_PROTOCOL_MSCHAPV2 = 3
  end

  enum MBN_COMPRESSION : Int32
    MBN_COMPRESSION_NONE = 0
    MBN_COMPRESSION_ENABLE = 1
  end

  enum MBN_CONTEXT_TYPE : Int32
    MBN_CONTEXT_TYPE_NONE = 0
    MBN_CONTEXT_TYPE_INTERNET = 1
    MBN_CONTEXT_TYPE_VPN = 2
    MBN_CONTEXT_TYPE_VOICE = 3
    MBN_CONTEXT_TYPE_VIDEO_SHARE = 4
    MBN_CONTEXT_TYPE_CUSTOM = 5
    MBN_CONTEXT_TYPE_PURCHASE = 6
  end

  enum WWAEXT_SMS_CONSTANTS : Int32
    MBN_MESSAGE_INDEX_NONE = 0
    MBN_CDMA_SHORT_MSG_SIZE_UNKNOWN = 0
    MBN_CDMA_SHORT_MSG_SIZE_MAX = 160
  end

  enum MBN_MSG_STATUS : Int32
    MBN_MSG_STATUS_NEW = 0
    MBN_MSG_STATUS_OLD = 1
    MBN_MSG_STATUS_DRAFT = 2
    MBN_MSG_STATUS_SENT = 3
  end

  enum MBN_SMS_CDMA_LANG : Int32
    MBN_SMS_CDMA_LANG_NONE = 0
    MBN_SMS_CDMA_LANG_ENGLISH = 1
    MBN_SMS_CDMA_LANG_FRENCH = 2
    MBN_SMS_CDMA_LANG_SPANISH = 3
    MBN_SMS_CDMA_LANG_JAPANESE = 4
    MBN_SMS_CDMA_LANG_KOREAN = 5
    MBN_SMS_CDMA_LANG_CHINESE = 6
    MBN_SMS_CDMA_LANG_HEBREW = 7
  end

  enum MBN_SMS_CDMA_ENCODING : Int32
    MBN_SMS_CDMA_ENCODING_OCTET = 0
    MBN_SMS_CDMA_ENCODING_EPM = 1
    MBN_SMS_CDMA_ENCODING_7BIT_ASCII = 2
    MBN_SMS_CDMA_ENCODING_IA5 = 3
    MBN_SMS_CDMA_ENCODING_UNICODE = 4
    MBN_SMS_CDMA_ENCODING_SHIFT_JIS = 5
    MBN_SMS_CDMA_ENCODING_KOREAN = 6
    MBN_SMS_CDMA_ENCODING_LATIN_HEBREW = 7
    MBN_SMS_CDMA_ENCODING_LATIN = 8
    MBN_SMS_CDMA_ENCODING_GSM_7BIT = 9
  end

  enum MBN_SMS_FLAG : Int32
    MBN_SMS_FLAG_ALL = 0
    MBN_SMS_FLAG_INDEX = 1
    MBN_SMS_FLAG_NEW = 2
    MBN_SMS_FLAG_OLD = 3
    MBN_SMS_FLAG_SENT = 4
    MBN_SMS_FLAG_DRAFT = 5
  end

  enum MBN_SMS_STATUS_FLAG : Int32
    MBN_SMS_FLAG_NONE = 0
    MBN_SMS_FLAG_MESSAGE_STORE_FULL = 1
    MBN_SMS_FLAG_NEW_MESSAGE = 2
  end

  enum MBN_SMS_FORMAT : Int32
    MBN_SMS_FORMAT_NONE = 0
    MBN_SMS_FORMAT_PDU = 1
    MBN_SMS_FORMAT_TEXT = 2
  end

  enum MBN_RADIO : Int32
    MBN_RADIO_OFF = 0
    MBN_RADIO_ON = 1
  end

  enum MBN_DEVICE_SERVICE_SESSIONS_STATE : Int32
    MBN_DEVICE_SERVICE_SESSIONS_RESTORED = 0
  end

  enum MBN_DEVICE_SERVICES_INTERFACE_STATE : Int32
    MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_ARRIVAL = 0
    MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_REMOVAL = 1
  end

  struct MBN_INTERFACE_CAPS
    cellular_class : MBN_CELLULAR_CLASS
    voice_class : MBN_VOICE_CLASS
    data_class : UInt32
    custom_data_class : UInt8*
    gsm_band_class : UInt32
    cdma_band_class : UInt32
    custom_band_class : UInt8*
    sms_caps : UInt32
    control_caps : UInt32
    device_id : UInt8*
    manufacturer : UInt8*
    model : UInt8*
    firmware_info : UInt8*
  end
  struct MBN_PROVIDER
    provider_id : UInt8*
    provider_state : UInt32
    provider_name : UInt8*
    data_class : UInt32
  end
  struct MBN_PROVIDER2
    provider : MBN_PROVIDER
    cellular_class : MBN_CELLULAR_CLASS
    signal_strength : UInt32
    signal_error : UInt32
  end
  struct MBN_PIN_INFO
    pin_state : MBN_PIN_STATE
    pin_type : MBN_PIN_TYPE
    attempts_remaining : UInt32
  end
  struct MBN_CONTEXT
    context_id : UInt32
    context_type : MBN_CONTEXT_TYPE
    access_string : UInt8*
    user_name : UInt8*
    password : UInt8*
    compression : MBN_COMPRESSION
    auth_type : MBN_AUTH_PROTOCOL
  end
  struct MBN_SMS_FILTER
    flag : MBN_SMS_FLAG
    message_index : UInt32
  end
  struct MBN_SMS_STATUS_INFO
    flag : UInt32
    message_index : UInt32
  end
  struct MBN_DEVICE_SERVICE
    device_service_id : UInt8*
    data_write_supported : Int16
    data_read_supported : Int16
  end
  struct Mbnapi_referenceremainingtypes__
    band_class : MBN_BAND_CLASS
    context_constants : MBN_CONTEXT_CONSTANTS
    ctrl_caps : MBN_CTRL_CAPS
    data_class : MBN_DATA_CLASS
    interface_caps_constants : MBN_INTERFACE_CAPS_CONSTANTS
    pin_constants : MBN_PIN_CONSTANTS
    provider_constants : MBN_PROVIDER_CONSTANTS
    provider_state : MBN_PROVIDER_STATE
    registration_constants : MBN_REGISTRATION_CONSTANTS
    signal_constants : MBN_SIGNAL_CONSTANTS
    sms_caps : MBN_SMS_CAPS
    sms_constants : WWAEXT_SMS_CONSTANTS
    wwaext_sms_constants : WWAEXT_SMS_CONSTANTS
    sms_status_flag : MBN_SMS_STATUS_FLAG
  end
  struct DummyPinType__
    pin_type : UInt32
  end


  struct IDummyMBNUCMExtVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IDummyMBNUCMExt_GUID = "dcbbbab6-ffff-4bbb-aaee-338e368af6fa"
  IID_IDummyMBNUCMExt = LibC::GUID.new(0xdcbbbab6_u32, 0xffff_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IDummyMBNUCMExt
    lpVtbl : IDummyMBNUCMExtVTbl*
  end

  struct IMbnConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_connection_id : UInt64
    get_interface_id : UInt64
    connect : UInt64
    disconnect : UInt64
    get_connection_state : UInt64
    get_voice_call_state : UInt64
    get_activation_network_error : UInt64
  end

  IMbnConnection_GUID = "dcbbbab6-200d-4bbb-aaee-338e368af6fa"
  IID_IMbnConnection = LibC::GUID.new(0xdcbbbab6_u32, 0x200d_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnection
    lpVtbl : IMbnConnectionVTbl*
  end

  struct IMbnConnectionEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_connect_complete : UInt64
    on_disconnect_complete : UInt64
    on_connect_state_change : UInt64
    on_voice_call_state_change : UInt64
  end

  IMbnConnectionEvents_GUID = "dcbbbab6-200e-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x200e_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionEvents
    lpVtbl : IMbnConnectionEventsVTbl*
  end

  struct IMbnInterfaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_interface_id : UInt64
    get_interface_capability : UInt64
    get_subscriber_information : UInt64
    get_ready_state : UInt64
    in_emergency_mode : UInt64
    get_home_provider : UInt64
    get_preferred_providers : UInt64
    set_preferred_providers : UInt64
    get_visible_providers : UInt64
    scan_network : UInt64
    get_connection : UInt64
  end

  IMbnInterface_GUID = "dcbbbab6-2001-4bbb-aaee-338e368af6fa"
  IID_IMbnInterface = LibC::GUID.new(0xdcbbbab6_u32, 0x2001_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnInterface
    lpVtbl : IMbnInterfaceVTbl*
  end

  struct IMbnInterfaceEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_interface_capability_available : UInt64
    on_subscriber_information_change : UInt64
    on_ready_state_change : UInt64
    on_emergency_mode_change : UInt64
    on_home_provider_available : UInt64
    on_preferred_providers_change : UInt64
    on_set_preferred_providers_complete : UInt64
    on_scan_network_complete : UInt64
  end

  IMbnInterfaceEvents_GUID = "dcbbbab6-2002-4bbb-aaee-338e368af6fa"
  IID_IMbnInterfaceEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2002_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnInterfaceEvents
    lpVtbl : IMbnInterfaceEventsVTbl*
  end

  struct IMbnInterfaceManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_interface : UInt64
    get_interfaces : UInt64
  end

  IMbnInterfaceManager_GUID = "dcbbbab6-201b-4bbb-aaee-338e368af6fa"
  IID_IMbnInterfaceManager = LibC::GUID.new(0xdcbbbab6_u32, 0x201b_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnInterfaceManager
    lpVtbl : IMbnInterfaceManagerVTbl*
  end

  struct IMbnInterfaceManagerEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_interface_arrival : UInt64
    on_interface_removal : UInt64
  end

  IMbnInterfaceManagerEvents_GUID = "dcbbbab6-201c-4bbb-aaee-338e368af6fa"
  IID_IMbnInterfaceManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201c_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnInterfaceManagerEvents
    lpVtbl : IMbnInterfaceManagerEventsVTbl*
  end

  struct IMbnRegistrationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_register_state : UInt64
    get_register_mode : UInt64
    get_provider_id : UInt64
    get_provider_name : UInt64
    get_roaming_text : UInt64
    get_available_data_classes : UInt64
    get_current_data_class : UInt64
    get_registration_network_error : UInt64
    get_packet_attach_network_error : UInt64
    set_register_mode : UInt64
  end

  IMbnRegistration_GUID = "dcbbbab6-2009-4bbb-aaee-338e368af6fa"
  IID_IMbnRegistration = LibC::GUID.new(0xdcbbbab6_u32, 0x2009_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnRegistration
    lpVtbl : IMbnRegistrationVTbl*
  end

  struct IMbnRegistrationEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_register_mode_available : UInt64
    on_register_state_change : UInt64
    on_packet_service_state_change : UInt64
    on_set_register_mode_complete : UInt64
  end

  IMbnRegistrationEvents_GUID = "dcbbbab6-200a-4bbb-aaee-338e368af6fa"
  IID_IMbnRegistrationEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x200a_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnRegistrationEvents
    lpVtbl : IMbnRegistrationEventsVTbl*
  end

  struct IMbnConnectionManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_connection : UInt64
    get_connections : UInt64
  end

  IMbnConnectionManager_GUID = "dcbbbab6-201d-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionManager = LibC::GUID.new(0xdcbbbab6_u32, 0x201d_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionManager
    lpVtbl : IMbnConnectionManagerVTbl*
  end

  struct IMbnConnectionManagerEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_connection_arrival : UInt64
    on_connection_removal : UInt64
  end

  IMbnConnectionManagerEvents_GUID = "dcbbbab6-201e-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201e_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionManagerEvents
    lpVtbl : IMbnConnectionManagerEventsVTbl*
  end

  struct IMbnPinManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_pin_list : UInt64
    get_pin : UInt64
    get_pin_state : UInt64
  end

  IMbnPinManager_GUID = "dcbbbab6-2005-4bbb-aaee-338e368af6fa"
  IID_IMbnPinManager = LibC::GUID.new(0xdcbbbab6_u32, 0x2005_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnPinManager
    lpVtbl : IMbnPinManagerVTbl*
  end

  struct IMbnPinManagerEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_pin_list_available : UInt64
    on_get_pin_state_complete : UInt64
  end

  IMbnPinManagerEvents_GUID = "dcbbbab6-2006-4bbb-aaee-338e368af6fa"
  IID_IMbnPinManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2006_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnPinManagerEvents
    lpVtbl : IMbnPinManagerEventsVTbl*
  end

  struct IMbnPinEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_enable_complete : UInt64
    on_disable_complete : UInt64
    on_enter_complete : UInt64
    on_change_complete : UInt64
    on_unblock_complete : UInt64
  end

  IMbnPinEvents_GUID = "dcbbbab6-2008-4bbb-aaee-338e368af6fa"
  IID_IMbnPinEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2008_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnPinEvents
    lpVtbl : IMbnPinEventsVTbl*
  end

  struct IMbnSubscriberInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_subscriber_id : UInt64
    get_sim_icc_id : UInt64
    get_telephone_numbers : UInt64
  end

  IMbnSubscriberInformation_GUID = "459ecc43-bcf5-11dc-a8a8-001321f1405f"
  IID_IMbnSubscriberInformation = LibC::GUID.new(0x459ecc43_u32, 0xbcf5_u16, 0x11dc_u16, StaticArray[0xa8_u8, 0xa8_u8, 0x0_u8, 0x13_u8, 0x21_u8, 0xf1_u8, 0x40_u8, 0x5f_u8])
  struct IMbnSubscriberInformation
    lpVtbl : IMbnSubscriberInformationVTbl*
  end

  struct IMbnSignalVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_signal_strength : UInt64
    get_signal_error : UInt64
  end

  IMbnSignal_GUID = "dcbbbab6-2003-4bbb-aaee-338e368af6fa"
  IID_IMbnSignal = LibC::GUID.new(0xdcbbbab6_u32, 0x2003_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSignal
    lpVtbl : IMbnSignalVTbl*
  end

  struct IMbnSignalEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_signal_state_change : UInt64
  end

  IMbnSignalEvents_GUID = "dcbbbab6-2004-4bbb-aaee-338e368af6fa"
  IID_IMbnSignalEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2004_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSignalEvents
    lpVtbl : IMbnSignalEventsVTbl*
  end

  struct IMbnConnectionContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_provisioned_contexts : UInt64
    set_provisioned_context : UInt64
  end

  IMbnConnectionContext_GUID = "dcbbbab6-200b-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionContext = LibC::GUID.new(0xdcbbbab6_u32, 0x200b_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionContext
    lpVtbl : IMbnConnectionContextVTbl*
  end

  struct IMbnConnectionContextEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_provisioned_context_list_change : UInt64
    on_set_provisioned_context_complete : UInt64
  end

  IMbnConnectionContextEvents_GUID = "dcbbbab6-200c-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionContextEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x200c_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionContextEvents
    lpVtbl : IMbnConnectionContextEventsVTbl*
  end

  struct IMbnConnectionProfileManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_connection_profiles : UInt64
    get_connection_profile : UInt64
    create_connection_profile : UInt64
  end

  IMbnConnectionProfileManager_GUID = "dcbbbab6-200f-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfileManager = LibC::GUID.new(0xdcbbbab6_u32, 0x200f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionProfileManager
    lpVtbl : IMbnConnectionProfileManagerVTbl*
  end

  struct IMbnConnectionProfileVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_profile_xml_data : UInt64
    update_profile : UInt64
    delete : UInt64
  end

  IMbnConnectionProfile_GUID = "dcbbbab6-2010-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfile = LibC::GUID.new(0xdcbbbab6_u32, 0x2010_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionProfile
    lpVtbl : IMbnConnectionProfileVTbl*
  end

  struct IMbnConnectionProfileEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_profile_update : UInt64
  end

  IMbnConnectionProfileEvents_GUID = "dcbbbab6-2011-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfileEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2011_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionProfileEvents
    lpVtbl : IMbnConnectionProfileEventsVTbl*
  end

  struct IMbnSmsConfigurationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_service_center_address : UInt64
    put_service_center_address : UInt64
    get_max_message_index : UInt64
    get_cdma_short_msg_size : UInt64
    get_sms_format : UInt64
    put_sms_format : UInt64
  end

  IMbnSmsConfiguration_GUID = "dcbbbab6-2012-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsConfiguration = LibC::GUID.new(0xdcbbbab6_u32, 0x2012_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSmsConfiguration
    lpVtbl : IMbnSmsConfigurationVTbl*
  end

  struct IMbnSmsReadMsgPduVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_index : UInt64
    get_status : UInt64
    get_pdu_data : UInt64
    get_message : UInt64
  end

  IMbnSmsReadMsgPdu_GUID = "dcbbbab6-2013-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsReadMsgPdu = LibC::GUID.new(0xdcbbbab6_u32, 0x2013_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSmsReadMsgPdu
    lpVtbl : IMbnSmsReadMsgPduVTbl*
  end

  struct IMbnSmsReadMsgTextCdmaVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_index : UInt64
    get_status : UInt64
    get_address : UInt64
    get_timestamp : UInt64
    get_encoding_id : UInt64
    get_language_id : UInt64
    get_size_in_characters : UInt64
    get_message : UInt64
  end

  IMbnSmsReadMsgTextCdma_GUID = "dcbbbab6-2014-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsReadMsgTextCdma = LibC::GUID.new(0xdcbbbab6_u32, 0x2014_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSmsReadMsgTextCdma
    lpVtbl : IMbnSmsReadMsgTextCdmaVTbl*
  end

  struct IMbnSmsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_sms_configuration : UInt64
    set_sms_configuration : UInt64
    sms_send_pdu : UInt64
    sms_send_cdma : UInt64
    sms_send_cdma_pdu : UInt64
    sms_read : UInt64
    sms_delete : UInt64
    get_sms_status : UInt64
  end

  IMbnSms_GUID = "dcbbbab6-2015-4bbb-aaee-338e368af6fa"
  IID_IMbnSms = LibC::GUID.new(0xdcbbbab6_u32, 0x2015_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSms
    lpVtbl : IMbnSmsVTbl*
  end

  struct IMbnSmsEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_sms_configuration_change : UInt64
    on_set_sms_configuration_complete : UInt64
    on_sms_send_complete : UInt64
    on_sms_read_complete : UInt64
    on_sms_new_class0_message : UInt64
    on_sms_delete_complete : UInt64
    on_sms_status_change : UInt64
  end

  IMbnSmsEvents_GUID = "dcbbbab6-2016-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2016_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSmsEvents
    lpVtbl : IMbnSmsEventsVTbl*
  end

  struct IMbnServiceActivationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
  end

  IMbnServiceActivation_GUID = "dcbbbab6-2017-4bbb-aaee-338e368af6fa"
  IID_IMbnServiceActivation = LibC::GUID.new(0xdcbbbab6_u32, 0x2017_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnServiceActivation
    lpVtbl : IMbnServiceActivationVTbl*
  end

  struct IMbnServiceActivationEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_activation_complete : UInt64
  end

  IMbnServiceActivationEvents_GUID = "dcbbbab6-2018-4bbb-aaee-338e368af6fa"
  IID_IMbnServiceActivationEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2018_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnServiceActivationEvents
    lpVtbl : IMbnServiceActivationEventsVTbl*
  end

  struct IMbnVendorSpecificOperationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_vendor_specific : UInt64
  end

  IMbnVendorSpecificOperation_GUID = "dcbbbab6-2019-4bbb-aaee-338e368af6fa"
  IID_IMbnVendorSpecificOperation = LibC::GUID.new(0xdcbbbab6_u32, 0x2019_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnVendorSpecificOperation
    lpVtbl : IMbnVendorSpecificOperationVTbl*
  end

  struct IMbnVendorSpecificEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_event_notification : UInt64
    on_set_vendor_specific_complete : UInt64
  end

  IMbnVendorSpecificEvents_GUID = "dcbbbab6-201a-4bbb-aaee-338e368af6fa"
  IID_IMbnVendorSpecificEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201a_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnVendorSpecificEvents
    lpVtbl : IMbnVendorSpecificEventsVTbl*
  end

  struct IMbnConnectionProfileManagerEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_connection_profile_arrival : UInt64
    on_connection_profile_removal : UInt64
  end

  IMbnConnectionProfileManagerEvents_GUID = "dcbbbab6-201f-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfileManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionProfileManagerEvents
    lpVtbl : IMbnConnectionProfileManagerEventsVTbl*
  end

  struct IMbnRadioVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_software_radio_state : UInt64
    get_hardware_radio_state : UInt64
    set_software_radio_state : UInt64
  end

  IMbnRadio_GUID = "dccccab6-201f-4bbb-aaee-338e368af6fa"
  IID_IMbnRadio = LibC::GUID.new(0xdccccab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnRadio
    lpVtbl : IMbnRadioVTbl*
  end

  struct IMbnRadioEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_radio_state_change : UInt64
    on_set_software_radio_state_complete : UInt64
  end

  IMbnRadioEvents_GUID = "dcdddab6-201f-4bbb-aaee-338e368af6fa"
  IID_IMbnRadioEvents = LibC::GUID.new(0xdcdddab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnRadioEvents
    lpVtbl : IMbnRadioEventsVTbl*
  end

  struct IMbnMultiCarrierVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_home_provider : UInt64
    get_preferred_providers : UInt64
    get_visible_providers : UInt64
    get_supported_cellular_classes : UInt64
    get_current_cellular_class : UInt64
    scan_network : UInt64
  end

  IMbnMultiCarrier_GUID = "dcbbbab6-2020-4bbb-aaee-338e368af6fa"
  IID_IMbnMultiCarrier = LibC::GUID.new(0xdcbbbab6_u32, 0x2020_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnMultiCarrier
    lpVtbl : IMbnMultiCarrierVTbl*
  end

  struct IMbnMultiCarrierEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_set_home_provider_complete : UInt64
    on_current_cellular_class_change : UInt64
    on_preferred_providers_change : UInt64
    on_scan_network_complete : UInt64
    on_interface_capability_change : UInt64
  end

  IMbnMultiCarrierEvents_GUID = "dcdddab6-2021-4bbb-aaee-338e368af6fa"
  IID_IMbnMultiCarrierEvents = LibC::GUID.new(0xdcdddab6_u32, 0x2021_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnMultiCarrierEvents
    lpVtbl : IMbnMultiCarrierEventsVTbl*
  end

  struct IMbnDeviceServiceStateEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_sessions_state_change : UInt64
  end

  IMbnDeviceServiceStateEvents_GUID = "5d3ff196-89ee-49d8-8b60-33ffddffc58d"
  IID_IMbnDeviceServiceStateEvents = LibC::GUID.new(0x5d3ff196_u32, 0x89ee_u16, 0x49d8_u16, StaticArray[0x8b_u8, 0x60_u8, 0x33_u8, 0xff_u8, 0xdd_u8, 0xff_u8, 0xc5_u8, 0x8d_u8])
  struct IMbnDeviceServiceStateEvents
    lpVtbl : IMbnDeviceServiceStateEventsVTbl*
  end

  struct IMbnDeviceServicesManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_device_services_context : UInt64
  end

  IMbnDeviceServicesManager_GUID = "20a26258-6811-4478-ac1d-13324e45e41c"
  IID_IMbnDeviceServicesManager = LibC::GUID.new(0x20a26258_u32, 0x6811_u16, 0x4478_u16, StaticArray[0xac_u8, 0x1d_u8, 0x13_u8, 0x32_u8, 0x4e_u8, 0x45_u8, 0xe4_u8, 0x1c_u8])
  struct IMbnDeviceServicesManager
    lpVtbl : IMbnDeviceServicesManagerVTbl*
  end

  struct IMbnDeviceServicesContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enumerate_device_services : UInt64
    get_device_service : UInt64
    get_max_command_size : UInt64
    get_max_data_size : UInt64
  end

  IMbnDeviceServicesContext_GUID = "fc5ac347-1592-4068-80bb-6a57580150d8"
  IID_IMbnDeviceServicesContext = LibC::GUID.new(0xfc5ac347_u32, 0x1592_u16, 0x4068_u16, StaticArray[0x80_u8, 0xbb_u8, 0x6a_u8, 0x57_u8, 0x58_u8, 0x1_u8, 0x50_u8, 0xd8_u8])
  struct IMbnDeviceServicesContext
    lpVtbl : IMbnDeviceServicesContextVTbl*
  end

  struct IMbnDeviceServicesEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_query_supported_commands_complete : UInt64
    on_open_command_session_complete : UInt64
    on_close_command_session_complete : UInt64
    on_set_command_complete : UInt64
    on_query_command_complete : UInt64
    on_event_notification : UInt64
    on_open_data_session_complete : UInt64
    on_close_data_session_complete : UInt64
    on_write_data_complete : UInt64
    on_read_data : UInt64
    on_interface_state_change : UInt64
  end

  IMbnDeviceServicesEvents_GUID = "0a900c19-6824-4e97-b76e-cf239d0ca642"
  IID_IMbnDeviceServicesEvents = LibC::GUID.new(0xa900c19_u32, 0x6824_u16, 0x4e97_u16, StaticArray[0xb7_u8, 0x6e_u8, 0xcf_u8, 0x23_u8, 0x9d_u8, 0xc_u8, 0xa6_u8, 0x42_u8])
  struct IMbnDeviceServicesEvents
    lpVtbl : IMbnDeviceServicesEventsVTbl*
  end

  struct IMbnDeviceServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_supported_commands : UInt64
    open_command_session : UInt64
    close_command_session : UInt64
    set_command : UInt64
    query_command : UInt64
    open_data_session : UInt64
    close_data_session : UInt64
    write_data : UInt64
    get_interface_id : UInt64
    get_device_service_id : UInt64
    get_is_command_session_open : UInt64
    get_is_data_session_open : UInt64
  end

  IMbnDeviceService_GUID = "b3bb9a71-dc70-4be9-a4da-7886ae8b191b"
  IID_IMbnDeviceService = LibC::GUID.new(0xb3bb9a71_u32, 0xdc70_u16, 0x4be9_u16, StaticArray[0xa4_u8, 0xda_u8, 0x78_u8, 0x86_u8, 0xae_u8, 0x8b_u8, 0x19_u8, 0x1b_u8])
  struct IMbnDeviceService
    lpVtbl : IMbnDeviceServiceVTbl*
  end

  struct IMbnPinVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_pin_type : UInt64
    get_pin_format : UInt64
    get_pin_length_min : UInt64
    get_pin_length_max : UInt64
    get_pin_mode : UInt64
    enable : UInt64
    disable : UInt64
    enter : UInt64
    change : UInt64
    unblock : UInt64
    get_pin_manager : UInt64
  end

  IMbnPin_GUID = "dcbbbab6-2007-4bbb-aaee-338e368af6fa"
  IID_IMbnPin = LibC::GUID.new(0xdcbbbab6_u32, 0x2007_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnPin
    lpVtbl : IMbnPinVTbl*
  end

end
struct LibWin32::IDummyMBNUCMExt
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
struct LibWin32::IMbnConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_connection_id(connectionid : UInt8**) : HRESULT
    @lpVtbl.value.get_connection_id.unsafe_as(Proc(UInt8**, HRESULT)).call(connectionid)
  end
  def get_interface_id(interfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.unsafe_as(Proc(UInt8**, HRESULT)).call(interfaceid)
  end
  def connect(connectionmode : MBN_CONNECTION_MODE, strprofile : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(MBN_CONNECTION_MODE, LibC::LPWSTR, UInt32*, HRESULT)).call(connectionmode, strprofile, requestid)
  end
  def disconnect(requestid : UInt32*) : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
  def get_connection_state(connectionstate : MBN_ACTIVATION_STATE*, profilename : UInt8**) : HRESULT
    @lpVtbl.value.get_connection_state.unsafe_as(Proc(MBN_ACTIVATION_STATE*, UInt8**, HRESULT)).call(connectionstate, profilename)
  end
  def get_voice_call_state(voicecallstate : MBN_VOICE_CALL_STATE*) : HRESULT
    @lpVtbl.value.get_voice_call_state.unsafe_as(Proc(MBN_VOICE_CALL_STATE*, HRESULT)).call(voicecallstate)
  end
  def get_activation_network_error(networkerror : UInt32*) : HRESULT
    @lpVtbl.value.get_activation_network_error.unsafe_as(Proc(UInt32*, HRESULT)).call(networkerror)
  end
end
struct LibWin32::IMbnConnectionEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_connect_complete(newconnection : IMbnConnection, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_connect_complete.unsafe_as(Proc(IMbnConnection, UInt32, HRESULT, HRESULT)).call(newconnection, requestid, status)
  end
  def on_disconnect_complete(newconnection : IMbnConnection, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_disconnect_complete.unsafe_as(Proc(IMbnConnection, UInt32, HRESULT, HRESULT)).call(newconnection, requestid, status)
  end
  def on_connect_state_change(newconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_connect_state_change.unsafe_as(Proc(IMbnConnection, HRESULT)).call(newconnection)
  end
  def on_voice_call_state_change(newconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_voice_call_state_change.unsafe_as(Proc(IMbnConnection, HRESULT)).call(newconnection)
  end
end
struct LibWin32::IMbnInterface
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_interface_id(interfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.unsafe_as(Proc(UInt8**, HRESULT)).call(interfaceid)
  end
  def get_interface_capability(interfacecaps : MBN_INTERFACE_CAPS*) : HRESULT
    @lpVtbl.value.get_interface_capability.unsafe_as(Proc(MBN_INTERFACE_CAPS*, HRESULT)).call(interfacecaps)
  end
  def get_subscriber_information(subscriberinformation : IMbnSubscriberInformation*) : HRESULT
    @lpVtbl.value.get_subscriber_information.unsafe_as(Proc(IMbnSubscriberInformation*, HRESULT)).call(subscriberinformation)
  end
  def get_ready_state(readystate : MBN_READY_STATE*) : HRESULT
    @lpVtbl.value.get_ready_state.unsafe_as(Proc(MBN_READY_STATE*, HRESULT)).call(readystate)
  end
  def in_emergency_mode(emergencymode : Int16*) : HRESULT
    @lpVtbl.value.in_emergency_mode.unsafe_as(Proc(Int16*, HRESULT)).call(emergencymode)
  end
  def get_home_provider(homeprovider : MBN_PROVIDER*) : HRESULT
    @lpVtbl.value.get_home_provider.unsafe_as(Proc(MBN_PROVIDER*, HRESULT)).call(homeprovider)
  end
  def get_preferred_providers(preferredproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_preferred_providers.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(preferredproviders)
  end
  def set_preferred_providers(preferredproviders : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_preferred_providers.unsafe_as(Proc(SAFEARRAY*, UInt32*, HRESULT)).call(preferredproviders, requestid)
  end
  def get_visible_providers(age : UInt32*, visibleproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_providers.unsafe_as(Proc(UInt32*, SAFEARRAY**, HRESULT)).call(age, visibleproviders)
  end
  def scan_network(requestid : UInt32*) : HRESULT
    @lpVtbl.value.scan_network.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
  def get_connection(mbnconnection : IMbnConnection*) : HRESULT
    @lpVtbl.value.get_connection.unsafe_as(Proc(IMbnConnection*, HRESULT)).call(mbnconnection)
  end
end
struct LibWin32::IMbnInterfaceEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_interface_capability_available(newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_interface_capability_available.unsafe_as(Proc(IMbnInterface, HRESULT)).call(newinterface)
  end
  def on_subscriber_information_change(newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_subscriber_information_change.unsafe_as(Proc(IMbnInterface, HRESULT)).call(newinterface)
  end
  def on_ready_state_change(newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_ready_state_change.unsafe_as(Proc(IMbnInterface, HRESULT)).call(newinterface)
  end
  def on_emergency_mode_change(newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_emergency_mode_change.unsafe_as(Proc(IMbnInterface, HRESULT)).call(newinterface)
  end
  def on_home_provider_available(newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_home_provider_available.unsafe_as(Proc(IMbnInterface, HRESULT)).call(newinterface)
  end
  def on_preferred_providers_change(newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_preferred_providers_change.unsafe_as(Proc(IMbnInterface, HRESULT)).call(newinterface)
  end
  def on_set_preferred_providers_complete(newinterface : IMbnInterface, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_preferred_providers_complete.unsafe_as(Proc(IMbnInterface, UInt32, HRESULT, HRESULT)).call(newinterface, requestid, status)
  end
  def on_scan_network_complete(newinterface : IMbnInterface, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_scan_network_complete.unsafe_as(Proc(IMbnInterface, UInt32, HRESULT, HRESULT)).call(newinterface, requestid, status)
  end
end
struct LibWin32::IMbnInterfaceManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_interface(interfaceid : LibC::LPWSTR, mbninterface : IMbnInterface*) : HRESULT
    @lpVtbl.value.get_interface.unsafe_as(Proc(LibC::LPWSTR, IMbnInterface*, HRESULT)).call(interfaceid, mbninterface)
  end
  def get_interfaces(mbninterfaces : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_interfaces.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(mbninterfaces)
  end
end
struct LibWin32::IMbnInterfaceManagerEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_interface_arrival(newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_interface_arrival.unsafe_as(Proc(IMbnInterface, HRESULT)).call(newinterface)
  end
  def on_interface_removal(oldinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_interface_removal.unsafe_as(Proc(IMbnInterface, HRESULT)).call(oldinterface)
  end
end
struct LibWin32::IMbnRegistration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_register_state(registerstate : MBN_REGISTER_STATE*) : HRESULT
    @lpVtbl.value.get_register_state.unsafe_as(Proc(MBN_REGISTER_STATE*, HRESULT)).call(registerstate)
  end
  def get_register_mode(registermode : MBN_REGISTER_MODE*) : HRESULT
    @lpVtbl.value.get_register_mode.unsafe_as(Proc(MBN_REGISTER_MODE*, HRESULT)).call(registermode)
  end
  def get_provider_id(providerid : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_id.unsafe_as(Proc(UInt8**, HRESULT)).call(providerid)
  end
  def get_provider_name(providername : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_name.unsafe_as(Proc(UInt8**, HRESULT)).call(providername)
  end
  def get_roaming_text(roamingtext : UInt8**) : HRESULT
    @lpVtbl.value.get_roaming_text.unsafe_as(Proc(UInt8**, HRESULT)).call(roamingtext)
  end
  def get_available_data_classes(availabledataclasses : UInt32*) : HRESULT
    @lpVtbl.value.get_available_data_classes.unsafe_as(Proc(UInt32*, HRESULT)).call(availabledataclasses)
  end
  def get_current_data_class(currentdataclass : UInt32*) : HRESULT
    @lpVtbl.value.get_current_data_class.unsafe_as(Proc(UInt32*, HRESULT)).call(currentdataclass)
  end
  def get_registration_network_error(registrationnetworkerror : UInt32*) : HRESULT
    @lpVtbl.value.get_registration_network_error.unsafe_as(Proc(UInt32*, HRESULT)).call(registrationnetworkerror)
  end
  def get_packet_attach_network_error(packetattachnetworkerror : UInt32*) : HRESULT
    @lpVtbl.value.get_packet_attach_network_error.unsafe_as(Proc(UInt32*, HRESULT)).call(packetattachnetworkerror)
  end
  def set_register_mode(registermode : MBN_REGISTER_MODE, providerid : LibC::LPWSTR, dataclass : UInt32, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_register_mode.unsafe_as(Proc(MBN_REGISTER_MODE, LibC::LPWSTR, UInt32, UInt32*, HRESULT)).call(registermode, providerid, dataclass, requestid)
  end
end
struct LibWin32::IMbnRegistrationEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_register_mode_available(newinterface : IMbnRegistration) : HRESULT
    @lpVtbl.value.on_register_mode_available.unsafe_as(Proc(IMbnRegistration, HRESULT)).call(newinterface)
  end
  def on_register_state_change(newinterface : IMbnRegistration) : HRESULT
    @lpVtbl.value.on_register_state_change.unsafe_as(Proc(IMbnRegistration, HRESULT)).call(newinterface)
  end
  def on_packet_service_state_change(newinterface : IMbnRegistration) : HRESULT
    @lpVtbl.value.on_packet_service_state_change.unsafe_as(Proc(IMbnRegistration, HRESULT)).call(newinterface)
  end
  def on_set_register_mode_complete(newinterface : IMbnRegistration, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_register_mode_complete.unsafe_as(Proc(IMbnRegistration, UInt32, HRESULT, HRESULT)).call(newinterface, requestid, status)
  end
end
struct LibWin32::IMbnConnectionManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_connection(connectionid : LibC::LPWSTR, mbnconnection : IMbnConnection*) : HRESULT
    @lpVtbl.value.get_connection.unsafe_as(Proc(LibC::LPWSTR, IMbnConnection*, HRESULT)).call(connectionid, mbnconnection)
  end
  def get_connections(mbnconnections : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_connections.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(mbnconnections)
  end
end
struct LibWin32::IMbnConnectionManagerEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_connection_arrival(newconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_connection_arrival.unsafe_as(Proc(IMbnConnection, HRESULT)).call(newconnection)
  end
  def on_connection_removal(oldconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_connection_removal.unsafe_as(Proc(IMbnConnection, HRESULT)).call(oldconnection)
  end
end
struct LibWin32::IMbnPinManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_pin_list(pinlist : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_pin_list.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pinlist)
  end
  def get_pin(pintype : MBN_PIN_TYPE, pin : IMbnPin*) : HRESULT
    @lpVtbl.value.get_pin.unsafe_as(Proc(MBN_PIN_TYPE, IMbnPin*, HRESULT)).call(pintype, pin)
  end
  def get_pin_state(requestid : UInt32*) : HRESULT
    @lpVtbl.value.get_pin_state.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
end
struct LibWin32::IMbnPinManagerEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_pin_list_available(pinmanager : IMbnPinManager) : HRESULT
    @lpVtbl.value.on_pin_list_available.unsafe_as(Proc(IMbnPinManager, HRESULT)).call(pinmanager)
  end
  def on_get_pin_state_complete(pinmanager : IMbnPinManager, pininfo : MBN_PIN_INFO, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_get_pin_state_complete.unsafe_as(Proc(IMbnPinManager, MBN_PIN_INFO, UInt32, HRESULT, HRESULT)).call(pinmanager, pininfo, requestid, status)
  end
end
struct LibWin32::IMbnPinEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_enable_complete(pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_enable_complete.unsafe_as(Proc(IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)).call(pin, pininfo, requestid, status)
  end
  def on_disable_complete(pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_disable_complete.unsafe_as(Proc(IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)).call(pin, pininfo, requestid, status)
  end
  def on_enter_complete(pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_enter_complete.unsafe_as(Proc(IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)).call(pin, pininfo, requestid, status)
  end
  def on_change_complete(pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_change_complete.unsafe_as(Proc(IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)).call(pin, pininfo, requestid, status)
  end
  def on_unblock_complete(pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_unblock_complete.unsafe_as(Proc(IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)).call(pin, pininfo, requestid, status)
  end
end
struct LibWin32::IMbnSubscriberInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_subscriber_id(subscriberid : UInt8**) : HRESULT
    @lpVtbl.value.get_subscriber_id.unsafe_as(Proc(UInt8**, HRESULT)).call(subscriberid)
  end
  def get_sim_icc_id(simiccid : UInt8**) : HRESULT
    @lpVtbl.value.get_sim_icc_id.unsafe_as(Proc(UInt8**, HRESULT)).call(simiccid)
  end
  def get_telephone_numbers(telephonenumbers : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_telephone_numbers.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(telephonenumbers)
  end
end
struct LibWin32::IMbnSignal
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_signal_strength(signalstrength : UInt32*) : HRESULT
    @lpVtbl.value.get_signal_strength.unsafe_as(Proc(UInt32*, HRESULT)).call(signalstrength)
  end
  def get_signal_error(signalerror : UInt32*) : HRESULT
    @lpVtbl.value.get_signal_error.unsafe_as(Proc(UInt32*, HRESULT)).call(signalerror)
  end
end
struct LibWin32::IMbnSignalEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_signal_state_change(newinterface : IMbnSignal) : HRESULT
    @lpVtbl.value.on_signal_state_change.unsafe_as(Proc(IMbnSignal, HRESULT)).call(newinterface)
  end
end
struct LibWin32::IMbnConnectionContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_provisioned_contexts(provisionedcontexts : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_provisioned_contexts.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(provisionedcontexts)
  end
  def set_provisioned_context(provisionedcontexts : MBN_CONTEXT, providerid : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_provisioned_context.unsafe_as(Proc(MBN_CONTEXT, LibC::LPWSTR, UInt32*, HRESULT)).call(provisionedcontexts, providerid, requestid)
  end
end
struct LibWin32::IMbnConnectionContextEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_provisioned_context_list_change(newinterface : IMbnConnectionContext) : HRESULT
    @lpVtbl.value.on_provisioned_context_list_change.unsafe_as(Proc(IMbnConnectionContext, HRESULT)).call(newinterface)
  end
  def on_set_provisioned_context_complete(newinterface : IMbnConnectionContext, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_provisioned_context_complete.unsafe_as(Proc(IMbnConnectionContext, UInt32, HRESULT, HRESULT)).call(newinterface, requestid, status)
  end
end
struct LibWin32::IMbnConnectionProfileManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_connection_profiles(mbninterface : IMbnInterface, connectionprofiles : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_connection_profiles.unsafe_as(Proc(IMbnInterface, SAFEARRAY**, HRESULT)).call(mbninterface, connectionprofiles)
  end
  def get_connection_profile(mbninterface : IMbnInterface, profilename : LibC::LPWSTR, connectionprofile : IMbnConnectionProfile*) : HRESULT
    @lpVtbl.value.get_connection_profile.unsafe_as(Proc(IMbnInterface, LibC::LPWSTR, IMbnConnectionProfile*, HRESULT)).call(mbninterface, profilename, connectionprofile)
  end
  def create_connection_profile(xmlprofile : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.create_connection_profile.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(xmlprofile)
  end
end
struct LibWin32::IMbnConnectionProfile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_profile_xml_data(profiledata : UInt8**) : HRESULT
    @lpVtbl.value.get_profile_xml_data.unsafe_as(Proc(UInt8**, HRESULT)).call(profiledata)
  end
  def update_profile(strprofile : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.update_profile.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(strprofile)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMbnConnectionProfileEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_profile_update(newprofile : IMbnConnectionProfile) : HRESULT
    @lpVtbl.value.on_profile_update.unsafe_as(Proc(IMbnConnectionProfile, HRESULT)).call(newprofile)
  end
end
struct LibWin32::IMbnSmsConfiguration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_service_center_address(scaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_service_center_address.unsafe_as(Proc(UInt8**, HRESULT)).call(scaddress)
  end
  def put_service_center_address(scaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_service_center_address.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(scaddress)
  end
  def get_max_message_index(index : UInt32*) : HRESULT
    @lpVtbl.value.get_max_message_index.unsafe_as(Proc(UInt32*, HRESULT)).call(index)
  end
  def get_cdma_short_msg_size(shortmsgsize : UInt32*) : HRESULT
    @lpVtbl.value.get_cdma_short_msg_size.unsafe_as(Proc(UInt32*, HRESULT)).call(shortmsgsize)
  end
  def get_sms_format(smsformat : MBN_SMS_FORMAT*) : HRESULT
    @lpVtbl.value.get_sms_format.unsafe_as(Proc(MBN_SMS_FORMAT*, HRESULT)).call(smsformat)
  end
  def put_sms_format(smsformat : MBN_SMS_FORMAT) : HRESULT
    @lpVtbl.value.put_sms_format.unsafe_as(Proc(MBN_SMS_FORMAT, HRESULT)).call(smsformat)
  end
end
struct LibWin32::IMbnSmsReadMsgPdu
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_index(index : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(UInt32*, HRESULT)).call(index)
  end
  def get_status(status : MBN_MSG_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(MBN_MSG_STATUS*, HRESULT)).call(status)
  end
  def get_pdu_data(pdudata : UInt8**) : HRESULT
    @lpVtbl.value.get_pdu_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pdudata)
  end
  def get_message(message : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(message)
  end
end
struct LibWin32::IMbnSmsReadMsgTextCdma
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_index(index : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(UInt32*, HRESULT)).call(index)
  end
  def get_status(status : MBN_MSG_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(MBN_MSG_STATUS*, HRESULT)).call(status)
  end
  def get_address(address : UInt8**) : HRESULT
    @lpVtbl.value.get_address.unsafe_as(Proc(UInt8**, HRESULT)).call(address)
  end
  def get_timestamp(timestamp : UInt8**) : HRESULT
    @lpVtbl.value.get_timestamp.unsafe_as(Proc(UInt8**, HRESULT)).call(timestamp)
  end
  def get_encoding_id(encodingid : MBN_SMS_CDMA_ENCODING*) : HRESULT
    @lpVtbl.value.get_encoding_id.unsafe_as(Proc(MBN_SMS_CDMA_ENCODING*, HRESULT)).call(encodingid)
  end
  def get_language_id(languageid : MBN_SMS_CDMA_LANG*) : HRESULT
    @lpVtbl.value.get_language_id.unsafe_as(Proc(MBN_SMS_CDMA_LANG*, HRESULT)).call(languageid)
  end
  def get_size_in_characters(sizeincharacters : UInt32*) : HRESULT
    @lpVtbl.value.get_size_in_characters.unsafe_as(Proc(UInt32*, HRESULT)).call(sizeincharacters)
  end
  def get_message(message : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(message)
  end
end
struct LibWin32::IMbnSms
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_sms_configuration(smsconfiguration : IMbnSmsConfiguration*) : HRESULT
    @lpVtbl.value.get_sms_configuration.unsafe_as(Proc(IMbnSmsConfiguration*, HRESULT)).call(smsconfiguration)
  end
  def set_sms_configuration(smsconfiguration : IMbnSmsConfiguration, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_sms_configuration.unsafe_as(Proc(IMbnSmsConfiguration, UInt32*, HRESULT)).call(smsconfiguration, requestid)
  end
  def sms_send_pdu(pdudata : LibC::LPWSTR, size : UInt8, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_send_pdu.unsafe_as(Proc(LibC::LPWSTR, UInt8, UInt32*, HRESULT)).call(pdudata, size, requestid)
  end
  def sms_send_cdma(address : LibC::LPWSTR, encoding : MBN_SMS_CDMA_ENCODING, language : MBN_SMS_CDMA_LANG, sizeincharacters : UInt32, message : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_send_cdma.unsafe_as(Proc(LibC::LPWSTR, MBN_SMS_CDMA_ENCODING, MBN_SMS_CDMA_LANG, UInt32, SAFEARRAY*, UInt32*, HRESULT)).call(address, encoding, language, sizeincharacters, message, requestid)
  end
  def sms_send_cdma_pdu(message : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_send_cdma_pdu.unsafe_as(Proc(SAFEARRAY*, UInt32*, HRESULT)).call(message, requestid)
  end
  def sms_read(smsfilter : MBN_SMS_FILTER*, smsformat : MBN_SMS_FORMAT, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_read.unsafe_as(Proc(MBN_SMS_FILTER*, MBN_SMS_FORMAT, UInt32*, HRESULT)).call(smsfilter, smsformat, requestid)
  end
  def sms_delete(smsfilter : MBN_SMS_FILTER*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_delete.unsafe_as(Proc(MBN_SMS_FILTER*, UInt32*, HRESULT)).call(smsfilter, requestid)
  end
  def get_sms_status(smsstatusinfo : MBN_SMS_STATUS_INFO*) : HRESULT
    @lpVtbl.value.get_sms_status.unsafe_as(Proc(MBN_SMS_STATUS_INFO*, HRESULT)).call(smsstatusinfo)
  end
end
struct LibWin32::IMbnSmsEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_sms_configuration_change(sms : IMbnSms) : HRESULT
    @lpVtbl.value.on_sms_configuration_change.unsafe_as(Proc(IMbnSms, HRESULT)).call(sms)
  end
  def on_set_sms_configuration_complete(sms : IMbnSms, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_sms_configuration_complete.unsafe_as(Proc(IMbnSms, UInt32, HRESULT, HRESULT)).call(sms, requestid, status)
  end
  def on_sms_send_complete(sms : IMbnSms, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_sms_send_complete.unsafe_as(Proc(IMbnSms, UInt32, HRESULT, HRESULT)).call(sms, requestid, status)
  end
  def on_sms_read_complete(sms : IMbnSms, smsformat : MBN_SMS_FORMAT, readmsgs : SAFEARRAY*, moremsgs : Int16, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_sms_read_complete.unsafe_as(Proc(IMbnSms, MBN_SMS_FORMAT, SAFEARRAY*, Int16, UInt32, HRESULT, HRESULT)).call(sms, smsformat, readmsgs, moremsgs, requestid, status)
  end
  def on_sms_new_class0_message(sms : IMbnSms, smsformat : MBN_SMS_FORMAT, readmsgs : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_sms_new_class0_message.unsafe_as(Proc(IMbnSms, MBN_SMS_FORMAT, SAFEARRAY*, HRESULT)).call(sms, smsformat, readmsgs)
  end
  def on_sms_delete_complete(sms : IMbnSms, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_sms_delete_complete.unsafe_as(Proc(IMbnSms, UInt32, HRESULT, HRESULT)).call(sms, requestid, status)
  end
  def on_sms_status_change(sms : IMbnSms) : HRESULT
    @lpVtbl.value.on_sms_status_change.unsafe_as(Proc(IMbnSms, HRESULT)).call(sms)
  end
end
struct LibWin32::IMbnServiceActivation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(vendorspecificdata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(SAFEARRAY*, UInt32*, HRESULT)).call(vendorspecificdata, requestid)
  end
end
struct LibWin32::IMbnServiceActivationEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_activation_complete(serviceactivation : IMbnServiceActivation, vendorspecificdata : SAFEARRAY*, requestid : UInt32, status : HRESULT, networkerror : UInt32) : HRESULT
    @lpVtbl.value.on_activation_complete.unsafe_as(Proc(IMbnServiceActivation, SAFEARRAY*, UInt32, HRESULT, UInt32, HRESULT)).call(serviceactivation, vendorspecificdata, requestid, status, networkerror)
  end
end
struct LibWin32::IMbnVendorSpecificOperation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_vendor_specific(vendorspecificdata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_vendor_specific.unsafe_as(Proc(SAFEARRAY*, UInt32*, HRESULT)).call(vendorspecificdata, requestid)
  end
end
struct LibWin32::IMbnVendorSpecificEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_event_notification(vendoroperation : IMbnVendorSpecificOperation, vendorspecificdata : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_event_notification.unsafe_as(Proc(IMbnVendorSpecificOperation, SAFEARRAY*, HRESULT)).call(vendoroperation, vendorspecificdata)
  end
  def on_set_vendor_specific_complete(vendoroperation : IMbnVendorSpecificOperation, vendorspecificdata : SAFEARRAY*, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_set_vendor_specific_complete.unsafe_as(Proc(IMbnVendorSpecificOperation, SAFEARRAY*, UInt32, HRESULT)).call(vendoroperation, vendorspecificdata, requestid)
  end
end
struct LibWin32::IMbnConnectionProfileManagerEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_connection_profile_arrival(newconnectionprofile : IMbnConnectionProfile) : HRESULT
    @lpVtbl.value.on_connection_profile_arrival.unsafe_as(Proc(IMbnConnectionProfile, HRESULT)).call(newconnectionprofile)
  end
  def on_connection_profile_removal(oldconnectionprofile : IMbnConnectionProfile) : HRESULT
    @lpVtbl.value.on_connection_profile_removal.unsafe_as(Proc(IMbnConnectionProfile, HRESULT)).call(oldconnectionprofile)
  end
end
struct LibWin32::IMbnRadio
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_software_radio_state(softwareradiostate : MBN_RADIO*) : HRESULT
    @lpVtbl.value.get_software_radio_state.unsafe_as(Proc(MBN_RADIO*, HRESULT)).call(softwareradiostate)
  end
  def get_hardware_radio_state(hardwareradiostate : MBN_RADIO*) : HRESULT
    @lpVtbl.value.get_hardware_radio_state.unsafe_as(Proc(MBN_RADIO*, HRESULT)).call(hardwareradiostate)
  end
  def set_software_radio_state(radiostate : MBN_RADIO, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_software_radio_state.unsafe_as(Proc(MBN_RADIO, UInt32*, HRESULT)).call(radiostate, requestid)
  end
end
struct LibWin32::IMbnRadioEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_radio_state_change(newinterface : IMbnRadio) : HRESULT
    @lpVtbl.value.on_radio_state_change.unsafe_as(Proc(IMbnRadio, HRESULT)).call(newinterface)
  end
  def on_set_software_radio_state_complete(newinterface : IMbnRadio, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_software_radio_state_complete.unsafe_as(Proc(IMbnRadio, UInt32, HRESULT, HRESULT)).call(newinterface, requestid, status)
  end
end
struct LibWin32::IMbnMultiCarrier
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_home_provider(homeprovider : MBN_PROVIDER2*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_home_provider.unsafe_as(Proc(MBN_PROVIDER2*, UInt32*, HRESULT)).call(homeprovider, requestid)
  end
  def get_preferred_providers(preferredmulticarrierproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_preferred_providers.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(preferredmulticarrierproviders)
  end
  def get_visible_providers(age : UInt32*, visibleproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_providers.unsafe_as(Proc(UInt32*, SAFEARRAY**, HRESULT)).call(age, visibleproviders)
  end
  def get_supported_cellular_classes(cellularclasses : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_cellular_classes.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(cellularclasses)
  end
  def get_current_cellular_class(currentcellularclass : MBN_CELLULAR_CLASS*) : HRESULT
    @lpVtbl.value.get_current_cellular_class.unsafe_as(Proc(MBN_CELLULAR_CLASS*, HRESULT)).call(currentcellularclass)
  end
  def scan_network(requestid : UInt32*) : HRESULT
    @lpVtbl.value.scan_network.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
end
struct LibWin32::IMbnMultiCarrierEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_set_home_provider_complete(mbninterface : IMbnMultiCarrier, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_home_provider_complete.unsafe_as(Proc(IMbnMultiCarrier, UInt32, HRESULT, HRESULT)).call(mbninterface, requestid, status)
  end
  def on_current_cellular_class_change(mbninterface : IMbnMultiCarrier) : HRESULT
    @lpVtbl.value.on_current_cellular_class_change.unsafe_as(Proc(IMbnMultiCarrier, HRESULT)).call(mbninterface)
  end
  def on_preferred_providers_change(mbninterface : IMbnMultiCarrier) : HRESULT
    @lpVtbl.value.on_preferred_providers_change.unsafe_as(Proc(IMbnMultiCarrier, HRESULT)).call(mbninterface)
  end
  def on_scan_network_complete(mbninterface : IMbnMultiCarrier, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_scan_network_complete.unsafe_as(Proc(IMbnMultiCarrier, UInt32, HRESULT, HRESULT)).call(mbninterface, requestid, status)
  end
  def on_interface_capability_change(mbninterface : IMbnMultiCarrier) : HRESULT
    @lpVtbl.value.on_interface_capability_change.unsafe_as(Proc(IMbnMultiCarrier, HRESULT)).call(mbninterface)
  end
end
struct LibWin32::IMbnDeviceServiceStateEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_sessions_state_change(interfaceid : UInt8*, statechange : MBN_DEVICE_SERVICE_SESSIONS_STATE) : HRESULT
    @lpVtbl.value.on_sessions_state_change.unsafe_as(Proc(UInt8*, MBN_DEVICE_SERVICE_SESSIONS_STATE, HRESULT)).call(interfaceid, statechange)
  end
end
struct LibWin32::IMbnDeviceServicesManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_device_services_context(networkinterfaceid : UInt8*, mbndevicescontext : IMbnDeviceServicesContext*) : HRESULT
    @lpVtbl.value.get_device_services_context.unsafe_as(Proc(UInt8*, IMbnDeviceServicesContext*, HRESULT)).call(networkinterfaceid, mbndevicescontext)
  end
end
struct LibWin32::IMbnDeviceServicesContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enumerate_device_services(deviceservices : SAFEARRAY**) : HRESULT
    @lpVtbl.value.enumerate_device_services.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(deviceservices)
  end
  def get_device_service(deviceserviceid : UInt8*, mbndeviceservice : IMbnDeviceService*) : HRESULT
    @lpVtbl.value.get_device_service.unsafe_as(Proc(UInt8*, IMbnDeviceService*, HRESULT)).call(deviceserviceid, mbndeviceservice)
  end
  def get_max_command_size(maxcommandsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_command_size.unsafe_as(Proc(UInt32*, HRESULT)).call(maxcommandsize)
  end
  def get_max_data_size(maxdatasize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_data_size.unsafe_as(Proc(UInt32*, HRESULT)).call(maxdatasize)
  end
end
struct LibWin32::IMbnDeviceServicesEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_query_supported_commands_complete(deviceservice : IMbnDeviceService, commandidlist : SAFEARRAY*, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_query_supported_commands_complete.unsafe_as(Proc(IMbnDeviceService, SAFEARRAY*, HRESULT, UInt32, HRESULT)).call(deviceservice, commandidlist, status, requestid)
  end
  def on_open_command_session_complete(deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_open_command_session_complete.unsafe_as(Proc(IMbnDeviceService, HRESULT, UInt32, HRESULT)).call(deviceservice, status, requestid)
  end
  def on_close_command_session_complete(deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_close_command_session_complete.unsafe_as(Proc(IMbnDeviceService, HRESULT, UInt32, HRESULT)).call(deviceservice, status, requestid)
  end
  def on_set_command_complete(deviceservice : IMbnDeviceService, responseid : UInt32, deviceservicedata : SAFEARRAY*, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_set_command_complete.unsafe_as(Proc(IMbnDeviceService, UInt32, SAFEARRAY*, HRESULT, UInt32, HRESULT)).call(deviceservice, responseid, deviceservicedata, status, requestid)
  end
  def on_query_command_complete(deviceservice : IMbnDeviceService, responseid : UInt32, deviceservicedata : SAFEARRAY*, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_query_command_complete.unsafe_as(Proc(IMbnDeviceService, UInt32, SAFEARRAY*, HRESULT, UInt32, HRESULT)).call(deviceservice, responseid, deviceservicedata, status, requestid)
  end
  def on_event_notification(deviceservice : IMbnDeviceService, eventid : UInt32, deviceservicedata : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_event_notification.unsafe_as(Proc(IMbnDeviceService, UInt32, SAFEARRAY*, HRESULT)).call(deviceservice, eventid, deviceservicedata)
  end
  def on_open_data_session_complete(deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_open_data_session_complete.unsafe_as(Proc(IMbnDeviceService, HRESULT, UInt32, HRESULT)).call(deviceservice, status, requestid)
  end
  def on_close_data_session_complete(deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_close_data_session_complete.unsafe_as(Proc(IMbnDeviceService, HRESULT, UInt32, HRESULT)).call(deviceservice, status, requestid)
  end
  def on_write_data_complete(deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_write_data_complete.unsafe_as(Proc(IMbnDeviceService, HRESULT, UInt32, HRESULT)).call(deviceservice, status, requestid)
  end
  def on_read_data(deviceservice : IMbnDeviceService, deviceservicedata : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_read_data.unsafe_as(Proc(IMbnDeviceService, SAFEARRAY*, HRESULT)).call(deviceservice, deviceservicedata)
  end
  def on_interface_state_change(interfaceid : UInt8*, statechange : MBN_DEVICE_SERVICES_INTERFACE_STATE) : HRESULT
    @lpVtbl.value.on_interface_state_change.unsafe_as(Proc(UInt8*, MBN_DEVICE_SERVICES_INTERFACE_STATE, HRESULT)).call(interfaceid, statechange)
  end
end
struct LibWin32::IMbnDeviceService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_supported_commands(requestid : UInt32*) : HRESULT
    @lpVtbl.value.query_supported_commands.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
  def open_command_session(requestid : UInt32*) : HRESULT
    @lpVtbl.value.open_command_session.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
  def close_command_session(requestid : UInt32*) : HRESULT
    @lpVtbl.value.close_command_session.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
  def set_command(commandid : UInt32, deviceservicedata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_command.unsafe_as(Proc(UInt32, SAFEARRAY*, UInt32*, HRESULT)).call(commandid, deviceservicedata, requestid)
  end
  def query_command(commandid : UInt32, deviceservicedata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.query_command.unsafe_as(Proc(UInt32, SAFEARRAY*, UInt32*, HRESULT)).call(commandid, deviceservicedata, requestid)
  end
  def open_data_session(requestid : UInt32*) : HRESULT
    @lpVtbl.value.open_data_session.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
  def close_data_session(requestid : UInt32*) : HRESULT
    @lpVtbl.value.close_data_session.unsafe_as(Proc(UInt32*, HRESULT)).call(requestid)
  end
  def write_data(deviceservicedata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.write_data.unsafe_as(Proc(SAFEARRAY*, UInt32*, HRESULT)).call(deviceservicedata, requestid)
  end
  def get_interface_id(interfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.unsafe_as(Proc(UInt8**, HRESULT)).call(interfaceid)
  end
  def get_device_service_id(deviceserviceid : UInt8**) : HRESULT
    @lpVtbl.value.get_device_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(deviceserviceid)
  end
  def get_is_command_session_open(value : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_command_session_open.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(value)
  end
  def get_is_data_session_open(value : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_data_session_open.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(value)
  end
end
struct LibWin32::IMbnPin
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_pin_type(pintype : MBN_PIN_TYPE*) : HRESULT
    @lpVtbl.value.get_pin_type.unsafe_as(Proc(MBN_PIN_TYPE*, HRESULT)).call(pintype)
  end
  def get_pin_format(pinformat : MBN_PIN_FORMAT*) : HRESULT
    @lpVtbl.value.get_pin_format.unsafe_as(Proc(MBN_PIN_FORMAT*, HRESULT)).call(pinformat)
  end
  def get_pin_length_min(pinlengthmin : UInt32*) : HRESULT
    @lpVtbl.value.get_pin_length_min.unsafe_as(Proc(UInt32*, HRESULT)).call(pinlengthmin)
  end
  def get_pin_length_max(pinlengthmax : UInt32*) : HRESULT
    @lpVtbl.value.get_pin_length_max.unsafe_as(Proc(UInt32*, HRESULT)).call(pinlengthmax)
  end
  def get_pin_mode(pinmode : MBN_PIN_MODE*) : HRESULT
    @lpVtbl.value.get_pin_mode.unsafe_as(Proc(MBN_PIN_MODE*, HRESULT)).call(pinmode)
  end
  def enable(pin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pin, requestid)
  end
  def disable(pin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.disable.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pin, requestid)
  end
  def enter(pin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.enter.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pin, requestid)
  end
  def change(pin : LibC::LPWSTR, newpin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.change.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32*, HRESULT)).call(pin, newpin, requestid)
  end
  def unblock(puk : LibC::LPWSTR, newpin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.unblock.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32*, HRESULT)).call(puk, newpin, requestid)
  end
  def get_pin_manager(pinmanager : IMbnPinManager*) : HRESULT
    @lpVtbl.value.get_pin_manager.unsafe_as(Proc(IMbnPinManager*, HRESULT)).call(pinmanager)
  end
end
