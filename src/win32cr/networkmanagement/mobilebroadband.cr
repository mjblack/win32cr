require "../system/com.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  MbnConnectionProfileManager = LibC::GUID.new(0xbdfee05a_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])
  MbnInterfaceManager = LibC::GUID.new(0xbdfee05b_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])
  MbnConnectionManager = LibC::GUID.new(0xbdfee05c_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])
  MbnDeviceServicesManager = LibC::GUID.new(0x2269daa3_u32, 0x2a9f_u16, 0x4165_u16, StaticArray[0xa5_u8, 0x1_u8, 0xce_u8, 0x0_u8, 0xa6_u8, 0xf7_u8, 0xa7_u8, 0x5b_u8])


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
    query_interface : Proc(IDummyMBNUCMExt*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDummyMBNUCMExt*, UInt32)
    release : Proc(IDummyMBNUCMExt*, UInt32)
    get_type_info_count : Proc(IDummyMBNUCMExt*, UInt32*, HRESULT)
    get_type_info : Proc(IDummyMBNUCMExt*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDummyMBNUCMExt*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDummyMBNUCMExt*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IDummyMBNUCMExt
    lpVtbl : IDummyMBNUCMExtVTbl*
  end

  struct IMbnConnectionVTbl
    query_interface : Proc(IMbnConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnection*, UInt32)
    release : Proc(IMbnConnection*, UInt32)
    get_connection_id : Proc(IMbnConnection*, UInt8**, HRESULT)
    get_interface_id : Proc(IMbnConnection*, UInt8**, HRESULT)
    connect : Proc(IMbnConnection*, MBN_CONNECTION_MODE, LibC::LPWSTR, UInt32*, HRESULT)
    disconnect : Proc(IMbnConnection*, UInt32*, HRESULT)
    get_connection_state : Proc(IMbnConnection*, MBN_ACTIVATION_STATE*, UInt8**, HRESULT)
    get_voice_call_state : Proc(IMbnConnection*, MBN_VOICE_CALL_STATE*, HRESULT)
    get_activation_network_error : Proc(IMbnConnection*, UInt32*, HRESULT)
  end

  struct IMbnConnection
    lpVtbl : IMbnConnectionVTbl*
  end

  struct IMbnConnectionEventsVTbl
    query_interface : Proc(IMbnConnectionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionEvents*, UInt32)
    release : Proc(IMbnConnectionEvents*, UInt32)
    on_connect_complete : Proc(IMbnConnectionEvents*, IMbnConnection, UInt32, HRESULT, HRESULT)
    on_disconnect_complete : Proc(IMbnConnectionEvents*, IMbnConnection, UInt32, HRESULT, HRESULT)
    on_connect_state_change : Proc(IMbnConnectionEvents*, IMbnConnection, HRESULT)
    on_voice_call_state_change : Proc(IMbnConnectionEvents*, IMbnConnection, HRESULT)
  end

  struct IMbnConnectionEvents
    lpVtbl : IMbnConnectionEventsVTbl*
  end

  struct IMbnInterfaceVTbl
    query_interface : Proc(IMbnInterface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnInterface*, UInt32)
    release : Proc(IMbnInterface*, UInt32)
    get_interface_id : Proc(IMbnInterface*, UInt8**, HRESULT)
    get_interface_capability : Proc(IMbnInterface*, MBN_INTERFACE_CAPS*, HRESULT)
    get_subscriber_information : Proc(IMbnInterface*, IMbnSubscriberInformation*, HRESULT)
    get_ready_state : Proc(IMbnInterface*, MBN_READY_STATE*, HRESULT)
    in_emergency_mode : Proc(IMbnInterface*, Int16*, HRESULT)
    get_home_provider : Proc(IMbnInterface*, MBN_PROVIDER*, HRESULT)
    get_preferred_providers : Proc(IMbnInterface*, SAFEARRAY**, HRESULT)
    set_preferred_providers : Proc(IMbnInterface*, SAFEARRAY*, UInt32*, HRESULT)
    get_visible_providers : Proc(IMbnInterface*, UInt32*, SAFEARRAY**, HRESULT)
    scan_network : Proc(IMbnInterface*, UInt32*, HRESULT)
    get_connection : Proc(IMbnInterface*, IMbnConnection*, HRESULT)
  end

  struct IMbnInterface
    lpVtbl : IMbnInterfaceVTbl*
  end

  struct IMbnInterfaceEventsVTbl
    query_interface : Proc(IMbnInterfaceEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnInterfaceEvents*, UInt32)
    release : Proc(IMbnInterfaceEvents*, UInt32)
    on_interface_capability_available : Proc(IMbnInterfaceEvents*, IMbnInterface, HRESULT)
    on_subscriber_information_change : Proc(IMbnInterfaceEvents*, IMbnInterface, HRESULT)
    on_ready_state_change : Proc(IMbnInterfaceEvents*, IMbnInterface, HRESULT)
    on_emergency_mode_change : Proc(IMbnInterfaceEvents*, IMbnInterface, HRESULT)
    on_home_provider_available : Proc(IMbnInterfaceEvents*, IMbnInterface, HRESULT)
    on_preferred_providers_change : Proc(IMbnInterfaceEvents*, IMbnInterface, HRESULT)
    on_set_preferred_providers_complete : Proc(IMbnInterfaceEvents*, IMbnInterface, UInt32, HRESULT, HRESULT)
    on_scan_network_complete : Proc(IMbnInterfaceEvents*, IMbnInterface, UInt32, HRESULT, HRESULT)
  end

  struct IMbnInterfaceEvents
    lpVtbl : IMbnInterfaceEventsVTbl*
  end

  struct IMbnInterfaceManagerVTbl
    query_interface : Proc(IMbnInterfaceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnInterfaceManager*, UInt32)
    release : Proc(IMbnInterfaceManager*, UInt32)
    get_interface : Proc(IMbnInterfaceManager*, LibC::LPWSTR, IMbnInterface*, HRESULT)
    get_interfaces : Proc(IMbnInterfaceManager*, SAFEARRAY**, HRESULT)
  end

  struct IMbnInterfaceManager
    lpVtbl : IMbnInterfaceManagerVTbl*
  end

  struct IMbnInterfaceManagerEventsVTbl
    query_interface : Proc(IMbnInterfaceManagerEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnInterfaceManagerEvents*, UInt32)
    release : Proc(IMbnInterfaceManagerEvents*, UInt32)
    on_interface_arrival : Proc(IMbnInterfaceManagerEvents*, IMbnInterface, HRESULT)
    on_interface_removal : Proc(IMbnInterfaceManagerEvents*, IMbnInterface, HRESULT)
  end

  struct IMbnInterfaceManagerEvents
    lpVtbl : IMbnInterfaceManagerEventsVTbl*
  end

  struct IMbnRegistrationVTbl
    query_interface : Proc(IMbnRegistration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnRegistration*, UInt32)
    release : Proc(IMbnRegistration*, UInt32)
    get_register_state : Proc(IMbnRegistration*, MBN_REGISTER_STATE*, HRESULT)
    get_register_mode : Proc(IMbnRegistration*, MBN_REGISTER_MODE*, HRESULT)
    get_provider_id : Proc(IMbnRegistration*, UInt8**, HRESULT)
    get_provider_name : Proc(IMbnRegistration*, UInt8**, HRESULT)
    get_roaming_text : Proc(IMbnRegistration*, UInt8**, HRESULT)
    get_available_data_classes : Proc(IMbnRegistration*, UInt32*, HRESULT)
    get_current_data_class : Proc(IMbnRegistration*, UInt32*, HRESULT)
    get_registration_network_error : Proc(IMbnRegistration*, UInt32*, HRESULT)
    get_packet_attach_network_error : Proc(IMbnRegistration*, UInt32*, HRESULT)
    set_register_mode : Proc(IMbnRegistration*, MBN_REGISTER_MODE, LibC::LPWSTR, UInt32, UInt32*, HRESULT)
  end

  struct IMbnRegistration
    lpVtbl : IMbnRegistrationVTbl*
  end

  struct IMbnRegistrationEventsVTbl
    query_interface : Proc(IMbnRegistrationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnRegistrationEvents*, UInt32)
    release : Proc(IMbnRegistrationEvents*, UInt32)
    on_register_mode_available : Proc(IMbnRegistrationEvents*, IMbnRegistration, HRESULT)
    on_register_state_change : Proc(IMbnRegistrationEvents*, IMbnRegistration, HRESULT)
    on_packet_service_state_change : Proc(IMbnRegistrationEvents*, IMbnRegistration, HRESULT)
    on_set_register_mode_complete : Proc(IMbnRegistrationEvents*, IMbnRegistration, UInt32, HRESULT, HRESULT)
  end

  struct IMbnRegistrationEvents
    lpVtbl : IMbnRegistrationEventsVTbl*
  end

  struct IMbnConnectionManagerVTbl
    query_interface : Proc(IMbnConnectionManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionManager*, UInt32)
    release : Proc(IMbnConnectionManager*, UInt32)
    get_connection : Proc(IMbnConnectionManager*, LibC::LPWSTR, IMbnConnection*, HRESULT)
    get_connections : Proc(IMbnConnectionManager*, SAFEARRAY**, HRESULT)
  end

  struct IMbnConnectionManager
    lpVtbl : IMbnConnectionManagerVTbl*
  end

  struct IMbnConnectionManagerEventsVTbl
    query_interface : Proc(IMbnConnectionManagerEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionManagerEvents*, UInt32)
    release : Proc(IMbnConnectionManagerEvents*, UInt32)
    on_connection_arrival : Proc(IMbnConnectionManagerEvents*, IMbnConnection, HRESULT)
    on_connection_removal : Proc(IMbnConnectionManagerEvents*, IMbnConnection, HRESULT)
  end

  struct IMbnConnectionManagerEvents
    lpVtbl : IMbnConnectionManagerEventsVTbl*
  end

  struct IMbnPinManagerVTbl
    query_interface : Proc(IMbnPinManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnPinManager*, UInt32)
    release : Proc(IMbnPinManager*, UInt32)
    get_pin_list : Proc(IMbnPinManager*, SAFEARRAY**, HRESULT)
    get_pin : Proc(IMbnPinManager*, MBN_PIN_TYPE, IMbnPin*, HRESULT)
    get_pin_state : Proc(IMbnPinManager*, UInt32*, HRESULT)
  end

  struct IMbnPinManager
    lpVtbl : IMbnPinManagerVTbl*
  end

  struct IMbnPinManagerEventsVTbl
    query_interface : Proc(IMbnPinManagerEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnPinManagerEvents*, UInt32)
    release : Proc(IMbnPinManagerEvents*, UInt32)
    on_pin_list_available : Proc(IMbnPinManagerEvents*, IMbnPinManager, HRESULT)
    on_get_pin_state_complete : Proc(IMbnPinManagerEvents*, IMbnPinManager, MBN_PIN_INFO, UInt32, HRESULT, HRESULT)
  end

  struct IMbnPinManagerEvents
    lpVtbl : IMbnPinManagerEventsVTbl*
  end

  struct IMbnPinEventsVTbl
    query_interface : Proc(IMbnPinEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnPinEvents*, UInt32)
    release : Proc(IMbnPinEvents*, UInt32)
    on_enable_complete : Proc(IMbnPinEvents*, IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)
    on_disable_complete : Proc(IMbnPinEvents*, IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)
    on_enter_complete : Proc(IMbnPinEvents*, IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)
    on_change_complete : Proc(IMbnPinEvents*, IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)
    on_unblock_complete : Proc(IMbnPinEvents*, IMbnPin, MBN_PIN_INFO*, UInt32, HRESULT, HRESULT)
  end

  struct IMbnPinEvents
    lpVtbl : IMbnPinEventsVTbl*
  end

  struct IMbnSubscriberInformationVTbl
    query_interface : Proc(IMbnSubscriberInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSubscriberInformation*, UInt32)
    release : Proc(IMbnSubscriberInformation*, UInt32)
    get_subscriber_id : Proc(IMbnSubscriberInformation*, UInt8**, HRESULT)
    get_sim_icc_id : Proc(IMbnSubscriberInformation*, UInt8**, HRESULT)
    get_telephone_numbers : Proc(IMbnSubscriberInformation*, SAFEARRAY**, HRESULT)
  end

  struct IMbnSubscriberInformation
    lpVtbl : IMbnSubscriberInformationVTbl*
  end

  struct IMbnSignalVTbl
    query_interface : Proc(IMbnSignal*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSignal*, UInt32)
    release : Proc(IMbnSignal*, UInt32)
    get_signal_strength : Proc(IMbnSignal*, UInt32*, HRESULT)
    get_signal_error : Proc(IMbnSignal*, UInt32*, HRESULT)
  end

  struct IMbnSignal
    lpVtbl : IMbnSignalVTbl*
  end

  struct IMbnSignalEventsVTbl
    query_interface : Proc(IMbnSignalEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSignalEvents*, UInt32)
    release : Proc(IMbnSignalEvents*, UInt32)
    on_signal_state_change : Proc(IMbnSignalEvents*, IMbnSignal, HRESULT)
  end

  struct IMbnSignalEvents
    lpVtbl : IMbnSignalEventsVTbl*
  end

  struct IMbnConnectionContextVTbl
    query_interface : Proc(IMbnConnectionContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionContext*, UInt32)
    release : Proc(IMbnConnectionContext*, UInt32)
    get_provisioned_contexts : Proc(IMbnConnectionContext*, SAFEARRAY**, HRESULT)
    set_provisioned_context : Proc(IMbnConnectionContext*, MBN_CONTEXT, LibC::LPWSTR, UInt32*, HRESULT)
  end

  struct IMbnConnectionContext
    lpVtbl : IMbnConnectionContextVTbl*
  end

  struct IMbnConnectionContextEventsVTbl
    query_interface : Proc(IMbnConnectionContextEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionContextEvents*, UInt32)
    release : Proc(IMbnConnectionContextEvents*, UInt32)
    on_provisioned_context_list_change : Proc(IMbnConnectionContextEvents*, IMbnConnectionContext, HRESULT)
    on_set_provisioned_context_complete : Proc(IMbnConnectionContextEvents*, IMbnConnectionContext, UInt32, HRESULT, HRESULT)
  end

  struct IMbnConnectionContextEvents
    lpVtbl : IMbnConnectionContextEventsVTbl*
  end

  struct IMbnConnectionProfileManagerVTbl
    query_interface : Proc(IMbnConnectionProfileManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionProfileManager*, UInt32)
    release : Proc(IMbnConnectionProfileManager*, UInt32)
    get_connection_profiles : Proc(IMbnConnectionProfileManager*, IMbnInterface, SAFEARRAY**, HRESULT)
    get_connection_profile : Proc(IMbnConnectionProfileManager*, IMbnInterface, LibC::LPWSTR, IMbnConnectionProfile*, HRESULT)
    create_connection_profile : Proc(IMbnConnectionProfileManager*, LibC::LPWSTR, HRESULT)
  end

  struct IMbnConnectionProfileManager
    lpVtbl : IMbnConnectionProfileManagerVTbl*
  end

  struct IMbnConnectionProfileVTbl
    query_interface : Proc(IMbnConnectionProfile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionProfile*, UInt32)
    release : Proc(IMbnConnectionProfile*, UInt32)
    get_profile_xml_data : Proc(IMbnConnectionProfile*, UInt8**, HRESULT)
    update_profile : Proc(IMbnConnectionProfile*, LibC::LPWSTR, HRESULT)
    delete : Proc(IMbnConnectionProfile*, HRESULT)
  end

  struct IMbnConnectionProfile
    lpVtbl : IMbnConnectionProfileVTbl*
  end

  struct IMbnConnectionProfileEventsVTbl
    query_interface : Proc(IMbnConnectionProfileEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionProfileEvents*, UInt32)
    release : Proc(IMbnConnectionProfileEvents*, UInt32)
    on_profile_update : Proc(IMbnConnectionProfileEvents*, IMbnConnectionProfile, HRESULT)
  end

  struct IMbnConnectionProfileEvents
    lpVtbl : IMbnConnectionProfileEventsVTbl*
  end

  struct IMbnSmsConfigurationVTbl
    query_interface : Proc(IMbnSmsConfiguration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSmsConfiguration*, UInt32)
    release : Proc(IMbnSmsConfiguration*, UInt32)
    get_service_center_address : Proc(IMbnSmsConfiguration*, UInt8**, HRESULT)
    put_service_center_address : Proc(IMbnSmsConfiguration*, LibC::LPWSTR, HRESULT)
    get_max_message_index : Proc(IMbnSmsConfiguration*, UInt32*, HRESULT)
    get_cdma_short_msg_size : Proc(IMbnSmsConfiguration*, UInt32*, HRESULT)
    get_sms_format : Proc(IMbnSmsConfiguration*, MBN_SMS_FORMAT*, HRESULT)
    put_sms_format : Proc(IMbnSmsConfiguration*, MBN_SMS_FORMAT, HRESULT)
  end

  struct IMbnSmsConfiguration
    lpVtbl : IMbnSmsConfigurationVTbl*
  end

  struct IMbnSmsReadMsgPduVTbl
    query_interface : Proc(IMbnSmsReadMsgPdu*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSmsReadMsgPdu*, UInt32)
    release : Proc(IMbnSmsReadMsgPdu*, UInt32)
    get_index : Proc(IMbnSmsReadMsgPdu*, UInt32*, HRESULT)
    get_status : Proc(IMbnSmsReadMsgPdu*, MBN_MSG_STATUS*, HRESULT)
    get_pdu_data : Proc(IMbnSmsReadMsgPdu*, UInt8**, HRESULT)
    get_message : Proc(IMbnSmsReadMsgPdu*, SAFEARRAY**, HRESULT)
  end

  struct IMbnSmsReadMsgPdu
    lpVtbl : IMbnSmsReadMsgPduVTbl*
  end

  struct IMbnSmsReadMsgTextCdmaVTbl
    query_interface : Proc(IMbnSmsReadMsgTextCdma*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSmsReadMsgTextCdma*, UInt32)
    release : Proc(IMbnSmsReadMsgTextCdma*, UInt32)
    get_index : Proc(IMbnSmsReadMsgTextCdma*, UInt32*, HRESULT)
    get_status : Proc(IMbnSmsReadMsgTextCdma*, MBN_MSG_STATUS*, HRESULT)
    get_address : Proc(IMbnSmsReadMsgTextCdma*, UInt8**, HRESULT)
    get_timestamp : Proc(IMbnSmsReadMsgTextCdma*, UInt8**, HRESULT)
    get_encoding_id : Proc(IMbnSmsReadMsgTextCdma*, MBN_SMS_CDMA_ENCODING*, HRESULT)
    get_language_id : Proc(IMbnSmsReadMsgTextCdma*, MBN_SMS_CDMA_LANG*, HRESULT)
    get_size_in_characters : Proc(IMbnSmsReadMsgTextCdma*, UInt32*, HRESULT)
    get_message : Proc(IMbnSmsReadMsgTextCdma*, SAFEARRAY**, HRESULT)
  end

  struct IMbnSmsReadMsgTextCdma
    lpVtbl : IMbnSmsReadMsgTextCdmaVTbl*
  end

  struct IMbnSmsVTbl
    query_interface : Proc(IMbnSms*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSms*, UInt32)
    release : Proc(IMbnSms*, UInt32)
    get_sms_configuration : Proc(IMbnSms*, IMbnSmsConfiguration*, HRESULT)
    set_sms_configuration : Proc(IMbnSms*, IMbnSmsConfiguration, UInt32*, HRESULT)
    sms_send_pdu : Proc(IMbnSms*, LibC::LPWSTR, UInt8, UInt32*, HRESULT)
    sms_send_cdma : Proc(IMbnSms*, LibC::LPWSTR, MBN_SMS_CDMA_ENCODING, MBN_SMS_CDMA_LANG, UInt32, SAFEARRAY*, UInt32*, HRESULT)
    sms_send_cdma_pdu : Proc(IMbnSms*, SAFEARRAY*, UInt32*, HRESULT)
    sms_read : Proc(IMbnSms*, MBN_SMS_FILTER*, MBN_SMS_FORMAT, UInt32*, HRESULT)
    sms_delete : Proc(IMbnSms*, MBN_SMS_FILTER*, UInt32*, HRESULT)
    get_sms_status : Proc(IMbnSms*, MBN_SMS_STATUS_INFO*, HRESULT)
  end

  struct IMbnSms
    lpVtbl : IMbnSmsVTbl*
  end

  struct IMbnSmsEventsVTbl
    query_interface : Proc(IMbnSmsEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSmsEvents*, UInt32)
    release : Proc(IMbnSmsEvents*, UInt32)
    on_sms_configuration_change : Proc(IMbnSmsEvents*, IMbnSms, HRESULT)
    on_set_sms_configuration_complete : Proc(IMbnSmsEvents*, IMbnSms, UInt32, HRESULT, HRESULT)
    on_sms_send_complete : Proc(IMbnSmsEvents*, IMbnSms, UInt32, HRESULT, HRESULT)
    on_sms_read_complete : Proc(IMbnSmsEvents*, IMbnSms, MBN_SMS_FORMAT, SAFEARRAY*, Int16, UInt32, HRESULT, HRESULT)
    on_sms_new_class0_message : Proc(IMbnSmsEvents*, IMbnSms, MBN_SMS_FORMAT, SAFEARRAY*, HRESULT)
    on_sms_delete_complete : Proc(IMbnSmsEvents*, IMbnSms, UInt32, HRESULT, HRESULT)
    on_sms_status_change : Proc(IMbnSmsEvents*, IMbnSms, HRESULT)
  end

  struct IMbnSmsEvents
    lpVtbl : IMbnSmsEventsVTbl*
  end

  struct IMbnServiceActivationVTbl
    query_interface : Proc(IMbnServiceActivation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnServiceActivation*, UInt32)
    release : Proc(IMbnServiceActivation*, UInt32)
    activate : Proc(IMbnServiceActivation*, SAFEARRAY*, UInt32*, HRESULT)
  end

  struct IMbnServiceActivation
    lpVtbl : IMbnServiceActivationVTbl*
  end

  struct IMbnServiceActivationEventsVTbl
    query_interface : Proc(IMbnServiceActivationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnServiceActivationEvents*, UInt32)
    release : Proc(IMbnServiceActivationEvents*, UInt32)
    on_activation_complete : Proc(IMbnServiceActivationEvents*, IMbnServiceActivation, SAFEARRAY*, UInt32, HRESULT, UInt32, HRESULT)
  end

  struct IMbnServiceActivationEvents
    lpVtbl : IMbnServiceActivationEventsVTbl*
  end

  struct IMbnVendorSpecificOperationVTbl
    query_interface : Proc(IMbnVendorSpecificOperation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnVendorSpecificOperation*, UInt32)
    release : Proc(IMbnVendorSpecificOperation*, UInt32)
    set_vendor_specific : Proc(IMbnVendorSpecificOperation*, SAFEARRAY*, UInt32*, HRESULT)
  end

  struct IMbnVendorSpecificOperation
    lpVtbl : IMbnVendorSpecificOperationVTbl*
  end

  struct IMbnVendorSpecificEventsVTbl
    query_interface : Proc(IMbnVendorSpecificEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnVendorSpecificEvents*, UInt32)
    release : Proc(IMbnVendorSpecificEvents*, UInt32)
    on_event_notification : Proc(IMbnVendorSpecificEvents*, IMbnVendorSpecificOperation, SAFEARRAY*, HRESULT)
    on_set_vendor_specific_complete : Proc(IMbnVendorSpecificEvents*, IMbnVendorSpecificOperation, SAFEARRAY*, UInt32, HRESULT)
  end

  struct IMbnVendorSpecificEvents
    lpVtbl : IMbnVendorSpecificEventsVTbl*
  end

  struct IMbnConnectionProfileManagerEventsVTbl
    query_interface : Proc(IMbnConnectionProfileManagerEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionProfileManagerEvents*, UInt32)
    release : Proc(IMbnConnectionProfileManagerEvents*, UInt32)
    on_connection_profile_arrival : Proc(IMbnConnectionProfileManagerEvents*, IMbnConnectionProfile, HRESULT)
    on_connection_profile_removal : Proc(IMbnConnectionProfileManagerEvents*, IMbnConnectionProfile, HRESULT)
  end

  struct IMbnConnectionProfileManagerEvents
    lpVtbl : IMbnConnectionProfileManagerEventsVTbl*
  end

  struct IMbnRadioVTbl
    query_interface : Proc(IMbnRadio*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnRadio*, UInt32)
    release : Proc(IMbnRadio*, UInt32)
    get_software_radio_state : Proc(IMbnRadio*, MBN_RADIO*, HRESULT)
    get_hardware_radio_state : Proc(IMbnRadio*, MBN_RADIO*, HRESULT)
    set_software_radio_state : Proc(IMbnRadio*, MBN_RADIO, UInt32*, HRESULT)
  end

  struct IMbnRadio
    lpVtbl : IMbnRadioVTbl*
  end

  struct IMbnRadioEventsVTbl
    query_interface : Proc(IMbnRadioEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnRadioEvents*, UInt32)
    release : Proc(IMbnRadioEvents*, UInt32)
    on_radio_state_change : Proc(IMbnRadioEvents*, IMbnRadio, HRESULT)
    on_set_software_radio_state_complete : Proc(IMbnRadioEvents*, IMbnRadio, UInt32, HRESULT, HRESULT)
  end

  struct IMbnRadioEvents
    lpVtbl : IMbnRadioEventsVTbl*
  end

  struct IMbnMultiCarrierVTbl
    query_interface : Proc(IMbnMultiCarrier*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnMultiCarrier*, UInt32)
    release : Proc(IMbnMultiCarrier*, UInt32)
    set_home_provider : Proc(IMbnMultiCarrier*, MBN_PROVIDER2*, UInt32*, HRESULT)
    get_preferred_providers : Proc(IMbnMultiCarrier*, SAFEARRAY**, HRESULT)
    get_visible_providers : Proc(IMbnMultiCarrier*, UInt32*, SAFEARRAY**, HRESULT)
    get_supported_cellular_classes : Proc(IMbnMultiCarrier*, SAFEARRAY**, HRESULT)
    get_current_cellular_class : Proc(IMbnMultiCarrier*, MBN_CELLULAR_CLASS*, HRESULT)
    scan_network : Proc(IMbnMultiCarrier*, UInt32*, HRESULT)
  end

  struct IMbnMultiCarrier
    lpVtbl : IMbnMultiCarrierVTbl*
  end

  struct IMbnMultiCarrierEventsVTbl
    query_interface : Proc(IMbnMultiCarrierEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnMultiCarrierEvents*, UInt32)
    release : Proc(IMbnMultiCarrierEvents*, UInt32)
    on_set_home_provider_complete : Proc(IMbnMultiCarrierEvents*, IMbnMultiCarrier, UInt32, HRESULT, HRESULT)
    on_current_cellular_class_change : Proc(IMbnMultiCarrierEvents*, IMbnMultiCarrier, HRESULT)
    on_preferred_providers_change : Proc(IMbnMultiCarrierEvents*, IMbnMultiCarrier, HRESULT)
    on_scan_network_complete : Proc(IMbnMultiCarrierEvents*, IMbnMultiCarrier, UInt32, HRESULT, HRESULT)
    on_interface_capability_change : Proc(IMbnMultiCarrierEvents*, IMbnMultiCarrier, HRESULT)
  end

  struct IMbnMultiCarrierEvents
    lpVtbl : IMbnMultiCarrierEventsVTbl*
  end

  struct IMbnDeviceServiceStateEventsVTbl
    query_interface : Proc(IMbnDeviceServiceStateEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnDeviceServiceStateEvents*, UInt32)
    release : Proc(IMbnDeviceServiceStateEvents*, UInt32)
    on_sessions_state_change : Proc(IMbnDeviceServiceStateEvents*, UInt8*, MBN_DEVICE_SERVICE_SESSIONS_STATE, HRESULT)
  end

  struct IMbnDeviceServiceStateEvents
    lpVtbl : IMbnDeviceServiceStateEventsVTbl*
  end

  struct IMbnDeviceServicesManagerVTbl
    query_interface : Proc(IMbnDeviceServicesManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnDeviceServicesManager*, UInt32)
    release : Proc(IMbnDeviceServicesManager*, UInt32)
    get_device_services_context : Proc(IMbnDeviceServicesManager*, UInt8*, IMbnDeviceServicesContext*, HRESULT)
  end

  struct IMbnDeviceServicesManager
    lpVtbl : IMbnDeviceServicesManagerVTbl*
  end

  struct IMbnDeviceServicesContextVTbl
    query_interface : Proc(IMbnDeviceServicesContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnDeviceServicesContext*, UInt32)
    release : Proc(IMbnDeviceServicesContext*, UInt32)
    enumerate_device_services : Proc(IMbnDeviceServicesContext*, SAFEARRAY**, HRESULT)
    get_device_service : Proc(IMbnDeviceServicesContext*, UInt8*, IMbnDeviceService*, HRESULT)
    get_max_command_size : Proc(IMbnDeviceServicesContext*, UInt32*, HRESULT)
    get_max_data_size : Proc(IMbnDeviceServicesContext*, UInt32*, HRESULT)
  end

  struct IMbnDeviceServicesContext
    lpVtbl : IMbnDeviceServicesContextVTbl*
  end

  struct IMbnDeviceServicesEventsVTbl
    query_interface : Proc(IMbnDeviceServicesEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnDeviceServicesEvents*, UInt32)
    release : Proc(IMbnDeviceServicesEvents*, UInt32)
    on_query_supported_commands_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, SAFEARRAY*, HRESULT, UInt32, HRESULT)
    on_open_command_session_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, HRESULT, UInt32, HRESULT)
    on_close_command_session_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, HRESULT, UInt32, HRESULT)
    on_set_command_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, UInt32, SAFEARRAY*, HRESULT, UInt32, HRESULT)
    on_query_command_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, UInt32, SAFEARRAY*, HRESULT, UInt32, HRESULT)
    on_event_notification : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, UInt32, SAFEARRAY*, HRESULT)
    on_open_data_session_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, HRESULT, UInt32, HRESULT)
    on_close_data_session_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, HRESULT, UInt32, HRESULT)
    on_write_data_complete : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, HRESULT, UInt32, HRESULT)
    on_read_data : Proc(IMbnDeviceServicesEvents*, IMbnDeviceService, SAFEARRAY*, HRESULT)
    on_interface_state_change : Proc(IMbnDeviceServicesEvents*, UInt8*, MBN_DEVICE_SERVICES_INTERFACE_STATE, HRESULT)
  end

  struct IMbnDeviceServicesEvents
    lpVtbl : IMbnDeviceServicesEventsVTbl*
  end

  struct IMbnDeviceServiceVTbl
    query_interface : Proc(IMbnDeviceService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnDeviceService*, UInt32)
    release : Proc(IMbnDeviceService*, UInt32)
    query_supported_commands : Proc(IMbnDeviceService*, UInt32*, HRESULT)
    open_command_session : Proc(IMbnDeviceService*, UInt32*, HRESULT)
    close_command_session : Proc(IMbnDeviceService*, UInt32*, HRESULT)
    set_command : Proc(IMbnDeviceService*, UInt32, SAFEARRAY*, UInt32*, HRESULT)
    query_command : Proc(IMbnDeviceService*, UInt32, SAFEARRAY*, UInt32*, HRESULT)
    open_data_session : Proc(IMbnDeviceService*, UInt32*, HRESULT)
    close_data_session : Proc(IMbnDeviceService*, UInt32*, HRESULT)
    write_data : Proc(IMbnDeviceService*, SAFEARRAY*, UInt32*, HRESULT)
    get_interface_id : Proc(IMbnDeviceService*, UInt8**, HRESULT)
    get_device_service_id : Proc(IMbnDeviceService*, UInt8**, HRESULT)
    get_is_command_session_open : Proc(IMbnDeviceService*, LibC::BOOL*, HRESULT)
    get_is_data_session_open : Proc(IMbnDeviceService*, LibC::BOOL*, HRESULT)
  end

  struct IMbnDeviceService
    lpVtbl : IMbnDeviceServiceVTbl*
  end

  struct IMbnPinVTbl
    query_interface : Proc(IMbnPin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnPin*, UInt32)
    release : Proc(IMbnPin*, UInt32)
    get_pin_type : Proc(IMbnPin*, MBN_PIN_TYPE*, HRESULT)
    get_pin_format : Proc(IMbnPin*, MBN_PIN_FORMAT*, HRESULT)
    get_pin_length_min : Proc(IMbnPin*, UInt32*, HRESULT)
    get_pin_length_max : Proc(IMbnPin*, UInt32*, HRESULT)
    get_pin_mode : Proc(IMbnPin*, MBN_PIN_MODE*, HRESULT)
    enable : Proc(IMbnPin*, LibC::LPWSTR, UInt32*, HRESULT)
    disable : Proc(IMbnPin*, LibC::LPWSTR, UInt32*, HRESULT)
    enter : Proc(IMbnPin*, LibC::LPWSTR, UInt32*, HRESULT)
    change : Proc(IMbnPin*, LibC::LPWSTR, LibC::LPWSTR, UInt32*, HRESULT)
    unblock : Proc(IMbnPin*, LibC::LPWSTR, LibC::LPWSTR, UInt32*, HRESULT)
    get_pin_manager : Proc(IMbnPin*, IMbnPinManager*, HRESULT)
  end

  struct IMbnPin
    lpVtbl : IMbnPinVTbl*
  end

end
