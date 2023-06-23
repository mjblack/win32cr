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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    shutdown : UInt64
    prepare_for_shutdown : UInt64
    put_event_filter : UInt64
    get_event_filter : UInt64
    set_preferred_media_types : UInt64
    get_preferred_media_types : UInt64
    get_media_capabilities : UInt64
    create_session : UInt64
    put_listen_for_incoming_sessions : UInt64
    get_listen_for_incoming_sessions : UInt64
    get_network_addresses : UInt64
    put_volume : UInt64
    get_volume : UInt64
    put_audio_muted : UInt64
    get_audio_muted : UInt64
    get_i_video_window : UInt64
    put_preferred_audio_device : UInt64
    get_preferred_audio_device : UInt64
    put_preferred_volume : UInt64
    get_preferred_volume : UInt64
    put_preferred_aec : UInt64
    get_preferred_aec : UInt64
    put_preferred_video_device : UInt64
    get_preferred_video_device : UInt64
    get_active_media : UInt64
    put_max_bitrate : UInt64
    get_max_bitrate : UInt64
    put_temporal_spatial_trade_off : UInt64
    get_temporal_spatial_trade_off : UInt64
    get_network_quality : UInt64
    start_t120_applet : UInt64
    stop_t120_applets : UInt64
    get_is_t120_applet_running : UInt64
    get_local_user_uri : UInt64
    put_local_user_uri : UInt64
    get_local_user_name : UInt64
    put_local_user_name : UInt64
    play_ring : UInt64
    send_dtmf : UInt64
    invoke_tuning_wizard : UInt64
    get_is_tuned : UInt64
  end

  IRTCClient_GUID = "07829e45-9a34-408e-a011-bddf13487cd1"
  IID_IRTCClient = LibC::GUID.new(0x7829e45_u32, 0x9a34_u16, 0x408e_u16, StaticArray[0xa0_u8, 0x11_u8, 0xbd_u8, 0xdf_u8, 0x13_u8, 0x48_u8, 0x7c_u8, 0xd1_u8])
  struct IRTCClient
    lpVtbl : IRTCClientVTbl*
  end

  struct IRTCClient2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    shutdown : UInt64
    prepare_for_shutdown : UInt64
    put_event_filter : UInt64
    get_event_filter : UInt64
    set_preferred_media_types : UInt64
    get_preferred_media_types : UInt64
    get_media_capabilities : UInt64
    create_session : UInt64
    put_listen_for_incoming_sessions : UInt64
    get_listen_for_incoming_sessions : UInt64
    get_network_addresses : UInt64
    put_volume : UInt64
    get_volume : UInt64
    put_audio_muted : UInt64
    get_audio_muted : UInt64
    get_i_video_window : UInt64
    put_preferred_audio_device : UInt64
    get_preferred_audio_device : UInt64
    put_preferred_volume : UInt64
    get_preferred_volume : UInt64
    put_preferred_aec : UInt64
    get_preferred_aec : UInt64
    put_preferred_video_device : UInt64
    get_preferred_video_device : UInt64
    get_active_media : UInt64
    put_max_bitrate : UInt64
    get_max_bitrate : UInt64
    put_temporal_spatial_trade_off : UInt64
    get_temporal_spatial_trade_off : UInt64
    get_network_quality : UInt64
    start_t120_applet : UInt64
    stop_t120_applets : UInt64
    get_is_t120_applet_running : UInt64
    get_local_user_uri : UInt64
    put_local_user_uri : UInt64
    get_local_user_name : UInt64
    put_local_user_name : UInt64
    play_ring : UInt64
    send_dtmf : UInt64
    invoke_tuning_wizard : UInt64
    get_is_tuned : UInt64
    put_answer_mode : UInt64
    get_answer_mode : UInt64
    invoke_tuning_wizard_ex : UInt64
    get_version : UInt64
    put_client_name : UInt64
    put_client_cur_ver : UInt64
    initialize_ex : UInt64
    create_session_with_description : UInt64
    set_session_description_manager : UInt64
    put_preferred_security_level : UInt64
    get_preferred_security_level : UInt64
    put_allowed_ports : UInt64
    get_allowed_ports : UInt64
  end

  IRTCClient2_GUID = "0c91d71d-1064-42da-bfa5-572beb8eea84"
  IID_IRTCClient2 = LibC::GUID.new(0xc91d71d_u32, 0x1064_u16, 0x42da_u16, StaticArray[0xbf_u8, 0xa5_u8, 0x57_u8, 0x2b_u8, 0xeb_u8, 0x8e_u8, 0xea_u8, 0x84_u8])
  struct IRTCClient2
    lpVtbl : IRTCClient2VTbl*
  end

  struct IRTCClientPresenceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable_presence : UInt64
    export : UInt64
    import : UInt64
    enumerate_buddies : UInt64
    get_buddies : UInt64
    get_buddy : UInt64
    add_buddy : UInt64
    remove_buddy : UInt64
    enumerate_watchers : UInt64
    get_watchers : UInt64
    get_watcher : UInt64
    add_watcher : UInt64
    remove_watcher : UInt64
    set_local_presence_info : UInt64
    get_offer_watcher_mode : UInt64
    put_offer_watcher_mode : UInt64
    get_privacy_mode : UInt64
    put_privacy_mode : UInt64
  end

  IRTCClientPresence_GUID = "11c3cbcc-0744-42d1-968a-51aa1bb274c6"
  IID_IRTCClientPresence = LibC::GUID.new(0x11c3cbcc_u32, 0x744_u16, 0x42d1_u16, StaticArray[0x96_u8, 0x8a_u8, 0x51_u8, 0xaa_u8, 0x1b_u8, 0xb2_u8, 0x74_u8, 0xc6_u8])
  struct IRTCClientPresence
    lpVtbl : IRTCClientPresenceVTbl*
  end

  struct IRTCClientPresence2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable_presence : UInt64
    export : UInt64
    import : UInt64
    enumerate_buddies : UInt64
    get_buddies : UInt64
    get_buddy : UInt64
    add_buddy : UInt64
    remove_buddy : UInt64
    enumerate_watchers : UInt64
    get_watchers : UInt64
    get_watcher : UInt64
    add_watcher : UInt64
    remove_watcher : UInt64
    set_local_presence_info : UInt64
    get_offer_watcher_mode : UInt64
    put_offer_watcher_mode : UInt64
    get_privacy_mode : UInt64
    put_privacy_mode : UInt64
    enable_presence_ex : UInt64
    disable_presence : UInt64
    add_group : UInt64
    remove_group : UInt64
    enumerate_groups : UInt64
    get_groups : UInt64
    get_group : UInt64
    add_watcher_ex : UInt64
    get_watcher_ex : UInt64
    put_presence_property : UInt64
    get_presence_property : UInt64
    set_presence_data : UInt64
    get_presence_data : UInt64
    get_local_presence_info : UInt64
    add_buddy_ex : UInt64
  end

  IRTCClientPresence2_GUID = "ad1809e8-62f7-4783-909a-29c9d2cb1d34"
  IID_IRTCClientPresence2 = LibC::GUID.new(0xad1809e8_u32, 0x62f7_u16, 0x4783_u16, StaticArray[0x90_u8, 0x9a_u8, 0x29_u8, 0xc9_u8, 0xd2_u8, 0xcb_u8, 0x1d_u8, 0x34_u8])
  struct IRTCClientPresence2
    lpVtbl : IRTCClientPresence2VTbl*
  end

  struct IRTCClientProvisioningVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_profile : UInt64
    enable_profile : UInt64
    disable_profile : UInt64
    enumerate_profiles : UInt64
    get_profiles : UInt64
    get_profile : UInt64
    get_session_capabilities : UInt64
  end

  IRTCClientProvisioning_GUID = "b9f5cf06-65b9-4a80-a0e6-73cae3ef3822"
  IID_IRTCClientProvisioning = LibC::GUID.new(0xb9f5cf06_u32, 0x65b9_u16, 0x4a80_u16, StaticArray[0xa0_u8, 0xe6_u8, 0x73_u8, 0xca_u8, 0xe3_u8, 0xef_u8, 0x38_u8, 0x22_u8])
  struct IRTCClientProvisioning
    lpVtbl : IRTCClientProvisioningVTbl*
  end

  struct IRTCClientProvisioning2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_profile : UInt64
    enable_profile : UInt64
    disable_profile : UInt64
    enumerate_profiles : UInt64
    get_profiles : UInt64
    get_profile : UInt64
    get_session_capabilities : UInt64
    enable_profile_ex : UInt64
  end

  IRTCClientProvisioning2_GUID = "a70909b5-f40e-4587-bb75-e6bc0845023e"
  IID_IRTCClientProvisioning2 = LibC::GUID.new(0xa70909b5_u32, 0xf40e_u16, 0x4587_u16, StaticArray[0xbb_u8, 0x75_u8, 0xe6_u8, 0xbc_u8, 0x8_u8, 0x45_u8, 0x2_u8, 0x3e_u8])
  struct IRTCClientProvisioning2
    lpVtbl : IRTCClientProvisioning2VTbl*
  end

  struct IRTCProfileVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_key : UInt64
    get_name : UInt64
    get_xml : UInt64
    get_provider_name : UInt64
    get_provider_uri : UInt64
    get_provider_data : UInt64
    get_client_name : UInt64
    get_client_banner : UInt64
    get_client_min_ver : UInt64
    get_client_cur_ver : UInt64
    get_client_update_uri : UInt64
    get_client_data : UInt64
    get_user_uri : UInt64
    get_user_name : UInt64
    get_user_account : UInt64
    set_credentials : UInt64
    get_session_capabilities : UInt64
    get_state : UInt64
  end

  IRTCProfile_GUID = "d07eca9e-4062-4dd4-9e7d-722a49ba7303"
  IID_IRTCProfile = LibC::GUID.new(0xd07eca9e_u32, 0x4062_u16, 0x4dd4_u16, StaticArray[0x9e_u8, 0x7d_u8, 0x72_u8, 0x2a_u8, 0x49_u8, 0xba_u8, 0x73_u8, 0x3_u8])
  struct IRTCProfile
    lpVtbl : IRTCProfileVTbl*
  end

  struct IRTCProfile2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_key : UInt64
    get_name : UInt64
    get_xml : UInt64
    get_provider_name : UInt64
    get_provider_uri : UInt64
    get_provider_data : UInt64
    get_client_name : UInt64
    get_client_banner : UInt64
    get_client_min_ver : UInt64
    get_client_cur_ver : UInt64
    get_client_update_uri : UInt64
    get_client_data : UInt64
    get_user_uri : UInt64
    get_user_name : UInt64
    get_user_account : UInt64
    set_credentials : UInt64
    get_session_capabilities : UInt64
    get_state : UInt64
    get_realm : UInt64
    put_realm : UInt64
    get_allowed_auth : UInt64
    put_allowed_auth : UInt64
  end

  IRTCProfile2_GUID = "4b81f84e-bdc7-4184-9154-3cb2dd7917fb"
  IID_IRTCProfile2 = LibC::GUID.new(0x4b81f84e_u32, 0xbdc7_u16, 0x4184_u16, StaticArray[0x91_u8, 0x54_u8, 0x3c_u8, 0xb2_u8, 0xdd_u8, 0x79_u8, 0x17_u8, 0xfb_u8])
  struct IRTCProfile2
    lpVtbl : IRTCProfile2VTbl*
  end

  struct IRTCSessionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client : UInt64
    get_state : UInt64
    get_type : UInt64
    get_profile : UInt64
    get_participants : UInt64
    answer : UInt64
    terminate : UInt64
    redirect : UInt64
    add_participant : UInt64
    remove_participant : UInt64
    enumerate_participants : UInt64
    get_can_add_participants : UInt64
    get_redirected_user_uri : UInt64
    get_redirected_user_name : UInt64
    next_redirected_user : UInt64
    send_message : UInt64
    send_message_status : UInt64
    add_stream : UInt64
    remove_stream : UInt64
    put_encryption_key : UInt64
  end

  IRTCSession_GUID = "387c8086-99be-42fb-9973-7c0fc0ca9fa8"
  IID_IRTCSession = LibC::GUID.new(0x387c8086_u32, 0x99be_u16, 0x42fb_u16, StaticArray[0x99_u8, 0x73_u8, 0x7c_u8, 0xf_u8, 0xc0_u8, 0xca_u8, 0x9f_u8, 0xa8_u8])
  struct IRTCSession
    lpVtbl : IRTCSessionVTbl*
  end

  struct IRTCSession2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client : UInt64
    get_state : UInt64
    get_type : UInt64
    get_profile : UInt64
    get_participants : UInt64
    answer : UInt64
    terminate : UInt64
    redirect : UInt64
    add_participant : UInt64
    remove_participant : UInt64
    enumerate_participants : UInt64
    get_can_add_participants : UInt64
    get_redirected_user_uri : UInt64
    get_redirected_user_name : UInt64
    next_redirected_user : UInt64
    send_message : UInt64
    send_message_status : UInt64
    add_stream : UInt64
    remove_stream : UInt64
    put_encryption_key : UInt64
    send_info : UInt64
    put_preferred_security_level : UInt64
    get_preferred_security_level : UInt64
    is_security_enabled : UInt64
    answer_with_session_description : UInt64
    re_invite_with_session_description : UInt64
  end

  IRTCSession2_GUID = "17d7cdfc-b007-484c-99d2-86a8a820991d"
  IID_IRTCSession2 = LibC::GUID.new(0x17d7cdfc_u32, 0xb007_u16, 0x484c_u16, StaticArray[0x99_u8, 0xd2_u8, 0x86_u8, 0xa8_u8, 0xa8_u8, 0x20_u8, 0x99_u8, 0x1d_u8])
  struct IRTCSession2
    lpVtbl : IRTCSession2VTbl*
  end

  struct IRTCSessionCallControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    hold : UInt64
    un_hold : UInt64
    forward : UInt64
    refer : UInt64
    put_referred_by_uri : UInt64
    get_referred_by_uri : UInt64
    put_refer_cookie : UInt64
    get_refer_cookie : UInt64
    get_is_referred : UInt64
  end

  IRTCSessionCallControl_GUID = "e9a50d94-190b-4f82-9530-3b8ebf60758a"
  IID_IRTCSessionCallControl = LibC::GUID.new(0xe9a50d94_u32, 0x190b_u16, 0x4f82_u16, StaticArray[0x95_u8, 0x30_u8, 0x3b_u8, 0x8e_u8, 0xbf_u8, 0x60_u8, 0x75_u8, 0x8a_u8])
  struct IRTCSessionCallControl
    lpVtbl : IRTCSessionCallControlVTbl*
  end

  struct IRTCParticipantVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_user_uri : UInt64
    get_name : UInt64
    get_removable : UInt64
    get_state : UInt64
    get_session : UInt64
  end

  IRTCParticipant_GUID = "ae86add5-26b1-4414-af1d-b94cd938d739"
  IID_IRTCParticipant = LibC::GUID.new(0xae86add5_u32, 0x26b1_u16, 0x4414_u16, StaticArray[0xaf_u8, 0x1d_u8, 0xb9_u8, 0x4c_u8, 0xd9_u8, 0x38_u8, 0xd7_u8, 0x39_u8])
  struct IRTCParticipant
    lpVtbl : IRTCParticipantVTbl*
  end

  struct IRTCRoamingEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_event_type : UInt64
    get_profile : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
  end

  IRTCRoamingEvent_GUID = "79960a6b-0cb1-4dc8-a805-7318e99902e8"
  IID_IRTCRoamingEvent = LibC::GUID.new(0x79960a6b_u32, 0xcb1_u16, 0x4dc8_u16, StaticArray[0xa8_u8, 0x5_u8, 0x73_u8, 0x18_u8, 0xe9_u8, 0x99_u8, 0x2_u8, 0xe8_u8])
  struct IRTCRoamingEvent
    lpVtbl : IRTCRoamingEventVTbl*
  end

  struct IRTCProfileEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_profile : UInt64
    get_cookie : UInt64
    get_status_code : UInt64
  end

  IRTCProfileEvent_GUID = "d6d5ab3b-770e-43e8-800a-79b062395fca"
  IID_IRTCProfileEvent = LibC::GUID.new(0xd6d5ab3b_u32, 0x770e_u16, 0x43e8_u16, StaticArray[0x80_u8, 0xa_u8, 0x79_u8, 0xb0_u8, 0x62_u8, 0x39_u8, 0x5f_u8, 0xca_u8])
  struct IRTCProfileEvent
    lpVtbl : IRTCProfileEventVTbl*
  end

  struct IRTCProfileEvent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_profile : UInt64
    get_cookie : UInt64
    get_status_code : UInt64
    get_event_type : UInt64
  end

  IRTCProfileEvent2_GUID = "62e56edc-03fa-4121-94fb-23493fd0ae64"
  IID_IRTCProfileEvent2 = LibC::GUID.new(0x62e56edc_u32, 0x3fa_u16, 0x4121_u16, StaticArray[0x94_u8, 0xfb_u8, 0x23_u8, 0x49_u8, 0x3f_u8, 0xd0_u8, 0xae_u8, 0x64_u8])
  struct IRTCProfileEvent2
    lpVtbl : IRTCProfileEvent2VTbl*
  end

  struct IRTCClientEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_event_type : UInt64
    get_client : UInt64
  end

  IRTCClientEvent_GUID = "2b493b7a-3cba-4170-9c8b-76a9dacdd644"
  IID_IRTCClientEvent = LibC::GUID.new(0x2b493b7a_u32, 0x3cba_u16, 0x4170_u16, StaticArray[0x9c_u8, 0x8b_u8, 0x76_u8, 0xa9_u8, 0xda_u8, 0xcd_u8, 0xd6_u8, 0x44_u8])
  struct IRTCClientEvent
    lpVtbl : IRTCClientEventVTbl*
  end

  struct IRTCRegistrationStateChangeEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_profile : UInt64
    get_state : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
  end

  IRTCRegistrationStateChangeEvent_GUID = "62d0991b-50ab-4f02-b948-ca94f26f8f95"
  IID_IRTCRegistrationStateChangeEvent = LibC::GUID.new(0x62d0991b_u32, 0x50ab_u16, 0x4f02_u16, StaticArray[0xb9_u8, 0x48_u8, 0xca_u8, 0x94_u8, 0xf2_u8, 0x6f_u8, 0x8f_u8, 0x95_u8])
  struct IRTCRegistrationStateChangeEvent
    lpVtbl : IRTCRegistrationStateChangeEventVTbl*
  end

  struct IRTCSessionStateChangeEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_state : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
  end

  IRTCSessionStateChangeEvent_GUID = "b5bad703-5952-48b3-9321-7f4500521506"
  IID_IRTCSessionStateChangeEvent = LibC::GUID.new(0xb5bad703_u32, 0x5952_u16, 0x48b3_u16, StaticArray[0x93_u8, 0x21_u8, 0x7f_u8, 0x45_u8, 0x0_u8, 0x52_u8, 0x15_u8, 0x6_u8])
  struct IRTCSessionStateChangeEvent
    lpVtbl : IRTCSessionStateChangeEventVTbl*
  end

  struct IRTCSessionStateChangeEvent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_state : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
    get_media_types : UInt64
    get_remote_preferred_security_level : UInt64
    get_is_forked : UInt64
    get_remote_session_description : UInt64
  end

  IRTCSessionStateChangeEvent2_GUID = "4f933171-6f95-4880-80d9-2ec8d495d261"
  IID_IRTCSessionStateChangeEvent2 = LibC::GUID.new(0x4f933171_u32, 0x6f95_u16, 0x4880_u16, StaticArray[0x80_u8, 0xd9_u8, 0x2e_u8, 0xc8_u8, 0xd4_u8, 0x95_u8, 0xd2_u8, 0x61_u8])
  struct IRTCSessionStateChangeEvent2
    lpVtbl : IRTCSessionStateChangeEvent2VTbl*
  end

  struct IRTCSessionOperationCompleteEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_cookie : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
  end

  IRTCSessionOperationCompleteEvent_GUID = "a6bff4c0-f7c8-4d3c-9a41-3550f78a95b0"
  IID_IRTCSessionOperationCompleteEvent = LibC::GUID.new(0xa6bff4c0_u32, 0xf7c8_u16, 0x4d3c_u16, StaticArray[0x9a_u8, 0x41_u8, 0x35_u8, 0x50_u8, 0xf7_u8, 0x8a_u8, 0x95_u8, 0xb0_u8])
  struct IRTCSessionOperationCompleteEvent
    lpVtbl : IRTCSessionOperationCompleteEventVTbl*
  end

  struct IRTCSessionOperationCompleteEvent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_cookie : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
    get_participant : UInt64
    get_remote_session_description : UInt64
  end

  IRTCSessionOperationCompleteEvent2_GUID = "f6fc2a9b-d5bc-4241-b436-1b8460c13832"
  IID_IRTCSessionOperationCompleteEvent2 = LibC::GUID.new(0xf6fc2a9b_u32, 0xd5bc_u16, 0x4241_u16, StaticArray[0xb4_u8, 0x36_u8, 0x1b_u8, 0x84_u8, 0x60_u8, 0xc1_u8, 0x38_u8, 0x32_u8])
  struct IRTCSessionOperationCompleteEvent2
    lpVtbl : IRTCSessionOperationCompleteEvent2VTbl*
  end

  struct IRTCParticipantStateChangeEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_participant : UInt64
    get_state : UInt64
    get_status_code : UInt64
  end

  IRTCParticipantStateChangeEvent_GUID = "09bcb597-f0fa-48f9-b420-468cea7fde04"
  IID_IRTCParticipantStateChangeEvent = LibC::GUID.new(0x9bcb597_u32, 0xf0fa_u16, 0x48f9_u16, StaticArray[0xb4_u8, 0x20_u8, 0x46_u8, 0x8c_u8, 0xea_u8, 0x7f_u8, 0xde_u8, 0x4_u8])
  struct IRTCParticipantStateChangeEvent
    lpVtbl : IRTCParticipantStateChangeEventVTbl*
  end

  struct IRTCMediaEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_media_type : UInt64
    get_event_type : UInt64
    get_event_reason : UInt64
  end

  IRTCMediaEvent_GUID = "099944fb-bcda-453e-8c41-e13da2adf7f3"
  IID_IRTCMediaEvent = LibC::GUID.new(0x99944fb_u32, 0xbcda_u16, 0x453e_u16, StaticArray[0x8c_u8, 0x41_u8, 0xe1_u8, 0x3d_u8, 0xa2_u8, 0xad_u8, 0xf7_u8, 0xf3_u8])
  struct IRTCMediaEvent
    lpVtbl : IRTCMediaEventVTbl*
  end

  struct IRTCIntensityEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_level : UInt64
    get_min : UInt64
    get_max : UInt64
    get_direction : UInt64
  end

  IRTCIntensityEvent_GUID = "4c23bf51-390c-4992-a41d-41eec05b2a4b"
  IID_IRTCIntensityEvent = LibC::GUID.new(0x4c23bf51_u32, 0x390c_u16, 0x4992_u16, StaticArray[0xa4_u8, 0x1d_u8, 0x41_u8, 0xee_u8, 0xc0_u8, 0x5b_u8, 0x2a_u8, 0x4b_u8])
  struct IRTCIntensityEvent
    lpVtbl : IRTCIntensityEventVTbl*
  end

  struct IRTCMessagingEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_participant : UInt64
    get_event_type : UInt64
    get_message : UInt64
    get_message_header : UInt64
    get_user_status : UInt64
  end

  IRTCMessagingEvent_GUID = "d3609541-1b29-4de5-a4ad-5aebaf319512"
  IID_IRTCMessagingEvent = LibC::GUID.new(0xd3609541_u32, 0x1b29_u16, 0x4de5_u16, StaticArray[0xa4_u8, 0xad_u8, 0x5a_u8, 0xeb_u8, 0xaf_u8, 0x31_u8, 0x95_u8, 0x12_u8])
  struct IRTCMessagingEvent
    lpVtbl : IRTCMessagingEventVTbl*
  end

  struct IRTCBuddyEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_buddy : UInt64
  end

  IRTCBuddyEvent_GUID = "f36d755d-17e6-404e-954f-0fc07574c78d"
  IID_IRTCBuddyEvent = LibC::GUID.new(0xf36d755d_u32, 0x17e6_u16, 0x404e_u16, StaticArray[0x95_u8, 0x4f_u8, 0xf_u8, 0xc0_u8, 0x75_u8, 0x74_u8, 0xc7_u8, 0x8d_u8])
  struct IRTCBuddyEvent
    lpVtbl : IRTCBuddyEventVTbl*
  end

  struct IRTCBuddyEvent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_buddy : UInt64
    get_event_type : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
  end

  IRTCBuddyEvent2_GUID = "484a7f1e-73f0-4990-bfc2-60bc3978a720"
  IID_IRTCBuddyEvent2 = LibC::GUID.new(0x484a7f1e_u32, 0x73f0_u16, 0x4990_u16, StaticArray[0xbf_u8, 0xc2_u8, 0x60_u8, 0xbc_u8, 0x39_u8, 0x78_u8, 0xa7_u8, 0x20_u8])
  struct IRTCBuddyEvent2
    lpVtbl : IRTCBuddyEvent2VTbl*
  end

  struct IRTCWatcherEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_watcher : UInt64
  end

  IRTCWatcherEvent_GUID = "f30d7261-587a-424f-822c-312788f43548"
  IID_IRTCWatcherEvent = LibC::GUID.new(0xf30d7261_u32, 0x587a_u16, 0x424f_u16, StaticArray[0x82_u8, 0x2c_u8, 0x31_u8, 0x27_u8, 0x88_u8, 0xf4_u8, 0x35_u8, 0x48_u8])
  struct IRTCWatcherEvent
    lpVtbl : IRTCWatcherEventVTbl*
  end

  struct IRTCWatcherEvent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_watcher : UInt64
    get_event_type : UInt64
    get_status_code : UInt64
  end

  IRTCWatcherEvent2_GUID = "e52891e8-188c-49af-b005-98ed13f83f9c"
  IID_IRTCWatcherEvent2 = LibC::GUID.new(0xe52891e8_u32, 0x188c_u16, 0x49af_u16, StaticArray[0xb0_u8, 0x5_u8, 0x98_u8, 0xed_u8, 0x13_u8, 0xf8_u8, 0x3f_u8, 0x9c_u8])
  struct IRTCWatcherEvent2
    lpVtbl : IRTCWatcherEvent2VTbl*
  end

  struct IRTCBuddyGroupEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_event_type : UInt64
    get_group : UInt64
    get_buddy : UInt64
    get_status_code : UInt64
  end

  IRTCBuddyGroupEvent_GUID = "3a79e1d1-b736-4414-96f8-bbc7f08863e4"
  IID_IRTCBuddyGroupEvent = LibC::GUID.new(0x3a79e1d1_u32, 0xb736_u16, 0x4414_u16, StaticArray[0x96_u8, 0xf8_u8, 0xbb_u8, 0xc7_u8, 0xf0_u8, 0x88_u8, 0x63_u8, 0xe4_u8])
  struct IRTCBuddyGroupEvent
    lpVtbl : IRTCBuddyGroupEventVTbl*
  end

  struct IRTCInfoEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_participant : UInt64
    get_info : UInt64
    get_info_header : UInt64
  end

  IRTCInfoEvent_GUID = "4e1d68ae-1912-4f49-b2c3-594fadfd425f"
  IID_IRTCInfoEvent = LibC::GUID.new(0x4e1d68ae_u32, 0x1912_u16, 0x4f49_u16, StaticArray[0xb2_u8, 0xc3_u8, 0x59_u8, 0x4f_u8, 0xad_u8, 0xfd_u8, 0x42_u8, 0x5f_u8])
  struct IRTCInfoEvent
    lpVtbl : IRTCInfoEventVTbl*
  end

  struct IRTCMediaRequestEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_proposed_media : UInt64
    get_current_media : UInt64
    accept : UInt64
    get_remote_preferred_security_level : UInt64
    reject : UInt64
    get_state : UInt64
  end

  IRTCMediaRequestEvent_GUID = "52572d15-148c-4d97-a36c-2da55c289d63"
  IID_IRTCMediaRequestEvent = LibC::GUID.new(0x52572d15_u32, 0x148c_u16, 0x4d97_u16, StaticArray[0xa3_u8, 0x6c_u8, 0x2d_u8, 0xa5_u8, 0x5c_u8, 0x28_u8, 0x9d_u8, 0x63_u8])
  struct IRTCMediaRequestEvent
    lpVtbl : IRTCMediaRequestEventVTbl*
  end

  struct IRTCReInviteEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    accept : UInt64
    reject : UInt64
    get_state : UInt64
    get_remote_session_description : UInt64
  end

  IRTCReInviteEvent_GUID = "11558d84-204c-43e7-99b0-2034e9417f7d"
  IID_IRTCReInviteEvent = LibC::GUID.new(0x11558d84_u32, 0x204c_u16, 0x43e7_u16, StaticArray[0x99_u8, 0xb0_u8, 0x20_u8, 0x34_u8, 0xe9_u8, 0x41_u8, 0x7f_u8, 0x7d_u8])
  struct IRTCReInviteEvent
    lpVtbl : IRTCReInviteEventVTbl*
  end

  struct IRTCPresencePropertyEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
    get_presence_property : UInt64
    get_value : UInt64
  end

  IRTCPresencePropertyEvent_GUID = "f777f570-a820-49d5-86bd-e099493f1518"
  IID_IRTCPresencePropertyEvent = LibC::GUID.new(0xf777f570_u32, 0xa820_u16, 0x49d5_u16, StaticArray[0x86_u8, 0xbd_u8, 0xe0_u8, 0x99_u8, 0x49_u8, 0x3f_u8, 0x15_u8, 0x18_u8])
  struct IRTCPresencePropertyEvent
    lpVtbl : IRTCPresencePropertyEventVTbl*
  end

  struct IRTCPresenceDataEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
    get_presence_data : UInt64
  end

  IRTCPresenceDataEvent_GUID = "38f0e78c-8b87-4c04-a82d-aedd83c909bb"
  IID_IRTCPresenceDataEvent = LibC::GUID.new(0x38f0e78c_u32, 0x8b87_u16, 0x4c04_u16, StaticArray[0xa8_u8, 0x2d_u8, 0xae_u8, 0xdd_u8, 0x83_u8, 0xc9_u8, 0x9_u8, 0xbb_u8])
  struct IRTCPresenceDataEvent
    lpVtbl : IRTCPresenceDataEventVTbl*
  end

  struct IRTCPresenceStatusEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
    get_local_presence_info : UInt64
  end

  IRTCPresenceStatusEvent_GUID = "78673f32-4a0f-462c-89aa-ee7706707678"
  IID_IRTCPresenceStatusEvent = LibC::GUID.new(0x78673f32_u32, 0x4a0f_u16, 0x462c_u16, StaticArray[0x89_u8, 0xaa_u8, 0xee_u8, 0x77_u8, 0x6_u8, 0x70_u8, 0x76_u8, 0x78_u8])
  struct IRTCPresenceStatusEvent
    lpVtbl : IRTCPresenceStatusEventVTbl*
  end

  struct IRTCCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IRTCCollection_GUID = "ec7c8096-b918-4044-94f1-e4fba0361d5c"
  IID_IRTCCollection = LibC::GUID.new(0xec7c8096_u32, 0xb918_u16, 0x4044_u16, StaticArray[0x94_u8, 0xf1_u8, 0xe4_u8, 0xfb_u8, 0xa0_u8, 0x36_u8, 0x1d_u8, 0x5c_u8])
  struct IRTCCollection
    lpVtbl : IRTCCollectionVTbl*
  end

  struct IRTCEnumParticipantsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
    clone : UInt64
  end

  IRTCEnumParticipants_GUID = "fcd56f29-4a4f-41b2-ba5c-f5bccc060bf6"
  IID_IRTCEnumParticipants = LibC::GUID.new(0xfcd56f29_u32, 0x4a4f_u16, 0x41b2_u16, StaticArray[0xba_u8, 0x5c_u8, 0xf5_u8, 0xbc_u8, 0xcc_u8, 0x6_u8, 0xb_u8, 0xf6_u8])
  struct IRTCEnumParticipants
    lpVtbl : IRTCEnumParticipantsVTbl*
  end

  struct IRTCEnumProfilesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
    clone : UInt64
  end

  IRTCEnumProfiles_GUID = "29b7c41c-ed82-4bca-84ad-39d5101b58e3"
  IID_IRTCEnumProfiles = LibC::GUID.new(0x29b7c41c_u32, 0xed82_u16, 0x4bca_u16, StaticArray[0x84_u8, 0xad_u8, 0x39_u8, 0xd5_u8, 0x10_u8, 0x1b_u8, 0x58_u8, 0xe3_u8])
  struct IRTCEnumProfiles
    lpVtbl : IRTCEnumProfilesVTbl*
  end

  struct IRTCEnumBuddiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
    clone : UInt64
  end

  IRTCEnumBuddies_GUID = "f7296917-5569-4b3b-b3af-98d1144b2b87"
  IID_IRTCEnumBuddies = LibC::GUID.new(0xf7296917_u32, 0x5569_u16, 0x4b3b_u16, StaticArray[0xb3_u8, 0xaf_u8, 0x98_u8, 0xd1_u8, 0x14_u8, 0x4b_u8, 0x2b_u8, 0x87_u8])
  struct IRTCEnumBuddies
    lpVtbl : IRTCEnumBuddiesVTbl*
  end

  struct IRTCEnumWatchersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
    clone : UInt64
  end

  IRTCEnumWatchers_GUID = "a87d55d7-db74-4ed1-9ca4-77a0e41b413e"
  IID_IRTCEnumWatchers = LibC::GUID.new(0xa87d55d7_u32, 0xdb74_u16, 0x4ed1_u16, StaticArray[0x9c_u8, 0xa4_u8, 0x77_u8, 0xa0_u8, 0xe4_u8, 0x1b_u8, 0x41_u8, 0x3e_u8])
  struct IRTCEnumWatchers
    lpVtbl : IRTCEnumWatchersVTbl*
  end

  struct IRTCEnumGroupsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
    clone : UInt64
  end

  IRTCEnumGroups_GUID = "742378d6-a141-4415-8f27-35d99076cf5d"
  IID_IRTCEnumGroups = LibC::GUID.new(0x742378d6_u32, 0xa141_u16, 0x4415_u16, StaticArray[0x8f_u8, 0x27_u8, 0x35_u8, 0xd9_u8, 0x90_u8, 0x76_u8, 0xcf_u8, 0x5d_u8])
  struct IRTCEnumGroups
    lpVtbl : IRTCEnumGroupsVTbl*
  end

  struct IRTCPresenceContactVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_presentity_uri : UInt64
    put_presentity_uri : UInt64
    get_name : UInt64
    put_name : UInt64
    get_data : UInt64
    put_data : UInt64
    get_persistent : UInt64
    put_persistent : UInt64
  end

  IRTCPresenceContact_GUID = "8b22f92c-cd90-42db-a733-212205c3e3df"
  IID_IRTCPresenceContact = LibC::GUID.new(0x8b22f92c_u32, 0xcd90_u16, 0x42db_u16, StaticArray[0xa7_u8, 0x33_u8, 0x21_u8, 0x22_u8, 0x5_u8, 0xc3_u8, 0xe3_u8, 0xdf_u8])
  struct IRTCPresenceContact
    lpVtbl : IRTCPresenceContactVTbl*
  end

  struct IRTCBuddyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_presentity_uri : UInt64
    put_presentity_uri : UInt64
    get_name : UInt64
    put_name : UInt64
    get_data : UInt64
    put_data : UInt64
    get_persistent : UInt64
    put_persistent : UInt64
    get_status : UInt64
    get_notes : UInt64
  end

  IRTCBuddy_GUID = "fcb136c8-7b90-4e0c-befe-56edf0ba6f1c"
  IID_IRTCBuddy = LibC::GUID.new(0xfcb136c8_u32, 0x7b90_u16, 0x4e0c_u16, StaticArray[0xbe_u8, 0xfe_u8, 0x56_u8, 0xed_u8, 0xf0_u8, 0xba_u8, 0x6f_u8, 0x1c_u8])
  struct IRTCBuddy
    lpVtbl : IRTCBuddyVTbl*
  end

  struct IRTCBuddy2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_presentity_uri : UInt64
    put_presentity_uri : UInt64
    get_name : UInt64
    put_name : UInt64
    get_data : UInt64
    put_data : UInt64
    get_persistent : UInt64
    put_persistent : UInt64
    get_status : UInt64
    get_notes : UInt64
    get_profile : UInt64
    refresh : UInt64
    enumerate_groups : UInt64
    get_groups : UInt64
    get_presence_property : UInt64
    enumerate_presence_devices : UInt64
    get_presence_devices : UInt64
    get_subscription_type : UInt64
  end

  IRTCBuddy2_GUID = "102f9588-23e7-40e3-954d-cd7a1d5c0361"
  IID_IRTCBuddy2 = LibC::GUID.new(0x102f9588_u32, 0x23e7_u16, 0x40e3_u16, StaticArray[0x95_u8, 0x4d_u8, 0xcd_u8, 0x7a_u8, 0x1d_u8, 0x5c_u8, 0x3_u8, 0x61_u8])
  struct IRTCBuddy2
    lpVtbl : IRTCBuddy2VTbl*
  end

  struct IRTCWatcherVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_presentity_uri : UInt64
    put_presentity_uri : UInt64
    get_name : UInt64
    put_name : UInt64
    get_data : UInt64
    put_data : UInt64
    get_persistent : UInt64
    put_persistent : UInt64
    get_state : UInt64
    put_state : UInt64
  end

  IRTCWatcher_GUID = "c7cedad8-346b-4d1b-ac02-a2088df9be4f"
  IID_IRTCWatcher = LibC::GUID.new(0xc7cedad8_u32, 0x346b_u16, 0x4d1b_u16, StaticArray[0xac_u8, 0x2_u8, 0xa2_u8, 0x8_u8, 0x8d_u8, 0xf9_u8, 0xbe_u8, 0x4f_u8])
  struct IRTCWatcher
    lpVtbl : IRTCWatcherVTbl*
  end

  struct IRTCWatcher2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_presentity_uri : UInt64
    put_presentity_uri : UInt64
    get_name : UInt64
    put_name : UInt64
    get_data : UInt64
    put_data : UInt64
    get_persistent : UInt64
    put_persistent : UInt64
    get_state : UInt64
    put_state : UInt64
    get_profile : UInt64
    get_scope : UInt64
  end

  IRTCWatcher2_GUID = "d4d9967f-d011-4b1d-91e3-aba78f96393d"
  IID_IRTCWatcher2 = LibC::GUID.new(0xd4d9967f_u32, 0xd011_u16, 0x4b1d_u16, StaticArray[0x91_u8, 0xe3_u8, 0xab_u8, 0xa7_u8, 0x8f_u8, 0x96_u8, 0x39_u8, 0x3d_u8])
  struct IRTCWatcher2
    lpVtbl : IRTCWatcher2VTbl*
  end

  struct IRTCBuddyGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    put_name : UInt64
    add_buddy : UInt64
    remove_buddy : UInt64
    enumerate_buddies : UInt64
    get_buddies : UInt64
    get_data : UInt64
    put_data : UInt64
    get_profile : UInt64
  end

  IRTCBuddyGroup_GUID = "60361e68-9164-4389-a4c6-d0b3925bda5e"
  IID_IRTCBuddyGroup = LibC::GUID.new(0x60361e68_u32, 0x9164_u16, 0x4389_u16, StaticArray[0xa4_u8, 0xc6_u8, 0xd0_u8, 0xb3_u8, 0x92_u8, 0x5b_u8, 0xda_u8, 0x5e_u8])
  struct IRTCBuddyGroup
    lpVtbl : IRTCBuddyGroupVTbl*
  end

  struct IRTCEventNotificationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    event : UInt64
  end

  IRTCEventNotification_GUID = "13fa24c7-5748-4b21-91f5-7397609ce747"
  IID_IRTCEventNotification = LibC::GUID.new(0x13fa24c7_u32, 0x5748_u16, 0x4b21_u16, StaticArray[0x91_u8, 0xf5_u8, 0x73_u8, 0x97_u8, 0x60_u8, 0x9c_u8, 0xe7_u8, 0x47_u8])
  struct IRTCEventNotification
    lpVtbl : IRTCEventNotificationVTbl*
  end

  struct IRTCPortManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_mapping : UInt64
    update_remote_address : UInt64
    release_mapping : UInt64
  end

  IRTCPortManager_GUID = "da77c14b-6208-43ca-8ddf-5b60a0a69fac"
  IID_IRTCPortManager = LibC::GUID.new(0xda77c14b_u32, 0x6208_u16, 0x43ca_u16, StaticArray[0x8d_u8, 0xdf_u8, 0x5b_u8, 0x60_u8, 0xa0_u8, 0xa6_u8, 0x9f_u8, 0xac_u8])
  struct IRTCPortManager
    lpVtbl : IRTCPortManagerVTbl*
  end

  struct IRTCSessionPortManagementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_port_manager : UInt64
  end

  IRTCSessionPortManagement_GUID = "a072f1d6-0286-4e1f-85f2-17a2948456ec"
  IID_IRTCSessionPortManagement = LibC::GUID.new(0xa072f1d6_u32, 0x286_u16, 0x4e1f_u16, StaticArray[0x85_u8, 0xf2_u8, 0x17_u8, 0xa2_u8, 0x94_u8, 0x84_u8, 0x56_u8, 0xec_u8])
  struct IRTCSessionPortManagement
    lpVtbl : IRTCSessionPortManagementVTbl*
  end

  struct IRTCClientPortManagementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_listen_address_and_port : UInt64
    stop_listen_address_and_port : UInt64
    get_port_range : UInt64
  end

  IRTCClientPortManagement_GUID = "d5df3f03-4bde-4417-aefe-71177bdaea66"
  IID_IRTCClientPortManagement = LibC::GUID.new(0xd5df3f03_u32, 0x4bde_u16, 0x4417_u16, StaticArray[0xae_u8, 0xfe_u8, 0x71_u8, 0x17_u8, 0x7b_u8, 0xda_u8, 0xea_u8, 0x66_u8])
  struct IRTCClientPortManagement
    lpVtbl : IRTCClientPortManagementVTbl*
  end

  struct IRTCUserSearchVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_query : UInt64
    execute_search : UInt64
  end

  IRTCUserSearch_GUID = "b619882b-860c-4db4-be1b-693b6505bbe5"
  IID_IRTCUserSearch = LibC::GUID.new(0xb619882b_u32, 0x860c_u16, 0x4db4_u16, StaticArray[0xbe_u8, 0x1b_u8, 0x69_u8, 0x3b_u8, 0x65_u8, 0x5_u8, 0xbb_u8, 0xe5_u8])
  struct IRTCUserSearch
    lpVtbl : IRTCUserSearchVTbl*
  end

  struct IRTCUserSearchQueryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    put_search_term : UInt64
    get_search_term : UInt64
    get_search_terms : UInt64
    put_search_preference : UInt64
    get_search_preference : UInt64
    put_search_domain : UInt64
    get_search_domain : UInt64
  end

  IRTCUserSearchQuery_GUID = "288300f5-d23a-4365-9a73-9985c98c2881"
  IID_IRTCUserSearchQuery = LibC::GUID.new(0x288300f5_u32, 0xd23a_u16, 0x4365_u16, StaticArray[0x9a_u8, 0x73_u8, 0x99_u8, 0x85_u8, 0xc9_u8, 0x8c_u8, 0x28_u8, 0x81_u8])
  struct IRTCUserSearchQuery
    lpVtbl : IRTCUserSearchQueryVTbl*
  end

  struct IRTCUserSearchResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_value : UInt64
  end

  IRTCUserSearchResult_GUID = "851278b2-9592-480f-8db5-2de86b26b54d"
  IID_IRTCUserSearchResult = LibC::GUID.new(0x851278b2_u32, 0x9592_u16, 0x480f_u16, StaticArray[0x8d_u8, 0xb5_u8, 0x2d_u8, 0xe8_u8, 0x6b_u8, 0x26_u8, 0xb5_u8, 0x4d_u8])
  struct IRTCUserSearchResult
    lpVtbl : IRTCUserSearchResultVTbl*
  end

  struct IRTCEnumUserSearchResultsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
    clone : UInt64
  end

  IRTCEnumUserSearchResults_GUID = "83d4d877-aa5d-4a5b-8d0e-002a8067e0e8"
  IID_IRTCEnumUserSearchResults = LibC::GUID.new(0x83d4d877_u32, 0xaa5d_u16, 0x4a5b_u16, StaticArray[0x8d_u8, 0xe_u8, 0x0_u8, 0x2a_u8, 0x80_u8, 0x67_u8, 0xe0_u8, 0xe8_u8])
  struct IRTCEnumUserSearchResults
    lpVtbl : IRTCEnumUserSearchResultsVTbl*
  end

  struct IRTCUserSearchResultsEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    enumerate_results : UInt64
    get_results : UInt64
    get_profile : UInt64
    get_query : UInt64
    get_cookie : UInt64
    get_status_code : UInt64
    get_more_available : UInt64
  end

  IRTCUserSearchResultsEvent_GUID = "d8c8c3cd-7fac-4088-81c5-c24cbc0938e3"
  IID_IRTCUserSearchResultsEvent = LibC::GUID.new(0xd8c8c3cd_u32, 0x7fac_u16, 0x4088_u16, StaticArray[0x81_u8, 0xc5_u8, 0xc2_u8, 0x4c_u8, 0xbc_u8, 0x9_u8, 0x38_u8, 0xe3_u8])
  struct IRTCUserSearchResultsEvent
    lpVtbl : IRTCUserSearchResultsEventVTbl*
  end

  struct IRTCSessionReferStatusEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_refer_status : UInt64
    get_status_code : UInt64
    get_status_text : UInt64
  end

  IRTCSessionReferStatusEvent_GUID = "3d8fc2cd-5d76-44ab-bb68-2a80353b34a2"
  IID_IRTCSessionReferStatusEvent = LibC::GUID.new(0x3d8fc2cd_u32, 0x5d76_u16, 0x44ab_u16, StaticArray[0xbb_u8, 0x68_u8, 0x2a_u8, 0x80_u8, 0x35_u8, 0x3b_u8, 0x34_u8, 0xa2_u8])
  struct IRTCSessionReferStatusEvent
    lpVtbl : IRTCSessionReferStatusEventVTbl*
  end

  struct IRTCSessionReferredEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_session : UInt64
    get_referred_by_uri : UInt64
    get_refer_to_uri : UInt64
    get_refer_cookie : UInt64
    accept : UInt64
    reject : UInt64
    set_referred_session_state : UInt64
  end

  IRTCSessionReferredEvent_GUID = "176a6828-4fcc-4f28-a862-04597a6cf1c4"
  IID_IRTCSessionReferredEvent = LibC::GUID.new(0x176a6828_u32, 0x4fcc_u16, 0x4f28_u16, StaticArray[0xa8_u8, 0x62_u8, 0x4_u8, 0x59_u8, 0x7a_u8, 0x6c_u8, 0xf1_u8, 0xc4_u8])
  struct IRTCSessionReferredEvent
    lpVtbl : IRTCSessionReferredEventVTbl*
  end

  struct IRTCSessionDescriptionManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    evaluate_session_description : UInt64
  end

  IRTCSessionDescriptionManager_GUID = "ba7f518e-d336-4070-93a6-865395c843f9"
  IID_IRTCSessionDescriptionManager = LibC::GUID.new(0xba7f518e_u32, 0xd336_u16, 0x4070_u16, StaticArray[0x93_u8, 0xa6_u8, 0x86_u8, 0x53_u8, 0x95_u8, 0xc8_u8, 0x43_u8, 0xf9_u8])
  struct IRTCSessionDescriptionManager
    lpVtbl : IRTCSessionDescriptionManagerVTbl*
  end

  struct IRTCEnumPresenceDevicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
    clone : UInt64
  end

  IRTCEnumPresenceDevices_GUID = "708c2ab7-8bf8-42f8-8c7d-635197ad5539"
  IID_IRTCEnumPresenceDevices = LibC::GUID.new(0x708c2ab7_u32, 0x8bf8_u16, 0x42f8_u16, StaticArray[0x8c_u8, 0x7d_u8, 0x63_u8, 0x51_u8, 0x97_u8, 0xad_u8, 0x55_u8, 0x39_u8])
  struct IRTCEnumPresenceDevices
    lpVtbl : IRTCEnumPresenceDevicesVTbl*
  end

  struct IRTCPresenceDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_status : UInt64
    get_notes : UInt64
    get_presence_property : UInt64
    get_presence_data : UInt64
  end

  IRTCPresenceDevice_GUID = "bc6a90dd-ad9a-48da-9b0c-2515e38521ad"
  IID_IRTCPresenceDevice = LibC::GUID.new(0xbc6a90dd_u32, 0xad9a_u16, 0x48da_u16, StaticArray[0x9b_u8, 0xc_u8, 0x25_u8, 0x15_u8, 0xe3_u8, 0x85_u8, 0x21_u8, 0xad_u8])
  struct IRTCPresenceDevice
    lpVtbl : IRTCPresenceDeviceVTbl*
  end

  struct IRTCDispatchEventNotificationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IRTCDispatchEventNotification_GUID = "176ddfbe-fec0-4d55-bc87-84cff1ef7f91"
  IID_IRTCDispatchEventNotification = LibC::GUID.new(0x176ddfbe_u32, 0xfec0_u16, 0x4d55_u16, StaticArray[0xbc_u8, 0x87_u8, 0x84_u8, 0xcf_u8, 0xf1_u8, 0xef_u8, 0x7f_u8, 0x91_u8])
  struct IRTCDispatchEventNotification
    lpVtbl : IRTCDispatchEventNotificationVTbl*
  end

  struct ITransportSettingsInternalVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    apply_setting : UInt64
    query_setting : UInt64
  end

  ITransportSettingsInternal_GUID = "5123e076-29e3-4bfd-84fe-0192d411e3e8"
  IID_ITransportSettingsInternal = LibC::GUID.new(0x5123e076_u32, 0x29e3_u16, 0x4bfd_u16, StaticArray[0x84_u8, 0xfe_u8, 0x1_u8, 0x92_u8, 0xd4_u8, 0x11_u8, 0xe3_u8, 0xe8_u8])
  struct ITransportSettingsInternal
    lpVtbl : ITransportSettingsInternalVTbl*
  end

  struct INetworkTransportSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    apply_setting : UInt64
    query_setting : UInt64
  end

  INetworkTransportSettings_GUID = "5e7abb2c-f2c1-4a61-bd35-deb7a08ab0f1"
  IID_INetworkTransportSettings = LibC::GUID.new(0x5e7abb2c_u32, 0xf2c1_u16, 0x4a61_u16, StaticArray[0xbd_u8, 0x35_u8, 0xde_u8, 0xb7_u8, 0xa0_u8, 0x8a_u8, 0xb0_u8, 0xf1_u8])
  struct INetworkTransportSettings
    lpVtbl : INetworkTransportSettingsVTbl*
  end

  struct INotificationTransportSyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    complete_delivery : UInt64
    flush : UInt64
  end

  INotificationTransportSync_GUID = "79eb1402-0ab8-49c0-9e14-a1ae4ba93058"
  IID_INotificationTransportSync = LibC::GUID.new(0x79eb1402_u32, 0xab8_u16, 0x49c0_u16, StaticArray[0x9e_u8, 0x14_u8, 0xa1_u8, 0xae_u8, 0x4b_u8, 0xa9_u8, 0x30_u8, 0x58_u8])
  struct INotificationTransportSync
    lpVtbl : INotificationTransportSyncVTbl*
  end

