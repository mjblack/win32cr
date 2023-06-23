require "../security/cryptography.cr"
require "../foundation.cr"
require "../system/com.cr"
require "../networking/winsock.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wsdapi.dll")]
{% else %}
@[Link("wsdapi")]
{% end %}
lib LibWin32
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

  alias WSD_STUB_FUNCTION = Proc(IUnknown, IWSDServiceMessaging, WSD_EVENT*, HRESULT)
  alias PWSD_SOAP_MESSAGE_HANDLER = Proc(IUnknown, WSD_EVENT*, HRESULT)


  enum WSD_CONFIG_PARAM_TYPE : Int32
    WSD_CONFIG_MAX_INBOUND_MESSAGE_SIZE = 1
    WSD_CONFIG_MAX_OUTBOUND_MESSAGE_SIZE = 2
    WSD_SECURITY_SSL_CERT_FOR_CLIENT_AUTH = 3
    WSD_SECURITY_SSL_SERVER_CERT_VALIDATION = 4
    WSD_SECURITY_SSL_CLIENT_CERT_VALIDATION = 5
    WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT = 6
    WSD_SECURITY_COMPACTSIG_SIGNING_CERT = 7
    WSD_SECURITY_COMPACTSIG_VALIDATION = 8
    WSD_CONFIG_HOSTING_ADDRESSES = 9
    WSD_CONFIG_DEVICE_ADDRESSES = 10
    WSD_SECURITY_REQUIRE_HTTP_CLIENT_AUTH = 11
    WSD_SECURITY_REQUIRE_CLIENT_CERT_OR_HTTP_CLIENT_AUTH = 12
    WSD_SECURITY_USE_HTTP_CLIENT_AUTH = 13
  end

  enum WSDUdpMessageType : Int32
    ONE_WAY = 0
    TWO_WAY = 1
  end

  enum WSDXML_OP : Int32
    OpNone = 0
    OpEndOfTable = 1
    OpBeginElement_ = 2
    OpBeginAnyElement = 3
    OpEndElement = 4
    OpElement_ = 5
    OpAnyElement = 6
    OpAnyElements = 7
    OpAnyText = 8
    OpAttribute_ = 9
    OpBeginChoice = 10
    OpEndChoice = 11
    OpBeginSequence = 12
    OpEndSequence = 13
    OpBeginAll = 14
    OpEndAll = 15
    OpAnything = 16
    OpAnyNumber = 17
    OpOneOrMore = 18
    OpOptional = 19
    OpFormatBool_ = 20
    OpFormatInt8_ = 21
    OpFormatInt16_ = 22
    OpFormatInt32_ = 23
    OpFormatInt64_ = 24
    OpFormatUInt8_ = 25
    OpFormatUInt16_ = 26
    OpFormatUInt32_ = 27
    OpFormatUInt64_ = 28
    OpFormatUnicodeString_ = 29
    OpFormatDom_ = 30
    OpFormatStruct_ = 31
    OpFormatUri_ = 32
    OpFormatUuidUri_ = 33
    OpFormatName_ = 34
    OpFormatListInsertTail_ = 35
    OpFormatType_ = 36
    OpFormatDynamicType_ = 37
    OpFormatLookupType_ = 38
    OpFormatDuration_ = 39
    OpFormatDateTime_ = 40
    OpFormatFloat_ = 41
    OpFormatDouble_ = 42
    OpProcess_ = 43
    OpQualifiedAttribute_ = 44
    OpFormatXMLDeclaration_ = 45
    OpFormatMax = 46
  end

  enum DeviceDiscoveryMechanism : Int32
    MulticastDiscovery = 0
    DirectedDiscovery = 1
    SecureDirectedDiscovery = 2
  end

  enum WSD_PROTOCOL_TYPE : Int32
    WSD_PT_NONE = 0
    WSD_PT_UDP = 1
    WSD_PT_HTTP = 2
    WSD_PT_HTTPS = 4
    WSD_PT_ALL = 255
  end

  enum WSDEventType : Int32
    WSDET_NONE = 0
    WSDET_INCOMING_MESSAGE = 1
    WSDET_INCOMING_FAULT = 2
    WSDET_TRANSMISSION_FAILURE = 3
    WSDET_RESPONSE_TIMEOUT = 4
  end

  struct WSD_CONFIG_PARAM
    config_param_type : WSD_CONFIG_PARAM_TYPE
    p_config_data : Void*
    dw_config_data_size : UInt32
  end
  struct WSD_SECURITY_CERT_VALIDATION_V1
    cert_match_array : CERT_CONTEXT**
    dw_cert_match_array_count : UInt32
    h_cert_match_store : Void*
    h_cert_issuer_store : Void*
    dw_cert_check_options : UInt32
  end
  struct WSD_SECURITY_CERT_VALIDATION
    cert_match_array : CERT_CONTEXT**
    dw_cert_match_array_count : UInt32
    h_cert_match_store : Void*
    h_cert_issuer_store : Void*
    dw_cert_check_options : UInt32
    psz_cng_hash_alg_id : LibC::LPWSTR
    pb_cert_hash : UInt8*
    dw_cert_hash_size : UInt32
  end
  struct WSD_SECURITY_SIGNATURE_VALIDATION
    signing_cert_array : CERT_CONTEXT**
    dw_signing_cert_array_count : UInt32
    h_signing_cert_store : Void*
    dw_flags : UInt32
  end
  struct WSD_CONFIG_ADDRESSES
    addresses : IWSDAddress*
    dw_address_count : UInt32
  end
  struct WSDUdpRetransmitParams
    ul_send_delay : UInt32
    ul_repeat : UInt32
    ul_repeat_min_delay : UInt32
    ul_repeat_max_delay : UInt32
    ul_repeat_upper_delay : UInt32
  end
  struct WSD_DATETIME
    is_positive : LibC::BOOL
    year : UInt32
    month : UInt8
    day : UInt8
    hour : UInt8
    minute : UInt8
    second : UInt8
    millisecond : UInt32
    tz_is_local : LibC::BOOL
    tz_is_positive : LibC::BOOL
    tz_hour : UInt8
    tz_minute : UInt8
  end
  struct WSD_DURATION
    is_positive : LibC::BOOL
    year : UInt32
    month : UInt32
    day : UInt32
    hour : UInt32
    minute : UInt32
    second : UInt32
    millisecond : UInt32
  end
  struct WSDXML_NAMESPACE
    uri : LibC::LPWSTR
    preferred_prefix : LibC::LPWSTR
    names : WSDXML_NAME*
    names_count : UInt16
    encoding : UInt16
  end
  struct WSDXML_NAME
    space : WSDXML_NAMESPACE*
    local_name : LibC::LPWSTR
  end
  struct WSDXML_TYPE
    uri : LibC::LPWSTR
    table : UInt8*
  end
  struct WSDXML_PREFIX_MAPPING
    refs : UInt32
    next : WSDXML_PREFIX_MAPPING*
    space : WSDXML_NAMESPACE*
    prefix : LibC::LPWSTR
  end
  struct WSDXML_ATTRIBUTE
    element : WSDXML_ELEMENT*
    next : WSDXML_ATTRIBUTE*
    name : WSDXML_NAME*
    value : LibC::LPWSTR
  end
  struct WSDXML_NODE
    type : Int32
    parent : WSDXML_ELEMENT*
    next : WSDXML_NODE*
  end
  struct WSDXML_ELEMENT
    node : WSDXML_NODE
    name : WSDXML_NAME*
    first_attribute : WSDXML_ATTRIBUTE*
    first_child : WSDXML_NODE*
    prefix_mappings : WSDXML_PREFIX_MAPPING*
  end
  struct WSDXML_TEXT
    node : WSDXML_NODE
    text : LibC::LPWSTR
  end
  struct WSDXML_ELEMENT_LIST
    next : WSDXML_ELEMENT_LIST*
    element : WSDXML_ELEMENT*
  end
  struct WSD_OPERATION
    request_type : WSDXML_TYPE*
    response_type : WSDXML_TYPE*
    request_stub_function : WSD_STUB_FUNCTION
  end
  struct WSD_HANDLER_CONTEXT
    handler : PWSD_SOAP_MESSAGE_HANDLER
    p_void : Void*
    unknown : IUnknown
  end
  struct WSD_SYNCHRONOUS_RESPONSE_CONTEXT
    hr : HRESULT
    event_handle : LibC::HANDLE
    message_parameters : IWSDMessageParameters
    results : Void*
  end
  struct WSD_PORT_TYPE
    encoded_name : UInt32
    operation_count : UInt32
    operations : WSD_OPERATION*
    protocol_type : WSD_PROTOCOL_TYPE
  end
  struct WSD_RELATIONSHIP_METADATA
    type : LibC::LPWSTR
    data : WSD_HOST_METADATA*
    any : WSDXML_ELEMENT*
  end
  struct WSD_SERVICE_METADATA_LIST
    next : WSD_SERVICE_METADATA_LIST*
    element : WSD_SERVICE_METADATA*
  end
  struct WSD_HOST_METADATA
    host : WSD_SERVICE_METADATA*
    hosted : WSD_SERVICE_METADATA_LIST*
  end
  struct WSD_ENDPOINT_REFERENCE_LIST
    next : WSD_ENDPOINT_REFERENCE_LIST*
    element : WSD_ENDPOINT_REFERENCE*
  end
  struct WSD_SERVICE_METADATA
    endpoint_reference : WSD_ENDPOINT_REFERENCE_LIST*
    types : WSD_NAME_LIST*
    service_id : LibC::LPWSTR
    any : WSDXML_ELEMENT*
  end
  struct WSD_THIS_DEVICE_METADATA
    friendly_name : WSD_LOCALIZED_STRING_LIST*
    firmware_version : LibC::LPWSTR
    serial_number : LibC::LPWSTR
    any : WSDXML_ELEMENT*
  end
  struct WSD_THIS_MODEL_METADATA
    manufacturer : WSD_LOCALIZED_STRING_LIST*
    manufacturer_url : LibC::LPWSTR
    model_name : WSD_LOCALIZED_STRING_LIST*
    model_number : LibC::LPWSTR
    model_url : LibC::LPWSTR
    presentation_url : LibC::LPWSTR
    any : WSDXML_ELEMENT*
  end
  struct WSD_LOCALIZED_STRING_LIST
    next : WSD_LOCALIZED_STRING_LIST*
    element : WSD_LOCALIZED_STRING*
  end
  struct WSD_SOAP_FAULT_REASON
    text : WSD_LOCALIZED_STRING_LIST*
  end
  struct WSD_SOAP_FAULT_SUBCODE
    value : WSDXML_NAME*
    subcode : WSD_SOAP_FAULT_SUBCODE*
  end
  struct WSD_SOAP_FAULT_CODE
    value : WSDXML_NAME*
    subcode : WSD_SOAP_FAULT_SUBCODE*
  end
  struct WSD_SOAP_FAULT
    code : WSD_SOAP_FAULT_CODE*
    reason : WSD_SOAP_FAULT_REASON*
    node : LibC::LPWSTR
    role : LibC::LPWSTR
    detail : WSDXML_ELEMENT*
  end
  struct WSD_APP_SEQUENCE
    instance_id : UInt64
    sequence_id : LibC::LPWSTR
    message_number : UInt64
  end
  struct WSD_HEADER_RELATESTO
    relationship_type : WSDXML_NAME*
    message_id : LibC::LPWSTR
  end
  struct WSD_SOAP_HEADER
    to : LibC::LPWSTR
    action : LibC::LPWSTR
    message_id : LibC::LPWSTR
    relates_to : WSD_HEADER_RELATESTO
    reply_to : WSD_ENDPOINT_REFERENCE*
    from : WSD_ENDPOINT_REFERENCE*
    fault_to : WSD_ENDPOINT_REFERENCE*
    app_sequence : WSD_APP_SEQUENCE*
    any_headers : WSDXML_ELEMENT*
  end
  struct WSD_SOAP_MESSAGE
    header : WSD_SOAP_HEADER
    body : Void*
    body_type : WSDXML_TYPE*
  end
  struct WSD_RESOLVE_MATCHES
    resolve_match : WSD_RESOLVE_MATCH*
    any : WSDXML_ELEMENT*
  end
  struct WSD_RESOLVE_MATCH
    endpoint_reference : WSD_ENDPOINT_REFERENCE*
    types : WSD_NAME_LIST*
    scopes : WSD_SCOPES*
    x_addrs : WSD_URI_LIST*
    metadata_version : UInt64
    any : WSDXML_ELEMENT*
  end
  struct WSD_RESOLVE
    endpoint_reference : WSD_ENDPOINT_REFERENCE*
    any : WSDXML_ELEMENT*
  end
  struct WSD_PROBE_MATCH
    endpoint_reference : WSD_ENDPOINT_REFERENCE*
    types : WSD_NAME_LIST*
    scopes : WSD_SCOPES*
    x_addrs : WSD_URI_LIST*
    metadata_version : UInt64
    any : WSDXML_ELEMENT*
  end
  struct WSD_PROBE_MATCH_LIST
    next : WSD_PROBE_MATCH_LIST*
    element : WSD_PROBE_MATCH*
  end
  struct WSD_PROBE_MATCHES
    probe_match : WSD_PROBE_MATCH_LIST*
    any : WSDXML_ELEMENT*
  end
  struct WSD_PROBE
    types : WSD_NAME_LIST*
    scopes : WSD_SCOPES*
    any : WSDXML_ELEMENT*
  end
  struct WSD_BYE
    endpoint_reference : WSD_ENDPOINT_REFERENCE*
    any : WSDXML_ELEMENT*
  end
  struct WSD_SCOPES
    match_by : LibC::LPWSTR
    scopes : WSD_URI_LIST*
  end
  struct WSD_NAME_LIST
    next : WSD_NAME_LIST*
    element : WSDXML_NAME*
  end
  struct WSD_HELLO
    endpoint_reference : WSD_ENDPOINT_REFERENCE*
    types : WSD_NAME_LIST*
    scopes : WSD_SCOPES*
    x_addrs : WSD_URI_LIST*
    metadata_version : UInt64
    any : WSDXML_ELEMENT*
  end
  struct WSD_REFERENCE_PARAMETERS
    any : WSDXML_ELEMENT*
  end
  struct WSD_REFERENCE_PROPERTIES
    any : WSDXML_ELEMENT*
  end
  struct WSD_ENDPOINT_REFERENCE
    address : LibC::LPWSTR
    reference_properties : WSD_REFERENCE_PROPERTIES
    reference_parameters : WSD_REFERENCE_PARAMETERS
    port_type : WSDXML_NAME*
    service_name : WSDXML_NAME*
    any : WSDXML_ELEMENT*
  end
  struct WSD_METADATA_SECTION
    dialect : LibC::LPWSTR
    identifier : LibC::LPWSTR
    data : Void*
    metadata_reference : WSD_ENDPOINT_REFERENCE*
    location : LibC::LPWSTR
    any : WSDXML_ELEMENT*
  end
  struct WSD_METADATA_SECTION_LIST
    next : WSD_METADATA_SECTION_LIST*
    element : WSD_METADATA_SECTION*
  end
  struct WSD_URI_LIST
    next : WSD_URI_LIST*
    element : LibC::LPWSTR
  end
  struct WSD_EVENTING_FILTER_ACTION
    actions : WSD_URI_LIST*
  end
  struct WSD_EVENTING_FILTER
    dialect : LibC::LPWSTR
    filter_action : WSD_EVENTING_FILTER_ACTION*
    data : Void*
  end
  struct WSD_EVENTING_EXPIRES
    duration : WSD_DURATION*
    date_time : WSD_DATETIME*
  end
  struct WSD_EVENTING_DELIVERY_MODE_PUSH
    notify_to : WSD_ENDPOINT_REFERENCE*
  end
  struct WSD_EVENTING_DELIVERY_MODE
    mode : LibC::LPWSTR
    push : WSD_EVENTING_DELIVERY_MODE_PUSH*
    data : Void*
  end
  struct WSD_LOCALIZED_STRING
    lang : LibC::LPWSTR
    string : LibC::LPWSTR
  end
  struct RESPONSEBODY_GetMetadata
    metadata : WSD_METADATA_SECTION_LIST*
  end
  struct REQUESTBODY_Subscribe
    end_to : WSD_ENDPOINT_REFERENCE*
    delivery : WSD_EVENTING_DELIVERY_MODE*
    expires : WSD_EVENTING_EXPIRES*
    filter : WSD_EVENTING_FILTER*
    any : WSDXML_ELEMENT*
  end
  struct RESPONSEBODY_Subscribe
    subscription_manager : WSD_ENDPOINT_REFERENCE*
    expires : WSD_EVENTING_EXPIRES*
    any : WSDXML_ELEMENT*
  end
  struct REQUESTBODY_Renew
    expires : WSD_EVENTING_EXPIRES*
    any : WSDXML_ELEMENT*
  end
  struct RESPONSEBODY_Renew
    expires : WSD_EVENTING_EXPIRES*
    any : WSDXML_ELEMENT*
  end
  struct REQUESTBODY_GetStatus
    any : WSDXML_ELEMENT*
  end
  struct RESPONSEBODY_GetStatus
    expires : WSD_EVENTING_EXPIRES*
    any : WSDXML_ELEMENT*
  end
  struct REQUESTBODY_Unsubscribe
    any : WSDXML_ELEMENT*
  end
  struct RESPONSEBODY_SubscriptionEnd
    subscription_manager : WSD_ENDPOINT_REFERENCE*
    status : LibC::LPWSTR
    reason : WSD_LOCALIZED_STRING*
    any : WSDXML_ELEMENT*
  end
  struct WSD_UNKNOWN_LOOKUP
    any : WSDXML_ELEMENT*
  end
  struct WSD_EVENT
    hr : HRESULT
    event_type : UInt32
    dispatch_tag : LibC::LPWSTR
    handler_context : WSD_HANDLER_CONTEXT
    soap : WSD_SOAP_MESSAGE*
    operation : WSD_OPERATION*
    message_parameters : IWSDMessageParameters
  end


  struct IWSDAddressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    deserialize : UInt64
  end

  IWSDAddress_GUID = "b9574c6c-12a6-4f74-93a1-3318ff605759"
  IID_IWSDAddress = LibC::GUID.new(0xb9574c6c_u32, 0x12a6_u16, 0x4f74_u16, StaticArray[0x93_u8, 0xa1_u8, 0x33_u8, 0x18_u8, 0xff_u8, 0x60_u8, 0x57_u8, 0x59_u8])
  struct IWSDAddress
    lpVtbl : IWSDAddressVTbl*
  end

  struct IWSDTransportAddressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    deserialize : UInt64
    get_port : UInt64
    set_port : UInt64
    get_transport_address : UInt64
    get_transport_address_ex : UInt64
    set_transport_address : UInt64
  end

  IWSDTransportAddress_GUID = "70d23498-4ee6-4340-a3df-d845d2235467"
  IID_IWSDTransportAddress = LibC::GUID.new(0x70d23498_u32, 0x4ee6_u16, 0x4340_u16, StaticArray[0xa3_u8, 0xdf_u8, 0xd8_u8, 0x45_u8, 0xd2_u8, 0x23_u8, 0x54_u8, 0x67_u8])
  struct IWSDTransportAddress
    lpVtbl : IWSDTransportAddressVTbl*
  end

  struct IWSDMessageParametersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_local_address : UInt64
    set_local_address : UInt64
    get_remote_address : UInt64
    set_remote_address : UInt64
    get_lower_parameters : UInt64
  end

  IWSDMessageParameters_GUID = "1fafe8a2-e6fc-4b80-b6cf-b7d45c416d7c"
  IID_IWSDMessageParameters = LibC::GUID.new(0x1fafe8a2_u32, 0xe6fc_u16, 0x4b80_u16, StaticArray[0xb6_u8, 0xcf_u8, 0xb7_u8, 0xd4_u8, 0x5c_u8, 0x41_u8, 0x6d_u8, 0x7c_u8])
  struct IWSDMessageParameters
    lpVtbl : IWSDMessageParametersVTbl*
  end

  struct IWSDUdpMessageParametersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_local_address : UInt64
    set_local_address : UInt64
    get_remote_address : UInt64
    set_remote_address : UInt64
    get_lower_parameters : UInt64
    set_retransmit_params : UInt64
    get_retransmit_params : UInt64
  end

  IWSDUdpMessageParameters_GUID = "9934149f-8f0c-447b-aa0b-73124b0ca7f0"
  IID_IWSDUdpMessageParameters = LibC::GUID.new(0x9934149f_u32, 0x8f0c_u16, 0x447b_u16, StaticArray[0xaa_u8, 0xb_u8, 0x73_u8, 0x12_u8, 0x4b_u8, 0xc_u8, 0xa7_u8, 0xf0_u8])
  struct IWSDUdpMessageParameters
    lpVtbl : IWSDUdpMessageParametersVTbl*
  end

  struct IWSDUdpAddressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    deserialize : UInt64
    get_port : UInt64
    set_port : UInt64
    get_transport_address : UInt64
    get_transport_address_ex : UInt64
    set_transport_address : UInt64
    set_sockaddr : UInt64
    get_sockaddr : UInt64
    set_exclusive : UInt64
    get_exclusive : UInt64
    set_message_type : UInt64
    get_message_type : UInt64
    set_ttl : UInt64
    get_ttl : UInt64
    set_alias : UInt64
    get_alias : UInt64
  end

  IWSDUdpAddress_GUID = "74d6124a-a441-4f78-a1eb-97a8d1996893"
  IID_IWSDUdpAddress = LibC::GUID.new(0x74d6124a_u32, 0xa441_u16, 0x4f78_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x97_u8, 0xa8_u8, 0xd1_u8, 0x99_u8, 0x68_u8, 0x93_u8])
  struct IWSDUdpAddress
    lpVtbl : IWSDUdpAddressVTbl*
  end

  struct IWSDHttpMessageParametersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_local_address : UInt64
    set_local_address : UInt64
    get_remote_address : UInt64
    set_remote_address : UInt64
    get_lower_parameters : UInt64
    set_inbound_http_headers : UInt64
    get_inbound_http_headers : UInt64
    set_outbound_http_headers : UInt64
    get_outbound_http_headers : UInt64
    set_id : UInt64
    get_id : UInt64
    set_context : UInt64
    get_context : UInt64
    clear : UInt64
  end

  IWSDHttpMessageParameters_GUID = "540bd122-5c83-4dec-b396-ea62a2697fdf"
  IID_IWSDHttpMessageParameters = LibC::GUID.new(0x540bd122_u32, 0x5c83_u16, 0x4dec_u16, StaticArray[0xb3_u8, 0x96_u8, 0xea_u8, 0x62_u8, 0xa2_u8, 0x69_u8, 0x7f_u8, 0xdf_u8])
  struct IWSDHttpMessageParameters
    lpVtbl : IWSDHttpMessageParametersVTbl*
  end

  struct IWSDHttpAddressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    deserialize : UInt64
    get_port : UInt64
    set_port : UInt64
    get_transport_address : UInt64
    get_transport_address_ex : UInt64
    set_transport_address : UInt64
    get_secure : UInt64
    set_secure : UInt64
    get_path : UInt64
    set_path : UInt64
  end

  IWSDHttpAddress_GUID = "d09ac7bd-2a3e-4b85-8605-2737ff3e4ea0"
  IID_IWSDHttpAddress = LibC::GUID.new(0xd09ac7bd_u32, 0x2a3e_u16, 0x4b85_u16, StaticArray[0x86_u8, 0x5_u8, 0x27_u8, 0x37_u8, 0xff_u8, 0x3e_u8, 0x4e_u8, 0xa0_u8])
  struct IWSDHttpAddress
    lpVtbl : IWSDHttpAddressVTbl*
  end

  struct IWSDSSLClientCertificateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client_certificate : UInt64
    get_mapped_access_token : UInt64
  end

  IWSDSSLClientCertificate_GUID = "de105e87-a0da-418e-98ad-27b9eed87bdc"
  IID_IWSDSSLClientCertificate = LibC::GUID.new(0xde105e87_u32, 0xa0da_u16, 0x418e_u16, StaticArray[0x98_u8, 0xad_u8, 0x27_u8, 0xb9_u8, 0xee_u8, 0xd8_u8, 0x7b_u8, 0xdc_u8])
  struct IWSDSSLClientCertificate
    lpVtbl : IWSDSSLClientCertificateVTbl*
  end

  struct IWSDHttpAuthParametersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client_access_token : UInt64
    get_auth_type : UInt64
  end

  IWSDHttpAuthParameters_GUID = "0b476df0-8dac-480d-b05c-99781a5884aa"
  IID_IWSDHttpAuthParameters = LibC::GUID.new(0xb476df0_u32, 0x8dac_u16, 0x480d_u16, StaticArray[0xb0_u8, 0x5c_u8, 0x99_u8, 0x78_u8, 0x1a_u8, 0x58_u8, 0x84_u8, 0xaa_u8])
  struct IWSDHttpAuthParameters
    lpVtbl : IWSDHttpAuthParametersVTbl*
  end

  struct IWSDSignaturePropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_message_signed : UInt64
    is_message_signature_trusted : UInt64
    get_key_info : UInt64
    get_signature : UInt64
    get_signed_info_hash : UInt64
  end

  IWSDSignatureProperty_GUID = "03ce20aa-71c4-45e2-b32e-3766c61c790f"
  IID_IWSDSignatureProperty = LibC::GUID.new(0x3ce20aa_u32, 0x71c4_u16, 0x45e2_u16, StaticArray[0xb3_u8, 0x2e_u8, 0x37_u8, 0x66_u8, 0xc6_u8, 0x1c_u8, 0x79_u8, 0xf_u8])
  struct IWSDSignatureProperty
    lpVtbl : IWSDSignaturePropertyVTbl*
  end

  struct IWSDAttachmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IWSDAttachment_GUID = "5d55a616-9df8-4b09-b156-9ba351a48b76"
  IID_IWSDAttachment = LibC::GUID.new(0x5d55a616_u32, 0x9df8_u16, 0x4b09_u16, StaticArray[0xb1_u8, 0x56_u8, 0x9b_u8, 0xa3_u8, 0x51_u8, 0xa4_u8, 0x8b_u8, 0x76_u8])
  struct IWSDAttachment
    lpVtbl : IWSDAttachmentVTbl*
  end

  struct IWSDOutboundAttachmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    write : UInt64
    close : UInt64
    abort : UInt64
  end

  IWSDOutboundAttachment_GUID = "aa302f8d-5a22-4ba5-b392-aa8486f4c15d"
  IID_IWSDOutboundAttachment = LibC::GUID.new(0xaa302f8d_u32, 0x5a22_u16, 0x4ba5_u16, StaticArray[0xb3_u8, 0x92_u8, 0xaa_u8, 0x84_u8, 0x86_u8, 0xf4_u8, 0xc1_u8, 0x5d_u8])
  struct IWSDOutboundAttachment
    lpVtbl : IWSDOutboundAttachmentVTbl*
  end

  struct IWSDInboundAttachmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    close : UInt64
  end

  IWSDInboundAttachment_GUID = "5bd6ca65-233c-4fb8-9f7a-2641619655c9"
  IID_IWSDInboundAttachment = LibC::GUID.new(0x5bd6ca65_u32, 0x233c_u16, 0x4fb8_u16, StaticArray[0x9f_u8, 0x7a_u8, 0x26_u8, 0x41_u8, 0x61_u8, 0x96_u8, 0x55_u8, 0xc9_u8])
  struct IWSDInboundAttachment
    lpVtbl : IWSDInboundAttachmentVTbl*
  end

  struct IWSDXMLContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_namespace : UInt64
    add_name_to_namespace : UInt64
    set_namespaces : UInt64
    set_types : UInt64
  end

  IWSDXMLContext_GUID = "75d8f3ee-3e5a-43b4-a15a-bcf6887460c0"
  IID_IWSDXMLContext = LibC::GUID.new(0x75d8f3ee_u32, 0x3e5a_u16, 0x43b4_u16, StaticArray[0xa1_u8, 0x5a_u8, 0xbc_u8, 0xf6_u8, 0x88_u8, 0x74_u8, 0x60_u8, 0xc0_u8])
  struct IWSDXMLContext
    lpVtbl : IWSDXMLContextVTbl*
  end

  struct IWSDiscoveryProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_address_family : UInt64
    attach : UInt64
    detach : UInt64
    search_by_id : UInt64
    search_by_address : UInt64
    search_by_type : UInt64
    get_xml_context : UInt64
  end

  IWSDiscoveryProvider_GUID = "8ffc8e55-f0eb-480f-88b7-b435dd281d45"
  IID_IWSDiscoveryProvider = LibC::GUID.new(0x8ffc8e55_u32, 0xf0eb_u16, 0x480f_u16, StaticArray[0x88_u8, 0xb7_u8, 0xb4_u8, 0x35_u8, 0xdd_u8, 0x28_u8, 0x1d_u8, 0x45_u8])
  struct IWSDiscoveryProvider
    lpVtbl : IWSDiscoveryProviderVTbl*
  end

  struct IWSDiscoveryProviderNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add : UInt64
    remove : UInt64
    search_failed : UInt64
    search_complete : UInt64
  end

  IWSDiscoveryProviderNotify_GUID = "73ee3ced-b6e6-4329-a546-3e8ad46563d2"
  IID_IWSDiscoveryProviderNotify = LibC::GUID.new(0x73ee3ced_u32, 0xb6e6_u16, 0x4329_u16, StaticArray[0xa5_u8, 0x46_u8, 0x3e_u8, 0x8a_u8, 0xd4_u8, 0x65_u8, 0x63_u8, 0xd2_u8])
  struct IWSDiscoveryProviderNotify
    lpVtbl : IWSDiscoveryProviderNotifyVTbl*
  end

  struct IWSDiscoveredServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_endpoint_reference : UInt64
    get_types : UInt64
    get_scopes : UInt64
    get_x_addrs : UInt64
    get_metadata_version : UInt64
    get_extended_disco_xml : UInt64
    get_probe_resolve_tag : UInt64
    get_remote_transport_address : UInt64
    get_local_transport_address : UInt64
    get_local_interface_guid : UInt64
    get_instance_id : UInt64
  end

  IWSDiscoveredService_GUID = "4bad8a3b-b374-4420-9632-aac945b374aa"
  IID_IWSDiscoveredService = LibC::GUID.new(0x4bad8a3b_u32, 0xb374_u16, 0x4420_u16, StaticArray[0x96_u8, 0x32_u8, 0xaa_u8, 0xc9_u8, 0x45_u8, 0xb3_u8, 0x74_u8, 0xaa_u8])
  struct IWSDiscoveredService
    lpVtbl : IWSDiscoveredServiceVTbl*
  end

  struct IWSDiscoveryPublisherVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_address_family : UInt64
    register_notification_sink : UInt64
    un_register_notification_sink : UInt64
    publish : UInt64
    un_publish : UInt64
    match_probe : UInt64
    match_resolve : UInt64
    publish_ex : UInt64
    match_probe_ex : UInt64
    match_resolve_ex : UInt64
    register_scope_matching_rule : UInt64
    un_register_scope_matching_rule : UInt64
    get_xml_context : UInt64
  end

  IWSDiscoveryPublisher_GUID = "ae01e1a8-3ff9-4148-8116-057cc616fe13"
  IID_IWSDiscoveryPublisher = LibC::GUID.new(0xae01e1a8_u32, 0x3ff9_u16, 0x4148_u16, StaticArray[0x81_u8, 0x16_u8, 0x5_u8, 0x7c_u8, 0xc6_u8, 0x16_u8, 0xfe_u8, 0x13_u8])
  struct IWSDiscoveryPublisher
    lpVtbl : IWSDiscoveryPublisherVTbl*
  end

  struct IWSDiscoveryPublisherNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    probe_handler : UInt64
    resolve_handler : UInt64
  end

  IWSDiscoveryPublisherNotify_GUID = "e67651b0-337a-4b3c-9758-733388568251"
  IID_IWSDiscoveryPublisherNotify = LibC::GUID.new(0xe67651b0_u32, 0x337a_u16, 0x4b3c_u16, StaticArray[0x97_u8, 0x58_u8, 0x73_u8, 0x33_u8, 0x88_u8, 0x56_u8, 0x82_u8, 0x51_u8])
  struct IWSDiscoveryPublisherNotify
    lpVtbl : IWSDiscoveryPublisherNotifyVTbl*
  end

  struct IWSDScopeMatchingRuleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_scope_rule : UInt64
    match_scopes : UInt64
  end

  IWSDScopeMatchingRule_GUID = "fcafe424-fef5-481a-bd9f-33ce0574256f"
  IID_IWSDScopeMatchingRule = LibC::GUID.new(0xfcafe424_u32, 0xfef5_u16, 0x481a_u16, StaticArray[0xbd_u8, 0x9f_u8, 0x33_u8, 0xce_u8, 0x5_u8, 0x74_u8, 0x25_u8, 0x6f_u8])
  struct IWSDScopeMatchingRule
    lpVtbl : IWSDScopeMatchingRuleVTbl*
  end

  struct IWSDEndpointProxyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    send_one_way_request : UInt64
    send_two_way_request : UInt64
    send_two_way_request_async : UInt64
    abort_async_operation : UInt64
    process_fault : UInt64
    get_error_info : UInt64
    get_fault_info : UInt64
  end

  IWSDEndpointProxy_GUID = "1860d430-b24c-4975-9f90-dbb39baa24ec"
  IID_IWSDEndpointProxy = LibC::GUID.new(0x1860d430_u32, 0xb24c_u16, 0x4975_u16, StaticArray[0x9f_u8, 0x90_u8, 0xdb_u8, 0xb3_u8, 0x9b_u8, 0xaa_u8, 0x24_u8, 0xec_u8])
  struct IWSDEndpointProxy
    lpVtbl : IWSDEndpointProxyVTbl*
  end

  struct IWSDMetadataExchangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_metadata : UInt64
  end

  IWSDMetadataExchange_GUID = "06996d57-1d67-4928-9307-3d7833fdb846"
  IID_IWSDMetadataExchange = LibC::GUID.new(0x6996d57_u32, 0x1d67_u16, 0x4928_u16, StaticArray[0x93_u8, 0x7_u8, 0x3d_u8, 0x78_u8, 0x33_u8, 0xfd_u8, 0xb8_u8, 0x46_u8])
  struct IWSDMetadataExchange
    lpVtbl : IWSDMetadataExchangeVTbl*
  end

  struct IWSDServiceProxyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_metadata : UInt64
    begin_get_metadata : UInt64
    end_get_metadata : UInt64
    get_service_metadata : UInt64
    subscribe_to_operation : UInt64
    unsubscribe_to_operation : UInt64
    set_eventing_status_callback : UInt64
    get_endpoint_proxy : UInt64
  end

  IWSDServiceProxy_GUID = "d4c7fb9c-03ab-4175-9d67-094fafebf487"
  IID_IWSDServiceProxy = LibC::GUID.new(0xd4c7fb9c_u32, 0x3ab_u16, 0x4175_u16, StaticArray[0x9d_u8, 0x67_u8, 0x9_u8, 0x4f_u8, 0xaf_u8, 0xeb_u8, 0xf4_u8, 0x87_u8])
  struct IWSDServiceProxy
    lpVtbl : IWSDServiceProxyVTbl*
  end

  struct IWSDServiceProxyEventingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_metadata : UInt64
    begin_get_metadata : UInt64
    end_get_metadata : UInt64
    get_service_metadata : UInt64
    subscribe_to_operation : UInt64
    unsubscribe_to_operation : UInt64
    set_eventing_status_callback : UInt64
    get_endpoint_proxy : UInt64
    subscribe_to_multiple_operations : UInt64
    begin_subscribe_to_multiple_operations : UInt64
    end_subscribe_to_multiple_operations : UInt64
    unsubscribe_to_multiple_operations : UInt64
    begin_unsubscribe_to_multiple_operations : UInt64
    end_unsubscribe_to_multiple_operations : UInt64
    renew_multiple_operations : UInt64
    begin_renew_multiple_operations : UInt64
    end_renew_multiple_operations : UInt64
    get_status_for_multiple_operations : UInt64
    begin_get_status_for_multiple_operations : UInt64
    end_get_status_for_multiple_operations : UInt64
  end

  IWSDServiceProxyEventing_GUID = "f9279d6d-1012-4a94-b8cc-fd35d2202bfe"
  IID_IWSDServiceProxyEventing = LibC::GUID.new(0xf9279d6d_u32, 0x1012_u16, 0x4a94_u16, StaticArray[0xb8_u8, 0xcc_u8, 0xfd_u8, 0x35_u8, 0xd2_u8, 0x20_u8, 0x2b_u8, 0xfe_u8])
  struct IWSDServiceProxyEventing
    lpVtbl : IWSDServiceProxyEventingVTbl*
  end

  struct IWSDDeviceProxyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init : UInt64
    begin_get_metadata : UInt64
    end_get_metadata : UInt64
    get_host_metadata : UInt64
    get_this_model_metadata : UInt64
    get_this_device_metadata : UInt64
    get_all_metadata : UInt64
    get_service_proxy_by_id : UInt64
    get_service_proxy_by_type : UInt64
    get_endpoint_proxy : UInt64
  end

  IWSDDeviceProxy_GUID = "eee0c031-c578-4c0e-9a3b-973c35f409db"
  IID_IWSDDeviceProxy = LibC::GUID.new(0xeee0c031_u32, 0xc578_u16, 0x4c0e_u16, StaticArray[0x9a_u8, 0x3b_u8, 0x97_u8, 0x3c_u8, 0x35_u8, 0xf4_u8, 0x9_u8, 0xdb_u8])
  struct IWSDDeviceProxy
    lpVtbl : IWSDDeviceProxyVTbl*
  end

  struct IWSDAsyncResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_callback : UInt64
    set_wait_handle : UInt64
    has_completed : UInt64
    get_async_state : UInt64
    abort : UInt64
    get_event : UInt64
    get_endpoint_proxy : UInt64
  end

  IWSDAsyncResult_GUID = "11a9852a-8dd8-423e-b537-9356db4fbfb8"
  IID_IWSDAsyncResult = LibC::GUID.new(0x11a9852a_u32, 0x8dd8_u16, 0x423e_u16, StaticArray[0xb5_u8, 0x37_u8, 0x93_u8, 0x56_u8, 0xdb_u8, 0x4f_u8, 0xbf_u8, 0xb8_u8])
  struct IWSDAsyncResult
    lpVtbl : IWSDAsyncResultVTbl*
  end

  struct IWSDAsyncCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    async_operation_complete : UInt64
  end

  IWSDAsyncCallback_GUID = "a63e109d-ce72-49e2-ba98-e845f5ee1666"
  IID_IWSDAsyncCallback = LibC::GUID.new(0xa63e109d_u32, 0xce72_u16, 0x49e2_u16, StaticArray[0xba_u8, 0x98_u8, 0xe8_u8, 0x45_u8, 0xf5_u8, 0xee_u8, 0x16_u8, 0x66_u8])
  struct IWSDAsyncCallback
    lpVtbl : IWSDAsyncCallbackVTbl*
  end

  struct IWSDEventingStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    subscription_renewed : UInt64
    subscription_renewal_failed : UInt64
    subscription_ended : UInt64
  end

  IWSDEventingStatus_GUID = "49b17f52-637a-407a-ae99-fbe82a4d38c0"
  IID_IWSDEventingStatus = LibC::GUID.new(0x49b17f52_u32, 0x637a_u16, 0x407a_u16, StaticArray[0xae_u8, 0x99_u8, 0xfb_u8, 0xe8_u8, 0x2a_u8, 0x4d_u8, 0x38_u8, 0xc0_u8])
  struct IWSDEventingStatus
    lpVtbl : IWSDEventingStatusVTbl*
  end

  struct IWSDDeviceHostVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init : UInt64
    start : UInt64
    stop : UInt64
    terminate : UInt64
    register_port_type : UInt64
    set_metadata : UInt64
    register_service : UInt64
    retire_service : UInt64
    add_dynamic_service : UInt64
    remove_dynamic_service : UInt64
    set_service_discoverable : UInt64
    signal_event : UInt64
  end

  IWSDDeviceHost_GUID = "917fe891-3d13-4138-9809-934c8abeb12c"
  IID_IWSDDeviceHost = LibC::GUID.new(0x917fe891_u32, 0x3d13_u16, 0x4138_u16, StaticArray[0x98_u8, 0x9_u8, 0x93_u8, 0x4c_u8, 0x8a_u8, 0xbe_u8, 0xb1_u8, 0x2c_u8])
  struct IWSDDeviceHost
    lpVtbl : IWSDDeviceHostVTbl*
  end

  struct IWSDDeviceHostNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_service : UInt64
  end

  IWSDDeviceHostNotify_GUID = "b5bee9f9-eeda-41fe-96f7-f45e14990fb0"
  IID_IWSDDeviceHostNotify = LibC::GUID.new(0xb5bee9f9_u32, 0xeeda_u16, 0x41fe_u16, StaticArray[0x96_u8, 0xf7_u8, 0xf4_u8, 0x5e_u8, 0x14_u8, 0x99_u8, 0xf_u8, 0xb0_u8])
  struct IWSDDeviceHostNotify
    lpVtbl : IWSDDeviceHostNotifyVTbl*
  end

  struct IWSDServiceMessagingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    send_response : UInt64
    fault_request : UInt64
  end

  IWSDServiceMessaging_GUID = "94974cf4-0cab-460d-a3f6-7a0ad623c0e6"
  IID_IWSDServiceMessaging = LibC::GUID.new(0x94974cf4_u32, 0xcab_u16, 0x460d_u16, StaticArray[0xa3_u8, 0xf6_u8, 0x7a_u8, 0xa_u8, 0xd6_u8, 0x23_u8, 0xc0_u8, 0xe6_u8])
  struct IWSDServiceMessaging
    lpVtbl : IWSDServiceMessagingVTbl*
  end


  # Params # pptxparams : IWSDUdpMessageParameters* [In]
  fun WSDCreateUdpMessageParameters(pptxparams : IWSDUdpMessageParameters*) : HRESULT

  # Params # ppaddress : IWSDUdpAddress* [In]
  fun WSDCreateUdpAddress(ppaddress : IWSDUdpAddress*) : HRESULT

  # Params # pptxparams : IWSDHttpMessageParameters* [In]
  fun WSDCreateHttpMessageParameters(pptxparams : IWSDHttpMessageParameters*) : HRESULT

  # Params # ppaddress : IWSDHttpAddress* [In]
  fun WSDCreateHttpAddress(ppaddress : IWSDHttpAddress*) : HRESULT

  # Params # ppattachment : IWSDOutboundAttachment* [In]
  fun WSDCreateOutboundAttachment(ppattachment : IWSDOutboundAttachment*) : HRESULT

  # Params # psznamespace : LibC::LPWSTR [In],pszname : LibC::LPWSTR [In],ppname : WSDXML_NAME** [In]
  fun WSDXMLGetNameFromBuiltinNamespace(psznamespace : LibC::LPWSTR, pszname : LibC::LPWSTR, ppname : WSDXML_NAME**) : HRESULT

  # Params # ppcontext : IWSDXMLContext* [In]
  fun WSDXMLCreateContext(ppcontext : IWSDXMLContext*) : HRESULT

  # Params # pcontext : IWSDXMLContext [In],ppprovider : IWSDiscoveryProvider* [In]
  fun WSDCreateDiscoveryProvider(pcontext : IWSDXMLContext, ppprovider : IWSDiscoveryProvider*) : HRESULT

  # Params # pcontext : IWSDXMLContext [In],pconfigparams : WSD_CONFIG_PARAM* [In],dwconfigparamcount : UInt32 [In],ppprovider : IWSDiscoveryProvider* [In]
  fun WSDCreateDiscoveryProvider2(pcontext : IWSDXMLContext, pconfigparams : WSD_CONFIG_PARAM*, dwconfigparamcount : UInt32, ppprovider : IWSDiscoveryProvider*) : HRESULT

  # Params # pcontext : IWSDXMLContext [In],pppublisher : IWSDiscoveryPublisher* [In]
  fun WSDCreateDiscoveryPublisher(pcontext : IWSDXMLContext, pppublisher : IWSDiscoveryPublisher*) : HRESULT

  # Params # pcontext : IWSDXMLContext [In],pconfigparams : WSD_CONFIG_PARAM* [In],dwconfigparamcount : UInt32 [In],pppublisher : IWSDiscoveryPublisher* [In]
  fun WSDCreateDiscoveryPublisher2(pcontext : IWSDXMLContext, pconfigparams : WSD_CONFIG_PARAM*, dwconfigparamcount : UInt32, pppublisher : IWSDiscoveryPublisher*) : HRESULT

  # Params # pszdeviceid : LibC::LPWSTR [In],pszlocalid : LibC::LPWSTR [In],pcontext : IWSDXMLContext [In],ppdeviceproxy : IWSDDeviceProxy* [In]
  fun WSDCreateDeviceProxy(pszdeviceid : LibC::LPWSTR, pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, ppdeviceproxy : IWSDDeviceProxy*) : HRESULT

  # Params # pszdeviceid : LibC::LPWSTR [In],pdeviceaddress : IWSDAddress [In],pszlocalid : LibC::LPWSTR [In],pcontext : IWSDXMLContext [In],ppdeviceproxy : IWSDDeviceProxy* [In]
  fun WSDCreateDeviceProxyAdvanced(pszdeviceid : LibC::LPWSTR, pdeviceaddress : IWSDAddress, pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, ppdeviceproxy : IWSDDeviceProxy*) : HRESULT

  # Params # pszdeviceid : LibC::LPWSTR [In],pszlocalid : LibC::LPWSTR [In],pcontext : IWSDXMLContext [In],pconfigparams : WSD_CONFIG_PARAM* [In],dwconfigparamcount : UInt32 [In],ppdeviceproxy : IWSDDeviceProxy* [In]
  fun WSDCreateDeviceProxy2(pszdeviceid : LibC::LPWSTR, pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, pconfigparams : WSD_CONFIG_PARAM*, dwconfigparamcount : UInt32, ppdeviceproxy : IWSDDeviceProxy*) : HRESULT

  # Params # pszlocalid : LibC::LPWSTR [In],pcontext : IWSDXMLContext [In],ppdevicehost : IWSDDeviceHost* [In]
  fun WSDCreateDeviceHost(pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, ppdevicehost : IWSDDeviceHost*) : HRESULT

  # Params # pszlocalid : LibC::LPWSTR [In],pcontext : IWSDXMLContext [In],pphostaddresses : IWSDAddress* [In],dwhostaddresscount : UInt32 [In],ppdevicehost : IWSDDeviceHost* [In]
  fun WSDCreateDeviceHostAdvanced(pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, pphostaddresses : IWSDAddress*, dwhostaddresscount : UInt32, ppdevicehost : IWSDDeviceHost*) : HRESULT

  # Params # pszlocalid : LibC::LPWSTR [In],pcontext : IWSDXMLContext [In],pconfigparams : WSD_CONFIG_PARAM* [In],dwconfigparamcount : UInt32 [In],ppdevicehost : IWSDDeviceHost* [In]
  fun WSDCreateDeviceHost2(pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, pconfigparams : WSD_CONFIG_PARAM*, dwconfigparamcount : UInt32, ppdevicehost : IWSDDeviceHost*) : HRESULT

  # Params # dwoption : UInt32 [In],pvoid : Void* [In],cbinbuffer : UInt32 [In]
  fun WSDSetConfigurationOption(dwoption : UInt32, pvoid : Void*, cbinbuffer : UInt32) : HRESULT

  # Params # dwoption : UInt32 [In],pvoid : Void* [In],cboutbuffer : UInt32 [In]
  fun WSDGetConfigurationOption(dwoption : UInt32, pvoid : Void*, cboutbuffer : UInt32) : HRESULT

  # Params # pparent : Void* [In],cbsize : LibC::UINT_PTR [In]
  fun WSDAllocateLinkedMemory(pparent : Void*, cbsize : LibC::UINT_PTR) : Void*

  # Params # pvoid : Void* [In]
  fun WSDFreeLinkedMemory(pvoid : Void*) : Void

  # Params # pparent : Void* [In],pchild : Void* [In]
  fun WSDAttachLinkedMemory(pparent : Void*, pchild : Void*) : Void

  # Params # pvoid : Void* [In]
  fun WSDDetachLinkedMemory(pvoid : Void*) : Void

  # Params # pelementname : WSDXML_NAME* [In],psztext : LibC::LPWSTR [In],ppany : WSDXML_ELEMENT** [In]
  fun WSDXMLBuildAnyForSingleElement(pelementname : WSDXML_NAME*, psztext : LibC::LPWSTR, ppany : WSDXML_ELEMENT**) : HRESULT

  # Params # psznamespace : LibC::LPWSTR [In],pszname : LibC::LPWSTR [In],pany : WSDXML_ELEMENT* [In],ppszvalue : LibC::LPWSTR* [In]
  fun WSDXMLGetValueFromAny(psznamespace : LibC::LPWSTR, pszname : LibC::LPWSTR, pany : WSDXML_ELEMENT*, ppszvalue : LibC::LPWSTR*) : HRESULT

  # Params # pfirst : WSDXML_ELEMENT* [In],psecond : WSDXML_ELEMENT* [In]
  fun WSDXMLAddSibling(pfirst : WSDXML_ELEMENT*, psecond : WSDXML_ELEMENT*) : HRESULT

  # Params # pparent : WSDXML_ELEMENT* [In],pchild : WSDXML_ELEMENT* [In]
  fun WSDXMLAddChild(pparent : WSDXML_ELEMENT*, pchild : WSDXML_ELEMENT*) : HRESULT

  # Params # pany : WSDXML_ELEMENT* [In]
  fun WSDXMLCleanupElement(pany : WSDXML_ELEMENT*) : HRESULT

  # Params # pszcode : LibC::LPWSTR [In],pszsubcode : LibC::LPWSTR [In],pszreason : LibC::LPWSTR [In],pszdetail : LibC::LPWSTR [In],pcontext : IWSDXMLContext [In],ppfault : WSD_SOAP_FAULT** [In]
  fun WSDGenerateFault(pszcode : LibC::LPWSTR, pszsubcode : LibC::LPWSTR, pszreason : LibC::LPWSTR, pszdetail : LibC::LPWSTR, pcontext : IWSDXMLContext, ppfault : WSD_SOAP_FAULT**) : HRESULT

  # Params # pcode : WSDXML_NAME* [In],psubcode : WSDXML_NAME* [In],preasons : WSD_LOCALIZED_STRING_LIST* [In],pszdetail : LibC::LPWSTR [In],ppfault : WSD_SOAP_FAULT** [In]
  fun WSDGenerateFaultEx(pcode : WSDXML_NAME*, psubcode : WSDXML_NAME*, preasons : WSD_LOCALIZED_STRING_LIST*, pszdetail : LibC::LPWSTR, ppfault : WSD_SOAP_FAULT**) : HRESULT

  # Params # source : Char* [In],cchsource : UInt32 [In],destout : LibC::LPWSTR* [In],cchdestout : UInt32* [In]
  fun WSDUriEncode(source : Char*, cchsource : UInt32, destout : LibC::LPWSTR*, cchdestout : UInt32*) : HRESULT

  # Params # source : Char* [In],cchsource : UInt32 [In],destout : LibC::LPWSTR* [In],cchdestout : UInt32* [In]
  fun WSDUriDecode(source : Char*, cchsource : UInt32, destout : LibC::LPWSTR*, cchdestout : UInt32*) : HRESULT
