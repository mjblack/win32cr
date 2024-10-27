require "./../foundation.cr"
require "./../security.cr"
require "./win_sock.cr"
require "./../system/io.cr"

module Win32cr::Networking::HttpServer
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
  HTTP_VERSION_ = "HTTP/1.0"

  enum HTTP_RECEIVE_HTTP_REQUEST_FLAGS : UInt32
    HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY = 1_u32
    HTTP_RECEIVE_REQUEST_FLAG_FLUSH_BODY = 2_u32
  end
  @[Flags]
  enum HTTP_INITIALIZE : UInt32
    HTTP_INITIALIZE_CONFIG = 2_u32
    HTTP_INITIALIZE_SERVER = 1_u32
  end
  enum HTTP_SERVER_PROPERTY
    HttpServerAuthenticationProperty = 0_i32
    HttpServerLoggingProperty = 1_i32
    HttpServerQosProperty = 2_i32
    HttpServerTimeoutsProperty = 3_i32
    HttpServerQueueLengthProperty = 4_i32
    HttpServerStateProperty = 5_i32
    HttpServer503VerbosityProperty = 6_i32
    HttpServerBindingProperty = 7_i32
    HttpServerExtendedAuthenticationProperty = 8_i32
    HttpServerListenEndpointProperty = 9_i32
    HttpServerChannelBindProperty = 10_i32
    HttpServerProtectionLevelProperty = 11_i32
    HttpServerDelegationProperty = 16_i32
  end
  enum HTTP_ENABLED_STATE
    HttpEnabledStateActive = 0_i32
    HttpEnabledStateInactive = 1_i32
  end
  enum HTTP_503_RESPONSE_VERBOSITY
    Http503ResponseVerbosityBasic = 0_i32
    Http503ResponseVerbosityLimited = 1_i32
    Http503ResponseVerbosityFull = 2_i32
  end
  enum HTTP_QOS_SETTING_TYPE
    HttpQosSettingTypeBandwidth = 0_i32
    HttpQosSettingTypeConnectionLimit = 1_i32
    HttpQosSettingTypeFlowRate = 2_i32
  end
  enum HTTP_SERVICE_CONFIG_TIMEOUT_KEY
    IdleConnectionTimeout = 0_i32
    HeaderWaitTimeout = 1_i32
  end
  enum HTTP_SERVICE_CONFIG_SETTING_KEY
    HttpNone = 0_i32
    HttpTlsThrottle = 1_i32
  end
  enum HTTP_SERVICE_BINDING_TYPE
    HttpServiceBindingTypeNone = 0_i32
    HttpServiceBindingTypeW = 1_i32
    HttpServiceBindingTypeA = 2_i32
  end
  enum HTTP_AUTHENTICATION_HARDENING_LEVELS
    HttpAuthenticationHardeningLegacy = 0_i32
    HttpAuthenticationHardeningMedium = 1_i32
    HttpAuthenticationHardeningStrict = 2_i32
  end
  enum HTTP_LOGGING_TYPE
    HttpLoggingTypeW3C = 0_i32
    HttpLoggingTypeIIS = 1_i32
    HttpLoggingTypeNCSA = 2_i32
    HttpLoggingTypeRaw = 3_i32
  end
  enum HTTP_LOGGING_ROLLOVER_TYPE
    HttpLoggingRolloverSize = 0_i32
    HttpLoggingRolloverDaily = 1_i32
    HttpLoggingRolloverWeekly = 2_i32
    HttpLoggingRolloverMonthly = 3_i32
    HttpLoggingRolloverHourly = 4_i32
  end
  enum HTTP_PROTECTION_LEVEL_TYPE
    HttpProtectionLevelUnrestricted = 0_i32
    HttpProtectionLevelEdgeRestricted = 1_i32
    HttpProtectionLevelRestricted = 2_i32
  end
  enum HTTP_SCHEME
    HttpSchemeHttp = 0_i32
    HttpSchemeHttps = 1_i32
    HttpSchemeMaximum = 2_i32
  end
  enum HTTP_VERB
    HttpVerbUnparsed = 0_i32
    HttpVerbUnknown = 1_i32
    HttpVerbInvalid = 2_i32
    HttpVerbOPTIONS = 3_i32
    HttpVerbGET = 4_i32
    HttpVerbHEAD = 5_i32
    HttpVerbPOST = 6_i32
    HttpVerbPUT = 7_i32
    HttpVerbDELETE = 8_i32
    HttpVerbTRACE = 9_i32
    HttpVerbCONNECT = 10_i32
    HttpVerbTRACK = 11_i32
    HttpVerbMOVE = 12_i32
    HttpVerbCOPY = 13_i32
    HttpVerbPROPFIND = 14_i32
    HttpVerbPROPPATCH = 15_i32
    HttpVerbMKCOL = 16_i32
    HttpVerbLOCK = 17_i32
    HttpVerbUNLOCK = 18_i32
    HttpVerbSEARCH = 19_i32
    HttpVerbMaximum = 20_i32
  end
  enum HTTP_HEADER_ID
    HttpHeaderCacheControl = 0_i32
    HttpHeaderConnection = 1_i32
    HttpHeaderDate = 2_i32
    HttpHeaderKeepAlive = 3_i32
    HttpHeaderPragma = 4_i32
    HttpHeaderTrailer = 5_i32
    HttpHeaderTransferEncoding = 6_i32
    HttpHeaderUpgrade = 7_i32
    HttpHeaderVia = 8_i32
    HttpHeaderWarning = 9_i32
    HttpHeaderAllow = 10_i32
    HttpHeaderContentLength = 11_i32
    HttpHeaderContentType = 12_i32
    HttpHeaderContentEncoding = 13_i32
    HttpHeaderContentLanguage = 14_i32
    HttpHeaderContentLocation = 15_i32
    HttpHeaderContentMd5 = 16_i32
    HttpHeaderContentRange = 17_i32
    HttpHeaderExpires = 18_i32
    HttpHeaderLastModified = 19_i32
    HttpHeaderAccept = 20_i32
    HttpHeaderAcceptCharset = 21_i32
    HttpHeaderAcceptEncoding = 22_i32
    HttpHeaderAcceptLanguage = 23_i32
    HttpHeaderAuthorization = 24_i32
    HttpHeaderCookie = 25_i32
    HttpHeaderExpect = 26_i32
    HttpHeaderFrom = 27_i32
    HttpHeaderHost = 28_i32
    HttpHeaderIfMatch = 29_i32
    HttpHeaderIfModifiedSince = 30_i32
    HttpHeaderIfNoneMatch = 31_i32
    HttpHeaderIfRange = 32_i32
    HttpHeaderIfUnmodifiedSince = 33_i32
    HttpHeaderMaxForwards = 34_i32
    HttpHeaderProxyAuthorization = 35_i32
    HttpHeaderReferer = 36_i32
    HttpHeaderRange = 37_i32
    HttpHeaderTe = 38_i32
    HttpHeaderTranslate = 39_i32
    HttpHeaderUserAgent = 40_i32
    HttpHeaderRequestMaximum = 41_i32
    HttpHeaderAcceptRanges = 20_i32
    HttpHeaderAge = 21_i32
    HttpHeaderEtag = 22_i32
    HttpHeaderLocation = 23_i32
    HttpHeaderProxyAuthenticate = 24_i32
    HttpHeaderRetryAfter = 25_i32
    HttpHeaderServer = 26_i32
    HttpHeaderSetCookie = 27_i32
    HttpHeaderVary = 28_i32
    HttpHeaderWwwAuthenticate = 29_i32
    HttpHeaderResponseMaximum = 30_i32
    HttpHeaderMaximum = 41_i32
  end
  enum HTTP_LOG_DATA_TYPE
    HttpLogDataTypeFields = 0_i32
  end
  enum HTTP_DATA_CHUNK_TYPE
    HttpDataChunkFromMemory = 0_i32
    HttpDataChunkFromFileHandle = 1_i32
    HttpDataChunkFromFragmentCache = 2_i32
    HttpDataChunkFromFragmentCacheEx = 3_i32
    HttpDataChunkTrailers = 4_i32
    HttpDataChunkMaximum = 5_i32
  end
  enum HTTP_DELEGATE_REQUEST_PROPERTY_ID
    DelegateRequestReservedProperty = 0_i32
    DelegateRequestDelegateUrlProperty = 1_i32
  end
  enum HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID
    CreateRequestQueueExternalIdProperty = 1_i32
    CreateRequestQueueMax = 2_i32
  end
  enum HTTP_AUTH_STATUS
    HttpAuthStatusSuccess = 0_i32
    HttpAuthStatusNotAuthenticated = 1_i32
    HttpAuthStatusFailure = 2_i32
  end
  enum HTTP_REQUEST_AUTH_TYPE
    HttpRequestAuthTypeNone = 0_i32
    HttpRequestAuthTypeBasic = 1_i32
    HttpRequestAuthTypeDigest = 2_i32
    HttpRequestAuthTypeNTLM = 3_i32
    HttpRequestAuthTypeNegotiate = 4_i32
    HttpRequestAuthTypeKerberos = 5_i32
  end
  enum HTTP_REQUEST_SIZING_TYPE
    HttpRequestSizingTypeTlsHandshakeLeg1ClientData = 0_i32
    HttpRequestSizingTypeTlsHandshakeLeg1ServerData = 1_i32
    HttpRequestSizingTypeTlsHandshakeLeg2ClientData = 2_i32
    HttpRequestSizingTypeTlsHandshakeLeg2ServerData = 3_i32
    HttpRequestSizingTypeHeaders = 4_i32
    HttpRequestSizingTypeMax = 5_i32
  end
  enum HTTP_REQUEST_TIMING_TYPE
    HttpRequestTimingTypeConnectionStart = 0_i32
    HttpRequestTimingTypeDataStart = 1_i32
    HttpRequestTimingTypeTlsCertificateLoadStart = 2_i32
    HttpRequestTimingTypeTlsCertificateLoadEnd = 3_i32
    HttpRequestTimingTypeTlsHandshakeLeg1Start = 4_i32
    HttpRequestTimingTypeTlsHandshakeLeg1End = 5_i32
    HttpRequestTimingTypeTlsHandshakeLeg2Start = 6_i32
    HttpRequestTimingTypeTlsHandshakeLeg2End = 7_i32
    HttpRequestTimingTypeTlsAttributesQueryStart = 8_i32
    HttpRequestTimingTypeTlsAttributesQueryEnd = 9_i32
    HttpRequestTimingTypeTlsClientCertQueryStart = 10_i32
    HttpRequestTimingTypeTlsClientCertQueryEnd = 11_i32
    HttpRequestTimingTypeHttp2StreamStart = 12_i32
    HttpRequestTimingTypeHttp2HeaderDecodeStart = 13_i32
    HttpRequestTimingTypeHttp2HeaderDecodeEnd = 14_i32
    HttpRequestTimingTypeRequestHeaderParseStart = 15_i32
    HttpRequestTimingTypeRequestHeaderParseEnd = 16_i32
    HttpRequestTimingTypeRequestRoutingStart = 17_i32
    HttpRequestTimingTypeRequestRoutingEnd = 18_i32
    HttpRequestTimingTypeRequestQueuedForInspection = 19_i32
    HttpRequestTimingTypeRequestDeliveredForInspection = 20_i32
    HttpRequestTimingTypeRequestReturnedAfterInspection = 21_i32
    HttpRequestTimingTypeRequestQueuedForDelegation = 22_i32
    HttpRequestTimingTypeRequestDeliveredForDelegation = 23_i32
    HttpRequestTimingTypeRequestReturnedAfterDelegation = 24_i32
    HttpRequestTimingTypeRequestQueuedForIO = 25_i32
    HttpRequestTimingTypeRequestDeliveredForIO = 26_i32
    HttpRequestTimingTypeHttp3StreamStart = 27_i32
    HttpRequestTimingTypeHttp3HeaderDecodeStart = 28_i32
    HttpRequestTimingTypeHttp3HeaderDecodeEnd = 29_i32
    HttpRequestTimingTypeMax = 30_i32
  end
  enum HTTP_REQUEST_INFO_TYPE
    HttpRequestInfoTypeAuth = 0_i32
    HttpRequestInfoTypeChannelBind = 1_i32
    HttpRequestInfoTypeSslProtocol = 2_i32
    HttpRequestInfoTypeSslTokenBindingDraft = 3_i32
    HttpRequestInfoTypeSslTokenBinding = 4_i32
    HttpRequestInfoTypeRequestTiming = 5_i32
    HttpRequestInfoTypeTcpInfoV0 = 6_i32
    HttpRequestInfoTypeRequestSizing = 7_i32
    HttpRequestInfoTypeQuicStats = 8_i32
    HttpRequestInfoTypeTcpInfoV1 = 9_i32
  end
  enum HTTP_RESPONSE_INFO_TYPE
    HttpResponseInfoTypeMultipleKnownHeaders = 0_i32
    HttpResponseInfoTypeAuthenticationProperty = 1_i32
    HttpResponseInfoTypeQoSProperty = 2_i32
    HttpResponseInfoTypeChannelBind = 3_i32
  end
  enum HTTP_CACHE_POLICY_TYPE
    HttpCachePolicyNocache = 0_i32
    HttpCachePolicyUserInvalidates = 1_i32
    HttpCachePolicyTimeToLive = 2_i32
    HttpCachePolicyMaximum = 3_i32
  end
  enum HTTP_SERVICE_CONFIG_ID
    HttpServiceConfigIPListenList = 0_i32
    HttpServiceConfigSSLCertInfo = 1_i32
    HttpServiceConfigUrlAclInfo = 2_i32
    HttpServiceConfigTimeout = 3_i32
    HttpServiceConfigCache = 4_i32
    HttpServiceConfigSslSniCertInfo = 5_i32
    HttpServiceConfigSslCcsCertInfo = 6_i32
    HttpServiceConfigSetting = 7_i32
    HttpServiceConfigSslCertInfoEx = 8_i32
    HttpServiceConfigSslSniCertInfoEx = 9_i32
    HttpServiceConfigSslCcsCertInfoEx = 10_i32
    HttpServiceConfigSslScopedCcsCertInfo = 11_i32
    HttpServiceConfigSslScopedCcsCertInfoEx = 12_i32
    HttpServiceConfigMax = 13_i32
  end
  enum HTTP_SERVICE_CONFIG_QUERY_TYPE
    HttpServiceConfigQueryExact = 0_i32
    HttpServiceConfigQueryNext = 1_i32
    HttpServiceConfigQueryMax = 2_i32
  end
  enum HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
    ExParamTypeHttp2Window = 0_i32
    ExParamTypeHttp2SettingsLimits = 1_i32
    ExParamTypeHttpPerformance = 2_i32
    ExParamTypeTlsRestrictions = 3_i32
    ExParamTypeErrorHeaders = 4_i32
    ExParamTypeTlsSessionTicketKeys = 5_i32
    ExParamTypeMax = 6_i32
  end
  enum HTTP_PERFORMANCE_PARAM_TYPE
    PerformanceParamSendBufferingFlags = 0_i32
    PerformanceParamAggressiveICW = 1_i32
    PerformanceParamMaxSendBufferSize = 2_i32
    PerformanceParamMaxConcurrentClientStreams = 3_i32
    PerformanceParamMaxReceiveBufferSize = 4_i32
    PerformanceParamDecryptOnSspiThread = 5_i32
    PerformanceParamMax = 6_i32
  end
  enum HTTP_SERVICE_CONFIG_CACHE_KEY
    MaxCacheResponseSize = 0_i32
    CacheRangeChunkSize = 1_i32
  end
  enum HTTP_REQUEST_PROPERTY
    HttpRequestPropertyIsb = 0_i32
    HttpRequestPropertyTcpInfoV0 = 1_i32
    HttpRequestPropertyQuicStats = 2_i32
    HttpRequestPropertyTcpInfoV1 = 3_i32
    HttpRequestPropertySni = 4_i32
    HttpRequestPropertyStreamError = 5_i32
    HttpRequestPropertyWskApiTimings = 6_i32
    HttpRequestPropertyQuicApiTimings = 7_i32
  end
  enum HTTP_FEATURE_ID
    HttpFeatureUnknown = 0_i32
    HttpFeatureResponseTrailers = 1_i32
    HttpFeatureApiTimings = 2_i32
    HttpFeatureDelegateEx = 3_i32
    HttpFeatureHttp3 = 4_i32
    HttpFeaturemax = -1_i32
  end

  @[Extern]
  record HTTP_PROPERTY_FLAGS,
    _bitfield : UInt32

  @[Extern]
  record HTTP_STATE_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    state : Win32cr::Networking::HttpServer::HTTP_ENABLED_STATE

  @[Extern]
  record HTTP_QOS_SETTING_INFO,
    qos_type : Win32cr::Networking::HttpServer::HTTP_QOS_SETTING_TYPE,
    qos_setting : Void*

  @[Extern]
  record HTTP_CONNECTION_LIMIT_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    max_connections : UInt32

  @[Extern]
  record HTTP_BANDWIDTH_LIMIT_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    max_bandwidth : UInt32

  @[Extern]
  record HTTP_FLOWRATE_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    max_bandwidth : UInt32,
    max_peak_bandwidth : UInt32,
    burst_size : UInt32

  @[Extern]
  record HTTP_SERVICE_CONFIG_TIMEOUT_SET,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_TIMEOUT_KEY,
    param_desc : UInt16

  @[Extern]
  record HTTP_TIMEOUT_LIMIT_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    entity_body : UInt16,
    drain_entity_body : UInt16,
    request_queue : UInt16,
    idle_connection : UInt16,
    header_wait : UInt16,
    min_send_rate : UInt32

  @[Extern]
  record HTTP_SERVICE_CONFIG_SETTING_SET,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SETTING_KEY,
    param_desc : UInt32

  @[Extern]
  record HTTP_LISTEN_ENDPOINT_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    enable_sharing : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS,
    domain_name_length : UInt16,
    domain_name : Win32cr::Foundation::PWSTR,
    realm_length : UInt16,
    realm : Win32cr::Foundation::PWSTR

  @[Extern]
  record HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS,
    realm_length : UInt16,
    realm : Win32cr::Foundation::PWSTR

  @[Extern]
  record HTTP_SERVER_AUTHENTICATION_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    auth_schemes : UInt32,
    receive_mutual_auth : Win32cr::Foundation::BOOLEAN,
    receive_context_handle : Win32cr::Foundation::BOOLEAN,
    disable_ntlm_credential_caching : Win32cr::Foundation::BOOLEAN,
    ex_flags : UInt8,
    digest_params : Win32cr::Networking::HttpServer::HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS,
    basic_params : Win32cr::Networking::HttpServer::HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS

  @[Extern]
  record HTTP_SERVICE_BINDING_BASE,
    type__ : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_TYPE

  @[Extern]
  record HTTP_SERVICE_BINDING_A,
    base : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE,
    buffer : Win32cr::Foundation::PSTR,
    buffer_size : UInt32

  @[Extern]
  record HTTP_SERVICE_BINDING_W,
    base : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE,
    buffer : Win32cr::Foundation::PWSTR,
    buffer_size : UInt32

  @[Extern]
  record HTTP_CHANNEL_BIND_INFO,
    hardening : Win32cr::Networking::HttpServer::HTTP_AUTHENTICATION_HARDENING_LEVELS,
    flags : UInt32,
    service_names : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE**,
    number_of_service_names : UInt32

  @[Extern]
  record HTTP_REQUEST_CHANNEL_BIND_STATUS,
    service_name : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE*,
    channel_token : UInt8*,
    channel_token_size : UInt32,
    flags : UInt32

  @[Extern]
  record HTTP_REQUEST_TOKEN_BINDING_INFO,
    token_binding : UInt8*,
    token_binding_size : UInt32,
    ekm : UInt8*,
    ekm_size : UInt32,
    key_type : UInt8

  @[Extern]
  record HTTP_LOGGING_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    logging_flags : UInt32,
    software_name : Win32cr::Foundation::PWSTR,
    software_name_length : UInt16,
    directory_name_length : UInt16,
    directory_name : Win32cr::Foundation::PWSTR,
    format : Win32cr::Networking::HttpServer::HTTP_LOGGING_TYPE,
    fields : UInt32,
    pExtFields : Void*,
    num_of_ext_fields : UInt16,
    max_record_size : UInt16,
    rollover_type : Win32cr::Networking::HttpServer::HTTP_LOGGING_ROLLOVER_TYPE,
    rollover_size : UInt32,
    pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR

  @[Extern]
  record HTTP_BINDING_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    request_queue_handle : Win32cr::Foundation::HANDLE

  @[Extern]
  record HTTP_PROTECTION_LEVEL_INFO,
    flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS,
    level : Win32cr::Networking::HttpServer::HTTP_PROTECTION_LEVEL_TYPE

  @[Extern]
  record HTTP_BYTE_RANGE,
    starting_offset : Win32cr::Foundation::ULARGE_INTEGER,
    length : Win32cr::Foundation::ULARGE_INTEGER

  @[Extern]
  record HTTP_VERSION,
    major_version : UInt16,
    minor_version : UInt16

  @[Extern]
  record HTTP_KNOWN_HEADER,
    raw_value_length : UInt16,
    pRawValue : Win32cr::Foundation::PSTR

  @[Extern]
  record HTTP_UNKNOWN_HEADER,
    name_length : UInt16,
    raw_value_length : UInt16,
    pName : Win32cr::Foundation::PSTR,
    pRawValue : Win32cr::Foundation::PSTR

  @[Extern]
  record HTTP_LOG_DATA,
    type__ : Win32cr::Networking::HttpServer::HTTP_LOG_DATA_TYPE

  @[Extern]
  record HTTP_LOG_FIELDS_DATA,
    base : Win32cr::Networking::HttpServer::HTTP_LOG_DATA,
    user_name_length : UInt16,
    uri_stem_length : UInt16,
    client_ip_length : UInt16,
    server_name_length : UInt16,
    service_name_length : UInt16,
    server_ip_length : UInt16,
    method_length : UInt16,
    uri_query_length : UInt16,
    host_length : UInt16,
    user_agent_length : UInt16,
    cookie_length : UInt16,
    referrer_length : UInt16,
    user_name : Win32cr::Foundation::PWSTR,
    uri_stem : Win32cr::Foundation::PWSTR,
    client_ip : Win32cr::Foundation::PSTR,
    server_name : Win32cr::Foundation::PSTR,
    service_name : Win32cr::Foundation::PSTR,
    server_ip : Win32cr::Foundation::PSTR,
    method : Win32cr::Foundation::PSTR,
    uri_query : Win32cr::Foundation::PSTR,
    host : Win32cr::Foundation::PSTR,
    user_agent : Win32cr::Foundation::PSTR,
    cookie : Win32cr::Foundation::PSTR,
    referrer : Win32cr::Foundation::PSTR,
    server_port : UInt16,
    protocol_status : UInt16,
    win32_status : UInt32,
    method_num : Win32cr::Networking::HttpServer::HTTP_VERB,
    sub_status : UInt16

  @[Extern]
  record HTTP_DATA_CHUNK,
    data_chunk_type : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      from_memory : FromMemory_e__Struct,
      from_file_handle : FromFileHandle_e__Struct,
      from_fragment_cache : FromFragmentCache_e__Struct,
      from_fragment_cache_ex : FromFragmentCacheEx_e__Struct,
      trailers : Trailers_e__Struct do

      # Nested Type FromFragmentCacheEx_e__Struct
      @[Extern]
      record FromFragmentCacheEx_e__Struct,
        byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE,
        pFragmentName : Win32cr::Foundation::PWSTR


      # Nested Type FromFileHandle_e__Struct
      @[Extern]
      record FromFileHandle_e__Struct,
        byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE,
        file_handle : Win32cr::Foundation::HANDLE


      # Nested Type FromFragmentCache_e__Struct
      @[Extern]
      record FromFragmentCache_e__Struct,
        fragment_name_length : UInt16,
        pFragmentName : Win32cr::Foundation::PWSTR


      # Nested Type FromMemory_e__Struct
      @[Extern]
      record FromMemory_e__Struct,
        pBuffer : Void*,
        buffer_length : UInt32


      # Nested Type Trailers_e__Struct
      @[Extern]
      record Trailers_e__Struct,
        trailer_count : UInt16,
        pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*

    end

  end

  @[Extern]
  record HTTP_REQUEST_HEADERS,
    unknown_header_count : UInt16,
    pUnknownHeaders : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*,
    trailer_count : UInt16,
    pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*,
    known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER[41]

  @[Extern]
  record HTTP_RESPONSE_HEADERS,
    unknown_header_count : UInt16,
    pUnknownHeaders : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*,
    trailer_count : UInt16,
    pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*,
    known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER[30]

  @[Extern]
  record HTTP_DELEGATE_REQUEST_PROPERTY_INFO,
    property_id : Win32cr::Networking::HttpServer::HTTP_DELEGATE_REQUEST_PROPERTY_ID,
    property_info_length : UInt32,
    property_info : Void*

  @[Extern]
  record HTTP_CREATE_REQUEST_QUEUE_PROPERTY_INFO,
    property_id : Win32cr::Networking::HttpServer::HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID,
    property_info_length : UInt32,
    property_info : Void*

  @[Extern]
  record HTTP_TRANSPORT_ADDRESS,
    pRemoteAddress : Win32cr::Networking::WinSock::SOCKADDR*,
    pLocalAddress : Win32cr::Networking::WinSock::SOCKADDR*

  @[Extern]
  record HTTP_COOKED_URL,
    full_url_length : UInt16,
    host_length : UInt16,
    abs_path_length : UInt16,
    query_string_length : UInt16,
    pFullUrl : Win32cr::Foundation::PWSTR,
    pHost : Win32cr::Foundation::PWSTR,
    pAbsPath : Win32cr::Foundation::PWSTR,
    pQueryString : Win32cr::Foundation::PWSTR

  @[Extern]
  record HTTP_SSL_CLIENT_CERT_INFO,
    cert_flags : UInt32,
    cert_encoded_size : UInt32,
    pCertEncoded : UInt8*,
    token : Win32cr::Foundation::HANDLE,
    cert_denied_by_mapper : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record HTTP_SSL_INFO,
    server_cert_key_size : UInt16,
    connection_key_size : UInt16,
    server_cert_issuer_size : UInt32,
    server_cert_subject_size : UInt32,
    pServerCertIssuer : Win32cr::Foundation::PSTR,
    pServerCertSubject : Win32cr::Foundation::PSTR,
    pClientCertInfo : Win32cr::Networking::HttpServer::HTTP_SSL_CLIENT_CERT_INFO*,
    ssl_client_cert_negotiated : UInt32

  @[Extern]
  record HTTP_SSL_PROTOCOL_INFO,
    protocol : UInt32,
    cipher_type : UInt32,
    cipher_strength : UInt32,
    hash_type : UInt32,
    hash_strength : UInt32,
    key_exchange_type : UInt32,
    key_exchange_strength : UInt32

  @[Extern]
  record HTTP_REQUEST_SIZING_INFO,
    flags : UInt64,
    request_index : UInt32,
    request_sizing_count : UInt32,
    request_sizing : UInt64[5]

  @[Extern]
  record HTTP_REQUEST_TIMING_INFO,
    request_timing_count : UInt32,
    request_timing : UInt64[30]

  @[Extern]
  record HTTP_REQUEST_INFO,
    info_type : Win32cr::Networking::HttpServer::HTTP_REQUEST_INFO_TYPE,
    info_length : UInt32,
    pInfo : Void*

  @[Extern]
  record HTTP_REQUEST_AUTH_INFO,
    auth_status : Win32cr::Networking::HttpServer::HTTP_AUTH_STATUS,
    sec_status : Win32cr::Foundation::HRESULT,
    flags : UInt32,
    auth_type : Win32cr::Networking::HttpServer::HTTP_REQUEST_AUTH_TYPE,
    access_token : Win32cr::Foundation::HANDLE,
    context_attributes : UInt32,
    packed_context_length : UInt32,
    packed_context_type : UInt32,
    packed_context : Void*,
    mutual_auth_data_length : UInt32,
    pMutualAuthData : Win32cr::Foundation::PSTR,
    package_name_length : UInt16,
    pPackageName : Win32cr::Foundation::PWSTR

  @[Extern]
  record HTTP_REQUEST_V1,
    flags : UInt32,
    connection_id : UInt64,
    request_id : UInt64,
    url_context : UInt64,
    version : Win32cr::Networking::HttpServer::HTTP_VERSION,
    verb : Win32cr::Networking::HttpServer::HTTP_VERB,
    unknown_verb_length : UInt16,
    raw_url_length : UInt16,
    pUnknownVerb : Win32cr::Foundation::PSTR,
    pRawUrl : Win32cr::Foundation::PSTR,
    cooked_url : Win32cr::Networking::HttpServer::HTTP_COOKED_URL,
    address : Win32cr::Networking::HttpServer::HTTP_TRANSPORT_ADDRESS,
    headers : Win32cr::Networking::HttpServer::HTTP_REQUEST_HEADERS,
    bytes_received : UInt64,
    entity_chunk_count : UInt16,
    pEntityChunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*,
    raw_connection_id : UInt64,
    pSslInfo : Win32cr::Networking::HttpServer::HTTP_SSL_INFO*

  @[Extern]
  record HTTP_REQUEST_V2,
    __anonymous_base_http_l1861_c35 : Win32cr::Networking::HttpServer::HTTP_REQUEST_V1,
    request_info_count : UInt16,
    pRequestInfo : Win32cr::Networking::HttpServer::HTTP_REQUEST_INFO*

  @[Extern]
  record HTTP_RESPONSE_V1,
    flags : UInt32,
    version : Win32cr::Networking::HttpServer::HTTP_VERSION,
    status_code : UInt16,
    reason_length : UInt16,
    pReason : Win32cr::Foundation::PSTR,
    headers : Win32cr::Networking::HttpServer::HTTP_RESPONSE_HEADERS,
    entity_chunk_count : UInt16,
    pEntityChunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*

  @[Extern]
  record HTTP_RESPONSE_INFO,
    type__ : Win32cr::Networking::HttpServer::HTTP_RESPONSE_INFO_TYPE,
    length : UInt32,
    pInfo : Void*

  @[Extern]
  record HTTP_MULTIPLE_KNOWN_HEADERS,
    header_id : Win32cr::Networking::HttpServer::HTTP_HEADER_ID,
    flags : UInt32,
    known_header_count : UInt16,
    known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER*

  @[Extern]
  record HTTP_RESPONSE_V2,
    __anonymous_base_http_l2050_c36 : Win32cr::Networking::HttpServer::HTTP_RESPONSE_V1,
    response_info_count : UInt16,
    pResponseInfo : Win32cr::Networking::HttpServer::HTTP_RESPONSE_INFO*

  @[Extern]
  record HTTPAPI_VERSION,
    http_api_major_version : UInt16,
    http_api_minor_version : UInt16

  @[Extern]
  record HTTP_CACHE_POLICY,
    policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY_TYPE,
    seconds_to_live : UInt32

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_KEY,
    pIpPort : Win32cr::Networking::WinSock::SOCKADDR*

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_KEY_EX,
    ip_port : Win32cr::Networking::WinSock::SOCKADDR_STORAGE

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_SNI_KEY,
    ip_port : Win32cr::Networking::WinSock::SOCKADDR_STORAGE,
    host : Win32cr::Foundation::PWSTR

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_CCS_KEY,
    local_address : Win32cr::Networking::WinSock::SOCKADDR_STORAGE

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_PARAM,
    ssl_hash_length : UInt32,
    pSslHash : Void*,
    app_id : LibC::GUID,
    pSslCertStoreName : Win32cr::Foundation::PWSTR,
    default_cert_check_mode : UInt32,
    default_revocation_freshness_time : UInt32,
    default_revocation_url_retrieval_timeout : UInt32,
    pDefaultSslCtlIdentifier : Win32cr::Foundation::PWSTR,
    pDefaultSslCtlStoreName : Win32cr::Foundation::PWSTR,
    default_flags : UInt32

  @[Extern]
  record HTTP2_WINDOW_SIZE_PARAM,
    http2_receive_window_size : UInt32

  @[Extern]
  record HTTP2_SETTINGS_LIMITS_PARAM,
    http2_max_settings_per_frame : UInt32,
    http2_max_settings_per_minute : UInt32

  @[Extern]
  record HTTP_PERFORMANCE_PARAM,
    type__ : Win32cr::Networking::HttpServer::HTTP_PERFORMANCE_PARAM_TYPE,
    buffer_size : UInt32,
    buffer : Void*

  @[Extern]
  record HTTP_TLS_RESTRICTIONS_PARAM,
    restriction_count : UInt32,
    tls_restrictions : Void*

  @[Extern]
  record HTTP_ERROR_HEADERS_PARAM,
    status_code : UInt16,
    header_count : UInt16,
    headers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*

  @[Extern]
  record HTTP_TLS_SESSION_TICKET_KEYS_PARAM,
    session_ticket_key_count : UInt32,
    session_ticket_keys : Void*

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_PARAM_EX,
    param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE,
    flags : UInt64,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      http2_window_size_param : Win32cr::Networking::HttpServer::HTTP2_WINDOW_SIZE_PARAM,
      http2_settings_limits_param : Win32cr::Networking::HttpServer::HTTP2_SETTINGS_LIMITS_PARAM,
      http_performance_param : Win32cr::Networking::HttpServer::HTTP_PERFORMANCE_PARAM,
      http_tls_restrictions_param : Win32cr::Networking::HttpServer::HTTP_TLS_RESTRICTIONS_PARAM,
      http_error_headers_param : Win32cr::Networking::HttpServer::HTTP_ERROR_HEADERS_PARAM,
      http_tls_session_ticket_keys_param : Win32cr::Networking::HttpServer::HTTP_TLS_SESSION_TICKET_KEYS_PARAM

  end

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_SET,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY,
    param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_SNI_SET,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY,
    param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_CCS_SET,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY,
    param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_SET_EX,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY_EX,
    param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_SNI_SET_EX,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY,
    param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_CCS_SET_EX,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY,
    param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_QUERY,
    query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY,
    dwToken : UInt32

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_SNI_QUERY,
    query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY,
    dwToken : UInt32

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_CCS_QUERY,
    query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY,
    dwToken : UInt32

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_QUERY_EX,
    query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY_EX,
    dwToken : UInt32,
    param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_SNI_QUERY_EX,
    query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY,
    dwToken : UInt32,
    param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE

  @[Extern]
  record HTTP_SERVICE_CONFIG_SSL_CCS_QUERY_EX,
    query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY,
    dwToken : UInt32,
    param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE

  @[Extern]
  record HTTP_SERVICE_CONFIG_IP_LISTEN_PARAM,
    addr_length : UInt16,
    pAddress : Win32cr::Networking::WinSock::SOCKADDR*

  @[Extern]
  record HTTP_SERVICE_CONFIG_IP_LISTEN_QUERY,
    addr_count : UInt32,
    addr_list : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*

  @[Extern]
  record HTTP_SERVICE_CONFIG_URLACL_KEY,
    pUrlPrefix : Win32cr::Foundation::PWSTR

  @[Extern]
  record HTTP_SERVICE_CONFIG_URLACL_PARAM,
    pStringSecurityDescriptor : Win32cr::Foundation::PWSTR

  @[Extern]
  record HTTP_SERVICE_CONFIG_URLACL_SET,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_KEY,
    param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_PARAM

  @[Extern]
  record HTTP_SERVICE_CONFIG_URLACL_QUERY,
    query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_KEY,
    dwToken : UInt32

  @[Extern]
  record HTTP_SERVICE_CONFIG_CACHE_SET,
    key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_CACHE_KEY,
    param_desc : UInt32

  @[Extern]
  record HTTP_QUERY_REQUEST_QUALIFIER_TCP,
    freshness : UInt64

  @[Extern]
  record HTTP_QUERY_REQUEST_QUALIFIER_QUIC,
    freshness : UInt64

  @[Extern]
  record HTTP_REQUEST_PROPERTY_SNI,
    hostname : UInt16[256],
    flags : UInt32

  @[Extern]
  record HTTP_REQUEST_PROPERTY_STREAM_ERROR,
    error_code : UInt32

  @[Extern]
  record HTTP_WSK_API_TIMINGS,
    connect_count : UInt64,
    connect_sum : UInt64,
    disconnect_count : UInt64,
    disconnect_sum : UInt64,
    send_count : UInt64,
    send_sum : UInt64,
    receive_count : UInt64,
    receive_sum : UInt64,
    release_count : UInt64,
    release_sum : UInt64,
    control_socket_count : UInt64,
    control_socket_sum : UInt64

  @[Extern]
  record HTTP_QUIC_STREAM_API_TIMINGS,
    open_count : UInt64,
    open_sum : UInt64,
    close_count : UInt64,
    close_sum : UInt64,
    start_count : UInt64,
    start_sum : UInt64,
    shutdown_count : UInt64,
    shutdown_sum : UInt64,
    send_count : UInt64,
    send_sum : UInt64,
    receive_set_enabled_count : UInt64,
    receive_set_enabled_sum : UInt64,
    get_param_count : UInt64,
    get_param_sum : UInt64,
    set_param_count : UInt64,
    set_param_sum : UInt64,
    set_callback_handler_count : UInt64,
    set_callback_handler_sum : UInt64

  @[Extern]
  record HTTP_QUIC_CONNECTION_API_TIMINGS,
    open_time : UInt64,
    close_time : UInt64,
    start_time : UInt64,
    shutdown_time : UInt64,
    sec_config_create_time : UInt64,
    sec_config_delete_time : UInt64,
    get_param_count : UInt64,
    get_param_sum : UInt64,
    set_param_count : UInt64,
    set_param_sum : UInt64,
    set_callback_handler_count : UInt64,
    set_callback_handler_sum : UInt64,
    control_stream_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_STREAM_API_TIMINGS

  @[Extern]
  record HTTP_QUIC_API_TIMINGS,
    connection_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_CONNECTION_API_TIMINGS,
    stream_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_STREAM_API_TIMINGS

  @[Link("httpapi")]
  lib C
    fun HttpInitialize(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, flags : Win32cr::Networking::HttpServer::HTTP_INITIALIZE, pReserved : Void*) : UInt32

    fun HttpTerminate(flags : Win32cr::Networking::HttpServer::HTTP_INITIALIZE, pReserved : Void*) : UInt32

    fun HttpCreateHttpHandle(request_queue_handle : Win32cr::Foundation::HANDLE*, reserved : UInt32) : UInt32

    fun HttpCreateRequestQueue(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, name : Win32cr::Foundation::PWSTR, security_attributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flags : UInt32, request_queue_handle : Win32cr::Foundation::HANDLE*) : UInt32

    fun HttpCloseRequestQueue(request_queue_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun HttpSetRequestQueueProperty(request_queue_handle : Win32cr::Foundation::HANDLE, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, reserved1 : UInt32, reserved2 : Void*) : UInt32

    fun HttpQueryRequestQueueProperty(request_queue_handle : Win32cr::Foundation::HANDLE, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, reserved1 : UInt32, return_length : UInt32*, reserved2 : Void*) : UInt32

    fun HttpSetRequestProperty(request_queue_handle : Win32cr::Foundation::HANDLE, id : UInt64, property_id : Win32cr::Networking::HttpServer::HTTP_REQUEST_PROPERTY, input : Void*, input_property_size : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpShutdownRequestQueue(request_queue_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun HttpReceiveClientCertificate(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, flags : UInt32, ssl_client_cert_info : Win32cr::Networking::HttpServer::HTTP_SSL_CLIENT_CERT_INFO*, ssl_client_cert_info_size : UInt32, bytes_received : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpCreateServerSession(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, server_session_id : UInt64*, reserved : UInt32) : UInt32

    fun HttpCloseServerSession(server_session_id : UInt64) : UInt32

    fun HttpQueryServerSessionProperty(server_session_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, return_length : UInt32*) : UInt32

    fun HttpSetServerSessionProperty(server_session_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32) : UInt32

    fun HttpAddUrl(request_queue_handle : Win32cr::Foundation::HANDLE, fully_qualified_url : Win32cr::Foundation::PWSTR, reserved : Void*) : UInt32

    fun HttpRemoveUrl(request_queue_handle : Win32cr::Foundation::HANDLE, fully_qualified_url : Win32cr::Foundation::PWSTR) : UInt32

    fun HttpCreateUrlGroup(server_session_id : UInt64, pUrlGroupId : UInt64*, reserved : UInt32) : UInt32

    fun HttpCloseUrlGroup(url_group_id : UInt64) : UInt32

    fun HttpAddUrlToUrlGroup(url_group_id : UInt64, pFullyQualifiedUrl : Win32cr::Foundation::PWSTR, url_context : UInt64, reserved : UInt32) : UInt32

    fun HttpRemoveUrlFromUrlGroup(url_group_id : UInt64, pFullyQualifiedUrl : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun HttpSetUrlGroupProperty(url_group_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32) : UInt32

    fun HttpQueryUrlGroupProperty(url_group_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, return_length : UInt32*) : UInt32

    fun HttpPrepareUrl(reserved : Void*, flags : UInt32, url : Win32cr::Foundation::PWSTR, prepared_url : Win32cr::Foundation::PWSTR*) : UInt32

    fun HttpReceiveHttpRequest(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : Win32cr::Networking::HttpServer::HTTP_RECEIVE_HTTP_REQUEST_FLAGS, request_buffer : Win32cr::Networking::HttpServer::HTTP_REQUEST_V2*, request_buffer_length : UInt32, bytes_returned : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpReceiveRequestEntityBody(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, entity_buffer : Void*, entity_buffer_length : UInt32, bytes_returned : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpSendHttpResponse(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, http_response : Win32cr::Networking::HttpServer::HTTP_RESPONSE_V2*, cache_policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY*, bytes_sent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*, log_data : Win32cr::Networking::HttpServer::HTTP_LOG_DATA*) : UInt32

    fun HttpSendResponseEntityBody(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, entity_chunk_count : UInt16, entity_chunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*, bytes_sent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*, log_data : Win32cr::Networking::HttpServer::HTTP_LOG_DATA*) : UInt32

    fun HttpDeclarePush(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, verb : Win32cr::Networking::HttpServer::HTTP_VERB, path : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PSTR, headers : Win32cr::Networking::HttpServer::HTTP_REQUEST_HEADERS*) : UInt32

    fun HttpWaitForDisconnect(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpWaitForDisconnectEx(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, reserved : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpCancelHttpRequest(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpWaitForDemandStart(request_queue_handle : Win32cr::Foundation::HANDLE, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpIsFeatureSupported(feature_id : Win32cr::Networking::HttpServer::HTTP_FEATURE_ID) : Win32cr::Foundation::BOOL

    fun HttpDelegateRequestEx(request_queue_handle : Win32cr::Foundation::HANDLE, delegate_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, delegate_url_group_id : UInt64, property_info_set_size : UInt32, property_info_set : Win32cr::Networking::HttpServer::HTTP_DELEGATE_REQUEST_PROPERTY_INFO*) : UInt32

    fun HttpFindUrlGroupId(fully_qualified_url : Win32cr::Foundation::PWSTR, request_queue_handle : Win32cr::Foundation::HANDLE, url_group_id : UInt64*) : UInt32

    fun HttpFlushResponseCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpAddFragmentToCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, data_chunk : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*, cache_policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpReadFragmentFromCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE*, buffer : Void*, buffer_length : UInt32, bytes_read : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpSetServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pConfigInformation : Void*, config_information_length : UInt32, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpUpdateServiceConfiguration(handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, config_info : Void*, config_info_length : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpDeleteServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pConfigInformation : Void*, config_information_length : UInt32, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpQueryServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pInput : Void*, input_length : UInt32, pOutput : Void*, output_length : UInt32, pReturnLength : UInt32*, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun HttpGetExtension(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, extension : UInt32, buffer : Void*, buffer_size : UInt32) : UInt32

  end
end