end
struct LibWin32::IRTCClient
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HRESULT)).call
  end
  def shutdown : HRESULT
    @lpVtbl.value.shutdown.unsafe_as(Proc(HRESULT)).call
  end
  def prepare_for_shutdown : HRESULT
    @lpVtbl.value.prepare_for_shutdown.unsafe_as(Proc(HRESULT)).call
  end
  def put_event_filter(lfilter : Int32) : HRESULT
    @lpVtbl.value.put_event_filter.unsafe_as(Proc(Int32, HRESULT)).call(lfilter)
  end
  def get_event_filter(plfilter : Int32*) : HRESULT
    @lpVtbl.value.get_event_filter.unsafe_as(Proc(Int32*, HRESULT)).call(plfilter)
  end
  def set_preferred_media_types(lmediatypes : Int32, fpersistent : Int16) : HRESULT
    @lpVtbl.value.set_preferred_media_types.unsafe_as(Proc(Int32, Int16, HRESULT)).call(lmediatypes, fpersistent)
  end
  def get_preferred_media_types(plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_media_types.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatypes)
  end
  def get_media_capabilities(plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_media_capabilities.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatypes)
  end
  def create_session(entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.create_session.unsafe_as(Proc(RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, IRTCSession*, HRESULT)).call(entype, bstrlocalphoneuri, pprofile, lflags, ppsession)
  end
  def put_listen_for_incoming_sessions(enlisten : RTC_LISTEN_MODE) : HRESULT
    @lpVtbl.value.put_listen_for_incoming_sessions.unsafe_as(Proc(RTC_LISTEN_MODE, HRESULT)).call(enlisten)
  end
  def get_listen_for_incoming_sessions(penlisten : RTC_LISTEN_MODE*) : HRESULT
    @lpVtbl.value.get_listen_for_incoming_sessions.unsafe_as(Proc(RTC_LISTEN_MODE*, HRESULT)).call(penlisten)
  end
  def get_network_addresses(ftcp : Int16, fexternal : Int16, pvaddresses : VARIANT*) : HRESULT
    @lpVtbl.value.get_network_addresses.unsafe_as(Proc(Int16, Int16, VARIANT*, HRESULT)).call(ftcp, fexternal, pvaddresses)
  end
  def put_volume(endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32, HRESULT)).call(endevice, lvolume)
  end
  def get_volume(endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32*, HRESULT)).call(endevice, plvolume)
  end
  def put_audio_muted(endevice : RTC_AUDIO_DEVICE, fmuted : Int16) : HRESULT
    @lpVtbl.value.put_audio_muted.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int16, HRESULT)).call(endevice, fmuted)
  end
  def get_audio_muted(endevice : RTC_AUDIO_DEVICE, pfmuted : Int16*) : HRESULT
    @lpVtbl.value.get_audio_muted.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int16*, HRESULT)).call(endevice, pfmuted)
  end
  def get_i_video_window(endevice : RTC_VIDEO_DEVICE, ppivideowindow : IVideoWindow*) : HRESULT
    @lpVtbl.value.get_i_video_window.unsafe_as(Proc(RTC_VIDEO_DEVICE, IVideoWindow*, HRESULT)).call(endevice, ppivideowindow)
  end
  def put_preferred_audio_device(endevice : RTC_AUDIO_DEVICE, bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_audio_device.unsafe_as(Proc(RTC_AUDIO_DEVICE, UInt8*, HRESULT)).call(endevice, bstrdevicename)
  end
  def get_preferred_audio_device(endevice : RTC_AUDIO_DEVICE, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_audio_device.unsafe_as(Proc(RTC_AUDIO_DEVICE, UInt8**, HRESULT)).call(endevice, pbstrdevicename)
  end
  def put_preferred_volume(endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_preferred_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32, HRESULT)).call(endevice, lvolume)
  end
  def get_preferred_volume(endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32*, HRESULT)).call(endevice, plvolume)
  end
  def put_preferred_aec(benable : Int16) : HRESULT
    @lpVtbl.value.put_preferred_aec.unsafe_as(Proc(Int16, HRESULT)).call(benable)
  end
  def get_preferred_aec(pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_preferred_aec.unsafe_as(Proc(Int16*, HRESULT)).call(pbenabled)
  end
  def put_preferred_video_device(bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_video_device.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdevicename)
  end
  def get_preferred_video_device(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_video_device.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_active_media(plmediatype : Int32*) : HRESULT
    @lpVtbl.value.get_active_media.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatype)
  end
  def put_max_bitrate(lmaxbitrate : Int32) : HRESULT
    @lpVtbl.value.put_max_bitrate.unsafe_as(Proc(Int32, HRESULT)).call(lmaxbitrate)
  end
  def get_max_bitrate(plmaxbitrate : Int32*) : HRESULT
    @lpVtbl.value.get_max_bitrate.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxbitrate)
  end
  def put_temporal_spatial_trade_off(lvalue : Int32) : HRESULT
    @lpVtbl.value.put_temporal_spatial_trade_off.unsafe_as(Proc(Int32, HRESULT)).call(lvalue)
  end
  def get_temporal_spatial_trade_off(plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_temporal_spatial_trade_off.unsafe_as(Proc(Int32*, HRESULT)).call(plvalue)
  end
  def get_network_quality(plnetworkquality : Int32*) : HRESULT
    @lpVtbl.value.get_network_quality.unsafe_as(Proc(Int32*, HRESULT)).call(plnetworkquality)
  end
  def start_t120_applet(enapplet : RTC_T120_APPLET) : HRESULT
    @lpVtbl.value.start_t120_applet.unsafe_as(Proc(RTC_T120_APPLET, HRESULT)).call(enapplet)
  end
  def stop_t120_applets : HRESULT
    @lpVtbl.value.stop_t120_applets.unsafe_as(Proc(HRESULT)).call
  end
  def get_is_t120_applet_running(enapplet : RTC_T120_APPLET, pfrunning : Int16*) : HRESULT
    @lpVtbl.value.get_is_t120_applet_running.unsafe_as(Proc(RTC_T120_APPLET, Int16*, HRESULT)).call(enapplet, pfrunning)
  end
  def get_local_user_uri(pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseruri)
  end
  def put_local_user_uri(bstruseruri : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstruseruri)
  end
  def get_local_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def put_local_user_name(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def play_ring(entype : RTC_RING_TYPE, bplay : Int16) : HRESULT
    @lpVtbl.value.play_ring.unsafe_as(Proc(RTC_RING_TYPE, Int16, HRESULT)).call(entype, bplay)
  end
  def send_dtmf(endtmf : RTC_DTMF) : HRESULT
    @lpVtbl.value.send_dtmf.unsafe_as(Proc(RTC_DTMF, HRESULT)).call(endtmf)
  end
  def invoke_tuning_wizard(hwndparent : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.invoke_tuning_wizard.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(hwndparent)
  end
  def get_is_tuned(pftuned : Int16*) : HRESULT
    @lpVtbl.value.get_is_tuned.unsafe_as(Proc(Int16*, HRESULT)).call(pftuned)
  end
end
struct LibWin32::IRTCClient2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HRESULT)).call
  end
  def shutdown : HRESULT
    @lpVtbl.value.shutdown.unsafe_as(Proc(HRESULT)).call
  end
  def prepare_for_shutdown : HRESULT
    @lpVtbl.value.prepare_for_shutdown.unsafe_as(Proc(HRESULT)).call
  end
  def put_event_filter(lfilter : Int32) : HRESULT
    @lpVtbl.value.put_event_filter.unsafe_as(Proc(Int32, HRESULT)).call(lfilter)
  end
  def get_event_filter(plfilter : Int32*) : HRESULT
    @lpVtbl.value.get_event_filter.unsafe_as(Proc(Int32*, HRESULT)).call(plfilter)
  end
  def set_preferred_media_types(lmediatypes : Int32, fpersistent : Int16) : HRESULT
    @lpVtbl.value.set_preferred_media_types.unsafe_as(Proc(Int32, Int16, HRESULT)).call(lmediatypes, fpersistent)
  end
  def get_preferred_media_types(plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_media_types.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatypes)
  end
  def get_media_capabilities(plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_media_capabilities.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatypes)
  end
  def create_session(entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.create_session.unsafe_as(Proc(RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, IRTCSession*, HRESULT)).call(entype, bstrlocalphoneuri, pprofile, lflags, ppsession)
  end
  def put_listen_for_incoming_sessions(enlisten : RTC_LISTEN_MODE) : HRESULT
    @lpVtbl.value.put_listen_for_incoming_sessions.unsafe_as(Proc(RTC_LISTEN_MODE, HRESULT)).call(enlisten)
  end
  def get_listen_for_incoming_sessions(penlisten : RTC_LISTEN_MODE*) : HRESULT
    @lpVtbl.value.get_listen_for_incoming_sessions.unsafe_as(Proc(RTC_LISTEN_MODE*, HRESULT)).call(penlisten)
  end
  def get_network_addresses(ftcp : Int16, fexternal : Int16, pvaddresses : VARIANT*) : HRESULT
    @lpVtbl.value.get_network_addresses.unsafe_as(Proc(Int16, Int16, VARIANT*, HRESULT)).call(ftcp, fexternal, pvaddresses)
  end
  def put_volume(endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32, HRESULT)).call(endevice, lvolume)
  end
  def get_volume(endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32*, HRESULT)).call(endevice, plvolume)
  end
  def put_audio_muted(endevice : RTC_AUDIO_DEVICE, fmuted : Int16) : HRESULT
    @lpVtbl.value.put_audio_muted.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int16, HRESULT)).call(endevice, fmuted)
  end
  def get_audio_muted(endevice : RTC_AUDIO_DEVICE, pfmuted : Int16*) : HRESULT
    @lpVtbl.value.get_audio_muted.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int16*, HRESULT)).call(endevice, pfmuted)
  end
  def get_i_video_window(endevice : RTC_VIDEO_DEVICE, ppivideowindow : IVideoWindow*) : HRESULT
    @lpVtbl.value.get_i_video_window.unsafe_as(Proc(RTC_VIDEO_DEVICE, IVideoWindow*, HRESULT)).call(endevice, ppivideowindow)
  end
  def put_preferred_audio_device(endevice : RTC_AUDIO_DEVICE, bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_audio_device.unsafe_as(Proc(RTC_AUDIO_DEVICE, UInt8*, HRESULT)).call(endevice, bstrdevicename)
  end
  def get_preferred_audio_device(endevice : RTC_AUDIO_DEVICE, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_audio_device.unsafe_as(Proc(RTC_AUDIO_DEVICE, UInt8**, HRESULT)).call(endevice, pbstrdevicename)
  end
  def put_preferred_volume(endevice : RTC_AUDIO_DEVICE, lvolume : Int32) : HRESULT
    @lpVtbl.value.put_preferred_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32, HRESULT)).call(endevice, lvolume)
  end
  def get_preferred_volume(endevice : RTC_AUDIO_DEVICE, plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_volume.unsafe_as(Proc(RTC_AUDIO_DEVICE, Int32*, HRESULT)).call(endevice, plvolume)
  end
  def put_preferred_aec(benable : Int16) : HRESULT
    @lpVtbl.value.put_preferred_aec.unsafe_as(Proc(Int16, HRESULT)).call(benable)
  end
  def get_preferred_aec(pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_preferred_aec.unsafe_as(Proc(Int16*, HRESULT)).call(pbenabled)
  end
  def put_preferred_video_device(bstrdevicename : UInt8*) : HRESULT
    @lpVtbl.value.put_preferred_video_device.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdevicename)
  end
  def get_preferred_video_device(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_preferred_video_device.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_active_media(plmediatype : Int32*) : HRESULT
    @lpVtbl.value.get_active_media.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatype)
  end
  def put_max_bitrate(lmaxbitrate : Int32) : HRESULT
    @lpVtbl.value.put_max_bitrate.unsafe_as(Proc(Int32, HRESULT)).call(lmaxbitrate)
  end
  def get_max_bitrate(plmaxbitrate : Int32*) : HRESULT
    @lpVtbl.value.get_max_bitrate.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxbitrate)
  end
  def put_temporal_spatial_trade_off(lvalue : Int32) : HRESULT
    @lpVtbl.value.put_temporal_spatial_trade_off.unsafe_as(Proc(Int32, HRESULT)).call(lvalue)
  end
  def get_temporal_spatial_trade_off(plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_temporal_spatial_trade_off.unsafe_as(Proc(Int32*, HRESULT)).call(plvalue)
  end
  def get_network_quality(plnetworkquality : Int32*) : HRESULT
    @lpVtbl.value.get_network_quality.unsafe_as(Proc(Int32*, HRESULT)).call(plnetworkquality)
  end
  def start_t120_applet(enapplet : RTC_T120_APPLET) : HRESULT
    @lpVtbl.value.start_t120_applet.unsafe_as(Proc(RTC_T120_APPLET, HRESULT)).call(enapplet)
  end
  def stop_t120_applets : HRESULT
    @lpVtbl.value.stop_t120_applets.unsafe_as(Proc(HRESULT)).call
  end
  def get_is_t120_applet_running(enapplet : RTC_T120_APPLET, pfrunning : Int16*) : HRESULT
    @lpVtbl.value.get_is_t120_applet_running.unsafe_as(Proc(RTC_T120_APPLET, Int16*, HRESULT)).call(enapplet, pfrunning)
  end
  def get_local_user_uri(pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseruri)
  end
  def put_local_user_uri(bstruseruri : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstruseruri)
  end
  def get_local_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def put_local_user_name(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def play_ring(entype : RTC_RING_TYPE, bplay : Int16) : HRESULT
    @lpVtbl.value.play_ring.unsafe_as(Proc(RTC_RING_TYPE, Int16, HRESULT)).call(entype, bplay)
  end
  def send_dtmf(endtmf : RTC_DTMF) : HRESULT
    @lpVtbl.value.send_dtmf.unsafe_as(Proc(RTC_DTMF, HRESULT)).call(endtmf)
  end
  def invoke_tuning_wizard(hwndparent : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.invoke_tuning_wizard.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(hwndparent)
  end
  def get_is_tuned(pftuned : Int16*) : HRESULT
    @lpVtbl.value.get_is_tuned.unsafe_as(Proc(Int16*, HRESULT)).call(pftuned)
  end
  def put_answer_mode(entype : RTC_SESSION_TYPE, enmode : RTC_ANSWER_MODE) : HRESULT
    @lpVtbl.value.put_answer_mode.unsafe_as(Proc(RTC_SESSION_TYPE, RTC_ANSWER_MODE, HRESULT)).call(entype, enmode)
  end
  def get_answer_mode(entype : RTC_SESSION_TYPE, penmode : RTC_ANSWER_MODE*) : HRESULT
    @lpVtbl.value.get_answer_mode.unsafe_as(Proc(RTC_SESSION_TYPE, RTC_ANSWER_MODE*, HRESULT)).call(entype, penmode)
  end
  def invoke_tuning_wizard_ex(hwndparent : LibC::IntPtrT, fallowaudio : Int16, fallowvideo : Int16) : HRESULT
    @lpVtbl.value.invoke_tuning_wizard_ex.unsafe_as(Proc(LibC::IntPtrT, Int16, Int16, HRESULT)).call(hwndparent, fallowaudio, fallowvideo)
  end
  def get_version(plversion : Int32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(Int32*, HRESULT)).call(plversion)
  end
  def put_client_name(bstrclientname : UInt8*) : HRESULT
    @lpVtbl.value.put_client_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrclientname)
  end
  def put_client_cur_ver(bstrclientcurver : UInt8*) : HRESULT
    @lpVtbl.value.put_client_cur_ver.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrclientcurver)
  end
  def initialize_ex(lflags : Int32) : HRESULT
    @lpVtbl.value.initialize_ex.unsafe_as(Proc(Int32, HRESULT)).call(lflags)
  end
  def create_session_with_description(bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppsession2 : IRTCSession2*) : HRESULT
    @lpVtbl.value.create_session_with_description.unsafe_as(Proc(UInt8*, UInt8*, IRTCProfile, Int32, IRTCSession2*, HRESULT)).call(bstrcontenttype, bstrsessiondescription, pprofile, lflags, ppsession2)
  end
  def set_session_description_manager(psessiondescriptionmanager : IRTCSessionDescriptionManager) : HRESULT
    @lpVtbl.value.set_session_description_manager.unsafe_as(Proc(IRTCSessionDescriptionManager, HRESULT)).call(psessiondescriptionmanager)
  end
  def put_preferred_security_level(ensecuritytype : RTC_SECURITY_TYPE, ensecuritylevel : RTC_SECURITY_LEVEL) : HRESULT
    @lpVtbl.value.put_preferred_security_level.unsafe_as(Proc(RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL, HRESULT)).call(ensecuritytype, ensecuritylevel)
  end
  def get_preferred_security_level(ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_preferred_security_level.unsafe_as(Proc(RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)).call(ensecuritytype, pensecuritylevel)
  end
  def put_allowed_ports(ltransport : Int32, enlistenmode : RTC_LISTEN_MODE) : HRESULT
    @lpVtbl.value.put_allowed_ports.unsafe_as(Proc(Int32, RTC_LISTEN_MODE, HRESULT)).call(ltransport, enlistenmode)
  end
  def get_allowed_ports(ltransport : Int32, penlistenmode : RTC_LISTEN_MODE*) : HRESULT
    @lpVtbl.value.get_allowed_ports.unsafe_as(Proc(Int32, RTC_LISTEN_MODE*, HRESULT)).call(ltransport, penlistenmode)
  end
end
struct LibWin32::IRTCClientPresence
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable_presence(fusestorage : Int16, varstorage : VARIANT) : HRESULT
    @lpVtbl.value.enable_presence.unsafe_as(Proc(Int16, VARIANT, HRESULT)).call(fusestorage, varstorage)
  end
  def export(varstorage : VARIANT) : HRESULT
    @lpVtbl.value.export.unsafe_as(Proc(VARIANT, HRESULT)).call(varstorage)
  end
  def import(varstorage : VARIANT, freplaceall : Int16) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(VARIANT, Int16, HRESULT)).call(varstorage, freplaceall)
  end
  def enumerate_buddies(ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.enumerate_buddies.unsafe_as(Proc(IRTCEnumBuddies*, HRESULT)).call(ppenum)
  end
  def get_buddies(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_buddies.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_buddy(bstrpresentityuri : UInt8*, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.unsafe_as(Proc(UInt8*, IRTCBuddy*, HRESULT)).call(bstrpresentityuri, ppbuddy)
  end
  def add_buddy(bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fpersistent : Int16, pprofile : IRTCProfile, lflags : Int32, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.add_buddy.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int16, IRTCProfile, Int32, IRTCBuddy*, HRESULT)).call(bstrpresentityuri, bstrusername, bstrdata, fpersistent, pprofile, lflags, ppbuddy)
  end
  def remove_buddy(pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.remove_buddy.unsafe_as(Proc(IRTCBuddy, HRESULT)).call(pbuddy)
  end
  def enumerate_watchers(ppenum : IRTCEnumWatchers*) : HRESULT
    @lpVtbl.value.enumerate_watchers.unsafe_as(Proc(IRTCEnumWatchers*, HRESULT)).call(ppenum)
  end
  def get_watchers(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_watchers.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_watcher(bstrpresentityuri : UInt8*, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.unsafe_as(Proc(UInt8*, IRTCWatcher*, HRESULT)).call(bstrpresentityuri, ppwatcher)
  end
  def add_watcher(bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fblocked : Int16, fpersistent : Int16, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.add_watcher.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int16, Int16, IRTCWatcher*, HRESULT)).call(bstrpresentityuri, bstrusername, bstrdata, fblocked, fpersistent, ppwatcher)
  end
  def remove_watcher(pwatcher : IRTCWatcher) : HRESULT
    @lpVtbl.value.remove_watcher.unsafe_as(Proc(IRTCWatcher, HRESULT)).call(pwatcher)
  end
  def set_local_presence_info(enstatus : RTC_PRESENCE_STATUS, bstrnotes : UInt8*) : HRESULT
    @lpVtbl.value.set_local_presence_info.unsafe_as(Proc(RTC_PRESENCE_STATUS, UInt8*, HRESULT)).call(enstatus, bstrnotes)
  end
  def get_offer_watcher_mode(penmode : RTC_OFFER_WATCHER_MODE*) : HRESULT
    @lpVtbl.value.get_offer_watcher_mode.unsafe_as(Proc(RTC_OFFER_WATCHER_MODE*, HRESULT)).call(penmode)
  end
  def put_offer_watcher_mode(enmode : RTC_OFFER_WATCHER_MODE) : HRESULT
    @lpVtbl.value.put_offer_watcher_mode.unsafe_as(Proc(RTC_OFFER_WATCHER_MODE, HRESULT)).call(enmode)
  end
  def get_privacy_mode(penmode : RTC_PRIVACY_MODE*) : HRESULT
    @lpVtbl.value.get_privacy_mode.unsafe_as(Proc(RTC_PRIVACY_MODE*, HRESULT)).call(penmode)
  end
  def put_privacy_mode(enmode : RTC_PRIVACY_MODE) : HRESULT
    @lpVtbl.value.put_privacy_mode.unsafe_as(Proc(RTC_PRIVACY_MODE, HRESULT)).call(enmode)
  end
end
struct LibWin32::IRTCClientPresence2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable_presence(fusestorage : Int16, varstorage : VARIANT) : HRESULT
    @lpVtbl.value.enable_presence.unsafe_as(Proc(Int16, VARIANT, HRESULT)).call(fusestorage, varstorage)
  end
  def export(varstorage : VARIANT) : HRESULT
    @lpVtbl.value.export.unsafe_as(Proc(VARIANT, HRESULT)).call(varstorage)
  end
  def import(varstorage : VARIANT, freplaceall : Int16) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(VARIANT, Int16, HRESULT)).call(varstorage, freplaceall)
  end
  def enumerate_buddies(ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.enumerate_buddies.unsafe_as(Proc(IRTCEnumBuddies*, HRESULT)).call(ppenum)
  end
  def get_buddies(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_buddies.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_buddy(bstrpresentityuri : UInt8*, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.unsafe_as(Proc(UInt8*, IRTCBuddy*, HRESULT)).call(bstrpresentityuri, ppbuddy)
  end
  def add_buddy(bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fpersistent : Int16, pprofile : IRTCProfile, lflags : Int32, ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.add_buddy.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int16, IRTCProfile, Int32, IRTCBuddy*, HRESULT)).call(bstrpresentityuri, bstrusername, bstrdata, fpersistent, pprofile, lflags, ppbuddy)
  end
  def remove_buddy(pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.remove_buddy.unsafe_as(Proc(IRTCBuddy, HRESULT)).call(pbuddy)
  end
  def enumerate_watchers(ppenum : IRTCEnumWatchers*) : HRESULT
    @lpVtbl.value.enumerate_watchers.unsafe_as(Proc(IRTCEnumWatchers*, HRESULT)).call(ppenum)
  end
  def get_watchers(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_watchers.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_watcher(bstrpresentityuri : UInt8*, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.unsafe_as(Proc(UInt8*, IRTCWatcher*, HRESULT)).call(bstrpresentityuri, ppwatcher)
  end
  def add_watcher(bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fblocked : Int16, fpersistent : Int16, ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.add_watcher.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int16, Int16, IRTCWatcher*, HRESULT)).call(bstrpresentityuri, bstrusername, bstrdata, fblocked, fpersistent, ppwatcher)
  end
  def remove_watcher(pwatcher : IRTCWatcher) : HRESULT
    @lpVtbl.value.remove_watcher.unsafe_as(Proc(IRTCWatcher, HRESULT)).call(pwatcher)
  end
  def set_local_presence_info(enstatus : RTC_PRESENCE_STATUS, bstrnotes : UInt8*) : HRESULT
    @lpVtbl.value.set_local_presence_info.unsafe_as(Proc(RTC_PRESENCE_STATUS, UInt8*, HRESULT)).call(enstatus, bstrnotes)
  end
  def get_offer_watcher_mode(penmode : RTC_OFFER_WATCHER_MODE*) : HRESULT
    @lpVtbl.value.get_offer_watcher_mode.unsafe_as(Proc(RTC_OFFER_WATCHER_MODE*, HRESULT)).call(penmode)
  end
  def put_offer_watcher_mode(enmode : RTC_OFFER_WATCHER_MODE) : HRESULT
    @lpVtbl.value.put_offer_watcher_mode.unsafe_as(Proc(RTC_OFFER_WATCHER_MODE, HRESULT)).call(enmode)
  end
  def get_privacy_mode(penmode : RTC_PRIVACY_MODE*) : HRESULT
    @lpVtbl.value.get_privacy_mode.unsafe_as(Proc(RTC_PRIVACY_MODE*, HRESULT)).call(penmode)
  end
  def put_privacy_mode(enmode : RTC_PRIVACY_MODE) : HRESULT
    @lpVtbl.value.put_privacy_mode.unsafe_as(Proc(RTC_PRIVACY_MODE, HRESULT)).call(enmode)
  end
  def enable_presence_ex(pprofile : IRTCProfile, varstorage : VARIANT, lflags : Int32) : HRESULT
    @lpVtbl.value.enable_presence_ex.unsafe_as(Proc(IRTCProfile, VARIANT, Int32, HRESULT)).call(pprofile, varstorage, lflags)
  end
  def disable_presence : HRESULT
    @lpVtbl.value.disable_presence.unsafe_as(Proc(HRESULT)).call
  end
  def add_group(bstrgroupname : UInt8*, bstrdata : UInt8*, pprofile : IRTCProfile, lflags : Int32, ppgroup : IRTCBuddyGroup*) : HRESULT
    @lpVtbl.value.add_group.unsafe_as(Proc(UInt8*, UInt8*, IRTCProfile, Int32, IRTCBuddyGroup*, HRESULT)).call(bstrgroupname, bstrdata, pprofile, lflags, ppgroup)
  end
  def remove_group(pgroup : IRTCBuddyGroup) : HRESULT
    @lpVtbl.value.remove_group.unsafe_as(Proc(IRTCBuddyGroup, HRESULT)).call(pgroup)
  end
  def enumerate_groups(ppenum : IRTCEnumGroups*) : HRESULT
    @lpVtbl.value.enumerate_groups.unsafe_as(Proc(IRTCEnumGroups*, HRESULT)).call(ppenum)
  end
  def get_groups(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_groups.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_group(bstrgroupname : UInt8*, ppgroup : IRTCBuddyGroup*) : HRESULT
    @lpVtbl.value.get_group.unsafe_as(Proc(UInt8*, IRTCBuddyGroup*, HRESULT)).call(bstrgroupname, ppgroup)
  end
  def add_watcher_ex(bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, enstate : RTC_WATCHER_STATE, fpersistent : Int16, enscope : RTC_ACE_SCOPE, pprofile : IRTCProfile, lflags : Int32, ppwatcher : IRTCWatcher2*) : HRESULT
    @lpVtbl.value.add_watcher_ex.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, RTC_WATCHER_STATE, Int16, RTC_ACE_SCOPE, IRTCProfile, Int32, IRTCWatcher2*, HRESULT)).call(bstrpresentityuri, bstrusername, bstrdata, enstate, fpersistent, enscope, pprofile, lflags, ppwatcher)
  end
  def get_watcher_ex(enmode : RTC_WATCHER_MATCH_MODE, bstrpresentityuri : UInt8*, ppwatcher : IRTCWatcher2*) : HRESULT
    @lpVtbl.value.get_watcher_ex.unsafe_as(Proc(RTC_WATCHER_MATCH_MODE, UInt8*, IRTCWatcher2*, HRESULT)).call(enmode, bstrpresentityuri, ppwatcher)
  end
  def put_presence_property(enproperty : RTC_PRESENCE_PROPERTY, bstrproperty : UInt8*) : HRESULT
    @lpVtbl.value.put_presence_property.unsafe_as(Proc(RTC_PRESENCE_PROPERTY, UInt8*, HRESULT)).call(enproperty, bstrproperty)
  end
  def get_presence_property(enproperty : RTC_PRESENCE_PROPERTY, pbstrproperty : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_property.unsafe_as(Proc(RTC_PRESENCE_PROPERTY, UInt8**, HRESULT)).call(enproperty, pbstrproperty)
  end
  def set_presence_data(bstrnamespace : UInt8*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.set_presence_data.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrnamespace, bstrdata)
  end
  def get_presence_data(pbstrnamespace : UInt8**, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_data.unsafe_as(Proc(UInt8**, UInt8**, HRESULT)).call(pbstrnamespace, pbstrdata)
  end
  def get_local_presence_info(penstatus : RTC_PRESENCE_STATUS*, pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_local_presence_info.unsafe_as(Proc(RTC_PRESENCE_STATUS*, UInt8**, HRESULT)).call(penstatus, pbstrnotes)
  end
  def add_buddy_ex(bstrpresentityuri : UInt8*, bstrusername : UInt8*, bstrdata : UInt8*, fpersistent : Int16, ensubscriptiontype : RTC_BUDDY_SUBSCRIPTION_TYPE, pprofile : IRTCProfile, lflags : Int32, ppbuddy : IRTCBuddy2*) : HRESULT
    @lpVtbl.value.add_buddy_ex.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int16, RTC_BUDDY_SUBSCRIPTION_TYPE, IRTCProfile, Int32, IRTCBuddy2*, HRESULT)).call(bstrpresentityuri, bstrusername, bstrdata, fpersistent, ensubscriptiontype, pprofile, lflags, ppbuddy)
  end
end
struct LibWin32::IRTCClientProvisioning
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_profile(bstrprofilexml : UInt8*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.create_profile.unsafe_as(Proc(UInt8*, IRTCProfile*, HRESULT)).call(bstrprofilexml, ppprofile)
  end
  def enable_profile(pprofile : IRTCProfile, lregisterflags : Int32) : HRESULT
    @lpVtbl.value.enable_profile.unsafe_as(Proc(IRTCProfile, Int32, HRESULT)).call(pprofile, lregisterflags)
  end
  def disable_profile(pprofile : IRTCProfile) : HRESULT
    @lpVtbl.value.disable_profile.unsafe_as(Proc(IRTCProfile, HRESULT)).call(pprofile)
  end
  def enumerate_profiles(ppenum : IRTCEnumProfiles*) : HRESULT
    @lpVtbl.value.enumerate_profiles.unsafe_as(Proc(IRTCEnumProfiles*, HRESULT)).call(ppenum)
  end
  def get_profiles(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_profiles.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_profile(bstruseraccount : UInt8*, bstruserpassword : UInt8*, bstruseruri : UInt8*, bstrserver : UInt8*, ltransport : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, Int32, LibC::IntPtrT, HRESULT)).call(bstruseraccount, bstruserpassword, bstruseruri, bstrserver, ltransport, lcookie)
  end
  def get_session_capabilities(plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.unsafe_as(Proc(Int32*, HRESULT)).call(plsupportedsessions)
  end
end
struct LibWin32::IRTCClientProvisioning2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_profile(bstrprofilexml : UInt8*, ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.create_profile.unsafe_as(Proc(UInt8*, IRTCProfile*, HRESULT)).call(bstrprofilexml, ppprofile)
  end
  def enable_profile(pprofile : IRTCProfile, lregisterflags : Int32) : HRESULT
    @lpVtbl.value.enable_profile.unsafe_as(Proc(IRTCProfile, Int32, HRESULT)).call(pprofile, lregisterflags)
  end
  def disable_profile(pprofile : IRTCProfile) : HRESULT
    @lpVtbl.value.disable_profile.unsafe_as(Proc(IRTCProfile, HRESULT)).call(pprofile)
  end
  def enumerate_profiles(ppenum : IRTCEnumProfiles*) : HRESULT
    @lpVtbl.value.enumerate_profiles.unsafe_as(Proc(IRTCEnumProfiles*, HRESULT)).call(ppenum)
  end
  def get_profiles(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_profiles.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_profile(bstruseraccount : UInt8*, bstruserpassword : UInt8*, bstruseruri : UInt8*, bstrserver : UInt8*, ltransport : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, Int32, LibC::IntPtrT, HRESULT)).call(bstruseraccount, bstruserpassword, bstruseruri, bstrserver, ltransport, lcookie)
  end
  def get_session_capabilities(plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.unsafe_as(Proc(Int32*, HRESULT)).call(plsupportedsessions)
  end
  def enable_profile_ex(pprofile : IRTCProfile, lregisterflags : Int32, lroamingflags : Int32) : HRESULT
    @lpVtbl.value.enable_profile_ex.unsafe_as(Proc(IRTCProfile, Int32, Int32, HRESULT)).call(pprofile, lregisterflags, lroamingflags)
  end
end
struct LibWin32::IRTCProfile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_key(pbstrkey : UInt8**) : HRESULT
    @lpVtbl.value.get_key.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrkey)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_xml(pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrxml)
  end
  def get_provider_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_provider_uri(enuri : RTC_PROVIDER_URI, pbstruri : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_uri.unsafe_as(Proc(RTC_PROVIDER_URI, UInt8**, HRESULT)).call(enuri, pbstruri)
  end
  def get_provider_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def get_client_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_client_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_client_banner(pfbanner : Int16*) : HRESULT
    @lpVtbl.value.get_client_banner.unsafe_as(Proc(Int16*, HRESULT)).call(pfbanner)
  end
  def get_client_min_ver(pbstrminver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_min_ver.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrminver)
  end
  def get_client_cur_ver(pbstrcurver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_cur_ver.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcurver)
  end
  def get_client_update_uri(pbstrupdateuri : UInt8**) : HRESULT
    @lpVtbl.value.get_client_update_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrupdateuri)
  end
  def get_client_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_client_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def get_user_uri(pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_user_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseruri)
  end
  def get_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def get_user_account(pbstruseraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseraccount)
  end
  def set_credentials(bstruseruri : UInt8*, bstruseraccount : UInt8*, bstrpassword : UInt8*) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstruseruri, bstruseraccount, bstrpassword)
  end
  def get_session_capabilities(plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.unsafe_as(Proc(Int32*, HRESULT)).call(plsupportedsessions)
  end
  def get_state(penstate : RTC_REGISTRATION_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_REGISTRATION_STATE*, HRESULT)).call(penstate)
  end
end
struct LibWin32::IRTCProfile2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_key(pbstrkey : UInt8**) : HRESULT
    @lpVtbl.value.get_key.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrkey)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_xml(pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrxml)
  end
  def get_provider_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_provider_uri(enuri : RTC_PROVIDER_URI, pbstruri : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_uri.unsafe_as(Proc(RTC_PROVIDER_URI, UInt8**, HRESULT)).call(enuri, pbstruri)
  end
  def get_provider_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_provider_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def get_client_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_client_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_client_banner(pfbanner : Int16*) : HRESULT
    @lpVtbl.value.get_client_banner.unsafe_as(Proc(Int16*, HRESULT)).call(pfbanner)
  end
  def get_client_min_ver(pbstrminver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_min_ver.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrminver)
  end
  def get_client_cur_ver(pbstrcurver : UInt8**) : HRESULT
    @lpVtbl.value.get_client_cur_ver.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcurver)
  end
  def get_client_update_uri(pbstrupdateuri : UInt8**) : HRESULT
    @lpVtbl.value.get_client_update_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrupdateuri)
  end
  def get_client_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_client_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def get_user_uri(pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_user_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseruri)
  end
  def get_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def get_user_account(pbstruseraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseraccount)
  end
  def set_credentials(bstruseruri : UInt8*, bstruseraccount : UInt8*, bstrpassword : UInt8*) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstruseruri, bstruseraccount, bstrpassword)
  end
  def get_session_capabilities(plsupportedsessions : Int32*) : HRESULT
    @lpVtbl.value.get_session_capabilities.unsafe_as(Proc(Int32*, HRESULT)).call(plsupportedsessions)
  end
  def get_state(penstate : RTC_REGISTRATION_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_REGISTRATION_STATE*, HRESULT)).call(penstate)
  end
  def get_realm(pbstrrealm : UInt8**) : HRESULT
    @lpVtbl.value.get_realm.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrealm)
  end
  def put_realm(bstrrealm : UInt8*) : HRESULT
    @lpVtbl.value.put_realm.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrrealm)
  end
  def get_allowed_auth(plallowedauth : Int32*) : HRESULT
    @lpVtbl.value.get_allowed_auth.unsafe_as(Proc(Int32*, HRESULT)).call(plallowedauth)
  end
  def put_allowed_auth(lallowedauth : Int32) : HRESULT
    @lpVtbl.value.put_allowed_auth.unsafe_as(Proc(Int32, HRESULT)).call(lallowedauth)
  end
end
struct LibWin32::IRTCSession
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client(ppclient : IRTCClient*) : HRESULT
    @lpVtbl.value.get_client.unsafe_as(Proc(IRTCClient*, HRESULT)).call(ppclient)
  end
  def get_state(penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_SESSION_STATE*, HRESULT)).call(penstate)
  end
  def get_type(pentype : RTC_SESSION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(RTC_SESSION_TYPE*, HRESULT)).call(pentype)
  end
  def get_profile(ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile*, HRESULT)).call(ppprofile)
  end
  def get_participants(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_participants.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def answer : HRESULT
    @lpVtbl.value.answer.unsafe_as(Proc(HRESULT)).call
  end
  def terminate(enreason : RTC_TERMINATE_REASON) : HRESULT
    @lpVtbl.value.terminate.unsafe_as(Proc(RTC_TERMINATE_REASON, HRESULT)).call(enreason)
  end
  def redirect(entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32) : HRESULT
    @lpVtbl.value.redirect.unsafe_as(Proc(RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, HRESULT)).call(entype, bstrlocalphoneuri, pprofile, lflags)
  end
  def add_participant(bstraddress : UInt8*, bstrname : UInt8*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.add_participant.unsafe_as(Proc(UInt8*, UInt8*, IRTCParticipant*, HRESULT)).call(bstraddress, bstrname, ppparticipant)
  end
  def remove_participant(pparticipant : IRTCParticipant) : HRESULT
    @lpVtbl.value.remove_participant.unsafe_as(Proc(IRTCParticipant, HRESULT)).call(pparticipant)
  end
  def enumerate_participants(ppenum : IRTCEnumParticipants*) : HRESULT
    @lpVtbl.value.enumerate_participants.unsafe_as(Proc(IRTCEnumParticipants*, HRESULT)).call(ppenum)
  end
  def get_can_add_participants(pfcanadd : Int16*) : HRESULT
    @lpVtbl.value.get_can_add_participants.unsafe_as(Proc(Int16*, HRESULT)).call(pfcanadd)
  end
  def get_redirected_user_uri(pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseruri)
  end
  def get_redirected_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def next_redirected_user : HRESULT
    @lpVtbl.value.next_redirected_user.unsafe_as(Proc(HRESULT)).call
  end
  def send_message(bstrmessageheader : UInt8*, bstrmessage : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message.unsafe_as(Proc(UInt8*, UInt8*, LibC::IntPtrT, HRESULT)).call(bstrmessageheader, bstrmessage, lcookie)
  end
  def send_message_status(enuserstatus : RTC_MESSAGING_USER_STATUS, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message_status.unsafe_as(Proc(RTC_MESSAGING_USER_STATUS, LibC::IntPtrT, HRESULT)).call(enuserstatus, lcookie)
  end
  def add_stream(lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(Int32, LibC::IntPtrT, HRESULT)).call(lmediatype, lcookie)
  end
  def remove_stream(lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(Int32, LibC::IntPtrT, HRESULT)).call(lmediatype, lcookie)
  end
  def put_encryption_key(lmediatype : Int32, encryptionkey : UInt8*) : HRESULT
    @lpVtbl.value.put_encryption_key.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(lmediatype, encryptionkey)
  end
end
struct LibWin32::IRTCSession2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client(ppclient : IRTCClient*) : HRESULT
    @lpVtbl.value.get_client.unsafe_as(Proc(IRTCClient*, HRESULT)).call(ppclient)
  end
  def get_state(penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_SESSION_STATE*, HRESULT)).call(penstate)
  end
  def get_type(pentype : RTC_SESSION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(RTC_SESSION_TYPE*, HRESULT)).call(pentype)
  end
  def get_profile(ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile*, HRESULT)).call(ppprofile)
  end
  def get_participants(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_participants.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def answer : HRESULT
    @lpVtbl.value.answer.unsafe_as(Proc(HRESULT)).call
  end
  def terminate(enreason : RTC_TERMINATE_REASON) : HRESULT
    @lpVtbl.value.terminate.unsafe_as(Proc(RTC_TERMINATE_REASON, HRESULT)).call(enreason)
  end
  def redirect(entype : RTC_SESSION_TYPE, bstrlocalphoneuri : UInt8*, pprofile : IRTCProfile, lflags : Int32) : HRESULT
    @lpVtbl.value.redirect.unsafe_as(Proc(RTC_SESSION_TYPE, UInt8*, IRTCProfile, Int32, HRESULT)).call(entype, bstrlocalphoneuri, pprofile, lflags)
  end
  def add_participant(bstraddress : UInt8*, bstrname : UInt8*, ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.add_participant.unsafe_as(Proc(UInt8*, UInt8*, IRTCParticipant*, HRESULT)).call(bstraddress, bstrname, ppparticipant)
  end
  def remove_participant(pparticipant : IRTCParticipant) : HRESULT
    @lpVtbl.value.remove_participant.unsafe_as(Proc(IRTCParticipant, HRESULT)).call(pparticipant)
  end
  def enumerate_participants(ppenum : IRTCEnumParticipants*) : HRESULT
    @lpVtbl.value.enumerate_participants.unsafe_as(Proc(IRTCEnumParticipants*, HRESULT)).call(ppenum)
  end
  def get_can_add_participants(pfcanadd : Int16*) : HRESULT
    @lpVtbl.value.get_can_add_participants.unsafe_as(Proc(Int16*, HRESULT)).call(pfcanadd)
  end
  def get_redirected_user_uri(pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseruri)
  end
  def get_redirected_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_redirected_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def next_redirected_user : HRESULT
    @lpVtbl.value.next_redirected_user.unsafe_as(Proc(HRESULT)).call
  end
  def send_message(bstrmessageheader : UInt8*, bstrmessage : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message.unsafe_as(Proc(UInt8*, UInt8*, LibC::IntPtrT, HRESULT)).call(bstrmessageheader, bstrmessage, lcookie)
  end
  def send_message_status(enuserstatus : RTC_MESSAGING_USER_STATUS, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_message_status.unsafe_as(Proc(RTC_MESSAGING_USER_STATUS, LibC::IntPtrT, HRESULT)).call(enuserstatus, lcookie)
  end
  def add_stream(lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(Int32, LibC::IntPtrT, HRESULT)).call(lmediatype, lcookie)
  end
  def remove_stream(lmediatype : Int32, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(Int32, LibC::IntPtrT, HRESULT)).call(lmediatype, lcookie)
  end
  def put_encryption_key(lmediatype : Int32, encryptionkey : UInt8*) : HRESULT
    @lpVtbl.value.put_encryption_key.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(lmediatype, encryptionkey)
  end
  def send_info(bstrinfoheader : UInt8*, bstrinfo : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.send_info.unsafe_as(Proc(UInt8*, UInt8*, LibC::IntPtrT, HRESULT)).call(bstrinfoheader, bstrinfo, lcookie)
  end
  def put_preferred_security_level(ensecuritytype : RTC_SECURITY_TYPE, ensecuritylevel : RTC_SECURITY_LEVEL) : HRESULT
    @lpVtbl.value.put_preferred_security_level.unsafe_as(Proc(RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL, HRESULT)).call(ensecuritytype, ensecuritylevel)
  end
  def get_preferred_security_level(ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_preferred_security_level.unsafe_as(Proc(RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)).call(ensecuritytype, pensecuritylevel)
  end
  def is_security_enabled(ensecuritytype : RTC_SECURITY_TYPE, pfsecurityenabled : Int16*) : HRESULT
    @lpVtbl.value.is_security_enabled.unsafe_as(Proc(RTC_SECURITY_TYPE, Int16*, HRESULT)).call(ensecuritytype, pfsecurityenabled)
  end
  def answer_with_session_description(bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*) : HRESULT
    @lpVtbl.value.answer_with_session_description.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrcontenttype, bstrsessiondescription)
  end
  def re_invite_with_session_description(bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.re_invite_with_session_description.unsafe_as(Proc(UInt8*, UInt8*, LibC::IntPtrT, HRESULT)).call(bstrcontenttype, bstrsessiondescription, lcookie)
  end
end
struct LibWin32::IRTCSessionCallControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def hold(lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.hold.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(lcookie)
  end
  def un_hold(lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.un_hold.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(lcookie)
  end
  def forward(bstrforwardtouri : UInt8*) : HRESULT
    @lpVtbl.value.forward.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrforwardtouri)
  end
  def refer(bstrrefertouri : UInt8*, bstrrefercookie : UInt8*) : HRESULT
    @lpVtbl.value.refer.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrrefertouri, bstrrefercookie)
  end
  def put_referred_by_uri(bstrreferredbyuri : UInt8*) : HRESULT
    @lpVtbl.value.put_referred_by_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrreferredbyuri)
  end
  def get_referred_by_uri(pbstrreferredbyuri : UInt8**) : HRESULT
    @lpVtbl.value.get_referred_by_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrreferredbyuri)
  end
  def put_refer_cookie(bstrrefercookie : UInt8*) : HRESULT
    @lpVtbl.value.put_refer_cookie.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrrefercookie)
  end
  def get_refer_cookie(pbstrrefercookie : UInt8**) : HRESULT
    @lpVtbl.value.get_refer_cookie.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrefercookie)
  end
  def get_is_referred(pfisreferred : Int16*) : HRESULT
    @lpVtbl.value.get_is_referred.unsafe_as(Proc(Int16*, HRESULT)).call(pfisreferred)
  end
end
struct LibWin32::IRTCParticipant
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_user_uri(pbstruseruri : UInt8**) : HRESULT
    @lpVtbl.value.get_user_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruseruri)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_removable(pfremovable : Int16*) : HRESULT
    @lpVtbl.value.get_removable.unsafe_as(Proc(Int16*, HRESULT)).call(pfremovable)
  end
  def get_state(penstate : RTC_PARTICIPANT_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_PARTICIPANT_STATE*, HRESULT)).call(penstate)
  end
  def get_session(ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession*, HRESULT)).call(ppsession)
  end
end
struct LibWin32::IRTCRoamingEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_type(peventtype : RTC_ROAMING_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_ROAMING_EVENT_TYPE*, HRESULT)).call(peventtype)
  end
  def get_profile(ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile2*, HRESULT)).call(ppprofile)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
end
struct LibWin32::IRTCProfileEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_profile(ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile*, HRESULT)).call(ppprofile)
  end
  def get_cookie(plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(plcookie)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
end
struct LibWin32::IRTCProfileEvent2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_profile(ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile*, HRESULT)).call(ppprofile)
  end
  def get_cookie(plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(plcookie)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_event_type(peventtype : RTC_PROFILE_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_PROFILE_EVENT_TYPE*, HRESULT)).call(peventtype)
  end
