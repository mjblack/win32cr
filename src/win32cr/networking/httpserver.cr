require "../foundation.cr"
require "../security.cr"
require "../networking/winsock.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:httpapi.dll")]
lib LibWin32
  HTTP_DEMAND_CBT = 4_u32
  HTTP_MAX_SERVER_QUEUE_LENGTH = 2147483647_u32
  HTTP_MIN_SERVER_QUEUE_LENGTH = 1_u32
  HTTP_AUTH_ENABLE_BASIC = 1_u32
  HTTP_AUTH_ENABLE_DIGEST = 2_u32
  HTTP_AUTH_ENABLE_NTLM = 4_u32
  HTTP_AUTH_ENABLE_NEGOTIATE = 8_u32
  HTTP_AUTH_ENABLE_KERBEROS = 16_u32
  HTTP_AUTH_EX_FLAG_ENABLE_KERBEROS_CREDENTIAL_CACHING = 1_u32
  HTTP_AUTH_EX_FLAG_CAPTURE_CREDENTIAL = 2_u32
  HTTP_CHANNEL_BIND_PROXY = 1_u32
  HTTP_CHANNEL_BIND_PROXY_COHOSTING = 32_u32
  HTTP_CHANNEL_BIND_NO_SERVICE_NAME_CHECK = 2_u32
  HTTP_CHANNEL_BIND_DOTLESS_SERVICE = 4_u32
  HTTP_CHANNEL_BIND_SECURE_CHANNEL_TOKEN = 8_u32
  HTTP_CHANNEL_BIND_CLIENT_SERVICE = 16_u32
  HTTP_LOG_FIELD_DATE = 1_u32
  HTTP_LOG_FIELD_TIME = 2_u32
  HTTP_LOG_FIELD_CLIENT_IP = 4_u32
  HTTP_LOG_FIELD_USER_NAME = 8_u32
  HTTP_LOG_FIELD_SITE_NAME = 16_u32
  HTTP_LOG_FIELD_COMPUTER_NAME = 32_u32
  HTTP_LOG_FIELD_SERVER_IP = 64_u32
  HTTP_LOG_FIELD_METHOD = 128_u32
  HTTP_LOG_FIELD_URI_STEM = 256_u32
  HTTP_LOG_FIELD_URI_QUERY = 512_u32
  HTTP_LOG_FIELD_STATUS = 1024_u32
  HTTP_LOG_FIELD_WIN32_STATUS = 2048_u32
  HTTP_LOG_FIELD_BYTES_SENT = 4096_u32
  HTTP_LOG_FIELD_BYTES_RECV = 8192_u32
  HTTP_LOG_FIELD_TIME_TAKEN = 16384_u32
  HTTP_LOG_FIELD_SERVER_PORT = 32768_u32
  HTTP_LOG_FIELD_USER_AGENT = 65536_u32
  HTTP_LOG_FIELD_COOKIE = 131072_u32
  HTTP_LOG_FIELD_REFERER = 262144_u32
  HTTP_LOG_FIELD_VERSION = 524288_u32
  HTTP_LOG_FIELD_HOST = 1048576_u32
  HTTP_LOG_FIELD_SUB_STATUS = 2097152_u32
  HTTP_LOG_FIELD_STREAM_ID = 134217728_u32
  HTTP_LOG_FIELD_STREAM_ID_EX = 268435456_u32
  HTTP_LOG_FIELD_TRANSPORT_TYPE = 536870912_u32
  HTTP_LOG_FIELD_CLIENT_PORT = 4194304_u32
  HTTP_LOG_FIELD_URI = 8388608_u32
  HTTP_LOG_FIELD_SITE_ID = 16777216_u32
  HTTP_LOG_FIELD_REASON = 33554432_u32
  HTTP_LOG_FIELD_QUEUE_NAME = 67108864_u32
  HTTP_LOG_FIELD_CORRELATION_ID = 1073741824_u32
  HTTP_LOGGING_FLAG_LOCAL_TIME_ROLLOVER = 1_u32
  HTTP_LOGGING_FLAG_USE_UTF8_CONVERSION = 2_u32
  HTTP_LOGGING_FLAG_LOG_ERRORS_ONLY = 4_u32
  HTTP_LOGGING_FLAG_LOG_SUCCESS_ONLY = 8_u32
  HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING = 1_u32
  HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER = 2_u32
  HTTP_CREATE_REQUEST_QUEUE_FLAG_DELEGATION = 8_u32
  HTTP_RECEIVE_REQUEST_ENTITY_BODY_FLAG_FILL_BUFFER = 1_u32
  HTTP_SEND_RESPONSE_FLAG_DISCONNECT = 1_u32
  HTTP_SEND_RESPONSE_FLAG_MORE_DATA = 2_u32
  HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA = 4_u32
  HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING = 8_u32
  HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES = 32_u32
  HTTP_SEND_RESPONSE_FLAG_OPAQUE = 64_u32
  HTTP_SEND_RESPONSE_FLAG_GOAWAY = 256_u32
  HTTP_FLUSH_RESPONSE_FLAG_RECURSIVE = 1_u32
  HTTP_URL_FLAG_REMOVE_ALL = 1_u32
  HTTP_RECEIVE_SECURE_CHANNEL_TOKEN = 1_u32
  HTTP_RECEIVE_FULL_CHAIN = 2_u32
  HTTP_REQUEST_SIZING_INFO_FLAG_TCP_FAST_OPEN = 1_u32
  HTTP_REQUEST_SIZING_INFO_FLAG_TLS_SESSION_RESUMPTION = 2_u32
  HTTP_REQUEST_SIZING_INFO_FLAG_TLS_FALSE_START = 4_u32
  HTTP_REQUEST_SIZING_INFO_FLAG_FIRST_REQUEST = 8_u32
  HTTP_REQUEST_AUTH_FLAG_TOKEN_FOR_CACHED_CRED = 1_u32
  HTTP_REQUEST_FLAG_MORE_ENTITY_BODY_EXISTS = 1_u32
  HTTP_REQUEST_FLAG_IP_ROUTED = 2_u32
  HTTP_REQUEST_FLAG_HTTP2 = 4_u32
  HTTP_REQUEST_FLAG_HTTP3 = 8_u32
  HTTP_RESPONSE_FLAG_MULTIPLE_ENCODINGS_AVAILABLE = 1_u32
  HTTP_RESPONSE_FLAG_MORE_ENTITY_BODY_EXISTS = 2_u32
  HTTP_RESPONSE_INFO_FLAGS_PRESERVE_ORDER = 1_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER = 1_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_NEGOTIATE_CLIENT_CERT = 2_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_NO_RAW_FILTER = 4_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_REJECT = 8_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_HTTP2 = 16_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_QUIC = 32_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS13 = 64_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_OCSP_STAPLING = 128_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_TOKEN_BINDING = 256_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_LOG_EXTENDED_EVENTS = 512_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_LEGACY_TLS = 1024_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_SESSION_TICKET = 2048_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS12 = 4096_u32
  HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CLIENT_CORRELATION = 8192_u32
  HTTP_REQUEST_PROPERTY_SNI_HOST_MAX_LENGTH = 255_u32
  HTTP_REQUEST_PROPERTY_SNI_FLAG_SNI_USED = 1_u32
  HTTP_REQUEST_PROPERTY_SNI_FLAG_NO_SNI = 2_u32


  enum HTTP_RECEIVE_HTTP_REQUEST_FLAGS : UInt32
    HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY = 1
    HTTP_RECEIVE_REQUEST_FLAG_FLUSH_BODY = 2
  end

  enum HTTP_INITIALIZE : UInt32
    HTTP_INITIALIZE_CONFIG = 2
    HTTP_INITIALIZE_SERVER = 1
  end

  enum HTTP_SERVER_PROPERTY : Int32
    HttpServerAuthenticationProperty = 0
    HttpServerLoggingProperty = 1
    HttpServerQosProperty = 2
    HttpServerTimeoutsProperty = 3
    HttpServerQueueLengthProperty = 4
    HttpServerStateProperty = 5
    HttpServer503VerbosityProperty = 6
    HttpServerBindingProperty = 7
    HttpServerExtendedAuthenticationProperty = 8
    HttpServerListenEndpointProperty = 9
    HttpServerChannelBindProperty = 10
    HttpServerProtectionLevelProperty = 11
    HttpServerDelegationProperty = 16
  end

  enum HTTP_ENABLED_STATE : Int32
    HttpEnabledStateActive = 0
    HttpEnabledStateInactive = 1
  end

  enum HTTP_503_RESPONSE_VERBOSITY : Int32
    Http503ResponseVerbosityBasic = 0
    Http503ResponseVerbosityLimited = 1
    Http503ResponseVerbosityFull = 2
  end

  enum HTTP_QOS_SETTING_TYPE : Int32
    HttpQosSettingTypeBandwidth = 0
    HttpQosSettingTypeConnectionLimit = 1
    HttpQosSettingTypeFlowRate = 2
  end

  enum HTTP_SERVICE_CONFIG_TIMEOUT_KEY : Int32
    IdleConnectionTimeout = 0
    HeaderWaitTimeout = 1
  end

  enum HTTP_SERVICE_CONFIG_SETTING_KEY : Int32
    HttpNone = 0
    HttpTlsThrottle = 1
  end

  enum HTTP_SERVICE_BINDING_TYPE : Int32
    HttpServiceBindingTypeNone = 0
    HttpServiceBindingTypeW = 1
    HttpServiceBindingTypeA = 2
  end

  enum HTTP_AUTHENTICATION_HARDENING_LEVELS : Int32
    HttpAuthenticationHardeningLegacy = 0
    HttpAuthenticationHardeningMedium = 1
    HttpAuthenticationHardeningStrict = 2
  end

  enum HTTP_LOGGING_TYPE : Int32
    HttpLoggingTypeW3C = 0
    HttpLoggingTypeIIS = 1
    HttpLoggingTypeNCSA = 2
    HttpLoggingTypeRaw = 3
  end

  enum HTTP_LOGGING_ROLLOVER_TYPE : Int32
    HttpLoggingRolloverSize = 0
    HttpLoggingRolloverDaily = 1
    HttpLoggingRolloverWeekly = 2
    HttpLoggingRolloverMonthly = 3
    HttpLoggingRolloverHourly = 4
  end

  enum HTTP_PROTECTION_LEVEL_TYPE : Int32
    HttpProtectionLevelUnrestricted = 0
    HttpProtectionLevelEdgeRestricted = 1
    HttpProtectionLevelRestricted = 2
  end

  enum HTTP_SCHEME : Int32
    HttpSchemeHttp = 0
    HttpSchemeHttps = 1
    HttpSchemeMaximum = 2
  end

  enum HTTP_VERB : Int32
    HttpVerbUnparsed = 0
    HttpVerbUnknown = 1
    HttpVerbInvalid = 2
    HttpVerbOPTIONS = 3
    HttpVerbGET = 4
    HttpVerbHEAD = 5
    HttpVerbPOST = 6
    HttpVerbPUT = 7
    HttpVerbDELETE = 8
    HttpVerbTRACE = 9
    HttpVerbCONNECT = 10
    HttpVerbTRACK = 11
    HttpVerbMOVE = 12
    HttpVerbCOPY = 13
    HttpVerbPROPFIND = 14
    HttpVerbPROPPATCH = 15
    HttpVerbMKCOL = 16
    HttpVerbLOCK = 17
    HttpVerbUNLOCK = 18
    HttpVerbSEARCH = 19
    HttpVerbMaximum = 20
  end

  enum HTTP_HEADER_ID : Int32
    HttpHeaderCacheControl = 0
    HttpHeaderConnection = 1
    HttpHeaderDate = 2
    HttpHeaderKeepAlive = 3
    HttpHeaderPragma = 4
    HttpHeaderTrailer = 5
    HttpHeaderTransferEncoding = 6
    HttpHeaderUpgrade = 7
    HttpHeaderVia = 8
    HttpHeaderWarning = 9
    HttpHeaderAllow = 10
    HttpHeaderContentLength = 11
    HttpHeaderContentType = 12
    HttpHeaderContentEncoding = 13
    HttpHeaderContentLanguage = 14
    HttpHeaderContentLocation = 15
    HttpHeaderContentMd5 = 16
    HttpHeaderContentRange = 17
    HttpHeaderExpires = 18
    HttpHeaderLastModified = 19
    HttpHeaderAccept = 20
    HttpHeaderAcceptCharset = 21
    HttpHeaderAcceptEncoding = 22
    HttpHeaderAcceptLanguage = 23
    HttpHeaderAuthorization = 24
    HttpHeaderCookie = 25
    HttpHeaderExpect = 26
    HttpHeaderFrom = 27
    HttpHeaderHost = 28
    HttpHeaderIfMatch = 29
    HttpHeaderIfModifiedSince = 30
    HttpHeaderIfNoneMatch = 31
    HttpHeaderIfRange = 32
    HttpHeaderIfUnmodifiedSince = 33
    HttpHeaderMaxForwards = 34
    HttpHeaderProxyAuthorization = 35
    HttpHeaderReferer = 36
    HttpHeaderRange = 37
    HttpHeaderTe = 38
    HttpHeaderTranslate = 39
    HttpHeaderUserAgent = 40
    HttpHeaderRequestMaximum = 41
    HttpHeaderAcceptRanges = 20
    HttpHeaderAge = 21
    HttpHeaderEtag = 22
    HttpHeaderLocation = 23
    HttpHeaderProxyAuthenticate = 24
    HttpHeaderRetryAfter = 25
    HttpHeaderServer = 26
    HttpHeaderSetCookie = 27
    HttpHeaderVary = 28
    HttpHeaderWwwAuthenticate = 29
    HttpHeaderResponseMaximum = 30
    HttpHeaderMaximum = 41
  end

  enum HTTP_LOG_DATA_TYPE : Int32
    HttpLogDataTypeFields = 0
  end

  enum HTTP_DATA_CHUNK_TYPE : Int32
    HttpDataChunkFromMemory = 0
    HttpDataChunkFromFileHandle = 1
    HttpDataChunkFromFragmentCache = 2
    HttpDataChunkFromFragmentCacheEx = 3
    HttpDataChunkTrailers = 4
    HttpDataChunkMaximum = 5
  end

  enum HTTP_DELEGATE_REQUEST_PROPERTY_ID : Int32
    DelegateRequestReservedProperty = 0
    DelegateRequestDelegateUrlProperty = 1
  end

  enum HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID : Int32
    CreateRequestQueueExternalIdProperty = 1
    CreateRequestQueueMax = 2
  end

  enum HTTP_AUTH_STATUS : Int32
    HttpAuthStatusSuccess = 0
    HttpAuthStatusNotAuthenticated = 1
    HttpAuthStatusFailure = 2
  end

  enum HTTP_REQUEST_AUTH_TYPE : Int32
    HttpRequestAuthTypeNone = 0
    HttpRequestAuthTypeBasic = 1
    HttpRequestAuthTypeDigest = 2
    HttpRequestAuthTypeNTLM = 3
    HttpRequestAuthTypeNegotiate = 4
    HttpRequestAuthTypeKerberos = 5
  end

  enum HTTP_REQUEST_SIZING_TYPE : Int32
    HttpRequestSizingTypeTlsHandshakeLeg1ClientData = 0
    HttpRequestSizingTypeTlsHandshakeLeg1ServerData = 1
    HttpRequestSizingTypeTlsHandshakeLeg2ClientData = 2
    HttpRequestSizingTypeTlsHandshakeLeg2ServerData = 3
    HttpRequestSizingTypeHeaders = 4
    HttpRequestSizingTypeMax = 5
  end

  enum HTTP_REQUEST_TIMING_TYPE : Int32
    HttpRequestTimingTypeConnectionStart = 0
    HttpRequestTimingTypeDataStart = 1
    HttpRequestTimingTypeTlsCertificateLoadStart = 2
    HttpRequestTimingTypeTlsCertificateLoadEnd = 3
    HttpRequestTimingTypeTlsHandshakeLeg1Start = 4
    HttpRequestTimingTypeTlsHandshakeLeg1End = 5
    HttpRequestTimingTypeTlsHandshakeLeg2Start = 6
    HttpRequestTimingTypeTlsHandshakeLeg2End = 7
    HttpRequestTimingTypeTlsAttributesQueryStart = 8
    HttpRequestTimingTypeTlsAttributesQueryEnd = 9
    HttpRequestTimingTypeTlsClientCertQueryStart = 10
    HttpRequestTimingTypeTlsClientCertQueryEnd = 11
    HttpRequestTimingTypeHttp2StreamStart = 12
    HttpRequestTimingTypeHttp2HeaderDecodeStart = 13
    HttpRequestTimingTypeHttp2HeaderDecodeEnd = 14
    HttpRequestTimingTypeRequestHeaderParseStart = 15
    HttpRequestTimingTypeRequestHeaderParseEnd = 16
    HttpRequestTimingTypeRequestRoutingStart = 17
    HttpRequestTimingTypeRequestRoutingEnd = 18
    HttpRequestTimingTypeRequestQueuedForInspection = 19
    HttpRequestTimingTypeRequestDeliveredForInspection = 20
    HttpRequestTimingTypeRequestReturnedAfterInspection = 21
    HttpRequestTimingTypeRequestQueuedForDelegation = 22
    HttpRequestTimingTypeRequestDeliveredForDelegation = 23
    HttpRequestTimingTypeRequestReturnedAfterDelegation = 24
    HttpRequestTimingTypeRequestQueuedForIO = 25
    HttpRequestTimingTypeRequestDeliveredForIO = 26
    HttpRequestTimingTypeHttp3StreamStart = 27
    HttpRequestTimingTypeHttp3HeaderDecodeStart = 28
    HttpRequestTimingTypeHttp3HeaderDecodeEnd = 29
    HttpRequestTimingTypeMax = 30
  end

  enum HTTP_REQUEST_INFO_TYPE : Int32
    HttpRequestInfoTypeAuth = 0
    HttpRequestInfoTypeChannelBind = 1
    HttpRequestInfoTypeSslProtocol = 2
    HttpRequestInfoTypeSslTokenBindingDraft = 3
    HttpRequestInfoTypeSslTokenBinding = 4
    HttpRequestInfoTypeRequestTiming = 5
    HttpRequestInfoTypeTcpInfoV0 = 6
    HttpRequestInfoTypeRequestSizing = 7
    HttpRequestInfoTypeQuicStats = 8
    HttpRequestInfoTypeTcpInfoV1 = 9
  end

  enum HTTP_RESPONSE_INFO_TYPE : Int32
    HttpResponseInfoTypeMultipleKnownHeaders = 0
    HttpResponseInfoTypeAuthenticationProperty = 1
    HttpResponseInfoTypeQoSProperty = 2
    HttpResponseInfoTypeChannelBind = 3
  end

  enum HTTP_CACHE_POLICY_TYPE : Int32
    HttpCachePolicyNocache = 0
    HttpCachePolicyUserInvalidates = 1
    HttpCachePolicyTimeToLive = 2
    HttpCachePolicyMaximum = 3
  end

  enum HTTP_SERVICE_CONFIG_ID : Int32
    HttpServiceConfigIPListenList = 0
    HttpServiceConfigSSLCertInfo = 1
    HttpServiceConfigUrlAclInfo = 2
    HttpServiceConfigTimeout = 3
    HttpServiceConfigCache = 4
    HttpServiceConfigSslSniCertInfo = 5
    HttpServiceConfigSslCcsCertInfo = 6
    HttpServiceConfigSetting = 7
    HttpServiceConfigSslCertInfoEx = 8
    HttpServiceConfigSslSniCertInfoEx = 9
    HttpServiceConfigSslCcsCertInfoEx = 10
    HttpServiceConfigSslScopedCcsCertInfo = 11
    HttpServiceConfigSslScopedCcsCertInfoEx = 12
    HttpServiceConfigMax = 13
  end

  enum HTTP_SERVICE_CONFIG_QUERY_TYPE : Int32
    HttpServiceConfigQueryExact = 0
    HttpServiceConfigQueryNext = 1
    HttpServiceConfigQueryMax = 2
  end

  enum HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE : Int32
    ExParamTypeHttp2Window = 0
    ExParamTypeHttp2SettingsLimits = 1
    ExParamTypeHttpPerformance = 2
    ExParamTypeTlsRestrictions = 3
    ExParamTypeErrorHeaders = 4
    ExParamTypeTlsSessionTicketKeys = 5
    ExParamTypeMax = 6
  end

  enum HTTP_PERFORMANCE_PARAM_TYPE : Int32
    PerformanceParamSendBufferingFlags = 0
    PerformanceParamAggressiveICW = 1
    PerformanceParamMaxSendBufferSize = 2
    PerformanceParamMaxConcurrentClientStreams = 3
    PerformanceParamMaxReceiveBufferSize = 4
    PerformanceParamDecryptOnSspiThread = 5
    PerformanceParamMax = 6
  end

  enum HTTP_SERVICE_CONFIG_CACHE_KEY : Int32
    MaxCacheResponseSize = 0
    CacheRangeChunkSize = 1
  end

  enum HTTP_REQUEST_PROPERTY : Int32
    HttpRequestPropertyIsb = 0
    HttpRequestPropertyTcpInfoV0 = 1
    HttpRequestPropertyQuicStats = 2
    HttpRequestPropertyTcpInfoV1 = 3
    HttpRequestPropertySni = 4
    HttpRequestPropertyStreamError = 5
    HttpRequestPropertyWskApiTimings = 6
    HttpRequestPropertyQuicApiTimings = 7
  end

  enum HTTP_FEATURE_ID : Int32
    HttpFeatureUnknown = 0
    HttpFeatureResponseTrailers = 1
    HttpFeatureApiTimings = 2
    HttpFeatureDelegateEx = 3
    HttpFeatureHttp3 = 4
    HttpFeaturemax = -1
  end

