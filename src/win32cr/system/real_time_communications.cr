require "./com.cr"
require "./../foundation.cr"
require "./../media/direct_show.cr"
require "./../networking/win_sock.cr"

module Win32cr::System::RealTimeCommunications
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

  enum RTC_AUDIO_DEVICE
    RTCAD_SPEAKER = 0_i32
    RTCAD_MICROPHONE = 1_i32
  end
  enum RTC_VIDEO_DEVICE
    RTCVD_RECEIVE = 0_i32
    RTCVD_PREVIEW = 1_i32
  end
  enum RTC_EVENT
    RTCE_CLIENT = 0_i32
    RTCE_REGISTRATION_STATE_CHANGE = 1_i32
    RTCE_SESSION_STATE_CHANGE = 2_i32
    RTCE_SESSION_OPERATION_COMPLETE = 3_i32
    RTCE_PARTICIPANT_STATE_CHANGE = 4_i32
    RTCE_MEDIA = 5_i32
    RTCE_INTENSITY = 6_i32
    RTCE_MESSAGING = 7_i32
    RTCE_BUDDY = 8_i32
    RTCE_WATCHER = 9_i32
    RTCE_PROFILE = 10_i32
    RTCE_USERSEARCH = 11_i32
    RTCE_INFO = 12_i32
    RTCE_GROUP = 13_i32
    RTCE_MEDIA_REQUEST = 14_i32
    RTCE_ROAMING = 15_i32
    RTCE_PRESENCE_PROPERTY = 16_i32
    RTCE_PRESENCE_DATA = 17_i32
    RTCE_PRESENCE_STATUS = 18_i32
    RTCE_SESSION_REFER_STATUS = 19_i32
    RTCE_SESSION_REFERRED = 20_i32
    RTCE_REINVITE = 21_i32
  end
  enum RTC_LISTEN_MODE
    RTCLM_NONE = 0_i32
    RTCLM_DYNAMIC = 1_i32
    RTCLM_BOTH = 2_i32
  end
  enum RTC_CLIENT_EVENT_TYPE
    RTCCET_VOLUME_CHANGE = 0_i32
    RTCCET_DEVICE_CHANGE = 1_i32
    RTCCET_NETWORK_QUALITY_CHANGE = 2_i32
    RTCCET_ASYNC_CLEANUP_DONE = 3_i32
  end
  enum RTC_BUDDY_EVENT_TYPE
    RTCBET_BUDDY_ADD = 0_i32
    RTCBET_BUDDY_REMOVE = 1_i32
    RTCBET_BUDDY_UPDATE = 2_i32
    RTCBET_BUDDY_STATE_CHANGE = 3_i32
    RTCBET_BUDDY_ROAMED = 4_i32
    RTCBET_BUDDY_SUBSCRIBED = 5_i32
  end
  enum RTC_WATCHER_EVENT_TYPE
    RTCWET_WATCHER_ADD = 0_i32
    RTCWET_WATCHER_REMOVE = 1_i32
    RTCWET_WATCHER_UPDATE = 2_i32
    RTCWET_WATCHER_OFFERING = 3_i32
    RTCWET_WATCHER_ROAMED = 4_i32
  end
  enum RTC_GROUP_EVENT_TYPE
    RTCGET_GROUP_ADD = 0_i32
    RTCGET_GROUP_REMOVE = 1_i32
    RTCGET_GROUP_UPDATE = 2_i32
    RTCGET_GROUP_BUDDY_ADD = 3_i32
    RTCGET_GROUP_BUDDY_REMOVE = 4_i32
    RTCGET_GROUP_ROAMED = 5_i32
  end
  enum RTC_TERMINATE_REASON
    RTCTR_NORMAL = 0_i32
    RTCTR_DND = 1_i32
    RTCTR_BUSY = 2_i32
    RTCTR_REJECT = 3_i32
    RTCTR_TIMEOUT = 4_i32
    RTCTR_SHUTDOWN = 5_i32
    RTCTR_INSUFFICIENT_SECURITY_LEVEL = 6_i32
    RTCTR_NOT_SUPPORTED = 7_i32
  end
  enum RTC_REGISTRATION_STATE
    RTCRS_NOT_REGISTERED = 0_i32
    RTCRS_REGISTERING = 1_i32
    RTCRS_REGISTERED = 2_i32
    RTCRS_REJECTED = 3_i32
    RTCRS_UNREGISTERING = 4_i32
    RTCRS_ERROR = 5_i32
    RTCRS_LOGGED_OFF = 6_i32
    RTCRS_LOCAL_PA_LOGGED_OFF = 7_i32
    RTCRS_REMOTE_PA_LOGGED_OFF = 8_i32
  end
  enum RTC_SESSION_STATE
    RTCSS_IDLE = 0_i32
    RTCSS_INCOMING = 1_i32
    RTCSS_ANSWERING = 2_i32
    RTCSS_INPROGRESS = 3_i32
    RTCSS_CONNECTED = 4_i32
    RTCSS_DISCONNECTED = 5_i32
    RTCSS_HOLD = 6_i32
    RTCSS_REFER = 7_i32
  end
  enum RTC_PARTICIPANT_STATE
    RTCPS_IDLE = 0_i32
    RTCPS_PENDING = 1_i32
    RTCPS_INCOMING = 2_i32
    RTCPS_ANSWERING = 3_i32
    RTCPS_INPROGRESS = 4_i32
    RTCPS_ALERTING = 5_i32
    RTCPS_CONNECTED = 6_i32
    RTCPS_DISCONNECTING = 7_i32
    RTCPS_DISCONNECTED = 8_i32
  end
  enum RTC_WATCHER_STATE
    RTCWS_UNKNOWN = 0_i32
    RTCWS_OFFERING = 1_i32
    RTCWS_ALLOWED = 2_i32
    RTCWS_BLOCKED = 3_i32
    RTCWS_DENIED = 4_i32
    RTCWS_PROMPT = 5_i32
  end
  enum RTC_ACE_SCOPE
    RTCAS_SCOPE_USER = 0_i32
    RTCAS_SCOPE_DOMAIN = 1_i32
    RTCAS_SCOPE_ALL = 2_i32
  end
  enum RTC_OFFER_WATCHER_MODE
    RTCOWM_OFFER_WATCHER_EVENT = 0_i32
    RTCOWM_AUTOMATICALLY_ADD_WATCHER = 1_i32
  end
  enum RTC_WATCHER_MATCH_MODE
    RTCWMM_EXACT_MATCH = 0_i32
    RTCWMM_BEST_ACE_MATCH = 1_i32
  end
  enum RTC_PRIVACY_MODE
    RTCPM_BLOCK_LIST_EXCLUDED = 0_i32
    RTCPM_ALLOW_LIST_ONLY = 1_i32
  end
  enum RTC_SESSION_TYPE
    RTCST_PC_TO_PC = 0_i32
    RTCST_PC_TO_PHONE = 1_i32
    RTCST_PHONE_TO_PHONE = 2_i32
    RTCST_IM = 3_i32
    RTCST_MULTIPARTY_IM = 4_i32
    RTCST_APPLICATION = 5_i32
  end
  enum RTC_PRESENCE_STATUS
    RTCXS_PRESENCE_OFFLINE = 0_i32
    RTCXS_PRESENCE_ONLINE = 1_i32
    RTCXS_PRESENCE_AWAY = 2_i32
    RTCXS_PRESENCE_IDLE = 3_i32
    RTCXS_PRESENCE_BUSY = 4_i32
    RTCXS_PRESENCE_BE_RIGHT_BACK = 5_i32
    RTCXS_PRESENCE_ON_THE_PHONE = 6_i32
    RTCXS_PRESENCE_OUT_TO_LUNCH = 7_i32
  end
  enum RTC_BUDDY_SUBSCRIPTION_TYPE
    RTCBT_SUBSCRIBED = 0_i32
    RTCBT_ALWAYS_OFFLINE = 1_i32
    RTCBT_ALWAYS_ONLINE = 2_i32
    RTCBT_POLL = 3_i32
  end
  enum RTC_MEDIA_EVENT_TYPE
    RTCMET_STOPPED = 0_i32
    RTCMET_STARTED = 1_i32
    RTCMET_FAILED = 2_i32
  end
  enum RTC_MEDIA_EVENT_REASON
    RTCMER_NORMAL = 0_i32
    RTCMER_HOLD = 1_i32
    RTCMER_TIMEOUT = 2_i32
    RTCMER_BAD_DEVICE = 3_i32
    RTCMER_NO_PORT = 4_i32
    RTCMER_PORT_MAPPING_FAILED = 5_i32
    RTCMER_REMOTE_REQUEST = 6_i32
  end
  enum RTC_MESSAGING_EVENT_TYPE
    RTCMSET_MESSAGE = 0_i32
    RTCMSET_STATUS = 1_i32
  end
  enum RTC_MESSAGING_USER_STATUS
    RTCMUS_IDLE = 0_i32
    RTCMUS_TYPING = 1_i32
  end
  enum RTC_DTMF
    RTC_DTMF_0 = 0_i32
    RTC_DTMF_1 = 1_i32
    RTC_DTMF_2 = 2_i32
    RTC_DTMF_3 = 3_i32
    RTC_DTMF_4 = 4_i32
    RTC_DTMF_5 = 5_i32
    RTC_DTMF_6 = 6_i32
    RTC_DTMF_7 = 7_i32
    RTC_DTMF_8 = 8_i32
    RTC_DTMF_9 = 9_i32
    RTC_DTMF_STAR = 10_i32
    RTC_DTMF_POUND = 11_i32
    RTC_DTMF_A = 12_i32
    RTC_DTMF_B = 13_i32
    RTC_DTMF_C = 14_i32
    RTC_DTMF_D = 15_i32
    RTC_DTMF_FLASH = 16_i32
  end
  enum RTC_PROVIDER_URI
    RTCPU_URIHOMEPAGE = 0_i32
    RTCPU_URIHELPDESK = 1_i32
    RTCPU_URIPERSONALACCOUNT = 2_i32
    RTCPU_URIDISPLAYDURINGCALL = 3_i32
    RTCPU_URIDISPLAYDURINGIDLE = 4_i32
  end
  enum RTC_RING_TYPE
    RTCRT_PHONE = 0_i32
    RTCRT_MESSAGE = 1_i32
    RTCRT_RINGBACK = 2_i32
  end
  enum RTC_T120_APPLET
    RTCTA_WHITEBOARD = 0_i32
    RTCTA_APPSHARING = 1_i32
  end
  enum RTC_PORT_TYPE
    RTCPT_AUDIO_RTP = 0_i32
    RTCPT_AUDIO_RTCP = 1_i32
    RTCPT_VIDEO_RTP = 2_i32
    RTCPT_VIDEO_RTCP = 3_i32
    RTCPT_SIP = 4_i32
  end
  enum RTC_USER_SEARCH_COLUMN
    RTCUSC_URI = 0_i32
    RTCUSC_DISPLAYNAME = 1_i32
    RTCUSC_TITLE = 2_i32
    RTCUSC_OFFICE = 3_i32
    RTCUSC_PHONE = 4_i32
    RTCUSC_COMPANY = 5_i32
    RTCUSC_CITY = 6_i32
    RTCUSC_STATE = 7_i32
    RTCUSC_COUNTRY = 8_i32
    RTCUSC_EMAIL = 9_i32
  end
  enum RTC_USER_SEARCH_PREFERENCE
    RTCUSP_MAX_MATCHES = 0_i32
    RTCUSP_TIME_LIMIT = 1_i32
  end
  enum RTC_ROAMING_EVENT_TYPE
    RTCRET_BUDDY_ROAMING = 0_i32
    RTCRET_WATCHER_ROAMING = 1_i32
    RTCRET_PRESENCE_ROAMING = 2_i32
    RTCRET_PROFILE_ROAMING = 3_i32
    RTCRET_WPENDING_ROAMING = 4_i32
  end
  enum RTC_PROFILE_EVENT_TYPE
    RTCPFET_PROFILE_GET = 0_i32
    RTCPFET_PROFILE_UPDATE = 1_i32
  end
  enum RTC_ANSWER_MODE
    RTCAM_OFFER_SESSION_EVENT = 0_i32
    RTCAM_AUTOMATICALLY_ACCEPT = 1_i32
    RTCAM_AUTOMATICALLY_REJECT = 2_i32
    RTCAM_NOT_SUPPORTED = 3_i32
  end
  enum RTC_SESSION_REFER_STATUS
    RTCSRS_REFERRING = 0_i32
    RTCSRS_ACCEPTED = 1_i32
    RTCSRS_ERROR = 2_i32
    RTCSRS_REJECTED = 3_i32
    RTCSRS_DROPPED = 4_i32
    RTCSRS_DONE = 5_i32
  end
  enum RTC_PRESENCE_PROPERTY
    RTCPP_PHONENUMBER = 0_i32
    RTCPP_DISPLAYNAME = 1_i32
    RTCPP_EMAIL = 2_i32
    RTCPP_DEVICE_NAME = 3_i32
    RTCPP_MULTIPLE = 4_i32
  end
  enum RTC_SECURITY_TYPE
    RTCSECT_AUDIO_VIDEO_MEDIA_ENCRYPTION = 0_i32
    RTCSECT_T120_MEDIA_ENCRYPTION = 1_i32
  end
  enum RTC_SECURITY_LEVEL
    RTCSECL_UNSUPPORTED = 1_i32
    RTCSECL_SUPPORTED = 2_i32
    RTCSECL_REQUIRED = 3_i32
  end
  enum RTC_REINVITE_STATE
    RTCRIN_INCOMING = 0_i32
    RTCRIN_SUCCEEDED = 1_i32
    RTCRIN_FAIL = 2_i32
  end

  @[Extern]
  struct TRANSPORT_SETTING
    property setting_id : Win32cr::Networking::WinSock::TRANSPORT_SETTING_ID
    property length : UInt32*
    property value : UInt8*
    def initialize(@setting_id : Win32cr::Networking::WinSock::TRANSPORT_SETTING_ID, @length : UInt32*, @value : UInt8*)
    end
  end

  @[Extern]
  record IRTCClientVtbl,
    query_interface : Proc(IRTCClient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClient*, UInt32),
    release : Proc(IRTCClient*, UInt32),
    initialize__ : Proc(IRTCClient*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IRTCClient*, Win32cr::Foundation::HRESULT),
    prepare_for_shutdown : Proc(IRTCClient*, Win32cr::Foundation::HRESULT),
    put_EventFilter : Proc(IRTCClient*, Int32, Win32cr::Foundation::HRESULT),
    get_EventFilter : Proc(IRTCClient*, Int32*, Win32cr::Foundation::HRESULT),
    set_preferred_media_types : Proc(IRTCClient*, Int32, Int16, Win32cr::Foundation::HRESULT),
    get_PreferredMediaTypes : Proc(IRTCClient*, Int32*, Win32cr::Foundation::HRESULT),
    get_MediaCapabilities : Proc(IRTCClient*, Int32*, Win32cr::Foundation::HRESULT),
    create_session : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, Win32cr::Foundation::BSTR, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    put_ListenForIncomingSessions : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE, Win32cr::Foundation::HRESULT),
    get_ListenForIncomingSessions : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE*, Win32cr::Foundation::HRESULT),
    get_NetworkAddresses : Proc(IRTCClient*, Int16, Int16, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Volume : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32, Win32cr::Foundation::HRESULT),
    get_Volume : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32*, Win32cr::Foundation::HRESULT),
    put_AudioMuted : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int16, Win32cr::Foundation::HRESULT),
    get_AudioMuted : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int16*, Win32cr::Foundation::HRESULT),
    get_IVideoWindow : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_VIDEO_DEVICE, Void**, Win32cr::Foundation::HRESULT),
    put_PreferredAudioDevice : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PreferredAudioDevice : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PreferredVolume : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32, Win32cr::Foundation::HRESULT),
    get_PreferredVolume : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32*, Win32cr::Foundation::HRESULT),
    put_PreferredAEC : Proc(IRTCClient*, Int16, Win32cr::Foundation::HRESULT),
    get_PreferredAEC : Proc(IRTCClient*, Int16*, Win32cr::Foundation::HRESULT),
    put_PreferredVideoDevice : Proc(IRTCClient*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PreferredVideoDevice : Proc(IRTCClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ActiveMedia : Proc(IRTCClient*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxBitrate : Proc(IRTCClient*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxBitrate : Proc(IRTCClient*, Int32*, Win32cr::Foundation::HRESULT),
    put_TemporalSpatialTradeOff : Proc(IRTCClient*, Int32, Win32cr::Foundation::HRESULT),
    get_TemporalSpatialTradeOff : Proc(IRTCClient*, Int32*, Win32cr::Foundation::HRESULT),
    get_NetworkQuality : Proc(IRTCClient*, Int32*, Win32cr::Foundation::HRESULT),
    start_t120_applet : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_T120_APPLET, Win32cr::Foundation::HRESULT),
    stop_t120_applets : Proc(IRTCClient*, Win32cr::Foundation::HRESULT),
    get_IsT120AppletRunning : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_T120_APPLET, Int16*, Win32cr::Foundation::HRESULT),
    get_LocalUserURI : Proc(IRTCClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalUserURI : Proc(IRTCClient*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LocalUserName : Proc(IRTCClient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalUserName : Proc(IRTCClient*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    play_ring : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_RING_TYPE, Int16, Win32cr::Foundation::HRESULT),
    send_dtmf : Proc(IRTCClient*, Win32cr::System::RealTimeCommunications::RTC_DTMF, Win32cr::Foundation::HRESULT),
    invoke_tuning_wizard : Proc(IRTCClient*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_IsTuned : Proc(IRTCClient*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClient, lpVtbl : IRTCClientVtbl* do
    GUID = LibC::GUID.new(0x7829e45_u32, 0x9a34_u16, 0x408e_u16, StaticArray[0xa0_u8, 0x11_u8, 0xbd_u8, 0xdf_u8, 0x13_u8, 0x48_u8, 0x7c_u8, 0xd1_u8])
    def query_interface(this : IRTCClient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IRTCClient*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this)
    end
    def shutdown(this : IRTCClient*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def prepare_for_shutdown(this : IRTCClient*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_for_shutdown.call(this)
    end
    def put_EventFilter(this : IRTCClient*, lFilter : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventFilter.call(this, lFilter)
    end
    def get_EventFilter(this : IRTCClient*, plFilter : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventFilter.call(this, plFilter)
    end
    def set_preferred_media_types(this : IRTCClient*, lMediaTypes : Int32, fPersistent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preferred_media_types.call(this, lMediaTypes, fPersistent)
    end
    def get_PreferredMediaTypes(this : IRTCClient*, plMediaTypes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredMediaTypes.call(this, plMediaTypes)
    end
    def get_MediaCapabilities(this : IRTCClient*, plMediaTypes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MediaCapabilities.call(this, plMediaTypes)
    end
    def create_session(this : IRTCClient*, enType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, bstrLocalPhoneURI : Win32cr::Foundation::BSTR, pProfile : Void*, lFlags : Int32, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_session.call(this, enType, bstrLocalPhoneURI, pProfile, lFlags, ppSession)
    end
    def put_ListenForIncomingSessions(this : IRTCClient*, enListen : Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ListenForIncomingSessions.call(this, enListen)
    end
    def get_ListenForIncomingSessions(this : IRTCClient*, penListen : Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ListenForIncomingSessions.call(this, penListen)
    end
    def get_NetworkAddresses(this : IRTCClient*, fTCP : Int16, fExternal : Int16, pvAddresses : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkAddresses.call(this, fTCP, fExternal, pvAddresses)
    end
    def put_Volume(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, lVolume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Volume.call(this, enDevice, lVolume)
    end
    def get_Volume(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, plVolume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Volume.call(this, enDevice, plVolume)
    end
    def put_AudioMuted(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, fMuted : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AudioMuted.call(this, enDevice, fMuted)
    end
    def get_AudioMuted(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, pfMuted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioMuted.call(this, enDevice, pfMuted)
    end
    def get_IVideoWindow(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_VIDEO_DEVICE, ppIVideoWindow : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IVideoWindow.call(this, enDevice, ppIVideoWindow)
    end
    def put_PreferredAudioDevice(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, bstrDeviceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredAudioDevice.call(this, enDevice, bstrDeviceName)
    end
    def get_PreferredAudioDevice(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredAudioDevice.call(this, enDevice, pbstrDeviceName)
    end
    def put_PreferredVolume(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, lVolume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredVolume.call(this, enDevice, lVolume)
    end
    def get_PreferredVolume(this : IRTCClient*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, plVolume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredVolume.call(this, enDevice, plVolume)
    end
    def put_PreferredAEC(this : IRTCClient*, bEnable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredAEC.call(this, bEnable)
    end
    def get_PreferredAEC(this : IRTCClient*, pbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredAEC.call(this, pbEnabled)
    end
    def put_PreferredVideoDevice(this : IRTCClient*, bstrDeviceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredVideoDevice.call(this, bstrDeviceName)
    end
    def get_PreferredVideoDevice(this : IRTCClient*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredVideoDevice.call(this, pbstrDeviceName)
    end
    def get_ActiveMedia(this : IRTCClient*, plMediaType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActiveMedia.call(this, plMediaType)
    end
    def put_MaxBitrate(this : IRTCClient*, lMaxBitrate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxBitrate.call(this, lMaxBitrate)
    end
    def get_MaxBitrate(this : IRTCClient*, plMaxBitrate : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxBitrate.call(this, plMaxBitrate)
    end
    def put_TemporalSpatialTradeOff(this : IRTCClient*, lValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TemporalSpatialTradeOff.call(this, lValue)
    end
    def get_TemporalSpatialTradeOff(this : IRTCClient*, plValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TemporalSpatialTradeOff.call(this, plValue)
    end
    def get_NetworkQuality(this : IRTCClient*, plNetworkQuality : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkQuality.call(this, plNetworkQuality)
    end
    def start_t120_applet(this : IRTCClient*, enApplet : Win32cr::System::RealTimeCommunications::RTC_T120_APPLET) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_t120_applet.call(this, enApplet)
    end
    def stop_t120_applets(this : IRTCClient*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_t120_applets.call(this)
    end
    def get_IsT120AppletRunning(this : IRTCClient*, enApplet : Win32cr::System::RealTimeCommunications::RTC_T120_APPLET, pfRunning : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsT120AppletRunning.call(this, enApplet, pfRunning)
    end
    def get_LocalUserURI(this : IRTCClient*, pbstrUserURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalUserURI.call(this, pbstrUserURI)
    end
    def put_LocalUserURI(this : IRTCClient*, bstrUserURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalUserURI.call(this, bstrUserURI)
    end
    def get_LocalUserName(this : IRTCClient*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalUserName.call(this, pbstrUserName)
    end
    def put_LocalUserName(this : IRTCClient*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalUserName.call(this, bstrUserName)
    end
    def play_ring(this : IRTCClient*, enType : Win32cr::System::RealTimeCommunications::RTC_RING_TYPE, bPlay : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play_ring.call(this, enType, bPlay)
    end
    def send_dtmf(this : IRTCClient*, enDTMF : Win32cr::System::RealTimeCommunications::RTC_DTMF) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_dtmf.call(this, enDTMF)
    end
    def invoke_tuning_wizard(this : IRTCClient*, hwndParent : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_tuning_wizard.call(this, hwndParent)
    end
    def get_IsTuned(this : IRTCClient*, pfTuned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTuned.call(this, pfTuned)
    end

  end

  @[Extern]
  record IRTCClient2Vtbl,
    query_interface : Proc(IRTCClient2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClient2*, UInt32),
    release : Proc(IRTCClient2*, UInt32),
    initialize__ : Proc(IRTCClient2*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IRTCClient2*, Win32cr::Foundation::HRESULT),
    prepare_for_shutdown : Proc(IRTCClient2*, Win32cr::Foundation::HRESULT),
    put_EventFilter : Proc(IRTCClient2*, Int32, Win32cr::Foundation::HRESULT),
    get_EventFilter : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    set_preferred_media_types : Proc(IRTCClient2*, Int32, Int16, Win32cr::Foundation::HRESULT),
    get_PreferredMediaTypes : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    get_MediaCapabilities : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    create_session : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, Win32cr::Foundation::BSTR, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    put_ListenForIncomingSessions : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE, Win32cr::Foundation::HRESULT),
    get_ListenForIncomingSessions : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE*, Win32cr::Foundation::HRESULT),
    get_NetworkAddresses : Proc(IRTCClient2*, Int16, Int16, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Volume : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32, Win32cr::Foundation::HRESULT),
    get_Volume : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32*, Win32cr::Foundation::HRESULT),
    put_AudioMuted : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int16, Win32cr::Foundation::HRESULT),
    get_AudioMuted : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int16*, Win32cr::Foundation::HRESULT),
    get_IVideoWindow : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_VIDEO_DEVICE, Void**, Win32cr::Foundation::HRESULT),
    put_PreferredAudioDevice : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PreferredAudioDevice : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PreferredVolume : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32, Win32cr::Foundation::HRESULT),
    get_PreferredVolume : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, Int32*, Win32cr::Foundation::HRESULT),
    put_PreferredAEC : Proc(IRTCClient2*, Int16, Win32cr::Foundation::HRESULT),
    get_PreferredAEC : Proc(IRTCClient2*, Int16*, Win32cr::Foundation::HRESULT),
    put_PreferredVideoDevice : Proc(IRTCClient2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PreferredVideoDevice : Proc(IRTCClient2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ActiveMedia : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxBitrate : Proc(IRTCClient2*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxBitrate : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    put_TemporalSpatialTradeOff : Proc(IRTCClient2*, Int32, Win32cr::Foundation::HRESULT),
    get_TemporalSpatialTradeOff : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    get_NetworkQuality : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    start_t120_applet : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_T120_APPLET, Win32cr::Foundation::HRESULT),
    stop_t120_applets : Proc(IRTCClient2*, Win32cr::Foundation::HRESULT),
    get_IsT120AppletRunning : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_T120_APPLET, Int16*, Win32cr::Foundation::HRESULT),
    get_LocalUserURI : Proc(IRTCClient2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalUserURI : Proc(IRTCClient2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LocalUserName : Proc(IRTCClient2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalUserName : Proc(IRTCClient2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    play_ring : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_RING_TYPE, Int16, Win32cr::Foundation::HRESULT),
    send_dtmf : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_DTMF, Win32cr::Foundation::HRESULT),
    invoke_tuning_wizard : Proc(IRTCClient2*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_IsTuned : Proc(IRTCClient2*, Int16*, Win32cr::Foundation::HRESULT),
    put_AnswerMode : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, Win32cr::System::RealTimeCommunications::RTC_ANSWER_MODE, Win32cr::Foundation::HRESULT),
    get_AnswerMode : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, Win32cr::System::RealTimeCommunications::RTC_ANSWER_MODE*, Win32cr::Foundation::HRESULT),
    invoke_tuning_wizard_ex : Proc(IRTCClient2*, LibC::IntPtrT, Int16, Int16, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IRTCClient2*, Int32*, Win32cr::Foundation::HRESULT),
    put_ClientName : Proc(IRTCClient2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_ClientCurVer : Proc(IRTCClient2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    initialize_ex : Proc(IRTCClient2*, Int32, Win32cr::Foundation::HRESULT),
    create_session_with_description : Proc(IRTCClient2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    set_session_description_manager : Proc(IRTCClient2*, Void*, Win32cr::Foundation::HRESULT),
    put_PreferredSecurityLevel : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL, Win32cr::Foundation::HRESULT),
    get_PreferredSecurityLevel : Proc(IRTCClient2*, Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*, Win32cr::Foundation::HRESULT),
    put_AllowedPorts : Proc(IRTCClient2*, Int32, Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE, Win32cr::Foundation::HRESULT),
    get_AllowedPorts : Proc(IRTCClient2*, Int32, Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClient2, lpVtbl : IRTCClient2Vtbl* do
    GUID = LibC::GUID.new(0xc91d71d_u32, 0x1064_u16, 0x42da_u16, StaticArray[0xbf_u8, 0xa5_u8, 0x57_u8, 0x2b_u8, 0xeb_u8, 0x8e_u8, 0xea_u8, 0x84_u8])
    def query_interface(this : IRTCClient2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClient2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClient2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IRTCClient2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this)
    end
    def shutdown(this : IRTCClient2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def prepare_for_shutdown(this : IRTCClient2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_for_shutdown.call(this)
    end
    def put_EventFilter(this : IRTCClient2*, lFilter : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventFilter.call(this, lFilter)
    end
    def get_EventFilter(this : IRTCClient2*, plFilter : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventFilter.call(this, plFilter)
    end
    def set_preferred_media_types(this : IRTCClient2*, lMediaTypes : Int32, fPersistent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preferred_media_types.call(this, lMediaTypes, fPersistent)
    end
    def get_PreferredMediaTypes(this : IRTCClient2*, plMediaTypes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredMediaTypes.call(this, plMediaTypes)
    end
    def get_MediaCapabilities(this : IRTCClient2*, plMediaTypes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MediaCapabilities.call(this, plMediaTypes)
    end
    def create_session(this : IRTCClient2*, enType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, bstrLocalPhoneURI : Win32cr::Foundation::BSTR, pProfile : Void*, lFlags : Int32, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_session.call(this, enType, bstrLocalPhoneURI, pProfile, lFlags, ppSession)
    end
    def put_ListenForIncomingSessions(this : IRTCClient2*, enListen : Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ListenForIncomingSessions.call(this, enListen)
    end
    def get_ListenForIncomingSessions(this : IRTCClient2*, penListen : Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ListenForIncomingSessions.call(this, penListen)
    end
    def get_NetworkAddresses(this : IRTCClient2*, fTCP : Int16, fExternal : Int16, pvAddresses : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkAddresses.call(this, fTCP, fExternal, pvAddresses)
    end
    def put_Volume(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, lVolume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Volume.call(this, enDevice, lVolume)
    end
    def get_Volume(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, plVolume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Volume.call(this, enDevice, plVolume)
    end
    def put_AudioMuted(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, fMuted : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AudioMuted.call(this, enDevice, fMuted)
    end
    def get_AudioMuted(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, pfMuted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioMuted.call(this, enDevice, pfMuted)
    end
    def get_IVideoWindow(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_VIDEO_DEVICE, ppIVideoWindow : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IVideoWindow.call(this, enDevice, ppIVideoWindow)
    end
    def put_PreferredAudioDevice(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, bstrDeviceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredAudioDevice.call(this, enDevice, bstrDeviceName)
    end
    def get_PreferredAudioDevice(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredAudioDevice.call(this, enDevice, pbstrDeviceName)
    end
    def put_PreferredVolume(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, lVolume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredVolume.call(this, enDevice, lVolume)
    end
    def get_PreferredVolume(this : IRTCClient2*, enDevice : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE, plVolume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredVolume.call(this, enDevice, plVolume)
    end
    def put_PreferredAEC(this : IRTCClient2*, bEnable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredAEC.call(this, bEnable)
    end
    def get_PreferredAEC(this : IRTCClient2*, pbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredAEC.call(this, pbEnabled)
    end
    def put_PreferredVideoDevice(this : IRTCClient2*, bstrDeviceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredVideoDevice.call(this, bstrDeviceName)
    end
    def get_PreferredVideoDevice(this : IRTCClient2*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredVideoDevice.call(this, pbstrDeviceName)
    end
    def get_ActiveMedia(this : IRTCClient2*, plMediaType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActiveMedia.call(this, plMediaType)
    end
    def put_MaxBitrate(this : IRTCClient2*, lMaxBitrate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxBitrate.call(this, lMaxBitrate)
    end
    def get_MaxBitrate(this : IRTCClient2*, plMaxBitrate : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxBitrate.call(this, plMaxBitrate)
    end
    def put_TemporalSpatialTradeOff(this : IRTCClient2*, lValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TemporalSpatialTradeOff.call(this, lValue)
    end
    def get_TemporalSpatialTradeOff(this : IRTCClient2*, plValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TemporalSpatialTradeOff.call(this, plValue)
    end
    def get_NetworkQuality(this : IRTCClient2*, plNetworkQuality : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkQuality.call(this, plNetworkQuality)
    end
    def start_t120_applet(this : IRTCClient2*, enApplet : Win32cr::System::RealTimeCommunications::RTC_T120_APPLET) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_t120_applet.call(this, enApplet)
    end
    def stop_t120_applets(this : IRTCClient2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_t120_applets.call(this)
    end
    def get_IsT120AppletRunning(this : IRTCClient2*, enApplet : Win32cr::System::RealTimeCommunications::RTC_T120_APPLET, pfRunning : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsT120AppletRunning.call(this, enApplet, pfRunning)
    end
    def get_LocalUserURI(this : IRTCClient2*, pbstrUserURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalUserURI.call(this, pbstrUserURI)
    end
    def put_LocalUserURI(this : IRTCClient2*, bstrUserURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalUserURI.call(this, bstrUserURI)
    end
    def get_LocalUserName(this : IRTCClient2*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalUserName.call(this, pbstrUserName)
    end
    def put_LocalUserName(this : IRTCClient2*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalUserName.call(this, bstrUserName)
    end
    def play_ring(this : IRTCClient2*, enType : Win32cr::System::RealTimeCommunications::RTC_RING_TYPE, bPlay : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play_ring.call(this, enType, bPlay)
    end
    def send_dtmf(this : IRTCClient2*, enDTMF : Win32cr::System::RealTimeCommunications::RTC_DTMF) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_dtmf.call(this, enDTMF)
    end
    def invoke_tuning_wizard(this : IRTCClient2*, hwndParent : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_tuning_wizard.call(this, hwndParent)
    end
    def get_IsTuned(this : IRTCClient2*, pfTuned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTuned.call(this, pfTuned)
    end
    def put_AnswerMode(this : IRTCClient2*, enType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, enMode : Win32cr::System::RealTimeCommunications::RTC_ANSWER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AnswerMode.call(this, enType, enMode)
    end
    def get_AnswerMode(this : IRTCClient2*, enType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, penMode : Win32cr::System::RealTimeCommunications::RTC_ANSWER_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AnswerMode.call(this, enType, penMode)
    end
    def invoke_tuning_wizard_ex(this : IRTCClient2*, hwndParent : LibC::IntPtrT, fAllowAudio : Int16, fAllowVideo : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_tuning_wizard_ex.call(this, hwndParent, fAllowAudio, fAllowVideo)
    end
    def get_Version(this : IRTCClient2*, plVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, plVersion)
    end
    def put_ClientName(this : IRTCClient2*, bstrClientName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientName.call(this, bstrClientName)
    end
    def put_ClientCurVer(this : IRTCClient2*, bstrClientCurVer : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientCurVer.call(this, bstrClientCurVer)
    end
    def initialize_ex(this : IRTCClient2*, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_ex.call(this, lFlags)
    end
    def create_session_with_description(this : IRTCClient2*, bstrContentType : Win32cr::Foundation::BSTR, bstrSessionDescription : Win32cr::Foundation::BSTR, pProfile : Void*, lFlags : Int32, ppSession2 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_session_with_description.call(this, bstrContentType, bstrSessionDescription, pProfile, lFlags, ppSession2)
    end
    def set_session_description_manager(this : IRTCClient2*, pSessionDescriptionManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_session_description_manager.call(this, pSessionDescriptionManager)
    end
    def put_PreferredSecurityLevel(this : IRTCClient2*, enSecurityType : Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, enSecurityLevel : Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredSecurityLevel.call(this, enSecurityType, enSecurityLevel)
    end
    def get_PreferredSecurityLevel(this : IRTCClient2*, enSecurityType : Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, penSecurityLevel : Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredSecurityLevel.call(this, enSecurityType, penSecurityLevel)
    end
    def put_AllowedPorts(this : IRTCClient2*, lTransport : Int32, enListenMode : Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowedPorts.call(this, lTransport, enListenMode)
    end
    def get_AllowedPorts(this : IRTCClient2*, lTransport : Int32, penListenMode : Win32cr::System::RealTimeCommunications::RTC_LISTEN_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowedPorts.call(this, lTransport, penListenMode)
    end

  end

  @[Extern]
  record IRTCClientPresenceVtbl,
    query_interface : Proc(IRTCClientPresence*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClientPresence*, UInt32),
    release : Proc(IRTCClientPresence*, UInt32),
    enable_presence : Proc(IRTCClientPresence*, Int16, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    export : Proc(IRTCClientPresence*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    import : Proc(IRTCClientPresence*, Win32cr::System::Com::VARIANT, Int16, Win32cr::Foundation::HRESULT),
    enumerate_buddies : Proc(IRTCClientPresence*, Void**, Win32cr::Foundation::HRESULT),
    get_Buddies : Proc(IRTCClientPresence*, Void**, Win32cr::Foundation::HRESULT),
    get_Buddy : Proc(IRTCClientPresence*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_buddy : Proc(IRTCClientPresence*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    remove_buddy : Proc(IRTCClientPresence*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_watchers : Proc(IRTCClientPresence*, Void**, Win32cr::Foundation::HRESULT),
    get_Watchers : Proc(IRTCClientPresence*, Void**, Win32cr::Foundation::HRESULT),
    get_Watcher : Proc(IRTCClientPresence*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_watcher : Proc(IRTCClientPresence*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Int16, Void**, Win32cr::Foundation::HRESULT),
    remove_watcher : Proc(IRTCClientPresence*, Void*, Win32cr::Foundation::HRESULT),
    set_local_presence_info : Proc(IRTCClientPresence*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OfferWatcherMode : Proc(IRTCClientPresence*, Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE*, Win32cr::Foundation::HRESULT),
    put_OfferWatcherMode : Proc(IRTCClientPresence*, Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE, Win32cr::Foundation::HRESULT),
    get_PrivacyMode : Proc(IRTCClientPresence*, Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE*, Win32cr::Foundation::HRESULT),
    put_PrivacyMode : Proc(IRTCClientPresence*, Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClientPresence, lpVtbl : IRTCClientPresenceVtbl* do
    GUID = LibC::GUID.new(0x11c3cbcc_u32, 0x744_u16, 0x42d1_u16, StaticArray[0x96_u8, 0x8a_u8, 0x51_u8, 0xaa_u8, 0x1b_u8, 0xb2_u8, 0x74_u8, 0xc6_u8])
    def query_interface(this : IRTCClientPresence*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClientPresence*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClientPresence*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable_presence(this : IRTCClientPresence*, fUseStorage : Int16, varStorage : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_presence.call(this, fUseStorage, varStorage)
    end
    def export(this : IRTCClientPresence*, varStorage : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export.call(this, varStorage)
    end
    def import(this : IRTCClientPresence*, varStorage : Win32cr::System::Com::VARIANT, fReplaceAll : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, varStorage, fReplaceAll)
    end
    def enumerate_buddies(this : IRTCClientPresence*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_buddies.call(this, ppEnum)
    end
    def get_Buddies(this : IRTCClientPresence*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddies.call(this, ppCollection)
    end
    def get_Buddy(this : IRTCClientPresence*, bstrPresentityURI : Win32cr::Foundation::BSTR, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddy.call(this, bstrPresentityURI, ppBuddy)
    end
    def add_buddy(this : IRTCClientPresence*, bstrPresentityURI : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR, fPersistent : Int16, pProfile : Void*, lFlags : Int32, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_buddy.call(this, bstrPresentityURI, bstrUserName, bstrData, fPersistent, pProfile, lFlags, ppBuddy)
    end
    def remove_buddy(this : IRTCClientPresence*, pBuddy : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_buddy.call(this, pBuddy)
    end
    def enumerate_watchers(this : IRTCClientPresence*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_watchers.call(this, ppEnum)
    end
    def get_Watchers(this : IRTCClientPresence*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Watchers.call(this, ppCollection)
    end
    def get_Watcher(this : IRTCClientPresence*, bstrPresentityURI : Win32cr::Foundation::BSTR, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Watcher.call(this, bstrPresentityURI, ppWatcher)
    end
    def add_watcher(this : IRTCClientPresence*, bstrPresentityURI : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR, fBlocked : Int16, fPersistent : Int16, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_watcher.call(this, bstrPresentityURI, bstrUserName, bstrData, fBlocked, fPersistent, ppWatcher)
    end
    def remove_watcher(this : IRTCClientPresence*, pWatcher : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_watcher.call(this, pWatcher)
    end
    def set_local_presence_info(this : IRTCClientPresence*, enStatus : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS, bstrNotes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_presence_info.call(this, enStatus, bstrNotes)
    end
    def get_OfferWatcherMode(this : IRTCClientPresence*, penMode : Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OfferWatcherMode.call(this, penMode)
    end
    def put_OfferWatcherMode(this : IRTCClientPresence*, enMode : Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OfferWatcherMode.call(this, enMode)
    end
    def get_PrivacyMode(this : IRTCClientPresence*, penMode : Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivacyMode.call(this, penMode)
    end
    def put_PrivacyMode(this : IRTCClientPresence*, enMode : Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivacyMode.call(this, enMode)
    end

  end

  @[Extern]
  record IRTCClientPresence2Vtbl,
    query_interface : Proc(IRTCClientPresence2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClientPresence2*, UInt32),
    release : Proc(IRTCClientPresence2*, UInt32),
    enable_presence : Proc(IRTCClientPresence2*, Int16, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    export : Proc(IRTCClientPresence2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    import : Proc(IRTCClientPresence2*, Win32cr::System::Com::VARIANT, Int16, Win32cr::Foundation::HRESULT),
    enumerate_buddies : Proc(IRTCClientPresence2*, Void**, Win32cr::Foundation::HRESULT),
    get_Buddies : Proc(IRTCClientPresence2*, Void**, Win32cr::Foundation::HRESULT),
    get_Buddy : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_buddy : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    remove_buddy : Proc(IRTCClientPresence2*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_watchers : Proc(IRTCClientPresence2*, Void**, Win32cr::Foundation::HRESULT),
    get_Watchers : Proc(IRTCClientPresence2*, Void**, Win32cr::Foundation::HRESULT),
    get_Watcher : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_watcher : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Int16, Void**, Win32cr::Foundation::HRESULT),
    remove_watcher : Proc(IRTCClientPresence2*, Void*, Win32cr::Foundation::HRESULT),
    set_local_presence_info : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OfferWatcherMode : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE*, Win32cr::Foundation::HRESULT),
    put_OfferWatcherMode : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE, Win32cr::Foundation::HRESULT),
    get_PrivacyMode : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE*, Win32cr::Foundation::HRESULT),
    put_PrivacyMode : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE, Win32cr::Foundation::HRESULT),
    enable_presence_ex : Proc(IRTCClientPresence2*, Void*, Win32cr::System::Com::VARIANT, Int32, Win32cr::Foundation::HRESULT),
    disable_presence : Proc(IRTCClientPresence2*, Win32cr::Foundation::HRESULT),
    add_group : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    remove_group : Proc(IRTCClientPresence2*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_groups : Proc(IRTCClientPresence2*, Void**, Win32cr::Foundation::HRESULT),
    get_Groups : Proc(IRTCClientPresence2*, Void**, Win32cr::Foundation::HRESULT),
    get_Group : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_watcher_ex : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE, Int16, Win32cr::System::RealTimeCommunications::RTC_ACE_SCOPE, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_WatcherEx : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_WATCHER_MATCH_MODE, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    put_PresenceProperty : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PresenceProperty : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_presence_data : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_presence_data : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_local_presence_info : Proc(IRTCClientPresence2*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_buddy_ex : Proc(IRTCClientPresence2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Win32cr::System::RealTimeCommunications::RTC_BUDDY_SUBSCRIPTION_TYPE, Void*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClientPresence2, lpVtbl : IRTCClientPresence2Vtbl* do
    GUID = LibC::GUID.new(0xad1809e8_u32, 0x62f7_u16, 0x4783_u16, StaticArray[0x90_u8, 0x9a_u8, 0x29_u8, 0xc9_u8, 0xd2_u8, 0xcb_u8, 0x1d_u8, 0x34_u8])
    def query_interface(this : IRTCClientPresence2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClientPresence2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClientPresence2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable_presence(this : IRTCClientPresence2*, fUseStorage : Int16, varStorage : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_presence.call(this, fUseStorage, varStorage)
    end
    def export(this : IRTCClientPresence2*, varStorage : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export.call(this, varStorage)
    end
    def import(this : IRTCClientPresence2*, varStorage : Win32cr::System::Com::VARIANT, fReplaceAll : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, varStorage, fReplaceAll)
    end
    def enumerate_buddies(this : IRTCClientPresence2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_buddies.call(this, ppEnum)
    end
    def get_Buddies(this : IRTCClientPresence2*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddies.call(this, ppCollection)
    end
    def get_Buddy(this : IRTCClientPresence2*, bstrPresentityURI : Win32cr::Foundation::BSTR, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddy.call(this, bstrPresentityURI, ppBuddy)
    end
    def add_buddy(this : IRTCClientPresence2*, bstrPresentityURI : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR, fPersistent : Int16, pProfile : Void*, lFlags : Int32, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_buddy.call(this, bstrPresentityURI, bstrUserName, bstrData, fPersistent, pProfile, lFlags, ppBuddy)
    end
    def remove_buddy(this : IRTCClientPresence2*, pBuddy : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_buddy.call(this, pBuddy)
    end
    def enumerate_watchers(this : IRTCClientPresence2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_watchers.call(this, ppEnum)
    end
    def get_Watchers(this : IRTCClientPresence2*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Watchers.call(this, ppCollection)
    end
    def get_Watcher(this : IRTCClientPresence2*, bstrPresentityURI : Win32cr::Foundation::BSTR, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Watcher.call(this, bstrPresentityURI, ppWatcher)
    end
    def add_watcher(this : IRTCClientPresence2*, bstrPresentityURI : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR, fBlocked : Int16, fPersistent : Int16, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_watcher.call(this, bstrPresentityURI, bstrUserName, bstrData, fBlocked, fPersistent, ppWatcher)
    end
    def remove_watcher(this : IRTCClientPresence2*, pWatcher : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_watcher.call(this, pWatcher)
    end
    def set_local_presence_info(this : IRTCClientPresence2*, enStatus : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS, bstrNotes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_presence_info.call(this, enStatus, bstrNotes)
    end
    def get_OfferWatcherMode(this : IRTCClientPresence2*, penMode : Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OfferWatcherMode.call(this, penMode)
    end
    def put_OfferWatcherMode(this : IRTCClientPresence2*, enMode : Win32cr::System::RealTimeCommunications::RTC_OFFER_WATCHER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OfferWatcherMode.call(this, enMode)
    end
    def get_PrivacyMode(this : IRTCClientPresence2*, penMode : Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivacyMode.call(this, penMode)
    end
    def put_PrivacyMode(this : IRTCClientPresence2*, enMode : Win32cr::System::RealTimeCommunications::RTC_PRIVACY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivacyMode.call(this, enMode)
    end
    def enable_presence_ex(this : IRTCClientPresence2*, pProfile : Void*, varStorage : Win32cr::System::Com::VARIANT, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_presence_ex.call(this, pProfile, varStorage, lFlags)
    end
    def disable_presence(this : IRTCClientPresence2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_presence.call(this)
    end
    def add_group(this : IRTCClientPresence2*, bstrGroupName : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR, pProfile : Void*, lFlags : Int32, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_group.call(this, bstrGroupName, bstrData, pProfile, lFlags, ppGroup)
    end
    def remove_group(this : IRTCClientPresence2*, pGroup : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_group.call(this, pGroup)
    end
    def enumerate_groups(this : IRTCClientPresence2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_groups.call(this, ppEnum)
    end
    def get_Groups(this : IRTCClientPresence2*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Groups.call(this, ppCollection)
    end
    def get_Group(this : IRTCClientPresence2*, bstrGroupName : Win32cr::Foundation::BSTR, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Group.call(this, bstrGroupName, ppGroup)
    end
    def add_watcher_ex(this : IRTCClientPresence2*, bstrPresentityURI : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR, enState : Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE, fPersistent : Int16, enScope : Win32cr::System::RealTimeCommunications::RTC_ACE_SCOPE, pProfile : Void*, lFlags : Int32, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_watcher_ex.call(this, bstrPresentityURI, bstrUserName, bstrData, enState, fPersistent, enScope, pProfile, lFlags, ppWatcher)
    end
    def get_WatcherEx(this : IRTCClientPresence2*, enMode : Win32cr::System::RealTimeCommunications::RTC_WATCHER_MATCH_MODE, bstrPresentityURI : Win32cr::Foundation::BSTR, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WatcherEx.call(this, enMode, bstrPresentityURI, ppWatcher)
    end
    def put_PresenceProperty(this : IRTCClientPresence2*, enProperty : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, bstrProperty : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PresenceProperty.call(this, enProperty, bstrProperty)
    end
    def get_PresenceProperty(this : IRTCClientPresence2*, enProperty : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, pbstrProperty : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresenceProperty.call(this, enProperty, pbstrProperty)
    end
    def set_presence_data(this : IRTCClientPresence2*, bstrNamespace : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_presence_data.call(this, bstrNamespace, bstrData)
    end
    def get_presence_data(this : IRTCClientPresence2*, pbstrNamespace : Win32cr::Foundation::BSTR*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_presence_data.call(this, pbstrNamespace, pbstrData)
    end
    def get_local_presence_info(this : IRTCClientPresence2*, penStatus : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*, pbstrNotes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_presence_info.call(this, penStatus, pbstrNotes)
    end
    def add_buddy_ex(this : IRTCClientPresence2*, bstrPresentityURI : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrData : Win32cr::Foundation::BSTR, fPersistent : Int16, enSubscriptionType : Win32cr::System::RealTimeCommunications::RTC_BUDDY_SUBSCRIPTION_TYPE, pProfile : Void*, lFlags : Int32, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_buddy_ex.call(this, bstrPresentityURI, bstrUserName, bstrData, fPersistent, enSubscriptionType, pProfile, lFlags, ppBuddy)
    end

  end

  @[Extern]
  record IRTCClientProvisioningVtbl,
    query_interface : Proc(IRTCClientProvisioning*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClientProvisioning*, UInt32),
    release : Proc(IRTCClientProvisioning*, UInt32),
    create_profile : Proc(IRTCClientProvisioning*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enable_profile : Proc(IRTCClientProvisioning*, Void*, Int32, Win32cr::Foundation::HRESULT),
    disable_profile : Proc(IRTCClientProvisioning*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_profiles : Proc(IRTCClientProvisioning*, Void**, Win32cr::Foundation::HRESULT),
    get_Profiles : Proc(IRTCClientProvisioning*, Void**, Win32cr::Foundation::HRESULT),
    get_profile : Proc(IRTCClientProvisioning*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_SessionCapabilities : Proc(IRTCClientProvisioning*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClientProvisioning, lpVtbl : IRTCClientProvisioningVtbl* do
    GUID = LibC::GUID.new(0xb9f5cf06_u32, 0x65b9_u16, 0x4a80_u16, StaticArray[0xa0_u8, 0xe6_u8, 0x73_u8, 0xca_u8, 0xe3_u8, 0xef_u8, 0x38_u8, 0x22_u8])
    def query_interface(this : IRTCClientProvisioning*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClientProvisioning*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClientProvisioning*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_profile(this : IRTCClientProvisioning*, bstrProfileXML : Win32cr::Foundation::BSTR, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_profile.call(this, bstrProfileXML, ppProfile)
    end
    def enable_profile(this : IRTCClientProvisioning*, pProfile : Void*, lRegisterFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_profile.call(this, pProfile, lRegisterFlags)
    end
    def disable_profile(this : IRTCClientProvisioning*, pProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_profile.call(this, pProfile)
    end
    def enumerate_profiles(this : IRTCClientProvisioning*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_profiles.call(this, ppEnum)
    end
    def get_Profiles(this : IRTCClientProvisioning*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profiles.call(this, ppCollection)
    end
    def get_profile(this : IRTCClientProvisioning*, bstrUserAccount : Win32cr::Foundation::BSTR, bstrUserPassword : Win32cr::Foundation::BSTR, bstrUserURI : Win32cr::Foundation::BSTR, bstrServer : Win32cr::Foundation::BSTR, lTransport : Int32, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile.call(this, bstrUserAccount, bstrUserPassword, bstrUserURI, bstrServer, lTransport, lCookie)
    end
    def get_SessionCapabilities(this : IRTCClientProvisioning*, plSupportedSessions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionCapabilities.call(this, plSupportedSessions)
    end

  end

  @[Extern]
  record IRTCClientProvisioning2Vtbl,
    query_interface : Proc(IRTCClientProvisioning2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClientProvisioning2*, UInt32),
    release : Proc(IRTCClientProvisioning2*, UInt32),
    create_profile : Proc(IRTCClientProvisioning2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enable_profile : Proc(IRTCClientProvisioning2*, Void*, Int32, Win32cr::Foundation::HRESULT),
    disable_profile : Proc(IRTCClientProvisioning2*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_profiles : Proc(IRTCClientProvisioning2*, Void**, Win32cr::Foundation::HRESULT),
    get_Profiles : Proc(IRTCClientProvisioning2*, Void**, Win32cr::Foundation::HRESULT),
    get_profile : Proc(IRTCClientProvisioning2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_SessionCapabilities : Proc(IRTCClientProvisioning2*, Int32*, Win32cr::Foundation::HRESULT),
    enable_profile_ex : Proc(IRTCClientProvisioning2*, Void*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClientProvisioning2, lpVtbl : IRTCClientProvisioning2Vtbl* do
    GUID = LibC::GUID.new(0xa70909b5_u32, 0xf40e_u16, 0x4587_u16, StaticArray[0xbb_u8, 0x75_u8, 0xe6_u8, 0xbc_u8, 0x8_u8, 0x45_u8, 0x2_u8, 0x3e_u8])
    def query_interface(this : IRTCClientProvisioning2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClientProvisioning2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClientProvisioning2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_profile(this : IRTCClientProvisioning2*, bstrProfileXML : Win32cr::Foundation::BSTR, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_profile.call(this, bstrProfileXML, ppProfile)
    end
    def enable_profile(this : IRTCClientProvisioning2*, pProfile : Void*, lRegisterFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_profile.call(this, pProfile, lRegisterFlags)
    end
    def disable_profile(this : IRTCClientProvisioning2*, pProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_profile.call(this, pProfile)
    end
    def enumerate_profiles(this : IRTCClientProvisioning2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_profiles.call(this, ppEnum)
    end
    def get_Profiles(this : IRTCClientProvisioning2*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profiles.call(this, ppCollection)
    end
    def get_profile(this : IRTCClientProvisioning2*, bstrUserAccount : Win32cr::Foundation::BSTR, bstrUserPassword : Win32cr::Foundation::BSTR, bstrUserURI : Win32cr::Foundation::BSTR, bstrServer : Win32cr::Foundation::BSTR, lTransport : Int32, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile.call(this, bstrUserAccount, bstrUserPassword, bstrUserURI, bstrServer, lTransport, lCookie)
    end
    def get_SessionCapabilities(this : IRTCClientProvisioning2*, plSupportedSessions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionCapabilities.call(this, plSupportedSessions)
    end
    def enable_profile_ex(this : IRTCClientProvisioning2*, pProfile : Void*, lRegisterFlags : Int32, lRoamingFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_profile_ex.call(this, pProfile, lRegisterFlags, lRoamingFlags)
    end

  end

  @[Extern]
  record IRTCProfileVtbl,
    query_interface : Proc(IRTCProfile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCProfile*, UInt32),
    release : Proc(IRTCProfile*, UInt32),
    get_Key : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_XML : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProviderName : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProviderURI : Proc(IRTCProfile*, Win32cr::System::RealTimeCommunications::RTC_PROVIDER_URI, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProviderData : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientName : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientBanner : Proc(IRTCProfile*, Int16*, Win32cr::Foundation::HRESULT),
    get_ClientMinVer : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientCurVer : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientUpdateURI : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientData : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserURI : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserName : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserAccount : Proc(IRTCProfile*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IRTCProfile*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SessionCapabilities : Proc(IRTCProfile*, Int32*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCProfile*, Win32cr::System::RealTimeCommunications::RTC_REGISTRATION_STATE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCProfile, lpVtbl : IRTCProfileVtbl* do
    GUID = LibC::GUID.new(0xd07eca9e_u32, 0x4062_u16, 0x4dd4_u16, StaticArray[0x9e_u8, 0x7d_u8, 0x72_u8, 0x2a_u8, 0x49_u8, 0xba_u8, 0x73_u8, 0x3_u8])
    def query_interface(this : IRTCProfile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCProfile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCProfile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Key(this : IRTCProfile*, pbstrKey : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Key.call(this, pbstrKey)
    end
    def get_Name(this : IRTCProfile*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_XML(this : IRTCProfile*, pbstrXML : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XML.call(this, pbstrXML)
    end
    def get_ProviderName(this : IRTCProfile*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderName.call(this, pbstrName)
    end
    def get_ProviderURI(this : IRTCProfile*, enURI : Win32cr::System::RealTimeCommunications::RTC_PROVIDER_URI, pbstrURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderURI.call(this, enURI, pbstrURI)
    end
    def get_ProviderData(this : IRTCProfile*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderData.call(this, pbstrData)
    end
    def get_ClientName(this : IRTCProfile*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientName.call(this, pbstrName)
    end
    def get_ClientBanner(this : IRTCProfile*, pfBanner : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientBanner.call(this, pfBanner)
    end
    def get_ClientMinVer(this : IRTCProfile*, pbstrMinVer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientMinVer.call(this, pbstrMinVer)
    end
    def get_ClientCurVer(this : IRTCProfile*, pbstrCurVer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientCurVer.call(this, pbstrCurVer)
    end
    def get_ClientUpdateURI(this : IRTCProfile*, pbstrUpdateURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientUpdateURI.call(this, pbstrUpdateURI)
    end
    def get_ClientData(this : IRTCProfile*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientData.call(this, pbstrData)
    end
    def get_UserURI(this : IRTCProfile*, pbstrUserURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserURI.call(this, pbstrUserURI)
    end
    def get_UserName(this : IRTCProfile*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserName.call(this, pbstrUserName)
    end
    def get_UserAccount(this : IRTCProfile*, pbstrUserAccount : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserAccount.call(this, pbstrUserAccount)
    end
    def set_credentials(this : IRTCProfile*, bstrUserURI : Win32cr::Foundation::BSTR, bstrUserAccount : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, bstrUserURI, bstrUserAccount, bstrPassword)
    end
    def get_SessionCapabilities(this : IRTCProfile*, plSupportedSessions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionCapabilities.call(this, plSupportedSessions)
    end
    def get_State(this : IRTCProfile*, penState : Win32cr::System::RealTimeCommunications::RTC_REGISTRATION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end

  end

  @[Extern]
  record IRTCProfile2Vtbl,
    query_interface : Proc(IRTCProfile2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCProfile2*, UInt32),
    release : Proc(IRTCProfile2*, UInt32),
    get_Key : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_XML : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProviderName : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProviderURI : Proc(IRTCProfile2*, Win32cr::System::RealTimeCommunications::RTC_PROVIDER_URI, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProviderData : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientName : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientBanner : Proc(IRTCProfile2*, Int16*, Win32cr::Foundation::HRESULT),
    get_ClientMinVer : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientCurVer : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientUpdateURI : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClientData : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserURI : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserName : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserAccount : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SessionCapabilities : Proc(IRTCProfile2*, Int32*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCProfile2*, Win32cr::System::RealTimeCommunications::RTC_REGISTRATION_STATE*, Win32cr::Foundation::HRESULT),
    get_Realm : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Realm : Proc(IRTCProfile2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AllowedAuth : Proc(IRTCProfile2*, Int32*, Win32cr::Foundation::HRESULT),
    put_AllowedAuth : Proc(IRTCProfile2*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCProfile2, lpVtbl : IRTCProfile2Vtbl* do
    GUID = LibC::GUID.new(0x4b81f84e_u32, 0xbdc7_u16, 0x4184_u16, StaticArray[0x91_u8, 0x54_u8, 0x3c_u8, 0xb2_u8, 0xdd_u8, 0x79_u8, 0x17_u8, 0xfb_u8])
    def query_interface(this : IRTCProfile2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCProfile2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCProfile2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Key(this : IRTCProfile2*, pbstrKey : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Key.call(this, pbstrKey)
    end
    def get_Name(this : IRTCProfile2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_XML(this : IRTCProfile2*, pbstrXML : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XML.call(this, pbstrXML)
    end
    def get_ProviderName(this : IRTCProfile2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderName.call(this, pbstrName)
    end
    def get_ProviderURI(this : IRTCProfile2*, enURI : Win32cr::System::RealTimeCommunications::RTC_PROVIDER_URI, pbstrURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderURI.call(this, enURI, pbstrURI)
    end
    def get_ProviderData(this : IRTCProfile2*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderData.call(this, pbstrData)
    end
    def get_ClientName(this : IRTCProfile2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientName.call(this, pbstrName)
    end
    def get_ClientBanner(this : IRTCProfile2*, pfBanner : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientBanner.call(this, pfBanner)
    end
    def get_ClientMinVer(this : IRTCProfile2*, pbstrMinVer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientMinVer.call(this, pbstrMinVer)
    end
    def get_ClientCurVer(this : IRTCProfile2*, pbstrCurVer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientCurVer.call(this, pbstrCurVer)
    end
    def get_ClientUpdateURI(this : IRTCProfile2*, pbstrUpdateURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientUpdateURI.call(this, pbstrUpdateURI)
    end
    def get_ClientData(this : IRTCProfile2*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientData.call(this, pbstrData)
    end
    def get_UserURI(this : IRTCProfile2*, pbstrUserURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserURI.call(this, pbstrUserURI)
    end
    def get_UserName(this : IRTCProfile2*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserName.call(this, pbstrUserName)
    end
    def get_UserAccount(this : IRTCProfile2*, pbstrUserAccount : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserAccount.call(this, pbstrUserAccount)
    end
    def set_credentials(this : IRTCProfile2*, bstrUserURI : Win32cr::Foundation::BSTR, bstrUserAccount : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, bstrUserURI, bstrUserAccount, bstrPassword)
    end
    def get_SessionCapabilities(this : IRTCProfile2*, plSupportedSessions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionCapabilities.call(this, plSupportedSessions)
    end
    def get_State(this : IRTCProfile2*, penState : Win32cr::System::RealTimeCommunications::RTC_REGISTRATION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_Realm(this : IRTCProfile2*, pbstrRealm : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Realm.call(this, pbstrRealm)
    end
    def put_Realm(this : IRTCProfile2*, bstrRealm : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Realm.call(this, bstrRealm)
    end
    def get_AllowedAuth(this : IRTCProfile2*, plAllowedAuth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowedAuth.call(this, plAllowedAuth)
    end
    def put_AllowedAuth(this : IRTCProfile2*, lAllowedAuth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowedAuth.call(this, lAllowedAuth)
    end

  end

  @[Extern]
  record IRTCSessionVtbl,
    query_interface : Proc(IRTCSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSession*, UInt32),
    release : Proc(IRTCSession*, UInt32),
    get_Client : Proc(IRTCSession*, Void**, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCSession*, Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IRTCSession*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCSession*, Void**, Win32cr::Foundation::HRESULT),
    get_Participants : Proc(IRTCSession*, Void**, Win32cr::Foundation::HRESULT),
    answer : Proc(IRTCSession*, Win32cr::Foundation::HRESULT),
    terminate : Proc(IRTCSession*, Win32cr::System::RealTimeCommunications::RTC_TERMINATE_REASON, Win32cr::Foundation::HRESULT),
    redirect : Proc(IRTCSession*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, Win32cr::Foundation::BSTR, Void*, Int32, Win32cr::Foundation::HRESULT),
    add_participant : Proc(IRTCSession*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_participant : Proc(IRTCSession*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_participants : Proc(IRTCSession*, Void**, Win32cr::Foundation::HRESULT),
    get_CanAddParticipants : Proc(IRTCSession*, Int16*, Win32cr::Foundation::HRESULT),
    get_RedirectedUserURI : Proc(IRTCSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RedirectedUserName : Proc(IRTCSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    next_redirected_user : Proc(IRTCSession*, Win32cr::Foundation::HRESULT),
    send_message : Proc(IRTCSession*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    send_message_status : Proc(IRTCSession*, Win32cr::System::RealTimeCommunications::RTC_MESSAGING_USER_STATUS, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IRTCSession*, Int32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IRTCSession*, Int32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    put_EncryptionKey : Proc(IRTCSession*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSession, lpVtbl : IRTCSessionVtbl* do
    GUID = LibC::GUID.new(0x387c8086_u32, 0x99be_u16, 0x42fb_u16, StaticArray[0x99_u8, 0x73_u8, 0x7c_u8, 0xf_u8, 0xc0_u8, 0xca_u8, 0x9f_u8, 0xa8_u8])
    def query_interface(this : IRTCSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Client(this : IRTCSession*, ppClient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Client.call(this, ppClient)
    end
    def get_State(this : IRTCSession*, penState : Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_Type(this : IRTCSession*, penType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, penType)
    end
    def get_Profile(this : IRTCSession*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_Participants(this : IRTCSession*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Participants.call(this, ppCollection)
    end
    def answer(this : IRTCSession*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.answer.call(this)
    end
    def terminate(this : IRTCSession*, enReason : Win32cr::System::RealTimeCommunications::RTC_TERMINATE_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, enReason)
    end
    def redirect(this : IRTCSession*, enType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, bstrLocalPhoneURI : Win32cr::Foundation::BSTR, pProfile : Void*, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect.call(this, enType, bstrLocalPhoneURI, pProfile, lFlags)
    end
    def add_participant(this : IRTCSession*, bstrAddress : Win32cr::Foundation::BSTR, bstrName : Win32cr::Foundation::BSTR, ppParticipant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_participant.call(this, bstrAddress, bstrName, ppParticipant)
    end
    def remove_participant(this : IRTCSession*, pParticipant : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_participant.call(this, pParticipant)
    end
    def enumerate_participants(this : IRTCSession*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_participants.call(this, ppEnum)
    end
    def get_CanAddParticipants(this : IRTCSession*, pfCanAdd : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanAddParticipants.call(this, pfCanAdd)
    end
    def get_RedirectedUserURI(this : IRTCSession*, pbstrUserURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RedirectedUserURI.call(this, pbstrUserURI)
    end
    def get_RedirectedUserName(this : IRTCSession*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RedirectedUserName.call(this, pbstrUserName)
    end
    def next_redirected_user(this : IRTCSession*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_redirected_user.call(this)
    end
    def send_message(this : IRTCSession*, bstrMessageHeader : Win32cr::Foundation::BSTR, bstrMessage : Win32cr::Foundation::BSTR, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_message.call(this, bstrMessageHeader, bstrMessage, lCookie)
    end
    def send_message_status(this : IRTCSession*, enUserStatus : Win32cr::System::RealTimeCommunications::RTC_MESSAGING_USER_STATUS, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_message_status.call(this, enUserStatus, lCookie)
    end
    def add_stream(this : IRTCSession*, lMediaType : Int32, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, lMediaType, lCookie)
    end
    def remove_stream(this : IRTCSession*, lMediaType : Int32, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, lMediaType, lCookie)
    end
    def put_EncryptionKey(this : IRTCSession*, lMediaType : Int32, encryption_key : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EncryptionKey.call(this, lMediaType, encryption_key)
    end

  end

  @[Extern]
  record IRTCSession2Vtbl,
    query_interface : Proc(IRTCSession2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSession2*, UInt32),
    release : Proc(IRTCSession2*, UInt32),
    get_Client : Proc(IRTCSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_Participants : Proc(IRTCSession2*, Void**, Win32cr::Foundation::HRESULT),
    answer : Proc(IRTCSession2*, Win32cr::Foundation::HRESULT),
    terminate : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_TERMINATE_REASON, Win32cr::Foundation::HRESULT),
    redirect : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, Win32cr::Foundation::BSTR, Void*, Int32, Win32cr::Foundation::HRESULT),
    add_participant : Proc(IRTCSession2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_participant : Proc(IRTCSession2*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_participants : Proc(IRTCSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_CanAddParticipants : Proc(IRTCSession2*, Int16*, Win32cr::Foundation::HRESULT),
    get_RedirectedUserURI : Proc(IRTCSession2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RedirectedUserName : Proc(IRTCSession2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    next_redirected_user : Proc(IRTCSession2*, Win32cr::Foundation::HRESULT),
    send_message : Proc(IRTCSession2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    send_message_status : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_MESSAGING_USER_STATUS, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IRTCSession2*, Int32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IRTCSession2*, Int32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    put_EncryptionKey : Proc(IRTCSession2*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    send_info : Proc(IRTCSession2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    put_PreferredSecurityLevel : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL, Win32cr::Foundation::HRESULT),
    get_PreferredSecurityLevel : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*, Win32cr::Foundation::HRESULT),
    is_security_enabled : Proc(IRTCSession2*, Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, Int16*, Win32cr::Foundation::HRESULT),
    answer_with_session_description : Proc(IRTCSession2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    re_invite_with_session_description : Proc(IRTCSession2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, LibC::IntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSession2, lpVtbl : IRTCSession2Vtbl* do
    GUID = LibC::GUID.new(0x17d7cdfc_u32, 0xb007_u16, 0x484c_u16, StaticArray[0x99_u8, 0xd2_u8, 0x86_u8, 0xa8_u8, 0xa8_u8, 0x20_u8, 0x99_u8, 0x1d_u8])
    def query_interface(this : IRTCSession2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSession2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSession2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Client(this : IRTCSession2*, ppClient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Client.call(this, ppClient)
    end
    def get_State(this : IRTCSession2*, penState : Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_Type(this : IRTCSession2*, penType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, penType)
    end
    def get_Profile(this : IRTCSession2*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_Participants(this : IRTCSession2*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Participants.call(this, ppCollection)
    end
    def answer(this : IRTCSession2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.answer.call(this)
    end
    def terminate(this : IRTCSession2*, enReason : Win32cr::System::RealTimeCommunications::RTC_TERMINATE_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, enReason)
    end
    def redirect(this : IRTCSession2*, enType : Win32cr::System::RealTimeCommunications::RTC_SESSION_TYPE, bstrLocalPhoneURI : Win32cr::Foundation::BSTR, pProfile : Void*, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redirect.call(this, enType, bstrLocalPhoneURI, pProfile, lFlags)
    end
    def add_participant(this : IRTCSession2*, bstrAddress : Win32cr::Foundation::BSTR, bstrName : Win32cr::Foundation::BSTR, ppParticipant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_participant.call(this, bstrAddress, bstrName, ppParticipant)
    end
    def remove_participant(this : IRTCSession2*, pParticipant : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_participant.call(this, pParticipant)
    end
    def enumerate_participants(this : IRTCSession2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_participants.call(this, ppEnum)
    end
    def get_CanAddParticipants(this : IRTCSession2*, pfCanAdd : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanAddParticipants.call(this, pfCanAdd)
    end
    def get_RedirectedUserURI(this : IRTCSession2*, pbstrUserURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RedirectedUserURI.call(this, pbstrUserURI)
    end
    def get_RedirectedUserName(this : IRTCSession2*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RedirectedUserName.call(this, pbstrUserName)
    end
    def next_redirected_user(this : IRTCSession2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_redirected_user.call(this)
    end
    def send_message(this : IRTCSession2*, bstrMessageHeader : Win32cr::Foundation::BSTR, bstrMessage : Win32cr::Foundation::BSTR, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_message.call(this, bstrMessageHeader, bstrMessage, lCookie)
    end
    def send_message_status(this : IRTCSession2*, enUserStatus : Win32cr::System::RealTimeCommunications::RTC_MESSAGING_USER_STATUS, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_message_status.call(this, enUserStatus, lCookie)
    end
    def add_stream(this : IRTCSession2*, lMediaType : Int32, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, lMediaType, lCookie)
    end
    def remove_stream(this : IRTCSession2*, lMediaType : Int32, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, lMediaType, lCookie)
    end
    def put_EncryptionKey(this : IRTCSession2*, lMediaType : Int32, encryption_key : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EncryptionKey.call(this, lMediaType, encryption_key)
    end
    def send_info(this : IRTCSession2*, bstrInfoHeader : Win32cr::Foundation::BSTR, bstrInfo : Win32cr::Foundation::BSTR, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_info.call(this, bstrInfoHeader, bstrInfo, lCookie)
    end
    def put_PreferredSecurityLevel(this : IRTCSession2*, enSecurityType : Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, enSecurityLevel : Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredSecurityLevel.call(this, enSecurityType, enSecurityLevel)
    end
    def get_PreferredSecurityLevel(this : IRTCSession2*, enSecurityType : Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, penSecurityLevel : Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredSecurityLevel.call(this, enSecurityType, penSecurityLevel)
    end
    def is_security_enabled(this : IRTCSession2*, enSecurityType : Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, pfSecurityEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_security_enabled.call(this, enSecurityType, pfSecurityEnabled)
    end
    def answer_with_session_description(this : IRTCSession2*, bstrContentType : Win32cr::Foundation::BSTR, bstrSessionDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.answer_with_session_description.call(this, bstrContentType, bstrSessionDescription)
    end
    def re_invite_with_session_description(this : IRTCSession2*, bstrContentType : Win32cr::Foundation::BSTR, bstrSessionDescription : Win32cr::Foundation::BSTR, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_invite_with_session_description.call(this, bstrContentType, bstrSessionDescription, lCookie)
    end

  end

  @[Extern]
  record IRTCSessionCallControlVtbl,
    query_interface : Proc(IRTCSessionCallControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionCallControl*, UInt32),
    release : Proc(IRTCSessionCallControl*, UInt32),
    hold : Proc(IRTCSessionCallControl*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    un_hold : Proc(IRTCSessionCallControl*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    forward : Proc(IRTCSessionCallControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refer : Proc(IRTCSessionCallControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_ReferredByURI : Proc(IRTCSessionCallControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ReferredByURI : Proc(IRTCSessionCallControl*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ReferCookie : Proc(IRTCSessionCallControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ReferCookie : Proc(IRTCSessionCallControl*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsReferred : Proc(IRTCSessionCallControl*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionCallControl, lpVtbl : IRTCSessionCallControlVtbl* do
    GUID = LibC::GUID.new(0xe9a50d94_u32, 0x190b_u16, 0x4f82_u16, StaticArray[0x95_u8, 0x30_u8, 0x3b_u8, 0x8e_u8, 0xbf_u8, 0x60_u8, 0x75_u8, 0x8a_u8])
    def query_interface(this : IRTCSessionCallControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionCallControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionCallControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def hold(this : IRTCSessionCallControl*, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hold.call(this, lCookie)
    end
    def un_hold(this : IRTCSessionCallControl*, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_hold.call(this, lCookie)
    end
    def forward(this : IRTCSessionCallControl*, bstrForwardToURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forward.call(this, bstrForwardToURI)
    end
    def refer(this : IRTCSessionCallControl*, bstrReferToURI : Win32cr::Foundation::BSTR, bstrReferCookie : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refer.call(this, bstrReferToURI, bstrReferCookie)
    end
    def put_ReferredByURI(this : IRTCSessionCallControl*, bstrReferredByURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReferredByURI.call(this, bstrReferredByURI)
    end
    def get_ReferredByURI(this : IRTCSessionCallControl*, pbstrReferredByURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReferredByURI.call(this, pbstrReferredByURI)
    end
    def put_ReferCookie(this : IRTCSessionCallControl*, bstrReferCookie : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReferCookie.call(this, bstrReferCookie)
    end
    def get_ReferCookie(this : IRTCSessionCallControl*, pbstrReferCookie : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReferCookie.call(this, pbstrReferCookie)
    end
    def get_IsReferred(this : IRTCSessionCallControl*, pfIsReferred : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsReferred.call(this, pfIsReferred)
    end

  end

  @[Extern]
  record IRTCParticipantVtbl,
    query_interface : Proc(IRTCParticipant*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCParticipant*, UInt32),
    release : Proc(IRTCParticipant*, UInt32),
    get_UserURI : Proc(IRTCParticipant*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCParticipant*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Removable : Proc(IRTCParticipant*, Int16*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCParticipant*, Win32cr::System::RealTimeCommunications::RTC_PARTICIPANT_STATE*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCParticipant*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCParticipant, lpVtbl : IRTCParticipantVtbl* do
    GUID = LibC::GUID.new(0xae86add5_u32, 0x26b1_u16, 0x4414_u16, StaticArray[0xaf_u8, 0x1d_u8, 0xb9_u8, 0x4c_u8, 0xd9_u8, 0x38_u8, 0xd7_u8, 0x39_u8])
    def query_interface(this : IRTCParticipant*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCParticipant*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCParticipant*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_UserURI(this : IRTCParticipant*, pbstrUserURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserURI.call(this, pbstrUserURI)
    end
    def get_Name(this : IRTCParticipant*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_Removable(this : IRTCParticipant*, pfRemovable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Removable.call(this, pfRemovable)
    end
    def get_State(this : IRTCParticipant*, penState : Win32cr::System::RealTimeCommunications::RTC_PARTICIPANT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_Session(this : IRTCParticipant*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end

  end

  @[Extern]
  record IRTCRoamingEventVtbl,
    query_interface : Proc(IRTCRoamingEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCRoamingEvent*, UInt32),
    release : Proc(IRTCRoamingEvent*, UInt32),
    get_type_info_count : Proc(IRTCRoamingEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCRoamingEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCRoamingEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCRoamingEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCRoamingEvent*, Win32cr::System::RealTimeCommunications::RTC_ROAMING_EVENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCRoamingEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCRoamingEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCRoamingEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCRoamingEvent, lpVtbl : IRTCRoamingEventVtbl* do
    GUID = LibC::GUID.new(0x79960a6b_u32, 0xcb1_u16, 0x4dc8_u16, StaticArray[0xa8_u8, 0x5_u8, 0x73_u8, 0x18_u8, 0xe9_u8, 0x99_u8, 0x2_u8, 0xe8_u8])
    def query_interface(this : IRTCRoamingEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCRoamingEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCRoamingEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCRoamingEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCRoamingEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCRoamingEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCRoamingEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_EventType(this : IRTCRoamingEvent*, pEventType : Win32cr::System::RealTimeCommunications::RTC_ROAMING_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, pEventType)
    end
    def get_Profile(this : IRTCRoamingEvent*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_StatusCode(this : IRTCRoamingEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCRoamingEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end

  end

  @[Extern]
  record IRTCProfileEventVtbl,
    query_interface : Proc(IRTCProfileEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCProfileEvent*, UInt32),
    release : Proc(IRTCProfileEvent*, UInt32),
    get_type_info_count : Proc(IRTCProfileEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCProfileEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCProfileEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCProfileEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCProfileEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Cookie : Proc(IRTCProfileEvent*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCProfileEvent*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCProfileEvent, lpVtbl : IRTCProfileEventVtbl* do
    GUID = LibC::GUID.new(0xd6d5ab3b_u32, 0x770e_u16, 0x43e8_u16, StaticArray[0x80_u8, 0xa_u8, 0x79_u8, 0xb0_u8, 0x62_u8, 0x39_u8, 0x5f_u8, 0xca_u8])
    def query_interface(this : IRTCProfileEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCProfileEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCProfileEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCProfileEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCProfileEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCProfileEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCProfileEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Profile(this : IRTCProfileEvent*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_Cookie(this : IRTCProfileEvent*, plCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cookie.call(this, plCookie)
    end
    def get_StatusCode(this : IRTCProfileEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end

  end

  @[Extern]
  record IRTCProfileEvent2Vtbl,
    query_interface : Proc(IRTCProfileEvent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCProfileEvent2*, UInt32),
    release : Proc(IRTCProfileEvent2*, UInt32),
    get_type_info_count : Proc(IRTCProfileEvent2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCProfileEvent2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCProfileEvent2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCProfileEvent2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCProfileEvent2*, Void**, Win32cr::Foundation::HRESULT),
    get_Cookie : Proc(IRTCProfileEvent2*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCProfileEvent2*, Int32*, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCProfileEvent2*, Win32cr::System::RealTimeCommunications::RTC_PROFILE_EVENT_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCProfileEvent2, lpVtbl : IRTCProfileEvent2Vtbl* do
    GUID = LibC::GUID.new(0x62e56edc_u32, 0x3fa_u16, 0x4121_u16, StaticArray[0x94_u8, 0xfb_u8, 0x23_u8, 0x49_u8, 0x3f_u8, 0xd0_u8, 0xae_u8, 0x64_u8])
    def query_interface(this : IRTCProfileEvent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCProfileEvent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCProfileEvent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCProfileEvent2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCProfileEvent2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCProfileEvent2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCProfileEvent2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Profile(this : IRTCProfileEvent2*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_Cookie(this : IRTCProfileEvent2*, plCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cookie.call(this, plCookie)
    end
    def get_StatusCode(this : IRTCProfileEvent2*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_EventType(this : IRTCProfileEvent2*, pEventType : Win32cr::System::RealTimeCommunications::RTC_PROFILE_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, pEventType)
    end

  end

  @[Extern]
  record IRTCClientEventVtbl,
    query_interface : Proc(IRTCClientEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClientEvent*, UInt32),
    release : Proc(IRTCClientEvent*, UInt32),
    get_type_info_count : Proc(IRTCClientEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCClientEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCClientEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCClientEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCClientEvent*, Win32cr::System::RealTimeCommunications::RTC_CLIENT_EVENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_Client : Proc(IRTCClientEvent*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClientEvent, lpVtbl : IRTCClientEventVtbl* do
    GUID = LibC::GUID.new(0x2b493b7a_u32, 0x3cba_u16, 0x4170_u16, StaticArray[0x9c_u8, 0x8b_u8, 0x76_u8, 0xa9_u8, 0xda_u8, 0xcd_u8, 0xd6_u8, 0x44_u8])
    def query_interface(this : IRTCClientEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClientEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClientEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCClientEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCClientEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCClientEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCClientEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_EventType(this : IRTCClientEvent*, penEventType : Win32cr::System::RealTimeCommunications::RTC_CLIENT_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, penEventType)
    end
    def get_Client(this : IRTCClientEvent*, ppClient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Client.call(this, ppClient)
    end

  end

  @[Extern]
  record IRTCRegistrationStateChangeEventVtbl,
    query_interface : Proc(IRTCRegistrationStateChangeEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCRegistrationStateChangeEvent*, UInt32),
    release : Proc(IRTCRegistrationStateChangeEvent*, UInt32),
    get_type_info_count : Proc(IRTCRegistrationStateChangeEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCRegistrationStateChangeEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCRegistrationStateChangeEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCRegistrationStateChangeEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCRegistrationStateChangeEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCRegistrationStateChangeEvent*, Win32cr::System::RealTimeCommunications::RTC_REGISTRATION_STATE*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCRegistrationStateChangeEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCRegistrationStateChangeEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCRegistrationStateChangeEvent, lpVtbl : IRTCRegistrationStateChangeEventVtbl* do
    GUID = LibC::GUID.new(0x62d0991b_u32, 0x50ab_u16, 0x4f02_u16, StaticArray[0xb9_u8, 0x48_u8, 0xca_u8, 0x94_u8, 0xf2_u8, 0x6f_u8, 0x8f_u8, 0x95_u8])
    def query_interface(this : IRTCRegistrationStateChangeEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCRegistrationStateChangeEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCRegistrationStateChangeEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCRegistrationStateChangeEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCRegistrationStateChangeEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCRegistrationStateChangeEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCRegistrationStateChangeEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Profile(this : IRTCRegistrationStateChangeEvent*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_State(this : IRTCRegistrationStateChangeEvent*, penState : Win32cr::System::RealTimeCommunications::RTC_REGISTRATION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_StatusCode(this : IRTCRegistrationStateChangeEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCRegistrationStateChangeEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end

  end

  @[Extern]
  record IRTCSessionStateChangeEventVtbl,
    query_interface : Proc(IRTCSessionStateChangeEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionStateChangeEvent*, UInt32),
    release : Proc(IRTCSessionStateChangeEvent*, UInt32),
    get_type_info_count : Proc(IRTCSessionStateChangeEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCSessionStateChangeEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCSessionStateChangeEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCSessionStateChangeEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCSessionStateChangeEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCSessionStateChangeEvent*, Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCSessionStateChangeEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCSessionStateChangeEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionStateChangeEvent, lpVtbl : IRTCSessionStateChangeEventVtbl* do
    GUID = LibC::GUID.new(0xb5bad703_u32, 0x5952_u16, 0x48b3_u16, StaticArray[0x93_u8, 0x21_u8, 0x7f_u8, 0x45_u8, 0x0_u8, 0x52_u8, 0x15_u8, 0x6_u8])
    def query_interface(this : IRTCSessionStateChangeEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionStateChangeEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionStateChangeEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCSessionStateChangeEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCSessionStateChangeEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCSessionStateChangeEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCSessionStateChangeEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCSessionStateChangeEvent*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_State(this : IRTCSessionStateChangeEvent*, penState : Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_StatusCode(this : IRTCSessionStateChangeEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCSessionStateChangeEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end

  end

  @[Extern]
  record IRTCSessionStateChangeEvent2Vtbl,
    query_interface : Proc(IRTCSessionStateChangeEvent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionStateChangeEvent2*, UInt32),
    release : Proc(IRTCSessionStateChangeEvent2*, UInt32),
    get_type_info_count : Proc(IRTCSessionStateChangeEvent2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCSessionStateChangeEvent2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCSessionStateChangeEvent2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCSessionStateChangeEvent2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCSessionStateChangeEvent2*, Void**, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCSessionStateChangeEvent2*, Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCSessionStateChangeEvent2*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCSessionStateChangeEvent2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MediaTypes : Proc(IRTCSessionStateChangeEvent2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RemotePreferredSecurityLevel : Proc(IRTCSessionStateChangeEvent2*, Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*, Win32cr::Foundation::HRESULT),
    get_IsForked : Proc(IRTCSessionStateChangeEvent2*, Int16*, Win32cr::Foundation::HRESULT),
    get_remote_session_description : Proc(IRTCSessionStateChangeEvent2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionStateChangeEvent2, lpVtbl : IRTCSessionStateChangeEvent2Vtbl* do
    GUID = LibC::GUID.new(0x4f933171_u32, 0x6f95_u16, 0x4880_u16, StaticArray[0x80_u8, 0xd9_u8, 0x2e_u8, 0xc8_u8, 0xd4_u8, 0x95_u8, 0xd2_u8, 0x61_u8])
    def query_interface(this : IRTCSessionStateChangeEvent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionStateChangeEvent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionStateChangeEvent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCSessionStateChangeEvent2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCSessionStateChangeEvent2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCSessionStateChangeEvent2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCSessionStateChangeEvent2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCSessionStateChangeEvent2*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_State(this : IRTCSessionStateChangeEvent2*, penState : Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_StatusCode(this : IRTCSessionStateChangeEvent2*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCSessionStateChangeEvent2*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end
    def get_MediaTypes(this : IRTCSessionStateChangeEvent2*, pMediaTypes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MediaTypes.call(this, pMediaTypes)
    end
    def get_RemotePreferredSecurityLevel(this : IRTCSessionStateChangeEvent2*, enSecurityType : Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, penSecurityLevel : Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemotePreferredSecurityLevel.call(this, enSecurityType, penSecurityLevel)
    end
    def get_IsForked(this : IRTCSessionStateChangeEvent2*, pfIsForked : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsForked.call(this, pfIsForked)
    end
    def get_remote_session_description(this : IRTCSessionStateChangeEvent2*, pbstrContentType : Win32cr::Foundation::BSTR*, pbstrSessionDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_session_description.call(this, pbstrContentType, pbstrSessionDescription)
    end

  end

  @[Extern]
  record IRTCSessionOperationCompleteEventVtbl,
    query_interface : Proc(IRTCSessionOperationCompleteEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionOperationCompleteEvent*, UInt32),
    release : Proc(IRTCSessionOperationCompleteEvent*, UInt32),
    get_type_info_count : Proc(IRTCSessionOperationCompleteEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCSessionOperationCompleteEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCSessionOperationCompleteEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCSessionOperationCompleteEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCSessionOperationCompleteEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Cookie : Proc(IRTCSessionOperationCompleteEvent*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCSessionOperationCompleteEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCSessionOperationCompleteEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionOperationCompleteEvent, lpVtbl : IRTCSessionOperationCompleteEventVtbl* do
    GUID = LibC::GUID.new(0xa6bff4c0_u32, 0xf7c8_u16, 0x4d3c_u16, StaticArray[0x9a_u8, 0x41_u8, 0x35_u8, 0x50_u8, 0xf7_u8, 0x8a_u8, 0x95_u8, 0xb0_u8])
    def query_interface(this : IRTCSessionOperationCompleteEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionOperationCompleteEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionOperationCompleteEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCSessionOperationCompleteEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCSessionOperationCompleteEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCSessionOperationCompleteEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCSessionOperationCompleteEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCSessionOperationCompleteEvent*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_Cookie(this : IRTCSessionOperationCompleteEvent*, plCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cookie.call(this, plCookie)
    end
    def get_StatusCode(this : IRTCSessionOperationCompleteEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCSessionOperationCompleteEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end

  end

  @[Extern]
  record IRTCSessionOperationCompleteEvent2Vtbl,
    query_interface : Proc(IRTCSessionOperationCompleteEvent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionOperationCompleteEvent2*, UInt32),
    release : Proc(IRTCSessionOperationCompleteEvent2*, UInt32),
    get_type_info_count : Proc(IRTCSessionOperationCompleteEvent2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCSessionOperationCompleteEvent2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCSessionOperationCompleteEvent2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCSessionOperationCompleteEvent2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCSessionOperationCompleteEvent2*, Void**, Win32cr::Foundation::HRESULT),
    get_Cookie : Proc(IRTCSessionOperationCompleteEvent2*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCSessionOperationCompleteEvent2*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCSessionOperationCompleteEvent2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Participant : Proc(IRTCSessionOperationCompleteEvent2*, Void**, Win32cr::Foundation::HRESULT),
    get_remote_session_description : Proc(IRTCSessionOperationCompleteEvent2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionOperationCompleteEvent2, lpVtbl : IRTCSessionOperationCompleteEvent2Vtbl* do
    GUID = LibC::GUID.new(0xf6fc2a9b_u32, 0xd5bc_u16, 0x4241_u16, StaticArray[0xb4_u8, 0x36_u8, 0x1b_u8, 0x84_u8, 0x60_u8, 0xc1_u8, 0x38_u8, 0x32_u8])
    def query_interface(this : IRTCSessionOperationCompleteEvent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionOperationCompleteEvent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionOperationCompleteEvent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCSessionOperationCompleteEvent2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCSessionOperationCompleteEvent2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCSessionOperationCompleteEvent2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCSessionOperationCompleteEvent2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCSessionOperationCompleteEvent2*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_Cookie(this : IRTCSessionOperationCompleteEvent2*, plCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cookie.call(this, plCookie)
    end
    def get_StatusCode(this : IRTCSessionOperationCompleteEvent2*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCSessionOperationCompleteEvent2*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end
    def get_Participant(this : IRTCSessionOperationCompleteEvent2*, ppParticipant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Participant.call(this, ppParticipant)
    end
    def get_remote_session_description(this : IRTCSessionOperationCompleteEvent2*, pbstrContentType : Win32cr::Foundation::BSTR*, pbstrSessionDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_session_description.call(this, pbstrContentType, pbstrSessionDescription)
    end

  end

  @[Extern]
  record IRTCParticipantStateChangeEventVtbl,
    query_interface : Proc(IRTCParticipantStateChangeEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCParticipantStateChangeEvent*, UInt32),
    release : Proc(IRTCParticipantStateChangeEvent*, UInt32),
    get_type_info_count : Proc(IRTCParticipantStateChangeEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCParticipantStateChangeEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCParticipantStateChangeEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCParticipantStateChangeEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Participant : Proc(IRTCParticipantStateChangeEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCParticipantStateChangeEvent*, Win32cr::System::RealTimeCommunications::RTC_PARTICIPANT_STATE*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCParticipantStateChangeEvent*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCParticipantStateChangeEvent, lpVtbl : IRTCParticipantStateChangeEventVtbl* do
    GUID = LibC::GUID.new(0x9bcb597_u32, 0xf0fa_u16, 0x48f9_u16, StaticArray[0xb4_u8, 0x20_u8, 0x46_u8, 0x8c_u8, 0xea_u8, 0x7f_u8, 0xde_u8, 0x4_u8])
    def query_interface(this : IRTCParticipantStateChangeEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCParticipantStateChangeEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCParticipantStateChangeEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCParticipantStateChangeEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCParticipantStateChangeEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCParticipantStateChangeEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCParticipantStateChangeEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Participant(this : IRTCParticipantStateChangeEvent*, ppParticipant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Participant.call(this, ppParticipant)
    end
    def get_State(this : IRTCParticipantStateChangeEvent*, penState : Win32cr::System::RealTimeCommunications::RTC_PARTICIPANT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def get_StatusCode(this : IRTCParticipantStateChangeEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end

  end

  @[Extern]
  record IRTCMediaEventVtbl,
    query_interface : Proc(IRTCMediaEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCMediaEvent*, UInt32),
    release : Proc(IRTCMediaEvent*, UInt32),
    get_type_info_count : Proc(IRTCMediaEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCMediaEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCMediaEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCMediaEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_MediaType : Proc(IRTCMediaEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCMediaEvent*, Win32cr::System::RealTimeCommunications::RTC_MEDIA_EVENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_EventReason : Proc(IRTCMediaEvent*, Win32cr::System::RealTimeCommunications::RTC_MEDIA_EVENT_REASON*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCMediaEvent, lpVtbl : IRTCMediaEventVtbl* do
    GUID = LibC::GUID.new(0x99944fb_u32, 0xbcda_u16, 0x453e_u16, StaticArray[0x8c_u8, 0x41_u8, 0xe1_u8, 0x3d_u8, 0xa2_u8, 0xad_u8, 0xf7_u8, 0xf3_u8])
    def query_interface(this : IRTCMediaEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCMediaEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCMediaEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCMediaEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCMediaEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCMediaEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCMediaEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_MediaType(this : IRTCMediaEvent*, pMediaType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MediaType.call(this, pMediaType)
    end
    def get_EventType(this : IRTCMediaEvent*, penEventType : Win32cr::System::RealTimeCommunications::RTC_MEDIA_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, penEventType)
    end
    def get_EventReason(this : IRTCMediaEvent*, penEventReason : Win32cr::System::RealTimeCommunications::RTC_MEDIA_EVENT_REASON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventReason.call(this, penEventReason)
    end

  end

  @[Extern]
  record IRTCIntensityEventVtbl,
    query_interface : Proc(IRTCIntensityEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCIntensityEvent*, UInt32),
    release : Proc(IRTCIntensityEvent*, UInt32),
    get_type_info_count : Proc(IRTCIntensityEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCIntensityEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCIntensityEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCIntensityEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Level : Proc(IRTCIntensityEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_Min : Proc(IRTCIntensityEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_Max : Proc(IRTCIntensityEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_Direction : Proc(IRTCIntensityEvent*, Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCIntensityEvent, lpVtbl : IRTCIntensityEventVtbl* do
    GUID = LibC::GUID.new(0x4c23bf51_u32, 0x390c_u16, 0x4992_u16, StaticArray[0xa4_u8, 0x1d_u8, 0x41_u8, 0xee_u8, 0xc0_u8, 0x5b_u8, 0x2a_u8, 0x4b_u8])
    def query_interface(this : IRTCIntensityEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCIntensityEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCIntensityEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCIntensityEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCIntensityEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCIntensityEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCIntensityEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Level(this : IRTCIntensityEvent*, plLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Level.call(this, plLevel)
    end
    def get_Min(this : IRTCIntensityEvent*, plMin : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Min.call(this, plMin)
    end
    def get_Max(this : IRTCIntensityEvent*, plMax : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Max.call(this, plMax)
    end
    def get_Direction(this : IRTCIntensityEvent*, penDirection : Win32cr::System::RealTimeCommunications::RTC_AUDIO_DEVICE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Direction.call(this, penDirection)
    end

  end

  @[Extern]
  record IRTCMessagingEventVtbl,
    query_interface : Proc(IRTCMessagingEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCMessagingEvent*, UInt32),
    release : Proc(IRTCMessagingEvent*, UInt32),
    get_type_info_count : Proc(IRTCMessagingEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCMessagingEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCMessagingEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCMessagingEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCMessagingEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Participant : Proc(IRTCMessagingEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCMessagingEvent*, Win32cr::System::RealTimeCommunications::RTC_MESSAGING_EVENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IRTCMessagingEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MessageHeader : Proc(IRTCMessagingEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserStatus : Proc(IRTCMessagingEvent*, Win32cr::System::RealTimeCommunications::RTC_MESSAGING_USER_STATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCMessagingEvent, lpVtbl : IRTCMessagingEventVtbl* do
    GUID = LibC::GUID.new(0xd3609541_u32, 0x1b29_u16, 0x4de5_u16, StaticArray[0xa4_u8, 0xad_u8, 0x5a_u8, 0xeb_u8, 0xaf_u8, 0x31_u8, 0x95_u8, 0x12_u8])
    def query_interface(this : IRTCMessagingEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCMessagingEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCMessagingEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCMessagingEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCMessagingEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCMessagingEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCMessagingEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCMessagingEvent*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_Participant(this : IRTCMessagingEvent*, ppParticipant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Participant.call(this, ppParticipant)
    end
    def get_EventType(this : IRTCMessagingEvent*, penEventType : Win32cr::System::RealTimeCommunications::RTC_MESSAGING_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, penEventType)
    end
    def get_Message(this : IRTCMessagingEvent*, pbstrMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, pbstrMessage)
    end
    def get_MessageHeader(this : IRTCMessagingEvent*, pbstrMessageHeader : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageHeader.call(this, pbstrMessageHeader)
    end
    def get_UserStatus(this : IRTCMessagingEvent*, penUserStatus : Win32cr::System::RealTimeCommunications::RTC_MESSAGING_USER_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserStatus.call(this, penUserStatus)
    end

  end

  @[Extern]
  record IRTCBuddyEventVtbl,
    query_interface : Proc(IRTCBuddyEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCBuddyEvent*, UInt32),
    release : Proc(IRTCBuddyEvent*, UInt32),
    get_type_info_count : Proc(IRTCBuddyEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCBuddyEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCBuddyEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCBuddyEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Buddy : Proc(IRTCBuddyEvent*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCBuddyEvent, lpVtbl : IRTCBuddyEventVtbl* do
    GUID = LibC::GUID.new(0xf36d755d_u32, 0x17e6_u16, 0x404e_u16, StaticArray[0x95_u8, 0x4f_u8, 0xf_u8, 0xc0_u8, 0x75_u8, 0x74_u8, 0xc7_u8, 0x8d_u8])
    def query_interface(this : IRTCBuddyEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCBuddyEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCBuddyEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCBuddyEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCBuddyEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCBuddyEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCBuddyEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Buddy(this : IRTCBuddyEvent*, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddy.call(this, ppBuddy)
    end

  end

  @[Extern]
  record IRTCBuddyEvent2Vtbl,
    query_interface : Proc(IRTCBuddyEvent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCBuddyEvent2*, UInt32),
    release : Proc(IRTCBuddyEvent2*, UInt32),
    get_type_info_count : Proc(IRTCBuddyEvent2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCBuddyEvent2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCBuddyEvent2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCBuddyEvent2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Buddy : Proc(IRTCBuddyEvent2*, Void**, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCBuddyEvent2*, Win32cr::System::RealTimeCommunications::RTC_BUDDY_EVENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCBuddyEvent2*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCBuddyEvent2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCBuddyEvent2, lpVtbl : IRTCBuddyEvent2Vtbl* do
    GUID = LibC::GUID.new(0x484a7f1e_u32, 0x73f0_u16, 0x4990_u16, StaticArray[0xbf_u8, 0xc2_u8, 0x60_u8, 0xbc_u8, 0x39_u8, 0x78_u8, 0xa7_u8, 0x20_u8])
    def query_interface(this : IRTCBuddyEvent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCBuddyEvent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCBuddyEvent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCBuddyEvent2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCBuddyEvent2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCBuddyEvent2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCBuddyEvent2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Buddy(this : IRTCBuddyEvent2*, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddy.call(this, ppBuddy)
    end
    def get_EventType(this : IRTCBuddyEvent2*, pEventType : Win32cr::System::RealTimeCommunications::RTC_BUDDY_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, pEventType)
    end
    def get_StatusCode(this : IRTCBuddyEvent2*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCBuddyEvent2*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end

  end

  @[Extern]
  record IRTCWatcherEventVtbl,
    query_interface : Proc(IRTCWatcherEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCWatcherEvent*, UInt32),
    release : Proc(IRTCWatcherEvent*, UInt32),
    get_type_info_count : Proc(IRTCWatcherEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCWatcherEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCWatcherEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCWatcherEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Watcher : Proc(IRTCWatcherEvent*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCWatcherEvent, lpVtbl : IRTCWatcherEventVtbl* do
    GUID = LibC::GUID.new(0xf30d7261_u32, 0x587a_u16, 0x424f_u16, StaticArray[0x82_u8, 0x2c_u8, 0x31_u8, 0x27_u8, 0x88_u8, 0xf4_u8, 0x35_u8, 0x48_u8])
    def query_interface(this : IRTCWatcherEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCWatcherEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCWatcherEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCWatcherEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCWatcherEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCWatcherEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCWatcherEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Watcher(this : IRTCWatcherEvent*, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Watcher.call(this, ppWatcher)
    end

  end

  @[Extern]
  record IRTCWatcherEvent2Vtbl,
    query_interface : Proc(IRTCWatcherEvent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCWatcherEvent2*, UInt32),
    release : Proc(IRTCWatcherEvent2*, UInt32),
    get_type_info_count : Proc(IRTCWatcherEvent2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCWatcherEvent2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCWatcherEvent2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCWatcherEvent2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Watcher : Proc(IRTCWatcherEvent2*, Void**, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCWatcherEvent2*, Win32cr::System::RealTimeCommunications::RTC_WATCHER_EVENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCWatcherEvent2*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCWatcherEvent2, lpVtbl : IRTCWatcherEvent2Vtbl* do
    GUID = LibC::GUID.new(0xe52891e8_u32, 0x188c_u16, 0x49af_u16, StaticArray[0xb0_u8, 0x5_u8, 0x98_u8, 0xed_u8, 0x13_u8, 0xf8_u8, 0x3f_u8, 0x9c_u8])
    def query_interface(this : IRTCWatcherEvent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCWatcherEvent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCWatcherEvent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCWatcherEvent2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCWatcherEvent2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCWatcherEvent2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCWatcherEvent2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Watcher(this : IRTCWatcherEvent2*, ppWatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Watcher.call(this, ppWatcher)
    end
    def get_EventType(this : IRTCWatcherEvent2*, pEventType : Win32cr::System::RealTimeCommunications::RTC_WATCHER_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, pEventType)
    end
    def get_StatusCode(this : IRTCWatcherEvent2*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end

  end

  @[Extern]
  record IRTCBuddyGroupEventVtbl,
    query_interface : Proc(IRTCBuddyGroupEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCBuddyGroupEvent*, UInt32),
    release : Proc(IRTCBuddyGroupEvent*, UInt32),
    get_type_info_count : Proc(IRTCBuddyGroupEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCBuddyGroupEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCBuddyGroupEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCBuddyGroupEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IRTCBuddyGroupEvent*, Win32cr::System::RealTimeCommunications::RTC_GROUP_EVENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_Group : Proc(IRTCBuddyGroupEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Buddy : Proc(IRTCBuddyGroupEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCBuddyGroupEvent*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCBuddyGroupEvent, lpVtbl : IRTCBuddyGroupEventVtbl* do
    GUID = LibC::GUID.new(0x3a79e1d1_u32, 0xb736_u16, 0x4414_u16, StaticArray[0x96_u8, 0xf8_u8, 0xbb_u8, 0xc7_u8, 0xf0_u8, 0x88_u8, 0x63_u8, 0xe4_u8])
    def query_interface(this : IRTCBuddyGroupEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCBuddyGroupEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCBuddyGroupEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCBuddyGroupEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCBuddyGroupEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCBuddyGroupEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCBuddyGroupEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_EventType(this : IRTCBuddyGroupEvent*, pEventType : Win32cr::System::RealTimeCommunications::RTC_GROUP_EVENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, pEventType)
    end
    def get_Group(this : IRTCBuddyGroupEvent*, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Group.call(this, ppGroup)
    end
    def get_Buddy(this : IRTCBuddyGroupEvent*, ppBuddy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddy.call(this, ppBuddy)
    end
    def get_StatusCode(this : IRTCBuddyGroupEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end

  end

  @[Extern]
  record IRTCInfoEventVtbl,
    query_interface : Proc(IRTCInfoEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCInfoEvent*, UInt32),
    release : Proc(IRTCInfoEvent*, UInt32),
    get_type_info_count : Proc(IRTCInfoEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCInfoEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCInfoEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCInfoEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCInfoEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Participant : Proc(IRTCInfoEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Info : Proc(IRTCInfoEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_InfoHeader : Proc(IRTCInfoEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCInfoEvent, lpVtbl : IRTCInfoEventVtbl* do
    GUID = LibC::GUID.new(0x4e1d68ae_u32, 0x1912_u16, 0x4f49_u16, StaticArray[0xb2_u8, 0xc3_u8, 0x59_u8, 0x4f_u8, 0xad_u8, 0xfd_u8, 0x42_u8, 0x5f_u8])
    def query_interface(this : IRTCInfoEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCInfoEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCInfoEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCInfoEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCInfoEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCInfoEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCInfoEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCInfoEvent*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_Participant(this : IRTCInfoEvent*, ppParticipant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Participant.call(this, ppParticipant)
    end
    def get_Info(this : IRTCInfoEvent*, pbstrInfo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Info.call(this, pbstrInfo)
    end
    def get_InfoHeader(this : IRTCInfoEvent*, pbstrInfoHeader : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InfoHeader.call(this, pbstrInfoHeader)
    end

  end

  @[Extern]
  record IRTCMediaRequestEventVtbl,
    query_interface : Proc(IRTCMediaRequestEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCMediaRequestEvent*, UInt32),
    release : Proc(IRTCMediaRequestEvent*, UInt32),
    get_type_info_count : Proc(IRTCMediaRequestEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCMediaRequestEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCMediaRequestEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCMediaRequestEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCMediaRequestEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_ProposedMedia : Proc(IRTCMediaRequestEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentMedia : Proc(IRTCMediaRequestEvent*, Int32*, Win32cr::Foundation::HRESULT),
    accept : Proc(IRTCMediaRequestEvent*, Int32, Win32cr::Foundation::HRESULT),
    get_RemotePreferredSecurityLevel : Proc(IRTCMediaRequestEvent*, Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*, Win32cr::Foundation::HRESULT),
    reject : Proc(IRTCMediaRequestEvent*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCMediaRequestEvent*, Win32cr::System::RealTimeCommunications::RTC_REINVITE_STATE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCMediaRequestEvent, lpVtbl : IRTCMediaRequestEventVtbl* do
    GUID = LibC::GUID.new(0x52572d15_u32, 0x148c_u16, 0x4d97_u16, StaticArray[0xa3_u8, 0x6c_u8, 0x2d_u8, 0xa5_u8, 0x5c_u8, 0x28_u8, 0x9d_u8, 0x63_u8])
    def query_interface(this : IRTCMediaRequestEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCMediaRequestEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCMediaRequestEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCMediaRequestEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCMediaRequestEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCMediaRequestEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCMediaRequestEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCMediaRequestEvent*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_ProposedMedia(this : IRTCMediaRequestEvent*, plMediaTypes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProposedMedia.call(this, plMediaTypes)
    end
    def get_CurrentMedia(this : IRTCMediaRequestEvent*, plMediaTypes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentMedia.call(this, plMediaTypes)
    end
    def accept(this : IRTCMediaRequestEvent*, lMediaTypes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept.call(this, lMediaTypes)
    end
    def get_RemotePreferredSecurityLevel(this : IRTCMediaRequestEvent*, enSecurityType : Win32cr::System::RealTimeCommunications::RTC_SECURITY_TYPE, penSecurityLevel : Win32cr::System::RealTimeCommunications::RTC_SECURITY_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemotePreferredSecurityLevel.call(this, enSecurityType, penSecurityLevel)
    end
    def reject(this : IRTCMediaRequestEvent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reject.call(this)
    end
    def get_State(this : IRTCMediaRequestEvent*, pState : Win32cr::System::RealTimeCommunications::RTC_REINVITE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pState)
    end

  end

  @[Extern]
  record IRTCReInviteEventVtbl,
    query_interface : Proc(IRTCReInviteEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCReInviteEvent*, UInt32),
    release : Proc(IRTCReInviteEvent*, UInt32),
    get_type_info_count : Proc(IRTCReInviteEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCReInviteEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCReInviteEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCReInviteEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCReInviteEvent*, Void**, Win32cr::Foundation::HRESULT),
    accept : Proc(IRTCReInviteEvent*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    reject : Proc(IRTCReInviteEvent*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCReInviteEvent*, Win32cr::System::RealTimeCommunications::RTC_REINVITE_STATE*, Win32cr::Foundation::HRESULT),
    get_remote_session_description : Proc(IRTCReInviteEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCReInviteEvent, lpVtbl : IRTCReInviteEventVtbl* do
    GUID = LibC::GUID.new(0x11558d84_u32, 0x204c_u16, 0x43e7_u16, StaticArray[0x99_u8, 0xb0_u8, 0x20_u8, 0x34_u8, 0xe9_u8, 0x41_u8, 0x7f_u8, 0x7d_u8])
    def query_interface(this : IRTCReInviteEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCReInviteEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCReInviteEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCReInviteEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCReInviteEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCReInviteEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCReInviteEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCReInviteEvent*, ppSession2 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession2)
    end
    def accept(this : IRTCReInviteEvent*, bstrContentType : Win32cr::Foundation::BSTR, bstrSessionDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept.call(this, bstrContentType, bstrSessionDescription)
    end
    def reject(this : IRTCReInviteEvent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reject.call(this)
    end
    def get_State(this : IRTCReInviteEvent*, pState : Win32cr::System::RealTimeCommunications::RTC_REINVITE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pState)
    end
    def get_remote_session_description(this : IRTCReInviteEvent*, pbstrContentType : Win32cr::Foundation::BSTR*, pbstrSessionDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_session_description.call(this, pbstrContentType, pbstrSessionDescription)
    end

  end

  @[Extern]
  record IRTCPresencePropertyEventVtbl,
    query_interface : Proc(IRTCPresencePropertyEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCPresencePropertyEvent*, UInt32),
    release : Proc(IRTCPresencePropertyEvent*, UInt32),
    get_type_info_count : Proc(IRTCPresencePropertyEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCPresencePropertyEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCPresencePropertyEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCPresencePropertyEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCPresencePropertyEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCPresencePropertyEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PresenceProperty : Proc(IRTCPresencePropertyEvent*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IRTCPresencePropertyEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCPresencePropertyEvent, lpVtbl : IRTCPresencePropertyEventVtbl* do
    GUID = LibC::GUID.new(0xf777f570_u32, 0xa820_u16, 0x49d5_u16, StaticArray[0x86_u8, 0xbd_u8, 0xe0_u8, 0x99_u8, 0x49_u8, 0x3f_u8, 0x15_u8, 0x18_u8])
    def query_interface(this : IRTCPresencePropertyEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCPresencePropertyEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCPresencePropertyEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCPresencePropertyEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCPresencePropertyEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCPresencePropertyEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCPresencePropertyEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_StatusCode(this : IRTCPresencePropertyEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCPresencePropertyEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end
    def get_PresenceProperty(this : IRTCPresencePropertyEvent*, penPresProp : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresenceProperty.call(this, penPresProp)
    end
    def get_Value(this : IRTCPresencePropertyEvent*, pbstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pbstrValue)
    end

  end

  @[Extern]
  record IRTCPresenceDataEventVtbl,
    query_interface : Proc(IRTCPresenceDataEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCPresenceDataEvent*, UInt32),
    release : Proc(IRTCPresenceDataEvent*, UInt32),
    get_type_info_count : Proc(IRTCPresenceDataEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCPresenceDataEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCPresenceDataEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCPresenceDataEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCPresenceDataEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCPresenceDataEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_presence_data : Proc(IRTCPresenceDataEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCPresenceDataEvent, lpVtbl : IRTCPresenceDataEventVtbl* do
    GUID = LibC::GUID.new(0x38f0e78c_u32, 0x8b87_u16, 0x4c04_u16, StaticArray[0xa8_u8, 0x2d_u8, 0xae_u8, 0xdd_u8, 0x83_u8, 0xc9_u8, 0x9_u8, 0xbb_u8])
    def query_interface(this : IRTCPresenceDataEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCPresenceDataEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCPresenceDataEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCPresenceDataEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCPresenceDataEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCPresenceDataEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCPresenceDataEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_StatusCode(this : IRTCPresenceDataEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCPresenceDataEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end
    def get_presence_data(this : IRTCPresenceDataEvent*, pbstrNamespace : Win32cr::Foundation::BSTR*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_presence_data.call(this, pbstrNamespace, pbstrData)
    end

  end

  @[Extern]
  record IRTCPresenceStatusEventVtbl,
    query_interface : Proc(IRTCPresenceStatusEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCPresenceStatusEvent*, UInt32),
    release : Proc(IRTCPresenceStatusEvent*, UInt32),
    get_type_info_count : Proc(IRTCPresenceStatusEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCPresenceStatusEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCPresenceStatusEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCPresenceStatusEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCPresenceStatusEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCPresenceStatusEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_local_presence_info : Proc(IRTCPresenceStatusEvent*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCPresenceStatusEvent, lpVtbl : IRTCPresenceStatusEventVtbl* do
    GUID = LibC::GUID.new(0x78673f32_u32, 0x4a0f_u16, 0x462c_u16, StaticArray[0x89_u8, 0xaa_u8, 0xee_u8, 0x77_u8, 0x6_u8, 0x70_u8, 0x76_u8, 0x78_u8])
    def query_interface(this : IRTCPresenceStatusEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCPresenceStatusEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCPresenceStatusEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCPresenceStatusEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCPresenceStatusEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCPresenceStatusEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCPresenceStatusEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_StatusCode(this : IRTCPresenceStatusEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCPresenceStatusEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end
    def get_local_presence_info(this : IRTCPresenceStatusEvent*, penStatus : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*, pbstrNotes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_presence_info.call(this, penStatus, pbstrNotes)
    end

  end

  @[Extern]
  record IRTCCollectionVtbl,
    query_interface : Proc(IRTCCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCCollection*, UInt32),
    release : Proc(IRTCCollection*, UInt32),
    get_type_info_count : Proc(IRTCCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IRTCCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRTCCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRTCCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCCollection, lpVtbl : IRTCCollectionVtbl* do
    GUID = LibC::GUID.new(0xec7c8096_u32, 0xb918_u16, 0x4044_u16, StaticArray[0x94_u8, 0xf1_u8, 0xe4_u8, 0xfb_u8, 0xa0_u8, 0x36_u8, 0x1d_u8, 0x5c_u8])
    def query_interface(this : IRTCCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IRTCCollection*, lCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, lCount)
    end
    def get_Item(this : IRTCCollection*, index : Int32, pVariant : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pVariant)
    end
    def get__NewEnum(this : IRTCCollection*, ppNewEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppNewEnum)
    end

  end

  @[Extern]
  record IRTCEnumParticipantsVtbl,
    query_interface : Proc(IRTCEnumParticipants*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEnumParticipants*, UInt32),
    release : Proc(IRTCEnumParticipants*, UInt32),
    next__ : Proc(IRTCEnumParticipants*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRTCEnumParticipants*, Win32cr::Foundation::HRESULT),
    skip : Proc(IRTCEnumParticipants*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IRTCEnumParticipants*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEnumParticipants, lpVtbl : IRTCEnumParticipantsVtbl* do
    GUID = LibC::GUID.new(0xfcd56f29_u32, 0x4a4f_u16, 0x41b2_u16, StaticArray[0xba_u8, 0x5c_u8, 0xf5_u8, 0xbc_u8, 0xcc_u8, 0x6_u8, 0xb_u8, 0xf6_u8])
    def query_interface(this : IRTCEnumParticipants*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEnumParticipants*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEnumParticipants*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IRTCEnumParticipants*, celt : UInt32, ppElements : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppElements, pceltFetched)
    end
    def reset(this : IRTCEnumParticipants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IRTCEnumParticipants*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def clone(this : IRTCEnumParticipants*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRTCEnumProfilesVtbl,
    query_interface : Proc(IRTCEnumProfiles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEnumProfiles*, UInt32),
    release : Proc(IRTCEnumProfiles*, UInt32),
    next__ : Proc(IRTCEnumProfiles*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRTCEnumProfiles*, Win32cr::Foundation::HRESULT),
    skip : Proc(IRTCEnumProfiles*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IRTCEnumProfiles*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEnumProfiles, lpVtbl : IRTCEnumProfilesVtbl* do
    GUID = LibC::GUID.new(0x29b7c41c_u32, 0xed82_u16, 0x4bca_u16, StaticArray[0x84_u8, 0xad_u8, 0x39_u8, 0xd5_u8, 0x10_u8, 0x1b_u8, 0x58_u8, 0xe3_u8])
    def query_interface(this : IRTCEnumProfiles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEnumProfiles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEnumProfiles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IRTCEnumProfiles*, celt : UInt32, ppElements : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppElements, pceltFetched)
    end
    def reset(this : IRTCEnumProfiles*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IRTCEnumProfiles*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def clone(this : IRTCEnumProfiles*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRTCEnumBuddiesVtbl,
    query_interface : Proc(IRTCEnumBuddies*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEnumBuddies*, UInt32),
    release : Proc(IRTCEnumBuddies*, UInt32),
    next__ : Proc(IRTCEnumBuddies*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRTCEnumBuddies*, Win32cr::Foundation::HRESULT),
    skip : Proc(IRTCEnumBuddies*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IRTCEnumBuddies*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEnumBuddies, lpVtbl : IRTCEnumBuddiesVtbl* do
    GUID = LibC::GUID.new(0xf7296917_u32, 0x5569_u16, 0x4b3b_u16, StaticArray[0xb3_u8, 0xaf_u8, 0x98_u8, 0xd1_u8, 0x14_u8, 0x4b_u8, 0x2b_u8, 0x87_u8])
    def query_interface(this : IRTCEnumBuddies*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEnumBuddies*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEnumBuddies*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IRTCEnumBuddies*, celt : UInt32, ppElements : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppElements, pceltFetched)
    end
    def reset(this : IRTCEnumBuddies*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IRTCEnumBuddies*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def clone(this : IRTCEnumBuddies*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRTCEnumWatchersVtbl,
    query_interface : Proc(IRTCEnumWatchers*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEnumWatchers*, UInt32),
    release : Proc(IRTCEnumWatchers*, UInt32),
    next__ : Proc(IRTCEnumWatchers*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRTCEnumWatchers*, Win32cr::Foundation::HRESULT),
    skip : Proc(IRTCEnumWatchers*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IRTCEnumWatchers*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEnumWatchers, lpVtbl : IRTCEnumWatchersVtbl* do
    GUID = LibC::GUID.new(0xa87d55d7_u32, 0xdb74_u16, 0x4ed1_u16, StaticArray[0x9c_u8, 0xa4_u8, 0x77_u8, 0xa0_u8, 0xe4_u8, 0x1b_u8, 0x41_u8, 0x3e_u8])
    def query_interface(this : IRTCEnumWatchers*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEnumWatchers*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEnumWatchers*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IRTCEnumWatchers*, celt : UInt32, ppElements : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppElements, pceltFetched)
    end
    def reset(this : IRTCEnumWatchers*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IRTCEnumWatchers*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def clone(this : IRTCEnumWatchers*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRTCEnumGroupsVtbl,
    query_interface : Proc(IRTCEnumGroups*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEnumGroups*, UInt32),
    release : Proc(IRTCEnumGroups*, UInt32),
    next__ : Proc(IRTCEnumGroups*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRTCEnumGroups*, Win32cr::Foundation::HRESULT),
    skip : Proc(IRTCEnumGroups*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IRTCEnumGroups*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEnumGroups, lpVtbl : IRTCEnumGroupsVtbl* do
    GUID = LibC::GUID.new(0x742378d6_u32, 0xa141_u16, 0x4415_u16, StaticArray[0x8f_u8, 0x27_u8, 0x35_u8, 0xd9_u8, 0x90_u8, 0x76_u8, 0xcf_u8, 0x5d_u8])
    def query_interface(this : IRTCEnumGroups*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEnumGroups*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEnumGroups*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IRTCEnumGroups*, celt : UInt32, ppElements : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppElements, pceltFetched)
    end
    def reset(this : IRTCEnumGroups*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IRTCEnumGroups*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def clone(this : IRTCEnumGroups*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRTCPresenceContactVtbl,
    query_interface : Proc(IRTCPresenceContact*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCPresenceContact*, UInt32),
    release : Proc(IRTCPresenceContact*, UInt32),
    get_PresentityURI : Proc(IRTCPresenceContact*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PresentityURI : Proc(IRTCPresenceContact*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCPresenceContact*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IRTCPresenceContact*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IRTCPresenceContact*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IRTCPresenceContact*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Persistent : Proc(IRTCPresenceContact*, Int16*, Win32cr::Foundation::HRESULT),
    put_Persistent : Proc(IRTCPresenceContact*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCPresenceContact, lpVtbl : IRTCPresenceContactVtbl* do
    GUID = LibC::GUID.new(0x8b22f92c_u32, 0xcd90_u16, 0x42db_u16, StaticArray[0xa7_u8, 0x33_u8, 0x21_u8, 0x22_u8, 0x5_u8, 0xc3_u8, 0xe3_u8, 0xdf_u8])
    def query_interface(this : IRTCPresenceContact*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCPresenceContact*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCPresenceContact*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PresentityURI(this : IRTCPresenceContact*, pbstrPresentityURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresentityURI.call(this, pbstrPresentityURI)
    end
    def put_PresentityURI(this : IRTCPresenceContact*, bstrPresentityURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PresentityURI.call(this, bstrPresentityURI)
    end
    def get_Name(this : IRTCPresenceContact*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IRTCPresenceContact*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Data(this : IRTCPresenceContact*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pbstrData)
    end
    def put_Data(this : IRTCPresenceContact*, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, bstrData)
    end
    def get_Persistent(this : IRTCPresenceContact*, pfPersistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Persistent.call(this, pfPersistent)
    end
    def put_Persistent(this : IRTCPresenceContact*, fPersistent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Persistent.call(this, fPersistent)
    end

  end

  @[Extern]
  record IRTCBuddyVtbl,
    query_interface : Proc(IRTCBuddy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCBuddy*, UInt32),
    release : Proc(IRTCBuddy*, UInt32),
    get_PresentityURI : Proc(IRTCBuddy*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PresentityURI : Proc(IRTCBuddy*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCBuddy*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IRTCBuddy*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IRTCBuddy*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IRTCBuddy*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Persistent : Proc(IRTCBuddy*, Int16*, Win32cr::Foundation::HRESULT),
    put_Persistent : Proc(IRTCBuddy*, Int16, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IRTCBuddy*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*, Win32cr::Foundation::HRESULT),
    get_Notes : Proc(IRTCBuddy*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCBuddy, lpVtbl : IRTCBuddyVtbl* do
    GUID = LibC::GUID.new(0xfcb136c8_u32, 0x7b90_u16, 0x4e0c_u16, StaticArray[0xbe_u8, 0xfe_u8, 0x56_u8, 0xed_u8, 0xf0_u8, 0xba_u8, 0x6f_u8, 0x1c_u8])
    def query_interface(this : IRTCBuddy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCBuddy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCBuddy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PresentityURI(this : IRTCBuddy*, pbstrPresentityURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresentityURI.call(this, pbstrPresentityURI)
    end
    def put_PresentityURI(this : IRTCBuddy*, bstrPresentityURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PresentityURI.call(this, bstrPresentityURI)
    end
    def get_Name(this : IRTCBuddy*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IRTCBuddy*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Data(this : IRTCBuddy*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pbstrData)
    end
    def put_Data(this : IRTCBuddy*, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, bstrData)
    end
    def get_Persistent(this : IRTCBuddy*, pfPersistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Persistent.call(this, pfPersistent)
    end
    def put_Persistent(this : IRTCBuddy*, fPersistent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Persistent.call(this, fPersistent)
    end
    def get_Status(this : IRTCBuddy*, penStatus : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, penStatus)
    end
    def get_Notes(this : IRTCBuddy*, pbstrNotes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Notes.call(this, pbstrNotes)
    end

  end

  @[Extern]
  record IRTCBuddy2Vtbl,
    query_interface : Proc(IRTCBuddy2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCBuddy2*, UInt32),
    release : Proc(IRTCBuddy2*, UInt32),
    get_PresentityURI : Proc(IRTCBuddy2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PresentityURI : Proc(IRTCBuddy2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCBuddy2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IRTCBuddy2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IRTCBuddy2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IRTCBuddy2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Persistent : Proc(IRTCBuddy2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Persistent : Proc(IRTCBuddy2*, Int16, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IRTCBuddy2*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*, Win32cr::Foundation::HRESULT),
    get_Notes : Proc(IRTCBuddy2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCBuddy2*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IRTCBuddy2*, Win32cr::Foundation::HRESULT),
    enumerate_groups : Proc(IRTCBuddy2*, Void**, Win32cr::Foundation::HRESULT),
    get_Groups : Proc(IRTCBuddy2*, Void**, Win32cr::Foundation::HRESULT),
    get_PresenceProperty : Proc(IRTCBuddy2*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    enumerate_presence_devices : Proc(IRTCBuddy2*, Void**, Win32cr::Foundation::HRESULT),
    get_PresenceDevices : Proc(IRTCBuddy2*, Void**, Win32cr::Foundation::HRESULT),
    get_SubscriptionType : Proc(IRTCBuddy2*, Win32cr::System::RealTimeCommunications::RTC_BUDDY_SUBSCRIPTION_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCBuddy2, lpVtbl : IRTCBuddy2Vtbl* do
    GUID = LibC::GUID.new(0x102f9588_u32, 0x23e7_u16, 0x40e3_u16, StaticArray[0x95_u8, 0x4d_u8, 0xcd_u8, 0x7a_u8, 0x1d_u8, 0x5c_u8, 0x3_u8, 0x61_u8])
    def query_interface(this : IRTCBuddy2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCBuddy2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCBuddy2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PresentityURI(this : IRTCBuddy2*, pbstrPresentityURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresentityURI.call(this, pbstrPresentityURI)
    end
    def put_PresentityURI(this : IRTCBuddy2*, bstrPresentityURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PresentityURI.call(this, bstrPresentityURI)
    end
    def get_Name(this : IRTCBuddy2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IRTCBuddy2*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Data(this : IRTCBuddy2*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pbstrData)
    end
    def put_Data(this : IRTCBuddy2*, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, bstrData)
    end
    def get_Persistent(this : IRTCBuddy2*, pfPersistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Persistent.call(this, pfPersistent)
    end
    def put_Persistent(this : IRTCBuddy2*, fPersistent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Persistent.call(this, fPersistent)
    end
    def get_Status(this : IRTCBuddy2*, penStatus : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, penStatus)
    end
    def get_Notes(this : IRTCBuddy2*, pbstrNotes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Notes.call(this, pbstrNotes)
    end
    def get_Profile(this : IRTCBuddy2*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def refresh(this : IRTCBuddy2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def enumerate_groups(this : IRTCBuddy2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_groups.call(this, ppEnum)
    end
    def get_Groups(this : IRTCBuddy2*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Groups.call(this, ppCollection)
    end
    def get_PresenceProperty(this : IRTCBuddy2*, enProperty : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, pbstrProperty : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresenceProperty.call(this, enProperty, pbstrProperty)
    end
    def enumerate_presence_devices(this : IRTCBuddy2*, ppEnumDevices : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_presence_devices.call(this, ppEnumDevices)
    end
    def get_PresenceDevices(this : IRTCBuddy2*, ppDevicesCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresenceDevices.call(this, ppDevicesCollection)
    end
    def get_SubscriptionType(this : IRTCBuddy2*, penSubscriptionType : Win32cr::System::RealTimeCommunications::RTC_BUDDY_SUBSCRIPTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubscriptionType.call(this, penSubscriptionType)
    end

  end

  @[Extern]
  record IRTCWatcherVtbl,
    query_interface : Proc(IRTCWatcher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCWatcher*, UInt32),
    release : Proc(IRTCWatcher*, UInt32),
    get_PresentityURI : Proc(IRTCWatcher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PresentityURI : Proc(IRTCWatcher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCWatcher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IRTCWatcher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IRTCWatcher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IRTCWatcher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Persistent : Proc(IRTCWatcher*, Int16*, Win32cr::Foundation::HRESULT),
    put_Persistent : Proc(IRTCWatcher*, Int16, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCWatcher*, Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE*, Win32cr::Foundation::HRESULT),
    put_State : Proc(IRTCWatcher*, Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCWatcher, lpVtbl : IRTCWatcherVtbl* do
    GUID = LibC::GUID.new(0xc7cedad8_u32, 0x346b_u16, 0x4d1b_u16, StaticArray[0xac_u8, 0x2_u8, 0xa2_u8, 0x8_u8, 0x8d_u8, 0xf9_u8, 0xbe_u8, 0x4f_u8])
    def query_interface(this : IRTCWatcher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCWatcher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCWatcher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PresentityURI(this : IRTCWatcher*, pbstrPresentityURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresentityURI.call(this, pbstrPresentityURI)
    end
    def put_PresentityURI(this : IRTCWatcher*, bstrPresentityURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PresentityURI.call(this, bstrPresentityURI)
    end
    def get_Name(this : IRTCWatcher*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IRTCWatcher*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Data(this : IRTCWatcher*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pbstrData)
    end
    def put_Data(this : IRTCWatcher*, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, bstrData)
    end
    def get_Persistent(this : IRTCWatcher*, pfPersistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Persistent.call(this, pfPersistent)
    end
    def put_Persistent(this : IRTCWatcher*, fPersistent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Persistent.call(this, fPersistent)
    end
    def get_State(this : IRTCWatcher*, penState : Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def put_State(this : IRTCWatcher*, enState : Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_State.call(this, enState)
    end

  end

  @[Extern]
  record IRTCWatcher2Vtbl,
    query_interface : Proc(IRTCWatcher2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCWatcher2*, UInt32),
    release : Proc(IRTCWatcher2*, UInt32),
    get_PresentityURI : Proc(IRTCWatcher2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PresentityURI : Proc(IRTCWatcher2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRTCWatcher2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IRTCWatcher2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IRTCWatcher2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IRTCWatcher2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Persistent : Proc(IRTCWatcher2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Persistent : Proc(IRTCWatcher2*, Int16, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRTCWatcher2*, Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE*, Win32cr::Foundation::HRESULT),
    put_State : Proc(IRTCWatcher2*, Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCWatcher2*, Void**, Win32cr::Foundation::HRESULT),
    get_Scope : Proc(IRTCWatcher2*, Win32cr::System::RealTimeCommunications::RTC_ACE_SCOPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCWatcher2, lpVtbl : IRTCWatcher2Vtbl* do
    GUID = LibC::GUID.new(0xd4d9967f_u32, 0xd011_u16, 0x4b1d_u16, StaticArray[0x91_u8, 0xe3_u8, 0xab_u8, 0xa7_u8, 0x8f_u8, 0x96_u8, 0x39_u8, 0x3d_u8])
    def query_interface(this : IRTCWatcher2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCWatcher2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCWatcher2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PresentityURI(this : IRTCWatcher2*, pbstrPresentityURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresentityURI.call(this, pbstrPresentityURI)
    end
    def put_PresentityURI(this : IRTCWatcher2*, bstrPresentityURI : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PresentityURI.call(this, bstrPresentityURI)
    end
    def get_Name(this : IRTCWatcher2*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IRTCWatcher2*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_Data(this : IRTCWatcher2*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pbstrData)
    end
    def put_Data(this : IRTCWatcher2*, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, bstrData)
    end
    def get_Persistent(this : IRTCWatcher2*, pfPersistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Persistent.call(this, pfPersistent)
    end
    def put_Persistent(this : IRTCWatcher2*, fPersistent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Persistent.call(this, fPersistent)
    end
    def get_State(this : IRTCWatcher2*, penState : Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, penState)
    end
    def put_State(this : IRTCWatcher2*, enState : Win32cr::System::RealTimeCommunications::RTC_WATCHER_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_State.call(this, enState)
    end
    def get_Profile(this : IRTCWatcher2*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_Scope(this : IRTCWatcher2*, penScope : Win32cr::System::RealTimeCommunications::RTC_ACE_SCOPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scope.call(this, penScope)
    end

  end

  @[Extern]
  record IRTCBuddyGroupVtbl,
    query_interface : Proc(IRTCBuddyGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCBuddyGroup*, UInt32),
    release : Proc(IRTCBuddyGroup*, UInt32),
    get_Name : Proc(IRTCBuddyGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IRTCBuddyGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_buddy : Proc(IRTCBuddyGroup*, Void*, Win32cr::Foundation::HRESULT),
    remove_buddy : Proc(IRTCBuddyGroup*, Void*, Win32cr::Foundation::HRESULT),
    enumerate_buddies : Proc(IRTCBuddyGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_Buddies : Proc(IRTCBuddyGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IRTCBuddyGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IRTCBuddyGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCBuddyGroup*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCBuddyGroup, lpVtbl : IRTCBuddyGroupVtbl* do
    GUID = LibC::GUID.new(0x60361e68_u32, 0x9164_u16, 0x4389_u16, StaticArray[0xa4_u8, 0xc6_u8, 0xd0_u8, 0xb3_u8, 0x92_u8, 0x5b_u8, 0xda_u8, 0x5e_u8])
    def query_interface(this : IRTCBuddyGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCBuddyGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCBuddyGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Name(this : IRTCBuddyGroup*, pbstrGroupName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrGroupName)
    end
    def put_Name(this : IRTCBuddyGroup*, bstrGroupName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrGroupName)
    end
    def add_buddy(this : IRTCBuddyGroup*, pBuddy : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_buddy.call(this, pBuddy)
    end
    def remove_buddy(this : IRTCBuddyGroup*, pBuddy : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_buddy.call(this, pBuddy)
    end
    def enumerate_buddies(this : IRTCBuddyGroup*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_buddies.call(this, ppEnum)
    end
    def get_Buddies(this : IRTCBuddyGroup*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buddies.call(this, ppCollection)
    end
    def get_Data(this : IRTCBuddyGroup*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pbstrData)
    end
    def put_Data(this : IRTCBuddyGroup*, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, bstrData)
    end
    def get_Profile(this : IRTCBuddyGroup*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end

  end

  @[Extern]
  record IRTCEventNotificationVtbl,
    query_interface : Proc(IRTCEventNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEventNotification*, UInt32),
    release : Proc(IRTCEventNotification*, UInt32),
    event : Proc(IRTCEventNotification*, Win32cr::System::RealTimeCommunications::RTC_EVENT, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEventNotification, lpVtbl : IRTCEventNotificationVtbl* do
    GUID = LibC::GUID.new(0x13fa24c7_u32, 0x5748_u16, 0x4b21_u16, StaticArray[0x91_u8, 0xf5_u8, 0x73_u8, 0x97_u8, 0x60_u8, 0x9c_u8, 0xe7_u8, 0x47_u8])
    def query_interface(this : IRTCEventNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEventNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEventNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def event(this : IRTCEventNotification*, rtc_event : Win32cr::System::RealTimeCommunications::RTC_EVENT, pEvent : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event.call(this, rtc_event, pEvent)
    end

  end

  @[Extern]
  record IRTCPortManagerVtbl,
    query_interface : Proc(IRTCPortManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCPortManager*, UInt32),
    release : Proc(IRTCPortManager*, UInt32),
    get_mapping : Proc(IRTCPortManager*, Win32cr::Foundation::BSTR, Win32cr::System::RealTimeCommunications::RTC_PORT_TYPE, Win32cr::Foundation::BSTR*, Int32*, Win32cr::Foundation::BSTR*, Int32*, Win32cr::Foundation::HRESULT),
    update_remote_address : Proc(IRTCPortManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    release_mapping : Proc(IRTCPortManager*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCPortManager, lpVtbl : IRTCPortManagerVtbl* do
    GUID = LibC::GUID.new(0xda77c14b_u32, 0x6208_u16, 0x43ca_u16, StaticArray[0x8d_u8, 0xdf_u8, 0x5b_u8, 0x60_u8, 0xa0_u8, 0xa6_u8, 0x9f_u8, 0xac_u8])
    def query_interface(this : IRTCPortManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCPortManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCPortManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_mapping(this : IRTCPortManager*, bstrRemoteAddress : Win32cr::Foundation::BSTR, enPortType : Win32cr::System::RealTimeCommunications::RTC_PORT_TYPE, pbstrInternalLocalAddress : Win32cr::Foundation::BSTR*, plInternalLocalPort : Int32*, pbstrExternalLocalAddress : Win32cr::Foundation::BSTR*, plExternalLocalPort : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mapping.call(this, bstrRemoteAddress, enPortType, pbstrInternalLocalAddress, plInternalLocalPort, pbstrExternalLocalAddress, plExternalLocalPort)
    end
    def update_remote_address(this : IRTCPortManager*, bstrRemoteAddress : Win32cr::Foundation::BSTR, bstrInternalLocalAddress : Win32cr::Foundation::BSTR, lInternalLocalPort : Int32, bstrExternalLocalAddress : Win32cr::Foundation::BSTR, lExternalLocalPort : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_remote_address.call(this, bstrRemoteAddress, bstrInternalLocalAddress, lInternalLocalPort, bstrExternalLocalAddress, lExternalLocalPort)
    end
    def release_mapping(this : IRTCPortManager*, bstrInternalLocalAddress : Win32cr::Foundation::BSTR, lInternalLocalPort : Int32, bstrExternalLocalAddress : Win32cr::Foundation::BSTR, lExternalLocalAddress : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_mapping.call(this, bstrInternalLocalAddress, lInternalLocalPort, bstrExternalLocalAddress, lExternalLocalAddress)
    end

  end

  @[Extern]
  record IRTCSessionPortManagementVtbl,
    query_interface : Proc(IRTCSessionPortManagement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionPortManagement*, UInt32),
    release : Proc(IRTCSessionPortManagement*, UInt32),
    set_port_manager : Proc(IRTCSessionPortManagement*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionPortManagement, lpVtbl : IRTCSessionPortManagementVtbl* do
    GUID = LibC::GUID.new(0xa072f1d6_u32, 0x286_u16, 0x4e1f_u16, StaticArray[0x85_u8, 0xf2_u8, 0x17_u8, 0xa2_u8, 0x94_u8, 0x84_u8, 0x56_u8, 0xec_u8])
    def query_interface(this : IRTCSessionPortManagement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionPortManagement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionPortManagement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_port_manager(this : IRTCSessionPortManagement*, pPortManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_port_manager.call(this, pPortManager)
    end

  end

  @[Extern]
  record IRTCClientPortManagementVtbl,
    query_interface : Proc(IRTCClientPortManagement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCClientPortManagement*, UInt32),
    release : Proc(IRTCClientPortManagement*, UInt32),
    start_listen_address_and_port : Proc(IRTCClientPortManagement*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    stop_listen_address_and_port : Proc(IRTCClientPortManagement*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    get_port_range : Proc(IRTCClientPortManagement*, Win32cr::System::RealTimeCommunications::RTC_PORT_TYPE, Int32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCClientPortManagement, lpVtbl : IRTCClientPortManagementVtbl* do
    GUID = LibC::GUID.new(0xd5df3f03_u32, 0x4bde_u16, 0x4417_u16, StaticArray[0xae_u8, 0xfe_u8, 0x71_u8, 0x17_u8, 0x7b_u8, 0xda_u8, 0xea_u8, 0x66_u8])
    def query_interface(this : IRTCClientPortManagement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCClientPortManagement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCClientPortManagement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_listen_address_and_port(this : IRTCClientPortManagement*, bstrInternalLocalAddress : Win32cr::Foundation::BSTR, lInternalLocalPort : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_listen_address_and_port.call(this, bstrInternalLocalAddress, lInternalLocalPort)
    end
    def stop_listen_address_and_port(this : IRTCClientPortManagement*, bstrInternalLocalAddress : Win32cr::Foundation::BSTR, lInternalLocalPort : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_listen_address_and_port.call(this, bstrInternalLocalAddress, lInternalLocalPort)
    end
    def get_port_range(this : IRTCClientPortManagement*, enPortType : Win32cr::System::RealTimeCommunications::RTC_PORT_TYPE, plMinValue : Int32*, plMaxValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port_range.call(this, enPortType, plMinValue, plMaxValue)
    end

  end

  @[Extern]
  record IRTCUserSearchVtbl,
    query_interface : Proc(IRTCUserSearch*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCUserSearch*, UInt32),
    release : Proc(IRTCUserSearch*, UInt32),
    create_query : Proc(IRTCUserSearch*, Void**, Win32cr::Foundation::HRESULT),
    execute_search : Proc(IRTCUserSearch*, Void*, Void*, LibC::IntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCUserSearch, lpVtbl : IRTCUserSearchVtbl* do
    GUID = LibC::GUID.new(0xb619882b_u32, 0x860c_u16, 0x4db4_u16, StaticArray[0xbe_u8, 0x1b_u8, 0x69_u8, 0x3b_u8, 0x65_u8, 0x5_u8, 0xbb_u8, 0xe5_u8])
    def query_interface(this : IRTCUserSearch*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCUserSearch*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCUserSearch*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_query(this : IRTCUserSearch*, ppQuery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query.call(this, ppQuery)
    end
    def execute_search(this : IRTCUserSearch*, pQuery : Void*, pProfile : Void*, lCookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_search.call(this, pQuery, pProfile, lCookie)
    end

  end

  @[Extern]
  record IRTCUserSearchQueryVtbl,
    query_interface : Proc(IRTCUserSearchQuery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCUserSearchQuery*, UInt32),
    release : Proc(IRTCUserSearchQuery*, UInt32),
    put_SearchTerm : Proc(IRTCUserSearchQuery*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SearchTerm : Proc(IRTCUserSearchQuery*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SearchTerms : Proc(IRTCUserSearchQuery*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SearchPreference : Proc(IRTCUserSearchQuery*, Win32cr::System::RealTimeCommunications::RTC_USER_SEARCH_PREFERENCE, Int32, Win32cr::Foundation::HRESULT),
    get_SearchPreference : Proc(IRTCUserSearchQuery*, Win32cr::System::RealTimeCommunications::RTC_USER_SEARCH_PREFERENCE, Int32*, Win32cr::Foundation::HRESULT),
    put_SearchDomain : Proc(IRTCUserSearchQuery*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SearchDomain : Proc(IRTCUserSearchQuery*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCUserSearchQuery, lpVtbl : IRTCUserSearchQueryVtbl* do
    GUID = LibC::GUID.new(0x288300f5_u32, 0xd23a_u16, 0x4365_u16, StaticArray[0x9a_u8, 0x73_u8, 0x99_u8, 0x85_u8, 0xc9_u8, 0x8c_u8, 0x28_u8, 0x81_u8])
    def query_interface(this : IRTCUserSearchQuery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCUserSearchQuery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCUserSearchQuery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def put_SearchTerm(this : IRTCUserSearchQuery*, bstrName : Win32cr::Foundation::BSTR, bstrValue : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SearchTerm.call(this, bstrName, bstrValue)
    end
    def get_SearchTerm(this : IRTCUserSearchQuery*, bstrName : Win32cr::Foundation::BSTR, pbstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchTerm.call(this, bstrName, pbstrValue)
    end
    def get_SearchTerms(this : IRTCUserSearchQuery*, pbstrNames : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchTerms.call(this, pbstrNames)
    end
    def put_SearchPreference(this : IRTCUserSearchQuery*, enPreference : Win32cr::System::RealTimeCommunications::RTC_USER_SEARCH_PREFERENCE, lValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SearchPreference.call(this, enPreference, lValue)
    end
    def get_SearchPreference(this : IRTCUserSearchQuery*, enPreference : Win32cr::System::RealTimeCommunications::RTC_USER_SEARCH_PREFERENCE, plValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPreference.call(this, enPreference, plValue)
    end
    def put_SearchDomain(this : IRTCUserSearchQuery*, bstrDomain : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SearchDomain.call(this, bstrDomain)
    end
    def get_SearchDomain(this : IRTCUserSearchQuery*, pbstrDomain : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchDomain.call(this, pbstrDomain)
    end

  end

  @[Extern]
  record IRTCUserSearchResultVtbl,
    query_interface : Proc(IRTCUserSearchResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCUserSearchResult*, UInt32),
    release : Proc(IRTCUserSearchResult*, UInt32),
    get_Value : Proc(IRTCUserSearchResult*, Win32cr::System::RealTimeCommunications::RTC_USER_SEARCH_COLUMN, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCUserSearchResult, lpVtbl : IRTCUserSearchResultVtbl* do
    GUID = LibC::GUID.new(0x851278b2_u32, 0x9592_u16, 0x480f_u16, StaticArray[0x8d_u8, 0xb5_u8, 0x2d_u8, 0xe8_u8, 0x6b_u8, 0x26_u8, 0xb5_u8, 0x4d_u8])
    def query_interface(this : IRTCUserSearchResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCUserSearchResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCUserSearchResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Value(this : IRTCUserSearchResult*, enColumn : Win32cr::System::RealTimeCommunications::RTC_USER_SEARCH_COLUMN, pbstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, enColumn, pbstrValue)
    end

  end

  @[Extern]
  record IRTCEnumUserSearchResultsVtbl,
    query_interface : Proc(IRTCEnumUserSearchResults*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEnumUserSearchResults*, UInt32),
    release : Proc(IRTCEnumUserSearchResults*, UInt32),
    next__ : Proc(IRTCEnumUserSearchResults*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRTCEnumUserSearchResults*, Win32cr::Foundation::HRESULT),
    skip : Proc(IRTCEnumUserSearchResults*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IRTCEnumUserSearchResults*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEnumUserSearchResults, lpVtbl : IRTCEnumUserSearchResultsVtbl* do
    GUID = LibC::GUID.new(0x83d4d877_u32, 0xaa5d_u16, 0x4a5b_u16, StaticArray[0x8d_u8, 0xe_u8, 0x0_u8, 0x2a_u8, 0x80_u8, 0x67_u8, 0xe0_u8, 0xe8_u8])
    def query_interface(this : IRTCEnumUserSearchResults*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEnumUserSearchResults*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEnumUserSearchResults*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IRTCEnumUserSearchResults*, celt : UInt32, ppElements : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppElements, pceltFetched)
    end
    def reset(this : IRTCEnumUserSearchResults*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IRTCEnumUserSearchResults*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def clone(this : IRTCEnumUserSearchResults*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRTCUserSearchResultsEventVtbl,
    query_interface : Proc(IRTCUserSearchResultsEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCUserSearchResultsEvent*, UInt32),
    release : Proc(IRTCUserSearchResultsEvent*, UInt32),
    get_type_info_count : Proc(IRTCUserSearchResultsEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCUserSearchResultsEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCUserSearchResultsEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCUserSearchResultsEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    enumerate_results : Proc(IRTCUserSearchResultsEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Results : Proc(IRTCUserSearchResultsEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(IRTCUserSearchResultsEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Query : Proc(IRTCUserSearchResultsEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_Cookie : Proc(IRTCUserSearchResultsEvent*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCUserSearchResultsEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_MoreAvailable : Proc(IRTCUserSearchResultsEvent*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCUserSearchResultsEvent, lpVtbl : IRTCUserSearchResultsEventVtbl* do
    GUID = LibC::GUID.new(0xd8c8c3cd_u32, 0x7fac_u16, 0x4088_u16, StaticArray[0x81_u8, 0xc5_u8, 0xc2_u8, 0x4c_u8, 0xbc_u8, 0x9_u8, 0x38_u8, 0xe3_u8])
    def query_interface(this : IRTCUserSearchResultsEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCUserSearchResultsEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCUserSearchResultsEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCUserSearchResultsEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCUserSearchResultsEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCUserSearchResultsEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCUserSearchResultsEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def enumerate_results(this : IRTCUserSearchResultsEvent*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_results.call(this, ppEnum)
    end
    def get_Results(this : IRTCUserSearchResultsEvent*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Results.call(this, ppCollection)
    end
    def get_Profile(this : IRTCUserSearchResultsEvent*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, ppProfile)
    end
    def get_Query(this : IRTCUserSearchResultsEvent*, ppQuery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Query.call(this, ppQuery)
    end
    def get_Cookie(this : IRTCUserSearchResultsEvent*, plCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cookie.call(this, plCookie)
    end
    def get_StatusCode(this : IRTCUserSearchResultsEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_MoreAvailable(this : IRTCUserSearchResultsEvent*, pfMoreAvailable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreAvailable.call(this, pfMoreAvailable)
    end

  end

  @[Extern]
  record IRTCSessionReferStatusEventVtbl,
    query_interface : Proc(IRTCSessionReferStatusEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionReferStatusEvent*, UInt32),
    release : Proc(IRTCSessionReferStatusEvent*, UInt32),
    get_type_info_count : Proc(IRTCSessionReferStatusEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCSessionReferStatusEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCSessionReferStatusEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCSessionReferStatusEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCSessionReferStatusEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_ReferStatus : Proc(IRTCSessionReferStatusEvent*, Win32cr::System::RealTimeCommunications::RTC_SESSION_REFER_STATUS*, Win32cr::Foundation::HRESULT),
    get_StatusCode : Proc(IRTCSessionReferStatusEvent*, Int32*, Win32cr::Foundation::HRESULT),
    get_StatusText : Proc(IRTCSessionReferStatusEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionReferStatusEvent, lpVtbl : IRTCSessionReferStatusEventVtbl* do
    GUID = LibC::GUID.new(0x3d8fc2cd_u32, 0x5d76_u16, 0x44ab_u16, StaticArray[0xbb_u8, 0x68_u8, 0x2a_u8, 0x80_u8, 0x35_u8, 0x3b_u8, 0x34_u8, 0xa2_u8])
    def query_interface(this : IRTCSessionReferStatusEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionReferStatusEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionReferStatusEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCSessionReferStatusEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCSessionReferStatusEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCSessionReferStatusEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCSessionReferStatusEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCSessionReferStatusEvent*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_ReferStatus(this : IRTCSessionReferStatusEvent*, penReferStatus : Win32cr::System::RealTimeCommunications::RTC_SESSION_REFER_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReferStatus.call(this, penReferStatus)
    end
    def get_StatusCode(this : IRTCSessionReferStatusEvent*, plStatusCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusCode.call(this, plStatusCode)
    end
    def get_StatusText(this : IRTCSessionReferStatusEvent*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StatusText.call(this, pbstrStatusText)
    end

  end

  @[Extern]
  record IRTCSessionReferredEventVtbl,
    query_interface : Proc(IRTCSessionReferredEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionReferredEvent*, UInt32),
    release : Proc(IRTCSessionReferredEvent*, UInt32),
    get_type_info_count : Proc(IRTCSessionReferredEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCSessionReferredEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCSessionReferredEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCSessionReferredEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Session : Proc(IRTCSessionReferredEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_ReferredByURI : Proc(IRTCSessionReferredEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ReferToURI : Proc(IRTCSessionReferredEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ReferCookie : Proc(IRTCSessionReferredEvent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    accept : Proc(IRTCSessionReferredEvent*, Win32cr::Foundation::HRESULT),
    reject : Proc(IRTCSessionReferredEvent*, Win32cr::Foundation::HRESULT),
    set_referred_session_state : Proc(IRTCSessionReferredEvent*, Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionReferredEvent, lpVtbl : IRTCSessionReferredEventVtbl* do
    GUID = LibC::GUID.new(0x176a6828_u32, 0x4fcc_u16, 0x4f28_u16, StaticArray[0xa8_u8, 0x62_u8, 0x4_u8, 0x59_u8, 0x7a_u8, 0x6c_u8, 0xf1_u8, 0xc4_u8])
    def query_interface(this : IRTCSessionReferredEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionReferredEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionReferredEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCSessionReferredEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCSessionReferredEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCSessionReferredEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCSessionReferredEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Session(this : IRTCSessionReferredEvent*, ppSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Session.call(this, ppSession)
    end
    def get_ReferredByURI(this : IRTCSessionReferredEvent*, pbstrReferredByURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReferredByURI.call(this, pbstrReferredByURI)
    end
    def get_ReferToURI(this : IRTCSessionReferredEvent*, pbstrReferoURI : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReferToURI.call(this, pbstrReferoURI)
    end
    def get_ReferCookie(this : IRTCSessionReferredEvent*, pbstrReferCookie : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReferCookie.call(this, pbstrReferCookie)
    end
    def accept(this : IRTCSessionReferredEvent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept.call(this)
    end
    def reject(this : IRTCSessionReferredEvent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reject.call(this)
    end
    def set_referred_session_state(this : IRTCSessionReferredEvent*, enState : Win32cr::System::RealTimeCommunications::RTC_SESSION_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_referred_session_state.call(this, enState)
    end

  end

  @[Extern]
  record IRTCSessionDescriptionManagerVtbl,
    query_interface : Proc(IRTCSessionDescriptionManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCSessionDescriptionManager*, UInt32),
    release : Proc(IRTCSessionDescriptionManager*, UInt32),
    evaluate_session_description : Proc(IRTCSessionDescriptionManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCSessionDescriptionManager, lpVtbl : IRTCSessionDescriptionManagerVtbl* do
    GUID = LibC::GUID.new(0xba7f518e_u32, 0xd336_u16, 0x4070_u16, StaticArray[0x93_u8, 0xa6_u8, 0x86_u8, 0x53_u8, 0x95_u8, 0xc8_u8, 0x43_u8, 0xf9_u8])
    def query_interface(this : IRTCSessionDescriptionManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCSessionDescriptionManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCSessionDescriptionManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def evaluate_session_description(this : IRTCSessionDescriptionManager*, bstrContentType : Win32cr::Foundation::BSTR, bstrSessionDescription : Win32cr::Foundation::BSTR, pfApplicationSession : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.evaluate_session_description.call(this, bstrContentType, bstrSessionDescription, pfApplicationSession)
    end

  end

  @[Extern]
  record IRTCEnumPresenceDevicesVtbl,
    query_interface : Proc(IRTCEnumPresenceDevices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCEnumPresenceDevices*, UInt32),
    release : Proc(IRTCEnumPresenceDevices*, UInt32),
    next__ : Proc(IRTCEnumPresenceDevices*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRTCEnumPresenceDevices*, Win32cr::Foundation::HRESULT),
    skip : Proc(IRTCEnumPresenceDevices*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IRTCEnumPresenceDevices*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCEnumPresenceDevices, lpVtbl : IRTCEnumPresenceDevicesVtbl* do
    GUID = LibC::GUID.new(0x708c2ab7_u32, 0x8bf8_u16, 0x42f8_u16, StaticArray[0x8c_u8, 0x7d_u8, 0x63_u8, 0x51_u8, 0x97_u8, 0xad_u8, 0x55_u8, 0x39_u8])
    def query_interface(this : IRTCEnumPresenceDevices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCEnumPresenceDevices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCEnumPresenceDevices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IRTCEnumPresenceDevices*, celt : UInt32, ppElements : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppElements, pceltFetched)
    end
    def reset(this : IRTCEnumPresenceDevices*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IRTCEnumPresenceDevices*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def clone(this : IRTCEnumPresenceDevices*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRTCPresenceDeviceVtbl,
    query_interface : Proc(IRTCPresenceDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCPresenceDevice*, UInt32),
    release : Proc(IRTCPresenceDevice*, UInt32),
    get_Status : Proc(IRTCPresenceDevice*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*, Win32cr::Foundation::HRESULT),
    get_Notes : Proc(IRTCPresenceDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PresenceProperty : Proc(IRTCPresenceDevice*, Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_presence_data : Proc(IRTCPresenceDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCPresenceDevice, lpVtbl : IRTCPresenceDeviceVtbl* do
    GUID = LibC::GUID.new(0xbc6a90dd_u32, 0xad9a_u16, 0x48da_u16, StaticArray[0x9b_u8, 0xc_u8, 0x25_u8, 0x15_u8, 0xe3_u8, 0x85_u8, 0x21_u8, 0xad_u8])
    def query_interface(this : IRTCPresenceDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCPresenceDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCPresenceDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Status(this : IRTCPresenceDevice*, penStatus : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, penStatus)
    end
    def get_Notes(this : IRTCPresenceDevice*, pbstrNotes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Notes.call(this, pbstrNotes)
    end
    def get_PresenceProperty(this : IRTCPresenceDevice*, enProperty : Win32cr::System::RealTimeCommunications::RTC_PRESENCE_PROPERTY, pbstrProperty : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresenceProperty.call(this, enProperty, pbstrProperty)
    end
    def get_presence_data(this : IRTCPresenceDevice*, pbstrNamespace : Win32cr::Foundation::BSTR*, pbstrData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_presence_data.call(this, pbstrNamespace, pbstrData)
    end

  end

  @[Extern]
  record IRTCDispatchEventNotificationVtbl,
    query_interface : Proc(IRTCDispatchEventNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRTCDispatchEventNotification*, UInt32),
    release : Proc(IRTCDispatchEventNotification*, UInt32),
    get_type_info_count : Proc(IRTCDispatchEventNotification*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRTCDispatchEventNotification*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRTCDispatchEventNotification*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRTCDispatchEventNotification*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRTCDispatchEventNotification, lpVtbl : IRTCDispatchEventNotificationVtbl* do
    GUID = LibC::GUID.new(0x176ddfbe_u32, 0xfec0_u16, 0x4d55_u16, StaticArray[0xbc_u8, 0x87_u8, 0x84_u8, 0xcf_u8, 0xf1_u8, 0xef_u8, 0x7f_u8, 0x91_u8])
    def query_interface(this : IRTCDispatchEventNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRTCDispatchEventNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRTCDispatchEventNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRTCDispatchEventNotification*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRTCDispatchEventNotification*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRTCDispatchEventNotification*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRTCDispatchEventNotification*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ITransportSettingsInternalVtbl,
    query_interface : Proc(ITransportSettingsInternal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransportSettingsInternal*, UInt32),
    release : Proc(ITransportSettingsInternal*, UInt32),
    apply_setting : Proc(ITransportSettingsInternal*, Win32cr::System::RealTimeCommunications::TRANSPORT_SETTING*, Win32cr::Foundation::HRESULT),
    query_setting : Proc(ITransportSettingsInternal*, Win32cr::System::RealTimeCommunications::TRANSPORT_SETTING*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITransportSettingsInternal, lpVtbl : ITransportSettingsInternalVtbl* do
    GUID = LibC::GUID.new(0x5123e076_u32, 0x29e3_u16, 0x4bfd_u16, StaticArray[0x84_u8, 0xfe_u8, 0x1_u8, 0x92_u8, 0xd4_u8, 0x11_u8, 0xe3_u8, 0xe8_u8])
    def query_interface(this : ITransportSettingsInternal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransportSettingsInternal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransportSettingsInternal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def apply_setting(this : ITransportSettingsInternal*, setting : Win32cr::System::RealTimeCommunications::TRANSPORT_SETTING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_setting.call(this, setting)
    end
    def query_setting(this : ITransportSettingsInternal*, setting : Win32cr::System::RealTimeCommunications::TRANSPORT_SETTING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_setting.call(this, setting)
    end

  end

  @[Extern]
  record INetworkTransportSettingsVtbl,
    query_interface : Proc(INetworkTransportSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkTransportSettings*, UInt32),
    release : Proc(INetworkTransportSettings*, UInt32),
    apply_setting : Proc(INetworkTransportSettings*, Win32cr::Networking::WinSock::TRANSPORT_SETTING_ID*, UInt32, UInt8*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT),
    query_setting : Proc(INetworkTransportSettings*, Win32cr::Networking::WinSock::TRANSPORT_SETTING_ID*, UInt32, UInt8*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkTransportSettings, lpVtbl : INetworkTransportSettingsVtbl* do
    GUID = LibC::GUID.new(0x5e7abb2c_u32, 0xf2c1_u16, 0x4a61_u16, StaticArray[0xbd_u8, 0x35_u8, 0xde_u8, 0xb7_u8, 0xa0_u8, 0x8a_u8, 0xb0_u8, 0xf1_u8])
    def query_interface(this : INetworkTransportSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkTransportSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkTransportSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def apply_setting(this : INetworkTransportSettings*, setting_id : Win32cr::Networking::WinSock::TRANSPORT_SETTING_ID*, length_in : UInt32, value_in : UInt8*, length_out : UInt32*, value_out : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_setting.call(this, setting_id, length_in, value_in, length_out, value_out)
    end
    def query_setting(this : INetworkTransportSettings*, setting_id : Win32cr::Networking::WinSock::TRANSPORT_SETTING_ID*, length_in : UInt32, value_in : UInt8*, length_out : UInt32*, value_out : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_setting.call(this, setting_id, length_in, value_in, length_out, value_out)
    end

  end

  @[Extern]
  record INotificationTransportSyncVtbl,
    query_interface : Proc(INotificationTransportSync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INotificationTransportSync*, UInt32),
    release : Proc(INotificationTransportSync*, UInt32),
    complete_delivery : Proc(INotificationTransportSync*, Win32cr::Foundation::HRESULT),
    flush : Proc(INotificationTransportSync*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INotificationTransportSync, lpVtbl : INotificationTransportSyncVtbl* do
    GUID = LibC::GUID.new(0x79eb1402_u32, 0xab8_u16, 0x49c0_u16, StaticArray[0x9e_u8, 0x14_u8, 0xa1_u8, 0xae_u8, 0x4b_u8, 0xa9_u8, 0x30_u8, 0x58_u8])
    def query_interface(this : INotificationTransportSync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INotificationTransportSync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INotificationTransportSync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def complete_delivery(this : INotificationTransportSync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_delivery.call(this)
    end
    def flush(this : INotificationTransportSync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end

  end

end