end
struct LibWin32::IRTCClientEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_type(peneventtype : RTC_CLIENT_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_CLIENT_EVENT_TYPE*, HRESULT)).call(peneventtype)
  end
  def get_client(ppclient : IRTCClient*) : HRESULT
    @lpVtbl.value.get_client.unsafe_as(Proc(IRTCClient*, HRESULT)).call(ppclient)
  end
end
struct LibWin32::IRTCRegistrationStateChangeEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_profile(ppprofile : IRTCProfile*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile*, HRESULT)).call(ppprofile)
  end
  def get_state(penstate : RTC_REGISTRATION_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_REGISTRATION_STATE*, HRESULT)).call(penstate)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionStateChangeEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession*, HRESULT)).call(ppsession)
  end
  def get_state(penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_SESSION_STATE*, HRESULT)).call(penstate)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionStateChangeEvent2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession*, HRESULT)).call(ppsession)
  end
  def get_state(penstate : RTC_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_SESSION_STATE*, HRESULT)).call(penstate)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
  def get_media_types(pmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_media_types.unsafe_as(Proc(Int32*, HRESULT)).call(pmediatypes)
  end
  def get_remote_preferred_security_level(ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_remote_preferred_security_level.unsafe_as(Proc(RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)).call(ensecuritytype, pensecuritylevel)
  end
  def get_is_forked(pfisforked : Int16*) : HRESULT
    @lpVtbl.value.get_is_forked.unsafe_as(Proc(Int16*, HRESULT)).call(pfisforked)
  end
  def get_remote_session_description(pbstrcontenttype : UInt8**, pbstrsessiondescription : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_session_description.unsafe_as(Proc(UInt8**, UInt8**, HRESULT)).call(pbstrcontenttype, pbstrsessiondescription)
  end
end
struct LibWin32::IRTCSessionOperationCompleteEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession*, HRESULT)).call(ppsession)
  end
  def get_cookie(plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(plcookie)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionOperationCompleteEvent2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession*, HRESULT)).call(ppsession)
  end
  def get_cookie(plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(plcookie)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
  def get_participant(ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.unsafe_as(Proc(IRTCParticipant*, HRESULT)).call(ppparticipant)
  end
  def get_remote_session_description(pbstrcontenttype : UInt8**, pbstrsessiondescription : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_session_description.unsafe_as(Proc(UInt8**, UInt8**, HRESULT)).call(pbstrcontenttype, pbstrsessiondescription)
  end
end
struct LibWin32::IRTCParticipantStateChangeEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_participant(ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.unsafe_as(Proc(IRTCParticipant*, HRESULT)).call(ppparticipant)
  end
  def get_state(penstate : RTC_PARTICIPANT_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_PARTICIPANT_STATE*, HRESULT)).call(penstate)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
end
struct LibWin32::IRTCMediaEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_media_type(pmediatype : Int32*) : HRESULT
    @lpVtbl.value.get_media_type.unsafe_as(Proc(Int32*, HRESULT)).call(pmediatype)
  end
  def get_event_type(peneventtype : RTC_MEDIA_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_MEDIA_EVENT_TYPE*, HRESULT)).call(peneventtype)
  end
  def get_event_reason(peneventreason : RTC_MEDIA_EVENT_REASON*) : HRESULT
    @lpVtbl.value.get_event_reason.unsafe_as(Proc(RTC_MEDIA_EVENT_REASON*, HRESULT)).call(peneventreason)
  end
end
struct LibWin32::IRTCIntensityEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_level(pllevel : Int32*) : HRESULT
    @lpVtbl.value.get_level.unsafe_as(Proc(Int32*, HRESULT)).call(pllevel)
  end
  def get_min(plmin : Int32*) : HRESULT
    @lpVtbl.value.get_min.unsafe_as(Proc(Int32*, HRESULT)).call(plmin)
  end
  def get_max(plmax : Int32*) : HRESULT
    @lpVtbl.value.get_max.unsafe_as(Proc(Int32*, HRESULT)).call(plmax)
  end
  def get_direction(pendirection : RTC_AUDIO_DEVICE*) : HRESULT
    @lpVtbl.value.get_direction.unsafe_as(Proc(RTC_AUDIO_DEVICE*, HRESULT)).call(pendirection)
  end
end
struct LibWin32::IRTCMessagingEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession*, HRESULT)).call(ppsession)
  end
  def get_participant(ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.unsafe_as(Proc(IRTCParticipant*, HRESULT)).call(ppparticipant)
  end
  def get_event_type(peneventtype : RTC_MESSAGING_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_MESSAGING_EVENT_TYPE*, HRESULT)).call(peneventtype)
  end
  def get_message(pbstrmessage : UInt8**) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmessage)
  end
  def get_message_header(pbstrmessageheader : UInt8**) : HRESULT
    @lpVtbl.value.get_message_header.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmessageheader)
  end
  def get_user_status(penuserstatus : RTC_MESSAGING_USER_STATUS*) : HRESULT
    @lpVtbl.value.get_user_status.unsafe_as(Proc(RTC_MESSAGING_USER_STATUS*, HRESULT)).call(penuserstatus)
  end
