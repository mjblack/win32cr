require "./../security/cryptography.cr"
require "./../foundation.cr"
require "./../system/com.cr"
require "./../networking/win_sock.cr"

module Win32cr::Devices::WebServicesOnDevices
  extend self
  alias WSD_STUB_FUNCTION = Proc(Void*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENT*, Win32cr::Foundation::HRESULT)

  alias PWSD_SOAP_MESSAGE_HANDLER = Proc(Void*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENT*, Win32cr::Foundation::HRESULT)

  WSD_DEFAULT_HOSTING_ADDRESS = "http://*:5357/"
  WSD_DEFAULT_SECURE_HOSTING_ADDRESS = "https://*:5358/"
  WSD_DEFAULT_EVENTING_ADDRESS = "http://*:5357/"
  WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE = 1_u32
  WSDAPI_OPTION_TRACE_XML_TO_DEBUGGER = 2_u32
  WSDAPI_OPTION_TRACE_XML_TO_FILE = 3_u32
  WSDAPI_SSL_CERT_APPLY_DEFAULT_CHECKS = 0_u32
  WSDAPI_SSL_CERT_IGNORE_REVOCATION = 1_u32
  WSDAPI_SSL_CERT_IGNORE_EXPIRY = 2_u32
  WSDAPI_SSL_CERT_IGNORE_WRONG_USAGE = 4_u32
  WSDAPI_SSL_CERT_IGNORE_UNKNOWN_CA = 8_u32
  WSDAPI_SSL_CERT_IGNORE_INVALID_CN = 16_u32
  WSDAPI_COMPACTSIG_ACCEPT_ALL_MESSAGES = 1_u32
  WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE = 1_u32
  WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM = 2_u32
  WSDAPI_ADDRESSFAMILY_IPV4 = 1_u32
  WSDAPI_ADDRESSFAMILY_IPV6 = 2_u32

  enum WSD_CONFIG_PARAM_TYPE
    WSD_CONFIG_MAX_INBOUND_MESSAGE_SIZE = 1_i32
    WSD_CONFIG_MAX_OUTBOUND_MESSAGE_SIZE = 2_i32
    WSD_SECURITY_SSL_CERT_FOR_CLIENT_AUTH = 3_i32
    WSD_SECURITY_SSL_SERVER_CERT_VALIDATION = 4_i32
    WSD_SECURITY_SSL_CLIENT_CERT_VALIDATION = 5_i32
    WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT = 6_i32
    WSD_SECURITY_COMPACTSIG_SIGNING_CERT = 7_i32
    WSD_SECURITY_COMPACTSIG_VALIDATION = 8_i32
    WSD_CONFIG_HOSTING_ADDRESSES = 9_i32
    WSD_CONFIG_DEVICE_ADDRESSES = 10_i32
    WSD_SECURITY_REQUIRE_HTTP_CLIENT_AUTH = 11_i32
    WSD_SECURITY_REQUIRE_CLIENT_CERT_OR_HTTP_CLIENT_AUTH = 12_i32
    WSD_SECURITY_USE_HTTP_CLIENT_AUTH = 13_i32
  end
  enum WSDUdpMessageType
    ONE_WAY = 0_i32
    TWO_WAY = 1_i32
  end
  enum WSDXML_OP
    OpNone = 0_i32
    OpEndOfTable = 1_i32
    OpBeginElement_ = 2_i32
    OpBeginAnyElement = 3_i32
    OpEndElement = 4_i32
    OpElement_ = 5_i32
    OpAnyElement = 6_i32
    OpAnyElements = 7_i32
    OpAnyText = 8_i32
    OpAttribute_ = 9_i32
    OpBeginChoice = 10_i32
    OpEndChoice = 11_i32
    OpBeginSequence = 12_i32
    OpEndSequence = 13_i32
    OpBeginAll = 14_i32
    OpEndAll = 15_i32
    OpAnything = 16_i32
    OpAnyNumber = 17_i32
    OpOneOrMore = 18_i32
    OpOptional = 19_i32
    OpFormatBool_ = 20_i32
    OpFormatInt8_ = 21_i32
    OpFormatInt16_ = 22_i32
    OpFormatInt32_ = 23_i32
    OpFormatInt64_ = 24_i32
    OpFormatUInt8_ = 25_i32
    OpFormatUInt16_ = 26_i32
    OpFormatUInt32_ = 27_i32
    OpFormatUInt64_ = 28_i32
    OpFormatUnicodeString_ = 29_i32
    OpFormatDom_ = 30_i32
    OpFormatStruct_ = 31_i32
    OpFormatUri_ = 32_i32
    OpFormatUuidUri_ = 33_i32
    OpFormatName_ = 34_i32
    OpFormatListInsertTail_ = 35_i32
    OpFormatType_ = 36_i32
    OpFormatDynamicType_ = 37_i32
    OpFormatLookupType_ = 38_i32
    OpFormatDuration_ = 39_i32
    OpFormatDateTime_ = 40_i32
    OpFormatFloat_ = 41_i32
    OpFormatDouble_ = 42_i32
    OpProcess_ = 43_i32
    OpQualifiedAttribute_ = 44_i32
    OpFormatXMLDeclaration_ = 45_i32
    OpFormatMax = 46_i32
  end
  enum DeviceDiscoveryMechanism
    MulticastDiscovery = 0_i32
    DirectedDiscovery = 1_i32
    SecureDirectedDiscovery = 2_i32
  end
  enum WSD_PROTOCOL_TYPE
    WSD_PT_NONE = 0_i32
    WSD_PT_UDP = 1_i32
    WSD_PT_HTTP = 2_i32
    WSD_PT_HTTPS = 4_i32
    WSD_PT_ALL = 255_i32
  end
  enum WSDEventType
    WSDET_NONE = 0_i32
    WSDET_INCOMING_MESSAGE = 1_i32
    WSDET_INCOMING_FAULT = 2_i32
    WSDET_TRANSMISSION_FAILURE = 3_i32
    WSDET_RESPONSE_TIMEOUT = 4_i32
  end

  @[Extern]
  struct WSD_CONFIG_PARAM
    property configParamType : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM_TYPE
    property pConfigData : Void*
    property dwConfigDataSize : UInt32
    def initialize(@configParamType : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM_TYPE, @pConfigData : Void*, @dwConfigDataSize : UInt32)
    end
  end

  @[Extern]
  struct WSD_SECURITY_CERT_VALIDATION_V1
    property certMatchArray : Win32cr::Security::Cryptography::CERT_CONTEXT**
    property dwCertMatchArrayCount : UInt32
    property hCertMatchStore : Win32cr::Security::Cryptography::HCERTSTORE
    property hCertIssuerStore : Win32cr::Security::Cryptography::HCERTSTORE
    property dwCertCheckOptions : UInt32
    def initialize(@certMatchArray : Win32cr::Security::Cryptography::CERT_CONTEXT**, @dwCertMatchArrayCount : UInt32, @hCertMatchStore : Win32cr::Security::Cryptography::HCERTSTORE, @hCertIssuerStore : Win32cr::Security::Cryptography::HCERTSTORE, @dwCertCheckOptions : UInt32)
    end
  end

  @[Extern]
  struct WSD_SECURITY_CERT_VALIDATION
    property certMatchArray : Win32cr::Security::Cryptography::CERT_CONTEXT**
    property dwCertMatchArrayCount : UInt32
    property hCertMatchStore : Win32cr::Security::Cryptography::HCERTSTORE
    property hCertIssuerStore : Win32cr::Security::Cryptography::HCERTSTORE
    property dwCertCheckOptions : UInt32
    property pszCNGHashAlgId : Win32cr::Foundation::PWSTR
    property pbCertHash : UInt8*
    property dwCertHashSize : UInt32
    def initialize(@certMatchArray : Win32cr::Security::Cryptography::CERT_CONTEXT**, @dwCertMatchArrayCount : UInt32, @hCertMatchStore : Win32cr::Security::Cryptography::HCERTSTORE, @hCertIssuerStore : Win32cr::Security::Cryptography::HCERTSTORE, @dwCertCheckOptions : UInt32, @pszCNGHashAlgId : Win32cr::Foundation::PWSTR, @pbCertHash : UInt8*, @dwCertHashSize : UInt32)
    end
  end

  @[Extern]
  struct WSD_SECURITY_SIGNATURE_VALIDATION
    property signingCertArray : Win32cr::Security::Cryptography::CERT_CONTEXT**
    property dwSigningCertArrayCount : UInt32
    property hSigningCertStore : Win32cr::Security::Cryptography::HCERTSTORE
    property dwFlags : UInt32
    def initialize(@signingCertArray : Win32cr::Security::Cryptography::CERT_CONTEXT**, @dwSigningCertArrayCount : UInt32, @hSigningCertStore : Win32cr::Security::Cryptography::HCERTSTORE, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct WSD_CONFIG_ADDRESSES
    property addresses : Void**
    property dwAddressCount : UInt32
    def initialize(@addresses : Void**, @dwAddressCount : UInt32)
    end
  end

  @[Extern]
  struct WSDUdpRetransmitParams
    property ulSendDelay : UInt32
    property ulRepeat : UInt32
    property ulRepeatMinDelay : UInt32
    property ulRepeatMaxDelay : UInt32
    property ulRepeatUpperDelay : UInt32
    def initialize(@ulSendDelay : UInt32, @ulRepeat : UInt32, @ulRepeatMinDelay : UInt32, @ulRepeatMaxDelay : UInt32, @ulRepeatUpperDelay : UInt32)
    end
  end

  @[Extern]
  struct WSD_DATETIME
    property isPositive : Win32cr::Foundation::BOOL
    property year : UInt32
    property month : UInt8
    property day : UInt8
    property hour : UInt8
    property minute : UInt8
    property second : UInt8
    property millisecond : UInt32
    property tz_is_local : Win32cr::Foundation::BOOL
    property tz_is_positive : Win32cr::Foundation::BOOL
    property tz_hour : UInt8
    property tz_minute : UInt8
    def initialize(@isPositive : Win32cr::Foundation::BOOL, @year : UInt32, @month : UInt8, @day : UInt8, @hour : UInt8, @minute : UInt8, @second : UInt8, @millisecond : UInt32, @tz_is_local : Win32cr::Foundation::BOOL, @tz_is_positive : Win32cr::Foundation::BOOL, @tz_hour : UInt8, @tz_minute : UInt8)
    end
  end

  @[Extern]
  struct WSD_DURATION
    property isPositive : Win32cr::Foundation::BOOL
    property year : UInt32
    property month : UInt32
    property day : UInt32
    property hour : UInt32
    property minute : UInt32
    property second : UInt32
    property millisecond : UInt32
    def initialize(@isPositive : Win32cr::Foundation::BOOL, @year : UInt32, @month : UInt32, @day : UInt32, @hour : UInt32, @minute : UInt32, @second : UInt32, @millisecond : UInt32)
    end
  end

  @[Extern]
  struct WSDXML_NAMESPACE
    property uri : Win32cr::Foundation::PWSTR
    property preferred_prefix : Win32cr::Foundation::PWSTR
    property names : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property names_count : UInt16
    property encoding : UInt16
    def initialize(@uri : Win32cr::Foundation::PWSTR, @preferred_prefix : Win32cr::Foundation::PWSTR, @names : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @names_count : UInt16, @encoding : UInt16)
    end
  end

  @[Extern]
  struct WSDXML_NAME
    property space : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE*
    property local_name : Win32cr::Foundation::PWSTR
    def initialize(@space : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE*, @local_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WSDXML_TYPE
    property uri : Win32cr::Foundation::PWSTR
    property table : UInt8*
    def initialize(@uri : Win32cr::Foundation::PWSTR, @table : UInt8*)
    end
  end

  @[Extern]
  struct WSDXML_PREFIX_MAPPING
    property refs : UInt32
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_PREFIX_MAPPING*
    property space : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE*
    property prefix : Win32cr::Foundation::PWSTR
    def initialize(@refs : UInt32, @next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_PREFIX_MAPPING*, @space : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE*, @prefix : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WSDXML_ATTRIBUTE
    property element : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_ATTRIBUTE*
    property name : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property value : Win32cr::Foundation::PWSTR
    def initialize(@element : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, @next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_ATTRIBUTE*, @name : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @value : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WSDXML_NODE
    property type__ : Int32
    property parent : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE*
    def initialize(@type__ : Int32, @parent : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, @next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE*)
    end
  end

  @[Extern]
  struct WSDXML_ELEMENT
    property node : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE
    property name : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property first_attribute : Win32cr::Devices::WebServicesOnDevices::WSDXML_ATTRIBUTE*
    property first_child : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE*
    property prefix_mappings : Win32cr::Devices::WebServicesOnDevices::WSDXML_PREFIX_MAPPING*
    def initialize(@node : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE, @name : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @first_attribute : Win32cr::Devices::WebServicesOnDevices::WSDXML_ATTRIBUTE*, @first_child : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE*, @prefix_mappings : Win32cr::Devices::WebServicesOnDevices::WSDXML_PREFIX_MAPPING*)
    end
  end

  @[Extern]
  struct WSDXML_TEXT
    property node : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE
    property text : Win32cr::Foundation::PWSTR
    def initialize(@node : Win32cr::Devices::WebServicesOnDevices::WSDXML_NODE, @text : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WSDXML_ELEMENT_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT_LIST*
    property element : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT_LIST*, @element : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_OPERATION
    property request_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE*
    property response_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE*
    property request_stub_function : Win32cr::Devices::WebServicesOnDevices::WSD_STUB_FUNCTION
    def initialize(@request_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE*, @response_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE*, @request_stub_function : Win32cr::Devices::WebServicesOnDevices::WSD_STUB_FUNCTION)
    end
  end

  @[Extern]
  struct WSD_HANDLER_CONTEXT
    property handler : Win32cr::Devices::WebServicesOnDevices::PWSD_SOAP_MESSAGE_HANDLER
    property p_void : Void*
    property unknown : Void*
    def initialize(@handler : Win32cr::Devices::WebServicesOnDevices::PWSD_SOAP_MESSAGE_HANDLER, @p_void : Void*, @unknown : Void*)
    end
  end

  @[Extern]
  struct WSD_SYNCHRONOUS_RESPONSE_CONTEXT
    property hr : Win32cr::Foundation::HRESULT
    property eventHandle : Win32cr::Foundation::HANDLE
    property messageParameters : Void*
    property results : Void*
    def initialize(@hr : Win32cr::Foundation::HRESULT, @eventHandle : Win32cr::Foundation::HANDLE, @messageParameters : Void*, @results : Void*)
    end
  end

  @[Extern]
  struct WSD_PORT_TYPE
    property encoded_name : UInt32
    property operation_count : UInt32
    property operations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*
    property protocol_type : Win32cr::Devices::WebServicesOnDevices::WSD_PROTOCOL_TYPE
    def initialize(@encoded_name : UInt32, @operation_count : UInt32, @operations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, @protocol_type : Win32cr::Devices::WebServicesOnDevices::WSD_PROTOCOL_TYPE)
    end
  end

  @[Extern]
  struct WSD_RELATIONSHIP_METADATA
    property type__ : Win32cr::Foundation::PWSTR
    property data : Win32cr::Devices::WebServicesOnDevices::WSD_HOST_METADATA*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@type__ : Win32cr::Foundation::PWSTR, @data : Win32cr::Devices::WebServicesOnDevices::WSD_HOST_METADATA*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_SERVICE_METADATA_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA_LIST*
    property element : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA*
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA_LIST*, @element : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA*)
    end
  end

  @[Extern]
  struct WSD_HOST_METADATA
    property host : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA*
    property hosted : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA_LIST*
    def initialize(@host : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA*, @hosted : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA_LIST*)
    end
  end

  @[Extern]
  struct WSD_ENDPOINT_REFERENCE_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE_LIST*
    property element : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE_LIST*, @element : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*)
    end
  end

  @[Extern]
  struct WSD_SERVICE_METADATA
    property endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE_LIST*
    property types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*
    property service_id : Win32cr::Foundation::PWSTR
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE_LIST*, @types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, @service_id : Win32cr::Foundation::PWSTR, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_THIS_DEVICE_METADATA
    property friendly_name : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*
    property firmware_version : Win32cr::Foundation::PWSTR
    property serial_number : Win32cr::Foundation::PWSTR
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@friendly_name : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*, @firmware_version : Win32cr::Foundation::PWSTR, @serial_number : Win32cr::Foundation::PWSTR, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_THIS_MODEL_METADATA
    property manufacturer : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*
    property manufacturer_url : Win32cr::Foundation::PWSTR
    property model_name : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*
    property model_number : Win32cr::Foundation::PWSTR
    property model_url : Win32cr::Foundation::PWSTR
    property presentation_url : Win32cr::Foundation::PWSTR
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@manufacturer : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*, @manufacturer_url : Win32cr::Foundation::PWSTR, @model_name : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*, @model_number : Win32cr::Foundation::PWSTR, @model_url : Win32cr::Foundation::PWSTR, @presentation_url : Win32cr::Foundation::PWSTR, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_LOCALIZED_STRING_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*
    property element : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING*
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*, @element : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING*)
    end
  end

  @[Extern]
  struct WSD_SOAP_FAULT_REASON
    property text : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*
    def initialize(@text : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*)
    end
  end

  @[Extern]
  struct WSD_SOAP_FAULT_SUBCODE
    property value : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property subcode : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_SUBCODE*
    def initialize(@value : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @subcode : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_SUBCODE*)
    end
  end

  @[Extern]
  struct WSD_SOAP_FAULT_CODE
    property value : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property subcode : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_SUBCODE*
    def initialize(@value : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @subcode : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_SUBCODE*)
    end
  end

  @[Extern]
  struct WSD_SOAP_FAULT
    property code : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_CODE*
    property reason : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_REASON*
    property node : Win32cr::Foundation::PWSTR
    property role : Win32cr::Foundation::PWSTR
    property detail : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@code : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_CODE*, @reason : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT_REASON*, @node : Win32cr::Foundation::PWSTR, @role : Win32cr::Foundation::PWSTR, @detail : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_APP_SEQUENCE
    property instance_id : UInt64
    property sequence_id : Win32cr::Foundation::PWSTR
    property message_number : UInt64
    def initialize(@instance_id : UInt64, @sequence_id : Win32cr::Foundation::PWSTR, @message_number : UInt64)
    end
  end

  @[Extern]
  struct WSD_HEADER_RELATESTO
    property relationship_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property message_id : Win32cr::Foundation::PWSTR
    def initialize(@relationship_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @message_id : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WSD_SOAP_HEADER
    property to : Win32cr::Foundation::PWSTR
    property action : Win32cr::Foundation::PWSTR
    property message_id : Win32cr::Foundation::PWSTR
    property relates_to : Win32cr::Devices::WebServicesOnDevices::WSD_HEADER_RELATESTO
    property reply_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property from : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property fault_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property app_sequence : Win32cr::Devices::WebServicesOnDevices::WSD_APP_SEQUENCE*
    property any_headers : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@to : Win32cr::Foundation::PWSTR, @action : Win32cr::Foundation::PWSTR, @message_id : Win32cr::Foundation::PWSTR, @relates_to : Win32cr::Devices::WebServicesOnDevices::WSD_HEADER_RELATESTO, @reply_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @from : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @fault_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @app_sequence : Win32cr::Devices::WebServicesOnDevices::WSD_APP_SEQUENCE*, @any_headers : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_SOAP_MESSAGE
    property header : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_HEADER
    property body : Void*
    property body_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE*
    def initialize(@header : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_HEADER, @body : Void*, @body_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE*)
    end
  end

  @[Extern]
  struct WSD_RESOLVE_MATCHES
    property resolve_match : Win32cr::Devices::WebServicesOnDevices::WSD_RESOLVE_MATCH*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@resolve_match : Win32cr::Devices::WebServicesOnDevices::WSD_RESOLVE_MATCH*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_RESOLVE_MATCH
    property endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*
    property scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*
    property x_addrs : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*
    property metadata_version : UInt64
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, @scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*, @x_addrs : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, @metadata_version : UInt64, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_RESOLVE
    property endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_PROBE_MATCH
    property endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*
    property scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*
    property x_addrs : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*
    property metadata_version : UInt64
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, @scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*, @x_addrs : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, @metadata_version : UInt64, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_PROBE_MATCH_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSD_PROBE_MATCH_LIST*
    property element : Win32cr::Devices::WebServicesOnDevices::WSD_PROBE_MATCH*
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSD_PROBE_MATCH_LIST*, @element : Win32cr::Devices::WebServicesOnDevices::WSD_PROBE_MATCH*)
    end
  end

  @[Extern]
  struct WSD_PROBE_MATCHES
    property probe_match : Win32cr::Devices::WebServicesOnDevices::WSD_PROBE_MATCH_LIST*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@probe_match : Win32cr::Devices::WebServicesOnDevices::WSD_PROBE_MATCH_LIST*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_PROBE
    property types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*
    property scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, @scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_BYE
    property endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_SCOPES
    property match_by : Win32cr::Foundation::PWSTR
    property scopes : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*
    def initialize(@match_by : Win32cr::Foundation::PWSTR, @scopes : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*)
    end
  end

  @[Extern]
  struct WSD_NAME_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*
    property element : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, @element : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*)
    end
  end

  @[Extern]
  struct WSD_HELLO
    property endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*
    property scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*
    property x_addrs : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*
    property metadata_version : UInt64
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@endpoint_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @types : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, @scopes : Win32cr::Devices::WebServicesOnDevices::WSD_SCOPES*, @x_addrs : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, @metadata_version : UInt64, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_REFERENCE_PARAMETERS
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_REFERENCE_PROPERTIES
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_ENDPOINT_REFERENCE
    property address : Win32cr::Foundation::PWSTR
    property reference_properties : Win32cr::Devices::WebServicesOnDevices::WSD_REFERENCE_PROPERTIES
    property reference_parameters : Win32cr::Devices::WebServicesOnDevices::WSD_REFERENCE_PARAMETERS
    property port_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property service_name : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@address : Win32cr::Foundation::PWSTR, @reference_properties : Win32cr::Devices::WebServicesOnDevices::WSD_REFERENCE_PROPERTIES, @reference_parameters : Win32cr::Devices::WebServicesOnDevices::WSD_REFERENCE_PARAMETERS, @port_type : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @service_name : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_METADATA_SECTION
    property dialect : Win32cr::Foundation::PWSTR
    property identifier : Win32cr::Foundation::PWSTR
    property data : Void*
    property metadata_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property location : Win32cr::Foundation::PWSTR
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@dialect : Win32cr::Foundation::PWSTR, @identifier : Win32cr::Foundation::PWSTR, @data : Void*, @metadata_reference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @location : Win32cr::Foundation::PWSTR, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_METADATA_SECTION_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST*
    property element : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION*
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST*, @element : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION*)
    end
  end

  @[Extern]
  struct WSD_URI_LIST
    property next__ : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*
    property element : Win32cr::Foundation::PWSTR
    def initialize(@next__ : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, @element : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WSD_EVENTING_FILTER_ACTION
    property actions : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*
    def initialize(@actions : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*)
    end
  end

  @[Extern]
  struct WSD_EVENTING_FILTER
    property dialect : Win32cr::Foundation::PWSTR
    property filter_action : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_FILTER_ACTION*
    property data : Void*
    def initialize(@dialect : Win32cr::Foundation::PWSTR, @filter_action : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_FILTER_ACTION*, @data : Void*)
    end
  end

  @[Extern]
  struct WSD_EVENTING_EXPIRES
    property duration : Win32cr::Devices::WebServicesOnDevices::WSD_DURATION*
    property date_time : Win32cr::Devices::WebServicesOnDevices::WSD_DATETIME*
    def initialize(@duration : Win32cr::Devices::WebServicesOnDevices::WSD_DURATION*, @date_time : Win32cr::Devices::WebServicesOnDevices::WSD_DATETIME*)
    end
  end

  @[Extern]
  struct WSD_EVENTING_DELIVERY_MODE_PUSH
    property notify_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    def initialize(@notify_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*)
    end
  end

  @[Extern]
  struct WSD_EVENTING_DELIVERY_MODE
    property mode : Win32cr::Foundation::PWSTR
    property push : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_DELIVERY_MODE_PUSH*
    property data : Void*
    def initialize(@mode : Win32cr::Foundation::PWSTR, @push : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_DELIVERY_MODE_PUSH*, @data : Void*)
    end
  end

  @[Extern]
  struct WSD_LOCALIZED_STRING
    property lang : Win32cr::Foundation::PWSTR
    property string : Win32cr::Foundation::PWSTR
    def initialize(@lang : Win32cr::Foundation::PWSTR, @string : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct RESPONSEBODY_GetMetadata
    property metadata : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST*
    def initialize(@metadata : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST*)
    end
  end

  @[Extern]
  struct REQUESTBODY_Subscribe
    property end_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property delivery : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_DELIVERY_MODE*
    property expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*
    property filter : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_FILTER*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@end_to : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @delivery : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_DELIVERY_MODE*, @expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, @filter : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_FILTER*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct RESPONSEBODY_Subscribe
    property subscription_manager : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@subscription_manager : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct REQUESTBODY_Renew
    property expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct RESPONSEBODY_Renew
    property expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct REQUESTBODY_GetStatus
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct RESPONSEBODY_GetStatus
    property expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@expires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct REQUESTBODY_Unsubscribe
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct RESPONSEBODY_SubscriptionEnd
    property subscription_manager : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*
    property status : Win32cr::Foundation::PWSTR
    property reason : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING*
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@subscription_manager : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE*, @status : Win32cr::Foundation::PWSTR, @reason : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING*, @any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_UNKNOWN_LOOKUP
    property any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*
    def initialize(@any : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*)
    end
  end

  @[Extern]
  struct WSD_EVENT
    property hr : Win32cr::Foundation::HRESULT
    property event_type : UInt32
    property dispatch_tag : Win32cr::Foundation::PWSTR
    property handler_context : Win32cr::Devices::WebServicesOnDevices::WSD_HANDLER_CONTEXT
    property soap : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*
    property operation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*
    property message_parameters : Void*
    def initialize(@hr : Win32cr::Foundation::HRESULT, @event_type : UInt32, @dispatch_tag : Win32cr::Foundation::PWSTR, @handler_context : Win32cr::Devices::WebServicesOnDevices::WSD_HANDLER_CONTEXT, @soap : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, @operation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, @message_parameters : Void*)
    end
  end

  @[Extern]
  record IWSDAddressVtbl,
    query_interface : Proc(IWSDAddress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDAddress*, UInt32),
    release : Proc(IWSDAddress*, UInt32),
    serialize : Proc(IWSDAddress*, UInt16*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    deserialize : Proc(IWSDAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDAddress, lpVtbl : IWSDAddressVtbl* do
    GUID = LibC::GUID.new(0xb9574c6c_u32, 0x12a6_u16, 0x4f74_u16, StaticArray[0x93_u8, 0xa1_u8, 0x33_u8, 0x18_u8, 0xff_u8, 0x60_u8, 0x57_u8, 0x59_u8])
    def query_interface(this : IWSDAddress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDAddress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDAddress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : IWSDAddress*, pszBuffer : UInt16*, cchLength : UInt32, fSafe : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pszBuffer, cchLength, fSafe)
    end
    def deserialize(this : IWSDAddress*, pszBuffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deserialize.call(this, pszBuffer)
    end

  end

  @[Extern]
  record IWSDTransportAddressVtbl,
    query_interface : Proc(IWSDTransportAddress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDTransportAddress*, UInt32),
    release : Proc(IWSDTransportAddress*, UInt32),
    serialize : Proc(IWSDTransportAddress*, UInt16*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    deserialize : Proc(IWSDTransportAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_port : Proc(IWSDTransportAddress*, UInt16*, Win32cr::Foundation::HRESULT),
    set_port : Proc(IWSDTransportAddress*, UInt16, Win32cr::Foundation::HRESULT),
    get_transport_address : Proc(IWSDTransportAddress*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_transport_address_ex : Proc(IWSDTransportAddress*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transport_address : Proc(IWSDTransportAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDTransportAddress, lpVtbl : IWSDTransportAddressVtbl* do
    GUID = LibC::GUID.new(0x70d23498_u32, 0x4ee6_u16, 0x4340_u16, StaticArray[0xa3_u8, 0xdf_u8, 0xd8_u8, 0x45_u8, 0xd2_u8, 0x23_u8, 0x54_u8, 0x67_u8])
    def query_interface(this : IWSDTransportAddress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDTransportAddress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDTransportAddress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : IWSDTransportAddress*, pszBuffer : UInt16*, cchLength : UInt32, fSafe : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pszBuffer, cchLength, fSafe)
    end
    def deserialize(this : IWSDTransportAddress*, pszBuffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deserialize.call(this, pszBuffer)
    end
    def get_port(this : IWSDTransportAddress*, pwPort : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port.call(this, pwPort)
    end
    def set_port(this : IWSDTransportAddress*, wPort : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_port.call(this, wPort)
    end
    def get_transport_address(this : IWSDTransportAddress*, ppszAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_address.call(this, ppszAddress)
    end
    def get_transport_address_ex(this : IWSDTransportAddress*, fSafe : Win32cr::Foundation::BOOL, ppszAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_address_ex.call(this, fSafe, ppszAddress)
    end
    def set_transport_address(this : IWSDTransportAddress*, pszAddress : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transport_address.call(this, pszAddress)
    end

  end

  @[Extern]
  record IWSDMessageParametersVtbl,
    query_interface : Proc(IWSDMessageParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDMessageParameters*, UInt32),
    release : Proc(IWSDMessageParameters*, UInt32),
    get_local_address : Proc(IWSDMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_local_address : Proc(IWSDMessageParameters*, Void*, Win32cr::Foundation::HRESULT),
    get_remote_address : Proc(IWSDMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_remote_address : Proc(IWSDMessageParameters*, Void*, Win32cr::Foundation::HRESULT),
    get_lower_parameters : Proc(IWSDMessageParameters*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDMessageParameters, lpVtbl : IWSDMessageParametersVtbl* do
    GUID = LibC::GUID.new(0x1fafe8a2_u32, 0xe6fc_u16, 0x4b80_u16, StaticArray[0xb6_u8, 0xcf_u8, 0xb7_u8, 0xd4_u8, 0x5c_u8, 0x41_u8, 0x6d_u8, 0x7c_u8])
    def query_interface(this : IWSDMessageParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDMessageParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDMessageParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_local_address(this : IWSDMessageParameters*, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_address.call(this, ppAddress)
    end
    def set_local_address(this : IWSDMessageParameters*, pAddress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_address.call(this, pAddress)
    end
    def get_remote_address(this : IWSDMessageParameters*, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_address.call(this, ppAddress)
    end
    def set_remote_address(this : IWSDMessageParameters*, pAddress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_address.call(this, pAddress)
    end
    def get_lower_parameters(this : IWSDMessageParameters*, ppTxParams : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lower_parameters.call(this, ppTxParams)
    end

  end

  @[Extern]
  record IWSDUdpMessageParametersVtbl,
    query_interface : Proc(IWSDUdpMessageParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDUdpMessageParameters*, UInt32),
    release : Proc(IWSDUdpMessageParameters*, UInt32),
    get_local_address : Proc(IWSDUdpMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_local_address : Proc(IWSDUdpMessageParameters*, Void*, Win32cr::Foundation::HRESULT),
    get_remote_address : Proc(IWSDUdpMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_remote_address : Proc(IWSDUdpMessageParameters*, Void*, Win32cr::Foundation::HRESULT),
    get_lower_parameters : Proc(IWSDUdpMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_retransmit_params : Proc(IWSDUdpMessageParameters*, Win32cr::Devices::WebServicesOnDevices::WSDUdpRetransmitParams*, Win32cr::Foundation::HRESULT),
    get_retransmit_params : Proc(IWSDUdpMessageParameters*, Win32cr::Devices::WebServicesOnDevices::WSDUdpRetransmitParams*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDUdpMessageParameters, lpVtbl : IWSDUdpMessageParametersVtbl* do
    GUID = LibC::GUID.new(0x9934149f_u32, 0x8f0c_u16, 0x447b_u16, StaticArray[0xaa_u8, 0xb_u8, 0x73_u8, 0x12_u8, 0x4b_u8, 0xc_u8, 0xa7_u8, 0xf0_u8])
    def query_interface(this : IWSDUdpMessageParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDUdpMessageParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDUdpMessageParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_local_address(this : IWSDUdpMessageParameters*, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_address.call(this, ppAddress)
    end
    def set_local_address(this : IWSDUdpMessageParameters*, pAddress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_address.call(this, pAddress)
    end
    def get_remote_address(this : IWSDUdpMessageParameters*, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_address.call(this, ppAddress)
    end
    def set_remote_address(this : IWSDUdpMessageParameters*, pAddress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_address.call(this, pAddress)
    end
    def get_lower_parameters(this : IWSDUdpMessageParameters*, ppTxParams : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lower_parameters.call(this, ppTxParams)
    end
    def set_retransmit_params(this : IWSDUdpMessageParameters*, pParams : Win32cr::Devices::WebServicesOnDevices::WSDUdpRetransmitParams*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_retransmit_params.call(this, pParams)
    end
    def get_retransmit_params(this : IWSDUdpMessageParameters*, pParams : Win32cr::Devices::WebServicesOnDevices::WSDUdpRetransmitParams*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_retransmit_params.call(this, pParams)
    end

  end

  @[Extern]
  record IWSDUdpAddressVtbl,
    query_interface : Proc(IWSDUdpAddress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDUdpAddress*, UInt32),
    release : Proc(IWSDUdpAddress*, UInt32),
    serialize : Proc(IWSDUdpAddress*, UInt16*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    deserialize : Proc(IWSDUdpAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_port : Proc(IWSDUdpAddress*, UInt16*, Win32cr::Foundation::HRESULT),
    set_port : Proc(IWSDUdpAddress*, UInt16, Win32cr::Foundation::HRESULT),
    get_transport_address : Proc(IWSDUdpAddress*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_transport_address_ex : Proc(IWSDUdpAddress*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transport_address : Proc(IWSDUdpAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_sockaddr : Proc(IWSDUdpAddress*, Win32cr::Networking::WinSock::SOCKADDR_STORAGE*, Win32cr::Foundation::HRESULT),
    get_sockaddr : Proc(IWSDUdpAddress*, Win32cr::Networking::WinSock::SOCKADDR_STORAGE*, Win32cr::Foundation::HRESULT),
    set_exclusive : Proc(IWSDUdpAddress*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_exclusive : Proc(IWSDUdpAddress*, Win32cr::Foundation::HRESULT),
    set_message_type : Proc(IWSDUdpAddress*, Win32cr::Devices::WebServicesOnDevices::WSDUdpMessageType, Win32cr::Foundation::HRESULT),
    get_message_type : Proc(IWSDUdpAddress*, Win32cr::Devices::WebServicesOnDevices::WSDUdpMessageType*, Win32cr::Foundation::HRESULT),
    set_ttl : Proc(IWSDUdpAddress*, UInt32, Win32cr::Foundation::HRESULT),
    get_ttl : Proc(IWSDUdpAddress*, UInt32*, Win32cr::Foundation::HRESULT),
    set_alias : Proc(IWSDUdpAddress*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_alias : Proc(IWSDUdpAddress*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDUdpAddress, lpVtbl : IWSDUdpAddressVtbl* do
    GUID = LibC::GUID.new(0x74d6124a_u32, 0xa441_u16, 0x4f78_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x97_u8, 0xa8_u8, 0xd1_u8, 0x99_u8, 0x68_u8, 0x93_u8])
    def query_interface(this : IWSDUdpAddress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDUdpAddress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDUdpAddress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : IWSDUdpAddress*, pszBuffer : UInt16*, cchLength : UInt32, fSafe : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pszBuffer, cchLength, fSafe)
    end
    def deserialize(this : IWSDUdpAddress*, pszBuffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deserialize.call(this, pszBuffer)
    end
    def get_port(this : IWSDUdpAddress*, pwPort : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port.call(this, pwPort)
    end
    def set_port(this : IWSDUdpAddress*, wPort : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_port.call(this, wPort)
    end
    def get_transport_address(this : IWSDUdpAddress*, ppszAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_address.call(this, ppszAddress)
    end
    def get_transport_address_ex(this : IWSDUdpAddress*, fSafe : Win32cr::Foundation::BOOL, ppszAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_address_ex.call(this, fSafe, ppszAddress)
    end
    def set_transport_address(this : IWSDUdpAddress*, pszAddress : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transport_address.call(this, pszAddress)
    end
    def set_sockaddr(this : IWSDUdpAddress*, pSockAddr : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sockaddr.call(this, pSockAddr)
    end
    def get_sockaddr(this : IWSDUdpAddress*, pSockAddr : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sockaddr.call(this, pSockAddr)
    end
    def set_exclusive(this : IWSDUdpAddress*, fExclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_exclusive.call(this, fExclusive)
    end
    def get_exclusive(this : IWSDUdpAddress*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exclusive.call(this)
    end
    def set_message_type(this : IWSDUdpAddress*, messageType : Win32cr::Devices::WebServicesOnDevices::WSDUdpMessageType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_message_type.call(this, messageType)
    end
    def get_message_type(this : IWSDUdpAddress*, pMessageType : Win32cr::Devices::WebServicesOnDevices::WSDUdpMessageType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message_type.call(this, pMessageType)
    end
    def set_ttl(this : IWSDUdpAddress*, dwTTL : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_ttl.call(this, dwTTL)
    end
    def get_ttl(this : IWSDUdpAddress*, pdwTTL : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ttl.call(this, pdwTTL)
    end
    def set_alias(this : IWSDUdpAddress*, pAlias : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alias.call(this, pAlias)
    end
    def get_alias(this : IWSDUdpAddress*, pAlias : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alias.call(this, pAlias)
    end

  end

  @[Extern]
  record IWSDHttpMessageParametersVtbl,
    query_interface : Proc(IWSDHttpMessageParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDHttpMessageParameters*, UInt32),
    release : Proc(IWSDHttpMessageParameters*, UInt32),
    get_local_address : Proc(IWSDHttpMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_local_address : Proc(IWSDHttpMessageParameters*, Void*, Win32cr::Foundation::HRESULT),
    get_remote_address : Proc(IWSDHttpMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_remote_address : Proc(IWSDHttpMessageParameters*, Void*, Win32cr::Foundation::HRESULT),
    get_lower_parameters : Proc(IWSDHttpMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    set_inbound_http_headers : Proc(IWSDHttpMessageParameters*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_inbound_http_headers : Proc(IWSDHttpMessageParameters*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_outbound_http_headers : Proc(IWSDHttpMessageParameters*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_outbound_http_headers : Proc(IWSDHttpMessageParameters*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_id : Proc(IWSDHttpMessageParameters*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_id : Proc(IWSDHttpMessageParameters*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_context : Proc(IWSDHttpMessageParameters*, Void*, Win32cr::Foundation::HRESULT),
    get_context : Proc(IWSDHttpMessageParameters*, Void**, Win32cr::Foundation::HRESULT),
    clear : Proc(IWSDHttpMessageParameters*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDHttpMessageParameters, lpVtbl : IWSDHttpMessageParametersVtbl* do
    GUID = LibC::GUID.new(0x540bd122_u32, 0x5c83_u16, 0x4dec_u16, StaticArray[0xb3_u8, 0x96_u8, 0xea_u8, 0x62_u8, 0xa2_u8, 0x69_u8, 0x7f_u8, 0xdf_u8])
    def query_interface(this : IWSDHttpMessageParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDHttpMessageParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDHttpMessageParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_local_address(this : IWSDHttpMessageParameters*, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_address.call(this, ppAddress)
    end
    def set_local_address(this : IWSDHttpMessageParameters*, pAddress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_address.call(this, pAddress)
    end
    def get_remote_address(this : IWSDHttpMessageParameters*, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_address.call(this, ppAddress)
    end
    def set_remote_address(this : IWSDHttpMessageParameters*, pAddress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remote_address.call(this, pAddress)
    end
    def get_lower_parameters(this : IWSDHttpMessageParameters*, ppTxParams : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lower_parameters.call(this, ppTxParams)
    end
    def set_inbound_http_headers(this : IWSDHttpMessageParameters*, pszHeaders : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_inbound_http_headers.call(this, pszHeaders)
    end
    def get_inbound_http_headers(this : IWSDHttpMessageParameters*, ppszHeaders : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inbound_http_headers.call(this, ppszHeaders)
    end
    def set_outbound_http_headers(this : IWSDHttpMessageParameters*, pszHeaders : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_outbound_http_headers.call(this, pszHeaders)
    end
    def get_outbound_http_headers(this : IWSDHttpMessageParameters*, ppszHeaders : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_outbound_http_headers.call(this, ppszHeaders)
    end
    def set_id(this : IWSDHttpMessageParameters*, pszId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_id.call(this, pszId)
    end
    def get_id(this : IWSDHttpMessageParameters*, ppszId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, ppszId)
    end
    def set_context(this : IWSDHttpMessageParameters*, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_context.call(this, pContext)
    end
    def get_context(this : IWSDHttpMessageParameters*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, ppContext)
    end
    def clear(this : IWSDHttpMessageParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IWSDHttpAddressVtbl,
    query_interface : Proc(IWSDHttpAddress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDHttpAddress*, UInt32),
    release : Proc(IWSDHttpAddress*, UInt32),
    serialize : Proc(IWSDHttpAddress*, UInt16*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    deserialize : Proc(IWSDHttpAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_port : Proc(IWSDHttpAddress*, UInt16*, Win32cr::Foundation::HRESULT),
    set_port : Proc(IWSDHttpAddress*, UInt16, Win32cr::Foundation::HRESULT),
    get_transport_address : Proc(IWSDHttpAddress*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_transport_address_ex : Proc(IWSDHttpAddress*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transport_address : Proc(IWSDHttpAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_secure : Proc(IWSDHttpAddress*, Win32cr::Foundation::HRESULT),
    set_secure : Proc(IWSDHttpAddress*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_path : Proc(IWSDHttpAddress*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_path : Proc(IWSDHttpAddress*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDHttpAddress, lpVtbl : IWSDHttpAddressVtbl* do
    GUID = LibC::GUID.new(0xd09ac7bd_u32, 0x2a3e_u16, 0x4b85_u16, StaticArray[0x86_u8, 0x5_u8, 0x27_u8, 0x37_u8, 0xff_u8, 0x3e_u8, 0x4e_u8, 0xa0_u8])
    def query_interface(this : IWSDHttpAddress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDHttpAddress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDHttpAddress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : IWSDHttpAddress*, pszBuffer : UInt16*, cchLength : UInt32, fSafe : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pszBuffer, cchLength, fSafe)
    end
    def deserialize(this : IWSDHttpAddress*, pszBuffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deserialize.call(this, pszBuffer)
    end
    def get_port(this : IWSDHttpAddress*, pwPort : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port.call(this, pwPort)
    end
    def set_port(this : IWSDHttpAddress*, wPort : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_port.call(this, wPort)
    end
    def get_transport_address(this : IWSDHttpAddress*, ppszAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_address.call(this, ppszAddress)
    end
    def get_transport_address_ex(this : IWSDHttpAddress*, fSafe : Win32cr::Foundation::BOOL, ppszAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_address_ex.call(this, fSafe, ppszAddress)
    end
    def set_transport_address(this : IWSDHttpAddress*, pszAddress : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transport_address.call(this, pszAddress)
    end
    def get_secure(this : IWSDHttpAddress*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_secure.call(this)
    end
    def set_secure(this : IWSDHttpAddress*, fSecure : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_secure.call(this, fSecure)
    end
    def get_path(this : IWSDHttpAddress*, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, ppszPath)
    end
    def set_path(this : IWSDHttpAddress*, pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_path.call(this, pszPath)
    end

  end

  @[Extern]
  record IWSDSSLClientCertificateVtbl,
    query_interface : Proc(IWSDSSLClientCertificate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDSSLClientCertificate*, UInt32),
    release : Proc(IWSDSSLClientCertificate*, UInt32),
    get_client_certificate : Proc(IWSDSSLClientCertificate*, Win32cr::Security::Cryptography::CERT_CONTEXT**, Win32cr::Foundation::HRESULT),
    get_mapped_access_token : Proc(IWSDSSLClientCertificate*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDSSLClientCertificate, lpVtbl : IWSDSSLClientCertificateVtbl* do
    GUID = LibC::GUID.new(0xde105e87_u32, 0xa0da_u16, 0x418e_u16, StaticArray[0x98_u8, 0xad_u8, 0x27_u8, 0xb9_u8, 0xee_u8, 0xd8_u8, 0x7b_u8, 0xdc_u8])
    def query_interface(this : IWSDSSLClientCertificate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDSSLClientCertificate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDSSLClientCertificate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_client_certificate(this : IWSDSSLClientCertificate*, ppCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_certificate.call(this, ppCertContext)
    end
    def get_mapped_access_token(this : IWSDSSLClientCertificate*, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mapped_access_token.call(this, phToken)
    end

  end

  @[Extern]
  record IWSDHttpAuthParametersVtbl,
    query_interface : Proc(IWSDHttpAuthParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDHttpAuthParameters*, UInt32),
    release : Proc(IWSDHttpAuthParameters*, UInt32),
    get_client_access_token : Proc(IWSDHttpAuthParameters*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_auth_type : Proc(IWSDHttpAuthParameters*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDHttpAuthParameters, lpVtbl : IWSDHttpAuthParametersVtbl* do
    GUID = LibC::GUID.new(0xb476df0_u32, 0x8dac_u16, 0x480d_u16, StaticArray[0xb0_u8, 0x5c_u8, 0x99_u8, 0x78_u8, 0x1a_u8, 0x58_u8, 0x84_u8, 0xaa_u8])
    def query_interface(this : IWSDHttpAuthParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDHttpAuthParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDHttpAuthParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_client_access_token(this : IWSDHttpAuthParameters*, phToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_access_token.call(this, phToken)
    end
    def get_auth_type(this : IWSDHttpAuthParameters*, pAuthType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_auth_type.call(this, pAuthType)
    end

  end

  @[Extern]
  record IWSDSignaturePropertyVtbl,
    query_interface : Proc(IWSDSignatureProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDSignatureProperty*, UInt32),
    release : Proc(IWSDSignatureProperty*, UInt32),
    is_message_signed : Proc(IWSDSignatureProperty*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_message_signature_trusted : Proc(IWSDSignatureProperty*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_key_info : Proc(IWSDSignatureProperty*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_signature : Proc(IWSDSignatureProperty*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_signed_info_hash : Proc(IWSDSignatureProperty*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDSignatureProperty, lpVtbl : IWSDSignaturePropertyVtbl* do
    GUID = LibC::GUID.new(0x3ce20aa_u32, 0x71c4_u16, 0x45e2_u16, StaticArray[0xb3_u8, 0x2e_u8, 0x37_u8, 0x66_u8, 0xc6_u8, 0x1c_u8, 0x79_u8, 0xf_u8])
    def query_interface(this : IWSDSignatureProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDSignatureProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDSignatureProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_message_signed(this : IWSDSignatureProperty*, pbSigned : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_message_signed.call(this, pbSigned)
    end
    def is_message_signature_trusted(this : IWSDSignatureProperty*, pbSignatureTrusted : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_message_signature_trusted.call(this, pbSignatureTrusted)
    end
    def get_key_info(this : IWSDSignatureProperty*, pbKeyInfo : UInt8*, pdwKeyInfoSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_key_info.call(this, pbKeyInfo, pdwKeyInfoSize)
    end
    def get_signature(this : IWSDSignatureProperty*, pbSignature : UInt8*, pdwSignatureSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature.call(this, pbSignature, pdwSignatureSize)
    end
    def get_signed_info_hash(this : IWSDSignatureProperty*, pbSignedInfoHash : UInt8*, pdwHashSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signed_info_hash.call(this, pbSignedInfoHash, pdwHashSize)
    end

  end

  @[Extern]
  record IWSDAttachmentVtbl,
    query_interface : Proc(IWSDAttachment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDAttachment*, UInt32),
    release : Proc(IWSDAttachment*, UInt32)


  @[Extern]
  record IWSDAttachment, lpVtbl : IWSDAttachmentVtbl* do
    GUID = LibC::GUID.new(0x5d55a616_u32, 0x9df8_u16, 0x4b09_u16, StaticArray[0xb1_u8, 0x56_u8, 0x9b_u8, 0xa3_u8, 0x51_u8, 0xa4_u8, 0x8b_u8, 0x76_u8])
    def query_interface(this : IWSDAttachment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDAttachment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDAttachment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IWSDOutboundAttachmentVtbl,
    query_interface : Proc(IWSDOutboundAttachment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDOutboundAttachment*, UInt32),
    release : Proc(IWSDOutboundAttachment*, UInt32),
    write : Proc(IWSDOutboundAttachment*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    close : Proc(IWSDOutboundAttachment*, Win32cr::Foundation::HRESULT),
    abort : Proc(IWSDOutboundAttachment*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDOutboundAttachment, lpVtbl : IWSDOutboundAttachmentVtbl* do
    GUID = LibC::GUID.new(0xaa302f8d_u32, 0x5a22_u16, 0x4ba5_u16, StaticArray[0xb3_u8, 0x92_u8, 0xaa_u8, 0x84_u8, 0x86_u8, 0xf4_u8, 0xc1_u8, 0x5d_u8])
    def query_interface(this : IWSDOutboundAttachment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDOutboundAttachment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDOutboundAttachment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def write(this : IWSDOutboundAttachment*, pBuffer : UInt8*, dwBytesToWrite : UInt32, pdwNumberOfBytesWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pBuffer, dwBytesToWrite, pdwNumberOfBytesWritten)
    end
    def close(this : IWSDOutboundAttachment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def abort(this : IWSDOutboundAttachment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end

  end

  @[Extern]
  record IWSDInboundAttachmentVtbl,
    query_interface : Proc(IWSDInboundAttachment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDInboundAttachment*, UInt32),
    release : Proc(IWSDInboundAttachment*, UInt32),
    read : Proc(IWSDInboundAttachment*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    close : Proc(IWSDInboundAttachment*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDInboundAttachment, lpVtbl : IWSDInboundAttachmentVtbl* do
    GUID = LibC::GUID.new(0x5bd6ca65_u32, 0x233c_u16, 0x4fb8_u16, StaticArray[0x9f_u8, 0x7a_u8, 0x26_u8, 0x41_u8, 0x61_u8, 0x96_u8, 0x55_u8, 0xc9_u8])
    def query_interface(this : IWSDInboundAttachment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDInboundAttachment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDInboundAttachment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IWSDInboundAttachment*, pBuffer : UInt8*, dwBytesToRead : UInt32, pdwNumberOfBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pBuffer, dwBytesToRead, pdwNumberOfBytesRead)
    end
    def close(this : IWSDInboundAttachment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IWSDXMLContextVtbl,
    query_interface : Proc(IWSDXMLContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDXMLContext*, UInt32),
    release : Proc(IWSDXMLContext*, UInt32),
    add_namespace : Proc(IWSDXMLContext*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE**, Win32cr::Foundation::HRESULT),
    add_name_to_namespace : Proc(IWSDXMLContext*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME**, Win32cr::Foundation::HRESULT),
    set_namespaces : Proc(IWSDXMLContext*, Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE**, UInt16, UInt8, Win32cr::Foundation::HRESULT),
    set_types : Proc(IWSDXMLContext*, Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE**, UInt32, UInt8, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDXMLContext, lpVtbl : IWSDXMLContextVtbl* do
    GUID = LibC::GUID.new(0x75d8f3ee_u32, 0x3e5a_u16, 0x43b4_u16, StaticArray[0xa1_u8, 0x5a_u8, 0xbc_u8, 0xf6_u8, 0x88_u8, 0x74_u8, 0x60_u8, 0xc0_u8])
    def query_interface(this : IWSDXMLContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDXMLContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDXMLContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_namespace(this : IWSDXMLContext*, pszUri : Win32cr::Foundation::PWSTR, pszSuggestedPrefix : Win32cr::Foundation::PWSTR, ppNamespace : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_namespace.call(this, pszUri, pszSuggestedPrefix, ppNamespace)
    end
    def add_name_to_namespace(this : IWSDXMLContext*, pszUri : Win32cr::Foundation::PWSTR, pszName : Win32cr::Foundation::PWSTR, ppName : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_name_to_namespace.call(this, pszUri, pszName, ppName)
    end
    def set_namespaces(this : IWSDXMLContext*, pNamespaces : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAMESPACE**, wNamespacesCount : UInt16, bLayerNumber : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_namespaces.call(this, pNamespaces, wNamespacesCount, bLayerNumber)
    end
    def set_types(this : IWSDXMLContext*, pTypes : Win32cr::Devices::WebServicesOnDevices::WSDXML_TYPE**, dwTypesCount : UInt32, bLayerNumber : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_types.call(this, pTypes, dwTypesCount, bLayerNumber)
    end

  end

  @[Extern]
  record IWSDiscoveryProviderVtbl,
    query_interface : Proc(IWSDiscoveryProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDiscoveryProvider*, UInt32),
    release : Proc(IWSDiscoveryProvider*, UInt32),
    set_address_family : Proc(IWSDiscoveryProvider*, UInt32, Win32cr::Foundation::HRESULT),
    attach : Proc(IWSDiscoveryProvider*, Void*, Win32cr::Foundation::HRESULT),
    detach : Proc(IWSDiscoveryProvider*, Win32cr::Foundation::HRESULT),
    search_by_id : Proc(IWSDiscoveryProvider*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    search_by_address : Proc(IWSDiscoveryProvider*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    search_by_type : Proc(IWSDiscoveryProvider*, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_xml_context : Proc(IWSDiscoveryProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDiscoveryProvider, lpVtbl : IWSDiscoveryProviderVtbl* do
    GUID = LibC::GUID.new(0x8ffc8e55_u32, 0xf0eb_u16, 0x480f_u16, StaticArray[0x88_u8, 0xb7_u8, 0xb4_u8, 0x35_u8, 0xdd_u8, 0x28_u8, 0x1d_u8, 0x45_u8])
    def query_interface(this : IWSDiscoveryProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDiscoveryProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDiscoveryProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_address_family(this : IWSDiscoveryProvider*, dwAddressFamily : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_address_family.call(this, dwAddressFamily)
    end
    def attach(this : IWSDiscoveryProvider*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach.call(this, pSink)
    end
    def detach(this : IWSDiscoveryProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detach.call(this)
    end
    def search_by_id(this : IWSDiscoveryProvider*, pszId : Win32cr::Foundation::PWSTR, pszTag : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_by_id.call(this, pszId, pszTag)
    end
    def search_by_address(this : IWSDiscoveryProvider*, pszAddress : Win32cr::Foundation::PWSTR, pszTag : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_by_address.call(this, pszAddress, pszTag)
    end
    def search_by_type(this : IWSDiscoveryProvider*, pTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, pScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pszMatchBy : Win32cr::Foundation::PWSTR, pszTag : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_by_type.call(this, pTypesList, pScopesList, pszMatchBy, pszTag)
    end
    def get_xml_context(this : IWSDiscoveryProvider*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_context.call(this, ppContext)
    end

  end

  @[Extern]
  record IWSDiscoveryProviderNotifyVtbl,
    query_interface : Proc(IWSDiscoveryProviderNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDiscoveryProviderNotify*, UInt32),
    release : Proc(IWSDiscoveryProviderNotify*, UInt32),
    add : Proc(IWSDiscoveryProviderNotify*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IWSDiscoveryProviderNotify*, Void*, Win32cr::Foundation::HRESULT),
    search_failed : Proc(IWSDiscoveryProviderNotify*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    search_complete : Proc(IWSDiscoveryProviderNotify*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDiscoveryProviderNotify, lpVtbl : IWSDiscoveryProviderNotifyVtbl* do
    GUID = LibC::GUID.new(0x73ee3ced_u32, 0xb6e6_u16, 0x4329_u16, StaticArray[0xa5_u8, 0x46_u8, 0x3e_u8, 0x8a_u8, 0xd4_u8, 0x65_u8, 0x63_u8, 0xd2_u8])
    def query_interface(this : IWSDiscoveryProviderNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDiscoveryProviderNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDiscoveryProviderNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add(this : IWSDiscoveryProviderNotify*, pService : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pService)
    end
    def remove(this : IWSDiscoveryProviderNotify*, pService : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, pService)
    end
    def search_failed(this : IWSDiscoveryProviderNotify*, hr : Win32cr::Foundation::HRESULT, pszTag : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_failed.call(this, hr, pszTag)
    end
    def search_complete(this : IWSDiscoveryProviderNotify*, pszTag : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_complete.call(this, pszTag)
    end

  end

  @[Extern]
  record IWSDiscoveredServiceVtbl,
    query_interface : Proc(IWSDiscoveredService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDiscoveredService*, UInt32),
    release : Proc(IWSDiscoveredService*, UInt32),
    get_endpoint_reference : Proc(IWSDiscoveredService*, Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE**, Win32cr::Foundation::HRESULT),
    get_types : Proc(IWSDiscoveredService*, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST**, Win32cr::Foundation::HRESULT),
    get_scopes : Proc(IWSDiscoveredService*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST**, Win32cr::Foundation::HRESULT),
    get_x_addrs : Proc(IWSDiscoveredService*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST**, Win32cr::Foundation::HRESULT),
    get_metadata_version : Proc(IWSDiscoveredService*, UInt64*, Win32cr::Foundation::HRESULT),
    get_extended_disco_xml : Proc(IWSDiscoveredService*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    get_probe_resolve_tag : Proc(IWSDiscoveredService*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_remote_transport_address : Proc(IWSDiscoveredService*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_transport_address : Proc(IWSDiscoveredService*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_local_interface_guid : Proc(IWSDiscoveredService*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_instance_id : Proc(IWSDiscoveredService*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDiscoveredService, lpVtbl : IWSDiscoveredServiceVtbl* do
    GUID = LibC::GUID.new(0x4bad8a3b_u32, 0xb374_u16, 0x4420_u16, StaticArray[0x96_u8, 0x32_u8, 0xaa_u8, 0xc9_u8, 0x45_u8, 0xb3_u8, 0x74_u8, 0xaa_u8])
    def query_interface(this : IWSDiscoveredService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDiscoveredService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDiscoveredService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_endpoint_reference(this : IWSDiscoveredService*, ppEndpointReference : Win32cr::Devices::WebServicesOnDevices::WSD_ENDPOINT_REFERENCE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_endpoint_reference.call(this, ppEndpointReference)
    end
    def get_types(this : IWSDiscoveredService*, ppTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_types.call(this, ppTypesList)
    end
    def get_scopes(this : IWSDiscoveredService*, ppScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scopes.call(this, ppScopesList)
    end
    def get_x_addrs(this : IWSDiscoveredService*, ppXAddrsList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_x_addrs.call(this, ppXAddrsList)
    end
    def get_metadata_version(this : IWSDiscoveredService*, pullMetadataVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_version.call(this, pullMetadataVersion)
    end
    def get_extended_disco_xml(this : IWSDiscoveredService*, ppHeaderAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, ppBodyAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extended_disco_xml.call(this, ppHeaderAny, ppBodyAny)
    end
    def get_probe_resolve_tag(this : IWSDiscoveredService*, ppszTag : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_probe_resolve_tag.call(this, ppszTag)
    end
    def get_remote_transport_address(this : IWSDiscoveredService*, ppszRemoteTransportAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_transport_address.call(this, ppszRemoteTransportAddress)
    end
    def get_local_transport_address(this : IWSDiscoveredService*, ppszLocalTransportAddress : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_transport_address.call(this, ppszLocalTransportAddress)
    end
    def get_local_interface_guid(this : IWSDiscoveredService*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_interface_guid.call(this, pGuid)
    end
    def get_instance_id(this : IWSDiscoveredService*, pullInstanceId : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance_id.call(this, pullInstanceId)
    end

  end

  @[Extern]
  record IWSDiscoveryPublisherVtbl,
    query_interface : Proc(IWSDiscoveryPublisher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDiscoveryPublisher*, UInt32),
    release : Proc(IWSDiscoveryPublisher*, UInt32),
    set_address_family : Proc(IWSDiscoveryPublisher*, UInt32, Win32cr::Foundation::HRESULT),
    register_notification_sink : Proc(IWSDiscoveryPublisher*, Void*, Win32cr::Foundation::HRESULT),
    un_register_notification_sink : Proc(IWSDiscoveryPublisher*, Void*, Win32cr::Foundation::HRESULT),
    publish : Proc(IWSDiscoveryPublisher*, Win32cr::Foundation::PWSTR, UInt64, UInt64, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Foundation::HRESULT),
    un_publish : Proc(IWSDiscoveryPublisher*, Win32cr::Foundation::PWSTR, UInt64, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Foundation::HRESULT),
    match_probe : Proc(IWSDiscoveryPublisher*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt64, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Foundation::HRESULT),
    match_resolve : Proc(IWSDiscoveryPublisher*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt64, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Foundation::HRESULT),
    publish_ex : Proc(IWSDiscoveryPublisher*, Win32cr::Foundation::PWSTR, UInt64, UInt64, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Foundation::HRESULT),
    match_probe_ex : Proc(IWSDiscoveryPublisher*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt64, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Foundation::HRESULT),
    match_resolve_ex : Proc(IWSDiscoveryPublisher*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt64, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Foundation::HRESULT),
    register_scope_matching_rule : Proc(IWSDiscoveryPublisher*, Void*, Win32cr::Foundation::HRESULT),
    un_register_scope_matching_rule : Proc(IWSDiscoveryPublisher*, Void*, Win32cr::Foundation::HRESULT),
    get_xml_context : Proc(IWSDiscoveryPublisher*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDiscoveryPublisher, lpVtbl : IWSDiscoveryPublisherVtbl* do
    GUID = LibC::GUID.new(0xae01e1a8_u32, 0x3ff9_u16, 0x4148_u16, StaticArray[0x81_u8, 0x16_u8, 0x5_u8, 0x7c_u8, 0xc6_u8, 0x16_u8, 0xfe_u8, 0x13_u8])
    def query_interface(this : IWSDiscoveryPublisher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDiscoveryPublisher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDiscoveryPublisher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_address_family(this : IWSDiscoveryPublisher*, dwAddressFamily : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_address_family.call(this, dwAddressFamily)
    end
    def register_notification_sink(this : IWSDiscoveryPublisher*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_notification_sink.call(this, pSink)
    end
    def un_register_notification_sink(this : IWSDiscoveryPublisher*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_register_notification_sink.call(this, pSink)
    end
    def publish(this : IWSDiscoveryPublisher*, pszId : Win32cr::Foundation::PWSTR, ullMetadataVersion : UInt64, ullInstanceId : UInt64, ullMessageNumber : UInt64, pszSessionId : Win32cr::Foundation::PWSTR, pTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, pScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pXAddrsList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.publish.call(this, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList)
    end
    def un_publish(this : IWSDiscoveryPublisher*, pszId : Win32cr::Foundation::PWSTR, ullInstanceId : UInt64, ullMessageNumber : UInt64, pszSessionId : Win32cr::Foundation::PWSTR, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_publish.call(this, pszId, ullInstanceId, ullMessageNumber, pszSessionId, pAny)
    end
    def match_probe(this : IWSDiscoveryPublisher*, pProbeMessage : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, pMessageParameters : Void*, pszId : Win32cr::Foundation::PWSTR, ullMetadataVersion : UInt64, ullInstanceId : UInt64, ullMessageNumber : UInt64, pszSessionId : Win32cr::Foundation::PWSTR, pTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, pScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pXAddrsList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.match_probe.call(this, pProbeMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList)
    end
    def match_resolve(this : IWSDiscoveryPublisher*, pResolveMessage : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, pMessageParameters : Void*, pszId : Win32cr::Foundation::PWSTR, ullMetadataVersion : UInt64, ullInstanceId : UInt64, ullMessageNumber : UInt64, pszSessionId : Win32cr::Foundation::PWSTR, pTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, pScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pXAddrsList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.match_resolve.call(this, pResolveMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList)
    end
    def publish_ex(this : IWSDiscoveryPublisher*, pszId : Win32cr::Foundation::PWSTR, ullMetadataVersion : UInt64, ullInstanceId : UInt64, ullMessageNumber : UInt64, pszSessionId : Win32cr::Foundation::PWSTR, pTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, pScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pXAddrsList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pHeaderAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pReferenceParameterAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pPolicyAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pEndpointReferenceAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.publish_ex.call(this, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny)
    end
    def match_probe_ex(this : IWSDiscoveryPublisher*, pProbeMessage : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, pMessageParameters : Void*, pszId : Win32cr::Foundation::PWSTR, ullMetadataVersion : UInt64, ullInstanceId : UInt64, ullMessageNumber : UInt64, pszSessionId : Win32cr::Foundation::PWSTR, pTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, pScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pXAddrsList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pHeaderAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pReferenceParameterAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pPolicyAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pEndpointReferenceAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.match_probe_ex.call(this, pProbeMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny)
    end
    def match_resolve_ex(this : IWSDiscoveryPublisher*, pResolveMessage : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, pMessageParameters : Void*, pszId : Win32cr::Foundation::PWSTR, ullMetadataVersion : UInt64, ullInstanceId : UInt64, ullMessageNumber : UInt64, pszSessionId : Win32cr::Foundation::PWSTR, pTypesList : Win32cr::Devices::WebServicesOnDevices::WSD_NAME_LIST*, pScopesList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pXAddrsList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pHeaderAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pReferenceParameterAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pPolicyAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pEndpointReferenceAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.match_resolve_ex.call(this, pResolveMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny)
    end
    def register_scope_matching_rule(this : IWSDiscoveryPublisher*, pScopeMatchingRule : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_scope_matching_rule.call(this, pScopeMatchingRule)
    end
    def un_register_scope_matching_rule(this : IWSDiscoveryPublisher*, pScopeMatchingRule : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_register_scope_matching_rule.call(this, pScopeMatchingRule)
    end
    def get_xml_context(this : IWSDiscoveryPublisher*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_context.call(this, ppContext)
    end

  end

  @[Extern]
  record IWSDiscoveryPublisherNotifyVtbl,
    query_interface : Proc(IWSDiscoveryPublisherNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDiscoveryPublisherNotify*, UInt32),
    release : Proc(IWSDiscoveryPublisherNotify*, UInt32),
    probe_handler : Proc(IWSDiscoveryPublisherNotify*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, Void*, Win32cr::Foundation::HRESULT),
    resolve_handler : Proc(IWSDiscoveryPublisherNotify*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDiscoveryPublisherNotify, lpVtbl : IWSDiscoveryPublisherNotifyVtbl* do
    GUID = LibC::GUID.new(0xe67651b0_u32, 0x337a_u16, 0x4b3c_u16, StaticArray[0x97_u8, 0x58_u8, 0x73_u8, 0x33_u8, 0x88_u8, 0x56_u8, 0x82_u8, 0x51_u8])
    def query_interface(this : IWSDiscoveryPublisherNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDiscoveryPublisherNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDiscoveryPublisherNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def probe_handler(this : IWSDiscoveryPublisherNotify*, pSoap : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, pMessageParameters : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.probe_handler.call(this, pSoap, pMessageParameters)
    end
    def resolve_handler(this : IWSDiscoveryPublisherNotify*, pSoap : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_MESSAGE*, pMessageParameters : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_handler.call(this, pSoap, pMessageParameters)
    end

  end

  @[Extern]
  record IWSDScopeMatchingRuleVtbl,
    query_interface : Proc(IWSDScopeMatchingRule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDScopeMatchingRule*, UInt32),
    release : Proc(IWSDScopeMatchingRule*, UInt32),
    get_scope_rule : Proc(IWSDScopeMatchingRule*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    match_scopes : Proc(IWSDScopeMatchingRule*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDScopeMatchingRule, lpVtbl : IWSDScopeMatchingRuleVtbl* do
    GUID = LibC::GUID.new(0xfcafe424_u32, 0xfef5_u16, 0x481a_u16, StaticArray[0xbd_u8, 0x9f_u8, 0x33_u8, 0xce_u8, 0x5_u8, 0x74_u8, 0x25_u8, 0x6f_u8])
    def query_interface(this : IWSDScopeMatchingRule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDScopeMatchingRule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDScopeMatchingRule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_scope_rule(this : IWSDScopeMatchingRule*, ppszScopeMatchingRule : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scope_rule.call(this, ppszScopeMatchingRule)
    end
    def match_scopes(this : IWSDScopeMatchingRule*, pszScope1 : Win32cr::Foundation::PWSTR, pszScope2 : Win32cr::Foundation::PWSTR, pfMatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.match_scopes.call(this, pszScope1, pszScope2, pfMatch)
    end

  end

  @[Extern]
  record IWSDEndpointProxyVtbl,
    query_interface : Proc(IWSDEndpointProxy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDEndpointProxy*, UInt32),
    release : Proc(IWSDEndpointProxy*, UInt32),
    send_one_way_request : Proc(IWSDEndpointProxy*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Win32cr::Foundation::HRESULT),
    send_two_way_request : Proc(IWSDEndpointProxy*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Win32cr::Devices::WebServicesOnDevices::WSD_SYNCHRONOUS_RESPONSE_CONTEXT*, Win32cr::Foundation::HRESULT),
    send_two_way_request_async : Proc(IWSDEndpointProxy*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    abort_async_operation : Proc(IWSDEndpointProxy*, Void*, Win32cr::Foundation::HRESULT),
    process_fault : Proc(IWSDEndpointProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT*, Win32cr::Foundation::HRESULT),
    get_error_info : Proc(IWSDEndpointProxy*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_fault_info : Proc(IWSDEndpointProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDEndpointProxy, lpVtbl : IWSDEndpointProxyVtbl* do
    GUID = LibC::GUID.new(0x1860d430_u32, 0xb24c_u16, 0x4975_u16, StaticArray[0x9f_u8, 0x90_u8, 0xdb_u8, 0xb3_u8, 0x9b_u8, 0xaa_u8, 0x24_u8, 0xec_u8])
    def query_interface(this : IWSDEndpointProxy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDEndpointProxy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDEndpointProxy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def send_one_way_request(this : IWSDEndpointProxy*, pBody : Void*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_one_way_request.call(this, pBody, pOperation)
    end
    def send_two_way_request(this : IWSDEndpointProxy*, pBody : Void*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, pResponseContext : Win32cr::Devices::WebServicesOnDevices::WSD_SYNCHRONOUS_RESPONSE_CONTEXT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_two_way_request.call(this, pBody, pOperation, pResponseContext)
    end
    def send_two_way_request_async(this : IWSDEndpointProxy*, pBody : Void*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, pAsyncState : Void*, pCallback : Void*, pResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_two_way_request_async.call(this, pBody, pOperation, pAsyncState, pCallback, pResult)
    end
    def abort_async_operation(this : IWSDEndpointProxy*, pAsyncResult : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_async_operation.call(this, pAsyncResult)
    end
    def process_fault(this : IWSDEndpointProxy*, pFault : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_fault.call(this, pFault)
    end
    def get_error_info(this : IWSDEndpointProxy*, ppszErrorInfo : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_info.call(this, ppszErrorInfo)
    end
    def get_fault_info(this : IWSDEndpointProxy*, ppFault : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fault_info.call(this, ppFault)
    end

  end

  @[Extern]
  record IWSDMetadataExchangeVtbl,
    query_interface : Proc(IWSDMetadataExchange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDMetadataExchange*, UInt32),
    release : Proc(IWSDMetadataExchange*, UInt32),
    get_metadata : Proc(IWSDMetadataExchange*, Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDMetadataExchange, lpVtbl : IWSDMetadataExchangeVtbl* do
    GUID = LibC::GUID.new(0x6996d57_u32, 0x1d67_u16, 0x4928_u16, StaticArray[0x93_u8, 0x7_u8, 0x3d_u8, 0x78_u8, 0x33_u8, 0xfd_u8, 0xb8_u8, 0x46_u8])
    def query_interface(this : IWSDMetadataExchange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDMetadataExchange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDMetadataExchange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_metadata(this : IWSDMetadataExchange*, metadata_out : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata.call(this, metadata_out)
    end

  end

  @[Extern]
  record IWSDServiceProxyVtbl,
    query_interface : Proc(IWSDServiceProxy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDServiceProxy*, UInt32),
    release : Proc(IWSDServiceProxy*, UInt32),
    get_metadata : Proc(IWSDServiceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**, Win32cr::Foundation::HRESULT),
    begin_get_metadata : Proc(IWSDServiceProxy*, Void**, Win32cr::Foundation::HRESULT),
    end_get_metadata : Proc(IWSDServiceProxy*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**, Win32cr::Foundation::HRESULT),
    get_service_metadata : Proc(IWSDServiceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA**, Win32cr::Foundation::HRESULT),
    subscribe_to_operation : Proc(IWSDServiceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Void*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    unsubscribe_to_operation : Proc(IWSDServiceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Win32cr::Foundation::HRESULT),
    set_eventing_status_callback : Proc(IWSDServiceProxy*, Void*, Win32cr::Foundation::HRESULT),
    get_endpoint_proxy : Proc(IWSDServiceProxy*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDServiceProxy, lpVtbl : IWSDServiceProxyVtbl* do
    GUID = LibC::GUID.new(0xd4c7fb9c_u32, 0x3ab_u16, 0x4175_u16, StaticArray[0x9d_u8, 0x67_u8, 0x9_u8, 0x4f_u8, 0xaf_u8, 0xeb_u8, 0xf4_u8, 0x87_u8])
    def query_interface(this : IWSDServiceProxy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDServiceProxy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDServiceProxy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_metadata(this : IWSDServiceProxy*, metadata_out : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata.call(this, metadata_out)
    end
    def begin_get_metadata(this : IWSDServiceProxy*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_metadata.call(this, ppResult)
    end
    def end_get_metadata(this : IWSDServiceProxy*, pResult : Void*, ppMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_get_metadata.call(this, pResult, ppMetadata)
    end
    def get_service_metadata(this : IWSDServiceProxy*, ppServiceMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_metadata.call(this, ppServiceMetadata)
    end
    def subscribe_to_operation(this : IWSDServiceProxy*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, pUnknown : Void*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.subscribe_to_operation.call(this, pOperation, pUnknown, pAny, ppAny)
    end
    def unsubscribe_to_operation(this : IWSDServiceProxy*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unsubscribe_to_operation.call(this, pOperation)
    end
    def set_eventing_status_callback(this : IWSDServiceProxy*, pStatus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_eventing_status_callback.call(this, pStatus)
    end
    def get_endpoint_proxy(this : IWSDServiceProxy*, ppProxy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_endpoint_proxy.call(this, ppProxy)
    end

  end

  @[Extern]
  record IWSDServiceProxyEventingVtbl,
    query_interface : Proc(IWSDServiceProxyEventing*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDServiceProxyEventing*, UInt32),
    release : Proc(IWSDServiceProxyEventing*, UInt32),
    get_metadata : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**, Win32cr::Foundation::HRESULT),
    begin_get_metadata : Proc(IWSDServiceProxyEventing*, Void**, Win32cr::Foundation::HRESULT),
    end_get_metadata : Proc(IWSDServiceProxyEventing*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**, Win32cr::Foundation::HRESULT),
    get_service_metadata : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA**, Win32cr::Foundation::HRESULT),
    subscribe_to_operation : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Void*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    unsubscribe_to_operation : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Win32cr::Foundation::HRESULT),
    set_eventing_status_callback : Proc(IWSDServiceProxyEventing*, Void*, Win32cr::Foundation::HRESULT),
    get_endpoint_proxy : Proc(IWSDServiceProxyEventing*, Void**, Win32cr::Foundation::HRESULT),
    subscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    begin_subscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_subscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    unsubscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Foundation::HRESULT),
    begin_unsubscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_unsubscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    renew_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    begin_renew_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_renew_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    get_status_for_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT),
    begin_get_status_for_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_get_status_for_multiple_operations : Proc(IWSDServiceProxyEventing*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, UInt32, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDServiceProxyEventing, lpVtbl : IWSDServiceProxyEventingVtbl* do
    GUID = LibC::GUID.new(0xf9279d6d_u32, 0x1012_u16, 0x4a94_u16, StaticArray[0xb8_u8, 0xcc_u8, 0xfd_u8, 0x35_u8, 0xd2_u8, 0x20_u8, 0x2b_u8, 0xfe_u8])
    def query_interface(this : IWSDServiceProxyEventing*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDServiceProxyEventing*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDServiceProxyEventing*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_metadata(this : IWSDServiceProxyEventing*, metadata_out : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata.call(this, metadata_out)
    end
    def begin_get_metadata(this : IWSDServiceProxyEventing*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_metadata.call(this, ppResult)
    end
    def end_get_metadata(this : IWSDServiceProxyEventing*, pResult : Void*, ppMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_get_metadata.call(this, pResult, ppMetadata)
    end
    def get_service_metadata(this : IWSDServiceProxyEventing*, ppServiceMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_SERVICE_METADATA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_metadata.call(this, ppServiceMetadata)
    end
    def subscribe_to_operation(this : IWSDServiceProxyEventing*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, pUnknown : Void*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.subscribe_to_operation.call(this, pOperation, pUnknown, pAny, ppAny)
    end
    def unsubscribe_to_operation(this : IWSDServiceProxyEventing*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unsubscribe_to_operation.call(this, pOperation)
    end
    def set_eventing_status_callback(this : IWSDServiceProxyEventing*, pStatus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_eventing_status_callback.call(this, pStatus)
    end
    def get_endpoint_proxy(this : IWSDServiceProxyEventing*, ppProxy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_endpoint_proxy.call(this, ppProxy)
    end
    def subscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pUnknown : Void*, pExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, ppExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.subscribe_to_multiple_operations.call(this, pOperations, dwOperationCount, pUnknown, pExpires, pAny, ppExpires, ppAny)
    end
    def begin_subscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pUnknown : Void*, pExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pAsyncState : Void*, pAsyncCallback : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_subscribe_to_multiple_operations.call(this, pOperations, dwOperationCount, pUnknown, pExpires, pAny, pAsyncState, pAsyncCallback, ppResult)
    end
    def end_subscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pResult : Void*, ppExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_subscribe_to_multiple_operations.call(this, pOperations, dwOperationCount, pResult, ppExpires, ppAny)
    end
    def unsubscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unsubscribe_to_multiple_operations.call(this, pOperations, dwOperationCount, pAny)
    end
    def begin_unsubscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pAsyncState : Void*, pAsyncCallback : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_unsubscribe_to_multiple_operations.call(this, pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback, ppResult)
    end
    def end_unsubscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pResult : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_unsubscribe_to_multiple_operations.call(this, pOperations, dwOperationCount, pResult)
    end
    def renew_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, ppExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.renew_multiple_operations.call(this, pOperations, dwOperationCount, pExpires, pAny, ppExpires, ppAny)
    end
    def begin_renew_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pAsyncState : Void*, pAsyncCallback : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_renew_multiple_operations.call(this, pOperations, dwOperationCount, pExpires, pAny, pAsyncState, pAsyncCallback, ppResult)
    end
    def end_renew_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pResult : Void*, ppExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_renew_multiple_operations.call(this, pOperations, dwOperationCount, pResult, ppExpires, ppAny)
    end
    def get_status_for_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, ppExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status_for_multiple_operations.call(this, pOperations, dwOperationCount, pAny, ppExpires, ppAny)
    end
    def begin_get_status_for_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pAsyncState : Void*, pAsyncCallback : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_status_for_multiple_operations.call(this, pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback, ppResult)
    end
    def end_get_status_for_multiple_operations(this : IWSDServiceProxyEventing*, pOperations : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, dwOperationCount : UInt32, pResult : Void*, ppExpires : Win32cr::Devices::WebServicesOnDevices::WSD_EVENTING_EXPIRES**, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_get_status_for_multiple_operations.call(this, pOperations, dwOperationCount, pResult, ppExpires, ppAny)
    end

  end

  @[Extern]
  record IWSDDeviceProxyVtbl,
    query_interface : Proc(IWSDDeviceProxy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDDeviceProxy*, UInt32),
    release : Proc(IWSDDeviceProxy*, UInt32),
    init : Proc(IWSDDeviceProxy*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    begin_get_metadata : Proc(IWSDDeviceProxy*, Void**, Win32cr::Foundation::HRESULT),
    end_get_metadata : Proc(IWSDDeviceProxy*, Void*, Win32cr::Foundation::HRESULT),
    get_host_metadata : Proc(IWSDDeviceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_HOST_METADATA**, Win32cr::Foundation::HRESULT),
    get_this_model_metadata : Proc(IWSDDeviceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_THIS_MODEL_METADATA**, Win32cr::Foundation::HRESULT),
    get_this_device_metadata : Proc(IWSDDeviceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_THIS_DEVICE_METADATA**, Win32cr::Foundation::HRESULT),
    get_all_metadata : Proc(IWSDDeviceProxy*, Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**, Win32cr::Foundation::HRESULT),
    get_service_proxy_by_id : Proc(IWSDDeviceProxy*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_service_proxy_by_type : Proc(IWSDDeviceProxy*, Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, Void**, Win32cr::Foundation::HRESULT),
    get_endpoint_proxy : Proc(IWSDDeviceProxy*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDDeviceProxy, lpVtbl : IWSDDeviceProxyVtbl* do
    GUID = LibC::GUID.new(0xeee0c031_u32, 0xc578_u16, 0x4c0e_u16, StaticArray[0x9a_u8, 0x3b_u8, 0x97_u8, 0x3c_u8, 0x35_u8, 0xf4_u8, 0x9_u8, 0xdb_u8])
    def query_interface(this : IWSDDeviceProxy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDDeviceProxy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDDeviceProxy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : IWSDDeviceProxy*, pszDeviceId : Win32cr::Foundation::PWSTR, pDeviceAddress : Void*, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, pSponsor : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pszDeviceId, pDeviceAddress, pszLocalId, pContext, pSponsor)
    end
    def begin_get_metadata(this : IWSDDeviceProxy*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_metadata.call(this, ppResult)
    end
    def end_get_metadata(this : IWSDDeviceProxy*, pResult : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_get_metadata.call(this, pResult)
    end
    def get_host_metadata(this : IWSDDeviceProxy*, ppHostMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_HOST_METADATA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_metadata.call(this, ppHostMetadata)
    end
    def get_this_model_metadata(this : IWSDDeviceProxy*, ppManufacturerMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_THIS_MODEL_METADATA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_this_model_metadata.call(this, ppManufacturerMetadata)
    end
    def get_this_device_metadata(this : IWSDDeviceProxy*, ppThisDeviceMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_THIS_DEVICE_METADATA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_this_device_metadata.call(this, ppThisDeviceMetadata)
    end
    def get_all_metadata(this : IWSDDeviceProxy*, ppMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_metadata.call(this, ppMetadata)
    end
    def get_service_proxy_by_id(this : IWSDDeviceProxy*, pszServiceId : Win32cr::Foundation::PWSTR, ppServiceProxy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_proxy_by_id.call(this, pszServiceId, ppServiceProxy)
    end
    def get_service_proxy_by_type(this : IWSDDeviceProxy*, pType : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, ppServiceProxy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_proxy_by_type.call(this, pType, ppServiceProxy)
    end
    def get_endpoint_proxy(this : IWSDDeviceProxy*, ppProxy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_endpoint_proxy.call(this, ppProxy)
    end

  end

  @[Extern]
  record IWSDAsyncResultVtbl,
    query_interface : Proc(IWSDAsyncResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDAsyncResult*, UInt32),
    release : Proc(IWSDAsyncResult*, UInt32),
    set_callback : Proc(IWSDAsyncResult*, Void*, Void*, Win32cr::Foundation::HRESULT),
    set_wait_handle : Proc(IWSDAsyncResult*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    has_completed : Proc(IWSDAsyncResult*, Win32cr::Foundation::HRESULT),
    get_async_state : Proc(IWSDAsyncResult*, Void**, Win32cr::Foundation::HRESULT),
    abort : Proc(IWSDAsyncResult*, Win32cr::Foundation::HRESULT),
    get_event : Proc(IWSDAsyncResult*, Win32cr::Devices::WebServicesOnDevices::WSD_EVENT*, Win32cr::Foundation::HRESULT),
    get_endpoint_proxy : Proc(IWSDAsyncResult*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDAsyncResult, lpVtbl : IWSDAsyncResultVtbl* do
    GUID = LibC::GUID.new(0x11a9852a_u32, 0x8dd8_u16, 0x423e_u16, StaticArray[0xb5_u8, 0x37_u8, 0x93_u8, 0x56_u8, 0xdb_u8, 0x4f_u8, 0xbf_u8, 0xb8_u8])
    def query_interface(this : IWSDAsyncResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDAsyncResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDAsyncResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_callback(this : IWSDAsyncResult*, pCallback : Void*, pAsyncState : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_callback.call(this, pCallback, pAsyncState)
    end
    def set_wait_handle(this : IWSDAsyncResult*, hWaitHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wait_handle.call(this, hWaitHandle)
    end
    def has_completed(this : IWSDAsyncResult*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_completed.call(this)
    end
    def get_async_state(this : IWSDAsyncResult*, ppAsyncState : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_async_state.call(this, ppAsyncState)
    end
    def abort(this : IWSDAsyncResult*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def get_event(this : IWSDAsyncResult*, pEvent : Win32cr::Devices::WebServicesOnDevices::WSD_EVENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event.call(this, pEvent)
    end
    def get_endpoint_proxy(this : IWSDAsyncResult*, ppEndpoint : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_endpoint_proxy.call(this, ppEndpoint)
    end

  end

  @[Extern]
  record IWSDAsyncCallbackVtbl,
    query_interface : Proc(IWSDAsyncCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDAsyncCallback*, UInt32),
    release : Proc(IWSDAsyncCallback*, UInt32),
    async_operation_complete : Proc(IWSDAsyncCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDAsyncCallback, lpVtbl : IWSDAsyncCallbackVtbl* do
    GUID = LibC::GUID.new(0xa63e109d_u32, 0xce72_u16, 0x49e2_u16, StaticArray[0xba_u8, 0x98_u8, 0xe8_u8, 0x45_u8, 0xf5_u8, 0xee_u8, 0x16_u8, 0x66_u8])
    def query_interface(this : IWSDAsyncCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDAsyncCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDAsyncCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def async_operation_complete(this : IWSDAsyncCallback*, pAsyncResult : Void*, pAsyncState : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.async_operation_complete.call(this, pAsyncResult, pAsyncState)
    end

  end

  @[Extern]
  record IWSDEventingStatusVtbl,
    query_interface : Proc(IWSDEventingStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDEventingStatus*, UInt32),
    release : Proc(IWSDEventingStatus*, UInt32),
    subscription_renewed : Proc(IWSDEventingStatus*, Win32cr::Foundation::PWSTR, Void),
    subscription_renewal_failed : Proc(IWSDEventingStatus*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT, Void),
    subscription_ended : Proc(IWSDEventingStatus*, Win32cr::Foundation::PWSTR, Void)


  @[Extern]
  record IWSDEventingStatus, lpVtbl : IWSDEventingStatusVtbl* do
    GUID = LibC::GUID.new(0x49b17f52_u32, 0x637a_u16, 0x407a_u16, StaticArray[0xae_u8, 0x99_u8, 0xfb_u8, 0xe8_u8, 0x2a_u8, 0x4d_u8, 0x38_u8, 0xc0_u8])
    def query_interface(this : IWSDEventingStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDEventingStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDEventingStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def subscription_renewed(this : IWSDEventingStatus*, pszSubscriptionAction : Win32cr::Foundation::PWSTR) : Void
      @lpVtbl.try &.value.subscription_renewed.call(this, pszSubscriptionAction)
    end
    def subscription_renewal_failed(this : IWSDEventingStatus*, pszSubscriptionAction : Win32cr::Foundation::PWSTR, hr : Win32cr::Foundation::HRESULT) : Void
      @lpVtbl.try &.value.subscription_renewal_failed.call(this, pszSubscriptionAction, hr)
    end
    def subscription_ended(this : IWSDEventingStatus*, pszSubscriptionAction : Win32cr::Foundation::PWSTR) : Void
      @lpVtbl.try &.value.subscription_ended.call(this, pszSubscriptionAction)
    end

  end

  @[Extern]
  record IWSDDeviceHostVtbl,
    query_interface : Proc(IWSDDeviceHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDDeviceHost*, UInt32),
    release : Proc(IWSDDeviceHost*, UInt32),
    init : Proc(IWSDDeviceHost*, Win32cr::Foundation::PWSTR, Void*, Void**, UInt32, Win32cr::Foundation::HRESULT),
    start : Proc(IWSDDeviceHost*, UInt64, Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, Void*, Win32cr::Foundation::HRESULT),
    stop : Proc(IWSDDeviceHost*, Win32cr::Foundation::HRESULT),
    terminate : Proc(IWSDDeviceHost*, Win32cr::Foundation::HRESULT),
    register_port_type : Proc(IWSDDeviceHost*, Win32cr::Devices::WebServicesOnDevices::WSD_PORT_TYPE*, Win32cr::Foundation::HRESULT),
    set_metadata : Proc(IWSDDeviceHost*, Win32cr::Devices::WebServicesOnDevices::WSD_THIS_MODEL_METADATA*, Win32cr::Devices::WebServicesOnDevices::WSD_THIS_DEVICE_METADATA*, Win32cr::Devices::WebServicesOnDevices::WSD_HOST_METADATA*, Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST*, Win32cr::Foundation::HRESULT),
    register_service : Proc(IWSDDeviceHost*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    retire_service : Proc(IWSDDeviceHost*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_dynamic_service : Proc(IWSDDeviceHost*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Devices::WebServicesOnDevices::WSD_PORT_TYPE*, Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, Void*, Win32cr::Foundation::HRESULT),
    remove_dynamic_service : Proc(IWSDDeviceHost*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_service_discoverable : Proc(IWSDDeviceHost*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    signal_event : Proc(IWSDDeviceHost*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDDeviceHost, lpVtbl : IWSDDeviceHostVtbl* do
    GUID = LibC::GUID.new(0x917fe891_u32, 0x3d13_u16, 0x4138_u16, StaticArray[0x98_u8, 0x9_u8, 0x93_u8, 0x4c_u8, 0x8a_u8, 0xbe_u8, 0xb1_u8, 0x2c_u8])
    def query_interface(this : IWSDDeviceHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDDeviceHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDDeviceHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : IWSDDeviceHost*, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppHostAddresses : Void**, dwHostAddressCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pszLocalId, pContext, ppHostAddresses, dwHostAddressCount)
    end
    def start(this : IWSDDeviceHost*, ullInstanceId : UInt64, pScopeList : Win32cr::Devices::WebServicesOnDevices::WSD_URI_LIST*, pNotificationSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, ullInstanceId, pScopeList, pNotificationSink)
    end
    def stop(this : IWSDDeviceHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def terminate(this : IWSDDeviceHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this)
    end
    def register_port_type(this : IWSDDeviceHost*, pPortType : Win32cr::Devices::WebServicesOnDevices::WSD_PORT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_port_type.call(this, pPortType)
    end
    def set_metadata(this : IWSDDeviceHost*, pThisModelMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_THIS_MODEL_METADATA*, pThisDeviceMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_THIS_DEVICE_METADATA*, pHostMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_HOST_METADATA*, pCustomMetadata : Win32cr::Devices::WebServicesOnDevices::WSD_METADATA_SECTION_LIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_metadata.call(this, pThisModelMetadata, pThisDeviceMetadata, pHostMetadata, pCustomMetadata)
    end
    def register_service(this : IWSDDeviceHost*, pszServiceId : Win32cr::Foundation::PWSTR, pService : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_service.call(this, pszServiceId, pService)
    end
    def retire_service(this : IWSDDeviceHost*, pszServiceId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retire_service.call(this, pszServiceId)
    end
    def add_dynamic_service(this : IWSDDeviceHost*, pszServiceId : Win32cr::Foundation::PWSTR, pszEndpointAddress : Win32cr::Foundation::PWSTR, pPortType : Win32cr::Devices::WebServicesOnDevices::WSD_PORT_TYPE*, pPortName : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pService : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_dynamic_service.call(this, pszServiceId, pszEndpointAddress, pPortType, pPortName, pAny, pService)
    end
    def remove_dynamic_service(this : IWSDDeviceHost*, pszServiceId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_dynamic_service.call(this, pszServiceId)
    end
    def set_service_discoverable(this : IWSDDeviceHost*, pszServiceId : Win32cr::Foundation::PWSTR, fDiscoverable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_service_discoverable.call(this, pszServiceId, fDiscoverable)
    end
    def signal_event(this : IWSDDeviceHost*, pszServiceId : Win32cr::Foundation::PWSTR, pBody : Void*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.signal_event.call(this, pszServiceId, pBody, pOperation)
    end

  end

  @[Extern]
  record IWSDDeviceHostNotifyVtbl,
    query_interface : Proc(IWSDDeviceHostNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDDeviceHostNotify*, UInt32),
    release : Proc(IWSDDeviceHostNotify*, UInt32),
    get_service : Proc(IWSDDeviceHostNotify*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDDeviceHostNotify, lpVtbl : IWSDDeviceHostNotifyVtbl* do
    GUID = LibC::GUID.new(0xb5bee9f9_u32, 0xeeda_u16, 0x41fe_u16, StaticArray[0x96_u8, 0xf7_u8, 0xf4_u8, 0x5e_u8, 0x14_u8, 0x99_u8, 0xf_u8, 0xb0_u8])
    def query_interface(this : IWSDDeviceHostNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDDeviceHostNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDDeviceHostNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_service(this : IWSDDeviceHostNotify*, pszServiceId : Win32cr::Foundation::PWSTR, ppService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service.call(this, pszServiceId, ppService)
    end

  end

  @[Extern]
  record IWSDServiceMessagingVtbl,
    query_interface : Proc(IWSDServiceMessaging*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSDServiceMessaging*, UInt32),
    release : Proc(IWSDServiceMessaging*, UInt32),
    send_response : Proc(IWSDServiceMessaging*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, Void*, Win32cr::Foundation::HRESULT),
    fault_request : Proc(IWSDServiceMessaging*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_HEADER*, Void*, Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSDServiceMessaging, lpVtbl : IWSDServiceMessagingVtbl* do
    GUID = LibC::GUID.new(0x94974cf4_u32, 0xcab_u16, 0x460d_u16, StaticArray[0xa3_u8, 0xf6_u8, 0x7a_u8, 0xa_u8, 0xd6_u8, 0x23_u8, 0xc0_u8, 0xe6_u8])
    def query_interface(this : IWSDServiceMessaging*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSDServiceMessaging*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSDServiceMessaging*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def send_response(this : IWSDServiceMessaging*, pBody : Void*, pOperation : Win32cr::Devices::WebServicesOnDevices::WSD_OPERATION*, pMessageParameters : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_response.call(this, pBody, pOperation, pMessageParameters)
    end
    def fault_request(this : IWSDServiceMessaging*, pRequestHeader : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_HEADER*, pMessageParameters : Void*, pFault : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fault_request.call(this, pRequestHeader, pMessageParameters, pFault)
    end

  end

  def wSDCreateUdpMessageParameters(ppTxParams : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateUdpMessageParameters(ppTxParams)
  end

  def wSDCreateUdpAddress(ppAddress : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateUdpAddress(ppAddress)
  end

  def wSDCreateHttpMessageParameters(ppTxParams : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateHttpMessageParameters(ppTxParams)
  end

  def wSDCreateHttpAddress(ppAddress : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateHttpAddress(ppAddress)
  end

  def wSDCreateOutboundAttachment(ppAttachment : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateOutboundAttachment(ppAttachment)
  end

  def wSDXMLGetNameFromBuiltinNamespace(pszNamespace : Win32cr::Foundation::PWSTR, pszName : Win32cr::Foundation::PWSTR, ppName : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME**) : Win32cr::Foundation::HRESULT
    C.WSDXMLGetNameFromBuiltinNamespace(pszNamespace, pszName, ppName)
  end

  def wSDXMLCreateContext(ppContext : Void**) : Win32cr::Foundation::HRESULT
    C.WSDXMLCreateContext(ppContext)
  end

  def wSDCreateDiscoveryProvider(pContext : Void*, ppProvider : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDiscoveryProvider(pContext, ppProvider)
  end

  def wSDCreateDiscoveryProvider2(pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppProvider : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDiscoveryProvider2(pContext, pConfigParams, dwConfigParamCount, ppProvider)
  end

  def wSDCreateDiscoveryPublisher(pContext : Void*, ppPublisher : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDiscoveryPublisher(pContext, ppPublisher)
  end

  def wSDCreateDiscoveryPublisher2(pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppPublisher : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDiscoveryPublisher2(pContext, pConfigParams, dwConfigParamCount, ppPublisher)
  end

  def wSDCreateDeviceProxy(pszDeviceId : Win32cr::Foundation::PWSTR, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppDeviceProxy : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDeviceProxy(pszDeviceId, pszLocalId, pContext, ppDeviceProxy)
  end

  def wSDCreateDeviceProxyAdvanced(pszDeviceId : Win32cr::Foundation::PWSTR, pDeviceAddress : Void*, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppDeviceProxy : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDeviceProxyAdvanced(pszDeviceId, pDeviceAddress, pszLocalId, pContext, ppDeviceProxy)
  end

  def wSDCreateDeviceProxy2(pszDeviceId : Win32cr::Foundation::PWSTR, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppDeviceProxy : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDeviceProxy2(pszDeviceId, pszLocalId, pContext, pConfigParams, dwConfigParamCount, ppDeviceProxy)
  end

  def wSDCreateDeviceHost(pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppDeviceHost : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDeviceHost(pszLocalId, pContext, ppDeviceHost)
  end

  def wSDCreateDeviceHostAdvanced(pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppHostAddresses : Void**, dwHostAddressCount : UInt32, ppDeviceHost : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDeviceHostAdvanced(pszLocalId, pContext, ppHostAddresses, dwHostAddressCount, ppDeviceHost)
  end

  def wSDCreateDeviceHost2(pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppDeviceHost : Void**) : Win32cr::Foundation::HRESULT
    C.WSDCreateDeviceHost2(pszLocalId, pContext, pConfigParams, dwConfigParamCount, ppDeviceHost)
  end

  def wSDSetConfigurationOption(dwOption : UInt32, pVoid : Void*, cbInBuffer : UInt32) : Win32cr::Foundation::HRESULT
    C.WSDSetConfigurationOption(dwOption, pVoid, cbInBuffer)
  end

  def wSDGetConfigurationOption(dwOption : UInt32, pVoid : Void*, cbOutBuffer : UInt32) : Win32cr::Foundation::HRESULT
    C.WSDGetConfigurationOption(dwOption, pVoid, cbOutBuffer)
  end

  def wSDAllocateLinkedMemory(pParent : Void*, cbSize : LibC::UIntPtrT) : Void*
    C.WSDAllocateLinkedMemory(pParent, cbSize)
  end

  def wSDFreeLinkedMemory(pVoid : Void*) : Void
    C.WSDFreeLinkedMemory(pVoid)
  end

  def wSDAttachLinkedMemory(pParent : Void*, pChild : Void*) : Void
    C.WSDAttachLinkedMemory(pParent, pChild)
  end

  def wSDDetachLinkedMemory(pVoid : Void*) : Void
    C.WSDDetachLinkedMemory(pVoid)
  end

  def wSDXMLBuildAnyForSingleElement(pElementName : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, pszText : Win32cr::Foundation::PWSTR, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT
    C.WSDXMLBuildAnyForSingleElement(pElementName, pszText, ppAny)
  end

  def wSDXMLGetValueFromAny(pszNamespace : Win32cr::Foundation::PWSTR, pszName : Win32cr::Foundation::PWSTR, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, ppszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.WSDXMLGetValueFromAny(pszNamespace, pszName, pAny, ppszValue)
  end

  def wSDXMLAddSibling(pFirst : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pSecond : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
    C.WSDXMLAddSibling(pFirst, pSecond)
  end

  def wSDXMLAddChild(pParent : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pChild : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
    C.WSDXMLAddChild(pParent, pChild)
  end

  def wSDXMLCleanupElement(pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT
    C.WSDXMLCleanupElement(pAny)
  end

  def wSDGenerateFault(pszCode : Win32cr::Foundation::PWSTR, pszSubCode : Win32cr::Foundation::PWSTR, pszReason : Win32cr::Foundation::PWSTR, pszDetail : Win32cr::Foundation::PWSTR, pContext : Void*, ppFault : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT**) : Win32cr::Foundation::HRESULT
    C.WSDGenerateFault(pszCode, pszSubCode, pszReason, pszDetail, pContext, ppFault)
  end

  def wSDGenerateFaultEx(pCode : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, pSubCode : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, pReasons : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*, pszDetail : Win32cr::Foundation::PWSTR, ppFault : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT**) : Win32cr::Foundation::HRESULT
    C.WSDGenerateFaultEx(pCode, pSubCode, pReasons, pszDetail, ppFault)
  end

  def wSDUriEncode(source : UInt16*, cchSource : UInt32, destOut : Win32cr::Foundation::PWSTR*, cchDestOut : UInt32*) : Win32cr::Foundation::HRESULT
    C.WSDUriEncode(source, cchSource, destOut, cchDestOut)
  end

  def wSDUriDecode(source : UInt16*, cchSource : UInt32, destOut : Win32cr::Foundation::PWSTR*, cchDestOut : UInt32*) : Win32cr::Foundation::HRESULT
    C.WSDUriDecode(source, cchSource, destOut, cchDestOut)
  end

  @[Link("wsdapi")]
  lib C
    # :nodoc:
    fun WSDCreateUdpMessageParameters(ppTxParams : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateUdpAddress(ppAddress : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateHttpMessageParameters(ppTxParams : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateHttpAddress(ppAddress : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateOutboundAttachment(ppAttachment : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDXMLGetNameFromBuiltinNamespace(pszNamespace : Win32cr::Foundation::PWSTR, pszName : Win32cr::Foundation::PWSTR, ppName : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDXMLCreateContext(ppContext : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDiscoveryProvider(pContext : Void*, ppProvider : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDiscoveryProvider2(pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppProvider : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDiscoveryPublisher(pContext : Void*, ppPublisher : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDiscoveryPublisher2(pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppPublisher : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDeviceProxy(pszDeviceId : Win32cr::Foundation::PWSTR, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppDeviceProxy : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDeviceProxyAdvanced(pszDeviceId : Win32cr::Foundation::PWSTR, pDeviceAddress : Void*, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppDeviceProxy : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDeviceProxy2(pszDeviceId : Win32cr::Foundation::PWSTR, pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppDeviceProxy : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDeviceHost(pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppDeviceHost : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDeviceHostAdvanced(pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, ppHostAddresses : Void**, dwHostAddressCount : UInt32, ppDeviceHost : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDCreateDeviceHost2(pszLocalId : Win32cr::Foundation::PWSTR, pContext : Void*, pConfigParams : Win32cr::Devices::WebServicesOnDevices::WSD_CONFIG_PARAM*, dwConfigParamCount : UInt32, ppDeviceHost : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDSetConfigurationOption(dwOption : UInt32, pVoid : Void*, cbInBuffer : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDGetConfigurationOption(dwOption : UInt32, pVoid : Void*, cbOutBuffer : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDAllocateLinkedMemory(pParent : Void*, cbSize : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun WSDFreeLinkedMemory(pVoid : Void*) : Void

    # :nodoc:
    fun WSDAttachLinkedMemory(pParent : Void*, pChild : Void*) : Void

    # :nodoc:
    fun WSDDetachLinkedMemory(pVoid : Void*) : Void

    # :nodoc:
    fun WSDXMLBuildAnyForSingleElement(pElementName : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, pszText : Win32cr::Foundation::PWSTR, ppAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDXMLGetValueFromAny(pszNamespace : Win32cr::Foundation::PWSTR, pszName : Win32cr::Foundation::PWSTR, pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, ppszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDXMLAddSibling(pFirst : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pSecond : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDXMLAddChild(pParent : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*, pChild : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDXMLCleanupElement(pAny : Win32cr::Devices::WebServicesOnDevices::WSDXML_ELEMENT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDGenerateFault(pszCode : Win32cr::Foundation::PWSTR, pszSubCode : Win32cr::Foundation::PWSTR, pszReason : Win32cr::Foundation::PWSTR, pszDetail : Win32cr::Foundation::PWSTR, pContext : Void*, ppFault : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDGenerateFaultEx(pCode : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, pSubCode : Win32cr::Devices::WebServicesOnDevices::WSDXML_NAME*, pReasons : Win32cr::Devices::WebServicesOnDevices::WSD_LOCALIZED_STRING_LIST*, pszDetail : Win32cr::Foundation::PWSTR, ppFault : Win32cr::Devices::WebServicesOnDevices::WSD_SOAP_FAULT**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDUriEncode(source : UInt16*, cchSource : UInt32, destOut : Win32cr::Foundation::PWSTR*, cchDestOut : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WSDUriDecode(source : UInt16*, cchSource : UInt32, destOut : Win32cr::Foundation::PWSTR*, cchDestOut : UInt32*) : Win32cr::Foundation::HRESULT

  end
end