union HTTP_DATA_CHUNK_Anonymous_e__Union
  from_memory : HTTP_DATA_CHUNK_Anonymous_e__Union_FromMemory_e__Struct
  from_file_handle : HTTP_DATA_CHUNK_Anonymous_e__Union_FromFileHandle_e__Struct
  from_fragment_cache : HTTP_DATA_CHUNK_Anonymous_e__Union_FromFragmentCache_e__Struct
  from_fragment_cache_ex : HTTP_DATA_CHUNK_Anonymous_e__Union_FromFragmentCacheEx_e__Struct
  trailers : HTTP_DATA_CHUNK_Anonymous_e__Union_Trailers_e__Struct
end
union HTTP_SERVICE_CONFIG_SSL_PARAM_EX_Anonymous_e__Union
  http2_window_size_param : HTTP2_WINDOW_SIZE_PARAM
  http2_settings_limits_param : HTTP2_SETTINGS_LIMITS_PARAM
  http_performance_param : HTTP_PERFORMANCE_PARAM
  http_tls_restrictions_param : HTTP_TLS_RESTRICTIONS_PARAM
  http_error_headers_param : HTTP_ERROR_HEADERS_PARAM
  http_tls_session_ticket_keys_param : HTTP_TLS_SESSION_TICKET_KEYS_PARAM
