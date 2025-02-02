require "./../foundation.cr"
require "./../security.cr"
require "./win_sock.cr"
require "./../system/io.cr"

module Win32cr::Networking::HttpServer
  extend self
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
  struct HTTP_PROPERTY_FLAGS
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
  end

  @[Extern]
  struct HTTP_STATE_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property state : Win32cr::Networking::HttpServer::HTTP_ENABLED_STATE
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @state : Win32cr::Networking::HttpServer::HTTP_ENABLED_STATE)
    end
  end

  @[Extern]
  struct HTTP_QOS_SETTING_INFO
    property qos_type : Win32cr::Networking::HttpServer::HTTP_QOS_SETTING_TYPE
    property qos_setting : Void*
    def initialize(@qos_type : Win32cr::Networking::HttpServer::HTTP_QOS_SETTING_TYPE, @qos_setting : Void*)
    end
  end

  @[Extern]
  struct HTTP_CONNECTION_LIMIT_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property max_connections : UInt32
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @max_connections : UInt32)
    end
  end

  @[Extern]
  struct HTTP_BANDWIDTH_LIMIT_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property max_bandwidth : UInt32
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @max_bandwidth : UInt32)
    end
  end

  @[Extern]
  struct HTTP_FLOWRATE_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property max_bandwidth : UInt32
    property max_peak_bandwidth : UInt32
    property burst_size : UInt32
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @max_bandwidth : UInt32, @max_peak_bandwidth : UInt32, @burst_size : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_TIMEOUT_SET
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_TIMEOUT_KEY
    property param_desc : UInt16
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_TIMEOUT_KEY, @param_desc : UInt16)
    end
  end

  @[Extern]
  struct HTTP_TIMEOUT_LIMIT_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property entity_body : UInt16
    property drain_entity_body : UInt16
    property request_queue : UInt16
    property idle_connection : UInt16
    property header_wait : UInt16
    property min_send_rate : UInt32
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @entity_body : UInt16, @drain_entity_body : UInt16, @request_queue : UInt16, @idle_connection : UInt16, @header_wait : UInt16, @min_send_rate : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SETTING_SET
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SETTING_KEY
    property param_desc : UInt32
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SETTING_KEY, @param_desc : UInt32)
    end
  end

  @[Extern]
  struct HTTP_LISTEN_ENDPOINT_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property enable_sharing : Win32cr::Foundation::BOOLEAN
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @enable_sharing : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS
    property domain_name_length : UInt16
    property domain_name : Win32cr::Foundation::PWSTR
    property realm_length : UInt16
    property realm : Win32cr::Foundation::PWSTR
    def initialize(@domain_name_length : UInt16, @domain_name : Win32cr::Foundation::PWSTR, @realm_length : UInt16, @realm : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS
    property realm_length : UInt16
    property realm : Win32cr::Foundation::PWSTR
    def initialize(@realm_length : UInt16, @realm : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct HTTP_SERVER_AUTHENTICATION_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property auth_schemes : UInt32
    property receive_mutual_auth : Win32cr::Foundation::BOOLEAN
    property receive_context_handle : Win32cr::Foundation::BOOLEAN
    property disable_ntlm_credential_caching : Win32cr::Foundation::BOOLEAN
    property ex_flags : UInt8
    property digest_params : Win32cr::Networking::HttpServer::HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS
    property basic_params : Win32cr::Networking::HttpServer::HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @auth_schemes : UInt32, @receive_mutual_auth : Win32cr::Foundation::BOOLEAN, @receive_context_handle : Win32cr::Foundation::BOOLEAN, @disable_ntlm_credential_caching : Win32cr::Foundation::BOOLEAN, @ex_flags : UInt8, @digest_params : Win32cr::Networking::HttpServer::HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS, @basic_params : Win32cr::Networking::HttpServer::HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_BINDING_BASE
    property type__ : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_TYPE
    def initialize(@type__ : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_TYPE)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_BINDING_A
    property base : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE
    property buffer : Win32cr::Foundation::PSTR
    property buffer_size : UInt32
    def initialize(@base : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE, @buffer : Win32cr::Foundation::PSTR, @buffer_size : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_BINDING_W
    property base : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE
    property buffer : Win32cr::Foundation::PWSTR
    property buffer_size : UInt32
    def initialize(@base : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE, @buffer : Win32cr::Foundation::PWSTR, @buffer_size : UInt32)
    end
  end

  @[Extern]
  struct HTTP_CHANNEL_BIND_INFO
    property hardening : Win32cr::Networking::HttpServer::HTTP_AUTHENTICATION_HARDENING_LEVELS
    property flags : UInt32
    property service_names : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE**
    property number_of_service_names : UInt32
    def initialize(@hardening : Win32cr::Networking::HttpServer::HTTP_AUTHENTICATION_HARDENING_LEVELS, @flags : UInt32, @service_names : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE**, @number_of_service_names : UInt32)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_CHANNEL_BIND_STATUS
    property service_name : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE*
    property channel_token : UInt8*
    property channel_token_size : UInt32
    property flags : UInt32
    def initialize(@service_name : Win32cr::Networking::HttpServer::HTTP_SERVICE_BINDING_BASE*, @channel_token : UInt8*, @channel_token_size : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_TOKEN_BINDING_INFO
    property token_binding : UInt8*
    property token_binding_size : UInt32
    property ekm : UInt8*
    property ekm_size : UInt32
    property key_type : UInt8
    def initialize(@token_binding : UInt8*, @token_binding_size : UInt32, @ekm : UInt8*, @ekm_size : UInt32, @key_type : UInt8)
    end
  end

  @[Extern]
  struct HTTP_LOGGING_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property logging_flags : UInt32
    property software_name : Win32cr::Foundation::PWSTR
    property software_name_length : UInt16
    property directory_name_length : UInt16
    property directory_name : Win32cr::Foundation::PWSTR
    property format : Win32cr::Networking::HttpServer::HTTP_LOGGING_TYPE
    property fields : UInt32
    property pExtFields : Void*
    property num_of_ext_fields : UInt16
    property max_record_size : UInt16
    property rollover_type : Win32cr::Networking::HttpServer::HTTP_LOGGING_ROLLOVER_TYPE
    property rollover_size : UInt32
    property pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @logging_flags : UInt32, @software_name : Win32cr::Foundation::PWSTR, @software_name_length : UInt16, @directory_name_length : UInt16, @directory_name : Win32cr::Foundation::PWSTR, @format : Win32cr::Networking::HttpServer::HTTP_LOGGING_TYPE, @fields : UInt32, @pExtFields : Void*, @num_of_ext_fields : UInt16, @max_record_size : UInt16, @rollover_type : Win32cr::Networking::HttpServer::HTTP_LOGGING_ROLLOVER_TYPE, @rollover_size : UInt32, @pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR)
    end
  end

  @[Extern]
  struct HTTP_BINDING_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property request_queue_handle : Win32cr::Foundation::HANDLE
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @request_queue_handle : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct HTTP_PROTECTION_LEVEL_INFO
    property flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS
    property level : Win32cr::Networking::HttpServer::HTTP_PROTECTION_LEVEL_TYPE
    def initialize(@flags : Win32cr::Networking::HttpServer::HTTP_PROPERTY_FLAGS, @level : Win32cr::Networking::HttpServer::HTTP_PROTECTION_LEVEL_TYPE)
    end
  end

  @[Extern]
  struct HTTP_BYTE_RANGE
    property starting_offset : Win32cr::Foundation::ULARGE_INTEGER
    property length : Win32cr::Foundation::ULARGE_INTEGER
    def initialize(@starting_offset : Win32cr::Foundation::ULARGE_INTEGER, @length : Win32cr::Foundation::ULARGE_INTEGER)
    end
  end

  @[Extern]
  struct HTTP_VERSION
    property major_version : UInt16
    property minor_version : UInt16
    def initialize(@major_version : UInt16, @minor_version : UInt16)
    end
  end

  @[Extern]
  struct HTTP_KNOWN_HEADER
    property raw_value_length : UInt16
    property pRawValue : Win32cr::Foundation::PSTR
    def initialize(@raw_value_length : UInt16, @pRawValue : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct HTTP_UNKNOWN_HEADER
    property name_length : UInt16
    property raw_value_length : UInt16
    property pName : Win32cr::Foundation::PSTR
    property pRawValue : Win32cr::Foundation::PSTR
    def initialize(@name_length : UInt16, @raw_value_length : UInt16, @pName : Win32cr::Foundation::PSTR, @pRawValue : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct HTTP_LOG_DATA
    property type__ : Win32cr::Networking::HttpServer::HTTP_LOG_DATA_TYPE
    def initialize(@type__ : Win32cr::Networking::HttpServer::HTTP_LOG_DATA_TYPE)
    end
  end

  @[Extern]
  struct HTTP_LOG_FIELDS_DATA
    property base : Win32cr::Networking::HttpServer::HTTP_LOG_DATA
    property user_name_length : UInt16
    property uri_stem_length : UInt16
    property client_ip_length : UInt16
    property server_name_length : UInt16
    property service_name_length : UInt16
    property server_ip_length : UInt16
    property method_length : UInt16
    property uri_query_length : UInt16
    property host_length : UInt16
    property user_agent_length : UInt16
    property cookie_length : UInt16
    property referrer_length : UInt16
    property user_name : Win32cr::Foundation::PWSTR
    property uri_stem : Win32cr::Foundation::PWSTR
    property client_ip : Win32cr::Foundation::PSTR
    property server_name : Win32cr::Foundation::PSTR
    property service_name : Win32cr::Foundation::PSTR
    property server_ip : Win32cr::Foundation::PSTR
    property method : Win32cr::Foundation::PSTR
    property uri_query : Win32cr::Foundation::PSTR
    property host : Win32cr::Foundation::PSTR
    property user_agent : Win32cr::Foundation::PSTR
    property cookie : Win32cr::Foundation::PSTR
    property referrer : Win32cr::Foundation::PSTR
    property server_port : UInt16
    property protocol_status : UInt16
    property win32_status : UInt32
    property method_num : Win32cr::Networking::HttpServer::HTTP_VERB
    property sub_status : UInt16
    def initialize(@base : Win32cr::Networking::HttpServer::HTTP_LOG_DATA, @user_name_length : UInt16, @uri_stem_length : UInt16, @client_ip_length : UInt16, @server_name_length : UInt16, @service_name_length : UInt16, @server_ip_length : UInt16, @method_length : UInt16, @uri_query_length : UInt16, @host_length : UInt16, @user_agent_length : UInt16, @cookie_length : UInt16, @referrer_length : UInt16, @user_name : Win32cr::Foundation::PWSTR, @uri_stem : Win32cr::Foundation::PWSTR, @client_ip : Win32cr::Foundation::PSTR, @server_name : Win32cr::Foundation::PSTR, @service_name : Win32cr::Foundation::PSTR, @server_ip : Win32cr::Foundation::PSTR, @method : Win32cr::Foundation::PSTR, @uri_query : Win32cr::Foundation::PSTR, @host : Win32cr::Foundation::PSTR, @user_agent : Win32cr::Foundation::PSTR, @cookie : Win32cr::Foundation::PSTR, @referrer : Win32cr::Foundation::PSTR, @server_port : UInt16, @protocol_status : UInt16, @win32_status : UInt32, @method_num : Win32cr::Networking::HttpServer::HTTP_VERB, @sub_status : UInt16)
    end
  end

  @[Extern]
  struct HTTP_DATA_CHUNK
    property data_chunk_type : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property from_memory : FromMemory_e__Struct_
    property from_file_handle : FromFileHandle_e__Struct_
    property from_fragment_cache : FromFragmentCache_e__Struct_
    property from_fragment_cache_ex : FromFragmentCacheEx_e__Struct_
    property trailers : Trailers_e__Struct_

      # Nested Type FromFragmentCacheEx_e__Struct_
      @[Extern]
      struct FromFragmentCacheEx_e__Struct_
    property byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE
    property pFragmentName : Win32cr::Foundation::PWSTR
    def initialize(@byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE, @pFragmentName : Win32cr::Foundation::PWSTR)
    end
      end


      # Nested Type FromFileHandle_e__Struct_
      @[Extern]
      struct FromFileHandle_e__Struct_
    property byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE
    property file_handle : Win32cr::Foundation::HANDLE
    def initialize(@byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE, @file_handle : Win32cr::Foundation::HANDLE)
    end
      end


      # Nested Type FromFragmentCache_e__Struct_
      @[Extern]
      struct FromFragmentCache_e__Struct_
    property fragment_name_length : UInt16
    property pFragmentName : Win32cr::Foundation::PWSTR
    def initialize(@fragment_name_length : UInt16, @pFragmentName : Win32cr::Foundation::PWSTR)
    end
      end


      # Nested Type FromMemory_e__Struct_
      @[Extern]
      struct FromMemory_e__Struct_
    property pBuffer : Void*
    property buffer_length : UInt32
    def initialize(@pBuffer : Void*, @buffer_length : UInt32)
    end
      end


      # Nested Type Trailers_e__Struct_
      @[Extern]
      struct Trailers_e__Struct_
    property trailer_count : UInt16
    property pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*
    def initialize(@trailer_count : UInt16, @pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*)
    end
      end

    def initialize(@from_memory : FromMemory_e__Struct_, @from_file_handle : FromFileHandle_e__Struct_, @from_fragment_cache : FromFragmentCache_e__Struct_, @from_fragment_cache_ex : FromFragmentCacheEx_e__Struct_, @trailers : Trailers_e__Struct_)
    end
    end

    def initialize(@data_chunk_type : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_HEADERS
    property unknown_header_count : UInt16
    property pUnknownHeaders : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*
    property trailer_count : UInt16
    property pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*
    property known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER[41]
    def initialize(@unknown_header_count : UInt16, @pUnknownHeaders : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*, @trailer_count : UInt16, @pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*, @known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER[41])
    end
  end

  @[Extern]
  struct HTTP_RESPONSE_HEADERS
    property unknown_header_count : UInt16
    property pUnknownHeaders : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*
    property trailer_count : UInt16
    property pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*
    property known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER[30]
    def initialize(@unknown_header_count : UInt16, @pUnknownHeaders : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*, @trailer_count : UInt16, @pTrailers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*, @known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER[30])
    end
  end

  @[Extern]
  struct HTTP_DELEGATE_REQUEST_PROPERTY_INFO
    property property_id : Win32cr::Networking::HttpServer::HTTP_DELEGATE_REQUEST_PROPERTY_ID
    property property_info_length : UInt32
    property property_info : Void*
    def initialize(@property_id : Win32cr::Networking::HttpServer::HTTP_DELEGATE_REQUEST_PROPERTY_ID, @property_info_length : UInt32, @property_info : Void*)
    end
  end

  @[Extern]
  struct HTTP_CREATE_REQUEST_QUEUE_PROPERTY_INFO
    property property_id : Win32cr::Networking::HttpServer::HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID
    property property_info_length : UInt32
    property property_info : Void*
    def initialize(@property_id : Win32cr::Networking::HttpServer::HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID, @property_info_length : UInt32, @property_info : Void*)
    end
  end

  @[Extern]
  struct HTTP_TRANSPORT_ADDRESS
    property pRemoteAddress : Win32cr::Networking::WinSock::SOCKADDR*
    property pLocalAddress : Win32cr::Networking::WinSock::SOCKADDR*
    def initialize(@pRemoteAddress : Win32cr::Networking::WinSock::SOCKADDR*, @pLocalAddress : Win32cr::Networking::WinSock::SOCKADDR*)
    end
  end

  @[Extern]
  struct HTTP_COOKED_URL
    property full_url_length : UInt16
    property host_length : UInt16
    property abs_path_length : UInt16
    property query_string_length : UInt16
    property pFullUrl : Win32cr::Foundation::PWSTR
    property pHost : Win32cr::Foundation::PWSTR
    property pAbsPath : Win32cr::Foundation::PWSTR
    property pQueryString : Win32cr::Foundation::PWSTR
    def initialize(@full_url_length : UInt16, @host_length : UInt16, @abs_path_length : UInt16, @query_string_length : UInt16, @pFullUrl : Win32cr::Foundation::PWSTR, @pHost : Win32cr::Foundation::PWSTR, @pAbsPath : Win32cr::Foundation::PWSTR, @pQueryString : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct HTTP_SSL_CLIENT_CERT_INFO
    property cert_flags : UInt32
    property cert_encoded_size : UInt32
    property pCertEncoded : UInt8*
    property token : Win32cr::Foundation::HANDLE
    property cert_denied_by_mapper : Win32cr::Foundation::BOOLEAN
    def initialize(@cert_flags : UInt32, @cert_encoded_size : UInt32, @pCertEncoded : UInt8*, @token : Win32cr::Foundation::HANDLE, @cert_denied_by_mapper : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct HTTP_SSL_INFO
    property server_cert_key_size : UInt16
    property connection_key_size : UInt16
    property server_cert_issuer_size : UInt32
    property server_cert_subject_size : UInt32
    property pServerCertIssuer : Win32cr::Foundation::PSTR
    property pServerCertSubject : Win32cr::Foundation::PSTR
    property pClientCertInfo : Win32cr::Networking::HttpServer::HTTP_SSL_CLIENT_CERT_INFO*
    property ssl_client_cert_negotiated : UInt32
    def initialize(@server_cert_key_size : UInt16, @connection_key_size : UInt16, @server_cert_issuer_size : UInt32, @server_cert_subject_size : UInt32, @pServerCertIssuer : Win32cr::Foundation::PSTR, @pServerCertSubject : Win32cr::Foundation::PSTR, @pClientCertInfo : Win32cr::Networking::HttpServer::HTTP_SSL_CLIENT_CERT_INFO*, @ssl_client_cert_negotiated : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SSL_PROTOCOL_INFO
    property protocol : UInt32
    property cipher_type : UInt32
    property cipher_strength : UInt32
    property hash_type : UInt32
    property hash_strength : UInt32
    property key_exchange_type : UInt32
    property key_exchange_strength : UInt32
    def initialize(@protocol : UInt32, @cipher_type : UInt32, @cipher_strength : UInt32, @hash_type : UInt32, @hash_strength : UInt32, @key_exchange_type : UInt32, @key_exchange_strength : UInt32)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_SIZING_INFO
    property flags : UInt64
    property request_index : UInt32
    property request_sizing_count : UInt32
    property request_sizing : UInt64[5]
    def initialize(@flags : UInt64, @request_index : UInt32, @request_sizing_count : UInt32, @request_sizing : UInt64[5])
    end
  end

  @[Extern]
  struct HTTP_REQUEST_TIMING_INFO
    property request_timing_count : UInt32
    property request_timing : UInt64[30]
    def initialize(@request_timing_count : UInt32, @request_timing : UInt64[30])
    end
  end

  @[Extern]
  struct HTTP_REQUEST_INFO
    property info_type : Win32cr::Networking::HttpServer::HTTP_REQUEST_INFO_TYPE
    property info_length : UInt32
    property pInfo : Void*
    def initialize(@info_type : Win32cr::Networking::HttpServer::HTTP_REQUEST_INFO_TYPE, @info_length : UInt32, @pInfo : Void*)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_AUTH_INFO
    property auth_status : Win32cr::Networking::HttpServer::HTTP_AUTH_STATUS
    property sec_status : Win32cr::Foundation::HRESULT
    property flags : UInt32
    property auth_type : Win32cr::Networking::HttpServer::HTTP_REQUEST_AUTH_TYPE
    property access_token : Win32cr::Foundation::HANDLE
    property context_attributes : UInt32
    property packed_context_length : UInt32
    property packed_context_type : UInt32
    property packed_context : Void*
    property mutual_auth_data_length : UInt32
    property pMutualAuthData : Win32cr::Foundation::PSTR
    property package_name_length : UInt16
    property pPackageName : Win32cr::Foundation::PWSTR
    def initialize(@auth_status : Win32cr::Networking::HttpServer::HTTP_AUTH_STATUS, @sec_status : Win32cr::Foundation::HRESULT, @flags : UInt32, @auth_type : Win32cr::Networking::HttpServer::HTTP_REQUEST_AUTH_TYPE, @access_token : Win32cr::Foundation::HANDLE, @context_attributes : UInt32, @packed_context_length : UInt32, @packed_context_type : UInt32, @packed_context : Void*, @mutual_auth_data_length : UInt32, @pMutualAuthData : Win32cr::Foundation::PSTR, @package_name_length : UInt16, @pPackageName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_V1
    property flags : UInt32
    property connection_id : UInt64
    property request_id : UInt64
    property url_context : UInt64
    property version : Win32cr::Networking::HttpServer::HTTP_VERSION
    property verb : Win32cr::Networking::HttpServer::HTTP_VERB
    property unknown_verb_length : UInt16
    property raw_url_length : UInt16
    property pUnknownVerb : Win32cr::Foundation::PSTR
    property pRawUrl : Win32cr::Foundation::PSTR
    property cooked_url : Win32cr::Networking::HttpServer::HTTP_COOKED_URL
    property address : Win32cr::Networking::HttpServer::HTTP_TRANSPORT_ADDRESS
    property headers : Win32cr::Networking::HttpServer::HTTP_REQUEST_HEADERS
    property bytes_received : UInt64
    property entity_chunk_count : UInt16
    property pEntityChunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*
    property raw_connection_id : UInt64
    property pSslInfo : Win32cr::Networking::HttpServer::HTTP_SSL_INFO*
    def initialize(@flags : UInt32, @connection_id : UInt64, @request_id : UInt64, @url_context : UInt64, @version : Win32cr::Networking::HttpServer::HTTP_VERSION, @verb : Win32cr::Networking::HttpServer::HTTP_VERB, @unknown_verb_length : UInt16, @raw_url_length : UInt16, @pUnknownVerb : Win32cr::Foundation::PSTR, @pRawUrl : Win32cr::Foundation::PSTR, @cooked_url : Win32cr::Networking::HttpServer::HTTP_COOKED_URL, @address : Win32cr::Networking::HttpServer::HTTP_TRANSPORT_ADDRESS, @headers : Win32cr::Networking::HttpServer::HTTP_REQUEST_HEADERS, @bytes_received : UInt64, @entity_chunk_count : UInt16, @pEntityChunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*, @raw_connection_id : UInt64, @pSslInfo : Win32cr::Networking::HttpServer::HTTP_SSL_INFO*)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_V2
    property __anonymous_base_http_l1861_c35 : Win32cr::Networking::HttpServer::HTTP_REQUEST_V1
    property request_info_count : UInt16
    property pRequestInfo : Win32cr::Networking::HttpServer::HTTP_REQUEST_INFO*
    def initialize(@__anonymous_base_http_l1861_c35 : Win32cr::Networking::HttpServer::HTTP_REQUEST_V1, @request_info_count : UInt16, @pRequestInfo : Win32cr::Networking::HttpServer::HTTP_REQUEST_INFO*)
    end
  end

  @[Extern]
  struct HTTP_RESPONSE_V1
    property flags : UInt32
    property version : Win32cr::Networking::HttpServer::HTTP_VERSION
    property status_code : UInt16
    property reason_length : UInt16
    property pReason : Win32cr::Foundation::PSTR
    property headers : Win32cr::Networking::HttpServer::HTTP_RESPONSE_HEADERS
    property entity_chunk_count : UInt16
    property pEntityChunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*
    def initialize(@flags : UInt32, @version : Win32cr::Networking::HttpServer::HTTP_VERSION, @status_code : UInt16, @reason_length : UInt16, @pReason : Win32cr::Foundation::PSTR, @headers : Win32cr::Networking::HttpServer::HTTP_RESPONSE_HEADERS, @entity_chunk_count : UInt16, @pEntityChunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*)
    end
  end

  @[Extern]
  struct HTTP_RESPONSE_INFO
    property type__ : Win32cr::Networking::HttpServer::HTTP_RESPONSE_INFO_TYPE
    property length : UInt32
    property pInfo : Void*
    def initialize(@type__ : Win32cr::Networking::HttpServer::HTTP_RESPONSE_INFO_TYPE, @length : UInt32, @pInfo : Void*)
    end
  end

  @[Extern]
  struct HTTP_MULTIPLE_KNOWN_HEADERS
    property header_id : Win32cr::Networking::HttpServer::HTTP_HEADER_ID
    property flags : UInt32
    property known_header_count : UInt16
    property known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER*
    def initialize(@header_id : Win32cr::Networking::HttpServer::HTTP_HEADER_ID, @flags : UInt32, @known_header_count : UInt16, @known_headers : Win32cr::Networking::HttpServer::HTTP_KNOWN_HEADER*)
    end
  end

  @[Extern]
  struct HTTP_RESPONSE_V2
    property __anonymous_base_http_l2050_c36 : Win32cr::Networking::HttpServer::HTTP_RESPONSE_V1
    property response_info_count : UInt16
    property pResponseInfo : Win32cr::Networking::HttpServer::HTTP_RESPONSE_INFO*
    def initialize(@__anonymous_base_http_l2050_c36 : Win32cr::Networking::HttpServer::HTTP_RESPONSE_V1, @response_info_count : UInt16, @pResponseInfo : Win32cr::Networking::HttpServer::HTTP_RESPONSE_INFO*)
    end
  end

  @[Extern]
  struct HTTPAPI_VERSION
    property http_api_major_version : UInt16
    property http_api_minor_version : UInt16
    def initialize(@http_api_major_version : UInt16, @http_api_minor_version : UInt16)
    end
  end

  @[Extern]
  struct HTTP_CACHE_POLICY
    property policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY_TYPE
    property seconds_to_live : UInt32
    def initialize(@policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY_TYPE, @seconds_to_live : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_KEY
    property pIpPort : Win32cr::Networking::WinSock::SOCKADDR*
    def initialize(@pIpPort : Win32cr::Networking::WinSock::SOCKADDR*)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_KEY_EX
    property ip_port : Win32cr::Networking::WinSock::SOCKADDR_STORAGE
    def initialize(@ip_port : Win32cr::Networking::WinSock::SOCKADDR_STORAGE)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    property ip_port : Win32cr::Networking::WinSock::SOCKADDR_STORAGE
    property host : Win32cr::Foundation::PWSTR
    def initialize(@ip_port : Win32cr::Networking::WinSock::SOCKADDR_STORAGE, @host : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    property local_address : Win32cr::Networking::WinSock::SOCKADDR_STORAGE
    def initialize(@local_address : Win32cr::Networking::WinSock::SOCKADDR_STORAGE)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_PARAM
    property ssl_hash_length : UInt32
    property pSslHash : Void*
    property app_id : LibC::GUID
    property pSslCertStoreName : Win32cr::Foundation::PWSTR
    property default_cert_check_mode : UInt32
    property default_revocation_freshness_time : UInt32
    property default_revocation_url_retrieval_timeout : UInt32
    property pDefaultSslCtlIdentifier : Win32cr::Foundation::PWSTR
    property pDefaultSslCtlStoreName : Win32cr::Foundation::PWSTR
    property default_flags : UInt32
    def initialize(@ssl_hash_length : UInt32, @pSslHash : Void*, @app_id : LibC::GUID, @pSslCertStoreName : Win32cr::Foundation::PWSTR, @default_cert_check_mode : UInt32, @default_revocation_freshness_time : UInt32, @default_revocation_url_retrieval_timeout : UInt32, @pDefaultSslCtlIdentifier : Win32cr::Foundation::PWSTR, @pDefaultSslCtlStoreName : Win32cr::Foundation::PWSTR, @default_flags : UInt32)
    end
  end

  @[Extern]
  struct HTTP2_WINDOW_SIZE_PARAM
    property http2_receive_window_size : UInt32
    def initialize(@http2_receive_window_size : UInt32)
    end
  end

  @[Extern]
  struct HTTP2_SETTINGS_LIMITS_PARAM
    property http2_max_settings_per_frame : UInt32
    property http2_max_settings_per_minute : UInt32
    def initialize(@http2_max_settings_per_frame : UInt32, @http2_max_settings_per_minute : UInt32)
    end
  end

  @[Extern]
  struct HTTP_PERFORMANCE_PARAM
    property type__ : Win32cr::Networking::HttpServer::HTTP_PERFORMANCE_PARAM_TYPE
    property buffer_size : UInt32
    property buffer : Void*
    def initialize(@type__ : Win32cr::Networking::HttpServer::HTTP_PERFORMANCE_PARAM_TYPE, @buffer_size : UInt32, @buffer : Void*)
    end
  end

  @[Extern]
  struct HTTP_TLS_RESTRICTIONS_PARAM
    property restriction_count : UInt32
    property tls_restrictions : Void*
    def initialize(@restriction_count : UInt32, @tls_restrictions : Void*)
    end
  end

  @[Extern]
  struct HTTP_ERROR_HEADERS_PARAM
    property status_code : UInt16
    property header_count : UInt16
    property headers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*
    def initialize(@status_code : UInt16, @header_count : UInt16, @headers : Win32cr::Networking::HttpServer::HTTP_UNKNOWN_HEADER*)
    end
  end

  @[Extern]
  struct HTTP_TLS_SESSION_TICKET_KEYS_PARAM
    property session_ticket_key_count : UInt32
    property session_ticket_keys : Void*
    def initialize(@session_ticket_key_count : UInt32, @session_ticket_keys : Void*)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_PARAM_EX
    property param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
    property flags : UInt64
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property http2_window_size_param : Win32cr::Networking::HttpServer::HTTP2_WINDOW_SIZE_PARAM
    property http2_settings_limits_param : Win32cr::Networking::HttpServer::HTTP2_SETTINGS_LIMITS_PARAM
    property http_performance_param : Win32cr::Networking::HttpServer::HTTP_PERFORMANCE_PARAM
    property http_tls_restrictions_param : Win32cr::Networking::HttpServer::HTTP_TLS_RESTRICTIONS_PARAM
    property http_error_headers_param : Win32cr::Networking::HttpServer::HTTP_ERROR_HEADERS_PARAM
    property http_tls_session_ticket_keys_param : Win32cr::Networking::HttpServer::HTTP_TLS_SESSION_TICKET_KEYS_PARAM
    def initialize(@http2_window_size_param : Win32cr::Networking::HttpServer::HTTP2_WINDOW_SIZE_PARAM, @http2_settings_limits_param : Win32cr::Networking::HttpServer::HTTP2_SETTINGS_LIMITS_PARAM, @http_performance_param : Win32cr::Networking::HttpServer::HTTP_PERFORMANCE_PARAM, @http_tls_restrictions_param : Win32cr::Networking::HttpServer::HTTP_TLS_RESTRICTIONS_PARAM, @http_error_headers_param : Win32cr::Networking::HttpServer::HTTP_ERROR_HEADERS_PARAM, @http_tls_session_ticket_keys_param : Win32cr::Networking::HttpServer::HTTP_TLS_SESSION_TICKET_KEYS_PARAM)
    end
    end

    def initialize(@param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE, @flags : UInt64, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_SET
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY
    property param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY, @param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_SNI_SET
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    property param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY, @param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_CCS_SET
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    property param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY, @param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_SET_EX
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY_EX
    property param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY_EX, @param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_SNI_SET_EX
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    property param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY, @param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_CCS_SET_EX
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    property param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY, @param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_PARAM_EX)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_QUERY
    property query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY
    property dwToken : UInt32
    def initialize(@query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE, @key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY, @dwToken : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY
    property query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    property dwToken : UInt32
    def initialize(@query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE, @key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY, @dwToken : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_CCS_QUERY
    property query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    property dwToken : UInt32
    def initialize(@query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE, @key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY, @dwToken : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_QUERY_EX
    property query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY_EX
    property dwToken : UInt32
    property param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
    def initialize(@query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE, @key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_KEY_EX, @dwToken : UInt32, @param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY_EX
    property query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY
    property dwToken : UInt32
    property param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
    def initialize(@query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE, @key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_SNI_KEY, @dwToken : UInt32, @param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_SSL_CCS_QUERY_EX
    property query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY
    property dwToken : UInt32
    property param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE
    def initialize(@query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE, @key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_SSL_CCS_KEY, @dwToken : UInt32, @param_type : Win32cr::Networking::HttpServer::HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_IP_LISTEN_PARAM
    property addr_length : UInt16
    property pAddress : Win32cr::Networking::WinSock::SOCKADDR*
    def initialize(@addr_length : UInt16, @pAddress : Win32cr::Networking::WinSock::SOCKADDR*)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_IP_LISTEN_QUERY
    property addr_count : UInt32
    property addr_list : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*
    def initialize(@addr_count : UInt32, @addr_list : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_URLACL_KEY
    property pUrlPrefix : Win32cr::Foundation::PWSTR
    def initialize(@pUrlPrefix : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_URLACL_PARAM
    property pStringSecurityDescriptor : Win32cr::Foundation::PWSTR
    def initialize(@pStringSecurityDescriptor : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_URLACL_SET
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_KEY
    property param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_PARAM
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_KEY, @param_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_PARAM)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_URLACL_QUERY
    property query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_KEY
    property dwToken : UInt32
    def initialize(@query_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_QUERY_TYPE, @key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_URLACL_KEY, @dwToken : UInt32)
    end
  end

  @[Extern]
  struct HTTP_SERVICE_CONFIG_CACHE_SET
    property key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_CACHE_KEY
    property param_desc : UInt32
    def initialize(@key_desc : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_CACHE_KEY, @param_desc : UInt32)
    end
  end

  @[Extern]
  struct HTTP_QUERY_REQUEST_QUALIFIER_TCP
    property freshness : UInt64
    def initialize(@freshness : UInt64)
    end
  end

  @[Extern]
  struct HTTP_QUERY_REQUEST_QUALIFIER_QUIC
    property freshness : UInt64
    def initialize(@freshness : UInt64)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_PROPERTY_SNI
    property hostname : UInt16[256]
    property flags : UInt32
    def initialize(@hostname : UInt16[256], @flags : UInt32)
    end
  end

  @[Extern]
  struct HTTP_REQUEST_PROPERTY_STREAM_ERROR
    property error_code : UInt32
    def initialize(@error_code : UInt32)
    end
  end

  @[Extern]
  struct HTTP_WSK_API_TIMINGS
    property connect_count : UInt64
    property connect_sum : UInt64
    property disconnect_count : UInt64
    property disconnect_sum : UInt64
    property send_count : UInt64
    property send_sum : UInt64
    property receive_count : UInt64
    property receive_sum : UInt64
    property release_count : UInt64
    property release_sum : UInt64
    property control_socket_count : UInt64
    property control_socket_sum : UInt64
    def initialize(@connect_count : UInt64, @connect_sum : UInt64, @disconnect_count : UInt64, @disconnect_sum : UInt64, @send_count : UInt64, @send_sum : UInt64, @receive_count : UInt64, @receive_sum : UInt64, @release_count : UInt64, @release_sum : UInt64, @control_socket_count : UInt64, @control_socket_sum : UInt64)
    end
  end

  @[Extern]
  struct HTTP_QUIC_STREAM_API_TIMINGS
    property open_count : UInt64
    property open_sum : UInt64
    property close_count : UInt64
    property close_sum : UInt64
    property start_count : UInt64
    property start_sum : UInt64
    property shutdown_count : UInt64
    property shutdown_sum : UInt64
    property send_count : UInt64
    property send_sum : UInt64
    property receive_set_enabled_count : UInt64
    property receive_set_enabled_sum : UInt64
    property get_param_count : UInt64
    property get_param_sum : UInt64
    property set_param_count : UInt64
    property set_param_sum : UInt64
    property set_callback_handler_count : UInt64
    property set_callback_handler_sum : UInt64
    def initialize(@open_count : UInt64, @open_sum : UInt64, @close_count : UInt64, @close_sum : UInt64, @start_count : UInt64, @start_sum : UInt64, @shutdown_count : UInt64, @shutdown_sum : UInt64, @send_count : UInt64, @send_sum : UInt64, @receive_set_enabled_count : UInt64, @receive_set_enabled_sum : UInt64, @get_param_count : UInt64, @get_param_sum : UInt64, @set_param_count : UInt64, @set_param_sum : UInt64, @set_callback_handler_count : UInt64, @set_callback_handler_sum : UInt64)
    end
  end

  @[Extern]
  struct HTTP_QUIC_CONNECTION_API_TIMINGS
    property open_time : UInt64
    property close_time : UInt64
    property start_time : UInt64
    property shutdown_time : UInt64
    property sec_config_create_time : UInt64
    property sec_config_delete_time : UInt64
    property get_param_count : UInt64
    property get_param_sum : UInt64
    property set_param_count : UInt64
    property set_param_sum : UInt64
    property set_callback_handler_count : UInt64
    property set_callback_handler_sum : UInt64
    property control_stream_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_STREAM_API_TIMINGS
    def initialize(@open_time : UInt64, @close_time : UInt64, @start_time : UInt64, @shutdown_time : UInt64, @sec_config_create_time : UInt64, @sec_config_delete_time : UInt64, @get_param_count : UInt64, @get_param_sum : UInt64, @set_param_count : UInt64, @set_param_sum : UInt64, @set_callback_handler_count : UInt64, @set_callback_handler_sum : UInt64, @control_stream_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_STREAM_API_TIMINGS)
    end
  end

  @[Extern]
  struct HTTP_QUIC_API_TIMINGS
    property connection_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_CONNECTION_API_TIMINGS
    property stream_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_STREAM_API_TIMINGS
    def initialize(@connection_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_CONNECTION_API_TIMINGS, @stream_timings : Win32cr::Networking::HttpServer::HTTP_QUIC_STREAM_API_TIMINGS)
    end
  end

  def httpInitialize(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, flags : Win32cr::Networking::HttpServer::HTTP_INITIALIZE, pReserved : Void*) : UInt32
    C.HttpInitialize(version, flags, pReserved)
  end

  def httpTerminate(flags : Win32cr::Networking::HttpServer::HTTP_INITIALIZE, pReserved : Void*) : UInt32
    C.HttpTerminate(flags, pReserved)
  end

  def httpCreateHttpHandle(request_queue_handle : Win32cr::Foundation::HANDLE*, reserved : UInt32) : UInt32
    C.HttpCreateHttpHandle(request_queue_handle, reserved)
  end

  def httpCreateRequestQueue(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, name : Win32cr::Foundation::PWSTR, security_attributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flags : UInt32, request_queue_handle : Win32cr::Foundation::HANDLE*) : UInt32
    C.HttpCreateRequestQueue(version, name, security_attributes, flags, request_queue_handle)
  end

  def httpCloseRequestQueue(request_queue_handle : Win32cr::Foundation::HANDLE) : UInt32
    C.HttpCloseRequestQueue(request_queue_handle)
  end

  def httpSetRequestQueueProperty(request_queue_handle : Win32cr::Foundation::HANDLE, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, reserved1 : UInt32, reserved2 : Void*) : UInt32
    C.HttpSetRequestQueueProperty(request_queue_handle, property, property_information, property_information_length, reserved1, reserved2)
  end

  def httpQueryRequestQueueProperty(request_queue_handle : Win32cr::Foundation::HANDLE, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, reserved1 : UInt32, return_length : UInt32*, reserved2 : Void*) : UInt32
    C.HttpQueryRequestQueueProperty(request_queue_handle, property, property_information, property_information_length, reserved1, return_length, reserved2)
  end

  def httpSetRequestProperty(request_queue_handle : Win32cr::Foundation::HANDLE, id : UInt64, property_id : Win32cr::Networking::HttpServer::HTTP_REQUEST_PROPERTY, input : Void*, input_property_size : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpSetRequestProperty(request_queue_handle, id, property_id, input, input_property_size, overlapped)
  end

  def httpShutdownRequestQueue(request_queue_handle : Win32cr::Foundation::HANDLE) : UInt32
    C.HttpShutdownRequestQueue(request_queue_handle)
  end

  def httpReceiveClientCertificate(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, flags : UInt32, ssl_client_cert_info : Win32cr::Networking::HttpServer::HTTP_SSL_CLIENT_CERT_INFO*, ssl_client_cert_info_size : UInt32, bytes_received : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpReceiveClientCertificate(request_queue_handle, connection_id, flags, ssl_client_cert_info, ssl_client_cert_info_size, bytes_received, overlapped)
  end

  def httpCreateServerSession(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, server_session_id : UInt64*, reserved : UInt32) : UInt32
    C.HttpCreateServerSession(version, server_session_id, reserved)
  end

  def httpCloseServerSession(server_session_id : UInt64) : UInt32
    C.HttpCloseServerSession(server_session_id)
  end

  def httpQueryServerSessionProperty(server_session_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, return_length : UInt32*) : UInt32
    C.HttpQueryServerSessionProperty(server_session_id, property, property_information, property_information_length, return_length)
  end

  def httpSetServerSessionProperty(server_session_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32) : UInt32
    C.HttpSetServerSessionProperty(server_session_id, property, property_information, property_information_length)
  end

  def httpAddUrl(request_queue_handle : Win32cr::Foundation::HANDLE, fully_qualified_url : Win32cr::Foundation::PWSTR, reserved : Void*) : UInt32
    C.HttpAddUrl(request_queue_handle, fully_qualified_url, reserved)
  end

  def httpRemoveUrl(request_queue_handle : Win32cr::Foundation::HANDLE, fully_qualified_url : Win32cr::Foundation::PWSTR) : UInt32
    C.HttpRemoveUrl(request_queue_handle, fully_qualified_url)
  end

  def httpCreateUrlGroup(server_session_id : UInt64, pUrlGroupId : UInt64*, reserved : UInt32) : UInt32
    C.HttpCreateUrlGroup(server_session_id, pUrlGroupId, reserved)
  end

  def httpCloseUrlGroup(url_group_id : UInt64) : UInt32
    C.HttpCloseUrlGroup(url_group_id)
  end

  def httpAddUrlToUrlGroup(url_group_id : UInt64, pFullyQualifiedUrl : Win32cr::Foundation::PWSTR, url_context : UInt64, reserved : UInt32) : UInt32
    C.HttpAddUrlToUrlGroup(url_group_id, pFullyQualifiedUrl, url_context, reserved)
  end

  def httpRemoveUrlFromUrlGroup(url_group_id : UInt64, pFullyQualifiedUrl : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32
    C.HttpRemoveUrlFromUrlGroup(url_group_id, pFullyQualifiedUrl, flags)
  end

  def httpSetUrlGroupProperty(url_group_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32) : UInt32
    C.HttpSetUrlGroupProperty(url_group_id, property, property_information, property_information_length)
  end

  def httpQueryUrlGroupProperty(url_group_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, return_length : UInt32*) : UInt32
    C.HttpQueryUrlGroupProperty(url_group_id, property, property_information, property_information_length, return_length)
  end

  def httpPrepareUrl(reserved : Void*, flags : UInt32, url : Win32cr::Foundation::PWSTR, prepared_url : Win32cr::Foundation::PWSTR*) : UInt32
    C.HttpPrepareUrl(reserved, flags, url, prepared_url)
  end

  def httpReceiveHttpRequest(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : Win32cr::Networking::HttpServer::HTTP_RECEIVE_HTTP_REQUEST_FLAGS, request_buffer : Win32cr::Networking::HttpServer::HTTP_REQUEST_V2*, request_buffer_length : UInt32, bytes_returned : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpReceiveHttpRequest(request_queue_handle, request_id, flags, request_buffer, request_buffer_length, bytes_returned, overlapped)
  end

  def httpReceiveRequestEntityBody(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, entity_buffer : Void*, entity_buffer_length : UInt32, bytes_returned : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpReceiveRequestEntityBody(request_queue_handle, request_id, flags, entity_buffer, entity_buffer_length, bytes_returned, overlapped)
  end

  def httpSendHttpResponse(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, http_response : Win32cr::Networking::HttpServer::HTTP_RESPONSE_V2*, cache_policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY*, bytes_sent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*, log_data : Win32cr::Networking::HttpServer::HTTP_LOG_DATA*) : UInt32
    C.HttpSendHttpResponse(request_queue_handle, request_id, flags, http_response, cache_policy, bytes_sent, reserved1, reserved2, overlapped, log_data)
  end

  def httpSendResponseEntityBody(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, entity_chunk_count : UInt16, entity_chunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*, bytes_sent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*, log_data : Win32cr::Networking::HttpServer::HTTP_LOG_DATA*) : UInt32
    C.HttpSendResponseEntityBody(request_queue_handle, request_id, flags, entity_chunk_count, entity_chunks, bytes_sent, reserved1, reserved2, overlapped, log_data)
  end

  def httpDeclarePush(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, verb : Win32cr::Networking::HttpServer::HTTP_VERB, path : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PSTR, headers : Win32cr::Networking::HttpServer::HTTP_REQUEST_HEADERS*) : UInt32
    C.HttpDeclarePush(request_queue_handle, request_id, verb, path, query, headers)
  end

  def httpWaitForDisconnect(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpWaitForDisconnect(request_queue_handle, connection_id, overlapped)
  end

  def httpWaitForDisconnectEx(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, reserved : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpWaitForDisconnectEx(request_queue_handle, connection_id, reserved, overlapped)
  end

  def httpCancelHttpRequest(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpCancelHttpRequest(request_queue_handle, request_id, overlapped)
  end

  def httpWaitForDemandStart(request_queue_handle : Win32cr::Foundation::HANDLE, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpWaitForDemandStart(request_queue_handle, overlapped)
  end

  def httpIsFeatureSupported(feature_id : Win32cr::Networking::HttpServer::HTTP_FEATURE_ID) : Win32cr::Foundation::BOOL
    C.HttpIsFeatureSupported(feature_id)
  end

  def httpDelegateRequestEx(request_queue_handle : Win32cr::Foundation::HANDLE, delegate_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, delegate_url_group_id : UInt64, property_info_set_size : UInt32, property_info_set : Win32cr::Networking::HttpServer::HTTP_DELEGATE_REQUEST_PROPERTY_INFO*) : UInt32
    C.HttpDelegateRequestEx(request_queue_handle, delegate_queue_handle, request_id, delegate_url_group_id, property_info_set_size, property_info_set)
  end

  def httpFindUrlGroupId(fully_qualified_url : Win32cr::Foundation::PWSTR, request_queue_handle : Win32cr::Foundation::HANDLE, url_group_id : UInt64*) : UInt32
    C.HttpFindUrlGroupId(fully_qualified_url, request_queue_handle, url_group_id)
  end

  def httpFlushResponseCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpFlushResponseCache(request_queue_handle, url_prefix, flags, overlapped)
  end

  def httpAddFragmentToCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, data_chunk : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*, cache_policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpAddFragmentToCache(request_queue_handle, url_prefix, data_chunk, cache_policy, overlapped)
  end

  def httpReadFragmentFromCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE*, buffer : Void*, buffer_length : UInt32, bytes_read : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpReadFragmentFromCache(request_queue_handle, url_prefix, byte_range, buffer, buffer_length, bytes_read, overlapped)
  end

  def httpSetServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pConfigInformation : Void*, config_information_length : UInt32, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpSetServiceConfiguration(service_handle, config_id, pConfigInformation, config_information_length, pOverlapped)
  end

  def httpUpdateServiceConfiguration(handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, config_info : Void*, config_info_length : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpUpdateServiceConfiguration(handle, config_id, config_info, config_info_length, overlapped)
  end

  def httpDeleteServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pConfigInformation : Void*, config_information_length : UInt32, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpDeleteServiceConfiguration(service_handle, config_id, pConfigInformation, config_information_length, pOverlapped)
  end

  def httpQueryServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pInput : Void*, input_length : UInt32, pOutput : Void*, output_length : UInt32, pReturnLength : UInt32*, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.HttpQueryServiceConfiguration(service_handle, config_id, pInput, input_length, pOutput, output_length, pReturnLength, pOverlapped)
  end

  def httpGetExtension(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, extension : UInt32, buffer : Void*, buffer_size : UInt32) : UInt32
    C.HttpGetExtension(version, extension, buffer, buffer_size)
  end

  @[Link("httpapi")]
  lib C
    # :nodoc:
    fun HttpInitialize(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, flags : Win32cr::Networking::HttpServer::HTTP_INITIALIZE, pReserved : Void*) : UInt32

    # :nodoc:
    fun HttpTerminate(flags : Win32cr::Networking::HttpServer::HTTP_INITIALIZE, pReserved : Void*) : UInt32

    # :nodoc:
    fun HttpCreateHttpHandle(request_queue_handle : Win32cr::Foundation::HANDLE*, reserved : UInt32) : UInt32

    # :nodoc:
    fun HttpCreateRequestQueue(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, name : Win32cr::Foundation::PWSTR, security_attributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flags : UInt32, request_queue_handle : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun HttpCloseRequestQueue(request_queue_handle : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun HttpSetRequestQueueProperty(request_queue_handle : Win32cr::Foundation::HANDLE, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, reserved1 : UInt32, reserved2 : Void*) : UInt32

    # :nodoc:
    fun HttpQueryRequestQueueProperty(request_queue_handle : Win32cr::Foundation::HANDLE, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, reserved1 : UInt32, return_length : UInt32*, reserved2 : Void*) : UInt32

    # :nodoc:
    fun HttpSetRequestProperty(request_queue_handle : Win32cr::Foundation::HANDLE, id : UInt64, property_id : Win32cr::Networking::HttpServer::HTTP_REQUEST_PROPERTY, input : Void*, input_property_size : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpShutdownRequestQueue(request_queue_handle : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun HttpReceiveClientCertificate(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, flags : UInt32, ssl_client_cert_info : Win32cr::Networking::HttpServer::HTTP_SSL_CLIENT_CERT_INFO*, ssl_client_cert_info_size : UInt32, bytes_received : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpCreateServerSession(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, server_session_id : UInt64*, reserved : UInt32) : UInt32

    # :nodoc:
    fun HttpCloseServerSession(server_session_id : UInt64) : UInt32

    # :nodoc:
    fun HttpQueryServerSessionProperty(server_session_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, return_length : UInt32*) : UInt32

    # :nodoc:
    fun HttpSetServerSessionProperty(server_session_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32) : UInt32

    # :nodoc:
    fun HttpAddUrl(request_queue_handle : Win32cr::Foundation::HANDLE, fully_qualified_url : Win32cr::Foundation::PWSTR, reserved : Void*) : UInt32

    # :nodoc:
    fun HttpRemoveUrl(request_queue_handle : Win32cr::Foundation::HANDLE, fully_qualified_url : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun HttpCreateUrlGroup(server_session_id : UInt64, pUrlGroupId : UInt64*, reserved : UInt32) : UInt32

    # :nodoc:
    fun HttpCloseUrlGroup(url_group_id : UInt64) : UInt32

    # :nodoc:
    fun HttpAddUrlToUrlGroup(url_group_id : UInt64, pFullyQualifiedUrl : Win32cr::Foundation::PWSTR, url_context : UInt64, reserved : UInt32) : UInt32

    # :nodoc:
    fun HttpRemoveUrlFromUrlGroup(url_group_id : UInt64, pFullyQualifiedUrl : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    # :nodoc:
    fun HttpSetUrlGroupProperty(url_group_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32) : UInt32

    # :nodoc:
    fun HttpQueryUrlGroupProperty(url_group_id : UInt64, property : Win32cr::Networking::HttpServer::HTTP_SERVER_PROPERTY, property_information : Void*, property_information_length : UInt32, return_length : UInt32*) : UInt32

    # :nodoc:
    fun HttpPrepareUrl(reserved : Void*, flags : UInt32, url : Win32cr::Foundation::PWSTR, prepared_url : Win32cr::Foundation::PWSTR*) : UInt32

    # :nodoc:
    fun HttpReceiveHttpRequest(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : Win32cr::Networking::HttpServer::HTTP_RECEIVE_HTTP_REQUEST_FLAGS, request_buffer : Win32cr::Networking::HttpServer::HTTP_REQUEST_V2*, request_buffer_length : UInt32, bytes_returned : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpReceiveRequestEntityBody(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, entity_buffer : Void*, entity_buffer_length : UInt32, bytes_returned : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpSendHttpResponse(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, http_response : Win32cr::Networking::HttpServer::HTTP_RESPONSE_V2*, cache_policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY*, bytes_sent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*, log_data : Win32cr::Networking::HttpServer::HTTP_LOG_DATA*) : UInt32

    # :nodoc:
    fun HttpSendResponseEntityBody(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, flags : UInt32, entity_chunk_count : UInt16, entity_chunks : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*, bytes_sent : UInt32*, reserved1 : Void*, reserved2 : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*, log_data : Win32cr::Networking::HttpServer::HTTP_LOG_DATA*) : UInt32

    # :nodoc:
    fun HttpDeclarePush(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, verb : Win32cr::Networking::HttpServer::HTTP_VERB, path : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PSTR, headers : Win32cr::Networking::HttpServer::HTTP_REQUEST_HEADERS*) : UInt32

    # :nodoc:
    fun HttpWaitForDisconnect(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpWaitForDisconnectEx(request_queue_handle : Win32cr::Foundation::HANDLE, connection_id : UInt64, reserved : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpCancelHttpRequest(request_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpWaitForDemandStart(request_queue_handle : Win32cr::Foundation::HANDLE, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpIsFeatureSupported(feature_id : Win32cr::Networking::HttpServer::HTTP_FEATURE_ID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun HttpDelegateRequestEx(request_queue_handle : Win32cr::Foundation::HANDLE, delegate_queue_handle : Win32cr::Foundation::HANDLE, request_id : UInt64, delegate_url_group_id : UInt64, property_info_set_size : UInt32, property_info_set : Win32cr::Networking::HttpServer::HTTP_DELEGATE_REQUEST_PROPERTY_INFO*) : UInt32

    # :nodoc:
    fun HttpFindUrlGroupId(fully_qualified_url : Win32cr::Foundation::PWSTR, request_queue_handle : Win32cr::Foundation::HANDLE, url_group_id : UInt64*) : UInt32

    # :nodoc:
    fun HttpFlushResponseCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, flags : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpAddFragmentToCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, data_chunk : Win32cr::Networking::HttpServer::HTTP_DATA_CHUNK*, cache_policy : Win32cr::Networking::HttpServer::HTTP_CACHE_POLICY*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpReadFragmentFromCache(request_queue_handle : Win32cr::Foundation::HANDLE, url_prefix : Win32cr::Foundation::PWSTR, byte_range : Win32cr::Networking::HttpServer::HTTP_BYTE_RANGE*, buffer : Void*, buffer_length : UInt32, bytes_read : UInt32*, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpSetServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pConfigInformation : Void*, config_information_length : UInt32, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpUpdateServiceConfiguration(handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, config_info : Void*, config_info_length : UInt32, overlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpDeleteServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pConfigInformation : Void*, config_information_length : UInt32, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpQueryServiceConfiguration(service_handle : Win32cr::Foundation::HANDLE, config_id : Win32cr::Networking::HttpServer::HTTP_SERVICE_CONFIG_ID, pInput : Void*, input_length : UInt32, pOutput : Void*, output_length : UInt32, pReturnLength : UInt32*, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun HttpGetExtension(version : Win32cr::Networking::HttpServer::HTTPAPI_VERSION, extension : UInt32, buffer : Void*, buffer_size : UInt32) : UInt32

  end
end