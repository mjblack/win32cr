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
    query_interface : Proc(IWSDAddress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDAddress*, UInt32)
    release : Proc(IWSDAddress*, UInt32)
    serialize : Proc(IWSDAddress*, Char*, UInt32, LibC::BOOL, HRESULT)
    deserialize : Proc(IWSDAddress*, LibC::LPWSTR, HRESULT)
  end

  IWSDAddress_GUID = "b9574c6c-12a6-4f74-93a1-3318ff605759"
  IID_IWSDAddress = LibC::GUID.new(0xb9574c6c_u32, 0x12a6_u16, 0x4f74_u16, StaticArray[0x93_u8, 0xa1_u8, 0x33_u8, 0x18_u8, 0xff_u8, 0x60_u8, 0x57_u8, 0x59_u8])
  struct IWSDAddress
    lpVtbl : IWSDAddressVTbl*
  end

  struct IWSDTransportAddressVTbl
    query_interface : Proc(IWSDTransportAddress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDTransportAddress*, UInt32)
    release : Proc(IWSDTransportAddress*, UInt32)
    serialize : Proc(IWSDTransportAddress*, Char*, UInt32, LibC::BOOL, HRESULT)
    deserialize : Proc(IWSDTransportAddress*, LibC::LPWSTR, HRESULT)
    get_port : Proc(IWSDTransportAddress*, UInt16*, HRESULT)
    set_port : Proc(IWSDTransportAddress*, UInt16, HRESULT)
    get_transport_address : Proc(IWSDTransportAddress*, LibC::LPWSTR*, HRESULT)
    get_transport_address_ex : Proc(IWSDTransportAddress*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    set_transport_address : Proc(IWSDTransportAddress*, LibC::LPWSTR, HRESULT)
  end

  IWSDTransportAddress_GUID = "70d23498-4ee6-4340-a3df-d845d2235467"
  IID_IWSDTransportAddress = LibC::GUID.new(0x70d23498_u32, 0x4ee6_u16, 0x4340_u16, StaticArray[0xa3_u8, 0xdf_u8, 0xd8_u8, 0x45_u8, 0xd2_u8, 0x23_u8, 0x54_u8, 0x67_u8])
  struct IWSDTransportAddress
    lpVtbl : IWSDTransportAddressVTbl*
  end

  struct IWSDMessageParametersVTbl
    query_interface : Proc(IWSDMessageParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDMessageParameters*, UInt32)
    release : Proc(IWSDMessageParameters*, UInt32)
    get_local_address : Proc(IWSDMessageParameters*, IWSDAddress*, HRESULT)
    set_local_address : Proc(IWSDMessageParameters*, IWSDAddress, HRESULT)
    get_remote_address : Proc(IWSDMessageParameters*, IWSDAddress*, HRESULT)
    set_remote_address : Proc(IWSDMessageParameters*, IWSDAddress, HRESULT)
    get_lower_parameters : Proc(IWSDMessageParameters*, IWSDMessageParameters*, HRESULT)
  end

  IWSDMessageParameters_GUID = "1fafe8a2-e6fc-4b80-b6cf-b7d45c416d7c"
  IID_IWSDMessageParameters = LibC::GUID.new(0x1fafe8a2_u32, 0xe6fc_u16, 0x4b80_u16, StaticArray[0xb6_u8, 0xcf_u8, 0xb7_u8, 0xd4_u8, 0x5c_u8, 0x41_u8, 0x6d_u8, 0x7c_u8])
  struct IWSDMessageParameters
    lpVtbl : IWSDMessageParametersVTbl*
  end

  struct IWSDUdpMessageParametersVTbl
    query_interface : Proc(IWSDUdpMessageParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDUdpMessageParameters*, UInt32)
    release : Proc(IWSDUdpMessageParameters*, UInt32)
    get_local_address : Proc(IWSDUdpMessageParameters*, IWSDAddress*, HRESULT)
    set_local_address : Proc(IWSDUdpMessageParameters*, IWSDAddress, HRESULT)
    get_remote_address : Proc(IWSDUdpMessageParameters*, IWSDAddress*, HRESULT)
    set_remote_address : Proc(IWSDUdpMessageParameters*, IWSDAddress, HRESULT)
    get_lower_parameters : Proc(IWSDUdpMessageParameters*, IWSDMessageParameters*, HRESULT)
    set_retransmit_params : Proc(IWSDUdpMessageParameters*, WSDUdpRetransmitParams*, HRESULT)
    get_retransmit_params : Proc(IWSDUdpMessageParameters*, WSDUdpRetransmitParams*, HRESULT)
  end

  IWSDUdpMessageParameters_GUID = "9934149f-8f0c-447b-aa0b-73124b0ca7f0"
  IID_IWSDUdpMessageParameters = LibC::GUID.new(0x9934149f_u32, 0x8f0c_u16, 0x447b_u16, StaticArray[0xaa_u8, 0xb_u8, 0x73_u8, 0x12_u8, 0x4b_u8, 0xc_u8, 0xa7_u8, 0xf0_u8])
  struct IWSDUdpMessageParameters
    lpVtbl : IWSDUdpMessageParametersVTbl*
  end

  struct IWSDUdpAddressVTbl
    query_interface : Proc(IWSDUdpAddress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDUdpAddress*, UInt32)
    release : Proc(IWSDUdpAddress*, UInt32)
    serialize : Proc(IWSDUdpAddress*, Char*, UInt32, LibC::BOOL, HRESULT)
    deserialize : Proc(IWSDUdpAddress*, LibC::LPWSTR, HRESULT)
    get_port : Proc(IWSDUdpAddress*, UInt16*, HRESULT)
    set_port : Proc(IWSDUdpAddress*, UInt16, HRESULT)
    get_transport_address : Proc(IWSDUdpAddress*, LibC::LPWSTR*, HRESULT)
    get_transport_address_ex : Proc(IWSDUdpAddress*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    set_transport_address : Proc(IWSDUdpAddress*, LibC::LPWSTR, HRESULT)
    set_sockaddr : Proc(IWSDUdpAddress*, SOCKADDR_STORAGE*, HRESULT)
    get_sockaddr : Proc(IWSDUdpAddress*, SOCKADDR_STORAGE*, HRESULT)
    set_exclusive : Proc(IWSDUdpAddress*, LibC::BOOL, HRESULT)
    get_exclusive : Proc(IWSDUdpAddress*, HRESULT)
    set_message_type : Proc(IWSDUdpAddress*, WSDUdpMessageType, HRESULT)
    get_message_type : Proc(IWSDUdpAddress*, WSDUdpMessageType*, HRESULT)
    set_ttl : Proc(IWSDUdpAddress*, UInt32, HRESULT)
    get_ttl : Proc(IWSDUdpAddress*, UInt32*, HRESULT)
    set_alias : Proc(IWSDUdpAddress*, Guid*, HRESULT)
    get_alias : Proc(IWSDUdpAddress*, Guid*, HRESULT)
  end

  IWSDUdpAddress_GUID = "74d6124a-a441-4f78-a1eb-97a8d1996893"
  IID_IWSDUdpAddress = LibC::GUID.new(0x74d6124a_u32, 0xa441_u16, 0x4f78_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x97_u8, 0xa8_u8, 0xd1_u8, 0x99_u8, 0x68_u8, 0x93_u8])
  struct IWSDUdpAddress
    lpVtbl : IWSDUdpAddressVTbl*
  end

  struct IWSDHttpMessageParametersVTbl
    query_interface : Proc(IWSDHttpMessageParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDHttpMessageParameters*, UInt32)
    release : Proc(IWSDHttpMessageParameters*, UInt32)
    get_local_address : Proc(IWSDHttpMessageParameters*, IWSDAddress*, HRESULT)
    set_local_address : Proc(IWSDHttpMessageParameters*, IWSDAddress, HRESULT)
    get_remote_address : Proc(IWSDHttpMessageParameters*, IWSDAddress*, HRESULT)
    set_remote_address : Proc(IWSDHttpMessageParameters*, IWSDAddress, HRESULT)
    get_lower_parameters : Proc(IWSDHttpMessageParameters*, IWSDMessageParameters*, HRESULT)
    set_inbound_http_headers : Proc(IWSDHttpMessageParameters*, LibC::LPWSTR, HRESULT)
    get_inbound_http_headers : Proc(IWSDHttpMessageParameters*, LibC::LPWSTR*, HRESULT)
    set_outbound_http_headers : Proc(IWSDHttpMessageParameters*, LibC::LPWSTR, HRESULT)
    get_outbound_http_headers : Proc(IWSDHttpMessageParameters*, LibC::LPWSTR*, HRESULT)
    set_id : Proc(IWSDHttpMessageParameters*, LibC::LPWSTR, HRESULT)
    get_id : Proc(IWSDHttpMessageParameters*, LibC::LPWSTR*, HRESULT)
    set_context : Proc(IWSDHttpMessageParameters*, IUnknown, HRESULT)
    get_context : Proc(IWSDHttpMessageParameters*, IUnknown*, HRESULT)
    clear : Proc(IWSDHttpMessageParameters*, HRESULT)
  end

  IWSDHttpMessageParameters_GUID = "540bd122-5c83-4dec-b396-ea62a2697fdf"
  IID_IWSDHttpMessageParameters = LibC::GUID.new(0x540bd122_u32, 0x5c83_u16, 0x4dec_u16, StaticArray[0xb3_u8, 0x96_u8, 0xea_u8, 0x62_u8, 0xa2_u8, 0x69_u8, 0x7f_u8, 0xdf_u8])
  struct IWSDHttpMessageParameters
    lpVtbl : IWSDHttpMessageParametersVTbl*
  end

  struct IWSDHttpAddressVTbl
    query_interface : Proc(IWSDHttpAddress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDHttpAddress*, UInt32)
    release : Proc(IWSDHttpAddress*, UInt32)
    serialize : Proc(IWSDHttpAddress*, Char*, UInt32, LibC::BOOL, HRESULT)
    deserialize : Proc(IWSDHttpAddress*, LibC::LPWSTR, HRESULT)
    get_port : Proc(IWSDHttpAddress*, UInt16*, HRESULT)
    set_port : Proc(IWSDHttpAddress*, UInt16, HRESULT)
    get_transport_address : Proc(IWSDHttpAddress*, LibC::LPWSTR*, HRESULT)
    get_transport_address_ex : Proc(IWSDHttpAddress*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    set_transport_address : Proc(IWSDHttpAddress*, LibC::LPWSTR, HRESULT)
    get_secure : Proc(IWSDHttpAddress*, HRESULT)
    set_secure : Proc(IWSDHttpAddress*, LibC::BOOL, HRESULT)
    get_path : Proc(IWSDHttpAddress*, LibC::LPWSTR*, HRESULT)
    set_path : Proc(IWSDHttpAddress*, LibC::LPWSTR, HRESULT)
  end

  IWSDHttpAddress_GUID = "d09ac7bd-2a3e-4b85-8605-2737ff3e4ea0"
  IID_IWSDHttpAddress = LibC::GUID.new(0xd09ac7bd_u32, 0x2a3e_u16, 0x4b85_u16, StaticArray[0x86_u8, 0x5_u8, 0x27_u8, 0x37_u8, 0xff_u8, 0x3e_u8, 0x4e_u8, 0xa0_u8])
  struct IWSDHttpAddress
    lpVtbl : IWSDHttpAddressVTbl*
  end

  struct IWSDSSLClientCertificateVTbl
    query_interface : Proc(IWSDSSLClientCertificate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDSSLClientCertificate*, UInt32)
    release : Proc(IWSDSSLClientCertificate*, UInt32)
    get_client_certificate : Proc(IWSDSSLClientCertificate*, CERT_CONTEXT**, HRESULT)
    get_mapped_access_token : Proc(IWSDSSLClientCertificate*, LibC::HANDLE*, HRESULT)
  end

  IWSDSSLClientCertificate_GUID = "de105e87-a0da-418e-98ad-27b9eed87bdc"
  IID_IWSDSSLClientCertificate = LibC::GUID.new(0xde105e87_u32, 0xa0da_u16, 0x418e_u16, StaticArray[0x98_u8, 0xad_u8, 0x27_u8, 0xb9_u8, 0xee_u8, 0xd8_u8, 0x7b_u8, 0xdc_u8])
  struct IWSDSSLClientCertificate
    lpVtbl : IWSDSSLClientCertificateVTbl*
  end

  struct IWSDHttpAuthParametersVTbl
    query_interface : Proc(IWSDHttpAuthParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDHttpAuthParameters*, UInt32)
    release : Proc(IWSDHttpAuthParameters*, UInt32)
    get_client_access_token : Proc(IWSDHttpAuthParameters*, LibC::HANDLE*, HRESULT)
    get_auth_type : Proc(IWSDHttpAuthParameters*, UInt32*, HRESULT)
  end

  IWSDHttpAuthParameters_GUID = "0b476df0-8dac-480d-b05c-99781a5884aa"
  IID_IWSDHttpAuthParameters = LibC::GUID.new(0xb476df0_u32, 0x8dac_u16, 0x480d_u16, StaticArray[0xb0_u8, 0x5c_u8, 0x99_u8, 0x78_u8, 0x1a_u8, 0x58_u8, 0x84_u8, 0xaa_u8])
  struct IWSDHttpAuthParameters
    lpVtbl : IWSDHttpAuthParametersVTbl*
  end

  struct IWSDSignaturePropertyVTbl
    query_interface : Proc(IWSDSignatureProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDSignatureProperty*, UInt32)
    release : Proc(IWSDSignatureProperty*, UInt32)
    is_message_signed : Proc(IWSDSignatureProperty*, LibC::BOOL*, HRESULT)
    is_message_signature_trusted : Proc(IWSDSignatureProperty*, LibC::BOOL*, HRESULT)
    get_key_info : Proc(IWSDSignatureProperty*, UInt8*, UInt32*, HRESULT)
    get_signature : Proc(IWSDSignatureProperty*, UInt8*, UInt32*, HRESULT)
    get_signed_info_hash : Proc(IWSDSignatureProperty*, UInt8*, UInt32*, HRESULT)
  end

  IWSDSignatureProperty_GUID = "03ce20aa-71c4-45e2-b32e-3766c61c790f"
  IID_IWSDSignatureProperty = LibC::GUID.new(0x3ce20aa_u32, 0x71c4_u16, 0x45e2_u16, StaticArray[0xb3_u8, 0x2e_u8, 0x37_u8, 0x66_u8, 0xc6_u8, 0x1c_u8, 0x79_u8, 0xf_u8])
  struct IWSDSignatureProperty
    lpVtbl : IWSDSignaturePropertyVTbl*
  end

  struct IWSDAttachmentVTbl
    query_interface : Proc(IWSDAttachment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDAttachment*, UInt32)
    release : Proc(IWSDAttachment*, UInt32)
  end

  IWSDAttachment_GUID = "5d55a616-9df8-4b09-b156-9ba351a48b76"
  IID_IWSDAttachment = LibC::GUID.new(0x5d55a616_u32, 0x9df8_u16, 0x4b09_u16, StaticArray[0xb1_u8, 0x56_u8, 0x9b_u8, 0xa3_u8, 0x51_u8, 0xa4_u8, 0x8b_u8, 0x76_u8])
  struct IWSDAttachment
    lpVtbl : IWSDAttachmentVTbl*
  end

  struct IWSDOutboundAttachmentVTbl
    query_interface : Proc(IWSDOutboundAttachment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDOutboundAttachment*, UInt32)
    release : Proc(IWSDOutboundAttachment*, UInt32)
    write : Proc(IWSDOutboundAttachment*, UInt8*, UInt32, UInt32*, HRESULT)
    close : Proc(IWSDOutboundAttachment*, HRESULT)
    abort : Proc(IWSDOutboundAttachment*, HRESULT)
  end

  IWSDOutboundAttachment_GUID = "aa302f8d-5a22-4ba5-b392-aa8486f4c15d"
  IID_IWSDOutboundAttachment = LibC::GUID.new(0xaa302f8d_u32, 0x5a22_u16, 0x4ba5_u16, StaticArray[0xb3_u8, 0x92_u8, 0xaa_u8, 0x84_u8, 0x86_u8, 0xf4_u8, 0xc1_u8, 0x5d_u8])
  struct IWSDOutboundAttachment
    lpVtbl : IWSDOutboundAttachmentVTbl*
  end

  struct IWSDInboundAttachmentVTbl
    query_interface : Proc(IWSDInboundAttachment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDInboundAttachment*, UInt32)
    release : Proc(IWSDInboundAttachment*, UInt32)
    read : Proc(IWSDInboundAttachment*, UInt8*, UInt32, UInt32*, HRESULT)
    close : Proc(IWSDInboundAttachment*, HRESULT)
  end

  IWSDInboundAttachment_GUID = "5bd6ca65-233c-4fb8-9f7a-2641619655c9"
  IID_IWSDInboundAttachment = LibC::GUID.new(0x5bd6ca65_u32, 0x233c_u16, 0x4fb8_u16, StaticArray[0x9f_u8, 0x7a_u8, 0x26_u8, 0x41_u8, 0x61_u8, 0x96_u8, 0x55_u8, 0xc9_u8])
  struct IWSDInboundAttachment
    lpVtbl : IWSDInboundAttachmentVTbl*
  end

  struct IWSDXMLContextVTbl
    query_interface : Proc(IWSDXMLContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDXMLContext*, UInt32)
    release : Proc(IWSDXMLContext*, UInt32)
    add_namespace : Proc(IWSDXMLContext*, LibC::LPWSTR, LibC::LPWSTR, WSDXML_NAMESPACE**, HRESULT)
    add_name_to_namespace : Proc(IWSDXMLContext*, LibC::LPWSTR, LibC::LPWSTR, WSDXML_NAME**, HRESULT)
    set_namespaces : Proc(IWSDXMLContext*, WSDXML_NAMESPACE**, UInt16, UInt8, HRESULT)
    set_types : Proc(IWSDXMLContext*, WSDXML_TYPE**, UInt32, UInt8, HRESULT)
  end

  IWSDXMLContext_GUID = "75d8f3ee-3e5a-43b4-a15a-bcf6887460c0"
  IID_IWSDXMLContext = LibC::GUID.new(0x75d8f3ee_u32, 0x3e5a_u16, 0x43b4_u16, StaticArray[0xa1_u8, 0x5a_u8, 0xbc_u8, 0xf6_u8, 0x88_u8, 0x74_u8, 0x60_u8, 0xc0_u8])
  struct IWSDXMLContext
    lpVtbl : IWSDXMLContextVTbl*
  end

  struct IWSDiscoveryProviderVTbl
    query_interface : Proc(IWSDiscoveryProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDiscoveryProvider*, UInt32)
    release : Proc(IWSDiscoveryProvider*, UInt32)
    set_address_family : Proc(IWSDiscoveryProvider*, UInt32, HRESULT)
    attach : Proc(IWSDiscoveryProvider*, IWSDiscoveryProviderNotify, HRESULT)
    detach : Proc(IWSDiscoveryProvider*, HRESULT)
    search_by_id : Proc(IWSDiscoveryProvider*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    search_by_address : Proc(IWSDiscoveryProvider*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    search_by_type : Proc(IWSDiscoveryProvider*, WSD_NAME_LIST*, WSD_URI_LIST*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_xml_context : Proc(IWSDiscoveryProvider*, IWSDXMLContext*, HRESULT)
  end

  IWSDiscoveryProvider_GUID = "8ffc8e55-f0eb-480f-88b7-b435dd281d45"
  IID_IWSDiscoveryProvider = LibC::GUID.new(0x8ffc8e55_u32, 0xf0eb_u16, 0x480f_u16, StaticArray[0x88_u8, 0xb7_u8, 0xb4_u8, 0x35_u8, 0xdd_u8, 0x28_u8, 0x1d_u8, 0x45_u8])
  struct IWSDiscoveryProvider
    lpVtbl : IWSDiscoveryProviderVTbl*
  end

  struct IWSDiscoveryProviderNotifyVTbl
    query_interface : Proc(IWSDiscoveryProviderNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDiscoveryProviderNotify*, UInt32)
    release : Proc(IWSDiscoveryProviderNotify*, UInt32)
    add : Proc(IWSDiscoveryProviderNotify*, IWSDiscoveredService, HRESULT)
    remove : Proc(IWSDiscoveryProviderNotify*, IWSDiscoveredService, HRESULT)
    search_failed : Proc(IWSDiscoveryProviderNotify*, HRESULT, LibC::LPWSTR, HRESULT)
    search_complete : Proc(IWSDiscoveryProviderNotify*, LibC::LPWSTR, HRESULT)
  end

  IWSDiscoveryProviderNotify_GUID = "73ee3ced-b6e6-4329-a546-3e8ad46563d2"
  IID_IWSDiscoveryProviderNotify = LibC::GUID.new(0x73ee3ced_u32, 0xb6e6_u16, 0x4329_u16, StaticArray[0xa5_u8, 0x46_u8, 0x3e_u8, 0x8a_u8, 0xd4_u8, 0x65_u8, 0x63_u8, 0xd2_u8])
  struct IWSDiscoveryProviderNotify
    lpVtbl : IWSDiscoveryProviderNotifyVTbl*
  end

  struct IWSDiscoveredServiceVTbl
    query_interface : Proc(IWSDiscoveredService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDiscoveredService*, UInt32)
    release : Proc(IWSDiscoveredService*, UInt32)
    get_endpoint_reference : Proc(IWSDiscoveredService*, WSD_ENDPOINT_REFERENCE**, HRESULT)
    get_types : Proc(IWSDiscoveredService*, WSD_NAME_LIST**, HRESULT)
    get_scopes : Proc(IWSDiscoveredService*, WSD_URI_LIST**, HRESULT)
    get_x_addrs : Proc(IWSDiscoveredService*, WSD_URI_LIST**, HRESULT)
    get_metadata_version : Proc(IWSDiscoveredService*, UInt64*, HRESULT)
    get_extended_disco_xml : Proc(IWSDiscoveredService*, WSDXML_ELEMENT**, WSDXML_ELEMENT**, HRESULT)
    get_probe_resolve_tag : Proc(IWSDiscoveredService*, LibC::LPWSTR*, HRESULT)
    get_remote_transport_address : Proc(IWSDiscoveredService*, LibC::LPWSTR*, HRESULT)
    get_local_transport_address : Proc(IWSDiscoveredService*, LibC::LPWSTR*, HRESULT)
    get_local_interface_guid : Proc(IWSDiscoveredService*, Guid*, HRESULT)
    get_instance_id : Proc(IWSDiscoveredService*, UInt64*, HRESULT)
  end

  IWSDiscoveredService_GUID = "4bad8a3b-b374-4420-9632-aac945b374aa"
  IID_IWSDiscoveredService = LibC::GUID.new(0x4bad8a3b_u32, 0xb374_u16, 0x4420_u16, StaticArray[0x96_u8, 0x32_u8, 0xaa_u8, 0xc9_u8, 0x45_u8, 0xb3_u8, 0x74_u8, 0xaa_u8])
  struct IWSDiscoveredService
    lpVtbl : IWSDiscoveredServiceVTbl*
  end

  struct IWSDiscoveryPublisherVTbl
    query_interface : Proc(IWSDiscoveryPublisher*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDiscoveryPublisher*, UInt32)
    release : Proc(IWSDiscoveryPublisher*, UInt32)
    set_address_family : Proc(IWSDiscoveryPublisher*, UInt32, HRESULT)
    register_notification_sink : Proc(IWSDiscoveryPublisher*, IWSDiscoveryPublisherNotify, HRESULT)
    un_register_notification_sink : Proc(IWSDiscoveryPublisher*, IWSDiscoveryPublisherNotify, HRESULT)
    publish : Proc(IWSDiscoveryPublisher*, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, HRESULT)
    un_publish : Proc(IWSDiscoveryPublisher*, LibC::LPWSTR, UInt64, UInt64, LibC::LPWSTR, WSDXML_ELEMENT*, HRESULT)
    match_probe : Proc(IWSDiscoveryPublisher*, WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, HRESULT)
    match_resolve : Proc(IWSDiscoveryPublisher*, WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, HRESULT)
    publish_ex : Proc(IWSDiscoveryPublisher*, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, HRESULT)
    match_probe_ex : Proc(IWSDiscoveryPublisher*, WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, HRESULT)
    match_resolve_ex : Proc(IWSDiscoveryPublisher*, WSD_SOAP_MESSAGE*, IWSDMessageParameters, LibC::LPWSTR, UInt64, UInt64, UInt64, LibC::LPWSTR, WSD_NAME_LIST*, WSD_URI_LIST*, WSD_URI_LIST*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, WSDXML_ELEMENT*, HRESULT)
    register_scope_matching_rule : Proc(IWSDiscoveryPublisher*, IWSDScopeMatchingRule, HRESULT)
    un_register_scope_matching_rule : Proc(IWSDiscoveryPublisher*, IWSDScopeMatchingRule, HRESULT)
    get_xml_context : Proc(IWSDiscoveryPublisher*, IWSDXMLContext*, HRESULT)
  end

  IWSDiscoveryPublisher_GUID = "ae01e1a8-3ff9-4148-8116-057cc616fe13"
  IID_IWSDiscoveryPublisher = LibC::GUID.new(0xae01e1a8_u32, 0x3ff9_u16, 0x4148_u16, StaticArray[0x81_u8, 0x16_u8, 0x5_u8, 0x7c_u8, 0xc6_u8, 0x16_u8, 0xfe_u8, 0x13_u8])
  struct IWSDiscoveryPublisher
    lpVtbl : IWSDiscoveryPublisherVTbl*
  end

  struct IWSDiscoveryPublisherNotifyVTbl
    query_interface : Proc(IWSDiscoveryPublisherNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDiscoveryPublisherNotify*, UInt32)
    release : Proc(IWSDiscoveryPublisherNotify*, UInt32)
    probe_handler : Proc(IWSDiscoveryPublisherNotify*, WSD_SOAP_MESSAGE*, IWSDMessageParameters, HRESULT)
    resolve_handler : Proc(IWSDiscoveryPublisherNotify*, WSD_SOAP_MESSAGE*, IWSDMessageParameters, HRESULT)
  end

  IWSDiscoveryPublisherNotify_GUID = "e67651b0-337a-4b3c-9758-733388568251"
  IID_IWSDiscoveryPublisherNotify = LibC::GUID.new(0xe67651b0_u32, 0x337a_u16, 0x4b3c_u16, StaticArray[0x97_u8, 0x58_u8, 0x73_u8, 0x33_u8, 0x88_u8, 0x56_u8, 0x82_u8, 0x51_u8])
  struct IWSDiscoveryPublisherNotify
    lpVtbl : IWSDiscoveryPublisherNotifyVTbl*
  end

  struct IWSDScopeMatchingRuleVTbl
    query_interface : Proc(IWSDScopeMatchingRule*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDScopeMatchingRule*, UInt32)
    release : Proc(IWSDScopeMatchingRule*, UInt32)
    get_scope_rule : Proc(IWSDScopeMatchingRule*, LibC::LPWSTR*, HRESULT)
    match_scopes : Proc(IWSDScopeMatchingRule*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL*, HRESULT)
  end

  IWSDScopeMatchingRule_GUID = "fcafe424-fef5-481a-bd9f-33ce0574256f"
  IID_IWSDScopeMatchingRule = LibC::GUID.new(0xfcafe424_u32, 0xfef5_u16, 0x481a_u16, StaticArray[0xbd_u8, 0x9f_u8, 0x33_u8, 0xce_u8, 0x5_u8, 0x74_u8, 0x25_u8, 0x6f_u8])
  struct IWSDScopeMatchingRule
    lpVtbl : IWSDScopeMatchingRuleVTbl*
  end

  struct IWSDEndpointProxyVTbl
    query_interface : Proc(IWSDEndpointProxy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDEndpointProxy*, UInt32)
    release : Proc(IWSDEndpointProxy*, UInt32)
    send_one_way_request : Proc(IWSDEndpointProxy*, Void*, WSD_OPERATION*, HRESULT)
    send_two_way_request : Proc(IWSDEndpointProxy*, Void*, WSD_OPERATION*, WSD_SYNCHRONOUS_RESPONSE_CONTEXT*, HRESULT)
    send_two_way_request_async : Proc(IWSDEndpointProxy*, Void*, WSD_OPERATION*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)
    abort_async_operation : Proc(IWSDEndpointProxy*, IWSDAsyncResult, HRESULT)
    process_fault : Proc(IWSDEndpointProxy*, WSD_SOAP_FAULT*, HRESULT)
    get_error_info : Proc(IWSDEndpointProxy*, LibC::LPWSTR*, HRESULT)
    get_fault_info : Proc(IWSDEndpointProxy*, WSD_SOAP_FAULT**, HRESULT)
  end

  IWSDEndpointProxy_GUID = "1860d430-b24c-4975-9f90-dbb39baa24ec"
  IID_IWSDEndpointProxy = LibC::GUID.new(0x1860d430_u32, 0xb24c_u16, 0x4975_u16, StaticArray[0x9f_u8, 0x90_u8, 0xdb_u8, 0xb3_u8, 0x9b_u8, 0xaa_u8, 0x24_u8, 0xec_u8])
  struct IWSDEndpointProxy
    lpVtbl : IWSDEndpointProxyVTbl*
  end

  struct IWSDMetadataExchangeVTbl
    query_interface : Proc(IWSDMetadataExchange*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDMetadataExchange*, UInt32)
    release : Proc(IWSDMetadataExchange*, UInt32)
    get_metadata : Proc(IWSDMetadataExchange*, WSD_METADATA_SECTION_LIST**, HRESULT)
  end

  IWSDMetadataExchange_GUID = "06996d57-1d67-4928-9307-3d7833fdb846"
  IID_IWSDMetadataExchange = LibC::GUID.new(0x6996d57_u32, 0x1d67_u16, 0x4928_u16, StaticArray[0x93_u8, 0x7_u8, 0x3d_u8, 0x78_u8, 0x33_u8, 0xfd_u8, 0xb8_u8, 0x46_u8])
  struct IWSDMetadataExchange
    lpVtbl : IWSDMetadataExchangeVTbl*
  end

  struct IWSDServiceProxyVTbl
    query_interface : Proc(IWSDServiceProxy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDServiceProxy*, UInt32)
    release : Proc(IWSDServiceProxy*, UInt32)
    get_metadata : Proc(IWSDServiceProxy*, WSD_METADATA_SECTION_LIST**, HRESULT)
    begin_get_metadata : Proc(IWSDServiceProxy*, IWSDAsyncResult*, HRESULT)
    end_get_metadata : Proc(IWSDServiceProxy*, IWSDAsyncResult, WSD_METADATA_SECTION_LIST**, HRESULT)
    get_service_metadata : Proc(IWSDServiceProxy*, WSD_SERVICE_METADATA**, HRESULT)
    subscribe_to_operation : Proc(IWSDServiceProxy*, WSD_OPERATION*, IUnknown, WSDXML_ELEMENT*, WSDXML_ELEMENT**, HRESULT)
    unsubscribe_to_operation : Proc(IWSDServiceProxy*, WSD_OPERATION*, HRESULT)
    set_eventing_status_callback : Proc(IWSDServiceProxy*, IWSDEventingStatus, HRESULT)
    get_endpoint_proxy : Proc(IWSDServiceProxy*, IWSDEndpointProxy*, HRESULT)
  end

  IWSDServiceProxy_GUID = "d4c7fb9c-03ab-4175-9d67-094fafebf487"
  IID_IWSDServiceProxy = LibC::GUID.new(0xd4c7fb9c_u32, 0x3ab_u16, 0x4175_u16, StaticArray[0x9d_u8, 0x67_u8, 0x9_u8, 0x4f_u8, 0xaf_u8, 0xeb_u8, 0xf4_u8, 0x87_u8])
  struct IWSDServiceProxy
    lpVtbl : IWSDServiceProxyVTbl*
  end

  struct IWSDServiceProxyEventingVTbl
    query_interface : Proc(IWSDServiceProxyEventing*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDServiceProxyEventing*, UInt32)
    release : Proc(IWSDServiceProxyEventing*, UInt32)
    get_metadata : Proc(IWSDServiceProxyEventing*, WSD_METADATA_SECTION_LIST**, HRESULT)
    begin_get_metadata : Proc(IWSDServiceProxyEventing*, IWSDAsyncResult*, HRESULT)
    end_get_metadata : Proc(IWSDServiceProxyEventing*, IWSDAsyncResult, WSD_METADATA_SECTION_LIST**, HRESULT)
    get_service_metadata : Proc(IWSDServiceProxyEventing*, WSD_SERVICE_METADATA**, HRESULT)
    subscribe_to_operation : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, IUnknown, WSDXML_ELEMENT*, WSDXML_ELEMENT**, HRESULT)
    unsubscribe_to_operation : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, HRESULT)
    set_eventing_status_callback : Proc(IWSDServiceProxyEventing*, IWSDEventingStatus, HRESULT)
    get_endpoint_proxy : Proc(IWSDServiceProxyEventing*, IWSDEndpointProxy*, HRESULT)
    subscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, IUnknown, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)
    begin_subscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, IUnknown, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)
    end_subscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)
    unsubscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, HRESULT)
    begin_unsubscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)
    end_unsubscribe_to_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, IWSDAsyncResult, HRESULT)
    renew_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)
    begin_renew_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, WSD_EVENTING_EXPIRES*, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)
    end_renew_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)
    get_status_for_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)
    begin_get_status_for_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, WSDXML_ELEMENT*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*, HRESULT)
    end_get_status_for_multiple_operations : Proc(IWSDServiceProxyEventing*, WSD_OPERATION*, UInt32, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**, HRESULT)
  end

  IWSDServiceProxyEventing_GUID = "f9279d6d-1012-4a94-b8cc-fd35d2202bfe"
  IID_IWSDServiceProxyEventing = LibC::GUID.new(0xf9279d6d_u32, 0x1012_u16, 0x4a94_u16, StaticArray[0xb8_u8, 0xcc_u8, 0xfd_u8, 0x35_u8, 0xd2_u8, 0x20_u8, 0x2b_u8, 0xfe_u8])
  struct IWSDServiceProxyEventing
    lpVtbl : IWSDServiceProxyEventingVTbl*
  end

  struct IWSDDeviceProxyVTbl
    query_interface : Proc(IWSDDeviceProxy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDDeviceProxy*, UInt32)
    release : Proc(IWSDDeviceProxy*, UInt32)
    init : Proc(IWSDDeviceProxy*, LibC::LPWSTR, IWSDAddress, LibC::LPWSTR, IWSDXMLContext, IWSDDeviceProxy, HRESULT)
    begin_get_metadata : Proc(IWSDDeviceProxy*, IWSDAsyncResult*, HRESULT)
    end_get_metadata : Proc(IWSDDeviceProxy*, IWSDAsyncResult, HRESULT)
    get_host_metadata : Proc(IWSDDeviceProxy*, WSD_HOST_METADATA**, HRESULT)
    get_this_model_metadata : Proc(IWSDDeviceProxy*, WSD_THIS_MODEL_METADATA**, HRESULT)
    get_this_device_metadata : Proc(IWSDDeviceProxy*, WSD_THIS_DEVICE_METADATA**, HRESULT)
    get_all_metadata : Proc(IWSDDeviceProxy*, WSD_METADATA_SECTION_LIST**, HRESULT)
    get_service_proxy_by_id : Proc(IWSDDeviceProxy*, LibC::LPWSTR, IWSDServiceProxy*, HRESULT)
    get_service_proxy_by_type : Proc(IWSDDeviceProxy*, WSDXML_NAME*, IWSDServiceProxy*, HRESULT)
    get_endpoint_proxy : Proc(IWSDDeviceProxy*, IWSDEndpointProxy*, HRESULT)
  end

  IWSDDeviceProxy_GUID = "eee0c031-c578-4c0e-9a3b-973c35f409db"
  IID_IWSDDeviceProxy = LibC::GUID.new(0xeee0c031_u32, 0xc578_u16, 0x4c0e_u16, StaticArray[0x9a_u8, 0x3b_u8, 0x97_u8, 0x3c_u8, 0x35_u8, 0xf4_u8, 0x9_u8, 0xdb_u8])
  struct IWSDDeviceProxy
    lpVtbl : IWSDDeviceProxyVTbl*
  end

  struct IWSDAsyncResultVTbl
    query_interface : Proc(IWSDAsyncResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDAsyncResult*, UInt32)
    release : Proc(IWSDAsyncResult*, UInt32)
    set_callback : Proc(IWSDAsyncResult*, IWSDAsyncCallback, IUnknown, HRESULT)
    set_wait_handle : Proc(IWSDAsyncResult*, LibC::HANDLE, HRESULT)
    has_completed : Proc(IWSDAsyncResult*, HRESULT)
    get_async_state : Proc(IWSDAsyncResult*, IUnknown*, HRESULT)
    abort : Proc(IWSDAsyncResult*, HRESULT)
    get_event : Proc(IWSDAsyncResult*, WSD_EVENT*, HRESULT)
    get_endpoint_proxy : Proc(IWSDAsyncResult*, IWSDEndpointProxy*, HRESULT)
  end

  IWSDAsyncResult_GUID = "11a9852a-8dd8-423e-b537-9356db4fbfb8"
  IID_IWSDAsyncResult = LibC::GUID.new(0x11a9852a_u32, 0x8dd8_u16, 0x423e_u16, StaticArray[0xb5_u8, 0x37_u8, 0x93_u8, 0x56_u8, 0xdb_u8, 0x4f_u8, 0xbf_u8, 0xb8_u8])
  struct IWSDAsyncResult
    lpVtbl : IWSDAsyncResultVTbl*
  end

  struct IWSDAsyncCallbackVTbl
    query_interface : Proc(IWSDAsyncCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDAsyncCallback*, UInt32)
    release : Proc(IWSDAsyncCallback*, UInt32)
    async_operation_complete : Proc(IWSDAsyncCallback*, IWSDAsyncResult, IUnknown, HRESULT)
  end

  IWSDAsyncCallback_GUID = "a63e109d-ce72-49e2-ba98-e845f5ee1666"
  IID_IWSDAsyncCallback = LibC::GUID.new(0xa63e109d_u32, 0xce72_u16, 0x49e2_u16, StaticArray[0xba_u8, 0x98_u8, 0xe8_u8, 0x45_u8, 0xf5_u8, 0xee_u8, 0x16_u8, 0x66_u8])
  struct IWSDAsyncCallback
    lpVtbl : IWSDAsyncCallbackVTbl*
  end

  struct IWSDEventingStatusVTbl
    query_interface : Proc(IWSDEventingStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDEventingStatus*, UInt32)
    release : Proc(IWSDEventingStatus*, UInt32)
    subscription_renewed : Proc(IWSDEventingStatus*, LibC::LPWSTR, Void)
    subscription_renewal_failed : Proc(IWSDEventingStatus*, LibC::LPWSTR, HRESULT, Void)
    subscription_ended : Proc(IWSDEventingStatus*, LibC::LPWSTR, Void)
  end

  IWSDEventingStatus_GUID = "49b17f52-637a-407a-ae99-fbe82a4d38c0"
  IID_IWSDEventingStatus = LibC::GUID.new(0x49b17f52_u32, 0x637a_u16, 0x407a_u16, StaticArray[0xae_u8, 0x99_u8, 0xfb_u8, 0xe8_u8, 0x2a_u8, 0x4d_u8, 0x38_u8, 0xc0_u8])
  struct IWSDEventingStatus
    lpVtbl : IWSDEventingStatusVTbl*
  end

  struct IWSDDeviceHostVTbl
    query_interface : Proc(IWSDDeviceHost*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDDeviceHost*, UInt32)
    release : Proc(IWSDDeviceHost*, UInt32)
    init : Proc(IWSDDeviceHost*, LibC::LPWSTR, IWSDXMLContext, IWSDAddress*, UInt32, HRESULT)
    start : Proc(IWSDDeviceHost*, UInt64, WSD_URI_LIST*, IWSDDeviceHostNotify, HRESULT)
    stop : Proc(IWSDDeviceHost*, HRESULT)
    terminate : Proc(IWSDDeviceHost*, HRESULT)
    register_port_type : Proc(IWSDDeviceHost*, WSD_PORT_TYPE*, HRESULT)
    set_metadata : Proc(IWSDDeviceHost*, WSD_THIS_MODEL_METADATA*, WSD_THIS_DEVICE_METADATA*, WSD_HOST_METADATA*, WSD_METADATA_SECTION_LIST*, HRESULT)
    register_service : Proc(IWSDDeviceHost*, LibC::LPWSTR, IUnknown, HRESULT)
    retire_service : Proc(IWSDDeviceHost*, LibC::LPWSTR, HRESULT)
    add_dynamic_service : Proc(IWSDDeviceHost*, LibC::LPWSTR, LibC::LPWSTR, WSD_PORT_TYPE*, WSDXML_NAME*, WSDXML_ELEMENT*, IUnknown, HRESULT)
    remove_dynamic_service : Proc(IWSDDeviceHost*, LibC::LPWSTR, HRESULT)
    set_service_discoverable : Proc(IWSDDeviceHost*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    signal_event : Proc(IWSDDeviceHost*, LibC::LPWSTR, Void*, WSD_OPERATION*, HRESULT)
  end

  IWSDDeviceHost_GUID = "917fe891-3d13-4138-9809-934c8abeb12c"
  IID_IWSDDeviceHost = LibC::GUID.new(0x917fe891_u32, 0x3d13_u16, 0x4138_u16, StaticArray[0x98_u8, 0x9_u8, 0x93_u8, 0x4c_u8, 0x8a_u8, 0xbe_u8, 0xb1_u8, 0x2c_u8])
  struct IWSDDeviceHost
    lpVtbl : IWSDDeviceHostVTbl*
  end

  struct IWSDDeviceHostNotifyVTbl
    query_interface : Proc(IWSDDeviceHostNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDDeviceHostNotify*, UInt32)
    release : Proc(IWSDDeviceHostNotify*, UInt32)
    get_service : Proc(IWSDDeviceHostNotify*, LibC::LPWSTR, IUnknown*, HRESULT)
  end

  IWSDDeviceHostNotify_GUID = "b5bee9f9-eeda-41fe-96f7-f45e14990fb0"
  IID_IWSDDeviceHostNotify = LibC::GUID.new(0xb5bee9f9_u32, 0xeeda_u16, 0x41fe_u16, StaticArray[0x96_u8, 0xf7_u8, 0xf4_u8, 0x5e_u8, 0x14_u8, 0x99_u8, 0xf_u8, 0xb0_u8])
  struct IWSDDeviceHostNotify
    lpVtbl : IWSDDeviceHostNotifyVTbl*
  end

  struct IWSDServiceMessagingVTbl
    query_interface : Proc(IWSDServiceMessaging*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDServiceMessaging*, UInt32)
    release : Proc(IWSDServiceMessaging*, UInt32)
    send_response : Proc(IWSDServiceMessaging*, Void*, WSD_OPERATION*, IWSDMessageParameters, HRESULT)
    fault_request : Proc(IWSDServiceMessaging*, WSD_SOAP_HEADER*, IWSDMessageParameters, WSD_SOAP_FAULT*, HRESULT)
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
  def query_interface(this : IWSDAddress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDAddress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDAddress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def serialize(this : IWSDAddress*, pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.call(this, pszbuffer, cchlength, fsafe)
  end
  def deserialize(this : IWSDAddress*, pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.call(this, pszbuffer)
  end
end
struct LibWin32::IWSDTransportAddress
  def query_interface(this : IWSDTransportAddress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDTransportAddress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDTransportAddress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def serialize(this : IWSDTransportAddress*, pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.call(this, pszbuffer, cchlength, fsafe)
  end
  def deserialize(this : IWSDTransportAddress*, pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.call(this, pszbuffer)
  end
  def get_port(this : IWSDTransportAddress*, pwport : UInt16*) : HRESULT
    @lpVtbl.value.get_port.call(this, pwport)
  end
  def set_port(this : IWSDTransportAddress*, wport : UInt16) : HRESULT
    @lpVtbl.value.set_port.call(this, wport)
  end
  def get_transport_address(this : IWSDTransportAddress*, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address.call(this, ppszaddress)
  end
  def get_transport_address_ex(this : IWSDTransportAddress*, fsafe : LibC::BOOL, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address_ex.call(this, fsafe, ppszaddress)
  end
  def set_transport_address(this : IWSDTransportAddress*, pszaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transport_address.call(this, pszaddress)
  end
end
struct LibWin32::IWSDMessageParameters
  def query_interface(this : IWSDMessageParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDMessageParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDMessageParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_local_address(this : IWSDMessageParameters*, ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_local_address.call(this, ppaddress)
  end
  def set_local_address(this : IWSDMessageParameters*, paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_local_address.call(this, paddress)
  end
  def get_remote_address(this : IWSDMessageParameters*, ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_remote_address.call(this, ppaddress)
  end
  def set_remote_address(this : IWSDMessageParameters*, paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_remote_address.call(this, paddress)
  end
  def get_lower_parameters(this : IWSDMessageParameters*, pptxparams : IWSDMessageParameters*) : HRESULT
    @lpVtbl.value.get_lower_parameters.call(this, pptxparams)
  end
end
struct LibWin32::IWSDUdpMessageParameters
  def query_interface(this : IWSDUdpMessageParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDUdpMessageParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDUdpMessageParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_local_address(this : IWSDUdpMessageParameters*, ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_local_address.call(this, ppaddress)
  end
  def set_local_address(this : IWSDUdpMessageParameters*, paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_local_address.call(this, paddress)
  end
  def get_remote_address(this : IWSDUdpMessageParameters*, ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_remote_address.call(this, ppaddress)
  end
  def set_remote_address(this : IWSDUdpMessageParameters*, paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_remote_address.call(this, paddress)
  end
  def get_lower_parameters(this : IWSDUdpMessageParameters*, pptxparams : IWSDMessageParameters*) : HRESULT
    @lpVtbl.value.get_lower_parameters.call(this, pptxparams)
  end
  def set_retransmit_params(this : IWSDUdpMessageParameters*, pparams : WSDUdpRetransmitParams*) : HRESULT
    @lpVtbl.value.set_retransmit_params.call(this, pparams)
  end
  def get_retransmit_params(this : IWSDUdpMessageParameters*, pparams : WSDUdpRetransmitParams*) : HRESULT
    @lpVtbl.value.get_retransmit_params.call(this, pparams)
  end
end
struct LibWin32::IWSDUdpAddress
  def query_interface(this : IWSDUdpAddress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDUdpAddress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDUdpAddress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def serialize(this : IWSDUdpAddress*, pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.call(this, pszbuffer, cchlength, fsafe)
  end
  def deserialize(this : IWSDUdpAddress*, pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.call(this, pszbuffer)
  end
  def get_port(this : IWSDUdpAddress*, pwport : UInt16*) : HRESULT
    @lpVtbl.value.get_port.call(this, pwport)
  end
  def set_port(this : IWSDUdpAddress*, wport : UInt16) : HRESULT
    @lpVtbl.value.set_port.call(this, wport)
  end
  def get_transport_address(this : IWSDUdpAddress*, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address.call(this, ppszaddress)
  end
  def get_transport_address_ex(this : IWSDUdpAddress*, fsafe : LibC::BOOL, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address_ex.call(this, fsafe, ppszaddress)
  end
  def set_transport_address(this : IWSDUdpAddress*, pszaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transport_address.call(this, pszaddress)
  end
  def set_sockaddr(this : IWSDUdpAddress*, psockaddr : SOCKADDR_STORAGE*) : HRESULT
    @lpVtbl.value.set_sockaddr.call(this, psockaddr)
  end
  def get_sockaddr(this : IWSDUdpAddress*, psockaddr : SOCKADDR_STORAGE*) : HRESULT
    @lpVtbl.value.get_sockaddr.call(this, psockaddr)
  end
  def set_exclusive(this : IWSDUdpAddress*, fexclusive : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_exclusive.call(this, fexclusive)
  end
  def get_exclusive(this : IWSDUdpAddress*) : HRESULT
    @lpVtbl.value.get_exclusive.call(this)
  end
  def set_message_type(this : IWSDUdpAddress*, messagetype : WSDUdpMessageType) : HRESULT
    @lpVtbl.value.set_message_type.call(this, messagetype)
  end
  def get_message_type(this : IWSDUdpAddress*, pmessagetype : WSDUdpMessageType*) : HRESULT
    @lpVtbl.value.get_message_type.call(this, pmessagetype)
  end
  def set_ttl(this : IWSDUdpAddress*, dwttl : UInt32) : HRESULT
    @lpVtbl.value.set_ttl.call(this, dwttl)
  end
  def get_ttl(this : IWSDUdpAddress*, pdwttl : UInt32*) : HRESULT
    @lpVtbl.value.get_ttl.call(this, pdwttl)
  end
  def set_alias(this : IWSDUdpAddress*, palias : Guid*) : HRESULT
    @lpVtbl.value.set_alias.call(this, palias)
  end
  def get_alias(this : IWSDUdpAddress*, palias : Guid*) : HRESULT
    @lpVtbl.value.get_alias.call(this, palias)
  end
end
struct LibWin32::IWSDHttpMessageParameters
  def query_interface(this : IWSDHttpMessageParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDHttpMessageParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDHttpMessageParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_local_address(this : IWSDHttpMessageParameters*, ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_local_address.call(this, ppaddress)
  end
  def set_local_address(this : IWSDHttpMessageParameters*, paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_local_address.call(this, paddress)
  end
  def get_remote_address(this : IWSDHttpMessageParameters*, ppaddress : IWSDAddress*) : HRESULT
    @lpVtbl.value.get_remote_address.call(this, ppaddress)
  end
  def set_remote_address(this : IWSDHttpMessageParameters*, paddress : IWSDAddress) : HRESULT
    @lpVtbl.value.set_remote_address.call(this, paddress)
  end
  def get_lower_parameters(this : IWSDHttpMessageParameters*, pptxparams : IWSDMessageParameters*) : HRESULT
    @lpVtbl.value.get_lower_parameters.call(this, pptxparams)
  end
  def set_inbound_http_headers(this : IWSDHttpMessageParameters*, pszheaders : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_inbound_http_headers.call(this, pszheaders)
  end
  def get_inbound_http_headers(this : IWSDHttpMessageParameters*, ppszheaders : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_inbound_http_headers.call(this, ppszheaders)
  end
  def set_outbound_http_headers(this : IWSDHttpMessageParameters*, pszheaders : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_outbound_http_headers.call(this, pszheaders)
  end
  def get_outbound_http_headers(this : IWSDHttpMessageParameters*, ppszheaders : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_outbound_http_headers.call(this, ppszheaders)
  end
  def set_id(this : IWSDHttpMessageParameters*, pszid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_id.call(this, pszid)
  end
  def get_id(this : IWSDHttpMessageParameters*, ppszid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, ppszid)
  end
  def set_context(this : IWSDHttpMessageParameters*, pcontext : IUnknown) : HRESULT
    @lpVtbl.value.set_context.call(this, pcontext)
  end
  def get_context(this : IWSDHttpMessageParameters*, ppcontext : IUnknown*) : HRESULT
    @lpVtbl.value.get_context.call(this, ppcontext)
  end
  def clear(this : IWSDHttpMessageParameters*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
end
struct LibWin32::IWSDHttpAddress
  def query_interface(this : IWSDHttpAddress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDHttpAddress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDHttpAddress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def serialize(this : IWSDHttpAddress*, pszbuffer : Char*, cchlength : UInt32, fsafe : LibC::BOOL) : HRESULT
    @lpVtbl.value.serialize.call(this, pszbuffer, cchlength, fsafe)
  end
  def deserialize(this : IWSDHttpAddress*, pszbuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.deserialize.call(this, pszbuffer)
  end
  def get_port(this : IWSDHttpAddress*, pwport : UInt16*) : HRESULT
    @lpVtbl.value.get_port.call(this, pwport)
  end
  def set_port(this : IWSDHttpAddress*, wport : UInt16) : HRESULT
    @lpVtbl.value.set_port.call(this, wport)
  end
  def get_transport_address(this : IWSDHttpAddress*, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address.call(this, ppszaddress)
  end
  def get_transport_address_ex(this : IWSDHttpAddress*, fsafe : LibC::BOOL, ppszaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transport_address_ex.call(this, fsafe, ppszaddress)
  end
  def set_transport_address(this : IWSDHttpAddress*, pszaddress : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transport_address.call(this, pszaddress)
  end
  def get_secure(this : IWSDHttpAddress*) : HRESULT
    @lpVtbl.value.get_secure.call(this)
  end
  def set_secure(this : IWSDHttpAddress*, fsecure : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_secure.call(this, fsecure)
  end
  def get_path(this : IWSDHttpAddress*, ppszpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.call(this, ppszpath)
  end
  def set_path(this : IWSDHttpAddress*, pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_path.call(this, pszpath)
  end
end
struct LibWin32::IWSDSSLClientCertificate
  def query_interface(this : IWSDSSLClientCertificate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDSSLClientCertificate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDSSLClientCertificate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_client_certificate(this : IWSDSSLClientCertificate*, ppcertcontext : CERT_CONTEXT**) : HRESULT
    @lpVtbl.value.get_client_certificate.call(this, ppcertcontext)
  end
  def get_mapped_access_token(this : IWSDSSLClientCertificate*, phtoken : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_mapped_access_token.call(this, phtoken)
  end
end
struct LibWin32::IWSDHttpAuthParameters
  def query_interface(this : IWSDHttpAuthParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDHttpAuthParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDHttpAuthParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_client_access_token(this : IWSDHttpAuthParameters*, phtoken : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_client_access_token.call(this, phtoken)
  end
  def get_auth_type(this : IWSDHttpAuthParameters*, pauthtype : UInt32*) : HRESULT
    @lpVtbl.value.get_auth_type.call(this, pauthtype)
  end
end
struct LibWin32::IWSDSignatureProperty
  def query_interface(this : IWSDSignatureProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDSignatureProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDSignatureProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_message_signed(this : IWSDSignatureProperty*, pbsigned : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_message_signed.call(this, pbsigned)
  end
  def is_message_signature_trusted(this : IWSDSignatureProperty*, pbsignaturetrusted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_message_signature_trusted.call(this, pbsignaturetrusted)
  end
  def get_key_info(this : IWSDSignatureProperty*, pbkeyinfo : UInt8*, pdwkeyinfosize : UInt32*) : HRESULT
    @lpVtbl.value.get_key_info.call(this, pbkeyinfo, pdwkeyinfosize)
  end
  def get_signature(this : IWSDSignatureProperty*, pbsignature : UInt8*, pdwsignaturesize : UInt32*) : HRESULT
    @lpVtbl.value.get_signature.call(this, pbsignature, pdwsignaturesize)
  end
  def get_signed_info_hash(this : IWSDSignatureProperty*, pbsignedinfohash : UInt8*, pdwhashsize : UInt32*) : HRESULT
    @lpVtbl.value.get_signed_info_hash.call(this, pbsignedinfohash, pdwhashsize)
  end
end
struct LibWin32::IWSDAttachment
  def query_interface(this : IWSDAttachment*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDAttachment*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDAttachment*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IWSDOutboundAttachment
  def query_interface(this : IWSDOutboundAttachment*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDOutboundAttachment*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDOutboundAttachment*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def write(this : IWSDOutboundAttachment*, pbuffer : UInt8*, dwbytestowrite : UInt32, pdwnumberofbyteswritten : UInt32*) : HRESULT
    @lpVtbl.value.write.call(this, pbuffer, dwbytestowrite, pdwnumberofbyteswritten)
  end
  def close(this : IWSDOutboundAttachment*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def abort(this : IWSDOutboundAttachment*) : HRESULT
    @lpVtbl.value.abort.call(this)
  end
end
struct LibWin32::IWSDInboundAttachment
  def query_interface(this : IWSDInboundAttachment*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDInboundAttachment*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDInboundAttachment*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : IWSDInboundAttachment*, pbuffer : UInt8*, dwbytestoread : UInt32, pdwnumberofbytesread : UInt32*) : HRESULT
    @lpVtbl.value.read.call(this, pbuffer, dwbytestoread, pdwnumberofbytesread)
  end
  def close(this : IWSDInboundAttachment*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
end
struct LibWin32::IWSDXMLContext
  def query_interface(this : IWSDXMLContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDXMLContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDXMLContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_namespace(this : IWSDXMLContext*, pszuri : LibC::LPWSTR, pszsuggestedprefix : LibC::LPWSTR, ppnamespace : WSDXML_NAMESPACE**) : HRESULT
    @lpVtbl.value.add_namespace.call(this, pszuri, pszsuggestedprefix, ppnamespace)
  end
  def add_name_to_namespace(this : IWSDXMLContext*, pszuri : LibC::LPWSTR, pszname : LibC::LPWSTR, ppname : WSDXML_NAME**) : HRESULT
    @lpVtbl.value.add_name_to_namespace.call(this, pszuri, pszname, ppname)
  end
  def set_namespaces(this : IWSDXMLContext*, pnamespaces : WSDXML_NAMESPACE**, wnamespacescount : UInt16, blayernumber : UInt8) : HRESULT
    @lpVtbl.value.set_namespaces.call(this, pnamespaces, wnamespacescount, blayernumber)
  end
  def set_types(this : IWSDXMLContext*, ptypes : WSDXML_TYPE**, dwtypescount : UInt32, blayernumber : UInt8) : HRESULT
    @lpVtbl.value.set_types.call(this, ptypes, dwtypescount, blayernumber)
  end
end
struct LibWin32::IWSDiscoveryProvider
  def query_interface(this : IWSDiscoveryProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDiscoveryProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDiscoveryProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_address_family(this : IWSDiscoveryProvider*, dwaddressfamily : UInt32) : HRESULT
    @lpVtbl.value.set_address_family.call(this, dwaddressfamily)
  end
  def attach(this : IWSDiscoveryProvider*, psink : IWSDiscoveryProviderNotify) : HRESULT
    @lpVtbl.value.attach.call(this, psink)
  end
  def detach(this : IWSDiscoveryProvider*) : HRESULT
    @lpVtbl.value.detach.call(this)
  end
  def search_by_id(this : IWSDiscoveryProvider*, pszid : LibC::LPWSTR, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_by_id.call(this, pszid, psztag)
  end
  def search_by_address(this : IWSDiscoveryProvider*, pszaddress : LibC::LPWSTR, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_by_address.call(this, pszaddress, psztag)
  end
  def search_by_type(this : IWSDiscoveryProvider*, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pszmatchby : LibC::LPWSTR, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_by_type.call(this, ptypeslist, pscopeslist, pszmatchby, psztag)
  end
  def get_xml_context(this : IWSDiscoveryProvider*, ppcontext : IWSDXMLContext*) : HRESULT
    @lpVtbl.value.get_xml_context.call(this, ppcontext)
  end
end
struct LibWin32::IWSDiscoveryProviderNotify
  def query_interface(this : IWSDiscoveryProviderNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDiscoveryProviderNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDiscoveryProviderNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add(this : IWSDiscoveryProviderNotify*, pservice : IWSDiscoveredService) : HRESULT
    @lpVtbl.value.add.call(this, pservice)
  end
  def remove(this : IWSDiscoveryProviderNotify*, pservice : IWSDiscoveredService) : HRESULT
    @lpVtbl.value.remove.call(this, pservice)
  end
  def search_failed(this : IWSDiscoveryProviderNotify*, hr : HRESULT, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_failed.call(this, hr, psztag)
  end
  def search_complete(this : IWSDiscoveryProviderNotify*, psztag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.search_complete.call(this, psztag)
  end
end
struct LibWin32::IWSDiscoveredService
  def query_interface(this : IWSDiscoveredService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDiscoveredService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDiscoveredService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_endpoint_reference(this : IWSDiscoveredService*, ppendpointreference : WSD_ENDPOINT_REFERENCE**) : HRESULT
    @lpVtbl.value.get_endpoint_reference.call(this, ppendpointreference)
  end
  def get_types(this : IWSDiscoveredService*, pptypeslist : WSD_NAME_LIST**) : HRESULT
    @lpVtbl.value.get_types.call(this, pptypeslist)
  end
  def get_scopes(this : IWSDiscoveredService*, ppscopeslist : WSD_URI_LIST**) : HRESULT
    @lpVtbl.value.get_scopes.call(this, ppscopeslist)
  end
  def get_x_addrs(this : IWSDiscoveredService*, ppxaddrslist : WSD_URI_LIST**) : HRESULT
    @lpVtbl.value.get_x_addrs.call(this, ppxaddrslist)
  end
  def get_metadata_version(this : IWSDiscoveredService*, pullmetadataversion : UInt64*) : HRESULT
    @lpVtbl.value.get_metadata_version.call(this, pullmetadataversion)
  end
  def get_extended_disco_xml(this : IWSDiscoveredService*, ppheaderany : WSDXML_ELEMENT**, ppbodyany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.get_extended_disco_xml.call(this, ppheaderany, ppbodyany)
  end
  def get_probe_resolve_tag(this : IWSDiscoveredService*, ppsztag : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_probe_resolve_tag.call(this, ppsztag)
  end
  def get_remote_transport_address(this : IWSDiscoveredService*, ppszremotetransportaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_remote_transport_address.call(this, ppszremotetransportaddress)
  end
  def get_local_transport_address(this : IWSDiscoveredService*, ppszlocaltransportaddress : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_local_transport_address.call(this, ppszlocaltransportaddress)
  end
  def get_local_interface_guid(this : IWSDiscoveredService*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_local_interface_guid.call(this, pguid)
  end
  def get_instance_id(this : IWSDiscoveredService*, pullinstanceid : UInt64*) : HRESULT
    @lpVtbl.value.get_instance_id.call(this, pullinstanceid)
  end
end
struct LibWin32::IWSDiscoveryPublisher
  def query_interface(this : IWSDiscoveryPublisher*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDiscoveryPublisher*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDiscoveryPublisher*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_address_family(this : IWSDiscoveryPublisher*, dwaddressfamily : UInt32) : HRESULT
    @lpVtbl.value.set_address_family.call(this, dwaddressfamily)
  end
  def register_notification_sink(this : IWSDiscoveryPublisher*, psink : IWSDiscoveryPublisherNotify) : HRESULT
    @lpVtbl.value.register_notification_sink.call(this, psink)
  end
  def un_register_notification_sink(this : IWSDiscoveryPublisher*, psink : IWSDiscoveryPublisherNotify) : HRESULT
    @lpVtbl.value.un_register_notification_sink.call(this, psink)
  end
  def publish(this : IWSDiscoveryPublisher*, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*) : HRESULT
    @lpVtbl.value.publish.call(this, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist)
  end
  def un_publish(this : IWSDiscoveryPublisher*, pszid : LibC::LPWSTR, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.un_publish.call(this, pszid, ullinstanceid, ullmessagenumber, pszsessionid, pany)
  end
  def match_probe(this : IWSDiscoveryPublisher*, pprobemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*) : HRESULT
    @lpVtbl.value.match_probe.call(this, pprobemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist)
  end
  def match_resolve(this : IWSDiscoveryPublisher*, presolvemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*) : HRESULT
    @lpVtbl.value.match_resolve.call(this, presolvemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist)
  end
  def publish_ex(this : IWSDiscoveryPublisher*, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*, pheaderany : WSDXML_ELEMENT*, preferenceparameterany : WSDXML_ELEMENT*, ppolicyany : WSDXML_ELEMENT*, pendpointreferenceany : WSDXML_ELEMENT*, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.publish_ex.call(this, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist, pheaderany, preferenceparameterany, ppolicyany, pendpointreferenceany, pany)
  end
  def match_probe_ex(this : IWSDiscoveryPublisher*, pprobemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*, pheaderany : WSDXML_ELEMENT*, preferenceparameterany : WSDXML_ELEMENT*, ppolicyany : WSDXML_ELEMENT*, pendpointreferenceany : WSDXML_ELEMENT*, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.match_probe_ex.call(this, pprobemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist, pheaderany, preferenceparameterany, ppolicyany, pendpointreferenceany, pany)
  end
  def match_resolve_ex(this : IWSDiscoveryPublisher*, presolvemessage : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters, pszid : LibC::LPWSTR, ullmetadataversion : UInt64, ullinstanceid : UInt64, ullmessagenumber : UInt64, pszsessionid : LibC::LPWSTR, ptypeslist : WSD_NAME_LIST*, pscopeslist : WSD_URI_LIST*, pxaddrslist : WSD_URI_LIST*, pheaderany : WSDXML_ELEMENT*, preferenceparameterany : WSDXML_ELEMENT*, ppolicyany : WSDXML_ELEMENT*, pendpointreferenceany : WSDXML_ELEMENT*, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.match_resolve_ex.call(this, presolvemessage, pmessageparameters, pszid, ullmetadataversion, ullinstanceid, ullmessagenumber, pszsessionid, ptypeslist, pscopeslist, pxaddrslist, pheaderany, preferenceparameterany, ppolicyany, pendpointreferenceany, pany)
  end
  def register_scope_matching_rule(this : IWSDiscoveryPublisher*, pscopematchingrule : IWSDScopeMatchingRule) : HRESULT
    @lpVtbl.value.register_scope_matching_rule.call(this, pscopematchingrule)
  end
  def un_register_scope_matching_rule(this : IWSDiscoveryPublisher*, pscopematchingrule : IWSDScopeMatchingRule) : HRESULT
    @lpVtbl.value.un_register_scope_matching_rule.call(this, pscopematchingrule)
  end
  def get_xml_context(this : IWSDiscoveryPublisher*, ppcontext : IWSDXMLContext*) : HRESULT
    @lpVtbl.value.get_xml_context.call(this, ppcontext)
  end
end
struct LibWin32::IWSDiscoveryPublisherNotify
  def query_interface(this : IWSDiscoveryPublisherNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDiscoveryPublisherNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDiscoveryPublisherNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def probe_handler(this : IWSDiscoveryPublisherNotify*, psoap : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters) : HRESULT
    @lpVtbl.value.probe_handler.call(this, psoap, pmessageparameters)
  end
  def resolve_handler(this : IWSDiscoveryPublisherNotify*, psoap : WSD_SOAP_MESSAGE*, pmessageparameters : IWSDMessageParameters) : HRESULT
    @lpVtbl.value.resolve_handler.call(this, psoap, pmessageparameters)
  end
end
struct LibWin32::IWSDScopeMatchingRule
  def query_interface(this : IWSDScopeMatchingRule*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDScopeMatchingRule*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDScopeMatchingRule*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_scope_rule(this : IWSDScopeMatchingRule*, ppszscopematchingrule : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_scope_rule.call(this, ppszscopematchingrule)
  end
  def match_scopes(this : IWSDScopeMatchingRule*, pszscope1 : LibC::LPWSTR, pszscope2 : LibC::LPWSTR, pfmatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.match_scopes.call(this, pszscope1, pszscope2, pfmatch)
  end
end
struct LibWin32::IWSDEndpointProxy
  def query_interface(this : IWSDEndpointProxy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDEndpointProxy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDEndpointProxy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def send_one_way_request(this : IWSDEndpointProxy*, pbody : Void*, poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.send_one_way_request.call(this, pbody, poperation)
  end
  def send_two_way_request(this : IWSDEndpointProxy*, pbody : Void*, poperation : WSD_OPERATION*, presponsecontext : WSD_SYNCHRONOUS_RESPONSE_CONTEXT*) : HRESULT
    @lpVtbl.value.send_two_way_request.call(this, pbody, poperation, presponsecontext)
  end
  def send_two_way_request_async(this : IWSDEndpointProxy*, pbody : Void*, poperation : WSD_OPERATION*, pasyncstate : IUnknown, pcallback : IWSDAsyncCallback, presult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.send_two_way_request_async.call(this, pbody, poperation, pasyncstate, pcallback, presult)
  end
  def abort_async_operation(this : IWSDEndpointProxy*, pasyncresult : IWSDAsyncResult) : HRESULT
    @lpVtbl.value.abort_async_operation.call(this, pasyncresult)
  end
  def process_fault(this : IWSDEndpointProxy*, pfault : WSD_SOAP_FAULT*) : HRESULT
    @lpVtbl.value.process_fault.call(this, pfault)
  end
  def get_error_info(this : IWSDEndpointProxy*, ppszerrorinfo : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_error_info.call(this, ppszerrorinfo)
  end
  def get_fault_info(this : IWSDEndpointProxy*, ppfault : WSD_SOAP_FAULT**) : HRESULT
    @lpVtbl.value.get_fault_info.call(this, ppfault)
  end
end
struct LibWin32::IWSDMetadataExchange
  def query_interface(this : IWSDMetadataExchange*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDMetadataExchange*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDMetadataExchange*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_metadata(this : IWSDMetadataExchange*, metadataout : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_metadata.call(this, metadataout)
  end
end
struct LibWin32::IWSDServiceProxy
  def query_interface(this : IWSDServiceProxy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDServiceProxy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDServiceProxy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_metadata(this : IWSDServiceProxy*, metadataout : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_metadata.call(this, metadataout)
  end
  def begin_get_metadata(this : IWSDServiceProxy*, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_metadata.call(this, ppresult)
  end
  def end_get_metadata(this : IWSDServiceProxy*, presult : IWSDAsyncResult, ppmetadata : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.end_get_metadata.call(this, presult, ppmetadata)
  end
  def get_service_metadata(this : IWSDServiceProxy*, ppservicemetadata : WSD_SERVICE_METADATA**) : HRESULT
    @lpVtbl.value.get_service_metadata.call(this, ppservicemetadata)
  end
  def subscribe_to_operation(this : IWSDServiceProxy*, poperation : WSD_OPERATION*, punknown : IUnknown, pany : WSDXML_ELEMENT*, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.subscribe_to_operation.call(this, poperation, punknown, pany, ppany)
  end
  def unsubscribe_to_operation(this : IWSDServiceProxy*, poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.unsubscribe_to_operation.call(this, poperation)
  end
  def set_eventing_status_callback(this : IWSDServiceProxy*, pstatus : IWSDEventingStatus) : HRESULT
    @lpVtbl.value.set_eventing_status_callback.call(this, pstatus)
  end
  def get_endpoint_proxy(this : IWSDServiceProxy*, ppproxy : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.call(this, ppproxy)
  end
end
struct LibWin32::IWSDServiceProxyEventing
  def query_interface(this : IWSDServiceProxyEventing*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDServiceProxyEventing*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDServiceProxyEventing*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_metadata(this : IWSDServiceProxyEventing*, metadataout : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_metadata.call(this, metadataout)
  end
  def begin_get_metadata(this : IWSDServiceProxyEventing*, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_metadata.call(this, ppresult)
  end
  def end_get_metadata(this : IWSDServiceProxyEventing*, presult : IWSDAsyncResult, ppmetadata : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.end_get_metadata.call(this, presult, ppmetadata)
  end
  def get_service_metadata(this : IWSDServiceProxyEventing*, ppservicemetadata : WSD_SERVICE_METADATA**) : HRESULT
    @lpVtbl.value.get_service_metadata.call(this, ppservicemetadata)
  end
  def subscribe_to_operation(this : IWSDServiceProxyEventing*, poperation : WSD_OPERATION*, punknown : IUnknown, pany : WSDXML_ELEMENT*, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.subscribe_to_operation.call(this, poperation, punknown, pany, ppany)
  end
  def unsubscribe_to_operation(this : IWSDServiceProxyEventing*, poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.unsubscribe_to_operation.call(this, poperation)
  end
  def set_eventing_status_callback(this : IWSDServiceProxyEventing*, pstatus : IWSDEventingStatus) : HRESULT
    @lpVtbl.value.set_eventing_status_callback.call(this, pstatus)
  end
  def get_endpoint_proxy(this : IWSDServiceProxyEventing*, ppproxy : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.call(this, ppproxy)
  end
  def subscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, punknown : IUnknown, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.subscribe_to_multiple_operations.call(this, poperations, dwoperationcount, punknown, pexpires, pany, ppexpires, ppany)
  end
  def begin_subscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, punknown : IUnknown, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_subscribe_to_multiple_operations.call(this, poperations, dwoperationcount, punknown, pexpires, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_subscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.end_subscribe_to_multiple_operations.call(this, poperations, dwoperationcount, presult, ppexpires, ppany)
  end
  def unsubscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*) : HRESULT
    @lpVtbl.value.unsubscribe_to_multiple_operations.call(this, poperations, dwoperationcount, pany)
  end
  def begin_unsubscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_unsubscribe_to_multiple_operations.call(this, poperations, dwoperationcount, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_unsubscribe_to_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult) : HRESULT
    @lpVtbl.value.end_unsubscribe_to_multiple_operations.call(this, poperations, dwoperationcount, presult)
  end
  def renew_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.renew_multiple_operations.call(this, poperations, dwoperationcount, pexpires, pany, ppexpires, ppany)
  end
  def begin_renew_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, pexpires : WSD_EVENTING_EXPIRES*, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_renew_multiple_operations.call(this, poperations, dwoperationcount, pexpires, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_renew_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.end_renew_multiple_operations.call(this, poperations, dwoperationcount, presult, ppexpires, ppany)
  end
  def get_status_for_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.get_status_for_multiple_operations.call(this, poperations, dwoperationcount, pany, ppexpires, ppany)
  end
  def begin_get_status_for_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, pany : WSDXML_ELEMENT*, pasyncstate : IUnknown, pasynccallback : IWSDAsyncCallback, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_status_for_multiple_operations.call(this, poperations, dwoperationcount, pany, pasyncstate, pasynccallback, ppresult)
  end
  def end_get_status_for_multiple_operations(this : IWSDServiceProxyEventing*, poperations : WSD_OPERATION*, dwoperationcount : UInt32, presult : IWSDAsyncResult, ppexpires : WSD_EVENTING_EXPIRES**, ppany : WSDXML_ELEMENT**) : HRESULT
    @lpVtbl.value.end_get_status_for_multiple_operations.call(this, poperations, dwoperationcount, presult, ppexpires, ppany)
  end
end
struct LibWin32::IWSDDeviceProxy
  def query_interface(this : IWSDDeviceProxy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDDeviceProxy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDDeviceProxy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def init(this : IWSDDeviceProxy*, pszdeviceid : LibC::LPWSTR, pdeviceaddress : IWSDAddress, pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, psponsor : IWSDDeviceProxy) : HRESULT
    @lpVtbl.value.init.call(this, pszdeviceid, pdeviceaddress, pszlocalid, pcontext, psponsor)
  end
  def begin_get_metadata(this : IWSDDeviceProxy*, ppresult : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.begin_get_metadata.call(this, ppresult)
  end
  def end_get_metadata(this : IWSDDeviceProxy*, presult : IWSDAsyncResult) : HRESULT
    @lpVtbl.value.end_get_metadata.call(this, presult)
  end
  def get_host_metadata(this : IWSDDeviceProxy*, pphostmetadata : WSD_HOST_METADATA**) : HRESULT
    @lpVtbl.value.get_host_metadata.call(this, pphostmetadata)
  end
  def get_this_model_metadata(this : IWSDDeviceProxy*, ppmanufacturermetadata : WSD_THIS_MODEL_METADATA**) : HRESULT
    @lpVtbl.value.get_this_model_metadata.call(this, ppmanufacturermetadata)
  end
  def get_this_device_metadata(this : IWSDDeviceProxy*, ppthisdevicemetadata : WSD_THIS_DEVICE_METADATA**) : HRESULT
    @lpVtbl.value.get_this_device_metadata.call(this, ppthisdevicemetadata)
  end
  def get_all_metadata(this : IWSDDeviceProxy*, ppmetadata : WSD_METADATA_SECTION_LIST**) : HRESULT
    @lpVtbl.value.get_all_metadata.call(this, ppmetadata)
  end
  def get_service_proxy_by_id(this : IWSDDeviceProxy*, pszserviceid : LibC::LPWSTR, ppserviceproxy : IWSDServiceProxy*) : HRESULT
    @lpVtbl.value.get_service_proxy_by_id.call(this, pszserviceid, ppserviceproxy)
  end
  def get_service_proxy_by_type(this : IWSDDeviceProxy*, ptype : WSDXML_NAME*, ppserviceproxy : IWSDServiceProxy*) : HRESULT
    @lpVtbl.value.get_service_proxy_by_type.call(this, ptype, ppserviceproxy)
  end
  def get_endpoint_proxy(this : IWSDDeviceProxy*, ppproxy : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.call(this, ppproxy)
  end
end
struct LibWin32::IWSDAsyncResult
  def query_interface(this : IWSDAsyncResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDAsyncResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDAsyncResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_callback(this : IWSDAsyncResult*, pcallback : IWSDAsyncCallback, pasyncstate : IUnknown) : HRESULT
    @lpVtbl.value.set_callback.call(this, pcallback, pasyncstate)
  end
  def set_wait_handle(this : IWSDAsyncResult*, hwaithandle : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_wait_handle.call(this, hwaithandle)
  end
  def has_completed(this : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.has_completed.call(this)
  end
  def get_async_state(this : IWSDAsyncResult*, ppasyncstate : IUnknown*) : HRESULT
    @lpVtbl.value.get_async_state.call(this, ppasyncstate)
  end
  def abort(this : IWSDAsyncResult*) : HRESULT
    @lpVtbl.value.abort.call(this)
  end
  def get_event(this : IWSDAsyncResult*, pevent : WSD_EVENT*) : HRESULT
    @lpVtbl.value.get_event.call(this, pevent)
  end
  def get_endpoint_proxy(this : IWSDAsyncResult*, ppendpoint : IWSDEndpointProxy*) : HRESULT
    @lpVtbl.value.get_endpoint_proxy.call(this, ppendpoint)
  end
end
struct LibWin32::IWSDAsyncCallback
  def query_interface(this : IWSDAsyncCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDAsyncCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDAsyncCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def async_operation_complete(this : IWSDAsyncCallback*, pasyncresult : IWSDAsyncResult, pasyncstate : IUnknown) : HRESULT
    @lpVtbl.value.async_operation_complete.call(this, pasyncresult, pasyncstate)
  end
end
struct LibWin32::IWSDEventingStatus
  def query_interface(this : IWSDEventingStatus*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDEventingStatus*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDEventingStatus*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def subscription_renewed(this : IWSDEventingStatus*, pszsubscriptionaction : LibC::LPWSTR) : Void
    @lpVtbl.value.subscription_renewed.call(this, pszsubscriptionaction)
  end
  def subscription_renewal_failed(this : IWSDEventingStatus*, pszsubscriptionaction : LibC::LPWSTR, hr : HRESULT) : Void
    @lpVtbl.value.subscription_renewal_failed.call(this, pszsubscriptionaction, hr)
  end
  def subscription_ended(this : IWSDEventingStatus*, pszsubscriptionaction : LibC::LPWSTR) : Void
    @lpVtbl.value.subscription_ended.call(this, pszsubscriptionaction)
  end
end
struct LibWin32::IWSDDeviceHost
  def query_interface(this : IWSDDeviceHost*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDDeviceHost*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDDeviceHost*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def init(this : IWSDDeviceHost*, pszlocalid : LibC::LPWSTR, pcontext : IWSDXMLContext, pphostaddresses : IWSDAddress*, dwhostaddresscount : UInt32) : HRESULT
    @lpVtbl.value.init.call(this, pszlocalid, pcontext, pphostaddresses, dwhostaddresscount)
  end
  def start(this : IWSDDeviceHost*, ullinstanceid : UInt64, pscopelist : WSD_URI_LIST*, pnotificationsink : IWSDDeviceHostNotify) : HRESULT
    @lpVtbl.value.start.call(this, ullinstanceid, pscopelist, pnotificationsink)
  end
  def stop(this : IWSDDeviceHost*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
  def terminate(this : IWSDDeviceHost*) : HRESULT
    @lpVtbl.value.terminate.call(this)
  end
  def register_port_type(this : IWSDDeviceHost*, pporttype : WSD_PORT_TYPE*) : HRESULT
    @lpVtbl.value.register_port_type.call(this, pporttype)
  end
  def set_metadata(this : IWSDDeviceHost*, pthismodelmetadata : WSD_THIS_MODEL_METADATA*, pthisdevicemetadata : WSD_THIS_DEVICE_METADATA*, phostmetadata : WSD_HOST_METADATA*, pcustommetadata : WSD_METADATA_SECTION_LIST*) : HRESULT
    @lpVtbl.value.set_metadata.call(this, pthismodelmetadata, pthisdevicemetadata, phostmetadata, pcustommetadata)
  end
  def register_service(this : IWSDDeviceHost*, pszserviceid : LibC::LPWSTR, pservice : IUnknown) : HRESULT
    @lpVtbl.value.register_service.call(this, pszserviceid, pservice)
  end
  def retire_service(this : IWSDDeviceHost*, pszserviceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.retire_service.call(this, pszserviceid)
  end
  def add_dynamic_service(this : IWSDDeviceHost*, pszserviceid : LibC::LPWSTR, pszendpointaddress : LibC::LPWSTR, pporttype : WSD_PORT_TYPE*, pportname : WSDXML_NAME*, pany : WSDXML_ELEMENT*, pservice : IUnknown) : HRESULT
    @lpVtbl.value.add_dynamic_service.call(this, pszserviceid, pszendpointaddress, pporttype, pportname, pany, pservice)
  end
  def remove_dynamic_service(this : IWSDDeviceHost*, pszserviceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_dynamic_service.call(this, pszserviceid)
  end
  def set_service_discoverable(this : IWSDDeviceHost*, pszserviceid : LibC::LPWSTR, fdiscoverable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_service_discoverable.call(this, pszserviceid, fdiscoverable)
  end
  def signal_event(this : IWSDDeviceHost*, pszserviceid : LibC::LPWSTR, pbody : Void*, poperation : WSD_OPERATION*) : HRESULT
    @lpVtbl.value.signal_event.call(this, pszserviceid, pbody, poperation)
  end
end
struct LibWin32::IWSDDeviceHostNotify
  def query_interface(this : IWSDDeviceHostNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDDeviceHostNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDDeviceHostNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_service(this : IWSDDeviceHostNotify*, pszserviceid : LibC::LPWSTR, ppservice : IUnknown*) : HRESULT
    @lpVtbl.value.get_service.call(this, pszserviceid, ppservice)
  end
end
struct LibWin32::IWSDServiceMessaging
  def query_interface(this : IWSDServiceMessaging*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSDServiceMessaging*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSDServiceMessaging*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def send_response(this : IWSDServiceMessaging*, pbody : Void*, poperation : WSD_OPERATION*, pmessageparameters : IWSDMessageParameters) : HRESULT
    @lpVtbl.value.send_response.call(this, pbody, poperation, pmessageparameters)
  end
  def fault_request(this : IWSDServiceMessaging*, prequestheader : WSD_SOAP_HEADER*, pmessageparameters : IWSDMessageParameters, pfault : WSD_SOAP_FAULT*) : HRESULT
    @lpVtbl.value.fault_request.call(this, prequestheader, pmessageparameters, pfault)
  end
end