end
struct LibWin32::IWSDAddress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(Char*, UInt32, LibC::BOOL, HRESULT)).call(pszbuffer, cchlength, fsafe)
  end
  def deserialize(pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszbuffer)
  end
end
struct LibWin32::IWSDTransportAddress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(Char*, UInt32, LibC::BOOL, HRESULT)).call(pszbuffer, cchlength, fsafe)
  end
  def deserialize(pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszbuffer)
  end
  def get_port(pwport : UInt16*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(UInt16*, HRESULT)).call(pwport)
  end
  def set_port(wport : UInt16) : HRESULT
    @lpVtbl.value.set_port.unsafe_as(Proc(UInt16, HRESULT)).call(wport)
  end
  def get_transport_address(ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszaddress)
  end
  def get_transport_address_ex(fsafe : LibC::BOOL, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address_ex.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fsafe, ppszaddress)
  end
  def set_transport_address(pszaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transport_address.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszaddress)
  end
end
struct LibWin32::IWSDMessageParameters
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_local_address(ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_local_address.unsafe_as(Proc(IWSDAddress*, HRESULT)).call(ppaddress)
  end
  def set_local_address(paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_local_address.unsafe_as(Proc(IWSDAddress, HRESULT)).call(paddress)
  end
  def get_remote_address(ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_remote_address.unsafe_as(Proc(IWSDAddress*, HRESULT)).call(ppaddress)
  end
  def set_remote_address(paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_remote_address.unsafe_as(Proc(IWSDAddress, HRESULT)).call(paddress)
  end
  def get_lower_parameters(pptxparams : IWSDMessageParameters*) : HRESULT
    @lpVtbl.value.get_lower_parameters.unsafe_as(Proc(IWSDMessageParameters*, HRESULT)).call(pptxparams)
  end
end
struct LibWin32::IWSDUdpMessageParameters
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_local_address(ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_local_address.unsafe_as(Proc(IWSDAddress*, HRESULT)).call(ppaddress)
  end
  def set_local_address(paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_local_address.unsafe_as(Proc(IWSDAddress, HRESULT)).call(paddress)
  end
  def get_remote_address(ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_remote_address.unsafe_as(Proc(IWSDAddress*, HRESULT)).call(ppaddress)
  end
  def set_remote_address(paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_remote_address.unsafe_as(Proc(IWSDAddress, HRESULT)).call(paddress)
  end
  def get_lower_parameters(pptxparams : IWSDMessageParameters*) : HRESULT
    @lpVtbl.value.get_lower_parameters.unsafe_as(Proc(IWSDMessageParameters*, HRESULT)).call(pptxparams)
  end
  def set_retransmit_params(pparams : WSDUdpRetransmitParams*) : HRESULT
    @lpVtbl.value.set_retransmit_params.unsafe_as(Proc(WSDUdpRetransmitParams*, HRESULT)).call(pparams)
  end
  def get_retransmit_params(pparams : WSDUdpRetransmitParams*) : HRESULT
    @lpVtbl.value.get_retransmit_params.unsafe_as(Proc(WSDUdpRetransmitParams*, HRESULT)).call(pparams)
  end
end
struct LibWin32::IWSDUdpAddress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(Char*, UInt32, LibC::BOOL, HRESULT)).call(pszbuffer, cchlength, fsafe)
  end
  def deserialize(pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszbuffer)
  end
  def get_port(pwport : UInt16*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(UInt16*, HRESULT)).call(pwport)
  end
  def set_port(wport : UInt16) : HRESULT
    @lpVtbl.value.set_port.unsafe_as(Proc(UInt16, HRESULT)).call(wport)
  end
  def get_transport_address(ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszaddress)
  end
  def get_transport_address_ex(fsafe : LibC::BOOL, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address_ex.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fsafe, ppszaddress)
  end
  def set_transport_address(pszaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transport_address.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszaddress)
  end
  def set_sockaddr(psockaddr : SOCKADDR_STORAGE*) : HRESULT
    @lpVtbl.value.set_sockaddr.unsafe_as(Proc(SOCKADDR_STORAGE*, HRESULT)).call(psockaddr)
  end
  def get_sockaddr(psockaddr : SOCKADDR_STORAGE*) : HRESULT
    @lpVtbl.value.get_sockaddr.unsafe_as(Proc(SOCKADDR_STORAGE*, HRESULT)).call(psockaddr)
  end
  def set_exclusive(fexclusive : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_exclusive.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fexclusive)
  end
  def get_exclusive : HRESULT
    @lpVtbl.value.get_exclusive.unsafe_as(Proc(HRESULT)).call
  end
  def set_message_type(messagetype : WSDUdpMessageType) : HRESULT
    @lpVtbl.value.set_message_type.unsafe_as(Proc(WSDUdpMessageType, HRESULT)).call(messagetype)
  end
  def get_message_type(pmessagetype : WSDUdpMessageType*) : HRESULT
    @lpVtbl.value.get_message_type.unsafe_as(Proc(WSDUdpMessageType*, HRESULT)).call(pmessagetype)
  end
  def set_ttl(dwttl : UInt32) : HRESULT
    @lpVtbl.value.set_ttl.unsafe_as(Proc(UInt32, HRESULT)).call(dwttl)
  end
  def get_ttl(pdwttl : UInt32*) : HRESULT
    @lpVtbl.value.get_ttl.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwttl)
  end
  def set_alias(palias : Guid*) : HRESULT
    @lpVtbl.value.set_alias.unsafe_as(Proc(Guid*, HRESULT)).call(palias)
  end
  def get_alias(palias : Guid*) : HRESULT
    @lpVtbl.value.get_alias.unsafe_as(Proc(Guid*, HRESULT)).call(palias)
  end
end
struct LibWin32::IWSDHttpMessageParameters
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_local_address(ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_local_address.unsafe_as(Proc(IWSDAddress*, HRESULT)).call(ppaddress)
  end
  def set_local_address(paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_local_address.unsafe_as(Proc(IWSDAddress, HRESULT)).call(paddress)
  end
  def get_remote_address(ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_remote_address.unsafe_as(Proc(IWSDAddress*, HRESULT)).call(ppaddress)
  end
  def set_remote_address(paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_remote_address.unsafe_as(Proc(IWSDAddress, HRESULT)).call(paddress)
  end
  def get_lower_parameters(pptxparams : IWSDMessageParameters*) : HRESULT
    @lpVtbl.value.get_lower_parameters.unsafe_as(Proc(IWSDMessageParameters*, HRESULT)).call(pptxparams)
  end
  def set_inbound_http_headers(pszheaders : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_inbound_http_headers.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszheaders)
  end
  def get_inbound_http_headers(ppszheaders : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_inbound_http_headers.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszheaders)
  end
  def set_outbound_http_headers(pszheaders : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_outbound_http_headers.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszheaders)
  end
  def get_outbound_http_headers(ppszheaders : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_outbound_http_headers.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszheaders)
  end
  def set_id(pszid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszid)
  end
  def get_id(ppszid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszid)
  end
  def set_context(pcontext : IUnknown) : HRESULT
    @lpVtbl.value.set_context.unsafe_as(Proc(IUnknown, HRESULT)).call(pcontext)
  end
  def get_context(ppcontext : IUnknown*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppcontext)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWSDHttpAddress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(Char*, UInt32, LibC::BOOL, HRESULT)).call(pszbuffer, cchlength, fsafe)
  end
  def deserialize(pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszbuffer)
  end
  def get_port(pwport : UInt16*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(UInt16*, HRESULT)).call(pwport)
  end
  def set_port(wport : UInt16) : HRESULT
    @lpVtbl.value.set_port.unsafe_as(Proc(UInt16, HRESULT)).call(wport)
  end
  def get_transport_address(ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszaddress)
  end
  def get_transport_address_ex(fsafe : LibC::BOOL, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address_ex.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fsafe, ppszaddress)
  end
  def set_transport_address(pszaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transport_address.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszaddress)
  end
  def get_secure : HRESULT
    @lpVtbl.value.get_secure.unsafe_as(Proc(HRESULT)).call
  end
  def set_secure(fsecure : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_secure.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fsecure)
  end
  def get_path(ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszpath)
  end
  def set_path(pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_path.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszpath)
  end
end
struct LibWin32::IWSDSSLClientCertificate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client_certificate(ppcertcontext : CERT_CONTEXT**) : HRESULT
    @lpVtbl.value.get_client_certificate.unsafe_as(Proc(CERT_CONTEXT**, HRESULT)).call(ppcertcontext)
  end
  def get_mapped_access_token(phtoken : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_mapped_access_token.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(phtoken)
  end
end
struct LibWin32::IWSDHttpAuthParameters
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client_access_token(phtoken : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_client_access_token.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(phtoken)
  end
  def get_auth_type(pauthtype : UInt32*) : HRESULT
    @lpVtbl.value.get_auth_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pauthtype)
  end
end
struct LibWin32::IWSDSignatureProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_message_signed(pbsigned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_message_signed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbsigned)
  end
  def is_message_signature_trusted(pbsignaturetrusted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_message_signature_trusted.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbsignaturetrusted)
  end
  def get_key_info(pbkeyinfo : UInt8*, pdwkeyinfosize : UInt32*) : HRESULT
    @lpVtbl.value.get_key_info.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbkeyinfo, pdwkeyinfosize)
  end
  def get_signature(pbsignature : UInt8*, pdwsignaturesize : UInt32*) : HRESULT
    @lpVtbl.value.get_signature.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbsignature, pdwsignaturesize)
  end
  def get_signed_info_hash(pbsignedinfohash : UInt8*, pdwhashsize : UInt32*) : HRESULT
    @lpVtbl.value.get_signed_info_hash.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbsignedinfohash, pdwhashsize)
  end
end
struct LibWin32::IWSDAttachment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IWSDOutboundAttachment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def write(pbuffer : UInt8*, dwbytestowrite : UInt32, pdwnumberofbyteswritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(UInt8*, UInt32, UInt32*, HRESULT)).call(pbuffer, dwbytestowrite, pdwnumberofbyteswritten)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWSDInboundAttachment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pbuffer : UInt8*, dwbytestoread : UInt32, pdwnumberofbytesread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt8*, UInt32, UInt32*, HRESULT)).call(pbuffer, dwbytestoread, pdwnumberofbytesread)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWSDXMLContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_namespace(pszuri : LibC::LPWSTR, pszsuggestedprefix : LibC::LPWSTR, ppnamespace : WSDXML_NAMESPACE**) : HRESULT
    @lpVtbl.value.add_namespace.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, WSDXML_NAMESPACE**, HRESULT)).call(pszuri, pszsuggestedprefix, ppnamespace)
  end
  def add_name_to_namespace(pszuri : LibC::LPWSTR, pszname : LibC::LPWSTR, ppname : WSDXML_NAME**) : HRESULT
    @lpVtbl.value.add_name_to_namespace.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, WSDXML_NAME**, HRESULT)).call(pszuri, pszname, ppname)
  end
  def set_namespaces(pnamespaces : WSDXML_NAMESPACE**, wnamespacescount : UInt16, blayernumber : UInt8) : HRESULT
    @lpVtbl.value.set_namespaces.unsafe_as(Proc(WSDXML_NAMESPACE**, UInt16, UInt8, HRESULT)).call(pnamespaces, wnamespacescount, blayernumber)
  end
  def set_types(ptypes : WSDXML_TYPE**, dwtypescount : UInt32, blayernumber : UInt8) : HRESULT
    @lpVtbl.value.set_types.unsafe_as(Proc(WSDXML_TYPE**, UInt32, UInt8, HRESULT)).call(ptypes, dwtypescount, blayernumber)
  end
end
struct LibWin32::IWSDiscoveryProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_address_family(dwaddressfamily : UInt32) : HRESULT
    @lpVtbl.value.set_address_family.unsafe_as(Proc(UInt32, HRESULT)).call(dwaddressfamily)
  end
  def attach(psink : IWSDiscoveryProviderNotify) : HRESULT
    @lpVtbl.value.attach.unsafe_as(Proc(IWSDiscoveryProviderNotify, HRESULT)).call(psink)
  end
  def detach : HRESULT
    @lpVtbl.value.detach.unsafe_as(Proc(HRESULT)).call
  end
  def search_by_id(pszid : LibC::LPWSTR, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_by_id.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszid, psztag)
  end
  def search_by_address(pszaddress : LibC::LPWSTR, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_by_address.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszaddress, psztag)
  end
  def search_by_type(ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pszmatchby : LibC::LPWSTR, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_by_type.unsafe_as(Proc(WSD_NAME_LIST*, WSD_URI_LIST*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(ptypeslist, pscopeslist, pszmatchby, psztag)
  end
  def get_xml_context(ppcontext : IWSDXMLContext*) : HRESULT
    @lpVtbl.value.get_xml_context.unsafe_as(Proc(IWSDXMLContext*, HRESULT)).call(ppcontext)
  end
end
struct LibWin32::IWSDiscoveryProviderNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add(pservice : IWSDiscoveredService) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IWSDiscoveredService, HRESULT)).call(pservice)
  end
  def remove(pservice : IWSDiscoveredService) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(IWSDiscoveredService, HRESULT)).call(pservice)
  end
  def search_failed(hr : HRESULT, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_failed.unsafe_as(Proc(HRESULT, LibC::LPWSTR, HRESULT)).call(hr, psztag)
  end
  def search_complete(psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_complete.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztag)
  end
end
struct LibWin32::IWSDiscoveredService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_endpoint_reference(ppendpointreference : WSD_ENDPOINT_REFERENCE**) : HRESULT
    @lpVtbl.value.get_endpoint_reference.unsafe_as(Proc(WSD_ENDPOINT_REFERENCE**, HRESULT)).call(ppendpointreference)
  end
  def get_types(pptypeslist : WSD_NAME_LIST**) : HRESULT
    @lpVtbl.value.get_types.unsafe_as(Proc(WSD_NAME_LIST**, HRESULT)).call(pptypeslist)
  end
  def get_scopes(ppscopeslist : WSD_URI_LIST**) : HRESULT
    @lpVtbl.value.get_scopes.unsafe_as(Proc(WSD_URI_LIST**, HRESULT)).call(ppscopeslist)
  end
  def get_x_addrs(ppxaddrslist : WSD_URI_LIST**) : HRESULT
    @lpVtbl.value.get_x_addrs.unsafe_as(Proc(WSD_URI_LIST**, HRESULT)).call(ppxaddrslist)
  end
  def get_metadata_version(pullmetadataversion : UInt64*) : HRESULT
    @lpVtbl.value.get_metadata_version.unsafe_as(Proc(UInt64*, HRESULT)).call(pullmetadataversion)
  end
  def get_extended_disco_xml(ppheaderany : WSDXML_ELEMENT**, ppbodyany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.get_extended_disco_xml.unsafe_as(Proc(WSDXML_ELEMENT**, WSDXML_ELEMENT**, HRESULT)).call(ppheaderany, ppbodyany)
  end
  def get_probe_resolve_tag(ppsztag : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_probe_resolve_tag.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppsztag)
  end
  def get_remote_transport_address(ppszremotetransportaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_transport_address.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszremotetransportaddress)
  end
  def get_local_transport_address(ppszlocaltransportaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_transport_address.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszlocaltransportaddress)
  end
  def get_local_interface_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_local_interface_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_instance_id(pullinstanceid : UInt64*) : HRESULT
    @lpVtbl.value.get_instance_id.unsafe_as(Proc(UInt64*, HRESULT)).call(pullinstanceid)
  end
end
struct LibWin32::IWSDiscoveryPublisher
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_address_family(dwaddressfamily : UInt32) : HRESULT
    @lpVtbl.value.set_address_family.unsafe_as(Proc(UInt32, HRESULT)).call(dwaddressfamily)
  end
  def register_notification_sink(psink : IWSDiscoveryPublisherNotify) : HRESULT
    @lpVtbl.value.register_notification_sink.unsafe_as(Proc(IWSDiscoveryPublisherNotify, HRESULT)).call(psink)
  end
  def un_register_notification_sink(psink : IWSDiscoveryPublisherNotify) : HRESULT
    @lpVtbl.value.un_register_notification_sink.unsafe_as(Proc(IWSDiscoveryPublisherNotify, HRESULT)).call(psink)
  end
  def publish(pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*) : HRESULT
    @lpVtbl.value.publish.unsafe_as(Proc(LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, HRESULT)).call(pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist)
  end
  def un_publish(pszid : LibC::LPWSTR, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.un_publish.unsafe_as(Proc(LibC::LPWSTR, UInt64, UInt64, LibC::LPWSTR, WSDXML_ELEMENT*, HRESULT)).call(pszid, ullinstanceid, ullmessagenumber, pszsessionid, pany)
  end
  def match_probe(pprobemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*) : HRESULT
    @lpVtbl.value.match_probe.unsafe_as(Proc(WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, HRESULT)).call(pprobemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist)
  end
  def match_resolve(presolvemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*) : HRESULT
    @lpVtbl.value.match_resolve.unsafe_as(Proc(WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, HRESULT)).call(presolvemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist)
  end
  def publish_ex(pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*, pheaderany : WSDXML_ELEMENT*, preferenceparameterany : WSDXML_ELEMENT*, ppolicyany : WSDXML_ELEMENT*, pendpointreferenceany : WSDXML_ELEMENT*, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.publish_ex.unsafe_as(Proc(LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, HRESULT)).call(pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist, pheaderany, preferenceparameterany, ppolicyany, pendpointreferenceany, pany)
  end
  def match_probe_ex(pprobemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*, pheaderany : WSDXML_ELEMENT*, preferenceparameterany : WSDXML_ELEMENT*, ppolicyany : WSDXML_ELEMENT*, pendpointreferenceany : WSDXML_ELEMENT*, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.match_probe_ex.unsafe_as(Proc(WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, HRESULT)).call(pprobemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist, pheaderany, preferenceparameterany, ppolicyany, pendpointreferenceany, pany)
  end
  def match_resolve_ex(presolvemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*, pheaderany : WSDXML_ELEMENT*, preferenceparameterany : WSDXML_ELEMENT*, ppolicyany : WSDXML_ELEMENT*, pendpointreferenceany : WSDXML_ELEMENT*, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.match_resolve_ex.unsafe_as(Proc(WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, HRESULT)).call(presolvemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist, pheaderany, preferenceparameterany, ppolicyany, pendpointreferenceany, pany)
  end
  def register_scope_matching_rule(pscopematchingrule : IWSDScopeMatchingRule) : HRESULT
    @lpVtbl.value.register_scope_matching_rule.unsafe_as(Proc(IWSDScopeMatchingRule, HRESULT)).call(pscopematchingrule)
  end
  def un_register_scope_matching_rule(pscopematchingrule : IWSDScopeMatchingRule) : HRESULT
    @lpVtbl.value.un_register_scope_matching_rule.unsafe_as(Proc(IWSDScopeMatchingRule, HRESULT)).call(pscopematchingrule)
  end
  def get_xml_context(ppcontext : IWSDXMLContext*) : HRESULT
    @lpVtbl.value.get_xml_context.unsafe_as(Proc(IWSDXMLContext*, HRESULT)).call(ppcontext)
  end
end
struct LibWin32::IWSDiscoveryPublisherNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def probe_handler(psoap : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters) : HRESULT
    @lpVtbl.value.probe_handler.unsafe_as(Proc(WSD_SOAP_MESSAGE*, IWSDMessageParameters, HRESULT)).call(psoap, pmessageparameters)
  end
  def resolve_handler(psoap : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters) : HRESULT
    @lpVtbl.value.resolve_handler.unsafe_as(Proc(WSD_SOAP_MESSAGE*, IWSDMessageParameters, HRESULT)).call(psoap, pmessageparameters)
  end
end
struct LibWin32::IWSDScopeMatchingRule
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_scope_rule(ppszscopematchingrule : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_scope_rule.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszscopematchingrule)
  end
  def match_scopes(pszscope1 : LibC::LPWSTR, pszscope2 : LibC::LPWSTR, pfmatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.match_scopes.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(pszscope1, pszscope2, pfmatch)
  end
end
struct LibWin32::IWSDEndpointProxy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def send_one_way_request(pbody : Void*, poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.send_one_way_request.unsafe_as(Proc(Void*, WSD_OPERATION*, HRESULT)).call(pbody, poperation)
  end
  def send_two_way_request(pbody : Void*, poperation : WSD_OPERATION*, presponsecontext : WSD_SYNCHRONOUS_RESPONSE_CONTEXT*) : HRESULT
    @lpVtbl.value.send_two_way_request.unsafe_as(Proc(Void*, WSD_OPERATION*, WSD_SYNCHRONOUS_RESPONSE_CONTEXT*, HRESULT)).call(pbody, poperation, presponsecontext)
  end
  def send_two_way_request_async(pbody : Void*, poperation : WSD_OPERATION*, pasyncstate : IUnknown, pcallback : IWSDAsyncCallback, presult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.send_two_way_request_async.unsafe_as(Proc(Void*, WSD_OPERATION*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)).call(pbody, poperation, pasyncstate, pcallback, presult)
  end
  def abort_async_operation(pasyncresult : IWSDAsyncResult) : HRESULT
    @lpVtbl.value.abort_async_operation.unsafe_as(Proc(IWSDAsyncResult, HRESULT)).call(pasyncresult)
  end
  def process_fault(pfault : WSD_SOAP_FAULT*) : HRESULT
    @lpVtbl.value.process_fault.unsafe_as(Proc(WSD_SOAP_FAULT*, HRESULT)).call(pfault)
  end
  def get_error_info(ppszerrorinfo : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_error_info.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszerrorinfo)
  end
  def get_fault_info(ppfault : WSD_SOAP_FAULT**) : HRESULT
    @lpVtbl.value.get_fault_info.unsafe_as(Proc(WSD_SOAP_FAULT**, HRESULT)).call(ppfault)
  end
end
struct LibWin32::IWSDMetadataExchange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_metadata(metadataout : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_metadata.unsafe_as(Proc(WSD_METADATA_SECTION_LIST**, HRESULT)).call(metadataout)
  end
end
struct LibWin32::IWSDServiceProxy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_metadata(metadataout : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_metadata.unsafe_as(Proc(WSD_METADATA_SECTION_LIST**, HRESULT)).call(metadataout)
  end
  def begin_get_metadata(ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_metadata.unsafe_as(Proc(IWSDAsyncResult*, HRESULT)).call(ppresult)
  end
  def end_get_metadata(presult : IWSDAsyncResult, ppmetadata : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.end_get_metadata.unsafe_as(Proc(IWSDAsyncResult, WSD_METADATA_SECTION_LIST**, HRESULT)).call(presult, ppmetadata)
  end
  def get_service_metadata(ppservicemetadata : WSD_SERVICE_METADATA**) : HRESULT
    @lpVtbl.value.get_service_metadata.unsafe_as(Proc(WSD_SERVICE_METADATA**, HRESULT)).call(ppservicemetadata)
  end
  def subscribe_to_operation(poperation : WSD_OPERATION*, punknown : IUnknown, pany : WSDXML_ELEMENT*, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.subscribe_to_operation.unsafe_as(Proc(WSD_OPERATION*, IUnknown, WSDXML_ELEMENT*, WSDXML_ELEMENT**, HRESULT)).call(poperation, punknown, pany, ppany)
  end
  def unsubscribe_to_operation(poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.unsubscribe_to_operation.unsafe_as(Proc(WSD_OPERATION*, HRESULT)).call(poperation)
  end
  def set_eventing_status_callback(pstatus : IWSDEventingStatus) : HRESULT
    @lpVtbl.value.set_eventing_status_callback.unsafe_as(Proc(IWSDEventingStatus, HRESULT)).call(pstatus)
  end
  def get_endpoint_proxy(ppproxy : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.unsafe_as(Proc(IWSDEndpointProxy*, HRESULT)).call(ppproxy)
  end
end
struct LibWin32::IWSDServiceProxyEventing
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_metadata(metadataout : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_metadata.unsafe_as(Proc(WSD_METADATA_SECTION_LIST**, HRESULT)).call(metadataout)
  end
  def begin_get_metadata(ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_metadata.unsafe_as(Proc(IWSDAsyncResult*, HRESULT)).call(ppresult)
  end
  def end_get_metadata(presult : IWSDAsyncResult, ppmetadata : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.end_get_metadata.unsafe_as(Proc(IWSDAsyncResult, WSD_METADATA_SECTION_LIST**, HRESULT)).call(presult, ppmetadata)
  end
  def get_service_metadata(ppservicemetadata : WSD_SERVICE_METADATA**) : HRESULT
    @lpVtbl.value.get_service_metadata.unsafe_as(Proc(WSD_SERVICE_METADATA**, HRESULT)).call(ppservicemetadata)
  end
  def subscribe_to_operation(poperation : WSD_OPERATION*, punknown : IUnknown, pany : WSDXML_ELEMENT*, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.subscribe_to_operation.unsafe_as(Proc(WSD_OPERATION*, IUnknown, WSDXML_ELEMENT*, WSDXML_ELEMENT**, HRESULT)).call(poperation, punknown, pany, ppany)
  end
  def unsubscribe_to_operation(poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.unsubscribe_to_operation.unsafe_as(Proc(WSD_OPERATION*, HRESULT)).call(poperation)
  end
  def set_eventing_status_callback(pstatus : IWSDEventingStatus) : HRESULT
    @lpVtbl.value.set_eventing_status_callback.unsafe_as(Proc(IWSDEventingStatus, HRESULT)).call(pstatus)
  end
  def get_endpoint_proxy(ppproxy : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.unsafe_as(Proc(IWSDEndpointProxy*, HRESULT)).call(ppproxy)
  end
  def subscribe_to_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, punknown : IUnknown, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.subscribe_to_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, IUnknown, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)).call(poperations, dwoperationcount, punknown, pexpires, pany, ppexpires, ppany)
  end
  def begin_subscribe_to_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, punknown : IUnknown, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_subscribe_to_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, IUnknown, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)).call(poperations, dwoperationcount, punknown, pexpires, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_subscribe_to_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.end_subscribe_to_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)).call(poperations, dwoperationcount, presult, ppexpires, ppany)
  end
  def unsubscribe_to_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.unsubscribe_to_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, HRESULT)).call(poperations, dwoperationcount, pany)
  end
  def begin_unsubscribe_to_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_unsubscribe_to_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)).call(poperations, dwoperationcount, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_unsubscribe_to_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult) : HRESULT
    @lpVtbl.value.end_unsubscribe_to_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, IWSDAsyncResult, HRESULT)).call(poperations, dwoperationcount, presult)
  end
  def renew_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.renew_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)).call(poperations, dwoperationcount, pexpires, pany, ppexpires, ppany)
  end
  def begin_renew_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_renew_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)).call(poperations, dwoperationcount, pexpires, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_renew_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.end_renew_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)).call(poperations, dwoperationcount, presult, ppexpires, ppany)
  end
  def get_status_for_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.get_status_for_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)).call(poperations, dwoperationcount, pany, ppexpires, ppany)
  end
  def begin_get_status_for_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_status_for_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)).call(poperations, dwoperationcount, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_get_status_for_multiple_operations(poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.end_get_status_for_multiple_operations.unsafe_as(Proc(WSD_OPERATION*, UInt32, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)).call(poperations, dwoperationcount, presult, ppexpires, ppany)
  end
end
struct LibWin32::IWSDDeviceProxy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init(pszdeviceid : LibC::LPWSTR, pdeviceaddress : IWSDAddress, pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, psponsor : IWSDDeviceProxy) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(LibC::LPWSTR, IWSDAddress, LibC::LPWSTR, IWSDXMLContext, IWSDDeviceProxy, HRESULT)).call(pszdeviceid, pdeviceaddress, pszlocalid, pcontext, psponsor)
  end
  def begin_get_metadata(ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_metadata.unsafe_as(Proc(IWSDAsyncResult*, HRESULT)).call(ppresult)
  end
  def end_get_metadata(presult : IWSDAsyncResult) : HRESULT
    @lpVtbl.value.end_get_metadata.unsafe_as(Proc(IWSDAsyncResult, HRESULT)).call(presult)
  end
  def get_host_metadata(pphostmetadata : WSD_HOST_METADATA**) : HRESULT
    @lpVtbl.value.get_host_metadata.unsafe_as(Proc(WSD_HOST_METADATA**, HRESULT)).call(pphostmetadata)
  end
  def get_this_model_metadata(ppmanufacturermetadata : WSD_THIS_MODEL_METADATA**) : HRESULT
    @lpVtbl.value.get_this_model_metadata.unsafe_as(Proc(WSD_THIS_MODEL_METADATA**, HRESULT)).call(ppmanufacturermetadata)
  end
  def get_this_device_metadata(ppthisdevicemetadata : WSD_THIS_DEVICE_METADATA**) : HRESULT
    @lpVtbl.value.get_this_device_metadata.unsafe_as(Proc(WSD_THIS_DEVICE_METADATA**, HRESULT)).call(ppthisdevicemetadata)
  end
  def get_all_metadata(ppmetadata : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_all_metadata.unsafe_as(Proc(WSD_METADATA_SECTION_LIST**, HRESULT)).call(ppmetadata)
  end
  def get_service_proxy_by_id(pszserviceid : LibC::LPWSTR, ppserviceproxy : IWSDServiceProxy*) : HRESULT
    @lpVtbl.value.get_service_proxy_by_id.unsafe_as(Proc(LibC::LPWSTR, IWSDServiceProxy*, HRESULT)).call(pszserviceid, ppserviceproxy)
  end
  def get_service_proxy_by_type(ptype : WSDXML_NAME*, ppserviceproxy : IWSDServiceProxy*) : HRESULT
    @lpVtbl.value.get_service_proxy_by_type.unsafe_as(Proc(WSDXML_NAME*, IWSDServiceProxy*, HRESULT)).call(ptype, ppserviceproxy)
  end
  def get_endpoint_proxy(ppproxy : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.unsafe_as(Proc(IWSDEndpointProxy*, HRESULT)).call(ppproxy)
  end
end
struct LibWin32::IWSDAsyncResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_callback(pcallback : IWSDAsyncCallback, pasyncstate : IUnknown) : HRESULT
    @lpVtbl.value.set_callback.unsafe_as(Proc(IWSDAsyncCallback, IUnknown, HRESULT)).call(pcallback, pasyncstate)
  end
  def set_wait_handle(hwaithandle : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_wait_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwaithandle)
  end
  def has_completed : HRESULT
    @lpVtbl.value.has_completed.unsafe_as(Proc(HRESULT)).call
  end
  def get_async_state(ppasyncstate : IUnknown*) : HRESULT
    @lpVtbl.value.get_async_state.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppasyncstate)
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
  def get_event(pevent : WSD_EVENT*) : HRESULT
    @lpVtbl.value.get_event.unsafe_as(Proc(WSD_EVENT*, HRESULT)).call(pevent)
  end
  def get_endpoint_proxy(ppendpoint : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.unsafe_as(Proc(IWSDEndpointProxy*, HRESULT)).call(ppendpoint)
  end
end
struct LibWin32::IWSDAsyncCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def async_operation_complete(pasyncresult : IWSDAsyncResult, pasyncstate : IUnknown) : HRESULT
    @lpVtbl.value.async_operation_complete.unsafe_as(Proc(IWSDAsyncResult, IUnknown, HRESULT)).call(pasyncresult, pasyncstate)
  end
end
struct LibWin32::IWSDEventingStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def subscription_renewed(pszsubscriptionaction : LibC::LPWSTR) : Void
    @lpVtbl.value.subscription_renewed.unsafe_as(Proc(LibC::LPWSTR, Void)).call(pszsubscriptionaction)
  end
  def subscription_renewal_failed(pszsubscriptionaction : LibC::LPWSTR, hr : HRESULT) : Void
    @lpVtbl.value.subscription_renewal_failed.unsafe_as(Proc(LibC::LPWSTR, HRESULT, Void)).call(pszsubscriptionaction, hr)
  end
  def subscription_ended(pszsubscriptionaction : LibC::LPWSTR) : Void
    @lpVtbl.value.subscription_ended.unsafe_as(Proc(LibC::LPWSTR, Void)).call(pszsubscriptionaction)
  end
end
struct LibWin32::IWSDDeviceHost
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init(pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, pphostaddresses : IWSDAddress*, dwhostaddresscount : UInt32) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(LibC::LPWSTR, IWSDXMLContext, IWSDAddress*, UInt32, HRESULT)).call(pszlocalid, pcontext, pphostaddresses, dwhostaddresscount)
  end
  def start(ullinstanceid : UInt64, pscopelist : WSD_URI_LIST*, pnotificationsink : IWSDDeviceHostNotify) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(UInt64, WSD_URI_LIST*, IWSDDeviceHostNotify, HRESULT)).call(ullinstanceid, pscopelist, pnotificationsink)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def terminate : HRESULT
    @lpVtbl.value.terminate.unsafe_as(Proc(HRESULT)).call
  end
  def register_port_type(pporttype : WSD_PORT_TYPE*) : HRESULT
    @lpVtbl.value.register_port_type.unsafe_as(Proc(WSD_PORT_TYPE*, HRESULT)).call(pporttype)
  end
  def set_metadata(pthismodelmetadata : WSD_THIS_MODEL_METADATA*, pthisdevicemetadata : WSD_THIS_DEVICE_METADATA*, phostmetadata : WSD_HOST_METADATA*, pcustommetadata : WSD_METADATA_SECTION_LIST*) : HRESULT
    @lpVtbl.value.set_metadata.unsafe_as(Proc(WSD_THIS_MODEL_METADATA*, WSD_THIS_DEVICE_METADATA*, WSD_HOST_METADATA*, WSD_METADATA_SECTION_LIST*, HRESULT)).call(pthismodelmetadata, pthisdevicemetadata, phostmetadata, pcustommetadata)
  end
  def register_service(pszserviceid : LibC::LPWSTR, pservice : IUnknown) : HRESULT
    @lpVtbl.value.register_service.unsafe_as(Proc(LibC::LPWSTR, IUnknown, HRESULT)).call(pszserviceid, pservice)
  end
  def retire_service(pszserviceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.retire_service.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszserviceid)
  end
  def add_dynamic_service(pszserviceid : LibC::LPWSTR, pszendpointaddress : LibC::LPWSTR, pporttype : WSD_PORT_TYPE*, pportname : WSDXML_NAME*, pany : WSDXML_ELEMENT*, pservice : IUnknown) : HRESULT
    @lpVtbl.value.add_dynamic_service.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, WSD_PORT_TYPE*, WSDXML_NAME*, WSDXML_ELEMENT*, IUnknown, HRESULT)).call(pszserviceid, pszendpointaddress, pporttype, pportname, pany, pservice)
  end
  def remove_dynamic_service(pszserviceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_dynamic_service.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszserviceid)
  end
  def set_service_discoverable(pszserviceid : LibC::LPWSTR, fdiscoverable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_service_discoverable.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszserviceid, fdiscoverable)
  end
  def signal_event(pszserviceid : LibC::LPWSTR, pbody : Void*, poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.signal_event.unsafe_as(Proc(LibC::LPWSTR, Void*, WSD_OPERATION*, HRESULT)).call(pszserviceid, pbody, poperation)
  end
end
struct LibWin32::IWSDDeviceHostNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_service(pszserviceid : LibC::LPWSTR, ppservice : IUnknown*) : HRESULT
    @lpVtbl.value.get_service.unsafe_as(Proc(LibC::LPWSTR, IUnknown*, HRESULT)).call(pszserviceid, ppservice)
  end
end
struct LibWin32::IWSDServiceMessaging
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def send_response(pbody : Void*, poperation : WSD_OPERATION*, pmessageparameters : IWSDMessageParameters) : HRESULT
    @lpVtbl.value.send_response.unsafe_as(Proc(Void*, WSD_OPERATION*, IWSDMessageParameters, HRESULT)).call(pbody, poperation, pmessageparameters)
  end
  def fault_request(prequestheader : WSD_SOAP_HEADER*, pmessageparameters : IWSDMessageParameters, pfault : WSD_SOAP_FAULT*) : HRESULT
    @lpVtbl.value.fault_request.unsafe_as(Proc(WSD_SOAP_HEADER*, IWSDMessageParameters, WSD_SOAP_FAULT*, HRESULT)).call(prequestheader, pmessageparameters, pfault)
  end
end