end
struct LibWin32::IRTCBuddyEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_buddy(ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.unsafe_as(Proc(IRTCBuddy*, HRESULT)).call(ppbuddy)
  end
end
struct LibWin32::IRTCBuddyEvent2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_buddy(ppbuddy : IRTCBuddy*) : HRESULT
    @lpVtbl.value.get_buddy.unsafe_as(Proc(IRTCBuddy*, HRESULT)).call(ppbuddy)
  end
  def get_event_type(peventtype : RTC_BUDDY_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_BUDDY_EVENT_TYPE*, HRESULT)).call(peventtype)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
end
struct LibWin32::IRTCWatcherEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_watcher(ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.unsafe_as(Proc(IRTCWatcher*, HRESULT)).call(ppwatcher)
  end
end
struct LibWin32::IRTCWatcherEvent2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_watcher(ppwatcher : IRTCWatcher*) : HRESULT
    @lpVtbl.value.get_watcher.unsafe_as(Proc(IRTCWatcher*, HRESULT)).call(ppwatcher)
  end
  def get_event_type(peventtype : RTC_WATCHER_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_WATCHER_EVENT_TYPE*, HRESULT)).call(peventtype)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
end
struct LibWin32::IRTCBuddyGroupEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_type(peventtype : RTC_GROUP_EVENT_TYPE*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(RTC_GROUP_EVENT_TYPE*, HRESULT)).call(peventtype)
  end
  def get_group(ppgroup : IRTCBuddyGroup*) : HRESULT
    @lpVtbl.value.get_group.unsafe_as(Proc(IRTCBuddyGroup*, HRESULT)).call(ppgroup)
  end
  def get_buddy(ppbuddy : IRTCBuddy2*) : HRESULT
    @lpVtbl.value.get_buddy.unsafe_as(Proc(IRTCBuddy2*, HRESULT)).call(ppbuddy)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
