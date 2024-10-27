require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::NetworkManagement::MobileBroadband

  CLSID_MbnConnectionProfileManager = LibC::GUID.new(0xbdfee05a_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])

  CLSID_MbnInterfaceManager = LibC::GUID.new(0xbdfee05b_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])

  CLSID_MbnConnectionManager = LibC::GUID.new(0xbdfee05c_u32, 0x4418_u16, 0x11dd_u16, StaticArray[0x90_u8, 0xed_u8, 0x0_u8, 0x1c_u8, 0x25_u8, 0x7c_u8, 0xcf_u8, 0xf1_u8])

  CLSID_MbnDeviceServicesManager = LibC::GUID.new(0x2269daa3_u32, 0x2a9f_u16, 0x4165_u16, StaticArray[0xa5_u8, 0x1_u8, 0xce_u8, 0x0_u8, 0xa6_u8, 0xf7_u8, 0xa7_u8, 0x5b_u8])

  enum MBN_SIGNAL_CONSTANTS
    MBN_RSSI_DEFAULT = -1_i32
    MBN_RSSI_DISABLE = 0_i32
    MBN_RSSI_UNKNOWN = 99_i32
    MBN_ERROR_RATE_UNKNOWN = 99_i32
  end
  enum MBN_CELLULAR_CLASS
    MBN_CELLULAR_CLASS_NONE = 0_i32
    MBN_CELLULAR_CLASS_GSM = 1_i32
    MBN_CELLULAR_CLASS_CDMA = 2_i32
  end
  enum MBN_VOICE_CLASS
    MBN_VOICE_CLASS_NONE = 0_i32
    MBN_VOICE_CLASS_NO_VOICE = 1_i32
    MBN_VOICE_CLASS_SEPARATE_VOICE_DATA = 2_i32
    MBN_VOICE_CLASS_SIMULTANEOUS_VOICE_DATA = 3_i32
  end
  enum MBN_PROVIDER_STATE
    MBN_PROVIDER_STATE_NONE = 0_i32
    MBN_PROVIDER_STATE_HOME = 1_i32
    MBN_PROVIDER_STATE_FORBIDDEN = 2_i32
    MBN_PROVIDER_STATE_PREFERRED = 4_i32
    MBN_PROVIDER_STATE_VISIBLE = 8_i32
    MBN_PROVIDER_STATE_REGISTERED = 16_i32
    MBN_PROVIDER_STATE_PREFERRED_MULTICARRIER = 32_i32
  end
  enum MBN_PROVIDER_CONSTANTS
    MBN_PROVIDERNAME_LEN = 20_i32
    MBN_PROVIDERID_LEN = 6_i32
  end
  enum MBN_INTERFACE_CAPS_CONSTANTS
    MBN_DEVICEID_LEN = 18_i32
    MBN_MANUFACTURER_LEN = 32_i32
    MBN_MODEL_LEN = 32_i32
    MBN_FIRMWARE_LEN = 32_i32
  end
  enum MBN_DATA_CLASS
    MBN_DATA_CLASS_NONE = 0_i32
    MBN_DATA_CLASS_GPRS = 1_i32
    MBN_DATA_CLASS_EDGE = 2_i32
    MBN_DATA_CLASS_UMTS = 4_i32
    MBN_DATA_CLASS_HSDPA = 8_i32
    MBN_DATA_CLASS_HSUPA = 16_i32
    MBN_DATA_CLASS_LTE = 32_i32
    MBN_DATA_CLASS_5G_NSA = 64_i32
    MBN_DATA_CLASS_5G_SA = 128_i32
    MBN_DATA_CLASS_1XRTT = 65536_i32
    MBN_DATA_CLASS_1XEVDO = 131072_i32
    MBN_DATA_CLASS_1XEVDO_REVA = 262144_i32
    MBN_DATA_CLASS_1XEVDV = 524288_i32
    MBN_DATA_CLASS_3XRTT = 1048576_i32
    MBN_DATA_CLASS_1XEVDO_REVB = 2097152_i32
    MBN_DATA_CLASS_UMB = 4194304_i32
    MBN_DATA_CLASS_CUSTOM = -2147483648_i32
  end
  enum MBN_CTRL_CAPS
    MBN_CTRL_CAPS_NONE = 0_i32
    MBN_CTRL_CAPS_REG_MANUAL = 1_i32
    MBN_CTRL_CAPS_HW_RADIO_SWITCH = 2_i32
    MBN_CTRL_CAPS_CDMA_MOBILE_IP = 4_i32
    MBN_CTRL_CAPS_CDMA_SIMPLE_IP = 8_i32
    MBN_CTRL_CAPS_PROTECT_UNIQUEID = 16_i32
    MBN_CTRL_CAPS_MODEL_MULTI_CARRIER = 32_i32
    MBN_CTRL_CAPS_USSD = 64_i32
    MBN_CTRL_CAPS_MULTI_MODE = 128_i32
  end
  enum MBN_SMS_CAPS
    MBN_SMS_CAPS_NONE = 0_i32
    MBN_SMS_CAPS_PDU_RECEIVE = 1_i32
    MBN_SMS_CAPS_PDU_SEND = 2_i32
    MBN_SMS_CAPS_TEXT_RECEIVE = 4_i32
    MBN_SMS_CAPS_TEXT_SEND = 8_i32
  end
  enum MBN_BAND_CLASS
    MBN_BAND_CLASS_NONE = 0_i32
    MBN_BAND_CLASS_0 = 1_i32
    MBN_BAND_CLASS_I = 2_i32
    MBN_BAND_CLASS_II = 4_i32
    MBN_BAND_CLASS_III = 8_i32
    MBN_BAND_CLASS_IV = 16_i32
    MBN_BAND_CLASS_V = 32_i32
    MBN_BAND_CLASS_VI = 64_i32
    MBN_BAND_CLASS_VII = 128_i32
    MBN_BAND_CLASS_VIII = 256_i32
    MBN_BAND_CLASS_IX = 512_i32
    MBN_BAND_CLASS_X = 1024_i32
    MBN_BAND_CLASS_XI = 2048_i32
    MBN_BAND_CLASS_XII = 4096_i32
    MBN_BAND_CLASS_XIII = 8192_i32
    MBN_BAND_CLASS_XIV = 16384_i32
    MBN_BAND_CLASS_XV = 32768_i32
    MBN_BAND_CLASS_XVI = 65536_i32
    MBN_BAND_CLASS_XVII = 131072_i32
    MBN_BAND_CLASS_CUSTOM = -2147483648_i32
  end
  enum MBN_READY_STATE
    MBN_READY_STATE_OFF = 0_i32
    MBN_READY_STATE_INITIALIZED = 1_i32
    MBN_READY_STATE_SIM_NOT_INSERTED = 2_i32
    MBN_READY_STATE_BAD_SIM = 3_i32
    MBN_READY_STATE_FAILURE = 4_i32
    MBN_READY_STATE_NOT_ACTIVATED = 5_i32
    MBN_READY_STATE_DEVICE_LOCKED = 6_i32
    MBN_READY_STATE_DEVICE_BLOCKED = 7_i32
    MBN_READY_STATE_NO_ESIM_PROFILE = 8_i32
  end
  enum MBN_ACTIVATION_STATE
    MBN_ACTIVATION_STATE_NONE = 0_i32
    MBN_ACTIVATION_STATE_ACTIVATED = 1_i32
    MBN_ACTIVATION_STATE_ACTIVATING = 2_i32
    MBN_ACTIVATION_STATE_DEACTIVATED = 3_i32
    MBN_ACTIVATION_STATE_DEACTIVATING = 4_i32
  end
  enum MBN_CONNECTION_MODE
    MBN_CONNECTION_MODE_PROFILE = 0_i32
    MBN_CONNECTION_MODE_TMP_PROFILE = 1_i32
  end
  enum MBN_VOICE_CALL_STATE
    MBN_VOICE_CALL_STATE_NONE = 0_i32
    MBN_VOICE_CALL_STATE_IN_PROGRESS = 1_i32
    MBN_VOICE_CALL_STATE_HANGUP = 2_i32
  end
  enum MBN_REGISTRATION_CONSTANTS
    MBN_ROAMTEXT_LEN = 64_i32
    MBN_CDMA_DEFAULT_PROVIDER_ID = 0_i32
  end
  enum MBN_REGISTER_STATE
    MBN_REGISTER_STATE_NONE = 0_i32
    MBN_REGISTER_STATE_DEREGISTERED = 1_i32
    MBN_REGISTER_STATE_SEARCHING = 2_i32
    MBN_REGISTER_STATE_HOME = 3_i32
    MBN_REGISTER_STATE_ROAMING = 4_i32
    MBN_REGISTER_STATE_PARTNER = 5_i32
    MBN_REGISTER_STATE_DENIED = 6_i32
  end
  enum MBN_REGISTER_MODE
    MBN_REGISTER_MODE_NONE = 0_i32
    MBN_REGISTER_MODE_AUTOMATIC = 1_i32
    MBN_REGISTER_MODE_MANUAL = 2_i32
  end
  enum MBN_PIN_CONSTANTS
    MBN_ATTEMPTS_REMAINING_UNKNOWN = -1_i32
    MBN_PIN_LENGTH_UNKNOWN = -1_i32
  end
  enum MBN_PIN_STATE
    MBN_PIN_STATE_NONE = 0_i32
    MBN_PIN_STATE_ENTER = 1_i32
    MBN_PIN_STATE_UNBLOCK = 2_i32
  end
  enum MBN_PIN_TYPE
    MBN_PIN_TYPE_NONE = 0_i32
    MBN_PIN_TYPE_CUSTOM = 1_i32
    MBN_PIN_TYPE_PIN1 = 2_i32
    MBN_PIN_TYPE_PIN2 = 3_i32
    MBN_PIN_TYPE_DEVICE_SIM_PIN = 4_i32
    MBN_PIN_TYPE_DEVICE_FIRST_SIM_PIN = 5_i32
    MBN_PIN_TYPE_NETWORK_PIN = 6_i32
    MBN_PIN_TYPE_NETWORK_SUBSET_PIN = 7_i32
    MBN_PIN_TYPE_SVC_PROVIDER_PIN = 8_i32
    MBN_PIN_TYPE_CORPORATE_PIN = 9_i32
    MBN_PIN_TYPE_SUBSIDY_LOCK = 10_i32
  end
  enum MBN_PIN_MODE
    MBN_PIN_MODE_ENABLED = 1_i32
    MBN_PIN_MODE_DISABLED = 2_i32
  end
  enum MBN_PIN_FORMAT
    MBN_PIN_FORMAT_NONE = 0_i32
    MBN_PIN_FORMAT_NUMERIC = 1_i32
    MBN_PIN_FORMAT_ALPHANUMERIC = 2_i32
  end
  enum MBN_CONTEXT_CONSTANTS
    MBN_ACCESSSTRING_LEN = 100_i32
    MBN_USERNAME_LEN = 255_i32
    MBN_PASSWORD_LEN = 255_i32
    MBN_CONTEXT_ID_APPEND = -1_i32
  end
  enum MBN_AUTH_PROTOCOL
    MBN_AUTH_PROTOCOL_NONE = 0_i32
    MBN_AUTH_PROTOCOL_PAP = 1_i32
    MBN_AUTH_PROTOCOL_CHAP = 2_i32
    MBN_AUTH_PROTOCOL_MSCHAPV2 = 3_i32
  end
  enum MBN_COMPRESSION
    MBN_COMPRESSION_NONE = 0_i32
    MBN_COMPRESSION_ENABLE = 1_i32
  end
  enum MBN_CONTEXT_TYPE
    MBN_CONTEXT_TYPE_NONE = 0_i32
    MBN_CONTEXT_TYPE_INTERNET = 1_i32
    MBN_CONTEXT_TYPE_VPN = 2_i32
    MBN_CONTEXT_TYPE_VOICE = 3_i32
    MBN_CONTEXT_TYPE_VIDEO_SHARE = 4_i32
    MBN_CONTEXT_TYPE_CUSTOM = 5_i32
    MBN_CONTEXT_TYPE_PURCHASE = 6_i32
  end
  enum WWAEXT_SMS_CONSTANTS
    MBN_MESSAGE_INDEX_NONE = 0_i32
    MBN_CDMA_SHORT_MSG_SIZE_UNKNOWN = 0_i32
    MBN_CDMA_SHORT_MSG_SIZE_MAX = 160_i32
  end
  enum MBN_MSG_STATUS
    MBN_MSG_STATUS_NEW = 0_i32
    MBN_MSG_STATUS_OLD = 1_i32
    MBN_MSG_STATUS_DRAFT = 2_i32
    MBN_MSG_STATUS_SENT = 3_i32
  end
  enum MBN_SMS_CDMA_LANG
    MBN_SMS_CDMA_LANG_NONE = 0_i32
    MBN_SMS_CDMA_LANG_ENGLISH = 1_i32
    MBN_SMS_CDMA_LANG_FRENCH = 2_i32
    MBN_SMS_CDMA_LANG_SPANISH = 3_i32
    MBN_SMS_CDMA_LANG_JAPANESE = 4_i32
    MBN_SMS_CDMA_LANG_KOREAN = 5_i32
    MBN_SMS_CDMA_LANG_CHINESE = 6_i32
    MBN_SMS_CDMA_LANG_HEBREW = 7_i32
  end
  enum MBN_SMS_CDMA_ENCODING
    MBN_SMS_CDMA_ENCODING_OCTET = 0_i32
    MBN_SMS_CDMA_ENCODING_EPM = 1_i32
    MBN_SMS_CDMA_ENCODING_7BIT_ASCII = 2_i32
    MBN_SMS_CDMA_ENCODING_IA5 = 3_i32
    MBN_SMS_CDMA_ENCODING_UNICODE = 4_i32
    MBN_SMS_CDMA_ENCODING_SHIFT_JIS = 5_i32
    MBN_SMS_CDMA_ENCODING_KOREAN = 6_i32
    MBN_SMS_CDMA_ENCODING_LATIN_HEBREW = 7_i32
    MBN_SMS_CDMA_ENCODING_LATIN = 8_i32
    MBN_SMS_CDMA_ENCODING_GSM_7BIT = 9_i32
  end
  enum MBN_SMS_FLAG
    MBN_SMS_FLAG_ALL = 0_i32
    MBN_SMS_FLAG_INDEX = 1_i32
    MBN_SMS_FLAG_NEW = 2_i32
    MBN_SMS_FLAG_OLD = 3_i32
    MBN_SMS_FLAG_SENT = 4_i32
    MBN_SMS_FLAG_DRAFT = 5_i32
  end
  enum MBN_SMS_STATUS_FLAG
    MBN_SMS_FLAG_NONE = 0_i32
    MBN_SMS_FLAG_MESSAGE_STORE_FULL = 1_i32
    MBN_SMS_FLAG_NEW_MESSAGE = 2_i32
  end
  enum MBN_SMS_FORMAT
    MBN_SMS_FORMAT_NONE = 0_i32
    MBN_SMS_FORMAT_PDU = 1_i32
    MBN_SMS_FORMAT_TEXT = 2_i32
  end
  enum MBN_RADIO
    MBN_RADIO_OFF = 0_i32
    MBN_RADIO_ON = 1_i32
  end
  enum MBN_DEVICE_SERVICE_SESSIONS_STATE
    MBN_DEVICE_SERVICE_SESSIONS_RESTORED = 0_i32
  end
  enum MBN_DEVICE_SERVICES_INTERFACE_STATE
    MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_ARRIVAL = 0_i32
    MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_REMOVAL = 1_i32
  end

  @[Extern]
  record MBN_INTERFACE_CAPS,
    cellularClass : Win32cr::NetworkManagement::MobileBroadband::MBN_CELLULAR_CLASS,
    voiceClass : Win32cr::NetworkManagement::MobileBroadband::MBN_VOICE_CLASS,
    dataClass : UInt32,
    customDataClass : Win32cr::Foundation::BSTR,
    gsmBandClass : UInt32,
    cdmaBandClass : UInt32,
    customBandClass : Win32cr::Foundation::BSTR,
    smsCaps : UInt32,
    controlCaps : UInt32,
    deviceID : Win32cr::Foundation::BSTR,
    manufacturer : Win32cr::Foundation::BSTR,
    model : Win32cr::Foundation::BSTR,
    firmwareInfo : Win32cr::Foundation::BSTR

  @[Extern]
  record MBN_PROVIDER,
    providerID : Win32cr::Foundation::BSTR,
    providerState : UInt32,
    providerName : Win32cr::Foundation::BSTR,
    dataClass : UInt32

  @[Extern]
  record MBN_PROVIDER2,
    provider : Win32cr::NetworkManagement::MobileBroadband::MBN_PROVIDER,
    cellularClass : Win32cr::NetworkManagement::MobileBroadband::MBN_CELLULAR_CLASS,
    signalStrength : UInt32,
    signalError : UInt32

  @[Extern]
  record MBN_PIN_INFO,
    pinState : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_STATE,
    pinType : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_TYPE,
    attemptsRemaining : UInt32

  @[Extern]
  record MBN_CONTEXT,
    contextID : UInt32,
    contextType : Win32cr::NetworkManagement::MobileBroadband::MBN_CONTEXT_TYPE,
    accessString : Win32cr::Foundation::BSTR,
    userName : Win32cr::Foundation::BSTR,
    password : Win32cr::Foundation::BSTR,
    compression : Win32cr::NetworkManagement::MobileBroadband::MBN_COMPRESSION,
    authType : Win32cr::NetworkManagement::MobileBroadband::MBN_AUTH_PROTOCOL

  @[Extern]
  record MBN_SMS_FILTER,
    flag : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FLAG,
    messageIndex : UInt32

  @[Extern]
  record MBN_SMS_STATUS_INFO,
    flag : UInt32,
    messageIndex : UInt32

  @[Extern]
  record MBN_DEVICE_SERVICE,
    deviceServiceID : Win32cr::Foundation::BSTR,
    dataWriteSupported : Int16,
    dataReadSupported : Int16

  @[Extern]
  record Mbnapi_referenceremainingtypes__,
    bandClass : Win32cr::NetworkManagement::MobileBroadband::MBN_BAND_CLASS,
    contextConstants : Win32cr::NetworkManagement::MobileBroadband::MBN_CONTEXT_CONSTANTS,
    ctrlCaps : Win32cr::NetworkManagement::MobileBroadband::MBN_CTRL_CAPS,
    dataClass : Win32cr::NetworkManagement::MobileBroadband::MBN_DATA_CLASS,
    interfaceCapsConstants : Win32cr::NetworkManagement::MobileBroadband::MBN_INTERFACE_CAPS_CONSTANTS,
    pinConstants : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_CONSTANTS,
    providerConstants : Win32cr::NetworkManagement::MobileBroadband::MBN_PROVIDER_CONSTANTS,
    providerState : Win32cr::NetworkManagement::MobileBroadband::MBN_PROVIDER_STATE,
    registrationConstants : Win32cr::NetworkManagement::MobileBroadband::MBN_REGISTRATION_CONSTANTS,
    signalConstants : Win32cr::NetworkManagement::MobileBroadband::MBN_SIGNAL_CONSTANTS,
    smsCaps : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CAPS,
    smsConstants : Win32cr::NetworkManagement::MobileBroadband::WWAEXT_SMS_CONSTANTS,
    wwaextSmsConstants : Win32cr::NetworkManagement::MobileBroadband::WWAEXT_SMS_CONSTANTS,
    smsStatusFlag : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_STATUS_FLAG

  @[Extern]
  record DummyPinType__,
    pinType : UInt32

  @[Extern]
  record IDummyMBNUCMExtVtbl,
    query_interface : Proc(IDummyMBNUCMExt*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDummyMBNUCMExt*, UInt32),
    release : Proc(IDummyMBNUCMExt*, UInt32),
    get_type_info_count : Proc(IDummyMBNUCMExt*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDummyMBNUCMExt*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDummyMBNUCMExt*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDummyMBNUCMExt*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-ffff-4bbb-aaee-338e368af6fa")]
  record IDummyMBNUCMExt, lpVtbl : IDummyMBNUCMExtVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0xffff_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IDummyMBNUCMExt*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDummyMBNUCMExt*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDummyMBNUCMExt*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDummyMBNUCMExt*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDummyMBNUCMExt*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDummyMBNUCMExt*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDummyMBNUCMExt*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IMbnConnectionVtbl,
    query_interface : Proc(IMbnConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnection*, UInt32),
    release : Proc(IMbnConnection*, UInt32),
    get_ConnectionID : Proc(IMbnConnection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_InterfaceID : Proc(IMbnConnection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    connect : Proc(IMbnConnection*, Win32cr::NetworkManagement::MobileBroadband::MBN_CONNECTION_MODE, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IMbnConnection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_connection_state : Proc(IMbnConnection*, Win32cr::NetworkManagement::MobileBroadband::MBN_ACTIVATION_STATE*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_voice_call_state : Proc(IMbnConnection*, Win32cr::NetworkManagement::MobileBroadband::MBN_VOICE_CALL_STATE*, Win32cr::Foundation::HRESULT),
    get_activation_network_error : Proc(IMbnConnection*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-200d-4bbb-aaee-338e368af6fa")]
  record IMbnConnection, lpVtbl : IMbnConnectionVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x200d_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ConnectionID(this : IMbnConnection*, connection_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionID.call(this, connection_id)
    end
    def get_InterfaceID(this : IMbnConnection*, interface_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InterfaceID.call(this, interface_id)
    end
    def connect(this : IMbnConnection*, connectionMode : Win32cr::NetworkManagement::MobileBroadband::MBN_CONNECTION_MODE, strProfile : Win32cr::Foundation::PWSTR, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, connectionMode, strProfile, requestID)
    end
    def disconnect(this : IMbnConnection*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this, requestID)
    end
    def get_connection_state(this : IMbnConnection*, connection_state : Win32cr::NetworkManagement::MobileBroadband::MBN_ACTIVATION_STATE*, profile_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_state.call(this, connection_state, profile_name)
    end
    def get_voice_call_state(this : IMbnConnection*, voiceCallState : Win32cr::NetworkManagement::MobileBroadband::MBN_VOICE_CALL_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_voice_call_state.call(this, voiceCallState)
    end
    def get_activation_network_error(this : IMbnConnection*, networkError : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activation_network_error.call(this, networkError)
    end

  end

  @[Extern]
  record IMbnConnectionEventsVtbl,
    query_interface : Proc(IMbnConnectionEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionEvents*, UInt32),
    release : Proc(IMbnConnectionEvents*, UInt32),
    on_connect_complete : Proc(IMbnConnectionEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_disconnect_complete : Proc(IMbnConnectionEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_connect_state_change : Proc(IMbnConnectionEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_voice_call_state_change : Proc(IMbnConnectionEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-200e-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionEvents, lpVtbl : IMbnConnectionEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x200e_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_connect_complete(this : IMbnConnectionEvents*, newConnection : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connect_complete.call(this, newConnection, requestID, status)
    end
    def on_disconnect_complete(this : IMbnConnectionEvents*, newConnection : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_disconnect_complete.call(this, newConnection, requestID, status)
    end
    def on_connect_state_change(this : IMbnConnectionEvents*, newConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connect_state_change.call(this, newConnection)
    end
    def on_voice_call_state_change(this : IMbnConnectionEvents*, newConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_voice_call_state_change.call(this, newConnection)
    end

  end

  @[Extern]
  record IMbnInterfaceVtbl,
    query_interface : Proc(IMbnInterface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnInterface*, UInt32),
    release : Proc(IMbnInterface*, UInt32),
    get_InterfaceID : Proc(IMbnInterface*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_interface_capability : Proc(IMbnInterface*, Win32cr::NetworkManagement::MobileBroadband::MBN_INTERFACE_CAPS*, Win32cr::Foundation::HRESULT),
    get_subscriber_information : Proc(IMbnInterface*, Void**, Win32cr::Foundation::HRESULT),
    get_ready_state : Proc(IMbnInterface*, Win32cr::NetworkManagement::MobileBroadband::MBN_READY_STATE*, Win32cr::Foundation::HRESULT),
    in_emergency_mode : Proc(IMbnInterface*, Int16*, Win32cr::Foundation::HRESULT),
    get_home_provider : Proc(IMbnInterface*, Win32cr::NetworkManagement::MobileBroadband::MBN_PROVIDER*, Win32cr::Foundation::HRESULT),
    get_preferred_providers : Proc(IMbnInterface*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    set_preferred_providers : Proc(IMbnInterface*, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT),
    get_visible_providers : Proc(IMbnInterface*, UInt32*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    scan_network : Proc(IMbnInterface*, UInt32*, Win32cr::Foundation::HRESULT),
    get_connection : Proc(IMbnInterface*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2001-4bbb-aaee-338e368af6fa")]
  record IMbnInterface, lpVtbl : IMbnInterfaceVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2001_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnInterface*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnInterface*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnInterface*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_InterfaceID(this : IMbnInterface*, interface_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InterfaceID.call(this, interface_id)
    end
    def get_interface_capability(this : IMbnInterface*, interfaceCaps : Win32cr::NetworkManagement::MobileBroadband::MBN_INTERFACE_CAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface_capability.call(this, interfaceCaps)
    end
    def get_subscriber_information(this : IMbnInterface*, subscriberInformation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subscriber_information.call(this, subscriberInformation)
    end
    def get_ready_state(this : IMbnInterface*, readyState : Win32cr::NetworkManagement::MobileBroadband::MBN_READY_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ready_state.call(this, readyState)
    end
    def in_emergency_mode(this : IMbnInterface*, emergencyMode : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_emergency_mode.call(this, emergencyMode)
    end
    def get_home_provider(this : IMbnInterface*, homeProvider : Win32cr::NetworkManagement::MobileBroadband::MBN_PROVIDER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_home_provider.call(this, homeProvider)
    end
    def get_preferred_providers(this : IMbnInterface*, preferredProviders : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_providers.call(this, preferredProviders)
    end
    def set_preferred_providers(this : IMbnInterface*, preferredProviders : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preferred_providers.call(this, preferredProviders, requestID)
    end
    def get_visible_providers(this : IMbnInterface*, age : UInt32*, visibleProviders : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_providers.call(this, age, visibleProviders)
    end
    def scan_network(this : IMbnInterface*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scan_network.call(this, requestID)
    end
    def get_connection(this : IMbnInterface*, mbnConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection.call(this, mbnConnection)
    end

  end

  @[Extern]
  record IMbnInterfaceEventsVtbl,
    query_interface : Proc(IMbnInterfaceEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnInterfaceEvents*, UInt32),
    release : Proc(IMbnInterfaceEvents*, UInt32),
    on_interface_capability_available : Proc(IMbnInterfaceEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_subscriber_information_change : Proc(IMbnInterfaceEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_ready_state_change : Proc(IMbnInterfaceEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_emergency_mode_change : Proc(IMbnInterfaceEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_home_provider_available : Proc(IMbnInterfaceEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_preferred_providers_change : Proc(IMbnInterfaceEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_set_preferred_providers_complete : Proc(IMbnInterfaceEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_scan_network_complete : Proc(IMbnInterfaceEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2002-4bbb-aaee-338e368af6fa")]
  record IMbnInterfaceEvents, lpVtbl : IMbnInterfaceEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2002_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnInterfaceEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnInterfaceEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnInterfaceEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_interface_capability_available(this : IMbnInterfaceEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_interface_capability_available.call(this, newInterface)
    end
    def on_subscriber_information_change(this : IMbnInterfaceEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_subscriber_information_change.call(this, newInterface)
    end
    def on_ready_state_change(this : IMbnInterfaceEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ready_state_change.call(this, newInterface)
    end
    def on_emergency_mode_change(this : IMbnInterfaceEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_emergency_mode_change.call(this, newInterface)
    end
    def on_home_provider_available(this : IMbnInterfaceEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_home_provider_available.call(this, newInterface)
    end
    def on_preferred_providers_change(this : IMbnInterfaceEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_preferred_providers_change.call(this, newInterface)
    end
    def on_set_preferred_providers_complete(this : IMbnInterfaceEvents*, newInterface : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_preferred_providers_complete.call(this, newInterface, requestID, status)
    end
    def on_scan_network_complete(this : IMbnInterfaceEvents*, newInterface : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_scan_network_complete.call(this, newInterface, requestID, status)
    end

  end

  @[Extern]
  record IMbnInterfaceManagerVtbl,
    query_interface : Proc(IMbnInterfaceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnInterfaceManager*, UInt32),
    release : Proc(IMbnInterfaceManager*, UInt32),
    get_interface : Proc(IMbnInterfaceManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_interfaces : Proc(IMbnInterfaceManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-201b-4bbb-aaee-338e368af6fa")]
  record IMbnInterfaceManager, lpVtbl : IMbnInterfaceManagerVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x201b_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnInterfaceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnInterfaceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnInterfaceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_interface(this : IMbnInterfaceManager*, interfaceID : Win32cr::Foundation::PWSTR, mbnInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface.call(this, interfaceID, mbnInterface)
    end
    def get_interfaces(this : IMbnInterfaceManager*, mbnInterfaces : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interfaces.call(this, mbnInterfaces)
    end

  end

  @[Extern]
  record IMbnInterfaceManagerEventsVtbl,
    query_interface : Proc(IMbnInterfaceManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnInterfaceManagerEvents*, UInt32),
    release : Proc(IMbnInterfaceManagerEvents*, UInt32),
    on_interface_arrival : Proc(IMbnInterfaceManagerEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_interface_removal : Proc(IMbnInterfaceManagerEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-201c-4bbb-aaee-338e368af6fa")]
  record IMbnInterfaceManagerEvents, lpVtbl : IMbnInterfaceManagerEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x201c_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnInterfaceManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnInterfaceManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnInterfaceManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_interface_arrival(this : IMbnInterfaceManagerEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_interface_arrival.call(this, newInterface)
    end
    def on_interface_removal(this : IMbnInterfaceManagerEvents*, oldInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_interface_removal.call(this, oldInterface)
    end

  end

  @[Extern]
  record IMbnRegistrationVtbl,
    query_interface : Proc(IMbnRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnRegistration*, UInt32),
    release : Proc(IMbnRegistration*, UInt32),
    get_register_state : Proc(IMbnRegistration*, Win32cr::NetworkManagement::MobileBroadband::MBN_REGISTER_STATE*, Win32cr::Foundation::HRESULT),
    get_register_mode : Proc(IMbnRegistration*, Win32cr::NetworkManagement::MobileBroadband::MBN_REGISTER_MODE*, Win32cr::Foundation::HRESULT),
    get_provider_id : Proc(IMbnRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_provider_name : Proc(IMbnRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_roaming_text : Proc(IMbnRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_available_data_classes : Proc(IMbnRegistration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_data_class : Proc(IMbnRegistration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_registration_network_error : Proc(IMbnRegistration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_packet_attach_network_error : Proc(IMbnRegistration*, UInt32*, Win32cr::Foundation::HRESULT),
    set_register_mode : Proc(IMbnRegistration*, Win32cr::NetworkManagement::MobileBroadband::MBN_REGISTER_MODE, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2009-4bbb-aaee-338e368af6fa")]
  record IMbnRegistration, lpVtbl : IMbnRegistrationVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2009_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnRegistration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnRegistration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnRegistration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_register_state(this : IMbnRegistration*, registerState : Win32cr::NetworkManagement::MobileBroadband::MBN_REGISTER_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_state.call(this, registerState)
    end
    def get_register_mode(this : IMbnRegistration*, registerMode : Win32cr::NetworkManagement::MobileBroadband::MBN_REGISTER_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_mode.call(this, registerMode)
    end
    def get_provider_id(this : IMbnRegistration*, providerID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_id.call(this, providerID)
    end
    def get_provider_name(this : IMbnRegistration*, providerName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_name.call(this, providerName)
    end
    def get_roaming_text(this : IMbnRegistration*, roamingText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_roaming_text.call(this, roamingText)
    end
    def get_available_data_classes(this : IMbnRegistration*, availableDataClasses : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_available_data_classes.call(this, availableDataClasses)
    end
    def get_current_data_class(this : IMbnRegistration*, currentDataClass : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_data_class.call(this, currentDataClass)
    end
    def get_registration_network_error(this : IMbnRegistration*, registrationNetworkError : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registration_network_error.call(this, registrationNetworkError)
    end
    def get_packet_attach_network_error(this : IMbnRegistration*, packetAttachNetworkError : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_packet_attach_network_error.call(this, packetAttachNetworkError)
    end
    def set_register_mode(this : IMbnRegistration*, registerMode : Win32cr::NetworkManagement::MobileBroadband::MBN_REGISTER_MODE, providerID : Win32cr::Foundation::PWSTR, dataClass : UInt32, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_register_mode.call(this, registerMode, providerID, dataClass, requestID)
    end

  end

  @[Extern]
  record IMbnRegistrationEventsVtbl,
    query_interface : Proc(IMbnRegistrationEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnRegistrationEvents*, UInt32),
    release : Proc(IMbnRegistrationEvents*, UInt32),
    on_register_mode_available : Proc(IMbnRegistrationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_register_state_change : Proc(IMbnRegistrationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_packet_service_state_change : Proc(IMbnRegistrationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_set_register_mode_complete : Proc(IMbnRegistrationEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-200a-4bbb-aaee-338e368af6fa")]
  record IMbnRegistrationEvents, lpVtbl : IMbnRegistrationEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x200a_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnRegistrationEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnRegistrationEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnRegistrationEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_register_mode_available(this : IMbnRegistrationEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_register_mode_available.call(this, newInterface)
    end
    def on_register_state_change(this : IMbnRegistrationEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_register_state_change.call(this, newInterface)
    end
    def on_packet_service_state_change(this : IMbnRegistrationEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_packet_service_state_change.call(this, newInterface)
    end
    def on_set_register_mode_complete(this : IMbnRegistrationEvents*, newInterface : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_register_mode_complete.call(this, newInterface, requestID, status)
    end

  end

  @[Extern]
  record IMbnConnectionManagerVtbl,
    query_interface : Proc(IMbnConnectionManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionManager*, UInt32),
    release : Proc(IMbnConnectionManager*, UInt32),
    get_connection : Proc(IMbnConnectionManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_connections : Proc(IMbnConnectionManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-201d-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionManager, lpVtbl : IMbnConnectionManagerVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x201d_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_connection(this : IMbnConnectionManager*, connectionID : Win32cr::Foundation::PWSTR, mbnConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection.call(this, connectionID, mbnConnection)
    end
    def get_connections(this : IMbnConnectionManager*, mbnConnections : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connections.call(this, mbnConnections)
    end

  end

  @[Extern]
  record IMbnConnectionManagerEventsVtbl,
    query_interface : Proc(IMbnConnectionManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionManagerEvents*, UInt32),
    release : Proc(IMbnConnectionManagerEvents*, UInt32),
    on_connection_arrival : Proc(IMbnConnectionManagerEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_connection_removal : Proc(IMbnConnectionManagerEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-201e-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionManagerEvents, lpVtbl : IMbnConnectionManagerEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x201e_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_connection_arrival(this : IMbnConnectionManagerEvents*, newConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connection_arrival.call(this, newConnection)
    end
    def on_connection_removal(this : IMbnConnectionManagerEvents*, oldConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connection_removal.call(this, oldConnection)
    end

  end

  @[Extern]
  record IMbnPinManagerVtbl,
    query_interface : Proc(IMbnPinManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnPinManager*, UInt32),
    release : Proc(IMbnPinManager*, UInt32),
    get_pin_list : Proc(IMbnPinManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_pin : Proc(IMbnPinManager*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_TYPE, Void**, Win32cr::Foundation::HRESULT),
    get_pin_state : Proc(IMbnPinManager*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2005-4bbb-aaee-338e368af6fa")]
  record IMbnPinManager, lpVtbl : IMbnPinManagerVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2005_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnPinManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnPinManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnPinManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_pin_list(this : IMbnPinManager*, pinList : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pin_list.call(this, pinList)
    end
    def get_pin(this : IMbnPinManager*, pinType : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_TYPE, pin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pin.call(this, pinType, pin)
    end
    def get_pin_state(this : IMbnPinManager*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pin_state.call(this, requestID)
    end

  end

  @[Extern]
  record IMbnPinManagerEventsVtbl,
    query_interface : Proc(IMbnPinManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnPinManagerEvents*, UInt32),
    release : Proc(IMbnPinManagerEvents*, UInt32),
    on_pin_list_available : Proc(IMbnPinManagerEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_get_pin_state_complete : Proc(IMbnPinManagerEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2006-4bbb-aaee-338e368af6fa")]
  record IMbnPinManagerEvents, lpVtbl : IMbnPinManagerEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2006_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnPinManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnPinManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnPinManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_pin_list_available(this : IMbnPinManagerEvents*, pinManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_pin_list_available.call(this, pinManager)
    end
    def on_get_pin_state_complete(this : IMbnPinManagerEvents*, pinManager : Void*, pinInfo : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_get_pin_state_complete.call(this, pinManager, pinInfo, requestID, status)
    end

  end

  @[Extern]
  record IMbnPinEventsVtbl,
    query_interface : Proc(IMbnPinEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnPinEvents*, UInt32),
    release : Proc(IMbnPinEvents*, UInt32),
    on_enable_complete : Proc(IMbnPinEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_disable_complete : Proc(IMbnPinEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_enter_complete : Proc(IMbnPinEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_change_complete : Proc(IMbnPinEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_unblock_complete : Proc(IMbnPinEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2008-4bbb-aaee-338e368af6fa")]
  record IMbnPinEvents, lpVtbl : IMbnPinEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2008_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnPinEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnPinEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnPinEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_enable_complete(this : IMbnPinEvents*, pin : Void*, pinInfo : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_enable_complete.call(this, pin, pinInfo, requestID, status)
    end
    def on_disable_complete(this : IMbnPinEvents*, pin : Void*, pinInfo : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_disable_complete.call(this, pin, pinInfo, requestID, status)
    end
    def on_enter_complete(this : IMbnPinEvents*, pin : Void*, pinInfo : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_enter_complete.call(this, pin, pinInfo, requestID, status)
    end
    def on_change_complete(this : IMbnPinEvents*, pin : Void*, pinInfo : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_change_complete.call(this, pin, pinInfo, requestID, status)
    end
    def on_unblock_complete(this : IMbnPinEvents*, pin : Void*, pinInfo : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_INFO*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_unblock_complete.call(this, pin, pinInfo, requestID, status)
    end

  end

  @[Extern]
  record IMbnSubscriberInformationVtbl,
    query_interface : Proc(IMbnSubscriberInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSubscriberInformation*, UInt32),
    release : Proc(IMbnSubscriberInformation*, UInt32),
    get_SubscriberID : Proc(IMbnSubscriberInformation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SimIccID : Proc(IMbnSubscriberInformation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TelephoneNumbers : Proc(IMbnSubscriberInformation*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("459ecc43-bcf5-11dc-a8a8-001321f1405f")]
  record IMbnSubscriberInformation, lpVtbl : IMbnSubscriberInformationVtbl* do
    GUID = LibC::GUID.new(0x459ecc43_u32, 0xbcf5_u16, 0x11dc_u16, StaticArray[0xa8_u8, 0xa8_u8, 0x0_u8, 0x13_u8, 0x21_u8, 0xf1_u8, 0x40_u8, 0x5f_u8])
    def query_interface(this : IMbnSubscriberInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSubscriberInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSubscriberInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_SubscriberID(this : IMbnSubscriberInformation*, subscriber_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubscriberID.call(this, subscriber_id)
    end
    def get_SimIccID(this : IMbnSubscriberInformation*, sim_icc_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SimIccID.call(this, sim_icc_id)
    end
    def get_TelephoneNumbers(this : IMbnSubscriberInformation*, telephone_numbers : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TelephoneNumbers.call(this, telephone_numbers)
    end

  end

  @[Extern]
  record IMbnSignalVtbl,
    query_interface : Proc(IMbnSignal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSignal*, UInt32),
    release : Proc(IMbnSignal*, UInt32),
    get_signal_strength : Proc(IMbnSignal*, UInt32*, Win32cr::Foundation::HRESULT),
    get_signal_error : Proc(IMbnSignal*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2003-4bbb-aaee-338e368af6fa")]
  record IMbnSignal, lpVtbl : IMbnSignalVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2003_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnSignal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSignal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSignal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_signal_strength(this : IMbnSignal*, signalStrength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signal_strength.call(this, signalStrength)
    end
    def get_signal_error(this : IMbnSignal*, signalError : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signal_error.call(this, signalError)
    end

  end

  @[Extern]
  record IMbnSignalEventsVtbl,
    query_interface : Proc(IMbnSignalEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSignalEvents*, UInt32),
    release : Proc(IMbnSignalEvents*, UInt32),
    on_signal_state_change : Proc(IMbnSignalEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2004-4bbb-aaee-338e368af6fa")]
  record IMbnSignalEvents, lpVtbl : IMbnSignalEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2004_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnSignalEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSignalEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSignalEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_signal_state_change(this : IMbnSignalEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_signal_state_change.call(this, newInterface)
    end

  end

  @[Extern]
  record IMbnConnectionContextVtbl,
    query_interface : Proc(IMbnConnectionContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionContext*, UInt32),
    release : Proc(IMbnConnectionContext*, UInt32),
    get_provisioned_contexts : Proc(IMbnConnectionContext*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    set_provisioned_context : Proc(IMbnConnectionContext*, Win32cr::NetworkManagement::MobileBroadband::MBN_CONTEXT, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-200b-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionContext, lpVtbl : IMbnConnectionContextVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x200b_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_provisioned_contexts(this : IMbnConnectionContext*, provisionedContexts : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provisioned_contexts.call(this, provisionedContexts)
    end
    def set_provisioned_context(this : IMbnConnectionContext*, provisionedContexts : Win32cr::NetworkManagement::MobileBroadband::MBN_CONTEXT, providerID : Win32cr::Foundation::PWSTR, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_provisioned_context.call(this, provisionedContexts, providerID, requestID)
    end

  end

  @[Extern]
  record IMbnConnectionContextEventsVtbl,
    query_interface : Proc(IMbnConnectionContextEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionContextEvents*, UInt32),
    release : Proc(IMbnConnectionContextEvents*, UInt32),
    on_provisioned_context_list_change : Proc(IMbnConnectionContextEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_set_provisioned_context_complete : Proc(IMbnConnectionContextEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-200c-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionContextEvents, lpVtbl : IMbnConnectionContextEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x200c_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionContextEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionContextEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionContextEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_provisioned_context_list_change(this : IMbnConnectionContextEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_provisioned_context_list_change.call(this, newInterface)
    end
    def on_set_provisioned_context_complete(this : IMbnConnectionContextEvents*, newInterface : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_provisioned_context_complete.call(this, newInterface, requestID, status)
    end

  end

  @[Extern]
  record IMbnConnectionProfileManagerVtbl,
    query_interface : Proc(IMbnConnectionProfileManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionProfileManager*, UInt32),
    release : Proc(IMbnConnectionProfileManager*, UInt32),
    get_connection_profiles : Proc(IMbnConnectionProfileManager*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_connection_profile : Proc(IMbnConnectionProfileManager*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_connection_profile : Proc(IMbnConnectionProfileManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-200f-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionProfileManager, lpVtbl : IMbnConnectionProfileManagerVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x200f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionProfileManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionProfileManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionProfileManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_connection_profiles(this : IMbnConnectionProfileManager*, mbnInterface : Void*, connectionProfiles : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_profiles.call(this, mbnInterface, connectionProfiles)
    end
    def get_connection_profile(this : IMbnConnectionProfileManager*, mbnInterface : Void*, profileName : Win32cr::Foundation::PWSTR, connectionProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_profile.call(this, mbnInterface, profileName, connectionProfile)
    end
    def create_connection_profile(this : IMbnConnectionProfileManager*, xmlProfile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_connection_profile.call(this, xmlProfile)
    end

  end

  @[Extern]
  record IMbnConnectionProfileVtbl,
    query_interface : Proc(IMbnConnectionProfile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionProfile*, UInt32),
    release : Proc(IMbnConnectionProfile*, UInt32),
    get_profile_xml_data : Proc(IMbnConnectionProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    update_profile : Proc(IMbnConnectionProfile*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IMbnConnectionProfile*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2010-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionProfile, lpVtbl : IMbnConnectionProfileVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2010_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionProfile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionProfile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionProfile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_profile_xml_data(this : IMbnConnectionProfile*, profileData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile_xml_data.call(this, profileData)
    end
    def update_profile(this : IMbnConnectionProfile*, strProfile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_profile.call(this, strProfile)
    end
    def delete(this : IMbnConnectionProfile*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IMbnConnectionProfileEventsVtbl,
    query_interface : Proc(IMbnConnectionProfileEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionProfileEvents*, UInt32),
    release : Proc(IMbnConnectionProfileEvents*, UInt32),
    on_profile_update : Proc(IMbnConnectionProfileEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2011-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionProfileEvents, lpVtbl : IMbnConnectionProfileEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2011_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionProfileEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionProfileEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionProfileEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_profile_update(this : IMbnConnectionProfileEvents*, newProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_profile_update.call(this, newProfile)
    end

  end

  @[Extern]
  record IMbnSmsConfigurationVtbl,
    query_interface : Proc(IMbnSmsConfiguration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSmsConfiguration*, UInt32),
    release : Proc(IMbnSmsConfiguration*, UInt32),
    get_ServiceCenterAddress : Proc(IMbnSmsConfiguration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceCenterAddress : Proc(IMbnSmsConfiguration*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_MaxMessageIndex : Proc(IMbnSmsConfiguration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CdmaShortMsgSize : Proc(IMbnSmsConfiguration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SmsFormat : Proc(IMbnSmsConfiguration*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT*, Win32cr::Foundation::HRESULT),
    put_SmsFormat : Proc(IMbnSmsConfiguration*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2012-4bbb-aaee-338e368af6fa")]
  record IMbnSmsConfiguration, lpVtbl : IMbnSmsConfigurationVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2012_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnSmsConfiguration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSmsConfiguration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSmsConfiguration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ServiceCenterAddress(this : IMbnSmsConfiguration*, scAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceCenterAddress.call(this, scAddress)
    end
    def put_ServiceCenterAddress(this : IMbnSmsConfiguration*, scAddress : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceCenterAddress.call(this, scAddress)
    end
    def get_MaxMessageIndex(this : IMbnSmsConfiguration*, index : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxMessageIndex.call(this, index)
    end
    def get_CdmaShortMsgSize(this : IMbnSmsConfiguration*, shortMsgSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CdmaShortMsgSize.call(this, shortMsgSize)
    end
    def get_SmsFormat(this : IMbnSmsConfiguration*, smsFormat : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SmsFormat.call(this, smsFormat)
    end
    def put_SmsFormat(this : IMbnSmsConfiguration*, smsFormat : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SmsFormat.call(this, smsFormat)
    end

  end

  @[Extern]
  record IMbnSmsReadMsgPduVtbl,
    query_interface : Proc(IMbnSmsReadMsgPdu*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSmsReadMsgPdu*, UInt32),
    release : Proc(IMbnSmsReadMsgPdu*, UInt32),
    get_Index : Proc(IMbnSmsReadMsgPdu*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IMbnSmsReadMsgPdu*, Win32cr::NetworkManagement::MobileBroadband::MBN_MSG_STATUS*, Win32cr::Foundation::HRESULT),
    get_PduData : Proc(IMbnSmsReadMsgPdu*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IMbnSmsReadMsgPdu*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2013-4bbb-aaee-338e368af6fa")]
  record IMbnSmsReadMsgPdu, lpVtbl : IMbnSmsReadMsgPduVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2013_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnSmsReadMsgPdu*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSmsReadMsgPdu*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSmsReadMsgPdu*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Index(this : IMbnSmsReadMsgPdu*, index : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def get_Status(this : IMbnSmsReadMsgPdu*, status : Win32cr::NetworkManagement::MobileBroadband::MBN_MSG_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, status)
    end
    def get_PduData(this : IMbnSmsReadMsgPdu*, pdu_data : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PduData.call(this, pdu_data)
    end
    def get_Message(this : IMbnSmsReadMsgPdu*, message : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, message)
    end

  end

  @[Extern]
  record IMbnSmsReadMsgTextCdmaVtbl,
    query_interface : Proc(IMbnSmsReadMsgTextCdma*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSmsReadMsgTextCdma*, UInt32),
    release : Proc(IMbnSmsReadMsgTextCdma*, UInt32),
    get_Index : Proc(IMbnSmsReadMsgTextCdma*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IMbnSmsReadMsgTextCdma*, Win32cr::NetworkManagement::MobileBroadband::MBN_MSG_STATUS*, Win32cr::Foundation::HRESULT),
    get_Address : Proc(IMbnSmsReadMsgTextCdma*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Timestamp : Proc(IMbnSmsReadMsgTextCdma*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EncodingID : Proc(IMbnSmsReadMsgTextCdma*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_ENCODING*, Win32cr::Foundation::HRESULT),
    get_LanguageID : Proc(IMbnSmsReadMsgTextCdma*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_LANG*, Win32cr::Foundation::HRESULT),
    get_SizeInCharacters : Proc(IMbnSmsReadMsgTextCdma*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IMbnSmsReadMsgTextCdma*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2014-4bbb-aaee-338e368af6fa")]
  record IMbnSmsReadMsgTextCdma, lpVtbl : IMbnSmsReadMsgTextCdmaVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2014_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnSmsReadMsgTextCdma*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSmsReadMsgTextCdma*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSmsReadMsgTextCdma*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Index(this : IMbnSmsReadMsgTextCdma*, index : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def get_Status(this : IMbnSmsReadMsgTextCdma*, status : Win32cr::NetworkManagement::MobileBroadband::MBN_MSG_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, status)
    end
    def get_Address(this : IMbnSmsReadMsgTextCdma*, address : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Address.call(this, address)
    end
    def get_Timestamp(this : IMbnSmsReadMsgTextCdma*, timestamp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Timestamp.call(this, timestamp)
    end
    def get_EncodingID(this : IMbnSmsReadMsgTextCdma*, encoding_id : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_ENCODING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EncodingID.call(this, encoding_id)
    end
    def get_LanguageID(this : IMbnSmsReadMsgTextCdma*, language_id : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_LANG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LanguageID.call(this, language_id)
    end
    def get_SizeInCharacters(this : IMbnSmsReadMsgTextCdma*, size_in_characters : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeInCharacters.call(this, size_in_characters)
    end
    def get_Message(this : IMbnSmsReadMsgTextCdma*, message : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, message)
    end

  end

  @[Extern]
  record IMbnSmsVtbl,
    query_interface : Proc(IMbnSms*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSms*, UInt32),
    release : Proc(IMbnSms*, UInt32),
    get_sms_configuration : Proc(IMbnSms*, Void**, Win32cr::Foundation::HRESULT),
    set_sms_configuration : Proc(IMbnSms*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    sms_send_pdu : Proc(IMbnSms*, Win32cr::Foundation::PWSTR, UInt8, UInt32*, Win32cr::Foundation::HRESULT),
    sms_send_cdma : Proc(IMbnSms*, Win32cr::Foundation::PWSTR, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_ENCODING, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_LANG, UInt32, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT),
    sms_send_cdma_pdu : Proc(IMbnSms*, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT),
    sms_read : Proc(IMbnSms*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FILTER*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT, UInt32*, Win32cr::Foundation::HRESULT),
    sms_delete : Proc(IMbnSms*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FILTER*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sms_status : Proc(IMbnSms*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_STATUS_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2015-4bbb-aaee-338e368af6fa")]
  record IMbnSms, lpVtbl : IMbnSmsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2015_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnSms*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSms*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSms*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sms_configuration(this : IMbnSms*, smsConfiguration : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sms_configuration.call(this, smsConfiguration)
    end
    def set_sms_configuration(this : IMbnSms*, smsConfiguration : Void*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sms_configuration.call(this, smsConfiguration, requestID)
    end
    def sms_send_pdu(this : IMbnSms*, pduData : Win32cr::Foundation::PWSTR, size : UInt8, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sms_send_pdu.call(this, pduData, size, requestID)
    end
    def sms_send_cdma(this : IMbnSms*, address : Win32cr::Foundation::PWSTR, encoding : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_ENCODING, language : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_CDMA_LANG, sizeInCharacters : UInt32, message : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sms_send_cdma.call(this, address, encoding, language, sizeInCharacters, message, requestID)
    end
    def sms_send_cdma_pdu(this : IMbnSms*, message : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sms_send_cdma_pdu.call(this, message, requestID)
    end
    def sms_read(this : IMbnSms*, smsFilter : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FILTER*, smsFormat : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sms_read.call(this, smsFilter, smsFormat, requestID)
    end
    def sms_delete(this : IMbnSms*, smsFilter : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FILTER*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sms_delete.call(this, smsFilter, requestID)
    end
    def get_sms_status(this : IMbnSms*, smsStatusInfo : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_STATUS_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sms_status.call(this, smsStatusInfo)
    end

  end

  @[Extern]
  record IMbnSmsEventsVtbl,
    query_interface : Proc(IMbnSmsEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnSmsEvents*, UInt32),
    release : Proc(IMbnSmsEvents*, UInt32),
    on_sms_configuration_change : Proc(IMbnSmsEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_set_sms_configuration_complete : Proc(IMbnSmsEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_sms_send_complete : Proc(IMbnSmsEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_sms_read_complete : Proc(IMbnSmsEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT, Win32cr::System::Com::SAFEARRAY*, Int16, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_sms_new_class0_message : Proc(IMbnSmsEvents*, Void*, Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    on_sms_delete_complete : Proc(IMbnSmsEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_sms_status_change : Proc(IMbnSmsEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2016-4bbb-aaee-338e368af6fa")]
  record IMbnSmsEvents, lpVtbl : IMbnSmsEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2016_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnSmsEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnSmsEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnSmsEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_sms_configuration_change(this : IMbnSmsEvents*, sms : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sms_configuration_change.call(this, sms)
    end
    def on_set_sms_configuration_complete(this : IMbnSmsEvents*, sms : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_sms_configuration_complete.call(this, sms, requestID, status)
    end
    def on_sms_send_complete(this : IMbnSmsEvents*, sms : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sms_send_complete.call(this, sms, requestID, status)
    end
    def on_sms_read_complete(this : IMbnSmsEvents*, sms : Void*, smsFormat : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT, readMsgs : Win32cr::System::Com::SAFEARRAY*, moreMsgs : Int16, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sms_read_complete.call(this, sms, smsFormat, readMsgs, moreMsgs, requestID, status)
    end
    def on_sms_new_class0_message(this : IMbnSmsEvents*, sms : Void*, smsFormat : Win32cr::NetworkManagement::MobileBroadband::MBN_SMS_FORMAT, readMsgs : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sms_new_class0_message.call(this, sms, smsFormat, readMsgs)
    end
    def on_sms_delete_complete(this : IMbnSmsEvents*, sms : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sms_delete_complete.call(this, sms, requestID, status)
    end
    def on_sms_status_change(this : IMbnSmsEvents*, sms : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sms_status_change.call(this, sms)
    end

  end

  @[Extern]
  record IMbnServiceActivationVtbl,
    query_interface : Proc(IMbnServiceActivation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnServiceActivation*, UInt32),
    release : Proc(IMbnServiceActivation*, UInt32),
    activate : Proc(IMbnServiceActivation*, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2017-4bbb-aaee-338e368af6fa")]
  record IMbnServiceActivation, lpVtbl : IMbnServiceActivationVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2017_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnServiceActivation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnServiceActivation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnServiceActivation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : IMbnServiceActivation*, vendorSpecificData : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, vendorSpecificData, requestID)
    end

  end

  @[Extern]
  record IMbnServiceActivationEventsVtbl,
    query_interface : Proc(IMbnServiceActivationEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnServiceActivationEvents*, UInt32),
    release : Proc(IMbnServiceActivationEvents*, UInt32),
    on_activation_complete : Proc(IMbnServiceActivationEvents*, Void*, Win32cr::System::Com::SAFEARRAY*, UInt32, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2018-4bbb-aaee-338e368af6fa")]
  record IMbnServiceActivationEvents, lpVtbl : IMbnServiceActivationEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2018_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnServiceActivationEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnServiceActivationEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnServiceActivationEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_activation_complete(this : IMbnServiceActivationEvents*, serviceActivation : Void*, vendorSpecificData : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32, status : Win32cr::Foundation::HRESULT, networkError : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activation_complete.call(this, serviceActivation, vendorSpecificData, requestID, status, networkError)
    end

  end

  @[Extern]
  record IMbnVendorSpecificOperationVtbl,
    query_interface : Proc(IMbnVendorSpecificOperation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnVendorSpecificOperation*, UInt32),
    release : Proc(IMbnVendorSpecificOperation*, UInt32),
    set_vendor_specific : Proc(IMbnVendorSpecificOperation*, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2019-4bbb-aaee-338e368af6fa")]
  record IMbnVendorSpecificOperation, lpVtbl : IMbnVendorSpecificOperationVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2019_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnVendorSpecificOperation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnVendorSpecificOperation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnVendorSpecificOperation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_vendor_specific(this : IMbnVendorSpecificOperation*, vendorSpecificData : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_vendor_specific.call(this, vendorSpecificData, requestID)
    end

  end

  @[Extern]
  record IMbnVendorSpecificEventsVtbl,
    query_interface : Proc(IMbnVendorSpecificEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnVendorSpecificEvents*, UInt32),
    release : Proc(IMbnVendorSpecificEvents*, UInt32),
    on_event_notification : Proc(IMbnVendorSpecificEvents*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    on_set_vendor_specific_complete : Proc(IMbnVendorSpecificEvents*, Void*, Win32cr::System::Com::SAFEARRAY*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-201a-4bbb-aaee-338e368af6fa")]
  record IMbnVendorSpecificEvents, lpVtbl : IMbnVendorSpecificEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x201a_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnVendorSpecificEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnVendorSpecificEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnVendorSpecificEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_event_notification(this : IMbnVendorSpecificEvents*, vendorOperation : Void*, vendorSpecificData : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event_notification.call(this, vendorOperation, vendorSpecificData)
    end
    def on_set_vendor_specific_complete(this : IMbnVendorSpecificEvents*, vendorOperation : Void*, vendorSpecificData : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_vendor_specific_complete.call(this, vendorOperation, vendorSpecificData, requestID)
    end

  end

  @[Extern]
  record IMbnConnectionProfileManagerEventsVtbl,
    query_interface : Proc(IMbnConnectionProfileManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnConnectionProfileManagerEvents*, UInt32),
    release : Proc(IMbnConnectionProfileManagerEvents*, UInt32),
    on_connection_profile_arrival : Proc(IMbnConnectionProfileManagerEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_connection_profile_removal : Proc(IMbnConnectionProfileManagerEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-201f-4bbb-aaee-338e368af6fa")]
  record IMbnConnectionProfileManagerEvents, lpVtbl : IMbnConnectionProfileManagerEventsVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnConnectionProfileManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnConnectionProfileManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnConnectionProfileManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_connection_profile_arrival(this : IMbnConnectionProfileManagerEvents*, newConnectionProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connection_profile_arrival.call(this, newConnectionProfile)
    end
    def on_connection_profile_removal(this : IMbnConnectionProfileManagerEvents*, oldConnectionProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connection_profile_removal.call(this, oldConnectionProfile)
    end

  end

  @[Extern]
  record IMbnRadioVtbl,
    query_interface : Proc(IMbnRadio*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnRadio*, UInt32),
    release : Proc(IMbnRadio*, UInt32),
    get_SoftwareRadioState : Proc(IMbnRadio*, Win32cr::NetworkManagement::MobileBroadband::MBN_RADIO*, Win32cr::Foundation::HRESULT),
    get_HardwareRadioState : Proc(IMbnRadio*, Win32cr::NetworkManagement::MobileBroadband::MBN_RADIO*, Win32cr::Foundation::HRESULT),
    set_software_radio_state : Proc(IMbnRadio*, Win32cr::NetworkManagement::MobileBroadband::MBN_RADIO, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dccccab6-201f-4bbb-aaee-338e368af6fa")]
  record IMbnRadio, lpVtbl : IMbnRadioVtbl* do
    GUID = LibC::GUID.new(0xdccccab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnRadio*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnRadio*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnRadio*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_SoftwareRadioState(this : IMbnRadio*, software_radio_state : Win32cr::NetworkManagement::MobileBroadband::MBN_RADIO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SoftwareRadioState.call(this, software_radio_state)
    end
    def get_HardwareRadioState(this : IMbnRadio*, hardware_radio_state : Win32cr::NetworkManagement::MobileBroadband::MBN_RADIO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HardwareRadioState.call(this, hardware_radio_state)
    end
    def set_software_radio_state(this : IMbnRadio*, radioState : Win32cr::NetworkManagement::MobileBroadband::MBN_RADIO, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_software_radio_state.call(this, radioState, requestID)
    end

  end

  @[Extern]
  record IMbnRadioEventsVtbl,
    query_interface : Proc(IMbnRadioEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnRadioEvents*, UInt32),
    release : Proc(IMbnRadioEvents*, UInt32),
    on_radio_state_change : Proc(IMbnRadioEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_set_software_radio_state_complete : Proc(IMbnRadioEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcdddab6-201f-4bbb-aaee-338e368af6fa")]
  record IMbnRadioEvents, lpVtbl : IMbnRadioEventsVtbl* do
    GUID = LibC::GUID.new(0xdcdddab6_u32, 0x201f_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnRadioEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnRadioEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnRadioEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_radio_state_change(this : IMbnRadioEvents*, newInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_radio_state_change.call(this, newInterface)
    end
    def on_set_software_radio_state_complete(this : IMbnRadioEvents*, newInterface : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_software_radio_state_complete.call(this, newInterface, requestID, status)
    end

  end

  @[Extern]
  record IMbnMultiCarrierVtbl,
    query_interface : Proc(IMbnMultiCarrier*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnMultiCarrier*, UInt32),
    release : Proc(IMbnMultiCarrier*, UInt32),
    set_home_provider : Proc(IMbnMultiCarrier*, Win32cr::NetworkManagement::MobileBroadband::MBN_PROVIDER2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_preferred_providers : Proc(IMbnMultiCarrier*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_visible_providers : Proc(IMbnMultiCarrier*, UInt32*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_supported_cellular_classes : Proc(IMbnMultiCarrier*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_current_cellular_class : Proc(IMbnMultiCarrier*, Win32cr::NetworkManagement::MobileBroadband::MBN_CELLULAR_CLASS*, Win32cr::Foundation::HRESULT),
    scan_network : Proc(IMbnMultiCarrier*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2020-4bbb-aaee-338e368af6fa")]
  record IMbnMultiCarrier, lpVtbl : IMbnMultiCarrierVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2020_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnMultiCarrier*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnMultiCarrier*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnMultiCarrier*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_home_provider(this : IMbnMultiCarrier*, homeProvider : Win32cr::NetworkManagement::MobileBroadband::MBN_PROVIDER2*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_home_provider.call(this, homeProvider, requestID)
    end
    def get_preferred_providers(this : IMbnMultiCarrier*, preferredMulticarrierProviders : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_providers.call(this, preferredMulticarrierProviders)
    end
    def get_visible_providers(this : IMbnMultiCarrier*, age : UInt32*, visibleProviders : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_providers.call(this, age, visibleProviders)
    end
    def get_supported_cellular_classes(this : IMbnMultiCarrier*, cellularClasses : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_cellular_classes.call(this, cellularClasses)
    end
    def get_current_cellular_class(this : IMbnMultiCarrier*, currentCellularClass : Win32cr::NetworkManagement::MobileBroadband::MBN_CELLULAR_CLASS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_cellular_class.call(this, currentCellularClass)
    end
    def scan_network(this : IMbnMultiCarrier*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scan_network.call(this, requestID)
    end

  end

  @[Extern]
  record IMbnMultiCarrierEventsVtbl,
    query_interface : Proc(IMbnMultiCarrierEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnMultiCarrierEvents*, UInt32),
    release : Proc(IMbnMultiCarrierEvents*, UInt32),
    on_set_home_provider_complete : Proc(IMbnMultiCarrierEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_current_cellular_class_change : Proc(IMbnMultiCarrierEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_preferred_providers_change : Proc(IMbnMultiCarrierEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_scan_network_complete : Proc(IMbnMultiCarrierEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_interface_capability_change : Proc(IMbnMultiCarrierEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcdddab6-2021-4bbb-aaee-338e368af6fa")]
  record IMbnMultiCarrierEvents, lpVtbl : IMbnMultiCarrierEventsVtbl* do
    GUID = LibC::GUID.new(0xdcdddab6_u32, 0x2021_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnMultiCarrierEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnMultiCarrierEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnMultiCarrierEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_set_home_provider_complete(this : IMbnMultiCarrierEvents*, mbnInterface : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_home_provider_complete.call(this, mbnInterface, requestID, status)
    end
    def on_current_cellular_class_change(this : IMbnMultiCarrierEvents*, mbnInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_current_cellular_class_change.call(this, mbnInterface)
    end
    def on_preferred_providers_change(this : IMbnMultiCarrierEvents*, mbnInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_preferred_providers_change.call(this, mbnInterface)
    end
    def on_scan_network_complete(this : IMbnMultiCarrierEvents*, mbnInterface : Void*, requestID : UInt32, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_scan_network_complete.call(this, mbnInterface, requestID, status)
    end
    def on_interface_capability_change(this : IMbnMultiCarrierEvents*, mbnInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_interface_capability_change.call(this, mbnInterface)
    end

  end

  @[Extern]
  record IMbnDeviceServiceStateEventsVtbl,
    query_interface : Proc(IMbnDeviceServiceStateEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnDeviceServiceStateEvents*, UInt32),
    release : Proc(IMbnDeviceServiceStateEvents*, UInt32),
    on_sessions_state_change : Proc(IMbnDeviceServiceStateEvents*, Win32cr::Foundation::BSTR, Win32cr::NetworkManagement::MobileBroadband::MBN_DEVICE_SERVICE_SESSIONS_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5d3ff196-89ee-49d8-8b60-33ffddffc58d")]
  record IMbnDeviceServiceStateEvents, lpVtbl : IMbnDeviceServiceStateEventsVtbl* do
    GUID = LibC::GUID.new(0x5d3ff196_u32, 0x89ee_u16, 0x49d8_u16, StaticArray[0x8b_u8, 0x60_u8, 0x33_u8, 0xff_u8, 0xdd_u8, 0xff_u8, 0xc5_u8, 0x8d_u8])
    def query_interface(this : IMbnDeviceServiceStateEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnDeviceServiceStateEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnDeviceServiceStateEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_sessions_state_change(this : IMbnDeviceServiceStateEvents*, interfaceID : Win32cr::Foundation::BSTR, stateChange : Win32cr::NetworkManagement::MobileBroadband::MBN_DEVICE_SERVICE_SESSIONS_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sessions_state_change.call(this, interfaceID, stateChange)
    end

  end

  @[Extern]
  record IMbnDeviceServicesManagerVtbl,
    query_interface : Proc(IMbnDeviceServicesManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnDeviceServicesManager*, UInt32),
    release : Proc(IMbnDeviceServicesManager*, UInt32),
    get_device_services_context : Proc(IMbnDeviceServicesManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("20a26258-6811-4478-ac1d-13324e45e41c")]
  record IMbnDeviceServicesManager, lpVtbl : IMbnDeviceServicesManagerVtbl* do
    GUID = LibC::GUID.new(0x20a26258_u32, 0x6811_u16, 0x4478_u16, StaticArray[0xac_u8, 0x1d_u8, 0x13_u8, 0x32_u8, 0x4e_u8, 0x45_u8, 0xe4_u8, 0x1c_u8])
    def query_interface(this : IMbnDeviceServicesManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnDeviceServicesManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnDeviceServicesManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_services_context(this : IMbnDeviceServicesManager*, networkInterfaceID : Win32cr::Foundation::BSTR, mbnDevicesContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_services_context.call(this, networkInterfaceID, mbnDevicesContext)
    end

  end

  @[Extern]
  record IMbnDeviceServicesContextVtbl,
    query_interface : Proc(IMbnDeviceServicesContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnDeviceServicesContext*, UInt32),
    release : Proc(IMbnDeviceServicesContext*, UInt32),
    enumerate_device_services : Proc(IMbnDeviceServicesContext*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_device_service : Proc(IMbnDeviceServicesContext*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_MaxCommandSize : Proc(IMbnDeviceServicesContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_MaxDataSize : Proc(IMbnDeviceServicesContext*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fc5ac347-1592-4068-80bb-6a57580150d8")]
  record IMbnDeviceServicesContext, lpVtbl : IMbnDeviceServicesContextVtbl* do
    GUID = LibC::GUID.new(0xfc5ac347_u32, 0x1592_u16, 0x4068_u16, StaticArray[0x80_u8, 0xbb_u8, 0x6a_u8, 0x57_u8, 0x58_u8, 0x1_u8, 0x50_u8, 0xd8_u8])
    def query_interface(this : IMbnDeviceServicesContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnDeviceServicesContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnDeviceServicesContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enumerate_device_services(this : IMbnDeviceServicesContext*, deviceServices : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_device_services.call(this, deviceServices)
    end
    def get_device_service(this : IMbnDeviceServicesContext*, deviceServiceID : Win32cr::Foundation::BSTR, mbnDeviceService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_service.call(this, deviceServiceID, mbnDeviceService)
    end
    def get_MaxCommandSize(this : IMbnDeviceServicesContext*, maxCommandSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxCommandSize.call(this, maxCommandSize)
    end
    def get_MaxDataSize(this : IMbnDeviceServicesContext*, maxDataSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDataSize.call(this, maxDataSize)
    end

  end

  @[Extern]
  record IMbnDeviceServicesEventsVtbl,
    query_interface : Proc(IMbnDeviceServicesEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnDeviceServicesEvents*, UInt32),
    release : Proc(IMbnDeviceServicesEvents*, UInt32),
    on_query_supported_commands_complete : Proc(IMbnDeviceServicesEvents*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_open_command_session_complete : Proc(IMbnDeviceServicesEvents*, Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_close_command_session_complete : Proc(IMbnDeviceServicesEvents*, Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_set_command_complete : Proc(IMbnDeviceServicesEvents*, Void*, UInt32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_query_command_complete : Proc(IMbnDeviceServicesEvents*, Void*, UInt32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_event_notification : Proc(IMbnDeviceServicesEvents*, Void*, UInt32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    on_open_data_session_complete : Proc(IMbnDeviceServicesEvents*, Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_close_data_session_complete : Proc(IMbnDeviceServicesEvents*, Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_write_data_complete : Proc(IMbnDeviceServicesEvents*, Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    on_read_data : Proc(IMbnDeviceServicesEvents*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    on_interface_state_change : Proc(IMbnDeviceServicesEvents*, Win32cr::Foundation::BSTR, Win32cr::NetworkManagement::MobileBroadband::MBN_DEVICE_SERVICES_INTERFACE_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0a900c19-6824-4e97-b76e-cf239d0ca642")]
  record IMbnDeviceServicesEvents, lpVtbl : IMbnDeviceServicesEventsVtbl* do
    GUID = LibC::GUID.new(0xa900c19_u32, 0x6824_u16, 0x4e97_u16, StaticArray[0xb7_u8, 0x6e_u8, 0xcf_u8, 0x23_u8, 0x9d_u8, 0xc_u8, 0xa6_u8, 0x42_u8])
    def query_interface(this : IMbnDeviceServicesEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnDeviceServicesEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnDeviceServicesEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_query_supported_commands_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, commandIDList : Win32cr::System::Com::SAFEARRAY*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_query_supported_commands_complete.call(this, deviceService, commandIDList, status, requestID)
    end
    def on_open_command_session_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_open_command_session_complete.call(this, deviceService, status, requestID)
    end
    def on_close_command_session_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_close_command_session_complete.call(this, deviceService, status, requestID)
    end
    def on_set_command_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, responseID : UInt32, deviceServiceData : Win32cr::System::Com::SAFEARRAY*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_command_complete.call(this, deviceService, responseID, deviceServiceData, status, requestID)
    end
    def on_query_command_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, responseID : UInt32, deviceServiceData : Win32cr::System::Com::SAFEARRAY*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_query_command_complete.call(this, deviceService, responseID, deviceServiceData, status, requestID)
    end
    def on_event_notification(this : IMbnDeviceServicesEvents*, deviceService : Void*, eventID : UInt32, deviceServiceData : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event_notification.call(this, deviceService, eventID, deviceServiceData)
    end
    def on_open_data_session_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_open_data_session_complete.call(this, deviceService, status, requestID)
    end
    def on_close_data_session_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_close_data_session_complete.call(this, deviceService, status, requestID)
    end
    def on_write_data_complete(this : IMbnDeviceServicesEvents*, deviceService : Void*, status : Win32cr::Foundation::HRESULT, requestID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_write_data_complete.call(this, deviceService, status, requestID)
    end
    def on_read_data(this : IMbnDeviceServicesEvents*, deviceService : Void*, deviceServiceData : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_read_data.call(this, deviceService, deviceServiceData)
    end
    def on_interface_state_change(this : IMbnDeviceServicesEvents*, interfaceID : Win32cr::Foundation::BSTR, stateChange : Win32cr::NetworkManagement::MobileBroadband::MBN_DEVICE_SERVICES_INTERFACE_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_interface_state_change.call(this, interfaceID, stateChange)
    end

  end

  @[Extern]
  record IMbnDeviceServiceVtbl,
    query_interface : Proc(IMbnDeviceService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnDeviceService*, UInt32),
    release : Proc(IMbnDeviceService*, UInt32),
    query_supported_commands : Proc(IMbnDeviceService*, UInt32*, Win32cr::Foundation::HRESULT),
    open_command_session : Proc(IMbnDeviceService*, UInt32*, Win32cr::Foundation::HRESULT),
    close_command_session : Proc(IMbnDeviceService*, UInt32*, Win32cr::Foundation::HRESULT),
    set_command : Proc(IMbnDeviceService*, UInt32, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT),
    query_command : Proc(IMbnDeviceService*, UInt32, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT),
    open_data_session : Proc(IMbnDeviceService*, UInt32*, Win32cr::Foundation::HRESULT),
    close_data_session : Proc(IMbnDeviceService*, UInt32*, Win32cr::Foundation::HRESULT),
    write_data : Proc(IMbnDeviceService*, Win32cr::System::Com::SAFEARRAY*, UInt32*, Win32cr::Foundation::HRESULT),
    get_InterfaceID : Proc(IMbnDeviceService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DeviceServiceID : Proc(IMbnDeviceService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsCommandSessionOpen : Proc(IMbnDeviceService*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_IsDataSessionOpen : Proc(IMbnDeviceService*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b3bb9a71-dc70-4be9-a4da-7886ae8b191b")]
  record IMbnDeviceService, lpVtbl : IMbnDeviceServiceVtbl* do
    GUID = LibC::GUID.new(0xb3bb9a71_u32, 0xdc70_u16, 0x4be9_u16, StaticArray[0xa4_u8, 0xda_u8, 0x78_u8, 0x86_u8, 0xae_u8, 0x8b_u8, 0x19_u8, 0x1b_u8])
    def query_interface(this : IMbnDeviceService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnDeviceService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnDeviceService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_supported_commands(this : IMbnDeviceService*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_supported_commands.call(this, requestID)
    end
    def open_command_session(this : IMbnDeviceService*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_command_session.call(this, requestID)
    end
    def close_command_session(this : IMbnDeviceService*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_command_session.call(this, requestID)
    end
    def set_command(this : IMbnDeviceService*, commandID : UInt32, deviceServiceData : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_command.call(this, commandID, deviceServiceData, requestID)
    end
    def query_command(this : IMbnDeviceService*, commandID : UInt32, deviceServiceData : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_command.call(this, commandID, deviceServiceData, requestID)
    end
    def open_data_session(this : IMbnDeviceService*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_data_session.call(this, requestID)
    end
    def close_data_session(this : IMbnDeviceService*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_data_session.call(this, requestID)
    end
    def write_data(this : IMbnDeviceService*, deviceServiceData : Win32cr::System::Com::SAFEARRAY*, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_data.call(this, deviceServiceData, requestID)
    end
    def get_InterfaceID(this : IMbnDeviceService*, interface_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InterfaceID.call(this, interface_id)
    end
    def get_DeviceServiceID(this : IMbnDeviceService*, device_service_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceServiceID.call(this, device_service_id)
    end
    def get_IsCommandSessionOpen(this : IMbnDeviceService*, value : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsCommandSessionOpen.call(this, value)
    end
    def get_IsDataSessionOpen(this : IMbnDeviceService*, value : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDataSessionOpen.call(this, value)
    end

  end

  @[Extern]
  record IMbnPinVtbl,
    query_interface : Proc(IMbnPin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMbnPin*, UInt32),
    release : Proc(IMbnPin*, UInt32),
    get_PinType : Proc(IMbnPin*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_TYPE*, Win32cr::Foundation::HRESULT),
    get_PinFormat : Proc(IMbnPin*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_FORMAT*, Win32cr::Foundation::HRESULT),
    get_PinLengthMin : Proc(IMbnPin*, UInt32*, Win32cr::Foundation::HRESULT),
    get_PinLengthMax : Proc(IMbnPin*, UInt32*, Win32cr::Foundation::HRESULT),
    get_PinMode : Proc(IMbnPin*, Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_MODE*, Win32cr::Foundation::HRESULT),
    enable : Proc(IMbnPin*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    disable : Proc(IMbnPin*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    enter : Proc(IMbnPin*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    change : Proc(IMbnPin*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    unblock : Proc(IMbnPin*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_pin_manager : Proc(IMbnPin*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcbbbab6-2007-4bbb-aaee-338e368af6fa")]
  record IMbnPin, lpVtbl : IMbnPinVtbl* do
    GUID = LibC::GUID.new(0xdcbbbab6_u32, 0x2007_u16, 0x4bbb_u16, StaticArray[0xaa_u8, 0xee_u8, 0x33_u8, 0x8e_u8, 0x36_u8, 0x8a_u8, 0xf6_u8, 0xfa_u8])
    def query_interface(this : IMbnPin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMbnPin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMbnPin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PinType(this : IMbnPin*, pin_type : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PinType.call(this, pin_type)
    end
    def get_PinFormat(this : IMbnPin*, pin_format : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PinFormat.call(this, pin_format)
    end
    def get_PinLengthMin(this : IMbnPin*, pin_length_min : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PinLengthMin.call(this, pin_length_min)
    end
    def get_PinLengthMax(this : IMbnPin*, pin_length_max : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PinLengthMax.call(this, pin_length_max)
    end
    def get_PinMode(this : IMbnPin*, pin_mode : Win32cr::NetworkManagement::MobileBroadband::MBN_PIN_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PinMode.call(this, pin_mode)
    end
    def enable(this : IMbnPin*, pin : Win32cr::Foundation::PWSTR, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this, pin, requestID)
    end
    def disable(this : IMbnPin*, pin : Win32cr::Foundation::PWSTR, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable.call(this, pin, requestID)
    end
    def enter(this : IMbnPin*, pin : Win32cr::Foundation::PWSTR, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enter.call(this, pin, requestID)
    end
    def change(this : IMbnPin*, pin : Win32cr::Foundation::PWSTR, newPin : Win32cr::Foundation::PWSTR, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change.call(this, pin, newPin, requestID)
    end
    def unblock(this : IMbnPin*, puk : Win32cr::Foundation::PWSTR, newPin : Win32cr::Foundation::PWSTR, requestID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unblock.call(this, puk, newPin, requestID)
    end
    def get_pin_manager(this : IMbnPin*, pinManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pin_manager.call(this, pinManager)
    end

  end

end