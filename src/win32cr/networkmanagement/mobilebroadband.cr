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
    query_interface : Proc(IDummyMBNUCMExt*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDummyMBNUCMExt*, UInt32)
    release : Proc(IDummyMBNUCMExt*, UInt32)
    get_type_info_count : Proc(IDummyMBNUCMExt*, UInt32*, HRESULT)
    get_type_info : Proc(IDummyMBNUCMExt*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDummyMBNUCMExt*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDummyMBNUCMExt*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IDummyMBNUCMExt_GUID = "dcbbbab6-ffff-4bbb-aaee-338e368af6fa"
  IID_IDummyMBNUCMExt = LibC::GUID.new(0xdcbbbab6_u32, 0xffff_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnection_GUID = "dcbbbab6-200d-4bbb-aaee-338e368af6fa"
  IID_IMbnConnection = LibC::GUID.new(0xdcbbbab6_u32, 0x200d_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionEvents_GUID = "dcbbbab6-200e-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x200e_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnInterface_GUID = "dcbbbab6-2001-4bbb-aaee-338e368af6fa"
  IID_IMbnInterface = LibC::GUID.new(0xdcbbbab6_u32, 0x2001_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnInterfaceEvents_GUID = "dcbbbab6-2002-4bbb-aaee-338e368af6fa"
  IID_IMbnInterfaceEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2002_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnInterfaceManager_GUID = "dcbbbab6-201b-4bbb-aaee-338e368af6fa"
  IID_IMbnInterfaceManager = LibC::GUID.new(0xdcbbbab6_u32, 0x201b_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnInterfaceManagerEvents_GUID = "dcbbbab6-201c-4bbb-aaee-338e368af6fa"
  IID_IMbnInterfaceManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201c_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnRegistration_GUID = "dcbbbab6-2009-4bbb-aaee-338e368af6fa"
  IID_IMbnRegistration = LibC::GUID.new(0xdcbbbab6_u32, 0x2009_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnRegistrationEvents_GUID = "dcbbbab6-200a-4bbb-aaee-338e368af6fa"
  IID_IMbnRegistrationEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x200a_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionManager_GUID = "dcbbbab6-201d-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionManager = LibC::GUID.new(0xdcbbbab6_u32, 0x201d_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionManagerEvents_GUID = "dcbbbab6-201e-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201e_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnPinManager_GUID = "dcbbbab6-2005-4bbb-aaee-338e368af6fa"
  IID_IMbnPinManager = LibC::GUID.new(0xdcbbbab6_u32, 0x2005_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnPinManagerEvents_GUID = "dcbbbab6-2006-4bbb-aaee-338e368af6fa"
  IID_IMbnPinManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2006_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnPinEvents_GUID = "dcbbbab6-2008-4bbb-aaee-338e368af6fa"
  IID_IMbnPinEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2008_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnSubscriberInformation_GUID = "459ecc43-bcf5-11dc-a8a8-001321f1405f"
  IID_IMbnSubscriberInformation = LibC::GUID.new(0x459ecc43_u32, 0xbcf5_u16, 0x11dc_u16, StaticArray[0xa8_u8, 0xa8_u8, 0x0_u8, 0x13_u8, 0x21_u8, 0xf1_u8, 0x40_u8, 0x5f_u8])
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

  IMbnSignal_GUID = "dcbbbab6-2003-4bbb-aaee-338e368af6fa"
  IID_IMbnSignal = LibC::GUID.new(0xdcbbbab6_u32, 0x2003_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSignal
    lpVtbl : IMbnSignalVTbl*
  end

  struct IMbnSignalEventsVTbl
    query_interface : Proc(IMbnSignalEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnSignalEvents*, UInt32)
    release : Proc(IMbnSignalEvents*, UInt32)
    on_signal_state_change : Proc(IMbnSignalEvents*, IMbnSignal, HRESULT)
  end

  IMbnSignalEvents_GUID = "dcbbbab6-2004-4bbb-aaee-338e368af6fa"
  IID_IMbnSignalEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2004_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionContext_GUID = "dcbbbab6-200b-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionContext = LibC::GUID.new(0xdcbbbab6_u32, 0x200b_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionContextEvents_GUID = "dcbbbab6-200c-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionContextEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x200c_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionProfileManager_GUID = "dcbbbab6-200f-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfileManager = LibC::GUID.new(0xdcbbbab6_u32, 0x200f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionProfile_GUID = "dcbbbab6-2010-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfile = LibC::GUID.new(0xdcbbbab6_u32, 0x2010_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnConnectionProfile
    lpVtbl : IMbnConnectionProfileVTbl*
  end

  struct IMbnConnectionProfileEventsVTbl
    query_interface : Proc(IMbnConnectionProfileEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnConnectionProfileEvents*, UInt32)
    release : Proc(IMbnConnectionProfileEvents*, UInt32)
    on_profile_update : Proc(IMbnConnectionProfileEvents*, IMbnConnectionProfile, HRESULT)
  end

  IMbnConnectionProfileEvents_GUID = "dcbbbab6-2011-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfileEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2011_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnSmsConfiguration_GUID = "dcbbbab6-2012-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsConfiguration = LibC::GUID.new(0xdcbbbab6_u32, 0x2012_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnSmsReadMsgPdu_GUID = "dcbbbab6-2013-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsReadMsgPdu = LibC::GUID.new(0xdcbbbab6_u32, 0x2013_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnSmsReadMsgTextCdma_GUID = "dcbbbab6-2014-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsReadMsgTextCdma = LibC::GUID.new(0xdcbbbab6_u32, 0x2014_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnSms_GUID = "dcbbbab6-2015-4bbb-aaee-338e368af6fa"
  IID_IMbnSms = LibC::GUID.new(0xdcbbbab6_u32, 0x2015_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnSmsEvents_GUID = "dcbbbab6-2016-4bbb-aaee-338e368af6fa"
  IID_IMbnSmsEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2016_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnSmsEvents
    lpVtbl : IMbnSmsEventsVTbl*
  end

  struct IMbnServiceActivationVTbl
    query_interface : Proc(IMbnServiceActivation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnServiceActivation*, UInt32)
    release : Proc(IMbnServiceActivation*, UInt32)
    activate : Proc(IMbnServiceActivation*, SAFEARRAY*, UInt32*, HRESULT)
  end

  IMbnServiceActivation_GUID = "dcbbbab6-2017-4bbb-aaee-338e368af6fa"
  IID_IMbnServiceActivation = LibC::GUID.new(0xdcbbbab6_u32, 0x2017_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnServiceActivation
    lpVtbl : IMbnServiceActivationVTbl*
  end

  struct IMbnServiceActivationEventsVTbl
    query_interface : Proc(IMbnServiceActivationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnServiceActivationEvents*, UInt32)
    release : Proc(IMbnServiceActivationEvents*, UInt32)
    on_activation_complete : Proc(IMbnServiceActivationEvents*, IMbnServiceActivation, SAFEARRAY*, UInt32, HRESULT, UInt32, HRESULT)
  end

  IMbnServiceActivationEvents_GUID = "dcbbbab6-2018-4bbb-aaee-338e368af6fa"
  IID_IMbnServiceActivationEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x2018_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnServiceActivationEvents
    lpVtbl : IMbnServiceActivationEventsVTbl*
  end

  struct IMbnVendorSpecificOperationVTbl
    query_interface : Proc(IMbnVendorSpecificOperation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnVendorSpecificOperation*, UInt32)
    release : Proc(IMbnVendorSpecificOperation*, UInt32)
    set_vendor_specific : Proc(IMbnVendorSpecificOperation*, SAFEARRAY*, UInt32*, HRESULT)
  end

  IMbnVendorSpecificOperation_GUID = "dcbbbab6-2019-4bbb-aaee-338e368af6fa"
  IID_IMbnVendorSpecificOperation = LibC::GUID.new(0xdcbbbab6_u32, 0x2019_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnVendorSpecificEvents_GUID = "dcbbbab6-201a-4bbb-aaee-338e368af6fa"
  IID_IMbnVendorSpecificEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201a_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnConnectionProfileManagerEvents_GUID = "dcbbbab6-201f-4bbb-aaee-338e368af6fa"
  IID_IMbnConnectionProfileManagerEvents = LibC::GUID.new(0xdcbbbab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnRadio_GUID = "dccccab6-201f-4bbb-aaee-338e368af6fa"
  IID_IMbnRadio = LibC::GUID.new(0xdccccab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnRadioEvents_GUID = "dcdddab6-201f-4bbb-aaee-338e368af6fa"
  IID_IMbnRadioEvents = LibC::GUID.new(0xdcdddab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnMultiCarrier_GUID = "dcbbbab6-2020-4bbb-aaee-338e368af6fa"
  IID_IMbnMultiCarrier = LibC::GUID.new(0xdcbbbab6_u32, 0x2020_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
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

  IMbnMultiCarrierEvents_GUID = "dcdddab6-2021-4bbb-aaee-338e368af6fa"
  IID_IMbnMultiCarrierEvents = LibC::GUID.new(0xdcdddab6_u32, 0x2021_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnMultiCarrierEvents
    lpVtbl : IMbnMultiCarrierEventsVTbl*
  end

  struct IMbnDeviceServiceStateEventsVTbl
    query_interface : Proc(IMbnDeviceServiceStateEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnDeviceServiceStateEvents*, UInt32)
    release : Proc(IMbnDeviceServiceStateEvents*, UInt32)
    on_sessions_state_change : Proc(IMbnDeviceServiceStateEvents*, UInt8*, MBN_DEVICE_SERVICE_SESSIONS_STATE, HRESULT)
  end

  IMbnDeviceServiceStateEvents_GUID = "5d3ff196-89ee-49d8-8b60-33ffddffc58d"
  IID_IMbnDeviceServiceStateEvents = LibC::GUID.new(0x5d3ff196_u32, 0x89ee_u16, 0x49d8_u16, StaticArray[0x8b_u8, 0x60_u8, 0x33_u8, 0xff_u8, 0xdd_u8, 0xff_u8, 0xc5_u8, 0x8d_u8])
  struct IMbnDeviceServiceStateEvents
    lpVtbl : IMbnDeviceServiceStateEventsVTbl*
  end

  struct IMbnDeviceServicesManagerVTbl
    query_interface : Proc(IMbnDeviceServicesManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMbnDeviceServicesManager*, UInt32)
    release : Proc(IMbnDeviceServicesManager*, UInt32)
    get_device_services_context : Proc(IMbnDeviceServicesManager*, UInt8*, IMbnDeviceServicesContext*, HRESULT)
  end

  IMbnDeviceServicesManager_GUID = "20a26258-6811-4478-ac1d-13324e45e41c"
  IID_IMbnDeviceServicesManager = LibC::GUID.new(0x20a26258_u32, 0x6811_u16, 0x4478_u16, StaticArray[0xac_u8, 0x1d_u8, 0x13_u8, 0x32_u8, 0x4e_u8, 0x45_u8, 0xe4_u8, 0x1c_u8])
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

  IMbnDeviceServicesContext_GUID = "fc5ac347-1592-4068-80bb-6a57580150d8"
  IID_IMbnDeviceServicesContext = LibC::GUID.new(0xfc5ac347_u32, 0x1592_u16, 0x4068_u16, StaticArray[0x80_u8, 0xbb_u8, 0x6a_u8, 0x57_u8, 0x58_u8, 0x1_u8, 0x50_u8, 0xd8_u8])
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

  IMbnDeviceServicesEvents_GUID = "0a900c19-6824-4e97-b76e-cf239d0ca642"
  IID_IMbnDeviceServicesEvents = LibC::GUID.new(0xa900c19_u32, 0x6824_u16, 0x4e97_u16, StaticArray[0xb7_u8, 0x6e_u8, 0xcf_u8, 0x23_u8, 0x9d_u8, 0xc_u8, 0xa6_u8, 0x42_u8])
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

  IMbnDeviceService_GUID = "b3bb9a71-dc70-4be9-a4da-7886ae8b191b"
  IID_IMbnDeviceService = LibC::GUID.new(0xb3bb9a71_u32, 0xdc70_u16, 0x4be9_u16, StaticArray[0xa4_u8, 0xda_u8, 0x78_u8, 0x86_u8, 0xae_u8, 0x8b_u8, 0x19_u8, 0x1b_u8])
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

  IMbnPin_GUID = "dcbbbab6-2007-4bbb-aaee-338e368af6fa"
  IID_IMbnPin = LibC::GUID.new(0xdcbbbab6_u32, 0x2007_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
  struct IMbnPin
    lpVtbl : IMbnPinVTbl*
  end

end
struct LibWin32::IDummyMBNUCMExt
  def query_interface(this : IDummyMBNUCMExt*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDummyMBNUCMExt*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDummyMBNUCMExt*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDummyMBNUCMExt*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDummyMBNUCMExt*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDummyMBNUCMExt*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDummyMBNUCMExt*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IMbnConnection
  def query_interface(this : IMbnConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_connection_id(this : IMbnConnection*, connectionid : UInt8**) : HRESULT
    @lpVtbl.value.get_connection_id.call(this, connectionid)
  end
  def get_interface_id(this : IMbnConnection*, interfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.call(this, interfaceid)
  end
  def connect(this : IMbnConnection*, connectionmode : MBN_CONNECTION_MODE, strprofile : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.connect.call(this, connectionmode, strprofile, requestid)
  end
  def disconnect(this : IMbnConnection*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.disconnect.call(this, requestid)
  end
  def get_connection_state(this : IMbnConnection*, connectionstate : MBN_ACTIVATION_STATE*, profilename : UInt8**) : HRESULT
    @lpVtbl.value.get_connection_state.call(this, connectionstate, profilename)
  end
  def get_voice_call_state(this : IMbnConnection*, voicecallstate : MBN_VOICE_CALL_STATE*) : HRESULT
    @lpVtbl.value.get_voice_call_state.call(this, voicecallstate)
  end
  def get_activation_network_error(this : IMbnConnection*, networkerror : UInt32*) : HRESULT
    @lpVtbl.value.get_activation_network_error.call(this, networkerror)
  end
end
struct LibWin32::IMbnConnectionEvents
  def query_interface(this : IMbnConnectionEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_connect_complete(this : IMbnConnectionEvents*, newconnection : IMbnConnection, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_connect_complete.call(this, newconnection, requestid, status)
  end
  def on_disconnect_complete(this : IMbnConnectionEvents*, newconnection : IMbnConnection, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_disconnect_complete.call(this, newconnection, requestid, status)
  end
  def on_connect_state_change(this : IMbnConnectionEvents*, newconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_connect_state_change.call(this, newconnection)
  end
  def on_voice_call_state_change(this : IMbnConnectionEvents*, newconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_voice_call_state_change.call(this, newconnection)
  end
end
struct LibWin32::IMbnInterface
  def query_interface(this : IMbnInterface*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnInterface*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnInterface*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_interface_id(this : IMbnInterface*, interfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.call(this, interfaceid)
  end
  def get_interface_capability(this : IMbnInterface*, interfacecaps : MBN_INTERFACE_CAPS*) : HRESULT
    @lpVtbl.value.get_interface_capability.call(this, interfacecaps)
  end
  def get_subscriber_information(this : IMbnInterface*, subscriberinformation : IMbnSubscriberInformation*) : HRESULT
    @lpVtbl.value.get_subscriber_information.call(this, subscriberinformation)
  end
  def get_ready_state(this : IMbnInterface*, readystate : MBN_READY_STATE*) : HRESULT
    @lpVtbl.value.get_ready_state.call(this, readystate)
  end
  def in_emergency_mode(this : IMbnInterface*, emergencymode : Int16*) : HRESULT
    @lpVtbl.value.in_emergency_mode.call(this, emergencymode)
  end
  def get_home_provider(this : IMbnInterface*, homeprovider : MBN_PROVIDER*) : HRESULT
    @lpVtbl.value.get_home_provider.call(this, homeprovider)
  end
  def get_preferred_providers(this : IMbnInterface*, preferredproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_preferred_providers.call(this, preferredproviders)
  end
  def set_preferred_providers(this : IMbnInterface*, preferredproviders : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_preferred_providers.call(this, preferredproviders, requestid)
  end
  def get_visible_providers(this : IMbnInterface*, age : UInt32*, visibleproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_providers.call(this, age, visibleproviders)
  end
  def scan_network(this : IMbnInterface*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.scan_network.call(this, requestid)
  end
  def get_connection(this : IMbnInterface*, mbnconnection : IMbnConnection*) : HRESULT
    @lpVtbl.value.get_connection.call(this, mbnconnection)
  end
end
struct LibWin32::IMbnInterfaceEvents
  def query_interface(this : IMbnInterfaceEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnInterfaceEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnInterfaceEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_interface_capability_available(this : IMbnInterfaceEvents*, newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_interface_capability_available.call(this, newinterface)
  end
  def on_subscriber_information_change(this : IMbnInterfaceEvents*, newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_subscriber_information_change.call(this, newinterface)
  end
  def on_ready_state_change(this : IMbnInterfaceEvents*, newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_ready_state_change.call(this, newinterface)
  end
  def on_emergency_mode_change(this : IMbnInterfaceEvents*, newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_emergency_mode_change.call(this, newinterface)
  end
  def on_home_provider_available(this : IMbnInterfaceEvents*, newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_home_provider_available.call(this, newinterface)
  end
  def on_preferred_providers_change(this : IMbnInterfaceEvents*, newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_preferred_providers_change.call(this, newinterface)
  end
  def on_set_preferred_providers_complete(this : IMbnInterfaceEvents*, newinterface : IMbnInterface, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_preferred_providers_complete.call(this, newinterface, requestid, status)
  end
  def on_scan_network_complete(this : IMbnInterfaceEvents*, newinterface : IMbnInterface, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_scan_network_complete.call(this, newinterface, requestid, status)
  end
end
struct LibWin32::IMbnInterfaceManager
  def query_interface(this : IMbnInterfaceManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnInterfaceManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnInterfaceManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_interface(this : IMbnInterfaceManager*, interfaceid : LibC::LPWSTR, mbninterface : IMbnInterface*) : HRESULT
    @lpVtbl.value.get_interface.call(this, interfaceid, mbninterface)
  end
  def get_interfaces(this : IMbnInterfaceManager*, mbninterfaces : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_interfaces.call(this, mbninterfaces)
  end
end
struct LibWin32::IMbnInterfaceManagerEvents
  def query_interface(this : IMbnInterfaceManagerEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnInterfaceManagerEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnInterfaceManagerEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_interface_arrival(this : IMbnInterfaceManagerEvents*, newinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_interface_arrival.call(this, newinterface)
  end
  def on_interface_removal(this : IMbnInterfaceManagerEvents*, oldinterface : IMbnInterface) : HRESULT
    @lpVtbl.value.on_interface_removal.call(this, oldinterface)
  end
end
struct LibWin32::IMbnRegistration
  def query_interface(this : IMbnRegistration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnRegistration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnRegistration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_register_state(this : IMbnRegistration*, registerstate : MBN_REGISTER_STATE*) : HRESULT
    @lpVtbl.value.get_register_state.call(this, registerstate)
  end
  def get_register_mode(this : IMbnRegistration*, registermode : MBN_REGISTER_MODE*) : HRESULT
    @lpVtbl.value.get_register_mode.call(this, registermode)
  end
  def get_provider_id(this : IMbnRegistration*, providerid : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_id.call(this, providerid)
  end
  def get_provider_name(this : IMbnRegistration*, providername : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_name.call(this, providername)
  end
  def get_roaming_text(this : IMbnRegistration*, roamingtext : UInt8**) : HRESULT
    @lpVtbl.value.get_roaming_text.call(this, roamingtext)
  end
  def get_available_data_classes(this : IMbnRegistration*, availabledataclasses : UInt32*) : HRESULT
    @lpVtbl.value.get_available_data_classes.call(this, availabledataclasses)
  end
  def get_current_data_class(this : IMbnRegistration*, currentdataclass : UInt32*) : HRESULT
    @lpVtbl.value.get_current_data_class.call(this, currentdataclass)
  end
  def get_registration_network_error(this : IMbnRegistration*, registrationnetworkerror : UInt32*) : HRESULT
    @lpVtbl.value.get_registration_network_error.call(this, registrationnetworkerror)
  end
  def get_packet_attach_network_error(this : IMbnRegistration*, packetattachnetworkerror : UInt32*) : HRESULT
    @lpVtbl.value.get_packet_attach_network_error.call(this, packetattachnetworkerror)
  end
  def set_register_mode(this : IMbnRegistration*, registermode : MBN_REGISTER_MODE, providerid : LibC::LPWSTR, dataclass : UInt32, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_register_mode.call(this, registermode, providerid, dataclass, requestid)
  end
end
struct LibWin32::IMbnRegistrationEvents
  def query_interface(this : IMbnRegistrationEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnRegistrationEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnRegistrationEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_register_mode_available(this : IMbnRegistrationEvents*, newinterface : IMbnRegistration) : HRESULT
    @lpVtbl.value.on_register_mode_available.call(this, newinterface)
  end
  def on_register_state_change(this : IMbnRegistrationEvents*, newinterface : IMbnRegistration) : HRESULT
    @lpVtbl.value.on_register_state_change.call(this, newinterface)
  end
  def on_packet_service_state_change(this : IMbnRegistrationEvents*, newinterface : IMbnRegistration) : HRESULT
    @lpVtbl.value.on_packet_service_state_change.call(this, newinterface)
  end
  def on_set_register_mode_complete(this : IMbnRegistrationEvents*, newinterface : IMbnRegistration, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_register_mode_complete.call(this, newinterface, requestid, status)
  end
end
struct LibWin32::IMbnConnectionManager
  def query_interface(this : IMbnConnectionManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_connection(this : IMbnConnectionManager*, connectionid : LibC::LPWSTR, mbnconnection : IMbnConnection*) : HRESULT
    @lpVtbl.value.get_connection.call(this, connectionid, mbnconnection)
  end
  def get_connections(this : IMbnConnectionManager*, mbnconnections : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_connections.call(this, mbnconnections)
  end
end
struct LibWin32::IMbnConnectionManagerEvents
  def query_interface(this : IMbnConnectionManagerEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionManagerEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionManagerEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_connection_arrival(this : IMbnConnectionManagerEvents*, newconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_connection_arrival.call(this, newconnection)
  end
  def on_connection_removal(this : IMbnConnectionManagerEvents*, oldconnection : IMbnConnection) : HRESULT
    @lpVtbl.value.on_connection_removal.call(this, oldconnection)
  end
end
struct LibWin32::IMbnPinManager
  def query_interface(this : IMbnPinManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnPinManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnPinManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_pin_list(this : IMbnPinManager*, pinlist : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_pin_list.call(this, pinlist)
  end
  def get_pin(this : IMbnPinManager*, pintype : MBN_PIN_TYPE, pin : IMbnPin*) : HRESULT
    @lpVtbl.value.get_pin.call(this, pintype, pin)
  end
  def get_pin_state(this : IMbnPinManager*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.get_pin_state.call(this, requestid)
  end
end
struct LibWin32::IMbnPinManagerEvents
  def query_interface(this : IMbnPinManagerEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnPinManagerEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnPinManagerEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_pin_list_available(this : IMbnPinManagerEvents*, pinmanager : IMbnPinManager) : HRESULT
    @lpVtbl.value.on_pin_list_available.call(this, pinmanager)
  end
  def on_get_pin_state_complete(this : IMbnPinManagerEvents*, pinmanager : IMbnPinManager, pininfo : MBN_PIN_INFO, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_get_pin_state_complete.call(this, pinmanager, pininfo, requestid, status)
  end
end
struct LibWin32::IMbnPinEvents
  def query_interface(this : IMbnPinEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnPinEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnPinEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_enable_complete(this : IMbnPinEvents*, pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_enable_complete.call(this, pin, pininfo, requestid, status)
  end
  def on_disable_complete(this : IMbnPinEvents*, pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_disable_complete.call(this, pin, pininfo, requestid, status)
  end
  def on_enter_complete(this : IMbnPinEvents*, pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_enter_complete.call(this, pin, pininfo, requestid, status)
  end
  def on_change_complete(this : IMbnPinEvents*, pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_change_complete.call(this, pin, pininfo, requestid, status)
  end
  def on_unblock_complete(this : IMbnPinEvents*, pin : IMbnPin, pininfo : MBN_PIN_INFO*, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_unblock_complete.call(this, pin, pininfo, requestid, status)
  end
end
struct LibWin32::IMbnSubscriberInformation
  def query_interface(this : IMbnSubscriberInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSubscriberInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSubscriberInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_subscriber_id(this : IMbnSubscriberInformation*, subscriberid : UInt8**) : HRESULT
    @lpVtbl.value.get_subscriber_id.call(this, subscriberid)
  end
  def get_sim_icc_id(this : IMbnSubscriberInformation*, simiccid : UInt8**) : HRESULT
    @lpVtbl.value.get_sim_icc_id.call(this, simiccid)
  end
  def get_telephone_numbers(this : IMbnSubscriberInformation*, telephonenumbers : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_telephone_numbers.call(this, telephonenumbers)
  end
end
struct LibWin32::IMbnSignal
  def query_interface(this : IMbnSignal*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSignal*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSignal*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_signal_strength(this : IMbnSignal*, signalstrength : UInt32*) : HRESULT
    @lpVtbl.value.get_signal_strength.call(this, signalstrength)
  end
  def get_signal_error(this : IMbnSignal*, signalerror : UInt32*) : HRESULT
    @lpVtbl.value.get_signal_error.call(this, signalerror)
  end
end
struct LibWin32::IMbnSignalEvents
  def query_interface(this : IMbnSignalEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSignalEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSignalEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_signal_state_change(this : IMbnSignalEvents*, newinterface : IMbnSignal) : HRESULT
    @lpVtbl.value.on_signal_state_change.call(this, newinterface)
  end
end
struct LibWin32::IMbnConnectionContext
  def query_interface(this : IMbnConnectionContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_provisioned_contexts(this : IMbnConnectionContext*, provisionedcontexts : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_provisioned_contexts.call(this, provisionedcontexts)
  end
  def set_provisioned_context(this : IMbnConnectionContext*, provisionedcontexts : MBN_CONTEXT, providerid : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_provisioned_context.call(this, provisionedcontexts, providerid, requestid)
  end
end
struct LibWin32::IMbnConnectionContextEvents
  def query_interface(this : IMbnConnectionContextEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionContextEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionContextEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_provisioned_context_list_change(this : IMbnConnectionContextEvents*, newinterface : IMbnConnectionContext) : HRESULT
    @lpVtbl.value.on_provisioned_context_list_change.call(this, newinterface)
  end
  def on_set_provisioned_context_complete(this : IMbnConnectionContextEvents*, newinterface : IMbnConnectionContext, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_provisioned_context_complete.call(this, newinterface, requestid, status)
  end
end
struct LibWin32::IMbnConnectionProfileManager
  def query_interface(this : IMbnConnectionProfileManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionProfileManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionProfileManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_connection_profiles(this : IMbnConnectionProfileManager*, mbninterface : IMbnInterface, connectionprofiles : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_connection_profiles.call(this, mbninterface, connectionprofiles)
  end
  def get_connection_profile(this : IMbnConnectionProfileManager*, mbninterface : IMbnInterface, profilename : LibC::LPWSTR, connectionprofile : IMbnConnectionProfile*) : HRESULT
    @lpVtbl.value.get_connection_profile.call(this, mbninterface, profilename, connectionprofile)
  end
  def create_connection_profile(this : IMbnConnectionProfileManager*, xmlprofile : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.create_connection_profile.call(this, xmlprofile)
  end
end
struct LibWin32::IMbnConnectionProfile
  def query_interface(this : IMbnConnectionProfile*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionProfile*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionProfile*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_profile_xml_data(this : IMbnConnectionProfile*, profiledata : UInt8**) : HRESULT
    @lpVtbl.value.get_profile_xml_data.call(this, profiledata)
  end
  def update_profile(this : IMbnConnectionProfile*, strprofile : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.update_profile.call(this, strprofile)
  end
  def delete(this : IMbnConnectionProfile*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IMbnConnectionProfileEvents
  def query_interface(this : IMbnConnectionProfileEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionProfileEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionProfileEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_profile_update(this : IMbnConnectionProfileEvents*, newprofile : IMbnConnectionProfile) : HRESULT
    @lpVtbl.value.on_profile_update.call(this, newprofile)
  end
end
struct LibWin32::IMbnSmsConfiguration
  def query_interface(this : IMbnSmsConfiguration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSmsConfiguration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSmsConfiguration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_service_center_address(this : IMbnSmsConfiguration*, scaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_service_center_address.call(this, scaddress)
  end
  def put_service_center_address(this : IMbnSmsConfiguration*, scaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_service_center_address.call(this, scaddress)
  end
  def get_max_message_index(this : IMbnSmsConfiguration*, index : UInt32*) : HRESULT
    @lpVtbl.value.get_max_message_index.call(this, index)
  end
  def get_cdma_short_msg_size(this : IMbnSmsConfiguration*, shortmsgsize : UInt32*) : HRESULT
    @lpVtbl.value.get_cdma_short_msg_size.call(this, shortmsgsize)
  end
  def get_sms_format(this : IMbnSmsConfiguration*, smsformat : MBN_SMS_FORMAT*) : HRESULT
    @lpVtbl.value.get_sms_format.call(this, smsformat)
  end
  def put_sms_format(this : IMbnSmsConfiguration*, smsformat : MBN_SMS_FORMAT) : HRESULT
    @lpVtbl.value.put_sms_format.call(this, smsformat)
  end
end
struct LibWin32::IMbnSmsReadMsgPdu
  def query_interface(this : IMbnSmsReadMsgPdu*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSmsReadMsgPdu*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSmsReadMsgPdu*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_index(this : IMbnSmsReadMsgPdu*, index : UInt32*) : HRESULT
    @lpVtbl.value.get_index.call(this, index)
  end
  def get_status(this : IMbnSmsReadMsgPdu*, status : MBN_MSG_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, status)
  end
  def get_pdu_data(this : IMbnSmsReadMsgPdu*, pdudata : UInt8**) : HRESULT
    @lpVtbl.value.get_pdu_data.call(this, pdudata)
  end
  def get_message(this : IMbnSmsReadMsgPdu*, message : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_message.call(this, message)
  end
end
struct LibWin32::IMbnSmsReadMsgTextCdma
  def query_interface(this : IMbnSmsReadMsgTextCdma*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSmsReadMsgTextCdma*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSmsReadMsgTextCdma*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_index(this : IMbnSmsReadMsgTextCdma*, index : UInt32*) : HRESULT
    @lpVtbl.value.get_index.call(this, index)
  end
  def get_status(this : IMbnSmsReadMsgTextCdma*, status : MBN_MSG_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, status)
  end
  def get_address(this : IMbnSmsReadMsgTextCdma*, address : UInt8**) : HRESULT
    @lpVtbl.value.get_address.call(this, address)
  end
  def get_timestamp(this : IMbnSmsReadMsgTextCdma*, timestamp : UInt8**) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, timestamp)
  end
  def get_encoding_id(this : IMbnSmsReadMsgTextCdma*, encodingid : MBN_SMS_CDMA_ENCODING*) : HRESULT
    @lpVtbl.value.get_encoding_id.call(this, encodingid)
  end
  def get_language_id(this : IMbnSmsReadMsgTextCdma*, languageid : MBN_SMS_CDMA_LANG*) : HRESULT
    @lpVtbl.value.get_language_id.call(this, languageid)
  end
  def get_size_in_characters(this : IMbnSmsReadMsgTextCdma*, sizeincharacters : UInt32*) : HRESULT
    @lpVtbl.value.get_size_in_characters.call(this, sizeincharacters)
  end
  def get_message(this : IMbnSmsReadMsgTextCdma*, message : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_message.call(this, message)
  end
end
struct LibWin32::IMbnSms
  def query_interface(this : IMbnSms*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSms*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSms*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_sms_configuration(this : IMbnSms*, smsconfiguration : IMbnSmsConfiguration*) : HRESULT
    @lpVtbl.value.get_sms_configuration.call(this, smsconfiguration)
  end
  def set_sms_configuration(this : IMbnSms*, smsconfiguration : IMbnSmsConfiguration, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_sms_configuration.call(this, smsconfiguration, requestid)
  end
  def sms_send_pdu(this : IMbnSms*, pdudata : LibC::LPWSTR, size : UInt8, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_send_pdu.call(this, pdudata, size, requestid)
  end
  def sms_send_cdma(this : IMbnSms*, address : LibC::LPWSTR, encoding : MBN_SMS_CDMA_ENCODING, language : MBN_SMS_CDMA_LANG, sizeincharacters : UInt32, message : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_send_cdma.call(this, address, encoding, language, sizeincharacters, message, requestid)
  end
  def sms_send_cdma_pdu(this : IMbnSms*, message : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_send_cdma_pdu.call(this, message, requestid)
  end
  def sms_read(this : IMbnSms*, smsfilter : MBN_SMS_FILTER*, smsformat : MBN_SMS_FORMAT, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_read.call(this, smsfilter, smsformat, requestid)
  end
  def sms_delete(this : IMbnSms*, smsfilter : MBN_SMS_FILTER*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.sms_delete.call(this, smsfilter, requestid)
  end
  def get_sms_status(this : IMbnSms*, smsstatusinfo : MBN_SMS_STATUS_INFO*) : HRESULT
    @lpVtbl.value.get_sms_status.call(this, smsstatusinfo)
  end
end
struct LibWin32::IMbnSmsEvents
  def query_interface(this : IMbnSmsEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnSmsEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnSmsEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_sms_configuration_change(this : IMbnSmsEvents*, sms : IMbnSms) : HRESULT
    @lpVtbl.value.on_sms_configuration_change.call(this, sms)
  end
  def on_set_sms_configuration_complete(this : IMbnSmsEvents*, sms : IMbnSms, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_sms_configuration_complete.call(this, sms, requestid, status)
  end
  def on_sms_send_complete(this : IMbnSmsEvents*, sms : IMbnSms, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_sms_send_complete.call(this, sms, requestid, status)
  end
  def on_sms_read_complete(this : IMbnSmsEvents*, sms : IMbnSms, smsformat : MBN_SMS_FORMAT, readmsgs : SAFEARRAY*, moremsgs : Int16, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_sms_read_complete.call(this, sms, smsformat, readmsgs, moremsgs, requestid, status)
  end
  def on_sms_new_class0_message(this : IMbnSmsEvents*, sms : IMbnSms, smsformat : MBN_SMS_FORMAT, readmsgs : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_sms_new_class0_message.call(this, sms, smsformat, readmsgs)
  end
  def on_sms_delete_complete(this : IMbnSmsEvents*, sms : IMbnSms, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_sms_delete_complete.call(this, sms, requestid, status)
  end
  def on_sms_status_change(this : IMbnSmsEvents*, sms : IMbnSms) : HRESULT
    @lpVtbl.value.on_sms_status_change.call(this, sms)
  end
end
struct LibWin32::IMbnServiceActivation
  def query_interface(this : IMbnServiceActivation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnServiceActivation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnServiceActivation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def activate(this : IMbnServiceActivation*, vendorspecificdata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.activate.call(this, vendorspecificdata, requestid)
  end
end
struct LibWin32::IMbnServiceActivationEvents
  def query_interface(this : IMbnServiceActivationEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnServiceActivationEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnServiceActivationEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_activation_complete(this : IMbnServiceActivationEvents*, serviceactivation : IMbnServiceActivation, vendorspecificdata : SAFEARRAY*, requestid : UInt32, status : HRESULT, networkerror : UInt32) : HRESULT
    @lpVtbl.value.on_activation_complete.call(this, serviceactivation, vendorspecificdata, requestid, status, networkerror)
  end
end
struct LibWin32::IMbnVendorSpecificOperation
  def query_interface(this : IMbnVendorSpecificOperation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnVendorSpecificOperation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnVendorSpecificOperation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_vendor_specific(this : IMbnVendorSpecificOperation*, vendorspecificdata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_vendor_specific.call(this, vendorspecificdata, requestid)
  end
end
struct LibWin32::IMbnVendorSpecificEvents
  def query_interface(this : IMbnVendorSpecificEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnVendorSpecificEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnVendorSpecificEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_event_notification(this : IMbnVendorSpecificEvents*, vendoroperation : IMbnVendorSpecificOperation, vendorspecificdata : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_event_notification.call(this, vendoroperation, vendorspecificdata)
  end
  def on_set_vendor_specific_complete(this : IMbnVendorSpecificEvents*, vendoroperation : IMbnVendorSpecificOperation, vendorspecificdata : SAFEARRAY*, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_set_vendor_specific_complete.call(this, vendoroperation, vendorspecificdata, requestid)
  end
end
struct LibWin32::IMbnConnectionProfileManagerEvents
  def query_interface(this : IMbnConnectionProfileManagerEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnConnectionProfileManagerEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnConnectionProfileManagerEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_connection_profile_arrival(this : IMbnConnectionProfileManagerEvents*, newconnectionprofile : IMbnConnectionProfile) : HRESULT
    @lpVtbl.value.on_connection_profile_arrival.call(this, newconnectionprofile)
  end
  def on_connection_profile_removal(this : IMbnConnectionProfileManagerEvents*, oldconnectionprofile : IMbnConnectionProfile) : HRESULT
    @lpVtbl.value.on_connection_profile_removal.call(this, oldconnectionprofile)
  end
end
struct LibWin32::IMbnRadio
  def query_interface(this : IMbnRadio*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnRadio*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnRadio*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_software_radio_state(this : IMbnRadio*, softwareradiostate : MBN_RADIO*) : HRESULT
    @lpVtbl.value.get_software_radio_state.call(this, softwareradiostate)
  end
  def get_hardware_radio_state(this : IMbnRadio*, hardwareradiostate : MBN_RADIO*) : HRESULT
    @lpVtbl.value.get_hardware_radio_state.call(this, hardwareradiostate)
  end
  def set_software_radio_state(this : IMbnRadio*, radiostate : MBN_RADIO, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_software_radio_state.call(this, radiostate, requestid)
  end
end
struct LibWin32::IMbnRadioEvents
  def query_interface(this : IMbnRadioEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnRadioEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnRadioEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_radio_state_change(this : IMbnRadioEvents*, newinterface : IMbnRadio) : HRESULT
    @lpVtbl.value.on_radio_state_change.call(this, newinterface)
  end
  def on_set_software_radio_state_complete(this : IMbnRadioEvents*, newinterface : IMbnRadio, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_software_radio_state_complete.call(this, newinterface, requestid, status)
  end
end
struct LibWin32::IMbnMultiCarrier
  def query_interface(this : IMbnMultiCarrier*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnMultiCarrier*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnMultiCarrier*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_home_provider(this : IMbnMultiCarrier*, homeprovider : MBN_PROVIDER2*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_home_provider.call(this, homeprovider, requestid)
  end
  def get_preferred_providers(this : IMbnMultiCarrier*, preferredmulticarrierproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_preferred_providers.call(this, preferredmulticarrierproviders)
  end
  def get_visible_providers(this : IMbnMultiCarrier*, age : UInt32*, visibleproviders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_providers.call(this, age, visibleproviders)
  end
  def get_supported_cellular_classes(this : IMbnMultiCarrier*, cellularclasses : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_cellular_classes.call(this, cellularclasses)
  end
  def get_current_cellular_class(this : IMbnMultiCarrier*, currentcellularclass : MBN_CELLULAR_CLASS*) : HRESULT
    @lpVtbl.value.get_current_cellular_class.call(this, currentcellularclass)
  end
  def scan_network(this : IMbnMultiCarrier*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.scan_network.call(this, requestid)
  end
end
struct LibWin32::IMbnMultiCarrierEvents
  def query_interface(this : IMbnMultiCarrierEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnMultiCarrierEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnMultiCarrierEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_set_home_provider_complete(this : IMbnMultiCarrierEvents*, mbninterface : IMbnMultiCarrier, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_set_home_provider_complete.call(this, mbninterface, requestid, status)
  end
  def on_current_cellular_class_change(this : IMbnMultiCarrierEvents*, mbninterface : IMbnMultiCarrier) : HRESULT
    @lpVtbl.value.on_current_cellular_class_change.call(this, mbninterface)
  end
  def on_preferred_providers_change(this : IMbnMultiCarrierEvents*, mbninterface : IMbnMultiCarrier) : HRESULT
    @lpVtbl.value.on_preferred_providers_change.call(this, mbninterface)
  end
  def on_scan_network_complete(this : IMbnMultiCarrierEvents*, mbninterface : IMbnMultiCarrier, requestid : UInt32, status : HRESULT) : HRESULT
    @lpVtbl.value.on_scan_network_complete.call(this, mbninterface, requestid, status)
  end
  def on_interface_capability_change(this : IMbnMultiCarrierEvents*, mbninterface : IMbnMultiCarrier) : HRESULT
    @lpVtbl.value.on_interface_capability_change.call(this, mbninterface)
  end
end
struct LibWin32::IMbnDeviceServiceStateEvents
  def query_interface(this : IMbnDeviceServiceStateEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnDeviceServiceStateEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnDeviceServiceStateEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_sessions_state_change(this : IMbnDeviceServiceStateEvents*, interfaceid : UInt8*, statechange : MBN_DEVICE_SERVICE_SESSIONS_STATE) : HRESULT
    @lpVtbl.value.on_sessions_state_change.call(this, interfaceid, statechange)
  end
end
struct LibWin32::IMbnDeviceServicesManager
  def query_interface(this : IMbnDeviceServicesManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnDeviceServicesManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnDeviceServicesManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_device_services_context(this : IMbnDeviceServicesManager*, networkinterfaceid : UInt8*, mbndevicescontext : IMbnDeviceServicesContext*) : HRESULT
    @lpVtbl.value.get_device_services_context.call(this, networkinterfaceid, mbndevicescontext)
  end
end
struct LibWin32::IMbnDeviceServicesContext
  def query_interface(this : IMbnDeviceServicesContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnDeviceServicesContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnDeviceServicesContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enumerate_device_services(this : IMbnDeviceServicesContext*, deviceservices : SAFEARRAY**) : HRESULT
    @lpVtbl.value.enumerate_device_services.call(this, deviceservices)
  end
  def get_device_service(this : IMbnDeviceServicesContext*, deviceserviceid : UInt8*, mbndeviceservice : IMbnDeviceService*) : HRESULT
    @lpVtbl.value.get_device_service.call(this, deviceserviceid, mbndeviceservice)
  end
  def get_max_command_size(this : IMbnDeviceServicesContext*, maxcommandsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_command_size.call(this, maxcommandsize)
  end
  def get_max_data_size(this : IMbnDeviceServicesContext*, maxdatasize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_data_size.call(this, maxdatasize)
  end
end
struct LibWin32::IMbnDeviceServicesEvents
  def query_interface(this : IMbnDeviceServicesEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnDeviceServicesEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnDeviceServicesEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_query_supported_commands_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, commandidlist : SAFEARRAY*, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_query_supported_commands_complete.call(this, deviceservice, commandidlist, status, requestid)
  end
  def on_open_command_session_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_open_command_session_complete.call(this, deviceservice, status, requestid)
  end
  def on_close_command_session_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_close_command_session_complete.call(this, deviceservice, status, requestid)
  end
  def on_set_command_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, responseid : UInt32, deviceservicedata : SAFEARRAY*, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_set_command_complete.call(this, deviceservice, responseid, deviceservicedata, status, requestid)
  end
  def on_query_command_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, responseid : UInt32, deviceservicedata : SAFEARRAY*, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_query_command_complete.call(this, deviceservice, responseid, deviceservicedata, status, requestid)
  end
  def on_event_notification(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, eventid : UInt32, deviceservicedata : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_event_notification.call(this, deviceservice, eventid, deviceservicedata)
  end
  def on_open_data_session_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_open_data_session_complete.call(this, deviceservice, status, requestid)
  end
  def on_close_data_session_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_close_data_session_complete.call(this, deviceservice, status, requestid)
  end
  def on_write_data_complete(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, status : HRESULT, requestid : UInt32) : HRESULT
    @lpVtbl.value.on_write_data_complete.call(this, deviceservice, status, requestid)
  end
  def on_read_data(this : IMbnDeviceServicesEvents*, deviceservice : IMbnDeviceService, deviceservicedata : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_read_data.call(this, deviceservice, deviceservicedata)
  end
  def on_interface_state_change(this : IMbnDeviceServicesEvents*, interfaceid : UInt8*, statechange : MBN_DEVICE_SERVICES_INTERFACE_STATE) : HRESULT
    @lpVtbl.value.on_interface_state_change.call(this, interfaceid, statechange)
  end
end
struct LibWin32::IMbnDeviceService
  def query_interface(this : IMbnDeviceService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnDeviceService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnDeviceService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_supported_commands(this : IMbnDeviceService*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.query_supported_commands.call(this, requestid)
  end
  def open_command_session(this : IMbnDeviceService*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.open_command_session.call(this, requestid)
  end
  def close_command_session(this : IMbnDeviceService*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.close_command_session.call(this, requestid)
  end
  def set_command(this : IMbnDeviceService*, commandid : UInt32, deviceservicedata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.set_command.call(this, commandid, deviceservicedata, requestid)
  end
  def query_command(this : IMbnDeviceService*, commandid : UInt32, deviceservicedata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.query_command.call(this, commandid, deviceservicedata, requestid)
  end
  def open_data_session(this : IMbnDeviceService*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.open_data_session.call(this, requestid)
  end
  def close_data_session(this : IMbnDeviceService*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.close_data_session.call(this, requestid)
  end
  def write_data(this : IMbnDeviceService*, deviceservicedata : SAFEARRAY*, requestid : UInt32*) : HRESULT
    @lpVtbl.value.write_data.call(this, deviceservicedata, requestid)
  end
  def get_interface_id(this : IMbnDeviceService*, interfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.call(this, interfaceid)
  end
  def get_device_service_id(this : IMbnDeviceService*, deviceserviceid : UInt8**) : HRESULT
    @lpVtbl.value.get_device_service_id.call(this, deviceserviceid)
  end
  def get_is_command_session_open(this : IMbnDeviceService*, value : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_command_session_open.call(this, value)
  end
  def get_is_data_session_open(this : IMbnDeviceService*, value : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_data_session_open.call(this, value)
  end
end
struct LibWin32::IMbnPin
  def query_interface(this : IMbnPin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMbnPin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMbnPin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_pin_type(this : IMbnPin*, pintype : MBN_PIN_TYPE*) : HRESULT
    @lpVtbl.value.get_pin_type.call(this, pintype)
  end
  def get_pin_format(this : IMbnPin*, pinformat : MBN_PIN_FORMAT*) : HRESULT
    @lpVtbl.value.get_pin_format.call(this, pinformat)
  end
  def get_pin_length_min(this : IMbnPin*, pinlengthmin : UInt32*) : HRESULT
    @lpVtbl.value.get_pin_length_min.call(this, pinlengthmin)
  end
  def get_pin_length_max(this : IMbnPin*, pinlengthmax : UInt32*) : HRESULT
    @lpVtbl.value.get_pin_length_max.call(this, pinlengthmax)
  end
  def get_pin_mode(this : IMbnPin*, pinmode : MBN_PIN_MODE*) : HRESULT
    @lpVtbl.value.get_pin_mode.call(this, pinmode)
  end
  def enable(this : IMbnPin*, pin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.enable.call(this, pin, requestid)
  end
  def disable(this : IMbnPin*, pin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.disable.call(this, pin, requestid)
  end
  def enter(this : IMbnPin*, pin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.enter.call(this, pin, requestid)
  end
  def change(this : IMbnPin*, pin : LibC::LPWSTR, newpin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.change.call(this, pin, newpin, requestid)
  end
  def unblock(this : IMbnPin*, puk : LibC::LPWSTR, newpin : LibC::LPWSTR, requestid : UInt32*) : HRESULT
    @lpVtbl.value.unblock.call(this, puk, newpin, requestid)
  end
  def get_pin_manager(this : IMbnPin*, pinmanager : IMbnPinManager*) : HRESULT
    @lpVtbl.value.get_pin_manager.call(this, pinmanager)
  end
end