end
struct LibWin32::IRTCInfoEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession2*, HRESULT)).call(ppsession)
  end
  def get_participant(ppparticipant : IRTCParticipant*) : HRESULT
    @lpVtbl.value.get_participant.unsafe_as(Proc(IRTCParticipant*, HRESULT)).call(ppparticipant)
  end
  def get_info(pbstrinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrinfo)
  end
  def get_info_header(pbstrinfoheader : UInt8**) : HRESULT
    @lpVtbl.value.get_info_header.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrinfoheader)
  end
end
struct LibWin32::IRTCMediaRequestEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession2*, HRESULT)).call(ppsession)
  end
  def get_proposed_media(plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_proposed_media.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatypes)
  end
  def get_current_media(plmediatypes : Int32*) : HRESULT
    @lpVtbl.value.get_current_media.unsafe_as(Proc(Int32*, HRESULT)).call(plmediatypes)
  end
  def accept(lmediatypes : Int32) : HRESULT
    @lpVtbl.value.accept.unsafe_as(Proc(Int32, HRESULT)).call(lmediatypes)
  end
  def get_remote_preferred_security_level(ensecuritytype : RTC_SECURITY_TYPE, pensecuritylevel : RTC_SECURITY_LEVEL*) : HRESULT
    @lpVtbl.value.get_remote_preferred_security_level.unsafe_as(Proc(RTC_SECURITY_TYPE, RTC_SECURITY_LEVEL*, HRESULT)).call(ensecuritytype, pensecuritylevel)
  end
  def reject : HRESULT
    @lpVtbl.value.reject.unsafe_as(Proc(HRESULT)).call
  end
  def get_state(pstate : RTC_REINVITE_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_REINVITE_STATE*, HRESULT)).call(pstate)
  end
