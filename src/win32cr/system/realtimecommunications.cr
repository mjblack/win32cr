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
  CLSID_RTCClient = LibC::GUID.new(0x7a42ea29_u32, 0xa2b7_u16, 0x40c4_u16, StaticArray[0xb0_u8, 0x91_u8, 0xf6_u8, 0xf0_u8, 0x24_u8, 0xaa_u8, 0x89_u8, 0xbe_u8])


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

  IRTCClient_GUID = "07829e45-9a34-408e-a011-bddf13487cd1"
  IID_IRTCClient = LibC::GUID.new(0x7829e45_u32, 0x9a34_u16, 0x408e_u16, StaticArray[0xa0_u8, 0x11_u8, 0xbd_u8, 0xdf_u8, 0x13_u8, 0x48_u8, 0x7c_u8, 0xd1_u8])
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

  IRTCClient2_GUID = "0c91d71d-1064-42da-bfa5-572beb8eea84"
  IID_IRTCClient2 = LibC::GUID.new(0xc91d71d_u32, 0x1064_u16, 0x42da_u16, StaticArray[0xbf_u8, 0xa5_u8, 0x57_u8, 0x2b_u8, 0xeb_u8, 0x8e_u8, 0xea_u8, 0x84_u8])
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

  IRTCClientPresence_GUID = "11c3cbcc-0744-42d1-968a-51aa1bb274c6"
  IID_IRTCClientPresence = LibC::GUID.new(0x11c3cbcc_u32, 0x744_u16, 0x42d1_u16, StaticArray[0x96_u8, 0x8a_u8, 0x51_u8, 0xaa_u8, 0x1b_u8, 0xb2_u8, 0x74_u8, 0xc6_u8])
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

  IRTCClientPresence2_GUID = "ad1809e8-62f7-4783-909a-29c9d2cb1d34"
  IID_IRTCClientPresence2 = LibC::GUID.new(0xad1809e8_u32, 0x62f7_u16, 0x4783_u16, StaticArray[0x90_u8, 0x9a_u8, 0x29_u8, 0xc9_u8, 0xd2_u8, 0xcb_u8, 0x1d_u8, 0x34_u8])
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

  IRTCClientProvisioning_GUID = "b9f5cf06-65b9-4a80-a0e6-73cae3ef3822"
  IID_IRTCClientProvisioning = LibC::GUID.new(0xb9f5cf06_u32, 0x65b9_u16, 0x4a80_u16, StaticArray[0xa0_u8, 0xe6_u8, 0x73_u8, 0xca_u8, 0xe3_u8, 0xef_u8, 0x38_u8, 0x22_u8])
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

  IRTCClientProvisioning2_GUID = "a70909b5-f40e-4587-bb75-e6bc0845023e"
  IID_IRTCClientProvisioning2 = LibC::GUID.new(0xa70909b5_u32, 0xf40e_u16, 0x4587_u16, StaticArray[0xbb_u8, 0x75_u8, 0xe6_u8, 0xbc_u8, 0x8_u8, 0x45_u8, 0x2_u8, 0x3e_u8])
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

  IRTCProfile_GUID = "d07eca9e-4062-4dd4-9e7d-722a49ba7303"
  IID_IRTCProfile = LibC::GUID.new(0xd07eca9e_u32, 0x4062_u16, 0x4dd4_u16, StaticArray[0x9e_u8, 0x7d_u8, 0x72_u8, 0x2a_u8, 0x49_u8, 0xba_u8, 0x73_u8, 0x3_u8])
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

  IRTCProfile2_GUID = "4b81f84e-bdc7-4184-9154-3cb2dd7917fb"
  IID_IRTCProfile2 = LibC::GUID.new(0x4b81f84e_u32, 0xbdc7_u16, 0x4184_u16, StaticArray[0x91_u8, 0x54_u8, 0x3c_u8, 0xb2_u8, 0xdd_u8, 0x79_u8, 0x17_u8, 0xfb_u8])
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

  IRTCSession_GUID = "387c8086-99be-42fb-9973-7c0fc0ca9fa8"
  IID_IRTCSession = LibC::GUID.new(0x387c8086_u32, 0x99be_u16, 0x42fb_u16, StaticArray[0x99_u8, 0x73_u8, 0x7c_u8, 0xf_u8, 0xc0_u8, 0xca_u8, 0x9f_u8, 0xa8_u8])
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

  IRTCSession2_GUID = "17d7cdfc-b007-484c-99d2-86a8a820991d"
  IID_IRTCSession2 = LibC::GUID.new(0x17d7cdfc_u32, 0xb007_u16, 0x484c_u16, StaticArray[0x99_u8, 0xd2_u8, 0x86_u8, 0xa8_u8, 0xa8_u8, 0x20_u8, 0x99_u8, 0x1d_u8])
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

  IRTCSessionCallControl_GUID = "e9a50d94-190b-4f82-9530-3b8ebf60758a"
  IID_IRTCSessionCallControl = LibC::GUID.new(0xe9a50d94_u32, 0x190b_u16, 0x4f82_u16, StaticArray[0x95_u8, 0x30_u8, 0x3b_u8, 0x8e_u8, 0xbf_u8, 0x60_u8, 0x75_u8, 0x8a_u8])
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

  IRTCParticipant_GUID = "ae86add5-26b1-4414-af1d-b94cd938d739"
  IID_IRTCParticipant = LibC::GUID.new(0xae86add5_u32, 0x26b1_u16, 0x4414_u16, StaticArray[0xaf_u8, 0x1d_u8, 0xb9_u8, 0x4c_u8, 0xd9_u8, 0x38_u8, 0xd7_u8, 0x39_u8])
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

  IRTCRoamingEvent_GUID = "79960a6b-0cb1-4dc8-a805-7318e99902e8"
  IID_IRTCRoamingEvent = LibC::GUID.new(0x79960a6b_u32, 0xcb1_u16, 0x4dc8_u16, StaticArray[0xa8_u8, 0x5_u8, 0x73_u8, 0x18_u8, 0xe9_u8, 0x99_u8, 0x2_u8, 0xe8_u8])
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

  IRTCProfileEvent_GUID = "d6d5ab3b-770e-43e8-800a-79b062395fca"
  IID_IRTCProfileEvent = LibC::GUID.new(0xd6d5ab3b_u32, 0x770e_u16, 0x43e8_u16, StaticArray[0x80_u8, 0xa_u8, 0x79_u8, 0xb0_u8, 0x62_u8, 0x39_u8, 0x5f_u8, 0xca_u8])
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

  IRTCProfileEvent2_GUID = "62e56edc-03fa-4121-94fb-23493fd0ae64"
  IID_IRTCProfileEvent2 = LibC::GUID.new(0x62e56edc_u32, 0x3fa_u16, 0x4121_u16, StaticArray[0x94_u8, 0xfb_u8, 0x23_u8, 0x49_u8, 0x3f_u8, 0xd0_u8, 0xae_u8, 0x64_u8])
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

  IRTCClientEvent_GUID = "2b493b7a-3cba-4170-9c8b-76a9dacdd644"
  IID_IRTCClientEvent = LibC::GUID.new(0x2b493b7a_u32, 0x3cba_u16, 0x4170_u16, StaticArray[0x9c_u8, 0x8b_u8, 0x76_u8, 0xa9_u8, 0xda_u8, 0xcd_u8, 0xd6_u8, 0x44_u8])
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

  IRTCRegistrationStateChangeEvent_GUID = "62d0991b-50ab-4f02-b948-ca94f26f8f95"
  IID_IRTCRegistrationStateChangeEvent = LibC::GUID.new(0x62d0991b_u32, 0x50ab_u16, 0x4f02_u16, StaticArray[0xb9_u8, 0x48_u8, 0xca_u8, 0x94_u8, 0xf2_u8, 0x6f_u8, 0x8f_u8, 0x95_u8])
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

  IRTCSessionStateChangeEvent_GUID = "b5bad703-5952-48b3-9321-7f4500521506"
  IID_IRTCSessionStateChangeEvent = LibC::GUID.new(0xb5bad703_u32, 0x5952_u16, 0x48b3_u16, StaticArray[0x93_u8, 0x21_u8, 0x7f_u8, 0x45_u8, 0x0_u8, 0x52_u8, 0x15_u8, 0x6_u8])
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

  IRTCSessionStateChangeEvent2_GUID = "4f933171-6f95-4880-80d9-2ec8d495d261"
  IID_IRTCSessionStateChangeEvent2 = LibC::GUID.new(0x4f933171_u32, 0x6f95_u16, 0x4880_u16, StaticArray[0x80_u8, 0xd9_u8, 0x2e_u8, 0xc8_u8, 0xd4_u8, 0x95_u8, 0xd2_u8, 0x61_u8])
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

  IRTCSessionOperationCompleteEvent_GUID = "a6bff4c0-f7c8-4d3c-9a41-3550f78a95b0"
  IID_IRTCSessionOperationCompleteEvent = LibC::GUID.new(0xa6bff4c0_u32, 0xf7c8_u16, 0x4d3c_u16, StaticArray[0x9a_u8, 0x41_u8, 0x35_u8, 0x50_u8, 0xf7_u8, 0x8a_u8, 0x95_u8, 0xb0_u8])
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

  IRTCSessionOperationCompleteEvent2_GUID = "f6fc2a9b-d5bc-4241-b436-1b8460c13832"
  IID_IRTCSessionOperationCompleteEvent2 = LibC::GUID.new(0xf6fc2a9b_u32, 0xd5bc_u16, 0x4241_u16, StaticArray[0xb4_u8, 0x36_u8, 0x1b_u8, 0x84_u8, 0x60_u8, 0xc1_u8, 0x38_u8, 0x32_u8])
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

  IRTCParticipantStateChangeEvent_GUID = "09bcb597-f0fa-48f9-b420-468cea7fde04"
  IID_IRTCParticipantStateChangeEvent = LibC::GUID.new(0x9bcb597_u32, 0xf0fa_u16, 0x48f9_u16, StaticArray[0xb4_u8, 0x20_u8, 0x46_u8, 0x8c_u8, 0xea_u8, 0x7f_u8, 0xde_u8, 0x4_u8])
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

  IRTCMediaEvent_GUID = "099944fb-bcda-453e-8c41-e13da2adf7f3"
  IID_IRTCMediaEvent = LibC::GUID.new(0x99944fb_u32, 0xbcda_u16, 0x453e_u16, StaticArray[0x8c_u8, 0x41_u8, 0xe1_u8, 0x3d_u8, 0xa2_u8, 0xad_u8, 0xf7_u8, 0xf3_u8])
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

  IRTCIntensityEvent_GUID = "4c23bf51-390c-4992-a41d-41eec05b2a4b"
  IID_IRTCIntensityEvent = LibC::GUID.new(0x4c23bf51_u32, 0x390c_u16, 0x4992_u16, StaticArray[0xa4_u8, 0x1d_u8, 0x41_u8, 0xee_u8, 0xc0_u8, 0x5b_u8, 0x2a_u8, 0x4b_u8])
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

  IRTCMessagingEvent_GUID = "d3609541-1b29-4de5-a4ad-5aebaf319512"
  IID_IRTCMessagingEvent = LibC::GUID.new(0xd3609541_u32, 0x1b29_u16, 0x4de5_u16, StaticArray[0xa4_u8, 0xad_u8, 0x5a_u8, 0xeb_u8, 0xaf_u8, 0x31_u8, 0x95_u8, 0x12_u8])
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

  IRTCBuddyEvent_GUID = "f36d755d-17e6-404e-954f-0fc07574c78d"
  IID_IRTCBuddyEvent = LibC::GUID.new(0xf36d755d_u32, 0x17e6_u16, 0x404e_u16, StaticArray[0x95_u8, 0x4f_u8, 0xf_u8, 0xc0_u8, 0x75_u8, 0x74_u8, 0xc7_u8, 0x8d_u8])
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

  IRTCBuddyEvent2_GUID = "484a7f1e-73f0-4990-bfc2-60bc3978a720"
  IID_IRTCBuddyEvent2 = LibC::GUID.new(0x484a7f1e_u32, 0x73f0_u16, 0x4990_u16, StaticArray[0xbf_u8, 0xc2_u8, 0x60_u8, 0xbc_u8, 0x39_u8, 0x78_u8, 0xa7_u8, 0x20_u8])
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

  IRTCWatcherEvent_GUID = "f30d7261-587a-424f-822c-312788f43548"
  IID_IRTCWatcherEvent = LibC::GUID.new(0xf30d7261_u32, 0x587a_u16, 0x424f_u16, StaticArray[0x82_u8, 0x2c_u8, 0x31_u8, 0x27_u8, 0x88_u8, 0xf4_u8, 0x35_u8, 0x48_u8])
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

  IRTCWatcherEvent2_GUID = "e52891e8-188c-49af-b005-98ed13f83f9c"
  IID_IRTCWatcherEvent2 = LibC::GUID.new(0xe52891e8_u32, 0x188c_u16, 0x49af_u16, StaticArray[0xb0_u8, 0x5_u8, 0x98_u8, 0xed_u8, 0x13_u8, 0xf8_u8, 0x3f_u8, 0x9c_u8])
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

  IRTCBuddyGroupEvent_GUID = "3a79e1d1-b736-4414-96f8-bbc7f08863e4"
  IID_IRTCBuddyGroupEvent = LibC::GUID.new(0x3a79e1d1_u32, 0xb736_u16, 0x4414_u16, StaticArray[0x96_u8, 0xf8_u8, 0xbb_u8, 0xc7_u8, 0xf0_u8, 0x88_u8, 0x63_u8, 0xe4_u8])
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

  IRTCInfoEvent_GUID = "4e1d68ae-1912-4f49-b2c3-594fadfd425f"
  IID_IRTCInfoEvent = LibC::GUID.new(0x4e1d68ae_u32, 0x1912_u16, 0x4f49_u16, StaticArray[0xb2_u8, 0xc3_u8, 0x59_u8, 0x4f_u8, 0xad_u8, 0xfd_u8, 0x42_u8, 0x5f_u8])
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

  IRTCMediaRequestEvent_GUID = "52572d15-148c-4d97-a36c-2da55c289d63"
  IID_IRTCMediaRequestEvent = LibC::GUID.new(0x52572d15_u32, 0x148c_u16, 0x4d97_u16, StaticArray[0xa3_u8, 0x6c_u8, 0x2d_u8, 0xa5_u8, 0x5c_u8, 0x28_u8, 0x9d_u8, 0x63_u8])
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

  IRTCReInviteEvent_GUID = "11558d84-204c-43e7-99b0-2034e9417f7d"
  IID_IRTCReInviteEvent = LibC::GUID.new(0x11558d84_u32, 0x204c_u16, 0x43e7_u16, StaticArray[0x99_u8, 0xb0_u8, 0x20_u8, 0x34_u8, 0xe9_u8, 0x41_u8, 0x7f_u8, 0x7d_u8])
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

  IRTCPresencePropertyEvent_GUID = "f777f570-a820-49d5-86bd-e099493f1518"
  IID_IRTCPresencePropertyEvent = LibC::GUID.new(0xf777f570_u32, 0xa820_u16, 0x49d5_u16, StaticArray[0x86_u8, 0xbd_u8, 0xe0_u8, 0x99_u8, 0x49_u8, 0x3f_u8, 0x15_u8, 0x18_u8])
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

  IRTCPresenceDataEvent_GUID = "38f0e78c-8b87-4c04-a82d-aedd83c909bb"
  IID_IRTCPresenceDataEvent = LibC::GUID.new(0x38f0e78c_u32, 0x8b87_u16, 0x4c04_u16, StaticArray[0xa8_u8, 0x2d_u8, 0xae_u8, 0xdd_u8, 0x83_u8, 0xc9_u8, 0x9_u8, 0xbb_u8])
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

  IRTCPresenceStatusEvent_GUID = "78673f32-4a0f-462c-89aa-ee7706707678"
  IID_IRTCPresenceStatusEvent = LibC::GUID.new(0x78673f32_u32, 0x4a0f_u16, 0x462c_u16, StaticArray[0x89_u8, 0xaa_u8, 0xee_u8, 0x77_u8, 0x6_u8, 0x70_u8, 0x76_u8, 0x78_u8])
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

  IRTCCollection_GUID = "ec7c8096-b918-4044-94f1-e4fba0361d5c"
  IID_IRTCCollection = LibC::GUID.new(0xec7c8096_u32, 0xb918_u16, 0x4044_u16, StaticArray[0x94_u8, 0xf1_u8, 0xe4_u8, 0xfb_u8, 0xa0_u8, 0x36_u8, 0x1d_u8, 0x5c_u8])
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

  IRTCEnumParticipants_GUID = "fcd56f29-4a4f-41b2-ba5c-f5bccc060bf6"
  IID_IRTCEnumParticipants = LibC::GUID.new(0xfcd56f29_u32, 0x4a4f_u16, 0x41b2_u16, StaticArray[0xba_u8, 0x5c_u8, 0xf5_u8, 0xbc_u8, 0xcc_u8, 0x6_u8, 0xb_u8, 0xf6_u8])
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

  IRTCEnumProfiles_GUID = "29b7c41c-ed82-4bca-84ad-39d5101b58e3"
  IID_IRTCEnumProfiles = LibC::GUID.new(0x29b7c41c_u32, 0xed82_u16, 0x4bca_u16, StaticArray[0x84_u8, 0xad_u8, 0x39_u8, 0xd5_u8, 0x10_u8, 0x1b_u8, 0x58_u8, 0xe3_u8])
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

  IRTCEnumBuddies_GUID = "f7296917-5569-4b3b-b3af-98d1144b2b87"
  IID_IRTCEnumBuddies = LibC::GUID.new(0xf7296917_u32, 0x5569_u16, 0x4b3b_u16, StaticArray[0xb3_u8, 0xaf_u8, 0x98_u8, 0xd1_u8, 0x14_u8, 0x4b_u8, 0x2b_u8, 0x87_u8])
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

  IRTCEnumWatchers_GUID = "a87d55d7-db74-4ed1-9ca4-77a0e41b413e"
  IID_IRTCEnumWatchers = LibC::GUID.new(0xa87d55d7_u32, 0xdb74_u16, 0x4ed1_u16, StaticArray[0x9c_u8, 0xa4_u8, 0x77_u8, 0xa0_u8, 0xe4_u8, 0x1b_u8, 0x41_u8, 0x3e_u8])
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

  IRTCEnumGroups_GUID = "742378d6-a141-4415-8f27-35d99076cf5d"
  IID_IRTCEnumGroups = LibC::GUID.new(0x742378d6_u32, 0xa141_u16, 0x4415_u16, StaticArray[0x8f_u8, 0x27_u8, 0x35_u8, 0xd9_u8, 0x90_u8, 0x76_u8, 0xcf_u8, 0x5d_u8])
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

  IRTCPresenceContact_GUID = "8b22f92c-cd90-42db-a733-212205c3e3df"
  IID_IRTCPresenceContact = LibC::GUID.new(0x8b22f92c_u32, 0xcd90_u16, 0x42db_u16, StaticArray[0xa7_u8, 0x33_u8, 0x21_u8, 0x22_u8, 0x5_u8, 0xc3_u8, 0xe3_u8, 0xdf_u8])
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

  IRTCBuddy_GUID = "fcb136c8-7b90-4e0c-befe-56edf0ba6f1c"
  IID_IRTCBuddy = LibC::GUID.new(0xfcb136c8_u32, 0x7b90_u16, 0x4e0c_u16, StaticArray[0xbe_u8, 0xfe_u8, 0x56_u8, 0xed_u8, 0xf0_u8, 0xba_u8, 0x6f_u8, 0x1c_u8])
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

  IRTCBuddy2_GUID = "102f9588-23e7-40e3-954d-cd7a1d5c0361"
  IID_IRTCBuddy2 = LibC::GUID.new(0x102f9588_u32, 0x23e7_u16, 0x40e3_u16, StaticArray[0x95_u8, 0x4d_u8, 0xcd_u8, 0x7a_u8, 0x1d_u8, 0x5c_u8, 0x3_u8, 0x61_u8])
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

  IRTCWatcher_GUID = "c7cedad8-346b-4d1b-ac02-a2088df9be4f"
  IID_IRTCWatcher = LibC::GUID.new(0xc7cedad8_u32, 0x346b_u16, 0x4d1b_u16, StaticArray[0xac_u8, 0x2_u8, 0xa2_u8, 0x8_u8, 0x8d_u8, 0xf9_u8, 0xbe_u8, 0x4f_u8])
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

  IRTCWatcher2_GUID = "d4d9967f-d011-4b1d-91e3-aba78f96393d"
  IID_IRTCWatcher2 = LibC::GUID.new(0xd4d9967f_u32, 0xd011_u16, 0x4b1d_u16, StaticArray[0x91_u8, 0xe3_u8, 0xab_u8, 0xa7_u8, 0x8f_u8, 0x96_u8, 0x39_u8, 0x3d_u8])
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

  IRTCBuddyGroup_GUID = "60361e68-9164-4389-a4c6-d0b3925bda5e"
  IID_IRTCBuddyGroup = LibC::GUID.new(0x60361e68_u32, 0x9164_u16, 0x4389_u16, StaticArray[0xa4_u8, 0xc6_u8, 0xd0_u8, 0xb3_u8, 0x92_u8, 0x5b_u8, 0xda_u8, 0x5e_u8])
  struct IRTCBuddyGroup
    lpVtbl : IRTCBuddyGroupVTbl*
  end

  struct IRTCEventNotificationVTbl
    query_interface : Proc(IRTCEventNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCEventNotification*, UInt32)
    release : Proc(IRTCEventNotification*, UInt32)
    event : Proc(IRTCEventNotification*, RTC_EVENT, IDispatch, HRESULT)
  end

  IRTCEventNotification_GUID = "13fa24c7-5748-4b21-91f5-7397609ce747"
  IID_IRTCEventNotification = LibC::GUID.new(0x13fa24c7_u32, 0x5748_u16, 0x4b21_u16, StaticArray[0x91_u8, 0xf5_u8, 0x73_u8, 0x97_u8, 0x60_u8, 0x9c_u8, 0xe7_u8, 0x47_u8])
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

  IRTCPortManager_GUID = "da77c14b-6208-43ca-8ddf-5b60a0a69fac"
  IID_IRTCPortManager = LibC::GUID.new(0xda77c14b_u32, 0x6208_u16, 0x43ca_u16, StaticArray[0x8d_u8, 0xdf_u8, 0x5b_u8, 0x60_u8, 0xa0_u8, 0xa6_u8, 0x9f_u8, 0xac_u8])
  struct IRTCPortManager
    lpVtbl : IRTCPortManagerVTbl*
  end

  struct IRTCSessionPortManagementVTbl
    query_interface : Proc(IRTCSessionPortManagement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionPortManagement*, UInt32)
    release : Proc(IRTCSessionPortManagement*, UInt32)
    set_port_manager : Proc(IRTCSessionPortManagement*, IRTCPortManager, HRESULT)
  end

  IRTCSessionPortManagement_GUID = "a072f1d6-0286-4e1f-85f2-17a2948456ec"
  IID_IRTCSessionPortManagement = LibC::GUID.new(0xa072f1d6_u32, 0x286_u16, 0x4e1f_u16, StaticArray[0x85_u8, 0xf2_u8, 0x17_u8, 0xa2_u8, 0x94_u8, 0x84_u8, 0x56_u8, 0xec_u8])
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

  IRTCClientPortManagement_GUID = "d5df3f03-4bde-4417-aefe-71177bdaea66"
  IID_IRTCClientPortManagement = LibC::GUID.new(0xd5df3f03_u32, 0x4bde_u16, 0x4417_u16, StaticArray[0xae_u8, 0xfe_u8, 0x71_u8, 0x17_u8, 0x7b_u8, 0xda_u8, 0xea_u8, 0x66_u8])
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

  IRTCUserSearch_GUID = "b619882b-860c-4db4-be1b-693b6505bbe5"
  IID_IRTCUserSearch = LibC::GUID.new(0xb619882b_u32, 0x860c_u16, 0x4db4_u16, StaticArray[0xbe_u8, 0x1b_u8, 0x69_u8, 0x3b_u8, 0x65_u8, 0x5_u8, 0xbb_u8, 0xe5_u8])
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

  IRTCUserSearchQuery_GUID = "288300f5-d23a-4365-9a73-9985c98c2881"
  IID_IRTCUserSearchQuery = LibC::GUID.new(0x288300f5_u32, 0xd23a_u16, 0x4365_u16, StaticArray[0x9a_u8, 0x73_u8, 0x99_u8, 0x85_u8, 0xc9_u8, 0x8c_u8, 0x28_u8, 0x81_u8])
  struct IRTCUserSearchQuery
    lpVtbl : IRTCUserSearchQueryVTbl*
  end

  struct IRTCUserSearchResultVTbl
    query_interface : Proc(IRTCUserSearchResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCUserSearchResult*, UInt32)
    release : Proc(IRTCUserSearchResult*, UInt32)
    get_value : Proc(IRTCUserSearchResult*, RTC_USER_SEARCH_COLUMN, UInt8**, HRESULT)
  end

  IRTCUserSearchResult_GUID = "851278b2-9592-480f-8db5-2de86b26b54d"
  IID_IRTCUserSearchResult = LibC::GUID.new(0x851278b2_u32, 0x9592_u16, 0x480f_u16, StaticArray[0x8d_u8, 0xb5_u8, 0x2d_u8, 0xe8_u8, 0x6b_u8, 0x26_u8, 0xb5_u8, 0x4d_u8])
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

  IRTCEnumUserSearchResults_GUID = "83d4d877-aa5d-4a5b-8d0e-002a8067e0e8"
  IID_IRTCEnumUserSearchResults = LibC::GUID.new(0x83d4d877_u32, 0xaa5d_u16, 0x4a5b_u16, StaticArray[0x8d_u8, 0xe_u8, 0x0_u8, 0x2a_u8, 0x80_u8, 0x67_u8, 0xe0_u8, 0xe8_u8])
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

  IRTCUserSearchResultsEvent_GUID = "d8c8c3cd-7fac-4088-81c5-c24cbc0938e3"
  IID_IRTCUserSearchResultsEvent = LibC::GUID.new(0xd8c8c3cd_u32, 0x7fac_u16, 0x4088_u16, StaticArray[0x81_u8, 0xc5_u8, 0xc2_u8, 0x4c_u8, 0xbc_u8, 0x9_u8, 0x38_u8, 0xe3_u8])
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

  IRTCSessionReferStatusEvent_GUID = "3d8fc2cd-5d76-44ab-bb68-2a80353b34a2"
  IID_IRTCSessionReferStatusEvent = LibC::GUID.new(0x3d8fc2cd_u32, 0x5d76_u16, 0x44ab_u16, StaticArray[0xbb_u8, 0x68_u8, 0x2a_u8, 0x80_u8, 0x35_u8, 0x3b_u8, 0x34_u8, 0xa2_u8])
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

  IRTCSessionReferredEvent_GUID = "176a6828-4fcc-4f28-a862-04597a6cf1c4"
  IID_IRTCSessionReferredEvent = LibC::GUID.new(0x176a6828_u32, 0x4fcc_u16, 0x4f28_u16, StaticArray[0xa8_u8, 0x62_u8, 0x4_u8, 0x59_u8, 0x7a_u8, 0x6c_u8, 0xf1_u8, 0xc4_u8])
  struct IRTCSessionReferredEvent
    lpVtbl : IRTCSessionReferredEventVTbl*
  end

  struct IRTCSessionDescriptionManagerVTbl
    query_interface : Proc(IRTCSessionDescriptionManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRTCSessionDescriptionManager*, UInt32)
    release : Proc(IRTCSessionDescriptionManager*, UInt32)
    evaluate_session_description : Proc(IRTCSessionDescriptionManager*, UInt8*, UInt8*, Int16*, HRESULT)
  end

  IRTCSessionDescriptionManager_GUID = "ba7f518e-d336-4070-93a6-865395c843f9"
  IID_IRTCSessionDescriptionManager = LibC::GUID.new(0xba7f518e_u32, 0xd336_u16, 0x4070_u16, StaticArray[0x93_u8, 0xa6_u8, 0x86_u8, 0x53_u8, 0x95_u8, 0xc8_u8, 0x43_u8, 0xf9_u8])
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

  IRTCEnumPresenceDevices_GUID = "708c2ab7-8bf8-42f8-8c7d-635197ad5539"
  IID_IRTCEnumPresenceDevices = LibC::GUID.new(0x708c2ab7_u32, 0x8bf8_u16, 0x42f8_u16, StaticArray[0x8c_u8, 0x7d_u8, 0x63_u8, 0x51_u8, 0x97_u8, 0xad_u8, 0x55_u8, 0x39_u8])
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

  IRTCPresenceDevice_GUID = "bc6a90dd-ad9a-48da-9b0c-2515e38521ad"
  IID_IRTCPresenceDevice = LibC::GUID.new(0xbc6a90dd_u32, 0xad9a_u16, 0x48da_u16, StaticArray[0x9b_u8, 0xc_u8, 0x25_u8, 0x15_u8, 0xe3_u8, 0x85_u8, 0x21_u8, 0xad_u8])
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

  IRTCDispatchEventNotification_GUID = "176ddfbe-fec0-4d55-bc87-84cff1ef7f91"
  IID_IRTCDispatchEventNotification = LibC::GUID.new(0x176ddfbe_u32, 0xfec0_u16, 0x4d55_u16, StaticArray[0xbc_u8, 0x87_u8, 0x84_u8, 0xcf_u8, 0xf1_u8, 0xef_u8, 0x7f_u8, 0x91_u8])
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

  ITransportSettingsInternal_GUID = "5123e076-29e3-4bfd-84fe-0192d411e3e8"
  IID_ITransportSettingsInternal = LibC::GUID.new(0x5123e076_u32, 0x29e3_u16, 0x4bfd_u16, StaticArray[0x84_u8, 0xfe_u8, 0x1_u8, 0x92_u8, 0xd4_u8, 0x11_u8, 0xe3_u8, 0xe8_u8])
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

  INetworkTransportSettings_GUID = "5e7abb2c-f2c1-4a61-bd35-deb7a08ab0f1"
  IID_INetworkTransportSettings = LibC::GUID.new(0x5e7abb2c_u32, 0xf2c1_u16, 0x4a61_u16, StaticArray[0xbd_u8, 0x35_u8, 0xde_u8, 0xb7_u8, 0xa0_u8, 0x8a_u8, 0xb0_u8, 0xf1_u8])
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

  INotificationTransportSync_GUID = "79eb1402-0ab8-49c0-9e14-a1ae4ba93058"
  IID_INotificationTransportSync = LibC::GUID.new(0x79eb1402_u32, 0xab8_u16, 0x49c0_u16, StaticArray[0x9e_u8, 0x14_u8, 0xa1_u8, 0xae_u8, 0x4b_u8, 0xa9_u8, 0x30_u8, 0x58_u8])
  struct INotificationTransportSync
    lpVtbl : INotificationTransportSyncVTbl*
  end

