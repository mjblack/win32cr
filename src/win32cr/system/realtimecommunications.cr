require "../system/com.cr"
require "../foundation.cr"
require "../media/directshow.cr"
require "../networking/winsock.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  RTCCS_FORCE_PROFILE = 1_u32
  RTCCS_FAIL_ON_REDIRECT = 2_u32
  RTCMT_AUDIO_SEND = 1_u32
  RTCMT_AUDIO_RECEIVE = 2_u32
  RTCMT_VIDEO_SEND = 4_u32
  RTCMT_VIDEO_RECEIVE = 8_u32
  RTCMT_T120_SENDRECV = 16_u32
  RTCSI_PC_TO_PC = 1_u32
  RTCSI_PC_TO_PHONE = 2_u32
  RTCSI_PHONE_TO_PHONE = 4_u32
  RTCSI_IM = 8_u32
  RTCSI_MULTIPARTY_IM = 16_u32
  RTCSI_APPLICATION = 32_u32
  RTCTR_UDP = 1_u32
  RTCTR_TCP = 2_u32
  RTCTR_TLS = 4_u32
  RTCAU_BASIC = 1_u32
  RTCAU_DIGEST = 2_u32
  RTCAU_NTLM = 4_u32
  RTCAU_KERBEROS = 8_u32
  RTCAU_USE_LOGON_CRED = 65536_u32
  RTCRF_REGISTER_INVITE_SESSIONS = 1_u32
  RTCRF_REGISTER_MESSAGE_SESSIONS = 2_u32
  RTCRF_REGISTER_PRESENCE = 4_u32
  RTCRF_REGISTER_NOTIFY = 8_u32
  RTCRF_REGISTER_ALL = 15_u32
  RTCRMF_BUDDY_ROAMING = 1_u32
  RTCRMF_WATCHER_ROAMING = 2_u32
  RTCRMF_PRESENCE_ROAMING = 4_u32
  RTCRMF_PROFILE_ROAMING = 8_u32
  RTCRMF_ALL_ROAMING = 15_u32
  RTCEF_CLIENT = 1_u32
  RTCEF_REGISTRATION_STATE_CHANGE = 2_u32
  RTCEF_SESSION_STATE_CHANGE = 4_u32
  RTCEF_SESSION_OPERATION_COMPLETE = 8_u32
  RTCEF_PARTICIPANT_STATE_CHANGE = 16_u32
  RTCEF_MEDIA = 32_u32
  RTCEF_INTENSITY = 64_u32
  RTCEF_MESSAGING = 128_u32
  RTCEF_BUDDY = 256_u32
  RTCEF_WATCHER = 512_u32
  RTCEF_PROFILE = 1024_u32
  RTCEF_USERSEARCH = 2048_u32
  RTCEF_INFO = 4096_u32
  RTCEF_GROUP = 8192_u32
  RTCEF_MEDIA_REQUEST = 16384_u32
  RTCEF_ROAMING = 65536_u32
  RTCEF_PRESENCE_PROPERTY = 131072_u32
  RTCEF_BUDDY2 = 262144_u32
  RTCEF_WATCHER2 = 524288_u32
  RTCEF_SESSION_REFER_STATUS = 1048576_u32
  RTCEF_SESSION_REFERRED = 2097152_u32
  RTCEF_REINVITE = 4194304_u32
  RTCEF_PRESENCE_DATA = 8388608_u32
  RTCEF_PRESENCE_STATUS = 16777216_u32
  RTCEF_ALL = 33554431_u32
  RTCIF_DISABLE_MEDIA = 1_u32
  RTCIF_DISABLE_UPNP = 2_u32
  RTCIF_ENABLE_SERVER_CLASS = 4_u32
  RTCIF_DISABLE_STRICT_DNS = 8_u32
  FACILITY_RTC_INTERFACE = 238_u32
  FACILITY_SIP_STATUS_CODE = 239_u32
  FACILITY_PINT_STATUS_CODE = 240_u32
  STATUS_SEVERITY_RTC_ERROR = 2_u32
  RTC_E_SIP_CODECS_DO_NOT_MATCH = -2131886080_i32
  RTC_E_SIP_STREAM_PRESENT = -2131886079_i32
  RTC_E_SIP_STREAM_NOT_PRESENT = -2131886078_i32
  RTC_E_SIP_NO_STREAM = -2131886077_i32
  RTC_E_SIP_PARSE_FAILED = -2131886076_i32
  RTC_E_SIP_HEADER_NOT_PRESENT = -2131886075_i32
  RTC_E_SDP_NOT_PRESENT = -2131886074_i32
  RTC_E_SDP_PARSE_FAILED = -2131886073_i32
  RTC_E_SDP_UPDATE_FAILED = -2131886072_i32
  RTC_E_SDP_MULTICAST = -2131886071_i32
  RTC_E_SDP_CONNECTION_ADDR = -2131886070_i32
  RTC_E_SDP_NO_MEDIA = -2131886069_i32
  RTC_E_SIP_TIMEOUT = -2131886068_i32
  RTC_E_SDP_FAILED_TO_BUILD = -2131886067_i32
  RTC_E_SIP_INVITE_TRANSACTION_PENDING = -2131886066_i32
  RTC_E_SIP_AUTH_HEADER_SENT = -2131886065_i32
  RTC_E_SIP_AUTH_TYPE_NOT_SUPPORTED = -2131886064_i32
  RTC_E_SIP_AUTH_FAILED = -2131886063_i32
  RTC_E_INVALID_SIP_URL = -2131886062_i32
  RTC_E_DESTINATION_ADDRESS_LOCAL = -2131886061_i32
  RTC_E_INVALID_ADDRESS_LOCAL = -2131886060_i32
  RTC_E_DESTINATION_ADDRESS_MULTICAST = -2131886059_i32
  RTC_E_INVALID_PROXY_ADDRESS = -2131886058_i32
  RTC_E_SIP_TRANSPORT_NOT_SUPPORTED = -2131886057_i32
  RTC_E_SIP_NEED_MORE_DATA = -2131886056_i32
  RTC_E_SIP_CALL_DISCONNECTED = -2131886055_i32
  RTC_E_SIP_REQUEST_DESTINATION_ADDR_NOT_PRESENT = -2131886054_i32
  RTC_E_SIP_UDP_SIZE_EXCEEDED = -2131886053_i32
  RTC_E_SIP_SSL_TUNNEL_FAILED = -2131886052_i32
  RTC_E_SIP_SSL_NEGOTIATION_TIMEOUT = -2131886051_i32
  RTC_E_SIP_STACK_SHUTDOWN = -2131886050_i32
  RTC_E_MEDIA_CONTROLLER_STATE = -2131886049_i32
  RTC_E_MEDIA_NEED_TERMINAL = -2131886048_i32
  RTC_E_MEDIA_AUDIO_DEVICE_NOT_AVAILABLE = -2131886047_i32
  RTC_E_MEDIA_VIDEO_DEVICE_NOT_AVAILABLE = -2131886046_i32
  RTC_E_START_STREAM = -2131886045_i32
  RTC_E_MEDIA_AEC = -2131886044_i32
  RTC_E_CLIENT_NOT_INITIALIZED = -2131886043_i32
  RTC_E_CLIENT_ALREADY_INITIALIZED = -2131886042_i32
  RTC_E_CLIENT_ALREADY_SHUT_DOWN = -2131886041_i32
  RTC_E_PRESENCE_NOT_ENABLED = -2131886040_i32
  RTC_E_INVALID_SESSION_TYPE = -2131886039_i32
  RTC_E_INVALID_SESSION_STATE = -2131886038_i32
  RTC_E_NO_PROFILE = -2131886037_i32
  RTC_E_LOCAL_PHONE_NEEDED = -2131886036_i32
  RTC_E_NO_DEVICE = -2131886035_i32
  RTC_E_INVALID_PROFILE = -2131886034_i32
  RTC_E_PROFILE_NO_PROVISION = -2131886033_i32
  RTC_E_PROFILE_NO_KEY = -2131886032_i32
  RTC_E_PROFILE_NO_NAME = -2131886031_i32
  RTC_E_PROFILE_NO_USER = -2131886030_i32
  RTC_E_PROFILE_NO_USER_URI = -2131886029_i32
  RTC_E_PROFILE_NO_SERVER = -2131886028_i32
  RTC_E_PROFILE_NO_SERVER_ADDRESS = -2131886027_i32
  RTC_E_PROFILE_NO_SERVER_PROTOCOL = -2131886026_i32
  RTC_E_PROFILE_INVALID_SERVER_PROTOCOL = -2131886025_i32
  RTC_E_PROFILE_INVALID_SERVER_AUTHMETHOD = -2131886024_i32
  RTC_E_PROFILE_INVALID_SERVER_ROLE = -2131886023_i32
  RTC_E_PROFILE_MULTIPLE_REGISTRARS = -2131886022_i32
  RTC_E_PROFILE_INVALID_SESSION = -2131886021_i32
  RTC_E_PROFILE_INVALID_SESSION_PARTY = -2131886020_i32
  RTC_E_PROFILE_INVALID_SESSION_TYPE = -2131886019_i32
  RTC_E_OPERATION_WITH_TOO_MANY_PARTICIPANTS = -2131886018_i32
  RTC_E_BASIC_AUTH_SET_TLS = -2131886017_i32
  RTC_E_SIP_HIGH_SECURITY_SET_TLS = -2131886016_i32
  RTC_S_ROAMING_NOT_SUPPORTED = 15597633_i32
  RTC_E_PROFILE_SERVER_UNAUTHORIZED = -2131886014_i32
  RTC_E_DUPLICATE_REALM = -2131886013_i32
  RTC_E_POLICY_NOT_ALLOW = -2131886012_i32
  RTC_E_PORT_MAPPING_UNAVAILABLE = -2131886011_i32
  RTC_E_PORT_MAPPING_FAILED = -2131886010_i32
  RTC_E_SECURITY_LEVEL_NOT_COMPATIBLE = -2131886009_i32
  RTC_E_SECURITY_LEVEL_NOT_DEFINED = -2131886008_i32
  RTC_E_SECURITY_LEVEL_NOT_SUPPORTED_BY_PARTICIPANT = -2131886007_i32
  RTC_E_DUPLICATE_BUDDY = -2131886006_i32
  RTC_E_DUPLICATE_WATCHER = -2131886005_i32
  RTC_E_MALFORMED_XML = -2131886004_i32
  RTC_E_ROAMING_OPERATION_INTERRUPTED = -2131886003_i32
  RTC_E_ROAMING_FAILED = -2131886002_i32
  RTC_E_INVALID_BUDDY_LIST = -2131886001_i32
  RTC_E_INVALID_ACL_LIST = -2131886000_i32
  RTC_E_NO_GROUP = -2131885999_i32
  RTC_E_DUPLICATE_GROUP = -2131885998_i32
  RTC_E_TOO_MANY_GROUPS = -2131885997_i32
  RTC_E_NO_BUDDY = -2131885996_i32
  RTC_E_NO_WATCHER = -2131885995_i32
  RTC_E_NO_REALM = -2131885994_i32
  RTC_E_NO_TRANSPORT = -2131885993_i32
  RTC_E_NOT_EXIST = -2131885992_i32
  RTC_E_INVALID_PREFERENCE_LIST = -2131885991_i32
  RTC_E_MAX_PENDING_OPERATIONS = -2131885990_i32
  RTC_E_TOO_MANY_RETRIES = -2131885989_i32
  RTC_E_INVALID_PORTRANGE = -2131885988_i32
  RTC_E_SIP_CALL_CONNECTION_NOT_ESTABLISHED = -2131885987_i32
  RTC_E_SIP_ADDITIONAL_PARTY_IN_TWO_PARTY_SESSION = -2131885986_i32
  RTC_E_SIP_PARTY_ALREADY_IN_SESSION = -2131885985_i32
  RTC_E_SIP_OTHER_PARTY_JOIN_IN_PROGRESS = -2131885984_i32
  RTC_E_INVALID_OBJECT_STATE = -2131885983_i32
  RTC_E_PRESENCE_ENABLED = -2131885982_i32
  RTC_E_ROAMING_ENABLED = -2131885981_i32
  RTC_E_SIP_TLS_INCOMPATIBLE_ENCRYPTION = -2131885980_i32
  RTC_E_SIP_INVALID_CERTIFICATE = -2131885979_i32
  RTC_E_SIP_DNS_FAIL = -2131885978_i32
  RTC_E_SIP_TCP_FAIL = -2131885977_i32
  RTC_E_TOO_SMALL_EXPIRES_VALUE = -2131885976_i32
  RTC_E_SIP_TLS_FAIL = -2131885975_i32
  RTC_E_NOT_PRESENCE_PROFILE = -2131885974_i32
  RTC_E_SIP_INVITEE_PARTY_TIMEOUT = -2131885973_i32
  RTC_E_SIP_AUTH_TIME_SKEW = -2131885972_i32
  RTC_E_INVALID_REGISTRATION_STATE = -2131885971_i32
  RTC_E_MEDIA_DISABLED = -2131885970_i32
  RTC_E_MEDIA_ENABLED = -2131885969_i32
  RTC_E_REFER_NOT_ACCEPTED = -2131885968_i32
  RTC_E_REFER_NOT_ALLOWED = -2131885967_i32
  RTC_E_REFER_NOT_EXIST = -2131885966_i32
  RTC_E_SIP_HOLD_OPERATION_PENDING = -2131885965_i32
  RTC_E_SIP_UNHOLD_OPERATION_PENDING = -2131885964_i32
  RTC_E_MEDIA_SESSION_NOT_EXIST = -2131885963_i32
  RTC_E_MEDIA_SESSION_IN_HOLD = -2131885962_i32
  RTC_E_ANOTHER_MEDIA_SESSION_ACTIVE = -2131885961_i32
  RTC_E_MAX_REDIRECTS = -2131885960_i32
  RTC_E_REDIRECT_PROCESSING_FAILED = -2131885959_i32
  RTC_E_LISTENING_SOCKET_NOT_EXIST = -2131885958_i32
  RTC_E_INVALID_LISTEN_SOCKET = -2131885957_i32
  RTC_E_PORT_MANAGER_ALREADY_SET = -2131885956_i32
  RTC_E_SECURITY_LEVEL_ALREADY_SET = -2131885955_i32
  RTC_E_UDP_NOT_SUPPORTED = -2131885954_i32
  RTC_E_SIP_REFER_OPERATION_PENDING = -2131885953_i32
  RTC_E_PLATFORM_NOT_SUPPORTED = -2131885952_i32
  RTC_E_SIP_PEER_PARTICIPANT_IN_MULTIPARTY_SESSION = -2131885951_i32
  RTC_E_NOT_ALLOWED = -2131885950_i32
  RTC_E_REGISTRATION_DEACTIVATED = -2131885949_i32
  RTC_E_REGISTRATION_REJECTED = -2131885948_i32
  RTC_E_REGISTRATION_UNREGISTERED = -2131885947_i32
  RTC_E_STATUS_INFO_TRYING = 15663204_i32
  RTC_E_STATUS_INFO_RINGING = 15663284_i32
  RTC_E_STATUS_INFO_CALL_FORWARDING = 15663285_i32
  RTC_E_STATUS_INFO_QUEUED = 15663286_i32
  RTC_E_STATUS_SESSION_PROGRESS = 15663287_i32
  RTC_E_STATUS_SUCCESS = 15663304_i32
  RTC_E_STATUS_REDIRECT_MULTIPLE_CHOICES = -2131820244_i32
  RTC_E_STATUS_REDIRECT_MOVED_PERMANENTLY = -2131820243_i32
  RTC_E_STATUS_REDIRECT_MOVED_TEMPORARILY = -2131820242_i32
  RTC_E_STATUS_REDIRECT_SEE_OTHER = -2131820241_i32
  RTC_E_STATUS_REDIRECT_USE_PROXY = -2131820239_i32
  RTC_E_STATUS_REDIRECT_ALTERNATIVE_SERVICE = -2131820164_i32
  RTC_E_STATUS_CLIENT_BAD_REQUEST = -2131820144_i32
  RTC_E_STATUS_CLIENT_UNAUTHORIZED = -2131820143_i32
  RTC_E_STATUS_CLIENT_PAYMENT_REQUIRED = -2131820142_i32
  RTC_E_STATUS_CLIENT_FORBIDDEN = -2131820141_i32
  RTC_E_STATUS_CLIENT_NOT_FOUND = -2131820140_i32
  RTC_E_STATUS_CLIENT_METHOD_NOT_ALLOWED = -2131820139_i32
  RTC_E_STATUS_CLIENT_NOT_ACCEPTABLE = -2131820138_i32
  RTC_E_STATUS_CLIENT_PROXY_AUTHENTICATION_REQUIRED = -2131820137_i32
  RTC_E_STATUS_CLIENT_REQUEST_TIMEOUT = -2131820136_i32
  RTC_E_STATUS_CLIENT_CONFLICT = -2131820135_i32
  RTC_E_STATUS_CLIENT_GONE = -2131820134_i32
  RTC_E_STATUS_CLIENT_LENGTH_REQUIRED = -2131820133_i32
  RTC_E_STATUS_CLIENT_REQUEST_ENTITY_TOO_LARGE = -2131820131_i32
  RTC_E_STATUS_CLIENT_REQUEST_URI_TOO_LARGE = -2131820130_i32
  RTC_E_STATUS_CLIENT_UNSUPPORTED_MEDIA_TYPE = -2131820129_i32
  RTC_E_STATUS_CLIENT_BAD_EXTENSION = -2131820124_i32
  RTC_E_STATUS_CLIENT_TEMPORARILY_NOT_AVAILABLE = -2131820064_i32
  RTC_E_STATUS_CLIENT_TRANSACTION_DOES_NOT_EXIST = -2131820063_i32
  RTC_E_STATUS_CLIENT_LOOP_DETECTED = -2131820062_i32
  RTC_E_STATUS_CLIENT_TOO_MANY_HOPS = -2131820061_i32
  RTC_E_STATUS_CLIENT_ADDRESS_INCOMPLETE = -2131820060_i32
  RTC_E_STATUS_CLIENT_AMBIGUOUS = -2131820059_i32
  RTC_E_STATUS_CLIENT_BUSY_HERE = -2131820058_i32
  RTC_E_STATUS_REQUEST_TERMINATED = -2131820057_i32
  RTC_E_STATUS_NOT_ACCEPTABLE_HERE = -2131820056_i32
  RTC_E_STATUS_SERVER_INTERNAL_ERROR = -2131820044_i32
  RTC_E_STATUS_SERVER_NOT_IMPLEMENTED = -2131820043_i32
  RTC_E_STATUS_SERVER_BAD_GATEWAY = -2131820042_i32
  RTC_E_STATUS_SERVER_SERVICE_UNAVAILABLE = -2131820041_i32
  RTC_E_STATUS_SERVER_SERVER_TIMEOUT = -2131820040_i32
  RTC_E_STATUS_SERVER_VERSION_NOT_SUPPORTED = -2131820039_i32
  RTC_E_STATUS_GLOBAL_BUSY_EVERYWHERE = -2131819944_i32
  RTC_E_STATUS_GLOBAL_DECLINE = -2131819941_i32
  RTC_E_STATUS_GLOBAL_DOES_NOT_EXIST_ANYWHERE = -2131819940_i32
  RTC_E_STATUS_GLOBAL_NOT_ACCEPTABLE = -2131819938_i32
  RTC_E_PINT_STATUS_REJECTED_BUSY = -2131755003_i32
  RTC_E_PINT_STATUS_REJECTED_NO_ANSWER = -2131755002_i32
  RTC_E_PINT_STATUS_REJECTED_ALL_BUSY = -2131755001_i32
  RTC_E_PINT_STATUS_REJECTED_PL_FAILED = -2131755000_i32
  RTC_E_PINT_STATUS_REJECTED_SW_FAILED = -2131754999_i32
  RTC_E_PINT_STATUS_REJECTED_CANCELLED = -2131754998_i32
  RTC_E_PINT_STATUS_REJECTED_BADNUMBER = -2131754997_i32
  RTCClient = LibC::GUID.new(0x7a42ea29_u32, 0xa2b7_u16, 0x40c4_u16, StaticArray[0xb0_u8, 0x91_u8, 0xf6_u8, 0xf0_u8, 0x24_u8, 0xaa_u8, 0x89_u8, 0xbe_u8])


  enum RTC_AUDIO_DEVICE : Int32
    RTCAD_SPEAKER = 0
    RTCAD_MICROPHONE = 1
  end

  enum RTC_VIDEO_DEVICE : Int32
    RTCVD_RECEIVE = 0
    RTCVD_PREVIEW = 1
  end

  enum RTC_EVENT : Int32
    RTCE_CLIENT = 0
    RTCE_REGISTRATION_STATE_CHANGE = 1
    RTCE_SESSION_STATE_CHANGE = 2
    RTCE_SESSION_OPERATION_COMPLETE = 3
    RTCE_PARTICIPANT_STATE_CHANGE = 4
    RTCE_MEDIA = 5
    RTCE_INTENSITY = 6
    RTCE_MESSAGING = 7
    RTCE_BUDDY = 8
    RTCE_WATCHER = 9
    RTCE_PROFILE = 10
    RTCE_USERSEARCH = 11
    RTCE_INFO = 12
    RTCE_GROUP = 13
    RTCE_MEDIA_REQUEST = 14
    RTCE_ROAMING = 15
    RTCE_PRESENCE_PROPERTY = 16
    RTCE_PRESENCE_DATA = 17
    RTCE_PRESENCE_STATUS = 18
    RTCE_SESSION_REFER_STATUS = 19
    RTCE_SESSION_REFERRED = 20
    RTCE_REINVITE = 21
  end

  enum RTC_LISTEN_MODE : Int32
    RTCLM_NONE = 0
    RTCLM_DYNAMIC = 1
    RTCLM_BOTH = 2
  end

  enum RTC_CLIENT_EVENT_TYPE : Int32
    RTCCET_VOLUME_CHANGE = 0
    RTCCET_DEVICE_CHANGE = 1
    RTCCET_NETWORK_QUALITY_CHANGE = 2
    RTCCET_ASYNC_CLEANUP_DONE = 3
  end

  enum RTC_BUDDY_EVENT_TYPE : Int32
    RTCBET_BUDDY_ADD = 0
    RTCBET_BUDDY_REMOVE = 1
    RTCBET_BUDDY_UPDATE = 2
    RTCBET_BUDDY_STATE_CHANGE = 3
    RTCBET_BUDDY_ROAMED = 4
    RTCBET_BUDDY_SUBSCRIBED = 5
  end

  enum RTC_WATCHER_EVENT_TYPE : Int32
    RTCWET_WATCHER_ADD = 0
    RTCWET_WATCHER_REMOVE = 1
    RTCWET_WATCHER_UPDATE = 2
    RTCWET_WATCHER_OFFERING = 3
    RTCWET_WATCHER_ROAMED = 4
  end

  enum RTC_GROUP_EVENT_TYPE : Int32
    RTCGET_GROUP_ADD = 0
    RTCGET_GROUP_REMOVE = 1
    RTCGET_GROUP_UPDATE = 2
    RTCGET_GROUP_BUDDY_ADD = 3
    RTCGET_GROUP_BUDDY_REMOVE = 4
    RTCGET_GROUP_ROAMED = 5
  end

  enum RTC_TERMINATE_REASON : Int32
    RTCTR_NORMAL = 0
    RTCTR_DND = 1
    RTCTR_BUSY = 2
    RTCTR_REJECT = 3
    RTCTR_TIMEOUT = 4
    RTCTR_SHUTDOWN = 5
    RTCTR_INSUFFICIENT_SECURITY_LEVEL = 6
    RTCTR_NOT_SUPPORTED = 7
  end

  enum RTC_REGISTRATION_STATE : Int32
    RTCRS_NOT_REGISTERED = 0
    RTCRS_REGISTERING = 1
    RTCRS_REGISTERED = 2
    RTCRS_REJECTED = 3
    RTCRS_UNREGISTERING = 4
    RTCRS_ERROR = 5
    RTCRS_LOGGED_OFF = 6
    RTCRS_LOCAL_PA_LOGGED_OFF = 7
    RTCRS_REMOTE_PA_LOGGED_OFF = 8
  end

  enum RTC_SESSION_STATE : Int32
    RTCSS_IDLE = 0
    RTCSS_INCOMING = 1
    RTCSS_ANSWERING = 2
    RTCSS_INPROGRESS = 3
    RTCSS_CONNECTED = 4
    RTCSS_DISCONNECTED = 5
    RTCSS_HOLD = 6
    RTCSS_REFER = 7
  end

  enum RTC_PARTICIPANT_STATE : Int32
    RTCPS_IDLE = 0
    RTCPS_PENDING = 1
    RTCPS_INCOMING = 2
    RTCPS_ANSWERING = 3
    RTCPS_INPROGRESS = 4
    RTCPS_ALERTING = 5
    RTCPS_CONNECTED = 6
    RTCPS_DISCONNECTING = 7
    RTCPS_DISCONNECTED = 8
  end

  enum RTC_WATCHER_STATE : Int32
    RTCWS_UNKNOWN = 0
    RTCWS_OFFERING = 1
    RTCWS_ALLOWED = 2
    RTCWS_BLOCKED = 3
    RTCWS_DENIED = 4
    RTCWS_PROMPT = 5
  end

  enum RTC_ACE_SCOPE : Int32
    RTCAS_SCOPE_USER = 0
    RTCAS_SCOPE_DOMAIN = 1
    RTCAS_SCOPE_ALL = 2
  end

  enum RTC_OFFER_WATCHER_MODE : Int32
    RTCOWM_OFFER_WATCHER_EVENT = 0
    RTCOWM_AUTOMATICALLY_ADD_WATCHER = 1
  end

  enum RTC_WATCHER_MATCH_MODE : Int32
    RTCWMM_EXACT_MATCH = 0
    RTCWMM_BEST_ACE_MATCH = 1
  end

  enum RTC_PRIVACY_MODE : Int32
    RTCPM_BLOCK_LIST_EXCLUDED = 0
    RTCPM_ALLOW_LIST_ONLY = 1
  end

  enum RTC_SESSION_TYPE : Int32
    RTCST_PC_TO_PC = 0
    RTCST_PC_TO_PHONE = 1
    RTCST_PHONE_TO_PHONE = 2
    RTCST_IM = 3
    RTCST_MULTIPARTY_IM = 4
    RTCST_APPLICATION = 5
  end

  enum RTC_PRESENCE_STATUS : Int32
    RTCXS_PRESENCE_OFFLINE = 0
    RTCXS_PRESENCE_ONLINE = 1
    RTCXS_PRESENCE_AWAY = 2
    RTCXS_PRESENCE_IDLE = 3
    RTCXS_PRESENCE_BUSY = 4
    RTCXS_PRESENCE_BE_RIGHT_BACK = 5
    RTCXS_PRESENCE_ON_THE_PHONE = 6
    RTCXS_PRESENCE_OUT_TO_LUNCH = 7
  end

  enum RTC_BUDDY_SUBSCRIPTION_TYPE : Int32
    RTCBT_SUBSCRIBED = 0
    RTCBT_ALWAYS_OFFLINE = 1
    RTCBT_ALWAYS_ONLINE = 2
    RTCBT_POLL = 3
  end

  enum RTC_MEDIA_EVENT_TYPE : Int32
    RTCMET_STOPPED = 0
    RTCMET_STARTED = 1
    RTCMET_FAILED = 2
  end

  enum RTC_MEDIA_EVENT_REASON : Int32
    RTCMER_NORMAL = 0
    RTCMER_HOLD = 1
    RTCMER_TIMEOUT = 2
    RTCMER_BAD_DEVICE = 3
    RTCMER_NO_PORT = 4
    RTCMER_PORT_MAPPING_FAILED = 5
    RTCMER_REMOTE_REQUEST = 6
  end

  enum RTC_MESSAGING_EVENT_TYPE : Int32
    RTCMSET_MESSAGE = 0
    RTCMSET_STATUS = 1
  end

  enum RTC_MESSAGING_USER_STATUS : Int32
    RTCMUS_IDLE = 0
    RTCMUS_TYPING = 1
  end

  enum RTC_DTMF : Int32
    RTC_DTMF_0 = 0
    RTC_DTMF_1 = 1
    RTC_DTMF_2 = 2
    RTC_DTMF_3 = 3
    RTC_DTMF_4 = 4
    RTC_DTMF_5 = 5
    RTC_DTMF_6 = 6
    RTC_DTMF_7 = 7
    RTC_DTMF_8 = 8
    RTC_DTMF_9 = 9
    RTC_DTMF_STAR = 10
    RTC_DTMF_POUND = 11
    RTC_DTMF_A = 12
    RTC_DTMF_B = 13
    RTC_DTMF_C = 14
    RTC_DTMF_D = 15
    RTC_DTMF_FLASH = 16
  end

  enum RTC_PROVIDER_URI : Int32
    RTCPU_URIHOMEPAGE = 0
    RTCPU_URIHELPDESK = 1
    RTCPU_URIPERSONALACCOUNT = 2
    RTCPU_URIDISPLAYDURINGCALL = 3
    RTCPU_URIDISPLAYDURINGIDLE = 4
  end

  enum RTC_RING_TYPE : Int32
    RTCRT_PHONE = 0
    RTCRT_MESSAGE = 1
    RTCRT_RINGBACK = 2
  end

  enum RTC_T120_APPLET : Int32
    RTCTA_WHITEBOARD = 0
    RTCTA_APPSHARING = 1
  end

  enum RTC_PORT_TYPE : Int32
    RTCPT_AUDIO_RTP = 0
    RTCPT_AUDIO_RTCP = 1
    RTCPT_VIDEO_RTP = 2
    RTCPT_VIDEO_RTCP = 3
    RTCPT_SIP = 4
  end

  enum RTC_USER_SEARCH_COLUMN : Int32
    RTCUSC_URI = 0
    RTCUSC_DISPLAYNAME = 1
    RTCUSC_TITLE = 2
    RTCUSC_OFFICE = 3
    RTCUSC_PHONE = 4
    RTCUSC_COMPANY = 5
    RTCUSC_CITY = 6
    RTCUSC_STATE = 7
    RTCUSC_COUNTRY = 8
    RTCUSC_EMAIL = 9
  end

  enum RTC_USER_SEARCH_PREFERENCE : Int32
    RTCUSP_MAX_MATCHES = 0
    RTCUSP_TIME_LIMIT = 1
  end

  enum RTC_ROAMING_EVENT_TYPE : Int32
    RTCRET_BUDDY_ROAMING = 0
    RTCRET_WATCHER_ROAMING = 1
    RTCRET_PRESENCE_ROAMING = 2
    RTCRET_PROFILE_ROAMING = 3
    RTCRET_WPENDING_ROAMING = 4
  end

  enum RTC_PROFILE_EVENT_TYPE : Int32
    RTCPFET_PROFILE_GET = 0
    RTCPFET_PROFILE_UPDATE = 1
  end

  enum RTC_ANSWER_MODE : Int32
    RTCAM_OFFER_SESSION_EVENT = 0
    RTCAM_AUTOMATICALLY_ACCEPT = 1
    RTCAM_AUTOMATICALLY_REJECT = 2
    RTCAM_NOT_SUPPORTED = 3
  end

  enum RTC_SESSION_REFER_STATUS : Int32
    RTCSRS_REFERRING = 0
    RTCSRS_ACCEPTED = 1
    RTCSRS_ERROR = 2
    RTCSRS_REJECTED = 3
    RTCSRS_DROPPED = 4
    RTCSRS_DONE = 5
  end

  enum RTC_PRESENCE_PROPERTY : Int32
    RTCPP_PHONENUMBER = 0
    RTCPP_DISPLAYNAME = 1
    RTCPP_EMAIL = 2
    RTCPP_DEVICE_NAME = 3
    RTCPP_MULTIPLE = 4
  end

  enum RTC_SECURITY_TYPE : Int32
    RTCSECT_AUDIO_VIDEO_MEDIA_ENCRYPTION = 0
    RTCSECT_T120_MEDIA_ENCRYPTION = 1
  end

  enum RTC_SECURITY_LEVEL : Int32
    RTCSECL_UNSUPPORTED = 1
    RTCSECL_SUPPORTED = 2
    RTCSECL_REQUIRED = 3
  end

  enum RTC_REINVITE_STATE : Int32
    RTCRIN_INCOMING = 0
    RTCRIN_SUCCEEDED = 1
    RTCRIN_FAIL = 2
  end

  struct TRANSPORT_SETTING
    setting_id : TRANSPORT_SETTING_ID
    length : UInt32*
    value : UInt8*
  end


  struct IRTCClientVTbl
    query_interface : Proc(IRTCClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClient*, UInt32)
    release : Proc(IRTCClient*, UInt32)
    initialize : Proc(IRTCClient*, HRESULT)
    shutdown : Proc(IRTCClient*, HRESULT)
    prepare_for_shutdown : Proc(IRTCClient*, HRESULT)
    put_event_filter : Proc(IRTCClient*, Int32, HRESULT)
    get_event_filter : Proc(IRTCClient*, Int32*, HRESULT)
    set_preferred_media_types : Proc(IRTCClient*, Int32, Int16, HRESULT)
    get_preferred_media_types : Proc(IRTCClient*, Int32*, HRESULT)
    get_media_capabilities : Proc(IRTCClient*, Int32*, HRESULT)
    create_session : Proc(IRTCClient*, RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, IRTCSession*, HRESULT)
    put_listen_for_incoming_sessions : Proc(IRTCClient*, RTC_LISTEN_MODE, HRESULT)
    get_listen_for_incoming_sessions : Proc(IRTCClient*, RTC_LISTEN_MODE*, HRESULT)
    get_network_addresses : Proc(IRTCClient*, Int16, Int16, VARIANT*, HRESULT)
    put_volume : Proc(IRTCClient*, RTC_AUDIO_DEVICE, Int32, HRESULT)
    get_volume : Proc(IRTCClient*, RTC_AUDIO_DEVICE, Int32*, HRESULT)
    put_audio_muted : Proc(IRTCClient*, RTC_AUDIO_DEVICE, Int16, HRESULT)
    get_audio_muted : Proc(IRTCClient*, RTC_AUDIO_DEVICE, Int16*, HRESULT)
    get_i_video_window : Proc(IRTCClient*, RTC_VIDEO_DEVICE, IVideoWindow*, HRESULT)
    put_preferred_audio_device : Proc(IRTCClient*, RTC_AUDIO_DEVICE, UInt8*, HRESULT)
    get_preferred_audio_device : Proc(IRTCClient*, RTC_AUDIO_DEVICE, UInt8**, HRESULT)
    put_preferred_volume : Proc(IRTCClient*, RTC_AUDIO_DEVICE, Int32, HRESULT)
    get_preferred_volume : Proc(IRTCClient*, RTC_AUDIO_DEVICE, Int32*, HRESULT)
    put_preferred_aec : Proc(IRTCClient*, Int16, HRESULT)
    get_preferred_aec : Proc(IRTCClient*, Int16*, HRESULT)
    put_preferred_video_device : Proc(IRTCClient*, UInt8*, HRESULT)
    get_preferred_video_device : Proc(IRTCClient*, UInt8**, HRESULT)
    get_active_media : Proc(IRTCClient*, Int32*, HRESULT)
    put_max_bitrate : Proc(IRTCClient*, Int32, HRESULT)
    get_max_bitrate : Proc(IRTCClient*, Int32*, HRESULT)
    put_temporal_spatial_trade_off : Proc(IRTCClient*, Int32, HRESULT)
    get_temporal_spatial_trade_off : Proc(IRTCClient*, Int32*, HRESULT)
    get_network_quality : Proc(IRTCClient*, Int32*, HRESULT)
    start_t120_applet : Proc(IRTCClient*, RTC_T120_APPLET, HRESULT)
    stop_t120_applets : Proc(IRTCClient*, HRESULT)
    get_is_t120_applet_running : Proc(IRTCClient*, RTC_T120_APPLET, Int16*, HRESULT)
    get_local_user_uri : Proc(IRTCClient*, UInt8**, HRESULT)
    put_local_user_uri : Proc(IRTCClient*, UInt8*, HRESULT)
    get_local_user_name : Proc(IRTCClient*, UInt8**, HRESULT)
    put_local_user_name : Proc(IRTCClient*, UInt8*, HRESULT)
    play_ring : Proc(IRTCClient*, RTC_RING_TYPE, Int16, HRESULT)
    send_dtmf : Proc(IRTCClient*, RTC_DTMF, HRESULT)
    invoke_tuning_wizard : Proc(IRTCClient*, LibC::IntPtrT, HRESULT)
    get_is_tuned : Proc(IRTCClient*, Int16*, HRESULT)
  end

  struct IRTCClient
    lpVtbl : IRTCClientVTbl*
  end

  struct IRTCClient2VTbl
    query_interface : Proc(IRTCClient2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClient2*, UInt32)
    release : Proc(IRTCClient2*, UInt32)
    initialize : Proc(IRTCClient2*, HRESULT)
    shutdown : Proc(IRTCClient2*, HRESULT)
    prepare_for_shutdown : Proc(IRTCClient2*, HRESULT)
    put_event_filter : Proc(IRTCClient2*, Int32, HRESULT)
    get_event_filter : Proc(IRTCClient2*, Int32*, HRESULT)
    set_preferred_media_types : Proc(IRTCClient2*, Int32, Int16, HRESULT)
    get_preferred_media_types : Proc(IRTCClient2*, Int32*, HRESULT)
    get_media_capabilities : Proc(IRTCClient2*, Int32*, HRESULT)
    create_session : Proc(IRTCClient2*, RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, IRTCSession*, HRESULT)
    put_listen_for_incoming_sessions : Proc(IRTCClient2*, RTC_LISTEN_MODE, HRESULT)
    get_listen_for_incoming_sessions : Proc(IRTCClient2*, RTC_LISTEN_MODE*, HRESULT)
    get_network_addresses : Proc(IRTCClient2*, Int16, Int16, VARIANT*, HRESULT)
    put_volume : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, Int32, HRESULT)
    get_volume : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, Int32*, HRESULT)
    put_audio_muted : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, Int16, HRESULT)
    get_audio_muted : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, Int16*, HRESULT)
    get_i_video_window : Proc(IRTCClient2*, RTC_VIDEO_DEVICE, IVideoWindow*, HRESULT)
    put_preferred_audio_device : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, UInt8*, HRESULT)
    get_preferred_audio_device : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, UInt8**, HRESULT)
    put_preferred_volume : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, Int32, HRESULT)
    get_preferred_volume : Proc(IRTCClient2*, RTC_AUDIO_DEVICE, Int32*, HRESULT)
    put_preferred_aec : Proc(IRTCClient2*, Int16, HRESULT)
    get_preferred_aec : Proc(IRTCClient2*, Int16*, HRESULT)
    put_preferred_video_device : Proc(IRTCClient2*, UInt8*, HRESULT)
    get_preferred_video_device : Proc(IRTCClient2*, UInt8**, HRESULT)
    get_active_media : Proc(IRTCClient2*, Int32*, HRESULT)
    put_max_bitrate : Proc(IRTCClient2*, Int32, HRESULT)
    get_max_bitrate : Proc(IRTCClient2*, Int32*, HRESULT)
    put_temporal_spatial_trade_off : Proc(IRTCClient2*, Int32, HRESULT)
    get_temporal_spatial_trade_off : Proc(IRTCClient2*, Int32*, HRESULT)
    get_network_quality : Proc(IRTCClient2*, Int32*, HRESULT)
    start_t120_applet : Proc(IRTCClient2*, RTC_T120_APPLET, HRESULT)
    stop_t120_applets : Proc(IRTCClient2*, HRESULT)
    get_is_t120_applet_running : Proc(IRTCClient2*, RTC_T120_APPLET, Int16*, HRESULT)
    get_local_user_uri : Proc(IRTCClient2*, UInt8**, HRESULT)
    put_local_user_uri : Proc(IRTCClient2*, UInt8*, HRESULT)
    get_local_user_name : Proc(IRTCClient2*, UInt8**, HRESULT)
    put_local_user_name : Proc(IRTCClient2*, UInt8*, HRESULT)
    play_ring : Proc(IRTCClient2*, RTC_RING_TYPE, Int16, HRESULT)
    send_dtmf : Proc(IRTCClient2*, RTC_DTMF, HRESULT)
    invoke_tuning_wizard : Proc(IRTCClient2*, LibC::IntPtrT, HRESULT)
    get_is_tuned : Proc(IRTCClient2*, Int16*, HRESULT)
    put_answer_mode : Proc(IRTCClient2*, RTC_SESSION_TYPE, RTC_ANSWER_MODE, HRESULT)
    get_answer_mode : Proc(IRTCClient2*, RTC_SESSION_TYPE, RTC_ANSWER_MODE*, HRESULT)
    invoke_tuning_wizard_ex : Proc(IRTCClient2*, LibC::IntPtrT, Int16, Int16, HRESULT)
    get_version : Proc(IRTCClient2*, Int32*, HRESULT)
    put_client_name : Proc(IRTCClient2*, UInt8*, HRESULT)
    put_client_cur_ver : Proc(IRTCClient2*, UInt8*, HRESULT)
    initialize_ex : Proc(IRTCClient2*, Int32, HRESULT)
    create_session_with_description : Proc(IRTCClient2*, UInt8*, UInt8*, IRTCProfile, Int32, IRTCSession2*, HRESULT)
    set_session_description_manager : Proc(IRTCClient2*, IRTCSessionDescriptionManager, HRESULT)
    put_preferred_security_level : Proc(IRTCClient2*, RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL, HRESULT)
    get_preferred_security_level : Proc(IRTCClient2*, RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)
    put_allowed_ports : Proc(IRTCClient2*, Int32, RTC_LISTEN_MODE, HRESULT)
    get_allowed_ports : Proc(IRTCClient2*, Int32, RTC_LISTEN_MODE*, HRESULT)
  end

  struct IRTCClient2
    lpVtbl : IRTCClient2VTbl*
  end

  struct IRTCClientPresenceVTbl
    query_interface : Proc(IRTCClientPresence*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClientPresence*, UInt32)
    release : Proc(IRTCClientPresence*, UInt32)
    enable_presence : Proc(IRTCClientPresence*, Int16, VARIANT, HRESULT)
    export : Proc(IRTCClientPresence*, VARIANT, HRESULT)
    import : Proc(IRTCClientPresence*, VARIANT, Int16, HRESULT)
    enumerate_buddies : Proc(IRTCClientPresence*, IRTCEnumBuddies*, HRESULT)
    get_buddies : Proc(IRTCClientPresence*, IRTCCollection*, HRESULT)
    get_buddy : Proc(IRTCClientPresence*, UInt8*, IRTCBuddy*, HRESULT)
    add_buddy : Proc(IRTCClientPresence*, UInt8*, UInt8*, UInt8*, Int16, IRTCProfile, Int32, IRTCBuddy*, HRESULT)
    remove_buddy : Proc(IRTCClientPresence*, IRTCBuddy, HRESULT)
    enumerate_watchers : Proc(IRTCClientPresence*, IRTCEnumWatchers*, HRESULT)
    get_watchers : Proc(IRTCClientPresence*, IRTCCollection*, HRESULT)
    get_watcher : Proc(IRTCClientPresence*, UInt8*, IRTCWatcher*, HRESULT)
    add_watcher : Proc(IRTCClientPresence*, UInt8*, UInt8*, UInt8*, Int16, Int16, IRTCWatcher*, HRESULT)
    remove_watcher : Proc(IRTCClientPresence*, IRTCWatcher, HRESULT)
    set_local_presence_info : Proc(IRTCClientPresence*, RTC_PRESENCE_STATUS, UInt8*, HRESULT)
    get_offer_watcher_mode : Proc(IRTCClientPresence*, RTC_OFFER_WATCHER_MODE*, HRESULT)
    put_offer_watcher_mode : Proc(IRTCClientPresence*, RTC_OFFER_WATCHER_MODE, HRESULT)
    get_privacy_mode : Proc(IRTCClientPresence*, RTC_PRIVACY_MODE*, HRESULT)
    put_privacy_mode : Proc(IRTCClientPresence*, RTC_PRIVACY_MODE, HRESULT)
  end

  struct IRTCClientPresence
    lpVtbl : IRTCClientPresenceVTbl*
  end

  struct IRTCClientPresence2VTbl
    query_interface : Proc(IRTCClientPresence2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClientPresence2*, UInt32)
    release : Proc(IRTCClientPresence2*, UInt32)
    enable_presence : Proc(IRTCClientPresence2*, Int16, VARIANT, HRESULT)
    export : Proc(IRTCClientPresence2*, VARIANT, HRESULT)
    import : Proc(IRTCClientPresence2*, VARIANT, Int16, HRESULT)
    enumerate_buddies : Proc(IRTCClientPresence2*, IRTCEnumBuddies*, HRESULT)
    get_buddies : Proc(IRTCClientPresence2*, IRTCCollection*, HRESULT)
    get_buddy : Proc(IRTCClientPresence2*, UInt8*, IRTCBuddy*, HRESULT)
    add_buddy : Proc(IRTCClientPresence2*, UInt8*, UInt8*, UInt8*, Int16, IRTCProfile, Int32, IRTCBuddy*, HRESULT)
    remove_buddy : Proc(IRTCClientPresence2*, IRTCBuddy, HRESULT)
    enumerate_watchers : Proc(IRTCClientPresence2*, IRTCEnumWatchers*, HRESULT)
    get_watchers : Proc(IRTCClientPresence2*, IRTCCollection*, HRESULT)
    get_watcher : Proc(IRTCClientPresence2*, UInt8*, IRTCWatcher*, HRESULT)
    add_watcher : Proc(IRTCClientPresence2*, UInt8*, UInt8*, UInt8*, Int16, Int16, IRTCWatcher*, HRESULT)
    remove_watcher : Proc(IRTCClientPresence2*, IRTCWatcher, HRESULT)
    set_local_presence_info : Proc(IRTCClientPresence2*, RTC_PRESENCE_STATUS, UInt8*, HRESULT)
    get_offer_watcher_mode : Proc(IRTCClientPresence2*, RTC_OFFER_WATCHER_MODE*, HRESULT)
    put_offer_watcher_mode : Proc(IRTCClientPresence2*, RTC_OFFER_WATCHER_MODE, HRESULT)
    get_privacy_mode : Proc(IRTCClientPresence2*, RTC_PRIVACY_MODE*, HRESULT)
    put_privacy_mode : Proc(IRTCClientPresence2*, RTC_PRIVACY_MODE, HRESULT)
    enable_presence_ex : Proc(IRTCClientPresence2*, IRTCProfile, VARIANT, Int32, HRESULT)
    disable_presence : Proc(IRTCClientPresence2*, HRESULT)
    add_group : Proc(IRTCClientPresence2*, UInt8*, UInt8*, IRTCProfile, Int32, IRTCBuddyGroup*, HRESULT)
    remove_group : Proc(IRTCClientPresence2*, IRTCBuddyGroup, HRESULT)
    enumerate_groups : Proc(IRTCClientPresence2*, IRTCEnumGroups*, HRESULT)
    get_groups : Proc(IRTCClientPresence2*, IRTCCollection*, HRESULT)
    get_group : Proc(IRTCClientPresence2*, UInt8*, IRTCBuddyGroup*, HRESULT)
    add_watcher_ex : Proc(IRTCClientPresence2*, UInt8*, UInt8*, UInt8*, RTC_WATCHER_STATE, Int16, RTC_ACE_SCOPE, IRTCProfile, Int32, IRTCWatcher2*, HRESULT)
    get_watcher_ex : Proc(IRTCClientPresence2*, RTC_WATCHER_MATCH_MODE, UInt8*, IRTCWatcher2*, HRESULT)
    put_presence_property : Proc(IRTCClientPresence2*, RTC_PRESENCE_PROPERTY, UInt8*, HRESULT)
    get_presence_property : Proc(IRTCClientPresence2*, RTC_PRESENCE_PROPERTY, UInt8**, HRESULT)
    set_presence_data : Proc(IRTCClientPresence2*, UInt8*, UInt8*, HRESULT)
    get_presence_data : Proc(IRTCClientPresence2*, UInt8**, UInt8**, HRESULT)
    get_local_presence_info : Proc(IRTCClientPresence2*, RTC_PRESENCE_STATUS*, UInt8**, HRESULT)
    add_buddy_ex : Proc(IRTCClientPresence2*, UInt8*, UInt8*, UInt8*, Int16, RTC_BUDDY_SUBSCRIPTION_TYPE, IRTCProfile, Int32, IRTCBuddy2*, HRESULT)
  end

  struct IRTCClientPresence2
    lpVtbl : IRTCClientPresence2VTbl*
  end

  struct IRTCClientProvisioningVTbl
    query_interface : Proc(IRTCClientProvisioning*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClientProvisioning*, UInt32)
    release : Proc(IRTCClientProvisioning*, UInt32)
    create_profile : Proc(IRTCClientProvisioning*, UInt8*, IRTCProfile*, HRESULT)
    enable_profile : Proc(IRTCClientProvisioning*, IRTCProfile, Int32, HRESULT)
    disable_profile : Proc(IRTCClientProvisioning*, IRTCProfile, HRESULT)
    enumerate_profiles : Proc(IRTCClientProvisioning*, IRTCEnumProfiles*, HRESULT)
    get_profiles : Proc(IRTCClientProvisioning*, IRTCCollection*, HRESULT)
    get_profile : Proc(IRTCClientProvisioning*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, LibC::IntPtrT, HRESULT)
    get_session_capabilities : Proc(IRTCClientProvisioning*, Int32*, HRESULT)
  end

  struct IRTCClientProvisioning
    lpVtbl : IRTCClientProvisioningVTbl*
  end

  struct IRTCClientProvisioning2VTbl
    query_interface : Proc(IRTCClientProvisioning2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClientProvisioning2*, UInt32)
    release : Proc(IRTCClientProvisioning2*, UInt32)
    create_profile : Proc(IRTCClientProvisioning2*, UInt8*, IRTCProfile*, HRESULT)
    enable_profile : Proc(IRTCClientProvisioning2*, IRTCProfile, Int32, HRESULT)
    disable_profile : Proc(IRTCClientProvisioning2*, IRTCProfile, HRESULT)
    enumerate_profiles : Proc(IRTCClientProvisioning2*, IRTCEnumProfiles*, HRESULT)
    get_profiles : Proc(IRTCClientProvisioning2*, IRTCCollection*, HRESULT)
    get_profile : Proc(IRTCClientProvisioning2*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, LibC::IntPtrT, HRESULT)
    get_session_capabilities : Proc(IRTCClientProvisioning2*, Int32*, HRESULT)
    enable_profile_ex : Proc(IRTCClientProvisioning2*, IRTCProfile, Int32, Int32, HRESULT)
  end

  struct IRTCClientProvisioning2
    lpVtbl : IRTCClientProvisioning2VTbl*
  end

  struct IRTCProfileVTbl
    query_interface : Proc(IRTCProfile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCProfile*, UInt32)
    release : Proc(IRTCProfile*, UInt32)
    get_key : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_name : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_xml : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_provider_name : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_provider_uri : Proc(IRTCProfile*, RTC_PROVIDER_URI, UInt8**, HRESULT)
    get_provider_data : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_client_name : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_client_banner : Proc(IRTCProfile*, Int16*, HRESULT)
    get_client_min_ver : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_client_cur_ver : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_client_update_uri : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_client_data : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_user_uri : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_user_name : Proc(IRTCProfile*, UInt8**, HRESULT)
    get_user_account : Proc(IRTCProfile*, UInt8**, HRESULT)
    set_credentials : Proc(IRTCProfile*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_session_capabilities : Proc(IRTCProfile*, Int32*, HRESULT)
    get_state : Proc(IRTCProfile*, RTC_REGISTRATION_STATE*, HRESULT)
  end

  struct IRTCProfile
    lpVtbl : IRTCProfileVTbl*
  end

  struct IRTCProfile2VTbl
    query_interface : Proc(IRTCProfile2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCProfile2*, UInt32)
    release : Proc(IRTCProfile2*, UInt32)
    get_key : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_name : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_xml : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_provider_name : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_provider_uri : Proc(IRTCProfile2*, RTC_PROVIDER_URI, UInt8**, HRESULT)
    get_provider_data : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_client_name : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_client_banner : Proc(IRTCProfile2*, Int16*, HRESULT)
    get_client_min_ver : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_client_cur_ver : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_client_update_uri : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_client_data : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_user_uri : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_user_name : Proc(IRTCProfile2*, UInt8**, HRESULT)
    get_user_account : Proc(IRTCProfile2*, UInt8**, HRESULT)
    set_credentials : Proc(IRTCProfile2*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_session_capabilities : Proc(IRTCProfile2*, Int32*, HRESULT)
    get_state : Proc(IRTCProfile2*, RTC_REGISTRATION_STATE*, HRESULT)
    get_realm : Proc(IRTCProfile2*, UInt8**, HRESULT)
    put_realm : Proc(IRTCProfile2*, UInt8*, HRESULT)
    get_allowed_auth : Proc(IRTCProfile2*, Int32*, HRESULT)
    put_allowed_auth : Proc(IRTCProfile2*, Int32, HRESULT)
  end

  struct IRTCProfile2
    lpVtbl : IRTCProfile2VTbl*
  end

  struct IRTCSessionVTbl
    query_interface : Proc(IRTCSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSession*, UInt32)
    release : Proc(IRTCSession*, UInt32)
    get_client : Proc(IRTCSession*, IRTCClient*, HRESULT)
    get_state : Proc(IRTCSession*, RTC_SESSION_STATE*, HRESULT)
    get_type : Proc(IRTCSession*, RTC_SESSION_TYPE*, HRESULT)
    get_profile : Proc(IRTCSession*, IRTCProfile*, HRESULT)
    get_participants : Proc(IRTCSession*, IRTCCollection*, HRESULT)
    answer : Proc(IRTCSession*, HRESULT)
    terminate : Proc(IRTCSession*, RTC_TERMINATE_REASON, HRESULT)
    redirect : Proc(IRTCSession*, RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, HRESULT)
    add_participant : Proc(IRTCSession*, UInt8*, UInt8*, IRTCParticipant*, HRESULT)
    remove_participant : Proc(IRTCSession*, IRTCParticipant, HRESULT)
    enumerate_participants : Proc(IRTCSession*, IRTCEnumParticipants*, HRESULT)
    get_can_add_participants : Proc(IRTCSession*, Int16*, HRESULT)
    get_redirected_user_uri : Proc(IRTCSession*, UInt8**, HRESULT)
    get_redirected_user_name : Proc(IRTCSession*, UInt8**, HRESULT)
    next_redirected_user : Proc(IRTCSession*, HRESULT)
    send_message : Proc(IRTCSession*, UInt8*, UInt8*, LibC::IntPtrT, HRESULT)
    send_message_status : Proc(IRTCSession*, RTC_MESSAGING_USER_STATUS, LibC::IntPtrT, HRESULT)
    add_stream : Proc(IRTCSession*, Int32, LibC::IntPtrT, HRESULT)
    remove_stream : Proc(IRTCSession*, Int32, LibC::IntPtrT, HRESULT)
    put_encryption_key : Proc(IRTCSession*, Int32, UInt8*, HRESULT)
  end

  struct IRTCSession
    lpVtbl : IRTCSessionVTbl*
  end

  struct IRTCSession2VTbl
    query_interface : Proc(IRTCSession2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSession2*, UInt32)
    release : Proc(IRTCSession2*, UInt32)
    get_client : Proc(IRTCSession2*, IRTCClient*, HRESULT)
    get_state : Proc(IRTCSession2*, RTC_SESSION_STATE*, HRESULT)
    get_type : Proc(IRTCSession2*, RTC_SESSION_TYPE*, HRESULT)
    get_profile : Proc(IRTCSession2*, IRTCProfile*, HRESULT)
    get_participants : Proc(IRTCSession2*, IRTCCollection*, HRESULT)
    answer : Proc(IRTCSession2*, HRESULT)
    terminate : Proc(IRTCSession2*, RTC_TERMINATE_REASON, HRESULT)
    redirect : Proc(IRTCSession2*, RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, HRESULT)
    add_participant : Proc(IRTCSession2*, UInt8*, UInt8*, IRTCParticipant*, HRESULT)
    remove_participant : Proc(IRTCSession2*, IRTCParticipant, HRESULT)
    enumerate_participants : Proc(IRTCSession2*, IRTCEnumParticipants*, HRESULT)
    get_can_add_participants : Proc(IRTCSession2*, Int16*, HRESULT)
    get_redirected_user_uri : Proc(IRTCSession2*, UInt8**, HRESULT)
    get_redirected_user_name : Proc(IRTCSession2*, UInt8**, HRESULT)
    next_redirected_user : Proc(IRTCSession2*, HRESULT)
    send_message : Proc(IRTCSession2*, UInt8*, UInt8*, LibC::IntPtrT, HRESULT)
    send_message_status : Proc(IRTCSession2*, RTC_MESSAGING_USER_STATUS, LibC::IntPtrT, HRESULT)
    add_stream : Proc(IRTCSession2*, Int32, LibC::IntPtrT, HRESULT)
    remove_stream : Proc(IRTCSession2*, Int32, LibC::IntPtrT, HRESULT)
    put_encryption_key : Proc(IRTCSession2*, Int32, UInt8*, HRESULT)
    send_info : Proc(IRTCSession2*, UInt8*, UInt8*, LibC::IntPtrT, HRESULT)
    put_preferred_security_level : Proc(IRTCSession2*, RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL, HRESULT)
    get_preferred_security_level : Proc(IRTCSession2*, RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)
    is_security_enabled : Proc(IRTCSession2*, RTC_SECURITY_TYPE, Int16*, HRESULT)
    answer_with_session_description : Proc(IRTCSession2*, UInt8*, UInt8*, HRESULT)
    re_invite_with_session_description : Proc(IRTCSession2*, UInt8*, UInt8*, LibC::IntPtrT, HRESULT)
  end

  struct IRTCSession2
    lpVtbl : IRTCSession2VTbl*
  end

  struct IRTCSessionCallControlVTbl
    query_interface : Proc(IRTCSessionCallControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionCallControl*, UInt32)
    release : Proc(IRTCSessionCallControl*, UInt32)
    hold : Proc(IRTCSessionCallControl*, LibC::IntPtrT, HRESULT)
    un_hold : Proc(IRTCSessionCallControl*, LibC::IntPtrT, HRESULT)
    forward : Proc(IRTCSessionCallControl*, UInt8*, HRESULT)
    refer : Proc(IRTCSessionCallControl*, UInt8*, UInt8*, HRESULT)
    put_referred_by_uri : Proc(IRTCSessionCallControl*, UInt8*, HRESULT)
    get_referred_by_uri : Proc(IRTCSessionCallControl*, UInt8**, HRESULT)
    put_refer_cookie : Proc(IRTCSessionCallControl*, UInt8*, HRESULT)
    get_refer_cookie : Proc(IRTCSessionCallControl*, UInt8**, HRESULT)
    get_is_referred : Proc(IRTCSessionCallControl*, Int16*, HRESULT)
  end

  struct IRTCSessionCallControl
    lpVtbl : IRTCSessionCallControlVTbl*
  end

  struct IRTCParticipantVTbl
    query_interface : Proc(IRTCParticipant*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCParticipant*, UInt32)
    release : Proc(IRTCParticipant*, UInt32)
    get_user_uri : Proc(IRTCParticipant*, UInt8**, HRESULT)
    get_name : Proc(IRTCParticipant*, UInt8**, HRESULT)
    get_removable : Proc(IRTCParticipant*, Int16*, HRESULT)
    get_state : Proc(IRTCParticipant*, RTC_PARTICIPANT_STATE*, HRESULT)
    get_session : Proc(IRTCParticipant*, IRTCSession*, HRESULT)
  end

  struct IRTCParticipant
    lpVtbl : IRTCParticipantVTbl*
  end

  struct IRTCRoamingEventVTbl
    query_interface : Proc(IRTCRoamingEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCRoamingEvent*, UInt32)
    release : Proc(IRTCRoamingEvent*, UInt32)
    get_type_info_count : Proc(IRTCRoamingEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCRoamingEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCRoamingEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCRoamingEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_event_type : Proc(IRTCRoamingEvent*, RTC_ROAMING_EVENT_TYPE*, HRESULT)
    get_profile : Proc(IRTCRoamingEvent*, IRTCProfile2*, HRESULT)
    get_status_code : Proc(IRTCRoamingEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCRoamingEvent*, UInt8**, HRESULT)
  end

  struct IRTCRoamingEvent
    lpVtbl : IRTCRoamingEventVTbl*
  end

  struct IRTCProfileEventVTbl
    query_interface : Proc(IRTCProfileEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCProfileEvent*, UInt32)
    release : Proc(IRTCProfileEvent*, UInt32)
    get_type_info_count : Proc(IRTCProfileEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCProfileEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCProfileEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCProfileEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_profile : Proc(IRTCProfileEvent*, IRTCProfile*, HRESULT)
    get_cookie : Proc(IRTCProfileEvent*, LibC::IntPtrT*, HRESULT)
    get_status_code : Proc(IRTCProfileEvent*, Int32*, HRESULT)
  end

  struct IRTCProfileEvent
    lpVtbl : IRTCProfileEventVTbl*
  end

  struct IRTCProfileEvent2VTbl
    query_interface : Proc(IRTCProfileEvent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCProfileEvent2*, UInt32)
    release : Proc(IRTCProfileEvent2*, UInt32)
    get_type_info_count : Proc(IRTCProfileEvent2*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCProfileEvent2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCProfileEvent2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCProfileEvent2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_profile : Proc(IRTCProfileEvent2*, IRTCProfile*, HRESULT)
    get_cookie : Proc(IRTCProfileEvent2*, LibC::IntPtrT*, HRESULT)
    get_status_code : Proc(IRTCProfileEvent2*, Int32*, HRESULT)
    get_event_type : Proc(IRTCProfileEvent2*, RTC_PROFILE_EVENT_TYPE*, HRESULT)
  end

  struct IRTCProfileEvent2
    lpVtbl : IRTCProfileEvent2VTbl*
  end

  struct IRTCClientEventVTbl
    query_interface : Proc(IRTCClientEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClientEvent*, UInt32)
    release : Proc(IRTCClientEvent*, UInt32)
    get_type_info_count : Proc(IRTCClientEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCClientEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCClientEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCClientEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_event_type : Proc(IRTCClientEvent*, RTC_CLIENT_EVENT_TYPE*, HRESULT)
    get_client : Proc(IRTCClientEvent*, IRTCClient*, HRESULT)
  end

  struct IRTCClientEvent
    lpVtbl : IRTCClientEventVTbl*
  end

  struct IRTCRegistrationStateChangeEventVTbl
    query_interface : Proc(IRTCRegistrationStateChangeEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCRegistrationStateChangeEvent*, UInt32)
    release : Proc(IRTCRegistrationStateChangeEvent*, UInt32)
    get_type_info_count : Proc(IRTCRegistrationStateChangeEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCRegistrationStateChangeEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCRegistrationStateChangeEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCRegistrationStateChangeEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_profile : Proc(IRTCRegistrationStateChangeEvent*, IRTCProfile*, HRESULT)
    get_state : Proc(IRTCRegistrationStateChangeEvent*, RTC_REGISTRATION_STATE*, HRESULT)
    get_status_code : Proc(IRTCRegistrationStateChangeEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCRegistrationStateChangeEvent*, UInt8**, HRESULT)
  end

  struct IRTCRegistrationStateChangeEvent
    lpVtbl : IRTCRegistrationStateChangeEventVTbl*
  end

  struct IRTCSessionStateChangeEventVTbl
    query_interface : Proc(IRTCSessionStateChangeEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionStateChangeEvent*, UInt32)
    release : Proc(IRTCSessionStateChangeEvent*, UInt32)
    get_type_info_count : Proc(IRTCSessionStateChangeEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCSessionStateChangeEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCSessionStateChangeEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCSessionStateChangeEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCSessionStateChangeEvent*, IRTCSession*, HRESULT)
    get_state : Proc(IRTCSessionStateChangeEvent*, RTC_SESSION_STATE*, HRESULT)
    get_status_code : Proc(IRTCSessionStateChangeEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCSessionStateChangeEvent*, UInt8**, HRESULT)
  end

  struct IRTCSessionStateChangeEvent
    lpVtbl : IRTCSessionStateChangeEventVTbl*
  end

  struct IRTCSessionStateChangeEvent2VTbl
    query_interface : Proc(IRTCSessionStateChangeEvent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionStateChangeEvent2*, UInt32)
    release : Proc(IRTCSessionStateChangeEvent2*, UInt32)
    get_type_info_count : Proc(IRTCSessionStateChangeEvent2*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCSessionStateChangeEvent2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCSessionStateChangeEvent2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCSessionStateChangeEvent2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCSessionStateChangeEvent2*, IRTCSession*, HRESULT)
    get_state : Proc(IRTCSessionStateChangeEvent2*, RTC_SESSION_STATE*, HRESULT)
    get_status_code : Proc(IRTCSessionStateChangeEvent2*, Int32*, HRESULT)
    get_status_text : Proc(IRTCSessionStateChangeEvent2*, UInt8**, HRESULT)
    get_media_types : Proc(IRTCSessionStateChangeEvent2*, Int32*, HRESULT)
    get_remote_preferred_security_level : Proc(IRTCSessionStateChangeEvent2*, RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)
    get_is_forked : Proc(IRTCSessionStateChangeEvent2*, Int16*, HRESULT)
    get_remote_session_description : Proc(IRTCSessionStateChangeEvent2*, UInt8**, UInt8**, HRESULT)
  end

  struct IRTCSessionStateChangeEvent2
    lpVtbl : IRTCSessionStateChangeEvent2VTbl*
  end

  struct IRTCSessionOperationCompleteEventVTbl
    query_interface : Proc(IRTCSessionOperationCompleteEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionOperationCompleteEvent*, UInt32)
    release : Proc(IRTCSessionOperationCompleteEvent*, UInt32)
    get_type_info_count : Proc(IRTCSessionOperationCompleteEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCSessionOperationCompleteEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCSessionOperationCompleteEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCSessionOperationCompleteEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCSessionOperationCompleteEvent*, IRTCSession*, HRESULT)
    get_cookie : Proc(IRTCSessionOperationCompleteEvent*, LibC::IntPtrT*, HRESULT)
    get_status_code : Proc(IRTCSessionOperationCompleteEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCSessionOperationCompleteEvent*, UInt8**, HRESULT)
  end

  struct IRTCSessionOperationCompleteEvent
    lpVtbl : IRTCSessionOperationCompleteEventVTbl*
  end

  struct IRTCSessionOperationCompleteEvent2VTbl
    query_interface : Proc(IRTCSessionOperationCompleteEvent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionOperationCompleteEvent2*, UInt32)
    release : Proc(IRTCSessionOperationCompleteEvent2*, UInt32)
    get_type_info_count : Proc(IRTCSessionOperationCompleteEvent2*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCSessionOperationCompleteEvent2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCSessionOperationCompleteEvent2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCSessionOperationCompleteEvent2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCSessionOperationCompleteEvent2*, IRTCSession*, HRESULT)
    get_cookie : Proc(IRTCSessionOperationCompleteEvent2*, LibC::IntPtrT*, HRESULT)
    get_status_code : Proc(IRTCSessionOperationCompleteEvent2*, Int32*, HRESULT)
    get_status_text : Proc(IRTCSessionOperationCompleteEvent2*, UInt8**, HRESULT)
    get_participant : Proc(IRTCSessionOperationCompleteEvent2*, IRTCParticipant*, HRESULT)
    get_remote_session_description : Proc(IRTCSessionOperationCompleteEvent2*, UInt8**, UInt8**, HRESULT)
  end

  struct IRTCSessionOperationCompleteEvent2
    lpVtbl : IRTCSessionOperationCompleteEvent2VTbl*
  end

  struct IRTCParticipantStateChangeEventVTbl
    query_interface : Proc(IRTCParticipantStateChangeEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCParticipantStateChangeEvent*, UInt32)
    release : Proc(IRTCParticipantStateChangeEvent*, UInt32)
    get_type_info_count : Proc(IRTCParticipantStateChangeEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCParticipantStateChangeEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCParticipantStateChangeEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCParticipantStateChangeEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_participant : Proc(IRTCParticipantStateChangeEvent*, IRTCParticipant*, HRESULT)
    get_state : Proc(IRTCParticipantStateChangeEvent*, RTC_PARTICIPANT_STATE*, HRESULT)
    get_status_code : Proc(IRTCParticipantStateChangeEvent*, Int32*, HRESULT)
  end

  struct IRTCParticipantStateChangeEvent
    lpVtbl : IRTCParticipantStateChangeEventVTbl*
  end

  struct IRTCMediaEventVTbl
    query_interface : Proc(IRTCMediaEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCMediaEvent*, UInt32)
    release : Proc(IRTCMediaEvent*, UInt32)
    get_type_info_count : Proc(IRTCMediaEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCMediaEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCMediaEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCMediaEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_media_type : Proc(IRTCMediaEvent*, Int32*, HRESULT)
    get_event_type : Proc(IRTCMediaEvent*, RTC_MEDIA_EVENT_TYPE*, HRESULT)
    get_event_reason : Proc(IRTCMediaEvent*, RTC_MEDIA_EVENT_REASON*, HRESULT)
  end

  struct IRTCMediaEvent
    lpVtbl : IRTCMediaEventVTbl*
  end

  struct IRTCIntensityEventVTbl
    query_interface : Proc(IRTCIntensityEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCIntensityEvent*, UInt32)
    release : Proc(IRTCIntensityEvent*, UInt32)
    get_type_info_count : Proc(IRTCIntensityEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCIntensityEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCIntensityEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCIntensityEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_level : Proc(IRTCIntensityEvent*, Int32*, HRESULT)
    get_min : Proc(IRTCIntensityEvent*, Int32*, HRESULT)
    get_max : Proc(IRTCIntensityEvent*, Int32*, HRESULT)
    get_direction : Proc(IRTCIntensityEvent*, RTC_AUDIO_DEVICE*, HRESULT)
  end

  struct IRTCIntensityEvent
    lpVtbl : IRTCIntensityEventVTbl*
  end

  struct IRTCMessagingEventVTbl
    query_interface : Proc(IRTCMessagingEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCMessagingEvent*, UInt32)
    release : Proc(IRTCMessagingEvent*, UInt32)
    get_type_info_count : Proc(IRTCMessagingEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCMessagingEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCMessagingEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCMessagingEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCMessagingEvent*, IRTCSession*, HRESULT)
    get_participant : Proc(IRTCMessagingEvent*, IRTCParticipant*, HRESULT)
    get_event_type : Proc(IRTCMessagingEvent*, RTC_MESSAGING_EVENT_TYPE*, HRESULT)
    get_message : Proc(IRTCMessagingEvent*, UInt8**, HRESULT)
    get_message_header : Proc(IRTCMessagingEvent*, UInt8**, HRESULT)
    get_user_status : Proc(IRTCMessagingEvent*, RTC_MESSAGING_USER_STATUS*, HRESULT)
  end

  struct IRTCMessagingEvent
    lpVtbl : IRTCMessagingEventVTbl*
  end

  struct IRTCBuddyEventVTbl
    query_interface : Proc(IRTCBuddyEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCBuddyEvent*, UInt32)
    release : Proc(IRTCBuddyEvent*, UInt32)
    get_type_info_count : Proc(IRTCBuddyEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCBuddyEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCBuddyEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCBuddyEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_buddy : Proc(IRTCBuddyEvent*, IRTCBuddy*, HRESULT)
  end

  struct IRTCBuddyEvent
    lpVtbl : IRTCBuddyEventVTbl*
  end

  struct IRTCBuddyEvent2VTbl
    query_interface : Proc(IRTCBuddyEvent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCBuddyEvent2*, UInt32)
    release : Proc(IRTCBuddyEvent2*, UInt32)
    get_type_info_count : Proc(IRTCBuddyEvent2*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCBuddyEvent2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCBuddyEvent2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCBuddyEvent2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_buddy : Proc(IRTCBuddyEvent2*, IRTCBuddy*, HRESULT)
    get_event_type : Proc(IRTCBuddyEvent2*, RTC_BUDDY_EVENT_TYPE*, HRESULT)
    get_status_code : Proc(IRTCBuddyEvent2*, Int32*, HRESULT)
    get_status_text : Proc(IRTCBuddyEvent2*, UInt8**, HRESULT)
  end

  struct IRTCBuddyEvent2
    lpVtbl : IRTCBuddyEvent2VTbl*
  end

  struct IRTCWatcherEventVTbl
    query_interface : Proc(IRTCWatcherEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCWatcherEvent*, UInt32)
    release : Proc(IRTCWatcherEvent*, UInt32)
    get_type_info_count : Proc(IRTCWatcherEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCWatcherEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCWatcherEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCWatcherEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_watcher : Proc(IRTCWatcherEvent*, IRTCWatcher*, HRESULT)
  end

  struct IRTCWatcherEvent
    lpVtbl : IRTCWatcherEventVTbl*
  end

  struct IRTCWatcherEvent2VTbl
    query_interface : Proc(IRTCWatcherEvent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCWatcherEvent2*, UInt32)
    release : Proc(IRTCWatcherEvent2*, UInt32)
    get_type_info_count : Proc(IRTCWatcherEvent2*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCWatcherEvent2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCWatcherEvent2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCWatcherEvent2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_watcher : Proc(IRTCWatcherEvent2*, IRTCWatcher*, HRESULT)
    get_event_type : Proc(IRTCWatcherEvent2*, RTC_WATCHER_EVENT_TYPE*, HRESULT)
    get_status_code : Proc(IRTCWatcherEvent2*, Int32*, HRESULT)
  end

  struct IRTCWatcherEvent2
    lpVtbl : IRTCWatcherEvent2VTbl*
  end

  struct IRTCBuddyGroupEventVTbl
    query_interface : Proc(IRTCBuddyGroupEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCBuddyGroupEvent*, UInt32)
    release : Proc(IRTCBuddyGroupEvent*, UInt32)
    get_type_info_count : Proc(IRTCBuddyGroupEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCBuddyGroupEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCBuddyGroupEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCBuddyGroupEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_event_type : Proc(IRTCBuddyGroupEvent*, RTC_GROUP_EVENT_TYPE*, HRESULT)
    get_group : Proc(IRTCBuddyGroupEvent*, IRTCBuddyGroup*, HRESULT)
    get_buddy : Proc(IRTCBuddyGroupEvent*, IRTCBuddy2*, HRESULT)
    get_status_code : Proc(IRTCBuddyGroupEvent*, Int32*, HRESULT)
  end

  struct IRTCBuddyGroupEvent
    lpVtbl : IRTCBuddyGroupEventVTbl*
  end

  struct IRTCInfoEventVTbl
    query_interface : Proc(IRTCInfoEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCInfoEvent*, UInt32)
    release : Proc(IRTCInfoEvent*, UInt32)
    get_type_info_count : Proc(IRTCInfoEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCInfoEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCInfoEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCInfoEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCInfoEvent*, IRTCSession2*, HRESULT)
    get_participant : Proc(IRTCInfoEvent*, IRTCParticipant*, HRESULT)
    get_info : Proc(IRTCInfoEvent*, UInt8**, HRESULT)
    get_info_header : Proc(IRTCInfoEvent*, UInt8**, HRESULT)
  end

  struct IRTCInfoEvent
    lpVtbl : IRTCInfoEventVTbl*
  end

  struct IRTCMediaRequestEventVTbl
    query_interface : Proc(IRTCMediaRequestEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCMediaRequestEvent*, UInt32)
    release : Proc(IRTCMediaRequestEvent*, UInt32)
    get_type_info_count : Proc(IRTCMediaRequestEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCMediaRequestEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCMediaRequestEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCMediaRequestEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCMediaRequestEvent*, IRTCSession2*, HRESULT)
    get_proposed_media : Proc(IRTCMediaRequestEvent*, Int32*, HRESULT)
    get_current_media : Proc(IRTCMediaRequestEvent*, Int32*, HRESULT)
    accept : Proc(IRTCMediaRequestEvent*, Int32, HRESULT)
    get_remote_preferred_security_level : Proc(IRTCMediaRequestEvent*, RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)
    reject : Proc(IRTCMediaRequestEvent*, HRESULT)
    get_state : Proc(IRTCMediaRequestEvent*, RTC_REINVITE_STATE*, HRESULT)
  end

  struct IRTCMediaRequestEvent
    lpVtbl : IRTCMediaRequestEventVTbl*
  end

  struct IRTCReInviteEventVTbl
    query_interface : Proc(IRTCReInviteEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCReInviteEvent*, UInt32)
    release : Proc(IRTCReInviteEvent*, UInt32)
    get_type_info_count : Proc(IRTCReInviteEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCReInviteEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCReInviteEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCReInviteEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCReInviteEvent*, IRTCSession2*, HRESULT)
    accept : Proc(IRTCReInviteEvent*, UInt8*, UInt8*, HRESULT)
    reject : Proc(IRTCReInviteEvent*, HRESULT)
    get_state : Proc(IRTCReInviteEvent*, RTC_REINVITE_STATE*, HRESULT)
    get_remote_session_description : Proc(IRTCReInviteEvent*, UInt8**, UInt8**, HRESULT)
  end

  struct IRTCReInviteEvent
    lpVtbl : IRTCReInviteEventVTbl*
  end

  struct IRTCPresencePropertyEventVTbl
    query_interface : Proc(IRTCPresencePropertyEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCPresencePropertyEvent*, UInt32)
    release : Proc(IRTCPresencePropertyEvent*, UInt32)
    get_type_info_count : Proc(IRTCPresencePropertyEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCPresencePropertyEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCPresencePropertyEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCPresencePropertyEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_status_code : Proc(IRTCPresencePropertyEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCPresencePropertyEvent*, UInt8**, HRESULT)
    get_presence_property : Proc(IRTCPresencePropertyEvent*, RTC_PRESENCE_PROPERTY*, HRESULT)
    get_value : Proc(IRTCPresencePropertyEvent*, UInt8**, HRESULT)
  end

  struct IRTCPresencePropertyEvent
    lpVtbl : IRTCPresencePropertyEventVTbl*
  end

  struct IRTCPresenceDataEventVTbl
    query_interface : Proc(IRTCPresenceDataEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCPresenceDataEvent*, UInt32)
    release : Proc(IRTCPresenceDataEvent*, UInt32)
    get_type_info_count : Proc(IRTCPresenceDataEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCPresenceDataEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCPresenceDataEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCPresenceDataEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_status_code : Proc(IRTCPresenceDataEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCPresenceDataEvent*, UInt8**, HRESULT)
    get_presence_data : Proc(IRTCPresenceDataEvent*, UInt8**, UInt8**, HRESULT)
  end

  struct IRTCPresenceDataEvent
    lpVtbl : IRTCPresenceDataEventVTbl*
  end

  struct IRTCPresenceStatusEventVTbl
    query_interface : Proc(IRTCPresenceStatusEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCPresenceStatusEvent*, UInt32)
    release : Proc(IRTCPresenceStatusEvent*, UInt32)
    get_type_info_count : Proc(IRTCPresenceStatusEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCPresenceStatusEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCPresenceStatusEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCPresenceStatusEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_status_code : Proc(IRTCPresenceStatusEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCPresenceStatusEvent*, UInt8**, HRESULT)
    get_local_presence_info : Proc(IRTCPresenceStatusEvent*, RTC_PRESENCE_STATUS*, UInt8**, HRESULT)
  end

  struct IRTCPresenceStatusEvent
    lpVtbl : IRTCPresenceStatusEventVTbl*
  end

  struct IRTCCollectionVTbl
    query_interface : Proc(IRTCCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCCollection*, UInt32)
    release : Proc(IRTCCollection*, UInt32)
    get_type_info_count : Proc(IRTCCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IRTCCollection*, Int32*, HRESULT)
    get_item : Proc(IRTCCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IRTCCollection*, IUnknown*, HRESULT)
  end

  struct IRTCCollection
    lpVtbl : IRTCCollectionVTbl*
  end

  struct IRTCEnumParticipantsVTbl
    query_interface : Proc(IRTCEnumParticipants*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEnumParticipants*, UInt32)
    release : Proc(IRTCEnumParticipants*, UInt32)
    next : Proc(IRTCEnumParticipants*, UInt32, IRTCParticipant*, UInt32*, HRESULT)
    reset : Proc(IRTCEnumParticipants*, HRESULT)
    skip : Proc(IRTCEnumParticipants*, UInt32, HRESULT)
    clone : Proc(IRTCEnumParticipants*, IRTCEnumParticipants*, HRESULT)
  end

  struct IRTCEnumParticipants
    lpVtbl : IRTCEnumParticipantsVTbl*
  end

  struct IRTCEnumProfilesVTbl
    query_interface : Proc(IRTCEnumProfiles*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEnumProfiles*, UInt32)
    release : Proc(IRTCEnumProfiles*, UInt32)
    next : Proc(IRTCEnumProfiles*, UInt32, IRTCProfile*, UInt32*, HRESULT)
    reset : Proc(IRTCEnumProfiles*, HRESULT)
    skip : Proc(IRTCEnumProfiles*, UInt32, HRESULT)
    clone : Proc(IRTCEnumProfiles*, IRTCEnumProfiles*, HRESULT)
  end

  struct IRTCEnumProfiles
    lpVtbl : IRTCEnumProfilesVTbl*
  end

  struct IRTCEnumBuddiesVTbl
    query_interface : Proc(IRTCEnumBuddies*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEnumBuddies*, UInt32)
    release : Proc(IRTCEnumBuddies*, UInt32)
    next : Proc(IRTCEnumBuddies*, UInt32, IRTCBuddy*, UInt32*, HRESULT)
    reset : Proc(IRTCEnumBuddies*, HRESULT)
    skip : Proc(IRTCEnumBuddies*, UInt32, HRESULT)
    clone : Proc(IRTCEnumBuddies*, IRTCEnumBuddies*, HRESULT)
  end

  struct IRTCEnumBuddies
    lpVtbl : IRTCEnumBuddiesVTbl*
  end

  struct IRTCEnumWatchersVTbl
    query_interface : Proc(IRTCEnumWatchers*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEnumWatchers*, UInt32)
    release : Proc(IRTCEnumWatchers*, UInt32)
    next : Proc(IRTCEnumWatchers*, UInt32, IRTCWatcher*, UInt32*, HRESULT)
    reset : Proc(IRTCEnumWatchers*, HRESULT)
    skip : Proc(IRTCEnumWatchers*, UInt32, HRESULT)
    clone : Proc(IRTCEnumWatchers*, IRTCEnumWatchers*, HRESULT)
  end

  struct IRTCEnumWatchers
    lpVtbl : IRTCEnumWatchersVTbl*
  end

  struct IRTCEnumGroupsVTbl
    query_interface : Proc(IRTCEnumGroups*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEnumGroups*, UInt32)
    release : Proc(IRTCEnumGroups*, UInt32)
    next : Proc(IRTCEnumGroups*, UInt32, IRTCBuddyGroup*, UInt32*, HRESULT)
    reset : Proc(IRTCEnumGroups*, HRESULT)
    skip : Proc(IRTCEnumGroups*, UInt32, HRESULT)
    clone : Proc(IRTCEnumGroups*, IRTCEnumGroups*, HRESULT)
  end

  struct IRTCEnumGroups
    lpVtbl : IRTCEnumGroupsVTbl*
  end

  struct IRTCPresenceContactVTbl
    query_interface : Proc(IRTCPresenceContact*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCPresenceContact*, UInt32)
    release : Proc(IRTCPresenceContact*, UInt32)
    get_presentity_uri : Proc(IRTCPresenceContact*, UInt8**, HRESULT)
    put_presentity_uri : Proc(IRTCPresenceContact*, UInt8*, HRESULT)
    get_name : Proc(IRTCPresenceContact*, UInt8**, HRESULT)
    put_name : Proc(IRTCPresenceContact*, UInt8*, HRESULT)
    get_data : Proc(IRTCPresenceContact*, UInt8**, HRESULT)
    put_data : Proc(IRTCPresenceContact*, UInt8*, HRESULT)
    get_persistent : Proc(IRTCPresenceContact*, Int16*, HRESULT)
    put_persistent : Proc(IRTCPresenceContact*, Int16, HRESULT)
  end

  struct IRTCPresenceContact
    lpVtbl : IRTCPresenceContactVTbl*
  end

  struct IRTCBuddyVTbl
    query_interface : Proc(IRTCBuddy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCBuddy*, UInt32)
    release : Proc(IRTCBuddy*, UInt32)
    get_presentity_uri : Proc(IRTCBuddy*, UInt8**, HRESULT)
    put_presentity_uri : Proc(IRTCBuddy*, UInt8*, HRESULT)
    get_name : Proc(IRTCBuddy*, UInt8**, HRESULT)
    put_name : Proc(IRTCBuddy*, UInt8*, HRESULT)
    get_data : Proc(IRTCBuddy*, UInt8**, HRESULT)
    put_data : Proc(IRTCBuddy*, UInt8*, HRESULT)
    get_persistent : Proc(IRTCBuddy*, Int16*, HRESULT)
    put_persistent : Proc(IRTCBuddy*, Int16, HRESULT)
    get_status : Proc(IRTCBuddy*, RTC_PRESENCE_STATUS*, HRESULT)
    get_notes : Proc(IRTCBuddy*, UInt8**, HRESULT)
  end

  struct IRTCBuddy
    lpVtbl : IRTCBuddyVTbl*
  end

  struct IRTCBuddy2VTbl
    query_interface : Proc(IRTCBuddy2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCBuddy2*, UInt32)
    release : Proc(IRTCBuddy2*, UInt32)
    get_presentity_uri : Proc(IRTCBuddy2*, UInt8**, HRESULT)
    put_presentity_uri : Proc(IRTCBuddy2*, UInt8*, HRESULT)
    get_name : Proc(IRTCBuddy2*, UInt8**, HRESULT)
    put_name : Proc(IRTCBuddy2*, UInt8*, HRESULT)
    get_data : Proc(IRTCBuddy2*, UInt8**, HRESULT)
    put_data : Proc(IRTCBuddy2*, UInt8*, HRESULT)
    get_persistent : Proc(IRTCBuddy2*, Int16*, HRESULT)
    put_persistent : Proc(IRTCBuddy2*, Int16, HRESULT)
    get_status : Proc(IRTCBuddy2*, RTC_PRESENCE_STATUS*, HRESULT)
    get_notes : Proc(IRTCBuddy2*, UInt8**, HRESULT)
    get_profile : Proc(IRTCBuddy2*, IRTCProfile2*, HRESULT)
    refresh : Proc(IRTCBuddy2*, HRESULT)
    enumerate_groups : Proc(IRTCBuddy2*, IRTCEnumGroups*, HRESULT)
    get_groups : Proc(IRTCBuddy2*, IRTCCollection*, HRESULT)
    get_presence_property : Proc(IRTCBuddy2*, RTC_PRESENCE_PROPERTY, UInt8**, HRESULT)
    enumerate_presence_devices : Proc(IRTCBuddy2*, IRTCEnumPresenceDevices*, HRESULT)
    get_presence_devices : Proc(IRTCBuddy2*, IRTCCollection*, HRESULT)
    get_subscription_type : Proc(IRTCBuddy2*, RTC_BUDDY_SUBSCRIPTION_TYPE*, HRESULT)
  end

  struct IRTCBuddy2
    lpVtbl : IRTCBuddy2VTbl*
  end

  struct IRTCWatcherVTbl
    query_interface : Proc(IRTCWatcher*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCWatcher*, UInt32)
    release : Proc(IRTCWatcher*, UInt32)
    get_presentity_uri : Proc(IRTCWatcher*, UInt8**, HRESULT)
    put_presentity_uri : Proc(IRTCWatcher*, UInt8*, HRESULT)
    get_name : Proc(IRTCWatcher*, UInt8**, HRESULT)
    put_name : Proc(IRTCWatcher*, UInt8*, HRESULT)
    get_data : Proc(IRTCWatcher*, UInt8**, HRESULT)
    put_data : Proc(IRTCWatcher*, UInt8*, HRESULT)
    get_persistent : Proc(IRTCWatcher*, Int16*, HRESULT)
    put_persistent : Proc(IRTCWatcher*, Int16, HRESULT)
    get_state : Proc(IRTCWatcher*, RTC_WATCHER_STATE*, HRESULT)
    put_state : Proc(IRTCWatcher*, RTC_WATCHER_STATE, HRESULT)
  end

  struct IRTCWatcher
    lpVtbl : IRTCWatcherVTbl*
  end

  struct IRTCWatcher2VTbl
    query_interface : Proc(IRTCWatcher2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCWatcher2*, UInt32)
    release : Proc(IRTCWatcher2*, UInt32)
    get_presentity_uri : Proc(IRTCWatcher2*, UInt8**, HRESULT)
    put_presentity_uri : Proc(IRTCWatcher2*, UInt8*, HRESULT)
    get_name : Proc(IRTCWatcher2*, UInt8**, HRESULT)
    put_name : Proc(IRTCWatcher2*, UInt8*, HRESULT)
    get_data : Proc(IRTCWatcher2*, UInt8**, HRESULT)
    put_data : Proc(IRTCWatcher2*, UInt8*, HRESULT)
    get_persistent : Proc(IRTCWatcher2*, Int16*, HRESULT)
    put_persistent : Proc(IRTCWatcher2*, Int16, HRESULT)
    get_state : Proc(IRTCWatcher2*, RTC_WATCHER_STATE*, HRESULT)
    put_state : Proc(IRTCWatcher2*, RTC_WATCHER_STATE, HRESULT)
    get_profile : Proc(IRTCWatcher2*, IRTCProfile2*, HRESULT)
    get_scope : Proc(IRTCWatcher2*, RTC_ACE_SCOPE*, HRESULT)
  end

  struct IRTCWatcher2
    lpVtbl : IRTCWatcher2VTbl*
  end

  struct IRTCBuddyGroupVTbl
    query_interface : Proc(IRTCBuddyGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCBuddyGroup*, UInt32)
    release : Proc(IRTCBuddyGroup*, UInt32)
    get_name : Proc(IRTCBuddyGroup*, UInt8**, HRESULT)
    put_name : Proc(IRTCBuddyGroup*, UInt8*, HRESULT)
    add_buddy : Proc(IRTCBuddyGroup*, IRTCBuddy, HRESULT)
    remove_buddy : Proc(IRTCBuddyGroup*, IRTCBuddy, HRESULT)
    enumerate_buddies : Proc(IRTCBuddyGroup*, IRTCEnumBuddies*, HRESULT)
    get_buddies : Proc(IRTCBuddyGroup*, IRTCCollection*, HRESULT)
    get_data : Proc(IRTCBuddyGroup*, UInt8**, HRESULT)
    put_data : Proc(IRTCBuddyGroup*, UInt8*, HRESULT)
    get_profile : Proc(IRTCBuddyGroup*, IRTCProfile2*, HRESULT)
  end

  struct IRTCBuddyGroup
    lpVtbl : IRTCBuddyGroupVTbl*
  end

  struct IRTCEventNotificationVTbl
    query_interface : Proc(IRTCEventNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEventNotification*, UInt32)
    release : Proc(IRTCEventNotification*, UInt32)
    event : Proc(IRTCEventNotification*, RTC_EVENT, IDispatch, HRESULT)
  end

  struct IRTCEventNotification
    lpVtbl : IRTCEventNotificationVTbl*
  end

  struct IRTCPortManagerVTbl
    query_interface : Proc(IRTCPortManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCPortManager*, UInt32)
    release : Proc(IRTCPortManager*, UInt32)
    get_mapping : Proc(IRTCPortManager*, UInt8*, RTC_PORT_TYPE, UInt8**, Int32*, UInt8**, Int32*, HRESULT)
    update_remote_address : Proc(IRTCPortManager*, UInt8*, UInt8*, Int32, UInt8*, Int32, HRESULT)
    release_mapping : Proc(IRTCPortManager*, UInt8*, Int32, UInt8*, Int32, HRESULT)
  end

  struct IRTCPortManager
    lpVtbl : IRTCPortManagerVTbl*
  end

  struct IRTCSessionPortManagementVTbl
    query_interface : Proc(IRTCSessionPortManagement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionPortManagement*, UInt32)
    release : Proc(IRTCSessionPortManagement*, UInt32)
    set_port_manager : Proc(IRTCSessionPortManagement*, IRTCPortManager, HRESULT)
  end

  struct IRTCSessionPortManagement
    lpVtbl : IRTCSessionPortManagementVTbl*
  end

  struct IRTCClientPortManagementVTbl
    query_interface : Proc(IRTCClientPortManagement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCClientPortManagement*, UInt32)
    release : Proc(IRTCClientPortManagement*, UInt32)
    start_listen_address_and_port : Proc(IRTCClientPortManagement*, UInt8*, Int32, HRESULT)
    stop_listen_address_and_port : Proc(IRTCClientPortManagement*, UInt8*, Int32, HRESULT)
    get_port_range : Proc(IRTCClientPortManagement*, RTC_PORT_TYPE, Int32*, Int32*, HRESULT)
  end

  struct IRTCClientPortManagement
    lpVtbl : IRTCClientPortManagementVTbl*
  end

  struct IRTCUserSearchVTbl
    query_interface : Proc(IRTCUserSearch*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCUserSearch*, UInt32)
    release : Proc(IRTCUserSearch*, UInt32)
    create_query : Proc(IRTCUserSearch*, IRTCUserSearchQuery*, HRESULT)
    execute_search : Proc(IRTCUserSearch*, IRTCUserSearchQuery, IRTCProfile, LibC::IntPtrT, HRESULT)
  end

  struct IRTCUserSearch
    lpVtbl : IRTCUserSearchVTbl*
  end

  struct IRTCUserSearchQueryVTbl
    query_interface : Proc(IRTCUserSearchQuery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCUserSearchQuery*, UInt32)
    release : Proc(IRTCUserSearchQuery*, UInt32)
    put_search_term : Proc(IRTCUserSearchQuery*, UInt8*, UInt8*, HRESULT)
    get_search_term : Proc(IRTCUserSearchQuery*, UInt8*, UInt8**, HRESULT)
    get_search_terms : Proc(IRTCUserSearchQuery*, UInt8**, HRESULT)
    put_search_preference : Proc(IRTCUserSearchQuery*, RTC_USER_SEARCH_PREFERENCE, Int32, HRESULT)
    get_search_preference : Proc(IRTCUserSearchQuery*, RTC_USER_SEARCH_PREFERENCE, Int32*, HRESULT)
    put_search_domain : Proc(IRTCUserSearchQuery*, UInt8*, HRESULT)
    get_search_domain : Proc(IRTCUserSearchQuery*, UInt8**, HRESULT)
  end

  struct IRTCUserSearchQuery
    lpVtbl : IRTCUserSearchQueryVTbl*
  end

  struct IRTCUserSearchResultVTbl
    query_interface : Proc(IRTCUserSearchResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCUserSearchResult*, UInt32)
    release : Proc(IRTCUserSearchResult*, UInt32)
    get_value : Proc(IRTCUserSearchResult*, RTC_USER_SEARCH_COLUMN, UInt8**, HRESULT)
  end

  struct IRTCUserSearchResult
    lpVtbl : IRTCUserSearchResultVTbl*
  end

  struct IRTCEnumUserSearchResultsVTbl
    query_interface : Proc(IRTCEnumUserSearchResults*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEnumUserSearchResults*, UInt32)
    release : Proc(IRTCEnumUserSearchResults*, UInt32)
    next : Proc(IRTCEnumUserSearchResults*, UInt32, IRTCUserSearchResult*, UInt32*, HRESULT)
    reset : Proc(IRTCEnumUserSearchResults*, HRESULT)
    skip : Proc(IRTCEnumUserSearchResults*, UInt32, HRESULT)
    clone : Proc(IRTCEnumUserSearchResults*, IRTCEnumUserSearchResults*, HRESULT)
  end

  struct IRTCEnumUserSearchResults
    lpVtbl : IRTCEnumUserSearchResultsVTbl*
  end

  struct IRTCUserSearchResultsEventVTbl
    query_interface : Proc(IRTCUserSearchResultsEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCUserSearchResultsEvent*, UInt32)
    release : Proc(IRTCUserSearchResultsEvent*, UInt32)
    get_type_info_count : Proc(IRTCUserSearchResultsEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCUserSearchResultsEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCUserSearchResultsEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCUserSearchResultsEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    enumerate_results : Proc(IRTCUserSearchResultsEvent*, IRTCEnumUserSearchResults*, HRESULT)
    get_results : Proc(IRTCUserSearchResultsEvent*, IRTCCollection*, HRESULT)
    get_profile : Proc(IRTCUserSearchResultsEvent*, IRTCProfile2*, HRESULT)
    get_query : Proc(IRTCUserSearchResultsEvent*, IRTCUserSearchQuery*, HRESULT)
    get_cookie : Proc(IRTCUserSearchResultsEvent*, LibC::IntPtrT*, HRESULT)
    get_status_code : Proc(IRTCUserSearchResultsEvent*, Int32*, HRESULT)
    get_more_available : Proc(IRTCUserSearchResultsEvent*, Int16*, HRESULT)
  end

  struct IRTCUserSearchResultsEvent
    lpVtbl : IRTCUserSearchResultsEventVTbl*
  end

  struct IRTCSessionReferStatusEventVTbl
    query_interface : Proc(IRTCSessionReferStatusEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionReferStatusEvent*, UInt32)
    release : Proc(IRTCSessionReferStatusEvent*, UInt32)
    get_type_info_count : Proc(IRTCSessionReferStatusEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCSessionReferStatusEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCSessionReferStatusEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCSessionReferStatusEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCSessionReferStatusEvent*, IRTCSession2*, HRESULT)
    get_refer_status : Proc(IRTCSessionReferStatusEvent*, RTC_SESSION_REFER_STATUS*, HRESULT)
    get_status_code : Proc(IRTCSessionReferStatusEvent*, Int32*, HRESULT)
    get_status_text : Proc(IRTCSessionReferStatusEvent*, UInt8**, HRESULT)
  end

  struct IRTCSessionReferStatusEvent
    lpVtbl : IRTCSessionReferStatusEventVTbl*
  end

  struct IRTCSessionReferredEventVTbl
    query_interface : Proc(IRTCSessionReferredEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionReferredEvent*, UInt32)
    release : Proc(IRTCSessionReferredEvent*, UInt32)
    get_type_info_count : Proc(IRTCSessionReferredEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCSessionReferredEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCSessionReferredEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCSessionReferredEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_session : Proc(IRTCSessionReferredEvent*, IRTCSession2*, HRESULT)
    get_referred_by_uri : Proc(IRTCSessionReferredEvent*, UInt8**, HRESULT)
    get_refer_to_uri : Proc(IRTCSessionReferredEvent*, UInt8**, HRESULT)
    get_refer_cookie : Proc(IRTCSessionReferredEvent*, UInt8**, HRESULT)
    accept : Proc(IRTCSessionReferredEvent*, HRESULT)
    reject : Proc(IRTCSessionReferredEvent*, HRESULT)
    set_referred_session_state : Proc(IRTCSessionReferredEvent*, RTC_SESSION_STATE, HRESULT)
  end

  struct IRTCSessionReferredEvent
    lpVtbl : IRTCSessionReferredEventVTbl*
  end

  struct IRTCSessionDescriptionManagerVTbl
    query_interface : Proc(IRTCSessionDescriptionManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionDescriptionManager*, UInt32)
    release : Proc(IRTCSessionDescriptionManager*, UInt32)
    evaluate_session_description : Proc(IRTCSessionDescriptionManager*, UInt8*, UInt8*, Int16*, HRESULT)
  end

  struct IRTCSessionDescriptionManager
    lpVtbl : IRTCSessionDescriptionManagerVTbl*
  end

  struct IRTCEnumPresenceDevicesVTbl
    query_interface : Proc(IRTCEnumPresenceDevices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEnumPresenceDevices*, UInt32)
    release : Proc(IRTCEnumPresenceDevices*, UInt32)
    next : Proc(IRTCEnumPresenceDevices*, UInt32, IRTCPresenceDevice*, UInt32*, HRESULT)
    reset : Proc(IRTCEnumPresenceDevices*, HRESULT)
    skip : Proc(IRTCEnumPresenceDevices*, UInt32, HRESULT)
    clone : Proc(IRTCEnumPresenceDevices*, IRTCEnumPresenceDevices*, HRESULT)
  end

  struct IRTCEnumPresenceDevices
    lpVtbl : IRTCEnumPresenceDevicesVTbl*
  end

  struct IRTCPresenceDeviceVTbl
    query_interface : Proc(IRTCPresenceDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCPresenceDevice*, UInt32)
    release : Proc(IRTCPresenceDevice*, UInt32)
    get_status : Proc(IRTCPresenceDevice*, RTC_PRESENCE_STATUS*, HRESULT)
    get_notes : Proc(IRTCPresenceDevice*, UInt8**, HRESULT)
    get_presence_property : Proc(IRTCPresenceDevice*, RTC_PRESENCE_PROPERTY, UInt8**, HRESULT)
    get_presence_data : Proc(IRTCPresenceDevice*, UInt8**, UInt8**, HRESULT)
  end

  struct IRTCPresenceDevice
    lpVtbl : IRTCPresenceDeviceVTbl*
  end

  struct IRTCDispatchEventNotificationVTbl
    query_interface : Proc(IRTCDispatchEventNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCDispatchEventNotification*, UInt32)
    release : Proc(IRTCDispatchEventNotification*, UInt32)
    get_type_info_count : Proc(IRTCDispatchEventNotification*, UInt32*, HRESULT)
    get_type_info : Proc(IRTCDispatchEventNotification*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRTCDispatchEventNotification*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRTCDispatchEventNotification*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IRTCDispatchEventNotification
    lpVtbl : IRTCDispatchEventNotificationVTbl*
  end

  struct ITransportSettingsInternalVTbl
    query_interface : Proc(ITransportSettingsInternal*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransportSettingsInternal*, UInt32)
    release : Proc(ITransportSettingsInternal*, UInt32)
    apply_setting : Proc(ITransportSettingsInternal*, TRANSPORT_SETTING*, HRESULT)
    query_setting : Proc(ITransportSettingsInternal*, TRANSPORT_SETTING*, HRESULT)
  end

  struct ITransportSettingsInternal
    lpVtbl : ITransportSettingsInternalVTbl*
  end

  struct INetworkTransportSettingsVTbl
    query_interface : Proc(INetworkTransportSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkTransportSettings*, UInt32)
    release : Proc(INetworkTransportSettings*, UInt32)
    apply_setting : Proc(INetworkTransportSettings*, TRANSPORT_SETTING_ID*, UInt32, UInt8*, UInt32*, UInt8**, HRESULT)
    query_setting : Proc(INetworkTransportSettings*, TRANSPORT_SETTING_ID*, UInt32, UInt8*, UInt32*, UInt8**, HRESULT)
  end

  struct INetworkTransportSettings
    lpVtbl : INetworkTransportSettingsVTbl*
  end

  struct INotificationTransportSyncVTbl
    query_interface : Proc(INotificationTransportSync*, Guid*, Void**, HRESULT)
    add_ref : Proc(INotificationTransportSync*, UInt32)
    release : Proc(INotificationTransportSync*, UInt32)
    complete_delivery : Proc(INotificationTransportSync*, HRESULT)
    flush : Proc(INotificationTransportSync*, HRESULT)
  end

  struct INotificationTransportSync
    lpVtbl : INotificationTransportSyncVTbl*
  end

end
