require "./../foundation.cr"

module Win32cr::Devices::Nfc
  extend self
  GUID_DEVINTERFACE_NFCDTA = LibC::GUID.new(0x7fd3f30b_u32, 0x5e49_u16, 0x4be1_u16, StaticArray[0xb3_u8, 0xaa_u8, 0xaf_u8, 0x6_u8, 0x26_u8, 0xd_u8, 0x23_u8, 0x6a_u8])
  IOCTL_NFCDTA_CONFIG_RF_DISCOVERY = 2233344_u32
  IOCTL_NFCDTA_REMOTE_DEV_GET_NEXT = 2233348_u32
  IOCTL_NFCDTA_REMOTE_DEV_CONNECT = 2233352_u32
  IOCTL_NFCDTA_REMOTE_DEV_DISCONNECT = 2233356_u32
  IOCTL_NFCDTA_REMOTE_DEV_TRANSCEIVE = 2233360_u32
  IOCTL_NFCDTA_REMOTE_DEV_RECV = 2233364_u32
  IOCTL_NFCDTA_REMOTE_DEV_SEND = 2233368_u32
  IOCTL_NFCDTA_REMOTE_DEV_CHECK_PRESENCE = 2233372_u32
  IOCTL_NFCDTA_CONFIG_P2P_PARAM = 2233376_u32
  IOCTL_NFCDTA_SET_RF_CONFIG = 2233380_u32
  IOCTL_NFCDTA_REMOTE_DEV_NDEF_WRITE = 2233408_u32
  IOCTL_NFCDTA_REMOTE_DEV_NDEF_READ = 2233412_u32
  IOCTL_NFCDTA_REMOTE_DEV_NDEF_CONVERT_READ_ONLY = 2233416_u32
  IOCTL_NFCDTA_REMOTE_DEV_NDEF_CHECK = 2233420_u32
  IOCTL_NFCDTA_LLCP_CONFIG = 2233472_u32
  IOCTL_NFCDTA_LLCP_ACTIVATE = 2233476_u32
  IOCTL_NFCDTA_LLCP_DEACTIVATE = 2233480_u32
  IOCTL_NFCDTA_LLCP_DISCOVER_SERVICES = 2233484_u32
  IOCTL_NFCDTA_LLCP_LINK_STATUS_CHECK = 2233488_u32
  IOCTL_NFCDTA_LLCP_GET_NEXT_LINK_STATUS = 2233492_u32
  IOCTL_NFCDTA_LLCP_SOCKET_CREATE = 2233496_u32
  IOCTL_NFCDTA_LLCP_SOCKET_CLOSE = 2233500_u32
  IOCTL_NFCDTA_LLCP_SOCKET_BIND = 2233504_u32
  IOCTL_NFCDTA_LLCP_SOCKET_LISTEN = 2233508_u32
  IOCTL_NFCDTA_LLCP_SOCKET_ACCEPT = 2233512_u32
  IOCTL_NFCDTA_LLCP_SOCKET_CONNECT = 2233516_u32
  IOCTL_NFCDTA_LLCP_SOCKET_DISCONNECT = 2233520_u32
  IOCTL_NFCDTA_LLCP_SOCKET_RECV = 2233524_u32
  IOCTL_NFCDTA_LLCP_SOCKET_RECV_FROM = 2233528_u32
  IOCTL_NFCDTA_LLCP_SOCKET_SEND = 2233532_u32
  IOCTL_NFCDTA_LLCP_SOCKET_SNED_TO = 2233536_u32
  IOCTL_NFCDTA_LLCP_SOCKET_GET_NEXT_ERROR = 2233540_u32
  IOCTL_NFCDTA_SNEP_INIT_SERVER = 2233600_u32
  IOCTL_NFCDTA_SNEP_DEINIT_SERVER = 2233604_u32
  IOCTL_NFCDTA_SNEP_SERVER_GET_NEXT_CONNECTION = 2233608_u32
  IOCTL_NFCDTA_SNEP_SERVER_ACCEPT = 2233612_u32
  IOCTL_NFCDTA_SNEP_SERVER_GET_NEXT_REQUEST = 2233616_u32
  IOCTL_NFCDTA_SNEP_SERVER_SEND_RESPONSE = 2233620_u32
  IOCTL_NFCDTA_SNEP_INIT_CLIENT = 2233664_u32
  IOCTL_NFCDTA_SNEP_DEINIT_CLIENT = 2233668_u32
  IOCTL_NFCDTA_SNEP_CLIENT_PUT = 2233672_u32
  IOCTL_NFCDTA_SNEP_CLIENT_GET = 2233676_u32
  IOCTL_NFCDTA_SE_ENUMERATE = 2233728_u32
  IOCTL_NFCDTA_SE_SET_EMULATION_MODE = 2233732_u32
  IOCTL_NFCDTA_SE_SET_ROUTING_TABLE = 2233736_u32
  IOCTL_NFCDTA_SE_GET_NEXT_EVENT = 2233740_u32
  MAX_ATR_LENGTH = 48_u32
  MAX_UID_SIZE = 16_u32
  MAX_LLCP_SERVICE_NAME_SIZE = 256_u32
  MAX_SNEP_SERVER_NAME_SIZE = 256_u32
  GUID_NFC_RADIO_MEDIA_DEVICE_INTERFACE = LibC::GUID.new(0x4d51e930_u32, 0x750d_u16, 0x4a36_u16, StaticArray[0xa9_u8, 0xf7_u8, 0x91_u8, 0xdc_u8, 0x54_u8, 0xf_u8, 0xcd_u8, 0x30_u8])
  GUID_NFCSE_RADIO_MEDIA_DEVICE_INTERFACE = LibC::GUID.new(0xef8ba08f_u32, 0x148d_u16, 0x4116_u16, StaticArray[0x83_u8, 0xef_u8, 0xa2_u8, 0x67_u8, 0x9d_u8, 0xfc_u8, 0x3f_u8, 0xa5_u8])
  NFCRMDDI_IOCTL_BASE = 80_u32
  IOCTL_NFCRM_SET_RADIO_STATE = 5308804_u32
  IOCTL_NFCRM_QUERY_RADIO_STATE = 5308808_u32
  IOCTL_NFCSERM_SET_RADIO_STATE = 5308812_u32
  IOCTL_NFCSERM_QUERY_RADIO_STATE = 5308816_u32
  GUID_DEVINTERFACE_NFCSE = LibC::GUID.new(0x8dc7c854_u32, 0xf5e5_u16, 0x4bed_u16, StaticArray[0x81_u8, 0x5d_u8, 0xc_u8, 0x85_u8, 0xad_u8, 0x4_u8, 0x77_u8, 0x25_u8])
  IOCTL_NFCSE_ENUM_ENDPOINTS = 2230272_u32
  IOCTL_NFCSE_SUBSCRIBE_FOR_EVENT = 2230276_u32
  IOCTL_NFCSE_GET_NEXT_EVENT = 2230280_u32
  IOCTL_NFCSE_SET_CARD_EMULATION_MODE = 2230284_u32
  IOCTL_NFCSE_GET_NFCC_CAPABILITIES = 2230288_u32
  IOCTL_NFCSE_GET_ROUTING_TABLE = 2230292_u32
  IOCTL_NFCSE_SET_ROUTING_TABLE = 2230296_u32
  IOCTL_NFCSE_HCE_REMOTE_RECV = 2230592_u32
  IOCTL_NFCSE_HCE_REMOTE_SEND = 2230596_u32
  IOCTL_NFCSE_SET_POWER_MODE = 2230600_u32
  EVT_TRANSACTION_TAG_AID = 129_u32
  EVT_TRANSACTION_TAG_PARAMETERS = 130_u32
  EVT_TRANSACTION_PARAMETER_MAX_LEN = 255_u32
  ISO_7816_MINIMUM_AID_LENGTH = 5_u32
  ISO_7816_MAXIMUM_AID_LENGTH = 16_u32

  enum SECURE_ELEMENT_TYPE
    Integrated = 0_i32
    External = 1_i32
    DeviceHost = 2_i32
  end
  enum SECURE_ELEMENT_EVENT_TYPE
    ExternalReaderArrival = 0_i32
    ExternalReaderDeparture = 1_i32
    ApplicationSelected = 2_i32
    Transaction = 3_i32
    HceActivated = 4_i32
    HceDeactivated = 5_i32
    ExternalFieldEnter = 6_i32
    ExternalFieldExit = 7_i32
  end
  enum SECURE_ELEMENT_CARD_EMULATION_MODE
    EmulationOff = 0_i32
    EmulationOnPowerIndependent = 1_i32
    EmulationOnPowerDependent = 2_i32
    EmulationStealthListen = 3_i32
  end
  enum SECURE_ELEMENT_ROUTING_TYPE
    RoutingTypeTech = 0_i32
    RoutingTypeProtocol = 1_i32
    RoutingTypeAid = 2_i32
  end
  enum SECURE_ELEMENT_POWER_MODE
    SEPowerMode_ForceOn = 0_i32
    SEPowerMode_AllowOff = 1_i32
  end
  enum NFC_RF_DISCOVERY_MODE
    RfDiscoveryConfig = 0_i32
    RfDiscoveryStart = 1_i32
    RFDiscoveryResume = 2_i32
  end
  enum NFC_P2P_MODE
    NfcDepDefault = 0_i32
    NfcDepPoll = 1_i32
    NfcDepListen = 2_i32
  end
  enum NFC_DEVICE_TYPE
    NfcType1Tag = 0_i32
    NfcType2Tag = 1_i32
    NfcType3Tag = 2_i32
    NfcType4Tag = 3_i32
    NfcIP1Target = 4_i32
    NfcIP1Initiator = 5_i32
    NfcReader = 6_i32
  end
  enum NFC_RELEASE_TYPE
    IdleMode = 0_i32
    SleepMode = 1_i32
    Discovery = 2_i32
  end
  enum NFC_LLCP_SOCKET_TYPE
    ConnectionOriented = 0_i32
    Connectionless = 1_i32
  end
  enum NFC_LLCP_LINK_STATUS
    LinkActivated = 0_i32
    LinkDeactivated = 1_i32
  end
  enum NFC_LLCP_SOCKET_CONNECT_TYPE
    NfcConnectBySap = 0_i32
    NfcConnectByUri = 1_i32
  end
  enum NFC_LLCP_SOCKET_ERROR
    NfcLlcpErrorDisconnected = 0_i32
    NfcLlcpErrorFrameRejected = 1_i32
    NfcLlcpErrorBusyCondition = 2_i32
    NfcLlcpErrorNotBusyCondition = 3_i32
  end
  enum NFC_SNEP_SERVER_TYPE
    DefaultSnepServer = 0_i32
    ExtendedSnepServer = 1_i32
  end
  enum NFC_SNEP_REQUEST_TYPE
    SnepRequestGet = 0_i32
    SnepRequestPut = 1_i32
  end
  enum NFC_SE_EMULATION_MODE
    EmulationDisabled = 0_i32
    EmulationEnabled = 1_i32
  end

  @[Extern]
  struct SECURE_ELEMENT_ENDPOINT_INFO
    property guidSecureElementId : LibC::GUID
    property eSecureElementType : Win32cr::Devices::Nfc::SECURE_ELEMENT_TYPE
    def initialize(@guidSecureElementId : LibC::GUID, @eSecureElementType : Win32cr::Devices::Nfc::SECURE_ELEMENT_TYPE)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_ENDPOINT_LIST
    property number_of_endpoints : UInt32
    property endpoint_list : Win32cr::Devices::Nfc::SECURE_ELEMENT_ENDPOINT_INFO[1]
    def initialize(@number_of_endpoints : UInt32, @endpoint_list : Win32cr::Devices::Nfc::SECURE_ELEMENT_ENDPOINT_INFO[1])
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_EVENT_SUBSCRIPTION_INFO
    property guidSecureElementId : LibC::GUID
    property eEventType : Win32cr::Devices::Nfc::SECURE_ELEMENT_EVENT_TYPE
    def initialize(@guidSecureElementId : LibC::GUID, @eEventType : Win32cr::Devices::Nfc::SECURE_ELEMENT_EVENT_TYPE)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_EVENT_INFO
    property guidSecureElementId : LibC::GUID
    property eEventType : Win32cr::Devices::Nfc::SECURE_ELEMENT_EVENT_TYPE
    property cbEventData : UInt32
    property pbEventData : UInt8[1]
    def initialize(@guidSecureElementId : LibC::GUID, @eEventType : Win32cr::Devices::Nfc::SECURE_ELEMENT_EVENT_TYPE, @cbEventData : UInt32, @pbEventData : UInt8[1])
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_SET_CARD_EMULATION_MODE_INFO
    property guidSecureElementId : LibC::GUID
    property eMode : Win32cr::Devices::Nfc::SECURE_ELEMENT_CARD_EMULATION_MODE
    def initialize(@guidSecureElementId : LibC::GUID, @eMode : Win32cr::Devices::Nfc::SECURE_ELEMENT_CARD_EMULATION_MODE)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_NFCC_CAPABILITIES
    property cbMaxRoutingTableSize : UInt16
    property is_aid_routing_supported : Win32cr::Foundation::BOOLEAN
    property is_protocol_routing_supported : Win32cr::Foundation::BOOLEAN
    property is_tech_routing_supported : Win32cr::Foundation::BOOLEAN
    def initialize(@cbMaxRoutingTableSize : UInt16, @is_aid_routing_supported : Win32cr::Foundation::BOOLEAN, @is_protocol_routing_supported : Win32cr::Foundation::BOOLEAN, @is_tech_routing_supported : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_TECH_ROUTING_INFO
    property guidSecureElementId : LibC::GUID
    property eRfTechType : UInt8
    def initialize(@guidSecureElementId : LibC::GUID, @eRfTechType : UInt8)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_PROTO_ROUTING_INFO
    property guidSecureElementId : LibC::GUID
    property eRfProtocolType : UInt8
    def initialize(@guidSecureElementId : LibC::GUID, @eRfProtocolType : UInt8)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_AID_ROUTING_INFO
    property guidSecureElementId : LibC::GUID
    property cbAid : UInt32
    property pbAid : UInt8[16]
    def initialize(@guidSecureElementId : LibC::GUID, @cbAid : UInt32, @pbAid : UInt8[16])
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_ROUTING_TABLE_ENTRY
    property eRoutingType : Win32cr::Devices::Nfc::SECURE_ELEMENT_ROUTING_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property tech_routing_info : Win32cr::Devices::Nfc::SECURE_ELEMENT_TECH_ROUTING_INFO
    property proto_routing_info : Win32cr::Devices::Nfc::SECURE_ELEMENT_PROTO_ROUTING_INFO
    property aid_routing_info : Win32cr::Devices::Nfc::SECURE_ELEMENT_AID_ROUTING_INFO
    def initialize(@tech_routing_info : Win32cr::Devices::Nfc::SECURE_ELEMENT_TECH_ROUTING_INFO, @proto_routing_info : Win32cr::Devices::Nfc::SECURE_ELEMENT_PROTO_ROUTING_INFO, @aid_routing_info : Win32cr::Devices::Nfc::SECURE_ELEMENT_AID_ROUTING_INFO)
    end
    end

    def initialize(@eRoutingType : Win32cr::Devices::Nfc::SECURE_ELEMENT_ROUTING_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_ROUTING_TABLE
    property number_of_entries : UInt32
    property table_entries : Win32cr::Devices::Nfc::SECURE_ELEMENT_ROUTING_TABLE_ENTRY[1]
    def initialize(@number_of_entries : UInt32, @table_entries : Win32cr::Devices::Nfc::SECURE_ELEMENT_ROUTING_TABLE_ENTRY[1])
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_HCE_ACTIVATION_PAYLOAD
    property bConnectionId : UInt16
    property eRfTechType : UInt8
    property eRfProtocolType : UInt8
    def initialize(@bConnectionId : UInt16, @eRfTechType : UInt8, @eRfProtocolType : UInt8)
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_HCE_DATA_PACKET
    property bConnectionId : UInt16
    property cbPayload : UInt16
    property pbPayload : UInt8[1]
    def initialize(@bConnectionId : UInt16, @cbPayload : UInt16, @pbPayload : UInt8[1])
    end
  end

  @[Extern]
  struct SECURE_ELEMENT_SET_POWER_MODE_INFO
    property guidSecureElementId : LibC::GUID
    property powerMode : Win32cr::Devices::Nfc::SECURE_ELEMENT_POWER_MODE
    def initialize(@guidSecureElementId : LibC::GUID, @powerMode : Win32cr::Devices::Nfc::SECURE_ELEMENT_POWER_MODE)
    end
  end

  @[Extern]
  struct NFC_RF_DISCOVERY_CONFIG
    property usTotalDuration : UInt16
    property ulPollConfig : UInt32
    property fDisableCardEmulation : Win32cr::Foundation::BOOLEAN
    property ucNfcIPMode : UInt8
    property fNfcIPTgtModeDisable : Win32cr::Foundation::BOOLEAN
    property ucNfcIPTgtMode : UInt8
    property ucNfcCEMode : UInt8
    property ucBailoutConfig : UInt8
    property ucSystemCode : UInt8[2]
    property ucRequestCode : UInt8
    property ucTimeSlotNumber : UInt8
    property eRfDiscoveryMode : Win32cr::Devices::Nfc::NFC_RF_DISCOVERY_MODE
    def initialize(@usTotalDuration : UInt16, @ulPollConfig : UInt32, @fDisableCardEmulation : Win32cr::Foundation::BOOLEAN, @ucNfcIPMode : UInt8, @fNfcIPTgtModeDisable : Win32cr::Foundation::BOOLEAN, @ucNfcIPTgtMode : UInt8, @ucNfcCEMode : UInt8, @ucBailoutConfig : UInt8, @ucSystemCode : UInt8[2], @ucRequestCode : UInt8, @ucTimeSlotNumber : UInt8, @eRfDiscoveryMode : Win32cr::Devices::Nfc::NFC_RF_DISCOVERY_MODE)
    end
  end

  @[Extern]
  struct NFC_P2P_PARAM_CONFIG
    property eP2pMode : Win32cr::Devices::Nfc::NFC_P2P_MODE
    property cbGeneralBytes : UInt8
    property pbGeneralBytes : UInt8[48]
    def initialize(@eP2pMode : Win32cr::Devices::Nfc::NFC_P2P_MODE, @cbGeneralBytes : UInt8, @pbGeneralBytes : UInt8[48])
    end
  end

  @[Extern]
  struct NFC_REMOTE_DEV_INFO
    property hRemoteDev : LibC::IntPtrT
    property eType : Win32cr::Devices::Nfc::NFC_DEVICE_TYPE
    property eRFTech : UInt8
    property eProtocol : UInt8
    property cbUid : UInt8
    property pbUid : UInt8[16]
    def initialize(@hRemoteDev : LibC::IntPtrT, @eType : Win32cr::Devices::Nfc::NFC_DEVICE_TYPE, @eRFTech : UInt8, @eProtocol : UInt8, @cbUid : UInt8, @pbUid : UInt8[16])
    end
  end

  @[Extern]
  struct NFC_REMOTE_DEVICE_DISCONNET
    property hRemoteDev : LibC::IntPtrT
    property eReleaseType : Win32cr::Devices::Nfc::NFC_RELEASE_TYPE
    def initialize(@hRemoteDev : LibC::IntPtrT, @eReleaseType : Win32cr::Devices::Nfc::NFC_RELEASE_TYPE)
    end
  end

  @[Extern]
  struct NFC_DATA_BUFFER
    property cbBuffer : UInt16
    property pbBuffer : UInt8[1]
    def initialize(@cbBuffer : UInt16, @pbBuffer : UInt8[1])
    end
  end

  @[Extern]
  struct NFC_REMOTE_DEV_SEND_INFO
    property hRemoteDev : LibC::IntPtrT
    property usTimeOut : UInt16
    property sSendBuffer : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hRemoteDev : LibC::IntPtrT, @usTimeOut : UInt16, @sSendBuffer : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_REMOTE_DEV_RECV_INFO
    property hRemoteDev : LibC::IntPtrT
    property sRecvBuffer : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hRemoteDev : LibC::IntPtrT, @sRecvBuffer : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_NDEF_INFO
    property fIsNdefFormatted : Win32cr::Foundation::BOOLEAN
    property fIsReadOnly : Win32cr::Foundation::BOOLEAN
    property dwActualMessageLength : UInt32
    property dwMaxMessageLength : UInt32
    def initialize(@fIsNdefFormatted : Win32cr::Foundation::BOOLEAN, @fIsReadOnly : Win32cr::Foundation::BOOLEAN, @dwActualMessageLength : UInt32, @dwMaxMessageLength : UInt32)
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_OPTION
    property uMIUX : UInt16
    property bRW : UInt8
    def initialize(@uMIUX : UInt16, @bRW : UInt8)
    end
  end

  @[Extern]
  struct NFC_LLCP_CONFIG
    property uMIU : UInt16
    property uWKS : UInt16
    property bLTO : UInt8
    property bOptions : UInt8
    property fAutoActivate : Win32cr::Foundation::BOOLEAN
    def initialize(@uMIU : UInt16, @uWKS : UInt16, @bLTO : UInt8, @bOptions : UInt8, @fAutoActivate : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct NFC_LLCP_SERVICE_NAME_ENTRY
    property cbServiceName : UInt32
    property pbServiceName : UInt8[1]
    def initialize(@cbServiceName : UInt32, @pbServiceName : UInt8[1])
    end
  end

  @[Extern]
  struct NFC_LLCP_SERVICE_DISCOVER_REQUEST
    property hRemoteDev : LibC::IntPtrT
    property number_of_entries : UInt32
    property service_name_entries : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY[1]
    def initialize(@hRemoteDev : LibC::IntPtrT, @number_of_entries : UInt32, @service_name_entries : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY[1])
    end
  end

  @[Extern]
  struct NFC_LLCP_SERVICE_DISCOVER_SAP
    property number_of_entries : UInt32
    property sap_entries : UInt8[1]
    def initialize(@number_of_entries : UInt32, @sap_entries : UInt8[1])
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_INFO
    property eSocketType : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_TYPE
    property sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION
    def initialize(@eSocketType : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_TYPE, @sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION)
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_SERVICE_INFO
    property hSocket : LibC::IntPtrT
    property bSAP : UInt8
    property sServiceName : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY
    def initialize(@hSocket : LibC::IntPtrT, @bSAP : UInt8, @sServiceName : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY)
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_PAYLOAD
    property hSocket : LibC::IntPtrT
    property bSAP : UInt8
    property sPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hSocket : LibC::IntPtrT, @bSAP : UInt8, @sPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_ACCEPT_INFO
    property hSocket : LibC::IntPtrT
    property sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION
    def initialize(@hSocket : LibC::IntPtrT, @sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION)
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_CONNECT_INFO
    property hRemoteDev : LibC::IntPtrT
    property hSocket : LibC::IntPtrT
    property eConnectType : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_CONNECT_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property bSAP : UInt8
    property sServiceName : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY
    def initialize(@bSAP : UInt8, @sServiceName : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY)
    end
    end

    def initialize(@hRemoteDev : LibC::IntPtrT, @hSocket : LibC::IntPtrT, @eConnectType : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_CONNECT_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_CL_PAYLOAD
    property hSocket : LibC::IntPtrT
    property bSAP : UInt8
    property sPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hSocket : LibC::IntPtrT, @bSAP : UInt8, @sPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_LLCP_SOCKET_ERROR_INFO
    property hSocket : LibC::IntPtrT
    property eSocketError : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_ERROR
    def initialize(@hSocket : LibC::IntPtrT, @eSocketError : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_ERROR)
    end
  end

  @[Extern]
  struct NFC_SNEP_SERVER_INFO
    property eServerType : Win32cr::Devices::Nfc::NFC_SNEP_SERVER_TYPE
    property sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION
    property usInboxSize : UInt16
    property bSAP : UInt8
    property sService : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY
    def initialize(@eServerType : Win32cr::Devices::Nfc::NFC_SNEP_SERVER_TYPE, @sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION, @usInboxSize : UInt16, @bSAP : UInt8, @sService : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY)
    end
  end

  @[Extern]
  struct NFC_SNEP_SERVER_ACCEPT_INFO
    property hSnepServer : LibC::IntPtrT
    property hConnection : LibC::IntPtrT
    property sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION
    def initialize(@hSnepServer : LibC::IntPtrT, @hConnection : LibC::IntPtrT, @sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION)
    end
  end

  @[Extern]
  struct NFC_SNEP_SERVER_REQUEST
    property hSnepServer : LibC::IntPtrT
    property hConnection : LibC::IntPtrT
    property eRequestType : Win32cr::Devices::Nfc::NFC_SNEP_REQUEST_TYPE
    property sRequestPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hSnepServer : LibC::IntPtrT, @hConnection : LibC::IntPtrT, @eRequestType : Win32cr::Devices::Nfc::NFC_SNEP_REQUEST_TYPE, @sRequestPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_SNEP_SERVER_RESPONSE_INFO
    property hSnepServer : LibC::IntPtrT
    property hConnection : LibC::IntPtrT
    property dwResponseStatus : UInt32
    property sResponsePayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hSnepServer : LibC::IntPtrT, @hConnection : LibC::IntPtrT, @dwResponseStatus : UInt32, @sResponsePayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_SNEP_CLIENT_INFO
    property hRemoteDev : LibC::IntPtrT
    property eServerType : Win32cr::Devices::Nfc::NFC_SNEP_SERVER_TYPE
    property sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION
    property sService : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY
    def initialize(@hRemoteDev : LibC::IntPtrT, @eServerType : Win32cr::Devices::Nfc::NFC_SNEP_SERVER_TYPE, @sSocketOption : Win32cr::Devices::Nfc::NFC_LLCP_SOCKET_OPTION, @sService : Win32cr::Devices::Nfc::NFC_LLCP_SERVICE_NAME_ENTRY)
    end
  end

  @[Extern]
  struct NFC_SNEP_CLIENT_PUT_INFO
    property hSnepClient : LibC::IntPtrT
    property sPutPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hSnepClient : LibC::IntPtrT, @sPutPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_SNEP_CLIENT_GET_INFO
    property hSnepClient : LibC::IntPtrT
    property sGetPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER
    def initialize(@hSnepClient : LibC::IntPtrT, @sGetPayload : Win32cr::Devices::Nfc::NFC_DATA_BUFFER)
    end
  end

  @[Extern]
  struct NFC_SE_INFO
    property hSecureElement : LibC::IntPtrT
    property eSecureElementType : Win32cr::Devices::Nfc::SECURE_ELEMENT_TYPE
    def initialize(@hSecureElement : LibC::IntPtrT, @eSecureElementType : Win32cr::Devices::Nfc::SECURE_ELEMENT_TYPE)
    end
  end

  @[Extern]
  struct NFC_SE_LIST
    property number_of_endpoints : UInt32
    property endpoint_list : Win32cr::Devices::Nfc::NFC_SE_INFO[1]
    def initialize(@number_of_endpoints : UInt32, @endpoint_list : Win32cr::Devices::Nfc::NFC_SE_INFO[1])
    end
  end

  @[Extern]
  struct NFC_SE_EMULATION_MODE_INFO
    property hSecureElement : LibC::IntPtrT
    property eMode : Win32cr::Devices::Nfc::NFC_SE_EMULATION_MODE
    def initialize(@hSecureElement : LibC::IntPtrT, @eMode : Win32cr::Devices::Nfc::NFC_SE_EMULATION_MODE)
    end
  end

  @[Extern]
  struct NFC_SE_TECH_ROUTING_INFO
    property hSecureElement : LibC::IntPtrT
    property bPowerState : UInt8
    property eRfTechType : UInt8
    def initialize(@hSecureElement : LibC::IntPtrT, @bPowerState : UInt8, @eRfTechType : UInt8)
    end
  end

  @[Extern]
  struct NFC_SE_PROTO_ROUTING_INFO
    property hSecureElement : LibC::IntPtrT
    property bPowerState : UInt8
    property eRfProtocolType : UInt8
    def initialize(@hSecureElement : LibC::IntPtrT, @bPowerState : UInt8, @eRfProtocolType : UInt8)
    end
  end

  @[Extern]
  struct NFC_SE_AID_ROUTING_INFO
    property hSecureElement : LibC::IntPtrT
    property bPowerState : UInt8
    property cbAid : UInt32
    property pbAid : UInt8[16]
    def initialize(@hSecureElement : LibC::IntPtrT, @bPowerState : UInt8, @cbAid : UInt32, @pbAid : UInt8[16])
    end
  end

  @[Extern]
  struct NFC_SE_ROUTING_TABLE_ENTRY
    property eRoutingType : Win32cr::Devices::Nfc::SECURE_ELEMENT_ROUTING_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property tech_routing_info : Win32cr::Devices::Nfc::NFC_SE_TECH_ROUTING_INFO
    property proto_routing_info : Win32cr::Devices::Nfc::NFC_SE_PROTO_ROUTING_INFO
    property aid_routing_info : Win32cr::Devices::Nfc::NFC_SE_AID_ROUTING_INFO
    def initialize(@tech_routing_info : Win32cr::Devices::Nfc::NFC_SE_TECH_ROUTING_INFO, @proto_routing_info : Win32cr::Devices::Nfc::NFC_SE_PROTO_ROUTING_INFO, @aid_routing_info : Win32cr::Devices::Nfc::NFC_SE_AID_ROUTING_INFO)
    end
    end

    def initialize(@eRoutingType : Win32cr::Devices::Nfc::SECURE_ELEMENT_ROUTING_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct NFC_SE_ROUTING_TABLE
    property number_of_entries : UInt32
    property table_entries : Win32cr::Devices::Nfc::NFC_SE_ROUTING_TABLE_ENTRY[1]
    def initialize(@number_of_entries : UInt32, @table_entries : Win32cr::Devices::Nfc::NFC_SE_ROUTING_TABLE_ENTRY[1])
    end
  end

  @[Extern]
  struct NFC_SE_EVENT_INFO
    property hSecureElement : LibC::IntPtrT
    property eEventType : Win32cr::Devices::Nfc::SECURE_ELEMENT_EVENT_TYPE
    property cbEventData : UInt32
    property pbEventData : UInt8[1]
    def initialize(@hSecureElement : LibC::IntPtrT, @eEventType : Win32cr::Devices::Nfc::SECURE_ELEMENT_EVENT_TYPE, @cbEventData : UInt32, @pbEventData : UInt8[1])
    end
  end

  @[Extern]
  struct NFCRM_SET_RADIO_STATE
    property system_state_update : Win32cr::Foundation::BOOLEAN
    property media_radio_on : Win32cr::Foundation::BOOLEAN
    def initialize(@system_state_update : Win32cr::Foundation::BOOLEAN, @media_radio_on : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct NFCRM_RADIO_STATE
    property media_radio_on : Win32cr::Foundation::BOOLEAN
    def initialize(@media_radio_on : Win32cr::Foundation::BOOLEAN)
    end
  end

end