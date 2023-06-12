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

  IWSDAddress_GUID = LibC::GUID.new("b9574c6c-12a6-4f74-93a1-3318ff605759")
  CLSID_IWSDAddress = "b9574c6c-12a6-4f74-93a1-3318ff605759"
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

  IWSDTransportAddress_GUID = LibC::GUID.new("70d23498-4ee6-4340-a3df-d845d2235467")
  CLSID_IWSDTransportAddress = "70d23498-4ee6-4340-a3df-d845d2235467"
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

  IWSDMessageParameters_GUID = LibC::GUID.new("1fafe8a2-e6fc-4b80-b6cf-b7d45c416d7c")
  CLSID_IWSDMessageParameters = "1fafe8a2-e6fc-4b80-b6cf-b7d45c416d7c"
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

  IWSDUdpMessageParameters_GUID = LibC::GUID.new("9934149f-8f0c-447b-aa0b-73124b0ca7f0")
  CLSID_IWSDUdpMessageParameters = "9934149f-8f0c-447b-aa0b-73124b0ca7f0"
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

  IWSDUdpAddress_GUID = LibC::GUID.new("74d6124a-a441-4f78-a1eb-97a8d1996893")
  CLSID_IWSDUdpAddress = "74d6124a-a441-4f78-a1eb-97a8d1996893"
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

  IWSDHttpMessageParameters_GUID = LibC::GUID.new("540bd122-5c83-4dec-b396-ea62a2697fdf")
  CLSID_IWSDHttpMessageParameters = "540bd122-5c83-4dec-b396-ea62a2697fdf"
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

  IWSDHttpAddress_GUID = LibC::GUID.new("d09ac7bd-2a3e-4b85-8605-2737ff3e4ea0")
  CLSID_IWSDHttpAddress = "d09ac7bd-2a3e-4b85-8605-2737ff3e4ea0"
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

  IWSDSSLClientCertificate_GUID = LibC::GUID.new("de105e87-a0da-418e-98ad-27b9eed87bdc")
  CLSID_IWSDSSLClientCertificate = "de105e87-a0da-418e-98ad-27b9eed87bdc"
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

  IWSDHttpAuthParameters_GUID = LibC::GUID.new("0b476df0-8dac-480d-b05c-99781a5884aa")
  CLSID_IWSDHttpAuthParameters = "0b476df0-8dac-480d-b05c-99781a5884aa"
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

  IWSDSignatureProperty_GUID = LibC::GUID.new("03ce20aa-71c4-45e2-b32e-3766c61c790f")
  CLSID_IWSDSignatureProperty = "03ce20aa-71c4-45e2-b32e-3766c61c790f"
  struct IWSDSignatureProperty
    lpVtbl : IWSDSignaturePropertyVTbl*
  end

  struct IWSDAttachmentVTbl
    query_interface : Proc(IWSDAttachment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDAttachment*, UInt32)
    release : Proc(IWSDAttachment*, UInt32)
  end

  IWSDAttachment_GUID = LibC::GUID.new("5d55a616-9df8-4b09-b156-9ba351a48b76")
  CLSID_IWSDAttachment = "5d55a616-9df8-4b09-b156-9ba351a48b76"
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

  IWSDOutboundAttachment_GUID = LibC::GUID.new("aa302f8d-5a22-4ba5-b392-aa8486f4c15d")
  CLSID_IWSDOutboundAttachment = "aa302f8d-5a22-4ba5-b392-aa8486f4c15d"
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

  IWSDInboundAttachment_GUID = LibC::GUID.new("5bd6ca65-233c-4fb8-9f7a-2641619655c9")
  CLSID_IWSDInboundAttachment = "5bd6ca65-233c-4fb8-9f7a-2641619655c9"
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

  IWSDXMLContext_GUID = LibC::GUID.new("75d8f3ee-3e5a-43b4-a15a-bcf6887460c0")
  CLSID_IWSDXMLContext = "75d8f3ee-3e5a-43b4-a15a-bcf6887460c0"
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

  IWSDiscoveryProvider_GUID = LibC::GUID.new("8ffc8e55-f0eb-480f-88b7-b435dd281d45")
  CLSID_IWSDiscoveryProvider = "8ffc8e55-f0eb-480f-88b7-b435dd281d45"
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

  IWSDiscoveryProviderNotify_GUID = LibC::GUID.new("73ee3ced-b6e6-4329-a546-3e8ad46563d2")
  CLSID_IWSDiscoveryProviderNotify = "73ee3ced-b6e6-4329-a546-3e8ad46563d2"
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

  IWSDiscoveredService_GUID = LibC::GUID.new("4bad8a3b-b374-4420-9632-aac945b374aa")
  CLSID_IWSDiscoveredService = "4bad8a3b-b374-4420-9632-aac945b374aa"
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

  IWSDiscoveryPublisher_GUID = LibC::GUID.new("ae01e1a8-3ff9-4148-8116-057cc616fe13")
  CLSID_IWSDiscoveryPublisher = "ae01e1a8-3ff9-4148-8116-057cc616fe13"
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

  IWSDiscoveryPublisherNotify_GUID = LibC::GUID.new("e67651b0-337a-4b3c-9758-733388568251")
  CLSID_IWSDiscoveryPublisherNotify = "e67651b0-337a-4b3c-9758-733388568251"
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

  IWSDScopeMatchingRule_GUID = LibC::GUID.new("fcafe424-fef5-481a-bd9f-33ce0574256f")
  CLSID_IWSDScopeMatchingRule = "fcafe424-fef5-481a-bd9f-33ce0574256f"
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

  IWSDEndpointProxy_GUID = LibC::GUID.new("1860d430-b24c-4975-9f90-dbb39baa24ec")
  CLSID_IWSDEndpointProxy = "1860d430-b24c-4975-9f90-dbb39baa24ec"
  struct IWSDEndpointProxy
    lpVtbl : IWSDEndpointProxyVTbl*
  end

  struct IWSDMetadataExchangeVTbl
    query_interface : Proc(IWSDMetadataExchange*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDMetadataExchange*, UInt32)
    release : Proc(IWSDMetadataExchange*, UInt32)
    get_metadata : Proc(IWSDMetadataExchange*, WSD_METADATA_SECTION_LIST**, HRESULT)
  end

  IWSDMetadataExchange_GUID = LibC::GUID.new("06996d57-1d67-4928-9307-3d7833fdb846")
  CLSID_IWSDMetadataExchange = "06996d57-1d67-4928-9307-3d7833fdb846"
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

  IWSDServiceProxy_GUID = LibC::GUID.new("d4c7fb9c-03ab-4175-9d67-094fafebf487")
  CLSID_IWSDServiceProxy = "d4c7fb9c-03ab-4175-9d67-094fafebf487"
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

  IWSDServiceProxyEventing_GUID = LibC::GUID.new("f9279d6d-1012-4a94-b8cc-fd35d2202bfe")
  CLSID_IWSDServiceProxyEventing = "f9279d6d-1012-4a94-b8cc-fd35d2202bfe"
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

  IWSDDeviceProxy_GUID = LibC::GUID.new("eee0c031-c578-4c0e-9a3b-973c35f409db")
  CLSID_IWSDDeviceProxy = "eee0c031-c578-4c0e-9a3b-973c35f409db"
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

  IWSDAsyncResult_GUID = LibC::GUID.new("11a9852a-8dd8-423e-b537-9356db4fbfb8")
  CLSID_IWSDAsyncResult = "11a9852a-8dd8-423e-b537-9356db4fbfb8"
  struct IWSDAsyncResult
    lpVtbl : IWSDAsyncResultVTbl*
  end

  struct IWSDAsyncCallbackVTbl
    query_interface : Proc(IWSDAsyncCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDAsyncCallback*, UInt32)
    release : Proc(IWSDAsyncCallback*, UInt32)
    async_operation_complete : Proc(IWSDAsyncCallback*, IWSDAsyncResult, IUnknown, HRESULT)
  end

  IWSDAsyncCallback_GUID = LibC::GUID.new("a63e109d-ce72-49e2-ba98-e845f5ee1666")
  CLSID_IWSDAsyncCallback = "a63e109d-ce72-49e2-ba98-e845f5ee1666"
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

  IWSDEventingStatus_GUID = LibC::GUID.new("49b17f52-637a-407a-ae99-fbe82a4d38c0")
  CLSID_IWSDEventingStatus = "49b17f52-637a-407a-ae99-fbe82a4d38c0"
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

  IWSDDeviceHost_GUID = LibC::GUID.new("917fe891-3d13-4138-9809-934c8abeb12c")
  CLSID_IWSDDeviceHost = "917fe891-3d13-4138-9809-934c8abeb12c"
  struct IWSDDeviceHost
    lpVtbl : IWSDDeviceHostVTbl*
  end

  struct IWSDDeviceHostNotifyVTbl
    query_interface : Proc(IWSDDeviceHostNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSDDeviceHostNotify*, UInt32)
    release : Proc(IWSDDeviceHostNotify*, UInt32)
    get_service : Proc(IWSDDeviceHostNotify*, LibC::LPWSTR, IUnknown*, HRESULT)
  end

  IWSDDeviceHostNotify_GUID = LibC::GUID.new("b5bee9f9-eeda-41fe-96f7-f45e14990fb0")
  CLSID_IWSDDeviceHostNotify = "b5bee9f9-eeda-41fe-96f7-f45e14990fb0"
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

  IWSDServiceMessaging_GUID = LibC::GUID.new("94974cf4-0cab-460d-a3f6-7a0ad623c0e6")
  CLSID_IWSDServiceMessaging = "94974cf4-0cab-460d-a3f6-7a0ad623c0e6"
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
  fun WSDFreeLinkedMemory(pvoid : Void*)

  # Params # pparent : Void* [In],pchild : Void* [In]
  fun WSDAttachLinkedMemory(pparent : Void*, pchild : Void*)

  # Params # pvoid : Void* [In]
  fun WSDDetachLinkedMemory(pvoid : Void*)

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