end

  struct HTTP_PROPERTY_FLAGS
    _bitfield : UInt32
  end
  struct HTTP_STATE_INFO
    flags : HTTP_PROPERTY_FLAGS
    state : HTTP_ENABLED_STATE
  end
  struct HTTP_QOS_SETTING_INFO
    qos_type : HTTP_QOS_SETTING_TYPE
    qos_setting : Void*
  end
  struct HTTP_CONNECTION_LIMIT_INFO
    flags : HTTP_PROPERTY_FLAGS
    max_connections : UInt32
  end
  struct HTTP_BANDWIDTH_LIMIT_INFO
    flags : HTTP_PROPERTY_FLAGS
    max_bandwidth : UInt32
  end
  struct HTTP_FLOWRATE_INFO
    flags : HTTP_PROPERTY_FLAGS
    max_bandwidth : UInt32
    max_peak_bandwidth : UInt32
    burst_size : UInt32
  end
  struct HTTP_SERVICE_CONFIG_TIMEOUT_SET
    key_desc : HTTP_SERVICE_CONFIG_TIMEOUT_KEY
    param_desc : UInt16
  end
  struct HTTP_TIMEOUT_LIMIT_INFO
    flags : HTTP_PROPERTY_FLAGS
    entity_body : UInt16
    drain_entity_body : UInt16
    request_queue : UInt16
    idle_connection : UInt16
    header_wait : UInt16
    min_send_rate : UInt32
  end
  struct HTTP_SERVICE_CONFIG_SETTING_SET
    key_desc : HTTP_SERVICE_CONFIG_SETTING_KEY
    param_desc : UInt32
  end
  struct HTTP_LISTEN_ENDPOINT_INFO
    flags : HTTP_PROPERTY_FLAGS
    enable_sharing : BOOLEAN
  end
  struct HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS
    domain_name_length : UInt16
    domain_name : LibC::LPWSTR
    realm_length : UInt16
    realm : LibC::LPWSTR
  end
  struct HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS
    realm_length : UInt16
    realm : LibC::LPWSTR
  end
  struct HTTP_SERVER_AUTHENTICATION_INFO
    flags : HTTP_PROPERTY_FLAGS
    auth_schemes : UInt32
    receive_mutual_auth : BOOLEAN
    receive_context_handle : BOOLEAN
    disable_ntlm_credential_caching : BOOLEAN
    ex_flags : UInt8
    digest_params : HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS
    basic_params : HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS
  end
  struct HTTP_SERVICE_BINDING_BASE
    type : HTTP_SERVICE_BINDING_TYPE
  end
  struct HTTP_SERVICE_BINDING_A
    base : HTTP_SERVICE_BINDING_BASE
    buffer : PSTR
    buffer_size : UInt32
  end
  struct HTTP_SERVICE_BINDING_W
    base : HTTP_SERVICE_BINDING_BASE
    buffer : LibC::LPWSTR
    buffer_size : UInt32
  end
  struct HTTP_CHANNEL_BIND_INFO
    hardening : HTTP_AUTHENTICATION_HARDENING_LEVELS
    flags : UInt32
    service_names : HTTP_SERVICE_BINDING_BASE**
    number_of_service_names : UInt32
  end
  struct HTTP_REQUEST_CHANNEL_BIND_STATUS
    service_name : HTTP_SERVICE_BINDING_BASE*
    channel_token : UInt8*
    channel_token_size : UInt32
    flags : UInt32
  end
  struct HTTP_REQUEST_TOKEN_BINDING_INFO
    token_binding : UInt8*
    token_binding_size : UInt32
    ekm : UInt8*
    ekm_size : UInt32
    key_type : UInt8
  end
  struct HTTP_LOGGING_INFO
    flags : HTTP_PROPERTY_FLAGS
    logging_flags : UInt32
    software_name : LibC::LPWSTR
    software_name_length : UInt16
    directory_name_length : UInt16
    directory_name : LibC::LPWSTR
    format : HTTP_LOGGING_TYPE
    fields : UInt32
    p_ext_fields : Void*
    num_of_ext_fields : UInt16
    max_record_size : UInt16
    rollover_type : HTTP_LOGGING_ROLLOVER_TYPE
    rollover_size : UInt32
    p_security_descriptor : SECURITY_DESCRIPTOR*
  end
  struct HTTP_BINDING_INFO
    flags : HTTP_PROPERTY_FLAGS
    request_queue_handle : LibC::HANDLE
  end
  struct HTTP_PROTECTION_LEVEL_INFO
    flags : HTTP_PROPERTY_FLAGS
    level : HTTP_PROTECTION_LEVEL_TYPE
  end
  struct HTTP_BYTE_RANGE
    starting_offset : ULARGE_INTEGER
    length : ULARGE_INTEGER
  end
  struct HTTP_VERSION
    major_version : UInt16
    minor_version : UInt16
  end
  struct HTTP_KNOWN_HEADER
    raw_value_length : UInt16
    p_raw_value : PSTR
  end
  struct HTTP_UNKNOWN_HEADER
    name_length : UInt16
    raw_value_length : UInt16
    p_name : PSTR
    p_raw_value : PSTR
  end
  struct HTTP_LOG_DATA
    type : HTTP_LOG_DATA_TYPE
  end
  struct HTTP_LOG_FIELDS_DATA
    base : HTTP_LOG_DATA
    user_name_length : UInt16
    uri_stem_length : UInt16
    client_ip_length : UInt16
    server_name_length : UInt16
    service_name_length : UInt16
    server_ip_length : UInt16
    method_length : UInt16
    uri_query_length : UInt16
    host_length : UInt16
    user_agent_length : UInt16
    cookie_length : UInt16
    referrer_length : UInt16
    user_name : LibC::LPWSTR
    uri_stem : LibC::LPWSTR
    client_ip : PSTR
    server_name : PSTR
    service_name : PSTR
    server_ip : PSTR
    method : PSTR
    uri_query : PSTR
    host : PSTR
    user_agent : PSTR
    cookie : PSTR
    referrer : PSTR
    server_port : UInt16
    protocol_status : UInt16
    win32_status : UInt32
    method_num : HTTP_VERB
    sub_status : UInt16
  end
  struct HTTP_DATA_CHUNK
    data_chunk_type : HTTP_DATA_CHUNK_TYPE
    anonymous : HTTP_DATA_CHUNK_Anonymous_e__Union
  end
  struct HTTP_DATA_CHUNK_Anonymous_e__Union_FromFragmentCacheEx_e__Struct
    byte_range : HTTP_BYTE_RANGE
    p_fragment_name : LibC::LPWSTR
  end
  struct HTTP_DATA_CHUNK_Anonymous_e__Union_FromFileHandle_e__Struct
    byte_range : HTTP_BYTE_RANGE
    file_handle : LibC::HANDLE
  end
  struct HTTP_DATA_CHUNK_Anonymous_e__Union_FromFragmentCache_e__Struct
    fragment_name_length : UInt16
    p_fragment_name : LibC::LPWSTR
  end
  struct HTTP_DATA_CHUNK_Anonymous_e__Union_FromMemory_e__Struct
    p_buffer : Void*
    buffer_length : UInt32
  end
  struct HTTP_DATA_CHUNK_Anonymous_e__Union_Trailers_e__Struct
    trailer_count : UInt16
    p_trailers : HTTP_UNKNOWN_HEADER*
  end
  struct HTTP_REQUEST_HEADERS
    unknown_header_count : UInt16
    p_unknown_headers : HTTP_UNKNOWN_HEADER*
    trailer_count : UInt16
    p_trailers : HTTP_UNKNOWN_HEADER*
    known_headers : HTTP_KNOWN_HEADER[41]*
  end
  struct HTTP_RESPONSE_HEADERS
    unknown_header_count : UInt16
    p_unknown_headers : HTTP_UNKNOWN_HEADER*
    trailer_count : UInt16
    p_trailers : HTTP_UNKNOWN_HEADER*
    known_headers : HTTP_KNOWN_HEADER[30]*
  end
  struct HTTP_DELEGATE_REQUEST_PROPERTY_INFO
    property_id : HTTP_DELEGATE_REQUEST_PROPERTY_ID
    property_info_length : UInt32
    property_info : Void*
  end
  struct HTTP_CREATE_REQUEST_QUEUE_PROPERTY_INFO
    property_id : HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID
    property_info_length : UInt32
    property_info : Void*
  end
  struct HTTP_TRANSPORT_ADDRESS
    p_remote_address : SOCKADDR*
    p_local_address : SOCKADDR*
  end
  struct HTTP_COOKED_URL
    full_url_length : UInt16
    host_length : UInt16
    abs_path_length : UInt16
    query_string_length : UInt16
    p_full_url : LibC::LPWSTR
    p_host : LibC::LPWSTR
    p_abs_path : LibC::LPWSTR
    p_query_string : LibC::LPWSTR
  end
  struct HTTP_SSL_CLIENT_CERT_INFO
    cert_flags : UInt32
    cert_encoded_size : UInt32
    p_cert_encoded : UInt8*
    token : LibC::HANDLE
    cert_denied_by_mapper : BOOLEAN
  end
  struct HTTP_SSL_INFO
    server_cert_key_size : UInt16
    connection_key_size : UInt16
    server_cert_issuer_size : UInt32
    server_cert_subject_size : UInt32
    p_server_cert_issuer : PSTR
    p_server_cert_subject : PSTR
    p_client_cert_info : HTTP_SSL_CLIENT_CERT_INFO*
    ssl_client_cert_negotiated : UInt32
  end
  struct HTTP_SSL_PROTOCOL_INFO
    protocol : UInt32
    cipher_type : UInt32
    cipher_strength : UInt32
    hash_type : UInt32
    hash_strength : UInt32
    key_exchange_type : UInt32
    key_exchange_strength : UInt32
  end
  struct HTTP_REQUEST_SIZING_INFO
    flags : UInt64
    request_index : UInt32
    request_sizing_count : UInt32
    request_sizing : UInt64[5]*
  end
  struct HTTP_REQUEST_TIMING_INFO
    request_timing_count : UInt32
    request_timing : UInt64[30]*
  end
  struct HTTP_REQUEST_INFO
    info_type : HTTP_REQUEST_INFO_TYPE
    info_length : UInt32
    p_info : Void*
  end
  struct HTTP_REQUEST_AUTH_INFO
    auth_status : HTTP_AUTH_STATUS
    sec_status : Int32
    flags : UInt32
    auth_type : HTTP_REQUEST_AUTH_TYPE
    access_token : LibC::HANDLE
    context_attributes : UInt32
    packed_context_length : UInt32
    packed_context_type : UInt32
    packed_context : Void*
    mutual_auth_data_length : UInt32
    p_mutual_auth_data : PSTR
    package_name_length : UInt16
    p_package_name : LibC::LPWSTR
  end
  struct HTTP_REQUEST_V1
    flags : UInt32
    connection_id : UInt64
    request_id : UInt64
    url_context : UInt64
    version : HTTP_VERSION
    verb : HTTP_VERB
    unknown_verb_length : UInt16
    raw_url_length : UInt16
    p_unknown_verb : PSTR
    p_raw_url : PSTR
    cooked_url : HTTP_COOKED_URL
    address : HTTP_TRANSPORT_ADDRESS
    headers : HTTP_REQUEST_HEADERS
    bytes_received : UInt64
    entity_chunk_count : UInt16
    p_entity_chunks : HTTP_DATA_CHUNK*
    raw_connection_id : UInt64
    p_ssl_info : HTTP_SSL_INFO*
  end
  struct HTTP_REQUEST_V2
    __anonymous_base_http_l1861_c35 : HTTP_REQUEST_V1
    request_info_count : UInt16
    p_request_info : HTTP_REQUEST_INFO*
  end
  struct HTTP_RESPONSE_V1
    flags : UInt32
    version : HTTP_VERSION
    status_code : UInt16
    reason_length : UInt16
    p_reason : PSTR
    headers : HTTP_RESPONSE_HEADERS
    entity_chunk_count : UInt16
    p_entity_chunks : HTTP_DATA_CHUNK*
  end
  struct HTTP_RESPONSE_INFO
    type : HTTP_RESPONSE_INFO_TYPE
    length : UInt32
    p_info : Void*
  end
  struct HTTP_MULTIPLE_KNOWN_HEADERS
    header_id : HTTP_HEADER_ID
    flags : UInt32
    known_header_count : UInt16
    known_headers : HTTP_KNOWN_HEADER*
  end
  struct HTTP_RESPONSE_V2
    __anonymous_base_http_l2050_c36 : HTTP_RESPONSE_V1
    response_info_count : UInt16
    p_response_info : HTTP_RESPONSE_INFO*
  end
  struct HTTPAPI_VERSION
    http_api_major_version : UInt16
    http_api_minor_version : UInt16
  end
  struct HTTP_CACHE_POLICY
    policy : HTTP_CACHE_POLICY_TYPE
    seconds_to_live : UInt32
  end
  struct HTTP_SERVICE_CONFIG_SSL_KEY
    p_ip_port : SOCKADDR*
  end
  struct HTTP_SERVICE_CONFIG_SSL_KEY_EX
    ip_port : SOCKADDR_STORAGE
  end
  struct HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    ip_port : SOCKADDR_STORAGE
    host : LibC::LPWSTR
  end
  struct HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    local_address : SOCKADDR_STORAGE
  end
  struct HTTP_SERVICE_CONFIG_SSL_PARAM
    ssl_hash_length : UInt32
    p_ssl_hash : Void*
    app_id : Guid
    p_ssl_cert_store_name : LibC::LPWSTR
    default_cert_check_mode : UInt32
    default_revocation_freshness_time : UInt32
    default_revocation_url_retrieval_timeout : UInt32
    p_default_ssl_ctl_identifier : LibC::LPWSTR
    p_default_ssl_ctl_store_name : LibC::LPWSTR
    default_flags : UInt32
  end
  struct HTTP2_WINDOW_SIZE_PARAM
    http2_receive_window_size : UInt32
  end
  struct HTTP2_SETTINGS_LIMITS_PARAM
    http2_max_settings_per_frame : UInt32
    http2_max_settings_per_minute : UInt32
  end
  struct HTTP_PERFORMANCE_PARAM
    type : HTTP_PERFORMANCE_PARAM_TYPE
    buffer_size : UInt32
    buffer : Void*
  end
  struct HTTP_TLS_RESTRICTIONS_PARAM
    restriction_count : UInt32
    tls_restrictions : Void*
  end
  struct HTTP_ERROR_HEADERS_PARAM
    status_code : UInt16
    header_count : UInt16
    headers : HTTP_UNKNOWN_HEADER*
  end
  struct HTTP_TLS_SESSION_TICKET_KEYS_PARAM
    session_ticket_key_count : UInt32
    session_ticket_keys : Void*
  end
  struct HTTP_SERVICE_CONFIG_SSL_PARAM_EX
    param_type : HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
    flags : UInt64
    anonymous : HTTP_SERVICE_CONFIG_SSL_PARAM_EX_Anonymous_e__Union
  end
  struct HTTP_SERVICE_CONFIG_SSL_SET
    key_desc : HTTP_SERVICE_CONFIG_SSL_KEY
    param_desc : HTTP_SERVICE_CONFIG_SSL_PARAM
  end
  struct HTTP_SERVICE_CONFIG_SSL_SNI_SET
    key_desc : HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    param_desc : HTTP_SERVICE_CONFIG_SSL_PARAM
  end
  struct HTTP_SERVICE_CONFIG_SSL_CCS_SET
    key_desc : HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    param_desc : HTTP_SERVICE_CONFIG_SSL_PARAM
  end
  struct HTTP_SERVICE_CONFIG_SSL_SET_EX
    key_desc : HTTP_SERVICE_CONFIG_SSL_KEY_EX
    param_desc : HTTP_SERVICE_CONFIG_SSL_PARAM_EX
  end
  struct HTTP_SERVICE_CONFIG_SSL_SNI_SET_EX
    key_desc : HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    param_desc : HTTP_SERVICE_CONFIG_SSL_PARAM_EX
  end
  struct HTTP_SERVICE_CONFIG_SSL_CCS_SET_EX
    key_desc : HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    param_desc : HTTP_SERVICE_CONFIG_SSL_PARAM_EX
  end
  struct HTTP_SERVICE_CONFIG_SSL_QUERY
    query_desc : HTTP_SERVICE_CONFIG_QUERY_TYPE
    key_desc : HTTP_SERVICE_CONFIG_SSL_KEY
    dw_token : UInt32
  end
  struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY
    query_desc : HTTP_SERVICE_CONFIG_QUERY_TYPE
    key_desc : HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    dw_token : UInt32
  end
  struct HTTP_SERVICE_CONFIG_SSL_CCS_QUERY
    query_desc : HTTP_SERVICE_CONFIG_QUERY_TYPE
    key_desc : HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    dw_token : UInt32
  end
  struct HTTP_SERVICE_CONFIG_SSL_QUERY_EX
    query_desc : HTTP_SERVICE_CONFIG_QUERY_TYPE
    key_desc : HTTP_SERVICE_CONFIG_SSL_KEY_EX
    dw_token : UInt32
    param_type : HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
  end
  struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY_EX
    query_desc : HTTP_SERVICE_CONFIG_QUERY_TYPE
    key_desc : HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    dw_token : UInt32
    param_type : HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
  end
  struct HTTP_SERVICE_CONFIG_SSL_CCS_QUERY_EX
    query_desc : HTTP_SERVICE_CONFIG_QUERY_TYPE
    key_desc : HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    dw_token : UInt32
    param_type : HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
  end
  struct HTTP_SERVICE_CONFIG_IP_LISTEN_PARAM
    addr_length : UInt16
    p_address : SOCKADDR*
  end
  struct HTTP_SERVICE_CONFIG_IP_LISTEN_QUERY
    addr_count : UInt32
    addr_list : SOCKADDR_STORAGE[0]*
  end
  struct HTTP_SERVICE_CONFIG_URLACL_KEY
    p_url_prefix : LibC::LPWSTR
  end
  struct HTTP_SERVICE_CONFIG_URLACL_PARAM
    p_string_security_descriptor : LibC::LPWSTR
  end
  struct HTTP_SERVICE_CONFIG_URLACL_SET
    key_desc : HTTP_SERVICE_CONFIG_URLACL_KEY
    param_desc : HTTP_SERVICE_CONFIG_URLACL_PARAM
  end
  struct HTTP_SERVICE_CONFIG_URLACL_QUERY
    query_desc : HTTP_SERVICE_CONFIG_QUERY_TYPE
    key_desc : HTTP_SERVICE_CONFIG_URLACL_KEY
    dw_token : UInt32
  end
  struct HTTP_SERVICE_CONFIG_CACHE_SET
    key_desc : HTTP_SERVICE_CONFIG_CACHE_KEY
    param_desc : UInt32
  end
  struct HTTP_QUERY_REQUEST_QUALIFIER_TCP
    freshness : UInt64
  end
  struct HTTP_QUERY_REQUEST_QUALIFIER_QUIC
    freshness : UInt64
  end
  struct HTTP_REQUEST_PROPERTY_SNI
    hostname : Char[256]*
    flags : UInt32
  end
  struct HTTP_REQUEST_PROPERTY_STREAM_ERROR
    error_code : UInt32
  end
  struct HTTP_WSK_API_TIMINGS
    connect_count : UInt64
    connect_sum : UInt64
    disconnect_count : UInt64
    disconnect_sum : UInt64
    send_count : UInt64
    send_sum : UInt64
    receive_count : UInt64
    receive_sum : UInt64
    release_count : UInt64
    release_sum : UInt64
    control_socket_count : UInt64
    control_socket_sum : UInt64
  end
  struct HTTP_QUIC_STREAM_API_TIMINGS
    open_count : UInt64
    open_sum : UInt64
    close_count : UInt64
    close_sum : UInt64
    start_count : UInt64
    start_sum : UInt64
    shutdown_count : UInt64
    shutdown_sum : UInt64
    send_count : UInt64
    send_sum : UInt64
    receive_set_enabled_count : UInt64
    receive_set_enabled_sum : UInt64
    get_param_count : UInt64
    get_param_sum : UInt64
    set_param_count : UInt64
    set_param_sum : UInt64
    set_callback_handler_count : UInt64
    set_callback_handler_sum : UInt64
  end
  struct HTTP_QUIC_CONNECTION_API_TIMINGS
    open_time : UInt64
    close_time : UInt64
    start_time : UInt64
    shutdown_time : UInt64
    sec_config_create_time : UInt64
    sec_config_delete_time : UInt64
    get_param_count : UInt64
    get_param_sum : UInt64
    set_param_count : UInt64
    set_param_sum : UInt64
    set_callback_handler_count : UInt64
    set_callback_handler_sum : UInt64
    control_stream_timings : HTTP_QUIC_STREAM_API_TIMINGS
  end
  struct HTTP_QUIC_API_TIMINGS
    connection_timings : HTTP_QUIC_CONNECTION_API_TIMINGS
    stream_timings : HTTP_QUIC_STREAM_API_TIMINGS
  end


  # Params # version : HTTPAPI_VERSION [In],flags : HTTP_INITIALIZE [In],preserved : Void* [In]
  fun HttpInitialize(version : HTTPAPI_VERSION, flags : HTTP_INITIALIZE, preserved : Void*) : UInt32

  # Params # flags : HTTP_INITIALIZE [In],preserved : Void* [In]
  fun HttpTerminate(flags : HTTP_INITIALIZE, preserved : Void*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE* [In],reserved : UInt32 [In]
  fun HttpCreateHttpHandle(requestqueuehandle : LibC::HANDLE*, reserved : UInt32) : UInt32

  # Params # version : HTTPAPI_VERSION [In],name : LibC::LPWSTR [In],securityattributes : SECURITY_ATTRIBUTES* [In],flags : UInt32 [In],requestqueuehandle : LibC::HANDLE* [In]
  fun HttpCreateRequestQueue(version : HTTPAPI_VERSION, name : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flags : UInt32, requestqueuehandle : LibC::HANDLE*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In]
  fun HttpCloseRequestQueue(requestqueuehandle : LibC::HANDLE) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],property : HTTP_SERVER_PROPERTY [In],propertyinformation : Void* [In],propertyinformationlength : UInt32 [In],reserved1 : UInt32 [In],reserved2 : Void* [In]
  fun HttpSetRequestQueueProperty(requestqueuehandle : LibC::HANDLE, property : HTTP_SERVER_PROPERTY, propertyinformation : Void*, propertyinformationlength : UInt32, reserved1 : UInt32, reserved2 : Void*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],property : HTTP_SERVER_PROPERTY [In],propertyinformation : Void* [In],propertyinformationlength : UInt32 [In],reserved1 : UInt32 [In],returnlength : UInt32* [In],reserved2 : Void* [In]
  fun HttpQueryRequestQueueProperty(requestqueuehandle : LibC::HANDLE, property : HTTP_SERVER_PROPERTY, propertyinformation : Void*, propertyinformationlength : UInt32, reserved1 : UInt32, returnlength : UInt32*, reserved2 : Void*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],id : UInt64 [In],propertyid : HTTP_REQUEST_PROPERTY [In],input : Void* [In],inputpropertysize : UInt32 [In],overlapped : OVERLAPPED* [In]
  fun HttpSetRequestProperty(requestqueuehandle : LibC::HANDLE, id : UInt64, propertyid : HTTP_REQUEST_PROPERTY, input : Void*, inputpropertysize : UInt32, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In]
  fun HttpShutdownRequestQueue(requestqueuehandle : LibC::HANDLE) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],connectionid : UInt64 [In],flags : UInt32 [In],sslclientcertinfo : HTTP_SSL_CLIENT_CERT_INFO* [In],sslclientcertinfosize : UInt32 [In],bytesreceived : UInt32* [In],overlapped : OVERLAPPED* [In]
  fun HttpReceiveClientCertificate(requestqueuehandle : LibC::HANDLE, connectionid : UInt64, flags : UInt32, sslclientcertinfo : HTTP_SSL_CLIENT_CERT_INFO*, sslclientcertinfosize : UInt32, bytesreceived : UInt32*, overlapped : OVERLAPPED*) : UInt32

  # Params # version : HTTPAPI_VERSION [In],serversessionid : UInt64* [In],reserved : UInt32 [In]
  fun HttpCreateServerSession(version : HTTPAPI_VERSION, serversessionid : UInt64*, reserved : UInt32) : UInt32

  # Params # serversessionid : UInt64 [In]
  fun HttpCloseServerSession(serversessionid : UInt64) : UInt32

  # Params # serversessionid : UInt64 [In],property : HTTP_SERVER_PROPERTY [In],propertyinformation : Void* [In],propertyinformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun HttpQueryServerSessionProperty(serversessionid : UInt64, property : HTTP_SERVER_PROPERTY, propertyinformation : Void*, propertyinformationlength : UInt32, returnlength : UInt32*) : UInt32

  # Params # serversessionid : UInt64 [In],property : HTTP_SERVER_PROPERTY [In],propertyinformation : Void* [In],propertyinformationlength : UInt32 [In]
  fun HttpSetServerSessionProperty(serversessionid : UInt64, property : HTTP_SERVER_PROPERTY, propertyinformation : Void*, propertyinformationlength : UInt32) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],fullyqualifiedurl : LibC::LPWSTR [In],reserved : Void* [In]
  fun HttpAddUrl(requestqueuehandle : LibC::HANDLE, fullyqualifiedurl : LibC::LPWSTR, reserved : Void*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],fullyqualifiedurl : LibC::LPWSTR [In]
  fun HttpRemoveUrl(requestqueuehandle : LibC::HANDLE, fullyqualifiedurl : LibC::LPWSTR) : UInt32

  # Params # serversessionid : UInt64 [In],purlgroupid : UInt64* [In],reserved : UInt32 [In]
  fun HttpCreateUrlGroup(serversessionid : UInt64, purlgroupid : UInt64*, reserved : UInt32) : UInt32

  # Params # urlgroupid : UInt64 [In]
  fun HttpCloseUrlGroup(urlgroupid : UInt64) : UInt32

  # Params # urlgroupid : UInt64 [In],pfullyqualifiedurl : LibC::LPWSTR [In],urlcontext : UInt64 [In],reserved : UInt32 [In]
  fun HttpAddUrlToUrlGroup(urlgroupid : UInt64, pfullyqualifiedurl : LibC::LPWSTR, urlcontext : UInt64, reserved : UInt32) : UInt32

  # Params # urlgroupid : UInt64 [In],pfullyqualifiedurl : LibC::LPWSTR [In],flags : UInt32 [In]
  fun HttpRemoveUrlFromUrlGroup(urlgroupid : UInt64, pfullyqualifiedurl : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # urlgroupid : UInt64 [In],property : HTTP_SERVER_PROPERTY [In],propertyinformation : Void* [In],propertyinformationlength : UInt32 [In]
  fun HttpSetUrlGroupProperty(urlgroupid : UInt64, property : HTTP_SERVER_PROPERTY, propertyinformation : Void*, propertyinformationlength : UInt32) : UInt32

  # Params # urlgroupid : UInt64 [In],property : HTTP_SERVER_PROPERTY [In],propertyinformation : Void* [In],propertyinformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun HttpQueryUrlGroupProperty(urlgroupid : UInt64, property : HTTP_SERVER_PROPERTY, propertyinformation : Void*, propertyinformationlength : UInt32, returnlength : UInt32*) : UInt32

  # Params # reserved : Void* [In],flags : UInt32 [In],url : LibC::LPWSTR [In],preparedurl : LibC::LPWSTR* [In]
  fun HttpPrepareUrl(reserved : Void*, flags : UInt32, url : LibC::LPWSTR, preparedurl : LibC::LPWSTR*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],requestid : UInt64 [In],flags : HTTP_RECEIVE_HTTP_REQUEST_FLAGS [In],requestbuffer : HTTP_REQUEST_V2* [In],requestbufferlength : UInt32 [In],bytesreturned : UInt32* [In],overlapped : OVERLAPPED* [In]
  fun HttpReceiveHttpRequest(requestqueuehandle : LibC::HANDLE, requestid : UInt64, flags : HTTP_RECEIVE_HTTP_REQUEST_FLAGS, requestbuffer : HTTP_REQUEST_V2*, requestbufferlength : UInt32, bytesreturned : UInt32*, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],requestid : UInt64 [In],flags : UInt32 [In],entitybuffer : Void* [In],entitybufferlength : UInt32 [In],bytesreturned : UInt32* [In],overlapped : OVERLAPPED* [In]
  fun HttpReceiveRequestEntityBody(requestqueuehandle : LibC::HANDLE, requestid : UInt64, flags : UInt32, entitybuffer : Void*, entitybufferlength : UInt32, bytesreturned : UInt32*, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],requestid : UInt64 [In],flags : UInt32 [In],httpresponse : HTTP_RESPONSE_V2* [In],cachepolicy : HTTP_CACHE_POLICY* [In],bytessent : UInt32* [In],reserved1 : Void* [In],reserved2 : UInt32 [In],overlapped : OVERLAPPED* [In],logdata : HTTP_LOG_DATA* [In]
  fun HttpSendHttpResponse(requestqueuehandle : LibC::HANDLE, requestid : UInt64, flags : UInt32, httpresponse : HTTP_RESPONSE_V2*, cachepolicy : HTTP_CACHE_POLICY*, bytessent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : OVERLAPPED*, logdata : HTTP_LOG_DATA*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],requestid : UInt64 [In],flags : UInt32 [In],entitychunkcount : UInt16 [In],entitychunks : HTTP_DATA_CHUNK* [In],bytessent : UInt32* [In],reserved1 : Void* [In],reserved2 : UInt32 [In],overlapped : OVERLAPPED* [In],logdata : HTTP_LOG_DATA* [In]
  fun HttpSendResponseEntityBody(requestqueuehandle : LibC::HANDLE, requestid : UInt64, flags : UInt32, entitychunkcount : UInt16, entitychunks : HTTP_DATA_CHUNK*, bytessent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : OVERLAPPED*, logdata : HTTP_LOG_DATA*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],requestid : UInt64 [In],verb : HTTP_VERB [In],path : LibC::LPWSTR [In],query : PSTR [In],headers : HTTP_REQUEST_HEADERS* [In]
  fun HttpDeclarePush(requestqueuehandle : LibC::HANDLE, requestid : UInt64, verb : HTTP_VERB, path : LibC::LPWSTR, query : PSTR, headers : HTTP_REQUEST_HEADERS*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],connectionid : UInt64 [In],overlapped : OVERLAPPED* [In]
  fun HttpWaitForDisconnect(requestqueuehandle : LibC::HANDLE, connectionid : UInt64, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],connectionid : UInt64 [In],reserved : UInt32 [In],overlapped : OVERLAPPED* [In]
  fun HttpWaitForDisconnectEx(requestqueuehandle : LibC::HANDLE, connectionid : UInt64, reserved : UInt32, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],requestid : UInt64 [In],overlapped : OVERLAPPED* [In]
  fun HttpCancelHttpRequest(requestqueuehandle : LibC::HANDLE, requestid : UInt64, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],overlapped : OVERLAPPED* [In]
  fun HttpWaitForDemandStart(requestqueuehandle : LibC::HANDLE, overlapped : OVERLAPPED*) : UInt32

  # Params # featureid : HTTP_FEATURE_ID [In]
  fun HttpIsFeatureSupported(featureid : HTTP_FEATURE_ID) : LibC::BOOL

  # Params # requestqueuehandle : LibC::HANDLE [In],delegatequeuehandle : LibC::HANDLE [In],requestid : UInt64 [In],delegateurlgroupid : UInt64 [In],propertyinfosetsize : UInt32 [In],propertyinfoset : HTTP_DELEGATE_REQUEST_PROPERTY_INFO* [In]
  fun HttpDelegateRequestEx(requestqueuehandle : LibC::HANDLE, delegatequeuehandle : LibC::HANDLE, requestid : UInt64, delegateurlgroupid : UInt64, propertyinfosetsize : UInt32, propertyinfoset : HTTP_DELEGATE_REQUEST_PROPERTY_INFO*) : UInt32

  # Params # fullyqualifiedurl : LibC::LPWSTR [In],requestqueuehandle : LibC::HANDLE [In],urlgroupid : UInt64* [In]
  fun HttpFindUrlGroupId(fullyqualifiedurl : LibC::LPWSTR, requestqueuehandle : LibC::HANDLE, urlgroupid : UInt64*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],urlprefix : LibC::LPWSTR [In],flags : UInt32 [In],overlapped : OVERLAPPED* [In]
  fun HttpFlushResponseCache(requestqueuehandle : LibC::HANDLE, urlprefix : LibC::LPWSTR, flags : UInt32, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],urlprefix : LibC::LPWSTR [In],datachunk : HTTP_DATA_CHUNK* [In],cachepolicy : HTTP_CACHE_POLICY* [In],overlapped : OVERLAPPED* [In]
  fun HttpAddFragmentToCache(requestqueuehandle : LibC::HANDLE, urlprefix : LibC::LPWSTR, datachunk : HTTP_DATA_CHUNK*, cachepolicy : HTTP_CACHE_POLICY*, overlapped : OVERLAPPED*) : UInt32

  # Params # requestqueuehandle : LibC::HANDLE [In],urlprefix : LibC::LPWSTR [In],byterange : HTTP_BYTE_RANGE* [In],buffer : Void* [In],bufferlength : UInt32 [In],bytesread : UInt32* [In],overlapped : OVERLAPPED* [In]
  fun HttpReadFragmentFromCache(requestqueuehandle : LibC::HANDLE, urlprefix : LibC::LPWSTR, byterange : HTTP_BYTE_RANGE*, buffer : Void*, bufferlength : UInt32, bytesread : UInt32*, overlapped : OVERLAPPED*) : UInt32

  # Params # servicehandle : LibC::HANDLE [In],configid : HTTP_SERVICE_CONFIG_ID [In],pconfiginformation : Void* [In],configinformationlength : UInt32 [In],poverlapped : OVERLAPPED* [In]
  fun HttpSetServiceConfiguration(servicehandle : LibC::HANDLE, configid : HTTP_SERVICE_CONFIG_ID, pconfiginformation : Void*, configinformationlength : UInt32, poverlapped : OVERLAPPED*) : UInt32

  # Params # handle : LibC::HANDLE [In],configid : HTTP_SERVICE_CONFIG_ID [In],configinfo : Void* [In],configinfolength : UInt32 [In],overlapped : OVERLAPPED* [In]
  fun HttpUpdateServiceConfiguration(handle : LibC::HANDLE, configid : HTTP_SERVICE_CONFIG_ID, configinfo : Void*, configinfolength : UInt32, overlapped : OVERLAPPED*) : UInt32

  # Params # servicehandle : LibC::HANDLE [In],configid : HTTP_SERVICE_CONFIG_ID [In],pconfiginformation : Void* [In],configinformationlength : UInt32 [In],poverlapped : OVERLAPPED* [In]
  fun HttpDeleteServiceConfiguration(servicehandle : LibC::HANDLE, configid : HTTP_SERVICE_CONFIG_ID, pconfiginformation : Void*, configinformationlength : UInt32, poverlapped : OVERLAPPED*) : UInt32

  # Params # servicehandle : LibC::HANDLE [In],configid : HTTP_SERVICE_CONFIG_ID [In],pinput : Void* [In],inputlength : UInt32 [In],poutput : Void* [In],outputlength : UInt32 [In],preturnlength : UInt32* [In],poverlapped : OVERLAPPED* [In]
  fun HttpQueryServiceConfiguration(servicehandle : LibC::HANDLE, configid : HTTP_SERVICE_CONFIG_ID, pinput : Void*, inputlength : UInt32, poutput : Void*, outputlength : UInt32, preturnlength : UInt32*, poverlapped : OVERLAPPED*) : UInt32

  # Params # version : HTTPAPI_VERSION [In],extension : UInt32 [In],buffer : Void* [In],buffersize : UInt32 [In]
  fun HttpGetExtension(version : HTTPAPI_VERSION, extension : UInt32, buffer : Void*, buffersize : UInt32) : UInt32
end