end
struct LibWin32::IRTCReInviteEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession2 : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession2*, HRESULT)).call(ppsession2)
  end
  def accept(bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*) : HRESULT
    @lpVtbl.value.accept.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrcontenttype, bstrsessiondescription)
  end
  def reject : HRESULT
    @lpVtbl.value.reject.unsafe_as(Proc(HRESULT)).call
  end
  def get_state(pstate : RTC_REINVITE_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_REINVITE_STATE*, HRESULT)).call(pstate)
  end
  def get_remote_session_description(pbstrcontenttype : UInt8**, pbstrsessiondescription : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_session_description.unsafe_as(Proc(UInt8**, UInt8**, HRESULT)).call(pbstrcontenttype, pbstrsessiondescription)
  end
end
struct LibWin32::IRTCPresencePropertyEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
  def get_presence_property(penpresprop : RTC_PRESENCE_PROPERTY*) : HRESULT
    @lpVtbl.value.get_presence_property.unsafe_as(Proc(RTC_PRESENCE_PROPERTY*, HRESULT)).call(penpresprop)
  end
  def get_value(pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrvalue)
  end
end
struct LibWin32::IRTCPresenceDataEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
  def get_presence_data(pbstrnamespace : UInt8**, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_data.unsafe_as(Proc(UInt8**, UInt8**, HRESULT)).call(pbstrnamespace, pbstrdata)
  end
end
struct LibWin32::IRTCPresenceStatusEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
  def get_local_presence_info(penstatus : RTC_PRESENCE_STATUS*, pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_local_presence_info.unsafe_as(Proc(RTC_PRESENCE_STATUS*, UInt8**, HRESULT)).call(penstatus, pbstrnotes)
  end
end
struct LibWin32::IRTCCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(lcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(lcount)
  end
  def get_item(index : Int32, pvariant : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(index, pvariant)
  end
  def get__new_enum(ppnewenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppnewenum)
  end
end
struct LibWin32::IRTCEnumParticipants
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppelements : IRTCParticipant*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRTCParticipant*, UInt32*, HRESULT)).call(celt, ppelements, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def clone(ppenum : IRTCEnumParticipants*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IRTCEnumParticipants*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRTCEnumProfiles
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppelements : IRTCProfile*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRTCProfile*, UInt32*, HRESULT)).call(celt, ppelements, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def clone(ppenum : IRTCEnumProfiles*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IRTCEnumProfiles*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRTCEnumBuddies
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppelements : IRTCBuddy*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRTCBuddy*, UInt32*, HRESULT)).call(celt, ppelements, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def clone(ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IRTCEnumBuddies*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRTCEnumWatchers
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppelements : IRTCWatcher*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRTCWatcher*, UInt32*, HRESULT)).call(celt, ppelements, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def clone(ppenum : IRTCEnumWatchers*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IRTCEnumWatchers*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRTCEnumGroups
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppelements : IRTCBuddyGroup*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRTCBuddyGroup*, UInt32*, HRESULT)).call(celt, ppelements, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def clone(ppenum : IRTCEnumGroups*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IRTCEnumGroups*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRTCPresenceContact
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_presentity_uri(pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpresentityuri)
  end
  def put_presentity_uri(bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpresentityuri)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def put_name(bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrname)
  end
  def get_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def put_data(bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdata)
  end
  def get_persistent(pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.unsafe_as(Proc(Int16*, HRESULT)).call(pfpersistent)
  end
  def put_persistent(fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.unsafe_as(Proc(Int16, HRESULT)).call(fpersistent)
  end
end
struct LibWin32::IRTCBuddy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_presentity_uri(pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpresentityuri)
  end
  def put_presentity_uri(bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpresentityuri)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def put_name(bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrname)
  end
  def get_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def put_data(bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdata)
  end
  def get_persistent(pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.unsafe_as(Proc(Int16*, HRESULT)).call(pfpersistent)
  end
  def put_persistent(fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.unsafe_as(Proc(Int16, HRESULT)).call(fpersistent)
  end
  def get_status(penstatus : RTC_PRESENCE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(RTC_PRESENCE_STATUS*, HRESULT)).call(penstatus)
  end
  def get_notes(pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrnotes)
  end
end
struct LibWin32::IRTCBuddy2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_presentity_uri(pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpresentityuri)
  end
  def put_presentity_uri(bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpresentityuri)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def put_name(bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrname)
  end
  def get_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def put_data(bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdata)
  end
  def get_persistent(pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.unsafe_as(Proc(Int16*, HRESULT)).call(pfpersistent)
  end
  def put_persistent(fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.unsafe_as(Proc(Int16, HRESULT)).call(fpersistent)
  end
  def get_status(penstatus : RTC_PRESENCE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(RTC_PRESENCE_STATUS*, HRESULT)).call(penstatus)
  end
  def get_notes(pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrnotes)
  end
  def get_profile(ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile2*, HRESULT)).call(ppprofile)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def enumerate_groups(ppenum : IRTCEnumGroups*) : HRESULT
    @lpVtbl.value.enumerate_groups.unsafe_as(Proc(IRTCEnumGroups*, HRESULT)).call(ppenum)
  end
  def get_groups(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_groups.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_presence_property(enproperty : RTC_PRESENCE_PROPERTY, pbstrproperty : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_property.unsafe_as(Proc(RTC_PRESENCE_PROPERTY, UInt8**, HRESULT)).call(enproperty, pbstrproperty)
  end
  def enumerate_presence_devices(ppenumdevices : IRTCEnumPresenceDevices*) : HRESULT
    @lpVtbl.value.enumerate_presence_devices.unsafe_as(Proc(IRTCEnumPresenceDevices*, HRESULT)).call(ppenumdevices)
  end
  def get_presence_devices(ppdevicescollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_presence_devices.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppdevicescollection)
  end
  def get_subscription_type(pensubscriptiontype : RTC_BUDDY_SUBSCRIPTION_TYPE*) : HRESULT
    @lpVtbl.value.get_subscription_type.unsafe_as(Proc(RTC_BUDDY_SUBSCRIPTION_TYPE*, HRESULT)).call(pensubscriptiontype)
  end
end
struct LibWin32::IRTCWatcher
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_presentity_uri(pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpresentityuri)
  end
  def put_presentity_uri(bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpresentityuri)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def put_name(bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrname)
  end
  def get_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def put_data(bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdata)
  end
  def get_persistent(pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.unsafe_as(Proc(Int16*, HRESULT)).call(pfpersistent)
  end
  def put_persistent(fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.unsafe_as(Proc(Int16, HRESULT)).call(fpersistent)
  end
  def get_state(penstate : RTC_WATCHER_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_WATCHER_STATE*, HRESULT)).call(penstate)
  end
  def put_state(enstate : RTC_WATCHER_STATE) : HRESULT
    @lpVtbl.value.put_state.unsafe_as(Proc(RTC_WATCHER_STATE, HRESULT)).call(enstate)
  end
end
struct LibWin32::IRTCWatcher2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_presentity_uri(pbstrpresentityuri : UInt8**) : HRESULT
    @lpVtbl.value.get_presentity_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpresentityuri)
  end
  def put_presentity_uri(bstrpresentityuri : UInt8*) : HRESULT
    @lpVtbl.value.put_presentity_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpresentityuri)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def put_name(bstrname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrname)
  end
  def get_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def put_data(bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdata)
  end
  def get_persistent(pfpersistent : Int16*) : HRESULT
    @lpVtbl.value.get_persistent.unsafe_as(Proc(Int16*, HRESULT)).call(pfpersistent)
  end
  def put_persistent(fpersistent : Int16) : HRESULT
    @lpVtbl.value.put_persistent.unsafe_as(Proc(Int16, HRESULT)).call(fpersistent)
  end
  def get_state(penstate : RTC_WATCHER_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RTC_WATCHER_STATE*, HRESULT)).call(penstate)
  end
  def put_state(enstate : RTC_WATCHER_STATE) : HRESULT
    @lpVtbl.value.put_state.unsafe_as(Proc(RTC_WATCHER_STATE, HRESULT)).call(enstate)
  end
  def get_profile(ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile2*, HRESULT)).call(ppprofile)
  end
  def get_scope(penscope : RTC_ACE_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.unsafe_as(Proc(RTC_ACE_SCOPE*, HRESULT)).call(penscope)
  end
end
struct LibWin32::IRTCBuddyGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pbstrgroupname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrgroupname)
  end
  def put_name(bstrgroupname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrgroupname)
  end
  def add_buddy(pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.add_buddy.unsafe_as(Proc(IRTCBuddy, HRESULT)).call(pbuddy)
  end
  def remove_buddy(pbuddy : IRTCBuddy) : HRESULT
    @lpVtbl.value.remove_buddy.unsafe_as(Proc(IRTCBuddy, HRESULT)).call(pbuddy)
  end
  def enumerate_buddies(ppenum : IRTCEnumBuddies*) : HRESULT
    @lpVtbl.value.enumerate_buddies.unsafe_as(Proc(IRTCEnumBuddies*, HRESULT)).call(ppenum)
  end
  def get_buddies(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_buddies.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_data(pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdata)
  end
  def put_data(bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdata)
  end
  def get_profile(ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile2*, HRESULT)).call(ppprofile)
  end
end
struct LibWin32::IRTCEventNotification
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def event(rtcevent : RTC_EVENT, pevent : IDispatch) : HRESULT
    @lpVtbl.value.event.unsafe_as(Proc(RTC_EVENT, IDispatch, HRESULT)).call(rtcevent, pevent)
  end
end
struct LibWin32::IRTCPortManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_mapping(bstrremoteaddress : UInt8*, enporttype : RTC_PORT_TYPE, pbstrinternallocaladdress : UInt8**, plinternallocalport : Int32*, pbstrexternallocaladdress : UInt8**, plexternallocalport : Int32*) : HRESULT
    @lpVtbl.value.get_mapping.unsafe_as(Proc(UInt8*, RTC_PORT_TYPE, UInt8**, Int32*, UInt8**, Int32*, HRESULT)).call(bstrremoteaddress, enporttype, pbstrinternallocaladdress, plinternallocalport, pbstrexternallocaladdress, plexternallocalport)
  end
  def update_remote_address(bstrremoteaddress : UInt8*, bstrinternallocaladdress : UInt8*, linternallocalport : Int32, bstrexternallocaladdress : UInt8*, lexternallocalport : Int32) : HRESULT
    @lpVtbl.value.update_remote_address.unsafe_as(Proc(UInt8*, UInt8*, Int32, UInt8*, Int32, HRESULT)).call(bstrremoteaddress, bstrinternallocaladdress, linternallocalport, bstrexternallocaladdress, lexternallocalport)
  end
  def release_mapping(bstrinternallocaladdress : UInt8*, linternallocalport : Int32, bstrexternallocaladdress : UInt8*, lexternallocaladdress : Int32) : HRESULT
    @lpVtbl.value.release_mapping.unsafe_as(Proc(UInt8*, Int32, UInt8*, Int32, HRESULT)).call(bstrinternallocaladdress, linternallocalport, bstrexternallocaladdress, lexternallocaladdress)
  end
end
struct LibWin32::IRTCSessionPortManagement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_port_manager(pportmanager : IRTCPortManager) : HRESULT
    @lpVtbl.value.set_port_manager.unsafe_as(Proc(IRTCPortManager, HRESULT)).call(pportmanager)
  end
end
struct LibWin32::IRTCClientPortManagement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_listen_address_and_port(bstrinternallocaladdress : UInt8*, linternallocalport : Int32) : HRESULT
    @lpVtbl.value.start_listen_address_and_port.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(bstrinternallocaladdress, linternallocalport)
  end
  def stop_listen_address_and_port(bstrinternallocaladdress : UInt8*, linternallocalport : Int32) : HRESULT
    @lpVtbl.value.stop_listen_address_and_port.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(bstrinternallocaladdress, linternallocalport)
  end
  def get_port_range(enporttype : RTC_PORT_TYPE, plminvalue : Int32*, plmaxvalue : Int32*) : HRESULT
    @lpVtbl.value.get_port_range.unsafe_as(Proc(RTC_PORT_TYPE, Int32*, Int32*, HRESULT)).call(enporttype, plminvalue, plmaxvalue)
  end
end
struct LibWin32::IRTCUserSearch
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_query(ppquery : IRTCUserSearchQuery*) : HRESULT
    @lpVtbl.value.create_query.unsafe_as(Proc(IRTCUserSearchQuery*, HRESULT)).call(ppquery)
  end
  def execute_search(pquery : IRTCUserSearchQuery, pprofile : IRTCProfile, lcookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.execute_search.unsafe_as(Proc(IRTCUserSearchQuery, IRTCProfile, LibC::IntPtrT, HRESULT)).call(pquery, pprofile, lcookie)
  end
end
struct LibWin32::IRTCUserSearchQuery
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def put_search_term(bstrname : UInt8*, bstrvalue : UInt8*) : HRESULT
    @lpVtbl.value.put_search_term.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrname, bstrvalue)
  end
  def get_search_term(bstrname : UInt8*, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_search_term.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(bstrname, pbstrvalue)
  end
  def get_search_terms(pbstrnames : UInt8**) : HRESULT
    @lpVtbl.value.get_search_terms.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrnames)
  end
  def put_search_preference(enpreference : RTC_USER_SEARCH_PREFERENCE, lvalue : Int32) : HRESULT
    @lpVtbl.value.put_search_preference.unsafe_as(Proc(RTC_USER_SEARCH_PREFERENCE, Int32, HRESULT)).call(enpreference, lvalue)
  end
  def get_search_preference(enpreference : RTC_USER_SEARCH_PREFERENCE, plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_search_preference.unsafe_as(Proc(RTC_USER_SEARCH_PREFERENCE, Int32*, HRESULT)).call(enpreference, plvalue)
  end
  def put_search_domain(bstrdomain : UInt8*) : HRESULT
    @lpVtbl.value.put_search_domain.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdomain)
  end
  def get_search_domain(pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_search_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdomain)
  end
end
struct LibWin32::IRTCUserSearchResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_value(encolumn : RTC_USER_SEARCH_COLUMN, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(RTC_USER_SEARCH_COLUMN, UInt8**, HRESULT)).call(encolumn, pbstrvalue)
  end
end
struct LibWin32::IRTCEnumUserSearchResults
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppelements : IRTCUserSearchResult*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRTCUserSearchResult*, UInt32*, HRESULT)).call(celt, ppelements, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def clone(ppenum : IRTCEnumUserSearchResults*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IRTCEnumUserSearchResults*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRTCUserSearchResultsEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def enumerate_results(ppenum : IRTCEnumUserSearchResults*) : HRESULT
    @lpVtbl.value.enumerate_results.unsafe_as(Proc(IRTCEnumUserSearchResults*, HRESULT)).call(ppenum)
  end
  def get_results(ppcollection : IRTCCollection*) : HRESULT
    @lpVtbl.value.get_results.unsafe_as(Proc(IRTCCollection*, HRESULT)).call(ppcollection)
  end
  def get_profile(ppprofile : IRTCProfile2*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(IRTCProfile2*, HRESULT)).call(ppprofile)
  end
  def get_query(ppquery : IRTCUserSearchQuery*) : HRESULT
    @lpVtbl.value.get_query.unsafe_as(Proc(IRTCUserSearchQuery*, HRESULT)).call(ppquery)
  end
  def get_cookie(plcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_cookie.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(plcookie)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_more_available(pfmoreavailable : Int16*) : HRESULT
    @lpVtbl.value.get_more_available.unsafe_as(Proc(Int16*, HRESULT)).call(pfmoreavailable)
  end
end
struct LibWin32::IRTCSessionReferStatusEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession2*, HRESULT)).call(ppsession)
  end
  def get_refer_status(penreferstatus : RTC_SESSION_REFER_STATUS*) : HRESULT
    @lpVtbl.value.get_refer_status.unsafe_as(Proc(RTC_SESSION_REFER_STATUS*, HRESULT)).call(penreferstatus)
  end
  def get_status_code(plstatuscode : Int32*) : HRESULT
    @lpVtbl.value.get_status_code.unsafe_as(Proc(Int32*, HRESULT)).call(plstatuscode)
  end
  def get_status_text(pbstrstatustext : UInt8**) : HRESULT
    @lpVtbl.value.get_status_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstatustext)
  end
end
struct LibWin32::IRTCSessionReferredEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_session(ppsession : IRTCSession2*) : HRESULT
    @lpVtbl.value.get_session.unsafe_as(Proc(IRTCSession2*, HRESULT)).call(ppsession)
  end
  def get_referred_by_uri(pbstrreferredbyuri : UInt8**) : HRESULT
    @lpVtbl.value.get_referred_by_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrreferredbyuri)
  end
  def get_refer_to_uri(pbstrreferouri : UInt8**) : HRESULT
    @lpVtbl.value.get_refer_to_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrreferouri)
  end
  def get_refer_cookie(pbstrrefercookie : UInt8**) : HRESULT
    @lpVtbl.value.get_refer_cookie.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrefercookie)
  end
  def accept : HRESULT
    @lpVtbl.value.accept.unsafe_as(Proc(HRESULT)).call
  end
  def reject : HRESULT
    @lpVtbl.value.reject.unsafe_as(Proc(HRESULT)).call
  end
  def set_referred_session_state(enstate : RTC_SESSION_STATE) : HRESULT
    @lpVtbl.value.set_referred_session_state.unsafe_as(Proc(RTC_SESSION_STATE, HRESULT)).call(enstate)
  end
end
struct LibWin32::IRTCSessionDescriptionManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def evaluate_session_description(bstrcontenttype : UInt8*, bstrsessiondescription : UInt8*, pfapplicationsession : Int16*) : HRESULT
    @lpVtbl.value.evaluate_session_description.unsafe_as(Proc(UInt8*, UInt8*, Int16*, HRESULT)).call(bstrcontenttype, bstrsessiondescription, pfapplicationsession)
  end
end
struct LibWin32::IRTCEnumPresenceDevices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppelements : IRTCPresenceDevice*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRTCPresenceDevice*, UInt32*, HRESULT)).call(celt, ppelements, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def clone(ppenum : IRTCEnumPresenceDevices*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IRTCEnumPresenceDevices*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRTCPresenceDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_status(penstatus : RTC_PRESENCE_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(RTC_PRESENCE_STATUS*, HRESULT)).call(penstatus)
  end
  def get_notes(pbstrnotes : UInt8**) : HRESULT
    @lpVtbl.value.get_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrnotes)
  end
  def get_presence_property(enproperty : RTC_PRESENCE_PROPERTY, pbstrproperty : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_property.unsafe_as(Proc(RTC_PRESENCE_PROPERTY, UInt8**, HRESULT)).call(enproperty, pbstrproperty)
  end
  def get_presence_data(pbstrnamespace : UInt8**, pbstrdata : UInt8**) : HRESULT
    @lpVtbl.value.get_presence_data.unsafe_as(Proc(UInt8**, UInt8**, HRESULT)).call(pbstrnamespace, pbstrdata)
  end
end
struct LibWin32::IRTCDispatchEventNotification
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ITransportSettingsInternal
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def apply_setting(setting : TRANSPORT_SETTING*) : HRESULT
    @lpVtbl.value.apply_setting.unsafe_as(Proc(TRANSPORT_SETTING*, HRESULT)).call(setting)
  end
  def query_setting(setting : TRANSPORT_SETTING*) : HRESULT
    @lpVtbl.value.query_setting.unsafe_as(Proc(TRANSPORT_SETTING*, HRESULT)).call(setting)
  end
end
struct LibWin32::INetworkTransportSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def apply_setting(settingid : TRANSPORT_SETTING_ID*, lengthin : UInt32, valuein : UInt8*, lengthout : UInt32*, valueout : UInt8**) : HRESULT
    @lpVtbl.value.apply_setting.unsafe_as(Proc(TRANSPORT_SETTING_ID*, UInt32, UInt8*, UInt32*, UInt8**, HRESULT)).call(settingid, lengthin, valuein, lengthout, valueout)
  end
  def query_setting(settingid : TRANSPORT_SETTING_ID*, lengthin : UInt32, valuein : UInt8*, lengthout : UInt32*, valueout : UInt8**) : HRESULT
    @lpVtbl.value.query_setting.unsafe_as(Proc(TRANSPORT_SETTING_ID*, UInt32, UInt8*, UInt32*, UInt8**, HRESULT)).call(settingid, lengthin, valuein, lengthout, valueout)
  end
end
struct LibWin32::INotificationTransportSync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def complete_delivery : HRESULT
    @lpVtbl.value.complete_delivery.unsafe_as(Proc(HRESULT)).call
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
end