end
struct LibWin32::IRTCClient
  def query_interface(this : IRTCClient*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClient*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClient*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IRTCClient*) : HRESULT
    @lpVtbl.value.initialize.call(this)
  end
  def shutdown(this : IRTCClient*) : HRESULT
    @lpVtbl.value.shutdown.call(this)
  end
  def prepare_for_shutdown(this : IRTCClient*) : HRESULT
    @lpVtbl.value.prepare_for_shutdown.call(this)
  end
  def put_event_filter(this : IRTCClient*, lfilter : Int32) : HRESULT
    @lpVtbl.value.put_event_filter.call(this, lfilter)
  end
  def get_event_filter(this : IRTCClient*, plfilter : Int32*) : HRESULT
    @lpVtbl.value.get_event_filter.call(this, plfilter)
  end
  def set_preferred_media_types(this : IRTCClient*, lmediatypes : Int32, fpersistent : Int16) : HRESULT
    @lpVtbl.value.set_preferred_media_types.call(this, lmediatypes, fpersistent)
  end
  def get_preferred_media_types(this : IRTCClient*, plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_media_types.call(this, plmediatypes)
  end
  def get_media_capabilities(this : IRTCClient*, plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_media_capabilities.call(this, plmediatypes)
  end
  def create_session(this : IRTCClient*, entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.create_session.call(this, entype, bstrlocalphoneuri, pprofile, lflags, ppsession)
  end
  def put_listen_for_incoming_sessions(this : IRTCClient*, enlisten : RTC_LISTEN_MODE) : HRESULT
    @lpVtbl.value.put_listen_for_incoming_sessions.call(this, enlisten)
  end
  def get_listen_for_incoming_sessions(this : IRTCClient*, penlisten : RTC_LISTEN_MODE*) : HRESULT
    @lpVtbl.value.get_listen_for_incoming_sessions.call(this, penlisten)
  end
  def get_network_addresses(this : IRTCClient*, ftcp : Int16, fexternal : Int16, pvaddresses : VARIANT*) : HRESULT
    @lpVtbl.value.get_network_addresses.call(this, ftcp, fexternal, pvaddresses)
  end
  def put_volume(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_volume.call(this, endevice, lvolume)
  end
  def get_volume(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.call(this, endevice, plvolume)
  end
  def put_audio_muted(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, fmuted : Int16) : HRESULT
    @lpVtbl.value.put_audio_muted.call(this, endevice, fmuted)
  end
  def get_audio_muted(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, pfmuted : Int16*) : HRESULT
    @lpVtbl.value.get_audio_muted.call(this, endevice, pfmuted)
  end
  def get_i_video_window(this : IRTCClient*, endevice : RTC_VIDEO_DEVICE, ppivideowindow : IVideoWindow*) : HRESULT
    @lpVtbl.value.get_i_video_window.call(this, endevice, ppivideowindow)
  end
  def put_preferred_audio_device(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_audio_device.call(this, endevice, bstrdevicename)
  end
  def get_preferred_audio_device(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_audio_device.call(this, endevice, pbstrdevicename)
  end
  def put_preferred_volume(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_preferred_volume.call(this, endevice, lvolume)
  end
  def get_preferred_volume(this : IRTCClient*, endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_volume.call(this, endevice, plvolume)
  end
  def put_preferred_aec(this : IRTCClient*, benable : Int16) : HRESULT
    @lpVtbl.value.put_preferred_aec.call(this, benable)
  end
  def get_preferred_aec(this : IRTCClient*, pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_preferred_aec.call(this, pbenabled)
  end
  def put_preferred_video_device(this : IRTCClient*, bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_video_device.call(this, bstrdevicename)
  end
  def get_preferred_video_device(this : IRTCClient*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_video_device.call(this, pbstrdevicename)
  end
  def get_active_media(this : IRTCClient*, plmediatype : Int32*) : HRESULT
    @lpVtbl.value.get_active_media.call(this, plmediatype)
  end
  def put_max_bitrate(this : IRTCClient*, lmaxbitrate : Int32) : HRESULT
    @lpVtbl.value.put_max_bitrate.call(this, lmaxbitrate)
  end
  def get_max_bitrate(this : IRTCClient*, plmaxbitrate : Int32*) : HRESULT
    @lpVtbl.value.get_max_bitrate.call(this, plmaxbitrate)
  end
  def put_temporal_spatial_trade_off(this : IRTCClient*, lvalue : Int32) : HRESULT
    @lpVtbl.value.put_temporal_spatial_trade_off.call(this, lvalue)
  end
  def get_temporal_spatial_trade_off(this : IRTCClient*, plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_temporal_spatial_trade_off.call(this, plvalue)
  end
  def get_network_quality(this : IRTCClient*, plnetworkquality : Int32*) : HRESULT
    @lpVtbl.value.get_network_quality.call(this, plnetworkquality)
  end
  def start_t120_applet(this : IRTCClient*, enapplet : RTC_T120_APPLET) : HRESULT
    @lpVtbl.value.start_t120_applet.call(this, enapplet)
  end
  def stop_t120_applets(this : IRTCClient*) : HRESULT
    @lpVtbl.value.stop_t120_applets.call(this)
  end
  def get_is_t120_applet_running(this : IRTCClient*, enapplet : RTC_T120_APPLET, pfrunning : Int16*) : HRESULT
    @lpVtbl.value.get_is_t120_applet_running.call(this, enapplet, pfrunning)
  end
  def get_local_user_uri(this : IRTCClient*, pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_uri.call(this, pbstruseruri)
  end
  def put_local_user_uri(this : IRTCClient*, bstruseruri : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_uri.call(this, bstruseruri)
  end
  def get_local_user_name(this : IRTCClient*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_name.call(this, pbstrusername)
  end
  def put_local_user_name(this : IRTCClient*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_name.call(this, bstrusername)
  end
  def play_ring(this : IRTCClient*, entype : RTC_RING_TYPE, bplay : Int16) : HRESULT
    @lpVtbl.value.play_ring.call(this, entype, bplay)
  end
  def send_dtmf(this : IRTCClient*, endtmf : RTC_DTMF) : HRESULT
    @lpVtbl.value.send_dtmf.call(this, endtmf)
  end
  def invoke_tuning_wizard(this : IRTCClient*, hwndparent : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.invoke_tuning_wizard.call(this, hwndparent)
  end
  def get_is_tuned(this : IRTCClient*, pftuned : Int16*) : HRESULT
    @lpVtbl.value.get_is_tuned.call(this, pftuned)
  end
end
struct LibWin32::IRTCClient2
  def query_interface(this : IRTCClient2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClient2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClient2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IRTCClient2*) : HRESULT
    @lpVtbl.value.initialize.call(this)
  end
  def shutdown(this : IRTCClient2*) : HRESULT
    @lpVtbl.value.shutdown.call(this)
  end
  def prepare_for_shutdown(this : IRTCClient2*) : HRESULT
    @lpVtbl.value.prepare_for_shutdown.call(this)
  end
  def put_event_filter(this : IRTCClient2*, lfilter : Int32) : HRESULT
    @lpVtbl.value.put_event_filter.call(this, lfilter)
  end
  def get_event_filter(this : IRTCClient2*, plfilter : Int32*) : HRESULT
    @lpVtbl.value.get_event_filter.call(this, plfilter)
  end
  def set_preferred_media_types(this : IRTCClient2*, lmediatypes : Int32, fpersistent : Int16) : HRESULT
    @lpVtbl.value.set_preferred_media_types.call(this, lmediatypes, fpersistent)
  end
  def get_preferred_media_types(this : IRTCClient2*, plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_media_types.call(this, plmediatypes)
  end
  def get_media_capabilities(this : IRTCClient2*, plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_media_capabilities.call(this, plmediatypes)
  end
  def create_session(this : IRTCClient2*, entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.create_session.call(this, entype, bstrlocalphoneuri, pprofile, lflags, ppsession)
  end
  def put_listen_for_incoming_sessions(this : IRTCClient2*, enlisten : RTC_LISTEN_MODE) : HRESULT
    @lpVtbl.value.put_listen_for_incoming_sessions.call(this, enlisten)
  end
  def get_listen_for_incoming_sessions(this : IRTCClient2*, penlisten : RTC_LISTEN_MODE*) : HRESULT
    @lpVtbl.value.get_listen_for_incoming_sessions.call(this, penlisten)
  end
  def get_network_addresses(this : IRTCClient2*, ftcp : Int16, fexternal : Int16, pvaddresses : VARIANT*) : HRESULT
    @lpVtbl.value.get_network_addresses.call(this, ftcp, fexternal, pvaddresses)
  end
  def put_volume(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_volume.call(this, endevice, lvolume)
  end
  def get_volume(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.call(this, endevice, plvolume)
  end
  def put_audio_muted(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, fmuted : Int16) : HRESULT
    @lpVtbl.value.put_audio_muted.call(this, endevice, fmuted)
  end
  def get_audio_muted(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, pfmuted : Int16*) : HRESULT
    @lpVtbl.value.get_audio_muted.call(this, endevice, pfmuted)
  end
  def get_i_video_window(this : IRTCClient2*, endevice : RTC_VIDEO_DEVICE, ppivideowindow : IVideoWindow*) : HRESULT
    @lpVtbl.value.get_i_video_window.call(this, endevice, ppivideowindow)
  end
  def put_preferred_audio_device(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_audio_device.call(this, endevice, bstrdevicename)
  end
  def get_preferred_audio_device(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_audio_device.call(this, endevice, pbstrdevicename)
  end
  def put_preferred_volume(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_preferred_volume.call(this, endevice, lvolume)
  end
  def get_preferred_volume(this : IRTCClient2*, endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_volume.call(this, endevice, plvolume)
  end
  def put_preferred_aec(this : IRTCClient2*, benable : Int16) : HRESULT
    @lpVtbl.value.put_preferred_aec.call(this, benable)
  end
  def get_preferred_aec(this : IRTCClient2*, pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_preferred_aec.call(this, pbenabled)
  end
  def put_preferred_video_device(this : IRTCClient2*, bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_video_device.call(this, bstrdevicename)
  end
  def get_preferred_video_device(this : IRTCClient2*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_video_device.call(this, pbstrdevicename)
  end
  def get_active_media(this : IRTCClient2*, plmediatype : Int32*) : HRESULT
    @lpVtbl.value.get_active_media.call(this, plmediatype)
  end
  def put_max_bitrate(this : IRTCClient2*, lmaxbitrate : Int32) : HRESULT
    @lpVtbl.value.put_max_bitrate.call(this, lmaxbitrate)
  end
  def get_max_bitrate(this : IRTCClient2*, plmaxbitrate : Int32*) : HRESULT
    @lpVtbl.value.get_max_bitrate.call(this, plmaxbitrate)
  end
  def put_temporal_spatial_trade_off(this : IRTCClient2*, lvalue : Int32) : HRESULT
    @lpVtbl.value.put_temporal_spatial_trade_off.call(this, lvalue)
  end
  def get_temporal_spatial_trade_off(this : IRTCClient2*, plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_temporal_spatial_trade_off.call(this, plvalue)
  end
  def get_network_quality(this : IRTCClient2*, plnetworkquality : Int32*) : HRESULT
    @lpVtbl.value.get_network_quality.call(this, plnetworkquality)
  end
  def start_t120_applet(this : IRTCClient2*, enapplet : RTC_T120_APPLET) : HRESULT
    @lpVtbl.value.start_t120_applet.call(this, enapplet)
  end
  def stop_t120_applets(this : IRTCClient2*) : HRESULT
    @lpVtbl.value.stop_t120_applets.call(this)
  end
  def get_is_t120_applet_running(this : IRTCClient2*, enapplet : RTC_T120_APPLET, pfrunning : Int16*) : HRESULT
    @lpVtbl.value.get_is_t120_applet_running.call(this, enapplet, pfrunning)
  end
  def get_local_user_uri(this : IRTCClient2*, pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_uri.call(this, pbstruseruri)
  end
  def put_local_user_uri(this : IRTCClient2*, bstruseruri : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_uri.call(this, bstruseruri)
  end
  def get_local_user_name(this : IRTCClient2*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_name.call(this, pbstrusername)
  end
  def put_local_user_name(this : IRTCClient2*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_name.call(this, bstrusername)
  end
  def play_ring(this : IRTCClient2*, entype : RTC_RING_TYPE, bplay : Int16) : HRESULT
    @lpVtbl.value.play_ring.call(this, entype, bplay)
  end
  def send_dtmf(this : IRTCClient2*, endtmf : RTC_DTMF) : HRESULT
    @lpVtbl.value.send_dtmf.call(this, endtmf)
  end
  def invoke_tuning_wizard(this : IRTCClient2*, hwndparent : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.invoke_tuning_wizard.call(this, hwndparent)
  end
  def get_is_tuned(this : IRTCClient2*, pftuned : Int16*) : HRESULT
    @lpVtbl.value.get_is_tuned.call(this, pftuned)
  end
  def put_answer_mode(this : IRTCClient2*, entype : RTC_SESSION_TYPE, enmode : RTC_ANSWER_MODE) : HRESULT
    @lpVtbl.value.put_answer_mode.call(this, entype, enmode)
  end
  def get_answer_mode(this : IRTCClient2*, entype : RTC_SESSION_TYPE, penmode : RTC_ANSWER_MODE*) : HRESULT
    @lpVtbl.value.get_answer_mode.call(this, entype, penmode)
  end
  def invoke_tuning_wizard_ex(this : IRTCClient2*, hwndparent : LibC::IntPtrT, fallowaudio : Int16, fallowvideo : Int16) : HRESULT
    @lpVtbl.value.invoke_tuning_wizard_ex.call(this, hwndparent, fallowaudio, fallowvideo)
  end
  def get_version(this : IRTCClient2*, plversion : Int32*) : HRESULT
    @lpVtbl.value.get_version.call(this, plversion)
  end
  def put_client_name(this : IRTCClient2*, bstrclientname : UInt8*) : HRESULT
    @lpVtbl.value.put_client_name.call(this, bstrclientname)
  end
  def put_client_cur_ver(this : IRTCClient2*, bstrclientcurver : UInt8*) : HRESULT
    @lpVtbl.value.put_client_cur_ver.call(this, bstrclientcurver)
  end
  def initialize_ex(this : IRTCClient2*, lflags : Int32) : HRESULT
    @lpVtbl.value.initialize_ex.call(this, lflags)
  end
  def create_session_with_description(this : IRTCClient2*, bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppsession2 : IRTCSession2*) : HRESULT
    @lpVtbl.value.create_session_with_description.call(this, bstrcontenttype, bstrsessiondescription, pprofile, lflags, ppsession2)
  end
  def set_session_description_manager(this : IRTCClient2*, psessiondescriptionmanager : IRTCSessionDescriptionManager) : HRESULT
    @lpVtbl.value.set_session_description_manager.call(this, psessiondescriptionmanager)
  end
  def put_preferred_security_level(this : IRTCClient2*, ensecuritytype : RTC_SECURITY_TYPE, ensecuritylevel : RTC_SECURITY_LEVEL) : HRESULT
    @lpVtbl.value.put_preferred_security_level.call(this, ensecuritytype, ensecuritylevel)
  end
  def get_preferred_security_level(this : IRTCClient2*, ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_preferred_security_level.call(this, ensecuritytype, pensecuritylevel)
  end
  def put_allowed_ports(this : IRTCClient2*, ltransport : Int32, enlistenmode : RTC_LISTEN_MODE) : HRESULT
    @lpVtbl.value.put_allowed_ports.call(this, ltransport, enlistenmode)
  end
  def get_allowed_ports(this : IRTCClient2*, ltransport : Int32, penlistenmode : RTC_LISTEN_MODE*) : HRESULT
    @lpVtbl.value.get_allowed_ports.call(this, ltransport, penlistenmode)
  end
end
struct LibWin32::IRTCClientPresence
  def query_interface(this : IRTCClientPresence*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClientPresence*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClientPresence*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable_presence(this : IRTCClientPresence*, fusestorage : Int16, varstorage : VARIANT) : HRESULT
    @lpVtbl.value.enable_presence.call(this, fusestorage, varstorage)
  end
  def export(this : IRTCClientPresence*, varstorage : VARIANT) : HRESULT
    @lpVtbl.value.export.call(this, varstorage)
  end
  def import(this : IRTCClientPresence*, varstorage : VARIANT, freplaceall : Int16) : HRESULT
    @lpVtbl.value.import.call(this, varstorage, freplaceall)
  end
  def enumerate_buddies(this : IRTCClientPresence*, ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.enumerate_buddies.call(this, ppenum)
  end
  def get_buddies(this : IRTCClientPresence*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_buddies.call(this, ppcollection)
  end
  def get_buddy(this : IRTCClientPresence*, bstrpresentityuri : UInt8*, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.call(this, bstrpresentityuri, ppbuddy)
  end
  def add_buddy(this : IRTCClientPresence*, bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fpersistent : Int16, pprofile : IRTCProfile, lflags : Int32, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.add_buddy.call(this, bstrpresentityuri, bstrusername, bstrdata, fpersistent, pprofile, lflags, ppbuddy)
  end
  def remove_buddy(this : IRTCClientPresence*, pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.remove_buddy.call(this, pbuddy)
  end
  def enumerate_watchers(this : IRTCClientPresence*, ppenum : IRTCEnumWatchers*) : HRESULT
    @lpVtbl.value.enumerate_watchers.call(this, ppenum)
  end
  def get_watchers(this : IRTCClientPresence*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_watchers.call(this, ppcollection)
  end
  def get_watcher(this : IRTCClientPresence*, bstrpresentityuri : UInt8*, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.call(this, bstrpresentityuri, ppwatcher)
  end
  def add_watcher(this : IRTCClientPresence*, bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fblocked : Int16, fpersistent : Int16, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.add_watcher.call(this, bstrpresentityuri, bstrusername, bstrdata, fblocked, fpersistent, ppwatcher)
  end
  def remove_watcher(this : IRTCClientPresence*, pwatcher : IRTCWatcher) : HRESULT
    @lpVtbl.value.remove_watcher.call(this, pwatcher)
  end
  def set_local_presence_info(this : IRTCClientPresence*, enstatus : RTC_PRESENCE_STATUS, bstrnotes : UInt8*) : HRESULT
    @lpVtbl.value.set_local_presence_info.call(this, enstatus, bstrnotes)
  end
  def get_offer_watcher_mode(this : IRTCClientPresence*, penmode : RTC_OFFER_WATCHER_MODE*) : HRESULT
    @lpVtbl.value.get_offer_watcher_mode.call(this, penmode)
  end
  def put_offer_watcher_mode(this : IRTCClientPresence*, enmode : RTC_OFFER_WATCHER_MODE) : HRESULT
    @lpVtbl.value.put_offer_watcher_mode.call(this, enmode)
  end
  def get_privacy_mode(this : IRTCClientPresence*, penmode : RTC_PRIVACY_MODE*) : HRESULT
    @lpVtbl.value.get_privacy_mode.call(this, penmode)
  end
  def put_privacy_mode(this : IRTCClientPresence*, enmode : RTC_PRIVACY_MODE) : HRESULT
    @lpVtbl.value.put_privacy_mode.call(this, enmode)
  end
end
struct LibWin32::IRTCClientPresence2
  def query_interface(this : IRTCClientPresence2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClientPresence2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClientPresence2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable_presence(this : IRTCClientPresence2*, fusestorage : Int16, varstorage : VARIANT) : HRESULT
    @lpVtbl.value.enable_presence.call(this, fusestorage, varstorage)
  end
  def export(this : IRTCClientPresence2*, varstorage : VARIANT) : HRESULT
    @lpVtbl.value.export.call(this, varstorage)
  end
  def import(this : IRTCClientPresence2*, varstorage : VARIANT, freplaceall : Int16) : HRESULT
    @lpVtbl.value.import.call(this, varstorage, freplaceall)
  end
  def enumerate_buddies(this : IRTCClientPresence2*, ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.enumerate_buddies.call(this, ppenum)
  end
  def get_buddies(this : IRTCClientPresence2*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_buddies.call(this, ppcollection)
  end
  def get_buddy(this : IRTCClientPresence2*, bstrpresentityuri : UInt8*, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.call(this, bstrpresentityuri, ppbuddy)
  end
  def add_buddy(this : IRTCClientPresence2*, bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fpersistent : Int16, pprofile : IRTCProfile, lflags : Int32, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.add_buddy.call(this, bstrpresentityuri, bstrusername, bstrdata, fpersistent, pprofile, lflags, ppbuddy)
  end
  def remove_buddy(this : IRTCClientPresence2*, pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.remove_buddy.call(this, pbuddy)
  end
  def enumerate_watchers(this : IRTCClientPresence2*, ppenum : IRTCEnumWatchers*) : HRESULT
    @lpVtbl.value.enumerate_watchers.call(this, ppenum)
  end
  def get_watchers(this : IRTCClientPresence2*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_watchers.call(this, ppcollection)
  end
  def get_watcher(this : IRTCClientPresence2*, bstrpresentityuri : UInt8*, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.call(this, bstrpresentityuri, ppwatcher)
  end
  def add_watcher(this : IRTCClientPresence2*, bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fblocked : Int16, fpersistent : Int16, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.add_watcher.call(this, bstrpresentityuri, bstrusername, bstrdata, fblocked, fpersistent, ppwatcher)
  end
  def remove_watcher(this : IRTCClientPresence2*, pwatcher : IRTCWatcher) : HRESULT
    @lpVtbl.value.remove_watcher.call(this, pwatcher)
  end
  def set_local_presence_info(this : IRTCClientPresence2*, enstatus : RTC_PRESENCE_STATUS, bstrnotes : UInt8*) : HRESULT
    @lpVtbl.value.set_local_presence_info.call(this, enstatus, bstrnotes)
  end
  def get_offer_watcher_mode(this : IRTCClientPresence2*, penmode : RTC_OFFER_WATCHER_MODE*) : HRESULT
    @lpVtbl.value.get_offer_watcher_mode.call(this, penmode)
  end
  def put_offer_watcher_mode(this : IRTCClientPresence2*, enmode : RTC_OFFER_WATCHER_MODE) : HRESULT
    @lpVtbl.value.put_offer_watcher_mode.call(this, enmode)
  end
  def get_privacy_mode(this : IRTCClientPresence2*, penmode : RTC_PRIVACY_MODE*) : HRESULT
    @lpVtbl.value.get_privacy_mode.call(this, penmode)
  end
  def put_privacy_mode(this : IRTCClientPresence2*, enmode : RTC_PRIVACY_MODE) : HRESULT
    @lpVtbl.value.put_privacy_mode.call(this, enmode)
  end
  def enable_presence_ex(this : IRTCClientPresence2*, pprofile : IRTCProfile, varstorage : VARIANT, lflags : Int32) : HRESULT
    @lpVtbl.value.enable_presence_ex.call(this, pprofile, varstorage, lflags)
  end
  def disable_presence(this : IRTCClientPresence2*) : HRESULT
    @lpVtbl.value.disable_presence.call(this)
  end
  def add_group(this : IRTCClientPresence2*, bstrgroupname : UInt8*, bstrdata : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppgroup : IRTCBuddyGroup*) : HRESULT
    @lpVtbl.value.add_group.call(this, bstrgroupname, bstrdata, pprofile, lflags, ppgroup)
  end
  def remove_group(this : IRTCClientPresence2*, pgroup : IRTCBuddyGroup) : HRESULT
    @lpVtbl.value.remove_group.call(this, pgroup)
  end
  def enumerate_groups(this : IRTCClientPresence2*, ppenum : IRTCEnumGroups*) : HRESULT
    @lpVtbl.value.enumerate_groups.call(this, ppenum)
  end
  def get_groups(this : IRTCClientPresence2*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_groups.call(this, ppcollection)
  end
  def get_group(this : IRTCClientPresence2*, bstrgroupname : UInt8*, ppgroup : IRTCBuddyGroup*) : HRESULT
    @lpVtbl.value.get_group.call(this, bstrgroupname, ppgroup)
  end
  def add_watcher_ex(this : IRTCClientPresence2*, bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, enstate : RTC_WATCHER_STATE, fpersistent : Int16, enscope : RTC_ACE_SCOPE, pprofile : IRTCProfile, lflags : Int32, ppwatcher : IRTCWatcher2*) : HRESULT
    @lpVtbl.value.add_watcher_ex.call(this, bstrpresentityuri, bstrusername, bstrdata, enstate, fpersistent, enscope, pprofile, lflags, ppwatcher)
  end
  def get_watcher_ex(this : IRTCClientPresence2*, enmode : RTC_WATCHER_MATCH_MODE, bstrpresentityuri : UInt8*, ppwatcher : IRTCWatcher2*) : HRESULT
    @lpVtbl.value.get_watcher_ex.call(this, enmode, bstrpresentityuri, ppwatcher)
  end
  def put_presence_property(this : IRTCClientPresence2*, enproperty : RTC_PRESENCE_PROPERTY, bstrproperty : UInt8*) : HRESULT
    @lpVtbl.value.put_presence_property.call(this, enproperty, bstrproperty)
  end
  def get_presence_property(this : IRTCClientPresence2*, enproperty : RTC_PRESENCE_PROPERTY, pbstrproperty : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_property.call(this, enproperty, pbstrproperty)
  end
  def set_presence_data(this : IRTCClientPresence2*, bstrnamespace : UInt8*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.set_presence_data.call(this, bstrnamespace, bstrdata)
  end
  def get_presence_data(this : IRTCClientPresence2*, pbstrnamespace : UInt8**, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_data.call(this, pbstrnamespace, pbstrdata)
  end
  def get_local_presence_info(this : IRTCClientPresence2*, penstatus : RTC_PRESENCE_STATUS*, pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_local_presence_info.call(this, penstatus, pbstrnotes)
  end
  def add_buddy_ex(this : IRTCClientPresence2*, bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fpersistent : Int16, ensubscriptiontype : RTC_BUDDY_SUBSCRIPTION_TYPE, pprofile : IRTCProfile, lflags : Int32, ppbuddy : IRTCBuddy2*) : HRESULT
    @lpVtbl.value.add_buddy_ex.call(this, bstrpresentityuri, bstrusername, bstrdata, fpersistent, ensubscriptiontype, pprofile, lflags, ppbuddy)
  end
end
struct LibWin32::IRTCClientProvisioning
  def query_interface(this : IRTCClientProvisioning*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClientProvisioning*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClientProvisioning*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_profile(this : IRTCClientProvisioning*, bstrprofilexml : UInt8*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.create_profile.call(this, bstrprofilexml, ppprofile)
  end
  def enable_profile(this : IRTCClientProvisioning*, pprofile : IRTCProfile, lregisterflags : Int32) : HRESULT
    @lpVtbl.value.enable_profile.call(this, pprofile, lregisterflags)
  end
  def disable_profile(this : IRTCClientProvisioning*, pprofile : IRTCProfile) : HRESULT
    @lpVtbl.value.disable_profile.call(this, pprofile)
  end
  def enumerate_profiles(this : IRTCClientProvisioning*, ppenum : IRTCEnumProfiles*) : HRESULT
    @lpVtbl.value.enumerate_profiles.call(this, ppenum)
  end
  def get_profiles(this : IRTCClientProvisioning*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_profiles.call(this, ppcollection)
  end
  def get_profile(this : IRTCClientProvisioning*, bstruseraccount : UInt8*, bstruserpassword : UInt8*, bstruseruri : UInt8*, bstrserver : UInt8*, ltransport : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.get_profile.call(this, bstruseraccount, bstruserpassword, bstruseruri, bstrserver, ltransport, lcookie)
  end
  def get_session_capabilities(this : IRTCClientProvisioning*, plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.call(this, plsupportedsessions)
  end
end
struct LibWin32::IRTCClientProvisioning2
  def query_interface(this : IRTCClientProvisioning2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClientProvisioning2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClientProvisioning2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_profile(this : IRTCClientProvisioning2*, bstrprofilexml : UInt8*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.create_profile.call(this, bstrprofilexml, ppprofile)
  end
  def enable_profile(this : IRTCClientProvisioning2*, pprofile : IRTCProfile, lregisterflags : Int32) : HRESULT
    @lpVtbl.value.enable_profile.call(this, pprofile, lregisterflags)
  end
  def disable_profile(this : IRTCClientProvisioning2*, pprofile : IRTCProfile) : HRESULT
    @lpVtbl.value.disable_profile.call(this, pprofile)
  end
  def enumerate_profiles(this : IRTCClientProvisioning2*, ppenum : IRTCEnumProfiles*) : HRESULT
    @lpVtbl.value.enumerate_profiles.call(this, ppenum)
  end
  def get_profiles(this : IRTCClientProvisioning2*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_profiles.call(this, ppcollection)
  end
  def get_profile(this : IRTCClientProvisioning2*, bstruseraccount : UInt8*, bstruserpassword : UInt8*, bstruseruri : UInt8*, bstrserver : UInt8*, ltransport : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.get_profile.call(this, bstruseraccount, bstruserpassword, bstruseruri, bstrserver, ltransport, lcookie)
  end
  def get_session_capabilities(this : IRTCClientProvisioning2*, plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.call(this, plsupportedsessions)
  end
  def enable_profile_ex(this : IRTCClientProvisioning2*, pprofile : IRTCProfile, lregisterflags : Int32, lroamingflags : Int32) : HRESULT
    @lpVtbl.value.enable_profile_ex.call(this, pprofile, lregisterflags, lroamingflags)
  end
end
struct LibWin32::IRTCProfile
  def query_interface(this : IRTCProfile*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCProfile*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCProfile*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_key(this : IRTCProfile*, pbstrkey : UInt8**) : HRESULT
    @lpVtbl.value.get_key.call(this, pbstrkey)
  end
  def get_name(this : IRTCProfile*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def get_xml(this : IRTCProfile*, pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.call(this, pbstrxml)
  end
  def get_provider_name(this : IRTCProfile*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_name.call(this, pbstrname)
  end
  def get_provider_uri(this : IRTCProfile*, enuri : RTC_PROVIDER_URI, pbstruri : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_uri.call(this, enuri, pbstruri)
  end
  def get_provider_data(this : IRTCProfile*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_data.call(this, pbstrdata)
  end
  def get_client_name(this : IRTCProfile*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_client_name.call(this, pbstrname)
  end
  def get_client_banner(this : IRTCProfile*, pfbanner : Int16*) : HRESULT
    @lpVtbl.value.get_client_banner.call(this, pfbanner)
  end
  def get_client_min_ver(this : IRTCProfile*, pbstrminver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_min_ver.call(this, pbstrminver)
  end
  def get_client_cur_ver(this : IRTCProfile*, pbstrcurver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_cur_ver.call(this, pbstrcurver)
  end
  def get_client_update_uri(this : IRTCProfile*, pbstrupdateuri : UInt8**) : HRESULT
    @lpVtbl.value.get_client_update_uri.call(this, pbstrupdateuri)
  end
  def get_client_data(this : IRTCProfile*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_client_data.call(this, pbstrdata)
  end
  def get_user_uri(this : IRTCProfile*, pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_user_uri.call(this, pbstruseruri)
  end
  def get_user_name(this : IRTCProfile*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.call(this, pbstrusername)
  end
  def get_user_account(this : IRTCProfile*, pbstruseraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.call(this, pbstruseraccount)
  end
  def set_credentials(this : IRTCProfile*, bstruseruri : UInt8*, bstruseraccount : UInt8*, bstrpassword : UInt8*) : HRESULT
    @lpVtbl.value.set_credentials.call(this, bstruseruri, bstruseraccount, bstrpassword)
  end
  def get_session_capabilities(this : IRTCProfile*, plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.call(this, plsupportedsessions)
  end
  def get_state(this : IRTCProfile*, penstate : RTC_REGISTRATION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
end
struct LibWin32::IRTCProfile2
  def query_interface(this : IRTCProfile2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCProfile2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCProfile2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_key(this : IRTCProfile2*, pbstrkey : UInt8**) : HRESULT
    @lpVtbl.value.get_key.call(this, pbstrkey)
  end
  def get_name(this : IRTCProfile2*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def get_xml(this : IRTCProfile2*, pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.call(this, pbstrxml)
  end
  def get_provider_name(this : IRTCProfile2*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_name.call(this, pbstrname)
  end
  def get_provider_uri(this : IRTCProfile2*, enuri : RTC_PROVIDER_URI, pbstruri : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_uri.call(this, enuri, pbstruri)
  end
  def get_provider_data(this : IRTCProfile2*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_data.call(this, pbstrdata)
  end
  def get_client_name(this : IRTCProfile2*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_client_name.call(this, pbstrname)
  end
  def get_client_banner(this : IRTCProfile2*, pfbanner : Int16*) : HRESULT
    @lpVtbl.value.get_client_banner.call(this, pfbanner)
  end
  def get_client_min_ver(this : IRTCProfile2*, pbstrminver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_min_ver.call(this, pbstrminver)
  end
  def get_client_cur_ver(this : IRTCProfile2*, pbstrcurver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_cur_ver.call(this, pbstrcurver)
  end
  def get_client_update_uri(this : IRTCProfile2*, pbstrupdateuri : UInt8**) : HRESULT
    @lpVtbl.value.get_client_update_uri.call(this, pbstrupdateuri)
  end
  def get_client_data(this : IRTCProfile2*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_client_data.call(this, pbstrdata)
  end
  def get_user_uri(this : IRTCProfile2*, pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_user_uri.call(this, pbstruseruri)
  end
  def get_user_name(this : IRTCProfile2*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.call(this, pbstrusername)
  end
  def get_user_account(this : IRTCProfile2*, pbstruseraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.call(this, pbstruseraccount)
  end
  def set_credentials(this : IRTCProfile2*, bstruseruri : UInt8*, bstruseraccount : UInt8*, bstrpassword : UInt8*) : HRESULT
    @lpVtbl.value.set_credentials.call(this, bstruseruri, bstruseraccount, bstrpassword)
  end
  def get_session_capabilities(this : IRTCProfile2*, plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.call(this, plsupportedsessions)
  end
  def get_state(this : IRTCProfile2*, penstate : RTC_REGISTRATION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_realm(this : IRTCProfile2*, pbstrrealm : UInt8**) : HRESULT
    @lpVtbl.value.get_realm.call(this, pbstrrealm)
  end
  def put_realm(this : IRTCProfile2*, bstrrealm : UInt8*) : HRESULT
    @lpVtbl.value.put_realm.call(this, bstrrealm)
  end
  def get_allowed_auth(this : IRTCProfile2*, plallowedauth : Int32*) : HRESULT
    @lpVtbl.value.get_allowed_auth.call(this, plallowedauth)
  end
  def put_allowed_auth(this : IRTCProfile2*, lallowedauth : Int32) : HRESULT
    @lpVtbl.value.put_allowed_auth.call(this, lallowedauth)
  end
end
struct LibWin32::IRTCSession
  def query_interface(this : IRTCSession*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSession*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSession*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_client(this : IRTCSession*, ppclient : IRTCClient*) : HRESULT
    @lpVtbl.value.get_client.call(this, ppclient)
  end
  def get_state(this : IRTCSession*, penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_type(this : IRTCSession*, pentype : RTC_SESSION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, pentype)
  end
  def get_profile(this : IRTCSession*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_participants(this : IRTCSession*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_participants.call(this, ppcollection)
  end
  def answer(this : IRTCSession*) : HRESULT
    @lpVtbl.value.answer.call(this)
  end
  def terminate(this : IRTCSession*, enreason : RTC_TERMINATE_REASON) : HRESULT
    @lpVtbl.value.terminate.call(this, enreason)
  end
  def redirect(this : IRTCSession*, entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32) : HRESULT
    @lpVtbl.value.redirect.call(this, entype, bstrlocalphoneuri, pprofile, lflags)
  end
  def add_participant(this : IRTCSession*, bstraddress : UInt8*, bstrname : UInt8*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.add_participant.call(this, bstraddress, bstrname, ppparticipant)
  end
  def remove_participant(this : IRTCSession*, pparticipant : IRTCParticipant) : HRESULT
    @lpVtbl.value.remove_participant.call(this, pparticipant)
  end
  def enumerate_participants(this : IRTCSession*, ppenum : IRTCEnumParticipants*) : HRESULT
    @lpVtbl.value.enumerate_participants.call(this, ppenum)
  end
  def get_can_add_participants(this : IRTCSession*, pfcanadd : Int16*) : HRESULT
    @lpVtbl.value.get_can_add_participants.call(this, pfcanadd)
  end
  def get_redirected_user_uri(this : IRTCSession*, pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_uri.call(this, pbstruseruri)
  end
  def get_redirected_user_name(this : IRTCSession*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_name.call(this, pbstrusername)
  end
  def next_redirected_user(this : IRTCSession*) : HRESULT
    @lpVtbl.value.next_redirected_user.call(this)
  end
  def send_message(this : IRTCSession*, bstrmessageheader : UInt8*, bstrmessage : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message.call(this, bstrmessageheader, bstrmessage, lcookie)
  end
  def send_message_status(this : IRTCSession*, enuserstatus : RTC_MESSAGING_USER_STATUS, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message_status.call(this, enuserstatus, lcookie)
  end
  def add_stream(this : IRTCSession*, lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.add_stream.call(this, lmediatype, lcookie)
  end
  def remove_stream(this : IRTCSession*, lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.remove_stream.call(this, lmediatype, lcookie)
  end
  def put_encryption_key(this : IRTCSession*, lmediatype : Int32, encryptionkey : UInt8*) : HRESULT
    @lpVtbl.value.put_encryption_key.call(this, lmediatype, encryptionkey)
  end
end
struct LibWin32::IRTCSession2
  def query_interface(this : IRTCSession2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSession2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSession2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_client(this : IRTCSession2*, ppclient : IRTCClient*) : HRESULT
    @lpVtbl.value.get_client.call(this, ppclient)
  end
  def get_state(this : IRTCSession2*, penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_type(this : IRTCSession2*, pentype : RTC_SESSION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, pentype)
  end
  def get_profile(this : IRTCSession2*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_participants(this : IRTCSession2*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_participants.call(this, ppcollection)
  end
  def answer(this : IRTCSession2*) : HRESULT
    @lpVtbl.value.answer.call(this)
  end
  def terminate(this : IRTCSession2*, enreason : RTC_TERMINATE_REASON) : HRESULT
    @lpVtbl.value.terminate.call(this, enreason)
  end
  def redirect(this : IRTCSession2*, entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32) : HRESULT
    @lpVtbl.value.redirect.call(this, entype, bstrlocalphoneuri, pprofile, lflags)
  end
  def add_participant(this : IRTCSession2*, bstraddress : UInt8*, bstrname : UInt8*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.add_participant.call(this, bstraddress, bstrname, ppparticipant)
  end
  def remove_participant(this : IRTCSession2*, pparticipant : IRTCParticipant) : HRESULT
    @lpVtbl.value.remove_participant.call(this, pparticipant)
  end
  def enumerate_participants(this : IRTCSession2*, ppenum : IRTCEnumParticipants*) : HRESULT
    @lpVtbl.value.enumerate_participants.call(this, ppenum)
  end
  def get_can_add_participants(this : IRTCSession2*, pfcanadd : Int16*) : HRESULT
    @lpVtbl.value.get_can_add_participants.call(this, pfcanadd)
  end
  def get_redirected_user_uri(this : IRTCSession2*, pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_uri.call(this, pbstruseruri)
  end
  def get_redirected_user_name(this : IRTCSession2*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_name.call(this, pbstrusername)
  end
  def next_redirected_user(this : IRTCSession2*) : HRESULT
    @lpVtbl.value.next_redirected_user.call(this)
  end
  def send_message(this : IRTCSession2*, bstrmessageheader : UInt8*, bstrmessage : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message.call(this, bstrmessageheader, bstrmessage, lcookie)
  end
  def send_message_status(this : IRTCSession2*, enuserstatus : RTC_MESSAGING_USER_STATUS, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message_status.call(this, enuserstatus, lcookie)
  end
  def add_stream(this : IRTCSession2*, lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.add_stream.call(this, lmediatype, lcookie)
  end
  def remove_stream(this : IRTCSession2*, lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.remove_stream.call(this, lmediatype, lcookie)
  end
  def put_encryption_key(this : IRTCSession2*, lmediatype : Int32, encryptionkey : UInt8*) : HRESULT
    @lpVtbl.value.put_encryption_key.call(this, lmediatype, encryptionkey)
  end
  def send_info(this : IRTCSession2*, bstrinfoheader : UInt8*, bstrinfo : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_info.call(this, bstrinfoheader, bstrinfo, lcookie)
  end
  def put_preferred_security_level(this : IRTCSession2*, ensecuritytype : RTC_SECURITY_TYPE, ensecuritylevel : RTC_SECURITY_LEVEL) : HRESULT
    @lpVtbl.value.put_preferred_security_level.call(this, ensecuritytype, ensecuritylevel)
  end
  def get_preferred_security_level(this : IRTCSession2*, ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_preferred_security_level.call(this, ensecuritytype, pensecuritylevel)
  end
  def is_security_enabled(this : IRTCSession2*, ensecuritytype : RTC_SECURITY_TYPE, pfsecurityenabled : Int16*) : HRESULT
    @lpVtbl.value.is_security_enabled.call(this, ensecuritytype, pfsecurityenabled)
  end
  def answer_with_session_description(this : IRTCSession2*, bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*) : HRESULT
    @lpVtbl.value.answer_with_session_description.call(this, bstrcontenttype, bstrsessiondescription)
  end
  def re_invite_with_session_description(this : IRTCSession2*, bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.re_invite_with_session_description.call(this, bstrcontenttype, bstrsessiondescription, lcookie)
  end
end
struct LibWin32::IRTCSessionCallControl
  def query_interface(this : IRTCSessionCallControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionCallControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionCallControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def hold(this : IRTCSessionCallControl*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.hold.call(this, lcookie)
  end
  def un_hold(this : IRTCSessionCallControl*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.un_hold.call(this, lcookie)
  end
  def forward(this : IRTCSessionCallControl*, bstrforwardtouri : UInt8*) : HRESULT
    @lpVtbl.value.forward.call(this, bstrforwardtouri)
  end
  def refer(this : IRTCSessionCallControl*, bstrrefertouri : UInt8*, bstrrefercookie : UInt8*) : HRESULT
    @lpVtbl.value.refer.call(this, bstrrefertouri, bstrrefercookie)
  end
  def put_referred_by_uri(this : IRTCSessionCallControl*, bstrreferredbyuri : UInt8*) : HRESULT
    @lpVtbl.value.put_referred_by_uri.call(this, bstrreferredbyuri)
  end
  def get_referred_by_uri(this : IRTCSessionCallControl*, pbstrreferredbyuri : UInt8**) : HRESULT
    @lpVtbl.value.get_referred_by_uri.call(this, pbstrreferredbyuri)
  end
  def put_refer_cookie(this : IRTCSessionCallControl*, bstrrefercookie : UInt8*) : HRESULT
    @lpVtbl.value.put_refer_cookie.call(this, bstrrefercookie)
  end
  def get_refer_cookie(this : IRTCSessionCallControl*, pbstrrefercookie : UInt8**) : HRESULT
    @lpVtbl.value.get_refer_cookie.call(this, pbstrrefercookie)
  end
  def get_is_referred(this : IRTCSessionCallControl*, pfisreferred : Int16*) : HRESULT
    @lpVtbl.value.get_is_referred.call(this, pfisreferred)
  end
end
struct LibWin32::IRTCParticipant
  def query_interface(this : IRTCParticipant*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCParticipant*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCParticipant*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_user_uri(this : IRTCParticipant*, pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_user_uri.call(this, pbstruseruri)
  end
  def get_name(this : IRTCParticipant*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def get_removable(this : IRTCParticipant*, pfremovable : Int16*) : HRESULT
    @lpVtbl.value.get_removable.call(this, pfremovable)
  end
  def get_state(this : IRTCParticipant*, penstate : RTC_PARTICIPANT_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_session(this : IRTCParticipant*, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
end
struct LibWin32::IRTCRoamingEvent
  def query_interface(this : IRTCRoamingEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCRoamingEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCRoamingEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCRoamingEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCRoamingEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCRoamingEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCRoamingEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_type(this : IRTCRoamingEvent*, peventtype : RTC_ROAMING_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peventtype)
  end
  def get_profile(this : IRTCRoamingEvent*, ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_status_code(this : IRTCRoamingEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCRoamingEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
end
struct LibWin32::IRTCProfileEvent
  def query_interface(this : IRTCProfileEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCProfileEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCProfileEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCProfileEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCProfileEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCProfileEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCProfileEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_profile(this : IRTCProfileEvent*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_cookie(this : IRTCProfileEvent*, plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.call(this, plcookie)
  end
  def get_status_code(this : IRTCProfileEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
end
struct LibWin32::IRTCProfileEvent2
  def query_interface(this : IRTCProfileEvent2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCProfileEvent2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCProfileEvent2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCProfileEvent2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCProfileEvent2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCProfileEvent2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCProfileEvent2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_profile(this : IRTCProfileEvent2*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_cookie(this : IRTCProfileEvent2*, plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.call(this, plcookie)
  end
  def get_status_code(this : IRTCProfileEvent2*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_event_type(this : IRTCProfileEvent2*, peventtype : RTC_PROFILE_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peventtype)
  end
end
struct LibWin32::IRTCClientEvent
  def query_interface(this : IRTCClientEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClientEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClientEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCClientEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCClientEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCClientEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCClientEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_type(this : IRTCClientEvent*, peneventtype : RTC_CLIENT_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peneventtype)
  end
  def get_client(this : IRTCClientEvent*, ppclient : IRTCClient*) : HRESULT
    @lpVtbl.value.get_client.call(this, ppclient)
  end
end
struct LibWin32::IRTCRegistrationStateChangeEvent
  def query_interface(this : IRTCRegistrationStateChangeEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCRegistrationStateChangeEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCRegistrationStateChangeEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCRegistrationStateChangeEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCRegistrationStateChangeEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCRegistrationStateChangeEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCRegistrationStateChangeEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_profile(this : IRTCRegistrationStateChangeEvent*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_state(this : IRTCRegistrationStateChangeEvent*, penstate : RTC_REGISTRATION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_status_code(this : IRTCRegistrationStateChangeEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCRegistrationStateChangeEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionStateChangeEvent
  def query_interface(this : IRTCSessionStateChangeEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionStateChangeEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionStateChangeEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCSessionStateChangeEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCSessionStateChangeEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCSessionStateChangeEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCSessionStateChangeEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCSessionStateChangeEvent*, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_state(this : IRTCSessionStateChangeEvent*, penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_status_code(this : IRTCSessionStateChangeEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCSessionStateChangeEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionStateChangeEvent2
  def query_interface(this : IRTCSessionStateChangeEvent2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionStateChangeEvent2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionStateChangeEvent2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCSessionStateChangeEvent2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCSessionStateChangeEvent2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCSessionStateChangeEvent2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCSessionStateChangeEvent2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCSessionStateChangeEvent2*, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_state(this : IRTCSessionStateChangeEvent2*, penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_status_code(this : IRTCSessionStateChangeEvent2*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCSessionStateChangeEvent2*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
  def get_media_types(this : IRTCSessionStateChangeEvent2*, pmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_media_types.call(this, pmediatypes)
  end
  def get_remote_preferred_security_level(this : IRTCSessionStateChangeEvent2*, ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_remote_preferred_security_level.call(this, ensecuritytype, pensecuritylevel)
  end
  def get_is_forked(this : IRTCSessionStateChangeEvent2*, pfisforked : Int16*) : HRESULT
    @lpVtbl.value.get_is_forked.call(this, pfisforked)
  end
  def get_remote_session_description(this : IRTCSessionStateChangeEvent2*, pbstrcontenttype : UInt8**, pbstrsessiondescription : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_session_description.call(this, pbstrcontenttype, pbstrsessiondescription)
  end
end
struct LibWin32::IRTCSessionOperationCompleteEvent
  def query_interface(this : IRTCSessionOperationCompleteEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionOperationCompleteEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionOperationCompleteEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCSessionOperationCompleteEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCSessionOperationCompleteEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCSessionOperationCompleteEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCSessionOperationCompleteEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCSessionOperationCompleteEvent*, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_cookie(this : IRTCSessionOperationCompleteEvent*, plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.call(this, plcookie)
  end
  def get_status_code(this : IRTCSessionOperationCompleteEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCSessionOperationCompleteEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionOperationCompleteEvent2
  def query_interface(this : IRTCSessionOperationCompleteEvent2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionOperationCompleteEvent2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionOperationCompleteEvent2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCSessionOperationCompleteEvent2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCSessionOperationCompleteEvent2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCSessionOperationCompleteEvent2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCSessionOperationCompleteEvent2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCSessionOperationCompleteEvent2*, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_cookie(this : IRTCSessionOperationCompleteEvent2*, plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.call(this, plcookie)
  end
  def get_status_code(this : IRTCSessionOperationCompleteEvent2*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCSessionOperationCompleteEvent2*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
  def get_participant(this : IRTCSessionOperationCompleteEvent2*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.call(this, ppparticipant)
  end
  def get_remote_session_description(this : IRTCSessionOperationCompleteEvent2*, pbstrcontenttype : UInt8**, pbstrsessiondescription : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_session_description.call(this, pbstrcontenttype, pbstrsessiondescription)
  end
end
struct LibWin32::IRTCParticipantStateChangeEvent
  def query_interface(this : IRTCParticipantStateChangeEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCParticipantStateChangeEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCParticipantStateChangeEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCParticipantStateChangeEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCParticipantStateChangeEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCParticipantStateChangeEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCParticipantStateChangeEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_participant(this : IRTCParticipantStateChangeEvent*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.call(this, ppparticipant)
  end
  def get_state(this : IRTCParticipantStateChangeEvent*, penstate : RTC_PARTICIPANT_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def get_status_code(this : IRTCParticipantStateChangeEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
end
struct LibWin32::IRTCMediaEvent
  def query_interface(this : IRTCMediaEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCMediaEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCMediaEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCMediaEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCMediaEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCMediaEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCMediaEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_media_type(this : IRTCMediaEvent*, pmediatype : Int32*) : HRESULT
    @lpVtbl.value.get_media_type.call(this, pmediatype)
  end
  def get_event_type(this : IRTCMediaEvent*, peneventtype : RTC_MEDIA_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peneventtype)
  end
  def get_event_reason(this : IRTCMediaEvent*, peneventreason : RTC_MEDIA_EVENT_REASON*) : HRESULT
    @lpVtbl.value.get_event_reason.call(this, peneventreason)
  end
end
struct LibWin32::IRTCIntensityEvent
  def query_interface(this : IRTCIntensityEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCIntensityEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCIntensityEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCIntensityEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCIntensityEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCIntensityEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCIntensityEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_level(this : IRTCIntensityEvent*, pllevel : Int32*) : HRESULT
    @lpVtbl.value.get_level.call(this, pllevel)
  end
  def get_min(this : IRTCIntensityEvent*, plmin : Int32*) : HRESULT
    @lpVtbl.value.get_min.call(this, plmin)
  end
  def get_max(this : IRTCIntensityEvent*, plmax : Int32*) : HRESULT
    @lpVtbl.value.get_max.call(this, plmax)
  end
  def get_direction(this : IRTCIntensityEvent*, pendirection : RTC_AUDIO_DEVICE*) : HRESULT
    @lpVtbl.value.get_direction.call(this, pendirection)
  end
end
struct LibWin32::IRTCMessagingEvent
  def query_interface(this : IRTCMessagingEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCMessagingEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCMessagingEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCMessagingEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCMessagingEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCMessagingEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCMessagingEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCMessagingEvent*, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_participant(this : IRTCMessagingEvent*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.call(this, ppparticipant)
  end
  def get_event_type(this : IRTCMessagingEvent*, peneventtype : RTC_MESSAGING_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peneventtype)
  end
  def get_message(this : IRTCMessagingEvent*, pbstrmessage : UInt8**) : HRESULT
    @lpVtbl.value.get_message.call(this, pbstrmessage)
  end
  def get_message_header(this : IRTCMessagingEvent*, pbstrmessageheader : UInt8**) : HRESULT
    @lpVtbl.value.get_message_header.call(this, pbstrmessageheader)
  end
  def get_user_status(this : IRTCMessagingEvent*, penuserstatus : RTC_MESSAGING_USER_STATUS*) : HRESULT
    @lpVtbl.value.get_user_status.call(this, penuserstatus)
  end
end
struct LibWin32::IRTCBuddyEvent
  def query_interface(this : IRTCBuddyEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCBuddyEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCBuddyEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCBuddyEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCBuddyEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCBuddyEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCBuddyEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_buddy(this : IRTCBuddyEvent*, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.call(this, ppbuddy)
  end
end
struct LibWin32::IRTCBuddyEvent2
  def query_interface(this : IRTCBuddyEvent2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCBuddyEvent2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCBuddyEvent2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCBuddyEvent2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCBuddyEvent2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCBuddyEvent2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCBuddyEvent2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_buddy(this : IRTCBuddyEvent2*, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.call(this, ppbuddy)
  end
  def get_event_type(this : IRTCBuddyEvent2*, peventtype : RTC_BUDDY_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peventtype)
  end
  def get_status_code(this : IRTCBuddyEvent2*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCBuddyEvent2*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
end
struct LibWin32::IRTCWatcherEvent
  def query_interface(this : IRTCWatcherEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCWatcherEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCWatcherEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCWatcherEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCWatcherEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCWatcherEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCWatcherEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_watcher(this : IRTCWatcherEvent*, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.call(this, ppwatcher)
  end
end
struct LibWin32::IRTCWatcherEvent2
  def query_interface(this : IRTCWatcherEvent2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCWatcherEvent2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCWatcherEvent2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCWatcherEvent2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCWatcherEvent2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCWatcherEvent2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCWatcherEvent2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_watcher(this : IRTCWatcherEvent2*, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.call(this, ppwatcher)
  end
  def get_event_type(this : IRTCWatcherEvent2*, peventtype : RTC_WATCHER_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peventtype)
  end
  def get_status_code(this : IRTCWatcherEvent2*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
end
struct LibWin32::IRTCBuddyGroupEvent
  def query_interface(this : IRTCBuddyGroupEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCBuddyGroupEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCBuddyGroupEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCBuddyGroupEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCBuddyGroupEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCBuddyGroupEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCBuddyGroupEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_type(this : IRTCBuddyGroupEvent*, peventtype : RTC_GROUP_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, peventtype)
  end
  def get_group(this : IRTCBuddyGroupEvent*, ppgroup : IRTCBuddyGroup*) : HRESULT
    @lpVtbl.value.get_group.call(this, ppgroup)
  end
  def get_buddy(this : IRTCBuddyGroupEvent*, ppbuddy : IRTCBuddy2*) : HRESULT
    @lpVtbl.value.get_buddy.call(this, ppbuddy)
  end
  def get_status_code(this : IRTCBuddyGroupEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
end
struct LibWin32::IRTCInfoEvent
  def query_interface(this : IRTCInfoEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCInfoEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCInfoEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCInfoEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCInfoEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCInfoEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCInfoEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCInfoEvent*, ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_participant(this : IRTCInfoEvent*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.call(this, ppparticipant)
  end
  def get_info(this : IRTCInfoEvent*, pbstrinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_info.call(this, pbstrinfo)
  end
  def get_info_header(this : IRTCInfoEvent*, pbstrinfoheader : UInt8**) : HRESULT
    @lpVtbl.value.get_info_header.call(this, pbstrinfoheader)
  end
end
struct LibWin32::IRTCMediaRequestEvent
  def query_interface(this : IRTCMediaRequestEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCMediaRequestEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCMediaRequestEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCMediaRequestEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCMediaRequestEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCMediaRequestEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCMediaRequestEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCMediaRequestEvent*, ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_proposed_media(this : IRTCMediaRequestEvent*, plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_proposed_media.call(this, plmediatypes)
  end
  def get_current_media(this : IRTCMediaRequestEvent*, plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_current_media.call(this, plmediatypes)
  end
  def accept(this : IRTCMediaRequestEvent*, lmediatypes : Int32) : HRESULT
    @lpVtbl.value.accept.call(this, lmediatypes)
  end
  def get_remote_preferred_security_level(this : IRTCMediaRequestEvent*, ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_remote_preferred_security_level.call(this, ensecuritytype, pensecuritylevel)
  end
  def reject(this : IRTCMediaRequestEvent*) : HRESULT
    @lpVtbl.value.reject.call(this)
  end
  def get_state(this : IRTCMediaRequestEvent*, pstate : RTC_REINVITE_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, pstate)
  end
end
struct LibWin32::IRTCReInviteEvent
  def query_interface(this : IRTCReInviteEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCReInviteEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCReInviteEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCReInviteEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCReInviteEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCReInviteEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCReInviteEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCReInviteEvent*, ppsession2 : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession2)
  end
  def accept(this : IRTCReInviteEvent*, bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*) : HRESULT
    @lpVtbl.value.accept.call(this, bstrcontenttype, bstrsessiondescription)
  end
  def reject(this : IRTCReInviteEvent*) : HRESULT
    @lpVtbl.value.reject.call(this)
  end
  def get_state(this : IRTCReInviteEvent*, pstate : RTC_REINVITE_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, pstate)
  end
  def get_remote_session_description(this : IRTCReInviteEvent*, pbstrcontenttype : UInt8**, pbstrsessiondescription : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_session_description.call(this, pbstrcontenttype, pbstrsessiondescription)
  end
end
struct LibWin32::IRTCPresencePropertyEvent
  def query_interface(this : IRTCPresencePropertyEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCPresencePropertyEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCPresencePropertyEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCPresencePropertyEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCPresencePropertyEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCPresencePropertyEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCPresencePropertyEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status_code(this : IRTCPresencePropertyEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCPresencePropertyEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
  def get_presence_property(this : IRTCPresencePropertyEvent*, penpresprop : RTC_PRESENCE_PROPERTY*) : HRESULT
    @lpVtbl.value.get_presence_property.call(this, penpresprop)
  end
  def get_value(this : IRTCPresencePropertyEvent*, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, pbstrvalue)
  end
end
struct LibWin32::IRTCPresenceDataEvent
  def query_interface(this : IRTCPresenceDataEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCPresenceDataEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCPresenceDataEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCPresenceDataEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCPresenceDataEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCPresenceDataEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCPresenceDataEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status_code(this : IRTCPresenceDataEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCPresenceDataEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
  def get_presence_data(this : IRTCPresenceDataEvent*, pbstrnamespace : UInt8**, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_data.call(this, pbstrnamespace, pbstrdata)
  end
end
struct LibWin32::IRTCPresenceStatusEvent
  def query_interface(this : IRTCPresenceStatusEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCPresenceStatusEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCPresenceStatusEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCPresenceStatusEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCPresenceStatusEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCPresenceStatusEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCPresenceStatusEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status_code(this : IRTCPresenceStatusEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCPresenceStatusEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
  def get_local_presence_info(this : IRTCPresenceStatusEvent*, penstatus : RTC_PRESENCE_STATUS*, pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_local_presence_info.call(this, penstatus, pbstrnotes)
  end
end
struct LibWin32::IRTCCollection
  def query_interface(this : IRTCCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IRTCCollection*, lcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, lcount)
  end
  def get_item(this : IRTCCollection*, index : Int32, pvariant : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, pvariant)
  end
  def get__new_enum(this : IRTCCollection*, ppnewenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppnewenum)
  end
end
struct LibWin32::IRTCEnumParticipants
  def query_interface(this : IRTCEnumParticipants*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEnumParticipants*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEnumParticipants*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IRTCEnumParticipants*, celt : UInt32, ppelements : IRTCParticipant*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppelements, pceltfetched)
  end
  def reset(this : IRTCEnumParticipants*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IRTCEnumParticipants*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def clone(this : IRTCEnumParticipants*, ppenum : IRTCEnumParticipants*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRTCEnumProfiles
  def query_interface(this : IRTCEnumProfiles*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEnumProfiles*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEnumProfiles*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IRTCEnumProfiles*, celt : UInt32, ppelements : IRTCProfile*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppelements, pceltfetched)
  end
  def reset(this : IRTCEnumProfiles*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IRTCEnumProfiles*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def clone(this : IRTCEnumProfiles*, ppenum : IRTCEnumProfiles*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRTCEnumBuddies
  def query_interface(this : IRTCEnumBuddies*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEnumBuddies*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEnumBuddies*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IRTCEnumBuddies*, celt : UInt32, ppelements : IRTCBuddy*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppelements, pceltfetched)
  end
  def reset(this : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IRTCEnumBuddies*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def clone(this : IRTCEnumBuddies*, ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRTCEnumWatchers
  def query_interface(this : IRTCEnumWatchers*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEnumWatchers*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEnumWatchers*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IRTCEnumWatchers*, celt : UInt32, ppelements : IRTCWatcher*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppelements, pceltfetched)
  end
  def reset(this : IRTCEnumWatchers*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IRTCEnumWatchers*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def clone(this : IRTCEnumWatchers*, ppenum : IRTCEnumWatchers*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRTCEnumGroups
  def query_interface(this : IRTCEnumGroups*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEnumGroups*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEnumGroups*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IRTCEnumGroups*, celt : UInt32, ppelements : IRTCBuddyGroup*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppelements, pceltfetched)
  end
  def reset(this : IRTCEnumGroups*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IRTCEnumGroups*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def clone(this : IRTCEnumGroups*, ppenum : IRTCEnumGroups*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRTCPresenceContact
  def query_interface(this : IRTCPresenceContact*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCPresenceContact*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCPresenceContact*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_presentity_uri(this : IRTCPresenceContact*, pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.call(this, pbstrpresentityuri)
  end
  def put_presentity_uri(this : IRTCPresenceContact*, bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.call(this, bstrpresentityuri)
  end
  def get_name(this : IRTCPresenceContact*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def put_name(this : IRTCPresenceContact*, bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrname)
  end
  def get_data(this : IRTCPresenceContact*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pbstrdata)
  end
  def put_data(this : IRTCPresenceContact*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, bstrdata)
  end
  def get_persistent(this : IRTCPresenceContact*, pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.call(this, pfpersistent)
  end
  def put_persistent(this : IRTCPresenceContact*, fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.call(this, fpersistent)
  end
end
struct LibWin32::IRTCBuddy
  def query_interface(this : IRTCBuddy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCBuddy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCBuddy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_presentity_uri(this : IRTCBuddy*, pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.call(this, pbstrpresentityuri)
  end
  def put_presentity_uri(this : IRTCBuddy*, bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.call(this, bstrpresentityuri)
  end
  def get_name(this : IRTCBuddy*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def put_name(this : IRTCBuddy*, bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrname)
  end
  def get_data(this : IRTCBuddy*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pbstrdata)
  end
  def put_data(this : IRTCBuddy*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, bstrdata)
  end
  def get_persistent(this : IRTCBuddy*, pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.call(this, pfpersistent)
  end
  def put_persistent(this : IRTCBuddy*, fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.call(this, fpersistent)
  end
  def get_status(this : IRTCBuddy*, penstatus : RTC_PRESENCE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, penstatus)
  end
  def get_notes(this : IRTCBuddy*, pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_notes.call(this, pbstrnotes)
  end
end
struct LibWin32::IRTCBuddy2
  def query_interface(this : IRTCBuddy2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCBuddy2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCBuddy2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_presentity_uri(this : IRTCBuddy2*, pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.call(this, pbstrpresentityuri)
  end
  def put_presentity_uri(this : IRTCBuddy2*, bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.call(this, bstrpresentityuri)
  end
  def get_name(this : IRTCBuddy2*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def put_name(this : IRTCBuddy2*, bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrname)
  end
  def get_data(this : IRTCBuddy2*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pbstrdata)
  end
  def put_data(this : IRTCBuddy2*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, bstrdata)
  end
  def get_persistent(this : IRTCBuddy2*, pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.call(this, pfpersistent)
  end
  def put_persistent(this : IRTCBuddy2*, fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.call(this, fpersistent)
  end
  def get_status(this : IRTCBuddy2*, penstatus : RTC_PRESENCE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, penstatus)
  end
  def get_notes(this : IRTCBuddy2*, pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_notes.call(this, pbstrnotes)
  end
  def get_profile(this : IRTCBuddy2*, ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def refresh(this : IRTCBuddy2*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def enumerate_groups(this : IRTCBuddy2*, ppenum : IRTCEnumGroups*) : HRESULT
    @lpVtbl.value.enumerate_groups.call(this, ppenum)
  end
  def get_groups(this : IRTCBuddy2*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_groups.call(this, ppcollection)
  end
  def get_presence_property(this : IRTCBuddy2*, enproperty : RTC_PRESENCE_PROPERTY, pbstrproperty : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_property.call(this, enproperty, pbstrproperty)
  end
  def enumerate_presence_devices(this : IRTCBuddy2*, ppenumdevices : IRTCEnumPresenceDevices*) : HRESULT
    @lpVtbl.value.enumerate_presence_devices.call(this, ppenumdevices)
  end
  def get_presence_devices(this : IRTCBuddy2*, ppdevicescollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_presence_devices.call(this, ppdevicescollection)
  end
  def get_subscription_type(this : IRTCBuddy2*, pensubscriptiontype : RTC_BUDDY_SUBSCRIPTION_TYPE*) : HRESULT
    @lpVtbl.value.get_subscription_type.call(this, pensubscriptiontype)
  end
end
struct LibWin32::IRTCWatcher
  def query_interface(this : IRTCWatcher*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCWatcher*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCWatcher*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_presentity_uri(this : IRTCWatcher*, pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.call(this, pbstrpresentityuri)
  end
  def put_presentity_uri(this : IRTCWatcher*, bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.call(this, bstrpresentityuri)
  end
  def get_name(this : IRTCWatcher*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def put_name(this : IRTCWatcher*, bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrname)
  end
  def get_data(this : IRTCWatcher*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pbstrdata)
  end
  def put_data(this : IRTCWatcher*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, bstrdata)
  end
  def get_persistent(this : IRTCWatcher*, pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.call(this, pfpersistent)
  end
  def put_persistent(this : IRTCWatcher*, fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.call(this, fpersistent)
  end
  def get_state(this : IRTCWatcher*, penstate : RTC_WATCHER_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def put_state(this : IRTCWatcher*, enstate : RTC_WATCHER_STATE) : HRESULT
    @lpVtbl.value.put_state.call(this, enstate)
  end
end
struct LibWin32::IRTCWatcher2
  def query_interface(this : IRTCWatcher2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCWatcher2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCWatcher2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_presentity_uri(this : IRTCWatcher2*, pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.call(this, pbstrpresentityuri)
  end
  def put_presentity_uri(this : IRTCWatcher2*, bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.call(this, bstrpresentityuri)
  end
  def get_name(this : IRTCWatcher2*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def put_name(this : IRTCWatcher2*, bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrname)
  end
  def get_data(this : IRTCWatcher2*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pbstrdata)
  end
  def put_data(this : IRTCWatcher2*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, bstrdata)
  end
  def get_persistent(this : IRTCWatcher2*, pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.call(this, pfpersistent)
  end
  def put_persistent(this : IRTCWatcher2*, fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.call(this, fpersistent)
  end
  def get_state(this : IRTCWatcher2*, penstate : RTC_WATCHER_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, penstate)
  end
  def put_state(this : IRTCWatcher2*, enstate : RTC_WATCHER_STATE) : HRESULT
    @lpVtbl.value.put_state.call(this, enstate)
  end
  def get_profile(this : IRTCWatcher2*, ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_scope(this : IRTCWatcher2*, penscope : RTC_ACE_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.call(this, penscope)
  end
end
struct LibWin32::IRTCBuddyGroup
  def query_interface(this : IRTCBuddyGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCBuddyGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCBuddyGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IRTCBuddyGroup*, pbstrgroupname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrgroupname)
  end
  def put_name(this : IRTCBuddyGroup*, bstrgroupname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, bstrgroupname)
  end
  def add_buddy(this : IRTCBuddyGroup*, pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.add_buddy.call(this, pbuddy)
  end
  def remove_buddy(this : IRTCBuddyGroup*, pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.remove_buddy.call(this, pbuddy)
  end
  def enumerate_buddies(this : IRTCBuddyGroup*, ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.enumerate_buddies.call(this, ppenum)
  end
  def get_buddies(this : IRTCBuddyGroup*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_buddies.call(this, ppcollection)
  end
  def get_data(this : IRTCBuddyGroup*, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pbstrdata)
  end
  def put_data(this : IRTCBuddyGroup*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, bstrdata)
  end
  def get_profile(this : IRTCBuddyGroup*, ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
end
struct LibWin32::IRTCEventNotification
  def query_interface(this : IRTCEventNotification*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEventNotification*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEventNotification*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def event(this : IRTCEventNotification*, rtcevent : RTC_EVENT, pevent : IDispatch) : HRESULT
    @lpVtbl.value.event.call(this, rtcevent, pevent)
  end
end
struct LibWin32::IRTCPortManager
  def query_interface(this : IRTCPortManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCPortManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCPortManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_mapping(this : IRTCPortManager*, bstrremoteaddress : UInt8*, enporttype : RTC_PORT_TYPE, pbstrinternallocaladdress : UInt8**, plinternallocalport : Int32*, pbstrexternallocaladdress : UInt8**, plexternallocalport : Int32*) : HRESULT
    @lpVtbl.value.get_mapping.call(this, bstrremoteaddress, enporttype, pbstrinternallocaladdress, plinternallocalport, pbstrexternallocaladdress, plexternallocalport)
  end
  def update_remote_address(this : IRTCPortManager*, bstrremoteaddress : UInt8*, bstrinternallocaladdress : UInt8*, linternallocalport : Int32, bstrexternallocaladdress : UInt8*, lexternallocalport : Int32) : HRESULT
    @lpVtbl.value.update_remote_address.call(this, bstrremoteaddress, bstrinternallocaladdress, linternallocalport, bstrexternallocaladdress, lexternallocalport)
  end
  def release_mapping(this : IRTCPortManager*, bstrinternallocaladdress : UInt8*, linternallocalport : Int32, bstrexternallocaladdress : UInt8*, lexternallocaladdress : Int32) : HRESULT
    @lpVtbl.value.release_mapping.call(this, bstrinternallocaladdress, linternallocalport, bstrexternallocaladdress, lexternallocaladdress)
  end
end
struct LibWin32::IRTCSessionPortManagement
  def query_interface(this : IRTCSessionPortManagement*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionPortManagement*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionPortManagement*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_port_manager(this : IRTCSessionPortManagement*, pportmanager : IRTCPortManager) : HRESULT
    @lpVtbl.value.set_port_manager.call(this, pportmanager)
  end
end
struct LibWin32::IRTCClientPortManagement
  def query_interface(this : IRTCClientPortManagement*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCClientPortManagement*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCClientPortManagement*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start_listen_address_and_port(this : IRTCClientPortManagement*, bstrinternallocaladdress : UInt8*, linternallocalport : Int32) : HRESULT
    @lpVtbl.value.start_listen_address_and_port.call(this, bstrinternallocaladdress, linternallocalport)
  end
  def stop_listen_address_and_port(this : IRTCClientPortManagement*, bstrinternallocaladdress : UInt8*, linternallocalport : Int32) : HRESULT
    @lpVtbl.value.stop_listen_address_and_port.call(this, bstrinternallocaladdress, linternallocalport)
  end
  def get_port_range(this : IRTCClientPortManagement*, enporttype : RTC_PORT_TYPE, plminvalue : Int32*, plmaxvalue : Int32*) : HRESULT
    @lpVtbl.value.get_port_range.call(this, enporttype, plminvalue, plmaxvalue)
  end
end
struct LibWin32::IRTCUserSearch
  def query_interface(this : IRTCUserSearch*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCUserSearch*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCUserSearch*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_query(this : IRTCUserSearch*, ppquery : IRTCUserSearchQuery*) : HRESULT
    @lpVtbl.value.create_query.call(this, ppquery)
  end
  def execute_search(this : IRTCUserSearch*, pquery : IRTCUserSearchQuery, pprofile : IRTCProfile, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.execute_search.call(this, pquery, pprofile, lcookie)
  end
end
struct LibWin32::IRTCUserSearchQuery
  def query_interface(this : IRTCUserSearchQuery*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCUserSearchQuery*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCUserSearchQuery*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def put_search_term(this : IRTCUserSearchQuery*, bstrname : UInt8*, bstrvalue : UInt8*) : HRESULT
    @lpVtbl.value.put_search_term.call(this, bstrname, bstrvalue)
  end
  def get_search_term(this : IRTCUserSearchQuery*, bstrname : UInt8*, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_search_term.call(this, bstrname, pbstrvalue)
  end
  def get_search_terms(this : IRTCUserSearchQuery*, pbstrnames : UInt8**) : HRESULT
    @lpVtbl.value.get_search_terms.call(this, pbstrnames)
  end
  def put_search_preference(this : IRTCUserSearchQuery*, enpreference : RTC_USER_SEARCH_PREFERENCE, lvalue : Int32) : HRESULT
    @lpVtbl.value.put_search_preference.call(this, enpreference, lvalue)
  end
  def get_search_preference(this : IRTCUserSearchQuery*, enpreference : RTC_USER_SEARCH_PREFERENCE, plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_search_preference.call(this, enpreference, plvalue)
  end
  def put_search_domain(this : IRTCUserSearchQuery*, bstrdomain : UInt8*) : HRESULT
    @lpVtbl.value.put_search_domain.call(this, bstrdomain)
  end
  def get_search_domain(this : IRTCUserSearchQuery*, pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_search_domain.call(this, pbstrdomain)
  end
end
struct LibWin32::IRTCUserSearchResult
  def query_interface(this : IRTCUserSearchResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCUserSearchResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCUserSearchResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_value(this : IRTCUserSearchResult*, encolumn : RTC_USER_SEARCH_COLUMN, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, encolumn, pbstrvalue)
  end
end
struct LibWin32::IRTCEnumUserSearchResults
  def query_interface(this : IRTCEnumUserSearchResults*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEnumUserSearchResults*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEnumUserSearchResults*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IRTCEnumUserSearchResults*, celt : UInt32, ppelements : IRTCUserSearchResult*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppelements, pceltfetched)
  end
  def reset(this : IRTCEnumUserSearchResults*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IRTCEnumUserSearchResults*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def clone(this : IRTCEnumUserSearchResults*, ppenum : IRTCEnumUserSearchResults*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRTCUserSearchResultsEvent
  def query_interface(this : IRTCUserSearchResultsEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCUserSearchResultsEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCUserSearchResultsEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCUserSearchResultsEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCUserSearchResultsEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCUserSearchResultsEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCUserSearchResultsEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def enumerate_results(this : IRTCUserSearchResultsEvent*, ppenum : IRTCEnumUserSearchResults*) : HRESULT
    @lpVtbl.value.enumerate_results.call(this, ppenum)
  end
  def get_results(this : IRTCUserSearchResultsEvent*, ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_results.call(this, ppcollection)
  end
  def get_profile(this : IRTCUserSearchResultsEvent*, ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.call(this, ppprofile)
  end
  def get_query(this : IRTCUserSearchResultsEvent*, ppquery : IRTCUserSearchQuery*) : HRESULT
    @lpVtbl.value.get_query.call(this, ppquery)
  end
  def get_cookie(this : IRTCUserSearchResultsEvent*, plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.call(this, plcookie)
  end
  def get_status_code(this : IRTCUserSearchResultsEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_more_available(this : IRTCUserSearchResultsEvent*, pfmoreavailable : Int16*) : HRESULT
    @lpVtbl.value.get_more_available.call(this, pfmoreavailable)
  end
end
struct LibWin32::IRTCSessionReferStatusEvent
  def query_interface(this : IRTCSessionReferStatusEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionReferStatusEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionReferStatusEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCSessionReferStatusEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCSessionReferStatusEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCSessionReferStatusEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCSessionReferStatusEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCSessionReferStatusEvent*, ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_refer_status(this : IRTCSessionReferStatusEvent*, penreferstatus : RTC_SESSION_REFER_STATUS*) : HRESULT
    @lpVtbl.value.get_refer_status.call(this, penreferstatus)
  end
  def get_status_code(this : IRTCSessionReferStatusEvent*, plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.call(this, plstatuscode)
  end
  def get_status_text(this : IRTCSessionReferStatusEvent*, pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.call(this, pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionReferredEvent
  def query_interface(this : IRTCSessionReferredEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionReferredEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionReferredEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCSessionReferredEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCSessionReferredEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCSessionReferredEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCSessionReferredEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(this : IRTCSessionReferredEvent*, ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.call(this, ppsession)
  end
  def get_referred_by_uri(this : IRTCSessionReferredEvent*, pbstrreferredbyuri : UInt8**) : HRESULT
    @lpVtbl.value.get_referred_by_uri.call(this, pbstrreferredbyuri)
  end
  def get_refer_to_uri(this : IRTCSessionReferredEvent*, pbstrreferouri : UInt8**) : HRESULT
    @lpVtbl.value.get_refer_to_uri.call(this, pbstrreferouri)
  end
  def get_refer_cookie(this : IRTCSessionReferredEvent*, pbstrrefercookie : UInt8**) : HRESULT
    @lpVtbl.value.get_refer_cookie.call(this, pbstrrefercookie)
  end
  def accept(this : IRTCSessionReferredEvent*) : HRESULT
    @lpVtbl.value.accept.call(this)
  end
  def reject(this : IRTCSessionReferredEvent*) : HRESULT
    @lpVtbl.value.reject.call(this)
  end
  def set_referred_session_state(this : IRTCSessionReferredEvent*, enstate : RTC_SESSION_STATE) : HRESULT
    @lpVtbl.value.set_referred_session_state.call(this, enstate)
  end
end
struct LibWin32::IRTCSessionDescriptionManager
  def query_interface(this : IRTCSessionDescriptionManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCSessionDescriptionManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCSessionDescriptionManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def evaluate_session_description(this : IRTCSessionDescriptionManager*, bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*, pfapplicationsession : Int16*) : HRESULT
    @lpVtbl.value.evaluate_session_description.call(this, bstrcontenttype, bstrsessiondescription, pfapplicationsession)
  end
end
struct LibWin32::IRTCEnumPresenceDevices
  def query_interface(this : IRTCEnumPresenceDevices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCEnumPresenceDevices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCEnumPresenceDevices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IRTCEnumPresenceDevices*, celt : UInt32, ppelements : IRTCPresenceDevice*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppelements, pceltfetched)
  end
  def reset(this : IRTCEnumPresenceDevices*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IRTCEnumPresenceDevices*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def clone(this : IRTCEnumPresenceDevices*, ppenum : IRTCEnumPresenceDevices*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRTCPresenceDevice
  def query_interface(this : IRTCPresenceDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCPresenceDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCPresenceDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_status(this : IRTCPresenceDevice*, penstatus : RTC_PRESENCE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, penstatus)
  end
  def get_notes(this : IRTCPresenceDevice*, pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_notes.call(this, pbstrnotes)
  end
  def get_presence_property(this : IRTCPresenceDevice*, enproperty : RTC_PRESENCE_PROPERTY, pbstrproperty : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_property.call(this, enproperty, pbstrproperty)
  end
  def get_presence_data(this : IRTCPresenceDevice*, pbstrnamespace : UInt8**, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_data.call(this, pbstrnamespace, pbstrdata)
  end
end
struct LibWin32::IRTCDispatchEventNotification
  def query_interface(this : IRTCDispatchEventNotification*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRTCDispatchEventNotification*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRTCDispatchEventNotification*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRTCDispatchEventNotification*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRTCDispatchEventNotification*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRTCDispatchEventNotification*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRTCDispatchEventNotification*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ITransportSettingsInternal
  def query_interface(this : ITransportSettingsInternal*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransportSettingsInternal*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransportSettingsInternal*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def apply_setting(this : ITransportSettingsInternal*, setting : TRANSPORT_SETTING*) : HRESULT
    @lpVtbl.value.apply_setting.call(this, setting)
  end
  def query_setting(this : ITransportSettingsInternal*, setting : TRANSPORT_SETTING*) : HRESULT
    @lpVtbl.value.query_setting.call(this, setting)
  end
end
struct LibWin32::INetworkTransportSettings
  def query_interface(this : INetworkTransportSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkTransportSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkTransportSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def apply_setting(this : INetworkTransportSettings*, settingid : TRANSPORT_SETTING_ID*, lengthin : UInt32, valuein : UInt8*, lengthout : UInt32*, valueout : UInt8**) : HRESULT
    @lpVtbl.value.apply_setting.call(this, settingid, lengthin, valuein, lengthout, valueout)
  end
  def query_setting(this : INetworkTransportSettings*, settingid : TRANSPORT_SETTING_ID*, lengthin : UInt32, valuein : UInt8*, lengthout : UInt32*, valueout : UInt8**) : HRESULT
    @lpVtbl.value.query_setting.call(this, settingid, lengthin, valuein, lengthout, valueout)
  end
end
struct LibWin32::INotificationTransportSync
  def query_interface(this : INotificationTransportSync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INotificationTransportSync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INotificationTransportSync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def complete_delivery(this : INotificationTransportSync*) : HRESULT
    @lpVtbl.value.complete_delivery.call(this)
  end
  def flush(this : INotificationTransportSync*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
end
